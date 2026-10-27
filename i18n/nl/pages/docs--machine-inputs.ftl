# docs--machine-inputs: translations (nl)

seg-e9650a618b38 = ID

seg-b9f561201fda = Bron: <c1/>

seg-536f71da4541 = Machine- en sensorinvoer ({ "0.38" })

seg-1a91f96f22ab = Lezers die andere ontvangers, solvers en sensoren in de soort <c1/> brengen. Elk is alleen-lezen: pure functies op bytes of tekst die dezelfde tijdlijn teruggeven als de UBX-, RINEX-, Android- en NMEA-lezers, waarbij beschadigde records worden overgeslagen en geteld in plaats van te falen. Alles hier is MODELLED: de formaten zijn uit openbare documentatie gelezen, en geen resultaat is getoetst aan een externe onafhankelijke referentie buiten wat is vermeld.

seg-3176ffff1e44 = <b>Adviserende software.</b> Geen typegoedgekeurde navigatieapparatuur. De exploitant blijft verantwoordelijk voor de veilige navigatie van het vaartuig.

seg-367ac9b4a8a6 = Wat `kshana imu-fit` afleest uit een stilstaand IMU-log, uit een echte run van engine v{ $version } op een verzonnen log ({ "20,000" } samples bij { "100" } Hz, { "200" } s): de snelheidsrandomwalk van de versnellingsmeter q_va = { "4.02e-06" }, de hoekrandomwalk van de gyro q_arw = { "9e-08" }, de biasinstabiliteit { "0.00296" } en de vroege Allan-hellingen (-0.51 en -0.49; ongeveer -0.5 waar witte ruis domineert). De tabel ernaast is de TOML die de opdracht afdrukt. De schatter is alleen op synthetische logs gecontroleerd. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.

seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

seg-3ba911ed9541 = Het oplossingsbestand dat <c1/> van RTKLIB en RTKPOST schrijven. Gelezen: de tijd (kalender <c2/>, of GPS-week en seconden van de week), de positie (breedte en lengte in graden met hoogte, of ECEF X/Y/Z omgezet naar geodetisch) en het aantal satellieten. De tijdschaal in de kolomkop (<c3/>, <c4/>, <c5/>) wordt in het label meegedragen. Bestanden in graden-minuten-seconden worden geweigerd. Regels die met <c6/> beginnen zijn kopregels.

seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

seg-b73d1465ed67 = ASCII-logs (<c1/>) en binaire logs (kop <c2/>), vrij door elkaar. De indelingen volgen de openbare OEM7-documentatie (docs.novatel.com): de berichtkoppen, de 32-bits CRC en de veldtabellen van drie logs. Records waarvan de CRC niet overeenkomt, worden overgeslagen en geteld.

seg-078e047b9f82 = Log

seg-5b59f661e68b = Gebruikt

seg-286c3fb8ac5c = oplossingsstatus (alleen <c1/> geeft een positiebepaling), breedte, lengte, hoogte boven gemiddeld zeeniveau plus undulatie (de hoogte van de positiebepaling is ellipsoïdaal), gebruikte satellieten

seg-3edaffed5d65 = C/No per signaal (dB-Hz); stelsel uit de trackingstatusbits 16-18, signaaltype uit bits 21-25

seg-5663c6812797 = ontvangerstatusbit { "15" } (jammer gedetecteerd) wordt de <c1/> van de epoch (jamming { "2" } gemarkeerd, { "1" } niet; RXSTATUS heeft geen spoofingvlag), vergeleken met de alarmen van { -brand } door <c2/>; de { "1" } extra jammerbits (RF1-RF6) worden teruggegeven in <c3/>

seg-61d8ec169a17 = De CRC-routine is gecontroleerd tegen de CRC die de documentatie voor haar eigen <c1/>-voorbeeld vermeldt (aangehaald, niet geciteerd); de tests gebruiken zelfgeschreven regels. Niet gelezen: verkorte ASCII, andere logs. De jammervlag is de eigen melding van de ontvanger, niet de bevinding van { -brand }; overeenstemming met de monitors van { -brand } is geen validatie.

seg-b6c3919c87ad = GNSS-SDR (<c1/>)

seg-0cc992f8d61b = Zie <a1><c1/></a1>. NMEA- en RINEX-uitvoer van GNSS-SDR wordt al gelezen met <c2/> en <c3/>; de UDP-streams van Monitor en PVT-monitor (Protocol Buffers) worden door <c4/> doorgegeven als JSON-regels en gelezen met <c5/>.

seg-cf1bf4944f6a = IMU (<c1/>)

seg-ab64a0754907 = <c1/>: een kopregel die de kolommen benoemt, daarna één sample per rij. Kolommen (in willekeurige volgorde, namen niet hoofdlettergevoelig): <c2/> seconden op de klok van het ontvangerlog, <c3/>, <c4/>, <c5/> hoeksnelheid in rad/s, <c6/>, <c7/>, <c8/> specifieke kracht in m/s². <c9/>: de indeling van de EuRoC MAV <c10/> <c11/> (<c12/>, <c13/>, <c14/>); het eerste sample is <c15/>. Rijen die niet te parsen zijn en rijen waarvan de tijd niet toeneemt, worden overgeslagen. Zie <a1><c16/></a1> voor hoe de gyrokoers wordt gebruikt.

seg-f7007cf35f53 = IMU in de scenario's hybrid en fusion (<c1/>)

seg-3fc254763f67 = De scenario's <c1/> en <c2/> (UKF met 17 toestanden) zijn simulaties: zij nemen parameters voor sensorruis (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), geen gemeten reeks. <c10/> leest die parameters af uit een stilstaand IMU-log, zodat een scenario kan worden uitgevoerd met de sensor die u werkelijk hebt:

seg-86efab73b2e6 = Methode: de overlappende Allan-deviatie van het geïntegreerde signaal (<c1/>): <c2/>, hetzelfde voor de z-gyro (<c3/>), <c4/> en <c5/> als de gemiddelden, en <c6/> als het minimum van de curve wanneer de curve daarna omhooggaat. <c7/> wordt niet gefit (het vergt een log die veel langer is dan de ondergrens). Het rapport bevat de samplefrequentie en de duur van het log en de vroege Allan-helling van elk kanaal (ongeveer -0.5 waar witte ruis domineert); een log dat niet stilstaat, of te kort is (minder dan { "2000" } samples) of ongelijk is bemonsterd, wordt geweigerd of geeft parameters die de hellingen markeren. De herkomst van de tabel noemt de SHA-256 van het log. MODELLED: de schatter is gecontroleerd op synthetische logs met witte ruis en bekende coëfficiënten (teruggevonden binnen { "10" } %), niet aan een externe onafhankelijke referentie. Beschikbaar in de CLI, Python (<c8/>), WebAssembly (<c9/>), MCP (<c10/>) en de plug-in (<c11/>).

seg-b3c592f63798 = RTCM { "3" } MSM4 en MSM7 (<c1/>)

seg-0f8b986cff40 = Een bytestroom van RTCM { "3" }-frames (de observatie-uitvoer van een basisstation of een ontvanger). Gelezen: MSM4- en MSM7-berichten (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): de epoch en de draaggolf-ruisverhouding van elke signaalcel (MSM4: { "6" } bits, dB-Hz; MSM7: { "10" } bits, 1/16 dB-Hz), wat de C/N0-monitors nodig hebben. Pseudorange- en fasevelden worden overgestapt, niet gebruikt, dus RTCM geeft de vertrouwensmonitors C/N0 en niets anders; in MSM zit geen positie. Frames met een slechte CRC-24Q worden overgeslagen en geteld.

seg-d70038a737dc = <b>Waar de indeling vandaan komt.</b> Niet uit de RTCM-standaard (een betaald document, niet geraadpleegd): uit de opensourcedecoder pyrtcm { "1.2.0" }, BSD 3-Clause, waarvan de licentie en de vermelding in <c1/> staan (besluit van de eigenaar van { "18" } okt { "2026" }: "use open decoders"). pyrtcm stelt dat haar tabellen RTCM { "10403.3" } volgen; { -brand } vertrouwt op de gepubliceerde tabellen onder de licentie van pyrtcm en doet geen uitspraak over de standaard. Tijd: MSM draagt geen week, dus labels luiden <c2/>; GLONASS-epochs (Moskouse tijd) worden naar GPS-tijd verplaatst met GPS-UTC = { "18" } s (de waarde sinds 2017-01-01).

seg-ee04a86f8f00 = Gecontroleerd aan: de controlewaarde uit de catalogus voor CRC-24Q (<c1/> geeft <c2/>) en, eenmalig tijdens de ontwikkeling, de eigen decoder van pyrtcm op dezelfde zelfgeschreven frames (dezelfde C/N0). De fixtures zijn zelfgeschreven; er is geen opname van een echte ontvanger gemaakt, dus de lezer is MODELLED totdat zij er een heeft gelezen.

seg-94f0e4db92df = <s1>Vorige</s1>Jammertest als scheidsrechter

seg-8d660b4049e4 = <s1>Volgende</s1>Gelezen ontvangerprotocollen

seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

seg-b0b5f9a66eed = IMU ([log.imu])

seg-03a6e15dce0a = IMU in de scenario's hybrid en fusion (kshana imu-fit)

seg-53ce2c4ba434 = RTCM { "3" } MSM4 en MSM7 (format = "rtcm3")
