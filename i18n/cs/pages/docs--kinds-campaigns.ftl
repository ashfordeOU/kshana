# docs--kinds-campaigns: translations (cs)

seg-b03d56f501c3 = Druh

seg-a07990e776cb = Campaign: existující druhy scénářů složené do jednoho běhu, přičemž každé číslo je načteno ze skutečného běhu pojmenovaného druhu. Čtyři oddíly v libovolné kombinaci. FÁZE: řetězená mise na jedné sdílené časové ose -- každá fáze spouští jeden nebo více scénářů (například rušení, poté spoofing, poté hodiny v holdoveru s inerciálním navigačním systémem, který letí vedle nich, poté alarm integrity, poté zotavení), jejich výstupy se načítají do pojmenovaných kanálů (časová chyba hodin proti jejich ochranné mezi, poměr nosné k hustotě šumu proti prahu sledování, ochranná úroveň proti mezi výstrahy, chyba polohy, sledované družice, příznaky alarmu) předvolbou pro daný druh nebo explicitními cestami k výsledkům a převzorkují se na společnou mřížku podržením nultého řádu, s hranicemi fází a událostmi; stav se předává pomocí carry (kanál pokračuje od koncové hodnoty předchozí fáze), handoff (číslo z předchozí fáze zapsané do scénáře této fáze) a end_at (fáze končí v čase, který vypočetl nějaký běh, například v čase detekce monitoru spoofingu). SWEEP: mřížka přes jeden až tři klíče scénáře zapsané s tečkami, libovolného druhu (celočíselný segment indexuje pole tabulek, jako v system.2.sisre_m), s metrikami načítanými podle cesty k výsledku a, pokud je počet běhů větší než jedna, s Monte Carlo souborem se seedem v každém uzlu. MONTE_CARLO: realizace k běží se seedem base_seed + k; každá metrika uvádí průměr, směrodatnou odchylku, percentily 5., 50. a 95. podle nejbližší pořadové hodnoty a bootstrapový { "95" }% interval spolehlivosti průměru s pevným seedem. COMPOSE: několik scénářů se sdílenými hodnotami (výkon a poloha jednoho rušiče zapsané do námořního a silničního přijímače) s kombinovaným souhrnem nejlepšího a nejhoršího případu. Výsledek nese hash kampaně, souhrn přes všechny výsledky členů a záznam jednotek pro každé emitované číslo; exporty pro interoperabilitu zapisují každý členský scénář, který má geometrii, jako vlastní sadu souborů. Identity skládání jsou testovány: jednofázová kampaň reprodukuje samostatný běh bit po bitu, soubor s pevným seedem je bajtově stabilní a u hodin se šumem bílé frekvence leží průměr souboru uvnitř uvedeného intervalu a rozptyl odpovídá sqrt(q_wf * tau). MODELLED: aditivní carry a podržení nultého řádu jsou modelové volby a každá fáze nese označení druhu, který ji spustil.

seg-b2c7cd1f9712 = Graf, který engine zapisuje pro scenarios/campaign-sweep-jammer-power.toml, druh campaign

seg-ea93f81fa08b = Zdroj: <c1/>

seg-7f8e8af56bc0 = Kampaně (rodina druhů scénářů)

seg-c8012ee549ea = { "1" } druh scénáře enginu v{ $version }. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází od enginu nebo z verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se označení získává: část Evidence v README).

seg-09ed7c4e175c = Tematické stránky: <a1>CAMPAIGNS</a1>. Spusťte jednu: <c1/>. Všechny rodiny: <a2>KINDS.md</a2>.

seg-b49ec180e810 = Přehledový list grafů, které engine zapisuje pro druhy z rodiny Kampaně

seg-4e31c8daf798 = Registr

seg-b2016159c9d0 = Kampaň: existující druhy scénářů složené do jednoho běhu, přičemž každé číslo je převzato ze skutečného běhu uvedeného druhu.

seg-25148644a262 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-e0334a6899b6 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>campaign</a1>.

seg-906f63ffbc30 = <s1>Předchozí</s1>Kodex chování

seg-cdf23ced49bd = <s1>Další</s1>Hodiny časování a holdover
