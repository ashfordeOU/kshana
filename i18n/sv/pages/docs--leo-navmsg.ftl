# docs--leo-navmsg: translations (sv)

seg-cc651d9cef3b = Kod

seg-cbf0f9bcd2d8 = Oberoende referens

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Källa

seg-e305279d5b11 = Innehåll

seg-4d208b6c0eb8 = dygn

seg-02dc0d42fb21 = sfu

seg-0f2d3faa9934 = Källa: <c1/>

seg-d8aaee95aa44 = Scenariotypen <c1/> bygger sändningsefemeriden och klockmeddelandet för en satellit för positionering, navigering och tidssynkronisering (PNT) i låg omloppsbana (LEO) och besvarar de frågor som den som utformar ett meddelande ställer: hur länge kan ett meddelande gälla, vad ger varje extra parameter, vad ser en användare när meddelandet byts mitt i en passage, och hur många bitar krävs för att bära det med centimeternoggrannhet.

seg-e61283b1e1a5 = Den är systemoberoende. Valfri bana, valfri bärvåg och någon av fyra efemeridmodeller körs helt utan förinställning; de namngivna förinställningarna är valfria data (se <a1>Förinställningar</a1>).

seg-1271cd4ad822 = Skriv ut ett medföljande exempel med <c1/> (ett namn per anrop) och kör det med <c2/>: <c3/>, <c4/>, <c5/> och <c6/>. Typen är också meddelandesteget i typen <c7/> (<a1>LEO-PNT.md</a1>) och en del av kampanjen <c8/>, som sätter ihop fyra meddelandekonfigurationer och redovisar ramlängden för var och en ({ "146" }, { "154" }, { "159" } och { "171" } bytes).

seg-51da9ffaa0ec = Kod: <c1/> — <c2/> (poster och användaralgoritm), <c3/> (referensbana och referensklocka), <c4/> (anpassning), <c5/> (avståndsfel i signalen i rymden), <c6/> (jonosfär och Coordinated Universal Time (UTC)), <c7/> (binärt format), <c8/> (exporter i stil med Receiver Independent Exchange Format (RINEX) och kommaseparerade värden (CSV)), <c9/> (en fil per förinställning), <c10/> (typen).

seg-0505113a62e3 = Vad ett meddelande innehåller

seg-6752521002b2 = Del

seg-cf6ae60eea4f = Hjälpdata

seg-00eae74cb1e6 = satellitidentifierare (SVID), dataversion (IOD), bandidentifierare, signalens hälsostatus (Galileo-konvention: { "0" } OK, { "1" } ur drift, { "2" } utökad drift, { "3" } under test)

seg-0bdbdd2c923b = Synkronisering

seg-8120237b02ea = veckonummer, veckotid (TOW) för sändningen och ett klockpolynom av andra ordningen <c1/>

seg-b09dc4b322d3 = Efemerid

seg-bbb3225e1d19 = en av de fyra modellerna nedan

seg-3a835a49b43f = Övriga tjänster

seg-2a13461cb60c = en Klobuchar-uppsättning för sänd jonosfärskorrektion, Galileo NeQuick-G-koefficienter <c1/> med fem stormflaggor, samt parametrar för systemtid till UTC <c2/>

seg-6b899ef63047 = Efemeridmodeller

seg-60cd077d82a7 = Modell

seg-2afa300864a9 = Parametrar

seg-3e8a1cf183cc = den keplerska uppsättningen i Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD): <c1/>

seg-b1416ba3472f = samma, plus korrektionspolynom längs banan, tvärs banan och radiellt (RAC) <c1/>, <c2/>, <c3/> i <c4/>, koefficienter i meter, <c5/> den tvåpotens som ligger vid eller över halva anpassningsintervallet (sänds), gradtal som anges av <c6/> (standard { "7" }, { "5" }, { "6" })

seg-9c0643152bbf = som standard { "16" } + { "21" }, plus tidsskalan

seg-e0afd541d64c = 22-parametersmodellen av Liu, Su, Xie, Zhou och Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): de { "16" } plus <c1/>

seg-a6042071a03f = ATOMIC-modellen (Autonomous Time and Orbit Determination for Microsatellite Constellations) med "nollklocka": ett jordcentrerat jordfast (ECEF) polynom per axel i <c1/> (standardgrad { "6" }), inga klocktermer eftersom satellitklockan styrs mot systemtid (<a1>InsideGNSS</a1>)

seg-5869d6f65796 = som standard { "22" }

seg-6663aa3eeebc = Användaralgoritmen (<c1/>) är Galileo ICD:s sekvens (Keplers ekvation, korrektioner av andra övertonen, jordfast nod) följd, för <c2/>, av de tre polynomen längs den keplerska banans eget system: radiellt längs den beräknade positionen, tvärs banan längs banans normal utifrån korrigerad inklination och nod, och längs banan som fullbordar triaden. Klockan lägger till ICD:s relativistiska term <c3/>; för <c4/> är det den allmänna formen <c5/> från polynomet och dess derivata.

seg-b3935a85a7b2 = Termerna enligt Liu m.fl. följer artikelns användaralgoritm (avsnitt { "2.2" }, ekv. 1-7): <c1/>, <c2/> (utgåvor före { "0.30" } använde konventionen för Global Positioning System (GPS) civil navigering <c3/>, så en <c4/> som de skrev är dubbelt så stor som artikelns), och <c5/> adderat till radien, där <c6/> är det okorrigerade breddargumentet. Skalkonventionen för <c7/> är hämtad från artikelns ekv. { "1" }; jämförelsen med artikeln på verkliga banor beror inte på den (en faktor ½ på <c8/> lämnar varje anpassad storhet oförändrad), så innebörden av ett sänt <c9/>-värde är inte validerad där.

seg-9a83292bffcf = Två tolkningar är Kshanas egna och anges som sådana:

seg-0e42fd0d5cf9 = RAC-systemet och normaliseringen <c1/>. Inget offentligt dokument definierar ett LEO-korrektionssystem för ett sänt meddelande.

seg-1b8aaed09de8 = Klockan i ett meddelande med nollklocka är noll totalt: styrslingan antas hålla den skenbara klockan, inklusive den relativistiska termen, vid systemtid.

seg-3472ce139588 = Anpassningen

seg-4404a677d185 = <c1/> integrerar banan med en Runge–Kutta av fjärde ordningen med fast steg i ett system som övergår i jordfasta axlar genom en rotation, <c2/>, samma enda rotation som en sänd användaralgoritm tillämpar. Gravitationen är tvåkropps (<c3/>), de zonala övertonerna J2 till J6 ({ "2" } till { "6" }) eller fältet Earth Gravitational Model { "2008" } (EGM2008) till grad och ordning { "7" } till { "70" }, vars tesserala termer bär den kortperiodiska signatur som gör en LEO-anpassning svår. Luftmotstånd är valfritt (statisk exponentiell täthet). Klockan är antingen fritt gående (bias, drift, driftändring och vitt frekvensbrus vid en angiven Allan-deviation på en sekund, plus den periodiska relativistiska termen) eller styrd (en residual av Gauss–Markov av första ordningen).

seg-ae3052e66b2a = <c1/> anpassar den keplerska uppsättningen med Levenberg–Marquardt på icke-singulära element (<c2/>, <c3/>, <c4/>): en LEO-bana är nästan cirkulär, så <c5/> och <c6/> är var för sig nästan omöjliga att skilja åt. Den startar från det oskulerande tillståndet vid <c7/> med J2-nodhastigheten. Svaga nollcentrerade a priori-villkor begränsar de hastigheter och övertoner som en kort båge inte kan lösa upp; med en observationsvikt på { "1" } cm verkar de bara i just de nollriktningarna. Anpassningen <c8/> utgår i stället från artikelns start och skattare i avsnitt { "2.3" }: den börjar med alla korrektionstermer lika med noll, har inga a priori-villkor (vanlig minstakvadratmetod) och behåller artikelns tak på 100 iterationer. Den stoppar enligt Kshanas egen konvergensregel för parametrar, när varje parametersteg är mindre än { "1e-3" } av dess formella standardavvikelse; artikeln stoppar i stället när RMS ändras med mindre än { "0.1" } mm. RAC-polynomen anpassas därefter till residualerna längs/tvärs/radiellt med linjär minstakvadratmetod, och klockpolynomet till referensklockan minus den relativistiska term som användaren lägger tillbaka.

seg-020f45edcae1 = Ett fynd som standardvärdena speglar: efter en keplersk minstakvadratanpassning är residualen per konstruktion det som de { "16" } parametrarna inte kan spänna upp, så den svänger över fönstret (flera nollgenomgångar i varje komponent) i stället för att driva. Ett korrektionspolynom tar bort den först när dess grad överstiger vad den keplerska uppsättningen redan spänner upp: längs banan { "7" }, tvärs banan { "5" } och radiellt { "6" } tar en residual på centimeter över 15 minuter ner till ungefär en millimeter, medan lägre grad tvärs banan tar bort nästan ingenting (residualen tvärs banan är udda kring fönstrets mitt). Ett system som härleder sin keplerska del på något annat sätt lämnar en residual med annan form, och de grader det behöver följer av den. Förinställningen Celestes egna korrektionsgrader (lägre än dessa; de finns bara i förinställningsfilen, <c1/>) körs här på Kshanas minstakvadratbas, vilket är anledningen till att dess tvärbanetermer bidrar lite i den här motorn: ett påstående om Kshanas anpassning, inte om något verkligt system. <c2/> och <c3/> är hela sekunder, eftersom det binära formatet bär dem så.

seg-f3538e6651fa = Varje meddelande används under en period centrerad i sitt anpassningsfönster (den första avvägningstabellen använder hela fönstret). Det som siffrorna för avståndsfel i signalen i rymden (SISRE) mäter är meddelandets <b>representationsfel</b> mot den referens det anpassades till, som ett kvadratiskt medelvärde (RMS) och ett maximum över intervallet. Felet vid banbestämning och banprediktion, som ett verkligt mark- eller ombordsegment lägger till ovanpå, modelleras inte.

seg-c2b181269367 = Avståndsfel i signalen i rymden

seg-63462a1abc95 = <c1/> använder det globala genomsnittliga SISRE från Montenbruck, Steigenberger och Hauschild ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

seg-c4f654264c42 = Vikterna är medelvärdena över användare jämnt utspridda på den synliga jordkalotten av <c1/> och <c2/>, där <c3/> är nadirvinkeln för siktlinjen vid satelliten, beräknad för banans egen radie och elevationsmask. Vid en mask på { "0" }° återger beräkningen artikelns tabell för medelhög jordbana (GPS { "0.98" } och 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) och geostationär bana ({ "0.99" } och 1/126): det är kontrollen som är <b>VALIDATED</b>. I LEO ger samma medelvärde

seg-66b488889b10 = Höjd

seg-c07128592d7b = nadirvinkel vid horisonten

seg-a4e04d9a23a5 = { "320" } km

seg-002adc24471f = { "510" } km

seg-fe2f70c29806 = { "550" } km

seg-4dee38ff0811 = { "786" } km

seg-cfc3c6939861 = { "1080" } km

seg-102de0413553 = { "1336" } km

seg-1b11819c8b2f = så en LEO-användare, som ser satelliten långt från nadir, känner av fel längs och tvärs banan mycket mer än en användare i medelhög bana.

seg-b7a844ab6135 = Analyser

seg-17111fe25e04 = <c1/> väljer vilken som helst av de fyra (standard alla).

seg-d0c1b335af73 = Avvägning av anpassningsintervall

seg-f65e99c0d8b2 = <c1/> anger intervallet, anpassningsintervallen, uppdateringsperioderna och modellerna. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 till grad { "20" } och luftmotstånd, { "30" } minuter av meddelanden) ger, med användningsperioden lika med anpassningsintervallet:

seg-f1a94c795c18 = Anpassningsintervall

seg-c6b034712788 = SISRE bana RMS

seg-55c287c93940 = SISRE bana max

seg-ad604a608329 = SISRE med klocka RMS

seg-28723ab60ae0 = radiellt / längs / tvärs RMS

seg-911a62245e80 = { "60" } s

seg-1a35a89c1a34 = { "0.041" } cm

seg-7cf9e6e3178f = { "0.179" } cm

seg-d8a7f4c080dd = { "0.069" } cm

seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

seg-64015edf42d8 = { "120" } s

seg-a1070c338686 = { "0.032" } cm

seg-cdacf90f8ce8 = { "0.160" } cm

seg-29aeee696ad2 = { "0.079" } cm

seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

seg-8fa4e4ccc5cc = { "180" } s

seg-13182ae6d536 = { "0.093" } cm

seg-fc692062aaa8 = { "0.540" } cm

seg-9ef760f0777c = { "0.134" } cm

seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

seg-bbd4f2685bee = { "300" } s

seg-93410318239b = { "0.310" } cm

seg-4af8f1c977eb = { "1.033" } cm

seg-0921a535896a = { "0.329" } cm

seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

seg-8de43db30454 = { "450" } s

seg-ec7f9ca7654b = { "1.690" } cm

seg-1ad55674fab9 = { "7.542" } cm

seg-a022913c956d = { "1.696" } cm

seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

seg-21b0c99fbda4 = { "600" } s

seg-6840aea9ff12 = { "2.875" } cm

seg-798c8c1d0190 = { "10.219" } cm

seg-6b3b442069d8 = { "2.866" } cm

seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

seg-4dabf1faddfc = { "900" } s

seg-d733d3fdac02 = { "9.345" } cm

seg-3334d120521b = { "34.032" } cm

seg-4d4a2cc180d0 = { "9.349" } cm

seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

seg-f1d733b03f45 = { "0.000" } cm

seg-81a60d921ce9 = { "0.057" } cm

seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

seg-c8a720a6f160 = { "0.074" } cm

seg-b13f5539e4b1 = { "0.001" } cm

seg-1c9d3ee30ac7 = { "0.090" } cm

seg-7dd08c671dc7 = { "0.004" } cm

seg-740e69fcd85e = { "0.014" } cm

seg-c0db4312d8a0 = { "0.106" } cm

seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

seg-f3bda174cbef = { "0.037" } cm

seg-5a5bb868e8ff = { "0.176" } cm

seg-02b99fcb9fee = { "0.127" } cm

seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

seg-ec1e77bc5be9 = { "0.214" } cm

seg-d3c1ed834802 = { "0.643" } cm

seg-23482e7c028f = { "0.229" } cm

seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

seg-bfec9407ffae = { "1.015" } cm

seg-f295ad6efcf4 = { "3.695" } cm

seg-2cd92d16edfc = { "1.062" } cm

seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

seg-4e19f776d1b7 = Och med en anpassning på { "300" } s, med varierande hur ofta ett nytt meddelande tar över:

seg-89810ffbeff3 = Uppdateringsperiod

seg-d4d1fa05e1a8 = { "0.314" } cm

seg-828b7488993b = { "0.850" } cm

seg-edb934c1419f = { "0.288" } cm

seg-52c8f821a7d2 = { "0.859" } cm

seg-e135107af135 = { "150" } s

seg-e7ce46d74f3e = { "0.219" } cm

seg-3391df1cf909 = { "0.830" } cm

seg-d6eb4f554461 = { "0.009" } cm

seg-22c68874002b = { "0.010" } cm

seg-2172d9ea618e = Den keplerska uppsättningen med 16 parametrar försämras från { "0.04" } cm vid { "60" } s till { "9.35" } cm vid { "900" } s: en keplersk uppsättning med övertoner två gånger per varv kan inte följa de högfrekventa gravitationstermerna och luftmotståndet i en LEO-båge i mer än några minuter, och dess minstakvadratresidual svänger över fönstret. Polynomen längs/tvärs/radiellt (grader { "7" }, { "5" }, { "6" }) tar hand om det som återstår: { "1.01" } cm vid { "900" } s, { "0.21" } cm vid { "600" } s. Vid de kortaste intervallen ligger de keplerska siffrorna under en millimeter och är inte längre strikt ordnade (anpassningen begränsas då av konditioneringen, inte av modellen).

seg-aca262796570 = Modelljämförelse

seg-fdf2368d0210 = <c1/> kör de fyra modellerna vid { "1" }, { "5" } och { "10" } minuter på samma bana, med antalet parametrar och efemerid- och klockbitarna i Kshanas kodning:

seg-7d3c6c43390d = Efemerid- + klockbitar

seg-f7f60c66d89e = { "0.022" } cm

seg-f7bcb8a44fde = { "0.049" } cm

seg-2972b631701e = { "0.230" } cm

seg-cc42e8dc7238 = { "0.260" } cm

seg-67e50069c6f7 = { "3.061" } cm

seg-780954ab9d7f = { "3.071" } cm

seg-de81d6550264 = { "0.044" } cm

seg-fb171bf75f27 = { "0.005" } cm

seg-c8c067631f7a = { "0.120" } cm

seg-2dc41855c245 = { "0.208" } cm

seg-6ef79938dd22 = { "0.046" } cm

seg-7e96d7e34e63 = { "0.142" } cm

seg-c43199891163 = { "0.258" } cm

seg-f9a9fdebc114 = { "0.290" } cm

seg-f157ff5b40b1 = <c1/> (nollklocka)

seg-9474a775dc5e = { "28.784" } cm

seg-5098c8b6f813 = { "0.561" } cm

seg-5e7fdc441b03 = { "28.774" } cm

seg-82d3fa2e27ef = Raden med nollklocka bedöms mot en klocka som styrs med en residual på { "0.24" } m (ATOMIC-värdet), de övriga mot den fritt gående klocka de anpassar.

seg-769db176020f = <b>Liu m.fl. { "2025" }, SISRE mot höjd (MODELLED).</b> Samma scenario anpassar Kshanas 22-parametersmodell över bågar på 20 minuter vid artikelns fem höjder, med varje satellits inklination:

seg-01e587427a7e = Satellit

seg-f6bbd3d5d75c = Inklination

seg-c54d0bd7d498 = Liu m.fl. { "2025" }

seg-16c489b75f44 = Kshana (RMS endast bana)

seg-ee4816ca13c1 = kvot

seg-510349500d23 = { "8.88" } cm

seg-a97bde451ec2 = { "4.25" } cm

seg-b6c1d48847d9 = { "475" } km

seg-f79249e9bd75 = { "6.21" } cm

seg-9b6757a674a5 = { "2.87" } cm

seg-62008169ca69 = { "2.20" } cm

seg-06a4bcde0ea3 = { "966" } km

seg-9e5e06ec23c3 = { "2.11" } cm

seg-41ce80bc0b62 = { "1.25" } cm

seg-c9f63cd8bd07 = { "0.75" } cm

seg-f11a960a1d52 = { "0.51" } cm

seg-0376cf5f98f0 = Detta är <b>inte</b> en validering. Artikeln anpassade verkliga precisa vetenskapliga banor för de namngivna satelliterna (med deras fulla gravitations-, luftmotstånds- och icke-gravitationshistorik); Kshana anpassar sin egen integrerade bana, beräknar de sex tillagda parametrarna som beskrivits ovan och använder sina egna SISRE-vikter. Jämförelsen visar trenden och storleksordningen. Jämförelsen på de verkliga banor som artikeln anpassade är <c1/> (sedan { "0.30" } stämmer 22-parametersanpassningen där överens inom den i förväg fastställda faktorn { "1.5" }, på artikelns dagar och på åtta undanhållna dagar).

seg-d82887c766e3 = Uppdatering mitt i passagen

seg-d1104b6ea7fa = <c1/> placerar en användare (standard { "45" }° N, { "10" }° E), hittar den högsta passagen över masken inom <c2/> och schemalägger meddelanden var <c3/>. Vid varje byte inom passagen redovisas positionshoppet, klockhoppet, användarens pseudoavståndshopp (nytt minus gammalt meddelande), det största hopp någon synlig användare kunde se (sluten form över nadirkonen), avståndsfelet före och efter, samt PASS eller FAIL mot <c4/>. <c5/> (anpassningar på { "300" } s som uppdateras var { "150" } s):

seg-7d91304c87e3 = Den högsta passagen under ett dygn når { "43.7" }° och varar { "455" } s. Dess byten:

seg-289e8da49cc8 = Byte

seg-e80d12ee2259 = Elevation

seg-b16789d14338 = Positionshopp

seg-b3c252609532 = Klockhopp

seg-8239a390ec71 = Avståndshopp för användaren

seg-4153faf7969d = Hopp vid sämsta geometri

seg-14402c7fb332 = IOD { "270" } → { "271" }

seg-7862a97ac55f = { "0.07" } mm

seg-4cfe934c881f = { "0.19" } mm

seg-9e9752920165 = -0.17 mm

seg-4267557786be = { "0.27" } mm

seg-46872e8925b2 = IOD { "271" } → { "272" }

seg-4c803fd2ccc9 = { "0.14" } mm

seg-cc9a8388f6bc = -0.24 mm

seg-0549f7fd0633 = IOD { "272" } → { "273" }

seg-ad1afcf9a466 = -0.22 mm

seg-c1b30171b4f0 = { "0.35" } mm

seg-f93647402fa9 = { "0.48" } mm

seg-69b35182807c = Största avståndshopp för användaren { "0.35" } mm mot en tröskel på { "5" } cm: <b>PASS</b>.

seg-96dcb456600d = Koda och avkoda

seg-1b3674a0e041 = <c1/> kodar det första av tre meddelanden, avkodar det, kontrollerar CRC och avvisar en skadad kopia, skriver ut kvantiseringsbudgeten, samt skriver och läser tillbaka RINEX-blocket och CSV-tabellen:

seg-480eb9ffc333 = ram: { "171" } bytes ({ "1310" } nyttolastbitar, varav { "1045" } är efemerid och klocka), 24-bitars cyklisk redundanskontroll (CRC-24Q) <c1/>;

seg-0e2a64a063fd = största effekt av ett halvt steg för något enskilt fält: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = hela meddelandet efter kvantisering: position inom { "1.126" } mm och klocka inom { "0.185" } mm från det exakta meddelandet; SISRE { "0.113" } cm exakt, { "0.129" } cm avkodat;

seg-6e818708b695 = en ram med en omvänd bit avvisas: true;

seg-31fe0f6b133d = RINEX-rundtur inom { "5.0e-06" } m, CSV-rundtur inom { "0.0e+00" } m.

seg-405cf34090cc = Plattformsoberoende

seg-7f2193f6ff06 = En ram består av sända heltal, så den måste vara samma heltal oavsett var och hur scenariot körs: den inbyggda binären på vilket operativsystem som helst, en debug- eller release-bygge, och WebAssembly-bygget (WASM) i en webbläsare. Tre saker stod i vägen. Sinus, cosinus, arcustangens och exponentialfunktion i en värds matematikbibliotek måste inte vara korrekt avrundade och skiljer sig mellan värdar i sista siffran. Ett optimerat bygge på macOS hämtar sinus och cosinus för ett argument från systemets kombinerade rutin, som inte alltid returnerar samma värde som den ensamma sinusen, så ett debug- och ett release-bygge skilde sig också åt. Och den vanliga normalfördelningsgeneratorn anropar värdens exponential och logaritm i sina sällsynta grenar. Anpassningen förvandlar en så liten skillnad till olika kvantiserade fält. Hela typen (referensbana och referensklocka, anpassning, användaralgoritm, avståndsfel i signalen i rymden (SISRE), kodek) beräknar därför varje sådan funktion med Rust-biblioteket <c1/> genom <c2/>, heltalspotenser som uttryckliga produkter och normalfördelade värden med polarmetoden på generatorns råa utdata. <c3/> fastställer den 171 bytes långa ramen i scenariot för kodning och avkodning nedan och ett kontrollvärde per efemeridmodell; ett debug-bygge, ett release-bygge och WASM-bygget ger byteidentiska resultatdokument för alla fem medföljande <c4/>-scenarier.

seg-1ef00467df17 = Binärt format

seg-af2dae9e9e7c = <b>Detta är Kshanas egen dokumenterade kodning.</b> Den bär de komponenter som de publicerade beskrivningarna av LEO-navigeringsmeddelanden nämner, modellerad efter Galileo ICD:s fältuppsättning. Den är <b>inte</b> bitlayouten för Celeste eller något annat system: ingen sådan är offentlig.

seg-6a730c01ad1c = Ram: preamble <c1/> ({ "8" } bitar), version { "1" } ({ "4" }), modell ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), nyttolastlängd i bytes ({ "12" }), nyttolast nollfylld till en byte, CRC-24Q (en 24-bitars cyklisk redundanskontroll, { "24" } bitar) över varje föregående byte. CRC-24Q är kontrollen i standarden RTCM { "10403" } från Radio Technical Commission for Maritime Services och i Galileo ICD (polynom <c6/>, startvärde { "0" }); koden återger katalogens kontrollvärde <c7/> för <c8/> och kontrollbytena i exempelramen för RTCM { "10403" } meddelandetyp { "1005" } (<b>VALIDATED</b>).

seg-a31d899eb435 = Stegen i Galileo ICD valdes för medelhög jordbana och är för grova för ett LEO-meddelande på centimeternivå: <c1/> i steg om { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm vid LEO-radie), vinklarna { "2" }⁻³¹ halvcirklar ({ "1.0" } cm) och <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana behåller ICD:s enheter och halvcirkelkonventionen, förfinar stegen så att varje fälts fel för ett halvt steg stannar under { "1" } mm i position eller avstånd över ett fönster på 15 minuter, och vidgar fälten för att rymma de intervall som en LEO-anpassning behöver:

seg-caddc6f5b9a7 = Block

seg-b548b723c201 = Bitar

seg-d00b65801e9b = Steg

seg-2085d172bec3 = hjälpdata och synkronisering

seg-7e9018f82811 = vecka

seg-45cbfedb6f0e = klocka (flaggbit { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = Kepler (modeller 1-3)

seg-3fb59c8238cb = halvcirkel

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = korrektioner längs/tvärs/radiellt (modell { "2" })

seg-131652f53721 = tillägg enligt Liu m.fl. { "2025" } (modell { "3" })

seg-fccf37a24fc4 = halvcirkel/s^{ "2" }

seg-ebde561c17ab = ECEF-polynom (modell { "4" })

seg-822c7482547c = Klobuchar (flaggbit { "1" })

seg-7dd6e8bcaf43 = s/halvcirkel^{ "2" }

seg-09408b08c481 = s/halvcirkel^{ "3" }

seg-734162101b2d = NeQuick-G (flaggbit { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (flaggbit { "3" })

seg-545755e7b26f = Ett värde utanför fältets intervall avvisas, det lindas inte runt. Intervallen kontrollerades genom att koda anpassningar vid { "300" } till { "2000" } km, inklinationer från { "0" }° till { "140" }° och anpassningsintervall upp till { "20" } minuter: <c1/> och <c2/> är breda eftersom noden är dåligt definierad i en bana nära ekvatorn och anpassningen fördelar J2-driften i breddargumentet mellan dem, och <c3/> och <c4/> eftersom 22-parametersanpassningen över { "20" } minuter tar upp en del av den kortperiodiska svängningen i halva storaxeln. Sedan { "0.30" } är 22-parametersanpassningen artikelns vanliga minstakvadratmetod utan a priori-villkor, och en anpassning vid { "800" } km nära ekvatorn behöver då <c5/> på ungefär { "6.3e-10" } halvcirkel/s^{ "2" }, så dess skala gick från { "2" }^-60 till { "2" }^-58. Korrektionerna längs banan av grad 7 som <c6/> använder ryms i koefficientintervallet på 22 bitar upp till { "15" } minuter; en längre anpassning kan överskrida det och avvisas då. <c7/> redovisar, för varje efemerid- och klockfält, den största positions- och avståndsändring som en ändring med ett halvt steg ger över användningsperioden, samt ändringen av hela meddelandet efter kvantisering.

seg-1ad17f3d3643 = Textexporter

seg-81fb376aa1e1 = <b>RINEX { "4.02" } definierar inga LEO-navigeringsposter</b> (dess systembokstäver är G, R, E, J, C, I och S; <a1>International GNSS Service (IGS) RINEX { "4.02" }</a1>). Blocket som <c1/> skriver lånar formen från RINEX { "4" } — ett postrubrik <c2/>, en rad med satellit och epok med tre klocktermer, sända banrader med fyra <c3/>-fält — och är ett <b>dokumenterat Kshana-tillägg</b>: systembokstav <c4/>, posttyper <c5/>, <c6/>, <c7/>, <c8/>, och tre rubrikkommentarer som säger det. Tidigare arbete om LEO-banor i navigeringsposter i RINEX-4-stil: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = CSV-tabellen bär meddelandena <c1/> och <c2/>, ett per rad. Standardkolumnerna använder namnen i Galileo ICD (<c3/>); <c4/> väljer i stället en förinställnings stavning. Båda formaten kan läsas tillbaka.

seg-4a26902d2771 = Jonosfär och UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: motorns L1-modell (<c1/>, kontrollerad mot RTKLIB) skalad till bärvågen med förstaordningslagen <c2/>.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: koefficienterna sänds i meddelandet och <c1/> returnerar <c2/> för en modifierad dip-latitud <c3/>, med algoritmens regler (koefficienter som alla är noll ger { "63.7" } solar flux units, sfu; resultatet begränsas till [{ "0" }, { "400" }] sfu). Elektrontäthetsmodellen NeQuick och dess integrering längs signalvägen, som omvandlar <c4/> till en fördröjning, är <b>inte</b> implementerade.

seg-66dbd447dfeb = En satellit på några hundra kilometers höjd flyger inuti jonosfären. Ingen av de sända modellerna tar hänsyn till elektroninnehållet ovanför satelliten, och ingen korrektion för det tillämpas.

seg-7befd59b2ac6 = <b>UTC</b>: <c1/> tillämpar de tre fallen i Galileo ICD §{ "5.1.7" } (före, inom sex timmar från och efter en skottsekundshändelse); en inskjuten sekund läses som { "86400" }.

seg-2b0d77219437 = Förinställningar

seg-d2908020db08 = Förinställningar är data, en fil vardera under <c1/>, med sina källor. Motorn och alla medföljande scenarier utom Celeste-scenariot körs utan dem.

seg-c353e7bec219 = Nyckel

seg-5566e1d71a4f = Bana

seg-33f4c7af9c53 = Bärvåg

seg-f4510e898031 = Meddelandemodell

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-890aa92157e4 = { "1080" } km, { "53" }°

seg-1eca13ba2309 = X1 { "1593.3225" } MHz

seg-ee9947222a30 = inte publicerad

seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

seg-f016786d7755 = { "520" } km, { "97" }°

seg-780e931bf88d = PUBLIC, <a1>RNTF-rapport</a1>, konstellationsbeskrivning

seg-d5df094a5f89 = { "781" } km, { "86.4" }°

seg-94bc78cee128 = { "1621" } MHz (bandet { "1616" }–{ "1626" } MHz)

seg-3f5de7f74502 = ingen sänds

seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, konstellationsbeskrivning

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-2ef501f97eff = Ku-band, värde i mitten av bandet (representativt)

seg-567fab40bd24 = ingen (opportunistiska signaler)

seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

seg-f5dd5086eedd = { "700" } km, { "55" }°

seg-5fa6b60f66b4 = nära B1 (maskerad i källan; L1 som ersättning)

seg-5ebbf0042d7c = REPRESENTATIVE

seg-4f3e5a683682 = { "600" } km, { "97.8" }°

seg-c06f62ca5173 = { "5020" } MHz (mitten av RNSS C-bandet)

seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

seg-3b1fd041f9ba = { "500" } km (representativt)

seg-522c85402d84 = L1 (representativt)

seg-064b03765e4d = <c1/>, grad { "6" }, { "60" } s, uppdaterad var { "30" } s, nollklocka, { "0.24" } m styrresidual

seg-5619bc61b958 = WORKSHOP och PUBLIC

seg-20572d7e348d = { "510" } km, { "97.4" }°

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-fad0950a2d67 = <c1/>, gradtal och postavstånd i förinställningsfilen

seg-e881ffc4e14b = RNSS är radionavigeringssatellittjänsten; RNTF är Resilient Navigation and Timing Foundation.

seg-e9524c71636d = <b>Celeste IOD.</b> Förinställningen för Europeiska rymdorganisationens (ESA) Celeste-demonstration i omloppsbana (IOD) är den enda som använder material som presenterades vid ESA:s LEO-PNT-workshop inom Navigation Innovation and Support Programme (NAVISP), { "2026" }: meddelandestrukturen (Galileos keplerska uppsättning plus korrektionspolynom längs/tvärs/radiellt, klockpolynom, SVID, hälsa, IOD, jonosfärs- och UTC-parametrar), postavståndet och CSV-kolumnnamnen. Banan ({ "510" } km, nästan polär solsynkron) och bärvågen kommer från offentliga källor som anges i filen. Bitlayouten för Celeste är inte offentlig och återges inte; senare Celeste-faser och Europeiska unionens (EU) LEO-PNT-system kan skilja sig åt. Varje värde som härrör från workshopen finns i modulen <c1/> i <c2/>, som används av <c3/>. Så hålls förinställningen undan: varje tal från workshopen i motorn finns i en enda fil, <c4/>, som <c5/> bara kompilerar in när den finns, och i de scenarier som bara finns i förrådet <c6/>. Om man tar bort den filen och de scenarierna hålls förinställningen undan utan någon källkodsändring; alla andra tester, referenser och scenarier körs utan den, och antalet scenariofiler i README räknar fortfarande med de undanhållna filerna.

seg-906da2752f76 = Verifiering

seg-7338b6210228 = Rad

seg-c5ce76c91ff7 = Etikett

seg-cfe0d596296e = SISRE-vikter

seg-3e0059048a0d = tabellen i Montenbruck m.fl. { "2018" } (GPS, GLONASS, Galileo, BeiDou, geostationär)

seg-0f5e73171fe0 = Användaralgoritmen i Galileo ICD

seg-29ad977ef423 = RTKLIB <c1/> på fyra verkliga sända Galileo-efemerider, { "1" } mm per axel (<c2/>)

seg-ecec254e8219 = katalogens kontrollvärde <c1/>; exempelramen RTCM { "10403" } { "1005" }

seg-388633e4e785 = Anpassning och SISRE-avvägning

seg-8b85c3277e66 = tvåkroppsreferens återfunnen inom { "1" } mm; korrigerad J2–J6-anpassning inom { "1" } mm; monoton tillväxt med intervallet

seg-4de7f2b173c5 = Kontinuitet mitt i passagen

seg-bdbd2771c7f5 = hoppidentitet; konbegränsning i sluten form mot sampling

seg-468a92a2caf7 = Binärt format och budget

seg-ba26f5f63172 = rundturer; varje fälts halva steg under { "1" } mm

seg-9be43cbef131 = RINEX-stil och CSV

seg-a7748156fd6e = rundturer

seg-88b5cda10923 = 22-parametersmodellen och anpassningen enligt Liu m.fl. { "2025" }

seg-7272ebdc1fec = Precisa banor från TU Graz ITSG för fyra satelliter mot artikelns tabeller { "4" }, { "5" }, { "6" } och { "8" }: kvoterna för längs, tvärs, radiellt och SISRE { "0.755" } till { "1.138" } på artikelns dagar och { "0.683" } till { "1.186" } på åtta undanhållna dagar, inom 1.5x (<c1/>)

seg-94066142a642 = ATOMIC-polynomet med nollklocka och tabellen för fem höjder

seg-205cdc6a3696 = ATOMIC-uppgifter från InsideGNSS; den publicerade Liu-tabellen återgiven bredvid Kshanas anpassning på integrerad bana, inte fastställd

seg-8c00ed11609c = ICD:s slutna former; Klobuchar-modellen kontrollerad mot RTKLIB

seg-d5653e0958b5 = SISRE är bara representationsfel: inget fel vid banbestämning eller banprediktion.

seg-4968d9fcbc19 = Referensen är en integration i Kshana (ingen tredje kropp, strålningstryck från solen eller tidvatten), inte en verklig satellits precisa bana.

seg-6a4a1bf21b50 = Det binära formatet och RINEX-blocket är Kshanas egna.

seg-26c0a2693081 = NeQuick-G sänds men integreras inte till en fördröjning; ingen korrektion för en satellit inuti jonosfären.

seg-2a0c8190c38e = Jämförelsen med Liu m.fl. skiljer sig i banor, tolkning av parametrar och vikter.

seg-4abe216f987a = <s1>Föregående</s1>LEO-passage och länkbudget

seg-59d9bf4735d8 = <s1>Nästa</s1>Sammanslagen MEO- och LEO-positionering
