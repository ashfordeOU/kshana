# docs--mission-thread: translations (cs)

seg-e27476e37522 = Země

seg-34bdcfd66ded = Ve větvi repozitáře, z níž tyto dokumenty pocházejí; zatím ne na GitHubu

seg-092dd691ca17 = Zpráva

seg-f942b36a11c4 = Zatím ne na GitHubu

seg-b03d56f501c3 = Druh

seg-2afa300864a9 = Parametry

seg-b7cf72949a21 = Zdroj: <c1/>

seg-32755afa0f78 = Vlákno mise

seg-d4af67363efc = Software pouze poradního charakteru, nikoli certifikované navigační zařízení. Pouze veřejné zdroje; bez spojení s žádnou agenturou ani její podpory a nic zde netvrdí shodu s požadavky žádného programu.

seg-816770c97995 = <c1/> řetězí fáze mise, z nichž každá je jedním z osmi registrovaných druhů s vlastními senzory a filtrem, a uvádí <b>rozpočet chyb navigace a času</b> celého řetězce: pro každou fázi 1sigma polohy, rychlosti a bias hodin při vstupu, ve špičce a při výstupu; každý příspěvek k ní s jednotkou; rezervu oproti požadavku, který uvedete; nejslabší článek; datované události; a obrázek časové osy. Každé číslo je <b>MODELLED</b>: uvedený vstup nebo model vstupu. Jediné řádky s vnějším orákulem jsou v <s1><c2/></s1> a říkají, co testují.

seg-c29a19879c84 = Spusťte ukázku z checkoutu (čte zapsaný výřez jádra Měsíce):

seg-00f84b734853 = Dokument

seg-9979b2c873df = <b>Dokument se odmítne, nehádá se,</b> když se id fáze opakuje, seznam <c1/> je prázdný, název je neznámý, klíč modelu není takový, který druh zná, klíč délky nesouhlasí s <c2/>, nebo fáze uvádí zdroj, pro který její model nedává čísla.

seg-9b1e6ac618b5 = Co dělá předání

seg-0e965f3e30fa = Předávaný stav je úplná kovariance 6x6 pro <c1/> v jednotkách SI, hodiny (bias, drift a jejich kovariance, označené časovou škálou), rámec, čas mise a označení důkazu. Předání nikdy neresetuje kovarianci.

seg-47599d03571d = Pravidlo

seg-023113cc5afb = předá stav beze změny

seg-43967d0b6dd8 = bílý šum zrychlení s PSD <c1/> po dobu <c2/> na modelu přímé dráhy; řádek uvádí obojí

seg-2c791ab0fd0f = dead reckoning po dobu <c1/>, poté se osa nastaví na úroveň zdroje jen tam, kde je úroveň menší; nikdy pod úroveň, nikdy reset

seg-36b9117f5379 = Rámce a časové škály

seg-5853aaba827f = Vlákno převádí při předání, nikdy uvnitř fáze, a každý převod je samostatný řádek rozpočtu. Rámce: GCRF, MCI, MCMF (ITRF a LVLH se odmítnou s uvedením důvodu). <c1/> posouvá počátek o geocentrický stav Měsíce: stav třídy DE440 z jádra tam, kde pokrývá epochu (zástupná hodnota { "5" } m a { "1" } mm/s; naměřené nejhorší { "2.6" } m proti připnutému JPL Horizons), jinak analytická řada s naměřeným RMS { "195.7" } km, které řádek uvádí; lunární příklad proto musí nést jádro pokrývající jeho epochu. <c2/> je průměrná siderická rotace s osami zarovnanými v epoše a bez librace. Časové škály procházejí přes TT: <c3/> přesně, <c4/> přidává { "14" } us, <c5/> používá sekulární rychlost z <c6/> s pásmem { "56" } až { "59" } us/den jako nejistotou rychlosti.

seg-5ee610d8ab89 = Osm druhů fází

seg-70b73f1acebf = Segment

seg-0e39a468de1d = motorický výstup na parkovací dráhu: kovariance s konstantní rychlostí a bílým šumem zrychlení, akvizice a únik GNSS, holdover hodin

seg-d359ae5982a6 = klíče <c1/> v <c2/>

seg-57c44fd6e061 = relativní navigace přes úseky senzorů: přechod Clohessy–Wiltshire v LVLH, kovariance Kalmanova filtru 6x6, dokovací okno

seg-7dce961e2c67 = níže

seg-4b233c6cdf8b = zážeh TLI a cislunární plavba: propagace Cowell, matice přechodu stavu konečnými diferencemi, aktualizace gnss-ssv a pozemního sledování

seg-352e27d02c86 = návratový volný let na rozhraní vstupu; sigma úhlu dráhy letu, pravděpodobnost koridoru, špičkové zpomalení, stopa

seg-95eb34012fe8 = lunární

seg-cc72d2fc8a43 = relativní navigace k dokování na lunární oběžné dráze

seg-2cfa6846c937 = rozpočet rozptylu přistání na polárním místě

seg-e9f5fc58fe12 = totéž

seg-ba3c65a210dd = povrchová dostupnost PNT a času podle místa a ročního období

seg-8b9c5124dd3c = motorický výstup na dráhu vložení

seg-4ce0fa85457c = Lunární druhy jsou také samostatnými druhy scénářů; návrh a důkazy jsou v <a1><c1/></a1>.

seg-d16877f38793 = Rozpočet nese <b>relativní</b> sigma; absolutní kovariance chaseru se předává beze změny a řádek to uvádí, protože tato fáze měří vozidla vzájemně, nikoli vůči Zemi. Počáteční relativní kovariance je absolutní kovariance chaseru plus uvedená sigma cíle, sečtené jako nezávislé (konzervativně). Klíče: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, volitelně <c6/> a <c7/> a jedna či více <c8/> s <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> nebo <c15/>, ILLUSTRATIVE parametry v <c16/>) a <c17/>; délky úseků se sčítají na délku fáze. Dokovací okno je čas od okamžiku, kdy relativní sigma zůstává uvnitř záchytné obálky, do konce fáze. Opakování jsou samostatné fáze s vlastními id.

seg-088b78574ab4 = Střední stav je propagátor Cowell v enginu s gravitací Země a J2 a se Sluncem a Měsícem jako třetími tělesy. Kovariance prochází každým segmentem <c1/> s maticí přechodu stavu z diference vpřed (nominální běh a šest perturbovaných běhů) a bílým šumem zrychlení. Zážeh je podél vstupní rychlosti s uvedeným podílem velikosti a chybou namíření. <b>Uvedené omezení:</b> zapsané výřezy jádra Měsíce obsahují Měsíc, ale ne Slunce, takže propagátor bere Měsíc z jádra a Slunce z analytické řady (člen třetího tělesa Slunce je vůči chybě té řady necitlivý); fáze v události uvádí, co použila, a kde žádné jádro segment nepokrývá, použije analytickou řadu pro obě. Zážeh <b>není cílený</b>: nominální stav je tam, kam uvedený zážeh vede, a lunární fáze přebírají jen kovarianci.

seg-e5a67295a5ae = Aktualizace, použité jen když dokument zdroj uvádí: <c1/> (polohová určení s dostupností a PDOP z prohledávání space-service-volume enginu podél oskulační dráhy Země, která zastupuje oblouk, jedno prohledání na <c2/>; sigma určení = střední PDOP krát <c3/>; forma očekávané informace udržuje běh deterministický) a <c4/> (vzdálenost a rychlost změny vzdálenosti podél geocentrického směru, takže rovina oblohy se nepozoruje; rozptyl aktualizace se dělí pracovním cyklem sledování). Klíče: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, volitelně <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = Volný let je volný let <c1/> bez zážehu, končící na rozhraní vstupu; jeho klíče jsou klíče volného letu výše. Na rozhraní fáze čte úhel dráhy letu a jeho sigma z úplné kovariance, pravděpodobnost, že úhel leží uvnitř uvedeného koridoru, špičkové zpomalení při nominálním úhlu a na obou okrajích koridoru (rovinný balistický vstup enginu vedle uzavřeného tvaru Allen–Eggers) oproti volitelnému limitu a stopu: dosah z uvedené citlivosti, boční odchylku z kovariance rozhraní napříč rovinou dráhy. Klíče: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, volitelně <c8/>, <c9/> a <c10/> (nominální návratový stav, šest čísel, když řetězec nemá žádný zážeh trans-Earth, který by jej vytvořil). Nic zde nemodeluje vztlak, navádění ani ohřev kapsle.

seg-352783ef7181 = Překrytí pozemní sítí

seg-69d6ab8e93bc = Volitelná tabulka <c1/> uvádí stanice a nejnižší elevaci sledování; pro každou fázi, kterou jmenuje, vlákno spočítá podíl fáze, který může stanice sledovat, a předá jej fázi jako pracovní cyklus, který škáluje frekvenci aktualizací pozemního sledování. Geometrie: <c2/> (vstupní stav letěný jako dvoutělesový s J2, pro fáze na nízké dráze), <c3/> (vozidlo v poloze Měsíce, pro cislunární plavbu) a <c4/> (pracovní cyklus, který zadáte). Změna stanice ztrácí <c5/>; rozpočet fáze získá nejdelší interval bez stanice ve výhledu a událost uvede pracovní cyklus. Nic nemodeluje antény ani rozvrhy sítě.

seg-467b14d7ef59 = <c1/>: <c2/> (index, id, druh, časy, označení, zdroje navigace a času, limitující zdroj, sigma při vstupu, ve špičce a při výstupu, požadavek, rezerva, <c3/> s jednotkou pro každý řádek, <c4/>), <c5/> (nejmenší rezerva oproti uvedenému požadavku, jinak největší špičková poloha), <c6/>, <c7/> vlákna (označení nejslabší fáze) a blok <c8/>. Obrázek je 1sigma polohy a bias hodin oproti času mise, jedno pásmo na fázi.

seg-a3c40c51c2ff = Co je důkazem

seg-1168810d4407 = Označení vlákna je označení nejslabší fáze a každá fáze je MODELLED. Lunární propagátor se porovnává s LRO a CAPSTONE (<s1><c1/></s1>); cislunární oblouk se porovnává s veřejnou trajektorií Horizons (<s2><c2/></s2>). Řádek práh stanovený v zapsaném souboru před během buď splní, nebo nesplní a nesplnění se zaznamenává jako nesplnění. Nic není VALIDATED, pokud to registr neuvádí.

seg-ee3c5b58e6fa = <s1>Předchozí</s1>Oběžná dráha a povrch Měsíce jako infrastruktura

seg-b963f8a02aed = <s1>Další</s1>Vlákno mise: lunární segment

seg-af81a8087ca7 = entry
