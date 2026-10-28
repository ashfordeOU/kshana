# docs--mission-thread-lunar: translations (cs)

seg-f942b36a11c4 = Zatím ne na GitHubu

seg-3b01a756c305 = Co počítá

seg-b478421b21bb = Zdroj: <c1/>

seg-dbd59cc01982 = Lunární segment vlákna mise třídy Artemis

seg-7b56ed698c30 = Čtyři druhy scénářů, z nichž každý je také druhem fáze rozhraní <c1/> (<c2/>): nesou rozpočet chyb navigace a času jihopolární lunární misí, od setkání na lunární oběžné dráze přes přistání a pobyt na povrchu až po výstup zpět na oběžnou dráhu. <b>Každé číslo zde je MODELLED</b>: uvedený model s ILLUSTRATIVE vstupy, nic z toho není tvrzením o žádné misi, systému ani místu. „Třída Artemis“ označuje třídu konceptů misí, nic víc; nepoužívají se ani se netvrdí data, produkt ani podpora žádné agentury a nic zde s žádnou nesouvisí. Software pouze poradního charakteru, nikoli certifikované navigační zařízení. Kshana nic nevysílá a neřídí žádný hardware.

seg-5282ad2c498a = Fáze a druh

seg-9b927127e042 = Ukázkový scénář

seg-40f3e1b2d58b = Jádro

seg-2cfaaa8be402 = relativní navigace k dokování, kruhová polární dráha { "100" } km nebo eliptická polární dráha { "100" } km krát { "3000" } km

seg-9ee09d63fed3 = rozpočet rozptylu přistání na jihopolárním místě

seg-c4568984e75c = <c1/>, <c2/> (vyžaduje DEM, checkout)

seg-a098e14e6a63 = dostupnost určování polohy a času podle místa a ročního období

seg-8278ae655fcc = <c1/>, <c2/> (vyžaduje DEM, checkout)

seg-249eff5159d0 = výstup na oběžnou dráhu setkání a kovariance předaná zpět na oběžnou dráhu

seg-36184e593ade = Každé jádro je funkcí <c1/>; samostatný běh sestaví výchozí vstupní stav (lunární středově inerciální kovariance { "100" } m a { "0.1" } m/s, hodiny LTC s odchylkou { "1" } mikrosekundu) a výchozí epochu 2028-01-01, zatímco běh ve vlákně přebírá vstupní stav z předchozí fáze. Rámce a časové škály převádí a pravidlo předání uplatňuje vlákno, nikoli jádro: obal fáze převede vstupní stav na <c2/> (nebo <c3/> pro povrchovou mapu) a hodiny LTC prostřednictvím převodů vlákna a řádky převodů se přidají do rozpočtu fáze. Rámec nebo časová škála, které vlákno nedokáže převést (například ITRF), se odmítne se zprávou vlákna; jádro volané přímo s rámcem, který nedokáže použít, jej odmítne s uvedením důvodu. Fáze nikdy neresetuje kovarianci, jen předává tu, kterou skončila.

seg-59f4a1a2684e = Co dělá každá fáze

seg-e112a34ef118 = Dvě vozidla, chaser a cíl, létají po téže dráze podle lunárního modelu sil v crate (gravitační pole a Země a Slunce jako třetí tělesa). Dávkový odhad Gauss–Newton přes oblouk obnoví oba počáteční stavy z:

seg-33bb01b1e72a = absolutní polohové určení pro každé vozidlo ze sady relé ILLUSTRATIVE třídy LCNS (relé za Měsícem se vyřadí, potřeba jsou čtyři), jehož bílá složka je mez sledování kódu na pilotu AFS (BPSK({ "5" }), { "5.115" } Mchip/s) při uvedeném C/N0 krát kofaktor DOP;

seg-b061f6742a86 = <b>trvalá</b> chyba signálu v prostoru na každém určení: chyby relé se v oblouku hodin neprůměrují, a proto se nesou jako konstantní polohové biasy, jeden společný oběma vozidlům (<c1/> rozptylu, výchozí { "0.9" }, ILLUSTRATIVE) a jeden nezávislý pro každé vozidlo. Konstantní bias nepřináší žádný přínos průměrování, což je konzervativní čtení;

seg-437ac74b1400 = křížový odhad vzdálenosti ze stejného signálu s vlastním C/N0.

seg-3513a55e44e5 = Uvádí formální chybu relativní polohy a rychlosti i chybu metodou Monte Carlo v lokálních osách cíle, podíl epoch s určením na obou vozidlech, střední normalizovanou kvadratickou chybu odhadu (NEES) relativního stavu oproti jeho očekávané hodnotě { "6" }, relativní drift vzniklý zanedbáním gravitačních harmonických, kontrolu v uzavřeném tvaru podle Hilla (Clohessy–Wiltshire) pro kruhový případ, modely koncových relativních senzorů z <c1/> vlákna (ILLUSTRATIVE parametry) vedle údaje pouze ze signálů a kovarianci chaseru 6x6 na konci.

seg-5d3fa3e8486c = <b>Co výsledek říká.</b> Samotnými signály křížový odhad vzdálenosti určí relativní polohu ve směru přímé viditelnosti, ale relativní poloha napříč ním je omezena nezávislou chybou signálu v prostoru a tím, co dává dynamika; dokování potřebuje relativní senzor a řádky <c1/> ukazují, na jakou vzdálenost každý z modelů senzorů vlákna překoná signály. Výsledek závisí také na tom, že skutečnost a odhadovač sdílejí model sil; volba odhadovače <c2/> ukazuje cenu zanedbání harmonických a u tohoto běhu se konzistence neočekává.

seg-66c4eb27641b = Fáze letí po vlastní nominální dráze (pole <c1/>), takže se nepoužívá vektor vstupní polohy a rychlosti, pouze jeho kovariance, rámec a hodiny; událost ve vlákně to uvádí.

seg-751f29ab7a35 = Pro každou horizontální osu pětistavový model inerciální chyby (poloha, rychlost, bias akcelerometru, náklon polohy, bias gyroskopu, řízený měrnou silou sestupu) ze vstupní kovariance a IMU, poté sekvenční filtr přes povolené pomůcky:

seg-c2eae4508a2f = <b>Určení AFS</b>: z relé viditelných nad plochým prahem, s kofaktorem ENU DOP krát chybou vzdálenosti uživatele. <c1/> používá chybu signálu v prostoru; <c2/> používá reziduum korekčního spoje z <c3/>. Při právě třech relé ve výhledu se hodiny podporují, neodhadují, a určení pak nese <c4/>: zde lunární čas vstupuje do určení.

seg-39c938fb24e9 = <b>Určení podle terénu</b>: <c1/> spouští porovnávač TERCOM/SITAN v crate na jeho syntetickém reliéfu a v měřítku metrů na Zemi (zástupný reliéf, nikoli jihopolární); <c2/> bere Cramérovu–Raovu mez porovnávání výškového okna skutečného DEM z LOLA na místě, <c3/>, a netvrdí žádné určení tam, kde reliéf omezuje jen jeden směr (problém apertury).

seg-795ef82edc61 = <b>Lunární čas</b>: chyba hodin při určení kombinuje vstupní hodiny, jejich růst od synchronizace a člen LTC-TT z <c1/>. S <c2/> vozidlo tiká v TT a nashromážděný posun je nekorigovaný bias; s <c3/> zůstává pouze nejistota zveřejněného pásma { "56" } až { "59" } mikrosekund za den přes horizont. Chyba časové značky posune určení podél dráhy o <c4/>.

seg-d655c932abbf = Rozptyl přistání je navigační chyba při dosednutí plus nezávislý naváděcí člen (<c1/>, ILLUSTRATIVE, ve výchozím nastavení { "20" } m na osu). Tabulka <c2/> spouští každou kombinaci pomůcek. Elipsa je kalibrována metodou Monte Carlo (podíl simulovaných přistání uvnitř 3sigma obrysu oproti { "98.9" } %, které dává 2D gaussovské rozdělení).

seg-82b71e26bc89 = <b>Čtěte s opatrností.</b> Výchozí rozptyl je ovládán předpokládaným naváděcím členem a na každém jihopolárním místě je geometrie relé téměř stejná, takže se místa liší málo. Lunární čas přes časové značky málo záleží ({ "150" } m/s krát několik mikrosekund je pod milimetrem); záleží, když se geometrie zhorší na tři relé.

seg-f5af0aef6649 = Pro každé místo a období (epochu a okno po ní): polohování pomocí relé (čtyři a více relé ve výhledu nad prahem a horizontem terénu místa s PDOP pod prahovou hodnotou, ze stejných funkcí a konstelace jako <c1/>; výsledek pro jedno místo se jeho údaji rovná na bit), zda jsou Země a Slunce nad horizontem (analytická poloha Slunce a Měsíce a orientace Měsíce, včetně librace) a dostupnost času (relé nebo Země ve výhledu) s nejdelším úsekem, kdy není ani jedno. Údaj o relé se s ročním obdobím v tomto modelu nemění (keplerovská sada, průměrná rotace); údaje o Zemi a Slunci ano. Fáze předává kovarianci beze změny a disciplinuje hodiny na úroveň časování (ILLUSTRATIVE, { "50" } ns), takže zbývá jen nejdelší časová mezera k překlenutí holdoverem.

seg-0890ec65a04e = Pětistavový model sestupu na všech třech osách místa ze stavu na povrchu, určení AFS v uvedeném intervalu se stejným zacházením s lunárním časem a úplná kovariance polohy a rychlosti 6x6 při vložení na dráhu předávaná dál, se zachovanou korelací polohy a rychlosti každé osy. Rozptyl při vypnutí motoru posouvá, kde se vozidlo nachází, a uvádí se vedle navigační kovariance, nepřenáší se. Chyby jsou drženy v osách místa startu (bez zakřivení po směru dráhy) a nominální výstupní stav je zástupný; výsledkem je pouze kovariance.

seg-f60b576fabcd = Jak dokument uvádí fázi

seg-be8e0001ed0c = Ve vlákně je tabulka <c1/> fáze vlastní tabulkou samostatného scénáře. Délka fáze je <c2/> vlákna: model, který uvádí i vlastní klíč délky (<c3/>, <c4/>, <c5/>, <c6/>), s ní musí souhlasit, jinak fáze odmítne běh, a model, který klíč vynechá, přebírá klíč vlákna. Seed je seed fáze klíčovaný id vlákna, takže fáze spuštěná samostatně pod stejným id a seedem vlákna vrátí čísla, která vrací ve vlákně. Chybně napsaný klíč modelu se odmítne, neignoruje. Předání mezi fázemi a převody rámců a časových škál, které potřebuje (lunární středově inerciální a pevný k Měsíci, ze Země na Měsíc, páry LTC), patří vláknu.

seg-52a6e2ec0a99 = Návrhy, vstupy a prahy byly stanoveny v <c1/> před jakýmkoli během, se šesti datovanými dodatky, z nichž každý je v souboru uveden; verdikt každého prahu, včetně nesplněných a historie odhadovače, je v <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (propagátor proti rekonstruované trajektorii LRO, { "24" } h): MET, maximální 3D rozdíl { "33" } m oproti { "500" } m, radiální RMS { "2.4" } m oproti { "60" } m.

seg-25464238f6bd = <b>A2</b> (tentýž propagátor proti téměř přímočaré halo dráze CAPSTONE za jednu 6.5denní otáčku): <b>NOT MET</b>, rozdíl koncové polohy { "136.8" } km oproti { "25" } km a rozdíl poloměru oskulačního perigea { "28.4" } km oproti { "10" } km. Příčiny nebyly izolovány (kandidáty jsou vynechaný tlak záření a albedo, citlivost dráhy na počáteční stav a analytické řady Země a Slunce); řádek zůstává MODELLED.

seg-e1099ad81a5d = Tyto dva řádky testují propagátor, který lunární druhy sdílejí. <b>Netestují žádný navigační filtr, signál ani rozpočet a nic jiného zde nemá vnější orákulum.</b>

seg-9a4b2392aa92 = Vše ostatní je MODELLED a kontroly konzistence druhů (B1 až B8 předregistrace) testují implementaci proti jejímu vlastnímu uvedenému modelu, nikoli proti Měsíci.

seg-3365490b59b7 = <s1>Předchozí</s1>Vlákno mise: od startu po vstup do atmosféry

seg-90932eed0074 = <s1>Další</s1>Určování polohy, navigace a času na LEO
