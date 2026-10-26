# docs--kind-cislunar-arc-recovery: translations (cs)

seg-debc2f07db78 = true

seg-330cbcd04718 = podíl (bezrozměrný)

seg-8f21a5462b09 = Zdroj: <c1/>

seg-e4858b0a33c9 = <c1/> (druh scénáře)

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-f994c81583bf = MODELLED test nezávislého estimátoru prahu pozorovatelnosti podle délky cislunárního oblouku. Tento práh je čtení HODNOSTI z matice pozorovatelnosti sestavené z ANALYTICKÝCH řádků jakobiánu vzdálenosti a z ANALYTICKÉ variační přechodové matice a jeho křížová kontrola filtrem odmocniny informace skládá tytéž řádky: je to kontrola konzistence mezi dvěma numerickými stroji, nikoli potvrzení. Tento druh dodává chybějícího arbitra: dávkový estimátor nejmenších čtverců, který skutečně OBNOVUJE počáteční stav hlavní družice ze simulovaných měření, přičemž parciální derivace měření jsou brány jako CENTRÁLNÍ KONEČNÉ DIFERENCE složeného předního modelu. Nevolá žádný analytický řádek jakobiánu, žádnou variační STM, žádný rozklad podle singulárních ani vlastních čísel, žádnou toleranci hodnosti ani žádný filtr odmocniny informace -- zdrojový strážce v tests/cislunar_arc_recovery_reference.rs to činí vynutitelným --, zatímco dynamika (týž tok RK4 CR3BP), počáteční podmínky (táž diferenciálně korigovaná konstelace), skalární pozorovatelná a mřížka epoch jsou sdíleny záměrně a pojmenovány ve vydaném bloku <c1/>, protože dvě analýzy téhož fyzikálního problému se musí shodovat ve fyzice, aby byly srovnatelné. Dvě kritéria, každé procházené přes pět dekád vlastní meze: OBNOVA BEZ ŠUMU (chyba konečného stavu každého zasetého pokusu nejvýše recovery_factor krát jeho apriorní posun -- analogie hodnosti, bez tolerance singulárních čísel) a ODHADNUTELNOST METODOU MONTE CARLO (naměřená chyba polohy RMS přes soubor zasetého šumu pod uvedenou mezí -- analogie odhadnutelnosti, naměřená, nikoli predikovaná). Podporuje rovinný čtyřstavový a prostorový šestistavový model, rodiny DRO / halo L2 / NRHO L2, pozorovatelné vzdálenost a rychlost změny vzdálenosti a polární parametrizaci se středem v Měsíci, v níž se transformace aplikuje na STAV a přední model se tam znovu derivuje diferencemi. NAMĚŘENO na zveřejněné rovinné mřížce DRO: estimátor obnoví čtyřstav od { "0.782609" } h oproti { "2.086957" } h podle kritéria hodnosti při rel_tol { "1e-6" } (poměr { "0.375" }) -- práh hodnosti NENÍ potvrzen jako hranice obnovitelnosti --, zatímco naměřená hranice odhadnutelnosti leží ve stejné buňce mřížky jako formální, { "5.739130" } h, a naměřená křivka chyby reprodukuje formální 1 sigma přes { "21" } délek oblouku s poměrem geometrických průměrů { "0.98" }. MODELLED: návrh konstelace, mřížka epoch, jediný sledovaný spoj, velikost posunu, sigma měření a dvě uvedené meze. Nejde o produkt s certifikací navigačního výkonu.

seg-ada71f37b21b = Jeden běh <c1/> se shrnuje takto: cislunar-arc-recovery | rodina dro, 4 stavy, { "4" } s/c, pozorovatelná vzdálenost, kartézská parametrizace | oblouk { "6.0" } h, { "24" } epoch (mřížka { "0.260870" } h), { "32" } pokusů, seed { "20260920" } | parciální derivace konečnými diferencemi, žádný analytický jakobián / STM / SVD / SRIF | obnova bez šumu od { "0.782609" } h (faktor { "1e-2" }) oproti prahu hodnosti Gramiánu { "2.086957" } h | odhadnutelnost metodou Monte Carlo od { "5.739130" } h (RMS polohy ≤ { "1.000" } km, σ { "1.000" } m) oproti odhadnutelnosti podle Gramiánu { "5.739130" } h | RMS polohy na konci oblouku { "0.6026" } km

seg-3d4a2773c32f = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-eb621f41dfbb = Příklad <c1/> mimo jiné nastavuje:

seg-6d584e86deba = poměr (bezrozměrný)

seg-f7f4d06e661f = cislunar-observability na stejné

seg-a6cb7ed2ff6d = Označení výsledku (z enginu): MODELLED test obnovy délky cislunárního oblouku (potvrzení prahu pozorovatelnosti P6 nezávislým estimátorem). VALIDATED jádro: estimátorem je dosavadní vážený dávkový korektor Gauss-Newton v crate (crate::batch_ls), jehož návrhová matice je CENTRÁLNÍ KONEČNÁ DIFERENCE složeného p

seg-2fe411ae2153 = Graf, který engine zapisuje pro scenarios/cislunar-arc-recovery.toml, druh cislunar-arc-recovery

seg-99dd8cc0e3ef = <b>MODELLED</b> Dávkový estimátor nejmenších čtverců, který OBNOVUJE počáteční stav hlavní družice ze simulovaných meziddružicových měření přes rostoucí prefixy téže mřížky epoch, jakou používá tabulka hodnost-oproti-oblouku, s parciálními derivacemi měření brannými jako centrální koneč Testy: <a1>cislunar_arc_recovery_reference.rs</a1>.

seg-67aab2162719 = <b>MODELLED</b> Dávkový estimátor nejmenších čtverců, který OBNOVUJE počáteční stav hlavní družice ze simulovaných meziddružicových měření přes rostoucí prefixy téže mřížky epoch. Oracle (ReferenceImpl): Samostatný estimátor v této kódové základně na jiném algoritmu a s disjunktní cestou kódu: nelineární vážený Gauss-Newton s parciálními derivacemi konečnými diferencemi, jehož verdikt se čte jako naměřená chyba obnovy stavu v km a mm/s. Nemá s Gramiánovou cestou hodnosti a kovariance žádný společný výraz a oddělení je VYNUCENO zdrojovým strážcem, nikoli jen tvrzeno. NAMĚŘENO na zveřejněné rovinné mřížce DRO: th

seg-7be582874f98 = MODELLED test obnovy délky cislunárního oblouku (potvrzení prahu pozorovatelnosti P6 nezávislým estimátorem). VALIDATED jádro: estimátorem je dosavadní vážený dávkový korektor Gauss-Newton v crate (crate::batch_ls), jehož návrhová matice je CENTRÁLNÍ KONEČNÁ DIFERENCE složeného předního modelu - nevolá žádný analytický řádek jakobiánu měření, žádnou variační přechodovou matici, žádný singulárn (výsledek <c1/>)

seg-52fe686b1fdf = MODELLED test nezávislého estimátoru prahu pozorovatelnosti podle délky cislunárního oblouku. (katalog druhů (<c1/>))

seg-48e6e57a0b40 = MODELLED: návrh konstelace, mřížka epoch, jediný sledovaný spoj, velikost posunu, sigma měření a dvě uvedené meze. (katalog druhů (<c1/>))

seg-75f275dcb2d2 = MODELLED: návrh konstelace, mřížka epoch, jediný sledovaný spoj, velikost posunu, sigma měření a dvě uvedené meze. Nejde o produkt s certifikací navigačního výkonu. (komentář v souboru scénáře, řádky { "33" } až { "35" })

seg-ea82d9fd6506 = Potvrzení prahu délky cislunárního oblouku nezávislým estimátorem je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-53d57e6dafa6 = <s1>Předchozí</s1>campaign

seg-fe3ecf4b55fe = <s1>Další</s1>cislunar-observability
