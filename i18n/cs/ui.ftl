# Text rozhraní (cs): rámec webu, oznámení, přepínač jazyka, rámec Studia.

## Site chrome
site-skip-link = Přejít na obsah
site-nav-primary = Hlavní
site-nav-missions = Mise
site-nav-capabilities = Schopnosti
site-nav-evidence = Důkazy
site-nav-research = Výzkum
site-nav-developers = Vývojáři
site-nav-docs = Dokumentace
site-nav-editions = Edice
site-nav-search = Hledání
site-nav-launch = Spustit
site-nav-studio = { -brand } Studio
site-nav-home = Domovská stránka { -brand }
site-nav-theme = Přepnout mezi světlým a tmavým režimem
site-version = v{ $version }

site-footer-tagline = Open-source simulátor odolnosti PNT (určování polohy, navigace a času). Neovládá žádný rádiový hardware a nic nevysílá: jeho výstupem na úrovni signálu jsou soubory vzorků IQ v základním pásmu a jeho softwarový přijímač GNSS je analytický nástroj. Nejde o letový produkt.
site-footer-product = Produkt
site-footer-company = Společnost
site-footer-benchmark = Benchmark
site-footer-install = Instalace
site-footer-mcp = Server MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · od Ashforde® OÜ · AGPL-3.0, s možností komerční licence
site-footer-provenance = Každý graf je vykreslen ze zaznamenaného běhu enginu v{ $version } a uvádí svůj scénář, seed a postup, jak jej reprodukovat.

## Language switcher
site-lang-label = Jazyk
site-lang-switch-aria = Zvolte jazyk této stránky
site-lang-auto = Jazyk prohlížeče
site-lang-remembered = Vaše volba se na tomto zařízení zapamatuje.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } část této stránky se od překladu změnila a zobrazuje se anglicky.
        [few] { $n } části této stránky se od překladu změnily a zobrazují se anglicky.
        [many] { $n } části této stránky se od překladu změnilo a zobrazuje se anglicky.
       *[other] { $n } částí této stránky se od překladu změnilo a zobrazuje se anglicky.
    }
notice-not-started = Tato stránka zatím nebyla přeložena. Zobrazuje se anglicky.
notice-detected = Zobrazuje se jazyk { $language }. <a1>Přepnout na angličtinu</a1>
notice-dismiss = Zavřít
notice-recorded-in-english = Zaznamenáno anglicky
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Domovská stránka { -brand }
studio-search-label = Najděte scénář, oblast, nastavení nebo příkaz
studio-search-placeholder = Hledejte podle názvu, otázky nebo nastavení, například elevační maska
studio-search-scenarios = Hledat scénáře, oblasti nebo nastavení
studio-search-commands = Hledat scénáře a příkazy
studio-search-all = Najít scénář, oblast, nastavení, pohled nebo příkaz
studio-search = Hledání
studio-theme = Přepnout mezi světlým a tmavým režimem
studio-starting-questions = Otázky, od kterých začít
studio-where-you-are = Kde se nacházíte
studio-engine-status = Kde engine běží
studio-views = Pohledy: Geometrie, Důvěra v přijímač, Mapa interference, Rozbor tréninku, Nástroje
studio-more-views = Další pohledy
studio-advanced-full = Úplný panel: každý panel, pole a karta
studio-advanced-switch = Přepnout na pokročilý pohled
studio-view-geometry = Geometrie: skyplot, skyline a DOP
studio-view-training = Rozbor tréninku: otevřete záznam instruktora
studio-view-interference = Mapa interference: otevřete soubory map
studio-view-receiver-trust = Důvěra v přijímač: otevřete běh plavidla
studio-view-tools = Nástroje: důkazy, bench, compliance, OSNMA
studio-result = Výsledek
studio-result-meaning = Co výsledek znamená
studio-key-figures = Klíčové hodnoty
studio-result-views = Pohledy na tento výsledek
studio-figures-of-merit = Ukazatele kvality
studio-find-result-field = Najít pole výsledku
studio-capability-view = Pohled na schopnosti
studio-time-series = Časová řada
studio-chart-source = Zdroj grafu
studio-signal-band = Signál a pásmo
studio-signal-field = Pole signálu
studio-clock-holdover = Holdover hodin
studio-telecom-masks = Telekomunikační časové masky
studio-clock-stability = Stabilita hodin
studio-orbit-3d = Oběžná dráha 3D
studio-ground-track = Pozemní stopa
studio-parameter-sweep = Průchod parametru
studio-compare-runs = Porovnat běhy
studio-animation = Animace
studio-engine-report = Zpráva enginu
studio-exports = Exporty a zpráva
studio-full-result = Úplný dokument výsledku
studio-settings = Nastavení a podrobnosti
studio-find-setting = Najít nastavení, například maska
studio-find-scenario-setting = Najít nastavení tohoto scénáře
studio-engine-summary = Vlastní shrnutí enginu
studio-restore-scenario = Obnovit přibalený scénář
studio-copy-scenario = Zkopírovat text scénáře
studio-scenario-source = Zdroj scénáře (TOML)
studio-install-engine = Nainstalovat engine
studio-run-history = Historie běhů
studio-scenarios-count =
    { $n ->
        [one] Scénář, který spouští ({ $n })
        [few] Scénáře, které spouští ({ $n })
        [many] Scénáře, které spouští ({ $n })
       *[other] Scénářů, které spouští ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } řádek registru
        [few] { $n } řádky registru
        [many] { $n } řádku registru
       *[other] { $n } řádků registru
    }
studio-recorded-in-english = Zaznamenáno anglicky
studio-lang-engine-fallback = Text enginu pro tento jazyk se nepodařilo načíst; zobrazuje se angličtina.

studio-geometry-kshana-home = Domovská stránka Kshana

studio-geometry-back-to-the-studio = Zpět do Studia

studio-geometry-step-the-time = Posouvat čas po krocích

studio-geometry-draw-the-skyline = Nakreslit skyline

studio-geometry-skip-to-the-view = Přejít na pohled

studio-geometry-which-satellites-can-you-see = Které družice vidíte a jak dobrá je jejich geometrie?

studio-geometry-what-this-shows = Co to ukazuje

studio-geometry-starting-the-engine = Spouští se engine…

studio-geometry-every-setting-is-in-the = Každé nastavení je v adrese stránky, takže zkopírovaný odkaz otevře stejnou oblohu.

studio-geometry-offset-from-the-constellations-reference = Odstup od referenční epochy konstelací

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Vaše vlastní dráhové elementy (TLE)

studio-geometry-use-these-elements = Použít tyto elementy

studio-geometry-back-to-the-presets = Zpět na předvolby

studio-geometry-clear-the-skyline = Vymazat skyline

studio-geometry-drag-on-the-skyplot-to = Tažením po skyplotu nakreslíte skyline (kroky 1° v azimutu, 0,5° v elevaci). Při zaměřeném skyplotu: Vlevo a Vpravo se pohybují po obzoru (Shift pro 10°), Nahoru a Dolů v daném místě zvedají nebo snižují skyline (Shift pro 5°), Delete jej vymaže.

studio-geometry-copy-a-link-to-this = Zkopírovat odkaz na tuto oblohu

studio-geometry-download-the-skyplot-svg = Stáhnout skyplot (SVG)

studio-geometry-zenith-in-the-centre-the = Zenit uprostřed, obzor na okraji, sever nahoře. Vyplněné značky jsou družice v řešení; prázdné značky jsou skryté maskou nebo skyline, nebo nepoužité.

studio-geometry-dilution-of-precision = Faktor zhoršení přesnosti

studio-geometry-how-much-the-geometry-multiplies = Kolikrát geometrie znásobuje chybu vzdálenosti. Nižší je lepší; kolem 1 je výborné, nad 6 je špatné.

studio-geometry-horizontal-position-error = Horizontální chyba polohy

studio-geometry-satellites-as-a-table = Družice jako tabulka

studio-geometry-the-same-satellites-as-the = Stejné družice jako na skyplotu.

studio-geometry-azimuth = Azimut, °

studio-geometry-elevation = Elevace, °

studio-geometry-in-the-solution = V řešení

studio-geometry-the-engine-runs-here-as = Engine zde běží jako WebAssembly. Nic se nestahuje z jiného webu a nic, co nastavíte, se nikam neodesílá.

studio-holdover-holdover-test-scenarios = Scénáře testu holdover

studio-holdover-holdover-test = Test holdover

studio-holdover-how-far-does-the-time = Jak daleko se časová chyba dostane, když GNSS zmizí?

studio-holdover-opening-the-scenarios = Otevírají se scénáře…

studio-holdover-verdict-step-by-step = Verdikt krok za krokem

studio-holdover-time-error-over-the-record = Časová chyba v průběhu záznamu

studio-holdover-the-three-phases-are-shaded = Tři fáze jsou vystínovány; přerušované svislé čáry jsou dva časy uvedené operátorem. Přerušované vodorovné čáry jsou limity masek pro maximální absolutní časovou chybu, každá nakreslená přes krok, který její maska uvádí, a pásmo zotavení; trojúhelník označuje, kdy je poprvé překročen rozpočet nebo obálka holdover ePRTC-A.

studio-holdover-of-the-baseline-and-the = Ze základu a z holdoveru; křížek je limit masky v čase, kdy byla její kontrola nejhorší.

studio-holdover-the-same-two-steps-against = Stejné dva kroky proti limitům TDEV.

studio-holdover-the-numbers = Čísla

studio-holdover-everything-below-is-the-engine = Vše níže pochází z enginu, v jednotkách, které uvádí.

studio-holdover-mask-checks = Kontroly masek

studio-holdover-each-mask-is-measured-on = Každá maska se měří na kroku, který uvádí její podmínka. Maska, která potřebuje delší záznam, než krok poskytl, je INCOMPLETE a nikdy se neextrapoluje; každá položka, kterou doporučení ponechává k dalšímu studiu, chybí.

studio-holdover-what-this-does-not-cover = Co toto nepokrývá

studio-interference-cell-size-in-degrees-empty = Velikost buňky ve stupních (prázdné pro 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = O této stránce

studio-interference-interference-map = Mapa interference

studio-interference-where-did-position-reports-look = Kde se hlášení polohy jevila jako zhoršená?

studio-interference-open-map-files = Otevřít soubory map

studio-interference-or-drop-them-here = nebo je sem přetáhněte

studio-interference-open-the-synthetic-demo = Otevřít syntetické demo

studio-interference-close-all-maps = Zavřít všechny mapy

studio-interference-nothing-open-yet = Zatím není nic otevřeno.

studio-interference-build-a-map-here = Sestavit mapu zde

studio-interference-build-from-the-synthetic-sample = Sestavit ze syntetického vzorku

studio-interference-route-exposure-here = Expozice trasy zde

studio-interference-use-the-synthetic-route = Použít syntetickou trasu

studio-interference-reading-these-maps = Jak číst tyto mapy

studio-interference-maps-inherit-the-coverage-of = Mapy přejímají pokrytí svého zdroje: dobrovolnické přijímače ADS-B nechávají otevřené moře řídce pokryté a otevřená data AIS vynechávají některé třídy plavidel. Přečtěte si poznámky o pokrytí v každém souboru.

studio-interference-no-coastline-or-basemap-is = Nekreslí se žádné pobřeží ani podkladová mapa a nic se nestahuje z žádného serveru; mřížka je jen zeměpisná šířka a délka.

studio-interference-no-identifier-of-any-aircraft = V těchto souborech není žádný identifikátor letadla ani plavidla; buňky s příliš malým počtem různých letadel nebo plavidel se nezveřejňují vůbec a počet AIS jedna nebo dva se zadržuje.

studio-lunar-infra-lunar-infrastructure-scenarios = Scénáře lunární infrastruktury

studio-lunar-infra-lunar-infrastructure = Lunární infrastruktura

studio-lunar-infra-what-can-the-moon-s = Co může oběžná dráha a povrch Měsíce poskytnout jako navigační a geodetická infrastruktura a kde zaostává?

studio-lunar-infra-five-studies-of-what-lunar = Pět studií toho, co by lunární orbitery a lunární povrchová stanice mohly společně poskytnout jako navigační a geodetická infrastruktura: určování oběžné dráhy ze signálů pozemního GNSS ve srovnání s pozemním sledováním, fixace fáze nosné mezi povrchovou stanicí a orbiterem, společný odhad lunární soustavy, propojení GNSS, VLBI a laserového měření vzdálenosti na jedné sondě a citlivost laserového měření vzdálenosti a sledování na slapy a libraci Měsíce. Vstupy jsou ilustrativní a model je omezený; kde studie nesplnila práh, proti kterému byla předregistrována, tato stránka to říká. Každé číslo je zkopírováno z výsledku, který engine zaznamenal; stránka jej škáluje a kreslí a nic dalšího nepočítá.

studio-lunar-infra-what-the-result-holds = Co výsledek obsahuje

studio-lunar-infra-findings-disclosures-and-what-was = Zjištění, upozornění a co nebylo ověřeno

studio-lunar-what-these-figures-are = Co tyto hodnoty jsou

studio-lunar-map-key = Legenda mapy

studio-lunar-lunar-station = Lunární stanice

studio-lunar-what-accuracy-could-a-reference = Jakou přesnost by mohla poskytnout referenční stanice poblíž lunárního jižního pólu a kde?

studio-lunar-the-constellation-its-signal-in = Konstelace, chyba jejího signálu v prostoru, chyba zaměření stanice, latence korekcí a kvantizace spoje jsou vstupy uvedené v souboru scénáře, každý se svým zdrojem nebo označený jako ilustrativní. Žádná zde uvedená hodnota nebyla ověřena proti skutečné stanici ani letovým datům.

studio-lunar-the-source-and-every-input = Zdroj a každý vstup, který změníte, jsou v adrese stránky, takže zkopírovaný odkaz otevře stejnou studii.

studio-lunar-a-result-file-is-the = Soubor výsledku je JSON, který engine pro tento druh zapisuje (výstup JSON z příkazového řádku nebo běh uložený odtud). Čte se na této stránce; nic se neodesílá.

studio-lunar-each-field-shows-the-scenario = Každé pole ukazuje hodnotu ze souboru scénáře, dokud ji nezměníte. Den epoch přes celou mřížku chvíli trvá: méně pokusů nebo delší časový krok běží rychleji.

studio-lunar-run-it-here = Spustit zde

studio-lunar-back-to-the-file-s = Zpět na hodnoty ze souboru

studio-lunar-copy-a-link = Zkopírovat odkaz

studio-lunar-save-this-result-json = Uložit tento výsledek (JSON)

studio-lunar-corrected-error-over-the-south = Korigovaná chyba nad jihopolární oblastí

studio-lunar-south-polar-stereographic-the-pole = Jihopolární stereografické zobrazení: pól uprostřed, okraj mřížky na obvodu, 0° délky nahoře, 90° východně vpravo. Každá buňka je jeden bod mřížky; tlustá čára je místo, kde korigovaná chyba překračuje práh, a přerušovaná čára je poloměr pokrytí podle azimutu.

studio-lunar-region-figures = Hodnoty oblasti

studio-lunar-over-the-whole-grid-means = Přes celou mřížku: průměry vážené plochou a nejhorší bod.

studio-lunar-coverage-radius-per-azimuth = Poloměr pokrytí podle azimutu

studio-lunar-along-each-bearing-from-the = Podél každého směru od stanice: vzdálenost, ve které pokrytí poprvé klesne pod 95 %.

studio-lunar-as-a-table = Jako tabulka

studio-lunar-radius-km = Poloměr, km

studio-lunar-at-the-grid-edge = Na okraji mřížky

studio-lunar-points-along-it = Body podél něj

studio-lunar-an-epoch-is-unavailable-at = Epocha je v bodě nedostupná, když uživatel vidí méně než čtyři družice nebo stanice nevidí každou družici, kterou uživatel používá; pro ni se chyba nepočítá.

studio-lunar-grid-points-as-a-table = Body mřížky jako tabulka

studio-lunar-the-same-points-as-the = Stejné body jako na mapě, nejbližší stanici první.

studio-lunar-latitude = Zeměpisná šířka, °

studio-lunar-longitude = Zeměpisná délka, °

studio-lunar-from-the-station-km = Od stanice, km

studio-lunar-corrected-error = Korigovaná chyba

studio-lunar-uncorrected-error = Nekorigovaná chyba

studio-lunar-hpl-median = Medián HPL

studio-lunar-the-engine-s-statement-inputs = Prohlášení enginu, vstupy a rozpočet spoje

studio-lunar-inputs-as-the-engine-read = Vstupy tak, jak je engine četl

studio-lunar-error-model = Model chyby

studio-lunar-correction-link-budget-at-the = Rozpočet korekčního spoje na stanici a v nejhorším bodě

studio-observatory-previous-day = Předchozí den

studio-observatory-day-opened = Otevřený den

studio-observatory-next-day = Následující den

studio-observatory-interference-observatory = Observatoř interference

studio-observatory-what-did-one-day-s = Jak vypadala hlášení polohy za jeden den?

studio-observatory-the-observatory-writes-a-few = Observatoř zapisuje pro každý den UTC a oblast několik souborů: buňky mřížky v jednom ze tří stavů, seznam incidentů a manifest. Otevřete zde soubory, které jste vytvořili, a čtěte je. Stránka nic nepočítá a ukazuje jen to, co soubory říkají. Neobsahuje žádná data observatoře, nic nestahuje a nic nenahrává.

studio-observatory-open-a-day = Otevřít den

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Tři stavy

studio-observatory-the-picture-the-observatory-wrote = Obrázek, který observatoř zapsala

studio-observatory-the-png-you-opened-as = PNG, které jste otevřeli, tak jak je. Buňky, které nejsou nakresleny, nebyly pozorovány.

studio-observatory-cells-drawn-from-the-file = Buňky nakreslené ze souboru

studio-observatory-plate-carr-eacute-e-no = Plate carrée, bez podkladové mapy. Pro stav a počty najeďte na buňku nebo použijte tabulku. Místo bez buňky nebylo pozorováno.

studio-observatory-hover-or-focus-a-cell = Pro stav najeďte na buňku nebo ji zaměřte.

studio-observatory-every-cell-in-the-file = Každá buňka v souboru

studio-observatory-a-count-the-file-withholds = Počet, který soubor zadržuje (méně než 5 letadel), se zobrazí jako „zadrženo“, nikdy jako 0.

studio-observatory-files-and-their-hashes = Soubory a jejich hashe

studio-observatory-dataset-licence-and-notice = Datová sada, licence a upozornění

studio-observatory-what-this-page-does-and = Co tato stránka ukazuje a co ne

studio-observatory-products-are-released-at-least = Produkty se zveřejňují nejméně 24 hodin po konci dne UTC, na buňkách o velikosti 0,5 stupně nebo hrubších. Nikdy to není živý pohled a nikdy neříká „nyní“.

studio-observatory-it-shows-no-cause-no = Neukazuje žádnou příčinu, žádnou zemi, žádnou sílu ani zdroj interference, žádné varování, žádné srovnání mezi místy nebo dny a žádné AIS. ADS-B a AIS se nikdy nekombinují.

studio-observatory-the-page-ships-none-of = Stránka neobsahuje žádné produkty observatoře. Jejich zveřejnění je rozhodnutím vlastníka.

studio-optical-optical-atmosphere-scenarios = Scénáře optické atmosféry

studio-optical-optical-pnt = Optické PNT

studio-optical-can-an-optical-link-get = Projde optický spoj počasím?

studio-optical-the-link = Spoj

studio-optical-sites-as-the-engine-states = Lokality tak, jak je engine uvádí

studio-optical-inputs-are-marked-everything-else = Vstupy jsou označeny; vše ostatní je výstup enginu pro ně.

studio-optical-it-draws-only-what-the = Kreslí jen to, co engine zaznamenal pro každý scénář, včetně jeho časové řady se seedem. Stránka nic nepočítá: škáluje čísla enginu do grafu.

studio-optical-the-sites-their-cloud-climates = Lokality, jejich oblačné klima, třídy hodin a techniky jsou vstupy zvolené pro ilustraci a jsou tak označeny. Žádný změřený záznam dostupnosti nebyl porovnán.

studio-replay-replay-controls = Ovládání přehrávání

studio-replay-previous-moment-page-up = Předchozí okamžik (Page Up)

studio-replay-step-back = Krok zpět

studio-replay-step-back-left-arrow = Krok zpět (šipka vlevo)

studio-replay-play-or-pause-space = Přehrát nebo pozastavit (mezerník)

studio-replay-step-forward = Krok vpřed

studio-replay-step-forward-right-arrow = Krok vpřed (šipka vpravo)

studio-replay-next-moment-page-down = Další okamžik (Page Down)

studio-replay-replay-speed-mission-seconds-per = Rychlost přehrávání, sekundy mise za sekundu

studio-replay-mission-clock-seconds-from-the = Hodiny mise, sekundy od začátku každého běhu

studio-replay-bridge-replay = Přehrání na můstku

studio-replay-two-runs-one-clock-when = Dva běhy, jedny hodiny: kdy to můstek věděl?

studio-replay-put-two-synthetic-runs-side = Postavte dva syntetické běhy vedle sebe a přehrávejte je na jedněch hodinách mise. Každý panel ukazuje, kde plavidlo skutečně bylo, oproti tomu, kde ho přijímač určil, skóre důvěryhodnosti enginu a jeho pásmo v čase, družice, které uvádí samotný log (obloha se vyprázdní, kde log neslyší žádnou), a verdikt na konci běhu. Vše vykreslené pochází z logu nebo z výsledku enginu pro něj; nic se nečte ze sítě.

studio-replay-save-animated-svg = Uložit animované SVG

studio-replay-save-frames-zip = Uložit snímky (ZIP)

studio-replay-opening-the-two-demo-runs = Otevírají se dva demonstrační běhy…

studio-replay-the-skyplot-is-the-log = Skyplot je vlastní GSV logu: vyplněná značka je družice se sílou signálu, prázdná je uvedena bez signálu a vystínovaný sektor je rozsah azimutů, kde log uvádí družice a žádnou z nich neslyší. Zablokovaná obloha a rušený signál tu vypadají stejně. Není to skyline a konstelace je nominální, nikoli efemeridy pro datum logu.

studio-replay-position-error-is-the-logged = „Chyba polohy“ je zaznamenaná vzdálenost mezi skutečnou a hlášenou polohou; kruh kolem plavidla je tato vzdálenost nakreslená v měřítku. Čas od začátku události k prvnímu skóre pod nominálním je rozdíl dvou zaznamenaných časů, nikoli údaj o výkonu detekce.

studio-replay-the-vessel-glyph-points-along = Symbol plavidla ukazuje ve směru kursu z gyra (HDT), kterého se žádná událost netýká; přerušovaný obrys je místo, kam přijímač plavidlo umístí, podél jím hlášeného kursu. Rozdíl mezi nimi je podnět pro rozbor.

studio-replay-the-coast-is-natural-earth = Pobřeží je veřejně dostupná pevnina Natural Earth v měřítku 1:10 milionů, přibalená k této stránce (nic se nestahuje). Polohy v ukázkách jsou vymyšlené, takže pobřeží ukazuje, kam tyto vymyšlené souřadnice padají. Pouze pro ilustraci, nikdy pro navigaci.

studio-ssv-space-user-gnss-scenarios = Scénáře GNSS pro kosmické uživatele

studio-ssv-space-user-gnss = GNSS pro kosmické uživatele

studio-ssv-which-navigation-signals-can-a = Které navigační signály může stále využít kosmická loď daleko nad družicemi GNSS?

studio-ssv-the-satellites-of-a-navigation = Družice navigačního systému míří k Zemi, takže kosmická loď nad nimi slyší jen to, co přesahuje okraj nebo uniká postranními laloky. Tato stránka ukazuje, co engine zjistil v pěti případech: dostupnost na slupce v geostacionární výšce, vysoce eliptická dráha, přechod k Měsíci s přijímačem slabého signálu, palubní filtr a formace dvou kosmických lodí. Každé číslo je zkopírováno z výsledku, který engine zaznamenal; stránka jej škáluje a kreslí a nic dalšího nepočítá.

studio-ssv-against-the-icg-booklet = Proti brožuře ICG

studio-tools-leave-empty-to-check-integrity = nechte prázdné, aby se zkontrolovala jen integrita

studio-tools-synthetic-osnma-example = Syntetický příklad OSNMA

studio-tools-trust-and-evidence-tools = Nástroje důvěry a důkazů

studio-tools-trust-evidence-and-test-tools = Nástroje důvěry, důkazů a testů

studio-tools-the-0-35-features-that = Funkce verze 0.35, které běží ve vašem prohlížeči, a kde najít ty, které nemohou. Soubory, které zde otevřete, se čtou na této stránce a nikdy se nenahrávají; engine běží na vašem počítači jako WebAssembly.

studio-tools-maritime-trust = Námořní důvěra

studio-tools-training-debrief = Rozbor tréninku

studio-tools-the-engine-starts-when-you = Engine se spustí, když použijete nástroj.

studio-tools-every-0-35-feature-and = Každá funkce verze 0.35 a kde se nachází

studio-tools-in-this-browser-where-it = V tomto prohlížeči, kde může běžet. Ostatní jsou funkce příkazového řádku nebo serveru a důvod je uveden.

studio-tools-in-the-studio = Ve Studiu

studio-tools-verify-an-evidence-pack = Ověřit balíček důkazů

studio-tools-open-the-synthetic-example-pack = Otevřít syntetický ukázkový balíček

studio-tools-open-it-with-one-byte = Otevřít s jedním změněným bajtem

studio-tools-no-pack-files-chosen = Nebyly vybrány žádné soubory balíčku.

studio-tools-verify-the-pack = Ověřit balíček

studio-tools-attach-a-timestamp-token = Připojit token časového razítka

studio-tools-attach-to-the-chosen-pack = Připojit k vybranému balíčku

studio-tools-export-a-scenario-for-a = Exportovat scénář pro laboratorní simulátor

studio-tools-which-public-framework-rows-do = Pro které řádky veřejných rámců vaše běhy podporují důkazy (supports evidence for)?

studio-tools-use-the-synthetic-example-runs = Použít syntetické ukázkové běhy

studio-tools-show-the-mapping-tables = Zobrazit mapovací tabulky

studio-tools-show-the-sources-they-cite = Zobrazit zdroje, na které odkazují

studio-tools-no-result-files-chosen = Nebyly vybrány žádné soubory výsledků.

studio-tools-build-the-report = Sestavit zprávu

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: jsou navigační data autentizována?

studio-tools-load-it = Načíst

studio-tools-show-the-recorded-result = Zobrazit zaznamenaný výsledek

studio-tools-imu-fit-sensor-parameters-for = Fitování IMU: parametry senzorů pro hybridní a fúzní scénáře

studio-tools-fit-the-parameters = Fitovat parametry

studio-tools-jammertest-score-a-receiver-log = Jammertest: ohodnoťte log přijímače proti zveřejněnému testovacímu plánu

studio-tools-import-the-schedule = Importovat harmonogram

studio-tools-score-the-log = Ohodnotit log

studio-training-synthetic-library-scenarios = Scénáře syntetické knihovny

studio-training-library-scenario-to-generate = Scénář knihovny ke generování

studio-training-random-seed-optional = Náhodný seed (volitelné)

studio-training-from-the-scenario = ze scénáře

studio-training-time-cursor = Časový kurzor

studio-training-replay-speed = Rychlost přehrávání

studio-training-time-cursor-in-log-rows = Časový kurzor v řádcích logu

studio-training-debrief-timeline-time-cursor = Časová osa rozboru: časový kurzor

studio-training-what-did-the-crew-see = Co posádka viděla a co se skutečně dělo?

studio-training-open-a-log = Otevřít log

studio-training-choose-an-instructor-log-or = Vyberte log instruktora nebo otevřete jeden z pěti scénářů syntetické knihovny zapsaných pomocí CLI.

studio-training-or-drop-it-here-or = nebo jej přetáhněte sem, nebo otevřete scénář knihovny:

studio-training-generate-a-stream-here = Vygenerovat proud zde

studio-training-run-the-engine-s-nmea = Spusťte v tomto prohlížeči generátor tréninkových dat NMEA z enginu. Získáte syntetický proud NMEA 0183 pro cvičení a log instruktora a můžete jej hned rozebrat. Nic se nenahrává; streamování do simulátoru můstku přes TCP nebo UDP je funkce příkazového řádku (viz stránka Nástroje).

studio-training-previous-moment = Předchozí okamžik

studio-training-next-moment = Další okamžik

studio-training-true-track-against-reported = Skutečná trasa oproti hlášené

studio-training-north-up-one-scale-on = Sever nahoře, jedno měřítko na obou osách. Tenká šedá čára je místo, kde plavidlo skutečně bylo. Barevná čára je to, co přijímač hlásil, obarvená podle toho, jak daleko byla od pravdy. Kde přijímač nehlásil žádný fix, se pro něj nic nekreslí.

studio-training-events-and-what-the-receiver = Události a co přijímač řekl

studio-training-one-shared-time-axis-drag = Jedna společná časová osa. Tažením nebo kliknutím posunete kurzor; šipky jej posouvají po krocích. Pruhy událostí ukazují sílu každé vložené události v čase.

studio-training-sky-at-the-cursor = Obloha u kurzoru

studio-training-the-satellites-the-stream-s = Družice, které uvádí samotný GSV proudu. Vyplněná značka má sílu signálu; prázdná je uvedena bez signálu; vystínovaný sektor je tam, kde proud uvádí družice a žádná není slyšet. Nominální konstelace, nikoli efemeridy pro datum proudu.

studio-training-at-the-cursor = U kurzoru

studio-training-events-injected = Vložené události

studio-training-as-the-instructor-log-states = Tak, jak je uvádí log instruktora, se všemi parametry.

studio-training-debrief-timeline = Časová osa rozboru

studio-training-choose-a-moment-to-move = Vyberte okamžik a kurzor se na něj přesune.

studio-training-the-satellite-sky-is-a = Družicová obloha je nominální konstelace, nikoli efemeridy pro datum proudu.

studio-training-nothing-here-is-a-measure = Nic zde není měřítkem toho, jak se jakýkoli přijímač nebo systém chová vůči interferenci.

studio-trust-session-settings-in-toml = Nastavení relace v TOML

studio-trust-receiver-trust-session-settings-in = Nastavení relace důvěry v přijímač v TOML

studio-trust-time-cursor-and-filters = Časový kurzor a filtry

studio-trust-time-cursor-in-epochs = Časový kurzor v epochách

studio-trust-score-timeline-time-cursor = Časová osa skóre: časový kurzor

studio-trust-each-monitor-s-alarm-ratio = Poměr poplachů každého monitoru v čase

studio-trust-about-this-view = O tomto pohledu

studio-trust-can-the-bridge-trust-this = Může můstek tomuto fixu důvěřovat?

studio-trust-open-a-run = Otevřít běh

studio-trust-open-the-masked-sky-demo = Otevřít demo zamaskované oblohy (geometrie, 0.36)

studio-trust-score-an-nmea-log-here = Ohodnotit log NMEA zde

studio-trust-run-the-engine-in-this = Spusťte v tomto prohlížeči engine na logu NMEA 0183 plavidla a výsledek uvidíte v pohledu níže. Log se čte na této stránce a nikdy se nenahrává. Musí jít o výřez nejvýše 2 MiB (asi 20 000 epoch) a musí obsahovat pětiminutové kalibrační okno. Nastavení jsou limity plavidla a váhy skóre, jako v souboru relace.

studio-trust-score-the-synthetic-demo-log = Ohodnotit syntetický demonstrační log

studio-trust-session-settings-toml = Nastavení relace (TOML)

studio-trust-starts-from-the-demo-s = Vychází z nastavení dema: upravte limity rychlosti, zrychlení a úhlové rychlosti zatáčení plavidla tak, aby odpovídaly vašemu. Sem lze vložit soubor nastavení pro vaše vlastní plavidlo.

studio-trust-jammertest-scorecard = Výsledková karta Jammertest

studio-trust-no-scorecard-open = Není otevřena žádná výsledková karta.

studio-trust-generic-receiver-trust-run-not = Obecný běh důvěry v přijímač (ne plavidlo)

studio-trust-run-the-illustrative-jamming-example = Spustit ilustrativní příklad rušení

studio-trust-assess-the-chosen-file = Vyhodnotit vybraný soubor

studio-trust-the-format-is-guessed-from = Formát se odhaduje z názvu souboru; pokud je špatný, změňte jej zde a vyhodnoťte znovu. NovAtel OEM7, RTCM 3 a Septentrio SBF jsou binární formáty; do enginu se v tomto prohlížeči posílají tak, jak jsou.

studio-trust-imu-file-optional-a-second = Soubor IMU (volitelné): druhý senzor pro kurs

studio-trust-an-imu-log-on-the = Log IMU na hodinách logu přijímače doplňuje kurs, který monitor kurs-versus-trasa čte všude tam, kde log přijímače žádný neobsahuje. Používá jej pouze relace plavidla.

studio-trust-remove-the-imu-file = Odebrat soubor IMU

studio-trust-no-imu-file = Žádný soubor IMU.

studio-trust-session-settings-toml-the-log = Nastavení relace (TOML, log je dodán přímo)

studio-trust-first-deduction = První odečet

studio-trust-first-untrusted = První nedůvěryhodný

studio-trust-receiver-reported-track = Trasa hlášená přijímačem

studio-trust-the-satellites-the-log-s = Družice, které uvádí samotný GSV logu. Vyplněná značka má sílu signálu; prázdná je uvedena bez signálu; vystínovaný sektor je tam, kde log uvádí družice a žádnou z nich neslyší (zablokovaná obloha a rušený signál tu vypadají stejně). Nominální konstelace, nikoli efemeridy pro datum logu.

studio-trust-score-over-time = Skóre v čase

studio-trust-score-0-to-100-dashed = Skóre 0 až 100. Přerušované čáry jsou okraje pásem; proužky pod grafem jsou pásmo a brána. Tažením nebo kliknutím posunete časový kurzor; šipky jej posouvají po krocích.

studio-trust-reasons-at-the-cursor = Důvody u kurzoru

studio-trust-points-each-check-took-off = Body, které každá kontrola v této epoše odečetla, od největších. Kliknutím na kontrolu označíte, kde byla nad svým prahem spuštění.

studio-trust-geometry-at-the-cursor = Geometrie u kurzoru

studio-trust-the-satellite-geometry-always-shown = Družicová geometrie, vždy zobrazená: její označení (dobrá, uspokojivá nebo špatná) a hodnoty DOP. Zamaskovaná obloha (trup, nábřeží, stěna fjordu) je přirozené zhoršení, odlišené od nesouladu podobného útoku. Skóre odečítá body za geometrii jen tehdy, když je špatná, nejvýše 15, a nikdy pod pásmo zhoršení.

studio-trust-the-receiver-s-own-flag = Vlastní příznak přijímače

studio-trust-what-the-receiver-itself-says = Co o spoofingu a rušení říká samotný přijímač (u-blox UBX-NAV-STATUS a UBX-SEC-SIG), vedle monitorů Kshana. Kódy jsou kódy přijímače; žádný z detektorů není základní pravda a shoda není validace. Příznak nemění žádné skóre.

studio-trust-over-the-run = V průběhu běhu

studio-trust-what-the-score-used = Co skóre použilo

studio-trust-read-from-the-run-read = Načteno z běhu, pouze pro čtení.

studio-trust-what-this-view-does-and = Co tento pohled ukazuje a co ne

studio-trust-nmea-only-checks-cannot-see = Kontroly založené jen na NMEA nevidí spoofer, který reprodukuje celou konstelaci se vzájemně konzistentní polohou, rychlostí, kursem, výkonem a hodinami, ani přehrání zaznamenaných skutečných signálů. Fix bez poplachu proto není dobrý fix.

studio-trust-nothing-on-this-page-is = Nic na této stránce není měřítkem toho, jak kontroly fungují při skutečné interferenci. Mapování skóre a každá váha jsou pevně stanoveny před hodnocením logu, bez učení a bez čehokoli přizpůsobeného událostem.

studio-main-which-satellites-can-you-see = Které družice vidíte z daného místa a jak dobrá je jejich geometrie? Skyplot, skyline a DOP z enginu ve vašem prohlížeči

studio-main-trainer-debrief-for-kshana-nmea = Rozbor pro trenéra k logům instruktora kshana nmea-scenario (pouze pro trénink; soubory zůstávají ve vašem prohlížeči)

studio-main-where-did-aircraft-and-ships = Kde letadla a lodě v minulém dni hlásily zhoršená navigační data? Otevřete denní soubory map (zůstávají ve vašem prohlížeči)

studio-main-can-the-bridge-trust-this = Může můstek tomuto fixu důvěřovat? Otevřete běh důvěry v přijímač plavidla (soubory zůstávají ve vašem prohlížeči)

studio-main-evidence-packs-test-bench-export = Balíčky důkazů, export pro testovací bench, mapování compliance, OSNMA, nástroje příkazového řádku a asistent s umělou inteligencí (soubory zůstávají ve vašem prohlížeči)

studio-main-map-of-satellites-in-view = Mapa družic v dohledu nad Zemí ze zaznamenaného běhu

studio-main-interactive-3-d-view-of = Interaktivní 3D pohled na propagovanou trasu

studio-main-close-history = Zavřít historii

studio-main-skip-to-the-content = Přejít na obsah

studio-main-receiver-trust = Důvěra v přijímač

studio-main-advanced-view = Pokročilý pohled

studio-main-what-would-you-like-to = Co byste chtěli zjistit?

studio-main-pick-a-question-or-start = Vyberte otázku nebo začněte od výsledku níže.

studio-main-showing-below = Zobrazeno níže

studio-main-integrity-over-12-hours = Integrita během 12 hodin

studio-main-a-radio-waterfall = Rádiový waterfall

studio-main-recorded-result = Zaznamenaný výsledek

studio-main-how-many-navigation-satellites-can = Kolik navigačních družic vidíte odkudkoli na Zemi?

studio-main-loading-the-recorded-result = Načítá se zaznamenaný výsledek…

studio-main-everything-kshana-can-do = Vše, co Kshana umí

studio-main-each-area-shows-a-real = Každá oblast ukazuje skutečný zaznamenaný výsledek a směs důkazů, která za ním stojí.

studio-main-open-your-own-files = Otevřít vlastní soubory

studio-main-pages-that-run-the-engine = Stránky, které spouštějí engine s vašimi vlastními nastaveními a soubory. Každá funguje v tomto prohlížeči; nic se nenahrává.

studio-main-which-satellites-can-you-see-2 = Které družice vidíte z daného místa a jak dobrá je jejich geometrie? Nakreslete skyline.

studio-main-what-accuracy-could-a-reference = Jakou přesnost by mohla poskytnout referenční stanice poblíž lunárního jižního pólu a kde? MODELLED.

studio-main-can-the-bridge-trust-this-2 = Může můstek tomuto fixu důvěřovat? Ohodnoťte log NMEA plavidla.

studio-main-where-aircraft-and-ships-reported = Kde letadla a lodě hlásily zhoršená navigační data a jaká je expozice trasy.

studio-main-generate-a-drift-or-jamming = Vygenerujte proud pro cvičení s driftem nebo rušením a rozeberte log instruktora.

studio-main-two-synthetic-runs-on-one = Dva syntetické běhy na jedněch hodinách: trasa, skóre důvěryhodnosti, živý skyplot a verdikt.

studio-main-the-two-optical-atmosphere-scenarios = Dva scénáře optické atmosféry: dostupnost vůči výšce oblačnosti, výpadky a diverzita lokalit.

studio-main-which-navigation-signals-a-spacecraft = Které navigační signály může kosmická loď daleko nad družicemi stále využít a jak dobře si s nimi vedou palubní filtr a formace.

studio-main-what-lunar-orbiters-and-a = Co mohou lunární orbitery a povrchová stanice poskytnout jako navigační a geodetická infrastruktura, s uvedenými nedostatky.

studio-main-open-a-day-s-observatory = Otevřete soubory observatoře za jeden den a čtěte je: tři stavy, žádná příčina, nic se nenahrává.

studio-main-pull-the-antenna-score-the = Vytáhněte anténu, ohodnoťte holdover: záznam časové chyby měřený proti maskám ITU-T.

studio-main-check-a-signed-pack-or = Zkontrolujte podepsaný balíček nebo připojte časové razítko.

studio-main-motion-and-event-files-for = Soubory pohybu a událostí pro laboratorní simulátor.

studio-main-what-your-runs-evidence-against = Co vaše běhy dokládají proti zveřejněným rámcům.

studio-main-whether-recorded-galileo-data-is = Zda jsou zaznamenaná data Galileo autentizována, značku po značce.

studio-main-use-kshana-from-your-assistant = Používejte Kshana ze svého asistenta přes server MCP.

studio-main-all-scenarios = Všechny scénáře

studio-main-pick-one-it-opens-on = Vyberte jeden: hned se otevře na svém výsledku.

studio-main-all-questions = Všechny otázky

studio-main-every-published-figure = Každá zveřejněná hodnota

studio-main-read-from-the-result-document = Načteno z dokumentu výsledku s jednotkou, poznámkou a původem, které engine zaznamenává pro každou z nich.

studio-main-kalman-self-consistency = Vnitřní konzistence Kalmanova filtru

studio-main-a-consistent-filter-s-reported = Hlášená nejistota konzistentního filtru odpovídá jeho skutečným chybám. NIS (normalizovaný kvadrát inovace) by měl být blízko 1 a NEES (normalizovaný kvadrát chyby odhadu) blízko 2, každý uvnitř svého 95% pásma χ².

studio-main-engine-chart = Graf enginu

studio-main-each-series-this-run-publishes = Každá řada, kterou tento běh publikuje, proti času. Najetím nebo tažením přes graf přečtete hodnoty.

studio-main-carrier-to-noise-density-db = poměr nosné k hustotě šumu, dB-Hz

studio-main-with-the-jammer = S rušičkou

studio-main-without-it = Bez ní

studio-main-each-cell-is-one-satellite = Každá buňka je jedna družice v jedné epoše tohoto běhu. Šrafované buňky jsou pod prahem sledování přijímače: ta družice je ztracena.

studio-main-interference-outcome = Výsledek interference

studio-main-error-since-gnss-was-lost = chyba od ztráty GNSS

studio-main-scenario-budget = Rozpočet scénáře

studio-main-move-the-budget-and-the = Posuňte rozpočet a čas do překročení se přečte ze záznamu chyby tohoto běhu. Hodnota holdover z enginu, vypočtená při rozpočtu scénáře, je zobrazena vedle a je rozhodující. Chcete-li znovu spustit fyziku, změňte v parametrech hodiny nebo výpadek.

studio-main-maximum-time-interval-error = maximální chyba časového intervalu

studio-main-time-deviation = časová odchylka

studio-main-mask-checks-and-holdover-budgets = Kontroly masek a rozpočty holdover

studio-main-each-check-s-limit-is = Limit každé kontroly je vykreslen jako kroužek při době průměrování, kde byla rezerva nejhorší. Masky jsou přepsány z doporučení ITU-T (Mezinárodní telekomunikační unie, sektor telekomunikační standardizace) uvedených v každém řádku.

studio-main-lower-is-better-fractional-frequency = Nižší je lepší. Stabilita relativní frekvence proti době průměrování τ, v logaritmických osách.

studio-main-earth-centred-inertial-frame = Zemský inerciální systém

studio-main-drag-to-rotate-scroll-to = Tažením otáčejte, rolováním zvětšujte.

studio-main-run-the-engine-once-per = Spusťte engine jednou pro každou hodnotu a vykreslete jeden ukazatel kvality. Přidejte druhý parametr pro teplotní mapu. Každý bod je skutečný běh enginu, nejvýše 60.

studio-main-pinned-runs-side-by-side = připnuté běhy vedle sebe

studio-main-clear-pins = Zrušit připnutí

studio-main-key-figures-run-against-run = Klíčové hodnoty, běh proti běhu

studio-main-the-headline-readouts-of-each = Hlavní údaje každého připnutého běhu; změna je vůči běhu A.

studio-main-the-engine-s-own-export = vlastní export enginu

studio-main-written-by-the-engine = zapsáno enginem

studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, efemeridy STK, SigMF

studio-main-try-other-settings = Vyzkoušet jiná nastavení

studio-main-change-a-value-then-run = Změňte hodnotu a spusťte znovu. Odpověď a graf se aktualizují na místě.

studio-main-run-again = Spustit znovu

studio-main-cancel-the-run = Zrušit běh

studio-main-runs-in-your-browser-nothing = Běží ve vašem prohlížeči. Nic se nenahrává.

studio-main-advanced-settings = Pokročilá nastavení

studio-main-every-setting-comes-from-the = Každé nastavení pochází ze souboru scénáře. Celý soubor upravíte v části „Pro výzkumníky“.

studio-main-how-this-is-computed = Jak se to počítá

studio-main-level-of-evidence = Úroveň důkazů

studio-main-the-engine-s-own-one = Vlastní jednořádkové shrnutí enginu

studio-main-every-figure-is-labelled-with = Každá hodnota je označena svou úrovní důkazů. Validované znamená ověřené proti nezávislé vnější referenci; modelované znamená fyziku z prvních principů s testy, dosud neověřenou proti referenci.

studio-main-for-researchers = Pro výzkumníky

studio-main-code-data-citation = kód, data, citace

studio-main-run-it-on-your-computer = Spustit na vašem počítači

studio-main-run-it-from-python = Spustit z Pythonu

studio-main-exported-figures-carry-this-doi = Exportované obrázky nesou toto DOI (digitální identifikátor objektu) v popisku. Stejný scénář, seed a verze enginu dávají stejná čísla.

studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

studio-main-in-the-editor-tab-indents = V editoru Tab odsazuje o dvě mezery. Stiskněte Escape a poté Tab a pokračujte dál. Spusťte znovu, aby se použila vaše úprava.

studio-main-every-panel-and-field = Každý panel a pole

studio-main-the-advanced-view-is-the = Pokročilý pohled je úplný panel: každý panel tohoto běhu vedle sebe, každé pole scénáře, průchody, srovnání a vlastní zpráva enginu. Otevře se na tomto scénáři s vašimi nastaveními.

studio-main-kshana-pro = Kshana Pro

studio-main-kshana-studio = Kshana Studio

studio-main-request-an-evaluation = Požádat o hodnocení

studio-main-talk-to-us-about-a = Promluvte si s námi o komerční licenci

studio-main-request-a-study = Požádat o studii

studio-main-imagery-nasa-visible-earth-blue = Snímky: NASA Visible Earth (Blue Marble). Pobřeží: Natural Earth. Každý zdejší graf je vykreslen z běhu enginu; běh, zpráva, animace nebo export vytvořený nativním enginem z příkazového řádku je označen jako zaznamenaný.

studio-main-this-session = tato relace

studio-main-runs-you-make-appear-here = Běhy, které spustíte, se objeví zde. Vyberte jeden, abyste obnovili jeho scénář a výsledek, nebo jej připněte k porovnání.

studio-advanced-find-a-scenario-a-domain = Najít scénář, oblast, pole nebo příkaz

studio-advanced-the-runs-you-made-in = Běhy, které jste v této relaci spustili

studio-advanced-a-short-tour-of-the = Krátká prohlídka Studia

studio-advanced-toggle-colour-theme = Přepnout barevné téma

studio-advanced-switch-to-the-simple-view = Přepnout na jednoduchý pohled

studio-advanced-the-simple-view-the-answer = Jednoduchý pohled: nejdřív odpověď, pět nastavení, podrobnosti na vyžádání

studio-advanced-scenario-library = Knihovna scénářů

studio-advanced-close-the-library = Zavřít knihovnu

studio-advanced-find-a-scenario-a-domain-2 = Najít scénář, oblast nebo pole

studio-advanced-scenario-domain-or-field = Scénář, oblast nebo pole

studio-advanced-filter-by-domain = Filtrovat podle oblasti

studio-advanced-scenarios-by-mission-domain = Scénáře podle oblasti mise

studio-advanced-how-the-studio-works = Jak Studio funguje

studio-advanced-search-scenarios-domains-or-fields = Hledat scénáře, oblasti nebo pole

studio-advanced-search-scenarios-domains-or-fields-2 = Hledat scénáře, oblasti nebo pole, například elevační maska

studio-advanced-the-engine-kind-this-scenario = Druh enginu, který tento scénář spouští

studio-advanced-open-the-scenario-library = Otevřít knihovnu scénářů

studio-advanced-show-the-parameters-and-the = Zobrazit parametry a zdroj scénáře

studio-advanced-keep-this-run-to-compare = Ponechat tento běh k porovnání s jiným (nejvýše 4)

studio-advanced-compare-the-pinned-runs = Porovnat připnuté běhy

studio-advanced-share-this-run-or-download = Sdílet tento běh nebo jej stáhnout

studio-advanced-result-panels = Panely výsledku

studio-advanced-run-summary = Shrnutí běhu

studio-advanced-parameters-and-scenario-source = Parametry a zdroj scénáře

studio-advanced-close-the-parameters-and-show = Zavřít parametry a zobrazit výsledky

studio-advanced-find-a-field-of-this = Najít pole tohoto scénáře

studio-advanced-find-a-field-for-example = Najít pole, například maska

studio-advanced-parameter-view = Pohled na parametry

studio-advanced-find-a-scenario-domain-field = Najít scénář, oblast, pole, panel nebo příkaz

studio-advanced-skip-to-results = Přejít na výsledky

studio-advanced-find-anything = Najít cokoli

studio-advanced-lunar-station-coverage-of-a = Lunární stanice: pokrytí referenční stanice (MODELLED)

studio-advanced-simple-view = Jednoduchý pohled

studio-advanced-choose-a-scenario = Vyberte scénář

studio-advanced-what-do-you-want-to = Co chcete dělat?

studio-advanced-pick-a-domain-and-a = Vyberte oblast a scénář, nastavte jej, spusťte engine ve svém prohlížeči a poté výsledky čtěte, porovnávejte a exportujte. Nic se nenahrává.

studio-advanced-share-or-export = Sdílet nebo exportovat

studio-advanced-good-first-runs = Dobré první běhy

studio-advanced-pin-run = Připnout běh

studio-advanced-report-json-scenario-tables-and = zpráva, JSON, scénář, tabulky a exporty

studio-advanced-the-exact-scenario-in-the = přesný scénář v odkazu

studio-advanced-an-iframe-for-a-course = iframe pro stránku kurzu nebo wiki

studio-advanced-opens-in-a-new-tab = otevře se na nové kartě

studio-advanced-loading-the-engine-the-recorded = Načítá se engine. Nejdřív se zobrazí zaznamenaný výsledek tohoto scénáře.

studio-advanced-got-it = Rozumím

studio-advanced-headline-numbers-from-the-engine = Hlavní čísla z výsledku enginu, se změnou oproti vašemu předchozímu běhu tohoto scénáře a se splněním nebo nesplněním (pass or fail), kde běh uvádí práh.

studio-advanced-set-parameters = Nastavit parametry

studio-advanced-every-change-re-runs-the = Každá změna znovu spustí engine a aktualizuje klíčové hodnoty a panely.

studio-advanced-drag-a-slider-and-the = Přetáhněte posuvník a scénář se znovu spustí. Každý ovládací prvek zapisuje přímo do textu scénáře níže.

studio-advanced-in-the-editor-tab-indents = V editoru Tab odsazuje o dvě mezery. Stiskněte Escape a poté Tab a pokračujte dál.

studio-mission-thread-time-axis = Časová osa

studio-mission-thread-mission-thread = Vlákno mise

studio-mission-thread-where-does-a-mission-s = Kde se vyčerpá rozpočet chyby navigace a časování mise?

studio-mission-thread-a-mission-is-a-chain = Mise je řetězec fází: start, setkání, přechod k Měsíci, přistání, návrat. Každá fáze má své vlastní senzory a svůj vlastní rozpočet chyby a každá předává svou nejistotu té další. Tato stránka ukazuje rozpočet celého řetězce, fázi po fázi, a pojmenovává nejslabší článek.

studio-mission-thread-open-the-artemis-class-example = Otevřít příklad třídy Artemis

studio-mission-thread-open-a-result-file = Otevřít soubor výsledku…

studio-mission-thread-the-thread = Vlákno

studio-mission-thread-error-against-mission-elapsed-time = Chyba oproti uplynulému času mise

studio-mission-thread-the-phases = Fáze

studio-mission-thread-the-budget-of-one-phase = Rozpočet jedné fáze
