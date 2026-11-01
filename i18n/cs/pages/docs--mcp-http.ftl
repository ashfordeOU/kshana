# docs--mcp-http: translations (cs)

seg-c8bab9114d57 = Zdroj: <c1/>

seg-4bd138b7d28a = Provoz kshana-mcp přes HTTP (vlastní hosting)

seg-7ca89d6e0201 = Pasáž pojmenovávající klienty AI třetích stran je zde vynechána; je v <a1>docs/deploy/mcp-http.md</a1> na GitHubu.

seg-2f5b3bdb7d0b = <b>{ -brand } nehostuje žádný koncový bod.</b> Neexistuje sdílený server <c1/>, na který by se klient dal nasměrovat. Provozujete jej na vlastním stroji, v kontejneru nebo cloudovém projektu a vlastníte jeho řízení přístupu i náklady. Server { $version } je ten, který je v tomto repozitáři: jeho hodnoty nesou své štítky VALIDATED nebo MODELLED stejně jako přes stdio.

seg-113a79ece785 = Bezpečné výchozí hodnoty

seg-2bdbe06123c8 = Ovládací prvek

seg-640f28207e8a = Chování

seg-9bc8fe53a948 = Adresa pro navázání

seg-82001913f285 = Pouze loopback (<c1/>, <c2/>). Samotný port (<c3/>) znamená <c4/>.

seg-f2adda2d3e22 = Vyžaduje <c1/> <b>a</b> token typu bearer v proměnné prostředí <c2/> ({ "16" } znaků nebo více). Bez obojího server odmítne spustit. S obojím vypíše varování, že naslouchá i mimo tento stroj.

seg-6fbe07565c36 = Autentizace

seg-d5cbeb0cd3d6 = <c1/> při každém požadavku, pokud je token nastaven (lze jej nastavit i na loopbacku). Porovnává se v konstantním čase. Chybějící nebo chybný: <c2/>.

seg-1962f434458b = Souborový systém

seg-1a9e048d348d = Žádný. Nástroje pro soubory IQ (<c1/>) jsou v režimu HTTP vypnuty bez ohledu na to, co říká <c2/>; každý jiný nástroj přijímá svůj scénář vložený přímo a odmítne takový, který pojmenovává soubor. Žádný argument nástroje nečte ani nezapisuje cestu.

seg-19261cdd2ef0 = Velikost těla

seg-c4db8c1454f4 = <c1/>, výchozí { "5" } MiB (strop scénáře je { "4" } MiB). Nad ním: <c2/>, ať je délka deklarována, nebo je tělo dělené na části.

seg-da9103d627dd = Doba odpovědi

seg-3f013a632773 = <c1/>, výchozí { "120" }. Nad ním: <c2/>. <b>Toto omezuje, jak dlouho volající čeká, nikoli práci</b>: běh, který již probíhá, nelze zastavit, takže po <c3/> pokračuje a dokončí se na pozadí.

seg-a588b12596b7 = Souběžnost

seg-aa2214db3bdc = <c1/>, výchozí { "8" }. Nad ním požadavek dostane <c2/> s <c3/> okamžitě; žádný se neřadí do fronty.

seg-87576ded5272 = Fond práce

seg-7f9c63e3e5e6 = Každé volání nástroje běží na blokujícím vlákně uvnitř fondu o <c1/> slotech, nikdy na asynchronních pracovních vláknech, takže dlouhý běh nemůže zabránit serveru v odpovídání. Slot se uvolní, až když skončí samotný běh, nikoli když volající to vzdá: opuštěné běhy se proto nemohou hromadit nad velikost fondu a volání, které najde fond plný, je odmítnuto jako zaneprázdněné.

seg-4a97b035483c = Rozpočet práce

seg-91c788b33b25 = Scénář, který žádá mnohem víc než přibalené příklady, je odmítnut před během: více než { "1000" } realizací Monte Carlo (<c1/>), mřížka parametrů s více než { "1000" } uzly, více než { "5000" } členských běhů (uzly mřížky krát realizace) nebo časová mřížka s více než { "2" } miliony epoch. Chyba uvádí pole, které snížit. Stejný rozpočet platí přes stdio; příkazový řádek <c2/> žádný nemá.

seg-79c6b146637c = CORS

seg-68fa7d9f1321 = Hlavička <c1/> se nikdy neodesílá. Požadavek nesoucí hlavičku <c2/> je odmítnut (<c3/>), pokud není pojmenován pomocí <c4/>; <c5/> se nepřijímá.

seg-d7f157fdf003 = Hlavička Host

seg-d7966e93ef1a = Kontroluje se proti názvům loopbacku nebo adrese pro navázání plus každému <c1/>. Za proxy nebo na adrese URL platformy zadejte <c2/>. Cokoli jiného: <c3/>.

seg-12d5cf72f363 = Relace

seg-58dfe5665877 = Žádné. Každý POST dostane odpověď JSON; neudržuje se žádná tabulka relací ani otevřený proud server-sent events.

seg-adbc92ebc196 = <c1/> TLS neukončuje. Když je dosažitelný mimo jediný stroj, předřaďte mu HTTPS (TLS vaší platformy nebo reverzní proxy) a udržujte token v tajnosti; token typu bearer přes prosté HTTP lze na drátě přečíst.

seg-1b21740b9c63 = Místně

seg-a6194f5a52f8 = Konfigurace klienta (klient s URL; hlavičku přidejte, pouze když je nastaven token):

seg-a683980168f7 = Docker

seg-81df4f5cd02e = Uvnitř kontejneru musí server naslouchat na <c1/>, takže potřebuje <c2/> a token. Zveřejnění portu jako <c3/> jej ponechá na vašem stroji; <c4/> vynechejte, jen když jej chcete vystavit, a pak před něj předřaďte ukončení TLS. <c5/> a šablony pro Fly.io a Cloud Run jsou v <a1><c6/></a1>.

seg-8b8bef7174e8 = Šablony (nasazujete je vy; { -brand } žádnou neprovozuje)

seg-198bea1e0595 = <a1><c1/></a1>: token nastavte pomocí <c2/>

seg-c33701cb9ca2 = <a1><c1/></a1>: token vezměte ze Secret Manageru

seg-b86ddb72b916 = Každá spouští publikovaný obraz, nastavuje <c1/> na název hostitele platformy, který v souboru nahradíte, a pro HTTPS se spoléhá na platformu.

seg-ce3a5326cb95 = Nastavte na platformě limit CPU a paměti

seg-e1fc13672597 = Časový limit, fond a rozpočet omezují, kolik práce se připustí, ale jedno připuštěné volání může stále dlouho využívat jádro a velký výsledek může zabrat stovky megabajtů. Nastavte pevný limit i na kontejneru: šablony žádají { "2" } CPU a { "1" } GiB (<c1/> a <c2/> v Compose, <c3/> ve Fly, <c4/> v Cloud Run). Držte <c5/> na počtu CPU nebo pod ním.

seg-058781b052c4 = Čím není

seg-90edc7ff2a55 = Není to služba pro více nájemců. Každý, kdo drží token, spouští simulace na vašem hardwaru; nad rámec výše uvedených limitů neexistují kvóty pro jednotlivé uživatele.

seg-5b3b9c610f31 = Pouze poradní charakter, nikoli typově schválené navigační zařízení: za navigaci zůstává odpovědný provozovatel. Výstupy simulátoru jsou hodnoty pro analýzu, buď vypočtené z modelu, nebo ověřené proti nezávislé vnější referenci, jako všude jinde v { -brand }.

seg-c33947d44b06 = <s1>Předchozí</s1>Server MCP: každý instalační kanál

seg-a9d67efe493a = <s1>Další</s1>Používání { -brand } z agenta
