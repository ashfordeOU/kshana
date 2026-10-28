# docs--kinds-gps-denied-alternative-pnt: translations (cs)

seg-b03d56f501c3 = Druh

seg-f496b7f4c63a = Kombinovaný gravitační + magnetický + terénní navigátor bez GPS: tři skalární polní kanály sloučené v každém bodu trasy pro ostřejší (s nižší mezí CRLB) určení driftu než kterékoli jednotlivé pole.

seg-498b1aea3770 = Graf, který engine zapisuje pro scenarios/combined-altpnt.toml, druh combined-altpnt

seg-c8f93431680a = MODELLED odolnost vrstveného PNT v konfliktu (P7): uživatel ve sporném prostředí disponuje několika vrstvami PNT (GNSS s otevřenou službou, širokopásmové GNSS, autentizovaná konstelace, augmentační relé), z nichž každá má základní dostupnost, přesnost 1σ a zranitelnost vůči odepření podle jednotlivých vektorů sdílené hrozbě rušení/spoofingu. Monte Carlo SE SEEDEM, procházené podle intenzity, odepře každou vrstvu s pravděpodobností clamp(vulnerability·intensity·vector_weight,{ "0,1" }), přeživší vrstvy sloučí uzavřeným pravidlem inverzního rozptylu σ_fused=(Σ 1/σ_i²)^(−1/2) a uvádí pravděpodobnost celkové ztráty (odepřeny všechny vrstvy), medián sloučené chyby a statistiky použitelnosti a odepření jednotlivých vrstev v závislosti na intenzitě. Hlavní poměr odolnosti (pravděpodobnost celkové ztráty u jedné vrstvy oproti vrstvené) vychází na ~7x za předpokladu NEZÁVISLOSTI; průchod korelovaným odepřením s jednofaktorovou gaussovskou kopulí pak ukazuje, jak se těch ~7x zhroutí směrem k { "1" } s rostoucí korelací odepření (korelace maří vrstvení). Blok citlivosti na apriorní hodnoty rozkládá hlavní údaj přes ZDROJOVANÉ apriorní hodnoty zranitelnosti pomocí tornáda mcda + Dirichletova přerozdělení úsilí hrozby + percentilových intervalů spolehlivosti. VALIDATED jádro: celková ztráta z Monte Carlo konverguje k uzavřenému tvaru nezávislého součinu Π_i p_deny_i (v rámci standardní chyby MC při pevném seedu a velkém N); sloučení podle inverzního rozptylu je identita v uzavřeném tvaru; při ρ={ "0" } se kopule redukuje na nezávislý model a každé ρ zachovává marginální míru odepření každé vrstvy. MODELLED: velikosti zranitelnosti / dostupnosti / přesnosti jednotlivých vrstev jsou vstupy ze zdrojů, ale vypočtené z modelu (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG -- viz conflict_threat_params) a konkrétní velikost ~7x a tvar křivky poměr-oproti-korelaci z této parametrizace vyplývají. Rozklad přežití podle jednotlivých vektorů v § { "4.2" } pak rozloží sdílenou RF hrozbu na čtyři pojmenované vektory (rušení/spoofing/kinetický/kybernetický) a uvádí pro každý vektor křivku postupné degradace použitelného PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) -- VALIDATED: Monte Carlo se seedem po vrstvách konverguje k tomuto uzavřenému tvaru; rušení je nejostřejším vektorem pro korelovaný RF základ a rozhodujícím přeživším je vrstva inerciální, odolná vůči RF. Nejde o produkt s certifikací navigační dostupnosti.

seg-4dd2bcc206db = Graf, který engine zapisuje pro scenarios/conflict-resilience.toml, druh conflict-resilience

seg-9a58a7b09423 = Navigace shodou s gravitační mapou bez GPS: studenoatomový gravimetr z posloupnosti gravitačních anomálií, kterou přeletí, určí konstantní drift INS.

seg-c42d90057e9f = Graf, který engine zapisuje pro scenarios/gravity-map-nav.toml, druh gravity-map

seg-4e31c8daf798 = Registr

seg-efd15cff3d32 = MODELLED (označení výsledku)

seg-9d9aeff4f2ee = Zdroj: <c1/>

seg-d9fdaf3208ca = Alternativní PNT při nedostupnosti GPS (rodina druhů scénářů)

seg-9fde6af9e09f = { "5" } druhů scénářů enginu v{ $version }. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází od enginu nebo z verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se označení získává: část Evidence v README).

seg-0d3b170b9fbc = Tematické stránky: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Spusťte jednu: <c1/>. Všechny rodiny: <a3>KINDS.md</a3>.

seg-6dfd2dc2721a = Přehledový list grafů, které engine zapisuje pro druhy z rodiny Alternativní PNT při nedostupnosti GPS

seg-cff60d8c17d2 = Sekvenční (rekurzivní) navigace podle terénu při nedostupnosti GPS: částicový filtr spouští model měření shody s terénem epochu po epoše (SITAN jako běžící filtr), takže časově proměnný drift INS je tr

seg-9d8f69b51742 = MODELLED odolnost vrstveného PNT při konfliktu (P7): uživatel v sporném prostředí využívá několik vrstev PNT (GNSS s otevřenou službou, širokopásmový GNSS, ověřovaná konstelace, augmentační relé), každá s

seg-28486745bb43 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Volitelná: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

seg-c2187e8291f9 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>gravity-map</a1>.

seg-b1ff6f0e1769 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Volitelná: <c13/>, <c14/>, <c15/>.

seg-3ec7b38184b7 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Volitelná: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-7c777178ee8f = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>terrain-slam</a1>.

seg-c5124441822e = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Volitelná: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

seg-d78bd011956c = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>combined-altpnt</a1>.

seg-2d95ddbf01c4 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-ab895b157152 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>conflict-resilience</a1>.

seg-c0ef7d676ec1 = <s1>Předchozí</s1>Měření GNSS určování polohy a integrita

seg-54b45b00a2f0 = <s1>Další</s1>Inerciální fúze a kvantové senzory

seg-0d7bf5a4f07e = Navigace podle terénu bez GPS (TERCOM/SITAN): radarový/barometrický výškoměr porovnává profil výšky terénu s DEM ve stylu SRTM, aby odstranil drift INS.

seg-c5e33c7122e2 = Graf, který engine zapisuje pro scenarios/terrain-nav.toml, druh terrain-nav

seg-6bdc150ab25b = Sekvenční (rekurzivní) navigace podle terénu bez GPS: částicový filtr spouští měřicí model shody s terénem epochu po epoše (SITAN jako běžící filtr), takže se podél trasy sleduje časově proměnný drift INS, zatímco dávkový terrain-nav obnoví pouze jediný konstantní posun.

seg-4aca87f022dc = Graf, který engine zapisuje pro scenarios/terrain-slam.toml, druh terrain-slam
