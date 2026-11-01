# docs--machine-inputs: translations (nb)

seg-e9650a618b38 = ID

seg-b9f561201fda = Kilde: <c1/>

seg-536f71da4541 = Maskin- og sensorinndata ({ "0.38" })

seg-1a91f96f22ab = Lesere som bringer andre mottakere, løsere og sensorer inn i <c1/>-typen. Hver av dem er skrivebeskyttet: rene funksjoner på byte eller tekst som returnerer den samme tidslinjen som leserne for UBX, RINEX, Android og NMEA returnerer, og som hopper over og teller ødelagte poster i stedet for å feile. Alt her er MODELLED: formatene er lest fra offentlig dokumentasjon, og ingen resultater er validert mot en ekstern uavhengig referanse utover det som er oppgitt.

seg-3176ffff1e44 = <b>Veiledende programvare.</b> Ikke typegodkjent navigasjonsutstyr. Operatøren er fortsatt ansvarlig for fartøyets sikre navigasjon.

seg-367ac9b4a8a6 = Hva `kshana imu-fit` leser ut av en IMU-logg i ro, fra en reell kjøring av motoren v{ $version } på en oppdiktet logg ({ "20,000" } sampler ved { "100" } Hz, { "200" } s): akselerometerets hastighetsrandomvandring q_va = { "4.02e-06" }, gyroets vinkelrandomvandring q_arw = { "9e-08" }, biasustabiliteten { "0.00296" } og de tidlige Allan-stigningstallene (-0.51 og -0.49; omtrent -0.5 der hvit støy dominerer). Tabellen ved siden av er TOML-en kommandoen skriver ut. Estimatoren er bare kontrollert på syntetiske logger. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

seg-3ba911ed9541 = Løsningsfilen som RTKLIBs <c1/> og RTKPOST skriver. Leses: tiden (kalender <c2/>, eller GPS-uke og sekunder i uken), posisjonen (breddegrad og lengdegrad i grader med høyde, eller ECEF X/Y/Z omregnet til geodetisk) og antall satellitter. Tidsskalaen i kolonneoverskriften (<c3/>, <c4/>, <c5/>) føres med i merkingen. Filer med grader-minutter-sekunder avvises. Linjer som begynner med <c6/> er overskriftslinjer.

seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

seg-b73d1465ed67 = ASCII-logger (<c1/>) og binære logger (<c2/>-header), blandet fritt. Oppsettene følger den offentlige OEM7-dokumentasjonen (docs.novatel.com): meldingsheaderne, 32-bits CRC og felttabellene for tre logger. Poster der CRC ikke stemmer hoppes over og telles.

seg-078e047b9f82 = Logg

seg-5b59f661e68b = Brukt

seg-286c3fb8ac5c = løsningsstatus (bare <c1/> gir en posisjonsbestemmelse), breddegrad, lengdegrad, høyde over middelhavnivå pluss undulasjon (posisjonsbestemmelsens høyde er ellipsoidisk), antall brukte satellitter

seg-3edaffed5d65 = C/No per signal (dB-Hz); system fra sporingsstatusbitene 16-18, signaltype fra bitene 21-25

seg-5663c6812797 = mottakerstatusbit { "15" } (jammer oppdaget) blir epokens <c1/> (jamming { "2" } flagget, { "1" } ikke; RXSTATUS har ikke noe spoofing-flagg), sammenlignet med Kshanas alarmer av <c2/>; de { "1" } ekstra jammerbitene (RF1-RF6) returneres i <c3/>

seg-61d8ec169a17 = CRC-rutinen ble kontrollert mot den CRC-en dokumentasjonen oppgir for sitt eget <c1/>-eksempel (referert, ikke sitert); testene bruker egenskrevne linjer. Leses ikke: forkortet ASCII, andre logger. Jammer-flagget er mottakerens egen rapport, ikke Kshanas funn; at det stemmer med Kshanas monitorer er ikke validering.

seg-b6c3919c87ad = GNSS-SDR (<c1/>)

seg-0cc992f8d61b = Se <a1><c1/></a1>. NMEA- og RINEX-utdata fra GNSS-SDR leses allerede med <c2/> og <c3/>; UDP-strømmene fra Monitor og PVT-monitor (Protocol Buffers) videresendes som JSON-linjer av <c4/> og leses med <c5/>.

seg-cf1bf4944f6a = IMU (<c1/>)

seg-ab64a0754907 = <c1/>: en overskriftsrad som navngir kolonnene, deretter ett sampel per rad. Kolonner (i hvilken som helst rekkefølge, navn uten forskjell på store og små bokstaver): <c2/> sekunder på mottakerloggens klokke, <c3/>, <c4/>, <c5/> vinkelhastighet i rad/s, <c6/>, <c7/>, <c8/> spesifikk kraft i m/s². <c9/>: EuRoC MAV-oppsettet <c10/> <c11/> (<c12/>, <c13/>, <c14/>); det første sampelet er <c15/>. Rader som ikke lar seg tolke, og rader der tiden ikke øker, hoppes over. Se <a1><c16/></a1> for hvordan gyroretningen brukes.

seg-f7007cf35f53 = IMU inn i hybrid- og fusjonsscenarioene (<c1/>)

seg-3fc254763f67 = Scenarioene <c1/> og <c2/> (UKF med 17 tilstander) er simuleringer: de tar sensorstøyparametere (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), ikke en målt serie. <c10/> leser disse parameterne ut av en IMU-logg i ro, slik at et scenario kan kjøres med sensoren du faktisk har:

seg-86efab73b2e6 = Metode: den overlappende Allan-deviasjonen av det integrerte signalet (<c1/>): <c2/>, det samme for z-gyroet (<c3/>), <c4/> og <c5/> som middelverdiene, og <c6/> som kurvens minimum når kurven snur opp etter det. <c7/> tilpasses ikke (det krever en logg langt lengre enn gulvet). Rapporten inneholder loggens rate og spenn og den tidlige Allan-stigningen for hver kanal (omtrent -0.5 der hvit støy dominerer); en logg som ikke er i ro, eller er for kort (under { "2000" } sampler) eller ujevnt samplet, avvises eller gir parametere som stigningstallene flagger. Tabellens opphav navngir loggens SHA-256. MODELLED: estimatoren er kontrollert på syntetiske logger med hvit støy og kjente koeffisienter (gjenfunnet innenfor { "10" } %), ikke mot en ekstern uavhengig referanse. Tilgjengelig i CLI, Python (<c8/>), WebAssembly (<c9/>), MCP (<c10/>) og pluginen (<c11/>).

seg-b3c592f63798 = RTCM { "3" } MSM4 og MSM7 (<c1/>)

seg-0f8b986cff40 = En byte-strøm av RTCM { "3" }-rammer (en basestasjons eller en mottakers observasjonsutdata). Leses: MSM4- og MSM7-meldinger (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): epoken og bærebølge-til-støy-forholdet for hver signalcelle (MSM4: { "6" } biter, dB-Hz; MSM7: { "10" } biter, 1/16 dB-Hz), som er det C/N0-monitorene trenger. Pseudoavstands- og fasefelt hoppes over, ikke brukt, så RTCM gir tillitsmonitorene C/N0 og ingenting annet; det finnes ingen posisjon i MSM. Rammer med ugyldig CRC-24Q hoppes over og telles.

seg-d70038a737dc = <b>Hvor oppsettet kommer fra.</b> Ikke fra RTCM-standarden (et betalt dokument, ikke konsultert): fra den åpne dekoderen pyrtcm { "1.2.0" }, BSD 3-Clause, hvis lisens og merknad står i <c1/> (eierbeslutning av { "18" } Oct { "2026" }: «use open decoders»). pyrtcm oppgir at tabellene følger RTCM { "10403.3" }; Kshana støtter seg på de publiserte tabellene under pyrtcms lisens og gjør ingen påstand om standarden. Tid: MSM har ingen uke, så merkingene viser <c2/>; GLONASS-epoker (Moskva-tid) flyttes til GPS-tid med GPS-UTC = { "18" } s (verdien siden 2017-01-01).

seg-ee04a86f8f00 = Kontrollert mot: CRC-24Q-katalogens kontrollverdi (<c1/> gir <c2/>) og, én gang under utviklingen, pyrtcms egen dekoder på de samme egenskrevne rammene (samme C/N0). Testfilene er egenskrevne; ingen opptak er tatt fra en reell mottaker, så leseren er MODELLED helt til den har lest ett.

seg-94f0e4db92df = <s1>Forrige</s1>Jammertest som dommer

seg-8d660b4049e4 = <s1>Neste</s1>Mottakerprotokoller som leses

seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

seg-b0b5f9a66eed = IMU ([log.imu])

seg-03a6e15dce0a = IMU inn i hybrid- og fusjonsscenarioene (kshana imu-fit)

seg-53ce2c4ba434 = RTCM { "3" } MSM4 og MSM7 (format = "rtcm3")
