# docs--studio: translations (cs)

seg-c3c260b7063e = Testy

seg-ca497f6e51d4 = Zdroj: <c1/>

seg-256705861db0 = Web kshana.dev

seg-82b7ed4e70af = <c1/> je strom, který GitHub Pages poskytuje jako <a1>https://kshana.dev</a1>: stránky (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), dokumentace v <c8/> a Kshana Studio v <c9/> (dostupné na <a2>https://kshana.dev/studio/</a2>), aplikace, která spouští engine v prohlížeči jako WebAssembly (WASM) bez výpočtů na straně serveru a bez čehokoli nahrávaného. Studio má dva pohledy na jeden engine: jednoduchý pohled (<c10/>, nejprve odpověď prostými slovy) a pokročilý pohled (<c11/>, úplný panel), který s jednoduchým pohledem sdílí engine, worker, moduly a data přes <c12/>.

seg-2b76ce9ee32c = Od verze { "0.35.0" } má Studio čtyři další pohledy, každý jako samostatnou stránku s <c1/>, bez indexování vyhledávači a s adresářem syntetických vzorků, které čte jeho test:

seg-e3d0762bb726 = <c1/>: námořní pohled na důvěru, skóre důvěryhodnosti přijímače pro proud poloh plavidla, s ukázkovou stopou v <c2/>.

seg-e608cdeac977 = <c1/>: rozbor tréninku posádky, přehrávání syntetického NMEA s událostí rušení, odtažení, podvržení času nebo přehrání (<c2/>).

seg-f2ce6a93a58d = <c1/>: mapa interference a expozice trasy (<c2/>).

seg-3f6cf51eb439 = <c1/>: jedna stránka karet nástrojů s příklady (<c2/>, <c3/>), včetně podepsaných balíčků důkazů (<c4/>), exportu pro testovací stolici (<c5/>), mapování compliance (<c6/>), ověřování Galileo OSNMA (<c7/>) a kanálů asistenta AI (<c8/>).

seg-fb02aba9149f = Odkud soubory pocházejí

seg-a58fb92bab82 = Žijí zde tři druhy souborů a mění se třemi různými způsoby.

seg-d404d216114c = <b>Přenesené soubory.</b> Stránky, <c1/>, <c2/>, <c3/>, <c4/>, data webu v <c5/> (<c6/>, <c7/>, <c8/>) a vše v <c9/> zapisuje <c10/> ze sestavení webu a ze zdroje Studia. <c11/> uvádí každý z nich s kontrolním součtem SHA-256 (Secure Hash Algorithm, 256 bitů). <b>Neupravujte je zde</b>: <c12/> selže při ruční úpravě. Změňte zdroj a spusťte přenos znovu:

seg-b681e66130e5 = Přenos je deterministický: druhý běh nezapíše nic a <c1/> skončí s kódem { "1" }, pokud <c2/> neodpovídá tomu, co by přenos zapsal. Beze změny přebírá soubory pro procházení ze sestavení webu (kanonické, sociální karty a značky schema.org každé stránky, <c3/>, <c4/>, <c5/>, <c6/>), kontroluje je, zapisuje <c7/>, <c8/> a přesměrovací stránku na staré adrese Studia (<c9/>, na <c10/>) a každou stránku nasměruje na místní písma a skriptové knihovny (viz níže).

seg-9be72ec8d40e = <b>Soubory, které vlastní <c1/>.</b> Jsou to samostatné zdroje a přenos se jich nikdy nedotkne:

seg-23b6ea71fede = <c1/> je strukturovaný zdroj pro karty schopností a mřížku standardů. <b>Upravujte jej, nikoli HTML.</b>

seg-e1ee8cd0af21 = <c1/> se generuje (<c2/>) a je zajištěn testem <c3/>; neupravujte jej ručně. <c4/>, <c5/> a <c6/> jsou ručně udržovaná mapování, která tentýž test kontroluje proti vygenerované matici. Kopie Studia v <c7/> jsou tyto soubory, bajt po bajtu.

seg-8901229c76ba = <c1/>, <c2/> a <c3/> tvoří sociální kartu (<c4/>).

seg-89d78af0258c = <c1/> a <c2/>: soubory písem a skriptová knihovna, které stránky používají, jednou stažené pomocí <c3/> a commitnuté (viz „Žádné požadavky na třetí strany“).

seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> a <c5/>.

seg-5071806d230f = <b>Výstupy sestavení</b>, ignorované gitem a vytvářené pomocí <c1/>: <c2/> (balíček <c3/>, z něhož se sestavuje i balíček npm), <c4/> (týž balíček tam, kde jej Studio importuje) a <c5/> (každý referenční scénář na adrese, ze které je dřívější jednostránkový web poskytoval).

seg-5042f55f78b5 = Sestavení a lokální provoz

seg-f393a52f7794 = Bez nástrojů WASM <c1/> místo kompilace připraví existující balíček. Workflow Pages to nikdy nepoužívá.

seg-35094cb7ed04 = Každý modul v <c1/> je čistá logika s odpovídajícím <c2/>; ovladače DOM (Document Object Model, strom prvků stránky) Studia jsou <c3/> (jednoduchý pohled) a <c4/> (pokročilý pohled). Kontinuální integrace spouští každý z nich jako samostatný krok a selže, pokud testovací soubor v <c5/> nemá krok.

seg-ba24be498f87 = Žádné požadavky na třetí strany

seg-7215806f98d4 = kshana.dev poskytuje vlastní písma, styly a skripty. Stránka nevysílá žádný požadavek na hostitele písem ani skriptů, takže adresa návštěvníka není žádnému z nich předána.

seg-30fc8da50592 = Web a Studio jsou psány pro Google Fonts a hostitele skriptů. Přenos nahradí odkaz na Google Fonts na každé stránce odpovídající šablonou stylů v <c1/> (stejná pravidla <c2/> a stejné soubory písem, každá podmnožina, takže se text vykresluje jako dříve) a každou adresu hostitele skriptů souborem v <c3/>. <c4/> a <c5/> zaznamenávají, odkud každý soubor pochází, a jeho kontrolní součet; písma jsou pod licencí SIL Open Font License (<c6/>) a three.js pod licencí MIT (<c7/>).

seg-68a02a54db3b = <c1/> je jediný krok, který používá síť. Spusťte jej znovu, až když stránka žádá sadu písem nebo verzi knihovny, která zde není: přenos odmítne a oznámí to. <c2/> selže, pokud kterákoli přenesená stránka, šablona stylů nebo skript uvádí hostitele písem nebo načítá cokoli z jiného hostitele.

seg-4ff8a4accad4 = Stránka { "404" }

seg-763503746a48 = GitHub Pages odpovídá na chybějící adresu stránkou <c1/> a stavem { "404" }. Přenos tuto stránku vytvoří z vlastního rámce domovské stránky (navigace, patička, hledání) kolem krátké zprávy s odkazy na Domů, Dokumentaci a Studio. Každá adresa v ní je psána od kořene webu, protože se poskytuje v libovolné hloubce.

seg-9126631f595b = Staré adresy

seg-a64ed190233a = Do { "v0.28.0" } byl web jedinou stránkou a vše žilo za fragmentem na <c1/> (<c2/>, <c3/>, sdílené odkazy jako <c4/>, vložení jako <c5/>; starý název karty v odkazu vložení, například <c6/>, otevře kartu Studia, která ji nahradila). <c7/> uvádí každou takovou adresu, kterou zveřejněné materiály používají, a kam dnes vede; domovská stránka načítá <c8/>, vygenerovaný z tohoto seznamu, aby je tam odeslala. Před vyřazením jakékoli adresy přidejte do seznamu případ.

seg-a9db9b0675e2 = Nasazení

seg-0316a3f12053 = Workflow GitHub Actions <c1/> nasazuje značku vydání, nikoli <c2/>: <c3/> jej spustí po zveřejnění vydání a ruční spuštění znovu nasadí pojmenovanou značku. Spouští <c4/>, připraví <c5/> bez testů, skriptu sestavení, <c6/>, manifestu a tohoto souboru a výsledek publikuje na GitHub Pages.

seg-6aa2e78078ae = <s1>Předchozí</s1>Glosář

seg-419353a4fb30 = <s1>Další</s1>Tutoriály
