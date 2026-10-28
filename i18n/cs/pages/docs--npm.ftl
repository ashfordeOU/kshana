# docs--npm: translations (cs)

seg-d4a762001549 = Licence

seg-3d770dd786e4 = Použití

seg-81a87d14efda = Kshana: značka, kompasový zaměřovací kříž označující přesný okamžik, vedle slovní značky kshana

# c1: README.npm.md
seg-0ddcab84868f = Zdroj: <c1/>

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>přesný okamžik</em></b><br/> Open-source simulátor odolnosti PNT (určování polohy, navigace a času).

seg-3b861b2f08b8 = Vydání v{ $version }

seg-6a1906d8d4ad = Pokrytí řádků zhruba { "95" } %, v nepřetržité integraci s hranicí { "85" } %

seg-a9f4f2795fb5 = Licence: AGPL-3.0-only, nebo komerční licence

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = Nacvičte minutu, kdy GNSS zhasne: konzole mise Kshana, vykreslená ze skutečného běhu enginu, zřetězená kampaň s rušením, podvržením signálu, holdoverem a integritou nad { "102" } družicemi GPS, Galileo, BeiDou a GLONASS

seg-d1153c5e9112 = Nacvičte minutu, kdy GNSS zhasne

seg-d284448743af = Kshana přehrává rušení, podvržení signálu (spoofing) a holdover hodin (udržení času), když signály GNSS (globálního družicového navigačního systému) selžou, a říká vám, jak dlouho systém udrží čas a polohu v rámci svého rozpočtu a které hodiny nebo který senzor přinese největší rezervu. Toto je balíček WebAssembly: celý engine v JavaScriptu, v prohlížeči nebo v Node.js. Každý běh je reprodukovatelný bit po bitu ze scénáře, seedu a verze enginu.

seg-d1a3f78ad8e0 = Vyzkoušejte jej nejdřív bez jakékoli instalace: <a1>Kshana Studio</a1> spouští celý engine ve vašem prohlížeči, přeložený do WebAssembly, a nic nenahrává.

seg-d662055d817f = Balíček je modul ES (ECMAScript, standardní JavaScript) s obsahem WebAssembly, určený pro prohlížeč. Inicializujte jej jednou a poté volejte engine synchronně. Jediný rozdíl mezi prohlížečem a Node.js je v tom, jak se načte binární soubor WebAssembly.

# c1: node_modules/kshana/
# c2: init()
# c3: kshana_bg.wasm
seg-0b750617ea08 = <b>V prohlížeči</b> (přes bundler nebo stránku, která poskytuje <c1/>) <c2/> načte <c3/> z místa vedle modulu:

# c1: init()
# c2: TypeError: fetch failed
# c3: fetch
# c4: initSync
seg-70fc98eb8d2e = <b>V Node.js</b> <c1/> selže s <c2/> (<c3/> v Node nedokáže číst místní soubor), proto načtěte binární soubor z disku a předejte jej do <c4/>:

# c1: .mjs
# c2: "type": "module"
# c3: package.json
# c4: import
seg-2c181d5e0942 = Verzi pro Node.js uložte jako soubor <c1/> (nebo nastavte <c2/> ve svém <c3/>), aby fungoval <c4/>. Odtud je obojí stejné:

# c1: run_typed(toml)
# c2: RunOutput
# c3: json
# c4: svg
# c5: summary
# c6: csv: string | null
# c7: data: ResultDocument
# c8: scenario_kinds()
# c9: KindMeta[]
# c10: name
# c11: ScenarioKind
# c12: error_kind()
# c13: ErrorKind
# c14: ""
# c15: ResultDocument
# c16: schema_version
# c17: engine_version
# c18: units
# c19: FieldUnit
seg-06eb982ef260 = TypeScript vidí typované výsledky: <c1/> vrací <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> vrací <c9/>, jejíž <c10/> je sjednocení <c11/> všech druhů, a <c12/> vrací <c13/> (nebo <c14/> při úspěchu). Vlastní pole dokumentu každého výsledku se podle druhu liší; <c15/> typuje sdílenou obálku (<c16/>, <c17/> a blok <c18/> hodnot <c19/>).

# c1: kind_modules()
# c2: field_importance()
# c3: iq_signals()
# c4: iq_run_short
# c5: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
seg-31d983ae7036 = Další čtyři funkce popisují engine pro front-end. <c1/> vrací objekt JSON z druhu na moduly, které uvádějí jeho řádky ve verifikační matici, <c2/> jeden z druhu na pole výsledku, která odpovídají na jeho otázku (zobrazovací metadata; engine je nikdy nečte), <c3/> názvy signálů, které <c4/> přijímá, a <c5/> krátkou syntetickou scénu IQ, zachycenou a sledovanou v paměti (nejvýše { "0.25" } s, { "1,000,000" } vzorků a { "8" } družic), se stejnou odpovědí jako nativní sestavení.

# c1: run
# c2: summary
# c3: chart_svg
# c4: table_csv
# c5: undefined
# c6: run_all
# c7: {json, svg, summary, csv}
# c8: run_typed
# c9: data
# c10: version
# c11: list_kinds
# c12: scenario_kinds
# c13: error_kind
# c14: scenario_kinds
# c15: encode_permalink
# c16: decode_permalink
# c17: export_sp3
# c18: export_omm
# c19: export_oem
# c20: receiver_trust
# c21: receiver-trust
# c22: {json, csv, svg, summary}
# c23: text
# c24: base64
# c25: [platform] kind = "vessel"
# c26: export_formats
# c27: export_scenario
# c28: czml
# c29: kml
# c30: geojson
# c31: stk
# c32: sigmf
# c33: {format, spec_url, files}
# c34: import_route
# c35: --import-route
# c36: animate_scenario
# c37: list_examples
# c38: get_example
# c39: evidence_attach_timestamp
# c40: osnma_verify
# c41: receiver_trust_replay
# c42: assess_vessel_log
# c43: trust_telemetry
# c44: evidence_verify
# c45: bench_export
# c46: compliance_report
# c47: compliance_mapping
# c48: interference_map
# c49: kshana-interference-map/v1
# c50: route_exposure
# c51: nmea_training
# c52: sky_geometry
# c53: sky_monte_carlo
# c54: skyline_presets
# c55: skyline_profile
# c56: skyplot_svg
# c57: receiver-trust live
# c58: run_full
seg-ceee5ddc0c36 = Na straně WebAssembly je každý vstupní bod samostatné volání: <c1/> (dokument výsledku jako řetězec JSON), <c2/>, <c3/>, <c4/> (tabulka CSV (hodnoty oddělené čárkami) scénáře jako řetězec, nebo <c5/> pro druhy, které žádnou tabulku nepublikují; u neplatného scénáře vyhodí výjimku), <c6/> (jeden běh enginu vracející <c7/> jako řetězec JSON – použijte jej, když chcete více než jeden výstup, protože každé jiné volání spouští scénář znovu), <c8/> (tytéž výstupy jako jeden typovaný objekt, s dokumentem již zpracovaným jako <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspekce; <c14/> vrací zpracovaný seznam), <c15/> / <c16/> – kodek odkazů ke sdílení (URL, jednotný lokátor zdrojů), který <a1>Kshana Studio</a1> používá k přenosu celého scénáře tam a zpět přes fragment v adresním řádku – a <c17/> / <c18/> / <c19/>, artefakty efemerid SP3-c (revize c formátu Standard Product { "3" }) a CCSDS (Consultative Committee for Space Data Systems) – OMM, Orbit Mean-elements Message, a OEM, Orbit Ephemeris Message – které zapisuje CLI – a <c20/>, který vyhodnotí skutečný záznam přijímače popsaný scénářem <c21/> a vrátí <c22/> jako řetězec JSON (prohlížeč nemá souborový systém, takže záznam a každý navigační soubor musí být ve scénáři vložen jako <c23/> nebo <c24/>; tabulka <c25/> přidá námořní monitory a skóre důvěry 0–100, pouze poradní), <c26/> / <c27/> (které formáty interoperability scénář podporuje, aniž by se spustil, a jeden export v paměti: <c28/>, <c29/>, <c30/>, <c31/> nebo <c32/> jako JSON <c33/>, bajtově shodný pro tentýž scénář, nic se nenahrává), <c34/> (trasa GeoJSON zapsaná do scénáře sledování bodů trasy, ekvivalent <c35/> v příkazové řádce), <c36/> (časové řady běhu jako animované SVG, jediný přehrávač HTML nebo snímky SVG), <c37/> / <c38/> (přibalené referenční scénáře a jejich TOML), <c39/> (naváže token RFC { "3161" } na balíček důkazů v paměti; balíček se musí stále ověřit a podpis autority časových razítek se nekontroluje), <c40/> (navigační data Galileo kterých družic ověřuje soubor stránek I/NAV nebo proud UBX, s důvěryhodným kořenem Merkle nebo veřejnými klíči a volitelným nezávislým referenčním časem; ověřuje data a netvrdí nic o výkonu proti podvržení signálu; nic se nenahrává), <c41/> (omezený výřez NMEA vyhodnocený tak, jak jej vyhodnocuje živý režim; bez hradla), <c42/> (záznam NMEA plavidla jako dávkový běh), <c43/> (proud nebo výsledek důvěry jako text pro Prometheus, řádky syslog CEF nebo LEEF nebo datová část OTLP; nic se neodesílá), <c44/> (kontrola podepsaného balíčku důkazů; nic se nenahrává; balíčky se vytvářejí pomocí CLI, Pythonu nebo MCP), <c45/> (pohyb a události scénáře jako text pro laboratorní simulátor; nezapisuje se žádný signál), <c46/> a <c47/> (které řádky požadavků veřejných rámců výsledkové dokumenty podporují důkazy pro, s mezerou u každého řádku; nejde o zjištění, že rámec je splněn) a <c48/> (text CSV z ADS-B nebo AIS na GeoJSON <c49/> za den UTC; pouze souhrnně), <c50/> (podíl trasy vedoucí zhoršenými buňkami těchto map; nejde o předpověď), <c51/> (syntetická NMEA můstku a instruktorský záznam pro výcvik posádek; pouze text, nikdy pro živé navigační systémy plavidla) a funkce geometrie oblohy <c52/>, <c53/>, <c54/>, <c55/> a <c56/> (které družice místo vidí, když část oblohy blokují budovy, nábřeží nebo terén, s faktorem DOP (zhoršení přesnosti), elipsou vodorovné chyby, oblakem Monte Carlo se seedem a skyplotem jako textem SVG; rozhodnutí o viditelnosti a elipsa jsou ověřeny proti nezávislým knihovnám, přednastavení jsou reprezentativní geometrie, nikoli zaměření, a obzor odstraní družice s přímou viditelností a nic víc). Není v sestavení pro prohlížeč: <c57/> s hradlem a naslouchačem TCP, proudová tréninková NMEA a exportéry telemetrie (Prometheus, OpenTelemetry, syslog) jsou dlouho běžící síťové procesy a zůstávají v nástroji příkazové řádky; vytvoření balíčku důkazů potřebuje podpisový klíč, který patří k CLI nebo Pythonu. Volání <c58/> jedním příkazem zde neexistuje; tato vazba existuje jen v kole (wheel) pro Python.

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

seg-4ae905aec2ab = <s1>Předchozí</s1>Rozhraní Python

seg-8af548581ae9 = <s1>Další</s1>Crate Rustu
