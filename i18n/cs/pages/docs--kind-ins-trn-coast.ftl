# docs--kind-ins-trn-coast: translations (cs)

seg-bf51947657c0 = navigace

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-c4ed27a559df = Tematická stránka: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-195347c63a8a = m/s^{ "2" }

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-f7305f3a0b5a = Zdroj: <c1/>

seg-92b90cb4a839 = <c1/> (druh scénáře)

seg-5b9a6efe6337 = Model chyby INS/TRN při setrvání bez korekce: chyba polohy v závislosti na době setrvání, sestavená z koeficientů IMU, nikoli procházená jako předpokládaná rychlost driftu. Pět příspěvků k růstu — bias akcelerometru, náklon z biasu gyroskopu přes tíži, náhodná procházka rychlosti, náhodná procházka úhlu a měřítkový faktor v závislosti na uražené vzdálenosti — každý šířený devítistavovým modelem inerciální chyby v lokální rovině se Schulerovou zpětnou vazbou při uvedené šířce a výšce (zákony vedoucího řádu pro krátké setrvání t², t³, t^{ "1.5" }, t^{ "2.5" } a t¹/t² se uvádějí vedle) a kombinované podle UVEDENÉHO pravidla (druhá odmocnina součtu čtverců ve výchozím stavu, nebo lineární součet, nebo deterministický součet se stochastickým rss; všechny tři se počítají při každém běhu, aby volba byla viditelná, a ne zakrytá). Doby setrvání, které dosáhnou prahů polohy zadaných volajícím ({ "10" } m a { "50" } m ve výchozím stavu), najde stávající půlení intervalu enginu, každá s rozpisem po příspěvcích jmenujícím dominantní zdroj, a překročení každého jednotlivého příspěvku se navíc obrátí algebraicky, aby se oba výsledky shodovaly. Režim navigace podle terénu (TRN) omezuje setrvání periodickými určeními polohy a hlásí největší interval určení, který každý práh udrží; určení pouze polohy ponechává chybu rychlosti a náklon živé i po určení, takže setrvání neomezí při každé frekvenci určení, a zpráva to říká, místo aby vracela nulu. MODELLED: koeficienty tříd IMU jsou reprezentativní údaje pásma, nikoli katalogový list, a zbytek určení polohy podle terénu je vstup. Nedosažený práh se hlásí jako null se stavem, nikdy jako nula. Nejde o certifikovaný produkt výkonu inerciální navigace.

seg-bbd497aa3ba6 = Jeden běh <c1/> se shrnuje takto: ins-trn-coast | navigation IMU, { "250" } m/s, combination rss | { "10" } m at { "251.0" } s (accel_bias) | { "50" } m at { "608.8" } s (accel_bias) | TRN position-only peak { "44.7" } m over { "1200" } s

seg-e0555ca683b1 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-95887c4551c7 = Příklad <c1/> mimo jiné nastavuje:

seg-4db5a594afc1 = rss

seg-5868f641c089 = ug

seg-1918189ac2bf = ppm

seg-7eba4c5ee1e4 = Štítek výsledku (enginu): MODELLED rozpočet chyby INS/TRN při setrvání. Každý příspěvek je šířen devítistavovým modelem inerciální chyby v lokální rovině se Schulerovou zpětnou vazbou (rovinná platforma s kursem na sever v uvedeném místě, volně inerciální včetně nestabilního vertikálního kanálu); jeho zákony vedoucího řádu pro krátké setrvání (bias t^{ "2" }, gy

seg-134a4c91da3a = Graf, který engine zapisuje pro scenarios/ins-trn-coast.toml, druh ins-trn-coast

seg-7bb77ec86a0a = <b>VALIDATED</b> Rozpočet chyby polohy v závislosti na době setrvání sestavený z koeficientů IMU, každý zdroj chyby (bias akcelerometru, bias gyroskopu, náhodná procházka rychlosti, náhodná procházka úhlu, měřítkový faktor při plavbě a při trvalé specifické síle) šířený n

seg-d69247df315f = <b>VALIDATED</b> Rozpočet chyby polohy v závislosti na době setrvání sestavený z koeficientů IMU, každý zdroj chyby (bias akcelerometru, bias gyroskopu, náhodná procházka rychlosti, náhodná procházka úhlu, . Orákulum (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), spuštěné jako samostatný program pod GNU Octave { "8.4.0" }: běhy volně inerciálního setrvání se stejným chybovým profilem IMU, s jednou opravenou numerickou mrtvou zónou v aktualizaci kvaternionu (qua_update.m: podmínka na rychlost pod { "1e-8" } rad/s nahrazena wnorm == { "0" }, aplikovaná na kopii za běhu a ověřená, že se shoduje jednou; s podmínkou na místě se pomalu driftující orientace platformy zastavila a snížila

seg-498cb2f96fa7 = MODELLED rozpočet chyby INS/TRN při setrvání. Každý příspěvek je šířen devítistavovým modelem inerciální chyby v lokální rovině se Schulerovou zpětnou vazbou (rovinná platforma s kursem na sever v uvedeném místě, volně inerciální včetně nestabilního vertikálního kanálu); jeho zákony vedoucího řádu pro krátké setrvání (bias t^{ "2" }, náklon z biasu gyroskopu t^{ "3" }, náhodná procházka rychlosti t^{ "1.5" }, náhodná procházka úhlu t^{ "2.5" }, měřítkový faktor x uražená vzdálenost) jsou křížově zkontrol (výsledek <c1/>)

seg-63c221a546f7 = Model chyby INS/TRN při setrvání bez korekce: chyba polohy v závislosti na době setrvání, sestavená z koeficientů IMU, nikoli procházená jako předpokládaná rychlost driftu. (katalog druhů (<c1/>))

seg-164504645f4a = MODELLED: koeficienty tříd IMU jsou reprezentativní údaje pásma, nikoli katalogový list, a zbytek určení polohy podle terénu je vstup. (katalog druhů (<c1/>))

seg-ee0281a1f401 = Otázka, na kterou tohle odpovídá: když studie GNSS (nebo studie s přerušovaným provozem apertury) říká „předpokládejte drift dead-reckoningu { "0.001" }–{ "0.050" } m/s“, odkud se to číslo bere? Bere se z IMU a tento scénář je počítá, místo aby je procházel. Pět členů růstu — bias akcelerometru (t^{ "2" }), náklon z biasu gyroskopu přes tíži (t^{ "3" }), náhodná procházka rychlosti (t^{ "1.5" }), náhodná procházka úhlu (t^{ "2.5" }) a měřítkový faktor krát uražená vzdál (komentář v souboru scénáře, řádky { "4" } až { "11" })

seg-32d4adcfe249 = <s1>Předchozí</s1>inertial

seg-47366ab55be3 = <s1>Další</s1>integrity
