# docs--kind-campaign: translations (cs)

seg-8784979d6569 = dBW

seg-68a2bcb6eedd = Zdroj: <c1/>

seg-24ce6aee5e53 = <c1/> (druh scénáře)

seg-931a3d27c0f0 = Druh scénáře enginu v{ $version }, rodina <a1>Kampaně</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-a07990e776cb = Campaign: existující druhy scénářů složené do jednoho běhu, přičemž každé číslo je načteno ze skutečného běhu pojmenovaného druhu. Čtyři oddíly v libovolné kombinaci. FÁZE: řetězená mise na jedné sdílené časové ose -- každá fáze spouští jeden nebo více scénářů (například rušení, poté spoofing, poté hodiny v holdoveru s inerciálním navigačním systémem, který letí vedle nich, poté alarm integrity, poté zotavení), jejich výstupy se načítají do pojmenovaných kanálů (časová chyba hodin proti jejich ochranné mezi, poměr nosné k hustotě šumu proti prahu sledování, ochranná úroveň proti mezi výstrahy, chyba polohy, sledované družice, příznaky alarmu) předvolbou pro daný druh nebo explicitními cestami k výsledkům a převzorkují se na společnou mřížku podržením nultého řádu, s hranicemi fází a událostmi; stav se předává pomocí carry (kanál pokračuje od koncové hodnoty předchozí fáze), handoff (číslo z předchozí fáze zapsané do scénáře této fáze) a end_at (fáze končí v čase, který vypočetl nějaký běh, například v čase detekce monitoru spoofingu). SWEEP: mřížka přes jeden až tři klíče scénáře zapsané s tečkami, libovolného druhu (celočíselný segment indexuje pole tabulek, jako v system.2.sisre_m), s metrikami načítanými podle cesty k výsledku a, pokud je počet běhů větší než jedna, s Monte Carlo souborem se seedem v každém uzlu. MONTE_CARLO: realizace k běží se seedem base_seed + k; každá metrika uvádí průměr, směrodatnou odchylku, percentily 5., 50. a 95. podle nejbližší pořadové hodnoty a bootstrapový { "95" }% interval spolehlivosti průměru s pevným seedem. COMPOSE: několik scénářů se sdílenými hodnotami (výkon a poloha jednoho rušiče zapsané do námořního a silničního přijímače) s kombinovaným souhrnem nejlepšího a nejhoršího případu. Výsledek nese hash kampaně, souhrn přes všechny výsledky členů a záznam jednotek pro každé emitované číslo; exporty pro interoperabilitu zapisují každý členský scénář, který má geometrii, jako vlastní sadu souborů. Identity skládání jsou testovány: jednofázová kampaň reprodukuje samostatný běh bit po bitu, soubor s pevným seedem je bajtově stabilní a u hodin se šumem bílé frekvence leží průměr souboru uvnitř uvedeného intervalu a rozptyl odpovídá sqrt(q_wf * tau). MODELLED: aditivní carry a podržení nultého řádu jsou modelové volby a každá fáze nese označení druhu, který ji spustil.

seg-05e842f80dbb = Jeden běh <c1/> se shrnuje takto: campaign 46aa07cb58fb | Jammer power sweep: availability and J/S against transmit power | sweep of <c2/>: { "13" } uzlů přes [jammer_power] | { "13" } běhů členů (MODELLED)

seg-bf339fa14645 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-abd3eac6da41 = Příklad <c1/> mimo jiné nastavuje:

seg-c4f955d5f506 = dostupnost

seg-7bcf77278958 = Tento druh používá { "22" } přibalených scénářů; ostatní jsou v <a1><c1/></a1>.

seg-38faa927b2bd = lin

seg-1a33a746eeee = Označení výsledku (z enginu): MODELLED skládání existujících druhů scénářů. Každé číslo je načteno ze skutečného běhu pojmenovaného druhu; řetězení (aditivní carry kanálu přes hranici fáze, podržení nultého řádu na mřížku časové osy, fáze ukončená ve vypočteném čase) je modelová volba a každá fáze nese označ

seg-b2c7cd1f9712 = Graf, který engine zapisuje pro scenarios/campaign-sweep-jammer-power.toml, druh campaign

seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect a běhoun kampaní: volitelná tabulka [monitors] spouští monitory IQ v každé buňce v jediném průchodu běhouna. Testy: <a1>iq_campaign.rs</a1>.

seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) a iq::campaign::report::rocs: každá buňka kampaně s monitory uchovává pro každý druh alarmu a kanál maximum vlastní testové statistiky monitoru přes každé uvedené okno události (kladné) a přes t

seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) a <c1/> na <c2/>, Python <c3/> a nástroj labfit v MCP (složky kampaní jen uvnitř jeho pracovního adresáře): čte výstupní složku <c4/> podle jejích Testy: <a1>iq_labfit_followup.rs</a1>.

seg-f16a176dc1f8 = <b>MODELLED</b> Fáze druhu <c1/>: každá fáze spouští přes run_toml jeden nebo více scénářů existujících druhů, jejich výstupy načítá do pojmenovaných kanálů (časová chyba hodin a ochranná mez, střední efektivní poměr nosné k hustotě šumu a práh sledování, v Testy: <a1>campaign_composition_reference.rs</a1>.

seg-be831b52a339 = a { "4" } další v matici.

seg-cc2ad9e12064 = <b>MODELLED</b> Rozpočet spoje J/S z geometrie, C/N₀ odolné proti rušení, ztráta zachycení signálu na jednotlivé družice. Oracle (InternalConsistency): Rovnice rozpočtu spoje pro C/N₀ odolné proti rušení je křížově zkontrolována nezávislým odvozením v numpy (sdílí stejný uzavřený tvar → InternalConsistency) a charakterizací zhoršení C/N₀ z reálného JammerTest-2024. { "0.30" } kolo { "2" }, zablokováno (zůstává MODELLED): naměřený pokles C/N0 v JammerTest { "2024" } proti predikci rozpočtu spoje (předregistrováno 6a66994b, do { "3" } dB) nebyl proveden, protože poloha a zaměření antény F8.1 při

seg-59afd80736c5 = <b>PARTNER</b> Neposkytuje se: Kshana modeluje výkon signálu, nikoli nákladový hardware ani antény. Oracle (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-fa3ad6babe54 = <b>MODELLED</b> Průchod druhu <c1/> (jeden až tři klíče zapsané s tečkami libovolného druhu, na hodnotách os obecného průchodu, volitelně se souborem v každém uzlu) a oddíl monte_carlo. Oracle (InternalConsistency): Uzavřený tvar náhodné procházky fáze při šumu bílé frekvence, rozptyl q_wf tau (NIST Technical Note { "1337" }), pro statistický aparát a bajtová shoda se samostatnými běhy pro seedování. Kontroluje aritmetiku souboru na vlastním modelu hodin enginu, nikoli vnější datovou sadu

seg-c15b5ac32282 = MODELLED skládání existujících druhů scénářů. Každé číslo je načteno ze skutečného běhu pojmenovaného druhu; řetězení (aditivní carry kanálu přes hranici fáze, podržení nultého řádu na mřížku časové osy, fáze ukončená ve vypočteném čase) je modelová volba a každá fáze nese označení druhu, který ji vytvořil. (výsledek <c1/>)

seg-9e33dcc39c27 = MODELLED: aditivní carry a podržení nultého řádu jsou modelové volby a každá fáze nese označení druhu, který ji spustil. (katalog druhů (<c1/>))

seg-adcc6ea59840 = MODELLED: stejně jako druh <c1/>. (komentář v souboru scénáře, řádek { "14" })

seg-143f3f1cc521 = Odolnost proti rušení při odepření GNSS je MODELLED, nikoli ověřena proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-d1c11e493795 = Průchody parametrů a Monte Carlo soubory se seedem přes libovolný druh scénáře jsou MODELLED, nikoli ověřeny proti nezávislé vnější referenci: kontrolují se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-edbda7aca5b9 = Stránka rodiny: <a1>Kampaně</a1>

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-c4ed27a559df = Tematická stránka: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-774e035da605 = <s1>Předchozí</s1>body-pnt

seg-fadd92303a4d = <s1>Další</s1>cislunar-arc-recovery
