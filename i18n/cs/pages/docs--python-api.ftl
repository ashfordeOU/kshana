# docs--python-api: translations (cs)

seg-5ad814c7ef9e = Poznámky

seg-2bd2101ce454 = Povrch

seg-fffbeccd4266 = Symbol

seg-a129b9e613d0 = Typ

# c1: docs/PYTHON_API.md
seg-ce0b6a889a87 = Zdroj: <c1/>

# c1: abi3
# c2: kshana.pyi
# c3: py.typed
# c4: mypy
# c5: pyright
seg-aea4d3625c20 = Kshana dodává plnohodnotné programovací rozhraní aplikací (API) pro Python, vytvořené pomocí <a1>PyO3</a1> a <a2>maturin</a2>. Její balíčky wheel <c1/> jsou sestavovány proti stabilnímu binárnímu rozhraní aplikací (ABI) Pythonu, takže jeden wheel na platformu funguje napříč CPython ≥ { "3.9" }; wheely pokrývají Linux, macOS a Windows, každý na x86-64 a 64bitovém ARM (viz <a3>WHEEL_TAGS.md</a3>). Přibalený typový stub (<c2/> + <c3/>) dává editorům a nástrojům <c4/>/<c5/> úplné typové informace.

seg-8b0ad6639bd5 = Rychlý start

# c1: scenarios/
# c2: pip install numpy
seg-28e092a5a781 = Tyto úryvky spouštějte z kořene kopie repozitáře: čtou soubory scénářů v <c1/>. Řádek s NumPy vyžaduje <c2/>.

seg-8c83544270b5 = Signatura

seg-fa90b5cd182b = Vrací

# c1: .json
# c2: .svg
# c3: .summary
# c4: .csv
# c5: .data()
# c6: .array()
# c7: .columns()
# c8: .series()
# c9: .write_csv()
seg-6f62744a47df = typovaný výsledek (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

seg-67cd4e7f6ad0 = dokument s výsledkem jako řetězec JSON (JavaScript Object Notation)

seg-8246b2be7aaf = dostupné druhy scénářů + metadata (zpracovaná)

# c1: scenario_kinds
seg-b5ad97d3ec18 = tatáž metadata jako JEDEN řetězec pole JSON, nikoli seznam (ponecháno pro stávající volající; pro zpracovaný seznam použijte <c1/>)

seg-8ce669f8e1d0 = chybové zprávy (prázdné, je-li platné)

# c1: invalid_input
# c2: non_convergence
# c3: unsupported
# c4: io_error
# c5: None
seg-6017d21f52dd = štítek kategorie selhání (<c1/>, <c2/>, <c3/> nebo <c4/>), nebo <c5/> při úspěchu

seg-c62c5ab99132 = verze enginu

# c1: receiver-trust
# c2: [platform] kind = "vessel"
seg-fdaaf33250d1 = vyhodnotí skutečný záznam přijímače popsaný scénářem <c1/>: dokument s výsledkem, CSV důvěry po epochách, graf a souhrn; tabulka <c2/> přidává námořní monitory a skóre důvěry 0–100 s důvody (poradní)

seg-0fb76af3d043 = omezený výřez NMEA ohodnocený stejně jako v živém režimu: stav po epochách, skóre 0–100 a důvody, souhrn (bez socketu, bez brány; poradní)

seg-6ecd9bb3a1cd = záznam NMEA plavidla jako dávkový běh: model skóre a skóre každé epochy s jeho srážkami (poradní)

# c1: events_toml
# c2: events
seg-7cd62f15bc3c = publikovaný katalog a plán Jammertestu jako události plánované pravdy (<c1/>, <c2/>); plánované sloty, nikoli zaznamenané časy vysílání

seg-1e2faf2894e3 = záznam přijímače ohodnocený proti tomuto plánu: latence, nezachycené události, doba obnovy a falešné poplachy pro každý test (MODELLED; podepsaný balíček vyžaduje příkazovou řádku)

# c1: files
# c2: public_key
# c3: seed_hex
seg-f94eaef45f04 = podepsaný balíček důkazů pro okno záznamu, v paměti: <c1/>, <c2/>, <c3/> (uchovejte v soukromí); technický záznam, nikoli právní stanovisko

# c1: verdict
# c2: verified
# c3: intact-signer-not-pinned
# c4: failed
seg-ebd10aea2f6f = ověří balíček: hashe, řetězec, podpis, případně důvěryhodného podepisovatele, úplný záznam a časové razítko; <c1/> je <c2/>, <c3/> (veřejný klíč nezadán: neporušeno, podepisovatel nezjištěn) nebo <c4/>

# c1: --export-sp3/-omm/-oem
seg-bf13e70f1d5c = artefakty <c1/> z CLI jako text

seg-1e5eb44bec6f = které formáty interoperability se na scénář vztahují, aniž by se spouštěl

# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
# c6: {format, spec_url, files}
# c7: {suffix, bytes, sha256, encoding, content}
# c8: utf-8
# c9: base64
seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> nebo <c5/> v paměti: <c6/>, každý soubor <c7/> (text <c8/> nebo <c9/>)

# c1: --import-route
seg-bef8250e8453 = trasa GeoJSON zapsaná do scénáře trasy po bodech (<c1/>)

# c1: {summary, files}
seg-e25bcb6342db = časová řada běhu jako animované SVG, přehrávač HTML nebo až { "120" } snímků SVG: <c1/>

seg-9b24b9cf0510 = přibalené referenční scénáře a jejich TOML

# c1: {files, notes}
seg-f62c11fe1e7d = naváže token RFC { "3161" } (bajty nebo base64) na balíček v paměti: <c1/>; balíček se musí stále ověřit; podpis autority se nekontroluje

# c1: seed_hex
# c2: public_key
# c3: fingerprint
# c4: warning
seg-95fe54b500a7 = nový podpisový klíč v paměti: <c1/> (SOUKROMÝ), <c2/>, <c3/>, <c4/>; pouze Python

# c1: iq sweep
seg-646e6aba13db = přehraje jeden záznam napříč návrhy smyček (<c1/>): pro každý návrh a PRN ustálený jitter, podíly zámku a C/N0; jedno vyhledání na PRN, každý kanál na týchž vzorcích

# c1: hash
seg-08d46de5e7cd = popíše jeden záznam, nebo všechny záznamy ve složce (čte soubory; <c1/> je čte celé)

# c1: {files: {suffix: text}, notes, notice}
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: notice
seg-7d9cc8394e65 = pohyb vozidla a události scénáře pro laboratorní simulátor GNSS, v paměti: <c1/>; druhy <c2/>, <c3/>, <c4/>; žádný signál se nezapisuje, <c5/> uchovejte spolu se soubory

# c1: runs
# c2: {label, result, scenario?}
# c3: {report, markdown}
# c4: status
# c5: report["statement"]
seg-e215c7242eb2 = mapování na veřejný rámec vyplněné z textů výsledků: <c1/> je seznam slovníků <c2/> (text, nejvýše { "64" }); vrací <c3/>; <c4/> každého řádku říká, že běhy podporují důkazy pro jeho schopnosti, nikoli že je rámec splněn; s jakýmkoli zobrazením přenášejte <c5/>

seg-18d57e4920dd = statické mapovací tabulky (nebo zdrojové dokumenty) jako Markdown, s prohlášením na začátku

seg-8284e10dce6a = balíčky standardů (id, název, rámec, počty testů) a upozornění; balíček poměřuje modelované scénáře s prahy stanovenými před během

# c1: MET
# c2: NOT MET
# c3: NEEDS INPUT
# c4: markdown
# c5: ValueError
seg-ce6b819604a9 = běh jednoho balíčku: každý test <c1/>, <c2/> nebo <c3/> s naměřenými a očekávanými hodnotami, plus zpráva jako Markdown pod <c4/>; u neznámého id vyvolá <c5/>

seg-0f701bc523c6 = implementace LunaNet AFS zkontrolovaná proti vytištěným tabulkám a řešeným příkladům LSIS-AFS V1.0 (prahy B1 až B10; B4 hlásí jedno zafixované nesplnění)

seg-82aecf261c46 = proud symbolů AFS (text z { "0" } a { "1" }) zkontrolovaný na synchronizační vzor, dekódování SB1, FID, kontinuitu TOI a rozestupy; LDPC a CRC-24Q podrámců { "2" } až { "4" } se neověřují

seg-f72ab45ae10b = testovací proud symbolů se zástupnými podrámci (nikoli průběh signálu)

# c1: docs/spec/TEST-CONDITIONS.md
# c2: evidence_create
seg-1da34527bb64 = podepsaný laboratorní okružní balíček, který hashem spojuje scénář, zkušební podmínky (<c1/>), záznam přijímače a skóre; jako <c2/>

seg-dd3726fec672 = soubor s výsledkem kshana-bench (text JSON) ze souboru pravdy a souboru predikcí; MODELLED

seg-b82a110c324c = soubory s výsledky kshana-bench vykreslené jako statická stránka s žebříčkem (HTML)

# c1: kshana osnma verify --json
# c2: advisory
seg-58b8aa919eaf = autentizace Galileo OSNMA stránek I/NAV nebo proudu UBX v paměti: slovník, který vypisuje <c1/>, s upozorněním v jeho poli <c2/>; pouze poradní charakter, nikoli služba integrity navigace

# c1: visible
# c2: masked
# c3: request
# c4: site
# c5: time_s
# c6: systems
# c7: tle
# c8: satellites
# c9: mask_deg
# c10: skyline
# c11: clock
# c12: sigma_uere_m
# c13: confidence
# c14: sky_source
# c15: sky_statement
seg-15e4601cd88c = družice, které stanoviště vidí při obzoru závislém na azimutu: pro každou družici <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, kofaktor a kovariance v soustavě východ–sever–nahoru a horizontální chybové elipsy; <c3/> je text JSON nebo TOML, nebo slovník (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); rozhodnutí o viditelnosti a elipsa jsou kontrolovány proti nezávislým knihovnám, zbytek je MODELLED a výsledek nese poradní upozornění (<c14/>, <c15/> říkají, zda je obzor reprezentativní, nebo vychází ze sad elementů)

# c1: n
# c2: request
seg-51ac7cd68154 = <c1/> ({ "1" } až { "5000" }) chyb metodou nejmenších čtverců se seedem na viditelné množině z <c2/>, s jejich empirickou kovariancí, RMS a podílem uvnitř elipsy { "95" } %

# c1: city-street
# c2: harbour-approach
# c3: fjord
# c4: container-terminal
seg-8bba3099379a = předvolby obzoru (<c1/>, <c2/>, <c3/>, <c4/>) s označením REPRESENTATIVE, původem a řezem pro každý stupeň azimutu; reprezentativní geometrie, nikoli zaměření

seg-f900de61f6e9 = část obzoru (tabulka, městský kaňon, sektory, terén) převedená na normalizovanou tabulku o 360 položkách, kterou engine používá

# c1: request
seg-824f3c5951fa = skyplot z <c1/> jako statický text SVG

# c1: jsonl
# c2: receiver-trust
# c3: kshana trust-telemetry
seg-0ffb65c8f5f3 = proud důvěry (<c1/>) nebo výsledek <c2/> jako text Prometheus, řádky syslogu CEF či LEEF, nebo náklad OTLP JSON, s kodéry <c3/>; nic se neodesílá a nečtou se žádné hodiny (řádky syslogu nenesou časové razítko)

# c1: kshana-interference-map/v1
seg-c1ab3dbbe2f2 = mapa interference GNSS z textu CSV ADS-B nebo AIS: jeden slovník na den UTC s GeoJSON <c1/> (pouze souhrnně; zhoršená buňka neuvádí interferenci jako příčinu)

seg-ff4bc7fdbce7 = podíl trasy vedoucí zhoršenými buňkami těchto map, jako text JSON (nikoli předpověď; nepozorované buňky nejsou důkazem čisté trasy)

# c1: nmea
# c2: log_json
# c3: log_text
seg-d70bccba0e03 = syntetické můstkové NMEA pro výcvik posádky plus záznam instruktora (<c1/>, <c2/>, <c3/>); pouze text, nikdy pro živé navigační systémy plavidla

# c1: iq_scene
# c2: iq_acquire
# c3: iq_track
# c4: gps-l1ca
# c5: galileo-e1b
# c6: glonass-l1of
seg-3fe13851ac82 = názvy signálů GNSS IQ, které přijímají <c1/>, <c2/> a <c3/> (<c4/>, <c5/>, <c6/>, ...)

# c1: samples_i
# c2: samples_q
# c3: truth
seg-50bf4ad4e23a = vícedružicová scéna GNSS IQ v paměti: <c1/> / <c2/> a <c3/> po epochách

seg-b3199839a37c = totéž, přičemž každá družice GPS má geometrii podle vysílaných efemerid z navigační zprávy RINEX (Receiver Independent Exchange Format)

seg-8f0f9efea46b = akvizice FFT (rychlá Fourierova transformace) každého PRN (pseudonáhodný kód): Doppler, fáze kódu, statistika, práh

# c1: kshana.acq-surface/1
# c2: rows[doppler][lag]
# c3: parabolic
# c4: fine_search
seg-3bf994f3f1bf = celý akviziční povrch jednoho PRN (<c1/>): korelační výkon <c2/>, maximum a dvě jemná zpřesnění Dopplera (<c3/>, <c4/>)

seg-393572e31421 = nejprve akvizice, poté sledování každého PRN: Doppler po epochách, fáze kódu, indikátory zámku, C/N0, prompt korelátor

seg-bc39efdb015a = řetězec vstupní části přijímače (pásmová propust, notch, blanking, excize, AGC (automatické řízení zesílení), kvantizér) nad komplexními vzorky

# c1: iq-labfit
seg-ead1b81c712f = fit modelu ztráty zámku sledovací smyčky na časovou osu důvěry v přijímač (scénář <c1/>)

# c1: kshana.loop-design/1
# c2: name
# c3: hash
# c4: ValueError
seg-0ab8531d0465 = zpracuje soubor <c1/> (cesta nebo text TOML) na jeho vyřešené návrhy, každý s <c2/> a <c3/>; u neplatného souboru vyvolá <c4/>

# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: header
# c4: records
seg-9c3467d4451e = přečte binární soubor epoch sledování (<c1/>, jak jej zapisuje <c2/>): <c3/> a jeden slovník na epochu v <c4/>

# c1: iq monitor
# c2: series
# c3: events
# c4: spectra
# c5: notes
seg-469303e33d2a = detekční monitory IQ nad záznamem v jednom průchodu (<c1/>): <c2/>, <c3/>, <c4/> a <c5/>; čte soubor

# c1: kshana.test-conditions/1
# c2: hash
seg-bb5c5008f1a8 = zkontroluje soubor laboratorních zkušebních podmínek (<c1/>, TOML nebo JSON, cesta nebo text) a vrátí jej vyřešený, s jeho <c2/>

# c1: kshana.campaign/1
# c2: out_dir
# c3: kshana iq campaign
# c4: digest
seg-d2441bf762b4 = spustí kampaň laboratorního přehrávání (<c1/>) do <c2/> jako <c3/>; hotové buňky se přeskočí; po dokončení všech buněk vrátí počty buněk, selhání a <c4/>

# c1: digest
seg-7b6d264d9c7f = znovu sestaví z buněk kampaně její výsledkové karty, zprávu HTML a digest: počty buněk a řádků, řádky nesplňující práh a <c1/>

seg-e3956268cf1c = Signatury GNSS IQ a důvěry v přijímač

# c1: kshana.pyi
# c2: samples_i
# c3: samples_q
# c4: i
# c5: q
# c6: numpy.asarray(...)
seg-817bd0898d46 = Úplné signatury tak, jak je uvádí <c1/> (každé klíčové slovo za povinnými argumenty má výchozí hodnotu; docstringy ve stubu uvádějí význam každého z nich). Seznamy <c2/> / <c3/> a vstupy <c4/> / <c5/> pro pole obalte pomocí <c6/>.

# c1: iq_read_epochs
# c2: kshana iq track --epochs
seg-2dd9323829ce = Kampaň laboratorního přehrávání z Pythonu a poté její zpráva (soubor kampaně a její záznamy jsou vaše; hotová buňka se při dalším volání přeskočí; <c1/> čte soubor epoch sledování, který zapsal běh <c2/>):

# c1: iq_track
# c2: acq_coherent
# c3: None
# c4: acq_coherent=1
seg-5f48b88438df = Parametr <c2/> funkce <c1/> určuje, kolik kódových period předávací akvizice integruje koherentně. Od verze { "0.33.0" } má výchozí hodnotu <c3/>, tedy automaticky: asi { "4" } ms ({ "4" } periody pro kód o délce { "1" } ms, například GPS L1 C/A, { "1" } pro kód o délce { "4" } ms nebo delší), takže kanál začíná dostatečně blízko, aby jej frekvenční smyčka dokázala zachytit; <c4/> ponechává hledání z verze { "0.32" } s jednou periodou.

seg-012a83181bd3 = Typy

# c1: kshana.pyi
# c2: ScenarioKind
# c3: Literal
# c4: ErrorKind
# c5: error_kind
# c6: ProvenanceClass
# c7: TypedDict
# c8: KindMeta
# c9: scenario_kinds()
# c10: FieldUnit
# c11: units
# c12: _FieldUnitBase
# c13: tests/typed_api_sync.rs
seg-0b4f4c6c6014 = <c1/> typuje uzavřené slovníky pro kontrolory (mypy, pyright): <c2/> (každý název druhu, <c3/>), <c4/> (čtyři štítky, které vrací <c5/>), <c6/> a <c7/> <c8/> (seznam těchto položek vrací <c9/>) a <c10/> (položka bloku <c11/> ve výsledku, která rozšiřuje základ povinných klíčů <c12/>). Existují jen pro typové kontrolory a za běhu je nelze importovat; <c13/> je udržuje shodné se seznamy enginu.

seg-b5ad0d8e1456 = Člen

seg-2698ab8436e6 = úplný dokument s výsledkem (JSON)

seg-7eccc8361120 = samostatné SVG (Scalable Vector Graphics) grafu

seg-38c8d20ca07a = jednořádkový souhrn pro člověka

seg-e21e82ad3fe8 = tabulka reprodukovatelnosti pro druhy, které ji vydávají (viz níže)

seg-aadcc1cc4c79 = výsledek zpracovaný do slovníku Pythonu (viz poznámku o struktuře níže)

# c1: path
# c2: "points.0.coords"
# c3: "/points/0/coords"
seg-409504363c4c = číselný seznam na <c1/> (s tečkami, <c2/>, nebo JSON Pointer, <c3/>): 1-D pro čísla, 2-D pro číselné seznamy stejné délky

# c1: path
seg-b6d5d7e5271a = seznam záznamů na <c1/> (časová řada), jedno pole pro každé pole, které je v každém záznamu číslo

# c1: .columns
seg-adb2d15f9f74 = každý seznam záznamů s číselným polem, klíčovaný cestou s tečkami, každý jako <c1/>

# c1: path
seg-7f053ad96880 = zapíše tuto tabulku do <c1/>; vrací počet zapsaných bajtů, nebo { "0" } (a nic nezapíše), když druh tabulku nevydává

seg-276104139e73 = Tabulka reprodukovatelnosti

# c1: realtime-frame-eop
# c2: lunar-time-budget
# c3: lunar-jamming
# c4: telecom-timing
# c5: leo-navmsg
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: csv = None
# c10: <scenario>.table.csv
seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> a <c5/> tabulku publikují vždy; <c6/> ji publikuje, když je nastaveno exportní stanoviště (<c7/> + <c8/>). Každý jiný druh vrací <c9/>. Text je tentýž bajtový obsah, který CLI (rozhraní příkazové řádky) zapisuje jako <c10/>, takže recenzent reprodukující publikovanou tabulku z wheelu nikdy nemusí sestupovat do příkazové řádky:

seg-3ad2987110ee = Struktura výsledku

seg-57c7066d3522 = Ukazatele kvality a časové řady jsou uloženy <b>podle strany běhu</b>, nikoli na nejvyšší úrovni. Pro běh hodin vypadá dokument takto:

# c1: data["quantum"]["fom"]
# c2: data["figures_of_merit"]
# c3: field-units-schema.json
# c4: SCHEMA.md
seg-cb19f961de2b = takže ukazatele kvality jsou <c1/>, nikdy <c2/>. Ostatní druhy vydávají vlastní balíčky; úplný referenční přehled po polích s jednotkami a odkazem na zdroj je <a1><c3/></a1> a průvodce pro čtenáře je <a2><c4/></a2>.

# c1: validate_toml
# c2: error_kind
seg-bfd984e0407b = <c1/> a <c2/> scénář <b>spouštějí</b>, takže odhalí chyby zpracování, konfigurace <em>i</em> běhu. Nikdy nevyvolají výjimku.

# c1: run
# c2: run_typed
# c3: ValueError
seg-0ca0a1da8356 = <c1/> / <c2/> při neplatném scénáři vyvolají <c3/>.

# c1: seed
# c2: scenario_hash
# c3: REPRODUCIBILITY.md
seg-901c2ede0cd0 = Výsledky jsou reprodukovatelné: scénář nese svůj <c1/> a engine zaznamenává <c2/>, takže stejný vstup dává na téže platformě bajtově shodný výstup (viz <a1><c3/></a1>).

# c1: .array
# c2: .columns
# c3: .series
# c4: numpy.asarray(...)
# c5: .data()
# c6: tests/python/test_numpy_runoutput.py
# c7: ImportError
# c8: KeyError
# c9: ValueError
# c10: notebooks/
seg-8c0c32fcba2b = <c1/>, <c2/> a <c3/> vracejí přesně <c4/> týchž hodnot, jaké dává <c5/> (stejný dtype, bitově shodné; <c6/>). NumPy importují při volání a bez něj vyvolají <c7/>; NumPy zůstává mimo běhové požadavky balíčku. <c8/> znamená, že cesta chybí, <c9/>, že hodnota tam není číselné pole (nebo seznam záznamů). Spustitelné notebooky jsou v <a1><c10/></a1>.

seg-00a3cf088cde = Není v Pythonu: dlouho běžící procesy

# c1: kshana receiver-trust live
# c2: --listen
# c3: docs/TRUST-TELEMETRY.md
# c4: kshana nmea-scenario --tcp/--udp
# c5: receiver_trust
# c6: receiver_trust_replay
# c7: nmea_training
seg-3780dd4973f0 = <c1/> (procesu proudu s bránou a volitelným serverem TCP <c2/>), exportéry telemetrie (Prometheus, OTLP, syslog; <c3/>) a streamování <c4/> jsou jen pro příkazovou řádku: vazba skončí s koncem volání a nedrží otevřený socket. Python pokrývá dávkovou podobu každého z nich: <c5/> pro záznam, <c6/> pro výřez proudu (skóre a stavy; brána se neuplatňuje), <c7/> pro vygenerovaný text.

seg-82379c29d438 = <s1>Předchozí</s1>Atomový interferometr z chladných atomů

seg-4a457afc63fb = <s1>Další</s1>npm a WebAssembly

seg-dbbce10a12d2 = RunOutput

seg-a4c68601516f = odhadnuté oblasti emitorů z textu CSV ADS-B nebo AIS: <c1/>, každá označená MODELLED; oblasti se stanovenou spolehlivostí s těžištěm a elipsou nejistoty, nikdy holý bod; pouze souhrnně, a oblast není polohou nikoho ani zjištěním příčiny
