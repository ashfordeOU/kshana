# docs--kind-earth-gnss-lunar: translations (cs)

seg-37d29d8303fe = km

seg-b054c73f22e5 = žádná hodnota

seg-59afd80736c5 = <b>PARTNER</b> Neposkytuje se: Kshana modeluje výkon signálu, nikoli nákladový hardware ani antény. Oracle (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-9a399fed06c4 = Zdroj: <c1/>

seg-886b3796afaa = <c1/> (druh scénáře)

seg-c8a8be4b8894 = Příjem GNSS ze Země v lunární vzdálenosti, vrstva slabého signálu, kterou jmenuje článek o odolnosti v konfliktu a pro niž engine neměl model. Družice GNSS míří anténou na Zemi; přijímač poblíž Měsíce je vzdálen asi patnáctinásobek orbitálního poloměru, takže se projevují tři věci najednou. Země ZAKRÝVÁ OSU ANTÉNY: z { "26,560" } km se jeví pod polovičním úhlem { "13.9" } deg, takže každý paprsek mířící k Měsíci musí vysílač opustit nejméně tolik stupňů od nadiru, což odstraní vrchol svazku ještě před výpočtem jakéhokoli výkonu. Zbývá OKRAJ HLAVNÍHO LALOKU A POSTRANNÍ LALOKY, režim, v němž užitečné zatížení LuGRE v roce { "2025" } skutečně pracovalo. A ztráta ve volném prostoru činí asi { "208" } dB na L1, zhruba o { "25" } dB více, než platí pozemní uživatel. Zpráva vydává jeden řádek na družici (úhel od osy, zakrytí Zemí, vzdálenost, ztráta šířením, zisk vysílače při tomto úhlu, přijatý výkon, poměr nosné k hustotě šumu) a agreguje jen spoje překračující práh sledování. TAKÉ UVÁDÍ PODMÍNĚNOST, protože právě ta vrstvu definuje: každá viditelná družice leží uvnitř kužele širokého z Měsíce několik stupňů, takže zorné přímky jsou téměř rovnoběžné, zhoršení přesnosti je obrovské a určení polohy ze Země-GNSS v lunární vzdálenosti je pozorování třídy ČASU mnohem spíše než třídy polohy. MODELLED, a důvodem je vysílací diagram: zisk v úhlu je rovnoměrná kruhová apertura (Airy), zatímco skutečná anténa GPS L1 je dvanáctiprvkové šroubovicové pole s tvarovaným hlavním lalokem a postranními laloky jiného než Airyho tvaru. Naměřené diagramy existují a nejsou zde přibaleny, takže pořadí a řády velikosti jsou smysluplné, ale dB jednotlivé družice nikoli. Záměrně CHYBÍ, a každé z toho činí rozpočet optimistickým: žádná ionosférická ani troposférická ztráta na paprscích dotýkajících se okraje, žádná polarizační ztráta, ztráta zaměřením ani implementační ztráta a kulová Země bez refrakčního rozšíření. Poloha Měsíce je VSTUP (vzdálenost plus inerciální směr), nikoli vyhledání v efemeridách, protože testovanou veličinou je spoj a geometrie svazku. Povýšení tohoto řádku na stupeň ověřeno proti nezávislé vnější referenci vyžaduje naměřený vysílací diagram a normální body LuGRE; ani jedno není v repozitáři a ani jedno se zde nevymýšlí.

seg-75b6814c0091 = Jeden běh <c1/> se shrnuje takto: Earth-GNSS ve lunární vzdálenosti — { "24" } družic, přijímač { "384400" } km od okraje Země konstelace: { "13.90" } deg od nadiru — každý paprsek mířící k Měsíci musí tuto hodnotu překročit { "22" } z { "24" } nezakryto; { "0" } překračuje práh sledování { "25.0" } dB-Hz žádný spoj nedosahuje prahu méně než dva sledovatelné spoje; žádný úhlový rozptyl k uvedení méně než čtyři sledovatelné spoje, nebo singulární geometrie: žádný DOP PRŮCHOD přes { "64" } epoch / { "43082" } s: dostupnost signálu { "0.375" }, dostupnost URČENÍ POLOHY { "0.000" } sledovatelné spoje v průměru { "0.75" }, max. { "2" }; nejlepší C/N0 { "30.93" } dB-Hz; nejlepší PDOP žádný Dostupnost URČENÍ POLOHY berte jako apriorní hodnotu této vrstvy, nikoli dostupnost signálu: jeden spoj je pozorování hodin, čtyři jsou poloha. MODELLED: zisk vysílače je náhrada rovnoměrnou aperturou (Airy), nikoli naměřený svazek GPS, a neuplatňuje se žádná atmosférická, polarizační ani implementační ztráta, takže zdejší rozpočet je optimistický. Řády velikosti a pořadí jsou smysluplné; dB jednotlivé družice nikoli.

seg-6c0897da2efa = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-8c6bb203352d = Příklad <c1/> mimo jiné nastavuje:

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-cf1dce5fc824 = Graf, který engine zapisuje pro scenarios/earth-gnss-lunar.toml, druh earth-gnss-lunar

seg-04f59a1e2ec2 = <b>MODELLED</b> Příjem GNSS ze Země v lunární vzdálenosti: vrstva slabého signálu, kterou jmenuje P7 Table { "1" } a pro niž engine neměl model.

seg-9531f6b14fc8 = <b>MODELLED</b> Příjem GNSS ze Země v lunární vzdálenosti: vrstva slabého signálu, kterou jmenuje P7 Table { "1" } a pro niž engine neměl model. Pro každou družici a každou epochu vypočítá off-. Oracle (InternalConsistency): Identity v uzavřeném tvaru a vnitřní konzistence; ŽÁDNÉ vnější orákulum se netvrdí. Polovičního úhel okraje Země se kontroluje proti asin(R_earth/r_orbit) a geometrie proti němu; ztráta ve volném prostoru, jádro DOP a propagace SGP4, které se zde skládají, jsou každé externě ověřeny ve vlastních řádcích a tento řádek jejich stav nepřebírá. PROČ MODELLED, a je to vysílací diagram: zisk v úhlu je rovnoměrně osvětlen

seg-6dfc5503f58f = MODELLED, a důvodem je vysílací diagram: zisk v úhlu je rovnoměrná kruhová apertura (Airy), zatímco skutečná anténa GPS L1 je dvanáctiprvkové šroubovicové pole s tvarovaným hlavním lalokem a postranními laloky jiného než Airyho tvaru. (katalog druhů (<c1/>))

seg-c40d3fd8c12e = CO JE MODELLED A PROČ TO NENÍ VALIDATED Zisk vysílače v úhlu je rovnoměrně osvětlená kruhová apertura — Airyho diagram. Skutečná anténa GPS L1 je dvanáctiprvkové šroubovicové pole, jehož naměřený diagram má tvarovaný hlavní lalok, záměrně vrcholící mimo osu, aby se výkon vyrovnal přes kotouč Země, a postranní laloky, které nejsou Airyho vůbec. Naměřené diagramy jsou zveřejněny; nejsou přibaleny v tom (komentář v souboru scénáře, řádky { "29" } až { "35" })

seg-01fa469abd95 = Earth-GNSS ve lunární vzdálenosti je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-2fd936b76f4a = <s1>Předchozí</s1>contact-schedule

seg-95a5aa0adeb3 = <s1>Další</s1>entry-heating
