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
