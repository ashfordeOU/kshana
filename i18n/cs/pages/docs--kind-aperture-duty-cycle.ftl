# docs--kind-aperture-duty-cycle: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-4b695c0dfc9f = Zdroj: <c1/>

seg-632c0a545845 = <c1/> (druh scénáře)

seg-0cef33b41040 = Aperture duty cycle: časové rozdělení mezi navigaci a komunikaci, které vyplývá z plánu kontaktů pro skupinu řiditelných apertur. Vstupem je plán kontaktů (seznam oken <c1/> aos_s/los_s, z nichž každé požaduje navigaci nebo komunikaci, tedy stejný slovník aos_s/los_s, jaký vydává prediktor <c2/>), počet apertur a ARBITRÁŽNÍ POLITIKA (ve výchozím nastavení s prioritou navigace, nebo s prioritou komunikace, nebo nepreemptivní podle pořadí příchodu); výstupem je vytížení navigací, vytížení komunikací, nevyužitý čas a výpadek na relaci, tedy doba kontaktu, kterou relace požadovala a žádná apertura ji neobsloužila. Jde o přesný průchod intervaly přes hranice oken, takže se přilehlá okna nikdy nepřetahují a žádná sekunda apertury se nezapočítá dvakrát; sekundy apertur věnované navigaci, komunikaci a nečinnosti se sčítají nezávisle a uzavírají se proti apertures*horizon_s. Zpráva uvádí použitou politiku, její úplnou definici a definice vytížení a výpadku, protože údaj o vytížení uvedený bez arbitrážní politiky není reprodukovatelný. MODELLED plánovací aritmetika: při změně služby nebo relace apertury se neúčtuje žádný čas na přesměrování, přeladění ani přepnutí, do rozhodování nevstupuje žádný objem dat, stav vyrovnávací paměti, energetický rozpočet ani uzavření spoje a okna kontaktů jsou vstupy: jejich geometrie je taková, jakou vytvořil jejich zdroj. Nejde o produkt pro plánování pozemního segmentu.

seg-a8d79b8a96bc = Jeden běh <c1/> se shrnuje takto: aperture-duty-cycle: { "6" } relací na { "2" } aperturách při prioritě navigace -> vytížení navigací { "0.1167" }, vytížení komunikací { "0.2667" }, nevyužito { "0.6167" }; { "0" } s z { "6900" } s požadovaných se ztratilo kvůli souběhu požadavků (MODELLED)

seg-67c665d5c8c0 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-60f25ccdab6e = Příklad <c1/> mimo jiné nastavuje:

seg-bf51947657c0 = navigace

seg-b4ff1d640bdf = komunikace

seg-2e78730d0737 = aperture*s

seg-330cbcd04718 = podíl (bezrozměrný)

seg-0ef5875db338 = Označení výsledku (z enginu): MODELLED: aritmetika plánování apertur nad dodaným plánem kontaktů: přesný průchod intervaly, který určuje časové rozdělení mezi navigaci a komunikaci a ztrátu na jednu relaci vlivem souběhu při pojmenované arbitrážní politice. Při změně služby nebo relace apertury se neúčtuje žádný čas na přesměrování, přeladění ani přepnutí,

seg-a8b38ed8e029 = Graf, který engine zapisuje pro scenarios/aperture-duty-cycle.toml, druh aperture-duty-cycle

seg-4636d450ef60 = <b>MODELLED</b> Jeden běh převezme plán kontaktů (seznam oken aos_s/los_s, z nichž každé požaduje po apertuře navigaci nebo komunikaci, tedy stejný slovník oken, jaký vydává <c1/>, převedený funkcí <c2/>), počet apert

seg-7a5aa78533d3 = <b>MODELLED</b> Jeden běh převezme plán kontaktů (seznam oken aos_s/los_s, z nichž každé požaduje po apertuře navigaci nebo komunikaci, tedy stejný slovník oken, jaký vydává `passes::pre. Oracle (InternalConsistency): Vnitřní konzistence ze tří veličin vypočtených různými výrazy ve stejném průchodu, které se pak musí uzavřít. Sekundy apertur věnované navigaci, komunikaci a nečinnosti se sčítají odděleně, nečinnost z (apertures − |served|) na každý elementární interval, nikdy ne jako zbytek, a jejich součet se ověřuje proti apertures × horizon_s, což chybně vymezená hranice, dvojí

seg-a388c24fec99 = MODELLED: aritmetika plánování apertur nad dodaným plánem kontaktů: přesný průchod intervaly, který určuje časové rozdělení mezi navigaci a komunikaci a ztrátu na jednu relaci vlivem souběhu při pojmenované arbitrážní politice. Při změně služby nebo relace apertury se neúčtuje žádný čas na přesměrování, přeladění ani přepnutí, do rozhodování nevstupuje žádný objem dat, stav vyrovnávací paměti, energetický rozpočet ani uzavření spoje a okna kontaktů jsou vstupy: jejich (výsledek <c1/>)

seg-e689f30b268a = MODELLED plánovací aritmetika: při změně služby nebo relace apertury se neúčtuje žádný čas na přesměrování, přeladění ani přepnutí, do rozhodování nevstupuje žádný objem dat, stav vyrovnávací paměti, energetický rozpočet ani uzavření spoje a okna kontaktů jsou vstupy: jejich geometrie je taková, jakou vytvořil jejich zdroj. (katalog druhů (<c1/>))

seg-4aa40af30bd2 = ČESTNÝ ROZSAH: MODELLED plánovací aritmetika nad dodanými okny. Při změně služby nebo relace apertury se neúčtuje žádný čas na přesměrování, přeladění ani přepnutí; do rozhodování nevstupuje žádný objem dat, stav vyrovnávací paměti, energetický rozpočet ani uzavření spoje; a okna kontaktů jsou vstupy -- jejich geometrie je taková, jakou vytvořil jejich zdroj (scénář <c1/> vydává stejný slovník aos_s / los_s). Není to plánování pozemního segmentu (komentář v souboru scénáře, řádky { "18" } až { "24" })

seg-0b7f8d86e5d5 = Navigační a komunikační vytížení apertur je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-dbbefaba93dc = <s1>Předchozí</s1>aocs

seg-5b4fd889fdff = <s1>Další</s1>araim-reference-check
