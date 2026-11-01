# docs--i18n: translations (cs)

seg-c3c260b7063e = Testy

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Zatím ne na GitHubu

seg-26b562e7f535 = Zdroj: <c1/>

seg-60b2e78c882e = Lokalizace enginu

seg-7f3a6f2932c2 = Text enginu určený lidem je v { "17" } jazycích vedle angličtiny: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. Zdrojem je angličtina; <c1/> je pseudolokalizace, která každou zprávu opatří diakritikou, závorkami a výplní, aby test mohl zjistit, zda se text přesunul do katalogu. Frameworkem je <a1>Project Fluent</a1> (<c2/>, <c3/>); kód je <c4/>.

seg-1ed9fde69630 = Co se lokalizuje a co nikdy

seg-1cb6eb25338d = Lokalizuje se (čte to člověk)

seg-ab884f59f5f3 = Nikdy se nelokalizuje (čte to program)

seg-dbe9b8a0ed98 = zprávy a chyby příkazového řádku

seg-711a8e63c1de = klíče a hodnoty JSON v <c1/> a <c2/>

seg-a4066ef82152 = souhrnný řádek každého běhu

seg-6fbdf82a22dc = hlavičky a řádky CSV

seg-8d08a6f5f16f = text grafů SVG (názvy, osy, legendy, popisky)

seg-8ad1234dfb18 = názvy souborů

seg-777c2587e0da = <c1/>: nadpisy, tabulky, poznámky, popisky

seg-d5cf8d8abe89 = kódy chyb (<c1/>)

seg-7ba47f2644f5 = slova verdiktů (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = verifikační matice, definice jednotek, původ

seg-122495009a9c = popisy druhů scénářů (<c1/>)

seg-c7bc43c1e848 = poradní prohlášení, vyloučení odpovědnosti a upozornění (<c1/>)

seg-dd0fc888e0dc = tytéž texty uvnitř JSON, které zůstávají anglicky

seg-a236606f1ca1 = <c1/> kampaně iq, stránky srovnání studií, žebříčku bench, zprávy o odolnosti

seg-4ec45651bd09 = <c1/> balíčku důkazů a PNG observatoře: oba jsou zahrnuty do hashe manifestu (balíček je navíc podepsán), takže se vytvářejí anglicky bez ohledu na jazyk

seg-048b6c3a9f0c = Čísla v textu určeném lidem používají desetinné znaménko daného jazyka (čárku v { "15" } z { "18" } jazyků; tečku v en, ja, zh-Hans a en-XA). Čísla ve strojových souborech vždy používají tečku. Počet (proměnná pojmenovaná <c1/>, <c2/>, <c3/>, <c4/> nebo <c5/>) se do Fluentu dostane jako číslo, takže překlad smí psát <c6/>.

seg-487d6d38fa39 = Volba jazyka

seg-79499bebb806 = Příkazový řádek: <c1/>, pak <c2/>, <c3/>, <c4/>, <c5/>, pak angličtina. <c6/> je pt-BR; jen <c7/> je portugalština z Portugalska. <c8/> je zjednodušená; tradiční je odmítnuta se seznamem podporovaných značek.

seg-079f85726238 = Knihovna: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> u <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: volitelné koncové <c1/> u <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> u <c2/> a <c3/>.

seg-e133ee809c98 = Chyby a jejich kódy

seg-fac73c5cbbc2 = Každá chybová zpráva má stabilní kód, id zprávy velkými písmeny (<c1/> je <c2/>), stejné ve všech jazycích. Anglický text příkazového řádku se nemění. V jiném jazyce je řádek <c3/>; s <c4/> následuje ve všech jazycích druhý řádek <c5/>. API poskytuje <c6/> a <c7/> (<c8/>); chyby MCP nesou <c9/> jako data chyby. Porovnávejte podle kódu, nikdy podle textu.

seg-7d731dc5f888 = Jak běh funguje v jiném jazyce (pravidlo dvojího běhu)

seg-204df30d9ca2 = Strojový soubor nesmí záviset na jazyku. Běh v jiném jazyce proto spouští scénář dvakrát: jednou v angličtině, jejíž <c1/>, <c2/> a CSV jsou strojové soubory, a jednou v jazyce uživatele pro souhrn, graf a <c3/>. Angličtina je jeden běh, bajt po bajtu stejný jako dříve.

seg-b7447d4cd5a8 = Změřeno, nativně, sestavení release, angličtina a pak <c1/> (sekundy): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; každý další přibalený scénář trvá méně než { "4" } s; { "173" } scénářů přibalených v době měření dohromady trvalo v angličtině { "64" } s. Cena je přesně dvojnásobná pro jiný jazyk. WebAssembly nebylo měřeno (zde není wasm-bindgen); při faktoru prohlížeče asi { "4" } je to u nejpomalejšího druhu minuta.

seg-cc148fdec7a2 = Stránka se čekání vyhne tím, že okamžitě ukáže anglický výsledek a poté zavolá <c1/>: to je samotný druhý běh, vrací <c2/> a Studio může říkat „překládám…“, dokud nedorazí.

seg-cd0360ad624d = <b>Položka { "0.41" }: jeden běh.</b> Vykreslit obojí ze záznamu <c1/>. Bylo posouzeno a nebylo vybudováno: výsledky <c2/> se po vytvoření kontrolují, měří a hashují (šířky textu grafů, hashe původu nad výstupním textem) a <c3/> formátuje v místě volání, takže by záznam vložil zástupné tokeny do strojových souborů a učinil by jejich bajty závislými na přehrání. Vyžaduje <c4/>/<c5/> vracející tokeny, finalizátor u každého zapisovače a důkaz bajtové shody u každého zapisovače.

seg-67e04a43cea8 = Sestavení wasm vkládá jen anglický katalog. Ostatních šestnáct by přidalo každý asi { "150" } kB gzip. Stránka při volbě jazyka stáhne <c1/> a zavolá <c2/>; pokud selže stažení nebo registrace, stránka zůstane v angličtině. Nativně, příkazový řádek a wheel Pythonu vkládají všech { "18" }.

seg-9a2f85e7e43c = Velikost neoptimalizovaného <c1/> z <c2/> (před wasm-bindgen a wasm-opt), základ bc04e98f proti této větvi: { "18.71" } MB -> { "19.88" } MB surově, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. Anglický katalog má { "521" } kB surově, z toho { "153" } kB gzip; zbytek je <c3/> a jeho závislosti. Toto je přijato tak, jak bylo změřeno.

seg-3ce9aab4916e = Katalog

seg-fdea76581cd8 = <c1/> obsahuje zprávy s id s předponou <c2/>. <c3/> je zdroj; ostatní soubory jsou překladatelů a mohou některé zprávy postrádat (každá se vrací k angličtině po zprávách). Doprovodné seznamy v <c4/>: <c5/> (zprávy s proměnnými počtu, pro tvary množného čísla), <c6/> (čísla předávaná jako placeables), <c7/> (zprávy, které jsou kusy věty skládané za běhu: mají být sloučeny do zpráv o celé větě a nikdy nepřibývat).

seg-9432bca8a935 = <c1/> dokazuje angličtinu: každá zpráva má zaznamenanou původní šablonu a vykreslí se přesně na tento text; každé id je použito; proměnné souhlasí; pseudolokalizace vykreslí každou zprávu. <c2/>, <c3/>, <c4/> pokrývají vstupní body, popisy druhů a právní texty. <c5/> selže, pokud nový řetězcový literál, který by člověk četl, obejde katalog: povolení po souborech v <c6/>, které smí klesat a nikdy růst. <c7/> spouští celé scénáře s referenčním a současným binárním souborem a porovnává každý výstupní soubor.

seg-969a4b12b12c = Jak přesunout řetězec do katalogu: <c1/>.

seg-48c3c0ca063d = Závislosti a licence

seg-b6c2f08c9a46 = Framework přidává <c1/> { "0.16" } (Apache-2.0 OR MIT) a <c2/> { "0.9" } (MIT OR Apache-2.0) s jejich tranzitivními crates: <c3/> a <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: používá se alternativa Apache-2.0, kterou <c9/> povoluje), <c10/> a <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Každá je permisivní podle seznamu <c16/> v <c17/>; <c18/> se objevuje ve dvou verzích ({ "1" } a { "2" }), což <c19/> jen hlásí. Seznam licencí byl přečten z <c20/>; <c21/> není v autorském prostředí nainstalován a běží v integračním CI.

seg-6aa2e78078ae = <s1>Předchozí</s1>Glosář

seg-670504be0531 = <s1>Další</s1>Průvodce Studiem
