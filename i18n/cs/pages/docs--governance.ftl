# docs--governance: translations (cs)

seg-26440a254ba8 = Zdroj: <c1/>

seg-5f8e9a4a15be = Správa projektu { -brand }

seg-b20b74b77755 = Tento dokument uvádí, jak je { -brand } řízen: kdo rozhoduje, jak, a co projekt přijme a co nikoli. Je záměrně <b>lehký</b> — úměrný současné velikosti projektu — a otevřeně uvádí dnešní realitu jediného správce i cestu k širší správě, jak komunita poroste.

seg-1e0c276811e2 = Poslání a rozsah

seg-5dcc38148cf4 = { -brand } je <b>neutrální, reprodukovatelná a poctivě ověřená reference pro výkonnost a odolnost hybridního kvantově-klasického PNT</b>. Poslání nastavuje měřítko pro každé rozhodnutí: správnost, citace a reprodukovatelnost před šíří záběru. Poctivý rozsah je zdokumentován v <a1><c1/></a1> a stav validace v <a2><c2/></a2>; návrhy se posuzují vůči tomuto rozsahu, nikoli podle počtu funkcí.

seg-d331a1cfc60b = Role

seg-88bb2a831125 = <b>Správce.</b> { -brand } v současnosti spravuje jeho zakladatel, společnost Ashforde OÜ (kontakt: <c1/>). Správce je konečným rozhodovatelem o rozsahu, návrhu, vydáních a o tom, co se začlení. Jde o model benevolentního správce, uvedený otevřeně, nikoli převlečený za výbor, který neexistuje.

seg-8e1da46f9b0b = <b>Přispěvatelé.</b> Kdokoli, kdo otevře issue nebo pull request. Příspěvky se posuzují podle měřítka v <a1><c1/></a1> — původ každého číselného parametru, validace vůči publikovanému vztahu a poctivost ohledně zralosti.

seg-d212e17ac218 = <b>Budoucí committeři.</b> Pokud to trvalý, kvalitní přínos opodstatní, budou práva k zápisu rozšířena na důvěryhodné přispěvatele a tento dokument bude aktualizován na model s více správci (rozhodnutí líným konsenzem, přičemž nesouhlasy řeší skupina správců). Do té doby platí postup: přispívat, vybudovat si zázemí a být pozván.

seg-91e3f1919016 = Jak se rozhoduje

seg-0d45899c92f4 = <b>Diskuse na veřejnosti.</b> Podstatné změny začínají jako issue na GitHubu, aby zdůvodnění, alternativy a kompromisy byly zaznamenány.

seg-88916dd2357b = <b>Líný konsenzus.</b> Návrh, proti kterému po přiměřené době nezazní trvalá námitka a který splní níže uvedené technické měřítko, pokračuje.

seg-788566515dad = <b>Při nesouhlasu rozhoduje správce.</b> Pokud se konsenzu nedosáhne, rozhodne správce a zaznamená důvod. Nesouhlas se řeší podle poslání a technického měřítka, nikoli podle senority nebo hlasitosti.

seg-e45e1b565e62 = Technické měřítko (nesmlouvavé)

seg-2c397872e2f5 = Jde o pevné invarianty, vynucované CI a revizí, které žádné rozhodnutí neruší:

seg-70cb5a174c2f = <c1/> musí reprodukovat běh bit po bitu. Změna, která to učiní nedeterministickým, je chyba, nikoli funkce.

seg-b8733ea97546 = <b>Původ.</b> Žádné anonymní číselné konstanty — každý parametr cituje zdroj.

seg-55a09b775418 = <b>Poctivost validace.</b> Každá schopnost je označena <c1/> (vůči vnějšímu orákulu) nebo <c2/> / <c3/>. Nic se netvrdí nad rámec důkazů. Viz strojově kontrolovanou matici v <c4/>.

seg-dd339a396698 = <b>Hygiena.</b> Žádná atribuce automatizovaného nástroje nikde v commitech, obsahu ani historii (vynucuje <c1/>).

seg-45733fea1709 = Změna, která nesplní toto měřítko, se zamítne, ať by byla jakkoli užitečná.

seg-3eb0831d99a2 = Hranice mezi otevřeným a uzavřeným

seg-ca7730a3d518 = { -brand } je <b>open-core</b>. Tento repozitář je a zůstane úplným otevřeným enginem pod AGPL-3.0 — neutrální referencí s komerční duální licencí od společnosti Ashforde OÜ (viz <a1><c1/></a1>). Projekt do otevřeného repozitáře <b>nepřijme</b>:

seg-8c2a89a3a4e2 = <b>Hloubku podléhající exportní kontrole nebo dvojího užití</b> — skutečné knihovny hrozeb, protivníkovy průběhy signálů nebo parametry výkonu protirušení a ochrany proti spoofingu. Veřejný repozitář zůstává u obecných, publikovaných modelů a metod (viz <c1/> → Exportní kontrola). Pokud si nejste jisti, zeptejte se <em>před</em> přispěním.

seg-6df31d37cfe4 = Důvěrná data nebo kalibrace zákazníků či partnerů.

seg-b3b4a5384199 = <b>Copyleftové (GPL/AGPL/LGPL/MPL) <em>závislosti</em></b> — ne proto, že by byly v rozporu s vlastní licencí AGPL enginu (nejsou), ale proto, že je nelze přelicencovat do <b>komerční</b> edice: komerční licenci můžeme prodávat jen nad kódem, který vlastníme nebo který je permisivní. Copyleftová závislost by komerční edici zasáhla a porušila by duální licenci. Závislosti proto zůstávají permisivní (Apache/MIT/BSD/ISC), což vynucuje <a1><c1/></a1>.

seg-ce264f3e43fe = Naopak projekt <b>nevyprázdní</b> otevřené jádro kvůli prosazení proprietární hodnoty: ověřený engine, veřejné validační kotvy, registr poctivosti, výměnný/standardní formát a distribuční kanály zůstávají otevřené. Vyhladovění otevřeného jádra je jediná fatální chyba v modelu open-core a je vyloučeno.

seg-947b3e9b1b2d = Vydání

seg-73e2bca0310d = <b>Sémantické verzování.</b> Před verzí 1.0 se schéma scénáře/výsledku může měnit; zásadní změny jsou výslovně uvedeny a verze výměnného schématu (<c1/>) je jediným zdrojem pravdy o kompatibilitě artefaktů.

seg-71cace8b6144 = <b>Pravomoc k vydání.</b> Publikování (např. <c1/>) je ruční krok správce vyžadující token registru. CI a workflow Release spouštěný tagem <b>nikdy</b> automaticky nepublikují do externích registrů — pouze znovu spustí všechny kontroly a připojí sestavený artefakt. Viz <c2/> → Commity a verzování.

seg-59c37ffa54f0 = Etický kodex a bezpečnost

seg-2dc8c12568bc = Chování se řídí dokumentem <a1><c1/></a1>.

seg-8574b73edbbc = Bezpečnostní problémy se řídí postupem soukromého hlášení v <a1><c1/></a1> — pro zranitelnost neotevírejte veřejné issue.

seg-d86d4e609713 = Ochranná známka

seg-cb1314b67b2f = Název a logo { -brand } jsou ochranné známky společnosti Ashforde OÜ. Licence (AGPL-3.0 nebo komerční licence) se vztahuje na <b>kód</b>, nikoli na značky: fork může používat kód podle licence, nikoli však název { -brand } ani kanonickou identitu distribuce. Tím zůstává Ashforde citovaným zdrojem pravdy, což je součástí toho, jak otevřené jádro zůstává neutrální referencí.

seg-a678f6ed1af8 = Změny tohoto dokumentu

seg-db90122245fa = Změny správy se samy navrhují jako pull request a rozhodují se výše popsaným postupem. Jak se bude měnit rozsah projektu, očekávejte, že tento dokument dostane model rozhodování s více správci; technické měřítko nesníží.

seg-0a0712cca2e7 = Lehká záměrně. Poctivá k dnešku, s uvedenou cestou na zítřek.

seg-4bfa7cf23a41 = <s1>Předchozí</s1>Přispívání

seg-f67113e34738 = <s1>Další</s1>Etický kodex
