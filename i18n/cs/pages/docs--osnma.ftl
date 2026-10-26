# docs--osnma: translations (cs)

seg-fcd0ebea49bc = Příkazový řádek

seg-6816f4e1a0a0 = Verze

seg-94058315dfe4 = Vstup

# c1: docs/OSNMA.md
seg-23746ba370c2 = Zdroj: <c1/>

seg-1e9c104231db = Ověřovač OSNMA Galileo na straně přijímače

seg-17fd702f5997 = Ověřovač na straně přijímače pro autentizaci navigačních zpráv otevřené služby Galileo (OSNMA), v čistém Rustu. Čte stránky I/NAV a hlásí pro každou družici a epochu, zda jsou navigační data kryptograficky ověřena, a proč kontrola selhala.

seg-ae081f55c4f1 = <b>Pouze poradní charakter.</b> Jde o výstup analýzy a monitorování a nikoli o typově schválené navigační zařízení. Zde hlášený stav ověření není službou integrity navigace a nesmí být jediným podkladem pro žádné rozhodnutí o navigaci ani bezpečnosti.

seg-84d7260098b1 = UPOZORNĚNÍ: duševní vlastnictví v rozhraní OSNMA Galileo

seg-6d78ccef53d5 = Kshana neuděluje žádná práva z duševního vlastnictví Evropské unie k řídicímu dokumentu rozhraní signálu ve vesmíru Galileo OSNMA (Signal-in-Space Interface Control Document, „ICD IPRs"). ICD nese vlastní oprávnění (jeho příloha E), které je nevýhradní a bezplatné a má vlastní podmínky, rozsah a omezení. Každý, kdo používá, sestavuje nebo distribuuje software založený na tomto modulu, se spoléhá přímo na toto oprávnění a musí si jeho podmínky sám přečíst a přijmout. Licence Kshana (AGPL-3.0-only, nebo komerční licence) se vztahuje pouze na vlastní kód Kshana.

seg-c13ad334bf9a = Tento modul implementuje algoritmy, které popisují níže uvedené dokumenty. Text ICD není reprodukován; číselné hodnoty (uspořádání polí, výčty, vyhledávací tabulka MAC) jsou vyjádřeny znovu ve vlastním zápisu Kshana, se zdrojem citovaným v kódu. ICD a Receiver Guidelines jsou © Evropská unie; zdroj je zde uveden. Kshanu nevyvíjí, nepoužívá, neschvaluje ani nepodporuje Evropská unie, Evropská komise, EUSPA ani jiný orgán.

seg-860096b04999 = Referenční dokumenty

seg-04c1e1a6278d = Vydává European GNSS Service Centre.

seg-278dd0f9df58 = Dokument

seg-3427e40d7bee = Datum

seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD („SIS ICD")

seg-f63fbc1175cf = Vydání { "1.1" }

seg-fa85e4db2c93 = říjen { "2023" }

seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

seg-907e4e46056c = Vydání { "1.3" }

seg-a9b75bc7f063 = leden { "2024" }

seg-530ae6421157 = Čísla oddílů a tabulek citovaná v kódu a zde odkazují na tyto verze.

seg-143726cc3d5f = Co se ověřuje

seg-029a9bb7608f = Řetězec důvěry, od kořene k datům:

seg-886f1b6556ce = <b>Veřejný klíč (ICD { "3.2.2" }, { "6.2" }).</b> DSM-PKR se složí z jeho bloků a jeho cesta Merkle se projde až k důvěryhodnému kořenu Merkle (SHA-256).

seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> DSM-KROOT se složí; jeho podpis ECDSA (P-256/SHA-256 nebo P-521/SHA-512) se ověří proti veřejnému klíči, který uvádí, přes hlavičku NMA a parametry řetězce.

seg-acc1f06cf63a = <b>Klíče TESLA (ICD { "5.5" }, { "6.4" }).</b> Každý klíč ve zprávě MACK se zpětně projde až ke KROOT nebo k dřívějšímu ověřenému klíči, pomocí hashovací funkce řetězce.

seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Pružná pole Tag-Info se kontrolují proti MACSEQ klíčem, který otevírá daný MACK.

seg-41ba810d7c8d = <b>Značky (ICD { "4.2" }, { "6.7" }).</b> Každá značka (tag) se přepočítá (HMAC-SHA-256 nebo CMAC-AES, zkrácené na délku značky řetězce) přes identity družic, čas podrámce, polohu značky, stav NMA a navigační data, která kryje, a porovná se. Zpracovávají se ADKD { "0" } (efemeridy, hodiny a stav), ADKD { "4" } (časovací parametry) a ADKD { "12" } (pomalý MAC, klíč zveřejněný o deset podrámců později), s křížovou autentizací družic, které samy OSNMA nenesou, a fiktivními značkami (COP { "0" }).

# c1: discarded
seg-1be16a4ca722 = Značka, která uvádí rezervovanou hodnotu nebo jejíž ADKD neodpovídá slotu vyhledávací tabulky MAC, se odloží stranou (Receiver Guidelines říkají ji zahodit) a hlásí se jako <c1/>, nikoli jako selhání.

# c1: bad_crc
seg-eb993b3a0d17 = Stránky se před čímkoli jiným kontrolují proti svému CRC (CRC-24Q systému Galileo); stránka, která neuspěje, se zahodí a nahlásí (<c1/>).

seg-c414a30d0840 = Hodnoty stavu

# c1: authenticated
# c2: failed
# c3: tag_mismatch
# c4: macseq_mismatch
# c5: key_chain_mismatch
# c6: key_conflict
# c7: pending
# c8: no_chain
# c9: awaiting_key
# c10: no_nav_data
# c11: unknown_maclt
# c12: unsupported_function
# c13: service_not_usable
# c14: chain_mismatch
# c15: discarded
# c16: authenticated
seg-268f61b565b9 = Na značku: <c1/>, <c2/> s důvodem (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> s důvodem (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>), nebo <c15/>. Fiktivní značka (COP { "0" }) se na úrovni značky ukáže jako <c16/>, protože prokazuje klíč, ale nekryje žádná navigační data a nikdy se nezapočítává pro družici.

seg-331a6ab821f3 = Na družici, ve tvaru, který spotřebovává monitor receiver-trust:

# c1: Authenticated
seg-9912068c5b34 = <c1/> pouze dokud nejnovější ověřená data efemerid a hodin (ADKD { "0" } nebo

# c1: Unavailable
seg-38e7f56293e7 = této družice jsou nedávná (ve výchozím nastavení do { "600" } s od času ověřovače) a stále jsou používanými daty. Kontrola se týká dat, nikoli IODnav: ověřovač uchovává SHA-256 ověřeného bitového řetězce (typy slov { "1" } až { "5" }, jak je kryje ADKD { "0" }) a nejnovějšího takového řetězce, který družice vysílá, a ty se musí rovnat. Zkopírovaný IODnav nad jinými slovy nebo změněné bity typu slova { "5" } (které IODnav nenesou) se čtou jako <c1/>, dokud se nová data neověří. Podrámec, který nese slova efemerid, ale ne úplnou sadu typů slov { "1" } až { "5" } pod jedním IODnav, stav odebírá stejným způsobem (každý skutečný podrámec E1-B nese všech pět); ten, který nemá žádná slova efemerid, neříká nic. Značky jiné družice (křížová autentizace) se počítají pro družici, jejíž data kryjí.

# c1: Failed
seg-233109ef4428 = <c1/>, když v paměti selhání (ve výchozím nastavení { "600" } s času ověřovače) selhala kontrola dat družice, i když se pozdější data ověří. Neshoda se přičte družici, jejíž data značka kryje, i družici, která značku vysílala, protože chyba může být na kterékoli straně; neshoda MACSEQ se přičte vysílající družici.

# c1: Unavailable
seg-8ba1d89bcf91 = <c1/> jinak, a pro každou družici po ověřené výstražné zprávě, při stavu NMA „don't use" nebo rezervovaném stavu a dokud se neověří první klíč.

# c1: Failed
# c2: Authenticated
# c3: Unavailable
# c4: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c5: kshana::osnma::pksos_sentence
seg-7fceea6e23f8 = Celková hodnota je <c1/>, pokud selhala kterákoli družice, <c2/>, pokud je alespoň jedna ověřena a žádná neselhala, jinak <c3/>. <c4/> je odpovídající věta; <c5/> ji sestavuje.

seg-446a3218ccbb = Čas

# c1: set_reference_time
# c2: --reference-time
seg-18e91e6aa160 = Řetězec klíčů ukazuje, že klíč patří danému podrámci, nikoli že podrámec je současný. Ověřovač proto nikdy nebere „teď" z neověřené stránky. Jeho čas je pozdější z referenčního času zadaného pomocí <c1/> (<c2/>) a podrámce nejnovějšího ověřeného klíče TESLA (klíč nemůže být znám před svým slotem, takže dokazuje, že čas není dřívější). Paměť selhání, okno platnosti ověření a vyřazování starých dat běží podle tohoto času. Podrámec s razítkem více než tři podrámce za nejnovějším ověřeným klíčem se odloží stranou, pokud jeho vlastní klíč neprokáže jeho čas; klíčové a výstražné zprávy v něm se přesto zpracují, protože nesou vlastní důkaz (podpis nebo kořen Merkle).

# c1: set_reference_time
# c2: poll_clock
# c3: KeyStall
seg-318323322a3a = Hodiny stojí, když OSNMA přestane, protože je posouvají jen klíče. Živé volání musí volat <c1/> s časem hostitele každý podrámec; ověření pak vyprší samo a <c2/> (spouštěné rovněž s každým podrámcem) vrátí událost <c3/>, jakmile se po dobu delší než okno ověření neověřil žádný klíč.

# c1: freshness: NOT enforced
seg-5338d8f5de77 = To, co to nedává, je čerstvost. Bez referenčního času ze zdroje, který útočník nemůže posunout, se přehrání starých autentických dat pod starými razítky ověří a razítka stránek jsou jen tak dobrá jako jejich zdroj: CLI to říká (<c1/>), kdykoli není zadán žádný referenční čas. S referenčním časem je tolerance pod jedním podrámcem (výchozí { "29" } s; větší hodnoty se odmítnou). Referenční čas je jediný okamžik: podrámce od něj vzdálenější než tolerance se odloží stranou a započítají, takže se hodí pro živá nebo právě zaznamenaná data, nikoli pro dlouhý záznam. U záznamu referenční čas vynechejte a výsledek čtěte jako „autentické, nemusí být čerstvé". Formální požadavek uvádějí Receiver Guidelines.

seg-aa37ce329914 = Razítka stránek proudu u-blox pocházejí ze samotných neověřených dat (viz Vstup), takže ani ona neposkytují ochranu čerstvosti.

seg-a33d72076025 = Řetězce, klíče a výstrahy

# c1: chain_mismatch
seg-be2d9588df65 = Ověřené řetězce se uchovávají podle identifikátoru řetězce (CID); značky se kontrolují řetězcem, který uvádí hlavička NMA, a hlavička uvádějící řetězec, který nebyl ověřen, nechá značky podrámce nezkontrolované (<c1/>). Druhý KROOT řetězce v platnosti přidá kotvu; KROOT jiného řetězce se ponechá vedle, takže opětovné oznámení starého řetězce po obnovení ten nový neruší.

# c1: stale
seg-bbb6574fa258 = Hlavička NMA není ověřena, takže to, co oznamuje, se počítá jen po potvrzení: když stejnou hlavičku v podrámci vysílá více než jedna družice, nebo když ji nese podepsaná zpráva ověřeného KROOT (hlavička je součástí této zprávy). Tato dvě nejsou rovnocenná. Shoda více než jedné družice chrání před anomálií jediné družice, nikoli před spooferem: jeden spoofer může podvrhnout dvě identity družic. Získá tím odepření služby a nic víc, protože potvrzené „don't use" smaže ověřená data každé družice: jeho zrušení, podvržené či pravé, nic neobnoví, dokud se nové značky neověří pod pravými provozními podrámci. (Před tímto smazáním mohlo podvržené zrušení vrátit na dobu až okna ověření data, která už byla ověřena.) Skutečným potvrzením je hlavička podepsaná KROOT, která také znovu zruší „don't use", když nese provozní stav. Hlavička jediné družice nemění nic kromě kontroly značek jejího vlastního podrámce. KROOT, jehož čas použitelnosti není pozdější než u řetězce drženého pod stejným identifikátorem (přehrání staršího), se odmítne (<c1/>); KROOT téhož řetězce přidá kotvu.

seg-5c08dbaa8d43 = Revokaci řídí stav a hodnota CPKS potvrzené hlavičky. Při stavu NMA „don't use“ hodnota CPKS „chain revoked“ zahodí řetězec, který hlavička uvádí, a od té chvíle odmítá jeho KROOT; hodnota CPKS „public key revoked“ zahodí veřejný klíč, který tento řetězec podepsal, i všechny řetězce jím podepsané. Pokud byl náhradní řetězec pro dané id přijat před potvrzením hlavičky, bez ohledu na to, jak dlouho předtím, je zrušený klíč klíčem předchozího řetězce, nikoli nového; tato paměť se uchovává, dokud se revokace neprovede nebo dokud není potvrzena hlavička jiného postupu, a revokační hlavička opakovaná v každém podrámci se provede jednou. Stejné hodnoty CPKS se stavem operational označují přechod na náhradní řetězec a nic neruší. Samotná hlavička není ověřena, takže padělaná revokace může autentizaci pouze odebrat a je konečná, dokud se ověřovač nerestartuje. Tato konečnost platí i pro platný klíč: padělaná revokace veřejného klíče vynuluje paměť nahrazeného klíče a zruší klíč, který se používá, a vrátí ji zpět jen restart.

seg-e7d43eb18c24 = DSM-PKR s NPKT { "4" } je výstražná zpráva; ověřuje se přes Merkleův strom jako klíč a její náhodné pole NPK je součástí listu. Ověřená výstraha vymaže všechny řetězce a veřejné klíče, odmítne každý další KROOT a veřejný klíč a nastaví každou družici na <c1/>, jak předepisují Receiver Guidelines, dokud se ověřovač nerestartuje.

seg-4068e9bda7c1 = Výplňové pole zprávy DSM-KROOT je hash podepsané zprávy a podpisu. Kontroluje se před podpisem a také říká, s jakou hlavičkou NMA byla podepsaná zpráva sestavena, pokud se hlavička během sestavování zprávy změnila.

seg-8ea31bf25ef0 = Co se neověřuje nebo nezkouší

seg-3d0808cab632 = <b>Aktuálnost.</b> Viz Čas výše: vyžaduje referenční čas zvenčí.

seg-b3d63950baa4 = <b>Obnova a revokace.</b> Řetězce a klíče se sledují tak, jak je zkoušejí proudy publikovaných vektorů (obnova, konec řetězce, revokace řetězce a klíče, nový veřejný klíč, nový Merkleův strom, výstraha), nikoli ve všech případech, které ICD připouští. Revokace oznámená neautentizovanou hlavičkou se bere za slovo a je pro relaci konečná. Nový Merkleův strom se přebírá jen přes Merkleův kořen, který ověřovač dostane.

seg-f01d90a44585 = <b>Hash Merkleova stromu.</b> Zprávy DSM-PKR se kontrolují stromem SHA-256. Strom SHA3-256, který ICD v budoucnu připouští, není podporován. Hashovací funkcí řetězce může být SHA-256 nebo SHA3-256.

seg-d9ca4e69ffc9 = <b>Seznamy stavů klíčů.</b> Revokace se sleduje přes hlavičku NMA a zprávy v proudu; seznamy zrušených certifikátů se nečtou.

seg-73e0b16d03c7 = <b>Pokrytí autentizovaných dat.</b> ADKD { "4" } s COP { "1" } odeslaný v lichém podrámci nemůže autentizovat (Word Type { "10" } může být odeslán o jeden nebo dva podrámce dříve); stojí to jen dostupnost, nikdy správnost.

seg-acc28dcced83 = <b>Provoz v konstantním čase.</b> Neposkytuje se a není potřeba: ověřovač nedrží žádná tajemství (jen veřejné klíče, publikované klíče řetězce a přijatá data).

seg-b2f8ec90ae39 = <b>Kvalita signálu a dat.</b> Stránky se kontrolují CRC a výstražné stránky se zahazují, ale o signálu, na němž dorazily, se nic neví. Obnova slov I/NAV { "1" } až { "4" } pomocí Reed-Solomonova kódu se nepoužívá: data se musí přijímat přímo.

seg-97313ba2bf88 = <b>Nejde o službu integrity polohy.</b> Autentizace říká, že data pocházejí ze systému. Neříká nic o signálu, na němž dorazila, ani o kvalitě určené polohy.

seg-d696f298c4a2 = <b>Prostý formát stránek.</b> Jeden pár stránek na řádek: <c1/>, komentáře <c2/> jsou povoleny. <c3/> je GST v sekundách (<c4/>) na začátku stránky; hex je { "240" } bitů sudé a liché poloviny (včetně koncovek), nejvýznamnější bit první.

seg-e436d96b12cf = <b>CSV s testovacími vektory.</b> Rozvržení publikovaných vektorů (<c1/>). Počáteční čas se bere z <c2/> nebo z názvu souboru s datem.

seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Surový bajtový proud UBX (<c1/>, rozpoznaný automaticky). Zprávy Galileo E1-B I/NAV se skládají zpět do párů stránek (<c2/>); ostatní systémy, E5b, výstražné stránky a rámce se špatným kontrolním součtem se ignorují. SFRBX nenese čas, takže se každá stránka označí časem z vlastních dat (typy slov { "5" } a { "0" }) a přijme se jen tehdy, když po sobě jdoucí stránky nesoucí čas souhlasí s počtem stránek přijatých mezi nimi; stránky, které nelze zařadit, se zahazují, nikdy se nehádají. Tento čas pochází ze samotných dat a neposkytuje ochranu aktuálnosti (viz Čas výše). ID signálu { "0" } (E1-C) nenese žádná data, takže jeho přijetí vedle E1-B je neškodné. Zbloudilý synchronizační pár s absurdní délkou čtečku nezdrží. Kód rámování je třetí kopií rámování UBX ve stromu zdrojů (<c3/>, příjem receiver-trust); je držen odděleně, aby se chování receiver-trust nezměnilo, a tyto tři by později mohly sdílet jednu čtečku. Rozvržení slov zprávy SFRBX je převzato z veřejných popisů a ověřeno pouze na syntetických rámcích, nikoli na živém přijímači.

seg-47118a577876 = Textový výstup udává stav po družicích a s <c1/> po značkách a epochách; <c2/> udává totéž se seznamem značek. Stavový kód ukončení { "3" } znamená, že selhala kontrola dat některé družice, { "2" } znamená chybu použití nebo vstupu. Poradní upozornění výše se vypisuje jako první na každé cestě, včetně chyb a nápovědy k použití.

seg-e2af23b756f5 = Z Pythonu a WebAssembly

seg-4edf83a818d1 = <c1/> (Python) a <c2/> (WebAssembly) spouštějí stejný ověřovač nad bajty v paměti a vracejí JSON, který vypisuje <c3/>, včetně poradního upozornění. Server MCP jej nenabízí: vstupem je dlouhý surový proud z přijímače, pro který se lépe hodí příkazový řádek a Python, a nástroj pro agenta by přidal rozsáhlý vstupní povrch bez užitku. Platí stejné poradní upozornění a stejná omezení; stav není služba integrity navigace.

seg-0987c3b00a14 = Testy a testovací data

seg-2acc9fa7212b = Testovací data jsou syntetická a vytváří je vlastní kód a testy Kshana. V tomto repozitáři nejsou uloženy žádné vektory z ICD ani Guidelines, žádné propracované příklady ani klíčový materiál. Výchozí testy (<c1/> a jednotkové testy) z rovnic sestaví řetězec, stránky a značky a kontrolují konzistenci a to, že se zachytí záměrné poškození: překlopený navigační bit, překlopený bit klíče, přehrané značky, chybná časová razítka, čas mimo reference, chybějící data a útoky, které odhalila revize (podvržený podrámec z daleké budoucnosti, který nesmí smazat selhání, autentizace, která musí vypršet a sledovat IODnav, výstraha, stav NMA „don't use“, fiktivní značky, nesoulad MACSEQ, konfliktní klíče, revokace a obnova řetězce, špatné vyplnění nebo podpis), přičemž ověřovačem prochází CMAC-AES, řetězec SHA3-256 a podpis P-521. Protože tato data vycházejí z našeho vlastního čtení ICD, ukazují vnitřní konzistenci, nikoli shodu.

seg-4906b14a33a3 = Primitiva se kontrolují proti publikovaným testům se známou odpovědí, z nichž žádný nepochází z ICD: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) a RFC { "6979" } (ECDSA P-256). Podpisy P-521 se kontrolují z hlediska kódování a volby hashe jednorázovým klíčem vytvořeným v testu; aritmetika křivky patří knihovně.

seg-82ee90adf7ed = Shodu kontroluje <c1/>, který je dobrovolný: čte kopii oficiálního archivu testovacích vektorů, kterou si stahujete sami, z adresáře pojmenovaného v <c2/>, a když proměnná není nastavena, nedělá nic. Nic neukládá ani nedistribuuje a výchozí běhy testů nepoužívají síť. Ověřovači dává jen Merkleův kořen a veřejné klíče jednoho stromu, jako by je měl přijímač, takže se řetězce zakládají z podepsaného DSM-KROOT v proudu a běží celá cesta: Merkle, podpis, řetězec klíčů, MACSEQ a značky. Pro každou sadu vektorů tvrdí spodní mez počtu autentizovaných značek, že žádná neselhala, které řetězce a klíče proud oznamuje, autentizované značky ADKD { "0" }, { "4" } a { "12" }, že se autentizace obnoví po konci řetězce, revokaci řetězce, revokaci klíče a novém veřejném klíči, že se výstražná zpráva ověří a nenechá nic autentizovaného a že každý vektor používá jen HMAC-SHA-256, řetězec SHA-256, 128bitové klíče, 40bitové značky a položky vyhledávací tabulky { "33" } a { "34" }. Jiné volby algoritmů a parametrů z ICD tedy pokrývají jen výše uvedené testy se známou odpovědí a syntetické testy.

seg-70bb026ce655 = Závislosti

seg-00a3dd901039 = Knihovny RustCrypto, čistý Rust, MIT OR Apache-2.0, sestavené bez výchozích funkcí: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> a <c6/> (funkce <c7/>, používaná jen k ověřování), vedle <c8/>, které už ve stromu je. Sestavují se pro <c9/> a procházejí <c10/>.

seg-7ab62b91d469 = <s1>Předchozí</s1>Důvěra jako bezpečnostní telemetrie

seg-5dc48294fbb2 = <s1>Další</s1>Rozšířený dopředný signál LunaNet
