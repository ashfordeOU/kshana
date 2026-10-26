# docs--test-bench: translations (cs)

seg-245fe1f87b08 = Soubor

seg-e305279d5b11 = Obsah

seg-292871e5747d = Zdroj: <c1/>

seg-d18a29239225 = Spuštění přijímače proti exportovanému scénáři

seg-aa3498c7cb16 = Výrobce přijímačů, který vlastní laboratorní simulátor GNSS, může přes něj přehrát pohyb vozidla ze scénáře Kshana, zaznamenat, co zkoušený přijímač dělá, a log ohodnotit pomocí <c1/> proti událostem stanoveným před během. Kshana dodává pohyb, časy událostí a hodnocení. Zapisuje <b>žádný signál</b>: nic zde exportovaného nesyntetizuje, nemodeluje ani nevysílá vysokofrekvenční nebo základnopásmový průběh a exportovaná událost je pojmenovaný časový interval, nikoli návod, jak interferenci vyrobit. Signály dodává simulátor a jeho operátor a operátor odpovídá za to, že je spouští jen tam, kde je to povoleno (vedeně kabelem nebo ve stínění, podle vlastních bezpečnostních pokynů simulátoru).

seg-414c7774d133 = Tato stránka je metoda. Nezveřejňuje žádné výsledky.

seg-a0ad7b35922f = { "1" }. Export

seg-798d75d3b65c = Platí pro druh <c1/> (jízdní profil s polohou; události jsou výpadky navigačního stavu) a pro <c2/> a <c3/> (stacionární přijímač po dobu trvání scénáře; jammer ve scénáři <c4/> je jedna událost po celý běh). Ostatní druhy říkají, proč nemají trajektorii vozidla. <c5/> je okamžik UTC nulového času pohybu (výchozí 2024-01-01T00:{ "00" }:00Z); scénáře pro pohyb vozidla nenesou vlastní kalendářní datum. Musí to být skutečný okamžik UTC, <c6/> (koncové <c7/> se přijímá) s rokem v rozsahu { "2000" } až { "2099" } a každým polem v rozsahu; cokoli jiného je odmítnuto. Výstup je pro týž scénář a epochu byte-identický.

seg-c153d8ef8735 = jeden řádek na vzorek: <c1/>, vázané na Zemi <c2/>, <c3/>, geodetické <c4/>, <c5/>, <c6/>, <c7/>

seg-fa4c8c0d2b72 = epocha, soustavy, jednotky, sloupce a tolerance zpětného průchodu tohoto CSV

seg-8c74ca211e3a = věty NMEA { "0183" } <c1/> a <c2/> na vzorek, s kontrolními součty

seg-2b0fd541f1dc = řádek <c1/> a poté řádky <c2/> (zapisuje se, jen když je každý vzorkovací interval stejný celý počet milisekund; když je vynechán, příkaz důvod uvede na standardním chybovém výstupu)

seg-d09d2dab9a17 = tytéž události jako bloky <c1/> pro scénář <c2/>

seg-866a3c4870af = běh jako dokument <a1><c1/></a1> pro záznam <c2/>: události jako stanovená pravda, přičemž <c3/>, <c4/>, <c5/>, <c6/> každé události a výkon se ponechávají k doplnění laboratoří

seg-9ea6a94d4586 = Soustavy a konvence

seg-8d3b7d2ef815 = <b>Poloha:</b> WGS { "84" }, vázaná na Zemi (ECEF: <c1/> přes rovník v nultém poledníku, <c2/> přes pól); <c3/>, <c4/>, <c5/> udávají tutéž polohu geodeticky, <c6/> nad elipsoidem.

seg-93a2975d2a19 = <b>Rychlost:</b> osy vázané na Zemi, vzhledem k Zemi.

seg-be05c2278e98 = <c1/> ve směru hodinových ručiček od skutečného severu v [{ "0" }, { "360" }), <c2/> kladné příď nahoru, <c3/> kladné pravé křídlo dolů; yaw-pitch-roll (3-2-1) z lokální soustavy sever-východ-dolů na osy tělesa x dopředu, y doprava, z dolů. Stacionární zdroj zapisuje nuly. NMEA a text trasových bodů nenesou polohu (attitude).

seg-3c3ad1295628 = <b>Heading je stáčení tělesa (yaw), nikoli směr jízdy.</b> V jízdním profilu <c1/> se těleso stáčí v obdélníkových vlnách, zatímco rychlost se řídí svým směrem, takže heading a kurz nad zemí se mohou lišit o desítky stupňů (až asi { "77" } stupňů v přibaleném scénáři <c2/>). Kurz <c3/> v NMEA je kurz nad zemí, směr vektoru rychlosti, takže simulátor, který čte heading ze souboru pohybu, a ten, který čte kurz ze souboru NMEA, vidí různé úhly. Kurz nad zemí z CSV je <c4/> jeho rychlosti otočené na sever-východ-dolů.

seg-224b53995157 = <b>Výška se řídí scénářem.</b> U <c1/> je <c2/> vlastní krokování pravdy tohoto druhu v tečné rovině a nedrží se konstantní (asi { "7" } m během { "180" } s scénáře <c3/>); je to pohyb scénáře, zapsaný tak, jak je.

seg-f78a354f96ee = <b>Zástupné hodnoty NMEA <c1/>.</b> Kvalita určení polohy ({ "1" }), počet použitých družic ({ "12" }) a HDOP ({ "1.0" }) se zapisují jen proto, aby věta byla správně utvořená. Nic neříkají o geometrii scénáře ani o stavu kteréhokoli přijímače.

seg-f5cd510aac0c = <c1/> po epoše, UTC, přestupné sekundy nejsou modelovány.

seg-d2a2f655760d = <b>Výšky v NMEA jsou elipsoidální.</b> Nadmořská výška <c1/> drží elipsoidální výšku a separace geoidu je zapsána jako { "0.0" }. Simulátor, který bere výšku jako výšku nad střední hladinou moře, umístí vozidlo vedle o místní undulaci geoidu.

seg-ee3a9a3ec84d = <b>Tolerance zpětného průchodu</b> (testováno zpětným načtením každého souboru): poloha v CSV { "0.1" } mm, zeměpisná šířka a délka { "1e-9" } stupně, rychlost { "0.1" } mm/s, úhly { "1e-6" } stupně; vodorovná poloha v NMEA { "5" } mm, výška { "1" } mm, rychlost { "0.001" } uzlu, kurz { "0.001" } stupně.

seg-a554992d2694 = Načtení souborů do simulátoru

seg-757382614413 = Laboratorní simulátory se liší a tento repozitář nereprodukuje příručku žádného simulátoru. Zjistěte, který z výše uvedených formátů váš simulátor čte, a jaké má stanovené požadavky:

seg-cc49ceccea20 = Mnoho importérů pohybu očekává pevnou obnovovací frekvenci, běžně { "10" } Hz. Scénář <c1/> krokuje po { "0.1" } s; u stacionárního scénáře nastavte <c2/> na frekvenci, kterou váš simulátor chce.

seg-e98bf4bf6c6e = Někteří importéři přeskakují vzorky, které padnou mezi celé sekundy, nebo ignorují sloupec času a řídí se pořadím řádků. Zahajte pohyb na celé sekundě a udržujte pravidelnou mřížku.

seg-3c470262eb15 = Importér CSV, který umožňuje mapovat sloupce, může <c1/> číst přímo: zvolte sloupce vázané na Zemi nebo geodetické a nastavte jejich jednotky podle <c2/>. Oříznutí desetinných míst vytváří falešné zrychlení, proto zachovejte zapsanou přesnost.

seg-41a2bfe45b37 = Soubor obsahuje pouze pohyb. Konstelaci, interferenci a přední část přijímače nakonfigurujte v simulátoru a časujte je podle událostí v <c1/>.

seg-024ab011a2e3 = Kshana nezapisuje žádné skriptovací rozhraní žádného výrobce.

seg-6d67d4e2cdf0 = Zkontrolováno čtečkami jednoho open-source simulátoru

seg-e4ce0597a644 = Čtečky pohybu gps-sdr-sim (MIT, commit 28ca29a6) dostaly exporty osmi přibalených scénářů. Každá čtečka vrátila exportovanou trajektorii (<c1/>, předregistrováno v <c2/>):

seg-3caed3fc2e47 = volba gps-sdr-sim

seg-ad9e78555851 = Předejte jí

seg-4f9be75880d3 = Nejhorší rozdíl oproti CSV

seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

seg-e03dd1d45ced = <c1/> tak, jak je zapsáno

seg-8d28fbcc4c4a = { "1.2" } mm

seg-fd39660fcb73 = <c1/> (čas, zeměpisná šířka, zeměpisná délka, výška)

seg-c4e171cbf0de = { "0.15" } mm

seg-390b0c0fb695 = <c1/> (čas, x, y, z)

seg-ff26559a85e8 = přesně

seg-f4c13a327904 = Nepředávejte <c1/> úplné CSV pohybu. Jeho čtečka drží { "100" } znaků na řádek a řádek CSV má asi { "160" } znaků, takže je každý řádek čten jako dva vzorky. Řádek záhlaví je čten jako další vzorek bez čísel.

seg-43cc6f9c50b2 = gps-sdr-sim drží nejvýše { "3000" } vzorků, { "300" } s při pevných { "10" } Hz, a sloupec času ignoruje. Exporty <c1/> krokují přesně po { "0.1" } s. Delší scénáře, například 20minutový <c2/>, se čtou jen do prvních { "300" } s.

seg-500243b6e402 = Tím se kontroluje, že se soubory čtou tak, jak jsou zapsány. Nekontroluje se fyzika scénáře ani nic, co simulátor vysílá.

seg-a4c4514276e9 = { "2" }. Stanovte, co budete hodnotit, před během

seg-3a3e2be36c65 = Soubor událostí uvádí intervaly, které scénář definuje. Zkopírujte <c1/> do scénáře <c2/>, přidejte libovolnou předpověď, kterou chcete zkontrolovat, a prahové hodnoty monitorů a tolerance stanovte <b>před</b> během přijímače. Po zhlédnutí logu je neupravujte; scénář, prahové hodnoty a SHA-256 logu jsou všechny v hashi výsledku.

seg-d07b9ad8cfa9 = Exportované události nesou vlastní druh scénáře: jammer ve scénáři <c1/> je <c2/>; výpadek navigačního stavu je <c3/>, protože scénář uvádí, že GNSS nebylo dostupné, nikoli jak. Změňte <c4/> tak, aby odpovídal tomu, co simulátor nastavíte dělat.

seg-faa87b3ba315 = { "3" }. Spusťte přijímač

seg-0a3b63cf5615 = Spusťte přijímač a jeho zapisovač, spusťte scénář simulátoru se souborem pohybu a nechte běh pokrýt kalibrační interval, každou událost a rezervu po poslední z nich. Ponechte vlastní log přijímače (UBX, observace RINEX { "3" }, CSV zapisovače Android nebo NMEA s větami o stavu družic). Log bez síly signálu po družicích lze stále hodnotit podle vlastní polohy přijímače, ale monitory poměru nosné k šumu ho potřebují.

seg-fbbc12dfeb3f = { "4" }. Sladěte hodiny

seg-5828311af3d4 = <c1/> počítá časy událostí od první epochy logu přijímače; soubor pohybu počítá od svého prvního vzorku. Pokud log začíná <c2/> sekund před prvním vzorkem pohybu, přičtěte <c3/> ke každému <c4/> a <c5/>. Zaznamenejte posun a jak jste jej změřili a uveďte jej v <c6/> scénáře nebo v komentáři, protože chybný posun posouvá každé skóre. Samotné časy událostí posun neprozradí; použijte značku začátku scénáře simulátoru nebo vlastní časová razítka přijímače.

seg-22f7b68c445b = { "5" }. Hodnocení

seg-e024186a2874 = zapisuje <c1/>, <c2/> a <c3/>. U každé události výsledek uvádí falešné poplachy před začátkem, první poplach a jeho monitory, latenci a výsledek (<c4/>, <c5/>, <c6/>, <c7/>), plus předpovězený a pozorovaný pokles poměru nosné k šumu tam, kde jste předpověď stanovili. Nesoulad se hlásí, nikdy se neladí pryč. Viz <a1>RECEIVER-TRUST.md</a1>.

seg-5fa1e4890f91 = Chcete-li zjistit, které řádky veřejných rámců relace podporuje důkazy pro (supports evidence for):

seg-abc6aaf44c95 = Viz <a1>compliance/README.md</a1>. Tato zpráva popisuje důkazy v během, které jí předáte; neobsahuje žádné zjištění o přijímači ani o žádném rámci.

seg-69fa39640c2d = { "6" }. Propojte zpětný průchod v jednom podepsaném balíčku

seg-f24e2dd64c47 = Po hodnocení <c1/> svazuje čtyři záznamy: scénář, který jste exportovali, <a1>podmínky testu</a1> laboratoře, log přijímače a skóre. Vyplňte <c2/> (cestu a SHA-256 logu, zkoušený přijímač, typ a stanovený výkon každé události) a poté:

seg-78bed55de550 = <c1/> nese blok <c2/> (<c3/>) s <c4/>, <c5/>, <c6/> a skóre (události zachycené z hodnotitelných, první poplach), pokrytý hashi manifestu a podpisem. Příkaz odmítne balíček, jehož podmínky a hodnocené události si odporují, nebo jehož uvedený hash logu není hashem logu. Jako každý balíček důkazů je to technický záznam, nikoli právní posudek.

seg-5fe6548911da = Praktický příklad: gps-sdr-sim zapisující soubor

seg-eeccc823e109 = Tento příklad používá open-source simulátor gps-sdr-sim jen k <b>zapsání souboru v základním pásmu</b> z exportovaného pohybu. Kshana nevysílá a nic na této stránce neautomatizuje přehrávání tohoto souboru přes rádio. Pokud vaše laboratoř takový soubor přehrává do přijímače, je to odpovědnost vašeho operátora, prováděná jen tam, kde je to povoleno (kabelem nebo ve stínění, podle bezpečnostních pokynů simulátoru i rádia), a Kshana to nedokumentuje ani neobaluje.

seg-db81fdadfd19 = Cokoli laboratoř s <c1/> pak udělá, se děje mimo Kshana. Vlastní log přijímače, ať byl získán jakkoli, je to, co hodnotí krok { "5" } a propojuje krok { "6" }. Soubory a kontroly, které Kshana provádí na vlastních exportech, jsou testovány pouze na syntetických datech (<c2/>); žádný laboratorní běh se zde netvrdí.

seg-dffcbdb8e6c3 = Co tato metoda nedělá

seg-d0b62c238953 = Nevytváří signál a neříká, jakou interferenci má simulátor generovat. Události říkají kdy, nikoli co.

seg-3aa11bed60c8 = Jedna relace je jeden datový bod. Výsledek popisuje daný log za dané konfigurace a nic neříká o jiných přijímačích, firmwaru, anténách ani o skutečné interferenci.

seg-b156403456e4 = Výšky, rychlosti a časové sladění musí operátor zkontrolovat proti simulátoru; export uvádí vlastní konvence a tolerance a nic víc.

seg-337ff53bc890 = <s1>Předchozí</s1>kshana-bench

seg-87be81f5e600 = <s1>Další</s1>Mapování compliance
