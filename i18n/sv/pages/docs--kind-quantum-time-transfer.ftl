# docs--kind-quantum-time-transfer: translations (sv)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-c61e88721556 = Scenariotyp i motor v{ $version }, familj <a1>Klockor, tidssynkronisering och holdover</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-849c08d3ce70 = Familjesida: <a1>Klockor, tidssynkronisering och holdover</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-a3697ad561db = Hz

seg-496b17a8d3b9 = Ämnessida: <a1>QUANTUM-MODELS.md</a1>

seg-a1810bbca337 = <b>MODELLED</b> Tvåvägs/TWSTFT (Sagnac), GNSS common-view, PPP; länkjitter→avstånd. Oracle (ExternalDataset): Sagnac-storleken kontrollerad mot ett auktoritativt PUBLICERAT VÄRDE — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: ett ekvatorialt varv åt öster ackumulerar { "207.4" } ns (2ωA_E/c²); kshana återskapar { "207.386" } ns. Oberoende bekräftat av RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bär samma 2Aω/c²-geometri. Den sammansatta BIPM TWSTFT-transpondern/common-view/

seg-a8beb8dfc757 = Felbudgetering för tidsöverföring är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-bb07c8ee153f = <b>PARTNER</b> Tillhandahålls inte — endast prestandamodeller; kallatoms-/klockhårdvaran är en partners. Oracle (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Ett reproducerbart TradeEvidence-objekt (fast ram: scenario+frö+motor; gemensamma värden per kvalitetsmått för kvant mot klassisk med fördel med rätt polaritet, valfritt { "95" } %. Oberoende referens (InternalConsistency): Identiteter i sluten form för fördel/vinnare + en trogen inpackning av den befintliga quantum_trade::TradeResult; ärligheten är knuten till representativitetsregistret och verifieringsetiketterna

seg-eb75c6a4dcec = Jämförande evidens för kvant mot klassisk (gemensam form) är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-eee91dc5741d = Källa: <c1/>

seg-05060df7f0b7 = <c1/> (scenariotyp)

seg-540545e6f846 = MODELLED kedja för betrodd kvanttidssynkronisering: en heltäckande budget för tidsöverföring med kvant (optisk gitterklocka + intrasslings-/enfotonslänk) mot klassisk (CSAC + RF tvåvägs), en återanvänd skyddsnivå för tidssynkronisering + ett säkerhetskvalitetsmått för fördröjnings-/återuppspelningsattacker (1-P_md), en detektionssannolikhet för klockanomalier + CUSUM-latens, och avvägningen kvant mot klassisk som ärlig TradeEvidence med en representativitets- och gap-till-flyg-post. Illustrativa parametrar för enhet/länk från offentliga källor; modellerar klassen, inget TRL/flygerfarenhet/certifiering görs gällande.

seg-ed79bfe80fe7 = En körning av <c1/> sammanfattas som: quantum-time-transfer | quantum chain 1.233e-12s vs classical 5.292e-9s | PL { "555.24" } ns | security Pd { "1.000" } (Pfa { "1e-3" }) | anomaly Pd { "0.761" } | trade quantum wins 2/2 | MODELLED

seg-80e94491c3df = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-6b03fa15a60d = Exemplet <c1/> anger bland annat:

seg-09760f892c7b = Diagrammet som motorn skriver för scenarios/quantum-time-transfer.toml, typ quantum-time-transfer

seg-873de4d05663 = <b>VALIDATED</b> Värsta-fall-detektionslatens (⌊h/(z−k)⌋+{ "1" }) för tabulär CUSUM-detektor och genomsnittlig körlängd utanför kontroll, som används av skyddsnivån för tidssynkronisering och spoof-övervakarna. Oberoende referens (ExternalDataset): Publicerad tabulär CUSUM-ARL: Siegmunds ({ "1985" }) approximation med brownsk rörelse (Hawkins & Olwell { "1998" }, ekv. { "3.7" }) korsförankrad mot ARL-tabellerna i Montgomery, Introduction to Statistical Quality Control (Wiley) för k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministisk latens matchad exakt mot ett förstapassage-orakel. Den sammansatta TPL-gränsen förblir MODELLED

seg-b51e62b8dc63 = MODELLED kedja för betrodd kvanttidssynkronisering: en heltäckande budget för tidsöverföring med kvant (optisk gitterklocka + intrasslings-/enfotonslänk) mot klassisk (CSAC + RF tvåvägs), en återanvänd skyddsnivå för tidssynkronisering + ett säkerhetskvalitetsmått för fördröjnings-/återuppspelningsattacker (1-P_md), en detektionssannolikhet för klockanomalier + CUSUM-latens, och avvägningen kvant mot klassisk som ärlig TradeEvidence med en representativitets- och gap-till-flyg-post. (typkatalog (<c1/>))

seg-dee0faf63e7f = Betrodd kvanttidssynkronisering — heltäckande kedja för tidsöverföring, säker spridning, anomalidetektering och en avvägning kvant mot klassisk. MODELLED; illustrativa parametrar för enhet/länk från offentliga källor; modellerar klassen, inget TRL-/flygpåstående. (kommentar i scenariofilen, rad { "1" } till { "3" })

seg-6e9f5dfca6b0 = Betrodd kvanttidssynkronisering (tidsöverföring + säker spridning + anomali) är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-d3665be74ff1 = <s1>Föregående</s1>quantum-gnss-free-nav

seg-0d4b1f97541f = <s1>Nästa</s1>quantum-trade
