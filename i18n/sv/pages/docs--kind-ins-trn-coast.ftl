# docs--kind-ins-trn-coast: translations (sv)

seg-bf51947657c0 = navigering

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-c4ed27a559df = Ämnessida: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-7b2721b7588d = Scenariotyp i motorn v{ $version }, familj <a1>Tröghets-, fusions- och kvantsensorer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-195347c63a8a = m/s^{ "2" }

seg-f7f12029e0ec = Familjesida: <a1>Tröghets-, fusions- och kvantsensorer</a1>

seg-f7305f3a0b5a = Källa: <c1/>

seg-92b90cb4a839 = <c1/> (scenario kind)

seg-5b9a6efe6337 = INS/TRN-felmodell för fri tröghetsflygning (coasting): positionsfel mot varaktighet, byggd utifrån IMU-koefficienter i stället för att svepas som en antagen driftshastighet. Fem tillväxtbidrag — accelerometerbias, gyrobiasens lutning via gravitationen, hastighetsslumpvandring, vinkelslumpvandring och skalfaktor mot tillryggalagd sträcka — vart och ett propagerat genom en tröghetsfelmodell med nio tillstånd i lokalt horisontsystem med Schuler-återkoppling vid en angiven latitud och höjd (de ledande lagarna av lägsta ordning för korta förlopp t², t³, t^{ "1.5" }, t^{ "2.5" } och t¹/t² redovisas bredvid) och kombinerade enligt en ANGIVEN regel (kvadratsumma som standard, eller linjär summa, eller deterministisk summa med stokastisk kvadratsumma; alla tre beräknas vid varje körning så att valet syns i stället för att vara gömt). De varaktigheter som når positionströsklar angivna av anroparen ({ "10" } m och { "50" } m som standard) hittas med motorns befintliga intervallhalvering, var och en med en uppdelning per bidrag som pekar ut den dominerande källan, och varje enskilt bidrags passage inverteras dessutom algebraiskt så att de två stämmer överens. Ett terrängrelativt navigeringsläge (TRN) begränsar förloppet med periodiska positionsbestämningar och redovisar det största intervall mellan positionsbestämningar som håller varje tröskel; en positionsbestämning enbart av position lämnar hastighetsfel och lutning kvar över positionsbestämningen, så den begränsar inte alltid förloppet vid någon frekvens, och rapporten säger det i stället för att ge en nolla. MODELLED: IMU-klassernas koefficienter är representativa bandvärden, inte ett datablad, och residualen för terrängpositionsbestämningen är en indata. En tröskel som inte nås redovisas som null med en status, aldrig som en nolla. Ingen certifierad produkt för tröghetsnavigeringens prestanda.

seg-bbd497aa3ba6 = En körning av <c1/> sammanfattas som: ins-trn-coast | navigation IMU, { "250" } m/s, combination rss | { "10" } m at { "251.0" } s (accel_bias) | { "50" } m at { "608.8" } s (accel_bias) | TRN position-only peak { "44.7" } m over { "1200" } s

seg-e0555ca683b1 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-95887c4551c7 = Exemplet <c1/> anger bland annat:

seg-4db5a594afc1 = rss

seg-5868f641c089 = ug

seg-1918189ac2bf = ppm

seg-7eba4c5ee1e4 = Resultatetikett (motorns egen): MODELLED INS/TRN-felbudget för fri tröghetsflygning. Varje bidrag propageras genom en tröghetsfelmodell med nio tillstånd i lokalt horisontsystem med Schuler-återkoppling (horisontell plattform med kurs norrut på en angiven plats, fri tröghet inklusive den instabila vertikala kanalen); dess ledande lagar av lägsta ordning för korta förlopp (bias t^{ "2" }, gy

seg-134a4c91da3a = Diagrammet som motorn skriver för scenarios/ins-trn-coast.toml, kind ins-trn-coast

seg-7bb77ec86a0a = <b>VALIDATED</b> Budget för positionsfel mot varaktighet byggd utifrån IMU-koefficienter, där varje felkälla (accelerometerbias, gyrobias, hastighetsslumpvandring, vinkelslumpvandring, skalfaktor vid marschfart och under ihållande specifik kraft) propageras genom en n

seg-d69247df315f = <b>VALIDATED</b> Budget för positionsfel mot varaktighet byggd utifrån IMU-koefficienter, där varje felkälla (accelerometerbias, gyrobias, hastighetsslumpvandring, vinkelslumpvandring, . Oracle (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), körd som separat program under GNU Octave { "8.4.0" }: fria tröghetskörningar med samma IMU-felprofil, med en korrigerad numerisk dödzon i dess kvaternionsuppdatering (qua_update.m: spärren för en hastighet under { "1e-8" } rad/s ersatt med wnorm == { "0" }, tillämpad på en kopia vid körning och kontrollerad att matcha en gång; med spärren på plats frös en långsamt driftande plattformsattityd och skar

seg-498cb2f96fa7 = MODELLED INS/TRN-felbudget för fri tröghetsflygning. Varje bidrag propageras genom en tröghetsfelmodell med nio tillstånd i lokalt horisontsystem med Schuler-återkoppling (horisontell plattform med kurs norrut på en angiven plats, fri tröghet inklusive den instabila vertikala kanalen); dess ledande lagar av lägsta ordning för korta förlopp (bias t^{ "2" }, gyrobiasens lutning t^{ "3" }, hastighetsslumpvandring t^{ "1.5" }, vinkelslumpvandring t^{ "2.5" }, skalfaktor x tillryggalagd sträcka) korskontrolleras (result <c1/>)

seg-63c221a546f7 = INS/TRN-felmodell för fri tröghetsflygning: positionsfel mot varaktighet, byggd utifrån IMU-koefficienter i stället för att svepas som en antagen driftshastighet. (kind catalogue (<c1/>))

seg-164504645f4a = MODELLED: IMU-klassernas koefficienter är representativa bandvärden, inte ett datablad, och residualen för terrängpositionsbestämningen är en indata. (kind catalogue (<c1/>))

seg-ee0281a1f401 = Frågan som detta besvarar: när en GNSS-studie (eller en studie med aperturdutycykel) säger "anta en dödräkningsdrift på { "0.001" }–{ "0.050" } m/s", var kommer det talet ifrån? Det kommer från IMU:n, och detta scenario beräknar det i stället för att svepa det. Fem tillväxttermer — accelerometerbias (t^{ "2" }), gyrobiasens lutning via gravitationen (t^{ "3" }), hastighetsslumpvandring (t^{ "1.5" }), vinkelslumpvandring (t^{ "2.5" }) och skalfaktor gånger den tillryggalagda sträckan (scenario file comment, lines { "4" } to { "11" })

seg-32d4adcfe249 = <s1>Föregående</s1>inertial

seg-47366ab55be3 = <s1>Nästa</s1>integrity
