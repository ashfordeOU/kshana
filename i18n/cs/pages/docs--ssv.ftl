# docs--ssv: translations (cs)

seg-0857a94a948e = Omezení

seg-75c8da01c0f1 = MET

seg-069a652c402e = práh

seg-1f79a5aae6c5 = Dostupnost signálu pro uživatele na kouli ve výšce { "36000" } km s polokulovou anténou, ze skutečného běhu enginu v{ $version } na scenarios/gnss-ssv-shell.toml (zmenšený běh: { "162" } uživatelů, { "3" } dny, kroky { "10" } min), při prahu { "20" } dB-Hz. Pro každou konstelaci a pásmo dva sloupce: podíl dvojic (uživatel, epocha) s alespoň jedním signálem a s alespoň čtyřmi. Kombinovaně, L1: { "99.4" } % alespoň jeden, { "73.2" } % alespoň čtyři, nejdelší výpadek pod čtyři signály { "160" } min. Kombinovaně, L5: { "100.0" } % alespoň jeden, { "99.9" } % alespoň čtyři, nejdelší výpadek pod čtyři signály { "20" } min. MODELLED: modelovaná studie ze stanovených vstupů, nikoli měření a nikoli tvrzení o službě pro žádný systém. Zmenšený rozsah není srovnáním s brožurou. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-92ef8e0b78de = Signály podél jedné vysoké oběžné dráhy kolem Země (perigeum { "497" } km, apogeum { "58622" } km, perioda { "18.8" } h), ze skutečného běhu enginu v{ $version } na scenarios/gnss-ssv-heo.toml, pásmo L1. Nahoře: nejlepší poměr nosné k hustotě šumu mezi viditelnými signály proti prahu { "20" } dB-Hz. Uprostřed: počet viditelných signálů ze všech konstelací, od { "4" } do { "55" } podél vzorkovaných bodů. Z přijatých spojů { "2252" } prošlo hlavním lalokem a { "696" } postranními laloky, s použitím označeného parametrického náhradního diagramu, nikoli změřeného diagramu žádného systému. Medián PDOP { "67" }, 95. percentil { "358" }. MODELLED: modelovaná studie ze stanovených vstupů, nikoli měření a nikoli tvrzení o službě pro žádný systém. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-902c5c7da9aa = Palubní devítistavový filtr na přeletu z nízké oběžné dráhy k Měsíci, ze skutečného běhu enginu v{ $version } na scenarios/gnss-ssv-nav-lunar.toml ({ "289" } epoch, vykresleno { "13" } bodů). Na logaritmické ose skutečná chyba polohy a vlastní jednosigmová mez filtru proti času od začátku. Uvnitř drah GNSS je RMS polohy { "1.4" } m; nad nimi { "90" } m, s konečnou chybou { "184" } m ve výšce { "193,330" } km s { "1" } měřením. Průměrná normalizovaná kvadratická chyba odhadu za celý běh je { "4.4" } (asi { "3" } pro konzistentní blok polohy). Pravda i filtr sdílejí své náhrady Slunce a Měsíce. MODELLED: modelovaná studie ze stanovených vstupů, nikoli měření a nikoli tvrzení o službě pro žádný systém. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-9a947b61a4cb = Relativní navigace { "2" } deputy kolem chief na vysoké oběžné dráze, ze skutečného běhu enginu v{ $version } na scenarios/gnss-ssv-formation-heo.toml ({ "401" } epoch). Pro každého deputy dva sloupce: RMS relativní polohy z odečtení dvou nezávislých absolutních odhadů a z relativního filtru na jednoduše diferencovaných pseudovzdálenostech. Základna { "0.8" } km: { "5.1" } m a { "1.2" } m. Základna { "2.0" } km: { "4.1" } m a { "2.1" } m. Absolutní filtr zde není konzistentní: průměrná normalizovaná kvadratická chyba odhadu { "187" } proti asi { "3" } u konzistentního filtru, takže jeho uváděná nejistota je mnohem příliš malá. MODELLED: modelovaná studie ze stanovených vstupů, nikoli měření a nikoli tvrzení o službě pro žádný systém. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-d76123040989 = Zaznamenané srovnání modelu dostupnosti pro kosmické uživatele s veřejnou brožurou Space Service Volume z uložených výsledků předregistrovaného běhu (xval/gnss-ssv/results-run1.json, zapsáno příkladem ssv_booklet_check enginu v{ $version }). Práh po prahu, buňky v toleranci: S0 { "13" } z { "13" } (MET); S1 { "43" } z { "52" } (NOT MET); S2 { "48" } z { "52" } (NOT MET); S3 { "122" } z { "155" } (NOT MET); S4 { "132" } z { "156" } (NOT MET); S5 { "18" } z { "26" } (NOT MET); S6 { "26" } z { "26" } (MET); S7 { "0" } z { "20" } diagramů panelů (NOT MET). Za předregistrovaného čtení jsou splněny jen S0 a S6. Diagnostická varianta s jinými úhly GLONASS z brožury dovede S1, S2 a S4 ke všem buňkám, ale nenahrazuje záznamový běh. Žádný řádek registru není VALIDATED. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-74675df154dc = Zdroj: <c1/>

seg-ce7ea32e67f1 = GNSS za hranicí konstelace: druh <c1/>

seg-389cb131fd77 = Pouze poradní charakter. Modelované výsledky z uvedených vstupů a simulované pravdy; nejde o certifikaci, o hodnotu kvalifikovanou pro let ani o tvrzení o servisním prostoru pro jakýkoli systém. Kshana nic nevysílá.

seg-a0011b278269 = Druh <c1/> odpovídá na otázku: kolik signálů GNSS může využít kosmická loď nad drahami GNSS, kolem nich nebo daleko za nimi, jak jsou silné, jak dobrá je geometrie a co s nimi dokáže palubní filtr? Má tři režimy, určené tím, kterou tabulku scénář má: <c2/>, <c3/> nebo <c4/> (s nepovinným <c5/>).

seg-2e4ac6b7a883 = Stav: <b>MODELLED</b>. Průchody dostupností jsou v předregistraci porovnány s brožurou ICG Space Service Volume; než se na kterékoli číslo spolehnete, viz <a1>co porovnání ukazuje</a1>.

seg-a0ff58bccaa8 = Veřejné zdroje

seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, Úřad OSN pro záležitosti vesmíru, ST/SPACE/75 ({ "1" } listopadu { "2018" }), připravený Mezinárodním výborem pro GNSS (ICG), pracovní skupina B: metoda (příloha B), dráhové elementy každé konstelace (příloha C), šířky svazků a výkony vysílačů (tabulky B2, B6, B8, { "4.2" }), uživatelské antény (tabulka B10) a publikované tabulky dostupnosti. Sama je simulací. Stahuje ji <c1/> (zafixované SHA-256), nikdy se nepřibaluje.

seg-e46d9353e6f3 = Navigační středisko pobřežní stráže USA, směrové charakteristiky panelových antén GPS Block IIR a IIR-M (Marquis, { "2014" }): změřené charakteristiky panelů L1 použité jen k posouzení parametrického náhradního modelu (práh S7). Stahují se, nikdy se nepřibalují, žádná data charakteristik nejsou uložena.

seg-0a002dc0df64 = Konstanty modelu (gravitace, rotace Země, útlum volným prostorem, hustota šumu) jsou standardní; Gallagherův zákon hustoty plazmasféry, Chapmanova vrstva a profil radiového indexu lomu jsou publikované tvary, použité s uvedenými jednoduchými parametry (viz <c1/>).

seg-c3c3f63df966 = Režim slupky: globální metrika z brožury

seg-f1e153c95b13 = <c1/> umístí uživatele na kouli (výchozí výška { "36,000" } km s hemisférickou anténou mířící k nadiru, horní SSV; nebo { "8,000" } km s všesměrovou anténou, dolní SSV) na mřížce icosféry o 2 562 bodech a po { "14" } dnů v krocích po 1 minutě počítá podíl dvojic (uživatel, epocha) s alespoň jedním a alespoň čtyřmi signály, pro každou konstelaci i dohromady, a nejdelší výpadek u nejhoršího uživatele. Průchod používá uzavřený tvar intervalu viditelnosti v centrálním úhlu (kužel svazku, zákryt Zemí koulí o poloměru { "6378" } km plus { "50" } km, polosféra uživatele a mez dosahu RF) a v sestavení pro vydání běží v sekundách; test vlastností jej kontroluje proti obecnému geometrickému predikátu.

seg-3fb4c06c8b3f = Režim trajektorie: podél oběžné dráhy

seg-632fedc95af5 = <c1/> vede uživatele po keplerovské oběžné dráze (předvolba: <c2/>, <c3/>, <c4/>, <c5/> (tabulka { "5.10" } z brožury) nebo <c6/>, nebo elementy) a hlásí pro každé pásmo a konstelaci dostupnost jednoho a čtyř signálů, délky výpadků, signály v dohledu, nejlepší C/N0, faktor zhoršení přesnosti (medián, 95. percentil, nejhorší), spoje přijaté hlavním lalokem a postranními laloky a volitelně časovou řadu a CSV.

seg-7bfd301cd789 = <b>Vysílací charakteristika</b> (<c1/>): <c2/> (konstantní výkon uvnitř referenčního úhlu od osy), <c3/> (označený náhradní model: { "3" } dB na stupeň za referenčním úhlem až na podlahu { "25" } dB pod hlavním lalokem; <b>nikoli</b> změřená charakteristika jakéhokoli systému) nebo <c4/> (změřená charakteristika, kterou dodáte: <c5/> nebo vložené <c6/>; charakteristiky panelů Block IIR/IIR-M lze extrahovat pomocí <c7/>).

seg-c1390929d9f2 = <b>Přijímací antény</b>: všesměrová, polosférická, nebo vysokozisková a plošná anténa z tabulky B10 brožury, k nadiru nebo k zenitu; každý spoj používá anténu s vyšším ziskem.

seg-fe56ab7a2cac = <b>Médium limbového paprsku</b> (<c1/>): Chapmanova ionosféra, plazmasféra (tvar Gallaghera { "1988" }, plazmapauza při L = { "4.5" }, zúžená pod { "1,500" } km) a neutrální atmosféra (ohyb asi { "1.33" } stupně u povrchu, absorpce kyslíkem, defokusace) integrované podél přímého paprsku. Hlásí šikmé TEC, plazmasférickou část, nadměrné zpoždění, tečnou výšku a spoje ztracené při dotyku. Integrace přímým paprskem: ohyb se uvádí, neiteruje se.

seg-1bad91204f6a = <b>Přijímač pro slabý signál</b> (<c1/>): koherentní a nekoherentní integrace, limit datového bitu, aiding a pilotní kanály, hledání Dopplera; práh akvizice při uvedených pravděpodobnostech detekce a falešného poplachu a prahy sledování nosné a kódu nahrazují pevný práh C/N0 (rozsah { "10" } až { "25" } dB-Hz). Znovu používá modely akvizice a sledovacích smyček enginu.

seg-497126fe23e9 = Navigační režim: palubní filtr

seg-af7919ae046e = <c1/> vede plavidlo na vysoké dráze nebo na přechodu k Měsíci a provozuje devítistavový rozšířený Kalmanův filtr (poloha, rychlost, odchylka a drift hodin přijímače, měřítko tlaku slunečního záření) nad pseudovzdálenostmi. Pravda je integrována s gravitací hmotného bodu, J2, třetími tělesy Slunce a Měsíce a tlakem záření s válcovým stínem Země; filtr modeluje gravitaci, J2 a třetí tělesa a odhaduje tlak záření. Pseudovzdálenosti pocházejí ze stejné geometrie spojů a prahu C/N0 jako průchody; jejich šum roste, jak C/N0 klesá; nadměrné zpoždění média (s <c2/>) je přidáno a filtrem není modelováno. Zpráva odděluje část běhu uvnitř drah GNSS (pod výškou { "20,000" } km) od části nad nimi, uvádí nejdelší mezeru bez měření a střední normalizovanou chybu odhadu na druhou (asi { "3" } pro konzistentní blok polohy). Slunce a Měsíc jsou nízkopřesné kruhové náhradní modely.

seg-a515950c13d6 = Režim formace: relativní navigace

seg-8d2b72ca56d9 = <c1/> (pro vedoucí těleso vyžaduje <c2/>) přidává zástupce posunuté ve skutečné anomálii. Každé plavidlo provozuje absolutní filtr; poloha zástupce vůči vedoucímu se odhaduje odečtením nezávislých absolutních odhadů a relativním filtrem nad jednoduše diferencovanými pseudovzdálenostmi signálů, které sledují obě plavidla. Zpráva uvádí obojí, základnu a počet společně sledovaných signálů.

seg-dc78efcb8bcb = Co ukazuje porovnání s brožurou

seg-643bcfcea515 = Prahy byly předregistrovány (<c1/>, dodatky { "1" } až { "5" }) před během v plné velikosti; výsledky v <c2/>, buňky v <c3/>, zafixované pomocí <c4/>, včetně nezdarů.

seg-5498636f8d07 = co

seg-32c0ea7929e2 = běh { "1" } (předregistrovaný výklad)

seg-abe521171d2f = varianta s úhlem GLONASS (diagnostika)

seg-9489ef691574 = minimální vyzařovaný výkon, { "13" } signálů, do { "0.1" } dB

seg-4b7e0252355c = geometrie horní SSV (tabulka B4)

seg-e3c870085a6c = NOT MET ({ "43" } z { "52" } buněk)

seg-b57b1f9b0b43 = všech { "52" } buněk v toleranci

seg-6bf57763d120 = dolní SSV (tabulka { "5.2" })

seg-c9349a3a0185 = NOT MET ({ "48" } z { "52" })

seg-056eae8e55d1 = všech { "52" }

seg-805e4402f556 = horní SSV s 15/20/25 dB-Hz (tabulka B9)

seg-a8d9a1f66989 = NOT MET ({ "122" } ze { "155" })

seg-7a6fd0eb8f77 = { "153" } ze { "155" }

seg-cb1a6f558a09 = šest misí GEO

seg-e4759e8d2baa = NOT MET ({ "132" } ze { "156" })

seg-3e59e79791e2 = všech { "156" }

seg-76d88834ab69 = mise HEO

seg-1c06414304a0 = NOT MET ({ "18" } z { "26" })

seg-b1656692859b = { "21" } z { "26" }

seg-d4cedd711485 = lunární mise

seg-b52333886109 = NOT MET ({ "23" } z { "26" })

seg-479a041e2b62 = parametrická charakteristika proti změřeným charakteristikám panelů GPS L1

seg-b514bc035c86 = NOT MET (RMS { "6.3" } až { "8.8" } dB proti { "3" } dB)

seg-dd703fdea949 = Brožura si protiřečí v referenčním úhlu GLONASS od osy: tabulky B2 a B6 uvádějí { "20" } a { "28" } stupňů, tabulka { "4.2" } uvádí { "26" } a { "34" }. Běh { "1" } použil první (to, co jmenovala předregistrace); téměř každý nezdar v S1 až S5 je GLONASS. Varianta, k níž se autoři zavázali jako k diagnostice před jejím spuštěním, používá druhou a pak se horní SSV, dolní SSV a mise GEO shodují buňku po buňce, včetně výpadků. Varianta běh { "1" } nenahrazuje. <b>Žádný řádek není VALIDATED</b>: brožura je simulace, pravidlo verdiktu vyžaduje S0 až S3 podle předregistrovaného výkladu a zbývající nezdary (GPS L1 při { "20" } dB-Hz, HEO Galileo, QZSS a NavIC, lunární řádky GLONASS) nejsou vysvětleny.

seg-6eecf686159b = Spuštění

seg-adbb9c22de1c = Každý přibalený scénář je zkrácen tak, aby běžel v sekundách; porovnání v plné velikosti je příklad výše. Tentýž druh běží z Pythonu (<c1/>), z prohlížeče (WebAssembly), ze serveru MCP (<c2/>, pouze vložený text: <c3/> je zdroj souboru a je odmítnut, použijte <c4/>) a v pluginech.

seg-8fa10c8e7ab7 = MODELLED: nic z toho nebylo porovnáno s naměřeným příjmem GNSS na oběžné dráze. Brožura je simulace.

seg-b34e9acebec0 = Keplerovské dvoutělesové oběžné dráhy pro konstelace GNSS a pro uživatele v průchodech; lunární přechod je dvoutělesová elipsa, nikoli propagovaná trajektorie.

seg-76aa617ba828 = Médium je uvedený jednoduchý model s integrací přímým paprskem; není to předpověď kosmického počasí.

seg-3114c4249988 = Navigační filtr je návrhová studie: žádné manévry, žádná orientace, žádné vícecestné šíření a pravda sdílí efemeridy Slunce a Měsíce s filtrem.

seg-2deafc0f9534 = <s1>Předchozí</s1>Lunární referenční stanice

seg-23386861eebf = <s1>Další</s1>Oběžná dráha Měsíce a povrch jako infrastruktura
