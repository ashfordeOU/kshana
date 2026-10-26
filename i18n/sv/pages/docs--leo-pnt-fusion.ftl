# docs--leo-pnt-fusion: translations (sv)

seg-cae10fb9bff8 = Scenario

seg-f63dd3d7aad4 = Källa

seg-587beeccaa11 = Förinställning

seg-a6c63abeb7e6 = Medföljande scenarier

seg-354b42e3a5d0 = RNTF

seg-c5ce76c91ff7 = Etikett

seg-9673ca8c2705 = Källa: <c1/>

seg-989faf40651b = Sammanslagen positionering, navigering och tidssynkronisering med MEO och LEO

seg-c14c586a29e7 = Tre scenariotyper ger positionering, navigering och tidssynkronisering (PNT) med satelliter i låg omloppsbana (LEO) ensamma eller sammanslagna med de globala satellitnavigeringssystemen (GNSS) i medelhög omloppsbana (MEO): <c1/> (position, hastighet och tid), <c2/> (precis punktpositionering) och <c3/> (ett icke-jordbaserat 5G-nät). Källa: <c4/>.

seg-351652fa0e42 = Motorn är <b>systemoberoende</b>. Varje konstellation är Walker-skal, uttryckliga banelement eller en GNSS-förinställning i typen <c1/>; varje signal är en bärvåg, en chipfrekvens och en kurva för bärvåg-till-brus-täthet (C/N0); varje felbudget är en uttrycklig standardavvikelse. Namngivna system är valfria <b>förinställningar</b>, en fil vardera, och varje förmåga, test och medföljande scenario körs utan något särskilt av dem.

seg-3e7c6608d5c4 = System och förinställningar

seg-1031746214ab = Ett scenario listar sina system som tabeller <c1/>. Det här kompletta scenariot slår ihop baslinjekonstellationen för GPS med ett generiskt LEO-skikt och körs som skrivet (<c2/>; motor { $version } ger en median för positionens geometriska försämringsfaktor på { "2.43" } för enbart GPS och { "1.17" } sammanslaget, samt ett kvadratiskt medelvärde (RMS) för 3D-felet på { "2.06" } m och { "0.47" } m):

seg-6168fdca9b54 = <c1/> (Global Positioning System, GPS; eller <c2/>, <c3/>, <c4/>) tar en publicerad GNSS-konstellation; <c5/> fyller i vad tabellen lämnar utanför från en LEO-förinställning. C/N0 löper linjärt i sinus för elevationen från masken till zenit (ett modelleringsval: en verklig passages envelop beror på sändarantennens diagram). Pseudoavståndets standardavvikelse är motorns termiska brus i fördröjningslåsningsslingan (DLL) (<c6/>) vid den C/N0 kombinerat med avståndsfelet i signalen i rymden (SISRE), om inte <c7/> fastställer det; standardavvikelsen för avståndshastigheten är våglängden gånger <c8/>. Eftersom sigma är en indata kan en separat signalmodell mata det utan att positioneringskoden vet var det kommer ifrån.

seg-a3f63252bd1b = Vad den bär

seg-9872e31ebd72 = Källor

seg-e20c823f36f3 = X1 vid { "1593.3225" } MHz, { "1.023" } Mchip/s, mottagen effekt −{ "148.2" } till −{ "139.1" } dBW; X5 vid { "1190.51625" } MHz, { "10.23" } Mchip/s, −{ "144.9" } till −{ "136.2" } dBW; { "258" } satelliter i { "18" } plan på { "1080" } km, { "53" } och { "97" } grader

seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Representativt: fördelningen mellan de två inklinationerna, faseringen, avståndsfelet

seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satelliter, sex nästan polära plan på { "780" } km och { "86.4" } grader; skurar vid { "1616" } till { "1626" } MHz, kvadraturfasskiftsmodulation (QPSK) vid { "25 000" } symboler/s; mottagen effekt { "300" } till { "2400" } gånger GPS-minimum

seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>konstellation</a3>. DERIVED: effekten i dBW. Representativt: bärvåg vid bandets mitt, avståndsfel

seg-36771f73c21f = Endast Doppler: { "11.325" } GHz, { "240" } MHz fyr med ortogonal frekvensmultiplex (OFDM), C/N0 upp till { "57.07" } dB-Hz, Doppler-fel { "30" } Hz; första skalet med { "1584" } satelliter på { "550" } km och { "53" } grader

seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim och Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Representativt: fasering, C/N0 vid horisonten

seg-2e13de07f9e9 = Binär fasskiftsmodulation (BPSK) vid { "2.046" } Mchip/s nära L1 och L5; banbestämning på centimeternivå

seg-dd94a3839cb3 = PUBLIC: <a1>första bedömning</a1>, <a2>GPS Solutions</a2>. Representativt: bärvågor, effekt, hela den operativa konstellationen

seg-a34d6a186a36 = Ett C-bandssystem i allokeringen { "5010" } till { "5030" } MHz för radionavigeringssatellittjänsten (RNSS), för system vars parametrar inte är offentliga

seg-7712896ff69a = PUBLIC: allokeringen i <a1>International Telecommunication Union (ITU) Radio Regulations</a1>. Allt annat <b>representativt</b>

seg-89ebc32469d9 = En efemerid- och klockmodell: polynomefemerid av sjätte ordningen, uppdatering var { "30" } s, klocka styrd mot GNSS-tid; SISRE { "0.26" } m

seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. HÄRLEDD: SISRE. Kombineras med valfri konstellation genom <c1/>

seg-6389c92e07d4 = Europeiska rymdorganisationens (ESA) Celeste-demonstration i omloppsbana (IOD), en konfiguration av en parametriserad signalutformning

seg-b8bd6e76aeb2 = PUBLIC bana (<a1>ESA</a1>, <a2>Institute of Navigation (ION) abstract { "16907" }</a2>); WORKSHOP signalparametrar, presenterade vid ESA:s LEO-PNT-workshop inom Navigation Innovation and Support Programme (NAVISP), { "2026" }

seg-bd7fb6eb444a = Varje tal från workshopen finns i modulen <c1/> i <c2/>, som används av <c3/> (<c4/> kontrollerar var de får förekomma). Så hålls förinställningen undan: varje tal från workshopen i motorn finns i en enda fil, <c5/>, som <c6/> bara kompilerar in när den finns, och i de scenarier som bara finns i förrådet <c7/>. Om man tar bort den filen och de scenarierna hålls förinställningen undan utan någon källkodsändring; alla andra tester, referenser och scenarier körs utan den, och antalet scenariofiler i README räknar fortfarande med de undanhållna filerna.

seg-12cdcc633ae0 = En typ, fyra lägen (<c1/>).

seg-72b5d8cc82ea = <b>Doppler.</b> En mottagare som mäter Doppler <c1/> vid våglängden <c2/> observerar avståndshastigheten <c3/>, där <c4/> är siktlinjen och <c5/> mottagarklockans drift. En Gauss–Newton-anpassning i batch löser position, drift och eventuellt en konstant hastighet, med analytiska partialderivator <c6/>: bara satellitens hastighet tvärs siktlinjen bär positionsinformation, så geometrin är hur siktlinjerna vrider sig under fönstret. Rapporten ger felet mot fönsterlängd, Doppler-, Doppler-hastighets- och ryckenvelopen för varje system, samt en tabell för en enskild passage. En passage placerar användaren längs spåret (tidpunkten för noll Doppler) och tvärs det (Doppler-kurvans lutning); felet tvärs spåret växer obegränsat när passagen går rakt över huvudet, och spegelbilden över marksspåret passar nästan lika bra (bara jordens rotation skiljer dem åt). Ett system med endast Doppler (<c7/>, förinställningen <c8/>) körs i det här läget.

seg-007d143c7fb4 = <b>Gemensamt.</b> Varje epok en viktad minstakvadratlösning över pseudoavstånden för enbart GNSS-systemen, enbart LEO-systemen och alla tillsammans, en mottagarklocka per system (intersystembiaset, ISB, skattas) eller en känd sänd offset mot referenstidsskalan. Den redovisar den geometriska, positionella, horisontella, vertikala och tidsmässiga försämringsfaktorn (GDOP, PDOP, HDOP, VDOP, TDOP), felen, de skattade biaserna, och DOP mot antalet LEO-satelliter som läggs till GNSS-geometrin.

seg-22f136a0c96f = <b>Polärt.</b> Satelliter i sikte, median-DOP och tillgänglighet mot latitud för MEO-GNSS, LEO och båda.

seg-1034557258d1 = <b>Tidssynkronisering.</b> Vid en känd position är varje LEO-pseudoavstånd en klockmätning. Mottagaren kör ett Kalman-filter med två tillstånd (fas, frekvens) vars processbrus är oscillatorklassens vita brus och random walk i frekvens (modellerna <c1/> och klocka), håller tiden mellan passagerna och omvandlar systemtid till Coordinated Universal Time (UTC) med uttrycket <c2/> i IS-GPS-200; osäkerheten i den sända offseten är ett bias per körning.

seg-0d76fcc05e7d = Ett utökat Kalman-filter (EKF) för float-PPP (precis punktpositionering) på jonosfärsfri kod och fas: statiska koordinater, en vit mottagarklocka, ett intersystembias per extra system, en zenitfördröjning för vatten som följer en random walk och en float-heltalsosäkerhet per satellitbåge. Felet i precis bana och klocka är gemensamt för en satellits kod och fas, så varje satellit är en korrelerad uppdatering med två rader, i en Joseph-stabiliserad form som håller kovariansen positivt definit över tusentals fasuppdateringar på millimeternivå. Mätningarna simuleras från samma modell, så det normaliserade skattningsfelet i kvadrat (NEES) för positionen måste följa en chi-två-fördelning med tre frihetsgrader; testet kontrollerar det över Monte Carlo-frön. Konvergens är den första epok efter vilken de horisontella och vertikala felen förblir under trösklarna ({ "10" } cm) till slutet av körningen.

seg-630384148ec7 = En LEO-satellit korsar himlen på ungefär tio minuter, en MEO-satellit rör sig några grader, så LEO-bågar skiljer heltalsosäkerheterna från positionen mycket tidigare.

seg-17f9cf9cc24d = En nedlänk i ett icke-jordbaserat 5G-nät (NTN) i S-bandet för mobil satellittjänst (MSS), 3GPP-bandet (3rd Generation Partnership Project) n256 ({ "2170" } till { "2200" } MHz). Cramér-Rao-gränsen (CRB) för ankomsttid är <c1/>, där <c2/> är den kvadratiska medelbandbredden (Gabor) (<c3/> för ett platt OFDM-spektrum), och för frekvensen hos en ton <c4/>. Typen jämför kanaler (som standard en New Radio-kanal på { "5" } MHz och en smalbandskanal på { "200" } kHz) genom positionsbestämningar från nedlänkens ankomsttid med en okänd mottagarklocka och en Doppler-positionsbestämning med en enda satellit över en passage.

seg-516afd013d38 = Typ, läge

seg-529a5aeea10a = Vad den visar (med frö, deterministisk)

seg-6cd0b721006a = <c1/>, doppler

seg-c3c51264f12a = Xona Pulsar X1-skiktet ({ "258" } satelliter), Doppler-brus på { "1" } Hz: 3D-fel { "7.5" } m efter tio minuter ({ "26" } satelliter); på en enda passage är standardavvikelsen tvärs spåret { "303" } m när passagen går nästan rakt över huvudet ({ "25" } km från spåret) mot { "43" } m vid { "250" } km från spåret

seg-da85037a6691 = Opportunistiska signaler med endast Doppler, Doppler-fel { "30" } Hz vid { "10" } Hz: formell horisontell standardavvikelse ungefär { "10" } m efter { "20" } s med { "12" } satelliter och { "6" } m efter { "60" } s

seg-4dbb00da5310 = <c1/>, joint

seg-553e8f4df276 = GPS och Galileo median-PDOP { "1.47" } och kvadratiskt medelvärde (RMS) för 3D-felet { "1.06" } m; enbart Xona X5 { "1.73" } och { "0.49" } m; sammanslaget { "1.06" } och { "0.41" } m; LEO-biaset på { "40" } ns ({ "11.99" } m) skattat till { "12.06" } m

seg-83378a120e0d = Konvergens { "7.4" } min (enbart MEO-GNSS), { "4.8" }, { "3.2" }, { "2.7" } och { "2.3" } min med { "60" }, { "96" }, { "192" } och { "288" } LEO-satelliter

seg-4aadc3b41822 = Avståndsgräns { "0.26" } till { "1.03" } m för { "4.5" } MHz och { "6.5" } till { "26" } m för { "180" } kHz; positionsbestämningar nära { "2" } m mot { "26" } m

seg-5b1019210ca7 = <c1/>, polar

seg-108488f6cc6c = GPS och Galileo VDOP { "1.20" } vid ekvatorn, { "1.51" } vid { "89.9" } grader; med Iridium { "1.14" } vid polen

seg-bcdbe0796127 = <c1/>, timing

seg-94ab83c05f50 = Tidsöverföring med Iridium över { "6" } timmar vid Boulder: { "9.9" } till { "11.4" } ns RMS vid nominell C/N0 över fyra oscillatorklasser, { "15.1" } till { "25.0" } ns { "30" } dB lägre

seg-3007f5930dfd = <c1/> (valfri)

seg-f6ff187a00aa = GNSS sammanslaget med de två IOD-satelliterna på referenstidsskalan (bara i förrådet, undanhållet tillsammans med förinställningen)

seg-98710204278b = Typerna körs också inuti andra scenarier: <c1/> ingår i svepet <c2/> och i kampanjerna <c3/>, <c4/>, <c5/> och <c6/>; <c7/> i svepet <c8/>; <c9/> i svepet <c10/>; och <c11/> och <c12/> är stegen för sammanslagen positionsbestämning och PPP i typen <c13/>. Deras resultat finns på <a1>LEO-PNT.md</a1>.

seg-2f3086178d0b = Publicerade siffror och etiketter

seg-8980b5ae869b = Siffra

seg-0be9b5747c00 = Kshana

seg-3d2d01038419 = Iridium Doppler upp till ±{ "36" } kHz

seg-a88258961299 = { "35.9" } kHz, maximum över ett dygns passager, inom { "5" }%

seg-5bc3150b53f6 = VALIDATED (<c1/>)

seg-35a3ec8ee073 = Xona Pulsar X1 maximal Doppler { "32" } till { "34" } kHz

seg-499acd31a8f8 = arXiv:{ "2509.19551" }

seg-e8c9c880a3eb = { "33.6" } kHz från en satellit i varje publicerat skal ({ "1080" } km, { "53" } och { "97" } grader), inom intervallet utan vidgning; enbart skalet på { "53" } grader når toppen { "31.8" } kHz, eftersom jordens rotation bromsar en prograd bana i förhållande till marken

seg-e12713d5019f = VALIDATED (samma test)

seg-370ca62e7fc7 = Xona Pulsar X1 ryck ±{ "1.26" } Hz/s²

seg-4de9b0895288 = ungefär { "1.0" } Hz/s² på en passage rakt över huvudet

seg-5019322f4669 = redovisat, inte validerat

seg-7fcb83027ff4 = PPP-konvergens { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min med 60/96/192/288 LEO

seg-856e73fb2fb5 = Li m.fl., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monoton

seg-0a1133c16dce = MODELLED konsistens i trenden (konstellationer, brus och stationer återges inte)

seg-7c5292729f36 = Starlink ungefär { "2" } m på { "20" } s med tre satelliter

seg-6a54a7c58ade = Kozhaya, Saroufim och Kassas { "2025" }

seg-13fc5fc4f69f = formell horisontell standardavvikelse ungefär { "10" } m efter { "20" } s med { "12" } satelliter, med en perfekt efemerid och allt fel i en Doppler-sigma på { "30" } Hz vid { "10" } Hz

seg-4fc80a02ed6c = MODELLED jämförelse (mottagare och mätfrekvens återges inte)

seg-5d0ae24eb74c = Iridium-tid under { "40" } ns från UTC(NIST)

seg-fa4467605bc4 = NIST

seg-b910bf5135dd = ungefär { "10" } ns RMS modellerat

seg-9025f3c376c5 = MODELLED jämförelse

seg-4434b0ff1caa = Allt annat är MODELLED med sin motivering i verifieringsmatrisen (<c1/>): DOP kontrolleras mot ett handhärlett fall med fyra satelliter, positionsbestämningarna mot sin kovarians, Doppler-modellen mot identiteten för avståndsacceleration, PPP-filtret mot NEES-bandet för chi-två och gränserna mot kvadratur.

seg-aa5482ac34ff = Begränsningar, uttryckta rakt på sak

seg-0b4564367dcd = Tvåkroppsbanor med den sekulära driften från J2, jordens andra zonala överton; inget anpassningsfel i sänd efemerid utöver SISRE-standardavvikelsen, inget satellitantenndiagram.

seg-b51ccfee4ab8 = Ingen jonosfärs- eller troposfärsfördröjning i <c1/> (PPP-filtret har ett tillstånd för våt fördröjning; dess jonosfärsfria kombination tar bort första ordningens jonosfär), ingen scintillation, flervägsutbredning, cykelglapp eller upplösning av heltalsosäkerhet.

seg-a719ccac19c0 = Noggrannheten för NTN är en gräns, inte ett uppnått resultat.

seg-19ba6cc0ca75 = Förinställda värden märkta representativa är illustrativa och beskriver ingen operatörs utformning.

seg-f9f335d67ff8 = <s1>Föregående</s1>LEO-navigeringsmeddelande

seg-062138bbb73c = <s1>Nästa</s1>Konstellationsutformning
