# docs--kind-link-budget: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: řádky <a1>verifikační matice</a1>, které tento druh jmenují.

seg-120fcc840b87 = Zdroj: <c1/>

seg-738aa7d45efb = <c1/> (druh scénáře)

seg-953188c11165 = Jednosměrný rozpočet spoje podle rovnice spoje CCSDS { "401" } / DSN 810-005: ztráta volným prostorem, C/N₀, Eb/N₀, rezerva a uzavření spoje pro vysílané EIRP, přijímací G/T, vzdálenost, datovou rychlost a pásmo (s|x|ka) vůči požadovanému Eb/N₀. Deterministický inženýrský výpočet z dodaných vstupů (nejde o kalibrovaný datasheet terminálu).

seg-6697c741d09c = Jeden běh <c1/> se shrne takto: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, rezerva { "92.1" } dB (spoj se uzavírá)

seg-2305502051b6 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-588476f4ae75 = Příklad <c1/> mimo jiné nastavuje:

seg-ebb923e1a3b5 = Popisek výsledku (od enginu): Jednosměrný rozpočet spoje podle rovnice spoje CCSDS { "401" } / DSN 810-005 (EIRP − FSPL − L_other + G/T − k); deterministický inženýrský výpočet z dodaných vstupů, NEJDE o kalibrovaný datasheet terminálu

seg-bd375631bc7e = Graf, který engine zapisuje pro scenarios/link-budget.toml, druh link-budget

seg-4f92669c3946 = <b>VALIDATED</b> Ztráta volným prostorem, C/N₀, Eb/N₀, rezerva a uzavření spoje podle rovnice spoje CCSDS { "401" } / DSN 810-005 pro EIRP/G·T/vzdálenost/rychlost/pásmo vůči požadovanému Eb/N₀. Testy: <a1>one_way_link_budget_reference.rs</a1>.

seg-bfaeb6f1cc5a = <b>VALIDATED</b> Ztráta volným prostorem, C/N₀, Eb/N₀, rezerva a uzavření spoje podle rovnice spoje CCSDS { "401" } / DSN 810-005 pro EIRP/G·T/vzdálenost/rychlost/pásmo vůči požadovanému Eb/N₀. Runn. Orákulum (ExternalDataset): Publikovaná tabulka řízení návrhu hlubokovesmírné telekomunikace jako zafixované číselné vektory: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Table 1-1 (Galileo X-band) — kshana znovu sestaví položky tabulky a reprodukuje její publikovanou celkovou hodnotu L_fs { "290.54" } dB a Pr/N0 { "54.6" } dB-Hz; ztráta volným prostorem je také ověřena proti ITU-R P.525

seg-2598c2360113 = <b>MODELLED</b> Zpráva link-budget uvádí každou absolutní konstantu, ze které byla vypočtena její vlastní rezerva -- nosnou frekvenci, kterou použila ztráta volným prostorem, EIRP, hodnotu o. Orákulum (InternalConsistency): Žádné vnější orákulum: jde o sebepopis nad rovnicí, která již byla ověřena proti publikované tabulce řízení návrhu (viz řádek jednosměrného rozpočtu spoje). Je zaznamenán, protože jeho absence byla změřenou vadou -- reprodukce vydaného d1_rate_gain_beamwidth.csv vyžadovala zpětným dopočtem určit jednu efektivní konstantu na { "0.0034" } dB ze všech třiceti řádků a engine nyní tuto kombinaci jak pojmenovává, tak testem dokazuje

seg-c779823e860c = Volitelné: šumová teplota přijímacího systému (K). NENÍ vstupem rovnice spoje -- ta potřebuje pouze poměr G/T -- ale její uvedení umožní, aby zpráva udala také zisk přijímací antény, který ukazatel kvality implikuje (G = G/T + { "10" }*log10(T_sys)). Pokud se vynechá, rozdělení zisku ve zprávě chybí, místo aby se předpokládalo. tsys_k = { "300.0" } (komentář v souboru scénáře, řádky { "21" } až { "25" })

seg-d717412c4f06 = Sebepopis zprávy link-budget je MODELLED, nikoli ověřený: je kontrolován proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-ffbc9de75306 = <s1>Předchozí</s1>leo-signal

seg-59d4cb995cb9 = <s1>Další</s1>lunar-attack-surface

seg-a3697ad561db = Hz

seg-cec5c06d38af = <b>MODELLED</b> Lunárně nativní poměr rušení k signálu, efektivní C/N₀ a ztráta zachycení pro uživatele na selenografickém povrchu pod rušičkou na lunárním povrchu (nebo zvýšenou) nad ilustrativní konstelací třídy Moonlight/LCNS z veřejných zdrojů.
