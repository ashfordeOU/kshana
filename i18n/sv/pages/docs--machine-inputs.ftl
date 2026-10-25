# docs--machine-inputs: translations (sv)

seg-e9650a618b38 = ID

seg-b9f561201fda = Källa: <c1/>

seg-536f71da4541 = Maskin- och sensorindata ({ "0.38" })

seg-1a91f96f22ab = Läsare som för in andra mottagare, lösare och sensorer i typen <c1/>. Alla är skrivskyddade: rena funktioner på byte eller text som returnerar samma tidslinje som läsarna för UBX, RINEX, Android och NMEA returnerar, och som hoppar över och räknar korrupta poster i stället för att misslyckas. Allt här är MODELLED: formaten läses ur offentlig dokumentation, och inget resultat är validerat mot någon oberoende extern referens utöver det som anges.

seg-3176ffff1e44 = <b>Rådgivande programvara.</b> Inte typgodkänd navigationsutrustning. Operatören är fortsatt ansvarig för fartygets säkra navigering.

seg-367ac9b4a8a6 = Vad `kshana imu-fit` läser ut ur en stillastående IMU-logg, från en verklig körning av motor v{ $version } på en påhittad logg ({ "20,000" } sampel vid { "100" } Hz, { "200" } s): accelerometerns hastighetsslumpvandring q_va = { "4.02e-06" }, gyrots vinkelslumpvandring q_arw = { "9e-08" }, biasinstabiliteten { "0.00296" } och de tidiga Allan-lutningarna (-0.51 och -0.49; ungefär -0.5 där vitt brus dominerar). Tabellen bredvid är den TOML som kommandot skriver ut. Skattaren är bara kontrollerad på syntetiska loggar. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande tjänst.

seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

seg-3ba911ed9541 = Lösningsfilen som RTKLIB:s <c1/> och RTKPOST skriver. Läses: tiden (kalender <c2/>, eller GPS-vecka och sekunder i veckan), positionen (latitud och longitud i grader med höjd, eller ECEF X/Y/Z omräknat till geodetiskt) och antalet satelliter. Tidsskalan i kolumnhuvudet (<c3/>, <c4/>, <c5/>) förs med i etiketten. Filer med grader-minuter-sekunder vägras. Rader som börjar med <c6/> är huvudrader.

seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

seg-b73d1465ed67 = ASCII-loggar (<c1/>) och binära loggar (<c2/>-huvud), fritt blandade. Layouterna följer den offentliga OEM7-dokumentationen (docs.novatel.com): meddelandehuvudena, 32-bitars CRC och fälttabellerna för tre loggar. Poster vars CRC inte stämmer hoppas över och räknas.

seg-078e047b9f82 = Logg

seg-5b59f661e68b = Används

seg-286c3fb8ac5c = lösningsstatus (endast <c1/> ger en positionsbestämning), latitud, longitud, höjd över medelhavsytan plus undulation (positionsbestämningens höjd är ellipsoidisk), använda satelliter

seg-3edaffed5d65 = C/No per signal (dB-Hz); system från bitarna 16-18 i spårningsstatus, signaltyp från bitarna 21-25

seg-5663c6812797 = mottagarstatusbit { "15" } (jammer upptäckt) blir epokens <c1/> (jamming { "2" } flaggade, { "1" } inte; RXSTATUS har ingen spoofingflagga), jämförs med larmen från Kshana av <c2/>; de { "1" } extra jammerbitarna (RF1-RF6) returneras i <c3/>

seg-61d8ec169a17 = CRC-rutinen kontrollerades mot den CRC som dokumentationen anger för sitt eget <c1/>-exempel (citeras, återges inte); testerna använder egenskrivna rader. Läses inte: förkortad ASCII, andra loggar. Jammerflaggan är mottagarens egen rapport, inte fynd från Kshana; överensstämmelse med Kshanas övervakare är ingen validering.

seg-b6c3919c87ad = GNSS-SDR (<c1/>)

seg-0cc992f8d61b = Se <a1><c1/></a1>. NMEA- och RINEX-utdata från GNSS-SDR läses redan med <c2/> och <c3/>; UDP-strömmarna Monitor och PVT-monitor (Protocol Buffers) vidarebefordras som JSON-rader av <c4/> och läses med <c5/>.

seg-cf1bf4944f6a = IMU (<c1/>)

seg-ab64a0754907 = <c1/>: en rubrikrad som namnger kolumnerna, sedan ett sampel per rad. Kolumner (i valfri ordning, namnen är skiftlägesokänsliga): <c2/> sekunder på mottagarloggens klocka, <c3/>, <c4/>, <c5/> vinkelhastighet i rad/s, <c6/>, <c7/>, <c8/> specifik kraft i m/s². <c9/>: layouten för EuRoC MAV <c10/> <c11/> (<c12/>, <c13/>, <c14/>); det första samplet är <c15/>. Rader som inte kan tolkas, och rader vars tid inte ökar, hoppas över. Se <a1><c16/></a1> för hur gyrots riktning används.

seg-f7007cf35f53 = IMU i hybrid- och fusionsscenarierna (<c1/>)

seg-3fc254763f67 = Scenarierna <c1/> och <c2/> (UKF med 17 tillstånd) är simuleringar: de tar sensorbrusparametrar (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), inte en uppmätt serie. <c10/> läser de parametrarna ur en stillastående IMU-logg, så att ett scenario kan köras med den sensor du faktiskt har:

seg-86efab73b2e6 = Metod: den överlappande Allan-deviationen för den integrerade signalen (<c1/>): <c2/>, detsamma för z-gyrot (<c3/>), <c4/> och <c5/> som medelvärden, och <c6/> som kurvans minimum när kurvan vänder uppåt efter det. <c7/> anpassas inte (det kräver en logg som är mycket längre än golvet). Rapporten anger loggens frekvens och längd samt den tidiga Allan-lutningen för varje kanal (ungefär -0.5 där vitt brus dominerar); en logg som inte är stilla, eller är för kort (under { "2000" } sampel) eller ojämnt samplad, vägras eller ger parametrar som lutningarna flaggar. Tabellens proveniens anger loggens SHA-256. MODELLED: skattaren är kontrollerad på syntetiska loggar med vitt brus och kända koefficienter (återfunna inom { "10" } %), inte mot någon oberoende extern referens. Finns i CLI, Python (<c8/>), WebAssembly (<c9/>), MCP (<c10/>) och insticksmodulen (<c11/>).

seg-b3c592f63798 = RTCM { "3" } MSM4 och MSM7 (<c1/>)

seg-0f8b986cff40 = En byteström av RTCM { "3" }-ramar (en basstations eller en mottagares observationsutdata). Läses: meddelandena MSM4 och MSM7 (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): epoken och bärvåg-till-brus-förhållandet för varje signalcell (MSM4: { "6" } bitar, dB-Hz; MSM7: { "10" } bitar, 1/16 dB-Hz), vilket är vad C/N0-övervakarna behöver. Fälten för pseudoavstånd och fas stegas förbi och används inte, så RTCM ger förtroendeövervakarna C/N0 och inget annat; det finns ingen position i MSM. Ramar med felaktig CRC-24Q hoppas över och räknas.

seg-d70038a737dc = <b>Varifrån layouten kommer.</b> Inte från RTCM-standarden (ett betaldokument som inte har konsulterats): från den öppna avkodaren pyrtcm { "1.2.0" }, BSD 3-Clause, vars licens och meddelande finns i <c1/> (ägarbeslut den { "18" } okt { "2026" }: "använd öppna avkodare"). pyrtcm anger att dess tabeller följer RTCM { "10403.3" }; Kshana förlitar sig på de publicerade tabellerna under pyrtcms licens och gör inga påståenden om standarden. Tid: MSM har ingen vecka, så etiketterna läses <c2/>; GLONASS-epoker (Moskvatid) flyttas till GPS-tid med GPS-UTC = { "18" } s (värdet sedan 2017-01-01).

seg-ee04a86f8f00 = Kontrollerad mot: kontrollvärdet i katalogen för CRC-24Q (<c1/> ger <c2/>) och, som en engångskontroll under utvecklingen, pyrtcms egen avkodare på samma egenskrivna ramar (samma C/N0). Testdata är egenskrivna; ingen inspelning har tagits från en verklig mottagare, så läsaren är MODELLED tills den har läst en.

seg-94f0e4db92df = <s1>Föregående</s1>Jammertest som domare

seg-8d660b4049e4 = <s1>Nästa</s1>Mottagarprotokoll som läses

seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

seg-b0b5f9a66eed = IMU ([log.imu])

seg-03a6e15dce0a = IMU i hybrid- och fusionsscenarierna (kshana imu-fit)

seg-53ce2c4ba434 = RTCM { "3" } MSM4 och MSM7 (format = "rtcm3")
