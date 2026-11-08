# docs--changelog: translations (cs)

seg-9a2a5f0a8a02 = Sluneční soustava

seg-20db2c79b998 = Ověřeno

seg-a20b4a6e8f53 = čipové atomové hodiny

seg-49a994d77d2f = teplotně kompenzovaný krystalový oscilátor

seg-2247a2344710 = Význam

seg-5770537524d3 = Oblast

seg-40d4fc0d3922 = Zdroj: <c1/>

seg-7333b85d448f = Všechny významné změny v Kshana jsou zdokumentovány zde.

seg-bbc8f38627f1 = Formát vychází z <a1>Keep a Changelog</a1> a tento projekt dodržuje <a2>Semantic Versioning</a2>. Dokud je projekt před verzí 1.0, může se veřejné schéma scénářů a výsledků ještě měnit; zásadní změny jsou výslovně uvedeny.

seg-985f7b4c001a = Nevydáno

seg-a2f583aadd0b = Žádné nové funkce: jedna oprava příkazového řádku, aktualizace závislostí v nástrojích křížové validace a dokumentace. Výsledky enginu se oproti { "0.38.0" } nemění.

seg-c9a8a5898ced = Opraveno

seg-3cc8ba4d1be6 = Příkazový řádek se tiše ukončí se stavem { "141" }, když se jeho standardní výstup uzavře (<c1/>), místo aby spadl s hlášením „failed printing to stdout: Broken pipe“. { "141" } je { "128" } plus SIGPIPE, tedy stav, který shell hlásí pro <c2/>. Ošetřena je jen uzavřená roura: plný disk či jakákoli jiná chyba zápisu se dál ohlásí a živý přenos zapisující do uzavřeného socketu stále dostane svou chybu zápisu. <c3/> uzavře čtenáře před spuštěním programu, takže první zápis selže při každém běhu.

seg-2a47e785cc1d = Aktualizace závislostí v nástrojích křížové validace (<c1/>); žádná změna dodávaného crate, wheel ani balíčku.

seg-9df898fb24be = <c1/> { "0.9.10" } na { "0.9.11" } (RUSTSEC-2026-0186) v zámcích křížové kontroly ANISE (<c2/>, <c3/>); zámky také znovu synchronizují závislost na cestě <c4/> v repozitáři.

seg-835e9d6058f8 = <c1/> { "12.3.0" } na { "13.0.0" } a <c2/> { "2026.7.22" } na { "2026.10.19" } v připnutých verzích prostředí orákul (<c3/>, <c4/>): opravená vydání pro osm bezpečnostních oznámení k pillow a jedno k certifi.

seg-902fc421a851 = <c1/>, README a tento soubor uvádějí každý práh kshana-bench, který je NOT MET, tak jak je zaznamenán v <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } oproti požadovaným alespoň { "0.80" } na testovací části), <b>D1</b> (největší rozdíl { "0.0301" }) a <b>úloha (b) R1</b> (převzato, znovu nespuštěno). Žádný práh není uvolněn.

seg-44d9c9622c24 = Průchod kompletností README: seznam obsahu; druhy scénářů zařazené do rodin, každý se stránkou pod <c1/> (popis a pole enginu, vstupy a výsledky ukázkového běhu, řádky registru a orákula, omezení, která uvádí zpráva běhu, a graf, který engine zapisuje), kontaktní list pro každou rodinu, vše indexováno v <c2/>; každý příkaz v <c3/>; každé rozhraní, příkaz zásuvného modulu, dovednost a stránka Studia v <c4/>; každá oblast schopností v <c5/>; vložené diagramy Mermaid (přehled systému, rozhraní, vnitřní smyčka, důvěra v přijímač, laboratorní okruh tam a zpět, Studio, tok testování a vydání, mapa modulů, distribuce). Zapsáno <c6/>, <c7/> a <c8/>; auditováno <c9/>; hlídáno <c10/>, které také připíná popis a pole každé položky k enginu.

seg-b953186d5726 = <c1/>: vykreslí diagram Mermaid do SVG a PNG v Linuxu a aktualizuje záznam o vykreslení.

seg-68e19f94faed = README: obrázky pro uživatele z vesmíru a Měsíce používaly cesty relativní k <c1/>, takže se z README nenačetly; jeden odkaz mířil na <c2/>.

seg-850e1574e2d6 = Odstraněny dva zastaralé ručně zkopírované soubory grafů (<c1/>, <c2/>), které žádná stránka nepoužívala a které už neodpovídaly enginu; aktuální grafy obsahuje <c3/>.

seg-033d52126d8a = Přidáno

seg-090bf5ae96b6 = <b>GNSS za konstelací (<c1/>).</b> Nový druh scénáře pro kosmické prostředky nad drahami GNSS, kolem nich i za nimi (<a1><c2/></a1>): dostupnost jednoho a čtyř signálů, délky výpadků, C/N0, DOP a spoje hlavního laloku oproti postranním lalokům pro GPS, GLONASS, Galileo, BDS, QZSS a NavIC na slupce nebo podél trajektorií LEO, MEO, GEO, HEO a přechodových drah k Měsíci; vysílací diagramy z brožury, parametrické nebo dodané uživatelem; model ionosféry, plazmasféry a atmosféry s paprskem u limbu; návrh přijímače pro slabé signály; palubní rozšířený Kalmanův filtr GNSS pro HEO a přechod k Měsíci; a relativní navigace ve formaci. Porovnáno s brožurou ICG Space Service Volume podle předregistrace zafixované před během: konstanty minimálního vyzářeného výkonu a lunární práh se shodují, ostatní prahy při předregistrovaném čtení splněny nejsou (téměř všechny kvůli nekonzistentnímu úhlu svazku GLONASS v brožuře) a parametrická náhrada postranních laloků nereprodukuje naměřené diagramy panelů GPS. Vše zůstává MODELLED (<a2><c3/></a2>).

seg-3281ef6e21eb = <b>Oběžná dráha Měsíce a jeho povrch jako navigační a geodetická infrastruktura (<c1/>).</b> Nový druh scénáře s pěti studiemi vybíranými pomocí <c2/> (<a1><c3/></a1>): konzistence palubního určování oběžné dráhy podle GNSS Země na téměř přímočaré halo dráze oproti nezávislému pozemnímu určení vzdálenosti a rychlosti změny vzdálenosti; společná dvojitě diferencovaná fáze nosné povrchové stanice a orbiteru s celočíselným fixováním LAMBDA; Fisherova informace sedmiparametrového lunárního datumu s měřením vzdálenosti mezi orbiterem a povrchem i bez něj; odchylky mezi technikami GNSS, VLBI a laserového měření vzdálenosti oproti místnímu spojení; a citlivost na h2, k2, l2 a fyzickou libraci. MODELLED, s vstupy ILLUSTRATIVE: numerika je ověřena nezávislými programy v numpy a scipy a nic se neporovnává s měřením lunární veličiny. Prahy byly stanoveny v <c4/> a dvou zveřejněných změnách. Tři jsou NOT MET a každý je zafixován testem, který tvrdí, že k nesplnění došlo: C3 (vložená chyba síly není zjištěna předregistrovanou mírou), Q3 (bootstrapovaná míra úspěchu se liší od orákula v numpy o { "1.7e-6" } oproti prahu { "1e-9" }, kvůli aproximaci normálního rozdělení v LAMBDA) a polovina stopy u G3 (přidání rodiny měření vzdálenosti nesníží stopu pseudoinverze vždy). Ostatní jsou splněny (<a2><c5/></a2>).

seg-022859135e79 = <b>Šestý článek v tabulce Výzkum.</b> „Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever“ (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) ukazuje, že faktor DOP (zhoršení přesnosti) je pro cislunární sledování pouze podle vzdálenosti nedefinován, a místo něj používá Gramián pozorovatelnosti na čtyřech rovinných vzdálených retrográdních drahách: samotná vzdálenost má v jednom okamžiku hodnost { "2" } ze { "4" } a vyžaduje oblouk dlouhý asi { "2.09" } h, rychlost změny vzdálenosti (Doppler) dává hodnost { "4" } okamžitě a společný odhad stanice se stavy družic a hodinami zůstává o jedničku hodnostně deficitní, pokud chybí vnější interferometrické pozorování. Jeho čísla znovu generuje druh <c1/> (<c2/>); <c3/> testuje práh nezávislým odhadovačem. Obsahuje je karta výzkumu v README, README crates, npm a PyPI i generátor.

seg-d74a1b2dcb38 = Neutrální rozhodčí, učiněný měřitelným.

seg-bf568567fe06 = <c1/> čte zveřejněný katalog NPRA Jammertest a plán vysílání jako plánovanou pravdu (id katalogu zachovány) a <c2/> hodnotí záznam přijímače proti němu po jednotlivých testech (latence detekce, nezachycené poplachy, falešné poplachy, doba do zotavení), volitelně jako podepsaný balíček důkazů (<a1><c3/></a1>). Hodnoticí prahy byly předregistrovány před jakýmkoli hodnoceným během (<c4/>). Na datové sadě JammerTest { "2024" } (stahované, nikdy nepřibalené) předregistrované pravidlo minima dat selhalo v prvním běhu i v revizi zpracování dat, takže žádný práh nelze posoudit a nic se netvrdí; oba běhy jsou zaznamenány a zafixovány. MODELLED: plán tvoří zaprotokolovaná okna datové sady, nikoli zaznamenané časy vysílání. Sada NMEA SimulaMet { "2025" } není adaptována (na její stránce není uvedena licence).

seg-0a2bcad8d645 = <b>Vlastní příznaky přijímače vedle příznaků Kshana.</b> UBX-NAV-STATUS <c1/> a UBX-SEC-SIG se v každé epoše čtou do <c2/> a porovnání <c3/> ve výsledku je staví proti monitorům Kshana (oba, jen přijímač, jen Kshana, žádný); nevyvolává žádný poplach a nemění žádné skóre. Připojují se k nim čtečka Septentrio SBF (PVTGeodetic, MeasEpoch, RFStatus, jen pro čtení, na crate <c4/> s licencí MIT) a <c5/> (kanál NMEA přes sériový port nebo USB, jen pro čtení; do přijímače nikdy nezapisuje).

seg-90d9927fe3e2 = <b>Časování a bezpečnost hardwaru</b> (<a1><c1/></a1>, <a2><c2/></a2>). Druh scénáře <c3/> hodnotí test holdoveru časovacího systému (GNSS odebráno operátorem, holdover, zotavení) z naměřeného záznamu časové chyby, měřeno proti maskám ITU-T z veřejných tabulek. <c4/> čte logy linuxptp (<c5/>, <c6/>, <c7/>) a chrony (<c8/>, <c9/>). <c10/> zapisuje metadata ION GNSS SDR a <c11/> monitoruje záznam SigMF, zatímco roste (pouze příjem). <c12/> získává profil NIST IR 8323r1 Foundational PNT Profile ({ "15" } parafrázovaných řádků, podporuje důkazy pro (supports evidence for)). Balíček důkazů může ve svém podepsaném manifestu zaznamenat <c13/> operátora, nikdy neověřené; hardwarové stupně { "0" } až { "4" } a právní poznámky jsou v <c14/> (čeká na právní posouzení). Žádná vysílací cesta jakéhokoli druhu neexistuje.

seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): pevné úlohy, rozdělení a metriky pro detekci interference GNSS na záznamech přijímačů (JammerTest { "2024" }) a v IQ, predikci holdoveru času (hodiny IGS) a mezeru optimismu mimo rozdělení trénovacích dat; manifesty rozdělení s připnutými hashi a skripty pro stažení (žádná přibalená data), zapečetěný holdout pomocí commitu a odhalení, schéma souboru výsledků a statická stránka žebříčku. Základy s prahy předregistrovanými v <c4/>: prahy hodnotitele splněny, C1 až C3 splněny, D2 splněno; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } oproti požadovaným alespoň { "0.80" } na testovací části), <b>D1 NOT MET</b> (největší rozdíl { "0.0301" }) a <b>úloha (b) R1 NOT MET</b> (převzato, znovu nespuštěno), každý zafixován (<c6/>). Každé skóre je MODELLED. Python <c7/>, <c8/>; WebAssembly totéž; MCP <c9/>, <c10/>.

seg-04c0d6161c7a = <b>Observatoř interference</b> (<c1/>, <c2/>, <a1><c3/></a1>): reprodukovatelný denní GeoJSON, PNG a JSON hlášení incidentů se třemi stavy (degraded, not degraded, not observed), minimálním zpožděním { "24" } h, buňkami o velikosti { "0.5" } stupně nebo hrubšími, bez přisuzování příčiny a s odmítnutím dat OpenSky; studie citlivosti předregistrovaných parametrů; 30denní baltský zpětný katalog z adsb.lol.

seg-497ae18bfb03 = <b>Strojové a senzorové vstupy pro <c1/></b> (<a1><c2/></a1>). Nové hodnoty <c3/>, všechny jen pro čtení, MODELLED, s ručně napsanými fixtures a bez přibalených dat: <c4/> (soubory řešení RTKLIB <c5/>), <c6/> (OEM7 ASCII a binární <c7/>, <c8/> C/No a <c9/>; příznak rušení přijímače se stává <c10/> epochy, proti poplachům Kshana ho staví porovnání <c11/>), <c12/> (C/N0 z MSM4 a MSM7 pro GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou a NavIC; rozložení z tabulek pyrtcm s licencí BSD, jejichž oznámení je v <c13/>, nikoli z normy RTCM) a <c14/> (zprávy GNSS-SDR Monitor a PVT-monitor jako řádky JSON, předávané pomocí <c15/>).

seg-22e8b434782f = Logy IMU jako druhý senzor.

seg-5491196d6421 = <c1/> (<c2/> nebo <c3/>) integruje rychlost stáčení z gyra do směru, který čte monitor <c4/>; vložené na každém rozhraní a přenášené balíčky důkazů. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, zásuvný modul <c9/>, akce JetBrains) fituje parametry akcelerometru a gyra scénářů <c10/> a <c11/> z klidového logu pomocí Allanovy odchylky a vypisuje tabulku <c12/> s SHA-256 logu v jejím původu.

seg-f48fdf6252cd = <b>Integrace:</b> balíček ROS { "2" } (<c1/>: NavSatFix a <c2/> na vstupu, témata důvěry na výstupu; jeho most bez ROS je testován proti skutečnému enginu, samotný uzel nebyl spuštěn na živém grafu ROS), most <c3/> (<c4/>, závislost s licencí MIT, volitelná) a relé GNSS-SDR.

seg-1a8727ad42bb = <b>Exportér MQTT pro Home Assistant</b> pro telemetrii důvěry: <c1/> a <c2/> (zprávy objevování a stavový dokument JSON; jen publikování, bez přihlašovacích údajů a TLS) a <c3/> jako text v Pythonu, WebAssembly a MCP.

seg-f1cb2c2881c9 = Sedm řádků registru MODELLED k výše uvedenému. Nic z toho není VALIDATED: nebyl přečten žádný záznam ze skutečného přijímače, základnové stanice, IMU, běhu GNSS-SDR, grafu ROS ani brokeru MQTT.

seg-12c7a28c80b5 = <b>Rezerva optického spoje v čase.</b> Druh <c1/> přijímá volitelnou tabulku <c2/> (<c3/>, <c4/>, <c5/>) a poté také zapisuje pro každé místo jednu realizaci uvedeného modelu místa v čase se seedem: epizody oblačnosti, sloupec kapalné vody pro každou epizodu, jeden vzorek scintilace gamma-gamma na krok a z nich rezervu spoje, útlumy oblačností a scintilací a příznak spojení v provozu, s dosaženou dostupností, podílem oblačnosti, počtem výpadků a nejdelším výpadkem. MODELLED (jeden tah z modelu, nikoli klima; žádné vnější orákulum). Bez tabulky je výsledkem dokument { "0.37" }. Dva přibalené optické scénáře tabulku obsahují ({ "336" } h, { "600" } s, seed { "37" }). Prahy předregistrované v <c6/> před prvním během.

seg-78524dbb3bd2 = Specifikace zkušebních podmínek a laboratorní okruh tam a zpět.

seg-fbf034925641 = <c1/> je zveřejněno jako <a1><c2/></a1> se schématem JSON Schema a získává <c3/>. <c4/> nově zapisuje také <c5/>. <c6/> sestaví podepsaný balíček propojující hash scénáře, hash uvedených podmínek, hash záznamu přijímače a skóre vůči uvedeným událostem a odmítne podmínky, které se neshodují s hodnoticími událostmi. Ukázkový příklad s gps-sdr-sim zapisujícím pouze soubor; přehrání je odpovědností operátora a nikdy se neautomatizuje. Python <c7/>, MCP <c8/>, zásuvný modul <c9/>.

seg-8bda4472d561 = <b>Balíčky norem</b> (<c1/>, <c2/>): testovací profily rámce DHS Resilient PNT pro úrovně { "1" } až { "4" }, úrovně přesnosti a vyhodnocení integrity podle IMO MSC.1/Circ.1575 a ICAO Doc { "9849" } Appendix F monitorovat, posoudit a zmírnit, každý jako sada scénářů hodnocených podle prahů stanovených před během, s řádky compliance-report, pro které podporují důkazy pro (supports evidence for). Nesplnění jsou v záznamu a zafixována: DHS L4-T1 a čtyři testy přesnosti IMO. Samotný Doc { "9849" } nebyl čten (placený); balíček ICAO se řídí vlastní prezentací ICAO RFI Mitigation Plan. <c3/> získává sekci balíčků norem. Vše MODELLED.

seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): kódy AFS-I Gold a AFS-Q Weil pro PRN { "1" } až { "210" }, signály <c2/> a <c3/> v <c4/>, kód SB1 BCH, CRC-24Q a prokládač a <c5/> (<c6/>, <c7/>, <c8/>), připnuté k LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } January { "2025" }). Kódy VALIDATED oproti vytištěným tabulkám dokumentu (které označuje TBC); jeden vytištěný terciární sloupec (PRN { "147" }) je pravděpodobně tisková chyba a nesoulad je zafixován. Kódování LDPC podrámců { "2" } až { "4" } není implementováno.

seg-5a5720500b6d = <b>Poznámkové bloky ke kurzu</b> (<c1/>): jamming, spoofing, holdover, integrita, OSNMA a mapa interference, každý s cvičeními.

seg-3d543433051c = <b>Studie maximálního URA pro ARAIM Milestone { "3" } skupiny EU-US WG-C</b> (<c1/>, <c2/>), nahrazující staženou „Table A-3“ plán; MODELLED při uvedených odchylkách.

seg-4f1f786e2658 = <b>Návrhy ke schválení vlastníkem</b> pod <c1/>: článek JOSS, dodatek ke stanovám TSC, proces registru orákul a návrh rozdělení <c2/>. Nic z toho není přijato.

seg-49a758039871 = <b>Pohledy Studia pro funkce { "0.38" }</b> (kshana.dev/studio/). Přehrání mostu (dva syntetické běhy na jedněch hodinách: dráha, skóre důvěryhodnosti, družice, které log slyší, a verdikt, s vlastními příznaky přijímače vedle poplachů Kshana); Optical PNT (dva scénáře <c1/>, s volitelnou realizací <c2/> se seedem, MODELLED); Holdover test (výsledek <c3/> měřený proti maskám ITU-T, vykreslený z vlastního <c4/> výsledku); prohlížeč observatoře interference, který otevírá soubory, které jste vytvořili, a žádné nedodává; na stránce Nástroje hodnotitel Jammertest, fit IMU a MQTT jako formát telemetrie; a v Důvěře volba formátu logu (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) s volitelným souborem IMU. Každý pohled čte soubory v prohlížeči a nic nenahrává; každá hodnota si ponechává štítek, který pro ni drží registr, a každý nese poradní prohlášení. Stránka webu <c6/> zobrazuje fragment <c7/>.

seg-91f6beb29f8e = <b>Issue #36: bajtově přesné vrstvy pinů.</b> Bajtově přesné vrstvy pinů běží jen na hostiteli prohlášeném za základní (<c1/>, nastavuje <c2/>), nikoli na každém Macu s procesorem Apple, protože matematická knihovna Apple se mezi vydáními macOS liší; přenosná vrstva běží všude a <c3/> brání tomu, aby byla bajtově přesná vrstva opět podmíněna pouze platformou. Samotná porovnání s orákuly na macOS procházejí. Žádný literál nebyl znovu převzat a žádná tolerance nebyla změněna. <c4/> a <a1><c5/></a1> popisují, jak rozdíl vyšetřit; <c6/> je ruční a týdenní diagnostika, nikoli brána.

seg-15070f7dcc0a = <b>CodeQL: neukotvený vzor v pomocné funkci Studia pro otevření důvěry</b> nyní odpovídá celé hlavičce (<c1/>).

seg-56856063519f = <b>CI: disk běhového prostředí.</b> Úloha <c1/> sestavuje profily dev a test bez ladicích informací, takže linkování už nezaplňuje disk.

seg-38c59868835e = <b>Hlídače zdrojů.</b> Každý zdrojový soubor, který obsahuje testovací fixtures s piny, deklaruje svůj rozsah pinů a testy, které zapisují dočasné soubory, používají pro každé volání jedinečnou cestu, takže paralelní běhy nemohou kolidovat.

seg-884f693585fa = <b><c1/></b> je znovu vygenerováno pro volitelné pole <c2/> druhu optical-atmosphere.

seg-e16d328f3967 = <b>Zásuvný modul JetBrains: žádné použití zastaralého API platformy ani API plánovaného k odstranění.</b> Nástroj IntelliJ Plugin Verifier (<c1/>) proti sestavení IntelliJ IDEA { "263" } ({ "2026.3" }: { "263.6800.24" } a { "263.7031.23" }) našel jedno zastaralé volání, <c2/>, ve Vložit příklad; nový soubor nyní otevírá pomocí <c3/>. Zásuvný modul je kompatibilní s { "2024.3" } (since-build, beze změny) i s oběma sestaveními { "263" } a je na nich čistý. CI nyní spouští <c4/> a selže při problémech s kompatibilitou i při jakémkoli použití API plánovaného k odstranění.

seg-07ce053c906a = <b>Optické PNT atmosférou</b> (druh scénáře <c1/>, <a1><c2/></a1>, návrhová poznámka <c3/>). Pro optický spoj a sadu pozemních míst uvádí útlum čistého vzduchu závislý na vlnové délce a elevaci, stav turbulence Hufnagel-Valley (Rytovův rozptyl, index scintilace, útlumy gamma-gamma, průměrování apertury), dostupnost vůči rezervě spoje z uvedeného klimatu oblačnosti, rezervu potřebnou pro cílové dostupnosti a strop, který žádná rezerva nezvedne, rozdělení délek výpadků, chybu času a měření vzdálenosti na výpadek podle modelu holdoveru hodin, prostorovou diverzitu míst korelovanou se vzdáleností a varianty „co kdyby“ pro změnu vlnové délky, větší aperturu, snížení scintilace adaptivní optikou a dodatečnou rezervu. <c4/> získává rozpočet zohledňující atmosféru; bez něj je výstup bitově shodný s { "0.36" } (práh A5). Dva přibalené scénáře obsahují ILLUSTRATIVE klimata oblačnosti. MODELLED: tři řádky registru. Numerika splňuje prahy A1 až A6 předregistrované v <c5/> oproti nezávislému programu v mpmath; to ověřuje implementaci uvedených vzorců, nikoli atmosféru, a nebyl porovnán žádný naměřený záznam dostupnosti, takže žádný řádek není VALIDATED. Práh A4 byl poprvé nesplněn o { "3e-9" }, protože použitá normální distribuční funkce byla aproximací { "1.5e-7" }; distribuční funkce byla nahrazena a práh ponechán tak, jak byl registrován. Nativní sestavení a sestavení WebAssembly vracejí bajtově shodné dokumenty pro oba přibalené scénáře (A7, spuštěno na integračním commitu { "0.37.0" }).

seg-eb589aff44ad = <b>Detekční ROC monitorů IQ</b> (PRO-32, <a1><c1/></a1>). Kampaň s monitory uchovává maximum každé testové statistiky přes okna uvedených událostí (pozitivní) a dlaždicovitá okna mimo události (negativní, <c2/>). Zpráva je sdružuje podle druhu poplachu do ROC s jeho AUC a provozním bodem při nastaveném prahu, jako <c3/> a sekci zprávy. Na syntetických kampaních je kontrola úrovně náhody splněna. Práh AUC pro C/N0 ({ "0.95" }) splněn není ({ "0.79" }), protože negativní okna těsně po události dědí z detekce doznívání CUSUM; je to zaznamenáno. MODELLED.

seg-d25a34e23f1a = <b>Monitory IQ v kampani laboratorního přehrávání</b> (PRO-31, <a1><c1/></a1>). Volitelná tabulka <c2/> v souboru kampaně spouští monitory IQ v jediném průchodu běhounu: výkonový a spektrální po každém řetězci předního stupně a C/N0, SQM a zachycení pro každý sledovaný kanál. Jejich poplachy se hodnotí vůči uvedeným událostem: zjištěno nebo nezachyceno, doba do detekce a falešné poplachy na hodinu expozice. U každého testu je uvedena hodnota falešného poplachu v uzavřeném tvaru, včetně nové oboustranné gaussovské hodnoty pro testy SQM (<c3/>). Bez tabulky se nic nemění. Na syntetických kampaních jsou prahy falešných poplachů pro výkon a SQM i práh falešných poplachů pro C/N0 splněny; { "18" } z { "18" } útlumů je zjištěno, ale mez doby do detekce, která je z konstrukce pod jedním vzorkem detektoru, splněna není a je zaznamenána. MODELLED; řádek registru „IQ monitors scored in lab-replay campaigns“.

seg-8eb0f650065e = <b>Laboratorní fit z kampaní IQ, navazující práce</b> (<c1/>, úloha CI <c2/>). Testuje dvě hypotézy, které §{ "13.6" } v <c3/> nechal otevřené, oproti prahům předregistrovaným v 1e532f84. Přidává dvě syntetické kampaně: S se stupňovitým J/S (seed 2026_1014) a R, novou rampu (seed 2026_1015). Výsledky jsou v <c4/>.

seg-ce60405d0005 = S1 splněno: při udržení každé úrovně J/S se <c1/> obnoví v rozmezí +{ "0.185" } dB. Chyba −{ "1.1" } dB u kampaní s rampou je zpoždění odhadovače.

seg-ea9f206c2999 = S2 nesplněno, zafixováno testem, který tvrdí nesplnění: (d) tak, jak je napsáno, na kampani se stupňovitým průběhem platí pro model sledovací smyčky ({ "0.45" } dB), ale ne pro empirický ({ "6.42" } dB).

seg-fab0653558e4 = R1 splněno: na nové kampani s rampou je (d) s fitovanou dobou setrvání při poklesu vynásobenou rychlostí rampy každé události v rozmezí { "1" } dB u obou modelů.

seg-24c6725c2c7d = Nesplnění (a′) a (d) se na R opakují.

seg-7cbbce356973 = Kampaň může nyní v testovací sestavě uvést svůj J/S jako profil <c1/>.

seg-34007ba58a9f = Žádný verdikt v §{ "13" } se nemění a řádek registru zůstává MODELLED.

seg-df2c3f2532d6 = <b>Omezené navázání FLL, volitelně</b> (DS-LOOP-05): nový klíč návrhu smyčky <c1/> (s), v Rustu <c2/>. Při <c3/> vynutí předání z FLL do PLL po této době, bez ohledu na PLI. Ve výchozím stavu nenastaveno, a pak mimo hash návrhu; výchozí návrh a jeho hash se nemění.

seg-ae2794b2d3d5 = Ověřeno proti prahům předregistrovaným v 58789af0, na vložené pravdě. Kontrola je splněna: výchozí nastavení nikdy nepředá řízení v { "9" } z { "10" } seedů při { "33" } dB-Hz.

seg-6d9483874b35 = Nesplněno: s omezením { "1.0" } s drží zachycení { "16" } z { "20" } běhů při { "33" } dB-Hz a { "8" } z { "20" } při { "31" } dB-Hz; ostatní cyklují mezi vynucenými předáními a návratem FLL. Fázový jitter je { "1.8" }násobkem samotné PLL při { "33" } dB-Hz.

seg-deeefaf50e3e = Podlaha navázání ~{ "35" } dB-Hz zůstává zdokumentovaným omezením výchozího nastavení.

seg-780de73c01e1 = MODELLED; řádek registru „Capped FLL pull-in below the default design's FLL-to-PLL hand-over floor (opt-in)“.

seg-ace6b53749bd = <b>Hystereze akvizice a kvantizér předního stupně v druhu jamming</b> (CAP-06c): dvě volitelné sekce pro scénář <c1/>.

seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, na sledovacím prahu nebo nad ním) a <c3/> (s, výchozí { "0" }). Družice je získána na akvizičním prahu nebo nad ním, jakmile byla po dobu prodlevy nezískaná. Drží se, dokud je na sledovacím prahu nebo nad ním. Výstupy: <c4/> (true/false), <c5/> (počet) a <c6/> ({ "1" }).

seg-b568f542e23a = <c1/>: <c2/> ({ "1" } až { "16" }) a <c3/> (MHz, výchozí dvojnásobek čipové rychlosti). Výstupem je blok <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, odečtené od efektivního C/N0 každého spoje) a <c8/>. Ztráta je ztráta pro gaussovský vstup, označená jako neplatná pro rušiče CW, úzkopásmové a s rozmítáním.

seg-0dad81736863 = Bez těchto sekcí je každý výstup bajtově shodný.

seg-92007bfb6680 = Ověřeno proti prahům předregistrovaným v 70c72fcc. Ztráta kvantizéru je do { "0.0007" } dB od nezávislého Monte Carlo a údaj AGC do { "0.012" } dB od smyčky AGC vrstvy IQ.

seg-973e451df99d = Registrované běhy hystereze byly neinformativní (každý spoj ztracen), takže tento práh je NOT MET. Doplňková sada běhů registrovaná v { "37793290" } jej splňuje: každý příznak se rovná nezávislému přepočtu a { "732" } z { "1824" } spojů vykazuje hysterezi.

seg-912e9f1a4d5b = Zjištění: s rušičem CW ztrácí 1bitový ADC asi o { "5" } dB více než gaussovská hodnota.

seg-a19aee81b581 = MODELLED; řádek registru „Acquisition hysteresis and the front-end quantiser in the jamming kind against independent recomputations“.

seg-97f43a4fe71d = <b>Terénní zastínění rušiče v druhu jamming</b> (CAP-06b): volitelná sekce <c1/> ve scénáři <c2/> s rušičem. Pole:

seg-6d59a2857ab9 = <c1/>: dlaždice SRTM <c2/>, relativně k pracovnímu adresáři;

seg-fa5b15500405 = <c1/>, <c2/> a <c3/> (deg): velikost a roh dlaždice;

seg-09a35655f010 = <c1/> (m, výchozí { "0" }), <c2/> (výchozí 4/3) a <c3/> (m, výchozí { "30" }).

seg-ad58fe7ff627 = Engine vzorkuje profil terénu po ortodromě mezi rušičem a přijímačem a najde dominantní ostrou hranu. Výkon rušiče na vstupu přijímače, a tedy každé J/S, se snižuje o ztrátu jednou ostrou hranou podle ITU-R P.526-15 §{ "4.1" }.

seg-001d7b88b26d = Výsledek získává blok <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) a <c7/> (počet).

seg-b9696f5eda4b = Bez této sekce je každý výstup bajtově shodný.

seg-593b6a5b4480 = Ověřeno proti prahům a deseti umístěním předregistrovaným v 92cd2bfd, na commitnuté skutečné dlaždici SRTM Death Valley, oproti nezávislému přepočtu v numpy. Vše splněno: nejhorší rozdíl { "1.6e-10" } u <c1/> i u ztráty (práh { "1e-9" }), ztráta je monotónní ve výšce rušiče a ztráta snižuje J/S přesně o sebe samu.

seg-62e07defd715 = MODELLED; řádek registru „Terrain shadowing of the jammer in the jamming kind against an independent numpy recomputation on a real SRTM tile“.

seg-378e9052e2c4 = <b>Zisky antény CRPA v druhu jamming</b> (CAP-06a): volitelná sekce <c1/> ve scénáři <c2/>. Pole: <c3/> (polohy prvků v lokálním systému východ-sever-nahoru, m), <c4/> (<c5/> nebo <c6/>) a <c7/> (šumová šířka pásma MVDR, MHz, výchozí dvojnásobek čipové rychlosti).

seg-ca39fefc0fb3 = Každý kanál vytvoří nezkreslující paprsek směrem ke své družici. Šum spoje se škáluje hodnotou <c1/> a rušič hodnotou <c2/> před stávající rovnicí C/N0 pro ochranu proti rušení.

seg-1f1ddc11ad94 = Každý spoj získává blok <c1/>: <c2/> (dB) a <c3/> (dB).

seg-790ecc6a1bd4 = Neplatná sekce (prázdný seznam prvků, neznámé váhování, nekladná šířka pásma) je chyba, a to přes <c1/> a <c2/> i přes <c3/>.

seg-2464d9dde85f = Ověřeno proti prahům předregistrovaným v 08d83b4d. Splněno: aditivita (po opravě: první sestavení přidalo nové jednotky do tabulky jednotek každého běhu jamming); jeden prvek není pole; šumový zisk a efektivní C/N0 oproti nezávislému přepočtu v numpy do { "1e-9" } dB; MVDR se při vysokém JNR blíží nule.

seg-c04495f7a65a = Nesplněno: zisk rušiče MVDR u { "194" } z { "456" } spojů při { "0.36" } přenosné matematice ({ "202" } při matematice hostitele; <c1/>) (nejhorší { "1.7e-6" } dB). Rezidua od −{ "100" } do −{ "188" } dB jsou při tomto prahu pod rozlišením float64 a numpy nesouhlasí sám se sebou ve stejném řádu.

seg-c10e1c72eb15 = MODELLED; řádek registru „CRPA antenna gains in the jamming kind against an independent numpy recomputation“.

seg-0a3adfa7271c = <b>Sledovací engine IQ oproti GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> a GNSS-SDR sledují tytéž nezávislé záznamy GPS L1 C/A v numpy při { "30" } až { "45" } dB-Hz.

seg-cc73857e38e8 = Prahy předregistrované v 48edd4a5. Registrovaná kalibrace selhala na chybném předání GNSS-SDR (F3), takže Amendment { "1" } (1e4288c4) přidává FLL jen pro navázání k oběma přijímačům, commitnuto před jakýmkoli testovacím záznamem.

seg-1d651ff134f9 = Splněno: jitter nosné a kódu a Doppler se shodují v rozmezí { "5" } % při každém C/N0.

seg-bc9c9a0247d1 = Nesplněno: C/N0 NWPR enginu je o { "2.3" }–{ "7.1" } dB pod SNV GNSS-SDR (F4, známé omezení odhadovače; M2M4 je do { "0.06" } dB od pravdy); indikátory zachycení se liší podle definice (F5); jedna nesrovnalost v proklouznutí při { "30" } dB-Hz (F6).

seg-7c32867b5c27 = MODELLED; řádek registru „IQ tracking engine against GNSS-SDR { "0.0.19" } on independent recordings“.

seg-6ba057fab559 = <b>Dva řádky VALIDATED pro kódy vrstvy IQ</b> (DS-GIQ-06b, PRO-39).

seg-55524624777b = <b>BeiDou B1I.</b> Všech { "63" } primárních kódů B1I se shoduje s nezávislým generátorem GNSS-SDR { "v0.0.19" } čip po čipu (práh předregistrovaný v 911106d1). Commitnut je pouze výstup tohoto programu: kódy PRN B1I, které definuje veřejné ICD, jako prefix a hash.

seg-37437a09dd67 = <b>GPS L1C.</b> Všech { "126" } kódů L1CP/L1CD a { "63" } překryvů L1CO se shoduje s kontrolními sloupci, které tiskne IS-GPS-800J, a vypočtená Legendreova posloupnost se shoduje s jeho Table 6.2-1 (prahy předregistrované v fe372e26).

seg-f445784a7f2d = Řádky: „BeiDou B1I primary ranging codes against an independent generator“ a „GPS L1C ranging and overlay codes against the IS-GPS-800J printed check columns“.

seg-001f48d86a3c = <b>Pásma GLONASS, BeiDou a Galileo E6 v modelu spektra</b> (CAP-12, signály): nové názvy pásem <c1/> a <c2/> (libovolný kanál FDMA jako <c3/>, K = −{ "7" } až { "6" }), <c4/>, <c5/>, <c6/>, <c7/> a <c8/>. Každé nese nosnou, modulaci a minimální přijímaný výkon podle svého ICD. Jsou volitelná podle názvu: výchozí sada pásem a všechny stávající výstupy se nemění.

seg-158a6ec19d6b = Ověřeno proti prahům předregistrovaným v 5806f28b: hodnoty ICD, nuly, složený signál B1C a cesta C/N0 jsou splněny.

seg-805092ae8ca2 = Dva prahy splněny nebyly. Práh jednotkové plochy byl tak, jak byl napsán, nedosažitelný (F1). Průběhy B1I a B1C vrstvy IQ se modelu shodují jen po zprůměrování v pásmu kvůli nerovnoměrným čárovým spektrům jejich kódů (F2).

seg-db88f07d97bb = MODELLED; řádek registru „Spectrum model: GLONASS, BeiDou and Galileo E6 bands (opt-in)“.

seg-b0147cf3acc8 = <b>Volba CFAR s průměrováním buněk v akvizici IQ</b> (PRO-37): <c1/> a <c2/> rozhodují na akviziční mřížce porovnáním každé buňky s průměrem referenčních buněk v jejím dopplerovském řádku. Prahová hodnota vychází z pravděpodobnosti falešného poplachu CA-CFAR v uzavřeném tvaru pro <c3/> nekoherentních bloků (<c4/>, <c5/>), takže rozhodnutí nezávisí na normalizaci výkonu vzorků. Je volitelná; výchozí detektor a všechny stávající výstupy se nemění.

seg-a56e74b1e091 = Ověřeno proti prahům předregistrovaným v 3724aefa: uzavřený tvar oproti Monte Carlo ({ "18" } z { "18" } případů) a návrhová míra { "1" } % naměřená na { "0.97" }–{ "1.01" } % na gaussovském a 2bitově kvantovaném šumu.

seg-f88fe97e0ee6 = Jeden práh splněn nebyl: u 2bitového signálu bez šumu { "1.28" } % buněk mimo vrchol překračuje prahovou hodnotu, a to na korelačních postranních lalocích kódu (zjištění F1).

seg-8d88b626c31e = MODELLED; řádek registru „Cell-averaging CFAR option in IQ acquisition“.

seg-d596329195cf = <b>Model scintilace oproti naměřeným datům</b> (PRO-34): Cornellův model scintilace kanálu IQ byl porovnán s naměřenou intenzitou a fází GPS L1 při { "50" } Hz z noci rovníkové scintilace (záznam Zenodo { "16941224" }, INGV, Malindi, CC BY { "4.0" }), s prahy předregistrovanými v b6ccb499. Splněno: rozdělení intenzity a fázová scintilace svázaná s S4. Nesplněno: model je { "2.4" }krát častěji v útlumu pod −{ "10" } dB a { "3.5" }krát déle (zjištění F1). Registrované zpracování čte zabalenou fázi modelu (zjištění F2); výsledek pro fázi platí i s rozbalenou. <c1/> stahuje data. Řádek zůstává MODELLED: „IQ ionospheric scintillation channel (Cornell model) against measured { "50" } Hz GPS L1 scintillation“.

seg-d6740cab2271 = <b>Opravená čtečka vzorků LuGRE</b> (MR-09): <c1/> čte dávku IQ LuGRE s I ve vysokém půlbajtu a úrovněmi mid-rise <c2/> (<c3/>), které odstraňují střední hodnotu −½, kterou nesou holá celá čísla ve dvojkovém doplňku u I a Q. <c4/> dává GNSS-SDR stejné čtení. Obecná čtečka ION a všechny stávající výstupy se nemění: { "149" } výsledků scénářů a jedna studie jsou před a po bajtově shodné a zafixovaná zjištění LuGRE se čtou, jak byla registrována (<c5/>). Žádný řádek registru se nemění.

seg-5adf36c03c14 = <b>Volitelné sledování BOC({ "1,1" })</b> (CAP-07 (a)): <c1/> přeškáluje diskriminátory DLL pro hlavní vrchol sinusového BOC({ "1,1" }) a přidává monitor skoků na vedlejší vrchol (velmi předbíhající a velmi zpožděné korelátory při ±{ "0.5" } čipu, čítače nahoru/dolů, <c2/>), který přesouvá NCO kódu z vedlejšího vrcholu; <c3/> vypisuje skoky. Ve výchozím stavu vypnuto a všechny stávající výstupy se nemění. Ověřeno proti prahům předregistrovaným v 6b68f6cc na syntetickém signálu BeiDou B1C: start na vedlejším vrcholu, který bez volby zůstává { "0.55" } čipu mimo, je s ní jediným skokem v { "0.08" } s přitažen na hlavní vrchol a z hlavního vrcholu nebyl pozorován žádný falešný skok. Jeden práh splněn nebyl: mřížka jednotkového testu pro škálování zasahuje mimo lineární rozsah diskriminátorů (zjištění F1 v <c4/>). MODELLED; řádek registru „BOC({ "1,1" }) tracking: DLL scaling and bump-jump ambiguity resolution (opt-in)“.

seg-89345aa385f7 = <b>Laboratorní fit z kampaní IQ</b> (B7.1, <a1><c1/></a1>). <c2/> scénáře labfit fituje výstupní složku <c3/> v CLI (<c4/>), v Pythonu (<c5/>) a v nástroji labfit MCP (jen složky uvnitř jeho pracovního adresáře). Fituje jednu jednotku pro každý signál, návrh smyčky, řetězec předního stupně a typ rušiče:

seg-1726361b81c4 = model C/N0 oproti uvedenému J/S, s cenzurováním;

seg-e1b8a27b06fd = sledovací práh, přímo i v uzavřeném tvaru;

seg-8dce89923619 = modely zachycení sledovací smyčky a empirický, provázané přes model C/N0, s jejich dobami setrvání;

seg-108646713c97 = bootstrap shluků se seedem přes záznamy, { "90" }% predikční intervaly a hold-outy s vynecháním jednoho záznamu;

seg-ee5deb4d5d4b = předregistrovaná tabulka <c1/>, s hashem, s PASS/FAIL pro každý práh.

seg-4d58263106af = Zpráva je <c1/> jako JSON, CSV a Markdown, s blokem jednotek. <b><c2/> nelze z dat C/N0 identifikovat</b> bez nezávislého měření výkonu. Uvádí se, nikdy nefituje, a fitovaným parametrem je <c3/> (změna návrhu 2026-10-12). Neznámý typ rušiče bere nejškodlivější uvedené <c4/> (cw, { "1" }). Na syntetických kampaních z vlastních scén Kshana prahová hodnota pokrytí hold-outu (c) projde. Prahy <c5/> (a') a (b') ({ "0" } z { "50" } pokrytých kampaní) a práh uzavřeného tvaru prahové hodnoty (d) splněny nejsou: jsou zaznamenány se svými hodnotami. MODELLED; řádek registru „Calibration of the open receiver's C/N0 and lock models to IQ campaign results, with stated prediction error“. Cesta labfit ze záznamu přijímače a její výstupy se nemění.

seg-308d19be658d = <b><c1/> na jádru JPL</b> (CAP-31): <c2/> bere každé těleso, které SPK obsahuje (s de440s: Merkur, Venuše, Zemi, Měsíc), z jádra, štítek <c3/>, a blok <c4/> přidává jen tehdy, je-li nastaveno. Nový řádek, VALIDATED proti SPICE (předregistrováno f8e946ea; nejhorší { "3.3e-5" } m, { "1.0e-11" } m/s). Výchozí zpráva se nemění.

seg-fe16c24eae60 = <b>Porkchop na efemeridách DE440</b> (CAP-20b): <c1/> prochází C3 a příletové V∞ na heliocentrických stavech z DE440 SPK. Nový řádek, VALIDATED proti stavům SPICE

seg-a8632f3c86e9 = pykep { "3.0.1" } (předregistrováno 2d857fb1; Země–Mars 2026-2028, { "304" } buněk, nejhorší { "2.6e-14" }, táž buňka s minimálním C3).

seg-266cffab38a7 = <b>Negravitační makromodel LRO: NOT MET</b> (DS-LRO-10, předregistrováno e82047e2). <c1/> (volitelné přes <c2/>): přímé sluneční záření na ploché desky se stínem Měsíce, panel sledující Slunce a lunární albedo a tepelné IR; <c3/> je označená obecná aproximace LRO z publikovaných údajů (bez desek sběrnice: tabulku desek se nepodařilo získat). Na { "4" } h oblouku LRO ponechává RMS redukovaně dynamického řešení na { "6.668" } m a dynamického na { "11.94" } m, s nevěrohodným faktorem záření (asi +{ "21" } / −{ "22" }), takže všechny tři prahy jsou nesplněny. Zjištění je zafixováno testem a žádný výchozí výstup se nemění (<c4/>). Volitelné lunární SRP typu dělová koule nyní používá kuželový stín Měsíce místo stínu Země (<c5/>).

seg-e4ed6e0e5048 = <b>Lunární OD: volitelný pevninový příliv k2 a selenocentrická relativita</b> (DS-LRO-11), ve výchozím stavu vypnuto (<c1/>, <c2/>); přepínač <c3/> pro křížovou validaci ANISE (DS-LRO-04); fixture { "24" } h oblouku LRO a pouze informativní fit dlouhého oblouku (DS-LRO-09). Informativní běhy jsou zaznamenány v <c4/>; žádné zveřejněné číslo se nemění.

seg-b065138adba8 = <b>NRHO CR3BP { "9" }:{ "2" } oproti CAPSTONE</b> (CAP-29d): nový řádek MODELLED měřící kruhovou omezenou NRHO enginu oproti skutečně prolétané dráze CAPSTONE (JPL Horizons, March { "2023" }; předregistrováno { "4e868170" }): perioda { "1.07" } %, apolunium { "0.05" } %, perilunium { "4.1" } % od středních hodnot CAPSTONE, v rámci registrovaných prahů { "3" } / { "5" } / { "20" } %. Měření, nikoli validace.

seg-954bd2771180 = <b>Rotující stavy CR3BP do ICRF se středem v Měsíci</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> mapují bezrozměrný rotující stav soustavy Země–Měsíc na okamžitou přímku Země–Měsíc podle DE440, včetně rychlosti soustavy mimo rovinu. Nový řádek, VALIDATED proti dvouvektorové soustavě SPICE (předregistrováno 2313eb1b, změněno před jakýmkoli během d5ef79b3; { "72" } případů, nejhorší { "1.8e-7" } m a { "1.2e-9" } m/s).

seg-14599ab79300 = <b>Členové rodin CR3BP oproti JPL Three-Body Periodic Orbits API: NOT MET</b> (RM-35, předregistrováno a9074f65). <c1/> (korekce halo, NRHO a DRO, index stability monodromie, pseudo-obloukové pokračování) se shoduje u { "54" } z { "58" } členů API v každém prahu (stav, perioda a Jacobiho konstanta do { "1e-10" } všude). Jeden index stability halo L1 ({ "9.5e-2" }) a tři uzavření malých DRO ({ "1.5e-8" } až { "3.3e-8" } oproti { "1e-8" }) práh nesplňují, takže modul je <c2/> a žádný řádek jej netvrdí. Výsledky: <c3/>.

seg-0cd0e67a2e28 = <b>Volitelná lunární orientace a prostředí podle DE440</b> (FUT-05, DS-LRO-08; výchozí nastavení beze změny): <c1/>, <c2/> / <c3/> (ukotveno k epoše, hlavní osy DE440) a <c4/> (vložená orientace DE440 PA plus geocentrické Slunce a Měsíc z uživatelem dodaného DE440 SPK). Oproti ANISE (předregistrováno ea537710): orientace do { "3.5e-7" } rad a fity LRO do { "1" } mm, ale větev efemerid svůj práh nesplnila (Slunce { "30.7" } m, Měsíc { "1.1" } m, časový posun ~{ "1" } ms na straně ANISE), takže to není ověřený řádek. Výsledky: <c5/>.

seg-92cc171c69da = <b>Datum kampaně lunární soustavy, práh NumPy škálovaný podle podmíněnosti: NOT MET</b> (předregistrováno b887eb05; zůstává MODELLED). Krok { "0" } vylučuje záložní pseudoinverzi jako příčinu mezery { "0.30" } při odhadu stanic; NumPy se v rámci prahu shoduje u šesti z osmi scénářů, ale stations_estimated jej nesplňuje ({ "6.8e-6" } oproti { "5.9e-7" }) a na nové datum 2026-12-01 nepozorovaný maják na jižním pólu činí informační hodnost majáku deficitní, což nezměněné orákulum nedokáže vyhodnotit. Výsledky: <c1/>.

seg-8d2f1e9708ff = <b>Datum lunární soustavy ze skutečné pozorovací kampaně (analytický Měsíc) VALIDATED</b> na nových normálních bodech EDC z { "2025" } (předregistrováno 31f5283 před stažením kteréhokoli): nezměněné orákulum SPICE a NumPy se shoduje v účetnictví, hodnostech a nulové vazbě a do { "1.11e-3" } na sigmách (práh { "1e-2" }), { "8.95e-4" } na podmíněnosti a { "1.79e-3" } na poměrech napříč/podél (práh { "2e-2" }). Pouze kontrola (Library) výpočtu kovariance; prahy modely Měsíce nerozlišují. Výsledky: <c1/>.

seg-058d7d490111 = <b>Orientace podle IAU a GM čtrnácti přidaných těles Sluneční soustavy</b> vyčleněné z řádku „Physical constants of every solar-system body“ do řádku VALIDATED (předregistrováno 154bc54): <c1/> se shoduje se SPICE <c2/> na pck00011 do { "1e-9" } rad na { "574" } maticích v původních epochách a na { "574" } v { "41" } nových epochách, které nebyly dříve porovnány (nejhorší Phobos { "1.38e-10" } rad), a <c3/> se rovná gm_de440 u všech čtrnácti těles. Zbytek původního řádku (J2, střední poloměr, zpráva) zůstává MODELLED. Výsledky: <c4/>.

seg-56c445aa8d9e = <b>Lambert s více oběhy</b> (<c1/>): každé řešení až s třemi oběhy, obě větve. Nový řádek registru, VALIDATED proti pykep { "3.0.1" } (předregistrováno a75de851; { "382" } případů, { "1058" } řešení, nejhorší rozdíl rychlosti { "1.6e-13" } oproti { "1e-8" }). Vnitřní hlídač přistání Keplerovy rovnice našel jedno omezení <c2/> na oblouku s e = { "0.994" }; je zaznamenáno v <c3/>.

seg-b62dc38b09e9 = Tlak slunečního záření pro box-wing a ECOM2 (DS-PA-14), volitelně.

seg-fd50e846d10e = <c1/>: model box-wing z plochých desek s tabulkami Galileo FOC/IOV z metadat družic GSC, v nominálním řízení stáčení GNSS, s faktorem záření a parciálními derivacemi po panelech, a empirický model ECOM2 s jeho parciálními derivacemi. Volí se pomocí <c2/> / <c3/> (pole <c4/>, výchozí <c5/>: cesta dělové koule a všechny golden soubory se nemění); je-li nastavena sada box-wing, <c6/> je její faktor záření. Porovnáno s Orekit { "12.2" } podle předregistrace (<c7/>): každý práh splněn, relativně asi { "1e-15" }; VALIDATED jako vyhodnocení modelu, predikce SRP Galileo zůstává MODELLED.

seg-fd7a7fe09705 = <b>Stín SRP zploštělé Země a okrajové ztemnění Slunce (FUT-09, RM-11).</b> Nový modul <c1/>: <c2/> (okultující elipsoid WGS-84), <c3/> (Eddingtonův zákon) a <c4/>, volitelné pomocí <c5/> (výchozí: stávající sférický kuželový stín, beze změny); <c6/>. Stín zploštělé Země se shoduje s poměrem osvětlení Orekit { "12.2" } do { "7.4e-9" } na { "2400" } geometriích (VALIDATED, <c7/>); okrajové ztemnění nemá vnější orákulum (MODELLED).

seg-f09d4b831dfe = Termosféra NRLMSISE-00 (FUT-08, RM-10, DS-PA-13).

seg-1f838a403840 = <c1/>: port <c2/> a <c3/> (přepínače, režimy denního Ap a 3hodinového pole ap) z C verze NRL Fortranu ve veřejné doméně. Je bitově shodný s tímto portem v C a do { "1.9e-6" } relativně od pymsis { "0.13.0" } (NRL Fortran, jednoduchá přesnost) na mřížce 720 bodů a reprodukuje { "17" } zveřejněných testovacích případů (VALIDATED; <c4/>). Tím se ověřuje port, nikoli přesnost modelu oproti naměřené hustotě.

seg-9e8e9018dbaf = Volitelná úroveň hustoty odporu NRLMSISE-00.

seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> a <c4/>. Statický exponenciální model zůstává výchozím, bit po bitu. Kosmické počasí je konstantní pro každý model. VALIDATED na úrovni oběžné dráhy oproti vlastnímu odporu NRLMSISE-00 v Orekit { "12.2" } po { "24" } h (nejhorší { "0.03" } m oproti posunu odporem až { "142" } km; <c5/>).

seg-b1b2ac9ac91e = Volitelné Slunce a Měsíc z DE440 v propagátoru Cowell (RM-33, FUT-10).

seg-4f323703b251 = <c1/> bere libovolný <c2/> (např. DE440 <c3/>) pro členy třetího tělesa a SRP; odmítne poskytovatele, který nemůže obsloužit epochu, počítá návraty k analytické řadě a je ve výchozím stavu vypnuto. <c4/> zachovává dvoudílnou přesnost. Oproti Orekit { "12.2" } na jeho vlastní čtečce DE440 se oběžné dráhy { "24" } h shodují do { "0.017" } m; předregistrovaný práh polohy Slunce/Měsíce splněn nebyl ({ "6.4" } m / { "0.24" } m; SPICE ukazuje stejnou mezeru), takže MODELLED (<c5/>).

seg-6ac7f3f65b33 = Volitelný atmosférický příliv S1 (DS-PA-03).

seg-35da1ed0dc83 = <c1/> a <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Table { "1" } model N1, stupně { "2" }–{ "6" }), zapínané pomocí <c3/> na <c4/> a <c5/>; ve výchozím stavu vypnuto. MODELLED (koeficienty znovu zkontrolovány proti zveřejněné tabulce; žádné vnější orákulum pro účinek síly).

seg-c62d816a93cf = Dávkové určování oběžné dráhy z rychlosti změny vzdálenosti a azimutu/elevace s elevační maskou (RM-36, FUT-13).

seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (variační STM s analytickými parciálními derivacemi dvou těles + J2), <c5/>, <c6/>; <c7/>. Cesta jen podle vzdálenosti se nemění. Porovnáno s dávkovými nejmenšími čtverci Orekit { "12.2" } na { "8" } předregistrovaných scénářích: každý práh splněn kromě shody stavu bez šumu (≤ { "1" } cm), nesplněné u { "2" } ze { "4" } scénářů při { "1.46" } a { "1.74" } cm, přičemž kshana je do { "1e-8" } m od pravdy; zaznamenáno, MODELLED.

seg-223f1e39669f = Vážení podle přesnosti SP3 (DS-PA-06).

seg-b5560ff1c426 = <c1/> a <c2/> mapují kódy přesnosti z hlavičky a z jednotlivých záznamů na sigmy pozorování; vedle nezměněných zaznamenaných běhů je přidána varianta fitu Galileo vážená podle SP3 (3D RMS Tier-2 { "0.035" } m oproti { "0.070" } m bez vážení). MODELLED.

seg-831d35c5f97e = <b>Úloha pro spuštění celého oblouku Swarm-A (DS-PA-08)</b> v <c1/>.

seg-cc5e8af7cb0d = Planetární gravitace z tabulek PDS SHADR (CAP-30, část CAP-31).

seg-bc9149c18ea8 = <c1/> (<c2/>) čte Mars GMM-3 (d/o { "120" }) a GRAIL GL0660B (d/o { "660" }); <c3/> připojí libovolné načtené pole (výchozí nastavení beze změny). Výřezy stupně 20 jsou přibaleny (NASA PDS, veřejná doména; <c4/>); úplné soubory stahuje <c5/>. VALIDATED proti pyshtools { "4.14.1" } (do { "4e-15" } celkové gravitace při d/o { "120" } přes celou sféru, { "5e-14" } při d/o { "660" } pro |lat| ≤ { "60" }°); napojení na soustavu tělesa zůstává MODELLED (nativní soustava každého pole není použitá soustava IAU).

seg-afb5fbf86ffc = Gravitace vysokého stupně až do stupně { "2190" } (RM-14, FUT-07).

seg-28bc597b06b2 = <c1/> / <c2/> (Holmesův–Featherstoneův upravený dopředný sloupec, bez podtečení, bez polární singularity), <c3/>, streamovací zavaděč ICGEM <c4/> / <c5/> (kontroly normy a maximálního stupně, zaznamenaný systém slapů, časově proměnné členy odmítnuty) a <c6/> (úplný EGM2008, připnutý SHA-256, nepřibalený; testy podmíněné <c7/>). <c8/> jej volí u volitelného <c9/>. Shoduje se s Orekit { "12.2" } do { "7.3e-17" } m/s² až do stupně { "2190" } a oběžná dráha { "24" } h { "200" }×{ "200" } se shoduje do { "0.13" } m. MODELLED: pyshtools nesplnil předregistrovaný práh poblíž pólu (vystopováno k pyshtools) a kontrola citlivosti dráhy na stupeň 70 nebyla splněna ({ "0.73" } m < { "1" } m); obojí je zaznamenáno v <c10/>.

seg-4ef4f74f21c1 = Integrátor DOP853 (FUT-11).

seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (hustý výstup 7. řádu), <c4/>, <c5/>, s ochranou kroku, která při selhání uzavírá; <c6/>, <c7/>, <c8/>. Výchozí ovladač se nemění. VALIDATED proti SciPy { "1.18.1" } <c9/>: jednotlivé kroky do { "5.6e-15" }, shodné posloupnosti kroků, koncové stavy do { "1.6e-12" } (<c10/>).

seg-d36f657f93ad = <b>Robustní řešič Keplerovy rovnice (FUT-12).</b> Nový modul <c1/>: <c2/> (startér Markley { "1995" }, rezidua bez zrušení) pro všechna { "0" } ≤ e < { "1" }, obalený <c3/>. VALIDATED proti kořenům mpmath s 50 číslicemi na { "0.9" } ε·|E| až do e = { "0.999999" } (<c4/>).

seg-5e82deb7c853 = Volitelná tesserální gravitace Země v propagátoru Cowell (RM-09).

seg-e1a7ad42211e = <c1/> získává <c2/> (<c3/>, <c4/>). Vyhodnocuje <c5/> (přibalený EGM2008 do stupně/řádu { "70" } nebo libovolný ICGEM <c6/>) v soustavě pevné vůči Zemi, k níž se dojde úhlem rotace Země (<c7/>) nebo řetězcem CIO GCRS–ITRS (<c8/>). Výchozí <c9/>: žádný stávající výstup se nemění. VALIDATED proti Orekit { "12.2" } Holmes–Featherstone po { "24" } h ({ "6" } případů, nejhorší { "0.036" } m), s prahy předregistrovanými v <c10/>.

seg-957686bb351e = <b>Dvoudílná juliánská data při rotaci Země na dráze oběžné dráhy</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> a <c6/>, převody <c7/> mezi <c8/> a <c9/> a volitelné <c10/> pro scénář <c11/> (ECEF, pozemní stopa a pohled ze stanice; ve výchozím stavu vypnuto a beze změny, a klíč je při vypnutí z hashe scénáře vynechán). Nový řádek registru, VALIDATED proti pyerfa <c12/>/<c13/> (předregistrováno b10475ee; { "40" } dat: GMST bitově shodné, matice do { "2.7e-14" }, rotace po krocích { "1" } µs do { "1.1e-14" } rad, kde cesta s jediným <c14/> tyto meze nesplňuje). Epocha silového modelu Cowell zůstává s jediným <c15/>; důvod je v její dokumentaci.

seg-0680b1f4c98b = <b>Predikce EOP za hranicí tabulky</b> (<c1/>, <c2/>): volitelné rozšíření řady orientace Země IERS prediktorem LS+AR vydaným na jejím posledním řádku, takže argumenty soustavy pozdější epochy sledují předpověď místo ořezání na poslední řádek. Odpovědi uvnitř tabulky jsou bitově shodné (testováno); řada se nadále ořezává, pokud se toto nezavolá. Přesnost předpovědi zůstává stávajícím zjištěním LS+AR oproti Bulletinu A (MODELLED).

seg-a7d272a1ddd6 = <b>Posuny nebeského pólu dX, dY na řetězci CIO</b> (<c1/>) a přímé kontroly vektorů ERFA pro <c2/>, <c3/> a novou funkci. Nový řádek registru, VALIDATED proti pyerfa (předregistrováno 979c1e39; { "40" } epoch { "1950" }–{ "2100" }: precese a CIO bitově shodné, TEME→GCRS do { "1.1e-10" } rad, což je předpovězený účinek dvoučlenné řady rovnice ekvinokcií). Stávající funkce se nemění.

seg-20d19a2d65ec = <b>UTC před rokem 1972 na dvoudílné časové cestě</b> (<c1/> a <c2/>, <c3/> a <c4/> od 1960-01-01): éra s měnící se rychlostí („gumová sekunda“), s tabulkou driftu SOFA, zlomkovými skoky na konci dne a přeškálováním zlomku dne z UTC na SI. Nový řádek registru, VALIDATED proti pyerfa <c5/>/<c6/>/<c7/> (předregistrováno 23c40661; { "117" } okamžiků { "1960" }–{ "1971" }, nejhorší { "2.9e-11" } s oproti prahu { "1" } µs). Každý výsledek od { "1972" } je bitově shodný (kontrolní součet připnut před změnou). Před { "1960" } je TAI − UTC { "0" }, jako v SOFA. Cesta <c9/> s jediným <c8/> se nemění.

seg-3ff0d080d9e6 = <b>Vysílané hodiny družice GLONASS</b> (<c1/>): <c2/> ze záznamu RINEX, v čase čteném na hodinách družice (dvě iterace s pevnou řádovou čárkou, konvence RTKLIB). Dříve nepoužívané parsované <c3/> a <c4/>. Nový řádek registru „GLONASS broadcast satellite clock and broadcast-orbit propagation“, VALIDATED proti RTKLIB 2.4.2-p13 <c5/>/<c6/> (předregistrováno e099c42a; { "292" } případů na skutečném vysílaném souboru z { "2013" }: rozdíl hodin { "0" } s, nejhorší poloha { "1.1" } mm oproti prahu { "1" } cm). Knihovní funkce; žádný výstup scénáře se nemění. Neprovádí se žádná transformace PZ-90.11 → ITRF a modul to uvádí.

seg-71ae2ee163e0 = <b>Časové řešení PPP oproti hodinám stanice IGS</b> ({ "0.36" }, FUT-19): hodiny přijímače float filtru PPP na WTZR se shodují s finálními kombinovanými hodinami IGS pro stanici na { "0.075" } ns (směrodatná odchylka) s konstantním posunem −{ "0.66" } ns za konvergované dvě hodiny. Prahy byly předregistrovány v <c1/>. VALIDATED (nový řádek registru). Nová fixture <c2/>, záznamy hodin stanice z finálního souboru hodin IGS, který se již používal pro hodiny družic.

seg-463ac67600b1 = <b>Shoda PPP s gLAB</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } byl spuštěn na týchž vstupech WTZR jako samostatný nástroj (jádro Apache-2.0; kontrolní součet stažení ověřen proti zveřejněnému seznamu), s příkazovým řádkem procedurální změny commitnutým před během. Při prvním registrovaném běhu se float PPP Kshana a gLAB shodují do { "0.05" } m v { "240" } z { "240" } epoch a na { "5.0" } mm v poslední. Práh SPP nebyl splněn (medián { "1.187" } m oproti { "0.50" } m) a je zaznamenán jako zjištění: vlastní řešení SPP gLAB a RTKLIB se od sebe liší o { "0.852" } m. Registrované pravidlo proto ponechává obě větve nástrojů jako celek nesplněné, zatímco shoda PPP platí.

seg-158717c78c80 = <b>Čtení navigačních dat RINEX { "4" }</b> ({ "0.36" }, WP-07, PRO-41): <c1/> čte navigační soubory RINEX 4.00-4.02 (<c2/> GPS LNAV, Galileo I/NAV a F/NAV, BeiDou D1/D2, QZSS LNAV; ostatní záznamy se přeskakují až k hlavičce dalšího záznamu) a <c3/> přijímá volby. VALIDATED proti sloučenému souboru IGS RINEX { "3" } téhož dne: každé dekódované pole shodné a { "0" } m v poloze. Čtení RINEX 2/3 se nemění.

seg-57aa5c6ef4f8 = <b>Vysílané polohy BeiDou GEO</b> (volitelně): <c1/> a <c2/> (BDS ICD, sklon −{ "5" } stupňů). <c3/> GEO stále přeskakuje. MODELLED: předregistrované porovnání s přesnou oběžnou dráhou je podmíněno daty a dosud nebylo spuštěno.

seg-416f58111d1f = <b>Pozorovací soubory RINEX { "4" }</b>: skutečný pozorovací soubor RINEX { "4.00" } MGEX se v testech čte (MODELLED, shoda s formátem).

seg-64b4664c0ff6 = <b>RTK s LAMBDA na skutečném RINEX</b> ({ "0.36" }, WP-07 ★): <c1/>, dvojité diference krátké základny dvoufrekvenčního kódu a fáze GPS s float Kalmanovým filtrem a celočíselným fixováním LAMBDA (test poměru). VALIDATED na stanicích IGS WTZR a WTZZ ({ "1.4" } m od sebe) oproti jejich základně ITRF2020 s předregistrovanými prahy: fixováno v každé epoše po prvních deseti minutách, medián chyby základny { "4.5" } mm a 95. percentil { "5.5" } mm.

seg-69db4437ebbb = <b>Shoda PPP na skutečných datech s RTKLIB</b> (RM-31): <c1/> a <c2/> s předregistrovanými prahy. PPP RTKLIB v2.4.2-p13 na týchž vstupech WTZR se s Kshana shoduje do { "5" } cm v každé epoše posledních dvou hodin ({ "9.7" } mm na konci) při třetí registraci; první dva běhy, zaznamenané jako zjištění, měly vypnutý pevninový příliv a anténu přijímače v základním slotu RTKLIB. Práh shody jednobodového řešení nebyl splněn (medián { "1.09" } m oproti { "0.5" } m). Větev gLAB dosud nebyla spuštěna (podmíněno daty).

seg-fb6e053a0a9d = <b>Kodéry navigačních zpráv nad rámec LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> kóduje GPS CNAV (typy zpráv { "10" }, { "11" }, { "30" }; CRC-24Q; kontinuální kódování s rychlostí 1/2 a K={ "7" }), Galileo I/NAV (typy slov 1-5 v sudých/lichých nominálních stránkách; prokládač 30x8; synchronizace <c2/>) a Galileo F/NAV (typy stránek 1-4; prokládač 61x8; synchronizace <c3/>), s testovacími dekodéry. MODELLED: zpáteční cesty a známé odpovědi ICD; předregistrovaná kontrola, že vysílané efemeridy Galileo leží na mřížce LSB kodéru, platila (nejhorší { "3.6e-3" } LSB), ale nesplnila práh počtu družic ({ "15" } z { "20" }), zaznamenáno. Kodéry jsou knihovní funkce; zapojení do scény není součástí této změny.

seg-562f36eb18e6 = <b>Čtečka souborů IONEX</b> ({ "0.36" }, WP-07): <c1/> s <c2/>, <c3/>, <c4/>, <c5/> a <c6/>: přísná čtečka IONEX { "1.0" } s pevnými sloupci, s epochami počítanými ode dne první mapy, <c7/> čtené jako chybějící, mapy RMS a časové interpolace formátu nejbližší, po sobě jdoucí a s rotovanou mapou; šikmé TEC ve výšce vrstvy z hlavičky. Ověřeno na commitnuté syntetické mapě a, podmíněně daty (stahováno za běhu testu s připnutým SHA-256, nepřibaleno), na výřezu skutečného CODE GIM: každý uzel přesný; interpolace se shoduje se vzorcovou referencí do { "4e-13" } TECU. <c8/> v RTKLIB se shoduje do { "3.6e-13" } TECU v { "6885" } bodech (předregistrováno B6). VALIDATED na důkazech podmíněných daty (rozhodnutí vlastníka, 2026-10-13): test selže na jakékoli jiné mapě než té s připnutým SHA.

seg-9fac2e8535c8 = <b>Vyhlazování nosné podle Hatche</b> ({ "0.36" }, WP-07): <c1/> a <c2/>, tvar bez divergence (bez ionosféry) v sestavení přesného jednobodového řešení. MODELLED se zaznamenaným zjištěním: na stanici IGS WTZR snižuje medián chyby jednobodového řešení z { "1.55" } m na { "1.12" } m a 95. percentil z { "3.47" } m na { "3.21" } m, což nedosahuje předregistrovaného snížení o { "40" } % (zbývající chyba je typu zkreslení, nikoli šum).

seg-7e4c7639d102 = <b>Float PPP na skutečném RINEX</b> ({ "0.36" }, WP-07): <c1/>, statický float filtr přesného určování polohy bodu na skutečném dvoufrekvenčním kódu a fázi GPS s finálními produkty IGS (posuny a variace antén, pevninový příliv, phase wind-up, Shapirovo zpoždění, odhadované vlhké zpoždění, detekce proklouznutí cyklu), s <c2/>. VALIDATED na zadržené stanici IGS WTZR oproti její souřadnici ITRF2020 s předregistrovanými prahy: po { "6" } h je chyba { "1.5" } mm horizontálně a { "2.9" } cm vertikálně a každá epocha posledních dvou hodin je do { "10" } cm.

seg-173aa308e3e8 = <b>Interpolace přesných hodin SP3</b> ({ "0.36" }, WP-07): <c1/> a <c2/> lineárně interpolují tabelované hodiny družic SP3 mezi dvěma sousedními platnými uzly (hlídací hodnota chybných hodin se přeskakuje) a <c3/> je předává do <c4/>, takže přesný řetězec běží ze samotného SP3. VALIDATED proti finálním hodinám IGS po { "30" } s z 2025-02-24 s předregistrovanými prahy: { "32" } družic GPS, RMS v polovině intervalu { "0.121" } ns (práh { "0.15" } ns), 95. percentil { "0.265" } ns (práh { "0.30" } ns).

seg-e7c4e88d4ba4 = <b>RAIM vedle ukazatelů kvality holdoveru hodin</b> (CAP-05b): volitelná sekce <c1/> u druhu clock uvádí samostatný blok <c2/> (okamžikové RAIM na přednastavené obloze z uvedeného místa: verdikt a ochranné úrovně pro každou epochu, dostupnost; nedostupné, dokud je GNSS odepřeno, nikdy se neextrapoluje). Ukazatele holdoveru se nemění; bez sekce je výstup bajtově shodný. MODELLED.

seg-99d9a67fc2f3 = <b>Prahy důvěry v přijímač kalibrované na JammerTest { "2024" }</b> (CAP-13): předregistrovaná kalibrace monitorů poklesu C/N0, AGC a indikátoru rušení na veřejné datové sadě JammerTest { "2024" } (stahované za běhu, nikdy nepřibalené; <c1/>), dodávaná jen jako volitelné <c2/> ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Zadržená data: prahy AGC, indikátoru rušení a sjednocení projdou; práh falešných poplachů C/N0 neprojde ({ "0.023" } oproti { "0.02" }), takže řádek je MODELLED (<c3/>). Výchozí nastavení a výstupy bez profilu se nemění.

seg-8ccd18c54b4b = <b>Hypotézy poruch ARAIM s více družicemi</b> (CAP-05a): pravidlo podmnožin ADD v4.2 zobecněné nad rámec dvojic (<c1/>, <c2/>; řád { "2" } je přesně stávající cesta kontrolovaná MAAST) a volitelný pokročilý RAIM nad těmito hypotézami (<c3/>), který při zjištění poruchy uvádí podmnožinu s největším oddělením. Apriorní hodnoty vyžadující hlubší podmnožiny se odmítají, nikdy neořezávají. MODELLED.

seg-02f1f2d72263 = <b>Skyline v důvěře v přijímač</b> (FUT-01): relace receiver-trust může uvést <c1/>; družice za ním jsou ztraceny pro oblohu (<c2/>, <c3/>, <c4/>) a jejich ztráty se zařazují jako <c5/>, nikdy jako <c6/>; bez něj jsou záložní postup podle mezer v azimutu a všechny výstupy jako dříve. Generátor tréninku posádek získává událost <c7/> (zablokovaná obloha, nikoli interference) a scénář <c8/>. Monte Carlo UERE x DOP získává dvě geometrie s maskovaným skylinem z návrhové poznámky, předregistrované samostatně: všech { "26" } kontrol projde.

seg-69fa2ecdc4e9 = <b>Ověřování časových razítek RFC { "3161" }</b> (CAP-14): <c1/> offline kontroluje podpis tokenu časového razítka (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 a P-384), vazbu jeho podpisového certifikátu ESS, použití podepisovatele pro timeStamping a jeho řetěz k důvěryhodné kotvě v genTime tokenu; <c2/> to aplikuje na <c3/> balíčku (volitelné; bez toho se zpráva nemění). VALIDATED, úzce: všech { "27" } vlastních vygenerovaných případů se shoduje s OpenSSL { "3.0.13" } ve verdiktu a genTime, podle porovnání předregistrovaného před napsáním ověřovače. Odvolání se nekontroluje.

seg-1b7777e600a8 = <b>Úrovně ověření podle hodnot pro každý druh</b> (RM-04): výsledek každého druhu scénáře nyní končí blokem <c1/>, který jmenuje jeho hlavní hodnoty, řádek verifikační matice, který každou z nich vlastní, a úroveň přečtenou z tohoto řádku (hodnoty, které žádný řádek nevlastní, jsou uvedeny jako bez úrovně). Blok se připojuje po běhu a lze jej odebrat zpět na předchozí dokument bajt po bajtu (<c2/>). <c3/> nemá <c4/>, dokud novou datovanou předpovědí nenahradí svou zmrazenou; <c5/>, <c6/>, <c7/> a <c8/> nemají skalární hlavní hodnotu a <c9/> zapisuje kompaktní JSON. Členové kampaní si ponechávají své dokumenty bez úrovní.

seg-54aec3e311cf = <b>Kvantová předvolba <c1/></b> (CAP-08c): přibalený inerciální scénář, v němž akcelerometr s interferometrem studených atomů, specifikovaný fyzikou interferometru (<c2/> s uvedenou úrovní vibrací platformy), dobíhá proti křemennému akcelerometru navigační třídy při výpadku GNSS dlouhém 110 minut. MODELLED.

seg-21d2b7fd2a21 = <b>Přesné ekvivalentní stupně volnosti podle Greenhalla</b> (CAP-03): <c1/>, úplný algoritmus Greenhalla a Rileyho ({ "2003" }) (řády diferencí { "1" } až { "3" }, exponenty šumu +{ "2" } až -4, překrývající se i nepřekrývající se, modifikované i nemodifikované, s tabulkami pro velké J), s obaly ADEV, MDEV a HDEV. VALIDATED při předregistrovaném porovnání s allantools { "2024.6" }: { "4 876" } bodů mřížky do { "6.0e-13" } relativně; allantools selhává v { "32" } dalších bodech, které jsou zaznamenány bez hodnoty orákula. Intervaly spolehlivosti <c2/> se nemění ani o bit.

seg-8e04ebc15045 = <b>Chybové členy interferometru studených atomů</b> (RM-26/27/28): fázový šum laseru Raman (se členem zpoždění zpětného odrazu), zkreslení zakřivením vlnoplochy tepelného oblaku (čistý defokus, s poloměrem detekce) a řešení nejednoznačnosti proužků (podporované klasicky a se dvěma dobami dotazování), jako knihovní funkce v <c1/>, každý uzavřený tvar ověřen kvadraturou nebo Monte Carlo. MODELLED; zatím nedosažitelné z druhu scénáře (<a1><c2/></a1>).

seg-7d2899c3173b = <b>Formáty logů hodin</b> (RM-03): <c1/> čte soubory hodin RINEX, ASCII logy fáze nebo frekvence ve stylu TimeLab a logy čítače TAPR TICC do jedné normalizované řady fáze (tau0 uvedeno nebo nalezeno, mezery spočítány, politika mezer). Volitelné: řada telekomunikačního časování může uvést log (<c2/>) a tabulka <c3/> scénáře clock přidává blok <c4/> (ADEV, TDEV, MTIE). Bez tabulky jsou oba druhy bajtově shodné (<a1><c5/></a1>). Předregistrované porovnání na třech syntetických lozích splnilo své prahy fáze a zapojení; odhadovače se shodují s allantools do { "2.5e-14" } všude, kde je vyhodnocuje, a bod MTIE přes celý záznam nevyhodnocuje (zaznamenáno). MODELLED.

seg-53369a5c3749 = <b>Masky vandru pro synchronizaci frekvence</b> (RM-01): druh <c1/> získává sedm masek generování vandru MTIE a TDEV při konstantní teplotě, ITU-T G.811 PRC, G.812 Types I až III, G.8262 EEC Options { "1" } a { "2" } a G.8262.1 eEEC, s mocninnými částmi, jak je tabulky zapisují, a referenční scénář <c2/> (volně běžící OCXO proti maskám EEC: selže při { "1 000" } s, kde musí práci odvést smyčka). Každý řádek byl znovu přečten proti textu na itu.int; G.812 (06/2004) je nahrazeno předpublikovaným vydáním 08/2026, které nebylo možné přečíst. MODELLED (přepis); stávající masky a výstupy se nemění.

seg-5e84b35ee4e7 = <b>Pokyny k apriornímu filtru pro druh <c1/></b> ({ "0.36" }, WP-09, zjištění RM-21): výchozí apriorní filtr balíčku je vhodný pro IMU taktické třídy. S IMU navigační třídy může výchozí nastavení způsobit, že fúzovaný dobeh bude horší než volné INS: { "52" } m oproti { "11" } m na profilu letadla { "70" } m/s. Nastavte <c2/> podle třídy senzoru, jako to dělají nové námořní, železniční a letecké balíčky. Žádný přibalený scénář nespojuje IMU navigační třídy s výchozím apriorním filtrem: každý, který používá výchozí, má rezidua zkreslení akcelerometru alespoň { "0.015" } m/s². Pouze dokumentace; žádný výstup se nemění.

seg-f74b3c265f3a = <b>Export testovacího stendu ověřený vlastními čtečkami simulátoru</b> ({ "0.36" }, WP-09, CAP-16): soubory pohybu <c1/> z { "8" } přibalených scénářů byly zpětně přečteny čtečkami gps-sdr-sim pro NMEA, zeměpisnou šířku/délku/výšku a pohyb vůči Zemi (MIT, commit 28ca29a6, použito jako samostatný nástroj přes <c2/>; nevolá se žádná signálová funkce). Vracejí exportovanou trajektorii na { "1.2" } mm, { "0.15" } mm a přesně. ZJIŠTĚNÍ: čtečka pohybu vůči Zemi tohoto simulátoru nemůže přijmout CSV plné šířky, protože jeho 100znakový řádkový buffer každý řádek rozdělí. <c3/> nyní uvádí řezy sloupců, které použít, a strop simulátoru { "300" } s. VALIDATED (nový řádek registru); bajty exportu se nemění.

seg-e77e1ac87dd5 = <b>GNSS/INS na datové sadě KF-GINS</b> ({ "0.36" }, WP-09, FUT-17): zavaděče a běhoun <c1/> a model měření páky v uzavřené smyčce EKF. Na ukázkové datové sadě KF-GINS (stahované za běhu testu, nepřibalené) je horizontální RMS Kshana oproti referenční trajektorii { "1.09" } cm oproti vlastním { "1.11" } cm KF-GINS a každý předregistrovaný práh platil. VALIDATED na důkazech podmíněných daty (rozhodnutí vlastníka, 2026-10-13): datová sada se stahuje s piny SHA-256 a postup reprodukce je v <c2/>.

seg-4d5a503c5c9c = <b>Spřažený filtr PNT v balíčku fusion</b> ({ "0.36" }, WP-09, FUT-16): druh <c1/> přijímá volitelnou tabulku <c2/>, která spouští jeden skládaný filtr na pseudovzdálenostech se stavem zkreslení akcelerometru (<c3/>), a <c4/> je 3D verze s 8 stavy. Nový přibalený scénář <c5/>: se zkreslenými akcelerometry drží spřažený režim polohu sady kvantových scénářů na { "18.7" } m (95. percentil) s plnou integritou, kde rozpojené filtry dosahují { "430" } m. Bez tabulky jsou <c6/> i <c7/> beze změny (připnuto); <c8/> tabulku odmítá. MODELLED.

seg-b7f07e3693df = <b>Námořní, železniční a letecké balíčky GNSS/INS</b> ({ "0.36" }, WP-09, RM-21): přibalené scénáře <c1/>, <c2/> a <c3/> na knihovně trajektorií a volitelná tabulka <c4/> pro druh <c5/>, která fúzuje pseudovzdálenosti z konstelace SGP4 Walker (všechny družice při nominálním stavu, několik nejvyšších při zhoršeném). U železničního balíčku těsná vazba drží řešení navigační třídy na { "5.3" } m průjezdem zářezem a tunelem, oproti { "12.9" } m při volné vazbě. Bez <c6/> se balíček nemění (připnuto). MODELLED.

seg-0daf8b2646ad = <b>Těsná vazba s fází nosné</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, EKF chybových stavů s explicitními dvoustavovými hodinami přijímače a float nejednoznačnostmi nosné, řízený konstelací SGP4 Walker s korekcemi Klobuchar a Saastamoinen ve smyčce měření, detekcí proklouznutí z časově diferencované nosné a reinicializací nejednoznačností, a během jen s kódem na týchž měřeních pro porovnání. MODELLED: na jízdě po osmičce (figure-8) je řešení z nosné { "2.5" } cm oproti { "47" } cm jen s kódem a NIS/NEES jsou konzistentní přes seedy.

seg-7032646c0bc4 = <b>Knihovna trajektorií GNSS/INS</b> ({ "0.36" }, WP-09, RM-24): druh <c1/> přijímá volitelnou tabulku <c2/> s <c3/>. Profily zadávají Eulerovy rychlosti a zrychlení ve směru dráhy z pravdivého stavu a odvozují pravdivé IMU z kinematiky tuhého tělesa (koordinované zatáčky, stoupání, Coriolis); <c4/> importuje pravdivou trajektorii (<c5/>) a řeší IMU, které ji reprodukuje. Bez tabulky balíček letí svou historickou jízdu, bit po bitu (připnuto). MODELLED.

seg-e6b31bf61185 = <b>Dlaždice DEM v zeměpisné šířce/délce pro lunární horizont</b>: <c1/> čte textovou dlaždici <c2/> (výšky nad střední sférou na mřížce zeměpisné šířky/délky) namísto polární stereografické <c3/>, pro <c4/> i <c5/>; zpráva dlaždici opakuje (<c6/>, s jejím SHA-256). <c7/> je nyní zapojeno do sledování paprsku horizontu. Dlaždice převzorkovaná z dodávaného výřezu dává stanici horizont výřezu na { "0.22" } stupně. MODELLED.

seg-0c7ebb6c7d0d = <b>Terén v exportní lokalitě objemu služby</b>: se sekcí <c1/> nese každý řádek geometrického exportu po družicích <c2/> hodnotu <c3/> (družice překonává plochou masku i horizont exportní lokality v jejím azimutu), zpráva nese horizont lokality (<c4/>) a běhový CSV získává sloupec. Bez terénu se export nemění. MODELLED.

seg-7c8789777c26 = <b>Hlavní pole z enginu</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> a <c3/> ve WebAssembly uvádějí pro dvanáct druhů, která pole scénáře odpovídají na jeho otázku, nejlepší první, jako tečkované cesty (<c4/>). Studio je čte před vlastním řazením. Pouze metadata pro zobrazení: engine je nikdy nečte, žádný soubor scénáře je nepotřebuje, žádný výsledek na nich nezávisí. <c5/> selže, pokud druh nelze odeslat nebo cesta není nalezena v žádném z přibalených scénářů druhu (zachytilo dvě cesty, které Studio ve zploštělých id napsalo bez hranatých závorek pole).

seg-7528700924b2 = <b>Tabulka druh–modul z enginu</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> a <c3/> ve WebAssembly uvádějí pro každý druh scénáře, jehož řádky verifikační matice jmenují jiný modul než jeho vlastní, názvy modulů. Mapa schopností Studia používala vlastní ručně psanou kopii; <c4/> selže, pokud druh v tabulce nelze odeslat nebo se modul neobjevuje v žádném řádku matice. Žádný výstup se nezměnil.

seg-af7d28b7fb0e = <b>Krátký běh IQ v sestavení pro prohlížeč</b> ({ "0.36" }): <c1/> a <c2/> v modulu WebAssembly sestaví syntetickou scénu, získají každou družici a sledují získané, vše v paměti, omezeno na { "0.25" } s, { "1 000 000" } vzorků a { "8" } družic. Stavitel scény a vyhledání signálu podle názvu se přesunuly z nativního <c3/> (do <c4/> a <c5/>), aby je obě sestavení sdílela; výstup příkazového řádku se nemění. Nativní test a <c6/> porovnávají stejný požadavek s jedním golden souborem (<c7/>), bajt po bajtu: od změny přenosné matematiky (STUDIO-15, níže) dávají sestavení pro prohlížeč a nativní sestavení stejné bity.

seg-c0eab9b97b7d = <b>Typová API pro Python a TypeScript</b> (CAP-34): <c1/> typuje uzavřené slovníky (<c2/>, každý název druhu; <c3/>; <c4/>) a slovníky <c5/> a <c6/>; <c7/> a <c8/> je vracejí. Balíček WebAssembly přidává <c9/> (jeden běh jako typovaný objekt <c10/> s parsovaným dokumentem jako <c11/>) a <c12/> (parsované <c13/>) a jeho <c14/> nese tentýž slovník; <c15/> má typ <c16/>. <c17/> udržuje oba seznamy shodné s enginem.

seg-b097c2f105c3 = <b>Jednotky pro každý sloupec <c1/></b> (FUT-28): výsledek <c2/> nyní nese <c3/> a <c4/>, jednotku každého procházeného klíče a každé zaznamenané metriky, čtenou z vlastní tabulky jednotek procházeného balíčku. Osa může pro klíč, který balíček nezrcadlí, uvést <c5/>; deklarovaná jednotka, která odporuje jednotce balíčku, se odmítne, a jednotka, kterou neuvádí ani jeden, je <c6/>, nikdy se neodhaduje. <c7/> a <c8/> jsou popsány, takže každý ze { "76" } druhů je nyní plně pokryt branou jednotek polí (strop nepokrytých druhů { "1" } -> { "0" }).

seg-3a83af8daa43 = <b>Pole NumPy z <c1/></b> (FUT-26): Python <c2/> získává <c3/>, <c4/> a <c5/>, které vracejí <c6/> pro číselný seznam, číselné sloupce seznamu záznamů nebo každou řadu záznamů v dokumentu. Každé pole je rovno <c7/> týchž hodnot z <c8/> (dtype i bity). NumPy se importuje, až když je některá z těchto funkcí zavolána, a mezi požadavky na běhové prostředí není. Typováno v <c9/> a kontrolováno nástrojem stubtest.

seg-1c7a22dabad3 = <b>Optimalizátor kampaní</b> (CAP-32): nová, nepovinná sekce <c2/> druhu <c1/> hledá jeden až tři klíče scénáře v zadaných mezích tak, aby byla nejlepší hodnota jedné metriky: minimalizace, maximalizace, nebo dosažení cílové hodnoty. Prohledává buď vyčerpávajícím způsobem na mřížce, nebo deterministickým omezeným simplexem Nelder–Mead. Každé vyhodnocení je skutečným během pojmenovaného druhu a je uvedeno v <c3/> výsledku. Příklad: <c4/>. Prahy byly předregistrovány (<c5/>):

seg-f4e79236b6bf = Rosenbrockova funkce je splněna (f* = { "1.7e-20" });

seg-3dbe3fdfebcf = řešení 1-D cíle v uzavřeném tvaru je splněno ({ "6e-15" } relativně);

seg-5ab478e03354 = mřížka je bitově shodná s nezávislým úplným prohledáním;

seg-ea0a04c6e713 = simplex si vede alespoň tak dobře jako mřížka { "41" } × { "41" } na { "177" } bězích.

seg-161d8c5b55e8 = Práh 1-D z kola { "1" } je zaznamenán jako NOT MET, protože předregistrovaný rámec řešení vylučoval. MODELLED; řádek registru „Bounded optimisation of one metric over campaign parameters“. Doplňující: kampaně bez této sekce zůstávají beze změny.

seg-83d40a636fcb = <b>Kalibrační soubory běhů</b> (CAP-10): tři kontroly s jedním seedem, znovu spuštěné přes { "200" } nezávislých seedů proti předregistrovaným prahům, v <a1><c1/></a1> (generováno nástrojem <c2/>; hodnoty pro jednotlivé seedy v <c3/>).

seg-b163e53e06e9 = Bootstrapový { "95" } % interval Monte Carlo kampaně pokrývá skutečný průměr u { "192" } z { "200" } souborů a jeho kontrola chí-kvadrát vychází u { "196" }.

seg-022a7fbee13a = Tolerance percentilu při jednom seedu vychází jen u { "183" } z { "200" }: NOT MET, jak bylo předpovězeno. Je to práh zhruba 2 sigma, zaznamenaný a nezmírněný.

seg-096f36d21b02 = Kalibrace ADEV bílého FM vycházejí na každém seedu, přičemž jejich nejhorší chyba je hluboko uvnitř tolerance.

seg-369c7f2a115c = <b>Vestavěné druhy přes rozhraní <c1/></b> (FUT-27, rozpracováno): rozhraní <c2/> (<c3/>, s hákem pro úroveň důkazů jednotlivých hodnot a <c4/>) a první druhy na ně převedené (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). Výstup je nezměněn: manifest celého katalogu se SHA-256 každého výstupu je před změnou i po ní totožný (<c10/>).

seg-fd6e68ff5e5d = <b>Kontrola hřiště bez stahování</b> (RM-07): <c1/> kontroluje tři věci:

seg-3e424188f6e1 = každý scénář knihovny Studia je v balíčku pro prohlížeč;

seg-2803ccf8b9ae = balíček je bajt po bajtu shodný s <c1/>;

seg-b98016a4a844 = každý scénář v prohlížeči běží z prázdného pracovního adresáře.

seg-efc143b4f2a9 = <b>Mapy Alt-PNT: skutečné gravitační pole, Monte Carlo chyb mapy, SRTM v plném rozlišení</b> ({ "0.36" }, WP-10). Druh <c1/> přijímá nepovinnou sekci <c2/>: gravitační anomálii syntetizovanou z přibalených koeficientů EGM2008 (nebo ze souboru ICGEM <c3/> přes <c4/>, jen v nativních sestaveních). Tato syntéza se shoduje s ICGEM Calculation Service na zhruba { "1e-8" } mGal v { "794" } uzlech ve dvou oblastech, proti předregistrovaným prahům { "0.005" } mGal RMS a { "0.02" } mGal maximum (VALIDATED; řádek registru „Gravity-anomaly synthesis from a spherical-harmonic model“). Nový přibalený scénář <c5/> spouští 60minutový benchmark na tomto skutečném poli stupně 70. Předregistrovaný výsledek: shodná chyba { "3106" } m, takže práh < { "500" } m je NOT MET, jak bylo předpovězeno (stupeň { "70" } je příliš hladký), a desetinásobné snížení driftu je MET (MODELLED). Nepovinná sekce <c6/> spouští benchmark znovu přes chyby mapy se seedem a gaussovskou korelací a uvádí rozdělení shodné chyby (přibalený scénář <c7/>). Průzkumné a nepředregistrované: s chybou mapy { "2" } mGal korelovanou na { "0.2" } stupně (velikost, kterou rozpočtuje vlastní sigma srovnávače) zůstává v mezích { "500" } m { "1" } z { "20" } realizací (medián { "2.9" } km, p95 { "14.7" } km), oproti { "144" } m s dokonalou mapou. Syntetický benchmark s určením polohy pod 500 m předpokládá, že mapa je přesná. Bez kterékoli z těchto voleb je dokument bajt po bajtu shodný s dřívějšími vydáními. <c8/> přijímá nepovinnou sekci <c9/> (<c10/>, <c11/>), která čte magnetický kanál z CSV ve formátu EMAG2v3. EMAG2 není přibalen, protože jeho podmínky nejsou výslovné: <c12/> jej stáhne s připnutým SHA-256 a ořízne výřez. Na skutečné mřížce EMAG2 se netvrdí žádný navigační výsledek. Společný odhad mapy (terénní SLAM, RM-18): <c13/> provede sekvenční terénní navigátor nad uloženou mapou, která se od skutečnosti liší, a to buď s důvěrou v ni, nebo s odhadem opravy mapy po buňkách pomocí Rao-Blackwellizovaného filtru ve stylu FastSLAM. Předregistrováno proti SITAN se známou mapou při korelované chybě mapy { "15" } m na { "20" } seedech: průměrný zisk { "1.5" } %, lepší v { "10" } z { "20" }, takže oba prahy zlepšení jsou NOT MET ({ "10" } % a { "12" } z { "20" }), bez újmy na dokonalé mapě (MET). Jediný průlet bez opakovaných přeletů neumožní mapu naučit (<c14/>, MODELLED). Dokumenty <c15/> jsou bajt po bajtu shodné. Testy se skutečnými daty SRTM nyní běží v CI na dvou commitnutých ořezech v plném rozlišení; všechny předregistrované prahy jsou splněny, přičemž nejbližší uzel se shoduje s GDAL { "3.8.4" } v { "8" } z { "8" } bodů (<c16/>).

seg-aa7ac7a47111 = <b>Interoperabilita, WP-08</b> ({ "0.36" }; každá položka předregistrována a commitnuta samostatně před během svého orákula, každá je novým řádkem registru VALIDATED, kromě položky telemetrie, která rozšiřuje existující řádek):

seg-a5d0b22337d7 = <b>CCSDS Orbit Data Messages</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 a OCM { "3.0" } (bloky TRAJ, PHYS, COV, MAN, USER) zapisované a čtené v KVN a NDM/XML a OMM s plnou přesností ze sady elementů SGP4 (<c2/>); výstup <c3/> je nezměněn. Proti Orekit { "13.1.8" } oběma směry: { "27" } z { "30" } zpráv Kshana se v Orekitu naparsuje a Kshana přečte každou zprávu zapsanou Orekitem, hodnoty v rámci { "1e-14" } relativně a epochy v rámci { "1e-9" } s; připnuta jsou čtyři zjištění (Orekit vyžaduje <c4/>, odmítá <c5/> v uživatelsky definovaných parametrech XML, nezapíše <c6/> bez <c7/> a čte relativní epochy OCM v TDB v sekundách SI). Starší zapisovač OMM s <c8/> Orekit odmítá (zaznamenáno). Řádek „CCSDS Orbit Data Messages (OPM, OMM, OCM)“.

seg-39c70cb59f31 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/>): AEM 2.0/1.0 a APM { "2.0" } v KVN a XML proti Orekit { "13.1.8" }, každý práh splněn; zapisovač APM v Orekitu odmítá manévr bez <c3/> (připnuto). Řádek „CCSDS Attitude Data Messages (AEM, APM)“.

seg-bdfce382a98c = <b>Export SPICE SPK</b> (<c1/>): zapisovač a čtečka SPK typů { "9" } a { "13" } a export OEM do SPK; proti CSPICE N0067 jsou jádra bajt po bajtu shodná s jádry SPICE a vyhodnocují se bitově shodně. Řádek „SPICE SPK export (types { "9" } and { "13" })“.

seg-ce217acb9fe7 = <b>SPICE SPK typů { "3" } a { "21" }</b> (<c1/>): segmenty typu { "3" } (Čebyševovy) a typu { "21" } (rozšířené diferenční řádky) zapsané z daných záznamů a vyhodnocované tak, jak to dělá SPICE; proti CSPICE N0067 jsou jádra bajt po bajtu shodná s jádry SPICE a každé vyhodnocení se shoduje bit po bitu oběma směry. Řádek „SPICE SPK types { "3" } and { "21" } (Chebyshev, extended difference lines)“.

seg-72b8edbc74dc = <b>Rozšíření Space Packet</b> (<c1/>): sekundární hlavička s časovými kódy CUC/CDS, řízení chyb paketu, segmentace a kontroly proudu, proti ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } a CPython <c2/>, nula nesrovnalostí. Řádek „CCSDS Space Packet secondary header, packet error control and segmentation“.

seg-c5fcf933b656 = <b>Schéma telemetrie { "1.3" } přes skutečné spotřebitele</b>: Prometheus exposition a OTLP/HTTP JSON syntetického proudu se schématem 1.3, včetně řady geometrie a štítku <c1/>, přesně přečtené nástroji prometheus_client a OTLP proto, přijaté nástrojem promtool { "3.5.0" } <c2/> bez problémů z lintu a nezměněně propuštěné přes OpenTelemetry Collector contrib { "0.135.0" } (podmíněno daty: nástroje stahované s připnutým SHA-256, výstupy commitnuty).

seg-013344665417 = <b>Určování oběžné dráhy Marsu, běh { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> škáluje normálovou matici její diagonálou a tlumí krok (Levenberg-Marquardt), poté co registrovaný fit Gauss-Newton selhal na matici, jejíž surová diagonála zahrnuje osm řádů. Registrováno samostatně (<c2/>, stejný oblouk, prahy i úpravy). Na hodnocených průletech MRO je dráha v rámci { "0.36" } km RMS ({ "0.53" } km maximum) od navigační rekonstrukce MRO, prahy splněny. Doppler po fitu je { "48.6" } mHz proti prahu { "30" } mHz, nesplněno (zjištění připnuto). Dodatek pouze k hodnocení, R2-A1, je zveřejněn v <c3/>. Řádek zůstává MODELLED.

seg-fee311480417 = <b>Model rampovaného 2-way Dopplera Marsu a určování oběžné dráhy</b> ({ "0.36" }, WP-14, část CAP-30, fáze { "2" }): <c1/> předpovídá rampovaný 2-way Doppler DSN v pásmu X z rampových tabulek ODF (světelný čas, Shapiro, troposféra, čas stanice, stanice DSN přes řetězec CIO a IERS EOP) a fituje oběžnici Marsu (GMM-3, třetí tělesa, SRP, odpor). <c2/> čte SPK typu { "1" } (ověřeno proti CSPICE) a <c3/> čte pole PDS SHADR. Předregistrováno proti navigační rekonstrukci MRO na skutečných průletech MRO (podmíněno daty, <c4/>, měsíční CI): předpovězený Doppler se shoduje s pozorováním na { "12.5" } mHz (práh { "30" } mHz, splněno); registrovaný fit dráhy na hodnoceném oblouku selhal a nevytvořil žádnou dráhu (zjištění připnuto). Řádek zůstává MODELLED.

seg-d8212aa309ef = <b>Čtečka DSN Orbit Data File</b> ({ "0.36" }, WP-14, část CAP-30): <c1/> čte ODF TRK-2-18. Na skutečném ODF Mars Reconnaissance Orbiter (NASA PDS, přibaleno) čtečka odpovídá počtu záznamů, pozicím skupin, stanicím a časům v návěští PDS a všechny její datové typy jsou známé. Tabulka konce souboru v návěští je o jeden řádek kratší než soubor, což je nekonzistence návěští zaznamenaná jako zjištění. MODELLED. Určení oběžné dráhy z těchto dat zatím není hotové.

seg-bf26920a50bc = <b>Rozpočet TWSTFT a stabilita přenosu času: druh <c1/></b> ({ "0.36" }, WP-14, FUT-19).

seg-6038e0d04f89 = Dvoucestná rovnice:

seg-c1fdd431db57 = <c1/> ji řeší pro T_A − T_B se zpožděními zařízení stanic, asymetrií ionosféry v pásmu Ku při vysílání nahoru a dolů, rozdílem zpoždění transpondérů a členy Sagnacova jevu a obnoví dopředný model na { "1e-15" } s.

seg-a5468765380d = <b>Rozpočet nejistoty:</b> sloučen kvadraticky, s TDEV spoje jako členem typu A.

seg-7f365f91bb3e = <b>Šum spoje:</b> dvoucestná řada získává spodní hladinu flicker fázového šumu, denní nereciprocitu a konstantní reziduum reciprocity. Balíček <c1/> s bílým jitterem je nezměněn.

seg-8b40e74db08c = <b>Skutečná řada:</b> stabilita dodaných řad BIPM Circular T, CSV <c1/> nebo hodin stanic IGS.

seg-267fd20d823c = MODELLED. Nový přibalený scénář <c1/>. Časové řešení PPP je samostatně VALIDATED proti hodinám stanice IGS na větvi skutečných dat GNSS.

seg-ae33b92da4a6 = <b>Zahřívání při vstupu, radiometrie EO a ztráty při výstupu na dráhu</b> ({ "0.36" }, WP-14, CAP-28): tři nové druhy.

seg-34951878aa49 = <c1/>: vstup hmotného bodu ve 3 stupních volnosti nad rotující Zemí nebo Marsem se Sutton-Gravesovým zahříváním v bodě stagnace.

seg-98fe7a4c464a = <c1/>: SNR snímače, MTF na Nyquistově frekvenci, relativní odezva hrany a NIIRS podle GIQE { "4" }.

seg-173dfbe3cc3e = <c1/>: vícestupňový výstup s gravitačním obratem se ztrátami gravitací, odporem, řízením a protitlakem, kontrolovaný přesnou identitou ideální dv minus ztráty.

seg-0c9e7aacec80 = Maximální zpomalení při vstupu bylo zkontrolováno proti zveřejněnému nominálu Stardustu pod předregistrovaným prahem: { "35.44" } g proti { "33.4" } g (+{ "6.1" } %, práh { "10" } %). Tento řádek je VALIDATED. Zahřívání, radiometrie a výstup na dráhu jsou MODELLED. Nově také: <c1/>, přibalené scénáře <c2/>, <c3/> a <c4/> a <c5/>.

seg-d4648c4e6655 = <b>Řízení polohy reakčními koly: druh <c1/></b> ({ "0.36" }, WP-14, CAP-21). Inerciální zaměřovací otočení tuhého tělesa se třemi nebo více vyváženými reakčními koly pod zpětnou vazbou MRP, s momenty kol s minimální normou oříznutými na limit každého motoru (<c2/>). Může také uzavřít smyčku na multiplikativním EKF ze simulovaného gyroskopu a hvězdného senzoru (<c3/>). Smyčka skutečného stavu byla porovnána s Basilisk { "2.9.1" } na třech případech předregistrovaných dříve, než kód existoval (tři ortogonální kola, čtyřkolová pyramida, případ se saturací). Každá složka MRP, úhlová rychlost tělesa, rychlost kol i moment motoru se shodovaly v každém vzorku, nejhůře { "2.4e-14" } v sigma a { "2.9e-11" } rad/s v rychlosti kola. Tento řádek je VALIDATED; MEKF je MODELLED (konzistence NEES). Nové přibalené scénáře <c4/> a <c5/> a <c6/>.

seg-8ce699586340 = <b>Plánování pozemních kontaktů a DVB-S2 ACM</b> ({ "0.36" }, WP-14, CAP-22/23): dva nové druhy scénářů. <c1/> udává pro jednu družici nad jednou stanicí Es/N0 každého průletu a MODCOD DVB-S2 zvolený po jeho dráze (prahy podle ETSI EN { "302" } 307-1 Table { "13" } plus rezerva). Udává také objem dat, který ACM přenese oproti základu s konstantním kódováním. <c2/> dělá totéž pro několik družic nad několika stanicemi a sestavuje plán kontaktů bez konfliktů (otočení antény, jedna stanice na družici, doručení vážené prioritou omezené každým nevyřízeným objemem). Uvádí plán mezní hodnoty typu greedy, základ „kdo dřív přijde“ a přesné optimum na malých množinách spolu s mezerou optimality greedy plánu. Okna přístupu pocházejí z prediktoru zdánlivých průletů, který je VALIDATED. Nové přibalené scénáře <c3/> a <c4/> (ilustrativní vstupy) a <c5/>. MODELLED (dva nové řádky registru).

seg-cd6dbcc3a78b = <b>Dopplerovské určování polohy ze Starlink proti zveřejněnému experimentu</b> ({ "0.36" }, WP-14, část CAP-11, MODELLED). Jde o předregistrované proxy srovnání dopplerovského režimu <c1/> s předvolbou <c2/> proti percentilům datové sady 3 z „Unveiling Starlink for PNT“ (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). Model použil { "3" } družice (maska { "47" } stupňů zvolená pevným pravidlem), žádnou podporu výšky a sigma Dopplera { "30" } Hz, přes { "200" } seedů. Jeho 90. percentil 3-D chyby je { "92.2" } m při { "20" } s a { "870" } m při { "8" } s, proti zveřejněným { "2" } m a { "10" } m, takže oba prahy dvojnásobku jsou NOT MET. Model je pesimistický, nikoli optimistický, jak bylo předpovězeno: tři pevné družice poskytují mnohem menší geometrickou různorodost než { "63" } družic experimentu během { "10" } minut s přepínáním kanálů každých { "15" } s. Obě nesplnění jsou potvrzena testem (<c3/>).

seg-ffeb1b66cda5 = <b>Optimalizátor impulsních přeletů na DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> nalézá data odletu a příletu jednootáčkového balistického dvouimpulsního přeletu, které minimalizují odletové C3 nebo příletové V-infinity v rámci Type I nebo Type II. Prohledává mřížku po 2 dnech a poté zpřesňuje 2-D Nelder-Mead na heliocentrických stavech z jádra DE440; vychází z <c2/>. Srovnání bylo předregistrováno (bf0439e8) proti nezávislému optimalizátoru SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } na příležitosti Země–Mars { "2026" }: všechny čtyři optimalizace se shodují na { "8.7e-13" } relativně, s daty v rámci { "1e-5" } dne (VALIDATED, nový řádek registru). Jako sekundární zveřejněná reference se NASA/TM-2010-216764 (příručka Země–Mars 2026-2045) shoduje pro minimum C3 typu II ({ "9.182" } vs { "9.144" }) a minimum příletového V-infinity typu II ({ "2.564" } vs { "2.565" }). Jeho minimum C3 typu I se neshoduje: { "10.535" } vs { "11.11" } (-5,18 %), kde knihovní orákulum souhlasí s Kshana. Toto nesplnění je zaznamenáno a potvrzeno testem.

seg-91fe2e2625a1 = <b>Studie lunární referenční stanice</b> ({ "0.36" }, podnícená zveřejněným materiálem o plánované referenční stanici na jižním pólu Měsíce; zdroje v <a1><c1/></a1>): druh <c2/>, sweep Monte Carlo lunárního diferenčního modelu PNT přes uživatelskou mřížku u jižního pólu a den epoch, který dává pro každý bod i pro oblast percentilovou opravenou a neopravenou chybu, dostupnost s důvody, pokrytí proti uvedenému prahu, ochranné úrovně, poloměr pokrytí podle azimutu a rozpočet korekčního spoje. V jednom bodě, epoše a pokusu se přesně redukuje na <c3/>; jeho aritmetika byla přepočtena v numpy pod předregistrovaným prahem (polohy a percentily splněny; opravy stanice svůj práh nesplnily kvůli zaokrouhlení v dvojité přesnosti, zaznamenáno). MODELLED; řádek registru „Lunar reference-station coverage and accuracy map“. Bez spojení s jakoukoli agenturou či jejího schválení; žádné tvrzení o výkonu jakéhokoli skutečného systému.

seg-3d0cd9692787 = <b>Předregistrovaná předpověď: pokrytí lunární referenční stanice</b> (není validace; MODELLED). <a1><c1/></a1> zmrazuje v commitu c05dac1d výsledky <c2/> za veřejně uvedených předpokladů, s hashi SHA-256 vstupů a výsledků a s hodnoticím protokolem určeným nyní (faktor { "2" } pro přesnosti a ochranné úrovně, { "10" } procentních bodů pro dostupnost a pokrytí; změněný předpoklad dostane novou datovanou předpověď, nikdy úpravu; nesplnění se zveřejní stejně výrazně jako splnění). Každá hodnota je dominována nezveřejněnou sadou elementů čtyřdružicové konstelace, která je ILLUSTRATIVE, a říká to. <c3/> ji hlídá; <c4/> získává sekci „Pre-registered predictions“. Žádný řádek registru.

seg-00ec7ccd4d0d = <b>Rozšíření lunární referenční stanice</b> ({ "0.36" }; omezení { "2" } a { "3" } studie stanice a styl řešení zdrojů), každé volitelně zapínané na <c1/> a ve výchozím stavu vypnuté, takže každý existující dokument, včetně zmrazené předpovědi, je beze změny: <c2/> (vícecestné šíření <c3/> u uživatele i stanice, u stanice volitelně Gauss-Markov přes epochy, kódový šum DLL z C/N0, mezikanálová zkreslení; hodnoty ILLUSTRATIVE pro Měsíc); <c4/> (lineární růst chyby vysílané dráhy po dobu latence oprav, ILLUSTRATIVE); <c5/> (omezení výšky, minimum tří družic s ním, okno statického uživatele přes epochy). Dva dodatky k porovnání se zveřejněnými tvrzeními, každý předregistrovaný samostatně před svým během, stojí vedle needitovaného zaznamenaného běhu: K5 s růstem selhává při každé rychlosti; ve stylu řešení zdrojů K1 až K5 selhávají a K6 vychází ({ "1" } z { "6" }), přičemž opravená 3-D chyba p95 pro R300 klesá z { "280.6" } m na { "2.11" } m. MODELLED; tři řádky registru.

seg-1d0a0dcd42de = <b>Lunární masky horizontu z terénu</b> ({ "0.36" }; první omezení studie lunární referenční stanice): nepovinná sekce <c1/> na <c2/> (stanice a každý uživatelský bod) a <c3/> (každý bod mřížky) dává každému místu azimutově závislý horizont ve formátu tabulky skyline { "0.36" }, ze stanoveného profilu označeného svým zdrojem (<c4/>, <c5/>) nebo/a ze sledování paprsku po polárním DEM (<c6/>) po velkých kružnicích lunární koule s přesným zakřivením. Přibaluje ořez { "0.98" } MB veřejně dostupného jihopolárního DEM LRO LOLA <c7/>, převzorkovaný blokovým průměrem { "5" } x { "5" } na { "1200" } m (<c8/>, s jeho NOTICE, SHA-256 a <c9/>) a scénář pouze pro repozitář <c10/>. Kontrolováno proti horizontům v uzavřeném tvaru (holá koule, kráter na plošině, rasterizovaný kužel); MODELLED, řádek registru „Lunar terrain horizon masks from a stated profile or a polar DEM“. Bez sekce je každý dokument, včetně bloku jednotek, bajt po bajtu shodný.

seg-ca0c6ca7396a = <b>Důvěra s ohledem na geometrii</b> (návrhová poznámka geometrie { "0.36" }, oddíl { "4" }). Každá epocha <c1/>, statická či plavidla, dávková či živá, nese svou geometrii družic: <c2/>, <c3/> (důvody <c4/>, <c5/>, <c6/> a informativní <c7/>) nebo <c8/>, kde log geometrii družic nedává, s HDOP, PDOP, VDOP a použitými družicemi. Je odvozena z elevací a azimutů, které přijímač hlásí (NMEA GSV, UBX NAV-SAT), přes stávající jádro <c9/>, nebo převzata z NMEA GSA. Každá epocha nese také štítek, <c10/>, <c11/> nebo <c12/>, vždy hlášený a nikdy nehodnocený, a poznámku s HDOP, PDOP, VDOP, počtem družic a ztrátou signálu slovy. Skóre plavidla získává monitor <c13/>, který nic neodečítá, dokud není geometrie špatná (HDOP nad { "4" }, PDOP nad { "6" } nebo méně než { "5" } použitých družic), pak narůstá až k limitu { "15" } bodů; samotná geometrie dosáhne nejvýše pásma degradovaného, nikdy nedůvěryhodného (bez poplachu). Každé odečtení dostane třídu, <c14/>, <c15/> nebo <c16/>, takže špatná obloha není brána jako útok. <c17/> je <c18/>, když všechny ztracené družice byly při posledním hlášení pod { "15" } stupni; odečtení za špatnou geometrii je <c19/>, když se HDOP uváděný přijímačem rozchází s jeho uváděnou oblohou o více než max({ "1.0" }, { "25" } % odvozeného HDOP), takže padělaná špatná obloha si štítek koupit nemůže. Nová tabulka <c20/> uvádí každou prahovou hodnotu s jejím původem (HDOP { "4" }, PDOP { "6" }, nejméně { "5" } použitých, sigma_UERE { "1.5" } m, tolerance HDOP max({ "1.0" }, { "25" } % odvozeného HDOP), přičemž { "25" } % je reprezentativní volba pro přijímače s hodinami podle konstelace nebo s řešeními z podmnožin, { "15" } stupňů; hodnoty IEC 61108-1 a GPS SPS jak jsou citovány, k ověření proti textu norem). Úplná ztráta signálu není označena jako obloha: když družice v dohledu nejsou sledovány a DOP družic v dohledu je dobrý (a nesledované nejsou soustředěny v jedné polovině horizontu), nese epocha <c21/> a odečtení za geometrii je <c22/>. Uváděné HDOP nebo PDOP { "99" } nebo více, kvalita GGA { "0" } a režim GSA { "1" } se čtou jako žádné řešení, ne jako DOP. Limit (<c23/> { "15" }), konec náběhu (<c24/> { "1.5" }) a podlaha (<c25/>, výchozí <c26/> skóre) jsou v <c27/>, stejně jako dobré úrovně štítku (HDOP { "2" }, PDOP { "3" }, { "6" } družic, reprezentativní); platný limit je <c28/>, takže tabulka <c29/>, která zvyšuje <c30/> (včetně té s { "0.35" }), limit snižuje místo toho, aby byla odmítnuta, a podlaha pod <c31/> je odmítnuta. MODELLED; software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel.

seg-d976d3495695 = Geometrie se dostává na každý povrch: JSON výsledku (<c1/>, <c2/> u každého odečtení, <c3/>, <c4/>), živé řádky JSON (schéma { "1.3" }), Python a WebAssembly <c5/>, <c6/> a <c7/>, nástroje MCP <c8/>, balíčky důkazů (<c9/>, <c10/>, dráha geometrie na souhrnné stránce) a <c11/> (Prometheus <c12/> a štítek <c13/> u <c14/>, OTLP <c15/>, vlastní pole CEF <c16/> (stav geometrie a třídy), <c17/> (HDOP) a <c18/> (PDOP), kontrolovaná oběma parsery CEF jako orákuly, a LEEF <c19/>, <c20/>, <c21/>). Exportuje se i štítek geometrie, připojený za každou dřívější řadu a pole a jen pro vstupy, které jej nesou: Prometheus <c22/> a <c23/>, OTLP <c24/> a <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/> a CEF třetí pole <c30/> (štítek) a <c31/> (použité družice); VDOP v CEF není (pole s plovoucí řádovou čárkou jsou obsazena). Oba parsery CEF jako orákula čtou případy štítku zpět tak, jak byly zapsány (dodatek { "5" }: { "176" } řádků, { "172" } naparsováno pycef, { "176" } Logstashem). Uváděný HDOP, který uváděná obloha nevysvětluje, je označen u každé epochy a započten (<c32/>, řádek na souhrnné stránce důkazů), hodnocen jen když je geometrie špatná. Ztráta signálu se exportuje samostatně, protože stav geometrie zůstává <c33/>, dokud trvá: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; v CEF se projeví jako třída <c37/> v <c38/>.

seg-5030e5214ed0 = <c1/>: kovarianční faktor <c2/> za <c3/>, z ní vyčleněný stejnou aritmetikou.

seg-c6cc061a3ed6 = Řádek registru „Position error from geometry: RMS error = sigma_UERE x DOP“ (<b>MODELLED</b>, vnitřní konzistence): Monte Carlo se seedem pro řešení nejmenších čtverců enginu na { "8" } geometriích DOP odpovídajících gnss_lib_py proti kovariančnímu faktoru ověřeného jádra DOP, s tolerancemi předregistrovanými před prvním během a se dvěma negativními kontrolami, které selhávají, jak se vyžaduje; vedle něj dřívější kontrola na čtyřech ručně zvolených oblohách s intervaly spolehlivosti chí-kvadrát, uvedená jako provedená před předregistrací.

seg-b87b6eafd465 = <b>Masky skyline závislé na azimutu</b> (<c1/>, <a1><c2/></a1>, položka návrhové poznámky { "1" }): elevační ořez závislý na azimutu, bodové maximum tabulek (každá interpolovaná samostatně, zalomená na { "360" }°), pouliční kaňon v uzavřeném tvaru (s volitelnými otevřenými konci), sektory s ostrými hranami a profil terénu se zakřivením Země; účinný ořez je <c3/>. Čtyři REPRESENTATIVE předvolby s uvedeným původem (<c4/>, <c5/>, <c6/>, <c7/>), přepsatelné pole po poli. Nepovinná sekce <c8/> v <c9/>, <c10/>, <c11/> (každý režim, včetně polárního sweepu), <c12/> a trénovacích souborech <c13/> a v <c14/> a <c15/> přes nového uživatele na pozemním stanovišti, <c16/> (geodetické úhly pohledu na rotující Zemi, s geodetickým „nahoru“ pro horizontální a vertikální rozdělení ARAIM; každý vzorek je jeden absolutní okamžik, <c17/>, ke kterému jsou sady elementů, vysílané efemeridy a soubory SP3 posunuty od svých vlastních epoch, datováno od nejnovější epochy družice, není-li <c18/> uvedena; obíhající <c19/> skyline odmítne). Výsledky získávají <c20/> a <c21/> pro každý vzorek. Bez sekce je každý scénář bajt po bajtu shodný s { "0.35.0" }, ověřeno proti hashům z vydávacího commitu. Šest přibalených příkladů: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> a kampaň <c27/> (kaňon pro autonomní vozidlo jako plochý ořez i jako ulice; existující kampaň je beze změny). MODELLED.

seg-95cdecf341d6 = <b>Funkce geometrie oblohy</b> (<c1/>, položka návrhové poznámky { "2" }): <c2/> (viditelné a maskované družice z místa, času a předvoleb konstelací, dvouřádkových sad elementů (<c3/>, nejvýše { "4" } MiB, propagovaných SGP4 enginu do UTC <c4/>) nebo zadaných družic; <c5/> a <c6/> říkají, zda je obloha reprezentativní, nebo obloha, kterou sady elementů dávají v dané epoše, nikoli měření; <c7/> uvádí každý nepoužitý řádek s důvodem; vstupní limity { "2000" } družic nad horizontem, kontrolované před sestavením systémové tabulky, a { "16" } hodin přijímače; pět DOP; kofaktor a kovariance v ENU s jedněmi hodinami na systém nebo jedněmi společnými; horizontální chybová elipsa na jedné sigma a na uvedené spolehlivosti), <c8/> (chyby nejmenších čtverců se seedem, nejvýše { "5000" }), <c9/>, <c10/> a <c11/>. <c12/> zpřístupňuje kovarianci za <c13/>, která je nyní jejím zúžením (ověřené skaláry jsou beze změny). Povrchy: <c14/> a <c15/>, funkce Pythonu a WASM stejných jmen a nástroj MCP <c16/> ({ "40" } nástrojů) a notebook <c17/> (s jeho zrcadlem <c18/>; spouští jej <c19/>). Každý výsledek nese štítek MODELLED, prohlášení o modelu chyb a poradní upozornění.

seg-9414d387cf79 = Registr: pět řádků o skyline a geometrii oblohy. <b>VALIDATED</b>, každý v porovnání předregistrovaném před během svého orákula: <em>Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask</em> proti Orekit { "12.2" } (<c1/>, <c2/>) a gnss_lib_py { "1.0.4" } (<c3/>), nejhorší rozdíly úhlů pohledu a masky { "1.1e-12" }° proti { "1e-9" }°, shodné množiny viditelných družic, DOP { "3.3e-13" } relativně (<c4/>); <em>Horizontal error ellipse and per-system cofactor from the geometry covariance</em> proti numpy <c5/> a <c6/> (standard P2), { "270" } případů, osy { "5.1e-13" } relativně (<c7/>). <b>MODELLED</b>: redukce kaňonu, sektorů a terénu; předvolby; skladba geometrie oblohy (obloha z předvolby, mrak Monte Carlo).

seg-8f5ebce999fe = S řádky geometrie důvěry, skyline a lunární referenční stanice má registr { "274" } řádků: { "134" } ověřených, { "136" } modelovaných, { "4" } partnerské.

seg-686b1211d7bb = <b>Lunární referenční stanice: laboratoř času stanice</b> (<b>MODELLED</b>). Nepovinný blok <c1/> na <c2/> (<c3/>). Modeluje hodiny stanice (výchozí třída miniRAFS, libovolná pojmenovaná třída nebo karta zařízení nafitovaná na uvedené body stability) řízené k LTC, poté volně běžící nebo znovu řízené každých N sekund. Vydává křivku časové chyby x(t), čas do { "1" }, { "10" } a { "100" } ns (bisekce vedle uzavřeného tvaru) a dominantní člen pro každý horizont, vše s jednotkami. Reziduum řízení je ILLUSTRATIVE. Rychlost LTC se znovu neodvozuje a drží si vlastní řádek VALIDATED. Cíl na úrovni nanosekund z veřejného materiálu ICG WG-B Lunar PNT (červen { "2024" }) je citován jako výrok zdroje, nikoli jako tvrzení. Pořadí hodin optické < PHM < RAFS < miniRAFS platí od { "1" } s do { "7e5" } s a test připíná křížení křivek PHM a RAFS poblíž { "7.5e5" } s. Toto křížení je vlastností modelů hodin s jediným typem šumu (čistý flicker FM proti čistému bílému FM), nikoli fyzikálním výsledkem. Bez bloku jsou zpráva, její tabulka i souhrn beze změny. Příklad: <c4/>. Přidává jeden řádek registru označený MODELLED.

seg-863c2c7a5f0b = <b>Lunární referenční stanice: geodézie stanice</b> (<b>MODELLED</b>). Nepovinné vstupy <c1/> a <c2/> na <c3/> přidávají blok <c4/>. Informace o datu z pěti polí z archivovaného řezu laserového měření vzdálenosti se spojují s tím, co by přidaly přidaný retroreflektor a přidaný maják VLBI na uvedených místech. Reflektor je měřen v archivovaných epochách, kdy jej lze vidět, s jejich archivovanými vahami. Maják využívá síť a rozvrh <c5/>, se stanicemi pevnými. Blok udává každou Helmertovu 1-sigma před a po a jejich poměr. Jsou to meze Cramér–Rao pro zredukovanou množinu parametrů, na ILLUSTRATIVE rozvrhu a místě. Chybějící nebo prázdné vstupy nechávají zprávu bajt po bajtu shodnou. Příklady: <c6/> a <c7/>. Přidává jeden řádek registru označený MODELLED.

seg-45c6febcc7fc = <b>Lunární referenční stanice: porovnání se zveřejněnými tvrzeními</b> (<b>MODELLED</b>). Každé číselné tvrzení v pěti veřejných zdrojích je uvedeno s přesným zněním, stranou a uvedenými předpoklady a zařazeno jako srovnatelné, částečně srovnatelné nebo nesrovnatelné (<c1/>; zdroje s URL, datem stažení, SHA-256 a licencí v <c2/>). Částečně srovnatelná tvrzení byla hodnocena podle šesti jednostranných prahů předregistrovaných před během (<c3/>, revize { "2" }, 05bf9a19): { "1" } ze { "6" } tvrzení v rámci předregistrovaného prahu (předregistrováno 05bf9a19). Pokrytí je { "0.00" } proti >= { "0.95" } na obou jihopolárních kružnicích a opravené p95 je { "280.6" } m proti <= { "1.5" } m. Příčinou jsou dráhové elementy družic, které žádný zdroj nezveřejňuje: na ILLUSTRATIVE elementech ve stromě jsou čtyři družice ve společném dohledu v { "8" } % epoch, při téměř singulární geometrii. Běh tato tvrzení na těchto elementech nereprodukuje a není důkazem, že jsou tvrzení chybná. Připnuto v <c4/>. Jeden řádek registru označený MODELLED se zjištěním.

seg-2b01d2ccb666 = <b>Lunární referenční stanice: připravenost dat souboru hodin</b>. <c1/> nyní uvádí časový systém svých epoch. Je to hodnota <c2/> nebo, není-li deklarována, výchozí hodnota družicového systému z hlavičky. Výsledek také říká, zda byl systém deklarován. Funkce odmítne neznámý časový systém (například lunární časovou škálu), nedeklarovaný soubor se smíšenými systémy a soubory, které si odporují, místo aby je četla jako čas GPS. Dodává syntetický fixture hodin stanice. Není definován žádný formát souboru oprav, protože žádný veřejný neexistuje.

seg-0fb89eb36003 = Změněno

seg-b63c95f12bc4 = Dokumentace modulů <c1/>, <c2/> a <c3/> už 17stavový navigátor UKF, plné těsné spojení s INS a explicitní stav hodin neoznačuje za budoucí práci; odkazuje na <c4/>, <c5/> a <c6/>.

seg-aedd06cf6127 = <b>RINEX { "4" } už není odmítán</b> ({ "0.36" }, WP-07): navigační soubor RINEX { "4" } býval záměrně odmítán; nyní se čte (viz Přidáno). U souborů pozorování verze { "4" } a novějších se štítky hlavičky párují pouze ve sloupcích 61-80, takže nové záznamy s volným textem se nemohou vydávat za štítky.

seg-5829841b58d7 = <b><c1/> čte skutečné soubory IONEX</b> ({ "0.36" }, WP-07): plný záznam o 16 hodnotách vyplní sloupce 61-80, které čtečka považovala za štítek, a proto vracela <c2/> pro každý skutečný soubor IONEX. Nyní čte záznam, jehož pole štítku je číselné, jako hodnoty. Žádný dodaný výstup ji nepoužíval.

seg-a66bd6592b93 = <b>Přijímané výkony Galileo E1 a E5a podle OS SIS ICD Issue { "2.1" }</b> (revize, 2026-10-14). Spektrální pásma <c1/> a <c2/> a oběti GNSS signálů LEO, které z nich berou výkon, nyní používají minimální přijímané výkony z Table { "12" } dokumentu Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (bylo −{ "157.0" }) a −{ "155.25" } dBW (bylo −{ "155.0" }).

seg-b0386f62923f = Mění se devět výsledků scénářů: příklady spektra, kampaň spektra, tři vertikály odolnosti LEO a tři návrhy signálů LEO. Efektivní C/N0 se na těchto pásmech mění o −{ "0.25" } dB a J/S o +{ "0.25" } dB.

seg-2af90bfcefae = Každá změněná hodnota ({ "1766" }, stará → nová) je uvedena v <c1/> a jeho CSV spolu s tabulkami dokumentace, které se změnily. Žádný řádek registru nemění stav.

seg-d468174b2d4c = Druhá část téhož dne: oběti signálů LEO <c1/> (−{ "155.0" } → −{ "155.25" } dBW, Table { "12" } E5b) a <c2/> (−{ "152.0" } → −{ "152.24" } dBW). ICD nemá řádek pro celé pásmo E5, takže hodnota AltBOC je výkonový součet celkových hodnot E5a a E5b z Table { "12" }, sestavený tak, jak byla sestavena stará hodnota. Mění se tři výsledky návrhu signálů LEO ({ "64" } hodnot: tyto přijímané výkony a degradace C/N0 z LEO do GNSS u obou obětí), uvedené ve stejné revizi (§{ "5" }) a CSV. Nic dalšího se nemění.

seg-a96992246ef8 = <b>Oprava atmosférického přílivu S2</b> (<c1/>). Harmonické tlaku vzduchu S2 podle Raye ({ "2001" }) jsou koeficienty nenormalizovaného <c2/> s kosinovými fázovými zpožděními; byly použity jako plně normalizované a zpoždění jako sinový předstih podle IERS. Nyní vstupují vydělené <c3/> s <c4/>; nové <c5/> reprodukuje model A2 z GFZ STR06/01 Table { "5" } pro všech { "21" } vln (nejhůře { "0.0005" } cm, { "0.05" }°; VALIDATED). Mění se jen výstupy s povolenými slapy: fit Galileo CI { "0.132" } → { "0.133" } m, složky Swarm-A o { "1" }–{ "2" } mm (předregistrováno v <c6/>).

seg-6fa076226c01 = Pouze dokumentace: <c1/>, <c2/> a <c3/> jsou zdokumentovány jako starší řešiče, číselně beze změny, s odkazem na <c4/>.

seg-a757fd7ca793 = <b>Stav kola { "3" } D9 (<c1/>).</b> BIPM Circular T { "465" } vyšel 2026-10-12. Předregistrované prospektivní hodnocení stále nebylo spuštěno: číslo { "465" } obsahuje asi { "285" } testovacích hodnot a pravidlo zastavení potřebuje { "1000" }, tedy zhruba čísla { "465" }–{ "468" }. Běh také potřebuje archivované soubory jednotlivých laboratoří z 2026-09-30, protože BIPM od té doby přepsal { "87" } ze { "113" }. Řádek registru a hlavička testu to uvádějí; test, jeho prahy i jeho rozdělení jsou beze změny.

seg-e064546d05ec = <b>Průchod pravdivosti dokumentace ({ "0.36" }).</b> Plán, řádky schopností, stavové řádky návrhových dokumentů a komentáře modulů uvedeny do souladu s kódem; žádné změny výstupů. Položky již postavené, ale stále vedené jako otevřené, jsou nyní označeny jako hotové: kontroly masek ITU-T, scénář holdoveru { "24" } h a načítání logů hodin (telekomunikační časování), quickstarty na první minutu, Lense–Thirring a křížová kontrola propagátoru Orekit, přesný řetězec GCRS podle ITRF, golden a multiplatformní hashe, provenience, vícenásobná porucha ARAIM (ADD v4.2), FDE jedné družice, knihovna CRPA, limit nejednoznačnosti proužků CAI, dimenzování streets-of-coverage a 3-D pohled na oběžnou dráhu, dynamika polohy tuhého tělesa, zapisovač OMM a čtečka jader NAIF, lunární librace DE440, věta o významu běhu v hřišti, <c1/>, 17stavový těsně vázaný navigátor a druh gravity-map. Řádky také přesně uvádějí, co zůstává otevřené (například dvoudílné JD v <c2/>, čtečka <c3/> proti skutečnému produktu a vyloučení více družic v <c4/>). Chybějící <c5/> je napsán z čerstvého běhu svých testů (M1–M4 vycházejí) a návrh validace IQ pro partnery má aktuální počty řádků registru.

seg-e2290a640df7 = Paměťové kódy Galileo E1 už nejsou přibaleny.

seg-80f8ca869682 = <c1/> a <c2/> (ICD Annex C.7/C.8) jsou odstraněny z repozitáře a balíčků. Podmínky ICD (citované v <c3/>) dovolují uživateli kódy uložit s uvedením zdroje a použít je v produktu, ale redistribuci povolují jen pro nekomerční účely, a Kshana je nabízena také pod komerční licencí. <c4/> / <c5/> nyní vracejí <c6/> a čtou vlastní kopii uživatele z <c7/> / <c8/> nebo, ve zdrojovém checkoutu, z <c9/>, kde je z PDF ICD extrahuje nový <c10/> (s kontrolou hashe). <c11/> / <c12/> jsou odstraněny. Bez tabulek vracejí signály Galileo E1 (<c13/>, <c14/>) chybu, která říká, jak je dodat, a testy E1 se přeskočí se zprávou. S tabulkami na místě je každý výstup E1 beze změny. Žádný scénář, golden ani výstup spektra kódové tabulky nepoužívá. Testovací fixtures E5a Annex C.3/C.4 (orákulum LFSR v <c15/>) se řeší stejně: stahují se stejným skriptem, jsou ignorovány gitem a test se bez nich přeskočí.

seg-654d0358137b = <b>Přenositelná matematika všude</b> ({ "0.36" }, STUDIO-15): každá transcendentní funkce <c1/> v knihovně a generátory normálního, gama a exponenciálního rozdělení z <c2/> se nyní počítají přes čistě Rustový <c3/> (<c4/>, <c5/>), takže nativní sestavení a sestavení WebAssembly vracejí bajt po bajtu shodný JSON výsledků pro všech { "141" } přibalených scénářů i pro krátký běh IQ. Cenou je, že poslední bity výsledků počítaných matematickou knihovnou hostitele se posunuly: { "98" } ze { "141" } přibalených scénářů se změnilo, { "43" } ne; { "5" } se změnilo o více než { "1e-3" } v největším poli, ostatní o méně. Každá změněná hodnota je uvedena staré -> nové v <a1><c6/></a1> (s CSV všech { "136,127" } změněných čísel); žádný práh, tolerance ani mez se nezměnily. Zveřejněná čísla, která se změnila: dostupnost <c7/> s dosahem Země { "0.719" } -> { "0.713" } a chyba RMS { "86.147" } -> { "86.499" } m (jedna epocha na hraně dostupnosti se nyní všude rozhoduje stejně; na macOS arm64 vypsala { "0.725" } / { "85.800" } m); chyba stanice <c8/> { "3.541350" } -> { "3.536885" } m s VLBI a { "2183.558" } -> { "2184.021" } m bez; <c9/>, osm hodnot <c10/> o { "3" } jednotky na posledním místě (erratum v technické zprávě); vydaný dokument <c11/> v množstvích na úrovni zaokrouhlovací podlahy (osm hodnot za šestým platným místem, až { "6.8e-5" } relativně; neposunulo se žádné pořadí ani práh). Připnuté hashe hlídačů bajtové shody (<c12/>, <c13/>, <c14/>) jsou přebázovány na pojmenovaný základ „{ "0.36" } portable“ s hodnotami { "0.35.0" } uchovanými jako historický záznam; zmrazená předpověď lunární referenční stanice je nedotčena a její přenositelný opakovaný běh je uložen vedle ní (<c15/>). <c16/> (ověřený řádek lunárního společného OD): fixtures znovu exportovány a porovnání s numpy znovu spuštěno s numpy { "2.4.6" }, registrovanou verzí, skript i práh beze změny; všech šest sítí vychází (<a2><c17/></a2>). Práce ze dávek 2-3 sloučená po STUDIO-15 je také na přenositelné matematice ({ "457" } míst volání v { "62" } souborech); co se jí posunulo, je v <a3><c18/></a3>: { "12" } přibalených scénářů (největší relativní změna { "5.2e-8" }, neposune se žádná vytištěná hodnota), { "28" } znovu schválených řádků hlídače skyline, digest M2M4 <c19/>, starší hashe pravdy <c20/>, sigma data nepozorovaného majáku ({ "632.3769" } -> { "632.3772" } m) a dvě zaznamenaná zjištění (uzavření DRO v CR3BP; CRPA A3, { "194" } z { "456" } spojů). Přesné edf podle Greenhalla si drží svůj ověřený práh s logaritmem v aritmetice double-double ve svém jádře (<a4><c21/></a4>) a orákulum testovací lavice gps-sdr-sim bylo znovu spuštěno na změněných exportech NMEA, přičemž každý práh platí (<a5><c22/></a5>).

seg-a21df3f8e0a6 = README: řádek lunární sady uvádí úroveň důkazů každé části (psalo se, že všechny jsou MODELLED).

seg-ffb14764a7a9 = <c1/> vrací <c2/> (řada, log mřížkování, časový systém, zda byl deklarován, typ záznamu) místo n-tice <c3/>. Nyní se vrací od záznamů družice (<c4/>) k záznamům přijímače/stanice (<c5/>) požadovaného jména.

seg-6777ca96624a = Žádné skóre se nemění, pokud není geometrie špatná; štítek je hlášen vždy. S dobrou nebo střední geometrií (včetně oblohy jen s GPS s { "8" } družicemi) nebo s neznámou geometrií (monitor neběží) je každé skóre jako v { "0.35" }: <c1/> drží výstupy obou příkladových relací a <c2/> každý commitnutý korpus NMEA plavidla (také jako obloha jen s GPS) a scénáře výcviku posádek na bajty { "0.35.0" }, jakmile jsou připojené klíče odstraněny; ve dvou výcvikových scénářích, jejichž rušení činí geometrii špatnou, se špatné epochy liší samotným odečtením za geometrii. Log se špatnou geometrií ztrácí až { "15" } bodů, které v { "0.35" } neztrácel. Jinak zamýšlené změny, všechno doplňky: výše uvedené klíče v JSON výsledku a v balíčcích důkazů (<c3/> je beze změny); schéma živých řádků JSON přechází z { "1.2" } na { "1.3" } (<c4/> připojeno, <c5/> v každém odečtení); výtah souhrnu získává <c6/>; telemetrie získává řady geometrie, pole a štítek <c7/> jen pro vstupy, které je nesou, takže proud nebo výsledek { "0.35" } se vykreslí bajt po bajtu jako dříve. <c8/> je 17. jméno monitoru; je uvedeno poslední v <c9/>, když rozhodoval (plavidlo, jehož log geometrii dává; seznam { "0.35" } si zachová své pořadí a počet monitorů v souhrnu se zvýší o jedna) a nemá položku <c10/> (její nastavení je odmítnuto: jeho odečtení se nastavuje v <c11/>).

seg-45b44c851937 = <c1/> uváděl licenci gnss_lib_py jako Apache-2.0; vydání { "1.0.4" } je MIT.

seg-a1a670a9c63e = Čtečka NMEA nyní čte GSA (krátká GSA se ignoruje, nepočítá se jako přeskočená) a uchovává elevace a azimuty GSV, i pro družice uvedené bez signálu; čtečka UBX uchovává elevaci a azimut NAV-SAT. C/N0 se čte přesně jako dříve.

seg-0bafbea5c75d = <b>Změna výsledku: širokopásmové a přelaďované rušičky nyní používají Q = { "2" }.</b> Rovnice protirušení používá pro tyto rušičky učebnicovou úpravu rozprostřeného spektra Q, kde dříve používala { "1" }. Q = { "2" } je bílý šum přes hlavní lalok s normalizovaným výkonem signálu v pásmu; v testech je připnuto k uzavřenému tvaru z <c1/>.

seg-21f31ec302de = <b>Beze změny:</b> rušičky CW a úzkopásmové (Q = { "1" }), nerozpoznaný typ rušičky (Q = { "1" }, nejškodlivější hodnota) a <c1/>.

seg-f362499d2ed0 = <b>Účinek:</b> tam, kde působí širokopásmová nebo přelaďovaná rušička, efektivní C/N0 stoupá až o { "3.0103" } dB, odvozené prahy J/S stoupají o { "3.0103" } dB a poloměry odepření ve volném prostoru se zmenšují faktorem { "0.7071" }.

seg-088dcd34cc88 = <b>Změněné přibalené scénáře:</b> { "12" } ze { "144" } se mění, všechny tak, jak bylo předregistrováno (<c1/>, výsledky v <c2/>):

seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

seg-afb42538cfde = <c1/>: ztracené družice { "26" } → { "0" }, medián odstupu ztráty zachycení { "27.4" } → { "19.4" } km;

seg-8c2691f38d28 = <c1/>: poloměr odepření dynamiky smyčky { "75.2" } → { "53.2" } km;

seg-096a24491872 = a kampaně a křížové kontroly spektra, které je obsahují.

seg-ecdf60335064 = <b>Dotčení spotřebitelé:</b> druhy <c1/>, <c2/>, <c3/> a <c4/>, <c5/> druhů spektra, referenční křivka MODELLED kampaně IQ a výchozí Q labfit a export scény pro interoperabilitu.

seg-89672d99e9e2 = Plugin JetBrains: žádné zastaralé platformní API ani API plánované k odstranění. Pět dialogů výběru používá malý <c1/> s rozbalovacím seznamem místo zastaralého <c2/>; výběry jednoho souboru používají konstruktor <c3/> místo zastaralého <c4/>; animace se otevírá přes <c5/> místo <c6/>, které platforma { "2026.3" } plánuje k odstranění. Since-build zůstává { "243" }. IntelliJ Plugin Verifier hlásí Compatible bez použití zastaralého API či API plánovaného k odstranění proti { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) a { "2026.3" } EAP (IU-263.6259.32); <c7/> ve výchozím nastavení kontroluje { "2024.3" } a libovolný seznam zadaný v <c8/>.

seg-58ee61cbd633 = <c1/> a <c2/> vracejí <c3/>: neplatná sekce <c4/> je při přímém volání chybou, jak tomu už bylo přes <c5/>, místo tichého návratu k plochému maskování. <b>Zpětně nekompatibilní</b> pro volající v Rustu těchto dvou funkcí.

seg-9b4113258e1e = <b>Hodnotitel kampaní: skutečné falešné zachycení trackeru se nikdy nezapočítalo</b> (<c1/>). Kontrola falešného zachycení trackeru přesune kanál z LOCKED na LOST, když se spustí. Hodnotitel označil až následující aktualizaci kanálu, která už byla odemčená, a proto se nikdy nezapočítala. Událost <c2/> hlášená z LOCKED je nyní jednou epizodou ve svém čase, v běhu i v každé uvedené události, která ji obsahuje. Událost nalezená během pull-in nebo opakovaná kanálem, který je už LOST, není novou epizodou. Nový test vyvolá skutečné falešné zachycení: legitimní nosná GPS L1 C/A skokově změněná o 1/(2T) při zachycení (<c3/>).

seg-ac508954b6a6 = V referenční kampani <c1/> se mění jen PRN { "11" } z ramp/agc-3bit (epizody falešného zachycení { "0" } → { "1" }, { "426" } a { "437" } za hodinu zachycení).

seg-cfc47d9d9237 = Její DIGESTy buněk jsou znovu připnuty.

seg-fcfa0de18b05 = Předregistrované připnutí hodnocených výsledků zůstává živé a stále se reprodukuje přesně: v jeho hashi je jen těch šest polí, změněných touto opravou provedenou po registraci, namapováno zpět na jejich hodnoty před opravou. Opravené hodnoty jsou připnuty samostatně.

seg-b96d34bb1d36 = Žádný práh nebyl změněn a nepohnul se žádný řádek VALIDATED, hodnota ani číslo na webu.

seg-ccbe11bd50b6 = <b>lunar-frame-campaign: maják bez pozorování je nyní hlášen</b> (nalezeno MR-05). Zpráva získává <c1/> a <c2/> jen tehdy, když nějaký maják nemá žádné pozorování, a sigmy pozorovaných majáků pak pocházejí z jejich vlastní informace, místo aby byly všechny null. Datum je beze změny a nemění se žádný výchozí, přibalený ani zveřejněný výstup (<c3/>).

seg-c223c1fc1323 = <b>Lunární soustava hlavních os</b> (<c1/>, používaná v <c2/> a ve fitu LRO): posun DE421 od střední osy Země k hlavním osám z <c3/> byl použit ve špatném směru a se špatným pořadím Eulerových úhlů, takže analytická soustava PA ležela asi { "208" }″ od PA, místo aby na ní ležela. Nyní je přepsána tak, jak ji definuje Frames Required Reading SPICE, a shoduje se se SPICE <c4/> na { "2.6e-16" } rad; analytická soustava PA je { "6" }″ až { "8" }″ od PA DE440 (předregistrováno e1ead19b, znovu registrováno be33382e poté, co první navržená změna nesplnila práh { "1e-12" }; <c5/>). Zveřejněná čísla, která se mění: fit LRO (<c6/>) surové překrytí { "53.8" } → { "39.9" } m, dynamické { "12.6" } → { "12.05" } m, redukovaně dynamické { "6.65" } → { "6.67" } m (prahy beze změny). Analytický zásobník se nyní shoduje s křížovou validací ANISE na úrovni DE ({ "12.0" } / { "6.67" } m) na obou úrovních; dřívější rozdíl na dynamické úrovni byla tato chyba.

seg-ef2b49d4ad48 = <b>Server MCP odmítá <c1/></b> (navazuje na CAP-06b). Cesta k dlaždici terénu druhu jamming je nyní v <c2/>. Inline povrch odmítne scénář, který ji uvádí, se zprávou, která neobsahuje ani cestu, ani chybu operačního systému. Test ochrany zdrojů souborů nyní označí i pole končící na <c3/>.

seg-ef005d2e3d42 = <c1/> se zlomkovou denní částí zahazovalo zlomek v převodech UTC, TAI, UT1 a rotace Země (jedna hodina denní části otočila Zemi o { "15" }° špatně); denní část je nyní normalizována na celé číslo. Žádný volající enginu nebyl dotčen: každý předává celý den a každý dodaný výstup je bitově shodný.

seg-144d90307ec6 = Plánováno

seg-7ef4cd25cb87 = Geometrie ze zadaného skyline (položka { "1" } verze { "0.36" }, nyní v enginu jako <c1/>): <c2/> a <c3/> ze skyline, kde ho vstup dává (mezera v azimutu jako záloha), událost přirozené degradace (fjord nebo terminál) v <c4/> a dvě maskované geometrie z návrhové poznámky v řádku sigma_UERE x DOP, předregistrované jako dodatek.

seg-49481d2fdf31 = Geometrie pro logy RINEX s navigací (z vlastního řešení enginu) a logy Androidu (z řádků <c1/>); obojí dnes čte <c2/>. Geometrie v <c3/> (verze { "1" } beze změny v { "0.36" }) a integrace Signal K a OpenCPN.

seg-57df1332ff87 = Dříve existující mezera, nezavedená ve verzi { "0.36" }: jakmile je pole SNR každé družice prázdné, nespustí se žádné odečtení <c1/> ani C/N0; úplná ztráta signálu je viditelná jen přes <c2/> monitoru geometrie (zařazeno do třídy <c3/>). Odečtení pro ni je plánováno.

seg-a5a7a10ee11c = Proud schématu { "1.3" } ve vnějších telemetrických orákulech (parser textového formátu Prometheus a kolektor OTLP), které dnes pokrývají jen proudy { "1.2" }.

seg-caa1977b5b5e = Dvoustranná překážka (kaňon nebo úzký fjord) se čte jako ztráta signálu, nikoli jako zablokovaná obloha, dokud nebude skyline integrován.

seg-4bd0f178ca4e = Pasáž jmenující AI klienty třetích stran je zde vynechána; je v <a1>CHANGELOG.md</a1> na GitHubu.

seg-b2689beaba9e = Ověřovač Galileo OSNMA

seg-d16c9b4bf537 = <b>Nový modul <c1/> a <c2/>: otevřený ověřovač OSNMA pro Galileo na straně přijímače, čistě v Rustu.</b> Čte stránky I/NAV a hlásí pro každou družici a epochu, zda jsou navigační data autentizována, s důvodem každého selhání nebo zpoždění: parsování HKROOT a MACK, skládání DSM-KROOT a DSM-PKR, ověření veřejného klíče pomocí Merkle, ověření řetězce klíčů TESLA, ověření MACSEQ a značek pro ADKD { "0" }, { "4" } a { "12" } včetně křížové autentizace a výsledek ve tvaru <c3/> pro monitor důvěry v přijímač. Výstup nese poradní upozornění, že stav není službou integrity navigace. <c4/> uvádí, co je a co není ověřováno, požadavek na čas a že Kshana neuděluje žádná práva podle IPR ICD OSNMA Evropské unie (uživatelé se spoléhají na oprávnění v Annex E ICD). Implementováno proti SIS ICD Issue { "1.1" } a Receiver Guidelines Issue { "1.3" }. Stránky se kontrolují CRC a bajtový proud u-blox UBX-RXM-SFRBX lze číst přímo (<c5/>). Výchozí testy používají syntetická data a zveřejněné testy se známou odpovědí pro primitiva; test na vyžádání čte lokálně stažený exemplář oficiálních vektorů. Po nezávislém přezkumu ověřovač bere svůj čas jen z ověřených klíčů TESLA (podvržený podrámec z daleké budoucnosti už nemůže vymazat selhání), nechává autentizaci vypršet a sleduje používané IODnav, ctí ověřené výstražné zprávy (jejichž list Merkle nyní zahrnuje náhodné pole NPK) a stav NMA „don't use“, drží zástupné značky mimo stav družice, uchovává řetězce podle CID s odvoláním a obnovou, kontroluje výplňový hash KROOT a omezuje délky rámců UBX a práci ověřování TESLA. Družice se čte jako autentizovaná jen tehdy, když nejnovější efemeridy a data hodin, která vysílá, jsou bit po bitu tatáž data, která byla autentizována (nikoli jen pod stejným IODnav); stav nebo odvolání z neautentizované hlavičky NMA se počítá jen tehdy, když se shodnou dvě družice nebo jej nese ověřený KROOT; přehraný starší KROOT nemůže nahradit řetězec a zastavený proud klíčů je hlášen.

seg-3e7df5c888ca = Přidáno (kanály serveru MCP)

seg-4e70d8b85211 = <b><c1/>, streamovatelné HTTP, vlastní hosting.</b> Ve výchozím stavu loopback; adresa mimo loopback vyžaduje <c2/> a bearer token v <c3/>; žádný nástroj nečte ani nezapisuje cestu (nástroje pro soubory IQ jsou vypnuty); limity velikosti požadavku, času a souběžnosti; žádná hlavička CORS; kontroly Host a Origin. Kshana nehostuje žádný koncový bod (<c4/>, se šablonami pro Docker, Fly.io a Cloud Run).

seg-c392cde151c9 = Přidáno (povrchy)

seg-19ab5c068b6e = <b><c1/> v Pythonu a WebAssembly.</b> Ověřovač za <c2/> nad bajty v paměti, vracející JSON, který tiskne <c3/> (poradní upozornění v poli <c4/>; jen stav autentizace, nikoli služba integrity navigace). Stejná odmítnutí jako na příkazové řádce. Ne v MCP: vstupem je dlouhý surový proud přijímače, který lépe obslouží CLI a Python. Říkají to <c5/> a <c6/>.

seg-6128929994b4 = <b><c1/> ve WebAssembly, Pythonu a MCP, s příkazem pluginu a akcí JetBrains.</b> Vykresluje proud důvěry nebo výsledek <c2/> jako text Prometheus, řádky syslogu CEF nebo LEEF nebo payload OTLP JSON, s kodéry, které používá <c3/> (<c4/>); žádný socket a žádné hodiny. Plugin: <c5/> a dovednost <c6/>. JetBrains: Render Trust Telemetry. Funkce <c7/> a <c8/> a server MCP nyní také zapínají <c9/>, což nepřidává žádný crate.

seg-83d01411c6d4 = <b>Průchod paritou.</b> Akce JetBrains Validate Scenario, List Scenario Kinds a Assess Receiver Stream; <c1/> nyní uvádí <c2/>, <c3/>, <c4/> a <c5/>; notebook <c6/> (mapování compliance a export pro testovací lavici); a každá zbývající buňka JetBrains „pouze CLI“ v <c7/> je nyní výslovné N/A s důvodem.

seg-062ef0cf7ee7 = Přidáno (balíčky důkazů)

seg-9889575c2df1 = <b><c1/> a <c2/>: podepsané, ověřitelné balíčky důkazů pro událost důvěry v GNSS.</b> Balíček sdružuje výřez surového logu a SHA-256 celého logu, konfiguraci se všemi prahy, výsledky a důvody pro jednotlivé epochy, verzi enginu, manifest propojený hashi a samostatný souhrn HTML, podepsané Ed25519 (klíč z <c3/> nebo vlastní soubor; klíče se v balíčku nikdy neukládají a <c4/> je ignorován gitem). <c5/> kontroluje každý hash, řetězec i podpis a pojmenuje přesně to, co selhává; s <c6/> připne podepisujícího. Lze připojit token RFC { "3161" }, který se přečte a naváže na manifest (vlastní podpis autority toto sestavení nekontroluje; pokrývá to <c7/>). Výřez logu je přesnými bajty okna tam, kde čtečka hlásí zdrojové rozsahy (NMEA, UBX, RINEX { "3" }, Android), jinak celý log, a manifest říká, který případ nastal. Vytvoření a ověření jsou čisté veřejné funkce (<c8/>), které se sestavují pro <c9/>. Balíčky uvádějí, že jsou technickým záznamem, nikoli právním posudkem. Nové závislosti jsou strom <c10/> (BSD-3-Clause a Apache-2.0/MIT, minimální funkce) a přímý <c11/> (již v tomto stromu) pro vymazání klíčového materiálu. Viz <c12/>.

seg-280fd37126c1 = Přidáno (telemetrie důvěry)

seg-ebd269c618b0 = <b><c1/>: důvěra v GNSS jako zdroj bezpečnostní telemetrie.</b> Čte proud důvěry po epochách (řádky JSON: skóre 0-100, pásmo, důvody) nebo dávkový výsledek <c2/> a plní koncový bod Prometheus <c3/> (ve výchozím stavu localhost), události syslogu v CEF nebo LEEF uvnitř obálky RFC { "5424" } (UDP nebo TCP) a, za ve výchozím stavu vypnutou funkcí <c4/>, export OTLP/HTTP JSON. Doručování běží na pracovních vláknech s časovými limity připojení a zápisu, omezeným odstupem opětovného připojení a počítadlem <c5/>, takže mrtvý nebo zaseknutý kolektor nemůže zastavit živé hodnocení ani zmrazit <c6/>; štítky důvodů jsou omezeny na { "64" } řad. Žádné nové závislosti. Ukázkový dashboard Grafana je v <c7/>. Názvy metrik, štítky a mapování polí CEF/LEEF jsou v <c8/>. Formát proudu je izolován v <c9/>.

seg-fa5e803edb44 = Námořní důvěra: živé skóre důvěry 0-100 pro řešení pohybujícího se plavidla z NMEA { "0183" }, které přijímač už vydává, s bránou zapínanou na vyžádání.

seg-c5b3fcb9bba8 = <c1/> přijímá tabulku <c2/> (<c3/> nebo <c4/>, maximální rychlost plavidla, zrychlení a rychlost otáčení, výška antény nad čárou ponoru a volitelný snímač kurzu; každá výchozí hodnota zdokumentovaná s důvodem). Pro plavidlo je statický monitor skoku polohy, který měří vzdálenost od kalibračního průměru a na plující lodi se mýlí, nahrazen kauzálními monitory pohyblivé platformy: kinematická konzistence polohy vůči hlášené rychlosti a kurzu a vůči limitům plavidla, kurz z gyra vůči kurzu nad zemí, log rychlosti vůči rychlosti nad zemí, výška antény vůči uvedené výšce nad čárou ponoru, kolaps a současný růst rozptylu C/N0 vůči kalibračnímu základu a časová konzistence (v živém režimu i vůči hodinám tohoto počítače). Čte také hlášený stav autentizace, celkový nebo pro jednotlivé družice (jen hlášený stav: žádná kryptografie OSNMA). Každý práh je uveden v tabulce <c5/> před během. Každá epocha pak dostane skóre od { "0" } do { "100" } deterministickým, předregistrovaným mapováním (žádné učení, nic nefitovaného na události; váhy, hrany pásem a důkazy jsou v tabulce <c6/>), namapovaným na stávající stavy důvěry, s monitory, které odečetly, a jejich body. Statické scénáře jsou beze změny a hashují se jako dříve. <c7/> čte stdin, soubor, ke kterému se připisuje, TCP nebo UDP a zapisuje jeden řádek JSON na epochu a proprietární větu <c8/>; s <c9/> propouští proud nezměněný, dokud je řešení důvěryhodné, a označuje řešení za neplatné (kvalita GGA { "0" }, stav RMC a GLL <c10/>, režim GNS a VTG <c11/>), dokud není. Brána je vypnutá, pokud o ni není požádáno; <c12/> poskytuje proud za bránou libovolnému počtu klientů TCP (ve výchozím stavu loopback, pomalý klient je odpojen, aby neblokoval ostatní). Je to software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }); odpovědný zůstává provozovatel. <c13/> je syntetický log Tallinn–Helsinki, zapsaný pouze jako text, s odtažením polohy v polovině, během něhož přijímač dál hlásí platné řešení; jeho očekávaný výstup je připnut testem. Průvodce: <c14/>. Kontroly nevidí spoofer, jehož řešení je konzistentní se vším na sběrnici; průvodce to uvádí.

seg-80f3f0aae42c = Mapa interference

seg-8539a42718cb = <b><c1/> a <c2/>: veřejný obraz toho, kde letadla a lodě hlásily zhoršená navigační data a kolik z trasy se jich dotýká.</b> Vstupy jsou místní soubory CSV vytvořené z otevřeně licencovaných dat ADS-B (adsb.lol, ODbL { "1.0" }) a AIS (NOAA MarineCadastre, Kystverket pod NLOD { "2.0" }); každý výstupní soubor je jeden zdroj a jeden den UTC ve formátu GeoJSON, nesoucí metodu, její prahy, licenci dat, uvedení zdroje a zkreslení pokrytí zdroje. Metoda ADS-B agreguje NIC a NACp na pevnou mřížku a buňku označí za zhoršenou podle podílu odlišných letadel, s pojistkami pro zařízení, která nikdy nehlásí přesnost, pro nízkou výšku a pro příčiny na širokém území. Metoda AIS spouští pět detektorů: polohy na souši (proti pobřežní čáře dodané uživatelem), kruhové dráhy, nepravděpodobné skoky, nepravděpodobné rychlosti a mnoho plavidel na jednom místě. Prahy jsou předregistrované konstanty pojmenované verze metody. Pouze agregáty: identifikátory se hashují v paměti a nikdy nezapisují a buňky s méně než { "5" } odlišnými letadly nebo plavidly se nezveřejňují. Zhoršená buňka není zjištěním interference. Výchozí příkazy nepoužívají síť; pomocník <c3/> na vyžádání stahuje polygony souše Natural Earth z adresy připnuté ke commitu a soubor uchová, jen když se jeho SHA-256 shoduje. Vstupem ADS-B je CSV nebo přímo soubory historie readsb z adsb.lol (nová závislost: <c4/> s čistě Rustovým backendem, pro gzip). Obě metody jsou ve verzi { "2" }: volání zhoršená nebo anomální vyžaduje alespoň { "5" } letadel nebo plavidel (minimum pro zveřejnění), každý počet v buňce pod { "5" } je zadržen jako <c5/> a den, jehož pozadí nelze odhadnout, zadrží svá volání. Výstupní soubory se jmenují <c6/> a nikdy se nepřepisují; vstup se streamuje po řádcích; expozice trasy zvládá antimeridián. Testy používají pouze syntetická data. Viz <c7/> a přezkum licencí v <c8/>.

seg-7a54dfab93dc = Přidáno (trénovací proudy)

seg-0b01d1d871e2 = <b><c1/>: syntetický můstkový NMEA { "0183" } pro výcvik posádek v rozpoznávání rušení a spoofingu GNSS.</b> Ze scénáře TOML zapisuje soubor nebo streamuje přes TCP či UDP (unicast nebo broadcast; v reálném čase, zrychleně nebo co nejrychleji) úplnou sadu můstku GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT a VBW pro dráhu plavidla s limity rychlosti otáčení, zrychlení a proudu, s geometrií družic z vlastních nominálních konstelací enginu. Skriptované události na časové ose: rušení, odtažení polohy (platné řešení, které odchází), podvržení času a zpoždění přehrání, každé s náběhovými a doběhovými rampami. Instruktorský log (JSON a text) zaznamenává, co bylo kdy vloženo, se skutečnou dráhou proti hlášené. Knihovna v <c2/> (rušení na otevřeném moři, pobřežní odtažení, podvržení času při přiblížení k přístavu, kombinované) nese poznámky pro trenéra. Výstup má platné kontrolní součty a je deterministický pro každý seed; testy připínají zlatý výňatek pro každý scénář a čtou každou větu čtečkou NMEA <c3/>. Pouze text: žádný výstup RF, IQ ani průběhu signálu; proudy jsou určeny pro výcvik a testování a nikdy se nesmějí přivádět do živých navigačních systémů plavidla. Viz <c4/>.

seg-bb8d508c92fa = Námořní integrace ({ "0.35.0" }, pracovní proud B)

seg-538cdf145ac1 = <b>Plugin Signal K</b> (<c1/>, není zveřejněn na npm): spouští <c2/> nebo se k němu připojuje (vlastní vstup NMEA serveru, vlastní argumenty vstupu, přívod JSON-lines přes TCP nebo věty <c3/> proudu s bránou), publikuje skóre důvěry, pásmo, důvody, alarmy a stav brány pod <c4/> (včetně polohy hlášené přijímačem jako kontext, nikdy <c5/>) a vyvolává oznámení Signal K (<c6/> při degradaci, <c7/> při nedůvěryhodnosti, s prahy podržení, zrušení a zastarání, vše ve schématu konfigurace). Žádné závislosti npm. Testováno na zaznamenaném syntetickém výstupu.

seg-b6eb7110291e = <b>OpenCPN</b>: NMEA v režimu brány je poskytován přímo <c1/> (doporučeno); bezzávislostní relé TCP (<c2/>) je nepovinná alternativa. Tak či onak OpenCPN vidí neplatné řešení, když se důvěra zhroutí, a <c3/> ve svém ladicím okně NMEA; testy přehrávají syntetický proud s bránou přes skutečný socket TCP a kontrolují, co spotřebitel přijme. Nativní plugin s panelem skóre (<c4/>, plugin API { "1.18" }, CMake) čte <c5/> z vlastního proudu NMEA OpenCPN a upozorňuje na pásmo nedůvěryhodné; sestavuje se, jeho logika je testována jednotkovými testy a běžel uvnitř OpenCPN { "5.8.4" } pod virtuálním displejem (důkazy a reprodukční skript v <c6/>); není zabalen pro správce pluginů.

seg-bb26e8c1aff0 = <b>Referenční sestavení</b> (<c1/>): obecný seznam dílů, nastavení OS, jednotky systemd pro poradní monitor a bránu zapínanou na vyžádání (kontrolované <c2/> přes <c3/>), možnost kontejneru, zapojení Signal K.

seg-6695d4c1f13b = Plugin Signal K přijímá živé schéma JSON { "1.2" } (klíč <c1/>, poté klíč <c2/> připojený na konec; neznámé připojené klíče se ignorují), kontrolováno na skutečném výstupu { "1.2" } a proti skutečnému signalk-server.

seg-622c2d3dd8fa = Opravy po přezkumu: jednotky systemd se vždy restartují a běží v pískovišti (žádný shell, žádná síť, kde není potřeba), úryvek logrotate, <c1/> selže při jakémkoli zjištění; kontejner spouští bránu z proměnných prostředí s kontrolou stavu a se základními obrazy připnutými digestem; metadata skóre Signal K, zastaralé oznámení je při obnovení dat nahrazeno, chyby podřízených procesů se uchovávají a ukončení eskalují, nebezpečné <c2/> jsou odmítány a oznámení je na <c3/>; relé omezuje podržený neúplný řádek; parsery <c4/> odmítají skóre mimo { "0" } až { "100" }; kontrola odkazů v dokumentaci; pracovní postup CI (<c5/>), který spouští vše, včetně skutečného binárního souboru od začátku do konce.

seg-7c615a62ca26 = <c1/>. Software pouze poradního charakteru, nikoli typově schválené zařízení; odpovědný zůstává provozovatel. Pouze software: nic nevysílá a netvrdí se žádná hodnota detekce ani falešného poplachu.

seg-72cb9f45ce99 = Přidáno: mapování compliance a export pro testovací lavici

seg-15aae04a9490 = <b><c1/> a <c2/>.</b> Mapování výstupů Kshana na pět rámců a norem odolnosti (US DHS Resilient PNT Conformance Framework v2.0, pokyny IMO pro lodě, pokyny EASA pro letectví, NIS2 Article { "21" }, EN { "16803" }, placená norma citovaná podle částí a těch několika čísel článků, která jsou vidět v katalogovém textu), jedna tabulka na rámec: odkaz, co požaduje v našem parafrázování, výstupy, které pro ně podporují důkazy (supports evidence for), a mezera. Verze zdrojů, URL a to, co bylo a nebylo přečteno, jsou zaznamenány. <c3/> naplní mapování z daných běhů a označí každý řádek <c4/>, <c5/>, <c6/> nebo <c7/>, jako Markdown a JSON, s mezerou ponechanou u každého řádku. Formulace je „podporuje důkazy pro (supports evidence for)“; nic se nehodnotí ani neschvaluje. Testy používají syntetické běhy a selžou, když se uložená tabulka rozejde s kódem.

seg-ee9a0a43e4b0 = <b><c1/>.</b> Zapisuje pohyb vozidla a události scénáře <c2/>, <c3/> nebo <c4/> pro laboratorní simulátor GNSS: CSV pohybu uživatele se zdokumentovanými soustavami a doprovodný soubor metadat, NMEA { "0183" } <c5/>/<c6/>, text s body trasy a události jako CSV a jako bloky <c7/> <c8/> (<c9/>). Pouze pohyb a události: žádný signál se nezapisuje. Každý soubor se čte zpět v <c10/> a porovnává v rámci své uvedené tolerance. <a1><c11/></a1> udává metodu přehrání exportu přes simulátor a hodnocení logu přijímače pomocí <c12/>.

seg-fc0fe915ed3d = <b>Co se počítá jako důkaz.</b> Výsledek se počítá pro schopnost, jen když nese pole, která jeho druh zapisuje; samotný štítek druhu neznamená nic. Neznámé druhy, výsledek, který si odporuje se sesterským scénářem, nehexadecimální hashe a chybně utvořené počty důvěry v přijímač jsou uvedeny jako nepoužité, s důvodem. Zpráva escapuje buňky Markdownu a nespadne (panic) na hashi se znaky mimo ASCII. <c1/> a <c2/> přijímají texty, nikoli cesty.

seg-6b46de1164d8 = Export pro testovací lavici.

seg-c48a4dd4134b = <c1/> je kontrolováno na rozsah (<c2/>); soubor s body trasy kontroluje každý interval a příkaz říká proč, když je vynechán; dokumentace uvádí, že kurz <c3/> je stáčení tělesa, nikoli kurz po trati, zástupná pole <c4/> a vlastní změnu výšky scénáře. <c5/> a <c6/> jsou v textu použití.

seg-eb2e415ec540 = <c1/> zpřístupňuje historii skutečného stavu pro profil řízení <c2/> (stejné krokování, jaké používá vlastní pravda druhu) a <c3/> získává pole data a času NMEA.

seg-fbfc1a59e99b = Validace mapy interference

seg-a68d88381eea = <b>Sémantika dekódování a geometrie mapy interference jsou kontrolovány proti nezávislým implementacím na syntetických vstupech.</b> Významy kódů NIC a NACp proti dekódování syntetických rámců ADS-B v pyModeS, nedostupné hodnoty AIS proti dekódování syntetických vět AIVDM v pyais, přiřazení buněk mřížky proti shapely, délka trasy v každém stavu buňky proti shapely a GeographicLib a maskování vnitrozemí proti shapely a pyproj, vše na toleranci stanovenou před prvním porovnáním (<c1/>). Toto ověřuje, jak se čtou kódy a hodnoty polí, a geometrii, nikoli že označená buňka je interference. Čtečka polygonů souše nyní uzavírá prstenec, který neopakuje svůj první vrchol a který dříve četla bez poslední hrany. Dokumentace uvádí prahy nízké přesnosti NACp a NIC jako mez, kterou každý kód představuje (NACp { "6" } je mez EPU { "556" } m, NIC { "5" } mez omezení { "1" } NM).

seg-cf4ffdbba1a6 = Přidáno (validace formátů telemetrie a balíčků důkazů)

seg-ad6730e0e891 = <b>Vnější kontroly kryptografie balíčků důkazů, ověřovače balíčků a přenosových formátů telemetrie.</b> Testovací vektory Ed25519 z RFC { "8032" } oddílu { "7.1" } ({ "1" }, { "2" }, { "3" } a { "1024" }) a příklady SHA-256 z FIPS 180-4 běží přes vlastní funkce balíčku pro podepisování, ověřování a hashování, na přesnou rovnost. Ověřovač napsaný v Pythonu pouze z normativního oddílu <c1/> (hashlib a <c2/>) se shoduje s ověřovačem v Rustu na { "71" } neporušených a porušených balíčcích: verdikt, množina selhání, verdikt podpisu a obě hlavy řetězce. Naše expozice Prometheus je čtena parserem oficiálního klienta v Pythonu a náš OTLP JSON oficiální zprávou <c3/>, striktně, a obojí se shoduje se stavem, z něhož byly vytvořeny. CEF a LEEF nemají nezávislý otevřený validátor a zůstávají jen modelované. <c4/> získala normativní formát balíčku a postup ověření, z nichž byl ověřovač v čisté místnosti napsán; <c5/> získala <c6/>. Orákula a fixtures: <c7/>, <c8/> s <c9/>, <c10/>; testy <c11/>, <c12/> a <c13/>. CI nepotřebuje Python.

seg-20d1b02bfda4 = Přidáno (validace událostí CEF)

seg-8c464e43e43d = Události CEF telemetrie jsou správně čteny zpět dvěma nezávislými open-source parsery.

seg-a6321d13b0ab = <c1/> { "1.11" } a kodek CEF pro Logstash (<c2/> { "6.2.7" } v Logstash { "8.15.3" }) parsují { "157" } řádků CEF (každou změnu pásma a každou epochu uloženého telemetrického proudu, plus nepřátelský text obsahující <c3/>, zpětná lomítka, svislítka, zalomení řádků, tabulátory a vícebajtový text) a obnoví každé pole hlavičky, závažnost, přesnou množinu klíčů rozšíření a každou hodnotu přesně. Kodek Logstash čte také čtyři řádky, jejichž text hlavičky vyžaduje escapování, což <c4/> nezvládá. Práh byl zaregistrován před spuštěním kteréhokoli parseru (<c5/>); fixtures v <c6/>, skripty orákul <c7/> a <c8/>; CI nepotřebuje ani Python, ani Logstash. LEEF nemá udržovaný otevřený parser a zůstává jen modelovaný. Události CEF nyní nesou skóre důvěry a posun epochy v číselných vlastních polích CEF s plovoucí řádovou čárkou (<c9/>, <c10/>) místo celočíselných polí <c11/> a <c12/>, která nevyhovovala ani jedné hodnotě; CEF je v tomto vydání nové, takže se nic z dodaného nemění.

seg-65b362fa8711 = MCP: <c1/> přijímá log jako <c2/> nebo <c3/>; vstup nástroje je omezen na { "4" } MiB.

seg-8999974aa1fa = Také graf rušení přebírá své barvy z palety.

seg-8c8ff384dbf6 = <c1/> byl jediný modul, který revize palety Observatory nechala na vlastních barvách, zatímco přistávala práce na Q rušiček; jeho <c2/> (scénáře druhů <c3/>, <c4/> a další druhy <c5/>) nyní čte <c6/> a seznam povolených v <c7/> je prázdný. Pouze barvy a písmo: grafy <c8/> a <c9/> jsou shodné se svými dříve zaznamenanými vykresleními, jakmile se normalizují barva, <c10/> a patička s verzí. Žádná vynesená hodnota se nepohnula. Zaznamenané kopie Studia pod <c11/> byly znovu zaznamenány při přeportování { "0.33.0" } a { "0.34.0" } (pouze razítko verze): stále nesou starý nátěr grafu rušení a paletový nátěr převezmou při příštím přeportování.

seg-a059d10c5330 = <b>Mez 3 sigma souboru hodin nyní zahrnuje flicker floor a kontrola zdraví filtru ho vidí.</b> S <c1/> nesly skutečné hodiny flicker FM, ale dvoustavový filtr dodávající mez integrity ne, takže pokrytí 3 sigma u dodávaného scénáře <c2/> bylo { "0.41" } (klasické) a { "0.33" } (kvantové) a kontrola NIS/NEES, která si čerpala svou pravdu z modelu filtru, hlásila totožné hodnoty s podlahou i bez ní. Mez je nyní dvoustavový rozptyl plus přesný rozptyl flicker fáze nahromaděné od poslední synchronizace, počítaný ze stejné banky, kterou používají skutečné hodiny; kontrola NIS/NEES čerpá svou pravdu z rozšířeného modelu s touto bankou a spouští odpovídající rozšířený filtr (a dvoustavový filtr proti flicker pravdě hlásí <c3/>). Změna výstupu, jen pro hodiny s nenulovým <c4/>: <c5/> na <c6/> přechází z { "0.40866" } / { "0.33026" } na { "0.99970" } / { "1.0" } (klasické / kvantové) a NIS/NEES <c7/> nyní zahrnují flicker; časová chyba, <c8/> a <c9/> jsou beze změny a scénáře bez podlahy jsou bajt po bajtu shodné. <c10/> (druh orbit, seed { "7" }, podlahy { "1e-16" } / { "2e-11" }) se také mění: <c11/> klasické { "0.7734" } na { "1.0" } a kvantové { "0.9796" } na { "1.0" } a NIS/NEES <c12/> a jejich pásma se mění. Jeho kvantové <c13/> se překlápí z <c14/> na <c15/>: je to výběrová událost souboru flicker o 16 seedech krát 60 krocích (NIS { "0.8815" } proti pásmu [{ "0.9125" }, { "1.0914" }]), nikoli vada. Pásmo je pásmem { "95" } %, takže zhruba { "5" } % seedů z konstrukce označí odpovídající filtr ({ "40" } nových seedů tohoto scénáře: kvantové { "1" } a klasické { "2" } označeno); při { "64" } krát { "200" } je tentýž seed uvnitř pásma pro obě hodiny (NIS { "0.990" } a { "1.001" }). Známé navazující úkoly: druh fusion má stejnou mezeru (klasická integrita { "0.80" } s podlahou); druh hybrid zůstává nad { "0.99" }.

seg-c7308350b6d4 = <b>Zpřísněn vstup serveru MCP.</b> Nástroje scénářů serveru MCP nyní přijímají pouze inline obsah a odmítají pole se zdrojem souboru; velikost vstupu je omezena. Poradní upozornění: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

seg-065c4431197e = Lab replay: sledovací engine, monitory detekce a spouštěč kampaní pro záznamy IQ z GNSS, s návrhy smyček, odhady C/N0 a skóre, které k nim patří. Třída důkazů: vše níže je <b>MODELLED</b> nebo kontrolováno na vnitřní konzistenci proti uzavřeným tvarům a simulaci se seedem; nic z toho nepřidává řádek VALIDATED a verifikační registr je beze změny ({ "251" } řádků: { "124" } ověřených, { "123" } modelovaných, { "4" } partnerské). Je to softwarová analytická vrstva: nic zde nesyntetizuje průběh rušičky ani spoofera a nic nevysílá.

seg-912ecb44cee4 = Lab replay: testovací podmínky, spouštěč kampaní a hodnocení ({ "0.34.0" }).

seg-962c50f9ce8d = <c1/> přehrává záznamy × řetězce vstupní části × návrhy smyček (<c2/>) a hodnotí každou buňku proti souboru testovacích podmínek pro každý záznam (<c3/>, TOML nebo JSON). Tento soubor uvádí, co laboratoř o záznamu ví: očekávané družice a pro každou událost její štítek typu, začátek a konec, dotčené družice a uvedený profil J/S nebo výkonu rušičky. Jsou to jen metadata. Skóre pro každou družici, pro celý běh i pro každou událost, jsou:

seg-180447aaf31e = dostupnost, čas do ztráty zachycení a uvedené J/S při ztrátě;

seg-1ababddb0d87 = čas opětovného zachycení, od konce události a od ztráty;

seg-a6468323c971 = změřená degradace C/N0 pro každý interval uvedeného J/S;

seg-4cb6f510e159 = epizody falešného zachycení za hodinu zachycení (příznak trackeru, nebo Doppler proti pomocnému souboru pravdy);

seg-97c6243bac2e = jitter diskriminátorů PLL a DLL.

seg-014b28f61db8 = Vedle každé změřené křivky degradace je nakreslena analytická reference spektrální separace (<c1/> s <c2/> daného typu) a všude, kde se objeví, je označena MODELLED.

seg-eb5c38197dab = Buňky běží paralelně přes stavový automat zachycení sledovací relace a každá se zapisuje atomicky pod klíčem hashe obsahu. Klíč pokrývá SHA-256 záznamu, hashe podmínky, vstupní části, návrhu, běhu a hodnocení, požadovanou <c1/> (<c2/> | <c3/>) a verzi enginu. Je-li nastaveno <c4/>, uchovává se u každé buňky i její proud <c5/> a události zachycení, pojmenované podle klíče buňky a zahrnuté do hashe buňky. <c6/> a <c7/> jsou veřejné, takže spotřebitel může odvodit každý klíč i digest znovu. Opakovaný běh proto přeskočí hotové buňky a výstupy nikdy nezávisejí na počtu pracovních vláken. Běh zapisuje <c8/>/<c9/>, samostatný <c10/> a <c11/>. Prahy splnění a nesplnění (<c12/>, přepsatelné pro každý záznam) se použijí při sestavení zprávy.

seg-beec1c1264c9 = <c1/> (výchozí <c2/>, součást hashe hodnocení) vybírá C/N0, na kterém stojí hlášené C/N0 a křivka degradace. Oba odhady jsou vždy hodnoceny i hlášeny (mediány celého běhu i základu a pro každý interval J/S) a buňka i scorecard zaznamenávají odhadovač. NWPR čte nízko zhruba o { "8" } dB × Bn·T pod vlastním jitterem smyčky; M2M4 ne.

seg-baf1a2422a66 = Také nové:

seg-f36e22ff54c3 = <c1/> znovu sestaví scorecardy, zprávu a digest z buněk;

seg-aad7fcc28bc8 = <c1/> zkontroluje soubor testovacích podmínek proti jeho schématu;

seg-c3e5e4461aaa = <c1/> importuje anotace <c2/> záznamu SigMF jako události;

seg-c1a2ebb844c5 = Python získává <c1/>, <c2/> a <c3/>;

seg-cd69258ccc09 = <c1/> získává <c2/>, které je inkrementální a obnovitelné pod rozpočtem vzorků na volání, s každým souborem omezeným na pracovní adresář, a <c3/>.

seg-c398b66a7058 = Testy: <c1/> spouští syntetickou kampaň { "3" } záznamů × { "2" } vstupních částí × { "2" } návrhů. Jeho scény nesou uvedené profily C/N0 a pokrývá:

seg-3f2fbdecb101 = každou metriku zkontrolovanou proti vložené pravdě;

seg-e103a30260db = obnovení po částečném běhu jednoho pracovního vlákna s poškozenou buňkou, bajt po bajtu shodné s nepřerušeným během čtyř pracovních vláken;

seg-79164d8b0b22 = soubory epoch pro každou buňku;

seg-9470016f056a = regresi opětovného zachycení tří družic na { "20" } s: se zapnutým <c1/> je každý kanál zpět do { "2" } s po mezeře { "2" } s; výsledek s vypnutým <c2/> je připnut;

seg-1deb4ab83054 = prahy znovu posouzené bez nového běhu;

seg-351f9cdcbcd6 = CLI;

seg-2c35af369a36 = ignorované kontroly propustnosti a paměti v release režimu, včetně záznamu { "4" } GB ({ "5.45" }× reálný čas, špičková paměť { "2" } MB nad výchozí RSS; měření na jednom stroji, nikoli prahy).

seg-efbaf5a00ea2 = Pouze software: nic nevysílá a nesyntetizuje se žádný průběh rušení ani spoofingu. Návrhové a skutečné poznámky: <c1/>.

seg-c9871226c82f = Sledovací engine pro lab replay ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

seg-cd353717667b = <em>Soubory návrhu smyček</em>: TOML <c1/> (<c2/>; parser <c3/>). Jeden nebo více pojmenovaných návrhů nastavuje každé pole smyčky:

seg-0437148324ca = druh nosné (PLL, FLL nebo PLL podporovaná FLL), řády a šířky pásma;

seg-4e722960f8c6 = diskriminátory PLL/FLL/DLL a pomoc nosné;

seg-44976e3ad4e7 = rozestup a integrace;

seg-5c06173036d6 = prahy zachycení a okna C/N0 a synchronizace bitů;

seg-405e693dd757 = stavový automat zachycení;

seg-e6908584e2f4 = předávací akvizice (<c1/> nebo explicitní).

seg-8844cc963705 = Návrhy mohou jeden druhého <c1/>. Neznámé klíče se odmítají. Každý vyřešený návrh má hash SHA-256 nad kanonickým tvarem JSON (klíče seřazené na každé úrovni, pevné formátování čísel), takže hash nezávisí na pořadí polí; každý výstup jej zaznamenává. Povrchy:

seg-5c32182634f7 = <c1/>, kde explicitní příznaky přepisují návrh a jsou zaznamenány;

seg-9356751a6b98 = <c1/>, které spouští každý návrh v souboru;

seg-6815ec9b33c6 = Python <c1/>, <c2/>;

seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

seg-70d3b295bea0 = <em>M2M4 C/N0</em> (<c1/>, sloupec epoch sledování <c2/> za <c3/>; slovníky epoch v Pythonu). Odhad z druhého a čtvrtého momentu přes stejná okna jako NWPR, jen z výkonu prompt: NWPR čte nízko pod vlastním jitterem nosné smyčky (zhruba { "8" } dB × Bn_PLL·T) a M2M4 ne. Na GPS L2C CM ({ "20" } ms, nominálně { "40" } dB-Hz, PLL { "1" } až { "10" } Hz) čte { "39.93" } dB-Hz při každé šířce pásma, zatímco NWPR klesá z { "39.55" } na { "38.22" }; na L1 C/A při { "45" } dB-Hz čte { "45.34" }. NWPR a každý další výstup jsou beze změny (připnutí bit po bitu). Binární záznam zůstává { "184" } bajtů (hodnota využívá rezervovaný float a bit příznaku { "6" }).

seg-c02d07475717 = Další korelátorové odbočky (multikorelátor / SQM).

seg-70fcdc903413 = <c1/> (odsazení v chipech od prompt, kladné směrem early; nejvýše { "16" }, každé v rozmezí ±{ "2" }) koreluje další repliky vedle E/P/L a vrací je jako <c2/> (<c3/> v pořadí návrhu). Smyčky je nikdy nepoužívají. Klíč se při prázdnosti z kanonického JSON vynechává, takže hash výchozího návrhu a každý výstup bez odboček jsou beze změny (<c4/> zůstává; CSV/JSONL/binární výstup bez odboček jsou bitově shodné). S odbočkami: sloupce CSV/JSONL a binární záznam o <c5/> bajtech, jehož hlavička nese <c6/>, takže starý čtenář soubor odmítne, místo aby jej špatně parsoval. <c7/> (CLI), <c8/> (Python) a <c9/> (MCP <c10/>). Návrhy jednoho běhu se musí shodovat v odbočkách.

seg-66d494267598 = <em>Paralelní kanály</em> (<c1/> / <c2/>; Rust <c3/>). Kanály každého bloku běží až na N vláknech (<c4/>; <c5/> zůstává sériové). Korelace a stavový automat zachycení kanálu se dotýkají jen tohoto kanálu; jeho epochy a události se ukládají do vyrovnávací paměti a do výstupů se zapisují v pořadí kanálů, takže výstup (CSV, JSONL, binární, události, souhrn) je pro libovolné N bajt po bajtu shodný se sériovým během. Výchozí zůstává { "1" } vlákno. Změřeno na záznamu s 12 kanály, { "4" } s, { "4.092" } MHz na { "4" } jádrech: { "19.5" } s sériově, { "11.5" } s při { "2" } vláknech, { "6.3" } s při { "4" } ({ "3.1" }×; počáteční akvizice je sériová).

seg-cf59911d458f = <em>Export povrchu akvizice</em> (<c1/>; <c2/>, <c3/>). <c4/> (jeden PRN; CSV, JSON nebo binární), Python <c5/> a MCP <c6/> <c7/> zapisují celý povrch korelačního výkonu Doppler × fáze kódu, který hledání počítá (jeho buňky jsou buňky <c8/>, bit po bitu), s vrcholem a dvěma jemnými zpřesněními Dopplera: parabolickým odhadem a jemným hledáním po 1/16 binu (≈{ "5" } Hz při { "4" } ms koherentně, proti binům { "167" } Hz). <c9/> samo i každá výchozí hodnota jsou beze změny.

seg-a01bf371cc4f = <em>Streamovaný výstup epoch</em> (<c1/>; <c2/>). Každá aktualizace smyčky nese:

seg-ff549f07ce78 = korelátory early/prompt/late;

seg-00457c1bb059 = všechny tři výstupy diskriminátorů;

seg-b17d335f6cac = stavy NCO PLL/FLL/DLL a fázi nosné;

seg-a3bf3f1034cd = PLI a příznaky zachycení;

seg-7912a72da79b = oba odhady C/N0 a bity;

seg-8d105d656041 = stav zachycení.

seg-6af6331255fb = Zapisuje se průběžně, jako CSV, JSON Lines nebo verzovaná binární forma se čtečkami v Rustu (<c1/>) a Pythonu (<c2/>).

seg-aa081bfd9878 = <c1/> získává <c2/>, <c3/> a <c4/> (<c5/>) a <c6/> získává <c7/> a <c8/>. MCP <c9/> získává <c10/>/<c11/> a sestavuje svou odpověď ze souhrnu s omezenou pamětí.

seg-8cb2f8b27bad = Halda běhu už neroste s délkou záznamu: <c1/> ji měří počítajícím alokátorem ({ "6" }× délka, stejná špička v rozmezí { "64" } KiB), s kontrolou ukazující, že cesta v paměti roste.

seg-e3eff59db445 = Streamovaný výstup je bitově shodný s přehráním v paměti.

seg-c602902313f8 = <em>Stavový automat zachycení</em> (<c1/>, <c2/>): pull-in → zachyceno → ztraceno → opětovné zachycení → pull-in, nebo vyřazeno, jakmile ztráta přetrvá déle než <c3/> (výchozí { "30" } s). Neúspěšná hledání se opakují každých <c4/> ({ "0.1" } s), rovnoměrně rozložená, takže plán opakování přidá k naměřenému času opětovného zachycení nejvýše { "0.1" } s. Nepovinné prodlužování odstupu (<c5/> nad <c6/>) je ve výchozím stavu vypnuto a <c7/> je nepovinný strop ({ "0" }, tedy žádný, ve výchozím stavu). Výpadek { "2" } s na třech PRN při { "4.092" } MS/s nyní končí tak, že je každý kanál znovu zachycen a zamčen. Při rozpočtu 3 pokusů byl každý kanál vyřazen do { "0.2" } s od ztráty.

seg-56bc109dbef9 = Prahy (<c1/>, <c2/>, Dopplerovo okno opětovného zachycení) pocházejí z návrhu. Každý přechod je událostí se svým důvodem.

seg-b1c551e48389 = Kontrola falešného zachycení hledá sledovaný Doppler proti jeho aliasu ±1/(2T) FLL/PLL. Zachytí falešné zachycení, které změřil PR #38 (−{ "2400" } Hz sledováno { "500" } Hz mimo). Se zapnutým opětovným zachycením kanál končí zamčený na vloženém Doppleru.

seg-39409dd0b4bc = Mezera signálu { "0.8" } s je prohlášena za ztrátu a znovu zachycena do { "0.3" } s po návratu signálu.

seg-ce3162720ce5 = <c1/> (a sloupec tabulky) je stav po posledním přechodu, takže kanál vyřazený po poslední aktualizaci smyčky čte <c2/>.

seg-520ab6d84a6c = <b>Pomoc FLL jen během pull-in</b> (<c1/>, výchozí; <c2/> ponechává dřívější chování bit po bitu). FLL předá řízení PLL, jakmile vyhlazené PLI drží na úrovni <c3/> ({ "0.8" }) nebo nad ní po dobu <c4/> ({ "0.1" } s), a vrací se pod <c5/> ({ "0.6" }). Ponechaná zapnutá, dráha FLL { "10" } Hz porušovala fázový zámek pod zhruba { "38" } dB-Hz na čistých signálech: při { "35" } dB-Hz byl podíl fázového zámku { "10" }–{ "16" } % se skutečnou fázovou chybou { "38" }–{ "41" }°. S bránou drží výchozí nastavení { "100" } % při { "35" } dB-Hz s { "4.5" }°, stejně jako samotná PLL. Pull-in z chyby předání { "100" } Hz je beze změny. Důkazy s předregistrovanými prahy: <c6/>. <b>Výchozí smyčky tedy nejsou bit po bitu shodné s dřívějšími běhy výchozího návrhu.</b> K jejich reprodukci použijte <c7/>. Známé omezení: při { "35" } dB-Hz nastává předání { "1.9" }–{ "2.6" } s po začátku sledování a při { "33" } dB-Hz FLL { "10" } Hz drží PLI pod prahem předání, takže se pull-in nikdy nedokončí.

seg-1a911b958f8e = Nové klíče návrhu smyček a API, vypsané:

seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, přičemž <c5/> se změnilo z výchozích { "3" } na nepovinný strop (výchozí { "0" });

seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

seg-eecacf54975b = Hash návrhu je nad kanonickým tvarem JSON a hash vestavěného výchozího je <c1/> (připnuto testem).

seg-2405be1bc0c6 = Poznámky ke kompatibilitě výstupu:

seg-77670b7dd608 = tabulka <c1/> má na konci sloupec <c2/>;

seg-a52d9bbdd1a4 = CSV <c1/> má na konci sloupec <c2/> a jeho JSON má <c3/> a <c4/>;

seg-3fa0f9243806 = <c1/> sweepu je nyní průměrem přes každou aktualizaci, která má odhad NWPR (souhrn s omezenou pamětí), nikoli už přes druhou polovinu běhu.

seg-d542c1616f35 = Opětovné zachycení je <b>ve vestavěném výchozím nastavení vypnuto</b>, kde stavový automat jen pozoruje a smyčky běží bit po bitu stejně jako bez něj. (Samotné výchozí smyčky se ale změnily: viz pomoc FLL výše.) Zapněte jej pro každý návrh (<c1/>), pomocí <c2/> nebo pomocí <c3/>.

seg-61d6b3122888 = <b>Varování <c1/></b>: když je fs v rozmezí { "1e-6" } násobku poloviny čipové rychlosti (<c2/>), varují <c3/>/<c4/> (výstup, <c5/>, JSON sweepu), odpověď MCP <c6/> a výsledek Pythonu <c7/>, že jitter a zkreslení smyčky kódu nejsou reprezentativní. Příčina je zdokumentována s předregistrovanými prahy v <c8/>. Přesně při { "2" } vzorcích na čip s rozestupem 0,5 čipu je S-křivka DLL jediným schodem a smyčka kmitá: ≈ { "0.09" } čipu RMS chyby kódu (≈ { "26" } m) při { "45" } dB-Hz, proti ≈ { "0.004" } čipu při nesouměřitelné rychlosti. Zhruba { "2" } dB nízké C/N0 NWPR při této rychlosti má stejnou příčinu. Přesně při { "0" } Hz Dopplera kódu a { "4" } vzorcích na čip kód nikdy nepřekročí mrtvou zónu ±0,21 čipu, takže zkreslení fáze kódu až zhruba { "0.2" } čipu může přetrvávat, aniž by se projevilo v jitteru (změřeno: rozestup 0,5 čipu dává { "2.0" }× chybu kódu kontroly se střední hodnotou +{ "0.011" } čipu; rozestup 0,25 čipu dává +{ "0.125" } čipu); varování pokrývá tuto rychlost.

seg-8fbfb3f0bee2 = <b>Známé omezení: výchozí návrh nepředává FLL→PLL pod zhruba { "35" } dB-Hz</b> (podlaha pull-in ~{ "35" } dB-Hz; viz pomoc FLL výše a <c1/>).

seg-43f02bc861be = Hledání falešného zachycení nebo opětovného zachycení, které nelze spustit (rychlost bez celého počtu vzorků na periodu kódu), už nezastaví sledování.

seg-14f4e9edc443 = Testy: <c1/>, <c2/>, <c3/>, <c4/> a kolo tam a zpět MCP IQ.

seg-60141bb08f64 = Profily C/N0 v syntetických scénách ({ "0.34.0" }).

seg-1b44566881e8 = <c1/> plánuje časově proměnné C/N0 pro každou družici ve scénách samotné Kshana, jako odsazení v dB vzhledem k C/N0 scény. Tvary: skok, rampa, po částech lineární a scintilaci podobné Riceovy úniky se seedem s uvedeným S4 a dobou dekorelace. Použijí se přes existující háček kanálu scény (<c2/>, skládají se s efekty ionosféry, troposféry, scintilace a vícecestného šíření), beze změny jádra scény. <c3/> pomocného souboru pravdy sleduje profil.

seg-548eeca516ff = Povrchy: <c1/> a <c2/>.

seg-a242e4d9f071 = K čemu slouží: smyčky, monitory a hodnocení kampaní lze zátěžově testovat proti známé pravdě. Mění jen sílu legitimních signálů.

seg-ff4df7c343dc = Kontroly (<c1/>). Prahy: střední intenzita úniku v rozmezí { "5" } % od { "1" }, S4 v rozmezí { "8" } % od cíle (při S4 = { "0.3" }, { "0.7" } a { "1" }), korelace intenzity nad { "0.9" } při { "0.05" } τ a pod { "0.05" } při { "5" } τ; pravda přesně uvedené C/N0 plus profil; sledovaný pokles C/N0 NWPR v rozmezí { "0.7" } dB od skoku { "6" } dB. Změřeno: S4 v rozmezí { "1.3" } % od cíle a sledovaný pokles { "6.26" } dB.

seg-e214458cd1b6 = <b>Monitory detekce na cestě IQ ({ "0.34.0" } „Lab replay“).</b> Nový modul <c1/>, příkaz <c2/> a vazba <c3/>. Pozorují záznam a hlásí časové řady a označené události (čas začátku, poplachu a konce, špička, práh). Pouze detekují a měří; nic zde nevytváří signál.

seg-5b05b2a54fab = <b>Celkový výkon / AGC</b>: výkon bloku a zisk, který by použilo ideální AGC; označuje nárůsty a poklesy.

seg-2a84a640d7f1 = <b>Spektrum před korelací</b>: Welchovo PSD pro každý blok proti naučenému základu. Práh přebytku pochází z cíle falešných poplachů. Také komplexní špičatost a detektor pulsů. Detektor pulsů počítá vzorky nad prahem v každém bloku a vyvolá událost, když je přesný binomický horní chvost tohoto počtu pod <c1/> (výchozí { "1e-4" } na blok), nikoli když z-skóre překročí limit: při malých očekávaných počtech u krátkých bloků je jediný vzorek už několik sigma.

seg-7704ac807c38 = <b>C/N0 pro každý kanál</b>: dva jednostranné detektory změn CUSUM (pokles a nárůst), napájené nezávislými odhady (krok je nastaven z okna C/N0 smyčky).

seg-f965a68d388b = <b>SQM z korelátorů</b>: delta <c1/> a poměr <c2/>, plus testy asymetrie z dalších korelátorů, když je kanál dodává.

seg-a4006c2e8692 = <b>Řady indikátorů zachycení</b>: PLI a indikátor frekvenčního zachycení z po sobě jdoucích prompt, jako surové signály. Rozhodnutí o zachycení a ztrátě zachycení zůstávají na stavovém automatu zachycení sledovacího enginu.

seg-da72318f44cc = Jeden streamovaný průchod (<c1/>) spustí vše, se souborem nastavení TOML/JSON (<c2/>); spouštěč kampaní používá stejný vstupní bod. Vše MODELLED. Každá statistika je kontrolována proti svému uzavřenému tvaru simulací se seedem (<c3/>):

seg-0ff96e4c5a20 = překročení výkonu bloku proti chvostu Gamma;

seg-97b559ea0897 = střední špičatost { "2" } a rozptyl <c1/>;

seg-2b941c702b7f = podíl pulsů <c1/>;

seg-e8f068c41f0c = délky běhů CUSUM proti Siegmundově aproximaci (změřeno { "330" } a { "8.46" } vzorků proti { "338" } a { "8.34" });

seg-e2cd6a55e49b = indikátor fázového zachycení proti střední hodnotě Riceovy fáze;

seg-06291b1c6274 = na sledovaném signálu C/A se delta a poměr SQM rozptylují zhruba { "6" } % od uzavřených tvarů prvního řádu (změřeno { "5.97" } %; práh testu { "12" } %).

seg-12deb36a2e3a = Vzorec falešných poplachů spektrálního přebytku je aproximace; změřená míra byla { "1.3" }× vzorec. Od začátku do konce monitory označí:

seg-b002c66c7881 = skok C/N0 o { "6" } dB (čas změny v rámci jednoho odhadu);

seg-2e828d106393 = odraženou cestu objevující se uprostřed záznamu (test poměru);

seg-68063f036e2c = výpadek signálu (PLI klesne z { "0.999" } na −{ "0.3" } a FLI z { "0.93" } na { "0.03" } během něj);

seg-0cd95f0197ec = úzkopásmový tón a řídké vzorky s vysokou amplitudou (spektrální testy, testy pulsů a špičatosti). Jsou to obecné testovací vstupy DSP, nikoli modely interference.

seg-7128b9000cc2 = <c1/>/<c2/> streamují přes novou relaci (viz Přidáno).

seg-98891d33e48c = <c1/> si ponechává své sloupce { "0.32" }, ale nyní se streamuje, takže se řádky několika kanálů prokládají v časovém pořadí místo seskupení podle kanálu. <c2/> si ponechává svůj tvar { "0.32" } a stále drží každou epochu v paměti: pro dlouhé záznamy použijte <c3/>.

seg-2ef2d5771ade = <c1/> měří jitter přes aktualizace v druhé polovině doby běhu (dříve druhá polovina počtu aktualizací) a jeho CSV/JSON získávají sloupec <c2/>.

seg-bb69dbadbc81 = <b>README, osvěžený.</b> Začíná stejným řádkem s názvem jako web; snímky obrazovky Studia jsou pořízeny znovu ze Studia { "0.29.1" } a přibyl nový snímek Studia na telefonu s jeho spodní lištou kroků; nový pruh „Web“ ukazuje tři stránky kshana.dev ze sestavení { "0.29.1" } (<c1/>, složeno pomocí <c2/> a zaznamenáno v <c3/>); údaj o pokrytí je ~{ "95" } %; a alternativní text obrázku o výzkumu, který opakoval text obrázku o architektuře, nyní popisuje články. Odznaky v záhlaví jsou menší a kratší (výška { "18" } px; „~{ "95" }%“, „83/223“, „quality“, „AGPL-3.0“, „zenodo.20528627“), takže se všech jedenáct vejde na dva řádky; každý odkaz i alternativní text si zachovává plný význam.

seg-f61ef3e16884 = <b>Úloha sestavení kontejnerového obrazu dostává { "90" } minut.</b> Ve verzi { "v0.29.0" } narazilo emulované sestavení obrazu <c1/> pro linux/arm64 při překladu poslední crate na dřívější limit 45 minut, takže se obraz, záznam v registru MCP ani kontrola kanálu nepublikovaly. Limit je nyní { "90" } minut; obraz je beze změny.

seg-1688bf9f0fec = <b>Osm literálů s plovoucí desetinnou čárkou přeskupeno</b> v <c1/> a <c2/> (<c3/> → <c4/>): SonarQube Cloud četl poslední skupinu <c5/> nebo <c6/> jako chybějící příponu <c7/> či <c8/> (pravidlo S7454). Hodnoty jsou tatáž čísla, takže všechny výsledky zůstávají beze změny.

seg-81fd160937db = Dvanáct nových druhů scénářů a tři nové způsoby, jak číst běh. Engine nyní pokrývá rádiové spektrum, celou sluneční soustavu, konstelace kolem libovolného tělesa, kampaně, které řetězí scénáře do jedné mise, a určování polohy, navigaci a čas (PNT) z nízké oběžné dráhy Země (LEO) od signálu až po určení polohy. Každý běh lze také zapsat jako animaci, úplnou zprávu a sadu souborů pro interoperabilitu s jinými nástroji.

seg-118be64d7cb2 = Kolem enginu: přepracovaný kshana.dev (vícestránkový web a nový dashboard Kshana Studio, který spouští každou schopnost v prohlížeči), přepsaný README, čtrnáct nástrojů na serveru Model Context Protocol (MCP), sestavení pro prohlížeč, které dává stejná čísla jako nativní, a veřejná stránka pro Kshana Pro.

seg-ea31356bc17d = Soubory scénářů (plus jeden manifest sady)

seg-26654cd81de1 = { "138" }, z toho { "132" } je přibaleno pro <c1/>

seg-3d1a85e93e48 = z toho MODELLED (uvedený model, zkontrolovaný pouze na vnitřní konzistenci)

seg-e77f9d273ee1 = z toho PARTNER (vyžaduje hardware nebo data partnera)

seg-e94cd6b3561a = Odkud růst pochází:

seg-1759a8cce7d6 = Druhy

seg-94de9433d99f = Soubory scénářů

seg-03d7aea335dc = Řádky matice (ověřené + modelované)

seg-fdd674722717 = Spektrum

seg-59583fa40da3 = Sluneční soustava a určování polohy kolem libovolného tělesa

seg-fafa167623df = Námořní, silniční a železniční scénáře

seg-fc571c46e522 = Animace, zprávy, exporty pro interoperabilitu

seg-2746e0d9f787 = Návrhy signálů LEO a vícepásmové spektrum

seg-d40ec114d1f9 = Určování polohy, časování a fúze v LEO

seg-0157f649e65b = Řetězec LEO od začátku do konce

seg-423283112128 = Scénáře odolnosti LEO, oblastí zaměření a koncových uživatelů

seg-395beca13299 = Celkem přidáno

seg-ea9dc4093d8a = Schopnost LEO je nezávislá na systému: běží na obecných, uvedených parametrech a nepotřebuje žádný pojmenovaný systém. Pojmenované systémy jsou volitelné předvolby, každá ve vlastním souboru s veřejným zdrojem. Jedna předvolba, Celeste IOD (demonstrace na oběžné dráze), používá údaje představené na workshopu ESA NAVISP LEO-PNT, { "2026" } (ESA je Evropská kosmická agentura; NAVISP je její Program inovací a podpory v oblasti navigace); žije v jediném souboru, <c1/>, spolu s pěti scénáři dostupnými jen v repozitáři, takže ji lze zadržet bez úpravy zdrojového kódu, a žádný z jejích údajů z workshopu se v tomto seznamu změn neopakuje.

seg-c36a5015c03c = <b>Před upgradem si přečtěte „Revisions to published numbers“.</b> Mění se jeden výstup enginu (sloupce inerciální soustavy druhu <c1/> po opravě znaménka v nutační matici) a audit dokumentace opravil údaje, které dřívější dokumenty vytiskly.

seg-7fe505d3232b = Stavy: <b>VALIDATED</b> znamená ověřeno proti nezávislému vnějšímu orákulu (publikované tabulce, softwaru jiné skupiny nebo naměřeným datům); <b>MODELLED</b> znamená uvedený model zkontrolovaný pouze na vnitřní konzistenci; <b>PARTNER</b> znamená, že kontrola vyžaduje hardware nebo data partnera.

seg-ec7abb62f217 = 3GPP, 5G, NTN

seg-c5eb2d160429 = 3rd Generation Partnership Project; mobilní síť páté generace; nepozemská síť

seg-9bb1a987fedc = AD, BC

seg-bbe2b5aa0557 = letopočetní éry (anno Domini, před Kristem)

seg-05bbe79b1991 = AIAA

seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

seg-81799e2a0c43 = alternativní binární offsetová nosná; binární offsetová nosná; binární fázové klíčování; multiplexovaná binární offsetová nosná (modulace signálu)

seg-b2d165acb4e7 = ATOMIC

seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (publikovaný model efemerid LEO)

seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

seg-7f71a4795674 = kód hrubého určování (coarse/acquisition) a názvy nosných a civilních signálů systému Global Positioning System

seg-e464509f3abb = poměr výkonu nosné k hustotě šumu

seg-d8ba917c09b8 = CIO

seg-4321532214e3 = Celestial Intermediate Origin (nebeský přechodný počátek)

seg-de6c33774c9c = CLI

seg-3096eb1d5a15 = rozhraní příkazového řádku

seg-9aa3c2e54398 = 24bitová cyklická redundantní kontrola (polynom Qualcomm)

seg-1e1009e225aa = CSAC

seg-6ff440ff2c0c = CSS, HTML, SVG, XML

seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

seg-b4758ea40624 = hodnoty oddělené čárkami; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; jednotný lokátor zdrojů

seg-3ad592244ea8 = nemodulovaná nosná vlna

seg-287014fdc28d = CZML, KML, GeoJSON

seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (formáty map a glóbů)

seg-3415aa029e39 = Development Ephemeris { "441" } Laboratoře tryskového pohonu (Jet Propulsion Laboratory)

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digitální identifikátor objektu

seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

seg-a149d6e76bcb = zhoršení přesnosti: geometrické, polohové, horizontální, vertikální

seg-bc679de1b3a8 = E1, E5, E5a, E5b

seg-bb2b62a48d99 = názvy signálů Galileo

seg-544f4fcbd68f = název slotu v tabulce konstelace Global Positioning System

seg-dd9cfd581e5d = ECEF

seg-1a59ad88eca9 = geocentrická soustava pevně spojená se Zemí

seg-7cf8bec6418e = EE

seg-ceacb6924d4d = rovnice rovnodennosti

seg-5d59005d9757 = Earth Gravitational Model { "2008" }

seg-de3b39993e2a = EIRP

seg-7f1b85286c96 = ekvivalentní izotropně vyzářený výkon

seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (referenční astronomické knihovny)

seg-51f1fda55cc7 = ESA, NAVISP

seg-399a11a6e7c7 = Evropská kosmická agentura; její Program inovací a podpory v oblasti navigace

seg-01eb6fdcdb90 = FDMA

seg-6723fd8624df = vícenásobný přístup s frekvenčním dělením

seg-6d5d27174fe9 = GCRF, GCRS

seg-dd326440740d = Geocentric Celestial Reference Frame; Geocentric Celestial Reference System

seg-d41af8f18aed = GLONASS

seg-81f742947af1 = ruský globální navigační družicový systém (Global Navigation Satellite System)

seg-d2a107373b59 = GNSS, GPS

seg-d703f29c82eb = globální družicový navigační systém; Global Positioning System

seg-1df73b95ae4d = IAU

seg-0461e1933d23 = Mezinárodní astronomická unie

seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

seg-a54e0f483ad5 = dokument řízení rozhraní; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-aa7091bb80e6 = IMO

seg-6a7c8caf2a55 = Mezinárodní námořní organizace

seg-dbcf65546abf = INS, MEMS

seg-b767f348dab9 = inerciální navigační systém; mikroelektromechanický systém

seg-1be5a43002db = IOD

seg-7eb2ca980e20 = demonstrace na oběžné dráze

seg-92cd0058a058 = IQ

seg-c7fa50165400 = složky ve fázi a v kvadratuře

seg-41471e51e661 = specifikace rozhraní systému Global Positioning System

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Mezinárodní vesmírná stanice

seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo-Earth-fixed; true equator, mean equinox (referenční soustavy)

seg-8f1cbbae84aa = ITU, ITU-R

seg-d1b7680b4762 = Mezinárodní telekomunikační unie; její Radiokomunikační sektor

seg-a524e4c4a670 = poměr rušivého a užitečného signálu

seg-5d93361e20d4 = J2 to J6, J2000

seg-50255586b303 = zonální harmoniky gravitačního pole; epocha 2000-01-01 { "12" }:{ "00" }

seg-368f7969b33a = JPL

seg-44db8a7ae8f7 = Laboratoř tryskového pohonu (Jet Propulsion Laboratory)

seg-e0e589aaa8fe = LEO, MEO

seg-f4b580b88664 = nízká oběžná dráha Země; střední oběžná dráha Země

seg-aad5b54bfffd = MBSE

seg-800a5f6b96ad = modelově orientované systémové inženýrství

seg-535ba4896ba4 = NEES

seg-a230ecd2fe39 = normalizovaná kvadratická chyba odhadu

seg-56d5135d987d = ionosférický model Galileo

seg-408af08fe37b = OEM, SP3, TLE

seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (přesné dráhy); dvouřádkový soubor elementů dráhy

seg-ac4878697ee5 = PNT, PPP

seg-c19b5f77acc5 = určování polohy, navigace a čas; přesné bodové určování polohy

seg-dd94b086ed4b = PSD, SSC

seg-6e937d7e984e = spektrální hustota výkonu; koeficient spektrálního oddělení

seg-e0421c657cc1 = RAIM, SQM

seg-d6fee8d2ce49 = autonomní monitorování integrity v přijímači; monitorování kvality signálu

seg-dc53bead2cf5 = RINEX, RTCM

seg-497d23725a56 = Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services

seg-dcd6afa24ea6 = RMS

seg-0b4fc648e96c = střední kvadratická hodnota

seg-e1c3c49833fc = open-source knihovna pro určování polohy z GNSS, použitá zde jako orákulum

seg-9ead536db4aa = Simplified General Perturbations { "4" } (model dráhy dvouřádkových souborů elementů)

seg-865e7d1794b6 = Secure Hash Algorithm, 256 bitů

seg-8c718f7f9f5d = SigMF

seg-7830c93a5803 = Signal Metadata Format

seg-d282e836d47b = SISRE

seg-3c48d3ad7b43 = chyba vzdálenosti signálu v prostoru

seg-f045a03a5598 = SPS PS

seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

seg-758b51d8d5b6 = SRTM

seg-7e45c32b04e4 = Shuttle Radar Topography Mission

seg-8104773e1484 = STK

seg-f4fca0494aae = Systems Tool Kit (jeho formát souboru efemerid <c1/>)

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-1043491566b5 = SVID

seg-d67f9665f054 = identifikátor kosmického vozidla

seg-de4e841ce8a2 = celkový počet družic, rovin a fázování konstelace Walker

seg-4d6ebfefc096 = TEC

seg-5149401781dd = celkový obsah elektronů

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultra vysoké frekvence

seg-3cd6018f5b78 = UTC

seg-4d7d6ff2e8a5 = koordinovaný světový čas

seg-41b9b462d434 = WGS { "84" }

seg-ec04054b9f8e = World Geodetic System { "1984" }

seg-613b7c13cd32 = X1, X5

seg-349e041a5a90 = názvy signálů systému Xona Pulsar

seg-d6a3f210958a = Změněné publikované číslo je revize a zaznamenává se, nikdy se potichu neopravuje. Toto vydání přináší jednu revizi výstupu enginu a několik revizí údajů vytištěných v dokumentaci.

seg-1669eb4224f1 = Výstup enginu

seg-185961ebab61 = Redukce TEME→GCRS se otáčela o { "2" }·Δψ: nutační matice měla obrácené znaménko Δψ.

seg-504b78f30c54 = <c1/> sestavila <c2/>, kde <c3/> od SOFA sestavuje <c4/>, takže <c5/>, <c6/>, <c7/> a <c8/> otáčely o dvojnásobek nutace v délce, asi { "25" } obloukových sekund. Každá kontrola řetězce byla vlastnostní test (vlastní rotace, zpětný převod, nenulový příspěvek nutace), který přehlédne chybu ve znaménku; end-to-end test podle Vallada pokrýval TEME→PEF, TEME→ITRF a GCRS→ITRS, ale nikoli TEME→GCRS. Na příkladu z Vallada (AIAA 2006-6753, 2004-04-06) řetězec minul publikované GCRF o { "1 145" } m; nyní od něj leží { "0.11" } m a matice se rovná <c9/> z ERFA na { "1e-14" }. <c10/> i <c11/> na starém znaménku selhávají. Test konzistence CIO (Celestial Intermediate Origin) v <c12/> přičetl výsledný rozdíl ~{ "130" } m na vrub „≈ { "2" }·EE“; zbytek je nyní { "5" } cm a jeho mez je zpřísněna z { "250" } m na { "1" } m. <b>Tím se mění publikovaná čísla, zaznamenaná zde jako revize:</b> sloupce <c14/> a <c15/> druhu <c13/> (asi { "0.8" }–{ "1.0" } km pro přibalený scénář ISS (Mezinárodní vesmírná stanice); jeho sloupce TEME, pevné k Zemi, pozemní stopy, úhlů pohledu a Dopplera se nemění) a <c16/> / <c17/> pro soustavy GCRS a ITRS. Souhrnný řádek, graf ani zlatý hash žádného přibaleného scénáře tyto sloupce nečte. Nové exporty pro interoperabilitu používají opravený řetězec: poloha CZML první družice <c18/> souhlasí s redukcí téhož TLE v ERFA (propagovaného balíčkem Pythonu <c19/>) na { "2.3" } cm.

seg-a0a4026d22ed = <b>Druh <c1/>, nativně i v sestavení pro prohlížeč.</b> Druh nyní počítá každou transcendentní funkci jednou přenosnou matematickou knihovnou, takže jeho rámec má na každé platformě a v každém sestavení stejné bajty (v režimu Fixed). S tím se posouvá každý údaj <c2/> a stupeň <c3/> v <c4/>. Druh je v tomto vydání nový, takže se nic z dřívějšího vydání neposouvá, ale posouvají se údaje vytištěné před opravou: kontrolní hodnota <c5/> pro scénář kódování a dekódování byla <c6/> a je <c7/>, a SISRE dekódované zprávy je { "0.129" } cm. Na kshana.dev ukazovala karta Mise pro <c8/> nejhorší chybu vzdálenosti { "1.6" } mm při proložení { "60" } s a { "40.3" } mm při proložení { "900" } s; web je nyní sestaven z enginu tohoto vydání a ukazuje { "1.8" } mm a { "46.6" } mm.

seg-77f441bfc3c3 = <b>Mapa stopy rušení na kshana.dev (Mise).</b> Každá z jejích { "875" } buněk je jeden běh <c1/>, při kterém se mění jen poloha přijímače. Buňky se nyní počítají ze stejných souřadnic na tři desetinná místa, které odkaz buňky „otevřít tento běh“ předává Kshana Studiu, takže buňka ukazuje přesně to, co její odkaz reprodukuje. Průměrný poměr rušivého a užitečného signálu (J/S) { "30" } buněk se posouvá o { "0.1" } dB nahoru či dolů; dostupnost sledování se nemění v žádné buňce. Engine dává pro každou buňku v { "0.28.0" } a { "0.29.0" } shodné výsledky.

seg-146588a39e7c = <b>Seedované převzorkování v balíčku WebAssembly (WASM).</b> Sestavení pro prohlížeč losovalo ze stejného seedu jiné indexy bootstrapu a promíchání než nativní sestavení (v režimu Fixed). Interval <c1/> plochy pod křivkou byl v prohlížeči <c2/> a nyní je nativní <c3/>. Žádné nativní číslo se neposouvá.

seg-017810049453 = Údaje vytištěné v dokumentaci

seg-85ab2a364a37 = Dokumentace byla slovo od slova auditována proti během enginu tohoto vydání. Kde vytištěný údaj neodpovídal běhu, dokument byl opraven a každá oprava je zde uvedena, staré → nové. Ve všech níže uvedených případech se výstup enginu nezměnil; dokument jej špatně přečetl, špatně zaokrouhlil nebo ho přežil.

seg-1eacdefbfda2 = <b>Audit dokumentace stránek o spektru, konstelaci, kampani, animaci, zprávě a interoperabilitě a nový <c1/>.</b> Každý údaj byl znovu spuštěn tímto enginem. Mění se dvě publikovaná čísla: <c2/> uváděl test pokrytí { "5" } 000 družic jako „asi { "0.13" } s v ladicím sestavení“; to se nereprodukovalo ({ "1.24" } s na vytíženém notebooku), takže stránka nyní uvádí podíl předfiltru, který test vypisuje ({ "9.9" } % z { "19 440 000" } testů dvojic), a { "0.14" } s release binárky pro přibalený <c3/>. Tatáž stránka uváděla křížení E3F jako „mimo o { "0.050" } deg“; žádný test tento údaj nevypisuje, takže stránka nyní uvádí jen práh { "0.06" } deg, který test vynucuje, a odvození { "7.30" } oproti { "7.36" } deg za ním. Žádný výstup enginu se nemění.

seg-2ad182e2db15 = Dokumenty LEO-PNT: revidované publikované údaje (znovu spuštěno enginem tohoto vydání).

seg-6c2401365dd5 = <c1/> obchodní srovnání pásem: ionosférické zpoždění prvního řádu pro <c2/> je { "3.24" } m (bylo vytištěno { "3.25" } m) a pro <c3/> { "0.77" } m (bylo { "0.78" } m). <c4/> kódování a dekódování: SISRE dekódované zprávy bylo vytištěno { "0.119" } cm, kde běh dal { "0.122" } cm; stránka nyní tiskne { "0.129" } cm, údaj po opravě nezávislosti na platformě v části Fixed níže. <c5/> průlet LEO oproti GNSS: o { "32" } dB menší ztráta volným prostorem ve vrcholu průletu (bylo „{ "26" } až { "32" } dB“). U údajů o signálu a průletu se výstup enginu nezměnil; dokumenty jej špatně přečetly nebo špatně zaokrouhlily.

seg-fc3c8ba1b789 = <b>Tutoriály, ukázkový příklad řetězce a příkaz <c1/>, auditované proti enginu tohoto vydání.</b> Revize publikovaných údajů, staré → nové: druhů, které zapisují <c2/>, je šest, ne čtyři (<c3/> a <c4/> chyběly; <c5/>, <c6/>); průchod studených atomů ½bT² v Tutoriálu { "3" } je { "18,443" } s, ne { "18,440" } s; chyba zpětného převodu <c7/> v <c8/> je naměřených { "4.88e-7" } km, ne „~{ "1e-7" } km“; pásmo holdoveru CSAC v Tutoriálu { "2" } je { "2000" }–{ "3200" } s, které test vynucuje, ne „~{ "2600" }–{ "4400" } s“; Tutoriál { "1" } cituje řádky SP3 a blok geometrie s přesností, s jakou je engine zapisuje. Žádný výstup enginu se nezměnil.

seg-4c613cabb87b = Stránky o validaci, kvantové technice, SGP4, animaci, tvrzeních a integritě.

seg-c49d5cdb36e1 = <c1/>: vynucená mez simulované jednosekundové Allanovy odchylky hodin s bílým frekvenčním šumem je { "20" } % (bylo vytištěno { "25" } %; mez { "25" } % je ta na křivce v { "1" }, { "10" } a { "100" } s); řádek náhodné procházky rychlosti nyní uvádí svou vynucenou mez { "20" } % vedle pozorovaných asi { "12" } %; a dostupnost čipových atomových hodin v <c2/> je asi { "0.73" } (bylo vytištěno asi { "0.83" }). <c3/>: šum na jeden výstřel omezený vibracemi v ukázkovém příkladu studených atomů na stránce je asi { "46" } násobkem jeho šumového prahu výstřelu (bylo „~{ "45" }×“; přepočteno { "46.49" }) a rozsah „{ "1" }–{ "50" } µg/√Hz“ pro nasazená zařízení, který odporoval zařízení, jež stránka sama cituje, je nahrazen publikovanými údaji dvou citovaných zařízení. <c4/>: nejhorší rozdíl polohy je { "4.12" } mm (bylo „≈ { "4" } mm“), s uvedenou družicí. <c5/>: příklad videoenkodéru četl snímky o { "24" } snímcích za sekundu jako { "12" }; nyní používá { "24" }, frekvenci, kterou uvádí manifest snímků. <c6/>: model rušení má { "10" } testů (bylo { "8" }) a „{ "2.97" } m oproti { "48.8" } m“ u spřaženého filtru je nahrazeno tím, co jeho test vynucuje (chyba polohy spřaženého filtru pod { "0.6" } násobkem nespřaženého, přičemž vyhrává nejméně { "90" } ze { "100" } pokusů). <c7/>: razítko „Today“ četlo { "v0.22.0" }; nyní uvádí toto vydání a dvě schopnosti od té doby vytvořené (režim poruchy celé konstelace a podpůrná zpráva o integritě) odcházejí ze seznamu mezer.

seg-4fde8788f95f = <b>Druh scénáře <c1/>: model spektra pásma L a vodopád</b> (<c2/>, <c3/>, <c4/>). Celé pásmo L systémů GNSS jako jedna spektrální hustota výkonu (PSD): GPS L1 kód hrubého určování (C/A) a L2 civilní (L2C) (BPSK({ "1" })), Galileo E1 (multiplexovaná binární offsetová nosná, MBOC(6,1,1/11), nebo BOC({ "1,1" })), GPS L5 a Galileo E5a (BPSK({ "10" })), šumová hladina kT s šumovým číslem přijímače a rušiče s nemodulovanou nosnou (CW), úzkopásmové, s chirpem a se spárovaným šumem na skriptované časové ose. Každý rušič je pro každé pásmo hodnocen svým koeficientem spektrálního oddělení (SSC), z čehož vychází poměr rušivého a užitečného signálu (J/S) a efektivní poměr výkonu nosné k hustotě šumu (C/N0) pro každé pásmo a řádek. Graf je vodopád v SVG s pruhy C/N0; result.json nese mřížku zprůměrovanou po blocích ve výkonu. Volitelné <c5/> kreslí model jako vzorky IQ, zapisuje a čte záznam Signal Metadata Format (SigMF) (<c6/>, <c7/>) a porovnává odhad podle Welche s modelem; volitelné <c8/> odhaduje skutečný soubor SigMF. Přibalený příklad <c9/>: chirp bere L1 C/A a E1 v { "10" } s, tón CW na nosné L1 drží C/A na { "17.98" } dB-Hz po skončení chirpu, zatímco E1, jehož spektrum má v tomto místě nulu, se zotavuje; L5 a E5a zůstávají nedotčeny.

seg-fa9976349886 = Nový řádek VALIDATED: PSD signálů a SSC, proti hlavnímu laloku BPSK(n) o šířce 2n x { "1.023" } MHz, lalokům BOC({ "1,1" }) soustředěným na +/-1.023 MHz, uzavřeným tvarům podle Parsevala za publikovanými SSC -61.8 / -64.8 / -67.8 dB/Hz a učebnicovému Q = { "1" } (CW) a { "1.5" } (spárovaný). Maximum PSD BOC({ "1,1" }) leží na +/-0.759 MHz, ne ve středu laloku; test připíná obojí.

seg-411431a9b26b = Dva nové řádky MODELLED: vodopád a časová osa C/N0, které se přesně redukují na řetězec druhu <c1/> (křížově kontrolováno v každé zprávě), a kodek SigMF s odhadem podle Welche. V repozitáři není žádný záznam třetí strany.

seg-5c5c695e7c0a = <c1/>: varianta MBOC a <c2/>.

seg-bb346f4942a9 = Zpráva tiskne C/N0, které by dala tabulka reprezentativních hodnot Q druhu <c1/>, vedle hodnoty odvozené ze spektra; u tónu CW na nosné C/A se liší o { "1.8" } dB. Tři nové řádky matice: jeden ověřený (spektra signálů a koeficienty spektrálního oddělení) a dva modelované.

seg-673dfe048dad = <b>Efemeridy sluneční soustavy a určování polohy kolem libovolného tělesa.</b> Dva nové druhy scénářů.

seg-3e1b0e8e99e9 = <c1/>: Slunce, osm planet, Pluto, Měsíc, Phobos, Deimos, Io, Europa, Ganymed, Callisto a Titan v jedné epoše: heliocentrická poloha a rychlost v International Celestial Reference Frame (ICRF), gravitační parametr, poloměry, J2 (druhá zonální harmonika), kde je publikována, siderická rotace, pól a nultý poledník podle Mezinárodní astronomické unie (IAU), dráhová stopa po jeden oběh a světelný čas, jednosměrná a dvousměrná vzdálenost, sluneční Shapirovo zpoždění a odchylka od Slunce z tělesa pozorovatele a pro libovolný další spoj. Planety pocházejí z keplerovských elementů Laboratoře tryskového pohonu (JPL) podle Standishe a Williamse (Tabulka { "1" }, { "1800" } AD až { "2050" } AD; Tabulky 2a/2b, { "3000" } BC až { "3000" } AD); měsíce ze středních elementů JPL se synchronní rychlostí rotace podle IAU a Titan z rotačního modelu IAU. Příklad: <c2/>.

seg-6a094973208b = <c1/>: orbiter nebo přistávací modul na povrchu kolem kteréhokoli z těchto těles, navigující pomocí pseudovzdáleností z konstelace Walker kolem tělesa a dvousměrné vzdálenosti bez vlivu hodin od Země; zhoršení přesnosti, formální nejistota a seedované určení polohy metodou nejmenších čtverců s odkazem na Zemi i bez něj. Příklady: <c2/>, <c3/>.

seg-ed5063379a8b = <c1/> získává Merkur, Venuši, Jupiter, Saturn, Uran, Neptun, Pluto a sedm měsíců, vyhledávání podle jména a fyzikální záznam; <c2/> dává libovolné těleso vzhledem ke kterémukoli jinému přes stávající rozhraní <c3/>.

seg-8b5c2fbe91f7 = VALIDATED proti JPL Horizons (Development Ephemeris DE441; fixtury a dotazy v <c1/>): Merkur až Saturn a Země z Tabulky { "1" } v rámci dvojnásobku uvedené nominální chyby (nejhůře { "1.87" } násobku), všech osm planet z Tabulek 2a/2b (nejhůře { "1.71" } násobku) a světelný čas Země–Mars a Země–Jupiter. MODELLED: Uran a Neptun z Tabulky { "1" }, které proti DE441 překračují uvedenou chybu ({ "2.0" } a { "5.2" } násobku), Pluto, měsíce, konstanty těles a výsledky <c2/>.

seg-a3c83f6d2078 = Zjištění: lunární řada Montenbruck & Gill v <c1/> je již vlastním členem precese vztažena k rovnodennosti J2000 ({ "0.05" } stupně od Horizons), takže se používá bez další precesní rotace. Šest nových řádků matice: dva ověřené (polohy planet, světelný čas) a čtyři modelované.

seg-564133d6a0c4 = Konstelace kolem libovolného tělesa

seg-d1ddb76d8bf3 = <b>Návrh konstelací ve velkém měřítku (druh <c1/>, <c2/>).</b> Vzory Walker delta a Walker star (T/P/F), explicitní seznamy elementů a návrhy z více slupek, několik konstelací v jednom běhu, kolem Země, Měsíce, Marsu či jakékoli jiné planety, Pluta nebo velkého měsíce z konstant těles, které přidal druh <c3/>. Předvolby z publikovaných nominálních elementů: základ a rozšiřitelná 24slotová konstelace Global Positioning System (GPS) (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document, vydání { "1.1" }), BeiDou na střední oběžné dráze Země Walker 24/3/1 plus geostacionární a nakloněné geosynchronní družice (Open Service Performance Standard { "3.0" }) a GLONASS 24/3/1 (Interface Control Document { "5.1" }). Pokrytí a zhoršení přesnosti (DOP) na mřížce zeměpisné šířky a délky: družice v dohledu, GDOP, PDOP, HDOP a VDOP (geometrické, polohové, horizontální, vertikální) a dostupnost na buňku, globálně i v nejhorším místě, s jedněmi hodinami přijímače na konstelaci. Prefiltr viditelnosti (poloviční úhel pokrytí plus pás podružicové šířky, přesný na kulovém tělese) zpracuje { "5 000" } družic na mřížce { "10" } deg přibližně za { "0.13" } s v ladicím sestavení.

seg-8f4ebd177f3d = VALIDATED: generátor Walker reprodukuje tabulku { "23" } z Galileo OS SDD a vzorec slotů z GLONASS ICD; předvolba GPS reprodukuje sloupec rovníkových průchodů z SPS PS ({ "35" } ze { "36" } míst v rozmezí { "0.0108" } deg; E3F v rozmezí { "0.06" } deg, přičemž řádek samotné tabulky je nekonzistentní); globální rozdělení HDOP základu GPS odpovídá příloze B SPS PS (medián { "0.940" } oproti { "0.94" }, { "95" }% kvantil { "1.255" } oproti { "1.25" }, průměr { "0.965" } oproti { "0.96" }; práh { "0.03" }).

seg-65658a896a73 = MODELLED: libovolné návrhy, jiná tělesa, uzly fáze BeiDou a nakloněné geosynchronní dráhy, dvoutělesové dráhy s volitelným J2, pouze geometrie.

seg-3dfe470e8a5c = Scénáře: <c1/> ({ "102" } družic, dostupnost { "100" } %, medián PDOP { "0.95" }, { "31.0" } v dohledu nad { "10" } deg), <c2/> ({ "5 000" } družic, dostupnost { "99.22" } % při PDOP { "3" } nebo nižším nad { "20" } deg, { "0" } % na polárních čepičkách, prefiltr ponechává { "11.5" } % testů dvojic), <c3/> ({ "14" } družic kolem Měsíce, dostupnost { "21.33" } % celkově a nejvyšší nad jižní polární oblastí). Všechny tři jsou přibaleny pro <c4/>. Poznámky: <c5/>. Tři nové řádky matice: dva ověřené (generátor Walker a předvolby GNSS, globální DOP GPS) a jeden modelovaný.

seg-79e2d2c42166 = Kampaň řízená modelem spektra a konstelace kolem libovolného tělesa.

seg-4ab5f6f6bbbb = <c1/> řetězí druh <c2/> s holdoverem hodin a monitorem integrity (chirp bere L1 C/A a E1; tón CW pak drží C/A dole, zatímco E1 se zotavuje a přijímač přechází na oblohu jen se systémem Galileo), a je připnuta proti samostatnému příkladu vodopádu v <c3/>. <c4/> nyní určuje své centrální těleso přes <c5/>, takže lze konstelaci rozložit kolem libovolné planety, Pluta nebo velkého měsíce s konstantami, které používá druh <c6/>.

seg-dc904f639fed = <b>Kampaně: mnoho scénářů složených do jednoho běhu.</b> Nový druh <c1/> (<c2/>, zdokumentovaný v <c3/>) spouští členy existujících druhů stejným rozdělováním jako příkazový řádek a čte čísla zpět z jejich výsledků. Čtyři sekce v libovolné kombinaci:

seg-903ee141047a = <c1/>: zřetězená mise na jedné časové ose. Předvolby pro jednotlivé druhy čtou časovou chybu hodin proti její ochranné mezi, střední efektivní poměr výkonu nosné k hustotě šumu (C/N0) proti prahu sledování, vertikální ochrannou úroveň proti mezi výstrahy, chybu polohy, sledující družice a příznaky poplachu, držené na společné mřížce s hranicemi fází a událostmi. Stav se předává pomocí <c2/>, <c3/> a <c4/>.

seg-4eeedde09a77 = <c1/>: jeden až tři klíče s tečkou libovolného druhu, volitelně se seedovaným souborem realizací v každém uzlu.

seg-4c113198cbb7 = <c1/>: realizace k při základním seedu + k, se středem, rozptylem, percentily a bootstrapovým { "95" }% intervalem spolehlivosti s pevným seedem.

seg-df107253752d = <c1/>: sdílené hodnoty svázané do několika členů, s kombinovaným souhrnem nejlepšího a nejhoršího případu. Každý výsledek nese hash kampaně a souhrn přes každý výsledek člena. Čtyři přibalené scénáře: <c2/> (nominální stav, rušení, spoofing ukončený při detekci monitorem hodin v { "370" } s, holdover nesoucí podvržený posun { "37.0" } ns s inerciální jednotkou v setrvačném pohybu, poplach integrity, zotavení), <c3/>, <c4/> a <c5/>. <c6/> připíná identity složení: jednofázová kampaň reprodukuje samostatný běh bit po bitu u tří druhů, soubor realizací s pevným seedem je bajtově stabilní a u hodin s bílým frekvenčním šumem leží střed souboru uvnitř uvedeného intervalu s rozptylem uvnitř intervalu chí-kvadrát pro sqrt(q_wf * tau) = { "16.459" } ns. Tři nové modelované řádky matice.

seg-c611ee59301a = Animace

seg-14b2d3cc9e7c = <b>Export animace (<c1/>, <c2/>, <a1><c3/></a1>).</b> Každý běh, jehož výsledek nese časovou řadu, lze nyní zapsat jako animovaný soubor Scalable Vector Graphics (SVG) (klíčové snímky Cascading Style Sheets, žádný skript: průběhy se vykreslují za pohyblivým časovým kurzorem), jediný samostatný přehrávač HyperText Markup Language (HTML) (přehrát a pozastavit, posun, rychlost, každý panel na jednom synchronizovaném kurzoru, značky událostí, které po kliknutí přeskočí; žádný externí prvek) nebo očíslovanou posloupnost snímků SVG s <c4/>, který uvádí snímky za sekundu, trvání a časy snímků pro videoenkodér. Kampaň se přehrává jako své fáze s vyznačenými poplachy; běh spektra animuje svůj vodopád řádek po řádku. Přehrávač respektuje <c5/> a při <c6/> ukazují SVG i přehrávač místo pohybu hotový obraz. <c7/> a <c8/> nastavují přehrávání; <c9/> a <c10/> jsou vstupní body knihovny a <c11/> získává blok <c12/> jen tehdy, když běží <c13/>. Výstup je čistá funkce výsledku a voleb, při opakovaném běhu bajtově shodný, bez časového razítka. Druh bez vzorkované časové osy je odmítnut hlášením „no time series to animate“ a nic se nezapíše. Exportér kreslí vlastní vzorky běhu a nepřidává žádné číslo, takže je MODELLED (vnitřní konzistence) a nenese žádný řádek verifikační matice; žádné publikované číslo se nemění. Testy: <c14/> (determinismus, počet snímků, žádná externí adresa, dobře utvořené XML, cesta se sníženým pohybem a každý přibalený scénář s časovou řadou se animuje).

seg-c01b78b64065 = Zprávy

seg-2662fdb991f3 = <b>Pokročilé zprávy o běhu (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Každý běh z rozhraní příkazového řádku (CLI) nyní zapisuje <c2/>, tisknutelnou zprávu HyperText Markup Language (HTML), a <c3/>, tentýž obsah jako strojově čitelný dokument JavaScript Object Notation (JSON). Sekce: shrnutí pro vedení; každý vstup scénáře s jeho jednotkou, přečtenou ze schématu jednotek polí (blok <c4/> výsledku), jinak z přípony názvu pole, jinak uvedenou jako neuvedenou; výsledky s grafem běhu, každým skalárem a souhrnem každého číselného sloupce; u kampaně tabulka uzlů přesunu, střed Monte Carlo, směrodatná odchylka, 5. / 50. / 95. percentil a bootstrapový interval spolehlivosti s histogramem pro každou metriku, tabulka fází řetězce nebo členové složení a kombinovaný souhrn (a mřížka běhu <c5/> či <c6/>); časová osa událostí; štítek VALIDATED / MODELLED / PARTNER, orákulum a testové důkazy každého řádku verifikační matice, který druhy běhu uplatňují, čtené z matice přes převodník druhu na řádek (řádek, který hodnotí jednu vstupní cestu, například cestu Simplified General Perturbations { "4" } (SGP4) druhu <c7/> nebo cestu naměřeného záznamu druhu <c8/>, je uveden jen tehdy, když běh šel touto cestou, a řádek čtečky Shuttle Radar Topography Mission (SRTM) není uveden u žádného druhu, protože žádné pole scénáře nečte dlaždici SRTM); prohlášení o nemodelovaném a předpoklady, každé citované se svým zdrojem; a záznam reprodukovatelnosti (verze enginu, zdrojový commit, když sestavení nastaví <c9/>, otisky Secure Hash Algorithm 256-bit (SHA-256) souboru scénáře a dokumentu výsledku, seed, platforma a přesný příkaz). Zpráva nečte žádné hodiny: stejný scénář, seed a sestavení enginu dají bajtově shodnou zprávu a jediné časové razítko, které může ukázat, je to, které už zapisuje <c10/>. Tisková šablona stylů se vejde na A4 i US Letter, opakuje záhlaví tabulek a drží řádky i obrázky celé napříč stránkami; soubor Portable Document Format (PDF) vznikne příkazem prohlížeče „Uložit jako PDF“. Volba <c11/> neexistuje, protože vykreslení grafů do PDF by vyžadovalo novou, těžkou závislost. Testy: <c12/> hlásí každý přibalený scénář (žádná prázdná sekce, žádný zástupný text, štítky shodné s maticí, otisk scénáře shodný s otiskem souboru, bajtově shodné při opakovaném běhu) a <c13/> znovu spouští zaznamenaný příkaz v novém adresáři a vyžaduje bajtově shodný <c14/>. Žádné publikované číslo se nemění a počty druhů, souborů scénářů a řádků matice zůstávají beze změny.

seg-ce45e75c6d67 = <b>Zpráva, animace a exporty spolupracují.</b> Pokročilá zpráva získává sekci „Animation and exports“: animovaný výkres běhu vložený jako neaktivní obrázek (nebo důvod, proč žádný není), odkazy na soubory animace a exportů zapsané vedle ní a každý formát pro interoperabilitu s údajem, zda se použije, proč ne, a jeho specifikací; <c1/> nese tentýž blok <c2/>. Přehrávač animace v HTML uvádí soubory exportů zapsané vedle něj. Rozhraní příkazového řádku (CLI) nyní vykresluje exporty před zápisem zprávy, takže obě mohou soubory pojmenovat.

seg-c60dc5b92a60 = Exporty pro interoperabilitu

seg-5bfce52c5a13 = Exporty a importy pro interoperabilitu (<c1/>, <c2/>, docs/INTEROP.md).

seg-44e7c902490a = <c1/> zapisuje geometrii scénáře jako CZML (Cesium Language), KML (Keyhole Markup Language { "2.2" }, standard Open Geospatial Consortium, s časově označenými stopami <c2/>), GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) a efemeridy Ansys STK (Systems Tool Kit) <c3/> (<c4/>, metry, jeden soubor na pohybující se objekt) a syntetizovaný snímek IQ (složky ve fázi a v kvadratuře) druhu <c5/> jako dvojici SigMF (Signal Metadata Format) přes stávající <c6/>. <c7/> zapíše každý použitelný formát a vypíše, proč ostatní ne; <c8/> hlásí bez spuštění. Pohybující se objekty se zapisují v Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) a v zeměpisné délce, šířce a výšce vzhledem k Zemi WGS { "84" } (World Geodetic System { "1984" }) (KML, GeoJSON); pevná místa jsou v CZML <c11/>. Druh <c12/> přidává dvě stopy rušiček z vlastních rovnic spoje. <c13/> zapisuje GeoJSON <c14/> do vstupů trasy <c15/>, <c16/>, <c17/> a <c18/>. Exporty jsou bajtově deterministické a nenesou časové razítko. <c19/> ověřuje každý export proti jeho publikované specifikaci, porovnává exportované stavy družic s vlastními stavy enginu na { "1" } mm a spouští každý přibalený scénář každým formátem, přičemž každý buď exportuje, nebo uvede proč ne (tabulka v docs/INTEROP.md). Žádné publikované číslo se nemění: syntéza IQ druhu <c20/> se přesunula do jedné sdílené funkce a jeho dokument výsledku je bajtově shodný a <c21/> získává <c22/> a <c23/>, které používá jeho vlastní běh. Počty druhů, souborů scénářů a řádků verifikační matice zůstávají beze změny. Scénář oběžné dráhy nebo integrity bez <c24/> se datuje podle vlastních dat svých družic: <c25/> je nejstarší epocha TLE (dvouřádkový soubor elementů dráhy), broadcast efemerid nebo SP3 (Standard Product { "3" }) a každá taková družice se otáčí do soustav GCRS a pevných k Zemi v okamžiku vlastní epochy; 2000-01-01T00:{ "00" }:00Z se používá, jen když žádná družice nenese epochu. Exporty SP3 a OEM (Orbit Ephemeris Message) si ponechávají štítek 2000-01-01. Na podporu toho jsou přidány <c26/>, <c27/> a <c28/>; nic dosavadního je nečte.

seg-12c151a800f9 = Navigace z nízké oběžné dráhy Země: signál

seg-9b665682695a = <b>Návrhy signálů LEO-PNT a vícepásmové spektrum.</b> Nový druh <c1/> a druh <c2/>, který sahá za pásmo L: jeden druh, čtyři soubory scénářů (tři přibalené; soubor Celeste IOD je jen v repozitáři) a čtyři řádky matice (dva VALIDATED, dva MODELLED).

seg-b355b28bfd1b = <c1/>: parametrizované návrhy signálů pro určování polohy, navigaci a čas (PNT) z nízké oběžné dráhy Země (LEO) pro libovolný systém (pásmo, vysílací šířka pásma, přidělení ITU; složky akvizice, dat a pilotu s BPSK(n), BOC(m,n), MBOC nebo plochými spektry, podíly výkonu, podnosné FDMA, délky kódů a datové rychlosti), ze zkompilovaných veřejných souborů předvoleb v <c2/> (Xona Pulsar X1/X5, Iridium STL, signál příležitosti Starlink, CentiSpace, reprezentativní návrh pásma C a reprezentativní návrhy UHF/L/S/C/široké C, každý s odkazem na URL svého zdroje) nebo zapsané přímo. Pro každý signál: pásmově omezená PSD a podíly výkonu v pásmu, Gaborova šířka pásma, pásmově omezený jitter sledování kódu early-late v závislosti na C/N0 a rozestupu (Betz & Kolodziejski { "2009" }) a přesnost určení vzdálenosti, prostor hledání při akvizici, pravděpodobnost detekce a střední čas sériové a kódově paralelní akvizice, SSC do a z GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b a AltBOC se ztrátou C/N0, tolerance J/S pro CW, širokopásmový a spárovaný rušič z kódu SSC druhu spektra, obchodní srovnání pásem (ionosférické zpoždění, ztráta volným prostorem, určení vzdálenosti při stejném C/N0 a stejném EIRP, tolerance vůči rušiči) a volitelné kontroly tvaru proti popsanému měření. Příklady: <c3/>, <c4/>, <c5/> (pásma a konfigurace signálu Celeste IOD představené na workshopu ESA NAVISP LEO-PNT, { "2026" }; zadržené spolu s předvolbou Celeste IOD, viz „LEO-PNT end to end“ níže). Poznámky v <c6/>.

seg-8f58debf721f = <c1/>: pásma mohou být nyní předvolbou návrhu signálu (každá složka vykreslena, pásmově omezena, C/N0 a J/S vztaženo ke sledované složce) nebo vlastní nosnou a modulací; <c2/> přidávají vodopády přes jiné frekvenční rozsahy na jedné časové ose; rušič typu <c3/> (zahlcovací) se přidává ke čtyřem průběhům. Zpráva přidává <c4/>, <c5/> a <c6/> a jednu položku <c7/>. Prostá pásma dávají stejná čísla jako dříve. Příklad: <c8/>.

seg-98f74d85c54b = <c1/> získává integrální sinus, uzavřené tvary výkonu BPSK v pásmu a pásmově omezené Gaborovy šířky pásma, pásmově omezený jitter early-late pro libovolné spektrum a jeho Gaborovu mez, uzavřený tvar SSC pro BPSK s posunem, spektrum Galileo E5 AltBOC({ "15,10" }) a parser štítků modulace; <c2/> tiskne BPSK(1/3) jako zlomek.

seg-78d9e5e2c615 = Čtyři řádky matice: VALIDATED pásmově omezené uzavřené tvary ({ "90.3" } % výkonu BPSK v hlavním laloku, jitter se redukuje na koherentní tvar Kaplana a Hegartyho, { "0.0039564" } chipu při { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, a na svou Gaborovu mez, a vlastní SSC BPSK 2/({ "3" } R_c); Gaborův uzavřený tvar a SSC s posunem proti jeho Parsevalovu tvaru jsou uvedeny jako vnitřní křížové kontroly); VALIDATED maximální Doppler v LEO (Xona X1 { "33.2" } kHz uvnitř publikovaných { "32" } až { "34" } kHz, Iridium do { "0.5" } kHz od { "36" } kHz); MODELLED <c1/>; MODELLED vícepásmové spektrum.

seg-45d3d4a46d6b = Navigace z nízké oběžné dráhy Země: spoj

seg-1d120db87aae = <b>Průlet LEO-PNT a rozpočet spoje po pásmech: druh <c1/>.</b> LEO-PNT je určování polohy, navigace a čas z družic na nízké oběžné dráze Země (LEO). Uživatel (pozemní, námořní, letecký nebo uvnitř budovy, statický nebo pohybující se) a jedna či více družic LEO z navrženého průletu, explicitních elementů, dvouřádkového souboru elementů dráhy (TLE) přes SGP4 nebo konstelace Walker z kódu <c2/>. Pro každou družici, pásmo a epochu: úhly pohledu, vzdálenost, uzavřený tvar rychlosti změny vzdálenosti a zrychlení vzdálenosti (kontrolováno při každém běhu proti centrálním diferencím), Doppler a rychlost Dopplerova posunu, ztráta volným prostorem, EIRP (ekvivalentní izotropně vyzářený výkon) s izoflux, gaussovským nebo plochým diagramem družice, plošná anténa uživatele, plynný útlum podle ITU-R P.676, útlum deštěm podle ITU-R P.838/P.618, troposférická scintilace podle P.618, ztráta průnikem do budovy podle ITU-R P.2109 pro uživatele uvnitř budovy, polarizační nesoulad, šumová teplota systému a C/N0 (poměr výkonu nosné k hustotě šumu); ionosférické zpoždění prvního řádu pro každé pásmo z Klobucharova modelu nebo šikmého TEC (celkový obsah elektronů) z vertikálního TEC pod družicí a dvojice pásem bez vlivu ionosféry s jejich zesílením šumu. Družice Galileo nebo GPS se vyhodnocují stejným přijímačem z výkonů přijímaných podle dokumentů rozhraní, takže zvonovitý průlet LEO a ploché nosné MEO (střední oběžná dráha Země) sdílejí jeden graf. Sekce <c3/> udává čas do prvního určení polohy, energii na určení polohy a výdrž baterie vzhledem k pracovnímu cyklu (MODELLED).

seg-17f3503e1be3 = Nezávislé na systému: engine nepotřebuje žádnou předvolbu. Volitelné předvolby, každá ve vlastním souboru a označená PUBLIC (s URL), REPRESENTATIVE nebo WORKSHOP: obecné vícepásmové (UHF, L, S, C), obecné pásmo C, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink jako signál příležitosti jen s Dopplerem, CentiSpace a Celeste IOD (demonstrace na oběžné dráze), jejíž parametry signálu byly představeny na workshopu ESA NAVISP LEO-PNT, { "2026" }, a nacházejí se v <c1/>, takže je lze zadržet (viz „LEO-PNT end to end“ níže).

seg-a338cc46a1e0 = Veřejné stavební bloky v <c1/> (geometry, antenna, itu, iono, energy, presets), které mohou volat jiné moduly.

seg-887ad03cb6f6 = Scénáře: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-a20f1602c236 = Devět řádků matice. VALIDATED ({ "6" }): koeficienty ITU-R P.838-3 proti jeho tabulce { "5" }; útlum deštěm a scintilace podle P.618-14 proti validačním příkladům ITU-R Study Group { "3" }; ztráta průnikem do budovy podle P.2109 proti sešitu Study Group { "3" }; ionosférické škálování prvního řádu proti poměru skupinového zpoždění z IS-GPS-200, se ztrátou volným prostorem; maximální Doppler statického uživatele na kruhové dráze proti arXiv { "2509.19551" }, tabulka { "1" }. MODELLED ({ "3" }): průlet a rozpočet spoje, předvolby a rozpočet určení polohy s nízkou spotřebou energie. Jeden druh a šest souborů scénářů. Poznámky v <c1/>.

seg-ef74b0f08aa1 = Navigace z nízké oběžné dráhy Země: navigační zpráva

seg-866ff4ee8b19 = <b>Navigační zpráva LEO (druh <c1/>, <c2/>).</b> Vysílaná zpráva s efemeridami a hodinami družice pro určování polohy, navigaci a čas (PNT) z nízké oběžné dráhy Země (LEO), pro libovolnou dráhu, nosnou a model; pojmenované předvolby jsou volitelná data a každá schopnost běží bez nich. Jeden druh, pět souborů scénářů a devět řádků matice (tři VALIDATED, šest MODELLED). Viz <c3/>.

seg-c42821b6e855 = Obsah zprávy: SVID, vydání dat, pásmo a stav zdraví signálu; týden, čas v týdnu a polynom hodin druhého řádu; efemeridy v jednom ze čtyř modelů — 16parametrová keplerovská sada podle Galileo OS SIS ICD, tatáž sada plus polynomy oprav v podélném, příčném a radiálním směru, 22parametrový model Liu et al. { "2025" } (doi 10.3390/rs17162894) nebo polynom ECEF ATOMIC s nulovými hodinami — a sada Klobuchar, koeficienty NeQuick-G s efektivní úrovní ionizace a parametry převodu systémového času na UTC s případy přestupné sekundy podle ICD.

seg-e4565696f162 = Fitter: pravdivá dráha integrovaná s gravitací zonálních J2–J6 nebo EGM2008 a odporem, seedované volné nebo řízené hodiny, fit Levenberg–Marquardt na nesingulárních elementech, poté lineární korekční polynomy metodou nejmenších čtverců a hodiny proložené po odečtení uživatelova relativistického členu.

seg-a7287b7b336c = Čtyři analýzy a scénáře: <c1/> (chyba vzdálenosti signálu v prostoru (SISRE) oproti intervalu fitu a periodě aktualizace), <c2/> (čtyři modely, bity a 22parametrový fit Kshany ve výškách podle Liu et al. vedle publikovaných údajů, MODELLED), <c3/> (kontinuita při každém přepnutí zprávy v průletu) a <c4/> (vlastní zdokumentovaný binární rámec Kshany s CRC-24Q a rozpočtem kvantování, blok ve stylu RINEX-4 označený jako rozšíření Kshany a tabulka CSV).

seg-e272dce3d10f = VALIDATED: globální průměrné váhy SISRE proti publikované tabulce pro střední a geostacionární dráhy od Montenbruck et al. { "2018" }; uživatelský algoritmus Galileo proti RTKLIB na čtyřech skutečných broadcast efemeridách Galileo (<c1/>); CRC-24Q proti katalogové kontrolní hodnotě a příkladovému rámci RTCM { "10403" } { "1005" }.

seg-5c8592195b0d = Předvolby, po jednom souboru se zdroji: Xona Pulsar a Pulsar-0, Iridium, Starlink, CentiSpace, reprezentativní systém v pásmu C, ATOMIC a Celeste IOD (jediná předvolba používající materiál představený na workshopu ESA NAVISP LEO-PNT, { "2026" }, uchovaná v <c1/> spolu se svými scénáři, takže ji lze zadržet).

seg-9fb0cbf29cef = Navigace z nízké oběžné dráhy Země: fúze

seg-071f4db017c5 = <b>Fúze určování polohy, navigace a času z MEO + LEO: <c1/>, <c2/> a <c3/>.</b> Tři nové druhy scénářů v <c4/>, nezávislé na systému: každá konstelace jsou slupky Walker, sady elementů nebo předvolba GNSS, každý signál nosná, chipová rychlost a obálka poměru výkonu nosné k hustotě šumu (C/N0), každý rozpočet chyb explicitní jednosigma a pojmenované systémy na nízké oběžné dráze Země (LEO) jsou volitelné předvolby, po jednom souboru s jejich zdroji označenými jako veřejné, workshopové nebo odvozené (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), signály příležitosti Starlink, CentiSpace, reprezentativní systém v pásmu C, model efemerid ATOMIC s nulovými hodinami a jedna předvolba ESA Celeste pro demonstraci na oběžné dráze, jejíž parametry odvozené z workshopu leží v <c5/>, takže je lze zadržet).

seg-f28f7a441263 = <c1/> má čtyři režimy: určování polohy z Dopplera (dávkové nejmenší čtverce na rychlosti změny vzdálenosti se stavy driftu hodin a rychlosti, režim signálů příležitosti jen s Dopplerem, přesnost jednoho průletu v podélném a příčném směru a obálka Dopplera, rychlosti Dopplerova posunu a ryvu); společné vážené nejmenší čtverce GNSS + LEO s jedněmi hodinami na systém (mezisystémový posun) nebo se známým posunem, sigmami jednotlivých měření jako vstupy a DOP oproti počtu družic LEO; polární a arktické pokrytí v závislosti na zeměpisné šířce; a přenos času z LEO do koordinovaného světového času (UTC) oproti C/N0 a oscilátoru přijímače s výrazem pro převod systémového času na UTC podle IS-GPS-200.

seg-57afa384aabd = <c1/>: plovoucí rozšířený Kalmanův filtr pro přesné bodové určování polohy (PPP) na kódu a fázi bez vlivu ionosféry, jen GNSS i s doplněním z LEO, s dobou konvergence a testem konzistence NEES (normalizovaná kvadratická chyba odhadu) metodou Monte Carlo. Přibalený scénář dává { "7.4" } min se čtyřmi systémy MEO a { "4.8" }, { "3.2" }, { "2.7" } a { "2.3" } min se { "60" }, { "96" }, { "192" } a { "288" } družicemi LEO, vedle { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } a { "1.3" } min podle Li et al. (J. Geod. { "93" }:{ "749" }, { "2019" }) jako MODELLED srovnání trendu.

seg-3fa0556b3737 = <c1/>: určování polohy v nepozemské síti (NTN) 5G v mobilním družicovém pásmu S 3GPP n256 z Cramérovy–Raovy meze pro čas příchodu a Doppler.

seg-a0cc2699e276 = Scénáře: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (přibaleno) a <c8/> (jen v repozitáři, zadrženo spolu s předvolbou Celeste IOD).

seg-c0b6b98eeac3 = Osm řádků matice: obálka Dopplera v LEO VALIDATED proti publikovaným údajům Iridium (±{ "36" } kHz: { "35.9" } kHz, do { "5" }%) a Xona Pulsar X1 ({ "32" } až { "34" } kHz: { "33.6" } kHz ze slupky { "97" } deg, bez rozšíření) (<c1/>); určování polohy z Dopplera, společné určování polohy z pseudovzdáleností, konvergence PPP, meze NTN, časování z LEO, polární pokrytí a předvolby MODELLED. Tři druhy a osm souborů scénářů. Dokumentace: <c2/>.

seg-173793480abc = <b>LEO-PNT od začátku do konce: druh <c1/> a propojené stupně LEO.</b> Jeden systém pro určování polohy, navigaci a čas (PNT) z nízké oběžné dráhy Země (LEO) sledovaný od návrhu signálu až po polohu uživatele, každý stupeň je vlastním druhem enginu na vlastní tabulce scénáře, s hodnotami předávanými v kódu (<a1><c2/></a1>):

seg-41a4a2183ba3 = Pásma <c1/> mohou pojmenovat návrh <c2/> (<c3/>): pásmo převezme střed návrhu, vysílací šířku pásma a chipovou rychlost sledované složky, rozdělí svůj EIRP (ekvivalentní izotropně vyzářený výkon) mezi složky návrhu a hlásí v každé epoše C/N0 (poměr výkonu nosné k hustotě šumu) sledované složky a pásmově omezený jitter sledování kódu (chybu určení vzdálenosti; šum dvojic <c4/> ho také používá). Pásmo bez návrhu dává stejný výstup jako dříve.

seg-a076a43a9d44 = <c1/> spouští signál -> průlet -> navigační zpráva -> společné určení polohy <c2/> -> volitelně <c3/>. Každý systém LEO ve stupni určování polohy, který je nechává nenastavené, přebírá přímku C/N0 v sin(elevace) proloženou průletem, chybu vzdálenosti signálu v prostoru zprávy (SISRE: její chybu reprezentace na dráze družice průletu, s uvedeným členem určení dráhy <c4/> v odmocnině součtu čtverců) a nosnou a chipovou rychlost návrhu; případy přesného bodového určování polohy (PPP) přebírají SISRE. Každé předání je uvedeno se svou hodnotou a jednotkou a <c5/> kontroluje, že se každé rovná výstupu předchozího stupně a že změny na vstupu posouvají údaje na výstupu. <c6/> je nový vstupní bod zprávy.

seg-8c256ed478e9 = Scénáře: <c1/> (obecná konstelace { "1080" } km a reprezentativní signál <c2/>), <c3/> (veřejný signál X5), oba přibalené, a volitelný scénář <c4/> jen v repozitáři.

seg-879259c7ff86 = Předvolby Celeste IOD (demonstrace na oběžné dráze) pro oblasti průletu, zprávy a fúze určování polohy nyní leží v jediném souboru, <c1/>, který <c2/> zkompiluje jen tehdy, když existuje (příznak konfigurace <c3/>). Jeho pět scénářů (<c4/>) je jen v repozitáři, takže smazáním tohoto souboru a těchto scénářů se zadrží každé číslo představené na workshopu ESA NAVISP LEO-PNT, { "2026" }, bez úpravy zdrojového kódu; <c5/> kontroluje, které soubory smějí předvolbu pojmenovat nebo nést čísla jejího plánu pásem.

seg-110b1f7c7c63 = Každý druh LEO v převodníku pokročilé zprávy, jehož řádky specifické pro cestu jsou uvedeny jen tehdy, když běh šel touto cestou (intenzita deště, budova, analýza nebo režim, které proběhly). Dopplerova okna <c1/> získávají <c2/> a případy <c3/> získávají <c4/>, takže se obojí animuje; <c5/> a <c6/> exportují efemeridy CZML, KML, GeoJSON a STK a ostatní druhy LEO uvádějí, proč se formát nepoužije.

seg-1419edea5329 = Navigace z nízké oběžné dráhy Země: odolnost, oblasti zaměření a scénáře koncových uživatelů

seg-d084d86044b4 = <b>Odolnost LEO-PNT, jeden scénář pro každou oblast zaměření experimentu a jeden pro každou vertikálu koncových uživatelů a <c1/> jako přehled všech druhů a scénářů LEO.</b> Každý scénář běží bez jakýchkoli dat Celeste a je přibalen.

seg-07e91f076ab2 = <c1/> získává sekci <c2/>: spoofer padělá, ve vzdálenosti i rychlosti změny vzdálenosti vnitřně konzistentně, signály tvrzené polohy, která po nástupu skočí a/nebo je odtlačena od skutečné (pro každé pásmo LEO i signál GNSS z MEO), s ionosférou i bez ní. Běží dva monitory při uvedené pravděpodobnosti falešného poplachu: konzistence Dopplera a geometrie průletu (naměřené rychlosti změny vzdálenosti proti těm, které předpovídají dráhy a nezávislá předchozí poloha a rychlost; zobecněné nejmenší čtverce chí-kvadrát přes okno, na kanálech GNSS, LEO a všech, šum smyčky frekvenčního závěsu z C/N0) a konzistence mezi pásmy (skok modelově korigované kombinace bez vlivu geometrie u každé dvojice pásem LEO). Výsledek udává statistiky pro každou epochu (takže se animuje), každou dvojici a kdy každý monitor detekuje. Stavební bloky v <c3/>. Chybí-li sekce, výstup je beze změny.

seg-6a7852f1f053 = Každá dvojice pásem <c1/> také hlásí šikmý celkový obsah elektronů (TEC), který její kombinace bez vlivu geometrie obnoví ve vrcholu průletu, a sigmu kódového šumu tohoto odhadu (sondování ionosféry). To přidává dvě pole ke každému vícepásmovému výsledku <c2/>; žádné existující číslo se nemění.

seg-bdf333f4c978 = Režim časování <c1/> přijímá <c2/>: každý řádek pak hlásí svou časovou chybu a předpovězenou sigmu v každé epoše, se stejnými losy, takže statistiky řádků zůstávají beze změny a běh se animuje a řetězí v kampani.

seg-eb4461740dc5 = Kampaň nyní exportuje každý členský scénář, který má geometrii (běhy fází, základní scénáře přesunu a Monte Carlo, složené členy s navázanými sdílenými hodnotami), jako vlastní sadu souborů, s označením člena v názvu souboru; dříve kampaň neexportovala nic. Tabulka interoperability v <c1/> se podle toho mění.

seg-c0b1f4d9fed0 = Klíč přesunu kampaně může indexovat pole tabulek podle pozice (<c1/>).

seg-4c995017dd9c = Scénáře odolnosti: <c1/> (zahlcovač v pásmu L5 o šířce { "50" } MHz s výkonem posouvaným: každý signál pásma L klesá, signály LEO v pásmech UHF, S a C si udržují C/N0), <c2/> (rezerva J/S z přijímaného výkonu: GPS L5, Galileo E5a a Xona X5 ztraceny při -105, -100 a -95 dBW, obecný signál LEO o -135 dBW stále sledován při -90 dBW), <c3/> (skok o { "30" } m, který test Dopplera jen z GNSS minul a test na všech kanálech detekoval { "105" } s po nástupu), <c4/> (čtyři spoofery proti oběma monitorům) a <c5/> (GNSS rušeno, vrstva LEO v pásmech S a C sledována, autonomní monitorování integrity v přijímači jen na vrstvě LEO spouští poplach ve { "2" } z { "30" } epoch).

seg-bae66dac04cc = Scénáře oblastí zaměření: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (odolnost v pásmech L, S a C je <c8/>).

seg-c7947d9cc592 = Vertikální kampaně, každá animovaná a exportující své průlety LEO: <c1/>, <c2/> (přibalené námořní a železniční scénáře plus LEO), <c3/>, <c4/>, <c5/>, <c6/>. Výsledky na jeden řádek v <c7/>.

seg-222ad0b777f8 = Tři řádky matice MODELLED: monitor spoofingu podle Dopplera a geometrie průletu, monitor spoofingu mezi pásmy a sondování ionosféry. <c1/> kontroluje monitory (před nástupem mlčí, statistika Dopplera kvadratická ve skoku, ionosférický skok pozemního spoofera a žádný u spoofera, který ionosféru zohledňuje), identitu sondování, stopu časování proti statistikám řádků a že export kampaně se rovná exportu každého člena samostatně.

seg-f650b42bf210 = Stránka <c1/> se přesouvá do <c2/>; <c3/> je přehled.

seg-00a4ba834f37 = <b>Námořní, silniční a železniční scénáře.</b> Pět přibalených příkladů na existujících druzích, aby lodě, silniční vozidla a vlaky měly každé propracovaný případ. Každý údaj je MODELLED; žádný není ověřen proti naměřeným datům.

seg-682414bbe0c6 = <c1/> (<c2/>): širokopásmový rušič { "50" } W na stožáru { "30" } m, { "30" } km přes otevřenou vodu od lodi. Střední poměr rušivého a užitečného signálu (J/S) asi { "48" } dB a dostupnost klesá z { "1.00" } na { "0.00" }.

seg-4666dcd72c24 = <c1/> (<c2/>): inerciální navigační systém (INS) navigační třídy při { "12" } uzlech se ztraceným GNSS a bez podpory. Překročí { "10" } m po { "281" } s a { "100" } m po { "833" } s, což jsou údaje pro přiblížení k přístavu a oceánské vody z rezoluce A.1046({ "27" }) Mezinárodní námořní organizace (IMO), zde použité jako rozpočty.

seg-7407bb97aedd = <c1/> (<c2/>): spoofer o +{ "2" } dB, nezarovnaný s nosnou, který tlačí čtyři družice, aby odtáhl loď o { "500" } m. Sloučený monitor jej detekuje (skóre { "0.70" } proti prahu { "0.50" }) pomocí autonomního monitorování integrity v přijímači (RAIM) a monitorování kvality signálu (SQM); samotné monitorování výkonu jej mine.

seg-1edc0541930b = <c1/> (<c2/>): auto projíždějící podjezdem { "15" } s a výpadkem { "60" } s způsobeným rušičem u silnice, proti rozpočtu poloviny jízdního pruhu { "1.5" } m. Sloučená střední kvadratická (RMS) chyba při výpadku je { "1.9" } m pro jednotku MEMS (mikroelektromechanický systém) automobilové třídy a { "0.7" } m pro srovnávací jednotku taktické třídy; při volném běhu jednotka MEMS driftuje na { "850.8" } m.

seg-f9830a49659f = <c1/> (<c2/>): INS taktické třídy na vlaku rychlostí { "160" } km/h v tunelu. Překročí { "2" } m (rozlišení koleje) po { "35.8" } s, asi { "1.6" } km po vjezdu, a { "20" } m po { "107.3" } s. Jde jen o INS: engine nemá model odometru, takže je to pesimistická mez. Počet souborů scénářů v README se mění ze { "77" } na { "82" }. Všech pět je přibaleno pro <c3/> a uvedeno v hřišti v prohlížeči.

seg-77c8c53126fd = Server Model Context Protocol

seg-2deb4b35b41a = Server Model Context Protocol (MCP) dosahuje ke každému druhu a každému pohledu na běh: sedm nových nástrojů, celkem čtrnáct.

seg-7f4035dfd9db = <c1/> už rozdělovalo každý druh; agentovi chyběla cesta k platnému scénáři daného druhu a ke třem výstupům, které příkazový řádek zapisuje vedle výsledku. Nové nástroje:

seg-d9df5ab8817a = <c1/> a <c2/> poskytují přibalené referenční scénáře (tabulka <c3/>), každý s jeho druhem a první větou jeho vlastního záhlaví, bajt po bajtu shodné se souborem v <c4/>. Scénář, který je v repozitáři, ale není přibalen, je odmítnut s uvedením důvodu. Každý druh kromě <c5/> (jehož datový výřez se dodává jen s repozitářem) má alespoň jeden příklad.

seg-cb24ad7147ef = <c1/> vrací zprávu o běhu jako JSON (JavaScript Object Notation) nebo jako tisknutelnou stránku HTML (HyperText Markup Language) (<c2/>).

seg-9264b2f20e15 = <c1/> vrací časovou řadu běhu jako animovaný výkres SVG (Scalable Vector Graphics), přehrávač HTML nebo očíslované snímky, po shrnutí v JSON toho, co bylo nakresleno (<c2/>). Odpověď nese nejvýše { "120" } snímků; příkazový řádek zapíše libovolnou délku.

seg-959f23871238 = <c1/>, <c2/> a <c3/> poskytují exporty pro interoperabilitu a import trasy GeoJSON (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemeridy STK (Systems Tool Kit) <c5/> a SigMF (Signal Metadata Format), s indexem souborů v JSON (přípona, velikost a SHA-256, 256bitový otisk Secure Hash Algorithm) a binárním souborem vzorků SigMF jako base64.

seg-9ec3f9639b8c = Knihovna získává ve výchozím stavu vypnutou funkci <c1/>, která zpřístupňuje tabulku referenčních scénářů jako <c2/>; zapíná ji jen server MCP, takže balíček Pythonu (wheel) a modul WebAssembly stále text scénářů nenesou. Sady studií (<c3/>) zůstávají jen v příkazovém řádku, protože sada pojmenovává soubory na disku a server žádné nečte. Testy zpětného průchodu spouštějí každý nový nástroj proti přibaleným scénářům a kontrolují čísla enginu: spektrum, sluneční soustava, konstelace kolem Měsíce a Europy, přesun kampaně a druhy signálu z nízké oběžné dráhy Země (LEO), průletu, navigační zprávy, fúze určování polohy, přesného bodového určování polohy, nepozemské sítě a od začátku do konce. Každé místo, které uvádí počet nástrojů MCP nebo je vypisuje, nyní říká čtrnáct, kromě stránky hřiště v <c4/>, která je nahrazena webem.

seg-c11823028688 = kshana.dev, Kshana Studio a README

seg-fb584cf84218 = <b>Přepracovaný kshana.dev.</b> Jediná stránka hřiště je nahrazena vícestránkovým webem: Domů, Mise, Schopnosti, Důkazy, Vývojáři, Edice a Dokumentace, s Kshana Studiem na jedno kliknutí. Každý graf, mapa a číslo na něm je zaznamenaný běh enginu tohoto vydání, se scénářem a odkazem, který tentýž běh znovu otevře ve Studiu; sestavení webu odmítne záznam pořízený jiným commitem enginu. Stránky dokumentace se generují z <c1/> repozitáře a možnosti instalace z jeho kanálů. Písma a skriptové knihovny se servírují přímo z kshana.dev, takže žádná stránka nic nežádá od hostitele třetí strany. Staré adresy (<c2/>, <c3/>, odkazy ke sdílení <c4/>, odkazy pro vložení <c5/> a zbytek) přesměrují na nové místo a neznámá adresa dostane stránku { "404" }.

seg-9fa1c542332b = <b>Kshana Studio, dashboard pro každou schopnost.</b> Studio se otevře úvodní obrazovkou s dlaždicemi domén a dobrými prvními běhy a poté provede běh pěti číslovanými kroky: Zvolit scénář, Nastavit jeho parametry, Spustit engine lokálně v prohlížeči, Přečíst výsledky (nejprve klíčové hodnoty, každá s příznakem PASS nebo FAIL, kde běh uvádí práh, poté panely) a Sdílet nebo exportovat. Jedno vyhledávací pole najde scénáře, domény a pole v nich a skočí na ovládací prvek; běhy lze připnout a porovnávat; drobečková navigace říká, kde se nacházíte; na telefonu se kroky mění v lištu kroků. Každý druh scénáře má svůj pohled, včetně vodopádu spektra, sluneční soustavy, pokrytí konstelace, kampaní, animace, zprávy o běhu, exportů pro interoperabilitu a řetězce z nízké oběžné dráhy Země. Hluboký odkaz (<c1/>) otevře tentýž běh na pojmenovaném panelu.

seg-dcf2788bb430 = <b>Výzkum a citování.</b> Stránka Důkazy uvádí pět článků o Kshaně na arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } a { "2607.06212" }), každý se shrnutím, obrázkem vypočteným tímto enginem, příkazem, který jej reprodukuje, odkazem do Studia a BibTeXem, vedle toho, jak citovat software. README získává tutéž sekci Výzkum.

seg-fab395bab130 = Veřejná stránka pro Kshana Pro.

seg-167a59e94101 = <c1/> a stránka Edice na webu říkají, co proprietární nadstavba Pro přidává nad týmž enginem (optimalizátor návrhu, nejistota a citlivost, dossier mise, sledování kampaní, koexistence spektra, služba úloh na vlastních serverech, sledovatelnost požadavků), co každá vytváří a co nedělá. Každý údaj Pro, který web ukazuje, je uveden na této veřejné stránce. Pro nepřidává žádný fyzikální model a otevřený engine zůstává celý a zdarma.

seg-f57f0a610943 = <b>Přepsané README.</b> Krátké sekce, jeden obrázek na sekci, značka Kshana, dvě řady odznaků, generované obrázky architektury, toku scénáře, řetězce z nízké oběžné dráhy Země a verifikace (<c1/>, které na zastaralém obrázku selže) a snímky obrazovky Studia pořízené z běžícího Studia pomocí <c2/>. README pro crates.io, PyPI, npm a server MCP se řídí stejným návrhem. Dlouhý referenční materiál je sbalen nebo přesunut do <c3/>.

seg-e06522ca762e = <b><c1/> je nyní pokročilá zpráva o běhu</b> popsaná v části Added a řádek CLI <c2/> pojmenovává i <c3/>. Jednostránková výsledková karta, kterou nahradila, zůstává beze změny jako <c4/>, který vazby pro Python a WebAssembly stále vracejí. <c5/> zpřístupňuje větu, kterou <c6/> tiskne pro každý řádek MODELLED; tento dokument je beze změny.

seg-77a6f35c5c9a = <b>README říká, na čem Kshana Pro staví.</b> Sekce Edice a řádek Kshana Pro pod „Support & professional services“ nyní uvádějí, co dělají nástroje Pro pro modelově orientované systémové inženýrství (MBSE) a programy a které publikované výstupy otevřeného enginu čte (<c1/> a <c2/> každého běhu, soubor scénáře, schéma jednotek polí a štítky verifikační matice), a na čem v otevřeném enginu spočívají digitální dvojčata hodin, obchodní studie a balíčky důkazů. Pouze znění: žádný výstup enginu ani publikované číslo se nemění.

seg-1a19675ffa3b = <b>Kompatibilita.</b> Veřejný výčet <c1/> získává variantu <c2/>, což je zásadní změna pro volajícího, který jej porovnává vyčerpávajícím způsobem. Sloupce <c4/> a <c5/> druhu <c3/> se mění (viz „Revisions to published numbers“). Běh je stále reprodukován verzí enginu, která jej vytvořila.

seg-e7c5f77a6602 = <b><c1/> na serveru MCP uváděl čtyři druhy jako jediné s tabulkou CSV (hodnoty oddělené čárkami); šest ji publikuje.</b> Nástroj vždy vracel tabulku pro <c2/> a pro <c3/> (jeho analýzu <c4/> na modelu zprávy <c5/> nebo <c6/>), ale jeho popis, jeho odmítavá zpráva i dokumenty, které druhy vypisují, obě vynechaly, takže agent byl veden k tomu, aby se neptal. Nyní jsou uvedeny a test zpětného průchodu načítá obě tabulky.

seg-4094f58a5f4b = Rámec navigační zprávy z nízké oběžné dráhy Země (LEO) nebyl na každé platformě ani v každém sestavení jedné platformy tvořen stejnými bajty.

seg-5191262de022 = <c1/> zakódoval rámec s cyklickým redundantním součtem <c2/> v release sestavení na aarch64 macOS, <c3/> v ladicím sestavení téhož zdroje na témže stroji a <c4/> v sestavení WebAssembly (WASM); <c5/> dal nativně <c6/> oproti <c7/> v prohlížeči. Tři příčiny, každá vystopovaná k první rozcházející se hodnotě:

seg-f6501c3cd89d = <em>Mezi platformami.</em> Pravdivá dráha byla na obou bitově shodná; výchozí bod fitu nikoli. <c1/> bere oskulační sklon z <c2/> a argument perigea z <c3/> a obě matematické knihovny je v posledním místě zaokrouhlují odlišně (přes { "20 000" } argumentů se liší u { "781" } sinů, { "858" } kosinů, { "1 931" } exponenciál a { "1 899" } arkustangent o dvou argumentech).

seg-cd6f05096b8b = <em>Mezi profily sestavení.</em> Optimalizované sestavení na macOS sloučí sinus a kosinus jednoho argumentu do jediného volání kombinované systémové rutiny a její sinus není sinem samostatného <c1/> u { "379" } z { "200 000" } argumentů; neoptimalizované sestavení volá obě zvlášť. Druh bere sinus a kosinus společně na třinácti místech.

seg-91b0700dcb30 = <em>V hodinách.</em> Normální vzorkovač z <c1/> volá hostitelské <c2/> a <c3/> ve svých dvou vzácných větvích: ze čtyř milionů seedovaných losů se tři lišily v posledním bitu mezi nativním a WASM sestavením.

seg-0a4724333429 = Fit Levenberg–Marquardt, který se na tomto oblouku zastaví na svém limitu 80 iterací, a ne v minimu, přenáší jednu jednotku v posledním místě do odlišných kvantovaných polí. Druh nyní počítá každou transcendentní funkci přes nové <c1/>, které volá crate <c2/> v čistém Rustu (již ve stromu závislostí, nyní pojmenovanou v <c3/>), zkompilovanou z jednoho zdroje pro každý cíl, a ne přes volání knihovny, které optimalizátor přepisuje: <c4/> a kód scénáře. Celočíselné mocniny na této cestě jsou rozepsány jako umocňování opakovaným čtvercem, protože <c5/> má nespecifikovanou přesnost, a pravdivé hodiny losují své normální odchylky z <c6/> (Marsagliova polární metoda na surovém výstupu generátoru). Sdílené rutiny, jimiž pravdivá dráha integruje, jsou napsány jednou, generické vůči matematické knihovně, s interním vstupním bodem <c7/> vedle stávajícího: zrychlení ze sférických harmonik, zonální zrychlení a zrychlení od odporu, sekulární rychlosti J2 a Klobucharovo zpoždění. Stávající vstupní body jsou beze změny do posledního bitu, takže se nemění číslo žádného jiného druhu. <c8/> připíná celý 171bajtový rámec a jednu kontrolní hodnotu na model efemerid, v běžném (neoptimalizovaném) testovacím profilu, na každé platformě a bez brány na základního hostitele; <c9/> čte zdroje druhu z disku a selže na vlastní transcendentní volání, na vzorkovač <c10/> nebo na volání do modulu, který nebyl zkontrolován. Po změně dávají ladicí sestavení, release sestavení a sestavení WASM bajtově shodné dokumenty výsledků pro všech pět scénářů <c11/>. <b>Tím se mění čísla, zaznamenaná zde jako revize.</b> Druh <c12/> je v tomto vydání nový, takže se nic publikovaného v dřívějším vydání nemění, ale mění se každý údaj <c13/>, nativně i v sestavení WASM, a s ním stupeň <c14/> v <c15/>: údaje o dráze proto, že fit nyní začíná od přenosných elementů, údaje o hodinách proto, že pravdivé hodiny jsou jinou realizací téhož procesu. <c16/> je znovu vygenerováno z nových výsledků; jeho publikovaná kontrolní hodnota pro scénář kódování a dekódování byla <c17/> a je <c18/> (poloha do { "1.126" } mm od přesné zprávy, kde bylo { "0.665" } mm, hodiny do { "0.185" } mm, kde bylo { "0.451" } mm). Velikost změn v submilimetrových údajích je citlivost fitu, ne chyba v žádné z obou sad: fit je beze změny a stále se zastavuje na limitu iterací.

seg-c30f4cef4797 = Seedované převzorkování losovalo na 32bitovém cíli odlišné indexy.

seg-2bf668e23ec1 = <c1/> přes <c2/> bere z generátoru { "64" } bitů na 64bitovém hostiteli a { "32" } bitů na 32bitovém, takže stejný seed dal jiné indexy a v sestavení WASM zanechal proud jinde. Takto losovala tři místa: percentilové bootstrapy v <c3/> (<c4/>, <c5/>), promíchání před každým tréninkovým průchodem v <c6/> a permutační test v <c7/>. Nyní losují přes <c8/>, které vždy vzorkuje jako <c9/>: přesně to, co dělal 64bitový hostitel, takže se nemění žádné nativní číslo. <b>Tím se mění publikovaná čísla balíčku WASM, zaznamenaná zde jako revize:</b> bootstrapový interval <c10/> plochy pod křivkou (<c11/>, <c12/>) byl v prohlížeči <c13/> a nyní je nativní <c14/>.

seg-80f783da1d4f = <b>Názvy souborů efemerid STK z id pohyblivých objektů.</b> Id pohyblivého objektu obsahující <c1/> nebo mezeru (slupka konstelace a družice, <c2/>) způsobilo panic CLI při <c3/>; každé id nyní prochází bezpečnou částí souboru (písmena, číslice, <c4/>, <c5/>).

seg-a0dc5729d5e9 = <b>Znaménko nutace TEME→GCRS</b>, popsané výše pod „Revisions to published numbers“, protože mění publikovaný výstup.

seg-5ecbf0787f39 = <b>Druh scénáře <c1/></b> (<c2/>): sekundy, než volně běžící hodiny opustí ochrannou mez časově indexovaného slotu směrování nebo zadávání úloh, každý přispívající člen v tom okamžiku s pojmenovaným dominantním, čas zbývající od posledního určení a největší interval určení, který drží hodiny uvnitř, po odečtení latence určení. Hodiny pocházejí z výchozí hodnoty třídy, předvolby datového listu telecom-timing, vloženého datového listu (maxima Allanovy odchylky, stárnutí, teplotní koeficient) nebo naměřeného fázového záznamu. Porušení za nejdelším časem průměrování, který zdroj podporuje, je označeno jako extrapolované. Přibalený příklad: <c3/>. Viz <c4/>.

seg-40dd4c16b760 = <b>Naměřená hladina červeného šumu.</b> Překrývající se Allanova odchylka fázového záznamu je proložena váženými nejmenšími čtverci v bázi bílé fáze a frekvenční modulace podle IEEE Std { "1139" } (<c1/>), každý bod vážený svými ekvivalentními stupni volnosti, takže odpověď o holdoveru se může opřít o vlastní hladinu hodin místo o předpoklad třídy. Nevážený fit vložil do záznamu s bílým šumem falešnou hladinu flicker šumu a zkrátil porušení po { "2 000" } s o { "30" } %.

seg-22c09748488b = <b>Validace holdoveru inverzí na zadržených datech skutečných hodin</b> (<c1/>): proloženo na první třetině záznamu cesiových hodin 5071A proti vodíkovému maseru, předpovězená porušení o jedné sigmě při šesti prazích od { "0.5" } do { "2.5" } ns leží v rozmezí { "0.84" } až { "1.03" } porušení naměřených na zbývajících dvou třetinách, proti prahu { "1.5" } stanovenému před prvním spuštěním testu. Kontrola (jednosekundová Allanova odchylka čtená jako bílý šum) mine o faktor asi { "1 000" } a práh nesplní. Nový řádek registru VALIDATED; pracovní postup <c2/> jej nyní spouští.

seg-cd73dc87a22f = <b>Stejná předpověď na skutečném krystalovém oscilátoru</b> (<c1/>, <c2/>): na naměřeném krystalovém oscilátoru s termostatem je předpověď na zadržených datech konzervativní, na { "0.59" } až { "0.70" } naměřeného porušení a nikdy později, a většinou mimo práh { "1.5" }, protože šumová hladina tohoto oscilátoru se během 5.5hodinového záznamu snížila na polovinu; při proložení ve vzorku leží v rozmezí { "0.98" } až { "1.17" }. Případ krystalu není ověřen a zůstává MODELLED. Běh také odhalil chybějící člen: frekvence krystalu putuje, takže model nyní nese nejistotu frekvence známé při určení (<c3/>); bez něj byla předpověď optimistická až o { "2.5" }×.

seg-8519979d184c = <b>Stejná předpověď na atomových hodinách na oběžné dráze</b> (<c1/>, <c2/>): { "14" } dní finálních hodin International GNSS Service pro družice GPS Block IIF, s protokolem sepsaným před stažením dat. Osm z deseti družic leží v rámci prahu { "1.5" }; G25 a G30 předpovídají porušení až asi dvakrát pozdější, než bylo naměřeno. Protokol vyžaduje, aby splnila každá družice, takže případ na oběžné dráze není ověřen a zůstává MODELLED; výsledek je připnut.

seg-0d666a725b77 = <b>Třídy hodin s teplotně kompenzovaným krystalem (TCXO), krystalem s termostatem (OCXO) a rubidiovým atomovým frekvenčním etalonem (RAFS)</b> (<c1/>, <c2/>, <c3/>), součástky, které létají na komerční sběrnici malých družic nebo používá pozemní brána, každá s odkazem na jeden veřejný datový list (<c4/>). Přidány <c5/>, <c6/> a <c7/>. <c9/> druhu <c8/> přijímá tři nová id. Přidání variant do veřejného výčtu je zásadní změna pro volajícího, který jej porovnává vyčerpávajícím způsobem.

seg-24ae82b115f5 = <b>Ochranná úroveň času pro přijímač na oběžné dráze</b> (<c1/>, volitelná sekce <c3/> druhu <c2/>): jak dlouho může pozemní spoofer dosáhnout družice na nízké oběžné dráze Země při jednom průletu, jaký posun nasbírá spoofer při uvedené maximální rychlosti náběhu, než družice opustí jeho dosah nebo proběhne nezávislá kontrola, a zda je každá kontrola při kontaktu se zemí nebo přes crosslink na tomto spooferu nezávislá. Přesně se redukuje na <c4/> pro hodiny bez flicker šumu, šumu bílé fáze nebo náhodného běhu. MODELLED.

seg-4032bc03fad5 = <b>Tři poznámky</b>: <c1/> (včetně toho, proti které metrice putování se má slot přijímat: maximální absolutní časová chyba, nikoli maximální chyba časového intervalu ani časová odchylka, a proč), <c2/> (podepsaný příkaz použitý v oklamaném čase stále směruje chybně) a <c3/> (kde Kshana běží; jádro pro let bez <c4/> se nenabízí).

seg-712035e19515 = Vydání { "v0.27.3" } dorazilo na crates.io (<c1/> a <c2/>) a PyPI, poté se zastavilo u npm, takže npm, obraz MCP na ghcr.io, registr MCP, JetBrains Marketplace a kshana.dev je nikdy nedostaly. { "0.27.4" } nese tentýž engine, s opravou vydání níže, do každého kanálu.

seg-bab8d4d1bc54 = <b>Krok publikace npm pojmenovává tarball explicitní cestou.</b> npm čte holé <c1/> jako zkratku GitHubu <c2/>, takže úloha npm vydání { "v0.27.3" } se pokusila naklonovat <c3/> a selhala s „Permission denied (publickey)“. Samotný tarball byl sestaven a atestován. Krok nyní publikuje <c4/>. Vše po npm v pořadí vydání (obraz MCP, plugin pro JetBrains, kontrola shody kanálů a web) bylo přeskočeno, jak je navrženo.

seg-f9a112755eb1 = <b>Katalogy jednotek telecom-timing a <c1/> jsou vyňaty z detekce kopírování</b>, podle stejné politiky a stejného testu odůvodnění jako ostatní katalogy. Brána kvality SonarCloud zčervenala kvůli duplicitě v novém kódu ({ "4.0" }% oproti { "3" }%) a každý duplicitní blok byl řádek jednotek nebo položka masky ITU-T.

seg-3c3dacae06d6 = <b><c1/>: jak dlouho drží navigace malého dronu po rušení GNSS.</b> Spouští inerciální jednotku MEMS (mikroelektromechanickou) třídy řídicí jednotky letu, Bosch BMI088, proti jednotce taktické třídy. Signál GNSS (Global Navigation Satellite System) je { "100" } s nominální a poté { "60" } s odepřen (<c2/> ukazuje, proč to dělá blízký rušič). Biasy BMI088 jsou rezidua zbylá po kalibraci při spuštění, převzatá z teplotních koeficientů v jeho datovém listu (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s na K pro gyroskop a < { "0.2" } mg na K pro akcelerometr. V souboru jsou označeny dva předpoklady: zahřátí o { "10" } K po kalibraci a pokračující zahřívání o { "1" } K za minutu za letu. Drift za letu je chyba, kterou se filtr nemůže naučit, než rušení začne, a ta ukončí setrvačný pohyb. Každý údaj je modelovaný; jeho ověření vyžaduje záznamy letů z prostředí s rušením. <c3/> jej vypíše.

seg-7154f69a2b8a = <b>Každý senzor <c1/> si může nastavit vlastní apriorní hodnotu filtru</b> (<c2/> nebo <c3/>, s <c4/> a <c5/>). Výchozí hodnota je beze změny, takže každý existující scénář dává stejný výsledek. Zbytkový bias gyroskopu jednotky spotřebitelské třídy leží asi { "26" } sigma mimo výchozí hodnotu taktické třídy, kde by jej filtr nikdy nenaučil. Apriorní hodnota, která není konečná a kladná, je odmítnuta a výsledek apriorní hodnotu zopakuje, je-li nastavena.

seg-2b54735b19aa = <b><c1/> dává uživateli registru scénář ke spuštění.</b> Uživatel <c2/> má spustitelný soubor a žádný adresář <c3/>, takže první příkaz, který mu každý quickstart dal, selhal. Rozhraní příkazového řádku (CLI) nyní nese { "75" } referenčních scénářů, které běží samostatně, bajt po bajtu zkompilovaných z <c4/> (<c5/>; tabulka žije v binárce CLI, takže balíček Pythonu (wheel) a modul WebAssembly nenabobtnají). <c6/> je vypíše; <c7/> jeden zapíše. Další dva soubory jsou jen v repozitáři: <c8/> čte archivovaná data laserového měření vzdálenosti k Měsíci, která se dodávají jen s repozitářem, a <c9/> je manifest studie, který spouští tři sourozenecké soubory pomocí <c10/>. Požadavek na kterýkoli z nich uvede důvod a skončí s kódem { "2" }, místo aby vypsal něco, co nemůže běžet samo. <c11/> drží tabulku shodnou s adresářem v obou směrech, takže nový soubor scénáře, který není ani přibalen, ani uveden jako jen pro repozitář, selže.

seg-43249b6a1f3c = <b>Každý ukazatel kvality ve výsledku hodin, dráhy, hybridního nebo fúzního běhu nyní říká, zda je VALIDATED, nebo MODELLED, přímo ve výsledku.</b> Dokument výsledku získává blok <c1/>, vždy jako svůj poslední klíč. Uvádí každý hlášený údaj (například <c2/>) s jeho úrovní — VALIDATED znamená ověřeno proti nezávislému vnějšímu orákulu, MODELLED znamená model z prvních principů testovaný vnitřně — a řádek verifikační matice, ze kterého se úroveň čte. Úroveň pochází z <c3/> přes <c4/>, takže neexistuje druhá tabulka, která by se mohla rozejít. Dříve se slova „ověřeno“ a „modelováno“ ve výsledku holdoveru hodin neobjevila ani jednou a čtenář surového JSON (JavaScript Object Notation) neměl jak obojí rozlišit. Údaje o poloze <c5/> a <c6/> nemají žádný vlastnící řádek matice, takže jsou uvedeny pod <c7/>, místo aby jim byla přidělena úroveň. Blok nenese žádná čísla. Je prokázáno, že je aditivní, ne jen předpokládáno: jeho odstranění vrátí dokument před změnou bajt po bajtu pro všech pět druhů (test enginu) a oba golden harnessy (<c8/>, <c9/>) nyní odstraňují přesně tento klíč, a jen když je poslední, a zbytek hashují proti svým <b>nezměněným</b> zamrazeným konstantám. Seznam v každém harnessu připíná, které scénáře musí blok nést, takže se výjimka nemůže nenápadně rozšířit.

seg-8faf1981d797 = <b>Druh <c1/> odpovídá v jednotkách časového inženýra: časová chyba, maximální chyba časového intervalu (MTIE) a časová odchylka (TDEV), každá s PASS nebo FAIL a rezervou proti maskám Sektoru telekomunikační standardizace Mezinárodní telekomunikační unie (ITU-T).</b> Masky jsou přepsány z platných vydání: G.8272 (07/2025) pro třídy A a B primárních referenčních časových hodin (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) pro rozšířené PRTC v uzamčeném režimu a v holdoveru (včetně jeho obálky časové chyby, která stoupá z { "30" } ns na { "100" } ns po dobu holdoveru určenou tím, jak dlouho byly hodiny uzamčeny), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) pro telekomunikační hraniční a podřízené časové hodiny, třídy A až D, a G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) pro meze sítě v referenčním bodě C. Každá položka, kterou tato doporučení nechávají „k dalšímu studiu“, chybí, není odhadována, a <c2/> uvádí každé číslo s jeho tabulkou nebo článkem a každou vynechanou položku. Zpráva také uvádí čas do překročení každého rozpočtu časové chyby: ve výchozím stavu výchozí holdover ePRTC { "100" } ns, síťový příděl holdoveru { "400" } ns, mez bodu C { "1 100" } ns a koncový požadavek třídy { "4" } { "1.5" } mikrosekundy.

seg-9e5325e1b0ca = Vstupem je buď syntetický holdover, nebo vaše vlastní řada. Syntetický používá jednu ze čtyř předvoleb oscilátoru (krystalový oscilátor s termostatem, rubidiový etalon, cesiový etalon a čipové atomové hodiny), každá nese údaje o stabilitě, stárnutí a teplotě z pojmenovaného datového listu Microchip. Jak se tyto údaje stávají bílým, flicker a náhodně procházejícím frekvenčním šumem, stárnutím a teplotním členem, je uvedeno v každé zprávě a označeno MODELLED. Vlastní řadou jsou dvojice <c1/>, vložené přímo (tak běží v prohlížeči) nebo, v nativních sestaveních, ze souboru s hodnotami oddělenými čárkami. Tabulka MTIE/TDEV s limitem každé zvolené masky vedle ní se zapisuje jako artefakt CSV běhu.

seg-a23a96819dee = <c1/> je 24hodinový rubidiový holdover se stárnutím, flicker šumem a denním teplotním cyklem: jeho největší časová chyba je { "603.2" } ns, překročí { "100" } ns { "8 206" } s po ztrátě a zůstává po celý den uvnitř { "1.5" } mikrosekundy a neprojde obálkou holdoveru rozšířeného PRTC, jak se sluší na hodiny, které nejsou třídy cesia. <c2/> ukazuje vložený vstup. MTIE a TDEV, které druh hlásí, jsou zkontrolovány proti balíčku allantools na uložené { "2" } 048vzorkové řadě holdoveru, přesně pro MTIE a na { "1.1e-15" } pro TDEV, takže matice získává jeden řádek VALIDATED a dva MODELLED (přepis masek a předvolby) a nyní má <b>{ "171" } řádků — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. Pokrytí jednotek polí roste z { "60" } z { "61" } druhů na { "61" } z { "62" } a z { "1,742" } na { "1,788" } popsaných polí. Druh je nový a aditivní: žádný existující scénář, pin ani publikovaný údaj se nemění.

seg-5bb1ad9a34ec = Hřiště spouští engine ve Web Workeru na pozadí, takže pomalý scénář již stránku nezamrazí.

seg-b1ab3546f131 = <c1/> hostí engine WebAssembly a <c2/> mu předává každé provedení scénáře — běhy, přesuny parametrů a exporty SP3 / OMM / OEM / CSV. Běh, který trvá déle než { "150" } ms, ukáže stav zaneprázdnění (Spustit zakázáno, „Running… N s“) a tlačítko Zrušit, které worker ukončí a znovu spustí; prohlížeč, který nedokáže spustit modulový worker, se vrátí ke staré cestě v hlavním vláknu. <c3/>, vyřazený z katalogu, protože zamrazil stránku, je v něm zpět, označen jako pomalý: v Chrome trvá asi { "13" } s (čtyři volání enginu po asi { "3" } s), během nichž stránka zůstává responzivní.

seg-146200dfac7e = <b>Každá hlášená veličina <c1/> nyní nese jednotku, třídu původu a definici — poslední druh na celoprojektovém seznamu výjimek kromě jednoho.</b> Všech { "41" } číselných polí dokumentu VYDANÝ je popsáno, takže pokrytí jednotek polí roste z { "59" } z { "61" } druhů na { "60" } z { "61" } a z { "1,698" } na { "1,742" } popsaných polí, přičemž nevyřízený nedostatek definic zůstává beze změny na { "239" }.

seg-61b1219ae0e3 = Bránil tomu pin, který zamrazuje vydaný dokument a který pojmenoval <c1/> jako klíč, jejž dokument nesmí nikdy získat. Přidání jednoho by znamenalo smazat tuto aserci a znovu nastavit základ tří hashů ve třech souborech — tvar nerozeznatelný od zakrytí regrese. Místo toho dva piny, které tento dokument měří, nyní <em>dokazují</em>, že přidání je aditivní: každý odstraní blok <c2/> zpět a znovu hashuje proti konstantě zamrazené před vznikem bloku a <b>obě konstanty jsou beze změny</b>. Mutace potvrzuje, že záruka je skutečná — změňte vydanou hodnotu a znovu nastavte základ hashe celého dokumentu tak, jak by to udělala neopatrná oprava, a odstranění a nové hashování stále selže. Třetí pin, v obecném harnessu registry-golden, má základ nastaven znovu v souladu se šesti sourozenci, kterým byl základ nastaven znovu právě z tohoto důvodu, a jeho literál <c3/> nesoucí hodnoty se nemění.

seg-a73409e0b664 = <c1/> hlásí, proti které pravdě byl každý řádek orientace Země hodnocen a jak často se uplatnila záložní varianta.

seg-6e0493a39f1a = <c1/> získávají <c2/> a <c3/>. Hladina <c4/> je hodnocena proti finálnímu Bulletinu B a může používat jen epochy, které jej publikují; každý řádek <c5/> je hodnocen proti <c6/>/<c7/>, které se vracejí k rychlé hodnotě z Bulletinu A. Na přibaleném výřezu { "2026" } to je { "12" } z { "31" } vzorků při jednom dni, oproti { "0" } u hladiny — takže řádek hladiny a řádky předpovědí vedle něj spočívají na měřitelně odlišné pravdě, což zpráva nyní uvádí, místo aby to nechala odvodit z počtu vzorků, který stoupá tam, kde vnořené horizonty říkají, že nemůže.

seg-7ba5be07fa8c = <c1/> vydává keplerovský základ shodné velikosti.

seg-f9dc8fae6452 = <c1/> znovu spouští ilustrativní konstelaci při počtu družic sady ZÍSKANÁ, přítomné jen tehdy, když se počty liší. Počet je součástí geometrie tohoto návrhu — RAAN a střední anomálie jsou rozloženy jako <c2/> — takže bez něj byla pětidružicová získaná sada hodnocena proti osmidružicové ilustrativní a návrh byl zaměněn s velikostí. U pětidružicové referenční sady LANS se { "8.68" } z 14.24bodového rozdílu v pokrytí ukazuje být třemi chybějícími družicemi a jen { "5.56" } bodu návrhem; u čtyř družic skutečně na lunární oběžné dráze dosahuje účelově navržená čtyřdružicová sada { "4.86" } %, kde ony dosahují { "0" } %. Test připíná, že shodný řádek je znovu postavená konstelace, a ne nakonfigurovaná s přepsaným štítkem, jak byl poprvé napsán a co běh poté hlásil.

seg-2e7e4dbbb7f6 = <b>Devět karet schopností na veřejném webu, pokrývajících { "22" } řádků verifikační matice, které se dodávaly bez karty na úrovni produktu.</b> Engine vyrostl o rodinu schopností — kontrolu ARAIM proti publikovaným referenčním vektorům Working Group C, skutečnou získanou geometrii lunární konstelace, lunární kontury odepření s naměřeným pásmem C/N₀, krok od rozvrhu VLBI ke kovarianci stanic, optické a RF předání s vkládáním poruch napříč modalitami, předpověď orientace Země v reálném čase proti archivovanému Bulletinu A, sdílení apertury mezi navigací a komunikací, setrvačný pohyb INS/TRN a pokrytí jednotkami a původem — každá s řádkem matice a přibaleným scénářem, a žádná z nich nebyla na kshana.dev pojmenována. Pokrytí karet řádky roste z { "72" } ze { "168" } řádků na { "94" }.

seg-3dc189224fe8 = <b>Osm scénářů přidáno do katalogu hřiště.</b> Tlačítko Spustit na kartě schopnosti se objeví, jen když soubor nese i <c1/>; šest karet pojmenovalo scénář, který nenesl, takže se vykreslily bez možnosti je spustit — jedna z nich, datum reálného laserového měření vzdálenosti, byla v tomto stavu od svého vydání. <c2/> nyní hlídá invariant v obou polovinách: cíl <c3/> karty musí být přibalen pod <c4/> <em>a</em> nabízen katalogem. Testováno mutacemi proti oběma způsobům selhání.

seg-2d69334516e9 = <b><c1/> vydává svou geometrii po družicích jako <c2/></b>, když je nakonfigurováno exportní místo (G11). Je to největší pole, které crate publikuje — { "2304" } řádků ve vydané společné tabulce komunikací a navigace — a dosud se k uživatelům dostávalo jen uvnitř JSON, tvaru, který zkrátil 57bodovou křivku sourozeneckého scénáře na { "23" } bodů pod sloupcem tvrdícím, že jsou tam všechny. Jeden řádek na spoj, počet řádků na řádku záhlaví, sloupce antén přítomné jen tehdy, když byla anténa nakonfigurována. Běh bez exportního místa je bajtově beze změny a nezapisuje žádný soubor.

seg-7958d26072f7 = SBOM nyní popisuje to, co se dodává: { "60" } komponent se stalo { "66" }.

seg-219cd333b000 = <c1/> uváděl každý balíček rozlišení s výchozími funkcemi, včetně vývojových závislostí. Tím se do soupisu materiálu dostaly <c2/> a <c3/> — crates jen pro testy, nezkompilované do žádného artefaktu — a vynechal řetězec <c4/>, který linkuje wheel pro PyPI (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), což je hranice cizích funkcí tohoto wheelu. Skript nyní prochází graf rozlišení od balíčku kshana jen přes běžné a build hrany, přes sjednocení sad funkcí výchozí, <c13/> a <c14/> (balíček npm nese tentýž SBOM), pro každou cílovou platformu. Připnutý verdikt shody CycloneDX má základ nastaven znovu přes jeho uložený generátor: { "60" } → { "66" } komponent, { "53" } → { "60" } složených licenčních výrazů a stále nula chyb schématu, jakmile jsou umístěny do standardního tvaru <c15/>.

seg-23c98d31f749 = <b>Tabulka reprodukovatelnosti CSV dosahuje každého vstupu, nejen CLI a wheelu pro Python.</b> Server MCP získává sedmý nástroj, <c1/>, který spustí scénář a vrátí bajtově stabilní tabulku, kterou CLI zapisuje jako <c2/> — nebo chybu pojmenovávající druhy, které ji publikují (<c3/>, <c4/>, <c5/> a <c6/> jen když jsou nastaveny <c7/> + <c8/>). Modul WebAssembly získává <c9/>, který vrací týž text nebo <c10/>. Test zpětného průchodu MCP a testy vazby pro Python nyní připínají vrácené CSV bajt po bajtu proti <c11/> a připínají, že <c12/> vrací zapsané bajty a { "0" } bez vytvořeného souboru pro druh bez tabulky. Každé místo, které uvádí počet nástrojů MCP nebo je vypisuje, nyní říká sedm.

seg-86c3fed5e23a = <c1/> v modulu WebAssembly: jeden běh enginu pro každý výstup.

seg-3f2677cd280b = <c1/>, <c2/>, <c3/> a <c4/> každý provádí scénář od nuly, takže hřiště platilo za čtyři úplné běhy na kliknutí — asi { "12" } s místo { "3" } s pro <c5/> v prohlížeči. <c6/> vrací <c7/> z jednoho běhu a hřiště jej nyní používá. Shoduje se se čtyřmi samostatnými voláními bajt po bajtu.

seg-fa05c9ee0c6a = <b>REVIZE: vazba biasu gyroskopu ve filtru GNSS/INS měla špatné znaménko a údaje o výpadku <c1/> se mění.</b> Rozšířený Kalmanův filtr (EKF) chybového stavu drží oba inerciální biasy jako rezidua (skutečnost mínus běžící odhad, zpětně přidávaná sčítáním). Sloupec akcelerometru řídil chybu rychlosti pomocí <c2/>, ale sloupec gyroskopu řídil chybu orientace pomocí <c3/>. Zbytkový bias gyroskopu ve skutečnosti otáčí vypočtenou orientaci o <c4/>, takže každý odhad biasu gyroskopu tlačil nesprávným směrem. Balíček zůstal stabilní jen proto, že jeho výchozí apriorní hodnota biasu gyroskopu ({ "1e-4" } rad/s, 1 sigma) byla dost těsná, aby ty stavy držela na místě. Při širší apriorní hodnotě filtr divergoval, i když byl skutečný bias gyroskopu nulový: { "93" } m sloučené chyby při výpadku se stalo { "4.3" } km. Publikované údaje pro <c5/> se mění takto:

seg-47e22e713df6 = před (≤ { "0.27.2" })

seg-5215a0a41b89 = po

seg-f58aecc6864c = IMU se studenými atomy, sloučená střední kvadratická hodnota při výpadku

seg-c4fbd933ddb2 = { "96.1" } m

seg-002d765fca02 = { "1.9" } m

seg-d14616d4ea1b = IMU se studenými atomy, setrvačný pohyb v toleranci ({ "50" } m)

seg-35f8f623ea28 = { "30" } s

seg-91645c14401b = { "60" } s (celý výpadek)

seg-f297a2652cf8 = taktická IMU, sloučená střední kvadratická hodnota při výpadku

seg-0ac27c6d4206 = { "62.5" } m

seg-eda895cc3b86 = { "3.1" } m

seg-e0ab83f1d8d7 = taktická IMU, setrvačný pohyb v toleranci ({ "50" } m)

seg-5c526991a521 = { "37" } s

seg-743060da5543 = Údaje při volném běhu ({ "130.7" } m a { "314.3" } m) se nemění; filtr nikdy nepoužívaly. Dřívější čtení balíčku, že sloučený setrvačný pohyb je omezen podlahou orientace při předání a proto se s lepším senzorem nezlepšuje, bylo artefaktem této chyby a je staženo. S konstantními biasy bez šumu je filtr nyní naučí, dokud je GNSS k dispozici, takže sloučený setrvačný pohyb je nejlepší případ. Externí reference filterpy (<c1/>) kontroluje jen aktualizace měření, proto propagaci nikdy neviděla. Dva testy nyní kontrolují znaménko přímo a oba selhávají na starém. První, v <c2/>, vloží známý zbytkový bias gyroskopu do strapdownu a vyžaduje, aby filtr předpověděl výslednou chybu orientace na { "2" } %. Druhý vyžaduje, aby široká apriorní hodnota naučila bias gyroskopu { "1e-3" } rad/s a zůstala do { "6" } m. Cross-platform golden <c3/> je znovu připnut z tohoto důvodu a z žádného jiného.

seg-f764678e3376 = <b>Každý quickstart registru nyní běží tak, jak je napsán, na čistém stroji.</b> Měřeno před touto změnou, příklady crates.io a PyPI (Python Package Index) četly <c1/>, což instalace z registru nemá, a příklad npm spadl pod Node.js s <c2/>, protože <c3/> balíčku načítá svou binárku WebAssembly a <c4/> v Node nedokáže číst lokální soubor. Nyní:

seg-e77a540d2f90 = <c1/> a <c2/> nesou tento scénář přímo, jak to už dělal <c3/>. Fence v Rustu je celý program s vlastním <c4/>, protože řádek <c5/> skrytý pro rustdoc, kterým končil, se na crates.io zobrazuje a po vložení se nezkompiluje. <c6/> jej stále kompiluje bajt po bajtu a nyní také odmítne skrytý řádek ve fence.

seg-ea5204ced0d2 = <c1/> odděluje prohlížeč od Node.js a dává recept pro Node, který čte binárku z disku a předává ji <c2/>. Test doc-sync přijímá <c3/> jako zavaděč, který generuje wasm-bindgen.

seg-ebb763695c59 = Všechny tři vkládají scénář s jeho řetězci původu nezkrácenými, takže hash scénáře je <c1/> na každém místě. Příklad npm je dříve zkracoval, což mu dávalo jiný hash než CLI.

seg-dc52363432f8 = Reprodukováno z lokálních sestavení tohoto stromu: čerstvý projekt <c1/> s cestou k závislosti na zabaleném crate sestavil a spustil příklad v Rustu; wheel sestavený pomocí maturin ze zabalených zdrojů, nainstalovaný do nového virtuálního prostředí, spustil příklad v Pythonu; a balíček <c2/>, zabalený a nainstalovaný pomocí npm, spustil recept pro Node. Všechny tři vypsaly týž souhrnný řádek.

seg-07e465a602f1 = <c1/> funguje z klonu.

seg-77ce31300b69 = <c1/> nastavuje <c2/>. Bez toho cargo odmítlo s „could not determine which binary to run“, na což narazil každý řádek <c3/> v dokumentaci.

seg-2d516597b5f5 = <b>Chyby CLI v první minutě říkají, co dělat dál.</b> Cesta ke scénáři, která neexistuje, nyní přidává nápovědu odkazující na <c1/> a druhý poziční argument vypíše text použití i pojmenuje argument. <c2/>, <c3/>, chyba neznámé volby (kód { "2" }) a jednořádkové <c5/> při úspěchu u <c4/> už byly v main. <c6/> nyní pokrývá všechny, protože dříve žádný test pro žádný z nich binárku nespouštěl.

seg-fdd9a27ccfc4 = <b><c1/> v Pythonu je zdokumentováno tak, že vrací jeden řetězec JSON, ne seznam.</b> Vrací tatáž metadata jako <c2/>, serializovaná, takže jeho procházení prochází znaky. Zachovává si návratový řetězec, aby se existující volající nerozbili. <c3/>, komentář dokumentace vazby, <c4/> a <c5/> to nyní říkají a odkazují na <c6/>.

seg-f0e0c8c12f8a = <b>Všechny tři README registrů rozepisují každou zkratku při prvním použití.</b> PNT je nyní rozepsáno v úvodním heslu, kde se poprvé objevuje, a CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL a API jsou rozepsány v souborech, které je používají. Nadpis tabulky orákulí už neříká „CI-gated“, dokud CI není definováno.

seg-554c5b0c9c60 = Opravena publikovaná hodnota: dostupnost ARAIM pro dvě konstelace na přibalených TLE z Celestraku pro GPS + Galileo.

seg-1f023a822c91 = <c1/> uváděl, že připojení Galilea zvedá dostupnost z { "0.21" } na { "0.67" } při VAL { "12" } m a že režim odolný vůči poruše konstelace je při pouhých dvou konstelacích omezený. Vycházelo to z <c2/>, který propagoval každou družici od její vlastní epochy TLE (<c3/> epochu zahazuje), a epochy v těchto souborech zahrnují { "70.6" } h (GPS) a { "335.7" } h (Galileo), takže družice byly vzájemně v nekonzistentních časech. Test nyní epochu zachovává (<c4/>) a vyhodnocuje každou družici v jednom společném okamžiku UTC, a to v nejpozdější epoše TLE v dané sadě (2026-06-07T07:{ "21" }:{ "04" }). Naměřená dostupnost na téže mřížce { "24" } h o 289 vzorcích je nově pro samotné GPS { "0.993" } (dříve { "0.208" }), pro sloučené konstelace { "1.000" } (dříve { "0.671" }) a pro duální režim odolný vůči poruše konstelace { "0.990" } (dříve { "0.031" }); u limitu APV-I se duální režim mění z { "0.180" } na { "1.000" }. Závěr se obrací: při konzistentní obloze nesou dvě konstelace hypotézu poruchy konstelace při VAL { "12" } m. Stejné hodnoty vyjdou i při použití nejstarší epochy TLE jako reference. Autokontrola v testu přišpendluje jeho smyčku dostupnosti vzorek po vzorku k <c5/>, takže jediným rozdílem je časové sladění. <c6/> a <c7/> §{ "3" } obsahují nová čísla; níže uvedený záznam { "0.13.0" } zůstává tak, jak byl vydán.

seg-3173a2e03521 = <b>Veřejné stránky už neprezentují RINEX { "4" } jako ověřený.</b> Engine nyní soubor s navigační zprávou RINEX { "4" } podle názvu odmítne, místo aby jej chybně dekódoval, ale mřížka standardů dosud ukazovala kartu „RINEX { "3" } / { "4" }“ se štítkem <em>ověřeno</em>, vázanou na důkazy RINEX 3 pro navigační parser. Karta nyní zní „RINEX { "3" }“ a README, <c1/>, <c2/>, <c3/> i souhrn schopností uvádějí, co je pravda: soubory s pozorováními RINEX 3.0x se zpracují, rozvržení pozorování { "4.00" } by se zpracovat mělo, ale žádný soubor { "4.00" } nebyl kódem dosud přečten, a navigační soubory RINEX { "4" } jsou odmítány.

seg-c9bb514acb7a = <b><c1/> říká, kdy „ok“ znamená, že nebylo co kontrolovat.</b> Asi dvě třetiny katalogu nepublikují žádné povinné pole — tyto balíčky spouštějí svou referenční konfiguraci z prázdného těla — takže lint mohl u nich vypsat jen „ok“, stejnými slovy, jako po kontrole šesti polí. Řádek o úspěchu nyní uvádí počet povinných polí, která našel přítomná, nebo že daný druh žádná nevyžaduje.

seg-06b324d00285 = <b><c1/> odmítá nečíselné <c2/> nebo <c3/>.</b> V bashi { "3.2" } způsobilo <c4/> chybu číselného porovnání, které se vyhodnotilo jako nepravda, takže brána oznámila „repeatability loop SKIPPED (REPEAT={ "0" })“ pro hodnotu, která nebyla { "0" }, a přesto zapsala potvrzení. Oba parametry nyní končí s kódem { "2" }, pokud nejsou prostými celými čísly.

seg-09d04ffdd9ac = MSRV je uvedena jako { "1.85" } všude, kde ji člověk čte.

seg-dafc23725315 = <c1/> přešel v minulém vydání na { "1.85" }; odznak v README, text o instalaci a řešení potíží, <c2/> i vlastní zdůvodnění v crate MCP stále uváděly { "1.75" }.

seg-c2fa8a31058c = <b><c1/> v pythonové vazbě uvádí bajty, ne „znaky“.</b> Vypisovalo <c2/> řetězců UTF-8, což je počet bajtů: { "710" } „znaků“ pro tabulku o 708 znacích.

seg-6b4452a4e340 = README už nedokumentuje použití <c1/> společně.

seg-47d83e4d847b = <c1/> je příznak pro jediný scénář, při <c2/> se ignoruje (binárka vypíše varování). Dva příklady ke zkopírování v README.md a README.crates.md nyní ukazují samotný příkaz study.

seg-5ed7f8330b2d = <b>Důkazy o stabilitě hodin na webu uvádějí obě pozorované tolerance.</b> Řada cesiových hodin 5071A je reprodukována s přesností ≤ { "3e-5" } a PHASE.DAT ≤ { "5e-5" }; odstavec uváděl { "3e-5" } pro obě.

seg-8bba7f1171f3 = Dva soubory s výstupem enginu se již nesledují.

seg-ea9bf1d14371 = <c1/> byly označeny enginem { "0.20.0" } s prázdnými všemi ukazateli kvality a vlastní příkaz study z README je přepisoval, čímž špinil pracovní strom a blokoval push gate. <c2/> / <c3/> se nyní ignorují jako ostatní čtyři výstupy enginu.

seg-77ce9b90859d = <b>Průchod seedem v playgroundu už nepadá při každém běhu.</b> Průchod posouval celočíselný parametr <c1/> lineárně ({ "1" }, { "10.9" }, { "20.8" }, …) a engine, který jej čte jako <c2/>, každou zlomkovou hodnotu odmítl. Celočíselné parametry nyní procházejí různými celými čísly.

seg-e1b1e1360eb9 = <b>Každé stažení z playgroundu říká, který engine a který vstup jej vytvořil.</b> Několik druhů (např. <c1/>) nevydává <c2/> ani <c3/>, takže jejich stažené soubory se jmenovaly prostě <c4/>. Název nyní používá verzi načteného enginu a 12místný hexadecimální otisk FNV-1a-64 textu scénáře.

seg-0181e86b576a = <b>Publikovaný crate je menší než polovina původní velikosti a <c1/> sestaví samotné CLI.</b> Balíček dříve obsahoval články, jejich podací balíčky, artefakty obrázků z článků, notebooky, <c2/>, skripty správců a ukázkové programy. Nic z toho knihovna ani CLI nekompiluje. Obsahoval také tři interní generátory pod <c3/> (<c4/>, <c5/>, <c6/>), takže instalace z registru kompilovala a instalovala čtyři spustitelné soubory, z nichž tři byly užitečné jen uvnitř checkoutu. Tyto stromy a zdroje tří generátorů jsou nyní vyloučeny. Cargo vypisuje binárky balíčku ze souborů, které obsahuje, takže publikovaný manifest uvádí jen <c7/>. V klonu se generátory stále nacházejí automaticky, takže <c8/> a úloha vydání, která spouští <c9/>, zůstávají beze změny. Změřeno pomocí <c10/>: dříve { "763" } souborů, { "16.7" } MiB, { "6.8" } MiB komprimovaně; nyní { "591" } souborů, { "10.5" } MiB, { "3.0" } MiB komprimovaně. Jeho ověřovací sestavení, které kompiluje jen zabalené soubory, projde. <c11/> na zabaleném crate nainstalovalo jeden spustitelný soubor, <c12/>.

seg-567c7059286f = <b>Výstup, který časovací inženýr přečte: už žádné <c1/>, žádné <c2/> bez útoku a počty na webu, které odpovídají README.</b> Jde o revizi zobrazení. Žádné publikované číslo se nemění; hodnoty JSON jsou totožné, což dokazují výše uvedené golden hashe.

seg-849fa9a29f07 = Jednořádkový souhrn vypisoval 95. percentil (p95) časové chyby optických hodin jako <c1/>, zatímco tabulka vedle ukazovala { "1.20e-4" } ns. Nenulová časová hodnota příliš malá pro jedno desetinné místo se nyní vypisuje na tři platné číslice (<c2/>); přesná nula se stále vypisuje jako <c3/>. Zpráva HTML (HyperText Markup Language), srovnávací tabulka studie i stažitelná zpráva z playgroundu používají stejné pravidlo, takže se žádná nenulová hodnota nevypíše ani jako <c4/>.

seg-c44323babd1e = <c1/> je analytická mez detekovatelnosti spoofingu, která má smysl jen proti nakonfigurovanému útoku. Druhy <c2/>, <c3/>, <c4/> a <c5/> žádný nekonfigurují, takže jejich souhrn nyní vypíše <c6/> místo čísla jako <c7/>, které se čte jako selhání detekce. Hodnota zůstává v <c8/>, označena <c9/> s důvodem v <c10/>, a tabulky ve zprávě uvádějí „neuplatňuje se“. Druh <c11/> detekci nadále hodnotí.

seg-f54d5ffb7dff = Dva souhrnné pin v <c1/> se posunuly přesně ze dvou těchto důvodů a z žádného jiného: <c2/> (kvantové p95 a obě hodnoty <c3/>) a <c4/> (obě hodnoty <c5/>; jeho hodnoty p95 jsou přesně nula). Hashe jejich celých dokumentů se nezměnily. Očekávané souhrny v README, třech tutoriálech a jejich výukových scénářích jsou aktualizovány tak, aby odpovídaly, a <c6/> kontroluje výukové kopie proti enginu.

seg-e8e012376fa3 = Řízená prohlídka v playgroundu se už neotevírá při prvním načtení. Její modální okno zachytávalo první kliknutí a její reflektor odscrolloval stránku od místa, kam návštěvník přišel. Spouští se tlačítkem „Take the 60-second tour“ nebo plovoucím tlačítkem Tour.

seg-4d60d4ea4d7d = Stránka se na telefonu už neposouvá do stran. Při { "390" } px dával řádek se značkou a tlačítko GitHub asi { "410" } px obsahu, tedy přetečení o { "4" } px; záhlaví se nyní vejde od { "320" } px výše a tabulka ukazatelů kvality se posouvá uvnitř vlastního rámečku, místo aby rozšiřovala stránku.

seg-f6ec6a64071d = Průzkumník schopností začínal vlastním počtem karet („{ "46" } karet schopností … { "17" } podložených externím orákulem“) vedle README, která uvádějí { "64" } ze { "168" }. Nyní začíná verifikační maticí, čtenou z vygenerovaného <c1/> (téže matice, ke které jsou přišpendlena čísla v README), a karty pojmenovává až poté jako souhrnnou vrstvu, kterou jsou. <c2/>, nový krok v pracovním postupu průběžné integrace (CI), kontroluje aritmetiku a vzájemně porovnává README.md a popisy na stránce; <c3/> přišpendluje propojení ze strany Rustu.

seg-606098743e57 = <b>Veřejný popis nyní začíná časováním a holdoverem, nejlépe ověřenou oblastí.</b> Úvod README a <c1/> představují Kshanu jako otevřený, reprodukovatelný engine důkazů odolnosti PNT s označeným původem: nejprve časování a holdover kritické infrastruktury (odhadovače Allan, modifikované Allan, time-deviation a maximální chyby časového intervalu a inverze rozptylu při doběhu holdoveru jsou řádky VALIDATED, které za tím stojí), kvantová technika jako neutrální metoda srovnání kvantového a klasického přístupu, jejíž výsledky jsou označeny MODELLED, a lunární / cislunární navigace a navigace v hlubokém vesmíru jako udržované schopnosti, nikoli hlavní sdělení. Obě stránky nyní říkají, čím Kshana není — není simulátorem rádiových signálů ani zkušebním stavem hardware-in-the-loop, není náhradou za MATLAB/Simulink, STK ani Orekit — a odkazují na nový druh <c2/> a na <c3/>. Starý řádek „neexistuje žádný dobrý open nástroj“ je pryč: hledání, které nic nenajde, není důkazem, že nic neexistuje. <c4/> získává nedatované pořadí priorit (nejprve časování, na druhém místě kvantové srovnání, lunární udržované) a vypouští tři zastaralé položky (systematické chyby Coriolis a light-shift, počáteční podmínky NRHO a lunární scénář, vše již dodáno); řádek v README „Coriolis and light-shift remain roadmap“ je opraven stejným způsobem.

seg-7bc48692be0b = <b><c1/> přestal podhodnocovat.</b> Řádek o zemských soustavách uváděl „none“, zatímco matice hodnotí GCRS→ITRS jako VALIDATED; nyní zní „full“ a řádek o základních soustavách zaznamenává křížovou kontrolu ANISE jako dodanou. Řízený režim byl uveden jako plán; playground dodal řízené posuvníky i řízenou prohlídku. Průchod proti <c2/> opravil dalších pět řádků, které předcházely svým validacím: silový model Cowell a dávkové/sekvenční určování oběžné dráhy proti Orekitu { "12.2" }, přelety pozemních stanic proti detektoru elevace Orekitu, jádro faktoru zhoršení přesnosti proti gnss_lib_py a import OEM proti nezávislému parseru <c3/>; řádek o verifikaci a validaci nyní jmenuje stráže, které kontrolují, že každý citovaný test existuje.

seg-9d144df304ca = Glosář vysvětluje, co říká soubor s výsledkem.

seg-eed672b2f8fd = <c1/> získává srozumitelné položky pro výstupní pojmy (holdover, p95, integrita, skóre zabezpečení, PDOP, <c2/>, <c3/>), pojmy telekomunikačního časování (časová chyba, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) a tři úrovně důkazů (VALIDATED, MODELLED, PARTNER).

seg-1a4f9d5eef96 = <b>Zkratky jsou rozepsány při prvním použití v každém ručně psaném veřejném dokumentu.</b> README a { "24" } souborů v <c1/> mělo několik set zkratek použitých před rozepsáním nebo bez něj; každá je nyní rozepsána tam, kde se v daném souboru poprvé objeví. Tři vygenerované soubory (<c2/>, <c3/>, <c4/>) zůstávají nedotčeny: jsou psány z <c5/> a <c6/>, takže jejich znění se musí změnit u zdroje.

seg-2889ce118381 = Pokrytí řádků má záznamové měření.

seg-9c4684c0a4ef = <c1/> zaznamenává { "95.63" } % ({ "37,697" } z { "39,419" } řádků) z úlohy CI <c2/> na <c3/> a <c4/> k němu přišpendluje pět veřejných ploch s „~{ "96" }%“ — jediné hlavní číslo, které se udržovalo ručně a které se už jednou nepozorovaně pohnulo.

seg-ebd36b7291df = Nové brány synchronizace dokumentace pro plochy, které nic nečetlo.

seg-3dd44fc69a28 = <c1/> kontroluje každý <c2/> v bloku JavaScriptu proti exportům WebAssembly a přišpendluje příklad v Rustu z README.crates.md bajt po bajtu ke kopii, kterou testovací binárka kompiluje. <c3/> selže, pokud <c4/> ztratí <c5/> nebo SECURITY.md přestane tuto skutečnost uvádět. <c6/> nyní prohledává také <c7/> a tři README registrů a každý standard na webu musí výslovně uvádět svůj <c8/>.

seg-a506d14f3447 = Dvě kontroly hodin na skutečném hardwaru běží na runneru.

seg-c7f8b8627137 = <c1/> (měsíčně a při ručním spuštění) stáhne řady 5071A a PHASE.DAT a spustí oba testy s <c2/>, takže chybějící vstup selže, místo aby se přeskočil. Oba stahovací skripty jsou přišpendleny k jednomu commitu allantools a ověřují SHA-256.

seg-3b4a7fee3cd0 = <b>Pythonový typový stub je kontrolován proti sestavenému wheelu</b> (<c1/> v úloze bindings), čímž se stalo, že <c2/>/<c3/> byly dodány bez stubu.

seg-24c2ccf3634a = <b>Glosář definuje URE, EOP, FoM, CTI a TIB</b>, které README a registr používaly bez vysvětlení.

seg-ae044195cd47 = <b>Smlouva o polích každého druhu je nyní pravdivá a test ji tak drží.</b> Změnilo se pět z { "61" } druhů. Druhy s neprázdným <c1/> přecházejí z { "21" } na { "22" }: <c2/> nyní vyžaduje <c3/> (holé <c4/> dříve prošlo <c5/> a pak selhalo při běhu) a <c6/> přidává <c7/>, což jeho běh už vyžadoval. Povinná položka smí používat <c8/> (jedno z těchto) a <c9/> (všechna tato společně); <c10/> rozumí oběma. <c11/>, <c12/> a <c13/> publikují { "9" } skutečných volitelných polí, která vynechaly. <c14/> nyní říká, že <c15/> je povinné pro každý druh kromě <c16/>. <c17/> kontroluje každý druh proti jeho dodanému scénáři: odstranění kterékoli povinné položky musí způsobit selhání běhu a dokument obsahující jen povinná pole musí běžet.

seg-09ba716f3e97 = Poznámky pro JetBrains Marketplace jsou hlídány bránou.

seg-938ff48e7a2d = <c1/> nyní selže, pokud nejnovější záznam <c2/> v <c3/> neuvádí vydávanou verzi; sedm publikovaných verzí přitom neměnně dodávalo poznámky { "0.22.0" }.

seg-3d38550854e0 = Údaj o pokrytí v technické zprávě je ten naměřený.

seg-bd312cd26746 = <c1/> uváděla „near { "97" } %“; nyní uvádí near { "96" } % ({ "95.63" } % naměřeno, <c2/>) a je šestou plochou, kterou test pokrytí přišpendluje.

seg-934680d402da = <b>Klient enginu mimo hlavní vlákno je testován</b> (<c1/>, v CI): allowlist dispečinku, zrušení a znovuspuštění, tři záložní cesty na hlavním vlákně a zotavení po pádu, proti falešnému workeru.

seg-fd5f9a8a4f43 = <b>Nic se nepublikuje, dokud označený commit neprojde testy, a vydání není hotové, dokud ho neposkytují všechny registry.</b> Pořadí je nyní tag, ověření, publikace, parita, web, v jednom běhu <c1/> (<a1><c2/></a1>).

seg-745b11c8ed74 = Publikace čeká na verdikt.

seg-e66c890cf6c0 = <c1/>, <c2/> a <c3/> se již nespouštějí při pushi tagu; <c4/> je volá z úloh, které mají <c5/>. Dříve s ním soutěžily: u { "v0.27.2" } crates.io, npm a Python Package Index (PyPI) publikovaly všechny do { "4.5" } minuty od tagu a <c6/> se vrátil { "84" } minut po něm; u { "v0.27.0" } npm a PyPI publikovaly, zatímco úloha crates.io selhala. Ruční opakování na tagu je zadrženo novým <c7/>, který vyžaduje zelené <c8/> pro přesně tento commit z rozhraní Actions a při čemkoli jiném selže uzavřeně.

seg-3800247c81f2 = <em>Vše se sestaví dříve, než se cokoli nahraje</em> a crates.io, jehož krok balení byl tím, který selhal uprostřed vydání, publikuje jako první.

seg-6929a7608da7 = <em>Chybějící token registru způsobí selhání úlohy</em>, místo aby se nahrávání přeskočilo a hlásil se úspěch.

seg-460811602293 = Kontrola parity po publikaci.

seg-86eb0fab2f7c = <c1/> dotazuje crates.io (<c2/> a <c3/>), npm, PyPI (zdrojovou distribuci a všech šest platformních wheelů) a ghcr.io, dokud každý neposkytuje danou verzi, jinak běh selže; docs.rs a registr Model Context Protocol (MCP) se hlásí, ale nejsou vyžadovány. Spuštěna proti minulým vydáním zjistí, že { "0.22.0" } chybí v npm a PyPI, { "0.23.0" } v PyPI a { "0.27.0" } v crates.io.

seg-79578a00fd78 = <em>Předsestavené binárky příkazové řádky pro macOS (Apple silicon i Intel) a Windows x86-64</em>, pojmenované podle cíle (<c1/> a tak dále), vedle linuxové <c2/>, jejíž název se nemění. Soubor <c3/> pokrývá každý asset a <c4/> jej kontroluje a spouští binárky pro macOS a Windows na jejich vlastních systémech.

seg-3e1f5afa9f2a = <em>kshana.dev ukazuje vydání, ne <c1/>.</em> Dříve se nasazoval znovu při každém pushi do <c2/>, zatímco jeho stránky jmenovaly poslední vydání. <c3/> nyní sestavuje jen tag vydání: vydání jej spustí, jakmile každý kanál verzi poskytuje, a ruční spuštění nasadí znovu nejnovější vydání (nebo pojmenované).

seg-43da8f3f171e = Jediný zdroj wheelů.

seg-b911ac65e231 = Ručně zkopírovaná matice šesti cílů v <c1/> je pryč; volá <c2/>, takže brána značek auditwheel a kontrola bajtové reprodukovatelnosti nyní hodnotí wheely, které PyPI přijímá, a selhání kterékoli zastaví vydání.

seg-194c4b019a4c = <em>Připnuté nástroje sestavení.</em> Každý pracovní postup žádá Rust { "1.93.0" } (úloha msrv svou vlastní verzi); <c1/> a <c2/> žádaly <c3/> a log { "v0.27.2" } ukazuje, že rustup nainstaloval { "1.98.1" } a pak kompiloval s { "1.93.0" } jen proto, že <c4/> má přednost. wasm-pack je připnut na { "0.13.1" } (verze, která sestavila { "v0.27.2" } a kterou zvolil nepřipnutý instalační skript) s kontrolou kontrolního součtu a mcp-publisher na { "1.8.1" } s jeho publikovaným SHA-256. <c5/> nyní selže, pokud pracovní postup žádá jiný kompilátor nebo posílá stažený skript rourou do shellu. Žádná ověřovací úloha, golden pin ani lokální skript brány nebyl odstraněn ani uvolněn.

seg-9e2a7376367e = <b>Každá GitHub Action třetí strany je připnuta podle SHA commitu</b> — { "93" } odkazů v { "15" } pracovních postupech, { "92" } z nich nově — s tagem ponechaným jako koncový komentář, aby jej Dependabot aktualizoval. Výjimkou je <c1/>, jejíž tag je volbou toolchainu.

seg-6afb4a8770b0 = <b>Základní vrstvy image serveru MCP jsou připnuty víceplatformním digestem</b> a Dependabot nyní hlídá Dockerfile <c1/>, takže vrstvy OS stále dostávají bezpečnostní aktualizace — přes zkontrolovaný PR.

seg-4ea8b158b408 = Kontrola tagu proti manifestu běží ve dvou publikačních pracovních postupech, které dodávají verzi tagu.

seg-4b77764e955d = <c1/> (image ghcr, registr MCP) a <c2/> (Marketplace) soutěží s <c3/>, místo aby na něj čekaly, takže chybně vytvořený tag byl hlídán jen v sourozenci. Oba nyní před sestavením spouštějí <c4/>.

seg-bf90c4063843 = <b>Čtyři bezpečnostní upozornění, která Dependabot vznesl v den zapnutí svých výstrah, jsou opravena.</b> Server MCP přechází z <c1/> { "1.7" } na { "2.2" }: tři upozornění proti <c2/> < { "2.1" } (únik tabulky relací Streamable-HTTP, chybějící validace chráněného zdroje OAuth, vlastní hlavičky následující přesměrování mezi původy) — žádné zde nedosažitelné, protože server mluví jen přes stdio, ale publikovaný crate by neměl připínat zranitelné SDK. Makra <c3/> { "2" } potřebují Rust { "1.88" }, takže nyní samotný <c4/> deklaruje <c5/>; knihovna <c6/> zůstává na { "1.85" }. Jediná změna API (<c7/> → <c8/>) je provedena a testy průchodu tam a zpět projdou. Akce skenu SonarQube přechází z v5 na v6, což opravuje upozornění na injekci argumentů (≥ { "4.0" }, < { "6.0" }).

seg-2652aaad177e = <b>Každá položka Rustu citovaná řádkem verifikační matice je nyní ověřena proti crate.</b> Dosavadní stráž kontrolovala citace ve tvaru cest k souborům; { "63" } ze { "164" } řádků, které nejsou od partnera, uvádí svůj důkaz jako položku uvnitř crate — <c1/>, <c2/>, <c3/> — a token bez přípony <c4/> byl pro skener cest neviditelný. Tyto řádky mohly jmenovat přejmenovaný modul, vyprázdněný testovací modul nebo funkci, která nikdy neexistovala, a každá brána by zůstala zelená.

seg-01eee5115e3f = <c1/> vyhodnotí všech { "339" } takových citací přes strom modulů, vyžaduje, aby každý řádek, který není od partnera, jmenoval alespoň jeden test, který skutečně nese <c2/>, a vyžaduje, aby řádky od partnera žádný nejmenovaly. K jeho vyzkoušení posloužily čtyři mutace: přejmenování citovaného modulu, nasměrování jediné testové citace řádku na funkci, která není testem, přejmenování skutečného <c3/> a odstranění atributů <c4/> z něj — každá zčervená na tvrzení, které ji vlastní.

seg-7731d549c739 = Jeden řádek už byl chybný: <em>Alternative / complementary PNT</em> citoval <c1/>, tedy glob, což není citace. Nyní jmenuje <c2/> a tři testovací moduly v crate, které za ním stojí.

seg-cf6fd64368de = <b>Publikované obrázky se při každém sestavení znovu kontrolují proti enginu</b> (<c1/>). Tři demo grafy z README jsou vlastním výstupem <c2/> enginu a nic scénář znovu nespustilo; dvě studie křížení v článku byly vygenerovány jednou a zakomitovány; a README uvádí slovy čtyři ukazatele kvality vedle <c3/>. Všechny tři jsou nyní přišpendleny k živému výstupu enginu.

seg-276b65a8f76a = Sladění přineslo užitečný výsledek: demo grafy byly nakresleny enginem { "0.22.0" } a JSON křížení z článku verzí { "0.20.0" } a při { "0.27.1" } <b>je každá vykreslená hodnota ve všech pěti artefaktech totožná</b> — tři SVG grafy se od nového běhu liší přesně o dva znaky každý, o značku verze v zápatí. Grafy byly znovu vykresleny, aby zápatí platilo. JSON z článku je záměrně ponechán s označením { "0.20.0" }: je záznamem běhu, jehož obrázek publikovaný článek vkládá, a nové označení by tvrdilo původ, který PDF nemá. Stráž místo toho tvrdí silnější vlastnost — že současný engine stále reprodukuje každou publikovanou hodnotu.

seg-c88647c5f2fc = Analýzy SonarCloud byly zaznamenávány jako <c1/>, takže období nového kódu <c2/> nikdy nepostoupilo: stále bylo ukotveno v analýze z 2026-07-02, hodnotilo osmdesát dva dní práce jako jedinou delta a měřilo { "7877" } „nových“ duplikovaných řádků proti prahu { "3" } %. Sken nyní předává verzi crate. Základní duplicita je skutečná a toto ji neskrývá: je soustředěna v deklarativních registrech <c3/> opakovaných napříč <c4/>, <c5/>, <c6/>, <c7/> a <c8/> a v 168řádkové verifikační tabulce a je zde pojmenována jako práce, nikoli vyloučena z měření.

seg-f2a0960a6f11 = <b><c1/> nemělo zámek pro jediného zapisovatele a každý běh zapisoval do téhož logu.</b> Nejde o pořádek: <c2/>, <c3/> a <c4/> v potvrzení se čtou zpět Z tohoto logu a pre-push hook potvrzení důvěřuje. Brána, která byla zabita, ale jejíž testovací binárka ještě žila, dál zapisovala do souboru, který další běh právě zkrátil — takže počty jednoho běhu mohly být osvědčeny jako počty jiného běhu a povolit push na základě sady, která na odesílaném stromu nikdy neběžela. Nyní platí jedna brána na checkout (odmítne se s kódem { "75" } vedle živé, zastaralý zámek, jehož pid už neexistuje, se vyčistí) a jeden log na běh, přičemž <c5/> se při ukončení obnoví z dokončujícího běhu. Testují se oba směry: živý pid odmítne, mrtvý se vyčistí.

seg-687d6fe87221 = <c1/> tvrdil, že jeho testy „<b>nedokazují</b>, že řetězce pojmenovaných testů/orákulí odkazují na živý kód“. Dvě stráže nyní dělají přesně to, takže dokumentace modulu říkala opak pravdy; nyní uvádí, co je kontrolováno strojově a co se ponechává lidskému úsudku. Zastaralý odkaz na <c2/> — modul je <c3/> — je opraven v dokumentaci sesterské stráže.

seg-014070f0873c = <b><c1/> byla 2026-09-22 přepsána a vynuceně odeslána.</b> Deset commitů se stalo čtyřmi. Přepsání sloučilo každý commit, který nechal bránu červenou, do commitu, který ji vyčistil, takže každý commit na <c2/> má nyní strom, který projde, a odstranilo zrušené běhy, které po každém nahrazeném commitu zanechávala souběžnostní skupina platná pro celou větev.

seg-b48d6cfc3b42 = Nic nebylo zahozeno. Commity před přepsáním zůstávají dosažitelné přes tagy, které na ně ukazují, a konečný strom je bajt po bajtu totožný se stromem, z něhož přepsání vycházelo — <c1/> mezi starým a novým koncem je prázdný, kromě tří souborů pracovních postupů, které toto vydání mění.

seg-0549cfdc6d69 = Nahrazené SHA pro každého, kdo drží odkaz na některé z nich:

seg-14812deb1b6b = původní

seg-c63f549e6a1d = předmět

seg-57bfbb773299 = docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s

seg-02aa1be872d2 = fix(docs): the engine-flow diagram said { "6" } figures of merit; the engine scores { "7" }

seg-f3a598ff3349 = fix(test): two more cross-platform pins, and two wrong assumptions of my own

seg-e9054c4801ff = feat(web): surface the lunar cluster on the site — seven capability cards

seg-3f1f16502fdf = docs(lunar): document { "42" } public fields and ratchet the ceiling down to { "985" }

seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

seg-cbe63ab92c6a = test(docs): guard the distribution diagram, the last unguarded one

seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

seg-9c220336c895 = <b>Tagy { "v0.27.0" } a { "v0.27.1" } byly záměrně NEPŘESUNUTY.</b> Stále ukazují na <c1/> a <c2/>, přesné commity, jejichž stromy vytvořily artefakty, které jsou nyní živé na crates.io, npm, PyPI, ghcr.io a v registru MCP. <c3/> crate zaznamenává sha1, z něhož byl zabalen, registry jsou neměnné a atestace původu sestavení SLSA na položkách vydání { "v0.27.1" } je vázána na tento commit. Přesunutí tagů by ponechalo každý z těchto publikovaných artefaktů ukazovat na commit, který už neexistuje. Ponechání zachovává staré commity dosažitelné a každý publikovaný řetězec původu rozpoznatelný, za cenu dvou tagů, které už nejsou předky <c4/> — a proto toto vydání existuje: { "v0.27.2" } dává <c5/> vlastní tag, zabalený z commitu, který na ní leží.

seg-3c644384256f = Toto je druhé zveřejněné přepsání této historie; první, z 2026-09-21, kanonizovalo autorství a je zaznamenáno v poznámkách { "0.27.0" } spolu s jeho vlastními dvěma visícími sha1 crate. Přepsání se zde zveřejňuje pokaždé, protože repozitář, který prodává ověřitelný původ, nemůže potichu posouvat půdu pod publikovaným artefaktem.

seg-d82d7a3c9054 = Publikovaný crate se nekompiloval.

seg-ebc99c9df1ef = <c1/> obsahuje <c2/> na nejvyšší úrovni souboru <c3/> a manifest vylučuje <c4/> z balíčku, takže tarball, který crates.io přijalo, postrádal soubor, který knihovna sama vkládá. Publikace { "v0.27.0" } z tohoto důvodu selhala při ověřovacím sestavení a žádná verze { "0.27.0" } se na crates.io nedostala; npm a PyPI, jejichž úlohy na něm nezávisejí, publikovaly normálně. Vyloučení nyní nese výjimku pro tento jediný katalog.

seg-6ff9cdb976e8 = Každé další <c1/> přípravku v <c2/> leží uvnitř modulu <c3/> a do zabalené knihovny se tedy nikdy nedostane. Jen to na nejvyšší úrovni ano.

seg-7f0975453b8f = <b>Nic v CI nespouštělo <c1/>,</b> a proto byl tarball, který nelze zkompilovat, poprvé odhalen až publikační úlohou, poté co už dva další registry vydaly. Úloha <c2/> nyní při každém pushi sestaví a zkompiluje přesný tarball.

seg-1f2df48821fc = Piny výstupu lunar-frame-realisation se už s navýšením verze nehýbou. Patička SVG nese verzi enginu, takže každé vydání znovu nastavilo tři hashe — dvakrát za jediný den — a pin znovu pořízený z rutiny se přestane číst. Řetězec verze se před hashováním normalizuje na zástupný symbol a výstup se zvlášť ověřuje, že uvádí běžící verzi, takže tato skutečnost se kontroluje přesněji, než ji kdy kontroloval hash.

seg-56309487ea7e = <c1/> — datum lunární soustavy ze skutečné pozorovací kampaně.

seg-966a2cc4e40d = <c1/> nahradil vložený Helmertův přenos <em>simulovanou</em> kampaní a řekl to: její síť stanic, její plán a její sigma na pozorování jsou ilustrativní vstupy. Tento scénář odstraňuje simulaci ze dvou míst, kde do odpovědi vstupuje plán a chybový model. Epochy jsou okamžiky vyslání { "337" } archivovaných normálních bodů laserového měření vzdálenosti k Měsíci ILRS (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } a Matera MLRO { "7941" }, všech pět retroreflektorových polí) a každá váha pozorování je vlastní archivovaná preciznost onoho normálního bodu, <c2/> — medián { "5.13" } mm jednosměrné vzdálenosti, převzatý ze souboru, nikoli zvolený zde. Souřadnice stanic pocházejí z IERS ITRF2020 a souřadnice reflektorů z JPL DE430 Table { "7" }; každý přípravek zaznamenává URL, datum stažení a SHA-256 a regeneruje se ze svého zdroje zakomitovaným generátorem, který zdroj ověří a raději skončí, než aby vydal číslo. Zpráva jmenuje, které články jsou měřené a které zůstávají modelované, a modelované jsou <em>změřeny</em>: pozorováno-minus-vypočteno u jednosměrné vzdálenosti nad skutečnými daty činí { "156 494" } m RMS, což táž sada testů potvrzuje proti JPL Horizons za totéž období ({ "195 655" } m RMS vektoru, nejhorší epocha { "0.054" }° — uvnitř ~{ "0.3" }°, které si vestavěná analytická lunární řada sama nárokuje). Aditivní: nový druh, nový čtečka (<c3/>) a nový modul (<c4/>); stávající balíčky lunárních soustav jsou přišpendleny bit po bitu.

seg-7fcd2af0a688 = <b><c1/> jako parametr scénáře</b> u <c2/> a <c3/>. Přesnost měření vzdálenosti signálem ve vesmíru byla konstantou v době kompilace (<c4/>), takže průchod objemem služby mohl odpovědět jen splněno/nesplněno při jedné pevné hodnotě. Ochranné úrovně jsou na ní přesně lineárně závislé, takže její zpřístupnění mění průchod na <b>požadavek</b> na přesnost měření vzdálenosti v celém objemu. Výchozí hodnota reprodukuje dřívější chování bit po bitu.

seg-c3ccc1e89a2d = <b>Export geometrie po družicích</b> u <c1/>: <c2/> + <c3/> přidávají pole <c4/> s azimutem, elevací a šikmou vzdáleností ke každé družici v každé epoše pro jedno pojmenované selenografické místo, plus příznak viditelnosti. Souhrn souhrnného pokrytí geometrii po družicích záměrně slučuje, ale šikmá vzdálenost je přesně to, co spotřebovává rozpočet spoje, takže společnou analýzu komunikace a navigace nešlo z tohoto souhrnu provést. Vypnuto, pokud nejsou zadány obě souřadnice; čistě aditivní.

seg-ae7886fbca9d = <c1/>, veřejná pomocná funkce pro úhly pohledu za exportem.

seg-b187bade5f04 = Řádek verifikační matice pro novou schopnost geometrie.

seg-14ef785b6c12 = <b>Skutečný anténní diagram v exportu geometrie.</b> Engine od P1 nese diagram kruhové apertury s rovnoměrným osvětlením (<c1/>, Airyho tvar <c2/>) a <b>nic mimo <c3/> jej nepoužívalo</b> — práci místo toho dělal zisk v ose spárovaný s palcovým pravidlem pro vztah zisku a šířky svazku. Volitelná tabulka <c4/> u <c5/> (čtená jen při zadaném místě exportu) nyní dává každému exportovanému řádku <b>úhel mimo osu na družici</b> a <b>vysílací zisk směrem k místu z tohoto diagramu</b> a přidává blok <c6/>, který uvádí <b>počet družic ve svazku podle skutečného diagramu vedle počtu podle symetrické aproximace</b> (<c7/>) s rozdílem jako pojmenovanou korekcí. Vydávají se obě čísla; žádné druhé nenahrazuje. Změřeno na vlastní reprezentativní lunární apertuře enginu (parabola { "1" } m, { "2.4" } GHz, η = { "0.60" }) nad jihopolárním místem a ilustrativní skořepinou třídy LCNS se obě <b>liší o víc než jednu družici</b>: skutečný diagram umístí { "0" } z { "76" } viditelných spojů do svazku s poloviční výkonovou šířkou, aproximace jich tvrdí { "28" } — korekce −{ "2.33" } družice na epochu, nejhorší jednotlivá epocha { "3" }. Aproximace nese vlastní účinnost apertury ({ "0.641" } oproti pravidlu <c8/> stupňů, s nímž se obvykle uvádí, { "0.920" } oproti rovnoměrné kruhové apertuře), takže u paraboly s η = { "0.60" } vrací svazek { "1.238" }× příliš široký; blok vydává obě implikované účinnosti, místo aby je nechával odvodit. Čistě aditivní: změřeno na zdokumentovaném pracovním bodě, { "597" } dříve existujících listů, <b>{ "0" } změněno, { "0" } odstraněno, { "494" } přidáno</b>.

seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> a <c7/>, veřejné součásti, které za tím stojí. Diagram je nyní také ukotven proti publikovaným Airyho konstantám, nikoli jen sám proti sobě: průsečík poloviční výkonové úrovně se nalezne půlením intervalu a porovná s <c8/>, což činí přesnou šířku v polovině výkonu <c9/> a poctivě zaznamenává, že konvenční koeficient <c10/> klade <c11/> na <b>−{ "2.955" } dB</b>, nikoli −{ "3.010" } dB.

seg-bac7217bb128 = <b>Dlouhá forma tabulky reprodukovatelnosti pro <c1/>.</b> Výstupy scénáře ve tvaru polí — mřížka doby průměrování, sedm křivek <c2/> po členech a jejich celkový odmocninový součet čtverců — se ke spotřebitelům dostávaly jen jako pole JSON. Jedna vydaná tabulka byla zkrácena na { "400" } znaků a publikovala { "23" } z { "57" } dob průměrování pod sloupcem, který tvrdil, že obsahuje všechny, a rukopis sestavoval křivky po členech z uzavřených tvarů, protože je engine nikdy nevydal. Prostý běh nyní zapisuje i <c3/> s jedním řádkem na (index mřížky, dobu průměrování, člen), který nelze zkrátit na něco, co by stále vypadalo celé. Index mřížky je přesný spojovací klíč; <c4/> se zapisuje na { "13" } platných číslic a každé <c5/> na { "7" }, takže se bajty mezi sestaveními téhož zdroje nerozcházejí. Čistě aditivní: JSON zprávy je bajtově totožný.

seg-ab9209297ec2 = <b>Zpráva <c1/> nyní popisuje sama sebe.</b> Blok <c2/> opakuje vyřešené vstupy spoje — vlnovou délku nosné, vysílací a přijímací aperturu, vzdálenost, šířku pulzu, integrační dobu, účinnosti a ztráty — s uplatněnými výchozími hodnotami, takže článek uvádí konfiguraci, se kterou běžel, místo citování výchozí hodnoty přečtené ze zdroje. Blok <c3/> udává jednotku a třídu původu každé veličiny, kterou článek pravděpodobně cituje. Stopy předávacích kovariancí jsou důvodem, proč existuje: vydávaly se jako holé <c4/> a rukopis odvodil čtvereční metry z kontroly vnitřní konzistence. Odvození bylo správné, a právě proto bylo vadou — nic by nezachytilo, kdyby správné nebylo. Čistě aditivní: změřeno na čtyřech konfiguracích, { "456" } dříve existujících polí, <b>{ "0" } změněno, { "0" } odstraněno, { "196" } přidáno</b>.

seg-5c810155300c = Řádek verifikační matice pro tabulku reprodukovatelnosti časového rozpočtu, poctivě <c1/> / <b>MODELLED</b> — součet se kontroluje proti odmocninovému součtu čtverců členů ve stejném souboru, který sdílí vlastní definice členů enginu, a proto není nezávislým orákulem. Dohromady přidávají tři řádky. Průběžný součet pro tuto nevydanou sekci je <b>{ "168" } řádků — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

seg-ed290a85ab0e = <b>Autorství commitů v celé historii je nyní jediná identita a dva publikované crate ukazují na commit, který už neexistuje.</b> Dne 2026-09-21 byla historie gitu přepsána tak, že každý lidský commit má jako autora i zapisovatele <c1/>. Dříve nesl tři zápisy jedné osoby — { "688" } commitů jako <c2/>, { "34" } jako <c3/> a { "94" } již kanonických. Jediný commit od <c4/> byl záměrně ponechán s vlastním autorem: přeznačit závislostní aktualizaci robota by znamenalo nárokovat si autorství práce, kterou tu nikdo neudělal.

seg-ec4e75f94462 = <b>Žádný obsah se nezměnil.</b> Přepsání se dotklo jen hlaviček autora a zapisovatele, a to je ověřitelné, ne jen tvrzené: strom každého tagu a každé větve je bit po bitu totožný s tím, jaký byl předtím. <c1/> se stále rozpoznává jako strom <c2/>, přesně jako dříve.

seg-bc0f4fa0a009 = <b>Co to stálo.</b> Název commitu je hash přes jeho strom, rodiče a hlavičky autora, takže změna předka přejmenuje každého potomka. Commit vydání <c1/> byl <c2/> a nyní je <c3/>. Dva artefakty zaznamenaly starý název v době publikace a nelze je opravit, protože publikovaná verze v registru je z návrhu neměnná:

seg-52e096332738 = <c1/> { "0.26.0" } na crates.io — <c2/> zaznamenává <c3/>

seg-8ec39d2f136c = <c1/> { "0.26.0" } na crates.io — tentýž sha1, <c2/>

seg-9a21b7c7b41c = Nic dalšího není dotčeno. Balíček npm nezaznamenává žádné <c1/> a distribuce PyPI nezaznamenává žádný commit vůbec; obojí bylo zkontrolováno, nikoli předpokládáno.

seg-9c51c5fb0d80 = Neexistuje oprava, po níž by <c1/> pojmenovalo přepsaný commit: tento řetězec <em>je</em> starý původ a jediný způsob, jak se rozpozná, je ponechat publikovanou historii před přepsáním, což by obnovilo autorství, které přepsání odstranilo. Původ { "0.26.0" } proto vede přes tag, nikoli přes zaznamenaný sha1 — a tag dodává identické bajty, z nichž byl crate sestaven. Další vydání zaznamená platný commit bez nutnosti zásahu.

seg-30ecea86118a = <b><c1/> měl jako výchozí soubor EOP bez řádků predikce (G12).</b> Scénář vkládal pětiřádkový výňatek <c2/> <em>pouze s finálními hodnotami</em> jako svůj výchozí offline soubor, takže holý běh hlásil <c3/> a tabulka po horizontech stála na { "5" }, { "4" }, { "3" } a { "2" } dvojicích. Engine uměl řádek predikce vždy přečíst — vstup prostě žádný neměl. Výchozí je nyní doslovný výňatek IERS { "2026" } (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } finálních hodnot Bulletinu B a <b>{ "12" } řádků Bulletinu A pouze s predikcí</b>, takže holý běh bez argumentu souboru a bez sítě hlásí <c5/> a tabulku po horizontech při n = { "20" } / { "31" } / { "30" } / { "29" } a naplní se i srovnání s operačním prediktorem a shoda s vlastními publikovanými predikcemi produktu. Dlouhý výňatek o 45 řádcích byl změřen jako alternativa a zamítnut: je také pouze finální, takže by <c6/> ponechal na { "0" }. <b>Toto mění publikovaná čísla</b>, podle pravidla R4 a s oprávněním zakladatele: deset z { "22" } buněk vydaného <c7/> a { "24" } ze { "42" } vyplněných buněk <c8/>. Změřená podlaha pólu rychlý-minus-finální se stává { "0.0678" } mas (z { "0.0769" } mas), což je hodnota, kterou tabulka polárního pohybu článku P4 již publikuje při n = { "20" } — nyní se shodují, místo aby se lišily o { "13.5" } %. Každá další hodnota, kterou P4 z této tabulky vypisuje, je při vypsané přesnosti beze změny. Úplný výčet starý → nový, včetně polí, která se <em>nepohnula</em>, je v <a1><c9/></a1>. Výňatek pouze s finálními hodnotami se nadále dodává, je bajtově přišpendlen a procvičován: nulový počet řádků predikce je na něm vlastností souboru a test to stále dokazuje.

seg-17fbc566dc5b = <b>Zastaralé omezení počtu družic v <c1/>.</b> Scénář omezoval <c2/> na { "12" }, ačkoli jeho vlastní stavitel konstelace podporuje { "24" } a test tvrdí { "24" }, takže každý požadovaný počet nad { "12" } byl tiše snížen a průchod počtem družic vracel nad { "12" } shodné hodnoty — k nerozeznání od skutečného geometrického nasycení. Nyní je omezeno na limit stavitele. Jde o změnu chování jen pro <c3/>.

seg-4df7d4d61b40 = Totéž zastaralé omezení v <c1/>.

seg-8adfbd27c4f8 = <c1/> omezovalo <c2/> na { "12" } se stejným důsledkem a tento se dostal do publikované tabulky: <c3/> nese řádek <c4/> bajtově totožný s řádkem <c5/>, protože engine vrátil odpověď pro dvanáct družic pod označením šestnácti družic. Nyní je omezeno na limit stavitele { "24" } a nový test to přišpendluje — každá větší konstelace musí hlásit vlastní počet a přísně zlepšit ochrannou úroveň, takže omezení se nemůže nepozorovaně vrátit. <b>Toto mění publikovaná čísla</b>: ochranná úroveň <c6/> se mění na { "16.92" } m → { "14.57" } m. Při průchodu do { "24" } je křivka přísně monotónní ({ "11.94" } m při { "24" } družicích, o { "29.5" } % lepší než při { "12" }), takže při { "12" } žádné nasycení není — zdánlivá plošina byla omezením. Změna chování jen pro <c7/>.

seg-ebee158b73c8 = Vydání dokumentace, transparentnosti a playgroundu. Žádné chování enginu se nemění: verifikační matice stojí na <b>{ "102" } řádcích — { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, beze změny oproti { "0.25.0" }.

seg-7af422ed6d89 = <b>Rustdoc na úrovni crate</b> (<c1/> v <c2/>) pokrývající vstupní body, model poctivosti a úrovní a reprodukovatelnost, takže docs.rs se otevře na skutečné úvodní stránce místo holé zdi modulů.

seg-dd44c25f3af5 = <b><c1/></b> — referenční příručka po druzích pro všech <c2/> druhů scénářů, generovaná z <c3/> (jediného zdroje pravdy) pomocí <c4/> a hlídaná <c5/>, takže se nemůže rozejít s dispečerem.

seg-e2cc77d3b413 = <b>Dokumentace modulů</b> pro { "11" } dříve nedokumentovaných veřejných modulů (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

seg-8d156713799d = <b>Literární zdroje</b> pro pět modulů vzorců, které uváděly rovnici, ale nejmenovaly žádný odkaz: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon et al.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

seg-832b4bfbc48a = <b>Publikovaný <c1/></b> na kshana.dev pro koordinované zveřejňování.

seg-30603f59e27d = <b>Úroveň validace pro každý běh v playgroundu.</b> Tabulka ukazatelů kvality jednoho běhu nyní nese u každého ukazatele štítek VALIDATED/MODELLED čtený ze stejného vyhledávání <c1/>, jaké používá stažitelná zpráva (zrcadlí <c2/>, samo odvozené z verifikační matice), takže úroveň zobrazená vedle živého čísla se nikdy nemůže rozejít s registrem.

seg-93b203f3a1c0 = <b><c1/></b> v nabídce playgroundu — všech { "50" } spustitelných druhů je nyní na jedno kliknutí (dříve 49/50).

seg-1ec0830db404 = <b>Dalších pět spustitelných karet schopností</b> (kosmické počasí, vyhodnocení RF poruch, odolnost, interoperabilita CCSDS OEM, KIF), které zvyšují počet spustitelných karet z { "11" } na { "16" }. Karty pouze pro API a knihovnu si ponechávají poctivý odkaz na dokumentaci místo falešného tlačítka spuštění.

seg-977ea074dd9d = Pokrytí dokumentací je nyní v CI zajištěno západkou.

seg-beb308bcaafb = <c1/> zkompiluje knihovnu s <c2/>, spočítá varování a selže, jen pokud počet překročí připnutý strop ({ "986" }). Pevné <c3/> pod <c4/> by přes noc změnilo ~{ "1000" } nyní nedokumentovaných veřejných položek v zlomení sestavení; takto nové nedokumentované veřejné položky sestavení shodí, zatímco stávající nevyřízené se splácí záměrně.

seg-27668072a608 = <b>Řádek nástroje MCP <c1/> uváděl „~{ "17" } vestavěných druhů scénářů“</b>, zatímco <c2/> už nějakou dobu zpřístupňovalo { "50" } — dokument pro agenty podhodnocující skutečnou schopnost trojnásobně. Připnuto na skutečný počet.

seg-1ffc9f9816e8 = Znovu vygenerováno orákulum shody CycloneDX SBOM pro aktualizovaný graf závislostí ({ "60" } komponent). Verdikt shody se nemění: nula normalizovaných chyb schématu a každý atomický identifikátor licence je stále ve oficiálním výčtu SPDX.

seg-a6db590bbcbe = <b>Pět schopností povýšeno na externě VALIDATED</b>, každá je nyní křížově ověřena proti nezávislé implementaci třetí strany téže jednoznačně definované veličiny (nekruhově, s přípravky regenerovatelnými offline):

seg-98588143b4bb = <b>Převod mocninného zákona IEEE-1139 na Allanovu odchylku</b> proti uzavřeným tvarům <c1/> pro všech pět typů šumu (<c2/>);

seg-ce37d70fa8bc = <b>Váhy formovače svazku CRPA MVDR / s minimální normou pro potlačení v nulách</b> proti LAPACK v numpy/scipy (<c1/>);

seg-0f033d1027f8 = <b>Určování orientace Wahba / TRIAD / QUEST</b> proti SVD <c1/> v SciPy na pozorováních bez šumu (<c2/>);

seg-e1e2283cb524 = <b>Výměna bloku kovariance OEM podle CCSDS { "502.0" }</b> projitá tam a zpět parserem nezávislé knihovny <c1/> (<c2/>);

seg-579eefbb646f = <b>jádro detekčních statistik akvizice se čtvercovým detektorem</b> (zobecněné Marcum-Q / P_d / P_fa / práh) proti SciPy <c1/>/<c2/> (<c3/>). Strojově kontrolovaná validační matice se posouvá na <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> ve <b>{ "102" } řádcích</b> (dříve { "51" } · { "47" } · { "4" }). Poctivá omezení rozsahu zůstávají zachována — např. povýšení akvizice pokrývá jen jádro detekčních statistik; CFAR/ztráta překlenutím zůstává MODELLED.

seg-b6a140d55580 = <b>Ukazatele kvality v prostoru polohy</b> (<c1/>): přesné CEP, SEP a 2DRMS z 3D kovariance polohy ENU navigačního řešení plus horizontální ochranná úroveň. CEP/SEP jsou <em>přesné</em> mediány radiální chyby (nikoli lineární pravidlo <c2/>), křížově ověřené proti kvantilům rayleigh/maxwell z <c3/> a nezávislému mediánu Monte Carlo v NumPy (<c4/>). Nahrazuje předchozí poctivý stub „neimplementováno“ — <b>podpis funkce se změnil</b> z <c5/> vracejícího chybu na <c6/> vracející <c7/>.

seg-1551afa17154 = <b>Ekvivalentní počet stupňů volnosti (EDF) intervalu spolehlivosti dokončen pro všechny odhadovače rodiny Allan</b> (<c1/>): EDF modifikované Allanovy, Hadamardovy a celkové variance nyní používá kombinovaný algoritmus EDF Greenhall & Riley a tvar TOTVAR z Table-7 NIST SP { "1065" } (dříve byl implementován jen EDF překrývající se Allanovy variance; ostatní jej tiše používaly znovu), křížově ověřeno proti <c2/> <c3/>/<c4/> (<c5/>).

seg-39753e7919cc = <b>Nezávislé externí křížové kontroly pro lunární geometrii PNT, DOP, EOP, DRO a měření vzdálenosti v RF</b> (<c1/>, s přípravky a generátory orákulí pod <c2/>). Každá kontrola vede již dodanou <b>modelovanou</b> schopnost proti orákulu vytvořenému <em>jinou</em> implementací, takže shoda je nekruhová: orbitální stopa vysílání/příjmu proti <c3/> (Cephes — skutečně jiná Besselova J1); geometrie DOP povrchových majáků proti nezávislému řešení <c4/> v NumPy; růst chyby predikce perzistence UT1/EOP proti samostatnému novému parsování týchž doslovných řádků IERS <c5/> v NumPy; rovinná rodina vzdálených retrográdních drah proti databázi periodických drah tří těles NASA/JPL; a rozpočet přesnosti měření vzdálenosti v RF proti referenci z prvních principů. Jsou to další regresní důkazy pro existující moduly; přidání těchto křížových kontrol samo o sobě žádnou schopnost nepřeznačuje (pět povýšení výše jsou samostatné změny stavu opřené o orákulum v <c6/>).

seg-662c04f0552f = <b>Scénář <c1/></b> (<c2/>, <c3/>): složený, z binárky dosažitelný (CLI / Python / MCP / wasm přes <c4/>) běh lunární bezpečnosti signálu P1, který spojuje deficit výkonu v rozpočtu spoje a jeho pásmo citlivosti { "12" }–{ "18" } dB, požadovaný vysílací výkon rušení/spoofingu v závislosti na odstupu, orbitální stopu záchytu při skutečném anténním diagramu, výsledek zachycení smyčky sledování spoofingem, dosah horizontu u tělesa bez atmosféry a rozpočet autentizace OSNMA/TESLA. Prázdné tělo reprodukuje základ P1.

seg-a9b7ee942a23 = <b>Pásmo citlivosti deficitu výkonu</b> (<c1/>, <c2/>): skutečný vícerozměrný průchod (reference × EIRP × šikmá vzdálenost) postavený na <c3/> a vyhodnocený přes <c4/>, který reprodukuje pásmo P1 { "12" }–{ "18" } dB a sjednocuje hodnoty lineárního faktoru { "32" }× (zaokrouhleno) / { "36" }× (nezaokrouhleno).

seg-0734a4ca7535 = <b>Trojrozměrná krychle zachycení spoofingem</b> (<c1/>): přidává k mapě zachycení osu posunu nosné/Dopplera (J/S × posun kódu × posun nosné, doba zachycení na buňku); řez s nulovou nosnou se přesně redukuje na 2D <c2/>.

seg-3b9bbc25b114 = <b>Detekce řídkou sítí monitorů</b> (<c1/>) nyní skládá fyzikální statistiku AGC <c2/> a selenografickou mřížku viditelnosti <c3/>, z nichž odvozuje detekční statistiku a geometrii každé stanice, místo volných parametrů a ad hoc překryvu po kružnicích; pravděpodobnosti detekce jednotlivých monitorů i sítě zůstávají uzavřenými tvary chí-kvadrát/Marcum-Q z <c4/>. <b>Pole <c5/> / <c6/> se změnila</b> na fyzikální veličiny (zem. šířka/délka/výška/výkon).

seg-54c36267382c = <b>Dimenzování režie autentizace OSNMA/TESLA</b> (<c1/>): části polí OSNMA na stránku (8 bitů HKROOT + 32 bitů MACK na stránku o { "2" } s) byly chybně označeny jako součty na podrámec, což podhodnocovalo režii { "15" }× ({ "1.33" } bit/s). Opraveno na publikované součty SIS-ICD na 30s podrámec (HKROOT { "120" } + MACK { "480" } bitů ⇒ <b>{ "20" } bit/s</b>). Důsledek se nyní uvádí poctivě: při navigační rychlosti AFS { "50" } bit/s je režie autentizace <b>náklad prvního řádu ≈{ "40" } %</b>, nikoli zanedbatelných několik procent; pole <c2/> je zdokumentováno jako zpoždění odhalení klíče (dolní mez doby do prvního autentizovaného řešení od začátku do konce).

seg-0cf179a34252 = Široké vydání schopností. Přináší dvě plně <b>externě ověřené</b> analytické sady — úplnou rodinu <b>vícekriteriální analýzy rozhodování (MCDA)</b> a odhadovače <b>Allanova wanderu / dlouhodobé stability hodin pro dlouhé τ</b> — a otevírá na substrátu novou spustitelnou vrstvu scénářů <b>lunárního časového rozpočtu, soustavy/EOP v reálném čase, optického/RF hybridu, cislunární pozorovatelnosti a odolnosti vrstveného PNT vůči konfliktu</b>, plus substrát schopností <b>lunárního povrchového majáku</b> a <b>bezpečnosti signálu</b>. Strojově kontrolovaná validační matice roste na <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> ve <b>{ "102" } řádcích</b> (dříve { "40" } · { "47" } · { "4" } ve { "91" }): všech jedenáct nových řádků jsou validace s externím orákulem pro rozhodovací analýzu a odhadovače časování, kontrolované proti nezávislým knihovnám (SciPy, pymcdm, pyDecision, allantools) s úzkou tolerancí, zatímco nový povrch schopností PNT je poctivě uveden jako MODELLED. Jako vždy se žádné číselné tvrzení modelu nepovyšuje bez externí datové sady za ním.

seg-267e50f8dd56 = <b>Spustitelné scénáře</b> — každý je registrovaný scénář <c1/>, spouštěný přes engine a od začátku do konce prokázaný v CI pomocí <c2/> (který spouští každý přibalený <c3/> a tvrdě selže u jakéhokoli nespustitelného přípravku):

seg-c87fc11dd86b = <b>Odolnost vrstveného PNT vůči konfliktu</b> (<c1/>, <c2/>) — engine odolnosti Monte Carlo se seedem pro víceúrovňovou architekturu PNT, s modelem <b>přežití při postupné degradaci po vektorech</b> podle §{ "4.2" } (čtyři pojmenované vektory hrozeb, uzavřený tvar přežití použitelného PNT, ke kterému konverguje Monte Carlo po vrstvách, vydávaný ve výsledném JSON) a zdokumentovaným, před rozchodem hlídaným původem parametrů hrozeb (<c3/>). Architektury MODELLED; konvergence Monte Carlo přežití → uzavřený tvar je ověřené jádro.

seg-9c69e4d8ade9 = <b>Cislunární pozorovatelnost</b> (<c1/>, <c2/>) — vlastní spektrum Gramiánu pozorovatelnosti přes oblouk, diferenciálně korigovaný zakladač vzdálených retrográdních drah (DRO) a nezávislá křížová kontrola odmocninovým informačním filtrem, jehož posteriorní kovariance se stává konečnou přesně při plné pozorovatelné hodnosti. Konstelace MODELLED; invarianty hodnosti/Gramiánu/STM/SRIF jsou ověřené jádro.

seg-92fb333483e5 = <b>Heterogenní optický/RF hybrid: kontinuita a integrita</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) — dostupnost a integrita napříč doménami, když se kombinují optické a RF PNT. MODELLED.

seg-08e2f640ae14 = <b>Endogenní lunární časový rozpočet</b> (<c1/>, <c2/>) a <b>rozpočet soustavy / EOP v reálném čase</b> (<c3/>, <c4/>, <c5/>) — rozpočty lunárního času a orientace Země P3/P4 odvozené endogenně z časovacího řetězce, nikoli tvrzené. MODELLED.

seg-52c2f9c2c9a7 = <b>Externě ověřené analytické sady</b> — knihovní schopnosti, z nichž každá vstupuje do matice jako nové řádky VALIDATED (kontrolované proti nezávislému externímu orákulu, nikoli samokontrolou):

seg-709789e8fb04 = <b>Úplná sada vícekriteriální analýzy rozhodování (MCDA)</b> (<c1/>) — čtyři rodiny metod: agregace hodnot (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), poměrový systém (<b>MOORA</b>) a proporcionální (<b>COPRAS</b>), vzdálenost od ideálu (<b>TOPSIS</b>), kompromisní programování (<b>VIKOR</b>) a přednostní (<b>PROMETHEE II</b> se šesti tvary zobecněného kritéria, <b>ELECTRE I</b> konkordance/diskordance) — plus váhy priorit z Perronova vlastního vektoru <b>AHP</b> s branou poměru konzistence Saaty (CR < { "0.10" }), užitek <b>MAUT</b>, extrakci Paretovy fronty a analýzu <b>citlivosti</b> na váhy. Devět agregátorů reprodukuje <b>pymcdm</b> / <b>pyDecision</b> a vlastní vektor AHP odpovídá SciPy/LAPACK, vše s přesností < { "1e-9" } (<c2/>). Tornádový diagram citlivosti je k dispozici i uvnitř scénáře odolnosti vůči konfliktu.

seg-2ce49cbfd8bf = <b>Odhadovače Allanova wanderu a dlouhodobé stability hodin pro dlouhé τ</b> (<c1/>) — <b>MTIE</b> (statistika wanderu časové chyby špička–špička podle ITU-T G.810/G.823/G.8261, proti níž se píší synchronizační masky), časový wander <b>MDEV</b> a <b>TDEV</b> a odhadovače s rozšířeným rozsahem <b>Theo1 / TOTVAR</b>. VALIDATED proti <b>allantools</b> na řadě NIST SP { "1065" }; hybrid <b>ThéoH</b> s odstraněným zkreslením, postavený na TOTVAR, zůstává poctivě MODELLED.

seg-68bcdf8bd5de = <b>Zajišťovací harness / harness externích orákulí</b> (<c1/>) — harness orákulí napojený přímo na bránu poctivosti v CI, záznam původu <b>W3C-PROV</b> s deterministickým kořenem Merkle a ekvivalentní stupně volnosti <b>Greenhall</b> + intervaly spolehlivosti chí-kvadrát u odhadů stability.

seg-dcb91813b24c = <b>Rozhraní rozšíření PackRegistry / ExternalPack</b> (<c1/>, <c2/>) — rozhraní dispečinku, aby se balíčky schopností směrovaly přes jediný registr (vestavěný dispečink je na rychlé cestě CLI; balíčky mimo strom se připojují za výchozím <c3/>), hlídané zlatou sadou shody bajtové identity a bránami CI pro samostatný běh / wasm32.

seg-16b1f5d249ed = <b>Modelovaný substrát schopností</b> — nové knihovní moduly napájející výše uvedené scénáře i budoucí (zatím ne samostatný scénář <c1/>):

seg-f8c9ffbc56cf = <b>DOP lunárního povrchového majáku</b> (<c1/>) s rozpočtem realizované přesnosti, průchodem počtem N družic a mapou GDOP, plus rušená lunární efemerida (<c2/>) a geometrie horizontu bez atmosféry / inverze výkonu spoofingu / pásmo deficitu AFS (<c3/>, <c4/>). Znovu používá jádro DOP ověřené proti gnss_lib_py.

seg-28209a2747d5 = <b>Načítání DEM ve formátu LOLA</b> + přímá viditelnost s terénem (<c1/>).

seg-6e98ac90a0e2 = <b>Třívrstvá obrana bezpečnosti signálu</b> — zachycení spoofingem, křížová integrita senzorů a dimenzování sítě monitorů (<c1/>, <c2/>, <c3/>) s anténní stopou orbitálního svazku a rozpočtem autentizace OSNMA (<c4/>, <c5/>). MODELLED.

seg-bd5b9511accb = Validační matice a každý odvozený artefakt byly znovu vygenerovány z jediného zdroje pravdy (<c1/>): registr na webu, diagramy mapy modulů a původu validace a řetězce počtů v README a na jednotlivých plochách nyní uvádějí <b>{ "51" } / { "47" } / { "4" } ze { "102" }</b> (dříve { "40" } / { "47" } / { "4" } z { "91" }); stráž poctivosti počtů nyní prohledává celou historii gitu a obrázky README jsou sjednoceny na tmavou paletu značky.

seg-c2ec7e2b6296 = Jeden sdílený adaptivní integrační ovladač nyní stojí za <c1/> i <c2/> (<c3/>) a odstraňuje zdvojený krokovač.

seg-85cfb0f10268 = Do CI přidána statická analýza <b>SonarQube Cloud</b> (Rust + importované pokrytí) s odznaky hodnocení bezpečnosti / udržovatelnosti / spolehlivosti v README.

seg-deeef8318367 = Disciplína vydání / balení: CI registruje prostředí nasazení pro každou publikaci balíčku/registru a zaměřená úloha public-standalone je oddělena od pomalých validačních binárek.

seg-30181148b098 = Stráž hygieny bez uvádění původu je omezena jen na značky autorství, takže pojmenování hostitele integrace nebo produktu už sestavení neshodí.

seg-6eb3868fdce0 = Dokumentace: sekce README <b>Citing</b> nyní uvádí čtyři publikované preprinty arXiv a schopnost DOP povrchového majáku je zdokumentována v lunárním řádku.

seg-d12533cbf1f2 = Celočíselné čítače smyček pro smyčky řízené plovoucí řádovou čárkou (Sonar S2193).

seg-3c213354187f = Přesná inverze chí-kvadrát při nízkém počtu stupňů volnosti pomocí Newtonova zpřesnění v cestě intervalů spolehlivosti zajištění.

seg-386b7094d34d = kshana.dev: sekce standardů se nyní otevírá ve výchozím stavu a záložní počet v registru je opraven; zastaralé řetězce README / webu kolem vrstvy pozorovatelnosti jsou synchronizovány.

seg-33448f46894f = Vydání schopností přidávající obecnou <b>vrstvu Fisherovy informace / pozorovatelnosti Cramér–Rao a optimálního návrhu experimentu</b> a vydání, o které se opírá článek o pozorovatelnosti lunárního PNT. Strojově kontrolovaná validační matice roste na <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> v <b>{ "91" } řádcích</b> (dříve { "39" } · { "46" } · { "4" } v { "89" }): nový estimační engine je kontrolován proti externímu orákulu a je VALIDATED; jeho lunární aplikace je poctivě MODELLED. Jako vždy se žádné číselné tvrzení modelu nepovyšuje bez externí datové sady za ním.

seg-c377207026f4 = <b><c1/> — Fisherova informace, meze Cramér–Rao a optimální návrh experimentu.</b> Obecný, znovupoužitelný engine teorie odhadu: Fisherova informační matice <c2/> z měřicí jakobiánu a vah; symetrický řešič vlastních čísel (cyklický Jacobi); dolní mez Cramér–Rao přes inverzi, nebo přes Moore–Penroseovu pseudoinverzi plus bázi nulového prostoru, když je informace hodnostně deficitní (případ volné sítě / vady data); a metriky optimálního návrhu experimentu D, A, E a T se selektorem <c3/> nad kandidátními geometriemi. <b>VALIDATED</b> proti NumPy (<c4/>/<c5/>) a publikovaným uzavřeným mezím Kay ({ "1993" }) s přesností { "1e-9" } (<c6/>), takže vstupuje do matice jako řádek s externím orákulem, nikoli jako samokontrola.

seg-91d09b4e737f = <b>Pozorovatelnost společného určení dráhy u Měsíce</b> (<c1/> v <c2/>, zpřístupněno ve zprávě o lunární kombinaci): aplikuje engine FIM/CRLB na společné řešení dráhy a hodin, aby odhalil vadu data absolutní stanice, obnovu její hodnosti při přidávání stanic se zemskou základnou, dosaženou CRLB polohy stanice a E-optimální podmíněnost. Poctivě <b>MODELLED</b> — estimační engine je externě ověřen, ale lunární síť, na kterou se aplikuje, je reprezentativní simulace a žádná současná datová sada nemůže z této geometrie udělat měření.

seg-6b1cd00aca8c = <b>Reprezentativní geometrie eliptické lunární zamrzlé dráhy (ELFO)</b> pro scénář lunární kombinace (<c1/>, <c2/>, <c3/>, <c4/>; kruhové rozmístění zůstává výchozí) a pole pozorovatelnosti bez VLBI ve zprávě, aby se výsledek vady data dal ukázat jako obecný vůči geometrii. Stejný žebříček { "3" }→{ "1" }→{ "0" } a práh tří stanic platí na ELFO rodiny Moonlight/LCNS a při třech zemských základnách VLBI je absolutní poloha stanice pozorovatelná se submetrovou mezí — zajištěno <c5/>. Stále MODELLED.

seg-9e6627c0c417 = Validační matice a každý vygenerovaný artefakt důkazů byly znovu vygenerovány z jediného zdroje pravdy (<c1/>): registr (<c2/>), <c3/>, <c4/>, obrázky rozpisu validace a druhů orákulí a řetězce počtů v README napříč všemi distribučními plochami nyní uvádějí <b>{ "40" } / { "47" } / { "4" } z { "91" }</b>.

seg-6f90233290a2 = Vydání opravy jen pro balení. Žádné změny enginu, scénářů ani výsledků; validační matice je beze změny na { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER v { "89" } řádcích.

seg-9d41e1412d1f = Publikace do npm: balíček <c1/> odvozený z manifestu crate používal vlastníka GitHubu s chybnou velikostí písmen (<c2/>), což selhalo při ověření původu sigstore v npm (porovnává vlastníka s ohledem na velikost písmen). <c3/> v manifestu je nyní kanonické malé <c4/>, takže vygenerovaný <c5/> odpovídá subjektu původu a vydání npm se publikuje.

seg-fe1f8aae99f4 = Sestavení wheelu připíná <c1/>, aby wheel manylinux byl bajtově reprodukovatelný napříč přestavbami (kontrola reprodukovatelnosti přestavěním a porovnáním).

seg-b87075b47007 = Konsolidační vydání zaměřené na <b>důkazy, původ a disciplínu distribuce</b>. Strojově kontrolovaná validační matice roste na <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> ve svých <b>{ "89" } řádcích</b> (dříve { "15" } · { "42" } · { "4" } v { "61" }), hnáno křížovou validací modelovaných schopností proti nezávislým externím orákulím. Každý distribuovaný artefakt nyní nese kryptografickou atestaci původu sestavení SLSA, dodává CycloneDX SBOM a je publikován souběžně na všech plochách. Žádné číselné tvrzení modelu se nepovyšuje bez externí datové sady za ním; nová schopnost zůstává poctivě MODELLED.

seg-f6de783bfd29 = <b>Dynamika orientace</b> (<c1/>, MODELLED) — Eulerovy rovnice volného tuhého tělesa + kinematika kvaternionů (RK4), s autotesty zákonů zachování (norma kvaternionu, kinetická energie, |Iω|, precese symetrického vlčku).

seg-339bc18b9fc4 = <b>Křížová validace modelovaných schopností</b> proti nezávislým externím orákulím, která vede validační matici na { "39" } řádků VALIDATED, každý podložený externí datovou sadou (brána poctivosti v CI zakazuje stav VALIDATED bez ní). Nejnovější validace s externím orákulem: <b>změřená křivka stability optických hodin</b> (proložení křivky ADEV v <c1/> reprodukuje publikované σ_y(τ) optických mřížkových hodin ⁸⁸Sr od Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, přibaleno pod <c2/>); <b>generování rozprostíracího kódu GPS L1 C/A</b> (G1/G2 LFSR v <c3/> reprodukuje osmičkové kódové fáze z IS-GPS-200 Table 3-Ia pro PRN { "1" }–{ "9" }); a <b>čtečka digitálního modelu terénu SRTM na skutečném terénu</b> (<c4/> čte přibalenou dlaždici NASA/USGS SRTM v3 ve veřejné doméně, N36W117 / Death Valley, a umísťuje Badwater Basin do jeho zdokumentovaného průzkumného pásma).

seg-665d0dde637b = <b>Nové schopnosti MODELLED</b>, každá vnitřně zkontrolovaná proti uzavřenému tvaru nebo sesterské cestě kódu: dynamika relativního pohybu Clohessy–Wiltshire / Hill, pasivní geolokace zdroje TDOA/FDOA, určování orientace Wahba/TRIAD/QUEST, řešení celočíselné nejednoznačnosti fáze nosné GNSS (LAMBDA), cílení v B-rovině a gravitační manévr v patched-conic, tvarování svazku anténního pole CRPA proti rušení, statistiky akvizice GNSS se čtvercovým detektorem, nejednoznačnost proužků / dynamický rozsah kvantového inerciálního senzoru, mocninný šum hodin IEEE-1139 + flicker-FM podlaha a výměna bloku kovariance CCSDS-OEM.

seg-b3f53d5e3c3a = <b>Registr důkazů s jediným zdrojem</b> s vygenerovanými verifikačními dokumenty a stráží proti rozchodu; procházitelný validační registr na kshana.dev s odkazy na důkazy u každé karty.

seg-b3c0545157b3 = <b>Strojově čitelná metadata citace</b> — <c1/> (CodeMeta { "2.0" }) a <c2/>, přišpendlená k manifestu Cargo pomocí <c3/>.

seg-2ca8875da9de = <b>Původ dodavatelského řetězce</b> — atestace původu sestavení SLSA pro tarball crate, wheely, sdist a tarball npm; důvěryhodná publikace PyPI přes OIDC; CycloneDX SBOM dodávaný uvnitř wheelu a balíčku npm; rozdíl reprodukovatelného sestavení a ověření po vydání.

seg-18fdecf7f2fa = <b>Nalezitelnost</b> — <c1/>, <c2/> a metadata Open Graph / JSON-LD na kshana.dev; vygenerovaný obrázek <c3/> odvozený z matice.

seg-f80db0b0f545 = <b>README pro jednotlivé plochy</b> pro crates.io / PyPI / npm se stráží poctivosti počtů.

seg-bd33b21f8f91 = Orákulum <b>Sagnacova přenosu času</b> povýšeno na ExternalDataset — Sagnacova korekce při rovníkovém oblétnutí je nyní kontrolována proti publikovaným { "207.4" } ns od Ashbyho (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, Eq. { "1.29" }; reprodukováno s přesností < { "0.05" } ns). Složená schopnost přenosu času zůstává poctivě MODELLED.

seg-882133bf1fcc = <b>Dokumentace, diagramy a obrázky aktualizovány</b> na živou matici (39/46/4/89): diagram původu validace, obrázek <c1/> (nyní generovaný z matice se stráží proti rozchodu v CI), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, dokumenty architektury a tutoriálů a celkový počet v registru na kshana.dev.

seg-a9be3d71a52c = Zdrojový strom byl přeformátován připnutým rustfmt (toolchain { "1.93.0" }) — čistě styl, žádná změna chování.

seg-4542eb4fabfc = <b>Souběžné verzování.</b> Každá distribuční plocha (crate, PyPI, npm, crate MCP + image OCI, zásuvný modul JetBrains) nyní verzuje souběžně s enginem, což vynucuje <c1/> v CI.

seg-792df0cdc8a7 = <b>Zásuvný modul JetBrains</b> přelicencován na <b>AGPL-3.0-only</b> (publikovaná { "0.1.1" } stále uváděla Apache-2.0) a nyní odvozuje verzi pro Marketplace z tagu vydání.

seg-171f5649c90f = <b>Posílení robustnosti</b> — <c1/>y mimo testy odstraněny nebo odůvodněny; <c2/> vynuceno na kódu mimo testy.

seg-0e5abb2fad02 = Přepracování <b>kshana.dev</b> s důrazem na důkaz: dominantní úvodní sekce, diagramy architektury a obrázky výsledků, i18n, sbalitelné/responzivní sekce registru a standardů.

seg-05ef9b9f3653 = <b>Přesná efemerida SP3</b> — při interpolaci se uplatňuje korekce uzlu zemské rotace IGS.

seg-bbd0dc3dd9cb = <b>Obrázky v registrech</b> — README na PyPI/crates.io/npm používají absolutní URL obrázků; relativní cesty obrázků hlavního README se na stránce PyPI { "0.21.0" } vykreslovaly jako rozbité obrázky. Stráž v CI (<c1/>) brání regresi.

seg-6d044971dbc8 = <b>CI</b> — <c1/> + <c2/> zelené; přestat kompilovat proti skutečným datům ignorovaným gitem.

seg-c3c260b7063e = Testy

seg-5dca3defcfe3 = Kalmanova kovariance hodin zůstává PSD a symetrická (test vlastností, <c1/>).

seg-c861779f04ca = Stráže synchronizace dokumentace: každý veřejný řetězec s počtem validací, metadata citace, vygenerovaný obrázek a URL obrázků v README jednotlivých ploch jsou všechny přišpendleny ke svému zdroji pravdy.

seg-0540044c92a6 = Toto vydání přidává do otevřeného enginu dvě aplikační sady MODELLED — <b>demonstrátor PNT s kvantovými technologiemi</b> (důvěryhodný kvantový přenos času, kvantová navigace bez GNSS, kvantová detekce poruch/anomálií) a <b>sadu lunárního / cislunárního PNT</b> (lunární souřadnicový čas, lunární VLBI, společné OD+hodiny, realizace soustavy, objem služby, diferenciální PNT, export interoperability) — každou spustitelnou z jediného <c1/>, každá vydává poctivý záznam <c2/> plus registr reprezentativnosti / mezer k letu. Přináší také <b>šest nových validací s externím orákulem</b>, které vedou strojově kontrolovanou validační matici na <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> v jejích { "61" } řádcích. Nová aplikační čísla jsou MODELLED z ilustrativních parametrů z veřejných zdrojů — žádná TRL, letová historie, certifikace ani podpora agentury — a ověřená jádra, která znovu používají, jsou tak označena.

seg-82a1822f53e2 = <b>Sada demonstrátoru PNT s kvantovými technologiemi</b> (<c1/>, <c2/>, <c3/>). Tři spustitelné aplikační oblasti MODELLED za enginem, z nichž každá vydává <c4/> plus záznam reprezentativnosti / mezer k letu:

seg-07532f03a1f1 = <b>Důvěryhodný kvantový přenos času</b> (<c1/>) — rozpočet optických mřížkových hodin + fotonického spoje oproti CSAC + dvoucestnému RF, znovu používající ochrannou úroveň časování, s ukazatelem bezpečnosti proti útoku zpožděním/přehráním ({ "1" } − P_md) a detekcí anomálie hodin + latencí CUSUM.

seg-4c9036cffe1b = <b>Kvantová navigace bez GNSS</b> (<c1/>) — inerciální doběh s interferometrem studených atomů oproti INS navigační třídy při výpadku GNSS, poctivě s tím, že bez externího určení polohy zůstává odchylka akcelerometru nepozorovatelná, takže chyba stále roste.

seg-6188f1c6893a = <b>Kvantová detekce poruch / anomálií</b> (<c1/>) — označený katalog poruch s ROC AUC s bootstrapovým intervalem spolehlivosti a minimální detekovatelnou poruchou při pevné míře falešných poplachů.

seg-9e22314b1337 = Za všemi třemi stojí sdílená knihovna chybových modelů kvantových zařízení (<c1/>) a jednotný harness srovnání kvantového a klasického přístupu (<c2/>).

seg-808e20f28556 = <b>Sada lunárního / cislunárního PNT.</b> Sedm spustitelných <c1/> MODELLED vrstvených na jádru CR3BP: <b>lunární souřadnicový čas</b> (sekulární rychlost LTC/TCL − TT, <c2/>), geodetická pozorovatelná zpoždění <b>lunárního VLBI</b> (<c3/>), dávkový odhadovač <b>společného víceúrovňového OD + hodin</b> (<c4/>), <b>realizace referenční soustavy</b> (Helmert se 7 parametry + vazba IAU { "2015" } WGCCRE, <c5/>), analýza <b>objemu služby třídy Moonlight / LCNS</b> (<c6/>), <b>lunární diferenciální PNT</b> (<c7/>) a <b>export interoperability sladěný s LunaNet / IOAG</b> (CCSDS-OEM + lunární časová stupnice v obálce KIF, <c8/>). Vše MODELLED z ilustrativních parametrů z veřejných zdrojů; neověřeno proti skutečnému sledování VLBI / Gateway; žádná příslušnost k agentuře ani její podpora.

seg-a892ce052e3c = <b>Šest nových validací s externím orákulem</b> (validační matice nyní stojí na { "15" } ověřených):

seg-c30ae6767c6c = <b>ADEV / HDEV na skutečných cesiových hodinách 5071A</b> — ověřeno proti dekádovým referenčním bodům Stable32 (<c1/>).

seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV na referenci Stable32 <c1/></b> — ověřeno proti publikovaným tabulkám Stable32 (<c2/>).

seg-e8728f57effa = <b>ROC AUC detekce anomálií na skutečné telemetrii ESA OPS-SAT</b> — ověřeno proti scikit-learn (<c1/>).

seg-5446957ac631 = <b>Syntéza funkcionálů gravitace ICGEM</b> — ověřeno proti normální tíži GRS80 (Somigliana γ s přesností { "3.5e-12" }; mapa poruch EGM2008, <c1/>).

seg-751c5ac90229 = <b>Klobucharův vysílaný model ionosféry</b> — ověřeno proti RTKLIB (<c1/>).

seg-dcc6d4e04a5c = <b>Detekční jádro RAIM</b> ({ "171" } případů, <c1/>) a <b>ochranná úroveň SBAS DO-229E</b> na skutečných datech EGNOS (fork RTKLIB SBAS-PL, <c2/>) — obojí ověřeno proti jejich externím orákulím.

seg-3f6c1ff0b3a4 = <b>Registr reprezentativnosti a mezer k letu</b> (<c1/>). Strukturovaný záznam, který vydává každý demonstrátor — co je reprezentativní, co je zjednodušeno a co stojí mezi modelem a letem — poctivý doprovod každého srovnání MODELLED.

seg-6b4c78bdaf35 = <b>Agregace studií a ergonomie CLI.</b> Manifest sady scénářů s agregací studie jedním příkazem, hashově stabilní metadata studie + <c1/>, lintování scénářů <c2/> a zobrazení úrovně validace u každého ukazatele kvality ve zprávách studie.

seg-e24230b80a89 = <b>kshana.dev přepracován kolem sdílené doménové páteře</b> — schopnosti a validace sloučeny do jednoho doménového průzkumníka se společnou slovní zásobou, nové ověřené ostrovy zviditelněny, animovaná Země přesná na pevniny jako přístroj a výzva k zadání studie, a značka/odkazy Ashforde OÜ.

seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE zkontrolovány na úplnost a poctivost</b> — zastaralé počty ověřených opraveny (nyní { "15" } externích orákulí), diagramy rozšířeny a citovány preprinty Conditional Timing Protection Level (arXiv:{ "2606.24210" }) a RF-impairment optimism-gap (arXiv:{ "2606.22054" }).

seg-42a317c6ce06 = Zdroje <c1/> a řetězec konceptu JOSS jsou ponechány ve veřejném repozitáři.

seg-8ed5cf845b00 = Toto vydání přidává do otevřeného enginu čtyři schopnosti studií — podmíněnou ochrannou úroveň časování, hodnocení odolnosti PNT sladěné s rámcem, vyhodnocení mezery optimismu u RF poruch a front end softwarově definovaného přijímače / skutečných dat — každou reprodukovatelnou jediným příkazem a zapisující bajtově deterministický artefakt. Všechny studie jsou MODELLED (syntetická kalibrace nebo kalibrace na veřejné datové sadě), nesou svůj poctivý původ (verzi enginu, seedy, hash konfigurace) a validační štítky a nejsou certifikacemi.

seg-0c9f0c665491 = <b>Podmíněná ochranná úroveň časování (<c1/>).</b> Mez nezachycené časové chyby při spoofingu GNSS omezená holdoverem, s podlahou monitoru k-sigma, van Loanovým rozptylem doběhu přes latenci detekce a dobou do poplachu CUSUM. Kalibrováno na skutečném zaznamenaném útoku (JammerTest { "2024" }, scénář { "2.1.1" }) pomocí <c2/>, což reprodukuje jeho referenční tabulku ze skalárů získaných z veřejného záznamu (surová datová sada se nedistribuuje).

seg-d874d7f13f28 = <b>Hodnocení odolnosti PNT sladěné s rámcem + studie nestability rozhodnutí (<c1/>).</b> Model architektury, hodnocení sladěné s RPCF, simplex vah Dirichlet, nestabilita Kendallova tau a míry převrácení top-1 a kolaps diverzity společného režimu (Hill-N2), s <c2/>. Převodní tabulka v <a1><c3/></a1>.

seg-343f7af54503 = <b>Studie mezery optimismu u RF poruch (<c1/>, <c2/>, <c3/>).</b> Panel 13 detektorů nad parametricky podloženým syntetickým korpusem, mezera optimismu uvnitř a vně rozdělení, trendy zákonů škálování s permutační nulou a prediktor degradace typu leave-one-out, přes <c4/>.

seg-6eed55859bbf = <b>Front end softwarově definovaného přijímače (<c1/>) a adaptéry skutečných dat (<c2/>).</b> Surové IQ/IF na odbočky korelátoru a SQM, plus adaptéry načítání (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) a sondovací příklady. Čtou záznamy, které uživatel dodá lokálně; žádné záznamy se nekomitují.

seg-afe2282fa771 = <b>Zakomitované artefakty studií.</b> Bajtově deterministické <c1/> a <c2/> se nyní sledují pod <c3/>, aby se čísla studií dala zkontrolovat bez přestavby; zůstávají regenerovatelné z generátorů výše. Surové datové sady zůstávají mimo repozitář (<c4/>).

seg-450d82cddc28 = Verze navýšena na { "0.20.0" } v <c1/>, <c2/> a <c3/>; artefakty studie křížení jsou znovu vygenerovány, aby jejich značka odpovídala vydané verzi.

seg-a0a66af8fd14 = <b>Přelicencováno z Apache-2.0 na GNU AGPL-3.0-only s komerční licencí dostupnou od Ashforde OÜ (duální licencování).</b> Otevřený engine zůstává plně otevřený a veřejně ověřitelný; síťový copyleft AGPL (§{ "13" }) znamená, že uzavřený nebo hostovaný odvozený produkt se musí vrátit do open source — nebo si vzít komerční licenci. Tím se ověřené jádro brání proti forku a uzavření a zároveň se zachovává důvěryhodnost veřejného, spustitelného a auditovatelného enginu. Viz <a1><c1/></a1> (AGPL) a nový <a2><c2/></a2> (co každá licence pokrývá a kdy se uplatní).

seg-ffa799fdb814 = <c1/> nyní obsahuje text AGPL-3.0; hlavičky SPDX ve všech zdrojích aktualizovány na <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, web a metadata crate/balíčků (<c7/>, <c8/>, <c9/>, crate MCP + image) odpovídajícím způsobem aktualizovány.

seg-8d67aba2af0b = <b>Podmínky pro přispěvatele</b> (<a1><c1/></a1>) nyní licencují příspěvky přicházející pod AGPL <b>a</b> uděluje Ashforde OÜ právo zahrnout příspěvky do komerčně licencované edice, takže duální licencování dál funguje.

seg-93644d1c1420 = <b>Politika závislostí beze změny, ale znovu odůvodněná</b> (<a1><c1/></a1>, <c2/>): závislosti zůstávají permisivní (Apache/MIT/BSD/ISC). AGPL je povolena jen pro vlastní crate kshana — copyleftová <em>závislost</em> by poskvrnila komerční edici a rozbila duální licencování.

seg-9b77c2d36241 = <b>Poznámka pro navazující uživatele:</b> jde o copyleftové přelicencování. Uživatelé, kteří se spoléhali na permisivní podmínky Apache-2.0, mohou dál používat poslední vydání pod Apache-2.0 (<c1/> a starší, tak jak byla publikována); od <c2/> výše je AGPL-3.0 / komerční.

seg-51e32f15b7ea = <b>Navýšeno <c1/> { "0.24" } → { "0.29" }</b>, aby se z externích skenů OSV/závislostí odstranily RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp). Obě jsou upozornění <em>na úrovni funkce</em>, jejichž dotčené funkce (<c2/>/<c3/>, <c4/>) Kshana nikdy nevolá, a <c5/> je volitelná závislost (funkce <c6/>) — skutečná expozice tedy byla nulová — ale navýšení udržuje čistý sken pro navazující auditory. <c7/> migrováno na API pyo3 { "0.29" } (návratový typ Bound pro <c8/>; explicitní <c9/> na pyclass <c10/>). Všech { "11" } testů pythonové vazby projde proti znovu sestavenému rozšíření.

seg-8d9332df5c74 = <b>Jedenáct nových spustitelných druhů scénářů — demonstrátory dvou tendrů, most interoperability CCSDS a sada analýzy mise / prostředí prvního řádu (vše MODELLED, aditivní; stávající golden reprodukovatelnosti beze změny).</b> Každý je spustitelný přes CLI / Python / WASM / MCP, dodává <c1/> a nese výslovný štítek MODELLED ve výsledném JSON a jednořádkovém souhrnu (test pro každý druh v <c2/> tvrdí, že štítek je přítomen a že výstup nikdy neobsahuje řetězec <c3/>):

seg-20b74caf58cc = <c1/> (<c2/>) — testovací stav pro vyhodnocení detekce RF poruch strojovým učením: označený <b>syntetický</b> korpus + harness <b>ROC/AUC</b> nezávislý na detektoru + zpráva o <b>mezeře optimismu</b> uvnitř/vně rozdělení (jen provozní charakteristiky — nikdy data z terénu/IQ).

seg-0253656a0ecf = <c1/> (<c2/>) — srovnání kvantového a klasického PNT s načítáním změřeného ADEV a obálkou odolnosti při odepření GNSS.

seg-901bd713bd62 = <c1/> (<c2/>) — solární/geomagnetické indexy (tabulka IAGA Kp↔ap, denní Ap, centrovaná 81denní F10.7a), exosférická teplota <b>Jacchia-71</b> a vazba termosférické hustoty řízená aktivitou nad statickou atmosférou (NE model absolutní hustoty NRLMSISE).

seg-2323b43c0ffc = <c1/> (<c2/>) — import <b>CCSDS { "502.0" } OEM</b> + most pro obousměrný převod pro efemeridy GMAT / Orekit / STK (čtečka <c3/>, přesná inverze zapisovače).

seg-188aeb3e8219 = <c1/> (<c2/>) — <b>azimut startu</b> ve dvoutělesové úloze (<c3/>), Δv na změnu roviny, bonus rotace stanoviště a geometrie denních příležitostí.

seg-6200a47276e6 = <c1/> (<c2/>) — balistický koridor návratu <b>Allen-Eggers</b>: špičkové zpomalení, rychlosti při špičkovém g a špičkovém ohřevu, výška při špičkovém g.

seg-0874c2241748 = <c1/> (<c2/>) — geometrie EO <b>záběr / GSD / přístup / opakovaný přelet</b> (prostorový trojúhelník SMAD).

seg-83c7588ff074 = <c1/> (<c2/>) — kódování/dekódování primární hlavičky <b>CCSDS 133.0-B Space Packet</b> s bitově přesným převodem tam a zpět.

seg-ae1bcad02880 = <c1/> (<c2/>) — 3-DOF <b>moment gravitačního gradientu</b> + <b>rozpočet chyby zaměření RSS</b> (skalární rozpočet před hardwarem, nikoli regulační smyčka).

seg-65f59cc12e02 = <c1/> (<c2/>) — <b>předpověď přeletů východ/západ</b> pozemní stanice (AOS/TCA/LOS, maximální elevace, přístup).

seg-178776497627 = <c1/> (<c2/>) — jednosměrná rovnice spoje <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / rezerva / uzavření).

seg-e7fee32a00f5 = <b>17stavový hybridní kvantový + klasický těsně vázaný UKF — zpřístupněn jako spustitelný scénář (MODELLED).</b> Nový druh scénáře <c1/> (<c2/>, <c3/>), který mění dříve jen API dostupný 17stavový těsně vázaný nescentovaný filtr GNSS/INS (<c4/>) na scénář, který mohou spouštět vazby CLI/Python/WASM/MCP. 17stavový vektor chyb tvoří <b>{ "15" } chybových stavů INS</b> (poloha, rychlost, vychýlení orientace, odchylka akcelerometru + gyroskopu) rozšířených o <b>korekci odchylky akcelerometru odvozenou z CAI</b> — interferometr studených atomů (<c5/>) určuje podlahu náhodné procházky rychlosti <c6/>, takže dlouhodobý drift při doběhu je limitován kvantovým senzorem — a <b>2stavové hodiny fáze + frekvence</b>, jejichž procesní šum pochází z <b>enginu hodin s q-parametry</b> (<c7/>, mapujícího profil Allanovy odchylky hodin na PSD <c8/>/<c9/>, přepočtené na jednotky vzdálenosti). Platforma je po úvodní fázi podporována GNSS (filtr se učí odchylky, rychlost a hodiny), poté doběhne přes výpadek GNSS jen na IMU CAI + hodinách, takže běh předvádí hybridizaci <b>krátkodobé klasické IMU + dlouhodobé kvantové</b>. Ukazatelem kvality je <b>vnitřní konzistence filtru</b>: sdružené <b>NEES</b> (Normalised Estimation Error Squared, přes odhadnutelnou podmnožinu polohy/rychlosti/hodin) a <b>bělost inovací NIS</b> (Normalised Innovation Squared) přes soubor Monte Carlo, kontrolované proti jejich pásmům χ² { "95" }% (Bar-Shalom §{ "5.4" }). Naladěný filtr leží uvnitř pásem; záměrně špatně naladěný filtr (parametry <c10/> / <c11/>) je označen — objektivně ověřitelná, rozlišující brána, nikoli razítko. <b>Kontrola NEES/bělosti inovací je STATISTICKÉ ORÁKULUM: tvrzení o vnitřní konzistenci (hlášená kovariance filtru poctivě odpovídá rozptylu jeho vlastních chyb při modelovaném šumu), NE záruka přesnosti v reálném světě.</b> Poctivý rozsah: vše je <b>modelované / simulace</b> — vstupy CAI a hodin jsou ohraničené hodnoty reprezentativní podle literatury, nikoli změřený hardware; hardware CAI a jeho Key-Person zůstávají v odpovědnosti partnera; nic zde nenaznačuje TRL > { "3" }, letovou historii ani externí validaci (výsledný JSON a jednořádkový souhrn tyto štítky uvádějí výslovně). Jediná trajektorie s konstantní rychlostí v rovině činí stavy orientace a odchylek IMU jen slabě pozorovatelnými, takže NEES se posuzuje přes { "8" } odhadnutelných stavů; manévrující trajektorie pro plnou pozorovatelnost 17 stavů je v plánu. Přidává také instrumentaci konzistence <c12/> (vrací NIS pro každou aktualizaci) a <c13/>. Všechny stávající scénáře jsou nedotčeny (aditivní; golden reprodukovatelnosti beze změny).

seg-9b55f4ac5053 = <b>Sekvenční (rekurzivní) navigace podle terénu — SITAN jako běžící filtr.</b> Nový druh scénáře <c1/> (<c2/>, <c3/>), který spouští stávající model měření výškoměr-versus-DEM <b>epochu po epoše</b> přes engine SIR <c4/>, místo dávkového hrubě-jemného hledání, které <c5/> používá k získání jediného <em>konstantního</em> posunu INS. V každém bodu trasy se oblak propaguje přírůstkem hlášeným INS (sám narušený růstem driftu v každém kroku), převáží podle shody s terénem a při degeneraci se znovu vzorkuje — takže <b>časově proměnný</b> drift INS je podél trasy <em>sledován</em>, což proložení konstantního posunu strukturálně nedokáže. Na syntetickém DEM zůstává rekurzivní odhad omezený a znovu konverguje (konečně ≈ { "70" } m), zatímco nepodporované inerciální řešení neomezeně diverguje na ≈ { "5" } km; chyba v každé epoše sleduje výraznost terénu (nad plochými sedly doběhne na zkreslené INS a nad výrazným reliéfem se znovu zachytí) a monitor efektivní velikosti vzorku potvrzuje zdravý oblak. Poctivý rozsah: mapa je <b>známá a pevná</b> — rekurzivní <em>lokalizace</em> vůči uloženému DEM (lokalizační polovina terénního SLAM), nikoli společný odhad mapy; z konstrukce nekruhové (vložená rampa driftu je nezávislá pravda). Všechny stávající scénáře jsou nedotčeny (aditivní; golden reprodukovatelnosti beze změny).

seg-87ba3bc926fa = <b>Páteř odolnosti při odepření GNSS + řezy demonstrátoru FutureNAV</b> (<c1/> a základy obálky odolnosti pod <c2/>, <c3/>, <c4/>, <c5/>, s verifikačními řezy FutureNAV v <c6/>). Skládá stavební bloky alternativního PNT — holdover hodin, sledování signálu, inerciální doběh, terén — do jediného příběhu odolnosti při výpadku GNSS. MODELLED; aditivní.

seg-071bb6654f24 = <b>Kshana Interchange Format (KIF) — verzovaná, samopopisná obálka artefaktů</b> (<c1/>). Obal se značkou schématu kolem výsledků scénářů, aby uložený artefakt nesl svůj druh, verzi schématu a štítky MODELLED/VALIDATED s sebou a starší obálky zůstaly dopředně kompatibilně čitelné. Aditivní; stávající výsledný JSON beze změny.

seg-07147766ab22 = <b>Modulace / sledování navigačního signálu + diferenciální korektor halo/NRHO v CR3BP</b> (<c1/>, <c2/>). Model modulace a sledování navigačního signálu prvního řádu a diferenciální korektor omezeného kruhového problému tří těles pro halo / téměř přímočaré halo dráhy, zpřístupněný na stávající ose schopností hlubokého vesmíru. MODELLED.

seg-d0d2366e3351 = <b>Režim vyhodnocení posunu rozdělení + parametr škály závažnosti korpusu pro <c1/></b> (<c2/>). Přidává do harnessu mezery optimismu ROC/AUC výslovné rozdělení uvnitř/vně rozdělení a laditelnou škálu závažnosti korpusu (jen provozní charakteristiky — nikdy data z terénu/IQ).

seg-9bb8ee93e70b = <b>Návratnost nákladů na pokrytí + mapování dopadu nezachycení detekce na integritu</b> (<c1/>, <c2/>). Čočka návratnosti z úsporného inženýrství (náklady na jednotku pokrytí) a mapování míry nezachycení detekce na dopad na integritu. MODELLED; aditivní.

seg-55f8ba5b52ee = <b>Citovaný list parametrů chybového modelu interferometru studených atomů (CAI)</b> (<c1/>). Literárně podložený, ohraničený list parametrů pro inerciální model CAI — vstupy jsou <b>citované, nikoli změřený hardware</b> (žádné tvrzení o TRL / letu); napájí podlahu náhodné procházky rychlosti <c2/>.

seg-cfbff4acc64c = Správa projektu.

seg-982f9ea3eee8 = <c1/> dokumentující rozhodovací model a hranici otevřeného/uzavřeného; řádek komunity/správy v mapě schopností se posouvá <c2/>, aby to odrážel.

seg-c9ff6a7183eb = <b>Ochranná úroveň integrity ARAIM — nominální odchylka (<c1/>) a σ_URA se nyní uplatňují.</b> Ochranná úroveň MHSS nyní odečítá jednostrannou projekci nominální odchylky <c2/> pro každý režim poruchy a používá sigmu <b>integrity</b> σ_URA (odlišnou od sigmy <b>přesnosti</b> σ_URE) přenášenou ve zprávě Integrity Support Message. Díky tomu je ochranná úroveň konzervativnější a správná podle standardů, a proto <b>mění hodnoty PL hlášené stávajícími scénáři integrity</b>. ISM/scénář získává pole <c3/> <c4/> / <c5/>, takže vstupy, které je nechají nenastavená, si zachovávají dřívější chování. Viz <c6/> pro obnovený vzorec <c7/> a poctivou poznámku k implementaci.

seg-c408f8944ac6 = Konzistence χ² monitoru spoofingu.

seg-92e2b5c5458c = <c1/> nyní používá sdílenou cestu inverzního χ² <c2/>, čímž odstraňuje druhou odlišnou implementaci χ², takže RAIM a paritní monitor spoofingu se shodují na svých prazích.

seg-6d424034e500 = <b><c1/> zapojen do dispečera CLI.</b> Scénář byl dříve dosažitelný jen přes API; nyní se spouští jako <c2/> jako každý jiný scénář.

seg-62c3efb54991 = <b>Přesnost dokumentace/počtů.</b> Počty druhů scénářů v README jsou nyní testem <c2/> přišpendleny k <c1/>, takže zdokumentovaný počet se už nemůže rozejít s dispečerem.

seg-5f0f497aa643 = <b>PNT v hlubokém vesmíru a u Marsu — otevřený radiometrický navigační engine + simulace GSE.</b> Nová, plně aditivní osa schopností nad jádrem ověřeným pro Zemi (každý stávající pozemský scénář je <b>bajtově totožný</b> — golden reprodukovatelnosti projdou beze změny bez regenerace). Přidává: vícetělesové dynamické jádro (<c1/> s tesserálním gravitačním polem Marsu GMM-3, tělesově pevnou soustavou Marsu podle IAU, zásuvným rozhraním <c2/>, dvoudílnými juliánskými daty s podmikrosekundovou přesností a TT↔TDB); radiometrické pozorovatelné (iterativní doba světla + Shapirovo zpoždění, dvou-/jedno-/třícestný Doppler a vzdálenost přes dvouramenné řešení Moyer, koherentní otočení transpondéru, regenerativní/PN měření vzdálenosti podle CCSDS { "414" }, Δ-DOR podle CCSDS { "506" }, média solární plazma/tropo/iono); parsování + vydávání CCSDS-TDM ({ "503" }); odmocninový informační filtr s redukovanou dynamikou s empirickými zrychleními RTN, třístavovými palubními hodinami a modelem odporu Marsu; společný estimátor fúze jednocestných + dvoucestných dat; povrch scénářů <c3/> (relay konstelace + LMO/přechod/ povrch) napříč CLI, Python, WASM, MCP a playgroundem; a komplexní simulátor výkonu GSE (geometrie → rozpočet spoje → pozorovatelné → SRIF → kovariance). <b>Úroveň validace — ověřeno simulací:</b> syntetické OD v uzavřené smyčce (Mars-LMO ≈ { "0.2" } m) a analytická vnitřní konzistence, přičemž dynamika Marsu s centrálním Sluncem je nezávisle křížově ověřena proti JPL <b>DE440</b> (<c4/>, podmíněno kernelem: { "137" } m při 1denním oblouku, poctivé nemodelované reziduum n těles). Hlášené přesnosti v hlubokém vesmíru jsou <b>simulační / kovarianční ukazatele kvality</b>, nikoli výsledky skutečné mise; validace na skutečných sledovacích datech DSN/ESTRACK zůstává v plánu. ANISE (MPL-2.0, edition-2024) je omezeno na crate pro křížovou kontrolu vyloučený z workspace, takže licenční brána <c5/> a úloha MSRV-1.75 zůstávají nedotčeny.

seg-2ab34100a2d7 = <b>Pozemní stopy přesné podle agentur ze skutečné orientace Země IERS.</b> Scénář <c1/> přijímá volitelné pole <c2/> — vložené tělo skutečného souboru IERS <c3/> — a redukuje pozemní stopu přes UT1−UTC a polární pohyb pro každou epochu interpolované z něj (tentýž <c4/>, který používá <c5/>), čímž přepíše nominální skaláry <c6/>/<c7/>/<c8/>. Data cestují ve scénáři, takže běh zůstává reprodukovatelný a nepotřebuje souborový systém (funguje v playgroundu WASM). Příznak <c9/> zapracuje skutečný soubor do scénáře z CLI. Uzavírá asymetrii, kdy skutečná data orientace Země spotřebovával jen <c10/>.

seg-e778245e7d8f = <b>Konzistence soustavy pro rychlost změny vzdálenosti.</b> Pozemní stanice se nyní do inerciální soustavy převádí přesnou inverzí redukce družice (<c1/>, vracející polární pohyb <em>i</em> hvězdnou rotaci) místo rotace GMST slepé vůči polárnímu pohybu, takže oba koncové body sdílejí jednu soustavu. Vliv na hlášený Doppler je pod validační podlahou, ale odstraňuje skutečnou nesrovnalost soustav a nadsazené tvrzení „přesné“ ve zdroji.

seg-3b912d8a819d = <b><c1/> se kontroluje.</b> Nulová nebo nekonečná/nečíselná frekvence nosné nyní vrací chybu, místo aby tiše dávala nulový Doppler (λ = c/nosná se tím stávalo nekonečným), v souladu se stávající stráží <c2/>.

seg-7d70317ca717 = <b>Validace silového modelu proložením efemeridy, křížově ověřená proti skutečným produktům agentur.</b> Nový dávkový estimátor nejmenších čtverců (<c1/>) s variační maticí přechodu stavu a editací odlehlých hodnot, řízený úplným silovým modelem (<c2/>: geopotenciál EGM2008, třetí tělesa, slapy pevné + oceánské + atmosférické a empirická zrychlení CPR/2-per-rev), napájený skutečným parserem orientace Země IERS <c3/>. Ověřeno proti publikovaným referenčním drahám: <b>Galileo MEO na { "13" } cm po proložení</b>, ESA <b>Swarm-A LEO</b> a <b>LRO lunární</b> (selenocentrická, gravitace GRAIL, tělesová soustava IAU-2015 — redukovaná dynamika { "6.6" } m, poctivě nad cílem { "5" } m na otevřené cestě; cesta třídy DE ANISE/DE440, která jej dosahuje, je crate vyloučený z workspace).

seg-bf88a3eb4733 = <b>Scénář <c1/></b> — integrovaný vícevrstvý detektor spoofingu kombinující paritu RAIM v každé epoše, monitory AGC a kvality signálu (SQM) a sloučené rozhodnutí, ověřený proti publikovaným parametrům scénářů <b>TEXBAT</b> (Humphreys et al., ION GNSS { "2012" }), včetně těžkého případu zarovnaného nosnou.

seg-976036ba124b = <b>Scénář <c1/> — stav, soustavy, pozemní stopa a Doppler.</b> Propaguje jednu družici (TLE→SGP4 nebo analytická dráha) a v každém kroku vydává inerciální stav TEME a GCRS (<b>polohu <em>i</em> rychlost</b>), zemsky pevnou polohu ITRF/ECEF, podsatelitní <b>pozemní stopu</b> WGS-84 (zeměpisná šířka / délka / výška) a topocentrický azimut / elevaci / vzdálenost s rychlostí změny vzdálenosti a <b>Dopplerem</b> z pozemní stanice. Dosažitelný z CLI, Pythonu, WASM a serveru MCP a dodávaný jako <b>předvolba „Ground track“</b> ve webovém playgroundu, kde se stopa kreslí <b>přes skutečnou mapu světa</b> (pobřežní čáry Natural Earth { "1" }:110m, vestavěné — bez sítě a externí závislosti).

seg-761c95f2ede5 = <b>Export CCSDS OEM</b> (<c1/> / <c2/>) — Orbit Ephemeris Message nesoucí rychlost, kterou spotřebovává GMAT / Orekit / STK, na úrovni stávajících exportérů SP3 a OMM.

seg-111b0896fdd4 = <b>Slapy Země pevné, oceánské (FES2004) a atmosférické (Ray { "2001" } S2)</b> na geopotenciálu (IERS Conventions Ch. { "6" }), zapojené do silového modelu.

seg-7e392131261a = <b>Wheely ARM64</b> — sestavení PyPI nyní vytváří i wheely Linux aarch64 (manylinux_2_28), macOS arm64 a Windows arm64.

seg-7cc04ea3362b = <b>Rozšířená technická zpráva (preprint)</b> odkazovaná z README a článek JOSS uzpůsobený k podání (ORCID autora, při každé změně kompilován do PDF v CI).

seg-3b1e95acc728 = <b>Soustavy ověřeny na milimetr proti publikovaným vektorům Vallado.</b> Redukce TEME→PEF/ITRF, úplný řetězec CIO IAU 2006/2000A GCRS→ITRS a převod ECEF→geodetické WGS-84 jsou nyní přišpendleny k řešenému příkladu ve Vallado et al. (AIAA 2006-6753) s jeho IERS EOP, nejen k vnitřní konzistenci.

seg-fd9818877a6c = <b>Nezávislé křížové kontroly časových stupnic.</b> ERA a stupnice UTC/TAI/TT se shodují s <c1/> na < { "1" } µs a planetární efemerida DE440 se shoduje s JPL Horizons (geocentrické polohy Měsíce/Slunce), obojí jako vždy zapnuté brány CI.

seg-75aeec4cd6d0 = Webový playground skrývá záložku ukazatelů kvality, když výsledek nenese žádné řádky ukazatelů kvality, takže balíčky jen s grafem (efemerida, RAIM, spoofing) se otevřou na svém grafu — u efemeridy na pozemní stopě — místo prázdné tabulky.

seg-b8ab0cc3ce7f = Řízené posuvníky playgroundu <b>a průchod parametrem nyní fungují pro scénář efemeridy / pozemní stopy</b>: jeho parametry (zeměpisná šířka / délka stanice, časový krok, doba trvání, UT1−UTC) jsou laditelné a průchod může vykreslit geometrii přeletu (maximální elevace, špičkový Doppler, výška, rychlost) proti kterémukoli z nich — např. maximální elevace vs. zeměpisná šířka stanice. Záložka Sweep se nyní zobrazuje, jen když je scénář skutečně průchozí, takže žádný balíček nenabízí ovládací prvek, který nic nevykresluje.

seg-9e7a37e51940 = Zdokumentována aproximace SGP4 <c1/> v místě volání GMST (chyba rotace ≤ ~{ "13" }″, hluboko uvnitř vlastní chyby modelu SGP4) a obnoveno <c2/>.

seg-174a75e840b0 = Zásuvný modul JetBrains <b>Kshana — PNT simulator</b> je nyní publikován a schválen na <a1>JetBrains Marketplace</a1>. README, <c1/> a distribuční dokumenty na něj odkazují přímo.

seg-4deaf7918fff = <b>Publikace do registru MCP</b> nyní uspěje: <c2/> v <c1/> překračoval limit registru 100 znaků (HTTP { "422" }). Zkráceno a název serveru (i štítek vlastnictví image) sjednocen s kanonickým jmenným prostorem <c3/>.

seg-1408961042a1 = <b>Publikace do JetBrains Marketplace</b> nyní uspěje: CI znovu nahrálo stejnou verzi zásuvného modulu, která byla zařazena ručně, což Marketplace odmítá. Verze zásuvného modulu je navýšena na <c1/> a stráž idempotence nyní také bere odpověď „already contains version“ jako úspěšné no-op.

seg-74e8cab2f10e = <b>Cache-busting pro <c1/></b>: řetězce dotazu s verzí u <c2/>/<c3/> sledují vydání, takže se vracejícím se návštěvníkům vždy načte aktuální sestavení.

seg-65949229eed7 = <b><c1/> — Kshana jako server Model Context Protocol (MCP)</b> (<c2/>). Samostatný crate mimo workspace (SDK <c3/> je edice { "2024" }), který zpřístupňuje ověřený engine agentům a asistentům s umělou inteligencí — Cursor, JetBrains AI Assistant / Junie a libovolnému klientu MCP — přes stdio. Nástroje: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, každý je tenký obal nad <c9/>.

seg-bd792f66363c = <b>Zásuvný modul pro JetBrains IDE</b> (<c1/>). Klikněte pravým tlačítkem na soubor scénáře <c2/> → <b>Run Kshana Scenario</b>; ukazatele kvality a výsledné JSON se průběžně zobrazují v okně nástroje Kshana. Čistě platformní zásuvný modul v Kotlinu, kompatibilní s každým JetBrains IDE { "2024.3" }+.

seg-755358390517 = <b>Veřejná distribuce a automatické publikování s každým vydáním</b> pro oba:

seg-14fc2fd73553 = <c1/> na <b>crates.io</b> (<c2/>) přes <c3/>.

seg-2b39bbfc0581 = <c1/> jako víceplatformní <b>obraz OCI</b> na <c2/> (<c3/>) přes nový <c4/>.

seg-c824d1532eb6 = <c1/> do <b>oficiálního registru MCP</b> přes GitHub OIDC (bez tajných klíčů); záznam v registru (<c2/>) používá typ balíčku OCI s vlastníkem ověřeným štítkem.

seg-f90da0c61aac = zásuvný modul pro IDE na <b>JetBrains Marketplace</b> přes <c1/> (řízeno tokenem, volitelné podpisování vývojáře) při každém značení vydání.

seg-21d7457dad23 = <b>Nezávislá křížová validace referenčních soustav proti ANISE/SPICE</b> (<c1/>). Samostatný crate mimo workspace křížově kontroluje redukci IAU 2006/2000A CIO v <c2/> (<c3/>, GCRS→ITRS) proti <b>ANISE</b> (čistě rustová reimplementace NAIF/SPICE), která otáčí GCRF→ITRF93 podle <c4/> z JPL, přičemž <b>obě strany dostávají stejné parametry orientace Země IERS <c5/></b>, a to přes osm čtvrtletních epoch { "2020" }–{ "2023" }. Obě nezávislé realizace soustavy se shodují s <b>maximálním relativním natočením { "0.028" }″ — ≤ { "0.86" } m na zemi, ≤ { "0.93" } m na LEO, ≤ { "3.6" } m na oběžné dráze GNSS</b>, čímž s velkou rezervou splňují dlouhodobou kontrolu soustav z ROADMAP „< { "10" } m“ (doplňuje stávající bitově přesné kotvy SOFA/ERFA, nenahrazuje je). Crate je izolovaný, protože <c6/> + <c7/> jsou pod licencí MPL-2.0 / edice 2024 a nikdy nesmějí vstoupit do publikovaného grafu závislostí <c8/>, jeho <c9/>, licenční brány <c10/> ani sestavení MSRV; ANISE je připnuto s <c11/>. Obsahuje binárku <c12/> (stáhne přibližně { "5" } MB BPC, vypíše tabulku, zapíše <c13/>), testovací bránu, která se sama přeskočí bez jádra či sítě, a volitelnou úlohu CI jen pro <c14/> (nikdy neblokuje <c15/>). Zdokumentováno v <c16/> (řádek CIO) a v <c17/>.

seg-eb45b43dacc2 = <b>Hřiště přívětivé k mobilům.</b> Opraven horizontální přetok <c1/> hřiště na telefonech (položka mřížky CSS s výchozím <c2/> se vykreslovala přibližně o { "100" } px šířeji než okno) pomocí <c3/> a ovládacích prvků s hlídanou šířkou; ověřeno bez problémů při { "360" } / { "390" } / { "414" } / { "768" } px. Zarovnána akční tlačítka „Pin to compare“ / „Download report“ (stejné rámečky okrajů v řádku flex). Zvětšena tlačítka spuštění, posuvníky, výběry a odkazy navigace na minimum cílové plochy dotyku přibližně { "44" } px podle WCAG { "2.5.5" } / Apple HIG na telefonech a dotykových zařízeních; velikosti na počítači beze změny.

seg-fe5095d5e61f = <b>Zpevnění odolnosti po průchodu nepřátelským zátěžovým testem.</b> ({ "1" }) <c1/> nyní odmítá nekonečné či nečíselné hodnoty elevace/azimutu/rozptylu a záporné nebo nekonečné diagonály kovariance (téměř singulární geometrie zvětšená malým σ dříve mohla projít branou absolutního pivotu a vrátit NaN VPL / absurdní HPL jako <em>platné</em> <c2/> — tiché selhání integrity). ({ "2" }) Numerický propagátor (<c3/>/<c4/>) při nekonečném počátečním stavu selže bezpečně, místo aby adaptivní regulátor donekonečna neotáčel naprázdno. ({ "3" }) Pomocná funkce buňky DEM už nepanikaří na mřížce s jediným vzorkem ({ "1" }×N). ({ "4" }) Azimut <c5/> se drží přísně v <c6/>. ({ "5" }) <c7/> odmítá nefyzikální (NaN / nekladné) <c8/>/poloměr.

seg-9ca339d8977a = <b>Binárka <c1/> + artefakt vydání</b>: generátor bez závislostí, který vytváří jednostránkový HTML souhrn validace připravený k tisku a indexuje v něm každou validaci vynucovanou v CI (SGP4 666/666, EGM2008, bitově přesné soustavy, NIST Allan, datové listy IMU, ARAIM/SBAS, reprodukovatelnost na 3 OS, pokrytí) k jejímu testu a vnějšímu orákulu. Pracovní postup vydání vygeneruje <c2/> a připojí jej (spolu s původem SLSA) ke každému označenému vydání.

seg-bd231d07658f = <b>Pytest pro spolupráci s numpy + zpevnění wheelu</b>: <c1/> (běží v CI) a připnutý kontejner manylinux plus krok ověření <c2/> v sestavení wheelu.

seg-5427cae6fc39 = <b>Tutoriály a vzdělávání</b>: <c1/> (tři vypracované tutoriály, anotované scénáře pro jednotlivé domény, cvičení úrovní 1/2/3) s <c2/>, který připíná každé uvedené číslo k živému výstupu enginu.

seg-2fad9124c5a6 = <b>Artefakty pro externí podání</b> (<c1/>, <c2/>, <c3/>): koncept článku pro JOSS, notebook kvantové vs. klasické varianty a hotové balíčky k podání pro awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC a také <c4/> — příprava externích kroků podání.

seg-0f88f8bccbc1 = <b>Navigace alt-PNT podle terénu a kombinovaná</b> (modul <c1/>): navigátor TERCOM/SITAN pro porovnávání terénu nad DEM (načítač <c2/> + generátor syntetických vzorků) a kombinovaný navigátor bez GPS na bázi gravitace + magnetického pole (IGRF) + terénu, zpřístupněný jako druhy scénářů <c3/> a <c4/>. Ověřeno konvergencí porovnávání terénu (známý vložený posun byl obnoven) a omezenou chybou kombinovaného filtru v okně bez GPS.

seg-bd01ec72fa2a = <b>Geometrie LunaNet LANS</b> (<c1/>): pojmenovaná místa na povrchu Měsíce (Apollo 11/15/16, okraj Shackletonu) s autoritativními selenografickými souřadnicemi, úhly pohledu z povrchu (az/el/vzdálenost), viditelnost/pokrytí a DOP místa; ověřeno proti poloměru Měsíce, zveřejněným souřadnicím míst a identitě radiálně nadhlavové elevace { "90" }°.

seg-2dad9cf59ea9 = <b>Řízené hřiště v prohlížeči</b>: posuvníky řízeného režimu, výstupní panel s kartami, úvodní prohlídka při prvním spuštění, režimy průchodu parametrů a překrytí více běhů, 3D pohled na oběžnou dráhu na bázi canvas/SVG bez závislostí (balíček dráhy nyní vydává doplňkové <c1/>), režim vložení/iframe a stažení jako zpráva HTML — každé s unit testy v node v CI.

seg-261604603d67 = <b>Model chyb IMU ověřený podle datových listů</b> (<c1/>): ARW/VRW/nestabilita biasu u ADIS16465/16488/16460 obnovené ze syntetizované Allanovy odchylky a ověřené podle specifikací výrobce (identifikace NIST SP1065 / IEEE { "952" }).

seg-dc7b9bdb3076 = <b>Validace odhadovačů Allanovy odchylky podle NIST SP1065</b> (<c1/>): čtyři odhadovače reprodukují zveřejněné referenční odchylky z 1000 bodů a meze spolehlivosti z Tabulky 32.

seg-5d50be22aacd = <b>Ochranné úrovně SBAS / DO-229E, bezionosférická kombinace L1/L5 a mapa souladu s DO-316</b> (modul <c1/>). <c2/> sestavuje vážené matice geometrie z elevace/azimutu každé družice a rozpočtu chyb UDRE/GIVE/letecké/tropo, invertuje normálovou matici (sdílená <c3/>) a promítá rozptyly do HPL/VPL pomocí K-faktorů DO-229E (PA 6,0/5,33, NPA { "6.18" }). <c4/> přidává bezionosférickou pseudovzdálenost GPS L1/L5 (IS-GPS-705, <c5/>), ověřenou tak, že ruší nezávislé ionosférické zpoždění prvního řádu v enginu. <c6/> vztahuje požadavky DO-316/DO-229E k implementujícím funkcím. Ověřeno proti uzavřeným definicím K-faktorů, referenční geometrii numpy <c7/> a identitě kovariance dvěma cestami; křížová kontrola shody zveřejněných PL s RTKLIB/gLAB je zdokumentována jako čekající na posouzení v <c8/>.

seg-e9e60b40e42a = <b>Plná tesserální sférická harmonická gravitace — pole EGM2008 do stupně/řádu { "70" }.</b> Nový <c1/> vyhodnocuje geopotenciál a jeho zrychlení v soustavě pevné se Zemí z plně normalizovaných koeficientů <c2/> pomocí stabilní normalizované Legendreovy rekurence Holmese a Featherstonea (denormalizace by při tomto stupni přetekla). Dodávané koeficienty jsou produktem NGA EGM2008 (volné dílo, přes ICGEM), součástí <c3/> a bitově přesně reprodukované pomocí <c4/> z commitnutého <c5/>; libovolný model ICGEM <c6/> lze načíst přes <c7/>. Ověřeno proti třem nezávislým orákulům: kolaps na hmotný bod (jen <c8/> = <c9/>), čistě zonální pole reprodukující stávající <c10/> na přibližně { "1e-9" } a analytické zrychlení shodné s konečnědiferenčním gradientem přímo sečteného potenciálu na <{ "1e-6" }.

seg-c33a2dbf851d = <b>Obecně relativistické zrychlení Lense–Thirring (strhávání rámců)</b> (<c1/>, IERS { "2010" } rov. { "10.12" }), gravitomagnetický člen nad rámec stávající Schwarzschildovy korekce, zapojený do numerického propagátoru novým příznakem <c2/>. Ověřeno jako lineární v momentu hybnosti Země a o { "1" }–{ "2" } řády pod Schwarzschildovým členem, tedy v režimu měření LAGEOS / Gravity Probe B.

seg-909562023109 = <b>Trait <c1/> sjednocující analytický a numerický propagátor oběžné dráhy.</b> Numerický propagátor Cowellova modelu sil je nyní plnohodnotným protějškem SGP4: nový typ <c2/> (počáteční stav + <c3/> + <c4/> + volba <c5/> s dvojnásobením kroku nebo Dormand–Prince) a <c6/> oba implementují <c7/>, jehož <c8/> vrací inerciální stav TEME v jednotkách SI (m, m/s), takže jsou za <c9/> zaměnitelné. Implementace SGP4 je přesný převod km/min→SI vlastní metody (ověřený testem rovnosti); numerická implementace splňuje přes trait stejnou submetrovou bránu přesné Keplerovy dráhy, oba adaptivní ovladače se shodují a <c10/> zprostředkuje základní kód SGP4.

seg-d094880df57b = Toto vydání uzavírá největší mezeru v korektnosti enginu: redukce orientace Země a referenčních soustav je nyní provedena na úrovni referenční implementace (ověřeno <b>bitově přesně proti ERFA/SOFA</b>), zásobník integrity získává <b>dvoukonstelační ARAIM</b> na skutečných TLE GPS+Galileo a vrstvy propagace, kvantových senzorů, lunární/cislunární a geomagnetická se všechny prohlubují — vedle typovaného API pro Python, bohatšího hřiště v prohlížeči a matice reprodukovatelnosti na třech OS. Hlavní body:

seg-bfe1d4a7cabd = <b>Referenční soustavy, bitově přesně.</b> Plná nutace IAU 2000A a 2000B, precese IAU { "2006" }, redukce IAU 2006/2000A GCRS↔ITRS založená na CIO (X, Y, s), polární pohyb IERS a výstupní soustavy TEME→GCRS/ITRS — každé ověřeno bitově přesně proti referenčním rutinám ERFA/SOFA.

seg-bb5705347a24 = <b>Dvoukonstelační ARAIM</b> (GPS + Galileo) na skutečných TLE, s HPL/VPL, výstupem Stanfordova diagramu a otevřeným <c1/>.

seg-2865dadcd4c8 = <b>Cislunární PNT</b>: propagátor CR3BP Země–Měsíc, soustavy MCI↔MCMF, selenografické souřadnice a spustitelný scénář lunární integrity LunaNet.

seg-3b636707a158 = <b>Kvantové snímání</b>: Coriolisovy a AC-Starkovy systematické vlivy pro interferometr se studenými atomy, průchod driftu a ověření proti rozpočtu Freiera ({ "2016" }).

seg-10bc94801a6a = Geomagnetický model hlavního pole <b>IGRF-14</b>, samostatný a ověřený.

seg-6485f627d793 = <b>Typované API pro Python</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, typové stuby) se sestavením wheelu v CI a také plnohodnotný výstup propagátoru v GCRS/ITRS a export CCSDS OMM.

seg-2b7693641333 = <b>Důvěryhodnost a reprodukovatelnost</b>: přímé srovnání přesnosti SGP4 s nezávislým crate <c1/>, brána pokrytí v CI (přibližně { "97" } % řádků v <c2/>) a matice reprodukovatelnosti na třech OS (<c3/>/<c4/>/<c5/>).

seg-32e53ac66056 = <b>Každý graf v hřišti nyní odpovídá motivu webu.</b> Všech dvanáct generátorů grafů SVG — graf výsledku/holdoveru (<c1/> + <c2/>), graf Allanovy odchylky (<c3/>) a každý graf scénáře (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + dostupnost, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — používalo chladné námořnické panely (<c15/>), chladně šedé osy/texty a rušivou červenou/modrou/fialovou paletu řad. Nyní všude používají teplou grafitovou paletu: panely <c16/>, teplou mřížku <c17/>, popisky <c18/> a jednotné přiřazení řad: kvantové = medově zlatá (<c19/>), klasické = teplá jantarová (<c20/>), specifikace/mez = <c21/>. Pohledy kódované z hlediska bezpečnosti si zachovávají svůj význam: Stanfordův diagram RAIM zůstává zelený (dostupné) / jantarový (zavádějící) / červený (nebezpečné) / tlumená ocelová (nedostupné) a HPL/VPL se čtou jako zlatá/bronzová.

seg-2bb31dfc7756 = <b>Grafy jsou nyní po uložení/stažení samopopisné.</b> Oba grafy vkládají svůj název do SVG (název grafu Allanovy odchylky + podtitul „lower is better“ byl dříve jen v HTML kolem obrázku, takže uložený obrázek neměl popisek) a oba nesou patičku s původem — <c1/> — takže stažený graf obstojí sám o sobě a zůstává reprodukovatelný.

seg-9f528e334cd8 = <b>Každý graf nyní nese patičku s původem.</b> Patička — <c1/> — se vkládá centrálně pro všechny druhy scénářů v <c2/> (dříve byla jen na grafech holdoveru a Allanovy odchylky), takže každý uložený či stažený obrázek — z hřiště, z exportu <c3/> v CLI nebo ze scorecardu HTML — identifikuje svou verzi, otisk scénáře a zdroj. Hash je pro přehlednost označen <c4/> a pochází z <c5/> výsledku, kde je přítomen, s náhradou hashem zdroje u zpráv o integritě/lunárních. Co je otisk a proč tam je, je zdokumentováno v sekci „Output“ souboru README a v <a1><c6/></a1>.

seg-635697ed3fb1 = <b><c1/> a vzorkovač šumu RAIM Stanford jsou nyní bez paniky při mimorozsahových / nekonečných vstupech</b> (nález fuzzingu závislý na pořadí <c2/> z nových scénářů ARAIM). <c3/> nyní hlídá <c4/>/<c5/> jako <c6/> (vrací hraniční hodnotu místo paniky <c7/>) a <c8/> šumu Stanford pro dostupnost omezuje σ na striktně kladné, takže zásobník integrity/ARAIM nikdy nepanikaří na zmutovaných či chybně nastavených scénářích.

seg-b36a0c42845e = <b>Matice CI pro reprodukovatelnost napříč platformami.</b> Nová úloha <c1/> spouští testy reprodukovatelnosti na <b>ubuntu-latest, macos-latest a windows-latest</b> při každém pushi. Protože úplné výsledné JSON není napříč OS bajtově shodné (rozdíl libm v poslední ULP), přesně se tvrdí projekce neměnná vůči platformě — otisk vstupu plus tvar výstupu, připnuté pro každý scénář jako zlaté hodnoty SHA-256 v <c2/> novým <c3/> — spolu s numerickými piny (<c4/>, na { "1e-6" }), stavy SGP4 (<c5/>, na { "2e-5" } km) a determinismem v rámci procesu (<c6/>). Dohromady to dokazuje reprodukovatelnost napříč platformami na třech OS bez křehkosti přesného bajtového hashování celého výstupu. <c7/> toto rozdělení dokumentuje.

seg-9b8c0a407387 = <b>Brána pokrytí kódu v CI.</b> Nová úloha <c1/> spouští <c2/> s enginem na bázi zdrojů LLVM, publikuje zprávu lcov jako artefakt sestavení a vynucuje spodní mez pokrytí řádků na <c3/> (generované datové tabulky, vstupní bod CLI, testy a webové zdroje jsou vyloučeny). Naměřené pokrytí řádků je přibližně { "97" } % na <c4/> (SGP4 a moduly hodin ≥{ "95" } %); brána je nastavena na { "85" } % — nad cílem ≥{ "80" } % a s odstupem od naměřené hodnoty, takže zachytí regrese, aniž by kolísala. V README je zveřejněn odznak pokrytí.

seg-1dfc4beb239a = <b>SGP4/SDP4 přímo proti nezávislému crate <c1/>.</b> Nový test (<c2/>) křížově ověřuje propagátor Kshana proti nejpoužívanější knihovně SGP4 v Rustu (neuromorphicsystems/sgp4, přidáno jako závislost jen pro testy) na stejných { "666" } vektorech AIAA 2006-6753. Při obou řízených gravitačním modelem WGS72, který vektory používají, se obě nezávislé implementace shodují <b>pod mikrometr</b> na drahách blízko Země a rezonančních a <b>na { "4.12" } mm v nejhorším případě</b> napříč všemi režimy; obě reprodukují referenční tabulku <c3/>. Commitnutá srovnávací tabulka (<c4/>, regenerovaná přes <c5/>) rozepisuje výsledek podle režimů (LEO/MEO, hluboký vesmír, rezonance ½denní a 1denní) a poznamenává čtyři záměrně patologické případy, které crate při konstrukci odmítá. Živá tvrzení drží obě implementace do { "2e-5" } km od reference a vzájemně se shodují do { "4e-5" } km — ochrana proti regresím, ne jednorázový výsledek. Jde o konkurenční pedigree: správnost proti nezávislé kódové základně, nejen proti statické tabulce. (Výchozí <c6/> crate používá WGS84, a proto se od reference WGS72 liší přibližně o km — upřímně uvedeno v textu u tabulky.)

seg-dc75162ecd64 = <b>Export CCSDS OMM je nyní dostupný od začátku do konce.</b> Zapisovač OMM (<c1/>) dříve neměl cestu přes CLI/API; střední prvky scénáře <c2/> lze nyní publikovat jako katalog CCSDS 502.0-B-2 OMM — jedna zpráva OMM KVN na družici definovanou v TLE — přes <c3/>, nebo <c4/> ve scénáři automaticky zapíše <c5/> (zrcadlí stávající <c6/>). Každá zpráva nese <b>skutečné</b> katalogové číslo NORAD družice, mezinárodní označení COSPAR (<c7/>) a epochu (tvar dne v roce CCSDS), které nová funkce <c8/> načte z řádku { "1" } TLE; řádek s názvem se stane <c9/> (jinak <c10/>). <c11/> je epocha scénáře, nikoli hodinový čas, takže je výstup reprodukovatelný. Nové API: <c12/> / <c13/>, <c14/>, <c15/>. Syntetický scénář Walker nebo RINEX (bez středních prvků TLE) skončí chybou, místo aby vydal prázdný soubor. Ověřeno proti přibalenému snímku 30 družic <c16/> (<c17/>).

seg-036782a2b65e = <b>Interaktivní zobrazení hodnot při najetí na grafy hřiště.</b> Pohyb kurzoru nad grafem přichytí zaměřovací kříž k nejbližšímu vzorku a zobrazí bublinu s hodnotou (<c1/>, zapojeno v <c2/>). Na grafu Allanovy odchylky čte τ a σ_y(τ) každých hodin; na časových řadách scénářů (holdover hodin, dead-reckoning, přenos času, hybridní PNT, GNSS/INS) čte čas a hodnotu každé sady v jednotkách grafu (ns / m / ps / využití), načtené z výsledku, takže údaj odpovídá křivce. Specializované diagramy (RAIM, spoof, průchod) překrytí nemají. Grafy zůstávají samopopisnými obrázky <c3/> z blobu — překrytí je průhledný zaměřovací kříž + bublina nad nimi, takže stažení/porovnání/export zůstávají nedotčeny. Výpočty souřadnic (nejbližší vzorek, kurzor→podíl grafu, parsování lomené čáry) jsou testovány unit testy (<c4/>, běží v CI).

seg-1588ae024e5d = <b>Režim porovnání A/B v hřišti.</b> Připněte libovolný běh jako základ A, spusťte druhý scénář a oba se zobrazí vedle sebe s tabulkou rozdílů ukazatelů kvality (holdover, RMS/p95 časování, dostupnost), která u každé metriky zvýrazní vítěze (<c1/>, zapojeno v <c2/>; logika rozdílů je testována unit testy v <c3/>, běží v CI). Všechny hodnoty se vkládají jako text a všechny grafy přes blob <c4/>, takže se nic z řetězce scénáře nikdy nevkládá jako značkování.

seg-6e7a99f8f275 = <b>Tlačítka stažení grafu (SVG + PNG).</b> Každý graf v hřišti má nyní lištu „Download SVG / PNG“ ladící s motivem (<c1/>, zapojeno v <c2/>). SVG vrací věrný škálovatelný originál; PNG vykreslí stejný samopopisný obraz ve 2× pro prezentace a dokumenty. Soubory se pojmenují s údaji o původu — <c3/> — a logika názvu/velikosti je testována unit testy (<c4/>, běží v CI).

seg-4cb87e7dc892 = <b>Geomagnetický model hlavního pole IGRF-14 (<c1/>).</b> Standardní sférické harmonické pole IAGA (stupeň/řád { "13" }, epocha { "2025.0" } + sekulární variace { "2025" }–{ "2030" }; koeficienty strojově generované z oficiálního <c2/> pomocí <c3/> do <c4/>, bitově přesně reprodukovatelné). Syntéza se Schmidtovou normalizací vrací vektor pole (sever/východ/dolů) a odvozené prvky (deklinace, inklinace, horizontální/celková intenzita) na libovolném geodetickém místě/datu, plus geomagnetický pól a sílu dipólu — magnetický protějšek porovnávače gravitačních map pro alternativní navigaci PNT. Ověřeno samostatně: syntéza odpovídá přesnému uzavřenému tvaru nakloněného dipólu, plné analytické pole stupně 13 odpovídá konečné diferenci skalárního potenciálu, osa dipólu reprodukuje známý geomagnetický pól (přibližně { "80.7" }°N, −{ "72.7" }°E) a sílu přibližně { "29.7" } µT a globální pole je fyzikální.

seg-c69d50031da4 = <b>Typované vazby pro Python (<c1/>).</b> Kromě funkcí <c2/>/<c3/> s řetězcem na vstupu a výstupu modul nyní zpřístupňuje typovanou třídu <c4/> (<c5/>, <c6/>, <c7/> a přístupový prvek <c8/>, který vrací výsledek zpracovaný do nativního slovníku Pythonu — bez opětovného parsování JSON, lze obalit NumPy), plus <c9/>, <c10/> (zpracovaný seznam slovníků s metadaty) a <c11/> (seznam chybových zpráv, který nevyvolává výjimku). Dodává typový stub PEP { "561" } (<c12/> + <c13/>) pro mypy/pyright/editory a rychlý start <c14/>. Stávající funkce jsou beze změny.

seg-fb65ac14344c = <b>Plnohodnotné výstupní soustavy pro propagátory (<c1/> výčet <c2/> + <c3/> + <c4/>).</b> Každý <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) nyní může vydat svou polohu v TEME, <b>GCRS</b> (≈ J2000) nebo <b>ITRS</b> (pevná se Zemí) — TEME nativně, GCRS přes ověřenou redukci TEME→GCRS, ITRS zřetězením té do rotace IAU 2006/2000A CIO <c6/> — a svůj úplný stav GCRS (poloha + rychlost) přes <c7/>. Setrvačný výstup k datu už není jen TEME.

seg-8f596733c439 = <b>Redukce IAU 2006/2000A z nebeské do pozemské soustavy založená na CIO (<c1/>).</b> Moderní řetězec GCRS↔CIRS↔ITRS bez ekvinokcia: souřadnice CIP <c2/> odečtené z matice biasu-precese-nutace IAU 2006/2000A (s využitím ověřené precese FW + nutace 2000A s úpravou P03 <c3/>), 66členná řada lokátoru CIO <c4/> (<c5/>, strojově generovaná z reference ERFA pomocí <c6/> do <c7/>, bitově přesně reprodukovatelná), matice GCRS→CIRS (<c8/>), úhel rotace Země (<c9/>) a plná rotace GCRS→ITRS (<c10/>, složená se stávajícím polárním pohybem IERS). Ověřeno <b>bitově přesně</b> proti zveřejněnému <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 při JD_TT { "2453736.5" }) a testovacím vektorům <c12/> a <c13/>. Řetězec CIO a starší redukce TEME s ekvinokciem/GMST-1982 se shodují až na zdokumentovaný rozdíl konvence hvězdného času ≈{ "2" }·(rovnice ekvinokcií). Toto je důsledná redukce, kterou cesta přes ekvinokcium/GMST jen aproximovala.

seg-32e6d8dfcebc = <b>Plná řada nutace IAU 2000A (<c1/> <c2/>, <c3/>).</b> Úplný model MHB2000 — { "678" } luni-solárních + { "687" } planetárních členů — s přesností < { "0.1" } mas, vedle stávajícího zkráceného modelu 2000B o 77 členech. Tabulky jsou strojově generované z reference IAU SOFA / ERFA <c4/> pomocí <c5/> do <c6/> (generátor reprodukuje commitnutý soubor bitově přesně) a celá řada — obě sady fundamentálních argumentů IERS-2003 a MHB2000 i planetární délky — je ověřena <b>bitově přesně</b> proti zveřejněnému testovacímu vektoru <c7/> (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } při JD_TT { "2453736.5" }, na { "1e-13" } rad). Výchozí redukce TEME→GCRS ponechává řadu 2000B (~{ "1" } mas, pod zjednodušením rotace rychlostní soustavy v řetězci); <c8/> zpřístupňuje matici k datu s < { "0.1" } mas pro volající, kteří ji potřebují.

seg-35e9e419d2ae = <b>Spustitelný scénář lunární integrity (<c1/>, <c2/>).</b> Zapojuje průchod ochrannou úrovní u lunárního jižního pólu (<c3/> <c4/> → <c5/>) do spouštěče scénářů s JSON <c6/> a grafem SVG HPL v čase, takže případ cislunární integrity je dostupný přímo z CLI. Upřímně ukazuje mezeru: při { "30" } m σ_URE u LANS přesahuje HPL u jižního pólu (≈ { "260" }–{ "450" } m) mezní hodnotu výstrahy { "50" } m ({ "0" } % dostupnosti) — integrita lunárního PNT zatím není splněna.

seg-1910e8110b43 = <b>Dostupnost dvoukonstelačního ARAIM na skutečných TLE GPS+Galileo a zapojení do spouštěče scénářů (<c1/>, <c2/>, <c3/>).</b> Přidává <c4/> (pokročilý engine ARAIM — poruchy jednotlivé družice <em>i</em> celé konstelace — spuštěný nad časovou mřížkou) a <c5/> a zapojuje jej do spouštěče <c6/> příznakem <c7/>, takže studie ARAIM s více GNSS je dostupná přímo z TOML. Test se skutečnými daty (<c8/>) na přibalených snímcích Celestrak GPS+Galileo z 2026-06-07 ukazuje, že přidání Galilea zvedá dostupnost ARAIM z { "0.21" } na { "0.67" } při náročném VAL { "12" } m ({ "10.5" }→{ "21.8" } družic v dohledu), zatímco režim odolný vůči poruchám konstelace je se dvěma konstelacemi zásadně omezený — kvantitativní důvod, proč robustní dvoukonstelační integrita směřuje ke třetí konstelaci nebo k SBAS. Upřímný zbytek: číselně přesná reprodukce tabulky A-3 z EU ARAIM TN proti jedné epoše zamčené na verzi a záznam fixture v Zenodu.

seg-78ab887a4543 = <b>Kruhový omezený problém tří těles (CR3BP) pro systém Země–Měsíc (<c1/>).</b> Nové jádro cislunární dynamiky, které propagátory dvou těles/SGP4 poskytnout nemohou: pohybové rovnice v rotující soustavě (<c2/>), propagátor RK4 (<c3/>), integrál Jacobiho konstanty (<c4/>) a pět Lagrangeových bodů (<c5/>). Ověřeno proti uzavřeným / zveřejněným kotvám: kolineární body Země–Měsíc (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), přesné rovnostranné L4/L5 = (½−μ, ±√3/2, { "0" }), všech pět potvrzených jako rovnovážné body pole, Jacobiho konstanta zachovaná na přesnost integrátoru při propagaci a mimorovinná zpětná síla, která umožňuje dráhy halo/NRHO. Toto je základ pro znázornění skutečné NRHO. Upřímný zbytek: diferenciálně korigované periodické počáteční podmínky NRHO { "9" }:{ "2" }, excentrický/efemeridový (DE) model a denormalizovaná transformace do selenocentrických soustav v <c6/>.

seg-14f4572144f3 = <b>Polární pohyb IERS a redukce TEME→ITRF (<c1/>).</b> Přidává <c2/> (SOFA <c3/>: <c4/> s lokátorem TIO <c5/>), <c6/> / <c7/> a <c8/> — rotaci TEME→PEF založenou na GMST s následným polárním pohybem — čímž doplňuje polohu pevnou se Zemí přesnou v ITRF nad rámec <c9/> jen s GMST (polární pohyb je na oběžném poloměru efekt v řádu desítek metrů). <c10/>/<c11/> jsou pozorované veličiny IERS, které dodává volající. Upřímný zbytek: plně CIO řetězec (X, Y, s) a numerická křížová kontrola ANISE/SPICE <{ "10" } m zůstávají jako navazující práce.

seg-b5e84faf880c = <b>Systematické vlivy interferometru se studenými atomy, průchod driftu a ověření proti publikovanému zařízení (<c1/>, <c2/>).</b> Rozšiřuje akcelerometr CAI z prvních principů o dva hlavní deterministické systematické vlivy: fázi <b>Coriolis/rotace</b> <c3/> (<c4/>, s ekvivalentním biasem zrychlení <c5/> přes <c6/>) a fázi <b>světelného posuvu AC-Stark</b> <c7/> (<c8/>, která se pro konstantní posuv ruší symetrií π/2–π–π/2). Přidává <c9/> (drift polohy při dead-reckoningu v závislosti na době cyklu — jádro srovnání kvantového a klasického přístupu) a validační test proti mobilnímu gravimetru Freiera et al. { "2016" } (arXiv:{ "1512.05660" }): modelovaná mez kvantového projekčního šumu leží pod publikovaným krátkodobým šumem { "96" } nm/s²/√Hz a v odstupu přibližně { "2" } řádů od něj. <c10/> aktualizováno. Upřímný zbytek: systematické vlivy vlnoplochy/zaměření svazku, řešení nejednoznačnosti proužků, přesná reprodukce letových zkoušek CARIOQA-PMP / Boeing-AOSense (vyžaduje publikované PSD platforem) a předvolba v JS hřišti.

seg-f32829ed9cf1 = <b>Redukce cislunární soustavy a průchod integrity u lunárního jižního pólu (<c1/>).</b> Rozšiřuje lunární engine ARAIM o rotaci MCI↔MCMF (inerciální soustava se středem v Měsíci ↔ soustava pevná s Měsícem) (<c2/> / <c3/>, zjednodušený model střední rotace při lunární hvězdné rychlosti), selenografickou šířku/délku/výšku (<c4/> / <c5/>) a <c6/> — přistálý přijímač v oblasti Artemis proti reprezentativní sadě relé LunaNet během průchodu { "24" } h, což upřímně vyčíslí mezeru v integritě: při nominálním σ_URE u LANS { "30" } m je ochranná úroveň konečná, ale přesahuje mezní hodnotu výstrahy { "50" } m pro operace na povrchu. Upřímný zbytek: přesné efemeridy LANS NRHO (cislunární dráha 3 těles), fyzikální librace / precesující lunární pól (DE421/SPICE) a scénář LunaNet v TOML zůstávají jako navazující práce.

seg-5ef720855cc4 = <b>Zpráva o podpoře integrity ARAIM, SVG Stanfordova diagramu a otevřená reference ARAIM (<c1/>, <c2/>).</b> Přidává explicitní <c3/> (σ_URA / σ_URE / b_nom / P_sat / P_const, s referenčními hodnotami WG-C pro GPS+Galileo a převodníky <c4/> / <c5/> do enginů s jednou poruchou <c6/> a s poruchou celé konstelace <c7/>), samostatný vykreslovač <c8/> Stanfordova diagramu integrity (čtyři zóny, hranice <c9/>, vodicí linky mezní hodnoty výstrahy, jedna barevně kódovaná značka na epochu) a <c10/>, který dokumentuje algoritmus, ISM, hypotézy poruch, smlouvu ochranné úrovně a přínos dvou konstelací. Testy dokládají zisk geometrie/redundance (přidání druhé konstelace zpřísňuje HPL při jedné poruše) a toleranci poruchy konstelace (uživatel se dvěma konstelacemi přežije ztrátu celé konstelace; uživatel s jednou nikoli). Upřímný zbytek: číselná reprodukce tabulky A-3 z EU ARAIM TN / hodnoty dostupnosti { "15" }–{ "25" } % proti snímku skutečných TLE zamčenému na verzi, záznam fixture v Zenodu a zapojení <c11/> do spouštěče souborů scénářů.

seg-3607eb34acd9 = <b>Nutace IAU 2000B a úplná inerciální redukce TEME→GCRS/J2000 (<c1/>).</b> Přidává druhý a třetí díl skutečné redukce inerciální soustavy nad dodávanou precesí IAU { "2006" }: 77členná luni-solární řada nutace MHB2000 (<c2/>, standardní zkrácení IAU 2000B s přesností ~{ "1" } mas) s Delaunayovými fundamentálními argumenty a maticí nutace SOFA <c3/> a řetězec Vallado AIAA-2006-6980 TEME→TOD (rovnice ekvinokcií) → TOD→MOD (nutace) → MOD→GCRS (bias-precese) zpřístupněný jako <c4/> / <c5/>. Řada, argumenty a konstanty jednotek jsou přepsány z reference IAU SOFA / ERFA <c6/> a ověřeny <b>bitově přesně</b> proti zveřejněnému testovacímu vektoru <c7/> (Δψ, Δε na { "1e-13" } rad). Upřímný zbytek: úplná řada IAU 2000A o 678 členech (<{ "0.1" } mas), numerická křížová kontrola ANISE/SPICE <{ "10" } m a polární pohyb zůstávají jako navazující práce (viz <c8/>).

seg-d9b5e459f6eb = Toto vydání přináší první <b>neanalytický propagátor oběžné dráhy</b> v Kshana — Cowellův integrátor s hierarchickým modelem sil se šesti poruchami (dvě tělesa + zonální J2–J6 + třetí těleso Slunce/Měsíc řízené epochou + tlak slunečního záření s kuželovým stínem umbra/penumbra + atmosférický odpor + postnewtonovská Schwarzschildova relativistická korekce) poháněný volbou ze dvou adaptivních integrátorů (RK4 s dvojnásobením kroku a vložená dvojice Dormand–Prince RK5({ "4" })) — vedle vrstvy manévrů / návrhu trajektorie (impulzní a konečné zážehy, Izzoův řešič Lambertovy úlohy a průchod porkchop), vrstvy alt-PNT s porovnáváním gravitačních map, která obnoví 60minutovou dráhu bez GPS na méně než { "500" } m, dávkového + sekvenčního řetězce určování oběžné dráhy a plného 17stavového těsně vázaného UKF GNSS/INS s dead-reckoningem kvantového CAI. Každá numerická schopnost je připnuta k analytické pravdě nebo ručně odvozenému uzavřenému tvaru; poruchy vypnuté ve výchozím stavu nechávají vydané zlaté hodnoty nedotčené.

seg-aa8d478f5c10 = <b>Postnewtonovská (Schwarzschildova) relativistická korekce (<c1/> + <c2/>).</b> Přidává dominantní obecně relativistickou poruchu na oběžné dráze blízko Země — hlavní příčinu relativistického postupu perigea — ve tvaru IERS / Montenbruck–Gill <c3/> <c4/>. Stejně jako atmosférický odpor je <b>závislá na rychlosti</b>, takže jede na pravé straně integrátoru <c5/> přes [<c6/>], je volitelná a ve výchozím stavu vypnutá. Ověřeno samostatně: na kruhové dráze se zhroutí na uzavřený tvar <c7/> (čistě radiální a <b>směřující ven</b>, mimoosé složky přesně nulové); její <b>poměr ke dvěma tělesům je učebnicové <c8/> na LEO</b> (podpis <c9/>); případ radiální rychlosti odpovídá ručně zjednodušenému <c10/>; a v propagátoru <b>poruší dráhu, aniž by ji disipovala</b> — hlavní poloosa se zachovává na výrazně méně než metr za den, strukturální opak monotónního úbytku způsobeného odporem. Protože je ve výchozím stavu vypnutá, zlaté hodnoty dvou těles/J2/zonálních členů zůstávají nedotčeny. Ladění parametrů PPN (<c11/>,<c12/>) a člen strhávání rámců Lense–Thirring zůstávají jako navazující práce.

seg-043e831224ab = <b>Model kuželového stínu umbra+penumbra (<c1/>), nyní používaný tlakem slunečního záření.</b> Povyšuje binární zatmění válcovou umbrou na hladký činitel <c2/>: Slunce a Země jsou modelovány jako kotouče zdánlivých úhlových poloměrů <c3/>, <c4/> se zdánlivou vzdáleností středů <c5/> a <c6/> je jedna minus podíl slunečního kotouče zakrytý kotoučem Země (plocha překryvu kruh–kruh); plné slunce pro <c7/>, úplná umbra pro <c8/>, prstencové zatmění pro <c9/> a mezi tím spojitá penumbra. <c10/> jej nyní používá, takže síla SRP v zatmění plynule slábne, místo aby se zapínala/vypínala. Přidává nominální <c11/> podle IAU. Ověřeno samostatně: <c12/> na plném slunci a <c13/> hluboko v umbře (přesně), <b>hladká monotónní penumbra</b> (<c14/> roste z { "0" } → ~½ při <c15/> → { "1" } napříč pásmem <c16/>) a kuželová penumbra <b>přesahuje válec umbry</b> (bod, který binární válec považuje za plně osvětlený, je pro kužel <c17/>). Jednodušší <c18/> zůstává k dispozici; sluneční okrajové ztemnění a stín zploštělé Země zůstávají jako navazující práce.

seg-8d1c16019f3c = <b>Vložený integrátor Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Přidává standardní vloženou dvojici Dormand–Prince ({ "1980" }) s Butcherovou tabulkou vedle stávajícího ovladače RK4 s dvojnásobením kroku: sedm stupňů FSAL poskytuje řešení 5. řádu a odhad chyby 4. řádu z jedné sady vyhodnocení ({ "7" } oproti { "11" } voláním funkce na krok), levnější odhad lokální chyby. Adaptivní ovladač používá stejnou normu RMS chyby a regulátor kroku <c4/>, takže jde o náhradu bez úprav; <c5/> jej zpřístupňuje v modelu sil dráhy. Ověřeno samostatně: odhad vložené chyby je <b>O(h⁵)</b> (půlení kroku jej snižuje ~{ "32" }×); DP5({ "4" }) integruje <c6/> na <c7/> a harmonický oscilátor přes { "50" } period se zachováním energie na <{ "1e-6" }; dosáhne stejného koncového bodu při stejné toleranci s <b>menším počtem vyhodnocení funkce</b> než dvojnásobení kroku (bez ztráty přesnosti); a <c8/> splňuje stejnou bránu analytické pravdy jako cesta RK4 — <b>pod metr oproti přesnému řešení Keplera v univerzálních proměnných na oběžné dráze LEO za { "24" } h</b> — zatímco oba ovladače se shodují na <{ "1" } m na dráze J2..J6 (bez uzavřeného tvaru). Vyšší vložené dvojice (RKF7({ "8" }) / DOP853) zůstávají jako navazující práce.

seg-cca3c00757d6 = <b>Atmosférický odpor zapojený do propagátoru jako jeho první síla závislá na rychlosti (<c1/> + <c2/> + <c3/>).</b> Přidává <b>atmosféru po částech exponenciální podle Vallada, tabulka 8-4</b> <c4/> ({ "28" } pásem od hladiny moře po { "1000" } km, pod povrchem omezeno) a kvadratický odpor <c5/> vůči <b>spoluotáčející se atmosféře</b> <c6/> (<c7/>). Protože odpor závisí na rychlosti, <c8/> získává nové <c9/> a pravá strana integrátoru nyní předává rychlost (<c10/>); funkce <c11/> jen s polohou je beze změny, takže konzervativní členy a zlaté hodnoty zůstávají nedotčeny. Ověřeno samostatně: hustota se <b>kotví na hodnotě { "1.225" } kg/m³ u hladiny moře</b>, pod povrchem je omezená, <b>monotónně klesá</b> přes LEO, ve { "400" } km leží v pásmu slunečního průměru ~{ "1e-12" } kg/m³ a její <b>obnovená lokální výšková stupnice (≈ { "58" } km ve { "400" } km)</b> je fyzikální; odpor <b>působí proti spoluotáčející se relativní rychlosti</b> o velikosti ~{ "2e-6" } m/s² typické pro LEO při <c12/>; a — klíčový podpis — odpor je <b>disipativní</b>: dráha { "300" } km ztrácí měrnou energii <b>monotónně</b> a její hlavní poloosa <b>klesá o omezených ~km/den</b>, zatímco vakuový základ zachovává energii na <{ "1e-9" }. Termosférická hustota NRLMSISE-00 (ustanovení o hustotě odporu < { "5" } %) zůstává jako navazující práce.

seg-0d20f02ef85f = <b>Tlak slunečního záření zapojený podle epochy do modelu sil propagátoru (<c1/> + <c2/>).</b> Přidává <b>model SRP s dělovou koulí</b> <c3/> s <b>činitelem zatmění podle válcového stínu</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): tlak záření <c5/> z moderní celkové sluneční ozářenosti { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), pokles toku s převrácenou hodnotou čtverce vzdálenosti <c6/> a radiální tlak <b>směrem od Slunce</b>. Jede na <b>stejné pravé straně řízené epochou</b> jako třetí těleso, přičemž vzorkuje Slunce <c7/> jednou v postoupivší epoše <c8/>, sdílené mezi třetím tělesem Slunce a SRP. Skládatelné: <c9/>. Ověřeno samostatně proti ručně odvozeným podpisům: <b>tlak záření na 1 AU se kotví na učebnicové ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; SRP plně osvětlené družice na LEO je <b>bitově shodné</b> se vzorcem dělové koule, míří <b>pryč od Slunce</b> a leží v <b>pásmu ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> pro cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>zdvojnásobení vzdálenosti Slunce zmenší velikost na čtvrtinu</b> (převrácená hodnota čtverce); <b>válcový stín zatmívá jen válec umbry</b> (protisluneční <em>a</em> v rámci jednoho poloměru Země od spojnice Země–Slunce) a dává <b>přesně nulové</b> SRP v zatmění; a v propagátoru SRP <b>porušuje dráhu LEO o malou omezenou hodnotu, která roste přibližně lineárně s A/m</b> — zatímco model bez poruch zůstává bitově přesně nezávislý na čase a zlaté hodnoty dvou těles/J2/zonálních členů zůstávají nedotčeny. Kuželová umbra/penumbra (hladké ν ∈ [{ "0,1" }]), atmosférický odpor a externí křížová validace s GMAT/Orekit zůstávají jako navazující práce.

seg-d3f819c21660 = <b>Třetí těleso Slunce/Měsíc řízené epochou zapojené do časově proměnné pravé strany propagátoru (<c1/> / <c2/>).</b> Porucha třetím tělesem už není samostatný člen síly — Cowellův propagátor ji nyní integruje jako skutečně <em>časově proměnnou</em> sílu: každé vyhodnocení pravé strany vzorkuje polohy Slunce/Měsíce <c3/> v <b>postoupivší epoše <c4/></b> (s využitím <c5/> pro převod den↔století), takže rušitelé se během integrace pohybují po svých drahách a nezůstávají zmrazeni na začátku. Skládatelné s libovolným gravitačním modelem (<c6/>). Ověřeno samostatně: člen Slunce na pravé straně je <b>bitově shodný</b> s <c7/> vyhodnoceným v poloze z efemerid pro daný okamžik při <c8/> i <c9/> (což přesně dokládá zapojení { "86400" } s ↔ { "1" } den ↔ 1/36525 století), rušitel <b>postoupí o ~{ "2.6" }·10⁹ m/den</b> mezi vzorky (není zmrazen), <b>okamžité slapové velikosti na LEO</b> zasahují učebnicová pásma ~{ "5" }·{ "10" }⁻⁷ m/s² (Slunce) a ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Měsíc, ≈ { "2" }× Slunce), každé těleso <b>měřitelně poruší celodenní trajektorii a zůstává přitom omezené</b> a stejný počáteční stav propagovaný v <b>epochách vzdálených čtvrt roku dává jinou trajektorii</b> (slapová osa se otočí o { "90" }°) — zatímco model bez obou těles je bitově přesně nezávislý na čase a zlaté hodnoty dvou těles/J2/zonálních členů zůstávají nedotčeny. Přesnost efemerid na úrovni DE a externí křížová validace s GMAT/Orekit zůstávají jako navazující práce.

seg-0a517f6c4b1b = <b>Efemeridy Měsíce s nízkou přesností (<c1/>), které doplňují dvojici třetích těles Slunce/Měsíc.</b> Přidává řadu lunární polohy s nízkou přesností podle Montenbrucka & Gilla (<c2/>) vedle modelu Slunce, takže obecná funkce <c3/> může být poháněna kterýmkoli svítidlem <b>bez externího jádra DE/SPK</b>. Ověřeno samostatně proti ručně odvozeným lunárním podpisům: geocentrická vzdálenost zůstává uvnitř skutečné <b>obálky perigea/apogea (~{ "356 500" }–{ "406 700" } km)</b> po celý měsíc a její <b>měsíční průměr obnoví hlavní poloosu ~{ "384 400" } km</b>; <b>ekliptikální šířka nikdy nepřekročí sklon lunární dráhy ~{ "5.3" }°</b> (ověřeno promítnutím na pól ekliptiky v rovníkových souřadnicích, což ověřuje řadu šířky a rotaci sklonu ekliptiky společně); <b>směr Měsíce se po jednom siderickém měsíci ({ "27.3217" } d) vrátí do { "1" }°</b> a jeho <b>denní pohyb zůstává ve fyzikálním pásmu { "12" }–{ "15" }°/den</b>; a lunární porucha třetím tělesem na družici LEO má <b>učebnicovou velikost ~{ "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ dvojnásobek Slunce). Přesnost polohy na úrovni DE, atmosférický odpor a SRP zůstávají jako navazující práce.

seg-8b7025e00dd1 = <b>Gravitace třetího tělesa (Slunce) s vestavěnými efemeridami s nízkou přesností (<c1/>, <c2/>).</b> Přidává do modelu sil poruchu třetím tělesem: <c3/> (přímé přitahování minus nepřímý člen, který geocentrická soustava musí odečíst), přičemž polohu Slunce dodává nový modul <c4/> s analytickou řadou s nízkou přesností podle Montenbrucka & Gilla — <b>pro běh s nízkou věrností není potřeba externí jádro DE/SPK</b>. Ověřeno samostatně: zrychlení <b>odpovídá přesnému gradientu vlastního rušivého potenciálu</b> (<c5/>), porucha <b>v geocentru zaniká</b> a má <b>učebnicovou velikost ~{ "5" }·{ "10" }⁻⁷ m/s² na družici LEO</b> a efemeridy Slunce zasahují ručně odvozené kotvy J2000 — <b>vzdálenost v přísluní ≈ { "1.471" }·10¹¹ m</b>, <b>deklinace ≈ −{ "23" }° poblíž prosincového slunovratu</b>, zdánlivý pohyb <b>≈ { "1" }°/den</b> (≈ { "90" }° za čtvrt roku) a vzdálenost, která za celý rok zůstává uvnitř obálky oběžné dráhy Země { "0.983" }–{ "1.017" } AU. Dodává část pro třetí těleso z kroku modelu sil v milníku numerického propagátoru (Měsíc je dodán v souvisejícím záznamu výše); přesnost polohy na úrovni DE, atmosférický odpor a SRP zůstávají jako navazující práce.

seg-99fd6ae1ea09 = <b>Model sil se zonálními harmonickými J2–J6 (<c1/> / <c2/>).</b> Rozšiřuje model sil Cowellova propagátoru za J2 na celé zonální pole Země do stupně { "6" } (standardní publikované nenormalizované <c3/> z EGM-96), zapojené do propagátoru jako <c4/>. Zrychlení je <b>přesný analytický gradient</b> zonálního rušivého potenciálu <c5/> (Legendreovy polynomy vzestupnou rekurencí), ověřený třemi nezávislými způsoby: <b>redukuje se na <c6/> ověřené 666 vektory s přesností stroje</b>, je-li omezeno na <c7/>; <b>odpovídá numerickému gradientu vlastního potenciálu</b> přes celé pole J2..J6 (zlatý standard kontroly konzervativního pole); a liché členy <c8/> oproti sudým <c9/>/<c10/> vykazují svou <b>charakteristickou (anti)symetrii sever–jih</b> při <c11/> — asymetrii tvaru hrušky. Propagovaná dráha J2..J6 zachovává celkovou energii (kinetická + centrální + zonální potenciál) na ~{ "1e-8" } za den a poruší dráhu jen s J2 o malou nenulovou hodnotu. Tím je dodán krok 2 („zonální harmonické J2–J6“) milníku numerického propagátoru; pole tesserální EGM vysokého stupně, odpor, SRP, třetí těleso a externí křížová validace s GMAT/Orekit zůstávají jako navazující práce.

seg-59f0ba5a6269 = <b>Numerický (Cowellův) propagátor oběžné dráhy (<c1/>).</b> První <b>neanalytický</b> propagátor v Kshana (zbytek zásobníku drah je analytický SGP4/SDP4): zapojuje model sil dvou těles + J2 (<c2/>) do adaptivního ovladače RK4 s dvojnásobením kroku (<c3/>) jako <c4/> s přepínačem <c5/>. Ověřeno proti <b>analytické pravdě, která je silnější než numerický křížový nástroj</b>: neporušená dráha reprodukuje <b>přesné řešení Keplera v univerzálních proměnných pod metr na 24hodinové dráze LEO</b> (přísnější brána než „oproti numerické referenci < { "10" } m“, jak milník formuluje), měrná energie a moment hybnosti se zachovávají na ~{ "1e-9" } relativně a nodální regrese J2 reprodukuje uzavřené <c6/> podle teorie prvního řádu (do { "2" } %, zbytek O(J2²)). Přidává také <c7/>, Newtonův řešič Keplerovy rovnice, který <b>vrací <c8/> místo tiše chybné odpovědi</b>, když nezkonverguje v omezeném rozpočtu iterací (případ <c9/> poblíž perigea). Upřímný rozsah: model sil je jen dvě tělesa + J2 — tesserální pole EGM vysokého stupně ({ "200" }×{ "200" } + načítač), odpor (NRLMSISE-00), SRP, síly třetího tělesa a externí křížová validace s GMAT/Orekit zůstávají jako navazující práce.

seg-d4c7c29f09d1 = <b>60minutové porovnávání gravitačních map bez GPS na < { "500" } m (<c1/>).</b> Prohlubuje vrstvu alt-PNT k validačnímu cíli ESA NAVISP <em>Quantum Wayfarer</em>: vozidlo letí po dráze ~{ "700" } km při celohodinovém výpadku GNSS — jeho inerciální řešení se rozjíždí na <b>≈ { "70" } km</b> — a gravimetr se studenými atomy spolu s <b>hierarchickým hrubo-jemným</b> částicovým/mřížkovým porovnávačem obnoví konstantní drift INS na <b>≈ { "145" } m</b> (< { "500" } m), tedy > { "480" }× snížení. Skutečný práh bílého šumu gravimetru se vkládá jako <b>deterministická sekvence ze seedu</b>, takže porovnávač nikdy nedostane pravdu bez šumu, a přesto je běh přesně reprodukovatelný (ověřeno jako bitově shodný a stabilní na několik metrů napříč realizacemi šumu). Test na úrovni regrese ukazuje, že zjemnění je <em>nezbytné</em> — jedna hrubá mřížka uvízne na ~{ "2" } km, teprve třístupňové zjemnění prolomí bariéru { "500" } m. Nový commitnutý scénář <c2/>. Řádek <c3/> zůstává upřímně <b>částečný</b> (stále není přibalená mapa EGM2008) s důkazy aktualizovanými na výsledek 60 min < { "500" } m. Upřímný rozsah beze změny: nízkostupňové sférické harmonické pole + syntetické mascony; Monte Carlo přes realizace chyby reprezentace mapy je navazující práce.

seg-4262a99328bb = <b>Registr nadsazených tvrzení + ochrana proti regresi (<c1/>, <c2/>).</b> Uzavírá cestu poctivosti/odstraňování nadsazení: čtrnáct nadsazených tvrzení, která dřívější audit katalogizoval (<c3/>…<c4/>), je nyní všech GREEN — silná tvrzení (<c5/> spřažený Kalman hodin + polohy, <c6/> rušení J/S→C/N₀→ztráta vazby, <c7/> fyzika CAI Mach–Zehnder, <c8/> ARAIM HPL/VPL) jsou <b>nahrazena dodanými, testovanými schopnostmi</b> místo změkčeného znění a zbývající řádky jsou zbaveny nadsazení tak, aby odpovídaly kódu. Nový test CI prochází živé veřejné povrchy (<c9/>, <c10/>, <c11/>, <c12/>) a selže, pokud se jakákoli vyřazená holá nadsazená formulace znovu objeví bez výhrady, takže řádek GREEN se nemůže tiše zhoršit. „Integrita“ jako ukazatel kvality u každého běhu zůstává upřímně označena jako <em>sebekonzistence filtru</em> (ne letecká integrita); skutečné ARAIM HPL/VPL je uváděno zvlášť, aby se obojí nikdy nezaměňovalo.

seg-27da62a7ff63 = <b>Navigace porovnáváním gravitačních map (alt-PNT bez GPS).</b> Nový <c1/> přidává vrstvu schopností alt-PNT, kterou vyžadují studie porovnávání gravitačních map ESA NAVISP <em>Quantum Wayfarer</em> / QT-CCI: <b>model měření gravimetru</b> se studenými atomy, jehož práh bílého šumu je odvozen z ASD akcelerometru CAI (<c2/>); nízkostupňové plně normalizované <b>sférické harmonické pole gravitačních anomálií</b> (ověřené proti uzavřeným Legendreovým funkcím <c3/>, <c4/>, <c5/> a ručně odvozené jednočlenné anomálii { "1.897" } mGal) plus syntetické <b>mascony</b> pro vysokostupňové místní rysy; a <b>částicový filtr pro porovnávání gravitačních map</b> (skládá <c6/> + <c7/>), který obnoví dráhu bez GPS z posloupnosti anomálií, jimiž letí. Commitnutý benchmark NAVISP (<c8/>) snižuje volný inerciální drift ~{ "73" } km na několik km. Upřímný rozsah: Kshana <b>nepřibaluje</b> úplnou sadu koeficientů EGM2008 { "2190" }° — pole je nízkostupňové + mascony, nikoli skutečná mapa s vysokým rozlišením; načítač EGM/EIGEN, magnetická mapa, SLAM podporovaný terénem a zapojení <c9/> do enginu scénářů s SVG grafem driftu zůstávají jako navazující práce. <c10/> „Gravity-map / alt-PNT navigation“ → <b>částečné</b>.

seg-d028a2db7837 = <b>Modelování manévrů a základ návrhu trajektorií.</b> Nový <c1/> přidává první vrstvu návrhu trajektorií nad SGP4: impulzní uzly ΔV, které aplikují nespojitost rychlosti a posouvají kovarianci { "6" }×{ "6" } dopředu (deterministický zážeh ⇒ jednotková matice přechodu stavu; kovariance chyby provedení se otáčí ze soustavy zážehu — ECI nebo LVLH — do bloku rychlosti), integraci konečného zážehu (konstantní tah po oblouku zážehu s hmotností jako stavem), jejíž dosažené ΔV se kontroluje proti uzavřené <b>Ciolkovského</b> raketové rovnici s přesností lepší než { "0.01" } %, <b>Lambertův</b> řešič <b>Izzo-2015</b> pro jednu otáčku (<c2/>, <c3/>, doba letu ⇒ <c4/>, <c5/>), přesný <b>Keplerův propagátor</b> v univerzálních proměnných (pravda pro dvě tělesa) a průchod <b>porkchop</b>, který mapuje mřížku epocha startu × epocha příletu na odletové C3 a příletové V∞ a vydává je jako 2D pole JSON pro vykreslení vrstevnic v prohlížeči. Validace je samostatná a silnější než výstup z tutoriálu: každý výstup Lambertova řešiče se vrací oklikou přes Keplerův propagátor (musí dopadnout zpět na <c6/>) a minimum porkchopu se kontroluje proti analytické dolní mezi C3 Hohmannova přechodu pro dvě koplanární kruhové dráhy. Kshana to staví jako vrstvu simulace výkonu nad GMAT/Orekit, nikoli jako jejich náhradu (větve s více otáčkami a skutečné planetární efemeridy zůstávají mimo rozsah). Deset testů.

seg-cbdd0e56d89f = <b>Plný 17stavový těsně vázaný UKF GNSS/INS s dead-reckoningem kvantového CAI.</b> Nový <c1/> nese úplný stav inerciální navigace, který těsně vázaný filtr odhaduje — <c2/> ({ "17" } stavů) — propagovaný strapdown mechanizací poháněnou měrnou silou a úhlovou rychlostí, s rotací tělesa→inerciální soustava <c3/> pro malé úhly, takže chyba orientace se vazbou promítá do horizontálního zrychlení (standardní naklopená vazba INS). Při výpadku GNSS jede jen na IMU; procesní šum náhodné procházky rychlosti je odvozené <c4/> akcelerometru s interferometrem se studenými atomy (<c5/>), takže drift při dead-reckoningu je omezený kvantovým senzorem — 120sekundový výpadek zůstane omezen na několik set metrů oproti kilometrům, jichž by dosáhlo volné INS navigační třídy. Aktualizace pseudovzdálenosti/rychlosti změny vzdálenosti běží přes sdílený unscented filtr (s α = { "1" } pro dobře podmíněné váhy při této velikosti stavu). Pět testů: identita modelu měření, integrace konstantní rychlosti s dokonalou IMU, podpora GNSS, odhad biasu akcelerometru a benchmark 120s výpadku omezeného CAI.

seg-087521bb32b7 = <b>Poctivé zarámování kvantového určování polohy.</b> Hlavní označení je nyní <b>„simulátor odolnosti PNT s modely výkonu kvantových senzorů“</b> důsledně v hesle README, citačním řádku, <c1/> (název + abstrakt) a grafice banneru — místo volnější marketingové formulace „hybridní kvantový/klasický simulátor PNT“. Sekce README <em>Co to je / není</em> získává explicitní prohlášení o rozsahu <b>„Zatím to není“</b> (není to fyzikální engine atomové interferometrie z prvních principů, není to přijímač GNSS/řešič PVT, není to nástroj pro návrh misí) a nový nadřazený <c2/> zařazuje <b>vrstvu kvantové fyziky jako položku P2</b> (fáze CAI Mach–Zehnder, projekční šum, tenzor vibrací), aby čtenáři věděli, že fyzika z prvních principů je vymezená a připravovaná, nikoli opuštěná. Beze změny chování ani API.

seg-f8fa36190ec7 = Obchodní studie návrhu konstelace: průchod návrhy Walker s Paretovou frontou, JSON s dobou opětovného přeletu a submetrové ověření vzorce Walker.

seg-31518e92d8cf = <c1/> získává <c2/>, který spouští mřížku <c3/> (např. studii { "3" }×{ "3" }) při pevném sklonu a pro každý návrh vyčísluje podíl pokrytí, nejhorší PDOP a maximální/střední mezeru opětovného přeletu; <c4/> označuje nedominované návrhy (méně družic, větší pokrytí, nižší PDOP, kratší opětovný přelet) a <c5/> serializuje buňky a Paretovu frontu — včetně polí s dobou opětovného přeletu — do JSON. Nové ověření připíná generátor ke vzorci Walker <c6/>: družice na stejné pozici v sousedních rovinách se zobrazují jedna na druhou přesnou rotací <c7/> s odchylkou <b>pod { "1" } km po celých { "24" } h</b> propagace SGP4 (krátkoperiodické „dýchání“ J2 je souhlasné a ruší se) a pozice v rovině jsou potvrzeny jako rozmístěné <c8/> ve střední hodnotě. Vychází z commitnutého skutečného snímku Celestrak <c9/> z 2021-07-28 (<c10/>, využívaného testy pokrytí scénářů a zpětného průchodu SP3).

seg-71d257587c28 = <b>Pokročilý přenos času a frekvence: TWSTFT, společný pohled GNSS, PPP, optický, proložení mocninného PSD podle IEEE-1139 a ensemble hodin.</b> Nový <c1/> staví operační metody přenosu na dodávaných uzavřených tvarech Sagnac/společný pohled a nástrojích stability Allanovy odchylky. <c2/> dává korekci Sagnac pro oboustranný družicový přenos času a frekvence (TWSTFT) jako součet smyčky o třech skocích, přesně rovný uzavřenému tvaru BIPM <c3/> (křížově ověřeno nezávislým <c4/>); <c5/> vydává jednodenní řadu <c6/> a její TDEV. <c7/> jednoduše diferencuje dvě syntetické pozemní stanice, takže se hodiny družice zruší. <c8/> + <c9/> jsou bezionosférická kombinace PPP a řešení hodin přijímače proti (syntetické) pravdě třídy SP3, přičemž se ionosféra prvního řádu ruší přesně. <c10/>, <c11/> a <c12/> s jednotkovou střední hodnotou modelují scintilaci způsobenou turbulencí na optické spojnici ve volném prostoru. <c13/> je úplné proložení křivky Allanova rozptylu metodou nejmenších čtverců s pěti koeficienty <c14/> podle IEEE-1139 (všech pět kanonických šumových procesů najednou) s hlášením dominantního procesu pro každou dekádu τ. <c15/> tvoří papírovou časovou stupnici váženou inverzním rozptylem, jejíž Allanova odchylka klesá striktně pod nejlepší přispívající hodiny. { "31" } unit testů; validačními cíli jsou uzavřené tvary a syntetická pravda — skutečný import BIPM Circular-T / IGS SP3 teprve zbývá.

seg-c3ab93e7324f = Mapy ionosféry IONEX: parser souborů, časová interpolace a mapování šikmé obliquity.

seg-7b94a515ce2b = <c1/> získává <c2/>, který čte formát souboru IONEX (definice mřížky v hlavičce + bloky <c3/>) do posloupnosti <c4/> — normalizuje pořadí šířek v souboru od severu k jihu na <c5/> s kladným krokem a škáluje hodnoty podle <c6/>. <c7/> prolne dvě po sobě jdoucí mapy do dotazované epochy a <c8/> / <c9/> mapují vertikální TEC na šikmý paprsek pomocí činitele jednovrstvé tenké slupky <c10/> (<c11/>). Spolu s dodávaným modelem mřížky z toho vznikne z naměřené globální mapy ionosféry IGS použitelné šikmé zpoždění.

seg-2ed90763cf11 = Návrh konstelace: dimenzování pokrytí „ulicemi“ (streets-of-coverage) + srovnání více konstelací.

seg-326e8957bb10 = <c1/> získává <c2/>, idealizovaný řešič minimálního počtu družic metodou streets-of-coverage — z dodávaného poloúhlu pokrytí <c3/> a poloviční šířky ulice <c4/> dimenzuje téměř polární konstelaci pro nepřetržité jednonásobné globální pokrytí jako <c5/> rovin (např. 4družicová rovina ve výšce GPS potřebuje { "2" } roviny, { "8" } družic) a hlásí <c6/>, když jsou družice příliš řídké na vytvoření souvislé ulice. <c7/> je nástroj pro srovnání více konstelací: ohodnotí každý pojmenovaný návrh Walker na téže stanici/okně přes <c8/> a vrátí jejich pokrytí / PDOP / velikost vedle sebe. Upřímný rozsah: korekce Rider přesná na švu na hranici protiběžných rovin a 3D glóbus pokrytí zůstávají jako navazující práce.

seg-90f5ec9ff4ae = Vícevrstvá detekce spoofingu: paritní detektor konzistence RAIM + fúze vrstev.

seg-a0e4878bea45 = <c1/> získává třetí a poslední detekční vrstvu a fúzní stupeň: <c2/> proloží metodou nejmenších čtverců řešení polohy/hodin redundantní sadou pseudovzdáleností a otestuje zbylý vážený součet čtverců reziduí proti prahu χ²<c3/> — označí zkreslenou <em>podmnožinu</em> družic a <em>souhlasné</em> zkreslení (pohlcené hodinami přijímače) správně ponechá pro RAIM neviditelné, nezakryté. <c4/> kombinuje vrstvy parity, AGC a SQM do jednoho váženého rozhodnutí, které zaznamená, které vrstvy zareagovaly. Monte Carlo charakterizuje detektor: empirické <b>P_fa ≈ { "0.068" }</b> proti návrhovému bodu { "0.05" } a <b>nezachycená událost klesá z { "0.885" } při zkreslení spoofingu 2σ na { "0.16" } při 8σ</b>. Upřímný rozsah: křížová validace proti konkrétním zveřejněným testovacím vektorům spoofingu (Spirent / ION GNSS+) vyžaduje tyto externí datové sady a zůstává jako navazující práce.

seg-2413b3d10f5b = <b>Validační ensemble Kalmanova filtru spřaženého vs. nespřaženého.</b> Monte Carlo o 100 pokusech v <c1/> vyčísluje hodnotu přenášení vzájemné kovariance poloha↔hodiny: věrný vložený nespřažený základ (ověřený bitově přesně proti dodávanému <c2/>) zpracovává stejná data s vynulovanými křížovými bloky a po téměř degenerovaných pseudovzdálenostech plus opravě jen hodin spřažený filtr obnoví polohu s <b>{ "2.97" } m RMS oproti { "48.8" } m u nespřaženého filtru a vyhraje { "97" } ze { "100" } pokusů</b> — oprava hodin zpřesní polohu jen skrze korelaci, kterou nespřažený balík zahazuje. Tím je dokončena sada validace správnosti Kalmanova filtru (Josephův tvar, bezpečnost PSD, konzistence NEES/NIS a nyní ensemble spřaženého filtru).

seg-804f35695553 = <b>Řetězec určování oběžné dráhy (dávkový + sekvenční).</b> Nový <c1/> obnovuje oběžný stav družice <c2/> ze sledování vzdálenosti pozemními stanicemi a skládá tři dodávané části: model sil dvou těles + J2 (<c3/>) a integrátor RK4 (<c4/>) propagují kandidátní stav po oblouku, model měření vzdálenosti předpovídá vzdálenost od každé stanice a dávkový korektor Gauss–Newton (<c5/>) žene kandidáta na nejlépe proložený stav (<c6/>). Stejná dynamika a model vzdálenosti také pohánějí <b>sekvenční</b> rekurzivní určování na dodávaném unscented filtru (<c7/>). Ověřují jej čtyři testy: předpověď vzdálenosti po oblouku; <b>dávkové obnovení na submetr / mm·s⁻¹ z bezšumových vzdáleností</b>; dávkové obnovení na <b>~{ "2" } m s rezidui po proložení na šumovém prahu { "5" } m</b> (podpis konzistentního proložení metodou nejmenších čtverců); a sekvenční obnovení na desítky metrů. Upřímný rozsah: měření rychlosti změny vzdálenosti/Doppler a úhlů, analytická matice přechodu stavu J2 a maskování viditelnosti stanic zůstávají jako navazující práce.

seg-0a81039e510c = <b>Navigátor UKF GNSS/INS těsně vázaný.</b> Nový <c1/> zapojuje dodávané jádro unscented Kalmanova filtru (<c2/>) do funkčního těsně vázaného navigátoru nad osmistavovým <c3/> (poloha/rychlost v ECEF plus bias a drift hodin přijímače v jednotkách vzdálenosti). Přijímá <b>surová měření družic</b> — <c4/> (<c5/>) a <c6/>/Doppler (<c7/>) — místo předem vytvořené polohové opravy, takže <c8/> (s <c9/>/<c10/>/ <c11/>) pokračuje v opravách <b>i s méně než čtyřmi družicemi</b> a výpadky GNSS přejede na své propagované dynamice. Pět testů jej ověřuje od začátku do konce, včetně akceptačních scénářů milníku: geometrie pseudovzdálenosti/Doppleru proti ručním hodnotám; bezšumová konvergence na <b>submetr</b> s pěti družicemi; případ se <b>třemi družicemi</b> konvergující z ~{ "212" } m na ~{ "13" } m, kde snímkové PVT nelze ani sestavit; <b>120sekundový výpadek</b> při konstantní rychlosti v mezích { "50" } m; a — hlavní akceptace — <b>30minutový zakřivený průchod LEO</b> (skutečná dráha dvou těles + J2) s <b>120sekundovým výpadkem GNSS</b>, držený na <b>{ "0.77" } m RMS průchodu</b> a <b>{ "2.9" } m v nejhorším případě během výpadku</b>. Tento orbitální dojezd skládá dodávaný gravitační model sil (<c12/>) a integrátor RK4 (<c13/>) do procesního modelu UKF (<c14/>), takže filtr sleduje zakřivení dráhy — což dojezd konstantní rychlostí nedokáže (samotné zakřivení činí na LEO ~{ "58" } km za { "120" } s). Upřímný rozsah: orbitální dojezd používá model sil dvou těles + J2 místo surové měrné síly z IMU (pro neřízenou orbitální platformu se shodují); přidání chybového stavu strapdown IMU a oprav ionosféry/troposféry ve smyčce zůstává jako navazující práce.

seg-792f25a4a1da = <b>Model měření pro porovnávání map (navigace podle terénu / gravitace).</b> Nový <c1/> dodává model měření, který mění dodávaný částicový filtr se sekvenčním vážením a převzorkováním (<c2/>) na funkční navigátor bez GPS: <c3/> (gaussovská věrohodnost shody pole) a <c4/>, který vzorkuje libovolné georeferencované referenční pole — výšku terénu (TRN) nebo gravitační anomálii — v poloze částice a váží ji podle shody s naměřenou hodnotou vozidla. Polem je libovolný vzorkovač <c5/>, takže se skládá s bilineární mřížkou v <c6/> nebo s uzávěrem. Ukotvují ji dva testy — věrohodnost má vrchol (={ "1" }) při dokonalé shodě a klesá na <c7/> při jedné sigmě a částicový filtr nad výraznou syntetickou plochou terénu obnoví skutečnou polohu na { "0.1" }. Upřímný rozsah: skutečné referenční mapy (výška SRTM, gravitační anomálie EGM/EIGEN) a jejich načítače zůstávají jako navazující práce.

seg-9240e95a5058 = <b>Integrita cislunárního PNT (lunární ARAIM).</b> Nový <c1/> aplikuje pozemský engine ARAIM MHSS na navigační službu typu LunaNet s lunárními parametry (<c2/> oproti { "0.6" } m u GPS, <c3/>): lunární konstanty, selenocentrická báze východ/sever/nahoru a pomocná funkce geometrie oblohy a <c4/> (HPL/VPL). Ukotvují jej tři testy — ortonormální selenocentrická báze, geometrie šikmé vzdálenosti a přesné lineární škálování ochranné úrovně s <c5/> (lunární { "30" } m dává { "50" }× větší ochrannou úroveň než stejná geometrie při { "0.6" } m u GPS — kvantitativní důvod, proč je integrita lunárního PNT obtížná). Upřímný rozsah: přesné efemeridy LANS NRHO, rozpočet chyb signálu v prostoru a redukce soustav MCI↔MCMF zůstávají jako navazující práce.

seg-4a43e2ff83d7 = <b>Dvousložková (vysoce přesná) juliánská data.</b> Nový <c1/> přidává <c2/>, juliánské datum rozdělené na celé <c3/> a zlomkové <c4/> v <c5/> (konvence SOFA/hifitime), s <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Rozdíly blízkých epoch zůstávají přesné až na podlahu <c11/>, kde JD s jedním <c12/> ztrácí ~{ "50" } µs poblíž J2000. Ukotvují jej čtyři testy: zpětný průchod, normalizace zlomku, přesné obnovení mikrosekund (spolu s předvedeným selháním u jednoho <c13/>) a aditivní/vratná aritmetika sekund.

seg-8eef92a85711 = <b>Zapisovač CCSDS OMM (Orbit Mean-Elements Message).</b> Nový <c1/> doplňuje zapisovač efemerid <c2/> o zprávu se středními prvky: <c3/> mapuje střední prvky SGP4/TLE do jednotek OMM (střední pohyb v ot./den, úhly ve stupních, plus <c4/>) a <c5/> serializuje standardizovaný tvar KVN podle CCSDS 502.0-B-2 — takže dráhu Kshana lze zpracovat libovolným nástrojem znalým OMM místo svébytného TLE. Dva testy ukotvují převod jednotek TLE→OMM (≈ { "15.5" } ot./den, sklon { "51.6" }° atd.) a přítomnost požadovaných klíčových slov KVN. Upřímný rozsah: tvar KVN a mapování TLE jsou dodány zde; vykreslení v XML (<c6/>) a zpětný průchod referenčním parserem zůstávají jako navazující práce.

seg-ca2b730b5cc3 = <b>Částicový filtr se sekvenčním vážením a převzorkováním.</b> Nový <c1/> přidává nelineární, negaussovský odhadovač za navigací podporovanou mapou bez GPS (porovnávání podle terénu nebo gravitační mapy): <c2/> (propaguje částice dynamikou + gaussovským procesním šumem), <c3/> (převáží podle věrohodnosti měření pro každou částici), systematické <c4/>, monitor degenerace <c5/> a odhad váženým průměrem. Šest testů přesně ukotvuje deterministické jádro — ESS v rozsahu { "1" }…N, systematické převzorkování volící indexy v poměru k váze, konvexní kombinace váženého průměru, gaussovská věrohodnost přitahující odhad k měření, chování převzorkování k rovnoměrnosti a determinismus predikce se seedem. Upřímný rozsah: engine je dodán zde; referenční mapy (výška SRTM, gravitační anomálie EGM) a model měření mapy zůstávají jako navazující práce (vzorkovač mřížky + bilineární v <c6/> by stejně dobře posloužil gravitační/terénní mapě).

seg-564ad319685e = <b>Mapy ionosféry TEC ve stylu IONEX.</b> Nový <c1/> přidává naměřenou ionosféru jako alternativu k vysílanému modelu Klobuchar: <c2/> (pravidelná mřížka zem. šířka/délka vertikálního TEC, globální mapa ionosféry IGS) s bilineární interpolací v průsečném bodě (<c3/>, mimo mřížku omezeno) a zpožděním prvního řádu <c4/> (<c5/>, <c6/>). Ukotvují jej čtyři testy: <c7/> na L1 se škálováním <c8/>, interpolace přesná v uzlech, bilineární středy průměrující rohy a dotazy mimo mřížku omezené na okraj. Upřímný rozsah: mřížka a interpolace jsou dodány zde; parsování formátu souboru IONEX, časová interpolace mezi mapami a mapovací funkce šikmé dráhy zůstávají jako navazující práce.

seg-26c7b53cbc8c = <b>Geometrické korekce přenosu času (Sagnac + společný pohled GNSS).</b> Nový <c1/> přidává dva deterministické efekty, které musí skutečné srovnání hodin zohlednit, a doplňuje stochastický oboustranný model v <c2/>: <c3/> (<c4/>, zpoždění otáčející se Země — desítky ns pro kontinentální základny) a <c5/>, jednoduchý rozdíl společného pohledu GNSS, který přesně zruší chybu hodin družice a obnoví posun mezi stanicemi. Tři testy je ukotvují na přesných referencích: Sagnac ≈ { "33" } ns pro rovníkovou čtvrtotáčku, antisymetrie a nulové radiální/polární případy a přesné zrušení hodin družice. Upřímný rozsah: úplný rozpočet zpoždění transpondéru/hardwaru TWSTFT a řešení přenosu času PPP bezionosférické zůstávají jako navazující práce.

seg-098e7ea0ee13 = <b>Model sil na oběžné dráze (dvě tělesa + J2).</b> Nový <c1/> přidává model zrychlení, který numerický propagátor integruje: <c2/> (<c3/>), poruchu zploštění <c4/> (uzavřený tvar v ECI) a <c5/>, který je sčítá — spárujte jej s <c6/> jako <c7/>. Zpřístupňuje také analytické J2 <b>sekulární rychlosti</b> (<c8/>): nodální regresi <c9/>, rotaci apsid <c10/> a drift střední anomálie <c11/>. Šest testů ukotvuje fyziku na přesných referencích: <c12/> pro člen dvou těles, uzavřený tvar J2 na rovníku (~{ "10" }⁻³ velikosti dvou těles), <b>kritický sklon</b> ({ "63.4349" }°), který zmrazí perigeum (<c13/>), nodální regresi ISS (<c14/>) a východní drift retrográdní slunečně synchronní dráhy. Upřímný rozsah: jen dvě tělesa + J2; J3–J6, odpor, SRP a třetí těleso zůstávají jako navazující práce.

seg-d5c03ebc5707 = <b>Sdílitelné trvalé odkazy na scénáře.</b> Nový <c1/> přidává kodek Base64 podle RFC { "4648" } bez závislostí (standardní abeceda <c2/> s vyplněním a URL-bezpečná abeceda <c3/> bez vyplnění) a obaly <c4/> / <c5/>, takže TOML z hřiště lze zakódovat do parametru dotazu <c6/> a sdílet jako URL. Zpřístupněno prohlížeči jako vazby wasm <c7/> / <c8/>. Čtyři testy je ukotvují na kanonických vektorech RFC { "4648" } (<c9/> → <c10/> atd.), URL-bezpečném zpětném průchodu scénáře (není třeba escapovat <c11/>/<c12/>/<c13/>), odmítnutí neplatných symbolů a zpětném průchodu všech 256 bajtů. Upřímný rozsah: kodek a vazby jsou dodány zde; UI tlačítka Share v hřišti, vícesériový graf Plotly/D3 a režim porovnání A/B zůstávají jako navazující práce.

seg-b615fb16d547 = <b>Dávkové nejmenší čtverce Gauss–Newton (dávkový diferenciální korektor).</b> Nový <c1/> přidává odhadovací jádro, na kterém spočívá dávkové <em>určování oběžné dráhy</em> (nebo jakékoli proložení parametrů): <c2/> linearizuje uživatelem dodaný model <c3/> pomocí jakobiánu ze centrálních konečných diferencí, sestaví a řeší vážené normální rovnice <c4/> (s využitím testované inverze matice) a iteruje do konvergence s váhami jednotlivých měření. Ukotvují jej čtyři testy: lineární proložení přímky dosahující přesného řešení váženými nejmenšími čtverci, nelineární proložení <c5/> obnovující skutečné parametry, 3D multilaterace vzdáleností, která z bezšumových vzdáleností obnoví známou polohu (varianta určování oběžné dráhy), a odmítnutí nedourčených/nesouhlasných vstupů. Upřímný rozsah: jde o obecný engine korektoru; model měření vzdálenosti/rychlosti změny vzdálenosti/azimutu-elevace specifický pro dráhy, analytická matice přechodu stavu J2 a validace na zveřejněném případu zůstávají jako navazující práce.

seg-0ada87934135 = <b>Monitory spoofingu na vrstvě RF (výkon AGC a SQM).</b> Nový <c1/> přidává dva nezávislé detektory spoofingu v předním konci přijímače, které doplňují monitor časového spoofingu podporovaný hodinami v <c2/>: <b>monitor výkonu AGC</b> (<c3/> nekoherentní součet výkonů + <c4/>), který označí nadbytečný přijatý výkon, jejž vysílač spoofingu přidá nad konfigurovatelnou rezervu v dB, a <b>monitor kvality signálu</b> (<c5/> trojúhelníková autokorelace kódu + <c6/>), který označí nevyváženost korelátorů Early-minus-Late způsobenou vícecestným šířením/meaconingem/přehráním. Čtyři testy ukotvují přesné uzavřené tvary ({ "3.01" } dB pro zdvojnásobení výkonu, agregát <c7/>, trojúhelníkové <c8/> a práh výstrahy Early/Late { "10" } %). Upřímný rozsah: úplný paritní detektor spoofingu s konzistencí RAIM, vícevrstvá fúze výstupů monitorů a validace proti zveřejněným vektorům spoofingu Spirent/ION GNSS+ zůstávají jako navazující práce.

seg-b1ff62d88cd2 = <b>Adaptivní numerický integrátor ODR.</b> Nový <c1/> přidává první část <em>numerického</em> propagátoru (propagace drah v Kshana je jinak analytická SGP4/SDP4): obecný krok Runge–Kutta čtvrtého řádu (<c2/>) nad libovolnou soustavou prvního řádu <c3/> a adaptivní ovladač (<c4/>), který řídí lokální chybu <b>dvojnásobením kroku</b> (Richardsonova extrapolace) se standardním regulátorem kroku <c5/> a logikou přijetí/odmítnutí. Šest testů jej ukotvuje na přesných řešeních: exponenciála <c6/> na <c7/>, snížení chyby ~{ "16" }× při každém půlení kroku, které dokazuje konvergenci čtvrtého řádu, zachování energie/návratu harmonického oscilátoru po celou periodu a adaptivní ovladač splňující úzkou toleranci s proměnnými kroky. Upřímný rozsah: jde o jádro integrátoru a jeho řízení chyby; vložené tabulky Dormand–Prince RK5({ "4" })/RKF7({ "8" }) a hierarchický model sil dráhy (dvě tělesa + J2–J6 + odpor + SRP + třetí těleso), které z něj činí <c8/>, zůstávají jako navazující práce.

seg-ca53c62839d8 = <b>Unscented (sigma-bodový) Kalmanův filtr.</b> Nový <c1/> přidává škálovaný unscented Kalmanův filtr (Julier & Uhlmann; Wan & van der Merwe) jako obecný odhadovač s <c2/> stavy nad uživatelem dodanými procesními a měřicími funkcemi — odhadovač se sigma-body, který těsně vázaný navigátor GNSS/INS používá, když je model pseudovzdálenosti/Doppleru silně nelineární a jakobián EKF se zhoršuje. Zahrnuje podpůrnou hustou lineární algebru (Choleského rozklad pro rozptyl sigma-bodů, Gaussovu–Jordanovu inverzi pro kovarianci inovace) a aktualizaci <c3/> bez Josephova tvaru. Šest testů jej ověřuje, přičemž klíčové z nich využívají přesnou vlastnost, že pro <em>lineární</em> model unscented transformace reprodukuje Kalmanův filtr na numerickou přesnost (predikce, aktualizace i celý cyklus predikce+aktualizace shodné s ručně spuštěným lineárním KF, plus analytická kontrola bayesovského posteriorního rozdělení v 1D a identity Choleského rozkladu/inverze). Upřímný rozsah: jde o odhadovací engine; 17stavový těsně vázaný navigátor GNSS/INS, model měření pseudovzdálenosti/Doppleru a scénář validace výpadku zůstávají jako navazující práce.

seg-da92d32b5715 = <b>Ochranné úrovně dvoukonstelačního ARAIM.</b> Nový <c1/> rozšiřuje ARAIM s jednou poruchou (<c2/>) o <b>režim poruchy celé konstelace</b> podle EU ARAIM / DO-316: vedle hypotéz bez poruchy a poruchy jednotlivé družice přispívá každá konstelace (označená u každé družice) jednou hypotézou, která odstraní všechny její družice najednou, s apriorní pravděpodobností <c3/> (nové <c4/>). Každá hypotéza přidává člen do téhož součtu integrity MHSS, takže VPL/HPL jsou nejmenší meze, jejichž celkové <c5/> splňuje rozpočet přes poruchy bez poruchy + jednotlivých SV + jednotlivých konstelací (rozdělení falešných výstrah podle Bonferroniho je přes všechny hypotézy <c6/>). Při <c7/> je výsledek bitově shodný s <c8/>; uživatel s jednou konstelací vrací <c9/> proti poruše vlastní konstelace (nelze ji vyloučit) — což je přesně důvod, proč na pokrytí dvěma konstelacemi záleží. Čtyři testy pokrývají ekvivalenci, rozšíření ochranné úrovně, nedostupnost s jednou konstelací a validaci vstupu, přičemž využívají stávající aparát podřešení při separaci řešení.

seg-d06c5f88282b = <b>Precese IAU { "2006" } (úhly Fukushima–Williams a matice bias-precese).</b> Nový <c1/> implementuje precesi IAU { "2006" } (P03; Capitaine, Wallace & Chapront { "2003" }): čtyři úhly Fukushima–Williams <c2/> jako polynomy v juliánských stoletích TT (<c3/>) a rotační matici bias-precese GCRS→střední soustava data z nich sestavenou konstrukcí SOFA <c4/> (<c5/>, s pomocnými funkcemi <c6/> / <c7/>). Toto je první díl inerciální soustavy nad stávající redukcí <c8/> založenou na GMST. Osm testů ověřuje proti uzavřeným kotvám — střední sklon ekliptiky J2000 <c9/>, zveřejněné konstantní členy úhlů, akumulaci obecné precese <c10/> za století, ortonormalitu matice a <c11/>, téměř jednotkovou hodnotu (jen bias soustavy) v J2000 a čistý úhel rotace <c12/>/století. Upřímný rozsah (<c13/>): jen precese — nutace IAU 2000A o 678 členech, úplný řetězec TEME→GCRS a numerická křížová kontrola SOFA/ANISE µas/<{ "10" } m zůstávají jako navazující práce.

seg-14c0a863eef1 = Fyzika akcelerometru s interferometrem se studenými atomy (CAI) z prvních principů.

seg-408fc6feb284 = <c1/> modeluje třípulzní atomový interferometr Mach–Zehnder z prvních principů místo z datového listu: efektivní vlnový vektor <c2/>, fáze interferometru <c3/>, kvantový projekční (výstřelový) šum <c4/>, citlivost na zrychlení na jeden výstřel, pokles kontrastu <c5/> a — to hlavní — <c6/>, které <b>odvozuje</b> PSD bílého zrychlení, jež klasické <c7/> již spotřebovává, z počtu atomů, doby dotazování a kontrastu. Model nyní pokrývá také <b>vazbu vibrací</b> — dominantní člen u skutečných zařízení: přenosovou funkci interferometru zrychlení→fáze <c8/> (<c9/>), rozptyl fáze pro bílé PSD <c10/> (<c11/>, s numerickou křížovou kontrolou pásmovým integrálem <c12/>), projekci <c13/> hodnosti 1 podél svazku a <c14/> / <c15/> (to druhé se redukuje na mez <c17/> nezávislou na <c16/>). Jedenáct testů ručně ověřuje fyziku (Rb-87 <c18/>, <c19/>, <c20/>/výstřel mez výstřelového šumu oproti mezi vibrací ≈ { "5.9" } µg, zákony škálování <c21/>, <c22/> a <c23/>). Upřímný rozsah v <c24/>: pokrývá mez projekčního šumu a režim omezený vibracemi nad ní; šum fáze laseru, systematické vlivy Coriolisovy a světelného posuvu a validační scénáře PHARAO/CARIOQA zůstávají jako navazující práce.

seg-ed668459d019 = <b>Akcelerometr kvantového CAI zapojený do inerciálního scénáře.</b> Akcelerometr v inerciálním scénáři s dead-reckoningem se nyní vyhodnotí na nový <c1/> — <c2/> (stávající senzor s koeficienty z datového listu) nebo <c3/>, pokud nese volitelný blok <c4/> (<c5/>: vlnová délka, rozestup pulzů, počet atomů, kontrast, doba cyklu a volitelné <c6/> platformy). PSD náhodné procházky rychlosti senzoru <c7/> <c8/> je <b>odvozeno</b> z fyziky interferometru — mez výstřelového šumu plus, je-li zadáno PSD vibrací, příspěvek omezený vibracemi v kvadratuře — místo dodaného koeficientu a původ běhu zaznamenává, že šum je odvozen z fyziky. Pole <c9/> je <c10/>, takže stávající scénáře je vynechávají a serializují se bajtově shodně (hash scénáře se nemění). Pět testů pokrývá odvození, kvadraturní součet vibrací, výběr <c11/>/<c12/>, serializaci stabilní vůči hashi a běh od začátku do konce řízený CAI.

seg-c3978a122010 = Optimalizátor návrhu konstelace a geometrie streets-of-coverage.

seg-aae519e71c00 = <c1/> získává <c2/>, mřížkový optimalizátor bez gradientu, který prohledává návrhový prostor <c3/> a vrací nejlepší návrh Walker podle zvoleného <c4/> — <c5/>, <c6/> nebo <c7/> — nad již ověřeným průchodem PDOP (test potvrzuje, že vrací vítěze hrubou silou). K tomu analytické uzavřené tvary <b>streets-of-coverage</b> <c8/> (<c9/>) a <c10/> (<c11/>, Rider/Beste), ručně ověřené proti učebnicové geometrii a detekující mezeru nedostatečného obsazení. Úplný Riderův řešič minimálního počtu družic pro globální pokrytí, 3D glóbus v hřišti a externí křížová kontrola DOP zůstávají jako navazující práce.

seg-7b8468636dea = <b>Export přesných efemerid SP3 z CLI.</b> Propagovaný scénář dráhy/konstelace lze nyní zapsat do souboru SP3-c: <c1/>, nebo <c2/> ve scénáři automaticky zapíše <c3/> (<c4/> / <c5/>, <c6/>, volitelné <c7/>). Test zpětného průchodu (<c8/>) propaguje skutečný snímek Celestrak <c9/>, exportuje jej, znovu zpracuje a potvrdí, že obnovené polohy v ECEF odpovídají pravdě SGP4 za { "24" } h s odchylkou <b>< { "0.5" } m</b> (hluboko v toleranci třídy TLE { "10" } m). README dokumentuje roli interoperability (RINEX → RTKLIB/gLAB, SP3 → produkty Ginan/přesných drah).

seg-56c729ba110f = Spřažený Kalmanův filtr hodin+poloha (vzájemná kovariance bloků).

seg-0a424875131d = <c1/> je jediný vrstvený filtr <c2/> (aktualizace v Josephově tvaru), jehož měření <b>pseudovzdálenosti</b> <c3/> skutečně spřahuje bloky polohy a hodin — na rozdíl od starší fúzní sady se dvěma nezávislými dvoustavovými filtry, které drží vzájemnou kovarianci bloků přesně nulovou. Ověřeno: sdílená pseudovzdálenost činí <c4/> nenulovým; dvě odlišné geometrie společně rozliší vložené posuny polohy+hodin, které jedna vzdálenost oddělit nedokáže; <b>oprava jen hodin zpřesní polohu</b> skrze vzájemnou kovarianci (přínos, který nespřažené filtry poskytnout nemohou); a Monte Carlo NEES je <b>konzistentní s χ²({ "4" })</b>. Jde o realizaci s 1 DOF (rozměrnost fúzní sady); rozšíření na 3D se 8 stavy a zapojení do spustitelné sady jsou vedena jako navazující práce.

seg-3983794a9584 = <b>Monitorování zdraví konzistence Kalmanova filtru (NIS/NEES).</b> Aktualizace kovariance dvoustavového filtru hodin je nyní v <b>Josephově stabilizovaném tvaru</b> `P⁺ = (I−KH)P(I−KH)ᵀ

seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, ověřeno proti tabulce).

seg-f9689061a1d2 = <b><c1/> — jedna citovatelná tabulka původu.</b> Sjednocuje každý parametr senzoru (hodiny, inerciální, přenos času), fyzikální/algoritmický model (dráha, časové soustavy, soustavy, iono/tropo, integrita, detekce, rušení, Allan) a validační datovou sadu (AIAA 2006-6753, Celestrak <c2/>) s jejím zveřejněným zdrojem — datovým listem, článkem, ICD nebo normou — a upřímným označením zralosti (kvalifikováno pro let / pozemní laboratoř / vesmírný cíl na pozemním hardwaru). Odkazováno z úvodu README a z tabulky dokumentace; doplňuje řetězce <c3/> pro každý běh, které již putují ve výsledném JSON.

seg-55c7b52b5fdb = <b>Typované API scénářů.</b> Rozdělení nyní probíhá podle typovaného výčtu <c1/> místo porovnávání surového řetězce <c2/> (<c3/> + vyčerpávající rozdělení), takže přidání balíčku je kontrolováno při kompilaci. Nové typované povrchy vedle nezměněného <c4/> vracejícího řetězec: <c5/> se strukturovanou taxonomií chyb (<c6/> / <c7/> / <c8/> / <c9/>, každá se stabilním <c10/>); trait <c11/> a rozšiřující bod <c12/> (balíček <c13/> je jím zapojen jako vypracovaný příklad); a introspekce <c14/> (název, popis, povinná/volitelná pole pro každý druh). Vazby pro Python a WebAssembly získávají <c15/> a <c16/>. Zdokumentováno v <c17/>.

seg-2b86391b753e = Skutečná konstelace GPS + pokrytí provozní obálky.

seg-288f2b1872c8 = <c1/> nyní dodává <b>skutečný snímek Celestrak <c2/></b> (2021-07-28, { "30" } družic) místo syntetických TLE Walker, s <c3/>, takže se načte, jen když je platný každý kontrolní součet TLE; <c4/> dokumentuje reprodukovatelné obnovení a README uvádí zdroj otevřených dat. Nový <c5/> prověřuje každý balíček přes ≥{ "5" } variant obálky s tvrzením o konečném/omezeném výstupu, potvrzuje, že <b>práh flicker-FM měřitelně zhoršuje dojezd hodin</b>, je-li zapnut (nyní nastaven ve třech dodávaných scénářích), a potvrzuje, že <b>fúzní filtr konverguje se skutečným nenulovým biasem akcelerometru</b> (do { "3" }× případu s nulovým biasem), čímž uzavírá mezeru v realismu „fúze funguje jen s nulovými biasy“. <c6/> získává tabulku provozní obálky.

seg-f78d7dce7bfa = <b>Simulace GNSS v doméně měření (druh <c1/>).</b> Dopředný model na úrovni pseudovzdálenosti: pro každou viditelnou družici syntetizuje <c2/> a Doppler na L1, s jednofrekvenční ionosférou <b>Klobuchar</b> (IS-GPS-200 §{ "20.3.3.5.2.5" }) a zenitovou troposférou <b>Saastamoinen</b> promítnutou mapovací funkcí <b>Niell ({ "1996" })</b> — zpřístupněno jako bloky TOML <c3/> a <c4/>. Rezidua napájejí snímkové RAIM pro HPL/VPL v každé epoše a pole JSON <c5/> nese pseudovzdálenost, Doppler, C/N₀ a opravy iono/tropo každé SV. Běh bez šumu reprodukuje geometrii + opravy na submilimetr (test CI). Nové <c6/> a <c7/>.

seg-833249802c56 = <b>Stochastický detektor časového spoofingu (druh <c1/>).</b> Balíček spoofingu nyní spouští skutečný detektor místo deterministického porovnání rampy s mezí: čtyři tvary vložení (<c2/>, <c3/>, <c4/>, <c5/>), oboustranný test energie χ²₁ / Neyman–Pearson na statistice monitoru podporovaného hodinami s prahem nastaveným z cílového rozpočtu falešných poplachů <c6/> a pravděpodobnost nezachycené události <c7/> uváděná v uzavřeném tvaru i Monte Carlem (<c8/> pokusů na hypotézu — obojí se shoduje na několik ×1/√N). Ukazatel kvality Security je nyní <c9/> při provozně škodlivé (specifikační) velikosti. Nový <c10/> (gaussovské ocasní funkce, test NP/energie, Monte Carlo P_fa/P_md) a <c11/>. Zpětně kompatibilní: holé <c12/> se stále přijímá jako lineární rampa.

seg-b3f3d2ca8a3d = <b>Definice ukazatele kvality Security (druh <c1/>):</b> od analytické meze detekovatelnosti <c2/> ke <c3/> stochastického detektoru. Pole <c4/> balíčku hodin zůstává rychlejším analytickým zástupcem.

seg-ee1268975b2c = Přidáno (pokračování)

seg-f71696b7fa20 = <b>Model rušení RF (druh <c1/>).</b> Model interference na bázi rozpočtu spoje, který mění výkon a geometrii rušičky na ztrátu vazby u každé družice: poměr rušička–signál z útlumu volným prostorem a zisku přijímací antény pro každý směr, efektivní C/N₀ podle standardní rovnice protirušení (zisk zpracování rozprostřením × činitel spektrální separace <c2/>; Kaplan & Hegarty §{ "9.4" }) a konfigurovatelný práh sledování, vyhodnocený přes konstelaci Walker jako ukazatel kvality <c3/>. Nové <c4/> a <c5/>. Upřímný rozsah (bez vícecestného šíření, stínění terénem, AGC a adaptivního nulování) je zdokumentován v <c6/> / <c7/>.

seg-d4dc36011ea1 = <b>Obecný N-rozměrný průchod parametrů přes libovolný druh scénáře (<c1/>).</b> Předchozí N-rozměrný průchod byl jen pro balíček hodin. <c2/> mění tečkované klíče TOML scénáře <c3/> přes kartézský součin jeho os, znovu rozešle každý uzel mřížky běžnou cestou běhu a čte z výsledku jednu či více metrik tečkovanou cestou JSON — takže funguje pro každý balíček (inerciální, gnss-ins, integrita, spoof, …) bez vazby na typ Rust každého balíčku. Uzly mřížky se na nativních cílech vyhodnocují paralelně přes vlákna OS (bez přidané závislosti); wasm se vrací k sekvenčnímu zpracování. Deterministické a po řádcích bez ohledu na počet vláken. Nový příklad <c4/>.

seg-1c42e15d65a9 = <b>Deterministický model chyb IMU konfigurovatelný v TOML v balíčku <c1/>.</b> Třídosý strapdown řetězec chyb (škálovací faktor, nesouosost, g-citlivost, kvantizace, rampa rychlosti; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) je nyní dosažitelný pro každý senzor ze souboru scénáře přes volitelný blok <c2/>, vrstvený nad konstantní biasy po zapnutí. Vynechání bloku ponechá každý senzor čistě zdrojem konstantního biasu, takže stávající běhy <c3/> jsou beze změny. Tím je dříve jen knihovní model chyb zapojen do spustitelného balíčku a ukazatele kvality.

seg-e035371fbe58 = <b>Validace na skutečných datech.</b> Parser navigace RINEX pro více GNSS, propagátor GLONASS RK4 a čtečka SP3 jsou nyní prověřeny proti skutečným souborům IGS/DLR (skutečný smíšený vysílaný navigační soubor RINEX { "3" } a produkt drah IGS SP3-c), nejen proti vlastnoručně vytvořeným vzorkům — s tvrzením o neprázdných množinách družic a konečných, fyzikálně velkých polohách v ECEF. Fixtures jsou jen pro testy (vyloučené z publikovaného crate); viz <c1/>.

seg-2a807ae8e194 = <b>RAIM na geometrii skutečných referenčních drah.</b> Jádra snímkového RAIM, separace řešení (MHSS) a ochranných úrovní ARAIM jsou nyní ověřena proti skutečné geometrii přesných drah IGS (SP3), nejen proti syntetickým konstelacím: geometrie přímé viditelnosti je sestavena z první epochy SP3 na skutečné pozemní stanici a testy tvrdí, že ochranné úrovně jsou na úrovni metrů a dostupné pro APV-I, že zkreslení pseudovzdálenosti { "60" } m spustí monitor χ², že separace řešení <b>identifikuje</b> družici s poruchou a že úrovně ARAIM splňují přidělené <c1/>. Uzavírá mezeru ověření jen na syntetické geometrii (shoda na straně přijímače s gLAB přes celý oblouk RINEX zůstává položkou plánu — vyžaduje řešení pseudovzdálenosti).

seg-651cc4af4872 = <b>Intervaly spolehlivosti pro každý uzel N-rozměrného průchodu parametrů</b> (<c1/>). Každý uzel mřížky N-rozměrného průchodu s kartézským součinem lze nyní vyhodnotit jako ensemble Monte Carlo ze seedů a uvádět průměr metriky, percentily a percentilový bootstrap { "95" }% CI pro každý uzel (u obou hodin) — statisticky poctivý průchod místo jednoho tahu na uzel. Využívá aparát ensemble/bootstrap (<c2/>); deterministické; <c3/> se přesně redukuje na jednoseedové <c4/>. (Zobecnění průchodu na všechny balíčky, spletené s refaktorem typovaného Scenario, a paralelní provádění zbývají.)

seg-815eda56aad9 = <b>Křížová validace řetězce šumu IMU proti NaveGo</b> (<c1/>). Externí křížová kontrola proti NaveGo (open-source sadě nástrojů INS/GNSS od R. Gonzaleze): reprodukuje syntetický zpětný průchod <c2/> na jeho zveřejněném referenčním profilu Microstrain 3DM-GX3-35 a potvrzuje, že náš odhadovač překrývající se ADEV obnovuje koeficienty náhodné procházky rychlosti a úhlu podle NaveGo (<c3/>) s odchylkou pod { "5" } % s očekávaným sklonem bílého šumu −1/2. (Zaznamenaný záznam STIM300 <c4/> o { "40" } MB se nenačítá — brání tomu binární formát.)

seg-b67b3ec240de = Těsně vázaná (pseudovzdálenostní) aktualizace GNSS/INS.

seg-c926dddc5256 = <c1/> (a obal <c2/>) implementují dříve jen nahrazené měření v doméně vzdálenosti: inovací je předpovězená vzdálenost od polohy INS ke každé družici oproti naměřené pseudovzdálenosti, s jakobiánem přímé viditelnosti na chybu polohy. Protože každá družice je skalární měření, filtr pokračuje v opravách <b>i s méně než čtyřmi družicemi</b> — tam, kde volně vázané řešení PVT neexistuje. Pět testů pokrývá nulování se čtyřmi družicemi, opravu se dvěma družicemi (PVT není možné), pozorovatelnost jedné družice podél přímky viditelnosti a validaci vstupu. Jen pseudovzdálenost; fáze nosné a explicitní stav hodin přijímače zůstávají v plánu. Nepoužívaná funkce cargo <c3/> (která zahrazovala starou chybovou náhradu) je odstraněna.

seg-94ebfac3bbc3 = <b>Balíček scénářů GNSS/INS volně vázaný (<c1/>, <c2/>).</b> Zapojuje třídosý strapdown navigátor a 15stavový EKF chybového stavu (<c3/> / <c4/>) do spustitelného scénáře s ukazatelem kvality — EKF disciplinuje mechanizaci proti zašuměným fixům GNSS, dokud je pokrytí k dispozici, a pak přejede výpadek, čímž nahrazuje reset na pravdu starého skalárního balíčku s 1 DOF skutečnou fúzí. Výsledek uvádí řadu fúzované horizontální chyby, vyhodnocený ukazatel kvality polohy (dostupnost / RMS při výpadku / holdover) a RMS volné INS s otevřenou smyčkou pro srovnání; dvojice kvantové/klasické IMU se liší jen skutečným biasem. Spouští se z vstupního bodu CLI/Python/wasm s příkladem <c5/>. Poctivé zarámování: jen volně vázané, jedna deterministická trajektorie a fúzovaná chyba při výpadku je omezena podlahou chyby orientace při předání (takže se netvrdí, že roste s biasem) — robustními zjištěními je, že fúze překonává nepodporovaný dead-reckoning u senzoru s biasem a že senzor s nižším biasem má lepší nepodporovaný dojezd.

seg-0a2df01f99d8 = <b>Návrh konstelace na ověřeném jádru SGP4 (<c1/>).</b> Nový modul <c2/> vydává navržený vzor Walker-delta (<c3/>) jako <b>střední prvky</b> SGP4, takže se syntetická konstelace propaguje toutéž cestou SGP4 ověřenou na { "4.12" } mm proti vektorům AIAA 2006-6753 — nikoli analytickým keplerovským generátorem. Nad tím: <c4/> vyčísluje pokrytí a mediánový/nejhorší PDOP přes mřížku návrhů <c5/> a <c6/> uvádí podíl pokrytí a mezery opětovného přeletu (nejhorší/střední) v pozemním bodě. Ověřeno fyzikálními monotonnostmi, které musí obchodní studie dodržet (více družic ⇒ větší pokrytí, nižší PDOP, kratší opětovný přelet). Zvlášť je jako fixture jen pro testy přidán skutečný <b>snímek TLE Celestrak <c7/></b> (2021-07-28, { "30" } provozních družic GPS) a proti němu ověřena cesta skutečné TLE → SGP4 → geometrie ECEF (celá slupka MEO v rozmezí { "1" } %, devět družic zároveň v dohledu při PDOP { "1.64" }), vedle stávajících cest se skutečnými daty SP3 a RINEX.

seg-9e051f3725df = Efektivní stupně volnosti specifické pro typ šumu u intervalů spolehlivosti Allanovy odchylky.

seg-2392bec8f0b6 = <c1/> implementuje uzavřené tvary NIST SP { "1065" } Tabulky { "5" } (jednoduchá sada Stable32) pro všech pět kanonických mocninných typů šumu — bílý/flicker PM, bílý/flicker FM, náhodná procházka FM — a nahrazuje konzervativní počet bez překryvu jako stupně volnosti χ². Nový výčet <c2/> a <c3/> určí dominantní typ ze sklonu <b>modifikované</b> Allanovy odchylky záznamu (MDEV odliší bílý a flicker PM tam, kde to ADEV nedokáže) a <c4/> nyní ke každému bodu exportované křivky ADEV připojí určený typ šumu, jeho edf a { "95" }% pásmo spolehlivosti (<c5/> získává <c6/>/<c7/>/<c8/>/<c9/>, doplňkově s výchozími hodnotami serde). Ověřeno dvěma způsoby: pět vzorců odpovídá ručně vyhodnoceným hodnotám na { "1e-12" } a Monte Carlo ensemble bílého FM o { "4" } 000 záznamech potvrzuje, že vzorec předpovídá skutečné edf odhadovače podle χ² do { "20" } % (a že podstatně překonává konzervativní počet). Osm nových testů.

seg-df59cc71120f = Stochastický model oboustranného přenosu času.

seg-d2add1ce01e1 = <c1/> nahrazuje vzorkovač jen s bílým šumem fyzikálně podloženým modelem: reciproční (souhlasné) zpoždění cesty se v odhadu <c2/> ruší (<c3/>, takže dvě nezávislá jednosměrná měření se zprůměrují na <c4/>) a zbytkem je <b>nereciproční</b> rozdílové zpoždění — modelované jako barevný proces bílého FM + náhodné procházky FM (ověřené <c5/>), který dává řadě chyby synchronizace realistický podpis Allanovy odchylky (<c6/>) místo plochého bílého šumu. <c7/> získává <c8/>/<c9/> (výchozí hodnota serde { "0" } ⇒ původní chování jen s bílým šumem, bitově shodné), ukazatel kvality spoje uvádí <c10/> (Allanova odchylka modelu při základním kroku) a scénář/CLI <c11/> jej zpřístupňují. Zlatý ukazatel kvality znovu připnut. Šest ručně odvozených testů (zrušení souhlasné složky, dvoucestný zisk sqrt({ "2" }), zákon RWFM <c12/> přes vlastní <c13/> spoje, shoda s původním chováním při <c14/>, determinismus a zpřístupnění ukazatele kvality od začátku do konce).

seg-6c7a1dd63be0 = Numerická shoda se Stable32 pro odhadovače rodiny Allan (NBS14).

seg-adbb47ca87b4 = <c1/> ověřuje odhadovače překrývající se ADEV, modifikované ADEV, časové odchylky a překrývající se Hadamardovy proti referenčním odchylkám Stable32 pro kanonickou datovou sadu <b>NBS14</b> (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ~s. 107) pro tau = { "1" }, { "2" } s relativní tolerancí { "1e-4" } — skutečná shoda ~{ "1e-6" }. Tím se matematika odhadovačů připíná proti de facto referenční implementaci, nejen proti vlastní analytické samokonzistenci odhadovačů. Používají se jen veřejná referenční čísla; žádný cizí kód.

seg-f23b6db96748 = Tabulka stop získává sloupec <c1/>.

seg-a5769fbc201e = Text nápovědy už netvrdí, že <c1/> přijímá příznaky vstupní části (front-end); používá je pouze <c2/>.

seg-cf28fa21786a = Parametry <c2/> a <c3/> v Pythonu u <c1/> mají nyní výchozí hodnotu <c4/> (hodnoty z návrhu, ve vestavěném návrhu { "1" } a { "5000" } Hz). Jeho epochy získávají korelátory early/late, <c5/>, <c6/>, <c7/> a <c8/> a výsledek získává <c9/> a <c10/>.

seg-666b9e3faa5d = <b>Výchozí krok akvizice už nepředává sledování Galileo E1 zbytek, který FLL nedokáže zachytit.</b> Krok <c1/> zanechává při předání až <c2/> chyby Dopplerova posunu, ale výchozí dvoukvadrantová FLL zachytí jen <c3/>. U každého kódu s délkou { "4" } ms nebo delší (<c4/>), včetně Galileo E1-B a E1-C, ležel zbytek ({ "83.3" } Hz při { "4" } ms) mimo zachytávací rozsah { "62.5" } Hz a sledování se falešně zachytilo na +{ "125" } Hz, přičemž indikátor fázového zachycení { "0.97" } to skrýval. Výchozí krok je nyní navíc omezen na <c5/> (<c6/>), tedy { "0.8" } zachytávacího rozsahu, takže předání zůstane uvnitř rozsahu, i když zvítězí sousední přihrádka. (Nejprve se zkusilo { "0.4" }: při E1-B se falešně zachytil { "1" } běh ze { "42" } a koherentní hledání GPS L1 C/A s { "1" } ms vybralo přihrádku vzdálenou { "350" } Hz a zachytilo se na +{ "500" } Hz; hodnoty { "0.25" } a { "0.2" } ve stejných bězích žádné neměly.) Cena: Galileo E1-B/E1-C přecházejí z přihrádek po { "166.7" } Hz na přihrádky po { "50" } Hz, tedy { "201" } přihrádek v rozsahu ±{ "5" } kHz místo { "61" }; kódy s { "1" } ms ({ "166.7" } Hz, <c7/>) se nemění. <c8/> v návrhu smyčky znamená právě toto; explicitní <c9/> nebo <c10/> se použije tak, jak je zadáno, a <c11/> (bez předání sledování) zachovává učebnicový krok. Hlavička epochy a <c12/> nyní zaznamenávají vyřešený krok a šířky pásma smyček pro každý kanál (<c13/>). Výchozí hash návrhu se nemění. Změna výstupu: detekce u kódů s délkou { "4" } ms a delší mohou dopadnout do jiných Dopplerových přihrádek.

seg-9150dc89e186 = <b>GPS L2C CM (aktualizace smyčky po { "20" } ms) s výchozím návrhem drží zachycení.</b> Výchozí PLL { "15" } Hz a FLL { "10" } Hz mají <c1/> { "0.3" } a { "0.2" } při T = { "20" } ms a smyčka ztratila zachycení i při dokonalém startu (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Nový klíč návrhu <c2/> (výchozí { "0.1" }) omezuje šířky pásma šumu PLL a FLL na <c3/>, je-li doba aktualizace smyčky delší než { "4" } ms (<c4/>): { "5" } Hz a { "5" } Hz při { "20" } ms, { "10" } Hz a { "10" } Hz při { "10" } ms u BeiDou B1C; kódy s { "1" } ms a { "4" } ms si ponechávají { "15" } a { "10" } Hz. Platí i pro explicitně zadané šířky pásma; <c5/> to vypíná. Klíč se při výchozí hodnotě z kanonického tvaru vynechává, takže výchozí hash se nemění; návrh, který nastaví jinou hodnotu, má jiný hash. Při { "45" } dB-Hz dává L2C CM nyní PLI { "0.996" }, chybu Dopplerova posunu { "0.00" } Hz a M2M4 { "42.71" } dB-Hz. Známá otevřená položka: NWPR C/N0 tam vychází o { "1.76" } dB nízko (a o { "2.45" } dB nízko u B1C při { "10" } ms), takže T5 matice pro L2C zůstává ignorovaným zjištěním.

seg-74517bee3f6f = <b>Soubor <c1/> byl znovu vygenerován: uložený obrázek byl zastaralý vůči vlastnímu scénáři (změna dat, nikoli přebarvení).</b> Graf byl nakreslen 2026-06-02 ze souboru <c2/>; o dva dny později 67fed19e nastavil v tomto scénáři úrovně flicker-FM (kvantové <c3/>, CSAC <c4/>) a obrázek už nikdo nepřekreslil. Ukazoval běh před nastavením úrovní: osa y { "0" } až { "47" } ns, p95 výpadku CSAC na jeden běh { "10.5" } až { "47.6" } ns (průměr { "25.2" } ns), klasický holdover průměrně { "4050" } s. Scénář tak, jak je dodáván (a jak již uvádějí tutoriál a shrnutí CLI), dává osu y { "0" } až { "407" } ns, p95 CSAC na jeden běh { "40.8" } až { "374.0" } ns (průměr { "167.0" } ns), klasický holdover { "844" } s [{ "220" } až { "2130" } s]; specifikační čára { "20" } ns leží na stejných { "20" } ns na zhruba devětkrát vyšší ose. Engine se nemění: dnešní engine na červnovém souboru scénáře reprodukuje osu starého obrázku přesně. Obrázek není odkazován z README ani z dokumentace.

seg-75636f9419b2 = Známá omezení

seg-2c607b56048e = <b>NWPR C/N0 vychází nízko při vysokém C/N0·T na jeden prompt a BOC({ "1,1" }) při { "5" } MS/s ztrácí asi { "1" } dB.</b> NWPR je na ideálních promptech nezkreslený, ale vlastní fázový jitter PLL smyčky stojí zhruba proloženě { "8" } dB × Bn·T (jedna scéna, čtyři body: −0,24/−0,44/−0,77/−{ "1.58" } dB při 1/2,5/5/10 Hz a { "20" } ms; asi −{ "1" } dB při výchozím <c1/>); M2M4 je necitlivý. Data BeiDou B1C při { "5" } MS/s také ztrácejí asi { "1" } dB výkonu promptu kvůli omezení pásma (použijte { "10" } MS/s nebo více). Ani jedno není vadou estimátoru; řádky T5 signálové matice pro GPS L2C a BeiDou B1C zůstávají ignorovanými zjištěními s těmito příčinami.

seg-ff195e575023 = <b>Zpřísněn text grafů a přejímání grafů ve Studiu.</b> Text, který scénář přenáší do vygenerovaného grafu, je nyní jednotně escapován jednou sdílenou rutinou a Studio přejímá z grafu pouze značky kresby. Adresní parametry Studia, vyhledávání podle druhu a načítání scénářů jsou omezeny na známé hodnoty. Přibalené grafy, zaznamenané výsledky a zveřejněná čísla se nemění. Aktualizace se doporučuje všem, kdo ve Studiu otevírají soubory scénářů z nedůvěryhodných zdrojů nebo vkládají vygenerované grafy do webových stránek. Bezpečnostní upozornění: <a1>GHSA-h25h-cg9f-v2cg</a1>.

seg-7f566858d036 = <b>Rozsah vrstvy IQ z hlediska interference a spoofingu, uvedený přesně.</b> Záznamy { "0.31.0" } a { "0.32.0" } níže uvádějí, že vrstva IQ nepřidává „žádnou syntézu signálu interference ani spoofingu“. To platí o samotné vrstvě IQ (<c1/> generuje pouze legitimní signály GNSS), ale znělo to jako tvrzení o celém enginu, což není pravda: od { "0.29.0" } sekce <c3/> druhu <c2/> zapisuje snímek SigMF svého analytického modelu s nakonfigurovanými rušiči (šumové rušiče po přihrádkách, tóny a chirpy jako průběhy) a <c4/> sčítá v paměti repliku autentického signálu a repliku signálu spoofera, aby otestoval zachycení smyčky (složený signál se nikdy nezapisuje). Engine navíc od { "0.20.0" } obsahuje softwarový přijímač GNSS (<c5/>: akvizice a sledování; od { "0.31.0" } také <c6/> a <c7/>). Nic v Kshaně nevysílá ani neřídí rádiový hardware. Stavový řádek README, <c8/>, <c9/> a poznámky k návrhu IQ to nyní uvádějí; již vydané záznamy zůstávají tak, jak byly zveřejněny. Chování se nemění.

seg-61befd8b474d = <b>Známé omezení: souměřitelné vzorkování.</b> Při vzorkovací frekvenci, která je celým nebo poloceločíselným násobkem čipové frekvence, leží vzorky v každém čipu na stejných fázích čipu a diskriminátor kódu se stává schodištěm. Na syntetickém signálu GPS L1 C/A při { "45" } dB-Hz s rozestupem 0,5 čipu dává { "2.046" } MHz ({ "2" } vzorky na čip) chybu kódu ≈ { "0.09" } čipu (≈ { "26" } m) RMS a odchylku −{ "0.09" } čipu, oproti ≈ { "0.003" } čipu při nesouměřitelné frekvenci. NWPR C/N0 tam vychází o ≈ { "2.4" } dB nízko. Při { "4.092" } MHz závisí na rozestupu a kódovém Dopplerově posunu. Při { "0.5" } čipu je neškodná při Dopplerově posunu { "1500" } Hz, ale { "2" }× s odchylkou { "0.011" } čipu při { "0" } Hz a při { "0.25" } nebo { "0.1" } čipu je chyba kódu { "8" }–{ "10" }×. Sledování nosné není ovlivněno. Měření obsahuje <c1/>.

seg-3a30bd47380a = Vrstva GNSS IQ na serveru MCP (fáze B.1).

seg-ef81eca03bca = <c1/> získává šest nástrojů, které z agenta řídí vrstvu <c2/>: <c3/> (přijímané názvy signálů a nastavení IQ), <c4/> (popis nahrávky), <c5/> (generování scény se zadaným profilem nebo s vysílanými efemeridami, s volitelným kanálem na úrovni signálu), <c6/> (FFT akvizice, volitelně za stupni front-endu), <c7/> (akvizice a poté banka DLL/PLL/FLL) a <c8/> (pásmová propust, notch, blanking, excize, AGC, kvantizér). Vzorky IQ protokolem nikdy neprocházejí: každý nástroj bere cesty k souborům uvnitř jednoho pracovního adresáře nastaveného proměnnou <c9/> (nenastavená vypíná nástroje pro soubory IQ a ostatní nástroje neovlivní), odmítá cesty, které se rozloží mimo něj, a výstupy, které již existují, pokud není nastaveno <c10/>, před jakoukoli prací vynucuje rozpočet vzorků na jedno volání (<c11/>, výchozí { "50 000 000" }), odmítá neznámé argumenty a odpovídá kompaktním shrnutím JSON (detekce, C/N0, stav zachycení a každý zapsaný soubor s počtem bajtů). Výstup po epochách jde pouze do souborů, které volající pojmenuje. Nástroje spouštějí stejnou cestu kódu jako CLI přes nové veřejné rozhraní <c12/>, které vrací zprávu CLI místo jejího tisku (stdout je kanál JSON-RPC MCP); <c13/> a <c14/> jsou nyní také veřejné. Pouze software a pouze přírůstkově: vrstva IQ nepřidává syntézu interference ani spoofera, nic se nikdy nevysílá a nejsou žádné nové závislosti. <c15/> deklaruje obě proměnné prostředí. Testy round-trip v <c16/> generují krátkou scénu se dvěma satelity a kontrolují akvizici proti vlastnímu souboru pravdy scény, zachycení sledování a C/N0, front-end, výstup SigMF, rozpočet, omezení cest a vypnutý stav.

seg-6963f3fa1db7 = <b>Vrstva GNSS IQ v registru validace.</b> Předregistrovaná křížová kontrola proti gps-sdr-sim (nezávislému generátoru základního pásma GPS L1 C/A, MIT, commit 28ca29a6) je nyní součástí vždy zapnuté sady testů (<c1/>). Její uložený referenční výstup (<c2/>: { "20" } ms vlastního 8bitového I/Q z gps-sdr-sim, jeho výpis kanálů a stav kanálů za ním z pomocného programu sestaveného ze stejného buildu) se znovu generuje skriptem <c3/>. Při testu není potřeba síť ani externí nástroj. Přidány jsou dva řádky registru ({ "251" } řádků: { "124" } ověřených, { "123" } modelovaných, { "4" } partnerské):

seg-21d005e2ef0e = <em>Geometrie signálu scény GNSS IQ proti nezávislému generátoru základního pásma</em>: <b>Ověřeno</b>. Pravda scény (viditelná množina, pseudovzdálenost, fáze kódu, Dopplerův posun, úhly pohledu) pro scénu s vysílanými efemeridami odpovídá stavu kanálů gps-sdr-sim na všech { "11" } kanálech: nejhorší { "1.6" } mm, { "5.5e-6" } čipu, { "7.4e-5" } Hz, { "4e-9" } stupně, proti prahům { "0.05" } m, { "2e-4" } čipu, { "0.02" } Hz a { "1e-4" } stupně stanoveným před během.

seg-5c8858182d41 = <em>Akvizice GNSS IQ na nezávisle generovaných vzorcích I/Q</em>: <b>Modelováno, se zjištěním</b>. <c1/> najde každý simulovaný satelit ve vzorcích gps-sdr-sim v rámci registrovaných prahů (fáze kódu do { "0.195" } čipu, Dopplerův posun do { "72" } Hz). Registrovaný práh „žádný jiný PRN nebyl detekován“ však selhává: na výstupu gps-sdr-sim bez šumu je práh pro gaussovský šum překročen křížovou korelací ostatních satelitů u všech { "21" } nepřítomných PRN. Přísný test je zachován, ignorován se zjištěním, a připnutý test je zaznamenává. Žádný kód enginu ani veřejné API se nemění. Vzorky I/Q se neporovnávají vzorek po vzorku: celočíselná sinová tabulka gps-sdr-sim, zisky, nulová počáteční fáze nosné a zkrácená pole LNAV nejsou veličiny, na kterých se musí přijímač shodnout. Porovnání se provádí na pozorovatelných veličinách, které přijímač měří.

seg-a2be63287ce4 = <b><c1/> předává z akvizice o délce ≈{ "4" } ms ve výchozím nastavení (změna chování).</b> Akvizice, která inicializuje každý kanál sledování, nyní koherentně integruje <c2/> period kódu místo jedné, kde <c3/> je celá perioda kódu (primární krát délka sekundárního u vrstveného kódu, jednotka, přes kterou akvizice integruje). Nevrstvené kódy s { "1" } ms (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) nyní prohledávají { "4" } periody ({ "4" } ms), takže výchozí Dopplerův krok <c4/> je ~{ "167" } Hz místo ~{ "667" } Hz. Každý kód, jehož celá perioda je již { "4" } ms nebo delší, si ponechává { "1" } periodu: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms) a vrstvené GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q a E1-C ({ "10" } až { "100" } ms s jejich překryvnými kódy) a GPS L2C. Každý signál tedy integruje alespoň ~{ "4" } ms. Hledání s jednou periodou mohlo kanál předat až ~{ "333" } Hz vedle, mimo zachytávací rozsah FLL, a ten pak sledoval falešné zachycení ~{ "500" } Hz daleko, přičemž hlásil čisté sledování. Na seedovaném průchodu { "180" } kanálů GPS L1 C/A (Dopplerův posun v rozsahu ±{ "5" } kHz, { "38" } až { "47" } dB-Hz, polovina s navigačními daty; <c5/>, lze znovu spustit) klesají falešná zachycení z { "27" } ze { "180" } na { "1" } ze { "180" } a zmeškané akvizice ze { "102" } na { "11" }, za cenu ~{ "40" } ms hledání navíc na PRN u GPS L1 ({ "11" } → { "52" } ms). Jediné zbývající falešné zachycení je při { "38" } dB-Hz, { "36" } Hz vedle. Všechna rozhraní se shodují: <c6/> a <c7/> (<c8/>), Python <c9/> (<c10/> je nyní automatické; stub aktualizován) a nástroj MCP <c11/>. Uživatelé, kteří se spoléhali na staré výchozí chování, mohou předat <c12/> (<c13/>). Vlastní výchozí hodnota <c15/> u <c14/> zůstává { "1" }. Nové veřejné <c16/> a <c17/>; regresní test <c18/>.

seg-52768eb8e3d5 = <b>Každá generovaná grafika nyní sleduje téma Observatory webu: bajty každého grafu se mění.</b> Jde o záměrnou revizi zveřejněných obrázků, pouze barev a písem; žádná vynesená hodnota, souřadnice ani popisek se nepohnuly. <c1/> každého scénáře (a tedy exporty grafů Studia a ukázkové grafy v README), HTML zpráva o běhu (<c2/>), animace časové osy (<c3/>), HTML stránky výsledků scénářů a studií, shrnutí validace a obrázky a diagramy v dokumentaci používaly teplou tmavou červencovou paletu (základ <c4/>, zlatá <c5/>) a teplé papírové téma zpráv. Nyní přebírají každou barvu a písmo z jednoho modulu, <c6/>, který zrcadlí <c7/>: grafy jsou kresleny přístrojově tmavě na základu Observatory (<c8/>) v sadě písem Geist; zpráva, přehrávač animací a stránky výsledků sledují světlou či tmavou preferenci prohlížeče se světlými a tmavými tokeny Observatory. Šest domén selhání si ponechává každá jednu barvu (interference korálová, spoofing purpurová, časování modrá, oběžné dráhy azurová, integrita limetková, navigace jantarová) a úrovně důkazů se čtou ověřeno limetkově, modelováno jantarově, partner purpurově. Rampy vodopádů si zachovávají své percepční (inferno) uspořádání, znovu ukotvené na novém základu.

seg-d967e354a966 = <c1/> drží modul na <c2/> v obou tématech, kontroluje, že <c3/> a <c4/> (oba generované z modulu pro nástroje obrázků v Pythonu a mermaid-cli) jsou aktuální, a selže, objeví-li se v <c5/> mimo paletu šestnáctkový barevný literál.

seg-fa3e60422ca5 = <c1/> získává třetí diagnózu, „pohnuly se jen barvy a písma“, aby se revize palety odlišila od posunuté vynesené hodnoty. Každý znovu vykreslený graf v README byl ověřen jako shodný se svým předchůdcem po tomto normalizátoru.

seg-3bc4056fd57e = <c1/> čte paletu a nyní také generuje tři výsledkové obrázky README, které neměly uložený generátor (<c2/>, <c3/>, <c4/>), se skutečnými textovými prvky, z <c5/>, výsledku <c6/> a <c7/>. <c8/> čte stejnou paletu, čímž opravuje svůj posun světlého tématu oproti webu. Hodnoty <c9/> jsou sloupcem nejhoršího případu <c10/> v tomto fixture ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } a { "4.12e-6" } km), beze změny oproti obrázku z Matplotlibu, a <c11/> nyní selže, pokud se uložený obrázek a fixture neshodují.

seg-3196836a2a0d = <b>Soubor <c1/> aktualizován na aktuální data (změna dat, nikoli přebarvení).</b> Obrázek uváděl { "28" } schopností ve { "8" } doménách ({ "11" } ověřených, { "17" } modelovaných), zastaralé vůči vlastnímu uvedenému zdroji; nyní nakreslen novým generátorem z <c2/> uvádí { "46" } schopností v { "8" } doménách ({ "17" } ověřených, { "29" } modelovaných).

seg-55d5b16379aa = <b>Q rušiče CW/úzkopásmového je nyní { "1.0" }, nikoli { "1.5" }.</b> Učebnicová hodnota pro tón na nosné je { "1" } (tón zachovává spektrální vrchol signálu, <c1/>, <c2/>); dřívější { "1.5" } způsobovala, že tón škodil méně než širokopásmový šum při stejném J/S. Změna výstupu: asi −{ "1.8" } dB efektivního C/N0 při rušičích CW/úzkopásmových při vysokém J/S v druzích <c3/>, <c4/> a interop (tón přibaleného příkladu <c5/>: { "17.98" } dB-Hz z tabulky, dříve { "19.74" }). Q širokopásmového zůstává { "1.0" } (konzervativní, asi o { "3" } dB pod učebnicovými ~{ "2" }) do revize { "0.34" }. Nastavte <c6/>, chcete-li zachovat staré { "1.5" }.

seg-99fab1936170 = <b>Celočíselný výstup <c1/> využívá celočíselný rozsah.</b> Při šumu s jednotkovým výkonem a měřítku zapisovače { "1" } vycházely scény <c2/>/<c3/> zhruba jako { "{" }-1, { "0" }, { "1" }{ "}" } a 2bitové scény měly prahy při { "2.8" } sigma. Celočíselné formáty se nyní škálují tak, aby očekávané RMS na složku bylo čtvrtinou plného rozsahu ({ "31.75" } LSB u ci8, { "8191.75" } u ci16) nebo { "2" } LSB u 2 bitů. Měřítko a počet oříznutých prvků se vypisují a zapisují do doprovodného souboru. Výstup v pohyblivé řádce je beze změny.

seg-696109ae70f8 = <b>Osm fixture pinů v sedmi testovacích souborech už na macOS nepadá kvůli rozdílům v posledním bitu</b> (část issue #36). Piny, které kontrolují, že engine stále sestaví uložené vstupy orákula (Jacobiány, tabulku stavů, azimuty startu), se porovnávaly bit po bitu a na macOS arm64 padaly o { "2" } až několik tisíc jednotek v posledním místě. Nyní se porovnávají v rámci { "1e-12" } měřítka převzatého z fixture; celá čísla, klíče a délky se stále porovnávají přesně a mutační test ukazuje, že relativní změna { "1e-6" } stále selže. Pin azimutu startu porovnává <c1/> a větev vzestupná/sestupná místo samotného azimutu, protože <c2/> zesiluje jednu ulp svého argumentu na asi { "3e-9" } rad tam, kde se sklon rovná kodélce místa. Žádná tolerance orákula ani předregistrovaný práh se nezměnily. Dva testy (lunární společné OD, lunární pozorovatelnost) nejsou pokryty: na macOS se samy jejich předregistrovaná porovnání pohybují a to je ponecháno na navazující práci.

seg-b6c354fa0c28 = <b><c1/> a <c2/> uplatňují příznaky front-endu.</b> Text nápovědy uváděl <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> u <c9/>, ale <c10/> a <c11/> řetězec nikdy nesestavily: příznaky se tiše ignorovaly a příznak bez hodnoty, například <c12/>, pohltil příznak za sebou. Oba příkazy je nyní parsují stejně jako <c13/> a před průchod akvizice a průchod sledování předřadí nový řetězec front-endu. Výstup se rovná spuštění příkazu na souboru, který pro stejné příznaky zapíše <c14/>.

seg-d7238dab610e = Data scény IQ se umísťují podle jednotlivých signálů.

seg-46ace9a3e008 = <c1/> (a <c2/>) vkládají bity { "50" } bit/s do každého signálu, včetně pilotních, a na Galileu a BeiDou rychlostí GPS LNAV. Data nyní sledují vlastní časování symbolů každého signálu, které udává nové <c3/> (<c4/>, nastavované každým konstruktorem v <c5/>). Je to { "10" } ms u L5-I5, { "4" } ms u E1-B, { "2" } ms u BeiDou B1I GEO (D2) a bity { "20" } ms s meandrem { "10" } ms u GLONASS L1OF. Data jsou odmítnuta na pilotech, na GPS L2C jako jediném proudu CM/CL a <c6/> na čemkoli jiném než L1 C/A. Vlastní kódy ve výchozím nastavení zachovávají dřívější časování { "20" } ms. Programový <c7/>, který požádal o <c8/> na kódu jiném než L1 C/A nebo o <c9/> na pilotu, se dříve generoval mlčky a nyní vrací chybu při prvním čtení.

seg-9dd38fa39d14 = Kanály GLONASS L1OF se akvirují a sledují na vlastní nosné FDMA.

seg-a775751ed6f6 = <c1/> a kanály sledování směšovaly každý kód dolů jen od <c2/>. V nahrávce GLONASS s více kanály proto hledání kanálu +{ "3" } našlo signál kanálu { "0" } (všechny kanály sdílejí jeden měřicí kód) a nikdy se nepodívalo o { "1.6875" } MHz výše. Obojí nyní používá <c3/>. Člen nosné je nulový pro každou nahrávku vystředěnou na vlastní nosnou signálu a je vynechán, není-li střed znám, takže zpracování CDMA se nemění. Pokud jste staré chování obcházeli zahrnutím <c4/> do <c5/> v doprovodném souboru, tento člen odstraňte: posun se nyní uplatňuje z nosné a středu, takže jeho ponechání ho uplatní dvakrát. Známé omezení, zde beze změny: scéna GLONASS identifikuje každý satelit podle jeho frekvenčního kanálu <c6/> a id satelitu <c7/> záporný kanál zalamuje. Soubor pravdy zapisuje <c8/> jako <c9/> { "4294967289" } (<c10/>). Čtěte jej zpět jako <c11/> s přetypováním na <c12/>.

seg-1c88bffc605b = <b>Vrstva GNSS IQ v CLI a Pythonu ({ "0.32.0" } fáze A).</b> Existující modul <c1/> je nyní použitelný bez psaní Rustu. Pět nových příkazů <c2/> se přidává do skupiny zpracování dat: <c3/> generuje dlouhou vícesatelitní scénu IQ do souboru s doprovodným souborem pravdy; <c4/> provádí FFT akvizici jednoho či více PRN nad nahrávkou a hlásí každou detekci (PRN, Dopplerův posun, fáze kódu, statistika, práh); <c5/> akviruje a poté spouští banku DLL/PLL/FLL nad nahrávkou a vydává výstup sledování po epochách (CSV/JSON) s konfigurovatelnými šířkami pásma smyček, integrační dobou a rozestupem korelátorů; <c6/> přehraje jednu nahrávku přes několik návrhů smyček a hlásí výsledné metriky jitteru a zachycení pro každý návrh; a <c7/> fituje model ztráty zachycení sledovací smyčky na časovou osu důvěry v přijímač. Stejné jádro je zpřístupněno Pythonu (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>) a vrací seznamy a slovníky přívětivé k NumPy. Pouze software a pouze přírůstkově: žádné nové závislosti, žádné vysílání, žádná syntéza signálu interference ani spoofingu; engine, akvizice, sledování a návrhy smyček jsou vlastní crate, takže volající z CLI či Pythonu dostane stejné bity jako testy v Rustu. Nový modul <c13/>; vlastní soubor pravdy scény je nezávislým orákulem v <c14/> (akvizice obnoví každou vloženou fázi kódu a Dopplerův posun, sledování konverguje k vloženému Dopplerovu posunu). Žádný zveřejněný počet druhů scénářů ani řádek verifikační matice se nemění.

seg-1971e3e9cfe6 = <b>Zbývající schopnosti knihovny GNSS IQ v CLI <c1/> a Pythonu ({ "0.32.0" } fáze A.2).</b> Navazuje na fázi A a zpřístupňuje zbytek vrstvy <c2/> bez psaní Rustu:

seg-67c485097357 = <b>Propagační kanál na <c1/></b> (a v Pythonu <c2/>): ionosféra prvního řádu (<c3/>/<c4/> nebo <c5/>), troposféra Saastamoinen/Niell (<c6/>), model scintilace Cornell (<c7/>, <c8/>, <c9/>), zrcadlové vícecestné šíření od země (<c10/>/<c11/>), třístavový pozemní mobilní kanál (<c12/>) a blok bez přímé viditelnosti (<c13/>) se uplatňují na každý satelit přes nový můstek interní pro crate (<c14/>), který převádí absolutní dráhy modelů kanálu do tvaru přebytku nad geometrií, jaký scéna používá.

seg-d736671f2251 = <b>Výstup SigMF na <c1/></b> (<c2/>): zapisuje vzorky jako dvojici <c3/>/<c4/> s capture a anotacemi pro jednotlivé satelity; <c5/>/<c6/> již SigMF čtou, takže scéna projde round-trip.

seg-c59ae97779ae = <b>DSP front-endu</b>: nový příkaz <c1/> a stejné příznaky u <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) spouštějí stupně <c10/> (pásmová FIR propust, adaptivní notch, pulzní blanking, excize ve frekvenční oblasti, AGC, kvantizér); v Pythonu zrcadleno jako <c11/>.

seg-878d66b73571 = <b>Scény s vysílanými efemeridami</b>: <c1/> (s <c2/>/<c3/>/<c4/>) umístí každý zdravý satelit GPS do jeho skutečné vysílané geometrie pomocí čtečky RINEX enginu, takže soubor pravdy nese skutečnou vzdálenost, Dopplerův posun a fázi kódu pro jednotlivé satelity; v Pythonu zrcadleno jako <c5/>. Pouze software a pouze přírůstkově: žádné nové závislosti, žádné vysílání, žádná syntéza signálu interference ani spoofingu (efekty šíření kanálem působí jen na legitimní signál). Každé číselné tvrzení je testováno proti nezávislé referenci (uzavřený tvar nebo vložená pravda) v unit testech kanálu a front-endu a v <c6/>.

seg-1e71370d87d8 = <b>Vrstva GNSS IQ: simulace na úrovni signálu a zpracování softwarovým přijímačem.</b> Nový modul <c1/> posouvá Kshanu od jednosatelitního front-endu L1 C/A s krátkými bloky k plné vrstvě na úrovni signálu, dosažitelné ze skupiny příkazů <c2/>. Generuje dlouhé vícesatelitní surové scény IQ s doprovodným souborem pravdy po epochách (<c3/>); uplatňuje šíření na úrovni signálu — ionosféru s divergencí kód–nosná, troposféru, amplitudovou a fázovou scintilaci (model Cornell), Fresnelovo vícecestné šíření a třístavový pozemní mobilní kanál, s variantou bez přímé viditelnosti (<c4/>); akviruje a sleduje pomocí FFT akvizice a vícekanálové banky DLL/PLL/FLL, přičemž jednu nahrávku přehrává přes mnoho návrhů smyček (<c5/>, <c6/>); modeluje front-end — filtrování FIR/IIR, kvantizaci na 1 až 14 bitů, AGC, notch, pulzní blanking a excizi ve frekvenční oblasti (<c7/>); streamuje velké zaznamenané datové sady v omezené paměti — formáty int8/int16/float32/zabalené 2bitové a reálné IF, vícesouborový SigMF, převzorkování, inventář datové sady s SHA-256 po souborech a dávkový běh (<c8/>); přidává rozprostírací kódy pro GPS L5/L2C, Galileo E1 (CBOC, skutečné paměťové kódy z ICD) a E5a, BeiDou B1C/B1I a GLONASS L1OF, každý ověřený proti svému dokumentu řízení rozhraní (<c9/>); a fituje model ztráty zachycení sledovací smyčky na pozorované chování skutečného přijímače v laboratorních bězích, s chybou při vynechání jednoho běhu (leave-one-run-out) a extrapolací označenou jako predikce (<c10/>). Každé číselné tvrzení je testováno proti nezávislé referenci (tabulka z ICD, uzavřený tvar nebo nezávislý přijímač obnovující vloženou pravdu); fyzikální modely kanálu a smyček zůstávají MODELLED. Jde pouze o softwarovou vrstvu: zapisuje soubory IQ pro softwarové přijímače a nesyntetizuje průběhy interference ani spoofingu ani neřídí rádiový hardware. Žádný zveřejněný počet druhů scénářů ani řádek verifikační matice se nemění. Návrh: <c11/>.

seg-943e21ccb25f = Důvěra v přijímač: posouzení záznamu skutečného přijímače GNSS.

seg-f8274120bff2 = <c1/> načte záznam u-blox UBX, RINEX { "3" } (s volitelným souborem vysílané navigace), Android GnssLogger nebo NMEA { "0183" } do jedné časově označené časové osy a nad ní spouští monitory důvěry: pokles poměru nosné k šumové hustotě (C/N0), ztrátu zachycení, automatické řízení zisku (AGC), indikátor rušení u-blox, skok polohy a, s RINEX a navigací, vlastní jednobodové řešení enginu s paritní autonomní monitorací integrity přijímače (RAIM) a monitor podporovaný hodinami. Každá epocha je nominální, degradovaná nebo nedůvěryhodná a výsledek říká, kdy a proč. Události a předpovězené poklesy C/N0 uvedené ve scénáři se hodnotí proti tolerancím uvedeným ve stejném souboru: detekováno, pozdě nebo zmeškáno a shoda nebo neshoda. Výstupem jsou výsledek JSON, CSV po epochách a graf; výsledek nese SHA-256 záznamu a každý práh. Dostupné je to také z Pythonu (<c2/>), z balíčku WebAssembly (<c3/>, záznamy vložené přímo) a z nového nástroje <c4/> serveru Model Context Protocol (MCP). Průvodce: <c5/>; příklad: <c6/>. Na záznamech spoofingu JammerTest { "2024" } cesta enginu reprodukuje první alarm předregistrovaného orákulového řetězce při každém zveřejněném nástupu (<c7/>). Monitory zůstávají MODELLED; žádný řádek verifikační matice se nemění.

seg-55669fe92932 = Menší vydání. Validační kola { "2" } a balíčky vlny 1 posouvají verifikační matici z { "223" } řádků ({ "93" } VALIDATED) ve verzi { "0.29.3" } na { "249" } řádků ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); každé povýšení bylo ověřeno proti nezávislému orákulu s tolerancí stanovenou před během a každý nesoulad je zveřejněn jako zjištění. Nově: nativní čtečka jader NAIF a cesta DE440, jedna ověřená cesta propagace a času SGP4 do ITRS, knihovna měřených hodin, referenční generátor LunaNet AFS, řešiče s rozšířenou přesností a odmocninové informační řešiče a zpracování skutečného lunárního IQ na datech LuGRE. Zveřejněná čísla, která se změnila, jsou uvedena níže jako revize.

seg-f75f1878045e = Dvacet sedm řádků verifikační matice se stává VALIDATED poté, co se nezávislé orákulum shodlo v toleranci stanovené před prvním porovnáním (pravidlo povýšení v <c1/>): deset v prvním validačním kole a sedmnáct ve druhém. Padesát jedna řádků MODELLED bylo v prvním kole předloženo vnějšímu orákulu a zbývající směrovatelné řádky ve druhém; každý nesoulad je níže zaznamenán jako zjištění, nikoli odlaďován. Tři řádky byly rozděleny, aby ověřená část nenesla neověřený zbytek, čímž se matice posouvá z { "223" } na { "226" } řádků; od té doby sloučené validační balíčky ji posouvají na { "249" }. Počty se čtou z generovaného <c2/>.

seg-8d542741fa77 = po kole { "1" }

seg-ae3743f976c5 = Řádky verifikační matice

seg-6c4b1fd56a31 = z toho VALIDATED proti vnějšímu orákulu

seg-90450fe87280 = z toho MODELLED

seg-86972e4c7f12 = z toho PARTNER

seg-61c5c5e308ed = Zkratky použité v tomto záznamu

seg-5907283b71da = Zkratka

seg-47e2e7d1a000 = ADD, ARAIM, MAAST

seg-0306daa1107f = Airborne Design Document (k ARAIM); pokročilá autonomní monitorace integrity přijímače; Matlab Algorithm Availability Simulation Tool Stanfordské univerzity

seg-f031f12836be = ADEV, VRW, ARW

seg-b32744d6f0c2 = Allanova odchylka; náhodná procházka rychlosti; náhodná procházka úhlu

seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

seg-d10345f7bfab = open-source astrodynamický toolkit (Nyx Space); toolkit NASA Spacecraft, Planet, Instrument, C-matrix, Events z jejího střediska Navigation and Ancillary Information Facility; jádro planetárních konstant

seg-0789b1b8dba2 = BCRS, TDB, TT

seg-584e509c80a5 = barycentrická nebeská referenční soustava; barycentrický dynamický čas; pozemský čas

seg-f03148ef3497 = BIPM, UTC(k)

seg-d6e01fbf4f10 = Mezinárodní úřad pro míry a váhy; realizace koordinovaného světového času v jedné laboratoři

seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; lunární časové soustavy zapisované v poli TIME_SYSTEM zprávy

seg-bed3cea7e74f = CRLB

seg-525ebb08f4bc = Cramérova–Raova dolní mez

seg-a1fff77503b4 = CW

seg-064470740a35 = relativní pohyb podle Clohessyho a Wiltshirea

seg-d70a9b3e92a7 = Development Ephemeris { "440" } Jet Propulsion Laboratory

seg-6f6e14685742 = DOP, PDOP

seg-08aad29b6845 = zhoršení přesnosti; zhoršení přesnosti polohy

seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

seg-e9ecdbb0f600 = rozšířený Kalmanův filtr; unscented Kalmanův filtr; inerciální navigační systém; globální družicový navigační systém; inerciální měřicí jednotka

seg-86765c7a6bbf = EMT, VPL, HPL

seg-23029e0ceed2 = efektivní práh monitoru; vertikální a horizontální ochranná úroveň

seg-27786c406107 = EOP, IERS, PCC, MAE

seg-9d0a1a9fdebc = parametry orientace Země; Mezinárodní služba rotace Země a referenčních soustav; Prediction Comparison Campaign; střední absolutní chyba

seg-1508f3d3a180 = ERFA, SOFA

seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

seg-900c7c7e99cd = GMAT

seg-0382d12eabc8 = General Mission Analysis Tool NASA

seg-025aec0f5e29 = NTN, SSB

seg-183dca4a747b = neterestrická síť (3GPP); blok synchronizačního signálu

seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

seg-9cebc1f9338d = Mezinárodní služba GNSS; Mezinárodní služba laserového měření vzdáleností; Mezinárodní terestrická referenční soustava { "2020" }

seg-eaca07ff8609 = ILS, LAMBDA

seg-b3cb3e6ea499 = celočíselné nejmenší čtverce; Least-squares AMBiguity Decorrelation Adjustment

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = mezisystémové zkreslení

seg-743c3303e01c = LEO

seg-d7b83e7c427f = nízká oběžná dráha Země

seg-1f76fe708934 = MHSS, PL, TPL

seg-a93515a6ff89 = separace řešení pro více hypotéz; ochranná úroveň; časová ochranná úroveň

seg-9e93c8223a11 = PSD, IQ, SigMF

seg-67248a79ac93 = výkonová spektrální hustota; vzorky ve fázi a v kvadratuře; Signal Metadata Format

seg-7dabf60fd17e = QPN

seg-dae80c23262e = šum kvantové projekce

seg-3ab6fb5e9394 = RAIM

seg-ebda65a9a20f = autonomní monitorace integrity přijímače

seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

seg-1aeedd26b9cd = družicový rozšiřující systém; americký Wide Area Augmentation System; dvoufrekvenční vícekonstelační; geostacionární družice SBAS

seg-eabf9641678b = RMS, SISRE

seg-50a677b8e972 = odmocnina ze středního kvadrátu; chyba vzdálenosti signálu ve vesmíru

seg-430b3c681347 = RTKLIB

seg-3e75054c0034 = open-source knihovna pro určování polohy GNSS

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-264e9e51b8f8 = interferometrie s velmi dlouhou základnou

seg-c3bc7d828ecc = Každý řádek níže uvádí druh svého orákula (Knihovna: nezávislá knihovna třetí strany počítající jednoznačně definovanou veličinu; Měřená data: skutečná naměřená data; P2: nezávislá numerická knihovna přepočítávající veličinu lineární algebry na uložených vstupech), orákulum, toleranci stanovenou před během a výsledek. Každé povýšení znovu spustil druhý recenzent, který bajt po bajtu znovu vygeneroval fixture a ukázal, že záměrná mutace enginu test obarví načerveno.

seg-be0a4e3ac81c = <b>Fúze senzorů GNSS/INS</b> (Knihovna), zúžená na volně vázaný 15stavový EKF chyb: NaveGo v1.4 (LGPL-3.0, spuštěno v GNU Octave) na vlastní skutečné jízdě s IMU/GNSS Ekinox. Horizontální, vertikální a inovační RMS polohy Kshany jsou { "0.912" }, { "0.940" } a { "0.861" } hodnot NaveGo (práh { "1.2" }) a její střední normalizovaná inovace je { "0.395" } (práh { "1.5" }). GNSS je přítomno po celou jízdu, takže se netestuje žádný výpadek. Těsně vázaný UKF a vázaný filtr hodin zůstávají mimo toto tvrzení.

seg-0c82afd5ba30 = <b>Rozpočet chyby 3-DOF orientace a zamíření</b> (Knihovna), zúžený na špičku gradientního momentu gravitace: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } případů, v rámci { "1e-12" } relativně (nejhorší { "2.1e-15" }). Rozpočet zamíření RSS je součet čísel dodaných volajícím a zůstává mimo něj.

seg-71cf58e91a09 = <b>Lunární společná geometrie komunikace a navigace</b> (Knihovna), zúžená na umístění místa, azimut, elevaci a vzdálenost: ANISE { "0.10.2" }, { "768" } vzorků, v rámci { "1e-6" } stupně a { "1" } mm (nejhorší { "2.2e-12" } stupně a { "5.6e-9" } m). Parametr přesnosti měření vzdálenosti je návrhový vstup mimo tvrzení.

seg-0687c757231b = <b>Dynamika orientace tuhého tělesa bez momentů</b> (Knihovna): těleso kosmické lodi Basilisk { "2.9.1" }, { "1e4" } s na dvou obecných tenzorech setrvačnosti, kvaternion a rychlosti v rámci { "1e-9" } (nejhorší { "3.3e-11" } a { "3.4e-12" } rad/s).

seg-d8c3f8cc65ac = <b>Řešení celočíselné nejednoznačnosti fáze nosné GNSS (LAMBDA)</b> (Knihovna), zúžené na řešení ILS a jeho dvě nejlepší normy: RTKLIB v2.4.2-p13 <c1/>, { "300" } kovariancí, { "0" } celočíselných neshod, normy v rámci { "1e-9" } relativně (nejhorší { "5.6e-13" }). Míra úspěšnosti metody bootstrap zůstává kontrolována pouze interně.

seg-c23196cbdc96 = <b>Složená časová PL, skalární MHSS</b> (P2): numpy { "2.3.5" } a scipy { "1.18.1" } na { "300" } uložených vstupech, PL v rámci { "1e-9" } relativně (nejhorší { "1.2e-10" }), řídicí podmnožina shodná.

seg-8f524d815949 = <b>Bělení souhlasného režimu GLS a Mahalanobisova identita</b> (P2): numpy { "2.3.5" } LAPACK na { "201" } uložených kovariancích, v rámci { "1e-12" } relativně (nejhorší { "7.9e-16" }); čísla podmíněnosti až { "19.3" }.

seg-b4136cdb8a98 = <b>Poskytovatel lunární orientace hlavních os z DE440</b> (Knihovna): SPICE <c1/> na binárním PCK v { "2 000" } epochách mimo uzly, v rámci { "1.7e-5" } rad (nejhorší { "1.7e-6" } rad, asi { "3" } m na povrchu), po opravě uvedené v části „Opraveno“.

seg-c28de00a491c = <b>Vstup a výstup nahrávek SigMF a Welchova spektra</b> (Knihovna), zúžené na čtení a zápis SigMF a <c1/>: scipy { "1.18.1" } <c2/> v rámci { "1e-12" } relativně na přihrádku (nejhorší { "6.0e-14" }); nahrávky sigmf-python { "1.13.0" } dekódované bitově shodně; metadata crate platná proti schématu SigMF { "v1.2.6" }. Syntéza IQ a její porovnání modelů zůstávají mimo.

seg-a7756d2e124a = <b>Fitter vysílaných efemerid LEO a SISRE vůči intervalu fitu</b> (Měřená data), zúžený na 16parametrový keplerovský fit a jeho SISRE jen z oběžné dráhy: přesné dráhy TU Graz ITSG čtyř satelitů proti statistikám Liu et al. { "2025" }, složky v rámci 1,5× ({ "0.804" } až { "1.087" }) a SISRE v rámci 1,5× ({ "0.716" } až { "0.809" }).

seg-99debd58724a = Zjištění

seg-3f5b2f54c7bf = Orákulum s těmito řádky nesouhlasilo, proto zůstávají MODELLED. Každé zjištění je také zapsáno do textu orákula řádku (a tím do <c1/>), s testem, který ho připíná.

seg-e28fac875d8c = <b>Odhad stavu palubních hodin:</b> na vynechaných hodinách IGS u { "11" } satelitů GPS Block IIF je třístavový filtr konzistentní o jeden krok dopředu, ale při jedné hodině je příliš sebejistý u { "9" } z { "11" } (periodické a flicker členy v modelu nejsou).

seg-5900ce454dc7 = <b>Detekce spoofingu:</b> na JammerTest { "2024" } nezaalarmoval žádný monitor na úrovni pozorování do { "10" } s od žádného z { "8" } zveřejněných nástupů a tři okna před nástupem nesla falešné poplachy.

seg-08b6e6aa7d08 = <b>Časová ochranná úroveň při spoofingu:</b> změřená nedetekovaná časová chyba přesahuje TPL u { "3" } z { "8" } detekovaných nástupů (1,9× až 5,3×); { "60" } s kalibrace hodin nepokrývá drift TCXO přijímače.

seg-a2f4df11d9cc = <b>Okno startu a geometrie výstupu:</b> proti Orekit { "12.2" } se geometrie shoduje v rámci zaokrouhlení, ale rychlost místa vlivem rotace Země nesplňuje { "1e-6" } relativně při šířce { "62.9" } stupně ({ "1.12e-6" }, pohyb pólu, který sférický model vynechává). Kolo { "2" }: rychlost pro skutečný pól s epochou se shoduje, výchozí rychlost bez epochy stále nesplňuje (viz níže).

seg-f6b6c9251a17 = <b>Koridor balistického návratu (Allen–Eggers):</b> předpovězené maximální zpomalení při návratu Stardust je { "61.8" } g proti rekonstruovaným { "32.89" } g (+{ "88" } %, tolerance { "15" } %).

seg-5d83648dd867 = <b>Společná chyba UT1 a pohybu pólu:</b> proti vzorci přesnosti vytištěnému ve { "178" } číslech IERS Bulletin A se pól shoduje v rámci 1,5×, ale UT1 ne ({ "0.48" } při { "10" } dnech, { "1.59" } při { "40" } dnech). Nahrazeno v kole { "2" }: řádek je nyní VALIDATED (viz níže).

seg-98a99bcba894 = <b>Výchozí offline vstup orientace Země:</b> astropy potvrzuje sčítání řádků, ale { "12" } řádků, které crate nazývá předpověďmi Bulletinu A, je označeno jako měřené (I), nikoli předpovězené (P). Údaje o shodě u řádku provozního prediktoru tedy byly proti měřeným řádkům. Nahrazeno v kole { "2" }: engine třídí řádky podle příznaku a řádek je VALIDATED.

seg-d96fbfa4be79 = <b>Chyba predikce orientace Země v provozním stylu:</b> chyba UT1 prediktoru je 2,4× až 12,6× chyba Bulletinu A při { "1" } až { "10" } dnech a { "5.32" } ms při { "10" } dnech, mimo rozsah { "0.36" } až { "3.13" } ms 2. EOP PCC.

seg-1833bf6e3b6f = <b>Lunární geodetická VLBI:</b> proti světelným časům ANISE přes DE440 není žádné zpoždění v rámci { "1" } ps; největší rozdíl je { "24" } µs, převážně analytický střed Měsíce (asi { "200" } km od DE440). Kolo { "2" }: cesta přes jádro je VALIDATED ve vlastním řádku; tato analytická cesta zůstává MODELLED.

seg-0ec8a2a91702 = <b>Lunární interoperabilní export:</b> Orekit { "12.2" } odmítá časové soustavy LTC a TCL, takže výměna lunárních souborů OEM s druhou čtečkou není prokázána.

seg-09cfd4e61b7b = <b>Relativní pohyb podle Clohessyho a Wiltshirea:</b> proti nelineárnímu pohybu Orekit při { "100" } m je rozdíl { "1.2" } až { "6.3" } mm, nad { "1" } mm; škáluje se jako vynechaný člen druhého řádu, takže předregistrovaná tolerance ležela pod chybou linearizace. Nahrazeno v kole { "2" }: korekce druhého řádu je VALIDATED proti stejnému prahu.

seg-af1bdd974ba5 = <b>Růst chyby INS/TRN při setrvačném letu:</b> proti volně setrvačnému Monte Carlo NaveGo zákony růstu platí v rámci { "5" } % do { "600" } s a za ním nadhodnocují (2,2× až 8× po jedné hodině), protože vynechávají Schulerovu zpětnou vazbu. Nahrazeno v kole { "2" }: model chyby podle Schulera je VALIDATED.

seg-8459bc50f8b4 = <b>Lunární servisní objem ze skutečné geometrie konstelace:</b> { "4" } z { "12" } zveřejněných statistik dostupnosti se liší o více než { "2" } procentní body (až { "22.5" }).

seg-7a0fd1377b9c = <b>Horní mez zkreslení návaznosti heterogenního UTC(k):</b> na { "105 024" } řádcích BIPM je horní mez překročena u { "50.8" } % řádků; zveřejněná nejistota ohraničuje měření odchylky provedené BIPM, nikoli samotnou odchylku.

seg-814acf34cffd = <b>Klasifikace nulového prostoru lunárního datumu:</b> na zveřejněné geometrii pěti odražečů je korelace -0,78 proti -0,97 a CRLB počátku je o { "96" } až { "98" } % pod hodnotou z článku.

seg-da01b5e08a87 = <b>Substrát geometrie datumu lunárního LLR:</b> proti { "192" } lunárním normálním bodům ILRS z roku { "2024" } bylo RMS jednosměrného rezidua { "96" } m s dřívější interpolací orientace a po níže uvedené opravě je { "22.7" } m, stále nad prahem { "10" } m (zaokrouhlené souřadnice stanic, bez pohybu pólu). Řada orientace mimo 2024–2025 mlčky ořezává. Kolo { "2" }: model změřené vzdálenosti je VALIDATED ve vlastním řádku ({ "2.81" } m); řada nyní pokrývá 2014–2030 a mimo ni hlásí chybu.

seg-fd9ad94680e9 = <b>Vazba relativistické rychlosti hodin na soustavu:</b> člen vlastního potenciálu je o { "3.18e-4" } nad zveřejněnou hodnotou (tolerance { "1e-4" }); článek vyhodnocuje jiný potenciál, takže zveřejněná hodnota tohoto uzavřeného tvaru neexistuje. Nahrazeno v kole { "2" }: rovníkový potenciál stupně 2 je VALIDATED proti stejnému článku.

seg-e002819c1e2d = <b>Fyzikální konstanty každého tělesa sluneční soustavy:</b> { "12" } z { "84" } konstant přidaných těles se liší od NAIF pck00011 a gm_de440 (starší elementy satelitů Marsu; jiná řešení GM pro Uran, Neptun a Pluto). Kolo { "2" }: konstanty nyní sledují NAIF (přepis, nezapočítává se) a vypočtená orientace se shoduje se SPICE; řádek zůstává MODELLED.

seg-e722d242e78e = <b>Volitelné modely efemerid LEO:</b> 22parametrový fit nechává 1,71× a 1,86× zveřejněné chyby ve směru dráhy na obloucích { "20" } min, nad 1,5×. Nahrazeno v kole { "2" }: 22parametrový model a fit jsou VALIDATED ve vlastním řádku.

seg-c136023752df = <b>Společné určování polohy GNSS a LEO:</b> mezisystémové zkreslení se shoduje s RTKLIB, ale { "93.2" } % epoch je v rámci { "3" } m od ITRF2020 proti { "95" } %; samotný RTKLIB na datech dosahuje { "88.2" } % ({ "93.6" } % po opravě skupinového zpoždění v kole 2).

seg-e5f0e3c21def = <b>Slepota integrity vůči souhlasnému režimu</b> a <b>mapy pokrytí a DOP:</b> obě porovnání prošla, ale při revizi byla zamítnuta, protože je projde i záměrně chybný engine (první kontroluje jen vnitřní identitu; zveřejněné spodní hranice druhého nemohou zaznamenat zdvojené PDOP). Kolo { "2" }: slepota integrity vůči souhlasnému režimu je VALIDATED na vstupech s paritou; mapy pokrytí zůstávají zjištěním (viz níže).

seg-688e1753cd53 = Validační kolo { "2" }

seg-b320fbdb72c3 = Druhé kolo vzalo každý řádek, který první kolo nechalo směrovatelný, s novými předregistracemi zapsanými před stažením jakéhokoli fixture nebo spuštěním jakéhokoli orákula, s kontradiktorním druhým recenzentem, který znovu spustil každé porovnání, a se záměrnou mutací enginu, která musí každý test obarvit načerveno. Vlastník přijal opravené znění řádku meze mimo Omega dne 2026-10-02, než byl povýšen (jeho starý text odporoval kódu).

seg-7b7c584caaaf = <b>Povýšeno na VALIDATED ({ "17" }).</b> Druh orákula v závorce; tolerance stanovena před během.

seg-555e6ad454d2 = <b>Vazba relativistické rychlosti hodin na soustavu</b> (Reference): L_m podle Ashbyho a Patly { "2024" } v rámci { "2.8e-6" } (práh { "1e-4" }) z rovníkového potenciálu stupně 2 obou polí, která článek cituje; gravitace pyshtools stupně 350 pro radiální vstup ({ "8.3e-5" }); lunární rychlost DE441 ({ "2.5e-3" }).

seg-0c01fac44708 = <b>Výchozí offline vstup orientace Země</b> (Knihovna): astropy { "8.0.1" } a IERS Bulletin A č. { "039" } potvrzují { "30" } finálních, { "54" } rychlých a { "90" } předpovězených řádků znovu sestaveného výřezu.

seg-b77253dd26b5 = <b>Společná chyba UT1 a pohybu pólu</b> (Knihovna): úplné rotace astropy a pyerfa reprodukují společnou tabulku (UT1 a pól v rámci { "6e-16" }, kombinace v rámci { "1.9e-7" }); realizované chyby z IERS Annual Report { "2019" } dávají poměry { "1.001" } až { "1.100" }.

seg-378414f812c1 = <b>Stopa a pokrytí užitečného zatížení EO</b> (Knihovna): Orekit { "12.2" } a GeographicLib { "2.1" } při každém předregistrovaném prahu, s nodální regresí J2 nyní v rozestupu uzlů.

seg-792bf58a1c1e = <b>Relativní pohyb podle Clohessyho a Wiltshirea</b> (Knihovna): s korekcí druhého řádu v uzavřeném tvaru v rámci { "1.2e-7" } m od nelineárního pohybu Orekit proti { "1e-3" } m; samotná lineární matice zůstává charakterizována ({ "1.2" } až { "6.3" } mm).

seg-423437d90022 = <b>Cílení v rovině B a gravitační manévr v patched-conic aproximaci</b> (Knihovna): GMAT R2026a rovina B, asymptoty, C3 a heliocentrické elementy; sbpy { "0.6.0" } a Kasuga a Jewitt { "2019" } pro Tisserandův parametr.

seg-b29b0dfcd3a4 = <b>Růst chyby INS/TRN při setrvačném letu</b> (Knihovna): devítistavový model chyby podle Schulera v rámci { "5" } % opravených běhů NaveGo ve všech { "48" } bodech (nejhorší { "3.70" } %).

seg-8cc49496b4c6 = <b>Slepota integrity vůči souhlasnému režimu</b> (P2): numpy <c1/> na { "1464" } vstupech s paritou v rámci { "1e-12" } (nejhorší { "1.06e-14" }).

seg-f0ff538b7329 = <b>Lunární společná vícetechnologická OD a hodiny</b> (P2): numpy přepočítává každý krok Gauss-Newton, sigmu a chybu stanice na šesti sítích (v rámci { "2.4e-11" }) po opravě řešení QR.

seg-7ed9b059f888 = <b>Kovariance souřadnic stanic lunární VLBI</b> (Knihovna): Jacobián sestavený ve SPICE reprodukuje rozvrh, spektrum, sigmy a nulový prostor v rámci { "1" } % a { "0.1" } stupně; numpy do { "2e-13" }.

seg-0e4e1c3fc899 = <b>Nedetekovatelná mez souhlasného režimu pro rezidua mimo Omega</b> (P2, znění opraveno rozhodnutím vlastníka): numpy LAPACK na { "256" } případech v rámci { "1e-12" }, šest přesných nekonečen.

seg-0fc8ce9cde6c = <b>Klasifikace nulového prostoru invariantní vůči bázi</b> (P2): průnik podprostorů v SciPy a NumPy na { "72" } sestavených maticích, celá čísla přesně, norma projektoru v rámci { "6.0e-15" }.

seg-4e5e7a6072bc = <b>Jednofrekvenční ionosférické služby a služby UTC navigační zprávy LEO</b> (Knihovna): GNSSTk { "15.3.1" } pro Klobuchar, Az a drift UTC; ERFA pro tři případy přestupné sekundy.

seg-a644bf49c816 = <b>Mez určování polohy v neterestrických sítích 5G</b> (P1): meze jednoho SSB podle Bachla, Leie a Nabeela { "2026" } v rámci půl vytištěné číslice; numpy pro kovariance řešení.

seg-b326f6fc55ad = <b>Model změřené vzdálenosti LLR</b> (Měřená data, nový řádek oddělený od substrátu datumu LLR): { "192" } lunárních normálních bodů ILRS při { "2.81" } m RMS proti prahu { "10" } m, s barycentrickým světelným časem IERS { "2010" }; složky pod prahem se neřeší jednu po druhé a řádek to říká.

seg-82e9fba684dc = <b>Lunární geodetická VLBI, cesta přes jádro</b> (Knihovna, nový řádek oddělený od řádku lunární VLBI): konvergované světelné časy SPICE v rámci { "1" } ps a parciální derivace v rámci { "1e-6" } v epochách blízko J2000; analytická výchozí cesta zůstává MODELLED.

seg-03c47d262ff3 = <b>22parametrový model efemerid LEO podle Liu et al. { "2025" } a jeho fit</b> (Měřená data, nový řádek oddělený od řádku volitelných modelů): skutečné přesné dráhy v rámci 1,5× zveřejněných statistik ve dnech z článku i ve vynechaných dnech ({ "0.683" } až { "1.186" }); konvence škály n_dot je přepsána a tímto porovnáním není ověřena a pravidlo zastavení je Kshanino pravidlo konvergence parametrů, nikoli pravidlo změny RMS z článku. Polynom ATOMIC a tabulka pěti výšek zůstávají MODELLED.

seg-b49f96eb52ad = Stávající řádky VALIDATED znovu podložené (bez změny počtu).

seg-4e26bec3297c = <b>Polohy planet z elementů JPL Standish</b> a <b>světelný čas mezi tělesy sluneční soustavy</b>: dodatečné prahy dvojnásobku nominální hodnoty jsou nahrazeny předregistrovanými porovnáními s JPL Horizons DE441 (RMS nejvýše hodnota z tabulky { "8.10.1" } Explanatory Supplement, nejhorší { "0.778" }, včetně rozdělení Země a rotace ICRF; světelné časy v rámci { "1e-6" } s od Horizons na polohách DE441, nejhorší { "6.7e-9" } s). Jejich příznaky „limit stanoven po porovnání“ jsou odstraněny.

seg-d3b745392d29 = <b>Integrita (RAIM/ARAIM/SBAS)</b>: řádek se už nespoléhá na kontroly věrohodnosti. Nyní uvádí: separace řešení pro více hypotéz ARAIM podle ADD v4.2 se shoduje se Stanford MAAST pro ARAIM { "2" } na { "270" } skutečných případech (nejhorší rozdíl VPL { "2.2e-3" } m proti { "0.05" } m); detekce a vyloučení snapshotového RAIM se shodují s RTKLIB <c1/> v { "2016" } z { "2016" } rozhodnutí, s ochrannou úrovní sklonu v rámci { "2.7e-12" } m; ochranné úrovně SBAS DO-229E L1 se shodují se Stanford MAAST na skutečných vysíláních WAAS ({ "2868" } dvojic v rámci { "1.6e-5" } m). Jasně uvádí, že funkce s jednotnou sigmou <c2/> a <c3/> NEODPOVÍDAJÍ ADD (rozdíly při shodných vstupech 0,75/4,04 m a 0,39/1,93 m VPL/HPL, zjištění), že porovnání DFMC L5 SBAS je zjištěním ({ "308" } dvojic bez GEO v dohledu Kshana chrání a MAAST nikoli) a že <c4/> nemá žádné vnější porovnání. Jeho vlastní příznak je odstraněn.

seg-d059b9953c3f = <b>Fitter vysílaných efemerid LEO</b>: integrovaná pravá dráha je přidána k ověřené části (Orekit { "12.2" } v rámci { "4.55" } mm za { "6" } h, práh { "2" } cm); korekční polynomy, fit hodin a kompromis periody aktualizace zůstávají modelované.

seg-166d511bbba3 = <b>Zjištění a blokované řádky (zůstávají MODELLED).</b> Text orákula každého řádku nese zjištění a jeho připnutý test.

seg-7f233dbdf110 = Modulace navigačního signálu (Betz { "2001" }, Hein { "2006" }): spektra a korelace se shodují; postranní laloky { "24" } MHz a každé zkreslení od vícecestného šíření (o { "11" } až { "15" } % nízké) ne, příčina nevyřešena.

seg-4d5a6bb44d64 = Geolokace TDOA/FDOA: meze odpovídají Ho a Chan a Ho a Xu i kódu autorů s přesností { "3e-12" }; faktory z Ottawy vytištěné z Monte Carlo se liší o { "1.3" } % a { "4.4" } %.

seg-5fa189f788ca = GNSS Země ve vzdálenosti Měsíce: zenitové průměry GENESIS se shodují s Montenbruck et al. { "2023" } v { "5" } z { "6" }; nadirové průměry jsou o { "1.0" } až { "2.4" } satelitu vyšší.

seg-d7e5b5a64f43 = Mapy pokrytí a DOP: návrhy pro Zemi se shodují s Orekit, gnss_lib_py a numpy při každém prahu; návrhy pro Měsíc a Mars překračují { "1e-9" } jen v téměř singulárních buňkách.

seg-3c8fb07d83ec = Společné určování polohy GNSS: dvoufrekvenční { "79.9" } % a přesné produkty { "94.2" } % v rámci { "3" } m proti { "95" } % (RTKLIB { "67.9" } % a { "94.1" } %); rozdíl ISB u přesných produktů je tím, že RTKLIB ignoruje posuny antén.

seg-5d3d4d99fbc4 = Sledovací smyčky (GNSS-SDR { "0.0.19" }): shoda při { "35" } až { "45" } dB-Hz; při { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, prahy +{ "1.5" } dB; doby do proklouznutí o { "0.5" } až { "2" } řádu kratší.

seg-0dd24947169c = Lunární servisní objem (Orekit a Hipparchus): { "155" } ze { "160" } hodnot se shoduje; požadavek na nejhorší vzorek selhává na téměř singulární geometrii LNCSS B.

seg-74002245287f = Kvantový inerciální senzor: spodní mez jen pro QPN je o { "21" } až { "31" } % pod změřeným šumem podle Gauguet { "2009" } (práh { "30" } %, minuto o { "0.5" } bodu).

seg-ab8b17cf325e = Předvolby oscilátorů: změřené kusy překračují předvolby holdoveru rubidia, krátkodobé stability cesia a nejhoršího kusu CSAC; předvolba OCXO nemá žádný změřený záznam.

seg-81ad9b839a28 = Hustota podle kosmického počasí: Jacchia { "1971" } je v rámci faktoru { "2" } od hustot z akcelerometrů při slunečním maximu, ale asi 1,7× příliš hustá v minimu { "2008" }.

seg-68e5d0942847 = Šikmé TEC bez geometrie: { "33" } z { "36" } oblouků v rámci { "3" } TECU od mapy CODE (nejhorší { "6.84" }).

seg-f410ce9cf195 = Detekce spoofingu a TPL proti oficiálnímu záznamu JammerTest { "2024" }: { "4" } z { "10" } nástupů detekováno včas; TPL je překročena u { "4" } z { "10" }.

seg-41eb2c318469 = Filtr hodin na čerstvých hodinách IGS: dva z { "11" } satelitů nesplňují kritérium součtu inovací.

seg-064b623e918b = Prediktor EOP metodou nejmenších čtverců plus autoregrese: UT1 { "1.73" } až 2,11× Bulletin A při { "2" } až { "10" } dnech.

seg-d98571cc21f4 = Horní mez realizované odchylky UTC(k): souhrnné překročení { "0.0333" } proti { "1e-2" }.

seg-527aca91ec7c = Lunární datum soustavy z kampaně: větev SPICE se shoduje; větev P2 s odhadovanými stanicemi nesplňuje { "1e-9" } na úloze s podmíněností 2.1e8.

seg-9805c4c821f9 = Lunární datum soustavy ze skutečného LLR: { "15" } z { "16" } hodnot se shoduje se SPICE; sigma z-translace je o { "1.03" } % vysoká proti { "1" } %.

seg-08e6c541b59e = Návrat do atmosféry (Allen-Eggers): řešení hmotného bodu se shoduje s rekonstrukcemi agentur (pouze křížová kontrola); porovnání s akcelerometrem je blokováno kvůli čitelnému zdroji Hayabusa2.

seg-0bb78ffbd915 = Masky ITU-T: vytištěné vzorové hodnoty se shodují; limity tříd G.8273.2 žádné nemají (blokováno).

seg-308c1bca3fd9 = Geometrie okna startu: rychlost místa podle skutečného pólu s epochou se shoduje s Orekit ({ "4.9e-8" }); výchozí rychlost bez epochy stále nesplňuje ({ "1.12e-6" }). Nepovýšeno; navazující práce čeká.

seg-f0b7c3d60df8 = Fyzikální konstanty každého tělesa: nyní se { "0" } z { "84" } liší od NAIF (přepis) a vypočtená orientace se shoduje se SPICE s přesností { "1.4e-10" } rad. Nepovýšeno; navazující práce čeká.

seg-a5a787c9a761 = Blokováno rozhodnutím vlastníka o vymezení, u každého s uloženým souhlasným porovnáním: lunární pozorovatelnost absolutních stanic, DOP povrchových majáků, export mimo osu, detekční výkon napříč modalitami, statistika konzistence souhlasného režimu a pokrytí polárním LEO.

seg-cf638ec9878b = Blokováno daty: rozpočet chyb přenosu času (potřebuje redukci skutečných dat), C/N0 JammerTest (poloha antény a rozdělení výkonu nejsou zdokumentovány).

seg-e8709509eef3 = Revize (zveřejněná čísla, která se změnila, staré -> nové).

seg-5e93ab237b15 = Ochranné úrovně <c1/> jsou nyní na geodetické lokální úrovni místo radiální: až { "0.31" } m HPL a { "0.14" } m VPL na ABMF ({ "16" } stupňů s. š.); žádný golden se nezměnil, ale zaznamenané shrnutí tutoriálu <c2/> se mění ze střední HPL { "22.1" } m / VPL { "40.0" } m na { "22.2" } m / { "39.9" } m (<c3/>).

seg-c14361b2cb1f = Výchozí hodnoty vazby lunární rychlostní soustavy: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } na metr.

seg-8ac9cb8c5631 = Výchozí offline běh EOP (<c1/>, buňky uvedené v <c2/>): predicted_rows { "12" } -> { "90" }; spodní mez pólu { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; řádky tabulky { "2" } v <c3/>; shoda provozního prediktoru 0,256/0,695/1,252/3,885 ms -> 0,133/0,421/0,839/2,786 ms.

seg-dd93329245ba = <c1/> liu22 SISRE dráha/s hodinami: { "60" } s 0,011/0,046 -> 0,014/0,046 cm; { "300" } s 0,068/0,139 -> 0,074/0,142 cm; { "600" } s 0,269/0,299 -> 0,258/0,290 cm.

seg-e4205dfdb0d2 = Tabulka výšek Liu, Kshana (poměr): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

seg-4655e8ee7bab = Škála <c1/> navigační zprávy LEO { "2" }^-60 -> { "2" }^-58 (nebylo předregistrováno, zveřejněno; mimo porovnání fitu); CRC vzorkového rámce liu22 0x62373A -> 0xDED99C.

seg-3f565c0ca2bf = Verifikační tabulka <c1/>: řádek Liu a ATOMIC rozdělen na řádek 22parametrového modelu VALIDATED a řádek ATOMIC a pěti výšek MODELLED.

seg-537f5d80b66c = Text řádku lunární orientace hlavních os z DE440: rozsah 2024-2025 / { "731" } řádků -> 2014-2030 / { "6 209" } řádků; „mlčky ořezává“ -> chyba mimo svůj rozsah.

seg-17a5dd090566 = Scénář <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; nová pole inclination_deg ({ "98.19" }) a nodal_period_min ({ "98.893" }).

seg-6ce48a53df35 = <c1/> (referenční hodiny TDOP/GDOP jsou nyní nejnižší číslovaná konstelace v dohledu): globální GDOP max { "2.2236" } -> { "2.1205" }, průměr { "1.122" } -> { "1.131" }, medián { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" } a mapa GDOP po buňkách; mean_visible_by_constellation se sčítá jako celá čísla (asi { "1e-12" } relativně, neviditelné na { "4" } desetinných míst).

seg-e48b212c4881 = Společné jednofrekvenční řešení GNSS po opravě vysílaného skupinového zpoždění: { "93.2" } % -> { "93.6" } % v rámci { "3" } m; medián ISB -0,351 -> -0,114 ns.

seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (Costasova smyčka SNR rho/4): na prahu { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; při { "25" } dB-Hz { "9.55" } -> { "1.60" }; při { "22" } dB-Hz { "2.24" } -> -0,14.

seg-789a302679f7 = <c1/>: každý výstup se mění s modelem chyby podle Schulera; špička TRN dodaného scénáře { "52.932679" } -> { "44.711834" } m (<c2/>).

seg-9d65f2ce8715 = Zpráva <c1/>: nový klíč geometry_path („analytic“ při výchozím běhu, žádná číselná hodnota se nezměnila); nová volitelná pole planetary_kernel_path, earth_orientation_kernel_path a moon_orientation_kernel_path, s epoch_partials na cestě přes jádro; popis druhu je přepsán. Orákulem cesty přes jádro u verifikačního řádku je SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) se stává křížovou kontrolou vyhodnocení jádra.

seg-3631a31e7b26 = Konstanty těles: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uran { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluto { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); rovníkový poloměr Phobosu { "13.1" } -> { "13.0" } km; pól a nultý poledník Phobosu a Deimosu z pck00011; prime_meridian_deg sluneční soustavy nyní zahrnuje kvadratické a periodické členy.

seg-ac1251d7a0fd = <c1/> (<c2/> na Europě) z úplné orientace Europy podle pck00011 (7cfd66b4; orientace se shoduje se SPICE pxform s přesností { "1.4e-10" } rad), která posouvá lander v inerciálním prostoru: dostupnost jen relé / se vzdáleností k Zemi { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } ze { "171" } epoch jen relé), mediánové PDOP { "5.266" } -> { "5.360" }, RMS chyby řešení { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, mediánová formální sigma { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Tabulka v <c3/> a pin v <c4/> následují; <c5/> se nemění.

seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), kalibrovaný faktor nahrazen Jacchia { "1971" }: activity_density_kg_m3 při 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1,076/1,121/1,168/1,216/1,320 -> 1,492/1,860/2,322/2,881/3,232; reference_exospheric_temperature_k odstraněno, mean_exospheric_temperature_k přidáno ({ "1186.7" } K); <c2/>: sluneční cyklus při { "800" } km nyní kolísá 10,4× (NRLMSISE-00 13,6×) a tvrzení o výšce sleduje vzestup NRLMSISE do { "500" } km a pokles při { "800" } km.

seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (text shrnutí beze změny na { "2.09" } / { "25.94" } m).

seg-6a6fb57d177e = <c1/> (řešení QR): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

seg-76c94424e828 = <c1/> znovu vygenerováno pro nová a odstraněná pole uvedená výše.

seg-717c51e1cca0 = Validační balíčky

seg-4ec44f8a5f8e = D12, rozšířená přesnost a odmocninový řešič (dva nové řádky VALIDATED: { "226" } -> { "228" } řádků, { "110" } -> { "112" } ověřených).

seg-d28005966948 = Část { "1" }, orákulum s rozšířenou přesností:

seg-9a5f94973450 = Lunární datum soustavy s odhadovanými stanicemi: 50místné orákulum s rozšířenou přesností mpmath (předregistrováno 804662d5, prahy škálované podmíněností z apriorního vzorce zpětné chyby) se shoduje na novém datu kampaně (2026-03-18) i na původním scénáři z 2024-01-01; nový řádek VALIDATED pod P2. Rozhoduje dřívější spor o dvojitou přesnost: sigmy datumu enginu se liší až o { "9.7e-6" }, inverzní a eigen cesty v NumPy až o { "6.2e-6" } a jeho cesty Cholesky a QR asi o { "1e-8" }. Engine je v rámci své meze chyby, ale asi tisíckrát méně přesný než faktorizační cesta.

seg-b055435a2138 = Prostředí orákula: přidáno mpmath { "1.3.0" }.

seg-d0c2b2a8e635 = Revize: žádné. Žádný golden soubor ani zveřejněný obrázek se nemění; řádek „Lunární datum soustavy z pozorovací kampaně“ zůstává MODELLED (rozhodnutí zakladatele 2026-10-02, varianta A: nepůjčuje si stav samostatného řádku); jeho text testů cituje nový test a jeho zjištění.

seg-50b53908fb7c = Část { "2" }, odmocninový informační řešič datumu:

seg-4c6089cfac5e = Nový volitelný odmocninový informační řešič (<c1/>; <c2/> ve scénáři lunar-frame-campaign): Householderova QR, marginalizace přes trojúhelníkový faktor, Jacobiho SVD pro spektrum a kompenzované součiny pouze ze správně zaokrouhlených operací. Proti 50místnému orákulu (předregistrováno b41908c9) se jeho sigmy datumu shodují s přesností { "3e-13" } na novém datu (2026-06-09); na vstupech 2026-03-18 a 2024-01-01 je výchozí řešič mimo až o { "1e-5" }. Nový řádek VALIDATED pod P2. Výchozí řešič a jeho výstup se nemění. Předregistrované prahy potvrzují chyby jen nad asi { "2e-7" } relativně: výchozí řešič odmítnou, ale nikoli obrácené znaménko Householderovy transformace, nekompenzovaný skalární součin ani spektrální konečnou inverzi, a řádek to říká.

seg-de9aeb2adde0 = Volitelné odmocninové cesty vedle nezměněných výchozích: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> a <c6/>, na nových <c7/> a <c8/>. Každá se shoduje se svou výchozí tam, kde jsou obě přesné (vnitřní kontrola, žádný řádek; pro ně se netvrdí žádná validace). <c9/> nyní deleguje na sdílenou rutinu; jeho výstup i výchozí výstup každého scénáře se nemění.

seg-87a632404f32 = Rozhodnutí o hodnosti v lunární kampani soustavy: předregistrovaná kontrola s rozšířenou přesností za { "40" } dnů potvrzuje každé rozhodnutí o bloku stanic a o Helmertově transformaci plné hodnosti, které lze rozhodnout. Apriorní mez nemůže potvrdit { "20" } dnů Helmertovy transformace s deficitem hodnosti; v přesné aritmetice je jejich defekt geometrický, s prahem { "1e-9" } uvnitř přirozeného rozsahu poměrů vlastních čísel kampaně. Žádný řádek.

seg-3b24e7fa36bf = Tvrzení řádku kampaně s rozšířenou přesností je zúženo na „v rámci meze nejhoršího případu“ a jeho kontrola nejslabšího směru při pevných stanicích nyní měří skutečný úhel ({ "6.6e-16" } rad; komparátor se změnil z acos na tětivu, práh ne).

seg-4fad02ab4b6d = Revize: žádné. Žádný golden soubor ani zveřejněný obrázek se nemění; řádek „Lunární datum soustavy z pozorovací kampaně“ se nemění a zůstává MODELLED (rozhodnutí zakladatele 2026-10-02, varianta A).

seg-627d3357d620 = D4, páteř jádrových efemerid JPL, fáze { "1" } (čtyři nové řádky VALIDATED: { "228" } -> { "232" } řádků, { "112" } -> { "116" } ověřených).

seg-30e8a645191f = Čtečka jader NAIF má vlastní řádek.

seg-98ff121aa2a9 = <c1/> (kontejner DAF, SPK typu { "2" }, binární PCK typu { "2" }) se shoduje se SPICE Toolkit (CSPICE N0067 přes spiceypy { "8.2.0" }) a s ANISE { "0.10.6" } na všech { "600" } stavech DE440 a { "200" } rotacích lunární orientace náhodné mřížky odvozené z vlastního hashe předregistračního commitu (abcd9133), v rámci prahů odvozených předem z vyhodnocení Čebyševových polynomů v dvojité přesnosti (nejhorší { "0.6" } % prahu, { "1.95e-3" } m). Řádek tvrdí, že engine čte jádra JPL správně, nikoli že DE440 nebo analytická řada je přesná (<c2/>).

seg-e0b5ea7af969 = <b><c1/></b>: polohy z DE440 (nebo libovolného SPK typu 2) přes vlastní čtečku enginu, s dvoudílnými epochami TDB a SHA-256 jádra uchovaným pro zprávy; nikdy nenahrazuje barycentrum soustavy planetou. <c2/> umožňuje cestě geometrie zvolit analytickou řadu (výchozí) nebo jádro.

seg-6c7dae98601e = <b>Volitelný Měsíc z jádra pro <c1/> a <c2/></b>: klíč <c3/> čte geocentrický střed Měsíce z jádra; nic jiného se nemění a zpráva získává blok <c4/> pojmenovávající jádro a jeho SHA-256. Bez klíče jsou obě zprávy bajt po bajtu shodné s dřívějšími.

seg-74e8def84747 = <b>Kovariance bodu na lunárním povrchu na cestě přes jádro</b> (nový řádek VALIDATED): při všech pevných stanicích a majáku na Měsíci z DE440 se kovariance majáku shoduje s Jacobiánem světelného času ve SPICE (nejhorší { "1.7e-3" } proti prahu { "1" } %) a s inverzí v NumPy ({ "4e-14" } proti { "1e-9" }), předregistrováno 4a51256 (<c1/>). Řádek analytické cesty zůstává MODELLED: na analytickém Měsíci je jeho nejmenší sigma majáku o { "3.9" } % pod orákulem.

seg-55002d236ab0 = <b>Lunární datum soustavy ze skutečné kampaně, střed Měsíce z jádra</b> (nový řádek VALIDATED): na { "447" } neviděných normálních bodech 2019-Q2, předregistrováno 830d945a dříve, než byl kterýkoli stažen, se kovariance datumu na cestě přes jádro shoduje s nezměněným orákulem SPICE a NumPy v rámci { "7.6e-5" } proti prahům { "1" } % a { "2" } % (<c1/>). Zakladatel rozhodl, že tento řádek se povyšuje jen na čerstvých bodech; diagnostika na již viděných datech (c51f8b2) je zjištěním, nikoli důkazem. Práh modely Měsíce nerozlišuje: analytický Měsíc na stejném výřezu také projde (nejhorší { "3.8e-3" }), plánovaná mutace (Měsíc z jádra o hodinu opožděný) nebyla zachycena a při foldu prošel i střed Měsíce chybný asi o { "4,650" } km (Měsíc vzatý kolem barycentra soustavy Země–Měsíc). Řádek tvrdí kovarianci na této cestě, nikoli střed Měsíce, a říká to.

seg-f147f9257b8b = <b>Polohy Slunce, Měsíce, Merkuru a Venuše z DE440 v epochách UTC</b> (nový řádek VALIDATED): <c1/> se shoduje se Skyfield { "1.54" } na { "600" } polohách mezi { "1973" } a { "2026" }, nejhorší { "2.96" } m, v rámci předregistrovaného prahu (0bfafe6d) daného dvoučlennou řadou TDB − TT (<c2/>). Polohy planet dostávají nyní tento nový řádek jádra; řádek Standish a řádek planetárních měsíců se nemění a měsíce čekají na scénář, který je potřebuje (rozhodnutí zakladatele).

seg-bb840641c655 = Zjištění: jediné minutí porovnání datumu LLR (sigma z-translace { "1.025" } % proti { "1" } %) klesá na { "0.049" } %, když se z DE440 čte jen střed Měsíce, na již viděných datech (<c1/>); na čerstvém výřezu { "2019" } projde i analytický Měsíc, takže minutí v { "2015" } bylo okrajové vůči geometrii onoho čtvrtletí. Analytické řádky „Lunární datum soustavy ze SKUTEČNÉ pozorovací kampaně“ a „Kovariance souřadnic bodu na lunárním povrchu … oddělená od kovariance pozemní stanice“ zůstávají MODELLED; jejich texty orákula nyní odkazují na řádky cesty přes jádro.

seg-64c9f3b96392 = <c1/> už neříká, že engine nemá čtečku binárních jader; odkazuje na řádek čtečky a vysvětluje, proč jádra kosmických lodí (typy { "13" } a { "21" }) stále přicházejí přes Horizons.

seg-841deceb80e6 = Revize: žádné. Žádný golden soubor, zveřejněný obrázek ani stávající testovací hodnota se nemění; analytické zprávy <c1/>, <c2/> a <c3/> s pevnými všemi stanicemi jsou bajt po bajtu shodné s dřívějšími (prefixy SHA-256 výsledku 9927aac2, cf1d2671, 25c357e4).

seg-95b8207466a3 = D9, knihovna měřených hodin „Clock Atlas“ (tři nové řádky, jeden VALIDATED: { "232" } -> { "235" } řádků, { "116" } -> { "117" } ověřených).

seg-1f8644486f5d = <b>Knihovna měřených hodin (<c1/>).</b> Karty zařízení (bílá fáze, bílá, flicker a náhodná procházka frekvenční modulace, lineární drift frekvence a volitelně fázové členy s jedním až čtyřmi cykly na oběh) fitované na pojmenovaný změřený záznam hodin a hodnocené na vynechaných datech; Allanovy a Hadamardovy variance s ohledem na mezery; detektor úpravy, který zaznamenává každou mezeru, fázový odlehlý bod, fázový skok, shluk a skok frekvence a nic neví o hranicích souborů ani dnů; převod karty na model šumu časování slotů, rozšířený Kalmanův model hodin a úrovně šumu monitoru spoofingu. Čtečky souborů hodin RINEX a IGS, souborů BIPM po laboratořích a Circular T oddíl { "1" } (<c2/>); souhrnná hierarchická mez stárnutí pro UTC(k) (<c3/>, zatím nehodnoceno).

seg-93add052ae56 = <b>Identifikace šumu pomocí autokorelace zpoždění 1</b> (<c1/>, Riley a Greenhall { "2004" }), nový řádek VALIDATED (Knihovna): shoduje se s allantools { "2024.6" } <c2/> na { "140" } případech, celá čísla shodná, nejhorší rozdíl { "9.6e-13" } proti prahu { "1e-9" } (předregistrováno 2ec76864; <c3/>).

seg-1fcea6ee6136 = <b>Změřené karty zařízení s predikcí na vynechaných datech</b>, nový řádek MODELLED (zjištění): fit na jedné třetině, predikce Allanovy odchylky zbylých dvou třetin v rámci faktoru { "1.5" } (předregistrováno 2ec76864). GPS Block IIF na čerstvém okně IGS (2026-03-01 až { "14" }): { "10" } z { "11" }; G27 je optimistický v dvouhodinovém měřítku (nejhorší faktor { "1.510" }). Cesium (uvnitř, { "1.070" }), OCXO (mimo, { "2.348" }) a stroncium (uvnitř) jsou uvedeny, nikoli slepé. Karta přijímače JammerTest a karty Galileo maseru a Deep Space Atomic Clock jsou blokovány. Třída modelu TCXO přijímače ZED-F9P na { "12" } statických stanicích Wroclaw (Zenodo { "6488497" }) selhává: { "1" } z { "11" } slepých stanic v zveřejněném opraveném opakovaném běhu (<c1/>, <c2/>).

seg-26fa898f6272 = <b>Karty GPS Block IIF s členy na oběh</b>, nový řádek MODELLED (zjištění): na druhém čerstvém okně (2026-04-01 až { "14" }) { "9" } z { "11" } v rámci prahu; G03 ({ "1.947" }) a G25 ({ "1.581" }) jsou optimistické, protože jejich vynechané záznamy jsou hlučnější než jejich fitované třetiny; vynechání periodických členů selže u všech { "11" } (předregistrováno fb475550; <c1/>).

seg-ef456da29319 = <b>M002, odhad stavu palubních hodin, kolo { "3" }</b> (zjištění, zůstává MODELLED): po zmrazeném detektoru úpravy rozšířený filtr z kola 2, s nezměněným laděním a kritérii, poprvé splňuje (a) a (c) u všech { "11" } satelitů; (b) selhává u G09 ({ "0.894" }) a G26 ({ "0.876" }) (předregistrováno fb475550; <c1/>).

seg-0014b2629fd2 = <b>M010, detekce spoofingu, kola { "3" } až 4b</b> (zůstává MODELLED): kolo { "3" } blokováno ({ "167" } trénovacích epoch z ostatních relací jednotky JammerTest proti { "3600" }); s kartou třídy modelu ZED-F9P (kola { "4" } a 4b) monitor hodin vyvolá nula falešných poplachů před nástupem u všech { "10" } zaznamenaných nástupů (kolo { "2" }: { "86" }) a { "6" } z { "10" } nástupů je detekováno do { "10" } s (kolo { "2" }: { "4" }); stejné čtyři zůstávají pozdní (<c1/>).

seg-79757abc69e3 = <b>M083, horní mez UTC(k), kolo { "3" }</b>: předregistrováno prospektivně (fb475550) na číslech Circular T od { "465" }, zatím nespuštěno (<c1/>).

seg-09abf996ed16 = Prostředí orákula: záznam Wroclaw ZED-F9P je podmíněn přístupem k datům pod <c1/> (CC BY { "4.0" }, asi { "1.5" } GB); fixture IGS hodin jsou přibalené (produkty IGS, s uvedením zdroje).

seg-b05fa0811a3e = Revize: žádné. Žádný golden soubor, zveřejněný obrázek ani stávající testovací hodnota se nemění; M001 (znovukotvení holdoveru) se neuplatňuje, protože žádná třída hodin nebyla povýšena.

seg-986f4075210b = D8, jedna ověřená cesta propagace, soustavy a času (tři nové řádky VALIDATED a povýšené M131: { "235" } -> { "238" } řádků, ověřených { "117" } -> { "121" }).

seg-d7a612528765 = Druhy drah kolem Země, které nesly vlastní dvoutělesové, sekulární J2 nebo jen hvězdnočasové modely, nyní sdílejí jednu cestu: sady elementů SGP4/SDP4 s dvoudílnými juliánskými daty, převedené do GCRS a ITRS (International Terrestrial Reference System) řetězcem IAU (International Astronomical Union) 2006/2000A, s volitelnými parametry orientace Země.

seg-016507ccdb8f = Nové <c1/>, <c2/>, <c3/>, <c4/> a <c5/>; <c6/> a <c7/> berou dvoudílné epochy. Nové <c8/> (konvence SOFA <c9/> pro dny s přestupnou sekundou), <c10/>, <c11/>, <c12/> (přes TAI, jako SOFA <c13/>), <c14/> a dvoudílné <c15/>.

seg-158c39fff817 = Polární režim <c1/> propaguje pomocí SGP4 v 2026-01-01T00:{ "00" }:{ "00" } UTC na řetězci IAU (<c2/> bere libovolnou epochu); generátor SGP4 Walker se otáčí do pevné soustavy Země přes řetězec IAU.

seg-86ecad91a601 = Druh <c1/> spouští nový prediktor zdánlivých přeletů (<c2/>, <c3/>): SGP4 na řetězci IAU, refrakce ITU-R P.834-9 a světelný čas downlinku (nové přepínače <c4/> a <c5/>, ve výchozím stavu zapnuté), parametry orientace Země (<c6/>, <c7/>, <c8/>, výchozí { "0" }), průchody řešené s přesností { "1e-7" } s a kulminace hledáním zlatým řezem. Geometrický <c9/> se nemění.

seg-9ce091899bf1 = <c1/> brání tomu, aby jádra geometrie, času a propagace balíčku nesla soukromou keplerovskou propagaci, sekulární rychlosti J2 nebo rotaci jen podle hvězdného času; pojmenované rychlé úrovně a fyzika, která je předmětem řádku, jsou odůvodněné výjimky.

seg-cf4ae964c5d1 = Nový řádek VALIDATED „Dvoudílná juliánská data a přestupné sekundy na časové cestě drah kolem Země“: pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> na { "224" } okamžicích kolem všech { "27" } přestupných sekund v rámci { "1e-6" } s (předregistrováno e947e69d); nejhorší { "1.9e-11" } s.

seg-c0dec16ea932 = Nový řádek VALIDATED „Jedna cesta drah kolem Země“: polohy TEME pro { "232" } sad elementů proti python-sgp4 { "2.24" } (Valladova referenční SGP4) v rámci { "6.1e-8" } m (práh { "1" } cm) a rotace GCRS -> ITRS a TEME -> ITRS proti ERFA <c1/>, <c2/> a <c3/> v rámci { "2.9e-6" } mas a { "0.41" } mas (prahy { "0.1" } a { "2" } mas), s parametry orientace Země (předregistrováno 72ea9eb0). Zveřejněno: první běh selhal v 2016-12-31T23:{ "59" }:{ "59.5" } o jednu sekundu rotace; UT1 se bral z kvazijuliánského data UTC ve dni s přestupnou sekundou, engine nyní jde přes TAI a druhý běh se shoduje při nezměněných prazích.

seg-a72ccdc2516e = M131 „Pokrytí LEO a zhoršení přesnosti pro polární a arktické uživatele oproti MEO GNSS“ se stává VALIDATED: Orekit { "13.1.8" } přebírá stavy GCRS enginu, otáčí je a počítá viditelnost a DOP (NumPy pro skupiny s více hodinami); polohy v rámci { "6.8e-5" } m (práh { "0.2" } m), počty satelitů v dohledu shodné na 4040/4040 vzorcích, mediánový DOP v rámci { "2.3e-11" } relativně.

seg-db498ac8e135 = Nový řádek VALIDATED „Predikce zdánlivých přeletů pozemní stanice s refrakcí a světelným časem“: Orekit { "13.1.8" } propaguje stejné sady elementů v TEME, který si sestaví podle uvedené definice, s refrakcí ITU-R P.834 a jejím modelem měření světelného času, na { "60" } případech u stanic na úrovni moře: { "1210" } přeletů, průchody v rámci { "3.4e-6" } s (práh { "5" } ms), maximální elevace v rámci { "5.5e-7" } stupně, zdánlivý směr v rámci { "8.8e-7" } stupně (práh { "1e-4" } stupně).

seg-ab87bb0ee63d = Zjištění, ponechaná připnutá: první porovnání úplného tvrzení s Orekit od začátku do konce minula své prahy polohy a směru, nikoli kvůli enginu, ale proto, že SDP4 v Orekit { "13.1.8" } se odchyluje od referenční SGP4 u kruhových (e = { "0" }) drah v hlubokém vesmíru (až { "67" } m) a jeho výchozí TEME je postaven na nutaci IERS { "1996" } (IAU { "1980" }), asi { "72" } milivteřin oblouku od řetězce IAU 2006/2000A ({ "2.7" } m na LEO). Koeficient refrakce ITU-R P.834 u h*theta0^{ "2" } je v Orekit { "0.011380" }, kde Doporučení uvádí { "0.01380" }; porovnání je na úrovni moře, kde tento člen mizí, a rozdíl nad ní je připnut.

seg-49978e6a73b2 = „Predikce přeletů pozemní stanice (pozemní segment)“ zůstává VALIDATED, jeho tvrzení je zúženo na geometrický <c1/>; druh <c2/> patří novému řádku.

seg-60d6ac0011f1 = Prostředí orákula: Orekit { "13.1.8" } s Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

seg-532e10ead5a2 = Revize: přibalený <c1/> celkový přístup { "1675" } s -> { "1659" } s (pět přeletů jako dříve; nejlepší maximální elevace { "73.25" } stupně -> { "70.08" } stupně) a každý výstup <c2/> se mění s novou cestou (vytištěný řádek v <c3/> a záznam <c4/> v <c5/> to nyní uvádějí); přibalené <c6/> GNSS VDOP na rovníku { "1.19669" } -> { "1.19710" }, při { "89.9" } stupně { "1.50645" } -> { "1.50590" }, fúzované VDOP při { "89.9" } stupně { "1.14388" } -> { "1.14250" } (zveřejněné dvoumístné hodnoty { "1.20" }, { "1.51" } a { "1.14" } se nemění). Žádný golden soubor se nemění.

seg-b65f3186a7e9 = Zatím nesměrováno: <c1/>, režimy doppler, joint a timing <c2/> a pravá dráha <c3/> (jejich modely žijí v <c4/> a <c5/>) a návrhy pro Zemi v <c6/> (pojmenovaná dvoutělesová rychlá úroveň).

seg-03f638f20376 = D6, referenční generátor LunaNet AFS, LSIS V1.0 (čtyři nové řádky, dva VALIDATED: { "238" } -> { "242" } řádků, ověřených { "121" } -> { "123" }).

seg-1d09f0582781 = <b>Referenční generátor LunaNet Augmented Forward Signal (AFS)</b> (<c1/>), připnutý k LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 z { "29" } ledna { "2025" } a uvádějící tuto verzi v každém výstupu: nosná { "2492.028" } MHz; datový kanál AFS-I BPSK({ "1" }) rychlostí { "500" } symbolů za sekundu s Goldovým kódem o 2046 čipech; pilot AFS-Q BPSK({ "5" }) s Weilovým primárním kódem o 10230 čipech, sekundárním o 4 čipech a terciárním o 1500 čipech; rámec s identifikátorem rámce { "0" } (synchronizační vzor, podrámec { "1" } BCH ({ "51" }, { "8" }), CRC-24, podrámce { "2" } až { "4" } s LDPC o rychlosti jedna polovina, blokový prokladač { "60" } krát { "98" }) s vyčerpávajícím dekodérem podrámce 1 a dekodérem LDPC min-sum napsaným pouze z matice paritních kontrol; a syntézu IQ v základním pásmu s popisky pravdy zapsanou jako nahrávka SigMF. Kódy se generují z posuvných registrů standardu a konstrukcí Legendre/Weil. Nic zkopírovaného ze standardu se nerozšiřuje (nenese žádné podmínky opětovného použití): primární indexy AFS-Q pocházejí z IS-GPS-800J a to, co definují jen přílohy standardu (zpoždění G2 u AFS-I, terciární kódy, podmatice LDPC), se čte za běhu z lokální mezipaměti, kterou <c2/> naplní z PDF hostovaného NASA, přičemž každý soubor je ověřen proti připnutému SHA-256 (<c3/>). Model je referencí shody se standardem, nikoli modelem kanálu, šíření ani rozpočtu spoje.

seg-7b8cb0461377 = <c1/> a <c2/>: nahrávka může nést pole rozšíření s jmenným prostorem deklarovaná v <c3/>.

seg-a9465820a1fc = Nový řádek VALIDATED „Vykreslení základního pásma LunaNet AFS proti nezávislému generátoru, při daném stavu jeho kanálů“: proti LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, build pro pásmo S) nulové neshody čipů v kódech PRN { "1" } až { "210" }, nulové neshody symbolů ve třech rámcích běhu a normalizovaná komplexní korelace { "0.999990" } na { "23.9" } s jeho vlastních vzorků (nejhorší blok { "2" } ms { "0.999948" }), v rámci prahů stanovených před porovnáním (předregistrováno 986ac280). Vykreslovač řídí vlastním stavem kanálů simulátoru a nepokrývá rozdělení výkonu podle poměru nosné k šumové hustotě ani zápis SigMF a 8bitový zápis.

seg-07edced2764a = Nový řádek VALIDATED „Kanálové kódování rámců LunaNet AFS, FID { "0" }“: rámce o 6000 symbolech se rovnají rámcům LANS-AFS-SIM symbol po symbolu (předregistrováno 986ac280); kód podrámce 1 reprodukuje vzorový příklad z obrázku { "8" } LSIS a CRC-24 kontrolní hodnotu katalogu CRC-24/LTE-A.

seg-ab94ac9f41fc = Oba povýšené řádky jsou podmíněny přístupem k datům v mezipaměti LSIS: jejich test orákula se s oznámením přeskočí, dokud nebyl spuštěn <c1/>.

seg-89a4bc4a766e = Zjištění (nový řádek MODELLED), „Generování rozprostíracích kódů LunaNet AFS“: z { "2 937 232" } generovaných čipů a bitů porovnaných s tabulkami standardu a soubory Přílohy { "3" } se jeden liší, „posledních { "24" } čipů“, které Tabulka E-5 uvádí pro terciární PRN { "147" }, což duplikuje buňku PRN { "151" }, zatímco vlastní soubor Přílohy { "3" } standardu se shoduje s generátorem. Kritérium nulové neshody je minuto.

seg-d4e76301323f = Zjištění (nový řádek MODELLED), „Dekódovatelnost LunaNet AFS v uzavřené smyčce“: tři předregistrované běhy proti PocketSDR-AFS; třetí splnil své prahy sledování a dekódování plně, ale ne svou pojistku, že build přijímače jen s tiskem reprodukuje log připnutého buildu, protože dva běhy neupraveného přijímače se již liší v záznamech akvizice.

seg-93cfa05a1923 = Opraveno: výchozí nosná u <c1/> (<c2/>), <c3/> a <c4/> byla zaokrouhlených { "2.4" } GHz; nyní je to nosná AFS podle LSIS-020, { "2492.028" } MHz. Při starém výchozím nastavení byla ztráta ve volném prostoru podhodnocena o { "0.327" } dB.

seg-ed7c170ccc2c = Revize: žádné. Každý přibalený scénář uvádí svou nosnou a výsledky všech { "138" } souborů scénářů jsou bajt po bajtu shodné s předchozím main.

seg-3ec7f5b17122 = D7, skutečné lunární IQ a GPS LNAV (sedm nových řádků, žádný VALIDATED: { "242" } -> { "249" } řádků, ověřených { "123" } beze změny).

seg-0c3dcf4f2b0f = <c1/>: rychlá Fourierova transformace (FFT) se smíšeným základem, jejíž výstup má na každé platformě stejné bity; připnutý SHA-256 transformací o 8000 a 24000 bodech prochází na x86_64 i na wasm32-wasip1 (runner v <c2/>).

seg-150d9809c584 = <c1/>: paralelní hledání fáze kódu na vzorkovaném IQ (<c2/>, <c3/>) s koherentním skládáním, nekoherentní akumulací, prahem chí-kvadrát pro pravděpodobnost falešného poplachu v celém hledání a statistikou průměrování buněk pro šum omezený pásmem; <c4/>, <c5/> s kódovým Dopplerovým posunem a estimátory poměru nosné k šumové hustotě (C/N0) M2M4 a vrcholu mřížky.

seg-46bda8ecf2cd = <c1/>: kodér starší navigační zprávy (LNAV) IS-GPS-200 pro podrámce { "1" } až { "3" }, s paritou podle Tabulky 20-XIV a dekodérem polí.

seg-43444792974c = <c1/>: čtečka standardu ION GNSS SDR Metadata Standard (<c2/>) a jeho vzorkových souborů, s <c3/> pro úrovně v doplňkovém kódu.

seg-a7dfc3475923 = <c1/>: hlavička dávky LuGRE (Lunar GNSS Receiver Experiment) IQS, telemetrie RAW, ACQ a NAV a soubory CLK a kontrola, která uvádí, kde metadata <c2/> odporují binární hlavičce.

seg-f0125531c4f8 = <c1/> a v <c2/> těleso řízené stáčením (yaw-steering), vysílací azimut a úhly mimo nadir a <c3/> pro relativní C/N0 s měřenými diagramy.

seg-679aa02de1d0 = Kódování navigační zprávy GPS LNAV (nový řádek, zůstává MODELLED po poverifikaci integrátora): na vysílaném souboru IGS z { "2" } března { "2025" }, zpracovaném a dekódovaném RTKLIB v2.4.2-p13, všech { "960" } slov projde paritou, všech { "96" } podrámců se dekóduje a všech { "608" } vysílaných celých čísel se rovná těm Kshany (<c1/>), ale předregistrace (d4d9eb9d) se dostala do veřejné větve dvě sekundy po commitu obsahujícím výsledek, takže pořadí „zaregistrováno před stažením souboru“ nelze prokázat a řádek není povýšen.

seg-2875ba2d8f5f = <c1/> plní slova od nejvýznamnějšího bitu (I ve vyšší půlce bajtu LuGRE; dřívější čtení dávalo sdružený signál), staré čtení ponechává jako <c2/> a čte vzorky širší než slovo.

seg-f6e0e3b9b166 = <c1/>: fázově koherentní zpřesnění Dopplerova posunu ({ "0.2" } Hz RMS při { "30" } dB-Hz za { "200" } ms v simulaci).

seg-b0f6a61acce0 = GPS L1 C/A proti gps-sdr-sim: čipy a paritní bit přesně; { "230" } z { "1152" } polí LNAV se liší o jednotku, protože gps-sdr-sim ořezává tam, kde vysílané celé číslo vyžaduje zaokrouhlení.

seg-1c525ca495c0 = LNAV dekódované RTKLIB: veškerá parita a podrámce projdou a každý parametr je v rámci poloviny kvanta; { "41" } škálovaných hodnot se liší o několik jednotek na posledním místě kvůli desítkové konstantě { "2" }^-43 v RTKLIB, nad registrovaným prahem.

seg-14e26e69777b = Akvizice LuGRE proti GNSS-SDR { "0.0.19" }: { "266" } z { "266" } rozhodnutí se shoduje, { "250" } umístěno do téže buňky; většina pozitiv je artefakty průměru −{ "0.5" } v holých 4bitových úrovních; větev C/N0 neměla současná letová data. Dvě dávky (OP5, OP12) byly omylem vyloučeny: jejich metadata se shodují s hlavičkami, ale čtečka tehdy neuměla číst vzorek širší než slovo.

seg-3a32ff9d66fc = Akvizice LuGRE proti Dopplerovu posunu předpovězenému z dráhy: při rozhodnutí podle výkonu vzorků překračuje práh každé hledání na šumu omezeném pásmem; při rozhodnutí průměrováním buněk se nejsilnější dvojice shodují velikostí s obráceným znaménkem, což ukazuje, že registrované pořadí I/Q je sdružené k datům.

seg-2bb618ba4059 = Slepá akvizice na lunárních povrchových dávkách: čtyři dávky každá akvirují jeden satelit (předpovězen jako viditelný, žádný falešný poplach při { "1e-7" }), žádná dva, takže práh rozdílu Dopplerových posunů nemá žádný pár k hodnocení.

seg-f95606e17fd1 = Relativní C/N0 ve vzdálenosti Měsíce (M039 přeformulováno): { "15" } záznamů Block IIR/IIR-M a jeden pár, příliš málo pro registrovaný práh.

seg-9306cf44fc44 = Revize: žádné; žádné zveřejněné číslo, golden soubor ani obrázek v dokumentaci se nezměnily.

seg-2a3cb68c94d6 = Řádek M039 „GNSS Země ve vzdálenosti Měsíce“ přeformulovává své tvrzení ve vzdálenosti Měsíce jako relativní C/N0 mezi satelity v jedné epoše plus viditelnost (absolutní C/N0 se netvrdí); zůstává MODELLED. Nejvyšší NOTICE nese uvedení zdroje LuGRE CC BY { "4.0" }.

seg-e1e4094a186a = Lunární orientace hlavních os z DE440 se nyní interpoluje po geodetice mezi denními uzly. Dřívější interpolace po prvcích měla chybu až { "2.0e-4" } rad ({ "340" } m na lunárním povrchu) poblíž čtvrtinových bodů každého dne, nikoli „asi { "14" } m“, jak řádek uváděl. Jeho uživatelé (geometrie lunárního laserového měření vzdáleností, lunární datum, lunární pozorovatelnost poruch) dostávají opravenou orientaci.

seg-a2071d345923 = Opravy enginu v kole { "2" }, každá znovu spuštěná proti své nezměněné předregistrované toleranci: vintage IERS řádku EOP se čte z jeho příznaků I/P místo z prázdného bloku Bulletinu B; <c1/> používá geodetickou lokální úroveň; lunární vazba rychlostní soustavy používá rovníkový poloměr, J2 a rotaci; fit liu22 začíná od nulových korekcí bez priorů a používá rychlost středního pohybu z článku; rozestup uzlů EO nese nodální regresi J2; doba do proklouznutí cyklu u Costase používá rho/4; společné řešení uplatňuje vysílané skupinové zpoždění dvojice; lunární společné řešení používá krok QR; mez NTN se vyhodnocuje na pravé poloze; referencí hodin v návrhu konstelací je nejnižší konstelace v dohledu; řada orientace DE440 pokrývá 2014-2030 a mimo ni hlásí chybu místo ořezání.

seg-74f397ad9c16 = <c1/>, pravá dráha sestavená z tabelovaných stavů v pevné soustavě Země, používaná porovnáním fitteru skutečných drah.

seg-7293b717d978 = Testovací soubory a fixture výše uvedených porovnání, každý se svým generátorem a souborem <c1/> uvádějícím zdroj, licenci, datum stažení a SHA-256.

seg-920fe965bda9 = Kolo { "2" }: <c1/> a <c2/> (detekce poruch podle ADD v4.2, podle Stanford MAAST pro ARAIM { "2" }, oznámení BSD-3 ve zdroji); <c3/>; <c4/> a <c5/>; devítistavový model chyby INS <c6/>; parciální derivace <c7/> a vstupy <c8/> na cestě přes jádro; <c9/>, čtečka jader SPK typu { "2" } a binárních PCK; <c10/> se stanicemi ITRF2020; hustota Jacchia { "1971" }; <c11/> přes libovolného poskytovatele efemerid; <c12/>; <c13/> a <c14/>; <c15/>; <c16/> (čtečky RINEX hodin, ANTEX a DCB).

seg-e3336e670d51 = Záplatové vydání nad { "0.29.2" }. Kshana Studio je přestavěno kolem dvou pohledů: Jednoduchého, který nejdřív odpovídá a vysvětluje prostými slovy, a Pokročilého s úplným panelem. Přicházejí s ním dvě drobné opravy na kshana.dev. Engine se nemění: každý přibalený scénář dává výsledek bajt po bajtu shodný s { "0.29.2" } kromě otisku verze.

seg-c40ab967ace6 = <b>Kshana Studio má Jednoduchý pohled.</b> Právě ten se ve Studiu otevírá.

seg-6a5ae001d00e = Odpověď je na prvním místě: scénář se otevře svým výsledkem, vyjádřeným jednou prostou větou. Každý přibalený scénář má vlastní větu, napsanou pro to, co daný scénář měří.

seg-375421534e4c = Zobrazeno je nejvýše pět nastavení, ta, která odpověď mění nejvíce. Zbytek je pod „Pokročilá nastavení“, sbalený, dokud jej neotevřete.

seg-d8650ae64549 = „Jak se to počítá“ vysvětluje metodu v několika řádcích a „Pro výzkumníky“ uvádí vlastní hodnoty enginu, soubor scénáře a důkazy za výsledkem.

seg-36af7640e6ad = <b>Úplný panel je Pokročilý pohled.</b> Je tu každý panel, graf, export a zpráva dřívějšího Studia.

seg-0428d0a7921b = <b>Přepínač přepíná mezi oběma pohledy a zachovává vaše místo.</b> Scénář, pohled, na kterém jste byli, a všechna upravená nastavení se přenesou. Studio si pamatuje, který pohled jste použili naposledy. Odkazy z webu a dokumentace otevírají Jednoduchý pohled; odkaz s <c1/> otevře Pokročilý pohled a každý dřívější odkaz na Studio stále otevírá stejný scénář a pohled.

seg-2c98ed084c10 = <b>Rychlejší první pohled na pomalém připojení.</b> Zaznamenaná odpověď pro scénář se vykreslí dříve, než se načte zbytek Studia, takže na pomalém mobilním připojení se odpověď zobrazí asi za dvě sekundy místo asi devíti.

seg-2214d2dcfab4 = <b>Lepší vyhledávání.</b> Hledání nyní nejdřív uvádí scénáře, jejichž oblast nebo název odpovídá hledaným slovům, před scénáři, které je zmiňují jen v názvu souboru nebo v textu.

seg-aa8d43280c19 = <b>Globus na domovské stránce už při omezeném pohybu nezůstane prázdný.</b> Při zapnutém systémovém nastavení omezeného pohybu mohla změna velikosti okna nechat úvodní globus prázdný, dokud se stránka neposunula. Globus se nyní překreslí ve stejném snímku jako změna velikosti.

seg-da4b78816df1 = <b>Konzole pásma L na domovské stránce vysvětluje své prázdné pásmo.</b> V „Sledujte, jak rušič zabere pásmo“ zůstal panel GPS L5 / Galileo E5a celou minutu tmavý, což vypadalo jako porucha. V tomto scénáři v tomto pásmu žádný rušič nevysílá a signály satelitů leží pod úrovní šumu, takže se tam nic nad ni nevznáší. Tichý popisek to nyní uvádí v každém úseku panelu, kde není nic nad úrovní šumu (panel L5 / E5a a panel L2C, než začne jeho šumový rušič), s C/N0 a stavem zachycení každého pásma ze stejného běhu. Zobrazuje se jen tam, kde není nic nad úrovní šumu, takže nikdy nezakrývá energii rušiče.

seg-e353fdee7033 = Záplatové vydání nad { "0.29.1" }. Odstraňuje duplicitní kód v modulech navigační zprávy LEO, fúze a spektra, přidává světlé téma na kshana.dev, přesouvá Kshana Studio na vlastní adresu, činí web čitelným pro vyhledávače a AI asistenty, opravuje několik drobností ve Studiu a umožňuje vydání npm bez uloženého tokenu. Žádný výstup enginu se nemění: každý přibalený scénář dává výsledek bajt po bajtu shodný s { "0.29.1" } kromě otisku verze.

seg-e8bf0a4fdc35 = <b>Světlé téma pro kshana.dev.</b> Každou stránku lze číst světlou i tmavou. Web sleduje systémové nastavení čtenáře a má přepínač pro jeho změnu.

seg-8e7cabc14c40 = <b>Vyhledávače a AI asistenti mohou web číst.</b> Každá stránka má nyní vlastní titulek, popis, kanonickou adresu, značky sociálních karet a strukturovaná data schema.org a prostý text pro sekce, které vykresluje skript. Web zveřejňuje <c1/>, <c2/> s datem poslední změny každé stránky, <c3/> a <c4/> (krátký a úplný prostý průvodce pro AI asistenty) a klíč IndexNow, aby nasazení mohlo vyhledávačům říct, co se změnilo.

seg-804ba71be9ed = <b>Vydání npm lze publikovat bez uloženého tokenu.</b> Úloha npm nyní běží na Node { "24" } a npm { "11.5.1" } nebo novějším, které podporují trusted publishing npm: npm vymění identitu GitHub úlohy vydání za krátkodobé přihlašovací údaje. Tajný klíč <c1/> stále funguje a používá se, dokud je nastaven, takže se nic nemění, dokud se pro balíček na npmjs.com trusted publishing nezapne. <c2/> uvádí kroky.

seg-81405e5a5e06 = <b>Titulek domovské stránky je nad globusem čitelný.</b> Za titulkem a jeho textem je nyní jemný stín, který tlumí orbitální čáry a tečky satelitů animovaného globusu tam, kde jej protínají.

seg-24b8363acc14 = <b>Kshana Studio má vlastní adresu: <a1>https://kshana.dev/studio/</a1>.</b> Odkazuje na ni každý odkaz na webu a v dokumentaci. Stará adresa, <c1/>, stále funguje a přesměruje na novou se zachovaným scénářem, pohledem a dalšími nastaveními v odkazu.

seg-12f223b986bd = <b>Opravy Studia.</b> Soubor enginu se stahuje jednou místo dvakrát. Během stahování Studio okamžitě ukazuje zaznamenaný výsledek scénáře, označený jako zaznamenaný, místo prázdné obrazovky. Na telefonu je záhlaví jeden kompaktní řádek. Klíčové hodnoty se zalamují po dvou na řádek, takže žádná není skryta za okrajem obrazovky. Popisky polí používají vlastní slova scénáře s názvem pole vedle nich a hledání najde pole podle obojího.

seg-c130d8a4dc5e = <b>Méně duplicitního kódu.</b> Tabulka jednotek navigační zprávy LEO zapisovala stejných deset řádků statistik SISRE pro čtyři shrnutí fitu. Nyní je zapisuje jednou makro. Dva spektrální grafy typu vodopád sdílejí jednu časovou osu, barevnou stupnici a panel C/N0. Podvzorkování hlavní mřížky znovu používá <c1/> a Simpsonův integrál znovu používá <c2/>. Dva vstupní body druhu přeletu LEO sdílejí jeden krok nastavení. <c3/> importuje pomocné vektorové funkce <c4/> místo jejich kopírování. Pokročilá zpráva importuje HTML escape zprávy API místo jeho kopírování. Každý z { "139" } souborů scénářů v <c5/> byl spuštěn na { "0.29.1" } i na tomto kódu a každý výstupní soubor je bajt po bajtu shodný.

seg-166b0435c96f = <b>Tabulky jednotek leo-navmsg a leo-pvt mají vlastní soubory.</b> Přesunuly se z modulů, které obsahují i logiku, do <c1/> a <c2/>. <c3/> si ponechává svou veřejnou cestu. Pouze tyto dva soubory tabulek se přidávají k výjimkám detekce kopírování kódu pro deklarativní katalogy v <c4/>, které kontroluje <c5/>.

seg-f8b372e08ef9 = <b>Odznak CI v README ukazuje výsledek pushů do main.</b> Odznak počítal běhy každé události na main, takže mohl hlásit „failing“, i když byl každý běh push zelený; nyní se ptá jen na běhy push (<c1/>).

seg-7c41a482c7d8 = Záplatové vydání nad { "0.29.0" }: změřená hodnota pokrytí, řádek s názvem projektu na kshana.dev, rychlejší úloha pokrytí a obnovené README. Žádný výstup enginu se nemění: každý scénář dává stejný výsledek jako na { "0.29.0" }.

seg-997490bd1696 = Revize zveřejněných čísel

seg-ed4b071e4bd9 = <b>Pokrytí řádků: ~{ "96" } % → ~{ "95" } %.</b> Úloha pokrytí znovu změřila vydaný kód { "0.29.0" } (commit <c1/>, běh CI { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } z { "58,697" } řádků <c3/>. Zveřejněná hodnota byla { "95.63" } % ({ "37,697" } z { "39,419" } řádků), změřená na <c4/> před { "0.28.0" }; zaokrouhlovala se na ~{ "96" } %. Nová hodnota se zaokrouhluje na ~{ "95" } %, takže se společně mění každý povrch, který <c5/> připíná: <c6/>, odznak README, řádek Evidence a tabulka CI, odznaky crates.io, PyPI a npm, technická zpráva a stránka pokrytí na kshana.dev. Spodní mez { "85" } % se nemění.

seg-577baa03af04 = <b>Řádek s názvem na kshana.dev.</b> „Kshana · क्षण · the precise instant“ nyní otevírá úvod domovské stránky a sedí pod značkou v patičce každé stránky. kshana.dev stále nevytváří žádný požadavek na jiného hostitele: devanágarí je vlastní hostovaná podmnožina Noto Sans Devanagari tří písmen क्षण ({ "1,692" } bajtů, <c1/>, s textem licence SIL Open Font License a jeho SHA-256 v <c2/>). <c3/> se naučil uložit podmnožinu Google Fonts <c4/> pod název souboru adresovaný obsahem.

seg-35b5bc4ee466 = <b>Odkazy webu dopadají tam, kam míří, na čistých adresách.</b> Odkaz na sekci nyní staví tuto sekci těsně pod záhlaví, na telefonu i na stolním počítači: odkaz na sektor Mise otevře tento sektor s jeho panelem nahoře; odkazy Schopnosti a Edice drží své místo, zatímco se vykreslují grafy nad nimi; Edice už nepřidávají druhý posun záhlaví; a odkaz do sbalené části stránky dokumentace ji otevře. Každá stránka je odkazována svou čistou adresou (<c1/>, <c2/>, <c3/> pro domovskou) a kanonické odkazy, mapa webu a přesměrování ze starých adres uvádějí totéž; adresy <c4/> stále fungují. Výzkum má vlastní odkaz v záhlaví mezi Důkazy a Vývojáři a v patičce. Dokumentace už neukazuje plán (<c5/> zůstává v repozitáři): skupina Projekt je Changelog, Licencování, Bezpečnost, Přispívání, Správa a Kodex chování a Slovník se přesunul do Začínáme.

seg-3da9f00f5ce6 = <b>Úloha pokrytí je rychlejší.</b> Na { "0.29.0" } trvala { "143" } minut oproti zdravým { "91" } až

seg-85d502773367 = Fuzzer <c1/>, příčina minule, zabral { "4" } z nich. Přibalený korpus vzrostl ze { "74" } na { "139" } scénářů a tři testovací binárky jej procházely celý po jednom souboru (<c2/> dvakrát, <c3/> a <c4/> jednou): dohromady { "37" } minut pod instrumentací pokrytí, oproti { "3" } na { "0.27.2" }. Nyní sdílejí <c5/>, který práci na jednotlivých scénářích spouští na každém jádře a vrací výsledky v setříděném pořadí; každý scénář a každé tvrzení zůstává. Na laptopu arm64, debug build: <c6/> trvá { "143" } s na { "14" } jádrech oproti { "612" } s s <c7/> (starý sériový průchod).

seg-35b0c0644fa2 = <b>Vertikální Stanfordův diagram integrity exportovaný scénářem <c1/>.</b> Spustitelný druh scénáře <c2/> nově vedle mapy dostupnosti HPL/VPL exportuje i vertikální Stanfordův(-ESA) diagram: v každé chráněné epoše se zreprodukovatelný, seedem řízený výběr chyby měření vzdálenosti bez poruchy převede přes geometrii na skutečnou vertikální chybu polohy a zařadí se vůči VPL a vertikálnímu poplachovému limitu (Available / System-Unavailable / Misleading / Hazardously-Misleading). Diagram (body po epochách a počty v oblastech) je součástí výsledného JSON a počty událostí integrity a HMI jsou v souhrnu CLI, takže Stanfordův klasifikátor, dříve dostupný jen jako knihovna, je dosažitelný od začátku do konce. <c3/> získává pole <c4/> (výchozí { "0" }), které řídí realizaci chyby; samotná mapa dostupnosti zůstává čistě geometrická a na seedu nezávislá.

seg-5d76a638ae77 = Rozpočet integritního rizika ARAIM (P_HMI) pro ochranné úrovně.

seg-449adb9ad6e6 = <c1/> odvozuje horizontální a vertikální ochranné úrovně z explicitního rozpočtu integritního rizika, nikoli z pevného násobitele <c2/>: pro řešení ze všech viditelných družic i pro každé dílčí řešení s vyloučením jedné družice sestaví na každé ose <c3/> pro jednotlivé režimy, a <c4/> pak najde nejmenší PL, jehož součtová pravděpodobnost nebezpečně zavádějící informace (<c5/>, <c6/>, Blanch et al. <em>Baseline ARAIM</em>) splní přidělené <c7/>. Výsledek uvádí integritní riziko, kterého úrovně skutečně dosahují, takže uživatel může explicitně vyvažovat integritu proti poplachovému limitu. Šest ručně odvozených testů (uzavřené tvary pro jeden režim bez poruchy a s prahem, sčítání více režimů a monotonie, ochrana bez poruchy od začátku do konce s 10⁵× přísnějším rozpočtem zvyšujícím PL, detekce a identifikace poruchy a minimální redundance šesti družic). Porucha jedné družice (MHSS) je základem ARAIM; současné poruchy více podmnožin SV, režim poruchy celé konstelace a validace na referenčním datovém souboru gLAB jsou zdokumentovaná rozšíření.

seg-3e33581644a5 = Dvourychlostní kompenzace coningu a scullingu pro strapdown mechanizaci.

seg-c900e193ac29 = <c1/> vyjímá vysokofrekvenční členy coningu (orientace) a rotace se scullingem (rychlost) z uspořádaných dílčích přírůstků IMU hrubé aktualizace, takže <c2/> s mírnou frekvencí reprodukuje pohyb usměrněný vibracemi, který hrubý krok nad surovými součty míjí. Validační test pohání prostředí coning+sculling o frekvenci { "10" } Hz po dobu { "60" } s a porovnává jemnou referenční pravdu, naivní hrubou integraci a hrubou integraci se sloučenými členy: sloučení sníží chybu polohy zhruba { "18" }× (z metrů naivního driftu na méně než decimetr), což potvrzuje, že členy coningu/scullingu jsou nosné. Alias typu <c3/> pojmenovává starší jednoosý (1-DOF) <c4/> tím, čím je, odlišně od tříosého navigátoru <c5/>.

seg-ceb037e7a6ea = <b>Parser observačního souboru RINEX.</b> Nový modul <c1/> čte <em>observační</em> soubor RINEX 3.0x / { "4.00" }, tedy skutečná měření přijímače, a doplňuje tak dvojici RINEX vedle stávajícího parseru navigační zprávy. <c2/> dekóduje hlavičku (verze/typ, seznamy <c3/> podle systémů včetně pokračovacích řádků, přibližnou polohu, interval, čas první observace) a záznamy každé epochy po družicích: pseudovzdálenost, fázi nosné, Doppler a sílu signálu, klíčované jejich observačním kódem RINEX { "3" } (<c4/>, <c5/>, …) spolu s příznaky ztráty vazby (LLI) a síly signálu (SSI); prázdné pole se zachovává jako chybějící, nikoli jako nula. Poctivý rozsah: jde o <em>načtení</em> ve standardním formátu (skutečný observační záznam z RTKLIB/gLAB/stanice IGS na vstupu, typovaná měření na výstupu), nikoli o polohovací engine; zde není žádné řešení z pseudovzdáleností, PPP ani RTK.

seg-60efb0c44522 = <b>Zapisovač CCSDS OEM (Orbit Ephemeris Message).</b> Nový modul <c1/> exportuje propagovanou konstelaci jako platnou zprávu CCSDS 502.0-B OEM { "2.0" }, tedy formát efemerid KVN, který přijímají GMAT, Orekit, STK a většina nástrojů letové dynamiky. <c2/> vzorkuje setrvačný stav (TEME) každé družice, tedy polohu <b>i</b> rychlost přímo z propagátoru bez rotace do systému pevného se Zemí, na rozdíl od exportu SP3, na časovou mřížku a <c3/> serializuje hlavičku <c4/>/<c5/>/ <c6/> a jeden segment <c7/> na družici (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>) následovaný řádky <c15/> (km, km/s). Hodnotu <c16/> dodává volající, nikdy ne hodinový čas systému, takže výstup je mezi běhy bajt po bajtu shodný (smlouva o reprodukovatelnosti). Jde o protějšek exportu SP3 pro GNSS určený pro efemeridy kosmických těles: dráhu z { -brand } lze nyní předat nástroji letové dynamiky ve standardním formátu.

seg-f8538db4a17c = Přesné efemeridy SP3 jako zdroj propagace.

seg-2cf2e224deb9 = <c1/> sestaví pro každou družici <c2/>, který mezi tabelovanými epochami SP3 doplňuje polohu Lagrangeovým polynomem 9. řádu (standardní praxe IGS) a převádí ji do společného systému TEME; zpřístupněno jako <c3/>. Soubor přesných drah z IGS nebo analytického centra tak může pohánět stejný řetězec geometrie, viditelnosti a integrity jako broadcast a analytické propagátory. Ověřeno obousměrným průchodem: Keplerova dráha zapsaná do SP3 a znovu načtená přes interpolátor souhlasí s původní na uzlech na méně než metr a uprostřed intervalu na < { "100" } m. Interpolace hodin je na řadě.

seg-8d50fd42f53c = <b>Broadcast efemeridy GLONASS (dokončují multi-GNSS navigaci RINEX).</b> Nový modul <c1/>: GLONASS nevysílá keplerovské elementy, ale <b>stavový vektor</b> pevný se Zemí v PZ-90 (poloha, rychlost, luni-solární zrychlení). <c2/> čte záznamy RINEX { "3" } <c3/> a poloha družice v libovolném čase se získá <b>Rungeovou–Kuttovou integrací 4. řádu</b> pohybových rovnic z ICD GLONASS (centrální gravitace + <c4/> + Coriolisovy/odstředivé členy rotace Země + vysílané zrychlení). Zpřístupněno jako <c5/>, takže družice GLONASS procházejí řetězcem konstelace, viditelnosti a integrity spolu se systémy s keplerovskými elementy; jediný blok konstelace <c6/> nyní může míchat GPS, Galileo, QZSS, BeiDou a GLONASS.

seg-8d88144e3726 = <b>Navigace RINEX pro více systémů GNSS (GPS, Galileo, QZSS, BeiDou).</b> Parser navigačních dat RINEX { "3" } nyní vedle GPS (<c4/>) dekóduje záznamy Galileo (<c1/>), QZSS (<c2/>) a BeiDou (<c3/>, MEO/IGSO); sdílejí keplerovské uspořádání a uživatelský algoritmus a každý se vyhodnocuje s vlastní gravitační konstantou a rychlostí rotace Země (μ pro Galileo/BeiDou, Ω̇ₑ pro BeiDou). Soubor se smíšenými konstelacemi poskytne všechny z nich, které procházejí řetězcem konstelace, viditelnosti a integrity jako <c5/>. Geostacionární družice BeiDou používají jinou rotaci souřadnic a jsou přeskočeny, dokud nebude k dispozici referenční vzorek, vůči němuž by šly ověřit. Procházení záznamů používá počty řádků podle systému, čímž se opravuje latentní chyba, kdy se čtyřřádkové záznamy GLONASS/SBAS přeskakovaly, jako by měly osm řádků. GLONASS (model stavového vektoru) je na řadě.

seg-91a6907acc8d = <b>Čtečka a zapisovač přesných efemerid SP3-c/d.</b> Nový modul <c1/> zpracovává soubory přesných drah SP3 z IGS nebo analytických center (<c2/>), tedy dodatečně zpracovaný produkt polohy a hodin v ECEF, který enginy PPP (Ginan, RTKLIB, gLAB) berou jako referenci, do strukturovaného <c3/> (hlavička, mřížka epoch, poloha každé družice km→m, hodiny µs a rychlost dm/s→m/s u produktů <c4/>) se zachováním zástupných hodnot SP3 pro chybná data. Pokryt je i opačný směr: <c5/> sestaví SP3 z propagované konstelace (TEME→ECEF pro každou epochu) a <c6/> jej serializuje, takže dráhy z { -brand } lze exportovat ve formátu, který externí nástroje PPP čtou, tedy obousměrný průchod čtení↔zápis. Interpolace epoch a zdroj propagátoru SP3 jsou na řadě.

seg-7d51d1b6f39f = <b>Broadcast efemeridy RINEX jako spustitelný zdroj konstelace.</b> Konstelace nyní přijímá vložený blok <c1/> (navigační text RINEX { "3" } pro GPS) vedle stávající volby <c2/>, takže skutečný broadcast soubor pohání scénář od začátku do konce z CLI, z Pythonu nebo z prohlížečového hřiště: na vstupu RINEX, na výstupu geometrie PNT. Nový <c3/> ukazuje dostupnost GNSS a DOP z osmi družic GPS sestavených přímo z broadcast záznamů. (Pouze GPS LNAV; multi-GNSS a SP3 jsou na řadě.)

seg-9730835bfc64 = <b>Broadcast efemeridy RINEX jako zdroj propagace.</b> Zpracovaný <c1/> se nyní převádí na <c2/> (<c3/>): poloha je broadcast dráha podle IS-GPS-200 otočená z ECEF do společného setrvačného systému TEME (<c4/>, s časem GPS→UT1 správným vzhledem k přestupným sekundám), rychlost je centrální konečná diference a keplerovská oběžná doba. Skutečná broadcast data GPS tak mohou pohánět stejný řetězec geometrie, viditelnosti a integrity (RAIM) jako analytické propagátory SGP4/Kepler. (Zatím není zpřístupněno jako druh scénáře se souborem RINEX; to a multi-GNSS/SP3 je na řadě.)

seg-a355e3e52ec3 = <b>Archivní DOI.</b> Vydání se nyní ukládají do Zenodo a dostávají citovatelné DOI.

seg-c6e4556e1ce5 = <b>Dokumentace.</b> README bylo přepracováno na institucionální úroveň: přehled schopností celého stacku { "v0.9.0" }, oddíl Verzování a vydání, čistá hlavička s novou značkou a stručný stavový řádek. Žádné změny enginu.

seg-1bfc4e965d2b = Toto vydání přidává tři podstatné oblasti schopností nad základem SGP4 z verze { "0.8.0" }: skutečný tříosý strapdown INS, volně vázaný chybový stavový EKF GNSS/INS s uzavřenou zpětnou vazbou, skutečný snapshotový RAIM a RAIM se separací řešení (ve stylu ARAIM) s HPL/VPL a spustitelným scénářem <c1/> a první krok k interoperabilitě formátů GNSS (načítání efemerid GPS ve formátu RINEX-3).

seg-7fa2f68d436a = <b>Parser navigační zprávy GPS RINEX { "3" } (<c1/>).</b> První krok k interoperabilitě formátů GNSS: <c2/> čte navigační soubor RINEX { "3" }.x a dekóduje každý broadcast efemeridní záznam GPS (<c3/>), tedy osmiřádkový blok SV/epocha + <c4/>, do <c5/> keplerovských elementů a oprav hodin, s názvy polí a jednotkami podle IS-GPS-200. Zvládá fortranský formát čísel s exponentem <c6/> (<c7/>) a rozvržení do sloupců pevné šířky; záznamy jiných systémů než GPS se přeskakují, nikoli odmítají, takže smíšený soubor stále poskytne své efemeridy GPS. Čtyři testy: parsování exponentu <c8/> (včetně prázdných hodnot a chyb), úplný záznam dekódovaný proti známým hodnotám polí s kontrolou věrohodnosti hlavní poloosy GPS (√A² ≈ { "26 560" } km), přeskakování záznamů jiných systémů než GPS a případ prázdného souboru.

seg-9c4a068f204c = Broadcast efemeridy GPS → poloha v ECEF (<c1/>).

seg-5deeec4b8cc9 = <c1/> vyhodnocuje polohu družice v systému pevném se Zemí ze zpracovaných efemerid uživatelským algoritmem IS-GPS-200 §{ "20.3.3.4.3.1" }: Newtonovo řešení Keplerovy rovnice pro excentrickou anomálii, korekce druhé harmonické argumentu šířky, poloměru a sklonu a rotace do ECEF zohledňující rotaci Země od referenční epochy (s hodnotami GPS <c2/> a <c3/> předepsanými specifikací a přeložením <c4/> při přechodu týdne). Tři testy: geocentrický poloměr zůstává v pásmu GPS (≈ { "26 560" } km), rychlost vůči Zemi je ~{ "3.9" } km/s a vyhodnocení o celý týden dál reprodukuje stejnou polohu.

seg-583433389a70 = Posun hodin družice GPS s relativistickou korekcí (<c1/>).

seg-957588ed5dff = <c1/> vyhodnocuje broadcast polynom hodin <c2/> okolo <c3/> plus relativistický člen excentricity <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). Nová <c5/> převádí kalendářní epochu záznamu na čas GPS v týdnu pomocí aritmetiky juliánského dne od epochy GPS (1980-01-06) a řešení Keplerovy rovnice je sdíleno s vyhodnocením polohy. Testy: čas GPS v týdnu pro neděli/úterý/sobotu (hranice týdne) a posun hodin s dominantním af0 a přítomným, omezeným relativistickým členem. Skupinové zpoždění L1 <c6/> je zpřístupněno, ale záměrně se nezapočítává. Poctivý rozsah: zdroj <c7/>, Galileo/BeiDou/GLONASS a SP3 zůstávají dalšími kroky. (<c8/> je aktualizován tak, aby odpovídal.)

seg-ef971feff16c = <b>Uživatelem spustitelný druh scénáře <c1/> (<c2/>).</b> Schopnost dostupnosti RAIM je nyní dosažitelná z CLI/TOML jako každý jiný balíček: <c3/> zpracuje <c4/> (dráhu uživatele, jednu či více konstelací GNSS, elevační masku a integritní konfiguraci <c5/>), spustí <c6/> a vydá mapu dostupnosti HPL/VPL po epochách jako JSON plus samostatné SVG: ochranné úrovně v čase proti poplachovým limitům se zeleno-červeným pruhem dostupnosti. <c7/> zapíše JSON, graf a zprávu HTML. Přibalený scénář (Walkerova konstelace o 24 družicích, dvoufrekvenční měření vzdálenosti { "1" } m, limity APV-I) uvádí dostupnost ~{ "95" } %; dokumentuje, že jednofrekvenční RAIM u jediné konstelace nesplňuje vertikální limit APV-I, a proto se pro vertikální navádění používá SBAS/dvoufrekvenční režim/ARAIM. Testy pokrývají dispečink, JSON mapy dostupnosti a SVG.

seg-bbe5721c1785 = <b>Spustitelná dostupnost RAIM nad konstelací (<c1/>).</b> Modul integrity neměl žádného volajícího: <c2/> z něj dělá skutečný vstupní bod od začátku do konce. V každé epoše na časové mřížce propaguje viditelné družice (tytéž <c3/> SGP4/Kepler, které engine používá), vypočte ochranné úrovně bez poruchy a posoudí dostupnost vůči horizontálnímu a vertikálnímu poplachovému limitu; vrací <c5/> serializovatelný přes <c4/> (po epochách <c6/>/HPL/VPL/<c7/> plus podíl dostupnosti). <c8/> sdružuje <c9/> a <c10/> pro každou epochu je zpřístupněno volajícím, kteří si geometrii řeší sami. Tři testy: epocha posouzená jako dostupná podle limitů APV-I na geometrii deseti družic, učiněná nedostupnou nemožně přísným limitem, a úrovně <c11/> pod pěti družicemi; a běh od začátku do konce nad Walkerovou konstelací o 24 družicích, který dá konečnou mapu dostupnosti a lze jej serializovat. (Šest družic, tedy práh redundance zbytkového RAIM, poctivě <em>nesplňuje</em> APV-I ani při měření vzdálenosti { "1" } m; dostupnost APV-I vyžaduje hustší geometrii, kterou test používá.)

seg-91e32e587cb6 = <b>Akumulátor Stanfordova diagramu integrity (-ESA) (<c1/>).</b> Standardní způsob shrnutí integritního monitoru přes mnoho epoch: vynáší skutečnou chybu polohy (x) proti ochranné úrovni (y) a každou epochu zařazuje podle úhlopříčky <c2/> a poplachového limitu do <c3/> (PL ohraničuje chybu, v rámci AL), <c4/> (PL ohraničuje chybu, ale překračuje AL: bezpečné, nepoužitelné), <c5/> (PL < chyba ≤ AL) nebo <c6/> (PL < chyba a chyba > AL: nebezpečné selhání). <c7/> je čistý klasifikátor; <c8/> akumuluje body <c9/> vůči pevnému poplachovému limitu a zpřístupňuje počty v oblastech, dostupnost, součty integritních událostí a body serializovatelné přes <c10/> pro vykreslení a export do JSON. Čtyři testy: každá oblast (včetně hranice ohraničení při <c11/>), akumulace počtů a dostupnosti a obousměrný průchod JSON. Jde o výstupní vrstvu pro ochranné úrovně RAIM; zapojení do scénáře konstelace a validace na veřejném datovém souboru zůstávají položkami plánu.

seg-cdeb3a5a4acf = <b>RAIM se separací řešení (ve stylu ARAIM) (<c1/>).</b> Integritní monitor s více hypotézami vedle stávajícího reziduálního/paritního <c2/> podle chí kvadrát. Pro řešení nejmenších čtverců ze všech viditelných družic i pro každé dílčí řešení s vyloučením jedné družice vytváří separaci <c3/>, která je za bezporuchového stavu gaussovská s nulovou střední hodnotou a kovariancí <c4/> (identita vnořených estimátorů, platná, protože řešení ze všech viditelných družic je BLUE), a díky tomu poruchu jak <b>detekuje</b>, tak <b>identifikuje</b> postiženou družici (tu, jejíž vyloučení dává největší normalizovanou separaci). Horizontální a vertikální ochranné úrovně odpovídají standardnímu přidělení MHSS <c5/>, kde <c6/>, <c7/>. Nové <c8/>/<c9/> bez závislostí, postavené na stávající regularizované neúplné funkci gama modulu (<c10/>). Čtyři ručně odvozené testy: normální CDF / kvantilová funkce proti hodnotám z učebnic (Φ({ "1.95996" })={ "0.975" }, chvost { "1e-7" } = { "5.1993" }, symetrie); bezporuchová geometrie, která nevyvolá poplach a dá konečné, kladné HPL/VPL; 60σ systematická chyba jedné družice, která je detekována <em>a</em> správně identifikována (<c11/>); a minimální redundance šesti družic. Uzavírá na straně algoritmu mezeru P0 z auditu „tautologická integrita: žádný skutečný RAIM/HPL/VPL“; validace na datovém souboru gLAB a akumulátor Stanfordova diagramu zůstávají položkami plánu.

seg-67e771fc0a48 = Integrace GNSS/INS s uzavřenou smyčkou (<c1/>).

seg-5aa467783b99 = <c1/> zapojuje jádro chybového stavového EKF do tříosé strapdown mechanizace: každý vzorek IMU se opraví průběžnými odhady biasů, mechanizuje se vpřed a kovariance EKF se časově propaguje s odpovídajícím navigačním kontextem; každá fixace polohy a rychlosti GNSS vytvoří inovaci INS−GNSS a vrací odhadnutou <b>polohu, rychlost, chybu orientace (ψ, jako rotaci kvaternionem) a biasy akcelerometrů a gyroskopů</b> zpět do řešení a nuluje střední hodnotu chybového stavu. Zpětná vazba orientace (nejen biasů) je pro stabilitu nutná: náklon a bias akcelerometru tvoří vázanou dvojici, takže oprava jednoho bez druhého diverguje. INS a GNSS se porovnávají v lokální tečné rovině v soustavě NED s použitím vlastních poloměrů křivosti mechanizace (nové <c2/>; <c3/>/<c4/> zpřístupněno). Je to poctivá náhrada <em>resetu přichycením k pravdě</em> v hybridním balíčku. Tři testy: uzavřená smyčka vynulující vloženou chybu polohy { "8" } m / −{ "5" } m na <{ "0.1" } m; podpořené řešení zůstávající omezené na metry (<{ "6" } m) na jedoucí trajektorii, zatímco volně běžící INS diverguje přes { "100" } m; a milníkový benchmark: <b>RMS polohy sloučeného řešení metodou Monte Carlo při výpadku GNSS { "60" } s je lepší než u nepodporovaného dead-reckoneru s otevřenou smyčkou o více než { "2" }× (≈{ "4" }× napříč seedy)</b>. Poctivé omezení zdokumentované v modulu: ve volně vázaném režimu jsou bias akcelerometru a náklon jen slabě oddělitelné (oba se vážou přes gravitaci), takže dodanou hodnotou je omezený, opravený stav a čistý vstup do výpadku, nikoli přesná inerciální kalibrace; bohatší dynamika a těsně vázané rozšíření zůstávají položkami plánu.

seg-aa9bf0ff6f84 = <b>Jádro volně vázaného chybového stavového EKF GNSS/INS (<c1/>).</b> Rozšířený Kalmanův filtr s 15 chybovými stavy, <c2/>, s dynamikou chyb strapdownu podle Grovese { "2013" } §{ "14.2" } (vazba měrné síly a náklonu, Coriolis, projekce biasů z tělesné do navigační soustavy, Gaussovy–Markovovy modely biasů), diskrétním přechodem prvního řádu <c3/> a volně vázanou měřicí aktualizací polohy a rychlosti (<c4/>) v Josephově tvaru. Hustá lineární algebra bez závislostí (Gaussova–Jordanova inverze, Josephova aktualizace kovariance). Cargo feature <c5/> hradí zdokumentovanou, dosud neimplementovanou aktualizaci z pseudovzdáleností/Doppleru. { "7" } testů s ručně odvozenými očekáváními: identita antisymetrické matice/vektorového součinu, ověřená inverze { "3" }×{ "3" }, kovariance zůstávající symetrická/PSD při predikci (a nejistota polohy rostoucí bez podpory), fixace polohy zmenšující kovarianci polohy, přesné obnovení známé chyby polohy při analytickém Kalmanově zisku <c6/> a menší korekce při větším měřicím šumu. Je to jádro, které nahradí reset přichycením k pravdě s otevřenou smyčkou v hybridním balíčku zpětnou vazbou s uzavřenou smyčkou (zapojení do balíčku a validace proti NaveGo budou následovat).

seg-5be84079b8b6 = Deterministický model chyb IMU pro 3osý strapdown navigátor (<c1/>).

seg-492e670736b2 = <c1/> zkresluje skutečnou dvojici <c2/> v tělesné soustavě na měřenou prostřednictvím pěti systematických kategorií (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabulka { "4.1" }): <b>chyba měřítka</b> (chyba zesílení v ppm na osu), <b>nesouosost / křížová vazba</b> (nenulové mimodiagonální prvky vyjadřující neortogonalitu trojosy), <b>g-citlivost</b> (bias úhlové rychlosti gyroskopu úměrný měrné síle), <b>kvantizace</b> (zaokrouhlení na výstupní LSB) a <b>rate-ramp</b> (drift lineární v čase, třetí oblast Allanovy odchylky) plus konstantní bias při zapnutí. Každý člen je ve výchozím stavu nulový, takže <c3/> je průhledný průchod a stávající scénáře nejsou dotčeny. Každý zdroj chyby má izolační test (měřítko lineární na <{ "0.01" } %, nesouosost mezi osami nad úrovní VRW, bias g-citlivosti, mřížka LSB, lineární rampa) a test od začátku do konce pohání navigační chybu mechanizací ze zkresleného IMU. Nemodelováno: chyba usměrnění vibrací, drift teplotního gradientu. (Dodávaný balíček scénářů <c4/> stále běží s původním jednoosým (1-DOF) skalárním rozpočtem; tento model napájí 3osou knihovnu.)

seg-f57bc89d4688 = <b>Kompenzace coningu a scullingu pro strapdown integrátor.</b> Větev orientace přidává dvouvzorkový <c1/> (<c2/>); integrace hrubou frekvencí ({ "30" } Hz, 5 vzorků na cyklus) prostředí s coningem { "5" } Hz se ověřeně drží jemné referenční pravdy s korekcí o ≥ { "3" }× lépe než naivní sčítání přírůstků. Větev rychlosti přidává <c3/> (<c4/>, Groves rov. { "5.82" }) a převádí přírůstek rychlosti v tělesné soustavě přes novou aktualizaci <c5/> založenou na přírůstcích s použitím rotace vůči tělesu <c6/>, takže platforma pevná se Zemí nezaznamenává žádný falešný sculling, zatímco skutečná vibrace spustí celý člen.

seg-56c599250ed4 = Plná tříosá strapdown mechanizace v soustavě NED (<c1/>).

seg-d0897492e89b = <c1/> se posouvá voláním <c2/> podle standardních rovnic NED v pozemské soustavě (Groves §{ "5.4" }): orientace tělesná→NED opravená o rychlost setrvačná→navigační <c3/> (rotace Země + transportní rychlost); měrná síla převedená z tělesné soustavy do NED přes DCM; rychlost integrující <c4/> (Coriolis/transport + gravitace); a geodetická poloha přes poloměry křivosti meridiánu a příčného řezu. Gravitace je uzavřená Somiglianova <b>normální (olovnicová) tíže</b> podle WGS-84 s výškovou korekcí volného vzduchu podle NIMA, nikdy pevně zadaná konstanta. Je to skutečný tříosý navigátor, který nahrazuje jednoosou (1-DOF) skalární cestu rozpočtu chyb. Ověřeno fyzikálními invarianty: platforma přišroubovaná k rotující Zemi na { "45" }° s. š. (snímající rychlost rotace Země + { "1" } g) zůstane po dobu { "60" } s v rozmezí { "1" } mm; vodorovná měrná síla směrem na sever dává <c5/> a posun <c6/>; normální tíže odpovídá známým hodnotám na rovníku/pólu/45° a gradientu volného vzduchu.

seg-290b08199bfb = <b>Tříosá reprezentace orientace pro strapdown INS (<c1/>).</b> Typ jednotkového kvaternionu <c2/> (skalár první, Hamiltonova konvence) nesoucí rotaci tělesná→navigační soustava, s pohledem DCM (<c3/>/<c4/> Shepperdovou metodou), Hamiltonovým součinem, konstruktory z osy a úhlu a z rotačního vektoru (přesné exp-mapování) a kinematikou kvaternionů: jak aktualizací rychlosti prvního řádu RK (<c5/>), tak aktualizací rotačního vektoru s korekcí coningu. Dvouvzorkový <c6/> (Savage / Bryan–Lewantowski, <c7/>) dodává člen křížové vazby rotačních rychlostí, který skalární dead-reckoning vynechává. Je to základ orientace pro plnou 3osou mechanizaci, která nahrazuje původní jednoosou (1-DOF) cestu rozpočtu chyb. Ověřeno proti uzavřeným tvarům rotací: šíření s konstantní rychlostí souhlasí s kvaternionem osy a úhlu na { "1e-6" }, DCM jsou ortonormální s jednotkovým determinantem a coning mizí při pohybu v jedné ose. (<c8/> je nyní adresář modulu <c9/>; veřejná cesta <c10/> se nemění.)

seg-5e6e5bba25a5 = Geodeticky správná viditelnost z pozemní stanice (<c1/>).

seg-69bdb1e5bfc8 = <c1/>, <c2/> a <c3/> počítají elevaci družice nad horizontem pozemní stanice vůči <b>normále elipsoidu WGS-84</b> (skutečné místní svislici), nikoli vůči geocentrickému průvodiči; ty se liší až o geodetickou odchylku ~{ "0.19" }°, což stačí k tomu, aby družice blízko horizontu vstoupily do elevační masky nebo z ní vypadly. Ověřeno od začátku do konce (propagovaná Walkerova konstelace, otočená TEME→ECEF a spočítaná z geodetického místa) i proti geocentrické aproximaci.

seg-4de1d79d2e76 = <b>Spolehlivost CI.</b> Úloha <c1/> nyní sestavuje wheel pomocí <c2/> (kontejner manylinux) místo surového hostitelského <c3/>, čímž odpadá občasný konflikt rustup <c4/>/<c5/> na obrazu runneru. Úloha <c6/> instaluje <c7/> jako předem sestavený binární soubor přes <c8/> místo akce <c9/> založené na Dockeru, čímž odpadá vypršení časového limitu při stahování z registru Docker Hub. Žádná ze změn neovlivňuje prováděné kontroly.

seg-05055c993904 = Setrvačná rychlost je zpřístupněna dále v řetězci.

seg-1228235c99b6 = <c1/> a <c2/> (vracející <c3/>) předávají volajícím v m/s analytickou rychlost TEME, kterou SGP4 už počítá, ale dříve ji zahazoval; <c4/> dává keplerovské cestě konzistentní rychlost. Ověřovací test AIAA 2006-6753 nyní u každého referenčního řádku kontroluje i rychlost (nejhorší chyba rychlosti { "1.85e-9" } km/s napříč všemi { "666" } stavy) a přesně fixuje počet porovnávaných řádků na { "666" }.

seg-8ac2598291b8 = <b>Přísnější parsování TLE odolné proti panice.</b> Řádky musí být ASCII a řežou se bezpečně (už žádné panicy z indexu bajtů při vícebajtovém vstupu); elementy se kontrolují na rozsah (sklon, excentricita, střední pohyb); kontrolní součet ve sloupci 69 lze vynutit přes <c1/> / <c2/> a nový příznak <c3/> u <c4/> (ve výchozím stavu tolerantní).

seg-1cd2c6621a04 = <b>Křivka Allanovy odchylky ve výstupu.</b> Každý běh hodin nyní uvádí <c1/> (<c2/>) a prohlížečové hřiště vykresluje log-log graf „Stabilita hodin (ADEV)“.

seg-c76ff20811e7 = Validace vstupní časové mřížky.

seg-75436d067802 = <c1/> odmítne neplatnou (nekonečnou či NaN), nulovou, zápornou nebo příliš velkou časovou mřížku (krok větší než doba trvání nebo více než <c2/> vzorků) před jakoukoli alokací, takže chybně utvořený scénář vrátí chybu místo panice nebo vyčerpání paměti.

seg-d0a8ce50cf6e = Soubory běhů Monte Carlo pro inerciální balíček.

seg-3225674ce4ea = <c1/> u inerciálního scénáře spustí N seedů a uvede u každé metriky průměr, směrodatnou odchylku, percentily a percentilový bootstrapový { "95" }% interval spolehlivosti (<c2/>). Každý inerciální běh nyní nese příznak <c3/>, takže ukazatel kvality z jediné realizace už nelze zaměnit za rozdělení. (CEP/2DRMS se záměrně neuvádějí: vyžadují 3osý model, který je v plánu.)

seg-2967872bfca1 = <b>Řízený režim hřiště.</b> Prohlížečové hřiště vás už nehodí rovnou na holou zeď TOML: pás „Začněte zde“ s kartami scénářů na jedno kliknutí načte a spustí propracovaný příklad, posuvníky zpřístupňují univerzální ovladače (seed, časový práh) bez zásahu do TOML, poznámka „Jak to číst“ vysvětluje výsledek a celé TOML je na jedno rozbalení. Každý běh lze sdílet: <b>Zkopírovat odkaz ke sdílení</b> zakóduje celý scénář do fragmentu URL (nic se nenahrává), takže odkaz při načtení reprodukuje přesně týž běh. Kodek má jednotkové testy (<c1/>, spouštěné v CI).

seg-2e47e8864718 = N-rozměrné průchody parametrů (<c1/>).

seg-5076a9ad20d7 = <c1/> vyhodnotí metriku nad úplným kartézským součinem rozsahů několika <c2/> (víceparametrová studie kompromisů), deterministicky, v pořadí po řádcích. Doplňující: stávající API 1-rozměrného průchodu zůstává beze změny. Bootstrapové intervaly spolehlivosti pro jednotlivé uzly a zobecnění nad rámec balíčku hodin zůstávají v plánu.

seg-958718831037 = <b>Skutečný snapshotový RAIM (<c1/>).</b> Skutečná autonomní monitorace integrity přijímače v oblasti polohy: sestaví geometrii zorných přímek k viditelným družicím, vytvoří řešení nejmenších čtverců a rezidua, provede test detekce poruch z reziduí χ² (přesný práh z neúplné gama funkce a necentrálního χ² bez závislostí) a vypočte horizontální a vertikální ochranné úrovně (HPL/VPL) založené na sklonu, s odchylkou nezachycené události odvozenou pro nastavené P_fa/P_md. To se liší od ukazatele Integrity (filtrové vnitřní konzistence) v řetězci scénářů a <b>zatím do něj není zapojeno</b>; vyloučení poruchy, rozpočtování alert-limit/P_HMI a ARAIM zůstávají v plánu.

seg-1675540acbd9 = <b>Sada stability frekvence: MDEV, TDEV, HDEV + intervaly spolehlivosti</b> (<c1/>). Vedle překrývající se ADEV: modifikovaná Allanova odchylka (odděluje bílý od flicker fázového šumu), časová odchylka (<c2/>) a Hadamardova odchylka (přesně potlačuje lineární drift frekvence a konverguje pro divergentní typy červeného šumu). Intervaly spolehlivosti založené na χ² (<c3/>) používají dvojici normálního a χ² kvantilu bez závislostí (Acklam + Wilson-Hilferty) s konzervativním nepřekrývajícím se edf; edf specifické pro typ šumu a číselná shoda se Stable32 zůstávají v plánu.

seg-446a9ed4467c = <b>Redukce referenčních soustav (<c1/>).</b> Rotace TEME↔ECEF založená na GMST (používá tentýž hvězdný čas IAU-1982 jako propagátor), přesná geodetická↔ECEF podle WGS-84 s iterativní inverzí s Bowringovým počátečním odhadem (přesnost stroje ve všech výškách, včetně MEO/GEO) a geodetický pozorovatel pozemní stanice, který vrací azimut / elevaci / vzdálenost v místní soustavě východ-sever-nahoru. Pohyb pólu a nutace pod úhlovou vteřinu se neaplikují (pouze GMST, pod kilometr na pozemní stopě); přesný řetězec CIO podle ITRF je v plánu.

seg-9f6f53583cf5 = <b>Základ časových stupnic (<c1/>).</b> API juliánských dat bez závislostí (gregoriánské občanské datum ↔ JD, MJD), úplná celočíselná historie přestupných sekund IERS (UTC↔TAI, { "10" } s v roce { "1972" } až { "37" } s od roku { "2017" }), definovaný posun TAI→TT, oprava UT1 přes dodané DUT1 a úhel rotace Země IAU-2000. To je časový základ, na kterém stojí redukce na soustavu pevnou se Zemí (plánovaná). Okamžiky jsou juliánská data s jediným <c2/> (rozlišení ~{ "50" } µs v blízkosti současné epochy; dvoudílné JD je v plánu) a éra gumových sekund před rokem 1972 se nemodeluje; obojí je zdokumentováno v modulu.

seg-6ecc053f101f = <b>Reprodukovatelnost a původ.</b> Deterministický generátor SBOM CycloneDX (<c1/>) a atestace původu sestavení SLSA u binárního souboru vydání a SBOM; toolchain vydání je připnut tak, aby odpovídal CI. Záruky determinismu, výhrada k <c2/> napříč platformami a přístup připínání zlatých hodnot jsou zdokumentovány v <c3/>.

seg-3e98dcdcb82b = <b>Testy založené na vlastnostech a fuzz testy</b> (<c1/>). Deterministické náhodné testy (bez nové závislosti) ověřují invarianty na tisících vstupů: parsery TLE a scénářů nikdy nespadnou na nesmyslném, ne-ASCII, mutovaném nebo useknutém vstupu; <c2/> nikdy nespadne na mřížkách s NaN/inf/zápornými hodnotami; kontrolní součet TLE je konzistentní a týká se jen sloupce 69; obousměrné převody geodetická↔ECEF a rotace TEME→ECEF zachovávají normu v celém světě a v širokém pásmu výšek.

seg-ea252b5d7427 = Zlaté testy nyní <b>fixují ukazatele kvality pole po poli</b> u čtyř referenčních scénářů (s tolerancí pohlcující kolísání <c1/> napříč platformami) a nahrazují dřívější kontroly pouhých nerovností, takže tichá numerická regrese je zachycena okamžitě.

seg-4b2a0b78984b = <c1/> ve výsledných artefaktech zvýšeno z <c2/> na <c3/> (byla zamrzlá, zatímco engine pokračoval dál).

seg-ecafa9d44810 = <c1/> nyní <b>zamítá</b> (nikoli jen varuje) stažené (yanked) závislosti.

seg-c48af44de5b4 = Nové dokumenty: <c1/> (mapa poctivého rozsahu), <c2/> (reference polí výsledku), <c3/>, <c4/>, <c5/>. Ochrana v CI selže, pokud se odznak verze v README rozejde s <c6/>.

seg-8ef32ebec7f5 = <b>Propagace oběžné dráhy SGP4/SDP4.</b> Úplná implementace standardního propagátoru zjednodušených poruch bez závislostí: SGP4 pro blízkozemní dráhy spolu s rozšířením SDP4 pro hluboký vesmír (luni-solární sekulární a periodické poruchy a rezonance geopotenciálu { "12" } h / { "24" } h). Je ověřena proti oficiálním ověřovacím vektorům AIAA 2006-6753 („Revisiting Spacetrack Report #3“): všech { "666" } referenčních stavů napříč případy blízkozemními, hlubokého vesmíru, rezonančními a chybových kódů souhlasí s nejhorší chybou polohy asi { "4" } mm. Je to model, vůči kterému jsou dvouřádkové sady elementů definovány, takže reprezentuje skutečné konstelace, zejména dráhy GNSS s periodou ~{ "12" } h, které jsou v hlubokém vesmíru a rezonanční a které dřívější model dvou těles + sekulárního J2 zachytit nedokáže.

seg-06a77fb9233e = Konstelace zadaná jako <b>úplné dvouřádkové sady elementů</b> (řádek { "1" } + řádek { "2" }) se nyní propaguje pomocí SGP4/SDP4; konstelace zadaná jen elementy z řádku 2 zachovává analytickou keplerovskou propagaci dvou těles beze změny. Obě formy lze v jednom bloku míchat. Nový referenční scénář <c1/> (konstelace MEO podobná GPS ve skutečném dvouřádkovém formátu, propagovaná pomocí SGP4): vložte aktuální sadu „gps-ops“ z Celestraku a prostudujte živou konstelaci.

seg-2dbb4054e9b8 = <b>Demonstrátor aktivního útoku spoofingem.</b> Nový druh scénáře <c1/> vkládá narůstající falešný časový spoof a spouští u každých hodin monitor integrity podporovaný hodinami; uvádí, zda a kdy je spoof detekován a zda se bez detekce dostane k provozní specifikaci, a mění tak ukazatel kvality Security na konkrétní ukázku útoku a obrany. Nový referenční scénář <c2/>.

seg-aa0cb8038baa = <b>Dostupnost při více konstelacích.</b> Scénář dráhy může kombinovat několik konstelací (seznam <c1/> vedle primární <c2/>) pro dostupnost multi-GNSS a faktor zhoršení přesnosti (DOP), například GPS plus Galileo. Nový referenční scénář <c3/>.

seg-9b9dcd5be0a7 = <b>Zpráva HTML se skóre.</b> Každý běh nyní vytváří i samostatnou HTML kartu skóre s brandingem: jednořádkový souhrn, graf (vložený jako inertní obrázek data-URI) a úplný JSON; zapisuje je CLI vedle JSON a SVG. Sdílitelný jednosouborový artefakt pro výstup studie nebo přílohu.

seg-76c573048a91 = <b>Společný estimátor fúze senzorů.</b> Nový druh scénáře <c1/> spouští jediný rekurzivní Kalmanův filtr jako navigační řešení: slučuje stav hodin <c2/> a stav polohy <c3/>, je disciplinován GNSS (učí se frekvenční offset a rychlost) a během výpadku podporován optickým přenosem času, místo skládání nezávislých prediktorů. Uvádí sloučený holdover času a polohy a integritu ze společné kovariance. Nový referenční scénář <c4/>.

seg-10f0501c91ef = <b>Úplnější model šumu IMU.</b> Akcelerometr nyní modeluje zbývající členy Allanova rozptylu nad rámec konstantního biasu a náhodné procházky rychlosti: <b>nestabilitu biasu</b> (flicker 1/f na úrovni standardního Allanova koeficientu nestability biasu, s využitím flicker syntézy hodin) a <b>náhodnou procházku zrychlení</b>. Nová volitelná pole <c1/> a <c2/> inerciálního scénáře; nová fixace GNSS rekalibruje zbytkový drift biasu.

seg-251ffc7b7722 = <b>Skutečná geometrie konstelace z TLE.</b> Konstelaci lze zadat jako blok dvouřádkových sad elementů (standardní formát NORAD/Celestrak) přes pole <c1/>, takže dostupnost a faktor zhoršení přesnosti používají zveřejněnou geometrii skutečné konstelace místo syntetického Walkerova vzoru. Engine čte střední keplerovské elementy každého TLE a propaguje je jako dvě tělesa, nikoli SGP4, což je pro snímkovou studii od společné epochy rozumné. Nový referenční scénář <c2/>.

seg-7deb93b51cc7 = <b>Průchody parametrů pro studie kompromisů.</b> Nový druh scénáře <c1/> mění jeden parametr (<c2/>, <c3/>, <c4/> nebo <c5/>) v lineárním či logaritmickém rozsahu a v každém bodě zaznamenává zvolený ukazatel kvality pro oba typy hodin; vzniká tak srovnávací graf „jak roste holdover se stabilitou hodin?“, který návrhový kompromis potřebuje. Nový referenční scénář <c6/>.

seg-ef6f3e77b476 = <b>Pásma spolehlivosti Monte Carlo.</b> Scénář holdoveru hodin může spustit mnoho realizací (nové volitelné pole <c1/>): každý ukazatel kvality se pak uvádí jako průměr s rozptylem mezi 5. a 95. percentilem a graf vybarví { "5" }–{ "95" }% obálku chyby kolem mediánu pro každé hodiny. Výchozí zůstává jediný běh. Nový referenční scénář <c2/>.

seg-e70cc0973fa3 = <b>Excentrické dráhy a drift J2.</b> Typ dráhy je nyní plná keplerovská dráha (hlavní poloosa, excentricita, sklon, RAAN, argument perigea, střední anomálie), propagovaná řešením Keplerovy rovnice, s volitelnou sekulární nodální regresí a apsidální precesí J2. Nová volitelná pole scénáře <c1/>, <c2/> a <c3/> a referenční scénář <c4/> (uživatel na vysoce excentrické kritické dráze se sklonem a periodou { "12" } h). Kruhové dráhy zachovávají původní uzavřenou cestu bit po bitu.

seg-cc041e16d418 = Hybridní balíček (kombinované PNT) nyní uvádí <b>Integrity</b> a <b>Security</b>, takže všechny čtyři balíčky pokrývají plnou sadu provozních ukazatelů kvality. Integrity je zahrnutí do ochranné meze časového kanálu z Kalmanova estimátoru disciplinovaného k pravdě, dokud je GNSS nominální, a (volněji) znovu ukotveného při každé optické resynchronizaci; jeho mez zahrnuje podlahu měřicího šumu spoje, takže hodiny mnohem lepší než spoj jsou hodnoceny proti skutečnému šumu dodaného řešení. Security je skóre detekce spoofingu podporované hodinami proti časové specifikaci.

seg-e0b666457d6e = Poznámky k vydání se nyní generují z upravené sekce CHANGELOG pro daný tag (<c1/>), takže každé vydání na GitHubu zdůrazňuje, co se změnilo, místo výpisu surových commitů.

seg-f785718e9454 = Ukazatel kvality <b>Security</b> (dříve nenaplněný): skóre detekce spoofingu podporované hodinami pro balíčky holdoveru hodin a dráhy. Modeluje monitor integrity, který porovnává čas odvozený z GNSS s vlastní extrapolovanou predikcí hodin přes koherentní okno; práh detekce kombinuje zprůměrovaný měřicí šum s nejistotou extrapolace hodin, takže tišší hodiny detekují menší, pomalejší časové spoofy. Skóre se uvádí v <c1/> vztažené k časové specifikaci, čímž je dokončeno šest provozních ukazatelů kvality.

seg-9164140872c8 = <b>Přesnost polohy</b> odvozená z geometrie pro balíček dráhy: z geometrie zorných přímek k viditelným družicím sestaví matici návrhu a faktor její kovariance <c1/> a získá faktory zhoršení přesnosti (GDOP/PDOP/HDOP/VDOP/TDOP). Přesnost polohy je poziční DOP vynásobený nastavitelnou ekvivalentní chybou měření vzdálenosti uživatele (nové volitelné pole scénáře <c2/>). Výsledek dráhy nyní nese souhrn geometrie (podíl vzorků s fixací, nejlepší a mediánové PDOP a sigma polohy).

seg-3285502161c6 = <b>Hřiště</b> v prohlížeči (<c1/>), které spouští engine na straně klienta jako WebAssembly: vyberte referenční scénář nebo upravte TOML, spusťte jej a uvidíte souhrn, graf i úplný JSON, aniž by se cokoli nahrávalo. Workflow <c2/> jej sestaví a publikuje na GitHub Pages a nový export WebAssembly <c3/> zajišťuje výpis.

seg-0dca5318f7ce = Popsané osy y u grafů SVG: mřížky, číselné popisky dílků a název osy s jednotkami (přes sdílenou pomocnou funkci <c1/>), takže jsou veličiny čitelné.

seg-ce84a3d61f19 = Workflow publikace balíčků (<c1/>) pro crates.io, PyPI a npm, každý podmíněný svým tokenem registru a spouštěný publikovaným vydáním.

seg-0f01369fc29b = Flicker (1/f) FM podlaha modelu chyby hodin, syntetizovaná jako součet logaritmicky rozmístěných Ornsteinových–Uhlenbeckových procesů a kalibrovaná tak, aby plochá podlaha Allanovy odchylky ležela na nastavitelné úrovni. Ve výchozím stavu vypnuto; zapíná se u každých hodin volitelným polem scénáře <c1/>.

seg-5b7fcd386fd3 = Kanál gyroskopu pro inerciální model: zbytkový bias gyroskopu a náhodná procházka úhlu pohánějí chybu orientace (náklonu), která převádí gravitaci do horizontální chyby měrné síly, což je dominantní mechanismus růstu chyby strapdownu. Ve výchozím stavu vypnuto; zapíná se u každého senzoru volitelnými poli <c1/> a <c2/>.

seg-efe9f10d2641 = Dvoustavový (fáze, frekvence) Kalmanův estimátor hodin s přesnou diskretizací procesního šumu podle van Loana. Extrapolace ze známého stavu přesně reprodukuje analytický růst chyby holdoveru (<c1/>) a filtr navíc poskytuje online mez nejistoty 1 sigma.

seg-539e24f34ed1 = Běh hodin nyní uvádí ukazatel kvality <b>Integrity</b> (dříve nenaplněný): podíl vzorků výpadku, jejichž chyba zůstává uvnitř ochranné meze 3 sigma filtru, zobrazený ve výsledném JSON a v souhrnu CLI.

seg-80620c97e3f5 = Dostupnost GNSS odvozená z geometrie: propagace kruhové dráhy, generátor konstelace Walker-delta a viditelnost po zorné přímce (zákryt Zemí plus elevační maska) vytvářejí časovou osu dostupnosti ze skutečné orbitální geometrie. Nový druh scénáře <c1/> a referenční scénář <c2/> (kosmická loď uvnitř slupky GNSS s přerušovaným pokrytím).

seg-67549163ad7d = Volitelné rozšíření pro Python (PyO3, abi3) zpřístupňující <c1/>, <c2/> a <c3/>, zabalené pomocí maturin (<c4/>) a sestavené pro Linux, macOS a Windows workflow <c5/> spouštěným tagem vydání. Vazba je volitelná závislost řízená feature: výchozí sestavení, testy a brána auditu závislostí nejsou dotčeny.

seg-c76dc363f0b1 = Volitelný modul WebAssembly (wasm-bindgen) zpřístupňující <c1/>, <c2/> a <c3/>, sestavený pomocí wasm-pack pod feature <c4/>; <c5/> je podmíněn cílem, aby na <c6/> používal zdroj entropie prohlížeče.

seg-cf1b0eef2201 = Sdílené rozdělování <c1/> používané CLI i oběma vazbami, takže se příkazový řádek a vazby nemohou rozejít.

seg-8d4f855d11bd = Hodnocení holdoveru je nyní vědomé segmentů: časové osy výpadků se při opětovném získání GNSS dělí na souvislé segmenty a uváděný holdover je nejhorší (nejkratší) extrapolace napříč nimi. Scénáře s jediným výpadkem zůstávají beze změny. Platí pro hodnotitele hodin, inerciální i hybridní.

seg-8b3556d125ed = Uváděné <c1/> inerciálního modelu je nyní <c2/> (dříve <c3/>), což odráží sloučené kanály akcelerometru a gyroskopu.

seg-d842f9cc0a9c = První vydání.

seg-962b75c38735 = <b>Deterministický simulační engine</b> pro hybridní kvantové/klasické PNT: společné rozhraní modelů chyb, deklarativní scénáře dostupnosti GNSS, estimátory holdover / dead-reckoning a hodnocení ukazatelů kvality podle standardních provozních kritérií PNT. Výsledky jsou reprodukovatelné z <c1/> (verzovaný, sám sebe popisující JSON s hashem scénáře) a vykreslují se jako grafy SVG. CLI rozděluje scénáře podle <c2/>.

seg-16e574edc3a8 = <b>Čtyři balíčky senzorů</b>, každý kalibrovaný na zveřejněná data a ověřený proti standardnímu vztahu:

seg-b49bbb60c2cd = <b>Holdover hodin</b>: bílý FM, FM náhodné procházky a lineární stárnutí; ověřeno překrývající se Allanovou odchylkou (Riley, NIST SP { "1065" }). Čipové atomové hodiny oproti optickým hodinám se stronciovou mřížkou.

seg-be2c5f28b256 = <b>Inerciální dead-reckoning</b>: zbytkový bias + náhodná procházka rychlosti, dvakrát integrované na chybu polohy; ověřeno proti Grovesovým vztahům růstu chyby. Studený atom oproti akcelerometru navigační třídy.

seg-fcb0f72db736 = <b>Přenos času</b>: časový jitter optického oproti RF spoji → přesnost synchronizace → jednosměrné určování vzdálenosti.

seg-93e5f2f70b58 = <b>Hybridní fúze (závěrečný balíček)</b>: kombinovaná sada PNT, která musí držet čas i polohu, s volitelným podporováním hodin optickým mezidružicovým přenosem času.

seg-e0a8cbe0c105 = <b>Jeden citovaný referenční scénář na balíček</b> v <c1/>, přičemž každý číselný parametr nese recenzovaný <c2/>.

seg-8f1cc09b2513 = <b>Ochrany reprodukovatelnosti a čistoty repozitáře</b>; CI (formát, clippy, testy, ochrany, MSRV) a potrubí vydání podmíněné tagem, které znovu spouští všechny kontroly.

seg-8b4e21f56334 = <b>Dokumentace</b>: README s architektonickými diagramy, zpráva o stavu validace, příručka pro přispěvatele, bezpečnostní politika a kodex chování; licence Apache-2.0; šablony issue/PR a konfigurace Dependabotu.

seg-e26d94f06ead = Celé neutrální vůči dodavatelům; recenzované vědecké a metrologické citace zachovány.

seg-84cb67686edf = Čistota licence Apache-2.0: hlavičky SPDX ve všech zdrojích, soubor <c1/> s upozorněním na ochranné známky, schvalování příspěvků podle Developer Certificate of Origin (DCO) a vynucování licencí a upozornění závislostí v CI pomocí <c2/>.

seg-a0f14bea7532 = Pozicování open-core (README): bezplatný engine Apache-2.0 plus dostupná komerční podpora, integrace a proprietární rozšíření od Ashforde OÜ, financované službami, nikoli licenčními poplatky.

seg-899815063eb1 = <c1/>, aby software bylo možné citovat.

seg-15f45d8ccb0f = <s1>Předchozí</s1>Kde { -brand } stojí

seg-cd8a14a9e8ec = <s1>Další</s1>Licencování

seg-05d0c798a196 = { "0.40" } přidává vlákno mise ve stylu Artemis a jeho lunární část, štítek důkazů u každého čísla a každé tabulky, které běh zapíše, načítání a fitování změřených hodin, kontrolu podání od datových partnerů, odhadovanou oblast zdroje rušení z hlášení ADS-B nebo AIS, rekampaň benchmarku { "0.40" } a příkazový řádek, zprávy a Studio v sedmnácti jazycích vedle angličtiny (strojové dokumenty zůstávají anglicky). Verifikační matice roste ze { "388" } na { "401" } řádků: { "176" } VALIDATED (beze změny), { "221" } MODELLED (bylo { "208" }) a { "4" } PARTNER. Žádný řádek nebyl povýšen na VALIDATED. Druhy scénářů rostou z { "87" } na { "92" }. Každý práh, který předregistrované srovnání nesplnilo, je uveden níže a zůstává zafixován; žádný nebyl zmírněn. Poradní prohlášení se nemění: Kshana je software pouze poradního charakteru, nikoli typově schválené navigační zařízení a nikoli certifikace; za navigaci zůstává odpovědný provozovatel.

seg-738f33f0ae8a = Známá omezení

seg-d4062fab7ae1 = Běhy v jiném jazyce než angličtina trvají zhruba dvakrát déle, protože se scénář spouští dvakrát (jednou v angličtině pro strojové soubory, jednou ve zvoleném jazyce pro člověka).

seg-8db6dedc627a = Některé věty Studia jsou složeny z fragmentů a v jazycích s gramatickým rodem v nich mohou chybět členy.

seg-86e6e35ac846 = Překlady jsou strojové překlady, které žádný rodilý mluvčí nezkontroloval; referenční je angličtina.

seg-dd7ee240b467 = <b>Sedmnáct jazyků vedle angličtiny</b> pro text enginu určený lidem a pro web a Studio: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans (<c1/>, <c2/>, proměnné prostředí pro locale; <c3/> u volání knihovny, Pythonu, WebAssembly a MCP). Zprávy a chyby příkazového řádku, souhrny běhů, text grafů, <c4/>, popisy druhů a poradní prohlášení jsou přeloženy; strojové dokumenty (JSON, CSV, kódy chyb, verifikační matice) zůstávají anglicky a běh v jiném jazyce než angličtina spouští scénář jednou v angličtině pro strojové soubory a jednou ve zvoleném jazyce pro člověka (<a1><c5/></a1>). <b>Překlady jsou strojové překlady, které nezkontroloval žádný rodilý mluvčí; referenční je angličtina</b>; <c6/> každého jazyka uvádí, co má recenzent zkontrolovat nejdřív, a stránky webu nesou upozornění, které to říká. Slova verdiktů, úrovně důkazů a rozsah poradního prohlášení („nejde o typově schválené“, „nejde o certifikaci“, „za navigaci zůstává odpovědný provozovatel“) zůstávají zachovány v každém jazyce.

seg-7a95c263ecec = <c1/>: <b>odhadovaná oblast zdroje rušení</b> z hlášení ADS-B nebo AIS. Posterior nad tím, kde se může nacházet zdroj zhoršených hlášení polohy (rádiová přímá viditelnost na poloměru 4/3 Země, výška antény zdroje a výkon marginalizovány, dotčená letadla přitahují a nedotčená letadla s přímou viditelností působí proti), zapsaný jako oblasti na úrovni { "50" }, { "90" } a { "95" } %, těžiště s elipsou nejistoty (nikdy holý bod), relace v čase (začátek, konec, trvání, dotčená plocha, odlišná letadla nad minimem pro zveřejnění), denní profil a hodiny za den, s volitelnou fúzí určení polohy TDOA z <c2/>. Výstupy: GeoJSON, souhrn JSON, CSV relací a obrázek SVG, každý nese licenci, uvedení autorství, id metody, předpoklady, omezení a svůj štítek důkazů. Knihovna <c3/>, Python a WebAssembly <c4/>. MODELLED (řádek registru <c5/>; matice má nyní { "401" } řádků, { "176" } VALIDATED, { "221" } MODELLED, { "4" } PARTNER); kalibrováno jen na syntetických datech, přičemž srovnání s místy vysílačů Jammertest { "2025" } bylo předregistrováno a provedeno jednou: ADS-B i AIS NOT ASSESSABLE (příliš málo plánovaných relací v otevřených datech), takže řádek zůstává MODELLED (<c6/>). Neutrální formulace, pouze agregovaně; zveřejňování oblastí zdrojů rušení ve veřejné observatoři zůstává vypnuto. Syntetický příklad je v <c7/> (<a1><c8/></a1>).

seg-b8f971ebf318 = Změřené záznamy hodin.

seg-59b240848747 = <c1/> načítá změřený záznam hodin do jedné fázové řady: osm formátů (RINEX clock, TimeLab, TICC, linuxptp <c2/>, <c3/> a <c4/>, sledování a statistiky chrony), každý jako zdokumentovaná podmnožina; vše mimo ni je odmítnuto s chybou, která uvádí, co bylo nalezeno. Používá je <c5/> (<c6/>) a druh clock (<c7/>, který přidává blok <c8/> s SHA-256 záznamu a překrývajícími se ADEV, TDEV a MTIE), spolu s přibaleným scénářem <c9/> (<a1><c10/></a1>). Srovnáno s allantools na skutečných veřejných datech proti předregistrovaným prahům: první běh <b>nesplnil</b> B1 ({ "5" } z { "11" } případů, všechna časová razítka TICC držená jako <c11/>), B2, B3 ({ "7" } z { "24" } případů) a B4 (verze hlavičky nebyla kontrolována); po opravách jsou B1, B3 a B4 splněny a B2 je splněn kromě jednoho páru MTIE, který je zafixován a není vadou enginu (allantools { "2024.6" } odstraňuje střední frekvenci před integrací; proti jeho fázovému MTIE se engine shoduje do { "1e-10" }). Řádek zůstává MODELLED (<c12/>).

seg-400a39dbf3dd = <b>Holdover řízený nafitovanou změřenou řadou</b>: <c1/> druhu clock fituje šum změřené řady a řídí z něj holdover (<c2/>, přibalený scénář <c3/>). Předregistrované srovnání: F1(b), F3 a F4 splněny; F1(a) (obnova registrovaného random-walk FM) <b>NOT MET</b> na záznamech C3 (z podstaty neidentifikovatelné) a na dvou ze tří záznamů C4 (random-walk FM pohlcen flicker FM a driftem); F2 (identifikace šumu proti allantools) splněno na jedenácti z dvanácti záznamů a D3 a <b>NOT MET</b> na D2, jak bylo registrováno (při srovnání na stejném základě splněno). Všechna nesplnění jsou zafixována (<c4/>); blok <c5/> a holdover jím řízený zůstávají MODELLED (<c6/>).

seg-f1f15e102774 = <b>Rekampaň benchmarku { "0.40" }</b>, předregistrovaná se schválením vlastníka před jakýmkoli během: A3 (EXPLORATORY, bootstrapové AUC <c1/> shlukované po složkách, kvantil { "2.5" } % { "0.8502" } proti { "0.80" }), D3 (EXPLORATORY, tři z pěti detektorů překračují rozdíl optimismu { "0.05" } při měřítku { "0.25" }), R3 (AUC { "1.0" }) a R4 (P_fa { "0.0" }, P_d { "1.0" }): všechny MET, všechny MODELLED. A2, D1 a R1 zůstávají nedotčeny a <b>NOT MET</b>; nic zde je neuzavírá (<c2/>, <a1>Bench</a1>).

seg-b13f2dae66ea = <c1/>: kontroluje formát a metadata podání datového partnera (<c2/>: zařízení, datový soubor a SHA-256, jak byl pořízen, řádky MODELLED, proti nimž je nabízen, licence, prohlášení) a načítá data čtečkami clock-log nebo IMU z enginu. Nic nehodnotí a nic neověřuje. Syntetický příklad je v <c3/>.

seg-823e1abc7f92 = <c1/>: které řádky MODELLED v registru by mohla povýšit změřená data, jaké formáty se přijímají, jak se podání kontroluje, hodnotí proti předregistrovanému prahu a připisuje a co znamenají PARTNER a VALIDATED; návrh oslovovacího textu pro vlastníka v <c2/> (nic se neodesílá).

seg-34bdcfd66ded = Ve větvi repozitáře, z níž tyto dokumenty pocházejí; zatím ne na GitHubu

seg-ddd45d39e8a9 = <b>Druhé kampaně pro nesplněné prahy <c1/> a <c2/></b>, provedené podle předregistrace (<s1><c3/></s1>, <s2><c4/></s2>; schváleno před jakýmkoli během). Každé původní nesplnění zůstává NOT MET a zafixováno. <c5/>: kontrola reprodukuje běh { "1" } buňku po buňce; pět ablací s jedním čtením přivede { "2" } ze { "78" } nesplněných buněk do tolerance (EXPLORATORY, bez prahu); nový práh S7b (tvar vysílání s poklesem a podlahou nafitovaný na panelech Classic IIR) je NOT MET na panelech IIR-M při { "3.83" } až { "3.95" } dB proti { "3" } dB; kampaň s odloženým zveřejněným příjmem neproběhla (nebyl zafixován žádný zdroj) (<s3><c6/></s3>). <c7/>: nové prahy C3a, C3b (mez detekce asi { "3e-9" } m/s2), Q3a, Q3b (přesná normální CDF odstraňuje rozdíl { "1.7e-6" }) a G3'' jsou splněny jako vlastní prahy a G3' s ilustračními apriorními rozděleními je splněn a označen EXPLORATORY (<s4><c8/></s4>). Vše zůstává MODELLED. Nové veřejné položky: <c9/>.

seg-bc89e70f4d36 = <b>Štítek důkazů u každého čísla a každé tabulky, které běh zapíše.</b> Výsledný JSON má klíč <c1/>, graf SVG prvek metadat a řádek pod grafem a tabulka CSV řádky komentářů <c2/>: úroveň (<c3/>, <c4/> nebo <c5/>, podle nejslabšího z řádků) a id řádků verifikační matice, na nichž běh stojí. Řádky a stavy se čtou z matice, nepíší se ručně; id jsou stabilní (<c6/> a osm hexadecimálních číslic, nový sloupec <c7/> v <c8/>, zmrazený seznam v <c9/>). Také u receiver-trust, <c10/>, <c11/>, zprávy o expozici trasy a, uvnitř podepsaného <c12/>, u každého balíčku důkazů (<c13/> { "1.1" }; <c14/> uvádí úroveň; balíčky vytvořené před { "0.40" } se ověřují beze změny). <c15/> selže, pokud číslo nemá štítek, štítek nesouhlasí s maticí nebo nový zapisovač souborů není ani označen, ani uveden s důvodem. Výstupy, které žádný nenesou, jsou uvedeny v <c16/>. Tři demonstrační grafy v README byly znovu vykresleny se štítkem (odstraněním štítku se vrátí původní bajty; <c17/>). Žádné tvrzení se nezměnilo.

seg-8abd87414bc4 = Druh scénáře <c1/> (<c2/>, <c3/>): rozpočet chyb navigace a času řetězce fází od startu po vstup do atmosféry, každé číslo MODELLED a každý vstup stanovený. Osm druhů fází: <c4/>, <c5/> (relativní kovariance Clohessy-Wiltshire po úsecích senzorů, dokovací okno), <c6/> (propagace Cowell s konečnědiferenční maticí přechodu stavu, chyba manévru, určení polohy <c7/> a aktualizace ze sledování ze Země, Měsíc z volitelného výřezu jádra DE440), <c8/> (sigma úhlu dráhy letu, pravděpodobnost koridoru, maximální zpomalení na okrajích koridoru, stopa přistání) a čtyři lunární druhy. Pravidla předání (<c9/>, <c10/>, <c11/>), převody soustav a časových stupnic jako samostatné řádky rozpočtu, volitelný překryv pozemní sítě, který stanoví vytížení sledování každé fáze, rezerva vůči stanoveným požadavkům a nejslabší článek. Příklad sleduje posloupnost veřejné prezentace NASA o koncepci provozu s ILLUSTRATIVE čísly: ucelený příklad ve stylu Artemis přes { "11" } fází, pozemní a lunární část. Cislunární propagace byla porovnána s veřejnou trajektorií Artemis I přes { "72" } h oblouk proti prahu zafixovanému v <c12/> před během: <b>NOT MET</b> ({ "45.3" } km a { "0.25" } m/s proti { "5" } km a { "0.05" } m/s). Diagnostika umisťuje nesplnění do pěti malých impulzních událostí v referenci; mezi nimi silový model reprodukuje hodinové stavy s mediánem { "0.4" } m. Řádek zůstává MODELLED (<c13/>).

seg-67cad0a9c0c4 = Lunární část vlákna mise ve stylu Artemis: čtyři druhy scénářů, z nichž každý je zároveň druhem fáze rozhraní <c1/> (<c2/>), každý MODELLED.

seg-63066076a0a8 = <c1/>: relativní navigace k dokování na kruhové polární dráze ve výšce { "100" } km nebo na eliptické polární dráze { "100" } km krát { "3000" } km (<c2/>, <c3/>). Dávkový odhad Gauss-Newton přes oblouk slučuje absolutní určení polohy na vozidlo z ilustrační sady relé třídy LCNS, trvalou chybu signálu ve vesmíru (společnou oběma vozidlům i nezávislou) a vzdálenost křížového spoje, v lunárním silovém modelu cratu. Uvádí relativní polohu a rychlost v lokálních osách cíle, dostupnost určení polohy, střední normalizovanou kvadratickou chybu odhadu proti její očekávané hodnotě, cenu zanedbání gravitačních harmonických, koncové modely relativních senzorů vedle údaje jen ze signálů a předávanou kovarianci 6x6.

seg-a2d67bb5cfb3 = <c1/>: rozpočet rozptylu přistání na jihopolárním místě (<c2/>; <c3/> čte DEM z LOLA z checkoutu): pětistavový inerciální model chyb po osách, určení polohy AFS (samostatné nebo diferenční, s využitím rezidua korekčního spoje z <c4/>), určení polohy vůči terénu (porovnávač <c5/> na svém syntetickém reliéfu, nebo mez Cramér-Rao porovnání s DEM z LOLA) a lunární čas přes hodiny vozidla (<c6/>). Uvádí elipsu přistání 3 sigma, každou kombinaci podpor a kalibraci elipsy metodou Monte Carlo.

seg-1babf99e8d56 = <c1/>: dostupnost určování polohy a času podle místa a roční doby (<c2/>; <c3/> přidává horizont z LOLA sledovaný paprskem): údaj o určení polohy pro jedno místo se rovná údaji <c4/> až na bit; s roční dobou se mění viditelnost Země a Slunce z analytických efemerid.

seg-bae659d0ff4d = <c1/>: výstup na oběžnou dráhu setkání a kovariance polohy a rychlosti přenesená zpět na dráhu (<c2/>), vedle ní uvedený rozptyl vypnutí motoru.

seg-106be12d960f = <c1/>; předregistrace, její dodatky a každý výsledek, včetně nesplnění, v <c2/>.

seg-5e8880c28a67 = Předregistrováno v <c1/> před jakýmkoli během, se šesti datovanými dodatky (každý učiněn před stažením dat, kromě dodatku { "6" }, který po stažení a před jakýmkoli výsledkem A2 opravuje aritmetickou chybu v počtu stavů; každý dodatek je v souboru zveřejněn). Žádný práh nebyl zmírněn.

seg-90adc3a3c58b = A1 (propagátor proti rekonstruované trajektorii LRO z JPL Horizons, { "24" } h): <b>MET</b>, maximální rozdíl ve 3D { "33" } m proti prahu { "500" } m a radiální rozdíl RMS { "2.4" } m proti { "60" } m.

seg-69f903a278eb = A2 (týž propagátor proti NRHO CAPSTONE přes jeden oběh o délce 6.5 dne): <b>NOT MET</b>, rozdíl koncové polohy { "136.8" } km proti prahu { "25" } km a rozdíl poloměru oskulační periapsidy { "28.4" } km proti { "10" } km. Řádek zůstává MODELLED a nesplnění je zafixováno v <c1/>.

seg-32fcafe8fa07 = B1 (konzistence odhadu setkání s vlastním modelem) je MET u čtvrtého návrhu odhadovače, střední NEES { "5.85" } až { "5.93" } proti pásmu [{ "5.2" }, { "6.8" }]; tři dřívější návrhy, rozšířený Kalmanův filtr ve třech variantách, pásmo nesplnily. Pátá změna, provedená poté, co se zjistilo, že dodávaný scénář o { "2" } h posílá { "4" } z { "50" } pokusů do lokálního minima (střední NEES { "1e9" }), spouští fit Gauss-Newton na rostoucím oblouku s půlením kroku; B1 se jí nemění a dodávané scénáře dávají { "6.51" } a { "6.33" }. Historie je v <c1/>.

seg-a4b6bfcb9984 = Nic zde není VALIDATED: řádky s orákuly testují sdílený propagátor, nikoli navigační filtr, signál ani rozpočet.

seg-29d014d29790 = Jedna aktualizace závislosti v dodávané knihovně (první položka), zbytek v nástrojích křížové validace (<c1/>).

seg-6b6a960ca7cf = <c1/>, <c2/> a <c3/> z verze { "0.13" } na { "0.14" } (spolu s <c4/> { "0.14.3" }, <c5/> { "0.17.0" } a <c6/> z verze { "0.5.5" } na { "0.7.10" }; také přímá závislost <c7/>, nyní { "0.7" }) odstraňují upozornění RUSTSEC-2026-0387, kolísání časování v <c8/> { "0.5.5" }. Kshana tyto knihovny používá jen k ověřování veřejných podpisů (kořenový klíč Galileo OSNMA a časová razítka RFC { "3161" }) a podepisuje jen v testech jednorázovými klíči, takže praktická expozice byla nulová; aktualizace odstraňuje upozornění bez položky ignorování. Zámkové soubory knihovny i MCP se mění oba; žádný výsledek ověření se nemění (testy vektorů OSNMA a časových razítek procházejí beze změny).

# text
seg-1a4cda9d1486 = Minimální podporovaná verze Rustu je nyní { "1.88" } (vyžaduje ji oprava RUSTSEC-2026-0387).

seg-0d4a740afedf = [{ $version }] - 2026-10-29
