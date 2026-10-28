# docs--kind-attitude-budget: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-40ca4197150b = Zdroj: <c1/>

seg-a271f371a3cf = <c1/> (druh scénáře)

seg-62c0dda9fc56 = Rozpočet orientace a chyby zaměřování ve 3 stupních volnosti: nejhorší případ gravitačně-gradientního rušivého momentu ((3/2)(μ/R³)ΔI) a rozpočet chyby zaměřování jako odmocnina součtu čtverců pojmenovaných příspěvků 1σ (šum čidel, chvění reakčních kol, tepelné vlivy, nesouosost) s dominantním členem, pro výšku oběžné dráhy a rozptyl setrvačnosti tělesa. MODELLED skalární rozpočet AOCS: doplněk před hardwarem k Basilisk/42, nikoli simulace regulační smyčky, 6 stupňů volnosti ani pružných módů.

seg-9fdc45a8aaa3 = Jeden běh <c1/> se shrnuje takto: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> moment GG { "7.04e-5" } N·m; zaměřování { "10.7" }" RSS (dominantní: reaction_wheel_jitter) (MODELLED skalární rozpočet)

seg-7cf112b1bcc3 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-91ebbc89f9bb = Příklad <c1/> mimo jiné nastavuje:

seg-c33e3cbba749 = arcsec

seg-36df1bc710ab = nesouosost

seg-d45f0ee66587 = kg*m^{ "2" }

seg-3e3ce4fa89aa = N*m

seg-0a78a7d6f93f = Označení výsledku (z enginu): MODELLED: skalární rozpočet chyb AOCS ve 3 stupních volnosti: nejhorší případ gravitačně-gradientního rušivého momentu + rozpočet zaměřování RSS; NENÍ to simulace regulační smyčky / 6 stupňů volnosti / pružných módů (doplněk před hardwarem k Basilisk/42, nikoli jeho náhrada)

seg-ad0e72e3b688 = Graf, který engine zapisuje pro scenarios/attitude-budget.toml, druh attitude-budget

seg-95b159fb5e68 = <b>VALIDATED</b> Nejhorší případ gravitačně-gradientního rušivého momentu ((3/2)(μ/R³)ΔI) jako maximum přes orientaci (ověřované tvrzení) plus rozpočet chyby zaměřování RSS z pojmenovaných příspěvků 1σ s dominantním členem (kvadratický součet čísel dodaných volajícím Testy: <a1>attitude_gg_torque_reference.rs</a1>.

seg-f7c8d8994896 = <b>VALIDATED</b> Nejhorší případ gravitačně-gradientního rušivého momentu ((3/2)(μ/R³)ΔI) jako maximum přes orientaci (ověřované tvrzení) plus rozpočet chyby zaměřování RSS z pojmenovaných příspěvků 1σ . Oracle (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), nezávislá implementace gravitačně-gradientního momentu s plným tenzorem v C++: maximum (3/2)(μ/R³)ΔI z Kshany se rovná momentu z Basilisku při orientaci { "45" } deg s relativní odchylkou do { "1e-12" } (nejhorší { "2.1e-15" }) přes { "5" } výšek a { "8" } tenzorů setrvačnosti a omezuje moment z Basilisku přes { "2000" } náhodných orientací na případ; tolerance stanovena před porovnáním. Ověřované tvrzení: gravity-

seg-d2a6cf813e95 = <b>PARTNER</b> Neposkytuje se: Kshana je simulátor navigačního výkonu, nikoli výrobce družicových platforem. Oracle (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-3895121a5466 = MODELLED: skalární rozpočet chyb AOCS ve 3 stupních volnosti: nejhorší případ gravitačně-gradientního rušivého momentu + rozpočet zaměřování RSS; NENÍ to simulace regulační smyčky / 6 stupňů volnosti / pružných módů (doplněk před hardwarem k Basilisk/42, nikoli jeho náhrada) (výsledek <c1/>)

seg-f62458cae23b = MODELLED skalární rozpočet AOCS: doplněk před hardwarem k Basilisk/42, nikoli simulace regulační smyčky, 6 stupňů volnosti ani pružných módů. (katalog druhů (<c1/>))

seg-333fca11ac0c = ČESTNÝ ROZSAH: MODELLED skalární rozpočet chyb -- doplněk před hardwarem k Basilisk/42, NENÍ to simulace regulační smyčky / 6 stupňů volnosti / pružných módů. Gravitačně-gradientní člen se uvádí jako moment (jeho převod na zaměřování vyžaduje tuhost řízení, kterou vlastní volající); rozpočet je kvadratický součet dodaných příspěvků 1 sigma. Spuštění: kshana scenarios/attitude-budget.toml (komentář v souboru scénáře, řádky { "8" } až { "13" })

seg-0e27fcef1499 = <s1>Předchozí</s1>ascent-losses

seg-946c453cbf0f = <s1>Další</s1>body-pnt

seg-a349aa76b0ed = PARTNER
