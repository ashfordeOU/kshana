# docs--kind-holdover-test: translations (cs)

seg-f42465f7d066 = ns

seg-51362910dcb7 = Tento druh používají { "2" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-c61e88721556 = Druh scénáře enginu v{ $version }, rodina <a1>Hodiny, časování a holdover</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-849c08d3ce70 = Stránka rodiny: <a1>Hodiny, časování a holdover</a1>

seg-73929aeded02 = Zdroj: <c1/>

seg-218f00012d0e = <c1/> (druh scénáře)

seg-c0924aa36e64 = MODELLED test holdoveru časovacího systému, vyhodnocený ze záznamu časové chyby, který dodává PROVOZOVATEL (log linuxptp ptp4l, phc2sys nebo ts2phc, sledovací nebo statistický log chrony, log hodin TICC, TimeLab nebo RINEX, nebo dvojice time_s,time_error_ns). Test má čtyři kroky a Kshana neprovádí žádný z nich: uzamčený ZÁKLAD, ODPOJENÍ GNSS provozovatelem (anténním kabelem nebo výstupem simulátoru; Kshana nic nevysílá a nic neovládá) ve stanovený čas, HOLDOVER na vlastním oscilátoru systému a OBNOVA poté, co provozovatel ve druhém stanoveném čase GNSS obnoví. Záznam se v těchto dvou časech rozdělí. Základ: statistiky časové chyby a masky ITU-T napsané pro uzamčené hodiny. Holdover: statistiky, zlomkový frekvenční offset, který systém držel (přímka metodou nejmenších čtverců), masky napsané pro holdover nebo autonomní hodiny, obálka holdoveru ePRTC-A ze stanovené doby uzamčení a doba do překročení každého rozpočtu časové chyby. Obnova: zda a kdy |TE| vstoupila do stanoveného pásma a zůstala v něm, špička a největší skok. Každý limit je přepsán z veřejné tabulky ITU-T (telekomunikační časové masky); používá se formulace „změřeno vůči masce“ a oba časy jsou prohlášením provozovatele, nejsou ověřeny. Záznam příliš krátký pro masku je INCOMPLETE a nikdy se neextrapoluje. Viz docs/TIMING-HIL.md.

seg-cd6d840a1382 = Jeden běh <c1/> se shrnuje takto: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

seg-6a3dc8804be5 = Povinná pole: <c1/>, <c2/>

seg-4792040e4773 = Volitelná pole: <c1/>, <c2/>

seg-ad4f9c40e317 = Příklad <c1/> mimo jiné nastavuje:

seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

seg-a0f9749e9ca1 = master

seg-cd857523297f = phase

seg-29a012ae4735 = refuse

seg-d578fc8e6052 = Štítek výsledku (enginu): MODELLED — test holdoveru vyhodnocený ze záznamu časové chyby, který dodal provozovatel. Každý limit je přepsán z uvedeného veřejného doporučení ITU-T a výsledek je změřen vůči masce; nic netvrdí o tom, zda nějaké hodiny nebo systém doporučení splňují, a nikdo je neposoudil ani neschválil

seg-8ce93392747b = Graf, který engine zapisuje pro scenarios/holdover-test-ptp4l.toml, druh holdover-test

seg-3361819ae321 = <b>MODELLED</b> Druh <c1/>: záznam časové chyby (log linuxptp, chrony, TICC, TimeLab nebo RINEX, nebo dvojice time_s,time_error_ns) se rozdělí ve dvou časech, které provozovatel uvede pro odpojení a obnovení GNSS, na základ, holdover a

seg-e7273fd2a640 = <b>VALIDATED</b> Maximální chyba časového intervalu a časová odchylka, které hlásí druh scénáře <c1/>, na záznamu holdoveru telekomunikačního rozsahu: posuvná fronta monotónní s O(n). Orákulum (ExternalDataset): allantools { "2024.06" } — nezávislá knihovna třetí strany pro stabilitu frekvence — mtie() a tdev() na tests/fixtures/telecom_timing/holdover_te_series.csv, řada načtená z téhož textu o 17 platných číslicích na obou stranách; reference zaznamenává SHA-256 řady a lze ji offline znovu vygenerovat pomocí tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Ověřuje ESTIMÁTORY na tomto záznamu, ne syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Přepsané limity ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC uzamčený a holdover ePRTC-A (včetně obálky časové chyby z tabulky { "3" }. Orákulum (InternalConsistency): Přepis uvedených doporučení (volně ke stažení na itu.int), každý limit s označením tabulky nebo článku, vypsaný se všemi nepotvrzenými nebo neimplementovanými položkami v docs/TELECOM-TIMING.md; identity spojitosti v zlomových bodech, které tabulky implikují, jsou kontrolovány v testech. Přepis norem s kontrolami vnitřní konzistence, nikoli test shody a nikoli externí validace. { "0.30" } round { "2" } (pre-register

seg-142528f34e66 = <b>MODELLED</b> Druh <c1/>: záznam časové chyby (log linuxptp, chrony, TICC, TimeLab nebo RINEX, nebo dvojice time_s,time_error_ns) se rozdělí ve dvou časech th. Orákulum (InternalConsistency): Ruční výpočet na záznamech sestavených ze vzorců, jejichž sklon, skok, extrém a doba obnovy jsou známy před během (testy je uvádějí), a masky, obálka a rozpočty z řádků telecom-timing výše. Nebylo vyhodnoceno žádné laboratorní měření skutečného holdoveru a nebylo porovnáno žádné externí orákulum, takže druh nečiní žádné tvrzení o žádných hodinách ani systému; před jakýmkoli tvrzením pro třídu hodin je zapotřebí partner z časovací laboratoře

seg-59ff0b0e3d2d = MODELLED — test holdoveru vyhodnocený ze záznamu časové chyby, který dodal provozovatel. Každý limit je přepsán z uvedeného veřejného doporučení ITU-T a výsledek je změřen vůči masce; nic netvrdí o tom, zda nějaké hodiny nebo systém doporučení splňují, a nikdo je neposoudil ani neschválil. Časy, kdy byl GNSS odpojen a obnoven, jsou prohlášením provozovatele a nejsou ověřeny. Software pouze poradního (výsledek <c1/>)

seg-daeb4ad7aa35 = MODELLED test holdoveru časovacího systému, vyhodnocený ze záznamu časové chyby, který dodává PROVOZOVATEL (log linuxptp ptp4l, phc2sys nebo ts2phc, sledovací nebo statistický log chrony, log hodin TICC, TimeLab nebo RINEX, nebo dvojice time_s,time_error_ns). (katalog druhů (<c1/>))

seg-ff3008c250cc = Telekomunikační synchronizační masky ITU-T s PASS/FAIL a rezervou jsou MODELLED, nikoli ověřeny proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8ccd0f911626 = Test holdoveru vyhodnocený z časové chyby dodané provozovatelem je MODELLED, nikoli ověřen proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-72bad5444282 = Tematická stránka: <a1>TIMING-HIL.md</a1>

seg-3b3a24664dae = Tematická stránka: <a1>HARDWARE-SAFETY.md</a1>

seg-b754be35fb52 = <s1>Předchozí</s1>gravity-map

seg-e7665ee5e30e = <s1>Další</s1>hybrid-optical-rf
