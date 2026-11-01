# docs--concepts: translations (sv)

seg-501402fc366f = Klock-holdover

seg-9c0eb89a2fbe = Paket

seg-41b3740e1db9 = Källa: <c1/>

seg-8ab3fd09812d = Koncept — en enkel introduktion

seg-0f86d0a815d2 = Den här sidan förklarar <em>vad Kshana gör och varför</em>, från noll och uppåt till fysiken. Ingen förkunskap förutsätts för den första delen; de senare avsnitten lägger till de exakta sambanden för specialister. För definitioner ord för ord, se <a1>ordlistan</a1>.

seg-34f76bad58cb = { "1" }. Problemet, i ett stycke

seg-45c0199e2224 = Nästan allt som behöver veta <em>var det är</em> eller <em>hur mycket klockan är</em> — telefoner, flygplan, fartyg, satelliter, elnät, finansiella system — lutar sig mot signaler från navigationssatelliter (GPS (Global Positioning System) och dess syskon, tillsammans <b>GNSS</b> (globalt navigationssatellitsystem)). Dessa signaler är svaga och går lätt förlorade: de störs ut med jamming, blockeras eller är helt enkelt utom synhåll i rymden. När det händer måste ett system <b>klara sig på egen hand</b> med sensorer ombord — en klocka som håller tiden och tröghetssensorer som följer rörelsen. Frågan som Kshana besvarar är enkel att ställa och svår att mäta: <b>hur länge och hur väl kan det klara sig?</b>

seg-ea1895772e76 = { "2" }. Varför "kvant"?

seg-dd6871645f37 = Sensorer ombord driver. En klocka tappar långsamt tid; en tröghetssensor tappar långsamt greppet om positionen. <b>Kvant</b>klockor och kvanttröghetssensorer driver <em>mycket långsammare</em> än de klassiska komponenter som används i dag — så ett fordon skulle kunna ta sig igenom ett mycket längre GNSS-avbrott och ändå hålla sig inom sina noggrannhetsgränser. Den fördelen är hela löftet med kvant-PNT (positionering, navigering och tidssynkronisering). Men "mycket långsammare" måste omvandlas till <b>siffror</b>: hur många extra minuter holdover? hur många färre meter drift? Dessa siffror avgör om en kvantnyttolast är värd sin kostnad, massa och effekt.

seg-a5d9dc0fb159 = { "3" }. Vad Kshana faktiskt gör

seg-cb3a35ba696f = Kshana är en <b>simulator</b>, inte hårdvara och inte en hårdvaruutformning. Den:

seg-cb7fdaf6738b = Tar ett <b>scenario</b> — en tidslinje med en period av GNSS-avbrott och de publicerade prestandavärdena för en sensor.

seg-701c8c6d0e55 = Driver en <b>sensorfelmodell</b> genom den tidslinjen: så länge GNSS är tillgängligt disciplineras modellen mot referensen; under avbrottet går den fritt och ackumulerar fel precis som fysiken säger att den ska.

seg-bc68e3d54e4c = <b>Poängsätter</b> resultatet mot operativa kvalitetsmått (hur stort felet blir, hur länge det håller sig inom specifikation, hur pålitlig skattningen är).

seg-32d31a9beb71 = För sensorpaketen görs detta <b>två gånger</b> — en gång för en kvantsensor, en gång för dess klassiska motsvarighet — på <em>samma</em> scenario, så att jämförelsen blir rättvis.

seg-07d8c6eb84e9 = Avgörande är att motorn inte vet något om "kvant" kontra "klassisk". Båda är bara felmodeller med olika (publicerade, citerade) parametrar. Skillnaden du ser i utdata är skillnaden i den publicerade fysiken — ingenting är handjusterat för att gynna ena sidan.

seg-e20a7d3f32dc = { "4" }. De fyra byggstenarna ("paketen")

seg-638b8d451550 = Sensor

seg-f891ee876b96 = Vad den besvarar

seg-d1b122c389d4 = atomur

seg-768230c2eb02 = Hur länge håller <em>tiden</em> sig noggrann utan GNSS?

seg-029de6b99be0 = Tröghetsnavigering

seg-f66f2d7b1d6d = accelerometer (+ gyro)

seg-e067a035f656 = Hur snabbt driver <em>positionen</em> utan GNSS?

seg-9ef8f99ca6e4 = Tidsöverföring

seg-1267f82791f9 = optisk länk / RF-länk (radiofrekvens)

seg-6f240700790d = Hur exakt kan två farkoster dela tid?

seg-90be2a6a29b1 = Hybridfusion

seg-780cf1f1127e = allt ovanstående

seg-6080a05ace19 = Håller den <em>kombinerade</em> PNT-lösningen?

seg-3f74a708a746 = Hybridpaketet är poängen: en navigeringslösning behöver <em>både</em> god tid <em>och</em> god position. Det visar att en optisk tidslänk kan hålla även en måttlig klocka låst — vilket innebär att <b>tröghetssensorn</b> blir den svagaste länken, och det är precis där en kvantaccelerometer lönar sig.

seg-5f55bb0fd7c5 = Bortom de fyra paketen

seg-60191a2cd150 = Samma motor kör många fler scenario<em>sorter</em>; <c1/> listar dem alla. De når bortom sensorerna till de signaler och den geometri som sensorerna är beroende av:

seg-995ed414d83d = <b>Var satelliterna finns</b> — banpropagering, konstellationsutformning kring jorden, månen eller en annan kropp, och positionerna för solsystemets kroppar.

seg-bc8abce2a748 = <b>Vad mottagaren kan se</b> — en azimutberoende horisontlinje (en gata, en kaj, en fjord) över elevationsmasken, och den himmelsgeometri som blir kvar: satelliterna i sikte, deras geometriska försämring av precisionen och felellipsen.

seg-b7a2c252c41c = <b>Vad mottagaren hör</b> — L-bandets spektrum under en jammer, jamming och spoofing, och tappad låsning i spårningsslingan.

seg-f354743045c4 = <b>Om svaret går att lita på</b> — integritetsövervakning (RAIM, receiver autonomous integrity monitoring, och dess avancerade form ARAIM) med skyddsnivåer.

seg-69aa01a29a49 = <b>Alternativ till GNSS</b> — gravitations- och terrängkartmatchning, samt positionering, navigering och tidssynkronisering från satelliter i låg jordbana (LEO), från signalutformning via länkbudget och navigeringsmeddelande till positionsbestämningen.

seg-297c98214b5b = <b>Tidssynkronisering för nät</b> — telekomholdover kontrollerad mot de internationella maskerna, och slottidssynkronisering för tidsindexerade scheman.

seg-7eba216a9bf2 = <b>Bortom jorden</b> — månens tid och referenssystem, månens tjänsteområden och navigering via Mars-relä.

seg-b796f49570ed = <b>Många körningar på en gång</b> — kampanjer kedjar sorter på en tidslinje, svepar en parameter eller kör en Monte Carlo-uppsättning.

seg-ef7f4e025018 = { "5" }. Ärlighet genom konstruktion

seg-65fb8703baf9 = En simulator är bara användbar om du kan lita på den. Kshana är byggd så att du kan det:

seg-de8fd160db6d = <b>Varje parameter har en källa.</b> Varje sensorvärde har en <c1/>-sträng som anger det datablad eller den artikel det kommer från. Inga anonyma konstanter.

seg-09d5cd11b127 = <b>Varje modell kontrolleras mot ett lärobokssamband,</b> inte bara mot sig själv — till exempel måste den simulerade klockans Allan-deviation stämma med det publicerade stabilitetsvärdet, och tröghetsdriften måste stämma med den vanliga lagen för feltillväxt. En förmåga kallas <em>validated</em> först när en oberoende extern referens (en verklig datamängd, en oberoende implementation eller publicerade referensvektorer) stämmer överens; resten är <em>modelled</em>, och <a1>verifieringsmatrisen</a1> anger vilket som är vilket.

seg-ccb5b2fe93c4 = Mognaden är markerad.

seg-5a0ac98febed = <a1>VALIDATION.md</a1> markerar varje effekt som <c1/>, <c2/> eller <c3/>, och anger tydligt att de optiska klockornas värden är <em>laboratorie- eller rymdmålvärden</em> — ingen optisk strontiumklocka har flugit.

seg-de463596fcdb = <b>Resultaten är reproducerbara ända ner till biten:</b> samma scenario, frö och version ger alltid identiskt svar på samma plattform; mellan operativsystem stämmer värdena överens inom { "1e-6" } relativt (se <a1>REPRODUCIBILITY.md</a1>).

seg-f87dad1ffc98 = { "6" }. Fysiken, för specialister

seg-8fc6db9faf83 = De samband som Kshana implementerar och testar (fullständiga detaljer och toleranser finns i <a1>VALIDATION.md</a1>):

seg-ea61f869c266 = <b>Klockans holdover.</b> Tvåtillståndsmodell för fas och frekvens med vit frekvensmodulering (vit FM, effektspektraltäthet <c1/>), slumpvandrings-FM (<c2/>), flimmer-FM (en summa av logaritmiskt fördelade Ornstein–Uhlenbeck-processer kalibrerade mot ett platt Allan-golv) och deterministisk åldring. Validerad med överlappande Allan-deviation mot den publicerade <c3/> (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

seg-4f46754c399f = <b>Tröghetsnavigering.</b> Kvarstående accelerometerbias → <c1/>; slumpvandring i hastighet → <c2/>; valfri gyrobias och slumpvandring i vinkel ger ett lutningsfel som kopplar gravitationen (<c3/>) till horisontell acceleration (Groves).

seg-d59595d00f0a = <b>Tidsöverföring.</b> Vitt tidsjitter → synkroniseringsprecision → enkelriktad avståndsmätning (<c1/>, { "1" } ps ≈ { "0.3" } mm); stickprovsmedelvärdet medelvärdesbildas som <c2/>.

seg-0eb7a53fb4a6 = <b>Fusion och integritet.</b> Ett Kalman-filter med två tillstånd vars processbrus motsvarar referensmodellen; under fortsatt färd växer dess fasfelsvarians till exakt <c1/> — det analytiska sambandet för holdover — och dess 1-σ-gräns matar kvalitetsmåttet för integritet.

seg-80daa7cb8641 = <b>Geometri.</b> Keplersk tvåkroppspropagering (valfritt med sekulär J2) eller SGP4 (Simplified General Perturbations { "4" }) från verkliga tvåradiga elementuppsättningar, Walker-konstellationer och sikt i fri sikt (jordens skymning + elevationsmask) härleder GNSS-tillgänglighet ur banornas geometri i stället för handskrivna fönster.

seg-4ce4c6b79b93 = { "7" }. Vart du går härnäst

seg-7c8344a26230 = Arbeta dig igenom det: <a1>handledningarna</a1> — tre genomarbetade exempel och graderade övningar.

seg-277f1b435cf6 = Kör det: se snabbstarten i <a1>README</a1>.

seg-c349981bd4f1 = Förstå strukturen: <a1>ARCHITECTURE.md</a1>.

seg-f7acbf857c57 = Kontrollera vad som är och inte är validated: <a1>VALIDATION.md</a1>.

seg-04a86ea674a5 = Slå upp en term: <a1>GLOSSARY.md</a1>.

seg-4a73b906888b = <s1>Föregående</s1>Översikt

seg-2f14e84bfc99 = <s1>Nästa</s1>Ordlista
