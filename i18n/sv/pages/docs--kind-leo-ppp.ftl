# docs--kind-leo-ppp: translations (sv)

seg-37d29d8303fe = km

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Ämnessida: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariotyp i motorn v{ $version }, familj <a1>Navigering i låg omloppsbana</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-c5478f572d21 = Familjesida: <a1>Navigering i låg omloppsbana</a1>

seg-8f0aab32310b = Källa: <c1/>

seg-c9852d3b79c8 = <c1/> (scenariotyp)

seg-32a570f1a4fa = Konvergens för exakt punktpositionering (PPP) med enbart GNSS och med LEO-förstärkning: ett flytande utökat Kalmanfilter på jonosfärsfri kod och bärvågsfas med statiska stationskoordinater, en vit mottagarklocka, en intersystemförskjutning per extra system, en zenitvåt fördröjning som följer en slumpvandring och avbildas med 1/sin(elevation) samt en flytande heltalsosäkerhet per satellitbåge; det exakta ban- och klockfelet är vitt och gemensamt för en satellits kod och fas, så varje satellit är en korrelerad uppdatering i två rader i Joseph-stabiliserad form. Mätningarna simuleras från samma modell med brus från ett frö över flera platser och frön, och varje fall (först enbart GNSS, därefter varje [[case]] med LEO-system, valfri konstellation eller förinställning) redovisar mediankonvergenstiden (den första epok efter vilken de horisontella och vertikala felen förblir under tröskelvärdena, { "10" } cm som standard), andelen som konvergerat, de mediana felkurvorna och filtrets konsistens (det körningsmedlade positions-NEES mot det tvåsidiga { "95" }%-chi-kvadratbandet). Valfritt bredvid de publicerade siffrorna från Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) för mellanlatituder: { "9.6" } min för multi-GNSS förkortat till { "7.0" }, { "3.2" }, { "2.1" } och { "1.3" } min med { "60" }, { "96" }, { "192" } och { "288" } LEO-satelliter. MODELLED: en konsistensjämförelse av trenden, inte en återgivning av den studiens konstellationer, brus eller stationer; ingen lösning av heltalsosäkerhet, inga cykelslip, ingen fasupplindning, inga tidvatten och inga tidskorrelerade produktfel.

seg-8126f4edf6b6 = En körning av <c1/> sammanfattas som: PPP-konvergens till { "0.10" } m horisontellt / { "0.10" } m vertikalt, { "12" } körningar per fall, { "96" } GNSS-satelliter endast GNSS { "0" } LEO median { "7.4" } min konvergerat { "100" }% NEES medel { "3.13" } { "60" } LEO { "60" } LEO median { "4.8" } min konvergerat { "100" }% NEES medel { "3.08" } { "96" } LEO { "96" } LEO median { "3.2" } min konvergerat { "100" }% NEES medel { "2.74" } { "192" } LEO { "192" } LEO median { "2.7" } min konvergerat { "100" }% NEES medel { "2.65" } { "288" } LEO { "288" } LEO median { "2.3" } min konvergerat { "100" }% NEES medel { "3.06" } Li et al. { "2019" } (publicerat, min) jämfört med modellerat: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

seg-aee2e93b2c20 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3589a089c89d = Exemplet <c1/> anger bland annat:

seg-4dbe1423bb57 = { "60" } LEO

seg-85b65d194f0d = { "96" } LEO

seg-2750ec8c218f = Resultatetikett (motorns egen): MODELLED flytande PPP (jonosfärsfri kod och fas, vit klocka, våt fördröjning som slumpvandring, flytande heltalsosäkerheter per båge) på simulerade mätningar från samma modell; siffrorna från Li et al. ({ "2019" }) är en jämförelse av trenden, inte en återgivning

seg-225ef04c64af = Diagrammet som motorn skriver för scenarios/leo-ppp-convergence.toml, typ leo-ppp

seg-c75ca72ca711 = <b>MODELLED</b> Ett flytande utökat Kalmanfilter för PPP på jonosfärsfri kod och fas: statiska koordinater, en vit mottagarklocka, en intersystemförskjutning per extra system, en zenitvåt fördröjning som slumpvandring avbildad med 1/sin(elevation), en flytande heltalsosäkerhet per satel Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-b55fd1cda5fa = <b>MODELLED</b> Ett flytande utökat Kalmanfilter för PPP på jonosfärsfri kod och fas: statiska koordinater, en vit mottagarklocka, en intersystemförskjutning per extra system, en slumpvandring. Oberoende referens (ExternalDataset): NEES-chi-kvadrattestet är en intern konsistenskontroll (referensen och filtret delar modell). Trenden jämförs med Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min förkortat till { "7.0" }, { "3.2" }, { "2.1" } och { "1.3" } min med { "60" }, { "96" }, { "192" } och { "288" } LEO-satelliter. Det medföljande scenariot ger { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } och { "2.3" } min med i

seg-302365809dbf = MODELLED flytande PPP (jonosfärsfri kod och fas, vit klocka, våt fördröjning som slumpvandring, flytande heltalsosäkerheter per båge) på simulerade mätningar från samma modell; siffrorna från Li et al. ({ "2019" }) är en jämförelse av trenden, inte en återgivning (resultat <c1/>)

seg-6ce77bce8946 = MODELLED: en konsistensjämförelse av trenden, inte en återgivning av den studiens konstellationer, brus eller stationer; ingen lösning av heltalsosäkerhet, inga cykelslip, ingen fasupplindning, inga tidvatten och inga tidskorrelerade produktfel. (typkatalog (<c1/>))

seg-ba2fd25fdcff = De fyra LEO-konstellationerna här är representativa Walker-deltaskal vid { "1000" } km och { "60" } deg med { "60" }, { "96" }, { "192" } och { "288" } satelliter; de är INTE artikelns utformningar, och bruset, stationerna och konvergensdefinitionen (horisontella och vertikala fel under { "10" } cm till körningens slut) är den här modellens. Jämförelsen är därför en MODELLED konsistenskontroll av trenden: konvergensen måste förkortas monotont med t (kommentar i scenariofilen, rad { "10" } till { "14" })

seg-b641b835570c = Konvergens för exakt punktpositionering med enbart GNSS och med LEO-förstärkning är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan sätts ihop av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-368eb6979183 = <s1>Föregående</s1>leo-pnt-chain

seg-2458954d9c22 = <s1>Nästa</s1>leo-pvt
