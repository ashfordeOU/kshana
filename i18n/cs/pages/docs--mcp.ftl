# docs--mcp: translations (cs)

seg-261c059bec54 = Pouze poradní charakter, nikoli typově schválené navigační zařízení: za navigaci zůstává odpovědný provozovatel. Server běží na vašem počítači; Ashforde OÜ se nic neodesílá.

seg-13641146503d = Cursor (jedno kliknutí)

seg-3bd13fe295f4 = VS Code (jedno kliknutí)

seg-fea7b394cdde = npx

seg-76fcc8024f2f = uvx / pipx

seg-deb5187472d1 = Homebrew

seg-491167f2310c = Scoop

seg-5c425ea185ee = Předkompilovaná binárka

seg-d107bc8e1950 = Registr MCP

seg-842b77a21c5f = Kanál

seg-d6476863f862 = Schopnost

seg-fdbb9db68f1d = žádné

seg-1759a8cce7d6 = Druhy

seg-564133d6a0c4 = Konstelace kolem libovolného tělesa

seg-b88a2a9497c2 = Nástroj

seg-a683980168f7 = Docker

seg-f3a2279d6df7 = Příkaz nebo tlačítko

seg-20c5ae650eb7 = Vyžaduje

seg-af4d3ce85e11 = Připnutá podoba

seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

seg-b02bdf7c7661 = Node, nebo Docker

seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

seg-abf8b5fe685a = Node { "18" }+

seg-06299cefbf9e = Python { "3.9" }+ s uv nebo pipx

seg-26795c302f8a = brew

seg-ded975fa67fa = formule pro v{ $version }

seg-667d6dde705b = <c1/> a poté <c2/>

seg-f6e9fc5f46fe = Scoop (Windows)

seg-bc4762d20004 = manifest pro v{ $version }

seg-f7c0a2fbb0b5 = winget

seg-9e599ab3c0a3 = winget (Windows)

seg-091d1404bb8a = cargo

seg-145ddf98e77f = Rust { "1.88" }+

seg-b308519d4c8d = <a1>stránka vydání</a1>: <c1/> (Linux x86-64), <c2/>, ověřeno pomocí <c3/> a <c4/>

seg-c39cac69f700 = v{ $version }

seg-e8f5e2b6580b = <c1/> (nalezne ho klient podporující registr)

seg-b1a6e807f06f = klient podporující registr

seg-d5a3818ac3b6 = Vzdáleně (streamable HTTP)

seg-5f1397b1ea30 = váš vlastní hostitel

seg-e7acd0ff4c84 = Zdroj: <c1/>

seg-81a87d14efda = Kshana: značka, kompasový zaměřovací kříž označující přesný okamžik, vedle slovní značky kshana

seg-3d5232472e42 = kshana-mcp: zeptejte se svého asistenta s umělou inteligencí a odpoví engine

seg-ef90bf1e0b51 = <c1/> je server <a1>Model Context Protocol</a1> (MCP) pro <b>Kshana</b>, open-source simulátor odolnosti PNT (určování polohy, navigace a času). Umožňuje asistentovi s umělou inteligencí (AI) spustit skutečný engine a přečíst si jeho výstup ve formátu JSON (JavaScript Object Notation), místo aby matematiku odhadoval. Komunikuje přes stdio (standardní vstup a výstup) s libovolným klientem kompatibilním s MCP, včetně Cursoru a JetBrains AI Assistant / Junie.

seg-1fddef4e9a49 = Matematika, pro kterou je Kshana ověřena, je přesně tam, kde jazykový model odhaduje špatně: šíření oběžné dráhy podle SGP4 (Simplified General Perturbations { "4" }), referenční soustavy IAU (Mezinárodní astronomická unie), Allanovy odchylky, dostupnost GNSS (globální družicový navigační systém) a faktor DOP (zhoršení přesnosti), ochranné úrovně ARAIM (advanced receiver autonomous integrity monitoring), fúze GNSS a INS (inerciální navigační systém) a modely kvantových senzorů. Položíte otázku; asistent spustí skutečný scénář a získá ukazatele kvality s jejich původem a s označením VALIDATED nebo MODELLED.

seg-d51681f30e8f = Jeden otevřený engine uprostřed, server MCP jako jedno z jeho rozhraní vedle příkazové řádky, knihovny v Rustu, Pythonu, WebAssembly a Kshana Studia, obrazu Dockeru a pluginu pro JetBrains; každé rozhraní spouští tentýž engine a Kshana Pro na něm závisí, aniž by jej forkovala

seg-2a56e1f52830 = Nástroje

seg-b847694d91b5 = Spustí scénář z definice v TOML (Tom's Obvious, Minimal Language); vrátí shrnutí a úplný výsledek ve formátu JSON (JavaScript Object Notation: ukazatele kvality, křivky). Volitelný <c1/> vrátí graf jako SVG (Scalable Vector Graphics).

seg-3c00da00ec30 = Předběžná kontrola: zpracuje TOML a zjistí jeho druh, aniž by jej spustila.

seg-4516fd1e665c = Přibalené referenční scénáře ve formátu JSON: každý s <c1/>, svým <c2/> a jednou větou o tom, co ukazuje. Volitelný filtr <c3/>. Každý příklad běží tak, jak je, takže jde o nejrychlejší cestu k platnému TOML pro daný druh.

seg-61db4a94ad72 = Text TOML jednoho přibaleného referenčního scénáře, bajt po bajtu shodný se souborem v <c1/>.

seg-306f7a835bb9 = Spustí scénář a vrátí jeho zprávu: shrnutí pro vedení, vstupy, každou hodnotu s její jednotkou a s označením VALIDATED nebo MODELLED, události, použité schopnosti a záznam reprodukovatelnosti. <c1/> je <c2/> (výchozí) nebo <c3/> (tisknutelná stránka v jednom souboru).

seg-bdacef6d5133 = Spustí scénář a vrátí jeho časové řady jako animaci: <c1/> (výchozí), <c2/> (samostatný přehrávač) nebo <c3/> (nejvýše { "120" } v jedné odpovědi). První položka obsahu je shrnutí ve formátu JSON o tom, co bylo vykresleno; následují soubory. Druh bez vzorkované časové osy je odmítnut s uvedením důvodu.

seg-313f7594bd81 = Které interoperabilní formáty se na scénář vztahují (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), důvod, když se nevztahují, a specifikace, kterou každý zapisovač dodržuje. Scénář nespouští.

seg-e63b7853bb96 = Exportuje scénář jako CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemeridy STK (Systems Tool Kit) <c1/> nebo SigMF (Signal Metadata Format, pro scénář <c2/> s blokem <c3/>). První položka obsahu je index souborů ve formátu JSON (přípona, velikost, kódování a otisk SHA-256, 256bitový Secure Hash Algorithm); následují soubory, binární soubor vzorků SigMF jako base64.

seg-074e914789c5 = Zapíše trasu GeoJSON <c1/> do scénáře, který letí po trati z bodů (<c2/>, <c3/>, <c4/>, <c5/>), a vrátí nové TOML.

seg-ae58a8577aa7 = Exportuje konstelaci scénáře <c1/> jako přesné efemeridy SP3-c (Standard Product { "3" }, revize c).

seg-6a59aacf26bb = Exportuje elementy scénáře <c1/> jako katalog CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message).

seg-5562b319968b = Exportuje řadu stavů scénáře <c1/> jako efemeridy CCSDS OEM (Orbit Ephemeris Message) { "2.0" } — řadu polohy <em>i</em> rychlosti v TEME (true equator, mean equinox), kterou čtou nástroje letové dynamiky (GMAT, General Mission Analysis Tool; Orekit; STK, Systems Tool Kit); doplněk k nástroji <c2/>, který nese pouze polohu, o rychlost.

seg-b0cf13e530b7 = Spustí scénář a vrátí jeho tabulku reprodukovatelnosti jako CSV (hodnoty oddělené čárkou) — bajtově stabilní tabulku, kterou CLI (rozhraní příkazové řádky) zapisuje jako <c1/>. Pouze <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (jeho analýza <c7/> na modelu zprávy <c8/> nebo <c9/>) a <c10/> s nastavenými <c11/> + <c12/> ji vydají; jakýkoli jiný druh vrátí chybu, která tyto druhy jmenuje.

seg-ab242cd0259c = Geometrie oblohy pod horizontem závislým na azimutu: z místa, času a předvoleb konstelací, dvouřádkových sad elementů (<c1/>, šířených podle SGP4 do UTC <c2/>) nebo družic zadaných azimutem a elevací či v ECEF, viditelné družice a družice skryté za horizontem, GDOP/PDOP/HDOP/VDOP/TDOP z jádra DOP ověřeného proti gnss_lib_py, kofaktor a kovariance v soustavě východ-sever-nahoru (jedny hodiny na systém, nebo jedny společné) a elipsa horizontální chyby; s <c3/> místo <c4/> REPRESENTATIVE předvolba s uvedením původu a s řezem po každém stupni. MODELLED; nese poradní upozornění; žádné Monte Carlo přes MCP. Viz <a1><c5/></a1>.

seg-d6ed4e8d56e5 = Posoudí důvěryhodnost záznamu ze skutečného přijímače GNSS (globální družicový navigační systém). TOML uvádí <c1/> záznamu (<c2/>, <c3/>, <c4/>, <c5/> nebo <c6/>) a předává jeho bajty přímo jako <c7/> nebo <c8/>; nástroj spustí monitory důvěryhodnosti (pokles poměru nosné k hustotě šumu, ztráta zachycení, AGC (automatické řízení zesílení), indikátor rušení, skok polohy a, s RINEX spolu s vysílanou navigační zprávou, RAIM (autonomní monitorování integrity přijímačem) a monitor podporovaný hodinami) a vrátí, kdy a proč přestala být určená poloha důvěryhodná. Volitelné sekce <c9/> a <c10/> porovnávají uvedené události a předpovězené poklesy C/N0 s uvedenými tolerancemi. Tabulka <c11/> zvolí námořní monitory a přidá na každou epochu skóre důvěryhodnosti 0–100 s monitory, které skóre snížily (poradní; MODELLED). Záznam se předává přímo jako <c12/> nebo <c13/> (nejvýše { "4" } MiB). Na požádání graf a CSV po epochách. Viz <a1><c14/></a1>.

seg-d1a967a443ea = Ohodnotí omezený úryvek NMEA { "0183" } (nejvýše { "2" } MiB a { "20,000" } epoch; musí obsahovat kalibrační okno) tak, jak jej hodnotí <c1/>: stav důvěryhodnosti a skóre 0–100 pro každou epochu s monitory, které skóre snížily, shrnutí a poslední <c2/>. Omezená podoba živého příkazu: neotevírá se žádný socket a nic se nezapisuje na port; brána, <c3/> a exportéry telemetrie (Prometheus, OTLP, syslog) jsou pouze v příkazové řádce. Pouze poradní; MODELLED. Viz <a1><c4/></a1>.

seg-89e894d4b416 = Záznam NMEA { "0183" } plavidla (nejvýše { "4" } MiB) jako dávkový běh, s TOML relace uvádějícím limity plavidla: model skóre a skóre 0–100 každé epochy s jejími srážkami (odpověď si ponechává počty podle stavu a prvních { "200" } epoch ve stavu degraded nebo untrusted). Pouze poradní; MODELLED.

seg-27698c80b7f1 = Načte zveřejněný katalog testů a plán vysílání Jammertest (NPRA/jammertest-plan, MIT) jako plánovanou pravdu (<c1/>): sloty jedné testovací oblasti se stanou událostmi důvěryhodnosti přijímače s identifikátorem katalogu a rokem v každém popisku. Plánované sloty, nikoli zaznamenané časy vysílání; žádné kontaktní pole plánu se nečte. MODELLED. Viz <a1><c2/></a1>.

seg-23daf6121ca0 = Ohodnotí záznam přijímače vůči tomuto plánu (<c1/>): po jednotlivých testech latenci detekce, nezachycené poplachy a dobu do zotavení a falešné poplachy mimo všechny sloty. Textové záznamy jako <c2/>, binární (<c3/>, <c4/>) jako <c5/>. Podepsaný balíček vyžaduje klíč: příkazová řádka. Pouze poradní; MODELLED.

seg-0ca5b319e850 = Podepsaný balíček důkazů pro okno záznamu plavidla (<c1/>): surové bajty záznamu pro dané okno, konfigurace, výsledky a důvody po epochách, souhrnná stránka a manifest s každým SHA-256 a řetězcem hashů, podepsaný pomocí Ed25519. Podpisový seed se nikdy nevrací ani neloguje; bez něj se použije jednorázový klíč, takže balíček dokládá integritu, nikoli totožnost. Technický záznam, nikoli právní stanovisko. Viz <a1><c2/></a1>.

seg-8df4c6fb851d = Naváže na balíček časové razítko podle RFC { "3161" } (base64 bajtů <c1/>) v paměti (<c2/>); balíček s razítkem musí nadále projít ověřením. Podpis autority časových razítek se nekontroluje: použijte <c3/>.

seg-1f7a6f7f005a = Ověří balíček (<c1/>): každý hash, řetězec, podpis a s veřejným klíčem podepisujícího a úplným záznamem také to, kdo balíček podepsal a že výřez pochází z onoho záznamu. Jmenuje každé selhání a soubor. <c2/> je <c3/> (podepisující připnut), <c4/> (vše sedí, ale nebyl zadán veřejný klíč, takže podepisující není prokázán) nebo <c5/>; <c6/> odmítne balíček bez tokenu časového razítka.

seg-c43761e01f63 = Syntetické můstkové NMEA { "0183" } pro výcvik posádek z TOML <c1/> (rušení, odtažení polohy, podvržení času, zpoždění přehrávání) s instruktorským záznamem (<c2/>); deterministické pro daný seed. Pouze text: nic se nesyntetizuje na úrovni RF ani IQ a nic se nevysílá; nikdy pro živé navigační systémy plavidla. Odpověď obsahuje prvních { "2000" } řádků.

seg-8aec8f61dab2 = Mapa interference GNSS z hlášení polohy ADS-B nebo AIS jako text CSV (nejvýše { "4" } MiB): jeden GeoJSON <c1/> na den UTC, pouze agregáty (žádné identifikátory, buňky s méně než { "5" } různými letadly nebo plavidly se zadržují), s vloženou licencí datové sady. Degradovaná buňka neurčuje interferenci jako příčinu; nejde o předpověď. MODELLED. Viz <a1><c2/></a1>.

seg-d5959e4f1c96 = Pohyb vozidla a události scénáře pro laboratorní simulátor GNSS (<c1/>): CSV a JSON s pohybem, NMEA, trasové body a události jako text, nic se nezapisuje na disk. Druhy <c2/>, <c3/>, <c4/>. Žádný signál: nic z exportovaného není radiofrekvenčním ani základopásmovým signálem, nemodeluje jej ani jej neřídí; signály dodává simulátor a jeho obsluha. Viz <a1><c5/></a1>.

seg-1076916237f0 = Podepsaný laboratorní balíček okružní zkoušky (<c1/>): scénář, dokument <a1><c2/></a1> laboratoře, záznam přijímače a jeho vyhodnocení vůči uvedeným událostem, propojené hashem. Odmítne podmínky a hodnoticí události, které si odporují. Žádný signál; technický záznam, nikoli certifikace.

seg-9e1df2016cd7 = Přehraje jeden záznam IQ z pracovního adresáře přes několik návrhů sledovacích smyček (<c1/>): pro každý návrh a PRN ustálený jitter fáze a kódu, podíly zachycení a střední C/N0. Nejvýše { "256" } kanálů (návrh, PRN) na jedno volání; úsek se musí vejít do rozpočtu vzorků.

seg-a5af1743f993 = Spustí monitory detekce interference a spoofingu nad záznamem IQ z pracovního adresáře (<c1/>): monitory širokopásmového výkonu a spektra a monitory C/N0 a kvality signálu po družicích vůči naučenému základu. V odpovědi názvy a délky řad a až { "200" } událostí; celá zpráva na požádání jako soubory. Událost říká, že naměřená veličina opustila svůj základ, nikoli proč. MODELLED.

seg-c9c9c909c621 = Přizpůsobí model ztráty zachycení sledovací smyčky laboratorním během (<c1/>) ze scénáře <c2/>, jehož záznamy jsou předány přímo (<c3/> nebo <c4/>; <c5/> se odmítne). Žádný soubor nečte ani nezapisuje. MODELLED.

seg-4f231cd18d37 = Ověří soubor <c1/> předaný jako text a vrátí rozpoznané podmínky s jejich hashem. Pouze přímý vstup.

seg-2851f2858910 = Mapování na veřejné rámce vyplněné z dokumentů s výsledky předaných jako text (<c1/>): pro které řádky šesti rámců a norem odolnosti (rámec US DHS Resilient PNT v2.0, IMO lodě, EASA letectví, NIS2 článek { "21" }, EN { "16803" }, NIST IR 8323r1) běhy podporují důkazy a pro které ne, a mezera u každého řádku. Přijímá <c2/> položek <c3/> (nejvýše { "64" }, celkem { "4" } MiB). Stav říká, že běhy podporují důkazy pro schopnosti daného řádku; není to zjištění, že rámec je splněn, ani hodnocení či schválení jakéhokoli produktu. <c4/> se vrací s každou zprávou; zobrazte jej doslovně. MODELLED. Viz <a1><c5/></a1>.

seg-0a5161ddea94 = Statické mapovací tabulky (nebo s <c1/> zdrojové dokumenty, které citují, s verzemi a adresami URL) jako Markdown, uvozené týmž prohlášením. Nevyžaduje žádné běhy.

seg-ffcc6c72dc1e = Proud důvěryhodnosti (řádky JSON) nebo výsledek <c1/> vykreslený jako text Prometheus, řádky syslogu CEF či LEEF, datová zátěž OTLP JSON nebo řádky objevování a stavu Home Assistant MQTT, s kodéry <c2/>. Text v odpovědi: nic se neodesílá ani neposkytuje a nečtou se žádné hodiny. Pouze poradní.

seg-2b82a8a22298 = Parametry akcelerometru a gyroskopu scénářů <c1/> a <c2/> odhadnuté ze záznamu stacionární IMU (CSV nebo EuRoC) pomocí Allanovy odchylky, s tabulkou <c3/> připravenou k vložení a s SHA-256 záznamu (<c4/>). Text na vstupu, JSON na výstupu; MODELLED.

seg-30d5bb6b34cb = Balíčky norem (<c1/>): hodnocené sady scénářů pro testovací profily rámce DHS Resilient PNT (úrovně { "1" } až { "4" }), IMO MSC.1/Circ.1575 a ICAO Doc { "9849" } Příloha F.

seg-767a05e5df9f = Jeden běh balíčku proti prahům stanoveným před během (<c1/>): každý test <c2/>, <c3/> nebo <c4/>, s naměřenými a očekávanými hodnotami; zprávu předejte nástroji <c5/>, abyste viděli řádky. MODELLED; žádný produkt nehodnotí.

seg-74110e6b530f = Signál LunaNet Augmented Forward Signal ověřený podle LNIS V5 AD1 Volume A (LSIS-AFS V1.0, { "29" } leden { "2025" }): <c1/> (implementace proti vytištěným kódovým tabulkám a řešeným příkladům dokumentu), <c2/> (proud symbolů: synchronizační vzor, SB1, FID, kontinuita TOI) nebo <c3/> (testovací proud). LDPC a CRC-24Q podrámců { "2" } až { "4" } se neověřují; nezapisuje se žádný signál.

seg-b6abad1f2c9d = Podání kshana-bench ohodnocené proti souboru pravdy, obojí jako text JSON (<c1/>, <c2/>): soubor výsledků s verzí specifikace, rozdělením, hashi vstupů a metrikami úlohy. MODELLED; popisuje záznam nebo korpus, nikdy produkt.

seg-c7a0d7981bfd = Soubory výsledků kshana-bench vykreslené jako statická stránka žebříčku (text HTML), každý předem ověřen.

seg-1ec7117c7825 = Proud důvěryhodnosti (řádky JSON) nebo výsledek <c1/> vykreslený jako text Prometheus, řádky syslogu CEF či LEEF nebo datová zátěž OTLP JSON, s kodéry <c2/>. Text v odpovědi: nic se neodesílá ani neposkytuje a nečtou se žádné hodiny. Pouze poradní.

seg-0fc2e3928768 = Podíl délky trasy v degradovaných, nedegradovaných, neposouzených a nepozorovaných buňkách jedné či více map interference, volitelně v rozmezí dat. Nepozorované buňky nejsou důkazem volné trasy.

seg-62756ba18cf5 = Nastavení vrstvy GNSS IQ: názvy signálů, které nástroje IQ přijímají, zda jsou zapnuty nástroje pro soubory IQ, pracovní adresář a rozpočet vzorků na jedno volání. Zavolejte jej jako první.

seg-98939638409f = Popíše jeden záznam IQ (in-phase a quadrature) v pracovním adresáři bez jeho zpracování: formát, vzorkovací frekvenci, střední frekvenci, vzorky, délku, datové soubory a velikosti (<c1/>).

seg-c529b1a7ee53 = Vygeneruje vícedružicovou scénu GNSS IQ do pracovního adresáře (<c1/>): uvedené profily Doppler/C/N0 nebo skutečnou geometrii z vysílaných efemerid z navigačního souboru RINEX, s volitelným kanálem šíření na úrovni signálu. Odpoví seznamem zapsaných souborů a jejich velikostmi v bajtech a první epochou pravdy pro každou družici.

seg-0c6f5e26367f = Akvizice pomocí FFT (rychlá Fourierova transformace) jednoho či více PRN (pseudonáhodných kódů) nad záznamem (<c1/>), volitelně za stupni vstupní části: pro každý PRN zda byl zachycen, Doppler, fáze kódu, statistika píku a práh; <c2/> (jeden PRN) uchovává celý korelační povrch Doppler × fáze kódu s upřesněním jemného Doppleru.

seg-1da73ad326de = Akvizice a poté sledování bankou DLL/PLL/FLL (smyčky zachycení zpoždění, fáze a frekvence) (<c1/>), se smyčkami ze souboru TOML <c2/> v pracovním adresáři (<c3/>) nebo vestavěným návrhem a s volitelným opětovným zachycením (<c4/>): pro každý kanál epochy, konečný Doppler, konečné a střední C/N0, podíly zachycení fáze a kódu, zachyceno na konci, konečný stav zachycení, falešná zachycení a opětovná zachycení, plus název a hash návrhu. Sledování probíhá v omezené paměti; výstup po epochách jde pouze do souborů (<c5/>: E/P/L, diskriminátory, stavy smyček, C/N0, stav zachycení jako .csv/.jsonl/.bin; <c6/>).

seg-262bb9c592c0 = Použije na záznam DSP vstupní části přijímače a potlačení interference (digital signal processing: pásmová propust, pásmová zádrž, blanking, excize, AGC, kvantizér) a zapíše nový záznam (<c1/>).

seg-cf33e101b144 = Spustí kampaň laboratorního přehrávání (<c1/>): záznamy, každý se souborem podmínek testu uvádějícím laboratoří známou pravdu, × řetězce vstupní části × návrhy smyček. Každá buňka je hodnocena podle doby do ztráty zachycení, doby opětovného zachycení, zhoršení C/N0 vůči uvedenému J/S (vedle analytické reference označené MODELLED), míry falešných zachycení, jitteru PLL/DLL a dostupnosti. Přírůstkově a s možností pokračování: každé volání spustí čekající buňky, které se vejdou do rozpočtu vzorků (nebo <c2/>).

seg-8112428c6226 = Průběh výstupní složky kampaně: hotové a čekající buňky a po dokončení otisk. Pouze čte soubory.

seg-8bd76f017ae4 = Každý nástroj je tenký, věrný obal veřejné funkce knihovny <c1/> — žádná nová simulační logika zde není, takže agent spouští přesně ten ověřený engine.

seg-b37bbaf38900 = Nástroje GNSS IQ: soubory na vstupu, kompaktní JSON na výstupu

seg-ecf2ec0eb66d = Záznamy IQ dosahují gigabajtů, proto nástroje <c1/> nikdy nepředávají vzorky přes protokol. Řídí se jednou smlouvou:

seg-31a173dfe40d = <b>Pracovní adresář.</b> Server čte a zapisuje soubory IQ pouze uvnitř složky pojmenované v <c1/>. Každý argument s cestou je vůči ní relativní (absolutní cesta se musí vyhodnotit uvnitř ní); vstupy se před kontrolou převádějí přes symbolické odkazy, složka výstupu už musí uvnitř existovat a existující výstup se nahradí pouze s <c2/>. Pokud není nastaven, nástroje pro soubory IQ jsou vypnuté a uvedou, jak je zapnout; všechny ostatní nástroje to neovlivní.

seg-4f734b84a91a = <b>Rozpočet vzorků.</b> Jedno volání vygeneruje nebo zpracuje nejvýše <c1/> komplexních vzorků (výchozí { "50 000 000" }). V bajtech to je { "400" } MB jako <c2/> ({ "8" } bajtů na komplexní vzorek), { "200" } MB jako <c3/> ({ "4" } bajty) a { "100" } MB jako <c4/> ({ "2" } bajty); scéna se zapisuje jako <c5/>, pokud <c6/> neurčí jinak. Kontrola proběhne před jakoukoli prací a odmítnutí uvede délku nebo <c7/>, která se vejde.

seg-178284ddfee0 = <b>Stručné odpovědi.</b> Každý nástroj odpovídá jedním shrnutím ve formátu JSON: píky akvizice, C/N0, stav zachycení a každý zapsaný soubor s cestou a velikostí v bajtech. Tabulky po epochách jdou do souborů <c1/> / <c2/>, které pojmenujete.

seg-f375643798e9 = <b>Neznámé argumenty se odmítají</b>, nikoli ignorují, takže překlep v názvu volby je chyba.

seg-41040247770d = Každý nástroj běží stejnou cestou kódu jako <c1/> v příkazové řádce, uvnitř procesu. Vrstva je čistě softwarová: zapisuje soubory pro softwarové přijímače a neřídí žádný rádiový hardware. Vrstva IQ nepřidává syntézu interference ani spoofera a nic se nikdy nevysílá. (Samostatný druh scénáře <c2/> umí zapsat do souboru analytické snímky IQ rušičky.)

seg-f02d2f6bac7c = U obrazu Dockeru připojte složku a nasměrujte na ni proměnnou: <c1/>.

seg-721079aa25e7 = Dostupný je každý druh

seg-116ada4f4498 = <c1/> rozhoduje podle <c2/> scénáře, takže jím běží každý druh, který jmenuje <c3/>. To zahrnuje i novější rodiny, každou s přibalenými příklady, které si agent může vyžádat:

seg-c7047f5750a9 = Příklad, od kterého začít

seg-b45752760eca = Sluneční soustava

seg-1ccf38ab6e24 = Kampaně: zřetězené fáze, průchody parametrů, Monte Carlo (soubory náhodných běhů s pevným seedem), skládání

seg-67fe14962e1c = Navigace na nízké oběžné dráze Země (LEO): návrh signálu

seg-c555e5b73203 = Navigace LEO: bilance spoje při přeletu

seg-67de12cac6f0 = Navigace LEO: navigační zpráva

seg-b8badd962245 = Navigace LEO: fúzovaná poloha a čas

seg-0561cfd970d8 = <c1/> s <c2/> jmenuje každý přibalený příklad daného druhu. Animace, zprávy a interoperabilní exporty nejsou druhy: jsou to pohledy na běh a <c3/>, <c4/> a <c5/> je vrátí pro libovolný scénář, na který se vztahují.

seg-62d106ca4a89 = Neposkytuje se: sady studií (<c1/>), protože sada jmenuje sourozenecké soubory scénářů na disku a nástroje scénářů žádný soubor nečtou. Spusťte každého člena pomocí <c2/>. (Nástroje IQ soubory čtou i zapisují, ale pouze uvnitř svého pracovního adresáře.)

seg-57f592bb676b = Instalace serveru MCP

seg-77fc92e21295 = Pasáž, která jmenuje klienty umělé inteligence třetích stran, je zde vynechána; najdete ji v <a1>mcp/kshana-mcp/README.md</a1> na GitHubu.

seg-9ec78559983f = <c1/>, vlastní hosting: viz <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

seg-b32b9d4e0f8b = Z checkoutu nebo gitu (vývoj):

seg-73a73af88f08 = Režim HTTP (vlastní hosting)

seg-4f248ed3e597 = <c1/> poskytuje stejné nástroje přes streamable HTTP na <c2/>. Naslouchá pouze na loopbacku; adresa mimo loopback vyžaduje <c3/> a bearer token v <c4/>; nástroje pro soubory IQ jsou vypnuté; velikost požadavku, čas i souběžnost jsou omezeny; neodesílá se žádná hlavička CORS. Kshana žádný koncový bod neprovozuje: hostujete si jej sami. Viz <a1>docs/deploy/mcp-http.md</a1>.

seg-60f55b197ac2 = <c1/> umístí <c2/> do vaší <c3/> (typicky <c4/>). Server komunikuje JSON-RPC (JSON remote procedure call) přes stdio; logy jdou na stderr. Sestavení ze zdrojů vyžaduje toolchain Rustu ≥ { "1.88" } (vyžaduje jej opravené SDK <c5/> { "2" }.x; samotná knihovna <c6/> potřebuje jen { "1.85" }); obraz Dockeru nepotřebuje nic.

seg-2f3216082425 = Registrace u klienta

seg-1090ae3f689c = Prakticky každý klient MCP používá stejný konfigurační blok <c1/> — zaregistrujte binární soubor <c2/> absolutní cestou:

seg-2da393482666 = Nebo s obrazem Dockeru místo místního binárního souboru (<c1/> není potřeba):

seg-a4f1295bb27a = Kde tento blok žije, závisí na klientovi:

seg-154c7e09063d = <b>Cursor</b> — <c1/> (globálně) nebo <c2/> (pro projekt).

seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, vložte blok a poté plně restartujte IDE (integrované vývojové prostředí).

seg-daf0ea451b11 = <b>Desktopoví asistenti</b> — většina používá soubor <c1/> se stejným tvarem <c2/>; umístění souboru zjistíte v dokumentaci svého klienta.

seg-fc80286aa9bf = <b>Agenti v příkazové řádce</b> — mnozí přijímají stejný JSON přes mechanismus <c1/> / <c2/>.

seg-9f3ef8d76e05 = K binárnímu souboru vždy použijte absolutní cestu. Při řešení potíží nastavte <c1/> v <c2/> (diagnostika jde na stderr; stdout je vyhrazen pro protokol JSON-RPC).

seg-283d1eba838a = Vyzkoušejte

seg-61739e9b6515 = Po registraci se svého asistenta zeptejte například:

seg-256276ac933d = <em>„Vypiš druhy scénářů Kshana.“</em> → <c1/>

seg-2a8e3c76b939 = <em>„Ukaž mi příklad spektra v Kshana a spusť ho.“</em> → <c1/>, <c2/>, <c3/>

seg-d2e1e4148589 = <em>„Spusť scénář holdoveru hodin v Kshana s prahem { "20" } ns a 2hodinovým výpadkem GNSS; jaký je holdover kvantový oproti klasickému?“</em> → <c1/>

seg-f4b83873e280 = <em>„Exportuj tuto konstelaci GPS (Global Positioning System) jako SP3.“</em> → <c1/>

seg-54e01c1af45f = <em>„Dej mi tabulku realtime-frame-eop jako CSV.“</em> → <c1/>

seg-478e6fa0e8d8 = <em>„Zobraz ten přelet Iridia na globu Cesium.“</em> → <c1/>, <c2/>

seg-90829388d5d9 = <em>„Animuj kampaň rušení.“</em> → <c1/>

seg-9eb1b97ad2fd = <em>„Dej mi zprávu o tom běhu i se záznamem reprodukovatelnosti.“</em> → <c1/>

seg-dc60d64a3bb8 = <em>„Vytvoř jednosekundovou scénu GPS L1 s PRN { "3" } a { "17" }, pak ji zachyť a sleduj.“</em> → <c1/>, <c2/>, <c3/>, <c4/>

seg-942dc8abe0ec = Poznámka k návrhu — proč samostatný crate

seg-ce6d0ecab448 = Server je <b>samostatný crate vyňatý z workspace</b> s vlastním <c1/>, takže oficiální Rust MCP SDK (sada pro vývoj softwaru) <c2/> a jeho asynchronní runtime nikdy nevstoupí do grafu závislostí publikovaného crate <c3/>: uživatel knihovny nebo Pythonu nekompiluje server, který nespouští. (Původně byl oddělen proto, že <c4/> je <b>edice { "2024" }</b> a vyžaduje rustc ≥ { "1.85" }, zatímco hlavní crate tehdy slibovaly { "1.75" }. Knihovna nyní deklaruje { "1.85" }; tento server deklaruje { "1.88" }, minimum bezpečnostně opraveného <c5/> { "2" }.x.) Kontinuální integrace (CI) tento crate hlídá samostatně — testy a <c6/> proti jeho lockfile. Licenční strom rmcp je čistý (Apache-2.0/MIT/BSD), takže na rozdíl od křížově validačního crate <c7/>, který jinak kopíruje, oddělení nesouvisí s licencováním.

seg-75bf2d74642d = Licence: pouze AGPL-3.0, GNU Affero General Public License verze { "3" } (nebo komerční licence od Ashforde OÜ; viz <a1>LICENSING.md</a1> v repozitáři).

seg-490ebbefb561 = <s1>Předchozí</s1>Crate Rustu

seg-350b6b914734 = <s1>Další</s1>Server MCP: každý instalační kanál
