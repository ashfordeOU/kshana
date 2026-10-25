# docs--licensing: translations (sv)

seg-a1bee28d1dfd = Källa: <c1/>

seg-b8dd205e82c4 = Kshana är <b>dubbellicensierat</b>. Du får använda den öppna motorn under <b>antingen</b> den öppna licensen (AGPL-3.0) <b>eller</b> en <b>kommersiell licens</b> från Ashforde OÜ. Välj den som passar hur du tänker använda den.

seg-5faea0aba960 = Det här dokumentet förklarar modellen på vanlig svenska. Det är en vägledning, inte juridisk rådgivning, och det ändrar inte själva licenserna. De bindande villkoren finns i <a1><c1/></a1> (GNU AGPL-3.0) och i varje kommersiellt avtal du tecknar med Ashforde OÜ. Om de två någonsin skulle stå i konflikt är det de dokumenten som gäller.

seg-89bd60937f0b = Alternativ A — öppen källkod: GNU AGPL-3.0-only

seg-785200a5419a = Standardvalet. Hela texten finns i <a1><c1/></a1>. Kort sagt låter AGPL dig använda, studera, ändra och vidaredistribuera Kshana gratis, <b>under förutsättning</b> att:

seg-5bc05999ee9d = om du <b>distribuerar</b> Kshana eller ett derivat gör du den <b>fullständiga motsvarande källkoden</b> tillgänglig under AGPL; och

seg-5c9136766fdf = om du låter användare interagera med en <b>modifierad</b> Kshana <b>över ett nätverk</b> (AGPL:s särskiljande klausul, §{ "13" }), måste du erbjuda <b>dessa användare</b> den motsvarande källkoden för din modifierade version under AGPL.

seg-234be920d38f = AGPL är en <a1>öppen källkodslicens erkänd av OSI</a1> och stark copyleft. Den är rätt val för akademiskt arbete, projekt med öppen källkod, intern utvärdering och forskning, och för alla som gärna håller sitt eget derivat öppet.

seg-16c9cc91e4eb = Alternativ B — kommersiell licens (från Ashforde OÜ)

seg-197bfc5a5166 = Om AGPL inte passar dig licensierar Ashforde OÜ samma motor på kommersiella villkor. Det är rätt val när du vill:

seg-6de2b04016e5 = <b>bädda in Kshana i en proprietär produkt eller en produkt med sluten källkod</b> utan att släppa din egen källkod;

seg-e31db28c1e09 = <b>erbjuda en nätverkstjänst</b> byggd på en modifierad Kshana <b>utan</b> skyldigheten i §{ "13" } att lämna ut källkod;

seg-9d3578395a59 = integrera Kshana i ett större system vars övriga komponenter inte kan vara AGPL (till exempel en huvudentreprenörs proprietära verktygskedja); eller

seg-99d049c650a3 = få garanti, skadeersättning eller supportvillkor som AGPL uttryckligen friskriver sig från.

seg-f68b536b93c0 = En kommersiell licens tar bort copyleft-skyldigheterna för din användning, på överenskomna villkor. <b>Kontakt: <a1>contact@ashforde.org</a1>.</b>

seg-55f1a2f687d9 = Varför vi dubbellicensierar på det här sättet

seg-42c1ce05ca5c = Målet är att vara <b>offentligt verifierbar</b> (så att varje granskare kan köra och granska motorn) <b>utan</b> att låta en resursstark konkurrent forka den validerade motorn, stänga den och leverera en proprietär konkurrent som inte ger något tillbaka. AGPL:s nätverkscopyleft åstadkommer det: ett slutet eller hostat derivat måste komma tillbaka till öppen källkod — eller ta en kommersiell licens av oss. Offentlig trovärdighet och en försvarad kärna, på samma gång.

seg-32b1d38914fe = Vad som <b>inte</b> omfattas av dubbellicensieringen

seg-27636d757dba = <b>Den inbyggda OpenCPN-pluginen</b> (<c1/>) är licensierad under <b>GPL-3.0-or-later</b> (se filen <c2/> i den katalogen), inte AGPL-3.0, och erbjuds <b>inte</b> under den kommersiella licensen. Den laddas in i OpenCPN och byggs mot plugin-API-huvudet för GPL-2.0-or-later, vilket är det vanliga underlaget för OpenCPN-plugins. Resten av <c3/> (Signal K-pluginen och OpenCPN:s TCP-relä) förblir AGPL-3.0-only.

seg-f90c983e0ee3 = <b>Kshana Pro</b> och andra proprietära överlägg är <b>separata produkter med sluten källkod</b> under egna kommersiella villkor. De ingår inte i det här repositoriet och erbjuds inte under AGPL.

seg-e340445b7f17 = <b>Beroenden</b> behåller sina egna (tillåtande) licenser. Vi håller medvetet beroendeträdet tillåtande (Apache-2.0 / MIT / BSD / ISC / …) just för att den kommersiella utgåvan ska kunna erbjudas utan komplikationer — ett copyleft-beroende skulle smitta den. Se <a1><c1/></a1>.

seg-810191f19d4d = <b>Primära minneskoder för Galileo E1</b> (<c1/>, <c2/>; <b>medföljer inte sedan { "0.36" }</b>: varje användare tillhandahåller sin egen kopia, <c3/> eller <c4/> / <c5/>, som läses av <c6/>). Det här är de primära koderna E1-B och E1-C i bilaga C.7 och C.8 i Galileo Open Service Signal-In-Space Interface Control Document (OS SIS ICD), utgåva { "2.0" }, januari { "2021" }, © Europeiska unionen { "2021" }, extraherade oförändrade ur PDF-filens bilagor (käll-URL, SHA-256 och en korskontroll mot utgåva { "1.3" } finns i <a1><c7/></a1>). De omfattas <b>inte</b> av AGPL-3.0 eller den kommersiella licensen, och ingen av licenserna ger några rättigheter över dem. Vad själva ICD:n säger, citerat ur utgåva { "2.0" }:

seg-daef032cbe43 = Användarvillkor §{ "3" }: "Informationen i OS SIS ICD, inklusive dess bilagor, omfattas av immateriella rättigheter". "OS SIS ICD får endast delvis eller helt återges och/eller överföras till tredje part i enlighet med den häri beskrivna tillåtna användningen och på följande villkor: de föreliggande “Terms of Use and Disclaimers” samt villkoren i bilaga G accepteras, återges och överförs i sin helhet och oförändrade tillsammans med den återgivna och/eller överförda informationen; upphovsrättsnotisen “© European Union { "2021" }” tas inte bort från någon sida." Och: "Användningen av informationen i OS SIS ICD, inklusive de spridningskoder som omfattas av IPR, är tillåten på de villkor som anges i bilaga G."

seg-0fb25fafd9a2 = Bilaga G (utgåva { "2.0" }; bilaga H i utgåva { "2.1" }, med samma ordalydelse) definierar "Technical Data of the OS SIS ICD" så att det omfattar "E1 and E5 Memory Codes", och ger ett åtagande att inte göra gällande rättigheter som är "icke-exklusivt och royaltyfritt" samt "icke-överlåtbart och icke-licensierbart". Dess lista i §G.3, som den kallar uttömmande, omfattar: "a) användning av Technical Data of the OS SIS ICD, inklusive deras integrering och införlivande i alla Products"; "b) lagring av Technical Data of the OS SIS ICD, förutsatt att källan anges"; "c) återgivning av OS SIS ICD, helt eller delvis, dess distribution och dess publicering för icke-kommersiella ideella ändamål och i sådan skala, utan att dokumentet ändras eller något element läggs till"; och "d) tillhandahållande av länkar till EU:s webbplats där dokumentet publiceras". "Products" betyder programvara, enheter och mervärdestjänster "som använder OS Signal". Det sägs också: "Den behöriga personen får inte i något marknadsföringsmaterial eller på annat sätt hävda eller antyda att Products har utvecklats av EU, används av eller för EU eller har godkänts eller stötts av EU".

seg-8531368368ba = <b>Beslut ({ "0.36" }): distribueras inte vidare.</b> Ingen uttrycklig öppen licens anges. Användning inom en programvaruprodukt (G.3 a) och lagring med källan angiven (G.3 b) omfattas på ICD:ns egna villkor, men vidaredistribution (G.3 c) endast för icke-kommersiella, ideella ändamål och med villkoren och bilaga G återgivna oförändrade tillsammans med. Eftersom Kshana också erbjuds under en kommersiell licens har filerna tagits bort ur repositoriet och dess paket; motorn läser användarens egen kopia vid körning, och utan den ger Galileo E1-signalerna ett fel som förklarar hur de ska tillhandahållas. Varje användare förlitar sig direkt på EU:s tillstånd; Kshana kan inte föra det vidare. Kshana är inte utvecklad av Europeiska unionen, används inte av den och är varken godkänd eller stödd av den.

seg-e18986aeab7f = <b>Varumärken.</b> "Kshana" och dess märken är varumärken som tillhör Ashforde OÜ. Ingen av licenserna ger rättigheter till namnet eller märkena; forkar och derivatdistributioner måste använda ett annat namn. Se <a1><c1/></a1>.

seg-f6b7345c2c60 = Bidrag

seg-1709eb19c2c5 = Bidrag tas emot enligt projektets inkommande bidragsvillkor, som licensierar ditt bidrag under AGPL <b>och</b> ger Ashforde OÜ rätt att ta med det i den kommersiellt licensierade utgåvan (så att dubbellicensieringen fortsätter att fungera). Se <a1><c1/></a1>.

seg-940c8cce5137 = Frågor

seg-e678f2ecc571 = Licensfrågor, kommersiella offerter och "vilket alternativ gäller för oss?" → <b><a1>contact@ashforde.org</a1></b>.

seg-05d34a27a0ba = <s1>Föregående</s1>Ändringslogg

seg-4f7f660eea0a = <s1>Nästa</s1>Säkerhet

seg-2d2b32369c30 = Vad som inte omfattas av dubbellicensieringen
