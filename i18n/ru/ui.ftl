# Interface text (Russian): site chrome, notices, language switcher, Studio shell.

## Site chrome
site-skip-link = Перейти к содержимому
site-nav-primary = Основная
site-nav-missions = Миссии
site-nav-capabilities = Возможности
site-nav-evidence = Доказательства
site-nav-research = Исследования
site-nav-developers = Разработчикам
site-nav-docs = Документация
site-nav-editions = Редакции
site-nav-search = Поиск
site-nav-launch = Запустить
site-nav-studio = { -brand } Studio
site-nav-home = Главная страница { -brand }
site-nav-theme = Переключить между светлой и тёмной темой
site-version = v{ $version }

site-footer-tagline = Симулятор устойчивости PNT (позиционирование, навигация и время) с открытым исходным кодом. Он не управляет никаким радиооборудованием и ничего не передаёт: его выходные данные на уровне сигнала — это файлы отсчётов IQ в основной полосе, а программный приёмник ГНСС (GNSS) является инструментом анализа. Это не лётное изделие.
site-footer-product = Продукт
site-footer-company = Компания
site-footer-benchmark = Бенчмарк
site-footer-install = Установка
site-footer-mcp = Сервер MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · от Ashforde® OÜ · AGPL-3.0, с возможностью коммерческой лицензии
site-footer-provenance = Каждый график построен по записанному прогону движка v{ $version } и указывает свой сценарий, начальное значение (seed) и способ воспроизведения.

## Language switcher
site-lang-label = Язык
site-lang-switch-aria = Выберите язык этой страницы
site-lang-auto = Язык браузера
site-lang-remembered = Ваш выбор запоминается на этом устройстве.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } часть этой страницы изменилась после перевода и показана на английском.
        [few] { $n } части этой страницы изменились после перевода и показаны на английском.
        [many] { $n } частей этой страницы изменилось после перевода и показано на английском.
       *[other] { $n } части этой страницы изменилось после перевода и показано на английском.
    }
notice-not-started = Эта страница ещё не переведена. Она показана на английском.
notice-detected = Показан язык: { $language }. <a1>Переключить на английский</a1>
notice-dismiss = Закрыть
notice-recorded-in-english = Записано на английском
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Главная страница { -brand }
studio-search-label = Найти сценарий, область, параметр или команду
studio-search-placeholder = Ищите по названию, вопросу или параметру, например маска возвышения
studio-search-scenarios = Поиск сценариев, областей или параметров
studio-search-commands = Поиск сценариев и команд
studio-search-all = Найти сценарий, область, параметр, представление или команду
studio-search = Поиск
studio-theme = Переключить между светлой и тёмной темой
studio-starting-questions = Вопросы для начала
studio-where-you-are = Где вы находитесь
studio-engine-status = Где работает движок
studio-views = Представления: Геометрия, Доверие к приёмнику, Карта помех, Разбор тренировки, Инструменты
studio-more-views = Другие представления
studio-advanced-full = Полная панель: все панели, поля и вкладки
studio-advanced-switch = Переключить на расширенное представление
studio-view-geometry = Геометрия: скайплот, скайлайн и DOP
studio-view-training = Разбор тренировки: открыть журнал инструктора
studio-view-interference = Карта помех: открыть файлы карт
studio-view-receiver-trust = Доверие к приёмнику: открыть прогон судна
studio-view-tools = Инструменты: доказательства, bench, compliance, OSNMA
studio-result = Результат
studio-result-meaning = Что означает результат
studio-key-figures = Ключевые показатели
studio-result-views = Представления этого результата
studio-figures-of-merit = Показатели качества
studio-find-result-field = Найти поле результата
studio-capability-view = Представление возможностей
studio-time-series = Временной ряд
studio-chart-source = Источник графика
studio-signal-band = Сигнал и полоса
studio-signal-field = Поле сигнала
studio-clock-holdover = Holdover часов
studio-telecom-masks = Маски телекоммуникационной синхронизации
studio-clock-stability = Стабильность часов
studio-orbit-3d = 3D-орбита
studio-ground-track = Трасса на поверхности
studio-parameter-sweep = Перебор параметра
studio-compare-runs = Сравнить прогоны
studio-animation = Анимация
studio-engine-report = Отчёт движка
studio-exports = Экспорт и отчёт
studio-full-result = Полный документ результата
studio-settings = Параметры и подробности
studio-find-setting = Найти параметр, например маска
studio-find-scenario-setting = Найти параметр этого сценария
studio-engine-summary = Собственная сводка движка
studio-restore-scenario = Восстановить встроенный сценарий
studio-copy-scenario = Скопировать текст сценария
studio-scenario-source = Источник сценария (TOML)
studio-install-engine = Установить движок
studio-run-history = История прогонов
studio-scenarios-count =
    { $n ->
        [one] Сценарий, который он запускает ({ $n })
        [few] Сценарии, которые он запускает ({ $n })
        [many] Сценарии, которые он запускает ({ $n })
       *[other] Сценарии, которые он запускает ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } строка реестра
        [few] { $n } строки реестра
        [many] { $n } строк реестра
       *[other] { $n } строки реестра
    }
studio-recorded-in-english = Записано на английском
studio-lang-engine-fallback = Не удалось загрузить текст движка для этого языка; показан английский.
