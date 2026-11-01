# docs--machine-inputs: translations (da)

seg-e9650a618b38 = ID

seg-b9f561201fda = Kilde: <c1/>

seg-536f71da4541 = Maskin- og sensorinput ({ "0.38" })

seg-1a91f96f22ab = Læsere, der bringer andre modtagere, solvere og sensorer ind i typen <c1/>. Alle er skrivebeskyttede: rene funktioner på bytes eller tekst, der returnerer den samme tidslinje som UBX-, RINEX-, Android- og NMEA-læserne, og som springer ødelagte poster over og tæller dem i stedet for at fejle. Alt her er MODELLED: formaterne er læst fra offentlig dokumentation, og intet resultat er valideret mod en ekstern reference ud over det, der er angivet.

seg-3176ffff1e44 = <b>Vejledende software.</b> Ikke typegodkendt navigationsudstyr. Operatøren er fortsat ansvarlig for fartøjets sikre navigation.

seg-367ac9b4a8a6 = Hvad `kshana imu-fit` aflæser af en IMU-log fra stilstand, fra en rigtig kørsel af motor v{ $version } på en opdigtet log ({ "20,000" } sampler ved { "100" } Hz, { "200" } s): accelerometerets hastigheds-random-walk q_va = { "4.02e-06" }, gyroens vinkel-random-walk q_arw = { "9e-08" }, biasustabiliteten { "0.00296" } og de tidlige Allan-hældninger (-0.51 og -0.49; cirka -0.5, hvor hvid støj dominerer). Tabellen ved siden af er den TOML, kommandoen udskriver. Estimatoren er kun kontrolleret på syntetiske logs. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life).

seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

seg-3ba911ed9541 = Løsningsfilen, som RTKLIB's <c1/> og RTKPOST skriver. Læst: tiden (kalender <c2/> eller GPS-uge og sekunder i ugen), positionen (breddegrad og længdegrad i grader med højde eller ECEF X/Y/Z konverteret til geodætisk) og antallet af satellitter. Tidsskalaen i kolonneoverskriften (<c3/>, <c4/>, <c5/>) bæres i etiketten. Filer med grader-minutter-sekunder afvises. Linjer, der begynder med <c6/>, er headerlinjer.

seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

seg-b73d1465ed67 = ASCII-logs (<c1/>) og binære logs (<c2/>-header), frit blandet. Layoutene følger den offentlige OEM7-dokumentation (docs.novatel.com): meddelelsesheaderne, 32-bit CRC og felttabellerne for tre logs. Poster, hvis CRC ikke stemmer, springes over og tælles.

seg-078e047b9f82 = Log

seg-5b59f661e68b = Brugt

seg-286c3fb8ac5c = løsningsstatus (kun <c1/> giver en positionsbestemmelse), breddegrad, længdegrad, højde over middelhavets overflade plus undulation (positionsbestemmelsens højde er ellipsoidal), brugte satellitter

seg-3edaffed5d65 = C/No pr. signal (dB-Hz); system fra sporingsstatusbit 16-18, signaltype fra bit 21-25

seg-5663c6812797 = modtagerstatusbit { "15" } (jammer opdaget) bliver epokens <c1/> (jamming { "2" } markeret, { "1" } ikke; RXSTATUS har intet spoofing-flag), sammenlignet med Kshanas alarmer af <c2/>; de { "1" } hjælpebit for jammer (RF1-RF6) returneres i <c3/>

seg-61d8ec169a17 = CRC-rutinen blev kontrolleret mod den CRC, som dokumentationen angiver for sit eget <c1/>-eksempel (citeret, ikke gengivet ordret); testene bruger selvskrevne linjer. Ikke læst: forkortet ASCII, andre logs. Jammer-flaget er modtagerens egen rapport, ikke Kshanas fund; at det stemmer med Kshanas monitorer er ikke validering.

seg-b6c3919c87ad = GNSS-SDR (<c1/>)

seg-0cc992f8d61b = Se <a1><c1/></a1>. NMEA- og RINEX-output fra GNSS-SDR kan allerede læses med <c2/> og <c3/>; UDP-strømmene Monitor og PVT-monitor (Protocol Buffers) videresendes som JSON-linjer af <c4/> og læses med <c5/>.

seg-cf1bf4944f6a = IMU (<c1/>)

seg-ab64a0754907 = <c1/>: en overskriftsrække med kolonnenavnene, derefter én måling pr. række. Kolonner (i vilkårlig rækkefølge, navne uden forskel på store og små bogstaver): <c2/> sekunder efter modtagerlogens ur, <c3/>, <c4/>, <c5/> drejningshastighed i rad/s, <c6/>, <c7/>, <c8/> specifik kraft i m/s². <c9/>: EuRoC MAV-layoutet <c10/> <c11/> (<c12/>, <c13/>, <c14/>); den første måling er <c15/>. Rækker, der ikke kan fortolkes, og rækker, hvis tid ikke vokser, springes over. Se <a1><c16/></a1> for, hvordan gyroens kurs bruges.

seg-f7007cf35f53 = IMU i de hybride scenarier og fusionsscenarierne (<c1/>)

seg-3fc254763f67 = Scenarierne <c1/> og <c2/> (UKF med 17 tilstande) er simuleringer: de tager sensorstøjparametre (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), ikke en målt serie. <c10/> aflæser disse parametre ud fra en IMU-log i hvile, så et scenarie kan køres med den sensor, du faktisk har:

seg-86efab73b2e6 = Metode: den overlappende Allan-deviation af det integrerede signal (<c1/>): <c2/>, det samme for z-gyroen (<c3/>), <c4/> og <c5/> som middelværdierne og <c6/> som kurvens minimum, når kurven vender opad efter det. <c7/> tilpasses ikke (den kræver en log, der er langt længere end gulvet). Rapporten angiver logens rate og spændvidde samt den tidlige Allan-hældning for hver kanal (omkring -0.5, hvor hvid støj dominerer); en log, der ikke er i hvile, eller som er for kort (under { "2000" } målinger) eller har ujævn sampling, afvises eller giver parametre, som hældningerne markerer. Tabellens proveniens nævner logens SHA-256. MODELLED: estimatoren er kontrolleret på syntetiske hvidstøjlogs med kendte koefficienter (genfundet inden for { "10" } %), ikke mod en ekstern uafhængig reference. Tilgængelig i CLI, Python (<c8/>), WebAssembly (<c9/>), MCP (<c10/>) og pluginet (<c11/>).

seg-b3c592f63798 = RTCM { "3" } MSM4 og MSM7 (<c1/>)

seg-0f8b986cff40 = En bytestrøm af RTCM { "3" }-rammer (en basestations eller en modtagers observationsoutput). Læses: MSM4- og MSM7-beskeder (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): epoken og bærebølge-til-støj-forholdet for hver signalcelle (MSM4: { "6" } bit, dB-Hz; MSM7: { "10" } bit, 1/16 dB-Hz), som er det, C/N0-monitorerne har brug for. Felterne for pseudorange og fase springes over og bruges ikke, så RTCM giver tillidsmonitorerne C/N0 og intet andet; der er ingen position i MSM. Rammer med en forkert CRC-24Q springes over og tælles.

seg-d70038a737dc = <b>Hvor layoutet kommer fra.</b> Ikke fra RTCM-standarden (et dokument, man skal betale for, og som ikke er brugt): men fra den åbne dekoder pyrtcm { "1.2.0" }, BSD 3-Clause, hvis licens og meddelelse findes i <c1/> (ejerbeslutning af { "18" } okt. { "2026" }: "brug åbne dekodere"). pyrtcm oplyser, at dens tabeller følger RTCM { "10403.3" }; Kshana bygger på de offentliggjorte tabeller under pyrtcms licens og fremsætter ingen påstand om standarden. Tid: MSM har ingen uge, så mærkerne læses <c2/>; GLONASS-epoker (Moskva-tid) flyttes til GPS-tid med GPS-UTC = { "18" } s (værdien siden 2017-01-01).

seg-ee04a86f8f00 = Kontrolleret mod: CRC-24Q's katalogkontrolværdi (<c1/> giver <c2/>) og, som en engangskontrol under udviklingen, pyrtcms egen dekoder på de samme selvskrevne rammer (samme C/N0). Prøvefilerne er selvskrevne; ingen optagelse er taget fra en virkelig modtager, så læseren er MODELLED, indtil den har læst en.

seg-94f0e4db92df = <s1>Forrige</s1>Jammertest som dommer

seg-8d660b4049e4 = <s1>Næste</s1>Modtagerprotokoller, der læses

seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

seg-b0b5f9a66eed = IMU ([log.imu])

seg-03a6e15dce0a = IMU i de hybride scenarier og fusionsscenarierne (kshana imu-fit)

seg-53ce2c4ba434 = RTCM { "3" } MSM4 og MSM7 (format = "rtcm3")
