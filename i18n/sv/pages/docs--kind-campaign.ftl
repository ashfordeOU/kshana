# docs--kind-campaign: translations (sv)

seg-8784979d6569 = dBW

seg-68a2bcb6eedd = Källa: <c1/>

seg-24ce6aee5e53 = <c1/> (scenariotyp)

seg-931a3d27c0f0 = Scenariotyp i motor v{ $version }, familj <a1>Kampanjer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-a07990e776cb = Kampanj: befintliga scenariotyper sammansatta till en körning, där varje tal läses från en verklig körning av den namngivna typen. Fyra avsnitt, i valfri kombination. PHASES: ett kedjat uppdrag på en gemensam tidslinje -- varje fas kör ett eller flera scenarier (till exempel jamming, därefter spoofing, därefter en klocka i holdover med ett tröghetsnavigationssystem som glider bredvid, därefter ett integritetslarm, därefter återhämtning), deras utdata läses in i namngivna kanaler (klockans tidsfel mot sin gräns, förhållandet mellan bärvåg och brustäthet mot spårningsgolvet, skyddsnivån mot larmgränsen, positionsfel, spårande satelliter, larmflaggor) med en förinställning per typ eller med explicita resultatsökvägar, och samplas om till ett gemensamt rutnät med nollte ordningens hållning, med fasgränser och händelser; tillstånd förs vidare genom carry (en kanal fortsätter från föregående fas slutvärde), handoff (ett tal från en föregående fas skrivs in i den här fasens scenario) och end_at (en fas slutar vid en tidpunkt som en körning beräknat, till exempel en spoofing-monitors detektionstid). SWEEP: ett rutnät över en till tre punktseparerade scenarionycklar av valfri typ (ett heltalssegment indexerar en array av tabeller, som i system.2.sisre_m), med mått som läses via resultatsökväg och, med fler än en körning, en seedad Monte Carlo-ensemble i varje nod. MONTE_CARLO: realisering k körs vid base_seed + k; varje mått redovisar medelvärde, standardavvikelse, rangpercentiler enligt närmaste rang för 5:e/50:e/95:e percentilen och ett bootstrap-konfidensintervall på { "95" } % med fast frö för medelvärdet. COMPOSE: flera scenarier under gemensamma värden (en jammers effekt och position skrivna in i en maritim och en vägbunden mottagare), med en kombinerad sammanfattning av bästa/sämsta. Resultatet innehåller en kampanjhash, en sammanfattning över varje medlemsresultat och en enhetspost för varje utsänt tal; interoperabilitetsexporterna skriver varje medlemsscenario som har geometri som en egen filuppsättning. Sammansättningsidentiteter testas: en kampanj med en fas reproducerar den fristående körningen bit för bit, en ensemble med fast frö är bytestabil, och på en klocka med vitt frekvensbrus faller ensemblens medelvärde inom det redovisade intervallet med spridning som motsvarar sqrt(q_wf * tau). MODELLED: den additiva carry och nollte ordningens hållning är modellval, och varje fas bär etiketten för den typ som körde den.

seg-05e842f80dbb = En körning av <c1/> sammanfattas som: campaign 46aa07cb58fb | Svep av jammer-effekt: tillgänglighet och J/S mot sändeffekt | svep av <c2/>: { "13" } noder över [jammer_power] | { "13" } medlemskörningar (MODELLED)

seg-bf339fa14645 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-abd3eac6da41 = Exemplet <c1/> anger bland annat:

seg-c4f955d5f506 = tillgänglighet

seg-7bcf77278958 = { "22" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-38faa927b2bd = lin

seg-1a33a746eeee = Resultatetikett (motorns): MODELLED sammansättning av befintliga scenariotyper. Varje tal läses från en verklig körning av den namngivna typen; kedjningen (additiv carry av en kanal över en fasgräns, nollte ordningens hållning på tidslinjens rutnät, en fas som avslutas vid en beräknad tidpunkt) är ett modellval, och varje fas bär etiketten

seg-b2c7cd1f9712 = Diagrammet som motorn skriver för scenarios/campaign-sweep-jammer-power.toml, typ campaign

seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect och kampanjkörningen: en valfri [monitors]-tabell kör IQ-monitorerna på varje cell i körningens enda pass. Tester: <a1>iq_campaign.rs</a1>.

seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) och iq::campaign::report::rocs: varje cell i en kampanj med monitorer behåller, per larmtyp och kanal, maxvärdet av monitorns egen teststatistika över varje angivet händelsefönster (positivt) och över t

seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) och <c1/> på <c2/>, Python <c3/> och MCP-verktyget labfit (kampanjmappar endast inom dess arbetskatalog): läser en <c4/>-utdatamapp genom dess Tester: <a1>iq_labfit_followup.rs</a1>.

seg-f16a176dc1f8 = <b>MODELLED</b> Typen <c1/> faser: varje fas kör ett eller flera scenarier av befintliga typer genom run_toml, läser in deras utdata i namngivna kanaler (klockans tidsfel och gräns, genomsnittligt effektivt förhållande mellan bärvåg och brustäthet och spårningsgolv, v Tester: <a1>campaign_composition_reference.rs</a1>.

seg-be831b52a339 = och { "4" } till i matrisen.

seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisk J/S-länkbudget, anti-jam C/N₀, förlust av låsning per satellit. Oberoende referens (InternalConsistency): Länkbudgetekvationen för anti-jam C/N₀ korskontrollerad mot en oberoende numpy-omräkning (delar samma slutna form → InternalConsistency) plus en karakterisering av C/N₀-försämring i verkliga JammerTest-2024. { "0.30" } omgång { "2" }, blockerad (förblir MODELLED): den uppmätta C/N0-minskningen i JammerTest { "2024" } mot en länkbudgetprediktion (förhandsregistrerad 6a66994b, inom { "3" } dB) kördes inte eftersom F8.1-antennens position och pekning vid

seg-59afd80736c5 = <b>PARTNER</b> Tillhandahålls inte — Kshana modellerar signalprestanda, inte nyttolast- eller antennhårdvara. Oberoende referens (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-fa3ad6babe54 = <b>MODELLED</b> Typen <c1/> svep (en till tre punktseparerade nycklar av valfri typ, på det generiska svepets axelvärden, eventuellt en ensemble i varje nod) och monte_carlo-avs. Oberoende referens (InternalConsistency): Den slutna formen för fasslumpvandringen under vitt frekvensbrus, varians q_wf tau (NIST Technical Note { "1337" }), för statistikmaskineriet, och bytelikhet med de fristående körningarna för seedningen. Den kontrollerar ensemblens aritmetik på motorns egen klockmodell, inte en extern datamängd

seg-c15b5ac32282 = MODELLED sammansättning av befintliga scenariotyper. Varje tal läses från en verklig körning av den namngivna typen; kedjningen (additiv carry av en kanal över en fasgräns, nollte ordningens hållning på tidslinjens rutnät, en fas som avslutas vid en beräknad tidpunkt) är ett modellval, och varje fas bär etiketten för den typ som producerade den. (resultat <c1/>)

seg-9e33dcc39c27 = MODELLED: den additiva carry och nollte ordningens hållning är modellval, och varje fas bär etiketten för den typ som körde den. (typkatalog (<c1/>))

seg-adcc6ea59840 = MODELLED: som typen <c1/> är. (kommentar i scenariofilen, rad { "14" })

seg-143f3f1cc521 = Resiliens mot jamming i GNSS-nekade miljöer är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-d1c11e493795 = Parametersvep och seedade Monte Carlo-ensembler över valfri scenariotyp är MODELLED, inte validerade: kontrollerade mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-edbda7aca5b9 = Familjesida: <a1>Kampanjer</a1>

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-c4ed27a559df = Ämnessida: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-774e035da605 = <s1>Föregående</s1>body-pnt

seg-fadd92303a4d = <s1>Nästa</s1>cislunar-arc-recovery
