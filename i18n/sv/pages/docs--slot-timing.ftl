# docs--slot-timing: translations (sv)

seg-f917e7fcac09 = Vad det är

seg-adc34608c46b = Klass

seg-3a0e724a8a2b = Nivå

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Betydelse

seg-f63dd3d7aad4 = Källa

seg-1ff32b87e030 = Satelliter

seg-582fd72f1a1a = Utlåtande

seg-430edd66bda0 = Inte modellerat

seg-f23c8bd5f203 = Källa: <c1/>

seg-1f2727dc4ca4 = Scenariotypen <c1/> besvarar tre frågor för en klocka som går fritt mellan synkroniseringar och måste hålla trafiken inom en <b>tidsindexerad tidslucka</b>: en routing-, tilldelnings- eller kontaktlucka vars <b>guard</b> (skyddsmarginal) är det största absoluta tidsfel, åt endera hållet, vid vilket luckan fortfarande fungerar.

seg-6b39d8afeb5d = <b>När bryts guarden?</b> Sekunder från den senaste tidsfixen tills det förutsagda tidsfelet når guarden, med varje bidragande term specificerad och den dominerande namngiven.

seg-60476d723e1a = <b>Hur mycket tid återstår nu?</b> Samma värde minus den tid som redan förflutit sedan tidsfixen.

seg-84010982db35 = <b>Hur ofta måste klockan ta en tidsfix?</b> Det största intervallet mellan tidsfixar som håller felet inom guarden, efter avdrag för fördröjningen innan en tidsfix får effekt.

seg-3388d46925f1 = En valfri sektion <c1/> lägger till tidsskyddsnivån (TPL) för en mottagare i omloppsbana; se <a1>Spoofing av en mottagare i omloppsbana</a1>.

seg-2eb266d992b0 = Kör det medföljande exemplet med <c1/>.

seg-624e7a70c4f6 = Förkortningar: GNSS, Global Navigation Satellite System; TCXO, temperaturkompenserad kristalloscillator; OCXO, ugnsstyrd kristalloscillator; RAFS, rubidiumatomfrekvensnormal; CSAC, atomklocka i chipformat; USO, ultrastabil oscillator; DSAC, atomklocka för djuprymd; ADEV, Allan-avvikelse; FM, frekvensmodulation (här brus på klockans frekvens); PM, fasmodulation (brus på dess fas); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, telekommunikationsstandardiseringssektorn inom International Telecommunication Union; TIE, tidsintervallfel; MTIE, maximalt tidsintervallfel; TDEV, tidsavvikelse; max|TE|, maximalt absolut tidsfel; CUSUM, detektor för förändring med kumulativ summa; TPL, tidsskyddsnivå; LEO, låg jordbana; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (en IEEE Transactions); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, satelliterna i GPS Block II Follow-on; SHA-256, den 256-bitars Secure Hash Algorithm; PPS, puls per sekund.

seg-f2a0c73ef648 = Felmodellen

seg-6bc3f9e78346 = Det förutsagda tidsfelet efter att ha gått fritt <c1/> sekunder från en tidsfix är

seg-3fbb186c716a = täckningsfaktor ({ "3" } motsvarar cirka { "99.7" } % av ett gaussiskt fel)

seg-883965151598 = tidsfelets ettsigma vid tidsfixen

seg-b63c0447865f = ettsigmafel för den frekvens som är känd vid tidsfixen; en frekvens skattad över ett fönster <c1/> har ungefär <c2/>

seg-ab28fc69d3ac = varians för vitt fasbrus: jitter i tidsfelet, ett konstant golv

seg-8792541a7b6d = densiteter för vit FM, random-walk-FM och random-run-FM (van Loan-termerna i <c1/>)

seg-5d36b32c4de8 = flicker-FM-golv för Allan-variansen

seg-65da5a90685f = kvarstående fraktionell frekvensoffset efter tidsfixen

seg-816e427d51f9 = frekvensoffset från en temperaturändring <c1/> via temperaturkoefficienten <c2/>

seg-e23d0ac960aa = linjär åldringstakt

seg-43e5f75b369c = Varje FM-term är lika med <c1/> för sin egen brustyp, med <c2/> (Zucca och Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). För vit FM, random-walk-FM och random-run-FM är den relationen exakt. För flicker-FM är den den konventionella skattningen av tidsprediktionsfelet (Riley, NIST SP { "1065" }): flicker-FM saknar sluten form utan en lågfrekvensgräns. Frekvensoffseten adderas till beloppet eftersom deras tecken är okända, så den deterministiska delen är ett värsta fall. Varje term är icke-negativ och icke-avtagande i <c3/>, så <c4/> har en rot, som hittas genom inringning och bisektion.

seg-f9038fba23e2 = Varifrån klockan kommer

seg-5c44b2f8d015 = Scenarionyckel

seg-cb92ae98c231 = Klassstandard

seg-7594664253f2 = ett citerat ADEV på en sekund och ett rödbrusgolv syntetiserat två och fyra dekader under det

seg-794e4932b470 = MODELLED: svaret för en stabil klocka styrs av det antagna golvet

seg-5ea820aaa69f = Databladsförinställning

seg-c943490619f3 = telekomtidssynkroniseringens förinställningar (<c1/>, <c2/>, <c3/>, <c4/>), var och en ett namngivet Microchip-datablad

seg-a20353d50011 = MODELLED: ett hölje av databladens maxvärden

seg-b543f3dcd11a = Inbäddat datablad

seg-4983ec096617 = kundens egen ADEV-tabell, åldrings- och temperaturkoefficient

seg-b079bca8a611 = MODELLED: ett hölje av de angivna maxvärdena

seg-119d94700cab = Uppmätt registrering

seg-ae6835f0c3c5 = en fasregistrering; dess överlappande ADEV anpassas med viktad minsta kvadrat

seg-6e1c4702186d = inversionen är VALIDATED på en undanhållen verklig registrering (nedan)

seg-f4cc2be238b7 = De tre klasser som lades till i { "0.28.0" } hänvisar var och en till ett offentligt datablad:

seg-47f6ddc3bd02 = ADEV på en sekund

seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, grundkolumnen för TCXO

seg-becbff195fff = Microchip OX-208 datasheet, Rev 12-1-2021

seg-19d8d32203f6 = Microchip 8040C Rubidium Frequency Standard datasheet, DS00003047A

seg-48babc170b93 = EndRuns rader för lång medelvärdestid konvergerar över hela den tabellen ({ "4e-13" } för varje oscillator utom TCXO, { "8e-13" }, vid { "10 000" } s, och { "6e-14" } för alla vid { "100 000" } s), vilket tyder på att de beskriver den disciplinerade produkten i stället för den fritt gående oscillatorn, så de används inte.

seg-85c7211bb49b = <b>Registreringsanpassningen är viktad.</b> En skattning av Allan-varians med <c1/> ekvivalenta frihetsgrader har varians cirka <c2/>, så varje punkt ingår med residual <c3/>. En oviktad anpassning lät de korta medelvärdestiderna avgöra termerna för lång medelvärdestid: på en testregistrering med vit FM gav den ett falskt flicker-golv som förkortade en överträdelse på { "2 000" } s med { "30" } %. Ett datablad eller en registrering stöder bara medelvärdestider upp till sin längsta punkt; en överträdelse bortom den flaggas <c4/>.

seg-5b61a42c76c2 = Validering: inversionen på en undanhållen verklig klocka

seg-2220a1490923 = <c1/> använder registreringen med { "556" } 990 sampel av en 5071A-cesiumnormal uppmätt mot en vätemaser (A. Wallin, distribuerad med <c2/>; samma registrering som den oberoende referensen för skattaren <c3/> använder). Med masern som referens är registreringen ett fritt gående på 6.4 dygn.

seg-9bae4571f67c = Anpassa brusmodellen enbart på registreringens <b>första tredjedel</b>.

seg-15b2cb621db7 = Förutsäg, utifrån den modellen, den tid av fritt gående då ettsigma-tidsfelet når { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } och { "2.5" } ns.

seg-1bd9ac435bfa = På de <b>andra två tredjedelarna</b>, gå fritt från en synkpunkt var { "997" } s med frekvensen skattad från föregående tredjedel, och mät var det kvadratiska medelvärdet av felet vid fritt gående når varje tröskelvärde.

seg-d7640a2ec444 = Tröskeln, fastställd innan testet första gången kördes, är att varje förutsagd överträdelse ligger inom en faktor { "1.5" } av den uppmätta. En kontroll, ADEV på en sekund läst som vit FM, måste misslyckas mot den tröskeln, så att tröskeln kan skilja en bra modell från en dålig. Testet skriver ut sin tabell; en mutation som halverar nivån för vit FM får det att misslyckas. Den råa registreringen är tredjepartsdata som är git-ignorerad: <c1/> hämtar den, och arbetsflödet <c2/> kör testet med <c3/>, så att en saknad fil leder till misslyckande där i stället för att hoppas över.

seg-3d11f7c6d4ab = Vad detta validerar: vägen anpassa-sedan-invertera, på en atomnormal som domineras av vit FM, över fria gångar upp till cirka { "50 000" } s. Vad det inte validerar: databladen och klasskällorna, de deterministiska termerna och en kristalloscillator (nästa avsnitt).

seg-bfcc5555ed50 = Samma prediktion på en verklig kristalloscillator: konservativ, inte validerad

seg-b77b3f503ca2 = <c1/> använder en uppmätt OCXO: { "19 982" } frekvensavläsningar på en sekund av oscillatorn på { "10" } MHz i en HP-impedansanalysator, mot en vätemaser (A. Wallin, { "2015" }, distribuerad med <c2/>; <c3/>). Brusmodellen och en linjär drift anpassas på den första tredjedelen; varje fritt gående på de andra två tredjedelarna startar från en frekvens skattad över de föregående { "100" } s, och modellen bär den skattningens osäkerhet (<c4/>, modellens egen Allan-avvikelse vid { "100" } s).

seg-e05821406c28 = Anpassad på

seg-c70aadbd47d4 = Förutsagd ÷ uppmätt överträdelse, { "0.2" } till { "10" } ns

seg-d71582148b20 = Avläsning

seg-dcc3fd23bede = den första tredjedelen (undanhållen)

seg-f9bb286f5868 = { "0.59" } till { "0.70" }

seg-612784f70090 = konservativ: aldrig senare än uppmätt, för det mesta utanför tröskeln på { "1.5" }

seg-121fa832c30f = själva utvärderingssegmentet (diagnostik)

seg-b4be9afa69ac = { "0.98" } till { "1.17" }

seg-75e1515b970a = inversionen är rätt; glappet mot den undanhållna delen beror på att oscillatorn förändras

seg-c91da69e9c09 = Oscillatorns brusgolv halverades under registreringen: Allan-avvikelsen för den första tredjedelen planar ut nära { "7.5e-12" }, resten nära { "3.5e-12" }. En modell som anpassats tidigt överskattar bruset, vilket är den säkra riktningen. <b>Kristallfallet är därför inte validerat och förblir MODELLED.</b> För en kristall: anpassa på en stabiliserad registrering och anpassa om allteftersom komponenten åldras.

seg-6230fed0e164 = <b>Hur protokollet valdes, angivet eftersom det inte var blint.</b> En första explorativ körning återanvände cesiumprotokollet (frekvens från föregående tredjedel, ingen frekvensterm) och förutsade överträdelser { "1.4" } till { "2.5" } gånger senare än uppmätt: optimistiskt, den farliga riktningen. En kristalls frekvens vandrar, så en frekvens skattad timmar före tidsfixen är inaktuell, och modellen hade ingen term för hur väl frekvensen är känd vid tidsfixen. Termen <c1/> lades till av det skälet och protokollet fastställdes innan testet skrevs; tröskeln flyttades inte. Testet kontrollerar också att prediktionen i urvalet, utan termen, är optimistisk vid varje tröskelvärde, så termen är bärande.

seg-88e01cac525a = Samma prediktion på atomklockor i omloppsbana: { "8" } av { "10" }, inte validerad

seg-17962966b6d6 = <c1/> använder IGS slutliga kombinerade klockor vid { "30" } s under { "14" } dagar ({ "17" } till { "30" } augusti { "2025" }; <c2/>, varje fil låst med SHA-256): varje GPS Block IIF-satellitklocka mot IGS tidsskala. Protokollet (satellituppsättning, luckregel, anpassningsfönster, en synkning var { "3 570" } s med frekvensen från föregående timme, trösklar på { "1" } till { "20" } ns, tröskeln på { "1.5" }, och regeln att klassen klarar testet bara om varje satellit gör det) skrevs ned innan någon av data hämtades.

seg-1b5832633c87 = Förutsagd ÷ uppmätt överträdelse

seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

seg-9a6fac366156 = { "0.76" } till { "1.46" }

seg-c14941cb5537 = inom tröskeln

seg-dbaaf875f1fb = { "1.51" } till { "1.99" }

seg-3601e13c39b6 = optimistisk

seg-ea41cf6dbec2 = { "1.20" } till { "1.61" }

seg-099fb000bf57 = inte utvärderad

seg-a7699b256ee1 = utesluten av luckregeln (en saknad dag)

seg-eb71202e0b91 = Åtta av tio är användbar evidens, men två satelliter förutsägs hålla längre än de gjorde, vilket är den farliga riktningen, och protokollet kräver att varje satellit klarar testet. <b>Fallet i omloppsbana förblir därför MODELLED.</b> Block IIF-satelliter bär både rubidium- och cesiumnormaler och IGS-filerna anger inte vilken som är aktiv, så resultatet anges för satelliterna, inte för en klocktyp. Varför G25 och G30 skiljer sig har inte undersökts.

seg-a9be8a92b6b9 = En bench-körning för en flygrepresentativ komponent (avgränsad, ej gjord)

seg-43597df55508 = Den offentliga OCXO-registreringen är { "5.5" } timmar lång, från ett laboratorieinstrument, med oscillatorn fortfarande stabiliserande. Det som skulle validera kristallfallet är ett längre uppmätt fritt gående hos en flygrepresentativ OCXO eller en CSAC mot en referens:

seg-e2698f00a84a = en tidsintervallräknare som jämför oscillatorns { "1" } PPS med en GNSS-disciplinerad referens eller en vätemaserreferens, minst { "10" } dagar med ett sampel per sekund, temperatur loggad;

seg-c4c902ac028e = samma undanhållna protokoll: anpassa på den första tredjedelen, förutsäg överträdelserna, mät på resten, med samma tröskel och kontroll;

seg-0faaa6279195 = registreringen och dess hash publicerade vid sidan av testet så att raden är reproducerbar.

seg-9b2255563582 = Det är blockerat av tillgång till referenshårdvara och utlovas inte.

seg-6cb2dc94d1bf = Mot vilket vandringsmått bör en tidslucka bedömas?

seg-f6d24245dca6 = Tidsstandarder erbjuder tre familjer av mått. För en tidsindexerad tidslucka mäter bara ett av dem det som bryter luckan.

seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) är det största topp-till-topp-TIE inom något fönster av en given längd. Det är blint för en konstant offset: en klocka som är { "1" } µs fel men helt stabil har en MTIE nära noll och missar varje tidslucka. Den mäter hur mycket felet <em>ändras</em>, inte var det <em>är</em>.

seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) bygger på andradifferenser av medelvärdesbildad fas. Den tar bort en konstant offset och ett konstant frekvensfel, vilket är precis de termer som dominerar ett fritt gående. Den karakteriserar brustypen; den är inget bedömningsmått för absolut tidsangivelse.

seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; budgetmåttet i G.8271) är det största absoluta tidsfelet mot referenstidsskalan. Det kan jämföras direkt med en guard.

seg-7eefc395a118 = <b>Slutsats.</b> Bedöm en tidslucka mot max|TE| relativt nätverkets referenstidsskala, utvärderat som ett förutsagt hölje från den senaste tidsfixen vid en angiven täckningsfaktor. Det är vad <c1/> är: eftersom varje term växer med <c2/> är maximum över ett fritt gående av längden <c3/> <c4/>. MTIE och TDEV förblir användbara som diagnostik: TDEV för att identifiera vilken brusterm man ska åtgärda, MTIE(L) för att begränsa hur mycket felet rör sig under en tidslucka av längden <c5/>.

seg-51d4ee8484d7 = Två förfiningar som måttvalet innebär:

seg-a52524111ed7 = <b>Guarden gäller det relativa felet mellan två noder.</b> Om sändare och mottagare båda går fritt oberoende adderas deras stokastiska fel kvadratiskt och deras deterministiska fel i belopp. När den stokastiska delen dominerar kan varje nod få <c1/>; när åldring eller temperatur dominerar, <c2/>.

seg-073fe7cd8e63 = Täckningsfaktorn är ett designval, inte en egenskap hos klockan.

seg-eb1cbf9fda2d = <c1/> begränsar cirka { "99.7" } % av gaussiska fel vid ett enda ögonblick, inte över varje tidslucka under ett dygn; en routingplan med många tidsluckor per dygn behöver den risk per lucka som den kan tolerera.

seg-04734b8a115b = Spoofing av en mottagare i omloppsbana

seg-9e734bbda345 = Sektionen <c1/> utvärderar <c2/> för samma klocka:

seg-a2f21a643389 = <b>Geometri.</b> En markspoofer når en LEO-satellit bara medan satelliten är över dess horisont: vid { "550" } km högst cirka tolv minuter per överflygning. En spoofer som rampar med takten <c1/> kan därför dra klockan högst <c2/> gånger det fönstret, eller gånger tiden till nästa oberoende kontroll om den är kortare (<c3/>).

seg-ff59489b08b8 = <b>Dynamik.</b> Ett gemensamt tidsdrag förskjuter varje pseudoavstånd lika och absorberas i klockbiasen, inte i positionen, så en positionskontroll med banpropagator räknas inte som en tidskorskontroll.

seg-4302cc49b91f = <b>Korskontroller.</b> En satellit har sällan en andra oberoende tidsmottagare. Den har sin egen klockas fria gång (monitorn i <c1/>), en tvåvägs tidsöverföring med en markstation under kontakter och tidsjämförelser över intersatellitlänkar. En korslänk är oberoende av en markspoofer bara om grannen befinner sig utanför den spooferns täckområde vid samma ögonblick, vilket rapporten kontrollerar utifrån antalet satelliter per plan.

seg-16c15664a51c = <b>Villkorad gräns.</b> Monitorgolvet plus klockans fria gång under CUSUM-detektionens fördröjning, vilket exakt reduceras till <c1/> när klockan saknar flicker-, vitfas- eller random-run-term. Liksom den gränsen gäller den bara givet detektion.

seg-f7678693be22 = Allt detta är MODELLED: en sfärisk, icke-roterande jord, en överflygning rakt ovanför, en markbaserad spoofer med en angiven maximal ramptakt. Signalernas ankomstriktning vid en zenitriktad antenn är en verklig korskontroll som kräver ett antennmönster och inte är modellerad. <a1><c1/></a1> förklarar varför ett signerat styrmeddelande inte undanröjer detta hot.

seg-070a4e72b5ea = Frekvenshopp, strålningseffekter och relativistiska frekvensoffset; en termisk modell (temperaturändringen är ett steg vid tidsfixen); själva synkroniseringsprotokollet (en tidsfix återställer felet till <c1/>).

seg-a2766c0f19d0 = <s1>Föregående</s1>Optiska länkar genom atmosfären

seg-85ad3eb72a80 = <s1>Nästa</s1>Telekomtidssynkronisering
