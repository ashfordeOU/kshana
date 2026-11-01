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

studio-geometry-kshana-home = Головна сторінка Kshana

studio-geometry-back-to-the-studio = Назад до Studio

studio-geometry-step-the-time = Зсунути час

studio-geometry-draw-the-skyline = Намалювати скайлайн

studio-geometry-skip-to-the-view = Перейти до подання

studio-geometry-which-satellites-can-you-see = Які супутники видно і наскільки добра їхня геометрія?

studio-geometry-what-this-shows = Що це показує

studio-geometry-starting-the-engine = Запуск рушія…

studio-geometry-every-setting-is-in-the = Кожен параметр міститься в адресі сторінки, тому скопійоване посилання відкриває те саме небо.

studio-geometry-offset-from-the-constellations-reference = Зсув відносно опорної епохи орбітальних угруповань

studio-geometry-10-min = −10 хв

studio-geometry-10-min-2 = +10 хв

studio-geometry-your-own-orbital-elements-tle = Власні орбітальні елементи (TLE)

studio-geometry-use-these-elements = Використати ці елементи

studio-geometry-back-to-the-presets = Назад до наборів

studio-geometry-clear-the-skyline = Очистити скайлайн

studio-geometry-drag-on-the-skyplot-to = Проведіть по скайплоту, щоб намалювати скайлайн (кроки: 1° за азимутом, 0.5° за висотою). Коли скайплот у фокусі: Ліворуч і Праворуч переміщують уздовж горизонту (з Shift на 10°), Вгору і Вниз піднімають або опускають скайлайн у цьому місці (з Shift на 5°), Delete очищає його.

studio-geometry-copy-a-link-to-this = Скопіювати посилання на це небо

studio-geometry-download-the-skyplot-svg = Завантажити скайплот (SVG)

studio-geometry-zenith-in-the-centre-the = Зеніт у центрі, горизонт на краю, північ угорі. Заповнені позначки — це супутники в розв'язку; порожні позначки закриті маскою або скайлайном чи не використовуються.

studio-geometry-dilution-of-precision = Погіршення точності

studio-geometry-how-much-the-geometry-multiplies = У скільки разів геометрія збільшує похибку дальності. Менше — краще; близько 1 — відмінно, понад 6 — погано.

studio-geometry-horizontal-position-error = Горизонтальна похибка положення

studio-geometry-satellites-as-a-table = Супутники у вигляді таблиці

studio-geometry-the-same-satellites-as-the = Ті самі супутники, що й на скайплоті.

studio-geometry-azimuth = Азимут, °

studio-geometry-elevation = Висота, °

studio-geometry-in-the-solution = У розв'язку

studio-geometry-the-engine-runs-here-as = Рушій працює тут як WebAssembly. Нічого не завантажується з іншого сайту, і нічого з налаштованого вами нікуди не надсилається.

studio-holdover-holdover-test-scenarios = Сценарії тесту holdover

studio-holdover-holdover-test = Тест holdover

studio-holdover-how-far-does-the-time = Наскільки зростає похибка часу, коли GNSS зникає?

studio-holdover-opening-the-scenarios = Відкриття сценаріїв…

studio-holdover-verdict-step-by-step = Вердикт крок за кроком

studio-holdover-time-error-over-the-record = Похибка часу протягом запису

studio-holdover-the-three-phases-are-shaded = Три фази затінено; штрихові вертикальні лінії — це два моменти, указані оператором. Штрихові горизонтальні лінії — це межі масок для максимальної абсолютної похибки часу, кожна накреслена над кроком, який називає її маска, та смуга відновлення; трикутник позначає момент, коли бюджет або огинаюча holdover ePRTC-A вперше перевищується.

studio-holdover-of-the-baseline-and-the = Для базової лінії та holdover; хрестик — це межа маски в момент, коли її перевірка була найгіршою.

studio-holdover-the-same-two-steps-against = Ті самі два кроки порівняно з межами TDEV.

studio-holdover-the-numbers = Числа

studio-holdover-everything-below-is-the-engine = Усе нижче належить рушію, у зазначених ним одиницях.

studio-holdover-mask-checks = Перевірки масок

studio-holdover-each-mask-is-measured-on = Кожну маску вимірюють на кроці, який називає її умова. Маска, якій потрібен довший запис, ніж дав крок, є INCOMPLETE і ніколи не екстраполюється; кожен пункт, який Рекомендація залишає для подальшого вивчення, відсутній.

studio-holdover-what-this-does-not-cover = Чого це не охоплює

studio-interference-cell-size-in-degrees-empty = Розмір комірки в градусах (порожньо для 0.5)

studio-interference-https = https://…

studio-interference-about-this-page = Про цю сторінку

studio-interference-interference-map = Карта завад

studio-interference-where-did-position-reports-look = Де звіти про положення виглядали погіршеними?

studio-interference-open-map-files = Відкрити файли карт

studio-interference-or-drop-them-here = або перетягніть їх сюди

studio-interference-open-the-synthetic-demo = Відкрити синтетичну демонстрацію

studio-interference-close-all-maps = Закрити всі карти

studio-interference-nothing-open-yet = Поки що нічого не відкрито.

studio-interference-build-a-map-here = Побудувати карту тут

studio-interference-build-from-the-synthetic-sample = Побудувати із синтетичного зразка

studio-interference-route-exposure-here = Вплив на маршрут тут

studio-interference-use-the-synthetic-route = Використати синтетичний маршрут

studio-interference-reading-these-maps = Як читати ці карти

studio-interference-maps-inherit-the-coverage-of = Карти успадковують покриття свого джерела: приймачі ADS-B, що належать волонтерам, залишають відкрите море слабко покритим, а відкриті дані AIS не охоплюють деякі класи суден. Прочитайте примітки про покриття в кожному файлі.

studio-interference-no-coastline-or-basemap-is = Берегова лінія або основа карти не малюються, і нічого не завантажується з жодного сервера; сітка складається лише з широти й довготи.

studio-interference-no-identifier-of-any-aircraft = У цих файлах немає ідентифікатора жодного повітряного чи морського судна; комірки із замалою кількістю різних повітряних чи морських суден не публікуються взагалі, а кількість AIS, що дорівнює одному або двом, приховується.

studio-lunar-infra-lunar-infrastructure-scenarios = Сценарії місячної інфраструктури

studio-lunar-infra-lunar-infrastructure = Місячна інфраструктура

studio-lunar-infra-what-can-the-moon-s = Що орбіта й поверхня Місяця можуть дати як навігаційна та геодезична інфраструктура і де їх не вистачає?

studio-lunar-infra-five-studies-of-what-lunar = П'ять досліджень того, що місячні орбітальні апарати та місячна наземна станція могли б дати разом як навігаційна та геодезична інфраструктура: визначення орбіти за сигналами GNSS із Землі порівняно з наземним стеженням, фіксація фази несівної між наземною станцією та орбітальним апаратом, спільне оцінювання місячної системи відліку, прив'язка GNSS, VLBI і лазерної локації на одному космічному апараті та те, наскільки чутливі лазерна локація й стеження до припливів і лібрації Місяця. Вхідні дані ілюстративні, а модель обмежена; там, де дослідження не досягло порогу, відносно якого було попередньо зареєстровано, ця сторінка про це говорить. Кожне число скопійовано з результату, записаного рушієм; сторінка масштабує його й малює, а нічого іншого не обчислює.

studio-lunar-infra-what-the-result-holds = Що містить результат

studio-lunar-infra-findings-disclosures-and-what-was = Висновки, застереження і те, що не було перевірено

studio-lunar-what-these-figures-are = Що це за показники

studio-lunar-map-key = Легенда карти

studio-lunar-lunar-station = Місячна станція

studio-lunar-what-accuracy-could-a-reference = Яку точність могла б дати еталонна станція поблизу південного полюса Місяця і де?

studio-lunar-the-constellation-its-signal-in = Орбітальне угруповання, його похибка сигналу в космосі, похибка зйомки станції, затримка поправок і квантування лінії зв'язку — це вхідні дані, указані у файлі сценарію, кожне з джерелом або позначене як ілюстративне. Жоден показник тут не було перевірено за реальною станцією чи польотними даними.

studio-lunar-the-source-and-every-input = Джерело та кожні змінені вами вхідні дані містяться в адресі сторінки, тому скопійоване посилання відкриває те саме дослідження.

studio-lunar-a-result-file-is-the = Файл результату — це JSON, який рушій записує для цього виду (JSON-вивід командного рядка або прогін, збережений звідси). Його читають на цій сторінці; нічого не надсилається.

studio-lunar-each-field-shows-the-scenario = Кожне поле показує значення з файлу сценарію, доки ви його не зміните. Доба епох на всій сітці обчислюється довго: менше випробувань або довший крок часу працюють швидше.

studio-lunar-run-it-here = Запустити тут

studio-lunar-back-to-the-file-s = Назад до значень із файлу

studio-lunar-copy-a-link = Скопіювати посилання

studio-lunar-save-this-result-json = Зберегти цей результат (JSON)

studio-lunar-corrected-error-over-the-south = Скоригована похибка в південній полярній області

studio-lunar-south-polar-stereographic-the-pole = Південна полярна стереографічна проєкція: полюс у центрі, край сітки на межі, довгота 0° угорі, 90° східної довготи праворуч. Кожна комірка — одна точка сітки; товста лінія — це місце, де скоригована похибка перетинає поріг, а штрихова лінія — радіус покриття за азимутом.

studio-lunar-region-figures = Показники області

studio-lunar-over-the-whole-grid-means = На всій сітці: середні, зважені за площею, і найгірша точка.

studio-lunar-coverage-radius-per-azimuth = Радіус покриття за азимутом

studio-lunar-along-each-bearing-from-the = Уздовж кожного напрямку від станції: відстань, на якій покриття вперше падає нижче 95 %.

studio-lunar-as-a-table = У вигляді таблиці

studio-lunar-radius-km = Радіус, км

studio-lunar-at-the-grid-edge = На краю сітки

studio-lunar-points-along-it = Точки вздовж нього

studio-lunar-an-epoch-is-unavailable-at = Епоха недоступна в точці, коли користувач бачить менше чотирьох супутників або станція не бачить кожного супутника, якого використовує користувач; для неї похибка не обчислюється.

studio-lunar-grid-points-as-a-table = Точки сітки у вигляді таблиці

studio-lunar-the-same-points-as-the = Ті самі точки, що й на карті, найближчі до станції — першими.

studio-lunar-latitude = Широта, °

studio-lunar-longitude = Довгота, °

studio-lunar-from-the-station-km = Від станції, км

studio-lunar-corrected-error = Скоригована похибка

studio-lunar-uncorrected-error = Нескоригована похибка

studio-lunar-hpl-median = Медіана HPL

studio-lunar-the-engine-s-statement-inputs = Заява рушія, вхідні дані та бюджет лінії зв'язку

studio-lunar-inputs-as-the-engine-read = Вхідні дані в тому вигляді, як їх прочитав рушій

studio-lunar-error-model = Модель похибки

studio-lunar-correction-link-budget-at-the = Бюджет лінії зв'язку поправок на станції та в найгіршій точці

studio-observatory-previous-day = Попередня доба

studio-observatory-day-opened = Відкрита доба

studio-observatory-next-day = Наступна доба

studio-observatory-interference-observatory = Обсерваторія завад

studio-observatory-what-did-one-day-s = Як виглядали звіти про положення за одну добу?

studio-observatory-the-observatory-writes-a-few = Обсерваторія записує кілька файлів для кожної доби UTC і області: комірки сітки з одним із трьох станів, список інцидентів і маніфест. Відкрийте тут створені вами файли та прочитайте їх. Сторінка нічого не обчислює і показує лише те, що кажуть файли. Вона не постачає жодних даних обсерваторії, нічого не завантажує й нічого не надсилає.

studio-observatory-open-a-day = Відкрити добу

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Три стани

studio-observatory-the-picture-the-observatory-wrote = Зображення, записане обсерваторією

studio-observatory-the-png-you-opened-as = Відкритий вами PNG як є. Комірки, які не намальовано, не спостерігалися.

studio-observatory-cells-drawn-from-the-file = Комірки, намальовані за файлом

studio-observatory-plate-carr-eacute-e-no = Рівнопроміжна циліндрична проєкція (plate carrée), без основи карти. Наведіть вказівник на комірку або скористайтеся таблицею, щоб побачити її стан і кількості. Місце без комірки не спостерігалося.

studio-observatory-hover-or-focus-a-cell = Наведіть вказівник на комірку або поставте на неї фокус, щоб побачити її стан.

studio-observatory-every-cell-in-the-file = Кожна комірка у файлі

studio-observatory-a-count-the-file-withholds = Кількість, яку файл приховує (менше ніж 5 повітряних суден), відображається як «приховано», ніколи як 0.

studio-observatory-files-and-their-hashes = Файли та їхні хеші

studio-observatory-dataset-licence-and-notice = Набір даних, ліцензія та повідомлення

studio-observatory-what-this-page-does-and = Що ця сторінка показує, а що ні

studio-observatory-products-are-released-at-least = Продукти публікуються щонайменше через 24 години після завершення доби UTC, на комірках 0.5 градуса або грубіших. Це ніколи не подання в реальному часі, і воно ніколи не каже «зараз».

studio-observatory-it-shows-no-cause-no = Вона не показує причини, країни, сили чи джерела завад, оповіщення, порівняння між місцями або добами, а також AIS. ADS-B і AIS ніколи не поєднуються.

studio-observatory-the-page-ships-none-of = Сторінка не постачає жодних продуктів обсерваторії. Їх публікація — рішення власника.

studio-optical-optical-atmosphere-scenarios = Сценарії оптичної атмосфери

studio-optical-optical-pnt = Оптичний PNT

studio-optical-can-an-optical-link-get = Чи може оптична лінія зв'язку пробитися крізь погоду?

studio-optical-the-link = Лінія зв'язку

studio-optical-sites-as-the-engine-states = Пункти так, як їх указує рушій

studio-optical-inputs-are-marked-everything-else = Вхідні дані позначено; усе інше — вихід рушія для них.

studio-optical-it-draws-only-what-the = Вона малює лише те, що рушій записав для кожного сценарію, зокрема його часовий ряд із зерном. Сторінка нічого не обчислює: вона масштабує числа рушія до діаграми.

studio-optical-the-sites-their-cloud-climates = Пункти, їхній хмарний клімат, класи годинників і методи — це вхідні дані, вибрані для ілюстрації, і так позначені. Жоден виміряний запис доступності не порівнювали.

studio-replay-replay-controls = Керування відтворенням

studio-replay-previous-moment-page-up = Попередній момент (Page Up)

studio-replay-step-back = Крок назад

studio-replay-step-back-left-arrow = Крок назад (стрілка вліво)

studio-replay-play-or-pause-space = Відтворити або призупинити (пробіл)

studio-replay-step-forward = Крок уперед

studio-replay-step-forward-right-arrow = Крок уперед (стрілка вправо)

studio-replay-next-moment-page-down = Наступний момент (Page Down)

studio-replay-replay-speed-mission-seconds-per = Швидкість відтворення, секунди місії за секунду

studio-replay-mission-clock-seconds-from-the = Годинник місії, секунди від початку кожного прогону

studio-replay-bridge-replay = Відтворення для містка

studio-replay-two-runs-one-clock-when = Два прогони, один годинник: коли місток дізнався?

studio-replay-put-two-synthetic-runs-side = Покладіть два синтетичні прогони поруч і відтворіть їх на одному годиннику місії. Кожна панель показує, де судно було насправді, а де за словами приймача, показник довіри рушія та його смугу в часі, супутники, які перелічує сам журнал (небо порожніє там, де журнал не чує жодного), і вердикт після завершення прогону. Усе намальоване походить із журналу або з результату рушія для нього; нічого не читається з мережі.

studio-replay-save-animated-svg = Зберегти анімований SVG

studio-replay-save-frames-zip = Зберегти кадри (ZIP)

studio-replay-opening-the-two-demo-runs = Відкриття двох демонстраційних прогонів…

studio-replay-the-skyplot-is-the-log = Скайплот — це власний GSV журналу: заповнена позначка — супутник із рівнем сигналу, порожня — перелічений без нього, а затінений сектор — діапазон азимута, де журнал перелічує супутники й не чує жодного з них. Закрите небо та заглушений сигнал тут виглядають однаково. Це не скайлайн, а орбітальне угруповання номінальне, а не ефемериди на дату журналу.

studio-replay-position-error-is-the-logged = «Похибка положення» — це записана в журналі відстань між істинним і повідомленим положенням; кільце навколо судна — ця відстань, накреслена в масштабі. Час від початку події до першої оцінки нижче номінальної — це різниця двох записаних моментів, а не показник якості виявлення.

studio-replay-the-vessel-glyph-points-along = Значок судна вказує вздовж курсу за гірокомпасом (HDT), на який не впливає жодна подія; штриховий контур — це місце, де приймач розміщує судно, уздовж повідомленого ним курсу. Розбіжність між ними — підказка для розбору.

studio-replay-the-coast-is-natural-earth = Узбережжя — це суходіл Natural Earth із суспільного надбання в масштабі 1:10 мільйонів, що входить до складу цієї сторінки (нічого не завантажується). Положення в демонстраціях вигадані, тому узбережжя показує, де припадають ці вигадані координати. Лише ілюстрація, ніколи для навігації.

studio-ssv-space-user-gnss-scenarios = Сценарії GNSS для космічного користувача

studio-ssv-space-user-gnss = GNSS для космічного користувача

studio-ssv-which-navigation-signals-can-a = Які навігаційні сигнали ще може використовувати космічний апарат, що перебуває далеко вище супутників GNSS?

studio-ssv-the-satellites-of-a-navigation = Супутники навігаційної системи спрямовані на Землю, тож космічний апарат над ними чує лише те, що просочується повз лімб або крізь бічні пелюстки. Ця сторінка показує, що рушій знаходить для п'яти випадків: доступність на оболонці на геостаціонарній висоті, сильно витягнута орбіта, переліт до Місяця з приймачем слабких сигналів, бортовий фільтр і формація з двох космічних апаратів. Кожне число скопійовано з результату, записаного рушієм; сторінка масштабує його й малює, а нічого іншого не обчислює.

studio-ssv-against-the-icg-booklet = Порівняно з буклетом ICG

studio-tools-leave-empty-to-check-integrity = залиште порожнім, щоб перевірити лише цілісність

studio-tools-synthetic-osnma-example = Синтетичний приклад OSNMA

studio-tools-trust-and-evidence-tools = Інструменти довіри та доказів

studio-tools-trust-evidence-and-test-tools = Інструменти довіри, доказів і тестування

studio-tools-the-0-35-features-that = Функції версії 0.35, що працюють у вашому браузері, і де знайти ті, що не можуть. Файли, відкриті тут, читаються на цій сторінці й ніколи не завантажуються; рушій працює на вашому комп'ютері як WebAssembly.

studio-tools-maritime-trust = Морська довіра

studio-tools-training-debrief = Розбір навчання

studio-tools-the-engine-starts-when-you = Рушій запускається, коли ви користуєтеся інструментом.

studio-tools-every-0-35-feature-and = Кожна функція версії 0.35 і де вона

studio-tools-in-this-browser-where-it = У цьому браузері, де вона може працювати. Решта — функції командного рядка чи сервера, і причину вказано.

studio-tools-in-the-studio = У Studio

studio-tools-verify-an-evidence-pack = Перевірити пакет доказів

studio-tools-open-the-synthetic-example-pack = Відкрити синтетичний приклад пакета

studio-tools-open-it-with-one-byte = Відкрити його зі зміненим одним байтом

studio-tools-no-pack-files-chosen = Файли пакета не вибрано.

studio-tools-verify-the-pack = Перевірити пакет

studio-tools-attach-a-timestamp-token = Додати токен позначки часу

studio-tools-attach-to-the-chosen-pack = Додати до вибраного пакета

studio-tools-export-a-scenario-for-a = Експортувати сценарій для лабораторного симулятора

studio-tools-which-public-framework-rows-do = Для яких рядків публічних рамок ваші прогони підтримують докази (supports evidence for)?

studio-tools-use-the-synthetic-example-runs = Використати синтетичні приклади прогонів

studio-tools-show-the-mapping-tables = Показати таблиці відповідності

studio-tools-show-the-sources-they-cite = Показати джерела, на які вони посилаються

studio-tools-no-result-files-chosen = Файли результатів не вибрано.

studio-tools-build-the-report = Побудувати звіт

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: чи автентифіковано навігаційні дані?

studio-tools-load-it = Завантажити

studio-tools-show-the-recorded-result = Показати записаний результат

studio-tools-imu-fit-sensor-parameters-for = Підгонка IMU: параметри датчиків для гібридних сценаріїв і сценаріїв злиття

studio-tools-fit-the-parameters = Підігнати параметри

studio-tools-jammertest-score-a-receiver-log = Jammertest: оцінити журнал приймача за опублікованим планом випробувань

studio-tools-import-the-schedule = Імпортувати розклад

studio-tools-score-the-log = Оцінити журнал

studio-training-synthetic-library-scenarios = Синтетичні сценарії з бібліотеки

studio-training-library-scenario-to-generate = Сценарій із бібліотеки для генерації

studio-training-random-seed-optional = Випадкове зерно (необов'язково)

studio-training-from-the-scenario = зі сценарію

studio-training-time-cursor = Курсор часу

studio-training-replay-speed = Швидкість відтворення

studio-training-time-cursor-in-log-rows = Курсор часу, у рядках журналу

studio-training-debrief-timeline-time-cursor = Часова шкала розбору: курсор часу

studio-training-what-did-the-crew-see = Що бачив екіпаж і що відбувалося насправді?

studio-training-open-a-log = Відкрити журнал

studio-training-choose-an-instructor-log-or = Виберіть журнал інструктора або відкрийте один із п'яти синтетичних сценаріїв бібліотеки, записаних CLI.

studio-training-or-drop-it-here-or = або перетягніть його сюди, або відкрийте сценарій із бібліотеки:

studio-training-generate-a-stream-here = Згенерувати потік тут

studio-training-run-the-engine-s-nmea = Запустіть у цьому браузері навчальний генератор NMEA рушія. Ви отримаєте синтетичний потік NMEA 0183 для вправи та журнал інструктора й зможете одразу його розібрати. Нічого не завантажується; потокове передавання на симулятор містка через TCP або UDP — функція командного рядка (див. сторінку Інструменти).

studio-training-previous-moment = Попередній момент

studio-training-next-moment = Наступний момент

studio-training-true-track-against-reported = Істинний трек і повідомлений

studio-training-north-up-one-scale-on = Північ угорі, один масштаб на обох осях. Тонка сіра лінія — де судно було насправді. Кольорова лінія — те, що повідомив приймач, колір залежить від відхилення від істини. Там, де приймач не повідомив розв'язку, нічого не малюється.

studio-training-events-and-what-the-receiver = Події та те, що казав приймач

studio-training-one-shared-time-axis-drag = Одна спільна часова вісь. Перетягніть або клацніть, щоб перемістити курсор; клавіші зі стрілками переміщують його кроками. Смуги подій показують силу кожної введеної події в часі.

studio-training-sky-at-the-cursor = Небо на місці курсора

studio-training-the-satellites-the-stream-s = Супутники, які перелічує власний GSV потоку. Заповнена позначка має рівень сигналу; порожня перелічена без нього; затінений сектор — де потік перелічує супутники й жоден не чути. Номінальне орбітальне угруповання, а не ефемериди на дату потоку.

studio-training-at-the-cursor = На місці курсора

studio-training-events-injected = Уведені події

studio-training-as-the-instructor-log-states = Так, як їх указує журнал інструктора, з кожним параметром.

studio-training-debrief-timeline = Часова шкала розбору

studio-training-choose-a-moment-to-move = Виберіть момент, щоб перемістити до нього курсор.

studio-training-the-satellite-sky-is-a = Супутникове небо — це номінальне орбітальне угруповання, а не ефемериди на дату потоку.

studio-training-nothing-here-is-a-measure = Ніщо тут не є мірою того, як будь-який приймач чи система працює за наявності завад.

studio-trust-session-settings-in-toml = Параметри сеансу в TOML

studio-trust-receiver-trust-session-settings-in = Параметри сеансу довіри до приймача в TOML

studio-trust-time-cursor-and-filters = Курсор часу та фільтри

studio-trust-time-cursor-in-epochs = Курсор часу, в епохах

studio-trust-score-timeline-time-cursor = Часова шкала показника: курсор часу

studio-trust-each-monitor-s-alarm-ratio = Частка тривог кожного монітора в часі

studio-trust-about-this-view = Про це подання

studio-trust-can-the-bridge-trust-this = Чи може місток довіряти цьому розв'язку?

studio-trust-open-a-run = Відкрити прогін

studio-trust-open-the-masked-sky-demo = Відкрити демонстрацію закритого неба (геометрія, 0.36)

studio-trust-score-an-nmea-log-here = Оцінити журнал NMEA тут

studio-trust-run-the-engine-in-this = Запустіть у цьому браузері рушій на журналі NMEA 0183 судна й побачте результат у поданні нижче. Журнал читається на цій сторінці й ніколи не завантажується. Це має бути уривок не більше 2 MiB (близько 20 000 епох), що містить п'ятихвилинне вікно калібрування. Параметри — це обмеження судна та ваги показника, як у файлі сеансу.

studio-trust-score-the-synthetic-demo-log = Оцінити синтетичний демонстраційний журнал

studio-trust-session-settings-toml = Параметри сеансу (TOML)

studio-trust-starts-from-the-demo-s = Починається з параметрів демонстрації: змініть обмеження швидкості, прискорення та кутової швидкості повороту судна відповідно до вашого. Сюди можна вставити файл параметрів для власного судна.

studio-trust-jammertest-scorecard = Картка оцінок Jammertest

studio-trust-no-scorecard-open = Картку оцінок не відкрито.

studio-trust-generic-receiver-trust-run-not = Загальний прогін довіри до приймача (не судно)

studio-trust-run-the-illustrative-jamming-example = Запустити ілюстративний приклад глушіння

studio-trust-assess-the-chosen-file = Оцінити вибраний файл

studio-trust-the-format-is-guessed-from = Формат вгадується за назвою файлу; змініть його тут, якщо він хибний, і оцініть знову. NovAtel OEM7, RTCM 3 і Septentrio SBF — двійкові формати; вони надсилаються до рушія як є, у цьому браузері.

studio-trust-imu-file-optional-a-second = Файл IMU (необов'язково): другий датчик курсу

studio-trust-an-imu-log-on-the = Журнал IMU на годиннику журналу приймача заповнює курс, який монітор «курс проти шляху» читає всюди, де журнал приймача його не містить. Його використовує лише сеанс судна.

studio-trust-remove-the-imu-file = Вилучити файл IMU

studio-trust-no-imu-file = Файлу IMU немає.

studio-trust-session-settings-toml-the-log = Параметри сеансу (TOML, журнал передано вбудовано)

studio-trust-first-deduction = Перше зняття балів

studio-trust-first-untrusted = Перша недовіра

studio-trust-receiver-reported-track = Трек, повідомлений приймачем

studio-trust-the-satellites-the-log-s = Супутники, які перелічує власний GSV журналу. Заповнена позначка має рівень сигналу; порожня перелічена без нього; затінений сектор — де журнал перелічує супутники й не чує жодного з них (закрите небо та заглушений сигнал тут виглядають однаково). Номінальне орбітальне угруповання, а не ефемериди на дату журналу.

studio-trust-score-over-time = Показник у часі

studio-trust-score-0-to-100-dashed = Показник від 0 до 100. Штрихові лінії — межі смуг; смужки внизу — смуга та шлюз. Перетягніть або клацніть, щоб перемістити курсор часу; клавіші зі стрілками переміщують його кроками.

studio-trust-reasons-at-the-cursor = Причини на місці курсора

studio-trust-points-each-check-took-off = Бали, які кожна перевірка зняла в цю епоху, від найбільших. Клацніть перевірку, щоб позначити, де вона була вище свого порога початку.

studio-trust-geometry-at-the-cursor = Геометрія на місці курсора

studio-trust-the-satellite-geometry-always-shown = Геометрія супутників, завжди показана: її мітка (добра, задовільна чи погана) і DOP. Закрите небо (корпус, причал, стіна фіорду) — природне погіршення, яке відрізняють від неузгодженості, схожої на атаку. Показник знімає бали за геометрію лише тоді, коли вона погана, щонайбільше 15, і ніколи нижче смуги погіршення.

studio-trust-the-receiver-s-own-flag = Власний прапорець приймача

studio-trust-what-the-receiver-itself-says = Що сам приймач каже про спуфінг і глушіння (u-blox UBX-NAV-STATUS і UBX-SEC-SIG), поруч із моніторами Kshana. Коди належать приймачу; жоден із детекторів не є істиною, а збіг не є валідацією. Прапорець не змінює жодного показника.

studio-trust-over-the-run = Протягом прогону

studio-trust-what-the-score-used = Що використав показник

studio-trust-read-from-the-run-read = Прочитано з прогону, лише для читання.

studio-trust-what-this-view-does-and = Що це подання показує, а що ні

studio-trust-nmea-only-checks-cannot-see = Перевірки лише за NMEA не бачать спуфера, який відтворює все орбітальне угруповання з узгодженими положенням, швидкістю, курсом, потужністю та годинником, ані повторення записаних реальних сигналів. Розв'язок без тривоги через це не є добрим розв'язком.

studio-trust-nothing-on-this-page-is = Ніщо на цій сторінці не є мірою того, як перевірки працюють за реальних завад. Відображення показника та кожна вага зафіксовані до оцінювання журналу, без навчання й без чогось, підігнаного під події.

studio-main-which-satellites-can-you-see = Які супутники видно з місця і наскільки добра їхня геометрія? Скайплот, скайлайн і DOP від рушія у вашому браузері

studio-main-trainer-debrief-for-kshana-nmea = Розбір для тренера журналів інструктора kshana nmea-scenario (лише для навчання; файли залишаються у вашому браузері)

studio-main-where-did-aircraft-and-ships = Де повітряні та морські судна повідомляли про погіршені навігаційні дані за минулу добу? Відкрийте файли карт за добами (вони залишаються у вашому браузері)

studio-main-can-the-bridge-trust-this = Чи може місток довіряти цьому розв'язку? Відкрийте прогін довіри до приймача судна (файли залишаються у вашому браузері)

studio-main-evidence-packs-test-bench-export = Пакети доказів, експорт test-bench, відповідність compliance, OSNMA, інструменти командного рядка та ШІ-асистент (файли залишаються у вашому браузері)

studio-main-map-of-satellites-in-view = Карта супутників у зоні видимості над Землею, із записаного прогону

studio-main-interactive-3-d-view-of = Інтерактивний 3D-вигляд поширеного треку

studio-main-close-history = Закрити історію

studio-main-skip-to-the-content = Перейти до вмісту

studio-main-receiver-trust = Довіра до приймача

studio-main-advanced-view = Розширене подання

studio-main-what-would-you-like-to = Що ви хочете з'ясувати?

studio-main-pick-a-question-or-start = Виберіть запитання або почніть із результату нижче.

studio-main-showing-below = Показано нижче

studio-main-integrity-over-12-hours = Цілісність за 12 годин

studio-main-a-radio-waterfall = Радіоводоспад

studio-main-recorded-result = Записаний результат

studio-main-how-many-navigation-satellites-can = Скільки навігаційних супутників видно з будь-якого місця на Землі?

studio-main-loading-the-recorded-result = Завантаження записаного результату…

studio-main-everything-kshana-can-do = Усе, що вміє Kshana

studio-main-each-area-shows-a-real = Кожна область показує реальний записаний результат і поєднання доказів, що за ним стоїть.

studio-main-open-your-own-files = Відкрити власні файли

studio-main-pages-that-run-the-engine = Сторінки, що запускають рушій на ваших параметрах і файлах. Кожна працює в цьому браузері; нічого не завантажується.

studio-main-which-satellites-can-you-see-2 = Які супутники видно з місця і наскільки добра їхня геометрія? Намалюйте скайлайн.

studio-main-what-accuracy-could-a-reference = Яку точність могла б дати еталонна станція поблизу південного полюса Місяця і де? MODELLED.

studio-main-can-the-bridge-trust-this-2 = Чи може місток довіряти цьому розв'язку? Оцініть журнал NMEA судна.

studio-main-where-aircraft-and-ships-reported = Де повітряні та морські судна повідомляли про погіршені навігаційні дані, і вплив на маршрут.

studio-main-generate-a-drift-or-jamming = Згенеруйте потік вправи з дрейфом або глушінням і розберіть журнал інструктора.

studio-main-two-synthetic-runs-on-one = Два синтетичні прогони на одному годиннику: трек, показник довіри, скайплот наживо та вердикт.

studio-main-the-two-optical-atmosphere-scenarios = Два сценарії оптичної атмосфери: доступність залежно від висоти хмар, перерви та рознесення пунктів.

studio-main-which-navigation-signals-a-spacecraft = Які навігаційні сигнали ще може використовувати космічний апарат далеко над супутниками і як з ними впорається бортовий фільтр та формація.

studio-main-what-lunar-orbiters-and-a = Що місячні орбітальні апарати та наземна станція можуть дати як навігаційна та геодезична інфраструктура, з указаними невдачами.

studio-main-open-a-day-s-observatory = Відкрийте файли обсерваторії за добу та прочитайте їх: три стани, жодної причини, нічого не завантажується.

studio-main-pull-the-antenna-score-the = Відключіть антену, оцініть holdover: запис похибки часу, виміряний за масками ITU-T.

studio-main-check-a-signed-pack-or = Перевірте підписаний пакет або додайте позначку часу.

studio-main-motion-and-event-files-for = Файли руху та подій для лабораторного симулятора.

studio-main-what-your-runs-evidence-against = Для чого ваші прогони дають докази щодо опублікованих рамок.

studio-main-whether-recorded-galileo-data-is = Чи автентифіковано записані дані Galileo, тег за тегом.

studio-main-use-kshana-from-your-assistant = Користуйтеся Kshana зі свого асистента через сервер MCP.

studio-main-all-scenarios = Усі сценарії

studio-main-pick-one-it-opens-on = Виберіть один: він одразу відкривається на своєму результаті.

studio-main-all-questions = Усі запитання

studio-main-every-published-figure = Кожен опублікований показник

studio-main-read-from-the-result-document = Прочитано з документа результату з одиницею, приміткою та походженням, які рушій записує для кожного з них.

studio-main-kalman-self-consistency = Самоузгодженість фільтра Калмана

studio-main-a-consistent-filter-s-reported = Повідомлена невизначеність узгодженого фільтра відповідає його фактичним похибкам. NIS (нормалізований квадрат інновації) має бути близько 1, а NEES (нормалізований квадрат похибки оцінювання) — близько 2, кожен у своїй смузі χ² 95%.

studio-main-engine-chart = Діаграма рушія

studio-main-each-series-this-run-publishes = Кожен ряд, який публікує цей прогін, залежно від часу. Наведіть вказівник або проведіть по діаграмі, щоб прочитати значення.

studio-main-carrier-to-noise-density-db = відношення потужності несівної до спектральної густини шуму, дБ·Гц

studio-main-with-the-jammer = З глушником

studio-main-without-it = Без нього

studio-main-each-cell-is-one-satellite = Кожна комірка — один супутник в одну епоху з цього прогону. Заштриховані комірки лежать нижче порога стеження приймача: цей супутник втрачено.

studio-main-interference-outcome = Наслідок завад

studio-main-error-since-gnss-was-lost = похибка від моменту втрати GNSS

studio-main-scenario-budget = Бюджет сценарію

studio-main-move-the-budget-and-the = Змістіть бюджет, і час до порушення буде зчитано із власного запису похибки цього прогону. Показник holdover рушія, обчислений для бюджету сценарію, показано поруч, і він є визначальним числом. Змініть годинник або перерву в параметрах, щоб повторно запустити фізику.

studio-main-maximum-time-interval-error = максимальна похибка часового інтервалу

studio-main-time-deviation = девіація часу

studio-main-mask-checks-and-holdover-budgets = Перевірки масок і бюджети holdover

studio-main-each-check-s-limit-is = Межа кожної перевірки нанесена як кільце за часу усереднення, де запас був найгіршим. Маски переписано з Рекомендацій ITU-T (International Telecommunication Union Telecommunication Standardization Sector), названих у кожному рядку.

studio-main-lower-is-better-fractional-frequency = Менше — краще. Відносна стабільність частоти залежно від часу усереднення τ, на логарифмічних осях.

studio-main-earth-centred-inertial-frame = Земна інерціальна система відліку

studio-main-drag-to-rotate-scroll-to = Перетягніть, щоб обертати, прокрутіть, щоб масштабувати.

studio-main-run-the-engine-once-per = Запустіть рушій один раз для кожного значення та побудуйте один показник якості. Додайте другий параметр для теплової карти. Кожна точка — реальний прогін рушія, до 60.

studio-main-pinned-runs-side-by-side = закріплені прогони поруч

studio-main-clear-pins = Скинути закріплення

studio-main-key-figures-run-against-run = Ключові показники, прогін проти прогону

studio-main-the-headline-readouts-of-each = Головні показання кожного закріпленого прогону; зміна відносно прогону A.

studio-main-the-engine-s-own-export = власний експорт рушія

studio-main-written-by-the-engine = записано рушієм

studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, ефемериди STK, SigMF

studio-main-try-other-settings = Спробувати інші параметри

studio-main-change-a-value-then-run = Змініть значення, а потім запустіть знову. Відповідь і діаграма оновлюються на місці.

studio-main-run-again = Запустити знову

studio-main-cancel-the-run = Скасувати прогін

studio-main-runs-in-your-browser-nothing = Працює у вашому браузері. Нічого не завантажується.

studio-main-advanced-settings = Розширені параметри

studio-main-every-setting-comes-from-the = Кожен параметр походить із файлу сценарію. Редагуйте весь файл у розділі «Для дослідників».

studio-main-how-this-is-computed = Як це обчислюється

studio-main-level-of-evidence = Рівень доказів

studio-main-the-engine-s-own-one = Власний однорядковий підсумок рушія

studio-main-every-figure-is-labelled-with = Кожен показник позначено своїм рівнем доказів. Валідовано означає перевірено за незалежним зовнішнім оракулом; змодельовано означає фізику з перших принципів із тестами, ще не перевірену оракулом.

studio-main-for-researchers = Для дослідників

studio-main-code-data-citation = код, дані, цитування

studio-main-run-it-on-your-computer = Запустити на своєму комп'ютері

studio-main-run-it-from-python = Запустити з Python

studio-main-exported-figures-carry-this-doi = Експортовані рисунки містять цей DOI (цифровий ідентифікатор об'єкта) у підписі. Той самий сценарій, зерно та версія рушія дають ті самі числа.

studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

studio-main-in-the-editor-tab-indents = У редакторі Tab робить відступ на два пробіли. Натисніть Escape, потім Tab, щоб перейти далі. Запустіть знову, щоб використати вашу правку.

studio-main-every-panel-and-field = Кожна панель і поле

studio-main-the-advanced-view-is-the = Розширене подання — це повна панель: усі панелі цього прогону поруч, кожне поле сценарію, перебори, порівняння та власний звіт рушія. Воно відкривається на цьому сценарії з вашими параметрами.

studio-main-kshana-pro = Kshana Pro

studio-main-kshana-studio = Kshana Studio

studio-main-request-an-evaluation = Запросити оцінювання

studio-main-talk-to-us-about-a = Поговоріть із нами про комерційну ліцензію

studio-main-request-a-study = Замовити дослідження

studio-main-imagery-nasa-visible-earth-blue = Зображення: NASA Visible Earth (Blue Marble). Берегові лінії: Natural Earth. Кожна діаграма тут побудована за прогоном рушія; прогін, звіт, анімація чи експорт, зроблені нативним рушієм командного рядка, позначені як записані.

studio-main-this-session = цей сеанс

studio-main-runs-you-make-appear-here = Прогони, які ви виконуєте, з'являються тут. Виберіть один, щоб повернути його сценарій і результат, або закріпіть його для порівняння.

studio-advanced-find-a-scenario-a-domain = Знайти сценарій, домен, поле або команду

studio-advanced-the-runs-you-made-in = Прогони, виконані в цьому сеансі

studio-advanced-a-short-tour-of-the = Короткий огляд Studio

studio-advanced-toggle-colour-theme = Перемкнути кольорову тему

studio-advanced-switch-to-the-simple-view = Перемкнути на просте подання

studio-advanced-the-simple-view-the-answer = Просте подання: спершу відповідь, п'ять параметрів, подробиці на вимогу

studio-advanced-scenario-library = Бібліотека сценаріїв

studio-advanced-close-the-library = Закрити бібліотеку

studio-advanced-find-a-scenario-a-domain-2 = Знайти сценарій, домен або поле

studio-advanced-scenario-domain-or-field = Сценарій, домен або поле

studio-advanced-filter-by-domain = Фільтрувати за доменом

studio-advanced-scenarios-by-mission-domain = Сценарії за доменом місії

studio-advanced-how-the-studio-works = Як працює Studio

studio-advanced-search-scenarios-domains-or-fields = Пошук сценаріїв, доменів або полів

studio-advanced-search-scenarios-domains-or-fields-2 = Пошук сценаріїв, доменів або полів, наприклад маска висоти

studio-advanced-the-engine-kind-this-scenario = Вид рушія, який запускає цей сценарій

studio-advanced-open-the-scenario-library = Відкрити бібліотеку сценаріїв

studio-advanced-show-the-parameters-and-the = Показати параметри та джерело сценарію

studio-advanced-keep-this-run-to-compare = Зберегти цей прогін для порівняння з іншим (до 4)

studio-advanced-compare-the-pinned-runs = Порівняти закріплені прогони

studio-advanced-share-this-run-or-download = Поділитися цим прогоном або завантажити його

studio-advanced-result-panels = Панелі результату

studio-advanced-run-summary = Підсумок прогону

studio-advanced-parameters-and-scenario-source = Параметри та джерело сценарію

studio-advanced-close-the-parameters-and-show = Закрити параметри та показати результати

studio-advanced-find-a-field-of-this = Знайти поле цього сценарію

studio-advanced-find-a-field-for-example = Знайти поле, наприклад маска

studio-advanced-parameter-view = Подання параметрів

studio-advanced-find-a-scenario-domain-field = Знайти сценарій, домен, поле, панель або команду

studio-advanced-skip-to-results = Перейти до результатів

studio-advanced-find-anything = Знайти що завгодно

studio-advanced-lunar-station-coverage-of-a = Місячна станція: покриття еталонної станції (MODELLED)

studio-advanced-simple-view = Просте подання

studio-advanced-choose-a-scenario = Виберіть сценарій

studio-advanced-what-do-you-want-to = Що ви хочете зробити?

studio-advanced-pick-a-domain-and-a = Виберіть домен і сценарій, налаштуйте його, запустіть рушій у браузері, потім прочитайте, порівняйте та експортуйте результати. Нічого не завантажується.

studio-advanced-share-or-export = Поділитися або експортувати

studio-advanced-good-first-runs = Добрі перші прогони

studio-advanced-pin-run = Закріпити прогін

studio-advanced-report-json-scenario-tables-and = звіт, JSON, сценарій, таблиці та експорти

studio-advanced-the-exact-scenario-in-the = точний сценарій у посиланні

studio-advanced-an-iframe-for-a-course = iframe для сторінки курсу чи вікі

studio-advanced-opens-in-a-new-tab = відкривається в новій вкладці

studio-advanced-loading-the-engine-the-recorded = Завантаження рушія. Спершу показано записаний результат цього сценарію.

studio-advanced-got-it = Зрозуміло

studio-advanced-headline-numbers-from-the-engine = Головні числа з результату рушія зі зміною відносно вашого попереднього прогону цього сценарію та оцінкою «пройдено» або «не пройдено», коли прогін указує поріг.

studio-advanced-set-parameters = Задати параметри

studio-advanced-every-change-re-runs-the = Кожна зміна повторно запускає рушій і оновлює ключові показники та панелі.

studio-advanced-drag-a-slider-and-the = Перетягніть повзунок, і сценарій запуститься знову. Кожен елемент керування записує значення прямо в текст сценарію нижче.

studio-advanced-in-the-editor-tab-indents = У редакторі Tab робить відступ на два пробіли. Натисніть Escape, потім Tab, щоб перейти далі.

studio-mission-thread-time-axis = Часова вісь

studio-mission-thread-mission-thread = Нитка місії

studio-mission-thread-where-does-a-mission-s = Де вичерпується бюджет похибки навігації та часу місії?

studio-mission-thread-a-mission-is-a-chain = Місія — це ланцюг фаз: старт, зближення, переліт до Місяця, посадка, повернення. Кожна фаза має власні датчики й власний бюджет похибки, і кожна передає свою невизначеність наступній. Ця сторінка показує бюджет усього ланцюга, фаза за фазою, і називає найслабшу ланку.

studio-mission-thread-open-the-artemis-class-example = Відкрити приклад класу Artemis

studio-mission-thread-open-a-result-file = Відкрити файл результату…

studio-mission-thread-the-thread = Нитка

studio-mission-thread-error-against-mission-elapsed-time = Похибка відносно часу від початку місії

studio-mission-thread-the-phases = Фази

studio-mission-thread-the-budget-of-one-phase = Бюджет однієї фази
