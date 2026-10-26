# docs--kind-ascent-losses: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-cd04f5662884 = MODELLED. (katalog druhů (<c1/>))

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-5d7cf510f4e9 = Zdroj: <c1/>

seg-23e7becab606 = <c1/> (druh scénáře)

seg-34d041d6bd9f = Rovinný výstup gravitačním obratem vícestupňového nosiče nad nerotující kulovou Zemí atmosférou US Standard Atmosphere { "1976" } (svislý stoupavý úsek, náklon, tah ve směru rychlosti) s integrací gravitačních ztrát, ztrát odporem, řízením a protitlakem a kontrolou, že ideální dv snížené o ztráty odpovídá rychlosti při vyhoření; max-Q, špičkové zrychlení a stav při vyhoření. MODELLED.

seg-cd6181de5e43 = Jeden běh <c1/> se shrnuje takto: ascent-losses: ideální dv { "11290" } m/s, ztráty { "2359" } m/s (gravitace { "2276" }, odpor { "15" }, řízení { "0" }, protitlak { "67" }); vyhoření { "509" } km při { "8932" } m/s, gamma { "8.7" } deg; max-Q { "32.5" } kPa (MODELLED)

seg-58f9e8d24a73 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-ec4396f2fa76 = Příklad <c1/> mimo jiné nastavuje:

seg-a44edb1eb84d = kg

seg-37205a55d23c = m^{ "2" }

seg-98151954f217 = false

seg-68a37ebbc01e = Označení výsledku (z enginu): MODELLED: rovinný výstup gravitačním obratem vícestupňového nosiče nad nerotující kulovou Zemí atmosférou US76 s integrací gravitačních ztrát, ztrát odporem, řízením a protitlakem a kontrolou identity ideální dv snížené o ztráty; konstantní C_D, žádná rotace, žádný volný let, žádné řízení kromě náklonu

seg-ccf2185b0b5e = Graf, který engine zapisuje pro scenarios/ascent-losses.toml, druh ascent-losses

seg-3a3ee499961e = <b>MODELLED</b> Rovinný výstup gravitačním obratem vícestupňového nosiče nad nerotující kulovou Zemí atmosférou US Standard Atmosphere { "1976" } (hustota a tlak), s náklonem, tahem sníženým o protitlak trysky, vyhořením stupňů v přesných s

seg-cac91718c4e1 = <b>MODELLED</b> Rovinný výstup gravitačním obratem vícestupňového nosiče nad nerotující kulovou Zemí atmosférou US Standard Atmosphere { "1976" } (hustota a tlak), s p. Oracle (InternalConsistency): Vnitřní konzistence: přesná identita rychlost při vyhoření = součet Isp g0 ln(m0/mf) minus čtyři integrované ztráty (reziduum pod { "1e-6" } m/s), Ciolkovského rovnice na svislém hoření ve vakuu, kde jedinou ztrátou je gravitace, a tlaky US76 na hladině moře a na tropopauze. CO NENÍ: nebyly porovnány ztráty žádného zveřejněného nosiče; žádná rotace Země, volný let, škrcení ani řízení kromě náklonu; konstantní C_D; není to traje

seg-906f001cd9ea = MODELLED: rovinný výstup gravitačním obratem vícestupňového nosiče nad nerotující kulovou Zemí atmosférou US76 s integrací gravitačních ztrát, ztrát odporem, řízením a protitlakem a kontrolou identity ideální dv snížené o ztráty; konstantní C_D, žádná rotace, žádný volný let, žádné řízení kromě náklonu (výsledek <c1/>)

seg-f916c5a08595 = Ztráty při výstupu gravitačním obratem ILUSTRATIVNÍHO dvoustupňového nosiče na petrolej a kyslík (žádné skutečné vozidlo): svislý stoupavý úsek do { "1" } km, náklon o { "3" } deg po dobu { "10" } s a poté tah ve směru rychlosti. Běh integruje gravitační ztráty, ztráty odporem, řízením a protitlakem a kontroluje, že ideální dv snížené o ztráty odpovídá rychlosti při vyhoření. MODELLED: rovinná nerotující Země, konstantní C_D, žádný volný let, žádné řízení kromě náklonu. (komentář v souboru scénáře, řádky { "1" } až { "5" })

seg-4c237f051651 = Gravitační ztráty, ztráty odporem, řízením a protitlakem při startu nosiče jsou MODELLED, nikoli ověřeny proti nezávislé vnější referenci: kontrolují se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8e62cc4af6ea = Tematická stránka: <a1>ENTRY-EO-ASCENT.md</a1>

seg-73148557c9a6 = <s1>Předchozí</s1>araim-reference-check

seg-3af9699f27a7 = <s1>Další</s1>attitude-budget
