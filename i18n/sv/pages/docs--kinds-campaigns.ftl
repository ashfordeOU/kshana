# docs--kinds-campaigns: translations (sv)

seg-b03d56f501c3 = Typ

seg-a07990e776cb = Kampanj: befintliga scenariotyper sammansatta till en körning, där varje tal läses från en verklig körning av den namngivna typen. Fyra avsnitt, i valfri kombination. PHASES: ett kedjat uppdrag på en gemensam tidslinje -- varje fas kör ett eller flera scenarier (till exempel jamming, därefter spoofing, därefter en klocka i holdover med ett tröghetsnavigationssystem som glider bredvid, därefter ett integritetslarm, därefter återhämtning), deras utdata läses in i namngivna kanaler (klockans tidsfel mot sin gräns, förhållandet mellan bärvåg och brustäthet mot spårningsgolvet, skyddsnivån mot larmgränsen, positionsfel, spårande satelliter, larmflaggor) med en förinställning per typ eller med explicita resultatsökvägar, och samplas om till ett gemensamt rutnät med nollte ordningens hållning, med fasgränser och händelser; tillstånd förs vidare genom carry (en kanal fortsätter från föregående fas slutvärde), handoff (ett tal från en föregående fas skrivs in i den här fasens scenario) och end_at (en fas slutar vid en tidpunkt som en körning beräknat, till exempel en spoofing-monitors detektionstid). SWEEP: ett rutnät över en till tre punktseparerade scenarionycklar av valfri typ (ett heltalssegment indexerar en array av tabeller, som i system.2.sisre_m), med mått som läses via resultatsökväg och, med fler än en körning, en seedad Monte Carlo-ensemble i varje nod. MONTE_CARLO: realisering k körs vid base_seed + k; varje mått redovisar medelvärde, standardavvikelse, rangpercentiler enligt närmaste rang för 5:e/50:e/95:e percentilen och ett bootstrap-konfidensintervall på { "95" } % med fast frö för medelvärdet. COMPOSE: flera scenarier under gemensamma värden (en jammers effekt och position skrivna in i en maritim och en vägbunden mottagare), med en kombinerad sammanfattning av bästa/sämsta. Resultatet innehåller en kampanjhash, en sammanfattning över varje medlemsresultat och en enhetspost för varje utsänt tal; interoperabilitetsexporterna skriver varje medlemsscenario som har geometri som en egen filuppsättning. Sammansättningsidentiteter testas: en kampanj med en fas reproducerar den fristående körningen bit för bit, en ensemble med fast frö är bytestabil, och på en klocka med vitt frekvensbrus faller ensemblens medelvärde inom det redovisade intervallet med spridning som motsvarar sqrt(q_wf * tau). MODELLED: den additiva carry och nollte ordningens hållning är modellval, och varje fas bär etiketten för den typ som körde den.

seg-b2c7cd1f9712 = Diagrammet som motorn skriver för scenarios/campaign-sweep-jammer-power.toml, typ campaign

seg-ea93f81fa08b = Källa: <c1/>

seg-7f8e8af56bc0 = Kampanjer (familj av scenariotyper)

seg-c8012ee549ea = { "1" } scenariotyp i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-09ed7c4e175c = Ämnessidor: <a1>CAMPAIGNS</a1>. Kör en: <c1/>. Alla familjer: <a2>KINDS.md</a2>.

seg-b49ec180e810 = Kontaktark med diagrammen som motorn skriver för typerna i familjen Kampanjer

seg-4e31c8daf798 = Register

seg-b2016159c9d0 = Kampanj: befintliga scenariotyper sammansatta till en körning, där varje tal är läst ur en verklig körning av den namngivna typen.

seg-25148644a262 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-e0334a6899b6 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>campaign</a1>.

seg-906f63ffbc30 = <s1>Föregående</s1>Uppförandekod

seg-cdf23ced49bd = <s1>Nästa</s1>Klockor tidssynkronisering och holdover
