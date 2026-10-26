# docs--kind-time-transfer-budget: translations (sv)

seg-f42465f7d066 = ns

seg-dfe78b9d0811 = GHz

seg-cd04f5662884 = MODELLED. (typkatalog (<c1/>))

seg-c61e88721556 = Scenariotyp i motor v{ $version }, familj <a1>Klockor, tidssynkronisering och holdover</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-849c08d3ce70 = Familjesida: <a1>Klockor, tidssynkronisering och holdover</a1>

seg-937ebbbd612c = Källa: <c1/>

seg-6af6f07f5f5a = <c1/> (scenariotyp)

seg-9a2bb9809aed = Tvåvägs tids- och frekvensöverföring via satellit mellan två stationer genom ett geostationärt relä: tvåvägsekvationen löst för T_A - T_B med varje icke-reciprok term (stationsutrustningens fördröjningar, Ku-bandets jonosfär, transponder, Sagnac), en osäkerhetsbudget i kvadratur vars typ A-term är den simulerade länkens TDEV vid medelvärdesbildningstiden, en simulerad länk med vitt brus och flimmerbrus i fas samt en dygnsvarierande icke-reciprocitet, och stabiliteten (hastighet, residual-RMS, TDEV, ADEV) hos en medföljande BIPM Circular T Section { "1" }-serie, MJD,ns-CSV eller IGS RINEX-stationsklockposter. MODELLED.

seg-a4f8e9a09026 = En körning av <c1/> sammanfattas som: time-transfer-budget: europe - north-america förskjutning { "12.500" } ns (Sagnac { "204.365" } ns, jonosfär { "0.0213" } ns); kombinerad u { "1.087" } ns (typ A { "0.031" } ns vid { "86400" } s); { "0" } verkliga serier (MODELLED)

seg-0353d795ebdf = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-fe3afa366df2 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-00026a1d3760 = Exemplet <c1/> anger bland annat:

seg-2409cc9397c7 = Resultatetikett (motorns egen): MODELLED — TWSTFT:s tvåvägsekvation (stationsfördröjningar, Ku-bandets jonosfär, transponder, Sagnac) löst utifrån angivna fördröjningar, en osäkerhetsbudget i kvadratur med den simulerade länkens TDEV som typ A-term, en simulerad länk med flimmerbrus i fas och dygnsvarierande icke-reciprocitet, samt stabiliteten hos valfri r

seg-92d3c84024d7 = Diagrammet som motorn skriver för scenarios/time-transfer-budget.toml, typ time-transfer-budget

seg-83b9c66b9e92 = <b>MODELLED</b> TWSTFT:s tvåvägsekvation löst för T_A - T_B med stationernas sänd- och mottagningsfördröjningar, Ku-bandets jonosfäriska asymmetri mellan upp- och nerlänk, skillnaden i transponderfördröjning och Sagnac-termerna, mot dess exakta framåtmodell; en osäkerhetsbudget i kvadratur

seg-58cf4086c7a5 = <b>MODELLED</b> TWSTFT:s tvåvägsekvation löst för T_A - T_B med stationernas sänd- och mottagningsfördröjningar, Ku-bandets jonosfäriska asymmetri mellan upp- och nerlänk, skillnaden i transponderfördröjning. Oberoende referens (InternalConsistency): Intern konsistens: framåtmodellen och den lösta ekvationen stämmer överens inom { "1e-15" } s, Sagnac-termen är lika med modulens oberoende BIPM-slingform 2A omega/c^{ "2" }, den jonosfäriska termen är { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, och brusprocesserna visar sina förväntade TDEV-former. VAD SOM INTE ÄR: ingen verklig TWSTFT-mätning eller kalibreringsrapport har jämförts; de angivna fördröjningarna och osäkerheterna är indata, inte uppmätta; t

seg-15de1cdaa684 = MODELLED — TWSTFT:s tvåvägsekvation (stationsfördröjningar, Ku-bandets jonosfär, transponder, Sagnac) löst utifrån angivna fördröjningar, en osäkerhetsbudget i kvadratur med den simulerade länkens TDEV som typ A-term, en simulerad länk med flimmerbrus i fas och dygnsvarierande icke-reciprocitet, samt stabiliteten hos valfri verklig UTC-UTC(k)- eller stationsklockserie som tillhandahålls; inte jämförd med en verklig TWSTFT-länk (resultat <c1/>)

seg-70448ca49780 = Tvåvägs tids- och frekvensöverföring via satellit (TWSTFT) mellan två ILLUSTRATIVE stationer, en i centrala Europa och en i östra Nordamerika, genom ett geostationärt relä vid { "10" } grader V. Körningen löser tvåvägsekvationen för T_A - T_B utifrån de angivna termerna för utrustning, transponder, jonosfär (Ku-band, 14/11 GHz) och Sagnac. Den bildar en osäkerhetsbudget vars statistiska term är TDEV, vid en dag, hos en simula (kommentar i scenariofilen, rad { "1" } till { "8" })

seg-4b0d23aed0ab = TWSTFT:s tvåvägsekvation, osäkerhetsbudget och länkstabilitet med flimmerbrus och dygnsvarierande icke-reciprocitet är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-52e06909ccc5 = <s1>Föregående</s1>terrain-slam

seg-a22fa1c51042 = <s1>Nästa</s1>timetransfer
