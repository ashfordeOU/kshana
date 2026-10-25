# docs--kind-link-budget: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-a3697ad561db = Hz

seg-cec5c06d38af = <b>MODELLED</b> Månnativ störsignal-till-signal-kvot, effektiv C/N₀ och förlust av låsning för en selenografisk ytanvändare under en störsändare på månytan (eller upphöjd), över den illustrativa konstellationen av Moonlight/LCNS-klass från offentliga källor.

seg-120fcc840b87 = Källa: <c1/>

seg-738aa7d45efb = <c1/> (scenariotyp)

seg-953188c11165 = Enkelriktad länkbudget enligt länkekvationen i CCSDS { "401" } / DSN 810-005: fri rymdförlust, C/N₀, Eb/N₀, marginal och slutning för en sändar-EIRP, mottagar-G/T, avstånd, datatakt och band (s|x|ka) mot ett erforderligt Eb/N₀. En deterministisk teknisk beräkning utifrån de angivna indata (inte ett kalibrerat datablad för en terminal).

seg-6697c741d09c = En körning av <c1/> sammanfattas som: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, marginal { "92.1" } dB (sluter)

seg-2305502051b6 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-588476f4ae75 = Exemplet <c1/> anger bland annat:

seg-ebb923e1a3b5 = Resultatetikett (motorns egen): Enkelriktad länkbudget enligt länkekvationen i CCSDS { "401" } / DSN 810-005 (EIRP − FSPL − L_other + G/T − k); en deterministisk teknisk beräkning utifrån de angivna indata, INTE ett kalibrerat datablad för en terminal

seg-bd375631bc7e = Diagrammet som motorn skriver för scenarios/link-budget.toml, typ link-budget

seg-4f92669c3946 = <b>VALIDATED</b> Fri rymdförlust, C/N₀, Eb/N₀, marginal och slutning enligt länkekvationen i CCSDS { "401" } / DSN 810-005 för EIRP/G·T/avstånd/takt/band mot ett erforderligt Eb/N₀. Tester: <a1>one_way_link_budget_reference.rs</a1>.

seg-bfaeb6f1cc5a = <b>VALIDATED</b> Fri rymdförlust, C/N₀, Eb/N₀, marginal och slutning enligt länkekvationen i CCSDS { "401" } / DSN 810-005 för EIRP/G·T/avstånd/takt/band mot ett erforderligt Eb/N₀. Körn. Oberoende referens (ExternalDataset): Publicerad designkontrolltabell för telekommunikation i djuprymden som fastlagda numeriska vektorer: DESCANSO / J. H. Yuen (red.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tabell 1-1 (Galileo X-band) — kshana sätter ihop tabellens delposter på nytt och återger dess publicerade L_fs från början till slut { "290.54" } dB och Pr/N0 { "54.6" } dB-Hz; fri rymdförlust kontrolleras också mot ITU-R P.525

seg-2598c2360113 = <b>MODELLED</b> Länkbudgetrapporten anger varje absolut konstant som dess egen marginal beräknades utifrån -- den bärvågsfrekvens som den fria rymdförlusten använde, EIRP, siffran o. Oberoende referens (InternalConsistency): Ingen extern oberoende referens: det här är självbeskrivning över en ekvation som redan validerats mot en publicerad designkontrolltabell (se raden om enkelriktad länkbudget). Den registreras eftersom avsaknaden av den var ett uppmätt fel -- för att återskapa den släppta d1_rate_gain_beamwidth.csv krävdes att en effektiv konstant baklängeslöstes till { "0.0034" } dB utifrån alla trettio rader, och motorn både namnger nu den kombinationen och bevisar, genom test

seg-c779823e860c = Valfritt: mottagarsystemets brustemperatur (K). Den är INTE en indata till länkekvationen -- den behöver bara kvoten G/T -- men genom att ange den kan rapporten också ange den mottagarantennförstärkning som kvalitetsmåttet innebär (G = G/T + { "10" }*log10(T_sys)). Utelämnad saknas uppdelningen av förstärkningen i rapporten i stället för att antas. tsys_k = { "300.0" } (kommentar i scenariofilen, rad { "21" } till { "25" })

seg-d717412c4f06 = Självbeskrivningen i länkbudgetrapporten är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-ffbc9de75306 = <s1>Föregående</s1>leo-signal

seg-59d4cb995cb9 = <s1>Nästa</s1>lunar-attack-surface
