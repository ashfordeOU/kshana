# docs--kind-lunar-surface: translations (cs)

seg-f942b36a11c4 = Zatím ne na GitHubu

seg-51362910dcb7 = { "2" } přibalené scénáře používají tento druh; ostatní jsou v <a1><c1/></a1>.

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-6a26b9ab59fe = Stránka tématu: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Štítek výsledku (enginu): MODELLED

seg-626ab55f0424 = MODELLED (výsledek <c1/>)

seg-e66e2ca31e54 = Stránka tématu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-bf92597fdba4 = Software pouze poradního charakteru, nikoli certifikované navigační zařízení

seg-feea03a2c628 = Zdroj: <c1/>

seg-6c0eff9f9211 = <c1/> (druh scénáře)

seg-6c7d25f672fb = MODELLED dostupnost určování polohy a času na povrchu podle místa a ročního období pro jihopolární místa třídy Artemis. Pro každé místo a období (epochu a okno po ní) uvádí polohování pomocí relé (čtyři a více relé ILLUSTRATIVE konstelace třídy LCNS ve výhledu a PDOP pod prahem, ze stejných funkcí jako moonlight-service-volume a s oddílem terénu také s horizontem vykresleným metodou ray-marching z terénu lunar-station-coverage), zda jsou Země a Slunce nad horizontem místa (analytická poloha Slunce a Měsíce a orientace Měsíce, včetně librace, která se s ročním obdobím mění), a dostupnost času (relé nebo Země ve výhledu) s nejdelším úsekem, kdy není ani jedno, tedy s holdoverem, který musí povrchové hodiny překlenout. Výsledek pro jedno místo se rovná výsledku moonlight-service-volume na bit. MODELLED: ilustrativní keplerovská sada relé na Měsíci s průměrnou rotací; údaj o relé se s ročním obdobím nemění; terén je výřez LOLA { "1200" } m. Bez podpory agentury; software pouze poradního charakteru, nikoli certifikované navigační zařízení.

seg-3c13aefe4093 = Jeden běh <c1/> se shrne takto: lunar-surface | { "4" } míst x { "4" } období | polohování { "41" }% až { "41" }% | nejhorší dostupnost času { "100.0" }% | nejdelší mezera v čase { "0.0" } h (MODELLED)

seg-02bc245c436e = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-4e5ed02a85e1 = Příklad <c1/> mimo jiné nastavuje:

seg-0ceb87f45323 = jihopolární { "89.9" }

seg-94a405fadf2d = mci

seg-8c3e0f75ab98 = projde beze změny

seg-94b84de6c958 = Graf, který engine zapisuje pro scenarios/lunar-surface.toml, druh lunar-surface

seg-25040e105bf7 = <b>MODELLED</b> Druh a fáze <c1/>: dostupnost relé a PDOP, viditelnost Země a Slunce a disciplinované povrchové hodiny pro každé místo a období, s horizontem terénu z <c2/>; běh pro jedno místo se rovná výsledku tohoto druhu

seg-70f63c99a478 = <b>MODELLED</b> Druh a fáze <c1/>: dostupnost relé a PDOP, viditelnost Země a Slunce a disciplinované povrchové hodiny pro každé místo a období, s horizontem. Orákulum (ReferenceImpl): Přesná rovnost s existujícím druhem pro jedno místo a kontroly monotonie v testech. Sada relé je ILLUSTRATIVE a neporovnává se žádné měření na povrchu

seg-ab29e0e308d0 = MODELLED dostupnost určování polohy a času na povrchu podle místa a ročního období pro jihopolární místa třídy Artemis. (katalog druhů (<c1/>))

seg-3f948092eba6 = MODELLED: ilustrativní keplerovská sada relé na Měsíci s průměrnou rotací; údaj o relé se s ročním obdobím nemění; terén je výřez LOLA { "1200" } m. (katalog druhů (<c1/>))

seg-5b217c0bb606 = ČESTNOST: MODELLED. Sada relé je ilustrativní a keplerovská, Měsíc se pro relé otáčí průměrnou rychlostí (bez librace) jako v moonlight-service-volume; Země a Slunce používají analytickou orientaci, takže se oba rámce o toto vynechání liší. Údaj o polohování pomocí relé se v tomto modelu s ročním obdobím nemění; údaje o Zemi a Slunci ano. Netvrdí se žádná shoda s žádnou skutečnou službou ani místem. Adv (komentář v souboru scénáře, řádky { "11" } až { "15" })

seg-958f00c2d647 = Dostupnost určování polohy a času na povrchu podle místa a ročního období na lunárních pólech (<c1/>) je MODELLED, nikoli ověřena: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Předchozí</s1>lunar-station-coverage

seg-625c1973128e = <s1>Další</s1>lunar-time-budget
