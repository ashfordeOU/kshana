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

studio-geometry-kshana-home = Главная страница Kshana

studio-geometry-back-to-the-studio = Назад в Studio

studio-geometry-step-the-time = Шаг по времени

studio-geometry-draw-the-skyline = Нарисовать линию горизонта

studio-geometry-skip-to-the-view = Перейти к представлению

studio-geometry-which-satellites-can-you-see = Какие спутники видны и насколько хороша их геометрия?

studio-geometry-what-this-shows = Что это показывает

studio-geometry-starting-the-engine = Запуск движка…

studio-geometry-every-setting-is-in-the = Все параметры содержатся в адресе страницы, поэтому скопированная ссылка открывает то же небо.

studio-geometry-offset-from-the-constellations-reference = Смещение от опорной эпохи орбитальных группировок

studio-geometry-10-min = −10 мин

studio-geometry-10-min-2 = +10 мин

studio-geometry-your-own-orbital-elements-tle = Ваши собственные орбитальные элементы (TLE)

studio-geometry-use-these-elements = Использовать эти элементы

studio-geometry-back-to-the-presets = Назад к предустановкам

studio-geometry-clear-the-skyline = Очистить линию горизонта

studio-geometry-drag-on-the-skyplot-to = Проведите по скайплоту, чтобы нарисовать линию горизонта (шаг 1° по азимуту, 0,5° по углу места). Когда скайплот в фокусе: клавиши «Влево» и «Вправо» перемещают по горизонту (с Shift — на 10°), «Вверх» и «Вниз» поднимают или опускают линию горизонта в этой точке (с Shift — на 5°), Delete очищает её.

studio-geometry-copy-a-link-to-this = Скопировать ссылку на это небо

studio-geometry-download-the-skyplot-svg = Скачать скайплот (SVG)

studio-geometry-zenith-in-the-centre-the = Зенит в центре, горизонт по краю, север сверху. Заполненные метки — спутники, вошедшие в решение; пустые метки скрыты маской или линией горизонта либо не используются.

studio-geometry-dilution-of-precision = Геометрический фактор (DOP)

studio-geometry-how-much-the-geometry-multiplies = Во сколько раз геометрия увеличивает ошибку дальности. Чем меньше, тем лучше: около 1 — отлично, выше 6 — плохо.

studio-geometry-horizontal-position-error = Ошибка горизонтального положения

studio-geometry-satellites-as-a-table = Спутники в виде таблицы

studio-geometry-the-same-satellites-as-the = Те же спутники, что на скайплоте.

studio-geometry-azimuth = Азимут, °

studio-geometry-elevation = Угол места, °

studio-geometry-in-the-solution = В решении

studio-geometry-the-engine-runs-here-as = Движок работает здесь как WebAssembly. Ничего не загружается с других сайтов, и ничто из заданного вами никуда не отправляется.

studio-holdover-holdover-test-scenarios = Сценарии теста holdover

studio-holdover-holdover-test = Тест holdover

studio-holdover-how-far-does-the-time = Насколько вырастает ошибка времени, когда GNSS пропадает?

studio-holdover-opening-the-scenarios = Открытие сценариев…

studio-holdover-verdict-step-by-step = Вердикт по шагам

studio-holdover-time-error-over-the-record = Ошибка времени на протяжении записи

studio-holdover-the-three-phases-are-shaded = Три фазы выделены оттенком; штриховые вертикальные линии — два момента времени, указанные оператором. Штриховые горизонтальные линии — пределы масок для максимальной абсолютной ошибки времени, каждая проведена на том шаге, который назван в её маске, и полоса восстановления; треугольник отмечает момент, когда впервые превышен бюджет или огибающая holdover ePRTC-A.

studio-holdover-of-the-baseline-and-the = Для базового уровня и holdover; крестик — предел маски в момент, когда её проверка была наихудшей.

studio-holdover-the-same-two-steps-against = Те же два шага относительно пределов TDEV.

studio-holdover-the-numbers = Числа

studio-holdover-everything-below-is-the-engine = Всё ниже принадлежит движку, в тех единицах, которые он указывает.

studio-holdover-mask-checks = Проверки масок

studio-holdover-each-mask-is-measured-on = Каждая маска измеряется на том шаге, который назван в её условии. Маска, которой требуется более длинная запись, чем дал шаг, помечается INCOMPLETE и никогда не экстраполируется; каждая запись, которую Рекомендация оставляет для дальнейшего изучения, отсутствует.

studio-holdover-what-this-does-not-cover = Что это не охватывает

studio-interference-cell-size-in-degrees-empty = Размер ячейки в градусах (пусто — 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = Об этой странице

studio-interference-interference-map = Карта помех

studio-interference-where-did-position-reports-look = Где сообщения о положении выглядели ухудшенными?

studio-interference-open-map-files = Открыть файлы карт

studio-interference-or-drop-them-here = или перетащите их сюда

studio-interference-open-the-synthetic-demo = Открыть синтетическую демонстрацию

studio-interference-close-all-maps = Закрыть все карты

studio-interference-nothing-open-yet = Пока ничего не открыто.

studio-interference-build-a-map-here = Построить карту здесь

studio-interference-build-from-the-synthetic-sample = Построить по синтетическому образцу

studio-interference-route-exposure-here = Воздействие помех на маршруте здесь

studio-interference-use-the-synthetic-route = Использовать синтетический маршрут

studio-interference-reading-these-maps = Как читать эти карты

studio-interference-maps-inherit-the-coverage-of = Карты наследуют покрытие своего источника: приёмники ADS-B, которыми управляют волонтёры, оставляют открытое море малонаселённым данными, а открытые данные AIS не включают некоторые классы судов. Читайте примечания о покрытии в каждом файле.

studio-interference-no-coastline-or-basemap-is = Береговая линия и подложка не рисуются, и ничего не загружается ни с какого сервера; сетка — только широта и долгота.

studio-interference-no-identifier-of-any-aircraft = В этих файлах нет идентификатора ни одного воздушного или морского судна; ячейки со слишком малым числом различных воздушных или морских судов не публикуются вообще, а значение AIS, равное одному или двум, скрывается.

studio-lunar-infra-lunar-infrastructure-scenarios = Сценарии лунной инфраструктуры

studio-lunar-infra-lunar-infrastructure = Лунная инфраструктура

studio-lunar-infra-what-can-the-moon-s = Что могут орбита и поверхность Луны как навигационная и геодезическая инфраструктура и в чём они уступают?

studio-lunar-infra-five-studies-of-what-lunar = Пять исследований того, что могли бы вместе дать лунные орбитальные аппараты и станция на лунной поверхности как навигационная и геодезическая инфраструктура: определение орбиты по сигналам GNSS Земли в сравнении с наземными измерениями, фиксация фазы несущей между поверхностной станцией и орбитальным аппаратом, совместная оценка лунной системы отсчёта, связывание GNSS, VLBI и лазерной дальнометрии на одном космическом аппарате, а также чувствительность лазерной дальнометрии и слежения к приливам и либрации Луны. Исходные данные иллюстративны, а модель ограничена; если исследование не достигло порога, относительно которого оно было предварительно зарегистрировано, эта страница об этом сообщает. Каждое число скопировано из результата, записанного движком; страница масштабирует его и рисует, больше ничего не вычисляя.

studio-lunar-infra-what-the-result-holds = Что содержит результат

studio-lunar-infra-findings-disclosures-and-what-was = Выводы, раскрытие информации и то, что не было проверено

studio-lunar-what-these-figures-are = Что представляют эти значения

studio-lunar-map-key = Легенда карты

studio-lunar-lunar-station = Лунная станция

studio-lunar-what-accuracy-could-a-reference = Какую точность могла бы дать опорная станция вблизи южного полюса Луны и где?

studio-lunar-the-constellation-its-signal-in = Орбитальная группировка, её ошибка сигнала в пространстве, ошибка съёмки станции, задержка поправки и квантование линии связи — это исходные данные, заданные в файле сценария, каждое с указанием источника или с пометкой «иллюстративно». Ни одно значение здесь не сверено с реальной станцией или лётными данными.

studio-lunar-the-source-and-every-input = Источник и каждое изменённое вами входное значение содержатся в адресе страницы, поэтому скопированная ссылка открывает то же исследование.

studio-lunar-a-result-file-is-the = Файл результата — это JSON, который движок записывает для данного вида (вывод JSON командной строки или прогон, сохранённый отсюда). Он читается на этой странице; ничего не отправляется.

studio-lunar-each-field-shows-the-scenario = Каждое поле показывает значение из файла сценария, пока вы его не измените. Сутки эпох по всей сетке считаются долго: меньше испытаний или более длинный шаг по времени ускоряют расчёт.

studio-lunar-run-it-here = Запустить здесь

studio-lunar-back-to-the-file-s = Вернуть значения из файла

studio-lunar-copy-a-link = Скопировать ссылку

studio-lunar-save-this-result-json = Сохранить этот результат (JSON)

studio-lunar-corrected-error-over-the-south = Скорректированная ошибка над южной полярной областью

studio-lunar-south-polar-stereographic-the-pole = Южная полярная стереографическая проекция: полюс в центре, край сетки по границе, долгота 0° сверху, 90° в. д. справа. Каждая ячейка — одна точка сетки; жирная линия — место, где скорректированная ошибка пересекает порог, а штриховая линия — радиус покрытия по азимутам.

studio-lunar-region-figures = Показатели области

studio-lunar-over-the-whole-grid-means = По всей сетке: средние значения, взвешенные по площади, и наихудшая точка.

studio-lunar-coverage-radius-per-azimuth = Радиус покрытия по азимутам

studio-lunar-along-each-bearing-from-the = Вдоль каждого направления от станции: расстояние, на котором покрытие впервые опускается ниже 95 %.

studio-lunar-as-a-table = В виде таблицы

studio-lunar-radius-km = Радиус, км

studio-lunar-at-the-grid-edge = На краю сетки

studio-lunar-points-along-it = Точки вдоль неё

studio-lunar-an-epoch-is-unavailable-at = Эпоха недоступна в точке, когда пользователь видит менее четырёх спутников или станция видит не все спутники, которые использует пользователь; для неё ошибка не вычисляется.

studio-lunar-grid-points-as-a-table = Точки сетки в виде таблицы

studio-lunar-the-same-points-as-the = Те же точки, что на карте, сначала ближайшие к станции.

studio-lunar-latitude = Широта, °

studio-lunar-longitude = Долгота, °

studio-lunar-from-the-station-km = От станции, км

studio-lunar-corrected-error = Скорректированная ошибка

studio-lunar-uncorrected-error = Нескорректированная ошибка

studio-lunar-hpl-median = Медиана HPL

studio-lunar-the-engine-s-statement-inputs = Заявление движка, исходные данные и бюджет линии связи

studio-lunar-inputs-as-the-engine-read = Исходные данные в том виде, как их прочитал движок

studio-lunar-error-model = Модель ошибок

studio-lunar-correction-link-budget-at-the = Бюджет линии связи для поправок на станции и в наихудшей точке

studio-observatory-previous-day = Предыдущий день

studio-observatory-day-opened = Открытый день

studio-observatory-next-day = Следующий день

studio-observatory-interference-observatory = Обсерватория помех

studio-observatory-what-did-one-day-s = Как выглядели сообщения о положении за один день?

studio-observatory-the-observatory-writes-a-few = Обсерватория записывает несколько файлов на каждые сутки UTC и область: ячейки сетки с одним из трёх состояний, список инцидентов и манифест. Откройте здесь созданные вами файлы и прочитайте их. Страница ничего не вычисляет и показывает только то, что сказано в файлах. Она не поставляет данных обсерватории, ничего не загружает и ничего не отправляет.

studio-observatory-open-a-day = Открыть день

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Три состояния

studio-observatory-the-picture-the-observatory-wrote = Изображение, записанное обсерваторией

studio-observatory-the-png-you-opened-as = Открытый вами PNG как есть. Не нарисованные ячейки не наблюдались.

studio-observatory-cells-drawn-from-the-file = Ячейки, нарисованные по файлу

studio-observatory-plate-carr-eacute-e-no = Равнопромежуточная проекция (plate carrée), без базовой карты. Наведите курсор на ячейку или воспользуйтесь таблицей, чтобы узнать её состояние и значения. Место без ячейки не наблюдалось.

studio-observatory-hover-or-focus-a-cell = Наведите курсор на ячейку или сфокусируйтесь на ней, чтобы узнать её состояние.

studio-observatory-every-cell-in-the-file = Каждая ячейка в файле

studio-observatory-a-count-the-file-withholds = Значение, которое файл скрывает (менее 5 воздушных судов), отображается как «withheld» и никогда как 0.

studio-observatory-files-and-their-hashes = Файлы и их хеши

studio-observatory-dataset-licence-and-notice = Набор данных, лицензия и уведомление

studio-observatory-what-this-page-does-and = Что эта страница показывает и чего не показывает

studio-observatory-products-are-released-at-least = Продукты публикуются не ранее чем через 24 часа после окончания суток UTC, на ячейках 0,5 градуса или крупнее. Это никогда не представление в реальном времени, и оно никогда не говорит «сейчас».

studio-observatory-it-shows-no-cause-no = Она не показывает ни причины, ни страны, ни силы, ни источника помех, ни оповещений, ни сравнений между местами или днями, ни AIS. ADS-B и AIS никогда не объединяются.

studio-observatory-the-page-ships-none-of = Страница не поставляет ни одного продукта обсерватории. Решение об их публикации принадлежит владельцу.

studio-optical-optical-atmosphere-scenarios = Сценарии оптической атмосферы

studio-optical-optical-pnt = Оптический PNT

studio-optical-can-an-optical-link-get = Может ли оптическая линия связи пройти сквозь погоду?

studio-optical-the-link = Линия связи

studio-optical-sites-as-the-engine-states = Площадки в том виде, как их указывает движок

studio-optical-inputs-are-marked-everything-else = Исходные данные помечены; всё остальное — выход движка для них.

studio-optical-it-draws-only-what-the = Рисуется только то, что движок записал для каждого сценария, включая его временной ряд с начальным значением. Страница ничего не вычисляет: она масштабирует числа движка под график.

studio-optical-the-sites-their-cloud-climates = Площадки, их облачный климат, классы часов и методы — исходные данные, выбранные для иллюстрации и помеченные как таковые. Никакая измеренная запись доступности не сравнивалась.

studio-replay-replay-controls = Управление воспроизведением

studio-replay-previous-moment-page-up = Предыдущий момент (Page Up)

studio-replay-step-back = Шаг назад

studio-replay-step-back-left-arrow = Шаг назад (стрелка влево)

studio-replay-play-or-pause-space = Воспроизвести или приостановить (пробел)

studio-replay-step-forward = Шаг вперёд

studio-replay-step-forward-right-arrow = Шаг вперёд (стрелка вправо)

studio-replay-next-moment-page-down = Следующий момент (Page Down)

studio-replay-replay-speed-mission-seconds-per = Скорость воспроизведения, секунд миссии в секунду

studio-replay-mission-clock-seconds-from-the = Часы миссии, секунды от начала каждого прогона

studio-replay-bridge-replay = Воспроизведение для мостика

studio-replay-two-runs-one-clock-when = Два прогона, одни часы: когда мостик узнал?

studio-replay-put-two-synthetic-runs-side = Поставьте два синтетических прогона рядом и воспроизводите их по одним часам миссии. Каждая панель показывает, где судно находилось на самом деле, в сравнении с тем, где его положение указывал приёмник, оценку доверия движка и её диапазон во времени, спутники, которые перечисляет сам журнал (небо пустеет, где журнал не слышит ни одного), и вердикт по окончании прогона. Всё нарисованное берётся из журнала или из результата движка для него; из сети ничего не читается.

studio-replay-save-animated-svg = Сохранить анимированный SVG

studio-replay-save-frames-zip = Сохранить кадры (ZIP)

studio-replay-opening-the-two-demo-runs = Открытие двух демонстрационных прогонов…

studio-replay-the-skyplot-is-the-log = Скайплот строится по собственным сообщениям GSV журнала: заполненная метка — спутник с уровнем сигнала, пустая — спутник, перечисленный без него, а затенённый сектор — диапазон азимутов, где журнал перечисляет спутники и не слышит ни одного. Закрытое небо и подавленный сигнал выглядят здесь одинаково. Это не линия горизонта, а группировка номинальная, а не эфемериды на дату журнала.

studio-replay-position-error-is-the-logged = «Ошибка положения» — это записанное в журнале расстояние между истинным и сообщённым положением; кольцо вокруг судна — это расстояние, нарисованное в масштабе. Время от начала события до первой оценки ниже номинальной — это разность двух записанных моментов времени, а не показатель эффективности обнаружения.

studio-replay-the-vessel-glyph-points-along = Значок судна направлен по курсу гирокомпаса (HDT), на который ни одно событие не влияет; штриховой контур — это место, где приёмник помещает судно, вдоль сообщаемого им курса. Расхождение между ними — подсказка для разбора.

studio-replay-the-coast-is-natural-earth = Берег — суша Natural Earth из общественного достояния в масштабе 1:10 млн, входящая в состав этой страницы (ничего не загружается). Положения в демонстрациях вымышлены, поэтому берег показывает, куда попадают эти вымышленные координаты. Только для иллюстрации, никогда не для навигации.

studio-ssv-space-user-gnss-scenarios = Сценарии GNSS для космических пользователей

studio-ssv-space-user-gnss = GNSS для космических пользователей

studio-ssv-which-navigation-signals-can-a = Какие навигационные сигналы всё ещё может использовать космический аппарат, находящийся значительно выше спутников GNSS?

studio-ssv-the-satellites-of-a-navigation = Спутники навигационной системы направлены на Землю, поэтому космический аппарат выше них слышит только то, что выходит за лимб или просачивается через боковые лепестки. Эта страница показывает, что движок находит для пяти случаев: доступность на оболочке на геостационарной высоте, высокоэллиптическая орбита, перелёт к Луне с приёмником слабых сигналов, бортовой фильтр и формация из двух космических аппаратов. Каждое число скопировано из результата, записанного движком; страница масштабирует его и рисует, больше ничего не вычисляя.

studio-ssv-against-the-icg-booklet = По сравнению с буклетом ICG

studio-tools-leave-empty-to-check-integrity = оставьте пустым, чтобы проверить только целостность

studio-tools-synthetic-osnma-example = Синтетический пример OSNMA

studio-tools-trust-and-evidence-tools = Инструменты доверия и доказательств

studio-tools-trust-evidence-and-test-tools = Инструменты доверия, доказательств и испытаний

studio-tools-the-0-35-features-that = Возможности 0.35, которые работают в вашем браузере, и где найти те, что не могут. Открываемые здесь файлы читаются на этой странице и никогда не загружаются; движок работает на вашем компьютере как WebAssembly.

studio-tools-maritime-trust = Морское доверие

studio-tools-training-debrief = Разбор тренировки

studio-tools-the-engine-starts-when-you = Движок запускается, когда вы используете инструмент.

studio-tools-every-0-35-feature-and = Каждая возможность 0.35 и где она находится

studio-tools-in-this-browser-where-it = В этом браузере, где она может работать. Остальные — возможности командной строки или сервера, причина указана.

studio-tools-in-the-studio = В Studio

studio-tools-verify-an-evidence-pack = Проверить пакет доказательств

studio-tools-open-the-synthetic-example-pack = Открыть синтетический пример пакета

studio-tools-open-it-with-one-byte = Открыть его с одним изменённым байтом

studio-tools-no-pack-files-chosen = Файлы пакета не выбраны.

studio-tools-verify-the-pack = Проверить пакет

studio-tools-attach-a-timestamp-token = Прикрепить токен метки времени

studio-tools-attach-to-the-chosen-pack = Прикрепить к выбранному пакету

studio-tools-export-a-scenario-for-a = Экспортировать сценарий для лабораторного симулятора

studio-tools-which-public-framework-rows-do = Какие строки публичных рамочных документов подкрепляют ваши прогоны доказательствами?

studio-tools-use-the-synthetic-example-runs = Использовать синтетические примеры прогонов

studio-tools-show-the-mapping-tables = Показать таблицы соответствия

studio-tools-show-the-sources-they-cite = Показать источники, на которые они ссылаются

studio-tools-no-result-files-chosen = Файлы результатов не выбраны.

studio-tools-build-the-report = Построить отчёт

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: аутентифицированы ли навигационные данные?

studio-tools-load-it = Загрузить

studio-tools-show-the-recorded-result = Показать записанный результат

studio-tools-imu-fit-sensor-parameters-for = Подбор IMU: параметры датчиков для гибридных сценариев и сценариев слияния

studio-tools-fit-the-parameters = Подобрать параметры

studio-tools-jammertest-score-a-receiver-log = Jammertest: оценить журнал приёмника по опубликованному плану испытаний

studio-tools-import-the-schedule = Импортировать расписание

studio-tools-score-the-log = Оценить журнал

studio-training-synthetic-library-scenarios = Синтетические сценарии из библиотеки

studio-training-library-scenario-to-generate = Сценарий из библиотеки для генерации

studio-training-random-seed-optional = Случайное начальное значение (seed), необязательно

studio-training-from-the-scenario = из сценария

studio-training-time-cursor = Курсор времени

studio-training-replay-speed = Скорость воспроизведения

studio-training-time-cursor-in-log-rows = Курсор времени, в строках журнала

studio-training-debrief-timeline-time-cursor = Шкала разбора: курсор времени

studio-training-what-did-the-crew-see = Что видел экипаж и что происходило на самом деле?

studio-training-open-a-log = Открыть журнал

studio-training-choose-an-instructor-log-or = Выберите журнал инструктора или откройте один из пяти синтетических сценариев библиотеки, записанных командной строкой.

studio-training-or-drop-it-here-or = или перетащите его сюда, либо откройте сценарий библиотеки:

studio-training-generate-a-stream-here = Сгенерировать поток здесь

studio-training-run-the-engine-s-nmea = Запустите генератор тренировочных данных NMEA движка в этом браузере. Вы получите синтетический поток NMEA 0183 для учения и журнал инструктора и сможете сразу провести разбор. Ничего не загружается; потоковая передача на симулятор мостика по TCP или UDP — возможность командной строки (см. страницу «Инструменты»).

studio-training-previous-moment = Предыдущий момент

studio-training-next-moment = Следующий момент

studio-training-true-track-against-reported = Истинный трек в сравнении с сообщённым

studio-training-north-up-one-scale-on = Север сверху, один масштаб по обеим осям. Тонкая серая линия — где судно находилось на самом деле. Цветная линия — то, что сообщал приёмник, цвет показывает, насколько он отклонялся от истины. Где приёмник не сообщил решения, ничего не рисуется.

studio-training-events-and-what-the-receiver = События и что сообщал приёмник

studio-training-one-shared-time-axis-drag = Одна общая ось времени. Перетащите или щёлкните, чтобы переместить курсор; клавиши со стрелками перемещают его по шагам. Полосы событий показывают силу каждого внесённого события во времени.

studio-training-sky-at-the-cursor = Небо на курсоре

studio-training-the-satellites-the-stream-s = Спутники, которые перечисляет собственное сообщение GSV потока. Заполненная метка имеет уровень сигнала; пустая перечислена без него; затенённый сектор — где поток перечисляет спутники, но ни один не слышен. Номинальная группировка, а не эфемериды на дату потока.

studio-training-at-the-cursor = На курсоре

studio-training-events-injected = Внесённые события

studio-training-as-the-instructor-log-states = Как их указывает журнал инструктора, со всеми параметрами.

studio-training-debrief-timeline = Шкала разбора

studio-training-choose-a-moment-to-move = Выберите момент, чтобы переместить к нему курсор.

studio-training-the-satellite-sky-is-a = Небо со спутниками — номинальная группировка, а не эфемериды на дату потока.

studio-training-nothing-here-is-a-measure = Ничто здесь не является мерой того, как какой-либо приёмник или система ведут себя при помехах.

studio-trust-session-settings-in-toml = Параметры сеанса в TOML

studio-trust-receiver-trust-session-settings-in = Параметры сеанса доверия к приёмнику в TOML

studio-trust-time-cursor-and-filters = Курсор времени и фильтры

studio-trust-time-cursor-in-epochs = Курсор времени, в эпохах

studio-trust-score-timeline-time-cursor = Шкала оценки: курсор времени

studio-trust-each-monitor-s-alarm-ratio = Доля тревог каждого монитора во времени

studio-trust-about-this-view = Об этом представлении

studio-trust-can-the-bridge-trust-this = Может ли мостик доверять этому решению?

studio-trust-open-a-run = Открыть прогон

studio-trust-open-the-masked-sky-demo = Открыть демонстрацию с замаскированным небом (геометрия, 0.36)

studio-trust-score-an-nmea-log-here = Оценить журнал NMEA здесь

studio-trust-run-the-engine-in-this = Запустите движок в этом браузере на журнале NMEA 0183 судна и посмотрите результат в представлении ниже. Журнал читается на этой странице и никогда не загружается. Это должен быть фрагмент не более 2 МиБ (около 20 000 эпох), содержащий пятиминутное окно калибровки. Параметры — это пределы судна и веса оценки, как в файле сеанса.

studio-trust-score-the-synthetic-demo-log = Оценить синтетический демонстрационный журнал

studio-trust-session-settings-toml = Параметры сеанса (TOML)

studio-trust-starts-from-the-demo-s = Начинается с параметров демонстрации: измените пределы скорости, ускорения и скорости поворота судна под ваши. Сюда можно вставить файл параметров вашего собственного судна.

studio-trust-jammertest-scorecard = Оценочная карта Jammertest

studio-trust-no-scorecard-open = Оценочная карта не открыта.

studio-trust-generic-receiver-trust-run-not = Общий прогон доверия к приёмнику (не судно)

studio-trust-run-the-illustrative-jamming-example = Запустить иллюстративный пример подавления

studio-trust-assess-the-chosen-file = Оценить выбранный файл

studio-trust-the-format-is-guessed-from = Формат определяется по имени файла; если он неверен, измените его здесь и повторите оценку. NovAtel OEM7, RTCM 3 и Septentrio SBF — двоичные форматы; они передаются движку как есть, в этом браузере.
