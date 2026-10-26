# docs--rust: translations (cs)

seg-d4a762001549 = Licence

seg-4dbf41c0ec3b = Funkce

seg-81a87d14efda = Kshana: značka, kompasový zaměřovací kříž označující přesný okamžik, vedle slovní značky kshana

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>přesný okamžik</em></b><br/> Open-source simulátor odolnosti PNT (určování polohy, navigace a času).

seg-3b861b2f08b8 = Vydání v{ $version }

seg-ebe636986f46 = { "176" } z { "388" } schopností ověřeno proti nezávislým vnějším orákulím

seg-6a1906d8d4ad = Pokrytí řádků zhruba { "95" } %, v nepřetržité integraci s hranicí { "85" } %

seg-a9f4f2795fb5 = Licence: AGPL-3.0-only, nebo komerční licence

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = Nacvičte minutu, kdy GNSS zhasne: konzole mise Kshana, vykreslená ze skutečného běhu enginu, zřetězená kampaň s rušením, podvržením signálu, holdoverem a integritou nad { "102" } družicemi GPS, Galileo, BeiDou a GLONASS

seg-d1153c5e9112 = Nacvičte minutu, kdy GNSS zhasne

seg-d1a3f78ad8e0 = Vyzkoušejte jej nejdřív bez jakékoli instalace: <a1>Kshana Studio</a1> spouští celý engine ve vašem prohlížeči, přeložený do WebAssembly, a nic nenahrává.

seg-2d2c47db0c1f = <b>{ "176" } z { "388" }</b> schopností ověřeno proti nezávislým vnějším orákulím; { "208" } poctivě označeno jako modelované, { "4" } ve vlastnictví partnera. Každá schopnost nese jeden štítek ve strojově kontrolovaném registru: VALIDATED (nezávislé vnější orákulum souhlasí: skutečná data, nezávislá implementace nebo zveřejněné referenční vektory), MODELLED (vnitřně konzistentní a řečeno otevřeně) nebo PARTNER (odpovídá za ni hardwarový partner). Mezi kontrolami: všech { "666" } vektorů SGP4 (Simplified General Perturbations { "4" }) podle AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 do { "4.12" } mm a silový model Cowell do { "0.08" } m proti Orekit { "12.2" }.

seg-44f7862c45a2 = Jak si schopnost získá štítek: schopnost, orákulum, test, štítek v registru. Stav ověření napříč všemi { "388" } schopnostmi: { "176" } ověřeno, { "208" } modelováno, { "4" } ve vlastnictví partnera

seg-12a295fba8a5 = Každá schopnost ve verifikační matici je označena jako <b>ověřená</b> (zkontrolovaná proti nezávislému vnějšímu orákulu), <b>modelovaná</b> nebo <b>ve vlastnictví partnera</b>; údaje o optických hodinách jsou cíle pro vesmír na pozemním hardwaru (žádné optické hodiny se stronciem dosud nelétaly). Zralost <em>není</em> napříč oblastmi jednotná – PNT pro Zemi je ověřeno proti skutečným datům; navigace v hlubokém vesmíru a na Marsu je modelovaná, přičemž proti vnějším orákulím jsou ověřeny jen její stavební bloky (světelný čas, polohy planet); skutečné OD (určování oběžné dráhy) pro mise v hlubokém vesmíru je na plánu rozvoje.

# c1: kshana kinds
# c2: gnss-ssv
# c3: lunar-infrastructure
# c4: holdover-test
seg-3de57431d3e6 = Engine má { "87" } druhů scénářů; <c1/> je vypíše s jejich poli. Nově ve verzi { "0.38.0" }: <c2/> (signály GNSS pro kosmické lodě nad dráhami GNSS, v jejich okolí a za nimi) a <c3/> (lunární oběžná dráha a povrch jako navigační a geodetická infrastruktura), obojí MODELLED, a <c4/> (záznam časové chyby proti maskám ITU-T).

seg-68ed88ec0b32 = <b>Spektrum</b>: jak jammer zabírá pásmo L GNSS, pásmo po pásmu.

seg-f04a0aeeee33 = <b>Hodiny a časování</b>: holdover proti prahu, přenos času a telekomunikační holdover proti maskám normalizačního sektoru Mezinárodní telekomunikační unie (ITU-T).

seg-7e38ac603ef2 = <b>Konstelace kolem libovolného tělesa</b>: pokrytí, faktor DOP (zhoršení přesnosti) a dostupnost kolem Země, Měsíce nebo Marsu a sluneční soustava v jedné epoše.

seg-82708b06dcc6 = <b>Navigace na nízké oběžné dráze</b>: signál, přelet a spoj, navigační zpráva a fúzované zaměření, krok za krokem.

seg-e21e9bb02d00 = <b>Kampaně</b>: zřetězená mise, průchod parametrem nebo soubor Monte Carlo v jednom scénáři.

seg-ba5057da54e4 = <b>Zprávy, animace a exporty</b>: každý údaj s jednotkou a štítkem; animovaný záznam běhu; soubory SP3 (Standard Product { "3" }), orbitální zprávy CCSDS (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) a SigMF (Signal Metadata Format).

seg-6b43a8c3031e = Jeden otevřený engine uprostřed, kshana { $version }, s typovaným rozdělováním přes { "75" } druhů; kolem něj příkazová řádka, knihovna v Rustu, Python, WebAssembly a Kshana Studio, server MCP, obraz Docker a zásuvný modul JetBrains; pod ním Kshana Pro, proprietární nadstavba, která závisí na otevřeném enginu a nikdy jej nevětví

# c1: kshana-mcp
seg-ea6f46d62e7b = Tentýž soubor scénáře dává na každém rozhraní stejné bajty. MCP je Model Context Protocol: <a1><c1/></a1> umožňuje asistentovi s umělou inteligencí (AI) spouštět engine.

seg-f51b0a8cd30e = Na otevřeném enginu je postaveno šest článků na arXiv, každý s příkazem, který za ním stojí: <a1>arXiv:{ "2606.22054" }</a1> (optimismus detektorů interference), <a2>arXiv:{ "2606.24210" }</a2> (podmíněná ochranná úroveň pro časování), <a3>arXiv:{ "2607.05415" }</a3> (jak stabilní je skóre odolnosti PNT), <a4>arXiv:{ "2607.02566" }</a4> (pozorovatelnost lunárních povrchových stanic pomocí interferometrie s velmi dlouhou základnou), <a5>arXiv:{ "2607.06212" }</a5> (geometrie jižního pólu Měsíce a povrchové majáky) a <a6>arXiv:{ "2610.23871" }</a6> (cislunární navigace jako problém pozorovatelnosti: délka oblouku, podmíněnost Gramiánu a Dopplerova páka). Viz <a7>Výzkum</a7>.

seg-dad7832bf2d2 = Celý engine je zdarma pod AGPL-3.0. Kshana Pro, proprietární nadstavba, která závisí na otevřeném enginu a nikdy jej nevětví, a studie na zakázku jsou dostupné na smlouvu od Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Žádné ceny se neuvádějí; viz <a2>docs/PRO.md</a2>.

seg-d217f23af0c2 = Další informace

seg-0e8320f8ea91 = <b>Úplné README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

seg-acba56f9ed36 = <b>Kshana Studio</b> (engine ve vašem prohlížeči, jako WebAssembly) → <a1>https://kshana.dev</a1>

seg-13426521456e = <b>Schopnosti</b> → <a1>docs/CAPABILITY.md</a1>

seg-a42cfefa5e6d = <b>Validace a původ</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

seg-07b9e03942cb = <b>Verifikační matice</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

seg-9390336ecc01 = <b>Citace</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

seg-d059e9fc67e1 = Svobodný a open source pod licencí <b>GNU AGPL-3.0-only</b> (GNU Affero General Public License, pouze verze { "3" }). <b>Komerční licence</b> je k dispozici od <a1>Ashforde® OÜ</a1> (estonská společnost s ručením omezeným; OÜ = osaühing) pro uzavřenou integraci; viz <a2>LICENSING.md</a2>. Profesionálně vyvíjí a udržuje Ashforde® OÜ.

seg-8c83544270b5 = Signatura

seg-8a438548bf52 = Zdroj: <c1/>

seg-9a65e21abcf4 = Kshana přehrává rušení, spoofing a holdover hodin, když signály GNSS (globální družicový navigační systém) selžou, a říká, jak dlouho systém udrží čas a polohu v rámci svého rozpočtu a které hodiny nebo senzor přinesou největší rezervu. Toto je crate v Rustu: engine jako knihovna a příkaz <c1/>. Každý běh je bit po bitu reprodukovatelný ze scénáře, seedu a verze enginu.

seg-991c428a8063 = Použití — knihovna

seg-6ef0d3fb5be0 = Příklad je úplný program: nese vlastní scénář zapsaný v TOML (Tom's Obvious, Minimal Language), takže po <c3/> běží jako <c1/> nového projektu <c2/> a na disku není potřeba nic jiného.

seg-cfb76f7da8da = <c1/> je dokument výsledku ve formátu JSON (JavaScript Object Notation), <c2/> graf ve formátu SVG (Scalable Vector Graphics) a <c3/> je u druhů, které publikují tabulku, tato tabulka ve formátu CSV (hodnoty oddělené čárkami).

seg-95b7a8022262 = Referenční příručka API, generovaná ze src/api.rs

seg-e271e742cec7 = Každá veřejná funkce <c1/> v enginu v{ $version }, načtená ze zdroje při sestavení.

seg-9a8d288b2c57 = json s odstraněným závěrečným blokem figure_tiers, bajt po bajtu tak, jak byl dokument, než tento blok existoval; None, pokud dokument takový blok nemá nebo má blok, který není jeho posledním klíčem (což tento crate nikdy nevydává, takže jej má nástroj brát jako selhání, nikoli odstraňovat něco, co nedokáže vysvětlit).

seg-6157f407ab8b = Vypíše každý vestavěný druh scénáře s jeho metadaty.

seg-e9535491e871 = Vestavěné druhy scénářů a jejich metadata jako pole JSON — forma, kterou jazykové vazby zpřístupňují pro programovou introspekci.

seg-a3e3eeb83c46 = [KIND_MODULES] jako objekt JSON, druh na pole názvů modulů, v pořadí tabulky.

seg-6739ddf8bba8 = [HEADLINE_FIELDS] jako JSON: { "{" }kind: { "{" }"headline": [path, ...]{ "}" }{ "}" }, v pořadí tabulky.

seg-f76170c699d9 = Vykreslí katalog vestavěných druhů scénářů jako samostatnou referenci v Markdownu (docs/SCENARIOS.md): každý druh, který lze spustit, s jednořádkovým popisem a jeho povinnými / volitelnými poli TOML.

seg-295c8355634f = Zkontroluje scénář TOML podle vlastní introspekce crate a vrátí seznam problémů — aby volající mohl zjistit, co je špatně, PŘED (případně dlouhým) během, místo aby narazil na pozdní selhání za běhu.

seg-4aab02ecf399 = Exportuje propagovanou konstelaci scénáře oběžné dráhy / konstelace jako text SP3-c.

seg-d577fc8351a2 = Je-li src scénář oběžné dráhy s export_sp3 = true, vrátí jeho text SP3-c; jinak None.

seg-024e29ac4bde = Exportuje střední elementy TLE scénáře oběžné dráhy jako katalog CCSDS OMM — jedna zpráva OMM (Orbit Mean-Elements Message) na každou družici definovanou TLE, ve formě KVN, s reálným katalogovým číslem NORAD, označením COSPAR a epochou z každého TLE.

seg-d5dc817a3a24 = Je-li src scénář oběžné dráhy s export_omm = true, vrátí jeho text katalogu OMM; jinak None.

seg-3fe91ee29ac1 = Exportuje propagovanou konstelaci scénáře oběžné dráhy jako text CCSDS OEM — časovou řadu inerciálního (TEME) stavu, polohu A rychlost, ve výměnném formátu efemerid kosmických lodí, který čtou nástroje letové dynamiky (GMAT/Orekit/STK).

seg-f102088f3208 = Je-li src scénář oběžné dráhy s export_oem = true, vrátí jeho text OEM; jinak None.

seg-5432a3921600 = Vloží skutečné tělo IERS finals2000A do pole eop_finals2000a scénáře (cesta CLI --eop <file>) a vrátí sloučené TOML.

seg-dc707c3d1769 = Vloží blok metadat studie do již vykresleného dokumentu výsledku JSON a vrátí dokument s klíčem „meta“ nejvyšší úrovně vloženým hned za úvodní složenou závorku.

seg-afa952d0c0f5 = Spustí scénář a vrátí typovaný výsledek se strukturovanou chybou — vstupní bod, který by volající vazeb měli upřednostnit před [run_toml] s chybou v řetězci.

seg-d0a609bfd225 = Rozebere, přiřadí a spustí scénář zadaný jako řetězec TOML.

seg-c62cff9a8dba = [run_toml] bez bloku figure_tiers pro daný druh, který připojuje [run_toml_inner] (RM-04): pro běh, jehož dokument je vložen do výsledku jiného druhu (člen kampaně), takže vnější dokument zachová své bajty.

seg-5a316ab76a7d = json s blokem připojeným jako poslední klíč, figure_tiers, bajt po bajtu tak, jak by jej serializoval obal Documented: odsazení po dvou mezerách, blok vnořený o jednu úroveň.

seg-ef3b369866c5 = Výměnné formáty v crate: parser a zapisovač CCSDS Tracking Data Message (TDM) (<c1/>); Kshana Interchange Format (KIF) (<c2/>).

seg-36184e41b65d = Použití — CLI

seg-c96267c06c3b = Instalace z registru nemá adresář <c1/>, takže CLI nese referenční scénáře s sebou; <c2/> je vypíše a uvede těch několik, která vynechává, s důvodem (každý čte jen data dodávaná s repozitářem nebo následuje předvolbu, kterou vydání může zadržet).

seg-35965c7df95f = Běh se řídí <c1/> scénáře a vedle souboru scénáře zapíše <c2/>, <c3/>, <c4/> (tisknutelnou stránku zprávy v HTML, HyperText Markup Language) a <c5/> (tutéž zprávu ve strojově čitelné podobě), plus <c6/> u druhů, které publikují tabulku. <c7/> přidává výměnné soubory: CZML (Cesium Language) a KML (Keyhole Markup Language) pro prohlížeče glóbu, GeoJSON pro mapy, soubory efemerid STK (Systems Tool Kit) a nahrávky SigMF (Signal Metadata Format) pro druh <c8/>. <c9/> přidává animaci SVG, HTML nebo po jednotlivých snímcích.

seg-fc13b487ccc5 = Z klonu repozitáře berou stejné příkazy soubory přímo z <c1/>, včetně studie s více scénáři (<c2/>) a <c3/>, jediného scénáře, který čte skutečná data laserového měření vzdálenosti dodávaná jen s repozitářem.

seg-509e49e5df09 = <b>Důvěra v GNSS plavidla</b> (<c1/>, včetně <c2/>): skóre 0 až 100 s důvody z NMEA přijímače, živě nebo ze záznamu; pouze poradní charakter, nejde o typově schválené navigační zařízení.

seg-0489fa168736 = <b>Balíčky důkazů</b> (<c1/>): podepsaný technický záznam okna záznamu, ověřitelný offline.

seg-aa4a7de921a3 = <b>Telemetrie důvěry</b> (<c1/>): proud důvěry jako metriky Prometheus, události SIEM a volitelně OpenTelemetry.

seg-d2ecb7047abe = <b>Výcvikové proudy</b> (<c1/>): syntetické NMEA z můstku s předepsaným rušením a spoofingem a záznamem instruktora. Pouze text; nikdy pro živé navigační systémy plavidla.

seg-e16769b8fab8 = <b>Mapa interference</b> (<c1/>): souhrnné mapy zhoršené navigace a expozice trasy.

seg-1944d0fada06 = <b>Testovací stolice a mapování compliance</b> (<c1/>, <c2/>): pohyb vozidla a události scénáře pro laboratorní simulátor GNSS a mapování na veřejné rámce vyplněné z dokumentů výsledků.

seg-68274ce67506 = <b>Laboratoř GNSS IQ</b> (<c1/>): scény, akvizice, sledování, monitory a kampaně na nahraném a syntetickém IQ.

seg-6dc7d52fef11 = <s1>Předchozí</s1>npm a WebAssembly

seg-8ff56af64ec2 = <s1>Další</s1>Server MCP
