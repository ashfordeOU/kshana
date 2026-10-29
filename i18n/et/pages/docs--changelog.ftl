# docs--changelog: translations (et)

# text
seg-9a2a5f0a8a02 = Päikesesüsteem

# text
seg-20db2c79b998 = Kontrollitud

# text
seg-a20b4a6e8f53 = kiibimõõtmetes aatomkell

# text
seg-49a994d77d2f = temperatuurikompenseeritud kristallostsillaator

# text
seg-2247a2344710 = Tähendus

# text
seg-5770537524d3 = Valdkond

# text
# c1: CHANGELOG.md
seg-40d4fc0d3922 = Allikas: <c1/>

# text
seg-7333b85d448f = Kõik Kshana märkimisväärsed muudatused on dokumenteeritud siin.

# text
seg-bbc8f38627f1 = Vorming põhineb dokumendil <a1>Keep a Changelog</a1> ja see projekt järgib <a2>Semantic Versioning</a2>-it. Kuni projekt on versioonist 1.0 eelses etapis, võib avalik stsenaariumi/tulemuse skeem veel muutuda; tagasiühildumatud muudatused tuuakse selgelt välja.

# text
seg-985f7b4c001a = Avaldamata

# text
seg-a2f583aadd0b = Uusi funktsioone pole: üks käsurea parandus, sõltuvuste uuendused ristvalideerimise tööriistades ja dokumentatsioon. Mootori tulemused on versiooniga { "0.38.0" } võrreldes muutumatud.

# text
seg-c9a8a5898ced = Parandatud

# text
# c1: kshana kinds | head
# c2: yes | head
# c3: tests/cli_closed_pipe.rs
seg-3cc8ba4d1be6 = Käsurea väljub vaikselt olekuga { "141" }, kui selle standardväljund sulgub (<c1/>), selle asemel et kukkuda veateatega „failed printing to stdout: Broken pipe“. { "141" } on { "128" } pluss SIGPIPE, olek, mida shell teatab käsu <c2/> korral. Käsitletakse ainult suletud toru: täis ketas või mis tahes muu kirjutusviga teatab endiselt endast ja suletud pesasse kirjutav elav voog saab endiselt oma kirjutusvea. <c3/> sulgeb lugeja enne programmi käivitamist, nii et esimene kirjutamine ebaõnnestub igal käitusel.

# text
# c1: xval/
seg-2a47e785cc1d = Sõltuvuste uuendused ristvalideerimise tööriistades (<c1/>); ühtki levitatud krati, wheel-i ega paketi muudatust pole.

# text
# c1: memmap2
# c2: xval/anise-lunar-od
# c3: xval/anise-mars-od
# c4: kshana
seg-9df898fb24be = <c1/> { "0.9.10" } versioonile { "0.9.11" } (RUSTSEC-2026-0186) ANISE ristkontrolli lukkudes (<c2/>, <c3/>); lukud sünkroniseerivad uuesti ka hoidlasisese <c4/> tee sõltuvuse.

# text
# c1: pillow
# c2: certifi
# c3: xval/oracles/requirements.lock
# c4: requirements.frozen.txt
seg-835e9d6058f8 = <c1/> { "12.3.0" } versioonile { "13.0.0" } ning <c2/> { "2026.7.22" } versioonile { "2026.10.19" } sõltumatu etaloni keskkonna fikseeringutes (<c3/>, <c4/>): parandatud väljaanded kaheksa pillow nõuande ja ühe certifi nõuande jaoks.

# text
# c1: docs/BENCH.md
# c2: xval/bench/RESULTS-v2.md
# c3: agc_k_sigma
seg-902fc421a851 = <c1/>, README ja see fail loetlevad iga kshana-bench läve, mis on NOT MET, nagu on kirjas dokumendis <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } võrreldes vähemalt { "0.80" }-ga testjaotusel), <b>D1</b> (suurim vahe { "0.0301" }) ja <b>ülesande (b) R1</b> (üle võetud, mitte uuesti käitatud). Ühtki lävendit ei lõdvendata.

# text
# c1: docs/kinds/by-kind/
# c2: docs/KINDS.md
# c3: docs/COMMANDS.md
# c4: docs/ALL-SURFACES.md
# c5: docs/CAPABILITY-DOMAINS.md
# c6: tools/gen_kinds_index.py
# c7: tools/gen_readme_blocks.py
# c8: tools/gen_figures_038.py
# c9: tools/readme_audit.py
# c10: tests/readme_completeness_doc_sync.rs
seg-44d9c9622c24 = README täielikkuse läbivaatus: sisukord; perekondade alla paigutatud stsenaariumi liigid, igaühel leht asukohas <c1/> (mootori kirjeldus ja väljad, näidiskäituse sisendid ja tulemused, registrireadid ja sõltumatud etalonid, käituse aruande esitatud piirangud ning mootori kirjutatud diagramm), perekonna kohta üks kontaktleht, kõik indekseeritud failis <c2/>; iga käsk failis <c3/>; iga pind, pistikprogrammi käsk, oskus ja Studio leht failis <c4/>; iga võimekuse valdkond failis <c5/>; lisatud Mermaidi diagrammid (süsteemi ülevaade, pinnad, sisemine tsükkel, vastuvõtja usaldus, labori edasi-tagasi tsükkel, Studio, testi- ja väljalaskevoog, moodulikaart, levitamine). Kirjutanud <c6/>, <c7/> ja <c8/>; auditeerinud <c9/>; valvab <c10/>, mis kinnitab ka iga kirje kirjelduse ja väljad mootori külge.

# text
# c1: tools/render-diagram-chromium.sh
seg-b953186d5726 = <c1/>: renderdab Mermaidi diagrammi SVG-ks ja PNG-ks Linuxil ning uuendab renderduskirjet.

# text
# c1: docs/
# c2: ../../docs/JAMMERTEST.md
seg-68e19f94faed = README: kosmosekasutaja ja Kuu joonised kasutasid teid, mis olid suhtelised asukoha <c1/> suhtes, seega need ei laadinud README-st; üks link osutas asukohale <c2/>.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: sweep-clock-stability.svg
# c3: docs/KINDS.md
seg-850e1574e2d6 = Eemaldati kaks aegunud käsitsi kopeeritud diagrammifaili (<c1/>, <c2/>), mida ükski leht ei kasutanud ja mis ei vastanud enam mootorile; <c3/> kannab praeguseid diagramme.

# text
seg-033d52126d8a = Lisatud

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-090bf5ae96b6 = <b>GNSS väljaspool konstellatsiooni (<c1/>).</b> Uus stsenaariumi liik kosmoseaparaatidele GNSS-i orbiitide kohal, ümber ja taga (<a1><c2/></a1>): ühe ja nelja signaali kättesaadavus, katkestuste kestused, C/N0, DOP ning peamaksimumi ja külgmaksimumi lülid GPS-i, GLONASS-i, Galileo, BDS-i, QZSS-i ja NavIC-i jaoks kihil või piki LEO, MEO, GEO, HEO ja Kuule suunduvaid trajektoore; brošüüri-, parameetrilised või kasutaja antud saatemustrid; limbikiire ionosfääri, plasmasfääri ja atmosfääri mudel; nõrga signaali vastuvõtja projekt; pardal olev GNSS-i laiendatud Kalmani filter HEO ja Kuule suunduva trajektoori jaoks; ning moodustise suhteline navigatsioon. Võrreldud ICG kosmoseteenuse mahu brošüüriga enne käitust tehtud eelregistreeringu alusel: minimaalse kiirgusvõimsuse konstandid ja Kuu lävi nõustuvad, teised läved ei ole eelregistreeritud lugemise järgi täidetud (peaaegu kõik brošüüri ebajärjekindla GLONASS-i kiirenurga tõttu) ja parameetriline külgmaksimumi asendaja ei reprodutseeri mõõdetud GPS-i paneelimustreid. Kõik jääb MODELLED (<a2><c3/></a2>).

# text
# c1: lunar-infrastructure
# c2: study
# c3: docs/LUNAR-INFRASTRUCTURE.md
# c4: xval/lunar-infra/PREREGISTRATION.md
# c5: xval/lunar-infra/RESULTS.md
seg-3281ef6e21eb = <b>Kuu orbiit ja pind navigatsiooni- ja geodeesiataristuna (<c1/>).</b> Uus stsenaariumi liik viie uuringuga, mida valib <c2/> (<a1><c3/></a1>): pardal oleva Maa-GNSS orbiidi määramise kooskõla peaaegu sirgjoonelises halo-orbiidis sõltumatu maapealse kauguse ja kauguskiiruse määramisega; ühine pinnajaama ja orbiidi kahekordselt diferentseeritud kandelaine faas LAMBDA täisarvulise fikseerimisega; seitsmeparameetrilise Kuu datumi Fisheri informatsioon orbiidi ja pinna vaheliste kaugusmõõtmistega ja ilma; GNSS-i, VLBI ja laservahemõõtmise tehnikatevahelised nihked kohaliku sidemega võrreldes; ning tundlikkus h2, k2, l2 ja füüsilise libratsiooni suhtes. MODELLED, ILLUSTRATIVE sisenditega: numbrilisi tulemusi kontrollitakse sõltumatute numpy ja scipy programmidega ning midagi ei võrrelda Kuu suuruse mõõtmisega. Läved fikseeriti dokumendis <c4/> ja kahes avalikustatud muudatuses. Kolm on NOT MET ja igaüht kinnitab test, mis väidab möödalasku: C3 (süstitud jõuviga ei tuvastata eelregistreeritud sagedusega), Q3 (alglaaditud edukuse määr erineb numpy sõltumatust etalonist { "1.7e-6" } võrra lävi { "1e-9" } vastu, LAMBDA normaaljaotuse jaotusfunktsiooni lähenduse tõttu) ja G3 jälje pool (kaugusmõõtmisperekonna lisamine ei vähenda alati pseudopöördmaatriksi jälge). Ülejäänud on täidetud (<a2><c5/></a2>).

# text
# c1: cislunar-observability
# c2: kshana scenarios/cislunar-observability.toml
# c3: cislunar-arc-recovery
seg-022859135e79 = <b>Kuues artikkel tabelis Research.</b> „Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever“ (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) näitab, et DOP on ainult kaugusmõõtmisel põhineva tsislunaarse jälgimise jaoks määramata, ning kasutab selle asemel vaatlusgramiaani neljal tasapinnalisel kaugel retrograadsel orbiidil: ainult kaugusmõõtmise korral on astak { "2" } { "4" }-st hetktõmmisel ja see vajab umbes { "2.09" } h kaart, kauguskiirus (Doppler) annab astaku { "4" } kohe ning jaama kaasestimeerimine satelliidi olekute ja kelladega jääb ilma väliselt interferomeetrilise vaatlussuuruseta ühe võrra astaku puudulikuks. Selle arvud genereeritakse uuesti liigiga <c1/> (<c2/>); <c3/> katsetab läve sõltumatu hinnangualgoritmiga. README uurimiskaart, crates-, npm- ja PyPI README-d ning generaator kannavad seda.

# text
seg-d74a1b2dcb38 = Neutraalne kohtunik, muudetud mõõdetavaks.

# text
# c1: kshana jammertest import
# c2: kshana jammertest score
# c3: docs/JAMMERTEST.md
# c4: xval/jammertest-score/
seg-bf568567fe06 = <c1/> loeb avaldatud NPRA Jammertesti kataloogi ja edastuskava ajastatud tõena (kataloogi id-d säilitatud) ning <c2/> hindab vastuvõtja logi selle suhtes iga katse kohta (tuvastusviide, tuvastamata jäänud häired, valehäired, taastumisaeg), soovi korral allkirjastatud tõendipaketina (<a1><c3/></a1>). Hindamislävid eelregistreeriti enne mis tahes hinnatud käitust (<c4/>). JammerTest { "2024" } andmekogumil (toodud, mitte koodibaasi kopeeritud) ebaõnnestus eelregistreeritud minimaalse andmehulga reegel nii esimeses käituses kui ka andmetöötluse redaktsioonis, mistõttu ühtki lävendit ei saa hinnata ja midagi ei väideta; mõlemad käitused on registreeritud ja kindlaks määratud. MODELLED: ajakava on andmekogumi logitud aknad, mitte salvestatud eetriajad. { "2025" } SimulaMet NMEA komplekti ei kohandata (selle lehel litsentsi ei märgita).

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
# c4: sbf-tools
# c5: receiver-trust live --serial
seg-0a2bcad8d645 = <b>Vastuvõtja enda lipud Kshana omade kõrval.</b> UBX-NAV-STATUS <c1/> ja UBX-SEC-SIG loetakse igal epohhil väljale <c2/> ning tulemuse võrdlus <c3/> asetab need Kshana monitoride vastu (mõlemad, ainult vastuvõtja, ainult Kshana, ei kumbki); see ei tõsta alarmi ja ei muuda skoori. Septentrio SBF lugeja (PVTGeodetic, MeasEpoch, RFStatus, ainult lugemine, MIT-litsentsiga krati <c4/> peal) ja <c5/> (jada- või USB NMEA voog, ainult lugemine; see ei kirjuta kunagi vastuvõtjasse) liituvad nendega.

# text
# c1: docs/TIMING-HIL.md
# c2: docs/HARDWARE-SAFETY.md
# c3: holdover-test
# c4: clock_log
# c5: ptp4l
# c6: phc2sys
# c7: ts2phc
# c8: tracking
# c9: statistics
# c10: iq scene --format sdrx
# c11: iq monitor --follow
# c12: compliance-report
# c13: lab-attestation
# c14: HARDWARE-SAFETY.md
seg-90d9927fe3e2 = <b>Ajastus ja riistvaraohutus</b> (<a1><c1/></a1>, <a2><c2/></a2>). Stsenaariumi liik <c3/> hindab ajastussüsteemi holdover-testi (operaatori poolt eemaldatud GNSS, holdover, taastumine) mõõdetud ajavea kirje põhjal, mõõdetuna avalike tabelite ITU-T maskide suhtes. <c4/> loeb linuxptp (<c5/>, <c6/>, <c7/>) ja chrony (<c8/>, <c9/>) logisid. <c10/> kirjutab ION GNSS SDR metaandmeid ja <c11/> jälgib SigMF salvestust, kuni see kasvab (ainult vastuvõtt). <c12/> saab NIST IR 8323r1 Foundational PNT Profile’i ({ "15" } parafraseeritud rida, toetab tõendeid (supports evidence for)). Tõendipakett võib salvestada operaatori <c13/> oma allkirjastatud manifesti, mida ei kontrollita kunagi; riistvaraetapid { "0" } kuni { "4" } ja juriidilised märkused on failis <c14/> (ootab juriidilist läbivaatust). Mingit sorti edastusteed ei ole.

# text
# c1: kshana bench
# c2: bench/SPEC.md
# c3: docs/BENCH.md
# c4: xval/bench/PREREGISTRATION.md
# c5: agc_k_sigma
# c6: xval/bench/RESULTS-v2.md
# c7: bench_score
# c8: bench_leaderboard
# c9: score_benchmark
# c10: render_leaderboard
seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): fikseeritud ülesanded, jaotused ja mõõdikud GNSS-häirete tuvastamiseks vastuvõtja logidel (JammerTest { "2024" }) ja IQ-l, ajastuse holdover-i ennustamiseks (IGS kellad) ning jaotusest väljas oleva optimismivahe jaoks; jaotuste manifestid kindlaksmääratud räsidega ja toomisskriptid (andmeid ei kopeerita koodibaasi), suletud holdout kommiti ja avalikustamise kaudu, tulemusfaili skeem ja staatiline edetabelileht. Lähtetasemed lävede all, mis on eelregistreeritud failis <c4/>: hindaja läved täidetud, C1 kuni C3 täidetud, D2 täidetud; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } võrreldes vähemalt { "0.80" }-ga testjaotusel), <b>D1 NOT MET</b> (suurim vahe { "0.0301" }) ja <b>ülesande (b) R1 NOT MET</b> (üle võetud, mitte uuesti käitatud), igaüks kindlaks määratud (<c6/>). Iga skoor on MODELLED. Python <c7/>, <c8/>; WebAssembly samamoodi; MCP <c9/>, <c10/>.

# text
# c1: kshana interference-map daily
# c2: sensitivity
# c3: docs/observatory/METHOD.md
seg-04c0d6161c7a = <b>Häirete vaatluskeskus</b> (<c1/>, <c2/>, <a1><c3/></a1>): reprodutseeritav ööpäevane GeoJSON, PNG ja intsidendiaruande JSON kolme olekuga (halvenenud, mitte halvenenud, vaatlemata), minimaalne viivitus { "24" } h, lahtrid { "0.5" } kraadi või jämedamad, põhjust ei omistata ja OpenSky andmed lükatakse tagasi; eelregistreeritud parameetrite tundlikkusuuring; 30-päevane Läänemere tagantjärele kataloog adsb.lol-ist.

# text
# c1: receiver-trust
# c2: docs/MACHINE-INPUTS.md
# c3: [log] format
# c4: rtklib-pos
# c5: .pos
# c6: novatel
# c7: BESTPOS
# c8: RANGE
# c9: RXSTATUS
# c10: self_report
# c11: receiver-self-report
# c12: rtcm3
# c13: NOTICE
# c14: gnss-sdr
# c15: integrations/gnss-sdr/relay.py
seg-497ae18bfb03 = <b>Masina- ja andurisisendid liigile <c1/></b> (<a1><c2/></a1>). Uued <c3/> väärtused, kõik ainult lugemiseks, MODELLED, ise kirjutatud fikstuuridega ja ilma andmeid koodibaasi kopeerimata: <c4/> (RTKLIB <c5/> lahendifailid), <c6/> (OEM7 ASCII- ja binaar-<c7/>, <c8/> C/No ja <c9/>; vastuvõtja segaja lipust saab epohhi <c10/>, mida võrdlus <c11/> asetab Kshana alarmide vastu), <c12/> (MSM4 ja MSM7 C/N0 GPS-i, GLONASS-i, Galileo, SBAS-i, QZSS-i, BeiDou ja NavIC-i jaoks; paigutused BSD-litsentsiga pyrtcm tabelitest, mille teade on failis <c13/>, mitte RTCM standardist) ja <c14/> (GNSS-SDR Monitori ja PVT-monitori sõnumid JSON-ridadena, edastatud skriptiga <c15/>).

# text
seg-22e8b434782f = IMU logid teise andurina.

# text
# c1: [log.imu]
# c2: csv
# c3: euroc
# c4: heading-course
# c5: kshana imu-fit
# c6: imu_fit
# c7: imu_fit
# c8: fit_imu_log
# c9: /kshana-fit-imu
# c10: hybrid
# c11: fusion
# c12: [accel_classical]
seg-5491196d6421 = <c1/> (<c2/> või <c3/>) integreerib güroskoobi pöörlemiskiiruse suunaks, mida monitor <c4/> loeb; sisseehitatult igal pinnal ja kantud tõendipakettide kaudu. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, pistikprogramm <c9/>, JetBrains toiming) sobitab stsenaariumide <c10/> ja <c11/> kiirendusmõõturi ja güroskoobi parameetrid paigalseisu logist Alani hälbe abil ning trükib tabeli <c12/> logi SHA-256-ga selle päritoluandmetes.

# text
# c1: integrations/ros2/kshana_trust
# c2: ublox_ubx_msgs
# c3: gnss_lib_py
# c4: integrations/gnss_lib_py
seg-f48fdf6252cd = <b>Integratsioonid:</b> ROS { "2" } pakett (<c1/>: NavSatFix ja <c2/> sisse, usaldusteemad välja; selle ROS-ita sild on testitud päris mootori vastu, sõlme ennast ei ole elaval ROS-i graafil käitatud), <c3/> sild (<c4/>, MIT sõltuvus, valikuline) ja GNSS-SDR relee.

# text
# c1: kshana trust-telemetry --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: format = "mqtt"
seg-1a8727ad42bb = <b>Home Assistant MQTT eksportija</b> usaldustelemeetria jaoks: <c1/> ja <c2/> (avastussõnumid ja JSON olekudokument; ainult avaldamine, ilma volituste ja TLS-ita) ning <c3/> tekstina Pythonis, WebAssembly-s ja MCP-s.

# text
seg-f1cb2c2881c9 = Seitse MODELLED registririda ülaltoodu jaoks. Midagi siin ei ole VALIDATED: ühtki päris vastuvõtja, baasjaama, IMU, GNSS-SDR käituse, ROS-i graafi ega MQTT vahendaja salvestust ei loetud.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: duration_h
# c4: step_s
# c5: seed
# c6: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-12c7a28c80b5 = <b>Optilise lüli varu ajas.</b> Liik <c1/> võtab valikulise tabeli <c2/> (<c3/>, <c4/>, <c5/>) ja kirjutab siis ka jaama kohta ühe algväärtustatud realisatsiooni fikseeritud jaamamudelist ajas: pilveepisoodid, episoodi kohta vedela vee sammas, sammu kohta üks gamma-gamma sintillatsiooni valim ning nendest lüli varu, pilve- ja sintillatsioonisummutused ja lüli töötamise lipp, koos realiseerunud kättesaadavuse, pilvisuse osakaalu, katkestuste arvu ja pikima katkestusega. MODELLED (üks tõmme mudelist, mitte kliima; väline sõltumatu etalon puudub). Ilma tabelita on tulemus dokument { "0.37" }. Kaks kaasasolevat optilist stsenaariumi kannavad tabelit ({ "336" } h, { "600" } s, algväärtus { "37" }). Läved eelregistreeritud failis <c6/> enne esimest käitust.

# text
seg-78524dbb3bd2 = Katsetingimuste spetsifikatsioon ja laboratoorne edasi-tagasi tsükkel.

# text
# c1: kshana.test-conditions/1
# c2: docs/spec/TEST-CONDITIONS.md
# c3: recording.kind = "receiver-log"
# c4: kshana bench-export
# c5: <base>.conditions.json
# c6: kshana evidence round-trip
# c7: evidence_round_trip
# c8: create_round_trip_pack
# c9: /kshana-evidence-pack
seg-fbf034925641 = <c1/> avaldatakse kui <a1><c2/></a1> koos JSON-skeemiga ja see saab väärtuse <c3/>. <c4/> kirjutab ka <c5/>. <c6/> ehitab allkirjastatud paketi, mis seob stsenaariumi räsi, fikseeritud tingimuste räsi, vastuvõtja logi räsi ja skoori fikseeritud sündmuste suhtes, ning keeldub tingimustest, mis ei lähe kokku hindamissündmustega. Läbitöötatud näide, kus gps-sdr-sim kirjutab ainult faili; taasesitus on operaatori vastutus ja seda ei automatiseerita kunagi. Python <c7/>, MCP <c8/>, pistikprogramm <c9/>.

# text
# c1: kshana standards-pack
# c2: standards/
# c3: compliance-report
seg-8bda4472d561 = <b>Standardipaketid</b> (<c1/>, <c2/>): DHS Resilient PNT raamistiku katseprofiilid tasemetele { "1" } kuni { "4" }, IMO MSC.1/Circ.1575 täpsustasemed ja terviklikkuse hindamine ning ICAO Doc { "9849" } lisa F jälgimine, hindamine ja leevendamine, igaüks stsenaariumide komplekt, mida hinnatakse enne käitust fikseeritud lävede suhtes, koos compliance-report ridadega, mille kasuks need toetavad tõendeid (supports evidence for). Möödalasud on kirjas ja kindlaks määratud: DHS L4-T1 ja neli IMO täpsustesti. Doc { "9849" } ennast ei loetud (tasuline); ICAO pakett järgib ICAO enda RFI Mitigation Plan esitlust. <c3/> saab standardipakettide jaotise. Kõik MODELLED.

# text
# c1: docs/LUNANET-AFS.md
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: kshana iq
# c5: kshana lunanet-afs-check
# c6: spec
# c7: symbols
# c8: generate
seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): AFS-I Goldi ja AFS-Q Weili koodid PRN-idele { "1" } kuni { "210" }, signaalid <c2/> ja <c3/> käsus <c4/>, SB1 BCH kood, CRC-24Q ja põimur ning <c5/> (<c6/>, <c7/>, <c8/>), kindlaks määratud LNIS V5 Applicable Document { "1" } Volume A-ga (LSIS-AFS V1.0, { "29" }. jaanuar { "2025" }). Koodid VALIDATED dokumendi trükitud tabelite suhtes (mida see märgib TBC); üks trükitud kolmanda koodi veerg (PRN { "147" }) on tõenäoliselt trükiviga ja möödalask on kindlaks määratud. Alamkaadrite { "2" } kuni { "4" } LDPC kodeerimist ei ole teostatud.

# text
# c1: notebooks/course/
seg-5a5720500b6d = <b>Kursuse märkmikud</b> (<c1/>): jamming, spuufimine, holdover, terviklikkus, OSNMA ja häirekaart, igaüks harjutustega.

# text
# c1: xval/araim-m3/
# c2: src/bin/gen_araim_m3_study.rs
seg-3d543433051c = <b>EU-US WG-C ARAIM Milestone { "3" } maksimaalse URA uuring</b> (<c1/>, <c2/>), mis asendab tagasivõetud „Table A-3“ kava; MODELLED fikseeritud kõrvalekalletega.

# text
# c1: docs/drafts/
# c2: LICENSES/
seg-4f1f786e2658 = <b>Omaniku kinnitamiseks mõeldud mustandid</b> asukohas <c1/>: JOSS-i artikkel, TSC harta muudatus, sõltumatute etalonide registri protsess ja <c2/> jaotamise ettepanek. Midagi sellest pole vastu võetud.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: holdover-test
# c4: record.series
# c5: .pos
# c6: /benchmark
# c7: kshana bench leaderboard
seg-49a758039871 = <b>Studio vaated funktsioonidele { "0.38" }</b> (kshana.dev/studio/). Silla taasesitus (kaks sünteetilist käitust ühel kellal: trajektoor, usaldusskoor, satelliidid, mida logi kuuleb, ja otsus, vastuvõtja enda lippudega Kshana alarmide kõrval); optiline PNT (kaks <c1/> stsenaariumi valikulise algväärtustatud <c2/> realisatsiooniga, MODELLED); holdover-test (tulemus <c3/>, mõõdetud ITU-T maskide suhtes, joonistatud tulemuse enda <c4/> põhjal); häirete vaatluskeskuse vaatur, mis avab teie loodud failid ega tarni ühtegi; lehel Tools Jammertesti hindaja, IMU sobitus ja MQTT telemeetriavorminguna; ning lehel Trust logivormingu valija (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) valikulise IMU failiga. Iga vaade loeb faile brauseris ja ei lae midagi üles; iga arv säilitab sildi, mida register selle jaoks hoiab, ja igaüks kannab nõuandvat avaldust. Saidi leht <c6/> näitab fragmenti <c7/>.

# text
# c1: KSHANA_EXACT_PINS=1
# c2: scripts/gate.sh
# c3: tests/exact_pin_gate_guard.rs
# c4: scripts/oracle-triage.sh
# c5: docs/LOCAL-ORACLE-TESTS.md
# c6: .github/workflows/oracle-macos.yml
seg-91f6beb29f8e = <b>Probleem #36: baiditäpsed fikseeringukihid.</b> Baiditäpsed fikseeringukihid käivituvad ainult hostil, mis on deklareeritud lähtetasemeks (<c1/>, seadistab <c2/>), mitte igal Apple-silicon Macil, sest Apple’i matemaatikateek erineb macOS-i väljaannete vahel; portatiivne kiht käivitub kõikjal ja <c3/> takistab baiditäpse kihi uuesti ainult platvormi põhjal piiritlemist. Sõltumatute etalonide võrdlused ise läbivad macOS-il. Ühtki literaali ei võetud uuesti ja ühtki tolerantsi ei muudetud. <c4/> ja <a1><c5/></a1> ütlevad, kuidas erinevust triaažida; <c6/> on käsitsi käivitatav ja iganädalane diagnostika, mitte värav.

# text
# c1: web/studio/lib/trust-open.mjs
seg-15070f7dcc0a = <b>CodeQL: ankurdamata muster Studio usaldusavamise abifunktsioonis</b> sobitub nüüd kogu päisega (<c1/>).

# text
# c1: check
seg-56856063519f = <b>CI: jooksutaja ketas.</b> Töö <c1/> ehitab arendus- ja testiprofiilid ilma silumisinfota, nii et linkimine ei täida enam ketast.

# text
seg-38c59868835e = <b>Lähtekoodi kaitsed.</b> Iga lähtefail, mis sisaldab fikseeringuid kandvaid testifikstuure, deklareerib oma fikseeringu skoobi ning testid, mis kirjutavad ajutisi faile, kasutavad iga kutse kohta unikaalset teed, nii et paralleelsed käitused ei saa põrkuda.

# text
# c1: docs/SCENARIOS.md
# c2: timeseries
seg-884f693585fa = <b><c1/></b> genereeritakse uuesti optilise atmosfääri valikulise välja <c2/> jaoks.

# text
# c1: verifyPlugin
# c2: FileEditorManager.openFile
# c3: OpenFileDescriptor
# c4: verifyPlugin
seg-e16d328f3967 = <b>JetBrainsi pistikprogramm: aegunud või eemaldamiseks kavandatud platvormi API-t ei kasutata.</b> IntelliJ Plugin Verifier (<c1/>) IntelliJ IDEA ehituse { "263" } ({ "2026.3" }: { "263.6800.24" } ja { "263.7031.23" }) vastu leidis ühe aegunud kutse, <c2/>, toimingus Insert Example; see avab nüüd uue faili käsuga <c3/>. Pistikprogramm on ühilduv ja puhas versioonil { "2024.3" } (since-build, muutumatu) ja mõlemal { "263" } ehitusel. CI käitab nüüd <c4/> ja ebaõnnestub ühilduvusprobleemide ning mis tahes eemaldamiseks kavandatud API kasutamise korral.

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
# c3: docs/design/optical-atmosphere-0.37.md
# c4: optical_linkbudget
# c5: xval/optical-atmosphere/PREREGISTRATION.md
seg-07ce053c906a = <b>Optiline PNT läbi atmosfääri</b> (stsenaariumi liik <c1/>, <a1><c2/></a1>, projekteerimismärge <c3/>). Optilise lüli ja maajaamade komplekti jaoks esitab see lainepikkusest ja kõrgusnurgast sõltuva selge õhu sumbuvuse, Hufnageli-Valley turbulentsi oleku (Rytovi dispersioon, sintillatsiooniindeks, gamma-gamma summutused, apertuuri keskmistamine), kättesaadavuse lüli varu suhtes fikseeritud pilveklimaatikast, varu, mida vajatakse sihtkättesaadavuste jaoks, ja lae, mida ükski varu ei tõsta, katkestuste kestuse jaotuse, ajastus- ja kaugusmõõtmisvea katkestuse kohta kella holdover-mudeli kaudu, vahemaaga korreleeritud jaamade mitmekesisuse ning mis-kui võimendused lainepikkuse muutmisel, suuremal apertuuril, adaptiivoptikaga sintillatsiooni vähendamisel ja lisavarul. <c4/> saab atmosfääri arvestava eelarve; ilma selleta on selle väljund bititäpselt identne versiooniga { "0.36" } (lävi A5). Kaks kaasasolevat stsenaariumi kannavad ILLUSTRATIVE pilveklimaatikaid. MODELLED: kolm registririda. Numbrilised tulemused täidavad läved A1 kuni A6, mis on eelregistreeritud failis <c5/> sõltumatu mpmath programmi vastu; see kontrollib fikseeritud valemite teostust, mitte atmosfääri, ja ühtki mõõdetud kättesaadavuse kirjet pole võrreldud, seega ükski rida pole VALIDATED. Lävi A4 jäi esmalt eksimisse { "3e-9" } võrra, sest kasutatud normaaljaotuse jaotusfunktsioon oli { "1.5e-7" } lähendus; jaotusfunktsioon asendati ja lävi jäeti registreeritud kujule. Natiivne ja WebAssembly ehitus tagastavad mõlema kaasasoleva stsenaariumi jaoks baitidena identsed dokumendid (A7, käitatud { "0.37.0" } integratsioonikommitil).

# text
# c1: docs/design/DETECTION-ROC.md
# c2: roc_window_s
# c3: roc.json
seg-eb589aff44ad = <b>IQ monitoride tuvastus-ROC</b> (PRO-32, <a1><c1/></a1>). Monitoridega kampaania hoiab iga testistatistiku maksimumi fikseeritud sündmuste akendes (positiivne) ja sündmustest väljas olevates ruudustatud akendes (negatiivne, <c2/>). Aruanne koondab need alarmi liigi kaupa ROC-ks koos selle AUC-i ja töökohaga seadistatud läve juures, kui <c3/> ja aruande jaotis. Sünteetilistel kampaaniatel on juhusetaseme kontroll täidetud. C/N0 AUC lävi ({ "0.95" }) ei ole täidetud ({ "0.79" }), sest negatiivsed aknad vahetult pärast sündmust pärivad CUSUM-i kahanemise tuvastusest; see on registreeritud. MODELLED.

# text
# c1: docs/design/MONITORS-IN-CAMPAIGN.md
# c2: [monitors]
# c3: 2Q(k)
seg-d25a34e23f1a = <b>IQ monitorid labori taasesituse kampaanias</b> (PRO-31, <a1><c1/></a1>). Valikuline tabel <c2/> kampaaniafailis käitab IQ monitore jooksutaja ühel läbimisel: võimsus ja spekter pärast iga esiotsa ahelat ning C/N0, SQM ja lukk iga jälgitud kanali kohta. Nende alarme hinnatakse fikseeritud sündmuste suhtes: tuvastatud või tuvastamata jäänud, tuvastusaeg ja valehäired ekspositsiooni tunni kohta. Iga testi suletud kujuline valehäire näitaja on esitatud, sh uus kahepoolne Gaussi näitaja SQM testidele (<c3/>). Ilma tabelita ei muutu midagi. Sünteetilistel kampaaniatel on võimsuse ja SQM valehäire läved ning C/N0 valehäire lävi täidetud; { "18" } sumbuvust { "18" }-st tuvastatakse, kuid tuvastusaja piir, mis on konstruktsiooni järgi alla ühe detektorivalimi, ei ole täidetud ja on registreeritud. MODELLED; registririda „IQ monitorid hinnatud labori taasesituse kampaaniates“.

# text
# c1: tests/iq_labfit_followup.rs
# c2: labfit-iq-followup
# c3: docs/design/LABFIT-FROM-IQ.md
# c4: docs/design/evidence/labfit-followup/RESULTS.md
seg-8eb0f650065e = <b>Labori sobitus IQ kampaaniatest, järeluuring</b> (<c1/>, CI töö <c2/>). See testib kahte hüpoteesi, mille dokumendi <c3/> §{ "13.6" } jättis lahtiseks, lävede vastu, mis on eelregistreeritud kommitis 1e532f84. See lisab kaks sünteetilist kampaaniat: S astmelise J/S-ga (algväärtus 2026_1014) ja R, värske ramp (algväärtus 2026_1015). Tulemused on failis <c4/>.

# text
# c1: δ_eff
seg-ce60405d0005 = S1 täidetud: kui iga J/S tase on hoitud, taastatakse <c1/> piirides +{ "0.185" } dB. Rampkampaaniate −{ "1.1" } dB viga on hinnangualgoritmi viivitus.

# text
seg-ea9f206c2999 = S2 täitmata, kindlaks määratud testiga, mis väidab möödalasku: (d) nii nagu kirjutatud astmelisel kampaanial kehtib jälgimisahela mudeli korral ({ "0.45" } dB), kuid mitte empiirilise mudeli korral ({ "6.42" } dB).

# text
seg-fab0653558e4 = R1 täidetud: värskel rampikampaanial on (d) sobitatud kaotuse viibimisaegadega, millele on lisatud iga sündmuse rambi kiirus, { "1" } dB piires mõlema mudeli korral.

# text
seg-24c6725c2c7d = Möödalasud (a′) ja (d) korduvad kampaanial R.

# text
# c1: step
seg-7cbbce356973 = Kampaania võib nüüd esitada oma J/S-i testkonstruktsioonis profiilina <c1/>.

# text
seg-34007ba58a9f = Ükski §{ "13" } otsus ei muutu ja registririda jääb MODELLED.

# text
# c1: [design.carrier] fll_pull_in_max_s
# c2: LoopConfig::fll_pull_in_max_s
# c3: fll_assist = "pull-in"
seg-df2c3f2532d6 = <b>Piiratud FLL-i sisselukustumine, valikuline</b> (DS-LOOP-05): uus ahelaprojekti võti <c1/> (s), Rust <c2/>. Kui <c3/>, sunnib see FLL-ist PLL-ile ülemineku pärast nii pikka aega, sõltumata PLI-st. Vaikimisi seadistamata ja siis projekti räsist väljas; vaikeprojekt ja selle räsi on muutumatud.

# text
seg-ae2794b2d3d5 = Kontrollitud lävede vastu, mis on eelregistreeritud kommitis 58789af0, süstitud tõe põhjal. Kontroll on täidetud: vaikeväärtus ei anna kunagi üle { "9" } seedil { "10" }-st väärtusel { "33" } dB-Hz.

# text
seg-6d9483874b35 = Täitmata: { "1.0" } s piirangu korral hoiavad { "16" } käitust { "20" }-st lukku väärtusel { "33" } dB-Hz ja { "8" } { "20" }-st väärtusel { "31" } dB-Hz; ülejäänud tsüklevad sunnitud üleandmiste ja FLL-i tagasipöördumise vahel. Faasivärin on { "1.8" }× ainult PLL-i oma väärtusel { "33" } dB-Hz.

# text
seg-deeefaf50e3e = ~{ "35" } dB-Hz sisselukustumise alampiir jääb vaikeväärtuse dokumenteeritud piiranguks.

# text
seg-780de73c01e1 = MODELLED; registririda „Piiratud FLL-i sisselukustumine allpool vaikeprojekti FLL-ist PLL-ile ülemineku alampiiri (valikuline)“.

# text
# c1: jamming
seg-ace6b53749bd = <b>Hõivamise hüsterees ja esiotsa kvantiseerija jamming-liigis</b> (CAP-06c): kaks valikulist jaotist stsenaariumile <c1/>.

# text
# c1: [acquisition]
# c2: acquisition_threshold_dbhz
# c3: reacquisition_delay_s
# c4: epochs[].sats[].acquired
# c5: epochs[].acquired
# c6: fom.availability_acquired
seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, jälgimislävel või sellest kõrgemal) ja <c3/> (s, vaikimisi { "0" }). Satelliit hõivatakse hõivamislävel või sellest kõrgemal, kui see on olnud hõivamata viivituse jooksul. Seda hoitakse, kuni see on jälgimislävel või sellest kõrgemal. Väljundid: <c4/> (tõene/väär), <c5/> (arv) ja <c6/> ({ "1" }).

# text
# c1: [front_end]
# c2: adc_bits
# c3: bandwidth_mhz
# c4: front_end
# c5: agc_gain_reduction_db
# c6: 10·log10(1 + J/N)
# c7: quantiser_loss_db
# c8: loss_model
seg-b568f542e23a = <c1/>: <c2/> ({ "1" } kuni { "16" }) ja <c3/> (MHz, vaikimisi kaks korda kiibikiirus). Väljundid ploki <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, võetud maha iga lüli efektiivselt C/N0-lt) ja <c8/>. Kadu on Gaussi sisendi oma, märgitud mittekehtivaks CW-, kitsaribaliste ja pühitud segajate korral.

# text
seg-0dad81736863 = Ilma jaotisteta on iga väljund baitidena identne.

# text
seg-92007bfb6680 = Kontrollitud lävede vastu, mis on eelregistreeritud kommitis 70c72fcc. Kvantiseerija kadu on { "0.0007" } dB piires sõltumatust Monte Carlost ja AGC näit { "0.012" } dB piires IQ-kihi AGC-ahelast.

# text
seg-973e451df99d = Registreeritud hüstereesikäitused olid infoväärtuseta (iga lüli kadus), seega on see lävi NOT MET. Täiendav käituskomplekt, mis on registreeritud kommitis { "37793290" }, täidab selle: iga lipp võrdub sõltumatu ümberarvutusega ja { "732" } lülist { "1824" }-st näitavad hüstereesi.

# text
seg-912e9f1a4d5b = Tähelepanek: CW-segajaga kaotab 1-bitine ADC umbes { "5" } dB rohkem kui Gaussi näitaja.

# text
seg-a19aee81b581 = MODELLED; registririda „Hõivamise hüsterees ja esiotsa kvantiseerija jamming-liigis sõltumatute ümberarvutuste suhtes“.

# text
# c1: [terrain]
# c2: jamming
seg-97f43a4fe71d = <b>Segaja maastikuvarjestus jamming-liigis</b> (CAP-06b): valikuline jaotis <c1/> stsenaariumis <c2/> segajaga. Väljad:

# text
# c1: dem_hgt
# c2: .hgt
seg-6d59a2857ab9 = <c1/>: SRTM <c2/> lahter, suhteline töökataloogi suhtes;

# text
# c1: samples_per_side
# c2: ll_lat_deg
# c3: ll_lon_deg
seg-fa5b15500405 = <c1/>, <c2/> ja <c3/> (kraadi): lahtri suurus ja nurk;

# text
# c1: geoid_undulation_m
# c2: k_factor
# c3: profile_step_m
seg-09a35655f010 = <c1/> (m, vaikimisi { "0" }), <c2/> (vaikimisi 4/3) ja <c3/> (m, vaikimisi { "30" }).

# text
seg-ad58fe7ff627 = Mootor valib segaja ja vastuvõtja vahelise suurringi maastikuprofiili ning leiab domineeriva noaserva. Segaja vastuvõetud võimsust ja seega iga J/S-i vähendab ITU-R P.526-15 §{ "4.1" } ühe noaserva sumbuvus.

# text
# c1: jammer_terrain
# c2: nu_max
# c3: diffraction_loss_db
# c4: obstacle_distance_m
# c5: obstacle_terrain_m
# c6: path_length_m
# c7: profile_points
seg-001d7b88b26d = Tulemus saab ploki <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) ja <c7/> (arv).

# text
seg-b9696f5eda4b = Ilma jaotiseta on iga väljund baitidena identne.

# text
# c1: ν
seg-593b6a5b4480 = Kontrollitud lävede ja kümne asukoha vastu, mis on eelregistreeritud kommitis 92cd2bfd, Death Valley lisatud päris SRTM-i lahtril, sõltumatu numpy ümberarvutuse vastu. Kõik täidetud: halvim erinevus { "1.6e-10" } väärtusel <c1/> ja sumbuvusel (lävi { "1e-9" }), sumbuvus on segaja kõrguse suhtes monotoonne ja sumbuvus jõuab J/S-ini täpselt.

# text
seg-62e07defd715 = MODELLED; registririda „Segaja maastikuvarjestus jamming-liigis sõltumatu numpy ümberarvutuse suhtes päris SRTM-i lahtril“.

# text
# c1: [crpa]
# c2: jamming
# c3: elements_enu_m
# c4: weighting
# c5: "null-steering"
# c6: "mvdr"
# c7: bandwidth_mhz
seg-378e9052e2c4 = <b>CRPA antennivõimendused jamming-liigis</b> (CAP-06a): valikuline jaotis <c1/> stsenaariumis <c2/>. Väljad: <c3/> (elementide asukohad kohalikus ida-põhja-üles süsteemis, m), <c4/> (<c5/> või <c6/>) ja <c7/> (MVDR müra ribalaius, MHz, vaikimisi kaks korda kiibikiirus).

# text
# c1: ‖w‖²
# c2: |wᴴa_j|²
seg-ca39fefc0fb3 = Iga kanal moodustab oma satelliidi suunas moonutuseta kiire. Lüli müra skaleeritakse teguriga <c1/> ja segaja teguriga <c2/> enne olemasolevat häirekindla C/N0 võrrandit.

# text
# c1: crpa
# c2: array_noise_gain_db
# c3: jammer_gain_db
seg-1f1ddc11ad94 = Iga lüli saab ploki <c1/>: <c2/> (dB) ja <c3/> (dB).

# text
# c1: kshana
# c2: api::run_toml
# c3: jamming::run_jamming
seg-790ecc6a1bd4 = Kehtetu jaotis (tühi elementide loend, tundmatu kaalutus, mittepositiivne ribalaius) on viga nii <c1/> ja <c2/> kaudu kui ka <c3/> kaudu.

# text
seg-2464d9dde85f = Kontrollitud lävede vastu, mis on eelregistreeritud kommitis 08d83b4d. Täidetud: additiivsus (pärast parandust: esimene ehitus lisas uued ühikud iga segamiskäituse ühikutabelisse); üks element ei ole massiiv; mürategur ja efektiivne C/N0 sõltumatu numpy ümberarvutuse vastu { "1e-9" } dB piires; MVDR läheneb nullile kõrge JNR-i korral.

# text
# c1: docs/revisions/STUDIO15-batch4-rebaseline.md
seg-c04495f7a65a = Täitmata: MVDR segaja võimendus { "194" } lülil { "456" }-st portatiivse matemaatika { "0.36" } korral ({ "202" } hosti matemaatika korral; <c1/>) (halvim { "1.7e-6" } dB). Jäägid −{ "100" } kuni −{ "188" } dB on selle läve juures float64 eraldusvõimest allpool ja numpy erineb iseendast sama suurusjärgu võrra.

# text
seg-c10e1c72eb15 = MODELLED; registririda „CRPA antennivõimendused jamming-liigis sõltumatu numpy ümberarvutuse suhtes“.

# text
# c1: kshana iq track
seg-0a3adfa7271c = <b>IQ jälgimismootor GNSS-SDR-i { "0.0.19" } suhtes</b> (PRO-33): <c1/> ja GNSS-SDR jälgivad samu sõltumatuid GPS L1 C/A numpy salvestusi väärtustel { "30" } kuni { "45" } dB-Hz.

# text
seg-cc73857e38e8 = Läved eelregistreeritud kommitis 48edd4a5. Registreeritud kalibreerimine ebaõnnestus GNSS-SDR-i vale üleandmise tõttu (F3), seega lisab muudatus { "1" } (1e4288c4) mõlemale vastuvõtjale ainult sisselukustumise FLL-i, lisatud enne mis tahes katsesalvestust.

# text
seg-1d651ff134f9 = Täidetud: kandja ja koodi värin ning Doppler nõustuvad { "5" } % piires igal C/N0 väärtusel.

# text
seg-bc9c9a0247d1 = Täitmata: mootori NWPR C/N0 näitab { "2.3" }–{ "7.1" } dB alla GNSS-SDR-i SNV (F4, teadaolev hinnangualgoritmi piirang; M2M4 on tõest { "0.06" } dB piires); lukustusindikaatorid erinevad definitsiooni poolest (F5); üks { "30" } dB-Hz libisemise lahkarvamus (F6).

# text
seg-7c32867b5c27 = MODELLED; registririda „IQ jälgimismootor GNSS-SDR-i { "0.0.19" } suhtes sõltumatutel salvestustel“.

# text
seg-6ba057fab559 = <b>Kaks VALIDATED rida IQ-kihi koodidele</b> (DS-GIQ-06b, PRO-39).

# text
seg-55524624777b = <b>BeiDou B1I.</b> Kõik { "63" } B1I peamist koodi vastavad kiip kiibi haaval GNSS-SDR { "v0.0.19" } sõltumatule generaatorile (lävi eelregistreeritud kommitis 911106d1). Lisatud on ainult selle programmi väljund: B1I PRN koodid, mille avalik ICD määratleb, eesliite ja räsina.

# text
seg-37437a09dd67 = <b>GPS L1C.</b> Kõik { "126" } L1CP/L1CD koodi ja { "63" } L1CO ülekatet vastavad kontrollveergudele, mida IS-GPS-800J trükib, ning arvutatud Legendre’i jada vastab selle tabelile 6.2-1 (läved eelregistreeritud kommitis fe372e26).

# text
seg-f445784a7f2d = Read: „BeiDou B1I peamised kaugusmõõtmiskoodid sõltumatu generaatori suhtes“ ja „GPS L1C kaugusmõõtmis- ja ülekattekoodid IS-GPS-800J trükitud kontrollveergude suhtes“.

# text
# c1: glonass-l1of
# c2: glonass-l2of
# c3: glonass-l1of-k<K>
# c4: beidou-b1i
# c5: beidou-b1c
# c6: beidou-b2a
# c7: beidou-b3i
# c8: galileo-e6
seg-001f48d86a3c = <b>GLONASS-i, BeiDou ja Galileo E6 ribad spektrimudelis</b> (CAP-12, signaalid): uued ribanimed <c1/> ja <c2/> (mis tahes FDMA kanal kujul <c3/>, K = −{ "7" } kuni { "6" }), <c4/>, <c5/>, <c6/>, <c7/> ja <c8/>. Igaüks kannab oma ICD kandesagedust, modulatsiooni ja minimaalset vastuvõetud võimsust. Need on valikulised nime järgi: vaikimisi ribakomplekt ja iga olemasolev väljund on muutumatud.

# text
seg-158a6ec19d6b = Kontrollitud lävede vastu, mis on eelregistreeritud kommitis 5806f28b: ICD väärtused, nullid, B1C komposiit ja C/N0 tee on täidetud.

# text
seg-805092ae8ca2 = Kaks lävi jäid täitmata. Ühikpindala lävi oli kirjutatud kujul saavutamatu (F1). IQ-kihi B1I ja B1C lainekujud vastavad mudelile ainult ribakeskmistatult, nende koodide ebaühtlaste joonspektrite tõttu (F2).

# text
seg-db88f07d97bb = MODELLED; registririda „Spektrimudel: GLONASS-i, BeiDou ja Galileo E6 ribad (valikuline)“.

# text
# c1: iq::acq::ca_cfar
# c2: ca_cfar_cells
# c3: M
# c4: ca_cfar_pfa
# c5: ca_cfar_alpha
seg-b0147cf3acc8 = <b>Lahtrikeskmistav CFAR-valik IQ hõivamises</b> (PRO-37): <c1/> ja <c2/> otsustavad hõivamisruudustikul, võrreldes iga lahtrit selle Doppleri rea tugilahtrite keskmisega. Lävi tuleneb suletud kujulisest CA-CFAR valehäire tõenäosusest <c3/> mittekoherentse bloki jaoks (<c4/>, <c5/>), seega otsus ei sõltu valimivõimsuse normaliseerimisest. See on valikuline; vaikedetektor ja iga olemasolev väljund on muutumatud.

# text
seg-a56e74b1e091 = Kontrollitud lävede vastu, mis on eelregistreeritud kommitis 3724aefa: suletud kuju Monte Carlo vastu ({ "18" } juhtu { "18" }-st) ja { "1" } % projekteeritud määr, mõõdetud { "0.97" }–{ "1.01" } % Gaussi ja 2-bitiselt kvantiseeritud müral.

# text
seg-f88fe97e0ee6 = Üks lävi jäi täitmata: müravabal 2-bitisel signaalil ületab { "1.28" } % tipuväliseid lahtreid läve, koodi korrelatsiooni külgmaksimumide kohtadel (tähelepanek F1).

# text
seg-8d88b626c31e = MODELLED; registririda „Lahtrikeskmistav CFAR-valik IQ hõivamises“.

# text
# c1: scripts/fetch_scint_malindi.sh
seg-d596329195cf = <b>Sintillatsioonimudel mõõdetud andmete vastu</b> (PRO-34): IQ-kanali Cornelli sintillatsioonimudelit võrreldi mõõdetud { "50" } Hz GPS L1 intensiivsuse ja faasiga ekvatoriaalsest sintillatsiooniööst (Zenodo kirje { "16941224" }, INGV, Malindi, CC BY { "4.0" }), lävede all, mis on eelregistreeritud kommitis b6ccb499. Täidetud: intensiivsuse jaotus ja S4-ga seotud faasisintillatsioon. Täitmata: mudel summutab { "2.4" } korda sagedamini alla −{ "10" } dB ja { "3.5" } korda kauem (tähelepanek F1). Registreeritud töötlus loeb mudeli mähitud faasi (tähelepanek F2); faasitulemus kehtib ka lahtimähituna. <c1/> toob andmed. Rida jääb MODELLED: „IQ ionosfääri sintillatsioonikanal (Cornelli mudel) mõõdetud { "50" } Hz GPS L1 sintillatsiooni suhtes“.

# text
# c1: realdata::lugre::parse_iqs_sdrx
# c2: 2v + 1
# c3: SdrLayout::mid_rise
# c4: run_acq.py --corrected
# c5: xval/lugre-reader/RESULTS.md
seg-d6740cab2271 = <b>Parandatud LuGRE valimilugeja</b> (MR-09): <c1/> loeb LuGRE IQ partii, kus I on kõrges poolbaidis ja keskmise tõusuga tasemed <c2/> (<c3/>), mis eemaldavad −½ keskmise, mille paljad kahendkomplemendi täisarvud I-l ja Q-l kannavad. <c4/> annab GNSS-SDR-ile sama lugemise. Üldine ION lugeja ja iga olemasolev väljund on muutumatud: { "149" } stsenaariumi tulemust ja uuring on enne ja pärast baitidena identsed ning kindlaksmääratud LuGRE tähelepanekud loetakse nii nagu registreeritud (<c5/>). Ühtki registririda ei muudeta.

# text
# c1: LoopConfig::boc
# c2: N = 8
# c3: Channel::bump_jumps
# c4: docs/design/evidence/boc-bump-jump/RESULTS.md
seg-5adf36c03c14 = <b>Valikuline BOC({ "1,1" }) jälgimine</b> (CAP-07 (a)): <c1/> skaleerib DLL diskriminaatorid siinus-BOC({ "1,1" }) peamaksimumi jaoks ja lisab bump-jump monitori (väga varajased ja väga hilised korrelaatorid kohal ±{ "0.5" } kiipi, üles/alla loendurid, <c2/>), mis nihutab koodi NCO külgmaksimumilt eemale; <c3/> loetleb hüpped. Vaikimisi väljas ja iga olemasolev väljund on muutumatu. Kontrollitud lävede vastu, mis on eelregistreeritud kommitis 6b68f6cc, sünteetilisel BeiDou B1C signaalil: külgmaksimumilt algus, mis jääb ilma valikuta { "0.55" } kiipi kõrvale, tõmmatakse valikuga peamaksimumile ühe hüppega ajahetkel { "0.08" } s ja peamaksimumilt valehüpet ei nähtud. Üks lävi jäi täitmata: skaleerimise ühikutesti ruudustik ulatub diskriminaatorite lineaarsest vahemikust välja (tähelepanek F1 failis <c4/>). MODELLED; registririda „BOC({ "1,1" }) jälgimine: DLL skaleerimine ja bump-jump mitmetähenduslikkuse lahendamine (valikuline)“.

# text
# c1: docs/design/LABFIT-FROM-IQ.md
# c2: [input] campaign = "<out-dir>"
# c3: kshana iq campaign
# c4: kshana iq labfit
# c5: kshana.iq_labfit
seg-89345aa385f7 = <b>Labori sobitus IQ kampaaniatest</b> (B7.1, <a1><c1/></a1>). Labfit-stsenaariumi <c2/> sobitab kausta, mille väljund on <c3/>, CLI-s (<c4/>), Pythonis (<c5/>) ja MCP labfit-tööriistas (ainult selle töökataloogis olevad kaustad). See sobitab ühe ühiku signaali, ahelaprojekti, esiotsa ahela ja segaja tüübi kohta:

# text
seg-1726361b81c4 = C/N0 mudeli fikseeritud J/S suhtes, tsenseerimisega;

# text
seg-e1b8a27b06fd = jälgimislävi otse ja suletud kujul;

# text
seg-8dce89923619 = jälgimisahela ja empiirilised lukumudelid, seotud C/N0 mudeli kaudu, nende viibimisaegadega;

# text
seg-108646713c97 = algväärtustatud klastri alglaadimine salvestuste kohta, { "90" } % ennustusvahemikud ja ühe salvestuse välja jätvad hold-outid;

# text
# c1: [validation]
seg-ee5deb4d5d4b = eelregistreeritud tabel <c1/>, räsitud, iga läve kohta PASS/FAIL.

# text
# c1: kshana.labfit-iq/1
# c2: Q_eff
# c3: delta_eff = delta - 10 log10 Q
# c4: Q
# c5: delta_eff
seg-4d58263106af = Aruanne on <c1/> JSON-i, CSV ja Markdownina, koos ühikute plokiga. <b><c2/> ei ole C/N0 andmetest tuvastatav</b> ilma sõltumatu võimsusmõõtmiseta. See on fikseeritud, mitte kunagi sobitatud, ja sobitatud parameeter on <c3/> (projekti muudatus 2026-10-12). Tundmatu segaja tüüp võtab kõige kahjulikuma fikseeritud <c4/> (cw, { "1" }). Kshana enda stseenidest loodud sünteetilistel kampaaniatel läbib hold-out kattuvuse lävi (c). Lävid <c5/> (a') ja (b') ({ "0" } { "50" } kampaaniast kaetud) ning suletud kujulise jälgimisläve lävi (d) ei ole täidetud: need on registreeritud oma väärtustega. MODELLED; registririda „Avatud vastuvõtja C/N0 ja lukustusmudelite kalibreerimine IQ kampaania tulemustele, koos fikseeritud ennustusveaga“. Vastuvõtja logi labfit-tee ja selle väljundid on muutumatud.

# text
# c1: solar-system
# c2: planetary_kernel_path
# c3: KERNEL
# c4: kernel
seg-308d19be658d = <b><c1/> JPL-i tuumal</b> (CAP-31): <c2/> võtab iga keha, mida SPK sisaldab (de440s puhul: Merkuur, Veenus, Maa, Kuu), tuumalt, silt <c3/>, ning lisab ploki <c4/> ainult siis, kui see on seatud. Uus rida, VALIDATED SPICE-i vastu (eelregistreeritud f8e946ea; halvim { "3.3e-5" } m, { "1.0e-11" } m/s). Vaikearuanne on muutumatu.

# text
# c1: maneuver::porkchop_kernel
seg-fe16c24eae60 = <b>Porkchop DE440 efemeriidil</b> (CAP-20b): <c1/> pühib C3 ja saabumise V∞ heliotsentrilistel olekutel DE440 SPK-st. Uus rida, VALIDATED SPICE-i olekute vastu

# text
seg-a8632f3c86e9 = pykep { "3.0.1" } (eelregistreeritud 2d857fb1; Maa Marsile 2026-2028, { "304" } lahtrit, halvim { "2.6e-14" }, sama minimaalse C3 lahter).

# text
# c1: lunar_od::LunarMacroModel
# c2: LunarForceModel::macro_model
# c3: LunarMacroModel::lro_generic
# c4: docs/design/evidence/ds-lro-10-macro-model/RESULTS.md
# c5: forces::conical_shadow_body
seg-266cffab38a7 = <b>LRO mittegravitatsiooniline makromudel: NOT MET</b> (DS-LRO-10, eelregistreeritud e82047e2). <c1/> (valikuline kaudu <c2/>): lamedate plaatide otsene päikesekiirgus Kuu varjuga, Päikest jälgiv paneel ning Kuu albeedo ja soojus-IR; <c3/> on märgistatud üldine LRO lähendus avaldatud faktidest (bussiplaate pole: plaadi tabelit ei õnnestunud hankida). { "4" } h LRO kaarel jätab see vähendatud dünaamilise RMS-i väärtusele { "6.668" } m ja dünaamilise väärtusele { "11.94" } m, uskumatu kiirgusteguriga (umbes +{ "21" } / −{ "22" }), seega kõik kolm lävi jäävad täitmata. Tähelepanek on kinnitatud testiga ja ühtki vaikeväljundit ei muudeta (<c4/>). Valikuline Kuu kahurikuuli SRP kasutab nüüd Maa varjuvööndi asemel Kuu koonilist varju (<c5/>).

# text
# c1: LunarForceModel::lunar_tide
# c2: ::relativity
# c3: KSHANA_LRO_DEGREE
# c4: docs/design/evidence/ds-lro-09-11-longer-arc/RESULTS.md
seg-e4ed6e0e5048 = <b>Kuu OD: valikuline k2 tahke loodete mõju ja selenotsentriline relatiivsus</b> (DS-LRO-11), vaikimisi väljas (<c1/>, <c2/>); lüliti <c3/> ANISE ristvalideerimiseks (DS-LRO-04); { "24" } h LRO kaare fikstuur ja ainult informatiivne pika kaare sobitus (DS-LRO-09). Informatiivsed käitused on registreeritud failis <c4/>; ühtki avaldatud arvu ei muudeta.

# text
seg-b065138adba8 = <b>CR3BP { "9" }:{ "2" } NRHO CAPSTONE’i suhtes</b> (CAP-29d): uus MODELLED rida, mis mõõdab mootori ringpiiratud NRHO-d CAPSTONE’i lennatud orbiidi suhtes (JPL Horizons, märts { "2023" }; eelregistreeritud { "4e868170" }): periood { "1.07" } %, apolune { "0.05" } %, perilune { "4.1" } % CAPSTONE’i keskmistest, registreeritud { "3" } / { "5" } / { "20" } % läve sees. Mõõtmine, mitte valideerimine.

# text
# c1: cr3bp::to_moon_centred_icrf
# c2: from_moon_centred_icrf
# c3: to_moon_centred_icrf_de440
seg-954bd2771180 = <b>CR3BP pöörlevad olekud Kuu-keskseks ICRF-iks</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> vastendavad mõõtmeteta Maa-Kuu pöörleva oleku hetkelisele DE440 Maa-Kuu joonele, sh kaadri tasapinnaväline kiirus. Uus rida, VALIDATED SPICE-i kahe vektoriga kaadri vastu (eelregistreeritud 2313eb1b, muudetud enne mis tahes käitust d5ef79b3; { "72" } juhtu, halvim { "1.8e-7" } m ja { "1.2e-9" } m/s).

# text
# c1: cr3bp_family
# c2: #[doc(hidden)]
# c3: docs/design/evidence/cr3bp-families/RESULTS.md
seg-14599ab79300 = <b>CR3BP perekonna liikmed JPL-i Three-Body Periodic Orbits API suhtes: NOT MET</b> (RM-35, eelregistreeritud a9074f65). <c1/> (halo, NRHO ja DRO korrektsioon, monodroomia stabiilsusindeks, pseudokaare pikkusega jätkamine) vastab { "54" } API liikmele { "58" }-st igal lävel (olek, periood ja Jacobi { "1e-10" } piires kõikjal). Üks L1 halo stabiilsusindeks ({ "9.5e-2" }) ja kolm väikese DRO sulgumist ({ "1.5e-8" } kuni { "3.3e-8" } võrreldes väärtusega { "1e-8" }) jäävad lävest mööda, seega on moodul <c2/> ja ükski rida seda ei väida. Tulemused: <c3/>.

# text
# c1: lunar_frame::try_icrf_to_moon_pa_de440
# c2: lunar::try_mci_to_mcmf_de440
# c3: try_mcmf_to_mci_de440
# c4: lunar_od::De440LunarEnvironment
# c5: docs/design/evidence/fut05-de440-lunar-env/RESULTS.md
seg-0cd0e67a2e28 = <b>Valikuline DE440 Kuu orientatsioon ja keskkond</b> (FUT-05, DS-LRO-08; vaikeväärtused muutumatud): <c1/>, <c2/> / <c3/> (epohhiga ankurdatud, DE440 peatelgedes) ja <c4/> (sisseehitatud DE440 PA orientatsioon pluss geotsentriline Päike ja Kuu kasutaja antud DE440 SPK-st). ANISE’i vastu (eelregistreeritud ea537710): orientatsioon { "3.5e-7" } rad piires ja LRO sobitused { "1" } mm piires, kuid efemeriidi haru jäi oma lävest mööda (Päike { "30.7" } m, Kuu { "1.1" } m, ANISE’i poolel ~{ "1" } ms ajanihe), seega see ei ole valideeritud rida. Tulemused: <c5/>.

# text
# c1: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md
seg-92cc171c69da = <b>Kuu tugisüsteemi kampaania datum, tinglikkusega skaleeritud NumPy lävi: NOT MET</b> (eelregistreeritud b887eb05; jääb MODELLED). Samm { "0" } välistab pseudopöördmaatriksi tagavaravariandi kui põhjuse jaamade hinnatud lahknevusele { "0.30" }; NumPy nõustub lävega kaheksast stsenaariumist kuuel, kuid stations_estimated jääb lävest mööda ({ "6.8e-6" } võrreldes väärtusega { "5.9e-7" }) ning värskel kuupäeval 2026-12-01 muudab vaatlemata lõunapooluse maják majakainformatsiooni astakupuudulikuks, mida muutmata sõltumatu etalon ei suuda hinnata. Tulemused: <c1/>.

# text
# c1: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md
seg-8d2f1e9708ff = <b>Kuu tugisüsteemi datum päris vaatluskampaaniast (analüütiline Kuu) VALIDATED</b> värsketel { "2025" } EDC normaalpunktidel (eelregistreeritud 31f5283 enne ühegi toomist): muutmata SPICE ja NumPy sõltumatu etalon nõustub raamatupidamise, astakute ja nullsidestuse osas ning { "1.11e-3" } piires sigmadel (lävi { "1e-2" }), { "8.95e-4" } tinglikkusel ja { "1.79e-3" } risti/piki suhetel (lävi { "2e-2" }). Ainult kovariatsiooniarvutuse Library kontroll; läved ei eralda Kuu mudeleid. Tulemused: <c1/>.

# text
# c1: Body::iau_rotation_et
# c2: pxform
# c3: Body::mu
# c4: docs/design/evidence/mr08-body-orientation/RESULTS.md
seg-058d7d490111 = <b>IAU kehade orientatsioon ja GM neljateistkümnel lisatud Päikesesüsteemi kehal</b>, eraldatud reast „Iga Päikesesüsteemi keha füüsikalised konstandid“ VALIDATED reaks (eelregistreeritud 154bc54): <c1/> nõustub SPICE-i <c2/> väärtusega pck00011 pealt { "1e-9" } rad piires { "574" } maatriksil algsetel epohhidel ja { "574" } maatriksil { "41" } värskel epohhil, mida pole kunagi varem võrreldud (halvim Phobos { "1.38e-10" } rad), ning <c3/> võrdub väärtusega gm_de440 kõigil neljateistkümnel kehal. Algse rea ülejäänud osa (J2, keskmine raadius, aruanne) jääb MODELLED. Tulemused: <c4/>.

# text
# c1: maneuver::lambert_multirev
# c2: maneuver::kepler_universal
# c3: docs/design/evidence/lambert-multirev/RESULTS.md
seg-56c445aa8d9e = <b>Mitme tiiruga Lambert</b> (<c1/>): iga lahend kuni kolme tiiruga, mõlemad harud. Uus registririda, VALIDATED pykep { "3.0.1" } vastu (eelregistreeritud a75de851; { "382" } juhtu, { "1058" } lahendit, halvim kiiruse erinevus { "1.6e-13" } võrreldes väärtusega { "1e-8" }). Sisemine Kepleri maandumiskaitse leidis funktsiooni <c2/> ühe piirangu kaarel e = { "0.994" }; see on registreeritud failis <c3/>.

# text
seg-b62dc38b09e9 = Kasti-tiiva ja ECOM2 päikesekiirguse rõhk (DS-PA-14), valikuline.

# text
# c1: srp_boxwing
# c2: ForceModel::box_wing_srp
# c3: PreciseForceModel::box_wing_srp
# c4: srp_boxwing
# c5: None
# c6: cr
# c7: xval/srp-boxwing-orekit/
seg-fd50e846d10e = <c1/>: lamedate plaatide kasti-tiiva mudel Galileo FOC/IOV tabelitega GSC satelliidi metaandmetest, GNSS-i nominaalse yaw-juhtimisega, kiirgusteguri ja paneelipõhiste osatuletistega, ning ECOM2 empiiriline mudel oma osatuletistega. Valitakse käsuga <c2/> / <c3/> (väljad <c4/>, vaikimisi <c5/>: kahurikuuli tee ja iga kuldne väärtus on muutumatu); kasti-tiiva komplekti korral on <c6/> selle kiirgustegur. Võrreldud Orekit { "12.2" } vastu eelregistreeringu all (<c7/>): iga lävi täidetud, umbes { "1e-15" } suhteline; VALIDATED mudeli hindamisena, Galileo SRP ennustus jääb MODELLED.

# text
# c1: srp_shadow
# c2: oblate_conical_shadow
# c3: limb_darkened_shadow
# c4: ShadowModel
# c5: ForceModel::srp_shadow
# c6: forces::srp_accel_with_lit_fraction
# c7: xval/srp-oblate-shadow-orekit/
seg-fd7a7fe09705 = <b>Lapiku Maa SRP vari ja Päikese ketta äärepoole tumenemine (FUT-09, RM-11).</b> Uus moodul <c1/>: <c2/> (WGS-84 varjutav ellipsoid), <c3/> (Eddingtoni seadus) ja <c4/>, valitakse käsuga <c5/> (vaikimisi: olemasolev sfääriline koonuseline vari, muutumatu); <c6/>. Lapiku Maa vari nõustub Orekit { "12.2" } valgustussuhtega { "7.4e-9" } piires { "2400" } geomeetrial (VALIDATED, <c7/>); ketta äärepoole tumenemisel puudub väline sõltumatu etalon (MODELLED).

# text
seg-f09d4b831dfe = NRLMSISE-00 termosfäär (FUT-08, RM-10, DS-PA-13).

# text
# c1: nrlmsise00
# c2: gtd7
# c3: gtd7d
# c4: xval/nrlmsise00-pymsis/
seg-1f838a403840 = <c1/>: funktsioonide <c2/> ja <c3/> port (lülitid, päevane Ap ja 3-tunnine ap-massiivi režiim) NRL Fortrani avaliku omandi C-versioonist. See on bititäpselt identne selle C-pordiga ja pymsis { "0.13.0" } (NRL Fortran, üksiktäpsus) suhtes { "1.9e-6" } suhtelise vea piires 720-punktilisel ruudustikul ning see reprodutseerib { "17" } avaldatud testjuhtu (VALIDATED; <c4/>). See valideerib porti, mitte mudeli täpsust mõõdetud tiheduse suhtes.

# text
seg-9e8e9018dbaf = Valikuline NRLMSISE-00 õhutakistuse tiheduse tase.

# text
# c1: forces::DensityModel::{Exponential, Nrlmsise00 { f107a, f107, ap }}
# c2: forces::drag_accel_with_density
# c3: density_at
# c4: propagator::ForceModel::drag_density
# c5: xval/drag-tier-orekit/
seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> ja <c4/>. Staatiline eksponentmudel jääb vaikeväärtuseks, bitt bitilt. Kosmoseilm on mudeli kohta konstantne. VALIDATED orbiiditasemel Orekit { "12.2" } enda NRLMSISE-00 õhutakistuse vastu { "24" } h jooksul (halvim { "0.03" } m kuni { "142" } km õhutakistuse nihke korral; <c5/>).

# text
seg-b1b2ac9ac91e = Valikuline DE440 Päike ja Kuu Cowelli propagaatoris (RM-33, FUT-10).

# text
# c1: propagator::ForceModel::with_ephemeris
# c2: EphemerisProvider
# c3: KernelEphemeris
# c4: EphemerisProvider::relative_position_jd2
# c5: xval/propagator-de440-orekit/
seg-4f323703b251 = <c1/> võtab mis tahes <c2/> (nt DE440 <c3/>) kolmanda keha ja SRP liikmete jaoks; see keeldub pakkujast, kes ei suuda epohhi teenindada, loendab tagasilangemised analüütilisele reale ja on vaikimisi väljas. <c4/> säilitab kaheosalise täpsuse. Orekit { "12.2" } vastu selle enda DE440 lugejal nõustuvad { "24" } h orbiidid täpsusega { "0.017" } m; eelregistreeritud Päikese/Kuu asukoha lävi jäi täitmata ({ "6.4" } m / { "0.24" } m; SPICE näitab sama lahknevust), seega MODELLED (<c5/>).

# text
seg-6ac7f3f65b33 = Valikuline S1 atmosfääriline loodete mõju (DS-PA-03).

# text
# c1: tides::atmospheric_tide_s1
# c2: s1_air_tide_acceleration
# c3: air_tide_s1()
# c4: propagator::ForceModel
# c5: precise_od::PreciseForceModel
seg-35da1ed0dc83 = <c1/> ja <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 tabel { "1" } mudel N1, astmed { "2" }–{ "6" }), lubatud käsuga <c3/> objektidel <c4/> ja <c5/>; vaikimisi väljas. MODELLED (koefitsiendid kontrollitud uuesti avaldatud tabeli vastu; jõu mõjul puudub väline sõltumatu etalon).

# text
seg-c62d816a93cf = Kauguskiiruse ja asimuudi/kõrgusnurga partii orbiidi määramine kõrgusnurga maskiga (RM-36, FUT-13).

# text
# c1: orbit_determination::determine_orbit_batch_tracking
# c2: simulate_tracking
# c3: predict_tracking
# c4: propagate_with_stm
# c5: is_visible
# c6: measurement_with_partials
# c7: batch_ls::gauss_newton_analytic
seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (variatsiooniline STM analüütiliste kahe keha + J2 osatuletistega), <c5/>, <c6/>; <c7/>. Ainult kaugusmõõtmise tee on muutumatu. Võrreldud Orekit { "12.2" } partii vähimruutudega { "8" } eelregistreeritud stsenaariumil: iga lävi täidetud, välja arvatud müravaba oleku kokkulangevus (≤ { "1" } cm), mis jäi täitmata { "2" } stsenaariumil { "4" }-st väärtustega { "1.46" } ja { "1.74" } cm, kui kshana on tõest { "1e-8" } m piires; registreeritud, MODELLED.

# text
seg-223f1e39669f = SP3 täpsuse kaalumine (DS-PA-06).

# text
# c1: sp3::parse_sp3_accuracy
# c2: Sp3Accuracy::position_sigma_m
seg-b5560ff1c426 = <c1/> ja <c2/> vastendavad päise ja kirjepõhised täpsuskoodid vaatluse sigmadeks; SP3-ga kaalutud Galileo sobitusvariant (Tier-2 3D RMS { "0.035" } m võrreldes kaalumata { "0.070" } m) on lisatud muutumatute registreeritud käituste kõrvale. MODELLED.

# text
# c1: .github/workflows/agency-od-validation.yml
seg-831d35c5f97e = <b>Swarm-A täiskaare käivitustöö (DS-PA-08)</b> failis <c1/>.

# text
seg-cc5e8af7cb0d = Planeetide gravitatsioon PDS SHADR tabelitest (CAP-30, CAP-31 osa).

# text
# c1: SphericalHarmonicField::from_shadr
# c2: src/gravity_pds.rs
# c3: Body::with_gravity_field
# c4: tests/fixtures/planetary_gravity/NOTICE.md
# c5: xval/planetary-gravity-pyshtools/fetch_data.sh
seg-bc9149c18ea8 = <c1/> (<c2/>) loeb Marsi GMM-3 (d/o { "120" }) ja GRAIL GL0660B (d/o { "660" }); <c3/> kinnitab mis tahes laaditud välja (vaikeväärtused muutumatud). Astme 20 kärped on kaasas (NASA PDS, avalik omand; <c4/>); täisfailid toob <c5/>. VALIDATED pyshtools { "4.14.1" } vastu ({ "4e-15" } piires kogugravitatsioonist väärtusel d/o { "120" } kogu sfääril, { "5e-14" } väärtusel d/o { "660" } korral |lat| ≤ { "60" }°); keha koordinaatsüsteemi ühendus jääb MODELLED (iga välja natiivne koordinaatsüsteem ei ole kasutatud IAU süsteem).

# text
seg-afb5fbf86ffc = Kõrge astme gravitatsioon kuni astmeni { "2190" } (RM-14, FUT-07).

# text
# c1: SphericalHarmonicField::acceleration_hf
# c2: potential_hf
# c3: prepare_high_degree
# c4: from_gfc_file
# c5: from_gfc_reader
# c6: scripts/fetch_egm2008.sh
# c7: KSHANA_EGM2008_GFC
# c8: propagator::FieldEvaluator
# c9: Geopotential
# c10: xval/
seg-28bc597b06b2 = <c1/> / <c2/> (Holmesi–Featherstone’i modifitseeritud ettepoole veerg, alatäitumiseta, polaarsingulaarsuseta), <c3/>, voogedastav ICGEM laadija <c4/> / <c5/> (normi ja maksimaalse astme kontrollid, loodete süsteem registreeritud, ajas muutuvad liikmed tagasi lükatud) ja <c6/> (täielik EGM2008, SHA-256 kindlaks määratud, ei ole kaasas; testid piiratud väärtusega <c7/>). <c8/> valib selle valikulisel <c9/>. Nõustub Orekit { "12.2" } väärtusega { "7.3e-17" } m/s² täpsusega kuni astmeni { "2190" } ja { "24" } h { "200" }×{ "200" } orbiit nõustub { "0.13" } m täpsusega. MODELLED: pyshtools jäi eelregistreeritud pooluselähedasest lävest mööda (jälgitud pyshtoolsini) ja orbiidi astme 70 tundlikkuse kontroll jäi mööda ({ "0.73" } m < { "1" } m); mõlemad on registreeritud failis <c10/>.

# text
seg-4ef4f74f21c1 = DOP853 integraator (FUT-11).

# text
# c1: integrator::integrate_dop853
# c2: integrate_dop853_checked
# c3: integrate_dop853_dense
# c4: dop853_step
# c5: dop853_initial_step
# c6: propagator::Integrator::Dop853
# c7: propagate_dop853
# c8: propagate_dop853_checked
# c9: solve_ivp(method="DOP853")
# c10: xval/dop853-scipy/
seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (7. järku tihe väljund), <c4/>, <c5/>, rikkekindla sammukaitsega; <c6/>, <c7/>, <c8/>. Vaikedraiver on muutumatu. VALIDATED SciPy { "1.18.1" } <c9/> vastu: üksiksammud { "5.6e-15" } piires, kattuvad sammujadad, lõppolekud { "1.6e-12" } piires (<c10/>).

# text
# c1: kepler
# c2: solve_kepler_markley
# c3: propagator::solve_kepler_robust
# c4: xval/kepler-mpmath/
seg-d36f657f93ad = <b>Töökindel Kepleri lahendaja (FUT-12).</b> Uus moodul <c1/>: <c2/> (Markley { "1995" } alglähend, kaotusevaba jääk) kõigi { "0" } ≤ e < { "1" } korral, mähitud funktsiooniga <c3/>. VALIDATED 50-kohaliste mpmath juurte vastu täpsusega { "0.9" } ε·|E| kuni e = { "0.999999" } (<c4/>).

# text
seg-5e82deb7c853 = Valikuline tesseraalne Maa gravitatsioon Cowelli propagaatoris (RM-09).

# text
# c1: propagator::ForceModel
# c2: geopotential: Option<Geopotential>
# c3: with_geopotential
# c4: with_egm2008(nmax)
# c5: SphericalHarmonicField
# c6: .gfc
# c7: EarthFixedFrame::Era
# c8: EarthFixedFrame::Cio
# c9: None
# c10: xval/cowell-tesseral-orekit/PREREGISTRATION.md
seg-e1a7ad42211e = <c1/> saab välja <c2/> (<c3/>, <c4/>). See hindab välja <c5/> (kaasasolev EGM2008 kuni astme/järguni { "70" } või mis tahes ICGEM <c6/>) Maaga seotud süsteemis, milleni jõutakse Maa pöörlemisnurga kaudu (<c7/>) või CIO GCRS-ist ITRS-i ahela kaudu (<c8/>). Vaikimisi <c9/>: ükski olemasolev väljund ei muutu. VALIDATED Orekit { "12.2" } Holmesi–Featherstone’i vastu { "24" } h jooksul ({ "6" } juhtu, halvim { "0.036" } m), lävedega, mis on eelregistreeritud failis <c10/>.

# text
# c1: jd2::gmst82
# c2: cio::gcrs_to_itrs_matrix_jd2
# c3: frames::teme_to_itrf_jd2
# c4: itrf_to_teme_jd2
# c5: orbit::Propagator::position_in_frame_jd2
# c6: own_jd2_utc
# c7: From
# c8: jd2::Jd2
# c9: timescales::TwoPartJd
# c10: two_part_jd = true
# c11: ephemeris
# c12: gmst82
# c13: c2t06a
# c14: f64
# c15: f64
seg-957686bb351e = <b>Kaheosalised Juliuse kuupäevad läbi Maa pöörlemise orbiiditeel</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> ja <c6/>, <c7/> teisendused tüüpide <c8/> ja <c9/> vahel ning valikuline <c10/> stsenaariumile <c11/> (ECEF, aluspinna jälg ja jaama vaade; vaikimisi väljas ja muutumatu ning võti jäetakse stsenaariumi räsist välja, kui see on väljas). Uus registririda, VALIDATED pyerfa <c12/>/<c13/> vastu (eelregistreeritud b10475ee; { "40" } kuupäeva: GMST bititäpselt identne, maatriks { "2.7e-14" } piires, pöörlemine { "1" } µs sammude korral { "1.1e-14" } rad piires, kus üksik-<c14/> tee jääb neist mööda). Cowelli jõumudeli epohh jääb üksik-<c15/>; põhjus on selle dokumentatsioonis.

# text
# c1: EopSeries::with_ls_ar_prediction
# c2: EopSeries::last_mjd
seg-0680b1f4c98b = <b>EOP ennustus väljaspool tabelit</b> (<c1/>, <c2/>): IERS Maa orientatsiooniseeria valikuline laiendus LS+AR ennustajaga, mis on antud selle viimasel real, nii et hilisema epohhi kaadriargumendid järgivad prognoosi, mitte ei kinnistu viimase rea külge. Tabelisisesed vastused on bititäpselt identsed (testitud); seeria jääb siiski viimase rea külge, kui seda ei kutsuta. Prognoosi täpsus jääb olemasolevaks LS+AR leiuks Bulletin A suhtes (MODELLED).

# text
# c1: cio::gcrs_to_cirs_matrix_with_offsets
# c2: precession_matrix
# c3: teme_to_gcrs_matrix
seg-a7d272a1ddd6 = <b>Taevapooluse nihked dX, dY CIO ahelas</b> (<c1/>) ning funktsioonide <c2/>, <c3/> ja uue funktsiooni otsesed ERFA vektorkontrollid. Uus registririda, VALIDATED pyerfa vastu (eelregistreeritud 979c1e39; { "40" } epohhi { "1950" }–{ "2100" }: pretsessioon ja CIO bititäpselt identsed, TEME→GCRS { "1.1e-10" } rad piires, kahe liikmega pööripunktivõrrandi rea ennustatud mõju). Olemasolevad funktsioonid on muutumatud.

# text
# c1: timescales::tai_minus_utc_on_date
# c2: Jd2::from_utc_calendar
# c3: jd2::utc_to_tai
# c4: jd2::tai_to_utc
# c5: dtf2d
# c6: utctai
# c7: taiutc
# c8: f64
# c9: timescales::tai_minus_utc
seg-20d19a2d65ec = <b>Enne 1972. aastat kehtinud UTC kaheosalisel ajateel</b> (<c1/> ning <c2/>, <c3/> ja <c4/> alates 1960-01-01): triivava kiirusega („kummisekundi“) ajastu, SOFA triivitabeliga, päeva lõpu murdosaliste sammudega ja päevaosa UTC-st SI-ühikutesse skaleerimisega. Uus registririda, VALIDATED pyerfa <c5/>/<c6/>/<c7/> vastu (eelregistreeritud 23c40661; { "117" } hetke { "1960" }–{ "1971" }, halvim { "2.9e-11" } s võrreldes { "1" } µs lävega). Iga { "1972" }+ tulemus on bititäpselt identne (kontrollsumma kindlaks määratud enne muudatust). Enne { "1960" } on TAI − UTC { "0" }, nagu SOFA-s. Üksik-<c8/> <c9/> on muutumatu.

# text
# c1: GlonassEphemeris::sv_clock_bias_s
# c2: −τn + γn·(t − tb)
# c3: −τn
# c4: γn
# c5: geph2clk
# c6: geph2pos
seg-3ff0d080d9e6 = <b>GLONASS-i edastatav satelliidikell</b> (<c1/>): <c2/> RINEX-i kirjest, satelliidikellalt loetud ajahetkel (kaks kindla punktiga iteratsiooni, RTKLIB-i konventsioon). Parsitud <c3/> ja <c4/> olid varem kasutamata. Uus registririda „GLONASS-i edastatav satelliidikell ja edastatava orbiidi propageerimine“, VALIDATED RTKLIB 2.4.2-p13 <c5/>/<c6/> vastu (eelregistreeritud e099c42a; { "292" } juhtu päris { "2013" } edastusfailil: kella erinevus { "0" } s, halvim asukoht { "1.1" } mm võrreldes { "1" } cm lävega). Teegi funktsioon; ükski stsenaariumi väljund ei muutu. PZ-90.11 → ITRF teisendust ei rakendata ja moodul ütleb seda.

# text
# c1: xval/ppp-time/
# c2: igs_2025055_WTZR_05m_0006.clk
seg-71ae2ee163e0 = <b>PPP ajalahend IGS jaama kella suhtes</b> ({ "0.36" }, FUT-19): float PPP filtri vastuvõtja kell jaamas WTZR nõustub IGS lõpliku kombineeritud kellaga selle jaama jaoks { "0.075" } ns täpsusega (standardhälve) ja püsiva nihkega −{ "0.66" } ns koondunud kahe tunni jooksul. Läved eelregistreeriti failis <c1/>. VALIDATED (uus registririda). Uus fikstuur <c2/>, IGS lõpliku kellafaili jaamakella kirjed, mida satelliidikellade jaoks juba kasutatakse.

# text
seg-463ac67600b1 = <b>PPP ühtivus gLAB-iga</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } käitati samadel WTZR sisenditel eraldi tööriistana (Apache-2.0 tuum; allalaadimise kontrollsumma kontrollitud avaldatud loendi vastu), menetlusliku muudatuse käsureaga, mis oli lisatud enne käitust. Esimesel registreeritud käitusel nõustuvad Kshana float PPP ja gLAB { "0.05" } m piires { "240" } epohhil { "240" }-st ja viimasel { "5.0" } mm täpsusega. SPP lävi jäi täitmata (mediaan { "1.187" } m võrreldes väärtusega { "0.50" } m) ja on registreeritud tähelepanekuna: gLAB-i ja RTKLIB-i enda SPP lahendid erinevad teineteisest { "0.852" } m võrra. Registreeritud reegel jätab seetõttu mõlema tööriista harud tervikuna täitmata, samal ajal kui PPP ühtivus kehtib.

# text
# c1: rinex::parse_nav
# c2: > EPH
# c3: parse_nav_with
seg-158717c78c80 = <b>RINEX { "4" } navigatsiooni lugemine</b> ({ "0.36" }, WP-07, PRO-41): <c1/> loeb RINEX 4.00-4.02 navigatsioonifaile (<c2/> GPS LNAV, Galileo I/NAV ja F/NAV, BeiDou D1/D2, QZSS LNAV; muud kirjed jäetakse vahele järgmise kirjepäiseni) ja <c3/> võtab valikuid. VALIDATED sama päeva IGS RINEX { "3" } ühendatud faili vastu: iga dekodeeritud väli identne ja { "0" } m asukohas. RINEX 2/3 lugemine on muutumatu.

# text
# c1: NavParseOptions::include_beidou_geo
# c2: RinexEphemeris::sv_position_ecef_bds_geo
# c3: parse_nav
seg-57aa5c6ef4f8 = <b>BeiDou GEO edastatavad asukohad</b> (valikuline): <c1/> ja <c2/> (BDS ICD, −{ "5" } kraadi kalle). <c3/> jätab GEO-d endiselt vahele. MODELLED: eelregistreeritud võrdlus täpse orbiidiga on andmetest sõltuv ja pole veel käitatud.

# text
seg-416f58111d1f = <b>RINEX { "4" } vaatlusfailid</b>: päris RINEX { "4.00" } MGEX vaatlusfail loetakse testides (MODELLED, vormingu standardi järgimine).

# text
# c1: rtk_real::run_rtk
seg-64b4664c0ff6 = <b>RTK LAMBDA-ga päris RINEX-il</b> ({ "0.36" }, WP-07 ★): <c1/>, lühikese baasjoone kahekordsed erinevused kahe sagedusega GPS koodist ja faasist float Kalmani filtri ja LAMBDA täisarvulise fikseerimisega (suhtetest). VALIDATED IGS jaamadel WTZR ja WTZZ ({ "1.4" } m teineteisest) nende ITRF2020 baasjoone vastu eelregistreeritud lävedega: fikseeritud igal epohhil pärast esimest kümmet minutit, baasjoone vea mediaan { "4.5" } mm ja 95. protsentiil { "5.5" } mm.

# text
# c1: xval/ppp-parity/run.sh
# c2: tests/ppp_parity_glab_rtklib.rs
seg-69db4437ebbb = <b>Päris andmete PPP ühtivus RTKLIB-iga</b> (RM-31): <c1/> ja <c2/> eelregistreeritud lävedega. RTKLIB v2.4.2-p13 PPP samadel WTZR sisenditel nõustub Kshana-ga { "5" } cm piires igal viimase kahe tunni epohhil ({ "9.7" } mm lõpus) kolmandal registreeringul; kaks esimest käitust, mis registreeriti tähelepanekutena, olid tahke loodete mõju väljas ja vastuvõtja antenn RTKLIB-i baasipesas. Üksikpunkti ühtivuse lävi jäi täitmata ({ "1.09" } m mediaan võrreldes väärtusega { "0.5" } m). gLAB haru pole käitatud (andmetest sõltuv).

# text
# c1: gnss_navmsg
# c2: 0101100000
# c3: 101101110000
seg-fb6e053a0a9d = <b>Navigatsioonisõnumi kodeerijad peale LNAV-i</b> ({ "0.36" }, WP-07, PRO-40): <c1/> kodeerib GPS CNAV-i (sõnumitüübid { "10" }, { "11" }, { "30" }; CRC-24Q; pidev kiirusega 1/2 K={ "7" } kodeerimine), Galileo I/NAV-i (sõnatüübid 1-5 paaris/paaritutel nominaalsetel lehtedel; 30x8 põimur; sünk <c2/>) ja Galileo F/NAV-i (lehetüübid 1-4; 61x8 põimur; sünk <c3/>), testdekoodritega. MODELLED: edasi-tagasi tsüklid ja ICD teadaolevad vastused; eelregistreeritud kontroll, et edastatavad Galileo efemeriidid asuvad kodeerija LSB ruudustikul, kehtis (halvim { "3.6e-3" } LSB), kuid jäi oma satelliitide arvu lävest mööda ({ "15" } { "20" }-st), registreeritud. Kodeerijad on teegi funktsioonid; stseeni ühendamine ei kuulu selle muudatuse hulka.

# text
# c1: ionex::parse_ionex_file
# c2: IonexFile
# c3: IonexHeader
# c4: IonexEpoch
# c5: IonexFileMap
# c6: IonexTimeInterp
# c7: 9999
# c8: iontec
seg-562f36eb18e6 = <b>IONEX failide lugeja</b> ({ "0.36" }, WP-07): <c1/> koos <c2/>, <c3/>, <c4/>, <c5/> ja <c6/>: range fikseeritud veergudega IONEX { "1.0" } lugeja, epohhidega, mis loetakse esimese kaardi päevast, <c7/> loetuna puuduvana, RMS kaartidega ning vormingu lähima, järjestikuse ja pööratud kaardi aja interpolatsioonidega; kaldtee TEC päise kihi kõrgusel. Kontrollitud lisatud sünteetilisel kaardil ja, andmetest sõltuvalt (toodud testi ajal kindlaksmääratud SHA-256-ga, ei ole koodibaasi kopeeritud), päris CODE GIM-i kärbitud osal: iga sõlm täpne; interpolatsioon vastab valemi etalonile täpsusega { "4e-13" } TECU. RTKLIB-i <c8/> nõustub { "3.6e-13" } TECU täpsusega { "6885" } punktis (eelregistreeritud B6). VALIDATED andmetest sõltuva tõendi alusel (omaniku otsus, 2026-10-13): test ebaõnnestub mis tahes kaardil peale SHA-ga kindlaks määratu.

# text
# c1: hatch::HatchFilter
# c2: pvt::assemble_epoch_precise_smoothed
seg-9fac2e8535c8 = <b>Hatchi kandelaine silumine</b> ({ "0.36" }, WP-07): <c1/> ja <c2/>, lahknemisvaba (ionosfäärivaba) vorm täpses üksikpunkti koostamises. MODELLED registreeritud tähelepanekuga: IGS jaamal WTZR langetab see üksikpunkti vea mediaani väärtuselt { "1.55" } m väärtusele { "1.12" } m ja 95. protsentiili väärtuselt { "3.47" } m väärtusele { "3.21" } m, jäädes alla eelregistreeritud { "40" } % vähendamise (allesjääv viga on nihketaoline, mitte müra).

# text
# c1: ppp_real::run_ppp
# c2: parse_antex_receiver
seg-7e4c7639d102 = <b>Float PPP päris RINEX-il</b> ({ "0.36" }, WP-07): <c1/>, staatiline float täpse punktipositsioneerimise filter päris kahe sagedusega GPS koodil ja faasil IGS lõplike toodetega (antennide nihked ja variatsioonid, tahke Maa loodete mõju, faasi mähkumine, Shapiro viivitus, hinnatud märg viivitus, tsüklilibisemise tuvastus), koos <c2/>-ga. VALIDATED suletud IGS jaamal WTZR selle ITRF2020 koordinaadi vastu eelregistreeritud lävedega: pärast { "6" } h on viga { "1.5" } mm horisontaalselt ja { "2.9" } cm vertikaalselt ning iga viimase kahe tunni epohh on { "10" } cm piires.

# text
# c1: Sp3File::clock_s
# c2: clock_nodes
# c3: ClockRinex::from_sp3
# c4: PreciseProducts
seg-173aa308e3e8 = <b>SP3 täpse kella interpolatsioon</b> ({ "0.36" }, WP-07): <c1/> ja <c2/> interpoleerivad tabuleeritud SP3 satelliidikellad lineaarselt kahe ümbritseva kehtiva sõlme vahel (halva kella sentinell jäetakse vahele) ning <c3/> annab need objektile <c4/>, nii et täpne ahel töötab ainult SP3-st. VALIDATED IGS lõplike { "30" } s kellade vastu kuupäevast 2025-02-24 eelregistreeritud lävedega: { "32" } GPS satelliiti, keskpunkti RMS { "0.121" } ns (lävi { "0.15" } ns), 95. protsentiil { "0.265" } ns (lävi { "0.30" } ns).

# text
# c1: [integrity]
# c2: integrity_fom
seg-e7c4e88d4ba4 = <b>RAIM kella holdover-i kvaliteedinäitajate kõrval</b> (CAP-05b): valikuline jaotis <c1/> kella liigis esitab eraldi ploki <c2/> (hetktõmmise RAIM eelseadistatud taevas fikseeritud asukohast: epohhipõhine otsus ja kaitsetasemed, kättesaadavus; kättesaamatu, kui GNSS on keelatud, mitte kunagi ekstrapoleeritud). Holdover-i näitajad on muutumatud; ilma jaotiseta on väljund baitidena identne. MODELLED.

# text
# c1: examples/jammertest_trust_calibration.rs
# c2: [monitors] profile = "jammertest-2024-calibrated"
# c3: xval/jammertest-trust/RESULTS.md
seg-99d9a67fc2f3 = <b>JammerTest { "2024" } põhjal kalibreeritud receiver-trust läved</b> (CAP-13): C/N0 languse, AGC ja segamisindikaatori monitoride eelregistreeritud kalibreerimine avalikul JammerTest { "2024" } andmekogumil (toodud käitusajal, mitte koodibaasi kopeeritud; <c1/>), tarnitud ainult valikulise profiilina <c2/> ({ "1.5" } dB, { "3.5" } sigmat, { "29" }). Suletud komplektil: AGC, segamisindikaatori ja liidu läved läbivad; C/N0 valehäire lävi ebaõnnestub ({ "0.023" } võrreldes väärtusega { "0.02" }), seega on rida MODELLED (<c3/>). Vaikeväärtused ja väljundid ilma profiilita on muutumatud.

# text
# c1: add_v42_subset_plan
# c2: add_v42_protection_levels_to_order
# c3: araim_subset_raim
seg-8ccd18c54b4b = <b>Mitme satelliidi ARAIM rikkehüpoteesid</b> (CAP-05a): ADD v4.2 alamhulga reegel üldistatud paaridest kaugemale (<c1/>, <c2/>; järk { "2" } on täpselt olemasolev MAAST-iga kontrollitud tee) ja valikuline täiustatud RAIM nende hüpoteeside üle (<c3/>), mis esitab suurima eraldatusega alamhulga, kui rike tuvastatakse. Eeldused, mis vajavad sügavamaid alamhulki, lükatakse tagasi, mitte ei kärbita. MODELLED.

# text
# c1: [skyline]
# c2: sky-blocked
# c3: behind_skyline
# c4: open_fraction
# c5: geometry
# c6: environment
# c7: natural-degradation
# c8: scenarios/training/fjord-natural-degradation.toml
seg-02f1f2d72263 = <b>Silmapiir vastuvõtja usalduses</b> (FUT-01): receiver-trust seanss võib esitada väärtuse <c1/>; selle taha jäävad satelliidid on taevast kaotatud (<c2/>, <c3/>, <c4/>) ja nende kaod liigitatakse <c5/>, mitte kunagi <c6/>; ilma selleta on asimuudilünga tagavara ja iga väljund nagu varem. Meeskonnakoolituse generaator saab sündmuse <c7/> (blokeeritud taevas, mitte häire) ja stsenaariumi <c8/>. UERE x DOP Monte Carlo saab projekteerimismärkme kaks maskeeritud silmapiiri geomeetriat, eelregistreeritud eraldi: kõik { "26" } kontrolli läbivad.

# text
# c1: kshana::evidence::tsa::verify_token
# c2: kshana evidence verify --tsa-ca <anchors.pem>
# c3: timestamp.tsr
seg-69fa2ecdc4e9 = <b>RFC { "3161" } ajatempli kontroll</b> (CAP-14): <c1/> kontrollib ajatempli märgi allkirja (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 ja P-384), selle ESS allkirjastamissertifikaadi sidumist, allkirjastaja timeStamping kasutust ja selle ahelat usaldatud ankruni märgi genTime hetkel, võrguühenduseta; <c2/> rakendab seda paketi failile <c3/> (valikuline; ilma selleta on aruanne muutumatu). VALIDATED, kitsalt: kõik { "27" } ise genereeritud juhtu nõustuvad OpenSSL { "3.0.13" } otsuse ja genTime osas, enne kontrollija kirjutamist eelregistreeritud võrdluse all. Tühistamist ei kontrollita.

# text
# c1: figure_tiers
# c2: api::without_figure_tiers
# c3: lunar-station-coverage
# c4: figure_tiers
# c5: leo-ppp
# c6: solar-system
# c7: sweep
# c8: sweep-nd
# c9: lunar-attack-surface
seg-1b7777e600a8 = <b>Näitajapõhised kontrollitasemed iga liigi jaoks</b> (RM-04): iga stsenaariumi liigi tulemus lõpeb nüüd plokiga <c1/>, mis nimetab selle põhinäitajad, iga näitaja omava kontrollimaatriksi rea ja sellelt realt loetud taseme (näitajad, mida ükski rida ei oma, on loetletud tasemeta). Plokk lisatakse pärast käitust ja see eemaldub tagasi eelmiseks dokumendiks bait baidi haaval (<c2/>). Liigil <c3/> puudub <c4/>, kuni uus dateeritud ennustus asendab selle külmutatud oma; liikidel <c5/>, <c6/>, <c7/> ja <c8/> pole skalaarset põhinäitajat ja <c9/> kirjutab kompaktset JSON-i. Kampaania liikmed säilitavad oma tasemeta dokumendid.

# text
# c1: quantum-cai-coast
# c2: [accel_quantum.cai]
seg-54aec3e311cf = <b>Kvanteelseadistus <c1/></b> (CAP-08c): kaasasolev inertsiaalne stsenaarium, milles külmaatom-interferomeetri kiirendusmõõtur, mis on määratletud interferomeetri füüsikaga (<c2/> platvormi vibratsioonitasemega), liigub inertsi mööda navigatsioonikvaliteediga kvartskiirendusmõõturi vastu 110-minutilise GNSS-i katkestuse jooksul. MODELLED.

# text
# c1: allan::edf_greenhall
# c2: assurance::uncertainty
seg-21d2b7fd2a21 = <b>Greenhalli täpne ekvivalentsete vabadusastmete arv</b> (CAP-03): <c1/>, täielik Greenhalli ja Riley ({ "2003" }) algoritm (vahede järgud { "1" } kuni { "3" }, müra eksponendid +{ "2" } kuni -4, kattuv ja mittekattuv, modifitseeritud ja modifitseerimata, suurte J tabelitega), ADEV, MDEV ja HDEV ümbristega. VALIDATED eelregistreeritud võrdlusega allantools { "2024.6" } vastu: { "4 876" } ruudustikupunkti { "6.0e-13" } suhtelise vea piires; allantools ebaõnnestub { "32" } täiendaval punktil, mis registreeritakse ilma etaloniväärtuseta. Funktsiooni <c2/> usaldusvahemikud on muutumatud bitt bitilt.

# text
# c1: src/inertial/cai_error_terms.rs
# c2: docs/QUANTUM-MODELS.md
seg-8e04ebc15045 = <b>Külmaatom-interferomeetri veaosad</b> (RM-26/27/28): Ramani laseri faasimüra (koos tagasipeegelduse viivituse liikmega), termilise pilve lainefrondi kõveruse nihe (puhas defookus, tuvastusraadiusega) ja interferentsimustri mitmetähenduslikkuse lahendamine (klassikalise abiga ja kaks küsitlusaega), teegi funktsioonidena failis <c1/>, igaüks suletud kujul kontrollitud kvadratuuri või Monte Carlo vastu. MODELLED; pole veel stsenaariumi liigist kättesaadav (<a1><c2/></a1>).

# text
# c1: src/clock_log.rs
# c2: [series.clock_log]
# c3: [clock_log]
# c4: measured
# c5: docs/CLOCK-LOG-FORMATS.md
seg-7d2899c3173b = <b>Kellalogide vormingud</b> (RM-03): <c1/> loeb RINEX-i kellafaile, TimeLab-stiilis ASCII faasi- või sagedusloge ja TAPR TICC loenduri loge üheks normaliseeritud faasiseeriaks (tau0 antud või leitud, lüngad loetud, lünga poliitika). Valikuline: telekommunikatsiooni ajastuse seeria võib nimetada logi (<c2/>) ja kellastsenaariumi tabel <c3/> lisab ploki <c4/> (ADEV, TDEV, MTIE). Ilma tabelita on mõlemad liigid baitidena identsed (<a1><c5/></a1>). Eelregistreeritud võrdlus kolmel sünteetilisel logil täitis oma faasi- ja ühenduslävi; hinnangualgoritmid nõustuvad allantools-iga { "2.5e-14" } piires kõikjal, kus see hindab, ja see ei hinda kogu kirje MTIE punkti (registreeritud). MODELLED.

# text
# c1: telecom-timing
# c2: scenarios/telecom-synce-eec.toml
seg-53369a5c3749 = <b>Sageduse sünkroniseerimise triivimaskid</b> (RM-01): liik <c1/> saab seitse püsitemperatuuri MTIE ja TDEV triivi genereerimise maski, ITU-T G.811 PRC, G.812 tüübid I kuni III, G.8262 EEC valikud { "1" } ja { "2" } ning G.8262.1 eEEC, astmefunktsiooni osadega, mida tabelid kirjutavad, ja etalonstsenaarium <c2/> (vabalt töötav OCXO EEC maskide vastu: see ebaõnnestub väärtusel { "1 000" } s, kus töö peab tegema ahel). Iga rida loeti uuesti itu.int tekstiga; G.812 (06/2004) on asendatud eelavaldatud 08/2026 väljaandega, mida ei õnnestunud lugeda. MODELLED (ümberkirjutus); olemasolevad maskid ja väljundid on muutumatud.

# text
# c1: gnss-ins
# c2: [imu_*.filter_prior]
seg-5e84b35ee4e7 = <b>Filtri eeljaotuse juhis liigile <c1/></b> ({ "0.36" }, WP-09, RM-21 tähelepanek): paketi vaikefiltri eeljaotus sobib taktikalise klassi IMU-le. Navigatsiooniklassi IMU-ga võib vaikeväärtus muuta liidetud inertsi mööda liikumise halvemaks kui vaba INS: { "52" } m võrreldes väärtusega { "11" } m { "70" } m/s lennuki profiilil. <c2/> tuleb seada anduri klassile vastavaks, nagu uued mere-, raudtee- ja lennunduspaketid teevad. Ükski kaasasolev stsenaarium ei seo navigatsiooniklassi IMU-d vaike-eeljaotusega: igaühel, mis kasutab vaikeväärtust, on kiirendusmõõturi jääknihked vähemalt { "0.015" } m/s². Ainult dokumentatsioon; ükski väljund ei muutu.

# text
# c1: kshana bench-export
# c2: xval/testbench-gpssdrsim/
# c3: docs/TEST-BENCH.md
seg-f74b3c265f3a = <b>Katsepingi eksport kontrollitud simulaatori enda lugejatega</b> ({ "0.36" }, WP-09, CAP-16): { "8" } kaasasoleva stsenaariumi <c1/> liikumisfailid loeti tagasi gps-sdr-sim NMEA, laius/pikkus/kõrgus ja Maaga seotud liikumise lugejatega (MIT, kommit 28ca29a6, kasutatud eraldi tööriistana kaudu <c2/>; ühtki signaalifunktsiooni ei kutsuta). Need tagastavad eksporditud trajektoori täpsusega { "1.2" } mm, { "0.15" } mm ja täpselt. TÄHELEPANEK: selle simulaatori Maaga seotud lugeja ei suuda võtta täislaiust CSV-d, sest selle 100-märgiline reapuhver lõhub iga rea. <c3/> annab nüüd kasutatavad veerulõiked ja simulaatori { "300" } s piirangu. VALIDATED (uus registririda); ekspordi baidid on muutumatud.

# text
# c1: fusion::kfgins
# c2: xval/kfgins/PREREGISTRATION.md
seg-e77e1ac87dd5 = <b>GNSS/INS KF-GINS andmekogumil</b> ({ "0.36" }, WP-09, FUT-17): <c1/> laadijad ja jooksutaja ning kangivarre mõõtmismudel suletud ahelaga EKF-is. KF-GINS demo andmekogumil (toodud testi ajal, mitte koodibaasi kopeeritud) on Kshana horisontaalne RMS etalontrajektoori suhtes { "1.09" } cm võrreldes KF-GINS-i enda { "1.11" } cm-ga ja iga eelregistreeritud lävi pidas. VALIDATED andmetest sõltuva tõendi alusel (omaniku otsus, 2026-10-13): andmekogum tuuakse SHA-256 kindlaksmääramistega ja reprodutseerimistee on failis <c2/>.

# text
# c1: fusion
# c2: [coupled]
# c3: fusion::coupled::CoupledPntBiasFilter
# c4: fusion::coupled::CoupledPnt3d
# c5: fusion-pnt-coupled
# c6: fusion
# c7: hybrid
# c8: hybrid
seg-4d5a503c5c9c = <b>Seotud PNT filter liitpaketis</b> ({ "0.36" }, WP-09, FUT-16): liik <c1/> võtab valikulise tabeli <c2/>, mis käitab ühe virnastatud filtri pseudovahemaadel kiirendusmõõturi nihke olekuga (<c3/>), ja <c4/> on 3-D 8-olekuline versioon. Uus kaasasolev stsenaarium <c5/>: nihkega kiirendusmõõturite korral hoiab seotud režiim kvantkomplekti asukoha täpsusega { "18.7" } m (95. protsentiil) täieliku terviklikkusega, kus lahtisidestatud filtrid jõuavad väärtuseni { "430" } m. Ilma tabelita on nii <c6/> kui ka <c7/> muutumatud (kindlaks määratud); <c8/> keeldub tabelist. MODELLED.

# text
# c1: gnss-ins-maritime
# c2: gnss-ins-rail
# c3: gnss-ins-aviation
# c4: [tight]
# c5: gnss-ins
# c6: [tight]
seg-b7f07e3693df = <b>Mere-, raudtee- ja lennunduse GNSS/INS paketid</b> ({ "0.36" }, WP-09, RM-21): kaasasolevad stsenaariumid <c1/>, <c2/> ja <c3/> trajektooriteegil ning valikuline tabel <c4/> liigile <c5/>, mis liidab SGP4 Walkeri konstellatsiooni pseudovahemaad (kõik satelliidid nominaalselt, kõrgeimad mõned halvenenult). Raudteepaketil hoiab tihe sidestus navigatsiooniklassi lahendi täpsusel { "5.3" } m läbi lõike ja tunneli, võrreldes lõdva sidestusega { "12.9" } m. Ilma <c6/> on pakett muutumatu (kindlaks määratud). MODELLED.

# text
# c1: fusion::carrier_tc
seg-0daf8b2646ad = <b>Kandelaine faasi tihe sidestus</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, veaoleku EKF selgesõnalise kaheolekulise vastuvõtja kella ja float kandelaine mitmetähenduslikkustega, mida juhib SGP4 Walkeri konstellatsioon Klobucharide ja Saastamoineni parandustega mõõtmisahelas, aja järgi diferentseeritud kandelaine libisemise tuvastuse ja mitmetähenduslikkuse taasalgatamisega ning ainult koodil põhinev käitus samadel mõõtmistel võrdluseks. MODELLED: figure-8 sõidul on kandelaine lahend { "2.5" } cm võrreldes ainult koodiga { "47" } cm ning NIS/NEES on algväärtuste lõikes kooskõlalised.

# text
# c1: gnss-ins
# c2: [trajectory]
# c3: profile = "straight" | "figure8" | "stop_go" | "aircraft" | "uas" | "csv"
# c4: csv
# c5: t, lat, lon, alt, vn, ve, vd, roll, pitch, yaw
seg-7032646c0bc4 = <b>GNSS/INS trajektooriteek</b> ({ "0.36" }, WP-09, RM-24): liik <c1/> võtab valikulise tabeli <c2/> väärtusega <c3/>. Profiilid käsutavad Euleri kiirusi ja piki-rada kiirendust tõe olekust ning tuletavad tõelise IMU jäiga keha kinemaatikast (koordineeritud pöörded, tõusud, Coriolis); <c4/> impordib tõese trajektoori (<c5/>) ja lahendab IMU, mis seda reprodutseerib. Ilma tabelita lendab pakett oma ajaloolise sõidu, bitt bitilt (kindlaks määratud). MODELLED.

# text
# c1: [terrain] dem_tile_path
# c2: realdata::lola_dem
# c3: dem_path
# c4: lunar-station-coverage
# c5: moonlight-service-volume
# c6: terrain.dem_tile
# c7: realdata::lola_dem
seg-e6b31bf61185 = <b>Laius/pikkus DEM lahtrid Kuu silmapiiri jaoks</b>: <c1/> loeb <c2/> tekstilahtri (kõrgused keskmise sfääri kohal laius/pikkus ruudustikul) polaarse stereograafilise <c3/> asemel, nii liigile <c4/> kui ka <c5/>; aruanne kordab lahtrit (<c6/>, koos selle SHA-256-ga). <c7/> on nüüd ühendatud silmapiiri kiirmarssi. Lahter, mis on uuesti diskreteeritud kaasasolevast väljalõikest, annab jaamale väljalõike silmapiiri täpsusega { "0.22" } kraadi. MODELLED.

# text
# c1: terrain
# c2: moonlight-service-volume
# c3: clears_terrain
# c4: export_site_terrain
seg-0c7ebb6c7d0d = <b>Maastik teenindusmahu ekspordi asukohas</b>: jaotisega <c1/> kannab iga rida liigi <c2/> satelliidipõhises geomeetriaeksportis välja <c3/> (satelliit ületab lameda maski ja ekspordi asukoha silmapiiri oma asimuudil), aruanne kannab asukoha silmapiiri (<c4/>) ja käitusaja CSV saab veeru. Ilma maastikuta on eksport muutumatu. MODELLED.

# text
# c1: kshana::api::HEADLINE_FIELDS
# c2: field_importance_json()
# c3: field_importance()
# c4: jammers[].eirp_dbw
# c5: tests/field_importance.rs
seg-7c8789777c26 = <b>Põhiväljad mootorist</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> ja WebAssembly <c3/> määravad kaheteistkümne liigi jaoks, millised stsenaariumi väljad vastavad selle küsimusele, parim esimesena, punktiiriga teedena (<c4/>). Studio loeb need enne oma järjestust. Ainult kuvamise metaandmed: mootor ei loe neid kunagi, ükski stsenaariumifail ei vaja neid, ükski tulemus neist ei sõltu. <c5/> ebaõnnestub, kui liiki ei saa käivitada või teed ei leita ühestki liigi kaasasolevast stsenaariumist (see tabas kahte teed, mille Studio lamendatud id-d olid kirjutanud ilma massiivi nurksulgudeta).

# text
# c1: kshana::api::KIND_MODULES
# c2: kind_modules_json()
# c3: kind_modules()
# c4: tests/kind_modules.rs
seg-7528700924b2 = <b>Liigi-mooduli tabel mootorist</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> ja WebAssembly <c3/> annavad iga stsenaariumi liigi kohta, mille kontrollimaatriksi read nimetavad muud moodulit kui selle enda, moodulite nimed. Studio võimekuskaart kasutas oma käsitsi kirjutatud koopiat; <c4/> ebaõnnestub, kui tabelis olevat liiki ei saa käivitada või moodul ei esine ühelgi maatriksireal. Ükski väljund ei muutunud.

# text
# c1: iq_signals()
# c2: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
# c3: iq::cli
# c4: iq::scene::synthetic
# c5: iq::signals::by_name
# c6: web/smoke.mjs
# c7: tests/fixtures/iq_short_golden.json
seg-af7d28b7fb0e = <b>Lühike IQ käitus brauseriehituses</b> ({ "0.36" }): <c1/> ja <c2/> WebAssembly moodulis ehitavad sünteetilise stseeni, hõivavad iga satelliidi ja jälgivad hõivatuid, kõik mälus, piiratud väärtustega { "0.25" } s, { "1 000 000" } valimit ja { "8" } satelliiti. Stseeniehitaja ja signaali nime järgi otsing viidi ainult natiivsest <c3/> välja (väärtustesse <c4/> ja <c5/>), nii et mõlemad ehitused jagavad neid; käsurea väljund on muutumatu. Natiivne test ja <c6/> võrdlevad sama päringut ühe kuldse väärtusega (<c7/>), bait baidi haaval: alates portatiivse matemaatika muudatusest (STUDIO-15, allpool) annavad brauseriehitus ja natiivne ehitus samad bitid.

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: ErrorKind
# c4: ProvenanceClass
# c5: KindMeta
# c6: FieldUnit
# c7: scenario_kinds()
# c8: error_kind()
# c9: run_typed
# c10: RunOutput
# c11: data
# c12: scenario_kinds
# c13: KindMeta[]
# c14: kshana.d.ts
# c15: error_kind
# c16: ErrorKind | ""
# c17: tests/typed_api_sync.rs
seg-c0eab9b97b7d = <b>Tüübitud Pythoni ja TypeScripti API-d</b> (CAP-34): <c1/> annab tüübid suletud sõnavarale (<c2/>, iga liigi nimi; <c3/>; <c4/>) ning sõnastikele <c5/> ja <c6/>; <c7/> ja <c8/> tagastavad need. WebAssembly pakett lisab <c9/> (üks käitus tüübitud objektina <c10/> parsitud dokumendiga kui <c11/>) ja <c12/> (parsitud <c13/>) ning selle <c14/> kannab sama sõnavara; <c15/> on tüübitud kui <c16/>. <c17/> hoiab mõlemad loendid mootori omadega võrdsed.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: key_units
# c4: metric_units
# c5: unit
# c6: null
# c7: points[].coords[]
# c8: points[].metrics[]
seg-b097c2f105c3 = <b>Ühikud iga <c1/> veeru jaoks</b> (FUT-28): tulemus <c2/> kannab nüüd väärtusi <c3/> ja <c4/>, iga pühitud võtme ja iga registreeritud mõõdiku ühikut, loetuna pühitud paketi enda ühikutabelist. Telg võib deklareerida <c5/> võtmele, mida pakett ei kordu; deklareeritud ühik, mis on vastuolus paketi omaga, lükatakse tagasi, ning ühik, mida kumbki ei anna, on <c6/>, mitte kunagi ära arvatud. <c7/> ja <c8/> on kirjeldatud, nii et kõik { "76" } liiki on nüüd väljaühikute värava poolt täielikult kaetud (katmata liikide lagi { "1" } -> { "0" }).

# text
# c1: RunOutput
# c2: RunOutput
# c3: array(path)
# c4: columns(path)
# c5: series()
# c6: numpy.ndarray
# c7: numpy.asarray
# c8: data()
# c9: kshana.pyi
seg-3a83af8daa43 = <b>NumPy massiivid objektist <c1/></b> (FUT-26): Pythoni <c2/> saab <c3/>, <c4/> ja <c5/>, mis tagastavad objekte <c6/> arvulise loendi, kirjete loendi arvuliste veergude või dokumendi iga kirjeseeria jaoks. Iga massiiv võrdub väärtusega <c7/> samadest väärtustest objektist <c8/> (dtype ja bitid). NumPy imporditakse ainult siis, kui üht neist kutsutakse, ning see jääb käitusnõuetest välja. Tüübitud failis <c9/> ja kontrollitud stubtestiga.

# text
# c1: campaign
# c2: [optimize]
# c3: trace
# c4: scenarios/campaign-optimize-link-budget.toml
# c5: docs/design/evidence/cap32-optimize/
seg-1c7a22dabad3 = <b>Kampaania optimeerija</b> (CAP-32): liigi <c1/> uus valikuline jaotis <c2/> otsib ühe kuni kolme stsenaariumi võtit fikseeritud piirides ühe mõõdiku parima väärtuse jaoks: minimeeri, maksimeeri või saavuta sihtväärtus. See otsib ammendavalt ruudustikul või deterministliku piiratud Nelderi–Meadi simpleksiga. Iga hindamine on nimetatud liigi päris käitus ja on loetletud tulemuse väljal <c3/>. Näide: <c4/>. Läved eelregistreeriti (<c5/>):

# text
seg-f4e79236b6bf = Rosenbrocki funktsioon on täidetud (f* = { "1.7e-20" });

# text
seg-3dbe3fdfebcf = suletud kujuga 1-D sihtlahend on täidetud ({ "6e-15" } suhteline);

# text
seg-5ab478e03354 = ruudustik on bitivõrdne sõltumatu jõumeetodiga;

# text
seg-ea0a04c6e713 = simpleks saab vähemalt sama hästi hakkama kui { "41" } × { "41" } ruudustik { "177" } käitusega.

# text
seg-161d8c5b55e8 = Vooru { "1" } 1-D lävi on registreeritud kui NOT MET, sest eelregistreeritud kast jättis lahendi välja. MODELLED; registririda „Ühe mõõdiku piiratud optimeerimine kampaania parameetrite üle“. Additiivne: jaotiseta kampaaniad on muutumatud.

# text
# c1: docs/CALIBRATION-ENSEMBLES.md
# c2: gen_calibration_ensembles
# c3: docs/data/calibration-ensembles.csv
seg-83d40a636fcb = <b>Kalibreerimisansamblid</b> (CAP-10): kolm üksiku algväärtusega kontrolli, mis on käitatud uuesti { "200" } sõltumatu algväärtuse (seed) üle eelregistreeritud lävede vastu, failis <a1><c1/></a1> (genereeritud skriptiga <c2/>; algväärtuse kaupa väärtused failis <c3/>).

# text
seg-b163e53e06e9 = Kampaania Monte Carlo alglaadimise { "95" } % vahemik katab tõelise keskmise { "192" } ansamblil { "200" }-st ja selle hii-ruut kontroll läbib { "196" } ansamblil.

# text
seg-022a7fbee13a = Üksiku algväärtusega protsentiili tolerants läbib ainult { "183" } ansamblil { "200" }-st: NOT MET, nagu ennustatud. See on umbes 2-sigma lävi, registreeritud ja mitte lõdvendatud.

# text
seg-096f36d21b02 = Valge-FM ADEV kalibreerimised läbivad igal algväärtusel, nende halvim viga jääb tolerantsi piirist kaugele alla.

# text
# c1: Scenario
# c2: BuiltinKind
# c3: api::BuiltinKind
# c4: append_figure_tiers
# c5: inertial
# c6: spoof
# c7: passes
# c8: link-budget
# c9: jamming
# c10: tests/scenario_output_manifest.rs
seg-369c7f2a115c = <b>Sisseehitatud liigid tunnusjoone <c1/> kaudu</b> (FUT-27, pooleli): tunnusjoon <c2/> (<c3/>, näitajapõhise taseme konksu ja <c4/>-ga) ning esimesed liigid, mis on sellele üle viidud (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). Väljund on muutumatu: kogu kataloogi manifest iga väljundi SHA-256-st on enne ja pärast identne (<c10/>).

# text
# c1: tests/playground_no_fetch.rs
seg-fd6e68ff5e5d = <b>Mänguväljaku mittetoomise kontroll</b> (RM-07): <c1/> kontrollib kolme asja:

# text
seg-3e424188f6e1 = iga Studio teegi stsenaarium on brauseripaketis;

# text
# c1: scenarios/
seg-2803ccf8b9ae = pakett on baitidena identne asukohaga <c1/>;

# text
seg-b98016a4a844 = iga brauseristsenaarium käitub tühjast töökataloogist.

# text
# c1: gravity-map
# c2: [reference]
# c3: .gfc
# c4: gfc_path
# c5: gps-denied-gravity-nav-egm2008
# c6: [map_error_mc]
# c7: gravity-map-error-mc
# c8: combined-altpnt
# c9: [magnetic_grid]
# c10: csv_path
# c11: column
# c12: tools/fetch_emag2_tile.py
# c13: altpnt::sequential::run_sequential_trn_on_map
# c14: xval/terrain-slam-rbpf/
# c15: terrain-slam
# c16: xval/srtm-ungate/
seg-efc143b4f2a9 = <b>Alt-PNT kaardid: päris gravitatsiooniväli, kaardivea Monte Carlo, täislahutusega SRTM</b> ({ "0.36" }, WP-10). Liik <c1/> võtab valikulise <c2/>: gravitatsioonianomaalia, mis on sünteesitud kaasasolevatest EGM2008 koefitsientidest (või ICGEM <c3/> failist käsu <c4/> kaudu, ainult natiivsed ehitused). See süntees nõustub ICGEM Calculation Service’iga umbes { "1e-8" } mGal täpsusega { "794" } sõlmes kahes piirkonnas, eelregistreeritud lävede { "0.005" } mGal RMS ja { "0.02" } mGal max vastu (VALIDATED; registririda „Gravitatsioonianomaalia süntees sfäärilise harmoonilise mudeli põhjal“). Uus kaasasolev stsenaarium <c5/> käitab 60-minutilise etalonülesande sellel päris astme 70 väljal. Eelregistreeritud tulemus: sobitatud viga { "3106" } m, seega lävi < { "500" } m on NOT MET, nagu ennustatud (aste { "70" } on liiga sile), ja triivi kümnekordne vähendamine on MET (MODELLED). Valikuline <c6/> käitab etalonülesande uuesti algväärtustatud, Gaussi korrelatsiooniga kaardivigade üle ja esitab sobitatud vea jaotuse (kaasasolev stsenaarium <c7/>). Uuriv ja eelregistreerimata: kui kaardiviga on { "2" } mGal, korreleeritud { "0.2" } kraadi ulatuses (suurus, mida sobitaja enda sigma arvestab), jääb { "1" } realisatsiooni { "20" }-st { "500" } m piiresse (mediaan { "2.9" } km, p95 { "14.7" } km), võrreldes { "144" } m täiusliku kaardiga. Sünteetilise etalonülesande alla 500 m fiks eeldab, et kaart on täpne. Ilma kummagi valikuta on dokument baitidena identne varasemate väljalasetega. <c8/> võtab valikulise <c9/> (<c10/>, <c11/>), mis loeb magnetkanali EMAG2v3 vormingus CSV-st. EMAG2 ei ole koodibaasi kopeeritud, sest selle tingimused ei ole selged: <c12/> toob selle kindlaksmääratud SHA-256-ga ja kärpib kasti. Päris EMAG2 ruudustikul ei väideta ühtki navigatsioonitulemust. Ühine kaardihinnang (maastiku SLAM, RM-18): <c13/> lennutab järjestikuse maastikunavigaatori salvestatud kaardi kohal, mis erineb tõest, kas usaldades seda või hinnates raku kaupa kaardikorrektsiooni FastSLAM-stiilis Rao-Blackwellised filtriga. Eelregistreeritud teadaoleva kaardi SITAN-i vastu { "15" } m korreleeritud kaardivea korral { "20" } algväärtusel: { "1.5" } % keskmine kasu, parem { "10" } juhul { "20" }-st, seega mõlemad paranduslävid on NOT MET ({ "10" } % ja { "12" } { "20" }-st), ilma kahjuta täiusliku kaardi korral (MET). Üksik läbimine ilma taaskülastusteta ei lase kaarti õppida (<c14/>, MODELLED). Dokumendid <c15/> on baitidena identsed. Päris SRTM-i testid käivituvad nüüd CI-s kahel lisatud täislahutusega väljalõikel; kõik eelregistreeritud läved on täidetud, lähim sõlm võrdub GDAL { "3.8.4" } väärtusega { "8" } punktil { "8" }-st (<c16/>).

# text
seg-aa7ac7a47111 = <b>Koostalitlus, WP-08</b> ({ "0.36" }; iga punkt eelregistreeritud ja lisatud eraldi enne selle sõltumatu etaloni käitust, igaüks uus VALIDATED registririda, välja arvatud telemeetria punkt, mis laiendab olemasolevat rida):

# text
# c1: src/odm.rs
# c2: OmmMessage::from_omm_file
# c3: OmmFile::to_omm_kvn
# c4: ELEMENT_SET_NO
# c5: COMMENT
# c6: BTERM
# c7: BSTAR
# c8: META_START
seg-a5d0b22337d7 = <b>CCSDS orbiidiandmete sõnumid</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 ja OCM { "3.0" } (TRAJ, PHYS, COV, MAN, USER plokid) kirjutatud ja loetud KVN-is ja NDM/XML-is ning täistäpsusega OMM SGP4 elementide komplektist (<c2/>); väljund <c3/> on muutumatu. Orekit { "13.1.8" } vastu mõlemas suunas: { "27" } Kshana sõnumit { "30" }-st parsitakse Orekitis ja Kshana loeb iga Orekiti kirjutatud sõnumi, väärtused { "1e-14" } suhtelise vea ja epohhid { "1e-9" } s piires; neli tähelepanekut kindlaks määratud (Orekit nõuab <c4/>, keeldub <c5/> XML-i kasutaja määratud parameetrites, ei kirjuta <c6/> ilma <c7/>-ta ning loeb OCM suhtelisi epohhe TDB all SI sekundites). Pärand-OMM kirjutaja <c8/> lükatakse Orekiti poolt tagasi (registreeritud). Rida „CCSDS orbiidiandmete sõnumid (OPM, OMM, OCM)“.

# text
# c1: src/adm.rs
# c2: src/ndm_xml.rs
# c3: MAN_DELTA_MASS
seg-39c70cb59f31 = <b>CCSDS asendiandmete sõnumid</b> (<c1/>, <c2/>): AEM 2.0/1.0 ja APM { "2.0" } KVN-is ja XML-is Orekit { "13.1.8" } vastu, iga lävi täidetud; Orekiti APM kirjutaja keeldub manöövrist ilma <c3/>-ta (kindlaks määratud). Rida „CCSDS asendiandmete sõnumid (AEM, APM)“.

# text
# c1: src/spk_writer.rs
seg-bdfce382a98c = <b>SPICE SPK eksport</b> (<c1/>): SPK tüüpide { "9" } ja { "13" } kirjutaja ja lugeja ning OEM-ist SPK ekspordini; CSPICE N0067 vastu on tuumad baitidena identsed SPICE-i omadega ja hindavad bititäpselt identselt. Rida „SPICE SPK eksport (tüübid { "9" } ja { "13" })“.

# text
# c1: src/spk_writer.rs
seg-ce217acb9fe7 = <b>SPICE SPK tüübid { "3" } ja { "21" }</b> (<c1/>): tüübi { "3" } (Chebyshev) ja tüübi { "21" } (laiendatud vahejooned) segmendid, kirjutatud antud kirjetest ja hinnatud nii nagu SPICE seda teeb; CSPICE N0067 vastu on tuumad baitidena identsed SPICE-i omadega ja iga hinnang nõustub bitt bitilt mõlemas suunas. Rida „SPICE SPK tüübid { "3" } ja { "21" } (Chebyshev, laiendatud vahejooned)“.

# text
# c1: src/space_packet.rs
# c2: crc_hqx
seg-72b8edbc74dc = <b>Space Packet laiendused</b> (<c1/>): teisene päis CUC/CDS ajakoodidega, paketi veakontroll, segmenteerimine ja voo kontrollid, ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } ja CPythoni <c2/> vastu, null lahknevust. Rida „CCSDS Space Packeti teisene päis, paketi veakontroll ja segmenteerimine“.

# text
# c1: class
# c2: check metrics
seg-c5fcf933b656 = <b>Telemeetria skeem { "1.3" } päris tarbijate kaudu</b>: sünteetilise skeemi 1.3 voo Prometheuse eksposeering ja OTLP/HTTP JSON, sh geomeetriaseeria ja silt <c1/>, loetud täpselt prometheus_client ja OTLP prototüübiga, vastu võetud promtool { "3.5.0" } <c2/> poolt ilma lint-probleemita ning edastatud muutmata OpenTelemetry Collector contrib { "0.135.0" } kaudu (andmetest sõltuv: tööriistad toodud kindlaksmääratud SHA-256-ga, väljundid lisatud).

# text
# c1: mars_od::fit_damped
# c2: xval/mro-od/PREREGISTRATION-RUN2.md
# c3: docs/revisions
seg-013344665417 = <b>Marsi orbiidi määramine, käitus { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> skaleerib normaalmaatriksi selle diagonaaliga ja summutab sammu (Levenberg-Marquardt), pärast seda, kui registreeritud Gauss-Newtoni sobitus ebaõnnestus maatriksil, mille toordiagonaal hõlmab kaheksa suurusjärku. Registreeritud eraldi (<c2/>, sama kaar, läved ja redigeerimine). Hinnatud MRO läbimistel on orbiit { "0.36" } km RMS ({ "0.53" } km maksimum) piires MRO navigatsiooni rekonstruktsioonist, läved täidetud. Sobituse järgne Doppler on { "48.6" } mHz võrreldes lävega { "30" } mHz, täitmata (tähelepanek kindlaks määratud). Ainult hindamise muudatus R2-A1 on avalikustatud failis <c3/>. Rida jääb MODELLED.

# text
# c1: mars_od
# c2: naif_kernel
# c3: gravity_sh::from_shadr
# c4: scripts/fetch_mro_od.sh
seg-fee311480417 = <b>Marsi rampitud 2-suunalise Doppleri mudel ja orbiidi määramine</b> ({ "0.36" }, WP-14, CAP-30 osa, etapp { "2" }): <c1/> ennustab DSN rampitud X-riba 2-suunalist Dopplerit ODF-i rampitabelitest (valgusaeg, Shapiro, troposfäär, jaama aeg, DSN jaamad CIO ahela ja IERS EOP kaudu) ja sobitab Marsi orbiidiaparaadi (GMM-3, kolmandad kehad, SRP, õhutakistus). <c2/> loeb SPK tüüpi { "1" } (kontrollitud CSPICE vastu) ja <c3/> loeb PDS SHADR välju. Eelregistreeritud MRO navigatsiooni rekonstruktsiooni vastu päris MRO läbimistel (andmetest sõltuv, <c4/>, igakuine CI): ennustatud Doppler nõustub vaatlustega { "12.5" } mHz täpsusega (lävi { "30" } mHz, täidetud); registreeritud orbiidi sobitus ebaõnnestus hinnatud kaarel ega andnud orbiiti (tähelepanek kindlaks määratud). Rida jääb MODELLED.

# text
# c1: odf::parse_odf
seg-d8212aa309ef = <b>DSN orbiidiandmete faili lugeja</b> ({ "0.36" }, WP-14, CAP-30 osa): <c1/> loeb TRK-2-18 ODF-e. Päris Mars Reconnaissance Orbiteri ODF-il (NASA PDS, kaasasolev) vastab lugeja PDS sildi kirjete arvule, rühmade asukohtadele, jaamadele ja aegadele ning kõik selle andmetüübid on teada. Sildi faililõpu tabel on ühe rea võrra faili omast lühem, sildi ebakõla, mis on registreeritud tähelepanekuna. MODELLED. Orbiidi määramist nendel andmetel pole veel tehtud.

# text
# c1: time-transfer-budget
seg-bf26920a50bc = <b>TWSTFT eelarve ja aja edastamise stabiilsus: liik <c1/></b> ({ "0.36" }, WP-14, FUT-19).

# text
seg-6038e0d04f89 = Kahesuunaline võrrand:

# text
# c1: twstft_budget
seg-c1fdd431db57 = <c1/> lahendab selle suuruse T_A − T_B jaoks jaama seadmete viivituste, Ku-riba ionosfääri üles/alla asümmeetria, transponderi viivituse erinevuse ja Sagnaci liikmetega ning taastab otsemudeli täpsusega { "1e-15" } s.

# text
seg-a5468765380d = <b>Määramatuse eelarve:</b> kombineeritud ruutkeskmisena, lüli TDEV kui tüüp A liige.

# text
# c1: timetransfer
seg-7f365f91bb3e = <b>Lüli müra:</b> kahesuunaline seeria saab flicker-faasimüra põranda, päevase mittevastastikkuse ja püsiva vastastikkuse jäägi. Valge värinaga pakett <c1/> on muutumatu.

# text
# c1: MJD,ns
seg-8b40e74db08c = <b>Päris seeriad:</b> antud BIPM Circular T, <c1/> CSV või IGS jaamakella seeriate stabiilsus.

# text
# c1: time-transfer-budget
seg-267fd20d823c = MODELLED. Uus kaasasolev stsenaarium <c1/>. PPP ajalahend on VALIDATED eraldi IGS jaama kella vastu GNSS-i päris andmete harus.

# text
seg-ae33b92da4a6 = <b>Sisenemiskuumutus, EO radiomeetria ja tõusukaod</b> ({ "0.36" }, WP-14, CAP-28): kolm uut liiki.

# text
# c1: entry-heating
seg-34951878aa49 = <c1/>: 3-DoF punktmassiga sisenemine pöörleva Maa või Marsi kohal Sutton-Gravesi peatuspunkti kuumutusega.

# text
# c1: eo-radiometry
seg-98fe7a4c464a = <c1/>: kujutaja SNR, MTF Nyquisti sagedusel, suhteline servavastus ja GIQE { "4" } NIIRS.

# text
# c1: ascent-losses
seg-173dfbe3cc3e = <c1/>: mitmeastmeline gravitatsioonipöördega tõus gravitatsiooni-, õhutakistuse-, juhtimis- ja vasturõhukadudega, kontrollitud täpse identiteediga ideaalne dv miinus kaod.

# text
# c1: reentry::us76_pressure
# c2: entry-heating-stardust
# c3: eo-radiometry
# c4: ascent-losses
# c5: docs/ENTRY-EO-ASCENT.md
seg-0c9e7aacec80 = Sisenemise tippaeglustust kontrolliti avaldatud Stardusti nominaali vastu eelregistreeritud lävega: { "35.44" } g võrreldes väärtusega { "33.4" } g (+{ "6.1" } %, lävi { "10" } %). See rida on VALIDATED. Kuumutus, radiomeetria ja tõus on MODELLED. Samuti uued: <c1/>, kaasasolevad stsenaariumid <c2/>, <c3/> ja <c4/> ning <c5/>.

# text
# c1: aocs
# c2: aocs
# c3: aocs_mekf
# c4: aocs-slew
# c5: aocs-slew-mekf
# c6: docs/AOCS.md
seg-d4648c4e6655 = <b>Asendijuhtimine reaktsiooniratastega: liik <c1/></b> ({ "0.36" }, WP-14, CAP-21). Jäiga keskme inertsiaalne suunamispööre kolme või enama tasakaalustatud reaktsiooniratta ja MRP tagasisidega, minimaalse normiga rataste pöördemomentidega, mis on piiratud iga mootori piirini (<c2/>). See võib sulgeda ka ahela multiplikatiivsel EKF-il simuleeritud güroskoobist ja tähejälgijast (<c3/>). Tõese oleku ahelat võrreldi Basilisk { "2.9.1" } vastu kolmel juhul, mis eelregistreeriti enne koodi olemasolu (kolm ortogonaalset ratast, nelja ratta püramiid, küllastuv juhtum). Iga MRP komponent, keha kiirus, rattakiirus ja mootori pöördemoment nõustusid igal valimil, halvim { "2.4e-14" } sigmas ja { "2.9e-11" } rad/s rattakiiruses. See rida on VALIDATED; MEKF on MODELLED (NEES kooskõla). Uued kaasasolevad stsenaariumid <c4/> ja <c5/> ning <c6/>.

# text
# c1: acm-link
# c2: contact-schedule
# c3: acm-link
# c4: contact-schedule
# c5: docs/CONTACT-SCHEDULING.md
seg-8ce699586340 = <b>Maapealse kontakti ajastamine ja DVB-S2 ACM</b> ({ "0.36" }, WP-14, CAP-22/23): kaks uut stsenaariumi liiki. <c1/> annab ühe satelliidi ja ühe jaama kohta iga läbimise Es/N0 ja selle ajal valitud DVB-S2 MODCOD (ETSI EN { "302" } 307-1 tabeli { "13" } läved pluss varu). See annab ka andmemahu, mille ACM liigutab võrreldes püsiva kodeerimise lähtetasemega. <c2/> teeb sama mitme satelliidi ja mitme jaama kohta ning koostab konfliktivaba kontaktiplaani (antenni ümberpööramine, üks jaam satelliidi kohta, prioriteediga kaalutud edastus, mida piirab iga ülekandmata andmemaht). See esitab piirväärtuse ahne plaani, esimesena saabunu lähtetaseme ja täpse optimumi väikestel hulkadel, koos ahne plaani optimaalsuse vahega. Juurdepääsuaknad pärinevad VALIDATED näiva läbimise ennustajast. Uued kaasasolevad stsenaariumid <c3/> ja <c4/> (illustratiivsed sisendid) ning <c5/>. MODELLED (kaks uut registririda).

# text
# c1: leo-pvt
# c2: starlink-sop
# c3: tests/starlink_doppler_published_proxy.rs
seg-cd6dbcc3a78b = <b>Starlinki Doppleri positsioneerimine avaldatud eksperimendi suhtes</b> ({ "0.36" }, WP-14, CAP-11 osa, MODELLED). See on eelregistreeritud asendusvõrdlus liigi <c1/> Doppleri režiimist eelseadistusega <c2/> artikli „Unveiling Starlink for PNT“ (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685) andmekogumi 3 protsentiilide vastu. Mudel kasutas { "3" } satelliiti (kindla reegliga valitud { "47" } kraadi mask), kõrgusabi puudus ja Doppleri sigma oli { "30" } Hz, { "200" } algväärtuse üle. Selle 90. protsentiili 3-D viga on { "92.2" } m väärtusel { "20" } s ja { "870" } m väärtusel { "8" } s, võrreldes avaldatud { "2" } m ja { "10" } m, seega on mõlemad kahekordse teguri läved NOT MET. Mudel on pessimistlik, mitte optimistlik, nagu ennustati: kolm fikseeritud satelliiti annavad palju vähem geomeetrilist mitmekesisust kui eksperimendi { "63" } satelliiti { "10" } minuti jooksul kanalivahetusega iga { "15" } s järel. Mõlemad möödalasud on kinnitatud (<c3/>).

# text
# c1: maneuver::optimise_transfer_kernel
# c2: porkchop_kernel
seg-ffeb1b66cda5 = <b>Impulsiivse ülekande optimeerija DE440 peal</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> leiab ühe tiiruga ballistilise kahe impulsiga ülekande stardi- ja saabumiskuupäevad, mis minimeerivad stardi C3 või saabumise V-lõpmatuse tüübi I või tüübi II piires. See otsib 2-päevasel ruudustikul ja täpsustab seejärel 2-D Nelderi–Meadiga, heliotsentrilistel olekutel DE440 tuumast; see tugineb funktsioonile <c2/>. Võrdlus eelregistreeriti (bf0439e8) sõltumatu SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } optimeerija vastu { "2026" } Maa-Marsi võimaluse korral: kõik neli optimeerimist nõustuvad { "8.7e-13" } suhtelise vea piires, kuupäevad { "1e-5" } päeva piires (VALIDATED, uus registririda). Teisese avaldatud etalonina sobib NASA/TM-2010-216764 (2026-2045 Maa-Marsi käsiraamat) tüübi II minimaalse C3 jaoks ({ "9.182" } vs { "9.144" }) ja tüübi II minimaalse saabumise V-lõpmatuse jaoks ({ "2.564" } vs { "2.565" }). Selle tüübi I minimaalne C3 ei sobi: { "10.535" } vs { "11.11" } (-5.18 %), kus teegi sõltumatu etalon nõustub Kshanaga. See möödalask on registreeritud ja kinnitatud.

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
# c2: lunar-station-coverage
# c3: lunar-differential-pnt
seg-91fe2e2625a1 = <b>Kuu etalonjaama uuring</b> ({ "0.36" }, ajendatud avaldatud materjalist kavandatud Kuu lõunapooluse etalonjaama kohta; allikad failis <a1><c1/></a1>): liik <c2/>, Kuu diferentsiaal-PNT mudeli Monte Carlo pühkimine lõunapolaarse kasutajaruudustiku ja ühe päeva epohhide üle, mis annab punkti kohta ja piirkonna üle protsentiili parandatud ja parandamata vea, kättesaadavuse koos põhjustega, katvuse fikseeritud läve suhtes, kaitsetasemed, katvusraadiuse asimuudi kohta ja parandusside lüli eelarve. See taandub täpselt liigile <c3/> ühe punkti, epohhi ja katse korral; selle aritmeetika arvutati uuesti numpyga eelregistreeritud läve all (asukohad ja protsentiilid täidetud; jaama parandused jäid omadest mööda kahekordse täpsusega ümardamise tõttu, registreeritud). MODELLED; registririda „Kuu etalonjaama katvus- ja täpsuskaart“. Ei ole seotud ühegi asutusega ega ühegi asutuse poolt heaks kiidetud; ühtki väidet ühegi päris süsteemi toimivuse kohta ei esitata.

# text
# c1: docs/predictions/lunar-reference-station.md
# c2: lunar-station-coverage
# c3: tests/prediction_frozen.rs
# c4: docs/VALIDATION.md
seg-3d0cd9692787 = <b>Eelregistreeritud ennustus: Kuu etalonjaama katvus</b> (mitte valideerimine; MODELLED). <a1><c1/></a1> külmutab kommitil c05dac1d liigi <c2/> tulemused avalikult esitatud eelduste all, koos sisendite ja tulemuste SHA-256 räsidega ja nüüd fikseeritud hindamisprotokolliga (tegur { "2" } täpsuste ja kaitsetasemete jaoks, { "10" } protsendipunkti kättesaadavuse ja katvuse jaoks; muudetud eeldus saab uue dateeritud ennustuse, mitte kunagi redigeerimist; möödalask avaldatakse sama silmatorkavalt kui tabamus). Iga näitaja domineerib nelja satelliidi konstellatsiooni avaldamata elementide komplekt, mis on ILLUSTRATIVE, ja ütleb seda. <c3/> valvab seda; <c4/> saab jaotise „Eelregistreeritud ennustused“. Registririda puudub.

# text
# c1: lunar-station-coverage
# c2: [receiver]
# c3: a + b exp(-el / el0)
# c4: orbit_err_growth_m_per_s
# c5: [solution]
seg-00ec7ccd4d0d = <b>Kuu etalonjaama laiendused</b> ({ "0.36" }; jaamauuringu piirangud { "2" } ja { "3" } ning allikate lahendi stiil), igaüks valikuline liigil <c1/> ja vaikimisi puudu, nii et iga olemasolev dokument, sh külmutatud ennustus, on muutumatu: <c2/> (mitmeteelevi <c3/> kasutajal ja jaamal, jaama oma valikuliselt Gaussi-Markovi epohhide üle, DLL koodimüra C/N0-st, kanalitevahelised nihked; väärtused ILLUSTRATIVE Kuul); <c4/> (edastatava orbiidiviga lineaarne kasv parandusviivituse jooksul, ILLUSTRATIVE); <c5/> (kõrguspiirang, sellega kolme satelliidi miinimum, staatilise kasutaja aken epohhide üle). Kaks lisa avaldatud väidete võrdlusele, kumbki eelregistreeritud eraldi enne oma käitust, asuvad redigeerimata registreeritud käituse kõrval: K5 kasvuga ebaõnnestub igal kiirusel; allikate lahendi stiiliga ebaõnnestuvad K1 kuni K5 ja K6 läbib ({ "1" } { "6" }-st), R300 parandatud p95 3-D viga langeb väärtuselt { "280.6" } m väärtusele { "2.11" } m. MODELLED; kolm registririda.

# text
# c1: [terrain]
# c2: lunar-station-coverage
# c3: moonlight-service-volume
# c4: station_horizon
# c5: user_horizon
# c6: dem_path
# c7: LDEM_75S_240M
# c8: data/lunar-dem/
# c9: scripts/make_lola_south_polar_crop.py
# c10: scenarios/lunar-station-coverage-terrain.toml
seg-1d0a0dcd42de = <b>Kuu maastiku silmapiiri maskid</b> ({ "0.36" }; Kuu etalonjaama uuringu esimene piirang): valikuline jaotis <c1/> liigil <c2/> (jaam ja iga kasutajapunkt) ja <c3/> (iga ruudustikupunkt) annab igale asukohale asimuudist sõltuva silmapiiri { "0.36" } silmapiiritabeli vormingus, fikseeritud profiilist, mis on märgitud oma allikaga (<c4/>, <c5/>) ja/või kiirmarsist üle polaarse DEM-i (<c6/>) mööda Kuu sfääri suurringe täpse kõverusega. Kaasas on { "0.98" } MB väljalõige avaliku omandi LRO LOLA <c7/> lõunapolaarsest DEM-ist, { "5" } x { "5" } plokikeskmisena uuesti diskreteeritud väärtusele { "1200" } m (<c8/>, koos selle NOTICE, SHA-256 ja <c9/>), ning ainult hoidlas olev stsenaarium <c10/>. Kontrollitud suletud kujuliste silmapiiride vastu (paljas sfäär, kraater platool, rasterdatud koonus); MODELLED, registririda „Kuu maastiku silmapiiri maskid fikseeritud profiilist või polaarsest DEM-ist“. Ilma jaotiseta on iga dokument, sh ühikute plokk, baitidena identne.

# text
# c1: receiver-trust
# c2: good
# c3: degraded
# c4: few-satellites
# c5: high-pdop
# c6: high-hdop
# c7: sky-blocked
# c8: unknown
# c9: orbit::dop
# c10: good
# c11: fair
# c12: poor
# c13: geometry
# c14: geometry
# c15: environment
# c16: inconsistency
# c17: loss-of-lock
# c18: geometry
# c19: inconsistency
# c20: [geometry]
# c21: signal_loss
# c22: environment
# c23: cap_points
# c24: full_ratio
# c25: floor
# c26: degraded_min
# c27: [geometry]
# c28: min(cap_points, 100 - floor)
# c29: [score]
# c30: degraded_min
# c31: degraded_min
seg-ca0c6ca7396a = <b>Geomeetriat arvestav usaldus</b> ({ "0.36" } geomeetria projekteerimismärge, jaotis { "4" }). Iga <c1/> epohh, staatiline või laev, partii või otse, kannab oma satelliidigeomeetriat: <c2/>, <c3/> (põhjused <c4/>, <c5/>, <c6/> ja informatiivne <c7/>) või <c8/>, kus logi ei anna satelliidigeomeetriat, koos HDOP-i, PDOP-i, VDOP-i ja kasutatud satelliitidega. See tuletatakse kõrgustest ja asimuutidest, mida vastuvõtja teatab (NMEA GSV, UBX NAV-SAT), olemasoleva <c9/> tuuma kaudu, või võetakse NMEA GSA-st. Iga epohh kannab ka silti <c10/>, <c11/> või <c12/>, alati teatatud ja mitte kunagi hinnatud, ning märget HDOP-i, PDOP-i, VDOP-i, satelliitide arvu ja signaalikaoga sõnadega. Laeva skoor saab monitori <c13/>, mis ei arva midagi maha, kui geomeetria ei ole kehv (HDOP üle { "4" }, PDOP üle { "6" } või alla { "5" } kasutatud satelliidi), siis tõuseb lakini { "15" } punkti; geomeetria üksi jõuab kõige rohkem halvenenud vööndisse, mitte kunagi ebausaldusväärsesse (alarmi pole). Iga mahaarvamine saab klassi <c14/>, <c15/> või <c16/>, nii et kehv taevas ei loe rünnakuna. <c17/> on <c18/>, kui kaduma läinud satelliidid olid viimase teate ajal kõik alla { "15" } kraadi; kehva geomeetria mahaarvamine on <c19/>, kui HDOP, mida vastuvõtja väidab, on vastuolus tema väidetud taevaga rohkem kui max({ "1.0" }, { "25" } % tuletatud HDOP-ist), nii et võltsitud kehva taevaga ei saa silti osta. Uus tabel <c20/> määrab iga läve koos selle päritoluga (HDOP { "4" }, PDOP { "6" }, vähemalt { "5" } kasutatud, sigma_UERE { "1.5" } m, HDOP-i tolerants max({ "1.0" }, { "25" } % tuletatud HDOP-ist), kus { "25" } % on esinduslik valik konstellatsioonipõhiste kellade või alamhulga lahenditega vastuvõtjatele, { "15" } kraadi; IEC 61108-1 ja GPS SPS näitajad nagu viidatud, mida tuleb kontrollida standardite teksti vastu). Täielikku signaalikadu ei märgita taevana: kui nähtavad satelliidid ei ole jälgitud ja nähtavate satelliitide DOP on hea (ja jälgimata ei piirdu ühe horisondi poolega), kannab epohh <c21/> ja geomeetria mahaarvamine on <c22/>. Väidetud HDOP või PDOP väärtusega { "99" } või rohkem, GGA kvaliteet { "0" } ja GSA režiim { "1" } loetakse fiksi puudumiseks, mitte DOP-iks. Lagi (<c23/> { "15" }), kalde lõpp (<c24/> { "1.5" }) ja alampiir (<c25/>, vaikimisi skoori <c26/>) on tabelis <c27/>, nagu ka sildi head tasemed (HDOP { "2" }, PDOP { "3" }, { "6" } satelliiti, esinduslik); kehtiv lagi on <c28/>, nii et tabel <c29/>, mis tõstab <c30/> (sh { "0.35" } oma), alandab lage ja seda ei lükata tagasi, ning alampiir alla <c31/> lükatakse tagasi. MODELLED; nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.

# text
# c1: epochs[].geometry
# c2: class
# c3: geometry_model
# c4: geometry_summary
# c5: receiver_trust
# c6: assess_vessel_log
# c7: receiver_trust_replay
# c8: assess_*
# c9: epochs.json
# c10: config.json
# c11: trust-telemetry
# c12: kshana_trust_geometry*
# c13: class
# c14: kshana_trust_reason_active
# c15: kshana.geometry.*
# c16: cs6
# c17: cfp3
# c18: cfp4
# c19: geoStatus
# c20: geoHdop
# c21: geoClass
# c22: kshana_trust_geometry_label{label}
# c23: kshana_trust_geometry_vdop
# c24: kshana.geometry.label
# c25: kshana.geometry.vdop
# c26: geoLabel
# c27: geoPdop
# c28: geoVdop
# c29: geoUsed
# c30: cs6
# c31: cn1
# c32: geometry_summary.hdop_mismatch
# c33: degraded
# c34: kshana_trust_geometry_signal_loss
# c35: kshana.geometry.signal_loss
# c36: geoSignalLoss=1
# c37: environment
# c38: cs6
seg-d976d3495695 = Geomeetria jõuab igale pinnale: tulemuse JSON (<c1/>, <c2/> igal mahaarvamisel, <c3/>, <c4/>), elavad JSON-read (skeem { "1.3" }), Pythoni ja WebAssembly <c5/>, <c6/> ja <c7/>, MCP <c8/> tööriistad, tõendipaketid (<c9/>, <c10/>, geomeetriarada kokkuvõtte lehel) ja <c11/> (Prometheuse <c12/> ja silt <c13/> väljal <c14/>, OTLP <c15/>, CEF kohandatud väljad <c16/> (geomeetria olek ja klassid), <c17/> (HDOP) ja <c18/> (PDOP), kontrollitud mõlema CEF-i sõltumatu etaloni parseriga, ning LEEF <c19/>, <c20/>, <c21/>). Geomeetria silt eksporditakse samuti, lisatuna kõigi varasemate seeriate ja väljade järele ja ainult sisenditele, mis seda kannavad: Prometheus <c22/> ja <c23/>, OTLP <c24/> ja <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, ja CEF kolmas väli <c30/> (silt) ning <c31/> (kasutatud satelliidid); VDOP-i CEF-is ei ole (ujukomaga kohandatud väljad on hõivatud). Mõlemad CEF-i sõltumatu etaloni parserid loevad sildijuhud tagasi nii nagu kirjutatud (muudatus { "5" }: { "176" } rida, { "172" } parsitud pycef-iga, { "176" } Logstashiga). Väidetud HDOP, mida väidetud taevas ei selgita, märgitakse igal epohhil ja loendatakse (<c32/>, rida tõendi kokkuvõtte lehel), hinnatud ainult siis, kui geomeetria on kehv. Signaalikadu eksporditakse eraldi, kuna geomeetria olek jääb <c33/>, kuni see kestab: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; CEF-is ilmub see klassina <c37/> väljal <c38/>.

# text
# c1: orbit::dop_cofactor
# c2: (HᵀH)⁻¹
# c3: orbit::dop
seg-5030e5214ed0 = <c1/>: kovariatsioonitegur <c2/> funktsiooni <c3/> taga, sellest välja arvutatud sama aritmeetikaga.

# text
seg-c6cc061a3ed6 = Registririda „Asukoha viga geomeetriast: RMS viga = sigma_UERE x DOP“ (<b>MODELLED</b>, sisemine kooskõla): mootori vähimruutude fiksi algväärtustatud Monte Carlo { "8" } gnss_lib_py-ga sobitatud DOP geomeetrial valideeritud DOP tuuma kovariatsioonteguri vastu, tolerantsidega, mis on eelregistreeritud enne esimest käitust, ja kahe negatiivse kontrolliga, mis ebaõnnestuvad nõutud viisil; selle kõrval varasem kontroll neljal käsitsi valitud taevas hii-ruut usaldusvahemikega, esitatud kui käitatud enne eelregistreerimist.

# text
# c1: src/skyline.rs
# c2: docs/SKYLINE.md
# c3: max(mask_deg, skyline)
# c4: city-street
# c5: harbour-approach
# c6: fjord
# c7: container-terminal
# c8: [skyline]
# c9: gnss-sim
# c10: jamming
# c11: leo-pvt
# c12: leo-pass
# c13: nmea-scenario
# c14: orbit
# c15: integrity
# c16: user_site = { lat_deg, lon_deg, height_m }
# c17: epoch + t
# c18: epoch
# c19: user
# c20: skyline { source, open_fraction, provenance }
# c21: masked_by_skyline
# c22: orbit-urban-canyon-skyline
# c23: integrity-harbour-approach
# c24: gnss-sim-container-terminal-skyline
# c25: jamming-harbour-approach-skyline
# c26: leo-pvt-fjord-skyline
# c27: leo-vertical-autonomous-vehicle-skyline
seg-b87b6eafd465 = <b>Asimuudist sõltuvad silmapiiri maskid</b> (<c1/>, <a1><c2/></a1>, projekteerimismärkme punkt { "1" }): kõrgusnurga lõige, mis sõltub asimuudist, tabelite punktiviisiline maksimum (iga interpoleeritud eraldi, mähitud väärtusel { "360" }°), tänavakanjon suletud kujul (valikuliselt avatud otstega), teravate servadega sektorid ja maastikuprofiil Maa kõverusega; kehtiv lõige on <c3/>. Neli REPRESENTATIVE eelseadistust fikseeritud päritoluga (<c4/>, <c5/>, <c6/>, <c7/>), välja kaupa ülekirjutatavad. Valikuline jaotis <c8/> failides <c9/>, <c10/>, <c11/> (iga režiim, sh polaarne pühkimine), <c12/> ja <c13/> koolitusfailides ning failides <c14/> ja <c15/> uue maajaama kasutaja <c16/> kaudu (geodeetilised vaatenurgad pöörleval Maal, geodeetilise ülesuunaga ARAIM-i horisontaalse ja vertikaalse jaotuse jaoks; iga valim on üks absoluutne hetk, <c17/>, milleni elementide komplektid, edastatavad efemeriidid ja SP3 failid edasi viiakse oma epohhidest, dateeritud värskeima satelliidi epohhi järgi, kui <c18/> pole antud; orbiidil olev <c19/> keeldub silmapiirist). Tulemused saavad <c20/> ja valimipõhise <c21/>. Ilma jaotiseta on iga stsenaarium baitidena identne versiooniga { "0.35.0" }, kontrollitud väljalaskekommiti räside vastu. Kuus kaasasolevat näidet: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> ja kampaania <c27/> (autonoomse sõiduki kanjon lameda lõikena ja tänavana; olemasolev kampaania on muutumatu). MODELLED.

# text
# c1: src/geometry.rs
# c2: sky_geometry
# c3: tle
# c4: epoch
# c5: sky_source
# c6: sky_statement
# c7: tle_skipped
# c8: sky_monte_carlo
# c9: skyline_presets
# c10: skyline_profile
# c11: skyplot_svg
# c12: orbit::dop_cov
# c13: orbit::dop
# c14: kshana sky
# c15: kshana skyline
# c16: sky_geometry
# c17: notebooks/geometry.ipynb
# c18: .md
# c19: tests/python/test_notebooks.py
seg-95cdecf341d6 = <b>Taevageomeetria funktsioonid</b> (<c1/>, projekteerimismärkme punkt { "2" }): <c2/> (nähtavad ja maskeeritud satelliidid asukohast, ajast ja konstellatsiooni eelseadistustest, kaherealistest elementide komplektidest (<c3/>, kuni { "4" } MiB, propageeritud mootori SGP4-ga UTC-ks <c4/>) või antud satelliitidest; <c5/> ja <c6/> ütlevad, kas taevas on esinduslik või taevas, mille elementide komplektid sel epohhil annavad, mitte mõõtmine; <c7/> loetleb iga kasutamata rea koos põhjusega; sisendilaed { "2000" } satelliiti horisondi kohal, kontrollitud enne süsteemitabeli ehitamist, ja { "16" } vastuvõtja kella; viis DOP-i; ENU kofaktor ja kovariatsioon ühe kellaga süsteemi kohta või ühe ühisega; horisontaalne veaellips ühel sigmal ja fikseeritud usaldusnivool), <c8/> (algväärtustatud vähimruutude vead, kuni { "5000" }), <c9/>, <c10/> ja <c11/>. <c12/> avab kovariatsiooni funktsiooni <c13/> taga, mis on nüüd selle redutseering (valideeritud skalaarid on muutumatud). Pinnad: <c14/> ja <c15/>, sama nimega Pythoni ja WASM-i funktsioonid ning MCP tööriist <c16/> ({ "40" } tööriista), ja märkmik <c17/> (selle peegliga <c18/>; käitab <c19/>). Iga tulemus kannab sildi MODELLED, veamudeli avalduse ja nõuandva avalduse.

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/
# c5: linalg.inv
# c6: linalg.eigh
# c7: xval/numpy-ellipse/
seg-9414d387cf79 = Register: viis silmapiiri ja taevageomeetria rida. <b>VALIDATED</b>, igaüks võrdluses, mis eelregistreeriti enne selle sõltumatu etaloni käitust: <em>Asimuudist sõltuv silmapiiri mask: nähtav hulk, asimuut ja kõrgusnurk ning DOP maski all</em> Orekit { "12.2" } (<c1/>, <c2/>) ja gnss_lib_py { "1.0.4" } (<c3/>) vastu, halvimad vaatenurga ja maski erinevused { "1.1e-12" }° võrreldes väärtusega { "1e-9" }°, identsed nähtavad hulgad, DOP { "3.3e-13" } suhteline (<c4/>); <em>Horisontaalne veaellips ja süsteemipõhine kofaktor geomeetria kovariatsioonist</em> numpy <c5/> ja <c6/> vastu (standard P2), { "270" } juhtu, teljed { "5.1e-13" } suhteline (<c7/>). <b>MODELLED</b>: kanjon, sektor ja maastiku redutseeringud; eelseadistused; taevageomeetria kompositsioon (eelseadistatud taevas, Monte Carlo pilv).

# text
seg-8f5ebce999fe = Geomeetria-usalduse, silmapiiri ja Kuu etalonjaama ridadega on registris { "274" } rida: { "134" } valideeritud, { "136" } modelleeritud, { "4" } partneri.

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: src/lunar_time_lab.rs
# c4: scenarios/lunar-station-time-lab.toml
seg-686b1211d7bb = <b>Kuu etalonjaam: jaama aja laboratoorium</b> (<b>MODELLED</b>). Valikuline plokk <c1/> liigil <c2/> (<c3/>). See modelleerib jaama kella (vaikimisi miniRAFS klass, mis tahes nimetatud klass või seadmekaart, mis on sobitatud fikseeritud stabiilsuspunktidele), mis on juhitud LTC-le, siis vabalt töötav või iga N sekundi järel uuesti juhitud. See väljastab ajavea kõvera x(t), aja väärtusteni { "1" }, { "10" } ja { "100" } ns (poolitamine suletud kuju kõrval) ja domineeriva liikme horisondi kohta, kõik ühikutega. Juhtimisjääk on ILLUSTRATIVE. LTC kiirust ei tuletata uuesti ja sellel on oma VALIDATED rida. Avaliku ICG WG-B Lunar PNT materjali (juuni { "2024" }) nanosekundi tasemel siht on toodud allika avaldusena, mitte väitena. Kellade järjestus optiline < PHM < RAFS < miniRAFS kehtib väärtusest { "1" } s kuni { "7e5" } s ning test kinnitab PHM ja RAFS kõverate lõikumise ligikaudu väärtusel { "7.5e5" } s. See lõikumine on ühe müratüübiga kellamudelite omadus (puhas flicker FM vs puhas valge FM), mitte füüsikaline tulemus. Ilma plokita on aruanne, selle tabel ja kokkuvõte muutumatud. Näide: <c4/>. Lisab ühe registririda, mis on märgistatud MODELLED.

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: station_geodesy
# c5: lunar-frame-campaign
# c6: scenarios/lunar-station-geodesy-baseline.toml
# c7: -with-station.toml
seg-863c2c7a5f0b = <b>Kuu etalonjaam: jaama geodeesia</b> (<b>MODELLED</b>). Valikulised sisendid <c1/> ja <c2/> liigil <c3/> lisavad ploki <c4/>. Arhiveeritud laservahemõõtmise lõigu viie massiivi datumi informatsioon on kombineeritud sellega, mida lisatud retroreflektor ja lisatud VLBI majak fikseeritud asukohtades annaksid. Reflektorit mõõdetakse arhiveeritud epohhidel, mida see näeb, nende arhiveeritud kaaludega. Majakas kasutab võrku ja ajakava <c5/>, jaamad fikseeritud. Plokk annab iga Helmerti 1-sigma enne ja pärast ning nende suhte. Need on Cramér-Rao piirid vähendatud parameetrite komplektile, ILLUSTRATIVE ajakava ja asukoha korral. Puuduvad või tühjad sisendid jätavad aruande baitidena identseks. Näited: <c6/> ja <c7/>. Lisab ühe registririda, mis on märgistatud MODELLED.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
# c2: tests/fixtures/lunar_station/SOURCES.md
# c3: PREREGISTRATION.md
# c4: tests/lunar_station_published_oracle.rs
seg-45c6febcc7fc = <b>Kuu etalonjaam: võrdlus avaldatud väidetega</b> (<b>MODELLED</b>). Iga arvuline väide viies avalikus allikas on loetletud täpse sõnastuse, lehekülje ja esitatud eeldustega ning liigitatud võrreldavaks, osaliselt võrreldavaks või mittevõrreldavaks (<c1/>; allikad URL-i, toomise kuupäeva, SHA-256 ja litsentsiga failis <c2/>). Osaliselt võrreldavaid väiteid hinnati kuue ühepoolse lävega, mis eelregistreeriti enne käitust (<c3/>, redaktsioon { "2" }, 05bf9a19): { "1" } väidet { "6" }-st eelregistreeritud läve piires (eelregistreeritud 05bf9a19). Katvus on { "0.00" } võrreldes väärtusega >= { "0.95" } mõlemal lõunapolaarsel ringil ja parandatud p95 on { "280.6" } m võrreldes väärtusega <= { "1.5" } m. Põhjus on satelliitide orbiidielemendid, mida ükski allikas ei avalda: ILLUSTRATIVE hoidlasisestel elementidel on neli satelliiti ühisel vaatel { "8" } % epohhidest, peaaegu singulaarse geomeetriaga. Käitus ei reprodutseeri väiteid nendel elementidel ega ole tõend, et väited on valed. Kindlaks määratud failis <c4/>. Üks registririda, märgistatud MODELLED koos tähelepanekuga.

# text
# c1: realdata::clk::rinex_clock_series
# c2: TIME SYSTEM ID
seg-2b01d2ccb666 = <b>Kuu etalonjaam: kellafaili andmete valmisolek</b>. <c1/> esitab nüüd oma epohhide ajasüsteemi. See on väärtus <c2/> või, kui see on deklareerimata, päise satelliidisüsteemi vaikeväärtus. Tulemus ütleb ka, kas süsteem oli deklareeritud. Funktsioon keeldub tundmatust ajasüsteemist (näiteks Kuu ajaskaala), deklareerimata segasüsteemi failist ja failidest, mis on vastuolus, selle asemel et lugeda neid GPS-ajana. See tarnib sünteetilise jaamakella fikstuuri. Paranduste failivormingut ei määratleta, sest avalikku sellist ei ole.

# text
seg-0fb89eb36003 = Muudetud

# text
# c1: fusion::ukf
# c2: fusion::tightly_coupled
# c3: fusion::gnss_ins_ekf
# c4: hybrid_ukf
# c5: tightly_coupled17
# c6: carrier_tc
seg-b63c95f12bc4 = Moodulite <c1/>, <c2/> ja <c3/> dokumentatsioon ei nimeta enam 17-olekulist UKF navigaatorit, täielikku INS-i tihedat sidestust ja selgesõnalist kellaolekut tulevaseks tööks; need viitavad moodulitele <c4/>, <c5/> ja <c6/>.

# text
seg-aedd06cf6127 = <b>RINEX { "4" } ei lükata enam tagasi</b> ({ "0.36" }, WP-07): RINEX { "4" } navigatsioonifail lükati varem meelega tagasi; nüüd see loetakse (vt Lisatud). Versiooni { "4" } ja hilisemate vaatlusfailide korral sobitatakse päise sildid ainult veergudes 61-80, nii et uued vabateksti kirjed ei saa silditeks pääseda.

# text
# c1: ionex::parse_ionex
# c2: None
seg-5829841b58d7 = <b><c1/> loeb päris IONEX faile</b> ({ "0.36" }, WP-07): täielik 16-väärtuseline kirje täidab veerud 61-80, mida lugeja pidas sildiks, nii et see tagastas <c2/> igal päris IONEX failil. See loeb nüüd kirje, mille sildiväli on arvuline, väärtustena. Ükski tarnitud väljund seda ei kasutanud.

# text
# c1: galileo-e1
# c2: galileo-e5a
seg-a66bd6592b93 = <b>Galileo E1 ja E5a vastuvõetud võimsused OS SIS ICD Issue { "2.1" } järgi</b> (redaktsioon, 2026-10-14). Spektriribad <c1/> ja <c2/> ning LEO-signaali GNSS-ohvrid, mis võtavad neist oma võimsuse, kasutavad nüüd Galileo OS SIS ICD Issue { "2.1" } tabeli { "12" } minimaalseid vastuvõetud võimsusi: −{ "157.25" } dBW (oli −{ "157.0" }) ja −{ "155.25" } dBW (oli −{ "155.0" }).

# text
seg-b0386f62923f = Üheksa stsenaariumi tulemust liigub: spektrinäited, spektrikampaania, kolm LEO vastupidavuse vertikaali ja kolm LEO signaalidisaini. Efektiivne C/N0 liigub −{ "0.25" } dB ja J/S +{ "0.25" } dB nendel ribadel.

# text
# c1: docs/revisions/CAP12-galileo-icd21-power-changes.md
seg-2af90bfcefae = Iga liikunud väärtus ({ "1766" }, vana → uus) on loetletud failis <c1/> ja selle CSV-s, koos dokumendi tabelitega, mis liikusid. Ükski registrirea olek ei muutu.

# text
# c1: galileo-e5b
# c2: galileo-e5-altboc
seg-d468174b2d4c = Teine osa, samal päeval: LEO-signaali ohvrid <c1/> (−{ "155.0" } → −{ "155.25" } dBW, tabel { "12" } E5b) ja <c2/> (−{ "152.0" } → −{ "152.24" } dBW). ICD-l ei ole täisriba E5 rida, seega AltBOC väärtus on tabeli { "12" } E5a ja E5b summade võimsussumma, ehitatud nii nagu vana väärtus. Kolm LEO signaalidisaini tulemust liigub ({ "64" } väärtust: need vastuvõetud võimsused ja LEO-st GNSS-i C/N0 halvenemine kahel ohvril), loetletud samas redaktsioonis (§{ "5" }) ja CSV-s. Midagi muud ei liigu.

# text
# c1: tides::atmospheric_tide
# c2: P_nm
# c3: N_nm
# c4: ε = 90° − ψ
# c5: tides::s2_air_waves
# c6: xval/s2-air-tide-fix/
seg-a96992246ef8 = <b>S2 atmosfäärilise loodete mõju parandus</b> (<c1/>). Ray ({ "2001" }) S2 õhurõhu harmoonilised on normaliseerimata <c2/> koefitsiendid koosinusfaasi hilistumisega; neid kasutati täielikult normaliseeritutena ja hilistumisega kui IERS-i siinuse ees. Nüüd sisenevad need jagatuna väärtusega <c3/> ja <c4/>; uus <c5/> reprodutseerib GFZ STR06/01 tabeli { "5" } mudelit A2 kõigi { "21" } laine jaoks (halvim { "0.0005" } cm, { "0.05" }°; VALIDATED). Liiguvad ainult loodete mõjuga väljundid: Galileo CI sobitus { "0.132" } → { "0.133" } m, Swarm-A komponendid { "1" }–{ "2" } mm võrra (eelregistreeritud failis <c6/>).

# text
# c1: propagator::solve_kepler_checked
# c2: orbit::solve_kepler
# c3: ephem::solve_kepler
# c4: kepler::solve_kepler_markley
seg-6fa076226c01 = Ainult dokumentatsioon: <c1/>, <c2/> ja <c3/> on dokumenteeritud pärandlahendajatena, numbriliselt muutumatuna, osutades moodulile <c4/>.

# text
# c1: utck_bound
seg-a757fd7ca793 = <b>D9 vooru { "3" } (<c1/>) olek.</b> BIPM Circular T { "465" } ilmus 2026-10-12. Eelregistreeritud prospektiivset skoori ei ole veel käitatud: väljaanne { "465" } sisaldab umbes { "285" } testväärtust ja peatumisreegel vajab { "1000" }, seega umbes väljaandeid { "465" }–{ "468" }. Käitus vajab ka arhiveeritud 2026-09-30 laboripõhiseid faile, sest BIPM on vahepeal ümber kirjutanud { "87" } { "113" }-st. Registririda ja testi päis ütlevad seda; test, selle läved ja jaotus on muutumatud.

# text
# c1: PositioningFom
# c2: orbit::Propagator
# c3: src/ionex.rs
# c4: raim
# c5: docs/design/evidence/cn0-m2m4/RESULTS.md
seg-e064546d05ec = <b>Dokumentatsiooni tõepärasuse läbivaatus ({ "0.36" }).</b> Teekaart, võimekuse read, projekteerimisdokumentide olekuread ja moodulite kommentaarid viidud koodiga vastavusse; ükski väljund ei muutu. Üksused, mis on juba ehitatud, kuid endiselt avatutena loetletud, on nüüd märgitud tehtuks: ITU-T maskide kontrollid, { "24" } h holdover-stsenaarium ja kellalogi sissevõtt (telekommunikatsiooni ajastus), esimese minuti kiirkäivitused, Lense–Thirring ja Orekiti propagaatori ristkontroll, ITRF-täpne GCRS-ahel, kuldsed ja platvormideülesed räsid, päritolu, mitmerikkeline ARAIM (ADD v4.2), ühe satelliidi FDE, CRPA teek, CAI interferentsimustri mitmetähenduslikkuse piir, katvusribade suurusmääramine ja 3-D orbiidivaade, jäiga keha asendidünaamika, OMM kirjutaja ja NAIF tuuma lugeja, DE440 Kuu libratsioon, käitusetähenduse lause mänguväljakul, <c1/>, 17-olekuline tihedalt seotud navigaator ja gravitatsioonikaardi liik. Read esitavad ka täpselt, mis on endiselt avatud (näiteks kaheosaline JD failis <c2/>, lugeja <c3/> päris toote vastu ja mitme satelliidi välistamine failis <c4/>). Puuduv <c5/> kirjutatakse selle testide värskest käitusest (M1–M4 läbivad) ja partnerile suunatud IQ valideerimise mustandil on praegused registri arvud.

# text
seg-e2290a640df7 = Galileo E1 mälukoode enam kaasa ei pakendata.

# text
# c1: data/galileo-os-sis-icd/C7_E1B.txt
# c2: C8_E1C.txt
# c3: LICENSING.md
# c4: galileo::e1b_table
# c5: e1c_table
# c6: Result
# c7: KSHANA_GALILEO_E1B
# c8: KSHANA_GALILEO_E1C
# c9: data/galileo-os-sis-icd/
# c10: scripts/fetch_galileo_e1_codes.sh
# c11: galileo::E1B_TABLE_TEXT
# c12: E1C_TABLE_TEXT
# c13: galileo-e1b
# c14: galileo-e1c
# c15: tests/iq_signals.rs
seg-80f8ca869682 = <c1/> ja <c2/> (ICD lisa C.7/C.8) eemaldatakse hoidlast ja pakettidest. ICD tingimused (tsiteeritud failis <c3/>) lubavad kasutajal koode allika viitamisega salvestada ja tootes kasutada, kuid lubavad levitamist ainult mittekaubanduslikel eesmärkidel, ja Kshanat pakutakse ka kommertslitsentsiga. <c4/> / <c5/> tagastavad nüüd väärtuse <c6/> ja loevad kasutaja enda koopia muutujast <c7/> / <c8/> või lähtekoodi väljavõtte puhul kataloogist <c9/>, kuhu uus <c10/> need ICD PDF-ist välja võtab (räsikontrolliga). <c11/> / <c12/> eemaldatakse. Ilma tabeliteta tagastavad Galileo E1 signaalid (<c13/>, <c14/>) vea, mis ütleb, kuidas neid esitada, ja E1 testid jäetakse teatega vahele. Kui tabelid on olemas, jääb iga E1 väljund samaks. Ükski stsenaariumi-, golden- ega spektriväljund kooditabeleid ei kasuta. E5a lisade C.3/C.4 testfikstuurid (LFSR-i sõltumatu etalon failis <c15/>) on käsitletud samamoodi: need tõmmatakse sama skriptiga, lisatakse git-ignore'i ja test jäetakse ilma nendeta vahele.

# text
# c1: f64
# c2: rand_distr
# c3: libm
# c4: portable_math::PortableFloat
# c5: portable_distr
# c6: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c7: europa-surface-pnt
# c8: lunar-joint-od-clock
# c9: paper/crossover/inertial.json
# c10: vibration_psd
# c11: cislunar-observability
# c12: skyline_scenarios
# c13: geometry_corpus_identity
# c14: geometry_trust_no_change
# c15: docs/predictions/*.portable-0.36.json
# c16: tests/lunar_joint_od_numpy_oracle.rs
# c17: docs/revisions/STUDIO15-lunar-joint-od-oracle-rerecord.md
# c18: docs/revisions/STUDIO15-batch4-rebaseline.md
# c19: iq_campaign
# c20: gnss-ins
# c21: docs/revisions/STUDIO15-greenhall-edf-portable.md
# c22: docs/revisions/STUDIO15-testbench-gpssdrsim-rerun.md
seg-654d0358137b = <b>Portaalne matemaatika kõikjal</b> ({ "0.36" }, STUDIO-15): kõik teegi <c1/> transtsendentfunktsioonid ning <c2/> normaal-, gamma- ja eksponentjaotuse valimid arvutatakse nüüd puhta Rusti teegi <c3/> kaudu (<c4/>, <c5/>), nii et natiivne ehitus ja WebAssembly ehitus annavad kõigi { "141" } kaasapakitud stsenaariumi ja lühikese IQ-käituse tulemus-JSON-i baitideni identsena. Hind on see, et hostisüsteemi matemaatikateegiga arvutatud tulemuste viimased bitid nihkusid: { "98" } kaasapakitud { "141" } stsenaariumist muutus, { "43" } ei muutunud; { "5" } muutus oma suurimas väljas rohkem kui { "1e-3" } võrra ja ülejäänud vähem. Iga nihkunud väärtus on loetletud kujul vana -> uus failis <a1><c6/></a1> (koos kõigi { "136,127" } nihkunud arvu CSV-ga); ükski lävi, tolerants ega piirväärtus ei muutunud. Muutunud avaldatud arvud: <c7/> kättesaadavus Maa kaugusega { "0.719" } -> { "0.713" } ja RMS-viga { "86.147" } -> { "86.499" } m (üks kättesaadavuse piiril olev epohh laheneb nüüd kõikjal ühtmoodi; macOS-i arm64 peal trükkis see { "0.725" } / { "85.800" } m); <c8/> jaama viga { "3.541350" } -> { "3.536885" } m VLBI-ga ja { "2183.558" } -> { "2184.021" } m ilma; <c9/>, kaheksa <c10/> väärtust { "3" } ühiku võrra viimases kohas (erratum tehnilises aruandes); avaldatud dokument <c11/> ümardusmüra põhja suurustes (kaheksa väärtust üle kuue olulise numbri, kuni { "6.8e-5" } suhtelisena; ükski järjekoht ega lävi ei nihkunud). Baitidentiteedi kaitsete (<c12/>, <c13/>, <c14/>) kinnitatud räsid on viidud ümber nimetatud „{ "0.36" } portable“ lähtetasemele ning väärtused versioonist { "0.35.0" } on säilitatud ajaloolise kirjena; külmutatud Kuu tugijaama ennustus on puutumata ja selle portaalne uuesti käitus on salvestatud selle kõrvale (<c15/>). <c16/> (valideeritud Kuu ühise OD rida): fikstuurid eksporditi uuesti ja numpy võrdlus käitati uuesti numpy versiooniga { "2.4.6" }, registreeritud versioon, skript ja lävi muutumatud; kõik kuus võrku läbivad (<a2><c17/></a2>). Pärast STUDIO-15 liidetud partiide 2–3 töö kasutab samuti portaalset matemaatikat ({ "457" } väljakutsekohta { "62" } failis); mida see nihutas, on kirjas failis <a3><c18/></a3>: { "12" } kaasapakitud stsenaariumi (suurim suhteline muutus { "5.2e-8" }, ükski trükitud arv ei nihku), { "28" } skyline'i kaitsetabeli rida uuesti kinnitatud, <c19/> M2M4 digest, vana <c20/> tõeväärtuste räsid, vaatlemata majaka datumi sigma ({ "632.3769" } -> { "632.3772" } m) ja kaks registreeritud tähelepanekut (CR3BP DRO sulgumised; CRPA A3, { "194" } { "456" } lingist). Greenhalli täpne edf säilitab oma valideeritud läve topelttäpsusega (double-double) logaritmiga oma tuumas (<a4><c21/></a4>) ja gps-sdr-sim testbench'i sõltumatu etalon käitati uuesti nihkunud NMEA eksportidel, iga lävi püsis (<a5><c22/></a5>).

# text
seg-a21df3f8e0a6 = README: Kuu komplekti rida nimetab iga osa tõendustaseme (varem oli kõik märgitud MODELLED).

# text
# c1: realdata::clk::rinex_clock_series
# c2: RinexClockSeries
# c3: (PhaseSeries, GriddingLog)
# c4: AS
# c5: AR
seg-ffb14764a7a9 = <c1/> tagastab <c2/> (jada, ruudustamise logi, ajasüsteem, kas see oli deklareeritud, kirje tüüp) <c3/> ennikute asemel. See langeb nüüd tagasi satelliidi (<c4/>) kirjetelt vastuvõtja/jaama (<c5/>) kirjetele nõutud nimega.

# text
# c1: tests/geometry_trust_no_change.rs
# c2: tests/geometry_corpus_identity.rs
# c3: score_model.weights
# c4: geometry
# c5: class
# c6: geometry
# c7: class
# c8: geometry
# c9: monitors_run
# c10: [score.weights]
# c11: [geometry]
seg-6777ca96624a = Ükski skoor ei muutu, kui geomeetria pole halb; silt esitatakse alati. Hea või rahuldava geomeetria korral (kaasa arvatud { "8" } satelliidiga ainult GPS-i lahtine taevas) või teadmata geomeetria korral (monitor ei käitu) on iga skoor sama mis versioonis { "0.35" }: <c1/> hoiab mõlema näidissessiooni väljundid ja <c2/> iga kinnitatud laevade NMEA korpuse (samuti ainult GPS-i lahtise taevana) ning meeskonna koolituse stsenaariumid versiooni { "0.35.0" } baitidena, kui lisatud võtmed on eemaldatud; kahes koolitusstsenaariumis, kus segamine muudab geomeetria halvaks, erinevad halvad epohhid ainult geomeetriavähenduse poolest. Halva geomeetriaga logi kaotab kuni { "15" } punkti, mida see versioonis { "0.35" } ei kaotanud. Muud kavatsetud muudatused on kõik lisandused: ülaltoodud võtmed tulemus-JSON-is ja tõendipakettides (<c3/> on muutumatu); reaalajas JSON-ridade skeem läheb versioonilt { "1.2" } versioonile { "1.3" } (<c4/> lisatud, <c5/> igas vähenduses); väljavõtte kokkuvõte saab välja <c6/>; telemeetria saab geomeetria jadad, väljad ja sildi <c7/> ainult sisendite jaoks, mis neid kannavad, nii et versiooni { "0.35" } voog või tulemus kuvatakse baitideni nagu varem. <c8/> on 17. monitori nimi; see on loetletud viimasena väljal <c9/>, kui see otsustas (laev, mille logi annab geomeetria; versiooni { "0.35" } loend säilitab oma järjekorra ja kokkuvõtte monitoride arv kasvab ühe võrra) ning sellel pole kirjet <c10/> (selle seadmine lükatakse tagasi: selle vähendus seatakse jaotises <c11/>).

# text
# c1: tests/fixtures/dop/NOTICE
seg-45b44c851937 = <c1/> nimetas gnss_lib_py litsentsiks Apache-2.0; väljalase { "1.0.4" } on MIT.

# text
seg-a1a670a9c63e = NMEA lugeja loeb nüüd GSA-d (lühike GSA jäetakse tähelepanuta, mitte ei loeta vahelejäetuks) ja säilitab GSV tõusunurgad ja asimuudid, ka signaalita loetletud satelliitide puhul; UBX lugeja säilitab NAV-SAT tõusunurga ja asimuudi. C/N0 loetakse täpselt nagu varem.

# text
# c1: navsignal
seg-0bafbea5c75d = <b>Tulemuse muutus: lairiba- ja pühitavad segajad kasutavad nüüd Q = { "2" }.</b> Segamisvastane võrrand kasutab nende segajate jaoks õpikuvalmi hajaspektri korrektsiooni Q, kus varem kasutati väärtust { "1" }. Q = { "2" } on valge müra peaharul normeeritud sisendsignaali võimsusega; see on testides kinnitatud suletud kujule failist <c1/>.

# text
# c1: q_override
seg-21f31ec302de = <b>Muutumatu:</b> CW- ja kitsaribasegajad (Q = { "1" }), tundmatu segajatüüp (Q = { "1" }, kõige kahjulikum väärtus) ja <c1/>.

# text
seg-f362499d2ed0 = <b>Mõju:</b> kus lairiba- või pühitav segaja mõjub, tõuseb efektiivne C/N0 kuni { "3.0103" } dB, tuletatud J/S läved tõusevad { "3.0103" } dB ja vaba ruumi keelurajoonid kahanevad teguriga { "0.7071" }.

# text
# c1: xval/jammer-q/PREREGISTRATION.md
# c2: xval/jammer-q/RESULTS.md
seg-088dcd34cc88 = <b>Muutunud kaasapakitud stsenaariumid:</b> { "12" } { "144" }-st muutuvad, kõik nagu eelregistreeritud (<c1/>, tulemused failis <c2/>):

# text
# c1: jamming-demo
seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

# text
# c1: lunar-jamming
seg-afb42538cfde = <c1/>: kaotatud satelliite { "26" } → { "0" }, jälgimise kaotuse kaugus mediaan { "27.4" } → { "19.4" } km;

# text
# c1: tracking-loop
seg-8c2691f38d28 = <c1/>: ahela dünaamika keelurajoon { "75.2" } → { "53.2" } km;

# text
seg-096a24491872 = ning kampaaniad ja spektri ristkontrollid, mis neid sisaldavad.

# text
# c1: jamming
# c2: lunar-jamming
# c3: tracking-loop
# c4: impairment-eval
# c5: jamming_kind_cross_check
seg-ecdf60335064 = <b>Mõjutatud tarbijad:</b> stsenaariumi liigid <c1/>, <c2/>, <c3/> ja <c4/>, spektriliikide <c5/>, IQ kampaania MODELLED võrdluskõver ja labfit'i vaike-Q ning interop-stseeni eksport.

# text
# c1: DialogWrapper
# c2: Messages.showChooseDialog
# c3: FileChooserDescriptor
# c4: FileChooserDescriptorFactory.createSingleFileDescriptor()
# c5: BrowserUtil.browse(Path)
# c6: browse(File)
# c7: verifyPlugin
# c8: KSHANA_VERIFY_IDES
seg-89672d99e9e2 = JetBrainsi plugin: aegunud või eemaldamiseks ajastatud platvormi API-sid pole. Viis valikudialoogi kasutavad aegunud <c2/> asemel väikest <c1/> rippmenüüga; ühe faili valijad kasutavad aegunud <c4/> asemel konstruktorit <c3/>; animatsioon avatakse aegunud <c6/> asemel meetodiga <c5/>, mille platvorm { "2026.3" } ajastab eemaldamiseks. Since-build jääb { "243" }. IntelliJ Plugin Verifier teatab tulemuse Compatible, ilma aegunud või eemaldamiseks ajastatud kasutuseta, versioonide { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) ja { "2026.3" } EAP (IU-263.6259.32) vastu; <c7/> kontrollib vaikimisi versiooni { "2024.3" } ja mis tahes loendit, mis on antud muutujas <c8/>.

# text
# c1: gnss_sim::run_gnss_sim
# c2: jamming::run_jamming
# c3: Result
# c4: [skyline]
# c5: api::run_toml
seg-58ee61cbd633 = <c1/> ja <c2/> tagastavad <c3/>: kehtetu jaotis <c4/> on viga otse kutsumisel, nagu see oli juba kaudu <c5/>, mitte vaikne tagasilangemine lamedale maskile. <b>Katkestav muudatus</b> nende kahe funktsiooni Rusti kutsujatele.

# text
# c1: iq::campaign
# c2: false-lock
# c3: tests/iq_campaign_false_lock.rs
seg-9b4113258e1e = <b>Kampaania hindaja: päris jälgija valesisselukustumist ei loetud kunagi</b> (<c1/>). Jälgija valesisselukustumise kontroll viib kanali olekust LOCKED olekusse LOST, kui see rakendub. Hindaja märkis selle asemel kanali järgmise uuenduse, mis oli siis lukustamata ja jäi seetõttu lugemata. Sündmus <c2/>, mis on teatatud olekust LOCKED, on nüüd üks episood oma ajahetkel, käituses ja igas seda sisaldavas nimetatud sündmuses. See, mis leiti sisselaskmise ajal või mida kordab juba olekus LOST olev kanal, ei ole uus episood. Uus test ajendab päris valesisselukustumist: seaduslik GPS L1 C/A kandja astub lukustatuna sammu 1/(2T) võrra (<c3/>).

# text
# c1: tests/iq_campaign.rs
seg-ac508954b6a6 = Faili <c1/> võrdluskampaanias muutub ainult ramp/agc-3bit PRN { "11" } (valesisselukustumise episoodid { "0" } → { "1" }, { "426" } ja { "437" } lukustatud tunni kohta).

# text
seg-cfc47d9d9237 = Selle lahtrite DIGESTid kinnitatakse uuesti.

# text
seg-fcfa0de18b05 = Eelregistreeritud hinnatud tulemuste kinnitus jääb kehtima ja taastoodab jätkuvalt täpselt: selle räsis kaardistatakse tagasi parandusele eelnenud väärtusteni ainult need kuus välja, mida muutis see pärast registreerimist tehtud parandus. Parandatud väärtused kinnitatakse eraldi.

# text
seg-b96d34bb1d36 = Ühtki lävi ei muudetud ja ükski VALIDATED rida, joonis ega veebinumber ei nihkunud.

# text
# c1: unobserved_beacons
# c2: warning
# c3: docs/revisions/BEACON-unobserved-cell-changes.md
seg-ccbe11bd50b6 = <b>lunar-frame-campaign: vaatluseta majakas teatatakse nüüd</b> (leidis MR-05). Aruanne saab väljad <c1/> ja <c2/> ainult siis, kui mõnel majakal pole vaatlust, ning siis tulevad vaadeldud majakate sigmad nende endi informatsioonist, mitte kõik nullina. Datum on muutumatu ning ükski vaike-, kaasapakitud ega avaldatud väljund ei nihku (<c3/>).

# text
# c1: lunar_frame::icrf_to_moon_pa
# c2: lunar_od
# c3: moon_080317.tf
# c4: pxform('MOON_ME','MOON_PA')
# c5: docs/design/evidence/fut05b-me-pa-offset-sign/
# c6: tests/agency_lro.rs
seg-c223c1fc1323 = <b>Kuu peatelgede tugisüsteem</b> (<c1/>, kasutavad <c2/> ja LRO sobitus): DE421 keskmise Maa ja peatelgede nihe failist <c3/> rakendati vales suunas ja vales Euleri järjekorras, nii et analüütiline PA tugisüsteem asus PA-st umbes { "208" }″ eemal selle asemel, et sellel olla. Nüüd on see ümber kirjutatud nii, nagu SPICE'i Frames Required Reading seda defineerib, ja ühtib SPICE'iga <c4/> täpsusega { "2.6e-16" } rad; analüütiline PA tugisüsteem on DE440 PA-st { "6" }″ kuni { "8" }″ kaugusel (eelregistreeritud e1ead19b, uuesti registreeritud be33382e pärast seda, kui esimene kavandatud muudatus jäi lävele { "1e-12" } alla; <c5/>). Nihkuvad avaldatud arvud: LRO sobitus (<c6/>) toorkattuvus { "53.8" } → { "39.9" } m, dünaamiline { "12.6" } → { "12.05" } m, redutseeritud dünaamiline { "6.65" } → { "6.67" } m (läved muutumatud). Analüütiline pinu ühtib nüüd ANISE DE-klassi ristvalideerimisega ({ "12.0" } / { "6.67" } m) mõlemal tasemel; varasem dünaamilise taseme lõhe oli see viga.

# text
# c1: [terrain] dem_hgt
# c2: inline_only::FILE_SOURCE_KEYS
# c3: _hgt
seg-ef2b49d4ad48 = <b>MCP server keeldub väljast <c1/></b> (CAP-06b järeltöö). Liigi jamming maastikulahtri tee on nüüd failis <c2/>. Sisemine pind keeldub stsenaariumist, mis ühe nimetab, teatega, mis ei kanna ei teed ega operatsioonisüsteemi viga. Failiallika kaitse test märgib nüüd ka väljad, mis lõpevad <c3/>.

# text
# c1: Jd2::from_parts
seg-ef005d2e3d42 = <c1/> murdosalise päevaosaga kaotas murdosa UTC, TAI, UT1 ja Maa pöörlemise teisendustes (üks tund päevaosa pööras Maad { "15" }° valesti); päevaosa normaliseeritakse nüüd täisarvuks. Ühtki mootori kutsujat see ei mõjutanud: igaüks annab täisarvulise päeva ja iga tarnitud väljund on bitthaaval identne.

# text
seg-144d90307ec6 = Kavandatud

# text
# c1: src/skyline.rs
# c2: sky-blocked
# c3: open_fraction
# c4: nmea-scenario
seg-7ef4cd25cb87 = Geomeetria esitatud skyline'ist ({ "0.36" } punkt { "1" }, nüüd mootoris kujul <c1/>): <c2/> ja <c3/> skyline'ist, kui sisend selle annab (asimuudilünk tagavarana), looduslik halvenemise (fjord või terminal) sündmus failis <c4/> ning projekteerimismärkuse kaks maskeeritud geomeetriat sigma_UERE x DOP real, eelregistreeritud lisana.

# text
# c1: Status
# c2: unknown
# c3: $PKSHT
seg-49481d2fdf31 = Geomeetria navigatsiooniga RINEX-logidele (mootori enda lahendist) ja Androidi logidele (ridadest <c1/>); mõlemad loevad täna <c2/>. Geomeetria lauses <c3/> (versioon { "1" } muutumatu versioonis { "0.36" }) ning Signal K ja OpenCPN integratsioonid.

# text
# c1: loss-of-lock
# c2: signal_loss
# c3: environment
seg-57df1332ff87 = Olemasolev lünk, mida versioonis { "0.36" } ei toodud sisse: kui iga satelliidi SNR-väli on tühi, ei rakendu ükski <c1/> ega C/N0 vähendus; täielik signaalikadu on nähtav ainult geomeetriamonitori <c2/> kaudu (klassifitseeritud <c3/>). Selle vähendus on kavandatud.

# text
seg-a5a7a10ee11c = Skeemi { "1.3" } voog välistes telemeetriaoraaklites (sõltumatutes etalonides) (Prometheuse tekstivormingu parser ja OTLP kollektor), mis katavad täna ainult { "1.2" } vooge.

# text
seg-caa1977b5b5e = Kahepoolne takistus (kanjon või kitsas fjord) loetakse signaalikaoks, mitte blokeeritud taevaks, kuni skyline on integreeritud.

# text
seg-4bd0f178ca4e = Kolmandate osapoolte tehisintellekti kliente nimetav lõik on siin välja jäetud; see on GitHubis failis <a1>CHANGELOG.md</a1>.

# text
seg-b2689beaba9e = Galileo OSNMA kontrollija

# text
# c1: kshana::osnma
# c2: kshana osnma verify <input>
# c3: $PKSOS
# c4: docs/OSNMA.md
# c5: --format ubx
seg-d16c9b4bf537 = <b>Uus moodul <c1/> ja <c2/>: avatud, puhtalt Rustis kirjutatud vastuvõtjapoolne Galileo OSNMA kontrollija.</b> See loeb I/NAV lehti ja teatab satelliidi ja epohhi kaupa, kas navigatsiooniandmed on autenditud, koos põhjusega iga tõrke või viivituse kohta: HKROOT ja MACK parsimine, DSM-KROOT ja DSM-PKR uuesti kokkupanek, avaliku võtme Merkle'i kontroll, TESLA võtmeahela kontroll, MACSEQ ja sildi kontroll ADKD { "0" }, { "4" } ja { "12" } jaoks, kaasa arvatud ristautentimine, ning kujult <c3/> tulemus vastuvõtja usaldusmonitorile. Väljund kannab nõuannet, et olek ei ole navigatsiooni terviklikkuse teenus. <c4/> ütleb, mida kontrollitakse ja mida mitte, ajanõude ning et Kshana ei anna õigusi ELi OSNMA ICD IPR-ide alusel (kasutajad toetuvad ICD lisa E volitusele). Realiseeritud SIS ICD väljaande { "1.1" } ja vastuvõtja juhiste väljaande { "1.3" } vastu. Lehed on CRC-kontrollitud ja u-blox UBX-RXM-SFRBX baitivoogu saab otse lugeda (<c5/>). Vaiketestid kasutavad sünteetilisi andmeid ja avaldatud primitiivide teadaoleva vastuse teste; valikuline test loeb ametlike vektorite kohalikult alla laaditud koopiat. Pärast sõltumatut ülevaatust võtab kontrollija oma aja ainult kontrollitud TESLA võtmetest (võltsitud kauge tuleviku alamkaader ei saa enam tõrget kustutada), laseb autentimisel aeguda ja järgib kasutusel olevat IODnav-i, arvestab kontrollitud häireteateid (mille Merkle'i leht sisaldab nüüd juhuslikku NPK välja) ja NMA olekut „don't use“, hoiab näivmärgised satelliidi olekust väljas, hoiab ahelaid CID järgi koos tühistamise ja uuendamisega, kontrollib KROOT täiteräsi ning piirab UBX kaadri pikkusi ja TESLA kontrolli tööd. Satelliit loetakse autenditud olevaks ainult seni, kuni selle saadetav uusim efemeriidi- ja kelladata on bitthaaval see andmestik, mis autenditi (mitte pelgalt sama IODnav-i all); olek või tühistamine autentimata NMA päisest loetakse ainult siis, kui kaks satelliiti on nõus või kontrollitud KROOT seda kannab, korratud vanem KROOT ei saa ahelat asendada ja soiku jäänud võtmevoog teatatakse.

# text
seg-3e7df5c888ca = Lisatud (MCP serveri kanalid)

# text
# c1: kshana-mcp --http <addr>
# c2: --allow-remote
# c3: KSHANA_MCP_HTTP_TOKEN
# c4: docs/deploy/mcp-http.md
seg-4e70d8b85211 = <b><c1/>, voogedastatav HTTP, ise majutatav.</b> Vaikimisi loopback; mitte-loopback aadress vajab väärtust <c2/> ja kandja (bearer) tokenit muutujas <c3/>; ükski tööriist ei loe ega kirjuta teed (IQ failitööriistad on väljas); päringu suuruse, aja ja samaaegsuse piirangud; CORS-päist pole; Hosti ja Origini kontrollid. Kshana ei majuta ühtki lõpp-punkti (<c4/>, koos Dockeri, Fly.io ja Cloud Runi mallidega).

# text
seg-c392cde151c9 = Lisatud (liidesed)

# text
# c1: osnma_verify
# c2: kshana osnma verify
# c3: --json
# c4: advisory
# c5: docs/SURFACES.md
# c6: docs/OSNMA.md
seg-19ab5c068b6e = <b><c1/> Pythonis ja WebAssembly's.</b> Kontrollija käsu <c2/> taga mälus olevatel baitidel, tagastades JSON-i, mida <c3/> trükib (nõuanne selle väljal <c4/>; ainult autentimise olek, mitte navigatsiooni terviklikkuse teenus). Samad keeldumised mis käsurea puhul. Mitte MCP-s: sisend on pikk töötlemata vastuvõtjavoog, mida CLI ja Python teenindavad paremini. <c5/> ja <c6/> ütlevad seda.

# text
# c1: trust_telemetry
# c2: receiver-trust
# c3: kshana trust-telemetry
# c4: kshana::surface::trust_telemetry
# c5: /kshana-trust-telemetry
# c6: trust-telemetry
# c7: wasm
# c8: python
# c9: otlp
seg-6128929994b4 = <b><c1/> WebAssembly's, Pythonis ja MCP-s, pluginakäsu ja JetBrainsi toiminguga.</b> Renderdab usaldusvoo või tulemuse <c2/> Prometheuse tekstina, CEF- või LEEF-süslogiridadena või OTLP JSON-i andmekoormana, kodeerijatega, mida kasutab <c3/> (<c4/>); sokkel puudub ja kella pole. Plugin: <c5/> ja oskus <c6/>. JetBrains: Render Trust Telemetry. Funktsioonid <c7/> ja <c8/> ning MCP server lubavad nüüd ka <c9/>, mis ei lisa ühtki crate'i.

# text
# c1: kshana --help
# c2: receiver-trust evidence
# c3: evidence
# c4: trust-telemetry
# c5: nmea-scenario
# c6: compliance-and-test-bench
# c7: docs/SURFACES.md
seg-83d01411c6d4 = <b>Pariteedi pühkimine.</b> JetBrainsi toimingud Validate Scenario, List Scenario Kinds ja Assess Receiver Stream; <c1/> loetleb nüüd <c2/>, <c3/>, <c4/> ja <c5/>; märkmik <c6/> (compliance'i vastendus ja test-bench'i eksport); ning iga allesjäänud JetBrainsi lahter „CLI only“ failis <c7/> on nüüd selge N/A koos põhjusega.

# text
seg-062ef0cf7ee7 = Lisatud (tõendipaketid)

# text
# c1: kshana receiver-trust evidence
# c2: kshana evidence verify
# c3: kshana evidence keygen
# c4: *.evidence-key
# c5: verify
# c6: --pubkey
# c7: openssl ts -verify
# c8: kshana::evidence
# c9: wasm32
# c10: ed25519-dalek
# c11: zeroize
# c12: docs/EVIDENCE-PACKS.md
seg-9889575c2df1 = <b><c1/> ja <c2/>: allkirjastatud kontrollitavad tõendipaketid GNSS-i usaldussündmuse jaoks.</b> Pakett koondab töötlemata logilõigu ja kogu logi SHA-256, konfiguratsiooni kõigi lävedega, epohhipõhised tulemused ja põhjused, mootori versiooni, räsiahelaga manifesti ja iseseisva HTML-kokkuvõtte, allkirjastatuna Ed25519-ga (võti käsust <c3/> või teie enda failist; võtmeid ei salvestata kunagi paketti ja <c4/> on git-ignore'is). <c5/> kontrollib iga räsi, ahelat ja allkirja ning nimetab täpselt, mis ebaõnnestub; valikuga <c6/> kinnitab see allkirjastaja. RFC { "3161" } tõendi saab lisada ning see loetakse ja seotakse manifestiga (autoriteedi enda allkirja see ehitus ei kontrolli; <c7/> katab selle). Logilõik on akna täpsed baidid seal, kus lugeja teatab allika vahemikke (NMEA, UBX, RINEX { "3" }, Android), vastasel juhul kogu logi, ja manifest ütleb, kumb. Loomine ja kontrollimine on puhtad avalikud funktsioonid (<c8/>), mis ehitatakse sihtmärgile <c9/>. Paketid ütlevad, et need on tehniline kirje, mitte õiguslik arvamus. Uued sõltuvused on puu <c10/> (BSD-3-Clause ja Apache-2.0/MIT, minimaalsed funktsioonid) ja otsene <c11/> (juba selles puus) võtmematerjali kustutamiseks. Vt <c12/>.

# text
seg-280fd37126c1 = Lisatud (usaldustelemeetria)

# text
# c1: kshana trust-telemetry
# c2: receiver-trust
# c3: /metrics
# c4: otlp
# c5: kshana_trust_syslog_send_failures_total
# c6: /metrics
# c7: deploy/grafana/
# c8: docs/TRUST-TELEMETRY.md
# c9: src/telemetry/sample.rs
seg-ebd269c618b0 = <b><c1/>: GNSS-i usaldus turvatelemeetria allikana.</b> Loeb epohhipõhist usaldusvoogu (JSON-read: skoor 0-100, riba, põhjused) või partii tulemust <c2/> ja annab selle Prometheuse lõpp-punktile <c3/> (vaikimisi localhost), süslogisündmustele CEF- või LEEF-vormingus RFC { "5424" } ümbrises (UDP või TCP) ning vaikimisi väljalülitatud funktsiooni <c4/> taga OTLP/HTTP JSON-ekspordile. Edastus töötab töölõimedel ühenduse ja kirjutamise ajapiirangutega, piiratud taasühenduse tagasilöögiga ja loenduriga <c5/>, nii et surnud või kinni jäänud kollektor ei saa reaalajas hindamist peatada ega külmutada lõpp-punkti <c6/>; põhjusesildid on piiratud { "64" } jadaga. Uusi sõltuvusi pole. Näidis-Grafana töölaud on kataloogis <c7/>. Mõõdikute nimed, sildid ja CEF/LEEF väljade vastendus on failis <c8/>. Voo vorming on isoleeritud failis <c9/>.

# text
seg-fa5e803edb44 = Merendusliku usalduse hindamine: reaalajas skoor 0-100 liikuva laeva lahendi kohta, NMEA { "0183" }-st, mida vastuvõtja juba väljastab, koos valikulise väravaga.

# text
# c1: kshana receiver-trust
# c2: [platform]
# c3: kind = "static"
# c4: "vessel"
# c5: [maritime]
# c6: [score]
# c7: kshana receiver-trust live <session.toml>
# c8: $PKSHT
# c9: --gate
# c10: V
# c11: N
# c12: --listen tcp:<port>
# c13: examples/maritime-trust/
# c14: docs/MARITIME-TRUST.md
seg-c5b3fcb9bba8 = <c1/> võtab tabeli <c2/> (<c3/> või <c4/>, laeva maksimaalne kiirus, kiirendus ja pöördekiirus, antenni kõrgus veeliinist ja valikuline suunaandur; iga vaikeväärtus dokumenteeritud oma põhjusega). Laeva puhul asendatakse staatiline asendihüppe monitor, mis mõõdab kaugust kalibreerimise keskmisest ja on liikuval laeval vale, põhjuslike liikuva platvormi monitoridega: asendi kinemaatiline kooskõla teatatud kiiruse ja kursiga ning laeva piirangutega, güroskoobi suund võrreldes kursiga maapinna suhtes, kiirusmõõtur võrreldes kiirusega maapinna suhtes, antenni kõrgus võrreldes märgitud kõrgusega veeliinist, C/N0 hajuvuse kokkuvarisemine ja samaaegne tõus kalibreerimise lähtetaseme suhtes ning ajakooskõla (reaalajas režiimis ka selle arvuti kellaga). See loeb ka teatatud autentimisolekut, kogu ulatuses või satelliidi kaupa (ainult teatatud olek: OSNMA krüptograafiat pole). Iga lävi on enne käitust kirjas tabelis <c5/>. Seejärel saab iga epohh skoori vahemikus { "0" } kuni { "100" } deterministliku, eelregistreeritud vastendusega (õppimist pole, midagi pole sündmustele sobitatud; kaalud, riba piirid ja tõend on hoitud tabelis <c6/>), vastendatuna olemasolevatele usaldusolekutele, koos monitoridega, mis vähendasid, ja nende punktidega. Staatilised stsenaariumid on muutumatud ja räsituvad nagu varem. <c7/> loeb stdin-i, lisatavat faili, TCP-d või UDP-d ja kirjutab epohhi kohta ühe JSON-rea ning proprietaarse lause <c8/>; valikuga <c9/> laseb see voo muutmata läbi, kuni lahend on usaldatud, ja märgib lahendi kehtetuks (GGA kvaliteet { "0" }, RMC ja GLL olek <c10/>, GNS ja VTG režiim <c11/>), kuni see ei ole. Värav on väljas, kui pole küsitud; <c12/> teenindab väravaga voogu suvalisele arvule TCP klientidele (vaikimisi loopback, aeglane klient visatakse välja, mitte ei blokeeri teisi). See on nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }); operaator vastutab jätkuvalt. <c13/> on sünteetiline Tallinna–Helsingi logi, kirjutatud ainult tekstina, osaliselt positsiooni triivimisega, mille ajal vastuvõtja jätkab kehtiva lahendi teatamist; selle oodatav väljund on testiga kinnitatud. Juhend: <c14/>. Kontrollid ei näe spuufijat, kelle lahend on kooskõlas kõigega, mis andmesiinil liigub; juhend ütleb seda.

# text
seg-80f3f0aae42c = Häirekaart

# text
# c1: kshana interference-map
# c2: kshana route-exposure
# c3: fetch-land --allow-network
# c4: flate2
# c5: null
# c6: <source>-<dataset>-<date>.geojson
# c7: docs/INTERFERENCE-MAP.md
# c8: docs/data/INTERFERENCE-DATA-SOURCES.md
seg-8539a42718cb = <b><c1/> ja <c2/>: avalik pilt sellest, kus õhusõidukid ja laevad teatasid halvenenud navigatsiooniandmetest ning kui palju see marsruuti puudutab.</b> Sisendid on kohalikud CSV-failid, mis on tehtud avatud litsentsiga ADS-B (adsb.lol, ODbL { "1.0" }) ja AIS (NOAA MarineCadastre, Kystverket NLOD { "2.0" } all) andmetest; iga väljundfail on üks allikas ja üks UTC päev GeoJSON-i, mis kannab meetodit, selle lävesid, andmelitsentsi, viidet ja allika katvuse kallutatust. ADS-B meetod koondab NIC ja NACp fikseeritud ruudustikule ja nimetab lahtri halvenenuks eristuvate õhusõidukite osakaalu põhjal, kaitsetega seadmete vastu, mis kunagi täpsust ei teata, madala kõrguse ja laiaulatuslike põhjuste vastu. AIS meetod käitab viit detektorit: asendid maismaal (kasutaja antud rannajoone vastu), ringjad rajad, ebausutavad hüpped, ebausutavad kiirused ja paljud laevad ühes asendis. Läved on nimetatud meetodiversiooni eelregistreeritud konstandid. Ainult koondandmed: identifikaatorid räsitakse mälus ega kirjutata kunagi ning lahtreid, kus on alla { "5" } eristuva õhusõiduki või laeva, ei avaldata. Halvenenud lahter ei ole häire tuvastus. Vaikekäsud ei kasuta võrku; valikuline abiline <c3/> laadib Natural Earthi maismaapolügoonid alla commitiga kinnitatud aadressilt ja hoiab faili ainult siis, kui selle SHA-256 ühtib. ADS-B sisend on CSV või otse adsb.lol readsb ajaloofailid (uus sõltuvus: <c4/> oma puhtalt Rusti taustaga, gzipi jaoks). Mõlemad meetodid on versioon { "2" }: halvenenud või anomaalne otsus vajab vähemalt { "5" } õhusõidukit või laeva (avaldamise miinimum), iga lahtri arv alla { "5" } peetakse tagasi väärtusena <c5/> ja päev, mille tausta ei saa hinnata, peab oma otsused tagasi. Väljundfailid nimetatakse <c6/> ja neid ei kirjutata kunagi üle; sisend voogedastatakse rida-realt; marsruudi ekspositsioon käsitleb antimeridiaani. Testid kasutavad ainult sünteetilisi andmeid. Vt <c7/> ja litsentsiülevaadet failis <c8/>.

# text
seg-7a54dfab93dc = Lisatud (koolitusvood)

# text
# c1: kshana nmea-scenario
# c2: scenarios/training/
# c3: receiver-trust
# c4: docs/NMEA-TRAINING.md
seg-0b01d1d871e2 = <b><c1/>: sünteetiline sillal kasutatav NMEA { "0183" } meeskonna koolituseks GNSS-i segamise ja spuufimise (spoofing) äratundmisel.</b> Stsenaariumi TOML-ist kirjutab see faili või edastab TCP või UDP kaudu (unicast või broadcast; reaalajas, kiirendatult või nii kiiresti kui võimalik) täieliku sillakomplekti GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT ja VBW laeva trajektoorile pöördekiiruse, kiirenduse ja hoovuse piirangutega, satelliidigeomeetriaga mootori enda nominaalsetest konstellatsioonidest. Skriptitud sündmused ajateljel: segamine, asendi triivimine (kehtiv lahend, mis kaugeneb), aja spuufimine ja kordusviivitus, igaüks algus- ja taastumisrampidega. Instruktori logi (JSON ja tekst) kirjutab üles, mida ja millal süstiti, tegeliku trajektoori ja teatatu kõrvutamisega. Teegi kataloogis <c2/> (avamere segamine, rannikuäärne triivimine, sadamasse sisenemise aja spuufimine, kombineeritud) on koolitaja märkmed. Väljund on kontrollsummaga kehtiv ja algväärtuse (seed) kohta deterministlik; testid kinnitavad stsenaariumi kohta golden-väljavõtte ja loevad iga lause läbi lugejaga <c3/> NMEA. Ainult tekst: RF-, IQ- ega lainekujuväljundit pole; vood on mõeldud koolituseks ja testimiseks ning neid ei tohi mitte kunagi anda laeva reaalajas navigatsioonisüsteemidele. Vt <c4/>.

# text
seg-bb8d508c92fa = Merenduse integratsioonid ({ "0.35.0" }, töövoog B)

# text
# c1: integrations/signalk/
# c2: kshana receiver-trust live
# c3: $PKSHT
# c4: navigation.gnss.kshana.*
# c5: navigation.position
# c6: warn
# c7: alarm
seg-538cdf145ac1 = <b>Signal K plugin</b> (<c1/>, npm-is avaldamata): käitab käsku <c2/> või ühendub sellega (serveri enda NMEA sisend, kohandatud sisendargumendid, JSON-ridade TCP voog või värava voo laused <c3/>), avaldab usaldusskoori, riba, põhjused, alarmid ja värava oleku aadressi <c4/> all (sealhulgas vastuvõtja teatatud asendi kontekstina, mitte kunagi <c5/>) ning tõstab Signal K teate (<c6/> halvenenud korral, <c7/> mitteusaldatud korral, koos hoidmise, kustutamise ja aegumise läve, kõik konfiguratsiooniskeemis). npm-i sõltuvusi pole. Testitud salvestatud sünteetilise väljundiga.

# text
# c1: kshana receiver-trust live --gate --listen tcp:10110
# c2: integrations/opencpn/nmea-tcp-relay.mjs
# c3: $PKSHT
# c4: integrations/opencpn/plugin/
# c5: $PKSHT
# c6: integrations/opencpn/evidence/
seg-b6eb7110291e = <b>OpenCPN</b>: värava režiimi NMEA-d teenindab otse <c1/> (soovitatav); sõltuvusteta TCP relee (<c2/>) on valikuline alternatiiv. Kummalgi juhul näeb OpenCPN kehtetut lahendit, kui usaldus variseb kokku, ja <c3/> oma NMEA silumisaknas; testid mängivad sünteetilise väravaga voo uuesti läbi päris TCP sokli ja kontrollivad, mida tarbija saab. Natiivne skooripaneeli plugin (<c4/>, plugina API { "1.18" }, CMake) loeb <c5/> OpenCPN-i enda NMEA voost ja hoiatab mitteusaldatud riba korral; see ehitub, selle loogikat on ühiktestitud ja seda käitati OpenCPN-is { "5.8.4" } virtuaalekraani all (tõend ja reprodutseerimisskript kataloogis <c6/>); seda pole pakendatud pluginahalduri jaoks.

# text
# c1: deploy/reference-build/
# c2: systemd-analyze verify
# c3: check-units.sh
seg-bb26e8c1aff0 = <b>Etalonehitus</b> (<c1/>): üldine osade loend, OS-i seadistus, nõuandva monitori ja valikulise värava systemd-üksused (kontrollib <c3/> käsuga <c2/>), konteineri variant, Signal K ühendus.

# text
# c1: position
# c2: advisory
seg-6695d4c1f13b = Signal K plugin aktsepteerib reaalajas JSON-skeemi { "1.2" } (seejärel lisatakse võti <c1/> ja võti <c2/>; tundmatud lisatud võtmed jäetakse tähelepanuta), kontrollitud päris { "1.2" } väljundil ja päris signalk-serveri vastu.

# text
# c1: check-units.sh
# c2: inputArgs
# c3: notifications.navigation.gnss.kshana.trust
# c4: $PKSHT
# c5: marine-integrations.yml
seg-622c2d3dd8fa = Ülevaatuse parandused: systemd-üksused taaskäivituvad alati ja töötavad liivakastis (ilma shellita, ilma võrguta seal, kus seda pole vaja), logrotate'i lõik, <c1/> ebaõnnestub iga leiu korral; konteiner käitab värava keskkonnamuutujatest tervisekontrolliga ja räsiga kinnitatud baaspiltidega; Signal K skoori metaandmed, aegunud teade asendatakse, kui andmed jätkuvad, alamprotsesside vead säilitatakse ja tapmised eskaleeruvad, ebaturvalised <c2/> lükatakse tagasi ja teade on aadressil <c3/>; relee piirab hoitud poolikut rida; <c4/> parserid lükkavad tagasi skoorid väljaspool vahemikku { "0" } kuni { "100" }; dokumentatsiooni linkide kontroll; CI töövoog (<c5/>), mis käitab kõik need, kaasa arvatud päris binaarfaili otsast lõpuni.

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7c615a62ca26 = <c1/>. Nõuandev tarkvara, mitte tüübikinnitust omav seade; operaator vastutab jätkuvalt. Ainult tarkvara: miski ei edasta ja ühtki tuvastamise ega valehäire arvu ei väideta.

# text
seg-72cb9f45ce99 = Lisatud: compliance'i vastendus ja test-bench'i eksport

# text
# c1: docs/compliance/
# c2: kshana compliance-report
# c3: kshana compliance-report <result.json>...
# c4: evidenced
# c5: partly-evidenced
# c6: not-evidenced
# c7: out-of-scope
seg-15aae04a9490 = <b><c1/> ja <c2/>.</b> Vastendus Kshana väljunditest viiele vastupidavuse raamistikule ja standardile (USA DHS Resilient PNT Conformance Framework v2.0, IMO juhised laevadele, EASA juhised lennunduses, NIS2 artikkel { "21" }, EN { "16803" }, tasuline standard, mida tsiteeritakse osa kaupa ja kataloogitekstis nähtavate üksikute klauslinumbritega), üks tabel raamistiku kohta: viide, mida see meie parafraasis nõuab, väljundid, mis toetavad tõendeid (supports evidence for) selle kohta, ja lünk. Allikaversioonid, URL-id ning mida loeti ja mida mitte, on kirja pandud. <c3/> täidab vastenduse antud käitustest ja märgib iga rea väärtusega <c4/>, <c5/>, <c6/> või <c7/>, Markdownina ja JSON-ina, lünk säilitatud igal real. Sõnastus on „toetab tõendeid (supports evidence for)“; midagi ei hinnata ega kiideta heaks. Testid kasutavad sünteetilisi käitusi ja ebaõnnestuvad, kui kinnitatud tabel koodist lahkneb.

# text
# c1: kshana bench-export <scenario.toml>
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: GGA
# c6: RMC
# c7: receiver-trust
# c8: [[events]]
# c9: src/interop/testbench.rs
# c10: tests/interop_testbench.rs
# c11: docs/TEST-BENCH.md
# c12: kshana receiver-trust
seg-ee9a0a43e4b0 = <b><c1/>.</b> Kirjutab stsenaariumi <c2/>, <c3/> või <c4/> sõiduki liikumise ja sündmused laboratoorse GNSS-simulaatori jaoks: kasutaja liikumise CSV dokumenteeritud tugisüsteemidega ja metaandmete kõrvalfail, NMEA { "0183" } <c5/>/<c6/>, teekonnapunktide tekst ning sündmused CSV-na ja ploki <c7/> <c8/> kujul (<c9/>). Ainult liikumine ja sündmused: signaali ei kirjutata. Iga fail loetakse tagasi failis <c10/> ja võrreldakse selle märgitud tolerantsi piires. <a1><c11/></a1> annab meetodi ekspordi simulaatori kaudu uuesti esitamiseks ja vastuvõtja logi hindamiseks käsuga <c12/>.

# text
# c1: compliance::run_from_text
# c2: assess_texts
seg-fc0fe915ed3d = <b>Mis loetakse tõendiks.</b> Tulemus loetakse võimekuse kasuks ainult siis, kui see kannab välju, mida selle liik kirjutab; ainult liigi silt ei loe midagi. Tundmatud liigid, tulemus, mis on vastuolus oma naaberstsenaariumiga, mitte-kuueteistkümnendsüsteemi räsid ja moondunud receiver-trust'i arvud on loetletud kasutamata jäetutena koos põhjusega. Aruanne eskapeerib Markdowni lahtrid ega põhjusta paanikat (panic) mitte-ASCII räsi korral. <c1/> ja <c2/> võtavad tekste, mitte teid.

# text
seg-6b46de1164d8 = Test-bench'i eksport.

# text
# c1: --epoch
# c2: UtcEpoch::parse_iso
# c3: gnss-ins
# c4: GGA
# c5: bench-export
# c6: compliance-report
seg-c48a4dd4134b = <c1/> on vahemikukontrollitud (<c2/>); teekonnapunktide fail kontrollib iga intervalli ja käsk ütleb, miks see välja jäetakse; dokumendid märgivad, et <c3/> suund on keha pöördenurk (yaw), mitte kurss, välja <c4/> kohatäited ja stsenaariumi enda kõrgusemuutuse. <c5/> ja <c6/> on kasutusteksti.

# text
# c1: fusion::pack::truth_trajectory
# c2: gnss-ins
# c3: UtcEpoch
seg-eb2e415ec540 = <c1/> avab profiili <c2/> tõelise oleku ajaloo (sama sammutus, mida kasutab liigi enda tõde), ja <c3/> saab NMEA kuupäeva ja kellaaja väljad.

# text
seg-fbfc1a59e99b = Häirekaardi valideerimine

# text
# c1: tests/fixtures/interference_map_ref/PREREGISTRATION.md
seg-a68d88381eea = <b>Häirekaardi dekodeerimise semantikat ja geomeetriat kontrollitakse sünteetilistel sisenditel sõltumatute realisatsioonide vastu.</b> NIC ja NACp koodide tähendused sünteetiliste ADS-B kaadrite pyModeS dekodeerimise vastu, AIS-i mittesaadaval väärtused sünteetiliste AIVDM lausete pyais dekodeerimise vastu, ruudustiku lahtri määramine shapely vastu, marsruudi pikkus lahtri oleku kohta shapely ja GeographicLibi vastu ning sisemaa maskeerimine shapely ja pyproj vastu, kõik tolerantsiga, mis fikseeriti enne esimest võrdlust (<c1/>). See valideerib, kuidas koode ja väljaväärtusi loetakse, ning geomeetriat, mitte seda, et märgitud lahter on häire. Maismaapolügoonide lugeja sulgeb nüüd rõnga, mis ei korda oma esimest tippu ja mille ta varem luges ilma viimase servata. Dokumendid esitavad NACp ja NIC madala täpsuse läved piirina, mida iga kood tähistab (NACp { "6" } on { "556" } m EPU piir, NIC { "5" } { "1" } NM sisalduspiir).

# text
seg-cf4ffdbba1a6 = Lisatud (telemeetriavormingute ja tõendipakettide valideerimine)

# text
# c1: docs/EVIDENCE-PACKS.md
# c2: cryptography
# c3: opentelemetry-proto
# c4: docs/EVIDENCE-PACKS.md
# c5: VerifyReport
# c6: signature_valid
# c7: scripts/gen_ed25519_rfc8032_ref.py
# c8: scripts/gen_evidence_pack_ref.py
# c9: scripts/evidence_verify_cleanroom.py
# c10: scripts/gen_telemetry_formats_ref.py
# c11: evidence_crypto_reference
# c12: evidence_pack_reference
# c13: telemetry_formats_reference
seg-ad6730e0e891 = <b>Välised kontrollid tõendipakettide krüptograafia, paketikontrollija ja telemeetria andmevormingute kohta.</b> RFC { "8032" } jaotise { "7.1" } Ed25519 testvektorid ({ "1" }, { "2" }, { "3" } ja { "1024" }) ning FIPS 180-4 SHA-256 näited käitatakse läbi paketi enda allkirjastamise, kontrollimise ja räsimise funktsioonide, täpse võrdsuseni. Pythonis kirjutatud kontrollija, mis on tehtud ainult faili <c1/> normatiivse jaotise põhjal (hashlib ja <c2/>), on { "71" } terve ja muudetud paketi puhul Rusti kontrollijaga nõus: otsus, tõrgete hulk, allkirjaotsus ja mõlemad ahela pead. Meie Prometheuse eksponeering loetakse ametliku Pythoni kliendi parseriga ja meie OTLP JSON ametliku <c3/> sõnumiga, rangelt, ja mõlemad on nõus olekuga, millest need tehti. CEF-il ja LEEF-il pole sõltumatut avatud valideerijat ja need jäävad modelleeritud. <c4/> sai normatiivse paketivormingu ja kontrollimismenetluse, mille põhjal puhtalt (clean-room) kontrollija kirjutati; <c5/> sai välja <c6/>. Sõltumatud etalonid (sõltumatud etalonid) ja fikstuurid: <c7/>, <c8/> koos <c9/>, <c10/>; testid <c11/>, <c12/> ja <c13/>. CI ei vaja Pythonit.

# text
seg-20d1b02bfda4 = Lisatud (CEF-sündmuste valideerimine)

# text
seg-8c464e43e43d = Telemeetria CEF-sündmused loetakse tagasi õigesti kahe sõltumatu avatud lähtekoodiga parseriga.

# text
# c1: pycef
# c2: logstash-codec-cef
# c3: =
# c4: pycef
# c5: tests/cef_reference.rs
# c6: tests/fixtures/cef/
# c7: scripts/gen_cef_ref.py
# c8: scripts/gen_cef_logstash_ref.py
# c9: cfp1
# c10: cfp2
# c11: cn1
# c12: cn2
seg-a6321d13b0ab = <c1/> { "1.11" } ja Logstashi CEF-kodek (<c2/> { "6.2.7" } Logstashis { "8.15.3" }) parsivad { "157" } CEF-rida (iga riba muutus ja iga epohh kinnitatud telemeetriavoos, pluss vaenulik tekst, mis sisaldab <c3/>, kaldkriipse, püstkriipse, reavahetusi, tabulaatoreid ja mitmebaidist teksti) ning taastavad iga päisevälja, tõsiduse, laiendivõtmete täpse hulga ja iga väärtuse täpselt. Logstashi kodek loeb ka nelja rida, mille päisetekst vajab paomärke, mida <c4/> ei suuda. Lävi registreeriti enne mõlema parseri käitamist (<c5/>); fikstuurid kataloogis <c6/>, sõltumatu etaloni skriptid <c7/> ja <c8/>; CI ei vaja ei Pythonit ega Logstashi. LEEF-il pole hooldatavat avatud parserit ja see jääb modelleeritud. CEF-sündmused kannavad nüüd usaldusskoori ja epohhi nihke CEF-sõnastiku ujukomakohandatud väljades (<c9/>, <c10/>) täisarvuväljade <c11/> ja <c12/> asemel, mis sobisid kummalegi väärtusele halvasti; CEF on selles väljalaskes uus, seega ükski varem tarnitu ei muutu.

# text
# c1: assess_receiver_log
# c2: text
# c3: base64
seg-65b362fa8711 = MCP: <c1/> aktsepteerib logi kujul <c2/> või <c3/>; tööriista sisend on piiratud { "4" } MiB-ga.

# text
seg-8999974aa1fa = Segamise diagramm võtab oma värvid samuti paletist.

# text
# c1: src/jamming.rs
# c2: *.chart.svg
# c3: jamming
# c4: maritime-strait-jamming
# c5: jamming
# c6: src/palette.rs
# c7: tests/palette_sync.rs
# c8: jamming-demo
# c9: maritime-strait-jamming
# c10: font-family
# c11: web/studio/recorded/
seg-8c8ff384dbf6 = <c1/> oli ainus moodul, mille Observatory paleti uuendus jättis oma värvidele, kui segaja-Q töö maandus; selle <c2/> (stsenaariumid <c3/>, <c4/> ja teised liigist <c5/>) loeb nüüd faili <c6/> ning lubatud loend failis <c7/> on tühi. Ainult värvid ja font: diagrammid <c8/> ja <c9/> on võrdsed oma varem salvestatud renderdustega, kui värv, <c10/> ja versiooni jalus on normaliseeritud. Ükski joonistatud väärtus ei nihkunud. Salvestatud Studio koopiad kataloogis <c11/> salvestati uuesti versioonide { "0.33.0" } ja { "0.34.0" } ümberportimisel (ainult versioonitempel): need kannavad endiselt segamise diagrammi vana värvi ja saavad paleti värvi järgmisel ümberportimisel.

# text
# c1: flicker_floor
# c2: clock-ensemble
# c3: consistent = false
# c4: flicker_floor
# c5: integrity
# c6: clock-ensemble
# c7: filter_health
# c8: holdover_s
# c9: timing_p95_ns
# c10: scenarios/orbit-gnss-challenged.toml
# c11: fom.integrity
# c12: filter_health
# c13: filter_health.consistent
# c14: true
# c15: false
seg-a059d10c5330 = <b>Kellaansambli 3-sigma piir katab nüüd flicker-põhja ja filtri tervisekontroll näeb seda.</b> Väärtusega <c1/> kandis tõeline kell flicker FM-i, kuid kahe oleku filter, mis annab terviklikkuse piiri, mitte, nii et tarnitud stsenaariumi <c2/> 3-sigma kate oli { "0.41" } (klassikaline) ja { "0.33" } (kvant), ning NIS/NEES kontroll, mis tõmbas oma tõe filtri mudelist, teatas identseid väärtusi põhjaga ja ilma. Piir on nüüd kahe oleku dispersioon pluss viimasest sünkroonimisest kogunenud flicker-faasi täpne dispersioon, arvutatuna samast pangast, mida tõeline kell kasutab; NIS/NEES kontroll tõmbab oma tõe laiendatud mudelist selle pangaga ja käitab sobitatud laiendatud filtrit (ning kahe oleku filter flicker-tõe vastu teatab <c3/>). Väljundi muutus, ainult nullist erineva <c4/> kellade puhul: <c5/> stsenaariumil <c6/> läheb väärtustelt { "0.40866" } / { "0.33026" } väärtustele { "0.99970" } / { "1.0" } (klassikaline / kvant) ja <c7/> NIS/NEES sisaldavad nüüd flickerit; ajaviga, <c8/> ja <c9/> on muutumatud ning stsenaariumid ilma põhjata on baitideni identsed. Nihkub ka <c10/> (orbiidi liik, algväärtus (seed) { "7" }, põhjad { "1e-16" } / { "2e-11" }): <c11/> klassikaline { "0.7734" } väärtusele { "1.0" } ja kvant { "0.9796" } väärtusele { "1.0" }, ning <c12/> NIS/NEES ja nende ribad muutuvad. Selle kvant <c13/> läheb väärtuselt <c14/> väärtusele <c15/>: 16 algväärtuse ja 60 sammu flickeri ansambli valimisündmus (NIS { "0.8815" } riba [{ "0.9125" }, { "1.0914" }] vastu), mitte defekt. Riba on { "95" } % riba, nii et umbes { "5" } % algväärtustest märgib sobitatud filtri konstruktsiooni tõttu ({ "40" } selle stsenaariumi uut algväärtust: kvant { "1" } ja klassikaline { "2" } märgitud); suuruses { "64" } korda { "200" } on sama algväärtus mõlema kella puhul ribas (NIS { "0.990" } ja { "1.001" }). Teadaolev järeltöö: liigil fusion on sama lõhe (klassikaline terviklikkus { "0.80" } põhjaga); liik hybrid jääb üle { "0.99" }.

# text
seg-c7308350b6d4 = <b>MCP serveri sisend karmistatud.</b> MCP serveri stsenaariumitööriistad aktsepteerivad nüüd ainult sisemist sisu ja keelduvad failiallika väljadest; sisendi suurus on piiratud. Turvateade: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

# text
seg-065c4431197e = Labori kordusesitus: jälgimismootor, tuvastusmonitorid ja kampaaniakäitaja GNSS-i IQ salvestuste jaoks, koos nendega kaasnevate ahelakujunduste, C/N0 hinnangute ja skooridega. Tõendusklass: kõik allpool on <b>MODELLED</b> või kontrollitud sisemise kooskõla osas suletud kujude ja algväärtustega (seed) simulatsiooni vastu; ükski neist ei lisa VALIDATED rida ja kontrollimise register on muutumatu ({ "251" } rida: { "124" } valideeritud, { "123" } modelleeritud, { "4" } partneri). See on tarkvaraline analüüsikiht: siin ei sünteesita segaja ega spuufija lainekuju ja miski ei edasta.

# text
seg-912ecb44cee4 = Labori kordusesitus: testitingimused, kampaaniakäitaja ja hindamine ({ "0.34.0" }).

# text
# c1: kshana iq campaign <campaign.toml>
# c2: kshana.loop-design/1
# c3: kshana.test-conditions/1
seg-962c50f9ce8d = <c1/> mängib uuesti läbi salvestused × esiotsa ahelad × ahelakujundused (<c2/>) ja hindab iga lahtrit salvestuse kohta käiva testitingimuste faili (<c3/>, TOML või JSON) vastu. See fail ütleb, mida labor salvestusest teab: oodatavad satelliidid ja iga sündmuse kohta selle tüübi silt, algus ja lõpp, mõjutatud satelliidid ning märgitud J/S või segaja võimsusprofiil. See on ainult metaandmed. Hinded satelliidi kohta, kogu käituse ja sündmuse kohta on:

# text
seg-180447aaf31e = kättesaadavus, aeg lukustuse kaotuseni ja märgitud J/S kaotuse hetkel;

# text
seg-1ababddb0d87 = uuesti hõivamise aeg, sündmuse lõpust ja kaotusest;

# text
seg-a6468323c971 = mõõdetud C/N0 halvenemine märgitud J/S klassi kohta;

# text
seg-4cb6f510e159 = valesisselukustumise episoodid lukustatud tunni kohta (jälgija lipp või Doppler tõe kõrvalfaili vastu);

# text
seg-97c6243bac2e = PLL-i ja DLL-i diskriminaatori jitter.

# text
# c1: jamming::effective_cn0_dbhz
# c2: Q
seg-014b28f61db8 = Iga mõõdetud halvenemiskõvera kõrval joonistatakse analüütiline spektraaleraldatuse etalon (<c1/> tüübi <c2/>-ga) ja märgitakse MODELLED kõikjal, kus see ilmub.

# text
# c1: data_class
# c2: synthetic
# c3: client-confidential
# c4: run.epochs
# c5: kshana.track-epoch/1
# c6: cell_key
# c7: report::digest
# c8: scorecard.csv
# c9: .json
# c10: report.html
# c11: DIGEST
# c12: [scoring.bars]
seg-eb5c38197dab = Lahtrid käivad paralleelselt läbi jälgimissessiooni lukustusoleku olekumasina ja igaüks kirjutatakse aatomiliselt sisuräsi võtme all. Võti katab salvestuse SHA-256, tingimuse, esiotsa, kujunduse, käituse ja hindamise räsid, nõutava <c1/> (<c2/> | <c3/>) ning mootori versiooni. Kui <c4/> on seatud, säilitatakse ka iga lahtri voog <c5/> ja lukustussündmused, nimetatuna lahtri võtme järgi ja räsitud lahtrisse. <c6/> ja <c7/> on avalikud, nii et tarbija saab iga võtme ja digesti uuesti tuletada. Seetõttu jätab kordusläbimine valmis lahtrid vahele ning väljundid ei sõltu kunagi töötajate arvust. Käitus kirjutab <c8/>/<c9/>, iseseisva <c10/> ja faili <c11/>. Läbimise/mitteläbimise läved (<c12/>, salvestuse kaupa üle kirjutatavad) rakendatakse aruande koostamisel.

# text
# c1: [scoring] cn0_estimator = "m2m4" | "nwpr"
# c2: "m2m4"
seg-beec1c1264c9 = <c1/> (vaikimisi <c2/>, osa hindamise räsist) valib C/N0, mis on teatatud C/N0 ja halvenemiskõvera taga. Mõlemat hinnangut hinnatakse ja teatatakse alati (kogu käituse ja lähtetaseme mediaanid ning J/S klassi kohta) ning lahter ja tulemuskaart registreerivad hinnangu. NWPR loeb ahela enda jitteri all umbes { "8" } dB × Bn·T liiga madalaks; M2M4 mitte.

# text
seg-baf1a2422a66 = Samuti uus:

# text
# c1: kshana iq campaign report <dir>
seg-f36e22ff54c3 = <c1/> ehitab tulemuskaardid, aruande ja digesti lahtritest uuesti üles;

# text
# c1: kshana iq conditions <file>
seg-aad7fcc28bc8 = <c1/> kontrollib testitingimuste faili selle skeemi vastu;

# text
# c1: events_from_sigmf = true
# c2: kshana:test_event
seg-c3e5e4461aaa = <c1/> impordib SigMF salvestuse annotatsioonid <c2/> sündmustena;

# text
# c1: iq_test_conditions
# c2: iq_campaign
# c3: iq_campaign_report
seg-c1a2ebb844c5 = Python saab funktsioonid <c1/>, <c2/> ja <c3/>;

# text
# c1: kshana-mcp
# c2: iq_campaign
# c3: iq_campaign_status
seg-cd69258ccc09 = <c1/> saab funktsiooni <c2/>, mis on inkrementaalne ja jätkatav kutsekohase valimieelarve all, kus iga fail on piiratud töökataloogiga, ning funktsiooni <c3/>.

# text
# c1: tests/iq_campaign.rs
seg-c398b66a7058 = Testid: <c1/> käitab sünteetilise kampaania { "3" } salvestust × { "2" } esiotsa × { "2" } kujundust. Selle stseenid kannavad märgitud C/N0 profiile ja see katab:

# text
seg-3f2fbdecb101 = iga mõõdiku, mida kontrolliti süstitud tõe vastu;

# text
seg-e103a30260db = jätkamise pärast osalist ühe töötajaga käitust rikutud lahtriga, baitideni identne katkestamata nelja töötajaga käitusega;

# text
seg-79164d8b0b22 = lahtripõhised epohhifailid;

# text
# c1: reacquire
# c2: reacquire
seg-9470016f056a = { "20" } s kolme satelliidi uuesti hõivamise regressioon: kui <c1/> on sees, on iga kanal tagasi { "2" } s jooksul { "2" } s lõhest; väljalülitatud <c2/> tulemus on kinnitatud;

# text
seg-1deb4ab83054 = läved hinnatud uuesti ilma uuesti käitamata;

# text
seg-351f9cdcbcd6 = CLI;

# text
seg-2c35af369a36 = vahele jäetud väljalaskerežiimi läbilaske- ja mälukontrollid, kaasa arvatud { "4" } GB salvestus ({ "5.45" }× reaalaeg, tippmälu { "2" } MB üle algse RSS-i; ühe masina mõõtmised, mitte läved).

# text
# c1: docs/design/LAB-CAMPAIGN.md
seg-efbaf5a00ea2 = Ainult tarkvara: miski ei edasta ja ühtki häire- ega spuufimislainekuju ei sünteesita. Disaini ja valmisehituse märkmed: <c1/>.

# text
seg-c9871226c82f = Jälgimismootor labori kordusesituseks ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

# text
# c1: kshana.loop-design/1
# c2: docs/design/LOOP-DESIGN-TOML.md
# c3: iq::track::design
seg-cd353717667b = <em>Ahelakujundusfailid</em>: <c1/> TOML (<c2/>; parser <c3/>). Üks või mitu nimetatud kujundust seavad iga ahelavälja:

# text
seg-0437148324ca = kandelaine liik (PLL, FLL või FLL-abistatud PLL), järgud ja ribalaiused;

# text
seg-4e722960f8c6 = PLL/FLL/DLL diskriminaatorid ja kandelaine abistamine;

# text
seg-44976e3ad4e7 = vahe ja integreerimine;

# text
seg-5c06173036d6 = lukustusläved ja C/N0 aknad ning bitisünkroon;

# text
seg-405e693dd757 = lukustusoleku olekumasin;

# text
# c1: "auto"
seg-e6908584e2f4 = üleandmise hõivamine (<c1/> või selgesõnaline).

# text
# c1: extends
seg-8844cc963705 = Kujundused võivad üksteist <c1/>. Tundmatud võtmed lükatakse tagasi. Igal lahendatud kujundusel on SHA-256 räsi kanoonilisel JSON-kujul (võtmed sorteeritud igal tasemel, fikseeritud arvuvorming), nii et räsi ei sõltu väljade järjekorrast; iga väljund registreerib selle. Liidesed:

# text
# c1: kshana iq track --design <file> [--design-name]
seg-5c32182634f7 = <c1/>, kus selgesõnalised lipud tühistavad kujunduse ja registreeritakse;

# text
# c1: kshana iq sweep --design <file>
seg-9356751a6b98 = <c1/>, mis käitab iga failis oleva kujunduse;

# text
# c1: iq_track(design=, design_name=, reacquire=)
# c2: iq_loop_designs
seg-6815ec9b33c6 = Python <c1/>, <c2/>;

# text
# c1: iq_track
# c2: design
# c3: design_name
seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

# text
# c1: EpochOutput.cn0_m2m4_dbhz
# c2: cn0_m2m4_dbhz
# c3: cn0_beaulieu_dbhz
seg-70d3b295bea0 = <em>M2M4 C/N0</em> (<c1/>, track-epoch veerg <c2/> pärast <c3/>; Pythoni epohhisõnastikud). Teise ja neljanda momendi hinnang samade akende üle nagu NWPR, ainult prompt-võimsusest: NWPR loeb ahela enda kandelaine jitteri all liiga madalaks (umbes { "8" } dB × Bn_PLL·T) ja M2M4 mitte. GPS L2C CM puhul ({ "20" } ms, nominaalne { "40" } dB-Hz, PLL { "1" } kuni { "10" } Hz) loeb see { "39.93" } dB-Hz igal ribalaiusel, kui NWPR langeb väärtuselt { "39.55" } väärtusele { "38.22" }; L1 C/A puhul { "45" } dB-Hz juures loeb see { "45.34" }. NWPR ja iga muu väljund on muutumatud (bitthaaval kinnitus). Binaarkirje jääb { "184" } baiti (väärtus võtab reserveeritud ujuki ja lipubiti { "6" }).

# text
seg-c02d07475717 = Täiendavad korrelaatori kraanid (multikorrelaator / SQM).

# text
# c1: [design.integration] extra_taps_chips = [..]
# c2: EpochOutput.extra
# c3: (offset, value)
# c4: kshana.track-epoch/1
# c5: 184 + 16 × taps
# c6: extra_taps_chips
# c7: --extra-taps
# c8: extra_taps
# c9: extra_taps_chips
# c10: iq_track
seg-70fcdc903413 = <c1/> (nihked chipides promptist, positiivne vara; kuni { "16" }, igaüks piirides ±{ "2" }) korreleerib täiendavaid koopiaid E/P/L kõrval ja tagastab need kui <c2/> (<c3/> kujunduse järjekorras). Ahelad ei kasuta neid kunagi. Võti jäetakse tühjana kanoonilisest JSON-ist välja, nii et vaikekujunduse räsi ja iga kraanideta väljund on muutumatud (<c4/> jääb; kraanideta CSV/JSONL/binaar on bitthaaval identsed). Kraanidega: CSV/JSONL veerud ja binaarkirje <c5/> baiti, mille päis kannab <c6/>, nii et vana lugeja keeldub failist, mitte ei loe seda valesti. <c7/> (CLI), <c8/> (Python) ja <c9/> (MCP <c10/>). Ühe käituse kujundused peavad kraanide osas ühtima.

# text
# c1: iq track
# c2: iq sweep --threads <N|auto>
# c3: TrackSession::with_threads
# c4: std::thread::scope
# c5: wasm32
seg-66d494267598 = <em>Paralleelsed kanalid</em> (<c1/> / <c2/>; Rust <c3/>). Iga tüki kanalid käivad kuni N lõimel (<c4/>; <c5/> jääb jadaks). Kanali korrelatsioon ja lukustusoleku olekumasin puudutavad ainult seda kanalit; selle epohhid ja sündmused puhverdatakse ning kirjutatakse sinkidesse kanalite järjekorras, nii et väljund (CSV, JSONL, binaar, sündmused, kokkuvõte) on baitideni identne jadakäitusega mis tahes N korral. Vaikeväärtus jääb { "1" } lõimeks. Mõõdetud 12 kanaliga, { "4" } s, { "4.092" } MHz salvestusel { "4" } tuumal: { "19.5" } s jadana, { "11.5" } s { "2" } lõimega, { "6.3" } s { "4" } lõimega ({ "3.1" }×; esialgne hõivamine on jada).

# text
# c1: kshana.acq-surface/1
# c2: iq::acq_surface
# c3: docs/design/ACQ-SURFACE.md
# c4: iq acquire --surface <path>
# c5: iq_acq_surface
# c6: iq_acquire
# c7: surface_out
# c8: acquire
# c9: acquire
seg-cf59911d458f = <em>Hõivamispinna eksport</em> (<c1/>; <c2/>, <c3/>). <c4/> (üks PRN; CSV, JSON või binaar), Python <c5/> ja MCP <c6/> <c7/> kirjutavad kogu Doppleri × koodifaasi korrelatsioonivõimsuse pinna, mille otsing arvutab (selle lahtrid on käsu <c8/> omad, bitthaaval), koos tipu ja kahe peene Doppleri täpsustusega: paraboolne hinnang ja 1/16 vahemiku peen otsing (≈{ "5" } Hz { "4" } ms koherentsel, { "167" } Hz vahemike vastu). <c9/> ise ja iga vaikeväärtus on muutumatud.

# text
# c1: kshana.track-epoch/1
# c2: iq::track::sink
seg-a01bf371cc4f = <em>Voogedastatav epohhiväljund</em> (<c1/>; <c2/>). Iga ahela uuendus kannab:

# text
seg-ff549f07ce78 = varajase/prompt/hilise korrelaatorid;

# text
seg-00457c1bb059 = kõik kolm diskriminaatori väljundit;

# text
seg-b17d335f6cac = PLL/FLL/DLL NCO olekud ja kandelaine faasi;

# text
seg-a3bf3f1034cd = PLI ja lukustuslipud;

# text
seg-7912a72da79b = mõlemad C/N0 hinnangud ja bitid;

# text
seg-8d105d656041 = lukustusoleku.

# text
# c1: BinaryEpochReader
# c2: iq_read_epochs
seg-6af6331255fb = See kirjutatakse selle toimudes, CSV-na, JSON Linesina või versioonitud binaarvormis, koos lugejatega Rustis (<c1/>) ja Pythonis (<c2/>).

# text
# c1: iq track
# c2: --epochs
# c3: --events
# c4: --summary
# c5: kshana.track-summary/1
# c6: iq sweep
# c7: --epochs
# c8: --events
# c9: iq_track
# c10: epochs_out
# c11: events_out
seg-aa081bfd9878 = <c1/> saab valikud <c2/>, <c3/> ja <c4/> (<c5/>) ning <c6/> saab valikud <c7/> ja <c8/>. MCP <c9/> saab valikud <c10/>/<c11/> ja ehitab oma vastuse piiratud mäluga kokkuvõttest.

# text
# c1: tests/iq_track_memory.rs
seg-8cb2f8b27bad = Käituse hunnik ei kasva enam salvestuse pikkusega: <c1/> mõõdab seda loendava allokaatoriga ({ "6" }× pikkus, sama tipp { "64" } KiB piires), kontrolliga, mis näitab, et mälusisene tee kasvab.

# text
seg-e3eff59db445 = Voogedastatud väljund on bitthaaval identne mälusisese kordusesitusega.

# text
# c1: iq::track::lock
# c2: TrackSession
# c3: reacq_window_s
# c4: reacq_interval_s
# c5: reacq_max_interval_s
# c6: reacq_interval_s
# c7: max_reacq_attempts
seg-c602902313f8 = <em>Lukustusoleku olekumasin</em> (<c1/>, <c2/>): sisselaskmine → lukustatud → kaotatud → uuesti hõivamine → sisselaskmine või taandatud, kui kaotus kestab kauem kui <c3/> (vaikimisi { "30" } s). Ebaõnnestunud otsinguid korratakse iga <c4/> järel ({ "0.1" } s), ühtlase vahega, nii et kordusgraafik lisab mõõdetud uuesti hõivamise ajale kõige rohkem { "0.1" } s. Valikuline tagasilöök (<c5/> üle <c6/>) on vaikimisi väljas ja <c7/> on valikuline ülempiir ({ "0" }, ehk puudub, vaikimisi). { "2" } s katkestus kolmel PRN-il sagedusel { "4.092" } MS/s lõpeb nüüd sellega, et iga kanal on uuesti hõivatud ja lukustatud. 3 katse eelarve korral taandati iga kanal { "0.2" } s jooksul kaotusest.

# text
# c1: loss_dwell_s
# c2: pull_in_max_s
seg-56bc109dbef9 = Läved (<c1/>, <c2/>, uuesti hõivamise Doppleri aken) tulevad kujundusest. Iga üleminek on sündmus koos oma põhjusega.

# text
seg-b1c551e48389 = Valesisselukustumise kontroll otsib jälgitud Dopplerit selle ±1/(2T) FLL/PLL aliase vastu. See tabab valesisselukustumise, mida PR #38 mõõtis (−{ "2400" } Hz jälgitud { "500" } Hz kaugusel). Uuesti hõivamise sisselülitatuna lõpeb kanal lukustatuna süstitud Doppleril.

# text
seg-39409dd0b4bc = { "0.8" } s signaalilõhe kuulutatakse kaotatuks ja hõivatakse uuesti { "0.3" } s jooksul signaali naasmisest.

# text
# c1: final_state
# c2: RETIRED
seg-ce3162720ce5 = <c1/> (ja tabeli veerg) on olek pärast viimast üleminekut, nii et kanal, mis taandati pärast oma viimast ahelauuendust, loeb <c2/>.

# text
# c1: [design.carrier] fll_assist = "pull-in"
# c2: "always"
# c3: fll_off_pli
# c4: fll_gate_dwell_s
# c5: fll_on_pli
# c6: docs/design/evidence/carrier-lock/
# c7: fll_assist = "always"
seg-520ab6d84a6c = <b>FLL-i abistamine ainult sisselaskmise ajal</b> (<c1/>, vaikimisi; <c2/> säilitab varasema käitumise bitthaaval). FLL annab PLL-ile üle, kui silutud PLI on hoidnud tasemel <c3/> ({ "0.8" }) või sellest kõrgemal ajal <c4/> ({ "0.1" } s), ja naaseb, kui see langeb alla <c5/> ({ "0.6" }). Sisselülitatuna murdis { "10" } Hz FLL-i tee faasilukustuse puhastel signaalidel alla umbes { "38" } dB-Hz: sagedusel { "35" } dB-Hz oli faasilukustuse osakaal { "10" }–{ "16" } %, tõelise faasiveaga { "38" }–{ "41" }°. Väravaga hoiab vaikeväärtus { "100" } % sagedusel { "35" } dB-Hz veaga { "4.5" }°, sama mis ainult PLL. Sisselaskmine { "100" } Hz üleandmisveast on muutumatu. Tõend eelregistreeritud lävedega: <c6/>. <b>Vaikeahelad ei ole seega bitthaaval samad vaikekujunduse varasemate käitustega.</b> Nende taastootmiseks kasutage <c7/>. Teadaolev piir: sagedusel { "35" } dB-Hz tuleb üleandmine { "1.9" }–{ "2.6" } s pärast jälgimise algust ja sagedusel { "33" } dB-Hz hoiab { "10" } Hz FLL PLI üleandmislävest madalamal, nii et sisselaskmine ei lõpe kunagi.

# text
seg-1a911b958f8e = Uued ahelakujunduse võtmed ja API, loetletuna:

# text
# c1: [design.lock]
# c2: reacq_window_s
# c3: reacq_interval_s
# c4: reacq_max_interval_s
# c5: max_reacq_attempts
seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, kusjuures <c5/> on muudetud vaikeväärtuselt { "3" } valikuliseks ülempiiriks (vaikimisi { "0" });

# text
# c1: LoopConfig.fll_assist
# c2: FllAssist
# c3: FllGate
# c4: LoopCore::set_fll_enabled
# c5: EpochOutput.fll_active
# c6: ChannelSummary.final_state
seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

# text
# c1: 33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80
seg-eecacf54975b = Kujunduse räsi on kanoonilise JSON-kuju kohta ja sisseehitatud vaikekujunduse räsi on <c1/> (kinnitatud testiga).

# text
seg-2405be1bc0c6 = Väljundi ühilduvuse märkused:

# text
# c1: iq track
# c2: final_state
seg-77670b7dd608 = tabelil <c1/> on lõpus veerg <c2/>;

# text
# c1: iq sweep
# c2: design_hash
# c3: design_hash
# c4: warnings
seg-a52d9bbdd1a4 = käsu <c1/> CSV-l on lõpus veerg <c2/> ja selle JSON-il on <c3/> ning <c4/>;

# text
# c1: mean_cn0_dbhz
seg-3fa0f9243806 = pühkimise <c1/> on nüüd keskmine kõigi uuenduste üle, millel on NWPR hinnang (piiratud mäluga kokkuvõte), mitte enam käituse teise poole üle.

# text
# c1: [design.lock] reacquire = true
# c2: --reacquire
# c3: reacquire=True
seg-d542c1616f35 = Uuesti hõivamine on <b>sisseehitatud vaikimisi väljas</b>, kus olekumasin ainult jälgib ja ahelad töötavad bitthaaval nii, nagu ilma selleta. (Vaikeahelad ise siiski muutusid: vt ülal FLL-i abistamist.) Lülitage see sisse kujunduse kaupa (<c1/>), valikuga <c2/> või valikuga <c3/>.

# text
# c1: commensurate_sampling
# c2: iq::track::commensurate_samples_per_chip
# c3: iq track
# c4: iq sweep
# c5: --summary
# c6: iq_track
# c7: iq_track
# c8: docs/design/evidence/dll-jitter/
seg-61d6b3122888 = <b>Hoiatus <c1/></b>: kui fs on { "1e-6" } piires chipikiiruse poole kordsest (<c2/>), hoiatavad <c3/>/<c4/> (väljund, <c5/>, pühkimise JSON), MCP vastus <c6/> ja Pythoni tulemus <c7/>, et koodiahela jitter ja nihe ei ole representatiivsed. Algpõhjus on dokumenteeritud eelregistreeritud lävedega failis <c8/>. Täpselt { "2" } valimi korral chipi kohta 0.5-chipi vahega on DLL-i S-kõver üks aste ja ahel väriseb: ≈ { "0.09" } chipi RMS koodiviga (≈ { "26" } m) sagedusel { "45" } dB-Hz, võrreldes ≈ { "0.004" } chipiga mittekommensureeruval kiirusel. ~{ "2" } dB madal NWPR C/N0 sellel kiirusel on sama põhjusega. Täpselt { "0" } Hz koodi Doppleri ja { "4" } valimi korral chipi kohta ei ületa kood kunagi ±0.21-chipi surnud tsooni, nii et koodifaasi nihe kuni umbes { "0.2" } chipi võib püsida ilma jitteris ilmumata (mõõdetud: 0.5-chipi vahe annab { "2.0" }× kontrolli koodivea +{ "0.011" } chipi keskmisega; 0.25-chipi vahe annab +{ "0.125" } chipi); hoiatus katab kiiruse.

# text
# c1: docs/design/evidence/carrier-lock/
seg-8fbfb3f0bee2 = <b>Teadaolev piir: vaikekujundus ei anna FLL→PLL üle alla umbes { "35" } dB-Hz</b> (~{ "35" } dB-Hz sisselaskmise põhi; vt ülal FLL-i abistamist ja <c1/>).

# text
seg-43f02bc861be = Valesisselukustumise või uuesti hõivamise otsing, mida ei saa käitada (kiirus ilma täisarvu valimiteta koodiperioodi kohta), ei peata enam jälgimist.

# text
# c1: tests/iq_track_engine.rs
# c2: tests/iq_cli.rs
# c3: iq::track::design::tests
# c4: tests/python
seg-14f4e9edc443 = Testid: <c1/>, <c2/>, <c3/>, <c4/> ja MCP IQ edasi-tagasi tsükkel.

# text
seg-60141bb08f64 = C/N0 profiilid sünteetilistes stseenides ({ "0.34.0" }).

# text
# c1: iq::channel::cn0_profile
# c2: Cn0ProfileChannel
# c3: cn0_dbhz
seg-1b44566881e8 = <c1/> ajastab Kshana enda stseenides satelliidi kaupa ajas muutuva C/N0, dB nihetena stseeni C/N0 suhtes. Kujud: aste, tõus, tükiti lineaarne ja algväärtusega (seed) skintillatsioonitaolised Rice'i summutused märgitud S4 ja dekorrelatsiooniajaga. Need rakendatakse olemasoleva stseenikanali konksu kaudu (<c2/>, komponeerudes ionosfääri, troposfääri, skintillatsiooni ja mitmeteelevi mõjudega), stseenituuma muutmata. Tõe kõrvalfaili <c3/> järgib profiili.

# text
# c1: kshana iq scene … --cn0-profile <toml>
# c2: kshana.iq_scene(…, cn0_profile="<toml>")
seg-548eeca516ff = Liidesed: <c1/> ja <c2/>.

# text
seg-a242e4d9f071 = Milleks see on: ahelaid, monitore ja kampaania hindamist saab stressitestida teadaoleva tõe vastu. See muudab ainult seaduslike signaalide tugevust.

# text
# c1: tests/iq_cn0_profile.rs
seg-ff4df7c343dc = Kontrollid (<c1/>). Läved: summutuse keskmine intensiivsus { "5" } % piires väärtusest { "1" }, S4 { "8" } % piires sihtväärtusest (S4 = { "0.3" }, { "0.7" } ja { "1" } korral), intensiivsuse korrelatsioon üle { "0.9" } kohal { "0.05" } τ ja alla { "0.05" } kohal { "5" } τ; tõde täpselt märgitud C/N0 pluss profiil; jälgitud NWPR C/N0 langus { "0.7" } dB piires { "6" } dB astmest. Mõõdetud: S4 { "1.3" } % piires sihtväärtusest ja jälgitud langus { "6.26" } dB.

# text
# c1: iq::monitor
# c2: kshana iq monitor
# c3: kshana.iq_monitor(path, ...)
seg-e214458cd1b6 = <b>IQ-tee tuvastusmonitorid ({ "0.34.0" } „Labori kordusesitus“).</b> Uus moodul <c1/>, käsk <c2/> ja seos <c3/>. Need jälgivad salvestust ja teatavad ajaread ning märgitud sündmused (algus-, häire- ja lõpuajad, tipp, lävi). Need ainult tuvastavad ja mõõdavad; siin ei genereerita signaali.

# text
seg-5b05b2a54fab = <b>Koguvõimsus / AGC</b>: ploki võimsus ja võimendus, mille ideaalne AGC rakendaks; märgib tõusud ja langused.

# text
# c1: pulse_pfa
seg-2a84a640d7f1 = <b>Eelkorrelatsiooni spekter</b>: Welchi PSD ploki kohta õpitud lähtetaseme vastu. Ülemäära lävi tuleb valehäire sihtmärgist. Samuti kompleksne kurtoos ja impulsidetektor. Impulsidetektor loeb igas plokis läve ületavad valimid ja tõstab sündmuse, kui selle arvu täpne binoomjaotuse ülemine saba on väiksem kui <c1/> (vaikimisi { "1e-4" } ploki kohta), mitte siis, kui z-skoor ületab piiri: lühikeste plokkide väikeste oodatavate arvude juures on üksik valim juba mitu sigmat.

# text
seg-7704ac807c38 = <b>Kanali kohta C/N0</b>: kaks ühepoolset CUSUM-i muutusedetektorit (langus ja tõus), mida toidavad sõltumatud hinnangud (samm on seatud ahela C/N0 aknast).

# text
# c1: (I_E − I_L)/I_P
# c2: (I_E + I_L)/(2 I_P)
seg-f965a68d388b = <b>SQM korrelaatoritest</b>: delta <c1/> ja suhe <c2/>, pluss asümmeetriatestid lisakorrelaatoritest, kui kanal neid annab.

# text
seg-a4006c2e8692 = <b>Lukustusnäidiku jadad</b>: PLI ja sagedusluku näidik järjestikustest promptidest, toorsignaalidena. Lukustuse ja lukustuse kaotuse otsused jäävad jälgimismootori lukustusoleku olekumasinale.

# text
# c1: iq::monitor::run::run_monitors
# c2: MonitorConfig
# c3: tests/iq_monitor.rs
seg-da72318f44cc = Üks voogedastav läbimine (<c1/>) käitab kõik, TOML/JSON seadistusfailiga (<c2/>); kampaaniakäitaja kasutab sama sisenemispunkti. Kõik MODELLED. Iga statistikut kontrollitakse selle suletud kuju vastu algväärtustega (seed) simulatsiooniga (<c3/>):

# text
seg-0ff96e4c5a20 = ploki võimsuse ületused Gamma saba vastu;

# text
# c1: 2/√N
seg-97b559ea0897 = kurtoosi keskmine { "2" } ja hajuvus <c1/>;

# text
# c1: e^{−t}
seg-2b941c702b7f = impulsi osakaal <c1/>;

# text
seg-e8f068c41f0c = CUSUM-i jooksupikkused Siegmundi lähenduse vastu (mõõdetud { "330" } ja { "8.46" } valimit vastu { "338" } ja { "8.34" });

# text
seg-e2cd6a55e49b = faasilukustuse näidik Riceri faasi keskmise vastu;

# text
seg-06291b1c6274 = jälgitud C/A signaalil on SQM delta ja suhte hajuvused umbes { "6" } % esimest järku suletud kujudest (mõõdetud { "5.97" } %; testi lävi { "12" } %).

# text
seg-12deb36a2e3a = Spektraalse ülemäära valehäire valem on lähendus; mõõdetud määr oli { "1.3" }× valem. Otsast lõpuni märgivad monitorid:

# text
seg-b002c66c7881 = { "6" } dB C/N0 astet (muutuse aeg ühe hinnangu piires);

# text
seg-2e828d106393 = salvestuse keskel ilmuvat peegeldunud teed (suhtetest);

# text
seg-68063f036e2c = signaalikatkestust (PLI langeb selle ajal väärtuselt { "0.999" } väärtusele −{ "0.3" } ja FLI väärtuselt { "0.93" } väärtusele { "0.03" });

# text
seg-0cd95f0197ec = kitsaribalist tooni ja hõredaid suure amplituudiga valimeid (spektraal-, impulsi- ja kurtoositestid). Need on üldised DSP testsisendid, mitte häiremudelid.

# text
# c1: iq track
# c2: iq sweep
seg-7128b9000cc2 = <c1/>/<c2/> voogedastavad läbi uue sessiooni (vt Lisatud).

# text
# c1: --csv
# c2: --json
# c3: --epochs
seg-98891d33e48c = <c1/> säilitab oma versiooni { "0.32" } veerud, kuid on nüüd voogedastatav, nii et mitme kanali read põimuvad ajajärjekorras, mitte ei ole kanalite kaupa grupeeritud. <c2/> säilitab oma versiooni { "0.32" } kuju ja hoiab endiselt iga epohhi mälus: pikkade salvestuste jaoks kasutage <c3/>.

# text
# c1: iq sweep
# c2: design_hash
seg-2ef2d5771ade = <c1/> mõõdab jitterit käituse kestuse teise poole uuenduste üle (varem uuenduste arvu teine pool) ja selle CSV/JSON saavad veeru <c2/>.

# text
# c1: final_state
seg-f23b6db96748 = Jälgimistabel saab veeru <c1/>.

# text
# c1: iq track
# c2: iq acquire
seg-a5769fbc201e = Kasutustekst ei väida enam, et <c1/> võtab esiotsa lipud; neid rakendab ainult <c2/>.

# text
# c1: iq_track
# c2: acq_noncoherent
# c3: doppler_max
# c4: None
# c5: carrier_phase_cycles
# c6: bit_edge
# c7: bit
# c8: state
# c9: design
# c10: events
seg-cf28fa21786a = Pythoni <c1/> väljad <c2/> ja <c3/> on nüüd vaikimisi <c4/> (kujunduse väärtused, sisseehitatud kujunduses { "1" } ja { "5000" } Hz). Selle epohhid saavad varajase/hilise korrelaatorid, <c5/>, <c6/>, <c7/> ja <c8/>, ning tulemus saab <c9/> ja <c10/>.

# text
# c1: 2 / (3 · N · T_code)
# c2: 1 / (3 · N · T_code)
# c3: 1 / (4 T_track)
# c4: N = 1
# c5: 0.2 / T_track
# c6: kshana::iq::acq::default_step_hz
# c7: N = 4
# c8: "auto"
# c9: doppler_step_hz
# c10: --doppler-step
# c11: iq acquire
# c12: --summary
# c13: resolved
seg-666b9e3faa5d = <b>Vaikehõivamise samm ei anna enam Galileo E1 jälgimisele jääki, mida FLL ei suuda sisse lasta.</b> Samm <c1/> jätab üleandmisel kuni <c2/> Doppleri viga, kuid vaike-kahekvadrandiline FLL laseb sisse ainult <c3/>. Iga { "4" } ms või pikema koodi puhul (<c4/>), kaasa arvatud Galileo E1-B ja E1-C, oli jääk ({ "83.3" } Hz sagedusel { "4" } ms) väljaspool { "62.5" } Hz sisselaskmist ja jälgimine lukustus valesti +{ "125" } Hz juures, faasilukustuse näidikuga { "0.97" }, mis seda varjas. Vaikesamm on nüüd piiratud ka väärtusega <c5/> (<c6/>), { "0.8" } sisselaskmisest, nii et üleandmine jääb selle sisse ka siis, kui naaberlahter võidab. ({ "0.4" } proovitud esmalt: see lukustus valesti { "1" } käitust { "42" }-st E1-B-l ja { "1" } ms koherentne GPS L1 C/A otsing valis lahtri { "350" } Hz kaugusel ja lukustus +{ "500" } Hz juures; { "0.25" } ja { "0.2" } ei andnud samades käitustes ühtegi.) Hind: Galileo E1-B/E1-C lähevad { "166.7" } Hz lahtritelt { "50" } Hz lahtritele, { "201" } lahtrit vahemikus ±{ "5" } kHz { "61" } asemel; { "1" } ms koodid ({ "166.7" } Hz, <c7/>) on muutumatud. <c8/> ahelakujunduses tähendab seda; selgesõnaline <c9/> või <c10/> kasutatakse nii, nagu kirjutatud, ja <c11/> (ilma jälgimise üleandmiseta) säilitab õpikusammu. Epohhipäis ja <c12/> registreerivad nüüd iga kanali lahendatud sammu ja ahela ribalaiused (<c13/>). Vaikekujunduse räsi on muutumatu. Väljundi muutus: { "4" } ms ja pikemate koodide tuvastused võivad sattuda teistesse Doppleri lahtritesse.

# text
# c1: Bn · T
# c2: carrier.bn_t_max
# c3: bn_t_max / T
# c4: Design::loop_config_for
# c5: bn_t_max = 0
seg-9150dc89e186 = <b>GPS L2C CM ({ "20" } ms ahelauuendus) hoiab lukku vaikekujundusega.</b> Vaike-{ "15" } Hz PLL-il ja { "10" } Hz FLL-il on <c1/> väärtused { "0.3" } ja { "0.2" } kohal T = { "20" } ms ning ahel kaotas lukustuse isegi täiuslikult algusest (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Uus kujunduse võti <c2/> (vaikimisi { "0.1" }) piirab PLL-i ja FLL-i müra ribalaiused väärtusele <c3/>, kui ahela uuendusaeg on pikem kui { "4" } ms (<c4/>): { "5" } Hz ja { "5" } Hz sagedusel { "20" } ms, { "10" } Hz ja { "10" } Hz BeiDou B1C { "10" } ms juures; { "1" } ms ja { "4" } ms koodid säilitavad { "15" } ja { "10" } Hz. See kehtib ka selgesõnaliste ribalaiuste kohta; <c5/> lülitab selle välja. Võti jäetakse vaikeväärtuse korral kanoonilisest kujust välja, nii et vaikeräsi on muutumatu; kujundusel, mis seab mis tahes muu väärtuse, on teistsugune räsi. Sagedusel { "45" } dB-Hz annab L2C CM nüüd PLI { "0.996" }, Doppleri vea { "0.00" } Hz ja M2M4 { "42.71" } dB-Hz. Teadaolev lahtine punkt: NWPR C/N0 loeb seal { "1.76" } dB madalaks (ja { "2.45" } dB madalaks B1C-l { "10" } ms juures), nii et maatriksi T5 L2C jaoks jääb ignored-tähelepanekuks.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: scenarios/clock-ensemble.toml
# c3: flicker_floor = 1e-16
# c4: flicker_floor = 2e-11
seg-74517bee3f6f = <b><c1/> loodud uuesti: kinnitatud joonis oli oma stsenaariumi suhtes aegunud (andmemuutus, mitte ümbervärvimine).</b> Diagramm joonistati 2026-06-02 failist <c2/>; kaks päeva hiljem seadis 67fed19e selles stsenaariumis flicker-FM põhjad (kvant <c3/>, CSAC <c4/>) ja joonist ei joonistatud kunagi uuesti. See näitas põhjaeelset käitust: y-telg { "0" } kuni { "47" } ns, CSAC käitusekohane katkestuse p95 { "10.5" } kuni { "47.6" } ns (keskmine { "25.2" } ns), klassikaline holdover { "4050" } s keskmiselt. Tarnitud stsenaarium (ja nagu õpetus ja CLI kokkuvõte juba ütlevad) annab y-telje { "0" } kuni { "407" } ns, CSAC käitusekohane p95 { "40.8" } kuni { "374.0" } ns (keskmine { "167.0" } ns), klassikaline holdover { "844" } s [{ "220" } kuni { "2130" } s]; { "20" } ns spetsifikatsioonijoon asub samal { "20" } ns kohal umbes üheksa korda kõrgemal teljel. Mootor on muutumatu: tänane mootor juunikuu stsenaariumifailil taastoodab vana joonise telje täpselt. Joonisele README-st ega dokumentidest ei viidata.

# text
seg-75636f9419b2 = Teadaolevad piirangud

# text
# c1: bn_t_max = 0.1
seg-2c607b56048e = <b>NWPR C/N0 loeb kõrge prompti kohta C/N0·T korral madalaks ja BOC({ "1,1" }) sagedusel { "5" } MS/s kaotab umbes { "1" } dB.</b> NWPR on ideaalsetel promptidel nihketa, kuid ahela enda PLL-i jitter maksab umbes sobitatud { "8" } dB × Bn·T (üks stseen, neli punkti: −0.24/−0.44/−0.77/−{ "1.58" } dB sagedustel 1/2.5/5/10 Hz ja { "20" } ms; umbes −{ "1" } dB vaikeväärtusel <c1/>); M2M4 on tundetu. BeiDou B1C andmed sagedusel { "5" } MS/s kaotavad ka umbes { "1" } dB prompti võimsust ribapiirangu tõttu (kasutage { "10" } MS/s või rohkem). Kumbki ei ole hinnangu defekt; signaalimaatriksi T5 read GPS L2C ja BeiDou B1C jaoks jäävad nende põhjustega ignored-tähelepanekuteks.

# text
seg-ff195e575023 = <b>Diagrammi teksti ja Studio diagrammi vastuvõtmise karmistamine.</b> Tekst, mille stsenaarium kannab loodud diagrammi, eskapeeritakse nüüd järjepidevalt ühe jagatud rutiiniga ning Studio võtab diagrammist vastu ainult joonistusmärgistuse. Studio aadresseerimisparameetrid, liigipõhised otsingud ja stsenaariumipäringud on piiratud teadaolevate väärtustega. Kaasapakitud diagrammid, salvestatud tulemused ja avaldatud arvud on muutumatud. Uuendamist soovitatakse kõigile, kes avavad Studios stsenaariumifaile ebausaldusväärsetest allikatest või manustavad loodud diagramme veebilehtedele. Turvateade: <a1>GHSA-h25h-cg9f-v2cg</a1>.

# text
# c1: iq::scene
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
# c5: sdr
# c6: iq::acq
# c7: iq::track
# c8: docs/POSITIONING.md
# c9: docs/SPECTRUM.md
seg-7f566858d036 = <b>IQ-kihi segamise ja spuufimise ulatus, öeldud täpselt.</b> Allolevad versioonide { "0.31.0" } ja { "0.32.0" } kirjed ütlevad, et IQ-kiht lisab „ei mingit segamise ega spuufimise lainekuju sünteesi“. See kehtib IQ-kihi enda kohta (<c1/> genereerib ainult seaduslikke GNSS-i signaale), kuid see kõlas väitena kogu mootori kohta, ja see ei ole selline: alates versioonist { "0.29.0" } kirjutab liigi <c2/> jaotis <c3/> SigMF hetktõmmise oma analüütilisest mudelist koos seadistatud segajatega (müratüüpi segajad lahtri kaupa, toonid ja siristused lainekujudena), ja <c4/> summeerib autentse ja spuufija koopiasignaali mälus, et testida ahela püüdmist (komposiiti ei kirjutata kunagi välja). Mootoril on olnud ka tarkvaraline GNSS-vastuvõtja alates versioonist { "0.20.0" } (<c5/>: hõivamine ja jälgimine; alates versioonist { "0.31.0" } ka <c6/> ja <c7/>). Miski Kshanas ei edasta ega juhi raadioriistvara. README olekurida, <c8/>, <c9/> ja IQ disainimärkmed ütlevad seda nüüd; avaldatud kirjed on jäetud sellisena, nagu need avaldati. Käitumine ei muutu.

# text
# c1: docs/design/iq-notes/receiver.md
seg-61befd8b474d = <b>Teadaolev piirang: kommensureeruv diskreetimine.</b> Valimikiiruse korral, mis on chipikiiruse täis- või poolkordne, asuvad valimid igas chipis samadel chipifaasidel ja koodidiskriminaator muutub trepiks. Sünteetilisel GPS L1 C/A signaalil sagedusel { "45" } dB-Hz 0.5-chipi vahega annab { "2.046" } MHz ({ "2" } valimit/chip) ≈ { "0.09" } chipi (≈ { "26" } m) RMS koodivea ja −{ "0.09" } chipi nihke, võrreldes ≈ { "0.003" } chipiga mittekommensureeruval kiirusel. NWPR C/N0 loeb seal ≈ { "2.4" } dB madalaks. Sagedusel { "4.092" } MHz sõltub see vahest ja koodi Dopplerist. Vahe { "0.5" } chipi korral on see kahjutu { "1500" } Hz Doppleril, kuid { "2" }× { "0.011" } chipi nihkega { "0" } Hz juures ning vahe { "0.25" } või { "0.1" } chipi korral on see { "8" }–{ "10" }× koodiviga. Kandelaine jälgimist see ei mõjuta. Mõõtmised on failis <c1/>.

# text
seg-3a30bd47380a = GNSS-i IQ-kiht MCP serveris (Phase B.1).

# text
# c1: kshana-mcp
# c2: kshana iq
# c3: iq_signals
# c4: iq_info
# c5: iq_scene
# c6: iq_acquire
# c7: iq_track
# c8: iq_frontend
# c9: KSHANA_MCP_IQ_DIR
# c10: overwrite
# c11: KSHANA_MCP_IQ_MAX_SAMPLES
# c12: kshana::iq::cli::execute
# c13: iq::cli::build_code
# c14: iq::cli::signal_names
# c15: server.json
# c16: mcp/kshana-mcp/tests/iq_round_trip.rs
seg-ef81eca03bca = <c1/> saab kuus tööriista, mis juhivad kihti <c2/> agendi poolt: <c3/> (aktsepteeritud signaalinimed ja IQ seadistus), <c4/> (kirjelda salvestust), <c5/> (genereeri märgitud profiiliga või edastatud efemeriidiga stseen, valikulise signaalitaseme kanaliga), <c6/> (FFT hõivamine, valikuliselt esiotsa etappide taga), <c7/> (hõiva, siis DLL/PLL/FLL pank) ja <c8/> (ribafilter, sälk, blankeerimine, väljalõikamine, AGC, kvantiseerija). IQ valimid ei ületa kunagi protokolli: iga tööriist võtab failiteed ühes töökataloogis, mille seab <c9/> (seadmata jätmine jätab IQ failitööriistad välja ja kõik muud tööriistad mõjutamata), keeldub teedest, mis lahenevad väljapoole seda, ja juba olemasolevatest väljunditest, kui pole seatud <c10/>, jõustab enne mis tahes tööd kutsekohase valimieelarve (<c11/>, vaikimisi { "50 000 000" }), keeldub tundmatutest argumentidest ja vastab kompaktse JSON-kokkuvõttega (tuvastused, C/N0, lukustuse olek ja iga kirjutatud fail oma baitide arvuga). Epohhipõhine väljund läheb ainult failidesse, mida kutsuja nimetab. Tööriistad käitavad sama kooditeed mis CLI uue avaliku õmbluse <c12/> kaudu, mis tagastab CLI teate selle trükkimise asemel (stdout on MCP JSON-RPC kanal); <c13/> ja <c14/> on nüüd samuti avalikud. Ainult tarkvaraline ja lisandav: IQ-kiht ei lisa segamise ega spuufija sünteesi, miski ei edastata kunagi ja uusi sõltuvusi pole. <c15/> deklareerib need kaks keskkonnamuutujat. Edasi-tagasi testid failis <c16/> genereerivad lühikese kahe satelliidi stseeni ja kontrollivad hõivamist stseeni enda tõe kõrvalfaili vastu, jälgimise lukustust ja C/N0, esiotsa, SigMF väljundit, eelarvet, tee piiramist ja keelatud olekut.

# text
# c1: tests/iq_gpssdrsim_cross_generator.rs
# c2: tests/fixtures/iq_gpssdrsim_cross_generator/
# c3: scripts/gen_iq_gpssdrsim_ref.sh
seg-6963f3fa1db7 = <b>GNSS-i IQ-kiht valideerimisregistris.</b> Eelregistreeritud ristkontroll gps-sdr-simi vastu (sõltumatu GPS L1 C/A baasribageneraator, MIT, commit 28ca29a6) on nüüd alati sees oleva testikomplekti osa (<c1/>). Selle kinnitatud võrdlusväljund (<c2/>: { "20" } ms gps-sdr-simi enda 8-bitist I/Q-d, selle kanalite loend ja selle taga olev kanali olek samast ehitusest linkitud harnessist) luuakse uuesti skriptiga <c3/>. Testi ajal ei vaja miski võrku ega välist tööriista. Lisatud on kaks registririda ({ "251" } rida: { "124" } valideeritud, { "123" } modelleeritud, { "4" } partneri):

# text
seg-21d005e2ef0e = <em>GNSS-i IQ stseeni signaali geomeetria sõltumatu baasribageneraatori vastu</em>: <b>valideeritud</b>. Stseeni tõde (nähtav hulk, pseudovahemaa, koodifaas, Doppler, vaatenurgad) edastatud efemeriidiga stseeni jaoks ühtib gps-sdr-simi kanali olekuga kõigil { "11" } kanalil: halvim { "1.6" } mm, { "5.5e-6" } chipi, { "7.4e-5" } Hz, { "4e-9" } kraadi, lävede { "0.05" } m, { "2e-4" } chipi, { "0.02" } Hz ja { "1e-4" } kraadi vastu, mis fikseeriti enne käitust.

# text
# c1: iq::acq
seg-5c8858182d41 = <em>GNSS-i IQ hõivamine sõltumatult genereeritud I/Q valimitel</em>: <b>modelleeritud, koos tähelepanekuga</b>. <c1/> leiab iga simuleeritud satelliidi gps-sdr-simi valimitest registreeritud piirides (koodifaas { "0.195" } chipi piires, Doppler { "72" } Hz piires). Registreeritud lävi „ühtegi teist PRN-i ei tuvastatud“ siiski ebaõnnestub: gps-sdr-simi müravabal väljundil ületavad Gaussi müra läve teiste satelliitide ristkorrelatsioon kõigi { "21" } puuduva PRN-i jaoks. Range test säilitatakse, märgitud ignored koos tähelepanekuga, ja kinnitatud test registreerib selle. Mootori koodi ega avalikku API-t ei muudeta. Valimi I/Q-d ei võrrelda valimi kaupa: gps-sdr-simi täisarvuline siinustabel, võimendused, nullist algav kandelaine faas ja kärbitud LNAV väljad ei ole suurused, milles vastuvõtja peab nõustuma. Võrdlus tehakse vaadeldavatel suurustel, mida vastuvõtja mõõdab.

# text
# c1: iq track
# c2: ceil(4 ms / T_code)
# c3: T_code
# c4: 2 / (3 · N · T_code)
# c5: docs/design/evidence/iq-track-acq-default/
# c6: kshana iq track
# c7: kshana iq sweep
# c8: --acq-coherent
# c9: kshana.iq_track
# c10: acq_coherent=None
# c11: iq_track
# c12: acq_coherent=1
# c13: --acq-coherent 1
# c14: kshana iq acquire
# c15: --coherent
# c16: iq::acq::auto_coherent_periods
# c17: iq::acq::AUTO_COHERENT_S
# c18: tests/iq_cli.rs::track_default_handoff_does_not_false_lock_where_one_period_did
seg-a2be63287ce4 = <b><c1/> annab vaikimisi üle ≈{ "4" } ms hõivamisest (käitumise muutus).</b> Hõivamine, mis lähtestab iga jälgimiskanali, integreerib nüüd <c2/> koodiperioodi koherentselt ühe asemel, kus <c3/> on koodi täisperiood (kihilise koodi puhul primaar- korda sekundaarpikkus, ühik, mille üle hõivamine integreerib). Kihita { "1" } ms koodid (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) otsivad nüüd { "4" } perioodi ({ "4" } ms), nii et vaike-Doppleri samm <c4/> on ~{ "167" } Hz ~{ "667" } Hz asemel. Iga kood, mille täisperiood on juba { "4" } ms või pikem, säilitab { "1" } perioodi: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms) ning kihilised GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q ja E1-C ({ "10" } kuni { "100" } ms koos nende kattekoodidega) ja GPS L2C. Iga signaal integreerib seega vähemalt ~{ "4" } ms. Ühe perioodi otsing võis anda kanali üle kuni ~{ "333" } Hz kõrvalekaldega, FLL-i sisselaskmisest väljaspool, ja see jälgis siis valesisselukustumist ~{ "500" } Hz eemal, teatades samal ajal puhtast jälgimisest. Algväärtustega (seed) pühkimisel { "180" } GPS L1 C/A kanalil (Doppler ±{ "5" } kHz üle, { "38" } kuni { "47" } dB-Hz, pooltel navigatsiooniandmed; <c5/>, uuesti käitatav) langevad valesisselukustumised { "27" }-lt { "180" }-st { "1" }-ni { "180" }-st ja vahelejäänud hõivamised { "102" }-lt { "11" }-ni, ~{ "40" } ms võrra pikema otsinguga PRN-i kohta GPS L1-l ({ "11" } → { "52" } ms). Üks allesjäänud valesisselukustumine on sagedusel { "38" } dB-Hz, { "36" } Hz eemal. Kõik liidesed on ühel meelel: <c6/> ja <c7/> (<c8/>), Python <c9/> (<c10/> on nüüd auto; stub uuendatud) ja MCP tööriist <c11/>. Kasutajad, kes toetusid vanale vaikeväärtusele, saavad anda <c12/> (<c13/>). Käsu <c14/> enda vaikeväärtus <c15/> jääb { "1" }. Uued avalikud <c16/> ja <c17/>; regressioonitest <c18/>.

# text
# c1: *.chart.svg
# c2: *.report.html
# c3: --animate
# c4: #0c0b08
# c5: #e0bd84
# c6: src/palette.rs
# c7: web/theme.css
# c8: #060A14
seg-52768eb8e3d5 = <b>Iga loodud graafika järgib nüüd saidi Observatory teemat: iga diagrammi baidid muutuvad.</b> See on avaldatud jooniste, värvide ja fontide tahtlik uuendus; ükski joonistatud väärtus, koordinaat ega silt ei nihkunud. Iga stsenaariumi <c1/> (ja seega Studio diagrammieksport ja README demodiagrammid), käituse aruande HTML (<c2/>), ajaskaala animatsioon (<c3/>), stsenaariumitulemuse ja uuringu HTML-lehed, valideerimiskokkuvõte ning dokumentide joonised ja diagrammid kasutasid sooja tumedat juulipaletti (<c4/> põhi, <c5/> kuld) ja sooja paberi aruandeteemat. Nüüd võtavad need iga värvi ja fondi ühest moodulist <c6/>, mis peegeldab faili <c7/>: diagrammid joonistatakse instrumenditumedana Observatory põhjal (<c8/>) Geisti kirjatüübipinus; aruanne, animatsiooniesitaja ja tulemuslehed järgivad vaataja hele/tume eelistust Observatory heleda ja tumeda tokenitega. Kuus rikkevaldkonda säilitavad igaüks ühe värvi (häire korall, spuufimine magenta, ajastus sinine, orbiidid tsüaan, terviklikkus laim, navigatsioon merevaik), ja tõendustasemed loevad valideeritud laim, modelleeritud merevaik, partner magenta. Joonvesi (waterfall) rambid säilitavad oma tajupõhise (inferno) järjestuse, uuesti ankurdatuna uuel põhjal.

# text
# c1: tests/palette_sync.rs
# c2: web/theme.css
# c3: docs/assets/palette.json
# c4: docs/diagrams/mermaid-config.json
# c5: src/
seg-d967e354a966 = <c1/> hoiab mooduli mõlemas teemas failiga <c2/> kooskõlas, kontrollib, et <c3/> ja <c4/> (mõlemad moodulist genereeritud, Pythoni jooniste tööriistade ja mermaid-cli jaoks) on ajakohased, ning ebaõnnestub, kui kataloogis <c5/> ilmub väljaspool paletti kuueteistkümnendsüsteemis värvikirjeldus.

# text
# c1: tests/published_figures_still_reproduce.rs
seg-fa3e60422ca5 = <c1/> saab kolmanda diagnoosi „ainult värvid ja fondid nihkusid“, nii et paleti uuendust saab eristada nihkunud joonistatud väärtusest. Iga uuesti renderdatud README diagramm kontrolliti selle normaliseerija all oma eelkäijaga võrdseks.

# text
# c1: tools/gen_validation_figures.py
# c2: domain-coverage-map
# c3: scenario-fom
# c4: sgp4-regime-bars
# c5: web/capabilities.json
# c6: clock-holdover
# c7: tests/fixtures/sgp4_comparison.md
# c8: tools/gen_readme_assets.py
# c9: sgp4-regime-bars
# c10: kshana↔ref
# c11: tests/figures_doc_sync.rs
seg-3bc4056fd57e = <c1/> loeb paletti ja genereerib nüüd ka kolm README tulemusjoonist, millel polnud kinnitatud generaatorit (<c2/>, <c3/>, <c4/>), päris tekstielementidega, failidest <c5/>, tulemusest <c6/> ja <c7/>. <c8/> loeb sama paletti, mis parandab selle heleda teema triivi saidist. Väärtused <c9/> on selle fikstuuri halvima juhu veerg <c10/> ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } ja { "4.12e-6" } km), muutumatud Matplotlibi joonisest, ja <c11/> ebaõnnestub nüüd, kui kinnitatud joonis ja fikstuur on vastuolus.

# text
# c1: docs/assets/figures/domain-coverage-map
# c2: web/capabilities.json
seg-3196836a2a0d = <b><c1/> värskendatud praeguste andmetega (andmemuutus, mitte ümbervärvimine).</b> Joonis väitis { "28" } võimekust { "8" } valdkonnas ({ "11" } valideeritud, { "17" } modelleeritud), aegunult oma väidetud allika suhtes; nüüd uue generaatoriga failist <c2/> joonistatuna loeb see { "46" } võimekust { "8" } valdkonnas ({ "17" } valideeritud, { "29" } modelleeritud).

# text
# c1: κ = T_c
# c2: Q = 1/(R_c κ)
# c3: jamming
# c4: lunar-jamming
# c5: spectrum
# c6: q_override
seg-55d5b16379aa = <b>CW/kitsaribasegaja Q on nüüd { "1.0" }, mitte { "1.5" }.</b> Õpikuväärtus kandjal oleva tooni jaoks on { "1" } (toon säilitab signaali spektraalse tipu, <c1/>, <c2/>); vana { "1.5" } tegi tooni võrdsel J/S-il vähem kahjulikuks kui lairibamüra. Väljundi muutus: umbes −{ "1.8" } dB efektiivne C/N0 CW/kitsaribasegajate all kõrgel J/S-il liikides <c3/>, <c4/> ja interop (kaasapakitud näite <c5/> toon: { "17.98" } dB-Hz tabelist, oli { "19.74" }). Lairiba Q jääb { "1.0" } (konservatiivne, umbes { "3" } dB õpiku ~{ "2" } alla) ootel versiooni { "0.34" } ülevaatust. Vana { "1.5" } säilitamiseks seadke <c6/>.

# text
# c1: kshana iq scene
# c2: ci8
# c3: ci16
seg-99fab1936170 = <b><c1/> täisarvuväljund kasutab täisarvuvahemikku.</b> Ühikvõimsusega müra ja kirjutaja skaalaga { "1" } tulid <c2/>/<c3/> stseenid välja umbes kujul { "{" }-1, { "0" }, { "1" }{ "}" } ja 2-bitistel stseenidel olid läved kohal { "2.8" } sigmat. Täisarvuvormingud skaleeritakse nüüd nii, et oodatav komponendi RMS on veerand täisskaalast ({ "31.75" } LSB ci8-s, { "8191.75" } ci16-s) või { "2" } LSB 2-bitises. Skaala ja piiratud elementide arv trükitakse ja kirjutatakse kõrvalfaili. Ujukomaväljund on muutumatu.

# text
# c1: sin az
# c2: asin
seg-696109ae70f8 = <b>Kaheksa fikstuurikinnitust seitsmes testifailis enam macOS-is viimase biti erinevuste tõttu ei ebaõnnestu</b> (osa probleemist #36). Kinnitused, mis kontrollivad, et mootor ehitab endiselt sõltumatu etaloni kinnitatud sisendid (Jacobi maatriksid, olekutabel, stardiasimuudid), võrreldi bitthaaval ja need ebaõnnestusid macOS arm64 peal { "2" } kuni mõne tuhande ühiku võrra viimases kohas. Nüüd võrreldakse neid { "1e-12" } piires fikstuurist võetud skaalast; täisarvud, võtmed ja pikkused võrreldakse endiselt täpselt ning mutatsioonitest näitab, et suhteline muutus { "1e-6" } ebaõnnestub endiselt. Stardiasimuudi kinnitus võrdleb <c1/> ja tõusva/laskuva haru, mitte asimuuti ennast, kuna <c2/> võimendab oma argumendi ühe ulp-i umbes { "3e-9" } rad-ini, kus kalle võrdub koha kolatituudiga. Ükski sõltumatu etaloni tolerants ega eelregistreeritud lävi ei muutunud. Kaks testi (Kuu ühine OD, Kuu jälgitavus) ei ole kaetud: macOS-is nihkuvad nende eelregistreeritud võrdlused ise ja see jäetakse järeltööks.

# text
# c1: kshana iq track
# c2: kshana iq sweep
# c3: --bandpass
# c4: --notch
# c5: --blank
# c6: --excise
# c7: --agc
# c8: --bits
# c9: track
# c10: track
# c11: sweep
# c12: --notch
# c13: iq acquire
# c14: iq frontend
seg-b6c354fa0c28 = <b><c1/> ja <c2/> rakendavad esiotsa lipud.</b> Kasutustekst reklaamis <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> käsul <c9/>, kuid <c10/> ja <c11/> ei ehitanud ahelat kunagi: lipud jäeti vaikselt tähelepanuta ja väärtuseta lipp nagu <c12/> neelas selle järel oleva lipu. Mõlemad käsud parsivad need nüüd nagu <c13/> ja panevad värske esiotsa ahela hõivamisläbimise ja jälgimisläbimise ette. Väljund on võrdne käsu käitamisega failil, mille <c14/> kirjutab samade lippude jaoks.

# text
seg-d7238dab610e = IQ stseeni andmed paigutatakse signaali kaupa.

# text
# c1: kshana iq scene --data
# c2: NavData::Seeded
# c3: SpreadingCode::data_modulation()
# c4: DataModulation
# c5: iq::signals
# c6: NavData::Lnav
# c7: Scene
# c8: NavData::Lnav
# c9: NavData::Seeded
seg-46ace9a3e008 = <c1/> (ja <c2/>) pani { "50" } bit/s bitid igale signaalile, kaasa arvatud pilootidele, ning Galileol ja BeiDoul GPS LNAV kiirusel. Andmed järgivad nüüd iga signaali enda sümboliajastust, mida annab uus <c3/> (<c4/>, seatud iga konstruktori poolt moodulis <c5/>). See on { "10" } ms L5-I5-l, { "4" } ms E1-B-l, { "2" } ms BeiDou B1I GEO-l (D2) ning { "20" } ms bitid { "10" } ms meandriga GLONASS L1OF-il. Andmed lükatakse tagasi pilootidel, GPS L2C-l ühe CM/CL vooguna ja <c6/> kõigel peale L1 C/A. Kohandatud koodid säilitavad vaikimisi eelmise { "20" } ms ajastuse. Programmeeritud <c7/>, mis küsis <c8/> mitte-L1 C/A koodil või <c9/> piloodil, genereeris varem vaikselt ja tagastab nüüd esimesel lugemisel vea.

# text
seg-9dd38fa39d14 = GLONASS L1OF kanalid hõivatakse ja jälgitakse oma FDMA kandjal.

# text
# c1: iq::acq::acquire
# c2: if_hz
# c3: SampleSpec::baseband_hz(carrier) = if_hz + (carrier − center_hz)
# c4: carrier − center
# c5: if_hz
# c6: k
# c7: u32
# c8: k = -7
# c9: sat_id
# c10: k + 2^32
# c11: k
# c12: i32
seg-a775751ed6f6 = <c1/> ja jälgimiskanalid segasid iga koodi alla ainult väärtusest <c2/>. Mitme kanaliga GLONASS salvestuses leidis seetõttu kanali +{ "3" } otsing kanali { "0" } signaali (kõik kanalid jagavad ühte kaugusmõõtmiskoodi) ega vaadanud kunagi { "1.6875" } MHz kõrgemale. Mõlemad kasutavad nüüd <c3/>. Kandja liige on null iga salvestuse puhul, mis on tsentreeritud signaali enda kandjale, ja jäetakse välja, kui keskpunkt on teadmata, nii et CDMA töötlus on muutumatu. Kui tegite vana käitumise ümber, lisades <c4/> kõrvalfaili väljale <c5/>, eemaldage see liige: nihe rakendatakse nüüd kandjast ja keskpunktist, nii et selle sisse jätmine rakendab seda kaks korda. Teadaolev piirang, siin muutumatu: GLONASS stseen tuvastab iga satelliidi selle sagedusnumbri <c6/> järgi ja satelliidi id <c7/> ümbritseb negatiivse kanali. Tõe kõrvalfail kirjutab <c8/> kui <c9/> { "4294967289" } (<c10/>). Lugege see tagasi kui <c11/> koos <c12/> teisendusega.

# text
# c1: iq
# c2: kshana iq
# c3: scene
# c4: acquire
# c5: track
# c6: sweep
# c7: labfit
# c8: kshana.iq_scene
# c9: iq_acquire
# c10: iq_track
# c11: iq_labfit
# c12: iq_signals
# c13: iq::cli
# c14: tests/iq_cli.rs
seg-1c88bffc605b = <b>GNSS-i IQ-kiht CLI-s ja Pythonis ({ "0.32.0" } Phase A).</b> Olemasolev moodul <c1/> on nüüd kasutatav ilma Rusti kirjutamata. Viis uut käsku <c2/> liituvad andmetöötluse rühmaga: <c3/> genereerib pika mitme satelliidi IQ stseeni faili koos tõe kõrvalfailiga; <c4/> käitab ühe või mitme PRN-i FFT hõivamist salvestusel ja teatab iga tuvastuse (PRN, Doppler, koodifaas, statistik, lävi); <c5/> hõivab ja käitab seejärel DLL/PLL/FLL panka salvestusel ning väljastab epohhipõhise jälgimisväljundi (CSV/JSON) seadistatavate ahela ribalaiuste, integreerimisaja ja korrelaatori vahega; <c6/> mängib ühe salvestuse läbi mitme ahelakujundusega ja teatab tulemuseks oleva jitteri ja lukustuse mõõdikud kujunduse kaupa; ning <c7/> sobitab jälgimisahela lukustuse kaotuse mudeli vastuvõtja usaldusajajoonega. Sama tuum on eksponeeritud Pythonile (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>), tagastades NumPy-sõbralikke loendeid ja sõnastikke. Ainult tarkvaraline ja lisandav: uusi sõltuvusi pole, ei edastata, segamise ega spuufimise lainekuju sünteesi pole; mootor, hõivamine, jälgimine ja ahelakujundused on teegi enda omad, nii et CLI või Pythoni kutsuja saab samad bitid mis Rusti testid. Uus moodul <c13/>; stseeni enda tõe kõrvalfail on sõltumatu etalon failis <c14/> (hõivamine taastab iga süstitud koodifaasi ja Doppleri, jälgimine koondub süstitud Doppleri juurde). Ükski avaldatud stsenaariumi liikide arv ega kontrollimaatriksi rida ei muutu.

# text
# c1: iq
# c2: iq
seg-1971e3e9cfe6 = <b>Ülejäänud GNSS-i IQ teegi võimekused CLI-s <c1/> ja Pythonis ({ "0.32.0" } Phase A.2).</b> Tugineb Phase A-le, tuues pinnale kihi <c2/> ülejäänud osa ilma Rusti kirjutamata:

# text
# c1: iq scene
# c2: iq_scene
# c3: --iono-stec
# c4: --iono-vtec
# c5: --iono-klobuchar
# c6: --tropo
# c7: --s4
# c8: --scint-tau0
# c9: --sigma-phi
# c10: --multipath-height
# c11: --multipath-ground
# c12: --land-mobile
# c13: --nlos
# c14: iq::channel::SceneChannelAdapter
seg-67c485097357 = <b>Levikanal käsul <c1/></b> (ja Pythoni <c2/>): esimest järku ionosfäär (<c3/>/<c4/> või <c5/>), Saastamoineni/Niell'i troposfäär (<c6/>), Cornelli skintillatsioonimudel (<c7/>, <c8/>, <c9/>), peegeldav maapinna mitmeteelevi (<c10/>/<c11/>), kolme oleku maismaa-mobiilne kanal (<c12/>) ja nähtavuseta (NLOS) plokk (<c13/>) kehtivad igale satelliidile uue crate'i-sisese silla (<c14/>) kaudu, mis teisendab kanalimudelite absoluutsed teed stseeni geomeetriat ületava liigse kujule.

# text
# c1: iq scene
# c2: --format sigmf
# c3: .sigmf-data
# c4: .sigmf-meta
# c5: acquire
# c6: track
seg-d736671f2251 = <b>SigMF väljund käsul <c1/></b> (<c2/>): kirjutab valimid paarina <c3/>/<c4/> koos hõivamise ja satelliidipõhiste annotatsioonidega; <c5/>/<c6/> loevad SigMF-i juba, nii et stseen käib edasi-tagasi.

# text
# c1: iq frontend <in> <out>
# c2: acquire
# c3: track
# c4: --bandpass
# c5: --notch
# c6: --blank
# c7: --excise
# c8: --agc
# c9: --bits
# c10: iq::frontend
# c11: iq_frontend
seg-c59ae97779ae = <b>Esiotsa DSP</b>: uus käsk <c1/> ja samad lipud käskudel <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) käitavad etapid <c10/> (ribafilter FIR, adaptiivne sälk, impulsi blankeerimine, sageduspiirkonna väljalõikamine, AGC, kvantiseerija); peegeldatud Pythonis kui <c11/>.

# text
# c1: iq scene --nav <rinex_nav> --rx-pos lat,lon,alt
# c2: --start
# c3: --window
# c4: --prn
# c5: iq_scene_broadcast
# c6: tests/iq_cli.rs
seg-878d66b73571 = <b>Edastatud efemeriidiga stseenid</b>: <c1/> (koos <c2/>/<c3/>/<c4/>) paigutab iga terve GPS satelliidi selle tõelisele edastatud geomeetriale, kasutades mootori RINEX-lugejat, nii et tõe kõrvalfail kannab päris satelliidipõhist vahemaad, Dopplerit ja koodifaasi; peegeldatud Pythonis kui <c5/>. Ainult tarkvaraline ja lisandav: uusi sõltuvusi pole, ei edastata, segamise ega spuufimise lainekuju sünteesi pole (kanali leviefektid mõjuvad ainult seaduslikule signaalile). Iga arvuline väide on testitud sõltumatu etaloni vastu (suletud kuju või süstitud tõde) kanali/esiotsa ühiktestides ja failis <c6/>.

# text
# c1: iq
# c2: kshana iq
# c3: iq::scene
# c4: iq::channel
# c5: iq::acq
# c6: iq::track
# c7: iq::frontend
# c8: iq::io
# c9: iq::signals
# c10: iq::labfit
# c11: docs/design/GNSS-IQ-PLAN.md
seg-1e71370d87d8 = <b>GNSS-i IQ-kiht: signaalitaseme simulatsioon ja tarkvaravastuvõtja töötlus.</b> Uus moodul <c1/> viib Kshana ühe satelliidi lühiplokiga L1 C/A esiotsast täieliku signaalitaseme kihini, mis on kättesaadav käsurühmast <c2/>. See genereerib pikki, mitme satelliidi töötlemata IQ stseene epohhipõhise tõe kõrvalfailiga (<c3/>); rakendab levi signaalitasemel — ionosfäär koodi-kandja lahknemisega, troposfäär, amplituudi ja faasi skintillatsioon (Cornelli mudel), Fresneli mitmeteelevi ja kolme oleku maismaa-mobiilne kanal, koos nähtavuseta (<c4/>); hõivab ja jälgib FFT hõivamise ja mitme kanaliga DLL/PLL/FLL pangaga, mängides ühe salvestuse läbi paljude ahelakujundustega (<c5/>, <c6/>); modelleerib esiotsa — FIR/IIR filtreerimine, 1–14-bitine kvantimine, AGC, sälk, impulsi blankeerimine ja sageduspiirkonna väljalõikamine (<c7/>); voogedastab suuri salvestatud andmekogumeid piiratud mälus — int8/int16/float32/pakitud-2-bitised ja reaalse IF vormingud, mitme failiga SigMF, ümberdiskreetimine, andmekogumi inventar faili kohta SHA-256-ga ja partiikäitaja (<c8/>); lisab hajutuskoodid GPS L5/L2C, Galileo E1 (CBOC, päris ICD mälukoodid) ja E5a, BeiDou B1C/B1I ning GLONASS L1OF jaoks, igaüht kontrollitakse selle liidesekirjelduse dokumendi vastu (<c9/>); ning sobitab jälgimisahela lukustuse kaotuse mudeli päris vastuvõtja täheldatud käitumisega labori käitustes, koos ühe käituse väljajätmise hold-out veaga ja ekstrapolatsiooniga, mis on märgitud ennustusena (<c10/>). Iga arvuline väide on testitud sõltumatu etaloni vastu (ICD tabel, suletud kuju või sõltumatu vastuvõtja, mis taastab süstitud tõe); füüsikalised kanali- ja ahelamudelid jäävad MODELLED. See on ainult tarkvarakiht: see kirjutab IQ faile tarkvaravastuvõtjatele ega sünteesi häire- ega spuufimislainekujusid ega juhi raadioriistvara. Ükski avaldatud stsenaariumi liikide arv ega kontrollimaatriksi rida ei muutu. Disain: <c11/>.

# text
seg-943e21ccb25f = Vastuvõtja usaldus: hinda päris GNSS-i vastuvõtja logi.

# text
# c1: kshana receiver-trust <scenario.toml>
# c2: kshana.receiver_trust
# c3: receiver_trust
# c4: assess_receiver_log
# c5: docs/RECEIVER-TRUST.md
# c6: examples/receiver-trust/
# c7: tests/receiver_trust_jammertest.rs
seg-f8274120bff2 = <c1/> loeb u-blox UBX, RINEX { "3" } (valikulise edastatud navigatsioonifailiga), Android GnssLogger või NMEA { "0183" } logi üheks ajamärgistatud ajajooneks ja käitab selle kohal usaldusmonitore: kandja ja müra tiheduse (C/N0) langus, lukustuse kaotus, automaatne võimenduse juhtimine (AGC), u-blox segamisnäidik, asendihüpe ning RINEX-i ja navigatsiooni korral mootori enda üksikpunkti lahend pariteediga vastuvõtja autonoomse terviklikkuse monitooringuga (RAIM) ja kellaabistatud monitor. Iga epohh on nominaalne, halvenenud või mitteusaldatud ning tulemus ütleb, millal ja miks. Stsenaariumis märgitud sündmusi ja ennustatud C/N0 langusi hinnatakse samas failis märgitud tolerantside vastu: tuvastatud, hiline või vahele jäänud, ning nõus või mitte nõus. Väljundid on tulemus-JSON, epohhipõhine CSV ja diagramm; tulemus kannab logi SHA-256 ja iga lävi. Samuti kättesaadav Pythonist (<c2/>), WebAssembly paketist (<c3/>, logid sisemised) ja Model Context Protocoli (MCP) serveri uuest tööriistast <c4/>. Juhend: <c5/>; näide: <c6/>. JammerTest { "2024" } spuufimislogidel taastoodab mootori tee eelregistreeritud sõltumatu etaloni torujuhtme esimese häire igal avaldatud algusel (<c7/>). Monitorid jäävad MODELLED; ükski kontrollimaatriksi rida ei muutu.

# text
seg-55669fe92932 = Väiksem väljalase. Valideerimise voorud { "2" } ja laine 1 paketid viivad kontrollimaatriksi { "223" } realt ({ "93" } VALIDATED) versioonis { "0.29.3" } { "249" } reale ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); iga edutamine kontrolliti sõltumatu etaloni vastu tolerantsiga, mis fikseeriti enne käitust, ja iga lahknevus avaldatakse tähelepanekuna. Uus: natiivne NAIF-i kerneli lugeja ja DE440 tee, üks valideeritud SGP4-st ITRS-i levi ja aja tee, mõõdetud kellateek, LunaNet AFS-i etalongeneraator, laiendatud täpsusega ja ruutjuur-informatsioonilahendajad ning päris Kuu IQ töötlus LuGRE andmetel. Nihkunud avaldatud arvud on loetletud allpool uuendustena.

# text
# c1: docs/VALIDATION.md
# c2: docs/VERIFICATION-MATRIX.md
seg-f75f1878045e = Kakskümmend seitse kontrollimaatriksi rida muutuvad VALIDATED, kui sõltumatu etalon oli nõus tolerantsi piires, mis fikseeriti enne esimest võrdlust (edutamisreegel failis <c1/>): kümme esimeses valideerimisvoorus ja seitseteist teises. Viiskümmend üks MODELLED rida pandi esimeses voorus välise sõltumatu etaloni ette ja ülejäänud suunatavad read teises; iga lahknevus on allpool kirja pandud tähelepanekuna, mitte ära häälestatud. Kolm rida jagati nii, et valideeritud osa ei kanna valideerimata jääki, mis viib maatriksi { "223" } realt { "226" } reale; sellest ajast liidetud valideerimispaketid viivad selle { "249" } reale. Arvud loetakse genereeritud failist <c2/>.

# text
seg-8d542741fa77 = pärast vooru { "1" }

# text
seg-ae3743f976c5 = Kontrollimaatriksi read

# text
seg-6c4b1fd56a31 = neist VALIDATED välise etaloni vastu

# text
seg-90450fe87280 = neist MODELLED

# text
seg-86972e4c7f12 = neist PARTNER

# text
seg-61c5c5e308ed = Selles kirjes kasutatud lühendid

# text
seg-5907283b71da = Lühend

# text
seg-47e2e7d1a000 = ADD, ARAIM, MAAST

# text
seg-0306daa1107f = Airborne Design Document (ARAIM-i oma); täiustatud vastuvõtja autonoomne terviklikkuse monitooring; Stanfordi ülikooli Matlab Algorithm Availability Simulation Tool

# text
seg-f031f12836be = ADEV, VRW, ARW

# text
seg-b32744d6f0c2 = Alani hälve; kiiruse juhuslik kõnd; nurga juhuslik kõnd

# text
seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

# text
seg-d10345f7bfab = avatud lähtekoodiga astrodünaamika tööriistakomplekt (Nyx Space); NASA Spacecraft, Planet, Instrument, C-matrix, Events tööriistakomplekt selle Navigation and Ancillary Information Facility'st; planeetide konstantide kernel

# text
seg-0789b1b8dba2 = BCRS, TDB, TT

# text
seg-584e509c80a5 = Barycentric Celestial Reference System; Barycentric Dynamical Time; Terrestrial Time

# text
seg-f03148ef3497 = BIPM, UTC(k)

# text
seg-d6e01fbf4f10 = Rahvusvaheline Kaalude ja Mõõtude Büroo; labori realisatsioon koordineeritud maailmaajast

# text
seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

# text
seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; Kuu ajasüsteemid, mis on kirjutatud sõnumi väljale TIME_SYSTEM

# text
seg-bed3cea7e74f = CRLB

# text
seg-525ebb08f4bc = Cramér–Rao alumine piir

# text
seg-a1fff77503b4 = CW

# text
seg-064470740a35 = Clohessy–Wiltshire'i suhteline liikumine

# text
seg-d70a9b3e92a7 = Jet Propulsion Laboratory Development Ephemeris { "440" }

# text
seg-6f6e14685742 = DOP, PDOP

# text
seg-08aad29b6845 = täpsuse halvenemise tegur; asendi täpsuse halvenemise tegur

# text
seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

# text
seg-e9ecdbb0f600 = laiendatud Kalmani filter; unscented Kalmani filter (UKF); inertsiaalnavigatsioonisüsteem; ülemaailmne satelliitnavigatsioonisüsteem; inertsiaalmõõteseade

# text
seg-86765c7a6bbf = EMT, VPL, HPL

# text
seg-23029e0ceed2 = efektiivne monitori lävi; vertikaalne ja horisontaalne kaitsetase

# text
seg-27786c406107 = EOP, IERS, PCC, MAE

# text
seg-9d0a1a9fdebc = Maa orientatsiooniparameetrid; Rahvusvaheline Maa Pöörlemise ja Tugisüsteemide Teenistus; Prediction Comparison Campaign; keskmine absoluutviga

# text
seg-1508f3d3a180 = ERFA, SOFA

# text
seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

# text
seg-900c7c7e99cd = GMAT

# text
seg-0382d12eabc8 = NASA General Mission Analysis Tool

# text
seg-025aec0f5e29 = NTN, SSB

# text
seg-183dca4a747b = mitteterrestriaalne võrk (3GPP); sünkroniseerimissignaali plokk

# text
seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

# text
seg-9cebc1f9338d = Rahvusvaheline GNSS-i Teenistus; Rahvusvaheline Laserkaugusmõõtmise Teenistus; Rahvusvaheline Maa Tugisüsteem { "2020" }

# text
seg-eaca07ff8609 = ILS, LAMBDA

# text
seg-b3cb3e6ea499 = täisarvuline vähimruutude meetod; Least-squares AMBiguity Decorrelation Adjustment

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = süsteemidevaheline nihe

# text
seg-743c3303e01c = LEO

# text
seg-d7b83e7c427f = madal Maa orbiit

# text
seg-1f76fe708934 = MHSS, PL, TPL

# text
seg-a93515a6ff89 = mitme hüpoteesi lahenduse eraldamine; kaitsetase; ajastuse kaitsetase

# text
seg-9e93c8223a11 = PSD, IQ, SigMF

# text
seg-67248a79ac93 = võimsuse spektritihedus; faasis ja kvadratuuris valimid; Signal Metadata Format

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = kvantprojektsioonimüra

# text
seg-3ab6fb5e9394 = RAIM

# text
seg-ebda65a9a20f = vastuvõtja autonoomne terviklikkuse monitooring

# text
seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

# text
seg-1aeedd26b9cd = satelliidipõhine täiendussüsteem; USA Wide Area Augmentation System; kaksiksageduslik mitme konstellatsiooniga; geostatsionaarne SBAS-i satelliit

# text
seg-eabf9641678b = RMS, SISRE

# text
seg-50a677b8e972 = ruutkeskmine; signaali ruumis vahemaa viga

# text
seg-430b3c681347 = RTKLIB

# text
seg-3e75054c0034 = avatud lähtekoodiga GNSS-i positsioneerimisteek

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-264e9e51b8f8 = väga pika baasjoonega interferomeetria

# text
seg-c3bc7d828ecc = Iga allolev rida nimetab oma sõltumatu etaloni liigi (Teek: sõltumatu kolmanda osapoole teek, mis arvutab üheselt määratud suuruse; Mõõdetud: päris mõõdetud andmed; P2: sõltumatu numbriteek, mis arvutab uuesti lineaaralgebra suuruse kinnitatud sisenditel), sõltumatu etaloni, tolerantsi, mis fikseeriti enne käitust, ja tulemuse. Iga edutamise käitas uuesti teine ülevaataja, kes lõi fikstuuri baitideni uuesti ja näitas, et tahtlik mootori mutatsioon muudab testi punaseks.

# text
seg-be0a4e3ac81c = <b>GNSS/INS andurite liitmine</b> (Teek), piiratud lõdvalt seotud 15-olekulisele veaoleku EKF-ile: NaveGo v1.4 (LGPL-3.0, käitatud GNU Octave'is) oma päris Ekinox IMU/GNSS sõidul. Kshana horisontaalne, vertikaalne ja asendi innovatsiooni RMS on { "0.912" }, { "0.940" } ja { "0.861" } NaveGo omast (lävi { "1.2" }) ja selle keskmine normaliseeritud innovatsioon on { "0.395" } (lävi { "1.5" }). GNSS on kogu sõidu vältel olemas, nii et katkestust ei testita. Tihedalt seotud UKF ja seotud kellafilter jäävad väitest välja.

# text
seg-0c82afd5ba30 = <b>3-DOF asendi- ja suunamisvea eelarve</b> (Teek), kitsendatud gravitatsioonigradiendi pöördemomendi tipule: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } juhtu, { "1e-12" } suhtelise piires (halvim { "2.1e-15" }). RSS suunamiseelarve on kutsuja antud arvude summa ja jääb sellest välja.

# text
seg-71cf58e91a09 = <b>Kuu ühine side- ja navigatsioonigeomeetria</b> (Teek), kitsendatud koha paigutusele, asimuudile, tõusunurgale ja vahemaale: ANISE { "0.10.2" }, { "768" } valimit, { "1e-6" } kraadi ja { "1" } mm piires (halvim { "2.2e-12" } kraadi ja { "5.6e-9" } m). Kaugusmõõtmise täpsuse parameeter on disainisisend, mis jääb väitest välja.

# text
seg-0687c757231b = <b>Momendivaba jäiga keha asendidünaamika</b> (Teek): Basilisk { "2.9.1" } kosmoseaparaadi hub, { "1e4" } s kahel üldisel inertsil, kvaternion ja kiirused { "1e-9" } piires (halvim { "3.3e-11" } ja { "3.4e-12" } rad/s).

# text
# c1: lambda()
seg-d8c3f8cc65ac = <b>GNSS-i kandelaine faasi täisarvuliste mitmetähenduslikkuste lahendamine (LAMBDA)</b> (Teek), kitsendatud ILS-lahendusele ja selle kahele parimale normile: RTKLIB v2.4.2-p13 <c1/>, { "300" } kovariatsiooni, { "0" } täisarvulist mittevastavust, normid { "1e-9" } suhtelise piires (halvim { "5.6e-13" }). Alglaadimise (bootstrapped) edumäär jääb kontrollituks ainult sisemiselt.

# text
seg-c23196cbdc96 = <b>Komponeeritud ajastuse PL, skalaarne MHSS</b> (P2): numpy { "2.3.5" } ja scipy { "1.18.1" } { "300" } kinnitatud sisendil, PL { "1e-9" } suhtelise piires (halvim { "1.2e-10" }), määrav alamhulk identne.

# text
seg-8f524d815949 = <b>GLS ühisrežiimi valgendamine ja Mahalanobise samasus</b> (P2): numpy { "2.3.5" } LAPACK { "201" } kinnitatud kovariatsioonil, { "1e-12" } suhtelise piires (halvim { "7.9e-16" }); tingimusarvud kuni { "19.3" }.

# text
# c1: pxform
seg-b4136cdb8a98 = <b>DE440 Kuu peatelgede orientatsiooni pakkuja</b> (Teek): SPICE <c1/> binaarsel PCK-l { "2 000" } sõlmedevälisel epohhil, { "1.7e-5" } rad piires (halvim { "1.7e-6" } rad, umbes { "3" } m pinnal), pärast parandust, mis on loetletud jaotises „Parandatud“.

# text
# c1: welch_psd
# c2: signal.welch
seg-c28de00a491c = <b>SigMF salvestuse sisend ja väljund ning Welchi spektrid</b> (Teek), kitsendatud SigMF-i lugemisele ja kirjutamisele ning <c1/>: scipy { "1.18.1" } <c2/> { "1e-12" } suhtelise piires lahtri kohta (halvim { "6.0e-14" }); sigmf-python { "1.13.0" } salvestused dekodeeriti bitthaaval identselt; teegi metaandmed kehtivad SigMF { "v1.2.6" } skeemi vastu. IQ süntees ja selle mudelivõrdlused jäävad sellest välja.

# text
seg-a7756d2e124a = <b>LEO edastatud efemeriidi sobitaja ja SISRE sobitusintervalli vastu</b> (Mõõdetud), kitsendatud 16-parameetrilisele Kepleri sobitusele ja selle ainult orbiidi SISRE-le: TU Grazi ITSG täpsed orbiidid nelja satelliidi jaoks Liu et al. { "2025" } statistika vastu, komponendid 1.5x piires ({ "0.804" } kuni { "1.087" }) ja SISRE 1.5x piires ({ "0.716" } kuni { "0.809" }).

# text
seg-99debd58724a = Tähelepanekud

# text
# c1: docs/MODELLED-RATIONALE.md
seg-3f5b2f54c7bf = Sõltumatu etalon oli nende ridadega vastuolus, seega jäävad need MODELLED. Iga tähelepanek on kirjutatud ka rea sõltumatu etaloni teksti (ja seega faili <c1/>), koos testiga, mis seda kinnitab.

# text
seg-e28fac875d8c = <b>Pardakella oleku hindamine:</b> { "11" } GPS Block IIF satelliidi väljajäetud IGS kelladel on kolme oleku filter ühe sammu ees kooskõlas, kuid ühe tunni juures ülekindel { "9" }-l { "11" }-st (perioodilised ja flicker-liikmed ei ole mudelis).

# text
seg-5900ce454dc7 = <b>Spuufimise tuvastamine:</b> JammerTest { "2024" } puhul ei andnud ükski vaadeldavuse taseme monitor häiret { "10" } s jooksul ühestki { "8" } avaldatud algusest ja kolm algusele eelnevat akent kandsid valehäireid.

# text
seg-08b6e6aa7d08 = <b>Ajastuse kaitsetase spuufimise all:</b> mõõdetud tuvastamata ajaviga ületab TPL-i { "3" } { "8" } tuvastatud algusest (1.9x kuni 5.3x); { "60" } s kella kalibreerimine ei kata vastuvõtja TCXO triivi.

# text
seg-a2f4df11d9cc = <b>Stardiakna ja tõusu geomeetria:</b> Orekit { "12.2" } vastu ühtib geomeetria ümardamiseni, kuid Maa pöörlemise koha kiirus ületab { "1e-6" } suhtelise kohal { "62.9" } kraadi laiust ({ "1.12e-6" }, poolusliikumine, mille sfääriline mudel välja jätab). Voor { "2" }: tõelise poolusega kiirus epohhiga ühtib, vaike-epohhita kiirus ületab endiselt (vt allpool).

# text
seg-f6b6c9251a17 = <b>Ballistiline atmosfääri sisenemise koridor (Allen–Eggers):</b> Stardusti sisenemise ennustatud tipukiirendus on { "61.8" } g rekonstrueeritud { "32.89" } g vastu (+{ "88" } %, tolerants { "15" } %).

# text
seg-5d83648dd867 = <b>Ühine UT1 ja poolusliikumise viga:</b> { "178" } IERS Bulletin A väljaandes trükitud täpsusvalemi vastu ühtib poolus 1.5x piires, kuid UT1 mitte ({ "0.48" } { "10" } päeva juures, { "1.59" } { "40" } päeva juures). Asendatud voorus { "2" }: rida on nüüd VALIDATED (vt allpool).

# text
seg-98a99bcba894 = <b>Võrguväline vaikimisi Maa orientatsiooni sisend:</b> astropy kinnitab ridade loenduse, kuid { "12" } rida, mida teek nimetab Bulletin A ennustusteks, on märgitud mõõdetuks (I), mitte ennustatuks (P). Operatiivse ennustaja rea kokkulangevusarvud olid seetõttu mõõdetud ridade vastu. Asendatud voorus { "2" }: mootor klassifitseerib read lipu järgi ja rida on VALIDATED.

# text
seg-d96fbfa4be79 = <b>Operatiivstiilis Maa orientatsiooni ennustusviga:</b> ennustaja UT1 viga on 2.4x kuni 12.6x Bulletin A omast { "1" } kuni { "10" } päeva juures ja { "5.32" } ms { "10" } päeva juures, väljaspool 2. EOP PCC vahemikku { "0.36" } kuni { "3.13" } ms.

# text
seg-1833bf6e3b6f = <b>Kuu geodeetiline VLBI:</b> ANISE valguse aegade vastu läbi DE440 ei jää ükski viivitus { "1" } ps piiresse; suurim lõhe on { "24" } µs, enamasti analüütiline Kuu keskpunkt (umbes { "200" } km DE440-st). Voor { "2" }: kerneliitee on VALIDATED omaette real; see analüütiline tee jääb MODELLED.

# text
seg-0ec8a2a91702 = <b>Kuu koostalitlusvõime eksport:</b> Orekit { "12.2" } keeldub ajasüsteemidest LTC ja TCL, seega Kuu OEM-failide vahetust teise lugejaga ei ole tõestatud.

# text
seg-09cfd4e61b7b = <b>Clohessy–Wiltshire'i suhteline liikumine:</b> Orekiti mittelineaarse liikumise vastu { "100" } m juures on lõhe { "1.2" } kuni { "6.3" } mm, üle { "1" } mm; see skaleerub nagu väljajäetud teist järku liige, nii et eelregistreeritud tolerants asus lineariseerimisvea all. Asendatud voorus { "2" }: teist järku parandus on VALIDATED sama läve vastu.

# text
seg-af1bdd974ba5 = <b>INS/TRN vabaliikumise vea kasv:</b> NaveGo vabainertsiaalse Monte Carlo vastu kehtivad kasvuseadused { "5" } % piires kuni { "600" } s ja ületavad seda sealt edasi (2.2x kuni 8x ühe tunni juures), kuna need jätavad välja Schuleri tagasiside. Asendatud voorus { "2" }: Schuleri veamudel on VALIDATED.

# text
seg-8459bc50f8b4 = <b>Kuu teenindusruumala päris konstellatsiooni geomeetriast:</b> { "4" } { "12" } avaldatud kättesaadavuse statistikast erinevad rohkem kui { "2" } protsendipunkti võrra (kuni { "22.5" }).

# text
seg-7a0fd1377b9c = <b>Heterogeense UTC(k) jälgitavuse nihke ülempiir:</b> { "105 024" } BIPM-i real ületab { "50.8" } % ridadest ülempiiri; avaldatud määramatus piirab BIPM-i nihke mõõtmist, mitte nihet.

# text
seg-814acf34cffd = <b>Kuu datumi nullruumi klassifikatsioon:</b> avaldatud viie reflektori geomeetria puhul on korrelatsioon -0.78 vastu -0.97 ja alguspunkti CRLB on { "96" } kuni { "98" } % artikli omast madalam.

# text
seg-da01b5e08a87 = <b>Kuu LLR datumi geomeetria substraat:</b> { "192" } ILRS-i Kuu normaalpunkti vastu { "2024" }. aastast oli ühesuunaline jääk RMS { "96" } m varasema orientatsiooni interpolatsiooniga ja on { "22.7" } m pärast allolevat parandust, endiselt üle { "10" } m läve (ümardatud jaamade koordinaadid, poolusliikumist pole). Orientatsiooniseeria piirab vaikselt väljaspool 2024-2025. Voor { "2" }: mõõdetud kauguse mudel on VALIDATED omaette real ({ "2.81" } m); seeria katab nüüd 2014-2030 ja annab väljaspool seda vea.

# text
seg-fd9ad94680e9 = <b>Relativistliku kellakiiruse seos tugisüsteemiga:</b> omapotentsiaali liige on { "3.18e-4" } üle avaldatud väärtuse (tolerants { "1e-4" }); artikkel hindab teistsugust potentsiaali, nii et selle suletud kuju avaldatud väärtust pole. Asendatud voorus { "2" }: 2. astme ekvatoriaalne potentsiaal on VALIDATED sama artikli vastu.

# text
seg-e002819c1e2d = <b>Iga Päikesesüsteemi keha füüsikalised konstandid:</b> { "12" } { "84" } lisatud kehade konstandist erinevad NAIF-i pck00011 ja gm_de440 omadest (vanemad Marsi kaaslaste elemendid; muud GM-lahendused Uraanile, Neptuunile ja Pluutole). Voor { "2" }: konstandid järgivad nüüd NAIF-i (ümberkirjutus, ei loeta), ja arvutatud orientatsioon ühtib SPICE-iga; rida jääb MODELLED.

# text
seg-e722d242e78e = <b>Valitavad LEO efemeriidimudelid:</b> 22-parameetriline sobitus jätab { "20" } min kaaredel 1.71x ja 1.86x avaldatud piki rada viga, üle 1.5x. Asendatud voorus { "2" }: 22-parameetriline mudel ja sobitus on VALIDATED omaette real.

# text
seg-c136023752df = <b>Ühine GNSS-i ja LEO positsioneerimine:</b> süsteemidevaheline nihe ühtib RTKLIB-iga, kuid { "93.2" } % epohhidest on { "3" } m piires ITRF2020-st { "95" } % vastu; RTKLIB ise saavutab andmetel { "88.2" } % ({ "93.6" } % pärast vooru 2 rühmaviivituse parandust).

# text
seg-e5f0e3c21def = <b>Ühisrežiimi terviklikkuse pimedus</b> ja <b>katvuse ning DOP-i kaardid:</b> mõlemad võrdlused läbiti, kuid lükati ülevaatusel tagasi, sest tahtlikult vale mootor läbib need samuti (esimene kontrollib ainult sisemist samasust; teise avaldatud põhjad ei näe kahekordistunud PDOP-i). Voor { "2" }: ühisrežiimi terviklikkuse pimedus on VALIDATED pariteeti kandvatel sisenditel; katvuse kaardid jäävad tähelepanekuks (vt allpool).

# text
seg-688e1753cd53 = Valideerimise voor { "2" }

# text
seg-b320fbdb72c3 = Teine voor võttis iga rea, mille esimene voor jättis suunatavaks, uute eelregistreerimistega, mis kinnitati enne mis tahes fikstuuri toomist või sõltumatu etaloni käitamist, vastuolulise teise ülevaatajaga, kes käitas iga võrdluse uuesti, ja tahtliku mootori mutatsiooniga, mis peab iga testi punaseks muutma. Omanik võttis 2026-10-02 vastu Omega-välise piiri rea parandatud sõnastuse enne selle edutamist (vana tekst oli koodiga vastuolus).

# text
seg-7b7c584caaaf = <b>Edutatud VALIDATED ({ "17" }).</b> Sõltumatu etaloni liik sulgudes; tolerants fikseeritud enne käitust.

# text
seg-555e6ad454d2 = <b>Relativistliku kellakiiruse seos tugisüsteemiga</b> (Etalon): Ashby ja Patla { "2024" } L_m { "2.8e-6" } piires (lävi { "1e-4" }) artikli viidatud kahe välja 2. astme ekvatoriaalsest potentsiaalist; pyshtools 350. astme gravitatsioon radiaalse sissekande jaoks ({ "8.3e-5" }); DE441 Kuu kiirus ({ "2.5e-3" }).

# text
seg-0c01fac44708 = <b>Võrguväline vaikimisi Maa orientatsiooni sisend</b> (Teek): astropy { "8.0.1" } ja IERS Bulletin A nr { "039" } kinnitavad uuesti lõigatud väljavõtte { "30" } lõplikku, { "54" } kiiret ja { "90" } ennustatud rida.

# text
seg-b77253dd26b5 = <b>Ühine UT1 ja poolusliikumise viga</b> (Teek): astropy ja pyerfa täispöörded reprodutseerivad ühise tabeli (UT1 ja poolus { "6e-16" } piires, kombinatsioon { "1.9e-7" } piires); IERS Annual Report { "2019" } realiseeritud vead annavad suhted { "1.001" } kuni { "1.100" }.

# text
seg-378414f812c1 = <b>EO kasulikkoormuse jalajälg ja katvus</b> (Teek): Orekit { "12.2" } ja GeographicLib { "2.1" } igal eelregistreeritud lävel, J2 sõlme regressiooniga nüüd sõlmede vahes.

# text
seg-792bf58a1c1e = <b>Clohessy–Wiltshire'i suhteline liikumine</b> (Teek): suletud kujul teist järku parandusega { "1.2e-7" } m piires Orekiti mittelineaarsest liikumisest { "1e-3" } m vastu; ainult lineaarne maatriks jääb iseloomustatuks ({ "1.2" } kuni { "6.3" } mm).

# text
seg-423437d90022 = <b>B-tasandi sihtimine ja kontaktkoonuse gravitatsiooniabi</b> (Teek): GMAT R2026a B-tasand, asümptoodid, C3 ja heliotsentrilised elemendid; sbpy { "0.6.0" } ning Kasuga ja Jewitt { "2019" } Tisserandi parameetri jaoks.

# text
seg-b29b0dfcd3a4 = <b>INS/TRN vabaliikumise vea kasv</b> (Teek): üheksa oleku Schuleri veamudel { "5" } % piires parandatud NaveGo vabaliikumise käitustest kõigis { "48" } punktis (halvim { "3.70" } %).

# text
# c1: lstsq
seg-8cc49496b4c6 = <b>Ühisrežiimi terviklikkuse pimedus</b> (P2): numpy <c1/> { "1464" } pariteeti kandval sisendil { "1e-12" } piires (halvim { "1.06e-14" }).

# text
seg-f0ff538b7329 = <b>Kuu ühine mitmetehnikaline OD ja kell</b> (P2): numpy arvutab uuesti iga Gaussi–Newtoni sammu, sigma ja jaama vea kuuel võrgul ({ "2.4e-11" } piires) pärast QR-lahenduse parandust.

# text
seg-7ed9b059f888 = <b>Kuu-VLBI jaama koordinaatide kovariatsioon</b> (Teek): SPICE-iga ehitatud Jacobi maatriks reprodutseerib ajakava, spektri, sigmad ja nullruumi { "1" } % ja { "0.1" } kraadi piires; numpy { "2e-13" } täpsusega.

# text
seg-0e4e1c3fc899 = <b>Jääk väljaspool Omega tuvastamatu ühisrežiimi piir</b> (P2, omaniku otsusega parandatud sõnastus): numpy LAPACK { "256" } juhul { "1e-12" } piires, kuus täpset lõpmatust.

# text
seg-0fc8ce9cde6c = <b>Baasinvariantne nullruumi klassifikatsioon</b> (P2): SciPy ja NumPy alamruumide ühisosa { "72" } konstrueeritud maatriksil, täisarvud täpsed, projektori norm { "6.0e-15" } piires.

# text
seg-4e5e7a6072bc = <b>LEO navigatsioonisõnumi ühesageduslikud ionosfääri ja UTC teenused</b> (Teek): GNSSTk { "15.3.1" } Klobucharile, asimuudile ja UTC triivile; ERFA kolmele liigsekundi juhule.

# text
seg-a644bf49c816 = <b>5G mitteterrestriaalse võrgu positsioneerimispiir</b> (P1): Bachl, Lei ja Nabeel { "2026" } ühe SSB piirid poole trükitud numbri piires; numpy lahendite kovariatsioonide jaoks.

# text
seg-b326f6fc55ad = <b>LLR mõõdetud kauguse mudel</b> (Mõõdetud, uus rida, eraldatud LLR datumi substraadist): { "192" } ILRS-i Kuu normaalpunkti RMS-iga { "2.81" } m { "10" } m läve vastu, IERS { "2010" } barütsentrilise valguse ajaga; läve all olevaid komponente ei lahendata üksikult ja rida ütleb seda.

# text
seg-82e9fba684dc = <b>Kuu geodeetiline VLBI, kerneliitee</b> (Teek, uus rida, eraldatud Kuu VLBI reast): SPICE koondunud valguse ajad { "1" } ps piires ja osatuletised { "1e-6" } piires J2000 lähedastel epohhidel; analüütiline vaiketee jääb MODELLED.

# text
seg-03c47d262ff3 = <b>Liu et al. { "2025" } 22-parameetriline LEO efemeriidimudel ja selle sobitus</b> (Mõõdetud, uus rida, eraldatud valitavate mudelite reast): päris täpsed orbiidid 1.5x piires avaldatud statistikast artikli päevadel ja väljajäetud päevadel ({ "0.683" } kuni { "1.186" }); n_dot skaala konventsioon on ümber kirjutatud ja seda selle võrdlusega ei valideerita ning peatumisreegel on Kshana parameetrite koondumise reegel, mitte artikli RMS-muutuse reegel. ATOMIC polünoom ja viie kõrguse tabel jäävad MODELLED.

# text
seg-b49f96eb52ad = Olemasolevad VALIDATED read uuesti toetatud (arvu muutus puudub).

# text
seg-4e26bec3297c = <b>Planeetide asendid JPL Standishi elementidest</b> ja <b>valguse aeg Päikesesüsteemi kehade vahel</b>: tagantjärele kahekordse nominaalväärtuse läved asendatakse eelregistreeritud võrdlustega JPL Horizons DE441-ga (RMS kõige rohkem Explanatory Supplement tabeli { "8.10.1" } arv, halvim { "0.778" }, Maa lõhestus ja ICRF-i pööre kaasa arvatud; valguse ajad { "1e-6" } s piires Horizonsist DE441 asenditel, halvim { "6.7e-9" } s). Nende lipud „piir seatud pärast võrdlust“ eemaldatakse.

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
# c4: raim::solution_separation_raim
seg-d3b745392d29 = <b>Terviklikkus (RAIM/ARAIM/SBAS)</b>: rida ei toetu enam usutavuse kontrollidele. See ütleb nüüd: ADD v4.2 ARAIM-i mitme hüpoteesi lahenduse eraldamine ühtib Stanfordi MAAST-iga ARAIM { "2" } jaoks { "270" } päris juhul (halvim VPL erinevus { "2.2e-3" } m { "0.05" } m vastu); hetktõmmise RAIM-i tuvastamine ja välistamine ühtivad RTKLIB <c1/>-ga { "2016" } { "2016" } otsusest, kaldekaitsetasemega { "2.7e-12" } m piires; SBAS DO-229E L1 kaitsetasemed ühtivad Stanfordi MAAST-iga päris WAAS-i edastustel ({ "2868" } paari { "1.6e-5" } m piires). See ütleb selgelt, et ühtlase sigmaga funktsioonid <c2/> ja <c3/> EI järgi ADD-i (sobitatud sisendite lüngad 0.75/4.04 m ja 0.39/1.93 m VPL/HPL, tähelepanek), et DFMC L5 SBAS-i võrdlus on tähelepanek ({ "308" } paari, millel pole GEO-t vaates, on Kshana poolt kaitstud ja MAAST-i poolt mitte) ja et <c4/> ei ole välist võrdlust. Selle enda lipp eemaldatakse.

# text
seg-d059b9953c3f = <b>LEO edastatud efemeriidi sobitaja</b>: integreeritud tõeline orbiit lisatakse valideeritud osale (Orekit { "12.2" } { "4.55" } mm piires { "6" } h jooksul, lävi { "2" } cm); parandusepolünoomid, kella sobitus ja uuendusperioodi kompromiss jäävad modelleeritud.

# text
seg-166d511bbba3 = <b>Tähelepanekud ja blokeeritud read (jäävad MODELLED).</b> Iga rea sõltumatu etaloni tekst kannab tähelepanekut ja selle kinnitatud testi.

# text
seg-7f233dbdf110 = Navsignaali modulatsioon (Betz { "2001" }, Hein { "2006" }): spektrid ja korrelatsioonid ühtivad; { "24" } MHz külgsagarad ja iga mitmeteelevi nihe ({ "11" } kuni { "15" } % madal) mitte, põhjus lahendamata.

# text
seg-4d5a6bb44d64 = TDOA/FDOA geolokatsioon: piirid ühtivad Ho ja Chani ning Ho ja Xu omadega ning autorite koodiga { "3e-12" } täpsusega; Monte Carlost trükitud Ottawa tegurid erinevad { "1.3" } % ja { "4.4" } % võrra.

# text
seg-5fa189f788ca = Maa GNSS Kuu kaugusel: GENESIS-i seniidi keskmised ühtivad Montenbruck et al. { "2023" } omadega { "5" } { "6" }-st; nadiiri keskmised on { "1.0" } kuni { "2.4" } satelliiti liiga kõrged.

# text
seg-d7e5b5a64f43 = Katvuse ja DOP-i kaardid: Maa kujundused ühtivad Orekiti, gnss_lib_py ja numpyga igal lävel; Kuu ja Marsi kujundused ületavad { "1e-9" } ainult peaaegu singulaarsetes lahtrites.

# text
seg-3c8fb07d83ec = Ühine GNSS-i positsioneerimine: kaksiksageduslik { "79.9" } % ja täpsed tooted { "94.2" } % { "3" } m piires { "95" } % vastu (RTKLIB { "67.9" } % ja { "94.1" } %); täpsete toodete ISB lõhe on RTKLIB-i antennide nihete tähelepanuta jätmine.

# text
seg-5d3d4d99fbc4 = Jälgimisahelad (GNSS-SDR { "0.0.19" }): ühtivad sagedusel { "35" } kuni { "45" } dB-Hz; sagedusel { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, läved +{ "1.5" } dB; libisemiste ajad { "0.5" } kuni { "2" } dekaadi lühemad.

# text
seg-0dd24947169c = Kuu teenindusruumala (Orekit ja Hipparchus): { "155" } { "160" } väärtusest ühtivad; halvima valimi nõue ebaõnnestub peaaegu singulaarsel LNCSS B geomeetrial.

# text
seg-74002245287f = Kvantinertsiaalandur: ainult QPN põhi on { "21" } kuni { "31" } % Gauguet { "2009" } mõõdetud mürast madalam (lävi { "30" } %, möödas { "0.5" } punkti võrra).

# text
seg-ab8b17cf325e = Ostsillaatorite eelseaded: mõõdetud üksused ületavad rubiidiumi holdover-i, tseesiumi lühiajalise ja CSAC halvima üksuse eelseaded; OCXO eelseadel pole mõõdetud kirjet.

# text
seg-81ad9b839a28 = Kosmoseilma tihedus: Jacchia { "1971" } on teguri { "2" } piires kiirendusmõõturite tihedustest päikesemaksimumil, kuid umbes 1.7x liiga tihe { "2008" } miinimumis.

# text
seg-68e5d0942847 = Geomeetriavaba kaldtee TEC: { "33" } { "36" } kaarest { "3" } TECU piires CODE kaardist (halvim { "6.84" }).

# text
seg-f410ce9cf195 = Spuufimise tuvastamine ja TPL ametliku JammerTest { "2024" } logi vastu: { "4" } { "10" } algusest tuvastati õigel ajal; TPL ületatakse { "4" } { "10" }-st.

# text
seg-41eb2c318469 = Kellafilter värsketel IGS kelladel: kaks { "11" } satelliidist ei läbi innovatsioonisumma kriteeriumi.

# text
seg-064b623e918b = Vähimruutude pluss autoregressiivne EOP ennustaja: UT1 { "1.73" } kuni 2.11x Bulletin A { "2" } kuni { "10" } päeva juures.

# text
seg-d98571cc21f4 = UTC(k) realiseeritud nihke ülempiir: koondatud ületus { "0.0333" } vastu { "1e-2" }.

# text
seg-527aca91ec7c = Kuu tugisüsteemi datum kampaaniast: SPICE haru ühtib; jaamade hinnatud P2 haru jääb { "1e-9" } möödas tingimus-2.1e8 probleemil.

# text
seg-9805c4c821f9 = Kuu tugisüsteemi datum päris LLR-ist: { "15" } { "16" } arvust ühtivad SPICE-iga; z-nihke sigma on { "1.03" } % kõrge { "1" } % vastu.

# text
seg-08e6c541b59e = Atmosfääri sisenemine (Allen-Eggers): punktmassi lahendus ühtib agentuuride rekonstruktsioonidega (ainult ristkontroll); kiirendusmõõturi võrdlus on blokeeritud loetavale Hayabusa2 allikale.

# text
seg-0bb78ffbd915 = ITU-T maskid: trükitud töötatud väärtused ühtivad; G.8273.2 klassi piiridel neid pole (blokeeritud).

# text
seg-308c1bca3fd9 = Stardiakna geomeetria: tõelise poolusega koha kiirus epohhiga ühtib Orekitiga ({ "4.9e-8" }); vaike-epohhita kiirus ületab endiselt ({ "1.12e-6" }). Ei edutatud; järeltöö ootel.

# text
seg-f0b7c3d60df8 = Iga keha füüsikalised konstandid: nüüd erineb NAIF-ist { "0" } { "84" }-st (ümberkirjutus) ja arvutatud orientatsioon ühtib SPICE-iga { "1.4e-10" } rad täpsusega. Ei edutatud; järeltöö ootel.

# text
seg-a5a787c9a761 = Blokeeritud omaniku ulatuseotsusel, igaühel koos ühtiva kinnitatud võrdlusega: Kuu absoluutse jaama jälgitavus, pinnamajaka DOP, telje kõrvalekaldega eksport, ristmodaalsuse tuvastusvõimsus, ühisrežiimi kooskõla statistik ja polaarne LEO katvus.

# text
seg-cf638ec9878b = Blokeeritud andmetel: aja edastamise vea eelarvestamine (vajab päris andmete redutseerimist), JammerTest C/N0 (antenni asendi ja võimsuse jaotus dokumenteerimata).

# text
seg-e8709509eef3 = Uuendused (avaldatud arvud, mis nihkusid, vana -> uus).

# text
# c1: snapshot_raim
# c2: gnss-sim
# c3: docs/tutorials/scenarios/gnss-sim.toml
seg-5e93ab237b15 = <c1/> kaitsetasemed on nüüd geodeetilisel kohalikul tasandil radiaalse asemel: kuni { "0.31" } m HPL ja { "0.14" } m VPL jaamas ABMF ({ "16" } kraadi N); ükski golden ei nihkunud, kuid õpetuse <c2/> salvestatud kokkuvõte nihkub keskmiselt HPL { "22.1" } m / VPL { "40.0" } m väärtustelt väärtustele { "22.2" } m / { "39.9" } m (<c3/>).

# text
seg-c14361b2cb1f = Kuu kiirustugisüsteemi sidumise vaikeväärtused: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } meetri kohta.

# text
# c1: realtime-frame-eop
# c2: docs/revisions/M035-default-eop-recut-cell-changes.md
# c3: tests/golden/realtime-frame-eop.csv
seg-8ac9cb8c5631 = Võrguväline vaike-EOP käitus (<c1/>, lahtrid loetletud failis <c2/>): predicted_rows { "12" } -> { "90" }; poolusepõhi { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; faili <c3/> tabeli { "2" } read; operatiivse ennustaja kokkulangevus 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

# text
# c1: docs/LEO-NAVMSG.md
seg-dd93329245ba = <c1/> liu22 SISRE orbiit/kellaga: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

# text
seg-e4205dfdb0d2 = Liu kõrgustabel, Kshana (suhe): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

# text
# c1: nDot
seg-4655e8ee7bab = LEO navigatsioonisõnumi <c1/> skaala { "2" }^-60 -> { "2" }^-58 (ei eelregistreeritud, avalikustatud; väljaspool sobitusvõrdlust); liu22 näidiskaadri CRC 0x62373A -> 0xDED99C.

# text
# c1: docs/LEO-NAVMSG.md
seg-3f565c0ca2bf = <c1/> kontrollitabel: Liu ja ATOMIC rida jagati VALIDATED 22-parameetriliseks reaks ja MODELLED ATOMIC ning viie kõrguse reaks.

# text
seg-537f5d80b66c = DE440 Kuu peatelgede orientatsiooni rea tekst: ulatus 2024-2025 / { "731" } rida -> 2014-2030 / { "6 209" } rida; „piirab vaikselt“ -> vead väljaspool selle ulatust.

# text
# c1: eo-coverage
seg-17a5dd090566 = Stsenaarium <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; uued väljad inclination_deg ({ "98.19" }) ja nodal_period_min ({ "98.893" }).

# text
# c1: constellation-multi-gnss-coverage
seg-6ce48a53df35 = <c1/> (TDOP/GDOP etalonkell on nüüd vaates oleva madalaima numbriga konstellatsioon): globaalne GDOP max { "2.2236" } -> { "2.1205" }, keskmine { "1.122" } -> { "1.131" }, mediaan { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" } ja lahtripõhine GDOP kaart; mean_visible_by_constellation summeeritud täisarvudena (umbes { "1e-12" } suhtelist, nähtamatu { "4" } kümnendkohal).

# text
seg-e48b212c4881 = Ühine GNSS-i ühesageduslik lahend pärast edastatud rühmaviivituse parandust: { "93.2" } % -> { "93.6" } % { "3" } m piires; ISB mediaan -0.351 -> -0.114 ns.

# text
# c1: tracking-loop
seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (Costase ahela SNR rho/4): läve { "25.47" } dB-Hz juures { "11.58" } -> { "2.10" }; { "25" } dB-Hz juures { "9.55" } -> { "1.60" }; { "22" } dB-Hz juures { "2.24" } -> -0.14.

# text
# c1: ins-trn-coast
# c2: tests/conflict_resilience_architecture_guard.rs
seg-789a302679f7 = <c1/>: iga väljund nihkub Schuleri veamudeliga; tarnitud stsenaariumi TRN tipp { "52.932679" } -> { "44.711834" } m (<c2/>).

# text
# c1: lunar-vlbi
seg-9d65f2ce8715 = <c1/> aruanne: uus võti geometry_path („analytic“ vaikekäitusel, ükski arvväärtus ei muutunud); uued valikulised väljad planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path, koos epoch_partials kerneliteel; liigi kirjeldus on ümber kirjutatud. Kontrollirea kerneliitee sõltumatu etalon on SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) muutub kerneli hindamise ristkontrolliks.

# text
seg-3631a31e7b26 = Keha konstandid: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uraan { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptuun { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluuto { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); Phobose ekvatoriaalraadius { "13.1" } -> { "13.0" } km; Phobose ja Deimose pooluse ja nullmeridiaan failist pck00011; Päikesesüsteemi prime_meridian_deg sisaldab nüüd ruut- ja perioodilisi liikmeid.

# text
# c1: europa-surface-pnt
# c2: body-pnt
# c3: docs/SOLAR-SYSTEM.md
# c4: mcp/kshana-mcp/tests/round_trip.rs
# c5: mars-orbit-pnt
seg-ac1251d7a0fd = <c1/> (<c2/> Europal), täielikust pck00011 Europa orientatsioonist (7cfd66b4; orientatsioon ühtib SPICE pxform-iga { "1.4e-10" } rad täpsusega), mis nihutab maanduri inertsiaalruumis: kättesaadavus ainult releed / Maa kaugusega { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } { "171" } epohhist ainult releed), mediaan PDOP { "5.266" } -> { "5.360" }, RMS lahendi viga { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, mediaan formaalne sigma { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Tabel failis <c3/> ja kinnitus failis <c4/> järgivad; <c5/> on muutumatu.

# text
# c1: space-weather
# c2: tests/space_weather_reference.rs
seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), kalibreeritud tegur asendatud Jacchia { "1971" } omaga: activity_density_kg_m3 kõrgustel 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k eemaldatud, mean_exospheric_temperature_k lisatud ({ "1186.7" } K); <c2/>: { "800" } km päikesetsükli kõikumine on nüüd 10.4x (NRLMSISE-00 13.6x) ja kõrguse väide järgib NRLMSISE-i tõusu kuni { "500" } km ja langust { "800" } km juures.

# text
# c1: ntn-5g-positioning
seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (kokkuvõtte tekst muutumatu { "2.09" } / { "25.94" } m).

# text
# c1: lunar-joint-od-clock
seg-6a6fb57d177e = <c1/> (QR-lahendus): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

# text
# c1: docs/field-units-schema.json
seg-76c94424e828 = <c1/> väljastati uuesti ülaltoodud uute ja eemaldatud väljade jaoks.

# text
seg-717c51e1cca0 = Valideerimispaketid

# text
seg-4ec44f8a5f8e = D12, laiendatud täpsus ja ruutjuurlahendaja (kaks uut VALIDATED rida: { "226" } -> { "228" } rida, { "110" } -> { "112" } valideeritud).

# text
seg-d28005966948 = Osa { "1" }, laiendatud täpsusega sõltumatu etalon:

# text
seg-9a5f94973450 = Kuu tugisüsteemi datum hinnatud jaamadega: 50-kohaline mpmath laiendatud täpsusega sõltumatu etalon (eelregistreeritud 804662d5, tingimusega skaleeritud läved a priori tagurpidi veavalemist) ühtib uuel kampaaniakuupäeval (2026-03-18) ja algsel 2024-01-01 stsenaariumil; uus VALIDATED rida kategooria P2 all. See lahendab varasema kahekordse täpsuse vaidluse: mootori datumi sigmad on kuni { "9.7e-6" } võrra eemal, NumPy pöördmaatriksi ja omaväärtuse teed kuni { "6.2e-6" } võrra ning selle Choleski ja QR teed umbes { "1e-8" } võrra. Mootor on oma veapiiri sees, kuid umbes tuhat korda vähem täpne kui faktoriseerimistee.

# text
seg-b055435a2138 = Sõltumatu etaloni keskkond: mpmath { "1.3.0" } lisatud.

# text
seg-d0c2b2a8e635 = Uuendused: puuduvad. Ükski golden-fail ega avaldatud joonis ei muutu; rida „Kuu tugisüsteemi datum vaatluskampaaniast“ jääb MODELLED (asutaja otsus 2026-10-02, variant A: see ei laena eraldi rea olekut); selle testide tekst viitab uuele testile ja selle tähelepanekule.

# text
seg-50b53908fb7c = Osa { "2" }, ruutjuur-informatsiooni datumi lahendaja:

# text
# c1: linalg_sr
# c2: solver = "srif"
seg-4c6089cfac5e = Uus valikuline ruutjuur-informatsiooni lahendaja (<c1/>; <c2/> stsenaariumis lunar-frame-campaign): Householderi QR, marginaliseerimine kolmnurkse teguri kaudu, Jacobi SVD spektri jaoks ja kompenseeritud korrutised ainult korrektselt ümardatud tehetest. 50-kohalise sõltumatu etaloni vastu (eelregistreeritud b41908c9) ühtivad selle datumi sigmad { "3e-13" } täpsusega uuel kuupäeval (2026-06-09); 2026-03-18 ja 2024-01-01 sisenditel on vaikelahendaja kuni { "1e-5" } võrra eemal. Uus VALIDATED rida kategooria P2 all. Vaikelahendaja ja selle väljund on muutumatud. Eelregistreeritud läved tõendavad vigu ainult üle umbes { "2e-7" } suhtelise: need lükkavad vaikelahendaja tagasi, kuid mitte ümberpööratud Householderi märki, kompenseerimata skalaarkorrutist ega spektraalset lõppinversiooni, ja rida ütleb seda.

# text
# c1: fim::crlb_srif
# c2: batch_ls::gauss_newton_srif
# c3: orbit_determination::determine_orbit_batch_srif
# c4: lunar_combination::formal_covariance_srif
# c5: precise_od::fit_srif
# c6: cislunar_srif::srif_cross_validation_sqrt
# c7: linalg_sr::weighted_lstsq
# c8: covariance_from_sqrt_information
# c9: precise_od::fit
seg-de9aeb2adde0 = Valikulised ruutjuurteed muutumatute vaikeväärtuste kõrval: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> ja <c6/>, uutel <c7/> ja <c8/>. Igaüks ühtib oma vaikeväärtusega seal, kus mõlemad on täpsed (sisemine kontroll, rida pole; nende kohta ei väideta valideerimist). <c9/> delegeerib nüüd jagatud rutiinile; selle väljund ja iga stsenaariumi vaikeväljund on muutumatud.

# text
seg-87a632404f32 = Kuu tugisüsteemi kampaania astaku otsused: eelregistreeritud laiendatud täpsusega kontroll { "40" } päeva üle kinnitab iga otsustatava jaamaploki ja täisastakuga Helmerti otsuse. A priori piir ei suuda kinnitada { "20" } astakuvaest Helmerti päeva; täpses aritmeetikas on nende defekt geomeetriline, läve { "1e-9" } asudes kampaania omaväärtuste suhete loomulikus vahemikus. Rida pole.

# text
seg-3b24e7fa36bf = Laiendatud täpsusega kampaania rea väide on kitsendatud kujule „halvima juhu piires“ ja selle jaamad-fikseeritud nõrgima suuna kontroll mõõdab nüüd päris nurka ({ "6.6e-16" } rad; võrdlusoperaator muutus acos-ist kõõluks, lävi mitte).

# text
seg-4fad02ab4b6d = Uuendused: puuduvad. Ükski golden-fail ega avaldatud joonis ei muutu; rida „Kuu tugisüsteemi datum vaatluskampaaniast“ on muutumatu ja jääb MODELLED (asutaja otsus 2026-10-02, variant A).

# text
seg-627d3357d620 = D4, JPL kerneli efemeriidi selgroog, faas { "1" } (neli uut VALIDATED rida: { "228" } -> { "232" } rida, { "112" } -> { "116" } valideeritud).

# text
seg-30e8a645191f = NAIF-i kerneli lugejal on oma rida.

# text
# c1: naif_kernel
# c2: tests/naif_reader_spice_oracle.rs
seg-98ff121aa2a9 = <c1/> (DAF-konteiner, SPK tüüp { "2" }, binaarne PCK tüüp { "2" }) ühtib SPICE Toolkitiga (CSPICE N0067 läbi spiceypy { "8.2.0" }) ja ANISE-iga { "0.10.6" } kõigil { "600" } DE440 olekul ja { "200" } Kuu orientatsiooni pöördel juhuslikul ruudustikul, mis on tõmmatud eelregistreerimise commiti enda räsist (abcd9133), läviväärtuste sees, mis on eelnevalt tuletatud kahekordse täpsusega Tšebõšovi hindamisest (halvim { "0.6" } % lävest, { "1.95e-3" } m). Rida väidab, et mootor loeb JPL-i kerneleid õigesti, mitte seda, et DE440 või analüütiline seeria on täpne (<c2/>).

# text
# c1: ephem_provider::KernelEphemeris
# c2: LunisolarSource
seg-e0b5ea7af969 = <b><c1/></b>: DE440 (või mis tahes tüübi 2 SPK) asendid läbi mootori enda lugeja, kahest osast koosnevate TDB epohhidega ja kerneli SHA-256 aruannete jaoks säilitatuna; see ei asenda kunagi planeeti süsteemi barütsentriga. <c2/> laseb geomeetriateel valida analüütilise seeria (vaikimisi) või kerneli.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: planetary_kernel_path
# c4: moon_ephemeris
seg-6c7dae98601e = <b>Valikuline kerneli Kuu liikidele <c1/> ja <c2/></b>: võti <c3/> loeb geotsentrilise Kuu keskpunkti kernelist; midagi muud ei muutu ja aruanne saab ploki <c4/>, mis nimetab kerneli ja selle SHA-256. Ilma võtmeta on mõlemad aruanded baitideni identsed varasemaga.

# text
# c1: tests/lunar_vlbi_surface_point_spice_oracle.rs
seg-74e8def84747 = <b>Kuu pinnapunkti kovariatsioon kerneliteel</b> (uus VALIDATED rida): kui iga jaam on fikseeritud ja majakas DE440 Kuul, ühtib majaka kovariatsioon SPICE valguse aja Jacobi maatriksiga (halvim { "1.7e-3" } { "1" } % läve vastu) ja NumPy pöördmaatriksiga ({ "4e-14" } { "1e-9" } vastu), eelregistreeritud 4a51256 (<c1/>). Analüütilise tee rida jääb MODELLED: analüütilisel Kuul on selle väikseim majaka sigma { "3.9" } % sõltumatu etaloni omast madalam.

# text
# c1: tests/validate_llr_datum_kernel_moon_fresh.rs
seg-55002d236ab0 = <b>Kuu tugisüsteemi datum päris kampaaniast, kerneli Kuu keskpunkt</b> (uus VALIDATED rida): { "447" } nägemata 2019-Q2 normaalpunktil, eelregistreeritud 830d945a enne ühegi toomist, ühtib datumi kovariatsioon kerneliteel muutumatu SPICE ja NumPy sõltumatu etaloniga { "7.6e-5" } piires { "1" } % ja { "2" } % läve vastu (<c1/>). Asutaja otsustas, et see rida edutatakse ainult värskete punktide põhjal; nähtud andmete diagnostika (c51f8b2) on tähelepanek, mitte tõend. Lävi ei eralda Kuu mudeleid: ka analüütiline Kuu läbib sama lõigu (halvim { "3.8e-3" }), kavandatud mutatsiooni (kerneli Kuu tund hiljem) ei tuvastatud ja voltimisel läbis ka umbes { "4,650" } km vale Kuu keskpunkt (Kuu võetud ümber Maa-Kuu barütsentri). Rida väidab kovariatsiooni sellel teel, mitte Kuu keskpunkti, ja ütleb seda.

# text
# c1: KernelEphemeris::relative_position_utc
# c2: tests/kernel_ephemeris_skyfield_oracle.rs
seg-f147f9257b8b = <b>Päikese, Kuu, Merkuuri ja Veenuse asendid DE440-st UTC epohhidel</b> (uus VALIDATED rida): <c1/> ühtib Skyfield { "1.54" } omaga { "600" } asendil aastate { "1973" } ja { "2026" } vahel, halvim { "2.96" } m, eelregistreeritud läve (0bfafe6d) piires, mille seab kahe liikmega TDB − TT seeria (<c2/>). Planeetide asendid saavad selle uue kerneli rea nüüd; Standishi rida ja planeetide kaaslaste rida on muutumatud ning kaaslased ootavad stsenaariumi, mis neid vajab (asutaja otsus).

# text
# c1: tests/validate_llr_datum_kernel_moon.rs
seg-bb840641c655 = Tähelepanekud: LLR datumi võrdluse ainus möödalask (z-nihke sigma { "1.025" } % { "1" } % vastu) langeb väärtusele { "0.049" } %, kui ainult Kuu keskpunkt loetakse DE440-st, nähtud andmetel (<c1/>); värskel { "2019" } lõigul läbib ka analüütiline Kuu, nii et { "2015" } möödalask oli selle kvartali geomeetria suhtes marginaalne. Analüütilised read „Lunar frame datum from a REAL observing campaign“ ja „Lunar-surface-point coordinate covariance … kept distinct from the Earth-station one“ jäävad MODELLED; nende sõltumatu etaloni tekstid osutavad nüüd kerneliitee ridadele.

# text
# c1: lunar_ephemeris
seg-64c9f3b96392 = <c1/> ei ütle enam, et mootoril pole binaarkerneli lugejat; see osutab lugeja reale ja selgitab, miks kosmoseaparaadi kernelid (tüübid { "13" } ja { "21" }) tulevad endiselt Horizonsi kaudu.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: lunar-vlbi-fim
seg-841deceb80e6 = Uuendused: puuduvad. Ükski golden-fail, avaldatud joonis ega olemasolev testiväärtus ei muutu; analüütilised aruanded <c1/>, <c2/> ja kõigi jaamade fikseeritud <c3/> on baitideni identsed varasemaga (tulemuse SHA-256 prefiksid 9927aac2, cf1d2671, 25c357e4).

# text
seg-95b8207466a3 = D9, mõõdetud kellateek „Clock Atlas“ (kolm uut rida, üks VALIDATED: { "232" } -> { "235" } rida, { "116" } -> { "117" } valideeritud).

# text
# c1: clock_library
# c2: realdata::clk
# c3: utck_bound
seg-1f8644486f5d = <b>Mõõdetud kellateek (<c1/>).</b> Seadmekaardid (valge faas, valge, flicker ja juhusliku kõnni sageduse modulatsioon, lineaarne sageduse triiv ja valikuliselt ühe- kuni neljakordsed pöördekohased faasiliikmed), sobitatud nimetatud mõõdetud kella kirjele ja hinnatud väljajäetud andmetel; lünki arvestavad Alani ja Hadamardi dispersioonid; konditsioneerimisdetektor, mis logib iga lünga, faasi kõrvalekalde, faasihüppe, purske ja sagedushüppe ning ei tea midagi faili- ega päevapiiridest; kaardi teisendus ajapilu müramudeliks, laiendatud Kalmani kellamudeliks ja spuufimismonitori müratasemeteks. Lugejad RINEX- ja IGS-i kellafailidele, BIPM-i laborikaupa failidele ja Circular T jaotisele { "1" } (<c2/>); koondatud hierarhiline vananemise ülempiir UTC(k) jaoks (<c3/>, veel hindamata).

# text
# c1: allan::lag1_noise_id
# c2: autocorr_noise_id
# c3: tests/clock_library_lag1_noise_id_allantools.rs
seg-93add052ae56 = <b>Viivituse 1 autokorrelatsiooni müra tuvastamine</b> (<c1/>, Riley ja Greenhall { "2004" }), uus VALIDATED rida (Teek): ühtib allantools { "2024.6" } <c2/> omaga { "140" } juhul, täisarvud identsed, halvim erinevus { "9.6e-13" } { "1e-9" } läve vastu (eelregistreeritud 2ec76864; <c3/>).

# text
# c1: tests/clock_library_device_cards_oracle.rs
# c2: tests/clock_library_f9p_cards_oracle.rs
seg-1fcea6ee6136 = <b>Mõõdetud seadmekaardid väljajäetud andmete ennustusega</b>, uus MODELLED rida (tähelepanek): sobitus ühele kolmandikule, ennustatakse ülejäänud kahe kolmandiku Alani hälve teguri { "1.5" } piires (eelregistreeritud 2ec76864). GPS Block IIF värskel IGS aknal (2026-03-01 kuni { "14" }): { "10" } { "11" }-st; G27 on kahetunnisel skaalal optimistlik (halvim tegur { "1.510" }). Tseesium (piires, { "1.070" }), OCXO (väljaspool, { "2.348" }) ja strontsium (piires) on teatatud, mitte pimedad. JammerTesti vastuvõtja kaart ning Galileo maseri ja Deep Space Atomic Clocki kaardid on blokeeritud. ZED-F9P vastuvõtja TCXO mudeliklass { "12" } staatilisel Wroclawi jaamal (Zenodo { "6488497" }) ebaõnnestub: { "1" } { "11" } pimedast jaamast avalikustatud parandatud kordusel (<c1/>, <c2/>).

# text
# c1: tests/clock_library_periodic_cards_oracle.rs
seg-26fa898f6272 = <b>GPS Block IIF kaardid pöördekohaste liikmetega</b>, uus MODELLED rida (tähelepanek): teisel värskel aknal (2026-04-01 kuni { "14" }) { "9" } { "11" }-st läve piires; G03 ({ "1.947" }) ja G25 ({ "1.581" }) on optimistlikud, kuna nende väljajäetud kirjed on müras kui nende sobitusosad; perioodiliste liikmete väljajätmine ebaõnnestub kõigil { "11" } (eelregistreeritud fb475550; <c1/>).

# text
# c1: tests/clock_state_ext_igs_conditioned_oracle.rs
seg-ef456da29319 = <b>M002, pardakella oleku hindamine, voor { "3" }</b> (tähelepanek, jääb MODELLED): pärast külmutatud konditsioneerimisdetektorit täidab vooru 2 laiendatud filter, häälestus ja kriteeriumid muutumatuna kriteeriumid (a) ja (c) esimest korda kõigil { "11" } satelliidil; (b) ebaõnnestub G09 ({ "0.894" }) ja G26 ({ "0.876" }) puhul (eelregistreeritud fb475550; <c1/>).

# text
# c1: tests/clock_library_tcxo_card_jammertest_oracle.rs
seg-0014b2629fd2 = <b>M010, spuufimise tuvastamine, voorud { "3" } kuni 4b</b> (jääb MODELLED): voor { "3" } blokeeritud ({ "167" } treeningepohhi JammerTesti seadme teistest sessioonidest { "3600" } vastu); ZED-F9P mudeliklassi kaardiga (voorud { "4" } ja 4b) tõstab kellamonitor nullist valehäiret enne algust kõigil { "10" } logitud algustel (voor { "2" }: { "86" }) ja { "6" } { "10" } algusest tuvastatakse { "10" } s jooksul (voor { "2" }: { "4" }); samad neli jäävad hiljaks (<c1/>).

# text
# c1: tests/utck_bound_prospective_oracle.rs
seg-79757abc69e3 = <b>M083, UTC(k) ülempiir, voor { "3" }</b>: eelregistreeritud prospektiivselt (fb475550) Circular T väljaannetel alates { "465" }, veel käitamata (<c1/>).

# text
# c1: $KSHANA_ORACLES/data/wroclaw_f9p
seg-09abf996ed16 = Sõltumatu etaloni keskkond: Wroclawi ZED-F9P kirje on andmevärava taga kataloogis <c1/> (CC BY { "4.0" }, umbes { "1.5" } GB); IGS kellafikstuurid on kaasatud (IGS tooted, viitega).

# text
seg-b05fa0811a3e = Uuendused: puuduvad. Ükski golden-fail, avaldatud joonis ega olemasolev testiväärtus ei muutu; M001 (holdover-i uuesti ankurdamine) ei rakendu, kuna ühtki kellaklassi ei edutatud.

# text
seg-986f4075210b = D8, üks valideeritud levi-, tugisüsteemi- ja ajatee (kolm uut VALIDATED rida ja M131 edutatud: { "235" } -> { "238" } rida, valideeritud { "117" } -> { "121" }).

# text
seg-d7a612528765 = Maa orbiidi liigid, mis kandsid oma kahe keha, sekulaarse J2 või ainult sideeraajaga mudeleid, jagavad nüüd ühte teed: SGP4/SDP4 elemendikomplektid kahest osast koosnevate Juliuse kuupäevadega, viidud GCRS-i ja ITRS-i (International Terrestrial Reference System) IAU (Rahvusvaheline Astronoomia Liit) 2006/2000A ahela kaudu, valikuliste Maa orientatsiooniparameetritega.

# text
# c1: sgp4::MeanElementSet
# c2: sgp4::SgpOrbit
# c3: sgp4::Eop
# c4: sgp4::teme_to_itrs_matrix[_eop]
# c5: sgp4::gcrs_to_itrs_matrix[_eop]
# c6: Sgp4::new_at
# c7: Sgp4::propagate_at
# c8: jd2::Jd2::from_utc_calendar
# c9: dtf2d
# c10: jd2::utc_to_tai
# c11: tai_to_utc
# c12: utc_to_ut1
# c13: utcut1
# c14: tai_to_tt
# c15: jd2::earth_rotation_angle
seg-016507ccdb8f = Uued <c1/>, <c2/>, <c3/>, <c4/> ja <c5/>; <c6/> ja <c7/> võtavad kahest osast koosnevaid epohhe. Uued <c8/> (SOFA <c9/> konventsioon liigsekundi päevade jaoks), <c10/>, <c11/>, <c12/> (läbi TAI, nagu SOFA <c13/>), <c14/> ja kahe osaga <c15/>.

# text
# c1: leo-pvt
# c2: leo_fusion::polar::latitude_sweep_at
seg-158c39fff817 = Liigi <c1/> polaarrežiim levib SGP4-ga ajahetkel 2026-01-01T00:{ "00" }:{ "00" } UTC IAU ahelal (<c2/> võtab mis tahes epohhi); SGP4 Walkeri generaator pöörab Maaga seotud tugisüsteemi IAU ahela kaudu.

# text
# c1: passes
# c2: passes::predict_passes_apparent
# c3: apparent_look_angles
# c4: refraction
# c5: light_time
# c6: ut1_minus_utc_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: passes::predict_passes
seg-86ecad91a601 = Liik <c1/> käitab uut näiva läbimise ennustajat (<c2/>, <c3/>): SGP4 IAU ahelal, ITU-R P.834-9 murdumine ja allalingi valguse aeg (uued lülitid <c4/> ja <c5/>, vaikimisi sees), Maa orientatsiooniparameetrid (<c6/>, <c7/>, <c8/>, vaikimisi { "0" }), ületused lahendatud { "1e-7" } s täpsusega ja kulminatsioon kuldlõike otsinguga. Geomeetriline <c9/> on muutumatu.

# text
# c1: tests/no_private_models.rs
seg-9ce091899bf1 = <c1/> hoiab paketi geomeetria-, aja- ja levituumad vabana privaatsest Kepleri levist, sekulaarsetest J2 kiirustest või ainult sideeraajaga pöördest; nimetatud kiired tasemed ja füüsika, mis on rea teema, on põhjendatud erandid.

# text
# c1: dtf2d
# c2: utctai
# c3: taiutc
seg-cf4ae964c5d1 = Uus VALIDATED rida „Two-part Julian dates and leap seconds on the Earth-orbit time path“: pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> { "224" } ajahetkel ümber kõigi { "27" } liigsekundi { "1e-6" } s piires (eelregistreeritud e947e69d); halvim { "1.9e-11" } s.

# text
# c1: c2t06a
# c2: pnm06a
# c3: ee06a
seg-c0dec16ea932 = Uus VALIDATED rida „One Earth-orbit path“: { "232" } elemendikomplekti TEME asendid python-sgp4 { "2.24" } (Vallado etalon SGP4) vastu { "6.1e-8" } m piires (lävi { "1" } cm) ning GCRS -> ITRS ja TEME -> ITRS pöörded ERFA <c1/>, <c2/> ja <c3/> vastu { "2.9e-6" } mas ja { "0.41" } mas piires (läved { "0.1" } ja { "2" } mas), Maa orientatsiooniparameetritega (eelregistreeritud 72ea9eb0). Avalikustatud: esimene käitus ebaõnnestus ajahetkel 2016-12-31T23:{ "59" }:{ "59.5" } ühe pöördesekundi võrra; UT1 võeti UTC kvaasi-Juliuse kuupäevast liigsekundi päeval, mootor läheb nüüd läbi TAI ja teine käitus ühtib muutumatute lävedega.

# text
seg-a72ccdc2516e = M131 „LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS“ muutub VALIDATED: Orekit { "13.1.8" } võtab mootori GCRS olekud, pöörab need ja arvutab nähtavuse ning DOP-i (NumPy mitme kellaga rühmade jaoks); asendid { "6.8e-5" } m piires (lävi { "0.2" } m), vaates olevate arv identne 4040/4040 valimil, mediaan DOP { "2.3e-11" } suhtelise piires.

# text
seg-db498ac8e135 = Uus VALIDATED rida „Apparent ground-station pass prediction with refraction and light time“: Orekit { "13.1.8" } levitab samu elemendikomplekte TEME-s, mille see ehitab öeldud definitsiooni järgi, ITU-R P.834 murdumise ja selle valguse aja mõõtemudeliga, { "60" } juhu üle merepinna jaamades: { "1210" } läbimist, ületused { "3.4e-6" } s piires (lävi { "5" } ms), maksimaalne tõusunurk { "5.5e-7" } kraadi piires, näiv suund { "8.8e-7" } kraadi piires (lävi { "1e-4" } kraadi).

# text
seg-ab87bb0ee63d = Tähelepanekud, hoitud kinnitatuna: esimesed täisväite võrdlused Orekitiga otsast lõpuni jätsid oma asendi- ja suunalävedest mööda, mitte mootori tõttu, vaid seetõttu, et Orekit { "13.1.8" } SDP4 erineb etalon-SGP4-st ringikujuliste (e = { "0" }) sügavkosmose orbiitide puhul (kuni { "67" } m) ja selle vaike-TEME on ehitatud IERS { "1996" } (IAU { "1980" }) nutatsioonile, umbes { "72" } millikaaresekundit IAU 2006/2000A ahelast ({ "2.7" } m LEO-l). Orekiti ITU-R P.834 koefitsient h*theta0^{ "2" } on { "0.011380" }, kus soovitus trükib { "0.01380" }; võrdlus on merepinnal, kus liige kaob, ja erinevus selle kohal on kinnitatud.

# text
# c1: passes::predict_passes
# c2: passes
seg-49978e6a73b2 = „Ground-station pass prediction (ground segment)“ jääb VALIDATED, selle väide kitsendatud geomeetrilisele <c1/>; liik <c2/> kuulub uuele reale.

# text
# c1: xval/d8-orekit13/setup.sh
seg-60d6ac0011f1 = Sõltumatu etaloni keskkond: Orekit { "13.1.8" } koos Hipparchusega { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

# text
# c1: scenarios/passes.toml
# c2: passes
# c3: docs/examples/multi-tool-pipeline.md
# c4: passes
# c5: docs/CAPABILITY.md
# c6: polar-arctic-leo-coverage
seg-532e10ead5a2 = Uuendused: kaasapakitud <c1/> kogupääs { "1675" } s -> { "1659" } s (viis läbimist nagu varem; parim maksimaalne tõusunurk { "73.25" } kraadi -> { "70.08" } kraadi) ja iga <c2/> väljund nihkub uue teega (trükitud rida failis <c3/> ja kirje <c4/> failis <c5/> ütlevad seda nüüd); kaasapakitud <c6/> GNSS VDOP ekvaatoril { "1.19669" } -> { "1.19710" }, { "89.9" } kraadi juures { "1.50645" } -> { "1.50590" }, liidetud VDOP { "89.9" } kraadi juures { "1.14388" } -> { "1.14250" } (avaldatud kahe kümnendkohaga arvud { "1.20" }, { "1.51" } ja { "1.14" } on muutumatud). Ükski golden-fail ei muutu.

# text
# c1: leo_pass
# c2: leo-pvt
# c3: leo_navmsg
# c4: leo_link::geometry
# c5: leo_fusion::geom
# c6: constellation-design
seg-b65f3186a7e9 = Veel suunamata: <c1/>, doppleri-, ühis- ja ajastusrežiimid <c2/> ning <c3/> tõeline orbiit (nende mudelid asuvad failides <c4/> ja <c5/>), ja Maa kujundused liigis <c6/> (nimetatud kahe keha kiire tase).

# text
seg-03f638f20376 = D6, LunaNet AFS etalongeneraator, LSIS V1.0 (neli uut rida, kaks VALIDATED: { "238" } -> { "242" } rida, valideeritud { "121" } -> { "123" }).

# text
# c1: lunar_afs
# c2: xval/lunar-afs/fetch_lsis.sh
# c3: lunar_afs::lsis
seg-1d09f0582781 = <b>LunaNet Augmented Forward Signal (AFS) etalongeneraator</b> (<c1/>), kinnitatud LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 kuupäevaga { "29" }. jaanuar { "2025" } ja nimetades seda versiooni igas väljundis: { "2492.028" } MHz kandja; AFS-I BPSK({ "1" }) andmekanal { "500" } sümbolit sekundis oma 2046-chipise Goldi koodiga; AFS-Q BPSK({ "5" }) piloot oma 10230-chipise Weili primaar-, 4-chipise sekundaar- ja 1500-chipise tertsiaarkoodiga; kaadri identifikaatori { "0" } kaader (sünkroniseerimismuster, BCH ({ "51" }, { "8" }) alamkaader { "1" }, CRC-24, kiirusega üks pool LDPC alamkaadrid { "2" } kuni { "4" }, { "60" } korda { "98" } ploki põimur) täieliku alamkaadri 1 dekoodri ja min-sum LDPC dekoodriga, mis on kirjutatud ainult pariteedikontrolli maatriksist; ning baasriba IQ süntees tõesiltidega, kirjutatud SigMF salvestusena. Koodid genereeritakse standardi nihkeregistritest ja Legendre'i/Weili konstruktsioonidest. Midagi standardist kopeeritut ei levitata (sellel pole taaskasutustingimusi): AFS-Q primaarindeksid tulevad dokumendist IS-GPS-800J ja see, mida defineerivad ainult standardi lisad (AFS-I G2 viivitused, tertsiaarkoodid, LDPC alammaatriksid), loetakse käitamise ajal kohalikust vahemälust, mille <c2/> täidab NASA majutatud PDF-ist, iga fail kontrollitud kinnitatud SHA-256 vastu (<c3/>). Mudel on standardi järgimise võrdlusalus, mitte kanali-, leviku- ega lingieelarve mudel.

# text
# c1: sigmf::meta_to_json_with_extensions
# c2: sigmf::annotation_extension_fields
# c3: core:extensions
seg-7b8cb0461377 = <c1/> ja <c2/>: salvestus võib kanda nimeruumiga laiendusvälju, mis on deklareeritud väljal <c3/>.

# text
seg-a9465820a1fc = Uus VALIDATED rida „LunaNet AFS baseband rendering against an independent generator, given its channel state“: LANS-AFS-SIM-i (BSD-2-Clause, commit 480c6bf3, S-riba ehitus) vastu null chipi mittevastavust PRN-ide { "1" } kuni { "210" } koodidel, null sümboli mittevastavust käituse kolmel kaadril ja normaliseeritud kompleksne korrelatsioon { "0.999990" } oma { "23.9" } s valimite üle (halvim { "2" } ms plokk { "0.999948" }), enne võrdlust fikseeritud läve piires (eelregistreeritud 986ac280). See juhib renderdajat simulaatori enda kanali olekuga ega kata võimsuse jaotust kandja ja müra tiheduse põhjal ega SigMF-i ja 8-bitist kirjutamist.

# text
seg-07edced2764a = Uus VALIDATED rida „LunaNet AFS frame channel coding, FID { "0" }“: 6000-sümbolised kaadrid on LANS-AFS-SIM-i omadega sümbol sümboli haaval võrdsed (eelregistreeritud 986ac280); alamkaadri 1 kood reprodutseerib LSIS joonise { "8" } töötatud näite ja CRC-24 CRC-24/LTE-A kataloogi kontrollväärtuse.

# text
# c1: xval/lunar-afs/fetch_lsis.sh
seg-ab94ac9f41fc = Mõlemad edutatud read on LSIS vahemälu taga andmeväravaga: nende sõltumatu etaloni test jäetakse teatega vahele, kuni <c1/> on käitatud.

# text
seg-89a4bc4a766e = Tähelepanek (uus MODELLED rida), „LunaNet AFS spreading-code generation“: standardi tabelitega ja lisa { "3" } failidega võrreldud { "2 937 232" } genereeritud chipist ja bitist erineb üks, „last { "24" } chips“, mille Tabel E-5 trükib tertsiaar-PRN { "147" } jaoks ja mis dubleerib PRN { "151" } lahtri, samas kui standardi enda lisa { "3" } fail ühtib generaatoriga. Nullmittevastavuse kriteerium jääb täitmata.

# text
seg-d4e76301323f = Tähelepanek (uus MODELLED rida), „LunaNet AFS closed-loop decodability“: kolm eelregistreeritud käitust PocketSDR-AFS-i vastu; kolmas täitis oma jälgimis- ja dekodeerimisläved täielikult, kuid mitte oma kaitset, et ainult trükkiv vastuvõtja ehitus reprodutseerib kinnitatud ehituse logi, kuna kaks muutmata vastuvõtja käitust erinevad juba oma hõivamiskirjetes.

# text
# c1: lunar_service
# c2: export_antenna.carrier_hz
# c3: lunar_jamming
# c4: attack_surface
seg-93cfa05a1923 = Parandatud: liikide <c1/> (<c2/>), <c3/> ja <c4/> vaikekandja oli ümardatud { "2.4" } GHz; see on nüüd LSIS-020 AFS kandja, { "2492.028" } MHz. Vana vaikeväärtuse korral oli vaba ruumi kadu alahinnatud { "0.327" } dB võrra.

# text
seg-ed7c170ccc2c = Uuendused: puuduvad. Iga kaasapakitud stsenaarium nimetab oma kandja ja kõigi { "138" } stsenaariumifaili tulemused on baitideni identsed eelmise main-iga.

# text
seg-3ec7f5b17122 = D7, päris Kuu IQ ja GPS LNAV (seitse uut rida, ükski pole VALIDATED: { "242" } -> { "249" } rida, valideeritud { "123" } muutumatu).

# text
# c1: portable_math::FftPlan
# c2: xval/portable-fft-wasm/
seg-0c3dcf4f2b0f = <c1/>: segabaasiline kiire Fourier' teisendus (FFT), mille väljund on igal platvormil samad bitid; 8000- ja 24000-punktiliste teisenduste SHA-256 kinnitus läbib x86_64 ja wasm32-wasip1 peal (käitaja kataloogis <c2/>).

# text
# c1: acquisition
# c2: pcps_acquire
# c3: pcps_grid
# c4: refine
# c5: prompt_series
seg-150d9809c584 = <c1/>: paralleelne koodifaasi otsing diskreetitud IQ-l (<c2/>, <c3/>) koherentse voltimisega, mittekoherentse akumuleerimisega, hii-ruut lävega kogu otsingu valehäire tõenäosuse jaoks ja lahtrite keskmistamise statistikuga ribapiiratud müra jaoks; <c4/>, <c5/> koodi Doppleriga ning M2M4 ja ruudustiku tipu kandja ja müra tiheduse (C/N0) hindajad.

# text
# c1: gps_lnav
seg-46bda8ecf2cd = <c1/>: IS-GPS-200 pärandnavigatsioonisõnumi (LNAV) kodeerija alamkaadritele { "1" } kuni { "3" }, tabeli 20-XIV pariteediga ja väljadekooderiga.

# text
# c1: realdata::ion_sdr
# c2: .sdrx
# c3: to_mid_rise
seg-43444792974c = <c1/>: ION GNSS SDR Metadata Standardi (<c2/>) lugeja ja selle näidisfailid, kahe täiendi tasemete jaoks <c3/>.

# text
# c1: realdata::lugre
# c2: .sdrx
seg-a7dfc3475923 = <c1/>: LuGRE (Lunar GNSS Receiver Experiment) IQS partii päis, RAW, ACQ ja NAV telemeetria ning CLK failid ja kontroll, mis loetleb, kus <c2/> metaandmed on binaarpäisega vastuolus.

# text
# c1: antenna::GainPattern2D
# c2: earth_gnss_lunar
# c3: transmit_side_db
seg-f0125531c4f8 = <c1/> ja moodulis <c2/> yaw-juhitav kerekoordinaatsüsteem, saate asimuut ja nadiirist kõrvalnurgad ning <c3/> suhtelise C/N0 jaoks mõõdetud mustritega.

# text
# c1: tests/gps_lnav_rtklib_integer_oracle.rs
seg-679aa02de1d0 = GPS LNAV navigatsioonisõnumi kodeerimine (uus rida, jääb MODELLED pärast integreerija järelkontrolli): { "2" }. märtsi { "2025" } IGS edastusfailil, mida parsis ja dekodeeris RTKLIB v2.4.2-p13, läbivad kõik { "960" } sõna pariteedi, kõik { "96" } alamkaadrit dekodeeruvad ja kõik { "608" } edastatud täisarvu on võrdsed Kshana omadega (<c1/>), kuid eelregistreerimine (d4d9eb9d) jõudis avalikule harule kaks sekundit pärast tulemust sisaldavat commiti, nii et järjestust „registreeritud enne faili toomist“ ei saa näidata ja rida ei edutata.

# text
# c1: realdata::ion_sdr
# c2: SdrLayout::fill_lsb_first
seg-2875ba2d8f5f = <c1/> täidab sõnu kõrgeimast bitist (I LuGRE baidi kõrges poolbaidis; varasem lugemine andis konjugeeritud signaali), säilitab vana lugemise kujul <c2/> ja loeb sõnast laiemaid valimeid.

# text
# c1: acquisition::refine_doppler_coherent
seg-f6e0e3b9b166 = <c1/>: faasikoherentne Doppleri täpsustus ({ "0.2" } Hz RMS sagedusel { "30" } dB-Hz { "200" } ms jooksul simulatsioonis).

# text
seg-b0f6a61acce0 = GPS L1 C/A gps-sdr-simi vastu: chipid ja pariteet bitthaaval täpsed; { "230" } { "1152" } LNAV väljast erineb ühe ühiku võrra, kuna gps-sdr-sim kärbib seal, kus edastatud täisarv vajab ümardamist.

# text
seg-1c525ca495c0 = RTKLIB-i dekodeeritud LNAV: kogu pariteet ja alamkaadrid läbivad ning iga parameeter on poole kvandi piires; { "41" } skaleeritud väärtust erineb mõne ühiku võrra viimases kohas RTKLIB-i kümnendkonstandi { "2" }^-43 kaudu, üle registreeritud läve.

# text
seg-14e26e69777b = LuGRE hõivamine GNSS-SDR { "0.0.19" } vastu: { "266" } { "266" } otsust ühtib, { "250" } asusid samas lahtris; enamik positiivseid on artefaktid −{ "0.5" } keskmisest paljastes 4-bitistes tasemetes; C/N0 harul polnud samaaegseid lennuandmeid. Kaks partiid (OP5, OP12) jäeti eksikombel välja: nende metaandmed ühtivad nende päistega, kuid lugeja ei suutnud siis lugeda sõnast laiemat valimit.

# text
seg-3a32ff9d66fc = LuGRE hõivamine orbiidilt ennustatud Doppleri vastu: valimivõimsuse otsusega ületab iga otsing ribapiiratud müral; lahtrite keskmistamise otsusega ühtivad tugevaimad paarid suuruselt vastupidise märgiga, näidates, et registreeritud I/Q järjekord on andmete konjugaat.

# text
seg-2bb618ba4059 = Pime hõivamine Kuu pinna partiidel: neli partiid hõivavad igaüks ühe satelliidi (ennustatud nähtav, valehäiret pole väärtusel { "1e-7" }), ükski kahte, nii et Doppleri erinevuse lävel pole paari, mida hinnata.

# text
seg-f95606e17fd1 = Suhteline C/N0 Kuu kaugusel (M039 uuesti sõnastatud): { "15" } Block IIR/IIR-M kirjet ja üks paar, liiga vähe registreeritud läve jaoks.

# text
seg-9306cf44fc44 = Uuendused: puuduvad; ükski avaldatud arv, golden-fail ega dokumendijoonis ei muutunud.

# text
seg-2a3cb68c94d6 = M039 rida „Earth-GNSS at lunar distance“ sõnastab oma väite Kuu kaugusel uuesti suhtelise C/N0 kujul satelliitide vahel ühel epohhil pluss nähtavus (absoluutset C/N0 ei väideta); see jääb MODELLED. Ülataseme NOTICE kannab LuGRE CC BY { "4.0" } viidet.

# text
seg-e1e4094a186a = DE440 Kuu peatelgede orientatsioon interpoleeritakse nüüd geodeesiajoonel päevasõlmede vahel. Varasem elementhaaval interpolatsioon oli vigane kuni { "2.0e-4" } rad ({ "340" } m Kuu pinnal) iga päeva veerandpunktide lähedal, mitte „umbes { "14" } m“, nagu rida väitis. Selle kasutajad (Kuu laserkaugusmõõtmise geomeetria, Kuu datum, Kuu vea jälgitavus) saavad parandatud orientatsiooni.

# text
# c1: snapshot_raim
seg-a2071d345923 = Vooru { "2" } mootoriparandused, igaüks uuesti käitatud oma muutumatu eelregistreeritud tolerantsi vastu: EOP rea IERS-i vintage loetakse selle I/P lippudest, mitte tühjast Bulletin B plokist; <c1/> kasutab geodeetilist kohalikku taset; Kuu kiirustugisüsteemi sidumine kasutab ekvatoriaalraadiust, J2 ja pöörlemist; liu22 sobitus algab nullparandustest ilma prioriteetideta ja kasutab artikli keskmise liikumise kiirust; EO sõlmede vahe kannab J2 sõlme regressiooni; Costase tsükli libisemise aeg kasutab rho/4; ühine lahend rakendab paari edastatud rühmaviivitust; Kuu ühine lahend kasutab QR sammu; NTN piir hinnatakse tõelises asendis; konstellatsiooni kujunduse kella etalon on vaates olev madalaim konstellatsioon; DE440 orientatsiooniseeria hõlmab 2014-2030 ja annab väljaspool seda vea piiramise asemel.

# text
# c1: leo_navmsg::truth::TruthOrbit::from_ecef_states
seg-74f397ad9c16 = <c1/>, tabuleeritud Maaga seotud olekutest ehitatud tõeline orbiit, mida kasutab päris orbiidi sobitaja võrdlus.

# text
# c1: NOTICE.md
seg-7293b717d978 = Ülaltoodud võrdluste testifailid ja fikstuurid, igaüks oma generaatori ja failiga <c1/>, mis annab allika, litsentsi, toomise kuupäeva ja SHA-256.

# text
# c1: araim_reference::add_v42_protection_levels
# c2: _ecef
# c3: raim::snapshot_raim_fde
# c4: cw_dynamics::second_order_correction
# c5: propagate_second_order
# c6: inertial::coast::ErrorDynamics
# c7: lunar_vlbi::KernelGeometry
# c8: lunar-vlbi
# c9: naif_kernel
# c10: lunar_llr_geometry::llr_bcrs_one_way_m
# c11: solar_system::link_on
# c12: launch::site_rotation_speed_at
# c13: eo_payload::j2_nodal_period
# c14: ground_track_spacing_equator_j2
# c15: batch_ls::gauss_newton_qr
# c16: precise_products
seg-920fe965bda9 = Voor { "2" }: <c1/> ja <c2/> (ADD v4.2 veatuvastus, järgides Stanfordi MAAST-i ARAIM { "2" } jaoks, BSD-3 teade lähtekoodis); <c3/>; <c4/> ja <c5/>; üheksa oleku INS-i veamudel <c6/>; <c7/> osatuletised ja kerneliitee sisendid liigis <c8/>; <c9/>, SPK tüübi { "2" } ja binaarsete PCK kerneli lugeja; <c10/> ITRF2020 jaamadega; Jacchia { "1971" } tihedus; <c11/> mis tahes efemeriidipakkuja kohal; <c12/>; <c13/> ja <c14/>; <c15/>; <c16/> (RINEX kell, ANTEX ja DCB lugejad).

# text
seg-e3336e670d51 = Paranduslik väljalase versioonil { "0.29.2" }. Kshana Studio on ümber ehitatud kahe vaate ümber: Lihtne vaade, mis vastab esimesena ja selgitab lihtsate sõnadega, ning Täpsem vaade kogu töölauaga. Kaasas on kaks väikest parandust saidil kshana.dev. Mootor ei muutu: iga komplekti kuuluv stsenaarium annab versiooniga { "0.29.2" } baidi-baidilt identse tulemuse, välja arvatud versioonitempel.

# text
seg-c40ab967ace6 = <b>Kshana Studios on Lihtne vaade.</b> Studio avaneb just sellel.

# text
seg-6a5ae001d00e = Vastus tuleb esimesena: stsenaarium avaneb oma tulemusega, mis on öeldud ühe selge lausega. Igal komplekti kuuluval stsenaariumil on oma lause, mis on kirjutatud selle järgi, mida see stsenaarium mõõdab.

# text
seg-375421534e4c = Nähtaval on kuni viis seadet, need, mis vastust enim muudavad. Ülejäänud on jaotises „Täpsemad seaded“, mis on kokku volditud, kuni selle avada.

# text
seg-d8650ae64549 = „Kuidas see arvutatakse“ selgitab meetodit mõne reaga ning „Teadlastele“ annab mootori enda arvud, stsenaariumi faili ja tulemuse taga oleva tõendi.

# text
seg-36af7640e6ad = <b>Kogu töölaud on Täpsem vaade.</b> Kõik varasema Studio paneelid, diagrammid, ekspordid ja aruanded on seal.

# text
# c1: view=advanced
seg-0428d0a7921b = <b>Lüliti liigub kahe vaate vahel ja hoiab koha.</b> Stsenaarium, vaade, milles viibiti, ja kõik muudetud seaded kanduvad üle. Studio jätab meelde, millist vaadet viimati kasutati. Saidilt ja dokumentatsioonist pärinevad lingid avavad Lihtsa vaate; link, milles on <c1/>, avab Täpsema vaate, ja iga varasem Studio link avab endiselt sama stsenaariumi ja vaate.

# text
seg-2c98ed084c10 = <b>Kiirem esimene vaade aeglase ühenduse korral.</b> Stsenaariumi salvestatud vastus joonistatakse enne ülejäänud Studio laadimist, nii et aeglase mobiiliühenduse korral ilmub vastus umbes kahe sekundiga, mitte umbes üheksaga.

# text
seg-2214d2dcfab4 = <b>Parem otsing.</b> Otsing loetleb nüüd esimesena stsenaariumid, mille valdkond või pealkiri vastab sõnadele, enne stsenaariumeid, mis mainivad neid ainult failinimes või tekstis.

# text
seg-aa8d43280c19 = <b>Avalehe gloobus ei lähe enam tühjaks, kui vähendatud liikumine on sisse lülitatud.</b> Kui süsteemi seade vähendatud liikumise jaoks oli sisse lülitatud, võis akna suuruse muutmine jätta tiitligloobuse tühjaks, kuni leht kerides liikus. Gloobus joonistatakse nüüd uuesti samas kaadris, kus suurus muutub.

# text
seg-da4b78816df1 = <b>Avalehe L-riba konsool selgitab oma tühja riba.</b> Stsenaariumis „Watch a jammer take the band“ jäi GPS L5 / Galileo E5a paneel terveks minutiks tumedaks, mis tundus rikkena. Selles stsenaariumis ei saada sellel ribal ükski segaja ja satelliidisignaalid on müratasemest allpool, nii et seal ei tõuse miski sellest kõrgemale. Vaikne silt ütleb seda nüüd igas paneeli lõigus, kus midagi pole müratasemest kõrgemal (L5 / E5a paneel ja L2C paneel enne, kui selle mürasegaja algab), koos iga riba C/N0 ja lukustusolekuga samast jooksust. See asetatakse ainult sinna, kus miski pole müratasemest kõrgemal, nii et see ei kata kunagi segaja energiat.

# text
seg-e353fdee7033 = Paranduslik väljalase versioonil { "0.29.1" }. See eemaldab dubleeritud koodi LEO navigatsioonisõnumi, liitmise ja spektri moodulitest, lisab saidile kshana.dev heleda teema, viib Kshana Studio omaenda aadressile, muudab saidi loetavaks otsingumootoritele ja tehisintellekti assistentidele, parandab mitu väikest asja Studios ning laseb npm-i väljalasetel avaldada ilma salvestatud märgita. Mootori väljund ei muutu: iga komplekti kuuluv stsenaarium annab versiooniga { "0.29.1" } baidi-baidilt identse tulemuse, välja arvatud versioonitempel.

# text
seg-e8bf0a4fdc35 = <b>Heleda teema saidile kshana.dev.</b> Iga lehte saab lugeda heleda või tumedana. Sait järgib lugeja süsteemiseadet ja sellel on selle muutmiseks lüliti.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: llms.txt
# c4: llms-full.txt
seg-8e7cabc14c40 = <b>Otsingumootorid ja tehisintellekti assistendid saavad saiti lugeda.</b> Igal lehel on nüüd oma pealkiri, kirjeldus, kanooniline aadress, sotsiaalkaardi märgendid ja schema.org struktureeritud andmed ning lihttekst lõikude jaoks, mille joonistab skript. Sait avaldab faili <c1/>, faili <c2/>, milles on iga lehe viimase muutmise kuupäev, ning failid <c3/> ja <c4/> (lühike ja täielik lihttekstijuhend tehisintellekti assistentidele) ja IndexNow võtme, et juurutus saaks otsingumootoritele teatada, mis muutus.

# text
# c1: NPM_TOKEN
# c2: docs/RELEASING.md
seg-804ba71be9ed = <b>npm-i väljalasked saab avaldada ilma salvestatud märgita.</b> npm-i töö käitab nüüd Node-i { "24" } ja npm-i { "11.5.1" } või uuemat, mis toetavad npm-i usaldusväärset avaldamist: npm vahetab väljalasketöö GitHubi identiteedi lühiealise mandaadi vastu. Saladus <c1/> töötab endiselt ja seda kasutatakse seni, kuni see on seatud, nii et midagi ei muutu enne, kui usaldusväärne avaldamine on npmjs.com-is paketi jaoks sisse lülitatud. Sammud on loetletud failis <c2/>.

# text
seg-81405e5a5e06 = <b>Avalehe pealkiri on gloobuse peal loetav.</b> Pealkirja ja selle teksti taga on nüüd pehme vari, mis tuhmistab animeeritud gloobuse orbiidijooned ja satelliidipunktid seal, kus need pealkirja ületavad.

# text
# c1: /playground/
seg-24b8363acc14 = <b>Kshana Studiol on oma aadress: <a1>https://kshana.dev/studio/</a1>.</b> Iga link saidil ja dokumentatsioonis viitab sinna. Vana aadress <c1/> töötab endiselt ja suunab uuele, säilitades lingis oleva stsenaariumi, vaate ja muud seaded.

# text
seg-12f223b986bd = <b>Studio parandused.</b> Mootori fail laaditakse alla üks kord kahe asemel. Allalaadimise ajal näitab Studio stsenaariumi salvestatud tulemust kohe, märgitud salvestatuks, tühja ekraani asemel. Telefonis on päis üks kompaktne rida. Põhinäitajad murduvad kaks rea kohta, nii et ükski ei jää ekraani servast välja. Väljade sildid kasutavad stsenaariumi enda sõnu, kõrval on välja nimi, ja otsing leiab väljad kummagi järgi.

# text
# c1: downsample_grid
# c2: navsignal::simpson
# c3: leo_link::geometry
# c4: leo_fusion::geom
# c5: scenarios/
seg-c130d8a4dc5e = <b>Vähem dubleeritud koodi.</b> LEO navigatsioonisõnumi ühikute tabel kirjutas samad kümme SISRE statistikaarida neljale sobitusekokkuvõttele. Nüüd kirjutab need üks kord makro. Kaks spektri koskdiagrammi jagavad ühte ajatelge, värviriba ja C/N0 riba paneeli. Põhivõrgu allvalimine taaskasutab funktsiooni <c1/> ja Simpsoni integraal taaskasutab funktsiooni <c2/>. LEO läbimise liigi kaks sisenemispunkti jagavad ühte häälestusetappi. Moodul <c3/> impordib vektoriabilised moodulist <c4/> neid kopeerimata. Täpsem aruanne impordib API aruande HTML-i paomääramise kopeerimata. Kõik { "139" } stsenaariumifaili kataloogis <c5/> käitati versioonil { "0.29.1" } ja sellel koodil ning iga väljundfail on baidi-baidilt identne.

# text
# c1: src/leo_navmsg/units.rs
# c2: src/leo_fusion/pvt_units.rs
# c3: PVT_UNITS
# c4: sonar-project.properties
# c5: tests/sonar_cpd_exclusions_are_justified.rs
seg-166b0435c96f = <b>Tabelitel leo-navmsg ja leo-pvt units on omad failid.</b> Need viidi välja moodulitest, mis sisaldavad ka loogikat, faili <c1/> ja faili <c2/>. <c3/> säilitab oma avaliku tee. Ainult need kaks tabelifaili liituvad deklaratiivsete kataloogide kopeerimise ja kleepimise tuvastamise erandite hulgas failis <c4/>, mida kontrollib <c5/>.

# text
# c1: event=push
seg-f8b372e08ef9 = <b>README CI märk näitab main-harusse tehtud push'ide tulemust.</b> Märk luges kõigi sündmuste jooksutusi main-haru peal, nii et see võis näidata „failing“, kui iga push'i jooksutus oli roheline; nüüd küsib see ainult push'ide jooksutusi (<c1/>).

# text
seg-7c41a482c7d8 = Paranduslik väljalase versioonil { "0.29.0" }: mõõdetud katvuse arv, projekti nimerida saidil kshana.dev, kiirem katvuse töö ja uuendatud README. Mootori väljund ei muutu: iga stsenaarium annab sama tulemuse kui versioonil { "0.29.0" }.

# text
seg-997490bd1696 = Avaldatud arvude parandused

# text
# c1: db796dd
# c2: 95.35 %
# c3: src/
# c4: b1d350d
# c5: tests/coverage_figure_doc_sync.rs
# c6: docs/COVERAGE.md
seg-ed4b071e4bd9 = <b>Ridade katvus: ~{ "96" } % → ~{ "95" } %.</b> Katvuse töö mõõtis uuesti välja antud koodi { "0.29.0" } (commit <c1/>, CI jooksutus { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } rida { "58,697" }-st kataloogis <c3/>. Avaldatud arv oli { "95.63" } % ({ "37,697" } rida { "39,419" }-st), mõõdetuna commit'il <c4/> enne versiooni { "0.28.0" }; see ümardus väärtuseks ~{ "96" } %. Uus arv ümardub väärtuseks ~{ "95" } %, nii et iga pind, mida <c5/> kinnitab, liigub koos: <c6/>, README märk, Evidence'i rida ja CI tabel, märgid crates.io-s, PyPI-s ja npm-is, tehniline aruanne ning saidi kshana.dev katvuse leht. Alampiir { "85" } % ei muutu.

# text
# c1: web/fonts/
# c2: web/fonts/FONTS.json
# c3: web/tools/fetch_third_party.py
# c4: text=
seg-577baa03af04 = <b>Nimerida saidil kshana.dev.</b> „Kshana · क्षण · the precise instant“ avab nüüd avalehe tiitli ja asub iga lehe jaluses kaubamärgi all. Sait kshana.dev ei tee endiselt ühtki päringut teisele hostile: devanagari kiri on isehostitud Noto Sans Devanagari alamhulk kolmest tähest sõnas क्षण ({ "1,692" } baiti, <c1/>, koos selle SIL Open Font License'i tekstiga ja selle SHA-256-ga failis <c2/>). <c3/> õppis salvestama Google Fontsi <c4/> alamhulka sisupõhise aadressiga failinime alla.

# text
# c1: /evidence#research
# c2: /docs/changelog
# c3: /
# c4: .html
# c5: ROADMAP.md
seg-35b5bc4ee466 = <b>Saidi lingid maanduvad sinna, kuhu nad osutavad, puhaste aadressidega.</b> Link jaotisele asetab selle jaotise nüüd päise alla, nii telefonis kui töölaual: Missions-sektori link avab selle sektori ja selle paneeli ülaosas; Capabilities'i ja Editions'i lingid hoiavad oma koha, kuni nende kohal olevad diagrammid joonistuvad; Editions ei lisa enam teist päise nihet; ja link dokumentatsioonilehe kokku volditud ossa avab selle. Iga leht on lingitud oma puhta aadressiga (<c1/>, <c2/>, <c3/> avalehe jaoks) ning kanoonilised lingid, saidikaart ja vanade aadresside ümbersuunamised nimetavad samu; aadressid <c4/> töötavad endiselt. Research'il on oma link päises Evidence'i ja Developers'i vahel ning jaluses. Dokumentatsioon ei näita enam teekaarti (<c5/> jääb hoidlasse): Project'i rühm on Changelog, Licensing, Security, Contributing, Governance ja Code of conduct ning Glossary viidi rühma Get started.

# text
seg-3da9f00f5ce6 = <b>Katvuse töö on kiirem.</b> Versioonil { "0.29.0" } kulus sellele { "143" } minutit tervisliku { "91" } vastu kuni

# text
# c1: tests/property.rs
# c2: determinism
# c3: advanced_report
# c4: animation
# c5: tests/support/corpus.rs
# c6: determinism
# c7: KSHANA_CORPUS_THREADS=1
seg-85d502773367 = Fuzzer <c1/>, eelmine põhjus, võttis neist { "4" }. Komplekti kuuluv korpus kasvas { "74" }-lt { "139" } stsenaariumini ja kolm testibinaari käisid kõik läbi ühe faili kaupa (<c2/> kaks korda, <c3/> ja <c4/> üks kord): kokku { "37" } minutit katvuse instrumenteerimisega, versioonil { "0.27.2" } oli see { "3" }. Nüüd jagavad need faili <c5/>, mis käitab stsenaariumipõhise töö igal tuumal ja annab tulemused tagasi sorteeritud järjekorras; iga stsenaarium ja iga väide jääb alles. arm64 sülearvutil, silumisehitus: <c6/> võtab { "143" } s { "14" } tuumal, versus { "612" } s käsuga <c7/> (vana järjestikune läbikäik).

# text
# c1: tools/capture_site_shots.mjs
# c2: tools/readme_shots.py
# c3: docs/assets/readme/site/SHOTS.json
seg-bb69dbadbc81 = <b>README, uuendatud.</b> See algab sama nimereaga kui sait; Studio ekraanipildid on uuesti tehtud Studiost { "0.29.1" }, uue pildiga Studiost telefonis ja selle alumise sammuribaga; uus riba „The site“ näitab saidi kshana.dev kolme lehte versiooni { "0.29.1" } ehitusest (<c1/>, koostanud <c2/> ja salvestatud faili <c3/>); katvuse arv on ~{ "95" } %; ja uurimistöö joonise alt-tekst, mis kordas arhitektuurijoonise oma, kirjeldab nüüd artikleid. Päisemärgid on väiksemad ja lühemad ({ "18" } px kõrged; „~{ "95" }%“, „83/223“, „quality“, „AGPL-3.0“, „zenodo.20528627“), nii et üksteist mahub kahele reale; iga link ja alt-tekst säilitab oma täieliku tähenduse.

# text
# c1: kshana-mcp
seg-f61ef3e16884 = <b>Konteineri kujutise töö saab { "90" } minutit.</b> Versioonil { "v0.29.0" } jõudis kujutise <c1/> emuleeritud linux/arm64 ehitus vanale 45-minutilisele piirile oma viimase crate'i kompileerimisel, nii et kujutis, MCP registri kirje ja kanali kontroll ei avaldatud. Piir on nüüd { "90" } minutit; kujutis ei muutu.

# text
# c1: src/ephem.rs
# c2: src/sgp4.rs
# c3: 0.323_273_64
# c4: 0.323_273_640
# c5: _64
# c6: _32
# c7: f64
# c8: f32
seg-1688bf9f0fec = <b>Kaheksa ujukomakonstanti ümber rühmitatud</b> failides <c1/> ja <c2/> (<c3/> → <c4/>): SonarQube Cloud luges viimase rühma <c5/> või <c6/> puuduvaks järelliiteks <c7/> või <c8/> (reegel S7454). Väärtused on samad arvud, nii et ükski tulemus ei muutu.

# text
seg-81fd160937db = Kaksteist uut stsenaariumi liiki ja kolm uut viisi jooksutust lugeda. Mootor katab nüüd raadiospektri, kogu päikesesüsteemi, mis tahes keha ümber olevad konstellatsioonid, kampaaniad, mis seovad stsenaariumid üheks missiooniks, ning positsioneerimise, navigatsiooni ja aja (PNT) madalalt Maa orbiidilt (LEO) signaalist asendilahenduseni. Iga jooksutuse saab kirjutada ka animatsiooniks, täielikuks aruandeks ja teiste tööriistade jaoks mõeldud koostalitlusfailide komplektiks.

# text
seg-118be64d7cb2 = Mootori ümber: ümber kujundatud kshana.dev (mitmeleheline sait ja uus Kshana Studio töölaud, mis käitab brauseris kõiki võimekusi), ümber kirjutatud README, neliteist tööriista Model Context Protocoli (MCP) serveris, brauseriehitus, mis annab samad arvud kui natiivne, ja avalik leht Kshana Pro jaoks.

# text
seg-ea31356bc17d = Stsenaariumifailid (pluss üks komplekti manifest)

# text
# c1: kshana example
seg-26654cd81de1 = { "138" }, millest { "132" } on komplekti kuuluvad käsu <c1/> jaoks

# text
seg-3d1a85e93e48 = millest MODELLED (öeldud mudel, kontrollitud sisemise kooskõla suhtes)

# text
seg-e77f9d273ee1 = millest PARTNER (vajab partneri riistvara või andmeid)

# text
seg-e94cd6b3561a = Kust kasv tuleb:

# text
seg-1759a8cce7d6 = Liigid

# text
seg-94de9433d99f = Stsenaariumifailid

# text
seg-03d7aea335dc = Maatriksi read (valideeritud + modelleeritud)

# text
seg-fdd674722717 = Spekter

# text
seg-59583fa40da3 = Päikesesüsteem ja positsioneerimine mis tahes keha ümber

# text
seg-fafa167623df = Mere-, maantee- ja raudteestsenaariumid

# text
seg-fc571c46e522 = Animatsioon, aruanded, koostalitluseksportid

# text
seg-2746e0d9f787 = LEO signaalikavandid ja mitmeribaline spekter

# text
seg-d40ec114d1f9 = LEO positsioneerimine, ajastus ja liitmine

# text
seg-0157f649e65b = LEO otsast lõpuni ahel

# text
seg-423283112128 = LEO vastupidavus, fookusvaldkonna ja lõppkasutaja stsenaariumid

# text
seg-395beca13299 = Lisatud kokku

# text
# c1: src/celeste_iod.rs
seg-ea9dc4093d8a = LEO võimekus on süsteemist sõltumatu: see töötab üldistel, öeldud parameetritel ega vaja nimetatud süsteemi. Nimetatud süsteemid on valikulised eelseaded, igaüks omas failis oma avaliku allikaga. Üks eelseade, Celeste IOD (orbiidil demonstratsioon), kasutab arve, mis esitati ESA NAVISP LEO-PNT töötoas, { "2026" } (ESA on Euroopa Kosmoseagentuur; NAVISP on selle navigatsiooni innovatsiooni ja toetuse programm); see asub ühes failis <c1/> koos oma viie ainult hoidlas oleva stsenaariumiga, nii et seda saab tagasi hoida ilma lähtekoodi muutmata, ja ühtki selle töötoa arvu ei korrata selles muutuste logis.

# text
# c1: ephemeris
seg-c36a5015c03c = <b>Enne uuendamist tuleb lugeda jaotist „Avaldatud arvude parandused“.</b> Üks mootori väljund muutub (stsenaariumi <c1/>-id inertsiaalsüsteemi veerud pärast märgiparandust nutatsioonimaatriksis) ja dokumentatsiooni audit parandas arve, mida varasemad dokumendid olid trükkinud.

# text
seg-7fe505d3232b = Olekud: <b>VALIDATED</b> tähendab kontrollitud sõltumatu välise sõltumatu etaloni vastu (avaldatud tabel, teise rühma tarkvara või mõõdetud andmed); <b>MODELLED</b> tähendab öeldud mudelit, mida on kontrollitud ainult sisemise kooskõla suhtes; <b>PARTNER</b> tähendab, et kontroll vajab partneri riistvara või andmeid.

# text
seg-ec7abb62f217 = 3GPP, 5G, NTN

# text
seg-c5eb2d160429 = 3rd Generation Partnership Project (kolmanda põlvkonna partnerlusprojekt); viienda põlvkonna mobiilivõrk; mittemaapealne võrk

# text
seg-9bb1a987fedc = AD, BC

# text
seg-bbe2b5aa0557 = kalendriajastud (anno Domini, enne Kristust)

# text
seg-05bbe79b1991 = AIAA

# text
seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics (Ameerika Aeronautika ja Astronautika Instituut)

# text
seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

# text
seg-81799e2a0c43 = alternatiivne binaarne nihkekandja; binaarne nihkekandja; binaarne faasmanipulatsioon; multipleksitud binaarne nihkekandja (signaali modulatsioonid)

# text
seg-b2d165acb4e7 = ATOMIC

# text
seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (avaldatud LEO efemeriidimudel)

# text
seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

# text
seg-7f71a4795674 = jämekoodi ehk omandamiskood ning ülemaailmse positsioneerimissüsteemi kandelaine ja tsiviilsignaali nimed

# text
seg-e464509f3abb = kandelaine ja müratiheduse suhe

# text
seg-d8ba917c09b8 = CIO

# text
seg-4321532214e3 = Celestial Intermediate Origin (taevane vaheorigo)

# text
seg-de6c33774c9c = CLI

# text
seg-3096eb1d5a15 = käsurealiides

# text
seg-9aa3c2e54398 = 24-bitine tsükliline liiasuskontroll (Qualcommi polünoom)

# text
seg-1e1009e225aa = CSAC

# text
seg-6ff440ff2c0c = CSS, HTML, SVG, XML

# text
seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

# text
seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

# text
seg-b4758ea40624 = komadega eraldatud väärtused; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; uniform resource locator (ühtne ressursiaadress)

# text
seg-3ad592244ea8 = pidevlaine

# text
seg-287014fdc28d = CZML, KML, GeoJSON

# text
seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (kaardi- ja gloobuseformaadid)

# text
seg-3415aa029e39 = Jet Propulsion Laboratory arendusefemeriid { "441" }

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = digitaalne objektitunnus

# text
seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

# text
seg-a149d6e76bcb = täpsuse halvenemise tegur: geomeetriline, asendi, horisontaalne, vertikaalne

# text
seg-bc679de1b3a8 = E1, E5, E5a, E5b

# text
seg-bb2b62a48d99 = Galileo signaalide nimed

# text
seg-544f4fcbd68f = ülemaailmse positsioneerimissüsteemi konstellatsioonitabeli pesa nimi

# text
seg-dd9cfd581e5d = ECEF

# text
seg-1a59ad88eca9 = Maa keskne, Maaga seotud

# text
seg-7cf8bec6418e = EE

# text
seg-ceacb6924d4d = ekvinoktsiumide võrrand

# text
seg-5d59005d9757 = Earth Gravitational Model { "2008" }

# text
seg-de3b39993e2a = EIRP

# text
seg-7f1b85286c96 = ekvivalentne isotroopselt kiiratud võimsus

# text
seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (astronoomia etalonteegid)

# text
seg-51f1fda55cc7 = ESA, NAVISP

# text
seg-399a11a6e7c7 = Euroopa Kosmoseagentuur; selle navigatsiooni innovatsiooni ja toetuse programm

# text
seg-01eb6fdcdb90 = FDMA

# text
seg-6723fd8624df = sagedusjaotusega hajusjuurdepääs

# text
seg-6d5d27174fe9 = GCRF, GCRS

# text
seg-dd326440740d = Geocentric Celestial Reference Frame (geotsentriline taevane tugisüsteem); Geocentric Celestial Reference System (geotsentriline taevane tugisüsteem)

# text
seg-d41af8f18aed = GLONASS

# text
seg-81f742947af1 = Venemaa ülemaailmne satelliitnavigatsioonisüsteem

# text
seg-d2a107373b59 = GNSS, GPS

# text
seg-d703f29c82eb = ülemaailmne satelliitnavigatsioonisüsteem; ülemaailmne positsioneerimissüsteem

# text
seg-1df73b95ae4d = IAU

# text
seg-0461e1933d23 = Rahvusvaheline Astronoomiaunioon

# text
seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

# text
seg-a54e0f483ad5 = liidese juhtdokument; Galileo avatud teenuse kosmosesignaali liidese juhtdokument; Galileo avatud teenuse teenuse määratluse dokument

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = International Celestial Reference Frame (rahvusvaheline taevane tugisüsteem)

# text
seg-aa7091bb80e6 = IMO

# text
seg-6a7c8caf2a55 = Rahvusvaheline Mereorganisatsioon

# text
seg-dbcf65546abf = INS, MEMS

# text
seg-b767f348dab9 = inertsiaalnavigatsioonisüsteem; mikroelektromehaaniline süsteem

# text
seg-1be5a43002db = IOD

# text
seg-7eb2ca980e20 = orbiidil demonstratsioon

# text
seg-92cd0058a058 = IQ

# text
seg-c7fa50165400 = samafaasiline ja kvadratuurne

# text
seg-41471e51e661 = ülemaailmse positsioneerimissüsteemi liidese spetsifikatsioon

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Rahvusvaheline Kosmosejaam

# text
seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

# text
seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo-Earth-fixed (näiv Maaga seotud); tegelik ekvaator, keskmine ekvinoktsium (tugisüsteemid)

# text
seg-8f1cbbae84aa = ITU, ITU-R

# text
seg-d1b7680b4762 = Rahvusvaheline Telekommunikatsiooniliit; selle raadiosidesektor

# text
seg-a524e4c4a670 = segaja ja signaali suhe

# text
seg-5d93361e20d4 = J2 kuni J6, J2000

# text
seg-50255586b303 = gravitatsioonivälja tsoonilised harmoonikud; epohh 2000-01-01 { "12" }:{ "00" }

# text
seg-368f7969b33a = JPL

# text
seg-44db8a7ae8f7 = Jet Propulsion Laboratory

# text
seg-e0e589aaa8fe = LEO, MEO

# text
seg-f4b580b88664 = madal Maa orbiit; keskmine Maa orbiit

# text
seg-aad5b54bfffd = MBSE

# text
seg-800a5f6b96ad = mudelipõhine süsteemitehnika

# text
seg-535ba4896ba4 = NEES

# text
seg-a230ecd2fe39 = normaliseeritud hindamisvea ruut

# text
seg-56d5135d987d = Galileo ionosfäärimudel

# text
seg-408af08fe37b = OEM, SP3, TLE

# text
seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (täppisorbiidid); kaherealine elementide komplekt

# text
seg-ac4878697ee5 = PNT, PPP

# text
seg-c19b5f77acc5 = positsioneerimine, navigatsioon ja aeg; täppispunktpositsioneerimine

# text
seg-dd94b086ed4b = PSD, SSC

# text
seg-6e937d7e984e = võimsusspektri tihedus; spektraalse eraldatuse koefitsient

# text
seg-e0421c657cc1 = RAIM, SQM

# text
seg-d6fee8d2ce49 = vastuvõtja autonoomne terviklikkuse seire; signaali kvaliteedi seire

# text
seg-dc53bead2cf5 = RINEX, RTCM

# text
seg-497d23725a56 = Receiver Independent Exchange Format (vastuvõtjast sõltumatu vahetusformaat); Radio Technical Commission for Maritime Services

# text
seg-dcd6afa24ea6 = RMS

# text
seg-0b4fc648e96c = ruutkeskmine

# text
seg-e1c3c49833fc = avatud lähtekoodiga GNSS-i positsioneerimisteek, mida kasutatakse siin sõltumatu etaloni rollis

# text
seg-9ead536db4aa = Simplified General Perturbations { "4" } (kaherealiste elementide komplektide orbiidimudel)

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256-bitine

# text
seg-8c718f7f9f5d = SigMF

# text
seg-7830c93a5803 = Signal Metadata Format

# text
seg-d282e836d47b = SISRE

# text
seg-3c48d3ad7b43 = kosmosesignaali vahemaaviga

# text
seg-f045a03a5598 = SPS PS

# text
seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

# text
seg-758b51d8d5b6 = SRTM

# text
seg-7e45c32b04e4 = Shuttle Radar Topography Mission

# text
seg-8104773e1484 = STK

# text
# c1: .e
seg-f4fca0494aae = Systems Tool Kit (selle efemeriidifailiformaat <c1/>)

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-1043491566b5 = SVID

# text
seg-d67f9665f054 = kosmoseaparaadi tunnus

# text
seg-de4e841ce8a2 = Walkeri konstellatsiooni satelliitide koguarv, orbiiditasandid ja faasinihe

# text
seg-4d6ebfefc096 = TEC

# text
seg-5149401781dd = elektronide koguhulk

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = ülikõrgsagedus

# text
seg-3cd6018f5b78 = UTC

# text
seg-4d7d6ff2e8a5 = ülemaailmne koordineeritud aeg

# text
seg-41b9b462d434 = WGS { "84" }

# text
seg-ec04054b9f8e = World Geodetic System { "1984" }

# text
seg-613b7c13cd32 = X1, X5

# text
seg-349e041a5a90 = Xona Pulsari süsteemi signaalide nimed

# text
seg-d6a3f210958a = Muudetud avaldatud arv on parandus ja see kirjendatakse, mitte kunagi ei parandata vaikselt. See väljalase sisaldab ühte mootori väljundi parandust ja mitut dokumentatsioonis trükitud arvu parandust.

# text
seg-1669eb4224f1 = Mootori väljund

# text
seg-185961ebab61 = TEME→GCRS teisendus pööras { "2" }·Δψ võrra: nutatsioonimaatriksil oli Δψ märk vastupidine.

# text
# c1: nutation::numat
# c2: Rx(−(ε̄+Δε))·Rz(Δψ)·Rx(ε̄)
# c3: iauNumat
# c4: Rx(−(ε̄+Δε))·Rz(−Δψ)·Rx(ε̄)
# c5: nutation_matrix
# c6: nutation_matrix_2000a
# c7: teme_to_gcrs
# c8: gcrs_to_teme
# c9: numat
# c10: tests/frame_reference_vectors.rs::teme_to_gcrs_matches_vallado_gcrf
# c11: nutation::tests::nutation_matrix_matches_erfa_numat
# c12: src/cio.rs
# c13: ephemeris
# c14: gcrs_r_m
# c15: gcrs_v_m_s
# c16: Propagator::position_in_frame
# c17: state_gcrs
# c18: orbit-sgp4-gps
# c19: sgp4
seg-504b78f30c54 = <c1/> ehitas <c2/>, kus SOFA funktsioon <c3/> ehitab <c4/>, nii et <c5/>, <c6/>, <c7/> ja <c8/> pöörasid kaks korda pikkuskraadi nutatsiooni võrra, umbes { "25" } kaaresekundit. Kõik ahela kontrollid olid omaduspõhised testid (õige pööre, edasi-tagasi teisendus, nullist erinev nutatsiooni panus), mille märgiviga läbib; otsast lõpuni Vallado test katis TEME→PEF, TEME→ITRF ja GCRS→ITRS, kuid mitte TEME→GCRS. Vallado näite (AIAA 2006-6753, 2004-04-06) korral eksis ahel avaldatud GCRF-ist { "1 145" } m; nüüd jääb see sellest { "0.11" } m kaugusele ja maatriks võrdub ERFA funktsiooniga <c9/> täpsusega { "1e-14" }. <c10/> ja <c11/> mõlemad ebaõnnestuvad vana märgi korral. CIO (Celestial Intermediate Origin) kooskõlatest failis <c12/> oli sellest tulenenud ~{ "130" } m lahknevuse omistanud väärtusele „≈ { "2" }·EE“; jääk on nüüd { "5" } cm ja selle piir on pingutatud { "250" } m-lt { "1" } m-ni. <b>See muudab avaldatud arve, mis siin parandusena kirjendatakse:</b> stsenaariumi <c13/>-id veerud <c14/> ja <c15/> (umbes { "0.8" }–{ "1.0" } km komplekti kuuluva ISS-i (Rahvusvaheline Kosmosejaam) stsenaariumi puhul; selle TEME, Maaga seotud, jälje, vaatenurga ja Doppleri veerud ei muutu) ning <c16/> / <c17/> GCRS-i ja ITRS-i tugisüsteemide jaoks. Ükski komplekti kuuluva stsenaariumi kokkuvõtterida, diagramm ega golden-räsi neid veerge ei loe. Uued koostalitluseksportid kasutavad parandatud ahelat: esimese <c18/> satelliidi CZML-asend ühtib sama TLE ERFA-teisendusega (propageeritud Pythoni paketiga <c19/>) täpsusega { "2.3" } cm.

# text
# c1: leo-navmsg
# c2: leo-navmsg
# c3: navmsg
# c4: leo-pnt-chain
# c5: docs/LEO-NAVMSG.md
# c6: 0x110315
# c7: 0x19105F
# c8: leo-navmsg-fit-interval-trade
seg-a0a4026d22ed = <b>Stsenaariumi <c1/>-id, natiivselt ja brauseriehituses.</b> See stsenaariumi liik arvutab nüüd iga transtsendentse funktsiooni ühe teisaldatava matemaatikateegi kaudu, nii et selle kaader on samad baidid igal platvormil ja igas ehituses (režiimis Fixed). Iga <c2/> arv liigub sellega kaasa, samuti <c4/> etapp <c3/>. Stsenaariumi liik on selles väljalases uus, nii et midagi varasemast väljalasest ei liigu, kuid enne parandust trükitud arvud liiguvad: failis <c5/> oli kodeerimise ja dekodeerimise stsenaariumi kontrollväärtus <c6/> ja nüüd on <c7/> ning selle dekodeeritud sõnumi SISRE on { "0.129" } cm. Saidil kshana.dev näitas Missions'i kaart stsenaariumile <c8/> halvimaks vahemaaveaks { "1.6" } mm { "60" } s sobitusega ja { "40.3" } mm { "900" } s sobitusega; sait ehitatakse nüüd selle väljalaske mootorist ja näitab { "1.8" } mm ja { "46.6" } mm.

# text
# c1: maritime-strait-jamming
seg-77f441bfc3c3 = <b>Segamise jalajälje kaart saidil kshana.dev (Missions).</b> Selle { "875" } lahtrist on iga üks stsenaariumi <c1/> jooksutus, kus on muudetud ainult vastuvõtja asendit. Lahtrid arvutatakse nüüd samadest kolmekohalistest koordinaatidest, mille lahtri link „open this run“ annab Kshana Studiole, nii et lahter näitab täpselt seda, mida selle link reprodutseerib. { "30" } lahtri keskmine segaja ja signaali suhe (J/S) liigub { "0.1" } dB võrra, üles või alla; ühegi lahtri jälgimise kättesaadavus ei muutu. Mootor annab versioonides { "0.28.0" } ja { "0.29.0" } iga lahtri jaoks identsed tulemused.

# text
# c1: quantum-anomaly-detect
# c2: [0.9901265, 0.9938305]
# c3: [0.99035875, 0.993861]
seg-146588a39e7c = <b>Algväärtusega ümbervalim WebAssembly (WASM) paketis.</b> Brauseriehitus tõmbas samast algväärtusest (seed) (režiimis Fixed) teistsugused bootstrapi ja segamise indeksid kui natiivne ehitus. Brauseris oli stsenaariumi <c1/>-id kõvera aluse pindala vahemik <c2/> ja nüüd on see natiivne <c3/>. Ükski natiivne arv ei liigu.

# text
seg-017810049453 = Dokumentatsioonis trükitud arvud

# text
seg-85ab2a364a37 = Dokumentatsiooni auditeeriti sõna-sõnalt selle väljalaske mootori jooksutuste vastu. Kui trükitud arv jooksutusega ei ühtinud, parandati dokumenti ja iga parandus on siin loetletud kujul vana → uus. Allpool on mootori väljund igal juhul muutumatu; dokument oli seda valesti lugenud, valesti ümardanud või see oli aegunud.

# text
# c1: docs/SOLAR-SYSTEM.md
# c2: docs/CONSTELLATION-DESIGN.md
# c3: leo-pnt-mega-shell
seg-1eacdefbfda2 = <b>Spektri, konstellatsiooni, kampaania, animatsiooni, aruande ja koostalituse lehtede dokumentatsiooni audit ning uus <c1/>.</b> Iga arv jooksutati uuesti selle mootoriga. Kaks avaldatud arvu liigub: <c2/> andis { "5" } 000 satelliidiga katvuse testi kohta „umbes { "0.13" } s silumisehituses“; see ei reprodutseerunud ({ "1.24" } s koormatud sülearvutil), nii et leht annab nüüd eelfiltri osakaalu, mille test trükib ({ "9.9" } % arvust { "19 440 000" } paaritesti), ja väljalaskebinaari { "0.14" } s komplekti kuuluva <c3/> jaoks. Sama leht andis E3F-i ületuse kohta „{ "0.050" } kraadi vale“; ükski test seda arvu ei trüki, nii et leht väidab nüüd ainult { "0.06" } kraadi lävendit, mida test jõustab, ja selle taga olevat tuletust { "7.30" } versus { "7.36" } kraadi. Mootori väljund ei muutu.

# text
seg-2ad182e2db15 = LEO-PNT dokumendid: parandatud avaldatud arvud (uuesti jooksutatud selle väljalaske mootoriga).

# text
# c1: docs/LEO-SIGNAL.md
# c2: generic-s
# c3: generic-c-wide
# c4: docs/LEO-NAVMSG.md
# c5: docs/LEO-PASS.md
seg-6c2401365dd5 = <c1/> ribade kompromiss: stsenaariumi <c2/> esimese järgu ionosfääriviivitus on { "3.24" } m (trükitud oli { "3.25" } m) ja stsenaariumil <c3/> { "0.77" } m (oli { "0.78" } m). <c4/> kodeerimine ja dekodeerimine: dekodeeritud sõnumi SISRE oli trükitud { "0.119" } cm, kus jooksutus andis { "0.122" } cm; leht trükib nüüd { "0.129" } cm, arv pärast platvormist sõltumatuse parandust jaotises Fixed allpool. <c5/> LEO ja GNSS-i läbimise võrdlus: { "32" } dB vähem vabaruumi sumbumist läbimise tipus (oli „{ "26" } kuni { "32" } dB“). Signaali ja läbimise arvude puhul mootori väljund ei muutunud; dokumendid olid seda valesti lugenud või valesti ümardanud.

# text
# c1: /kshana-run
# c2: <scenario>.table.csv
# c3: leo-navmsg
# c4: telecom-timing
# c5: docs/tutorials/README.md
# c6: commands/kshana-run.md
# c7: oem-interop
# c8: docs/examples/multi-tool-pipeline.md
seg-fc3c8ba1b789 = <b>Õpetused, läbitöötatud torustiku näide ja käsk <c1/>, auditeeritud selle väljalaske mootori vastu.</b> Avaldatud arvude parandused, vana → uus: liike, mis kirjutavad <c2/>, on kuus, mitte neli (puudusid <c3/> ja <c4/>; <c5/>, <c6/>); külma aatomi ½bT² ületus õpetuses { "3" } on { "18,443" } s, mitte { "18,440" } s; <c7/> edasi-tagasi viga failis <c8/> on mõõdetud { "4.88e-7" } km, mitte „~{ "1e-7" } km“; õpetuse { "2" } CSAC holdover'i riba on { "2000" }–{ "3200" } s, mida test väidab, mitte „~{ "2600" }–{ "4400" } s“; õpetus { "1" } tsiteerib SP3 ridu ja geomeetriaplokki täpsusega, millega mootor need kirjutab. Mootori väljund ei muutunud.

# text
seg-4c613cabb87b = Valideerimise, kvantmõõtmise, SGP4, animatsiooni, väidete ja terviklikkuse lehed.

# text
# c1: docs/VALIDATION.md
# c2: orbit-gnss-challenged
# c3: docs/QUANTUM.md
# c4: docs/SGP4-VALIDATION.md
# c5: docs/ANIMATION.md
# c6: docs/CLAIMS-VS-REALITY.md
# c7: docs/INTEGRITY.md
seg-c49d5cdb36e1 = <c1/>: valge sagedusmüraga kella simuleeritud ühesekundilise Alani hälbe jõustatud lävi on { "20" } % (trükitud oli { "25" } %; lävi { "25" } % on see, mis on kõveral väärtustel { "1" }, { "10" } ja { "100" } s); kiiruse juhusliku kõnni rida ütleb nüüd oma jõustatud { "20" } % lävendi välja jälgitud umbes { "12" } % kõrval; ja kiibiskaalas aatomkella kättesaadavus stsenaariumis <c2/> on umbes { "0.73" } (trükitud oli umbes { "0.83" }). <c3/>: vibratsiooniga piiratud lasu kohta müra lehe läbitöötatud külma aatomi näites on umbes { "46" } korda selle lasumüra põhjast (oli „~{ "45" }×“; ümber arvutatud { "46.49" }) ning vahemik „{ "1" }–{ "50" } µg/√Hz“ välitingimustes seadmete jaoks, mis oli vastuolus seadmega, mida leht ise tsiteerib, on asendatud kahe tsiteeritud seadme avaldatud arvudega. <c4/>: halvim asendi erinevus on { "4.12" } mm (oli „≈ { "4" } mm“), satelliit nimetatud. <c5/>: videokodeerija näide luges { "24" } kaadrit sekundis kaadreid kiirusel { "12" }; nüüd kasutab see väärtust { "24" }, kiirust, mille kaadrimanifest ütleb. <c6/>: segamismudelil on { "10" } testi (oli { "8" }) ja seotud filtri „{ "2.97" } m versus { "48.8" } m“ on asendatud sellega, mida selle test väidab (seotud asendiviga alla { "0.6" } korda lahtisidutud omast, võites vähemalt { "90" } katsest { "100" }-st). <c7/>: tempel „Today“ luges { "v0.22.0" }; nüüd nimetab see seda väljalaset ning kaks sellest ajast ehitatud võimekust (konstellatsiooni hõlmav rikkerežiim ja terviklikkuse tugisõnum) lahkuvad selle lünkade loendist.

# text
# c1: spectrum
# c2: src/spectrum.rs
# c3: src/sigmf.rs
# c4: docs/SPECTRUM.md
# c5: [iq]
# c6: cf32_le
# c7: ci16_le
# c8: [recording]
# c9: scenarios/l-band-waterfall-jamming.toml
seg-4fde8788f95f = <b>Stsenaariumi liik <c1/>: L-riba spektrimudel ja koskdiagramm</b> (<c2/>, <c3/>, <c4/>). Kogu GNSS-i L-riba ühe võimsusspektri tihedusena (PSD): GPS L1 jämekood ehk omandamiskood (C/A) ja L2 tsiviilsignaal (L2C) (BPSK({ "1" })), Galileo E1 (multipleksitud binaarne nihkekandja, MBOC(6,1,1/11), või BOC({ "1,1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), kT mürapõhi koos vastuvõtja müranäitajaga ning pidevlaine- (CW), kitsaribalised, sirina- ja sobitatud mürasegajad skriptitud ajateljel. Iga segajat hinnatakse ribade kaupa selle spektraalse eraldatuse koefitsiendiga (SSC), mis annab segaja ja signaali suhte (J/S) ning efektiivse kandelaine ja müratiheduse suhte (C/N0) riba ja rea kohta. Diagramm on SVG koskdiagramm C/N0 ribadega; result.json kannab võrku võimsuses blokkide kaupa keskmistatult. Valikuline <c5/> joonistab mudeli IQ-valimitena, kirjutab ja loeb Signal Metadata Formati (SigMF) salvestust (<c6/>, <c7/>) ning võrdleb Welchi hinnangut mudeliga; valikuline <c8/> hindab päris SigMF-faili. Komplekti kuuluv näide <c9/>: sirin võtab L1 C/A ja E1 { "10" } s juures, CW toon L1 kandelainel hoiab C/A väärtusel { "17.98" } dB-Hz pärast sirina lõppu, samal ajal kui E1, mille spektris on seal null, taastub; L5 ja E5a jäävad puutumata.

# text
seg-fa9976349886 = Uus VALIDATED rida: signaalide PSD-d ja SSC-d, mida võrreldakse BPSK(n) peaasagariga 2n x { "1.023" } MHz, BOC({ "1,1" }) asagaridega keskpunktidega +/-1.023 MHz, Parsevali kinnisvalemitega avaldatud SSC-de -61.8 / -64.8 / -67.8 dB/Hz taga ning õpikuväärtustega Q = { "1" } (CW) ja { "1.5" } (sobitatud). BOC({ "1,1" }) PSD maksimum on kohas +/-0.759 MHz, mitte asaga keskpunktis; test kinnitab mõlemat.

# text
# c1: jamming
seg-411431a9b26b = Kaks uut MODELLED rida: koskdiagramm ja C/N0 ajatelg, mis taanduvad täpselt stsenaariumi <c1/>-id ahelale (kontrollitud igas aruandes), ning SigMF kodek ja Welchi hindaja. Hoidlas pole kolmanda osapoole salvestust.

# text
# c1: navsignal
# c2: spectral_separation_coeff_offset
seg-5c5c695e7c0a = <c1/>: MBOC variant ja <c2/>.

# text
# c1: jamming
seg-bb346f4942a9 = Aruanne trükib C/N0, mille annaks stsenaariumi <c1/>-id esindav Q tabel, spektrist tuletatud väärtuse kõrvale; C/A kandelaine CW tooni puhul erinevad need { "1.8" } dB võrra. Kolm uut maatriksi rida: üks valideeritud (signaali spektrid ja spektraalse eraldatuse koefitsiendid) ja kaks modelleeritud.

# text
seg-673dfe048dad = <b>Päikesesüsteemi efemeriid ja positsioneerimine mis tahes keha ümber.</b> Kaks uut stsenaariumi liiki.

# text
# c1: solar-system
# c2: scenarios/solar-system-tour.toml
seg-3e1b0e8e99e9 = <c1/>: Päike, kaheksa planeeti, Pluuto, Kuu, Phobos, Deimos, Io, Europa, Ganymedes, Callisto ja Titan ühel epohhil: heliotsentriline asend ja kiirus International Celestial Reference Frame'is (ICRF), gravitatsiooniparameeter, raadiused, J2 (teine tsooniline harmoonik), kus avaldatud, sideeriline pöörlemine, Rahvusvahelise Astronoomiaunioni (IAU) pooluse ja nullmeridiaan, orbiidi jälg ühe tiiru jooksul ning valguse läbimisaeg, ühesuunaline ja kahesuunaline vahemaa, Päikese Shapiro viivitus ja Päikese eraldusnurk vaatluskehast ning iga lisalingi jaoks. Planeedid pärinevad Jet Propulsion Laboratory (JPL) Kepleri elementidest, mille on koostanud Standish ja Williams (tabel { "1" }, { "1800" } AD kuni { "2050" } AD; tabelid 2a/2b, { "3000" } BC kuni { "3000" } AD); kuud JPL keskmistest elementidest IAU sünkroonse pöörlemiskiirusega ning Titan IAU pöörlemismudelist. Näide: <c2/>.

# text
# c1: body-pnt
# c2: scenarios/mars-orbit-pnt.toml
# c3: scenarios/europa-surface-pnt.toml
seg-6a094973208b = <c1/>: orbiter või pinnalander mis tahes nende kehade ümber, mis navigeerib keha ümber oleva Walkeri konstellatsiooni pseudovahemaade ja Maalt tuleva kellavaba kahesuunalise vahemaaga; täpsuse halvenemise tegur, formaalne määramatus ja algväärtusega vähimruutude lahendid koos Maa-lingiga ja ilma selleta. Näited: <c2/>, <c3/>.

# text
# c1: Body
# c2: AnalyticSolarSystem
# c3: EphemerisProvider
seg-ed5063379a8b = <c1/> saab juurde Merkuuri, Veenuse, Jupiteri, Saturni, Uraani, Neptuuni, Pluuto ja seitse kuud, nimeotsingu ja füüsikalise kirje; <c2/> annab mis tahes keha suhtes mis tahes teise olemasoleva <c3/> liidese kaudu.

# text
# c1: tests/fixtures/solar_system/
# c2: body-pnt
seg-8b5c2fbe91f7 = VALIDATED JPL Horizonsi vastu (Development Ephemeris DE441; fikstuurid ja päringud kataloogis <c1/>): Merkuurist Saturnini ja Maa tabelist { "1" } kahekordse öeldud nominaalvea piires (halvim { "1.87" } korda), kõik kaheksa planeeti tabelitest 2a/2b (halvim { "1.71" } korda) ning Maa ja Marsi ning Jupiteri valguse läbimisaeg. MODELLED: Uraan ja Neptuun tabelist { "1" }, mis ületavad öeldud viga DE441 suhtes ({ "2.0" } ja { "5.2" } korda), Pluuto, kuud, keha konstandid ja <c2/> tulemused.

# text
# c1: src/ephem.rs
seg-a3c83f6d2078 = Leid: Montenbrucki ja Gilli Kuu jada failis <c1/> on oma täppusliikme abil juba viidud J2000 ekvinoktsiumile ({ "0.05" } kraadi Horizonsist), nii et seda kasutatakse ilma täiendava täppuspöördeta. Kuus uut maatriksi rida: kaks valideeritud (planeedi asendid, valguse läbimisaeg) ja neli modelleeritud.

# text
seg-564133d6a0c4 = Konstellatsioonid mis tahes keha ümber

# text
# c1: constellation-design
# c2: src/constellation.rs
# c3: solar-system
seg-d1ddb76d8bf3 = <b>Konstellatsiooni kavandamine suures mastaabis (stsenaariumi <c1/>-id, <c2/>).</b> Walker delta ja Walker star mustrid (T/P/F), selged elementide loendid ja mitmekihilised kavandid, mitu konstellatsiooni jooksutuse kohta, Maa, Kuu, Marsi või mis tahes muu planeedi, Pluuto või suure kuu ümber keha konstantidest, mille lisas stsenaariumi <c3/>-id. Eelseaded avaldatud nominaalelementidest: ülemaailmse positsioneerimissüsteemi (GPS) baasjoon ja laiendatav 24 pesaga konstellatsioon (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document väljaanne { "1.1" }), BeiDou keskmise Maa orbiidi Walker 24/3/1 pluss geostatsionaarsed ja kaldunud geosünkroonsed satelliidid (Open Service Performance Standard { "3.0" }) ja GLONASS 24/3/1 (Interface Control Document { "5.1" }). Katvus ja täpsuse halvenemise tegur (DOP) laius- ja pikkuskraadi võrgu kohal: nähtavad satelliidid, GDOP, PDOP, HDOP ja VDOP (geomeetriline, asendi, horisontaalne, vertikaalne) ja kättesaadavus lahtri kohta, globaalselt ja halvimas kohas, ühe vastuvõtja kellaga konstellatsiooni kohta. Nähtavuse eelfilter (katvuse poolnurk pluss alamsatelliidi laiuskraadi riba, sfäärilisel kehal täpne) käitab { "5 000" } satelliiti { "10" } kraadi võrgul umbes { "0.13" } s silumisehituses.

# text
seg-8f4ebd177f3d = VALIDATED: Walkeri generaator reprodutseerib Galileo OS SDD tabeli { "23" } ja GLONASS ICD pesa valemi; GPS eelseade reprodutseerib SPS PS ekvaatoriületuse veeru ({ "35" } kohta { "36" }-st { "0.0108" } kraadi piires; E3F { "0.06" } kraadi piires, kuna tabeli enda rida on vastuoluline); GPS baasjoone globaalne HDOP jaotus ühtib SPS PS lisaga B (mediaan { "0.940" } versus { "0.94" }, { "95" } % { "1.255" } versus { "1.25" }, keskmine { "0.965" } versus { "0.96" }; lävi { "0.03" }).

# text
seg-65658a896a73 = MODELLED: suvalised kavandid, muud kehad, BeiDou faasi- ja kaldunud geosünkroonsed sõlmed, kahe keha orbiidid valikulise J2-ga, ainult geomeetria.

# text
# c1: constellation-multi-gnss-coverage
# c2: leo-pnt-mega-shell
# c3: lunar-relay-constellation
# c4: kshana example
# c5: docs/CONSTELLATION-DESIGN.md
seg-3dfe470e8a5c = Stsenaariumid: <c1/> ({ "102" } satelliiti, kättesaadavus { "100" } %, mediaan PDOP { "0.95" }, { "31.0" } nähtaval üle { "10" } kraadi), <c2/> ({ "5 000" } satelliiti, kättesaadavus { "99.22" } % PDOP-i { "3" } või väiksema korral üle { "20" } kraadi, { "0" } % polaarmütsidel, eelfilter säilitab { "11.5" } % paaritestidest), <c3/> ({ "14" } satelliiti Kuu ümber, kättesaadavus { "21.33" } % kokku ja kõrgeim lõunapolaarpiirkonnas). Kõik kolm kuuluvad komplekti käsu <c4/> jaoks. Märkmed: <c5/>. Kolm uut maatriksi rida: kaks valideeritud (Walkeri generaator ja GNSS-i eelseaded, GPS globaalne DOP) ja üks modelleeritud.

# text
seg-79e2d2c42166 = Spektrimudelist juhitud kampaania ja konstellatsioonid mis tahes keha ümber.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: tests/campaign_composition_reference.rs
# c4: constellation-design
# c5: Body::by_name
# c6: solar-system
seg-4ab5f6f6bbbb = <c1/> seob stsenaariumi <c2/>-id kella holdover'i ja terviklikkuse monitoriga (sirin võtab L1 C/A ja E1; CW toon hoiab seejärel C/A all, kuni E1 taastub ja vastuvõtja langeb tagasi ainult Galileo taevale), kinnitatud faili <c3/> eraldiseisva koskdiagrammi näite vastu. Stsenaariumi <c4/>-id lahendab nüüd oma keskkeha funktsiooni <c5/> kaudu, nii et konstellatsiooni saab paigutada mis tahes planeedi, Pluuto või suure kuu ümber konstantidega, mida kasutab stsenaariumi <c6/>-id.

# text
# c1: campaign
# c2: src/campaign.rs
# c3: docs/CAMPAIGNS.md
seg-dc904f639fed = <b>Kampaaniad: paljud stsenaariumid koondatud ühte jooksutusse.</b> Uus stsenaariumi <c1/>-id (<c2/>, dokumenteeritud failis <c3/>) käitab olemasolevate liikide liikmeid sama käsurealiidese jaotuse kaudu ja loeb arvud nende tulemustest tagasi. Neli jaotist, mis tahes kombinatsioonis:

# text
# c1: [[phases]]
# c2: carry
# c3: handoff
# c4: end_at
seg-903ee141047a = <c1/>: aheldatud missioon ühel ajateljel. Liigipõhised eelseaded loevad kella ajaviga selle valve vastu, keskmist efektiivset kandelaine ja müratiheduse suhet (C/N0) jälgimispõhja vastu, vertikaalset kaitsetaset häirepiiri vastu, asendiviga, jälgitavaid satelliite ja alarmilippe, hoituna ühisele võrgule koos faasipiiride ja sündmustega. Olek antakse edasi võtmetega <c2/>, <c3/> ja <c4/>.

# text
# c1: [sweep]
seg-4eeedde09a77 = <c1/>: üks kuni kolm punktiga võtit mis tahes liigist, valikuliselt iga sõlme algväärtusega ansambliga.

# text
# c1: [monte_carlo]
seg-4c113198cbb7 = <c1/>: realisatsioon k algväärtusel baas + k, keskmise, hajuvuse, protsentiilide ja fikseeritud algväärtusega bootstrapi { "95" }% usaldusvahemikuga.

# text
# c1: [compose]
# c2: campaign-jam-spoof-holdover-integrity
# c3: campaign-sweep-jammer-power
# c4: campaign-shared-jammer-sea-road
# c5: campaign-monte-carlo-clock-holdover
# c6: tests/campaign_composition_reference.rs
seg-df107253752d = <c1/>: ühised väärtused, mis on seotud mitme liikmega, koos kombineeritud parima ja halvima kokkuvõttega. Iga tulemus kannab kampaania räsi ja kokkuvõtet iga liikme tulemuse kohta. Neli komplekti kuuluvat stsenaariumi: <c2/> (nominaalne, segamine, spuufimine, mis lõpeb kellamonitori { "370" } s tuvastamisel, holdover, mis kannab { "37.0" } ns spuufitud nihet inertsiaalseadme rannikusõidul, terviklikkuse alarm, taastumine), <c3/>, <c4/> ja <c5/>. <c6/> kinnitab koostise samasusi: ühefaasiline kampaania reprodutseerib eraldiseisva jooksutuse bitt-bitilt kolmel liigil, fikseeritud algväärtusega ansambel on baidistabiilne ja valge sagedusmüraga kella puhul jääb ansambli keskmine teatatud vahemikku ning hajuvus hii-ruut vahemikku sqrt(q_wf * tau) = { "16.459" } ns kohta. Kolm uut modelleeritud maatriksi rida.

# text
seg-c611ee59301a = Animatsioon

# text
# c1: --animate svg|html|frames|all
# c2: src/animation.rs
# c3: docs/ANIMATION.md
# c4: manifest.json
# c5: prefers-color-scheme
# c6: prefers-reduced-motion
# c7: --animate-fps
# c8: --animate-duration
# c9: kshana::api::animate_toml
# c10: kshana::animation::animate_result
# c11: result.json
# c12: animation
# c13: --animate
# c14: tests/animation.rs
seg-14b2d3cc9e7c = <b>Animatsiooni eksport (<c1/>, <c2/>, <a1><c3/></a1>).</b> Mis tahes jooksutuse, mille tulemus kannab ajarida, saab nüüd kirjutada animeeritud Scalable Vector Graphics (SVG) failina (Cascading Style Sheets võtmekaadrid, skripti pole: jooned joonistuvad sisse liikuva ajakursori taha), ühe isemajandava HyperText Markup Language (HTML) esitajana (esita ja peata, kerimine, kiirus, kõik paneelid ühel sünkroonitud kursoril, sündmusemärgid, mis klõpsuga otsivad; väliseid varasid pole) või nummerdatud SVG kaadrijadana koos failiga <c4/>, mis ütleb videokodeerijale kaadrid sekundis, kestuse ja kaadriajad. Kampaania esitatakse oma faasidena koos märgitud alarmidega; spektrijooksutus animeerib oma koskdiagrammi rea haaval. Esitaja järgib seadet <c5/> ning seadme <c6/> korral näitavad nii SVG kui esitaja liikumise asemel valmis pilti. Seaded <c7/> ja <c8/> määravad esituse; <c9/> ja <c10/> on teegi sisenemispunktid ning <c11/> saab ploki <c12/> ainult siis, kui <c13/> töötab. Väljund on tulemuse ja valikute puhas funktsioon, kordusjooksutusel baidi-baidilt identne, ajatempliga pole. Liik, millel pole diskreetset ajatelge, lükatakse tagasi teatega „no time series to animate“ ja midagi ei kirjutata. Eksportija joonistab jooksutuse enda valimid ega lisa ühtki arvu, nii et see on MODELLED (sisemine kooskõla) ega kanna kontrollimaatriksi rida; ükski avaldatud arv ei muutu. Testid: <c14/> (determinism, kaadrite arv, väline aadress puudub, korrektne XML, vähendatud liikumise tee ja iga komplekti kuuluv ajareaga stsenaarium animeerub).

# text
seg-c01b78b64065 = Aruanded

# text
# c1: src/advanced_report.rs
# c2: <scenario>.report.html
# c3: <scenario>.report.json
# c4: units
# c5: sweep
# c6: sweep-nd
# c7: orbit
# c8: slot-timing
# c9: KSHANA_GIT_COMMIT
# c10: --study-name
# c11: --report pdf
# c12: tests/advanced_report.rs
# c13: tests/advanced_report_cli.rs
# c14: result.json
seg-2662fdb991f3 = <b>Täpsemad jooksutuse aruanded (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Iga käsurealiidese (CLI) jooksutus kirjutab nüüd faili <c2/>, prinditava HyperText Markup Language (HTML) aruande, ja faili <c3/>, sama sisu masinloetava JavaScript Object Notation (JSON) dokumendina. Jaotised: juhtkokkuvõte; iga stsenaariumi sisend koos ühikuga, loetud väljaühikute skeemist (tulemuse plokk <c4/>), muidu välja nime järelliitest, muidu märgitud mitteöeldud; tulemused jooksutuse diagrammiga, iga skalaar ja iga arvulise veeru kokkuvõte; kampaania puhul pühkimissõlmede tabel, Monte Carlo keskmine, standardhälve, 5. / 50. / 95. protsentiil ja bootstrapi usaldusvahemik koos histogrammiga iga mõõdiku kohta, ahela faaside tabel või koostise liikmed ja kombineeritud kokkuvõte (ning jooksutuse <c5/> või <c6/> võrk); sündmuste ajatelg; iga kontrollimaatriksi rea, mida jooksutuse liigid kasutavad, silt VALIDATED / MODELLED / PARTNER, sõltumatu etalon ja testitõend, loetud maatriksist liigi ja rea ristviite kaudu (rida, mis hindab ühte sisendteed, näiteks stsenaariumi <c7/> Simplified General Perturbations { "4" } (SGP4) teed või stsenaariumi <c8/> mõõdetud kirje teed, loetletakse ainult siis, kui jooksutus seda teed kasutas, ja Shuttle Radar Topography Mission (SRTM) lugeja rida ei loetleta ühegi liigi jaoks, sest ükski stsenaariumi väli ei loe SRTM-i paani); mittemodelleeritud väited ja eeldused, igaüks oma allikaga tsiteeritud; ning reprodutseeritavuse kirje (mootori versioon, lähtekoodi commit, kui ehitus seab muutuja <c9/>, stsenaariumifaili ja tulemusdokumendi Secure Hash Algorithm 256-bit (SHA-256) räsid, algväärtus, platvorm ja täpne käsk). Aruanne ei loe kella: sama stsenaarium, algväärtus ja mootoriehitus annavad baidi-baidilt identse aruande ning ainus ajatempel, mida see võib näidata, on see, mille <c10/> juba kirjutab. Prindistiil mahub A4 ja US Letteri formaati, kordab tabelipäiseid ning hoiab read ja joonised lehtede vahel tervena; Portable Document Format (PDF) fail tehakse brauseri funktsiooniga „Save as PDF“. Valikut <c11/> pole, sest diagrammide renderdamine PDF-i vajaks uut rasket sõltuvust. Testid: <c12/> annab aruande iga komplekti kuuluva stsenaariumi kohta (tühje jaotisi pole, kohatäiteteksti pole, sildid võrduvad maatriksiga, stsenaariumi räsi võrdub faili omaga, kordusjooksutusel baidi-baidilt identne) ja <c13/> jooksutab salvestatud käsu uues kataloogis uuesti ning nõuab baidi-baidilt identset faili <c14/>. Ükski avaldatud arv ei muutu ning liikide, stsenaariumifailide ja maatriksi ridade arv on muutumatu.

# text
# c1: report.json
# c2: companions
seg-ce45e75c6d67 = <b>Aruanne, animatsioon ja eksportid töötavad koos.</b> Täpsem aruanne saab jaotise „Animation and exports“: jooksutuse animeeritud joonis, manustatud inertse pildina (või põhjus, miks seda pole), lingid selle kõrvale kirjutatud animatsiooni- ja eksportfailidele ning iga koostalitlusformaat koos sellega, kas see kehtib, miks mitte, ja selle spetsifikatsiooniga; <c1/> kannab sama plokki <c2/>. HTML animatsiooniesitaja loetleb selle kõrvale kirjutatud eksportfailid. Käsurealiides (CLI) renderdab nüüd eksportid enne aruande kirjutamist, nii et mõlemad saavad failid nimetada.

# text
seg-c60dc5b92a60 = Koostalituse eksportid

# text
# c1: --export
# c2: src/interop/
seg-5bfce52c5a13 = Koostalituse eksportid ja impordid (<c1/>, <c2/>, docs/INTEROP.md).

# text
# c1: kshana <scenario.toml> --export <format>
# c2: gx:Track
# c3: .e
# c4: EphemerisTimePosVel
# c5: spectrum
# c6: src/sigmf.rs
# c7: --export all
# c8: --export list
# c9: INERTIAL
# c10: ICRF
# c11: FIXED
# c12: jamming
# c13: --import-route <file.geojson>
# c14: LineString
# c15: terrain-nav
# c16: terrain-slam
# c17: gravity-map
# c18: combined-altpnt
# c19: tests/interop_formats.rs
# c20: spectrum
# c21: PassesScenario
# c22: propagator()
# c23: epoch_calendar()
# c24: epoch
# c25: t = 0
# c26: Sgp4::epoch_jd_utc
# c27: Sp3Interpolator::jd_ut1
# c28: Propagator::own_jd_utc
seg-44e7c902490a = <c1/> kirjutab stsenaariumi geomeetria kujul CZML (Cesium Language), KML (Keyhole Markup Language { "2.2" }, Open Geospatial Consortiumi standard, aegmärgitud radadega <c2/>), GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) ja Ansys STK (Systems Tool Kit) efemeriidid <c3/> (<c4/>, meetrid, üks fail iga liikuva objekti kohta) ning stsenaariumi <c5/>-id sünteesitud IQ (samafaasiline ja kvadratuurne) hetktõmmise SigMF (Signal Metadata Format) paarina olemasoleva <c6/> kaudu. <c7/> kirjutab iga kehtiva formaadi ja trükib, miks teised ei kehti; <c8/> annab aru jooksutamata. Liikuvad objektid kirjutatakse Geocentric Celestial Reference Systemis (CZML <c9/>, STK <c10/>) ning Maaga seotud WGS { "84" } (World Geodetic System { "1984" }) pikkuskraadi, laiuskraadi ja kõrgusena (KML, GeoJSON); fikseeritud kohad CZML-is on <c11/>. Stsenaariumi <c12/>-id lisab kaks segaja jalajälge oma lingivõrranditest. <c13/> kirjutab GeoJSON <c14/> failide <c15/>, <c16/>, <c17/> ja <c18/> raja sisenditesse. Eksportid on baidideterministlikud ega kanna ajatemplit. <c19/> valideerib iga ekspordi selle avaldatud spetsifikatsiooni vastu, võrdleb eksporditud satelliidi olekuid mootori omadega { "1" } mm täpsusega ja jooksutab iga komplekti kuuluva stsenaariumi läbi iga formaadi, millest igaüks kas eksporditakse või ütleb, miks mitte (tabel failis docs/INTEROP.md). Ükski avaldatud arv ei muutu: stsenaariumi <c20/>-id IQ süntees viidi üheks jagatud funktsiooniks ja selle tulemusdokument on baidi-baidilt identne ning <c21/> saab juurde <c22/> ja <c23/>, mida kasutab selle enda jooksutus. Liikide, stsenaariumifailide ja kontrollimaatriksi ridade arv on muutumatu. Orbiidi- või terviklikkusstsenaarium ilma <c24/> dateeritakse selle satelliitide enda andmete järgi: <c25/> on varaseim TLE (kaherealine elementide komplekt), edastatud efemeriidi või SP3 (Standard Product { "3" }) epohh ning iga selline satelliit pööratakse GCRS-i ja Maaga seotud tugisüsteemidesse oma hetkel; 2000-01-01T00:{ "00" }:00Z kasutatakse ainult siis, kui ükski satelliit epohhi ei kanna. SP3 ja OEM (Orbit Ephemeris Message) eksportid hoiavad oma sildi 2000-01-01. Selle toetamiseks lisati <c26/>, <c27/> ja <c28/>; midagi olemasolevat neid ei loe.

# text
seg-12c151a800f9 = Madala Maa orbiidi navigatsioon: signaal

# text
# c1: leo-signal
# c2: spectrum
seg-9b665682695a = <b>LEO-PNT signaalikavandid ja mitmeribaline spekter.</b> Uus stsenaariumi <c1/>-id ja stsenaariumi <c2/>-id, mis ulatub L-ribast kaugemale: üks liik, neli stsenaariumifaili (kolm komplektis; Celeste IOD fail on ainult hoidlas) ja neli maatriksi rida (kaks VALIDATED, kaks MODELLED).

# text
# c1: leo-signal
# c2: data/leo-signals/
# c3: scenarios/leo-band-trade.toml
# c4: scenarios/xona-pulsar-signals.toml
# c5: scenarios/celeste-iod-classical-pilot-signals.toml
# c6: docs/LEO-SIGNAL.md
seg-b355b28bfd1b = <c1/>: parameetritega madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) signaalikavandid mis tahes süsteemile (riba, saatja ribalaius, ITU jaotus; omandamis-, andme- ja piloodikomponendid BPSK(n), BOC(m,n), MBOC või lamedate spektritega, võimsusosad, FDMA alamkandjad, koodipikkused ja andmekiirused) kompileeritud avalikest eelseadete failidest kataloogis <c2/> (Xona Pulsar X1/X5, Iridium STL, Starlinki oportunistlik signaal, CentiSpace, esindav C-riba kavand ja esindavad UHF/L/S/C/lai-C kavandid, igaüks oma allika URL-iga) või kirjutatud otse. Signaali kohta: ribapiiratud PSD ja ribasisesed võimsusosad, Gabori ribalaius, ribapiiratud varajase-hilise koodijälgimise värin C/N0 ja vahe suhtes (Betz & Kolodziejski { "2009" }) ning ulatuse täpsus, omandamise otsinguruum, avastamistõenäosus ning keskmine järjestikune ja koodiparalleelne omandamisaeg, SSC GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b ja AltBOC-sse ja neist koos C/N0 kaoga, CW, lairiba ja sobitatud J/S tolerants spektrikoodi stsenaariumi liigi SSC-koodist, ribade kompromiss (ionosfääriviivitus, vabaruumi sumbumine, ulatus võrdsel C/N0 ja võrdsel EIRP-l, segaja tolerants) ning valikulised kujukontrollid kirjeldatud mõõtmise vastu. Näited: <c3/>, <c4/>, <c5/> (Celeste IOD ribad ja signaali seadistus, mis esitati ESA NAVISP LEO-PNT töötoas, { "2026" }; tagasi hoitud koos Celeste IOD eelseadega, vt „LEO-PNT otsast lõpuni“ allpool). Märkmed failis <c6/>.

# text
# c1: spectrum
# c2: [[panels]]
# c3: wideband
# c4: bands[].tracked_power_dbw
# c5: bands[].design
# c6: panels
# c7: not_modelled
# c8: scenarios/multi-band-jamming-waterfall.toml
seg-8f58debf721f = <c1/>: ribad võivad nüüd olla eelseatud signaalikavand (iga komponent joonistatud, ribapiiratud, C/N0 ja J/S viidud jälgitavale komponendile) või kohandatud kandja ja modulatsioon; <c2/> lisavad koskdiagramme muudele sagedusvahemikele ühel ajateljel; <c3/> (barrage) segaja liitub nelja lainekujuga. Aruanne lisab <c4/>, <c5/> ja <c6/> ning ühe kirje <c7/>. Lihtribad annavad samad arvud kui varem. Näide: <c8/>.

# text
# c1: navsignal
# c2: Modulation::label
seg-98f74d85c54b = <c1/> saab juurde siinusintegraali, BPSK võimsuse ribas ja ribapiiratud Gabori ribalaiuse kinnisvalemid, ribapiiratud varajase-hilise värina mis tahes spektri jaoks ja selle Gabori piiri, nihutatud BPSK SSC kinnisvalemi, Galileo E5 AltBOC({ "15,10" }) spektri ja modulatsioonisildi parseri; <c2/> trükib BPSK(1/3) murruna.

# text
# c1: leo-signal
seg-78d9e5e2c615 = Neli maatriksi rida: VALIDATED ribapiiratud kinnisvalemid ({ "90.3" } % BPSK võimsusest peaasagaris, värin, mis taandub Kaplani ja Hegarty koherentsele kujule, { "0.0039564" } kiipi juures { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } kiip, T { "20" } ms, ja selle Gabori piirile, ning BPSK enda SSC 2/({ "3" } R_c); Gabori kinnisvalem ja nihutatud SSC selle Parsevali kuju vastu on öeldud sisemiste ristkontrollidena); VALIDATED LEO Doppleri maksimum (Xona X1 { "33.2" } kHz avaldatud { "32" } kuni { "34" } kHz piires, Iridium { "0.5" } kHz piires väärtusest { "36" } kHz); MODELLED <c1/>; MODELLED mitmeribaline spekter.

# text
seg-45d3d4a46d6b = Madala Maa orbiidi navigatsioon: link

# text
# c1: leo-pass
# c2: constellation-design
# c3: [iot]
seg-1d120db87aae = <b>LEO-PNT läbimine ja ribakohane lingieelarve: stsenaariumi <c1/>-id.</b> LEO-PNT on positsioneerimine, navigatsioon ja aeg madala Maa orbiidi (LEO) satelliitidelt. Kasutaja (maapealne, mere-, õhu- või siseruumides, paigal või liikuv) ja üks või mitu LEO satelliiti kavandatud läbimisest, selgetest elementidest, kaherealisest elementide komplektist (TLE) SGP4 kaudu või Walkeri konstellatsioonist koodi <c2/> abil. Satelliidi, riba ja epohhi kohta: vaatenurgad, vahemaa, kinnisvalemiga vahemaa muutumiskiirus ja kiirendus (kontrollitud igal jooksutusel kesksete vahedega), Doppler ja Doppleri kiirus, vabaruumi sumbumine, EIRP (ekvivalentne isotroopselt kiiratud võimsus) isovoo-, Gaussi kiire või lameda satelliidimustriga, plaaster-kasutajaantenn, ITU-R P.676 gaasiline sumbumine, ITU-R P.838/P.618 vihmasumbumine, P.618 troposfääri skintillatsioon, ITU-R P.2109 hoonesse sisenemise kadu siseruumi kasutaja jaoks, polarisatsiooni mittevastavus, süsteemi müratemperatuur ja C/N0 (kandelaine ja müratiheduse suhe); esimese järgu ionosfääriviivitus riba kohta Klobucharist või vertikaalsest TEC-ist (elektronide koguhulk), kaldus TEC satelliidi all, ning ionosfäärivabad ribapaarid koos nende müra võimendusega. Galileo või GPS satelliite hinnatakse sama vastuvõtjaga nende liidesedokumentide vastuvõetud võimsustest, nii et kellukakujuline LEO läbimine ja lame MEO (keskmine Maa orbiit) kandelained jagavad ühte graafikut. Jaotis <c3/> annab esimese asendilahenduse aja, energia asendilahenduse kohta ja aku eluea töötsükli suhtes (MODELLED).

# text
# c1: src/celeste_iod.rs
seg-17f3503e1be3 = Süsteemist sõltumatu: mootor ei vaja eelseadet. Valikulised eelseaded, igaüks omas failis ja märgitud PUBLIC (URL-iga), REPRESENTATIVE või WORKSHOP: üldine mitmeribaline (UHF, L, S, C), üldine C-riba, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink ainult Doppleri oportunistliku signaalina, CentiSpace ja Celeste IOD (orbiidil demonstratsioon), mille signaaliparameetrid esitati ESA NAVISP LEO-PNT töötoas, { "2026" }, ja asuvad failis <c1/>, nii et neid saab tagasi hoida (vt „LEO-PNT otsast lõpuni“ allpool).

# text
# c1: src/leo_link/
seg-a338cc46a1e0 = Avalikud ehituskivid kataloogis <c1/> (geometry, antenna, itu, iono, energy, presets), mida teised moodulid saavad kutsuda.

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-pass-celeste-iod-multiband
seg-887ad03cb6f6 = Stsenaariumid: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
# c1: docs/LEO-PASS.md
seg-a20f1602c236 = Üheksa maatriksi rida. VALIDATED ({ "6" }): ITU-R P.838-3 koefitsiendid selle tabeli { "5" } vastu; P.618-14 vihmasumbumine ja skintillatsioon ITU-R uurimisrühma { "3" } valideerimisnäidete vastu; P.2109 hoonesse sisenemise kadu uurimisrühma { "3" } töövihiku vastu; esimese järgu ionosfääri skaleerimine IS-GPS-200 rühmaviivituse suhte vastu koos vabaruumi sumbumisega; ringorbiidi paigalseisva kasutaja Doppleri maksimum arXiv { "2509.19551" } tabeli { "1" } vastu. MODELLED ({ "3" }): läbimine ja lingieelarve, eelseaded ning väikese energiakuluga asendilahenduse eelarve. Üks liik ja kuus stsenaariumifaili. Märkmed failis <c1/>.

# text
seg-ef74b0f08aa1 = Madala Maa orbiidi navigatsioon: navigatsioonisõnum

# text
# c1: leo-navmsg
# c2: src/leo_navmsg/
# c3: docs/LEO-NAVMSG.md
seg-866ff4ee8b19 = <b>LEO navigatsioonisõnum (stsenaariumi <c1/>-id, <c2/>).</b> Madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) satelliidi edastatav efemeriidi ja kella sõnum mis tahes orbiidi, kandja ja mudeli jaoks; nimetatud eelseaded on valikulised andmed ja iga võimekus töötab ilma nendeta. Üks liik, viis stsenaariumifaili ja üheksa maatriksi rida (kolm VALIDATED, kuus MODELLED). Vt <c3/>.

# text
seg-c42821b6e855 = Sõnumi sisu: SVID, andmete väljaanne, riba ja signaali tervis; nädal, nädala aeg ja teist järku kellapolünoom; efemeriid ühes nelja mudeli seast: Galileo OS SIS ICD 16-parameetriline Kepleri komplekt, see komplekt pluss mööda rada, risti rada ja radiaalsed parandupolünoomid, Liu jt { "2025" } 22-parameetriline mudel (doi 10.3390/rs17162894) või ATOMIC nullkella ECEF-polünoom; ning Klobuchari komplekt, NeQuick-G koefitsiendid efektiivse ionisatsioonitasemega ja süsteemiaja ja UTC vaheline parameetrid ICD liigsekundi juhtudega.

# text
seg-e4565696f162 = Sobitaja: tõeline orbiit, mis on integreeritud tsooniliste J2–J6 või EGM2008 gravitatsiooni ja takistusega, algväärtusega vaba või juhitud kell, Levenbergi–Marquardti sobitus mittesingulaarsetel elementidel, seejärel lineaarsed vähimruutude parandupolünoomid ja kell, mis on sobitatud kasutaja relativistliku liikme netona.

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
seg-a7287b7b336c = Neli analüüsi ja stsenaariumi: <c1/> (kosmosesignaali vahemaavea (SISRE) sõltuvus sobitusvahemikust ja uuendusperioodist), <c2/> (neli mudelit, bitid ja Kshana 22-parameetriline sobitus Liu jt kõrgustel avaldatud arvude kõrval, MODELLED), <c3/> (pidevus igal sõnumivahetusel läbimise ajal) ja <c4/> (Kshana enda dokumenteeritud binaarkaader CRC-24Q ja kvantimiseelarvega, RINEX-4-stiilis plokk, mis on märgitud Kshana laiendiks, ja CSV tabel).

# text
# c1: tests/leo_navmsg_reference.rs
seg-e272dce3d10f = VALIDATED: globaalse keskmise SISRE kaalud Montenbrucki jt { "2018" } avaldatud keskmise orbiidi ja geostatsionaarse tabeli vastu; Galileo kasutajaalgoritm RTKLIB-i vastu neljal päris Galileo edastatud efemeriidil (<c1/>); CRC-24Q kataloogi kontrollväärtuse ja RTCM { "10403" } { "1005" } näitekaadri vastu.

# text
# c1: src/celeste_iod.rs
seg-5c8592195b0d = Eelseaded, igaüks omas failis allikatega: Xona Pulsar ja Pulsar-0, Iridium, Starlink, CentiSpace, esindav C-riba süsteem, ATOMIC ja Celeste IOD (ainus eelseade, mis kasutab ESA NAVISP LEO-PNT töötoas { "2026" } esitatud materjali, hoitud failis <c1/> koos oma stsenaariumidega, nii et seda saab tagasi hoida).

# text
seg-9fb0cbf29cef = Madala Maa orbiidi navigatsioon: liitmine

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
# c5: src/celeste_iod.rs
seg-071f4db017c5 = <b>Liidetud MEO + LEO positsioneerimine, navigatsioon ja aeg: <c1/>, <c2/> ja <c3/>.</b> Kolm uut stsenaariumi liiki kataloogis <c4/>, süsteemist sõltumatud: iga konstellatsioon on Walkeri kihid, elementide komplektid või GNSS-i eelseade, iga signaal kandja, kiibikiirus ja kandelaine ja müratiheduse (C/N0) ümbris, iga veaeelarve selge ühe sigma ning nimetatud madala Maa orbiidi (LEO) süsteemid on valikulised eelseaded, igaüks omas failis oma allikatega, mis on märgitud avalikuks, töötoa- või tuletatuks (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), Starlinki oportunistlikud signaalid, CentiSpace, esindav C-riba süsteem, ATOMIC nullkella efemeriidimudel ja üks ESA Celeste orbiidil demonstratsiooni eelseade, mille töötoast tuletatud parameetrid asuvad failis <c5/>, nii et neid saab tagasi hoida).

# text
# c1: leo-pvt
seg-f28f7a441263 = <c1/> on neli režiimi: Doppleri positsioneerimine (vahemaa muutumiskiiruse partii vähimruudud kellahälbe ja kiiruse olekutega, ainult Doppleri oportunistlike signaalide režiim, ühe läbimise rajasuunaline ja raja-ristisuunaline täpsus ning Doppleri, Doppleri kiiruse ja hoo ümbris); ühine GNSS + LEO kaalutud vähimruudud ühe kellaga süsteemi kohta (süsteemidevaheline nihe) või teadaoleva nihkega, mõõtmispõhised sigmad sisenditena ja DOP LEO satelliitide arvu suhtes; polaar- ja Arktika katvus laiuskraadi suhtes; ning LEO aja edastamine ülemaailmse koordineeritud ajani (UTC) C/N0 ja vastuvõtja ostsillaatori suhtes IS-GPS-200 süsteemiaja ja UTC avaldisega.

# text
# c1: leo-ppp
seg-57afa384aabd = <c1/>: ujuv täppispunktpositsioneerimise (PPP) laiendatud Kalmani filter ionosfäärivabal koodil ja faasil, ainult GNSS ja LEO täiendusega, selle koondumisajaga ning Monte Carlo NEES (normaliseeritud hindamisvea ruut) kooskõlatestiga. Komplekti kuuluv stsenaarium annab { "7.4" } min nelja MEO süsteemiga ja { "4.8" }, { "3.2" }, { "2.7" } ning { "2.3" } min vastavalt { "60" }, { "96" }, { "192" } ja { "288" } LEO satelliidiga, Li jt { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min kõrval (J. Geod. { "93" }:{ "749" }, { "2019" }) suundumuse MODELLED võrdlusena.

# text
# c1: ntn-positioning
seg-3fa0556b3737 = <c1/>: 5G mittemaapealse võrgu (NTN) positsioneerimine 3GPP n256 mobiilsatelliidi S-ribas Cramér-Rao piirist saabumisaja ja Doppleri kohta.

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: leo-ppp-convergence
# c5: ntn-5g-positioning
# c6: polar-arctic-leo-coverage
# c7: leo-timing-utc
# c8: celeste-iod-fused-pvt
seg-a0cc2699e276 = Stsenaariumid: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (komplektis) ja <c8/> (ainult hoidlas, tagasi hoitud koos Celeste IOD eelseadega).

# text
# c1: tests/leo_doppler_reference.rs
# c2: docs/LEO-PNT-FUSION.md
seg-c0b6b98eeac3 = Kaheksa maatriksi rida: LEO Doppleri ümbris VALIDATED avaldatud Iridiumi (±{ "36" } kHz: { "35.9" } kHz, { "5" }% piires) ja Xona Pulsar X1 ({ "32" } kuni { "34" } kHz: { "33.6" } kHz { "97" } kraadi kihist, laienemiseta) arvude vastu (<c1/>); Doppleri positsioneerimine, ühine pseudovahemaa positsioneerimine, PPP koondumine, NTN piirid, LEO aeg, polaarkatvus ja eelseaded MODELLED. Kolm liiki ja kaheksa stsenaariumifaili. Dokumentatsioon: <c2/>.

# text
# c1: leo-pnt-chain
# c2: docs/LEO-PNT.md
seg-173793480abc = <b>LEO-PNT otsast lõpuni: stsenaariumi <c1/>-id ja kokku ühendatud LEO etapid.</b> Üks madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) süsteem, jälgituna selle signaalikavandist kasutaja asendini, iga etapp mootori enda liik oma stsenaariumitabelil, väärtused edastatakse koodis (<a1><c2/></a1>):

# text
# c1: leo-pass
# c2: leo-signal
# c3: signal = "xona-x5"
# c4: iono_free
seg-41a4a2183ba3 = <c1/> ribad võivad nimetada kavandi <c2/> (<c3/>): riba võtab kavandi keskpunkti, saatja ribalaiuse ja jälgitava komponendi kiibikiiruse, jagab oma EIRP (ekvivalentne isotroopselt kiiratud võimsus) kavandi komponentide vahel ning annab iga epohhi jälgitava komponendi C/N0 (kandelaine ja müratiheduse suhe) ja ribapiiratud koodijälgimise värina (ulatusviga; paari <c4/> müra kasutab seda samuti). Kavandita riba annab sama väljundi nagu varem.

# text
# c1: leo-pnt-chain
# c2: leo-pvt
# c3: leo-ppp
# c4: od_sisre_m
# c5: tests/leo_pnt_chain.rs
# c6: LeoNavmsgScenario::broadcast_sisre
seg-a076a43a9d44 = <c1/> käitab signaal -> läbimine -> navigatsioonisõnum -> liidetud <c2/> ühine asendilahendus -> valikuline <c3/>. Iga positsioneerimisetapi LEO süsteem, mis jätab need seadmata, võtab läbimisele sobitatud C/N0 joone sin(kõrgus) kaudu, sõnumi kosmosesignaali vahemaavea (SISRE: selle esitusviga läbimise satelliidi orbiidil koos öeldud orbiidi määramise liikmega <c4/> ruutude summa juurena) ning kavandi kandja ja kiibikiiruse; täppispunktpositsioneerimise (PPP) juhud võtavad SISRE. Iga üleandmine on loetletud oma väärtuse ja ühikuga ning <c5/> kontrollib, et kumbki võrdub ülesvoolu väljundiga ja et ülesvoolu muutused liigutavad allavoolu arve. <c6/> on uus sõnumi sisenemispunkt.

# text
# c1: leo-pnt-end-to-end
# c2: generic-l
# c3: xona-pulsar-end-to-end
# c4: celeste-iod-end-to-end
seg-8c256ed478e9 = Stsenaariumid: <c1/> (üldine { "1080" } km konstellatsioon ja esindav signaal <c2/>), <c3/> (avalik X5 signaal), mõlemad komplektis, ja valikuline, ainult hoidlas olev <c4/>.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: kshana_celeste
# c4: scenarios/*celeste-iod*.toml
# c5: tests/workshop_preset_isolation.rs
seg-879259c7ff86 = Läbimise, sõnumi ja liidetud positsioneerimise valdkondade Celeste IOD (orbiidil demonstratsioon) eelseaded asuvad nüüd ühes failis <c1/>, mille <c2/> kompileerib sisse ainult siis, kui see olemas on (konfiguratsiooni lipp <c3/>). Selle viis stsenaariumi (<c4/>) on ainult hoidlas, nii et selle faili ja nende stsenaariumide kustutamine hoiab tagasi iga arvu, mis esitati ESA NAVISP LEO-PNT töötoas { "2026" }, ilma lähtekoodi muutmata; <c5/> kontrollib, millised failid võivad eelseadet nimetada või selle ribaplaani arve kanda.

# text
# c1: leo-pvt
# c2: t_s
# c3: leo-ppp
# c4: t_min
# c5: leo-pass
# c6: leo-pnt-chain
seg-110b1f7c7c63 = Iga LEO liik täpsema aruande ristviites, mille teespetsiifilised read on loetletud ainult siis, kui jooksutus seda teed kasutas (vihmakiirus, hoone, analüüs või režiim, mis jooksis). <c1/> Doppleri aknad saavad <c2/> ja <c3/> juhud saavad <c4/>, nii et mõlemad animeeruvad; <c5/> ja <c6/> ekspordivad CZML-i, KML-i, GeoJSON-i ja STK efemeriide ning teised LEO liigid ütlevad, miks formaat ei kehti.

# text
seg-1419edea5329 = Madala Maa orbiidi navigatsioon: vastupidavus, fookusvaldkonnad ja lõppkasutaja stsenaariumid

# text
# c1: docs/LEO-PNT.md
seg-d084d86044b4 = <b>LEO-PNT vastupidavus, üks stsenaarium katsefookuse valdkonna kohta ja üks lõppkasutaja vertikaali kohta ning <c1/> kogu LEO liikide ja stsenaariumide ülevaatena.</b> Iga stsenaarium töötab ilma Celeste andmeteta ja kuulub komplekti.

# text
# c1: leo-pass
# c2: [spoofer]
# c3: leo_link::spoof
seg-07e91f076ab2 = <c1/> saab jaotise <c2/>: spuufer võltsib vahemaa ja vahemaa muutumiskiiruse osas isekooskõlaliselt väidetud asendi signaale, mis hüppab ja/või lükatakse tõelisest pärast algust (LEO riba kohta ja MEO GNSS signaal), ionosfääriga või ilma. Kaks monitori töötavad öeldud valehäire tõenäosusel: Doppleri ja läbimise geomeetria kooskõla (mõõdetud vahemaa muutumiskiirused võrreldes nendega, mis on ennustatud orbiitidest ja sõltumatust eelnevast asendist ja kiirusest; üldistatud vähimruutude hii-ruut aknas GNSS, LEO ja kõigil kanalitel, faasilukustussilmuse müra C/N0-st) ja ribadevaheline kooskõla (iga LEO ribapaari mudelikorrigeeritud geomeetriavaba kombinatsiooni samm). Tulemus annab statistikud epohhi kohta (nii et see animeerub), iga paari ja selle, millal iga monitor tuvastab. Ehituskivid failis <c3/>. Jaotise puudumisel on väljund muutumatu.

# text
# c1: leo-pass
# c2: leo-pass
seg-6a7852f1f053 = Iga <c1/> ribapaar annab ka kaldu elektronide koguhulga (TEC), mille selle geomeetriavaba kombinatsioon läbimise tipus taastab, ja selle hinnangu koodimüra sigma (ionosfääri sondeerimine). See lisab kaks välja iga mitmeribalise <c2/> tulemusele; ükski olemasolev arv ei muutu.

# text
# c1: leo-pvt
# c2: trace = true
seg-bdf333f4c978 = <c1/> ajarežiim võtab <c2/>: iga rida annab siis oma ajavea ja ennustatud sigma igal epohhil samade tõmmetega, nii et rea statistikud on muutumatud ning jooksutus animeerub ja aheldub kampaanias.

# text
# c1: docs/INTEROP.md
seg-eb4461740dc5 = Kampaania ekspordib nüüd iga liikmestsenaariumi, millel on geomeetria (faasijooksutused, pühkimise ja Monte Carlo baasstsenaariumid, koostatud liikmed oma seotud ühiste väärtustega), omaette failikomplektina, liikme silt failinimes; varem kampaania midagi ei eksportinud. Koostalituse tabel failis <c1/> muutub vastavalt.

# text
# c1: system.2.sisre_m
seg-c0b1f4d9fed0 = Kampaania pühkimisvõti võib indekseerida tabelite massiivi asukoha järgi (<c1/>).

# text
# c1: leo-resilience-multiband-diversity
# c2: leo-resilience-js-margin
# c3: leo-resilience-spoof-doppler
# c4: leo-resilience-spoof-monitors
# c5: leo-resilience-gnss-jammed-leo-carries
seg-4c995017dd9c = Vastupidavuse stsenaariumid: <c1/> ({ "50" } MHz L5-riba pealetung, pühitud võimsuses: iga L-riba signaal kukub, UHF, S- ja C-riba LEO signaalid säilitavad oma C/N0), <c2/> (J/S varu vastuvõetud võimsusest: GPS L5, Galileo E5a ja Xona X5 kaotatud tasemel -105, -100 ja -95 dBW, -135 dBW üldine LEO signaal jälgib endiselt tasemel -90 dBW), <c3/> ({ "30" } m hüpe, mille ainult GNSS Doppleri test jätab märkamata ja kõigi kanalite test tuvastab { "105" } s pärast algust), <c4/> (neli spuufrit mõlema monitori vastu) ja <c5/> (GNSS segatud, S- ja C-riba LEO kiht jälgitud, vastuvõtja autonoomne terviklikkuse seire ainult LEO kihil annab alarmi { "2" } epohhil { "30" }-st).

# text
# c1: leo-focus-ppp-altitude
# c2: leo-focus-ntn-bandwidth
# c3: leo-focus-iot-eirp
# c4: leo-focus-science-iono-sounding
# c5: leo-focus-data-services
# c6: leo-focus-indoor-uhf
# c7: leo-focus-fused-pnt-sisre
# c8: leo-resilience-multiband-diversity
seg-bae66dac04cc = Fookusvaldkonna stsenaariumid: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (vastupidavus L-, S- ja C-ribas on <c8/>).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: leo-vertical-rail-maritime
# c3: leo-vertical-critical-infrastructure-timing
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-5g-network-timing
# c6: leo-vertical-asset-tracking-iot
# c7: docs/LEO-PNT.md
seg-c7947d9cc592 = Vertikaalide kampaaniad, igaüks animeeritud ja oma LEO läbimisi eksportiv: <c1/>, <c2/> (komplekti kuuluvad mere- ja raudteestsenaariumid pluss LEO), <c3/>, <c4/>, <c5/>, <c6/>. Ühe rea tulemused failis <c7/>.

# text
# c1: tests/leo_resilience_verticals.rs
seg-222ad0b777f8 = Kolm MODELLED maatriksi rida: Doppleri ja läbimise geomeetria spuufimismonitor, ribadevaheline spuufimismonitor ja ionosfääri sondeerimine. <c1/> kontrollib monitore (vaikivad enne algust, Doppleri statistik ruutfunktsioon hüppes, maapealse spuufri ionosfääri samm ja ionosfääri teadliku spuufri puhul selle puudumine), sondeerimise samasust, ajarida rea statistikute vastu ja seda, et kampaania eksport võrdub iga liikme enda omaga.

# text
# c1: leo-pass
# c2: docs/LEO-PASS.md
# c3: docs/LEO-PNT.md
seg-f650b42bf210 = Stsenaariumi <c1/>-id leht liigub faili <c2/>; <c3/> on ülevaade.

# text
seg-00a4ba834f37 = <b>Mere-, maantee- ja raudteestsenaariumid.</b> Viis komplekti kuuluvat näidet olemasolevatel liikidel, nii et laevadel, maanteesõidukitel ja rongidel on igaühel läbitöötatud juhtum. Iga arv on MODELLED; ühtki pole valideeritud mõõdetud andmete vastu.

# text
# c1: scenarios/maritime-strait-jamming.toml
# c2: jamming
seg-682414bbe0c6 = <c1/> (<c2/>): { "50" } W laiaribaline segaja { "30" } m mastil, { "30" } km kaugusel avaveel laevast. Keskmine segaja ja signaali suhe (J/S) umbes { "48" } dB ning kättesaadavus langeb väärtuselt { "1.00" } väärtusele { "0.00" }.

# text
# c1: scenarios/maritime-port-approach-coast.toml
# c2: ins-trn-coast
seg-4666dcd72c24 = <c1/> (<c2/>): navigatsioonitaseme inertsiaalnavigatsioonisüsteem (INS) kiirusel { "12" } sõlme, GNSS kadunud ja ilma toetuseta. See ületab { "10" } m { "281" } s järel ja { "100" } m { "833" } s järel, Rahvusvahelise Mereorganisatsiooni (IMO) resolutsiooni A.1046({ "27" }) sadamasselähenemise ja ookeaniveekogude arvud, mida siin kasutatakse eelarvetena.

# text
# c1: scenarios/maritime-spoof-position-push.toml
# c2: spoof-detect
seg-7407bb97aedd = <c1/> (<c2/>): +{ "2" } dB, mitte kandelainega joondatud spuufer, mis lükkab nelja satelliiti, et lohistada laeva { "500" } m. Liidetud monitor tuvastab selle (skoor { "0.70" } läve { "0.50" } vastu) vastuvõtja autonoomse terviklikkuse seire (RAIM) ja signaali kvaliteedi seire (SQM) abil; ainult võimsuse seire jätab selle märkamata.

# text
# c1: scenarios/automotive-urban-canyon.toml
# c2: gnss-ins
seg-1edc0541930b = <c1/> (<c2/>): auto { "15" } s alt läbisõidu ja { "60" } s teeäärse segaja katkestuse kaudu, { "1.5" } m poole sõidurea eelarve vastu. Liidetud katkestuse ruutkeskmine (RMS) viga on { "1.9" } m autotööstuse klassi mikroelektromehaanilise süsteemi (MEMS) seadme puhul ja { "0.7" } m taktikalise taseme võrdlusseadme puhul; vabalt jooksval seadmel triivib MEMS seade { "850.8" } m-ni.

# text
# c1: scenarios/rail-tunnel-coast.toml
# c2: ins-trn-coast
# c3: kshana example
seg-f9830a49659f = <c1/> (<c2/>): taktikalise taseme INS rongil kiirusel { "160" } km/h tunnelis. See ületab { "2" } m (rööpa eristamine) { "35.8" } s järel, umbes { "1.6" } km sisenemisest, ja { "20" } m { "107.3" } s järel. See on ainult INS: mootoril pole odomeetrimudelit, nii et see on pessimistlik piir. README stsenaariumifailide arv liigub väärtuselt { "77" } väärtusele { "82" }. Kõik viis kuuluvad komplekti käsu <c3/> jaoks ja on loetletud brauseri mänguväljakul.

# text
seg-77c8c53126fd = Model Context Protocoli server

# text
seg-2deb4b35b41a = Model Context Protocoli (MCP) server ulatub iga liigini ja jooksutuse iga vaateni: seitse uut tööriista, kokku neliteist.

# text
# c1: run_scenario
seg-7f4035dfd9db = <c1/> jaotas juba iga liigi; agendil puudus tee liigi kehtiva stsenaariumini ja kolme väljundini, mida käsurida kirjutab tulemuse kõrvale. Uued tööriistad:

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: kshana example
# c4: scenarios/
# c5: lunar-llr-datum
seg-d9df5ab8817a = <c1/> ja <c2/> teenindavad komplekti kuuluvaid etalonstsenaariume (tabel <c3/>), igaüks oma liigi ja oma päise esimese lausega, bait-baidilt fail kataloogis <c4/>. Stsenaarium, mis on hoidlas, kuid ei kuulu komplekti, lükatakse tagasi koos põhjusega. Igal liigil peale <c5/> (mille andmelõik tarnitakse ainult hoidlaga) on vähemalt üks näide.

# text
# c1: report_scenario
# c2: docs/REPORTS.md
seg-cb24ad7147ef = <c1/> annab jooksutuse aruande JSON-ina (JavaScript Object Notation) või prinditava HTML-lehena (HyperText Markup Language) (<c2/>).

# text
# c1: animate_scenario
# c2: docs/ANIMATION.md
seg-9264b2f20e15 = <c1/> annab jooksutuse ajatarja animeeritud SVG (Scalable Vector Graphics) joonisena, HTML esitajana või nummerdatud kaadritena, pärast JSON kokkuvõtet sellest, mis joonistati (<c2/>). Vastus kannab kuni { "120" } kaadrit; käsurida kirjutab mis tahes pikkuse.

# text
# c1: list_export_formats
# c2: export_interop
# c3: import_route
# c4: docs/INTEROP.md
# c5: .e
seg-959f23871238 = <c1/>, <c2/> ja <c3/> teenindavad koostalituse eksporte ja GeoJSON marsruudi importi (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) efemeriid <c5/> ja SigMF (Signal Metadata Format), failide JSON registriga (järelliide, suurus ja SHA-256, 256-bitine Secure Hash Algorithm räsi) ja binaarse SigMF valimifailiga base64 kujul.

# text
# c1: bundled-scenarios
# c2: kshana::bundled_scenarios
# c3: --study
# c4: web/
seg-9ec3f9639b8c = Teek saab vaikimisi väljalülitatud funktsiooni <c1/>, mis avab etalonstsenaariumide tabeli kui <c2/>; ainult MCP server lülitab selle sisse, nii et Pythoni wheel ja WebAssembly moodul ei kanna endiselt stsenaariumi teksti. Uuringukomplektid (<c3/>) jäävad ainult käsurealiidese omaks, sest komplekt nimetab kettal olevaid faile ja server ei loe ühtki. Edasi-tagasi testid käitavad iga uue tööriista komplekti kuuluvate stsenaariumide vastu ja kontrollivad mootori arve: spekter, päikesesüsteem, konstellatsioonid Kuu ja Europa ümber, kampaania pühkimine ning madala Maa orbiidi (LEO) signaali, läbimise, navigatsioonisõnumi, liidetud positsioneerimise, täppispunktpositsioneerimise, mittemaapealse võrgu ja otsast lõpuni liigid. Iga pind, mis nimetab MCP tööriistade arvu või loetleb tööriistad, ütleb nüüd neliteist, välja arvatud mänguväljaku leht kataloogis <c4/>, mis asendatakse saidiga.

# text
seg-c11823028688 = kshana.dev, Kshana Studio ja README

# text
# c1: docs/
# c2: /#playground
# c3: /#ledger
# c4: /#s=<scenario>
# c5: /?embed=1&…
seg-fb584cf84218 = <b>Ümber kujundatud kshana.dev.</b> Üksik mänguväljaku leht on asendatud mitmelehelise saidiga: Home, Missions, Capabilities, Evidence, Developers, Editions ja Docs, Kshana Studio ühe klõpsu kaugusel. Iga selle diagramm, kaart ja arv on selle väljalaske mootori salvestatud jooksutus koos stsenaariumi ja lingiga, mis avab sama jooksutuse uuesti Studios; saidi ehitus lükkab tagasi teise mootori commit'i tehtud salvestuse. Dokumentatsioonilehed genereeritakse hoidla kataloogist <c1/> ja paigaldusvalikud selle kanalitest. Fondid ja skriptiteegid serveeritakse kshana.dev'ist endast, nii et ükski leht ei päri midagi kolmanda osapoole hostilt. Vanad aadressid (<c2/>, <c3/>, <c4/> jagamislingid, <c5/> manuselingid ja ülejäänud) suunavad ümber oma uude kohta ning tundmatu aadress saab { "404" } lehe.

# text
# c1: ?scenario=…&tab=…
seg-9fa1c542332b = <b>Kshana Studio, töölaud iga võimekuse jaoks.</b> Studio avaneb algekraanil valdkonnaplaatide ja headelt esimeste jooksutustega, seejärel viib jooksutuse läbi viie nummerdatud sammu: Vali stsenaarium, Sea selle parameetrid, Käivita mootor kohapeal brauseris, Loe tulemusi (esmalt põhinäitajad, igaüks PASS või FAIL märgiga, kus jooksutus ütleb läve, seejärel paneelid) ja Jaga või ekspordi. Üks otsingukast leiab stsenaariume, valdkondi ja nendes olevaid välju ning hüppab juhtelemendile; jooksutusi saab kinnitada ja võrrelda; leivapuru ütleb, kus ollakse; telefonis muutuvad sammud sammuribaks. Igal stsenaariumi liigil on oma vaade, sealhulgas spektri koskdiagramm, päikesesüsteem, konstellatsiooni katvus, kampaaniad, animatsioon, jooksutuse aruanne, koostalituse eksportid ja madala Maa orbiidi ahel. Süvalink (<c1/>) avab sama jooksutuse nimetatud paneelil.

# text
seg-dcf2788bb430 = <b>Uurimistöö ja tsiteerimine.</b> Lehel Evidence on loetletud viis Kshana artiklit arXivis ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } ja { "2607.06212" }), igaüks koos kokkuvõtte, selle mootoriga arvutatud joonise, seda reprodutseeriva käsu, Studio lingi ja BibTeXiga, tarkvara tsiteerimise juhendi kõrval. README saab sama jaotise Research.

# text
seg-fab395bab130 = Avalik leht Kshana Pro jaoks.

# text
# c1: docs/PRO.md
seg-167a59e94101 = <c1/> ja saidi leht Editions ütlevad, mida suletud lähtekoodiga Pro kiht samale mootorile lisab (kavandioptimeerija, määramatus ja tundlikkus, missioonidosjee, kampaania jälgimine, spektri kooseksisteerimine, kohapealne tööteenus, nõuete jälgitavus), mida iga neist toodab ja mida see ei tee. Iga Pro arv, mida sait näitab, on öeldud selles avalikus lehes. Pro ei lisa ühtki füüsikalist mudelit ja avatud mootor jääb tervikuks ja vabaks.

# text
# c1: tools/gen_readme_assets.py
# c2: tools/capture_studio_shots.mjs
# c3: docs/
seg-f57f0a610943 = <b>Ümber kirjutatud README.</b> Lühikesed jaotised, üks pilt jaotise kohta, Kshana märk, kaks märgirida, genereeritud arhitektuuri-, stsenaariumivoo-, madala Maa orbiidi ahela ja kontrollimise pildid (<c1/>, mis ebaõnnestub aegunud pildi korral) ning Studio ekraanipildid, mis on tehtud töötavast Studiost tööriistaga <c2/>. crates.io, PyPI, npm-i ja MCP serveri README-d järgivad sama kujundust. Pikk viitematerjal on kokku volditud või viidud kataloogi <c3/>.

# text
# c1: <scenario>.report.html
# c2: wrote …
# c3: <scenario>.report.json
# c4: RunOutput::html_report()
# c5: OracleKind::modelled_reason()
# c6: docs/MODELLED-RATIONALE.md
seg-e06522ca762e = <b>Fail <c1/> on nüüd täpsem jooksutuse aruanne</b>, mida kirjeldatakse jaotises Lisatud, ja käsurealiidese rida <c2/> nimetab ka faili <c3/>. Ühelehekülgne tulemuskaart, mille see asendas, on muutumatu kujul <c4/>, mida Pythoni ja WebAssembly sidumised endiselt tagastavad. <c5/> avab lause, mille <c6/> trükib iga MODELLED rea kohta; see dokument on muutumatu.

# text
# c1: result.json
# c2: report.json
seg-77a6f35c5c9a = <b>README ütleb, mille peale Kshana Pro ehitab.</b> Jaotis Editions ja Kshana Pro rida jaotises „Support & professional services“ ütlevad nüüd, mida Pro mudelipõhise süsteemitehnika (MBSE) ja programmi tööriistad teevad ning milliseid avatud mootori avaldatud väljundeid see loeb (iga jooksutuse <c1/> ja <c2/>, stsenaariumifail, väljaühikute skeem ja kontrollimaatriksi sildid) ning millel kella digitaalsed kaksikud, kompromissiuuringud ja tõendipaketid avatud mootoris põhinevad. Ainult sõnastus: mootori väljund ega ükski avaldatud arv ei muutu.

# text
# c1: navsignal::Modulation
# c2: Mboc
# c3: ephemeris
# c4: gcrs_r_m
# c5: gcrs_v_m_s
seg-1a19675ffa3b = <b>Ühilduvus.</b> Avalik enum <c1/> saab variandi <c2/>, mis on katkestav muudatus kutsujale, kes seda ammendavalt sobitab. Stsenaariumi <c3/>-id veerud <c4/> ja <c5/> muutuvad (vt „Avaldatud arvude parandused“). Jooksutuse reprodutseerib endiselt see mootori versioon, mis selle tegi.

# text
# c1: export_table_csv
# c2: telecom-timing
# c3: leo-navmsg
# c4: encode-decode
# c5: kepler16
# c6: kepler-rac
seg-e7c5f77a6602 = <b>MCP serveri <c1/> nimetas ainsatena CSV (komadega eraldatud väärtused) tabeliga neli liiki; tabeli avaldab kuus.</b> Tööriist tagastas tabeli alati stsenaariumile <c2/> ja stsenaariumile <c3/> (selle analüüs <c4/> mudelil <c5/> või <c6/>), kuid selle kirjeldus, keeldumissõnum ja liike loetlevad dokumendid jätsid mõlemad välja, nii et agendile öeldi mitte küsida. Need on nüüd nimetatud ja edasi-tagasi test toob mõlemad tabelid kätte.

# text
seg-4094f58a5f4b = Madala Maa orbiidi (LEO) navigatsioonisõnumi kaader ei olnud samad baidid igal platvormil ega ühe platvormi igas ehituses.

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
# c2: 0x110315
# c3: 0x898BD8
# c4: 0x6A82D9
# c5: leo-navmsg-celeste-iod.toml
# c6: 0x6EDB2D
# c7: 0xC6E4F0
seg-5191262de022 = <c1/> kodeeris kaadri tsüklilise liiasuskontrolliga <c2/> väljalaskeehituses aarch64 macOS-il, <c3/> sama lähtekoodi silumisehituses samal masinal ja <c4/> WebAssembly (WASM) ehituses; <c5/> andis natiivselt <c6/> versus <c7/> brauseris. Kolm põhjust, igaüks jälgitud esimese lahknevuva väärtuseni:

# text
# c1: truth::state_to_elements
# c2: acos
# c3: atan2
seg-f6501c3cd89d = <em>Platvormide vahel.</em> Tõeline orbiit oli mõlemal bitt-bitilt identne; sobituse lähtepunkt ei olnud. <c1/> võtab oskuleeriva kaldenurga funktsioonist <c2/> ja periapsise argumendi funktsioonist <c3/> ning kaks matemaatikateeki ümardavad neid viimases kohas erinevalt (üle { "20 000" } argumendi lähevad need lahku { "781" } siinuse, { "858" } koosinuse, { "1 931" } eksponentfunktsiooni ja { "1 899" } kahe argumendiga arkustangensi puhul).

# text
# c1: sin
seg-cd6f05096b8b = <em>Ehitusprofiilide vahel.</em> Optimeeritud ehitus macOS-il ühendab ühe argumendi siinuse ja koosinuse üheks kutseks süsteemi kombineeritud rutiinile ning selle siinus ei ole üksiku <c1/> oma { "379" } argumendi puhul { "200 000" }-st; optimeerimata ehitus teeb kaks kutset. Stsenaariumi liik võtab siinuse ja koosinuse koos kolmeteistkümnes kohas.

# text
# c1: rand_distr
# c2: exp
# c3: ln
seg-91b0700dcb30 = <em>Kellas.</em> Teegi <c1/> normaaljaotuse valimivõtja kutsub oma kahes harvas harus hosti funktsioone <c2/> ja <c3/>: nelja miljoni algväärtusega tõmbe seas kolm erinesid viimases bitis natiivse ja WASM ehituse vahel.

# text
# c1: src/portable_math.rs
# c2: libm
# c3: Cargo.toml
# c4: leo_navmsg::{truth, fit, elements, codec, sisre, services}
# c5: f64::powi
# c6: portable_math::standard_normal
# c7: _portable
# c8: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c9: the_kind_never_calls_the_host_mathematics_library
# c10: rand_distr
# c11: leo-navmsg
# c12: leo-navmsg
# c13: leo-navmsg
# c14: navmsg
# c15: leo-pnt-chain
# c16: docs/LEO-NAVMSG.md
# c17: 0x110315
# c18: 0x19105F
seg-0a4724333429 = Levenbergi–Marquardti sobitus, mis sellel kaarel peatub oma 80 iteratsiooni piiril, mitte miinimumis, kannab ühe ühiku viimases kohas üle erinevatesse kvantitud väljadesse. Stsenaariumi liik arvutab nüüd iga transtsendentse funktsiooni uue faili <c1/> kaudu, mis kutsub puhast Rust-i teeki <c2/> (juba sõltuvuspuus, nüüd nimetatud failis <c3/>), mis on kompileeritud ühest lähtekoodist iga sihtmärgi jaoks, mitte teegikutsest, mida optimeerija ümber kirjutab: <c4/> ja stsenaariumikood. Täisarvulised astmed sellel teel on kirjutatud välja ruutu tõstmise ja korrutamisena, sest <c5/> täpsus on määratlemata, ja tõelise kella normaaljaotuse hälbed tõmmatakse funktsioonist <c6/> (Marsaglia polaarmeetod generaatori toorväljundil). Jagatud rutiinid, mille kaudu tõeline orbiit integreeritakse, on kirjutatud üks kord, matemaatikateegi suhtes üldistatult, koos kasti sisemise <c7/> sisenemispunktiga olemasoleva kõrval: sfäärilise harmoonilise kiirendus, tsoonilised ja takistuskiirendused, J2 sekulaarsed kiirused ja Klobuchari viivitus. Olemasolevad sisenemispunktid on viimase bitini muutumatud, nii et ühegi teise stsenaariumi liigi arv ei liigu. <c8/> kinnitab kogu 171-baidise kaadri ja ühe kontrollväärtuse iga efemeriidimudeli kohta tavalises (optimeerimata) testiprofiilis igal platvormil ja ilma baashosti väravata; <c9/> loeb stsenaariumi liigi lähtekoodi kettalt ja ebaõnnestub omase transtsendentse kutse, valimivõtja <c10/> või ülevaatamata mooduli kutse korral. Pärast muudatust annavad silumisehitus, väljalaskeehitus ja WASM ehitus kõigi viie stsenaariumi <c11/> jaoks baidi-baidilt identsed tulemusdokumendid. <b>See muudab arve, mis siin parandusena kirjendatakse.</b> Stsenaariumi <c12/>-id on selles väljalases uus, nii et midagi varasemas väljalases avaldatut ei liigu, kuid iga <c13/> arv liigub, natiivselt ja WASM ehituses, ning sellega koos etapp <c14/> stsenaariumis <c15/>: orbiidi arvud, sest sobitus algab nüüd portatiivsetest elementidest, kella arvud, sest tõeline kell on sama protsessi teistsugune realisatsioon. <c16/> genereeritakse uuesti uutest tulemustest; selle avaldatud kontrollväärtus kodeerimise ja dekodeerimise stsenaariumi jaoks oli <c17/> ja on <c18/> (asend { "1.126" } mm piires täpsest sõnumist, kus see oli { "0.665" } mm, kell { "0.185" } mm piires, kus see oli { "0.451" } mm). Muutuste suurus millimeetri murdosa arvudes on sobituse tundlikkus, mitte kummagi komplekti viga: sobitus on muutumatu ja peatub endiselt oma iteratsioonipiiril.

# text
seg-c30f4cef4797 = Algväärtusega ümbervalim tõmbas 32-bitisel sihtmärgil teistsugused indeksid.

# text
# c1: Rng::gen_range
# c2: usize
# c3: eval_stats
# c4: bootstrap_ci
# c5: bootstrap_auc_ci
# c6: impairment_ml
# c7: impairment_study
# c8: portable_math::uniform_index
# c9: u64
# c10: quantum-anomaly-detect
# c11: quantum_auc_ci
# c12: trade.foms[0].ci95
# c13: [0.9901265, 0.9938305]
# c14: [0.99035875, 0.993861]
seg-2bf668e23ec1 = <c1/> tüübi <c2/> kohal võtab generaatorilt { "64" } bitti 64-bitisel hostil ja { "32" } bitti 32-bitisel, nii et sama algväärtus andis teised indeksid ja jättis voo mujale, WASM ehituses. Kolm kohta tõmbasid nii: protsentiilide bootstrapid funktsioonis <c3/> (<c4/>, <c5/>), segamine enne iga treeningläbimist funktsioonis <c6/> ja permutatsioonitest funktsioonis <c7/>. Nüüd tõmbavad need funktsiooni <c8/> kaudu, mis valib alati tüübina <c9/>: täpselt nagu 64-bitine host, nii et ükski natiivne arv ei liigu. <b>See muudab WASM paketi avaldatud arve, mis siin parandusena kirjendatakse:</b> stsenaariumi <c10/>-id kõvera aluse pindala bootstrapi vahemik (<c11/>, <c12/>) oli brauseris <c13/> ja on nüüd natiivne <c14/>.

# text
# c1: /
# c2: Pulsar inclined/S1-0163
# c3: --export stk
# c4: -
# c5: _
seg-80f783da1d4f = <b>STK efemeriidifailide nimed liikuja tunnustest.</b> Liikuja tunnus, milles oli <c1/> või tühik (konstellatsioonikiht ja satelliit, <c2/>), pani käsurealiidese käsul <c3/> paanikasse; iga tunnus läbib nüüd turvalise failiosa (tähed, numbrid, <c4/>, <c5/>).

# text
seg-a0dc5729d5e9 = <b>TEME→GCRS nutatsiooni märk</b>, mida kirjeldatakse ülal jaotises „Avaldatud arvude parandused“, sest see muudab avaldatud väljundit.

# text
# c1: slot-timing
# c2: src/slot_timing.rs
# c3: slot-timing-ocxo-leo
# c4: docs/SLOT-TIMING.md
seg-5ecbf0787f39 = <b>Stsenaariumi liik <c1/></b> (<c2/>): sekundid, kuni vabalt jooksev kell lahkub ajaindekseeritud marsruutimise või ülesandestamise pesa valvest, iga sel hetkel panustav liige koos nimetatud domineerivaga, pärast viimast asendilahendust järele jäänud aeg ning suurim asendilahenduse intervall, mis hoiab kella sees, asendilahenduse latentsuse netona. Kell tuleb klassi vaikeväärtusest, telecom-timing andmelehe eelseadest, otseandmelehest (Alani hälbe maksimumid, vananemine, temperatuurikoefitsient) või mõõdetud faasikirjest. Rikkumine, mis ületab pikima keskmistamisaja, mida allikas toetab, märgitakse ekstrapoleeritud. Komplekti kuuluv näide: <c3/>. Vt <c4/>.

# text
# c1: slot_timing::fit_weighted
seg-40dd4c16b760 = <b>Mõõdetud punase müra põhi.</b> Faasikirje kattuv Alani hälve sobitatakse kaalutud vähimruutudega valge faasi ja IEEE Std { "1139" } sagedusmodulatsiooni baasis (<c1/>), iga punkt kaalutud oma ekvivalentse vabadusastmete arvuga, nii et holdover'i vastus võib toetuda kella enda põhjale klassi eelduse asemel. Kaalumata sobitus pani valge müra testikirjele võlts-flikkerpõhja ja lühendas { "2 000" } s rikkumist { "30" } % võrra.

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: realdata-clock
seg-22c09748488b = <b>Holdover'i pöördamise suletud komplektiga valideerimine päris kellal</b> (<c1/>): sobitatud 5071A tseesiumi ja vesinikmaseri kirje esimesele kolmandikule, jäävad ennustatud ühe sigma rikkumised kuuel lävel vahemikus { "0.5" } kuni { "2.5" } ns väärtuse { "0.84" } kuni { "1.03" } piiresse teisel kahel kolmandikul mõõdetud rikkumistest, lävi { "1.5" } fikseeriti enne testi esimest käitamist. Kontroll (ühesekundiline Alani hälve loetud valge müraga) eksib umbes { "1 000" }-kordselt ja ei täida lävendit. Uus VALIDATED registri (ledger) rida; töövoog <c2/> käitab seda nüüd.

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: scripts/fetch_ocxo.sh
# c3: fix_frequency_sigma
seg-cd73dc87a22f = <b>Sama ennustus päris kristallostsillaatoril</b> (<c1/>, <c2/>): mõõdetud ahjuga juhitud kristallostsillaatoril on suletud komplektiga ennustus konservatiivne, { "0.59" } kuni { "0.70" } mõõdetud rikkumisest ega kunagi hilisem, ja enamasti lävendi { "1.5" } väljaspool, sest selle ostsillaatori mürapõhi vähenes 5,5-tunnise kirje jooksul poole võrra; valimis sobitatuna jääb see piiridesse { "0.98" } kuni { "1.17" }. Kristallijuhtum ei ole valideeritud ja jääb MODELLED. Jooksutus paljastas ka puuduva liikme: kristalli sagedus hulbib, nii et mudel kannab nüüd asendilahenduse hetkel teada oleva sageduse määramatust (<c3/>); ilma selleta oli ennustus optimistlik kuni { "2.5" }× võrra.

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-8519979d184c = <b>Sama ennustus orbiidil olevatel aatomkelladel</b> (<c1/>, <c2/>): { "14" } päeva International GNSS Service'i lõplikke kelli GPS Block IIF satelliitidele, protokoll kirja pandud enne andmete allalaadimist. Kaheksa kümnest satelliidist jääb lävendi { "1.5" } sisse; G25 ja G30 ennustavad rikkumisi kuni umbes kaks korda hilisemaks kui mõõdetud. Protokoll nõuab, et iga satelliit läbiks, nii et orbiidi juhtum ei ole valideeritud ja jääb MODELLED; tulemus on kinnitatud.

# text
# c1: ClockClass::Tcxo
# c2: Ocxo
# c3: Rafs
# c4: ClockClass::source
# c5: ClockClass::ALL
# c6: id
# c7: from_id
# c8: quantum-trade
# c9: baseline_clock_class
seg-0d666a725b77 = <b>Temperatuuriga kompenseeritud kristalli (TCXO), ahjuga juhitud kristalli (OCXO) ja rubiidiumi aatomsagedusstandardi (RAFS) kellaklassid</b> (<c1/>, <c2/>, <c3/>), osad, mida lennutab kaubanduslik väikesatelliidi buss või maapealne lüüs, igaüks tsiteerib ühte avalikku andmelehte (<c4/>). Lisatud <c5/>, <c6/> ja <c7/>. Stsenaariumi <c8/> parameeter <c9/> aktsepteerib kolme uut tunnust. Avaliku enumi variantide lisamine on katkestav muudatus kutsujale, kes seda ammendavalt sobitab.

# text
# c1: src/orbital_timing.rs
# c2: slot-timing
# c3: spoofing
# c4: tpl::timing_protection_level_ns
seg-24ae82b115f5 = <b>Ajakaitsetase orbiidil olevale vastuvõtjale</b> (<c1/>, stsenaariumi <c2/>-id valikuline jaotis <c3/>): kui kaua maapealne spuufer võib madala Maa orbiidi satelliidini ühe läbimise jooksul ulatuda, tõmme, mille öeldud maksimaalse kasvukiirusega spuufer kogub, enne kui satelliit lahkub selle ulatusest või jookseb sõltumatu kontroll, ning kas iga maakontakti- või ristlingi kontroll on sellest spuuferist sõltumatu. Taandub täpselt funktsioonile <c4/> kellal ilma flikker-, valge faasi või juhusliku jooksu müra. MODELLED.

# text
# c1: docs/SLOT-TIMING.md
# c2: docs/DECEIVED-TIME.md
# c3: docs/DEPLOYMENT-TARGETS.md
# c4: no_std
seg-4032bc03fad5 = <b>Kolm märget</b>: <c1/> (sealhulgas see, millise hulkumismõõdiku vastu tuleks pesa vastu võtta: maksimaalne absoluutne ajaviga, mitte maksimaalne ajaintervalli viga ega ajahälve, ja miks), <c2/> (petetud ajal rakendatud allkirjastatud käsk suunab endiselt valesti) ja <c3/> (kus Kshana töötab; <c4/> lennutuuma ei pakuta).

# text
# c1: kshana
# c2: kshana-mcp
seg-712035e19515 = Väljalase { "v0.27.3" } jõudis crates.io-sse (<c1/> ja <c2/>) ja PyPI-sse, seejärel peatus npm-is, nii et npm, ghcr.io MCP kujutis, MCP register, JetBrains Marketplace ja kshana.dev ei saanud seda kunagi kätte. { "0.27.4" } kannab sama mootori koos allpool oleva väljalaskeparandusega igasse kanalisse.

# text
# c1: npm-dist/kshana-0.27.3.tgz
# c2: owner/repo
# c3: github.com/npm-dist/kshana-0.27.3.tgz
# c4: ./npm-dist/*.tgz
seg-bab8d4d1bc54 = <b>npm-i avaldamise samm nimetab tarballi selge teega.</b> npm loeb paljast <c1/> GitHubi lühendiks <c2/>, nii et { "v0.27.3" } npm-i töö üritas kloonida <c3/> ja ebaõnnestus teatega „Permission denied (publickey)“. Tarball ise oli ehitatud ja atesteeritud. Samm avaldab nüüd <c4/>. Kõik pärast npm-i väljalaskejärjekorras (MCP kujutis, JetBrains plugin, kanalite pariteedi kontroll ja sait) jäeti vahele, nagu kavandatud.

# text
# c1: gnss-ins
seg-f9a112755eb1 = <b>Telecom-timing ja <c1/> ühikute kataloogid on kopeerimise ja kleepimise tuvastamisest vabastatud</b>, sama poliitika ja põhjendustesti alusel nagu teised kataloogid. SonarCloudi kvaliteedivärav oli uue koodi dubleerimise tõttu punaseks läinud ({ "4.0" }% versus { "3" }%) ning iga dubleeritud plokk oli ühikute rida või ITU-T maski kirje.

# text
# c1: scenarios/small-uas-jammed-nav.toml
# c2: jamming-demo.toml
# c3: kshana example small-uas-jammed-nav
seg-3c3dacae06d6 = <b><c1/>: kui kaua väikese drooni navigatsioon peab vastu pärast GNSS-i segamist.</b> See käitab lennujuhtimisklassi mikroelektromehaanilist (MEMS) inertsiaalseadet Bosch BMI088 taktikalise taseme seadme vastu. GNSS (ülemaailmne satelliitnavigatsioonisüsteem) signaal on nominaalne { "100" } s, seejärel keelatud { "60" } s (<c2/> näitab, miks lähedal olev segaja seda teeb). BMI088 nihked on jäägid, mis jäävad pärast käivituskalibreerimist, võetud selle andmelehe temperatuurikoefitsientidest (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s K kohta güroskoobile ja < { "0.2" } mg K kohta kiirendusmõõturile. Failis on märgitud kaks eeldust: { "10" } K soojenemine pärast kalibreerimist ja jätkuv soojenemine { "1" } K minutis lennul. Lennuaegne triiv on viga, mida filter ei jõua enne segamise algust õppida, ja see lõpetab rannikusõidu. Iga arv on modelleeritud; selle valideerimiseks on vaja segatud keskkonna lennulogisid. <c3/> trükib selle.

# text
# c1: gnss-ins
# c2: [imu_quantum.filter_prior]
# c3: [imu_classical.filter_prior]
# c4: sigma_accel_bias
# c5: sigma_gyro_bias
seg-7154f69a2b8a = <b>Iga stsenaariumi <c1/> andur saab seada oma filtri eelteadmise</b> (<c2/> või <c3/>, koos <c4/> ja <c5/>). Vaikeväärtus on muutumatu, nii et iga olemasolev stsenaarium annab sama tulemuse. Tarbijaklassi seadme jääkgüroskoobi nihe asub umbes { "26" } sigmat taktikalise taseme vaikeväärtusest väljas, kus filter ei õpiks seda kunagi. Eelteadmine, mis ei ole lõplik ja positiivne, lükatakse tagasi ning tulemus kordab eelteadmist, kui see on seatud.

# text
# c1: kshana example [<name>]
# c2: cargo install kshana
# c3: scenarios/
# c4: scenarios/
# c5: src/bundled_scenarios.rs
# c6: kshana example
# c7: kshana example clock-holdover > clock-holdover.toml
# c8: lunar-llr-datum
# c9: quantum-pnt-demonstrator.suite
# c10: --study
# c11: tests/cli_first_run.rs
seg-2b54735b19aa = <b><c1/> annab registrikasutajale stsenaariumi käitamiseks.</b> Kasutajal <c2/> on käivitusfail ja kataloogi <c3/> pole, nii et esimene käsk, mille iga kiirstart andis, ebaõnnestus. Käsurealiides (CLI) kannab nüüd { "75" } etalonstsenaariumi, mis jooksevad üksi, bait-baidilt, kompileeritud kataloogist <c4/> (<c5/>; tabel asub CLI binaaris, nii et Pythoni wheel ja WebAssembly moodul ei kasva). <c6/> loetleb need; <c7/> kirjutab ühe. Teised kaks faili on ainult hoidlas: <c8/> loeb arhiveeritud kuu laservahemõõtmise andmeid, mis tarnitakse ainult hoidlaga, ja <c9/> on uuringumanifest, mis käitab kolm kõrvalfaili käsuga <c10/>. Kummagi küsimine ütleb põhjuse ja lõpetab koodiga { "2" }, selle asemel et trükkida midagi, mis ei saa üksi jooksta. <c11/> hoiab tabeli kataloogiga kooskõlas mõlemas suunas, nii et uus stsenaariumifail, mis ei kuulu komplekti ega ole nimetatud ainult hoidlas olevaks, ebaõnnestub.

# text
# c1: figure_tiers
# c2: quantum.fom.timing_p95_ns
# c3: src/verification.rs
# c4: src/fom_label.rs
# c5: hybrid
# c6: fusion
# c7: untiered
# c8: tests/registry_golden.rs
# c9: tests/cross_platform_golden.rs
seg-43249b6a1f3c = <b>Iga kella, orbiidi, hübriid- või liitmistulemuse näitaja ütleb nüüd tulemuses endas, kas see on VALIDATED või MODELLED.</b> Tulemusdokument saab ploki <c1/>, alati selle viimase võtmena. See loetleb iga teatatud näitaja (näiteks <c2/>) selle tasemega — VALIDATED tähendab kontrollitud sõltumatu välise sõltumatu etaloni vastu, MODELLED tähendab esimestest printsiipidest mudelit, mida testitakse sisemiselt — ja kontrollimaatriksi reaga, millest tase loetakse. Tase tuleb failist <c3/> faili <c4/> kaudu, nii et teist tabelit, mis laiali läheks, pole. Enne seda esinesid sõnad „valideeritud“ ja „modelleeritud“ kella holdover'i tulemuses null korda ning toorest JSON-i (JavaScript Object Notation) lugev lugeja ei saanud neid kahte eristada. Positsiooninäitajatel <c5/> ja <c6/> pole omavat maatriksi rida, nii et need on loetletud kategoorias <c7/> taset andmata. Plokk ei kanna arve. See on tõestatud lisandiks, mitte eeldatud: selle eemaldamine annab muudatuse-eelse dokumendi tagasi bait-baidilt kõigi viie liigi puhul (mootori test) ja mõlemad golden-harnessid (<c8/>, <c9/>) eemaldavad nüüd täpselt selle võtme, ja ainult siis, kui see on viimane, seejärel räsivad ülejäänu oma <b>muutumatute</b> külmutatud konstantide vastu. Loend igas harnessis kinnitab, millised stsenaariumid peavad plokki kandma, nii et väljajätt ei saa vaikselt laieneda.

# text
# c1: telecom-timing
# c2: docs/TELECOM-TIMING.md
seg-8faf1981d797 = <b>Stsenaariumi <c1/>-id vastab ajastusinseneri ühikutes: ajaviga, maksimaalne ajaintervalli viga (MTIE) ja ajahälve (TDEV), igaühel PASS või FAIL ja varu Rahvusvahelise Telekommunikatsiooniliidu telekommunikatsioonistandardimise sektori (ITU-T) maskide vastu.</b> Maskid on ümber kirjutatud kehtivatest väljaannetest: G.8272 (07/2025) esmase etalonaja kella (PRTC) klassidele A ja B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) täiustatud PRTC jaoks lukustatud režiimis ja holdover'is (sealhulgas selle ajavea ümbris, mis tõuseb { "30" } ns-lt { "100" } ns-ni holdover'i perioodi jooksul, mille määrab see, kui kaua kell oli lukustatud), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) telekommunikatsiooni piiri- ja ajaorjakellade jaoks, klassid A kuni D, ja G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) võrgupiiridele tugipunktis C. Iga kirje, mille need soovitused jätavad „edasiseks uurimiseks“, on puudu, mitte hinnatud, ja <c2/> loetleb iga arvu koos selle tabeli või klausliga ning iga väljajäetud punkti. Aruanne annab ka aja, mil iga ajavea eelarve ületatakse: vaikimisi { "100" } ns ePRTC holdover'i vaikeväärtus, { "400" } ns võrgu holdover'i jaotus, { "1 100" } ns punkti C piir ja { "1.5" } mikrosekundi klassi { "4" } otsast lõpuni nõue.

# text
# c1: [time_s, time_error_ns]
seg-9e5325e1b0ca = Sisend on kas sünteetiline holdover või oma jada. Sünteetiline kasutab ühte nelja ostsillaatori eelseadest (ahjuga juhitud kristallostsillaator, rubiidiumstandard, tseesiumstandard ja kiibiskaalas aatomkell), igaüks kannab nimetatud Microchipi andmelehe stabiilsuse, vananemise ja temperatuuri arve. Kuidas need arvud muutuvad valgeks, flikker- ja juhuslikuks kõnnisageduse müraks, vananemiseks ja temperatuuriliikmeks, on öeldud igas aruandes ja märgitud MODELLED. Oma jada on paarid <c1/>, otse (nii see brauseris jookseb) või natiivsetes ehitustes komadega eraldatud väärtuste failist. MTIE/TDEV tabel, iga valitud maski piiriga selle kõrval, kirjutatakse jooksutuse CSV artefaktina.

# text
# c1: scenarios/telecom-prtc-holdover-24h.toml
# c2: scenarios/telecom-tie-ingest.toml
seg-a23a96819dee = <c1/> on 24-tunnine rubiidiumi holdover vananemise, flikkeri ja ööpäevase temperatuuritsükliga: selle suurim ajaviga on { "603.2" } ns, see ületab { "100" } ns { "8 206" } s pärast kadu ja jääb kogu päeva { "1.5" } mikrosekundi sisse ning ei täida täiustatud PRTC holdover'i ümbrist, nagu kell, mis pole tseesiumiklassi, peabki. <c2/> näitab otsesisendit. Stsenaariumi liigi teatatud MTIE ja TDEV on kontrollitud paketi allantools vastu kinnitatud { "2" } 048 valimiga holdover'i jadal, MTIE täpselt ja TDEV { "1.1e-15" } piires, nii et maatriks saab ühe VALIDATED rea ja kaks MODELLED rida (maski ümberkirjutus ja eelseaded) ning on nüüd <b>{ "171" } rida — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. Väljaühikute katvus läheb { "60" }-lt { "61" } liigist väärtusele { "61" } { "62" } liigist ja { "1,742" } kirjeldatud väljalt väärtusele { "1,788" }. Stsenaariumi liik on uus ja lisanduv: ükski olemasolev stsenaarium, kinnitus ega avaldatud arv ei liigu.

# text
seg-5bb1ad9a34ec = Mänguväljak käitab mootorit taustal Web Workeris, nii et aeglane stsenaarium ei külmuta enam lehte.

# text
# c1: web/engine-worker.mjs
# c2: web/engine.mjs
# c3: cislunar-arc-recovery
seg-b1ab3546f131 = <c1/> hostib WebAssembly mootorit ja <c2/> suunab sellele iga stsenaariumi täitmise — jooksutused, parameetripühkimised ning SP3 / OMM / OEM / CSV eksportid. Jooksutus, mis kestab üle { "150" } ms, näitab hõivatud olekut (Run keelatud, „Running… N s“) ja nuppu Cancel, mis lõpetab ja taaskäivitab workeri; brauser, mis ei saa moodulworkerit käivitada, langeb tagasi vanale põhilõime teele. <c3/>, mis jäeti kataloogist välja, sest see külmutas lehe, on tagasi selles, märgitud aeglaseks: see võtab Chrome'is umbes { "13" } s (neli mootorikutset umbes { "3" } s kaupa), mille jooksul leht jääb reageerivaks.

# text
# c1: cislunar-observability
seg-146200dfac7e = <b>Iga stsenaariumi <c1/> teatatud suurus kannab nüüd ühikut, päritoluklassi ja määratlust — viimane liik, välja arvatud üks, kogu kasti hõlmavas erandite loendis.</b> Kõik { "41" } RELEASED dokumendi arvuvälja on kirjeldatud, nii et väljaühikute katvus läheb { "59" }-lt { "61" } liigist väärtusele { "60" } { "61" } liigist ja { "1,698" } kirjeldatud väljalt väärtusele { "1,742" }, määratluseta mahajäämus on muutumatult { "239" }.

# text
# c1: units
# c2: units
# c3: expect_summary
seg-61b1219ae0e3 = Seda blokeeris kinnitus, mis külmutab välja antud dokumendi ja mis nimetas <c1/> võtmena, mida dokument ei tohi kunagi juurde saada. Selle lisamine oleks tähendanud selle väite kustutamist ja kolme räsi uuesti baseerimist kolmes failis — kuju, mida ei saa eristada regressiooni varjamisest. Selle asemel <em>tõestavad</em> kaks kinnitust, mis seda dokumenti mõõdavad, nüüd, et lisandus on lisanduv: kumbki eemaldab ploki <c2/> tagasi ja räsib uuesti enne ploki olemasolu külmutatud konstandi vastu ning <b>mõlemad konstandid on muutumatud</b>. Mutatsioon kinnitab, et garantii on päris — väljalastud väärtuse liigutamine ja kogu dokumendi räsi uuesti baseerimine nii, nagu hooletu parandus seda teeks, ei takista siiski eemalda-ja-räsi-uuesti ebaõnnestumist. Kolmas kinnitus üldises registri golden-harnessis on uuesti baseeritud kooskõlas kuue õdega, mis uuesti baseeriti täpselt sel põhjusel, ja selle väärtust kandev <c3/> literaal ei liigu.

# text
# c1: realtime-frame-eop
seg-a73409e0b664 = <c1/> teatab, millise tõe vastu iga Maa orientatsiooni rida hinnati ja kui sageli varuvariant rakendus.

# text
# c1: table3_joint_eop[].{ut1, polar_motion,combined}
# c2: truth_source
# c3: truth_fallback_rows
# c4: final
# c5: dN
# c6: truth_pm()
# c7: truth_ut1()
seg-6e0493a39f1a = <c1/> saavad <c2/> ja <c3/>. Põhi <c4/> hinnatakse Bulletin B lõpliku vastu ja see saab kasutada ainult epohhe, mis ühe avaldavad; iga <c5/> rida hinnatakse funktsiooni <c6/>/<c7/> vastu, mis langevad tagasi Bulletin A kiirele väärtusele. Komplekti kuuluval { "2026" } väljavõttel on see { "12" } valimit { "31" }-st ühe päeva juures, versus { "0" } põhjal — nii et põhjarida ja selle kõrval olevad ennustusread toetuvad mõõdetavalt erinevale tõele, mida aruanne nüüd ütleb, selle asemel et jätta see järeldada valimiarvust, mis kasvab seal, kus pesastatud horisondid ütlevad, et see ei saa.

# text
# c1: moonlight-service-volume
seg-7ba5be07fa8c = <c1/> annab suuruselt sobitatud Kepleri baasjoone.

# text
# c1: ephemeris_comparison.keplerian_matched
# c2: 360k/n
seg-f9dc8fae6452 = <c1/> jooksutab illustratiivse konstellatsiooni uuesti RETRIEVED komplekti enda satelliitide arvuga, olemas ainult siis, kui arvud erinevad. Arv on selle kavandi geomeetria osa — RAAN ja keskmine anomaalia on mõlemad jaotatud kujul <c2/> — nii et ilma selleta hinnati viiest satelliidist saadud komplekti kaheksa satelliidiga illustratiivse komplekti vastu ning kavand ja suurus aeti segi. Viie satelliidiga LANS etalonkomplekti puhul osutub 14,24-punktilisest katvuslõhest { "8.68" } kolmeks puuduvaks satelliidiks ja ainult { "5.56" } punkti kavandiks; nelja tegelikult Kuu orbiidil oleva kosmoselaeva puhul saavutab sihipäraselt ehitatud neljasatelliidine komplekt { "4.86" } %, kus need saavutavad { "0" } %. Test kinnitab, et sobitatud rida on uuesti ehitatud konstellatsioon, mitte seatud konstellatsioon ümbernimetatud, nagu see algselt kirjutati ja mida jooksutus siis teatas.

# text
seg-2e7e4dbbb7f6 = <b>Üheksa võimekuse kaarti avalikul saidil, mis katavad { "22" } kontrollimaatriksi rida, mis tarniti ilma tootetasandi kaardita.</b> Mootor oli kasvatanud võimekuste perekonna — ARAIM kontroll avaldatud Working Group C etalonvektorite vastu, päris saadud Kuu konstellatsiooni geomeetria, Kuu keelamise kontuur mõõdetud C/N₀ ribaga, VLBI-ajakava ja jaama kovariatsiooni samm, optiline ja RF üleandmine ristmodaalse rikkesüstimisega, reaalajas Maa orientatsiooni ennustus arhiveeritud Bulletin A vastu, navigatsiooni ja side avause jagamine, INS/TRN rannikusõit ning ühikute ja päritolu katvus — igaühel oma maatriksi rida ja komplekti kuuluv stsenaarium ning ühtegi neist ei nimetatud saidil kshana.dev. Kaardi ja rea katvus läheb { "72" }-lt { "168" } realt väärtusele { "94" }.

# text
# c1: web/app.js
# c2: tests/scenario_examples_doc_sync.rs
# c3: run
# c4: scenarios/
seg-3dc189224fe8 = <b>Mänguväljaku kataloogi lisati kaheksa stsenaariumi.</b> Võimekuse kaardi nupp Run ilmub ainult siis, kui <c1/> kannab ka faili; kuus kaarti nimetasid stsenaariumi, mida see ei kandnud, nii et need renderdati ilma võimaluseta neid käitada — üks neist, päris laservahemõõtmise andmepunkt, oli selles olekus alates tarnimisest. <c2/> kontrollib nüüd invarianti mõlemas pooles: kaardi sihtmärk <c3/> peab olema komplektis kataloogis <c4/> <em>ja</em> kataloogi pakutav. Mutatsioonitestitud mõlema rikkerežiimi vastu.

# text
# c1: moonlight-service-volume
# c2: <scenario>.table.csv
seg-2d69334516e9 = <b>Stsenaariumi <c1/> väljastab oma satelliidipõhise geomeetria failina <c2/></b>, kui eksportimiskoht on seadistatud (G11). See on suurim massiiv, mille kast avaldab — { "2304" } rida välja antud ühises side- ja navigatsioonitabelis — ja see jõudis tarbijateni ainult JSON-i sees, kujul, mis lühendas õdestsenaariumi 57-punktilise kõvera { "23" } punktini veeru all, mis väitis neid kõiki. Üks rida lingi kohta, ridade arv päisereal, antennide veerud olemas ainult siis, kui antenn oli seadistatud. Jooksutus ilma eksportimiskohata on baidi-baidilt muutumatu ega kirjuta faili.

# text
seg-7958d26072f7 = SBOM kirjeldab nüüd seda, mis tarnitakse: { "60" } komponenti sai { "66" }-ks.

# text
# c1: scripts/gen-sbom.sh
# c2: sgp4
# c3: chrono
# c4: --features python
# c5: pyo3
# c6: pyo3-ffi
# c7: pyo3-macros
# c8: pyo3-macros-backend
# c9: pyo3-build-config
# c10: portable-atomic
# c11: target-lexicon
# c12: heck
# c13: python
# c14: wasm
# c15: expression
seg-219cd333b000 = <c1/> loetles iga vaikefunktsioonide lahenduse paketi, sealhulgas arendussõltuvused. See pani materjalide loendisse <c2/> ja <c3/> — ainult testimiseks mõeldud craty, mis pole ühtegi artefakti kompileeritud — ja jättis välja ahela <c4/>, millega PyPI wheel lingib (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), mis on selle wheel'i võõrfunktsioonide piir. Skript käib nüüd lahenduse graafi läbi paketist kshana ainult tavaliste ja ehitusservade kaudu, vaikimisi, <c13/> ja <c14/> funktsioonikomplektide liidu kohal (npm-i pakett kannab sedasama SBOM-i), iga sihtplatvormi jaoks. Kinnitatud CycloneDX standardi järgimise otsus baseeritakse uuesti selle kinnitatud generaatori kaudu: { "60" } → { "66" } komponenti, { "53" } → { "60" } liitlitsentsiavaldist ja endiselt null skeemiviga, kui need on paigutatud standardsesse kujusse <c15/>.

# text
# c1: export_table_csv
# c2: <scenario>.table.csv
# c3: realtime-frame-eop
# c4: lunar-time-budget
# c5: lunar-jamming
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: table_csv
# c10: undefined
# c11: tests/golden/realtime-frame-eop.csv
# c12: RunOutput.write_csv
seg-23c98d31f749 = <b>CSV reprodutseeritavuse tabel jõuab igale uksele, mitte ainult käsurealiidesele ja Pythoni wheel'ile.</b> MCP server saab seitsmenda tööriista, <c1/>, mis jooksutab stsenaariumi ja tagastab baidistabiilse tabeli, mille käsurida kirjutab failina <c2/> — või vea, mis nimetab liigid, mis seda avaldavad (<c3/>, <c4/>, <c5/> ja <c6/> ainult siis, kui <c7/> + <c8/> on seatud). WebAssembly moodul saab funktsiooni <c9/>, mis tagastab sama teksti või <c10/>. MCP edasi-tagasi test ja Pythoni sidumise testid kinnitavad nüüd tagastatud CSV-d bait-baidilt faili <c11/> vastu ning kinnitavad, et <c12/> tagastab kirjutatud baidid ja väärtuse { "0" } ilma faili loomata liigi puhul, millel tabelit pole. Iga pind, mis nimetab MCP tööriistade arvu või loetleb tööriistad, ütleb nüüd seitse.

# text
# c1: run_all
seg-86c3fed5e23a = <c1/> WebAssembly moodulis: üks mootori jooksutus iga väljundi jaoks.

# text
# c1: run
# c2: chart_svg
# c3: summary
# c4: table_csv
# c5: cislunar-arc-recovery
# c6: run_all
# c7: {json, svg, summary, csv}
seg-3f2677cd280b = <c1/>, <c2/>, <c3/> ja <c4/> täidavad igaüks stsenaariumi otsast peale, nii et mänguväljak maksis iga klõpsu eest nelja täisjooksutuse — umbes { "12" } s asemel { "3" } s stsenaariumi <c5/> jaoks brauseris. <c6/> tagastab <c7/> ühest jooksutusest ja mänguväljak kasutab seda nüüd. See ühtib nelja eraldi kutsega bait-baidilt.

# text
# c1: gnss-ins
# c2: +C_b^n b_a
# c3: −C_b^n b_g
# c4: +C_b^n b_g
# c5: scenarios/gnss-ins.toml
seg-fa05c9ee0c6a = <b>PARANDUS: GNSS/INS filtri güroskoobi nihke sidestusel oli vale märk ja stsenaariumi <c1/> katkestuse arvud muutuvad.</b> Veaoleku laiendatud Kalmani filter (EKF) hoiab mõlemat inertsiaalset nihet jääkidena (tõeline miinus jooksev hinnang, tagasi toidetud liitmisega). Kiirendusmõõturi veerg juhtis kiiruse viga väärtusega <c2/>, kuid güroskoobi veerg juhtis orientatsiooniviga väärtusega <c3/>. Jääkgüroskoobi nihe pöörab arvutatud orientatsiooni tegelikult väärtusega <c4/>, nii et iga güroskoobi nihke hinnang lükkas vales suunas. Pakett püsis stabiilne ainult seetõttu, et selle vaikimisi güroskoobi nihke eelteadmine ({ "1e-4" } rad/s, 1-sigma) oli piisavalt kitsas nende olekute paigal hoidmiseks. Laiema eelteadmisega filter hajus ka siis, kui tõeline güroskoobi nihe oli null: { "93" } m liidetud katkestuse viga sai { "4.3" } km-ks. Stsenaariumi <c5/> avaldatud arvud muutuvad järgmiselt:

# text
seg-47e22e713df6 = enne (≤ { "0.27.2" })

# text
seg-5215a0a41b89 = pärast

# text
seg-f58aecc6864c = külma aatomi IMU, liidetud katkestuse RMS

# text
seg-c4fbd933ddb2 = { "96.1" } m

# text
seg-002d765fca02 = { "1.9" } m

# text
seg-d14616d4ea1b = külma aatomi IMU, nõuetekohane rannikusõit ({ "50" } m)

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-91645c14401b = { "60" } s (kogu katkestus)

# text
seg-f297a2652cf8 = taktikaline IMU, liidetud katkestuse RMS

# text
seg-0ac27c6d4206 = { "62.5" } m

# text
seg-eda895cc3b86 = { "3.1" } m

# text
seg-e0ab83f1d8d7 = taktikaline IMU, nõuetekohane rannikusõit ({ "50" } m)

# text
seg-5c526991a521 = { "37" } s

# text
# c1: tests/gnss_ins_sensor_fusion_reference.rs
# c2: closed_loop.rs
# c3: gnss-ins
seg-743060da5543 = Vabalt jooksvad arvud ({ "130.7" } m ja { "314.3" } m) ei muutu; need ei kasutanud kunagi filtrit. Paketi varasem lugemine, et liidetud rannikusõitu piirab üleandmise orientatsioonipõhi ja see seetõttu parema anduriga ei parane, oli selle vea artefakt ja see võetakse tagasi. Konstantsete, müravabade nihete korral õpib filter need nüüd ära, kuni GNSS on olemas, nii et liidetud rannikusõit on parim juhtum. Väline filterpy etalon (<c1/>) kontrollib ainult mõõtmisuuendusi, mistõttu see ei näinud kunagi levitamist. Kaks testi kontrollivad nüüd märki otse ja mõlemad ebaõnnestuvad vana märgi korral. Esimene, failis <c2/>, söödab teadaoleva jääkgüroskoobi nihke läbi strapdowni ja nõuab, et filter ennustaks tekkiva orientatsiooniveaga { "2" } % piires. Teine nõuab, et lai eelteadmine õpiks { "1e-3" } rad/s güroskoobi nihke ja püsiks { "6" } m sees. Stsenaariumi <c3/> platvormideülene golden on selleks põhjuseks uuesti kinnitatud ja ühelgi teisel.

# text
# c1: scenarios/clock-holdover.toml
# c2: TypeError: fetch failed
# c3: init()
# c4: fetch
seg-f764678e3376 = <b>Iga registri kiirstart töötab nüüd puhtal masinal nii, nagu on kirjutatud.</b> Enne seda muudatust mõõdetult lugesid crates.io ja PyPI (Python Package Index) näited <c1/>, mida registripaigaldus ei sisalda, ja npm-i näide jooksis Node.js-is kokku veaga <c2/>, sest paketi <c3/> toob oma WebAssembly binaari ja Node'i <c4/> ei saa lugeda kohalikku faili. Nüüd:

# text
# c1: README.crates.md
# c2: README.pypi.md
# c3: README.npm.md
# c4: main
# c5: # Ok::<…>
# c6: tests/readme_code_fences_doc_sync.rs
seg-e77a540d2f90 = <c1/> ja <c2/> kannavad seda stsenaariumi otse, nagu <c3/> juba tegi. Rust-i plokk on terve programm oma funktsiooniga <c4/>, sest rustdoc'is peidetud rida <c5/>, millega see lõppes, on crates.io-s nähtav ja ei kompileeru kleebituna. <c6/> kompileerib seda endiselt bait-baidilt ja nüüd keeldub ka peidetud reast plokis.

# text
# c1: README.npm.md
# c2: initSync
# c3: initSync
seg-ea5204ced0d2 = <c1/> eraldab brauseri Node.js-ist ja annab Node'i retsepti, mis loeb binaari kettalt ja annab selle funktsioonile <c2/>. Doc-sync test aktsepteerib <c3/> laadijana, mille wasm-bindgen genereerib.

# text
# c1: 5ba83a232b94
seg-ebb763695c59 = Kõik kolm manustavad stsenaariumi lühendamata päritolustringidega, nii et stsenaariumi räsi on igal pinnal <c1/>. npm-i näide lühendas neid varem, mis andis sellele käsurealiidesest erineva räsi.

# text
# c1: cargo new
# c2: wasm-pack --target web
seg-dc52363432f8 = Reprodutseeritud selle puu kohalikest ehitustest: värske <c1/> projekt teesõltuvusega pakendatud craty peale ehitas ja käitas Rust-i näite; maturiniga pakendatud lähtekoodist ehitatud wheel, paigaldatud uude virtuaalkeskkonda, käitas Pythoni näite; ja pakett <c2/>, pakitud ja npm-iga paigaldatud, käitas Node'i retsepti. Kõik kolm trükkisid sama kokkuvõtterea.

# text
# c1: cargo run -- <scenario.toml>
seg-07e465a602f1 = <c1/> töötab kloonist.

# text
# c1: Cargo.toml
# c2: default-run = "kshana"
# c3: cargo run --
seg-77ce31300b69 = <c1/> seab <c2/>. Ilma selleta keeldus cargo teatega „could not determine which binary to run“, mille tabas iga dokumentatsiooni rida <c3/>.

# text
# c1: kshana example
# c2: --help
# c3: --version
# c4: --validate
# c5: ok:
# c6: tests/cli_first_run.rs
seg-2d516597b5f5 = <b>Käsurealiidese esimese minuti vead ütlevad, mida järgmisena teha.</b> Stsenaariumi tee, mida pole olemas, lisab nüüd vihje, mis osutab käsule <c1/>, ja teine positsiooniline argument trükib kasutusteksti lisaks argumendi nimetamisele. <c2/>, <c3/>, tundmatu valiku viga (väljumiskood { "2" }) ja käsu <c4/> ühe rea <c5/> õnnestumisel olid juba main-harus. <c6/> katab nüüd need kõik, sest ükski test ei käitanud binaari ühegi nende jaoks varem.

# text
# c1: list_kinds()
# c2: scenario_kinds()
# c3: kshana.pyi
# c4: docs/PYTHON_API.md
# c5: README.pypi.md
# c6: scenario_kinds()
seg-fdd9a27ccfc4 = <b>Pythoni <c1/> on dokumenteeritud ühe JSON-stringi tagastajana, mitte loendina.</b> See tagastab samad metaandmed, mis <c2/>, serialiseeritult, nii et selle läbikäimine käib märke. See säilitab oma stringitagastuse, et olemasolevad kutsujad ei katkeks. <c3/>, sidumise dokumentatsioonikommentaar, <c4/> ja <c5/> ütlevad seda nüüd ja osutavad funktsioonile <c6/>.

# text
seg-f0e0c8c12f8a = <b>Kolm registri README-d kirjutavad iga lühendi esimesel kasutamisel lahti.</b> PNT on nüüd lahti kirjutatud tunnuslauses, kus see esimest korda esineb, ning CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL ja API on lahti kirjutatud failides, mis neid kasutavad. Sõltumatu etaloni tabeli pealkiri ei ütle enam „CI-gated“ enne, kui CI on defineeritud.

# text
seg-554c5b0c9c60 = Parandatud avaldatud arv: kahe konstellatsiooni ARAIM kättesaadavus kaasasoleval Celestraki GPS + Galileo TLE-del.

# text
# c1: docs/CAPABILITY.md
# c2: tests/araim_dual_real_data.rs
# c3: parse_propagators
# c4: parse_tle
# c5: araim_dual_constellation_availability
# c6: docs/CAPABILITY.md
# c7: docs/REAL_TLE_GUIDE.md
seg-1f023a822c91 = <c1/> väitis, et Galileo koondamine tõstab kättesaadavuse väärtuselt { "0.21" } väärtusele { "0.67" } VAL-i { "12" } m juures ja et konstellatsiooniviga taluv režiim on ainult kahe konstellatsiooniga piiratud. See tuli sellest, et <c2/> propageeris iga satelliiti selle enda TLE epohhist (<c3/> kaotab epohhi), ja nende failide epohhid hõlmavad { "70.6" } h (GPS) ja { "335.7" } h (Galileo), nii et satelliidid asusid vastastikku ebajärjekindlatel aegadel. Test hoiab nüüd iga epohhi (<c4/>) ja hindab iga satelliiti ühel ühisel UTC hetkel, komplekti hilisimal TLE epohhil (2026-06-07T07:{ "21" }:{ "04" }). Mõõdetud kättesaadavus sama { "24" } h, 289 valimi võrgul on nüüd ainult GPS { "0.993" } (oli { "0.208" }), koondatud { "1.000" } (oli { "0.671" }) ja konstellatsiooniviga taluv kaksik { "0.990" } (oli { "0.031" }); APV-I piiril läheb kaksikrežiim väärtuselt { "0.180" } väärtusele { "1.000" }. Järeldus pöördub: järjekindlal taevalaotusel kannavad kaks konstellatsiooni konstellatsioonivea hüpoteesi VAL-i { "12" } m juures. Samad arvud tulevad ka varaseima TLE epohhiga etalonina. Testi enesekontroll kinnitab selle kättesaadavuse tsükli valim valimi haaval funktsioonile <c5/>, nii et ainus erinevus on ajajoondus. <c6/> ja <c7/> § { "3" } kannavad uusi arve; allpool olev kirje { "0.13.0" } jäetakse nii, nagu see välja anti.

# text
# c1: docs/CAPABILITY.md
# c2: docs/STANDARDS.md
# c3: ROADMAP.md
seg-3173a2e03521 = <b>Avalikud pinnad ei reklaami enam RINEX { "4" } valideeritud olevana.</b> Mootor keeldub nüüd RINEX { "4" } navigatsioonifailist nime järgi, mitte ei dekodeeri seda valesti, kuid standardite võrk näitas endiselt kaarti „RINEX { "3" } / { "4" }“ siltiga <em>valideeritud</em>, seotud navigatsiooniparseri RINEX-3 tõendiga. Kaart on nüüd „RINEX { "3" }“ ning README, <c1/>, <c2/>, <c3/> ja võimekuse kokkuvõte ütlevad, mis on tõsi: RINEX 3.0x vaatlusfailid parsitakse, { "4.00" } vaatluse paigutust oodatakse parsitavaks, kuid ühtegi { "4.00" } faili pole koodiga läbi loetud, ja RINEX { "4" } navigatsioonifailidest keeldutakse.

# text
# c1: --validate
seg-c9bb514acb7a = <b><c1/> ütleb, millal „ok“ tähendab, et polnud midagi kontrollida.</b> Umbes kaks kolmandikku kataloogist ei avalda ühtki kohustuslikku välja — need paketid käitavad oma etalonkonfiguratsiooni tühjast kehast — nii et lint võis neile trükkida ainult „ok“, samade sõnadega, mida kasutas pärast kuue välja kontrollimist. Õnnestumise rida ütleb nüüd, mitu kohustuslikku välja leiti olemasolevana, või et liik ei nõua ühtegi.

# text
# c1: scripts/gate.sh
# c2: REPEAT
# c3: TEST_THREADS
# c4: REPEAT=no
seg-06b324d00285 = <b><c1/> keeldub mittenumbrilisest <c2/> või <c3/>.</b> Bash-i { "3.2" } all põhjustas <c4/> arvuvõrdluse vea ja hindamise väärana, nii et värav teatas „repeatability loop SKIPPED (REPEAT={ "0" })“ väärtuse kohta, mis polnud { "0" }, ja kirjutas siiski kviitungi. Mõlemad nupud väljuvad nüüd koodiga { "2" }, kui need pole lihtsad täisarvud.

# text
seg-09d04ffdd9ac = MSRV on öeldud väärtusena { "1.85" } kõikjal, kus inimene seda loeb.

# text
# c1: Cargo.toml
# c2: codemeta.json
seg-dafc23725315 = <c1/> liikus eelmisel väljalaskel väärtusele { "1.85" }; README märk, paigaldus- ja tõrkeotsingu tekst, <c2/> ning MCP kasti enda põhjendus ütlesid endiselt { "1.75" }.

# text
# c1: RunOutput.__repr__
# c2: len()
seg-c2fa8a31058c = <b>Pythoni sidumise <c1/> teatab baite, mitte „chars“.</b> See trükkis UTF-8 stringide <c2/>, mis on baitide arv: { "710" } „chars“ 708 märgi pikkuse tabeli kohta.

# text
# c1: --study --study-name
seg-6b4452a4e340 = README ei dokumenteeri enam koos <c1/>.

# text
# c1: --study-name
# c2: --study
seg-47d83e4d847b = <c1/> on ühe stsenaariumi lipp, mida ignoreeritakse koos <c2/> (binaar hoiatab). Kaks kopeeri-kleebi näidet failides README.md ja README.crates.md näitavad nüüd uuringukäsku üksi.

# text
seg-5ed7f8330b2d = <b>Saidi kella stabiilsuse tõend ütleb välja mõlemad jälgitud tolerantsid.</b> 5071A tseesiumi rida reprodutseeritakse täpsusega ≤ { "3e-5" } ja PHASE.DAT täpsusega ≤ { "5e-5" }; lõik andis mõlema jaoks { "3e-5" }.

# text
seg-8bba7f1171f3 = Kaks mootori väljundfaili ei ole enam jälgitud.

# text
# c1: scenarios/quantum-pnt-demonstrator.study.{json,html}
# c2: *.study.json
# c3: *.study.html
seg-ea9bf1d14371 = <c1/> templiti mootor { "0.20.0" } iga näitaja tühjaga ja README enda uuringukäsk kirjutas need üle, määrides puu ja blokeerides push-värava. <c2/> / <c3/> ignoreeritakse nüüd nagu teisi nelja mootori väljundit.

# text
# c1: seed
# c2: u64
seg-77ce9b90859d = <b>Algväärtuse pühkimine mänguväljakul ei ebaõnnestu enam iga jooksutuse korral.</b> Pühkimine astus täisarvulist nuppu <c1/> lineaarselt ({ "1" }, { "10.9" }, { "20.8" }, …) ja mootor, lugedes seda tüübina <c2/>, lükkas iga murdväärtuse tagasi. Täisarvulised nupud pühivad nüüd selgeid täisarve.

# text
# c1: realtime-frame-eop
# c2: engine_version
# c3: scenario_hash
# c4: kshana-csv.csv
seg-e1b1e1360eb9 = <b>Iga mänguväljaku allalaadimine ütleb, milline mootor ja milline sisend selle tegi.</b> Mõned liigid (nt <c1/>) ei väljasta <c2/> ega <c3/>, nii et nende allalaadimised nimetati lihtsalt <c4/>. Nimi langeb nüüd tagasi laaditud mootori versioonile ja stsenaariumi teksti 12-kohalisele hex FNV-1a-64 sõrmejäljele.

# text
# c1: cargo install kshana
# c2: docs/
# c3: src/bin/
# c4: crossover_study
# c5: gen_validation_artifacts
# c6: validation_report
# c7: kshana
# c8: cargo run --bin <name>
# c9: validation_report
# c10: cargo package
# c11: cargo install --path
# c12: kshana
seg-0181e86b576a = <b>Avaldatud crate on vähem kui pool oma varasemast suurusest ja <c1/> ehitab ainult käsurealiidese.</b> Pakett sisaldas varem artikleid, nende esitamispakette, artiklijooniste artefakte, märkmikke, <c2/>, hooldajate skripte ja näiteprogramme. Ühtki neist ei kompileeri teek ega käsurealiides. See sisaldas ka kolme sisemist generaatorit kataloogis <c3/> (<c4/>, <c5/>, <c6/>), nii et registripaigaldus kompileeris ja paigaldas neli käivitusfaili, millest kolm olid kasulikud ainult tõmmise sees. Need puud ja kolm generaatori lähtefaili on nüüd välja jäetud. Cargo loetleb paketi binaarid selle sisalduvatest failidest, nii et avaldatud manifest nimetab ainult <c7/>. Kloonis leitakse generaatorid endiselt automaatselt, nii et <c8/> ja väljalasketöö, mis käitab <c9/>, on muutumatud. Mõõdetud käsuga <c10/>: { "763" } faili, { "16.7" } MiB, { "6.8" } MiB tihendatult enne; { "591" } faili, { "10.5" } MiB, { "3.0" } MiB tihendatult pärast. Selle kontrollehitus, mis kompileerib ainult pakendatud failid, läbib. <c11/> pakendatud craty peal paigaldas ühe käivitusfaili, <c12/>.

# text
# c1: p95 0.0ns
# c2: security 0.000
seg-567c7059286f = <b>Väljund, mida ajastusinsener saab lugeda: enam pole <c1/>, enam pole <c2/> ilma rünnakuta ja saidiarvud ühtivad README-dega.</b> See on kuvaparandus. Ükski avaldatud arv ei muutu; JSON väärtused on identsed, mida ülal olevad golden-räsid tõestavad.

# text
# c1: 0.0ns
# c2: p95 1.20e-4ns
# c3: 0.0
# c4: 0.000
seg-849fa9a29f07 = Ühe rea kokkuvõte trükkis optilise kella 95. protsentiili (p95) ajavea kujul <c1/>, samal ajal kui selle kõrval olev tabel näitas { "1.20e-4" } ns. Nullist erinev ajastusarv, mis on ühe kümnendkoha jaoks liiga väike, trükitakse nüüd kolme tüvenumbriga (<c2/>); täpne null trükitakse endiselt kujul <c3/>. HTML (HyperText Markup Language) aruanne, uuringu võrdlustabel ja mänguväljaku allalaaditav aruanne kasutavad sama reeglit, nii et ükski nullist erinev arv ei trüki ka kujul <c4/>.

# text
# c1: security
# c2: clock
# c3: orbit
# c4: hybrid
# c5: fusion
# c6: security n/a (no attack)
# c7: 0.000
# c8: fom.security
# c9: applicable: false
# c10: figure_tiers
# c11: spoof
seg-c44323babd1e = <c1/> on analüütiline spuufimise tuvastatavuse piir, mis tähendab midagi ainult seadistatud rünnaku vastu. Liigid <c2/>, <c3/>, <c4/> ja <c5/> ei seadista ühtki, nii et nende kokkuvõte trükib nüüd <c6/> numbri nagu <c7/> asemel, mis loeb nagu ebaõnnestunud tuvastus. Väärtus jääb faili <c8/>, märgitud <c9/> ja põhjus failis <c10/>, ning aruandetabelid näitavad „not applicable“. Stsenaariumi <c11/>-id hindab tuvastamist endiselt.

# text
# c1: tests/registry_golden.rs
# c2: golden_clock
# c3: security
# c4: golden_orbit
# c5: security
# c6: tests/tutorials.rs
seg-f54d5ffb7dff = Kaks kokkuvõtte kinnitust failis <c1/> liikusid just nendel kahel põhjusel ja mitte ühelgi teisel: <c2/> (kvant-p95 ja mõlemad väärtused <c3/>) ja <c4/> (mõlemad väärtused <c5/>; selle p95 väärtused on täpselt null). Nende kogu dokumendi räsid ei liikunud. README, kolme õpetuse ja nende õppestsenaariumide oodatud kokkuvõtted on vastavalt uuendatud ja <c6/> kontrollib õppekoopiaid mootori vastu.

# text
seg-e8e012376fa3 = Mänguväljaku juhendatud tutvustus ei avane enam esmasel laadimisel. Selle modaal püüdis esimesed klõpsud ja selle esiletõst kerias lehe külastaja maandumiskohast eemale. See algab nupust „Take the 60-second tour“ või ujuvast nupust Tour.

# text
seg-4d60d4ea4d7d = Leht ei keri enam telefonis külgsuunas. Kell { "390" } px läks kaubamärgirida ja GitHubi nupp umbes { "410" } px sisuks, { "4" } px ületäitumine; päis mahub nüüd alates { "320" } px ja näitajate tabel keritakse oma kasti sees, mitte ei laienda lehte.

# text
# c1: web/data/verification-matrix.json
# c2: web/counts.test.mjs
# c3: tests/web_validation_counts_doc_sync.rs
seg-f6ec6a64071d = Võimekuse uurija juhtis oma kaartide arvuga („{ "46" } capability cards … { "17" } backed by an external oracle“) README-de kõrval, mis ütlevad { "64" } { "168" }-st. Nüüd juhib see kontrollimaatriksiga, loetuna genereeritud failist <c1/> (sama maatriks, millele README arvud on kinnitatud), ja nimetab kaardid seejärel kokkuvõttekihina, mis need on. <c2/>, uus samm pideva integratsiooni (CI) töövoos, kontrollib aritmeetikat ning ristkontrollib faili README.md ja lehe kirjeldusi; <c3/> kinnitab ühenduse Rust-i poolelt.

# text
# c1: docs/POSITIONING.md
# c2: telecom-timing
# c3: docs/TELECOM-TIMING.md
# c4: ROADMAP.md
seg-606098743e57 = <b>Avalik kirjeldus juhib nüüd ajastuse ja holdover'iga, kõige paremini valideeritud valdkonnaga.</b> README avang ja <c1/> esitavad Kshanat avatud, reprodutseeritava, päritolu märgistava PNT vastupidavuse tõendimootorina: kriitilise taristu ajastus ja holdover esimesena (Alani, modifitseeritud Alani, ajahälbe ja maksimaalse ajaintervalli vea hindajad ning holdover'i rannikuvariatsiooni pöördamine on selle taga olevad VALIDATED read), kvant kui neutraalne kvant-versus-klassikaline kompromissi meetod, mille tulemused on märgitud MODELLED, ning Kuu / tsislunaarne (Maa–Kuu ruum) ja kaugkosmose navigatsioon hooldatavate võimekustena, mitte pealkirjana. Mõlemad lehed ütlevad nüüd, mis Kshana ei ole — mitte raadiosageduslik signaalisimulaator ega riistvara-ahelas rig, mitte MATLAB/Simulinki, STK ega Orekiti asendaja — ja osutavad uuele stsenaariumi liigile <c2/> ja failile <c3/>. Vana rida „there is no good open tool“ on kadunud: otsing, mis midagi ei leia, ei ole tõend, et midagi pole olemas. <c4/> saab dateerimata prioriteetide järjekorra (ajastus esimesena, kvantkompromiss teisena, Kuu hooldatav) ja loobub kolmest aegunud punktist (Coriolise ja valgusnihke süstemaatilised vead, NRHO algtingimused ja Kuu stsenaarium, kõik tarnitud); README rida „Coriolis and light-shift remain roadmap“ on parandatud samamoodi.

# text
# c1: docs/CAPABILITY.md
# c2: src/verification.rs
# c3: oem
seg-7bc48692be0b = <b><c1/> lõpetas alahindamise.</b> Maaga seotud tugisüsteemide rida ütles „none“, samal ajal kui maatriks hindab GCRS→ITRS VALIDATED; see on nüüd „full“ ja põhitugisüsteemide rida kirjendab ANISE ristkontrolli tarnituks. Juhendatud režiim oli loetletud teekaardil; mänguväljak on tarninud juhendatud liugurid ja juhendatud tutvustuse. Pühkimine faili <c2/> vastu parandas veel viis rida, mis eelnesid oma valideerimistele: Cowelli jõumudel ning partii- ja järjestikune orbiidi määramine Orekit { "12.2" } vastu, jaamaläbimised Orekiti kõrgusnurga detektori vastu, täpsuse halvenemise teguri tuum gnss_lib_py vastu ja OEM import sõltumatu parseri <c3/> vastu; kontrolli ja valideerimise rida nimetab nüüd valvureid, mis kontrollivad, et iga tsiteeritud test on olemas.

# text
seg-9d144df304ca = Sõnastik selgitab, mida tulemusfail ütleb.

# text
# c1: docs/GLOSSARY.md
# c2: sigma_y
# c3: q_wf
seg-eed672b2f8fd = <c1/> saab lihtkeelsed kirjed väljundterminite jaoks (holdover, p95, terviklikkus, turvaskoor, PDOP, <c2/>, <c3/>), telekommunikatsiooni ajastusterminite jaoks (ajaviga, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) ja kolme tõendustaseme jaoks (VALIDATED, MODELLED, PARTNER).

# text
# c1: docs/
# c2: docs/VERIFICATION-MATRIX.md
# c3: docs/MODELLED-RATIONALE.md
# c4: docs/SCENARIOS.md
# c5: src/verification.rs
# c6: api::list_scenario_kinds()
seg-1a4f9d5eef96 = <b>Lühendid on lahti kirjutatud esimesel kasutamisel igas käsitsi kirjutatud avalikus dokumendis.</b> README-l ja { "24" } failil kataloogis <c1/> oli mitusada lühendit kasutatud enne oma lahtikirjutust või ilma selleta; igaüks on nüüd lahti kirjutatud seal, kus see selles failis esimest korda esineb. Kolm genereeritud faili (<c2/>, <c3/>, <c4/>) jäetakse rahule: need kirjutatakse failidest <c5/> ja <c6/>, nii et nende sõnastus tuleb muuta allikas.

# text
seg-2889ce118381 = Ridade katvusel on ametlik mõõtmine.

# text
# c1: docs/COVERAGE.md
# c2: coverage
# c3: b1d350d
# c4: tests/coverage_figure_doc_sync.rs
seg-9c4684c0a4ef = <c1/> kirjendab { "95.63" } % ({ "37,697" } rida { "39,419" }-st) CI töölt <c2/> commit'il <c3/> ja <c4/> kinnitab viis avalikku pinda „~{ "96" }%“ selle külge — ainus pealkirjaarv, mida hoiti käsitsi ja mis oli juba kord märkamatult liikunud.

# text
seg-ebd36b7291df = Uued dokumendi sünkroonimise väravad pindadele, mida miski ei lugenud.

# text
# c1: tests/readme_code_fences_doc_sync.rs
# c2: import { … } from "kshana"
# c3: tests/security_md_doc_sync.rs
# c4: src/lib.rs
# c5: #![forbid(unsafe_code)]
# c6: tests/no_overclaims.rs
# c7: web/README.md
# c8: proof
seg-3dd44fc69a28 = <c1/> kontrollib iga <c2/> JavaScripti plokis WebAssembly ekspordi vastu ja kinnitab README.crates.md Rust-i näite bait-baidilt koopiale, mille testi binaar kompileerib. <c3/> ebaõnnestub, kui <c4/> kaotab <c5/> või SECURITY.md lõpetab selle väitmise. <c6/> skannib nüüd ka faili <c7/> ja kolme registri README-d ning iga saidil olev standard peab oma <c8/> selgelt ütlema.

# text
seg-a506d14f3447 = Kaks päris riistvara kellakontrolli jooksevad runneril.

# text
# c1: realdata-clock.yml
# c2: KSHANA_REQUIRE_REALDATA=1
seg-c7f8b8627137 = <c1/> (kuuti ja käsul) toob 5071A ja PHASE.DAT read ning käitab mõlemad testid seadega <c2/>, nii et puuduv sisend ebaõnnestub, mitte ei jäeta vahele. Mõlemad toomisskriptid on kinnitatud ühele allantools commit'ile ja kontrollivad SHA-256.

# text
# c1: mypy.stubtest
# c2: csv
# c3: write_csv
seg-3b4a7fee3cd0 = <b>Pythoni tüübitükk kontrollitakse ehitatud wheel'i vastu</b> (<c1/> sidumiste töös), mille tõttu <c2/>/<c3/> tarniti tükita.

# text
seg-24c2ccf3634a = <b>Sõnastik defineerib URE, EOP, FoM, CTI ja TIB</b>, mida README ja register (ledger) kasutasid paljalt.

# text
# c1: required_fields
# c2: ephemeris
# c3: tle|orbit+epoch
# c4: kind = "ephemeris"
# c5: --validate
# c6: quantum-trade
# c7: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c8: |
# c9: +
# c10: --validate
# c11: lunar-joint-od-clock
# c12: pvt
# c13: earth-gnss-lunar
# c14: docs/SCENARIOS.md
# c15: kind
# c16: clock
# c17: tests/required_fields_are_true.rs
seg-ae044195cd47 = <b>Iga liigi avaldatud väljalepe on nüüd tõene ja test hoiab seda seal.</b> Viis { "61" } liigist muutus. Liigid, millel on mittetühi <c1/>, lähevad { "21" }-lt { "22" }-le: <c2/> nõuab nüüd <c3/> (paljas <c4/> läbis varem <c5/> ja ebaõnnestus siis jooksutuses) ning <c6/> lisab <c7/>, mida selle jooksutus juba nõudis. Nõutav kirje võib kasutada <c8/> (üks neist) ja <c9/> (kõik need koos); <c10/> mõistab mõlemat. <c11/>, <c12/> ja <c13/> avaldavad { "9" } tõelist valikulist välja, mille nad olid välja jätnud. <c14/> ütleb nüüd, et <c15/> on nõutav iga liigi puhul peale <c16/>. <c17/> kontrollib iga liiki selle tarnitud stsenaariumi vastu: iga nõutava kirje eemaldamine peab põhjustama jooksutuse ebaõnnestumise ja dokument, mis sisaldab ainult nõutavaid välju, peab jooksma.

# text
seg-09ba716f3e97 = JetBrains Marketplace'i märkmed on värava taga.

# text
# c1: scripts/check-version-sync.sh
# c2: <change-notes>
# c3: plugin.xml
seg-938ff48e7a2d = <c1/> ebaõnnestub nüüd, kui faili <c3/> uusim kirje <c2/> ei nimeta tarnitavat versiooni; seitse avaldatud versiooni olid serveerinud märkmeid { "0.22.0" } muutmata kujul.

# text
seg-3d38550854e0 = Tehnilise aruande katvuse arv on mõõdetud arv.

# text
# c1: paper/kshana-technical-report.md
# c2: docs/COVERAGE.md
seg-bd312cd26746 = <c1/> ütles „near { "97" } %“; nüüd ütleb see near { "96" } % ({ "95.63" } % mõõdetud, <c2/>) ja on kuues pind, mida katvuse test kinnitab.

# text
# c1: web/engine.test.mjs
seg-934680d402da = <b>Põhilõimest väljas oleva mootorikliendi testitakse</b> (<c1/>, CI-s): saatmise lubatud loend, tühistamine ja taaskäivitamine, kolm põhilõime varuteed ja krahhist taastumine, võltsworkeri vastu.

# text
# c1: release.yml
# c2: docs/RELEASING.md
seg-fd5f9a8a4f43 = <b>Midagi ei avaldata, enne kui sildistatud commit on oma testid läbinud, ja väljalase ei ole valmis, enne kui iga register seda serveerib.</b> Järjekord on nüüd silt, kontroll, avaldamine, pariteet, sait, ühes jooksutuses failist <c1/> (<a1><c2/></a1>).

# text
seg-745b11c8ed74 = Avaldamine ootab otsust.

# text
# c1: publish.yml
# c2: mcp-publish.yml
# c3: jetbrains-plugin.yml
# c4: release.yml
# c5: needs: verify
# c6: verify
# c7: scripts/check-release-verdict.sh
# c8: verify
seg-e66c890cf6c0 = <c1/>, <c2/> ja <c3/> ei käivitu enam sildi push'ist; <c4/> kutsub neid töödest, millel on <c5/>. Varem võistlesid need sellega: versioonil { "v0.27.2" } olid crates.io, npm ja Python Package Index (PyPI) kõik avaldanud { "4.5" } minuti jooksul sildist ja <c6/> tagastas { "84" } minutit pärast seda; versioonil { "v0.27.0" } avaldasid npm ja PyPI, samal ajal kui crates.io töö ebaõnnestus. Käsitsi kordust sildil hoiab tagasi uus <c7/>, mis nõuab rohelist <c8/> täpselt selle commit'i jaoks Actionsi liidesest ja ebaõnnestub suletuna kõige muu korral.

# text
seg-3800247c81f2 = <em>Kõik ehitatakse enne, kui midagi üles laaditakse</em>, ning crates.io, mille pakendamise samm oli see, mis väljalaske keskel ebaõnnestus, avaldab esimesena.

# text
seg-6929a7608da7 = <em>Puuduv registri märk ebaõnnestub töö</em>, selle asemel et laadimine vahele jätta ja edu teatada.

# text
seg-460811602293 = Pariteedi kontroll pärast avaldamist.

# text
# c1: scripts/check_channel_parity.py
# c2: kshana
# c3: kshana-mcp
seg-86eb0fab2f7c = <c1/> pärib crates.io-d (<c2/> ja <c3/>), npm-i, PyPI-d (lähtekoodi levitus ja kõik kuus platvormi wheel'i) ja ghcr.io-d, kuni iga neist serveerib versiooni, või ebaõnnestub jooksutuses; docs.rs ja Model Context Protocoli (MCP) register on teatatud, mitte nõutud. Varasemate väljalaskete vastu käitatuna leiab see, et npm-ist ja PyPI-st puudub { "0.22.0" }, PyPI-st { "0.23.0" } ja crates.io-st { "0.27.0" }.

# text
# c1: kshana-aarch64-apple-darwin
# c2: kshana
# c3: SHA256SUMS
# c4: verify-release
seg-79578a00fd78 = <em>Eelehitatud käsurealiidese binaarid macOS-ile (Apple silicon ja Intel) ja Windows x86-64-le</em>, nimetatud sihtmärgi järgi (<c1/> ja nii edasi), Linuxi <c2/> kõrval, mille nimi on muutumatu. Fail <c3/> katab iga vara ning <c4/> kontrollib seda ja käitab macOS-i ja Windowsi binaare nende endi süsteemides.

# text
# c1: main
# c2: main
# c3: pages.yml
seg-3e1f5afa9f2a = <em>kshana.dev näitab väljalaset, mitte haru <c1/>.</em> Varem juurutati see uuesti iga push'i peale harusse <c2/>, samal ajal kui selle lehed nimetasid viimast väljalaset. <c3/> ehitab nüüd ainult väljalaskesilti: väljalase käivitab selle üks kord, kui iga kanal serveerib versiooni, ja käsitsi käivitamine juurutab uuesti viimase väljalaske (või nimetatud ühe).

# text
seg-43da8f3f171e = Üks wheel'ide allikas.

# text
# c1: publish.yml
# c2: wheels.yml
seg-b911ac65e231 = Faili <c1/> käsitsi kopeeritud kuuesihtmärgiline maatriks on kadunud; see kutsub faili <c2/>, nii et auditwheel sildi värav ja bait-baidilt reprodutseeritavuse kontroll hindavad nüüd wheel'e, mida PyPI saab, ning kummagi ebaõnnestumine peatab väljalaske.

# text
# c1: publish.yml
# c2: pages.yml
# c3: @stable
# c4: rust-toolchain.toml
# c5: scripts/check-toolchain.sh
seg-194c4b019a4c = <em>Kinnitatud ehitustööriistad.</em> Iga töövoog nõuab Rust-i { "1.93.0" } (töö msrv oma versiooni); <c1/> ja <c2/> olid nõudnud <c3/>, ning versiooni { "v0.27.2" } logi näitab rustupi paigaldamas { "1.98.1" } ja seejärel kompileerimas versiooniga { "1.93.0" } ainult sellepärast, et <c4/> on sellest ülimuslik. wasm-pack on kinnitatud versioonile { "0.13.1" } (versioon, mis ehitas { "v0.27.2" }, mille valis kinnitamata paigaldusskript) kontrollsumma kontrolliga ja mcp-publisher versioonile { "1.8.1" } oma avaldatud SHA-256-ga. <c5/> ebaõnnestub nüüd, kui töövoog küsib teist kompilaatorit või suunab allalaaditud skripti shelli. Ühtegi kontrollitööd, golden-kinnitust ega kohalikku värava skripti ei eemaldatud ega lõdvendatud.

# text
# c1: dtolnay/rust-toolchain
seg-9e2a7376367e = <b>Iga kolmanda osapoole GitHub Action on kinnitatud commit'i SHA-ga</b> — { "93" } viidet { "15" } töövoos, neist { "92" } uut — sildiga, mis jäetakse lõppkommentaarina Dependabotile uuendamiseks. Erand on <c1/>, mille silt on tööriistaahela valija.

# text
# c1: mcp/kshana-mcp
seg-6afb4a8770b0 = <b>MCP serveri kujutise baaskihid on kinnitatud multi-arch räsiga</b> ja Dependabot jälgib nüüd stsenaariumi <c1/> Dockerfile'i, nii et OS kihid saavad endiselt turvauuendusi — läbi ülevaadatud PR-i.

# text
seg-4ea8b158b408 = Sildi ja manifesti kontroll jookseb kahes avaldamise töövoos, mis tarnivad sildi versiooni.

# text
# c1: mcp-publish.yml
# c2: jetbrains-plugin.yml
# c3: publish.yml
# c4: scripts/check-version-sync.sh
seg-4b77764e955d = <c1/> (ghcr kujutis, MCP register) ja <c2/> (Marketplace) võistlevad failiga <c3/>, mitte ei oota seda, nii et valesti lõigatud silt oli värava taga ainult õdetöövoos. Mõlemad käitavad nüüd enne ehitamist <c4/>.

# text
# c1: rmcp
# c2: rmcp
# c3: rmcp
# c4: kshana-mcp
# c5: rust-version = "1.88"
# c6: kshana
# c7: Content
# c8: ContentBlock
seg-bf90c4063843 = <b>Neli nõuannet, mille Dependabot tõstatas päeval, mil selle hoiatused sisse lülitati, on parandatud.</b> MCP server liigub teegilt <c1/> { "1.7" } väärtusele { "2.2" }: kolm nõuannet teegi <c2/> < { "2.1" } vastu (Streamable-HTTP seansitabeli leke, puuduv OAuth kaitstud ressursi valideerimine, kohandatud päised, mis järgivad ristpäritolu ümbersuunamist) — ükski pole siin ligipääsetav, kuna server räägib ainult stdio-d, kuid avaldatud crate ei tohiks kinnitada haavatavat SDK-d. Teegi <c3/> { "2" } makrod vajavad Rust-i { "1.88" }, nii et ainult <c4/> deklareerib nüüd <c5/>; teek <c6/> jääb versioonile { "1.85" }. Ainus API muudatus (<c7/> → <c8/>) on rakendatud ja edasi-tagasi testid läbivad. SonarQube'i skannimise action liigub versioonilt v5 versioonile v6, mis parandab argumendisüsti nõuande (≥ { "4.0" }, < { "6.0" }).

# text
# c1: navsignal::code_tests
# c2: integrity::tpl_scalar::tests
# c3: api::tests::tracking_loop_kind_round_trips_through_the_dispatch
# c4: .rs
seg-2652aaad177e = <b>Iga Rust-i üksus, mida kontrollimaatriksi rida tsiteerib, lahendatakse nüüd kasti vastu.</b> Olemasolev valvur kontrollis failiteedena kujundatud viiteid; { "63" } { "164" } mitte-partneri reast nimetavad oma tõendi hoopis kastisisese üksusena — <c1/>, <c2/>, <c3/> — ja märk ilma järelliiteta <c4/> oli teedeskanneri jaoks nähtamatu. Need read oleksid võinud nimetada ümber nimetatud moodulit, tühjendatud testimoodulit või funktsiooni, mida polnud kunagi olemas, ning iga värav oleks jäänud roheliseks.

# text
# c1: tests/verification_rows_name_a_test_that_exists.rs
# c2: #[test]
# c3: mod tests
# c4: #[test]
seg-01eee5115e3f = <c1/> lahendab kõik { "339" } sellist viidet mooduli puu kaudu, nõuab, et iga mitte-partneri rida nimetaks vähemalt ühe testi, mis tegelikult kannab <c2/>, ja nõuab, et partneri read ei nimetaks ühtegi. Selle hindamiseks kasutati nelja mutatsiooni: viidatud mooduli ümbernimetamine, rea ainsa testiviite suunamine mitte-testfunktsioonile, tegeliku <c3/> ümbernimetamine ja selle atribuutide <c4/> eemaldamine — igaüks läheb punaseks väitel, mis seda omab.

# text
# c1: tests/*
# c2: tests/alternative_complementary_pnt_reference.rs
seg-7731d549c739 = Üks rida oli juba vale: <em>Alternative / complementary PNT</em> tsiteeris <c1/>, mis on glob, mitte viide. See nimetab nüüd <c2/> ja kolme selle taga olevat kastisisest testimoodulit.

# text
# c1: tests/published_figures_still_reproduce.rs
# c2: chart.svg
# c3: scenario-fom.png
seg-cf6fd64368de = <b>Avaldatud jooniseid kontrollitakse igas ehituses mootori vastu uuesti</b> (<c1/>). Kolm README demodiagrammi on mootori enda väljund <c2/> ja miski ei jooksutanud stsenaariumi uuesti; paberi kaks ristumisuuringut genereeriti üks kord ja kinnitati; ning README ütleb proosas neli näitajat faili <c3/> kõrval. Kõik kolm on nüüd kinnitatud elava mootori väljundi külge.

# text
seg-276b65a8f76a = Nende ühitamine tõi esile kasuliku tulemuse: demodiagrammid olid joonistatud mootoriga { "0.22.0" } ja paberi ristumise JSON mootoriga { "0.20.0" } ning versioonil { "0.27.1" } <b>on iga joonistatud väärtus kõigis viies artefaktis identne</b> — kolm diagrammi-SVG erinevad värskest jooksutusest täpselt kahe märgi võrra igaüks, versioonitempli võrra jaluses. Diagrammid on uuesti renderdatud, et jalus oleks tõene. Paberi JSON jäetakse tahtlikult templitud kujule { "0.20.0" }: see on jooksutuse kirje, mille joonist avaldatud paber manustab, ja uuesti templimine väidaks päritolu, mida PDF-il pole. Valvur väidab selle asemel tugevamat omadust — et praegune mootor reprodutseerib endiselt iga avaldatud väärtuse.

# text
# c1: VERSION=not provided
# c2: previous_version
# c3: FieldUnit
# c4: ensemble
# c5: hybrid
# c6: fusion
# c7: inertial
# c8: report
seg-c88647c5f2fc = SonarCloudi analüüsid kirjendati kujul <c1/>, nii et uue koodi periood <c2/> ei edenenud kunagi: see oli endiselt ankurdatud 2026-07-02 analüüsile, hinnates kaheksakümmend kaks päeva tööd ühe deltana ja mõõtes { "7877" } „uut“ dubleeritud rida { "3" } % läve vastu. Skannimine annab nüüd edasi kasti versiooni. Aluseks olev dubleerimine on päris ja seda ei peideta: see on koondunud deklaratiivsetesse registritesse <c3/>, mis kordub failides <c4/>, <c5/>, <c6/>, <c7/> ja <c8/>, ning 168-realisse kontrollitabelisse ning see on siin nimetatud tööna, mitte mõõtmisest välja jäetud.

# text
# c1: scripts/gate.sh
# c2: integration_binaries
# c3: tests_passed
# c4: tests_ignored
# c5: target/gate-run.log
seg-f2a0960a6f11 = <b>Failil <c1/> polnud ühekirjutajalukku ja iga jooksutus kirjutas sama logi.</b> See ei ole korrastamise küsimus: kviitungi <c2/>, <c3/> ja <c4/> loetakse sellest logist TAGASI ja push-eelne konks usaldab kviitungit. Värav, mis tapeti, kuid mille testibinaar oli veel elus, kirjutas jätkuvalt faili, mille järgmine jooksutus oli just kärpinud — nii et ühe jooksutuse arvud oleks võinud olla tõestatud teise jooksutuse omadena, lubades push'i komplekti alusel, mis ei jooksnud kunagi push'itaval puul. Nüüd on üks värav iga checkout'i kohta (keeldudes väljumiskoodiga { "75" } elava kõrval, kustutades aegunud luku, mille pid on kadunud) ja üks logi jooksutuse kohta, faili <c5/> värskendatakse lõpetava jooksutuse põhjal väljumisel. Mõlemat suunda testitakse: elav pid keeldub, surnud kustutatakse.

# text
# c1: src/verification.rs
# c2: verification::gen
# c3: artifacts
seg-687d6fe87221 = <c1/> väitis, et selle testid „do <b>not</b> prove the named test/oracle strings resolve to live code“. Kaks valvurit teevad nüüd täpselt seda, nii et mooduli dokument ütles tõe vastupidist; see ütleb nüüd, mis on masinkontrollitud ja mis on jäetud inimese otsustada. Aegunud viide <c2/> — moodul on <c3/> — on parandatud õdevalvuri enda dokumentatsioonis.

# text
# c1: main
# c2: main
seg-014070f0873c = <b><c1/> kirjutati ümber 2026-09-22 ja force-push'iti.</b> Kümnest commit'ist sai neli. Ümberkirjutus voltis iga commit'i, mis jättis värava punaseks, commit'i sisse, mis selle puhastas, nii et igal commit'il harus <c2/> on nüüd puu, mis läbib, ning eemaldas tühistatud jooksutused, mida harude ülene paralleelsusrühm oli jätnud igale asendatud commit'ile.

# text
# c1: git diff
seg-b48d6cfc3b42 = Midagi ei visatud ära. Ümberkirjutuse-eelsed commit'id jäävad kättesaadavaks siltide kaudu, mis neile osutavad, ja lõplik puu on bait-baidilt identne puuga, millest ümberkirjutus algas — <c1/> vana tipu ja uue vahel on tühi, välja arvatud kolm töövoofaili, mida see väljalase muudab.

# text
seg-0549cfdc6d69 = Asendatud SHA-d neile, kellel on neile viide:

# text
seg-14812deb1b6b = vana

# text
seg-c63f549e6a1d = teema

# text
seg-57bfbb773299 = docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s

# text
seg-02aa1be872d2 = fix(docs): the engine-flow diagram said { "6" } figures of merit; the engine scores { "7" }

# text
seg-f3a598ff3349 = fix(test): two more cross-platform pins, and two wrong assumptions of my own

# text
seg-e9054c4801ff = feat(web): surface the lunar cluster on the site — seven capability cards

# text
seg-3f1f16502fdf = docs(lunar): document { "42" } public fields and ratchet the ceiling down to { "985" }

# text
seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

# text
seg-cbe63ab92c6a = test(docs): guard the distribution diagram, the last unguarded one

# text
seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

# text
# c1: 7bba514
# c2: 7864142
# c3: .cargo_vcs_info.json
# c4: main
# c5: main
seg-9c220336c895 = <b>Silte { "v0.27.0" } ja { "v0.27.1" } TAHTLIKULT EI liigutatud.</b> Need osutavad endiselt commit'idele <c1/> ja <c2/>, täpsetele commit'idele, mille puud tootsid artefaktid, mis on nüüd elus crates.io-s, npm-is, PyPI-s, ghcr.io-s ja MCP registris. Crate'i <c3/> kirjendab sha1, millest see pakendati, registrid on muutumatud ja SLSA ehituse päritoluatesteering väljalaske { "v0.27.1" } varadel on seotud selle commit'iga. Siltide liigutamine oleks jätnud iga neist avaldatud artefaktidest osutama commit'ile, mida enam pole. Nende jätmine hoiab vanad commit'id kättesaadavad ja iga avaldatud päritoluahela lahenduvana, hinnaga kaks silti, mis ei ole enam haru <c4/> esivanemad — mistõttu see väljalase on olemas: { "v0.27.2" } annab harule <c5/> oma sildi, pakendatud commit'ist, mis on sellel.

# text
seg-3c644384256f = See on selle ajaloo teine avalikustatud ümberkirjutus; esimene, 2026-09-21, kanoniseeris autorluse ja on kirjendatud märgetes { "0.27.0" } oma kahe rippuva crate'i sha1-ga. Ümberkirjutus avalikustatakse siin iga kord, sest hoidla, mis müüb kontrollitavat päritolu, ei saa vaikselt avaldatud artefakti alt maad liigutada.

# text
seg-d82d7a3c9054 = Avaldatud crate ei kompileerunud.

# text
# c1: src/lunar_orientation.rs
# c2: include_str!
# c3: tests/fixtures/llr_geometry/de440_moon_pa.csv
# c4: /tests/fixtures
seg-ebc99c9df1ef = <c1/> sisaldab ülemisel tasemel <c2/> faili <c3/> ja manifest jätab <c4/> paketist välja, nii et tarball, mille crates.io saab, ei sisaldanud faili, mille teek ise manustab. Avaldamine { "v0.27.0" } ebaõnnestus selle tõttu oma kontrollehituses ja ükski { "0.27.0" } ei jõudnud crates.io-sse; npm ja PyPI, mille tööd sellest ei sõltu, avaldasid normaalselt. Väljajätt kannab nüüd erandit selle ühe kataloogi jaoks.

# text
# c1: include_str!
# c2: src/
# c3: #[cfg(test)]
seg-6ff9cdb976e8 = Iga teine fikstuuri <c1/> kataloogis <c2/> asub mooduli <c3/> sees ega jõua seetõttu pakendatud teeki. Ainult ülemise taseme oma jõuab.

# text
# c1: cargo package
# c2: package
seg-7f0975453b8f = <b>Miski CI-s ei käitanud käsku <c1/>,</b> mistõttu tarball, mis ei saa kompileeruda, avastati esmalt avaldamise töös, pärast seda, kui kaks muud registrit olid juba tarninud. Töö <c2/> ehitab ja kompileerib nüüd täpse tarballi igal push'il.

# text
seg-1f2df48821fc = Kuu tugisüsteemi realisatsiooni emissiooni kinnitused ei liigu enam versiooni tõstmisel. SVG jalus kannab mootori versiooni, nii et iga väljalase baseeris uuesti kolm räsi — kaks korda ühes päevas — ja rutiiniga uuesti võetud kinnitust ei loeta enam. Versioonistring normaliseeritakse enne räsimist kohatäiteks ja emissiooni väidetakse eraldi öeldavat jooksvat versiooni, nii et seda fakti kontrollitakse täpsemalt kui räsi seda kunagi kontrollis.

# text
# c1: lunar-llr-datum
seg-56309487ea7e = <c1/> — Kuu tugisüsteemi andmepunkt päris vaatluskampaaniast.

# text
# c1: lunar-frame-campaign
# c2: bin_rms / sqrt(n_raw)
# c3: realdata::llr_crd
# c4: lunar_llr
seg-966a2cc4e40d = <c1/> asendas süstitud Helmerti teisenduse <em>simuleeritud</em> kampaaniaga ja ütles seda: selle jaamavõrk, ajakava ja vaatluskohane sigma on illustratiivsed sisendid. See stsenaarium eemaldab simulatsiooni kahest kohast, kus ajakava ja veamudel vastusse sisenevad. Epohhid on { "337" } arhiveeritud ILRS Kuu laservahemõõtmise normaalpunkti saatmisajad (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } ja Matera MLRO { "7941" }, kõik viis retroreflektorite massiivi) ja iga vaatluse kaal on selle normaalpunkti enda arhiveeritud täpsus, <c2/> — { "5.13" } mm ühesuunalise vahemaa mediaan, failist välja võetud, mitte siin valitud. Jaamade koordinaadid pärinevad IERS ITRF2020-st ja reflektorite koordinaadid JPL DE430 tabelist { "7" }; iga fikstuur kirjendab URL-i, hankimiskuupäeva ja SHA-256 ning genereeritakse uuesti oma allikast kinnitatud generaatoriga, mis kontrollib allikat ja katkestab, mitte ei väljasta arvu. Aruanne nimetab, millised lingid on mõõdetud ja millised jäävad modelleeritud, ning modelleeritud on <em>mõõdetud</em>: vaadeldud-miinus-arvutatud ühesuunaline vahemaa päris andmete peal on { "156 494" } m RMS, mida sama testikomplekt kinnitab JPL Horizonsi vastu sama vahemiku jooksul ({ "195 655" } m RMS vektor, halvim epohh { "0.054" }° — sisseehitatud analüütilise Kuu jada enda väidetud ~{ "0.3" }° piires). Lisanduv: uus liik, uus lugeja (<c3/>) ja uus moodul (<c4/>); olemasolevad Kuu tugisüsteemi paketid on bitt-bitilt kinnitatud.

# text
# c1: sigma_ure_m
# c2: lunar-integrity
# c3: moonlight-service-volume
# c4: LUNAR_SIGMA_URE_M
seg-7fcd2af0a688 = <b><c1/> stsenaariumi parameetrina</b> stsenaariumitel <c2/> ja <c3/>. Kosmosesignaali ulatuse täpsus oli kompileerimisaja konstant (<c4/>), nii et teenindusmahu pühkimine võis vastata ainult läbimisele/ebaõnnestumisele ühel fikseeritud väärtusel. Kaitsetasemed on selles täpselt lineaarsed, seega muudab selle avamine pühkimise ulatuse täpsuse <b>nõudeks</b> kogu mahu kohal. Vaikeväärtus reprodutseerib varasema käitumise bitt-bitilt.

# text
# c1: moonlight-service-volume
# c2: export_site_lat_deg
# c3: export_site_lon_deg
# c4: per_sat_geometry
seg-c3ccc1e89a2d = <b>Satelliidipõhise geomeetria eksport</b> stsenaariumil <c1/>: <c2/> + <c3/> lisavad massiivi <c4/>, mis annab asimuudi, kõrguse ja kaldulatuse igale satelliidile igal epohhil ühe nimetatud selenograafilise koha jaoks, pluss nähtavuslipu. Koondkatvuse kokkuvõte tahtlikult kaotab satelliidipõhise geomeetria, kuid kaldulatus on täpselt see, mida lingieelarve tarbib, nii et ühist side- ja navigatsioonianalüüsi ei saanud kokkuvõttest üksi teha. Väljas, kui mõlemad koordinaadid pole antud; puhtalt lisanduv.

# text
# c1: lunar_service::topocentric
seg-ae7886fbca9d = <c1/>, avalik vaatenurga abiline ekspordi taga.

# text
seg-b187bade5f04 = Kontrollimaatriksi rida uue geomeetriavõimekuse jaoks.

# text
# c1: antenna::pattern_gain_dbi
# c2: [2·J₁(x)/x]²
# c3: antenna.rs
# c4: export_antenna
# c5: moonlight-service-volume
# c6: antenna_pattern
# c7: θ₃dB[deg] = √(31000/G_lin)
# c8: 70·λ/D
seg-14ef785b6c12 = <b>Päris antennimuster geomeetria ekspordis.</b> Mootor on kandnud ühtlaselt valgustatud ringava mustrit alates P1-st (<c1/>, Airy kuju <c2/>) ja <b>miski väljaspool faili <c3/> ei kasutanud seda</b> — töö tegi selle asemel peasuuna võimendus koos võimenduse ja kiirelaiuse pöidlareegliga. Valikuline tabel <c4/> stsenaariumil <c5/> (loetud ainult siis, kui ekspordikoht on seatud) annab nüüd igale eksporditud reale <b>peasuunast kõrvalekalde nurga satelliidil</b> ja <b>saatmisvõimenduse saidi suunas sellest mustrist</b> ning lisab ploki <c6/>, mis teatab <b>kiires olevate arvu päris mustri korral sümmeetrilise lähenduse kõrval</b> (<c7/>) erinevusega nimetatud parandusena. Mõlemad arvud väljastatakse; kumbki ei asenda teist. Mõõdetuna mootori enda esindava Kuu ava juures ({ "1" } m taldrik, { "2.4" } GHz, η = { "0.60" }) lõunapolaarse koha ja illustratiivse LCNS-klassi kihi kohal <b>lähevad kaks lahku rohkem kui ühe satelliidi võrra</b>: päris muster paneb { "0" } { "76" } nähtavast lingist poolvõimsuskiire sisse, lähendus väidab { "28" } — parandus −{ "2.33" } satelliiti epohhi kohta, halvim üksik epohh { "3" }. Lähendus kannab oma ava efektiivsust ({ "0.641" } võrreldes reegliga <c8/> kraadi, millega seda tavaliselt tsiteeritakse, { "0.920" } ühtlase ringava vastu), nii et η = { "0.60" } taldriku korral annab see kiire, mis on { "1.238" }× liiga lai; plokk väljastab mõlemad kaudsed efektiivsused, mitte ei jäta neid järeldada. Puhtalt lisanduv: mõõdetuna dokumenteeritud tööpunkti kohal, { "597" } eelnevalt olemasolevat lehte, <b>{ "0" } muudetud, { "0" } eemaldatud, { "494" } lisatud</b>.

# text
# c1: antenna::symmetric_beamwidth_rad
# c2: antenna::symmetric_relation_implied_efficiency
# c3: antenna::within_half_power_beam
# c4: antenna::HALF_POWER_DROP_DB
# c5: antenna::SYMMETRIC_GAIN_BEAMWIDTH_CONST_DEG2
# c6: antenna::UNIFORM_APERTURE_HPBW_COEFF
# c7: lunar_service::nadir_off_boresight_rad
# c8: x = 1.61634
# c9: 1.02899·λ/D
# c10: 1.02
# c11: pattern_gain_dbi
seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> ja <c7/>, selle taga olevad avalikud osad. Muster on nüüd ankurdatud ka avaldatud Airy konstantide vastu, mitte ainult iseenda vastu: poolvõimsuse ületus leitakse poolitamisega ja võrreldakse väärtusega <c8/>, mis teeb täpse poolvõimsuslaiuse väärtuseks <c9/> ja kirjendab ausalt, et tavapärane koefitsient <c10/> paneb funktsiooni <c11/> väärtusele <b>−{ "2.955" } dB</b>, mitte −{ "3.010" } dB.

# text
# c1: lunar-time-budget
# c2: x(τ)
# c3: <scenario>.table.csv
# c4: τ
# c5: x
seg-bac7217bb128 = <b>Pikk reprodutseeritavuse tabel stsenaariumile <c1/>.</b> Stsenaariumi massiiviväärtusega väljundid — keskmistamisaja võrk, seitse liikmepõhist kõverat <c2/> ja nende ruutude summa juur — jõudsid tarbijateni ainult JSON massiividena. Üks välja antud tabel kärbiti { "400" } märgi juures ja avaldas { "23" } oma { "57" } keskmistamisajast veeru all, mis väitis neid kõiki, ja käsikiri ehitas liikmepõhised kõverad kinnisvalemitest uuesti, sest mootor ei väljastanud neid kunagi. Tavaline jooksutus kirjutab nüüd ka faili <c3/> ühe reaga (võrgu indeks, keskmistamisaeg, liige) kohta, mida ei saa kärpida millekski, mis näeb endiselt tervik välja. Võrgu indeks on täpne liitmisvõti; <c4/> kirjutatakse { "13" } tüvenumbriga ja iga <c5/> { "7" }-ga, nii et baidid ei hargne sama lähtekoodi ehituste vahel. Puhtalt lisanduv: aruande JSON on bait-baidilt identne.

# text
# c1: hybrid-optical-rf
# c2: link_configuration
# c3: units
# c4: variance
seg-ab9209297ec2 = <b>Stsenaariumi <c1/> aruanne kirjeldab nüüd ennast.</b> Plokk <c2/> kordab lahendatud lingi sisendeid — kandelaine lainepikkus, saatja ja vastuvõtja ava, vahemaa, impulsi laius, integreerimisaeg, efektiivsused ja kaod — vaikeväärtused rakendatud, nii et artikkel ütleb konfiguratsiooni, millega see jooksis, mitte ei tsiteeri lähtekoodist loetud vaikeväärtust. Plokk <c3/> annab iga suuruse ühiku ja päritoluklassi, mida artikkel tõenäoliselt tsiteerib. Üleandmise kovariatsioonijäljed on põhjus, miks see on olemas: need väljastati paljana <c4/> ja käsikiri järeldas ruutmeetreid sisemisest kooskõlakontrollist. Järeldus oli õige, mis on täpselt põhjus, miks see oli defekt — miski ei oleks tabanud, kui see oleks olnud vale. Puhtalt lisanduv: mõõdetuna nelja konfiguratsiooni kohal, { "456" } eelnevalt olemasolevat välja, <b>{ "0" } muudetud, { "0" } eemaldatud, { "196" } lisatud</b>.

# text
# c1: InternalConsistency
seg-5c810155300c = Kontrollimaatriksi rida ajaeelarve reprodutseeritavuse tabeli jaoks, ausalt <c1/> / <b>MODELLED</b> — kogusumma kontrollitakse samas failis olevate liikmete ruutude summa juure vastu, mis jagab mootori enda liikmemääratlusi ja ei ole seetõttu sõltumatu etalon. Koos lisavad need kolm rida. Selle väljalaskmata jaotise jooksev kogusumma on <b>{ "168" } rida — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

# text
# c1: ashfordeOU <236818772+ashfordeOU@users.noreply.github.com>
# c2: ashfordeOU <contact@ashforde.org>
# c3: Chakshu Baweja <contact@ashforde.org>
# c4: dependabot[bot]
seg-ed290a85ab0e = <b>Commit'ide autorlus kogu ajaloos on nüüd üks identiteet ja kaks avaldatud crate'i osutavad commit'ile, mida enam pole.</b> 2026-09-21 kirjutati git-ajalugu ümber nii, et iga inimese commit'i autor ja commit'ija on <c1/>. Varem kandis see ühe isiku kolme kirjaviisi — { "688" } commit'i kujul <c2/>, { "34" } kujul <c3/> ja { "94" } juba kanooniline. Ainus <c4/> commit jäeti tahtlikult oma autorile: roboti sõltuvuse tõstmise ümbersildistamine väidaks autorlust töö eest, mida siin keegi ei teinud.

# text
# c1: v0.26.0
# c2: 92284e9420605568f1bfabb78cd95d383b40f3e2
seg-ec4e75f94462 = <b>Sisu ei muutunud.</b> Ümberkirjutus puudutas ainult autori ja commit'ija päiseid ning see on kontrollitav, mitte väidetav: iga sildi ja iga haru puu on bitt-bitilt identne sellega, mis see oli enne. <c1/> lahendub endiselt puuks <c2/>, täpselt nagu varem.

# text
# c1: v0.26.0
# c2: dce2dbf7700788cf6de46260c14673c0e5347360
# c3: d4921f3025569e00e425e1747d0acfc261e96e18
seg-bc0f4fa0a009 = <b>Mis see maksis.</b> Commit'i nimi on räsi selle puust, vanematest ja autoripäistest, nii et esivanema muutmine nimetab ümber iga järeltulija. Väljalaske <c1/> commit oli <c2/> ja on nüüd <c3/>. Kaks artefakti kirjendasid vana nime avaldamise ajal ja neid ei saa parandada, sest avaldatud registri versioon on kavandi poolest muutumatu:

# text
# c1: kshana
# c2: .cargo_vcs_info.json
# c3: dce2dbf…
seg-52e096332738 = <c1/> { "0.26.0" } crates.io-s — <c2/> kirjendab <c3/>

# text
# c1: kshana-mcp
# c2: path_in_vcs: mcp/kshana-mcp
seg-8ec39d2f136c = <c1/> { "0.26.0" } crates.io-s — sama sha1, <c2/>

# text
# c1: gitHead
seg-9a21b7c7b41c = Midagi muud see ei mõjuta. npm-i pakett ei kirjenda <c1/> ja PyPI levitus ei kirjenda üldse commit'i; mõlemad kontrolliti, mitte ei eeldatud.

# text
# c1: dce2dbf…
seg-9c51c5fb0d80 = Pole parandust, mis paneks <c1/> nimetama ümberkirjutatud commit'i: see string <em>on</em> vana esivanemate ahel ja ainus viis, kuidas see lahendub, on hoida ümberkirjutuse-eelne ajalugu avaldatuna, mis taastaks autorluse, mille ümberkirjutus eemaldas. Versiooni { "0.26.0" } päritolu kulgeb seetõttu sildi, mitte kirjendatud sha1 kaudu — ja silt annab identsed baidid, millest crate ehitati. Järgmine väljalase kirjendab kehtiva commit'i ilma täiendava tegevuseta.

# text
# c1: realtime-frame-eop
# c2: finals2000A
# c3: predicted_rows.n = 0
# c4: tools/finals2000A_2026.txt
# c5: predicted_rows.n = 12
# c6: predicted_rows.n
# c7: p4_frame_eop.csv
# c8: tests/golden/realtime-frame-eop.csv
# c9: docs/revisions/G12-default-eop-cell-changes.md
seg-30ecea86118a = <b>Stsenaariumi <c1/> vaikimisi EOP fail ei sisaldanud ennustusridu (G12).</b> Stsenaarium manustas viierealise <em>ainult lõplike</em> väljavõtte <c2/> oma võrguühenduseta vaikeväärtusena, nii et paljas jooksutus teatas <c3/> ja horisondipõhine tabel toetus { "5" }, { "4" }, { "3" } ja { "2" } paarile. Mootor võis alati ennustusrida lugeda — sisendil lihtsalt polnud ühtegi. Vaikeväärtus on nüüd sõna-sõnalt IERS { "2026" } väljavõte (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } Bulletin B lõplikku ja <b>{ "12" } Bulletin A ainult ennustusrida</b>, nii et paljas jooksutus ilma failiargumendi ja võrguta teatab <c5/> ja horisondipõhise tabeli väärtusel n = { "20" } / { "31" } / { "30" } / { "29" } ning operatiivse ennustaja võrdlus ja kokkulangevus toote enda avaldatud ennustustega täituvad samuti. Pika ulatusega 45-realist väljavõtet mõõdeti alternatiivina ja lükati tagasi: see on samuti ainult lõplik, nii et see oleks jätnud <c6/> väärtusele { "0" }. <b>See muudab avaldatud arve</b>, reegli R4 alusel ja asutaja loal: kümme { "22" } lahtrist välja antud failis <c7/> ja { "24" } { "42" } täidetud lahtrist failis <c8/>. Mõõdetud kiire-miinus-lõpliku poolusepõhi muutub väärtuseks { "0.0678" } mas (varasema { "0.0769" } mas asemel), mis on väärtus, mille paberi P4 enda poolusliikumise tabel juba avaldab väärtusel n = { "20" } — need ühtivad nüüd, mitte ei erine { "13.5" } % võrra. Iga teine arv, mille P4 sellest tabelist trükib, on trükitud täpsusega muutumatu. Täielik vana → uus loend, sealhulgas väljad, mis <em>ei</em> liikunud, on failis <a1><c9/></a1>. Ainult lõplik väljavõte jääb tarnitud, bait-baidilt kinnitatud ja kasutatud: ennustusridade nullarv sellel on faili omadus ja test tõestab seda endiselt.

# text
# c1: moonlight-service-volume
# c2: n_sats
# c3: n_sats > 12
seg-17fbc566dc5b = <b>Aegunud satelliidipiirang failis <c1/>.</b> Stsenaarium piiras väärtuse <c2/> arvuni { "12" }, kuigi selle enda konstellatsiooniehitaja toetab arvu { "24" } ja test kinnitab arvu { "24" }; seetõttu vähendati iga taotletud arvu üle { "12" } vaikselt ja satelliidiarvu pühkimine andis üle { "12" } identsed väärtused, mida ei saanud eristada tõelisest geomeetrilisest küllastusest. Nüüd piiratakse ehitaja piirini. See on käitumismuudatus ainult juhul <c3/>.

# text
# c1: lunar-differential-pnt
seg-4df7d4d61b40 = Sama aegunud piirang failis <c1/>.

# text
# c1: lunar_dpnt
# c2: n_sats
# c3: dpnt_nsats_sweep.csv
# c4: n = 16
# c5: n = 12
# c6: n = 16
# c7: n_sats > 12
seg-8adfbd27c4f8 = <c1/> piiras väärtuse <c2/> arvuni { "12" } sama tagajärjega ja see jõudis avaldatud tabelisse: <c3/> sisaldab rida <c4/>, mis on baidi haaval identne reaga <c5/>, sest mootor tagastas kaheteistkümne satelliidi vastuse kuueteistkümne satelliidi sildi all. Nüüd piiratakse ehitaja piirini { "24" } ja uus test fikseerib selle: iga suurem konstellatsioon peab teatama oma arvust ja kaitsetaset rangelt parandama, nii et piirang ei saa märkamatult tagasi tulla. <b>See muudab avaldatud arve</b>: kaitsetase <c6/> muutub { "16.92" } m → { "14.57" } m. Arvuni { "24" } pühitult on kõver rangelt monotoonne ({ "11.94" } m { "24" } satelliidi juures, { "29.5" } % parem kui { "12" } juures), seega { "12" } juures küllastust pole: näiline platoo oli piirang. Käitumismuudatus ainult juhul <c7/>.

# text
seg-ebee158b73c8 = Dokumentatsiooni, läbipaistvuse ja mänguväljaku väljalase. Mootori käitumine ei muutu: kontrollimaatriksis on <b>{ "102" } rida — { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, muutumatu versioonist { "0.25.0" }.

# text
# c1: //!
# c2: lib.rs
seg-7af422ed6d89 = <b>Teegitaseme rustdoc</b> (<c1/> failis <c2/>), mis hõlmab sisenemispunkte, aususe/tasemete mudelit ja reprodutseeritavust, nii et docs.rs avaneb päris avalehena, mitte paljana moodulite seinana.

# text
# c1: docs/SCENARIOS.md
# c2: 50
# c3: api::list_scenario_kinds()
# c4: gen_validation_artifacts
# c5: tests/scenarios_reference_doc_sync.rs
seg-dd44c25f3af5 = <b><c1/></b> — liigipõhine teatmik kõigi <c2/> stsenaariumi liigi kohta, genereeritud funktsioonist <c3/> (ainus tõeallikas) käsuga <c4/> ja kaitstud testiga <c5/>, nii et see ei saa dispetšerist kõrvale triivida.

# text
# c1: allan
# c2: estimator
# c3: fom
# c4: hybrid
# c5: inertial
# c6: models
# c7: report
# c8: run
# c9: scenario
# c10: timetransfer
# c11: types
seg-e2cc77d3b413 = <b>Moodulidokumentatsioon</b> { "11" } varem dokumenteerimata avaliku mooduli jaoks (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

# text
# c1: batch_ls
# c2: cr3bp
# c3: detection
# c4: attitude_budget
# c5: reentry
seg-8d156713799d = <b>Kirjandusallikad</b> viiele valemimoodulile, mis esitasid võrrandi, kuid ei nimetanud viidet: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon et al.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

# text
# c1: security.txt
seg-832b4bfbc48a = <b>Avaldatud <c1/></b> aadressil kshana.dev koordineeritud avalikustamiseks.

# text
# c1: fomTier()
# c2: src/fom_label.rs
seg-30603f59e27d = <b>Käitluskordse valideerimistase mänguväljakul.</b> Ühe käitluse kvaliteedinäitajate tabel sisaldab nüüd iga näitaja kohta VALIDATED/MODELLED märki, mis loetakse samast otsingust <c1/>, mida kasutab allalaaditav aruanne (peegeldab faili <c2/>, mis ise tuletatakse kontrollimaatriksist), nii et elava arvu kõrval kuvatav tase ei saa kunagi registriga vastuolus olla.

# text
# c1: lunar-attack-surface
seg-93b203f3a1c0 = <b><c1/></b> mänguväljaku menüüs — kõik { "50" } käivitatavat liiki on nüüd ühe klõpsu kaugusel (varem 49/50).

# text
seg-1ec0830db404 = <b>Viis täiendavat käivitatavat võimekuskaarti</b> (kosmoseilm, RF-häirete hindamine, vastupidavus, CCSDS OEM koostalitlus, KIF), mis tõstavad käivitatavate kaartide arvu { "11" }-st { "16" }-ni. API- ja teegipõhised kaardid säilitavad ausa dokumentatsioonilingi, mitte võlts käivitusnuppu.

# text
seg-977ea074dd9d = Dokumentatsiooni katvust hoitakse nüüd CI-s ratšeti põhimõttel.

# text
# c1: check-doc-coverage.sh
# c2: missing_docs
# c3: #![warn(missing_docs)]
# c4: -D warnings
seg-beb308bcaafb = <c1/> kompileerib teegi lipuga <c2/>, loeb hoiatused kokku ja ebaõnnestub ainult siis, kui arv ületab fikseeritud ülempiiri ({ "986" }). Range <c3/> koos <c4/> oleks muutnud ~{ "1000" } praegu dokumenteerimata avalikku üksust üleöö ehituse katkestuseks; nii ebaõnnestub ehitus uute dokumenteerimata avalike üksuste korral, samal ajal kui olemasolevat tagavara vähendatakse teadlikult.

# text
# c1: list_scenario_kinds
# c2: api::list_scenario_kinds()
seg-27668072a608 = <b>MCP tööriista <c1/> rida reklaamis „~{ "17" } sisseehitatud stsenaariumi liiki“</b>, kuigi <c2/> oli juba mõnda aega esitanud { "50" } — agendile suunatud dokument alahindas tegelikku võimekust kolmekordselt. Fikseeritud tegelikule arvule.

# text
seg-1ffc9f9816e8 = Uuendatud sõltuvusgraafi jaoks genereeriti uuesti CycloneDX SBOM-i standardi järgimise sõltumatu etalon ({ "60" } komponenti). Standardi järgimise otsus on muutumatu: normaliseeritud skeemivigu on null ja iga aatomlitsentsi tunnus kuulub endiselt ametlikku SPDX loendisse.

# text
seg-a6db590bbcbe = <b>Viis võimekust edutati väliselt VALIDATED tasemele</b>, iga neist on nüüd ristkontrollitud sõltumatu kolmanda osapoole teostuse vastu sama üheselt defineeritud suuruse jaoks (mitteringlev, võrguühenduseta taastatavate testandmetega):

# text
# c1: allantools
# c2: tests/powerlaw_oadev_reference.rs
seg-98588143b4bb = <b>IEEE-1139 astmeseadusest Alani hälbeks teisendus</b> võrdluses teegi <c1/> suletud kujuga kõigi viie mürategevi jaoks (<c2/>);

# text
# c1: tests/crpa_reference.rs
seg-ce37d70fa8bc = <b>CRPA MVDR / minimaalnormiga nullsuunamise kimbumoodustaja kaalud</b> võrdluses numpy/scipy LAPACK-iga (<c1/>);

# text
# c1: Rotation.align_vectors
# c2: tests/wahba_reference.rs
seg-0f033d1027f8 = <b>Wahba / TRIAD / QUEST orientatsiooni määramine</b> võrdluses SciPy SVD-ga <c1/> müravabadel vaatlustel (<c2/>);

# text
# c1: oem
# c2: tests/ccsds_oem_covariance_reference.rs
seg-e1e2283cb524 = <b>CCSDS { "502.0" } OEM kovariatsiooniploki vahetus</b>, mis käib edasi-tagasi läbi sõltumatu teegi <c1/> parseri (<c2/>);

# text
# c1: ncx2
# c2: chi2
# c3: tests/acquisition_reference.rs
seg-579eefbb646f = <b>ruutseaduslik haaramise tuvastusstatistika tuum</b> (üldistatud Marcum-Q / P_d / P_fa / lävi) võrdluses SciPy-ga <c1/>/<c2/> (<c3/>). Masinkontrollitud valideerimismaatriks liigub tasemele <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> kokku <b>{ "102" } real</b> (varem { "51" } · { "47" } · { "4" }). Ausad ulatuse hoiatused säilivad — nt haaramise edutamine hõlmab ainult tuvastusstatistika tuuma; CFAR/ristumiskadu jääb MODELLED.

# text
# c1: fom::positioning_performance
# c2: 0.589·(σ₁+σ₂)
# c3: scipy.stats
# c4: tests/positioning_fom_reference.rs
# c5: ()
# c6: (cov_enu, hpl_m)
# c7: PositioningFom
seg-b6a140d55580 = <b>Asendiruumi kvaliteedinäitajad</b> (<c1/>): täpsed CEP, SEP ja 2DRMS navigatsioonilahendi 3-D ENU asendikovariatsioonist pluss horisontaalne kaitsetase. CEP/SEP on <em>täpsed</em> mediaanradiaalvead (mitte lineaarne reegel <c2/>), ristkontrollitud teegi <c3/> rayleigh/maxwell kvantiilide ja sõltumatu NumPy Monte Carlo mediaaniga (<c4/>). Asendab varasema ausa teostamata tüübi — <b>funktsiooni signatuur muutus</b> kujult <c5/>, mis tagastas vea, kujule <c6/>, mis tagastab tüübi <c7/>.

# text
# c1: assurance::uncertainty::edf
# c2: allantools
# c3: edf_greenhall
# c4: edf_totdev
# c5: tests/uncertainty_edf_reference.rs
seg-1551afa17154 = <b>Usaldusvahemiku ekvivalentsete vabadusastmete arv (EDF) viidi lõpuni kõigi Alani perekonna hinnangute jaoks</b> (<c1/>): modifitseeritud Alani, Hadamardi ja kogu-dispersiooni EDF kasutavad nüüd Greenhalli ja Riley kombineeritud EDF algoritmi ning NIST SP { "1065" } tabeli 7 TOTVAR vormi (varem oli teostatud ainult kattuva Alani EDF; teised kasutasid vaikselt seda uuesti), ristkontrollitud teegi <c2/> vastu <c3/>/<c4/> (<c5/>).

# text
# c1: tests/validate_p*.rs
# c2: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c3: scipy.special.j1
# c4: (HᵀH)⁻¹
# c5: finals2000A
# c6: src/verification.rs
seg-39753e7919cc = <b>Sõltumatud välised ristkontrollid Kuu PNT geomeetria, DOP-i, EOP, DRO ja RF-kaugusmõõtmise võimekuste jaoks</b> (<c1/>, testandmed ja sõltumatu etaloni generaatorid kataloogis <c2/>). Iga kontroll käitab juba tarnitud <b>modelleeritud</b> võimekust sõltumatu etaloni vastu, mille on andnud <em>teistsugune</em> teostus, nii et kokkulangevus on mitteringlev: orbitaalne edastus-/haaramisjalajälg võrdluses teegiga <c3/> (Cephes — tõeliselt teistsugune Besseli J1); pinnamajaka geomeetria DOP võrdluses sõltumatu NumPy lahendusega <c4/>; UT1/EOP püsivusprognoosi veakasv võrdluses sama sõna-sõnalise IERS-i <c5/> ridade eraldi NumPy uuesti parsimisega; tasapinnaline kauge retrograadse orbiidi perekond võrdluses NASA/JPL kolme keha perioodiliste orbiitide andmebaasiga; ning RF-kaugusmõõtmise korduvtäpsuse eelarve võrdluses esimeste printsiipide etalonega. Need on täiendav regressioonitõend olemasolevate moodulite kohta; nende ristkontrolltestide lisamine ei muuda ise ühegi võimekuse märgistust (ülaltoodud viis edutamist on eraldi, etalonipõhised staatusemuudatused failis <c6/>).

# text
# c1: lunar-attack-surface
# c2: src/attack_surface.rs
# c3: kind = "lunar-attack-surface"
# c4: run_toml
seg-662c04f0552f = <b>Stsenaarium <c1/></b> (<c2/>, <c3/>): komponeeritud, binaarselt ligipääsetav (CLI / Python / MCP / wasm kaudu <c4/>) P1 Kuu signaaliturbe käitus, mis ühendab lingieelarve võimsusdefitsiidi ja selle { "12" }–{ "18" } dB tundlikkusvahemiku, nõutava segamis-/spuufimissaatevõimsuse sõltuvuse kaugusest, orbitaalse haaramisjalajälje päris antennidiagrammi korral, jälgimissilmuse spuufimishaarde sissetõmbetulemuse, õhutu keha silmapiiri ulatuse ning OSNMA/TESLA autentimiseelarve. Tühi keha taastoodab P1 lähtetaseme.

# text
# c1: linkbudget::deficit_sensitivity_band
# c2: deficit_power_factor
# c3: sweep::SweepAxis
# c4: received_signal_power_dbw
seg-a9b7ee942a23 = <b>Võimsusdefitsiidi tundlikkusvahemik</b> (<c1/>, <c2/>): tõeline mitmeteljeline pühkimine (etalon × EIRP × kaldkaugus), ehitatud tüübile <c3/> ja hinnatud funktsiooni <c4/> kaudu, mis taastoodab P1 { "12" }–{ "18" } dB vahemiku ning ühtlustab { "32" }× (ümardatud) / { "36" }× (ümardamata) lineaarteguri väärtused.

# text
# c1: spoof_capture::capture_cube
# c2: capture_map
seg-0734a4ca7535 = <b>Kolmemõõtmeline spuufimishaarde kuup</b> (<c1/>): lisab haardekaardile kandja/Doppleri nihke telje (J/S × koodinihe × kandjanihe, lukustusaeg raku kohta); nullkandja lõige taandub täpselt 2-D kaardiks <c2/>.

# text
# c1: monitor_network
# c2: spoof_monitors
# c3: lunar_service
# c4: detection
# c5: SurfaceMonitor
# c6: SpoofEvent
seg-3b9bbc25b114 = <b>Hõreda seirevõrgu tuvastamine</b> (<c1/>) komponeerib nüüd füüsikalise <c2/> AGC statistiku ja <c3/> selenograafilise nähtavusvõrgu, et tuletada iga jaama tuvastusstatistik ja geomeetria vabade parameetrite ja ad hoc suurringi ülekatte asemel; seirekohane ja võrgu tuvastustõenäosus jäävad mooduli <c4/> hii-ruut/Marcum-Q suletud kujudeks. <b>Väljad <c5/> / <c6/> muutusid</b> füüsikalisteks (lat/lon/kõrgus/võimsus) suurusteks.

# text
# c1: nma_budget
# c2: auth_latency
seg-54c36267382c = <b>OSNMA/TESLA autentimise lisakulu mõõtmine</b> (<c1/>): OSNMA väljade lehekülje kohased osad (8-bitine HKROOT + 32-bitine MACK { "2" } s lehekülje kohta) olid ekslikult märgitud alamkaadri kogusummadeks, mistõttu lisakulu alahinnati { "15" } korda ({ "1.33" } bit/s). Parandatud avaldatud SIS-ICD alamkaadri (30 s) kogusummadele (HKROOT { "120" } + MACK { "480" } bitti ⇒ <b>{ "20" } bit/s</b>). Tagajärg on nüüd ausalt öeldud: { "50" } bit/s AFS navigatsioonikiiruse korral on autentimise lisakulu <b>esimese järgu ≈{ "40" } %</b> kulu, mitte tühine mõne protsendi suurune; väli <c2/> on dokumenteeritud kui võtme avalikustamise viivitus (alampiir otsast lõpuni aja kuni esimese autenditud lahendini).

# text
seg-0cf179a34252 = Lai võimekuse väljalase. See toob kaks täielikult <b>väliselt valideeritud</b> analüüsikomplekti — täieliku <b>mitmekriteeriumilise otsusanalüüsi (MCDA)</b> perekonna ja <b>Alani triivi / pika τ kella stabiilsuse</b> hinnangud — ning avab aluse peale uue käivitatava <b>Kuu ajaeelarve, reaalajas raami/EOP, optilise/RF hübriidi, tsislunaarse jälgitavuse ja kihilise PNT konfliktikindluse</b> stsenaariumikihi, lisaks <b>Kuu pinnamajaka</b> ja <b>signaaliturbe</b> võimekuse aluse. Masinkontrollitud valideerimismaatriks kasvab tasemele <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> kokku <b>{ "102" } real</b> (varem { "40" } · { "47" } · { "4" } kokku { "91" } real): kõik üksteist uut rida on otsusanalüüsi ja ajastushinnangute väliste sõltumatute etalonidega valideerimised, kontrollitud sõltumatute teekide (SciPy, pymcdm, pyDecision, allantools) vastu range tolerantsiga, samal ajal kui uus PNT võimekuse pind esitatakse ausalt kui MODELLED. Nagu alati, ei edutata ühtegi arvulise mudeli väidet ilma väline andmestikuta selle taga.

# text
# c1: kind
# c2: tests/determinism.rs
# c3: scenarios/*.toml
seg-267e50f8dd56 = <b>Käivitatavad stsenaariumid</b> — igaüks registreeritud stsenaariumi <c1/>-id, edastatud mootori kaudu ja CI-s otsast lõpuni tõestatud testiga <c2/> (mis käitab iga kaasasoleva <c3/> ja ebaõnnestub kõvasti iga mittekäivitatava testandmestiku korral):

# text
# c1: conflict-resilience
# c2: src/conflict_resilience.rs
# c3: src/conflict_threat_params.rs
seg-c87fc11dd86b = <b>Kihilise PNT konfliktikindlus</b> (<c1/>, <c2/>) — algväärtusega (seed) Monte Carlo vastupidavuse mootor mitmekihilise PNT arhitektuuri jaoks, mille juurde kuulub § { "4.2" } <b>ohuvektorikohane sujuva halvenemise ellujäämise</b> mudel (neli nimetatud ohuvektorit, kasutatava PNT ellujäämise suletud kuju, millele iga kihipõhine Monte Carlo koondub, väljastatakse tulemuse JSON-is) ning dokumenteeritud, triivi vastu kaitstud ohuparameetrite päritolu (<c3/>). MODELLED arhitektuurid; ellujäämise Monte Carlo koondumine suletud kujule on valideeritud tuum.

# text
# c1: cislunar-observability
# c2: src/cislunar_observability.rs
seg-9c69e4d8ade9 = <b>Tsislunaarne jälgitavus</b> (<c1/>, <c2/>) — jälgitavuse Grami maatriksi omaspekter kaare kohta, diferentsiaalselt korrigeeritud kauge retrograadse orbiidi (DRO) algväärtustaja ja sõltumatu ruutjuur-infofiltri ristkontroll, mille aposterioorne kovariatsioon muutub lõplikuks täpselt täieliku jälgitava astaku korral. MODELLED konstellatsioon; astaku/Grami maatriksi/STM/SRIF invariandid on valideeritud tuum.

# text
# c1: hybrid-optical-rf
# c2: src/hybrid_integrity.rs
# c3: src/optical_availability.rs
# c4: src/optical_linkbudget.rs
# c5: src/cross_raim.rs
seg-92fb333483e5 = <b>Heterogeense optilise/RF hübriidi pidevus ja terviklikkus</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) — valdkondadevaheline kättesaadavus ja terviklikkus, kui optiline ja RF PNT on kombineeritud. MODELLED.

# text
# c1: lunar-time-budget
# c2: src/lunar_time_budget.rs
# c3: realtime-frame-eop
# c4: src/realtime_frame_eop.rs
# c5: src/frame_eop.rs
seg-08e2f640ae14 = <b>Endogeenne Kuu ajaeelarve</b> (<c1/>, <c2/>) ja <b>reaalajas raami / EOP eelarve</b> (<c3/>, <c4/>, <c5/>) — P3/P4 Kuu aja ja Maa orientatsiooni eelarved, mis on tuletatud endogeenselt ajastusahelast, mitte väidetud. MODELLED.

# text
seg-52c2f9c2c9a7 = <b>Väliselt valideeritud analüüsikomplektid</b> — teegivõimekused, millest igaüks siseneb maatriksisse uute VALIDATED ridadena (kontrollitud sõltumatu välise etaloni vastu, mitte enesekontrollina):

# text
# c1: src/mcda/
# c2: tests/mcda_*_reference.rs
seg-709789e8fb04 = <b>Täielik mitmekriteeriumilise otsusanalüüsi (MCDA) komplekt</b> (<c1/>) — neli meetodiperekonda: väärtuse agregeerimine (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), suhtsüsteem (<b>MOORA</b>) ja proportsionaalne (<b>COPRAS</b>), kaugus ideaalist (<b>TOPSIS</b>), kompromissprogrammeerimine (<b>VIKOR</b>) ja ülekaalumine (<b>PROMETHEE II</b> kuue üldistatud kriteeriumi kujuga, <b>ELECTRE I</b> kooskõla/lahknevus) — pluss <b>AHP</b> Perroni omavektori prioriteedikaalud Saaty järjepidevussuhte (CR < { "0.10" }) väravaga, <b>MAUT</b> kasulikkus, Pareto frondi eraldamine ja kaalude <b>tundlikkuse</b> analüüs. Üheksa agregaatorit taastoodavad teegid <b>pymcdm</b> / <b>pyDecision</b> ning AHP omavektor langeb kokku SciPy/LAPACK-iga, kõik täpsusega < { "1e-9" } (<c2/>). Tundlikkuse tornaado on esitatud ka konfliktikindluse stsenaariumi sees.

# text
# c1: src/allan.rs
seg-2ce49cbfd8bf = <b>Alani triivi ja pika τ kella stabiilsuse hinnangud</b> (<c1/>) — <b>MTIE</b> (ITU-T G.810/G.823/G.8261 tipust tippu ajavea triivistatistik, mille vastu sünkroonimismaskid on kirjutatud), <b>MDEV</b> ja <b>TDEV</b> ajapiirkonna triiv ning <b>Theo1 / TOTVAR</b> laiendatud ulatusega hinnangud. VALIDATED teegi <b>allantools</b> vastu NIST SP { "1065" } reaga; TOTVAR-ile rajatud nihkevaba <b>ThéoH</b> hübriid jääb ausalt MODELLED.

# text
# c1: src/assurance/
seg-68bcdf8bd5de = <b>Kindlustus- / välise etaloni raamistik</b> (<c1/>) — etaloniraamistik, mis on ühendatud otse CI ausustõkkega, <b>W3C-PROV</b> päritolukirje deterministliku Merkle juurega ning <b>Greenhalli</b> ekvivalentsed vabadusastmed + hii-ruut usaldusvahemikud stabiilsushinnangutele.

# text
# c1: src/registry.rs
# c2: src/api.rs
# c3: ExternalPack::register_into
seg-dcb91813b24c = <b>PackRegistry / ExternalPack laienduskoht</b> (<c1/>, <c2/>) — edastuskoht, mille kaudu võimekuspaketid suunatakse ühe registri kaudu (sisseehitatud edastus asub CLI kuumal teel; puust väljas paketid ühenduvad vaikeväärtusega <c3/> taga), kaitstud golden baidi-identsuse standardi järgimise komplektiga ning iseseisva / wasm32 CI väravaga.

# text
# c1: kind
seg-16b1f5d249ed = <b>Modelleeritud võimekuse alus</b> — uued teegimoodulid, mis toidavad ülaltoodud ja tulevasi stsenaariume (veel mitte iseseisev stsenaariumi <c1/>-id):

# text
# c1: src/lunar_beacon.rs
# c2: src/lunar_perturbed.rs
# c3: src/jamming.rs
# c4: src/linkbudget.rs
seg-f8c9ffbc56cf = <b>Kuu pinnamajaka DOP</b> (<c1/>) realiseeritud täpsuse eelarve, N satelliidi pühkimise ja GDOP kaardiga, pluss häiritud Kuu efemeriid (<c2/>) ning õhutu silmapiiri geomeetria / spuufimisvõimsuse pöördülesanne / AFS defitsiidi vahemik (<c3/>, <c4/>). Taaskasutab gnss_lib_py-ga valideeritud DOP tuuma.

# text
# c1: src/realdata/lola_dem.rs
seg-28209a2747d5 = <b>LOLA-vormingus DEM sisend</b> + maastikunähtavus (<c1/>).

# text
# c1: src/spoof_capture.rs
# c2: src/cross_sensor_integrity.rs
# c3: src/monitor_network.rs
# c4: src/antenna.rs
# c5: src/nma_budget.rs
seg-6e98ac90a0e2 = <b>Signaaliturbe kolmekihiline kaitse</b> — spuufimishaare, andurite-vaheline terviklikkus ja seirevõrgu mõõtmine (<c1/>, <c2/>, <c3/>) koos orbitaalkiire antennijalajälje ja OSNMA autentimiseelarvega (<c4/>, <c5/>). MODELLED.

# text
# c1: src/verification.rs
seg-bd5b9511accb = Valideerimismaatriks ja iga tuletatud artefakt genereeriti uuesti ainsast tõeallikast (<c1/>): saidi register, moodulikaardi ja valideerimispäritolu diagrammid ning README / pinnakohased arvustringid näitavad nüüd <b>{ "51" } / { "47" } / { "4" } kokku { "102" }-st</b> (varem { "40" } / { "47" } / { "4" } kokku { "91" }-st); arvuausluse kaitse skannib nüüd kogu git-ajalugu ja README joonised on ühtlustatud tumeda kaubamärgipaleti peale.

# text
# c1: integrate
# c2: integrate_dopri
# c3: src/integrator.rs
seg-c2ec7e2b6296 = Üks ühine adaptiivne integreerimisdraiver toetab nüüd nii funktsiooni <c1/> kui ka <c2/> (<c3/>), eemaldades dubleeritud sammutaja.

# text
seg-85cfb0f10268 = CI-sse lisati <b>SonarQube Cloud</b> staatiline analüüs (Rust + imporditud katvus), README-s on turvalisuse / hooldatavuse / töökindluse hinnangumärgid.

# text
seg-deeef8318367 = Väljalaske / pakendamise distsipliin: CI registreerib iga paketi/registri avaldamise jaoks juurutuskeskkonna ning keskendunud avalik iseseisev töö on aeglastest valideerimisbinaaridest eraldatud.

# text
seg-30181148b098 = Autorsuse puudumise hügieenikaitse on piiratud ainult autorlusmärkidega, nii et integratsioonihosti või toote nimetamine ei lase enam ehitust ebaõnnestuda.

# text
seg-6eb3868fdce0 = Dokumentatsioon: README jaotis <b>Citing</b> loetleb nüüd neli avaldatud arXiv eeltrükki ning pinnamajaka DOP võimekus on dokumenteeritud Kuu reas.

# text
seg-d12533cbf1f2 = Täisarvulised tsüklilugejad ujukomaga juhitud tsüklite jaoks (Sonar S2193).

# text
seg-3c213354187f = Täpne hii-ruut pöördfunktsioon madalate vabadusastmete korral Newtoni täpsustuse kaudu kindlustuse usaldusvahemiku teel.

# text
seg-386b7094d34d = kshana.dev: standardite jaotis avaneb nüüd vaikimisi ja registri arvu tagavaraväärtus on parandatud; jälgitavuse kihi ümber olevad aegunud README / saidi stringid sünkroonitud.

# text
seg-33448f46894f = Võimekuse väljalase, mis lisab üldise <b>Fisheri informatsiooni / Cramér–Rao jälgitavuse ja optimaalse eksperimendikavandi kihi</b> ning väljalase, millele Kuu PNT jälgitavuse artikkel toetub. Masinkontrollitud valideerimismaatriks kasvab tasemele <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> kokku <b>{ "91" } real</b> (varem { "39" } · { "46" } · { "4" } kokku { "89" } real): uus hindamismootor on kontrollitud välise etaloni vastu ja on VALIDATED; selle Kuu rakendus on ausalt MODELLED. Nagu alati, ei edutata ühtegi arvulise mudeli väidet ilma väline andmestikuta selle taga.

# text
# c1: src/fim.rs
# c2: M = HᵀWH
# c3: best_design
# c4: eigh
# c5: inv
# c6: tests/fim_observability_reference.rs
seg-c377207026f4 = <b><c1/> — Fisheri informatsioon, Cramér–Rao piirid ja optimaalne eksperimendikavand.</b> Üldine korduvkasutatav hindamisteooria mootor: Fisheri informatsioonimaatriks <c2/> mõõtmise Jacobi maatriksist ja kaaludest; sümmeetriline omaväärtuslahendaja (tsükliline Jacobi); Cramér–Rao alampiir pöördmaatriksi kaudu või Moore–Penrose pseudopöördmaatriksi pluss nullruumi baasi kaudu, kui informatsioon on astakupuudulik (vaba võrgu / datumi defekti juhtum); ning D-, A-, E- ja T-optimaalsed eksperimendikavandi mõõdikud koos valijaga <c3/> kandidaatgeomeetriate üle. <b>VALIDATED</b> NumPy (<c4/>/<c5/>) ning Kay ({ "1993" }) avaldatud suletud kujuga piiride vastu täpsusega { "1e-9" } (<c6/>), nii et see siseneb maatriksisse välise etaloni reana, mitte enesekontrollina.

# text
# c1: lunar_observability
# c2: src/lunar_combination.rs
seg-91d09b4e737f = <b>Kuu ühis-OD jälgitavus</b> (<c1/> failis <c2/>, esitatud Kuu kombinatsiooni aruandes): rakendab FIM/CRLB mootori ühisele orbiidi ja kella lahendusele, et esile tuua absoluutse jaama datumi defekt, selle astaku taastumine Maa baasjoonega jaamade lisamisel, saavutatud jaama asendi CRLB ja E-optimaalne tinglikkus. Ausalt <b>MODELLED</b> — hindamismootor on väliselt valideeritud, kuid Kuu võrk, millele seda rakendatakse, on esindussimulatsioon ja ükski praegune andmestik ei saa seda geomeetriat mõõtmiseks muuta.

# text
# c1: orbit_ecc
# c2: orbit_inc_deg
# c3: orbit_argp_deg
# c4: orbit_planes
# c5: elfo_geometry_confirms_the_observability_structure
seg-6b1cd00aca8c = <b>Esindav elliptilise Kuu külmutatud orbiidi (ELFO) geomeetria</b> Kuu kombinatsiooni stsenaariumi jaoks (<c1/>, <c2/>, <c3/>, <c4/>; ringpaigutus jääb vaikeväärtuseks) ning aruande ilma-VLBI jälgitavuse väli, et datumi defekti tulemust saaks näidata geomeetriaüldisena. Sama { "3" }→{ "1" }→{ "0" } redel ja kolme jaama lävi kehtivad Moonlight/LCNS-perekonna ELFO-l ning kolme Maa VLBI baasjoone korral on absoluutne jaama asend jälgitav alammeetrilise piiriga — lukustatud testiga <c5/>. Endiselt MODELLED.

# text
# c1: src/verification.rs
# c2: web/data/verification-matrix.json
# c3: docs/VERIFICATION-MATRIX.md
# c4: docs/MODELLED-RATIONALE.md
seg-9e6627c0c417 = Valideerimismaatriks ja iga genereeritud tõendiartefakt genereeriti uuesti ainsast tõeallikast (<c1/>): register (<c2/>), <c3/>, <c4/>, valideerimise jaotuse ja etaloniliigi joonised ning README arvustringid kõigil levituspindadel näitavad nüüd <b>{ "40" } / { "47" } / { "4" } kokku { "91" }-st</b>.

# text
seg-6f90233290a2 = Ainult pakendamise paranduslõige. Mootori, stsenaariumi ega tulemuste muudatusi pole; valideerimismaatriks on muutumatu: { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER kokku { "89" } real.

# text
# c1: repository.url
# c2: AshfordeOU
# c3: repository
# c4: ashfordeOU
# c5: package.json
seg-9d41e1412d1f = npm publish: crate'i manifestist tuletatud pakett <c1/> kasutas vale suurtähestusega GitHubi omanikku (<c2/>), mis ebaõnnestus npm-i sigstore päritolu kontrollis (see võrdleb omanikku tõstutundlikult). Manifesti <c3/> on nüüd kanooniline väiketähtedega <c4/>, nii et genereeritud <c5/> vastab päritoluobjektile ja npm-i väljalase avaldatakse.

# text
# c1: codegen-units = 1
seg-fe1f8aae99f4 = Wheel-i ehitus fikseerib <c1/>, et manylinux wheel oleks uuesti ehitamisel bait-baidilt reprodutseeritav (uuesti ehitamise ja diffi reprodutseeritavuskontroll).

# text
seg-b87075b47007 = Konsolideeriv väljalase, mis keskendub <b>tõenditele, päritolule ja levitamisdistsipliinile</b>. Masinkontrollitud valideerimismaatriks kasvab tasemele <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> kokku <b>{ "89" } real</b> (varem { "15" } · { "42" } · { "4" } kokku { "61" }), mille taga on modelleeritud võimekuste ristvalideerimine sõltumatute väliste etalonidega. Iga levitatav artefakt kannab nüüd krüptograafilist SLSA ehituspäritolu atesteeringut, sisaldab CycloneDX SBOM-i ja avaldatakse sünkroonselt kõigil pindadel. Ühtegi arvulise mudeli väidet ei edutata ilma väline andmestikuta selle taga; uus võimekus jääb ausalt MODELLED.

# text
# c1: src/attitude_dynamics.rs
seg-f6de783bfd29 = <b>Orientatsioonidünaamika</b> (<c1/>, MODELLED) — väändemomendivaba jäiga keha Euleri võrrandid + kvaternioonkinemaatika (RK4), koos jäävusseaduste enesetestidega (kvaternioonnorm, kineetiline energia, |Iω|, sümmeetrilise vurri pretsessioon).

# text
# c1: quantum_trade
# c2: tests/fixtures/optical_clock_adev/
# c3: src/sdr.rs
# c4: src/altpnt/terrain.rs
seg-339bc18b9fc4 = <b>Modelleeritud võimekuste ristvalideerimine</b> sõltumatute väliste etalonidega, mis viib valideerimismaatriksi { "39" } VALIDATED reani, millest igaühe taga on väline andmestik (CI ausustõke keelab VALIDATED staatuse ilma selleta). Uusimad välise etaloniga valideerimised: <b>optilise kella mõõdetud stabiilsuskõver</b> (<c1/> ADEV-kõvera sobitus taastoodab Norcia et al. avaldatud ⁸⁸Sr optilise võrekella σ_y(τ), <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, kaasatud kataloogi <c2/>); <b>GPS L1 C/A hajutuskoodi genereerimine</b> (<c3/> G1/G2 LFSR taastoodab IS-GPS-200 tabeli 3-Ia koodifaasi oktaalid PRN { "1" }–{ "9" } jaoks); ning <b>SRTM kõrgusmudeli lugeja päris maastikul</b> (<c4/> loeb kaasatud avaliku omandi NASA/USGS SRTM v3 lehe N36W117 / Death Valley, paigutades Badwater Basini selle dokumenteeritud uuringuvahemikku).

# text
seg-665d0dde637b = <b>Uued MODELLED võimekused</b>, millest igaüks on sisemiselt ristkontrollitud suletud kuju või õdekoodi tee vastu: Clohessy–Wiltshire / Hilli suhtelise liikumise dünaamika, TDOA/FDOA passiivne emitteri geolokatsioon, Wahba/TRIAD/QUEST orientatsiooni määramine, GNSS kandelaine faasi täisarvuliste mitmetähenduslikkuste lahendamine (LAMBDA), B-tasandi sihtimine ja koonuste liitmise gravitatsioonimanööver, CRPA häiretevastane antennimassiivi kimbumoodustus, GNSS ruutseaduslik haaramisstatistika, kvantinertsiaalanduri vöötmitmetähenduslikkus / dünaamiline ulatus, IEEE-1139 astmeseaduslik kellamüra + flicker-FM põhi ning CCSDS-OEM kovariatsiooniploki vahetus.

# text
seg-b3f53d5e3c3a = <b>Ühe allikaga tõenditeregister</b> genereeritud kontrollidokumentatsiooni ja triivikaitsega; sirvitav valideerimisregister aadressil kshana.dev koos kaardipõhiste tõendite otselinkidega.

# text
# c1: codemeta.json
# c2: .zenodo.json
# c3: tests/citation_metadata_doc_sync.rs
seg-b3c0545157b3 = <b>Masinloetavad tsiteerimismetaandmed</b> — <c1/> (CodeMeta { "2.0" }) ja <c2/>, mis on Cargo manifestiga seotud testiga <c3/>.

# text
seg-2ca8875da9de = <b>Tarneahela päritolu</b> — SLSA ehituspäritolu atesteering crate'i tarballile, wheel-idele, sdist-ile ja npm tarballile; PyPI OIDC Trusted Publishing; CycloneDX SBOM, mis on kaasatud wheel-i ja npm paketti; reprodutseeritava ehituse diff ja väljalaskejärgne kontroll.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: validation-breakdown
seg-18fdecf7f2fa = <b>Leitavus</b> — <c1/>, <c2/> ning Open Graph / JSON-LD metaandmed aadressil kshana.dev; maatriksist tuletatud genereeritud joonis <c3/>.

# text
seg-f80db0b0f545 = <b>Pinnakohased README-d</b> crates.io / PyPI / npm jaoks koos arvuausluse kaitsega.

# text
seg-bd33b21f8f91 = <b>Sagnaci aja edastamise</b> etalon uuendati tüübile ExternalDataset — ekvatoriaalse ringi Sagnaci parandust kontrollitakse nüüd Ashby avaldatud { "207.4" } ns vastu (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, võrrand { "1.29" }; taastoodetud täpsusega < { "0.05" } ns). Liitaja edastamise võimekus jääb ausalt MODELLED.

# text
# c1: oracle-kind-stacked
seg-882133bf1fcc = <b>Dokumentatsioon, diagrammid ja joonised värskendati</b> elava maatriksi (39/46/4/89) järgi: valideerimise päritolu diagramm, joonis <c1/> (nüüd maatriksist genereeritud CI triivikaitsega), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, arhitektuuri- ja õpetusdokumendid ning kshana.dev registri kogusumma.

# text
seg-a9be3d71a52c = Lähtekoodipuu vormindati uuesti fikseeritud rustfmt-iga (tööriistaahel { "1.93.0" }) — puhas stiil, käitumine ei muutu.

# text
# c1: scripts/check-version-sync.sh
seg-4542eb4fabfc = <b>Sünkroonne versioonimine.</b> Iga levituspind (crate, PyPI, npm, MCP crate + OCI kujutis, JetBrainsi plugin) versioneeritakse nüüd mootoriga sünkroonselt, mida CI-s jõustab <c1/>.

# text
seg-792df0cdc8a7 = <b>JetBrainsi plugin</b> litsentsiti ümber tingimusele <b>AGPL-3.0-only</b> (avaldatud { "0.1.1" } reklaamis endiselt Apache-2.0) ja tuletab nüüd oma Marketplace'i versiooni väljalaskemärgendist.

# text
# c1: unwrap
# c2: clippy::unwrap_used
seg-171f5649c90f = <b>Töökindluse tugevdamine</b> — mittetestitavad <c1/>-kutsed eemaldati või põhjendati; <c2/> on lubatud mittetestkoodil.

# text
seg-0e5abb2fad02 = <b>kshana.dev</b> tõendid-kõigepealt põhjalik ümberkorraldus: domineeriv avaplokk, arhitektuuridiagrammid ja tulemusjoonised, i18n, kokkupandav/kohanduv register ja Standardite jaotised.

# text
seg-05ef9b9f3653 = <b>SP3 täppisefemeriid</b> — rakendada interpoleerimisel IGS Maa pöörlemise sõlme parandust.

# text
# c1: tests/surface_readme_image_urls_doc_sync.rs
seg-bbd0dc3dd9cb = <b>Registripildid</b> — PyPI/crates.io/npm README-d kasutavad absoluutseid pildi URL-e; peamise README suhtelised pilditeed kuvati PyPI { "0.21.0" } lehel katkiste piltidena. CI kaitse (<c1/>) takistab regressiooni.

# text
# c1: fmt
# c2: clippy
seg-6d044971dbc8 = <b>CI</b> — <c1/> + <c2/> roheline; lõpetati kompileerimine git-ignoreeritud päris andmete vastu.

# text
seg-c3c260b7063e = Testid

# text
# c1: tests/property.rs
seg-5dca3defcfe3 = Kalmani kella kovariatsioon jääb PSD ja sümmeetriliseks (omaduspõhine test, <c1/>).

# text
seg-c861779f04ca = Dokumentatsiooni sünkroonikaitsed: iga avalik valideerimisarvu string, tsiteerimismetaandmed, genereeritud joonis ja pinna README pildi URL-id on kõik seotud oma tõeallikaga.

# text
# c1: kind
# c2: TradeEvidence
seg-0540044c92a6 = See väljalase lisab avatud mootorile kaks MODELLED rakenduskomplekti — <b>kvantvõimalustega PNT demonstraator</b> (usaldatav kvantaja edastamine, GNSS-vaba kvantnavigatsioon, kvanttõrgete/anomaaliate tuvastamine) ja <b>Kuu / tsislunaarne PNT komplekt</b> (Kuu koordinaataeg, Kuu VLBI, ühis-OD+kell, tugisüsteemi realiseerimine, teenindusmaht, diferentsiaalne PNT, koostalitluse eksport) — mõlemad käivitatavad ühe stsenaariumi <c1/>-id abil, mõlemad väljastavad ausa kirje <c2/> ning esindatavuse / lünkade lennuni registri. Samuti lisab see <b>kuus uut välise etaloniga valideerimist</b>, mis viivad masinkontrollitud valideerimismaatriksi tasemele <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> kokku { "61" } real. Uued rakendusarvud on MODELLED illustratiivsetest avaliku allika parameetritest — TRL-i, lennupärandit, sertifitseerimist ega agentuuri heakskiitu pole — ja nende taaskasutatavad valideeritud tuumad on sellisena märgistatud.

# text
# c1: quantum-time-transfer
# c2: quantum-gnss-free-nav
# c3: quantum-anomaly-detect
# c4: TradeEvidence
seg-82a1822f53e2 = <b>Kvantvõimalustega PNT demonstraatorikomplekt</b> (<c1/>, <c2/>, <c3/>). Kolm käivitatavat MODELLED rakendusvaldkonda mootori taga, millest igaüks väljastab <c4/> pluss esindatavuse / lünkade lennuni kirje:

# text
# c1: src/timetransfer_chain.rs
seg-07532f03a1f1 = <b>Usaldatav kvantaja edastamine</b> (<c1/>) — optilise võrekella + fotoonilise lingi kahesuunaline eelarve võrdluses CSAC + RF-iga, taaskasutades ajastuse kaitsetaset, koos viivitus-/kordusründe turbe kvaliteedinäitajaga ({ "1" } − P_md) ning kellaanomaalia tuvastamise + CUSUM latentsusega.

# text
# c1: src/quantum_nav_od.rs
seg-4c9036cffe1b = <b>GNSS-vaba kvantnavigatsioon</b> (<c1/>) — külmaatom-interferomeetriline inertsiaalne väljajooks võrdluses navigatsioonikvaliteediga INS-iga GNSS-i katkestuse ajal; ausalt märgitud, et ilma välise lahenduseta jääb kiirendusmõõturi nihe jälgimatuks, nii et viga siiski kasvab.

# text
# c1: src/quantum_faults.rs
seg-6188f1c6893a = <b>Kvanttõrgete / anomaaliate tuvastamine</b> (<c1/>) — märgendatud tõrkekataloog bootstrap-CI ROC AUC-ga ja minimaalselt tuvastatava tõrkega fikseeritud valehäire määra juures.

# text
# c1: src/quantum_devices.rs
# c2: src/qtrade.rs
seg-9e22314b1337 = Ühine kvantseadmete veamudelite teek (<c1/>) ja ühtne kvant-versus-klassikaline kompromissiraamistik (<c2/>) on kõigi kolme aluseks.

# text
# c1: kind
# c2: src/lunar_time.rs
# c3: src/lunar_vlbi.rs
# c4: src/lunar_combination.rs
# c5: src/lunar_frame_realise.rs
# c6: src/lunar_service.rs
# c7: src/lunar_dpnt.rs
# c8: src/lunar_interop.rs
seg-808e20f28556 = <b>Kuu / tsislunaarne PNT komplekt.</b> Seitse käivitatavat MODELLED stsenaariumi <c1/>-id, mis on ehitatud CR3BP tuumale: <b>Kuu koordinaatkaeg</b> (LTC/TCL − TT sekulaarne kiirus, <c2/>), geodeetiline <b>Kuu VLBI</b> viivituse vaadeldav suurus (<c3/>), <b>ühine mitme tehnika OD + kell</b> partii hindaja (<c4/>), <b>tugisüsteemi realiseerimine</b> (7-parameetriline Helmert + IAU { "2015" } WGCCRE seos, <c5/>), <b>Moonlight / LCNS-klassi teenindusmahu</b> analüüs (<c6/>), <b>Kuu diferentsiaalne PNT</b> (<c7/>) ja <b>LunaNet / IOAG-ga joondatud koostalitluse eksport</b> (CCSDS-OEM + Kuu ajaskaala KIF ümbrikus, <c8/>). Kõik MODELLED illustratiivsetest avaliku allika parameetritest; pole valideeritud päris VLBI / Gateway jälgimise vastu; agentuuriga sidet ega heakskiitu pole.

# text
seg-a892ce052e3c = <b>Kuus uut välise etaloniga valideerimist</b> (valideerimismaatriksis on nüüd { "15" } valideeritut):

# text
# c1: tests/cs5071a_reference.rs
seg-c30ae6767c6c = <b>ADEV / HDEV päris tseesiumikellal 5071A</b> — valideeritud Stable32 dekaadipunktide etalonide vastu (<c1/>).

# text
# c1: PHASE.DAT
# c2: tests/phasedat_reference.rs
seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV Stable32 etalonil <c1/></b> — valideeritud Stable32 avaldatud tabelite vastu (<c2/>).

# text
# c1: tests/opssat_ad_reference.rs
seg-e8728f57effa = <b>Anomaaliate tuvastamise ROC AUC päris ESA OPS-SAT telemeetrial</b> — valideeritud scikit-learn-i vastu (<c1/>).

# text
# c1: tests/icgem_gravity_reference.rs
seg-5446957ac631 = <b>ICGEM raskusjõufunktsionaalide süntees</b> — valideeritud GRS80 normaalraskusjõu standardi vastu (Somigliana γ täpsusega { "3.5e-12" }; EGM2008 häiringukaart, <c1/>).

# text
# c1: tests/klobuchar_reference.rs
seg-751c5ac90229 = <b>Klobucharri edastatav ionosfäärimudel</b> — valideeritud RTKLIB-i vastu (<c1/>).

# text
# c1: tests/raim_reference.rs
# c2: tests/sbas_reference.rs
seg-dcc6d4e04a5c = <b>RAIM tuvastustuum</b> ({ "171" } juhtu, <c1/>) ja <b>SBAS DO-229E kaitsetase</b> päris EGNOS-i andmetel (RTKLIB SBAS-PL fork, <c2/>) — mõlemad valideeritud oma väliste etalonide vastu.

# text
# c1: src/representativeness.rs
seg-3f6c1ff0b3a4 = <b>Esindatavuse ja lünkade lennuni register</b> (<c1/>). Struktureeritud kirje, mille iga demonstraator väljastab — mis on esindav, mis on lihtsustatud ja mis seisab mudeli ning lennu vahel — iga MODELLED kompromissi aus kaaslane.

# text
# c1: --study-name
# c2: --validate
seg-6b4c78bdaf35 = <b>Uuringute koondamine ja CLI mugavus.</b> Stsenaariumikomplekti manifest ühe käsuga uuringute koondamisega, räsistabiilsed uuringu metaandmed + <c1/>, stsenaariumi lintimine käsuga <c2/> ning kvaliteedinäitajakohane valideerimistaseme esitus uuringuaruannetes.

# text
seg-e24230b80a89 = <b>kshana.dev kujundati ümber ühise valdkonnaselgroo ümber</b> — võimekused ja valideerimine liideti üheks valdkonnauurijaks ühise sõnavaraga, uued valideeritud saared tuuakse nähtavale, maapinnatäpne animeeritud Maa instrument ja uuringu tellimise üleskutse ning Ashforde OÜ kaubamärk/lingid.

# text
seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE auditeeriti täielikkuse ja aususe osas</b> — aegunud valideeritud arvud parandati (nüüd { "15" } välist etaloni), diagramme laiendati ning tsiteeritakse eeltrükke Conditional Timing Protection Level (arXiv:{ "2606.24210" }) ja RF-häirete optimismilõhe (arXiv:{ "2606.22054" }).

# text
# c1: paper/
seg-42a317c6ce06 = Allikad kataloogis <c1/> ja JOSS-i mustandi torujuhe hoitakse avalikus hoidlas.

# text
seg-8ed5cf845b00 = See väljalase lisab avatud mootorile neli uuringuvõimekust — tinglik ajastuse kaitsetase, raamistikuga joondatud PNT vastupidavuse skoorimine, RF-häirete optimismilõhe hindamine ning tarkvaraliselt määratletud vastuvõtja / päris andmete esiots — igaüks reprodutseeritav ühest käsust ja kirjutab baidi tasemel deterministliku artefakti. Kõik uuringud on MODELLED (sünteetiline või avaliku andmestiku kalibreerimine), kannavad oma ausat päritolu (mootori versioon, algväärtused, konfiguratsiooni räsi) ja valideerimismärgendeid ning ei ole sertifitseerimised.

# text
# c1: tpl
# c2: cargo run --release --example tpl_jammertest
seg-0c9f0c665491 = <b>Tinglik ajastuse kaitsetase (<c1/>).</b> Holdover-iga piiratud tõkestus tuvastamata ajaveale GNSS-i spuufimise korral, k-sigma seirepõhjaga, tuvastusviivituse ulatuses van Loani väljajooksu dispersiooniga ja CUSUM aja-alarmini. Kalibreeritud päris salvestatud rünnakul (JammerTest { "2024" }, stsenaarium { "2.1.1" }) käsu <c2/> kaudu, mis taastoodab selle etalontabeli avaliku salvestise skalaaridest (toorandmestikku ei levitata edasi).

# text
# c1: resilience
# c2: cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json
# c3: docs/RESILIENCE-CROSSWALK.md
seg-d874d7f13f28 = <b>Raamistikuga joondatud PNT vastupidavuse skoorimine + otsuse ebastabiilsuse uuring (<c1/>).</b> Arhitektuurimudel, RPCF-iga joondatud skoorimine, Dirichlet' kaalusimpleks, Kendalli tau ja top-1 ümberpöördumise määra ebastabiilsus ning ühisrežiimi mitmekesisuse kollaps (Hill-N2), käsuga <c2/>. Vastavustabel failis <a1><c3/></a1>.

# text
# c1: impairment_study
# c2: impairment_ml
# c3: eval_stats
# c4: cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json
seg-343f7af54503 = <b>RF-häirete optimismilõhe uuring (<c1/>, <c2/>, <c3/>).</b> 13 detektori paneel parameetritest lähtuval sünteetilisel korpusel, jaotusesisese ja jaotusevälise optimismilõhe võrdlus, skaleerimisseaduse trendid permutatsiooni nullmudeliga ning ühe välja jätmise (leave-one-out) halvenemise ennustaja, käsuga <c4/>.

# text
# c1: sdr
# c2: realdata/
seg-6eed55859bbf = <b>Tarkvaraliselt määratletud vastuvõtja esiots (<c1/>) ja päris andmete adapterid (<c2/>).</b> Toor IQ/IF korrelaatorikraanideks ja SQM-iks, pluss sisendiadapterid (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) ja sondinäited. Need loevad salvestisi, mille kasutaja kohapeal esitab; ühtegi salvestist ei ole commit'itud.

# text
# c1: optimism-study.json
# c2: resilience-study.json
# c3: paper-artifacts/
# c4: /realdata-cache/
seg-afe2282fa771 = <b>Commit'itud uuringuartefaktid.</b> Baidi tasemel deterministlikud <c1/> ja <c2/> on nüüd jälgitud kataloogis <c3/>, et uuringu arve saaks kontrollida ilma uuesti ehitamata; need on endiselt taastatavad ülaltoodud generaatoritest. Toorandmestikud jäävad hoidlast välja (<c4/>).

# text
# c1: Cargo.toml
# c2: CITATION.cff
# c3: README
seg-450d82cddc28 = Versioon tõsteti tasemele { "0.20.0" } failides <c1/>, <c2/> ja <c3/>; ristumisuuringu artefaktid genereeriti uuesti, et nende tempel vastaks väljalastud versioonile.

# text
# c1: LICENSE
# c2: LICENSING.md
seg-a0a66af8fd14 = <b>Litsentsiti ümber Apache-2.0-lt GNU AGPL-3.0-only peale, kommertslitsentsiga, mida saab Ashforde OÜ-lt (topeltlitsentsimine).</b> Avatud mootor jääb täielikult avatuks ja avalikult kontrollitavaks; AGPL-i võrgu-copyleft (§{ "13" }) tähendab, et suletud või majutatud tuletis peab tulema tagasi avatud lähtekoodi alla — või võtma kommertslitsentsi. See kaitseb valideeritud tuuma fork-and-close vastu, säilitades samal ajal avaliku, käivitatava ja auditeeritava mootori usaldusväärsuse. Vt <a1><c1/></a1> (AGPL) ja uut <a2><c2/></a2> (mida iga litsents katab ja millal see kehtib).

# text
# c1: LICENSE
# c2: AGPL-3.0-only
# c3: NOTICE
# c4: README
# c5: GOVERNANCE
# c6: GLOSSARY
# c7: Cargo.toml
# c8: pyproject.toml
# c9: CITATION.cff
seg-ffa799fdb814 = <c1/> sisaldab nüüd AGPL-3.0 teksti; SPDX päised kõigis allikates uuendati väärtusele <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, veebisait ning crate'i/paketi metaandmed (<c7/>, <c8/>, <c9/>, MCP crate + kujutis) uuendati vastavalt.

# text
# c1: CONTRIBUTING.md
seg-8d67aba2af0b = <b>Panustajate tingimused</b> (<a1><c1/></a1>) litsentsivad nüüd sissetuleva AGPL-i all <b>ja</b> annavad Ashforde OÜ-le õiguse lisada panused kommertslitsentsitud väljaandesse, et topeltlitsents jätkuvalt toimiks.

# text
# c1: deny.toml
# c2: GOVERNANCE
seg-93644d1c1420 = <b>Sõltuvuspoliitika on muutumatu, kuid uuesti põhjendatud</b> (<a1><c1/></a1>, <c2/>): sõltuvused jäävad lubavaks (Apache/MIT/BSD/ISC). AGPL on lubatud ainult kshana enda crate'i jaoks — copyleft-<em>sõltuvus</em> rikuks kommertsväljaande ja lõhuks topeltlitsentsimise.

# text
# c1: v0.18.0
# c2: v0.19.0
seg-9b77c2d36241 = <b>Märkus allavoolu kasutajatele:</b> see on copyleft-ümberlitsentsimine. Kasutajad, kes toetusid Apache-2.0 lubavatele tingimustele, saavad jätkata viimase Apache-2.0 väljalaske kasutamist (<c1/> ja varasemad, nagu avaldatud); alates <c2/> kehtib AGPL-3.0 / kommertslitsents.

# text
# c1: pyo3
# c2: BoundList/TupleIterator::nth
# c3: nth_back
# c4: PyCFunction::new_closure
# c5: pyo3
# c6: python
# c7: src/python.rs
# c8: scenario_kinds
# c9: skip_from_py_object
# c10: RunOutput
seg-51e32f15b7ea = <b>Tõsteti <c1/> { "0.24" } → { "0.29" }</b>, et eemaldada RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) väliste OSV/sõltuvuste skannimistest. Mõlemad on <em>funktsioonitaseme</em> nõuanded, mille mõjutatud funktsioone (<c2/>/<c3/>, <c4/>) Kshana kunagi ei kutsu, ja <c5/> on valikuline (<c6/>-funktsiooniga) sõltuvus — seega tegelik kokkupuude oli null —, kuid tõstmine hoiab puhta skannimise allavoolu auditeerijatele. Failis <c7/> migreeriti pyo3 { "0.29" } API-le (Bound tagastustüüp funktsioonile <c8/>; selgesõnaline <c9/> pyclass'il <c10/>). Kõik { "11" } Pythoni sidumise testi läbivad uuesti ehitatud laiendi vastu.

# text
# c1: scenarios/<kind>.toml
# c2: tests/dominance_demonstrators.rs
# c3: VALIDATED
seg-8d9332df5c74 = <b>Üksteist uut käivitatavat stsenaariumi liiki — kahe pakkumise demonstraatorid, CCSDS koostalitluse sild ja esimese järgu missioonianalüüsi / keskkonnakomplekt (kõik MODELLED, lisanduvad; olemasolevad reprodutseeritavuse golden-failid muutumatud).</b> Igaüht saab edastada CLI / Python / WASM / MCP kaudu, igaühel on <c1/> ja selge MODELLED märgend oma tulemuse JSON-is ning üherealine kokkuvõte (liigipõhine test failis <c2/> kinnitab, et märgend on olemas ja et väljund ei sisalda kunagi stringi <c3/>):

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-20b74caf58cc = <c1/> (<c2/>) — masinõppel põhineva RF-häirete tuvastuse hindamise katsestend: märgendatud <b>sünteetiline</b> korpus + detektorist sõltumatu <b>ROC/AUC</b> raamistik + jaotusesisese/jaotusevälise <b>optimismilõhe</b> aruanne (ainult tööomadused — mitte kunagi välja-/IQ-andmed).

# text
# c1: quantum-trade
# c2: src/quantum_trade.rs
seg-0253656a0ecf = <c1/> (<c2/>) — kvant-versus-klassikaline PNT kompromiss mõõdetud ADEV sisendiga ja GNSS-ita vastupidavuse ümbrisega.

# text
# c1: space-weather
# c2: src/space_weather.rs
seg-901bd713bd62 = <c1/> (<c2/>) — päikese/geomagnetilised indeksid (Kp↔ap IAGA tabel, päevane Ap, tsentreeritud 81-päevane F10.7a), <b>Jacchia-71</b> eksosfääri temperatuur ja aktiivsusest juhitud termosfääritiheduse sidestus staatilise atmosfääri kohal (MITTE NRLMSISE absoluuttiheduse mudel).

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
seg-2323b43c0ffc = <c1/> (<c2/>) — <b>CCSDS { "502.0" } OEM</b> import + edasi-tagasi sild GMAT / Orekit / STK efemeriididele (lugeja <c3/>, kirjutaja täpne pöördfunktsioon).

# text
# c1: launch-window
# c2: src/launch.rs
# c3: sin Az = cos i/cos lat
seg-188aeb3e8219 = <c1/> (<c2/>) — kahe keha <b>stardiazimuut</b> (<c3/>), tasandimuutuse Δv, stardiplatsi pöörlemisbonus ja päevase võimaluse geomeetria.

# text
# c1: reentry
# c2: src/reentry.rs
seg-6200a47276e6 = <c1/> (<c2/>) — <b>Allen-Eggersi</b> ballistilise atmosfääri taassisenemise koridor: maksimaalne aeglustus, maksimaalse g ja maksimaalse kuumenemise kiirused, maksimaalse g kõrgus.

# text
# c1: eo-coverage
# c2: src/eo_payload.rs
seg-0874c2241748 = <c1/> (<c2/>) — EO <b>vööndi laiuse / GSD / ligipääsu / taaskülastuse</b> geomeetria (SMAD kosmosekolmnurk).

# text
# c1: space-packet
# c2: src/space_packet.rs
seg-83c7588ff074 = <c1/> (<c2/>) — <b>CCSDS 133.0-B Space Packet</b> esimese päise kodeerimine/dekodeerimine bitttäpse edasi-tagasi teisendusega.

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
seg-ae1bcad02880 = <c1/> (<c2/>) — 3-DOF <b>gravitatsioonigradiendi moment</b> + <b>RSS sihtimisvea eelarve</b> (skalaarne eelarve enne riistvara, mitte juhtimissilmus).

# text
# c1: passes
# c2: src/passes.rs
seg-65f59cc12e02 = <c1/> (<c2/>) — maajaama <b>tõusu/loojangu ülelennu prognoos</b> (AOS/TCA/LOS, maksimaalne kõrgus, ligipääs).

# text
# c1: link-budget
# c2: src/linkbudget.rs
# c3: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-178776497627 = <c1/> (<c2/>) — ühesuunaline <b>CCSDS-401 / DSN-810-005</b> lingivõrrand (<c3/>, FSPL / Eb·N₀ / varu / sulgumine).

# text
# c1: hybrid-ukf
# c2: src/fusion/hybrid_ukf.rs
# c3: scenarios/hybrid-ukf.toml
# c4: src/fusion/tightly_coupled17.rs
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: clock_state::q_from_allan
# c8: q_wf
# c9: q_rw
# c10: q_factor
# c11: r_factor
# c12: Ukf::update_stats
# c13: TightlyCoupled17::{update_gnss_nis, nees, nees_subset}
seg-e7fee32a00f5 = <b>17-olekuline hübriidne kvant- + klassikaline tihedalt seotud UKF — esitatud käivitatava stsenaariumina (MODELLED).</b> Uus stsenaariumi liik <c1/> (<c2/>, <c3/>), mis muudab varem ainult API kaudu kättesaadava 17-olekulise tihedalt seotud GNSS/INS unscented Kalmani filtri (UKF) (<c4/>) stsenaariumiks, mida CLI/Python/WASM/MCP sidumised saavad edastada. 17-olekuline veavektor on <b>{ "15" } INS-i veaolekut</b> (asend, kiirus, orientatsiooni nihe, kiirendusmõõturi + güroskoobi nihe), mida täiendab <b>CAI-st tuletatud kiirendusmõõturi nihke parandus</b> — külmaatom-interferomeeter (<c5/>) määrab kiiruse juhusliku käigu põhja <c6/>, nii et pikaajaline väljajooksu triiv on kvantanduriga piiratud — ning <b>2-olekuline faasi + sageduse kell</b>, mille protsessimüra tuleb <b>q-parameetri kellamootorilt</b> (<c7/>, mis kujutab kella Alani hälbe profiili PSD-deks <c8/>/<c9/>, skaleeritud kaugusühikutesse). Platvormi abistab GNSS sissejuhatuseks (filter õpib nihked, kiiruse ja kella), seejärel veerab see GNSS-i katkestuse läbi ainult CAI IMU + kella abil, nii et käitus demonstreerib <b>klassikalise IMU lühiajalise + kvant pikaajalise</b> hübridiseerimist. Kvaliteedinäitaja on <b>filtri enesekooskõla</b>: koondatud <b>NEES</b> (Normalised Estimation Error Squared, hinnatava asendi/kiiruse/kella alamhulga üle) ja <b>innovatsiooni valgeduse NIS</b> (Normalised Innovation Squared) Monte Carlo ansambli üle, kontrollitud nende { "95" } % χ² vööndite vastu (Bar-Shalom §{ "5.4" }). Sobitatud filter jääb vööndite sisse; tahtlikult valesti häälestatud filter (nupud <c10/> / <c11/>) märgitakse — objektiivselt kontrollitav, eristav värav, mitte tembeldaja. <b>NEES/innovatsiooni valgeduse kontroll on STATISTILINE ORAAKEL (SÕLTUMATU ETALON): enesekooskõla väide (filtri teatatud kovariatsioon vastab ausalt tema enda vigade hajuvusele modelleeritud müra korral), MITTE reaalse maailma täpsuse garantii.</b> Aus ulatus: kõik on <b>modelleeritud / simulatsioon</b> — CAI ja kella sisendid on piiritletud, kirjandusele esindavad väärtused, mitte mõõdetud riistvara; CAI riistvara ja selle Key-Person jäävad partneri omandisse; siin ei vihja miski TRL > { "3" }-le, lennupärandile ega välisele valideerimisele (tulemuse JSON ja üherealine kokkuvõte kannavad neid märgendeid selgesõnaliselt). Ainus konstantse kiirusega horisontaalne trajektoor jätab orientatsiooni- ja IMU nihke olekud vaid nõrgalt jälgitavaks, seega hinnatakse NEES-i { "8" } hinnatava oleku üle; manööverdav trajektoor täieliku 17 jälgitavuse jaoks on teekaardil. Lisab ka instrumentatsiooni <c12/> (tagastab uuenduskohase NIS-i) ja <c13/> kooskõla jaoks. Kõiki olemasolevaid stsenaariume see ei mõjuta (lisanduv; reprodutseeritavuse golden-failid muutumatud).

# text
# c1: terrain-slam
# c2: src/altpnt/sequential.rs
# c3: scenarios/terrain-slam.toml
# c4: particle_filter
# c5: terrain-nav
seg-9b55f4ac5053 = <b>Järjestikune (rekursiivne) maastikupõhine navigatsioon — SITAN töötava filtrina.</b> Uus stsenaariumi liik <c1/> (<c2/>, <c3/>), mis käitab olemasolevat kõrgusmõõtja-vs-DEM mõõtmismudelit <b>epohhhaaval</b> läbi mootori <c4/> SIR, mitte partii jämedalt-täpseni otsinguga, mida <c5/> kasutab ühe <em>konstantse</em> INS-i nihke taastamiseks. Igas teekonnapunktis propageeritakse pilve INS-i teatatud juurdekasvuga (mis ise on riknenud sammukohase triivikasvuga), kaalutakse uuesti maastikusobitusega ja valimit võetakse uuesti degeneratsiooni korral — nii et <b>ajas muutuvat</b> INS-i triivi <em>jälgitakse</em> piki rada, mida konstantse nihke sobitus struktuurselt ei suuda. Sünteetilisel DEM-il jääb rekursiivne hinnang piiratuks ja koondub uuesti (lõpp ≈ { "70" } m), samal ajal kui abitu inertsiaallahend hajub piiramatult kuni ≈ { "5" } km; epohhikohane viga järgib maastiku eristatavust (see veerab nihkega INS-il üle lamedate sadulate ja lukustub uuesti eristuva reljeefi kohal) ning efektiivse valimi suuruse seire kinnitab tervet pilve. Aus ulatus: kaart on <b>teada ja fikseeritud</b> — rekursiivne <em>lokaliseerimine</em> salvestatud DEM-i vastu (maastiku SLAM-i lokaliseerimise pool), mitte ühine kaardi hindamine; konstruktsiooni poolest mitteringlev (süstitud triivirampp on sõltumatu tõde). Kõiki olemasolevaid stsenaariume see ei mõjuta (lisanduv; reprodutseeritavuse golden-failid muutumatud).

# text
# c1: src/holdover.rs
# c2: src/impairment_eval.rs
# c3: src/quantum_trade.rs
# c4: src/navsignal.rs
# c5: src/inertial/quantum_imu.rs
# c6: src/verification.rs
seg-87ba3bc926fa = <b>GNSS-ita vastupidavuse selgroog + FutureNAV demonstraatori lõigud</b> (<c1/>, ja vastupidavuse ümbriku alused kataloogides <c2/>, <c3/>, <c4/>, <c5/>, FutureNAV kontrolli lõikudega failis <c6/>). Komponeerib alternatiivse PNT ehituskivid — kella holdover, signaali jälgimine, inertsiaalne väljajooks, maastik — üheks GNSS-i katkestuse vastupidavuse looks. MODELLED; lisanduv.

# text
# c1: src/interchange.rs
seg-071bb6654f24 = <b>Kshana Interchange Format (KIF) — versioneeritud, ise end kirjeldav artefaktiümbrik</b> (<c1/>). Skeemimärgendiga ümbris stsenaariumi tulemuste ümber, nii et salvestatud artefakt kannab kaasas oma liiki, skeemiversiooni ning MODELLED/VALIDATED märgendeid ja vanemad ümbrikud jäävad edasiühilduvalt loetavaks. Lisanduv; olemasolev tulemuse JSON muutumatu.

# text
# c1: src/navsignal.rs
# c2: src/cr3bp.rs
seg-07147766ab22 = <b>Navigatsioonisignaali modulatsioon / jälgimine + CR3BP halo/NRHO diferentsiaalparandaja</b> (<c1/>, <c2/>). Esimese järgu navigatsioonisignaali modulatsiooni ja jälgimise mudel ning piiratud kolme keha ülesande diferentsiaalparandaja halo / peaaegu sirgjoonelistele halo orbiitidele, esitatud olemasoleval kaugkosmose võimekuse teljel. MODELLED.

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-d0d2366e3351 = <b>Jaotusnihke hindamisrežiim + korpuse tõsiduse skaala nupp tööriistale <c1/></b> (<c2/>). Lisab ROC/AUC optimismilõhe raamistikule selge jaotusesisese/jaotusevälise jaotuse ja häälestatava korpuse tõsiduse skaala (ainult tööomadused — mitte kunagi välja-/IQ-andmed).

# text
# c1: src/frugal.rs
# c2: src/integrity_impact.rs
seg-9bb8ee93e70b = <b>Katvuse hinna kohta ROI + tuvastamata jäänud sündmuse terviklikkuse mõju vastendus</b> (<c1/>, <c2/>). Säästliku inseneeria ROI lääts (hind katvuse ühiku kohta) ja vastendus tuvastamata jäänud sündmuste määrast terviklikkuse mõjule. MODELLED; lisanduv.

# text
# c1: src/inertial/quantum_imu.rs
# c2: hybrid-ukf
seg-55f8ba5b52ee = <b>Viidatud külmaatom-interferomeetri (CAI) veamudeli parameetrileht</b> (<c1/>). Kirjandusele viitav, piiritletud parameetrileht CAI inertsiaalse mudeli jaoks — sisendid on <b>viidatud, mitte mõõdetud riistvara</b> (TRL-i / lennuväidet pole); see toidab kiiruse juhusliku käigu põhja stsenaariumis <c2/>.

# text
seg-cfbff4acc64c = Projekti juhtimine.

# text
# c1: GOVERNANCE.md
# c2: none → partial
seg-982f9ea3eee8 = <c1/>, mis dokumenteerib otsustusmudeli ning avatud/suletud piiri; võimekuskaardi kogukonna/juhtimise rida liigub <c2/>, et seda kajastada.

# text
# c1: b_nom
# c2: b_k = Σ_i |s_i|·b_nom
# c3: #[serde(default)]
# c4: sigma_ura_m
# c5: b_nom_m
# c6: docs/ARAIM_REFERENCE.md
# c7: b_k
seg-c9ff6a7183eb = <b>ARAIM terviklikkuse kaitsetase — nominaalne nihe (<c1/>) ja σ_URA on nüüd rakendatud.</b> MHSS kaitsetase lahutab nüüd ühepoolse nominaalnihke projektsiooni <c2/> iga tõrkerežiimi kohta ja kasutab <b>terviklikkuse</b> sigmat σ_URA (erinev <b>täpsuse</b> sigmast σ_URE), mida kannab Integrity Support Message. See teeb kaitsetaseme konservatiivsemaks ja standardikohaseks ning seetõttu <b>muudab olemasolevate terviklikkuse stsenaariumide teatatud PL väärtusi</b>. ISM/stsenaarium saab väljad <c3/> <c4/> / <c5/>, nii et sisendid, mis neid ei sea, säilitavad varasema käitumise. Vt <c6/> taastatud valemi <c7/> ja ausa teostusmärkuse kohta.

# text
seg-c408f8944ac6 = Spuufimisseire χ² kooskõla.

# text
# c1: parity_raim_test
# c2: raim::chi2_quantile
seg-92e2b5c5458c = <c1/> kasutab nüüd ühist pöörd-χ² rada <c2/>, eemaldades teise lahknevana χ² teostuse, nii et RAIM ja pariteedi spuufimisseire on oma läviväärtustes ühel nõul.

# text
# c1: gravity-map-nav
# c2: kind=
seg-6d424034e500 = <b><c1/> ühendati CLI dispetšeriga.</b> Stsenaarium oli varem kättesaadav ainult API kaudu; nüüd edastatakse seda nagu iga teist stsenaariumi, kasutades <c2/>.

# text
# c1: api::list_scenario_kinds().len()
# c2: scenario_count_doc_sync
seg-62c3efb54991 = <b>Dokumentatsiooni/arvu täpsus.</b> README stsenaariumi liikide arvud on nüüd seotud väärtusega <c1/> testiga <c2/>, nii et dokumenteeritud arv ei saa enam dispetšerist kõrvale triivida.

# text
# c1: Body{mu, re, zonals, gravity, rotation, IAU-pole}
# c2: EphemerisProvider
# c3: mars-pnt
# c4: xval/anise-mars-od
# c5: cargo deny
seg-5f0f497aa643 = <b>Kaugkosmose ja Marsi PNT — avatud radiomeetriline navigatsioonimootor + GSE simulatsioon.</b> Uus, täielikult lisanduv võimekuse telg Maal valideeritud tuuma peal (iga olemasolev Maa stsenaarium on <b>baidi haaval identne</b> — reprodutseeritavuse golden-failid läbivad muutmata ilma uuesti genereerimata). Lisab: mitme keha dünaamika tuuma (<c1/> Marsi GMM-3 tesseraalse gravitatsiooniga, IAU Marsiga kinnitatud keharaam, ühendatav <c2/> koht, mikrosekundist väiksema täpsusega kaheosalised Juliuse kuupäevad ja TT↔TDB); radiomeetrilised vaadeldavad suurused (iteratiivne valguse levi aeg + Shapiro viivitus, kahe-/ühe-/kolmesuunaline Doppler ja kaugus Moyeri kahe haru lahendiga, koherentne transponderi pööre, regeneratiivne/PN kaugusmõõtmine CCSDS { "414" } järgi, Δ-DOR CCSDS { "506" } järgi, päikeseplasma/tropo/iono keskkonnad); CCSDS-TDM ({ "503" }) parsimine + väljastamine; vähendatud dünaamikaga ruutjuur-infofilter RTN empiiriliste kiirendustega, kolmeolekuline pardakell ja Marsi takistusmudel; ühine ühesuunalise + kahesuunalise sulatushindaja; stsenaariumipind <c3/> (releekonstellatsioon + LMO/ülekanne/ pind) CLI, Pythoni, WASM-i, MCP ja mänguväljaku kaudu; ning otsast lõpuni GSE tulemuslikkuse simulaator (geomeetria → lingieelarve → vaadeldavad suurused → SRIF → kovariatsioon). <b>Valideerimistase — simulatsiooniga valideeritud:</b> sünteetiline suletud ahelaga OD (Marsi-LMO ≈ { "0.2" } m) ja analüütiline enesekooskõla, kusjuures Päikese-keskne Marsi dünaamika on sõltumatult ristkontrollitud JPL <b>DE440</b> vastu (<c4/>, kerneliga piiratud: { "137" } m @ 1-päevane kaar, aus modelleerimata n-keha jääk). Teatatud kaugkosmose täpsused on <b>simulatsiooni / kovariatsiooni kvaliteedinäitajad</b>, mitte päris missiooni tulemused; päris DSN/ESTRACK jälgimisandmetega valideerimine jääb teekaardile. ANISE (MPL-2.0, edition-2024) on piiratud tööruumist välja jäetud ristkontrolli crate'iga, nii et litsentsivärav <c5/> ja MSRV-1.75 töö jäävad puutumata.

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: EopSeries
# c5: precise_od
# c6: dut1_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: kshana --eop <finals2000A>
# c10: precise_od
seg-2ab34100a2d7 = <b>Agentuuritäpsed maapinnajäljed päris IERS-i Maa orientatsioonist.</b> Stsenaarium <c1/> võtab valikulise välja <c2/> — päris IERS-i faili <c3/> sisseehitatud keha — ja taandab maapinnajälje sellest interpoleeritud epohhikohase UT1−UTC ja poolusliikumise kaudu (sama <c4/>, mida kasutab <c5/>), alistades nominaalsed skalaarid <c6/>/<c7/>/<c8/>. Andmed liiguvad stsenaariumi sees, nii et käitus jääb reprodutseeritavaks ega vaja failisüsteemi (see töötab WASM-i mänguväljakul). Lipp <c9/> põimib päris faili CLI-st stsenaariumi. Sulgeb asümmeetria, kus päris Maa orientatsiooni andmeid tarbis ainult <c10/>.

# text
# c1: frames::itrf_to_teme
seg-e778245e7d8f = <b>Kiiruse muutumise kiiruse raami kooskõla.</b> Maajaam kujutatakse nüüd inertsiaalraami satelliidi taandamise täpse pöördfunktsiooni kaudu (<c1/>, võttes tagasi poolusliikumise <em>ja</em> sideerilise pöörde) poolusliikumisest teadmatu GMST pöörde asemel, nii et mõlemad otspunktid jagavad ühte raami. Mõju teatatud Dopplerile on valideerimispõhja all, kuid see eemaldab päris raami mittevastavuse ja „täpse“ üledeklareerimise allikas.

# text
# c1: carrier_hz
# c2: step_s
seg-3b912d8a819d = <b><c1/> valideeritakse.</b> Null või mittelõplik kandesagedus tagastab nüüd vea, selle asemel et vaikselt anda null Doppler (see oli teinud λ = c/kandja lõpmatuks), vastavalt olemasolevale kaitsele <c2/>.

# text
# c1: src/precise_od.rs
# c2: PreciseForceModel
# c3: finals2000A
seg-7d70317ca717 = <b>Jõumudeli valideerimine efemeriidi sobitamisega, ristvalideeritud päris agentuuri toodete vastu.</b> Uus partii vähimruutude hindaja (<c1/>) variatsioonilise olekuüleminekumaatriksi ja kõrvalekallete redigeerimisega, mida juhib täielik jõumudel (<c2/>: EGM2008 geopotentsiaal, kolmandad kehad, tahke + ookeani + atmosfääri looded ning empiirilised CPR/2-per-rev kiirendused), mida toidab päris IERS-i Maa orientatsiooni parser <c3/>. Valideeritud avaldatud etalonorbiitide vastu: <b>Galileo MEO { "13" } cm järelsobituseni</b>, ESA <b>Swarm-A LEO</b> ja <b>LRO Kuu</b> (selenotsentriline, GRAIL gravitatsioon, IAU-2015 kehaaraam — vähendatud dünaamikaga { "6.6" } m, ausalt üle { "5" } m sihtmärgi avatud teel; DE-klassi ANISE/DE440 tee, mis selleni jõuab, on tööruumist välja jäetud crate).

# text
# c1: spoof-detect
seg-bf88a3eb4733 = <b>Stsenaarium <c1/></b> — integreeritud mitmekihiline spuufimise detektor, mis ühendab epohhikohase RAIM pariteedi, AGC ja signaalikvaliteedi (SQM) seired ning liitotsuse, valideeritud avaldatud <b>TEXBAT</b> stsenaariumi parameetrite vastu (Humphreys et al., ION GNSS { "2012" }), sealhulgas kandjaga joondatud raske juhtum.

# text
# c1: ephemeris
seg-976036ba124b = <b>Stsenaarium <c1/> — olek, raamid, maapinnajälg ja Doppler.</b> Propageeri üks satelliit (TLE→SGP4 või analüütiline orbiit) ja väljasta sammu kohta inertsiaalne TEME ja GCRS olek (<b>asend <em>ja</em> kiirus</b>), Maaga seotud ITRF/ECEF asend, WGS-84 alamsatelliidi <b>maapinnajälg</b> (laiuskraad / pikkuskraad / kõrgus) ning topotsentriline asimuut / kõrgus / kaugus koos kauguse muutumise kiiruse ja <b>Dopplerina</b> maajaamast. Kättesaadav CLI-st, Pythonist, WASM-ist ja MCP serverist ning tarnitakse <b>eelseadena „Maapinnajälg“</b> veebimänguväljakul, kus jälg joonistatakse <b>päris maailmakaardi peale</b> (Natural Earth { "1" }:110m rannajooned, sisseehitatud — võrku ega välist sõltuvust pole).

# text
# c1: --export-oem
# c2: export_oem = true
seg-761c95f2ede5 = <b>CCSDS OEM eksport</b> (<c1/> / <c2/>) — kiirust kandev Orbit Ephemeris Message, mida tarbivad GMAT / Orekit / STK, pariteedis olemasolevate SP3 ja OMM eksportijatega.

# text
seg-111b0896fdd4 = <b>Tahked, ookeani (FES2004) ja atmosfääri (Ray { "2001" } S2) Maa looded</b> geopotentsiaalil (IERS Conventions peatükk { "6" }), ühendatud jõumudelisse.

# text
seg-7e392131261a = <b>ARM64 wheel-id</b> — PyPI ehitus toodab nüüd ka Linux aarch64 (manylinux_2_28), macOS arm64 ja Windows arm64 wheel-id.

# text
seg-7cc04ea3362b = <b>Laiendatud tehniline aruanne (eeltrükk)</b> on README-st lingitud ja JOSS-i artikkel tehtud esitatavaks (autori ORCID, CI-s PDF-iks kompileeritud iga muudatuse korral).

# text
seg-3b1e95acc728 = <b>Raamid valideeritud millimeetri täpsusega avaldatud Vallado vektorite vastu.</b> TEME→PEF/ITRF taandamine, täielik CIO IAU 2006/2000A GCRS→ITRS ahel ja ECEF→geodeetilise WGS-84 teisendus on nüüd seotud Vallado et al. (AIAA 2006-6753) läbitöötatud näitega koos selle IERS EOP-ga, mitte ainult sisemise enesekooskõlaga.

# text
# c1: hifitime
seg-fd9818877a6c = <b>Sõltumatud ajaskaalade ristkontrollid.</b> ERA ning UTC/TAI/TT skaalad langevad teegiga <c1/> kokku täpsusega < { "1" } µs ja DE440 planeetide efemeriid langeb kokku JPL Horizonsiga (Kuu/Päikese geotsentrilised asendid), mõlemad alati sisselülitatud CI väravatena.

# text
seg-75aeec4cd6d0 = Veebimänguväljak peidab kvaliteedinäitajate sakid, kui tulemusel pole ühtegi kvaliteedinäitaja rida, nii et ainult joonisega paketid (efemeriid, RAIM, spuufimine) avanevad oma joonisel — efemeriidi puhul maapinnajäljel — tühja tabeli asemel.

# text
seg-b8ab0cc3ce7f = Mänguväljaku juhitud liugurid <b>ja parameetri pühkimine töötavad nüüd efemeriidi / maapinnajälje stsenaariumi jaoks</b>: selle nupud (jaama laiuskraad / pikkuskraad, ajasamm, kestus, UT1−UTC) on häälestatavad ja pühkimine saab joonistada ülelennu geomeetriat (maksimaalne kõrgus, tipp-Doppler, kõrgus, kiirus) mis tahes nende vastu — nt maksimaalne kõrgus vs jaama laiuskraad. Sakk Sweep kuvatakse nüüd ainult siis, kui stsenaarium on tõesti pühitav, nii et ükski pakett ei paku juhtelementi, mis ei joonista midagi.

# text
# c1: DUT1 ≈ 0
# c2: CAPABILITY.md
seg-9e7a37e51940 = Dokumenteeriti SGP4 lähendus <c1/> GMST kutsekohas (≤ ~{ "13" }″ pöördeviga, SGP4 enda mudelivea piires) ja värskendati faili <c2/>.

# text
# c1: kshana.dev
seg-174a75e840b0 = JetBrainsi plugin <b>Kshana — PNT simulator</b> on nüüd avaldatud ja kinnitatud portaalis <a1>JetBrains Marketplace</a1>. README, <c1/> ja levitusdokumendid lingivad sellele otse.

# text
# c1: server.json
# c2: description
# c3: io.github.ashfordeOU/kshana-mcp
seg-4deaf7918fff = <b>MCP registri avaldamine</b> õnnestub nüüd: <c1/> <c2/> ületas registri 100-märgilist piiri (HTTP { "422" }). Seda lühendati ning serveri nimi (ja kujutise omandimärgend) joondati kanoonilise nimeruumiga <c3/>.

# text
# c1: 0.1.1
seg-1408961042a1 = <b>JetBrains Marketplace'i avaldamine</b> õnnestub nüüd: CI laadis uuesti üles sama pluginaversiooni, mis oli käsitsi loetletud, mida Marketplace tagasi lükkab. Plugina versioon tõsteti tasemele <c1/> ja idempotentsuse kaitse käsitleb nüüd ka vastust „already contains version“ no-op õnnestumisena.

# text
# c1: kshana.dev
# c2: style.css
# c3: app.js
seg-74e8cab2f10e = <b><c1/> vahemälu kõrvaldamine</b>: versioonitempliga <c2/>/<c3/> päringustringid järgivad väljalaset, nii et naasvad külastajad saavad alati praeguse ehituse.

# text
# c1: kshana-mcp
# c2: mcp/kshana-mcp/
# c3: rmcp
# c4: run_scenario
# c5: list_scenario_kinds
# c6: validate_scenario
# c7: export_sp3
# c8: export_omm
# c9: kshana::api
seg-65949229eed7 = <b><c1/> — Kshana kui Model Context Protocol (MCP) server</b> (<c2/>). Iseseisev, tööruumist välja jäetud crate (SDK <c3/> on edition { "2024" }), mis avab valideeritud mootori tehisintellekti agentidele ja assistentidele — Cursor, JetBrains AI Assistant / Junie ja mis tahes MCP klient — stdio kaudu. Tööriistad: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, igaüks õhuke ümbris üle <c9/>.

# text
# c1: ide/jetbrains/
# c2: .toml
seg-bd792f66363c = <b>JetBrains IDE plugin</b> (<c1/>). Tee stsenaariumi <c2/> peal paremklõps → <b>Run Kshana Scenario</b>; kvaliteedinäitajad ja tulemuse JSON voogedastatakse Kshana tööriistaaknasse. Puhas platvormi Kotlini plugin, ühilduv iga JetBrains IDE-ga { "2024.3" }+.

# text
seg-755358390517 = <b>Avalik levitamine + iga väljalaske automaatne avaldamine</b> mõlemale:

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
# c3: publish.yml
seg-14fc2fd73553 = <c1/> portaali <b>crates.io</b> (<c2/>) kaudu failiga <c3/>.

# text
# c1: kshana-mcp
# c2: ghcr.io
# c3: docker run ghcr.io/ashfordeou/kshana-mcp
# c4: mcp-publish.yml
seg-2b39bbfc0581 = <c1/> mitmearhitektuurilise <b>OCI kujutisena</b> portaalis <c2/> (<c3/>) uue faili <c4/> kaudu.

# text
# c1: kshana-mcp
# c2: server.json
seg-c824d1532eb6 = <c1/> <b>ametlikku MCP registrisse</b> GitHub OIDC kaudu (null saladust); registrikirje (<c2/>) kasutab OCI paketi tüüpi märgendiga kontrollitud omanikuga.

# text
# c1: publishPlugin
seg-f90da0c61aac = IDE plugin <b>JetBrains Marketplace'i</b> käsuga <c1/> (märgiga piiratud, valikuline arendaja allkirjastamine) iga väljalaskemärgendi korral.

# text
# c1: xval/anise-frames/
# c2: kshana
# c3: kshana::cio::gcrs_to_itrs_matrix
# c4: earth_latest_high_prec.bpc
# c5: finals2000A
# c6: anise
# c7: hifitime
# c8: kshana
# c9: Cargo.lock
# c10: cargo deny
# c11: default-features = false
# c12: frame-xval
# c13: report.{json,md}
# c14: workflow_dispatch
# c15: main
# c16: docs/VALIDATION.md
# c17: ROADMAP.md
seg-21d7457dad23 = <b>Sõltumatu ANISE/SPICE tugisüsteemi ristvalideerimine</b> (<c1/>). Iseseisev, tööruumist välja jäetud crate kontrollib <c2/> IAU 2006/2000A CIO taandust (<c3/>, GCRS→ITRS) <b>ANISE</b> (puhas-Rust NAIF/SPICE uusteostus) vastu, mis pöörab GCRF→ITRF93 JPL-i failist <c4/>, kusjuures <b>samad IERS <c5/> Maa orientatsiooni parameetrid antakse mõlemale poolele</b>, kaheksal kvartaalsel epohhil { "2020" }–{ "2023" }. Kaks sõltumatut raami realiseeringut langevad kokku <b>maksimaalse suhtelise pöördega { "0.028" }″ — ≤ { "0.86" } m maapinnal, ≤ { "0.93" } m LEO-l, ≤ { "3.6" } m GNSS-i orbiidil</b>, täites ammuse ROADMAP-i raami ristkontrolli „< { "10" } m“ suure varuga (see täiendab, kuid ei asenda, olemasolevaid bitt-bitilt SOFA/ERFA ankruid). Crate on isoleeritud, sest <c6/> + <c7/> on MPL-2.0 / edition-2024 ja ei tohi kunagi sattuda avaldatud <c8/> sõltuvusgraafi, selle faili <c9/>, litsentsiväravasse <c10/> ega MSRV ehitusse; ANISE on fikseeritud märkega <c11/>. Sisaldab binaari <c12/> (toob ~{ "5" } MB BPC, prindib tabeli, kirjutab <c13/>), kernelit/võrku ise vahelejätvat testiväravat ja valikulist ainult <c14/> CI tööd (ei blokeeri kunagi haru <c15/>). Dokumenteeritud failis <c16/> (CIO rida) ja <c17/>.

# text
# c1: .panel
# c2: min-width: auto
# c3: min-width: 0
seg-eb45b43dacc2 = <b>Mobiilisõbralik mänguväljak.</b> Parandati mänguväljaku <c1/> horisontaalne ülevool telefonidel (CSS-grid üksus, mille vaikeväärtus <c2/> renderdus ~{ "100" } px laiemana kui vaateala) märkega <c3/> ja laiusega kaitstud juhtelementidega; kontrollitud puhtaks laiustel { "360" } / { "390" } / { "414" } / { "768" } px. Joondati nupud „Pin to compare“ / „Download report“ (võrdsed veerisekastid flex-reas). Suurendati käivitusnupud, liugurid, valikud ja navigatsioonilingid telefonidel ja puuteseadmetel umbes { "44" } px WCAG { "2.5.5" } / Apple-HIG puutesihtmärgi miinimumini, lauaarvuti suurus muutumatu.

# text
# c1: sbas_protection_level
# c2: Some
# c3: propagate
# c4: propagate_dopri
# c5: lunar_look_angle
# c6: [0, 360)
# c7: SphericalHarmonicField::from_gfc
# c8: GM
seg-fe5095d5e61f = <b>Töökindluse tugevdamine vaenuliku lahingutesti läbimisest.</b> ({ "1" }) <c1/> lükkab nüüd tagasi mittelõpliku kõrguse/asimuudi/dispersiooni ja negatiivsed või mittelõplikud kovariatsiooni diagonaalid (peaaegu singulaarne geomeetria, mida väike σ skaleeris üles, võis varem libiseda absoluutse pivoti väravast läbi ja tagastada NaN VPL-i / absurdse HPL-i <em>kehtiva</em> <c2/> kujul — vaikiv terviklikkuse tõrge). ({ "2" }) Numbriline propageerija (<c3/>/<c4/>) ebaõnnestub suletult mittelõpliku algoleku korral, selle asemel et adaptiivset kontrollerit igavesti ringi keerutada. ({ "3" }) DEM-i raku abifunktsioon ei kuku enam kokku ühe valimiga ({ "1" }×N) ruudustiku korral. ({ "4" }) <c5/> asimuuti hoitakse rangelt vahemikus <c6/>. ({ "5" }) <c7/> lükkab tagasi mittefüüsikalise (NaN / mittepositiivse) <c8/>/raadiuse.

# text
# c1: validation_report
# c2: kshana-validation-summary.html
seg-9ca339d8977a = <b>Binaar <c1/> + väljalaskeartefakt</b>: sõltuvusteta generaator, mis väljastab ühelehekülgse, printimisvalmis HTML valideerimiskokkuvõtte, mis indekseerib iga CI-s jõustatud valideerimise (SGP4 666/666, EGM2008, bitt-bitilt raamid, NIST Allan, IMU andmelehed, ARAIM/SBAS, 3-OS reprodutseeritavus, katvus) selle testi ja välise etaloni juurde. Väljalasketöövoog genereerib faili <c2/> ja lisab selle (SLSA päritoluga) igale märgendatud väljalaskele.

# text
# c1: tests/python/test_numpy_interop.py
# c2: auditwheel show
seg-bd231d07658f = <b>numpy-koostalituse pytest + wheel-i tugevdamine</b>: <c1/> (käitatakse CI-s) pluss fikseeritud manylinux konteiner ja kontrollisamm <c2/> wheel-i ehituses.

# text
# c1: docs/tutorials/
# c2: tests/tutorials.rs
seg-5427cae6fc39 = <b>Õpetused ja haridus</b>: <c1/> (kolm läbitöötatud õpetust, valdkonnakohased annoteeritud stsenaariumid, Tier-1/2/3 harjutused) koos failiga <c2/>, mis seob iga tsiteeritud arvu elava mootori väljundiga.

# text
# c1: paper/
# c2: notebooks/
# c3: submissions/
# c4: FUNDING.yml
seg-2fad9124c5a6 = <b>Välised esitusartefaktid</b> (<c1/>, <c2/>, <c3/>): JOSS-i artikli mustand, kvant-versus-klassikaline märkmik ja esitusvalmis komplektid awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC jaoks, pluss <c4/> — esitamise väliste sammude ettevalmistamine.

# text
# c1: altpnt
# c2: .hgt
# c3: terrain-nav
# c4: combined-altpnt
seg-0f88f8bccbc1 = <b>Maastikupõhine ja kombineeritud alternatiivse PNT navigatsioon</b> (moodul <c1/>): TERCOM/SITAN maastikusobitusnavigaator DEM-i kohal (<c2/> laadija + sünteetilise testandmestiku generaator) ja kombineeritud gravitatsiooni + magnetilise (IGRF) + maastiku GPS-ita navigaator, esitatud stsenaariumi liikidena <c3/> ja <c4/>. Valideeritud maastikusobituse koondumisega (teadaolev süstitud nihe taastati) ja piiratud kombineeritud filtri veaga GPS-ita akna jooksul.

# text
# c1: lunar
seg-bd01ec72fa2a = <b>LunaNet LANS geomeetria</b> (<c1/>): nimetatud Kuu pinna asukohad (Apollo 11/15/16, Shackletoni serv) autoriteetsete selenograafiliste koordinaatidega, pinna vaatenurgad (az/el/kaugus), nähtavus/katvus ja asukoha DOP, valideeritud Kuu raadiuse, avaldatud asukohakoordinaatide ja radiaalse otse ülal oleva { "90" }° kõrguse samasuse vastu.

# text
# c1: eci_track
seg-2dad9cf59ea9 = <b>Juhitud brauseri mänguväljak</b>: juhitud režiimi liugurid, sakitatud väljundipaneel, esmakäivituse ringkäigu ülekate, parameetri pühkimise ja mitme käitluse ülekatte režiimid, sõltuvusteta canvas/SVG 3D orbiidivaade (orbiidipakett väljastab nüüd lisanduva <c1/>), manustamise/iframe režiim ja allalaadimine HTML aruandena — igaühel on CI-s node ühiktestid.

# text
# c1: tests/imu_allan_spec.rs
seg-261604603d67 = <b>Andmelehega valideeritud IMU veamudel</b> (<c1/>): ADIS16465/16488/16460 ARW/VRW/nihke ebastabiilsus taastatud sünteesitud Alani hälbest ja kontrollitud tootja spetsifikatsioonide vastu (NIST SP1065 / IEEE { "952" } tuvastus).

# text
# c1: tests/allan_nist_sp1065_1000point.rs
seg-dc7b9bdb3076 = <b>NIST SP1065 Alani hinnangute valideerimine</b> (<c1/>): neli hindajat taastoodavad avaldatud 1000-punktilised etalonhälbed ja tabeli 32 usaldusvahemikud.

# text
# c1: sbas
# c2: sbas_protection_level
# c3: orbit::invert4
# c4: iono_free_l1l5
# c5: γ₁₅ = 1.79327
# c6: do316_compliance_map
# c7: inv(GᵀG)
# c8: docs/COMPLIANCE.md
seg-5d50be22aacd = <b>SBAS / DO-229E kaitsetasemed, L1/L5 ionosfäärivaba ja DO-316 compliance-kaart</b> (moodul <c1/>). <c2/> moodustab kaalutud geomeetriamaatriksi iga satelliidi kõrgusest/asimuudist ning UDRE/GIVE/õhusõiduki/tropo veaeelarvest, pöörab normaalmaatriksi (ühine <c3/>) ja projitseerib dispersioonid HPL/VPL-i DO-229E K-tegurite kaudu (PA 6.0/5.33, NPA { "6.18" }). <c4/> lisab GPS L1/L5 ionosfäärivaba pseudovahemaa (IS-GPS-705, <c5/>), valideeritud tühistama mootori sõltumatu esimese järgu ionosfäärilise viivituse. <c6/> jälgib DO-316/DO-229E nõudeid teostavate funktsioonideni. Valideeritud suletud kujuga K-teguri definitsioonide, numpy <c7/> etalongeomeetria ja kahe tee kovariatsiooni samasuse vastu; avaldatud-PL RTKLIB/gLAB standardi järgimise ristkontroll on dokumenteeritud ülevaatuse ootel failis <c8/>.

# text
# c1: gravity_sh::SphericalHarmonicField
# c2: C̄_nm, S̄_nm
# c3: egm2008_data.rs
# c4: tools/gen_egm2008.py
# c5: tools/egm2008_to70.gfc
# c6: .gfc
# c7: from_gfc
# c8: C̄00
# c9: −μr/|r|³
# c10: forces::zonal_accel
seg-e9e60b40e42a = <b>Täielik tesseraalne sfääriliste harmooniliste gravitatsioon — EGM2008 väli astme/järguni { "70" }.</b> Uus <c1/> hindab geopotentsiaali ja selle kiirendust Maaga seotud raamis täielikult normaliseeritud koefitsientidest <c2/>, kasutades stabiilset Holmes–Featherstone'i normaliseeritud Legendre'i rekurrentsi (denormaliseerimine voolaks sellel astmel üle). Tarnitavad koefitsiendid on NGA EGM2008 toode (avalik omand, ICGEM kaudu), kaasatud faili <c3/> ja taastoodetud bitt-bitilt skriptiga <c4/> sissekirjutatud failist <c5/>; iga ICGEM <c6/> mudel laaditakse funktsiooniga <c7/>. Valideeritud kolme sõltumatu etaloni vastu: punktmassi kollaps (ainult <c8/> = <c9/>), ainult tsonaalne väli, mis taastoodab olemasoleva <c10/> täpsusega ~{ "1e-9" }, ning analüütiline kiirendus, mis langeb kokku otse summeeritud potentsiaali lõplike vahede gradiendiga täpsusega <{ "1e-6" }.

# text
# c1: forces::lense_thirring_accel
# c2: ForceModel::lense_thirring()
seg-c33a2dbf851d = <b>Üldrelatiivsusteooria Lense–Thirringi (raamiveo) kiirendus</b> (<c1/>, IERS { "2010" } võrrand { "10.12" }), gravitomagnetiline liige väljaspool olemasolevat Schwarzschildi parandust, ühendatud numbrilisse propageerijasse uue lipuga <c2/>. Valideeritud lineaarsena Maa nurkimpulsi suhtes ja { "1" }–{ "2" } suurusjärku Schwarzschildi liikmest väiksemana, mis on LAGEOS / Gravity Probe B mõõtmiste režiim.

# text
# c1: Propagator
# c2: NumericalPropagator
# c3: ForceModel
# c4: Tolerance
# c5: Integrator
# c6: Sgp4
# c7: propagator::Propagator
# c8: state_at(t_seconds) -> StateVector
# c9: Box<dyn Propagator>
# c10: PropagatorError
seg-909562023109 = <b>Tunnusjoon <c1/>, mis ühendab analüütilised ja numbrilised orbiidipropageerijad.</b> Numbriline Cowelli jõumudeli propageerija on nüüd SGP4 esmaklassiline kaaslane: uus tüüp <c2/> (algolek + <c3/> + <c4/> + sammu kahekordistamise või Dormand–Prince'i <c5/> valik) ja <c6/> mõlemad teostavad <c7/>, mille <c8/> tagastab inertsiaalse TEME oleku SI ühikutes (m, m/s), nii et need on omavahel asendatavad tüübi <c9/> taga. SGP4 teostus on omase meetodi täpne km/min→SI teisendus (kontrollitud võrdsustestiga); numbriline teostus ületab tunnusjoone kaudu sama alammeetrilise täpse Kepleri värava, kaks adaptiivset draiverit langevad kokku ja <c10/> toob esile aluseks oleva SGP4 koodi.

# text
seg-d094880df57b = See väljalase sulgeb mootori suurima õigsuse lünga: Maa orientatsioon ja tugisüsteemi taandamine tehakse nüüd etalonteostuse tasemel (valideeritud <b>bitt-bitilt ERFA/SOFA vastu</b>), terviklikkuse pakk saab <b>kahe konstellatsiooniga ARAIM-i</b> päris GPS+Galileo TLE-del ning propageerimise, kvantandurite, Kuu/tsislunaarne ja geomagnetilised kihid süvenevad — koos tüpiseeritud Pythoni API, rikkalikuma brauserimänguväljaku ja kolme OS-i reprodutseeritavuse maatriksiga. Tipphetked:

# text
seg-bfe1d4a7cabd = <b>Tugisüsteemid, bitt-bitilt.</b> Täielik IAU 2000A ja 2000B nutatsioon, IAU { "2006" } pretsessioon, CIO-põhine (X, Y, s) IAU 2006/2000A GCRS↔ITRS taandamine, IERS poolusliikumine ja TEME→GCRS/ITRS väljundraamid — igaüks valideeritud bitt-bitilt ERFA/SOFA etalonrutiinide vastu.

# text
# c1: docs/ARAIM_REFERENCE.md
seg-bb5705347a24 = <b>Kahe konstellatsiooniga ARAIM</b> (GPS + Galileo) päris TLE-del, HPL/VPL-i, Stanfordi diagrammi väljundi ja avatud failiga <c1/>.

# text
seg-2865dadcd4c8 = <b>Tsislunaarne PNT</b>: Maa–Kuu CR3BP propageerija, MCI↔MCMF raamid, selenograafilised koordinaadid ja käivitatav LunaNet Kuu terviklikkuse stsenaarium.

# text
seg-3b636707a158 = <b>Kvantandurdus</b>: Coriolisi ja AC-Starki süstemaatilised vead külmaatom-interferomeetrile, triivi pühkimine ja valideerimine Freieri ({ "2016" }) eelarve vastu.

# text
seg-10bc94801a6a = <b>IGRF-14</b> geomagnetilise põhivälja mudel, iseseisev ja valideeritud.

# text
# c1: RunOutput
# c2: ScenarioMeta
# c3: .data()
# c4: scenario_kinds
# c5: validate_toml
seg-6485f627d793 = <b>Tüpiseeritud Pythoni API</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, tüübitõmmised) CI wheel-i ehitusega, pluss esmaklassiline GCRS/ITRS propageerija väljund ja CCSDS OMM eksport.

# text
# c1: sgp4
# c2: src/
# c3: ubuntu
# c4: macos
# c5: windows
seg-2b7693641333 = <b>Usaldusväärsus ja reprodutseeritavus</b>: otsene SGP4 täpsuse võrdlus sõltumatu crate'iga <c1/>, CI katvuse värav (~{ "97" } % ridu kataloogis <c2/>) ja kolme OS-i (<c3/>/<c4/>/<c5/>) reprodutseeritavuse maatriks.

# text
# c1: src/report.rs
# c2: src/chart.rs
# c3: web/app.js
# c4: src/hybrid.rs
# c5: jamming.rs
# c6: timetransfer.rs
# c7: spoof.rs
# c8: raim.rs
# c9: lunar.rs
# c10: ensemble.rs
# c11: sweep.rs
# c12: gnss_sim.rs
# c13: fusion/pack.rs
# c14: inertial/mod.rs
# c15: #0e131b
# c16: --bg
# c17: --line
# c18: --fg
# c19: --accent-bright
# c20: --partial
# c21: --crit
seg-32e53ac66056 = <b>Iga mänguväljaku joonis vastab nüüd saidi teemale.</b> Kõik kaksteist SVG joonisegeneraatorit — tulemuse/holdover-i joonis (<c1/> + <c2/>), Alani hälbe joonis (<c3/>) ja iga stsenaariumi joonis (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + kättesaadavus, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — kasutasid külmi meremehesinise paneele (<c15/>), külmhalle telgi/teksti ning kokkusobimatut punase/sinise/lilla seeriapaletti. Nüüd kasutavad need kõikjal sooja grafiitpaletti: paneelid <c16/>, soe ruudustik <c17/>, sildid <c18/>, järjepideva seeriate jaotusega: kvant = mesikuldne (<c19/>), klassikaline = soe merevaik (<c20/>), spets/piir = <c21/>. Ohutuskodeeringuga vaated säilitavad oma tähenduse: RAIM Stanfordi diagramm jääb roheliseks (kättesaadav) / merevaigukarva (eksitav) / punaseks (ohtlik) / summutatud teraseks (kättesaamatu) ning HPL/VPL loetakse kuld-/pronksina.

# text
# c1: Kshana v<version> · <scenario-hash> · kshana.dev
seg-2bb31dfc7756 = <b>Joonised on nüüd salvestamisel/allalaadimisel ise end kirjeldavad.</b> Mõlemad joonised põimivad oma pealkirja SVG-sse (Alani joonise pealkiri + alapealkiri „lower is better“ olid varem ainult HTML-i pildi ümber, nii et salvestatud pildil polnud allkirja) ja mõlemal on päritolu jalus — <c1/> — nii et allalaaditud joonis seisab iseenesest ja jääb reprodutseeritavaks.

# text
# c1: Kshana v<version> · scenario <hash> · kshana.dev
# c2: api::run_toml
# c3: .chart.svg
# c4: scenario
# c5: scenario_hash
# c6: docs/PROVENANCE.md
seg-9f528e334cd8 = <b>Iga joonis kannab nüüd päritolu jalust.</b> Jalus — <c1/> — templitakse kesksest kõigi stsenaariumi liikide jaoks funktsioonis <c2/> (varem oli see ainult holdover-i ja Alani joonistel), nii et iga salvestatud või allalaaditud pilt — mänguväljakult, CLI eksportist <c3/> või HTML tulemuskaardilt — tuvastab oma versiooni, stsenaariumi sõrmejälje ja allika. Räsi on selguse mõttes märgitud <c4/> ja tuleb tulemuse väljalt <c5/>, kui see on olemas, koos allikaräsi tagavaraga terviklikkuse/Kuu aruannete jaoks. Mis sõrmejälg on ja miks see seal on, on dokumenteeritud README jaotises „Output“ ja failis <a1><c6/></a1>.

# text
# c1: raim::chi2_quantile
# c2: read_dir
# c3: chi2_quantile
# c4: p
# c5: k
# c6: normal_quantile
# c7: assert!
# c8: Normal
seg-635697ed3fb1 = <b><c1/> ja RAIM Stanfordi müra valimivõtja on nüüd paanikavabad vahemikust väljas / mittelõplike sisendite korral</b> (<c2/>-järjekorrast sõltuv fuzz-leid uutest ARAIM stsenaariumidest). <c3/> kaitseb nüüd <c4/>/<c5/> nagu <c6/> (tagastab piiriväärtuse <c7/>-paanika asemel) ja kättesaadavuse Stanfordi müra <c8/> piirab rangelt positiivse σ-ni — nii et terviklikkuse/ARAIM pakk ei paanitse kunagi mutatsiooniga või valesti seadistatud stsenaariumidel.

# text
# c1: reproducibility-matrix
# c2: tests/golden/
# c3: tests/cross_platform_golden.rs
# c4: golden.rs
# c5: sgp4_verification.rs
# c6: determinism.rs
# c7: docs/REPRODUCIBILITY.md
seg-b36a0c42845e = <b>Platvormideülene reprodutseeritavuse CI maatriks.</b> Uus töö <c1/> käitab reprodutseeritavuse teste platvormidel <b>ubuntu-latest, macos-latest ja windows-latest</b> iga push'i korral. Kuna täielik tulemuse JSON ei ole OS-ide vahel baidi haaval identne (viimase ULP libm lahknevus), kinnitab see täpselt platvormist sõltumatut projektsiooni — sisendi sõrmejälge pluss väljundi kuju, fikseeritud stsenaariumi kohta SHA-256 golden-failidena kataloogis <c2/> uue faili <c3/> poolt — koos numbriliste fikseeringutega (<c4/>, täpsusega { "1e-6" }), SGP4 olekutega (<c5/>, täpsusega { "2e-5" } km) ja sama protsessi determinismiga (<c6/>). Koos tõestavad need platvormideülest reprodutseeritavust kolmel OS-il ilma täpse täisväljundi baidiräsi hapruseta. Jaotust dokumenteerib <c7/>.

# text
# c1: coverage
# c2: cargo-tarpaulin
# c3: src/
# c4: src/
seg-9b8c0a407387 = <b>Koodikatvuse värav CI-s.</b> Uus töö <c1/> käitab tööriista <c2/> LLVM-i lähtekoodipõhise mootoriga, avaldab lcov aruande ehitusartefaktina ja jõustab ridade katvuse põhja kataloogil <c3/> (genereeritud andmetabelid, CLI sisenemispunkt, testid ja veebivarad välja arvatud). Mõõdetud ridade katvus on ~{ "97" } % kataloogis <c4/> (SGP4 ja kellamoodulid ≥{ "95" } %); värav on seatud tasemele { "85" } % — üle ≥{ "80" } % sihtmärgi ja mõõdetud väärtusest eemal, nii et see püüab regressioone ilma kõikumata. README-s on avaldatud katvuse märk.

# text
# c1: sgp4
# c2: tests/sgp4_crate_comparison.rs
# c3: tcppver.out
# c4: tests/fixtures/sgp4_comparison.md
# c5: KSHANA_REGEN_FIXTURES=1
# c6: from_elements
seg-1dfc4beb239a = <b>SGP4/SDP4 otsevõrdlus sõltumatu crate'iga <c1/>.</b> Uus test (<c2/>) ristvalideerib Kshana propageerijat enimkasutatud Rust SGP4 teegi (neuromorphicsystems/sgp4, lisatud ainult testiks mõeldud dev-sõltuvusena) vastu samadel { "666" } AIAA 2006-6753 vektoritel. Kui mõlemat juhitakse vektorite kasutatud WGS72 gravitatsioonimudelil, langevad kaks sõltumatut teostust kokku <b>alammikromeetri täpsusega</b> Maa-lähedastel ja resonantsorbiitidel ning <b>halvima juhu { "4.12" } mm täpsusega</b> kõigis režiimides, mõlemad taastoodavad etalontabeli <c3/>. Commit'itud võrdlustabel (<c4/>, genereeritud uuesti käsuga <c5/>) jaotab tulemuse režiimide kaupa (LEO/MEO, kaugkosmos, ½-päeva ja 1-päeva resonants) ning märgib neli tahtlikult patoloogilist juhtu, mille crate konstruktsioonil tagasi lükkab. Elavad väited nõuavad mõlemalt täpsust { "2e-5" } km piires etalonist ja omavahelist kokkulangevust { "4e-5" } km piires — regressioonikaitse, mitte ühekordne. See on konkurentsivõimeline päritolu: õigsus sõltumatu koodibaasi vastu, mitte ainult staatilise tabeli vastu. (Crate'i vaikimisi <c6/> kasutab WGS84 ja erineb seetõttu WGS72 etalonist ~km võrra — esitatud ausalt tabeli selgituses.)

# text
# c1: src/omm.rs
# c2: orbit
# c3: kshana <orbit.toml> --export-omm out.omm
# c4: export_omm = true
# c5: <scenario>.omm
# c6: --export-sp3
# c7: YYYY-NNNP
# c8: tle::parse_tle_identity
# c9: OBJECT_NAME
# c10: OBJECT <id>
# c11: CREATION_DATE
# c12: api::export_omm
# c13: api::auto_export_omm
# c14: OmmFile::from_tle_block
# c15: OrbitClockScenario::to_omm_string
# c16: gps-ops
# c17: tests/sp3_export_roundtrip.rs
seg-dc75162ecd64 = <b>CCSDS OMM eksport on nüüd otsast lõpuni kättesaadav.</b> OMM kirjutajal (<c1/>) polnud varem CLI/API teed; stsenaariumi <c2/> keskmised elemendid saab nüüd avaldada CCSDS 502.0-B-2 OMM kataloogina — üks OMM KVN sõnum iga TLE-ga määratletud satelliidi kohta — käsuga <c3/> või <c4/> stsenaariumis kirjutab automaatselt faili <c5/> (peegeldab olemasolevat <c6/>). Iga sõnum kannab satelliidi <b>tegelikku</b> NORAD kataloogi numbrit, COSPAR rahvusvahelist tähist (<c7/>) ja epohhi (CCSDS aasta-päeva vorm), parsitud TLE reast { "1" } uue funktsiooniga <c8/>; nimerida muutub väärtuseks <c9/> (muidu <c10/>). <c11/> on stsenaariumi epohh, mitte seinakell, nii et väljund on reprodutseeritav. Uus API: <c12/> / <c13/>, <c14/>, <c15/>. Sünteetiline Walkeri või RINEX stsenaarium (ilma TLE keskmiste elementideta) annab vea, mitte ei väljasta tühja faili. Valideeritud kaasasoleva 30 satelliidi <c16/> hetktõmmise vastu (<c17/>).

# text
# c1: web/hover.mjs
# c2: web/app.js
# c3: <img>
# c4: web/hover.test.mjs
seg-036782a2b65e = <b>Interaktiivsed hõljutusnäidud mänguväljaku joonistel.</b> Kursori liigutamine joonise kohal naelutab ristjoone lähima valimi külge ja näitab väärtuse kohtspikrit (<c1/>, ühendatud failis <c2/>). Alani joonisel näitab see τ ja iga kella σ_y(τ); ajarea stsenaariumijoonistel (kella holdover, hinnangulise asukoha jälgimine, aja edastamine, hübriid-PNT, GNSS/INS) näitab see aega ja iga komplekti väärtust joonise enda ühikutes (ns / m / ps / kasutusaste), parsitud tulemusest, nii et näit vastab kõverale. Spetsialiseeritud diagrammid (RAIM, spuufimine, pühkimine) ülekatet ei saa. Joonised jäävad ise end kirjeldavateks blob-<c3/>-ideks — ülekate on läbipaistev ristjoon + kohtspikker peal, nii et allalaadimine/võrdlemine/eksport on puutumata. Koordinaadimatemaatika (lähim valim, kursor→joonise osa, murdjoone parsimine) on ühiktestitud (<c4/>, käitatakse CI-s).

# text
# c1: web/compare.mjs
# c2: web/app.js
# c3: web/compare.test.mjs
# c4: <img>
seg-1588ae024e5d = <b>A/B võrdlusrežiim mänguväljakul.</b> Kinnita mis tahes käitus lähtetasemena A, käivita teine stsenaarium ja need kuvatakse kõrvuti kvaliteedinäitajate deltatabeliga (holdover, ajastuse RMS/p95, kättesaadavus), mis värvib mõõdiku kohta võitja (<c1/>, ühendatud failis <c2/>; deltaloogika ühiktestitud failis <c3/>, käitatakse CI-s). Kõik väärtused lisatakse tekstina ja kõik joonised blob-<c4/> kaudu, nii et stsenaariumi stringist ei süstita kunagi midagi märgistusena.

# text
# c1: web/chartdl.mjs
# c2: web/app.js
# c3: kshana-<chart>-v<version>-<scenario-hash>.<ext>
# c4: web/chartdl.test.mjs
seg-6e7a99f8f275 = <b>Joonise allalaadimisnupud (SVG + PNG).</b> Igal mänguväljaku joonisel on nüüd teemaga sobiv tööriistariba „Download SVG / PNG“ (<c1/>, ühendatud failis <c2/>). SVG annab tagasi täpse, skaleeritava originaali; PNG rastriseerib sama ise end kirjeldava pildi 2x slaidide ja dokumentide jaoks. Failid nimetatakse oma päritoluga — <c3/> — ning failinime/suuruse loogika on ühiktestitud (<c4/>, käitatakse CI-s).

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: src/igrf_data.rs
seg-4cb87e7dc892 = <b>IGRF-14 geomagnetilise põhivälja mudel (<c1/>).</b> IAGA standardne sfääriliste harmooniliste väli (aste/järk { "13" }, epohh { "2025.0" } + sekulaarne muutus { "2025" }–{ "2030" }; koefitsiendid masinaga genereeritud ametlikust failist <c2/> skriptiga <c3/> faili <c4/>, bitt-bitilt reprodutseeritavad). Schmidti normaliseeritud süntees tagastab välja vektori (põhi/ida/alla) ja tuletatud elemendid (deklinatsioon, inklinatsioon, horisontaalne/kogu intensiivsus) mis tahes geodeetilises asukohas/kuupäeval, pluss geomagnetilise pooluse ja dipoolitugevuse — magnetiline vaste gravitatsioonikaardi sobitajale alternatiivse PNT navigatsiooni jaoks. Valideeritud iseseisvalt: süntees langeb kokku täpse suletud kujuga kaldus dipooliga, täielik astme-13 analüütiline väli langeb kokku skalaarpotentsiaali lõplike vahedega, dipooli telg taastoodab tuntud geomagnetilise pooluse (~{ "80.7" }°N, −{ "72.7" }°E) ja ~{ "29.7" } µT tugevuse ning globaalne väli on füüsikaline.

# text
# c1: src/python.rs
# c2: run
# c3: run_full
# c4: RunOutput
# c5: .json
# c6: .svg
# c7: .summary
# c8: .data()
# c9: run_typed
# c10: scenario_kinds()
# c11: validate_toml()
# c12: kshana.pyi
# c13: py.typed
# c14: docs/PYTHON_API.md
seg-c69d50031da4 = <b>Tüpiseeritud Pythoni sidumised (<c1/>).</b> Lisaks stringi sisse/stringi välja funktsioonidele <c2/>/<c3/> avab moodul nüüd tüpiseeritud klassi <c4/> (<c5/>, <c6/>, <c7/> ja juurdepääsufunktsioon <c8/>, mis tagastab tulemuse parsituna natiivseks Pythoni sõnastikuks — JSON-i uuesti parsimist pole, NumPy-ga ümbritatav), pluss <c9/>, <c10/> (metaandmete sõnastike parsitud loend) ja <c11/> (veateadete mittepaiskuv loend). Tarnib PEP { "561" } tüübitõmmise (<c12/> + <c13/>) mypy/pyright/redaktorite jaoks ning kiirjuhendi <c14/>. Olemasolevad funktsioonid on muutumatud.

# text
# c1: src/orbit.rs
# c2: Frame
# c3: position_in_frame
# c4: state_gcrs
# c5: Propagator
# c6: gcrs_to_itrs
# c7: state_gcrs
seg-fb65ac14344c = <b>Propageerijate esmaklassilised väljundraamid (<c1/> <c2/> enum + <c3/> + <c4/>).</b> Iga <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) saab nüüd väljastada oma asendi raamis TEME, <b>GCRS</b> (≈ J2000) või <b>ITRS</b> (Maaga seotud) — TEME natiivselt, GCRS valideeritud TEME→GCRS taandamise kaudu, ITRS selle ahelduse kaudu IAU 2006/2000A CIO pöördesse <c6/> — ning oma täieliku GCRS oleku (asend + kiirus) funktsiooniga <c7/>. Kuupäevaga inertsiaalne väljund ei ole enam ainult TEME.

# text
# c1: src/cio.rs
# c2: X, Y
# c3: eraNut06a
# c4: s
# c5: eraS06
# c6: tools/gen_s06.py
# c7: src/cio_s06_data.rs
# c8: eraC2ixys
# c9: eraEra00
# c10: eraC2tcio
# c11: eraXys06a
# c12: eraC2ixys
# c13: eraEra00
seg-8f596733c439 = <b>CIO-põhine IAU 2006/2000A taevasest maapealseks taandamine (<c1/>).</b> Kaasaegne, pööripäevavaba ahel GCRS↔CIRS↔ITRS: CIP koordinaadid <c2/> loetud IAU 2006/2000A nihke-pretsessiooni-nutatsiooni maatriksist (taaskasutades valideeritud FW pretsessiooni + 2000A nutatsiooni parandusega <c3/> P03), 66-liikmeline CIO-asukoha <c4/> rida (<c5/>, masinaga genereeritud ERFA etalonist skriptiga <c6/> faili <c7/>, bitt-bitilt reprodutseeritav), GCRS→CIRS maatriks (<c8/>), Maa pöördenurk (<c9/>) ning täielik GCRS→ITRS pööre (<c10/>, kombineeritud olemasoleva IERS poolusliikumisega). Valideeritud <b>bitt-bitilt</b> avaldatud <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 juures JD_TT { "2453736.5" }), <c12/> ja <c13/> testvektorite vastu. CIO ahel ja vana pööripäeva/GMST-1982 TEME taandamine langevad kokku kuni nende dokumenteeritud ≈{ "2" }·(pööripäevade võrrand) sideerilise aja konventsiooni erinevuseni. See on range taandamine, mida pööripäeva/GMST tee lähendas.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_matrix_2000a
# c4: nut00a
# c5: tools/gen_nut00a.py
# c6: src/nutation_iau2000a_data.rs
# c7: eraNut00a
# c8: nutation_matrix_2000a
seg-32e6d8dfcebc = <b>Täielik IAU 2000A nutatsioonirida (<c1/> <c2/>, <c3/>).</b> Täielik MHB2000 mudel — { "678" } Kuu-Päikese + { "687" } planeetide liiget — täpsusega < { "0.1" } mas, olemasoleva 77-liikmelise 2000B kärpe kõrval. Tabelid on masinaga genereeritud IAU SOFA / ERFA etalonist <c4/> skriptiga <c5/> faili <c6/> (generaator taastoodab commit'itud faili bitt-bitilt) ning kogu rida — nii IERS-2003 kui MHB2000 põhiargumentide komplektid ja planeetide pikkused — on valideeritud <b>bitt-bitilt</b> avaldatud <c7/> testvektori vastu (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } juures JD_TT { "2453736.5" }, täpsusega { "1e-13" } rad). Vaikimisi TEME→GCRS taandamine hoiab 2000B rida (~{ "1" } mas, ahela kiiruseraami pöörde lihtsustuse all); <c8/> avab < { "0.1" } mas kuupäevamaatriksi neile, kes seda vajavad.

# text
# c1: kind = "lunar-integrity"
# c2: scenarios/lunanet-araim.toml
# c3: src/lunar.rs
# c4: LunarScenario
# c5: south_pole_hpl_pass
# c6: LunarReport
seg-35e9e419d2ae = <b>Käivitatav Kuu terviklikkuse stsenaarium (<c1/>, <c2/>).</b> Ühendab Kuu lõunapooluse kaitsetaseme läbimise (<c3/> <c4/> → <c5/>) stsenaariumikäitajaga JSON-iga <c6/> ja SVG HPL-i ajajoonisega, nii et tsislunaarse terviklikkuse juhtum on kättesaadav otse CLI-st. See toob lünga ausalt esile: { "30" } m LANS σ_URE korral ületab lõunapooluse HPL (≈ { "260" }–{ "450" } m) { "50" } m häirepiiri ({ "0" } % kättesaadav) — Kuu PNT terviklikkus ei ole veel täidetud.

# text
# c1: src/raim.rs
# c2: src/orbit.rs
# c3: scenarios/araim-gps-galileo.toml
# c4: araim_dual_constellation_availability
# c5: visible_positions_labeled
# c6: IntegrityScenario
# c7: araim_dual
# c8: tests/araim_dual_real_data.rs
seg-1910e8110b43 = <b>Kahe konstellatsiooniga ARAIM kättesaadavus päris GPS+Galileo TLE-del ja stsenaariumikäitaja ühendus (<c1/>, <c2/>, <c3/>).</b> Lisab funktsiooni <c4/> (täiustatud ARAIM mootor — ühe satelliidi <em>ja</em> kogu konstellatsiooni tõrked — käitatuna ajaruudustikul) ja <c5/> ning ühendab selle käitajaga <c6/> lipu <c7/> kaudu, nii et mitme-GNSS-i ARAIM uuring on kättesaadav otse TOML-ist. Päris andmetega test (<c8/>) kaasatud 2026-06-07 Celestraki GPS+Galileo hetktõmmistel näitab, et Galileo ühendamine tõstab ARAIM kättesaadavuse väärtuselt { "0.21" } väärtusele { "0.67" } nõudliku { "12" } m VAL juures ({ "10.5" }→{ "21.8" } nähtavat satelliiti), samal ajal kui konstellatsioonitõrke-robustne režiim on kahe konstellatsiooniga põhimõtteliselt piiratud — kvantitatiivne põhjus, miks robustne kahe konstellatsiooniga terviklikkus kaldub kolmanda konstellatsiooni või SBAS-i poole. Aus jääk: arvuliselt täpne EU ARAIM TN tabeli A-3 taastootmine ühe versioonilukustatud epohhi vastu ja Zenodo testandmestiku kirje.

# text
# c1: src/cr3bp.rs
# c2: cr3bp_accel
# c3: propagate_cr3bp
# c4: jacobi_constant
# c5: lagrange_points
# c6: src/lunar.rs
seg-78ab887a4543 = <b>Maa–Kuu süsteemi piiratud ringikujuline kolme keha ülesanne (CR3BP) (<c1/>).</b> Uus tsislunaarse dünaamika tuum, mida kahe keha/SGP4 propageerijad pakkuda ei saa: pöörleva raami liikumisvõrrandid (<c2/>), RK4 propageerija (<c3/>), Jacobi konstandi integraal (<c4/>) ja viis Lagrange'i punkti (<c5/>). Valideeritud suletud kuju / avaldatud ankrute vastu: Maa–Kuu kollineaarsed punktid (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), täpne võrdkülgne L4/L5 = (½−μ, ±√3/2, { "0" }), kõik viis kinnitatud välja tasakaaluna, Jacobi säilib integraatori täpsusega propageerimisel ja tasapinnaväline taastav jõud, mis teeb halo/NRHO orbiidid võimalikuks. See on alus päris NRHO esitamiseks. Aus jääk: diferentsiaalselt korrigeeritud perioodilised { "9" }:{ "2" } NRHO algtingimused, ekstsentriline/efemeriidi (DE) mudel ja denormaliseeritud teisendus faili <c6/> selenotsentrilistesse raamidesse.

# text
# c1: src/frames.rs
# c2: polar_motion_matrix
# c3: iauPom00
# c4: W = Rx(−y_p)·Ry(−x_p)·Rz(s′)
# c5: s′
# c6: pef_to_itrf
# c7: itrf_to_pef
# c8: teme_to_itrf
# c9: teme_to_ecef
# c10: x_p
# c11: y_p
seg-14f4572144f3 = <b>IERS poolusliikumine ja TEME→ITRF taandamine (<c1/>).</b> Lisab funktsiooni <c2/> (SOFA <c3/>: <c4/> TIO asukohaga <c5/>), <c6/> / <c7/> ja <c8/> — GMST-põhine TEME→PEF pööre, millele järgneb poolusliikumine — täiendades ITRF-täpset Maaga seotud asendit ainult GMST-põhisele <c9/> peale (poolusliikumine on orbiidiraadiusel kümnete meetrite suurune mõju). <c10/>/<c11/> on vaadeldud IERS suurused, mille kutsuja esitab. Aus jääk: täielikult CIO-põhine (X, Y, s) ahel ja ANISE/SPICE <{ "10" } m numbriline ristkontroll jäävad järgmisteks sammudeks.

# text
# c1: src/inertial/quantum_imu.rs
# c2: docs/QUANTUM.md
# c3: Φ_cor = 2·k_eff·v_⊥·Ω·T²
# c4: coriolis_phase
# c5: 2·Ω×v
# c6: coriolis_accel_bias
# c7: Φ_LS = (δ_LS,1 − δ_LS,3)/Ω_eff
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: docs/QUANTUM.md
seg-b5e84faf880c = <b>Külmaatom-interferomeetri süstemaatilised vead, triivi pühkimine ja avaldatud seadmega valideerimine (<c1/>, <c2/>).</b> Laiendab esimestest printsiipidest CAI kiirendusmõõturit kahe juhtiva deterministliku süstemaatilise veaga: <b>Coriolisi/pöörlemise</b> faas <c3/> (<c4/>, samaväärse kiirendusnihkega <c5/> funktsiooni <c6/> kaudu) ja <b>AC-Starki valgusnihke</b> faas <c7/> (<c8/>, mis tühistub π/2–π–π/2 sümmeetria tõttu konstantse nihke korral). Lisab funktsiooni <c9/> (hinnangulise asukoha triiv vs tsükli aeg — kvant-versus-klassikalise võrdluse tuum) ja valideerimistesti Freier et al. { "2016" } mobiilse gravimeetri vastu (arXiv:{ "1512.05660" }): modelleeritud kvantprojektsioonimüra põhi jääb avaldatud { "96" } nm/s²/√Hz lühiajalisest mürast allapoole ja ~{ "2" } suurusjärgu piiresse. <c10/> uuendatud. Aus jääk: lainefrondi/kimbu suunamise süstemaatilised vead, vöötmitmetähenduslikkuse lahendamine, täpne CARIOQA-PMP / Boeing-AOSense lennutesti taastootmine (vajab avaldatud platvormi PSD-sid) ja JS mänguväljaku eelseade.

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: selenographic_to_mcmf
# c6: south_pole_hpl_pass
seg-f32829ed9cf1 = <b>Tsislunaarne raami taandamine ja Kuu lõunapooluse terviklikkuse läbimine (<c1/>).</b> Laiendab Kuu ARAIM mootorit MCI↔MCMF (Kuukeskne inertsiaalne ↔ Kuuga seotud) pöördega (<c2/> / <c3/>, lihtsustatud keskmise pöörde mudel Kuu sideerilise kiirusega), selenograafilise laiuse/pikkuse/kõrgusega (<c4/> / <c5/>) ja funktsiooniga <c6/> — maandunud Artemise piirkonna vastuvõtja vastu esindava LunaNet releekomplekti { "24" } h läbimisel, mis kvantifitseerib terviklikkuse lünga ausalt: nominaalse { "30" } m LANS σ_URE korral on kaitsetase lõplik, kuid ületab { "50" } m pinnaoperatsioonide häirepiiri. Aus jääk: täpne LANS NRHO efemeriid (3-keha tsislunaarne orbiit), füüsikaline libratsioon / pretsesseeruv Kuu poolus (DE421/SPICE) ja LunaNet TOML stsenaarium jäävad järgmisteks sammudeks.

# text
# c1: src/raim.rs
# c2: docs/ARAIM_REFERENCE.md
# c3: IntegritySupportMessage
# c4: .fault_priors()
# c5: .dual_fault_priors()
# c6: araim_raim
# c7: araim_dual_raim
# c8: stanford_svg
# c9: PL = error
# c10: docs/ARAIM_REFERENCE.md
# c11: araim_dual_raim
seg-5ef720855cc4 = <b>ARAIM terviklikkuse tugisõnum, Stanfordi diagrammi SVG ja avatud ARAIM etalon (<c1/>, <c2/>).</b> Lisab selgesõnalise <c3/> (σ_URA / σ_URE / b_nom / P_sat / P_const, WG-C GPS+Galileo etalonväärtustega ja teisendajatega <c4/> / <c5/> ühe tõrke mootorisse <c6/> ja kogu konstellatsiooni mootorisse <c7/>), iseseisva Stanfordi terviklikkuse diagrammi renderdaja <c8/> (neli tsooni, piir <c9/>, häirepiiri juhtjooned, üks värvikodeeritud marker epohhi kohta) ning <c10/>, mis dokumenteerib algoritmi, ISM-i, tõrkehüpoteesid, kaitsetaseme lepingu ja kahe konstellatsiooni kasu. Testid demonstreerivad geomeetria/liiasuse kasu (teise konstellatsiooni ühendamine pingutab ühe tõrke HPL-i) ja konstellatsioonitõrke taluvust (kahe konstellatsiooniga kasutaja elab üle terve konstellatsiooni kaotuse; ühe konstellatsiooniga kasutaja mitte). Aus jääk: EU ARAIM TN tabeli A-3 / { "15" }–{ "25" } % kättesaadavuse arvu arvuline taastootmine versioonilukustatud päris TLE hetktõmmise vastu, Zenodo testandmestiku kirje ning <c11/> ühendamine stsenaariumifaili käitajaga.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000b
# c3: iauNumat
# c4: teme_to_gcrs(r, v, jd_tt)
# c5: gcrs_to_teme
# c6: nut00b
# c7: eraNut00b
# c8: ROADMAP.md
seg-3607eb34acd9 = <b>IAU 2000B nutatsioon ja täielik TEME→GCRS/J2000 inertsiaalne taandamine (<c1/>).</b> Lisab tõelise inertsiaalraami taandamise teise ja kolmanda osa tarnitud IAU { "2006" } pretsessiooni peale: 77-liikmeline Kuu-Päikese MHB2000 nutatsioonirida (<c2/>, standardne IAU 2000B kärbe täpsusega ~{ "1" } mas) Delaunay põhiargumentide ja SOFA <c3/> nutatsioonimaatriksiga ning Vallado AIAA-2006-6980 ahel TEME→TOD (pööripäevade võrrand) → TOD→MOD (nutatsioon) → MOD→GCRS (nihe-pretsessioon), esitatud kui <c4/> / <c5/>. Rida, argumendid ja ühikukonstandid on ümber kirjutatud IAU SOFA / ERFA etalonist <c6/> ja valideeritud <b>bitt-bitilt</b> avaldatud <c7/> testvektori vastu (Δψ, Δε täpsusega { "1e-13" } rad). Aus jääk: täielik IAU 2000A 678-liikmeline rida (<{ "0.1" } mas), ANISE/SPICE <{ "10" } m numbriline ristkontroll ja poolusliikumine jäävad järgmisteks sammudeks (vt <c8/>).

# text
seg-d9b5e459f6eb = See väljalase toob Kshana esimese <b>mitteanalüütilise orbiidipropageerija</b> — Cowelli integraatori hierarhilise kuue häiringu jõumudeliga (kahe keha + J2–J6 tsonaalne + epohhijuhitud Päikese/Kuu kolmas keha + päikesekiirguse rõhk koonilise umbra/penumbra varjuga + atmosfääri takistus + Schwarzschildi post-Newtoni relativistlik parandus), mida juhib kahe adaptiivse integraatori valik (RK4 sammu kahekordistamine ja Dormand–Prince'i RK5({ "4" }) põimitud paar) — koos manöövri / trajektoori kavandamise kihiga (impulss- ja lõplikud põletused, Izzo Lamberti lahendaja ja porkchop-pühkimine), gravitatsioonikaardi sobitamise alt-PNT kihiga, mis taastab 60-minutilise GPS-ita raja alla { "500" } m täpsusega, partii + järjestikuse orbiidi määramise torujuhtmega ja täieliku 17-olekulise tihedalt seotud GNSS/INS UKF-iga kvant-CAI hinnangulise asukoha jälgimisega. Iga numbriline võimekus on seotud analüütilise tõe või käsitsi tuletatud suletud kujuga; vaikimisi väljalülitatud häiringud jätavad väljalastud golden-failid puutumata.

# text
# c1: forces::relativistic_accel
# c2: propagator::ForceModel::relativity
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: (r, v)
# c6: accel_rv
# c7: 3μ²/(c²r³)·r̂
# c8: ≈1.9·10⁻⁹
# c9: μ/(c²r)
# c10: μ(4μ + 3v²r)/(c²r³)
# c11: β
# c12: γ
seg-aa8d478f5c10 = <b>Post-Newtoni (Schwarzschildi) relativistlik parandus (<c1/> + <c2/>).</b> Lisab domineeriva üldrelatiivsusteoorilise häiringu Maa-lähedasel orbiidil — relativistliku perigeumi nihke peamise tekitaja — IERS / Montenbruck–Gilli kujul <c3/> <c4/>. Nagu atmosfääri takistus on see <b>kiirusest sõltuv</b>, nii et see sõidab integraatori <c5/> parempoolsel küljel funktsiooni [<c6/>] kaudu, valikuline ja vaikimisi väljas. Valideeritud iseseisvalt: ringorbiidil taandub see suletud kujule <c7/> (puhtalt radiaalne ja <b>väljapoole</b>, väljaspool telge olevad komponendid täpselt null); selle <b>suhe kahe keha omaga on õpikuline <c8/> LEO-l</b> (signatuur <c9/>); radiaalkiiruse juhtum langeb kokku käsitsi lihtsustatud kujuga <c10/>; ja propageerijas <b>häirib see orbiiti seda hajutamata</b> — suurpooltelg säilib selgelt alla meetri/päevas, mis on struktuurselt takistuse monotoonse lagunemise vastand. Kuna see on vaikimisi väljas, jäävad kahe keha/J2/tsonaalsed golden-failid puutumata. PPN-parameetri (<c11/>,<c12/>) häälestamine ja Lense–Thirringi raamiveo liige jäävad järgmisteks sammudeks.

# text
# c1: forces::conical_shadow
# c2: ν ∈ [0,1]
# c3: a = asin(R☉/d☉)
# c4: b = asin(Rₑ/|r|)
# c5: c
# c6: ν
# c7: c ≥ a+b
# c8: c ≤ b−a
# c9: c ≤ a−b
# c10: srp_accel
# c11: forces::SOLAR_RADIUS
# c12: ν = 1
# c13: ν = 0
# c14: ν
# c15: c = b
# c16: [b−a, b+a]
# c17: 0 < ν < 1
# c18: cylindrical_shadow
seg-043e831224ab = <b>Koonilise umbra+penumbra varjumudel (<c1/>), mida nüüd kasutab päikesekiirguse rõhk.</b> Täiendab kahendi umbrasilindri varjutust sujuvaks teguriks <c2/>: Päikest ja Maad modelleeritakse ketastena näiliste nurkraadiustega <c3/>, <c4/> ja näiva keskpunktide vahega <c5/>, ning <c6/> on üks miinus Päikese ketta osa, mille Maa ketas varjab (ringide läätsekujulise kattuvuse pindala) — täis päike korral <c7/>, täielik umbra korral <c8/>, rõngasvarjutus korral <c9/> ja vahepeal pidev penumbra. <c10/> kasutab seda nüüd, nii et SRP jõud väheneb varjutuse kaudu sujuvalt, mitte ei lülitu sisse/välja. Lisab IAU nominaalse <c11/>. Valideeritud iseseisvalt: <c12/> täis päikesel ja <c13/> sügaval umbras (täpne), <b>sujuv monotoonne penumbra</b> (<c14/> tõuseb { "0" } → ~½ juures <c15/> → { "1" } üle vahemiku <c16/>) ja koonuseline penumbra <b>ulatub umbrasilindrist kaugemale</b> (punkt, mida kahend-silinder nimetab täielikult valgustatuks, on koonusele <c17/>). Lihtsam <c18/> jääb kättesaadavaks; päikese serva tumenemine ja lapiku Maa vari jäävad järgmisteks sammudeks.

# text
# c1: integrator::dopri54_step
# c2: integrator::integrate_dopri
# c3: propagator::propagate_dopri
# c4: 0.9·(1/err)^(1/5)
# c5: propagator::propagate_dopri
# c6: y' = y
# c7: e
# c8: propagate_dopri
seg-8d1c16019f3c = <b>Dormand–Prince'i RK5({ "4" }) põimitud integraator (<c1/> / <c2/> + <c3/>).</b> Lisab standardse Dormand–Prince'i ({ "1980" }) põimitud Butcheri tabeli paari olemasoleva RK4 sammu kahekordistamise draiveri kõrvale: seitse FSAL etappi annavad 5. järku lahendi ja 4. järku veahinnangu ühest hindamiskomplektist ({ "7" } vs { "11" } funktsioonikutset sammu kohta), odavam lokaalse vea hinnang. Adaptiivne draiver taaskasutab sama RMS vea normi ja sammukontrollerit <c4/>, nii et see on otseasendaja; <c5/> avab selle orbiidi jõumudelil. Valideeritud iseseisvalt: põimitud veahinnang on <b>O(h⁵)</b> (sammu poolitamine vähendab seda ~{ "32" }×); DP5({ "4" }) integreerib <c6/> väärtuseni <c7/> ja harmoonilise ostsillaatori { "50" } perioodi jooksul energiat säilitades täpsusega <{ "1e-6" }; see jõuab samale lõpp-punktile samal tolerantsil <b>vähemate funktsioonihinnangutega</b> kui sammu kahekordistamine (täpsust ohverdamata); ning <c8/> läbib sama analüütilise tõe värava kui RK4 tee — <b>alammeetriline täpne universaalmuutuja Kepleri lahendi suhtes { "24" } h LEO orbiidil</b> — samal ajal kui kaks draiverit langevad kokku täpsusega <{ "1" } m J2..J6 orbiidil (suletud kuju puudub). Kõrgemad põimitud paarid (RKF7({ "8" }) / DOP853) jäävad järgmiseks sammuks.

# text
# c1: forces::atmospheric_density
# c2: forces::drag_accel
# c3: propagator::ForceModel::drag
# c4: ρ = ρ0·exp(−(h−h0)/H)
# c5: a = −½ · ρ(h) · (C_D·A/m) · |v_rel| · v_rel
# c6: v_rel = v − ωₑ ẑ × r
# c7: forces::EARTH_ROTATION_RATE = 7.2921151467e-5
# c8: ForceModel
# c9: accel_rv(t, r, v)
# c10: f(t,[r;v]) = [v; a(t,r,v)]
# c11: accel_at
# c12: C_D·A/m = 0.02 m²/kg
seg-cca3c00757d6 = <b>Atmosfääri takistus ühendatud propageerijasse tema esimese kiirusest sõltuva jõuna (<c1/> + <c2/> + <c3/>).</b> Lisab <b>Vallado tabeli 8-4 tükiti eksponentsiaalse</b> atmosfääri <c4/> ({ "28" } riba merepinnast üle { "1000" } km, pinna all piiratud) ja ruutkõlbulise takistuse <c5/> <b>kaaspöörleva atmosfääri</b> <c6/> suhtes (<c7/>). Kuna takistus sõltub kiirusest, saab <c8/> uue funktsiooni <c9/> ja integraatori parempool edastab nüüd kiiruse (<c10/>); ainult asendist sõltuv <c11/> on muutumatu, nii et konservatiivsed liikmed ja golden-failid on puutumata. Valideeritud iseseisvalt: tihedus <b>ankurdub merepinna väärtusel { "1.225" } kg/m³</b>, on pinna all piiratud, <b>väheneb monotoonselt</b> läbi LEO, asub { "400" } km juures päikese keskmises ~{ "1e-12" } kg/m³ vahemikus ning selle <b>taastatud kohalik skaalakõrgus (≈ { "58" } km juures { "400" } km)</b> on füüsikaline; takistus <b>vastandub kaaspöörleva suhtelise kiirusega</b> ~{ "2e-6" } m/s² LEO suurusjärgus väärtuse <c12/> korral; ja — võtmesignatuur — takistus on <b>hajutav</b>: { "300" } km orbiit kaotab erienergiat <b>monotoonselt</b> ja selle suurpooltelg <b>laguneb piiratult ~km/päevas</b>, samal ajal kui vaakumi lähtetase säilitab energia täpsusega <{ "1e-9" }. NRLMSISE-00 termosfääri tihedus (< { "5" } % takistustiheduse klausel) jääb järgmiseks sammuks.

# text
# c1: forces::srp_accel
# c2: propagator::ForceModel::solar_radiation
# c3: a = ν · P☉ · cᵣ · (A/m) · (AU/d)² · d̂
# c4: forces::cylindrical_shadow
# c5: P☉ = Φ☉/c
# c6: (AU/d)²
# c7: ephem
# c8: epoch_jd_tt + t/86400
# c9: with_zonals_j2_j6().third_body(true, true, epoch).solar_radiation(1.5, 0.02)
seg-0d20f02ef85f = <b>Päikesekiirguse rõhk ühendatud epohhijuhitult propageerija jõumudelisse (<c1/> + <c2/>).</b> Lisab <b>kahurikuuli SRP mudeli</b> <c3/> <b>silindrilise varju varjutusteguriga</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): kiirgusrõhk <c5/> kaasaegsest { "1361" } W/m² kogu päikesekiirguse vooluhulgast (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), pöördruut-voo <c6/> langus ja radiaalne tõuge <b>Päikesest eemale</b>. See sõidab <b>sama epohhijuhitud parempoolega</b> kui kolmas keha, võttes <c7/> Päikese ühe korra edasiliikunud epohhil <c8/>, mida jagavad Päikese kolmas keha ja SRP. Komponeeritav: <c9/>. Valideeritud iseseisvalt käsitsi tuletatud signatuuride vastu: <b>1-AU kiirgusrõhk fikseerub õpikulisele ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; täielikult valgustatud LEO satelliidi SRP on <b>bitt-bitilt identne</b> kahurikuuli valemiga, osutab <b>Päikesest eemale</b> ja asub <b>~{ "1.36" }·{ "10" }⁻⁷ m/s² vahemikus</b> cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg korral; <b>Päikese kauguse kahekordistamine neljandikustab suuruse</b> (pöördruut); <b>silindriline vari varjutab ainult umbrasilindrit</b> (Päikesest eemal <em>ja</em> ühe Maa raadiuse sees Maa–Päikese joonest) ja annab varjutuses <b>täpselt nulli</b> SRP; ning propageerijas <b>häirib SRP LEO orbiiti väikese piiratud määra võrra, mis skaleerub ~lineaarselt A/m-iga</b> — samal ajal kui häireteta mudel jääb bitt-bitilt ajast sõltumatuks, jättes kahe keha/J2/tsonaalsed golden-failid puutumata. Koonuseline umbra/penumbra (sujuv ν ∈ [{ "0,1" }]), atmosfääri takistus ning väline GMAT/Orekit ristvalideerimine jäävad järgmisteks sammudeks.

# text
# c1: propagator::ForceModel::third_body
# c2: accel_at
# c3: ephem
# c4: epoch_jd_tt + t/86400
# c5: precession::julian_centuries_tt
# c6: ForceModel::with_zonals_j2_j6().third_body(true, true, epoch)
# c7: third_body_accel
# c8: t = 0
# c9: t = 1 day
seg-d3f819c21660 = <b>Epohhijuhitud Päikese/Kuu kolmas keha ühendatud ajas muutuvasse propageerija parempoolde (<c1/> / <c2/>).</b> Kolmanda keha häiring ei ole enam eraldiseisev jõuliige — Cowelli propageerija integreerib seda nüüd tõeliselt <em>ajas muutuva</em> jõuna: iga parempoole hindamine võtab <c3/> Päikese/Kuu asendid <b>edasiliikunud epohhil <c4/></b> (taaskasutades <c5/> päeva↔sajandi teisenduseks), nii et häirijad liiguvad integreerimise ajal mööda oma orbiite, mitte ei ole algushetkel külmutatud. Komponeeritav mis tahes gravitatsioonimudeliga (<c6/>). Valideeritud iseseisvalt: parempoole Päikese liige on <b>bitt-bitilt identne</b> funktsiooniga <c7/>, mis on hinnatud efemeriidi asendil selle hetke jaoks nii <c8/> kui <c9/> korral (tõestades täpselt seose { "86400" } s ↔ { "1" } päev ↔ 1/36525 sajandit), häirija <b>liigub proovide vahel ~{ "2.6" }·10⁹ m/päevas</b> (ei ole külmutatud), <b>hetkelised LEO loodete suurused</b> tabavad õpikulisi ~{ "5" }·{ "10" }⁻⁷ m/s² (Päike) ja ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Kuu, ≈ { "2" }× Päike) vahemikke, iga keha <b>häirib mõõdetavalt päevapikkust trajektoori, jäädes piiratuks</b>, ja sama algolek, mis on propageeritud <b>veerandaasta kaugusel epohhidel, annab erineva trajektoori</b> (loodete telg pöörleb { "90" }°) — samal ajal kui mudel, kus kumbagi keha pole lubatud, on bitt-bitilt ajast sõltumatu, jättes kahe keha/J2/tsonaalsed golden-failid puutumata. DE-klassi efemeriidi täpsus ja väline GMAT/Orekit ristvalideerimine jäävad järgmisteks sammudeks.

# text
# c1: ephem::moon_position
# c2: §3.3.2
# c3: forces::third_body_accel
seg-0a517f6c4b1b = <b>Madala täpsusega Kuu efemeriid (<c1/>), mis täiendab Päikese/Kuu kolmanda keha paari.</b> Lisab Montenbruck & Gilli madala täpsusega Kuu rea (<c2/>) Päikese mudeli kõrvale, nii et kehast sõltumatut <c3/> saab nüüd juhtida kummagi taevakehaga <b>ilma välise DE/SPK kerneli vajaduseta</b>. Valideeritud iseseisvalt käsitsi tuletatud Kuu signatuuride vastu: geotsentriline kaugus jääb kuu jooksul päris <b>perigeumi/apogeumi ümbriku (~{ "356 500" }–{ "406 700" } km)</b> sisse ja selle <b>kuukeskmine taastab ~{ "384 400" } km suurpooltelje</b>; <b>ekliptikaline laius ei ületa kunagi ~{ "5.3" }° Kuu orbiidi kaldenurka</b> (kontrollitud projitseerimisega ekliptika poolusele ekvatoriaalkoordinaatides, valideerides laiusrea ja kaldenurga pöörde koos); Kuu <b>suund naaseb { "1" }° piires pärast ühte sideerilist kuud ({ "27.3217" } d)</b> ja selle <b>ööpäevane liikumine jääb füüsikalisse { "12" }–{ "15" }°/päevas vahemikku</b>; ning Kuu kolmanda keha häiring LEO satelliidile on <b>õpikulise ~{ "1.1" }·{ "10" }⁻⁶ m/s² suurusega</b> (≈ kaks korda Päikese oma). DE-klassi asenditäpsus, atmosfääri takistus ja SRP jäävad järgmisteks sammudeks.

# text
# c1: forces::third_body_accel
# c2: ephem::sun_position
# c3: a = GM₃·((s−r)/|s−r|³ − s/|s|³)
# c4: ephem
# c5: third_body_potential
seg-8b7025e00dd1 = <b>Kolmanda keha (Päikese) gravitatsioon sisseehitatud madala täpsusega efemeriidiga (<c1/>, <c2/>).</b> Lisab jõumudelisse kolmanda keha häiringu: <c3/> (otsene külgetõmme miinus kaudne liige, mille geotsentriline raam peab lahutama), kusjuures Päikese asendi annab uue mooduli <c4/> Montenbruck & Gilli madala täpsusega analüütiline rida — <b>välist DE/SPK kernelit pole vaja</b> madala täpsusega käituse jaoks. Valideeritud iseseisvalt: kiirendus <b>langeb kokku oma häiriva potentsiaali täpse gradiendiga</b> (<c5/>), häiring <b>kaob geotsentris</b> ja on <b>õpikulise ~{ "5" }·{ "10" }⁻⁷ m/s² suurusega LEO satelliidil</b> ning Päikese efemeriid tabab käsitsi tuletatud J2000 ankruid — <b>periheeli kaugus ≈ { "1.471" }·10¹¹ m</b>, <b>deklinatsioon ≈ −{ "23" }° detsembri pööripäeva lähedal</b>, näiv liikumine <b>≈ { "1" }°/päevas</b> (≈ { "90" }° veerandaasta kohta) ja kaugus, mis jääb terve aasta jooksul Maa orbiidi { "0.983" }–{ "1.017" } AU ümbrikusse. Annab numbrilise propageerija verstaposti jõumudeli sammu kolmanda keha poole (Kuu tuuakse ülaltoodud kaaskirjes); DE-klassi asenditäpsus, atmosfääri takistus ja SRP jäävad järgmisteks sammudeks.

# text
# c1: forces::zonal_accel
# c2: zonal_potential
# c3: J2..J6
# c4: ForceModel::with_zonals_j2_j6()
# c5: R(r) = −(μ/r)·Σ Jₙ(Re/r)ⁿPₙ(z/r)
# c6: j2_accel
# c7: [J2]
# c8: J3
# c9: J2
# c10: J4..J6
# c11: z → −z
seg-99fd6ae1ea09 = <b>J2–J6 tsonaalsete harmooniliste jõumudel (<c1/> / <c2/>).</b> Laiendab Cowelli propageerija jõumudelit J2-st kaugemale täieliku Maa tsonaalse väljani kuni astmeni { "6" } (standardne avaldatud EGM-96 mittenormaliseeritud <c3/>), ühendatud propageerijasse kui <c4/>. Kiirendus on tsonaalse häiriva potentsiaali <c5/> <b>täpne analüütiline gradient</b> (Legendre'i polünoomid ülespoole rekurrentsiga), valideeritud kolmel sõltumatul viisil: see <b>taandub 666 vektoriga valideeritud funktsiooniks <c6/> masintäpsusega</b>, kui piirdutakse <c7/>-ga; see <b>langeb kokku oma potentsiaali numbrilise gradiendiga</b> kogu J2..J6 välja ulatuses (konservatiivse välja kuldstandardi kontroll); ning paaritu <c8/> versus paaris <c9/>/<c10/> liikmed näitavad oma <b>iseloomulikku põhja–lõuna (anti)sümmeetriat</b> teisenduse <c11/> all — pirnikujuline asümmeetria. Propageeritud J2..J6 orbiit säilitab koguenergia (kineetiline + tsentraalne + tsonaalne potentsiaal) täpsusega ~{ "1e-8" } päeva jooksul ja häirib ainult J2 orbiiti väikese nullist erineva määra võrra. See annab numbrilise propageerija verstaposti sammu 2 („J2–J6 tsonaalsed harmoonilised“); kõrge astme EGM tesseraalne väli, takistus, SRP, kolmas keha ja väline GMAT/Orekit ristvalideerimine jäävad järgmisteks sammudeks.

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: f(t,[r;v]) = [v; a(r)]
# c5: ForceModel
# c6: j2_secular_rates
# c7: solve_kepler_checked
# c8: Err
# c9: e = 0.999
seg-59f0ba5a6269 = <b>Numbriline (Cowelli) orbiidipropageerija (<c1/>).</b> Kshana esimene <b>mitteanalüütiline</b> propageerija (ülejäänud orbiidipakk on analüütiline SGP4/SDP4): see ühendab kahe keha + J2 jõumudeli (<c2/>) adaptiivse sammu kahekordistamise RK4 draiveriga (<c3/>) kui <c4/>, lülitiga <c5/>. Valideeritud <b>analüütilise tõe vastu, mis on tugevam kui numbriline ristitööriist oleks</b>: häirimata orbiit taastoodab <b>täpse universaalmuutuja Kepleri lahendi alammeetri täpsusega 24-tunnisel LEO orbiidil</b> (rangem värav kui verstaposti sõnastatud „võrdluses numbrilise etaloniga < { "10" } m“), erienergia ja nurkimpulss säilivad ~{ "1e-9" } suhtelise täpsusega ning J2 sõlme regressioon taastoodab suletud kuju <c6/> esimese järgu teooriani ({ "2" } % piires, O(J2²) jääk). Lisab ka funktsiooni <c7/>, Newtoni lahendaja Kepleri võrrandile, mis <b>tagastab <c8/> vaikselt valesti vastamise asemel</b>, kui see ei koondu piiratud iteratsioonieelarve jooksul (periapsise-lähedane <c9/> juhtum). Aus ulatus: jõumudel on ainult kahe keha + J2 — kõrge astme EGM tesseraalne väli ({ "200" }×{ "200" } + laadija), takistus (NRLMSISE-00), SRP, kolmanda keha jõud ja väline GMAT/Orekit ristvalideerimine jäävad järgmisteks sammudeks.

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
# c3: docs/CAPABILITY.md
seg-d4c7c29f09d1 = <b>60-minutiline GPS-ita gravitatsioonikaardi sobitamine täpsusega < { "500" } m (<c1/>).</b> Süvendab alt-PNT kihti ESA NAVISP <em>Quantum Wayfarer</em> valideerimissihtmärgini: sõiduk lendab ~{ "700" } km rada terve tunni GNSS-i katkestuse jooksul — selle inertsiaallahend triivib <b>≈ { "70" } km</b> peale — ning külmaatom-gravimeeter pluss <b>hierarhiline jämedalt-täpseni</b> osakeste/ruudustiku sobitaja taastab konstantse INS-i triivi <b>≈ { "145" } m</b> täpsusega (< { "500" } m), > { "480" }× vähendus. Gravimeetri tegelik valgemüra põhi süstitakse <b>deterministliku algväärtusega (seed)</b> jadana, nii et sobitajale ei anta kunagi müravaba tõde, ent käitus on täpselt reprodutseeritav (kontrollitud bitt-bitilt identne ning stabiilne mõne meetri piires müra realisatsioonide vahel). Regressioonitaseme test näitab, et täpsustamine on <em>vajalik</em> — üksik jäme ruudustik jääb pidama ~{ "2" } km juures, ainult kolmeastmeline täpsustamine murrab { "500" } m tõkke. Uus commit'itud stsenaarium <c2/>. Rida <c3/> jääb ausalt <b>osaliseks</b> (kaasasolevat EGM2008 kaarti endiselt pole), tema tõendid on uuendatud 60-min < { "500" } m tulemuseni. Aus ulatus on muutumatu: madala astme sfääriliste harmooniliste väli + sünteetilised mascon'id; Monte Carlo kaardi esitusvea realisatsioonide üle on järgmine samm.

# text
# c1: docs/CLAIMS-VS-REALITY.md
# c2: tests/no_overclaims.rs
# c3: OC-0
# c4: OC-13
# c5: OC-0
# c6: OC-2
# c7: OC-7
# c8: OC-8
# c9: README
# c10: CAPABILITY
# c11: GLOSSARY
# c12: web/
seg-4262a99328bb = <b>Ülehinnangute register + regressioonikaitse (<c1/>, <c2/>).</b> Sulgeb aususe/väidete tagasivõtmise raja: neliteist ülehinnangut, mille varasem audit kataloogis (<c3/>…<c4/>), on nüüd kõik GREEN — tugevad väited (<c5/> seotud kell+asend Kalman, <c6/> segamise J/S→C/N₀→lukustuse kadu, <c7/> Mach–Zehnderi CAI füüsika, <c8/> ARAIM HPL/VPL) on <b>asendatud tarnitud, testitud võimekustega</b>, mitte pehmendatud sõnastusega, ning ülejäänud read on koodiga sobitamiseks väidetest tagasi võetud. Uus CI test skannib elavaid avalikke pindu (<c9/>, <c10/>, <c11/>, <c12/>) ja ebaõnnestub, kui mõni taganenud paljas ülehinnangufraas ilmub uuesti hoiatuseta, nii et GREEN rida ei saa vaikselt regresseeruda. Käitusekohane „terviklikkuse“ kvaliteedinäitaja jääb ausalt märgitud <em>filtri enesekooskõlaks</em> (mitte lennunduse terviklikkuseks); päris ARAIM HPL/VPL on esitatud eraldi, nii et neid ei aeta kunagi segamini.

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: P̄₁₁=√3·cosφ
# c4: P̄₂₀=(√5/2)(3sin²φ−1)
# c5: P̄₂₂=(√15/2)cos²φ
# c6: mapmatch
# c7: particle_filter
# c8: scenarios/gravity-map-nav.toml
# c9: kind=
# c10: docs/CAPABILITY.md
seg-27da62a7ff63 = <b>Gravitatsioonikaardi sobitamise navigatsioon (GPS-ita alt-PNT).</b> Uus <c1/> lisab alt-PNT võimekuse kihi, mida ESA NAVISP <em>Quantum Wayfarer</em> / QT-CCI gravitatsioonikaardi sobitamise uuringud nõuavad: külmaatom-<b>gravimeetri mõõtmismudel</b>, mille valgemüra põhi on tuletatud CAI kiirendusmõõturi ASD-st (<c2/>); madala astme, täielikult normaliseeritud <b>sfääriliste harmooniliste gravitatsiooni anomaalia väli</b> (valideeritud suletud kujuga Legendre'i funktsioonide <c3/>, <c4/>, <c5/> ja käsitsi tuletatud ühe liikmega anomaalia { "1.897" } mGal vastu) pluss sünteetilised <b>mascon'id</b> kõrge astme kohalike tunnuste jaoks; ning <b>gravitatsioonikaardi sobitamise osakestefilter</b> (komponeerib <c6/> + <c7/>), mis taastab GPS-ita raja läbilennatud anomaaliate jadast. Commit'itud NAVISP etalonkatse (<c8/>) vähendab ~{ "73" } km vaba inertsiaalse triivi mõne kilomeetrini. Aus ulatus: Kshana <b>ei</b> paku kaasa täielikku EGM2008 { "2190" }° koefitsientide komplekti — väli on madala astme + mascon'id, mitte päris kõrge eraldusvõimega kaart; EGM/EIGEN laadija, magnetkaart, maastikuabiga SLAM ja stsenaariumimootori <c9/> ühendus SVG triivijoonisega jäävad järgmisteks sammudeks. <c10/> „Gravity-map / alt-PNT navigation“ → <b>osaline</b>.

# text
# c1: src/maneuver.rs
# c2: r1
# c3: r2
# c4: v1
# c5: v2
# c6: r2
seg-d028a2db7837 = <b>Manöövrite modelleerimise ja trajektoori kavandamise sillapea.</b> Uus <c1/> lisab esimese trajektoori kavandamise kihi SGP4 kohal: impulss-ΔV sõlmed, mis rakendavad kiiruse katkevust ja kannavad edasi { "6" }×{ "6" } kovariatsiooni (deterministlik põletus ⇒ ühikmaatriksist olekuüleminek; täitmisvea kovariatsioon pöördub põletusraamist — ECI või LVLH — kiirusplokki), lõpliku põletuse integreerimise (konstantne tõuge põletuskaarel massiga olekuna), mille saavutatud ΔV on kontrollitud suletud kujuga <b>Tsiolkovski</b> raketivõrrandi vastu paremini kui { "0.01" } %, <b>Izzo-2015</b> ühe tiirlusega <b>Lamberti</b> lahendaja (<c2/>, <c3/>, lennuaeg ⇒ <c4/>, <c5/>), täpse universaalmuutuja <b>Kepleri propageerija</b> (kahe keha tõde) ja <b>porkchop</b> pühkimise, mis kujutab stardiepohhi × saabumisepohhi ruudustiku starti C3 ja saabumise V∞ peale, väljastatuna 2-D JSON-massiivina brauseri isojoonte renderdamiseks. Valideerimine on iseseisev ja tugevam kui õpetuslik väljavõte: iga Lamberti väljund käib läbi Kepleri propageerija edasi-tagasi (see peab maanduma tagasi punkti <c6/>) ja porkchopi miinimum kontrollitakse analüütilise Hohmanni ülekande C3 põhja vastu kahe tasapinnalise ringorbiidi jaoks. Kshana positsioneerib selle tulemuslikkuse simulatsiooni kihina GMAT/Orekit kohal, mitte asendajana (mitme tiirlusega harud ja päris planeetide efemeriid jäävad ulatusest välja). Kümme testi.

# text
# c1: src/fusion/tightly_coupled17.rs
# c2: [position, velocity, attitude-error, accelerometer bias, gyro bias, clock bias, clock drift]
# c3: C ≈ I + [ψ×]
# c4: q_va
# c5: crate::inertial::quantum_imu
seg-cbdd0e56d89f = <b>Täielik 17-olekuline tihedalt seotud GNSS/INS UKF kvant-CAI hinnangulise asukoha jälgimisega.</b> Uus <c1/> kannab täielikku inertsiaalnavigatsiooni olekut, mida tihedalt seotud filter hindab — <c2/> ({ "17" } olekut) — propageeritud mõõdetud erijõu ja nurkkiirusega juhitud strapdown-mehhaniseerimise kaudu, väikese nurga <c3/> keha→inertsiaal pöördega, nii et orientatsiooni viga põhjustab horisontaalset kiirendust (standardne INS-i kalde sidestus). GNSS-i katkestuse ajal veereb see ainult IMU peal; kiiruse juhusliku käigu protsessimüra on külmaatom-interferomeetri kiirendusmõõturi tuletatud <c4/> (<c5/>), nii et hinnangulise asukoha triiv on kvantanduriga piiratud — 120-sekundiline katkestus jääb piiratuks mõne sajani meetrini, versus kilomeetrid, milleni jõuaks navigatsioonikvaliteediga vaba INS. Pseudovahemaa/kauguse muutumise kiiruse uuendus käib läbi ühise unscented Kalmani filtri (α = { "1" } hästi tingimustatud kaaludeks sellel olekusuurusel). Viis testi: mõõtmismudeli samasus, ideaalse IMU konstantkiirusega integreerimine, GNSS-i abistamine, kiirendusmõõturi nihke hindamine ja CAI-ga piiratud 120-s katkestuse etalonkatse.

# text
# c1: CITATION.cff
# c2: ROADMAP.md
seg-087521bb32b7 = <b>Aus raamistus kvantpositsioneerimisele.</b> Põhikirjeldus on nüüd järjepidevalt <b>„PNT-resilience simulator with quantum-sensor performance models“</b> README sloganis, tsiteerimisreas, failis <c1/> (pealkiri + kokkuvõte) ja bännerigraafikas — asendades lõdvema „hybrid quantum/classical PNT simulator“ turundusformulatsiooni. README jaotis <em>What it is / is not</em> saab selgesõnalise <b>„It is not (yet)“</b> ulatuse väite (mitte esimestest printsiipidest aatom-interferomeetria füüsikamootor, mitte GNSS vastuvõtja/PVT lahendaja, mitte missioonikavandamise tööriist) ning uus tipptaseme <c2/> teeb <b>kvantfüüsika kihist P2 kirje</b> (Mach–Zehnderi CAI faas, projektsioonimüra, vibratsioonitensor), et lugejad teaksid, et esimeste printsiipide füüsika on ulatusse võetud ja tulemas, mitte hüljatud. Käitumise ega API muudatust pole.

# text
seg-f8fa36190ec7 = Konstellatsioonikavandi kompromissiuuring: Walkeri kavandi pühkimine Pareto frondiga, taaskülastusaja JSON ja alamkilomeetriline Walkeri valemi valideerimine.

# text
# c1: src/walker.rs
# c2: walker_design_sweep
# c3: planes × sats_per_plane
# c4: pareto_front
# c5: WalkerDesignReport::to_json
# c6: i:T/P/F
# c7: R_z(2π/P)
# c8: 2π/S
# c9: gps-ops
# c10: scenarios/orbit-sgp4-gps.toml
seg-31518e92d8cf = <c1/> saab funktsiooni <c2/>, mis käitab ruudustikku <c3/> (nt { "3" }×{ "3" } kompromiss) fikseeritud kaldenurgal ja tabuleerib iga kavandi kohta katvuse osa, halvima juhu PDOP-i ning maksimaalse/keskmise taaskülastuse vahe; <c4/> märgib mittedomineeritud kavandid (vähem satelliite, rohkem katvust, madalam PDOP, lühem taaskülastus) ning <c5/> serialiseerib rakud ja Pareto fronti — sh taaskülastusaja väljad — JSON-ina. Uus valideerimine seob generaatori Walkeri valemiga <c6/>: samas pesas olevad satelliidid naaberorbiiditasandites kujutuvad üksteisele täpse pöördega <c7/> täpsusega <b>alla { "1" } km terve { "24" } h</b> SGP4 propageerimise jooksul (J2 lühiperioodiline hingamine on ühisrežiim ja tühistub), ning orbiiditasandisisesed pesad on kinnitatud keskmiselt vahega <c8/>. Toetub commit'itud päris Celestraki <c9/> 2021-07-28 hetktõmmisele (<c10/>, mida kasutavad stsenaariumikatvuse ja SP3 edasi-tagasi testid).

# text
# c1: src/timetransfer_adv.rs
# c2: twstft_sagnac
# c3: Δt = 2·A·ω_E/c²
# c4: twstft_sagnac_bipm
# c5: run_twstft
# c6: T_A − T_B
# c7: gnss_common_view_series
# c8: iono_free_combination
# c9: ppp_receiver_clock
# c10: rytov_variance
# c11: fried_parameter
# c12: lognormal_fading
# c13: fit_power_law_psd
# c14: h_α
# c15: ensemble_timescale
seg-71d257587c28 = <b>Täiustatud aja ja sageduse edastamine: TWSTFT, GNSS ühisvaade, PPP, optiline, IEEE-1139 astmeseaduse sobitus ja kellaansambel.</b> Uus <c1/> ehitab operatiivsed edastusmeetodid tarnitud Sagnaci/ühisvaate suletud kujude ja Alani stabiilsuse tööriistade peale. <c2/> annab kahesuunalise satelliitaja ja -sageduse edastamise Sagnaci parandi kolmehüppelise silmussummana, mis võrdub BIPM suletud kujuga <c3/> täpselt (ristkontrollitud sõltumatu <c4/> vastu); <c5/> väljastab ühepäevase <c6/> rea ja selle TDEV. <c7/> võtab kahe sünteetilise maajaama ühe vahe, nii et satelliidi kell tühistub. <c8/> + <c9/> on PPP ionosfäärivaba kombinatsioon ja vastuvõtja kella lahendus SP3-klassi (sünteetilise) tõe vastu, tühistades esimese järgu ionosfääri täpselt. <c10/>, <c11/> ja ühikkeskmisega <c12/> modelleerivad vaba ruumi optilise lingi turbulentsist tingitud sillerdust. <c13/> on Alani dispersioonikõvera täielik IEEE-1139 viie koefitsiendi <c14/> vähimruutude sobitus (kõik viis kanoonilist müraprotsessi korraga), domineeriva protsessiga, mis on esitatud τ-dekaadi kohta. <c15/> moodustab pöördvariatsiooniga kaalutud paberist ajaskaala, mille Alani hälve langeb rangelt alla parima panustava kella. { "31" } ühiktesti; valideerimise sihtmärgid on suletud kujud ja sünteetiline tõde — päris BIPM Circular-T / IGS SP3 sisend on veel tegemata.

# text
seg-c3ab93e7324f = IONEX ionosfäärikaardid: failiparser, ajainterpolatsioon ja kaldkiire kaldetegur.

# text
# c1: src/ionex.rs
# c2: parse_ionex
# c3: START/END OF TEC MAP
# c4: IonexMap
# c5: TecGrid
# c6: 10^EXPONENT
# c7: interpolate_tec_in_time
# c8: obliquity_factor
# c9: slant_tec
# c10: M(z) = 1/cos z′
# c11: sin z′ = (Rₑ/(Rₑ+H))·sin z
seg-7b94a515ce2b = <c1/> saab funktsiooni <c2/>, mis loeb IONEX failivormingu (päise ruudustikumääratlus + <c3/> plokid) jadaks <c4/> — normaliseerides faili põhjast lõunasse laiuskraadide järjekorra positiivse sammuga <c5/> ja skaleerides väärtused teguriga <c6/>. <c7/> segab kaks järjestikust kaarti päringu epohhile ning <c8/> / <c9/> kujutavad vertikaalse TEC-i kaldkiirele ühekihilise õhukese kesta teguri <c10/> kaudu (<c11/>). Koos tarnitud ruudustikumudeliga muudavad need mõõdetud IGS globaalse ionosfäärikaardi kasutatavaks kaldviivituseks.

# text
seg-2ed90763cf11 = Konstellatsioonikavand: katvusribade (streets-of-coverage) mõõtmine + mitme konstellatsiooni võrdlus.

# text
# c1: src/walker.rs
# c2: min_satellites_streets_of_coverage
# c3: λ
# c4: c
# c5: p = ⌈π/(2c)⌉
# c6: None
# c7: compare_constellations
# c8: pdop_sweep
seg-326e8957bb10 = <c1/> saab funktsiooni <c2/>, idealiseeritud katvusribade minimaalse satelliidiarvu lahendaja — tarnitud katvuse poolnurgast <c3/> ja ribapoollaiusest <c4/> mõõdab see lähipolaarse konstellatsiooni pidevaks üksikuks globaalseks katvuseks kui <c5/> tasandit (nt GPS-i kõrgusel 4 satelliidiga tasand vajab { "2" } tasandit, { "8" } satelliiti) ning teatab <c6/>, kui satelliidid on pideva riba moodustamiseks liiga hõredad. <c7/> on mitme konstellatsiooni võrdlusvahend: see hindab iga nimetatud Walkeri kavandit samal jaamal/aknal funktsiooniga <c8/> ja tagastab nende katvuse / PDOP-i / suuruse kõrvuti. Aus ulatus: õmblustäpne Rideri parandus vastupidiselt pöörlevate tasandite piiril ja 3-D katvusgloobus jäävad järgmisteks sammudeks.

# text
seg-90f5ec9ff4ae = Mitmekihiline spuufimise tuvastus: RAIM-kooskõla pariteedidetektor + kihtide liitmine.

# text
# c1: src/spoof_monitors.rs
# c2: parity_raim_test
# c3: (m−4)
# c4: fuse_spoof_layers
seg-a0e4878bea45 = <c1/> saab kolmanda ja viimase tuvastuskihi ning liitmisetapi: <c2/> sobitab asendi/kella lahendi vähimruutudega üleliigsele pseudovahemaade komplektile ja testib allesjäänud kaalutud jääkruutude summat selle χ²<c3/> läve vastu — märkides satelliitide nihutatud <em>alamhulga</em>, jättes samal ajal <em>ühisrežiimi</em> nihke (mille vastuvõtja kell neelab) õigesti RAIM-ile nähtamatuks, mitte seda üle katmata. <c4/> kombineerib pariteedi, AGC ja SQM kihid üheks kaalutud otsuseks, mis kirjutab üles, millised kihid aktiveerusid. Monte Carlo iseloomustab detektorit: empiiriline <b>P_fa ≈ { "0.068" }</b> vs { "0.05" } kavandipunkt, <b>tuvastamata jäänud sündmus langeb väärtuselt { "0.885" } 2σ spuufimisnihke korral väärtusele { "0.16" } 8σ korral</b>. Aus ulatus: ristvalideerimine konkreetsete avaldatud (Spirent / ION GNSS+) spuufimise testvektoritega vajab neid väliseid andmestikke ja jääb järgmiseks sammuks.

# text
# c1: src/fusion/coupled.rs
# c2: CoupledPntFilter
seg-2413b3d10f5b = <b>Seotud-vs-lahutatud Kalmani valideerimisansambel.</b> 100-katseline Monte Carlo failis <c1/> kvantifitseerib asendi↔kella ristkovariatsiooni kandmise väärtust: truu sisseehitatud lahutatud lähtetase (valideeritud bitt-bitilt tarnitud <c2/> vastu) töötleb samu andmeid nullitud ristplokkidega ning pärast peaaegu degenereerunud pseudovahemaid pluss ainult kella lahendust taastab seotud filter asendi <b>{ "2.97" } m RMS täpsusega vs lahutatud filtri { "48.8" } m, võites { "97" } katsest { "100" }-st</b> — kella lahend teravdab asendit ainult korrelatsiooni kaudu, mille lahutatud pakk kõrvale heidab. See lõpetab Kalmani õigsuse valideerimiskomplekti (Joseph'i vorm, PSD ohutus, NEES/NIS kooskõla ja nüüd seotud filtri ansambel).

# text
# c1: src/orbit_determination.rs
# c2: [r, v]
# c3: src/forces.rs
# c4: src/integrator.rs
# c5: src/batch_ls.rs
# c6: determine_orbit_batch
# c7: determine_orbit_sequential
seg-804f35695553 = <b>Orbiidi määramise torujuhe (partii + järjestikune).</b> Uus <c1/> taastab satelliidi orbitaalse oleku <c2/> maajaama kaugusjälgimisest, komponeerides kolm tarnitud osa: kahe keha + J2 jõumudel (<c3/>) ja RK4 integraator (<c4/>) propageerivad kandidaatoleku üle kaare, kaugusmõõtmise mudel ennustab iga jaama kauguse ning Gauss–Newtoni partiiparandaja (<c5/>) juhib kandidaadi parima sobituse olekule (<c6/>). Samad dünaamika ja kaugusmudel juhivad ka <b>järjestikust</b> rekursiivset määramist tarnitud unscented filtril (<c7/>). Seda valideerib neli testi: kauguse ennustus üle kaare; <b>partii taastamine alammeetri / mm·s⁻¹ täpsusega müravabadest kaugustest</b>; partii taastamine <b>~{ "2" } m täpsusega, järelsobituse jäägiga { "5" } m müra põhjal</b> (kooskõlalise vähimruutude sobituse signatuur); ja järjestikune taastamine kümnete meetrite piires. Aus ulatus: kauguse muutumise kiiruse/Doppleri ja nurkmõõtmised, analüütiline J2 olekuüleminekumaatriks ja jaama nähtavusmaskeerimine on järgmised sammud.

# text
# c1: src/fusion/tightly_coupled.rs
# c2: src/fusion/ukf.rs
# c3: [px,py,pz,vx,vy,vz,b,d]
# c4: pseudorange
# c5: ρ = |p − sᵢ| + b
# c6: range_rate
# c7: ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d
# c8: TightlyCoupled
# c9: propagate
# c10: propagate_orbital
# c11: update_gnss
# c12: src/forces.rs
# c13: src/integrator.rs
# c14: propagate_orbital
seg-0a81039e510c = <b>Tihedalt seotud GNSS/INS UKF navigaator.</b> Uus <c1/> ühendab tarnitud unscented Kalmani tuuma (<c2/>) töötavaks tihedalt seotud navigaatoriks kaheksaolekulisel <c3/> (ECEF asend/kiirus pluss vastuvõtja kella nihe ja triiv kaugusühikutes). See võtab sisse <b>toorsatelliidimõõtmised</b> — <c4/> (<c5/>) ja <c6/>/Doppler (<c7/>) — mitte eelnevalt moodustatud asendilahendit, nii et <c8/> (funktsioonidega <c9/>/<c10/>/ <c11/>) jätkab parandamist <b>alla nelja satelliidiga</b> ja veereb GNSS-i katkestustest läbi oma propageeritud dünaamikal. Viis testi valideerivad seda otsast lõpuni, sh verstaposti vastuvõtustsenaariumid: pseudovahemaa/Doppleri geomeetria käsitsi väärtuste vastu; müravaba koondumine <b>alammeetrini</b> viiel satelliidil; <b>kolme satelliidi</b> juhtum, mis koondub ~{ "212" } m-lt ~{ "13" } m-ni, kus hetktõmmise PVT-d ei saa isegi moodustada; konstantse kiirusega <b>120-sekundiline katkestus</b> { "50" } m piires; ja — põhiline vastuvõtt — <b>30-minutiline kõverduv LEO ülelend</b> (päris kahe keha + J2 orbiit) <b>120-sekundilise GNSS-i katkestusega</b>, hoitud <b>{ "0.77" } m ülelennu RMS</b> ja <b>{ "2.9" } m halvima juhuna katkestuse jooksul</b>. See orbitaalne väljajooks komponeerib tarnitud gravitatsiooni jõumudeli (<c12/>) ja RK4 integraatori (<c13/>) UKF protsessimudeliks (<c14/>), nii et filter järgib orbiidi kõverust — mida konstantse kiirusega väljajooks ei suuda (ainuüksi kõverus on LEO-l ~{ "58" } km { "120" } s jooksul). Aus ulatus: orbitaalne väljajooks kasutab kahe keha + J2 jõumudelit, mitte toor-IMU erijõudu (jõuta orbitaalplatvormil need langevad kokku); strapdown-IMU veaoleku ja tsüklisisese iono/tropo parandite sissepõimimine on järgmised sammud.

# text
# c1: src/mapmatch.rs
# c2: src/particle_filter.rs
# c3: field_likelihood
# c4: map_match_likelihood
# c5: Fn(lat, lon) -> value
# c6: src/ionex.rs
# c7: e^(−½)
seg-792f25a4a1da = <b>Kaardisobituse mõõtmismudel (maastiku-/gravitatsioonipõhine navigatsioon).</b> Uus <c1/> annab mõõtmismudeli, mis muudab tarnitud järjestikuse tähtsusvalimi osakestefiltri (<c2/>) töötavaks GPS-ita navigaatoriks: <c3/> (Gaussi välja sobitamise tõepära) ja <c4/>, mis valimit mis tahes georefereeritud etalonvälja — maastiku kõrgus (TRN) või gravitatsiooni anomaalia — osakese asendis ja kaalub seda kokkulangevusega sõiduki mõõdetud väärtusega. Väli on mis tahes <c5/> valimivõtja, nii et see komponeerub ruudustiku bilineaarse interpolaatoriga failis <c6/> või sulundiga. Kaks testi ankurdavad seda — tõepära tipp (={ "1" }) täpsel sobitusel langeb väärtuseni <c7/> ühe sigma juures ning osakestefilter eristuval sünteetilisel maastikulaigul taastab tõelise asendi { "0.1" } piires. Aus ulatus: päris etalonkaardid (SRTM kõrgus, EGM/EIGEN gravitatsiooni anomaalia) ja nende laadijad on järgmised sammud.

# text
# c1: src/lunar.rs
# c2: σ_URE ≈ 30 m
# c3: P_sat ≈ 1e-4
# c4: lunar_araim
# c5: σ_URE
seg-9240e95a5058 = <b>Tsislunaarne PNT terviklikkus (Kuu ARAIM).</b> Uus <c1/> rakendab Maa poole MHSS ARAIM mootorit LunaNet-laadsele Kuu navigatsiooniteenusele Kuu parameetritega (<c2/> vs GPS { "0.6" } m, <c3/>): Kuu konstandid, selenotsentriline Ida/Põhja/Üles baas ja taevageomeetria abifunktsioon ning <c4/> (HPL/VPL). Kolm testi ankurdavad seda — ortonormaalne selenotsentriline baas, kaldkauguse geomeetria ja täpne lineaarne kaitsetaseme skaleerumine <c5/> järgi (Kuu { "30" } m annab { "50" }× suurema kaitsetaseme kui sama geomeetria GPS { "0.6" } m juures — kvantitatiivne põhjus, miks Kuu PNT terviklikkus on raske). Aus ulatus: täpne LANS NRHO efemeriid, signaal-ruumis veaeelarve ja MCI↔MCMF raami taandamine on järgmised sammud.

# text
# c1: src/jd2.rs
# c2: Jd2
# c3: day
# c4: frac
# c5: [0,1)
# c6: new
# c7: from_parts
# c8: add_seconds
# c9: diff_seconds
# c10: total
# c11: f64
# c12: f64
# c13: f64
seg-4a43e2ff83d7 = <b>Kaheosalised (kõrge täpsusega) Juliuse kuupäevad.</b> Uus <c1/> lisab <c2/>, täisarvuliseks <c3/> ja murdosaks <c4/> vahemikus <c5/> jagatud Juliuse kuupäeva (SOFA/hifitime konventsioon), funktsioonidega <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Lähedaste epohhide vahed jäävad täpseks <c11/> põhjani, kus üksik-<c12/> JD kaotab J2000 lähedal ~{ "50" } µs. Neli testi ankurdavad seda: edasi-tagasi teisendus, murdosa normaliseerimine, täpne mikrosekundi taastamine (kõrval demonstreeritud üksik-<c13/> tõrge) ning liiteline/pööratav sekundiaritmeetika.

# text
# c1: src/omm.rs
# c2: oem
# c3: OmmFile::from_tle
# c4: BSTAR
# c5: to_omm_kvn
# c6: ndm/omm
seg-8eef92a85711 = <b>CCSDS OMM (Orbit Mean-Elements Message) kirjutaja.</b> Uus <c1/> täiendab efemeriidikirjutajat <c2/> keskmiste elementide sõnumiga: <c3/> kujutab SGP4/TLE keskmised elemendid OMM ühikutesse (keskmine liikumine tiirlustes päevas, nurgad kraadides, pluss <c4/>) ja <c5/> serialiseerib standardiloomise CCSDS 502.0-B-2 KVN vormi — nii et Kshana orbiiti saab tarbida iga OMM-i tundev tööriist, mitte kohandatud TLE-na. Kaks testi ankurdavad TLE→OMM ühikuteisendust (≈ { "15.5" } tiirlust/päevas, { "51.6" }° kaldenurk jne) ja nõutud KVN märksõnade olemasolu. Aus ulatus: KVN vorm ja TLE vastendus tarnitakse siin; XML (<c6/>) renderdus ja etalonparseriga edasi-tagasi teisendus on järgmised sammud.

# text
# c1: src/particle_filter.rs
# c2: predict
# c3: update
# c4: resample
# c5: effective_sample_size
# c6: ionex
seg-ca2b730b5cc3 = <b>Järjestikuse tähtsusvalimi osakestefilter.</b> Uus <c1/> lisab mittelineaarse, mitte-Gaussi hindaja kaardiabiga GPS-ita navigatsiooni taga (maastikupõhine või gravitatsioonikaardi sobitamine): <c2/> (propageeri osakesed läbi dünaamika + Gaussi protsessimüra), <c3/> (kaalu uuesti osakese kohase mõõtmise tõepäraga), süstemaatiline <c4/>, degeneratsiooni seire <c5/> ja kaalutud keskmine hinnang. Kuus testi ankurdavad deterministlikku tuuma täpselt — ESS ulatub { "1" }…N, süstemaatiline uuesti valimine valib indeksid kaaluga võrdelises vahekorras, kaalutud keskmise kumer kombinatsioon, Gaussi tõepära tõmbab hinnangu mõõtmisele, uuesti valimine ühtlaseks käitumine ja algväärtusega (seed) predict-determinism. Aus ulatus: mootor tarnitakse siin; etalonkaardid (SRTM kõrgus, EGM gravitatsiooni anomaalia) ja kaardi mõõtmismudel on järgmised sammud (ruudustiku+bilineaarne valimivõtja <c6/> teeniks gravitatsiooni/maastiku kaarti võrdselt).

# text
# c1: src/ionex.rs
# c2: TecGrid
# c3: vtec_at
# c4: Δ = 40.3·TEC/f²
# c5: vtec_to_delay_m
# c6: delay_at
# c7: 1 TECU ≈ 0.162 m
# c8: 1/f²
seg-564ad319685e = <b>IONEX-laadsed TEC ionosfäärikaardid.</b> Uus <c1/> lisab mõõdetud ionosfääri alternatiivi edastatavale Klobucharri mudelile: <c2/> (vertikaalse TEC-i korrapärane laius-/pikkuskraadi ruudustik, IGS globaalne ionosfäärikaart) bilineaarse interpolatsiooniga läbitungimispunktis (<c3/>, väljaspool ruudustikku piiratud) ja esimese järgu viivitusega <c4/> (<c5/>, <c6/>). Neli testi ankurdavad seda: <c7/> L1 juures skaleerimisega <c8/>, sõlmetäpne interpolatsioon, bilineaarsed keskpunktid, mis keskmistavad nurgad, ning serva järgi piiratud ruudustikuvälised päringud. Aus ulatus: ruudustik ja interpolatsioon tarnitakse siin; IONEX failivormingu parsimine, ajainterpolatsioon kaartide vahel ja kaldkiire kujutusfunktsioon on järgmised sammud.

# text
# c1: src/timegeo.rs
# c2: timetransfer
# c3: sagnac_correction
# c4: Δt = (ω_E/c²)·(x₁y₂ − x₂y₁)
# c5: common_view_offset
seg-26c7b53cbc8c = <b>Geomeetrilised aja edastamise parandid (Sagnac + GNSS ühisvaade).</b> Uus <c1/> lisab kaks deterministlikku efekti, mida päris kellavõrdlus peab arvestama, täiendades stohhastilist kahesuunalist mudelit failis <c2/>: <c3/> (<c4/>, pöörleva Maa viivitus — kontinentaalsete baasjoonte puhul kümneid ns) ja <c5/>, GNSS ühisvaate ühe vahe, mis tühistab satelliidi kella vea täpselt ja taastab jaamadevahelise nihke. Kolm testi ankurdavad neid täpsete etalonide vastu: ekvatoriaalse veerandpöörde ≈ { "33" } ns Sagnac, antisümmeetria ning radiaalsed/polaarsed nulljuhud ja täpne satelliidikella tühistumine. Aus ulatus: täielik TWSTFT transponderi/riistvara viivituse eelarve ja PPP ionosfäärivaba aja edastamise lahendus on järgmised sammud.

# text
# c1: src/forces.rs
# c2: two_body_accel
# c3: −μ·r/|r|³
# c4: j2_accel
# c5: gravity_accel
# c6: src/integrator.rs
# c7: f(t,[r;v]) = [v; a(r)]
# c8: j2_secular_rates
# c9: Ω̇
# c10: ω̇
# c11: Ṁ
# c12: μ/r²
# c13: ω̇ = 0
# c14: Ω̇ ≈ −5°/day
seg-098e7ea0ee13 = <b>Orbitaalne jõumudel (kahe keha + J2).</b> Uus <c1/> lisab kiirendusmudeli, mida numbriline propageerija integreerib: <c2/> (<c3/>), lapikusehäiring <c4/> (ECI suletud kuju) ja neid summeeriv <c5/> — seo see failiga <c6/> kui <c7/>. See avab ka analüütilised J2 <b>sekulaarsed kiirused</b> (<c8/>): sõlme regressioon <c9/>, apsiidide pöörlemine <c10/> ja keskmise anomaalia triiv <c11/>. Kuus testi ankurdavad füüsikat täpsete etalonide vastu: <c12/> kahe keha liikme jaoks, J2 suletud kuju ekvaatoril (~{ "10" }⁻³ kahe keha suurusest), <b>kriitiline kaldenurk</b> ({ "63.4349" }°), mis külmutab perigeumi (<c13/>), ISS-i sõlme regressioon (<c14/>) ning retrograadse päikesesünkroonse orbiidi idasuunaline triiv. Aus ulatus: ainult kahe keha + J2; J3–J6, takistus, SRP ja kolmas keha on järgmised sammud.

# text
# c1: src/permalink.rs
# c2: +/
# c3: -_
# c4: encode_scenario
# c5: decode_scenario
# c6: ?s=
# c7: encode_permalink
# c8: decode_permalink
# c9: "foobar"
# c10: "Zm9vYmFy"
# c11: +
# c12: /
# c13: =
seg-d5c03ebc5707 = <b>Jagatavad stsenaariumi püsilingid.</b> Uus <c1/> lisab sõltuvusteta RFC { "4648" } Base64 koodeki (standardne <c2/> tähestik täitega ja URL-ohutu <c3/> täiteta tähestik) ning ümbrised <c4/> / <c5/>, nii et mänguväljaku TOML saab kodeerida päringuparameetriks <c6/> ja jagada URL-ina. Brauserile avatud wasm sidumistena <c7/> / <c8/>. Neli testi ankurdavad seda kanooniliste RFC { "4648" } vektoritega (<c9/> → <c10/> jne), URL-ohutu stsenaariumi edasi-tagasi teisendusega (<c11/>/<c12/>/<c13/> pole vaja paojada), kehtetute sümbolite tagasilükkamisega ja kõigi 256 baidi edasi-tagasi teisendusega. Aus ulatus: koodek ja sidumised tarnitakse siin; mänguväljaku nupu Share kasutajaliides, Plotly/D3 mitme seeria joonis ja A/B võrdlusrežiim on järgmised sammud.

# text
# c1: src/batch_ls.rs
# c2: gauss_newton
# c3: h(x)
# c4: (HᵀWH)·Δx = HᵀW·(z − h(x))
# c5: a·exp(b·t)
seg-b615fb16d547 = <b>Gauss–Newtoni partii vähimruudud (partii diferentsiaalparandaja).</b> Uus <c1/> lisab hindamistuuma, millel põhineb partii <em>orbiidi määramine</em> (või mis tahes parameetrite sobitus): <c2/> lineariseerib kasutaja antud mudeli <c3/> tsentraalse lõpliku vahe Jacobi maatriksiga, moodustab ja lahendab kaalutud normaalvõrrandid <c4/> (taaskasutades testitud maatriksi pöördmaatriksit) ning itereerib koondumiseni mõõtmiskohaste kaaludega. Neli testi ankurdavad seda: lineaarne sirge sobitus, mis jõuab täpse kaalutud vähimruutude lahendini, mittelineaarne <c5/> sobitus, mis taastab tõelised parameetrid, 3-D kauguse multilateratsioon, mis taastab teadaoleva asendi müravabadest kaugustest (orbiidi määramise maitse), ning alammääratud/mittesobivate sisendite tagasilükkamine. Aus ulatus: see on üldine parandaja mootor; orbiidispetsiifiline kauguse/kauguse muutumise kiiruse/asimuudi-kõrguse mõõtmismudel, analüütiline J2 olekuüleminekumaatriks ja avaldatud juhtumiga valideerimine on järgmised sammud.

# text
# c1: src/spoof_monitors.rs
# c2: spoof
# c3: combine_power_dbm
# c4: AgcMonitor
# c5: bpsk_autocorr
# c6: SqmMonitor
# c7: 10·log10(N)
# c8: R(τ)=1−|τ|
seg-0ada87934135 = <b>RF-kihi spuufimise seired (AGC võimsus ja SQM).</b> Uus <c1/> lisab kaks sõltumatut vastuvõtja esiosa spuufimise detektorit, mis täiendavad kellaabiga ajaspuufimise seiret failis <c2/>: <b>AGC võimsusseire</b> (<c3/> mittekoherentne võimsussumma + <c4/>), mis märgib liigse vastuvõetud võimsuse, mille spuufimissaatja lisab üle seadistatava dB varu, ja <b>signaalikvaliteedi seire</b> (<c5/> kolmnurkne koodi autokorrelatsioon + <c6/>), mis märgib Early-miinus-Late korrelaatori tasakaalutuse, mille toovad sisse mitmeteelevi/meaconing/kordus. Neli testi ankurdavad täpseid suletud kujusid ({ "3.01" } dB võimsuse kahekordistamisel, koondsumma <c7/>, kolmnurkne <c8/> ja { "10" } % Early/Late häirelävi). Aus ulatus: täielik RAIM-kooskõla pariteedi spuufimisdetektor, seireväljundite mitmekihiline liitmine ja valideerimine avaldatud Spirent/ION GNSS+ spuufimisvektoritega on järgmised sammud.

# text
# c1: src/integrator.rs
# c2: rk4_step
# c3: y' = f(t, y)
# c4: integrate
# c5: 0.9·(tol/err)^(1/5)
# c6: y' = y → e
# c7: < 1e-9
# c8: NumericalPropagator
seg-b1ff62d88cd2 = <b>Adaptiivne numbriline ODE integraator.</b> Uus <c1/> lisab <em>numbrilise</em> propageerija esimese osa (Kshana orbiidi propageerimine on muidu analüütiline SGP4/SDP4): üldine neljandat järku Runge–Kutta samm (<c2/>) mis tahes esimest järku süsteemi <c3/> kohal ja adaptiivne draiver (<c4/>), mis kontrollib lokaalset viga <b>sammu kahekordistamisega</b> (Richardsoni ekstrapolatsioon) standardse sammukontrolleriga <c5/> ja vastuvõtmise/tagasilükkamise loogikaga. Kuus testi ankurdavad seda täpsete lahendite vastu: eksponent <c6/> täpsusega <c7/>, ~{ "16" }× vea vähenemine poolitatud sammu kohta, mis tõestab neljandat järku koondumist, harmoonilise ostsillaatori energia/tagasipöördumise säilimine täisperioodi jooksul ning adaptiivne draiver, mis täidab range tolerantsi muutuvate sammudega. Aus ulatus: see on integraatori tuum ja selle veakontroll; Dormand–Prince'i RK5({ "4" })/RKF7({ "8" }) põimitud tabelid ja hierarhiline orbiidi jõumudel (kahe keha + J2–J6 + takistus + SRP + kolmas keha), mis teevad sellest <c8/>, on järgmised sammud.

# text
# c1: src/fusion/ukf.rs
# c2: n
# c3: P⁺ = P⁻ − K S Kᵀ
seg-ca53c62839d8 = <b>Unscented (sigma-punktide) Kalmani filter.</b> Uus <c1/> lisab skaleeritud unscented Kalmani filtri (Julier & Uhlmann; Wan & van der Merwe) üldise <c2/>-olekulise hindajana kasutaja antud protsessi- ja mõõtmisfunktsioonide kohal — sigma-punktide hindaja, mida tihedalt seotud GNSS/INS navigaator kasutab, kui pseudovahemaa/Doppleri mudel on tugevalt mittelineaarne ja EKF-i Jacobi maatriks halveneb. See sisaldab toetavat tihedat lineaaralgebrat (Choleski tegur sigma-punktide hajuvuse jaoks, Gauss–Jordani pöördmaatriks innovatsioonikovariatsiooni jaoks) ja Joseph'i vaba uuendust <c3/>. Kuus testi fikseerivad selle, võtmetestid kasutavad täpset omadust, et <em>lineaarse</em> mudeli korral taastoodab unscented teisendus Kalmani filtri numbrilise täpsusega (ennustus, uuendus ja täielik ennustus+uuenduse tsükkel, kõik võrdluses käsitsi käitatud lineaarse KF-iga, pluss 1-D analüütilise Bayesi aposterioorse kontrolliga ning Choleski/pöördmaatriksi samasustega). Aus ulatus: see on hindaja mootor; 17-olekuline tihedalt seotud GNSS/INS navigaator, pseudovahemaa/Doppleri mõõtmismudel ja katkestuse valideerimise stsenaarium jäävad järgmisteks sammudeks.

# text
# c1: araim_dual_raim
# c2: araim_raim
# c3: P_const
# c4: DualFaultPriors { p_sat, p_const }
# c5: P_HMI
# c6: N + C
# c7: P_const = 0
# c8: araim_raim
# c9: None
seg-da92d32b5715 = <b>Kahe konstellatsiooniga ARAIM kaitsetasemed.</b> Uus <c1/> laiendab ühe tõrkega täiustatud RAIM-i (<c2/>) EU ARAIM / DO-316 <b>konstellatsiooniülese tõrkerežiimiga</b>: tõrgeteta ja satelliidikohaste hüpoteeside kõrval annab iga konstellatsioon (märgendatud satelliidi kohta) ühe hüpoteesi, mis eemaldab kõik oma satelliidid korraga, eelnevaga <c3/> (uus <c4/>). Iga hüpotees lisab liikme samasse MHSS terviklikkuse summasse, nii et VPL/HPL on väikseimad piirid, mille kogu <c5/> täidab eelarve tõrgeteta + ühe SV + konstellatsioonikohaste tõrgete üle (Bonferroni valehäire jaotus on kõigi <c6/> hüpoteeside üle). Kui <c7/>, on tulemus bitt-bitilt <c8/>; ühe konstellatsiooniga kasutaja tagastab <c9/> oma konstellatsioonitõrke vastu (seda ei saa välistada) — just seetõttu on kahe konstellatsiooniga katvus oluline. Neli testi katavad samaväärsuse, kaitsetaseme laienemise, ühe konstellatsiooni kättesaamatuse ja sisendi valideerimise, taaskasutades olemasolevat lahenduse eraldamise alamlahendi masinavärki.

# text
# c1: src/precession.rs
# c2: (γ̄, φ̄, ψ̄, ε̄_A)
# c3: fw_angles
# c4: iauFw2m
# c5: precession_matrix
# c6: gcrs_to_mod
# c7: mod_to_gcrs
# c8: frames
# c9: ε̄ = 84381.406″ = 23.4392794°
# c10: ψ̄ ≈ 5039.998″
# c11: det = +1
# c12: ≈ 1.40°
# c13: ROADMAP.md
seg-d06c5f88282b = <b>IAU { "2006" } pretsessioon (Fukushima–Williamsi nurgad ja nihke-pretsessiooni maatriks).</b> Uus <c1/> teostab IAU { "2006" } (P03; Capitaine, Wallace & Chapront { "2003" }) pretsessiooni: neli Fukushima–Williamsi nurka <c2/> TT Juliuse sajandite polünoomidena (<c3/>) ja neist SOFA <c4/> konstruktsiooniga ehitatud GCRS→keskmine-kuupäeva nihke-pretsessiooni pöördemaatriks (<c5/>, abifunktsioonidega <c6/> / <c7/>). See on esimene inertsiaalraami osa olemasoleva GMST-põhise <c8/> taandamise peal. Kaheksa testi valideerivad suletud kuju ankrute vastu — J2000 keskmine kaldenurk <c9/>, avaldatud nurkade konstantliikmed, üldpretsessiooni <c10/> kuhjumine sajandi jooksul, maatriksi ortonormaalsus ja <c11/>, peaaegu ühikväärtus (ainult raami nihe) J2000 juures ja <c12/>/sajand netopöördenurk. Aus ulatus (<c13/>): ainult pretsessioon — IAU 2000A 678-liikmeline nutatsioon, täielik TEME→GCRS ahel ja SOFA/ANISE µas/<{ "10" } m numbriline ristkontroll on järgmised sammud.

# text
seg-14c0a863eef1 = Esimestest printsiipidest külmaatom-interferomeetri (CAI) kiirendusmõõturi füüsika.

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4π/λ
# c3: Φ = k_eff·a·T²
# c4: σ_Φ = 1/(C·√N)
# c5: C(t) = C₀·e^(−t/τ)
# c6: CaiAccelerometer::q_va()
# c7: AccelModel
# c8: |H(ω)| = (4/ω²)sin²(ωT/2)
# c9: accel_transfer_function
# c10: σ_Φ² = k_eff²·S_a·T³/3
# c11: vibration_phase_variance_white
# c12: vibration_phase_variance_band
# c13: beam_axis_projection
# c14: CaiAccelerometer::vibration_phase_noise
# c15: vibration_limited_accel
# c16: k_eff
# c17: √(S_a/(3T))
# c18: k_eff ≈ 1.61×10⁷
# c19: Φ(1 g) ≈ 1.58×10⁴ rad
# c20: σ_a ≈ 0.13 µg
# c21: 1/T²
# c22: 1/√N
# c23: T³
# c24: docs/QUANTUM.md
seg-408fc6feb284 = <c1/> modelleerib kolmeimpulsilist Mach–Zehnderi aatominterferomeetrit esimestest printsiipidest, mitte andmelehe järgi: efektiivne lainevektor <c2/>, interferomeetri faas <c3/>, kvantprojektsiooni (haava) müra <c4/>, kiirendustundlikkus ühe kordi kohta, kontrasti lagunemine <c5/> ja — põhiline — <c6/>, mis <b>tuletab</b> valge kiirenduse PSD, mida klassikaline <c7/> juba tarbib, aatomite arvust, päringuajast ja kontrastist. Mudel katab nüüd ka <b>vibratsioonisidestuse</b> — domineeriva päris seadme liikme: interferomeetri kiirendus→faas ülekandefunktsioon <c8/> (<c9/>), valge PSD faasidispersioon <c10/> (<c11/>, numbrilise ribaintegraali ristkontrolliga <c12/>), astaku-1 kiire sihis <c13/> ning <c14/> / <c15/> (viimane taandub <c16/>-sõltumatule põhjale <c17/>). Üksteist testi kontrollivad füüsikat käsitsi (Rb-87 <c18/>, <c19/>, <c20/>/kord haavamüra põhi vs ≈ { "5.9" } µg vibratsiooni põhi, <c21/>, <c22/> ja <c23/> skaleerimisseadused). Aus ulatus failis <c24/>: see hõlmab projektsioonimüra põhja ja sellest kõrgemat vibratsiooniga piiratud režiimi; laserifaasi müra, Coriolisi ja valgusnihke süstemaatilised vead ning PHARAO/CARIOQA valideerimisstsenaariumid jäävad järgmisteks sammudeks.

# text
# c1: ImuKind
# c2: Classical
# c3: QuantumCai
# c4: [cai]
# c5: CaiCfg
# c6: vibration_psd
# c7: quantum_cai
# c8: q_va
# c9: cai
# c10: skip_serializing_if = "Option::is_none"
# c11: Classical
# c12: QuantumCai
seg-ed668459d019 = <b>Kvant-CAI kiirendusmõõtur ühendatud inertsiaalstsenaariumisse.</b> Kiirendusmõõtur inertsiaalses hinnangulise asukoha stsenaariumis lahendub nüüd uueks <c1/> — <c2/> (olemasolev andmelehe koefitsiendiga andur) või <c3/>, kui sellel on valikuline plokk <c4/> (<c5/>: lainepikkus, impulsside vahe, aatomite arv, kontrast, tsükli aeg ja valikuline platvormi <c6/>). Anduri <c7/> kiiruse juhusliku käigu PSD <c8/> on <b>tuletatud</b> interferomeetri füüsikast — haavamüra põhi pluss, kui vibratsiooni PSD on antud, vibratsiooniga piiratud osa kvadratuuris — selle asemel et esitada koefitsient, ning käituse päritolu kirjutab üles, et müra on füüsikast tuletatud. Väli <c9/> on <c10/>, nii et olemasolevad stsenaariumid jätavad selle välja ja serialiseeruvad baidi haaval identselt (stsenaariumi räsi on muutumatu). Viis testi katavad tuletuse, kvadratuurse vibratsioonisumma, valiku <c11/>/<c12/>, räsistabiilse serialiseerimise ja otsast lõpuni CAI-juhitud käituse.

# text
seg-c3978a122010 = Konstellatsioonikavandi optimeerija ja katvusribade (streets-of-coverage) geomeetria.

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: MinSatellitesForCoverage
# c6: MaxCoverage
# c7: MinWorstPdop
# c8: coverage_half_angle_rad
# c9: λ = arccos(Re/r·cos ε) − ε
# c10: street_half_width_rad
# c11: cos c = cos λ / cos(π/s)
seg-aae519e71c00 = <c1/> saab funktsiooni <c2/>, gradiendivaba ruudustikuoptimeerija, mis otsib kavandiruumi <c3/> ja tagastab parima Walkeri kavandi valitud eesmärgi <c4/> all — <c5/>, <c6/> või <c7/> — juba valideeritud PDOP pühkimise üle (test kinnitab, et see tagastab toorjõu võitja). Pluss analüütilised <b>katvusribade (streets-of-coverage)</b> suletud kujud <c8/> (<c9/>) ja <c10/> (<c11/>, Rider/Beste), käsitsi kontrollitud õpikugeomeetria vastu ja tuvastades alaasustuse lünga. Täielik Rideri minimaalse satelliidiarvu globaalse katvuse lahendaja, 3-D mänguväljaku gloobus ja välise tööriista DOP ristkontroll on järgmised sammud.

# text
# c1: kshana <orbit.toml> --export-sp3 out.sp3
# c2: export_sp3 = true
# c3: <scenario>.sp3
# c4: api::export_sp3
# c5: auto_export_sp3
# c6: OrbitClockScenario::to_sp3_string
# c7: epoch
# c8: tests/sp3_export_roundtrip.rs
# c9: gps-ops
seg-7b8468636dea = <b>SP3 täppisefemeriidi eksport CLI-st.</b> Propageeritud orbiidi/konstellatsiooni stsenaariumi saab nüüd kirjutada SP3-c faili: <c1/> või <c2/> stsenaariumis kirjutab automaatselt faili <c3/> (<c4/> / <c5/>, <c6/>, valikuline <c7/>). Edasi-tagasi test (<c8/>) propageerib päris Celestraki <c9/> hetktõmmise, ekspordib selle, parsib uuesti ja kinnitab, et taastatud ECEF asendid langevad SGP4 tõega kokku { "24" } h jooksul täpsusega <b>< { "0.5" } m</b> (tublisti { "10" } m TLE-klassi tolerantsi sees). README dokumenteerib koostalitluse rolli (RINEX → RTKLIB/gLAB, SP3 → Ginan/täppisorbiidi tooted).

# text
seg-56c729ba110f = Seotud kella+asendi Kalmani filter (ristploki kovariatsioon).

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-0a424875131d = <c1/> on üks virnastatud <c2/> filter (Joseph'i vormi uuendused), mille <b>pseudovahemaa</b> mõõtmine <c3/> seob asendi- ja kellaplokid tõeliselt — erinevalt vana liitmispaketi kahest sõltumatust kaheolekulisest filtrist, mis hoiavad ristploki kovariatsiooni täpselt nullis. Valideeritud: ühine pseudovahemaa ajab <c4/> nullist erinevaks; kaks erinevat geomeetriat lahendavad koos süstitud asendi+kella nihked, mida üksik kaugus eristada ei suuda; <b>ainult kella lahend teravdab asendit</b> ristkovariatsiooni kaudu (kasu, mida lahutatud filtrid anda ei suuda); ja Monte Carlo NEES on <b>χ²({ "4" })-kooskõlaline</b>. See on 1-DOF realisatsioon (liitmispaketi dimensionaalsus); 3-D 8-olekuline laiendus ja ühendamine käivitatavasse paketti on järgmised sammud.

# text
seg-3983794a9584 = <b>Kalmani filtri kooskõla tervisejälgimine (NIS/NEES).</b> Kaheolekulise kellafiltri kovariatsiooniuuendus on nüüd <b>Joseph'i stabiliseeritud kujul</b> `P⁺ = (I−KH)P(I−KH)ᵀ

# text
# c1: , which stays positive-semidefinite under extreme Q/R ratios (Cholesky-checked in CI at
# c2: ). A new
# c3: runs a Monte-Carlo consistency assessment (Bar-Shalom §5.4): pooled **NIS** (normalised innovation², target 1) and **NEES** (normalised estimation error², target 2) against 95% χ² bands, surfaced as a
# c4: block in the clock result JSON and as a green/amber card in the playground. A Q/R-mismatch sweep test proves the monitor flips to inconsistent when the process noise is mistuned by ×0.1–×10. Adds a general χ² quantile (
seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, tabeliga kontrollitud).

# text
# c1: docs/PROVENANCE.md
# c2: gps-ops
# c3: provenance
seg-f9689061a1d2 = <b><c1/> — üks tsiteeritav päritolutabel.</b> Koondab iga anduriparameetri (kellad, inertsiaal, aja edastamine), füüsikalise/algoritmilise mudeli (orbiit, ajasüsteemid, raamid, iono/tropo, terviklikkus, tuvastamine, segamine, Alan) ja valideerimisandmestiku (AIAA 2006-6753, Celestraki <c2/>) koos selle avaldatud allikaga — andmeleht, artikkel, ICD või standard — ning aus küpsusmärgend (lennukvalifitseeritud / maalabor / kosmoseesmärk-maapealsel-riistvaral). Lingitud README sissejuhatusest ja dokumentatsioonitabelist; täiendab käitluskohaseid <c3/> stringe, mis juba liiguvad tulemuse JSON-is kaasas.

# text
# c1: ScenarioKind
# c2: kind
# c3: ScenarioKind::classify
# c4: run_toml
# c5: run_scenario(src) -> Result<RunOutput, KshanaError>
# c6: InvalidInput
# c7: NonConvergence
# c8: Unsupported
# c9: IoError
# c10: kind_tag()
# c11: Scenario
# c12: ExternalPack
# c13: jamming
# c14: list_scenario_kinds()
# c15: list_kinds()
# c16: error_kind()
# c17: docs/ARCHITECTURE.md
seg-55c7b52b5fdb = <b>Tüpiseeritud stsenaariumi API.</b> Edastus toimub nüüd tüpiseeritud enumil <c1/> toorestringi <c2/> sobitamise asemel (<c3/> + ammendav edastus), nii et paketi lisamine on kompileerimisel kontrollitud. Uued tüpiseeritud pinnad muutumatu stringi tagastava <c4/> kõrval: <c5/> struktureeritud veataksonoomiaga (<c6/> / <c7/> / <c8/> / <c9/>, igaühel stabiilne <c10/>); tunnusjoon <c11/> ja laienduspunkt <c12/> (pakett <c13/> on selle kaudu ühendatud töötatud näitena); ning enesevaatlus <c14/> (nimi, kirjeldus, kohustuslikud/valikulised väljad liigi kohta). Pythoni ja WebAssembly sidumised saavad <c15/> ja <c16/>. Dokumenteeritud failis <c17/>.

# text
seg-2b86391b753e = Päris GPS konstellatsioon + töökeskkonna ümbriku katvus.

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: scripts/fetch_tles.sh
# c5: tests/scenario_coverage.rs
# c6: docs/VALIDATION.md
seg-288f2b1872c8 = <c1/> tarnib nüüd <b>päris Celestraki <c2/> hetktõmmise</b> (2021-07-28, { "30" } satelliiti) sünteetiliste Walkeri TLE-de asemel lipuga <c3/>, nii et see laaditakse ainult siis, kui iga TLE kontrollsumma on kehtiv; <c4/> dokumenteerib reprodutseeritava värskenduse ja README tunnustab avaandmete allikat. Uus <c5/> käitab iga paketti ≥{ "5" } ümbrikuvariandiga, kinnitades lõpliku/piiratud väljundi, kinnitab, et <b>flicker-FM põhi halvendab mõõdetavalt kella väljajooksu</b>, kui see on lubatud (nüüd seatud kolmes tarnitud stsenaariumis), ja kinnitab, et <b>liitmisfilter koondub realistliku nullist erineva kiirendusmõõturi nihkega</b> (kuni { "3" }× nullitud nihkega juhtumist), sulgedes realismilõhe „fusion only works with zeroed biases“. <c6/> saab töökeskkonna ümbriku tabeli.

# text
# c1: gnss-sim
# c2: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c3: [iono]
# c4: [tropo]
# c5: gnss_measurements[]
# c6: src/gnss_sim.rs
# c7: scenarios/gnss-sim-raim.toml
seg-f78d7dce7bfa = <b>Mõõtmisruumi GNSS simulatsioon (stsenaariumi liik <c1/>).</b> Pseudovahemaa taseme otsemudel: iga nähtava satelliidi kohta sünteesib see <c2/> ja L1 Doppleri, <b>Klobucharri</b> ühesagedusliku ionosfääri (IS-GPS-200 §{ "20.3.3.5.2.5" }) ja <b>Saastamoineni</b> zeniidi troposfääriga, mida projitseerib <b>Nielli ({ "1996" })</b> kujutusfunktsioon — esitatud TOML plokkidena <c3/> ja <c4/>. Jäägid toidavad hetktõmmise RAIM-i epohhikohase HPL/VPL jaoks ning JSON-massiiv <c5/> kannab iga SV pseudovahemaad, Dopplerit, C/N₀ ja iono/tropo parandeid. Nullmüraga käitus taastoodab geomeetria + parandid alammillimeetri täpsusega (CI test). Uued <c6/> ja <c7/>.

# text
# c1: spoof
# c2: linear_ramp
# c3: step_jump
# c4: meaconing
# c5: replay
# c6: target_pfa
# c7: P_md
# c8: mc_runs
# c9: 1 − P_md
# c10: src/detection.rs
# c11: scenarios/spoof-meaconing.toml
# c12: [attack] rate_ns_per_s
seg-833249802c56 = <b>Stohhastiline ajaspuufimise detektor (stsenaariumi liik <c1/>).</b> Spuufimispakett käitab nüüd päris detektorit deterministliku kalde-vs-piiri võrdluse asemel: neli süstimiskuju (<c2/>, <c3/>, <c4/>, <c5/>), kahepoolne χ²₁ energia / Neyman–Pearsoni test kellaabilise seirestatistiku peal lävega, mis on seatud sihtvalehäire eelarvest <c6/>, ning tuvastamata jäänud sündmuse tõenäosus <c7/> esitatud nii suletud kujul kui Monte Carlo abil (<c8/> katset hüpoteesi kohta — need kaks langevad kokku mõne ×1/√N täpsusega). Turbe kvaliteedinäitaja on nüüd <c9/> operatiivselt kahjuliku (spets) suuruse juures. Uus <c10/> (Gaussi sabafunktsioonid, NP/energia test, Monte Carlo P_fa/P_md) ja <c11/>. Tagurpidi ühilduv: paljas <c12/> on endiselt aktsepteeritud lineaarse rambina.

# text
# c1: spoof
# c2: 1 − min_detectable/threshold
# c3: 1 − P_md
# c4: security
seg-b3f3d2ca8a3d = <b>Turbe kvaliteedinäitaja definitsioon (stsenaariumi liik <c1/>):</b> analüütilisest tuvastatavuse piirist <c2/> stohhastilise detektori <c3/>-ni. Kellapaketi väli <c4/> jääb kiiremaks analüütiliseks asendajaks.

# text
seg-ee1268975b2c = Lisatud (jätk)

# text
# c1: jamming
# c2: Q
# c3: availability_under_jamming
# c4: src/jamming.rs
# c5: scenarios/jamming-demo.toml
# c6: docs/CAPABILITY.md
# c7: docs/VALIDATION.md
seg-f71696b7fa20 = <b>RF segamismudel (stsenaariumi liik <c1/>).</b> Lingieelarve häiremudel, mis muudab segaja võimsuse ja geomeetria satelliidikohaseks lukustuse kaoks: segaja-signaali suhe vaba ruumi levikaost ja suunakohasest vastuvõtuantenni võimendusest, efektiivne C/N₀ standardse häiretevastase võrrandi kaudu (hajutuse kaotamise töötlusvõit × spektrierotustegur <c2/>; Kaplan & Hegarty §{ "9.4" }) ja seadistatav jälgimislävi, hinnatud Walkeri konstellatsioonil kui kvaliteedinäitaja <c3/>. Uued <c4/> ja <c5/>. Aus ulatus (mitmeteelevi, maastiku varjutuse, AGC ega adaptiivse nullimiseta) on dokumenteeritud failides <c6/> / <c7/>.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: [base]
# c4: scenarios/sweep-nd-inertial.toml
seg-d4dc36011ea1 = <b>Üldine N-D parameetri pühkimine mis tahes stsenaariumi liigi üle (<c1/>).</b> Eelmine N-D pühkimine oli ainult kellapaketile. <c2/> varieerib stsenaariumi <c3/> punktiga eraldatud TOML võtmeid oma telgede Descartes'i korrutise üle, edastab iga ruudustiku sõlme uuesti tavalise käitusraja kaudu ja loeb tulemusest punktiga eraldatud JSON-tee järgi ühe või mitu mõõdikut — nii et see töötab iga paketi (inertsiaal, gnss-ins, terviklikkus, spuufimine, …) jaoks ilma iga paketi Rust-tüübiga sidumata. Ruudustiku sõlmi hinnatakse natiivsetel sihtidel paralleelselt üle OS-i lõimede (lisasõltuvust pole); wasm langeb tagasi järjestikusele. Deterministlik ja ridade kaupa sõltumata lõimede arvust. Uus näide <c4/>.

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
# c3: gnss-ins
seg-1c42e15d65a9 = <b>TOML-iga seadistatav deterministlik IMU veamudel paketis <c1/>.</b> Kolmetelgne strapdown-veaahel (skaalategur, nihe joondusest, g-tundlikkus, kvantimine, kiiruse rampp; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) on nüüd anduri kohta kättesaadav stsenaariumifailist valikulise ploki <c2/> kaudu, kihina konstantsete sisselülitusnihkete peal. Ploki väljajätmine jätab iga anduri puhta konstantse nihke allikaks, nii et olemasolevad <c3/> käitused on muutumatud. See ühendab varem ainult teegis olnud veamudeli käivitatavasse paketti ja kvaliteedinäitajasse.

# text
# c1: tests/fixtures/igs/NOTICE
seg-e035371fbe58 = <b>Päris andmetega valideerimine.</b> Mitme-GNSS RINEX navigatsiooniparserit, GLONASS RK4 propageerijat ja SP3 lugejat harjutatakse nüüd päris IGS/DLR failidega (päris RINEX { "3" } segatud edastatav nav fail ja IGS SP3-c orbiiditoode), mitte ainult ise kirjutatud näidistega — kinnitades mittetühje satelliidikomplekte ning lõplikke, füüsikaliselt mõistliku suurusega ECEF asendeid. Testandmed on ainult testiks (avaldatud crate'ist välja jäetud); vt <c1/>.

# text
# c1: P_HMI
seg-2a807ae8e194 = <b>RAIM päris etalonorbiidi geomeetrial.</b> Hetktõmmise, lahenduse eraldamise (MHSS) ja ARAIM kaitsetaseme tuumad on nüüd valideeritud päris IGS täppisorbiidi (SP3) geomeetria vastu, mitte ainult sünteetiliste konstellatsioonidega: vaatejoone geomeetria ehitatakse esimesest SP3 epohhist päris maajaamas ja testid kinnitavad meetritasemel, APV-I-kättesaadavaid kaitsetasemeid, et { "60" } m pseudovahemaa nihe käivitab χ² seire, et lahenduse eraldamine <b>tuvastab</b> tõrkunud satelliidi ning et ARAIM-i tasemed täidavad eraldatud <c1/>. Sulgeb ainult sünteetilisel geomeetrial valideeritud lünga (vastuvõtjaruumi gLAB pariteet üle täieliku RINEX kaare jääb teekaardi punktiks — see vajab pseudovahemaa lahendit).

# text
# c1: sweep::nd_sweep_ensemble
# c2: metric_stat
# c3: runs = 1
# c4: nd_sweep
seg-651cc4af4872 = <b>Sõlmekohased usaldusvahemikud N-D parameetri pühkimisele</b> (<c1/>). Iga N-mõõtmelise Descartes'i korrutise pühkimise ruudustiku sõlme saab nüüd hinnata algväärtuste (seed) Monte Carlo ansamblina, esitades mõõdiku keskmise, protsentiilid ja protsentiili-bootstrap { "95" } % CI sõlme kohta (mõlema kella jaoks) — statistiliselt aus pühkimine, mitte üks väljavõte sõlme kohta. Taaskasutab ansambli/bootstrap'i masinavärki (<c2/>); deterministlik; <c3/> taandub täpselt ühe algväärtusega <c4/>. (Pühkimise üldistamine kõigile pakettidele, põimituna tüpiseeritud Scenario ümberkorraldusega, ja paralleelne täitmine jäävad tegemata.)

# text
# c1: tests/navego_imu_crossval.rs
# c2: navego_example_allan.m
# c3: ADEV(1 s) = σ·√dt
# c4: .mat
seg-815eda56aad9 = <b>IMU-müra töövoo ristvalideerimine NaveGo vastu</b> (<c1/>). Väline ristkontroll NaveGo (R. Gonzalezi avatud lähtekoodiga INS/GNSS-tööriistakomplekt) vastu: reprodutseeritakse faili <c2/> sünteetiline edasi-tagasi tsükkel selle avaldatud Microstrain 3DM-GX3-35 etalonprofiilil ning kinnitatakse, et meie kattuva ADEV hinnang taastab NaveGo kiiruse ja nurga juhusliku liikumise koefitsiendid (<c3/>) alla { "5" }% täpsusega ning eeldatava valge müra tõusuga −1/2. (Salvestatud { "40" } MB STIM300 <c4/>-logi ei loeta sisse: see on blokeeritud binaarvormingu tõttu.)

# text
seg-b67b3ec240de = Tihedalt seotud (pseudovahemaa) GNSS/INS-i uuendus.

# text
# c1: GnssInsEkf::update_tightly_coupled
# c2: ClosedLoopInsGnss::fuse_tightly_coupled
# c3: tight_coupling
seg-c926dddc5256 = <c1/> (ja ümbris <c2/>) realiseerivad varem tühjalt jäetud vahemaa-ruumi mõõtmise: innovatsioon on INS-i asukohast igasse satelliiti arvutatud ennustatud vahemaa võrreldes mõõdetud pseudovahemaaga, kusjuures vaatejoone Jacobi maatriks on asukohavea suhtes. Kuna iga satelliit on skalaarne mõõtmine, jätkab filter korrigeerimist ka <b>vähem kui nelja satelliidiga</b>, kus lõdvalt seotud PVT-lahendit ei eksisteeri. Viis testi katavad nelja satelliidi nullimist, kahe satelliidi korrektsiooni (PVT pole võimalik), ühe satelliidi jälgitavust piki vaatejoont ja sisendi valideerimist. Ainult pseudovahemaa; kandelaine faas ja selgesõnaline vastuvõtja kella olek jäävad teekaardile. Kasutamata cargo-funktsioon <c3/> (mis blokeeris vana veatühja) on eemaldatud.

# text
# c1: kind = "gnss-ins"
# c2: src/fusion/pack.rs
# c3: closed_loop
# c4: gnss_ins_ekf
# c5: scenarios/gnss-ins.toml
seg-94ebfac3bbc3 = <b>Lõdvalt seotud GNSS/INS-i stsenaariumipakett (<c1/>, <c2/>).</b> Ühendab kolmeteljelise strapdown-navigaatori ja 15-olekulise veaoleku EKF-i (<c3/> / <c4/>) käivitatavaks stsenaariumiks, millel on kvaliteedinäitaja: EKF distsiplineerib mehhaniseerimist müraste GNSS-lahendite vastu, kuni katvus on olemas, seejärel libiseb läbi katkestuse, asendades vana 1-DOF skalaarpaketi tõe külge sundimise lähtestamise tõelise liitmisega. Tulemus esitab liidetud horisontaalvea rea, hinnatud asukoha kvaliteedinäitaja (kättesaadavus / katkestuse RMS / holdover) ning võrdluseks lahtise ahelaga vaba INS-i RMS-i; kvant- ja klassikalise IMU paar erinevad ainult tõelise nihke poolest. Käivitatakse CLI-st, Pythonist või wasm-i sisenemispunktist koos näitega <c5/>. Aus raamistus: ainult lõdvalt seotud, üks deterministlik trajektoor ning liidetud katkestusvea alumise piiri seab üleandmise asendivea (seega ei väideta, et see skaleeruks nihkega); töökindlad järeldused on, et liitmine ületab abita dead-reckoning’u nihkega sensori puhul ning et väiksema nihkega sensoril on parem abita libisemine.

# text
# c1: src/walker.rs
# c2: walker
# c3: i: T/P/F
# c4: pdop_sweep
# c5: {planes × sats × inclination}
# c6: coverage_revisit
# c7: gps-ops
seg-0a2df01f99d8 = <b>Konstellatsiooni kavandamine valideeritud SGP4 tuumal (<c1/>).</b> Uus moodul <c2/> väljastab kavandatud Walker-delta mustri (<c3/>) SGP4 <b>keskmiste elementidena</b>, nii et sünteetiline konstellatsioon levib sama SGP4 teekonda mööda, mis on valideeritud { "4.12" } mm täpsusega AIAA 2006-6753 vektorite vastu, mitte analüütilise Kepleri generaatori kaudu. Selle peal: <c4/> tabuleerib katvuse ning mediaanse/halvima PDOP-i <c5/> kavandi ruudustiku kohta ja <c6/> annab katvuse osa ja uuesti läbimise vahed (halvim/keskmine) maapealses punktis. Valideeritud füüsikaliste monotoonsustega, mida kompromissanalüüs peab järgima (rohkem satelliite ⇒ suurem katvus, madalam PDOP, lühem uuesti läbimine). Eraldi lisatakse ehtne <b>Celestraki <c7/> TLE hetktõmmis</b> (2021-07-28, { "30" } töötavat GPS-satelliiti) ainult testides kasutatava testandmestikuna ning selle vastu valideeritakse reaalse TLE → SGP4 → ECEF geomeetria teekond (kogu MEO kest { "1" }% piires, üheksa satelliidi samaaegne nähtavus PDOP-iga { "1.64" }), lisaks olemasolevatele reaalandmete SP3 ja RINEX teekondadele.

# text
seg-9e051f3725df = Müratüübispetsiifilised efektiivsed vabadusastmed Alani usaldusvahemike jaoks.

# text
# c1: allan::edf_overlapping_adev
# c2: PowerLawNoise
# c3: classify_power_law
# c4: overlapping_adev_curve
# c5: AdevPoint
# c6: noise
# c7: edf
# c8: ci_lo
# c9: ci_hi
seg-2392bec8f0b6 = <c1/> realiseerib NIST SP { "1065" } tabeli { "5" } kinnised valemid (Stable32 lihtne komplekt) kõigi viie kanoonilise astmeseadusliku mürategundi jaoks: valge/flicker-PM, valge/flicker-FM ja juhusliku käimise FM. See asendab konservatiivse mittekattuva arvu χ² vabadusastmetena. Uus loendus <c2/> ja <c3/> tuvastavad domineeriva tüübi kirje <b>modifitseeritud</b> Alani hälbe tõusust (MDEV eristab valget PM-i flicker-PM-ist seal, kus ADEV seda ei suuda), ning <c4/> lisab nüüd igale eksporditud ADEV kõvera punktile tuvastatud mürategundi, selle edf-i ja { "95" }% usaldusvahemiku (<c5/> saab väljad <c6/>/<c7/>/<c8/>/<c9/>, lisanduvad serde vaikeväärtustega). Valideeritud kahel viisil: viis valemit ühtivad käsitsi arvutatud väärtustega { "1e-12" } täpsusega ning { "4" } 000 kirjega Monte Carlo valge-FM ansambel kinnitab, et valem ennustab hinnangu tegelikku hii-ruut edf-i { "20" }% piires (ja et see on konservatiivsest arvust oluliselt parem). Kaheksa uut testi.

# text
seg-df59cc71120f = Kahesuunalise aja edastamise stohhastiline mudel.

# text
# c1: timetransfer::TwoWayLink
# c2: (m_AB - m_BA)/2
# c3: two_way_offset_estimate
# c4: 1/sqrt(2)
# c5: ClockModel
# c6: sigma_y^2(tau) = q_rw*tau/3
# c7: LinkCfg
# c8: q_wf_s
# c9: q_rw_s
# c10: adev_tau0
# c11: timetransfer
# c12: tau/3
# c13: step()
# c14: q=0
seg-d2add1ce01e1 = <c1/> asendab ainult valget müra andva valimi füüsikaliselt põhjendatud mudeliga: vastastikune (ühisrežiimi) teekonnaviivitus tühistub hinnangus <c2/> (<c3/>, nii et kaks sõltumatut ühesuunalist mõõtmist keskmistuvad väärtuseks <c4/>) ja jääk on <b>mittevastastikune</b> diferentsiaalviivitus, mida modelleeritakse värvilise valge-FM + juhusliku käimise FM protsessina (valideeritud <c5/>), andes sünkroniseerimisvea reale realistliku Alani signatuuri (<c6/>) lameda valge müra asemel. <c7/> saab väljad <c8/>/<c9/> (serde vaikeväärtus { "0" } ⇒ varasem ainult valge käitumine, bitthaaval samane), lingi kvaliteedinäitaja annab <c10/> (mudeli Alani hälve baassammul) ning stsenaarium ja CLI <c11/> teevad selle nähtavaks. Kuldse kvaliteedinäitaja väärtus on uuesti fikseeritud. Kuus käsitsi tuletatud testi (ühisrežiimi tühistumine, kahesuunalise mõõtmise sqrt({ "2" }) võit, RWFM <c12/> seadus lingi enda <c13/> kaudu, varasema käitumisega samaväärsus väärtusel <c14/>, determinism ja kvaliteedinäitaja lõpust lõpuni nähtavus).

# text
seg-6c7a1dd63be0 = Stable32 arvuline vastavus Alani perekonna hinnangute jaoks (NBS14).

# text
# c1: tests/allan_reference.rs
seg-adbb47ca87b4 = <c1/> valideerib kattuva ADEV, modifitseeritud ADEV, ajahälbe ja kattuva Hadamardi hinnangud Stable32 etalonhälvete vastu kanoonilisel <b>NBS14</b> andmestikul (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ~lk 107) väärtustel tau = { "1" }, { "2" } suhtelise tolerantsiga { "1e-4" } — tegelik ühtivus ~{ "1e-6" }. See kinnitab hinnangute matemaatika de facto etalonrealisatsiooni vastu, mitte ainult hinnangute enda analüütilise sisemise kooskõla vastu. Kasutatakse ainult avalikke etalonarve; kolmanda osapoole koodi ei kasutata.

# text
# c1: integrity
# c2: integrity
# c3: IntegrityScenario
# c4: seed
seg-35b0c0644fa2 = <b>Vertikaalne Stanfordi terviklikkuse diagramm, mida ekspordib stsenaarium <c1/>.</b> Käivitatav stsenaariumi liik <c2/> ekspordib nüüd vertikaalse Stanfordi(-ESA) diagrammi HPL/VPL kättesaadavuskaardi kõrval: igal kaitstud epohhil kujutatakse algväärtusega reprodutseeritav veatu vahemaaveavalim geomeetria kaudu tegelikuks vertikaalseks asukohaveaks ja klassifitseeritakse VPL-i ning vertikaalse häireläve suhtes (Available / System-Unavailable / Misleading / Hazardously-Misleading). Diagramm (epohhipõhised punktid + piirkondade arvud) kantakse tulemuse JSON-i ning terviklikkuse sündmuste / HMI arvud CLI kokkuvõttesse, nii et Stanfordi klassifikaator, mis oli varem ainult teegis, on kättesaadav lõpust lõpuni. <c3/> saab välja <c4/> (vaikimisi { "0" }), mis juhib vea realisatsiooni; kättesaadavuskaart ise jääb puhtalt geomeetriapõhiseks ja algväärtusest sõltumatuks.

# text
seg-5d76a638ae77 = ARAIM-i terviklikkusriski (P_HMI) eelarve kaitsetasemete jaoks.

# text
# c1: raim::araim_raim
# c2: K_md
# c3: (prior, detection threshold, σ)
# c4: araim_protection_level
# c5: araim_integrity_risk
# c6: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c7: P_HMI
seg-449adb9ad6e6 = <c1/> tuletab horisontaalsed ja vertikaalsed kaitsetasemed selgesõnalisest terviklikkusriski eelarvest, mitte fikseeritud kordajast <c2/>: kõigi satelliitide nähtavuse lahenduse ja iga ühe satelliidi välistamise alamlahenduse jaoks koostab see igal teljel režiimipõhise <c3/> ning <c4/> lahendab väikseima PL-i, mille ohtlikult eksitava informatsiooni tõenäosuste summa (<c5/>, <c6/>, Blanch jt <em>Baseline ARAIM</em>) vastab eraldatud <c7/> väärtusele. Tulemus annab terviklikkusriski, mille tasemed tegelikult saavutavad, nii et kasutaja saab terviklikkust ja häireläve selgesõnaliselt vahetada. Kuus käsitsi tuletatud testi (veatu ja läviga üherežiimi kinnised valemid, mitmerežiimiline summeerimine/monotoonsus, lõpust lõpuni veatu kaitse, kus 10⁵× kitsam eelarve tõstab PL-i, vea tuvastamine/identifitseerimine ja kuue satelliidi liiasuse alampiir). Üksikvea MHSS on ARAIM-i baasjoon; üheaegsed mitme SV-alamhulga vead, kogu konstellatsiooni vearežiim ja gLAB etalonandmestikuga valideerimine on dokumenteeritud laiendused.

# text
seg-3e33581644a5 = Kahekiiruseline coning/sculling kompensatsioon strapdown-mehhaniseerimisele.

# text
# c1: inertial::mechanization::coning_sculling_compensate
# c2: NavState::step_increments
# c3: ScalarErrorBudget
# c4: AccelModel
# c5: NavState
seg-c900e193ac29 = <c1/> voldib kõrgsageduslikud coning (asend) ja pöörlemine+sculling (kiirus) liikmed välja jämeda uuenduse järjestatud alamintervalli IMU juurdekasvudest, nii et mõõduka sagedusega <c2/> taastoodab vibratsioonist rektifitseeritud liikumise, mille toorsummadel põhinev jäme samm kaotab. Valideerimistest ajab { "10" } Hz coning+sculling keskkonda { "60" } s ning võrdleb peenisagedusega tõde, naiivset jämedat integreerimist ja volditud jämedat integreerimist: voltimine vähendab asukohaviga ~{ "18" }× (meetrites naiivne libisemine → alla detsimeetri), kinnitades, et coning/sculling liikmed on kandvad. Tüübialias <c3/> nimetab varasema 1-DOF <c4/> selleks, mis see on, eristatuna kolmeteljelisest navigaatorist <c5/>.

# text
# c1: rinex_obs
# c2: parse_obs
# c3: SYS / # / OBS TYPES
# c4: C1C
# c5: L1C
seg-ceb037e7a6ea = <b>RINEX-vaatlusfaili parser.</b> Uus moodul <c1/> loeb RINEX 3.0x / { "4.00" } <em>vaatlusfaili</em> — vastuvõtja tegelikke mõõtmisi — ning täidab RINEX-i paari olemasoleva navigatsioonisõnumi parseri kõrval. <c2/> dekodeerib päise (versioon/tüüp, süsteemipõhised <c3/> loendid jätkuridadega, ligikaudne asukoht, intervall, esimese vaatluse aeg) ja iga epohhi satelliidipõhised kirjed: pseudovahemaa, kandelaine faas, Doppler ja signaali tugevus, tunnustatud nende RINEX { "3" } vaatluskoodidega (<c4/>, <c5/>, …) ning sideme kaotuse (LLI) ja signaalitugevuse (SSI) lippudega; tühi väli säilitatakse puuduvana, mitte nullina. Aus ulatus: see on standardvormingu <em>sissevõtt</em> (tegelik RTKLIB/gLAB/IGS-jaama vaatluslogi sisse, tüübitud mõõtmised välja), mitte positsioneerimismootor — siin pole pseudovahemaa lahendust, PPP-d ega RTK-d.

# text
# c1: oem
# c2: OemFile::from_propagators
# c3: OemFile::to_oem_string
# c4: CCSDS_OEM_VERS
# c5: CREATION_DATE
# c6: ORIGINATOR
# c7: META_START … META_STOP
# c8: OBJECT_NAME
# c9: OBJECT_ID
# c10: CENTER_NAME
# c11: REF_FRAME = TEME
# c12: TIME_SYSTEM = GPS
# c13: START_TIME
# c14: STOP_TIME
# c15: epoch X Y Z X_DOT Y_DOT Z_DOT
# c16: CREATION_DATE
seg-60efb0c44522 = <b>CCSDS OEM (Orbit Ephemeris Message) kirjutaja.</b> Uus moodul <c1/> ekspordib levitatud konstellatsiooni kehtiva CCSDS 502.0-B OEM { "2.0" } sõnumina — KVN efemeriidivorming, mida GMAT, Orekit, STK ja enamik lennudünaamika tööriistu sisse loeb. <c2/> valib iga satelliidi inertsiaalse (TEME) oleku — asukoha <b>ja</b> kiiruse, otse levitajast ilma Maaga seotud pöördeta, erinevalt SP3 ekspordist — ajaruudustikule ning <c3/> serialiseerib päise <c4/>/<c5/>/ <c6/> pluss ühe <c7/> lõigu satelliidi kohta (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>), millele järgnevad selle <c15/> read (km, km/s). Välja <c16/> annab kutsuja, mitte seinakell, nii et väljund on käivituste vahel baitideni identne (reprodutseeritavuse leping). See on GNSS SP3 ekspordi kosmoseaparaadi efemeriidi vaste: Kshana orbiidi saab nüüd standardvormingus lennudünaamika tööriistale üle anda.

# text
seg-f8538db4a17c = SP3 täppisefemeriid levituse allikana.

# text
# c1: Sp3File::interpolator
# c2: Sp3Interpolator
# c3: Propagator::Sp3Precise
seg-2cf2e224deb9 = <c1/> ehitab satelliidipõhise <c2/>, mis täidab tabuleeritud SP3 epohhide vahelise asukoha 9. astme Lagrange’i polünoomiga (standardne IGS-i praktika) ja pöörab selle ühisesse TEME tugisüsteemi; see on kättesaadav kui <c3/>. IGS-i / analüüsikeskuse täppisorbiidifail saab nüüd juhtida sama geomeetria/nähtavuse/terviklikkuse töövoogu mis leviedastatud ja analüütilised levitajad. Valideeritud edasi-tagasi tsükkel: SP3-sse kirjutatud ja interpolaatori kaudu uuesti loetud Kepleri orbiit ühtib algsega sõlmedes meetri murdosa täpsusega ja < { "100" } m intervalli keskel. Kella interpoleerimine on järgmine.

# text
# c1: glonass
# c2: parse_glonass_nav
# c3: R
# c4: J2
# c5: Propagator::Glonass
# c6: rinex
seg-8d50fd42f53c = <b>GLONASS leviedastatud efemeriid (täiendab multi-GNSS RINEX nav-i).</b> Uus moodul <c1/>: GLONASS ei edasta Kepleri elemente, vaid PZ-90 Maaga seotud <b>olekuvektorit</b> (asukoht, kiirus, Kuu-Päikese kiirendus). <c2/> loeb RINEX { "3" } <c3/> kirjeid ning satelliidi asukoht mis tahes ajahetkel saadakse GLONASS ICD liikumisvõrrandite <b>4. järku Runge–Kutta integreerimisega</b> (tsentraalne gravitatsioon + <c4/> + Maa pöörlemise Coriolise/tsentrifugaalliikmed + leviedastatud kiirendus). Kättesaadav kui <c5/>, nii et GLONASS-i satelliidid liiguvad konstellatsiooni/nähtavuse/terviklikkuse töövoos koos Kepleri süsteemidega; üks <c6/> konstellatsiooniplokk võib nüüd segada GPS-i, Galileot, QZSS-i, BeiDoud ja GLONASS-i.

# text
# c1: E
# c2: J
# c3: C
# c4: G
# c5: Propagator::Rinex
seg-8d88144e3726 = <b>Multi-GNSS RINEX navigatsioon (GPS, Galileo, QZSS, BeiDou).</b> RINEX { "3" } navigatsiooni parser dekodeerib nüüd Galileo (<c1/>), QZSS-i (<c2/>) ja BeiDou (<c3/>, MEO/IGSO) kirjeid GPS-i (<c4/>) kõrval — neil on ühine Kepleri paigutus ja kasutaja algoritm — kusjuures igaüht hinnatakse oma gravitatsioonikonstandi ja Maa pöörlemiskiirusega (Galileo/BeiDou μ, BeiDou Ω̇ₑ). Segakonstellatsiooni fail annab neid kõiki, mis liiguvad konstellatsiooni/nähtavuse/terviklikkuse töövoos kui <c5/>. BeiDou geostatsionaarsed satelliidid kasutavad teistsugust koordinaatide pööret ning jäetakse vahele, kuni on olemas etalonandmestik, mille vastu valideerida. Kirjete läbijalutaja kasutab süsteemipõhiseid reaarve, parandades varjatud vea, kus neljarealisi GLONASS-i/SBAS-i kirjeid jäeti vahele, nagu oleksid need kaheksarealised. GLONASS (olekuvektori mudel) on järgmine.

# text
# c1: sp3
# c2: parse_sp3
# c3: Sp3File
# c4: V
# c5: Sp3File::from_propagators
# c6: to_sp3_string
seg-91a6907acc8d = <b>SP3-c/d täppisefemeriidi lugeja ja kirjutaja.</b> Uus moodul <c1/> parsib IGS-i/analüüsikeskuse SP3 täppisorbiidifaile (<c2/>) — järeltöödeldud ECEF asukoha/kella toodet, mida PPP mootorid (Ginan, RTKLIB, gLAB) käsitlevad etalonina — struktureeritud <c3/> kujule (päis, epohhiruudustik, satelliidipõhine asukoht km→m, kell µs ja kiirus dm/s→m/s <c4/> toodete puhul), säilitades SP3 vigaste väärtuste markerid. Vastupidine suund on samuti kaetud: <c5/> ehitab SP3 levitatud konstellatsioonist (TEME→ECEF epohhi kohta) ja <c6/> serialiseerib selle, nii et Kshana orbiite saab eksportida vormingus, mida välised PPP tööriistad sisse loevad — lugemise↔kirjutamise edasi-tagasi tsükkel. Epohhide interpoleerimine ja SP3 levitaja allikas on järgmised.

# text
# c1: rinex
# c2: tle
# c3: scenarios/orbit-rinex.toml
seg-7d51d1b6f39f = <b>RINEX leviedastatud efemeriid käivitatava konstellatsiooni allikana.</b> Konstellatsioon aktsepteerib nüüd lisaks olemasolevale valikule <c2/> ka sisseehitatud plokki <c1/> (RINEX { "3" } GPS navigatsiooniteksti), nii et tegelik leviedastatud fail juhib stsenaariumi lõpust lõpuni CLI-st, Pythonist või brauserisisesest mänguväljakust — RINEX sisse, PNT geomeetria välja. Uus <c3/> demonstreerib GNSS-i kättesaadavust ja DOP-i kaheksa GPS-satelliidiga, mis on ehitatud otse leviedastatud kirjetest. (Ainult GPS LNAV; multi-GNSS ja SP3 on järgmised.)

# text
# c1: RinexEphemeris
# c2: orbit::Propagator
# c3: Propagator::Rinex
# c4: sv_position_teme
seg-9730835bfc64 = <b>RINEX leviedastatud efemeriid levituse allikana.</b> Parsitud <c1/> teisendub nüüd väärtuseks <c2/> (<c3/>): asukoht on IS-GPS-200 leviedastatud orbiit, mis on ECEF-ist pööratud ühisesse TEME inertsiaalsesse tugisüsteemi (<c4/>, lisasekundi suhtes õige GPS→UT1 ajaga), kiirus tsentraalse lõppdiferentsiga ning Kepleri orbiidiperiood. Tegelikud GPS leviedastatud andmed saavad nüüd juhtida sama geomeetria, nähtavuse ja terviklikkuse (RAIM) töövoogu mis analüütilised SGP4/Kepleri levitajad. (Pole veel kättesaadav RINEX-faili stsenaariumi liigina — see ning multi-GNSS/SP3 on järgmised.)

# text
seg-a355e3e52ec3 = <b>Arhiivi DOI.</b> Väljalasked deponeeritakse nüüd Zenodosse ja neile omistatakse tsiteeritav DOI.

# text
seg-c6e4556e1ce5 = <b>Dokumentatsioon.</b> README on ajakohastatud institutsionaalsele tasemele: kogu { "v0.9.0" } pinu võimekuste ülevaade, jaotis Versioonihaldus ja väljalasked, puhas päis uue märgiga ning lühike olekurida. Mootori muudatusi pole.

# text
# c1: integrity
seg-1bfc4e965d2b = See väljalase lisab { "0.8.0" } SGP4 aluse peale kolm olulist võimekuse valdkonda: tõeline kolmeteljeline strapdown INS, lõdvalt seotud GNSS/INS veaoleku EKF suletud ahela tagasisidega, tõeline hetktõmmise ja lahenduste eraldamise (ARAIM-laadne) RAIM koos HPL/VPL-iga ja käivitatav stsenaarium <c1/>, ning GNSS-vormingute koostalitusvõime esimene samm (RINEX-3 GPS efemeriidi sissevõtt).

# text
# c1: src/rinex.rs
# c2: parse_nav
# c3: G
# c4: BROADCAST ORBIT
# c5: RinexEphemeris
# c6: D
# c7: parse_d
# c8: D
seg-7fa2f68d436a = <b>RINEX { "3" } GPS navigatsioonisõnumi parser (<c1/>).</b> Esimene samm GNSS-vormingute koostalitusvõime suunas: <c2/> loeb RINEX { "3" }.x navigatsioonifaili ja dekodeerib iga GPS (<c3/>) leviedastatud efemeriidi kirje — kaheksarealise SV/epohhi + <c4/> ploki — Kepleri elementide ja kella paranduste kirjeks <c5/>, väljanimede ja ühikutega IS-GPS-200 järgi. Käsitleb Fortrani <c6/>-eksponendiga ujukomavormingut (<c7/>) ja fikseeritud laiusega veeru paigutust; mitte-GPS süsteemide kirjed jäetakse vahele, mitte ei lükata tagasi, nii et segafail annab siiski oma GPS efemeriidid. Neli testi: <c8/>-eksponendi parsimine (sh tühikud ja vead), täielik kirje dekodeeritud teadaolevate väljaväärtuste vastu GPS poolsuurtelje terviklikkuskontrolliga (√A² ≈ { "26 560" } km), mitte-GPS kirjete vahelejätmine ja tühja faili juhtum.

# text
# c1: src/rinex.rs
seg-9c4a068f204c = GPS leviedastatud efemeriid → ECEF asukoht (<c1/>).

# text
# c1: RinexEphemeris::sv_position_ecef(t_tow)
# c2: μ
# c3: Ω̇ₑ
# c4: tk
seg-5deeec4b8cc9 = <c1/> hindab satelliidi Maaga seotud asukohta parsitud efemeriidist IS-GPS-200 §{ "20.3.3.4.3.1" } kasutaja algoritmi järgi: Kepleri võrrandi Newtoni lahendus ekstsentrilise anomaalia jaoks, teise harmoonilise laiuskraadi argumendi / raadiuse / kaldenurga parandused ning pööre ECEF-i, arvestades Maa pöörlemist alates etalonepohhist (spetsifikatsiooni nõutava GPS <c2/> ja <c3/> ning nädalavahetuse <c4/> voltimisega). Kolm testi: geotsentriline raadius jääb GPS vahemikku (≈ { "26 560" } km), Maaga seotud kiirus on ~{ "3.9" } km/s ja terve nädala kaugusel hindamine annab sama asukoha.

# text
# c1: src/rinex.rs
seg-583433389a70 = GPS SV kella nihe relativistliku paranduse arvestamisega (<c1/>).

# text
# c1: RinexEphemeris::sv_clock_bias_s(t_tow)
# c2: af0 + af1·Δt + af2·Δt²
# c3: Toc
# c4: F·e·√A·sin Ek
# c5: EpochUtc::gps_time_of_week
# c6: TGD
# c7: Propagator
# c8: docs/CAPABILITY.md
seg-957588ed5dff = <c1/> hindab leviedastatud kellapolünoomi <c2/> ümber punkti <c3/> pluss relativistliku ekstsentrilisuse liikme <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). Uus <c5/> teisendab kirje kalendriepohhi GPS-i nädala ajaks Juliuse päeva aritmeetikaga alates GPS-i epohhist (1980-01-06) ning Kepleri lahendus jagatakse asukoha hindamisega. Testid: GPS-i nädala aeg pühapäeva/teisipäeva/laupäeva jaoks (nädalapiirid) ning kella nihe, kus domineerib af0, olemasoleva piiratud relativistliku liikmega. L1 grupiviivitust <c6/> kuvatakse, kuid seda tahtlikult sisse ei arvestata. Aus ulatus: allikas <c7/>, Galileo/BeiDou/GLONASS ja SP3 jäävad järgmisteks sammudeks. (<c8/> on vastavalt uuendatud.)

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: kind = "integrity"
# c4: IntegrityScenario
# c5: (sigma, P_fa, P_md, AL_H, AL_V)
# c6: constellation_raim_availability
# c7: kshana scenarios/integrity-raim.toml
seg-ef971feff16c = <b>Kasutaja käivitatav stsenaariumi liik <c1/> (<c2/>).</b> RAIM-i kättesaadavuse võimekus on nüüd CLI-st/TOML-ist kättesaadav nagu iga teine pakett: <c3/> parsib kirje <c4/> (kasutaja orbiit, üks või mitu GNSS-i konstellatsiooni, kõrgusmask ja terviklikkuse seadistus <c5/>), käivitab <c6/> ning väljastab epohhipõhise HPL/VPL kättesaadavuskaardi JSON-ina pluss isemajandava SVG — kaitsetasemed ajas häireläviede suhtes, rohelise/punase kättesaadavusribaga. <c7/> kirjutab JSON-i, diagrammi ja HTML-aruande. Kaasasolev stsenaarium (24 satelliidi Walker, { "1" } m kahesageduslik kaugusmõõtmine, APV-I piirid) annab kättesaadavuseks ~{ "95" } %; see dokumenteerib, et ühesageduslik RAIM ei täida ühe konstellatsiooni puhul vertikaalset APV-I piiri, mistõttu vertikaalseks juhtimiseks kasutatakse SBAS-i/kahesageduslikku/ARAIM-i. Testid katavad suunamise, kättesaadavuskaardi JSON-i ja SVG.

# text
# c1: src/raim.rs
# c2: constellation_raim_availability
# c3: Propagator
# c4: serde
# c5: RaimAvailabilityReport
# c6: n_visible
# c7: available
# c8: RaimConfig
# c9: (sigma, P_fa, P_md, AL_H, AL_V)
# c10: raim_availability_epoch
# c11: None
seg-bbe5721c1785 = <b>Käivitatav RAIM-i kättesaadavus konstellatsiooni kohta (<c1/>).</b> Terviklikkuse moodulil polnud kutsujat — <c2/> teeb sellest tõelise lõpust lõpuni sisenemispunkti: igal ajaruudustiku epohhil levitab see nähtavad satelliidid (samade SGP4/Kepleri <c3/>-idega, mida mootor kasutab), arvutab veatud kaitsetasemed ja hindab kättesaadavust horisontaalsete/vertikaalsete häireläviede suhtes, tagastades <c4/>-ga serialiseeritava <c5/> (epohhipõhine <c6/>/HPL/VPL/<c7/> pluss kättesaadavuse osa). <c8/> koondab <c9/> ning epohhipõhine <c10/> on kättesaadav kutsujatele, kes lahendavad oma geomeetria ise. Kolm testi: epohh, mis on APV-I piiride all kümne satelliidi geomeetrial kättesaadav, muudetud kättesaamatuks võimatult range piiriga, ning tasemed <c11/> alla viie satelliidi; ja lõpust lõpuni käitus 24 satelliidi Walker-konstellatsioonil, mis annab lõpliku kättesaadavuskaardi ja serialiseerub. (Kuus satelliiti — jääk-RAIM-i liiasuse alampiir — ei täida ausalt <em>mitte</em> APV-I-d isegi { "1" } m kaugusmõõtmise puhul; APV-I kättesaadavus vajab tihedamat geomeetriat, mida test kasutab.)

# text
# c1: src/raim.rs
# c2: y = x
# c3: Available
# c4: SystemUnavailable
# c5: MisleadingInformation
# c6: HazardouslyMisleadingInformation
# c7: classify_stanford
# c8: StanfordDiagram
# c9: (error, PL)
# c10: serde
# c11: error == PL
seg-91e32e587cb6 = <b>Stanfordi(-ESA) terviklikkuse diagrammi akumulaator (<c1/>).</b> Standardne viis terviklikkuse monitori kokkuvõtmiseks paljude epohhide peale: see kujutab tegelikku asukohaviga (x) kaitsetaseme (y) vastu ja klassifitseerib iga epohhi diagonaali <c2/> ja häireläve järgi väärtuseks <c3/> (PL piirab viga, AL piires), <c4/> (PL piirab viga, kuid ületab AL-i — ohutu, kasutamatu), <c5/> (PL < viga ≤ AL) või <c6/> (PL < viga ja viga > AL — ohtlik rike). <c7/> on puhas klassifikaator; <c8/> akumuleerib <c9/> punkte fikseeritud häireläve vastu, kuvades piirkondade arvud, kättesaadavuse, terviklikkuse sündmuste summad ja <c10/>-ga serialiseeritavad punktid joonistamiseks/JSON-i eksportimiseks. Neli testi: iga piirkond (sh <c11/> piiratud piir), arvu/kättesaadavuse akumuleerimine ja JSON-i edasi-tagasi tsükkel. See on RAIM-i kaitsetasemete aruandlusliides; selle ühendamine konstellatsiooni stsenaariumiga ja avaliku andmestiku vastu valideerimine jäävad teekaardi punktideks.

# text
# c1: src/raim.rs
# c2: snapshot_raim
# c3: Δ_k = x_k − x₀
# c4: Cov(x_k) − Cov(x₀)
# c5: PL = max(K_md·σ₀, max_k[K_fa·σ_ss,k + K_md·σ_k])
# c6: K_fa = Φ⁻¹(1−P_fa/2)
# c7: K_md = Φ⁻¹(1−P_md)
# c8: normal_cdf
# c9: normal_quantile
# c10: erf(x) = P(½,x²)
# c11: excluded_sv == 2
seg-cdeb3a5a4acf = <b>Lahenduste eraldamise (ARAIM-laadne) RAIM (<c1/>).</b> Mitme hüpoteesiga terviklikkuse monitor olemasoleva jäägi/pariteedi hii-ruut <c2/> kõrval. Kõigi satelliitide nähtavuse vähimruutude lahenduse ja iga ühe satelliidi välistamise alamlahenduse jaoks moodustab see eralduse <c3/> — nullkeskmise Gaussi jaotusega vea puudumisel kovariatsiooniga <c4/> (pesastatud hinnangute samasus, kehtib, kuna kõigi satelliitide nähtavuse lahendus on BLUE) — ning seega nii <b>tuvastab</b> vea kui ka <b>identifitseerib</b> vigase satelliidi (selle, mille välistamine annab suurima normaliseeritud eralduse). Horisontaalsed/vertikaalsed kaitsetasemed järgivad standardset MHSS-i eraldust <c5/>, kus <c6/>, <c7/>. Uued sõltuvusteta <c8/>/<c9/>, mis on ehitatud mooduli olemasolevale regulariseeritud mittetäielikule gammafunktsioonile (<c10/>). Neli käsitsi tuletatud testi: normaaljaotuse CDF / kvantiil õpikuväärtuste vastu (Φ({ "1.95996" })={ "0.975" }, { "1e-7" } saba = { "5.1993" }, sümmeetria); veatu geomeetria, mis ei anna häiret ja annab lõpliku positiivse HPL/VPL-i; 60-σ üksiku satelliidi nihe, mis tuvastatakse <em>ja</em> identifitseeritakse õigesti (<c11/>); ning kuue satelliidi liiasuse alampiir. Sulgeb auditi lünga „tautoloogiline terviklikkus — pole tõelist RAIM/HPL/VPL-i“ (P0) algoritmi poolel; gLAB-andmestikuga valideerimine ja Stanfordi diagrammi akumulaator jäävad teekaardi punktideks.

# text
# c1: src/fusion/closed_loop.rs
seg-67e771fc0a48 = Suletud ahelaga GNSS/INS integreerimine (<c1/>).

# text
# c1: ClosedLoopInsGnss
# c2: mechanization::radii_of_curvature
# c3: NavState::omega_ie_n
# c4: omega_en_n
seg-5aa467783b99 = <c1/> ühendab veaoleku EKF tuuma kolmeteljelise strapdown-mehhaniseerimisega: iga IMU valim korrigeeritakse jooksvate nihkehinnangutega, mehhaniseeritakse edasi ja EKF kovariatsioon propageeritakse ajas sobiva navigatsioonikontekstiga; iga GNSS asukoha/kiiruse lahend moodustab INS−GNSS innovatsiooni ning annab hinnatud <b>asukoha, kiiruse, asendivea (ψ, kvaternioonpöördena) ja kiirendusmõõturi/güroskoobi nihked</b> tagasi lahendusse, lähtestades veaoleku keskmise. Asendi tagasiside (mitte ainult nihked) on stabiilsuse jaoks vajalik — kalle ja kiirendusmõõturi nihe on seotud paar, nii et ühe korrigeerimine ilma teiseta hajub. INS-i ja GNSS-i võrreldakse kohalikus puutujatasandi NED tugisüsteemis, kasutades mehhaniseerimise enda kõverusraadiusi (uus <c2/>; <c3/>/<c4/> on kättesaadavad). See on aus asendus hübriidpaketi <em>tõe külge sundimise lähtestamisele</em>. Kolm testi: suletud ahel, mis nullib sisestatud { "8" } m / −{ "5" } m asukohavea väärtuseni <{ "0.1" } m; abistatud lahendus, mis püsib meetrites piiratuna (<{ "6" } m) sõidutrajektooril, samal ajal kui vabalt jooksev INS hajub üle { "100" } m; ning verstapostietalon — liidetud lahenduse <b>Monte Carlo asukoha RMS { "60" } s GNSS-i katkestuse jooksul ületab abita lahtise ahelaga dead-reckoning’u rohkem kui { "2" }× (≈{ "4" }× algväärtuste lõikes)</b>. Mooduli dokumenteeritud aus piirang: lõdvalt seotud režiimis on kiirendusmõõturi nihe ja kalle vaid nõrgalt eraldatavad (mõlemad seotud gravitatsiooni kaudu), nii et pakutav väärtus on piiratud, korrigeeritud olek ja puhas katkestusse sisenemine, mitte täpne inertsiaalne kalibreerimine; rikkam dünaamika ja tihedalt seotud laiendus jäävad teekaardi punktideks.

# text
# c1: src/fusion/gnss_ins_ekf.rs
# c2: δx = [δp, δv, ψ, b_a, b_g]
# c3: Φ = I + F·dt
# c4: H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]
# c5: tight_coupling
# c6: P/(P+R)
seg-aa9bf0ff6f84 = <b>Lõdvalt seotud GNSS/INS veaoleku EKF tuum (<c1/>).</b> 15-olekuline veaoleku laiendatud Kalmani filter — <c2/> — strapdown-vea dünaamikaga Grovesi { "2013" } §{ "14.2" } järgi (erijõu/kalde sidestus, Coriolis, keha→nav nihke projektsioon, Gaussi–Markovi nihkemudelid), esimest järku diskreetse üleminekuga <c3/> ning lõdvalt seotud asukoha+kiiruse mõõtmisuuendusega (<c4/>) Joepi kujul. Sõltuvusteta tihe lineaaralgebra (Gaussi–Jordani pöördmaatriks, Joepi kovariatsiooniuuendus). Cargo-funktsioon <c5/> blokeerib dokumenteeritud, kuid veel realiseerimata pseudovahemaa/Doppleri uuenduse. { "7" } testi käsitsi tuletatud eeldustega: kaldsümmeetria/ristkorrutise samasus, kontrollitud { "3" }×{ "3" } pöördmaatriks, kovariatsioon püsib ennustamisel sümmeetrilise/PSD-na (ja abita asukohamääramatus kasvab), asukohalahend vähendab asukoha kovariatsiooni, teadaoleva asukohavea täpne taastamine analüütilise Kalmani võimenduse <c6/> korral ning väiksemad korrektsioonid suurema mõõtmismüra korral. See on tuum, mis asendab hübriidpaketi lahtise ahelaga tõe külge sundimise lähtestamise suletud ahelaga tagasisidega (paketi ühendamine + NaveGo valideerimine järgnevad).

# text
# c1: src/inertial/imu_errors.rs
seg-5be84079b8b6 = Deterministlik IMU veamudel 3-teljelisele strapdown-navigaatorile (<c1/>).

# text
# c1: ImuErrorModel
# c2: (ω, f)
# c3: ImuErrorModel::ideal()
# c4: inertial
seg-492e670736b2 = <c1/> moonutab tõelise keharaami paari <c2/> mõõdetuks viie süstemaatilise kategooria kaudu (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabel { "4.1" }): <b>skaalategur</b> (teljepõhine ppm võimenduse viga), <b>nihkeviga / ristsidestus</b> (triaadi mitteortogonaalsus väljaspool diagonaali), <b>g-tundlikkus</b> (erijõuga võrdeline güroskoobi kiirusnihe), <b>kvantimine</b> (ümardamine väljundi LSB-le) ja <b>kiirusrambi</b> (ajas lineaarne triiv — kolmas Alani piirkond), pluss konstantne sisselülitusnihe. Iga liige on vaikimisi null, mistõttu <c3/> on läbipaistev läbilase ja olemasolevaid stsenaariume see ei mõjuta. Igal veaallikal on isoleeriv test (skaala lineaarne täpsusega <{ "0.01" }%, ristteljeline nihe üle VRW põhja, g-tundlikkuse nihe, LSB ruudustik, lineaarne ramp) ning lõpust lõpuni test juhib moonutatud IMU-st mehhaniseerimise kaudu navigatsiooniviga. Modelleerimata: vibratsiooni rektifikatsiooniviga, temperatuurigradiendi triiv. (Kaasasolev stsenaariumipakett <c4/> käitab endiselt varasemat 1-DOF skalaareelarvet; see mudel toidab 3-teljelist teeki.)

# text
# c1: coning_increment
# c2: ½ Δθ_prev × Δθ_cur
# c3: sculling_increment
# c4: ½ Δθ × Δv
# c5: NavState::step_increments
# c6: Δθ_rel = Δθ_b − C_n^b ζ
seg-f57bc89d4688 = <b>Coning ja sculling kompensatsioon strapdown-integraatorile.</b> Asenditee lisab kahe valimi <c1/> (<c2/>); { "30" } Hz jämesagedusega (5 valimit tsükli kohta) { "5" } Hz coning-keskkonna integreerimise kohta on kontrollitud, et see jälgib peenisagedusega tõde korrektsiooniga ≥ { "3" }× paremini kui naiivne juurdekasvude summeerimine. Kiiruse tee lisab <c3/> (<c4/>, Groves valem { "5.82" }) ja lahendab keha kiiruse juurdekasvu uue juurdekasvupõhise uuenduse <c5/> kaudu, kasutades kehasuhtelist pööret <c6/>, nii et Maaga seotud platvormil ei teki valesculling’ut, samal ajal kui tõeline vibratsioon käivitab täieliku liikme.

# text
# c1: src/inertial/mechanization.rs
seg-56c599250ed4 = Täielik kolmeteljeline strapdown-mehhaniseerimine NED tugisüsteemis (<c1/>).

# text
# c1: NavState { q, v_ned, p_llh }
# c2: step(gyro_b, accel_f_b, dt)
# c3: ω_in = ω_ie + ω_en
# c4: v̇ = f_n − (2 ω_ie + ω_en) × v + g_n
# c5: v_N ≈ a·t
# c6: ½ a t²
seg-d0897492e89b = <c1/> edastatakse sammuga <c2/> standardsete maapealse tugisüsteemi NED võrranditega (Groves §{ "5.4" }): keha→NED asend korrigeeritud inertsiaal-nav kiiruse <c3/> (Maa pöörlemine + transpordikiirus) järgi; erijõud lahendatud keha→NED DCM-i kaudu; kiirus integreerib <c4/> (Coriolis/transport + gravitatsioon); ning geodeetiline asukoht meridiaani/põikisuunalise kõverusraadiuse kaudu. Gravitatsioon on WGS-84 kinnine Somigliana <b>normaalgravitatsioon (loodi gravitatsioon)</b> NIMA vaba õhu kõrgusparandusega — mitte kunagi kõvakodeeritud konstant. See on tõeline kolmeteljeline navigaator, mis asendab 1-DOF skalaarse veaeelarve tee. Kontrollitud füüsikaliste invariantidega: pöörlevale Maale kinnitatud platvorm { "45" }°N juures (tajub Maa pöörlemiskiirust + { "1" } g) püsib { "60" } s jooksul { "1" } mm piires; horisontaalne põhja suunatud erijõud annab <c5/> ja <c6/> nihke; normaalgravitatsioon ühtib teadaolevate ekvaatori/pooluse/45° pinnaväärtustega ja vaba õhu langusmääraga.

# text
# c1: src/inertial/attitude.rs
# c2: Quaternion
# c3: to_dcm
# c4: from_dcm
# c5: q̇ = ½ q ⊗ ω
# c6: coning_increment
# c7: ½ Δθ_prev × Δθ_cur
# c8: src/inertial.rs
# c9: src/inertial/
# c10: crate::inertial
seg-290b08199bfb = <b>Kolmeteljeline asendiesitus strapdown INS-ile (<c1/>).</b> Ühikkvaternioonitüüp <c2/> (skalaar ees, Hamiltoni konventsioon), mis kannab keha→nav pööret, DCM-vaatega (<c3/>/<c4/> Shepperdi meetodil), Hamiltoni korrutise, telje-nurga ja pöördevektori (täpne eksponentkaart) konstruktoritega ning kvaternioonkinemaatikaga — nii esimest järku RK kiiruse uuendus (<c5/>) kui ka coning-korrigeeritud pöördevektori uuendus. Kahe valimi <c6/> (Savage / Bryan–Lewantowski, <c7/>) annab pöörlemiskiiruse ristsidestuse liikme, mille skalaarne dead-reckoning välja jätab. See on asendi alus täielikule 3-teljelisele mehhaniseerimisele, mis asendab varasema 1-DOF veaeelarve tee. Kontrollitud kinniste pööretega: konstantse kiirusega levik ühtib telje-nurga kvaternioniga { "1e-6" } täpsusega, DCM-id on ortonormeeritud ühikdeterminandiga ja coning kaob ühe telje liikumise korral. (<c8/> on nüüd mooduli kataloog <c9/>; avalik tee <c10/> on muutmata.)

# text
# c1: src/frames.rs
seg-5e6e5bba25a5 = Geodeetiliselt korrektne maajaama nähtavus (<c1/>).

# text
# c1: elevation
# c2: is_visible
# c3: visible_count
seg-69bdb1e5bfc8 = <c1/>, <c2/> ja <c3/> arvutavad satelliidi kõrguse maajaama silmapiiri kohal <b>WGS-84 ellipsoidi normaali</b> (tõelise kohaliku vertikaali) suhtes, mitte geotsentrilise radiaali suhtes — need erinevad kuni ~{ "0.19" }° geodeetilise kõrvalekalde võrra, mis on piisav, et lülitada silmapiiri lähedased satelliidid kõrgusmaski sisse või välja. Kontrollitud lõpust lõpuni (Walker-konstellatsioon levitatud, pööratud TEME→ECEF ja loetud geodeetiliselt jaamast) ning geotsentrilise lähenduse vastu.

# text
# c1: test-python-bindings
# c2: PyO3/maturin-action
# c3: maturin build
# c4: rustfmt-preview
# c5: cargo-fmt
# c6: deny
# c7: cargo-deny
# c8: taiki-e/install-action
# c9: cargo-deny-action
seg-4de1d79d2e76 = <b>CI töökindlus.</b> Töö <c1/> ehitab nüüd wheeli abil <c2/> (manylinuxi konteiner) toore hosti <c3/> asemel, kõrvaldades vahelduva <c4/>/<c5/> rustupi konflikti jooksutuspildil. Töö <c6/> paigaldab <c7/> eelehitatud binaarfailina abil <c8/> Dockeril põhineva <c9/> asemel, eemaldades Docker Hubi registrist tõmbamise ajalõpu. Kumbki muudatus ei mõjuta tehtavaid kontrolle.

# text
seg-05055c993904 = Inertsiaalne kiirus on allavoolu kättesaadav.

# text
# c1: Propagator::velocity_eci
# c2: Propagator::state_eci
# c3: StateEci { r_m, v_m_s }
# c4: Orbit::velocity_eci
seg-1228235c99b6 = <c1/> ja <c2/> (tagastavad <c3/>) toovad analüütilise TEME kiiruse, mille SGP4 juba arvutab — varem kõrvale visatud — kutsujateni m/s-des; <c4/> annab Kepleri teele ühtse kiiruse. AIAA 2006-6753 kontrolltest kontrollib nüüd kiirust ka iga etalonrea puhul (halvim kiiruse viga { "1.85e-9" } km/s kõigi { "666" } oleku üle) ja fikseerib võrreldud ridade arvuks täpselt { "666" }.

# text
# c1: ParseOpts { strict_checksum }
# c2: parse_propagators_opts
# c3: strict_checksum
# c4: ConstellationCfg
seg-8ac2598291b8 = <b>Rangem, paanikavaba TLE parsimine.</b> Read peavad olema ASCII ja neid lõigatakse ohutult (enam pole baidiindeksi paanikaid mitmebaidise sisendi korral); elemendid kontrollitakse vahemiku suhtes (kaldenurk, ekstsentrilisus, keskmine liikumine); veeru 69 kontrollsummat saab jõustada kaudu <c1/> / <c2/> ja uue lipuga <c3/> väljal <c4/> (vaikimisi leebe).

# text
# c1: adev_curve
# c2: [{tau_s, adev, n_samples}]
seg-1cd2c6621a04 = <b>Alani hälbe kõver väljundis.</b> Iga kellajooks annab nüüd välja <c1/> (<c2/>) ning brauseri mänguväljak joonistab log-log diagrammi „Kella stabiilsus (ADEV)“.

# text
seg-c76ff20811e7 = Ajaruudustiku sisendi valideerimine.

# text
# c1: TimeCfg::validate
# c2: MAX_TIME_STEPS
seg-75436d067802 = <c1/> lükkab tagasi mittelõpliku, nulli, negatiivse või liiga suure ajaruudustiku (sammu, mis on kestusest suurem, või rohkem kui <c2/> valimit) enne mis tahes mälu eraldamist, nii et väära kujuga stsenaarium tagastab vea, mitte ei põhjusta paanikat ega ammenda mälu.

# text
seg-d0a8ce50cf6e = Monte Carlo ansamblid inertsiaalpaketile.

# text
# c1: runs = N
# c2: ensemble
# c3: monte_carlo
seg-3225674ce4ea = <c1/> inertsiaalstsenaariumil käivitab N algväärtust ja annab iga mõõdiku keskmise, standardhälbe, protsentiilid ning protsentiili-alglaadimisega { "95" }% usaldusvahemiku (<c2/>). Iga inertsiaalkäitus kannab nüüd lippu <c3/>, nii et ühe realisatsiooni kvaliteedinäitajat ei peeta enam ekslikult jaotuseks. (CEP/2DRMS-i ei esitata tahtlikult — need nõuavad teekaardil olevat 3-telgset mudelit.)

# text
# c1: web/share.test.mjs
seg-2967872bfca1 = <b>Juhitud mänguväljaku režiim.</b> Brauseri mänguväljak ei viska enam toorele TOML-i seinale: „Alusta siit“ riba ühe klõpsuga stsenaariumikaartidega laadib ja käivitab läbitöötatud näite, liugurid avavad universaalsed seaded (algväärtus, ajastuse lävi) TOML-i puutumata, märkus „Kuidas seda lugeda“ selgitab tulemust ning täielik TOML on ühe kokkuvolditava jaotise taga. Iga käitust saab jagada — <b>Kopeeri jagamislink</b> kodeerib kogu stsenaariumi URL-i fragmenti (midagi ei laadita üles), nii et link taastoodab täpselt sama käituse laadimisel. Koodek on ühiktestitud (<c1/>, käivitatakse CI-s).

# text
# c1: src/sweep.rs
seg-2e47e8864718 = N-mõõtmelised parameetrite pühkimised (<c1/>).

# text
# c1: nd_sweep
# c2: SweepAxis
seg-5076a9ad20d7 = <c1/> hindab mõõdikut mitme <c2/> vahemiku täielikul Descartes’i korrutisel (mitme parameetriga kompromissuuring) reapõhises järjekorras, deterministlikult. Lisanduv — olemasolev 1-D pühkimise API on muutmata. Sõlmepõhised alglaadimisega usaldusvahemikud ja üldistamine väljaspool kellapaketti jäävad teekaardile.

# text
# c1: src/raim.rs
seg-958718831037 = <b>Tõeline hetktõmmise RAIM (<c1/>).</b> Ehtne asukohadomeeni vastuvõtja autonoomne terviklikkuse seire: see ehitab vaatejoone geomeetria nähtavate satelliitideni, moodustab vähimruutude lahenduse ja jäägid, käitab χ² jääkide vea tuvastamise testi (täpne lävi sõltuvusteta mittetäielikust gammafunktsioonist χ²/mittetsentraalsest χ²-st) ning arvutab tõusupõhised horisontaalsed ja vertikaalsed kaitsetasemed (HPL/VPL) seadistatud P_fa/P_md jaoks tuletatud tuvastamata jäänud sündmuse nihkega. See erineb stsenaariumi töövoo filtri sisemise kooskõla terviklikkuse näitajast ja <b>ei ole sellega veel ühendatud</b>; vea välistamine, häireläve/P_HMI eelarvestamine ja ARAIM jäävad teekaardile.

# text
# c1: src/allan.rs
# c2: TDEV = tau/sqrt(3) * MDEV
# c3: deviation_ci
seg-1675540acbd9 = <b>Sageduse stabiilsuse komplekt: MDEV, TDEV, HDEV + usaldusvahemikud</b> (<c1/>). Kattuva ADEV kõrval: modifitseeritud Alani hälve (eristab valget faasimüra flicker-müra omast), ajahälve (<c2/>) ja Hadamardi hälve (tõrjub lineaarse sageduse triivi täpselt välja ja koondub lahknevate punase müra tüüpide korral). χ²-põhised usaldusvahemikud (<c3/>) kasutavad sõltuvusteta normaal-/χ²-kvantiilide paari (Acklam + Wilson-Hilferty) konservatiivse mittekattuva edf-iga; mürategundispetsiifiline edf ja Stable32 arvuline vastavus jäävad teekaardile.

# text
# c1: src/frames.rs
seg-446a9ed4467c = <b>Tugisüsteemi taandamine (<c1/>).</b> GMST-põhine TEME↔ECEF pööre (sama IAU-1982 tähtajaga nagu levitaja), täpne WGS-84 geodeetiline↔ECEF Bowringi algväärtustatud iteratiivse pöördteisendusega (masinatäpne kõigil kõrgustel, sh MEO/GEO) ning geodeetiline maajaama vaatleja, mis tagastab asimuudi / kõrguse / vahemaa kohalikus Ida-Põhja-Üles tugisüsteemis. Poolusliikumist ja kaaresekundi-alust nutatsiooni ei rakendata (ainult GMST, alla kilomeetri maapinnajäljel); ITRF-täpne CIO ahel on teekaardil.

# text
# c1: src/timescales.rs
# c2: f64
seg-9f6f53583cf5 = <b>Ajaskaalade alus (<c1/>).</b> Sõltuvusteta Juliuse kuupäeva API (Gregoriuse tsiviil ↔ JD, MJD), täielik IERS-i täisarvuliste lisasekundite ajalugu (UTC↔TAI, { "10" } s aastal { "1972" } kuni { "37" } s alates { "2017" }), defineeritud TAI→TT nihe, UT1 parandus antud DUT1 kaudu ja IAU-2000 Maa pöörlemisnurk. See on ajaline alus, mille peal Maaga seotud tugisüsteemi taandamine (kavandatud) seisab. Ajahetked on ühe-<c2/> Juliuse kuupäevad (~{ "50" } µs eraldusvõime praeguse epohhi lähedal; kaheosaline JD on teekaardil) ning enne 1972. aastat kehtinud kummisekundi ajajärku ei modelleerita — mõlemad on moodulis dokumenteeritud.

# text
# c1: scripts/gen-sbom.sh
# c2: libm
# c3: docs/REPRODUCIBILITY.md
seg-6ecc053f101f = <b>Reprodutseeritavus ja päritolu.</b> Deterministlik CycloneDX SBOM-generaator (<c1/>) ning SLSA ehituspäritolu atesteering väljalaskebinaarile ja SBOM-ile; väljalaske tööriistaahel on CI-ga kooskõlas fikseeritud. Determinismi garantiid, platvormideülene <c2/> hoiatus ja kuldfikseerimise lähenemine on dokumenteeritud failis <c3/>.

# text
# c1: tests/property.rs
# c2: TimeCfg::validate
seg-3e98dcdcb82b = <b>Omadustepõhised ja fuzz-testid</b> (<c1/>). Deterministlikud juhuslikustatud testid (uut sõltuvust pole) kinnitavad invariante tuhandete sisendite üle: TLE ja stsenaariumi parserid ei tekita kunagi paanikat prügi, mitte-ASCII, mutatsiooniga ega kärbitud sisendi korral; <c2/> ei tekita kunagi paanikat NaN/inf/negatiivsete ruudustike korral; TLE kontrollsumma on kooskõlas ja puudutab ainult veergu 69; geodeetiline↔ECEF edasi-tagasi tsüklid ning TEME→ECEF pööre säilitavad normi kogu maakera ulatuses ja laias kõrgusvahemikus.

# text
# c1: libm
seg-ea252b5d7427 = Kuldtestid <b>fikseerivad nüüd kvaliteedinäitajad väli-välja haaval</b> nelja etalonstsenaariumi jaoks (tolerantsiga, mis neelab platvormideülese <c1/> kõikumise), asendades varasemad ainult võrratustel põhinevad kontrollid, nii et vaikne arvuline regressioon tabatakse kohe kinni.

# text
# c1: schema_version
# c2: 0.1
# c3: 0.7
seg-4b2a0b78984b = Tulemusartefaktides olev <c1/> tõsteti väärtuselt <c2/> väärtusele <c3/> (see oli külmutatud, samal ajal kui mootor arenes edasi).

# text
# c1: cargo-deny
seg-ecafa9d44810 = <c1/> <b>keelab</b> nüüd (mitte ei hoiata) tagasi tõmmatud (yanked) sõltuvusi.

# text
# c1: CAPABILITY.md
# c2: SCHEMA.md
# c3: INTEGRITY.md
# c4: QUANTUM-MODELS.md
# c5: REAL_TLE_GUIDE.md
# c6: Cargo.toml
seg-c48af44de5b4 = Uued dokumendid: <c1/> (aus ulatuse kaart), <c2/> (tulemusväljade teatmik), <c3/>, <c4/>, <c5/>. CI kaitse annab vea, kui README versioonimärk ei ühti failiga <c6/>.

# text
seg-8ef32ebec7f5 = <b>SGP4/SDP4 orbiidi levitamine.</b> Standardse lihtsustatud häiringute levitaja täielik sõltuvusteta realisatsioon — Maa-lähedane SGP4 koos kaugkosmose SDP4 laiendusega (Kuu-Päikese sekulaarsed ja perioodilised häiringud ning { "12" } h / { "24" } h geopotentsiaali resonants). See on valideeritud ametlike AIAA 2006-6753 („Revisiting Spacetrack Report #3“) kontrollvektorite vastu: kõik { "666" } etalonolekut Maa-lähedastel, kaugkosmose-, resonants- ja veakoodijuhtudel ühtivad halvima asukohavea korral umbes { "4" } mm täpsusega. See on mudel, mille vastu kahe rea elemendikomplektid on defineeritud, seega esindab see reaalseid konstellatsioone — eelkõige ~{ "12" } h GNSS-orbiite, mis on kaugkosmose- ja resonantsed ning mida varasem kahe keha + J2 sekulaarne mudel ei suuda tabada.

# text
# c1: orbit-sgp4-gps.toml
seg-06a77fb9233e = Konstellatsiooni, mis on antud <b>täielike kahe rea elemendikomplektidena</b> (rida { "1" } + rida { "2" }), levitatakse nüüd SGP4/SDP4-ga; konstellatsioon, mis on antud ainult rea 2 elementidena, säilitab analüütilise Kepleri kahe keha levituse muutmata kujul. Neid kahte vormi saab ühes plokis segada. Uus etalonstsenaarium <c1/> (GPS-laadne MEO konstellatsioon reaalses kahe rea vormingus, levitatud SGP4-ga) — pane sisse praegune Celestraki „gps-ops“ komplekt, et uurida töötavat konstellatsiooni.

# text
# c1: spoof
# c2: spoof-attack.toml
seg-2dbb4054e9b8 = <b>Aktiivse spuufimisrünnaku demonstraator.</b> Uus stsenaariumi liik <c1/> süstib kasvava vale aja spuufimise ja käivitab iga kella kellaabistatud terviklikkuse monitori, teatades, kas ja millal spuufimine tuvastatakse ning kas see jõuab töönõudeni tuvastamata — muutes Turvalisuse kvaliteedinäitaja konkreetseks ründe/kaitse demonstratsiooniks. Uus etalonstsenaarium <c2/>.

# text
# c1: [[constellations]]
# c2: [constellation]
# c3: orbit-multignss.toml
seg-aa0cb8038baa = <b>Mitme konstellatsiooni kättesaadavus.</b> Orbiidistsenaarium võib ühendada mitu konstellatsiooni (loend <c1/> esmase <c2/> kõrval) multi-GNSS kättesaadavuse ja täpsuse halvenemise teguri jaoks — nt GPS pluss Galileo. Uus etalonstsenaarium <c3/>.

# text
seg-9b9dcd5be0a7 = <b>HTML tulemuskaardi aruanne.</b> Iga käitus loob nüüd ka isemajandava, kaubamärgiga HTML tulemuskaardi — ühe rea kokkuvõtte, diagrammi (manustatud inertse data-URI pildina) ja täieliku JSON-i — mille CLI kirjutab JSON-i ja SVG kõrvale. Jagatav ühefaililine artefakt uuringu väljundiks või lisaks.

# text
# c1: fusion
# c2: [phase, frequency]
# c3: [position, velocity]
# c4: fusion-pnt.toml
seg-76c573048a91 = <b>Ühine sensorliitmise hindaja.</b> Uus stsenaariumi liik <c1/> käitab ühte rekursiivset Kalmani filtrit navigatsioonilahendusena — liites kella oleku <c2/> ja asukoha oleku <c3/>, mida distsiplineerib GNSS (õppides sageduse nihke ja kiiruse) ning mida katkestuse ajal abistab optiline aja edastamine — sõltumatute ennustajate komponeerimise asemel. See annab liidetud ajastuse/asukoha holdover’i ja ühise kovariatsiooni terviklikkuse. Uus etalonstsenaarium <c4/>.

# text
# c1: bias_instability
# c2: q_aa
seg-10f0501c91ef = <b>Täielikum IMU müramudel.</b> Kiirendusmõõtur modelleerib nüüd allesjäänud Alani dispersiooni liikmed lisaks konstantsele nihkele ja kiiruse juhuslikule käimisele: <b>nihke ebastabiilsus</b> (1/f flicker-põhi standardse Alani nihke ebastabiilsuse koefitsiendi juures, taaskasutades kella flicker-sünteesi) ja <b>kiirenduse juhuslik käimine</b>. Uued valikulised inertsiaalstsenaariumi väljad <c1/> ja <c2/>; GNSS-i uus lahend kalibreerib jääknihke triivi uuesti.

# text
# c1: tle
# c2: orbit-real-tle.toml
seg-251ffc7b7722 = <b>Reaalne konstellatsiooni geomeetria TLE-dest.</b> Konstellatsiooni saab anda kahe rea elemendikomplektide plokina (standardne NORAD/Celestraki vorming) välja <c1/> kaudu, nii et kättesaadavus ja täpsuse halvenemise tegur kasutavad reaalse konstellatsiooni avaldatud geomeetriat sünteetilise Walkeri mustri asemel. Mootor loeb iga TLE keskmised Kepleri elemendid ja levitab neid kahe keha mudelina — mitte SGP4-ga — mis on põhjendatud ühisest epohhist lähtuva hetktõmmise uuringu jaoks. Uus etalonstsenaarium <c2/>.

# text
# c1: sweep
# c2: threshold_ns
# c3: duration_s
# c4: quantum_q_wf
# c5: classical_q_wf
# c6: sweep-clock-stability.toml
seg-7deb93b51cc7 = <b>Kompromissuuringu parameetrite pühkimised.</b> Uus stsenaariumi liik <c1/> varieerib ühte parameetrit (<c2/>, <c3/>, <c4/> või <c5/>) lineaarses või logaritmilises vahemikus ja salvestab valitud kvaliteedinäitaja igas punktis mõlema kella jaoks, andes võrdlusdiagrammi „kuidas holdover skaleerub kella stabiilsusega?“, mida disainikompromiss vajab. Uus etalonstsenaarium <c6/>.

# text
# c1: runs
# c2: clock-ensemble.toml
seg-ef6f3e77b476 = <b>Monte Carlo usaldusribad.</b> Kella holdover’i stsenaarium võib käitada palju realisatsioone (uus valikuline väli <c1/>): iga kvaliteedinäitaja esitatakse siis keskmisena 5.–95. protsentiili hajuvusega ning diagramm varjutab iga kella mediaani ümber { "5" }–{ "95" }% veaümbriku. Ühekordne käitus jääb vaikeväärtuseks. Uus etalonstsenaarium <c2/>.

# text
# c1: eccentricity
# c2: argp_deg
# c3: j2
# c4: orbit-molniya.toml
seg-e70cc0973fa3 = <b>Ekstsentrilised orbiidid ja J2 triiv.</b> Orbiiditüüp on nüüd täielik Kepleri orbiit (poolsuurtelg, ekstsentrilisus, kaldenurk, RAAN, perigee argument, keskmine anomaalia), mida levitatakse Kepleri võrrandi lahendamisega, valikulise sekulaarse J2 sõlme regressiooni ja apsiidide pretsessiooniga. Uued valikulised stsenaariumi väljad <c1/>, <c2/> ja <c3/> ning etalonstsenaarium <c4/> ({ "12" } h väga ekstsentriline kriitilise kaldega kasutaja). Ringorbiidid säilitavad algse kinnise valemi tee bitthaaval.

# text
seg-cc041e16d418 = Hübriid- (kombineeritud PNT) pakett annab nüüd <b>Terviklikkuse</b> ja <b>Turvalisuse</b>, nii et kõik neli paketti katavad täieliku töönäitajate kvaliteedinäitajate komplekti. Terviklikkus on ajastuskanali kaitsepiiri sisaldumine Kalmani hindajast, mis on distsiplineeritud tõe külge, kuni GNSS on nominaalne, ja uuesti ankurdatud (lõdvemalt) iga optilise uuesti sünkroniseerimise juures; selle piir sisaldab lingi mõõtmismüra põhja, nii et kella, mis on lingist palju parem, hinnatakse edastatud lahenduse tegeliku müra suhtes. Turvalisus on kellaabistatud spuufimise tuvastamise skoor ajastusnõude suhtes.

# text
# c1: scripts/changelog-extract.sh
seg-e0b666457d6e = Väljalasketeated genereeritakse nüüd sildi kureeritud CHANGELOG-i jaotisest (<c1/>), nii et iga GitHubi väljalase toob esile muudatused toorete commitide loetlemise asemel.

# text
# c1: [0, 1]
seg-f785718e9454 = <b>Turvalisuse</b> kvaliteedinäitaja (varem täitmata): kellaabistatud spuufimise tuvastamise skoor kella holdover’i ja orbiidipakettide jaoks. See modelleerib terviklikkuse monitori, mis kontrollib GNSS-ist tuletatud aega vastu kella enda libistatud ennustust koherentse akna jooksul; tuvastamise põhi ühendab keskmistatud mõõtmismüra kella libisemise määramatusega, nii et vaiksem kell tuvastab väiksemaid ja aeglasemaid aja spuufimisi. Skoor esitatakse vahemikus <c1/> ajastusnõude suhtes, täites kuus töönäitajate kvaliteedinäitajat.

# text
# c1: Q = (HᵀH)⁻¹
# c2: sigma_uere_m
seg-9164140872c8 = Geomeetriast tuletatud <b>asukohatäpsus</b> orbiidipaketile: nähtavate satelliitide vaatejoone geomeetriast moodustab see disainimaatriksi ja selle kovariatsioonitegur <c1/>, andes täpsuse halvenemise tegurid (GDOP/PDOP/HDOP/VDOP/TDOP). Asukohatäpsus on asukoha DOP, skaleeritud seadistatava kasutaja-ekvivalentse vahemaa veaga (uus valikuline stsenaariumi väli <c2/>). Orbiiditulemus kannab nüüd geomeetria kokkuvõtet (lahendiga valimite osa, parim ja mediaanne PDOP ning asukoha sigma).

# text
# c1: web/
# c2: pages
# c3: summary
seg-3285502161c6 = Brauserisisene <b>mänguväljak</b> (<c1/>), mis käitab mootorit kliendi poolel WebAssemblyna: vali etalonstsenaarium või redigeeri TOML-i, käivita see ning vaata kokkuvõtet, diagrammi ja täielikku JSON-i, ilma et midagi üles laaditaks. Töövoog <c2/> ehitab ja avaldab selle GitHub Pagesis ning uus WebAssembly eksport <c3/> toetab näitu.

# text
# c1: chart
seg-0dca5318f7ce = Sildistatud y-teljed SVG diagrammidel: ruudustikujooned, numbrilised jaotusmärgised ja ühikute telje pealkiri (jagatud abifunktsiooni <c1/> kaudu), nii et suurusjärgud on loetavad.

# text
# c1: publish
seg-ce84a3d61f19 = Paketi avaldamise töövoog (<c1/>) crates.io, PyPI ja npm jaoks, kõik blokeeritud oma registri tokeni taha ja käivitatud avaldatud väljalaskega.

# text
# c1: flicker_floor
seg-0f01369fc29b = Flicker (1/f) FM põhi kella veamudelile, sünteesitud logaritmiliselt jaotatud Ornstein-Uhlenbecki protsesside summana ja kalibreeritud nii, et lame Alani hälbe põhi asub seadistatava tasemel. Vaikimisi väljas; lubatakse kella kohta valikulise stsenaariumi välja <c1/> kaudu.

# text
# c1: gyro_bias
# c2: q_arw
seg-5b7fcd386fd3 = Güroskoobi kanal inertsiaalmudelile: jääkgüroskoobi nihe ja nurga juhuslik käimine ajavad asendi (kalde) viga, mis seob gravitatsiooni horisontaalse erijõu veaga — strapdown-vea kasvu domineeriv mehhanism. Vaikimisi väljas; lubatakse sensori kohta valikuliste väljade <c1/> ja <c2/> kaudu.

# text
# c1: q_wf*T + q_rw*T^3/3
seg-efe9f10d2641 = Kaheolekuline (faas, sagedus) Kalmani kellahindaja täpse van Loani protsessimüra diskretiseerimisega. Teadaolevast olekust libisemine taastoodab täpselt analüütilise holdover’i vea kasvu (<c1/>) ning filter annab lisaks veebipõhise 1-sigma määramatuse piiri.

# text
seg-539e24f34ed1 = Kellajooks annab nüüd välja <b>Terviklikkuse</b> kvaliteedinäitaja (varem täitmata): katkestuse valimite osa, mille viga jääb filtri 3-sigma kaitsepiiri sisse, esitatud JSON-tulemuses ja CLI kokkuvõttes.

# text
# c1: orbit
# c2: orbit-gnss-challenged.toml
seg-80620c97e3f5 = Geomeetriast tuletatud GNSS-i kättesaadavus: ringorbiidi levitamine, Walker-delta konstellatsiooni generaator ja vaatejoone nähtavus (Maa varjutus pluss kõrgusmask) annavad kättesaadavuse ajajoone tegelikust orbitaalgeomeetriast. Uus stsenaariumi liik <c1/> ja etalonstsenaarium <c2/> (kosmoseaparaat GNSS-i kesta sees katkendliku katvusega).

# text
# c1: run
# c2: run_full
# c3: version
# c4: pyproject.toml
# c5: wheels
seg-67549163ad7d = Valikuline Pythoni laiendus (PyO3, abi3), mis avab <c1/>, <c2/> ja <c3/>, pakitud maturiniga (<c4/>) ning ehitatud Linuxile, macOS-ile ja Windowsile väljalaskesildi töövooga <c5/>. Sidestus on funktsiooniga blokeeritud valikuline sõltuvus: vaikeehitust, teste ja sõltuvusauditi lüüsi see ei mõjuta.

# text
# c1: run
# c2: chart_svg
# c3: version
# c4: wasm
# c5: getrandom
# c6: wasm32
seg-c76dc363f0b1 = Valikuline WebAssembly moodul (wasm-bindgen), mis avab <c1/>, <c2/> ja <c3/>, ehitatud wasm-packiga funktsiooni <c4/> all; <c5/> on sihtmärgiga blokeeritud, et kasutada platvormil <c6/> brauseri entroopiaallikat.

# text
# c1: api::run_toml
seg-cf1b0eef2201 = Jagatud <c1/> suunamine, mida kasutavad CLI ja mõlemad sidestused, nii et käsurida ja sidestused ei saa lahknema hakata.

# text
seg-8d4f855d11bd = Holdover’i hindamine on nüüd segmenditeadlik: katkestuste ajajooned jagatakse GNSS-i taasomandamise kohtades pidevateks segmentideks ja esitatud holdover on nende halvim (lühim) libisemine. Ühe katkestuse stsenaariumid on muutmata. Kehtib kella-, inertsiaal- ja hübriidhindajatele.

# text
# c1: kind
# c2: inertial
# c3: accelerometer
seg-8b3556d125ed = Inertsiaalmudeli esitatud stsenaariumi <c1/>-id on nüüd <c2/> (varem <c3/>), mis kajastab kombineeritud kiirendusmõõturi ja güroskoobi kanaleid.

# text
seg-d842f9cc0a9c = Esimene väljalase.

# text
# c1: scenario + seed + engine version
# c2: kind
seg-962b75c38735 = <b>Deterministlik simulatsioonimootor</b> hübriidse kvant/klassikalise PNT jaoks: ühine veamudeli liides, deklaratiivsed GNSS-i kättesaadavuse stsenaariumid, holdover’i / dead-reckoning’u hindajad ja kvaliteedinäitajate hindamine standardsete töönäitajate PNT kriteeriumide vastu. Tulemused on reprodutseeritavad väärtusest <c1/> (versioonitud, ennast kirjeldav JSON stsenaariumi räsiga) ja renderdatud SVG diagrammidena. CLI suunab stsenaariumid stsenaariumi <c2/>-id järgi.

# text
seg-16e574edc3a8 = <b>Neli sensoripaketti</b>, igaüks kalibreeritud avaldatud andmete järgi ja valideeritud standardse seose vastu:

# text
seg-b49bbb60c2cd = <b>Kella holdover</b> — valge FM, juhusliku käimise FM ja lineaarne vananemine; valideeritud kattuva Alani hälbega (Riley, NIST SP { "1065" }). Kiibimõõtmetega aatomkell vs strontsiumi optiline võrekell.

# text
seg-be2c5f28b256 = <b>Inertsiaalne dead-reckoning</b> — jääknihe + kiiruse juhuslik käimine, kahekordselt integreeritud asukohaveaks; valideeritud Grovesi vea kasvu seoste vastu. Külmaatomi- vs navigatsioonitaseme kiirendusmõõtur.

# text
seg-fcb0f72db736 = <b>Aja edastamine</b> — optilise vs raadiosageduslinki ajastuse värin → sünkroniseerimise korduvtäpsus → ühesuunaline kaugusmõõtmine.

# text
seg-93e5f2f70b58 = <b>Hübriidliitmine (tippülesanne)</b> — kombineeritud PNT-komplekt, mis peab hoidma nii aega kui ka asukohta, valikulise optilise satelliitidevahelise aja edastamisega kella abistamiseks.

# text
# c1: scenarios/
# c2: provenance
seg-e0a8cbe0c105 = <b>Üks tsiteeritud etalonstsenaarium paketi kohta</b> kataloogis <c1/>, iga arvparameeter kannab eelretsenseeritud viidet <c2/>.

# text
seg-8f1cc09b2513 = <b>Reprodutseeritavuse ja hoidla hügieeni kaitsed</b>; CI (vorming, clippy, testid, kaitsed, MSRV) ja sildiga blokeeritud väljalasketoru, mis käitab kõik kontrollid uuesti.

# text
seg-8b4e21f56334 = <b>Dokumentatsioon</b>: README arhitektuuridiagrammidega, valideerimisoleku aruanne, panustamisjuhend, turvapoliitika ja käitumisjuhend; Apache-2.0 litsents; probleemi-/PR-mallid ja Dependabot seadistus.

# text
seg-e26d94f06ead = Kogu ulatuses tarnijaneutraalne; eelretsenseeritud teaduslikud ja metroloogilised viited on säilitatud.

# text
# c1: NOTICE
# c2: cargo-deny
seg-84cb67686edf = Apache-2.0 litsentsi hügieen: SPDX päised kõigis lähtefailides, fail <c1/> kaubamärgi märkusega, Developer Certificate of Origin (DCO) allkiri panuste jaoks ning <c2/> sõltuvuste litsentside/nõuannete jõustamine CI-s.

# text
seg-a0f14bea7532 = Open-core positsioneerimine (README): tasuta Apache-2.0 mootor pluss Ashforde OÜ pakutav kommertstugi, integreerimine ja suletud laiendused — hoitud teenustega, mitte litsentsitasudega.

# text
# c1: CITATION.cff
seg-899815063eb1 = <c1/>, et tarkvara oleks võimalik tsiteerida.

# text
seg-15f45d8ccb0f = <s1>Eelmine</s1>Kus Kshana asub

# text
seg-cd8a14a9e8ec = <s1>Järgmine</s1>Litsentsimine

seg-05d0c798a196 = { "0.40" } lisab Artemis-klassi missiooniahela ja selle Kuu lõigu, tõendimärgise igale arvule ja tabelile, mille käivitus kirjutab, mõõdetud kella sisselugemise ja sobitamise, andmepartneri esituse kontrolli, ADS-B või AIS teadetest hinnangulise kiirgusallika piirkonna, { "0.40" } võrdlusaluse kordkampaania ning käsurea, aruanded ja Studio seitsmeteistkümnes keeles lisaks inglise keelele (masindokumendid jäävad inglise keelde). Kontrollimaatriks kasvab { "388" } reast { "401" } reani: { "176" } VALIDATED (muutumatu), { "221" } MODELLED (oli { "208" }) ja { "4" } PARTNER. Ühtki rida ei edutatud VALIDATED-iks. Stsenaariumi liigid kasvavad { "87" }-st { "92" }-ni. Iga lävi, mille eelregistreeritud võrdlus täitmata jättis, on allpool öeldud ja jääb kinnitatuks; ühtegi ei lõdvendatud. Nõuande avaldus on muutumatu: Kshana on nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade ega sertifitseerimine; vastutus jääb operaatorile.

seg-738f33f0ae8a = Teadaolevad piirangud

seg-d4062fab7ae1 = Mitteingliskeelsed käivitused võtavad umbes kaks korda kauem, sest stsenaarium käivitatakse kaks korda (üks kord inglise keeles masinfailide jaoks, üks kord valitud keeles inimese jaoks).

seg-8db6dedc627a = Mõned Studio laused on kokku pandud fragmentidest ja neis võivad puududa artiklid keeltes, millel on grammatiline sugu.

seg-86e6e35ac846 = Tõlked on masintõlked, mida ükski emakeelne kõneleja pole üle vaadanud; võrdlusallikaks on ingliskeelne versioon.

seg-dd7ee240b467 = <b>Seitseteist keelt lisaks inglise keelele</b> mootori inimesele mõeldud tekstile ning saidile ja Studiole: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans (<c1/>, <c2/>, lokaadimuutujad; <c3/> teegi, Pythoni, WebAssembly ja MCP kutsetel). Käsurea teated ja vead, käivituse kokkuvõtted, diagrammi tekst, <c4/>, liikide kirjeldused ja nõuanded on tõlgitud; masindokumendid (JSON, CSV, veakoodid, kontrollimaatriks) jäävad inglise keelde ning mitteingliskeelne käivitus täidab stsenaariumi ühe korra inglise keeles masinfailide jaoks ja ühe korra valitud keeles inimese jaoks (<a1><c5/></a1>). <b>Tõlked on masintõlked, mida emakeelsed kõnelejad pole üle vaadanud; võrdlusallikaks on ingliskeelne versioon</b>; iga keele <c6/> loetleb, mida ülevaataja peaks kõigepealt kontrollima, ja saidilehtedel on sellekohane teade. Otsusesõnad, tõendustasemed ja nõuande ulatus („mitte tüübikinnitust omav“, „mitte sertifitseerimine“, „vastutus jääb operaatorile“) on säilitatud igas keeles.

seg-7a95c263ecec = <c1/>: <b>hinnanguline kiirgusallika piirkond</b> ADS-B või AIS teadetest. Posterioor selle kohta, kus võib asuda halvenenud positsiooniteadete allikas (raadionähtavus 4/3 Maa raadiusel, kiirgusallika antenni kõrgus ja võimsus marginaliseeritud, mõjutatud õhusõidukid tõmbavad ja mõjutamata nähtavusega õhusõidukid suruvad vastu), kirjutatud piirkondadena { "50" }, { "90" } ja { "95" }%, tsentroidina koos selle määramatuse ellipsiga (mitte kunagi paljas punkt), sessioonidena ajas (algus, lõpp, kestus, mõjutatud ala, eristatavad õhusõidukid üle avaldamise miinimumi), ööpäevaprofiili ja tundidena päevas, valikulise TDOA fikseeringu liitmisega failist <c2/>. Väljundid: GeoJSON, JSON-kokkuvõte, sessioonide CSV ja SVG-joonis, igaüks kannab litsentsi, viidet autorile, meetodi id-d, eeldusi, piiranguid ja oma tõendimärgist. Teek <c3/>, Python ja WebAssembly <c4/>. MODELLED (registririda <c5/>; maatriksis on nüüd { "401" } rida, { "176" } VALIDATED, { "221" } MODELLED, { "4" } PARTNER); kalibreeritud ainult sünteetilistel andmetel, kusjuures võrdlus Jammertest { "2025" } saatjakohtadega eelregistreeriti ja käivitati üks kord: ADS-B ja AIS mõlemad NOT ASSESSABLE (avatud andmetes liiga vähe planeeritud sessioone), seega rida jääb MODELLED (<c6/>). Neutraalne sõnastus, ainult koond; kiirgusallika piirkondade avaldamine avalikus observatooriumis jääb välja lülitatuks. Sünteetiline näide on kaustas <c7/> (<a1><c8/></a1>).

seg-b8f971ebf318 = Mõõdetud kellalogid.

seg-59b240848747 = <c1/> loeb mõõdetud kellalogi üheks faasireaks: kaheksa vormingut (RINEX clock, TimeLab, TICC, linuxptp <c2/>, <c3/> ja <c4/>, chrony tracking ja statistics), igaüks dokumenteeritud alamhulk; kõik sellest väljaspool lükatakse tagasi veaga, mis nimetab leitu. Seda kasutavad <c5/> (<c6/>) ja kella liik (<c7/>, mis lisab <c8/> ploki logi SHA-256 ning kattuva ADEV, TDEV ja MTIE-ga), koos kaasasoleva stsenaariumiga <c9/> (<a1><c10/></a1>). Võrreldud allantoolsiga päris avalikel andmetel eelregistreeritud lävede vastu: esimene käivitus <b>jättis täitmata</b> B1 ({ "5" } juhtu { "11" }-st, kõik TICC ajatemplid hoitud kui <c11/>), B2, B3 ({ "7" } juhtu { "24" }-st) ja B4 (päise versiooni ei kontrollitud); pärast parandusi on B1, B3 ja B4 täidetud ning B2 on täidetud peale ühe MTIE paari, mis on kinnistatud ja ei ole mootori viga (allantools { "2024.6" } eemaldab keskmise sageduse enne integreerimist; selle faasirežiimi MTIE vastu on mootor kooskõlas täpsusega { "1e-10" }). Rida jääb MODELLED (<c12/>).

seg-400a39dbf3dd = <b>Sobitatud mõõdetud reaga käitatud holdover</b>: kella liigi <c1/> sobitab mõõdetud rea müra ja käitab selle põhjal holdoveri (<c2/>, kaasasolev stsenaarium <c3/>). Eelregistreeritud võrdlus: F1(b), F3 ja F4 täidetud; F1(a) (registreeritud juhusliku käiguga FM taastamine) <b>NOT MET</b> C3 kirjetel (konstruktsiooni poolest tuvastamatu) ja kahel kolmest C4 kirjest (juhusliku käiguga FM neeldus flicker FM-i ja triivi); F2 (müra tuvastamine allantoolsi vastu) täidetud üheteistkümnel kaheteistkümnest kirjest ja D3 puhul ning <b>NOT MET</b> D2 puhul nii nagu registreeritud (võrreldes samaväärselt täidetud). Kõik möödalasked on kinnistatud (<c4/>); plokk <c5/> ja selle käitatud holdover jäävad MODELLED (<c6/>).

seg-f1f15e102774 = <b>{ "0.40" } võrdlusaluse kordkampaania</b>, eelregistreeritud omaniku kinnitusega enne ühtki käivitust: A3 (EXPLORATORY, kaustapõhise alglaadimisega AUC faili <c1/> jaoks, { "2.5" } % kvantiil { "0.8502" } võrreldes { "0.80" }), D3 (EXPLORATORY, kolm viiest detektorist ületavad optimismilõhe { "0.05" } skaalal { "0.25" }), R3 (AUC { "1.0" }) ja R4 (P_fa { "0.0" }, P_d { "1.0" }): kõik MET, kõik MODELLED. A2, D1 ja R1 on puutumata ja jäävad <b>NOT MET</b>; siin ei sulge neid miski (<c2/>, <a1>Bench</a1>).

seg-b13f2dae66ea = <c1/>: kontrollib andmepartneri esituse vormingut ja metaandmeid (<c2/>: seade, andmefail ja SHA-256, kuidas see võeti, millised MODELLED read sellega esitatakse, litsents, avaldused) ning loeb andmeid mootori enda kellalogi või IMU lugejatega. See ei hinda midagi ega valideeri midagi. Sünteetiline näide on kaustas <c3/>.

seg-823e1abc7f92 = <c1/>: milliseid MODELLED registrireid mõõdetud andmed võiksid edutada, millised vormingud on vastuvõetavad, kuidas esitust kontrollitakse, eelregistreeritud läve vastu hinnatakse ja arvesse võetakse ning mida tähendavad PARTNER ja VALIDATED; omaniku jaoks kontaktimärkme mustand failis <c2/> (midagi ei saadeta).

seg-34bdcfd66ded = Hoidla harus, millest need dokumendid pärinevad; GitHubis veel mitte

seg-ddd45d39e8a9 = <b>Teised kampaaniad liikide <c1/> ja <c2/> täitmata lävede jaoks</b>, käivitatud nii nagu eelregistreeritud (<s1><c3/></s1>, <s2><c4/></s2>; kinnitatud enne ühtki käivitust). Iga algne möödalase jääb NOT MET ja kinnistatuks. <c5/>: kontroll taastab käivituse { "1" } lahtri lahtri haaval; viis ühe lugemisega ablatsiooni toovad { "2" } { "78" }-st täitmata lahtrist tolerantsi sisse (EXPLORATORY, läve pole); uus lävi S7b (Classic IIR paneelidele sobitatud langus-ja-põranda saatevorm) on NOT MET IIR-M paneelidel tulemusega { "3.83" } kuni { "3.95" } dB võrreldes { "3" } dB; hoitud avaldatud vastuvõtu kampaaniat ei käivitatud (allikat pole kinnitatud) (<s3><c6/></s3>). <c7/>: uued läved C3a, C3b (avastuspiir umbes { "3e-9" } m/s2), Q3a, Q3b (täpne normaaljaotuse CDF eemaldab { "1.7e-6" } erinevuse) ja G3'' on täidetud omaette lävedena ning G3' illustratiivsete priooritega on täidetud ja märgitud EXPLORATORY (<s4><c8/></s4>). Kõik jääb MODELLED. Uued avalikud elemendid: <c9/>.

seg-bc89e70f4d36 = <b>Tõendimärgis igal arvul ja tabelil, mille käivitus kirjutab.</b> Tulemuse JSON-il on võti <c1/>, diagrammi SVG-l metaandmete element ja joon joonise all ning CSV-tabelil <c2/> kommentaarirea: tase (<c3/>, <c4/> või <c5/>, ridadest nõrgim) ja nende kontrollimaatriksi ridade id-d, millele käivitus toetub. Read ja staatused on loetud maatriksist, mitte käsitsi kirjutatud; id-d on stabiilsed (<c6/> ja kaheksa kuueteistkümnendnumbrit, uus <c7/> veerg failis <c8/>, külmutatud loend failis <c9/>). Ka receiver-trust, <c10/>, <c11/>, marsruudi ekspositsiooniaruandes ning allkirjastatud <c12/> sees igas tõendipaketis (<c13/> { "1.1" }; <c14/> teatab taseme; enne { "0.40" } tehtud paketid kontrollitakse muutumatuna). <c15/> ebaõnnestub, kui joonisel pole silti, silt on maatriksiga vastuolus või uus failikirjutaja pole ei märgitud ega põhjusega loetletud. Väljundid, mis ei kanna ühtegi, on loetletud failis <c16/>. Kolm README demodiagrammi renderdati uuesti sildiga (selle eemaldamine taastab vanad baidid; <c17/>). Ühtki väidet ei muudetud.

seg-8abd87414bc4 = Stsenaariumi liik <c1/> (<c2/>, <c3/>): faaside ahela navigatsiooni- ja ajastusvea eelarve startimisest sisenemiseni, iga arv MODELLED ja iga sisend öeldud. Kaheksa faasiliiki: <c4/>, <c5/> (Clohessy-Wiltshire'i suhteline kovariatsioon anduriosade kaupa, dokkimisaken), <c6/> (Cowelli levitamine lõplike diferentsidega olekusiirdemaatriksiga, põlemisviga, <c7/> ja maajälgimise uuendused, Kuu valikulisest DE440 kerneli lõigust), <c8/> (lennutrajektoori nurga sigma, koridoritõenäosus, tipp-aeglustus koridoriservades, maandumisjalajälg) ja neli Kuu liiki. Üleandmisreeglid (<c9/>, <c10/>, <c11/>), tugisüsteemi ja ajaskaala teisendused omaette eelarveridadena, valikuline maajaamade võrgu pealis, mis määrab iga faasi jälgimise töötsükli, varu öeldud nõuete suhtes ja nõrgim lüli. Näide järgib avaliku NASA missioonikontseptsiooni slaidikomplekti järjestust ILLUSTRATIVE arvudega: Artemis-klassi läbiv näide { "11" } faasi kohta, Maa ja Kuu lõigud. Tsislunaarset levitamist võrreldi avaliku Artemis I trajektooriga { "72" } h kaarel lävega, mis oli enne käivitust kinnitatud failis <c12/>: <b>NOT MET</b> ({ "45.3" } km ja { "0.25" } m/s võrreldes { "5" } km ja { "0.05" } m/s). Diagnostika paigutab möödalaske viide väikesesse impulsiivsesse sündmusse etalonis; nende vahel taastab jõumudel tunnioleku mediaanil { "0.4" } m. Rida jääb MODELLED (<c13/>).

seg-67cad0a9c0c4 = Artemis-klassi missiooniahela Kuu lõik: neli stsenaariumi liiki, millest igaüks on ka liidese <c1/> faasiliik (<c2/>), kõik MODELLED.

seg-63066076a0a8 = <c1/>: suhteline navigatsioon dokkimiseni { "100" } km ringikujulisel polaarorbiidil või { "100" } km korda { "3000" } km elliptilisel polaarorbiidil (<c2/>, <c3/>). Partii Gauss-Newtoni hinnang kaarel ühendab sõiduki kohta ühe absoluutse fikseeringu illustratiivsest LCNS-klassi releekomplektist, püsiva signaali kosmoses vea (mõlemale sõidukile ühine ja sõltumatu) ja ristlingi kauguse teegi Kuu jõumudeli all. See esitab suhtelise asendi ja kiiruse sihtmärgi kohalikes telgedes, fikseeringu kättesaadavuse, keskmise normaliseeritud hindamisvea ruudu selle oodatava väärtuse suhtes, gravitatsioonilise harmoonika ignoreerimise hinna, lõplikud suhtelise anduri mudelid ainult signaalide arvu kõrval ning edasi antud 6x6 kovariatsiooni.

seg-a2d67bb5cfb3 = <c1/>: maandumishajuvuse eelarve lõunapolaarsel alal (<c2/>; <c3/> loeb LOLA DEM-i väljavõtmisest): viieolekuline telgede kaupa inertsiaalne veamudel, AFS fikseering (eraldiseisev või diferentsiaalne, kasutades liigi <c4/> korrektsioonilingi jääki), maastikusuhteline fikseering (sobitaja <c5/> oma sünteetilisel reljeefil või LOLA DEM-i sobitamise Cramer-Rao tõke) ja Kuu aeg läbi sõiduki kella (<c6/>). See esitab 3-sigma maandumisellipsi, iga abivahendite kombinatsiooni ja ellipsi Monte Carlo kalibreeringu.

seg-1babf99e8d56 = <c1/>: positsioneerimise ja ajastuse kättesaadavus asukoha ja aastaaja järgi (<c2/>; <c3/> lisab kiirtega pühitud LOLA horisondi): ühe asukoha positsioneerimisnäitaja võrdub liigi <c4/> omaga bitipealt; Maa ja Päikese nähtavus analüütilistest efemeriididest on see, mis aastaajaga muutub.

seg-bae659d0ff4d = <c1/>: tõus kohtumisorbiidile ja orbiidile tagasi kantud asendi ja kiiruse kovariatsioon (<c2/>), mille kõrval on esitatud mootori väljalülituse hajuvus.

seg-106be12d960f = <c1/>; eelregistreering, selle muudatused ja kõik tulemused, möödalasked kaasa arvatud, kaustas <c2/>.

seg-5e8880c28a67 = Eelregistreeritud failis <c1/> enne ühtki käivitust, kuue kuupäevastatud muudatusega (iga tehtud enne andmete toomist, välja arvatud muudatus { "6" }, mis parandab oleku loenduse aritmeetikaviga pärast toomist ja enne ühtki A2 tulemust; iga muudatus on failis avalikustatud). Ühtegi läve ei lõdvendatud.

seg-90adc3a3c58b = A1 (levitaja LRO rekonstrueeritud trajektoori vastu JPL Horizonsist, { "24" } h): <b>MET</b>, maksimaalne 3D-erinevus { "33" } m võrreldes lävega { "500" } m ja RMS radiaalne erinevus { "2.4" } m võrreldes { "60" } m.

seg-69f903a278eb = A2 (sama levitaja CAPSTONE'i NRHO vastu ühe 6.5-päevase tiiru jooksul): <b>NOT MET</b>, lõppasendi erinevus { "136.8" } km võrreldes lävega { "25" } km ja oskuleeriva periapsisraadiuse erinevus { "28.4" } km võrreldes { "10" } km. Rida jääb MODELLED ja möödalaske kinnistab <c1/>.

seg-32fcafe8fa07 = B1 (kohtumishinnangu kooskõla oma mudeliga) on MET neljanda hindajakujunduse puhul, keskmine NEES { "5.85" } kuni { "5.93" } vahemikus [{ "5.2" }, { "6.8" }]; kolm varasemat kujundust, laiendatud Kalmani filter kolmes variandis, jäid sellest mööda. Viies muudatus, mis tehti pärast seda, kui kaasasoleva { "2" } h stsenaariumi puhul leiti, et { "4" } { "50" }-st katsest läheb lokaalsesse miinimumi (keskmine NEES { "1e9" }), käivitab Gauss-Newtoni sobitamise kasvaval kaarel sammu poolitamisega; B1 jääb sellest puutumata ja kaasasolevad stsenaariumid annavad { "6.51" } ja { "6.33" }. Ajalugu on failis <c1/>.

seg-a4b6bfcb9984 = Siin pole midagi VALIDATED: oraaklirid testivad jagatud levitajat, mitte navigatsioonifiltrit, signaali ega eelarvet.

seg-29d014d29790 = Üks sõltuvusuuendus tarnitud teegis (esimene kirje), ülejäänud ristvalideerimise tööriistades (<c1/>).

seg-6b6a960ca7cf = <c1/>, <c2/> ja <c3/> versioonilt { "0.13" } versioonile { "0.14" } (koos <c4/> { "0.14.3" }, <c5/> { "0.17.0" } ja <c6/> versioonilt { "0.5.5" } versioonile { "0.7.10" }; samuti otsene <c7/> sõltuvus, nüüd { "0.7" }) kõrvaldavad nõuande RUSTSEC-2026-0387 (ajastuse varieeruvus teegis <c8/> { "0.5.5" }). Kshana kasutab neid teeke ainult avalike allkirjade kontrollimiseks (Galileo OSNMA juurvõti ja RFC { "3161" } ajatemplitõendid) ning allkirjastab ainult testides ühekordsete võtmetega, nii et praktiline ekspositsioon oli olematu; uuendus eemaldab nõuande ilma eira-kirjeta. Teegi ja MCP lukufailid liiguvad mõlemad; ükski kontrollitulemus ei muutu (OSNMA ja ajatempli vektoritestid läbivad muutmata kujul).

# text
seg-1a4cda9d1486 = Minimaalne toetatud Rusti versioon on nüüd { "1.88" } (nõutud RUSTSEC-2026-0387 parandusega).

seg-0d4a740afedf = [{ $version }] - 2026-10-29
