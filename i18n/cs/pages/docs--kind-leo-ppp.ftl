# docs--kind-leo-ppp: translations (cs)

seg-37d29d8303fe = km

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Tematická stránka: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Druh scénáře enginu v{ $version }, rodina <a1>Navigace z nízké oběžné dráhy Země</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-c5478f572d21 = Stránka rodiny: <a1>Navigace z nízké oběžné dráhy Země</a1>

seg-8f0aab32310b = Zdroj: <c1/>

seg-c9852d3b79c8 = <c1/> (druh scénáře)

seg-32a570f1a4fa = Konvergence přesného určení polohy z jednoho bodu (PPP) pouze s GNSS a s doplněním LEO: float rozšířený Kalmanův filtr na kódu a fázi nosné bez ionosféry se statickými souřadnicemi stanice, bílými hodinami přijímače, jedním mezisystémovým biasem pro každý další systém, zenitovým mokrým zpožděním jako náhodnou procházkou převedeným faktorem 1/sin(elevace) a float nejednoznačností pro každý oblouk družice; chyba přesné dráhy a hodin je bílá a společná kódu i fázi družice, takže každá družice je jedna korelovaná dvouřádková aktualizace v Josephově stabilizovaném tvaru. Měření se simulují ze stejného modelu se seedovaným šumem na několika místech a seedech a každý případ (nejprve pouze GNSS, poté každý [[case]] systémů LEO, libovolné konstelace nebo předvolby) hlásí střední dobu konvergence (první epocha, po níž horizontální a vertikální chyby zůstávají pod prahy, ve výchozím stavu { "10" } cm), podíl konvergovaných běhů, střední křivky chyb a konzistenci filtru (průměr NEES polohy přes běhy proti oboustrannému { "95" }% pásmu chí-kvadrát). Volitelně vedle publikovaných údajů Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) pro střední šířky: { "9.6" } min pro multi-GNSS zkráceno na { "7.0" }, { "3.2" }, { "2.1" } a { "1.3" } min s { "60" }, { "96" }, { "192" } a { "288" } družicemi LEO. MODELLED: srovnání konzistence trendu, nikoli reprodukce konstelací, šumu ani stanic oné studie; bez řešení nejednoznačností, skoků cyklů, fázového navíjení, slapů ani časově korelovaných chyb produktů.

seg-8126f4edf6b6 = Jeden běh <c1/> se shrnuje takto: PPP convergence to { "0.10" } m horizontal / { "0.10" } m vertical, { "12" } runs per case, { "96" } GNSS satellites GNSS only { "0" } LEO median { "7.4" } min converged { "100" }% NEES mean { "3.13" } { "60" } LEO { "60" } LEO median { "4.8" } min converged { "100" }% NEES mean { "3.08" } { "96" } LEO { "96" } LEO median { "3.2" } min converged { "100" }% NEES mean { "2.74" } { "192" } LEO { "192" } LEO median { "2.7" } min converged { "100" }% NEES mean { "2.65" } { "288" } LEO { "288" } LEO median { "2.3" } min converged { "100" }% NEES mean { "3.06" } Li et al. { "2019" } (published, min) vs modelled: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

seg-aee2e93b2c20 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3589a089c89d = Příklad <c1/> mimo jiné nastavuje:

seg-4dbe1423bb57 = { "60" } LEO

seg-85b65d194f0d = { "96" } LEO

seg-2750ec8c218f = Štítek výsledku (enginu): MODELLED float PPP (kód a fáze bez ionosféry, bílé hodiny, mokré zpoždění jako náhodná procházka, float nejednoznačnosti po obloucích) na simulovaných měřeních ze stejného modelu; údaje Li et al. ({ "2019" }) jsou srovnáním trendu, nikoli reprodukcí

seg-225ef04c64af = Graf, který engine zapisuje pro scenarios/leo-ppp-convergence.toml, druh leo-ppp

seg-c75ca72ca711 = <b>MODELLED</b> Float PPP rozšířený Kalmanův filtr na kódu a fázi bez ionosféry: statické souřadnice, bílé hodiny přijímače, jeden mezisystémový bias pro každý další systém, zenitové mokré zpoždění jako náhodná procházka převedená faktorem 1/sin(elevace), float nejednoznačnost pro každý oblouk družice. Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-b55fd1cda5fa = <b>MODELLED</b> Float PPP rozšířený Kalmanův filtr na kódu a fázi bez ionosféry: statické souřadnice, bílé hodiny přijímače, jeden mezisystémový bias pro každý další systém, náhod. Orákulum (ExternalDataset): Test chí-kvadrát NEES je kontrola vnitřní konzistence (pravda a filtr sdílejí model). Trend je porovnán s Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min zkráceno na { "7.0" }, { "3.2" }, { "2.1" } a { "1.3" } min s { "60" }, { "96" }, { "192" } a { "288" } družicemi LEO. Přibalený scénář dává { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } a { "2.3" } min s i

seg-302365809dbf = MODELLED float PPP (kód a fáze bez ionosféry, bílé hodiny, mokré zpoždění jako náhodná procházka, float nejednoznačnosti po obloucích) na simulovaných měřeních ze stejného modelu; údaje Li et al. ({ "2019" }) jsou srovnáním trendu, nikoli reprodukcí (výsledek <c1/>)

seg-6ce77bce8946 = MODELLED: srovnání konzistence trendu, nikoli reprodukce konstelací, šumu ani stanic oné studie; bez řešení nejednoznačností, skoků cyklů, fázového navíjení, slapů ani časově korelovaných chyb produktů. (katalog druhů (<c1/>))

seg-ba2fd25fdcff = Čtyři zdejší konstelace LEO jsou reprezentativní slupky Walker delta ve výšce { "1000" } km a při { "60" } deg s { "60" }, { "96" }, { "192" } a { "288" } družicemi; NEJSOU návrhy z článku a šum, stanice i definice konvergence (horizontální a vertikální chyby pod { "10" } cm do konce běhu) patří tomuto modelu. Srovnání je proto MODELLED kontrola konzistence trendu: konvergence se musí zkracovat monotónně s t (komentář v souboru scénáře, řádky { "10" } až { "14" })

seg-b641b835570c = Konvergence přesného určení polohy z jednoho bodu pouze s GNSS a s doplněním LEO je MODELLED, nikoli ověřena proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady modelované části, takže schopnost zůstává na úrovni vypočtené z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-368eb6979183 = <s1>Předchozí</s1>leo-pnt-chain

seg-2458954d9c22 = <s1>Další</s1>leo-pvt
