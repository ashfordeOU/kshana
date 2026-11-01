# docs--kind-spectrum: translations (sv)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Tillhandahålls inte — Kshana modellerar signalprestanda, inte nyttolast- eller antennhårdvara. Oberoende referens (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-304496607bd7 = Scenariotyp i motorn v{ $version }, familj <a1>Jamming, spoofing och spektrum</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-5d23d7f8f872 = Familjesida: <a1>Jamming, spoofing och spektrum</a1>

seg-f85a85f0c7e4 = MHz

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-3319b18ac61f = och { "1" } till i matrisen.

seg-9ca82c79430e = <b>MODELLED</b> Typen <c1/> utvidgad bortom L-bandet: band angivna som en förinställd signalutformning (ritad med varje komponent, bandbegränsad till sändningsbandbredden, C/N0 och J/S hänförda till den spårade komponenten) eller som en egen bärvåg och modulering Tester: <a1>leo_signal_reference.rs</a1>.

seg-ab8fe1c3cb79 = Källa: <c1/>

seg-10a4479141b5 = <c1/> (scenariotyp)

seg-fef00c827c6a = Spektrummodell och vattenfall för L-bandet: hela GNSS L-bandet som en enda effektspektraltäthet (PSD), frekvens i sidled, tid nedåt, över en skriptad jammer-tidslinje. SIGNALER: GPS L1 C/A och L2C (BPSK({ "1" })), Galileo E1 öppen tjänst (MBOC(6,1,1/11), eller BOC({ "1,1" })), GPS L5 och Galileo E5a (BPSK({ "10" })), var och en på sin bärfrekvens med den lägsta mottagna effekt som gränssnittsspecifikationen anger (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) om den inte åsidosätts; GLONASS, BeiDou och Galileo E6 modelleras inte. JAMMERS: kontinuerlig vågton, plant smalbandigt brus, linjär sågtandschirp och brett brus anpassat till ett bands egen modulation, var och en med en centrumfrekvens, en bandbredd, en mottagen effekt (direkt, eller EIRP och avstånd via jamming-typens fritt-rymd-vägförlust) samt på- och avtider. Varje jammer poängsätts mot varje band med sin spektrala separationskoefficient kappa över mottagarens bandbredd, och (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; för en enda jammer är detta lika med anti-jam-ekvationen i jamming-typen med Q = 1/(R_c kappa), och rapporten bär den korskontrollen (och jamming-typens representativa Q-värde bredvid). Brusgolvet är k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }). Vattenfallet medelvärdesbildar varje cell över dess fack och dess rad (chirpar exakt, hela svep plus det partiella; jammers som växlar mitt i en rad enligt sin driftcykel), så att C/N0-tidslinjen och bilden kommer från samma tal; result.json innehåller rutnätet blockmedelvärdesbildat i effekt, C/N0 och J/S per band och rad, samt per jammer och band SSC, Q, J/S, J/S i bandet och stationärt C/N0. Valfritt [iq]: modellen ritad som komplext IQ vid ett ögonblick, skriven till och inläst från en SigMF-inspelning (cf32_le eller ci16_le), och jämförd med en Welch-skattning. Valfritt [recording] (inbyggda byggen): en verklig SigMF-inspelnings Welch-PSD bredvid modellen. VALIDATED: signal-PSD:erna mot läroboksvärdena för huvudlobens bredd (BPSK(n) 2n x { "1.023" } MHz nollställe till nollställe; BOC({ "1,1" })-lober centrerade vid +/-1.023 MHz) och de spektrala separationskoefficienterna mot deras slutna former enligt Parseval och Kaplan & Hegartys Q = { "1" } (CW) och { "1.5" } (anpassad). MODELLED: jammer-effekter, tidslinje, frontändens bandbredder, behandlingen med kontinuerligt spektrum (inga kodlinjer) samt frånvaron av AGC, blankning och antennmönster.

seg-92f1d6d2c0f2 = En körning av <c1/> sammanfattas som: scenario spectrum | { "5" } band | { "3" } jammers | brusgolv -202.0 dBW/Hz | sämsta bandet gps-l1ca min C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

seg-ed3a383d6f1e = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-fb332c77fd0e = Exemplet <c1/> anger bland annat:

seg-df78607f9cdb = Resultatetikett (motorns egen): MODELLED: en effektspektraltäthet för L-bandet byggd av slutna signalspektra (VALIDATED mot läroboksvärdena för huvudlobens bredd och de spektrala separationskoefficienterna), jammer-spektra och ett kT-brusgolv, reducerad till J/S och effektivt C/N0 med den spektrala separationskoefficienten. Jammer-effekterna, t

seg-ea1678eb9e84 = Diagrammet som motorn skriver för scenarios/l-band-waterfall-jamming.toml, typ spectrum

seg-ce0afea7b030 = <b>VALIDATED</b> Effektspektraltätheter med enhetsarea för GPS L1 C/A och L2C (BPSK({ "1" })), GPS L5 och Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) och Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, med en MBOC-variant tillagd), deras numeriskt lokaliserade nollställen och

seg-7e315c5675d0 = <b>MODELLED</b> Typen <c1/>: ett frekvens-gånger-tid-rutnät över effektspektraltätheten i L-bandet (termiskt golv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalerna vid sina lägsta mottagna effekter enligt gränssnittsspecifikationen, och kontinuerlig våg, smalband

seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: läsa och skriva inspelningar i Signal Metadata Format (JSON .sigmf-meta med fälten core global, captures och annotations; rå .sigmf-data som cf32_le, ci16_le eller ci8, heltalsavkodarna delade med realdata::iqif::load_iq), alla på s

seg-4e35cc861b15 = <b>VALIDATED</b> Effektspektraltätheter med enhetsarea för GPS L1 C/A och L2C (BPSK({ "1" })), GPS L5 och Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) och Galileo E1 MBOC(6,1,1/11) (navsignal::M. Oberoende referens (ExternalDataset): Publicerade läroboksvärden: huvudloben för BPSK(n) på 2n x { "1.023" } MHz nollställe till nollställe och anti-jam-koefficienterna Q = { "1" } för en smalbandig (CW) jammer och Q = { "1.5" } för en spridspektrumjammer anpassad till C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3:e uppl., avsnitt { "9.4" }); huvudloberna för BOC(m,n) centrerade vid plus eller minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); de

seg-287de49e90a8 = <b>MODELLED</b> Typen <c1/>: ett frekvens-gånger-tid-rutnät över effektspektraltätheten i L-bandet (termiskt golv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalerna vid de. Oberoende referens (InternalConsistency): Reduktion till den befintliga typen <c2/>:s anti-jam-ekvation och länkbudget (samma kod, anropad med samma indata), samt den slutna formen för brusgolvet k T0 F. Signalspektrumen under detta är den validerade raden ovan; jammer-effekterna, tidslinjen och frontändens bandbredder är scenarioindata, spektrumen är kontinuerliga (inga spridningskodslinjer), och ingen automatisk förstärkningsreglering, blankning eller antennmönster verkar på jammern

seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: läsa och skriva inspelningar i Signal Metadata Format (JSON .sigmf-meta med fälten core global, captures och annotations; rå .sigmf-data som cf32_le, ci1. Oberoende referens (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) med samma periodiska Hann-fönster, överlappning, densitetsskalning, ingen detrend och tvåsidigt medelvärde: varje fack inom { "1e-12" } relativt (observerat { "6.0e-14" }) över { "27" } fall, med segmentantal hämtade från scipys egen spektrogram. sigmf-python { "1.13.0" } (LGPL-3.0, körd som verktyg) skriver fem inspelningar från tredje part (cf32_le, ci16_le, ci8, två inspelningar med annotations, en icke-noll fir

seg-0cbbe567f1c8 = linjestruktur hos spridningskoden (till exempel linjerna på { "1" } kHz i C/A): toner bedöms mot den släta envelopen (resultat <c1/>)

seg-2efdae3f5764 = automatisk förstärkningsreglering, kvantisering, pulsblankning och notchfiltrering (resultat <c1/>)

seg-f3e58705c9a2 = mottagarantennens mönster mot jammern utöver ett förstärkningsvärde (resultat <c1/>)

seg-c0d379cb1ab3 = interferens mellan satelliter inom samma band (multipelåtkomst inom systemet) (resultat <c1/>)

seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 och Galileo E6 (resultat <c1/>)

seg-249d8a46f95a = en konstruerad signals emissioner utanför dess sändningsbandbredd: dess spektrum trunkeras där, så ingen emission utanför bandet når ett angränsande band (resultat <c1/>)

seg-cc83c047f02a = en chirps inverkan på slingan vid svephastigheter jämförbara med slingans bandbredd: dess C/N0 använder det radmedelvärdesbildade spektrumet (resultat <c1/>)

seg-7155706bc289 = MODELLED: en effektspektraltäthet för L-bandet byggd av slutna signalspektra (VALIDATED mot läroboksvärdena för huvudlobens bredd och de spektrala separationskoefficienterna), jammer-spektra och ett kT-brusgolv, reducerad till J/S och effektivt C/N0 med den spektrala separationskoefficienten. Jammer-effekterna, tidslinjen och frontändens bandbredder är scenarioindata, inte mätningar. (resultat <c1/>)

seg-95879767c438 = Ämnessida: <a1>LEO-SIGNAL.md</a1>

seg-ce69d8d2d9d1 = <s1>Föregående</s1>space-weather

seg-ac2c9c25fbb6 = <s1>Nästa</s1>spoof-detect

seg-a349aa76b0ed = PARTNER
