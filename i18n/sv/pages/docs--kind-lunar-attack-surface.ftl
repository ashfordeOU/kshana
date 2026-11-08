# docs--kind-lunar-attack-surface: translations (sv)

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisk J/S-länkbudget, anti-jam C/N₀, förlust av låsning per satellit. Oberoende referens (InternalConsistency): Länkbudgetekvationen för anti-jam C/N₀ korskontrollerad mot en oberoende numpy-omräkning (delar samma slutna form → InternalConsistency) plus en karakterisering av C/N₀-försämring i verkliga JammerTest-2024. { "0.30" } omgång { "2" }, blockerad (förblir MODELLED): den uppmätta C/N0-minskningen i JammerTest { "2024" } mot en länkbudgetprediktion (förhandsregistrerad 6a66994b, inom { "3" } dB) kördes inte eftersom F8.1-antennens position och pekning vid

seg-143f3f1cc521 = Resiliens mot jamming i GNSS-nekade miljöer är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-c14d2343d802 = Källa: <c1/>

seg-9c0b5e933472 = <c1/> (scenariotyp)

seg-004c56ded47f = Angreppsyta för signalsäkerhet vid navigering på månytan (P1): sammanställer de öppna signalsäkerhetsanalyserna i en enda körning som kan nås från binärfilen. Redovisar ({ "1" }) AFS-mottagen effekt och dess effektÖVERSKOTT jämfört med en jordbunden GPS-referens, plus känslighetsbandet på 12-18 dB som en äkta svepning över flera axlar av länkens indata (referensnivå x EIRP x snedavstånd) med avstämningen mellan linjära faktorerna 25x avrundat / 28x oavrundat. REVIDERAD (regel R4): den här redovisade ett effektUNDERSKOTT på { "15.6" } dB och en faktor 32x/36x tills GPS-referensen korrigerades från -125 / -128.5 (som är dBm-siffrorna) till -155 / -158.5 dBW, de ICD-GPS-200-värden som störningsmodulen alltid har haft. Tecknet vänds: den modellerade lunara AFS-signalen är { "14.4" } dB STARKARE än jordbunden GPS L1 C/A, inte svagare. Själva mottagna effekten rörde sig inte en bit, och den linjära faktorn är den gamla delad med exakt { "1000" }, vilket är exakt dBm-till-dBW-förskjutningen på { "30" } dB; ({ "2" }) den sändareffekt en angripare behöver för att spoofa (J/S = { "3" } dB) och för att förhindra (J/S = { "30" } dB) vid varje avstånd, inversen av J/S-länken; ({ "3" }) den omloppsbaserade fångstytan under ett verkligt antennmönster för likformig apertur (Airy [{ "2" } J1(x)/x]^{ "2" }), en höjdbegränsad subhemisfärisk kalott vars kant INTE fångas; ({ "4" }) ett beräknat utfall för spoofningsfångst i spårningsslingan (drar en spoofer med matchad kod vid en given effektfördel och kodförskjutning faktiskt med sig DLL/PLL) i stället för det påstådda tröskelvärdet på { "3" } dB; ({ "5" }) den geometriska horisontens räckvidd på en kropp utan atmosfär för en upphöjd sändare på ytan; och ({ "6" }) budgeten för OSNMA/TESLA-autentisering ({ "20" } bit/s överhead = ~{ "40" } % av ett AFS-navigeringsmeddelande på { "50" } bit/s, latens för nyckelavslöjande, { "2" }^-40 förfalskning). En tom kropp återger P1-baslinjen; varje indata har ett standardvärde och kan skrivas över. VALIDATED delresultat bär sin källmoduls oberoende referens (radiometri i dB i sluten form; tur-och-retur för invers J/S; Airy-mönster mot Bessel enligt A&S och sfärisk kalottgeometri; DLL/PLL-fångst mot Kaplan & Hegarty; identitet för sfärisk tangenthorisont mot eo_payload; fältstorlekar enligt OSNMA SIS-ICD). MODELLED: de representativa storlekarna på geometri och effekt och de enskilda cellvärdena i fångstkartan. Ingen certifierad säkerhetsprodukt.

seg-e5edd5b9ef27 = En körning av <c1/> sammanfattas som: lunar-attack-surface | AFS -140.6 dBW, överskott { "14.4" } dB (band -17.9–-12.0, { "25" }×/28× överskott) | spoof@{ "1000" } m { "0.000" } W | fotavtryck { "3" }% kalott, kant falsk | spoofningsfångst sann (lås { "0.00" } s) | mastens räckvidd { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% av { "50" } bit/s), { "30" } s latens | svepning av fotavtryck 7x5 (höjd 20-500 km x HPBW 1.83-29.20 deg), fångst 0.6-42.9% | kanten NÅS INTE på det här rutnätet (bäst -0.8 dB, { "3.8" } dB för lite; kräver { "19.8" } dBW mot { "16.0" } dBW)

seg-781a7094b955 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

seg-87e0c97de011 = Exemplet <c1/> anger bland annat:

seg-6ea8f1132b57 = linear

seg-8b701f465117 = log

seg-de295af20c55 = Diagrammet som motorn skriver för scenarios/lunar-attack-surface.toml, typ lunar-attack-surface

seg-c853e3e832c0 = <b>MODELLED</b> Svepning över två axlar av den mönstervägda, höjdbegränsade fångstytan på ytan över sändarens höjd och parabolens diameter, utsänd som en rad per arbetspunkt. Oberoende referens (InternalConsistency): Mängdinklusion: förhållandet mellan störning och signal går in som en likformig förskjutning i decibel, så den fångade mängden vid högre sändeffekt innehåller mängden vid lägre och andelen kan bara stiga -- en egenskap som Airy-mönstret INTE ger i strålbredd eller höjd, där det fångade området bryts upp i ringar och andelen genuint är icke-monoton. Ingen publicerad tabell anger den fångade skivandelen för en lunar omloppssändare

seg-d11486381332 = MODELLED: de representativa storlekarna på geometri och effekt och de enskilda cellvärdena i fångstkartan. (typkatalog (<c1/>))

seg-95be70748647 = Fångstytan mot höjd och strålbredd är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-1a1799e01ac4 = <s1>Föregående</s1>link-budget

seg-4b0efe4b9b85 = <s1>Nästa</s1>lunar-beacon

seg-ca1c7e92b98e = <s1>Föregående</s1>lunar-ascent
