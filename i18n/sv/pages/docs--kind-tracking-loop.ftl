# docs--kind-tracking-loop: translations (sv)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-b054c73f22e5 = inget värde

seg-59afd80736c5 = <b>PARTNER</b> Tillhandahålls inte — Kshana modellerar signalprestanda, inte nyttolast- eller antennhårdvara. Oberoende referens (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-a3697ad561db = Hz

seg-304496607bd7 = Scenariotyp i motorn v{ $version }, familj <a1>Jamming, spoofing och spektrum</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-5d23d7f8f872 = Familjesida: <a1>Jamming, spoofing och spektrum</a1>

seg-edcd55ccc993 = <b>MODELLED</b> Rapporten <c1/> vilar inte längre med sin nekandekontur på en enda skalär.

seg-05e8854de548 = chip

seg-4f57723d340e = Källa: <c1/>

seg-e84aabe07c43 = <c1/> (scenariotyp)

seg-f6ff1c8c78db = Tracking-slingans förlust av låsning: C/N0 -> lås/olås MED HYSTERES, tiden det tar att förlora låsningen, och spoof-indragning som funktion av HASTIGHETEN i kod- och bärvågsförskjutning. Motorns befintliga kriterier för spärrning och infångning är förhållanden mellan mottagna effekter (en jammer spärrar vid J/S = { "30" } dB, en spoofer fångar in vid { "3" } dB); verklig förlust av låsning är inte ett effektförhållande, den uppstår där en slingas jitter plus dynamiska belastning lämnar dess budget för spårningströskel. Redovisar ({ "1" }) 1-sigma termisk jitter för bärvåg (Costas) och kod (icke-koherent early/late) mot C/N0, inklusive kvadreringsförlust, mot de angivna reglerna { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15-gradersregeln i tre-sigma-form) och { "3" }</em>sigma_DLL + ramplag <= d/2 chip; ({ "2" }) trösklarna för C/N0 vid tappad låsning och återlåsning med den bindande slingan angiven, där återlåsningströskeln HÄRLEDD från den bredare bandbredd som en mottagare återfångar med snarare än att påstås, så att hysteresbredden måste ligga mellan { "5" }<em>log10(ratio) och { "10" }</em>log10(ratio) dB; ({ "3" }) den deklarerade tiden till förlorad låsning från en låsdetektor med två trösklar och bekräftelsetider, driven över en C/N0-ramp, redovisad separat från den fysiska fasflyktstiden (Viterbis medeltid mellan cykelslip, i log10 s eftersom den sträcker sig över hundratals tiopotenser); ({ "4" }) gränser för spoof-indragning — den största kodglidning och bärvågs-Doppler-hastighet som en måls slingor kan följa, med en karta över båda axlarna, eftersom en spoofer som glider snabbare än så inte fångar in slingan, den springer ifrån den; och ({ "5" }) den DENIAL-RADIE som slingdynamiken innebär, redovisad TILLSAMMANS MED den befintliga effektförhållanderadien, aldrig i stället för den, med deras teckenbehäftade skillnad som ett eget namngivet fält (denial_radius_delta_km) och en definition bredvid. Varje utsänt numeriskt fält bär en enhet och en ursprungsklass. VALIDATED slutna former: uttrycken för bärvågs- och kodjitter, slingfilterreduktionen sqrt({ "2" }<em>B_n</em>T) och första ordningens ramplag kontrolleras mot motorns egen sdr-korrelator stegad framåt på seedad syntetisk IF — en annan väg till samma tal — till { "0.6" } %, { "3.7" } % respektive { "0.17" } %, och den modifierade Bessel-funktionen I0 bakom cykelslip-tiden mot vanliga tabellvärden till { "1e-7" }. Den nedre giltighetsgränsen hävdas, inte bara anges: under ~{ "32" } dB-Hz vid { "1" } ms mättas den verkliga atan-diskriminatorn mot sitt område +-pi/2 och mäter mindre jitter än någon linjär teori. MODELLED: slingbandbredderna, integrationstiden, korrelatoravståndet, förhållandet för indragningsbandbredd, bekräftelsetiderna, jammer-effekten och antennförstärkningarna är representativa bandvärden, inte ett datablad. INTE modellerade: oscillatorjitter (Allan-deviation) och vibrationsjitter, begränsning av frontändens bandbredd, flervägsutbredning, AGC-dynamik, förlust vid databitsövergångar, externt stöd och varje halvcykelskorrektion av Costas formel för cykelslip. Under slingdynamik har spoof-infångning ingen radie alls — den bindande begränsningen är förskjutningshastigheten, inte effekten — så det fältet är null med en motivering i stället för ett påhittat tal. Inte en certifierad produkt för mottagarprestanda.

seg-62d230dfccce = En körning av <c1/> sammanfattas som: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> drop { "25.4744" } dB-Hz (bärvågen binder), relock { "27.4413" } dB-Hz, hysteres { "1.9669" } dB | förlorad låsning deklarerad { "39.101" } s in i rampen | denial-radie tröskel(J/S { "30" } dB) { "127.413" } km mot slingdynamik { "53.1694" } km, delta -74.2438 km | spoof-indragning <= { "0.966" } chip/s kod och { "41.45" } Hz/s bärvåg (MODELLED slinga, VALIDATED slutna former)

seg-7614718317f4 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

seg-41162ed2743b = Exemplet <c1/> anger bland annat:

seg-773fff0feaf7 = inom hakparentes

seg-23f3aa5c2064 = Resultatetikett (motorns egen): MIXED — VALIDATED slutna former för slingan, MODELLED slingkonfiguration. Uttrycken för termisk jitter hos bärvåg och kod, slingfilterreduktionen sqrt({ "2" }<em>B_n</em>T) och första ordningens ramplag kontrolleras mot motorns egen sdr-korrelator stegad framåt på seedad syntetisk IF (en annan väg

seg-72182c1aecd9 = Diagrammet som motorn skriver för scenarios/tracking-loop.toml, typ tracking-loop

seg-346594a654f2 = <b>MODELLED</b> Förlust av låsning beräknad ur slingdynamik i stället för ett effektförhållande: 1σ termisk jitter för bärvåg (Costas) och kod (icke-koherent early/late) mot C/N₀ med kvadreringsförlusten, mot de angivna reglerna 3σ_PLL + θ_e ≤ { "45" }° och 3σ_DLL + ramplag

seg-3aa7f9748dc2 = <b>MODELLED</b> Förlust av låsning beräknad ur slingdynamik i stället för ett effektförhållande: 1σ termisk jitter för bärvåg (Costas) och kod (icke-koherent early/late) mot C/N₀ med kv. Oberoende referens (ReferenceImpl): Motorns egen sdr-korrelator (sdr::correlate / synth_if / CaCode) stegad framåt på seedad syntetisk IF vid ett kalibrerat C/N₀ — en separat kodväg som når samma tal genom numerisk korrelation av samplad IQ snarare än genom ett algebraiskt jitteruttryck, så den är en annan väg och inte en omformulering — plus vanliga tabellerade värden för den modifierade Bessel-funktionen I₀ för cykelslip-termen. Slingteori enligt Kaplan & Hegar

seg-de048f9cf1f6 = MIXED — VALIDATED slutna former för slingan, MODELLED slingkonfiguration. Uttrycken för termisk jitter hos bärvåg och kod, slingfilterreduktionen sqrt({ "2" }<em>B_n</em>T) och första ordningens ramplag kontrolleras mot motorns egen sdr-korrelator stegad framåt på seedad syntetisk IF (en annan väg till samma tal), och den modifierade Bessel-funktionen I0 mot vanliga tabellvärden. MODELLED: slingbandbredderna, integr (resultat <c1/>)

seg-0dc70b7607f0 = MODELLED: slingbandbredderna, integrationstiden, korrelatoravståndet, förhållandet för indragningsbandbredd, bekräftelsetiderna, jammer-effekten och antennförstärkningarna är representativa bandvärden, inte ett datablad. (typkatalog (<c1/>))

seg-a679a9732b2a = INTE modellerade: oscillatorjitter (Allan-deviation) och vibrationsjitter, begränsning av frontändens bandbredd, flervägsutbredning, AGC-dynamik, förlust vid databitsövergångar, externt stöd och varje halvcykelskorrektion av Costas formel för cykelslip. (typkatalog (<c1/>))

seg-f8d50cbc6f2c = Varje slingparameter nedan är ett MODELLED representativt bandvärde, inte ett datablad. (kommentar i scenariofilen, rad { "22" })

seg-9241a57823cd = --- slinggeometri ----------------------------------------------------------------- En Costas-bärvågsslinga på { "10" } Hz och en bärvågsstödd kodslinga på { "1" } Hz, { "1" } ms koherent integration (en C/A-kodperiod, så ingen databitssynkronisering antas), smal korrelator på { "0.5" } chip. (kommentar i scenariofilen, rad { "25" } till { "28" })

seg-3a677e343081 = Tracking-slingans förlust av låsning och spoof-indragning under störning är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e3a8f20108f3 = <s1>Föregående</s1>timetransfer
