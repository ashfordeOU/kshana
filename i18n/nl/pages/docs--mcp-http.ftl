# docs--mcp-http: translations (nl)

seg-c8bab9114d57 = Bron: <c1/>

seg-4bd138b7d28a = kshana-mcp uitvoeren via HTTP (zelf gehost)

seg-7ca89d6e0201 = Een passage waarin AI-clients van derden worden genoemd, is hier weggelaten; ze staat in <a1>docs/deploy/mcp-http.md</a1> op GitHub.

seg-2f5b3bdb7d0b = <b>Kshana host geen endpoint.</b> Er is geen gedeelde <c1/>-server waarnaar een client kan verwijzen. U draait hem op uw eigen machine, container of cloudproject en u beheert zelf de toegangscontrole en de kosten. De server van { $version } is die in deze repository: zijn cijfers dragen hun labels VALIDATED of MODELLED precies zoals via stdio.

seg-113a79ece785 = De veilige standaardwaarden

seg-2bdbe06123c8 = Maatregel

seg-640f28207e8a = Gedrag

seg-9bc8fe53a948 = Bindadres

seg-82001913f285 = Alleen loopback (<c1/>, <c2/>). Een kale poort (<c3/>) betekent <c4/>.

seg-f2adda2d3e22 = Vereist <c1/> <b>en</b> een bearer-token in de omgevingsvariabele <c2/> ({ "16" } tekens of meer). Zonder beide weigert de server te starten. Met beide toont hij een waarschuwing dat hij buiten deze machine luistert.

seg-6fbe07565c36 = Authenticatie

seg-d5cbeb0cd3d6 = <c1/> bij elk verzoek wanneer een token is ingesteld (dat kan ook op loopback). Vergeleken in constante tijd. Ontbrekend of onjuist: <c2/>.

seg-1962f434458b = Bestandssysteem

seg-1a9e048d348d = Geen. De IQ-bestandshulpmiddelen (<c1/>) staan in HTTP-modus uit, wat <c2/> ook zegt; elk ander hulpmiddel neemt zijn scenario inline en weigert een scenario dat een bestand noemt. Geen enkel hulpmiddelargument leest of schrijft een pad.

seg-19261cdd2ef0 = Omvang van de body

seg-c4db8c1454f4 = <c1/>, standaard { "5" } MiB (de scenariolimiet is { "4" } MiB). Daarboven: <c2/>, of de lengte nu is opgegeven of de body in delen wordt verzonden.

seg-da9103d627dd = Antwoordtijd

seg-3f013a632773 = <c1/>, standaard { "120" }. Daarboven: <c2/>. <b>Dit begrenst hoe lang een aanroeper wacht, niet het werk</b>: een run die al bezig is, kan niet worden gestopt, dus hij gaat door na de <c3/> en wordt op de achtergrond afgerond.

seg-a588b12596b7 = Gelijktijdigheid

seg-aa2214db3bdc = <c1/>, standaard { "8" }. Daarboven krijgt een verzoek direct <c2/> met <c3/>; niets wordt in een wachtrij gezet.

seg-87576ded5272 = Werkpool

seg-7f9c63e3e5e6 = Elke aanroep van een hulpmiddel draait op een blokkerende thread binnen een pool van <c1/> slots, nooit op de asynchrone workers, zodat een lange run de server niet kan beletten te antwoorden. Een slot komt pas vrij wanneer de run zelf eindigt, niet wanneer de aanroeper het opgeeft: verlaten runs kunnen zich dus niet boven de poolgrootte opstapelen en een aanroep die de pool vol aantreft, wordt als bezet geweigerd.

seg-4a97b035483c = Werkbudget

seg-91c788b33b25 = Een scenario dat veel meer vraagt dan de meegeleverde voorbeelden, wordt geweigerd voordat het draait: meer dan { "1000" } Monte Carlo-realisaties (<c1/>), een parameterraster van meer dan { "1000" } knooppunten, meer dan { "5000" } ledenruns (rasterknooppunten maal realisaties) of een tijdraster van meer dan { "2" } miljoen epochs. De fout noemt het veld dat verlaagd moet worden. Hetzelfde budget geldt via stdio; de opdrachtregel van <c2/> kent er geen.

seg-79c6b146637c = CORS

seg-68fa7d9f1321 = Er wordt nooit een <c1/>-header verzonden. Een verzoek met een <c2/>-header wordt geweigerd (<c3/>), tenzij het met <c4/> is genoemd; <c5/> wordt niet geaccepteerd.

seg-d7f157fdf003 = Host-header

seg-d7966e93ef1a = Gecontroleerd tegen loopbacknamen, of het bindadres plus elke <c1/>. Achter een proxy of op een platform-URL geeft u <c2/> mee. Al het andere: <c3/>.

seg-12d5cf72f363 = Sessies

seg-58dfe5665877 = Geen. Elke POST krijgt een JSON-antwoord; er wordt geen sessietabel bijgehouden en geen server-sent-event-stroom opengehouden.

seg-adbc92ebc196 = TLS wordt niet beëindigd door <c1/>. Wanneer de server buiten één machine bereikbaar is, plaatst u er HTTPS voor (de TLS van uw platform, of een reverse proxy) en houdt u het token geheim; een bearer-token via gewoon HTTP kan van de lijn worden gelezen.

seg-1b21740b9c63 = Lokaal

seg-a6194f5a52f8 = Clientconfiguratie (een URL-client; voeg de header alleen toe wanneer een token is ingesteld):

seg-a683980168f7 = Docker

seg-81df4f5cd02e = In de container moet de server luisteren op <c1/>, dus hij heeft <c2/> en het token nodig. Door de poort als <c3/> te publiceren blijft hij op uw machine; laat de <c4/> alleen weg wanneer u hem wilt blootstellen en beëindig TLS dan vóór de server. Sjablonen voor <c5/>, Fly.io en Cloud Run staan in <a1><c6/></a1>.

seg-8b8bef7174e8 = Sjablonen (u implementeert ze zelf; Kshana draait er geen)

seg-198bea1e0595 = <a1><c1/></a1>: stel het token in met <c2/>

seg-c33701cb9ca2 = <a1><c1/></a1>: haal het token uit Secret Manager

seg-b86ddb72b916 = Elk draait de gepubliceerde image, stelt <c1/> in op de hostnaam van het platform die u in het bestand vervangt, en rekent voor HTTPS op het platform.

seg-ce3a5326cb95 = Stel op het platform een CPU- en geheugenlimiet in

seg-e1fc13672597 = De timeout, de pool en het budget begrenzen hoeveel werk wordt toegelaten, maar één toegelaten aanroep kan nog steeds lange tijd een kern gebruiken en een groot resultaat kan honderden megabytes gebruiken. Stel ook een harde limiet op de container in: de sjablonen vragen { "2" } CPU's en { "1" } GiB (<c1/> en <c2/> in Compose, <c3/> in Fly, <c4/> in Cloud Run). Houd <c5/> op of onder het aantal CPU's.

seg-058781b052c4 = Wat het niet is

seg-90edc7ff2a55 = Geen multi-tenantdienst. Wie het token heeft, draait simulaties op uw hardware; er zijn geen quota per gebruiker buiten de bovenstaande limieten.

seg-5b3b9c610f31 = Adviserend, geen typegoedgekeurde navigatieapparatuur: de exploitant blijft verantwoordelijk voor de navigatie. De uitvoer van de simulator bestaat uit gemodelleerde of gevalideerde cijfers voor analyse, zoals overal elders in Kshana.

seg-c33947d44b06 = <s1>Vorige</s1>MCP-server: elk installatiekanaal

seg-a9d67efe493a = <s1>Volgende</s1>Kshana gebruiken vanuit een agent
