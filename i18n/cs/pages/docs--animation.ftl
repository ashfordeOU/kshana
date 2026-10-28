# docs--animation: translations (cs)

seg-8428c41646b0 = Zdroj: <c1/>

seg-a61d094894fd = <c1/> promění časovou řadu běhu v něco, co se pohybuje: animovaný soubor Scalable Vector Graphics (SVG), jediný samostatný přehrávač HyperText Markup Language (HTML) nebo očíslovanou posloupnost snímků SVG pro kodér videa. Kampaň se přehraje jako své fáze (rušení, spoofing, holdover, poplach integrity) s vyznačenými poplachy; běh spektra přehraje svůj waterfall řádek po řádku; přelet na nízké oběžné dráze Země (LEO) přehraje svůj spoj po pásmech a s spooferem statistiky monitoru epochu po epoše.

seg-39d69331035d = Kód: <c1/>. Testy: <c2/>.

seg-0b708f65d8d3 = Co to je a co není

seg-ad8c12a3b510 = Exportér čte dokument výsledku, který běh už zapsal. Neprovádí znovu fyziku, nepřevzorkovává, nevyhlazuje ani neinterpoluje mezi vzorky (kromě jediného přímkového úseku, který ukončuje stopu u kurzoru) a nepřidává žádné vlastní číslo. Animace je tedy přesně tak dobrá jako běh, na kterém stojí. Její úroveň je <b>MODELLED, vnitřní konzistence</b>: je to vykreslení, nikdy důkaz, a nemá žádný vlastní řádek verifikační matice.

seg-f37311ad7ef0 = Výstupy

seg-0c21f772932e = Každý formát se zapíše vedle scénáře, vedle obvyklých <c1/>, <c2/> a <c3/>:

seg-f2ce7fc60cdf = Formát

seg-51a8df15f356 = Zapsáno jako

seg-3ea93ae372ca = Co obsahuje

seg-3603593b9799 = Jedno SVG animované klíčovými snímky Cascading Style Sheets (CSS) a bez skriptu: stopy se vykreslují za pohyblivým časovým kurzorem, události se objevují ve svém okamžiku, řádky waterfallu se odhalují v časovém pořadí. Opakuje se ve smyčce, s prodlevou { "1.5" } s na dokončeném obrazu.

seg-6c91078b434e = Jeden soubor s vloženým skriptem a stylem a bez externích prostředků: přehrát a pozastavit, posuvník, rychlost (0,25x až 4x), každý panel na jednom synchronizovaném kurzoru, živá hodnota u každé stopy, pás fází a seznam událostí, který po kliknutí přeskočí. Mezerník přehrává nebo pozastavuje, šipky krokují, Home a End skáčou.

seg-df02d37cd729 = <c1/>, <c2/>, … a <c3/>.

seg-2e5ebd60cad0 = <c1/> lze opakovat a přijímá seznam oddělený čárkami (<c2/>) nebo <c3/>. <c4/> ({ "1" } až { "60" }, výchozí { "12" }) a <c5/> ({ "0.5" } s až { "600" } s, výchozí { "8" } s) nastavují přehrávání; posloupnost snímků je omezena na { "7,200" } snímků.

seg-7e012ab53f45 = Když <c1/> běží ve stejném příkazu, přehrávač HTML uvádí soubory exportu zapsané vedle něj (CZML, KML, GeoJSON, STK, SigMF) jako relativní odkazy na tyto sousední soubory; odkaz se zapíše jen pro holý název souboru, takže žádný nemůže opustit složku ani sahat do sítě. Pokročilá zpráva (<c2/>) vkládá animovaný výkres vždy, když výsledek má časovou řadu, ať <c3/> běželo, nebo ne.

seg-9c1d2204edab = Když <c1/> běží, <c2/> získá blok <c3/>: formáty, snímky za sekundu (fps), trvání, počet snímků, časový rozsah, názvy panelů, cesty JSON, z nichž byla čtena každá stopa (<c4/>), a každou řadu nalezenou, ale nevykreslenou (<c5/>). Bez <c6/> je výsledek byte-identický s prostým během.

seg-fa8388ae976e = Posloupnost snímků

seg-db4b53abe7d6 = Posloupnost má přesně <c1/> snímků. Snímek <em>i</em> ukazuje časovou osu až do <c2/>, takže první snímek je začátek a poslední je dokončený obraz. <c3/> zaznamenává <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), velikost v pixelech, <c9/>, <c10/>, čas mise každého snímku (<c11/>), fáze, události a zdroje. Opětovný export do téže složky nejprve odstraní každý již přítomný <c12/> (a nic jiného), takže kratší posloupnost nikdy nenechá snímky delší, aby je kodér četl.

seg-13b57b6d3c14 = Snímky jsou SVG, nikoli Portable Network Graphics (PNG). <c1/> sestavený s knihovnou <c2/> je čte přímo, rychlostí, s jakou byla posloupnost zapsána ({ "24" } v příkladu výše; <c3/> manifestu):

seg-b20beeb45fac = <c1/> bez <c2/> skončí s „no decoder found for: svg“. Snímky nejprve rasterizujte, například pomocí <c3/>, a zakódujte PNG:

seg-fc61f546f605 = Přístupnost a motiv

seg-7015f7ed77dc = <b>Barevné schéma.</b> Přehrávač sleduje <c1/> a při změně se překreslí; animované SVG nese světlou variantu své palety pod stejným media query. Snímky používají tmavou paletu statických grafů, protože video schéma nemá.

seg-c3b1f19f191b = <b>Omezený pohyb.</b> Při <c1/> animované SVG vypne každou animaci a ukáže dokončený obraz (jeho základní styly jsou konečný stav, takže nic není skryto) a přehrávač se otevře pozastavený na dokončeném obrazu místo přehrávání; uživatel může stále posouvat nebo stisknout Přehrát.

seg-f8dd26194eec = SVG má <c1/> a <c2/>; ovládací prvky přehrávače jsou popsaná tlačítka, vstup typu rozsah s vyslovenou časovou hodnotou a výběr.

seg-f5356cbf3675 = Co se počítá jako časová řada

seg-ba43cf36ac20 = Dokumenty výsledků se liší druh od druhu, takže exportér rozpoznává tvary, které engine vydává, místo seznamu druhů:

seg-952d09156712 = <b>Pole záznamů s časovým polem</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> nebo <c6/> v poli <c7/>), které podél pole striktně roste. Každé další číselné pole se stane stopou; totéž pole pod dvěma kořeny (<c8/> a <c9/>) sdílí panel.

seg-2c3abce3f70a = <b>Objekt se striktně rostoucím časovým polem</b> (<c1/>, <c2/>, <c3/>, …) vedle polí téže délky: sousední číselná pole, mapa <c4/> záznamů <c5/> (časová osa <c6/>), pole záznamů obsahujících taková pole (pásma <c7/>, dráhy družic konstelace) a dvourozměrné pole, jehož řádky odpovídají časové ose, se sousední frekvenční osou <c8/> (waterfall <c9/>).

seg-0edf8c38f9eb = Vedle tohoto časového pole se <c1/> (<c2/>, <c3/>, <c4/>) stanou pásem fází a <c5/> (<c6/>, <c7/>, <c8/>) se stanou značkami. Značeny jsou také skaláry <c9/> pásma (jeho první ztráta zachycení, jeho nejnižší poměr nosné k hustotě šumu).

seg-608c4fed9e98 = Stopy s jednotkou sdílejí panel, jsou-li jejich velikosti do faktoru { "100" }, takže ochrana { "50" } ns nezplošťuje chybu { "2" } ns. Vykresleno je nejvýše { "6" } panelů po { "6" } stopách; zbytek je uveden pod <c1/>. Stopy nad { "2,400" } vzorků se ztenčí rovnoměrným krokem, který ponechá poslední vzorek, a waterfall nad { "96" } × { "120" } buněk se průměruje (ve výkonu, u decibelových buněk, takže úzký rušič není zředěn).

seg-c386389e4f1d = Mezi druhy LEO se animuje každý přibalený scénář <c1/>, <c2/> a <c3/>. <c4/> se animuje ve svých režimech Doppler, společného určování polohy a časování (běh časování potřebuje <c5/>, což způsobí, že každý řádek hlásí svou časovou chybu a předpovězené sigma v každé epoše) a v režimu polárního pokrytí je odmítnut. <c6/> animuje svou aktualizaci uprostřed přeletu a je odmítnut pro analýzy kódování, intervalu proložení a porovnání modelů. Výsledky <c7/> a <c8/> nenesou časovou osu a jsou odmítnuty.

seg-eb31ec7a07b7 = Determinismus

seg-82bcf8a5b042 = Výstup je čistou funkcí dokumentu výsledku a voleb: žádné hodiny, žádné náhodné číslo, žádná iterace hash mapy, žádný přístup k souborům ani síti v knihovně a nikde žádné časové razítko, takže tentýž scénář, seed a volby dávají byte-identické soubory. Modul se pro WebAssembly sestaví beze změny; soubory zapisuje jen rozhraní příkazového řádku.

seg-77e1f459f3d3 = Použití v knihovně

seg-b3fa41e48ea5 = <c1/> animuje dokument výsledku, který už máte, a <c2/> vrací, co by se vykreslilo, aniž by to vykreslil.

seg-0857a94a948e = Omezení

seg-02f0f03af2fb = Kolo Pythonu a modul WebAssembly zatím exportér nezpřístupňují; je dostupný z příkazového řádku, z knihovny Rustu a z nástroje <c1/> serveru Model Context Protocol (MCP) (který v jedné odpovědi vrací nejvýše { "120" } snímků).

seg-cd3ec7b403ba = Osy jsou lineární. Řada zahrnující mnoho dekád (růst chyby hodin od { "0.1" } ns do mikrosekundy) vypadá až do pozdní fáze běhu plochá.

seg-ed21d370a73c = Animované SVG spoléhá na animaci CSS ořezového obdélníku; současné enginy Chromium, Firefox a Safari ho přehrají, zatímco prohlížeč bez animace CSS ukáže dokončený obraz.

seg-9dfb9596ecf3 = Kampaně průchodu, Monte Carlo a skládání nenesou časovou osu a jsou odmítnuty; souhrnné statistiky průchodu nebo souboru nejsou časová řada. Zřetězená kampaň se animuje.

seg-be1f1afe7424 = <s1>Předchozí</s1>Zprávy o běhu

seg-6817433f69f6 = <s1>Další</s1>Exporty a importy pro interoperabilitu

seg-5366f477e688 = Druh, jehož výsledek nenese žádný z těchto tvarů (rozpočet spoje, geometrie jedné epochy, shrnutí Monte Carlo pouze se statistikami nebo telekomunikační holdover, jehož výsledek zveřejňuje hash záznamu, ale ne záznam), je odmítnut s <c1/> a nic se nezapíše. S kshana { $version } se { "94" } z { "192" } spustitelných souborů scénářů (každý soubor kromě sady studií) animuje a { "98" } je odmítnuto. <c2/> vytiskne soupis.
