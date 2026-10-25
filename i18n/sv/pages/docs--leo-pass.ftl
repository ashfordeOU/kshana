# docs--leo-pass: translations (sv)

seg-cae10fb9bff8 = Scenario

seg-cbf0f9bcd2d8 = Oberoende referens

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Källa

seg-587beeccaa11 = Förinställning

seg-1ff32b87e030 = Satelliter

seg-a6c63abeb7e6 = Medföljande scenarier

seg-60cd077d82a7 = Modell

seg-2b0d77219437 = Förinställningar

seg-5566e1d71a4f = Bana

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-c5ce76c91ff7 = Etikett

seg-813d372bda81 = Källa: <c1/>

seg-0bd4af67ffdb = LEO-passage och länkbudget (<c1/>)

seg-30417c63c48e = LEO-PNT är positionering, navigering och tidssynkronisering (PNT) från satelliter i låg omloppsbana (LEO). Typen <c1/> simulerar en eller flera LEO-satellitpassager över en användare och beräknar länkbudgeten band för band, bredvid GNSS-satelliterna (global navigation satellite system) i medelhög omloppsbana (MEO) som är i sikte. Motorn är <b>systemoberoende</b>: valfri konstellation, valfri signalutformning och valfritt band, skrivna direkt i ett scenario. Namngivna system är valfria förinställningar, var och en i sin egen fil med sin källa.

seg-242c84daecb0 = Kod: <a1><c1/></a1> (typen) och <a2><c2/></a2> (publika byggstenar som andra moduler kan anropa).

seg-0e6b09e372f5 = Scenarier: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> och det valfria <c8/> (resultat i <a1>Medföljande scenarier</a1>). Typen ingår också i kampanjerna <c9/>, <c10/>, <c11/> och i varje scenario som matchar <c12/>, och är passagesteget i typen <c13/>.

seg-59cebed2f589 = Översikt över alla LEO-PNT-typer och scenarier: <a1>LEO-PNT.md</a1>.

seg-9646ce17cddf = Referenser: <a1><c1/></a1>, testdata i <c2/> med sina käll-URL:er.

seg-c1020ac47091 = Vad en körning beräknar

seg-10dedc607eac = För varje LEO-satellit, band och epok:

seg-35bf9a48e566 = Term

seg-b0f12ee05fe9 = Elevation, azimut, avstånd

seg-24ad909c4fb8 = WGS-84 (World Geodetic System { "1984" }), användare; satellit i ett tröghetssystem som vid epoken är justerat mot det jordfasta systemet

seg-c9f61c3348ef = beräknad

seg-ebd800ec3d47 = Avståndshastighet <c1/>, avståndsacceleration <c2/>

seg-232b42b71f03 = sluten form; varje körning kontrollerar båda mot centrala differenser av det propagerade avståndet och redovisar den största skillnaden

seg-b3a55e868346 = sluten form

seg-3f1f90a57c2f = Doppler <c1/>, Doppler-hastighet <c2/>

seg-852b6c351ce4 = första ordningen, per band

seg-4eb4b779679b = Frirymdsdämpning

seg-31f67bcd2d50 = Friis, <c1/>

seg-fb5f06a91de1 = Satellitens EIRP (ekvivalent isotropiskt utstrålad effekt) och diagram

seg-883702244778 = isoflux upp till en kantelevation, gaussisk huvudlob <c1/> dB, eller platt

seg-b6e91c5252d3 = Användarantenn

seg-ed92a0abf62f = patch <c1/> dBic, halvsfärisk eller isotrop

seg-0ac54d232e0a = Gasdämpning

seg-30fb5b0a0bc7 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 bilaga { "2" } förenklade uttryck (ersatta av P.676-13, vars tabellerade koefficienter motorn inte innehåller)

seg-58d58478e9eb = Regndämpning

seg-4c1e413d5fc3 = ITU-R P.838-3-koefficienter och förfarandet i P.618-14 § { "2.2.1.1" }, utifrån en regnintensitet R0.01 och en regnhöjd

seg-dab78c0552b6 = Troposfärisk scintillation

seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; under { "4" } GHz en extrapolering, som flaggas i rapporten

seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

seg-32dddfdba584 = Byggnadsgenomträngningsdämpning (användare inomhus)

seg-ef9025622e81 = ITU-R P.2109-2, traditionell eller termiskt effektiv, vid elevationen för vägen vid fasaden

seg-c7d1bccd4d51 = Polarisationsfel

seg-f4aaea269382 = polarisationsförlustfaktor utifrån axialförhållanden och rotationsriktningar, medelvärdesbildad över ellipsens orientering

seg-96601850a9d5 = Systembrustemperatur

seg-82735c7f3ea5 = antennens golv + himlens emission i den absorberande vägen ({ "275" } K) + kosmiska { "2.7" } K + mottagarens <c1/>

seg-53ce973b0ee7 = C/N0 (bärvåg-till-brus-täthet)

seg-fa01d060cf1a = Jonosfärens grupplöptid

seg-33f2113dea70 = <c1/>, STEC (slant total electron content) från Klobuchar-modellen eller ett vertikalt totalt elektroninnehåll (TEC), skalat med den andel av ett Chapman-skikt som ligger under satelliten

seg-431dfeb5edba = skalning VALIDATED, TEC MODELLED

seg-56df31449434 = Per bandpar: jonosfärsfria koefficienter, brusförstärkningen <c1/> och det termiska kodbruset för varje band och för kombinationen vid passagens topp. Jämförelsen med MEO-GNSS använder samma användarantenn och mottagare, med varje signals lägsta mottagna effekt enligt gränssnittsdokumentet (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, Issue { "2.1" } tabell { "12" }; GPS från IS-GPS-200 och IS-GPS-705), plus ett angivet överskott, skalat med avståndet. Det valfria avsnittet <c2/> (Internet of Things) ger tid till första positionsbestämning, energi per positionsbestämning och batteritid mot arbetscykel för en angiven effektbudget för mottagaren (MODELLED, varje antagande är en indata och redovisas i rapporten).

seg-7132ede02109 = <c1/> (standard): en cirkulär bana placerad så att användaren ser en passage med en vald maximal elevation vid en vald tidpunkt, stigande eller fallande, öster eller väster om användaren; inklinationen kan vara solsynkron.

seg-688307acbf0d = <c1/>: uttryckliga keplerska element.

seg-e9085739bcb8 = <c1/>: en tvåradig elementuppsättning (TLE) genom motorns propagator Simplified General Perturbations { "4" } (SGP4).

seg-7dcc5fdbc249 = <c1/>: en Walker-konstellation byggd av koden <c2/> (dess <c3/> eller förinställningens skal); de högsta passagerna i fönstret redovisas.

seg-ec7e163dd073 = Band och signalutformningar

seg-4d49743b3544 = Band: <c1/> med en valfri delmängd <c2/>, och poster <c3/> som lägger till ett band eller åsidosätter vilket fält som helst i ett förinställt band. <c4/> med bara poster <c5/> använder ingen förinställning alls.

seg-bd1e114aaea6 = Ett band kan också namnge en utformning <c1/> (<c2/>, valfri utformning under <c3/>, eller en som typen <c4/> lämnar över; se <a1>LEO-SIGNAL.md</a1>). Bandet tar då utformningens mittfrekvens (om inte <c5/> anges), sändningsbandbredd och chipfrekvens för den spårade komponenten, delar upp sin EIRP på utformningens komponenter efter deras effektandelar, och redovisar vid varje epok den spårade komponentens C/N0 och dess bandbegränsade tidig-sen-kodföljningsjitter (Betz och Kolodziejski { "2009" }, formeln för typen <c6/>) som avståndsfel.

seg-1d96501bb12d = Varje förinställning märker sina tal PUBLIC (med URL), REPRESENTATIVE (ett dokumenterat utformningsval, aldrig ett påstående om ett verkligt system) eller WORKSHOP.

seg-f708914fed48 = Band

seg-6459abcaeebe = <c1/> (standard)

seg-a0dab2ebeb1b = REPRESENTATIVE; L-, S- och C-bärvågor från offentliga dokument

seg-cd0075385395 = UHF { "450" } MHz (representativt), L { "1191.795" } MHz (Galileo E5-centrum), S { "2492.028" } MHz (NavIC S, S-bandsbärvågen i Navigation with Indian Constellation), C { "5020" } MHz (mitten av RNSS-allokeringen (radionavigeringssatellittjänsten) { "5010" }–{ "5030" } MHz), var och en { "0" } dBW

seg-3f0de4312fcb = { "550" } km solsynkron, Walker 240/12/1

seg-486f17197d4d = REPRESENTATIVE, för C-bandssystem vars parametrar inte är offentliga (till exempel TrustPoint)

seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (binär fasskiftsmodulation vid { "10" } × { "1.023" } Mchip/s), isoflux

seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> tabellerna { "1" }–{ "2" }

seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP från den publicerade lägsta mottagna effekten vid { "10" }°

seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) och { "97" }° ({ "66" })

seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> och den publicerade banan

seg-c995dade5aa6 = Satellite Time and Location (STL) vid { "1621" } MHz (mitten av { "1616" }–{ "1626" } MHz); EIRP från "{ "300" } gånger GPS"

seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } i { "6" } plan

seg-ad0ba129439b = PUBLIC signaluppgifter (<a1>NAVIGATION { "72" }({ "1" })</a1>), REPRESENTATIVE bana och EIRP

seg-1931203a036c = Ku-fyr på { "240" } MHz, endast Doppler

seg-0533710bbbe1 = PUBLIC signalstruktur (<a1>PMC10301026</a1>), REPRESENTATIVE bana och EIRP

seg-cee286338f01 = BPSK { "2.046" } Mchip/s nära L1 och L5

seg-fe3cdce92b31 = { "1000" } km, { "55" }°

seg-03d5ae448705 = <c1/> (valfri)

seg-800f173f2b20 = WORKSHOP signalparametrar, PUBLIC bana

seg-e8626249e708 = sju band i konfiguration #1

seg-cb29553176c7 = { "510" } km solsynkron

seg-10f79909a5bc = <b>Förinställningen Celeste IOD (demonstration i omloppsbana) är valfri.</b> Dess signalparametrar presenterades vid Europeiska rymdorganisationens (ESA) LEO-PNT-workshop inom Navigation Innovation and Support Programme (NAVISP), { "2026" }, och har ännu ingen offentlig källa; de finns i modulen <c1/> i <c2/>, som används av <c3/>. Så hålls förinställningen undan: varje tal från workshopen i motorn finns i en enda fil, <c4/>, som <c5/> bara kompilerar in när den finns, och i de scenarier som bara finns i förrådet <c6/>. Om man tar bort den filen och de scenarierna hålls förinställningen undan utan någon källkodsändring; alla andra tester, referenser och scenarier körs utan den, och antalet scenariofiler i README räknar fortfarande med de undanhållna filerna. Dess EIRP och stråle är kalibrerade mot en C/N0-kurva som visades vid workshopen, så det scenariot återger kurvan per konstruktion.

seg-9f9ff4fe18f8 = ATOMIC-modellen med "nollklocka" och polynom för sänd efemerid är en förinställning för navigeringsmeddelanden och ingår inte i den här typen.

seg-dc496b16046b = Observationen av LEO jämfört med GNSS

seg-6be559b1ac29 = <c1/> återger kvalitativt vad LEO-PNT-demonstrationer visar: LEO-C/N0 stiger och sjunker i en klockkurva som ligger över masken i { "590" } s och når toppen { "56.8" } dB-Hz, { "8.9" } dB över medianen för de platta MEO-GNSS-bärvågorna (Galileo E1, { "40.5" } till { "52.0" } dB-Hz, median { "47.8" } dB-Hz). Marginalen kommer från avståndet, inte från en starkare sändare: vid passagens topp är satelliten { "569" } km bort, ungefär { "40" } gånger närmare än en Galileo-satellit i zenit ({ "23 222" } km), vilket ger { "32" } dB mindre frirymdsdämpning; den generiska förinställningen strålar { "0" } dBW ({ "1" } W).

seg-08debab7c94a = Varje rad är en körning av <c1/> (motor { $version }):

seg-9a60f0bf803e = Uppsättning

seg-fde146239f5d = Resultat av en körning

seg-41455a3f15b6 = <c1/> L-band, { "550" } km, en passage på { "80" }° över München

seg-9d5c154eceb1 = L-topp { "56.8" } dB-Hz, median { "42.2" } dB-Hz; median för Galileo E1 { "47.8" } dB-Hz

seg-9423b1184fb0 = <c1/>, en utformad passage på { "70" }° och fyra satelliter i lutande skal, maritim användare

seg-63bf0b8f7f3a = X1-topp { "65.6" } dB-Hz och X5 { "68.9" } dB-Hz på den utformade passagen; största X1-Doppler { "31.4" } kHz

seg-8a3383072765 = <c1/>, passage på { "65" }°, luftburen användare

seg-d2fea8542638 = STL-topp { "80.5" } dB-Hz, { "34.3" } dB över medianen för GPS L1; största Doppler { "35.4" } kHz

seg-d837a8a7648b = <c1/>, användare inomhus i Rom (traditionell byggnad)

seg-4fbead0588d2 = topp UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz; median för Galileo E1 { "22.4" } dB-Hz

seg-954e16842d59 = <c1/> UHF och L med avsnittet <c2/>

seg-9aa81f6f4929 = varm positionsbestämning { "0.90" } s och { "18.0" } mJ för varje signal; kall positionsbestämning UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

seg-97476f9d4212 = <c1/>, fyra band, passage på { "70" }° över Tromsø

seg-fd1463da9965 = se <a1>Jonosfärssondering</a1>

seg-1ad5bde12b4f = { "16" } satelliter i ett generiskt skikt på { "1080" } km, L och C, ett hopp på { "30" } m

seg-25cf36cf0de3 = se <a1>Spoofing-monitorer</a1>

seg-6cdf9830433e = <c1/> skriver också den interaktiva spelaren (<c2/>, passageepokerna) och efemeridfiler i CZML (the Cesium Language), KML (Keyhole Markup Language), GeoJSON och STK (Systems Tool Kit) för passagens geometri (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

seg-d3a0fc36329a = Jonosfärssondering

seg-1e64715af2ff = Varje bandpar ger också den sneda TEC som dess geometrifria kodkombination återskapar vid passagens topp, <c1/>, och 1-sigma för den skattningen utifrån de två bandens kodbrus vid toppen (<c2/>, <c3/>). Skattningen är lika med modellens sneda TEC per konstruktion: kombinationen är exakt i första ordningen. Det är sigma som gör en bandplan till en bättre eller sämre sonderare: <c4/> (fyra band över Tromsø) återskapar { "18.85" } TEC-enheter från varje par, med ett 1-sigma på { "0.017" } TEC-enheter för UHF med L och { "2.9" } för S med C. Endast termiskt kodbrus; ingen flervägsutbredning eller bias mellan frekvenser. MODELLED.

seg-8f59acefb2b3 = Spoofing-monitorer (<c1/>)

seg-91941393400a = Det valfria avsnittet <c1/> förfalskar de signaler som en mottagare skulle se vid en påstådd position. Från <c2/> hoppar den påstådda positionen med <c3/> och rör sig sedan horisontellt med <c4/> mot <c5/>; det förfalskade avståndet och avståndshastigheten är exakt de för den påstådda positionen, på de LEO-band som anges i <c6/> (standard alla) och på MEO-GNSS-signalen om inte <c7/>. <c8/> anger om de förfalskade pseudoavstånden bär jonosfärsfördröjningen (en markbaserad sändares gör inte det).

seg-845f6840d92d = Mottagaren kör två monitorer (<a1><c1/></a1>), var och en med en angiven falsklarmssannolikhet per epok (<c2/>, standard { "1e-5" }), och förklarar detektion vid den första epok då dess detektionssannolikhet når <c3/> (standard { "0.999" }). Detektionssannolikheterna är exakta för det angivna gaussiska bruset och beräknas på det brusfria medelvärdet av residualen; inget brus dras.

seg-cc38b40eb7a5 = Monitor

seg-8b34ac584c3d = Statistik

seg-7b158594c4d9 = Vad den ser

seg-89756d80bc29 = Doppler och konsistens med passagens geometri

seg-2174c7725e48 = uppmätta avståndshastigheter mot de som förutsägs från banorna och en oberoende a priori-position och -hastighet (<c1/>, <c2/>); ett generaliserat minstakvadrat-chi-två över ett fönster på <c3/> (standard ett steg), med klockdriften som en störparameter (eller given <c4/>); brus i frekvenslåsningsslingan från C/N0 (Kaplan & Hegarty { "2006" }, § { "5.6.2" }), på GNSS-kanalerna, LEO-kanalerna och alla kanaler

seg-14eab06a47d5 = ett positionsfel <c1/> flyttar en avståndshastighet med <c2/>, <c3/>: en LEO-satellits tvärhastighet i förhållande till avståndet är ungefär { "25" } gånger en MEO-satellits, så samma fel blir ungefär { "25" } gånger större i LEO-Doppler

seg-390ac49b3c09 = Konsistens mellan band

seg-986d501c2b01 = steget från epok till epok för varje LEO-bandpars geometrifria pseudoavståndskombination, med mottagarens jonosfärsmodell borttagen, mot <c1/> kodbrus och en tolererad omodellerad jonosfärshastighet (<c2/>)

seg-389187df55d7 = en spoofer som förfalskar vissa band men inte andra, eller varje band utan jonosfären, vid sin start; inte en som förfalskar varje band och simulerar jonosfären

seg-4dd44d7fa566 = <c1/>: ett hopp på { "30" } m vid en inmätt plats i Frankfurt ändrar GNSS-avståndshastigheterna med ungefär { "4" } mm/s och LEO-hastigheterna med ungefär { "10" } cm/s (mediangradienter { "1.4e-4" } och { "3.5e-3" } per sekund). Testet med enbart GNSS upptäcker det aldrig (största icke-centralitet { "0.06" }); testet på alla kanaler upptäcker det { "105" } s efter starten. <c2/> kör fyra spoofers mot båda monitorerna.

seg-1b64098e01f3 = Begränsningar, angivna i varje resultat: spoofern är en idealiserad, självkonsistent positionsförskjutning som kompenserar för sin egen väg (ingen signatur i effekt, ankomstvinkel eller korrelationstopp); a priori-värdet är oberoende av de förfalskade positionsbestämningarna; mottagarens jonosfärsmodell är motorns, så den äkta residualen mellan band är noll i medel. MODELLED (två rader i <a1>VERIFICATION-MATRIX.md</a1>).

seg-edb7b16b6c0e = Validering

seg-051b8cd1849d = Test

seg-609c537a9dfd = ITU-R P.838-3 tabell { "5" }, { "115" } frekvenser

seg-5bf24bec38f2 = varje koefficient inom { "0.6" } av sin sista tryckta siffra (sämsta observerade { "0.51" })

seg-86204b023d44 = valideringsexempel från ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0), P.618-14 regn

seg-13180d4097d1 = { "56" } fall inom { "1e-4" } dB (observerat { "5e-6" } dB)

seg-84161e5f97f8 = Samma exempel, P.618-14 scintillation

seg-0a4305c867ff = { "42" } fall inom { "1e-5" } dB

seg-054f8dbe2792 = ITU-R Study Group { "3" } arbetsbok för Clutter och BEL, P.2109

seg-8ae2eeed4be4 = { "568" } värden inom { "0.001" } dB

seg-6df2eded9f19 = IS-GPS-200 grupplöptidskvot <c1/>

seg-d0b293230f91 = till { "1e-12" }; förstärkning L1/L2 och L1/L5 { "2.978" } och { "2.588" }

seg-f9a0e24c00a7 = Friis i formen kilometer–megahertz

seg-4e94a67f40f6 = till { "1e-4" } dB

seg-ee59b4c520eb = arXiv { "2509.19551" } tabell { "1" } (Pulsar in-orbit validation (IOV), full operational capability (FOC) polär, FOC lutande, GPS)

seg-345998ca457c = { "20" } hastigheter och Doppler-maxima inom { "0.05" } %

seg-30e34076f4a7 = Referenserna för regn och scintillation tar regnhöjden och den våta refraktiviteten som valideringsexemplen anger dem: motorn innehåller varken kartan i ITU-R P.839 eller den i P.453.

seg-d2d1075a0b67 = EIRP och diagram är publicerade mottagna effekter omräknade till en EIRP, eller representativa val; ingen satellits uppmätta diagram används och ingen LEO-C/N0 jämförs med en mätning.

seg-915a9564608d = Gastermen är den ersatta förenklade metoden P.676-10; under { "1" } GHz är den värdet vid { "1" } GHz skalat med f², och regn sätts till noll där.

seg-cdd9faf5b61d = Andelen TEC under en LEO-satellit kommer från ett enda Chapman-skikt (ingen plasmasfär) och kan åsidosättas av en angiven andel.

seg-4b72218497e7 = De utformade passagerna och Walker-banorna är tvåkropps med en valfri sekulär J2 (jordens andra zonala överton); TLE-vägen använder SGP4. Användarens egen acceleration lämnas utanför Doppler-hastigheten i sluten form (den numeriska kontrollen redovisar vad det kostar för en rörlig användare).

seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } har inga LEO-navigeringsposter; varje LEO-export i RINEX-stil tillhör koden för navigeringsmeddelanden och är ett dokumenterat Kshana-tillägg (tidigare arbete: arXiv { "2401.17767" }).

seg-593081243d8c = <s1>Föregående</s1>LEO-signalutformningar

seg-468e70f9a669 = <s1>Nästa</s1>LEO-navigeringsmeddelande

seg-072d0d8f618c = Spoofing-monitorer ([spoofer])
