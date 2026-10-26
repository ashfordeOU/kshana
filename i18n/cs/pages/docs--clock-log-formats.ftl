# docs--clock-log-formats: translations (cs)

seg-ca2fcdd60f65 = Zdroj: <c1/>

seg-0dfd1160c5d7 = Formáty záznamů hodin

seg-f52a62872493 = <c1/> čte změřený záznam hodin do jedné normalizované fázové řady: rovnoměrné mřížky vzorků <c2/>, s uvedeným nebo zjištěným intervalem vzorků <c3/>, se započítanou každou mezerou a s pojmenovanými jednotkami záznamu. Čte se osm formátů, každý jako zdokumentovaná podmnožina. Cokoli mimo podmnožinu se odmítne chybou, která uvádí, co bylo nalezeno, místo aby se to četlo přibližně.

seg-dbdbfec37ab6 = <b>Zkratky.</b> RINEX je Receiver Independent Exchange Format. TICC je čítač časových intervalů TAPR (Tucson Amateur Packet Radio). ADEV je překrývající se Allanova odchylka, TDEV časová odchylka a MTIE maximální chyba časového intervalu. <c1/> je interval vzorků v sekundách.

seg-1d5a6c2090af = Kde lze záznam použít

seg-2a391645eeeb = <b><c1/></b>: <c2/> místo <c3/> nebo <c4/>. Fáze záznamu v ns je řada časové chyby kontrolovaná proti maskám a zpráva získává blok <c5/>, který říká, jak byl záznam přečten.

seg-4c2a67008451 = <b>Druh clock</b>: tabulka <c1/> přidává k běhu blok <c2/>: jak byl záznam přečten, SHA-256 tabulky (<c3/>; <c4/> běhu tabulku nepokrývá) a fázových vzorků a překrývající se ADEV, TDEV a MTIE při oktávových faktorech průměrování. Vyžaduje <c5/>. Simulovaný holdover se nemění.

seg-2f464fe709c9 = Bez tabulky se oba druhy zpracovávají, hashují a uvádějí přesně jako dříve.

seg-c931c5ec2f4a = Formáty

seg-7f608c733407 = <b><c1/></b>: soubory hodin RINEX, verze { "2" } a { "3.00" } až { "3.04" } (včetně devítiznakového pole názvu ve verzi { "3.04" }). Hlavička se čte jen kvůli <c2/> a přeskakuje se až do <c3/>. Z datových záznamů se uchovávají jen záznamy <c4/> (družice) a <c5/> (přijímač nebo stanice) jedněch hodin vybraných podle názvu. Jejich první pole hodnoty, posun hodin v sekundách, je fáze. Pokračovací řádky a záznamy <c6/>, <c7/> a <c8/> se přeskakují. Epochy jsou kalendářní pole záznamu, jako sekundy od 1980-01-06 { "00" }:{ "00" }:{ "00" } ve vlastní časové soustavě souboru, bez převodu.

seg-0b758195e7eb = <b><c1/></b>: ASCII záznamy fáze nebo frekvence ve stylu TimeLab, prostá textová forma, kterou TimeLab exportuje a kterou čtou jeho import ASCII a Stable32. Na řádku je jedno čtení: buď jediný sloupec s rovnoměrným <c2/>, nebo dva sloupce <c3/>. Sloupce mohou být odděleny mezerami, čárkami nebo středníky.

seg-a7ae9e712bea = Řádky začínající <c1/>, <c2/> nebo <c3/> jsou komentáře. Komentář ve tvaru <c4/> (nebo <c5/>) nastavuje <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> nebo <c12/>, pro fázi), <c13/> (<c14/> nebo <c15/>) nebo <c16/> (<c17/> nebo <c18/>, pro první ze dvou sloupců).

seg-84cf463d5e74 = Jeden úvodní nečíselný řádek se bere jako záhlaví sloupců.

seg-84f4b59bcdbf = Frekvenční data (relativní frekvence) se přijímají pouze jako jediný sloupec. Integrují se na fázi jako <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = Binární soubory TimeLab a projektové soubory <c1/> se nečtou.

seg-3d8853fa9c92 = <b><c1/></b>: záznamy čítače TAPR TICC (TICC Operation Manual, revize z { "23" }. listopadu { "2016" }, „measurement modes“). Každé datové pole jsou sekundy s { "12" } desetinnými místy.

seg-3af6e4e7bc73 = Řádky režimu Timestamp (<c1/>, <c2/>) a kanál pseudočasových značek režimu TimeLab (<c3/>) jsou časové značky událostí. Fáze vybraného kanálu je jeho časová značka minus nominální tik: <c4/>, kde <c5/> je celý počet <c6/> od první události. Zmeškaná událost je mezera.

seg-cecf9df4ff10 = Řádky režimu Interval (<c1/> nebo jakýkoli štítek začínající <c2/>) se čtou přímo jako fáze, jedno čtení na <c3/>. Scénář musí uvést <c4/>, protože řádek nenese čas.

seg-75301936698f = Výstup režimů Period a Debug se odmítá. Kanál, jehož čtení nerostou, je hlášen jako režim Period.

seg-5ec2509907dd = Řádky začínající <c1/> a řádky, které nemají tvar <c2/> (například úvodní nabídka), se přeskakují a počítají.

seg-cb4b7062dd5a = Záznamy linuxptp a chrony

seg-c6c70813a988 = Těchto pět formátů čte, co běžící démon času zapisuje o svých vlastních hodinách. Slouží ke zpětné kontrole časovacího řetězce (hraniční hodiny, PHC grandmastera, klient chrony) týmiž estimátory jako ostatní záznamy. Nečtou konfiguraci démona a nic zde s démonem nekomunikuje.

seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: servořídicí řádky linuxptp, přičemž každý formát čte jen řádky vlastního programu. Čtení je řádek ve tvaru

seg-e32842403b6b = Časová značka je první <c1/> na řádku (monotónní hodiny démona). Čte se i za předponou syslogu, kde identifikátor procesu jako <c2/> nemá zlomek a nebere se.

seg-72678cd6c03e = Fáze je zaznamenaný <c1/> v nanosekundách, převedený na sekundy. Je to změřená časová chyba podřízených hodin démona vůči jeho referenci, tak jak byla zaznamenána: kladná, když podřízené hodiny předbíhají. Je to chyba zbývající pod servořízením, nikoli drift volně běžících hodin.

seg-f9080412572a = Slova mezi časovou značkou a <c1/> pojmenovávají zdroj (<c2/>, <c3/> pro předponu <c4/>, <c5/>, <c6/>). Záznam s více než jedním zdrojem vyžaduje <c7/>; chyba je vypíše.

seg-5bef874341f2 = Čtení před tím, než servo poprvé ohlásí <c1/> (uzamčeno), se vynechávají a počítají v <c2/>: <c3/> a <c4/> jsou stavy neuzamčeno a skok, jejichž offsety jsou přechodové jevy při náběhu. Servo, které <c5/> nikdy nedosáhne, se odmítne. Řádek bez pole stavu se čte tak, jak je.

seg-121fbe1486cf = Souhrnné řádky (<c1/>), zprávy <c2/> a <c3/> a řádky jiných programů se přeskakují a počítají.

seg-92164f4a56be = Časové značky, které jdou zpět (restartovaný démon), se odmítají; záznam rozdělte.

seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: soubory <c3/> a <c4/> programu chrony, čtené podle pozice sloupce. Čtení je řádek s alespoň { "14" } sloupci (tracking) nebo { "13" } (statistics), který začíná datem a časem UTC ve tvaru <c5/>. Řádek záhlaví sloupců se přeskakuje a počítá; čára <c6/> pod ním se přeskakuje bez započtení.

seg-bae4f6895d14 = Tracking: sloupec { "7" }, místní offset při aktualizaci hodin, v sekundách. IP adresa nebo id reference se mění s vybraným zdrojem, takže bez <c1/> se každý řádek čte jako jedny místní hodiny. <c2/> ponechá jedno id reference.

seg-12b284cd7d8c = Statistics: sloupec { "5" }, odhadnutý offset zdroje, v sekundách. Na adresu zdroje připadá jedna řada a záznam potřebuje <c1/>, pokud jich obsahuje více.

seg-197645e3c7c5 = Epochy jsou sekundy od 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, bez zpracování přestupných sekund. Chrony zapisuje řádek na každou aktualizaci nebo vzorek zdroje, takže rozestup není rovnoměrný. <c1/> je mediánový rozestup; čtení méně než půl <c2/> po uchovaném předchozím se zahodí a započítá do <c3/> a delší rozestup je mezera, kterou hlásí <c4/>. U záznamu s ustáleným intervalem dotazování zadejte <c5/> a <c6/>.

seg-61fbb0479c95 = Sloupce chrony a rozvržení řádků linuxptp odpovídají veřejné dokumentaci démonů. Fixtures v <c1/> byly pro { -brand } napsány s vymyšlenými hodnotami (viz jeho <c2/>); žádný skutečný záznam se nečetl, takže rozvržení lišící se mezi verzemi démonů může být stále odmítnuto nebo špatně přečteno. Řádek, který neodpovídá, se přeskočí a započítá, nikdy se nehádá.

seg-b120a37b7d60 = <c1/> a mezery

seg-6fd68aad2fd7 = Když záznam nese časové značky a není zadáno <c1/>, je <c2/> mediánový rozestup po sobě jdoucích časových značek zaokrouhlený na čtyři platné číslice a zdroj se uvádí jako <c3/>. Rozestup čítače se od nominálního liší o frekvenční offset reference, o { "10" }^{ "6" } dílů nebo méně. <c4/> ve scénáři vždy vyhrává (zdroj <c5/>), poté komentář záhlaví <c6/> (zdroj <c7/>).

seg-59e52611a7d3 = Vzorky se umísťují na mřížku <c1/> a chybějící epocha je mezera. Čtení vzdálenější od mřížky než { "1" } % z <c2/> se zahodí a započítá, stejně jako duplicity (první se ponechá). Politika mezer je jedna z těchto:

seg-61b1664a7c48 = <c1/> (výchozí): jakákoli mezera je chyba, která mezery spočítá;

seg-593c998b65e0 = <c1/>: ponechat nejdelší souvislý úsek bez mezer;

seg-f184ce746389 = <c1/>: doplnit vnitřní mezery lineární interpolací a uvést počet doplněných.

seg-1f3dc3429615 = Estimátory potřebují záznam bez mezer, a proto se mezery řeší zde.

seg-fe7d27a473aa = MODELLED. Toto je parser a jeho výstup napájí estimátory, které jsou jinde ověřeny proti allantools. Jednotkové testy v <c1/> používají malé ručně psané záznamy a u formátů linuxptp a chrony fixtures v <c2/>. <c3/> spouští srovnání předregistrované v <c4/>: tři seedem řízené syntetické záznamy, po jednom na formát, zpětně přečtené nezávislým čtecím modulem napsaným podle této stránky týmž autorem, s ADEV, TDEV a MTIE zkontrolovanými proti allantools { "2024.6" }; toto srovnání pokrývá jen první tři formáty a čtecí moduly linuxptp a chrony mají testy parseru, ale žádné srovnání s orákulem. Záznamy jsou syntetické, takže nic zde nepopisuje skutečné hodiny ani čítač.

seg-0f061f726ec5 = <s1>Předchozí</s1>Test holdoveru a časovací hardware ve smyčce

seg-3c89cfcbbd04 = <s1>Další</s1>Bezpečnost hardwaru

seg-9b52cd5eb4be = tau0 a mezery
