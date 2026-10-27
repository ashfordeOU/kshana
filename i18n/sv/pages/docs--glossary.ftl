# docs--glossary: translations (sv)

seg-daf25c6479c1 = Standarder

seg-c851aa23ea42 = kommaseparerade värden

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = temperaturkompenserad kristalloscillator

seg-1bac97ee312a = atomfrekvensnormal med rubidium

seg-b09ffb8a9095 = Monte Carlo

seg-9939da5da283 = JSON

seg-5907283b71da = Förkortning

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = bias mellan system

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kvantprojektionsbrus

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-e464509f3abb = förhållandet mellan bärvåg och brustäthet

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital objektidentifierare

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Internationella rymdstationen

seg-865e7d1794b6 = Secure Hash Algorithm, 256 bitar

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrahög frekvens

seg-6ce4c2164aee = Källa: <c1/>

seg-bee5d056ef03 = Lättförståeliga definitioner av termerna som används i Kshana. Varje post börjar med en enradig förklaring “med enkla ord” och lägger sedan till den exakta betydelsen där det behövs. Förkortningar som inte definieras i något avsnitt finns i A–Ö-tabellen nära slutet, <a1>Alla övriga förkortningar, A till Z</a1>.

seg-f8c5433d1026 = Navigering och tidssynkronisering

seg-2a42d84608ea = <b>PNT, Positioning, Navigation, and Timing (positionering, navigering och tidssynkronisering).</b> Att veta <em>var</em> du är, <em>åt vilket håll</em> du är på väg och <em>hur mycket klockan är</em>, med precision. Modern PNT kommer mest från satellitsignaler (GNSS, de globala satellitnavigeringssystem som definieras härnäst); Kshana studerar vad som händer med <em>tiden</em> och <em>positionen</em> när de signalerna går förlorade.

seg-6227db2c94e1 = <b>GNSS, Global Navigation Satellite System.</b> De satellitkonstellationer som ger PNT: GPS (Global Positioning System, USA (Amerikas förenta stater)), Galileo (EU), GLONASS (Rysslands Global Navigation Satellite System), BeiDou (Kina). En mottagare som ser ≥ { "4" } satelliter kan beräkna en fullständig 3D-position och tid.

seg-f8eda357e640 = <b>GNSS-avbrott / nekad / försämrad / störd.</b> När satellitsignalerna inte är tillgängliga (blockerade, störda eller utom synhåll). Under ett avbrott måste systemet “glida” på sina egna sensorer ombord. Hela Kshanas syfte är att mäta hur väl det glider.

seg-a3ade199f465 = <b>Holdover.</b> Med enkla ord: <em>hur länge klockan kan hålla god tid på egen hand efter att den förlorat GNSS.</em> En bättre klocka håller längre innan felet passerar den tillåtna gränsen.

seg-83b33c15312f = <b>Dödräkning.</b> Med enkla ord: <em>att uppskatta var du är genom att lägga ihop din uppmätta rörelse, utan någon yttre referens.</em> Felen ackumuleras, så en bättre tröghetssensor driver långsammare.

seg-da9bcc994b9c = <b>Spec / tröskel.</b> Det största fel som tillåts innan lösningen räknas som “utanför spec”, till exempel “tidssynkroniseringen måste hålla sig inom { "20" } ns” eller “positionen inom { "100" } m”.

seg-6f37a60a30c7 = Sensorerna som Kshana jämför

seg-308b59d89586 = <b>Klocka (atomklocka).</b> En enhet som håller tiden genom att räkna en atoms naturliga svängning. Två exempel här:

seg-3389d08be6bc = <b>CSAC, Chip-Scale Atomic Clock.</b> En liten, utplacerad, kommersiell klocka (den “klassiska” referensen). Bra, men driver märkbart under ett långt avbrott.

seg-3e121d8e6400 = <b>Optisk gitterklocka (till exempel strontium).</b> En mycket stabilare “kvantklocka”; det främsta som finns i laboratorier, ännu inte flugen i rymden.

seg-4daa6cdf8ae2 = <b>Accelerometer.</b> Mäter acceleration (förändring i rörelse). Integrerad två gånger ger den position, så varje fel växer snabbt. <b>Kallatomsaccelerometer</b> är kvantversionen med mycket bättre långtidsstabilitet; <b>navigeringsklass</b> är den klassiska.

seg-91793676c57c = <b>Gyroskop.</b> Mäter rotation. Ett litet rotationsfel lutar plattformen, vilket läcker in tyngdkraft i horisontell riktning och förvanskar positionsuppskattningen.

seg-2d36110effc3 = <b>IMU, Inertial Measurement Unit (tröghetsmätenhet).</b> Själva paketet med accelerometer och gyroskop: tre axlar av vardera, som rapporterar specifik kraft och vinkelhastighet. Den mäter rörelse; på egen hand vet den inte var den är.

seg-e3b6b40e0cd0 = <b>INS, Inertial Navigation System (tröghetsnavigeringssystem).</b> En IMU plus den “mekanisering” som integrerar dess utdata till attityd, hastighet och position. INS är det som dödräknar genom ett GNSS-avbrott, och dess noggrannhet bestäms av de felprocesser i IMU som listas nedan.

seg-a618ff7ee429 = <b>Tidsöverföring.</b> Att skicka en precis tidssignal mellan två platser (till exempel från satellit till satellit). <b>Optiska</b> länkar är mycket mer precisa än <b>RF</b>-länkar (radiofrekvens).

seg-847fbbeecfae = Hur fel modelleras (klockbrus)

seg-5cf197bdbbad = Klockfel byggs upp av vanliga “brustyper”, var och en med en känd signatur:

seg-3806d1b1cb50 = <b>Vitt FM (vit frekvensmodulation).</b> Med enkla ord: <em>snabb, slumpmässig jitter i klockans gångtakt.</em> Medelvärdesbildning minskar den med tiden. Parameter <c1/>.

seg-0793fdd3abab = <b>Random-walk FM.</b> Med enkla ord: <em>klockans gångtakt vandrar långsamt.</em> Detta dominerar vid långa avbrott. Parameter <c1/>.

seg-42b74c8b88ff = <b>Flicker FM (1/f-brus).</b> Med enkla ord: <em>ett envist brusgolv som klockan aldrig kan medelvärdesbilda sig under.</em> Det är jämnt över alla medelvärdestider. Parameter <c1/>.

seg-b3bd841a5a2d = <b>Åldring / drift.</b> En långsam, <em>förutsägbar</em> förändring av gångtakten över tid; eftersom den är förutsägbar tar Kshanas estimator bort den. Parameter <c1/>.

seg-d929960492e4 = <b>VRW, Velocity Random Walk.</b> Accelerometerns motsvarighet till vitt brus: slumpmässiga stötar i hastigheten som växer till positionsfel. Parameter <c1/>.

seg-4a97f8d14174 = <b>ARW, Angular Random Walk.</b> Gyroskopets motsvarighet: slumpmässiga stötar i orienteringen. Parameter <c1/>.

seg-dcd03b326110 = Hur stabilitet mäts

seg-2181832c6253 = <b>Allan-deviation (<c1/>).</b> Med enkla ord: <em>det vedertagna sättet att ange hur stabil en klocka är över en given medelvärdestid <c2/>.</em> Ett klockdatablad anger till exempel <c3/>. Kshana validerar sin klockmodell genom att beräkna Allan-deviationen för sin egen utdata och kontrollera att den stämmer med det publicerade värdet. (Referens: Riley, NIST SP { "1065" }, National Institute of Standards and Technology Special Publication { "1065" }.)

seg-11cbe561e633 = <b>PSD, Power Spectral Density (effektspektraltäthet).</b> Hur ett brus effekt fördelar sig över frekvenser; det formella sättet att ange vitt brus, random-walk-brus och flickerbrus.

seg-0737d620eb5f = Kvalitetsmåtten (så poängsätts en körning)

seg-20b66e0d4809 = De sex operativa PNT-kvalitetsmått som Kshana redovisar (se tabellen “Output” i README):

seg-b17d08246e49 = <b>FoM, Figure of Merit (kvalitetsmått).</b> Ett tal som poängsätter en aspekt av en körning, redovisat med sin enhet och om det är validerat eller modellerat. De sex nedan är Kshanas operativa kvalitetsmått.

seg-b229a69fb4ac = <b>Positionerings- / tidssynkroniseringsprestanda</b>: felets storlek, som RMS (root mean square, det kvadratiska medelvärdet) och som 95:e percentilen.

seg-ba3ed5a28518 = <b>Autonomi</b>: holdover-tiden (hur länge systemet håller sig inom spec utan GNSS).

seg-13ecdd037098 = <b>Resiliens</b>: hur snabbt felet växer när GNSS väl är förlorat.

seg-be0168f24d6e = <b>Tillgänglighet</b>: den andel av körningen som har en lösning inom spec.

seg-44ef500b371d = <b>Integritet</b>: <em>kan du lita på systemets egen uppskattning av sitt fel?</em> Kshana redovisar den andel avbrottsprover vars verkliga fel håller sig inom filtrets skyddsgräns.

seg-d1cc3819cde9 = <b>Säkerhet</b>: robusthet mot spoofing: en poäng för spoofing-detekterbarhet baserad på klockstabilitet (sedan { "v0.3.0" }), meningsfull bara när ett spoofing-attackscenario är konfigurerat. Den är <em>inte</em> integritet av flygkvalitet: den beräknar ingen horisontell eller vertikal skyddsnivå (HPL/VPL) och kör ingen autonom integritetsövervakning i mottagaren (RAIM), varken avancerad eller annan. De kommer från de separata scenariotyperna för integritet och ARAIM (advanced RAIM) och definieras under “Integritet och förstärkning” nedan. Exportkänslig.

seg-5cae59204d9e = Termer som används vid sidan av kvalitetsmåtten:

seg-7adc0e49a981 = <b>Spoofing.</b> Med enkla ord: <em>en falsk satellitsignal som ljuger om position eller tid.</em> En spoofer matar mottagaren med ett rimligt men felaktigt svar, vilket är värre än jamming eftersom mottagaren kanske inte märker det.

seg-2d2e6cbeade6 = <b>1-DOF, en frihetsgrad.</b> En enda axel. Positionsfelet i Kshanas scenariopaket är enaxligt; ett fullständigt 3D-svar kräver treaxelmodellen.

seg-14a32d281c4b = <b>Monte Carlo-ensemble.</b> Att köra samma scenario många gånger med olika slumpfrön och redovisa spridningen i resultaten i stället för en enda körning.

seg-fcbea49a3592 = <b>CI, konfidensintervall.</b> Det intervall som en statistisk storhet förväntas hamna i med en angiven sannolikhet (till exempel { "95" } %). I READMEs tabeller och märken betyder “CI” oftare <b>kontinuerlig integrering</b>, den automatiska bygg- och testkörningen vid varje ändring; sammanhanget avgör vilket.

seg-310abfd6a64c = <b>k-sigma-gräns.</b> En gräns satt vid <em>k</em> standardavvikelser av filtrets egen osäkerhet; kvalitetsmåttet Integritet räknar hur ofta det verkliga felet håller sig inom den.

seg-ad26afbaa7b4 = <b>CEP / 2DRMS, circular error probable / twice the distance root mean square.</b> Två vanliga sätt att ange horisontell 2D-noggrannhet: CEP är den radie som rymmer { "50" } % av positionsbestämningarna; 2DRMS är två gånger det kvadratiska medelvärdet av det horisontella felet. Biblioteket kan beräkna båda ur en positionskovarians (<c1/>), men ingen scenariotyp redovisar dem ännu.

seg-fd93c1effba8 = Att läsa ett resultat: termerna i utdata

seg-3432498093cf = Det här är namnen du möter i en resultatfil eller i lekplatsens sammanfattning, först med enkla ord.

seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> Med enkla ord: <em>hur många sekunder systemet höll sig inom sin felgräns efter att GNSS gick förlorat.</em> Kshana redovisar den kortaste sådana glidningen över alla avbrott i körningen, mätt på körningens tidsrutnät, så den är en nedre gräns vid tidstegets upplösning. En holdover lika med avbrottets längd betyder att gränsen aldrig passerades.

seg-e68708a219f1 = <b>p95 (<c1/>).</b> Med enkla ord: <em>{ "95" } % av tiden var tidsfelet så här litet eller mindre.</em> Det är den 95:e percentilen av felet under avbrottet. Ett mycket litet värde kan visas som <c2/> i en kort sammanfattning; resultatfilen i JSON (JavaScript Object Notation) innehåller talet med full precision.

seg-4dfaee63262d = <b>Integritet (<c1/>).</b> Med enkla ord: <em>hur ofta systemets egen felskattning var ärlig.</em> Det är den andel avbrottsprover vars verkliga fel höll sig inom filtrets k-sigma-gräns (definieras nedan). Ett värde nära { "1" } betyder att estimatorn inte underskattade sitt fel. Det är ingen skyddsnivå av flygkvalitet; se “Integritet och förstärkning” nedan och <a1><c2/></a1>.

seg-5af09f5129e0 = <b>Säkerhetspoäng (<c1/>).</b> Med enkla ord: <em>hur sannolikt det är att en spoofing-attack upptäcks.</em> Det är sannolikheten att den konfigurerade attacken detekteras, ett minus sannolikheten för missad detektering <c2/>, härledd ur klockans stabilitet. Den betyder bara något när scenariot konfigurerar en spoofing-attack. Utan konfigurerad attack skriver sammanfattningsraden ut <c3/> och resultatet markerar värdet <c4/> i sitt block <c5/>; värdet finns kvar i dokumentet och betyder “ej tillämpligt”, inte “noll säkerhet”.

seg-70113d509997 = <b>PDOP, position dilution of precision (nycklar som <c1/>).</b> Med enkla ord: <em>hur mycket satellitgeometrin förstorar avståndsfel till positionsfel.</em> Positionsfelet är ungefär PDOP gånger avståndsfelet, så lägre är bättre. Se <b>DOP</b> under “Skattning och geometri”.

seg-a445bf9a3c5f = <b>sigma_y (<c1/>, Allan-deviationen).</b> Med enkla ord: <em>hur mycket en klockas gångtakt vacklar när den medelvärdesbildas över tiden <c2/>.</em> En databladsrad som <c3/> betyder att gångtakten, medelvärdesbildad över en sekund, varierar med ungefär { "3" } delar på 10¹⁰. Mindre är en stabilare klocka. Se “Hur stabilitet mäts” ovan.

seg-03b4bb05148d = <b>q_wf, intensitet för vitt frekvensbrus.</b> Med enkla ord: <em>styrkan hos den snabba, slumpmässiga jittern i en klockas gångtakt.</em> Det är koefficienten i <c1/> för vitt frekvensbrus, så ett scenario sätter <c2/> utifrån databladets Allan-deviation för en sekund. Dess följeslagare är <c3/> (random-walk-frekvensbrus) och <c4/> (åldring); se “Hur fel modelleras” ovan.

seg-074a1337ed99 = Termer för telekomtidssynkronisering

seg-9f61398628e4 = Telekomnät distribuerar tid över paketnät (Precision Time Protocol) från en GNSS-matad referensklocka, och International Telecommunication Union Telecommunication Standardization Sector (ITU-T) sätter gränser för det tidsfel varje klocka får lägga till. De här termerna förekommer i typen <c1/>; se <a1><c2/></a1>.

seg-f48712300b30 = <b>TE, time error (tidsfel).</b> Med enkla ord: <em>hur långt en klockas tid ligger från referenstiden, vid ett enda ögonblick.</em> Positivt eller negativt, vanligen i nanosekunder.

seg-ceda70656c6a = <b>max|TE|, maximalt absolut tidsfel.</b> Med enkla ord: <em>det värsta tidsfelet under mätningen, oavsett tecken.</em> Det är den huvudgräns som de flesta masker sätter.

seg-38d2922cd91d = <b>cTE, constant time error (konstant tidsfel).</b> Med enkla ord: <em>den stadiga förskjutningsdelen av tidsfelet</em>, det medelfel som inte ändras under mätningen.

seg-a4a61df332cd = <b>dTE, dynamic time error (dynamiskt tidsfel).</b> Med enkla ord: <em>den vacklande delen av tidsfelet</em>, det som återstår när den konstanta förskjutningen tagits bort. Det bedöms med MTIE och TDEV.

seg-31c0a85788b1 = <b>MTIE, maximum time interval error.</b> Med enkla ord: <em>den största svängningen i tidsfel inom något fönster av en given längd.</em> För varje fönsterlängd låter den ett fönster glida längs registret och tar den största topp-till-topp-ändringen; en mask anger det största tillåtna värdet för varje fönsterlängd.

seg-53fa12cab0c6 = <b>TDEV, time deviation.</b> Med enkla ord: <em>det typiska (kvadratiska medelvärdet av) vandringen i tidsfelet vid en given medelvärdestid,</em> efter att kortvarig jitter medelvärdesbildats bort. Det är en släkting till Allan-deviationen i tidsdomänen och kontrolleras, liksom MTIE, mot en mask.

seg-62b5eea14f6c = <b>PRTC, primary reference time clock.</b> Klockan högst upp i en telekomtidskedja, normalt styrd av GNSS. Dess prestandagränser finns i ITU-T Recommendation G.8272.

seg-8d6d4538981b = <b>ePRTC, enhanced primary reference time clock.</b> En PRTC med snävare gräns för tidsfel, uppbackad av en mycket stabil lokal atomklocka så att den kan hålla tiden genom ett långt GNSS-bortfall. ITU-T Recommendation G.8272.1.

seg-93fa4ac7c6fa = <b>T-BC, telecom boundary clock.</b> En nätklocka som tar emot tid uppströms och för den vidare nedströms, och lägger till ett litet tidsfel av eget. ITU-T Recommendation G.8273.2.

seg-52d32a5db6b8 = <b>T-TSC, telecom time slave clock.</b> Klockan i slutet av kedjan som tar emot tid och förser den utrustning som behöver den (till exempel en radiobasstation). Omfattas också av ITU-T Recommendation G.8273.2.

seg-04d8ed12ca88 = <b>OCXO, oven-controlled crystal oscillator (ugnsstyrd kristalloscillator).</b> En kvartsoscillator som hålls vid konstant temperatur i en liten ugn, vilket gör den mycket stabilare än en vanlig kvartsoscillator. En vanlig holdover-klocka i nätutrustning; den åldras (driver) märkbart över dygn.

seg-6742f7ba35ac = <b>CSAC, chip-scale atomic clock.</b> En mycket liten atomklocka (se “Sensorerna som Kshana jämför” ovan). Stabilare än en OCXO vid långa holdover-perioder, till högre kostnad och effektförbrukning.

seg-c0e0c18bd867 = Evidensnivåer: VALIDATED, MODELLED, PARTNER

seg-61c0aa107fd9 = Varje förmåga i den maskinkontrollerade verifieringsmatrisen (<a1><c1/></a1>) har en av tre nivåer.

seg-13fb20435df3 = <b>VALIDATED.</b> Med enkla ord: <em>kontrollerad mot någon annans svar.</em> Förmågans utdata jämfördes med en oberoende extern referens (verkliga mätdata, ett oberoende bibliotek skrivet av någon annan eller publicerade referensvärden) och stämde inom en angiven tolerans. En kontroll i kontinuerlig integrering avvisar en VALIDATED-rad som inte anger någon extern oberoende referens.

seg-a5dfb48e4dcb = <b>MODELLED.</b> Med enkla ord: <em>byggd på sund fysik och kontrollerad för intern konsistens, men ännu inte jämförd med ett externt svar.</em> Värdena är meningsfulla för jämförelse och konstruktionsavvägningar; de är inget belägg för att en verklig enhet kommer att prestera så. <a1><c1/></a1> förklarar varför varje sådan rad är modellerad.

seg-0512b2d2145a = <b>PARTNER.</b> Med enkla ord: <em>den här delen tillhör en maskinvaru- eller produktsäkringspartner, och Kshana hävdar ingenting om den.</em> Raden finns så att luckan syns i stället för att vara tyst.

seg-278dee6d3d4c = Termer för spektrum och störning

seg-285a240c9958 = De här termerna förekommer i typen <c1/>; se <a1><c2/></a1>.

seg-db4fdef1c562 = <b>BPSK(n), binary phase-shift keying vid n × { "1.023" } Mchip/s.</b> Modulationen med rektangulära chip för GPS L1 coarse/acquisition (C/A) och L2 civil (L2C) (n = { "1" }) samt GPS L5 och Galileo E5a (n = { "10" }). Dess spektrum är en sinc² med nollställen var n × { "1.023" } MHz.

seg-cdd0f4194f42 = <b>BOC(m, n), binary offset carrier.</b> En spridningskod vid n × { "1.023" } Mchip/s multiplicerad med en fyrkantsvåg som underbärvåg vid m × { "1.023" } MHz, vilket delar spektrumet i två lober på var sin sida om bärvågen.

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11), multiplexed binary offset carrier.</b> Effektspektraltätheten 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), överenskommen för Galileo E1 open service och GPS L1C; Galileo sänder den som composite BOC (CBOC).

seg-7423f94e3018 = <b>CW, continuous wave (kontinuerlig våg).</b> En omodulerad bärvåg: en enda ton.

seg-55d03dd4af03 = <b>J/S, jammer-to-signal ratio.</b> Mottagen störsändareffekt delad med mottagen signaleffekt, i decibel.

seg-b0f2974647d4 = <b>SSC, spectral separation coefficient.</b> κ = ∫ G_s(f) G_j(f) df över mottagarbandet: hur stor del av en störkällas spektrum med enhetseffekt som hamnar där signalens gör. Den effektiva bärvåg-till-brustätheten är [1/(C/N₀) + (J/S)·κ]⁻¹.

seg-c5affeee5269 = <b>Brusfaktor.</b> Hur mycket en mottagare lägger till det termiska bruset, som ett förhållande F i decibel; systemets brustemperatur är T_ant + { "290" } K × (F − { "1" }).

seg-5307c38d3036 = <b>Vattenfall.</b> En tid-frekvensbild av ett spektrum: frekvens i sidled, tid nedåt, färg för effekt.

seg-3b1ac094fdc5 = <b>Welch-skattning.</b> En effektspektraltäthet som skattas genom att medelvärdesbilda fönstrade, överlappande periodogram (Welch { "1967" }).

seg-9901d64fb895 = <b>SigMF, Signal Metadata Format.</b> Ett öppet inspelningsformat: en JSON-fil <c1/> som beskriver en rå <c2/>-fil med sampel (här komplexa <c3/>, <c4/> eller <c5/>).

seg-83041671f422 = <b>IQ, in-phase and quadrature.</b> De två komponenterna i ett komplext basbandssampel.

seg-39e6ea8506b3 = Signaltermer för LEO-PNT

seg-36452ee3f5cc = De här termerna förekommer i typen <c1/> och i multibandsscenarierna <c2/>; se <a1><c3/></a1>.

seg-8363a15f3c5a = <b>LEO-PNT, positionering, navigering och tidssynkronisering från låg omloppsbana.</b> Navigeringssignaler som sänds från satelliter på några hundra upp till cirka { "1200" } km höjd: starkare och snabbare i rörelse än GNSS från medelhög omloppsbana.

seg-523469643156 = <b>RNSS, RDSS, MSS, EESS, Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service.</b> Tjänstetilldelningar från ITU (International Telecommunication Union) som ett band kan ligga inom.

seg-d1e494623341 = <b>Pilot-, data- och upptagningskomponenter.</b> Delarna av en signal: en datafri pilot för avståndsmätning, en datakomponent som bär navigeringsmeddelandet och en kort komponent med låg takt som är lätt att hitta vid upptagning.

seg-cce232b7cd6a = <b>FDMA, frequency-division multiple access.</b> Komponenter eller satelliter som skiljs åt av bärfrekvens snarare än av kod.

seg-9d9476ee62b1 = <b>Gabor-bandbredd (RMS).</b> β = √(∫ f² G df / ∫ G df) över mottagarbandet: hur en signals effekt sprids i frekvens, vilket avgör hur fint den kan mäta avstånd.

seg-6febe9c2e506 = <b>DLL, delay lock loop.</b> Kodföljningsslingan; avståndet mellan tidig och sen korrelator och brusbandbredden avgör jittern i avståndsmätningen på grund av termiskt brus.

seg-5a55da97daf9 = <b>EFQPSK, enhanced Feher quadrature phase-shift keying.</b> En modulation med konstant envelopp (Xona Pulsar); approximeras här av ett spektrum med rektangulära chip.

seg-6dcbf1de9904 = <b>OFDM, orthogonal frequency-division multiplexing.</b> En flerbärvågsvågform (Starlinks nedlänk); ritas här som ett platt band.

seg-548b285c7c8e = <b>TEC, total electron content.</b> Elektroner per kvadratmeter längs vägen; { "1" } TECU = 10¹⁶ el/m². Den första ordningens jonosfärsfördröjning är { "40.3" }·TEC/f² meter.

seg-dd7e0743f364 = <b>EIRP, effective isotropic radiated power.</b> Sändeffekt gånger antennförstärkning mot mottagaren.

seg-aba3b3eaba85 = Integritet och förstärkning

seg-eab1b2c6728e = Integritet är frågan om <em>förtroende</em>: inte “hur stort är mitt fel?” utan “kan jag begränsa det, och blir jag varnad när gränsen bryts?” Det här är flygets termer för det.

seg-696a73449c49 = <b>RAIM, Receiver Autonomous Integrity Monitoring.</b> Med enkla ord: <em>mottagaren kontrollerar satelliterna mot varandra.</em> Med fler satelliter än de fyra som en positionsbestämning behöver ska resterna (residualerna) vara små; en stor residual betyder att en satellit ljuger, och mottagaren kan säga det utan hjälp från marken. Implementerad i <a1><c1/></a1>.

seg-89237433f01a = <b>ARAIM, Advanced Receiver Autonomous Integrity Monitoring.</b> Den moderna formen av RAIM med två frekvenser och flera konstellationer. Den matas med ett integritetsstödmeddelande som anger varje satellits antagna fel och felsannolikhet, och returnerar skyddsnivåer i stället för en flagga för pass eller fail. Fullständig genomgång, med varje antagande, i <a1><c1/></a1>.

seg-4cc13de05193 = <b>SISRE, Signal-in-Space Range Error.</b> Med enkla ord: <em>hur mycket en satellits utsända bana och klocka förvanskar det avstånd som en typisk användare mäter.</em> Banfelet delas upp i radiella, längsgående och tvärgående delar och viktas efter hur mycket var och en syns längs en genomsnittlig siktlinje, och kombineras sedan med klockfelet (Montenbruck m.fl. { "2018" }). För en satellit i låg omloppsbana väger de längsgående och tvärgående delarna mycket tyngre än för GPS, eftersom användare ser den långt från nadir. Används av typen <c1/>.

seg-847e40a033e1 = <b>RAC, Radial, Along-track, Cross-track.</b> De tre riktningar som ett banfel delas upp i: utåt från jordens centrum, längs färdriktningen och vinkelrätt mot banplanet. Modellen <c2/> i typen <c1/> lägger till ett korrektionspolynom i var och en.

seg-b725d23c839e = <b>SVID, Space-Vehicle Identifier.</b> Det nummer som ett navigeringsmeddelande använder för att namnge den satellit som sände det.

seg-b0f850eb04b1 = <b>IOD, Issue of Data.</b> En räknare som ändras när innehållet i en satellits navigeringsmeddelande ändras, så att en mottagare kan skilja ett nytt meddelande från en upprepning. (Förväxla inte med en demonstration i omloppsbana, som också förkortas IOD, som i ESA:s Celeste IOD.)

seg-985a5e9c9ce9 = <b>TOW, Time of Week.</b> Sekunder sedan början av den aktuella GNSS-veckan (söndag { "00" }:{ "00" }).

seg-1fc62dca46d6 = <b>CRC-24Q, 24-bitars cyklisk redundanskontroll (Qualcomm-polynom).</b> Den felupptäckande kontroll som RTCM { "10403" } och Galileo-meddelanden bär: en 24-bitars rest av meddelandebitarna delade med polynomet <c1/>. En mottagare räknar om den och kasserar ett meddelande som inte stämmer.

seg-abb4679dab23 = <b>URE, User Range Error.</b> Med enkla ord: <em>hur fel en satellits egen utsända bana och klocka gör varje avstånd till den.</em> Kallas också signal-i-rymden-fel (SISE); det är den felbudget per satellit som ARAIM och RAIM matas med (<c1/> i <a1><c2/></a1>).

seg-158c210fd3fe = <b>MHSS, Multiple Hypothesis Solution Separation.</b> Metoden som ARAIM använder. För varje sätt som konstellationen kan vara felaktig bildar den en lösning som utesluter de misstänkta satelliterna, och begränsar hur långt den dellösningen kan ligga från lösningen med alla satelliter i sikte.

seg-671711003a6f = <b>HPL / VPL, Horizontal / Vertical Protection Level.</b> Med enkla ord: <em>den radie som systemet lovar att det verkliga felet ligger inom, vid en angiven integritetsrisk.</em> Det är en gräns som algoritmen beräknar, inte ett uppmätt fel. En körning är tillgänglig när skyddsnivån håller sig under den larmgräns som operationen tillåter (VAL, den vertikala larmgränsen; HAL, den horisontella).

seg-5bbd2d664862 = <b>SBAS, Satellite-Based Augmentation System.</b> Ett marknät som övervakar GNSS, beräknar korrektioner och integritetsgränser och sänder ut dem från geostationära satelliter. <b>WAAS, Wide Area Augmentation System</b> är det amerikanska; EGNOS (European Geostationary Navigation Overlay Service) är det europeiska motsvarigheten. Kshana beräknar skyddsnivåer i DO-229E-formen med viktade minsta kvadrater (DO-229E är RTCA:s minimikrav på operativ prestanda för SBAS-mottagare; RTCA hette tidigare Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

seg-ba8b448582af = Skattning och geometri

seg-2eb6e72496b8 = <b>Estimator.</b> Algoritmen som förutsäger den verkliga positionen/tiden under ett avbrott utifrån sensormodellen. Kshana har en analytisk holdover-prediktor och ett <b>Kalmanfilter</b>.

seg-9b4aa612c5a9 = <b>Kalmanfilter.</b> Med enkla ord: <em>en algoritm som följer en storhet och också följer hur osäker den är.</em> Kshana använder dess osäkerhetsgräns för att beräkna Integritet.

seg-8fda81dfccc9 = <b>EKF, Extended Kalman Filter.</b> Ett Kalmanfilter för ett olinjärt problem: det linjäriserar modellen kring den aktuella skattningen i varje steg. Det vanliga valet för att koppla GNSS till en INS.

seg-9bc2c6f74b29 = <b>UKF, Unscented Kalman Filter.</b> Samma uppgift utan linjärisering: det skickar en liten mängd deterministiskt valda samplingspunkter genom den verkliga olinjära modellen och bygger upp medelvärde och kovarians från var de hamnar. Fungerar bättre när olinjäriteten är stark, vilket är varför banbestämningen använder det.

seg-a1e52820e3a0 = <b>DOP, Dilution Of Precision.</b> Med enkla ord: <em>hur mycket satelliternas geometri förstärker avståndsfel till positions- eller tidsfel.</em> Positionsfel ≈ PDOP × avståndsfel, så ett lågt tal betyder bra geometri. Familjen: <b>GDOP</b> (geometrisk, position och tid tillsammans), <b>PDOP</b> (position), <b>HDOP</b> (horisontell), <b>VDOP</b> (vertikal), <b>TDOP</b> (tid).

seg-e769a91a3e4b = <b>Walker-konstellation.</b> Ett vanligt sätt att beskriva en satellitkonstellation med antalet banplan och satelliter per plan (GPS är ungefär ett 24/6 Walker-skal).

seg-b557933a4e4d = <b>Elevationsmask.</b> Den minsta vinkel över lokal horisont vid vilken en satellit anses användbar; signaler som ligger för lågt utesluts.

seg-3ac8e11c3e33 = <b>Ockultation.</b> När jorden fysiskt blockerar siktlinjen till en satellit.

seg-249bf472cb00 = <b>Siluett (siluettmask).</b> Med enkla ord: <em>konturen av byggnader, kranar eller kullar mot himlen, som en elevation för varje azimut.</em> En satellit räknas som synlig bara ovanför <c1/> vid sin azimut, och en som ligger över masken men bakom siluetten är “maskerad av siluetten”. Kshana bygger en sådan utifrån en tabell, en gatukanjon, sektorer och terräng (deras punktvisa maximum) eller en REPRESENTATIVE-förinställning; endast siktlinje, ingen reflektion eller diffraktion (<a1><c2/></a1>).

seg-620a88820a2d = <b>Himlageometri.</b> Vilka satelliter en plats ser under en siluett och vad det gör med lösningen: DOP-faktorerna, öst-nord-upp-kovariansen för minsta-kvadrat-positionsbestämningen och dess <b>felellips</b>, den horisontella region som rymmer den angivna andelen av positionsbestämningarna ({ "95" } % som standard) för oberoende, lika stora gaussiska avståndsfel. MODELLED geometri under en angiven felmodell, inte en mottagares verkliga fel (<a1><c1/></a1>).

seg-f0e610122425 = <b>CTI, Composed Timing Integrity.</b> Skyddsnivåer för <em>tid</em> snarare än position, beräknade över en övergång mellan olika tidskällor, till exempel från en satellitkontrollerad (RAIM-tillgänglig) klocka till en fritt gående i holdover, så att gränsen förblir giltig genom övergången (<a1><c1/></a1>).

seg-56642f614c3f = <b>TIB, Timing Integrity Benchmark.</b> Ett mätinstrument för <em>andras</em> tidsövervakare: det injicerar en meny av fel och kontrollerar om övervakarens angivna skyddsnivå verkligen begränsade dess fel. Det gör inget eget noggrannhetsanspråk, så det kan inte överdriva något (<a1><c1/></a1>).

seg-8b89f8b913b9 = Omloppsbanor och cislunärt

seg-ba6b669eb8ba = <b>CR3BP, Circular Restricted Three-Body Problem.</b> Jord–måne-systemet behandlat som två kroppar på cirkulära banor kring sin gemensamma tyngdpunkt, plus ett rymdfarkost som är för lätt för att påverka tillbaka. Nära månen är en tvåkropps-Kepler-ellips helt enkelt fel form; CR3BP är den billigaste dynamik som är rätt (<a1><c1/></a1>).

seg-2726a22bf14c = <b>NRHO, Near-Rectilinear Halo Orbit.</b> En periodisk CR3BP-bana som svänger nära över den ena månpolen och långt ut över den andra, så den är nästan en rak linje sedd från änden, därav “nära rätlinjig”. Det är den bana som valts för månstationen Gateway, och den behåller nästan kontinuerlig siktlinje till jorden.

seg-2b2e6d04376c = <b>DRO, Distant Retrograde Orbit.</b> En annan CR3BP-familj: en stor, stabil bana som cirklar kring månen baklänges sedd i det roterande referenssystemet.

seg-6bb9229aee5c = <b>EOP, Earth Orientation Parameters.</b> Jordens uppmätta, något oregelbundna vingling och rotation (polrörelse, UT1 (Universal Time { "1" }, jordrotationstid)−UTC, jordrotationstid minus Coordinated Universal Time, samt dygnslängd) som behövs för att omvandla en jordfast position till en tröghetsposition med bättre än meters noggrannhet. IERS (International Earth Rotation and Reference Systems Service) publicerar dem; Kshana läser dess fil <c1/> via <c2/>.

seg-7f1e7e523e5b = Standarder, format och organisationer

seg-5d8d6144c13a = De förkortningar som README och paketsidorna använder för standarder, filformat, tidsskalor, referenssystem och organisationerna bakom dem. Var och en skrivs också ut vid första användningen på de sidorna.

seg-800d42de0777 = Omloppsbanor, referenssystem och tid

seg-320a1594dcf1 = <b>SGP4 / SDP4, Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> De vanliga analytiska propagatorerna för publicerade satellitbanor.

seg-87a098568846 = <b>TLE, two-line element set (tvåradig elementmängd).</b> Det publika banformat som SGP4 läser.

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO, låg omloppsbana / medelhög omloppsbana / geostationär överföringsbana / lutande geosynkron bana.</b> Banregimer; de flesta GNSS-satelliter flyger i MEO.

seg-1ec323dbd7a6 = LMO, låg marsbana.

seg-d0be640282af = <b>ECI / ECEF, jordcentrerat tröghetssystem / jordcentrerat, jordfast.</b> Ett referenssystem som inte roterar med jorden, och ett som gör det.

seg-09a937adc1db = <b>TEME, true equator, mean equinox.</b> Det referenssystem som SGP4 ger utdata i.

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF, Geocentric Celestial Reference System / International Terrestrial Reference System / dess realisering, International Terrestrial Reference Frame.</b> De moderna tröghets- och jordfasta referenssystemen.

seg-56b24c3734be = <b>CIO, Celestial Intermediate Origin.</b> Referenspunkten för den moderna jordrotationskedjan utan vårdagjämning.

seg-a23b05c85a63 = <b>LVLH, lokal vertikal, lokal horisontell.</b> Ett referenssystem som följer med rymdfarkosten.

seg-ac37217cda0d = <b>WGS-84, World Geodetic System { "1984" }.</b> Den jordellipsoid som GPS använder.

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB, Coordinated Universal Time / International Atomic Time / Terrestrial Time / Universal Time { "1" } (jordrotationstid) / Barycentric Dynamical Time.

seg-ea7eb1f34cae = <b>LTC / TCL, Lunar Coordinate Time (Temps-Coordonnée Lunaire).</b> Den föreslagna tidsskalan för månen.

seg-c6e5976d9dff = <b>OD, banbestämning.</b> Att återskapa en bana ur spårningsmätningar.

seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> och <b>DRO</b> definieras under “Omloppsbanor och cislunärt” ovan.

seg-2e6ba9069396 = Filformat och meddelanden

seg-ed5ea0a21e3f = <b>SP3, Standard Product { "3" }.</b> Filformatet för precisa banor från International GNSS Service (IGS), i versionerna c och d.

seg-1bfa0d083935 = <b>RINEX, Receiver Independent Exchange Format.</b> Standardfilformatet för GNSS-observationer och utsända efemerider.

seg-39ce08a9ae66 = IONEX, IONosphere map EXchange format.

seg-c23ea3515008 = <b>OEM / OMM / TDM, Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Standardmeddelanden för banor och spårningsdata från Consultative Committee for Space Data Systems (CCSDS).

seg-b267b32f3087 = <b>TOML, Tom's Obvious, Minimal Language.</b> Klartextformatet för Kshana-scenarier.

seg-2795dff8d607 = <b>KIF, Kshana Interchange Format.</b> Kshanas versionshanterade, självbeskrivande resultatkuvert.

seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> RTCA:s minimikrav på operativ prestanda för SBAS-mottagare och för GPS-utrustning i luftfartyg med luftfartygsbaserad förstärkning.

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> Gränssnittsspecifikationerna för GPS (den andra omfattar L5-signalen).

seg-2230000aa30b = <b>NIST SP { "1065" }.</b> National Institute of Standards and Technology <em>Handbook of Frequency Stability Analysis</em>.

seg-8b89719c1859 = <b>TRL, technology readiness level (teknisk mognadsgrad).</b> En skala från 1 till 9 för maskinvarans mognad.

seg-16c972f4ea0a = Organisationer

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b>: European Space Agency, dess European Space Operations Centre och dess European Space Tracking network.

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b>: den amerikanska National Aeronautics and Space Administration, dess Jet Propulsion Laboratory, dess Navigation and Ancillary Information Facility (som publicerar verktygslådan SPICE, Spacecraft, Planet, Instrument, C-matrix, Events) och dess Deep Space Network.

seg-eaa5a2a51169 = <b>IGS</b>: International GNSS Service. <b>IERS</b>: International Earth Rotation and Reference Systems Service. <b>IAU</b>: International Astronomical Union (vars SOFA-bibliotek, Standards of Fundamental Astronomy, och dess öppna port ERFA, Essential Routines for Fundamental Astronomy, är Kshanas referenser för referenssystem).

seg-81af4c0f4c48 = <b>CCSDS</b>: Consultative Committee for Space Data Systems. <b>AIAA</b>: American Institute of Aeronautics and Astronautics. <b>RTCA</b>: tidigare Radio Technical Commission for Aeronautics.

seg-aa0b395df17f = Programvara och leveranskedja

seg-b42188d3a6f4 = CLI, kommandoradsgränssnitt.

seg-198c591514ab = <b>MCP, Model Context Protocol</b>, det protokoll som Kshanas agentserver talar. <b>IDE, integrerad utvecklingsmiljö.</b>

seg-287bf61a1a16 = SBOM, programvarans innehållsförteckning (software bill of materials).

seg-80d9d4404221 = <b>SLSA, Supply-chain Levels for Software Artifacts</b>, det ramverk för byggursprung som Kshanas utgåvor attesteras under.

seg-7487c6f9ed18 = Alla övriga förkortningar, A till Z

seg-56f6039bb38a = Varje förkortning som används i arkivets dokumentation (<c1/> och de fyra README-filerna) och som inget avsnitt ovan definierar, plus några som ett avsnitt definierar, upprepade för uppslagning. Varje sida skriver också ut sina förkortningar vid första användningen; den här tabellen är det enda stället där du kan slå upp dem alla. Några poster är identifierare eller namn snarare än förkortningar, och anger det.

seg-c0dfa446e523 = Står för

seg-f272d28225ae = Var den förekommer

seg-ffb0596f134b = Third Generation Partnership Project

seg-77c1b4478387 = organet som skriver 5G-standarderna, inklusive icke-terrestra nät

seg-eaf19768b977 = femte generationens mobilnät

seg-692ddc163c55 = inklusive dess positionering via icke-terrestra nät (NTN)

seg-9524be916f07 = ABI

seg-0e8332db764b = binärt programgränssnitt (application binary interface)

seg-762ea76708dc = taggar för Python-wheels

seg-d419d06ed622 = ABMF

seg-b294c714487d = IGS-stationen i Le Moule, Guadeloupe

seg-586a8ea87638 = en stationsidentifierare på fyra tecken

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = växelström

seg-9cfb5dc4b4bc = som i AC-Stark-effekten (ljusförskjutning)

seg-90308009c536 = ADD

seg-49d97c65662d = Algorithm Description Document

seg-493b5ceaa0fb = flygreferensalgoritmen för ARAIM från WG-C

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = Allan-deviation / överlappande Allan-deviation

seg-23c38ecbc543 = se Allan-deviation ovan

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

seg-4b642742f2d4 = artikelnummer för tröghetssensorer (Analog Devices; Safran Sensonor; MicroStrain)

seg-c4c0a93477a8 = identifierare, inte förkortningar

seg-36743c7fe98e = AEM

seg-142ca108a070 = Attitude Ephemeris Message

seg-c34185a83d8e = ett CCSDS-meddelande

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = Aerospace and Electronic Systems Society

seg-78692bf5addf = inom IEEE

seg-f429be16014e = AF

seg-afa04bc28b42 = medelvärdesfaktor

seg-b3db60632b92 = det heltalsmultipel av samplingsintervallet som används i en estimator av Allan-typ

seg-6097c4709542 = AFS

seg-7043ab3fe32b = Augmented Forward Signal

seg-20380d29d286 = LunaNets navigeringssignal för månen

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = automatisk förstärkningsreglering

seg-750b8717220b = en jamming-indikator i en mottagares ingångssteg

seg-31b864b910d5 = AHP

seg-f956cbe86552 = Analytic Hierarchy Process

seg-c2b63847e2dc = en viktningsmetod för flera kriterier (Saaty)

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = artificiell intelligens / maskininlärning

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = larmgräns / horisontell larmgräns / vertikal larmgräns

seg-1e52f04eb047 = felet som en integritetsövervakare måste begränsa

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = alternativ binär offsetbärvåg (alternative binary offset carrier)

seg-e3acb231cf4d = Galileos E5-modulation

seg-79b130764f97 = aritmetiskt medelvärde–harmoniskt medelvärde (olikhet)

seg-190b782b70ce = AOCS

seg-6459d9bce282 = attityd- och banstyrsystem

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = signalupptagning / tidpunkt för närmaste passage / signalförlust

seg-8b73e2c51498 = händelserna i en markstationspassage (LOS betyder också siktlinje; sammanhanget avgör vilket)

seg-27ceb7163571 = API

seg-7903f5ff4027 = programmeringsgränssnitt (application programming interface)

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = identifierare för applikationsprocess

seg-55730824c8cf = fältet i headern för CCSDS Space Packet

seg-611cd7a0d378 = APS

seg-55842a648c47 = American Physical Society

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = inflygning med vertikal ledning

seg-69a6cc8a532a = APV-I: { "40" } m horisontella, { "50" } m vertikala larmgränser

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = genomsnittlig körlängd (average run length)

seg-08a5d53f813c = den genomsnittliga tid en förändringsdetektor tar på sig innan den larmar

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = processorarkitekturen Arm / dess 64-bitarsform

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = amplitudspektraltäthet

seg-9fb629e35a25 = kvadratroten av en effektspektraltäthet

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = astronomisk enhet

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = arean under kurvan / receiver operating characteristic

seg-4d65dbf47a5c = utvärdering av detektorer

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = är värd för en öppen spegel av SRTM-höjdrutorna

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = byggnadsinträdesdämpning (building entry loss)

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = biasinstabilitet

seg-ff2ba8692cbc = det platta minimumet i en tröghetssensors Allan-deviation

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = Bureau International des Poids et Mesures (Internationella byrån för mått och vikt)

seg-6ec98084ac58 = publicerar Circular T

seg-4ff08facda60 = BKG

seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (tyska federala myndigheten för kartografi och geodesi)

seg-ac4765a77015 = driver en IGS-datamirror

seg-a85954d9176e = BSD

seg-eb42c5807e5a = Berkeley Software Distribution

seg-a332a259125a = som i BSD-licenserna

seg-97764c651815 = BSP

seg-8f85848ee08a = binär SPK

seg-6e01dca47581 = en binär SPICE-efemeridkärnfil

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = luftmotståndstermen i en tvåradig elementmängd

seg-628e6c686508 = CAI

seg-a2418a88886c = kallatomsinterferometer

seg-273a3b8d5385 = se QUANTUM.md

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

seg-a1f55ee72524 = en licens för data eller text

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = Crustal Dynamics Data Information System

seg-5b3f50bed1f6 = NASA:s arkiv för rymdgeodesi

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = kumulativ fördelningsfunktion

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = konstant falsklarmsfrekvens (constant false-alarm rate)

seg-b38b56b63da6 = en tröskelregel för en upptagningsdetektor

seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

seg-4dab086e5c3d = BeiDous datum

seg-8f7751d39781 = CIP

seg-e34a194da574 = Celestial Intermediate Pole

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = Celestial Intermediate Reference System

seg-a543c4d02ace = CISA

seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

seg-59c481cb5741 = inom USA:s DHS

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = civil moderate / civil long

seg-cc0c8f1524f8 = de två tidsmultiplexade GPS L2C-koderna

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = skyddsnivå för common-mode

seg-d469cd44d9d4 = gränsen för fel som ett residualtest inte kan se

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = converged Newtonian

seg-5d679a981a34 = SPICE-korrektionen för ljustidsaberration

seg-3da9a2841b6c = C/N0 (C/N₀)

seg-cf60da0631b4 = i dB-Hz

seg-f4488db8194d = COPRAS

seg-6379891c1750 = COmplex PRoportional ASsessment

seg-b99fe66bd09c = en rangordningsmetod för flera kriterier

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = Committee on Space Research

seg-235850ad0d1f = utfärdar internationella satellitbeteckningar

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = cykel per varv

seg-a1d4080ce019 = en empirisk banacceleration vid omloppsfrekvensen

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = central / grafisk / neural processorenhet

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = Cramér–Rao-gränsen / Cramér–Rao-nedre gräns

seg-6eb684e34f56 = den minsta varians som en väntevärdesriktig estimator kan nå

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

seg-eb95135f849c = ILRS normalpunktsfiler

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = antenn med styrt mottagningsmönster (controlled-reception-pattern antenna)

seg-7111b9c4d382 = en gruppantenn mot störning

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = konsistenskvot / slumpindex

seg-cfa91dc02138 = AHP-konsistenskontrollen (acceptera CR < { "0.10" })

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = det franska företag som underhåller Orekit

seg-58d5f143ff3b = ett företagsnamn, ingen förkortning att skriva ut

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = kodskiftsmodulation (code shift keying)

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = Cascading Style Sheets

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = kumulativ summa

seg-66f752e15abc = en sekventiell förändringsdetektor

seg-92ac0357d01e = CV

seg-28f75c073917 = (common view vid tidsöverföring; sammanhanget avgör vilket)

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium Language

seg-fd0a7af2ebeb = JSON-formatet för scener i CesiumJS

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = decibel / decibel-watt / decibel-hertz

seg-c485de5bcd85 = effektförhållande, absolut effekt och en enhet för C/N0

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = likström

seg-0ea7fccee332 = gränsen vid frekvensen noll

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = riktningskosinusmatris

seg-9d3d9ca79a9d = en rotationsmatris

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = Developer Certificate of Origin

seg-1545bd59f5ef = DCT

seg-8b6866288bea = design control table

seg-80d95f099e9a = en länkbudgettabell (JPL DESCANSO:s exempel för Galileo i X-band)

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL Development Ephemeris (versionerna { "421" }, { "430" }, { "440" }, { "441" })

seg-748af19e3f0b = planet- och månefemerider; “DE-grade” betyder noggrannhet av den klassen

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = digital höjdmodell

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

seg-2e11a1976171 = JPL:s monografiserie

seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (tyska geodetiska forskningsinstitutet vid Münchens tekniska universitet)

seg-e7cedd55549e = är värd för EUROLAS Data Center

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = differentiell GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = Department of Homeland Security

seg-6b487421c547 = USA

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = Department of Defense

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = frihetsgrad

seg-bf5bc69cb873 = se 1-DOF ovan

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = differentiell envägs avståndsmätning / delta differentiell envägs avståndsmätning

seg-6ba2d3b5b724 = vinkelspårning i djuprymd

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

seg-00ecc6de9912 = numeriska integratorer

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = avstånd som kvadratiskt medelvärde (distance root mean square)

seg-a8ed04890ded = se 2DRMS

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = dokumentnummer för Microchips datablad

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = Deep Space Atomic Clock

seg-e80350ed521f = NASA:s klocka med fångade kvicksilverjoner

seg-52e838301c0b = UT1 minus UTC

seg-fbce3b3b7b80 = jordrotationskorrektionen

seg-8aa996f34920 = energi per bit över brustäthet

seg-463b21c0b791 = tröghetssystemet som är i linje med det jordfasta systemet vid körningens början

seg-4dc987bd9dbf = används av exporterna för leo-pass-interop

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = standarden bakom JavaScript / en ES-modul

seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

seg-2967e958f353 = en modell för solstrålningstryck för GNSS (CODE: Center for Orbit Determination in Europe)

seg-244af4062ccc = ECSS

seg-b74029376aba = European Cooperation for Space Standardization

seg-d452e23d503a = ECSS-E-ST-10-02 är dess verifieringsstandard

seg-becb6685ff13 = ED

seg-b6448e14a567 = EUROCAE-dokument

seg-ee4ada9c4c6e = som i ED-259A

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = ingång, nedstigning och landning

seg-69f37001de44 = EEE

seg-18a1b66286ee = elektriska, elektroniska och elektromekaniska (komponenter)

seg-f814c1301059 = produktsäkring för rymdbruk

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = Earth Gravitational Model (utgåvan { "2008" })

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (elimination och val som uttrycker verkligheten)

seg-efb2f919955a = en överrangsmetod för flera kriterier

seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, versionen MPP02 (Chapront)

seg-b1d699d70339 = en analytisk månteori

seg-aee5eeb23064 = jordens medelekvator och medelvårdagjämning vid J2000

seg-16d9b8eac95d = ett tröghetssystem

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = en kod-diskriminator

seg-0e4110d33849 = EMT

seg-103c6de62575 = effektiv övervakningströskel

seg-4b2101113387 = en utdata från ARAIM

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = öst-nord-upp / nord-öst-ned

seg-aae7610833a7 = lokala nivåsystem

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = jordobservation

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (utgåvan { "2021" })

seg-bd2a27a17f6d = IAA RAS-efemerid

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = jordrotationsvinkel

seg-966ed500f705 = ESKF

seg-e79112a3132a = Kalmanfilter för feltillstånd

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = effektiv urvalsstorlek

seg-57ce1c1b617b = hos ett partikelfilter

seg-f529300f944b = ESSR

seg-869be8388d26 = European Space Software Repository

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = efemeristid

seg-e0c49639649e = SPICE:s namn för TDB

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = European Organisation for Civil Aviation Equipment

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = European Laser Network

seg-fa7025d88c88 = laseravståndsmätning mot satelliter och månen

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = vanliga frågor

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = Federal Communications Commission

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = fullt sammankopplat neuralt nätverk

seg-1de7b4410369 = FD

seg-4e73ff36d37f = finit differens

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = feldetektering och uteslutning

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = Finite Element Solution (utgåvan { "2004" })

seg-878b4a645ae9 = en modell för havstidvatten

seg-55c14f474a10 = FIM

seg-b68c86e68570 = Fisher-informationsmatris

seg-d39671724dfc = Fowler–Noll–Vo-hash, variant 1a

seg-3354ad42f7dd = används för att låsa fast referensutdata (golden outputs)

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = full operativ förmåga / validering i omloppsbana

seg-ce13cca7f222 = satellitgenerationer (Galileo, Xona Pulsar)

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = synfält / momentant synfält

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = programmerbar logikkrets / mikrokontrollerenhet / realtidsoperativsystem

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = fri-rymdsdämpning / fri-rymdsvägdämpning

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = gigabyte / kilobyte / megabyte

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = Geocentric Celestial Reference Frame

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = Geospatial Data Abstraction Library

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = geostationär bana

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = Geographic JavaScript Object Notation

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = gravitationsgradient

seg-d8ef4d361e86 = som i gravitationsgradientmoment

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = gigahertz / kilohertz

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = global jonosfärskarta

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = GNSS/INS-integrering / datamängden och koden för Kalmanfilter-GNSS/INS från Wuhan University

seg-deca3cbe41ac = GIS

seg-36275ece527d = geografiskt informationssystem

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = grid ionospheric vertical error

seg-20a40777d78a = en term i SBAS-meddelanden

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = ett program för GNSS-databehandling som distribueras av ESA

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = GNU C-biblioteket

seg-2630ae5f0bc5 = Rysslands Global Navigation Satellite System (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

seg-361f1f18d454 = GLS

seg-397d58b727ee = generaliserade minsta kvadrater

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = gravitationsparameter

seg-e3a296392ac0 = gravitationskonstanten gånger en kropps massa

seg-45a8f50bce06 = General Mission Analysis Tool

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = Goddard Mars Model { "3" }

seg-45abee95253b = ett gravitationsfält för Mars

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = Greenwichs lokala stjärntid (Greenwich mean sidereal time)

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = styrning, navigering och reglering

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = Grid Processing On Demand

seg-14782f821cde = GR

seg-762f364a05f3 = allmän relativitetsteori

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = GRAIL-gravitationsmodellerna för månen från NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory)

seg-220fae5cfc61 = Geodetic Reference System { "1980" }

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = markpixelavstånd (ground sample distance)

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = markstödutrustning

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = Goddard Space Flight Center

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = Hadamard-deviation / överlappande Hadamard-deviation

seg-bb846135ceb4 = ett stabilitetsmått som inte påverkas av drift

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = maskinvara i loopen

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = hazardously misleading information / misleading information

seg-1cbf9d6f135d = områden i Stanford-diagram

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = HyperText Markup Language

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = Institute of Applied Astronomy of the Russian Academy of Sciences

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = International Association of Geodesy

seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

seg-01880debd7e0 = International Association of Geomagnetism and Aeronomy / dess arbetsgrupp V-MOD (modellering av det geomagnetiska fältet)

seg-28805f15bae8 = underhåller IGRF

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = begynnelsevillkor

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = International Civil Aviation Organization

seg-c2d2d459177d = ICD

seg-a018300615e2 = gränssnittskontrolldokument

seg-433b45040abd = som i Galileo OS SIS ICD

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = International Centre for Global Earth Models

seg-e9650a618b38 = ID

seg-e40875ab1090 = identifierare (eller identifiering, som i brustypsidentifiering)

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

seg-ce9375732735 = IF

seg-746eae5ce367 = mellanfrekvens

seg-ed568f55aa8f = mottagarsampel

seg-cb4aaa2581bb = IGS:s realisering av ITRF2014

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = International Geomagnetic Reference Field

seg-669611e731d0 = IGRF-14 (filen IGRF14.shc) är den 14:e generationen

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = lutande geosynkron bana

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on

seg-8a19be8033a9 = en GPS-satellitgeneration

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = International Laser Ranging Service

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = heltalsminstakvadrater

seg-a214c483b8a8 = upplösning av heltalsosäkerhet

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

seg-22048a770612 = Parisobservatoriet; publicerar INPOP

seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, version 21a

seg-577acd29f11b = en planetefemerid

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = Interagency Operations Advisory Group

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = Institute of Navigation / dess International Technical Meeting

seg-53abad80634c = IoT

seg-9b766d557bd1 = sakernas internet (Internet of Things)

seg-1b41d114662e = IR

seg-ff2d89b32d07 = integritetsrisk

seg-2dc9fcadccd6 = sannolikheten för hazardously misleading information

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = Institute of Radio Engineers

seg-3fbae7e11fca = en föregångare till IEEE

seg-9e3d84279d56 = klockoffseten mellan två GNSS

seg-2ffee4396fbd = ISL

seg-505dee046f7a = länk mellan satelliter

seg-010ea5a76e2e = ISM

seg-330b25f923db = integritetsstödmeddelande

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = International Organization for Standardization

seg-8291ac1ccba6 = ISO { "8601" } är dess format för datum och tid

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

seg-14dc2a58e2c3 = International Telecommunication Union Radiocommunication Sector

seg-0e8094e4d45c = dess rekommendationer i P-serien modellerar utbredning

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = julianskt datum / modifierat julianskt datum

seg-996d4952554f = JMLR

seg-a1ef35b98931 = Journal of Machine Learning Research

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = Journal of the Optical Society of America

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = Europeiska kommissionens gemensamma forskningscentrum / ett av dess rapportnummer

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript Object Notation

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

seg-919a951f3d02 = KF

seg-436a208697f1 = Kalmanfilter

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole Markup Language

seg-ffe25881cef6 = en OGC-standard som läses av Google Earth

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = postetiketter i Kshanas eget textformat för LEO-navigeringsmeddelanden

seg-3269a4e6b3e3 = ett tillägg från Kshana, inte en standard

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = nyckeltal för prestanda (key performance indicator)

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = Kennedy Space Center

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = Keyword = Value Notation

seg-7379ade4ee0e = textformen för CCSDS-meddelanden

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = Lunar Augmented Navigation Service

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = Linear Algebra PACKage

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = linjär kongruensgenerator

seg-8927ca404e64 = generatorn för testserien i NIST SP { "1065" }

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = Lunar Communications and Navigation Services

seg-5253cae4b05b = ESA:s tjänst Moonlight

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = skiftregister med linjär återkoppling

seg-5b09c8e3f127 = generering av spridningskoder

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU Lesser General Public License

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = den itererade logaritmens lag

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = indikator för förlorad låsning / indikator för signalstyrka

seg-7d95179a5a1f = observationsflaggor i RINEX

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = laseravståndsmätning mot månen

seg-20deda97c876 = LLVM

seg-5a84a3219546 = kompilatorinfrastrukturen LLVM (ursprungligen Low Level Virtual Machine)

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = äldre navigeringsmeddelande (legacy navigation message)

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = satellitsystem för navigering och kommunikation vid månen

seg-4ce3c0ea7a31 = konstellationsfallstudierna i NAVIGATION { "70" }({ "4" }), navi.613

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet Interoperability Specification

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

seg-97ff1706b4bd = en föreslagen konstellation vid månen

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = localiser performance with vertical guidance / dess kategori med beslutshöjd { "200" } ft

seg-090ba62634a8 = flyginflygning

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

seg-8f782bde5659 = LS

seg-c5bc49526464 = skottsekunder

seg-54ea05b82cb4 = som i Δt_LS

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = ljustid

seg-4729314afd46 = LTE

seg-1a7e158f020f = Long-Term Evolution

seg-3c1b3acc46d9 = mobilstandarden 4G

seg-3530cdaca137 = LU

seg-58ad64b9d450 = lower–upper (uppdelning)

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = Lunar GNSS Receiver Experiment

seg-84874825a5d1 = flög till månen { "2025" }

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = Stanfords PNT-bibliotek för månen

seg-893ba320da76 = ett namn

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

seg-a24b3840d248 = Stanford

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = tillverkning, montering, integrering och test

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = JPL:s lösningar för satellitefemerider för månarna kring Mars, Jupiter och Saturnus

seg-9b0688bfc31e = identifierare

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = minimum aviation system performance standards

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = MATrix LABoratory

seg-e722ea781fdf = en produkt för numeriska beräkningar

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = nyttoteori för flera attribut

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = Mars Climate Database

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = beslutsanalys med flera kriterier

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = måncentrerat tröghetssystem / måncentrerat, månfast

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = minsta detekterbara bias

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = modifierad Allan-deviation

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = mikroelektromekaniska system

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO (Métrologie Optique), laserstationen i Grasse / Matera Laser Ranging Observatory

seg-a8fcbefbbf4c = laserstationer för avståndsmätning mot månen

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = medeljord / huvudaxlar

seg-f30f1a2778cf = de två månfasta referenssystemen (MOON_ME, MOON_PA)

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = Multi-GNSS Experiment

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = Massachusetts Institute of Technology

seg-e9d7062835a9 = som i MIT-licensen

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = flerskiktsperceptron

seg-6975432180f6 = ett litet neuralt nätverk

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = medel för datum / sant för datum

seg-1af66f9b771d = ekvator- och vårdagjämningssystem

seg-b5db821f8008 = MOORA

seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = minimikrav på operativ prestanda

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla Public License

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = gravitationsmodellerna för Mars Reconnaissance Orbiter, { "110" } och 110B2

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = lägsta Rust-version som stöds

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = modulationsöverföringsfunktion

seg-7f60d1ac40ad = optisk avbildning

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = minimum-variance distortionless response

seg-83f57219e5b7 = adaptiv strålformning

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = mikrovågslänk

seg-639266912f59 = tidsöverföringslänken i ACES

seg-5ac07401e4f8 = NaN

seg-722d679807ee = inte ett tal (not a number)

seg-0e4abc653325 = NavIC

seg-355821380384 = Navigation with Indian Constellation

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = Navigation Innovation and Support Programme

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = navigering (meddelande) / observation

seg-1729ddf0eafa = de två filtyperna i RINEX; Stanford NAV Lab är Navigation and Autonomous Vehicles Laboratory

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = det tidigare amerikanska National Bureau of Standards / referensdatamängden NBS14 för frekvensstabilitet

seg-3d1ac5146fea = används för att kontrollera Allan-estimatorer

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = normaliserat kvadrerat skattningsfel / normaliserad kvadrerad innovation

seg-af167a77a1dc = konsistenstester för filter

seg-beb7a86721ec = National Geospatial-Intelligence Agency

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = National Imagery and Mapping Agency / dess tekniska rapport TR8350.2 (definitionen av WGS { "84" })

seg-ffa6025b5a70 = NIMA är det tidigare namnet på NGA

seg-af4be907e56c = NLOS

seg-22ab7d58324b = en signal som bara är reflekterad

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = icke-negativa minsta kvadrater

seg-af8ca8550600 = NORAD

seg-07428e7224cf = North American Aerospace Defense Command

seg-4edb033e3432 = för den publika satellitkatalogen

seg-dd984e16dbcd = NP

seg-f92816d7c936 = Neyman–Pearson

seg-fc214695fa83 = detektionsteori

seg-3ef8006482bb = NPA

seg-81a072ee0520 = icke-precisionsinflygning

seg-b9fd2cf6a2b9 = flyg

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = nutation–precession–bias

seg-b4562efbafdf = IAU 2006/2000A-matrisen

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = Naval Research Laboratory / dess atmosfärmodell Mass Spectrometer and Incoherent Scatter Radar Extended, { "2000" }

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = icke-terrestrialt nät

seg-1ae0305d8455 = 5G från satelliter

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA Technical Reports Server

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = identifierare för överdrivna anspråk (overclaim)

seg-47ba87f3730b = rader i CLAIMS-VS-REALITY.md

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = Open Container Initiative

seg-b5bf07ed6c8c = format för containeravbilder

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = ordinär / stokastisk differentialekvation

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = banmeddelanden (orbit data messages)

seg-35fe6a2f3de3 = CCSDS-familjen som inkluderar OEM och OMM

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = Open Geospatial Consortium

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = ordinära / viktade minsta kvadrater

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = ESA:s satellit för programvarulaboratorium i omloppsbana / dess datamängd för avvikelsedetektering

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = Open Space Innovation Platform

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

seg-95b6b14facf1 = autentisering av Galileo-signaler

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = Open Service (Galileo, BeiDou) eller operativsystem

seg-6db10af375e3 = sammanhanget avgör vilket

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = Ornstein–Uhlenbeck

seg-9be9042ec983 = en brusprocess som återgår mot medelvärdet

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = produktsäkring (även precisionsinflygning, som i K_H,PA)

seg-65ad442b3faa = PCK

seg-c788fe80678e = kärna med planetkonstanter

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = Portable Document Format

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = sannolikhet för detektering / sannolikhet för falsklarm

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = referenssystemet mellan TEME och ITRF

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = satellitidentifierare: en GPS-satellitetikett i SP3, ett pseudoslumpbrusnummer för SBAS, ett satellitnamn i Galileo

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

seg-302c8cb738ac = cesiumklockan i ACES

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = skyddsnivå

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = faslåst slinga

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central / en av dess artikelidentifierare

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = fasmodulation / frekvensmodulation

seg-279251adb2eb = brus på en klockas fas eller på dess frekvens

seg-685fc49957e2 = PN

seg-209dacf76ff3 = som i PN-avståndsmätning

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = Portable Network Graphics

seg-06998de7b6be = POD

seg-178f55858efb = precis banbestämning

seg-b7919977bf20 = PPN

seg-ed81960f1282 = parametriserad post-newtonsk

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = precis punktpositionering / realtidskinematik / enpunktspositionering

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = puls per sekund

seg-2619e854281a = PR

seg-66c53cdfc3d9 = pull request

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = pseudoslumpbrus (kodnummer)

seg-6f384580af80 = hur GNSS-satelliter namnges i signaler

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = en tidskrift

seg-78a947083d45 = PSD

seg-6eb799bd1582 = effektspektraltäthet

seg-ab1af8b3d968 = se ovan

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

seg-2800b3a8cd2e = GPS SPS PS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

seg-611e7e4a34f4 = Tysklands nationella metrologiinstitut

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = Precision Time Protocol

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = position, hastighet och tid

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = bindningsbiblioteket mellan Rust och Python / Python Packaging Authority / Python Package Index

seg-96b2c707a6b8 = Parametry Zemli { "1990" }

seg-3d5012a62544 = GLONASS geodetiska datum

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = kvalitetssäkring

seg-7025be647972 = QEMU

seg-d2209c7eea42 = Quick Emulator

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = kvadraturfasskiftmodulation

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = Quasi-Zenith Satellite System

seg-531943b17837 = Japan

seg-697c55525b36 = RAAN

seg-85cd6997e07e = rektascension för uppstigande nod

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = Resist–Detect–Respond–Recover

seg-76da7c5bf39a = resiliensmodellen RethinkPNT/Firesmith

seg-7bb5ed20c788 = RF

seg-35b036272c8e = radiofrekvens

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = högerled

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = kvadratiskt medelvärde / kvadratroten ur kvadratsumman

seg-8b2bd83256f1 = RNG

seg-b90957003307 = slumptalsgenerator

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

seg-43d17f884c69 = ROI

seg-597432415e53 = avkastning på investering

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = Resilient PNT Conformance Framework

seg-2f030c1d70c1 = US DHS

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

seg-4a7703f1b605 = dess meddelandestandard bär CRC-24Q

seg-520c91fa0ef0 = ett öppen källkod-bibliotek för GNSS-positionering (realtidskinematikbibliotek)

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = radiell, transversell, normal

seg-b1b635ff08e4 = ett banfast referenssystem

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = random walk

seg-8b593d7d5dbd = som i bias random walk

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = random-walk-, vit och flicker frekvensmodulation / vit och flicker fasmodulation

seg-7fced178bcc5 = de potenslagsstyrda brustyperna för klockor

seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

seg-0c397d845610 = Microchips produktnamn (två atomklockor i chipskala, en ugnsstyrd kristalloscillator)

seg-8a1ae00c4a52 = namn, inte förkortningar

seg-a58426a850fd = SD

seg-d46cb77d53f6 = standardavvikelse

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = Service Definition Document

seg-9415da7a79ab = som i Galileo OS SDD

seg-1022626b788c = SDK

seg-2076da4dd4dd = utvecklingspaket för programvara

seg-9fb492bced01 = SDR

seg-1a1082059103 = programvarudefinierad radio

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = Space Defense Squadron

seg-c3f6fc1456ed = den 18:e SDS för USA:s satellitkatalog

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = vinkeln Sol–Jord–sond (även sfäriskt sannolikt fel)

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = stokastisk gradientnedstigning

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = enkel harmonisk rörelse

seg-b0973ab206ed = SI

seg-35624e5e4630 = Internationella måttenhetssystemet

seg-02aa435dc884 = SIB

seg-262a811c8b69 = Safety Information Bulletin

seg-b9ee445609f5 = EASA; EASA är Europeiska unionens luftfartssäkerhetsbyrå

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = Solution INdependent EXchange format

seg-3466519e4c62 = geodetiska lösningar

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = sampling importance resampling

seg-7a2e0e9cac08 = ett partikelfilter

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = signal i rymden / noggrannhet för signal i rymden

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = laseravståndsmätning mot satelliter

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = Space Mission Analysis and Design

seg-dfc105c0178b = läroboken

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = signal-brusförhållande

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = kvadratsumma / summa av kvadrerade residualer

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = det främsta som finns (state of the art)

seg-127e73a3610b = NIST Special Publication { "1065" }

seg-bedc9a3d8d9f = samma dokument som NIST SP { "1065" }

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = symmetrisk positivt definit / positivt definit

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = Software Package Data Exchange

seg-c10b1f20f37e = licensidentifierarna i filhuvuden

seg-b377a91a047f = SPK

seg-5603642c612d = SPICE-kärna för efemerider för rymdfarkoster och planeter

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = enskild felpunkt

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = övervakning av signalkvalitet

seg-a4e75468e6f9 = spoofing-kontroller av korrelatorform

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = kvadratrotsinformationsfilter

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = solstrålningstryck

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = Shuttle Radar Topography Mission / dess format för höjdfiler

seg-4692354a98de = rutor namnges efter sitt sydvästra hörn, till exempel N36W117

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = Solar System Dynamics

seg-1d8167212f57 = JPL-gruppen

seg-d21315ea8c52 = STEC

seg-84689b829867 = totalt elektroninnehåll längs sikten (slant total electron content)

seg-eabee4bfb30e = Systems Tool Kit

seg-a7ff60ab0bd9 = en produkt för uppdragsanalys

seg-17d792c12885 = Iridiums tjänst för positionering och tidssynkronisering

seg-3efaadad9c96 = STM

seg-da395fa674ec = tillståndsövergångsmatris

seg-d116578b987b = SV

seg-caa37a1e7d12 = rymdfarkost (en satellit)

seg-845e6f3a37ec = SVD

seg-e775c436db4b = singulärvärdesuppdelning

seg-3e5561868a7f = Scalable Vector Graphics

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = telekommando / telemetri

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = testdriven utveckling

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = skillnad i ankomsttid / frekvens

seg-aecac9c9d2d0 = passiv lokalisering av sändare

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = matchning av terrängkonturer

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = Texas Spoofing Test Battery

seg-941eccec7400 = inspelade GNSS-spoofing-data (OAKBAT är en datamängd av samma slag)

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = tidsintervallfel

seg-eb12660210bd = TIES

seg-9335f08b6381 = Telecommunication Information Exchange Service

seg-12f4af2b48c1 = ITU-medlemskonton

seg-c05ba396ac1e = ToA

seg-78a41e672189 = ankomsttid

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = tolerans

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = total deviation / total varians

seg-7350da5c5c30 = stabilitetsestimatorer med utökat intervall

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

seg-85692b01a12d = TPL

seg-123ed92776a3 = skyddsnivå för tidssynkronisering

seg-10c9563602b7 = se SLOT-TIMING.md

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = värmeskyddssystem

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = terrängreferensnavigering

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = teknisk rapport / teknisk not

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = Delft University of Technology

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = tvåvägs tids- och frekvensöverföring via satellit / tvåvägs tids- och frekvensöverföring

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = u-bloxs binära mottagarprotokoll

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = användarens differentiella avståndsfel

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = användarekvivalent avståndsfel

seg-7d87e82154ed = UFFC

seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

seg-f4da31f92a79 = en IEEE Transactions

seg-573db7b5995b = { "300" } MHz till { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = användargränssnitt / användarupplevelse

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = likformig linjär gruppantenn

seg-db65f4a7586d = ULP

seg-ae7458813685 = enhet på sista siffrans plats (unit in the last place)

seg-d7f4df5a9d13 = precision i flyttal

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = noggrannhet för användaravstånd / fel i användaravstånd

seg-17e8fb142c6c = URA ger gränser för integritet, URE är noggrannhetens RMS

seg-1e02dfc0a52b = URL

seg-f726bcd9d4ad = webbadress (uniform resource locator)

seg-088e05d67af1 = USGS

seg-ffed8eca324d = United States Geological Survey

seg-1ded2eb40061 = USNO

seg-2b5f7bbe22e9 = United States Naval Observatory

seg-39ed84639c60 = USO

seg-f9f684640e53 = ultrastabil oscillator

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-ba97a4005ee8 = VIKOR

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (optimering med flera kriterier och kompromisslösning)

seg-7fe170288e4e = interferometri med mycket lång baslinje

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

seg-1746693259e0 = SBAS; se ovan

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

seg-c9710476b8b5 = arbetsgrupp C inom samarbetet mellan Europeiska unionen och USA om satellitnavigering

seg-79f0e87410bf = publicerar referensdokumenten för ARAIM

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = vitt gaussiskt brus

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

seg-5964aa61f847 = SGP4 använder konstanter från WGS72

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = Wuhan University

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = viktad summamodell / viktad produktmodell

seg-cc68c85bb2b9 = aggregering med flera kriterier (WPM betyder också vit fasmodulation; sammanhanget avgör vilket)

seg-9041c866d202 = XML

seg-0e55c3adc568 = Extensible Markup Language

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = exklusivt eller

seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

seg-195082605699 = komponenterna i det geomagnetiska fältet: nord, öst, ned, total intensitet; deklination, inklination

seg-94835748fcbb = YAGNI

seg-76430d755d74 = you aren't gonna need it

seg-e4e177088376 = en designprincip

seg-565c1908393c = ZHD

seg-77a0948bc15d = hydrostatisk fördröjning i zenit

seg-749be52554c5 = Reproducerbarhet och licensiering

seg-d78d9bbb905c = <b>Reproducerbar (deterministisk).</b> Samma indata ger alltid bit för bit identiska utdata: <c1/>. Ingen dold slump.

seg-1412347e2298 = <b>Frö.</b> Talet som initierar den (deterministiska) slumpgeneratorn, så att körningar går att upprepa.

seg-3a35740e04a8 = <b>Öppen kärna.</b> Affärsmodellen: motorn är gratis och har öppen källkod (AGPL-3.0, GNU Affero General Public License, som definieras nedan; dubbellicensierad kommersiellt); den bärande verksamheten är support, integrering, kommersiella licenser och proprietära tillägg, inte platsavgifter på den öppna motorn.

seg-8ea21ebded3c = <b>AGPL-3.0.</b> GNU Affero General Public License v3, en stark copyleft-licens med öppen källkod som erkänts av OSI (Open Source Initiative). Liksom GPL (GNU General Public License) men med en extra klausul (§{ "13" }) som gäller programvara som erbjuds användare <b>över ett nätverk</b>: en ändrad version som nås över ett nätverk måste erbjuda dessa användare sin motsvarande källkod. Kshanas öppna licens.

seg-f87860d8197d = <b>Dubbellicensiering.</b> Att erbjuda samma kod under två licenser så att användare väljer: här AGPL-3.0 (öppen, copyleft) <b>eller</b> en kommersiell licens från Ashforde OÜ (ett estniskt privat aktiebolag; OÜ = osaühing) för proprietär/sluten användning som AGPL inte passar. Se <c1/>.

seg-dd5f4a1bbbf5 = Används också på kshana.dev

seg-9d0c42560a90 = Förkortningar som webbplatsen använder och som inte finns i arkivets ordlista ovan.

seg-67a54ce8c89e = Global Positioning System

seg-814b0d29bbb2 = bärvåg-till-brustäthet, i dB-Hz

seg-f22a269bc575 = radiobandet på { "1" } till { "2" } GHz som GNSS använder

seg-1f4360a0405c = coarse/acquisition-koden för GPS L1

seg-6f7910207534 = augmented forward signal (månen)

seg-74f02864ce32 = mikroelektromekaniska system

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = obemannat luftfartygssystem

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = skyddsnivå · larmgräns

seg-78134bcc48da = inflygning med vertikal ledning, nivå I

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = låg omloppsbana · geostationär bana

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = CCSDS-meddelanden för banefemerid, banmedelelement och spårningsdata

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = Deep Space Network

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = temperaturkompenserad · ugnsstyrd kristalloscillator

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = passiv vätemaser

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = ultrastabil oscillator · atomklocka för djuprymd

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = maximalt tidsintervallfel · tidsdeviation

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = primär referenstidsklocka · förbättrad PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = Allan-deviation vid medelvärdestiden τ

seg-96fae3b4fb8e = International Telecommunication Union, Telecommunication Standardization Sector

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = normaliserad kvadrerad innovation · normaliserat kvadrerat skattningsfel

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript Object Notation · kommaseparerade värden · Scalable Vector Graphics

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = kommandoradsgränssnitt · programmeringsgränssnitt · integrerad utvecklingsmiljö

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = programvarans innehållsförteckning · Supply-chain Levels for Software Artifacts

seg-347b23148b8f = NDA

seg-969d2489de28 = sekretessavtal

seg-564cfa0d3084 = Digital Object Identifier

seg-5cbd99859d90 = C/N₀-vattenfall

seg-ed4a9e041a83 = ett diagram över bärvåg-till-brustäthet per satellit över tid

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = horisontell · vertikal skyddsnivå

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

seg-c5da9d350518 = <s1>Föregående</s1>Introduktion till begrepp

seg-670504be0531 = <s1>Nästa</s1>Studioguide
