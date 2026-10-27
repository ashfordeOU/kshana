# docs--trust-telemetry: translations (cs)

seg-2247a2344710 = Význam

seg-d4e48c972084 = Štítky

seg-ca448daf5ec7 = nominal

seg-a129b9e613d0 = Typ

seg-2672b7f55371 = zhoršené

seg-c711c7fecbfc = Jeden výsledek důvěry ve třech exportních formátech, ze skutečných běhů enginu v{ $version } (`kshana trust-telemetry`) na examples/maritime-trust: textová expozice Prometheus (poslední skóre důvěryhodnosti je { "5.9" } a nastaveno je pásmo nedůvěryhodné) a poslední zprávy CEF a LEEF. Příkaz nic nepublikuje, pokud nedostane cíl, nedrží žádné přihlašovací údaje a nevysílá žádný rádiový signál. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel.

seg-15fcf05d16c5 = Zdroj: <c1/>

seg-05919ac6cf31 = Důvěra v GNSS jako bezpečnostní telemetrie

seg-8978c6508ebd = <c1/> převádí proud důvěry v GNSS po epochách (skóre 0–100, pásmo, důvody) na signály, které operační nebo bezpečnostní centrum již přijímá: metriky Prometheus, události syslog ve formátu CEF nebo LEEF pro SIEM a volitelně OpenTelemetry. Proud čte; nikdy nemění hodnocení důvěry a nevysílá nic než telemetrii.

seg-14ad6b7911d6 = Vstupem je živé schéma JSON-lines v1.1 popsané v <c1/>. Čte se: <c2/>; <c3/> (<c4/>, pásmo); <c5/> (0–100 nebo null); <c6/> (čas epochy, jak je uveden); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> nebo null); důvody jsou monitory v <c13/>, poté další v <c14/>; od schématu { "1.3" } <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) a <c20/> každého odvození. Ostatní klíče se ignorují, protože schéma roste jen přidanými klíči. Řádek, který se nepodaří zpracovat, se započte do <c21/> a přeskočí; skóre mimo 0–100 se odmítají, nikoli ořezávají, aby si změny formátu někdo všiml. Jediný kód, který tento formát zná, je <c22/>.

seg-2c94f3717f82 = <c1/> se poskytuje bez autentizace a ve výchozím nastavení naslouchá na <c2/>. Navázání na jinou adresu vypíše varování; zajistěte jej vlastní kontrolou přístupu. Koncový bod obsluhuje vždy jedno spojení s limitem čtení { "2" } s, takže nečinný klient může zpozdit stažení metrik až o tuto dobu; je určen pro jeden scraper, nikoli pro otevřenou síť.

seg-7e66e43f15a8 = Zařízení Home Assistant a NTP (MQTT)

seg-fbe56ff7f1ed = <c1/> vypíše a <c2/> publikuje stavový dokument JSON a objevovací zprávy Home Assistant MQTT. Objevování (retained, pod <c3/>) vytvoří tři entity: skóre důvěryhodnosti, pásmo důvěryhodnosti (důvody jako atributy) a senzor problému <c4/>. Stavový dokument jde na <c5/> (výchozí <c6/>, retained): <c7/>, <c8/> (null, dokud žádné není), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> a poradní prohlášení; poloha není nikdy zahrnuta. Volby: <c14/>, <c15/>, <c16/>.

seg-252025356c0e = Publisher mluví MQTT { "3.1.1" } s QoS { "0" } a čte pouze CONNACK od brokeru. Nemá přihlašovací údaje ani TLS, proto použijte broker v místní síti (nebo místní relay, který je doplní). Doručování běží ve vlastním vlákně za frontou o velikosti { "1024" }: nedostupný broker způsobí zahazování zpráv, které se počítají a na konci hlásí, a nikdy nezablokuje proud. NTP zařízení nebo jakýkoli jiný konzument, který chce prostý JSON, může číst stejný stavový řádek. Na přijímač ani na hodiny se nic nezapisuje. Python, WebAssembly a MCP přijímají <c1/> a vracejí stejné řádky <c2/> (nic se tam nepublikuje).

seg-ed95ebb0ba1b = Z Pythonu, WebAssembly a MCP

seg-93be007cdfda = Kodéry jsou dostupné také jako volání typu text na vstupu, text na výstupu, bez procesu, soketu či hodin: Python <c1/>, export WebAssembly <c2/> a nástroj MCP <c3/> (příkaz pluginu <c4/>). <c5/> je <c6/>, <c7/>, <c8/> nebo <c9/>; <c10/> je <c11/> (proud) nebo <c12/> (dávkový výsledek). Vracejí stejný text, jaký vypisuje příkazový řádek (<c13/>, <c14/>), se stejnými omezeními: řádky syslogu nenesou časové razítko, <c15/> má nejvýše { "255" } tisknutelných znaků ASCII bez mezer (jinak je odmítnuto, zde i na příkazovém řádku) a odpověď větší než limit dané plochy ({ "4" } MiB u MCP) je odmítnuta, protože CEF a LEEF s <c16/> zapisují jednu událost na epochu. Nic se neodesílá, neposkytuje ani nezapisuje; běžící exportéry zůstávají procesem na příkazovém řádku.

seg-f8c367611a9e = Doručování nikdy nezablokuje posouzení

seg-3853bb63c7ad = Doručování syslogu a OpenTelemetry běží ve vlastních vláknech. Vstupní smyčka jim pouze předá zprávu nebo snímek a nikdy nečeká, takže nedostupný, pomalý nebo nečtoucí kolektor nemůže zpětným tlakem zahltit živý proud ani zmrazit <c1/>:

seg-589d02c31dfe = každé připojení a každý zápis mají limit { "2" } s; neúspěšné spojení se zahodí a znovu naváže líně, s exponenciálním prodlužováním prodlevy od { "1" } s do { "60" } s;

seg-3c272ded25a3 = zpráva, kterou nelze doručit (kolektor nedostupný, vypršel časový limit zápisu, fronta o velikosti { "1024" } plná), se zahodí a započítá do <c1/>; na její četnost nastavte upozornění;

seg-4a7cd2065731 = exportéru OpenTelemetry se předá kopie registru, takže během síťového vstupu a výstupu není držen žádný zámek; pokud export ještě probíhá, nový snímek se přeskočí (další nese stejné kumulativní součty).

seg-57c3bbe405c8 = Na konci vstupu dostanou odesílací vlákna zbývající čas z jejich limitů na dokončení.

seg-14c13ed8c509 = Metriky Prometheus

seg-d060b2163513 = Metrika

seg-45c41bf74eb8 = gauge

seg-e43a6814d13c = konstanta { "1" }

seg-3662d2b8a789 = poslední skóre 0-100; chybí, pokud zdroj žádné neuvádí

seg-1c50874472fc = { "1" } pro aktuální pásmo, { "0" } pro ostatní

seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } pro aktuální stav, { "0" } pro ostatní; chybí bez brány

seg-3e01cab63c59 = poloha hlášená přijímačem; <b>pouze s <c1/></b> (koncový bod je bez autentizace a poloha může identifikovat místo nebo plavidlo)

seg-280a5ca2e5d9 = { "1" }, pokud byl přítomen v poslední epoše

seg-22ded4fe7f29 = čítač

seg-800b23c30e2f = přijaté epochy

seg-be11849d8a9b = epochy, v nichž byl důvod přítomen

seg-0475fe7b26ba = nezpracovatelné vstupní řádky

seg-65f1db183cbc = výskyty důvodů sloučené do <c1/> (viz níže)

seg-e756633e7d5c = nedoručené události syslogu

seg-2de3258f83ee = odstup poslední epochy od začátku proudu

seg-c02fe207663e = čas přijetí podle nástěnných hodin; na jeho stáří nastavte upozornění

seg-67d5bbbde75a = geometrie družic v poslední epoše, <c1/>, <c2/>, <c3/>: { "1" } pro aktuální <em>(vstupy schématu { "1.3" })</em>

seg-4878afc243e3 = { "1" } zhoršená, { "0" } dobrá; chybí, pokud je geometrie neznámá

seg-c21f54522128 = { "1" }, když družice v dohledu nejsou sledovány, zatímco jejich geometrie je dobrá (ztratil se signál, nikoli obloha; <c1/> stále ukazuje { "1" }), jinak { "0" }; chybí, pokud je geometrie neznámá nebo to vstup neuvádí

seg-db29584bb51c = HDOP, PDOP a použité družice v poslední epoše; každá hodnota chybí, pokud žádná není

seg-c60ca4530e92 = epochy podle stavu geometrie

seg-fd6bf7764eca = štítek geometrie v poslední epoše, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } pro aktuální; nikdy se nehodnotí (skóre strhává body pouze za <c5/>); ze vstupů, které štítek nesou ({ "0.36" })

seg-d6f04ef7adfb = VDOP v poslední epoše; chybí, pokud žádný není

seg-cb8feee01192 = <b>Štítek geometrie je hlavní ukazatel.</b> Vytvářejte grafy a upozornění nad <c1/> (OTLP <c2/>, CEF třetí pole <c3/>, LEEF <c4/>): <c5/> je jediný štítek, za který skóre strhává body. Stav geometrie je popisný: <c6/> zahrnuje informativní případ <c7/>, který může přicházet s dobrým nebo přijatelným DOP, proto nevyvolávejte poplach pouze podle <c8/>.

seg-70343708da03 = Od vstupů schématu { "1.3" } nese <c1/> také štítek <c2/> (<c3/>, <c4/>, <c5/>) u každého důvodu, který jej měl: třídu odečtu v poslední epoše. Řady geometrie následují po všech ostatních a jen tehdy, když vstupní epocha nese <c6/> (živé schéma { "1.3" }, výsledek z enginu { "0.36" } nebo novějšího), takže proud nebo výsledek { "0.35" } se vykreslí bajt po bajtu jako dříve. Hodnoty štítků jsou pevné množiny (neznámý stav se zapíše jako <c7/>; neznámá třída se zahodí). Upozornění nastavte na <c8/>, nikoli pouze na pásmo, aby špatná obloha nevyvolala poplach jako útok; třída <c9/> je výpověď o obloze, nikoli zjištění, že k útoku nedošlo (viz <c10/>).

seg-3f45b21003d5 = Štítek <c1/> je součástí identity řady: když se třída důvodu mezi epochami změní (<c2/> z <c3/> na <c4/>, pokud byly ztracené družice nízko, nebo <c5/> na <c6/>, pokud uvedený HDOP nesouhlasí s uvedenou oblohou), stará řada se přestane exportovat a začne nová. Pokud na třídě nezáleží, dotazujte se podle <c7/> pomocí <c8/> a počítejte s tím, že takový přechod vypadá jako konec jedné řady a začátek jiné. Řady schématu { "1.3" }, štítek <c9/> a pole geometrie CEF/LEEF kontrolují vlastní testy enginu a orákula CEF (pycef, Logstash); externí orákula Prometheus a OTLP zatím proud { "1.3" } nemají.

seg-17ca55cea260 = Názvy důvodů se zkracují na { "128" } znaků a nejvýše { "64" } různých důvodů dostane vlastní řadu; další se počítají pod <c1/> a v <c2/>, takže nepřátelský nebo chybný vstup nemůže vytvořit neomezenou kardinalitu štítků.

seg-35f3faf39d1c = <c1/> je jedno z <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Názvy důvodů jsou názvy monitorů proudu (<c7/>, <c8/>, ...; u dávkového výsledku <c9/>, <c10/>, <c11/>).

seg-a726fc8d28c2 = Ukázkový dashboard je v <c1/> (importujte jej a zvolte svůj zdroj dat Prometheus).

seg-208f33eda580 = Syslog: CEF a LEEF

seg-0d53db66a990 = Události se odesílají v obálce RFC { "5424" } (facility local0, aplikace <c1/>, id zprávy <c2/>) přes UDP (jeden datagram na událost; IPv4 nebo IPv6) nebo TCP, ve výchozím stavu zakončené novým řádkem, nebo s <c3/> orámované jako <c4/> podle RFC { "6587" }. Ve výchozím stavu se odešle jedna událost při každé změně pásma; <c5/> odešle jednu za epochu. Dodavatel se zapisuje <c6/> (ASCII), aby jej žádný SIEM chybně nedekódoval.

seg-9cb6e1b9fec0 = Pojem

seg-9e4ce52ac5d9 = Závažnost syslogu

seg-084d2e726d3f = Závažnost CEF

seg-60fa1c602748 = LEEF <c1/>

seg-7948fbcf87cb = kalibrace

seg-453691777f9d = { "6" } info

seg-2ac57280bf6a = { "4" } varování

seg-f757a767bd4a = nedůvěryhodné

seg-8e4e2d9142f9 = { "2" } kritické

seg-4c5b832482cb = neznámé

seg-5e4f3b0222cd = { "5" } oznámení

seg-b07ec4ccabf7 = Mapování polí (id události je <c1/>):

seg-bfad2619553e = CEF

seg-62108c4b1d75 = LEEF { "2.0" } (oddělovač <c1/>)

seg-18a4ca402cd9 = kategorie

seg-d3bc36a445cb = odesílající hostitel

seg-521cea5013c8 = pásmo

seg-2b9153eb068d = <c1/> (štítek <c2/>)

seg-f1be6ef87011 = důvody oddělené čárkami

seg-e77a9847bc7b = předchozí pásmo

seg-87b7f1652b0c = skóre

seg-470a89a86d79 = <c1/> (<c2/>), vynechává se, pokud žádné není

seg-fc2aebb988bf = odstup epochy, s

seg-9f9d0d551742 = štítek času záznamu

seg-57ed10b00272 = stav brány

seg-7159f151c079 = stav geometrie, poté <c1/> a třídy odečtů epochy oddělené čárkami (například <c2/>) <em>(vstupy { "1.3" })</em>; ze vstupů, které štítek nesou ({ "0.36" }), třetí pole, <c3/> a štítek, přičemž pole tříd je pak vždy přítomno (například <c4/>, <c5/>)

seg-973339622a60 = <c1/> (pouze stav), <c2/> (třídy) a <c3/> (štítek)

seg-ae3a1d06bddf = HDOP

seg-c431625778a6 = PDOP

seg-e10eccec5f94 = ({ "0.36" }, se štítkem)

seg-e0a712018ced = VDOP <em>({ "0.36" }, se štítkem)</em>

seg-42273c09a591 = není neseno: čtyři vlastní pole s plovoucí řádovou čárkou jsou obsazena

seg-292efe9557d6 = použité družice <em>({ "0.36" }, se štítkem)</em>

seg-179b75fd8f06 = <c1/> (<c2/>), celé číslo

seg-f69551c20173 = ztráta signálu: družice v dohledu nejsou sledovány, zatímco jejich geometrie je dobrá

seg-bb927aab7541 = není neseno jako pole (žádný klíč slovníku CEF pro něj není volný): stav se zapíše jako <c1/> a třída odečtu geometrie jako <c2/> v <c3/>

seg-6a80d53b2163 = <c1/>, pouze po dobu, kdy platí

seg-1f099d4ef4b6 = V CEF používá geometrie pouze vlastní pole ze slovníku (žádné vymyšlené klíče); štítek putuje v <c1/> a ne v <c2/>, protože kodek CEF v Logstash pole <c3/> nemapuje. Události geometrie { "1.3" }, včetně případů se štítkem, jsou součástí řádku CEF s VALIDATED: oba parsery orákula je načtou zpět tak, jak byly zapsány (<c4/>, dodatky { "4" } a { "5" }, každý zaregistrovaný dříve, než byl kterýkoli parser na jeho případech spuštěn). Pole štítku, VDOP a počtu družic se připojují za všechna dřívější pole a řady, a to jen u vstupů, které štítek nesou, takže vstup bez něj se vykreslí přesně jako dříve.

seg-b295bf5bac3e = Prázdná pole se vynechávají (bez důvodů žádné <c1/>). Název hostitele se zkracuje na { "255" } znaků. Hlavičkové hodnoty CEF escapují <c2/> a <c3/>; hodnoty rozšíření escapují <c4/>, <c5/> a zalomení řádků. V hodnotách LEEF se <c6/> a zalomení řádků nahrazují mezerami.

seg-a3b77e9593eb = OpenTelemetry (ve výchozím stavu vypnuto)

seg-396c34d29783 = Sestavte s <c1/> a předejte <c2/>. Exportér odesílá OTLP/HTTP JSON (<c3/>, <c4/>, <c5/>, <c6/>, a pro vstupy schématu { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> a ze vstupů, které štítek nesou ({ "0.36" }), <c13/> (atribut <c14/>) a <c15/>; kumulativní součty nesou <c16/>) každých <c17/> epoch (výchozí { "10" }) a na konci vstupu. Nepřidává žádnou závislost a nemá TLS: posílejte na kolektor na stejném hostiteli nebo v důvěryhodném segmentu, který data předává dále přes TLS. Koncové body <c18/> jsou odmítnuty.

seg-c3111d73a8b0 = <s1>Předchozí</s1>Geometrie oblohy a skyliny

seg-4c539b667a05 = <s1>Další</s1>Ověření Galileo OSNMA
