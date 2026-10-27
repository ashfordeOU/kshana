# docs--machine-inputs: translations (et)

# text
seg-e9650a618b38 = ID

# text
# c1: docs/MACHINE-INPUTS.md
seg-b9f561201fda = Allikas: <c1/>

# text
seg-536f71da4541 = Masina- ja sensorisisendid ({ "0.38" })

# text
# c1: receiver-trust
seg-1a91f96f22ab = Lugejad, mis toovad stsenaariumi liiki <c1/> teisi vastuvõtjaid, lahendajaid ja sensoreid. Iga neist on ainult lugemiseks: puhtad funktsioonid baitidel või tekstil, mis tagastavad sama ajajoone, mida tagastavad UBX, RINEX, Androidi ja NMEA lugejad, jättes rikutud kirjed vahele ja loendades neid ebaõnnestumise asemel. Kõik siin on MODELLED: vormingud loetakse avalikust dokumentatsioonist ja ühtki tulemust ei valideerita välise sõltumatu etaloni vastu rohkem, kui on öeldud.

# text
seg-3176ffff1e44 = <b>Nõuandev tarkvara.</b> Mitte tüübikinnitust omav navigatsiooniseade. Operaator jääb vastutavaks laeva ohutu navigeerimise eest.

# attr:alt
seg-367ac9b4a8a6 = Mida `kshana imu-fit` loeb liikumatu IMU logist, mootori v{ $version } tegelikust käivitusest väljamõeldud logil ({ "20,000" } valimit sagedusel { "100" } Hz, { "200" } s): kiirendusmõõturi kiiruse juhuslik kõndimine q_va = { "4.02e-06" }, güroskoobi nurga juhuslik kõndimine q_arw = { "9e-08" }, nihke ebastabiilsus { "0.00296" } ja varased Alani hälbe tõusud (-0.51 ja -0.49; umbes -0.5 seal, kus domineerib valge müra). Selle kõrval olev tabel on TOML, mille käsk prindib. Hindajat on kontrollitud ainult sünteetiliste logidega. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# text
# c1: .pos
# c2: format = "rtklib-pos"
seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

# text
# c1: rnx2rtkp
# c2: yyyy/mm/dd hh:mm:ss.sss
# c3: GPST
# c4: UTC
# c5: JST
# c6: %
seg-3ba911ed9541 = Lahendifail, mille kirjutavad RTKLIB-i <c1/> ja RTKPOST. Loetakse: aeg (kalender <c2/> või GPS-nädal ja nädalasekundid), asukoht (laius- ja pikkuskraad kraadides koos kõrgusega või ECEF X/Y/Z geodeetiliseks teisendatult) ja satelliitide arv. Veerupäises olev ajaskaala (<c3/>, <c4/>, <c5/>) kantakse märgises edasi. Kraadid-minutid-sekundid failid lükatakse tagasi. Read, mis algavad märgiga <c6/>, on päiseread.

# text
# c1: format = "novatel"
seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

# text
# c1: #BESTPOSA,...*crc
# c2: AA 44 12
seg-b73d1465ed67 = ASCII (<c1/>) ja binaarsed (<c2/> päis) logid, vabalt segatud. Paigutused järgivad avalikku OEM7 dokumentatsiooni (docs.novatel.com): sõnumipäised, 32-bitine CRC ja kolme logi väljatabelid. Kirjed, mille CRC ei klapi, jäetakse vahele ja loendatakse.

# text
seg-078e047b9f82 = Logi

# text
seg-5b59f661e68b = Kasutatud

# text
# c1: SOL_COMPUTED
seg-286c3fb8ac5c = lahendi olek (ainult <c1/> annab lahenduse), laiuskraad, pikkuskraad, kõrgus keskmise merepinna kohal pluss undulatsioon (lahenduse kõrgus on ellipsoidaalne), kasutatud satelliidid

# text
seg-3edaffed5d65 = C/No signaali kohta (dB-Hz); süsteem jälgimisoleku bittidest 16-18, signaali tüüp bittidest 21-25

# text
# c1: self_report
# c2: receiver-self-report
# c3: NovatelRead.status
seg-5663c6812797 = vastuvõtja olekubitt { "15" } (segaja tuvastatud) muutub epohhi märgiks <c1/> (segamine { "2" } märgitud, { "1" } mitte; RXSTATUS-il ei ole spuufimise lippu), mida võrreldakse Kshana häiretega käsuga <c2/>; abisegaja { "1" } bitid (RF1-RF6) tagastatakse väljas <c3/>

# text
# c1: BESTPOSA
seg-61d8ec169a17 = CRC-rutiini kontrolliti CRC vastu, mille dokumentatsioon esitab oma <c1/> näite jaoks (viidatud, mitte tsiteeritud); testid kasutavad ise kirjutatud ridu. Ei loeta: lühendatud ASCII, muud logid. Segaja lipp on vastuvõtja enda aruanne, mitte Kshana järeldus; kokkulangevus Kshana seirajatega ei ole valideerimine.

# text
# c1: format = "gnss-sdr"
seg-b6c3919c87ad = GNSS-SDR (<c1/>)

# text
# c1: integrations/gnss-sdr/README.md
# c2: nmea
# c3: rinex
# c4: relay.py
# c5: gnss-sdr
seg-0cc992f8d61b = Vt <a1><c1/></a1>. GNSS-SDR-i NMEA ja RINEX väljundeid loetakse juba käskudega <c2/> ja <c3/>; Monitor ja PVT-monitor UDP-vood (Protocol Buffers) edastatakse JSON-ridadeks skriptiga <c4/> ja loetakse käsuga <c5/>.

# text
# c1: [log.imu]
seg-cf1bf4944f6a = IMU (<c1/>)

# text
# c1: format = "csv"
# c2: t_s
# c3: gx
# c4: gy
# c5: gz
# c6: ax
# c7: ay
# c8: az
# c9: format = "euroc"
# c10: imu0
# c11: data.csv
# c12: #timestamp [ns]
# c13: w_RS_S_x/y/z [rad s^-1]
# c14: a_RS_S_x/y/z [m s^-2]
# c15: t_s = 0
# c16: RECEIVER-TRUST.md
seg-ab64a0754907 = <c1/>: veerge nimetav päiserida, seejärel üks valim rea kohta. Veerud (suvalises järjekorras, nimed tõstutundetud): <c2/> sekundid vastuvõtja logi kellal, <c3/>, <c4/>, <c5/> nurkkiirus rad/s, <c6/>, <c7/>, <c8/> erijõud m/s². <c9/>: EuRoC MAV <c10/> <c11/> paigutus (<c12/>, <c13/>, <c14/>); esimene valim on <c15/>. Read, mida ei saa parsida, ja read, mille aeg ei kasva, jäetakse vahele. Vt <a1><c16/></a1>, kuidas güroskoobi suunda kasutatakse.

# text
# c1: kshana imu-fit
seg-f7007cf35f53 = IMU hübriid- ja liitmisstsenaariumidesse (<c1/>)

# text
# c1: hybrid
# c2: fusion
# c3: [accel_quantum]
# c4: [accel_classical]
# c5: bias
# c6: q_va
# c7: gyro_bias
# c8: q_arw
# c9: bias_instability
# c10: imu-fit
seg-3fc254763f67 = Stsenaariumid <c1/> ja <c2/> (17 olekuga UKF) on simulatsioonid: need võtavad sensori müraparameetreid (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), mitte mõõdetud rida. <c10/> loeb need parameetrid liikumatust IMU logist, nii et stsenaariumi saab käivitada sensoriga, mis teil tegelikult on:

# text
# c1: allan::overlapping_adev_curve
# c2: q_va = (sigma(tau0) sqrt(tau0))^2
# c3: q_arw
# c4: bias
# c5: gyro_bias
# c6: bias_instability
# c7: q_aa
# c8: imu_fit
# c9: imu_fit
# c10: fit_imu_log
# c11: /kshana-fit-imu
seg-86efab73b2e6 = Meetod: integreeritud signaali kattuv Alani hälve (<c1/>): <c2/>, sama z-güroskoobi jaoks (<c3/>), <c4/> ja <c5/> keskmistena ning <c6/> kõvera miinimumina, kui kõver pärast seda tõuseb. <c7/> ei sobitata (see vajab logi, mis on põrandast palju pikem). Aruanne sisaldab logi sagedust ja ulatust ning iga kanali varajast Alani tõusu (umbes -0.5 seal, kus domineerib valge müra); logi, mis ei ole liikumatu, või on liiga lühike (alla { "2000" } valimi) või ebaühtlaselt valimiga, lükatakse tagasi või annab parameetrid, mida tõusud märgivad. Tabeli päritolu nimetab logi SHA-256. MODELLED: hindajat kontrollitakse sünteetiliste valge müra logidega teadaolevate koefitsientidega (taastatud { "10" } % piires), mitte välise sõltumatu etaloni vastu. Saadaval CLI-s, Pythonis (<c8/>), WebAssembly's (<c9/>), MCP-s (<c10/>) ja pluginas (<c11/>).

# text
# c1: format = "rtcm3"
seg-b3c592f63798 = RTCM { "3" } MSM4 ja MSM7 (<c1/>)

# text
seg-0f8b986cff40 = RTCM { "3" } kaadrite baidivoog (baasjaama või vastuvõtja vaatlusväljund). Loetakse: MSM4 ja MSM7 sõnumid (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): epohh ja iga signaalirakku kandja-müra suhe (MSM4: { "6" } bitti, dB-Hz; MSM7: { "10" } bitti, 1/16 dB-Hz), mida C/N0 seirajad vajavad. Pseudovahemaa ja faasi väljad astutakse üle, neid ei kasutata, nii et RTCM annab usaldusseirajatele C/N0 ja mitte midagi muud; MSM-is ei ole asukohta. Kaadrid vigase CRC-24Q-ga jäetakse vahele ja loendatakse.

# text
# c1: NOTICE
# c2: GPS TOW <s>
seg-d70038a737dc = <b>Kust paigutus pärineb.</b> Mitte RTCM standardist (tasuline dokument, ei konsulteeritud): avatud lähtekoodiga dekoodrist pyrtcm { "1.2.0" }, BSD 3-Clause, mille litsents ja märkus on failis <c1/> (omaniku otsus { "18" }. okt { "2026" }: „use open decoders“). pyrtcm ütleb, et selle tabelid järgivad RTCM { "10403.3" }; Kshana tugineb avaldatud tabelitele pyrtcm-i litsentsi alusel ega esita väidet standardi kohta. Aeg: MSM ei kanna nädalat, seega märgised kuvavad <c2/>; GLONASS-i epohhid (Moskva aeg) viiakse GPS-ajale väärtusega GPS-UTC = { "18" } s (väärtus alates 2017-01-01).

# text
# c1: 123456789
# c2: 0xCDE703
seg-ee04a86f8f00 = Kontrollitud: CRC-24Q kataloogi kontrollväärtuse vastu (<c1/> annab <c2/>) ja ühekordselt arenduse ajal pyrtcm-i enda dekooderi vastu samadel ise kirjutatud kaadritel (sama C/N0). Testikaadrid on ise kirjutatud; ühtki salvestust ei ole tegelikult vastuvõtjast võetud, seega on lugeja MODELLED, kuni see on ühe lugenud.

# text
seg-94f0e4db92df = <s1>Eelmine</s1>Jammertest kohtunikuna

# text
seg-8d660b4049e4 = <s1>Järgmine</s1>Loetavad vastuvõtjaprotokollid

# text
seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

# text
seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

# text
seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

# text
seg-b0b5f9a66eed = IMU ([log.imu])

# text
seg-03a6e15dce0a = IMU hübriid- ja liitmisstsenaariumidesse (kshana imu-fit)

# text
seg-53ce2c4ba434 = RTCM { "3" } MSM4 ja MSM7 (format = "rtcm3")
