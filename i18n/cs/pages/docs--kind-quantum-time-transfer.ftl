# docs--kind-quantum-time-transfer: translations (cs)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-c61e88721556 = Druh scénáře enginu v{ $version }, rodina <a1>Hodiny, časování a holdover</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-849c08d3ce70 = Stránka rodiny: <a1>Hodiny, časování a holdover</a1>

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-a3697ad561db = Hz

seg-496b17a8d3b9 = Tematická stránka: <a1>QUANTUM-MODELS.md</a1>

seg-a1810bbca337 = <b>MODELLED</b> Obousměrný přenos/TWSTFT (Sagnac), společný pohled GNSS, PPP; jitter spoje→vzdálenost. Orákulum (ExternalDataset): Velikost Sagnacova jevu zkontrolována proti autoritativní PUBLIKOVANÉ HODNOTĚ — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), rov. { "1.29" }: obeplutí rovníku východním směrem nahromadí { "207.4" } ns (2ωA_E/c²); kshana reprodukuje { "207.386" } ns. Nezávisle potvrzeno RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), který nese stejnou geometrii 2Aω/c². Složený BIPM TWSTFT transponder/společný pohled/

seg-a8beb8dfc757 = Rozpočet chyb přenosu času je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady modelované části, takže schopnost zůstává na úrovni vypočtené z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-bb07c8ee153f = <b>PARTNER</b> Neposkytuje se — pouze modely výkonu; hardware se studenými atomy a hodinami je záležitostí partnera. Orákulum (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Jeden reprodukovatelný objekt TradeEvidence (pevný rámec: scénář+seed+engine; společné hodnoty kvantový-vs-klasický pro každý ukazatel kvality s polaritně správným přínosem, volitelné { "95" }%. Orákulum (InternalConsistency): Identity uzavřeného tvaru pro přínos/vítěze a věrný obal stávajícího quantum_trade::TradeResult; poctivost svázaná s registrem reprezentativnosti a štítky ověření

seg-eb75c6a4dcec = Důkazy z obchodního srovnání kvantového a klasického přístupu (společný tvar) jsou MODELLED, nikoli ověřené: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-eee91dc5741d = Zdroj: <c1/>

seg-05060df7f0b7 = <c1/> (druh scénáře)

seg-540545e6f846 = Řetězec důvěryhodného kvantového časování, stav MODELLED: kompletní rozpočet přenosu času kvantový (hodiny s optickou mřížkou + spoj se spřažením/jednofotonový) oproti klasickému (CSAC + obousměrný RF), znovu použitá ochranná úroveň časování + bezpečnostní ukazatel kvality pro útok zpožděním/přehráním (1-P_md), pravděpodobnost detekce anomálie hodin + latence CUSUM a obchodní srovnání kvantového a klasického přístupu jako otevřené TradeEvidence se záznamem reprezentativnosti + mezer k letu. Ilustrativní parametry zařízení/spoje z veřejných zdrojů; modeluje třídu, netvrdí se žádné TRL/let/certifikace.

seg-ed79bfe80fe7 = Jeden běh <c1/> se shrnuje takto: quantum-time-transfer | kvantový řetězec 1.233e-12s oproti klasickému 5.292e-9s | PL { "555.24" } ns | zabezpečení Pd { "1.000" } (Pfa { "1e-3" }) | anomálie Pd { "0.761" } | obchodní srovnání vítězí kvantový 2/2 | MODELLED

seg-80e94491c3df = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-6b03fa15a60d = Příklad <c1/> mimo jiné nastavuje:

seg-09760f892c7b = Graf, který engine zapisuje pro scenarios/quantum-time-transfer.toml, druh quantum-time-transfer

seg-873de4d05663 = <b>VALIDATED</b> Latence detekce v nejhorším případě detektoru tabulárního CUSUM (⌊h/(z−k)⌋+{ "1" }) a průměrná délka běhu mimo kontrolu, používané monitory ochranné úrovně časování a spoofingu. Orákulum (ExternalDataset): Publikovaná ARL tabulárního CUSUM: aproximace Brownova pohybu podle Siegmunda ({ "1985" }) (Hawkins & Olwell { "1998" }, rov. { "3.7" }) křížově ukotvená k tabulkám ARL v Montgomery, Introduction to Statistical Quality Control (Wiley) pro k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministická latence přesně shodná s orákulem prvního průchodu. Složená mez TPL zůstává MODELLED

seg-b51e62b8dc63 = Řetězec důvěryhodného kvantového časování, stav MODELLED: kompletní rozpočet přenosu času kvantový (hodiny s optickou mřížkou + spoj se spřažením/jednofotonový) oproti klasickému (CSAC + obousměrný RF), znovu použitá ochranná úroveň časování + bezpečnostní ukazatel kvality pro útok zpožděním/přehráním (1-P_md), pravděpodobnost detekce anomálie hodin + latence CUSUM a obchodní srovnání kvantového a klasického přístupu jako otevřené TradeEvidence se záznamem reprezentativnosti + mezer k letu. (katalog druhů (<c1/>))

seg-dee0faf63e7f = Důvěryhodné kvantové časování — kompletní řetězec přenosu času, zabezpečená distribuce, detekce anomálií a obchodní srovnání kvantového a klasického přístupu. MODELLED; ilustrativní parametry zařízení/spoje z veřejných zdrojů; modeluje třídu, žádné tvrzení o TRL ani letu. (komentář v souboru scénáře, řádky { "1" } až { "3" })

seg-6e9f5dfca6b0 = Důvěryhodné kvantové časování (přenos času + zabezpečená distribuce + anomálie) je MODELLED, nikoli ověřené: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-d3665be74ff1 = <s1>Předchozí</s1>quantum-gnss-free-nav

seg-0d4b1f97541f = <s1>Další</s1>quantum-trade
