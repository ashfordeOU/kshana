# docs--jetbrains: translations (cs)

seg-f8a0fe9968c4 = Zdroj: <c1/>

seg-c55e49fd2a72 = Kshana pro IDE JetBrains

seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> na JetBrains Marketplace</a1> — nebo v kterémkoli IDE JetBrains <em>Settings → Plugins → Marketplace → vyhledejte „Kshana“</em>.

seg-959ab829762c = Nativní zásuvný modul, který spouští simulátor odolnosti PNT <b>Kshana</b> uvnitř kteréhokoli IDE JetBrains (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Klikněte pravým tlačítkem na scénář <c1/> → <b>Run Kshana Scenario</b>; ukazatele kvality a výsledek JSON se průběžně zobrazují v okně nástroje <b>Kshana</b>.

seg-594199d2ce06 = Doplňuje <a1>server MCP</a1> (který dává <em>AI Assistant</em> od JetBrains přístup ke Kshaně): tento zásuvný modul je cesta <em>pro člověka</em>, klikáním.

seg-a356f2c30afb = Akce <b>Run Kshana Scenario</b> na libovolném <c1/> (kontextové nabídky editoru a zobrazení projektu) — spustí <c2/> a zobrazí výstup v okně nástroje Kshana.

seg-116d04ae5538 = <b>Assess Receiver Trust</b> na scénáři <c1/> <c2/> (<c3/>): časová osa důvěry se skóre 0–100 a důvody pro plavidlo. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel.

seg-726d88d0dea7 = <b>Generate Training NMEA</b> na <c1/> <c2/> (<c3/>): syntetické mostové NMEA a záznam instruktora, zapsané vedle scénáře. Pouze text; pro výcvik, nikdy pro živé navigační systémy plavidla.

seg-99510426a384 = <b>Build Interference Map</b> na ADS-B nebo AIS <c1/> (zobrazení projektu; zeptá se, o který schválený dataset jde) a <b>Route Exposure</b> na souboru trasy (zeptá se na složku s mapami). Zhoršená buňka neidentifikuje interferenci jako příčinu; není to předpověď.

seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> na scénáři <c1/> (<c2/>): pohyb vozidla, NMEA a označené události pro laboratorní simulátor GNSS, zapsané vedle scénáře. Nezapisuje žádný signál; simulátor provozujte jen tam, kde je to povoleno.

seg-79c553c303c5 = <b>Build Compliance Report</b> na výsledku běhu <c1/> (<c2/>) a <b>Tools → Show Compliance Mapping</b> (<c3/>): mapování na veřejný rámec, zobrazené s vlastním prohlášením enginu doslova.

seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> na složce balíčku důkazů (zobrazení projektu; <c1/>): zeptá se na veřejný klíč podepisujícího ({ "64" } hexadecimálních číslic nebo soubor <c2/>; vždy zafixovaný, zásuvný modul nikdy nepřijme nezafixovaného podepisujícího) a volitelně na úplný záznam relace. Jako ověřený se zobrazí jen ověřený výsledek; neporušený balíček s nezafixovaným podepisujícím se zobrazí jako „NOT VERIFIED“.

seg-253d5b7f94ce = <b>Render Trust Telemetry</b> na výsledku <c1/> <c2/> (<c3/>): text pro Prometheus, události syslog CEF/LEEF nebo řádky MQTT pro Home Assistant vypsané do okna Kshana. Nic se neodesílá ani neposkytuje; běžící exportéry zůstávají na příkazovém řádku.

seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> na stacionárním IMU <c1/> (<c2/>): parametry akcelerometru a gyroskopu scénářů <c3/> a <c4/> prokládané podle Allanovy odchylky, vypsané do okna Kshana jako tabulka <c5/>. Nic se nezapisuje; proložení je MODELLED.

seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (nabídka Tools; <c2/>) a <b>Assess Receiver Stream</b> (relace plavidla <c3/> plus uložený záznam NMEA, který zvolíte; <c4/>, hodnoceno jednou bez soketu a bez brány).

seg-38037d36639c = <b>Insert Example Scenario</b> (složka v zobrazení projektu nebo nabídka Tools; <c1/>): vyberte přibalený scénář a zapíše se jako nový <c2/> (nikdy přes existující soubor). <b>Export Scenario</b> na <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; pouze simulovaný výstup), <b>Animate Scenario</b> (HTML nebo SVG, otevřené v prohlížeči) a <b>Import Route</b> na trase <c4/> (zeptá se, do kterého scénáře).

seg-1f1b18f8e102 = <b>Create Evidence Pack</b> na relaci důvěry v přijímač <c1/> (<c2/>): zeptá se na okno, soubor podpisového klíče, který už máte, a výstupní složku. Zásuvný modul klíč nikdy nevytváří, nečte ani neukládá (<c3/> zůstává na příkazovém řádku). <b>Attach Timestamp</b> na složce balíčku (<c4/>): Kshana nekontroluje podpis autority časových razítek; spusťte si <c5/> sami.

seg-f4f6605d3db9 = Stále jen na příkazovém řádku: příkazy IQ, <c1/> a <c2/>.

seg-63efd04104f1 = Spodní okno nástroje <b>Kshana</b> hostující konzoli běhu.

seg-decda07aa7eb = Není v zásuvném modulu: <c1/> (dlouho běžící proces proudu s bránou a volitelným posluchačem TCP) a <c2/> zůstávají na příkazovém řádku, protože akce IDE spustí příkaz do konce a zobrazí jeho výstup; viz <c3/>.

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> pro nasměrování na binárku <c1/> (prázdné → najde se v <c2/>; instalace pomocí <c3/>).

seg-44dfdd65bd0a = Zásuvný modul je čistě platformní (bez závislostí na konkrétním jazyku), takže se načte v každém IDE JetBrains od sestavení { "243" } ({ "2024.3" }) výše.

seg-453bd42c23fa = Sestavení a spuštění

seg-b5328f8c7a8a = Vyžaduje JDK { "17" }+ (sestavení zafixuje JDK { "21" }) a přibalený wrapper Gradle.

seg-758124ceb1c7 = <c1/> ve výchozím nastavení kontroluje since-build { "2024.3" }. Chcete-li zkontrolovat další řady, uveďte je jako <c2/> (každé IDE je stažení o velikosti asi { "1" } GB):

seg-15d175aaeb59 = Zásuvný modul na žádném z nich nepoužívá zastaralé API platformy ani API určené k odstranění; ať to tak zůstane (dialog volby jde přes <c1/>, ne přes <c2/>).

seg-39cfd740d9b3 = Sestavený zip nainstalujte přes <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

seg-87aff08f344c = Rozvržení

seg-73b3f55b7208 = Izolace

seg-a14db8de576a = Stejně jako <c1/> a <c2/> jde o samostatný projekt Gradle, vyloučený z publikovaného balíčku <c3/> (<c4/> v <c5/> balíčku); jeho výstup sestavení je v gitignore.

seg-b38914a430b9 = Licence: AGPL-3.0-only (nebo komerční licence od Ashforde OÜ — viz <c1/> v repozitáři).

seg-bb286e3ce9c9 = <s1>Předchozí</s1>Kde je která schopnost dostupná

seg-e62586b5f58c = <s1>Další</s1>Kde Kshana běží
