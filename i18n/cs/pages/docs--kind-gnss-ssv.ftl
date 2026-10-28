# docs--kind-gnss-ssv: translations (cs)

seg-37d29d8303fe = km

seg-834408a40783 = min

seg-1b94e5a24a2d = Zdroj: <c1/>

seg-ee3ecc6e0330 = <c1/> (druh scénáře)

seg-d07af7221334 = Druh scénáře enginu v{ $version }, rodina <a1>Navigace uživatelů v kosmu</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-d6d7bca305dc = MODELLED dostupnost GNSS a síla spoje v Space Service Volume a za ním: pro uživatele na kouli (globální slupka z brožury ICG) nebo na keplerovské trajektorii (od LEO po přechod k Měsíci) počítá, podle konstelace (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i pro všechny dohromady, signály použitelné nad prahem C/N0 – dostupnost alespoň jednoho a čtyř signálů, maximální délku výpadku, přijímané C/N0, faktor DOP (zhoršení přesnosti), spoje hlavním a postranním lalokem – s vysílacím diagramem z brožury, parametrickým nebo dodaným uživatelem, volitelnou ionosférou podél okrajového paprsku a vlivy plazmasféry a atmosféry a volitelným návrhem přijímače pro slabé signály; dále palubní rozšířený Kalmanův filtr GNSS pro plavidla na HEO a přechodových drahách k Měsíci (orbitální dynamika, tlak slunečního záření, třetí tělesa, hodiny) a relativní navigaci formace více plavidel pomocí jednoduše diferencovaných pseudovzdáleností. Zkontrolováno proti tabulkám brožury ICG SSV v rámci předregistrace (xval/gnss-ssv)

seg-d739ae994bf0 = Jeden běh <c1/> se shrnuje takto: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

seg-79d2e350ed73 = Povinná pole: <c1/>

seg-7fc75803140d = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-cebc76420d69 = Příklad <c1/> mimo jiné nastavuje:

seg-ce3b64e8c1f4 = [l1, l5]

seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

seg-b02a3ef32d54 = HEO, antény s vysokým ziskem do nadiru a plošné antény do zenitu, parametrický s

seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

seg-3421a66993bd = heo

seg-8974ff39f695 = parametric

seg-1d65b71c5de0 = { "5" } přibalených scénářů používá tento druh; ostatní jsou v <a1><c1/></a1>.

seg-8ac8f00f6c77 = 1/m^{ "3" }

seg-15ca016a7a4f = Štítek výsledku (enginu): MODELLED: geometrický rozbor a rozbor rozpočtu spoje. Diagram z brožury je hlavní lalok s konstantním výkonem, parametrický diagram je reprezentativní náhrada a médium podél okrajového paprsku je jednoduchý uvedený model; nic z toho není měřením signálu v kosmu. Údaje o dostupnosti a výpadcích sledují metodu

seg-7dae5e291c8b = Graf, který engine zapisuje pro scenarios/gnss-ssv-heo.toml, druh gnss-ssv

seg-0aae0574c5e6 = <b>MODELLED</b> Rozbory dostupnosti druhu <c1/>: podle konstelace (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i souhrnně podíl dvojic (uživatel, epocha) s alespoň jedním a alespoň čtyřmi signály a nejdelší výpadek, pro uživatele na kouli

seg-07c94d5ad15c = <b>MODELLED</b> Režim <c2/> druhu <c1/>: devítistavový rozšířený Kalmanův filtr (poloha, rychlost, posun a drift hodin přijímače, měřítko tlaku slunečního záření) na pseudovzdálenostech, jejichž dostupnost, šum a C/N0 pocházejí ze stejného spoje

seg-41bfe74c6f6f = <b>MODELLED</b> Režim <c2/> druhu <c1/>: hlavní a podřízená plavidla každé spouští absolutní filtr; poloha podřízeného plavidla vůči hlavnímu se odhaduje odečtením absolutních odhadů a relativním filtrem na jednoduše diferencovaných pseudovzdálenostech

seg-de9a2a5b5f04 = <b>MODELLED</b> Rozbory dostupnosti druhu <c1/>: podle konstelace (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i souhrnně podíl dvojic (uživatel, epocha) s alespoň. Orákulum (ExternalDataset): Brožura ICG Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), sama o sobě simulace, porovnaná v rámci předregistrace potvrzené před během (xval/gnss-ssv/PREREGISTRATION.md; výsledky v xval/gnss-ssv/RESULTS.md, zafixované testem tests/ssv_booklet_results.rs, včetně nezdarů). Běh { "1" } podle předregistrovaného výkladu: konstanty minimálního vyzářeného výkonu a lunární práh souhlasí (S0, S6 splněno); horní a dolní SSV, práh RF

seg-f0b778c4922a = <b>MODELLED</b> Chapmanova ionosféra, Gallagherova plazmasféra a neutrální atmosféra (lom podle refraktivity, absorpce kyslíkem, defokusace) integrované podél přímého. Orákulum (InternalConsistency): Uzavřené tvary a publikované velikosti v testech (maximum Chapmanovy vrstvy a lom povrchového okraje, několik TECU plazmasféry na paprsku GPS–GEO); návrh přijímače znovu používá modely akvizice a sledovacích smyček a jejich testy. S ním nejsou porovnána žádná měřená data z limb-sondáže ani z příjmu slabých signálů

seg-77cef183420e = <b>MODELLED</b> Režim <c2/> druhu <c1/>: devítistavový rozšířený Kalmanův filtr (poloha, rychlost, posun a drift hodin přijímače, měřítko tlaku slunečního sc. Orákulum (InternalConsistency): Simulovaná pravda oproti vlastnímu odhadu filtru (průměrná normalizovaná kvadratická chyba odhadu konzistentního filtru je pro polohu zhruba { "3" }) a determinismus pro pevný seed. Nejsou porovnána žádná letová ani zaznamenaná data GNSS z vysokých drah; Slunce a Měsíc jsou nízkopřesné kruhové náhrady

seg-429e154cd691 = <b>MODELLED</b> Režim <c2/> druhu <c1/>: hlavní a podřízená plavidla každé spouští absolutní filtr; poloha podřízeného plavidla vůči hlavnímu se odhaduje odečtením abs. Orákulum (InternalConsistency): Stejná simulovaná pravda jako u absolutního filtru: chyba relativního filtru proti skutečnému relativnímu stavu a kontrola, že si vede alespoň tak dobře jako odečtení dvou nezávislých absolutních řešení. Nejsou porovnána žádná letová data formace

seg-1dd1beb01075 = MODELLED: geometrický rozbor a rozbor rozpočtu spoje. Diagram z brožury je hlavní lalok s konstantním výkonem, parametrický diagram je reprezentativní náhrada a médium podél okrajového paprsku je jednoduchý uvedený model; nic z toho není měřením signálu v kosmu. Údaje o dostupnosti a výpadcích sledují metodu brožury ICG Space Service Volume (UN ST/SPACE/75) a jsou zkontrolovány proti jejím tabulkám v xval/gnss-ssv/. (výsledek <c1/>)

seg-e9c2dedbc971 = MODELLED dostupnost GNSS a síla spoje v Space Service Volume a za ním: pro uživatele na kouli (globální slupka z brožury ICG) nebo na keplerovské trajektorii (od LEO po přechod k Měsíci) počítá, podle konstelace (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i pro všechny dohromady, signály použitelné nad prahem C/N0 – dostupnost alespoň jednoho a čtyř signálů, maximální délku výpadku, přijímané C/N0, (katalog druhů (<c1/>))

seg-3add0e744c54 = MODELLED: diagram je reprezentativní, nikoli změřený; médium je uvedený jednoduchý model (docs/SSV.md). (komentář v souboru scénáře, řádek { "14" })

seg-6b4655dd5270 = Dostupnost signálů GNSS v Space Service Volume a za ním ve srovnání s brožurou ICG SSV je MODELLED, nikoli ověřena proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady modelované části, takže schopnost zůstává na úrovni vypočtené z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-a9e1798308df = Vlivy ionosféry, plazmasféry a atmosféry podél okrajového paprsku na šikmé signály GNSS a návrh přijímače pro slabé signály v druhu <c1/> jsou MODELLED, nikoli ověřeny proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-132be2813c10 = Palubní navigační filtr GNSS pro kosmické lodě na vysokých drahách a přechodových drahách k Měsíci je MODELLED, nikoli ověřen proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-f9405de9adb8 = Relativní navigace formace více kosmických lodí na vysoce eliptické dráze z GNSS je MODELLED, nikoli ověřena proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-4881f925ea7f = Stránka rodiny: <a1>Navigace uživatelů v kosmu</a1>

seg-4b72df59b3f9 = Tematická stránka: <a1>SSV.md</a1>

seg-c9ac9a99bcbb = <s1>Předchozí</s1>gnss-sim

seg-9df48482a140 = <s1>Další</s1>gravity-map

seg-795e0409fa5a = <b>MODELLED</b> Fáze <c1/>: střední stav propagátorem Cowell z enginu (Země jako hmotný bod a J2, Slunce a Měsíc jako třetí tělesa, Měsíc z jádra DE440 vlákna, kde pokrývá úsek, a Slunce z analytické řady

seg-6a26b9ab59fe = Stránka tématu: <a1>MISSION-THREAD.md</a1>
