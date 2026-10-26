# docs--kind-conflict-resilience: translations (cs)

seg-c4ed27a559df = Tematická stránka: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-216efc4e6fba = Druh scénáře enginu v{ $version }, rodina <a1>Alternativní PNT bez GPS</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-98133e74f88a = Stránka rodiny: <a1>Alternativní PNT bez GPS</a1>

seg-34f14aa2ee0b = Zdroj: <c1/>

seg-a80556cfe1a9 = <c1/> (druh scénáře)

seg-c8f93431680a = MODELLED odolnost vrstveného PNT v konfliktu (P7): uživatel ve sporném prostředí disponuje několika vrstvami PNT (GNSS s otevřenou službou, širokopásmové GNSS, autentizovaná konstelace, augmentační relé), z nichž každá má základní dostupnost, přesnost 1σ a zranitelnost vůči odepření podle jednotlivých vektorů sdílené hrozbě rušení/spoofingu. Monte Carlo SE SEEDEM, procházené podle intenzity, odepře každou vrstvu s pravděpodobností clamp(vulnerability·intensity·vector_weight,{ "0,1" }), přeživší vrstvy sloučí uzavřeným pravidlem inverzního rozptylu σ_fused=(Σ 1/σ_i²)^(−1/2) a uvádí pravděpodobnost celkové ztráty (odepřeny všechny vrstvy), medián sloučené chyby a statistiky použitelnosti a odepření jednotlivých vrstev v závislosti na intenzitě. Hlavní poměr odolnosti (pravděpodobnost celkové ztráty u jedné vrstvy oproti vrstvené) vychází na ~7x za předpokladu NEZÁVISLOSTI; průchod korelovaným odepřením s jednofaktorovou gaussovskou kopulí pak ukazuje, jak se těch ~7x zhroutí směrem k { "1" } s rostoucí korelací odepření (korelace maří vrstvení). Blok citlivosti na apriorní hodnoty rozkládá hlavní údaj přes ZDROJOVANÉ apriorní hodnoty zranitelnosti pomocí tornáda mcda + Dirichletova přerozdělení úsilí hrozby + percentilových intervalů spolehlivosti. VALIDATED jádro: celková ztráta z Monte Carlo konverguje k uzavřenému tvaru nezávislého součinu Π_i p_deny_i (v rámci standardní chyby MC při pevném seedu a velkém N); sloučení podle inverzního rozptylu je identita v uzavřeném tvaru; při ρ={ "0" } se kopule redukuje na nezávislý model a každé ρ zachovává marginální míru odepření každé vrstvy. MODELLED: velikosti zranitelnosti / dostupnosti / přesnosti jednotlivých vrstev jsou vstupy ze zdrojů, ale vypočtené z modelu (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG -- viz conflict_threat_params) a konkrétní velikost ~7x a tvar křivky poměr-oproti-korelaci z této parametrizace vyplývají. Rozklad přežití podle jednotlivých vektorů v § { "4.2" } pak rozloží sdílenou RF hrozbu na čtyři pojmenované vektory (rušení/spoofing/kinetický/kybernetický) a uvádí pro každý vektor křivku postupné degradace použitelného PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) -- VALIDATED: Monte Carlo se seedem po vrstvách konverguje k tomuto uzavřenému tvaru; rušení je nejostřejším vektorem pro korelovaný RF základ a rozhodujícím přeživším je vrstva inerciální, odolná vůči RF. Nejde o produkt s certifikací navigační dostupnosti.

seg-dd10a00edc2f = Jeden běh <c1/> se shrnuje takto: conflict-resilience | { "4" } vrstvy ({ "0" } základ) | referenční intenzita { "1.00" } | poměr odolnosti v uzavřeném tvaru 6.73x MC 6.19x (vrstvené oproti jedné vrstvě) | korelace maří vrstvení: poměr 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | apriorní CI [5.51-8.48]x | přežití podle vektorů @ ref. rušení { "26" }% spoofing { "80" }% kinetický { "100" }% kybernetický { "99" }% (nejostřejší rušení) | hlavní údaj ~7x MODELLED, VALIDATED MC->uzavřený tvar / identita sloučení / marginály kopule / přežití podle vektorů

seg-674bafccbaf7 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-71fcff68edaf = Příklad <c1/> mimo jiné nastavuje:

seg-4e3b5bb5a5e7 = GNSS L1 C/A (otevřená služba)

seg-bd3832c8215d = Označení výsledku (z enginu): MODELLED odolnost vrstveného PNT v konfliktu (P7). VALIDATED jádro: pravděpodobnost celkové ztráty z Monte Carlo konverguje k uzavřenému tvaru nezávislého součinu Pi_i p_deny_i (ověřeno v rámci standardní chyby Monte Carlo při pevném seedu a velkém N); sloučení polohy podle inverzního rozptylu sigma_fused = (sum_i 1/sig

seg-4dd2bcc206db = Graf, který engine zapisuje pro scenarios/conflict-resilience.toml, druh conflict-resilience

seg-c0e69524f05d = <b>MODELLED</b> Dílčí skóre podle dimenzí nad sedmi vlastními kategoriemi odolnosti Kshany (nikoli pojmy DHS), funkcemi RDRR z RethinkPNT a kritérii Yang, každé označené jako vypočtené z modelu s i. Oracle (InternalConsistency): Ručně odvozené vzorce pro jednotlivé metriky: inverzní Simpsonova diverzita, vážený průměr kompozitu, omezené/neomezené doby časové osy, žebříček úrovní Level podle nejslabšího článku

seg-2ca37a78e899 = MODELLED odolnost vrstveného PNT v konfliktu (P7). VALIDATED jádro: pravděpodobnost celkové ztráty z Monte Carlo konverguje k uzavřenému tvaru nezávislého součinu Pi_i p_deny_i (ověřeno v rámci standardní chyby Monte Carlo při pevném seedu a velkém N); sloučení polohy podle inverzního rozptylu sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) je identita v uzavřeném tvaru; při korelaci rho={ "0" } se gaussovská kopule přesně redukuje na nezávislý mo (výsledek <c1/>)

seg-d0d834e377ee = MODELLED odolnost vrstveného PNT v konfliktu (P7): uživatel ve sporném prostředí disponuje několika vrstvami PNT (GNSS s otevřenou službou, širokopásmové GNSS, autentizovaná konstelace, augmentační relé), z nichž každá má základní dostupnost, přesnost 1σ a zranitelnost vůči odepření podle jednotlivých vektorů sdílené hrozbě rušení/spoofingu. (katalog druhů (<c1/>))

seg-3ca12700b54c = Hlavní poměr odolnosti (pravděpodobnost celkové ztráty u jedné vrstvy oproti vrstvené) vychází na ~7x za předpokladu NEZÁVISLOSTI; průchod korelovaným odepřením s jednofaktorovou gaussovskou kopulí pak ukazuje, jak se těch ~7x zhroutí směrem k { "1" } s rostoucí korelací odepření (korelace maří vrstvení). (katalog druhů (<c1/>))

seg-70e4fdff099f = MODELLED: velikosti zranitelnosti / dostupnosti / přesnosti jednotlivých vrstev jsou vstupy ze zdrojů, ale vypočtené z modelu (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG -- viz conflict_threat_params) a konkrétní velikost ~7x a tvar křivky poměr-oproti-korelaci z této parametrizace vyplývají. (katalog druhů (<c1/>))

seg-33541cca61b6 = Uživatel ve sporném prostředí disponuje čtyřmi RF vrstvami PNT, které všechny jedou ve stejném pásmu, a proto sdílejí vektor odepření rušením/spoofingem -- křehký, korelovaný případ. Scénář uvádí: * pravděpodobnost celkové ztráty v závislosti na intenzitě hrozby (Monte Carlo oproti uzavřenému nezávislému součinu, ke kterému konverguje), * poměr odolnosti ~7x vrstveného oproti jedné vrstvě za předpokladu nezávislosti, * jak se těch ~7x zhroutí na (komentář v souboru scénáře, řádky { "3" } až { "15" })

seg-83badfe4784d = Každá velikost jednotlivých vrstev je MODELLED vstup s uvedeným původem; viz src/conflict_threat_params.rs pro zdrojové apriorní hodnoty [min, nominální, max] a profily citlivosti podle vektorů (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Vynecháním <c1/> se spustí táž zdrojová čtyřvrstvá základní varianta; je zde vypsána, včetně vector_profile každé vrstvy, kvůli transparentnosti. (komentář v souboru scénáře, řádky { "17" } až { "22" })

seg-bb182ed41520 = Hodnocení odpovídající rámcům odolnosti PNT je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-6a42653a8a0f = <s1>Předchozí</s1>combined-altpnt

seg-2bd3e9d1505c = <s1>Další</s1>constellation-design
