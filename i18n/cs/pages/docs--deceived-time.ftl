# docs--deceived-time: translations (cs)

seg-d46702617926 = Zdroj: <c1/>

seg-f44d01df7b1c = Podepsaný příkaz použitý v podvrženém čase stále špatně směruje

seg-6497012e401e = Technická poznámka pro provozovatele sítí indexovaných časem: konstelací, které směrují, zadávají úlohy nebo předávají spojení podle rozvrhu, kde každý uzel jedná, když jeho vlastní hodiny dosáhnou naplánovaného okamžiku.

seg-714bce435435 = Zkratky: GNSS, globální družicový navigační systém; TPL, časová ochranná úroveň; PNT, určování polohy, navigace a času.

seg-a7208323de1c = Tvrzení

seg-246715a1c559 = Ověřování řídicích zpráv, včetně postkvantových podpisů, dokazuje, kdo zprávu poslal a že nebyla pozměněna. Nedokazuje, <b>kdy podle ní přijímač jedná</b>. Uzel provádí příkaz indexovaný časem podle vlastních hodin. Pokud byly tyto hodiny posunuty o <c1/>, příkaz platný pro okamžik <c2/> se provede ve skutečném čase <c3/>, přičemž všechny podpisy zůstanou nedotčené. Jakmile <c4/> překročí ochranný interval slotu, provoz skončí ve špatném slotu, spoj se přepne, zatímco druhý konec ještě míří jinam, nebo dojde k předčasnému předání. Síť směruje chybně a každá kontrola integrity v cestě příkazu hlásí úspěch.

seg-8683f0749042 = Proč jsou hodiny měkkým cílem

seg-1af5aea2ef5b = <b>Čas GNSS je obvyklá reference a lze jej podvrhnout (spoofing).</b> Uzel, který disciplinuje své hodiny podle GNSS, zdědí jakýkoli čas, který přijímač dodává. Spoofer, který udržuje vlastní příznaky kvality přijímače zelené, může tento čas pomalu posouvat.

seg-354a4c706264 = <b>Kontroly čerstvosti používají tytéž hodiny.</b> Okno platnosti („přijmout tento příkaz do <c1/>“) nebo čítač proti přehrání vázaný na čas se posuzuje podle místních hodin, takže posunuté hodiny mohou také rozšířit okno, v němž se přijme zachycený podepsaný příkaz.

seg-a4b8a5db0975 = <b>Útok nepotřebuje žádný klíč.</b> Nic v podepsaném kanálu se nemění. Silnější kryptografie zvyšuje cenu padělání příkazu a tuto cenu ponechává beze změny.

seg-e514b03fbae3 = Toto stojí vedle postkvantové práce, ne proti ní: obojí uzavírá jiné díry. Podpisy zastaví padělaný příkaz. Integrita času zastaví provedení pravého příkazu ve špatný okamžik.

seg-09f493386dbc = Co to ohraničuje

seg-750bd90b0ee1 = Čtyři opatření, každé kvantifikované druhem scénáře <c1/> (<a1><c2/></a1>):

seg-77cf39b434b5 = <b>Monitor podporovaný hodinami.</b> Porovnejte čas GNSS s vlastními hodinami uzlu, které v daném okně dojíždějí setrvačně, a vyhlaste poplach, když je rozdíl příliš velký na to, aby šlo o šum hodin. Podmíněná TPL ohraničuje chybu, která může zůstat nepovšimnuta před poplachem.

seg-e58f7fb94ac5 = <b>Nezávislé kontroly, naplánované.</b> Obousměrný přenos času z pozemní stanice nebo porovnání přes křížový spoj se sousedem mimo dosah spooferu omezuje, jak dlouho může pomalé posouvání trvat. Jejich interval opakování je bezpečnostním parametrem, nikoli jen provozním.

seg-69590f56817c = <b>Geometrie.</b> Pozemní spoofer dosáhne družice na nízké oběžné dráze Země jen tehdy, když je nad horizontem spooferu, takže posunutí je omezeno rychlostí náběhu spooferu krát toto okno. Jako aritmetika: náběh { "10" } ns/s udržovaný { "600" } s činí { "6" } µs. Přibalený příklad (<c1/>: dráha { "550" } km, maximální náběh { "10" } ns/s) uvádí expozici spooferu { "732" } s a posunutí omezené náběhem { "7 321" } ns.

seg-e8e52ce05943 = <b>Ochranný interval dimenzovaný podle meze a bezpečná akce při poplachu.</b> Ochranný interval slotu by měl pokrýt největší nezjištěnou chybu, kterou monitor a kontroly připouštějí, nikoli jen šum volně běžících hodin. Při poplachu by uzel měl držet svůj poslední dobrý rozvrh na hodinách s setrvačným dojezdem, místo aby následoval GNSS.

seg-c11b66f214ac = Co tato poznámka netvrdí

seg-8b0ed39ead25 = Netvrdí, že bylo pozorováno, jak podvržená družice způsobuje chybné směrování; neodhaduje expozici žádného provozovatele; a meze, na které odkazuje, jsou MODELLED, podmíněné detekcí a uvedenými předpoklady o hrozbě. Argumentuje složením: platný podpis a správný čas provedení jsou samostatné vlastnosti a síť indexovaná časem potřebuje obě.

seg-c1bf6467e3c9 = <s1>Předchozí</s1>Telekomunikační časování

seg-d4e9bfd42982 = <s1>Další</s1>Test holdoveru a časovací hardware ve smyčce
