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

seg-0b758195e7eb = <b><c1/></b>: ASCII záznamy fáze nebo frekvence ve stylu TimeLab, prostá textová forma, kterou TimeLab exportuje a kterou čtou jeho import ASCII a Stable32. Na řádku je jedno čtení: buď jediný sloupec s rovnoměrným <c2/>, nebo dva sloupce <c3/>. Sloupce mohou být odděleny mezerami, čárkami nebo středníky.

seg-a7ae9e712bea = Řádky začínající <c1/>, <c2/> nebo <c3/> jsou komentáře. Komentář ve tvaru <c4/> (nebo <c5/>) nastavuje <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> nebo <c12/>, pro fázi), <c13/> (<c14/> nebo <c15/>) nebo <c16/> (<c17/> nebo <c18/>, pro první ze dvou sloupců).

seg-84cf463d5e74 = Jeden úvodní nečíselný řádek se bere jako záhlaví sloupců.

seg-84f4b59bcdbf = Frekvenční data (relativní frekvence) se přijímají pouze jako jediný sloupec. Integrují se na fázi jako <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = Binární soubory TimeLab a projektové soubory <c1/> se nečtou.

seg-3af6e4e7bc73 = Řádky režimu Timestamp (<c1/>, <c2/>) a kanál pseudočasových značek režimu TimeLab (<c3/>) jsou časové značky událostí. Fáze vybraného kanálu je jeho časová značka minus nominální tik: <c4/>, kde <c5/> je celý počet <c6/> od první události. Zmeškaná událost je mezera.

seg-cecf9df4ff10 = Řádky režimu Interval (<c1/> nebo jakýkoli štítek začínající <c2/>) se čtou přímo jako fáze, jedno čtení na <c3/>. Scénář musí uvést <c4/>, protože řádek nenese čas.

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

seg-0f061f726ec5 = <s1>Předchozí</s1>Test holdoveru a časovací hardware ve smyčce

seg-3c89cfcbbd04 = <s1>Další</s1>Bezpečnost hardwaru

seg-9b52cd5eb4be = tau0 a mezery

seg-9c8042f0d3d7 = <b><c1/></b>: soubory hodin RINEX, verze { "2.00" } a { "3.00" } až { "3.04" } (včetně devítiznakového pole jména ve verzi { "3.04" }). Záznam <c2/> se kontroluje a každá jiná verze je odmítnuta s uvedením nalezené verze: IGS zveřejňuje formát hodin (<c3/>, <c4/>, <c5/>) až do { "3.04" } a dokumenty RINEX { "4.00" }, { "4.01" } a { "4.02" } definují jen soubory pozorování, navigace a meteorologické, takže verze { "4.00" } souboru hodin ke čtení neexistuje. Hlavička se čte jen kvůli <c6/> a přeskakuje se až po <c7/>. Z datových záznamů se ponechávají jen záznamy <c8/> (družice) a <c9/> (přijímač nebo stanice) jedněch hodin vybraných podle jména. Jejich první hodnotové pole, předpětí hodin v sekundách, je fáze. Pokračovací řádky a záznamy <c10/>, <c11/> a <c12/> se přeskakují. Epochy jsou kalendářní pole záznamu, jako sekundy od 1980-01-06 { "00" }:{ "00" }:{ "00" } ve vlastní časové soustavě souboru, bez převodu.

seg-b65f4a928891 = <b><c1/></b>: záznamy čítače TAPR TICC (TICC Operation Manual, revize z { "23" }. listopadu { "2016" } a { "15" }. prosince { "2025" }, „measurement modes“). Každé datové pole jsou sekundy s { "12" } desetinnými místy (výchozí { "11" } od firmwaru { "20251101" }: čte se libovolný počet až { "15" }). Časové razítko se čte z desetinného textu jako celé číslo femtosekund, nikoli jako binární číslo s plovoucí řádovou čárkou, takže fáze záznamu pořízeného dny po spuštění čítače zachovává vlastní rozlišení čítače: časové razítko <c2/> při { "3.0e5" } s má rozestup { "5.8e-11" } s, asi { "60" } ps čítače.

seg-bb51bfa2a834 = Režim Paired Timestamp tiskne stejné řádky v pořadí kanálů a čte se jako režim Timestamp; režim 3-Corner Hat přidává syntetizovaný <c1/>, čtený jak je uvedeno výše.

seg-220bc7450e83 = Výstup režimů Period a Debug je odmítnut. Kanál, jehož odečty neroste, je hlášen jako režim Period. Binární režim Timestamp není text a soubor v něm je odmítnut se zprávou, která to říká.

seg-1138c53b3eac = Vaše vlastní hodiny

seg-1f9cce016fa0 = Tabulka <c1/> u druhu clock uvádí, jak stabilní byly vaše vlastní hodiny, vedle simulace: <c2/> (<c3/>) je <c4/> s výřezem 96 odečtů hodin družice IGS jako vloženým záznamem TimeLab. Nahraďte <c5/> hodnotami <c6/> a <c7/> pro svůj soubor. Blok <c8/> ve výsledku obsahuje, jak byl záznam přečten (formát, <c9/> a odkud pochází, každá mezera) a jeho ADEV, TDEV a MTIE; simulaci nemění.

seg-584564d1a734 = Řízení holdoveru vlastními hodinami: <c1/>

seg-56799b5fea19 = Záznam se fituje postupem karty zařízení z <c1/> (úprava, odstranění kvadratické složky, identifikace šumu s lagem 1, vážené nejmenší čtverce v bílém PM, bílém FM, flicker FM a random-walk FM při časech průměrování s alespoň { "30" } stupni volnosti). Pojmenované hodiny pak přebírají <c2/>, <c3/>, <c4/> a nafitovaný <c5/>; <c6/> zůstává, jak jej má scénář, protože záznam nese ofset své reference, nikoli hodin po disciplinaci. Bílý fázový šum se fituje a uvádí, ale nesimuluje. Výsledek získává blok <c7/> (koeficienty, body fitu, hodnoty, které běh použil, co bylo vynecháno, SHA-256 záznamu) a hodiny nesou id <c8/>. S <c9/> čerpá soubor běhů z nafitovaných hodin (blok <c10/> potřebuje <c11/>). Fit bez frekvenčního šumu, záznam příliš krátký na fit a <c12/> jiný než <c13/> nebo <c14/> jsou chyby, které to říkají. <c15/> je příklad ({ "6" } hodin hodin družice IGS).

seg-fe695061eed3 = Co ukazuje srovnání na známém šumu (<c1/>) a co mít na paměti:

seg-90657795ba62 = Splněno: úroveň bílého FM se obnoví do { "5" } % na každém syntetickém záznamu, který jej má; nafitovaná karta reprodukuje skutečnou Allanovu odchylku v rozmezí faktoru { "1.35" } při každém času průměrování, pro který byla fitována; exponent šumu, který fit identifikuje, se rovná exponentu z allantools v každém bodě (na záznamu 5071A poté, co je fázový skok, který úprava odstraní, odstraněn i ze vstupu allantools).

seg-f1ec27a393ae = <b>Nesplněno a zafixováno testem:</b> random-walk FM se obnoví jen tehdy, když dominuje nejdelším časům průměrování záznamu, a i tehdy jen u jednoho ze tří záznamů řady o { "131 072" } s s překřížením při { "3 000" } s; fit jej přiřadil flicker FM a driftu. Rozdělení mezi random-walk FM a flicker FM není z jednoho záznamu spolehlivé. Běh reprodukuje stabilitu záznamu v časech průměrování, které záznam pokrývá; za nimi se obě volby rozcházejí (flicker FM je konstantní podlaha, random-walk FM roste jako druhá odmocnina času průměrování).

seg-88ba5ae782d4 = MODELLED: scénář „co kdyby“ pro šum těchto hodin tak, jak jej záznam ukazuje, nikoli kalibrace hodin ani předpověď jejich budoucího chování.

seg-6e88b597bbf0 = Chybně utvořený záznam je chyba, která uvádí, co bylo nalezeno (řádek, verzi, chybějící volič), nikdy částečný výsledek: <c1/> zafixovává { "24" } takových případů.

seg-4a05abb27420 = MODELLED. Toto je parser a jeho výstup krmí odhadovače, které jsou jinde validovány proti allantools. Jednotkové testy v <c1/> používají malé ručně psané záznamy a pro formáty linuxptp a chrony fixtury v <c2/>. <c3/> spouští srovnání předregistrované v <c4/>: tři syntetické záznamy se seedem, po jednom na formát, načtené zpět nezávislou čtečkou napsanou podle této stránky týmž autorem, s ADEV, TDEV a MTIE zkontrolovanými proti allantools { "2024.6" }; toto srovnání pokrývá jen první tři formáty a čtečky linuxptp a chrony mají testy parseru, ale žádné srovnání s orákulem. Záznamy tohoto srovnání jsou syntetické, takže nic z toho nepopisuje skutečné hodiny ani čítač; srovnání na změřených řadách je popsáno níže.

seg-576211abf0b4 = Na změřených datech

seg-3c8d10e8bd1c = <c1/> spouští srovnání předregistrované v <c2/> (odevzdané před jakoukoli fixturou či během) na čtyřech změřených řadách: <c3/> ze Stable32, prvních { "65 536" } odečtů cesiových hodin 5071A proti vodíkovému maseru a hodinách družice IGS G01 ({ "30" } s) a stanice ABMF ({ "300" } s) z finálních hodin IGS ze 2026-08-02, jako vendorovaný výřez s jeho NOTICE. První dvě nenesou povolení k redistribuci: záznamy z nich zapsané jsou v <c4/> ignorovaném gitem (<c5/>) a test to uvádí a při jejich nepřítomnosti projde, pokud není <c6/>. Každý záznam čte engine i nezávislá čtečka a ADEV, TDEV a MTIE se porovnávají s allantools { "2024.6" }. Zaznamenáno v <c7/>: u dodávané čtečky selhaly na předregistrovaných prazích záznamy TICC, verze hlavičky a pět chybových zpráv; byly opraveny a srovnání bylo znovu spuštěno beze změny. Splněno kromě jednoho páru: MTIE frekvenčního záznamu se liší od allantools, protože allantools integruje frekvenci minus její střední hodnotu (zafixováno jako NOT MET; srovnání na stejném základě je splněno). Řádek zůstává MODELLED: záznamy TICC jsou změřená data hodin překódovaná naším skriptem do rozvržení čítače (žádný skutečný záznam z TICC nebyl nalezen) a referenční čtečka má stejného autora jako ta v enginu.

seg-52778d17f4db = Řízení holdoveru vlastními hodinami: [clock_fit]
