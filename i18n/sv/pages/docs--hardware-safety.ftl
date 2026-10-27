# docs--hardware-safety: translations (sv)

seg-fdbb9db68f1d = ingen

seg-2015f437e669 = Källa: <c1/>

seg-10c7eaab58c5 = Maskinvarusäkerhet: vad Kshana gör med maskinvara, och vad den aldrig gör

seg-fe4873962140 = <b>Status: ägarens juridiska granskning pågår.</b> De juridiska anteckningarna nedan är underhållarnas tolkning av offentliga källor, skrivna så att en användare vet var gränserna går. De är inte juridisk rådgivning, de har inte granskats av juridiskt ombud och lagen skiljer sig mellan länder. Läs dem som ett skäl att fråga en jurist, inte som ett tillstånd.

seg-bd2fbb355834 = Rådgivande programvara för forskning, simulering och test. Den är inte typgodkänd utrustning och betygsätter eller godkänner varken en mottagare, en klocka eller ett laboratorium. Se den rådgivande förklaringen i README.

seg-f27c286787b1 = Regeln

seg-88638e41faab = Mottagning är produkten. Sändning finns aldrig i den öppna motorn.

seg-614d381dd0d0 = Kshana innehåller ingen kod som styr en sändare. Det finns ingen SDR-sändningsväg (inget sändningsanrop i UHD, HackRF, bladeRF eller Soapy), och ingen jamming- eller spoofing-vågform skrivs till en fil avsedd för uppspelning.

seg-2e370a1c6c4c = Filer som Kshana skriver (IQ-scener, SigMF- och ION-inspelningar i <c1/>, NMEA- och bench-exporter) beskriver <b>simulerade, legitima</b> signaler eller rörelser, och de metadata som Kshana skriver för en scen anger att den skrevs av <c2/> (ION-kommentaren i <c3/> anger att det är en simulerad scen, inte en inspelning).

seg-8ce652bc1af6 = Där ett experiment behöver RF på en labbänk framställs den av <b>operatörens egen utrustning</b>, i operatörens egen skärmade låda och på operatörens eget tillstånd. Kshana registrerar vad operatören uppger har gjorts och drar aldrig några egna slutsatser om det.

seg-c74fc5d82071 = Steg

seg-01e7633921dc = Varje steg anger vad Kshana gör, vilken hårdvara som ingår, vem som sänder RF (om någon) och den spärr som måste hålla innan Kshana behandlar resultatet som evidens.

seg-324e16b11186 = Steg

seg-bb269645d988 = Kshanas roll

seg-76c0861cbe83 = Hårdvara

seg-92ab27525ed1 = RF-emission

seg-c822f981cfcf = Spärr

seg-00727bb577f9 = Status i { "0.38" }

seg-1c566ec98a03 = Filer: uppspelningsloggar, IQ, bench-exporter, direkt NMEA eller UBX via stdin, TCP eller UDP

seg-0435986aa760 = levererat

seg-56b9a4399108 = Passiv mottagning: mottagare enbart i läsläge; tidsloggar (linuxptp, chrony, TICC); IMU-CSV; <c1/> på en växande SigMF-fil

seg-608fc0a99107 = användarens mottagare, grandmaster, SDR i mottagningsläge

seg-786d9e5ccf93 = varje konfigurationsskrivning till en mottagare kräver en uttrycklig <c1/>; standard är skrivskyddat

seg-ab8874046283 = delvis levererat: tidsloggsformat, <c1/>, <c2/>; seriell mottagaringång är planerad

seg-6b0a194d3f64 = Laboratorieorkestrering utan RF från Kshana: en specifikation av testvillkor, operatörssteg (antenndragning, simulatorstart) som uppmanas och tidsstämplas, samt poängsättning och evidens i tur och retur

seg-8e2847bce9ac = laboratoriets egna simulatorer, skärmade lådor

seg-121fe22c92ec = endast av <b>laboratoriets</b> simulator, ledningsbundet

seg-0a704c5443c5 = ett signerat <c1/> (se nedan) som registreras i bevispaketet; Kshana vägrar poängsätta en laboratoriekörning utan det

seg-9e94d44cd197 = registreringen är implementerad i bevispaket; vägran att poängsätta utan den är det ännu inte (det finns inget kommando för laboratoriekörning)

seg-ee5333e346ad = Ledningsbunden uppspelning av <b>legitima</b> GNSS-IQ-scener: Kshana skriver scenfilen, och användaren spelar upp den med eget verktyg i en kabel med dämpsatser och en testad enhet i en RF-skärmad låda

seg-fa5b0f1b41f7 = användarens SDR, dämpsatser, skärmad låda

seg-9049203a2a6e = endast ledningsbundet, användarens ansvar

seg-b4392e583cb8 = ingen sändningskod i den öppna motorn; störnings- och spoofing-vågformer ligger utanför omfattningen; granskning av exportkontroll; juridiskt ombud

seg-ced2afbf108f = inte i den öppna motorn; en punkt för den kommersiella utgåvan som ska hanteras tillsammans med juridiskt ombud

seg-0f8a0fce4d20 = Closed-loop RF hardware-in-the-loop i realtid

seg-d109f8e36ce8 = partnerutrustning

seg-fb26b352f56e = partner

seg-38c768d5faa7 = integrera i stället via specifikationen för steg { "2" }

seg-458f37b807ba = inte planerat

seg-2e59d363e31b = ”Levererat” betyder att koden finns i den här versionen. Ingenting i den här tabellen säger att något steg har använts med någon partner, något laboratorium eller någon myndighet; inget har gjort det.

seg-1524fb5b0aba = Principer

seg-82b8ed15bbe6 = Mottagning är produkten, och sändning finns aldrig i den öppna koden.

seg-63c000eccfc2 = Varje hårdvarusession ger ett bevispaket med hashvärden för indata, villkor och använda trösklar.

seg-63cc5d9513ff = Ett intyg om ledningsbunden eller skärmad uppställning registreras, aldrig antas.

seg-da1e4f5da956 = Tal som kommer från hårdvara förblir <b>MODELLED</b> tills en oberoende extern referens stämmer överens (till exempel en referensbana från ett laboratorium eller en referensklocka). En tröskel som fastställts i förväg lättas aldrig efter en körning.

seg-d8e445427d02 = Antenner med kontrollerade mönster, tröghetsenheter och atomur i chipskala behandlas som datakällor (mönster, loggar, publicerade stabilitetskurvor), inte som enheter som Kshana styr.

seg-7a22a9591fa3 = Formulering: ett resultat är ”uppmätt mot masken” eller ger belägg för ett krav. Kshana säger inte att en enhet uppfyller en standard, och ingen har betygsatt eller godkänt den.

seg-913509e5d6b2 = Juridiska anmärkningar (ägarens juridiska granskning pågår)

seg-c18b68936406 = Att ta emot GNSS-signaler är lagligt nästan överallt. Att sända i GNSS-band är det inte.

seg-070d8a8d5494 = <b>USA.</b> Uppsåtlig störning av radiokommunikation är förbjuden enligt { "47" } U.S.C. §{ "333" }, och FCC vidtar åtgärder mot jammers (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). En sändning från en labbänk kan nå utanför labbänken.

seg-336b48c6f5f2 = <b>Övriga länder.</b> Underhållarna har inte granskat andra länders lagstiftning. Gemenskapen kring gps-sdr-sim uppger att det är förbjudet enligt lag i de flesta länder att sända dess utdata; utgå från det som arbetsantagande överallt där juridiskt ombud inte har sagt något annat.

seg-8d31cbd38718 = <b>En skärmad eller ledningsbunden uppställning är en säkerhetsåtgärd, inte ett tillstånd.</b> Intyget nedan registrerar den säkerhetsåtgärd som operatören uppger fanns på plats. Det gör inte en emission laglig.

seg-7373bfd21035 = <b>Inspelning.</b> Inspelning av radiosignaler kan väcka frågor om integritet och laglighet på vissa platser. <c1/> och alla inspelningsrecept är enbart för mottagning, och operatören ansvarar för var och vad som spelas in.

seg-2edf9b14e62c = <b>Exportkontroll.</b> Hardware-in-the-loop-programvara som styr signalgeneratorer kan omfattas av exportkontrollregler. Därför ligger steg { "3" } utanför den öppna motorn.

seg-bcd59f201022 = <b>Ingenting här är ett stöd eller ett avtal.</b> Ingen tillsynsmyndighet, ingen testanläggning, inget laboratorium och ingen leverantör har rådfrågats om det här dokumentet eller har gått med på något i det.

seg-81091020e648 = Fältet <c1/>

seg-64918fd6895d = För steg { "2" } och uppåt bär en körning som involverade laboratorieutrustning ett <c1/>-objekt, registrerat i bevispaketet bredvid hashvärdena för indata. Det är ett uttalande av en namngiven operatör, inte en mätning, och Kshana verifierar det inte.

seg-3bf153c63fa3 = Vad som är implementerat i { "0.38" }:

seg-bf212e141046 = <c1/> validerar filen och registrerar intyget i paketets <c2/>. Manifestet täcks av paketets Ed25519-signatur, så registreringen kan inte ändras utan att verifieringen bryts. Samma sak finns som argumentet <c3/> i Python-funktionen <c4/> och argumentet <c5/> i MCP-verktyget <c6/> (webbläsarbygget skapar inte paket).

seg-431036f13a37 = Ett paket som skapats utan intyg är byte för byte identiskt med hur det var tidigare.

seg-4360b8fbdafb = <c1/> redovisar intyget och anger att det är ”intygat av den namngivna operatören; inte verifierat av Kshana”.

seg-438bbe788314 = Ett intyg som är ofullständigt, eller vars <c1/> varken är <c2/> eller <c3/> (en uppställning över luften godtas inte som laboratoriekörning), vägras och inget paket skapas.

seg-c8c40ed88dde = Vad som <b>inte</b> är implementerat ännu: regeln i steg { "2" } att Kshana vägrar <em>poängsätta</em> en laboratoriekörning som saknar intyg. Inget kommando tar någon flagga för laboratoriekörning i { "0.38" }, så det finns inget att vägra; regeln kommer med kommandona för laboratorieorkestrering. Ett intyg registrerar operatörens uttalande om en säkerhetsåtgärd. Det gör ingen emission laglig och det ändrar inte ett resultats etikett: en poängsatt laboratoriekörning är MODELLED om inte en extern oberoende referens stämmer överens.

seg-b0db377bce58 = Vad det här innebär för en bidragsgivare

seg-c2e215edd86c = Lägg inte till en sändningsväg, ett sändningsberoende eller ett sändningsexempel i den öppna motorn.

seg-452b44a9ca8a = Lägg inte till en vågformsgenerator vars utdata är en jamming- eller spoofing-signal avsedd för uppspelning.

seg-4df4d15a5f1c = Nya hårdvaruingångar är skrivskyddade som standard; en skrivning kräver en uttrycklig flagga och en rad i den här filen.

seg-ee5f1fa9b822 = Ett nytt kommando som berör hårdvara läggs till på varje yta eller markeras som N/A med en motivering i <a1><c1/></a1>, och anger sitt steg här.

seg-7d65c3565acd = <s1>Föregående</s1>Klockloggformat

seg-82eb53d4efbd = <s1>Nästa</s1>Integritet och säkerhet

seg-8a78e520fc9e = Fältet lab-attestation
