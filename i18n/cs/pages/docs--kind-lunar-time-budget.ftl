# docs--kind-lunar-time-budget: translations (cs)

seg-51362910dcb7 = Tento druh používají { "2" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-8f8871ac8a0f = Tematická stránka: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Tematická stránka: <a1>integrations.md</a1>

seg-11f512367036 = Zdroj: <c1/>

seg-f7cd4fcfc62d = <c1/> (druh scénáře)

seg-cac3a0bcbfc6 = MODELLED celkový rozpočet časové chyby koordinovaného lunárního času (LTC): sedm členů chyby LTC sestavených jako křivky časové chyby x_i(τ) přes celou mřížku dob průměrování, sečtených odmocninou součtu čtverců do x_Σ(τ), a PRŮSEČÍK hodin a rámce τ, ve kterém rostoucí člen hodin převýší konstantní člen realizace rámce v reálném čase (pod ním je rozpočet omezen rámcem, nad ním hodinami) — čestná odpověď na artefakt jediného τ. Sklony τ jsou v uzavřeném tvaru a analyticky ověřitelné (hodiny τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, podlahy τ^{ "0" }, měření τ^{ "{" }-1/2{ "}" }) a řádky hodin reprodukují publikované jednodenní specifikace hodin (crate::clock_specs); VELIKOSTI podlah spoje RF/optického, realizace rámce, relativistického rezidua a efemeridy jsou modelované alokace rozpočtu (zdokumentované výchozí hodnoty, volající je může přepsat), nikoli měření. Přínosem je reprodukovatelný průsečík τ, nikoli hodnota jednotlivého členu s certifikací; bez certifikace pro provozní udržování času.

seg-8a5c9e451d4e = Jeden běh <c1/> se shrne takto: lunar-time-budget | hodiny passive-h-maser | 7členné x_Σ(τ) přes { "57" } bodů τ ({ "1" }–{ "1e7" } s) | průsečík τ { "8.689e4" } s (x { "1.001e-9" } s) | podlaha rámce { "1.001e-9" } s | hodiny x({ "1" } d) { "0.995" } ns (MODELLED)

seg-7cdc521303eb = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-c050033b32c3 = Příklad <c1/> mimo jiné nastavuje:

seg-eebd3e40d0b9 = Popisek výsledku (od enginu): MODELLED celkový rozpočet časové chyby LTC. Sklony τ jsou v uzavřeném tvaru a analyticky ověřitelné (hodiny τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, podlahy τ^{ "0" }, měření τ^{ "{" }-1/2{ "}" }) a řádky hodin reprodukují publikované jednodenní specifikace hodin; VELIKOSTI podlah spoje RF/optického, realizace rámce, relativistického rezidua a efemeridy

seg-56fe184f2a12 = Graf, který engine zapisuje pro scenarios/lunar-time-budget.toml, druh lunar-time-budget

seg-b03509dfcb1b = <b>MODELLED</b> Jeden běh lunar-time-budget vydává řádek průsečíku hodin a rámce pro každou třídu hodin vůči jedinému sdílenému členu rámce, takže hodiny jsou jedinou proměnnou v porovnání; každý řádek nese průsečík dosažený dvěma způsoby -- půlením z obec

seg-fd52e493b6c2 = <b>MODELLED</b> Volitelný blok [time_lab] scénáře lunar-time-budget modeluje hodiny lunární referenční stanice (výchozí třída miniRAFS, nebo libovolná pojmenovaná třída, nebo karta zařízení nafitovaná na uvedené body stability) řízené na koordinovaný lunární čas a Testy: <a1>lunar_station_time_lab.rs</a1>.

seg-d8807d5308d4 = <b>MODELLED</b> Jeden běh lunar-time-budget vydává řádek průsečíku hodin a rámce pro každou třídu hodin vůči jedinému sdílenému členu rámce, takže hodiny jsou jedinou proměnnou v por. Orákulum (InternalConsistency): Dva různé výpočty téže veličiny v kódové základně, nikoli jeden přeformulovaný: půlení na křivce mocninného zákona IEEE-1139 nic neví o typu šumu, zatímco uzavřený tvar invertuje dominantní typ algebraicky, takže chybně klasifikovaný typ šumu nebo špatné ohraničení se projeví jako nezanedbatelný relativní rozdíl. Čtyři hodnoty také reprodukují publikovanou tabulku článku na polovinu jeho poslední vytištěné číslice -- ale ta tabulka byla jeho

seg-4c0d7da4f7f6 = <b>MODELLED</b> Scénář lunar-time-budget publikuje své výstupy s hodnotami v polích jako dlouhou tabulku (index mřížky, doba průměrování, člen) vedle zprávy, takže sedm každého. Orákulum (InternalConsistency): Pouze vnitřní konzistence: publikovaný součet je kontrolován proti odmocnině součtu čtverců členů ve stejném souboru a vydaná křivka reprodukuje vydaný p3_time_budget_curve.csv přes všech { "57" } bodů. Obě kontroly sdílejí vlastní definice členů tohoto enginu, takže žádná není nezávislá. Člen hodin se opírá o publikované specifikace hodin, ale VELIKOSTI podlah spoje, rámce, relativistického rezidua a efemeridy jsou zdokumentované

seg-8abdeb1a36e1 = MODELLED celkový rozpočet časové chyby LTC. Sklony τ jsou v uzavřeném tvaru a analyticky ověřitelné (hodiny τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, podlahy τ^{ "0" }, měření τ^{ "{" }-1/2{ "}" }) a řádky hodin reprodukují publikované jednodenní specifikace hodin; VELIKOSTI podlah spoje RF/optického, realizace rámce, relativistického rezidua a efemeridy jsou modelované alokace rozpočtu (zdokumentované výchozí hodnoty, volající je může přepsat), nikoli měření. Přínos (výsledek <c1/>)

seg-66a794432751 = MODELLED celkový rozpočet časové chyby koordinovaného lunárního času (LTC): sedm členů chyby LTC sestavených jako křivky časové chyby x_i(τ) přes celou mřížku dob průměrování, sečtených odmocninou součtu čtverců do x_Σ(τ), a PRŮSEČÍK hodin a rámce τ, ve kterém rostoucí člen hodin převýší konstantní člen realizace rámce v reálném čase (pod ním je rozpočet omezen rámcem, nad ním hodinami) — čestná odpověď na artefakt jediného τ (katalog druhů (<c1/>))

seg-ca1763d4a416 = Čestnost: MODELLED. Sklony tau jsou v uzavřeném tvaru a analyticky ověřitelné (hodiny tau^{ "{" }+1/2{ "}" } nebo tau^{ "{" }+{ "1" }{ "}" }, podlahy tau^{ "0" }, měření tau^{ "{" }-1/2{ "}" }) a řádky hodin reprodukují publikované jednodenní specifikace hodin; ale VELIKOSTI podlah spoje RF/optického, realizace rámce, relativistického rezidua a efemeridy jsou modelované alokace rozpočtu (zdokumentované výchozí hodnoty, volající je může přepsat), nikoli měření. Přínosem je (komentář v souboru scénáře, řádky { "13" } až { "18" })

seg-8f884949bdf1 = Tabulka lunárních průsečíků času podle třídy hodin je MODELLED, nikoli ověřená: je kontrolována proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-5eaed32490ca = Reprodukovatelnost lunárního rozpočtu časové chyby je MODELLED, nikoli ověřená: je kontrolována proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Předchozí</s1>lunar-station-coverage

seg-a0992d394960 = <s1>Další</s1>lunar-time-offset

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-b851d30fe736 = <s1>Předchozí</s1>lunar-surface
