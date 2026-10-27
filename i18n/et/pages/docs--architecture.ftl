# docs--architecture: translations (et)

# text
# c1: docs/ARCHITECTURE.md
seg-e366c6dd500e = Allikas: <c1/>

# text
seg-1f25b7fa1187 = Kshana — arhitektuur

# text
seg-b0136a82669c = Kshana on <b>üks mootor</b>, mis on jagatud tuumale kihtidena organiseeritud: <b>sensoripaketid</b> (kell, inertsiaal, aja edastamine, hübriid); <b>astrodünaamika / numbriline</b> kiht (analüütiline SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), numbriline Cowelli propagaator oma seitsme häiringu jõumudeliga, manöövri kavandamine, orbiidi määramine maajaama kaugustest ja jõumudeli sobitamine agentuuride täppisefemeriidide vastu); <b>aja ja tugisüsteemi</b> kiht (IERS (International Earth Rotation and Reference Systems Service) ajaskaalad, IAU (International Astronomical Union) 2006/2000A pretsessioon–nutatsioon ja CIO (Celestial Intermediate Origin) GCRS↔ITRS (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System) redutseerimine); <b>sulandamise</b> kiht (GNSS/INS (GNSS: ülemaailmne satelliitnavigatsioonisüsteem; INS: inertsiaalnavigatsioonisüsteem) hinnangud); ning <b>terviklikkuse, vastupidavuse, alt-PNT (PNT: positsioneerimine, navigatsioon ja aeg) ja Kuu</b> kihid (RAIM/ARAIM/SBAS (RAIM: receiver autonomous integrity monitoring; ARAIM: advanced receiver autonomous integrity monitoring; SBAS: satellite-based augmentation system), segamise ja mitmekihilise spuufimise tuvastamine, gravitatsiooni/maastiku/magnetkaardi sobitamine ning tsislunaarne PNT); ja uuemad <b>LEO-PNT</b> (madala Maa orbiidi PNT), <b>spektri</b>, <b>päikesesüsteemi ja konstellatsiooni kavandamise</b>, <b>võrguajastuse</b> ja <b>kampaania</b> kihid, koos aruande, animatsiooni ja koostalitluse kirjutajatega, mida iga käivitus saab kasutada (§1d). Kõigi nende kaudu ei tea mootor midagi „quantum“ vs „classical“ kohta: see juhib sensorite <em>veamudeleid</em> läbi GNSS-i katkestuse stsenaariumi, käivitab hinnangu ja skoorib tulemuse. Kvant- ja klassikalist seadet võrreldakse seega samal stsenaariumil, kus neid eristavad ainult nende (avaldatud, viidatud) veaparameetrid ja sõltumatud mürapõhjad (seed).

# text
seg-02110864419e = See dokument koondab struktuursed ja käitumuslikud diagrammid. §{ "1" } on sensoripaketi tuum; §1a vastendab astrodünaamika, sulandamise ja alt-PNT kihid, mis on sellest ajast lisatud; §1b–§1d uuringu-, valdkonna- ja väljundikihid. Kasutuse kohta vt <a1>README</a1>; selle kohta, mis on ja mis ei ole valideeritud, vt <a2>VALIDATION</a2>; võimekuse kaupa küpsustabeli kohta vt <a3>CAPABILITY</a3>.

# text
seg-7bcc7b5cd049 = Lühendid, mida diagrammides kasutatakse ja mida ei ole seal, kus need esinevad, lahti kirjutatud: ADEV, Alani hälve; BW, ribalaius; CAI, külmaatomite interferomeeter; CZML, Cesium Language; Δ-DOR, delta differential one-way ranging; DO-229E, RTCA (Radio Technical Commission for Aeronautics) SBAS-vastuvõtja standard; EKF, laiendatud Kalmani filter; FM, sagedusmodulatsioon; GSE, maapealne tugiseadmestik; HPL/VPL, horisontaalne/vertikaalne kaitsetase; IMU, inertsiaalmõõteseade; IOAG, Interagency Operations Advisory Group; IQ, faasis/kvadratuuris näidised; ISL, satelliitidevaheline link; ITU-T, Rahvusvahelise Telekommunikatsiooniliidu telekommunikatsiooni standardimissektor; J2–J6, Maa tsonaalsed gravitatsiooniharmoonikud astmetel { "2" } kuni { "6" }; KIF, Kshana Interchange Format; KML, Keyhole Markup Language; KPI, põhinäitaja; L1/L5, GNSS-i kandjaribad (CR3BP halo orbiitide L2 on selle asemel Maa–Kuu Lagrange'i punkt { "2" }); LEO, madal Maa orbiit; LOO, leave-one-out; LTC, koordineeritud Kuu aeg; MEO, keskmine Maa orbiit; MTIE, maksimaalne ajaintervalli viga; N2, 2. järku Hilli mitmekesisuse arv; NED, põhi-ida-alla; NTN, mittemaapealne võrk; OD, orbiidi määramine; OPS-SAT, Euroopa Kosmoseagentuuri orbiidil asuv tarkvaralabori satelliit; PPP, täppispunktpositsioneerimine; PSD, võimsusspektri tihedus; PVT, asukoht, kiirus ja aeg; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), neljandat järku ja sisseehitatud viiendat (neljandat) järku Runge–Kutta integraatorid; SH, sfääriline harmoonik; SigMF, Signal Metadata Format; SIR, sampling importance resampling; SRIF, ruutjuure infofilter; SRP, päikesekiirguse rõhk; SSC, spektraaleraldus koefitsient; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, ajahälve; TDM, CCSDS (Consultative Committee for Space Data Systems) Tracking Data Message; TLE, kahereaelementide kogum; TPL, ajastuse kaitsetase; UBX, u-blox binaarprotokoll; UHF, ülikõrgsagedus; VLBI, väga pika baasjoonega interferomeetria; VRW / ARW, kiiruse / nurga juhuslik kõnd; WASM, WebAssembly.

# text
seg-a87f668a8f97 = { "1" }. Moodulistruktuur

# text
# c1: api::run_toml
# c2: types
# c3: scenario
# c4: allan
# c5: hybrid
# c6: orbit
# c7: navsignal
# c8: κ
# c9: jamming
# c10: Q = 1/(R_c·κ)
seg-0388999448a6 = CLI (käsurealiides) ja mõlemad sidemed suunduvad läbi ühe <c1/> sisenemispunkti, nii et need ei lahku kunagi. Paketid taaskasutavad jagatud tuuma (<c2/>, <c3/>, <c4/>); pakett { "4" } (<c5/>) komponeerib pakettide { "1" }–{ "3" } mudelid ja hinnangud, mitte ei teosta neid uuesti; <c6/> tuletab geomeetriast GNSS-i ajajoone, mis seejärel toidab paketi { "1" } käivitust. Moodul <c7/> asub signaalitasemel lingibilansi ja mõõtmisdomeeni vahel: see tuletab spektraaleraldus koefitsiendi <c8/> tegelikest signaali ja segaja võimsusspektritest, millest <c9/> arvutab nüüd oma anti-jam <c10/>, mitte ei võta esinduslikku konstanti (ristkontrollitud CI-s (pidev integratsioon)); see kannab ka kauguskoodi (m-jada/Gold) kavandi kompromissi.

# text
# c1: holdover
# c2: clock_state
# c3: inertial::quantum_imu
# c4: QuantumNavBudget
# c5: AccelModel
# c6: verification
seg-cee4eb61a8e9 = Kolm täiendavat moodulit moodustavad <b>GNSS-ita vastupidavuse</b> selgroo. <c1/> vastab operatiivsele küsimusele otse — <em>kui kaua võib see kell vabalt töötada, enne kui selle ajaviga ületab eelarve?</em> — eksponeerides van-Loani väljarändevea kinnise vormi holdover-i-läveni pöördvõrdena, ristkontrollituna mitmeastmelise <c2/> kovariatsioonirekursiooni vastu. Selle inertsiaalne kaksik asub failis <c3/> (<c4/>), mis komponeerib külmaatomite interferomeetri valge müra triivi nihke ja skaalategurivea abil asukohatriivi eelarveks holdover-i jooksul (nihketerm on ristkontrollitud sõltumatu <c5/> integraatori vastu). <c6/> renderdab kogu mootori nõude–mooduli–testi–sõltumatu etaloni–oleku maatriksi, ühikutestitud invariantidega, mis keelavad sildi <em>valideeritud</em> ilma sõltumatu välise etaloni olemasoluta — nii et kinnitusväide ei saa koodist lahku triivida.

# text
seg-c7bee352c04d = 1a. Astrodünaamika, sulandamise ja alt-PNT kihid

# text
# c1: orbit
# c2: kind
seg-99c44e3a86d5 = Lisaks sensoripaketi tuumale jagavad kolm alamsüsteemi sama jagatud tuuma ja toidavad (või neid toidab) <c1/>. <b>Astrodünaamika / numbriline</b> kiht lisab mitteanalüütilise Cowelli propagaatori analüütilise SGP4/SDP4 tee kõrvale; <b>sulandamise</b> kiht kannab GNSS/INS hinnanguid; ja <b>alt-PNT</b> kiht on GPS-ita (GPS: Global Positioning System) gravitatsioonikaardi sobitamine. Need on teegi/stsenaariumi võimekused (vt <a1>CAPABILITY</a1>, millised on stsenaariumi <c2/> külge ühendatud ja millised kättesaadavad Rusti API-na (rakendusliides)).

# text
# c1: forces
# c2: integrator
seg-69f93294d2c8 = Numbrilise propagaatori jõuliikmed on vaikimisi välja lülitatud, nii et nende lubamine ei häiri kunagi väljalaskega seotud kuldseid. 17-olekuline tihedalt seotud unscented Kalmani filter (UKF) hoiab GNSS-i katkestust kvant-CAI kiirendusmõõturi tuletatud kiiruse juhusliku kõnni peal; orbiidi määramine taaskasutab sama <c1/>/<c2/>, et propageerida kandidaatolekut jälgimiskaarel.

# text
# c1: timescales
# c2: jd2
# c3: precession
# c4: nutation
# c5: cio
# c6: frames
# c7: eop
# c8: ephemeris
# c9: raim
# c10: sbas
# c11: jamming
# c12: spoof
# c13: spoof_detect
# c14: spoof_monitors
# c15: detection
# c16: navsignal
# c17: κ
# c18: jamming
# c19: Q
# c20: lunar
# c21: lunar_frame
# c22: lunar_od
# c23: cr3bp
# c24: cr3bp_jacobian
# c25: propagate_state_stm
# c26: differential_correct_halo
# c27: precise_od
# c28: lunar_od
# c29: tides
# c30: gravity_sh
# c31: igrf
# c32: altpnt/terrain
# c33: gravimeter
seg-bd87e20c284b = Sama jagatud tuum kannab ka nelja täiendavat alamsüsteemi, mida ülal ei ole joonistatud (nende paketid ilmuvad §{ "4" } väljasaatmises): <b>aja ja tugisüsteemi</b> kiht (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), mis redutseerib TEME↔GCRS↔ITRS (TEME: true equator, mean equinox) ja toidab <c8/>/maajälje paketti; <b>terviklikkuse</b> kiht (<c9/>, <c10/>) RAIM/ARAIM/SBAS jaoks; <b>vastupidavuse</b> kiht (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) segamise ja mitmekihilise spuufimise tuvastamiseks, koos <b>navigatsioonisignaali</b> kihiga (<c16/>) signaalitasemel — BPSK-R (BPSK: binary phase-shift keying) / sine-BOC (BOC: binary offset carrier) võimsusspektri tihedused, spektraaleraldus koefitsient <c17/>, mis nüüd tuletab <c18/> anti-jam <c19/>, RMS (Gabori) kauguse ribalaius, koherentne early–late DLL (delay-locked loop) koodi jälgimise värin ja mitmeteelevi vea ümbrik (signaali toimivuse analüüs, <b>mitte</b> RF-kasuliku koormuse (RF: raadiosagedus) / antennisüsteemi riistvara kavandamine — kasuliku koormuse partneri roll); ning <b>Kuu / tsislunaarne</b> kiht (<c20/>, <c21/>, <c22/>, <c23/>) CR3BP (ringpiiratud kolme keha probleem) dünaamika jaoks — sealhulgas { "6" }×{ "6" } olekuülemineku maatriks ja ühekordse laskmisega diferentsiaalparanduspõhine meetod (<c24/>, <c25/>, <c26/>), mis annab tõeliselt perioodilisi halo/NRHO (NRHO: peaaegu sirgjooneline halo orbiit) orbiite, taastoodab avaldatud L2 lõunapoolse { "9" }:{ "2" } NRHO (Gateway orbiit) perioodil ≈ { "6.57" } d / perilunil ≈ { "3,250" } km (avaldatud ≈ { "6.56" } d / ≈ { "3,370" } km); parandatud orbiidi selenotsentriline MCI/MCMF (MCI: Kuu-keskne inertsiaal; MCMF: Kuu-keskne, Kuuga seotud) teisendus ja perekonna jätkamine jäävad järgnevateks töödeks ning NRHO on CR3BP (ringjooneline, Päikeseta) lahend, mida ei ole valideeritud päris LANS/Gateway (LANS: Lunar Augmented Navigation Service) efemeriidi vastu — ja LunaNeti terviklikkus. Agentuuride efemeriidi jõumudeli sobitus (<c27/>, <c28/>, <c29/>, <c30/>) ja täielik alt-PNT väljade komplekt (<c31/>, <c32/>, <c33/>) täiendavad moodulite loendit; mooduli kaupa küpsuse kohta vt <a1>CAPABILITY</a1>.

# text
seg-05f8c8c84d15 = 1b. Vastupidavuse uuringud, masinõppe hindamine ja reprodutseeritavad artefaktid

# text
# c1: kind
# c2: cargo run --example
# c3: --bin
seg-7350971daf4e = Viis täiendavat moodulirühma moodustavad projekti uurimisartiklite taga oleva <b>avatud, reprodutseeritava uuringu</b> kihi. Erinevalt stsenaariumi <c1/>-idest jõutakse nendeni <c2/> / <c3/> generaatorite kaudu, mis kirjutavad <b>bait-baidilt deterministlikke</b> artefakte (fikseeritud algväärtused, registreeritud mootori versioon + konfiguratsiooni räsi). Kõik on <b>MODELLED</b> (sünteetiline või avaliku andmestiku kalibreerimine) ja kannavad ausaid valideerimissilte — ükski neist ei ole sertifikaat.

# text
# c1: tpl
seg-86b177166f0e = <b><c1/></b> — tingimuslik ajastuse kaitsetase: holdover-iga piiratud piir <em>tuvastamata</em> ajaveale spuufimise all, komponeerides k-σ monitori põranda, van-Loani väljarändevea dispersiooni tuvastusviivituse jooksul ja CUSUM (cumulative sum) aja-alarmini; kalibreeritud päris salvestatud spuufimisel (JammerTest { "2024" }). Lõplikku <em>tingimusteta</em> piiri ei ole — TPL on tingimuslik sellel, et sõltumatu ristkontroll tuvastab rünnaku.

# text
# c1: resilience/
seg-8c9d1d90dc8e = <b><c1/></b> — raamistikuga ühtlustatud PNT-vastupidavuse skoorimismootor (DHS (Department of Homeland Security) RPCF (Resilient PNT Conformance Framework) kategooriad) pluss otsuse ebastabiilsuse uuring: Dirichlet' kaalumissimpleks, Kendall-τ järjestuse ebastabiilsus, top-1 võitja ümberminemise määr ja ühisrežiimi <b>mitmekesisuse kollaps</b> (Hill-N2), terviklikkuse räsiga kinnitusaruande ja { "35" } käsitsi tuletatud sõltumatu etaloni testiga. Vt <a1>RESILIENCE-CROSSWALK</a1>. Sünteetilised arhitektuurid, mis on ühtlustatud RPCF v2.0-ga — enesehinnang, mitte sertifikaat.

# text
# c1: impairment_eval
# c2: impairment_study
# c3: impairment_ml
# c4: eval_stats
seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — RF-häirete optimismilõhe uuring: märgistatud sünteetiline korpus ja detektoriagnostiline ROC/AUC (ROC: receiver operating characteristic; AUC: area under the curve) raamistik, 13-detektoriline paneel (energia/AGC/SQM/pariteet (AGC: automaatne võimenduse reguleerimine; SQM: signaalikvaliteedi monitooring) pluss algväärtustatud logistilise regressiooni ja ühe peidetud kihiga MLP (MLP: mitmekihiline pertseptron) detektorid), jaotusesisesed vs jaotusevälised skaleerumisseadused permutatsiooninulliga ning jaotusevälise halvenemise leave-one-out ennustaja. Hindamismõõdikud on bait-baidilt valideeritud scikit-learn'i vastu.

# text
# c1: sdr
# c2: realdata
seg-36206681024f = <b><c1/> / <c2/></b> — tarkvaraliselt defineeritud vastuvõtja esiots (töötlemata IQ/IF (IQ: faasis/kvadratuuris; IF: vahesagedus) → korrelaatori early/prompt/late kraanid → SQM) ja sissevõtuadapterid (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid), mis lasevad samadel detektoritel töötada kohapeal esitatud salvestistel; hoidlasse ei ole sisse kantud ühtegi andmestikku.

# text
# c1: crossover
# c2: quantum_trade
seg-fefd78868fc2 = <b><c1/> / <c2/></b> — kvant- ja klassikalise vastupidavuse ristumiskaart parameetrite määramatuse all ning mõõdetud ADEV holdover-i kasu kompromiss; kompromissi numbrilised tuumad on valideeritud scipy vastu.

# text
seg-5749f1300772 = 1c. Terviklikkuse, GNSS-i, sügava kosmose, Kuu ja missiooni kihid

# text
# c1: api
# c2: verification
seg-f44755d6d921 = Ülejäänud valdkonnad ühendatakse sama <c1/> väljasaatmisega ja taaskasutavad jagatud tuuma, tugisüsteeme ja geomeetriat. Kõik siin on <b>MODELLED</b>, kui just <c2/>-maatriksi rida ei viita välisele sõltumatule etalonile (RAIM tuum vs SciPy, SBAS vs RTKLIB (avatud lähtekoodiga reaalajas kinemaatilise positsioneerimise teek) fork, gnss_lib_py DOP (täpsuse halvenemise tegur) tuum, OPS-SAT hindamine, Kuu ARAIM kaitsetaseme tuum, tarnijate vaheline Kuu efemeriidi kooskõla) — ülejäänud Kuu komplekt ja kvantdemonstraator on modelleeritud, illustratiivsed, avaliku allikaga ega kanna TRL (tehnoloogia valmidustase) / pärandi / agentuuri kinnituse väidet.

# text
seg-044940c8d052 = 1d. LEO PNT, spekter, päikesesüsteem, võrguajastus, kampaaniad ja väljundid

# text
# c1: kind
# c2: api
seg-253a26d9cc5d = Uusimad kihid järgivad sama mustrit: igaüks on üks või mitu stsenaariumi <c1/>-i, mis saadetakse välja failist <c2/>, ehitatud jagatud tuumale ja MODELLED, kui just maatriksi rida ei nimeta välist sõltumatut etaloni.

# text
seg-e47cccd54da3 = Liigipõhine detail on failides <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> ja <a13>INTEROP</a13>.

# text
seg-d04b21c7cb6c = 1e. Vastuvõtja usalduse, tõendite, telemeetria, väljaõppe ja compliance-kihid ({ "0.35" })

# text
# c1: api
# c2: receiver-trust
seg-84ee122959b4 = Need kihid loevad vastuvõtja enda logi või kirjutavad faile teiste tööriistade jaoks; ükski neist ei sünteesi ega edasta raadiosageduslikku signaali. Need asuvad <c1/> kõrval, mitte stsenaariumi liikide all, välja arvatud <c2/> ise, mis on stsenaariumi liik. Kõik on MODELLED, kui just maatriksi rida ei nimeta välist sõltumatut etaloni, ja merendusväljundid on nõuandvad, mitte tüübikinnitust omav navigatsiooniseade.

# text
seg-aab745a65e76 = Moodul

# text
seg-9d17ad3e87c8 = Dokumenteeritud failis

# text
seg-920b6b14c0e2 = skoorib vastuvõtja logi epohhi kaupa usaldusmonitoridega; laevaplatvorm lisab merendusmonitorid ja skoori vahemikus 0–100 koos põhjustega

# text
seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

# text
# c1: $PKSHT
# c2: LiveEngine
seg-c311dfc2a161 = sama skoorimine voos selle saabudes (stdin, lisatav fail, TCP või UDP), lause <c1/> ja valikuline värav; <c2/> on selle kogu sisu ilma sisendi ja väljundita

# text
seg-07b2d6edf7b9 = allkirjastatud, räsiahelaga logi akna, selle konfiguratsiooni ja mootori tulemuse pakett, kontrollitav võrguühenduseta; valikuline RFC { "3161" } ajatempli token

# text
# c1: otlp
seg-32d08730b9c0 = usaldusvoog Prometheuse mõõdikutena, syslog-sündmused (CEF või LEEF) ja valikuline OpenTelemetry (funktsioon <c1/>, vaikimisi väljas)

# text
seg-53311b8c3b93 = sünteetiline sillasüsteemi NMEA { "0183" } stsenaarne segamise (jamming), kõrvalejuhtimise (drag-off), aja spuufimise ja taasesituse sündmustega ning juhendaja logiga meeskonna koolituseks (ainult tekst)

# text
seg-f7cc3cfbdfc6 = koondatud halvenenud navigatsiooni kaardid avatud litsentsiga õhusõidukite ja laevade aruannetest ning marsruudi kokkupuude nendega; ainult kohalikud failid

# text
# c1: osnma::cli::verify_report
seg-83fe3c87e2d5 = Galileo OSNMA vastuvõtjapoolne verifitseerija: loeb I/NAV-lehti (tavalehed, vektor-CSV, UBX-voog), kontrollib allkirjastatud võtit, TESLA ahelat ja MAC-e ning teatab satelliidi kaupa, kas navigatsiooniandmed on autenditud; <c1/> on ainus tee, mida jagavad käsurida, Python ja WebAssembly; ainult autentimise olek, mitte terviklikkuse teenus

# text
seg-bf8cd5a45deb = OSNMA

# text
# c1: run_from_text
# c2: assess_texts
seg-843a83b82283 = seostab Kshana väljundid avalike vastupidavusraamistikega ja täidab seose tulemusdokumentidest; <c1/> ja <c2/> võtavad sisendiks tekste, mitte teid

# text
seg-e16c483479ce = stsenaariumi sõiduki liikumine ja sündmused liikumis-CSV-na, NMEA-na, teekonnapunktide tekstina ja sündmuste failidena laboratoorse GNSS-simulaatori jaoks; signaali ei kirjutata

# text
seg-044c58c98397 = Paatide integratsioonid (Signal K plugin, OpenCPN gate mode ja viiteversioon) kutsuvad käsurearistvahendit; vt <a1>MARINE-INTEGRATIONS</a1>.

# text
seg-cb8d8ff847eb = { "2" }. Mootori konveier (käivituse kohta)

# text
seg-53e9e596ca44 = Iga käivitus juhib ühte andurimudelit läbi ajavõrgu, distsiplineerides seda alati, kui GNSS on nominaalne, ja lastes sel katkestuse ajal vabalt töötada (holdover / dead-reckoning).

# text
# c1: classical_seed = seed + 0x9e3779b97f4a7c15
seg-257407f3c375 = Stsenaarium käivitab selle konveieri kaks korda — üks kord kvantanduri ja teine kord klassikalise anduri jaoks — <b>sõltumatute algväärtustega (seed)</b> (<c1/>), et kaks müra realisatsiooni ei oleks omavahel korreleeritud.

# text
seg-4659e89ba5f5 = { "3" }. Veamudeli liides (laiendamispunkt)

# text
# c1: step()
seg-7b70e8b1b98a = Iga andur realiseerib sama mõtte: olekuga objekt, mille <c1/> edendab selle sisemist stohhastilist viga ja mille kogunenud olek loetakse välja igal taktil. Kellad annavad kogunenud faasi; kiirendusmõõturid annavad kahekordselt integreeritud asukoha; lingid annavad mõõtmise kohta värina.

# text
# c1: ModelSpec { id, kind, provenance, params }
# c2: provenance
seg-79ab76c6dbc0 = <c1/> liigub tulemusse kaasa, nii et iga väljundi arv on jälgitav väljaandes <c2/> nimetatud avaldatud allikani.

# text
# c1: HoldoverEstimator
# c2: KalmanClock
# c3: q_wf·T + q_rw·T³/3
seg-514c49659947 = Analüütilise <c1/> kõrval käivitab kellapakett kahe olekuga (faas, sagedus) Kalmani filtri (<c2/>), mille protsessimüra vastab tõelisele mudelile. Katkestuse ajal inertsist liikudes kasvab selle faasivea dispersioon täpselt väärtuseni <c3/> — analüütiline holdover-i seos — ning selle veebipõhist 1-σ piiri kasutatakse <b>terviklikkuse</b> kvaliteedinäitaja (figure of merit) täitmiseks (nende katkestusvalimite osakaal, mille viga jääb k-σ piiri sisse).

# text
seg-7404589deb40 = { "4" }. Suunamine (CLI ja sidemed)

# text
# c1: api::run_toml(src)
# c2: kind
# c3: { json, svg, summary, csv }
# c4: csv
# c5: report.html
# c6: report.json
# c7: --export
# c8: --animate
seg-6138513a43f7 = <c1/> on ainus sisenemispunkt: see vaatab ülemise taseme välja <c2/>, deserialiseerib sobiva stsenaariumi, käivitab paketi ja tagastab <c3/> (<c4/> on olemas ainult nende liikide puhul, mis avaldavad reprodutseeritavuse tabeli). CLI kirjutab need failidesse, lisaks aruande (<c5/>, <c6/>) ja mis tahes väljundi <c7/> / <c8/>; Pythoni ja WebAssembly sidemed tagastavad need peremeesrakendusele. Üks suunamine, ei mingit lahknevust.

# text
# c1: ScenarioKind
# c2: kind
# c3: clock
# c4: serde
# c5: kind
# c6: kind
# c7: KshanaError::InvalidInput
seg-524f749be364 = Suunamine toimub tüübitud enum-i <c1/> alusel, mida sobitatakse ammendavalt (vt järgmist alajaotust), nii et paketi lisamine on kompilaatori kontrollitud muudatus. Puuduv <c2/> langeb tagasi paketile <c3/>, nii et olemasolevad ühe liigi stsenaariumid deserialiseeruvad muutumatult (<c4/> ignoreerib iga stsenaariumistruktuuri välja <c5/>). Tundmatu <c6/> lükatakse tagasi veaga <c7/>, mis nimetab lähima sisseehitatud liigi, kui nimi näib olevat kirjaviga.

# text
seg-eedaeae2a7e7 = Tüübitud suunamine ja struktureeritud API

# text
# c1: ScenarioKind
# c2: ScenarioKind::classify(src)
# c3: kind
# c4: run_toml
seg-ca47f566eaee = Suunamine toimub tüübitud enum-i <c1/> alusel, mitte toorsõne sobitamisega: <c2/> lahendab välja <c3/> variandiks ja dispetšer sobitab seda ammendavalt — paketi lisamine on kompilaatori kontrollitud muudatus, mitte sõnevea küsimus. Stringi tagastava <c4/> kõrval (säilitatud CLI ja olemasolevate sidemete jaoks) on kaks tüübitud liidest:

# text
# c1: run_scenario(src) -> Result<RunOutput, KshanaError>
# c2: InvalidInput
# c3: NonConvergence
# c4: Unsupported
# c5: IoError
# c6: kind_tag()
# c7: error_kind(toml)
seg-167c47049329 = <b><c1/></b> — tüübitud sisenemispunkt struktureeritud veaklassifikatsiooniga (<c2/>, <c3/>, <c4/>, <c5/>). Iga viga kannab stabiilset <c6/>, nii et kutsuja saab hargneda tõrkekategooria järgi, selle asemel et sõnumit parsida. Sidemed pakuvad seda kui <c7/>.

# text
# c1: list_scenario_kinds() -> Vec<ScenarioMeta>
# c2: list_scenario_kinds_json()
# c3: list_kinds()
seg-1943051b3b20 = <b><c1/></b> (ja <c2/>, mis on sidemetes avatud kui <c3/>) — programmeeritav introspektsioon: iga liigi nimi, kirjeldus ning kohustuslikud ja valikulised väljad kasutajaliidese (UI) ja märkmikuga automaatse täitmise jaoks.

# text
seg-630243592256 = Kshana laiendamine välise paketiga

# text
# c1: api
seg-d1adedd2c08b = Kolmanda osapoole pakett realiseerib kaks väikest, semver-stabiilset tunnust (trait) moodulist <c1/>:

# text
# c1: ExternalPack
# c2: register_into(&mut PackRegistry)
# c3: src/registry.rs
# c4: jamming
# c5: Scenario
# c6: ErrorModel
seg-d01471b13324 = <c1/> sisaldab ka vaikemeetodit <c2/>, mis ei tee midagi, kui pakett ei vali registri suunamisõmblust failis <c3/>. Sisseehitatud pakett <c4/> on ühendatud tunnuse <c5/> kaudu kui läbitöötatud näide; puust väljaspool olevad paketid järgivad sama lepingut ilma tuuma hargnemata (peegeldades laiendamispunkti <c6/> jaotises §{ "3" }, mida kasutab privaatne vastupidavuskiht).

# text
# c1: ErrorModel
# c2: Scenario
# c3: ExternalPack
seg-5b0449d96bc3 = Kshanal on seega <b>kaks stabiilset laiendusõmblust</b> — lisa <em>andur</em>, realiseerides <c1/> (§{ "3" }), või lisa tervikuna <em>stsenaariumi liik</em>, realiseerides <c2/> + <c3/> — mõlemad on semver-stabiilsed ja kumbki ei nõua tuuma hargnemist:

# text
seg-3928a007756b = { "5" }. Hübriidne kulminatsioon

# text
# c1: pnt_holdover
seg-7f38e825519a = Hübriidpakett käivitab <em>komplekti</em> (üks kell + üks inertsiaalandur) ja nõuab, et <b>nii</b> ajastus kui ka asukoht püsiksid spetsifikatsioonis; <c1/> on aeg, kuni üks neist rikub piiri. Valikuliselt sünkroniseerib optiline satelliitidevaheline link katkestuse ajal <b>kella</b> uuesti — ainult aja abistamine; asukohta uuesti ei sünkroniseerita, sest aja edastamine annab aja, mitte asukoha. Just see eristab inertsiaalanduri piiravaks teguriks.

# text
seg-17a8683f0982 = { "6" }. Geomeetriast tuletatud GNSS-i kättesaadavus

# text
# c1: orbit.rs
# c2: Propagator
# c3: Orbit
# c4: Sgp4
# c5: build_timeline
seg-afdb141ac367 = <c1/> on deterministlik, sõltuvusteta geomeetriakiht. <c2/> on kas analüütiline Kepleri <c3/> (kahe keha, valikuliselt sekulaarse J2-ga) või täielik <c4/> propageerija, mis on ehitatud täielikust kaherealisest elemendikomplektist; Walkeri delta generaator toodab sünteetilisi konstellatsioone ning silmapiirinähtavus = Maa varjutus + kõrgusmaskeering. Nähtavate satelliitide arv seotakse GNSS-i olekuga (≥{ "4" } = nominaalne, { "1" }–{ "3" } = halvenenud, { "0" } = keelatud) ja <c5/> muudab selle kättesaadavuse ajajoonaks, mis juhib standardset kella holdover-i käivitust. Kättesaadavus on seega <em>tuletatud geomeetriast</em>, mitte käsitsi koostatud, samal ajal kui käivitus, hindaja ja punktiarvestus jäävad muutumatuks.

# text
# c1: sgp4.rs
seg-da82c97ac5c8 = Täieliku TLE-na antud konstellatsiooni propageeritakse SGP4/SDP4 mudeliga failis <c1/> (kontrollitud AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 vektorite vastu); ainult rea 2 elementidega satelliidid kasutavad edasi analüütilist kahe keha rada. Neid kahte võib ühes konstellatsiooniplokis segada.

# text
seg-a47031620b54 = { "7" }. Sidemed

# text
# c1: python.rs
# c2: wasm.rs
# c3: --features python
# c4: --features wasm
# c5: cargo deny --all-features
# c6: api::run_toml
# c7: web/
# c8: run
# c9: run_all
# c10: chart_svg
# c11: summary
# c12: table_csv
# c13: list_kinds
# c14: error_kind
# c15: version
# c16: encode_permalink
# c17: decode_permalink
# c18: export_sp3
# c19: export_omm
# c20: export_oem
# c21: api
# c22: mcp/kshana-mcp
# c23: rmcp
# c24: run_scenario
# c25: list_scenario_kinds
# c26: validate_scenario
# c27: list_example_scenarios
# c28: get_example_scenario
# c29: report_scenario
# c30: animate_scenario
# c31: list_export_formats
# c32: export_interop
# c33: import_route
# c34: export_sp3
# c35: export_omm
# c36: export_oem
# c37: export_table_csv
# c38: assess_receiver_log
# c39: bundled-scenarios
# c40: ide/jetbrains
# c41: kshana
seg-57fb29fdd9d9 = Tuum kompileerub muutmata natiivseks, Pythoni laiendiks ja WebAssembly-ks. Pythoni (<c1/>, PyO3 abi3) ja WebAssembly (<c2/>, wasm-bindgen) moodulid on valikulised, funktsiooniga lülitatavad sõltuvused (<c3/> / <c4/>): vaikeversioon ja testikomplekt ei kompileeri neid kunagi, samas kui sõltuvusauditi värav (<c5/>) kontrollib nende sõltuvuspuid, sest need kastid (crates) tarnitakse wheel-paketis ja npm-paketis. Mõlemad kutsuvad <c6/>, nii et iga pind tagastab identsed tulemused. WebAssembly moodul toetab brauseri mänguväljakut kaustas <c7/> ja ekspordib kolmteist funktsiooni: <c8/>, <c9/> (üks mootori käivitus, mis tagastab tulemuse, graafiku, kokkuvõtte ja tabeli koos), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, jagatava URL-i (URL: veebiaadress) kodek <c16/> / <c17/> ja kolm eksportijat <c18/> / <c19/> / <c20/>, mis toetavad mänguväljaku eksporditavalikut. Kaks täiendavat sissepääsu viivad sama <c21/> juurde: <b>MCP (Model Context Protocol) server</b> (<c22/>, tööruumist välja jäetud <c23/> kast, mis pakub viisteist tööriista — <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; kaks näitetööriista loevad komplekteeritud stsenaariume teegi vaikimisi väljalülitatud funktsiooni <c39/> kaudu, mille lülitab sisse ainult see server) ja <b>JetBrains IDE (integrated development environment) plugin</b> (<c40/>, Kotlini projekt, mis kutsub välja CLI <c41/>, mitte ei seo teeki).

# text
# c1: --features python
# c2: --features wasm
# c3: --features bundled-scenarios
# c4: xval/*
seg-a6620e0d6eef = Funktsioonipõhine lülitamine: Python ja WASM on <c1/> / <c2/>; komplekteeritud stsenaariumide tabel on <c3/> (MCP serveri ainus kasutus); MCP server ja ristkontrollid <c4/> on tööruumist VÄLJA JÄETUD kastid; IDE plugin ei seo midagi — see käivitab CLI.

# text
seg-7bc5df56e4e5 = { "8" }. Determinism ja reprodutseeritavus

# text
# c1: ChaCha8Rng
# c2: (scenario, seed, engine version) → identical bits
seg-fb95c37c7bb9 = Kogu juhuslikkus liigub läbi ühe algväärtustatud (seeded) <c1/> käivituse kohta; sammude järjekord on fikseeritud, seega <c2/>.

# text
# c1: scenario_hash
# c2: scripts/check-reproducible.sh
seg-e026c87beb26 = Tulemus kannab SHA-256 (SHA: Secure Hash Algorithm) väärtust <c1/>; <c2/> käivitab viitestsenaariumi kaks korda ja kinnitab baidi baidi haaval identset väljundit.

# text
# c1: wasm32-unknown-unknown
seg-42a3bdcbd99f = Sama mootor kompileerub natiivseks, Pythoni laiendiks ja sihtmärgiks <c1/> brauserisisesteks käivitusteks, mis annavad samad arvud.

# text
seg-12e00717c2d4 = { "9" }. Edasilükatud / tulevane struktuur

# text
seg-8a8e1b93b704 = Astrodünaamika, liitmise (fusion) ja alt-PNT kihid jaotises §1a — täielik SGP4/SDP4 propageerija, numbriline Cowelli propageerija seitsme häiringu jõumudeli ja kahe adaptiivse integraatoriga, manöövri/trajektoori kavandamine, orbiidi määramine, 15-/8-/17-olekulised GNSS/INS hindajad, seotud kella+asukoha filter ning gravitatsioonikaardi sobitamine — on kõik valmis, koos Security kvaliteedinäitajaga (FoM) aktiivse spuufimise demonstraatoriga, päris TLE/mitme konstellatsiooni geomeetriaga, Monte Carlo ribadega, kompromissiuuringute pühkimistega, prinditava HTML-aruandega (HyperText Markup Language) koos selle masinloetava kaksikuga ning release/publish/wheels/pages töövoogudega.

# text
# c1: hybrid-ukf
seg-318ad50d3826 = Mitu siia kunagi tulevase tööna kantud võimekust on vahepeal <b>valmis</b> saanud ja on käsitletud eespool või jaotises <a1>VALIDATION</a1>: täielik IAU 2000A nutatsioon ja pööripunktivaba CIO GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) redutseerimine (kontrollitud bitthaaval SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) vastu), EGM2008 (Earth Gravitational Model { "2008" }) geopotentsiaal astme/järguni { "70" }, <b>Lense–Thirringi</b> raamikaasaviimise liige, tahke/ookeani/atmosfääri looded, DE-klassi (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhas Rusti planeetide geomeetria tööriistakomplekt)) efemeriidi ristvalideerimine, numbrilise Cowelli propageerija väline Orekit { "12.2" } ristvalideerimine ({ "0.08" } m { "24" } h jooksul) ning partii- ja järjestikuse orbiidi määramise ristvalideerimine, ja 17-olekuline tihedalt seotud navigaator, mis on avatud stsenaariumi liigina <c1/>.

# text
# c1: [Unreleased]
# c2: .gfc
# c3: xval/high-degree-gravity/
# c4: space-weather
seg-068119b15b27 = Ülejäänud jätkutööd on jälgitavad failis <a1>CHANGELOG</a1> <c1/> ning võimekuse kaupa teekaart failis <a2>CAPABILITY</a2>: välise sõltumatu etaloni väärtus EGM (Earth Gravitational Model) kõrgastme hindaja jaoks täpselt polaarteljel ja pyshtools-puhas pooluse lähedane võrdlus (hindaja astmeni { "2190" } ja selle käitusaegne <c2/> laadija on olemas, MODELLED; vt <c3/>), ajas muutuv kosmoseilma draiver valikulise NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) pidurdustiheduse taseme jaoks (vaikimisi pidurdustihedus on staatiline eksponentmudel ning liigi <c4/> Jacchia-71 tihedust iseloomustatakse NRLMSISE-00 suhtes, kuid ei asendata sellega), valikulise päikese servapimenemise varju väline kontroll, kandelaine faasi GNSS/INS tihe sidumine ning päris EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques) gravitatsioonikaart alt-PNT sobitaja jaoks.

# text
# c1: ErrorModel
# c2: ExternalPack
seg-b48f69ea54b3 = Privaatne kattekihi hoidla sisaldab ekspordipiirangutega vastupidavuse süvendust; see ühendub sama liidese <c1/> kaudu (ja lepingu <c2/> kaudu jaotises §{ "4" }) avalikku mootorit muutmata.

# text
seg-2f88ab8f67e8 = <s1>Eelmine</s1>Kus Kshana töötab

# text
seg-02b0e0fdcdbe = <s1>Järgmine</s1>Kus Kshana paikneb
