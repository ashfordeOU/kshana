# docs--kind-lunar-ascent: translations (sv)

seg-f942b36a11c4 = Ännu inte på GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariotyp i motorn v{ $version }, familj <a1>Månen och cislunart rum</a1>. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en säkerhetskritisk tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Månen och cislunart rum</a1>

seg-6a26b9ab59fe = Ämnessida: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Källa: <c1/>

seg-b8ef47331221 = <c1/> (scenariotyp)

seg-ae3053a1f6c8 = MODELLED driven stigning från en plats på ytan nära sydpolen till rendezvousbanan, och kovariansen för position och hastighet som den för tillbaka till banan (Artemis-klass). Den inertiella felmodellen med fem tillstånd per axel från lunar-descent (position, hastighet, accelerometerbias, lutning i attityd, gyrobias, driven av den specifika kraften) körs på alla tre platsaxlarna från det ytillstånd som fasen går in med; en AFS-positionsbestämning från de synliga reläerna i en ILLUSTRATIVE konstellation i LCNS-klass (fristående, eller differentiell med korrektionslänkens residual från lunar-differential-pnt, med klockan stödd när bara tre reläer är synliga) tas med ett angivet intervall, med månens tid som går in via fordonets klocka och ett tidsstämpelfel längs banan. Redovisar de inertiella källorna i sluten form, stödets bidrag, ablationen, navigeringens 1-sigman över stigningen, spridningen vid motoravstängning bredvid navigeringskunskapen, och hela 6x6-MCI-kovariansen vid insättningen med korrelationen mellan position och hastighet bevarad. MODELLED: illustrativ IMU-klass, specifik kraft, reläuppsättning och spridning vid avstängning; fel hållna i avfyrningsplatsens axlar; det nominella utgångstillståndet är en ersättning. Inte stött av någon rymdorganisation; rådgivande programvara, inte certifierad navigationsutrustning.

seg-fc4d2ba3f99e = En körning av <c1/> sammanfattas som: lunar-ascent | -89.50 deg | endast inertiell { "785" } m / { "3.49" } m/s | med AFS { "11.4" } m / { "0.071" } m/s | spridning vid insättning { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = Exemplet <c1/> anger bland annat:

seg-ebc18c9bcbac = differential

seg-3843825d0733 = us

seg-2d84b341a41f = Resultatetikett (motorns): MODELLED

seg-463a919e84d5 = Diagrammet som motorn skriver för scenarios/lunar-ascent.toml, typ lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> Typen och fasen <c1/>: den inertiella felmodellen med fem tillstånd per axel körd över en driven stigning med specifik kraft längs banan, stödd av AFS-positionsbestämningar och månens tid, som redovisar kovariansen för position och hastighet vid insättningen som förs

seg-4e0c4b02eac0 = <b>MODELLED</b> Typen och fasen <c1/>: den inertiella felmodellen med fem tillstånd per axel körd över en driven stigning med specifik kraft längs banan, stödd av AFS-positionsbestämningar. Oberoende referens (InternalConsistency): Den inertiella driften i sluten form och monotonicitetskontroller i testerna. Ingen genomförd stigning jämförs

seg-8732ad9f7e07 = <b>MODELLED</b> Propagatorn som månens typer delar (GRAIL GL0660B grad och ordning { "150" }, jorden och solen som tredje kroppar, relativitet, DE440-månorientering) jämförd med de offentl. Oberoende referens (ExternalDataset): JPL Horizons rymdfarkostefemerider för LRO och CAPSTONE, mot trösklar som fastställts i förväg i xval/mission-thread-lunar/PREREGISTRATION.md (tillägg { "1" } till { "6" }). LRO: MET, { "33" } m största 3D-skillnad och { "2.4" } m radiellt RMS mot { "500" } m och { "60" } m. CAPSTONE: NOT MET, en skillnad i slutposition på { "136.8" } km mot { "25" } km och en skillnad i periapsis på { "28.4" } km mot { "10" } km, orsakerna är inte isolerade. Raden är modellerad eftersom CAPSTON

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-745dfc03a929 = MODELLED driven stigning från en plats på ytan nära sydpolen till rendezvousbanan, och kovariansen för position och hastighet som den för tillbaka till banan (Artemis-klass). (typkatalog (<c1/>))

seg-3fd0cca78937 = MODELLED: illustrativ IMU-klass, specifik kraft, reläuppsättning och spridning vid avstängning; fel hållna i avfyrningsplatsens axlar; det nominella utgångstillståndet är en ersättning. (typkatalog (<c1/>))

seg-2cfb37d39847 = ÄRLIGHET: MODELLED. IMU-klassen, riktningen, den specifika kraften och spridningen vid avstängning är ILLUSTRATIVE indata, inte mätningar. Felen hålls i avfyrningsplatsens öst-nord-upp-axlar, utan banans krökning i sträckriktningen, och det nominella utgångstillståndet är en ersättning vid platsens lokala vertikal: bara kovariansen är resultatet. Ingen samstämmighet med något verkligt fordon hävdas. Rådgivande programvara, inte c (kommentar i scenariofilen, rad { "11" } till { "15" })

seg-6faf49cac41a = Driven stigning från en polarplats på månen till en insättningsbana (<c1/>) är MODELLED, inte validerad: kontrollerad mot sin egen identitet i sluten form / analytisk identitet — fångar överföringsfel och koefficientfel, men är inte en extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = Propageringen med månens kraftmodell mot offentliga rekonstruerade banor för månsatelliter och cislunara banor är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan sätter ihop modellerade delar, så förmågan förblir modellerad. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Ämnessida: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Föregående</s1>link-budget

seg-59d4cb995cb9 = <s1>Nästa</s1>lunar-attack-surface
