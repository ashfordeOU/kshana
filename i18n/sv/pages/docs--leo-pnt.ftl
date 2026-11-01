# docs--leo-pnt: translations (sv)

seg-46c7e6f003dd = System

seg-cae10fb9bff8 = Scenario

seg-f1f903f1b9ff = Resiliens

seg-1759a8cce7d6 = Slag

seg-71aee5eb55c5 = UHF

seg-f63dd3d7aad4 = Källa

seg-587beeccaa11 = Förinställning

seg-e305279d5b11 = Innehåll

seg-b03d56f501c3 = Typ

seg-6752521002b2 = Del

seg-cf6ae60eea4f = Hjälpdata

seg-0bdbdd2c923b = Synkronisering

seg-b09dc4b322d3 = Efemerid

seg-3a835a49b43f = Övriga tjänster

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-c5ce76c91ff7 = Etikett

seg-c1020ac47091 = Vad en körning beräknar

seg-f708914fed48 = Band

seg-486f17197d4d = REPRESENTATIVE, för C-bandssystem vars parametrar inte är offentliga (till exempel TrustPoint)

seg-03d5ae448705 = <c1/> (valfri)

seg-fde146239f5d = Resultat av en körning

seg-a3f63252bd1b = Vad den bär

seg-7d2c6fbf95b7 = Källa: <c1/>

seg-6f1f29597f4b = LEO-PNT i Kshana

seg-2a3a1f19005a = LEO-PNT är positionering, navigering och tidssynkronisering (PNT) från satelliter i låg omloppsbana (LEO), vid sidan av eller i stället för de globala satellitnavigeringssystemen (GNSS) i medelhög omloppsbana (MEO), till exempel Global Positioning System (GPS) och Galileo. Den här sidan knyter ihop varje LEO-PNT-typ och -scenario i motorn: vad var och en beräknar, banden och signalförinställningarna och varifrån deras tal kommer, vad navigeringsmeddelandet bär, vad som är VALIDATED och vad som är MODELLED, och hur varje scenario körs. Typsidorna går djupare:

seg-8e3556046e63 = Sida

seg-cdb06a47be0a = <c1/> (signalutformningar) och panelerna med flera band i <c2/>

seg-09894e033033 = <c1/> (passagegeometri och länkbudget per band, positionsbestämningar med låg energi, jonosfärssondering, spoofing-monitorer)

seg-f19c0bfe2996 = <c1/> (det sända meddelandet: anpassning, användaralgoritm, binära format och textformat)

seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (sammanslagen positionering, precis punktpositionering, positionering i icke-jordbaserat 5G-nät (NTN), tidssynkronisering, polär täckning)

seg-29013ad5656c = <c1/> (jamming-vattenfall och förhållandet mellan störsignal och signal (J/S) per band)

seg-d291250b5d01 = <c1/> (kedjor, svep, Monte Carlo och sammansättningar av valfria typer)

seg-8d2de8f77619 = Systemoberoende först

seg-f3750a8f2863 = Motorn är en generisk LEO-PNT-simulator. Valfri konstellation (ett Walker-mönster, uttryckliga banelement, en tvåradig elementuppsättning (TLE) genom propagatorn Simplified General Perturbations { "4" } (SGP4), eller en utformad enskild passage), valfri signalutformning (valfritt band, valfri blandning av komponenter med binär fasskiftsmodulation (BPSK), binär offsetbärvåg (BOC) och frekvensdelad flerfåråtkomst (FDMA)), valfri modell för navigeringsmeddelanden. Namngivna system är valfria förinställningar: datafiler, var och en med sin källa, som bara fyller i det ett scenario lämnar utanför. Varje förmåga, test, referens och medföljande scenario körs utan några Celeste-data.

seg-4d3bd0301e59 = Förinställningen Celeste IOD (demonstration i omloppsbana) är en valfri förinställning bland dem. Dess signalparametrar presenterades vid ESA NAVISP:s (Europeiska rymdorganisationens Navigation Innovation and Support Programme) LEO-PNT-workshop, { "2026" }, och har ännu ingen offentlig källa. Varje tal från workshopen i motorn finns i en enda fil, <a1><c1/></a1>, som <c2/> bara kompilerar in när den finns, och i de scenarier som bara finns i förrådet <c3/>. Om man tar bort den filen och de scenarierna hålls förinställningen undan utan någon källkodsändring; alla andra tester, referenser och scenarier körs utan den (<c4/> bevakar vilka filer som får nämna den). Den här sidan anger inga av dess tal.

seg-5b348102cb63 = Typerna och hur de hänger ihop

seg-120b9be05fc3 = en signalutformnings bandbegränsade effektspektraltäthet (PSD), effekt i bandet, kvadratisk medelbandbredd (Gabor), kodföljningsjitter mot bärvåg-till-brus-täthet (C/N0), acquisition-sökning och spektrala separationskoefficienter (SSC) mot GNSS-signaler; en bandavvägning (ultrahög frekvens (UHF), L, S, C)

seg-d9febf3c74c8 = slutna former VALIDATED, utformningar och avvägning MODELLED

seg-d0d8d1edd9ee = <c1/> (paneler med flera band)

seg-dc3ceb315e9a = vattenfall per band med jammers per band (kontinuerlig våg (CW), chirp, smalband, bredband, matchad), varje signals J/S och effektiva C/N0 över en tidslinje

seg-126a14392994 = spektra VALIDATED, jammers MODELLED

seg-e63f73ab5bca = passagegeometri, Doppler och Doppler-hastighet, frirymdsdämpning, satellit- och användarantenner, ITU-R-dämpning (International Telecommunication Union, Radiocommunication Sector) för gaser, regn, scintillation och byggnadsgenomträngning, C/N0 per band och epok bredvid MEO-GNSS-bärvågorna; jonosfär per band och de jonosfärsfria paren; positionsbestämningar med låg energi; jonosfärssondering; spoofing-monitorer

seg-a9fd4162604f = komponenter VALIDATED, passage MODELLED

seg-91304e663174 = det sända efemerid- och klockmeddelandet: anpassning, avståndsfel i signalen i rymden (SISRE) mot anpassningsintervall och uppdateringsperiod, kontinuitet vid uppdatering mitt i en passage, användaralgoritm, binär ram med en 24-bitars cyklisk redundanskontroll (CRC-24Q), exporter i stil med RINEX { "4" } (Receiver Independent Exchange Format) och som kommaseparerade värden (CSV)

seg-cf93a9ba065c = användaralgoritm, vikter och CRC VALIDATED, anpassningar MODELLED

seg-3084696ad387 = Doppler-positionering, gemensamma pseudoavståndspositioneringar med GNSS + LEO och intersystembiaser, polär och arktisk geometri, tidsöverföring till Coordinated Universal Time (UTC), med en valfri tidsfelskurva per epok

seg-79117194e50b = maximal Doppler VALIDATED, resten MODELLED

seg-1de31fd3cf86 = konvergens för precis punktpositionering (PPP) med enbart GNSS och med LEO-skikt

seg-525733c10d9b = positioneringsnoggrannhet för 5G NTN utifrån nedlänkens bandbredd (Cramér-Rao-gräns)

seg-cb8eee06e664 = ett system från början till slut: signalutformning, passage, meddelande, sammanslagen positionsbestämning och PPP, varje överlämning listad

seg-d28e18170f82 = vilket som helst av ovanstående kedjat på en tidslinje, svept, körd som ett Monte Carlo-ensemble eller sammansatt under gemensamma villkor

seg-5479654fabfd = Kedjan lämnar över värden i kod (se <a1>LEO-PNT-kedja från början till slut</a1> nedan): signalutformningen anger passagebandets EIRP-fördelning (ekvivalent isotropiskt utstrålad effekt) och spårad chipfrekvens; passagen ger den spårade C/N0 och kodjittret; navigeringsmeddelandets SISRE och passagens C/N0 viktar LEO-mätningarna i den sammanslagna positionsbestämningen.

seg-a0331a21413c = De generiska utformningarna använder offentliga bandcentra; var och en är REPRESENTATIVE, inte något systems signal (<c1/>, <c2/>).

seg-a86ce24d81de = Band

seg-daf61ebdca17 = Allokering

seg-ba6fbebc2a98 = Generisk utformning

seg-3332ae549a90 = Centrum

seg-c7be6f6797a8 = Sändningsbandbredd

seg-74f4e80c65cb = Komponenter

seg-e95de3591152 = Jonosfärsfördröjning i första ordningen i förhållande till L

seg-e769f0411e64 = Återkallad av utgivaren; ingen arkiverad kopia

seg-8b04e51a023e = inte en radionavigeringsallokering (representativt); bärvåg från den offentliga <s1>openRECEIVER-undersökningen</s1> (sidan har sedan återkallats; se <a1>LEO-SIGNAL.md</a1>)

seg-ea152d84aabc = { "465" } MHz

seg-8a3026904912 = { "10" } MHz

seg-e1500e8695b9 = BPSK({ "5" }) pilot och data

seg-ac33d89291ca = radionavigeringssatellittjänsten (RNSS), mitten av Galileo E5

seg-278d0b375f6f = { "20.46" } MHz

seg-54e10c07ace3 = BPSK({ "10" }) pilot och data

seg-5e28b8377751 = radiopositioneringssatellittjänsten (RDSS), S-bärvågen i NavIC (Navigation with Indian Constellation)

seg-39e207bee75b = { "2492.028" } MHz

seg-a573432714b8 = { "16.5" } MHz

seg-6fe14d537f33 = RNSS, mitten av allokeringen { "5010" }–{ "5030" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-0b50907d3165 = { "20" } MHz

seg-c43105d1c770 = C utökat

seg-c05714081a0e = utanför RNSS-allokeringen (representativt)

seg-638ab0837b29 = { "5100" } MHz

seg-4d3857271629 = { "120" } MHz

seg-18bc5451fc46 = BPSK({ "50" }) pilot och data

seg-3714e1c00ab8 = S (mobil satellittjänst, MSS)

seg-cc26934bac14 = MSS-nedlänk, 3GPP-band (Third Generation Partnership Project) n256

seg-12ca7304ece7 = används av <c1/>

seg-896b6ee57728 = { "2172.5" } MHz

seg-e6e1d955489a = { "0.18" } till { "20" } MHz

seg-50e44c7042c9 = positioneringssignaler i 5G New Radio

seg-e75e48eeeca1 = BPSK(n) är binär fasskiftsmodulation vid n × { "1.023" } Mchip/s. Fördröjningskvoten är <c1/> med <c2/> = { "1191.795" } MHz. Frirymdsdämpningen ökar med <c3/> vid samma avstånd (−{ "8.2" } dB vid UHF, +{ "6.4" } dB vid S, +{ "12.5" } dB vid C).

seg-02f71b44edf5 = Förinställningar för signaler och system

seg-c60ce9c32b57 = REPRESENTATIVE, bandcentra från ITU Radio Regulations

seg-58fae66f7c12 = <c1/> (signalutformningar): bandtabellen ovan; <c2/> (standard för typen <c3/>): UHF vid { "450" } MHz, L, S och C vid centra ovan, { "0" } dBW EIRP per band, ett solsynkront Walker 240/12/1-skikt på { "550" } km

seg-5d918965c00c = BPSK({ "10" }) vid { "5020" } MHz, isoflux-stråle

seg-dddb031a7e2e = PUBLIC: Leclère, Marathe och Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

seg-67fc4039084d = X1 vid { "1593.3225" } MHz ({ "1.023" } Mchip/s) och X5 vid { "1190.51625" } MHz ({ "10.23" } Mchip/s), de publicerade lägsta och högsta mottagna effekterna, { "258" } satelliter på ungefär { "1080" } km (skal på { "53" } och { "97" } grader)

seg-f17f98d1ae0b = PUBLIC: <a1>underlag från Resilient Navigation and Timing Foundation (RNTF)</a1>

seg-c6694cdbb02b = skurar vid { "1616" }–{ "1626" } MHz, Doppler upp till ±{ "36" } kHz, { "66" } satelliter på { "780" } km ({ "781" } km i förinställningen <c1/>), mottagen effekt "{ "300" } till { "2400" } gånger GPS"

seg-704ec002a889 = <c1/> / <c2/> / <c3/> (typer för signal, passage och positionering)

seg-a4a3a7c7bc22 = PUBLIC signaluppgifter: Kozhaya, Saroufim och Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; REPRESENTATIVE bana

seg-49985bf11216 = en Ku-bandsfyr på { "240" } MHz som används endast för Doppler, C/N0 ungefär { "57" } dB-Hz

seg-84cb50b019e0 = PUBLIC signalstruktur: <a1>PMC10301026</a1>; REPRESENTATIVE bana och effekt

seg-1c50faed9f1e = BPSK vid { "2.046" } Mchip/s nära L1 och L5

seg-c72e9b87f116 = <c1/> (<c2/> i meddelandetypen)

seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations) nyttolast</a1>

seg-4f0cff24b4fd = en polynomefemerid av 6:e ordningen utan klocktermer (klockan styrs mot GNSS-tid)

seg-9d1e7aebcd84 = WORKSHOP: presenterad vid ESA NAVISP:s LEO-PNT-workshop, { "2026" }

seg-28c2e7ae6065 = demonstrationens signalkonfiguration #1 och meddelandelayout, i den enda fil som kan hållas undan

seg-9f0d16f43993 = Varje förinställning märker sina tal PUBLIC (med en URL), REPRESENTATIVE (ett dokumenterat utformningsval, aldrig ett påstående om ett verkligt system) eller WORKSHOP, och resultatet av varje körning som använder en anger vilken.

seg-556fe9c6c3b1 = Navigeringsmeddelandet

seg-a220662ed8de = Ett LEO-navigeringsmeddelande (<a1>LEO-NAVMSG.md</a1>) bär fyra delar, den struktur som Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) och de publicerade LEO-förslagen har gemensam:

seg-5bda276f6e82 = den keplerska uppsättningen med 16 parametrar i Galileo ICD (kvadratroten av halva storaxeln, excentricitet, inklination och dess hastighet, rektascension för noden och dess hastighet, perigeumargument, medelanomali, korrektion av medelrörelsen, sex övertonskorrektioner, referenstid), plus korrektionspolynom längs banan, tvärs banan och radiellt; eller 22-parametersmodellen av Liu m.fl. { "2025" } (<a1>doi 10.3390/rs17162894</a1>); eller ATOMIC-polynomet med nollklocka

seg-8a7dabfece01 = veckonummer och veckotid (TOW), och ett klockpolynom av andra ordningen (af0, af1, af2 kring toc)

seg-24eaf4ae7eb3 = satellitidentifierare (SVID), dataversion (IOD), signalens hälsa

seg-e7d819b7a724 = jonosfärskorrektioner för användare med en frekvens (en uppsättning i Klobuchar-stil och NeQuick-G ai0–ai2) och förskjutningen från systemtid till UTC (A0, A1, skottsekunder och deras schema)

seg-200e59d9279c = Den binära ramen är Kshanas egen dokumenterade kodning, modellerad efter dessa komponenter, inte något systems bitlayout. RINEX { "4.02" } definierar inga LEO-navigeringsposter, så exporten i RINEX-stil är ett dokumenterat Kshana-tillägg (tidigare arbete: <a1>arXiv { "2401.17767" }</a1>).

seg-aa18ab84599b = svep <c1/> av <c2/>

seg-70dc120ea19e = ett barrage på { "50" } MHz vid { "1185" } MHz svept från −{ "140" } till −{ "80" } dBW: GPS L5 förloras vid −{ "105" } dBW, Galileo E5a och LEO:s L-bandssignal vid −{ "100" } dBW; LEO-signalerna i UHF-, S- och C-banden behåller { "49.4" }, { "49.2" } och { "47.4" } dB-Hz vid varje effekt

seg-61f05d7e3a18 = ett barrage på { "40" } MHz vid { "1185" } MHz som stegar upp { "5" } dB var { "10" }:e s från −{ "125" } dBW: GPS L5 förloras vid −{ "105" } dBW, Galileo E5a vid −{ "100" } dBW, Xona X5 (vid sin publicerade lägsta nivå, −{ "144.9" } dBW) vid −{ "95" } dBW; en generisk LEO-signal vid −{ "135" } dBW följs fortfarande vid −{ "90" } dBW ({ "28.9" } dB-Hz). Mottagen effekt köper J/S-marginal dB för dB

seg-6a3a46be60a5 = ett positionshopp på { "30" } m vid en inmätt plats: Doppler-testet med enbart GNSS upptäcker det aldrig; testet på alla kanaler gör det, { "105" } s efter starten (se <a1>LEO-PASS.md</a1>)

seg-d0c4683d7c93 = <c1/> sammansättning av <c2/>

seg-bf0ec52f63ea = fyra spoofers, båda monitorerna: en spoofer med enbart L-band och en spoofer med alla band utan jonosfär fångas av monitorn mellan band vid starten ({ "300" } s) och av Doppler-monitorn vid { "420" } s och { "395" } s; en jonosfärsmedveten spoofer med alla band bara av Doppler-monitorn ({ "395" } s); en förskjutning på { "30" } m med enbart GNSS av ingen av dem

seg-17bcc4ead2ee = <c1/> kedja (<c2/>, <c3/>)

seg-d9b6e6fe6807 = GNSS störs i { "15" } minuter (GPS L1 grov/förvärv (C/A) kod till ungefär { "10" } dB-Hz, E5a till { "17.4" } dB-Hz mot ett golv på { "25" } dB-Hz) medan LEO-signalerna i S- och C-banden håller { "49.2" } och { "47.4" } dB-Hz; övervakning av mottagarens autonoma integritet (RAIM) enbart på LEO-skiktet bildar en skyddsnivå vid varje epok, under den vertikala larmgränsen på { "50" } m vid { "28" } av { "30" } rutnätstider, med larm vid de andra två; nominella faser och faser för återhämtning { "5.4" } till { "15.6" } m

seg-42efdd12fc54 = Spoofing-monitorerna, deras statistik och deras begränsningar finns på <a1>LEO-PASS.md</a1>. Vattenfallet med flera band och en annan jammer per band är <c1/> (<a2>LEO-SIGNAL.md</a2>).

seg-d9e58c4aa8d5 = Ett scenario per fokusområde för experiment

seg-1ab626f27e9d = De åtta fokusområdena för experiment i Celeste IOD:s utlysning för experiment från tredje part (ESA Open Space Innovation Platform, OSIP) är generiska LEO-PNT-frågor; var och en har ett systemoberoende scenario:

seg-afc60ca3c9da = Fokusområde

seg-8a8f40ce3e40 = Högprecis positionering (PPP)

seg-b5eb3448dbb1 = svep <c1/> av <c2/>

seg-5692301bc7cf = ett skikt med 192 satelliter på { "500" }, { "1000" } och { "1500" } km minskar konvergensen för float-PPP med flera GNSS i München från { "13.0" } min till { "3.25" }, { "3.25" } och { "3.5" } min (sex realiseringar, epoker på { "30" } s)

seg-3992215bc8c9 = PNT-resiliens (L, S, C)

seg-a2cc270b415c = se Resiliens

seg-8a6381ff15ac = Kompatibilitet med 5G/6G NTN

seg-ae21ac79775f = svep <c1/> av <c2/>

seg-cb52e7eb3c36 = bandbredd för positioneringsreferens { "180" } kHz till { "20" } MHz: sigma för avstånd i zenit { "6.5" } m till { "5.8" } cm, 3D-fel för ankomsttid { "30.1" } m till { "2.1" } m, med golv vid nätverkets synkroniseringsfel på { "1" } m

seg-45985b521980 = PNT med låg energi för sakernas internet (IoT) och mobilt

seg-9afaaed509ef = svep <c1/> av <c2/> <c3/>

seg-3bb8cc776a28 = UHF EIRP −{ "35" } till +{ "5" } dBW: under en median-C/N0 på ungefär { "35" } dB-Hz stiger energin per varmstartad positionsbestämning från { "18" } mJ till { "55" } J; över den är batteritiden vid en positionsbestämning i timmen { "8334" } dagar, bestämd av vilströmmen

seg-4b0890bd9215 = LEO-PNT-vetenskap

seg-a1ddeda103fa = sned total elektronhalt (TEC) från varje bandpar i en passage med fyra band över Tromsø: { "18.85" } TEC-enheter återskapas av varje par, 1-sigma { "0.017" } (UHF med L) till { "2.9" } TEC-enheter (S med C)

seg-fc31db33e6fe = Ytterligare datatjänster för PNT

seg-91db4e7b4d9c = <c1/> sammansättning av <c2/>

seg-aee8bb27a2fb = Kshanas meddelanderam växer från { "146" } bytes (efemerid och klocka, { "1045" } bitar) till { "154" } med Klobuchar-uppsättningen, { "159" } med NeQuick-G och { "171" } med UTC-parametrarna

seg-bd6c76037986 = Navigering inomhus (UHF)

seg-0a274a3aeb86 = högsta C/N0 inomhus i en traditionell byggnad: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; i en termiskt effektiv byggnad UHF { "15.3" } dB-Hz och alla andra band lägre

seg-101de8218f35 = Sammanslagen PNT med MEO + LEO

seg-b4daa58a2fe7 = svep <c1/> av <c2/>

seg-903d8dcb96cc = Xona X5 sammanslaget med GPS och Galileo över Madrid: 3D-fel med enbart GNSS { "1.06" } m kvadratiskt medelvärde (RMS); sammanslaget { "0.08" } m vid ett LEO-SISRE på { "5" } cm, { "0.57" } m vid { "0.5" } m och { "1.01" } m vid { "5" } m

seg-ebe7a27275cb = Ett scenario per slutanvändarbransch

seg-7c21d067769a = Varje bransch är en kedja <c1/> på en tidslinje, så den kan animeras, och har en medlem <c2/>, så den exporterar geometri (se <a1>Körning</a1>).

seg-1d1135625500 = Bransch

seg-f1a7e54ea7d0 = Autonoma fordon

seg-3610a5f7c352 = en bil i München: öppen väg, sammanslaget fel { "0.30" } m i medel; i en stadskanjon på { "35" } grader behåller GPS och Galileo { "8" } satelliter och ett medelfel på { "5.8" } m, det generiska LEO-skiktet lägger till { "4" } till { "5" } och för ner det till { "2.1" } m, fortfarande över tröskeln på { "1.5" } m för filnivå vid ungefär hälften av kanjonens epoker

seg-6622d9c7366d = Järnväg och sjöfart

seg-73ba745cb492 = det medföljande fartyget <c1/> förlorar varje GNSS-satellit ({ "12.1" } dB-Hz) medan dess LEO-passage i S- och C-banden når { "44.2" } och { "38.1" } dB-Hz; det medföljande tåget <c2/> når { "2" } m tröghetsfel { "35.8" } s in i tunneln; i det fria ger dess LEO-passage { "35" } till { "50" } dB-Hz i L

seg-c87973b9139a = Kritisk infrastruktur

seg-c16a4c99e132 = en oscillator av TCXO-klass (temperaturkompenserad kristall) i en tidsserver i en transformatorstation som går fritt under ett dygn utan GNSS når { "29" } µs, förbi skyddsgränsen på { "1" } µs mellan { "75" } och { "80" } minuter efter förlusten (på rutnätet med 5 minuter); samma klass disciplinerad mot Iridium stannar inom −{ "40" } till +{ "11" } ns

seg-1be8e11b2530 = Polära och arktiska användare

seg-660e450cb4ab = GPS + Galileo medelvärde för positionens geometriska försämringsfaktor (PDOP) { "1.38" }, { "1.57" } och { "1.62" } vid Tromsø, Svalbard och Nordpolen; med Iridium { "1.29" }, { "1.34" } och { "1.26" }, från { "3.0" }, { "5.5" } och { "6.8" } Iridium-satelliter i sikte

seg-22d99734acf1 = Trådlösa nät 5G/6G

seg-abcc6337206f = en basstations ugnsstyrda kristalloscillator (OCXO) i holdover passerar nätgränsen på { "1.1" } µs efter { "8863" } s och slutapplikationens gräns på { "1.5" } µs efter { "10006" } s (analysen i typen <c1/>); disciplinerad mot Xona X5 stannar dess tidsfel mellan −{ "0.7" } och +{ "0.3" } ns hela dygnet, med en förutsagd 1-sigma på { "5" } ns, den angivna osäkerheten i den sända UTC-förskjutningen

seg-532d6814ab2d = Spårning av tillgångar och IoT

seg-b4d6d822e1d0 = en varm UHF-positionsbestämning för en containertagg kostar { "18" } mJ på kajen och till sjöss ({ "8334" } dagars batteritid vid en positionsbestämning i timmen) och { "34" } mJ i ett lager ({ "5770" } dagar), där L-bandet faller till { "20" } till { "24" } dB-Hz

seg-e54b0342fa79 = VALIDATED och MODELLED

seg-dd808d1741f3 = En rad är VALIDATED bara när ett test återskapar en publicerad uppsättning och fastställer den publicerade siffran inom en angiven tolerans; allt annat är MODELLED med sin motivering (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

seg-592a6cf625c5 = VALIDATED LEO-PNT-rader:

seg-344712930047 = bandbegränsad signaleffekt i sluten form och kodföljningsjitter tidig-sen vid publicerade driftpunkter (Betz och Kolodziejski { "2009" }), med Gabor-bandbredden och SSC korskontrollerade;

seg-e93d5b5d3dda = den maximala Doppler för en LEO-navigeringssatellit (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz), och Doppler-envelopen för en statisk användare mot arXiv { "2509.19551" } tabell { "1" };

seg-b02c1b42e509 = ITU-R P.838-3-regnkoefficienter, P.618-14 regndämpning och troposfärisk scintillation, samt P.2109-2 byggnadsgenomträngning mot valideringsdata från ITU-R Study Group { "3" };

seg-fc668542b66d = skalningen av jonosfärsfördröjning i första ordningen och frirymdsdämpningen (IS-GPS-200 grupplöptidskvot, Friis-formen);

seg-59847c667c8b = de globala genomsnittliga SISRE-vikterna (Montenbruck m.fl. { "2018" }), användaralgoritmen i Galileo ICD mot RTKLIB på verkliga sända efemerider, och CRC-24Q mot sitt katalogiserade kontrollvärde.

seg-922761c46f8a = MODELLED LEO-PNT-rader: varje signalutformning och bandavvägning, vattenfallet med flera band, varje passage och länkbudget som helhet, förinställningarna, positionsbestämningar med låg energi, meddelandeanpassningen och formaten, Doppler och gemensam positionering, PPP-konvergens, NTN-positionering, tidsöverföring, polär täckning, kedjan från början till slut, spoofing-monitorerna och jonosfärssonderingen, samt varje kampanj (en kampanj sätter ihop typer och tillför ingen fysik; dess sammansättningsidentiteter testas, <a1>CAMPAIGNS.md</a1>). Ingen LEO-C/N0, ingen avståndsmätningsnoggrannhet och ingen positioneringssiffra jämförs med en mätning av någon satellit.

seg-3cc1d3f1c0f8 = Köra ett scenario

seg-00d5b60c0ebb = Varje scenario ovan medföljer: <c1/> skriver ut det, och

seg-e01ebe977e65 = skriver, bredvid filen, resultatet (<c1/>), diagrammet (<c2/>), den avancerade rapporten (<c3/> och <c4/>, med ett avsnitt som bäddar in den animerade körningen och listar exporterna), den interaktiva spelaren (<c5/>) och exporterna. Vad som gäller beror på typen:

seg-8a96eda978b4 = en körning med tidsaxel animeras: epokerna i <c1/>, <c2/> för en spoofing-körning, tidslinjerna i <c3/>, de gemensamma epokerna och tidsfelskurvorna i <c4/>, felkurvorna i <c5/> och varje kampanjkedja. Ett svep eller en sammansättning har ingen tidsaxel: <c6/> avvisar det med slutstatus { "1" } och då skriver kommandot ingenting alls, så kör de åtta sveppen och sammansättningarna ovan (<c7/>, <c8/> och varje scenario <c9/> utom <c10/>) utan <c11/>;

seg-8d26148aeeff = <c1/> och <c2/> exporterar efemeriderna för passagens geometri i CZML (the Cesium Language), KML (Keyhole Markup Language), GeoJSON och STK (Systems Tool Kit); en kampanj exporterar varje medlem som har geometri som en egen filuppsättning, med medlemsetiketten i filnamnet (<c3/>), så varje bransch exporterar sina LEO-passager; de andra LEO-typerna anger varför ett format inte gäller (<a1>INTEROP.md</a1>).

seg-6f3ad057f914 = De återstående LEO-scenarierna, per typ (detaljer på varje typs sida):

seg-73365a12bf64 = <c1/>, <c2/>, valfri <c3/>

seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valfri <c6/>

seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, valfri <c5/>

seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valfri <c6/>

seg-e3017b224dfc = <c1/>, <c2/>, valfri <c3/>

seg-1ada84b384ee = De valfria scenarierna finns bara i förrådet och hålls undan tillsammans med Celeste-förinställningens fil.

seg-6305e46ec778 = Två av dem finns i andra typer. <c1/> (<c2/>) dimensionerar en LEO-PNT-konstellation med 5000 satelliter i fyra illustrativa Walker-skal: tillgänglighet { "99.22" } % vid en PDOP på { "3" } eller lägre över en mask på { "20" }°, median-PDOP { "1.11" } och i genomsnitt { "39.4" } satelliter i sikte över { "648" } rutnätspunkter och { "12" } epoker. <c3/> (<c4/>) frågar hur länge datablads-OCXO i en LEO-smallsat stannar inom en slotskyddsgräns på { "100" } ns vid k = { "3" } efter sin senaste GNSS-positionsbestämning: gränsen bryts { "650.8" } s efter en positionsbestämning, så den behöver en positionsbestämning minst var { "645.8" } s ({ "133.8" } per dygn), där random walk i frekvensbrus är den dominerande termen.

seg-ee9f20a4485b = LEO-PNT-kedja från början till slut

seg-a6167db680ba = Typen <c1/> (<a1><c2/></a1>) följer ett LEO-PNT-system från dess signalutformning till användarens position. Varje steg är motorns egen typ, körd på sin egen tabell i kedjescenariot, och kedjan lämnar över värden från ett steg till nästa i kod:

seg-38ce4c90dd78 = Från

seg-2cbf005ed5cc = Till

seg-5d84d64174b6 = Vad som lämnas över

seg-15372352ab42 = den spårade komponentens effektandel, andelen i bandet och den spårade chipfrekvensen (bandets EIRP-fördelning och dess C/N0-förskjutning)

seg-0be525c6b695 = kedjesatellitens höjd och inklination (meddelandets referensbana), om inte <c1/> anger dem

seg-d2306e118be7 = den spårade C/N0 vid positioneringsmasken och i zenit, från en minstakvadratlinje i sin(elevation) anpassad till passagen

seg-ee40b8cd109b = avståndsfelet i signalen i rymden (SISRE): meddelandets representationsfel (kvadratiskt medelvärde, bana och klocka) med scenariots term <c1/> för banbestämning i kvadratisk summering

seg-b4b3dff58f3b = bärvågsfrekvensen och den spårade chipfrekvensen

seg-4def115dba1b = Ett värde lämnas över bara där den efterföljande tabellen lämnar det osatt, och varje överlämning listas i resultatets array <c1/> med sitt värde, sin enhet och sitt mål. Ett band i <c2/> måste namnge utformningen (<c3/>); så bär ett band i <c4/> också vilken utformning som helst i <c5/> på egen hand: det tar utformningens mittfrekvens, sändningsbandbredd och spårade chipfrekvens, delar upp sin EIRP på komponenterna och redovisar den spårade komponentens C/N0 och det bandbegränsade koherenta kodföljningsjittret tidig-sen (Betz och Kolodziejski { "2009" }; halvt chipavstånd, slinga på { "1" } Hz, { "20" } ms) vid varje epok.

seg-2a2b15256cf4 = generic: den representativa utformningen <c1/>, en överflygning på { "1080" } km och { "53" }° över Madrid, ett Walker-skikt med 240 satelliter

seg-bb05e8e505e3 = spårad C/N0-topp { "58.2" } dB-Hz, median för kodjitter { "0.050" } m; SISRE { "0.250" } m överlämnat; GNSS-only rotmedelkvadratfel (RMS) i 3D { "1.60" } m, GNSS + LEO { "0.43" } m; konvergens för precis punktpositionering (PPP) { "11.5" } min enbart med GNSS, { "7.5" } min med LEO-skiktet

seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), det lutande skalet för positionering och båda skalen för PPP

seg-a8fe501bf419 = spårad C/N0-topp { "66.3" } dB-Hz, median för kodjitter { "0.018" } m; GNSS-only RMS-fel i 3D { "1.49" } m, GNSS + LEO { "0.68" } m; PPP-konvergens { "20.6" } min enbart med GNSS, { "5.9" } min med Pulsar

seg-002e4c918dda = <c1/> (valfritt)

seg-a608af78a360 = Celeste IOD E5-konfiguration #1 med förinställningen för Celeste-meddelandet (undanhålls tillsammans med förinställningen)

seg-be428c21bd27 = överflygningen återger den totala C/N0-toppen som förinställningen är kalibrerad mot (värdet finns i förinställningsfilen); två satelliter flyttar knappt en fusionerad positionsbestämning över 95 minuter ({ "1.50" } m till { "1.48" } m RMS i 3D)

seg-bf44ba47e48b = skriver resultatet, diagrammet, den avancerade rapporten (som bäddar in den animerade överflygningen och länkar exporterna), den interaktiva spelaren samt efemerisfiler i CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON och STK (Systems Tool Kit) för överflygningens geometri.

seg-a08e67a32d60 = Kedjan är MODELLED: den lägger inte till någon fysik, och varje steg behåller sina egna etiketter. Positioneringssteget modellerar C/N0 som en rät linje i sin(elevation), så en överflygningsspecifik form reduceras till två tal; meddelandesteget modellerar ingen banbestämning, och därför är <c1/> en angiven indata ({ "0.25" } m i de medföljande scenarierna, representativt för den banbestämning på decimeternivå ombord och den styrda chipskaleklockan som ATOMIC-nyttolasten rapporterar: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

seg-ee3c5b58e6fa = <s1>Föregående</s1>Månbana och månyta som infrastruktur

seg-6b951d6413c8 = <s1>Nästa</s1>Utformningar av LEO-signaler

seg-9bfe27f7ebc5 = <s1>Föregående</s1>Uppdragsflöde: månsegmentet
