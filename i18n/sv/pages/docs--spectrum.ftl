# docs--spectrum: translations (sv)

seg-6cb7a787ac67 = Referenser

seg-cbf0f9bcd2d8 = Oberoende referens

seg-6e0cb6acc073 = VALIDATED

seg-33f4c7af9c53 = Bärvåg

seg-c5ce76c91ff7 = Etikett

seg-a86ce24d81de = Band

seg-ea152d84aabc = { "465" } MHz

seg-278d0b375f6f = { "20.46" } MHz

seg-39e207bee75b = { "2492.028" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-72f051e2d7e1 = Signal

seg-47408d30d095 = Nominell C/N₀

seg-995748f9c74c = { "49.41" } dB-Hz

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-0f47178201ca = { "49.23" } dB-Hz

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-53a7343c076e = Påstående

seg-430edd66bda0 = Inte modellerat

seg-64509c048541 = Vad som modelleras

seg-f07519ff8071 = Källa: <c1/>

seg-901c3e032de7 = Spektrummodell och vattenfallsdiagram

seg-eac92092dd34 = Scenariotypen <c1/> bygger GNSS-L-bandet (Global Navigation Satellite System), och varje annat band som en utformad signal upptar (ultrahög frekvens (UHF), S-band, C-band), som en enda spektral effekttäthet (PSD), låter den ändras över en skriptad jammer-tidslinje och reducerar den till det som en spårningsslinga bryr sig om: jammer-till-signal-förhållandet (J/S) och det effektiva förhållandet mellan bärvåg och brustäthet (C/N₀) för varje band. Den ritar resultatet som ett vattenfallsdiagram (frekvens tvärs, tid nedåt, färg för effekt) bredvid C/N₀-staplar per band, och den läser och skriver inspelningar i Signal Metadata Format (SigMF) så att en verklig inspelning kan skattas och ritas bredvid modellen.

seg-0007b6ba97ca = Skriv det medföljande exemplet till en fil och kör det:

seg-5e205b189b26 = I en utcheckning kör <c1/> samma fil.

seg-261deb22b4fa = Kod: <c1/> (modellen, typen, Welch-skattaren), <c2/> (inspelningskodeken), <c3/> (spektra med enhetsarea för signaler och spektralseparationskoefficienten) och <c4/> (förinställningarna för signalutformning som ett band kan namnge).

seg-bb1153873209 = Modulation

seg-9758b36b554c = Standardvärde för mottagen effekt

seg-a1a68286b809 = Standardvärde för mottagarbandbredd

seg-27a2cdc8183f = { "1575.42" } MHz

seg-66a103496266 = binär fasskiftsmodulation, BPSK({ "1" })

seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

seg-50112ba8867d = { "2.046" } MHz

seg-b7755cb9a384 = multiplexad binär offsetbärvåg, MBOC(6,1,1/11), eller binär offsetbärvåg BOC({ "1,1" })

seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-6dc5e3668a78 = { "14.322" } MHz

seg-f03380403a2a = { "1227.60" } MHz

seg-06c245582533 = BPSK({ "1" }) (CM- och CL-koder tidsmultiplexade)

seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

seg-1982a811e1ef = { "1176.45" } MHz

seg-dd074e33242e = BPSK({ "10" })

seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A är grov-/förvärvskoden; L2C är den civila L2-signalen; IS-GPS-200 och IS-GPS-705 är GPS-gränssnittsspecifikationerna; Galileo OS SIS ICD är Galileos Open Service Signal-in-Space Interface Control Document. De mottagna effekterna är specifikationernas minimivärden; bandbredderna är modelleringsval. Båda kan åsidosättas per band. Utan en tabell <c1/> använder körningen dessa fem. GLONASS G1/G2, BeiDou B1/B2 och Galileo E6 finns <b>inte</b> bland de namngivna banden.

seg-79cc2ed8195b = En post <c1/> har en av tre former:

seg-67d0591c69d8 = ett namn från tabellen ovan, med valfria <c1/>, <c2/> och, för <c3/>, <c4/>;

seg-8596194c81f2 = <c1/>: en LEO-signal (låg jordbana) eller en representativ signalutformning från förinställningsbiblioteket i typen <c2/> (<a1>LEO-SIGNAL.md</a1>), i vilket band som helst, ritad med varje komponent (förvärv, data, pilot, frekvensdelningsunderbärvågor) och bandbegränsad till sin sändningsbandbredd; C/N₀ och J/S avser den spårade komponenten, och <c3/> märker den bara. Förinställningarna är <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> och <c15/>;

seg-2ca46a7f2949 = ett eget band: vilken <c1/> som helst med <c2/>, <c3/> (<c4/>, <c5/> eller <c6/>) och <c7/>.

seg-fcb0f9fcffbf = Jammers (<c1/>) tar en <c2/>:

seg-457e5e95c677 = <c1/> — en kontinuerlig tonvåg (CW) vid <c2/>;

seg-3120ac4f6710 = <c1/> — platt brus över <c2/>;

seg-7d975838a2e6 = <c1/> — platt brus över en bred <c2/> (en barrage-jammer): samma täthet som <c3/>, namngiven separat eftersom typen <c4/> poängsätter den som bredbandig;

seg-d13b177946d2 = <c1/> — ett linjärt sågtandssvep på <c2/> varje <c3/>;

seg-675fb74a89e4 = <c1/> — bredbandigt brus vars spektrum är den egna modulationen för bandet <c2/>.

seg-64d7a14a198e = Var och en anger antingen <c1/>, eller en effektiv isotropiskt utstrålad effekt <c2/> med ett <c3/> (och eventuellt <c4/>), som går genom frisiktsdämpningen i typen <c5/>. <c6/> och <c7/> skriptar tidslinjen.

seg-8e718c09f7d8 = Mottagaren (<c1/>) anger brusgolvet, <c2/> med <c3/> för antenntemperatur <c4/> och brustal <c5/>, och spårningströskeln.

seg-9b8078bd0df3 = Huvudvattenfallsdiagrammet täcker <c1/> (standard { "1160" } till { "1590" } MHz i { "430" } fack). Varje post <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, standard { "200" } fack) lägger till ytterligare ett vattenfallsdiagram över sitt eget frekvensområde på samma tidslinje, för ett spektrum som spänner över flera band.

seg-a550e89c2907 = Störningskedjan

seg-12a2c08191c0 = För en signal med enhetsareaspektrum <c1/> och en jammer med enhetseffektspektrum <c2/> är spektralseparationskoefficienten (SSC) över mottagarbandet <c3/> <c4/>, och den effektiva bärvågs-till-brustätheten med flera jammers är

seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3:e uppl., §{ "9.4" }). För en jammer är detta exakt anti-jam-ekvationen i typen <c1/> med <c2/>; rapportens block <c3/> kör de egna funktionerna i typen <c4/> på samma länkindata och skriver ut skillnaden, som är noll upp till avrundning.

seg-c11d0cb8e670 = Rapporten skriver också ut det C/N₀ som typen <c1/> ger med sin Q-tabell. Tabellen innehåller läroboksvärdena, fastlåsta i testerna mot de slutna formerna:

seg-5c21df11e35b = <b>CW och smalband: <c1/>.</b> En CW-ton på C/A-bärvågen har <c2/>, så <c3/>, och tabellen och spektra stämmer överens. I det medföljande exemplet ger tonen { "17.98" } dB-Hz från båda (tabellen gav { "19.74" } när den innehöll { "1.5" }).

seg-647e209b1efc = <b>Bredband och svept: <c1/>, sedan { "0.36" }.</b> Det är vitt brus över huvudloben med signaleffekten i bandet normaliserad till ett, <c2/>. Tabellen innehöll { "1" } till { "0.36" }, cirka { "3" } dB pessimistisk (<c3/>).

seg-cd03b9c900e1 = Spektrummodellen härleder sina egna värden ur spektra:

seg-b1327e66260b = <c1/> för brus matchat mot C/A (<c2/>);

seg-45b2cf032a11 = <c1/> för platt brus från nollställe till nollställe utan normaliseringen (<c2/>).

seg-6c2187f0e32b = Så för dessa jammers skiljer sig de två utskrivna C/N₀-värdena fortfarande åt, med avsikt.

seg-73dfbeabcac2 = Varje cell i vattenfallsdiagrammet är PSD:n medelvärdesbildad över sitt frekvensfack och sin rad. Ett chirp medelvärdesbildas exakt över raden, hela svep plus det partiella; en jammer som slås på eller av mitt i en rad viktas efter sin driftcykel. C/N₀-tidslinjen använder samma medelvärden, så bilden och siffrorna stämmer överens. Per band redovisar tidslinjen J/S i bandet (jammereffekt inom mottagarbandbredden över signaleffekten). Per jammer och band anger rapporten SSC, <c1/>, total J/S, J/S i bandet och det stationära C/N₀.

seg-2c214a0a30be = Det medföljande exemplet

seg-4adc00a3ca10 = <c1/>: en tidslinje på { "60" } s, en rad per sekund, en antenn på { "290" } K och ett brustal på { "2" } dB (golv −{ "201.98" } dBW/Hz).

seg-94d1cebc134d = { "10" } s till { "40" } s: ett chirp på { "16" } MHz kring L1, svep på { "9" } µs, { "50" } mW på { "100" } m.

seg-b85319af4f85 = Från { "30" } s: en CW-ton på L1-bärvågen, { "10" } mW på { "1" } km.

seg-21e2b4e76832 = Från { "45" } s: platt brus på { "2" } MHz på L2 mottaget vid −{ "135" } dBW.

seg-45dd378c692c = Vad körningen beräknar:

seg-eecd7d7530bf = Lägsta C/N₀

seg-1ead35e1aad5 = Första förlust

seg-bfb55a322ece = Rader med spårning

seg-863ea3f1fbe9 = { "3.23" } dB-Hz

seg-9aa0239a3a0c = { "10" } s

seg-9979940d2359 = { "44.73" } dB-Hz

seg-25364ef39455 = { "4.44" } dB-Hz

seg-c8d0bc71cccd = { "41.98" } dB-Hz

seg-c945914c444c = { "36.86" } dB-Hz

seg-9ff066fb53a6 = aldrig

seg-63d4f00f622d = { "44.08" } dB-Hz

seg-58b097691919 = CW-tonen är orsaken till att de två L1-signalerna skiljs åt vid { "40" } s. Den hamnar på toppen av C/A-spektrumet och håller C/A på { "17.98" } dB-Hz, under tröskeln på { "25" } dB-Hz. Den hamnar i nollstället i MBOC-spektrumet, så Galileo E1 återgår till sitt nominella C/N₀ när chirpet upphör.

seg-064579d5fbac = Signalerna själva ligger cirka { "20" } dB under brusgolvet, så vattenfallsdiagrammet visar golvet och jammers; C/N₀-staplarna visar vad avspridningen återvinner.

seg-023a7f163106 = Samma jammers driver ett kedjat uppdrag i <c1/> (se <a1>CAMPAIGNS.md</a1>): klockan går i holdover medan chirpet är på, och mottagaren faller tillbaka på Galileo E1 under CW-tonen.

seg-6b0edbfca134 = Bortom L-bandet

seg-63d1fd8043ed = <c1/> placerar signaler för LEO-positionering, navigering och tidssynkronisering (PNT) i fyra band bredvid GPS L1 C/A och Galileo E5a, varje band med sin egen jammer, på en tidslinje på { "60" } s. Vattenfallsdiagrammet <c2/> är L-bandet; tre <c3/> lägger till UHF ({ "455" } till { "475" } MHz), S ({ "2482" } till { "2502" } MHz) och C ({ "5005" } till { "5035" } MHz).

seg-6818247b5863 = { "10" } s: en CW-ton vid UHF-bärvågen, mottagen vid −{ "120" } dBW.

seg-02de8390de31 = { "20" } s: chirpet från L-bandsexemplet ({ "16" } MHz kring L1, svep på { "9" } µs, { "50" } mW på { "100" } m).

seg-47e55dfd4e0d = { "30" } s: bredbandsbrus, { "40" } MHz kring { "1185" } MHz, −{ "118" } dBW.

seg-dfa416032770 = { "40" } s: smalbandsbrus, { "2" } MHz vid S-bärvågen, −{ "128" } dBW.

seg-1d119727a749 = { "50" } s: brus matchat mot C-bandssignalens eget spektrum, −{ "124" } dBW.

seg-abacb60b16a3 = Vad körningen beräknar (C/N₀ för de utformade signalerna är det för den spårade komponenten, så det nominella värdet ligger under den totala mottagna effekten med den spårade andelen):

seg-1c921b6299e4 = representativ, BPSK({ "5" }), −{ "150" } dBW

seg-5331cde832fb = { "34.38" } dB-Hz

seg-35588b19fd72 = specifikationens minimum

seg-7d3639369444 = { "3.38" } dB-Hz

seg-9eef1ec7858f = { "38.51" } dB-Hz

seg-c6743d980e6b = publicerad utformning, −{ "144.9" } dBW

seg-245bf7d080b3 = { "1190.51625" } MHz

seg-f2aed7e062bf = { "46.29" } dB-Hz

seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

seg-a6f2bb955ca2 = representativ, BPSK({ "10" }), −{ "152" } dBW

seg-b9312cc881d2 = { "40.35" } dB-Hz

seg-03bb124d45d2 = Bara chirpet tar bort en signal (GPS L1 C/A, från { "20" } s). Varje annan jammer försämrar bara det band som dess spektrum når: det C-bandsmatchade bruset har till exempel en SSC på −{ "71.87" } dB/Hz med C-bandssignalen och under −{ "133" } dB/Hz med varje annat band.

seg-a8bea652a85d = Samma maskineri driver LEO-PNT-resiliensscenarierna (<a1>LEO-PNT.md</a1>):

seg-cf7bc2f52cad = <c1/> stegar en barrage-jammer på { "40" } MHz vid { "1185" } MHz upp { "5" } dB var { "10" } s från −{ "125" } dBW. GPS L5 förloras vid steget −{ "105" } dBW, Galileo E5a vid −{ "100" } dBW och Xona X5 vid −{ "95" } dBW, medan en representativ LEO-L-bandssignal mottagen vid −{ "135" } dBW fortfarande spåras vid −{ "90" } dBW: mottagen effekt köper J/S-marginal dB för dB.

seg-94b65c0e6087 = <c1/> är en kampanjsvepning av en körning <c2/> över effekten hos en barrage i L5-bandet (<a1>CAMPAIGNS.md</a1>).

seg-67279a0780e4 = <c1/> är en kedjad kampanj vars faser läser GNSS- och LEO-C/N₀ från körningar <c2/>, med paneler för S- och C-band.

seg-42b00ae14ffe = IQ, SigMF och Welch

seg-3418c31c4318 = <c1/> ritar modellen vid ett ögonblick som komplexa IQ-sampel (in-phase och quadrature), skriver dem som en SigMF-inspelning (<c2/> eller <c3/>), läser tillbaka inspelningen och skattar dess PSD med Welchs metod (Hann-fönster, { "50" } % överlapp, medelvärdesbildade periodogram, densitetsskalade). Termiskt brus, signaler och brusliknande jammers ritas fack för fack ur modellens egen täthet; en ton och ett chirp ritas som verkliga vågformer. Med enbart brusliknande jammers ligger Welch-skattningen inom { "0.1" } dB från modellen (median). Ett periodiskt chirp är ett linjespektrum vid sin svepfrekvens, med rippel och svansar bortom sina bandkanter som den släta modellen utelämnar: i det medföljande exemplet stämmer totaleffekten inom { "0.02" } % och medianfacket skiljer sig med { "0.5" } dB. Ögonblicksbilden är en fil som skrivs för analys; ingenting sänds och ingen radiohårdvara styrs.

seg-a3b0a61b5efe = <c1/> (endast nativa byggen) läser en verklig SigMF-inspelning från <c2/> (datafilen får som standard samma filstam med <c3/>), skattar dess PSD och skriver ut den bredvid modellen vid inspelningens frekvenser. En SigMF-fil har ingen absolut effektkalibrering, så rapporten anger medianoffseten och formen, inte en nivå.

seg-04b08e06811d = I WebAssembly-bygget är filläsning inte tillgänglig; <c1/> och <c2/> fungerar på byte som sidan tillhandahåller.

seg-69b384afe05d = Signal-PSD:er och SSC:er

seg-a65b87c51f05 = BPSK(n) huvudlob 2n × { "1.023" } MHz nollställe till nollställe; lober för BOC({ "1,1" }) centrerade vid ±{ "1.023" } MHz (Betz { "2001" }); SSC:er −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz för C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) från deras slutna Parseval-former, värdena bakom de publicerade −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) och { "1.5" } (matchat) (Kaplan & Hegarty §{ "9.4" }); tabellposterna i typen <c1/> är lika med de slutna formerna: CW och smalband Q = { "1" }, bredband och svept Q = { "2" } (vitt brus över huvudloben, effekt i bandet normaliserad; { "1" } till { "0.36" })

seg-d2afc6e05969 = Vattenfallsdiagram, J/S och C/N₀-tidslinje

seg-c44413d5a060 = Reduceras exakt till kedjan i typen <c1/>; jammereffekterna, tidslinjen och bandbredderna är indata

seg-304f4aeaf4cb = SigMF-kodek och Welch-skattning

seg-7a642dd02e5c = Rundturer, en direkt diskret Fouriertransform, identiteter för vitt brus och Parseval; ingen tredjepartsinspelning finns i repot

seg-1138c9e62a21 = Vattenfallsdiagram för flera band med utformade signaler och jammers per band

seg-ac38681004e9 = Reduceras till L-bandskedjan (ett band med en enda komponent ger samma siffror som före utvidgningen) och till de validerade signalspektra; de utformade signalerna, jammers och bandbredderna är indata

seg-0c0c625a8ff5 = En rättelse av en vanlig förkortning: loberna i spektrumet för BOC({ "1,1" }) är <em>centrerade</em> vid ±{ "1.023" } MHz (mellan bärvågsnollstället och nollstället vid { "2.046" } MHz), men PSD:ns maximum ligger vid ±{ "0.759" } MHz, där <c1/> med <c2/>. Testerna fastlåser båda.

seg-6ab6e241f7e5 = Linjestruktur hos spridningskoden (linjerna på { "1" } kHz i C/A): en ton poängsätts mot den släta envelopen, inte mot den närmaste kodlinjen.

seg-4be08100a707 = Automatisk förstärkningsreglering, kvantisering, pulsblankning och notchfiltrering.

seg-0f195ea4126e = Mottagarantennens mönster mot jammern utöver ett förstärkningsvärde.

seg-d3d03da9c962 = Fleråtkomststörning mellan satelliter i ett och samma band.

seg-db5c7566f49e = En utformad signals emissioner utanför sin sändningsbandbredd: dess spektrum trunkeras där, så ingen emission utanför bandet når ett angränsande band.

seg-9cbea7151036 = Ett chirps inverkan på slingan vid svepfrekvenser jämförbara med slingbandbredden: dess C/N₀ använder det radmedelvärdesbildade spektrumet.

seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

seg-e2225151c10b = E. D. Kaplan and C. J. Hegarty (eds.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3rd ed., Artech House, { "2017" }, §{ "9.4" }.

seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C," <em>Inside GNSS</em>, May/June { "2006" }.

seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra," <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

seg-d28b74d8c755 = SigMF-specifikation, <a1>https://sigmf.org/</a1> (källa: <a2>https://github.com/sigmf/SigMF</a2>).

seg-a9b968473b2a = <s1>Föregående</s1>Integritet och säkerhet

seg-d5264da8bf65 = <s1>Nästa</s1>ARAIM-referens
