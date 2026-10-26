# docs--kind-lunar-jamming: translations (cs)

seg-37d16b499bc5 = dB

seg-bcb02ffed4d0 = Zdroj: <c1/>

seg-612388918e36 = <c1/> (druh scénáře)

seg-a91a9ad5d8d1 = Lunárně nativní rušení RF (jamming): poměr rušení k signálu pro každou družici, efektivní C/N₀ a ztráta zachycení signálu pro selenografického povrchového uživatele pod lunárním povrchovým (nebo zvýšeným) rušičem nad ilustrativní konstelací třídy Moonlight/LCNS na lunární oběžné dráze z veřejných zdrojů. Skládá existující otevřenou fyziku rušení (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) s existující lunární geometrií oblohy (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); žádná geometrie ani radiometrie se neodvozuje znovu. Na rozdíl od pozemního druhu <c1/> NENÍ signálová větev pevným přijatým výkonem: izotropní přijatý výkon každé družice je její vlastní rozpočet spoje EIRP − FSPL(šikmá vzdálenost), takže J/S se mění od družice k družici s lunární vzdáleností a elevací. Uvádí JEDEN ŘÁDEK NA KAŽDÝ VIDITELNÝ SPOJ (epocha, družice) — azimut, elevaci, šikmou vzdálenost, oba přijaté výkony, jejichž rozdílem je J/S, J/S, nominální a efektivní C/N₀ a stav zachycení — plus souhrnné ukazatele kvality vedle této tabulky (nikdy místo ní) a tutéž tabulku jako artefakt CSV. Každé vydané číselné pole nese jednotku a třídu původu. Dílčí výsledky VALIDATED nesou orákulum svého zdrojového modulu (rovnice protirušení a spoj J/S podle Kaplan & Hegarty §{ "9.4" }, externě odkazované v tests/gnss_denied_jamming_resilience_reference.rs; lunární geometrie z lunar_service). Samotná kompozice je křížově ověřena proti nezávislé cestě se dvěma rozpočty spoje (linkbudget::received_signal_power_dbw, jiný výraz pro ztrátu volným prostorem) na { "1e-9" } dB. MODELLED: ilustrativní konstelace, reprezentativní EIRP / výkon rušiče / zisky antén / šumová teplota a absence stínění terénem, vícecestného šíření, dynamiky AGC a adaptivního nulování. Nejde o produkt zabezpečení s certifikací proti odepření služby. Při nakonfigurovaném rušiči nese zpráva také KONTURU ODEPŘENÍ S PÁSMEM NEJISTOTY, a nikoli konturu odečtenou z jednoho skaláru: celé měřené rozdělení C/N₀ užitečného signálu přes tabulku jednotlivých družic (n, min, p05, p25, medián, p75, p95, max, průměr, výběrová směrodatná odchylka a vlastní asymetrie výběru) a konturu vyhodnocenou v každé z těchto pořadových statistik podle OBOU kritérií odepření, která engine uznává — zavedeného kritéria poměru výkonů (J/S = { "30" } dB, jako v attack-surface a tracking-loop) a kritéria ztráty zachycení (efektivní C/N₀ klesající na tracking_threshold_dbhz, kritérium, které používá sloupec stavu této zprávy) — na obou osách roviny odepření (požadované EIRP rušiče při odstupu scénáře, odstup odepření při EIRP scénáře). Meze pásma JSOU contour(p05) a contour(p95), tatáž mapa v uzavřeném tvaru aplikovaná na vlastní kvantily výběru: nikoli sigma nafitovaná na výběr a nikoli medián ± k·stdev, přičemž stdev se vydává kvůli kontinuitě a nic ho nepoužívá. Kvantil, který je již na úrovni prahu sledování nebo pod ní, nemá žádné konečné odpírající J/S a jeho sloupce ztráty zachycení jsou null s započítaným důvodem, nikdy ořezaný poloměr.

seg-6693c3ebcb07 = Jeden běh <c1/> se shrne takto: lunar-jamming | { "4" } družic, { "12" } epoch, { "38" } spojů z (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (průměr { "35.622" }) | { "0" } LOST | dostupnost { "0.167" } z { "0.167" } nominální

seg-6e01b6354e40 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-c61fb6515ed9 = Příklad <c1/> mimo jiné nastavuje:

seg-6fe8b3c6c584 = Graf, který engine zapisuje pro scenarios/lunar-jamming.toml, druh lunar-jamming

seg-d4ae2f589112 = <b>MODELLED</b> Lunárně nativní poměr rušení k signálu, efektivní C/N₀ a ztráta zachycení signálu pro selenografického povrchového uživatele pod lunárním povrchovým (nebo zvýšeným) rušičem nad ilustr. Orákulum (ReferenceImpl): Křížová kontrola kompozice proti nezávislé cestě kódu v repozitáři: každé J/S spoje je znovu odvozeno jako rozdíl dvou rozpočtů spoje vypočtených pomocí linkbudget::received_signal_power_dbw, jejíž ztráta volným prostorem je jediný výraz { "20" }·log10(4πRf/c) místo třítočlenného součtu, který používá jamming::free_space_path_loss_db — obě se shodují na < { "1e-9" } dB v každém řádku (změřený nejhorší případ { "7.11e-14" } dB, tj. zaokrouhlení v pohyblivé řádové čárce)

seg-dbe54e7cc800 = <b>MODELLED</b> Zpráva <c1/> už neopírá svou konturu odepření o jeden skalár. Vydává celé měřené rozdělení C/N₀ užitečného signálu přes tabulku jednotlivých družic. Orákulum (InternalConsistency): Vnitřní konzistence vůči vlastním dopředným funkcím enginu, což je vše, co si tato schopnost může čestně nárokovat. Každý bod kontury je inverze v uzavřeném tvaru a každá inverze je kontrolována tím, že se její výsledek protlačí zpět DOPŘEDNOU funkcí, kterou byly hodnoceny vlastní řádky zprávy: sloupec J/S přes jamming::effective_cn0_dbhz (která musí vrátit tracking_threshold_dbhz s přesností < { "1e-9" } dB-Hz), sloupec odstupu

seg-d48926e62856 = MODELLED: ilustrativní konstelace, reprezentativní EIRP / výkon rušiče / zisky antén / šumová teplota a absence stínění terénem, vícecestného šíření, dynamiky AGC a adaptivního nulování. (katalog druhů (<c1/>))

seg-c455dbcb9f8c = MODELLED. Konstelace je ilustrativní geometrie třídy Moonlight/LCNS z veřejných zdrojů (nikoli skutečné efemeridy; nic nenaznačuje spojení ani podporu) a model interference je rozpočet spoje: žádné stínění rušiče terénem (efekt prvního řádu v terénu u jižního pólu), žádné vícecestné šíření, žádná dynamika AGC blízko/daleko, žádné adaptivní nulování, žádná hystereze akvizice vůči sledování. (komentář v souboru scénáře, řádky { "26" } až { "30" })

seg-da57cc7f1aa4 = Rušení RF při navigaci na povrchu Měsíce (J/S jednotlivých družic) je MODELLED, nikoli ověřené: je kontrolováno proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale není externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-dba1589d3c1e = Lunární kontura odepření s pásmem nejistoty z měřeného rozptylu C/N₀ je MODELLED, nikoli ověřená: je kontrolována proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-a2889fb2b42a = Tematická stránka: <a1>integrations.md</a1>

seg-03b50b21e5a8 = <s1>Předchozí</s1>lunar-interop-export

seg-02568469f628 = <s1>Další</s1>lunar-joint-od-clock
