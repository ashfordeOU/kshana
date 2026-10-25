# docs--kinds-jamming-spoofing-and-the-spectrum: translations (sv)

seg-b03d56f501c3 = Typ

seg-98e740d32860 = Utvärderingsbädd för maskininlärd detektering av RF-störningar ({ "13494" }): generera en märkt, parameterförankrad SYNTETISK korpus (nominal/jamming/spoof-time/spoof-position/multipath), poängsätt en detektor (energy|agc|sqm|parity|fused) med den detektoroberoende ramen och redovisa AUC/ROC/förväxlingsmatris + Pd per klass vid ett mål-Pfa, samt optimismgapet mellan inom och utanför fördelningen. Endast MODELLED driftkaraktäristik — aldrig fält/IQ, inget bra/dåligt-utlåtande.

seg-7e7b07bc5545 = Diagrammet som motorn skriver för scenarios/impairment-eval.toml, kind impairment-eval

seg-60bf3f0ff000 = Jamming enligt länkbudget: J/S → effektiv C/N₀ → förlust av låsning.

seg-42d46b928d09 = Diagrammet som motorn skriver för scenarios/jamming-demo.toml, kind jamming

seg-fef00c827c6a = Spektrummodell och vattenfall för L-bandet: hela GNSS L-bandet som en enda effektspektraltäthet (PSD), frekvens i sidled, tid nedåt, över en skriptad jammer-tidslinje. SIGNALER: GPS L1 C/A och L2C (BPSK({ "1" })), Galileo E1 öppen tjänst (MBOC(6,1,1/11), eller BOC({ "1,1" })), GPS L5 och Galileo E5a (BPSK({ "10" })), var och en på sin bärfrekvens med den lägsta mottagna effekt som gränssnittsspecifikationen anger (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) om den inte åsidosätts; GLONASS, BeiDou och Galileo E6 modelleras inte. JAMMERS: kontinuerlig vågton, plant smalbandigt brus, linjär sågtandschirp och brett brus anpassat till ett bands egen modulation, var och en med en centrumfrekvens, en bandbredd, en mottagen effekt (direkt, eller EIRP och avstånd via jamming-typens fritt-rymd-vägförlust) samt på- och avtider. Varje jammer poängsätts mot varje band med sin spektrala separationskoefficient kappa över mottagarens bandbredd, och (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; för en enda jammer är detta lika med anti-jam-ekvationen i jamming-typen med Q = 1/(R_c kappa), och rapporten bär den korskontrollen (och jamming-typens representativa Q-värde bredvid). Brusgolvet är k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }). Vattenfallet medelvärdesbildar varje cell över dess fack och dess rad (chirpar exakt, hela svep plus det partiella; jammers som växlar mitt i en rad enligt sin driftcykel), så att C/N0-tidslinjen och bilden kommer från samma tal; result.json innehåller rutnätet blockmedelvärdesbildat i effekt, C/N0 och J/S per band och rad, samt per jammer och band SSC, Q, J/S, J/S i bandet och stationärt C/N0. Valfritt [iq]: modellen ritad som komplext IQ vid ett ögonblick, skriven till och inläst från en SigMF-inspelning (cf32_le eller ci16_le), och jämförd med en Welch-skattning. Valfritt [recording] (inbyggda byggen): en verklig SigMF-inspelnings Welch-PSD bredvid modellen. VALIDATED: signal-PSD:erna mot läroboksvärdena för huvudlobens bredd (BPSK(n) 2n x { "1.023" } MHz nollställe till nollställe; BOC({ "1,1" })-lober centrerade vid +/-1.023 MHz) och de spektrala separationskoefficienterna mot deras slutna former enligt Parseval och Kaplan & Hegartys Q = { "1" } (CW) och { "1.5" } (anpassad). MODELLED: jammer-effekter, tidslinje, frontändens bandbredder, behandlingen med kontinuerligt spektrum (inga kodlinjer) samt frånvaron av AGC, blankning och antennmönster.

seg-ea1678eb9e84 = Diagrammet som motorn skriver för scenarios/l-band-waterfall-jamming.toml, typ spectrum

seg-f43fe94d84e0 = Kombinerad spoofing-detektor för RF och mätningar (RAIM-konsistens över flera SV + AGC + SQM, sammanfogade) mot en parametriserad attack (effektfördel, bärvågsfasjustering, tids- och positionsförskjutning; TEXBAT-liknande).

seg-268ebf4cba99 = Diagrammet som motorn skriver för scenarios/spoof-detect.toml, typ spoof-detect

seg-cbd77f6ffd63 = Stokastisk detektor för tidsspoofing (Neyman–Pearson / χ²₁) med Monte Carlo-beräknade P_fa/P_md.

seg-6f6a8c975111 = Diagrammet som motorn skriver för scenarios/spoof-attack.toml, typ spoof

seg-f6ff1c8c78db = Tracking-slingans förlust av låsning: C/N0 -> lås/olås MED HYSTERES, tiden det tar att förlora låsningen, och spoof-indragning som funktion av HASTIGHETEN i kod- och bärvågsförskjutning. Motorns befintliga kriterier för spärrning och infångning är förhållanden mellan mottagna effekter (en jammer spärrar vid J/S = { "30" } dB, en spoofer fångar in vid { "3" } dB); verklig förlust av låsning är inte ett effektförhållande, den uppstår där en slingas jitter plus dynamiska belastning lämnar dess budget för spårningströskel. Redovisar ({ "1" }) 1-sigma termisk jitter för bärvåg (Costas) och kod (icke-koherent early/late) mot C/N0, inklusive kvadreringsförlust, mot de angivna reglerna { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15-gradersregeln i tre-sigma-form) och { "3" }</em>sigma_DLL + ramplag <= d/2 chip; ({ "2" }) trösklarna för C/N0 vid tappad låsning och återlåsning med den bindande slingan angiven, där återlåsningströskeln HÄRLEDS från den bredare bandbredd som en mottagare återfångar med snarare än att påstås, så att hysteresbredden måste ligga mellan { "5" }<em>log10(ratio) och { "10" }</em>log10(ratio) dB; ({ "3" }) den deklarerade tiden till förlorad låsning från en låsdetektor med två trösklar och bekräftelsetider, driven över en C/N0-ramp, redovisad separat från den fysiska fasflyktstiden (Viterbis medeltid mellan cykelslip, i log10 s eftersom den sträcker sig över hundratals tiopotenser); ({ "4" }) gränser för spoof-indragning — den största kodglidning och bärvågs-Doppler-hastighet som en måls slingor kan följa, med en karta över båda axlarna, eftersom en spoofer som glider snabbare än så inte fångar in slingan, den springer ifrån den; och ({ "5" }) den DENIAL-RADIE som slingdynamiken innebär, redovisad TILLSAMMANS MED den befintliga effektförhållanderadien, aldrig i stället för den, med deras teckenbehäftade skillnad som ett eget namngivet fält (denial_radius_delta_km) och en definition bredvid. Varje utsänt numeriskt fält bär en enhet och en ursprungsklass. VALIDATED slutna former: uttrycken för bärvågs- och kodjitter, slingfilterreduktionen sqrt({ "2" }<em>B_n</em>T) och första ordningens ramplag kontrolleras mot motorns egen sdr-korrelator stegad framåt på seedad syntetisk IF — en annan väg till samma tal — till { "0.6" } %, { "3.7" } % respektive { "0.17" } %, och den modifierade Bessel-funktionen I0 bakom cykelslip-tiden mot vanliga tabellvärden till { "1e-7" }. Den nedre giltighetsgränsen hävdas, inte bara anges: under ~{ "32" } dB-Hz vid { "1" } ms mättas den verkliga atan-diskriminatorn mot sitt område +-pi/2 och mäter mindre jitter än någon linjär teori. MODELLED: slingbandbredderna, integrationstiden, korrelatoravståndet, förhållandet för indragningsbandbredd, bekräftelsetiderna, jammer-effekten och antennförstärkningarna är representativa bandvärden, inte ett datablad. INTE modellerade: oscillatorjitter (Allan-deviation) och vibrationsjitter, begränsning av frontändens bandbredd, flervägsutbredning, AGC-dynamik, förlust vid databitsövergångar, externt stöd och varje halvcykelskorrektion av Costas formel för cykelslip. Under slingdynamik har spoof-infångning ingen radie alls — den bindande begränsningen är förskjutningshastigheten, inte effekten — så det fältet är null med en motivering i stället för ett påhittat tal. Inte en certifierad produkt för mottagarprestanda.

seg-72182c1aecd9 = Diagrammet som motorn skriver för scenarios/tracking-loop.toml, typ tracking-loop

seg-4e31c8daf798 = Register

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-63c3a7483268 = { "6" } scenariotyper i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-f6a18b7cb172 = Källa: <c1/>

seg-d4ae70a5d619 = Jamming, spoofing och spektrumet (familj av scenariotyper)

seg-b4b8b72e060b = Ämnessidor: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Kör en: <c1/>. Alla familjer: <a4>KINDS.md</a4>.

seg-cc031b964086 = Kontaktark med diagrammen som motorn skriver för typerna i familjen Jamming, spoofing och spektrumet

seg-bbbd87f888b9 = Tracking-slingans förlust av låsning: C/N0 -> lås/olås MED HYSTERES, tiden det tar att förlora låsningen, och spoof-indragning som funktion av HASTIGHETEN i kod- och bärvågsförskjutning.

seg-e37f1e071b2c = Spektrummodell och vattenfall för L-bandet: hela GNSS L-bandet som en enda effektspektraltäthet (PSD), frekvens i sidled, tid nedåt, över en skriptad jammer-tidslinje.

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-8887d666b4fc = Testbädd för utvärdering av maskininlärd detektering av RF-störningar ({ "13494" }): generera ett märkt, parametergrundat SYNTETISKT korpus (nominell/jamming/spoof-tid/spoof-position/flervägsutbredning), poängsätt en detektor (energy/agc/s

seg-f6dcb5b36454 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>. Valfria: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-7bb2f42902f0 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>jamming</a1>.

seg-d5f06ff66e1b = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1bd760afbaca = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>spoof</a1>.

seg-fb15ecc29f7c = Obligatoriska fält: <c1/>. Valfria: <c2/>, <c3/>.

seg-15c08ee5ae76 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>spoof-detect</a1>.

seg-c65b9d45bdcc = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

seg-bd1b04ccfe22 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>tracking-loop</a1>.

seg-5024b537d000 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-a73f44c04565 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "2" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>spectrum</a1>.

seg-cbcc6f5302b8 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-d14fa8348a2a = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>impairment-eval</a1>.

seg-5242026d2998 = <s1>Föregående</s1>Tröghets- fusions- och kvantsensorer

seg-6b9b04e59491 = <s1>Nästa</s1>Navigering i låg omloppsbana
