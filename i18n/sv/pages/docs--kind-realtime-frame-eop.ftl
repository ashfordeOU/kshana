# docs--kind-realtime-frame-eop: translations (sv)

seg-8e845ce908ee = Scenariotyp i motor v{ $version }, familj <a1>GNSS-mätningar, positionering och integritet</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-f6b7ca020692 = Familjesida: <a1>GNSS-mätningar, positionering och integritet</a1>

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-a2889fb2b42a = Ämnessida: <a1>integrations.md</a1>

seg-1ad013ffb9d1 = Källa: <c1/>

seg-54620502f0dd = <c1/> (scenariotyp)

seg-edfcb546d9de = Budget för prediktion av lunart referenssystem / jordorientering i realtid: P4 tabell { "1" } (konsistenskontrollen av ramfel — efterbearbetat ~{ "0.27" } m ↔ ~{ "0.010" } ms och realtid ~{ "15" } m ↔ ~{ "0.5" } ms, varje ramposition uttryckt som motsvarande UT1-fel via hävarmen L19 Δr = D_EM·ω⊕·ΔUT1) och tabell { "2" } (uppmätt UT1-prediktionsfel mot horisont — L18-kurvan avläst direkt ur den verkliga IERS finals2000A-serien: det slutliga golvet Bulletin A − Bulletin B och persistensprediktorns fel över flera dygn, vart och ett avbildat på en månramsposition med L19), plus L21-kvadratsummebudgeten för ramfel i realtid (EOP + efemerid + golv för realisering). VALIDATED sluten form (hävarmen L19, ω⊕ korskontrollerad mot CIO-jordrotationsvinkeln) och VALIDATED verkliga data (L18-kurvan ur de verkliga raderna i finals2000A); MODELLED är kovariansmagnituderna för banbestämning av lunara reläer och golvet för realisering av referenssystemet (representativa allokeringar) och persistensprediktorn (inte IERS operativa Bulletin A-algoritm). Ingen certifierad produkt för referenssystem i realtid.

seg-488039e4240f = En körning av <c1/> sammanfattas som: realtime-frame-eop | Table { "1" }: post-proc { "0.27" } m ({ "0.0096" } ms UT1) ↔ real-time { "14.4" } m ({ "0.514" } ms UT1) | Table { "2" }: final floor { "0.0171" } ms → 3-day { "1.6644" } ms | budget total { "20.1" } m ({ "67.0" } ns) | L19 lever arm + L18 real-data (Validated), OD cov (Modelled)

seg-66264ec78a4c = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-45a4ed476311 = Exemplet <c1/> anger bland annat:

seg-c39a26aa1f1e = bundled fixture finals2000A_20260930

seg-9ef8a2b4c144 = Resultatetikett (motorns egen): Budget för prediktion av lunart referenssystem / jordorientering i realtid. VALIDATED sluten form: hävarmen L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ korskontrollerad mot CIO-jordrotationsvinkeln. VALIDATED verkliga data: L18-prediktionsfelskurvorna för UT1 och polrörelse avlästa direkt ur den verkliga IERS finals200

seg-2721ed7727bb = Diagrammet som motorn skriver för scenarios/realtime-frame-eop.toml, typ realtime-frame-eop

seg-72a1fc2f5c90 = <b>VALIDATED</b> En tabell redovisar UT1-prediktionsfelet, polfelet från polrörelsen och deras kvadratiska kombination vid månen över en IDENTISK epokmängd per horisont, och anger de epoker som varje komponent mättes vid. Tester: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

seg-b1d90bf98ac3 = <b>VALIDATED</b> Standardvärdet vid körning för <c1/> är bibliotekets egen inbäddade kopia av ett ordagrant IERS finals2000A-utdrag (tools/finals2000A_20260930.txt: { "174" } på varandra följande dagliga rader, MJD 61224-61397, utskuret ur finals2000A.all från 2026-09-30) bär Tester: <a1>operational_eop_predictor_reference.rs</a1>.

seg-0298bd40d72f = <b>MODELLED</b> En anpassning med minsta kvadrat av bias plus ändringstakt över ett släpande fönster plus de huvudsakliga periodiska termerna — årlig, halvårlig och de två huvudsakliga zonala tidvattnen för UT1; Chandler, årlig och halvårlig för polen — extrapolerad med den sista i fönstret Tester: <a1>operational_eop_predictor_reference.rs</a1>.

seg-12efcd20ca62 = <b>VALIDATED</b> En tabell redovisar UT1-prediktionsfelet, polfelet från polrörelsen och deras kvadratiska kombination vid månen över en IDENTISK epokmängd per horisont, och anger. Oberoende referens (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) som läser IERS-produkten finals2000A med sin egen regel Bulletin-B-annars-A, och pyerfa { "2.0.1.5" } (SOFA) fulla rotationer från himmelskt till terrestriskt system (c2i06a, sp00, pom00, c2tcio; jordrotationsvinkeln enligt IERS { "2010" } ekv. { "5.15" } i exakt aritmetik), körda som separata program på ordagranna rader ur den frysta finals2000A.all från 2026-09-30; förhandsregistrerad (455b8fb5) med tillägg A1 och A2 som endast fastställer

seg-020e5919c8fd = <b>VALIDATED</b> Standardvärdet vid körning för <c1/> är bibliotekets egen inbäddade kopia av ett ordagrant IERS finals2000A-utdrag (tools/finals2000A_20260930.txt: { "174" } på varandra följande. Oberoende referens (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), som läser samma bytes med sin egen läsare, och tabellen i IERS Bulletin A Vol. XXXIX nr { "039" }, avskriven tal för tal; förhandsregistrerad (6fdae01b) med sex exakta kriterier innan astropy kördes. Alla sex håller: { "30" } slutliga, { "54" } snabba och { "90" } predicerade rader med lika MJD-listor, varje predicerad rad flagga P, räkningen vid standardkörningen lika, och prediktionerna lika med Bullet

seg-530c87bbff78 = <b>MODELLED</b> En anpassning med minsta kvadrat av bias plus ändringstakt över ett släpande fönster plus de huvudsakliga periodiska termerna — årlig, halvårlig och de två huvudsakliga zonala tidvattnen för UT1; Cha. Oberoende referens (ReferenceImpl): Tre oberoende vägar, ingen av dem en publicerad siffra för prediktionsnoggrannhet. ({ "1" }) En analytisk signal med kända koefficienter — det enda sättet att pröva den periodiska maskineriet, eftersom ingen incheckad serie är tillräckligt lång för att rymma en årlig term. ({ "2" }) Den läroboksmässiga lösningen med minsta kvadrat i sluten form, annan algebra än matrislösningen som testas, på verkliga rader. ({ "3" }) De genuina arkiverade prediktionsraderna ur Bulletin A som

seg-a233df86be95 = Budget för prediktion av lunart referenssystem / jordorientering i realtid. VALIDATED sluten form: hävarmen L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ korskontrollerad mot CIO-jordrotationsvinkeln. VALIDATED verkliga data: L18-prediktionsfelskurvorna för UT1 och polrörelse avlästa direkt ur den verkliga IERS finals2000A-serien (Bulletin A snabb mot Bulletin B slutlig, och persistens över flera dygn över de verkliga dagliga raderna). DERIVED: ramen (resultat <c1/>)

seg-60e7ee7e6e3e = VALIDATED sluten form (hävarmen L19, ω⊕ korskontrollerad mot CIO-jordrotationsvinkeln) och VALIDATED verkliga data (L18-kurvan ur de verkliga raderna i finals2000A); MODELLED är kovariansmagnituderna för banbestämning av lunara reläer och golvet för realisering av referenssystemet (representativa allokeringar) och persistensprediktorn (inte IERS operativa Bulletin A-algoritm). (typkatalog (<c1/>))

seg-ddf4702f78e5 = Ärlighet: VALIDATED sluten form (hävarmen L19, omega_earth korskontrollerad mot CIO-jordrotationsvinkeln) och VALIDATED verkliga data (L18-kurvorna för UT1 och polrörelse ur de verkliga raderna i finals2000A). DERIVED golv för realisering av referenssystemet (Helmert-resten efter anpassning). MODELLED är kovariansmagnituderna för banbestämning av lunara reläer ({ "0.27" } m efterbearbetat, ~{ "14.4" } m i realtid vid en timmes latens — en avrundad, inte baklänges lösta, all (kommentar i scenariofilen, rad { "27" } till { "32" })

seg-bc51b666d070 = Prediktionsfel för jordorientering i operativ stil, uppmätt predicerat mot slutligt är MODELLED, inte validerat: kontrollerat mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte extern auktoritativt. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-653fad5e0afe = <s1>Föregående</s1>quantum-trade

seg-5abe534d4ef1 = <s1>Nästa</s1>reentry
