# docs--marine-integrations: translations (cs)

seg-2e34ace70d11 = Zásuvný modul Signal K

seg-0857a94a948e = Omezení

seg-2247a2344710 = Význam

seg-c3c260b7063e = Testy

seg-06ff6eed7e99 = OpenCPN

seg-ab1af8b3d968 = viz výše

seg-c353e7bec219 = Klíč

seg-df52127d74b6 = Kde

seg-7670cf4ceda3 = Výchozí hodnota

seg-7e304f816037 = Zdroj: <c1/>

seg-fb2b0841a172 = Námořní integrace: skóre důvěryhodnosti na můstku

seg-a88b3968c706 = Námořní skóre důvěryhodnosti { -brand } (<a1><c1/></a1>) je dostupné ze softwaru, který už plavci používají: plugin serveru <b>Signal K</b> a <b>OpenCPN</b> přes NMEA v režimu brány po TCP. Referenční sestava ho nasadí na malý počítač vedle přijímače.

seg-eb8043b9e269 = <b>Software pouze poradního charakteru.</b> { -brand } není typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }) a nebyl posuzován podle žádné výkonové normy. Vše na této stránce je pomůckou pro úsudek navigátora. Za bezpečnou navigaci plavidla a za jakékoli rozhodnutí spolehnout se na fix, nebo se na něj přestat spoléhat, zůstává odpovědný provozovatel. Nic zde nevysílá a nic zde neučiní fix přesnějším.

seg-dab66f260e56 = Součást

seg-40fd2019e974 = Stav ve verzi { "0.35" }

seg-7bcecf49199c = dodáno, jednotkově testováno na zaznamenaném syntetickém výstupu; nepublikováno do npm

seg-d5278e683d37 = OpenCPN přes NMEA v režimu brány po TCP

seg-a876f5d43e39 = dodáno a testováno (přehrání na straně příjemce); samotné uživatelské rozhraní OpenCPN žádný test neovládá

seg-4a6d2f45b403 = Nativní plugin OpenCPN s panelem skóre

seg-b0d4d32612e9 = sestaveno, logika jednotkově testována a spuštěna uvnitř OpenCPN { "5.8.4" } pod virtuálním displejem (důkazy v <c1/>); nebalíčkováno pro správce pluginů; bude dodáno až po revizi

seg-2e0058b5e057 = Referenční sestava

seg-959d93e3a56d = díly, kroky pro OS, jednotky systemd (zkontrolováno nanečisto), možnost kontejneru; netestováno na plavidle

seg-8524cb32f0a3 = Vše čte jedinou věc: výstup <c1/> (řádky JSON, věta <c2/>, brána). Formáty přenosu jsou v <a1><c3/></a1>. Plugin Signal K drží svou znalost o nich v jediném souboru, <c4/>; změna formátu je úprava jednoho souboru.

seg-e5b08ab63d78 = Žádné závislosti npm. Samotný plugin běží na Node { "18" } nebo novějším; současná vydání <c1/> vyžadují Node { "22" } nebo novější, takže v praxi použijte { "22" }. Zkopírujte nebo odkazem připojte <c2/> do adresáře <c3/> serveru (například <c4/>), restartujte server a zapněte <b>Kshana GNSS trust</b> v části Server, Plugin Config.

seg-fd80525d7dd1 = Odkud epochy pocházejí (<c1/>)

seg-013478c9a701 = Co plugin dělá

seg-abbd00e9cacf = <c1/> (výchozí)

seg-8ca5f95ed09d = Spouští <c1/> a každou surovou větu NMEA { "0183" }, kterou server přijme (událost <c2/> serveru), zapisuje na jeho standardní vstup. Pokud skončí, restartuje jej s prodlevou | <b>Používejte jej pouze na serveru s jediným zdrojem NMEA</b>: předává každou větu od každého poskytovatele, promíchaně, takže druhý přijímač GNSS nebo AIS vypadá jako jeden přijímač, jehož poloha skáče, a může být ohodnocen jako spoofing. Při více než jednom zdroji použijte <c3/> s vlastním proudem <c4/> daného přijímače nebo <c5/> z brány.

seg-3b3eadcffb90 = Spouští <c1/>, například <c2/> nebo <c3/>

seg-d69b5ebe1042 = Připojí se k proudu řádků JSON, které zapisuje <c1/> (například z relay v <c2/>)

seg-cd5a419844cc = Připojí se k proudu NMEA (například k výstupu brány služby nebo kontejneru v referenční sestavě, port { "10110" }) a čte pouze jeho věty <c1/>

seg-f17c9b7d7abc = Proud, který je již podvržen v okamžiku, kdy se monitor poprvé připojí, nemá čistý základ (prvních <c1/> sekund se nikdy nehodnotí). Spusťte jej před plavbou.

seg-33fc47100aa6 = Zveřejněné cesty

seg-f032afe8b331 = Každá epocha aktualizuje (zdroj <c1/>):

seg-b809eaf502ad = Cesta

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> nebo <c4/>

seg-d4d4d5d5ec1f = { "0" } až { "100" } nebo <c1/> během kalibrace

seg-5280497b5d9f = <c1/>, od největšího: které kontroly skóre snížily

seg-6089a3166c91 = monitory, které jsou aktuálně nad svým prahem

seg-55280b62eb19 = <c1/>, <c2/> nebo <c3/> (když brána běží jinde; <c4/> z <c5/>, pokud chybí)

seg-963da9c0d2a3 = <c1/>: poloha, kterou testovaný přijímač v dané epoše hlásil (schéma JSON { "1.1" } nebo novější; nezveřejňuje se, pokud ji proud neobsahuje, například z <c2/> nebo starší verze <c3/>). <b>Pouze kontext důvěry</b>: plugin nikdy nezapisuje <c4/>, takže cesta vlastní polohy plavidla zůstává nedotčena

seg-50599cef740d = vyvolá se při změně stavu: <c1/>

seg-ad58b4599f78 = Plugin také jednou při startu odešle metadata Signal K pro tyto cesty. <c1/> je skóre důvěryhodnosti { -brand } od { "0" } do { "100" }, skóre, nikoli poměr ani pravděpodobnost, takže nemá jednotku SI; jeho metadata uvádějí rozsah, popis a zóny, které sledují prahy níže. <c2/> jsou body skóre odečtené z tohoto skóre od { "0" } do { "100" }.

seg-bf0c90f5c02a = Oznámení je <c1/>, <c2/>, <c3/> nebo <c4/>. Zruší se zveřejněním stavu <c5/>, nikoli <c6/>: příjemce, který za zrušené považuje pouze <c7/>, by měl za zrušené považovat i <c8/>. Ve výchozím nastavení dává pásmo <b>degraded</b> hodnotu <c9/> a pásmo <b>untrusted</b> hodnotu <c10/>, s <c11/>. Sníží se po <c12/> epochách v lepším stavu. Pokud po dobu <c13/> sekund nepřijde žádná epocha, varuje, že skóre se neaktualizuje. Kalibrace nikdy oznámení nevyvolá. Zdroj <c14/> neobsahuje seznam <c15/> (věta nese pouze pásmo, skóre a dva hlavní důvody).

seg-89cdf02b58e3 = Konfigurace (každý práh)

seg-d7bdd78470ec = spustitelný soubor (režimy spawn). <b>Spouští libovolný spustitelný soubor jako uživatel serveru</b>: konfiguraci pluginu by měl moci měnit pouze správce serveru Signal K

seg-73091c431bcf = meze plavidla, prahy a váhy skóre (režimy spawn)

seg-f5f08c50abc7 = argumenty přidané k <c1/> v obou režimech spawn: vstup pro <c2/>, další přepínače, například <c3/> (uložený záznam přiváděný rychleji než v reálném čase) pro <c4/>. Plugin odmítá <c5/>, <c6/>, <c7/> a <c8/> (čte JSON z <c9/> na standardním výstupu) a pro <c10/> také vstupní přepínače (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

seg-01caf7ed213f = Režimy TCP (brána slouží na { "10110" }: port nastavte pro <c1/>)

seg-72b911dea6bd = <c1/>: pásmo, které { -brand } hlásí, s hranicemi v souboru relace. <c2/>: dvě skóre níže

seg-76ca56821979 = režim <c1/>: pod touto hodnotou je stav <c2/> (výchozí hranice { -brand } pro nominal)

seg-429d8fc4570f = režim <c1/>: pod touto hodnotou je stav <c2/> (výchozí hranice { -brand } pro degraded)

seg-6d5c9e402211 = stav pro pásmo degraded: <c1/>, <c2/> nebo <c3/>

seg-e88a2979ef07 = po sobě jdoucí epochy v horším stavu, než se oznámení vyvolá

seg-0eec67224385 = po sobě jdoucí epochy v lepším stavu, než se oznámení sníží

seg-76b52e312539 = varovat, pokud po tuto dobu nepřijde žádná epocha; <c1/> to vypne

seg-87d3fcf7fec9 = způsoby oznámení

seg-9a455cf4a2f9 = Plugin nefunguje jako brána: nikdy fix nezmění. Označení fixu za neplatný pro kartografický systém je brána, níže.

seg-30f48b177c1c = <c1/>, žádné závislosti, žádná síť kromě <c2/>. Testy zpracují a přehrají 66epochový výřez řádků JSON a vět <c3/>, které <c4/> zapsal pro syntetickou baltskou ukázku (vymyšlená data, pouze text), a kontrolují shodu obou formátů, chování držení a zrušení, režim skóre, zastarání a tři vstupní cesty proti místnímu proudu a zástupnému podřízenému procesu. Tyto testy nespouštějí skutečný server Signal K; to dělá samostatný skriptovaný běh, viz níže.

seg-024928983177 = Běh ve skutečném serveru Signal K

seg-80b5a217d13c = <c1/> obsahuje skript, který načte plugin do připnutého balíčku <c2/> { "2.33.0" } (v soukromém jmenném prostoru sítě pouze se smyčkou loopback) a zaznamená, co ukazují vlastní rozhraní REST a WebSocket serveru. Cesty důvěry se objeví, oznámení přejde na warn, alarm, normal (po držení) a znovu na warn, když data přestanou přicházet, a se skutečným <c3/>, krmeným vlastním vstupem NMEA serveru, zveřejnil také <c4/>, nikdy <c5/>. Jedna verze serveru, jeden běh, žádné skutečné plavidlo; omezení a postup reprodukce jsou v README s důkazy.

seg-fea2e7d140c3 = OpenCPN čte NMEA ze sítě a <c1/> dokáže filtrovaný proud sám nabízet na portu TCP.

seg-92981e13bc6f = Doporučeno: přímé připojení.

seg-e6caa4d53b9a = (<c1/> je sériový port přijímače čtený pomocí <c2/> a <c3/>, multiplexor, nebo vstupy <c4/>/<c5/> samotného <c6/>; <c7/> z referenční sestavy to dělá pod systemd.) <c8/> se naváže na adresu loopback; může se připojit libovolný počet klientů pouze pro čtení a klient, který nestíhá, je odpojen bez zdržení ostatních.

seg-311e4379acf1 = Alternativa: relay.

seg-11b4c4791f55 = <c1/> je rozdvojovač v Node bez závislostí, který totéž dělá pro <c2/> bez <c3/> nebo nabízí jakýkoli jiný proud řádků (možnost kontejneru jej používá pro epochy JSON):

seg-93cb82966313 = Předává bajty beze změny, pouze celé řádky, a odpojí klienta, který nečte. Dávejte přednost přímému připojení: o jeden proces méně v řetězci.

seg-4226afc6175c = V OpenCPN: Options, Connections, Add Connection, <b>Network</b>, protokol <b>TCP</b>, adresa <c1/>, port <c2/>, směr <b>Input</b>. Dokud důvěra nezkolabovala, je proud vlastním proudem přijímače plus jedna věta <c3/> na cyklus. Po zkolabování má předávaná GGA kvalitu <c4/>, RMC stav <c5/> a indikátory režimu hlásí žádný fix, s přepočítanými kontrolními součty: zařízení vidí, že přijímač sám prohlašuje fix za neplatný, a spustí vlastní alarm. Věty <c6/> jsou vidět v ladicím okně NMEA v OpenCPN (Options, Connections, „NMEA debug window“). Pole polohy zůstávají tak, jak byla přijata.

seg-8549d49f1b2c = Než se na to spolehnete, přečtěte si „Gate mode“ v <a1><c1/></a1>: je volitelný, přidává latenci (cyklus se drží, dokud není jeho epocha ohodnocena), je jediným bodem v řetězci a může zadržet dobrý fix stejně jako propustit padělaný.

seg-533a911141d6 = <c1/> přehrává zaznamenaný výřez syntetického filtrovaného proudu ({ "186" } vět kolem okamžiku, kdy důvěra zkolabuje, zapsaných příkazem <c2/>) skrz relay po skutečném socketu TCP a kontroluje, co příjemce dostane: proud bajt po bajtu při libovolném dělení na části; platné kontrolní součty u každé věty, včetně přepsaných; shodu GGA a RMC, platné a poté neplatné bez blikání; jednu větu <c3/> na cyklus s polem brány <c4/> přesně tam, kde je fix neplatný; dva příjemce shodné; částečný řádek nikdy nepředaný. Kontroluje se proud, který OpenCPN dostane, nikoli vlastní obrazovka OpenCPN.

seg-12fc91a3f69b = Kontrola od začátku do konce se skutečným binárním souborem, není součástí výchozích testů (vyžaduje sestavený <c1/>):

seg-fea419a50c52 = Oba spouštějí hodinovou syntetickou ukázku a kontrolují, že fix je nejprve platný, poté neplatný, s větou <c1/> na epochu.

seg-e76c11d8f003 = Nativní plugin

seg-7a5ac2d2f229 = <c1/> je panel skóre pro OpenCPN (skóre, pásmo, brána, hlavní důvody, upozornění, když se důvěra změní na untrusted), který čte <c2/> z vlastního proudu NMEA OpenCPN, takže nepotřebuje žádné jiné připojení než výše uvedené. Sestavuje se pomocí CMake proti hlavičce API pluginů OpenCPN (přibalené, s commitem zdroje) a wxWidgets; <c3/> spouští testy logiky bez wx a kontroluje, že knihovna exportuje vstupní body, které OpenCPN vyhledává. Byl spuštěn uvnitř OpenCPN { "5.8.4" } pod virtuálním displejem na syntetickém filtrovaném proudu (OpenCPN předal <c4/> pluginu, panel zčervenal a vlastní poloha OpenCPN zamrzla, když se brána zapnula; snímky obrazovky, log a skript v <c5/>), ale ne na skutečné pracovní ploše, jiných verzích ani platformách a není balíčkován pro správce pluginů OpenCPN. Viz <a1><c6/></a1> pluginu. Je licencován GPL-3.0-or-later, na rozdíl od zbytku repozitáře (<a2><c7/></a2>).

seg-a2adfa7ff5fb = Snímky obrazovky z toho běhu, v <c1/> (jeden běh, OpenCPN { "5.8.4" } pod virtuálním displejem, syntetická data; omezení uvádí <a1><c2/></a1>):

seg-ee5e8bb5a734 = Okno mapy OpenCPN s pluginem panelu skóre Kshana na syntetickém filtrovaném proudu před kolapsem důvěry: žádný panel není otevřen (otevře se sám při alarmu), poloha lodi ve stavovém řádku je { "54" } { "32.4659" } N { "018" } { "46.1670" } E s rychlostí { "16.48" } kn a kurzem { "088" } a indikátor fixu vpravo nahoře ukazuje tři čárky.

seg-1189d82affbb = Totéž okno OpenCPN po kolapsu: panel Kshana je otevřen červeně se skóre { "47" } a slovem UNTRUSTED, řádky gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 a stáří { "2" } s a prohlášení, že jde o software pouze poradního charakteru, nikoli typově schválené navigační zařízení, a že odpovědný zůstává provozovatel. Stavový řádek stále ukazuje { "54" } { "32.4672" } N { "018" } { "46.2227" } E a indikátor fixu klesl na dvě čárky.

seg-90c7cdee8892 = OpenCPN krmený přímo příkazem kshana receiver-trust live --gate --listen: panel Kshana je otevřen červeně se skóre { "44" } a UNTRUSTED, řádky gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 a stáří { "1" } s a prohlášení o poradním charakteru. Tento běh pozorování zamrznutí polohy nepodporuje: OpenCPN stále zpracovával úvodní dávku epoch.

seg-dce06383cde1 = Ukazují vedení potrubí a filtrovaný fix, který se dostává do OpenCPN, nikoli že by jakýkoli alarm byl včasný nebo správný pro skutečné plavidlo. Software pouze poradního charakteru, nikoli typově schválené zařízení.

seg-f9f39d089438 = <a1><c1/></a1>: obecný seznam dílů, nastavení OS, dvě jednotky systemd (poradní monitor a volitelná brána), možnost kontejneru a zapojení Signal K. <c2/> spouští <c3/> na jednotkách, aniž cokoli spustí.

seg-5e2a2e8af941 = Skóre je tak dobré, jako kontroly, které za ním stojí a které sledují fyziku lodi a její další senzory; sebekonzistentní padělek se souhlasnými hodinami monitory pouze s NMEA nevidí (<a1><c1/></a1>). Nepřítomnost alarmu není důkazem dobrého fixu.

seg-be1ed291f7c3 = Žádná hodnota na této stránce není změřená míra detekce ani falešných poplachů. Výše uvedené testy kontrolují vedení potrubí na syntetickém textu; nic nevypovídají o tom, jak si jakýkoli monitor vede proti skutečné interferenci.

seg-97d775b504c6 = Nejde o typově schválené zařízení; odpovědný zůstává provozovatel.

seg-69222f7d5068 = <s1>Předchozí</s1>Mapa interference: zdroje dat a licence

seg-8eba9835d7df = <s1>Další</s1>Geometrie oblohy a skylines

seg-2093a1d8a24e = Odkud epochy pocházejí (source)
