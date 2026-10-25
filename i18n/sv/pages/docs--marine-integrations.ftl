# docs--marine-integrations: translations (sv)

seg-2e34ace70d11 = Signal K-plugin

seg-0857a94a948e = Begränsningar

seg-2247a2344710 = Betydelse

seg-c3c260b7063e = Tester

seg-06ff6eed7e99 = OpenCPN

seg-ab1af8b3d968 = se ovan

seg-c353e7bec219 = Nyckel

seg-df52127d74b6 = Var

seg-7670cf4ceda3 = Standardvärde

seg-7e304f816037 = Källa: <c1/>

seg-fb2b0841a172 = Marina integrationer: förtroendepoängen på bryggan

seg-a88b3968c706 = Kshanas maritima förtroendepoäng (<a1><c1/></a1>) kan nås från programvara som båtägare redan kör: ett insticksprogram för servern <b>Signal K</b> och <b>OpenCPN</b> via NMEA i gate-läge över TCP. En referensbyggnad placerar den på en liten dator bredvid mottagaren.

seg-eb8043b9e269 = <b>Rådgivande programvara.</b> Kshana är inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }) och har inte bedömts mot någon prestandastandard. Allt på den här sidan är ett stöd för navigatörens omdöme. Operatören är fortsatt ansvarig för fartygets säkra navigering och för varje beslut att lita på, eller att sluta lita på, en positionsbestämning. Ingenting här sänder, och ingenting här gör en positionsbestämning mer exakt.

seg-dab66f260e56 = Del

seg-40fd2019e974 = Status i { "0.35" }

seg-7bcecf49199c = levererad, enhetstestad på inspelade syntetiska utdata; inte publicerad på npm

seg-d5278e683d37 = OpenCPN via NMEA i gate-läge över TCP

seg-a876f5d43e39 = levererad och testad (uppspelning på konsumentsidan); själva OpenCPN:s användargränssnitt styrs inte av något test

seg-4a6d2f45b403 = Inbyggt insticksprogram för poängpanel i OpenCPN

seg-b0d4d32612e9 = byggd, logiken enhetstestad och körd inuti OpenCPN { "5.8.4" } under en virtuell skärm (belägg i <c1/>); inte paketerad för insticksprogramhanteraren; levereras först efter granskning

seg-2e0058b5e057 = Referensbyggnad

seg-959d93e3a56d = delar, OS-steg, systemd-enheter (kontrollerade med dry-run), ett containeralternativ; inte testad på ett fartyg

seg-8524cb32f0a3 = Allt läser en enda sak: utdata från <c1/> (JSON-rader, meningen <c2/>, gaten). Trådformaten finns i <a1><c3/></a1>. Signal K-insticksprogrammet samlar sin kunskap om dem i en enda fil, <c4/>; en formatändring är en ändring i en fil.

seg-e5b08ab63d78 = Inga npm-beroenden. Själva insticksprogrammet körs på Node { "18" } eller nyare; aktuella versioner av <c1/> kräver Node { "22" } eller nyare, så i praktiken använder du { "22" }. Kopiera eller länka <c2/> till serverns <c3/> (till exempel <c4/>), starta om servern och aktivera <b>Kshana GNSS trust</b> under Server, Plugin Config.

seg-fd80525d7dd1 = Varifrån epokerna kommer (<c1/>)

seg-013478c9a701 = Vad insticksprogrammet gör

seg-abbd00e9cacf = <c1/> (standard)

seg-8ca5f95ed09d = Kör <c1/> och skriver varje rå NMEA { "0183" }-mening som servern tar emot (serverns <c2/>-händelse) till dess standardindata. Startar om det, med back-off, om det avslutas | <b>Använd det bara på en server med en enda NMEA-källa</b>: det matar in varje mening från varje leverantör, sammanflätade, så en andra GNSS-mottagare eller AIS ser ut som en mottagare vars position hoppar och kan poängsättas som spoofing. Med fler än en källa använder du <c3/> med den mottagarens egen ström <c4/>, eller <c5/> från en gate.

seg-3b3eadcffb90 = Kör <c1/>, till exempel <c2/> eller <c3/>

seg-d69b5ebe1042 = Ansluter till en ström av de JSON-rader som <c1/> skriver (till exempel från reläet i <c2/>)

seg-cd5a419844cc = Ansluter till en NMEA-ström (till exempel gate-utdata från tjänsten eller containern i referensbyggnaden, port { "10110" }) och läser bara dess <c1/>-meningar

seg-f17c9b7d7abc = En ström som redan utsätts för spoofing när övervakaren först ansluter har ingen ren baslinje (de första <c1/> sekunderna poängsätts aldrig). Starta den före resan.

seg-33fc47100aa6 = Publicerade sökvägar

seg-f032afe8b331 = Varje epok uppdaterar (källa <c1/>):

seg-b809eaf502ad = Sökväg

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> eller <c4/>

seg-d4d4d5d5ec1f = { "0" } till { "100" }, eller <c1/> under kalibrering

seg-5280497b5d9f = <c1/>, största först: vilka kontroller som sänkte poängen

seg-6089a3166c91 = de övervakare som för närvarande ligger över sin tröskel

seg-55280b62eb19 = <c1/>, <c2/> eller <c3/> (när en gate körs någon annanstans; <c4/> från <c5/> när den saknas)

seg-963da9c0d2a3 = <c1/>: den position som mottagaren under test rapporterade vid epoken (JSON-schema { "1.1" } eller senare; publiceras inte när strömmen inte bär någon, till exempel från <c2/> eller en äldre <c3/>). <b>Endast som förtroendekontext</b>: insticksprogrammet skriver aldrig <c4/>, så fartygets egen positionssökväg lämnas orörd

seg-50599cef740d = utlöses när tillståndet ändras: <c1/>

seg-ad58b4599f78 = Insticksprogrammet skickar också Signal K-metadata för de här sökvägarna en gång vid start. <c1/> är Kshanas förtroendepoäng från { "0" } till { "100" }, en poäng och inte en kvot eller en sannolikhet, så den har ingen SI-enhet; dess metadata anger intervallet, en beskrivning och zoner som följer tröskelvärdena nedan. <c2/> är poängenheter som dras av från den poängen på { "0" } till { "100" }.

seg-bf0c90f5c02a = Notifieringen är <c1/>, <c2/>, <c3/> eller <c4/>. Den rensas genom att tillståndet <c5/> publiceras, inte <c6/>: en konsument som bara behandlar <c7/> som rensad bör behandla <c8/> som rensad också. Som standard ger bandet <b>degraded</b> <c9/> och bandet <b>untrusted</b> ger <c10/>, med <c11/>. Den sänks efter <c12/> epoker i ett bättre tillstånd. Om ingen epok anländer på <c13/> sekunder varnar den för att poängen inte uppdateras. Kalibrering utlöser aldrig en notifiering. Källan <c14/> har ingen lista <c15/> (meningen har bara bandet, poängen och de två främsta orsakerna).

seg-89cdf02b58e3 = Konfiguration (varje tröskel)

seg-d7bdd78470ec = den körbara filen (spawn-lägen). <b>Den kör vilken körbar fil som helst som serverns användare</b>: bara en administratör för Signal K-servern bör kunna ändra insticksprogrammets konfiguration

seg-73091c431bcf = fartygets gränser, trösklar och poängvikter (spawn-lägen)

seg-f5f08c50abc7 = argument som läggs till i <c1/> i båda spawn-lägena: indata för <c2/>, extra flaggor som <c3/> (en lagrad logg som matas snabbare än realtid) för <c4/>. Insticksprogrammet vägrar <c5/>, <c6/>, <c7/> och <c8/> (det läser <c9/>s JSON på standardutdata), och för <c10/> också indataflaggorna (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

seg-01caf7ed213f = TCP-lägen (gaten serverar på { "10110" }: ange porten för <c1/>)

seg-72b911dea6bd = <c1/>: det band som Kshana rapporterar, med gränserna i sessionsfilen. <c2/>: de två poängen nedan

seg-76ca56821979 = Läget <c1/>: under detta är tillståndet <c2/> (Kshanas standardgräns för nominal)

seg-429d8fc4570f = Läget <c1/>: under detta är tillståndet <c2/> (Kshanas standardgräns för degraded)

seg-6d5c9e402211 = tillstånd för bandet degraded: <c1/>, <c2/> eller <c3/>

seg-e88a2979ef07 = på varandra följande epoker i ett sämre tillstånd innan notifieringen utlöses

seg-0eec67224385 = på varandra följande epoker i ett bättre tillstånd innan den sänks

seg-76b52e312539 = varna när ingen epok anländer på så här lång tid; <c1/> stänger av det

seg-87d3fcf7fec9 = notifieringsmetoder

seg-9a455cf4a2f9 = Insticksprogrammet gatar inte: det ändrar aldrig en positionsbestämning. Att markera en positionsbestämning som ogiltig för ett kartsystem är gaten, nedan.

seg-30f48b177c1c = <c1/>, inga beroenden, inget nätverk utöver <c2/>. Testerna tolkar och spelar upp ett utdrag på 66 epoker av de JSON-rader och <c3/>-meningar som <c4/> skrev för den syntetiska Östersjödemon (påhittade data, endast text), och kontrollerar överensstämmelsen mellan de två formaten, håll- och rensningsbeteendet, poängläget, inaktualitet och de tre indatavägarna mot ett lokalt flöde och en stand-in-barnprocess. Testerna startar ingen verklig Signal K-server; en separat skriptad körning gör det, se nedan.

seg-024928983177 = Körning i en verklig Signal K-server

seg-80b5a217d13c = <c1/> innehåller ett skript som läser in insticksprogrammet i det fästa paketet <c2/> { "2.33.0" } (i ett privat nätverksnamnrymd med endast loopback) och registrerar vad serverns egna REST- och WebSocket-API:er visar. Förtroendesökvägarna visas, notifieringen går warn, alarm, normal (efter hållet) och warn igen när data upphör, och med verkliga <c3/> matad av serverns egen NMEA-indata publicerade den också <c4/>, aldrig <c5/>. En serverversion, en körning, inget verkligt fartyg; begränsningar och reproduktion finns i belägg-README.

seg-fea2e7d140c3 = OpenCPN läser NMEA från nätverket, och <c1/> kan själv servera den gatade strömmen på en TCP-port.

seg-92981e13bc6f = Rekommenderas: den direkta anslutningen.

seg-e6caa4d53b9a = (<c1/> är mottagarens serieport läst med <c2/> och <c3/>, en multiplexer, eller indata <c4/>/<c5/> i <c6/> självt; referensbyggnadens <c7/> gör detta under systemd.) <c8/> binder loopback-adressen; valfritt antal skrivskyddade klienter kan ansluta, och en som inte hinner med kopplas bort utan att fördröja de andra.

seg-311e4379acf1 = Alternativ: reläet.

seg-11b4c4791f55 = <c1/> är en beroendefri Node-fan-out som gör detsamma för en <c2/> utan <c3/>, eller serverar vilken annan radström som helst (containeralternativet använder den för JSON-epokerna):

seg-93cb82966313 = Den vidarebefordrar byte oförändrade, bara hela rader, och kopplar bort en klient som inte läser. Föredra den direkta anslutningen: en process mindre i kedjan.

seg-4226afc6175c = I OpenCPN: Options, Connections, Add Connection, <b>Network</b>, protokoll <b>TCP</b>, adress <c1/>, port <c2/>, riktning <b>Input</b>. Så länge förtroendet inte har kollapsat är strömmen mottagarens egen, plus en <c3/>-mening per cykel. När det har kollapsat har den vidarebefordrade GGA kvalitet <c4/>, RMC status <c5/>, och lägesindikatorerna anger ingen positionsbestämning, med omräknade kontrollsummor: utrustningen ser att mottagaren själv förklarar positionsbestämningen ogiltig och utlöser sitt eget larm. Meningarna <c6/> syns i OpenCPN:s NMEA-felsökningsfönster (Options, Connections, "NMEA debug window"). Positionsfälten lämnas som de togs emot.

seg-8549d49f1b2c = Läs "Gate mode" i <a1><c1/></a1> innan du förlitar dig på detta: det är ett tillval, ger fördröjning (en cykel hålls tills dess epok har poängsatts), är en enskild punkt i kedjan och kan hålla tillbaka en bra positionsbestämning lika väl som släppa igenom en förfalskad.

seg-533a911141d6 = <c1/> spelar upp ett inspelat utdrag av den syntetiska gatade strömmen ({ "186" } meningar kring det ögonblick då förtroendet kollapsar, skrivna av <c2/>) genom reläet över en verklig TCP-socket och kontrollerar vad en konsument tar emot: strömmen byte för byte under godtycklig styckning; giltiga kontrollsummor på varje mening, även omskrivna; GGA och RMC som är överens, giltiga och sedan ogiltiga utan flimmer; en <c3/> per cykel med sitt gate-fält <c4/> exakt där positionsbestämningen är ogiltig; två identiska konsumenter; en ofullständig rad vidarebefordras aldrig. Detta kontrollerar den ström OpenCPN får, inte OpenCPN:s egen skärm.

seg-12fc91a3f69b = En kontroll från början till slut med den verkliga binären, inte en del av standardtesterna (den kräver en byggd <c1/>):

seg-fea419a50c52 = Båda kör den syntetiska demon på en timme och kontrollerar att positionsbestämningen blir giltig, sedan ogiltig, med en <c1/> per epok.

seg-e76c11d8f003 = Inbyggt insticksprogram

seg-7a5ac2d2f229 = <c1/> är en poängpanel för OpenCPN (poäng, band, gate, främsta orsaker, en varning när förtroendet blir untrusted) som läser <c2/> från OpenCPN:s egen NMEA-ström, så den behöver ingen annan anslutning än den ovan. Den byggs med CMake mot OpenCPN:s API-header för insticksprogram (medföljer, med sin källcommit) och wxWidgets; <c3/> kör de wx-fria logiktesterna och kontrollerar att biblioteket exporterar de ingångspunkter som OpenCPN slår upp. Den har körts inuti OpenCPN { "5.8.4" } under en virtuell skärm på den syntetiska gatade strömmen (OpenCPN gav <c4/> till insticksprogrammet, panelen blev röd och OpenCPN:s egen position frös när gaten slog till; skärmbilder, logg och skript i <c5/>), men inte på ett verkligt skrivbord, andra versioner eller plattformar, och den är inte paketerad för OpenCPN:s insticksprogramhanterare. Se insticksprogrammets <a1><c6/></a1>. Den är licensierad under GPL-3.0-or-later, till skillnad från resten av förrådet (<a2><c7/></a2>).

seg-a2adfa7ff5fb = Skärmbilder från den körningen, i <c1/> (en körning, OpenCPN { "5.8.4" } under en virtuell skärm, syntetiska data; <a1><c2/></a1> anger begränsningarna):

seg-ee5e8bb5a734 = OpenCPN:s kartfönster som kör insticksprogrammet Kshana score panel på den syntetiska gatade strömmen, före förtroendekollapsen: ingen panel är öppen (den öppnar sig själv vid larm), fartygets position i statusfältet lyder { "54" } { "32.4659" } N { "018" } { "46.1670" } E med hastighet { "16.48" } kn och kurs { "088" }, och positionsindikatorn uppe till höger visar tre staplar.

seg-1189d82affbb = Samma OpenCPN-fönster efter kollapsen: panelen Kshana är öppen i rött med poängen { "47" } och ordet UNTRUSTED, raderna gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 och age { "2" } s, och uttalandet att detta är rådgivande programvara, inte typgodkänd navigationsutrustning och att operatören är fortsatt ansvarig. Statusfältet lyder fortfarande { "54" } { "32.4672" } N { "018" } { "46.2227" } E, och positionsindikatorn har sjunkit till två staplar.

seg-90c7cdee8892 = OpenCPN matat direkt av kshana receiver-trust live --gate --listen: panelen Kshana är öppen i rött med poängen { "44" } och UNTRUSTED, raderna gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 och age { "1" } s, samt det rådgivande uttalandet. Den här körningen stöder inte observationen att positionen fryser: OpenCPN höll fortfarande på att arbeta av den inledande skuren av epoker.

seg-dce06383cde1 = Dessa visar ledningsdragningen och att den gatade positionsbestämningen når OpenCPN, inte att något larm är i rätt tid eller korrekt för ett verkligt fartyg. Rådgivande programvara, inte typgodkänd utrustning.

seg-f9f39d089438 = <a1><c1/></a1>: en generisk dellista, OS-installation, två systemd-enheter (den rådgivande övervakaren och den valfria gaten), ett containeralternativ och Signal K-kopplingen. <c2/> kör <c3/> på enheterna utan att starta något.

seg-5e2a2e8af941 = Poängen är bara så bra som kontrollerna bakom den, som tittar på ett fartygs fysik och dess andra sensorer; en självkonsistent förfalskning med en matchande klocka ses inte av övervakare som bara använder NMEA (<a1><c1/></a1>). Frånvaro av larm är inget belägg för en bra positionsbestämning.

seg-be1ed291f7c3 = Ingen siffra på den här sidan är en uppmätt detektions- eller falsklarmsfrekvens. Testerna ovan kontrollerar ledningsdragningen på syntetisk text; de säger ingenting om hur någon övervakare klarar sig mot verklig störning.

seg-97d775b504c6 = Inte typgodkänd; operatören är fortsatt ansvarig.

seg-69222f7d5068 = <s1>Föregående</s1>Störningskarta: datakällor och licenser

seg-8eba9835d7df = <s1>Nästa</s1>Himlageometri och siluetter

seg-2093a1d8a24e = Varifrån epokerna kommer (source)
