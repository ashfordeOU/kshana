# Interface text (Ukrainian): site chrome, notices, language switcher, Studio shell.

## Site chrome
site-skip-link = Перейти до вмісту
site-nav-primary = Основна
site-nav-missions = Місії
site-nav-capabilities = Можливості
site-nav-evidence = Докази
site-nav-research = Дослідження
site-nav-developers = Розробникам
site-nav-docs = Документація
site-nav-editions = Видання
site-nav-search = Пошук
site-nav-launch = Запустити
site-nav-studio = { -brand } Studio
site-nav-home = Головна сторінка { -brand }
site-nav-theme = Перемкнути між світлою та темною темою
site-version = v{ $version }

site-footer-tagline = Симулятор стійкості PNT (позиціонування, навігація та час) з відкритим кодом. Він не керує жодним радіообладнанням і нічого не передає: його вихідні дані на рівні сигналу — це файли відліків IQ у базовій смузі, а програмний приймач ГНСС (GNSS) є інструментом аналізу. Це не льотний виріб.
site-footer-product = Продукт
site-footer-company = Компанія
site-footer-benchmark = Бенчмарк
site-footer-install = Встановлення
site-footer-mcp = Сервер MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · від Ashforde® OÜ · AGPL-3.0, з можливістю комерційної ліцензії
site-footer-provenance = Кожна діаграма побудована за записаним прогоном рушія v{ $version } і вказує свій сценарій, зерно (seed) та спосіб відтворення.

## Language switcher
site-lang-label = Мова
site-lang-switch-aria = Оберіть мову цієї сторінки
site-lang-auto = Мова браузера
site-lang-remembered = Ваш вибір запам'ятовується на цьому пристрої.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } частина цієї сторінки змінилася після перекладу і показана англійською.
        [few] { $n } частини цієї сторінки змінилися після перекладу і показані англійською.
        [many] { $n } частин цієї сторінки змінилося після перекладу і показано англійською.
       *[other] { $n } частини цієї сторінки змінилося після перекладу і показано англійською.
    }
notice-not-started = Цю сторінку ще не перекладено. Її показано англійською.
notice-detected = Показано мовою: { $language }. <a1>Перемкнути на англійську</a1>
notice-dismiss = Закрити
notice-recorded-in-english = Записано англійською
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Головна сторінка { -brand }
studio-search-label = Знайти сценарій, область, параметр або команду
studio-search-placeholder = Шукайте за назвою, запитанням або параметром, наприклад маска висоти
studio-search-scenarios = Пошук сценаріїв, областей або параметрів
studio-search-commands = Пошук сценаріїв і команд
studio-search-all = Знайти сценарій, область, параметр, подання або команду
studio-search = Пошук
studio-theme = Перемкнути між світлою та темною темою
studio-starting-questions = Запитання для початку
studio-where-you-are = Де ви перебуваєте
studio-engine-status = Де працює рушій
studio-views = Подання: Геометрія, Довіра до приймача, Карта завад, Розбір навчання, Інструменти
studio-more-views = Інші подання
studio-advanced-full = Повна панель: усі панелі, поля та вкладки
studio-advanced-switch = Перемкнути на розширене подання
studio-view-geometry = Геометрія: скайплот, скайлайн і DOP
studio-view-training = Розбір навчання: відкрити журнал інструктора
studio-view-interference = Карта завад: відкрити файли карт
studio-view-receiver-trust = Довіра до приймача: відкрити прогін судна
studio-view-tools = Інструменти: докази, bench, compliance, OSNMA
studio-result = Результат
studio-result-meaning = Що означає результат
studio-key-figures = Ключові показники
studio-result-views = Подання цього результату
studio-figures-of-merit = Показники якості
studio-find-result-field = Знайти поле результату
studio-capability-view = Подання можливостей
studio-time-series = Часовий ряд
studio-chart-source = Джерело діаграми
studio-signal-band = Сигнал і смуга
studio-signal-field = Поле сигналу
studio-clock-holdover = Holdover годинника
studio-telecom-masks = Маски телекомунікаційної синхронізації
studio-clock-stability = Стабільність годинника
studio-orbit-3d = 3D-орбіта
studio-ground-track = Траса на поверхні
studio-parameter-sweep = Перебір параметра
studio-compare-runs = Порівняти прогони
studio-animation = Анімація
studio-engine-report = Звіт рушія
studio-exports = Експорт і звіт
studio-full-result = Повний документ результату
studio-settings = Параметри та подробиці
studio-find-setting = Знайти параметр, наприклад маска
studio-find-scenario-setting = Знайти параметр цього сценарію
studio-engine-summary = Власний підсумок рушія
studio-restore-scenario = Відновити вбудований сценарій
studio-copy-scenario = Скопіювати текст сценарію
studio-scenario-source = Джерело сценарію (TOML)
studio-install-engine = Встановити рушій
studio-run-history = Історія прогонів
studio-scenarios-count =
    { $n ->
        [one] Сценарій, який він запускає ({ $n })
        [few] Сценарії, які він запускає ({ $n })
        [many] Сценарії, які він запускає ({ $n })
       *[other] Сценарії, які він запускає ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } рядок реєстру
        [few] { $n } рядки реєстру
        [many] { $n } рядків реєстру
       *[other] { $n } рядка реєстру
    }
studio-recorded-in-english = Записано англійською
studio-lang-engine-fallback = Не вдалося завантажити текст рушія для цієї мови; показано англійську.
