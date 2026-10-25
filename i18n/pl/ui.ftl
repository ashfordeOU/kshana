# Interface text (Polish): site chrome, notices, language switcher, Studio shell.

## Site chrome
site-skip-link = Przejdź do treści
site-nav-primary = Główna
site-nav-missions = Misje
site-nav-capabilities = Możliwości
site-nav-evidence = Dowody
site-nav-research = Badania
site-nav-developers = Dla programistów
site-nav-docs = Dokumentacja
site-nav-editions = Wydania
site-nav-search = Szukaj
site-nav-launch = Uruchom
site-nav-studio = { -brand } Studio
site-nav-home = Strona główna { -brand }
site-nav-theme = Przełącz między jasnym a ciemnym motywem
site-version = v{ $version }

site-footer-tagline = Otwartoźródłowy symulator odporności PNT (pozycjonowanie, nawigacja i czas). Nie steruje żadnym sprzętem radiowym i niczego nie nadaje: jego wynikiem na poziomie sygnału są pliki próbek IQ w paśmie podstawowym, a programowy odbiornik GNSS jest narzędziem analitycznym. To nie jest produkt lotniczy.
site-footer-product = Produkt
site-footer-company = Firma
site-footer-benchmark = Benchmark
site-footer-install = Instalacja
site-footer-mcp = Serwer MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · Ashforde® OÜ · AGPL-3.0, z możliwością licencji komercyjnej
site-footer-provenance = Każdy wykres pochodzi z zarejestrowanego przebiegu silnika w wersji v{ $version } i podaje swój scenariusz, ziarno (seed) oraz sposób jego odtworzenia.

## Language switcher
site-lang-label = Język
site-lang-switch-aria = Wybierz język tej strony
site-lang-auto = Język przeglądarki
site-lang-remembered = Twój wybór jest zapamiętany na tym urządzeniu.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } część tej strony zmieniła się od czasu tłumaczenia i jest wyświetlana po angielsku.
        [few] { $n } części tej strony zmieniły się od czasu tłumaczenia i są wyświetlane po angielsku.
        [many] { $n } części tej strony zmieniło się od czasu tłumaczenia i jest wyświetlanych po angielsku.
       *[other] { $n } części tej strony zmieniło się od czasu tłumaczenia i jest wyświetlanych po angielsku.
    }
notice-not-started = Ta strona nie została jeszcze przetłumaczona. Jest wyświetlana po angielsku.
notice-detected = Wyświetlany język: { $language }. <a1>Przełącz na angielski</a1>
notice-dismiss = Zamknij
notice-recorded-in-english = Zapisano po angielsku
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Strona główna { -brand }
studio-search-label = Znajdź scenariusz, obszar, ustawienie lub polecenie
studio-search-placeholder = Szukaj według nazwy, pytania lub ustawienia, na przykład maska elewacji
studio-search-scenarios = Szukaj scenariuszy, obszarów lub ustawień
studio-search-commands = Szukaj scenariuszy i poleceń
studio-search-all = Znajdź scenariusz, obszar, ustawienie, widok lub polecenie
studio-search = Szukaj
studio-theme = Przełącz między jasnym a ciemnym motywem
studio-starting-questions = Pytania na początek
studio-where-you-are = Gdzie się znajdujesz
studio-engine-status = Gdzie działa silnik
studio-views = Widoki: Geometria, Zaufanie do odbiornika, Mapa zakłóceń, Omówienie szkolenia, Narzędzia
studio-more-views = Więcej widoków
studio-advanced-full = Pełny panel: wszystkie panele, pola i karty
studio-advanced-switch = Przełącz na widok zaawansowany
studio-view-geometry = Geometria: skyplot, skyline i DOP
studio-view-training = Omówienie szkolenia: otwórz dziennik instruktora
studio-view-interference = Mapa zakłóceń: otwórz pliki map
studio-view-receiver-trust = Zaufanie do odbiornika: otwórz przebieg statku
studio-view-tools = Narzędzia: dowody, bench, compliance, OSNMA
studio-result = Wynik
studio-result-meaning = Co oznacza wynik
studio-key-figures = Kluczowe wartości
studio-result-views = Widoki tego wyniku
studio-figures-of-merit = Wskaźniki jakości
studio-find-result-field = Znajdź pole wyniku
studio-capability-view = Widok możliwości
studio-time-series = Szereg czasowy
studio-chart-source = Źródło wykresu
studio-signal-band = Sygnał i pasmo
studio-signal-field = Pole sygnału
studio-clock-holdover = Holdover zegara
studio-telecom-masks = Maski synchronizacji telekomunikacyjnej
studio-clock-stability = Stabilność zegara
studio-orbit-3d = Orbita 3D
studio-ground-track = Ślad na powierzchni
studio-parameter-sweep = Przegląd parametru
studio-compare-runs = Porównaj przebiegi
studio-animation = Animacja
studio-engine-report = Raport silnika
studio-exports = Eksporty i raport
studio-full-result = Pełny dokument wyniku
studio-settings = Ustawienia i szczegóły
studio-find-setting = Znajdź ustawienie, na przykład maska
studio-find-scenario-setting = Znajdź ustawienie tego scenariusza
studio-engine-summary = Podsumowanie samego silnika
studio-restore-scenario = Przywróć dołączony scenariusz
studio-copy-scenario = Skopiuj tekst scenariusza
studio-scenario-source = Źródło scenariusza (TOML)
studio-install-engine = Zainstaluj silnik
studio-run-history = Historia przebiegów
studio-scenarios-count =
    { $n ->
        [one] Uruchamiany scenariusz ({ $n })
        [few] Uruchamiane scenariusze ({ $n })
        [many] Uruchamiane scenariusze ({ $n })
       *[other] Uruchamiane scenariusze ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } wiersz rejestru
        [few] { $n } wiersze rejestru
        [many] { $n } wierszy rejestru
       *[other] { $n } wiersza rejestru
    }
studio-recorded-in-english = Zapisano po angielsku
studio-lang-engine-fallback = Nie udało się wczytać tekstu silnika dla tego języka; wyświetlany jest angielski.
