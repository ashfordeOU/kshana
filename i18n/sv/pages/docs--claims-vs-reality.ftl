# docs--claims-vs-reality: translations (sv)

seg-a47934361f43 = NMEA-strömmar för besättningsutbildning

seg-ee2e250497f9 = Export för testbänk

seg-2bd2101ce454 = Yta

seg-ad856ad710eb = Status

seg-98d0bc6b40ce = Compliance-koppling till publika ramverk

seg-80f3f0aae42c = Störningskarta

seg-28b1885c4ca7 = Källa: <c1/>

seg-bf5c2811ce29 = Påståenden mot verklighet — register över överdrifter

seg-592e007bc3cf = En oberoende granskning av en tidigare Kshana-version förtecknade fjorton <b>överdrifter</b> (<c1/>…<c2/>): ställen där en publik yta (README, lekplatsen, etiketter för kvalitetsmått (FoM, figure of merit), scenariopaket) beskrev en förmåga starkare än koden levererade. Den här sidan är avslutsregistret: varje rad anger den ursprungliga överdriften, hur den löstes och beläggen. Två slags lösningar förekommer:

seg-39250970dbbf = <b>Påståendet nedtonat</b> — formuleringen rättades så att den stämmer med koden (ärlig omformulering, ingen förändring av förmågan). "Ingen kod = inget påstående."

seg-fb7da0f79ead = <b>Ersatt</b> — den verkliga förmågan byggdes och testades därefter, så att det starka påståendet blev <em>korrekt</em>.

seg-5292f7162e2b = En regressionsspärr (<c1/>) söker igenom de levande publika ytorna (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> samt förstasidorna för crates.io, PyPI (Python Package Index) och npm <c8/>, <c9/>, <c10/>) vid varje CI-körning (kontinuerlig integration) och misslyckas om någon av de utgångna rena överdrivna formuleringarna dyker upp igen utan förbehåll — så att en rad inte tyst kan falla tillbaka från GREEN.

seg-dafc6f322f34 = Alla fjorton rader är <b>GREEN</b>.

seg-5cf7bf2d1889 = OC (överdrift)

seg-0e01d4053d7f = Ursprunglig överdrift

seg-36bf87638923 = Lösning

seg-70a952c4150b = "gemensam Kalman-fusionsskattare" antydde ett enda filter med korskovarians; koden körde två oberoende skattare

seg-d5682a7fdb11 = <b>Ersatt</b> — ett verkligt kopplat Kalman-filter för klocka + position med korskovarians byggdes

seg-1008020cd9e4 = <c1/> ({ "7" } tester, bl.a. en ensemble om 100 försök med kopplat mot frikopplat som kräver att det kopplade positions-RMS (root mean square) ligger under { "0.6" }× av det frikopplade och att det kopplade filtret vinner i minst { "90" } av de { "100" } försöken); CAPABILITY "Sensor fusion" → full

seg-334fc345d501 = "klockstödd RAIM (receiver autonomous integrity monitoring) för spoofingdetektering" antydde en RAIM-detektor med flera satelliter

seg-cf0795c2ee02 = <b>Påståendet nedtonat → Ersatt</b> — omformulerat som en gräns för detekterbarhet av spoofing utifrån klockstabilitet; den verkliga RAIM/ARAIM (HPL/VPL (HPL: horisontell skyddsnivå; VPL: vertikal skyddsnivå)) kom därefter

seg-f46432acbfa0 = <c1/> ({ "30" } tester — snapshot + ARAIM med lösningsseparation, HPL/VPL, FDE (felupptäckt och felexkludering), Stanford-diagram); <c2/>

seg-8b47f69dbb76 = "jammingdemonstrator" utan någon jammingkod bakom sig

seg-bfff34d5a250 = <b>Ersatt</b> — en länkbudgetmodell för jamming J/S → effektiv C/N₀ → förlorad låsning byggdes

seg-5f75628b8201 = <c1/> ({ "10" } tester); README-raden "Resilience"

seg-bae512770cd6 = "Fullständig Allan-variansbrusmodell för IMU (tröghetsmätenhet) på en IMU-triad" — modellen hade en enda axel

seg-50c0b5855cb9 = <b>Påståendet nedtonat → Ersatt</b> — omformulerat som en felbudget med 1 DOF (DOF: frihetsgrad); en treaxlig strapdown-INS (tröghetsnavigeringssystem) levererades därefter

seg-501bf7d8fff0 = <c1/> treaxlig strapdown (kvaternionattityd, NED-mekanisering (nord-öst-ned), coning/sculling); ROADMAP "Inertial"

seg-ad250a99b05f = "Hybrid PNT-integration (positionering, navigering och tidssynkronisering)" antydde ett kopplat GNSS/INS-filter (GNSS: globalt navigationssatellitsystem); det var en felbudget för dödräkning

seg-85fb58d37a5d = <b>Påståendet nedtonat → Ersatt</b> — omformulerat som dödräkning med en konfigurerbar återlåsning; verklig tätt kopplad GNSS/INS-fusion levererades därefter

seg-9e6b092d5656 = <c1/> (UKF med 17 tillstånd (unscented Kalman-filter) med kvant-CAI-dödräkning (CAI: kallatomsinterferometer)); CAPABILITY "Sensor fusion" → full

seg-46a637f8e967 = "validerad ~{ "2" }%" antydde en snäv upprätthållen spärr

seg-5e98d7664558 = <b>Påståendet nedtonat</b> — <c1/> anger den <em>upprätthållna</em> spärren ({ "20" }–{ "25" }% medelvärde över frön); "~{ "2" }%" betecknade en typisk observation, inte spärren

seg-84f4fcdc7e50 = <c1/> rubriken "On tolerances"

seg-85ec2fe9c7f7 = "deterministisk över plattformar" utan incheckade belägg

seg-6e516f04db89 = <b>Påståendet nedtonat</b> — verktygskedjan låst till en exakt utgåva; golden-hashar per scenario incheckade med en reproducerbarhetsspärr. (Bitidentiskt <em>mellan</em> OS/arkitekturer (OS: operativsystem) återstår som en öppen punkt, uttalad ärligt.)

seg-9db327be56c3 = <c1/> (kanal <c2/>); <c3/> (numeriska värden till { "1e-6" }); <c4/> (hash av varje resultats indatafingeravtryck och form, körd på CI-matrisen för Linux, macOS och Windows); <c5/>

seg-2708139388ed = "hybrid kvant-klassisk PNT-simulator" antydde kvantfysik från första principer

seg-717167714e83 = <b>Påståendet nedtonat → Ersatt</b> — omformulerat som en simulator för PNT-resiliens som använder prestandamodeller för kvantsensorer; CAI-fysik av Mach–Zehnder-typ från första principer kom därefter

seg-c67fb22add4b = <c1/> ({ "26" } tester — Mach–Zehnder-fas, projektionsbrus <c2/>, vibrationsöverföringsfunktion, Coriolis + AC-Stark (AC: växelström) systematik); <c3/>

seg-5c6b7d4f2029 = Kvalitetsmåttet "Integrity Performance" antydde integritet för luftfart med HPL/VPL/RAIM

seg-ee5487da890c = <b>Påståendet nedtonat + Ersatt (i lager)</b> — kvalitetsmåttet per körning i scenariot betecknas ärligt som <em>filtrets självkonsistens</em> (<b>inte</b> integritet för luftfart); den verkliga ARAIM HPL/VPL redovisas <em>separat</em> så att de två aldrig förväxlas

seg-31aacdf17b02 = <c1/> (<c2/>: självkonsistens, med förbehåll); <c3/> + <c4/> (verklig ARAIM)

seg-0686fa147c96 = Kvalitetsmåttet Säkerhet presenterades som alltid meningsfullt, även utan någon attack

seg-d6d9296422fc = <b>Påståendet nedtonat</b> — kvalitetsmåttet Säkerhet (<c1/>) sätts in i sammanhanget för spoofingdetektorn och är meningsfullt bara när ett attackscenario har konfigurerats

seg-8f7b211b5a0c = README-raden "Resilience"; kvalitetsmåttet Säkerhet definieras vid den operativt skadliga specifikationspunkten

seg-d66421174e94 = Kvalitetsmåttet "Positioning Performance" antydde full noggrannhet i positionsdomänen

seg-9eeb13a16350 = <b>Påståendet nedtonat</b> — betecknat som ett <c1/> med 1-DOF för tröghets-/hybridpaketen, uttryckligen <b>inte</b> en 2-D CEP/2DRMS (CEP: circular error probable) eller DOP-viktad (DOP: försämring av precisionen) noggrannhet

seg-e8115df73c10 = README:s tabell över kvalitetsmått (raden "Positioning Performance")

seg-5c73759a2454 = tal för kvalitetsmått i tröghetspaketet lästes som ensemblestatistik från enskilda frön

seg-3db3a41ce848 = <b>Påståendet nedtonat</b> — en enskild körning flaggas <c1/>; <c2/> redovisar medelvärde/spridning/bootstrap-KI på { "95" }%

seg-bf737455e6f2 = README:s tabell över kvalitetsmått; tester av scenariotäckning över driftområdet

seg-aa362992b5da = scenariot "SGP4 (Simplified General Perturbations { "4" }) GPS-konstellation (Global Positioning System)" använde syntetiska platshållar-TLE:er (tvåradselementuppsättningar)

seg-ebae20813a52 = <b>Ersatt</b> — scenariot bäddar nu in en äkta datumstämplad ögonblicksbild <c1/> från Celestrak med strikta kontrollsummor

seg-2d49f6101571 = <c1/> (verklig <c2/>, <c3/>); <c4/>

seg-cdefa4ee436a = README:s versionssträng avvek från <c1/>

seg-8e66b9485565 = <b>Påståendet nedtonat</b> — en CI-spärr kontrollerar att statusmärket i README stämmer med <c1/>

seg-347fd8c1f334 = { "0.35" }: påståenden hållna snäva och en rättelse

seg-946ff389cec5 = Funktionerna i { "0.35" } skrevs med sina begränsningar angivna intill påståendet, och samma spärrar (<c1/> och formuleringsspärren i <c2/>) söker igenom de sidor som beskriver dem. Den här tabellen är inte en del av registret med fjorton rader ovan; den anger för de nya ytorna vad som påstås och vad som inte påstås.

seg-6ac3f9b26aad = Vad som påstås

seg-6f558815da86 = Vad som inte påstås

seg-d0964d2f9bbc = Förtroendepoäng för fartyg (<c1/>, <c2/>, gate, Signal K, OpenCPN)

seg-ee4d75006bfc = en poäng på 0-100 och skäl utifrån en mottagares egen NMEA, MODELLED

seg-59ff27c84fe4 = rådgivande, inte typgodkänd navigationsutrustning; en poäng för en logg är inget uttalande om andra mottagare; den gör inte en positionsbestämning mer exakt

seg-8869e6a5c10b = syntetisk brygg-NMEA med skriptade händelser och en instruktörslogg

seg-bc4ba77bc569 = enbart text, ingen radiofrekvent utsignal; aldrig för ett fartygs levande navigationssystem; rådgivande, inte typgodkänd navigationsutrustning

seg-9482ecbb2748 = en signerad teknisk post som kan verifieras offline

seg-20ae6dd2b780 = inte ett juridiskt utlåtande; säger inte vad som orsakade en händelse, vem som var ansvarig eller att loggen visar vad mottagaren faktiskt tog emot

seg-4132fc36f1d3 = aggregerade celler med försämrad navigering ur öppet licensierade rapporter

seg-c64960abf9fb = inte en prognos; en rutts exponering är en andel celler, inte en risk

seg-ed6d268e0291 = ett scenarios fordonsrörelse och händelser i filer som en laboratoriesimulator kan läsa

seg-85c8ad22ef03 = ingen signal skrivs; ingen prestanda hos någon simulator eller mottagare påstås

seg-1bba9a883650 = vilka rader en uppsättning körningar ger belägg för, med en lucka på varje rad

seg-f2a836780831 = aldrig att ett ramverk är uppfyllt eller att en produkt är godkänd; en slagetikett ensam är inte belägg

seg-31c7009c9914 = <b>Rättelse införd i { "0.35" }.</b> En tidigare version av <c1/> och av kommentarerna i resiliensmodulen beskrev sju "teknikkategorier" i DHS Resilient PNT Conformance Framework. Version { "2.0" } av det ramverket definierar kärnfunktioner (Prevent, Respond, Recover), nivåer från { "0" } till { "4" } och åtta numrerade krav, och ingen lista över sju kategorier. De sju delpoängsnamn som poängmotorn ger ut är Kshanas egna, och korsreferensen säger nu detta.

seg-f70787ecb194 = Hur en rad förblir GREEN

seg-f2c599e8882a = De starka påståendena (OC-0/2/7/8 och de ersatta halvorna av OC-1/3/4/12) är GREEN eftersom förmågan är <b>levererad och testad</b> — inte för att formuleringen mjukats upp. De nedtonade raderna är GREEN eftersom den levande formuleringen stämmer med koden. Spärrtestet gör den andra kategorin möjlig att upprätthålla: om en utgången överdriven formulering återkommer på en publik yta blir CI rött. Se <c1/>.

seg-39e475441b60 = <s1>Föregående</s1>Varför rader förblir Modelled

seg-07ef8e1e862e = <s1>Nästa</s1>Proveniens
