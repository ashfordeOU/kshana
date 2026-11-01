# docs--mcp-http: translations (sv)

seg-c8bab9114d57 = Källa: <c1/>

seg-4bd138b7d28a = Köra kshana-mcp över HTTP (egen drift)

seg-7ca89d6e0201 = Ett stycke som nämner AI-klienter från tredje part är utelämnat här; det finns i <a1>docs/deploy/mcp-http.md</a1> på GitHub.

seg-2f5b3bdb7d0b = <b>Kshana tillhandahåller ingen slutpunkt.</b> Det finns ingen delad <c1/>-server att peka en klient mot. Du kör den på din egen maskin, i din egen container eller i ditt eget molnprojekt, och du äger dess åtkomstkontroll och kostnad. Servern { $version } är den som finns i det här förrådet: dess siffror bär sina etiketter VALIDATED eller MODELLED precis som över stdio.

seg-113a79ece785 = De säkra standardvärdena

seg-2bdbe06123c8 = Kontroll

seg-640f28207e8a = Beteende

seg-9bc8fe53a948 = Bindningsadress

seg-82001913f285 = Endast loopback (<c1/>, <c2/>). En ensam port (<c3/>) betyder <c4/>.

seg-f2adda2d3e22 = Kräver <c1/> <b>och</b> en bearer-token i miljövariabeln <c2/> ({ "16" } tecken eller fler). Utan båda vägrar servern att starta. Med båda skriver den ut en varning om att den lyssnar utanför den här maskinen.

seg-6fbe07565c36 = Autentisering

seg-d5cbeb0cd3d6 = <c1/> på varje begäran när en token är satt (den kan sättas på loopback också). Jämförs i konstant tid. Saknas den eller är fel: <c2/>.

seg-1962f434458b = Filsystem

seg-1a9e048d348d = Ingen. IQ-filverktygen (<c1/>) är avstängda i HTTP-läge vad <c2/> än säger; varje annat verktyg tar sitt scenario inbäddat och vägrar ett som anger en fil. Inget verktygsargument läser eller skriver en sökväg.

seg-19261cdd2ef0 = Kroppsstorlek

seg-c4db8c1454f4 = <c1/>, standard { "5" } MiB (scenariotaket är { "4" } MiB). Över den: <c2/>, oavsett om längden är deklarerad eller kroppen är chunkad.

seg-da9103d627dd = Svarstid

seg-3f013a632773 = <c1/>, standard { "120" }. Över den: <c2/>. <b>Det här begränsar hur länge en anropare väntar, inte arbetet</b>: en körning som redan pågår kan inte stoppas, så den fortsätter efter <c3/> och slutförs i bakgrunden.

seg-a588b12596b7 = Samtidighet

seg-aa2214db3bdc = <c1/>, standard { "8" }. Utöver den får en begäran <c2/> med <c3/> direkt; ingen köas.

seg-87576ded5272 = Arbetspool

seg-7f9c63e3e5e6 = Varje verktygsanrop körs på en blockerande tråd i en pool med <c1/> platser, aldrig på de asynkrona arbetarna, så en lång körning kan inte hindra servern från att svara. En plats frigörs först när själva körningen slutar, inte när anroparen ger upp: övergivna körningar kan därför inte hopa sig över poolens storlek, och ett anrop som finner poolen full avvisas som upptaget.

seg-4a97b035483c = Arbetsbudget

seg-91c788b33b25 = Ett scenario som ber om mycket mer än de medföljande exemplen avvisas innan det körs: fler än { "1000" } Monte Carlo-realisationer (<c1/>), ett parameterrutnät med fler än { "1000" } noder, fler än { "5000" } medlemskörningar (rutnätsnoder gånger realisationer), eller ett tidsrutnät med fler än { "2" } miljoner epoker. Felet anger vilket fält som ska sänkas. Samma budget gäller över stdio; kommandoraden <c2/> har ingen.

seg-79c6b146637c = CORS

seg-68fa7d9f1321 = Något <c1/>-huvud skickas aldrig. En begäran som bär ett <c2/>-huvud avvisas (<c3/>) om det inte anges med <c4/>; <c5/> accepteras inte.

seg-d7f157fdf003 = Host-huvud

seg-d7966e93ef1a = Kontrolleras mot loopback-namn, eller bindningsadressen plus varje <c1/>. Bakom en proxy eller på en plattforms-URL, ange <c2/>. Allt annat: <c3/>.

seg-12d5cf72f363 = Sessioner

seg-58dfe5665877 = Inga. Varje POST får ett JSON-svar; ingen sessionstabell och ingen server-sent-event-ström hålls öppen.

seg-adbc92ebc196 = TLS avslutas inte av <c1/>. När den kan nås utanför en enda maskin, sätt HTTPS framför den (din plattforms TLS, eller en omvänd proxy) och håll token hemlig; en bearer-token över vanlig HTTP kan läsas på tråden.

seg-1b21740b9c63 = Lokalt

seg-a6194f5a52f8 = Klientkonfiguration (en URL-klient; lägg till huvudet bara när en token är satt):

seg-a683980168f7 = Docker

seg-81df4f5cd02e = Inuti containern måste servern lyssna på <c1/>, så den behöver <c2/> och token. Att publicera porten som <c3/> håller den på din maskin; ta bort <c4/> bara när du menar att exponera den, och avsluta då TLS framför den. Mallar för <c5/> och Fly.io och Cloud Run finns i <a1><c6/></a1>.

seg-8b8bef7174e8 = Mallar (du driftsätter dem; Kshana kör inga)

seg-198bea1e0595 = <a1><c1/></a1>: sätt token med <c2/>

seg-c33701cb9ca2 = <a1><c1/></a1>: hämta token från Secret Manager

seg-b86ddb72b916 = Var och en kör den publicerade avbilden, sätter <c1/> till plattformens värdnamn som du ersätter i filen, och förlitar sig på plattformen för HTTPS.

seg-ce3a5326cb95 = Sätt en CPU- och minnesgräns på plattformen

seg-e1fc13672597 = Tidsgränsen, poolen och budgeten begränsar hur mycket arbete som släpps in, men ett insläppt anrop kan ändå använda en kärna under lång tid och ett stort resultat kan använda hundratals megabyte. Sätt en hård gräns på containern också: mallarna ber om { "2" } CPU:er och { "1" } GiB (<c1/> och <c2/> i Compose, <c3/> i Fly, <c4/> i Cloud Run). Håll <c5/> vid eller under antalet CPU:er.

seg-058781b052c4 = Vad den inte är

seg-90edc7ff2a55 = Ingen tjänst för flera hyresgäster. Den som har token kör simuleringar på din hårdvara; det finns inga kvoter per användare utöver gränserna ovan.

seg-5b3b9c610f31 = Rådgivande, inte typgodkänd navigationsutrustning: operatören är fortsatt ansvarig för navigeringen. Simulatorns utdata är modellerade eller validerade siffror för analys, som överallt annars i Kshana.

seg-c33947d44b06 = <s1>Föregående</s1>MCP-server: alla installationskanaler

seg-a9d67efe493a = <s1>Nästa</s1>Använda Kshana från en agent
