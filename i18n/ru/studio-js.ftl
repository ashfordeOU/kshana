# studio-js.ftl (ru): translations

js-adv-all-domains = Все области

js-adv-animation-frame-title = Анимация этого прогона, записанная движком

js-adv-animation-html-player = Проигрыватель HTML

js-adv-animation-html-player-title = Проигрыватель в одном файле, в том виде, как его записал движок

js-adv-animation-load-failed = Не удалось загрузить записанную анимацию ({ $reason }).

js-adv-animation-loading = Загрузка записанной анимации…

js-adv-animation-none = Для этого сценария записанной анимации нет.

js-adv-animation-note = Движок записывает анимацию любого прогона, у которого есть ось времени: самовоспроизводящийся SVG и проигрыватель HTML в одном файле с собственными элементами воспроизведения и перемотки. Сборка для браузера не содержит этого средства записи, поэтому здесь показан файл, который записал собственный движок командной строки для встроенного сценария.

js-adv-animation-svg = Анимированный SVG

js-adv-animation-svg-title = Самовоспроизводящийся SVG, в том виде, как его записал движок

js-adv-axis-averaging-time = время усреднения τ (s)

js-adv-axis-observation-interval = интервал наблюдения τ (s)

js-adv-axis-value = значение

js-adv-badge-live-engine = Работающий движок

js-adv-badge-recorded = Запись

js-adv-badge-recorded-engine = Записанный прогон, движок v{ $version }

js-adv-badge-recorded-native = Записанный прогон, собственный движок v{ $version }

js-adv-band-carrier = Несущая

js-adv-band-carrier-not-set = не задана в этом сценарии

js-adv-band-chip-rate = Частота чипов

js-adv-band-jammer-bandwidth = Полоса источника подавления

js-adv-band-jammer-label = источник подавления { $bandwidth } MHz

js-adv-band-jammer-power = Мощность источника подавления

js-adv-band-jammer-type = Тип источника подавления

js-adv-band-no-carrier-note = Движок вычисляет отношение мощности помехи к мощности сигнала по бюджету линии связи. Этот сценарий не называет частоту несущей, поэтому спектр не рисуется.

js-adv-band-satellites = Спутники

js-adv-band-signal-main-lobe = главный лепесток сигнала

js-adv-band-svg-label = Полосы сигнала и источника подавления вокруг несущей

js-adv-band-tracking-threshold = Порог слежения

js-adv-browser-cannot-run = Сборка для браузера не может запустить этот сценарий.

js-adv-busy-running = Выполняется

js-adv-busy-sweeping = Перебор

js-adv-chain-handed-on =
    { $n ->
        [one] Передано дальше: { $n } значение
        [few] Передано дальше: { $n } значения
        [many] Передано дальше: { $n } значений
       *[other] Передано дальше: { $n } значения
    }

js-adv-chain-note = Одна система, прослеженная через все этапы движка. В таблице ниже перечислено каждое число, которое вычислил один этап и использовал следующий.

js-adv-chain-stage = Этап { $n }

js-adv-chain-sub = выход каждого этапа питает следующий

js-adv-chain-title = Цепочка

js-adv-chart-allan-title = Девиация Аллана

js-adv-chart-budget-label = бюджет

js-adv-chart-default-title = График Kshana

js-adv-chart-effective-cn0 = Эффективное C/N0 по спутникам

js-adv-chart-ground-track = Трасса на поверхности

js-adv-chart-holdover-budget = Holdover относительно бюджета времени

js-adv-chart-mtie-title = MTIE (максимальная ошибка временного интервала)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · сценарий { $hash } · kshana.dev

js-adv-chart-stability-title = Стабильность часов (перекрывающаяся девиация Аллана)

js-adv-chart-tdev-title = TDEV (девиация времени)

js-adv-chart-undrawable = Не удалось построить этот график.

js-adv-chip-live = Работающий движок · v{ $version }

js-adv-chip-live-title = Движок Kshana работает в этом браузере как WebAssembly

js-adv-chip-recorded = Записанные прогоны · v{ $version }

js-adv-chip-recorded-title = WebAssembly не удалось запустить здесь. Показаны настоящие записанные прогоны встроенных сценариев.

js-adv-chip-recorded-title-reason = WebAssembly не удалось запустить здесь ({ $reason }). Показаны настоящие записанные прогоны встроенных сценариев.

js-adv-chip-unavailable = Движок недоступен

js-adv-cmd-all-fields = Показать все числовые поля

js-adv-cmd-compare = Сравнить закреплённые прогоны

js-adv-cmd-embed-code = Скопировать код для встраивания

js-adv-cmd-exports = Скачать результаты (экспорт)

js-adv-cmd-history = Открыть историю прогонов

js-adv-cmd-parameters = Открыть параметры

js-adv-cmd-pin = Закрепить этот прогон для сравнения

js-adv-cmd-report = Скачать отчёт

js-adv-cmd-reset = Сбросить текст сценария

js-adv-cmd-run = Запустить сценарий

js-adv-cmd-share-link = Скопировать ссылку для общего доступа

js-adv-cmd-start = Перейти на начальный экран

js-adv-cmd-theme = Переключить светлую или тёмную тему

js-adv-cmd-tour = Начать экскурсию

js-adv-command-line-only = только командная строка

js-adv-compare-deltas-note = Разности даны относительно прогона A. Зелёным отмечено лучшее значение для каждого показателя.

js-adv-compare-no-common = У этих прогонов нет сопоставимых показателей качества. Закрепите прогоны одного семейства сценариев, чтобы увидеть числа и разности.

js-adv-compare-one-pinned = Закреплён один прогон. Измените параметр, запустите снова и закрепите этот прогон, чтобы сравнить два.

js-adv-compare-overlay = Наложение закреплённых прогонов

js-adv-compare-overlay-diff = Наложение с разностью B − A

js-adv-compare-overlay-note = Сплошные линии — прогон A, штриховые — прогон B, на одних и тех же осях.

js-adv-compare-overlay-title = { $title }: прогон { $a } (A) в сравнении с прогоном { $b } (B)

js-adv-compare-pin-two = Закрепите не менее двух прогонов, чтобы сравнить их рядом. Закрепите прогон, измените параметр или выберите другой сценарий того же семейства, запустите его и закрепите снова.

js-adv-compare-run-heading = { $letter } · прогон { $run }

js-adv-copy-blocked = Копирование здесь заблокировано.

js-adv-copy-command = Скопировать: { $command }

js-adv-could-not-load = Не удалось загрузить { $file }.

js-adv-coverage-dots =
    Точки — это { $shown } из { $total } { $total ->
        [one] спутника
        [few] спутников
        [many] спутников
       *[other] спутников
    }, пролетающих вдоль своих трасс на поверхности; запустите воспроизведение, чтобы они двигались.

js-adv-coverage-field-label = Поле для карты

js-adv-coverage-map = Карта покрытия

js-adv-coverage-map-over = над { $body }

js-adv-coverage-map-select = Карта

js-adv-coverage-note = Каждая ячейка — одна точка сетки на { $body }, оценённая по каждой эпохе прогона.

js-adv-coverage-title = { $field } над { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = Начальный экран: все области

js-adv-decrease-field = Уменьшить { $field }

js-adv-domain = Область

js-adv-domain-line-campaigns = Цепочки миссий, переборы и прогоны Монте-Карло по одним часам.

js-adv-domain-line-constellations = Проектирование орбитальной группировки, карта её покрытия и PDOP (геометрический фактор положения).

js-adv-domain-line-deepspace = Навигация и время у Луны, в цислунном пространстве и у Марса.

js-adv-domain-line-integrity = Определения положения и вопрос, можно ли им доверять: RAIM (автономный контроль целостности приёмником) и его развитие, ARAIM.

js-adv-domain-line-interference = Источники подавления против приёмников GNSS: что теряется и когда.

js-adv-domain-line-leo = Навигационные сигналы, пролёты, сообщения и определения положения на низкой околоземной орбите.

js-adv-domain-line-leo-missions = Исследования и службы, построенные на слое низкой околоземной орбиты.

js-adv-domain-line-navigation = Инерциальная, рельефная, гравиметрическая и другая навигация без GNSS.

js-adv-domain-line-optional = Необязательная группа сценариев.

js-adv-domain-line-orbits = Распространение орбиты, эфемериды и геометрия GNSS.

js-adv-domain-line-solar = Каждая планета и луна в одну эпоху, со временем прохождения света.

js-adv-domain-line-spaceops = Пролёты, окна запуска, вход в атмосферу, бюджеты линии связи и ориентации.

js-adv-domain-line-spectrum = Водопады радиодиапазона: источники подавления, сигналы и то, что отслеживает приёмник.

js-adv-domain-line-spoofing = Ложные сигналы и меконинг, а также мониторы, которые их ловят.

js-adv-domain-line-studies = Квантовые датчики, сравнительные исследования и форматы совместимости.

js-adv-domain-line-timing = Часы без GNSS: holdover, стабильность, маски телекоммуникационной синхронизации, передача времени.

js-adv-domain-pick-hint = Выберите один: он открывается и запускается в вашем браузере. Затем можно изменить его параметры.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } сценарий
        [few] { $label }: { $n } сценария
        [many] { $label }: { $n } сценариев
       *[other] { $label }: { $n } сценария
    }

js-adv-domain-select-label = Показать одну область

js-adv-download = Скачать

js-adv-edited-cli-only-status = Изменено: этот сценарий работает только в движке командной строки.

js-adv-edited-needs-engine = Изменено: нужен движок { $need }.

js-adv-edited-needs-live-engine = Изменённым сценариям нужен работающий движок.

js-adv-embed-copied = Код для встраивания скопирован.

js-adv-engine-chart = График движка

js-adv-engine-chart-alt = График движка для этого прогона

js-adv-engine-file-http-error = файл движка вернул HTTP { $status }

js-adv-engine-load-failed-no-recordings = не удалось загрузить движок ({ $reason }), и записанных прогонов не найдено

js-adv-engine-loading = Загрузка движка…

js-adv-engine-loading-title = Работающий движок ещё загружается. Этот записанный результат будет заменён прогоном на работающем движке, когда он будет готов.

js-adv-engine-start-failed = Не удалось запустить движок: { $reason }. Раздайте эту папку по HTTP (например, python3 -m http.server), а не открывайте файл напрямую.

js-adv-entries-count =
    { $n ->
        [one] { $n } запись
        [few] { $n } записи
        [many] { $n } записей
       *[other] { $n } записи
    }

js-adv-export-card-title = Экспорт { $format }

js-adv-export-csv-desc = Те же байты, которые инструмент командной строки записывает как { $file }.

js-adv-export-csv-title = Таблица воспроизводимости

js-adv-export-ephemeris-checking = Проверка того, в какие форматы эфемерид можно экспортировать этот прогон…

js-adv-export-ephemeris-waiting = Экспорт эфемерид появится здесь, когда движок загрузится.

js-adv-export-json-desc = Полный вывод движка для этого прогона, включая единицы измерения и происхождение.

js-adv-export-json-title = Полный документ результата

js-adv-export-large-not-recorded = Этот экспорт велик, поэтому он не был записан. Ему нужен работающий движок.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message, сообщение об эфемеридах орбиты) для GMAT, Orekit или STK

js-adv-export-omm-desc = Каталог CCSDS OMM (Orbit Mean-elements Message, сообщение о средних элементах орбиты)

js-adv-export-report-desc = Один автономный файл: сводка, показатели с их уровнями, каждый график и точный текст сценария, с отметкой версии движка и хеша сценария.

js-adv-export-report-title = Воспроизводимый отчёт

js-adv-export-sp3-desc = Точные эфемериды SP3-c этой орбитальной группировки

js-adv-export-toml-desc = Точные входные данные этого прогона. Запустите его снова где угодно с помощью инструмента командной строки или пакетов Python и npm.

js-adv-export-toml-title = Файл сценария

js-adv-export-too-large = { $desc }. Слишком велик для записи: нужен работающий движок.

js-adv-field-find-match =
    { $n ->
        [one] Совпадает { $n } управляемый элемент и { $fields } из { $total } полей по запросу «{ $query }».
        [few] Совпадают { $n } управляемых элемента и { $fields } из { $total } полей по запросу «{ $query }».
        [many] Совпадают { $n } управляемых элементов и { $fields } из { $total } полей по запросу «{ $query }».
       *[other] Совпадают { $n } управляемых элемента и { $fields } из { $total } полей по запросу «{ $query }».
    }

js-adv-field-find-none = Ни одно поле этого сценария не соответствует «{ $query }». Поищите по всем сценариям через поиск по библиотеке.

js-adv-field-hit-in = в { $title }

js-adv-field-not-single-number = В этом сценарии это поле не одно число: измените его в исходном тексте.

js-adv-field-opened = Открыто на { $field }. Измените его, и сценарий запустится снова.

js-adv-fields-matching = Поля, соответствующие «{ $query }»

js-adv-fields-more =
    { $n ->
        [one] Ещё { $n }: уточните слова или поищите на начальном экране.
        [few] Ещё { $n }: уточните слова или поищите на начальном экране.
        [many] Ещё { $n }: уточните слова или поищите на начальном экране.
       *[other] Ещё { $n }: уточните слова или поищите на начальном экране.
    }

js-adv-fields-top-level = верхний уровень

js-adv-filter-check-tuning = проверить настройку

js-adv-filter-consistent = согласуется

js-adv-from-the-link = из ссылки

js-adv-geo-sub = { $name } · нарисовано объектов: { $shown } из { $total } · записано собственным движком

js-adv-geo-title = Экспорт GeoJSON: { $name }

js-adv-gt-note = Выделено: спутник, видимый со станции.

js-adv-gt-note-both = Выделено: спутник, видимый со станции. Пиковое возвышение { $elevation }°. Пиковый доплеровский сдвиг { $doppler } Hz.

js-adv-gt-note-doppler = Выделено: спутник, видимый со станции. Пиковый доплеровский сдвиг { $doppler } Hz.

js-adv-gt-note-elevation = Выделено: спутник, видимый со станции. Пиковое возвышение { $elevation }°.

js-adv-heatmap-label = Тепловая карта { $metric }

js-adv-hist-runs-count =
    { $n ->
        [one] { $n } прогон.
        [few] { $n } прогона.
        [many] { $n } прогонов.
       *[other] { $n } прогона.
    }

js-adv-history-pin = Закрепить

js-adv-history-restore = Восстановить

js-adv-history-run-time = прогон { $run } · { $time }

js-adv-holdover-engine-figure = Holdover движка при бюджете сценария: { $duration }

js-adv-holdover-engine-figure-budget = Holdover движка при бюджете сценария ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = ошибка после потери GNSS при t = { $loss } s

js-adv-holdover-error-since-fix = ошибка с момента последнего определения положения

js-adv-holdover-stays-inside = остаётся в пределах этого бюджета на всём протяжении записи

js-adv-holdover-until-breached = до нарушения бюджета

js-adv-honesty-modelled = Физика из первых принципов с тестами, ещё не сверенная с внешним оракулом. { $text }

js-adv-honesty-partner = Показатели, за которые отвечает партнёр. { $text }

js-adv-honesty-validated = Сверено с независимым внешним оракулом. { $text }

js-adv-increase-field = Увеличить { $field }

js-adv-install-version = Установить v{ $version }

js-adv-interop-no-file = Движок не записал для этого прогона файл такого формата.

js-adv-interop-not-applicable = К этому сценарию не применяется: { $reason }.

js-adv-interop-not-bundled = Здесь не включён (из-за размера): его записывает команда выше.

js-adv-interop-note = Движок записывает геометрию и отсчёты сигнала прогона в форматах, которые открывают другие инструменты: CZML для Cesium, KML (Keyhole Markup Language) для Google Earth, GeoJSON для карт, файлы эфемерид STK (.e) и записи SigMF (Signal Metadata Format). Сборка для браузера не содержит этих средств записи, поэтому файлы ниже — это те, которые записал собственный движок командной строки для встроенного сценария.

js-adv-js-range-label = Диапазон J/S

js-adv-js-range-value = от { $low } до { $high } dB

js-adv-json-copied = JSON скопирован.

js-adv-kind-default = вид: holdover часов (по умолчанию)

js-adv-kind-label = вид: { $kind }

js-adv-kpi-check = Проверка

js-adv-kpi-delta-since-run = { $arrow } { $change } с прогона { $run }

js-adv-kpi-fail = Не пройдено

js-adv-kpi-first-run = первый прогон

js-adv-kpi-not-in-previous = нет в вашем предыдущем прогоне

js-adv-kpi-pass = Пройдено

js-adv-lib-count-all =
    { $scenarios ->
        [one] { $scenarios } сценарий
        [few] { $scenarios } сценария
        [many] { $scenarios } сценариев
       *[other] { $scenarios } сценария
    } · { $domains ->
        [one] { $domains } область
        [few] { $domains } области
        [many] { $domains } областей
       *[other] { $domains } области
    }

js-adv-lib-count-filtered =
    { $n } из { $total ->
        [one] { $total } сценария
        [few] { $total } сценариев
        [many] { $total } сценариев
       *[other] { $total } сценариев
    }

js-adv-lib-no-match = Ни один сценарий или поле не подходит. Попробуйте слово вроде jamming, clock, lunar, orbit, mask или PDOP.

js-adv-loaded-shared = Из ссылки загружен общий сценарий.

js-adv-mask-envelope = Огибающая ошибки времени при holdover ({ $source })

js-adv-mask-exceeded-after = превышена через { $duration }

js-adv-mask-limit-label = предел { $limit } ns

js-adv-mask-max-te = макс. |TE|

js-adv-mask-not-exceeded = не превышена

js-adv-matrix-counts = { $validated } из { $total }

js-adv-matrix-line = { $counts } возможностей проверено по независимым внешним оракулам · { $modelled } вычислено по модели · { $partner } принадлежит партнёру

js-adv-max-close = Закрыть

js-adv-max-close-label = Закрыть полноэкранный режим

js-adv-max-expand = Развернуть

js-adv-max-expand-label = Развернуть эту панель на весь экран

js-adv-max-title = Показать эту панель на весь экран (Escape закрывает её)

js-adv-meta-engine = движок

js-adv-meta-file = файл

js-adv-meta-scenario = сценарий

js-adv-meta-seed = начальное значение

js-adv-meta-time = время

js-adv-mission-timeline = Хронология миссии

js-adv-native-edited-notice = { $why } Записанный прогон относится к встроенному файлу, поэтому изменённую копию здесь показать нельзя: запустите её инструментом командной строки или нажмите «Сбросить», чтобы увидеть запись.

js-adv-native-notice-command = { $why } Вы видите прогон, записанный собственным движком командной строки v{ $version } при запуске { $command }, показанный без изменений. При редактировании он не запускается заново.

js-adv-native-notice-plain = { $why } Вы видите прогон, записанный собственным движком командной строки v{ $version }, показанный без изменений. При редактировании он не запускается заново.

js-adv-native-notice-platform = { $why } Вы видите прогон, записанный собственным движком командной строки v{ $version } ({ $platform }), показанный без изменений. При редактировании он не запускается заново.

js-adv-native-notice-platform-command = { $why } Вы видите прогон, записанный собственным движком командной строки v{ $version } ({ $platform }) при запуске { $command }, показанный без изменений. При редактировании он не запускается заново.

js-adv-needs-live-engine = Для этого нужен работающий движок.

js-adv-needs-newer-engine-status = Нужен более новый движок.

js-adv-nees-line = NEES { $mean } (95-процентная полоса { $low }–{ $high }, цель 2.0)

js-adv-newer-engine-edited-notice = Этому сценарию нужен движок { $need } или новее; здесь работает движок v{ $version }. Можно показать только запись встроенного файла: нажмите «Сбросить», чтобы увидеть её, или запустите изменённую копию на движке { $need }.

js-adv-newer-engine-no-recording = Этому сценарию нужен движок { $need } или новее; здесь работает движок v{ $version }. Записи для него здесь нет.

js-adv-newer-engine-shown-commit = Этому сценарию нужен движок { $need } или новее; здесь работает движок v{ $version }. Вы видите прогон, записанный сборкой движка с коммитом { $commit }, показанный без изменений; здесь он не запускается заново.

js-adv-newer-engine-shown-version = Этому сценарию нужен движок { $need } или новее; здесь работает движок v{ $version }. Вы видите прогон, записанный движком v{ $recorded }, показанный без изменений; здесь он не запускается заново.

js-adv-nis-line = NIS { $mean } (95-процентная полоса { $low }–{ $high }, цель 1.0)

js-adv-no-guided-controls = В этом сценарии нет управляемых элементов. Используйте «Все поля» или измените исходный текст.

js-adv-no-numeric-fields = Здесь нет отдельных числовых полей для настройки. Измените исходный текст напрямую.

js-adv-no-recorded-run = Для этого сценария нет записанного прогона. Нужен работающий движок.

js-adv-no-summary = (этот сценарий не публикует краткой сводки в одну строку)

js-adv-noise-floor = уровень шумов { $level }

js-adv-not-in-browser-status = Этот сценарий не запускается в браузере.

js-adv-open-and-run = Открыть и запустить

js-adv-open-at-field = открыть на этом поле

js-adv-opened-from-simple = Открыто с параметрами, которые вы изменили в простом представлении.

js-adv-optional-preset = необязательный набор настроек: scenarios/{ $file }

js-adv-orbit-canvas-label = Интерактивное 3D-представление рассчитанной траектории

js-adv-orbit-fallback-alt = Ортографическое представление рассчитанной траектории

js-adv-orbit-note-epoch = Перетаскивайте, чтобы вращать; прокрутка или щипок масштабируют. Земля в масштабе, изображения NASA Blue Marble. Повёрнута на эпоху прогона.

js-adv-orbit-note-no-epoch = Перетаскивайте, чтобы вращать; прокрутка или щипок масштабируют. Земля в масштабе, изображения NASA Blue Marble. Этот прогон не указывает эпоху, поэтому угол вращения Земли здесь не имеет смысла.

js-adv-orbit-static-note = Статическое представление (библиотеку 3D не удалось загрузить здесь).

js-adv-pal-commands = Команды

js-adv-pal-domain = Область: { $name }

js-adv-pal-domains = Области

js-adv-pal-field = Поле: { $name }

js-adv-pal-fields = Поля

js-adv-pal-nothing = Ничего не найдено

js-adv-pal-opens-page = открывает страницу

js-adv-pal-page = Страница: { $name }

js-adv-pal-pages = Страницы

js-adv-pal-panel = Панель: { $name }

js-adv-pal-panels = Панели

js-adv-pal-scenarios = Сценарии

js-adv-params-hint-all = Каждое отдельное число сценария. Меняйте его шагами, вводите или используйте клавиши со стрелками; сценарий запустится снова.

js-adv-params-hint-guided = Перетащите ползунок, и сценарий запустится снова. Каждый элемент записывает значение прямо в текст сценария ниже.

js-adv-pin-already = Этот прогон уже закреплён.

js-adv-pin-first = Прогон { $run } закреплён. Измените параметр, запустите снова и закрепите и этот прогон.

js-adv-pin-label = { $letter } · { $title } · прогон { $run }

js-adv-pin-opening-compare = Закреплено прогонов: { $n }. Открывается сравнение.

js-adv-plan-view = Вид сверху

js-adv-plan-view-epoch = на { $epoch }

js-adv-plan-view-note = Каждая точка — тело на эпоху прогона, а каждая кривая — трасса орбиты, которую движок вычислил для него. Штриховая линия — связь, которой требует сценарий. Выберите планету, чтобы увидеть её луны.

js-adv-player-name-mission = воспроизведение миссии

js-adv-player-name-orbit = воспроизведение орбиты

js-adv-player-name-replay = воспроизведение

js-adv-player-name-waterfall = воспроизведение водопада

js-adv-player-pause = Пауза: { $name }

js-adv-player-play = Запустить: { $name }

js-adv-player-position = Позиция: { $name }

js-adv-png-download-title = Растровое изображение высокого разрешения для слайдов и документов

js-adv-png-export-failed = Не удалось экспортировать PNG: { $reason }

js-adv-ready-live = Готово. Работает локально в вашем браузере.

js-adv-ready-recorded = Готово. Показаны записанные прогоны.

js-adv-receiver-at-time = Приёмник при t = { $time }

js-adv-recorded-edit-notice = WebAssembly заблокирован на этой странице, поэтому она показывает настоящие прогоны встроенных сценариев, записанные движком v{ $version }. Изменённым сценариям, перебору и новым экспортам нужен работающий движок: откройте kshana.dev или раздайте эту папку локально. Сброс восстанавливает записанный сценарий.

js-adv-recorded-edited-warning = Вы изменили сценарий: эта запись относится к встроенному файлу, а не к вашему изменению. Выполните команду на собственном файле, чтобы получить свой результат.

js-adv-recorded-intro = WebAssembly заблокирован на этой странице, поэтому она показывает настоящие прогоны встроенных сценариев, записанные движком v{ $version }. Редактированию, перебору и новым экспортам нужен работающий движок на kshana.dev.

js-adv-recorded-run-native = записанный прогон, собственный движок

js-adv-recorded-written-by = Записано собственным движком командной строки v{ $version } ({ $platform }) командой { $command }. Показано без изменений.

js-adv-replay = Воспроизведение

js-adv-report-downloaded = Отчёт скачан.

js-adv-report-frame-title = Отчёт о прогоне, записанный движком

js-adv-report-html = Отчёт (HTML)

js-adv-report-html-title = Файл отчёта в том виде, как его записал движок

js-adv-report-load-failed = Не удалось загрузить записанный отчёт ({ $reason }).

js-adv-report-loading = Загрузка записанного отчёта…

js-adv-report-none = Для этого сценария записанного отчёта нет.

js-adv-report-note = Каждый прогон из командной строки записывает отчёт: сводку, входные данные, результаты, график, что проверено и что вычислено по модели, а также запись воспроизводимости. Сборка для браузера не содержит этого средства записи, поэтому здесь показан отчёт, который собственный движок командной строки записал для встроенного сценария. Собственный отчёт Studio о прогоне на экране находится в разделе «Экспорт».

js-adv-report-open-tab = Открыть в новой вкладке

js-adv-report-open-tab-title = Открыть отчёт отдельно

js-adv-report-orbit-title = Орбита (инерциальная геоцентрическая система, ортографическая проекция)

js-adv-report-stability-chart = Стабильность часов

js-adv-report-stability-title = Стабильность часов (девиация Аллана)

js-adv-restored-run = Восстановлен прогон { $run }.

js-adv-result = Результат

js-adv-run-cancelled = Прогон отменён.

js-adv-run-cancelled-previous = Прогон отменён. По-прежнему показан предыдущий результат.

js-adv-run-failed = Прогон не удался. См. сообщение в результатах.

js-adv-scenario-copied = Сценарий скопирован.

js-adv-scenarios-count =
    { $n ->
        [one] { $n } сценарий
        [few] { $n } сценария
        [many] { $n } сценариев
       *[other] { $n } сценария
    }

js-adv-share-link-copied = Ссылка для общего доступа скопирована. Она содержит точный сценарий.

js-adv-share-link-in-bar = Ссылка помещена в адресную строку.

js-adv-shared-link = общая ссылка

js-adv-shared-needs-live = Эта ссылка содержит собственный сценарий, которому нужен работающий движок. Откройте её на kshana.dev.

js-adv-shared-scenario = Общий сценарий

js-adv-shared-scenario-question = Сценарий, открытый по общей ссылке. Он запускается ровно так, как им поделились.

js-adv-solar-bodies-label = Какие тела рисовать

js-adv-spectrum-part-label = Какая часть спектра

js-adv-spectrum-row-note = Спектр вдоль строки водопада, на которой находится воспроизведение.

js-adv-spectrum-row-title = Спектр вдоль показанной строки

js-adv-start-field-meta = { $domain } · поле { $field }

js-adv-start-fields-hint = Каждое открывает сценарий с выделенным элементом, готовым к изменению.

js-adv-start-fields-named =
    { $n ->
        [one] Поля с именем, похожим на «{ $query }»: в { $n } сценарии
        [few] Поля с именем, похожим на «{ $query }»: в { $n } сценариях
        [many] Поля с именем, похожим на «{ $query }»: в { $n } сценариях
       *[other] Поля с именем, похожим на «{ $query }»: в { $n } сценариях
    }

js-adv-start-more-matches = Ещё совпадений: { $n }. Добавьте слово, чтобы сузить их.

js-adv-start-nothing = Ничего не соответствует «{ $query }». Попробуйте слово вроде jamming, clock, lunar, orbit, mask или PDOP.

js-adv-start-scenarios-count = Сценарии ({ $count })

js-adv-status-fetching-recorded = Загрузка движка… Получение записанного результата этого сценария.

js-adv-status-ran-locally = Выполнено локально в { $time }, прогон { $run }.

js-adv-status-ran-locally-secs = Выполнено локально в { $time }, прогон { $run }, { $secs } s.

js-adv-status-recorded-native = Показан записанный прогон в { $time } (собственный движок).

js-adv-status-recorded-needs-engine = Показан записанный прогон в { $time } (нужен движок { $need }).

js-adv-status-recorded-shown = Показан записанный прогон в { $time }, прогон { $run }.

js-adv-status-recorded-shown-secs = Показан записанный прогон в { $time }, прогон { $run }, { $secs } s.

js-adv-status-showing-recorded = Загрузка движка… Показан записанный результат этого сценария, пока работающий движок не будет готов.

js-adv-subtabs-label = Плитки этого представления (телефон)

js-adv-suggest-campaign = Воспроизвести миссию с подавлением, спуфингом и holdover

js-adv-suggest-coverage = Построить карту покрытия четырёх орбитальных группировок GNSS (глобальных навигационных спутниковых систем)

js-adv-suggest-holdover = Удержание времени при потере GNSS

js-adv-suggest-waterfall = Наблюдать источник подавления на водопаде диапазона L

js-adv-svg-download-title = Векторный график с заголовком и происхождением

js-adv-sweep-cancelled = Перебор отменён.

js-adv-sweep-done-grid = Перебрано прогонов: { $total } ({ $columns } × { $rows }), локально за { $time }.

js-adv-sweep-done-line = Перебрано прогонов: { $done } из { $total }, локально за { $time }.

js-adv-sweep-enter-range = Введите числовой диапазон.

js-adv-sweep-enter-range-second = Введите числовой диапазон для второго параметра.

js-adv-sweep-failed = Перебор не удался: { $reason }

js-adv-sweep-interrupted = Перебор прерван новым прогоном.

js-adv-sweep-needs-live = Перебор запускает движок много раз, поэтому ему нужен работающий движок.

js-adv-sweep-none-line-chart = Нет (линейный график)

js-adv-sweep-nothing = Для этого сценария нечего перебирать.

js-adv-sweep-progress = Перебор: прогон { $n } из { $total }…

js-adv-sweep-status-done = Перебрано прогонов: { $total }, в { $time }.

js-adv-sweep-title-grid = { $metric }: { $first } и { $second }

js-adv-sweep-title-line = { $metric } в зависимости от { $parameter }

js-adv-sweep-wait = Дождитесь завершения текущего прогона, затем запустите перебор.

js-adv-tab-animation = Анимация

js-adv-tab-compare = Сравнение

js-adv-tab-engine-report = Отчёт движка

js-adv-tab-exports-report = Экспорт и отчёт

js-adv-tab-ground-track = Трасса на поверхности

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = 3D-орбита

js-adv-tab-overview = Обзор

js-adv-tab-signal-band = Сигнал и полоса

js-adv-tab-stability = Стабильность

js-adv-tab-sweep = Перебор

js-adv-tab-time-series = Временной ряд

js-adv-tab-timing-masks = Маски синхронизации

js-adv-th-at-tau-or-time = При τ или времени

js-adv-th-body = Тело

js-adv-th-clock = Часы

js-adv-th-distance-sun = Расстояние от Солнца

js-adv-th-figure = Показатель

js-adv-th-file = Файл

js-adv-th-format = Формат

js-adv-th-key-figure = Ключевой показатель

js-adv-th-light-time-from = Время прохождения света в одну сторону от { $observer }

js-adv-th-light-time-observer = Время прохождения света в одну сторону от наблюдателя

js-adv-th-limit = Предел

js-adv-th-margin = Запас

js-adv-th-mask-or-budget = Маска или бюджет

js-adv-th-metric = Метрика

js-adv-th-orbital-period = Орбитальный период

js-adv-th-provenance = Происхождение

js-adv-th-size = Размер

js-adv-th-source = Источник

js-adv-th-tier = Уровень

js-adv-th-unit = Единица

js-adv-th-value = Значение

js-adv-th-verdict = Вердикт

js-adv-th-what-it-is = Что это

js-adv-the-body = тело

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } сценарий
        [few] { $n } сценария
        [many] { $n } сценариев
       *[other] { $n } сценария
    }

js-adv-timeline-chart-title = Хронология миссии: { $title }

js-adv-timeline-latest-event = Последнее событие, в { $time }: { $label }

js-adv-timeline-no-event = К этому моменту событий ещё нет.

js-adv-timeline-note = Один ползунок управляет каждым графиком ниже. Каждая фаза запускает обычные сценарии; кампания считывает их выходные данные на одну временную сетку. Закрашенные полосы — фазы, вертикальные линии — события. Значения выше — каналы кампании в момент воспроизведения.

js-adv-timeline-on-one-clock = { $duration } по одним часам

js-adv-timeline-phase = Фаза: { $phase }

js-adv-tour-back = Назад

js-adv-tour-done = Готово

js-adv-tour-eyebrow = Экскурсия

js-adv-tour-headline-body = Краткая сводка в одну строку, версия движка и отпечаток сценария, а также то, проверен ли каждый показатель или вычислен по модели.

js-adv-tour-headline-title = Прочитайте ответ

js-adv-tour-keyboard-body = ⌘K находит любой сценарий, представление или команду. [ и ] переключают представления.

js-adv-tour-keyboard-title = Всё с клавиатуры

js-adv-tour-library-body = Каждый встроенный сценарий, сгруппированный по областям миссий: подавление, спектр, спуфинг, часы, навигация, целостность, орбиты, проектирование орбитальных группировок, навигация на низкой околоземной орбите, кампании, Луна, Марс и Солнечная система. Поиск — клавиша /.

js-adv-tour-library-title = Выберите миссию

js-adv-tour-next = Далее

js-adv-tour-params-body = Управляемые ползунки для основных ручек настройки или каждое числовое поле сценария. Каждое изменение запускает сценарий снова.

js-adv-tour-params-title = Настройте

js-adv-tour-pin-body = Закрепите до четырёх прогонов и сравните их рядом, с разностями и кривой различия.

js-adv-tour-pin-title = Сравнение прогонов

js-adv-tour-run-body = Движок на Rust работает в вашем браузере как WebAssembly. Ничего не отправляется. ⌘↵ запускает из любого места.

js-adv-tour-run-title = Запустите локально

js-adv-tour-share-body = Скачайте отчёт, результат, сценарий и экспорты движка или скопируйте ссылку с точным сценарием либо iframe для страницы курса или вики.

js-adv-tour-share-title = Поделиться или экспортировать

js-adv-tour-skip = Пропустить

js-adv-tour-source-body = Полный сценарий в TOML. То, что вы запускаете, — это в точности то, чем можно поделиться и что можно воспроизвести.

js-adv-tour-source-title = Или измените что угодно

js-adv-tour-tabs-body = Представления появляются, когда их поддерживает результат: сигнал и полоса для подавления, водопад для спектра, хронология миссии для кампаний, карты покрытия для орбитальных группировок, holdover для часов, маски для телекоммуникационной синхронизации, 3D-орбиты, трассы на поверхности, переборы, а также собственные анимация и отчёт движка.

js-adv-tour-tabs-title = Каждое представление прогона

js-adv-tracking-threshold-value = Порог слежения { $value }

js-adv-transport-label = Воспроизведение: один ползунок управляет каждой панелью этого прогона

js-adv-transport-sub = один ползунок управляет каждой панелью этого прогона

js-adv-unpin-run = Снять закрепление прогона { $run }

js-adv-waterfall = Водопад

js-adv-waterfall-note = Цвет — это мощность выше уровня шумов приёмника. Навигационные сигналы лежат ниже этого уровня, поэтому светятся источники подавления. Запустите воспроизведение или перетащите ползунок, и полосы справа покажут, что приёмник всё ещё отслеживает в этот момент.

js-adv-waterfall-sub = спектральная плотность мощности: частота по горизонтали, время вниз

js-adv-waterfall-title = Водопад, { $name }

js-adv-webassembly-unavailable = WebAssembly недоступен

js-app-all-questions = Все вопросы

js-app-anim-frame-title = Анимация этого прогона, записанная движком

js-app-anim-html-player = Проигрыватель HTML

js-app-anim-html-player-title = Проигрыватель в одном файле, в том виде, как его записал движок

js-app-anim-load-failed = Не удалось загрузить записанную анимацию ({ $reason }).

js-app-anim-loading = Загрузка записанной анимации…

js-app-anim-none = Для этого сценария записанной анимации нет.

js-app-anim-note = Движок записывает анимацию любого прогона, у которого есть ось времени: самовоспроизводящийся SVG и проигрыватель HTML в одном файле с собственными элементами воспроизведения и перемотки. Сборка для браузера не содержит этого средства записи, поэтому здесь показан файл, который записал собственный движок командной строки для встроенного сценария.

js-app-anim-svg = Анимированный SVG

js-app-anim-svg-title = Самовоспроизводящийся SVG, в том виде, как его записал движок

js-app-axis-averaging-time = время усреднения τ (s)

js-app-axis-observation-interval = интервал наблюдения τ (s)

js-app-axis-value = значение

js-app-badge-modelled = вычислено по модели: { $n }

js-app-badge-recorded = Запись

js-app-badge-validated = проверено: { $n }

js-app-band-carrier = Несущая

js-app-band-carrier-unset = не задана в этом сценарии

js-app-band-chip-rate = Частота чипов

js-app-band-jammer-bandwidth = Полоса источника подавления

js-app-band-jammer-mhz = источник подавления { $mhz } MHz

js-app-band-jammer-power = Мощность источника подавления

js-app-band-jammer-type = Тип источника подавления

js-app-band-main-lobe = главный лепесток сигнала

js-app-band-no-carrier-note = Движок вычисляет отношение мощности помехи к мощности сигнала по бюджету линии связи. Этот сценарий не называет частоту несущей, поэтому спектр не рисуется.

js-app-band-satellites = Спутники

js-app-band-svg-label = Полосы сигнала и источника подавления вокруг несущей

js-app-band-tracking-threshold = Порог слежения

js-app-browse-all-title = Все сценарии: { $n }

js-app-browse-area-kicker =
    { $n ->
        [one] Область · { $n } сценарий
        [few] Область · { $n } сценария
        [many] Область · { $n } сценариев
       *[other] Область · { $n } сценария
    }

js-app-browse-area-lede = Выберите один: он сразу открывается на своём результате.

js-app-browse-evidence = Для методов движка, которые запускают его сценарии, в матрице верификации строк со статусом «проверено»: { $validated }, «вычислено по модели»: { $modelled }.

js-app-browse-evidence-title = Доказательства по этой области.

js-app-browse-kicker = Обзор

js-app-browse-lede = Найдите или выберите область. Каждый сценарий сразу открывается на своём результате.

js-app-browse-validated-examples = Проверено, например: { $examples }.

js-app-browser-cannot-run = Сборка для браузера не может запустить этот сценарий.

js-app-btn-all-exports = Весь экспорт

js-app-btn-all-exports-title = Каждый экспорт этого прогона, включая собственные форматы движка

js-app-btn-compare-pinned = Сравнить закреплённые прогоны

js-app-btn-copy-embed = Скопировать код для встраивания

js-app-btn-copy-link = Скопировать ссылку на этот точный сценарий

js-app-btn-figure-png = Рисунок (PNG)

js-app-btn-figure-png-title = График на экране в виде растрового изображения высокого разрешения

js-app-btn-figure-svg = Рисунок (SVG)

js-app-btn-figure-svg-title = График на экране с заголовком, версией движка и DOI

js-app-btn-pin-compare = Закрепить этот прогон для сравнения

js-app-btn-pin-count = Закрепить этот прогон (закреплено: { $n })

js-app-btn-report-html = Воспроизводимый отчёт (HTML)

js-app-btn-report-html-title = Один автономный файл: сводка, показатели с уровнями, графики и точный сценарий

js-app-btn-result-json = Данные результата (JSON)

js-app-btn-result-json-title = Полный вывод движка для этого прогона

js-app-btn-run-history = История прогонов

js-app-btn-scenario-toml = Файл сценария (TOML)

js-app-btn-scenario-toml-title = Точные входные данные этого прогона

js-app-btn-table-csv = Таблица (CSV)

js-app-btn-table-csv-title = Те же байты, которые инструмент командной строки записывает как { $file }

js-app-bytes =
    { $n ->
        [one] { $n } байт
        [few] { $n } байта
        [many] { $n } байт
       *[other] { $n } байта
    }

js-app-cap-sub = Областей: { $areas }, готовых к запуску сценариев: { $total }. Каждая область показывает настоящий записанный результат и состав доказательств за ним: долю методов её движка, проверенных по внешнему эталону.

js-app-chain-hint = выход каждого этапа питает следующий

js-app-chain-note = Одна система, прослеженная через все этапы движка. В таблице ниже перечислено каждое число, которое вычислил один этап и использовал следующий.

js-app-chain-stage = Этап { $n }

js-app-chain-values-handed =
    { $n ->
        [one] Передано дальше: { $n } значение
        [few] Передано дальше: { $n } значения
        [many] Передано дальше: { $n } значений
       *[other] Передано дальше: { $n } значения
    }

js-app-chart-allan-deviation = Девиация Аллана

js-app-chart-cn0-by-satellite = Эффективное C/N0 по спутникам

js-app-chart-default-title = График Kshana

js-app-chart-ground-track = Трасса на поверхности

js-app-chart-holdover-title = Holdover относительно бюджета времени

js-app-chart-mtie-title = MTIE (максимальная ошибка временного интервала)

js-app-chart-not-drawn = Не удалось построить этот график.

js-app-chart-scenario-hash = сценарий { $hash }

js-app-chart-stability-title = Стабильность часов (перекрывающаяся девиация Аллана)

js-app-chart-tdev-title = TDEV (девиация времени)

js-app-chip-failed-title = WebAssembly не удалось запустить здесь. Показаны настоящие записанные прогоны встроенных сценариев.

js-app-chip-failed-title-reason = WebAssembly не удалось запустить здесь ({ $reason }). Показаны настоящие записанные прогоны встроенных сценариев.

js-app-chip-live = Работающий движок · v{ $version }

js-app-chip-live-title = Движок Kshana работает в этом браузере как WebAssembly

js-app-chip-loading = Загрузка движка

js-app-chip-loading-title = Движок загружается. Пока показываются записанные результаты.

js-app-chip-recorded = Записанные прогоны · v{ $version }

js-app-chip-unavailable = Движок недоступен

js-app-cli-note = Установите командой { $command }. Прогон записывает { $file }, график и отчёт.

js-app-cli-only-title = Этот сценарий запускается в командной строке, а не в браузере.

js-app-cli-save-comment = # сохраните файл сценария ниже как { $file }, затем

js-app-cmd-advanced = Показать все параметры (расширенные настройки)

js-app-cmd-browse = Обзор всех сценариев

js-app-cmd-compare = Сравнить закреплённые прогоны

js-app-cmd-embed = Скопировать код для встраивания

js-app-cmd-exports = Скачать результаты (экспорт)

js-app-cmd-history = Открыть историю прогонов

js-app-cmd-home = Перейти на начальный экран

js-app-cmd-how = Как это вычисляется

js-app-cmd-pin = Закрепить этот прогон для сравнения

js-app-cmd-report = Скачать отчёт

js-app-cmd-research = Код, данные и цитирование (для исследователей)

js-app-cmd-reset = Сбросить текст сценария

js-app-cmd-run = Запустить сценарий

js-app-cmd-share = Скопировать ссылку для общего доступа

js-app-cmd-theme = Переключить светлую или тёмную тему

js-app-cmd-tour = Начать экскурсию

js-app-compare-deltas = Разности даны относительно прогона A. Зелёным отмечено лучшее значение для каждого показателя.

js-app-compare-none = У этих прогонов нет сопоставимых показателей качества. Закрепите прогоны одного семейства сценариев, чтобы увидеть числа и разности.

js-app-compare-pin-two = Закрепите не менее двух прогонов, чтобы сравнить их рядом. Закрепите прогон, измените параметр или выберите другой сценарий того же семейства, запустите его и закрепите снова.

js-app-compare-run-head = { $letter } · прогон { $id }

js-app-coverage-cell-note = Каждая ячейка — одна точка сетки на { $body }, оценённая по каждой эпохе прогона.

js-app-coverage-dots-of = из

js-app-coverage-dots-post = спутников, пролетающих вдоль своих трасс на поверхности; запустите воспроизведение, чтобы они двигались.

js-app-coverage-dots-pre = Точки — это

js-app-coverage-field-label = Поле для карты

js-app-coverage-map = Карта покрытия

js-app-coverage-map-select = Карта

js-app-coverage-over = над

js-app-coverage-title = { $field } над { $body }

js-app-crumb-all-scenarios = Все сценарии

js-app-crumb-area = Область

js-app-crumb-search = Поиск: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Скачать

js-app-edited-cli-only = Изменено: этот сценарий работает только в движке командной строки.

js-app-edited-needs-engine = Изменено: нужен движок { $need }.

js-app-edited-needs-live = Изменённым сценариям нужен работающий движок.

js-app-embed-copied = Код для встраивания скопирован.

js-app-engine-chart = График движка

js-app-engine-chart-alt = График движка для этого прогона

js-app-engine-could-not-start = Не удалось запустить движок: { $reason }. Раздайте эту папку по HTTP (например, { $command }), а не открывайте файл напрямую.

js-app-engine-failed = Не удалось загрузить движок ({ $reason }).

js-app-engine-file-http = Файл движка вернул HTTP { $status }.

js-app-engine-no-recordings = Не удалось загрузить движок ({ $reason }), и записанных прогонов не найдено.

js-app-entries-count =
    { $n ->
        [one] { $n } запись
        [few] { $n } записи
        [many] { $n } записей
       *[other] { $n } записи
    }

js-app-ev-aria = Строк матрицы верификации: проверено — { $validated }, вычислено по модели — { $modelled }

js-app-ev-title = Строки матрицы верификации: проверено — { $validated } · вычислено по модели — { $modelled }

js-app-ev-validated = проверено

js-app-export-card-title = Экспорт { $format }

js-app-export-checking = Проверка того, в какие форматы эфемерид можно экспортировать этот прогон…

js-app-export-csv-desc = Те же байты, которые инструмент командной строки записывает как { $file }.

js-app-export-csv-title = Таблица воспроизводимости

js-app-export-engine-loading = Экспорт эфемерид появится здесь, когда движок загрузится.

js-app-export-json-desc = Полный вывод движка для этого прогона, включая единицы измерения и происхождение.

js-app-export-json-title = Полный документ результата

js-app-export-not-recorded = Этот экспорт велик, поэтому он не был записан. Ему нужен работающий движок.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message, сообщение об эфемеридах орбиты) для GMAT, Orekit или STK

js-app-export-omm-desc = Каталог CCSDS OMM (Orbit Mean-elements Message, сообщение о средних элементах орбиты)

js-app-export-report-desc = Один автономный файл: сводка, показатели с их уровнями, каждый график и точный текст сценария, с отметкой версии движка и хеша сценария.

js-app-export-report-title = Воспроизводимый отчёт

js-app-export-sp3-desc = Точные эфемериды SP3-c этой орбитальной группировки

js-app-export-toml-desc = Точные входные данные этого прогона. Запустите его снова где угодно с помощью инструмента командной строки или пакетов Python и npm.

js-app-export-toml-title = Файл сценария

js-app-export-too-large = { $desc }. Слишком велик для записи: нужен работающий движок.

js-app-fields-more = ещё { $n }

js-app-fields-none = нет

js-app-fields-none-hint = Других отдельных чисел для изменения здесь нет. Измените файл в разделе «Для исследователей».

js-app-fields-top-of-file = начало файла

js-app-find-matches =
    { $n ->
        [one] Совпадает { $n } управляемый элемент и { $m } из { $total } полей по запросу «{ $query }».
        [few] Совпадают { $n } управляемых элемента и { $m } из { $total } полей по запросу «{ $query }».
        [many] Совпадают { $n } управляемых элементов и { $m } из { $total } полей по запросу «{ $query }».
       *[other] Совпадают { $n } управляемых элемента и { $m } из { $total } полей по запросу «{ $query }».
    }

js-app-find-none = Ни одно поле этого сценария не соответствует «{ $query }». Поищите по всем сценариям через поиск по библиотеке.

js-app-geo-sub = { $name } · нарисовано объектов: { $features } из { $total } · записано собственным движком

js-app-geojson-title = Экспорт GeoJSON: { $name }

js-app-gt-highlighted = Выделено: спутник, видимый со станции.

js-app-gt-peak-doppler = Пиковый доплеровский сдвиг { $value } Hz.

js-app-gt-peak-elevation = Пиковое возвышение { $value }°.

js-app-health-check-tuning = проверить настройку

js-app-health-consistent = согласуется

js-app-health-nees-band = NEES { $mean } (95-процентная полоса { $lo }–{ $hi }, цель 2.0)

js-app-health-nis-band = NIS { $mean } (95-процентная полоса { $lo }–{ $hi }, цель 1.0)

js-app-heat-map-label = Тепловая карта { $metric }

js-app-hero-clock = { $elapsed } из { $total }

js-app-hero-mask = маска возвышения { $deg }°

js-app-hero-places =
    { $n ->
        [one] { $n } место
        [few] { $n } места
        [many] { $n } мест
       *[other] { $n } места
    }

js-app-hero-positions-only = Только положения спутников: без мощности сигнала, исправности спутников и рельефа.

js-app-hero-ramp = от { $lo } до { $hi } { $field }

js-app-hero-ramp-over = от { $lo } до { $hi } { $field } за { $duration }

js-app-hero-recorded-bare = Записанный результат

js-app-hero-satellites =
    { $n ->
        [one] { $n } спутник
        [few] { $n } спутника
        [many] { $n } спутников
       *[other] { $n } спутника
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } временной шаг
        [few] { $n } временных шага
        [many] { $n } временных шагов
       *[other] { $n } временных шага
    }

js-app-hist-runs =
    { $n ->
        [one] { $n } прогон.
        [few] { $n } прогона.
        [many] { $n } прогонов.
       *[other] { $n } прогона.
    }

js-app-history-pin = Закрепить

js-app-history-restore = Восстановить

js-app-history-restored = Восстановлен прогон { $id }.

js-app-history-run = прогон { $id } · { $time }

js-app-hit-in-scenario = в { $title }

js-app-hit-native-note = записанный прогон, собственный движок

js-app-hit-setting-meta = { $area } · параметр { $name }

js-app-ho-budget = бюджет

js-app-ho-engine-budget = Holdover движка при бюджете сценария ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Holdover движка при бюджете сценария: { $duration }

js-app-ho-error-after-loss = ошибка после потери GNSS при t = { $t } s

js-app-ho-error-since-fix = ошибка с момента последнего определения положения

js-app-ho-stays-inside = остаётся в пределах этого бюджета на всём протяжении записи

js-app-ho-until-breached = до нарушения бюджета

js-app-hover-classical = классический

js-app-hover-quantum = квантовый

js-app-how-checks = (проверяет: { $requirement })

js-app-how-matrix = Для методов движка, которые запускает этот сценарий, в матрице верификации строк со статусом «проверено» — { $validated }, «вычислено по модели» — { $modelled }:

js-app-how-matrix-partner = Для методов движка, которые запускает этот сценарий, в матрице верификации строк со статусом «проверено» — { $validated }, «вычислено по модели» — { $modelled }, а принадлежащих партнёрам — { $partner }:

js-app-how-mix-chip = проверено: { $validated } · вычислено по модели: { $modelled }

js-app-how-more-notes =
    { $n ->
        [one] Ещё { $n } заметка из файла сценария
        [few] Ещё { $n } заметки из файла сценария
        [many] Ещё { $n } заметок из файла сценария
       *[other] Ещё { $n } заметки из файла сценария
    }

js-app-how-more-rows =
    { $n ->
        [one] Ещё { $n } строка в матрице верификации (страница «Доказательства» сайта).
        [few] Ещё { $n } строки в матрице верификации (страница «Доказательства» сайта).
        [many] Ещё { $n } строк в матрице верификации (страница «Доказательства» сайта).
       *[other] Ещё { $n } строки в матрице верификации (страница «Доказательства» сайта).
    }

js-app-how-no-header = В файле этого сценария нет вводной заметки. Сводка движка ниже говорит, что было запущено.

js-app-how-no-matrix-row = Ни одна строка матрицы верификации пока не называет вид движка этого сценария.

js-app-how-no-sources = Файл сценария не ссылается ни на один источник, и ни одна проверенная строка матрицы не охватывает его вид.

js-app-how-own-label = Собственная метка этого прогона: { $label }

js-app-how-per-figure = По показателям, из блока figure_tiers движка: проверено — { $validated }, вычислено по модели — { $modelled }. Уровень каждого показателя указан в представлении «Обзор».

js-app-install-copy = Скопировать: { $command }

js-app-install-label = Установить v{ $version }

js-app-interop-no-file = Движок не записал для этого прогона файл такого формата.

js-app-interop-not-apply = К этому сценарию не применяется: { $reason }.

js-app-interop-not-bundled = Здесь не включён (из-за размера): его записывает команда выше.

js-app-interop-note = Движок записывает геометрию и отсчёты сигнала прогона в форматах, которые открывают другие инструменты: CZML для Cesium, KML (Keyhole Markup Language) для Google Earth, GeoJSON для карт, файлы эфемерид STK (.e) и записи SigMF (Signal Metadata Format). Сборка для браузера не содержит этих средств записи, поэтому файлы ниже — это те, которые записал собственный движок командной строки для встроенного сценария.

js-app-job-running = Выполняется

js-app-job-sweeping = Перебор

js-app-js-range-label = Диапазон J/S

js-app-js-range-value = от { $lo } до { $hi } dB

js-app-latest-event-at = Последнее событие, в

js-app-legend-all = возможностей движка проверены по всей матрице верификации; { $modelled } вычислены по модели, { $partner } принадлежат партнёрам.

js-app-legend-count = { $validated } из { $total }

js-app-load-failed = Не удалось загрузить { $file }.

js-app-mask-envelope = Огибающая ошибки времени при holdover ({ $source })

js-app-mask-exceeded-after = превышена через { $duration }

js-app-mask-limit = предел { $value } ns

js-app-mask-not-exceeded = не превышена

js-app-meta-engine = движок

js-app-meta-file = файл

js-app-meta-scenario = сценарий

js-app-meta-seed = начальное значение

js-app-meta-shared-link = общая ссылка

js-app-meta-time = время

js-app-mission-timeline = Хронология миссии

js-app-native-edited-notice = Записанный прогон относится к встроенному файлу, поэтому изменённую копию здесь показать нельзя: запустите её инструментом командной строки или нажмите «Сбросить», чтобы увидеть запись.

js-app-native-recorded = Вы видите прогон, записанный собственным движком командной строки v{ $version }, показанный без изменений. При редактировании он не запускается заново.

js-app-native-recorded-c = Вы видите прогон, записанный собственным движком командной строки v{ $version } при запуске { $command }, показанный без изменений. При редактировании он не запускается заново.

js-app-native-recorded-p = Вы видите прогон, записанный собственным движком командной строки v{ $version } ({ $platform }), показанный без изменений. При редактировании он не запускается заново.

js-app-native-recorded-pc = Вы видите прогон, записанный собственным движком командной строки v{ $version } ({ $platform }) при запуске { $command }, показанный без изменений. При редактировании он не запускается заново.

js-app-needs-live-engine = Для этого нужен работающий движок.

js-app-needs-newer-engine = Нужен более новый движок.

js-app-needs-newer-why = Этому сценарию нужен движок { $need } или новее; здесь работает движок v{ $version }.

js-app-no-chart-export = В этом представлении нет графика для экспорта.

js-app-no-event-yet = К этому моменту событий ещё нет.

js-app-no-recorded-run = Для этого сценария нет записанного прогона. Нужен работающий движок.

js-app-no-recording-here = Записи для него здесь нет.

js-app-no-summary = (этот сценарий не публикует краткой сводки в одну строку)

js-app-noise-floor = уровень шумов { $value }

js-app-not-in-browser = Этот сценарий не запускается в браузере.

js-app-notice-shared-needs-live = Эта ссылка содержит собственный сценарий, которому нужен работающий движок. Откройте её на kshana.dev.

js-app-on-one-clock = по одним часам

js-app-only-bundled-recording = Можно показать только запись встроенного файла: нажмите «Сбросить», чтобы увидеть её, или запустите изменённую копию на движке { $need }.

js-app-opening-result = Открытие результата…

js-app-orbit-canvas-label = Интерактивное 3D-представление рассчитанной траектории

js-app-orbit-epoch-set = Повёрнута на эпоху прогона.

js-app-orbit-epoch-unset = Этот прогон не указывает эпоху, поэтому угол вращения Земли здесь не имеет смысла.

js-app-orbit-img-alt = Ортографическое представление рассчитанной траектории

js-app-orbit-note = Перетаскивайте, чтобы вращать; прокрутка или щипок масштабируют. Земля в масштабе, изображения NASA Blue Marble.

js-app-orbit-static = Статическое представление (библиотеку 3D не удалось загрузить здесь).

js-app-overlay-note = Сплошные линии — прогон A, штриховые — прогон B, на одних и тех же осях.

js-app-overlay-pinned = Наложение закреплённых прогонов

js-app-overlay-title = { $title }: прогон { $a } (A) в сравнении с прогоном { $b } (B)

js-app-overlay-with-diff = Наложение с разностью B − A

js-app-pal-area = Область: { $label }

js-app-pal-nothing = Ничего не найдено

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } сценарий
        [few] { $n } сценария
        [many] { $n } сценариев
       *[other] { $n } сценария
    }

js-app-pal-sec-areas = Области

js-app-pal-sec-commands = Команды

js-app-pal-sec-scenarios = Сценарии

js-app-pal-sec-settings = Параметры

js-app-pal-sec-views = Представления

js-app-pal-setting = Параметр: { $label }

js-app-pal-view = Представление: { $label }

js-app-panel-close = Закрыть

js-app-panel-close-full = Закрыть полноэкранный режим

js-app-panel-expand = Развернуть

js-app-panel-expand-full = Развернуть эту панель на весь экран

js-app-panel-expand-title = Показать эту панель на весь экран (Escape закрывает её)

js-app-params-hint = Измените значение и запустите снова. Ответ и график обновятся на месте.

js-app-phase = Фаза:

js-app-pin-already = Этот прогон уже закреплён.

js-app-pin-compare = Закреплено прогонов: { $n }. Открывается сравнение.

js-app-pin-first = Прогон { $id } закреплён. Измените параметр, запустите снова и закрепите и этот прогон.

js-app-pin-label = { $letter } · { $title } · прогон { $id }

js-app-plan-view = Вид сверху

js-app-plan-view-at = на

js-app-player-pause = Пауза: воспроизведение

js-app-player-pause-mission = Пауза: воспроизведение миссии

js-app-player-pause-orbit = Пауза: воспроизведение орбиты

js-app-player-pause-waterfall = Пауза: воспроизведение водопада

js-app-player-play = Запустить: воспроизведение

js-app-player-play-mission = Запустить: воспроизведение миссии

js-app-player-play-orbit = Запустить: воспроизведение орбиты

js-app-player-play-waterfall = Запустить: воспроизведение водопада

js-app-player-position = Позиция: воспроизведение

js-app-player-position-mission = Позиция: воспроизведение миссии

js-app-player-position-orbit = Позиция: воспроизведение орбиты

js-app-player-position-waterfall = Позиция: воспроизведение водопада

js-app-png-button-title = Растровое изображение высокого разрешения для слайдов и документов

js-app-png-export-failed = Не удалось экспортировать PNG: { $reason }

js-app-py-note = Установите командой { $command }.

js-app-ran-locally = Выполнено локально в { $time }, прогон { $n }.

js-app-ran-locally-took = Выполнено локально в { $time }, прогон { $n }, { $took } s.

js-app-receiver-at = Приёмник при t =

js-app-recorded-edit-notice = WebAssembly заблокирован на этой странице, поэтому она показывает настоящие прогоны встроенных сценариев, записанные движком v{ $version }. Изменённым сценариям, перебору и новым экспортам нужен работающий движок: откройте kshana.dev или раздайте эту папку локально. Сброс восстанавливает записанный сценарий.

js-app-recorded-intro = WebAssembly заблокирован на этой странице, поэтому она показывает настоящие прогоны встроенных сценариев, записанные движком v{ $version }. Редактированию, перебору и новым экспортам нужен работающий движок на kshana.dev.

js-app-recorded-shown-native = Показан записанный прогон в { $time } (собственный движок).

js-app-recorded-shown-needs = Показан записанный прогон в { $time } (нужен движок { $need }).

js-app-recorded-shown-run = Показан записанный прогон в { $time }, прогон { $n }.

js-app-recorded-shown-took = Показан записанный прогон в { $time }, прогон { $n }, { $took } s.

js-app-recorded-with-commit = Вы видите прогон, записанный сборкой движка с коммитом { $commit }, показанный без изменений; здесь он не запускается заново.

js-app-recorded-with-engine = Вы видите прогон, записанный движком v{ $version }, показанный без изменений; здесь он не запускается заново.

js-app-recording-edited-warning = Вы изменили сценарий: эта запись относится к встроенному файлу, а не к вашему изменению. Выполните команду на собственном файле, чтобы получить свой результат.

js-app-replay = Воспроизведение

js-app-report-downloaded = Отчёт скачан.

js-app-report-frame-title = Отчёт о прогоне, записанный движком

js-app-report-html = Отчёт (HTML)

js-app-report-html-title = Файл отчёта в том виде, как его записал движок

js-app-report-load-failed = Не удалось загрузить записанный отчёт ({ $reason }).

js-app-report-loading = Загрузка записанного отчёта…

js-app-report-none = Для этого сценария записанного отчёта нет.

js-app-report-note = Каждый прогон из командной строки записывает отчёт: сводку, входные данные, результаты, график, что проверено и что вычислено по модели, а также запись воспроизводимости. Сборка для браузера не содержит этого средства записи, поэтому здесь показан отчёт, который собственный движок командной строки записал для встроенного сценария. Собственный отчёт Studio о прогоне на экране находится в разделе «Экспорт».

js-app-report-open-tab = Открыть в новой вкладке

js-app-report-open-tab-title = Открыть отчёт отдельно

js-app-report-orbit-title = Орбита (инерциальная геоцентрическая система, ортографическая проекция)

js-app-report-stability-short = Стабильность часов

js-app-report-stability-title = Стабильность часов (девиация Аллана)

js-app-run-again = Запустить снова

js-app-run-cancelled = Прогон отменён.

js-app-run-cancelled-previous = Прогон отменён. По-прежнему показан предыдущий результат.

js-app-run-failed = Прогон не удался. См. сообщение в результатах.

js-app-run-when-ready = Запустить, когда движок будет готов

js-app-run-will-run = Запустится, когда движок будет готов

js-app-run-with-settings = Запустить с этими параметрами

js-app-search-more-matches =
    { $n ->
        [one] Ещё совпадений: { $n }. Добавьте слово, чтобы сузить их.
        [few] Ещё совпадений: { $n }. Добавьте слово, чтобы сузить их.
        [many] Ещё совпадений: { $n }. Добавьте слово, чтобы сузить их.
       *[other] Ещё совпадений: { $n }. Добавьте слово, чтобы сузить их.
    }

js-app-search-nothing = Ничего не соответствует «{ $query }». Попробуйте слово вроде jamming, clock, lunar, orbit, mask или PDOP.

js-app-search-scenarios = Сценарии ({ $n })

js-app-search-settings =
    { $n ->
        [one] Параметры с именем, похожим на «{ $query }»: в { $n } сценарии
        [few] Параметры с именем, похожим на «{ $query }»: в { $n } сценариях
        [many] Параметры с именем, похожим на «{ $query }»: в { $n } сценариях
       *[other] Параметры с именем, похожим на «{ $query }»: в { $n } сценариях
    }

js-app-search-settings-hint = Каждый открывает сценарий с выделенным параметром, готовым к изменению.

js-app-share-copied = Ссылка для общего доступа скопирована. Она содержит точный сценарий.

js-app-share-in-address-bar = Ссылка помещена в адресную строку.

js-app-share-link-sub = Он запускается ровно так, как им поделились.

js-app-share-link-title = Сценарий, открытый по общей ссылке

js-app-shared-scenario = Общий сценарий

js-app-shown-unchanged = Показано без изменений.

js-app-solar-note = Каждая точка — тело на эпоху прогона, а каждая кривая — трасса орбиты, которую движок вычислил для него. Штриховая линия — связь, которой требует сценарий. Выберите планету, чтобы увидеть её луны.

js-app-solar-which-bodies = Какие тела рисовать

js-app-source-live = Результат на работающем движке · движок v{ $version }

js-app-source-native = Записанный результат, собственный движок · v{ $version }

js-app-source-recorded = Записанный результат · v{ $version }

js-app-source-recorded-loading = Записанный результат · v{ $version } · загрузка движка

js-app-spectrum-row-note = Спектр вдоль строки водопада, на которой находится воспроизведение.

js-app-spectrum-row-title = Спектр вдоль показанной строки

js-app-spectrum-which-part = Какая часть спектра

js-app-status-last-run-took = Последний прогон занял { $ms } ms в вашем браузере. Ничего не отправляется.

js-app-status-loading-kept = Движок ещё загружается. Ваши изменения сохранены и будут выполнены, как только он будет готов.

js-app-status-loading-recorded = Движок ещё загружается. Результат выше — записанный прогон.

js-app-status-not-run-yet = Ваши изменения ещё не выполнены.

js-app-status-runs-in-browser = Работает в вашем браузере. Ничего не отправляется.

js-app-status-wasm-blocked = WebAssembly здесь заблокирован, поэтому показаны записанные прогоны встроенных сценариев.

js-app-stepper-decrease = Уменьшить { $key }

js-app-stepper-increase = Увеличить { $key }

js-app-subtabs-label = Плитки этого представления (телефон)

js-app-svg-button-title = Векторный график с заголовком и происхождением

js-app-sweep-cancelled = Перебор отменён.

js-app-sweep-done-1d = Перебрано прогонов: { $done } из { $total }, локально за { $duration }.

js-app-sweep-done-2d = Перебрано прогонов: { $total } ({ $a } × { $b }), локально за { $duration }.

js-app-sweep-enter-range = Введите числовой диапазон.

js-app-sweep-enter-range-2 = Введите числовой диапазон для второго параметра.

js-app-sweep-failed = Перебор не удался: { $reason }

js-app-sweep-interrupted = Перебор прерван новым прогоном.

js-app-sweep-needs-live = Перебор запускает движок много раз, поэтому ему нужен работающий движок.

js-app-sweep-none-line = Нет (линейный график)

js-app-sweep-nothing = Для этого сценария нечего перебирать.

js-app-sweep-progress = Перебор: прогон { $n } из { $total }…

js-app-sweep-status-done = Перебрано прогонов: { $total }, в { $time }.

js-app-sweep-title-1d = { $metric } в зависимости от { $knob }

js-app-sweep-title-2d = { $metric }: { $knob1 } и { $knob2 }

js-app-sweep-wait = Дождитесь завершения текущего прогона, затем запустите перебор.

js-app-tab-animation = Анимация

js-app-tab-compare = Сравнение

js-app-tab-exports = Экспорт и отчёт

js-app-tab-ground = Трасса на поверхности

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Маски синхронизации

js-app-tab-orbit = 3D-орбита

js-app-tab-overview = Обзор

js-app-tab-report = Отчёт движка

js-app-tab-signal = Сигнал и полоса

js-app-tab-stability = Стабильность

js-app-tab-sweep = Перебор

js-app-tab-timeseries = Временной ряд

js-app-th-at-tau = При τ или времени

js-app-th-body = Тело

js-app-th-clock = Часы

js-app-th-figure = Показатель

js-app-th-file = Файл

js-app-th-format = Формат

js-app-th-key-figure = Ключевой показатель

js-app-th-light-time = Время прохождения света в одну сторону от { $observer }

js-app-th-limit = Предел

js-app-th-margin = Запас

js-app-th-mask-or-budget = Маска или бюджет

js-app-th-metric = Метрика

js-app-th-metric-2 = Метрика

js-app-th-orbital-period = Орбитальный период

js-app-th-provenance = Происхождение

js-app-th-size = Размер

js-app-th-source = Источник

js-app-th-sun-distance = Расстояние от Солнца

js-app-th-tier = Уровень

js-app-th-unit = Единица

js-app-th-value = Значение

js-app-th-value-2 = Значение

js-app-th-value-3 = Значение

js-app-th-verdict = Вердикт

js-app-th-what-it-is = Что это

js-app-the-body = тело

js-app-the-chain = Цепочка

js-app-the-observer = наблюдатель

js-app-tile-browse-all = Обзор всех сценариев: { $n }

js-app-tile-browse-sub = Поиск по названию, вопросу или параметру

js-app-tile-preview-label = Записанный предварительный просмотр из { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } сценарий
        [few] { $n } сценария
        [many] { $n } сценариев
       *[other] { $n } сценария
    }

js-app-timeline-chart-title = Хронология миссии: { $title }

js-app-timeline-note = Один ползунок управляет каждым графиком ниже. Каждая фаза запускает обычные сценарии; кампания считывает их выходные данные на одну временную сетку. Закрашенные полосы — фазы, вертикальные линии — события. Значения выше — каналы кампании в момент воспроизведения.

js-app-toast-copied = Скопировано.

js-app-toast-copy-blocked = Копирование здесь заблокировано.

js-app-toast-copy-blocked-select = Копирование здесь заблокировано: выделите текст вместо этого.

js-app-toast-json-copied = JSON скопирован.

js-app-toast-loading-run = Движок ещё загружается. Ваш прогон начнётся, как только он будет готов.

js-app-toast-no-scenario = Сценария с именем { $name } здесь нет. Вот ближайшие совпадения.

js-app-toast-not-single-number = В этом сценарии этот параметр не одно число: измените его в файле сценария.

js-app-toast-one-pinned = Закреплён один прогон. Измените параметр, запустите снова и закрепите этот прогон, чтобы сравнить два.

js-app-toast-opened-advanced = Открыто с параметрами, которые вы изменили в расширенном представлении.

js-app-toast-opened-at = Открыто на { $label }. Измените его, затем запустите снова.

js-app-toast-scenario-copied = Сценарий скопирован.

js-app-tour-answer-body = Простое предложение, прочитанное из результата, и источник результата: работающий прогон в вашем браузере или прогон, записанный тем же движком.

js-app-tour-answer-title = Сначала ответ

js-app-tour-back = Назад

js-app-tour-done = Готово

js-app-tour-eyebrow = Экскурсия

js-app-tour-figures-body = Каждая карточка читается из документа результата движка.

js-app-tour-figures-title = Показатели, которые на него отвечают

js-app-tour-how-body = Метод, уровень доказательств и ссылки.

js-app-tour-how-title = Как это вычисляется

js-app-tour-next = Далее

js-app-tour-research-body = Командная строка и Python, чтобы запустить самому, данные и графики, а также способ цитирования.

js-app-tour-research-title = Для исследователей

js-app-tour-search-body = ⌘K находит любой сценарий, область, параметр, представление или команду.

js-app-tour-search-title = Поиск

js-app-tour-settings-body = Пять параметров, которые важнее всего для этого вопроса. Измените один, затем запустите снова. Движок работает в вашем браузере; ничего не отправляется.

js-app-tour-settings-title = Попробуйте другие параметры

js-app-tour-skip = Пропустить

js-app-tour-views-body = Графики, карты, воспроизведения, собственный отчёт движка и экспорт. [ и ] переключают представления.

js-app-tour-views-title = Каждое представление прогона

js-app-tracking-threshold = Порог слежения

js-app-transport-hint = один ползунок управляет каждой панелью этого прогона

js-app-transport-label = Воспроизведение: один ползунок управляет каждой панелью этого прогона

js-app-unpin-run = Снять закрепление прогона { $id }

js-app-waterfall = Водопад

js-app-waterfall-hint = спектральная плотность мощности: частота по горизонтали, время вниз

js-app-waterfall-note = Цвет — это мощность выше уровня шумов приёмника. Навигационные сигналы лежат ниже этого уровня, поэтому светятся источники подавления. Запустите воспроизведение или перетащите ползунок, и полосы справа покажут, что приёмник всё ещё отслеживает в этот момент.

js-app-waterfall-title = Водопад, { $name }

js-app-webassembly-unavailable = WebAssembly недоступен

js-app-written-by-native = Записано собственным движком командной строки v{ $version } ({ $platform }) командой

js-cat-acm-link-question = Какой режим DVB-S2 удерживает линия на каждом пролёте и сколько данных передаёт пролёт? (вычислено по модели)

js-cat-acm-link-title = Нисходящая линия спутника с адаптивным кодированием

js-cat-aocs-slew-mekf-question = Если регулятор получает данные от фильтра ориентации и смещённого гироскопа, как разворот соотносится со случаем истинного состояния? (вычислено по модели)

js-cat-aocs-slew-mekf-title = Разворот по оценке ориентации

js-cat-aocs-slew-question = Успокаивает ли закон обратной связи разворот на большой угол четырьмя маховиками и насколько тяжело работают маховики? (контур управления проверен; космический аппарат иллюстративный)

js-cat-aocs-slew-title = Разворот на маховиках

js-cat-aperture-duty-cycle-question = Когда одна апертура обслуживает и навигацию, и связь, какой перерыв это даёт? (вычислено по модели)

js-cat-aperture-duty-cycle-title = Скважность апертуры

js-cat-araim-gps-galileo-question = При GPS + Galileo и гипотезе об отказе всей орбитальной группировки, насколько доступен усовершенствованный RAIM?

js-cat-araim-gps-galileo-title = ARAIM на двух орбитальных группировках

js-cat-araim-reference-check-question = Попадают ли уровни защиты движка на опубликованные разобранные примеры рабочей группы C?

js-cat-araim-reference-check-title = Эталонная проверка ARAIM

js-cat-ascent-losses-question = Какую часть идеального прироста скорости двухступенчатой ракеты-носителя отнимают гравитация, сопротивление, управление и противодавление? (вычислено по модели)

js-cat-ascent-losses-title = Потери при выведении ракеты-носителя

js-cat-attitude-budget-question = Каков наихудший возмущающий момент и бюджет ошибки наведения?

js-cat-attitude-budget-title = Бюджет наведения

js-cat-automotive-urban-canyon-question = Остаётся ли автомобиль в пределах бюджета в пол-полосы при проезде под путепроводом и мимо придорожного источника подавления? (вычислено по модели)

js-cat-automotive-urban-canyon-title = Автомобиль в городском каньоне

js-cat-campaign-jam-spoof-holdover-integrity-question = Что происходит с одним приёмником при подавлении, спуфинге, потере GNSS, сигнале тревоги целостности и восстановлении на одной временной шкале? (вычислено по модели)

js-cat-campaign-jam-spoof-holdover-integrity-title = Цепочка миссии: подавление, спуфинг, holdover, тревога

js-cat-campaign-monte-carlo-clock-holdover-question = Совпадает ли по многим прогонам с начальным значением ошибка времени свободно идущих часов с её разбросом в замкнутой форме?

js-cat-campaign-monte-carlo-clock-holdover-title = Holdover часов по методу Монте-Карло

js-cat-campaign-optimize-link-budget-question = Где по дальности и скорости передачи данных линия X-диапазона оставляет ровно 3 dB запаса?

js-cat-campaign-optimize-link-budget-title = Оптимизация бюджета линии связи

js-cat-campaign-shared-jammer-sea-road-question = Под действием одного источника подавления какая платформа теряет определение положения: судно в 30 km или автомобиль в 50 km? (вычислено по модели)

js-cat-campaign-shared-jammer-sea-road-title = Один источник подавления, судно и автомобиль

js-cat-campaign-spectrum-holdover-integrity-question = Источник подавления забирает два сигнала диапазона L, часы работают в holdover, а приёмник переходит на один Galileo: сохраняется ли контроль целостности? (вычислено по модели)

js-cat-campaign-spectrum-holdover-integrity-title = Миссия, управляемая спектром

js-cat-campaign-sweep-jammer-power-question = Когда источник подавления в 1 km наращивает мощность от 10 nW до 10 W, в какой момент приёмник теряет определение положения? (вычислено по модели)

js-cat-campaign-sweep-jammer-power-title = Перебор мощности источника подавления

js-cat-cislunar-arc-recovery-question = Восстанавливает ли независимая оценка по методу наименьших квадратов состояние по длине дуги, которую предсказывает тест ранга? (вычислено по модели; медленно — около 15 s в браузере)

js-cat-cislunar-arc-recovery-title = Восстановление цислунной дуги

js-cat-cislunar-observability-question = Какую часть состояния цислунного космического аппарата делает наблюдаемой межспутниковая дуга?

js-cat-cislunar-observability-title = Наблюдаемость в цислунном пространстве

js-cat-clock-ensemble-question = В какой доверительный диапазон попадает holdover по множеству реализаций шума?

js-cat-clock-ensemble-title = Ансамбль holdover часов

js-cat-clock-holdover-labsr-question = Как лабораторные оптические часы на стронции соотносятся с чип-масштабными атомными часами в holdover?

js-cat-clock-holdover-labsr-title = Holdover часов, лабораторные оптические часы

js-cat-clock-holdover-question = Как долго часы могут хранить время после пропадания GNSS?

js-cat-clock-holdover-title = Holdover часов

js-cat-combined-altpnt-question = Что даёт объединение трёх скалярных картографических каналов по сравнению с любым одним из них?

js-cat-combined-altpnt-title = Комбинированный alt-PNT

js-cat-conflict-resilience-question = Как деградирует многоуровневая архитектура PNT под угрозами подавления, спуфинга, кинетических и кибератак? (вычислено по модели)

js-cat-conflict-resilience-title = Устойчивость в условиях конфликта

js-cat-constellation-multi-gnss-coverage-question = Сколько спутников в зоне видимости и какова геометрия в любой точке Земли при совместном использовании четырёх глобальных систем? (вычислено по модели)

js-cat-constellation-multi-gnss-coverage-title = Четыре орбитальные группировки GNSS, одна карта

js-cat-contact-schedule-question = Для трёх спутников и трёх станций за 12 часов, какие пролёты сохраняет бесконфликтный план и сколько данных он передаёт? (вычислено по модели)

js-cat-contact-schedule-title = План наземных сеансов связи

js-cat-domain-campaigns-label = Кампании

js-cat-domain-campaigns-line = Цепочки миссий, переборы и прогоны Монте-Карло по одним часам.

js-cat-domain-constellations-label = Проектирование орбитальных группировок

js-cat-domain-constellations-line = Проектирование орбитальной группировки, карта её покрытия и PDOP (геометрический фактор положения).

js-cat-domain-deepspace-label = Луна, цислунное пространство и Марс

js-cat-domain-deepspace-line = Навигация и время у Луны, в цислунном пространстве и у Марса.

js-cat-domain-integrity-label = Целостность и определение положения

js-cat-domain-integrity-line = Определения положения и вопрос, можно ли им доверять: RAIM (автономный контроль целостности приёмником) и его развитие, ARAIM.

js-cat-domain-interference-label = Подавление и помехи

js-cat-domain-interference-line = Источники подавления против приёмников спутниковой навигации: что теряется и когда.

js-cat-domain-leo-label = Навигация на низкой околоземной орбите (LEO)

js-cat-domain-leo-line = Навигационные сигналы, пролёты, сообщения и определения положения на низкой околоземной орбите.

js-cat-domain-leo-missions-label = Миссии и исследования LEO

js-cat-domain-leo-missions-line = Исследования и службы, построенные на слое низкой околоземной орбиты.

js-cat-domain-navigation-label = Инерциальная и альтернативная навигация

js-cat-domain-navigation-line = Инерциальная, рельефная, гравиметрическая и другая навигация без спутников.

js-cat-domain-orbits-label = Орбиты и геометрия GNSS

js-cat-domain-orbits-line = Распространение орбиты, эфемериды и геометрия навигационных спутников.

js-cat-domain-solar-label = Солнечная система

js-cat-domain-solar-line = Каждая планета и луна в одну эпоху, со временем прохождения света.

js-cat-domain-spaceops-label = Анализ миссий и космические операции

js-cat-domain-spaceops-line = Пролёты, окна запуска, вход в атмосферу, бюджеты линии связи и ориентации.

js-cat-domain-spectrum-label = Спектр

js-cat-domain-spectrum-line = Водопады радиодиапазона: источники подавления, сигналы и то, что отслеживает приёмник.

js-cat-domain-spoofing-label = Спуфинг и безопасность сигнала

js-cat-domain-spoofing-line = Ложные сигналы и меконинг, а также мониторы, которые их ловят.

js-cat-domain-studies-label = Квантовые технологии, сравнительные исследования и совместимость

js-cat-domain-studies-line = Квантовые датчики, сравнительные исследования и форматы совместимости.

js-cat-domain-timing-label = Часы и синхронизация времени

js-cat-domain-timing-line = Часы без спутников: holdover, стабильность, маски телекоммуникационной синхронизации, передача времени.

js-cat-earth-gnss-lunar-question = Может ли приёмник вблизи Луны принимать земные GNSS и хватает ли их когда-нибудь для определения положения? (вычислено по модели)

js-cat-earth-gnss-lunar-title = Земные GNSS у Луны

js-cat-entry-heating-stardust-question = Воспроизводит ли модель входа в атмосферу опубликованное пиковое замедление капсулы Stardust для возврата образцов?

js-cat-entry-heating-stardust-title = Вход капсулы Stardust

js-cat-eo-coverage-question = Какие полосу обзора, расстояние выборки на местности и периодичность повторных съёмок даёт орбита наблюдения Земли?

js-cat-eo-coverage-title = Покрытие при наблюдении Земли

js-cat-eo-radiometry-question = Какие отношение сигнал/шум, MTF на частоте Найквиста и NIIRS даёт сцена с отражательной способностью 15 % для малой камеры наблюдения Земли? (вычислено по модели)

js-cat-eo-radiometry-title = Радиометрия и качество изображения камеры

js-cat-ephemeris-question = Где находится спутник и когда он пролетает над головой?

js-cat-ephemeris-title = Трасса на поверхности

js-cat-europa-surface-pnt-question = Можно ли определить положение посадочного аппарата на спутнике Юпитера Европе по малой группировке ретрансляторов и дальности от Земли? (вычислено по модели)

js-cat-europa-surface-pnt-title = Посадочный аппарат на Европе

js-cat-fusion-pnt-coupled-question = Как навигатор переживает пропадание GNSS, когда один составной фильтр Калмана охватывает положение, часы и смещение акселерометра? (вычислено по модели)

js-cat-fusion-pnt-coupled-title = Связанный навигатор с объединением датчиков

js-cat-fusion-pnt-question = Что даёт единая совместная оценка по часам и положению?

js-cat-fusion-pnt-title = Объединение датчиков

js-cat-gnss-ins-aviation-question = При двухминутном отсутствии GNSS, охватывающем вираж с креном, насколько дрейфует тесно связанная ИНС навигационного или тактического класса? (вычислено по модели)

js-cat-gnss-ins-aviation-title = Вираж самолёта при пропадании GNSS

js-cat-gnss-ins-maritime-question = После пятиминутного пропадания GNSS на судне, идущем со смещениями курса, насколько дрейфует ИНС навигационного или тактического класса? (вычислено по модели)

js-cat-gnss-ins-maritime-title = Судно с рысканием при пропадании GNSS

js-cat-gnss-ins-question = Насколько хорошо инерциальный навигатор с коррекцией продолжает работу при пропадании GNSS?

js-cat-gnss-ins-rail-question = При проезде глубокой выемки с двумя спутниками, а затем туннеля, насколько дрейфует тесно связанная ИНС? (вычислено по модели)

js-cat-gnss-ins-rail-title = Поезд в выемке и туннеле

js-cat-gnss-ins-title = Объединение GNSS и ИНС

js-cat-gnss-sim-container-terminal-skyline-question = Сколько спутников остаётся при кранах со стороны моря и штабелях со стороны суши и что происходит с защитой RAIM? (вычислено по модели; типовой скайлайн)

js-cat-gnss-sim-container-terminal-skyline-title = Портальный погрузчик на контейнерном причале

js-cat-gnss-sim-raim-question = Как ионосфера и тропосфера формируют сырые псевдодальности и защищает ли RAIM по-прежнему?

js-cat-gnss-sim-raim-title = Измерения GNSS

js-cat-gnss-ssv-formation-heo-question = Насколько хорошо фильтр знает относительное положение двух космических аппаратов на расстоянии километра друг от друга по сравнению с вычитанием их абсолютных определений положения? (вычислено по модели; прогон записан собственным движком)

js-cat-gnss-ssv-formation-heo-title = Относительная навигация строя, высокоэллиптическая орбита

js-cat-gnss-ssv-heo-question = Что слышит высокоэллиптическая орбита вдоль своего пути: сигналы в зоне видимости, лучшее C/N0, главный лепесток против бокового, DOP и скользящие сигналы? (вычислено по модели; прогон записан собственным движком)

js-cat-gnss-ssv-heo-title = Сигналы GNSS на высокоэллиптической орбите

js-cat-gnss-ssv-lunar-weak-question = Что может использовать приёмник, рассчитанный на самые слабые сигналы, на пути к Луне? (вычислено по модели; прогон записан собственным движком)

js-cat-gnss-ssv-lunar-weak-title = Сигналы GNSS на трассе перелёта к Луне, приёмник слабых сигналов

js-cat-gnss-ssv-nav-lunar-question = Насколько хорошо бортовой фильтр удерживает трассу перелёта к Луне в сравнении с заявленной им границей? (вычислено по модели; прогон записан собственным движком)

js-cat-gnss-ssv-nav-lunar-title = Бортовой фильтр GNSS на трассе перелёта к Луне

js-cat-gnss-ssv-shell-question = Как часто космический аппарат на геостационарной высоте слышит хотя бы один и хотя бы четыре навигационных сигнала, по орбитальным группировкам и диапазонам? (вычислено по модели; прогон записан собственным движком)

js-cat-gnss-ssv-shell-title = Сигналы GNSS над спутниками: оболочка на 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = На реальном гравитационном поле EGM2008 до степени 70 может ли сопоставление с картой удержать трассу при недоступности GPS? (вычислено по модели)

js-cat-gps-denied-gravity-nav-egm2008-title = Гравитационная навигация по реальному полю

js-cat-gps-denied-gravity-nav-question = Насколько дрейфует положение за полный час без GNSS — и может ли гравитационная карта удержать его?

js-cat-gps-denied-gravity-nav-title = Навигация без GNSS

js-cat-gravity-map-error-mc-question = По мере того как сохранённая гравитационная карта становится более шумной, как часто сопоставление с картой всё же удерживает определение положения при недоступности GPS в пределах цели? (вычислено по модели)

js-cat-gravity-map-error-mc-title = Монте-Карло по ошибке гравитационной карты

js-cat-gravity-map-nav-question = Может ли гравиметр на холодных атомах удерживать положение без GNSS, сопоставляя гравитационное поле, через которое он летит?

js-cat-gravity-map-nav-title = Навигация по гравитационной карте

js-cat-holdover-test-example-question = Отключить антенну и оценить holdover: запись, разделённая в два момента, которые называет оператор, каждый шаг измеряется по маскам ITU-T, написанным для него. (вычислено по модели; запись придумана для примера)

js-cat-holdover-test-example-title = Испытание holdover: запись ошибки времени относительно масок

js-cat-holdover-test-ptp4l-question = Те же четыре шага, считанные из журнала сервопривода ptp4l: насколько смещение самого демона остаётся в пределах масок, пока GNSS отсутствует? (вычислено по модели; журнал придуман для примера)

js-cat-holdover-test-ptp4l-title = Испытание holdover: журнал linuxptp

js-cat-hybrid-optical-rf-question = Что дают непрерывность и целостность при сочетании оптического и радиочастотного PNT? (вычислено по модели)

js-cat-hybrid-optical-rf-title = Оптико-радиочастотный гибрид

js-cat-hybrid-pnt-question = Что даёт объединённый комплект из часов и инерциальной системы?

js-cat-hybrid-pnt-title = Гибридный PNT

js-cat-hybrid-ukf-question = Согласован ли сам с собой 17-мерный тесно связанный UKF (NEES + белизна инноваций)? Проверка внутренней согласованности, а не утверждение о точности.

js-cat-hybrid-ukf-title = Гибридный 17-мерный UKF

js-cat-impairment-eval-question = Насколько хорошо детектор отделяет подавление, спуфинг и многолучевость от номинала? (вычислено по модели, ROC/AUC)

js-cat-impairment-eval-title = Оценка радиочастотных нарушений

js-cat-imu-deadreckoning-question = Насколько дрейфует положение при счислении только по IMU?

js-cat-imu-deadreckoning-title = Инерциальное счисление пути

js-cat-ins-trn-coast-question = Насколько дрейфует положение при пропадании навигации и когда оно превышает 10 m и 50 m? (вычислено по модели)

js-cat-ins-trn-coast-title = Выбег ИНС и рельефной навигации

js-cat-integrity-harbour-approach-question = Если здания на причале и волнолом скрывают низкие спутники, остаётся ли защита ARAIM по GPS и Galileo в пределах порогов тревоги? (вычислено по модели; типовой скайлайн)

js-cat-integrity-harbour-approach-title = ARAIM при входе в гавань

js-cat-integrity-raim-question = Удовлетворяет ли геометрия порогам тревоги (HPL / VPL)?

js-cat-integrity-raim-title = Целостность RAIM

js-cat-jamming-demo-question = При каком отношении мощности помехи к мощности сигнала приёмник теряет захват?

js-cat-jamming-demo-title = Подавление

js-cat-jamming-harbour-approach-skyline-question = Под действием берегового источника подавления мощностью 2 W сколько спутников сохраняет судно и сколько скрывает сам причал? (вычислено по модели; типовой скайлайн)

js-cat-jamming-harbour-approach-skyline-title = Судно под подавлением при входе в гавань

js-cat-l-band-waterfall-jamming-question = Как выглядит весь диапазон L GNSS, пока включаются чирп-, тональный и шумовой источники подавления, и какие сигналы забирает каждый? (вычислено по модели)

js-cat-l-band-waterfall-jamming-title = Водопад диапазона L под подавлением

js-cat-launch-window-question = Какой азимут запуска и какой Δv доворота выводят на заданное наклонение с площадки?

js-cat-launch-window-title = Окно запуска

js-cat-leo-band-trade-question = Что выигрывает и теряет навигационный сигнал низкой орбиты в каждом диапазоне, от ультравысоких частот (UHF) до диапазона C? (типовые проекты)

js-cat-leo-band-trade-title = Сравнение диапазонов, от UHF до диапазона C

js-cat-leo-doppler-positioning-question = Насколько хорошо определение положения по десяти минутам доплеровских измерений навигационной группировки на низкой орбите? (вычислено по модели)

js-cat-leo-doppler-positioning-title = Определение положения только по Доплеру

js-cat-leo-focus-data-services-question = Во сколько битов навигационного сообщения обходится каждая дополнительная служба данных? (вычислено по модели)

js-cat-leo-focus-data-services-title = Данные служб в зависимости от длины кадра

js-cat-leo-focus-fused-pnt-sisre-question = Какой должна быть ошибка дальности сигнала в пространстве на низкой орбите, чтобы слой низкой орбиты помогал объединённому определению положения? (вычислено по модели)

js-cat-leo-focus-fused-pnt-sisre-title = Объединённое определение положения в зависимости от ошибки орбиты и часов

js-cat-leo-focus-indoor-uhf-question = Какой диапазон всё ещё достигает пользователя внутри традиционного и теплоэффективного здания? (вычислено по модели)

js-cat-leo-focus-indoor-uhf-title = Приём в помещении по диапазонам и зданиям

js-cat-leo-focus-iot-eirp-question = Сколько мощности передачи спутника нужно метке на батарее, чтобы она прослужила долго? (вычислено по модели)

js-cat-leo-focus-iot-eirp-title = Энергия трекера в зависимости от мощности передачи

js-cat-leo-focus-ntn-bandwidth-question = Как падает ошибка определения положения, когда опорный сигнал расширяется от 180 kHz до 20 MHz? (вычислено по модели)

js-cat-leo-focus-ntn-bandwidth-title = Определение положения по нисходящей линии 5G в зависимости от полосы

js-cat-leo-focus-ppp-altitude-question = Какой слой низкой орбиты сильнее сокращает сходимость: ниже или выше? (вычислено по модели; медленно, около минуты в браузере)

js-cat-leo-focus-ppp-altitude-title = Точное позиционирование в зависимости от высоты слоя

js-cat-leo-focus-science-iono-sounding-question = Насколько хорошо разность задержек между двумя диапазонами измеряет электронное содержание под спутником низкой орбиты? (вычислено по модели)

js-cat-leo-focus-science-iono-sounding-title = Зондирование ионосферы по двум диапазонам

js-cat-leo-indoor-uhf-question = Почему несущая UHF проникает внутрь здания, когда диапазоны L, S и C с этим не справляются? (вычислено по модели)

js-cat-leo-indoor-uhf-title = В помещении на UHF

js-cat-leo-iot-energy-question = Сколько энергии метка на батарее тратит на каждое определение положения по сигналу низкой орбиты? (вычислено по модели)

js-cat-leo-iot-energy-title = Энергия на одно определение положения для трекера

js-cat-leo-navmsg-encode-decode-question = Чего стоит квантование каждого поля и переживает ли кадр кодирование, декодирование и повреждённый бит? (вычислено по модели)

js-cat-leo-navmsg-encode-decode-title = Навигационное сообщение: двоичный кадр

js-cat-leo-navmsg-fit-interval-trade-question = Как долго может охватывать одно передаваемое сообщение, прежде чем ошибка его орбиты превысит цель? (вычислено по модели; медленно, около 30 s в браузере)

js-cat-leo-navmsg-fit-interval-trade-title = Навигационное сообщение: интервал аппроксимации

js-cat-leo-navmsg-midpass-update-question = Когда спутник посреди пролёта переключается на новое сообщение, видит ли пользователь скачок? (вычислено по модели)

js-cat-leo-navmsg-midpass-update-title = Навигационное сообщение: обновление посреди пролёта

js-cat-leo-navmsg-model-comparison-question = Какая модель эфемерид лучше всего представляет низкую орбиту и как она соотносится с опубликованной таблицей? (вычислено по модели)

js-cat-leo-navmsg-model-comparison-title = Навигационное сообщение: четыре модели

js-cat-leo-pass-iridium-question = Какие мощность сигнала и доплеровский сдвиг видит самолёт за один пролёт Iridium? (вычислено по модели)

js-cat-leo-pass-iridium-title = Всплески Iridium с самолёта

js-cat-leo-pass-vs-gnss-cn0-question = Как мощность сигнала одного пролёта на низкой орбите соотносится со спутниками Galileo в зоне видимости? (вычислено по модели)

js-cat-leo-pass-vs-gnss-cn0-title = Один пролёт в сравнении с GNSS

js-cat-leo-pass-xona-pulsar-question = Как выглядят сигналы X1 и X5 за один пролёт для судна в Бискайском заливе? (вычислено по модели)

js-cat-leo-pass-xona-pulsar-title = Пролёт Xona Pulsar

js-cat-leo-pnt-end-to-end-question = От проектирования сигнала до итогового определения положения: что каждый этап передаёт следующему? (вычислено по модели)

js-cat-leo-pnt-end-to-end-title = От начала до конца, обобщённая орбитальная группировка

js-cat-leo-pnt-mega-shell-question = Какие покрытие и геометрию даёт навигационная орбитальная группировка из 5,000 спутников на низкой околоземной орбите? (вычислено по модели; примерный проект)

js-cat-leo-pnt-mega-shell-title = Проект на низкой орбите из 5,000 спутников

js-cat-leo-ppp-convergence-question = Насколько быстрее сходится точное абсолютное позиционирование (PPP), когда добавлен слой низкой орбиты? (вычислено по модели; медленно, около 30 s в браузере)

js-cat-leo-ppp-convergence-title = Сходимость точного позиционирования

js-cat-leo-pvt-fjord-skyline-question = Там, где стены фьорда оставляют полосу неба вдоль канала, сколько добавляет слой низкой орбиты к GPS и Galileo? (вычислено по модели; типовой скайлайн)

js-cat-leo-pvt-fjord-skyline-title = Паром в глубине фьорда

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Когда GNSS подавлен, может ли слой низкой орбиты в других диапазонах сохранить определение положения и его целостность? (вычислено по модели)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS подавлен, низкая орбита продолжает работать

js-cat-leo-resilience-js-margin-question = Насколько большее подавление переносит более сильный сигнал низкой орбиты по сравнению с сигналом GNSS со средней орбиты? (вычислено по модели)

js-cat-leo-resilience-js-margin-title = Запас по подавлению от принимаемой мощности

js-cat-leo-resilience-multiband-diversity-question = По мере усиления одного источника подавления диапазона L какие из четырёх диапазонов продолжают слежение? (вычислено по модели)

js-cat-leo-resilience-multiband-diversity-title = Разнесение диапазонов под заградительным источником подавления

js-cat-leo-resilience-spoof-doppler-question = Когда спуфер сдвигает вычисленное положение на 30 m, как быстро это обнаруживает проверка по Доплеру и геометрии пролёта? (вычислено по модели)

js-cat-leo-resilience-spoof-doppler-title = Спуфинг, пойманный по Доплеру

js-cat-leo-resilience-spoof-monitors-question = Какой монитор видит какой вид спуфера? (вычислено по модели)

js-cat-leo-resilience-spoof-monitors-title = Мониторы спуфинга против четырёх спуферов

js-cat-leo-timing-utc-question = Насколько точно приёмник может восстановить всемирное координированное время (UTC) по спутникам низкой орбиты, в зависимости от генератора и уровня сигнала? (вычислено по модели)

js-cat-leo-timing-utc-title = Передача времени в UTC

js-cat-leo-vertical-5g-network-timing-question = Когда GNSS потерян на сутки, удерживает ли время низкой орбиты базовую станцию в пределах её допуска по времени? (вычислено по модели)

js-cat-leo-vertical-5g-network-timing-title = Синхронизация базовых станций 5G

js-cat-leo-vertical-asset-tracking-iot-question = Во что обходится каждое определение положения метке на батарее на пути контейнера? (вычислено по модели)

js-cat-leo-vertical-asset-tracking-iot-title = Отслеживание контейнеров

js-cat-leo-vertical-autonomous-vehicle-question = Когда здания скрывают низкие спутники, удерживает ли слой низкой орбиты автомобиль в пределах ошибки уровня полосы? (вычислено по модели)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Если смоделировать реальную улицу вместо плоского среза на 35°, удерживает ли слой низкой орбиты автомобиль в пределах ошибки уровня полосы? (вычислено по модели; типовой скайлайн)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Транспортное средство на улице, а не при плоском срезе

js-cat-leo-vertical-autonomous-vehicle-title = Транспортное средство в городском каньоне

js-cat-leo-vertical-critical-infrastructure-timing-question = Когда GNSS потерян, удерживает ли время низкой орбиты синхронизацию подстанции? (вычислено по модели)

js-cat-leo-vertical-critical-infrastructure-timing-title = Синхронизация подстанции

js-cat-leo-vertical-polar-arctic-question = От Тромсё до Северного полюса: что добавляет к GNSS полярный слой низкой орбиты? (вычислено по модели)

js-cat-leo-vertical-polar-arctic-title = Арктический маршрут

js-cat-leo-vertical-rail-maritime-question = Когда встроенные сценарии судна и поезда теряют GNSS, достигает ли их по-прежнему пролёт на низкой орбите? (вычислено по модели)

js-cat-leo-vertical-rail-maritime-title = Железная дорога и море со слоем низкой орбиты

js-cat-link-budget-question = Замыкается ли односторонняя линия с запасом при заданных дальности и скорости передачи данных?

js-cat-link-budget-title = Бюджет линии связи

js-cat-lunanet-araim-question = Удовлетворяет ли разреженный набор лунных ретрансляторов пороги целостности для приёмника в районе Artemis?

js-cat-lunanet-araim-title = Лунная целостность

js-cat-lunar-attack-surface-question = Что нужно, чтобы подменить сигнал или подавить приёмник на лунной поверхности, и какой бюджет аутентификации на это отвечает? (вычислено по модели)

js-cat-lunar-attack-surface-title = Поверхность атаки на Луне

js-cat-lunar-beacon-question = Насколько горстка привязанных наземных маяков на поверхности снижает DOP у южного полюса? (вычислено по модели)

js-cat-lunar-beacon-title = Маяки на лунной поверхности

js-cat-lunar-differential-pnt-question = Насколько дифференциальная поправка гасит синфазную ошибку по сравнению с базовым уровнем на Луне? (вычислено по модели)

js-cat-lunar-differential-pnt-title = Лунный дифференциальный PNT

js-cat-lunar-frame-campaign-question = Какая точность датума получается по наблюдательной кампании, а не по введённому преобразованию? (вычислено по модели)

js-cat-lunar-frame-campaign-title = Кампания по лунной системе отсчёта

js-cat-lunar-frame-realisation-question = Может ли подгонка датума по Гельмерту восстановить преобразование лунной системы отсчёта? (вычислено по модели)

js-cat-lunar-frame-realisation-title = Лунная система отсчёта

js-cat-lunar-infrastructure-carrier-phase-question = Могут ли станция на поверхности и орбитальный аппарат вместе разрешить целочисленные неоднозначности фазы несущей сигналов земных GNSS? Быстрый пример прогона. (вычислено по модели; прогон записан собственным движком)

js-cat-lunar-infrastructure-carrier-phase-title = Лунная фаза несущей: станция на поверхности и орбитальный аппарат

js-cat-lunar-infrastructure-frame-coestimation-question = Сколько дополнительной информации дают дальности между орбитальным аппаратом и станцией на поверхности для семи параметров лунного датума? (вычислено по модели; прогон записан собственным движком)

js-cat-lunar-infrastructure-frame-coestimation-title = Совместная оценка лунной системы отсчёта со связями орбитального аппарата

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Насколько чувствительны лазерная локация, слежение за орбитальным аппаратом, гравиметр и часы на поверхности к h2, k2, l2 и либрации? (вычислено по модели; прогон записан собственным движком)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Чувствительность к числам Лява и либрации Луны

js-cat-lunar-infrastructure-od-consistency-model-error-question = То же сравнение с введённым малым немоделируемым ускорением: замечает ли его проверка согласованности? (вычислено по модели; прогон записан собственным движком)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Определение лунной орбиты с введённой ошибкой моделирования

js-cat-lunar-infrastructure-od-consistency-question = Согласуются ли в пределах заявленных неопределённостей бортовое определение орбиты по земным GNSS на лунной гало-орбите и независимое наземное радиометрическое определение орбиты? (вычислено по модели; прогон записан собственным движком)

js-cat-lunar-infrastructure-od-consistency-title = Определение лунной орбиты: бортовые GNSS против наземного слежения

js-cat-lunar-infrastructure-space-tie-question = Насколько точно можно связать смещения между тремя методами по сравнению с ошибкой локальной привязки? (вычислено по модели; прогон записан собственным движком)

js-cat-lunar-infrastructure-space-tie-title = Космическая привязка: GNSS, VLBI и лазерная локация на одном космическом аппарате

js-cat-lunar-interop-export-question = Могут ли лунная система отсчёта, время и эфемериды пройти круговой обмен через CCSDS OEM + оболочку KIF?

js-cat-lunar-interop-export-title = Экспорт лунной совместимости

js-cat-lunar-jamming-question = Как далеко может находиться источник подавления и всё ещё лишать приёмник на лунной поверхности сигнала? (вычислено по модели)

js-cat-lunar-jamming-title = Лунное подавление

js-cat-lunar-joint-od-clock-question = Делает ли привязка VLBI по земной базе абсолютное положение лунной станции наблюдаемым? (вычислено по модели)

js-cat-lunar-joint-od-clock-title = Лунные совместные OD и часы

js-cat-lunar-llr-datum-question = Как выглядит лунный датум, когда кампания — это настоящая архивная лунная лазерная локация (LLR)? (вычислено по модели; прогон записан собственным движком)

js-cat-lunar-llr-datum-title = Датум лунной лазерной локации

js-cat-lunar-relay-constellation-question = Какое покрытие даёт всей Луне группировка ретрансляции и навигации на замороженных и низких лунных орбитах? (вычислено по модели; примерный проект)

js-cat-lunar-relay-constellation-title = Лунная ретрансляционная группировка

js-cat-lunar-station-coverage-public-sources-question = Какую исправленную ошибку даёт станция над южным полюсом при одних лишь публично заявленных допущениях? Результат определяется элементами орбиты, которые не публичны и заданы как ILLUSTRATIVE; это входные данные замороженного предсказания. (вычислено по модели; не утверждение о какой-либо реальной системе)

js-cat-lunar-station-coverage-public-sources-title = Лунная опорная станция, публичные допущения

js-cat-lunar-station-coverage-question = Какую исправленную ошибку даёт лунная опорная станция над южной полярной областью за сутки и как далеко от неё покрытие сохраняется? (вычислено по модели; не утверждение о какой-либо реальной системе)

js-cat-lunar-station-coverage-terrain-question = Если горизонт каждой площадки прослежен лучом по реальной модели лунного рельефа, сколько покрытия станция теряет из-за рельефа? (вычислено по модели)

js-cat-lunar-station-coverage-terrain-title = Лунная станция с реальным рельефом

js-cat-lunar-station-coverage-title = Покрытие лунной опорной станции

js-cat-lunar-station-geodesy-baseline-question = Насколько хорошо нынешние пять массивов уголковых отражателей фиксируют лунный датум по реальному расписанию, до добавления какой-либо станции? Базовый уровень пары. (вычислено по модели; прогон записан собственным движком)

js-cat-lunar-station-geodesy-baseline-title = Геодезия лунной станции: только пять массивов

js-cat-lunar-station-geodesy-with-station-question = То же архивное расписание с одним добавленным южнополярным отражателем и маяком VLBI: насколько сужается граница датума? (вычислено по модели, иллюстративная площадка; прогон записан собственным движком)

js-cat-lunar-station-geodesy-with-station-title = Геодезия лунной станции: с южнополярной станцией

js-cat-lunar-station-time-lab-question = После последней подстройки миниатюрных рубидиевых часов станции к лунному времени, как долго они остаются в пределах 1, 10 и 100 ns и какое слагаемое ошибки преобладает? (вычислено по модели)

js-cat-lunar-station-time-lab-title = Лаборатория времени лунной станции

js-cat-lunar-time-budget-question = Насколько велико смещение координатного времени Земля–Луна и каков его бюджет ошибок? (вычислено по модели)

js-cat-lunar-time-budget-title = Бюджет лунного времени

js-cat-lunar-time-offset-question = Как быстро лунные часы расходятся с земным временем (~56–59 µs/day)?

js-cat-lunar-time-offset-title = Смещение лунного времени

js-cat-lunar-vlbi-fim-question = Какую точность координат станции на самом деле даёт заданное расписание слежения VLBI? (вычислено по модели)

js-cat-lunar-vlbi-fim-title = Информация лунного VLBI

js-cat-lunar-vlbi-question = Какую задержку видит пара VLBI по земной базе для маяка на лунной поверхности? (вычислено по модели)

js-cat-lunar-vlbi-title = Лунный VLBI

js-cat-maritime-port-approach-coast-question = При входе в порт без GNSS, когда ИНС навигационного класса выходит за бюджеты гавани и океана? (вычислено по модели)

js-cat-maritime-port-approach-coast-title = Подход к порту по инерциальной системе

js-cat-maritime-spoof-position-push-question = Когда спуфер смещает определение положения судна на 500 m, какие уровни обнаружения его ловят? (вычислено по модели)

js-cat-maritime-spoof-position-push-title = Подмена положения судна

js-cat-maritime-strait-jamming-question = Лишает ли источник подавления мощностью 50 W судно GNSS на 30 km открытой воды? (вычислено по модели)

js-cat-maritime-strait-jamming-title = Судно под подавлением в проливе

js-cat-mars-orbit-pnt-question = Насколько хорошо определяется положение низкого марсианского орбитального аппарата по двенадцати навигационным ретрансляторам и что добавляет дальность от Земли? (вычислено по модели)

js-cat-mars-orbit-pnt-title = Марсианский орбитальный аппарат с ретрансляторами и связью с Землёй

js-cat-mars-pnt-lmo-question = Может ли группировка ретрансляторов MARCONI обеспечить навигацию пользователя на Марсе? (ковариационный FoM, а не сертифицированный PL)

js-cat-mars-pnt-lmo-title = PNT на Марсе, низкая орбита

js-cat-mars-pnt-surface-question = Насколько хорошо можно навигировать посадочный аппарат или марсоход на вращающейся поверхности Марса по группировке ретрансляторов?

js-cat-mars-pnt-surface-title = PNT на Марсе, поверхность

js-cat-mars-pnt-transfer-question = Насколько хорошо навигируется аппарат на высокой эксцентричной дуге подхода или захвата у Марса?

js-cat-mars-pnt-transfer-title = PNT на Марсе, перелёт

js-cat-meo-leo-fused-pvt-question = Что происходит с ошибкой положения и геометрией, если добавить слой низкой орбиты к GPS и Galileo? (вычислено по модели)

js-cat-meo-leo-fused-pvt-title = Объединённое определение положения по GNSS и низкой орбите

js-cat-moonlight-service-volume-question = Какие DOP, покрытие и целостность даёт южному полюсу группировка класса Moonlight/LCNS? (вычислено по модели)

js-cat-moonlight-service-volume-title = Лунная зона обслуживания

js-cat-multi-band-jamming-waterfall-question = Если навигационные сигналы распределены по четырём диапазонам, что оставляет нетронутым источник подавления, рассчитанный на один диапазон? (вычислено по модели)

js-cat-multi-band-jamming-waterfall-title = Водопад многодиапазонного подавления

js-cat-notinbrowser-elevation-model = Нужен фрагмент лунной модели рельефа ({ $path }), который поставляется с репозиторием, а не со сборкой для браузера.

js-cat-notinbrowser-laser-ranging-data = Нужен архивный срез данных лазерной локации, который поставляется с репозиторием, а не со сборкой для браузера.

js-cat-notinbrowser-study-suite = Набор исследований, а не отдельный сценарий. Запустите его инструментом командной строки: { $command }.

js-cat-ntn-5g-positioning-question = Насколько точно телефон может определить своё положение по нисходящей линии неназемной сети 5G в зависимости от полосы сигнала? (вычислено по модели)

js-cat-ntn-5g-positioning-title = Определение положения по нисходящей линии спутников 5G

js-cat-oem-interop-question = Можно ли импортировать эфемериды OEM из GMAT / Orekit / STK и пройти круговой обмен?

js-cat-oem-interop-title = Мост CCSDS OEM

js-cat-optical-atmosphere-network-question = Как часто оптическая линия синхронизации работает сквозь облака и турбулентность и что дают дополнительные наземные пункты? (вычислено по модели; иллюстративные облачные климаты)

js-cat-optical-atmosphere-network-title = Оптическая линия через атмосферу, три пункта

js-cat-optical-atmosphere-techniques-question = Что дают одной оптической линии вверх в облаках и турбулентности большая апертура, другая длина волны или адаптивная оптика? (вычислено по модели; иллюстративный облачный климат)

js-cat-optical-atmosphere-techniques-title = Приёмы оптической линии

js-cat-orbit-gnss-challenged-question = Когда определение положения вообще возможно по геометрии спутников?

js-cat-orbit-gnss-challenged-title = Доступность GNSS

js-cat-orbit-molniya-question = Видит ли пользователь на сильно вытянутой орбите «Молния» вблизи апогея достаточно спутников GNSS?

js-cat-orbit-molniya-title = Пользователь на орбите «Молния»

js-cat-orbit-multignss-question = Насколько совместное использование GPS + Galileo повышает доступность и улучшает геометрический фактор DOP?

js-cat-orbit-multignss-title = Доступность мульти-GNSS

js-cat-orbit-real-tle-question = Какое покрытие обеспечивает реальная орбитальная группировка, заданная двухстрочными наборами элементов?

js-cat-orbit-real-tle-title = Реальные двухстрочные элементы

js-cat-orbit-rinex-question = Какая доступность получается по реальным широковещательным эфемеридам RINEX 3?

js-cat-orbit-rinex-title = Широковещательные эфемериды

js-cat-orbit-sgp4-gps-question = Как распространяется за сутки реальная орбитальная группировка, подобная GPS?

js-cat-orbit-sgp4-gps-title = Орбиты SGP4

js-cat-orbit-urban-canyon-skyline-question = На дне городской улицы, какую часть суток GPS и Galileo дают четыре спутника и что делает с PDOP полоса неба? (вычислено по модели; типовой скайлайн)

js-cat-orbit-urban-canyon-skyline-title = Доступность на городской улице

js-cat-passes-question = Когда спутник восходит и заходит над станцией и на какое время?

js-cat-passes-title = Пролёты над станцией

js-cat-polar-arctic-leo-coverage-question = От экватора до полюса: как меняются спутники в зоне видимости и геометрия при одних GNSS, при одном полярном слое низкой орбиты и при обоих? (вычислено по модели)

js-cat-polar-arctic-leo-coverage-title = От экватора до полюса

js-cat-pvt-abmf-question = Можно ли решить положение реального приёмника по сырым измерениям RINEX?

js-cat-pvt-abmf-title = Определение положения (SPP)

js-cat-quantum-anomaly-detect-question = Насколько хорошо обнаруживаются неисправности квантовой системы при фиксированной частоте ложных тревог? (вычислено по модели)

js-cat-quantum-anomaly-detect-title = Обнаружение квантовых аномалий

js-cat-quantum-cai-coast-question = Как долго атомно-холодный интерферометр, заданный своей физикой, удерживает счисление в пределах 100 m после потери GNSS по сравнению с кварцевым акселерометром навигационного класса? (вычислено по модели)

js-cat-quantum-cai-coast-title = Выбег квантового акселерометра

js-cat-quantum-gnss-free-nav-question = Насколько далеко дрейфует навигатор на холодных атомах по сравнению с ИНС навигационного класса без GNSS? (вычислено по модели)

js-cat-quantum-gnss-free-nav-title = Квантовая навигация без GNSS

js-cat-quantum-pnt-demonstrator-suite-question = Три области квантовых приложений как одно исследование (набор исследований для командной строки: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Исследование демонстратора квантового PNT

js-cat-quantum-time-transfer-question = Что даёт доверенная квантовая синхронизация по сравнению с классической цепочкой CSAC + RF? (вычислено по модели)

js-cat-quantum-time-transfer-title = Квантовая передача времени

js-cat-quantum-trade-question = Какой holdover времени и инерциальный holdover даёт кандидатные часы по сравнению с классическим базовым уровнем? (вычислено по модели)

js-cat-quantum-trade-title = Сравнение квантового PNT

js-cat-rail-tunnel-coast-question = При 160 km/h в туннеле, как скоро ИНС тактического класса выходит за свой бюджет? (вычислено по модели)

js-cat-rail-tunnel-coast-title = Поезд в туннеле

js-cat-realtime-frame-eop-question = Какую ошибку системы отсчёта вносят параметры ориентации Земли в реальном времени (предсказанные)? (вычислено по модели)

js-cat-realtime-frame-eop-title = Система отсчёта и EOP в реальном времени

js-cat-reentry-question = Какие пиковую перегрузку и скорость пикового нагрева видит баллистический вход в атмосферу?

js-cat-reentry-title = Коридор входа в атмосферу

js-cat-slot-timing-ocxo-leo-question = Как долго термостатированный кварцевый генератор на малом спутнике низкой орбиты остаётся в пределах защитного интервала слота после последнего определения положения по GNSS? (вычислено по модели)

js-cat-slot-timing-ocxo-leo-title = Синхронизация слота

js-cat-small-uas-jammed-nav-question = После того как источник подавления отнимает GNSS, насколько дрейфует инерциальный блок класса полётного контроллера по сравнению с блоком тактического класса?

js-cat-small-uas-jammed-nav-title = Малый дрон под подавлением

js-cat-solar-system-tour-question = Где находится каждое тело, известное движку, от Солнца до Плутона и крупных лун, и сколько времени идёт между ними свет?

js-cat-solar-system-tour-title = Солнечная система в одну эпоху

js-cat-space-packet-question = Кодируется и декодируется ли поток пакетов CCSDS 133.0 с точностью до бита?

js-cat-space-packet-title = Космический пакет

js-cat-space-weather-question = Как солнечная и геомагнитная активность меняет плотность термосферы? (вычислено по модели)

js-cat-space-weather-title = Космическая погода

js-cat-spoof-attack-question = Обнаруживается ли нарастающий спуфинг времени до того, как он достигнет допуска?

js-cat-spoof-attack-title = Обнаружение спуфинга

js-cat-spoof-detect-question = Может ли объединённый монитор RF и измерений поймать скоординированный спуфинг?

js-cat-spoof-detect-title = Многоуровневое обнаружение спуфинга

js-cat-spoof-meaconing-question = При явно заданной форме атаки как часто энергетический детектор с поддержкой часов ловит спуфинг при фиксированной частоте ложных тревог?

js-cat-spoof-meaconing-title = Статистика детектора спуфинга

js-cat-starlink-sop-doppler-positioning-question = Насколько хорошо приёмник может определить своё положение по Доплеру широкополосной группировки, не передающей навигационного сообщения? (вычислено по модели)

js-cat-starlink-sop-doppler-positioning-title = Широкополосные сигналы возможности

js-cat-sweep-clock-stability-question = Как меняется holdover при переборе одного параметра часов?

js-cat-sweep-clock-stability-title = Перебор параметра

js-cat-sweep-nd-inertial-question = Как показатель качества меняется по многопараметрической сетке?

js-cat-sweep-nd-inertial-title = Перебор в N измерениях

js-cat-telecom-prtc-holdover-24h-question = Остаётся ли рубидиевый эталон, теряющий GNSS на 24 часа, в пределах масок ошибки времени ITU-T? (вычислено по модели)

js-cat-telecom-prtc-holdover-24h-title = Телекоммуникационный holdover, 24 ч

js-cat-telecom-synce-eec-question = Остаётся ли свободно идущий термостатированный генератор в пределах масок блуждания часов оборудования синхронного Ethernet? (вычислено по модели)

js-cat-telecom-synce-eec-title = Частотная синхронизация против масок SyncE

js-cat-telecom-tie-ingest-question = Проходит ли запись ошибки временного интервала маски ITU-T MTIE и TDEV?

js-cat-telecom-tie-ingest-title = Проверка телекоммуникационных масок, ваши данные

js-cat-terrain-nav-question = Может ли высотомер исправить дрейф ИНС, сопоставляя профиль рельефа?

js-cat-terrain-nav-title = Рельефная навигация

js-cat-terrain-slam-question = Может ли фильтр частиц отслеживать изменяющийся во времени дрейф ИНС по карте рельефа?

js-cat-terrain-slam-title = Рельефный SLAM

js-cat-time-transfer-budget-question = Что делают слагаемые станции, транспондера, ионосферы и Саньяка с двусторонним смещением времени и каков бюджет его неопределённости? (вычислено по модели)

js-cat-time-transfer-budget-title = Двусторонняя спутниковая передача времени

js-cat-timetransfer-question = Насколько точно два пункта могут оставаться синхронизированными по линии связи?

js-cat-timetransfer-title = Передача времени

js-cat-tracking-loop-question = При каком C/N0 приёмник на самом деле теряет захват и может ли спуфер перетянуть контуры? (вычислено по модели)

js-cat-tracking-loop-title = Контур слежения

js-cat-xona-pulsar-end-to-end-question = Та же цепочка на публичных числах Xona Pulsar: сигнал, пролёт, сообщение, объединённое определение положения и точное позиционирование. (вычислено по модели)

js-cat-xona-pulsar-end-to-end-title = От начала до конца, Xona Pulsar

js-cat-xona-pulsar-signals-question = Насколько точно приёмник может измерять дальность по опубликованным сигналам X1 и X5 и насколько велик поиск при захвате? (таблица публичных сигналов)

js-cat-xona-pulsar-signals-title = Сигналы Xona Pulsar

js-geo-a-place = Место…

js-geo-axis-east = E +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = Форме городского каньона нужен движок 0.36.

js-geo-canyon-out-of-range = Значения городского каньона вне допустимого диапазона (азимут от 0 до 359.9°, ширина от 1 до 200 m, высоты от 0 до 500 m, антенна от 0 до 50 m); используется открытый горизонт.

js-geo-canyon-reduced = Приведение движком каньона к таблице из 360 интервалов.

js-geo-compute-failed = Движок не смог вычислить это небо: { $reason }

js-geo-computing = Вычисление…

js-geo-copy-link = Скопировать эту ссылку: { $url }

js-geo-count-below = Ниже горизонта

js-geo-count-hidden = Скрыто скайлайном

js-geo-count-in-view = В зоне видимости

js-geo-count-open-sky = Открытое небо

js-geo-count-used = В решении

js-geo-cursor-live = Азимут { $az }°, скайлайн { $el }°.

js-geo-dated-sky = Датированное небо настолько хорошо, насколько хороши элементы и их возраст; наборы настроек исключены.

js-geo-dop-geometric = геометрический

js-geo-dop-geometric-title = геометрический фактор ухудшения точности

js-geo-dop-horizontal = горизонтальный

js-geo-dop-horizontal-title = горизонтальный фактор ухудшения точности

js-geo-dop-position = положение, 3D

js-geo-dop-position-title = пространственный (3D) фактор ухудшения точности положения

js-geo-dop-time = время

js-geo-dop-time-title = временной фактор ухудшения точности

js-geo-dop-vertical = вертикальный

js-geo-dop-vertical-title = вертикальный фактор ухудшения точности

js-geo-east = E

js-geo-engine-not-running = Движок не работает в этом браузере ({ $reason }).

js-geo-err-geometry-object = ответ движка с геометрией не является объектом

js-geo-err-mc-object = ответ движка с расчётом Монте-Карло не является объектом

js-geo-err-no-sentences = в ответе движка нет предложений

js-geo-err-reply-kind-not-json = ответ движка ({ $what }) не является JSON

js-geo-err-reply-not-json = ответ движка не является JSON

js-geo-error-line = При σ_UERE = { $uere } m, в рамках заданной модели ошибок (данные движка): { $bits }.

js-geo-error-line-needs = Ошибка положения ≈ σ_UERE × HDOP по горизонтали и σ_UERE × VDOP по вертикали; для этого показателя нужен движок 0.36.

js-geo-error-rms-3d = 3D RMS σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = горизонтальная RMS σ_UERE × HDOP = { $m } m

js-geo-error-sigma = ошибка 1-сигма: восток { $east } m, север { $north } m

js-geo-fact-ellipse-1s = Эллипс, 1-сигма

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, большая ось { $deg }° от севера

js-geo-fact-ellipse-pct = Эллипс, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1-сигма × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = Внутри эллипса 95 %

js-geo-fact-inside-value = { $pct } % точек

js-geo-fact-line = { $key }: { $value }.

js-geo-fact-mc = Монте-Карло

js-geo-fact-mc-value = решений методом наименьших квадратов: { $n }, начальное значение { $seed }

js-geo-fact-rms-3d = RMS облака, 3D

js-geo-fact-rms-3d-beside = { $rms } m, для сравнения σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = RMS облака, горизонтальная

js-geo-fact-rms-h-beside = { $rms } m, для сравнения σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }: не GeoJSON (ожидался FeatureCollection, Feature или геометрия).

js-geo-gj-not-json = { $name }: не JSON ({ $reason }).

js-geo-gj-not-object = { $name }: не объект GeoJSON.

js-geo-gj-too-many = { $name }: объектов — { $count }; эта страница рисует не более { $max }.

js-geo-legend-item = { $label }: в решении { $used } из { $total }

js-geo-link-copied = Ссылка скопирована.

js-geo-link-copied-no-tle = Ссылка скопирована (без ваших вставленных элементов: ссылка открывает наборы настроек).

js-geo-mc-off = Выкл.

js-geo-missing-ellipse = эллипс ошибок

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = облако Монте-Карло

js-geo-missing-open-sky = доля открытого неба

js-geo-missing-skyline = скайлайн

js-geo-missing-tdop = TDOP

js-geo-needs = нужен движок 0.36

js-geo-needs-cap = Нужен движок 0.36

js-geo-no = Нет

js-geo-no-ellipse = Нет эллипса

js-geo-no-sats = Нет спутников для показа.

js-geo-north = N

js-geo-not-given = не задано

js-geo-note-elements-skipped = Пропущено наборов элементов — { $count }: { $list }.

js-geo-note-latitude-limited = Эта сборка движка моделирует площадки в пределах 89° от экватора; широта ограничена этим значением.

js-geo-note-leo-left-out = LEO: нужен движок 0.36; исключено.

js-geo-note-no-engine = Движок не работает в этом браузере, поэтому показывать нечего. Он работает как WebAssembly; браузер или узел, блокирующие WebAssembly, не могут запустить это представление.

js-geo-note-pick-one = Выберите хотя бы одну из систем GPS, Galileo и BeiDou.

js-geo-note-skyline-not-applied = Скайлайн нарисован, но не применён: для его применения нужен движок 0.36. Спутники за ним здесь по-прежнему учитываются.

js-geo-note-skyline-source = Скайлайн: { $source }.

js-geo-note-training-model = Модель учебного неба движка { $version } (nmea_training) на { $instant }: углы в целых градусах и DOP с одним десятичным знаком, как их несут предложения приёмника; определение положения использует не более 12 спутников, выбранных по мощности сигнала.

js-geo-note-unknown-systems = Пропущено записей спутников из систем, которые это представление не рисует: { $count }.

js-geo-off-leo = LEO: нужен движок 0.36.

js-geo-off-monte-carlo = Для облака Монте-Карло нужен движок 0.36.

js-geo-off-skyline = Для применения скайлайна нужен движок 0.36: здесь он только нарисован.

js-geo-offset-own = Смещение от эпохи ваших элементов ({ $epoch })

js-geo-offset-ref = Смещение от опорной эпохи орбитальных группировок

js-geo-open-sky-share = { $pct } % верхней полусферы

js-geo-out-of-range = Вне диапазона, поэтому оставлено последнее допустимое значение: { $names }.

js-geo-own-elements-at = Ваши собственные элементы на { $epoch }.

js-geo-pick-constellation = Выберите хотя бы одну орбитальную группировку.

js-geo-place-geiranger = Фьорд Гейрангер, Норвегия

js-geo-place-manhattan = Мидтаун Манхэттена, США

js-geo-place-oslo = Гавань Осло, Норвегия

js-geo-place-rotterdam = Порт Роттердама, Нидерланды

js-geo-place-singapore = Сингапурский пролив

js-geo-place-tallinn = Гавань Таллина, Эстония

js-geo-place-tromso = Тромсё, Норвегия

js-geo-plot-desc = Спутников на графике: { $total }, в решении: { $used }.

js-geo-preset-illustrative = Иллюстративный контур, нарисованный этой страницей; для применения скайлайна нужен движок 0.36.

js-geo-ready = Готово.

js-geo-ready-needs = Готово. Нужен движок 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: азимут { $az }°, возвышение { $el }°, скрыт скайлайном

js-geo-sat-unused = { $label } { $id }: азимут { $az }°, возвышение { $el }°, не используется

js-geo-sat-used = { $label } { $id }: азимут { $az }°, возвышение { $el }°, в решении

js-geo-scenarios-under = Сценарии движка под этим скайлайном:

js-geo-sky-canyon = Городской каньон

js-geo-sky-drawn = Нарисовано на скайплоте

js-geo-sky-open = Открытый горизонт

js-geo-sky-preset = Набор: { $name }

js-geo-sky-source = Небо: { $source }.

js-geo-skyline-city-street = Городская улица

js-geo-skyline-container = Контейнерный терминал

js-geo-skyline-fjord = Фьорд

js-geo-skyline-harbour = Подход к гавани

js-geo-skyline-load-failed = Не удалось загрузить скайлайн ({ $reason }).

js-geo-skyplot-downloaded = Скайплот скачан.

js-geo-skyplot-export-failed = Не удалось экспортировать скайплот ({ $reason }).

js-geo-source-geometry = Движок Kshana { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Движок Kshana { $version }, модель учебного неба

js-geo-south = S

js-geo-style-own-elements = Ваши элементы

js-geo-svg-refused = SVG движка был отклонён

js-geo-table-count = Спутников: { $n }, столько же, сколько на скайплоте.

js-geo-tle-epoch = Укажите эпоху UTC с 2000 по 2099 год.

js-geo-tle-paste-first = Сначала вставьте один или несколько двухстрочных наборов элементов.

js-geo-tle-too-large = Вставленные элементы больше 4 MiB — предела входных данных движка.

js-geo-used-masked = Нет: скрыт скайлайном

js-geo-using-own = Используются ваши собственные элементы. Ссылка содержит лишь сведение о том, что вы их использовали, но не сами элементы.

js-geo-wasm-blocked = WebAssembly заблокирован

js-geo-west = W

js-geo-why = Почему

js-geo-why-interim = Для эллипса ошибок и облака Монте-Карло нужен движок 0.36 (его функции sky_geometry и sky_monte_carlo); движок на этой странице старее.

js-geo-why-no-ellipse = Движок не дал эллипса для этой геометрии (слишком мало спутников для определения положения или вырожденная геометрия).

js-geo-why-no-ellipse-reason = Движок не дал эллипса для этой геометрии (слишком мало спутников для определения положения или вырожденная геометрия): { $reason }.

js-geo-why-waiting = Ожидание движка.

js-geo-yes = Да

js-hold-axis-seconds = секунды от первого отсчёта

js-hold-axis-tau = время наблюдения τ, s (лог.)

js-hold-axis-te = ошибка времени, ns

js-hold-band-title = Полоса восстановления ±{ $band } ns

js-hold-blurb-example = Отсчёты каждые 5 s: 600 s захват, GNSS отключён на 600 s, holdover, GNSS восстановлен на 2400 s. Запись сгенерирована для примера; это не измерение.

js-hold-blurb-ptp4l = Те же четыре шага, считанные из журнала сервопривода ptp4l (собственное смещение демона, в ns). Журнал написан для примера; демон не запускался.

js-hold-budget-exceeded = { $name } впервые превышен через { $s } s после отключения

js-hold-chip-baseline = Базовый уровень относительно масок

js-hold-chip-envelope = Огибающая holdover ePRTC-A

js-hold-chip-holdover = Holdover относительно масок

js-hold-chip-measured = измерено относительно маски

js-hold-chip-recovery = Восстановление

js-hold-chip-words = Слова

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } в зависимости от времени наблюдения, с пределами масок

js-hold-envelope-exceeded = Огибающая holdover ePRTC-A впервые превышена через { $s } s после отключения

js-hold-envelope-exceeded-short = { $verdict }, впервые превышена через { $s } s после отключения (запись короче периода огибающей)

js-hold-envelope-exceeded-value = { $verdict }, впервые превышена через { $s } s после отключения

js-hold-envelope-short = { $verdict } (запись короче периода огибающей)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: не JSON.

js-hold-file-read-here = { $name } прочитан здесь; ничего не отправлялось.

js-hold-file-too-large = { $name } больше, чем читает эта страница.

js-hold-from-record = запись результата

js-hold-from-record-decimated =
    запись результата, прореженная до { $have } из { $total ->
        [one] { $total } отсчёта
        [few] { $total } отсчётов
        [many] { $total } отсчётов
       *[other] { $total } отсчёта
    }

js-hold-gnss-removed = GNSS отключён

js-hold-gnss-removed-stated = GNSS отключён (указано оператором)

js-hold-gnss-restored = GNSS восстановлен

js-hold-gnss-restored-stated = GNSS восстановлен (указано оператором)

js-hold-largest-at = { $value } при T+{ $time } s

js-hold-limit-label = маска ±{ $ns } ns, { $step }

js-hold-limit-title = { $id }: ±{ $ns } ns, максимальная абсолютная ошибка времени на шаге { $step }

js-hold-mark-title = { $id } предел { $limit } ns при τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = н/д

js-hold-no-curve = Нет кривой ошибки времени: запись не удалось воспроизвести для построения.

js-hold-no-which-curve = В этом результате нет кривой { $which }.

js-hold-not-exceeded = не превышена

js-hold-not-recovered = не оставался в пределах полосы

js-hold-not-result = это не результат испытания holdover

js-hold-open-failed = Не удалось открыть { $title }: { $reason }.

js-hold-opening = Открытие { $title }…

js-hold-phase-baseline = Базовый уровень: захват

js-hold-phase-holdover = Holdover: GNSS отключён

js-hold-phase-recovery = Восстановление: GNSS восстановлен

js-hold-phase-title = { $phase }, от T+{ $from } s до { $to } s

js-hold-read-failed = Не удалось прочитать или нарисовать ({ $reason }).

js-hold-recorded = { $title }: записанный результат движка (версия { $version }).

js-hold-recovered = в пределах ±{ $band } ns в течение { $dwell } s, через { $after } s после возвращения GNSS

js-hold-result-not-json = результат не является JSON ({ $reason })

js-hold-result-not-loaded = записанный результат не загрузился

js-hold-row-envelope = Огибающая holdover ePRTC-A

js-hold-row-frequency = Удерживаемое смещение частоты (подогнанный наклон)

js-hold-row-largest = Наибольшая абсолютная ошибка времени

js-hold-row-length = Длительность holdover

js-hold-row-margin = Наименьший запас внутри огибающей

js-hold-row-peak = Пик после восстановления

js-hold-row-recovery = Восстановление

js-hold-row-recovery-step = Наибольший шаг при восстановлении

js-hold-row-residual = Остаток относительно этой линии (RMS)

js-hold-row-step = Шаг в момент отключения

js-hold-status-final = { $status } { $label }; измерено относительно маски.

js-hold-step-span = T+{ $from } до { $to } s

js-hold-te-aria = Ошибка времени по записи, с фазами и пределами масок

js-hold-te-line-title = Ошибка времени, ns

js-hold-te-note = Ошибка времени из { $from }. Два момента времени указал { $by }.

js-hold-th-budget = Бюджет

js-hold-th-budget-limit = Предел |TE|, ns

js-hold-th-first-exceeded = Впервые превышено после отключения, s

js-hold-th-largest = Наибольшее |TE|, ns

js-hold-th-limit = Предел, ns

js-hold-th-margin = Запас, ns

js-hold-th-mask = Маска

js-hold-th-mean = Среднее, ns

js-hold-th-measured-on = Измерено на

js-hold-th-metric = Метрика

js-hold-th-rms = RMS, ns

js-hold-th-samples = Отсчёты

js-hold-th-source = Источник

js-hold-th-span = Интервал

js-hold-th-step = Шаг

js-hold-th-value = Значение, ns

js-hold-th-verdict = Вердикт

js-hold-th-worst-at = Худшее при τ или T+, s

js-hold-title-example = Запись ошибки времени

js-hold-title-ptp4l = Журнал linuxptp

js-hold-why-no-samples = результат не содержит отсчётов ошибки времени (record.series), поэтому кривая не рисуется

js-hold-why-not-series = ряд в результате не является временным рядом (менее двух отсчётов или время не возрастает), поэтому кривая не рисуется

js-hold-why-sentence = { $why }.

js-hold-why-too-many = в ряду результата отсчётов: { $have }, а движок оценил { $scored }, поэтому кривая не рисуется

js-interf-attribution = Атрибуция

js-interf-build-failed = { $name }: не удалось построить ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] Построена { $n } карта за день по { $name } движком { $version } в этом браузере.
        [few] Построены { $n } карты за день по { $name } движком { $version } в этом браузере.
        [many] Построено { $n } карт за день по { $name } движком { $version } в этом браузере.
       *[other] Построены { $n } карты за день по { $name } движком { $version } в этом браузере.
    }

js-interf-built-detail = { $date }: опубликовано ячеек — { $published }, помечено — { $flagged }

js-interf-built-from-sample = Построено из синтетического образца { $kind } движком в этом браузере. Выдуманные донесения; никакого реального самолёта, судна или дня.

js-interf-built-maps =
    { $n ->
        [one] Построена { $n } карта ({ $detail }). Только агрегат: помеченная ячейка не называет помехи причиной.
        [few] Построены { $n } карты ({ $detail }). Только агрегат: помеченная ячейка не называет помехи причиной.
        [many] Построено { $n } карт ({ $detail }). Только агрегат: помеченная ячейка не называет помехи причиной.
       *[other] Построены { $n } карты ({ $detail }). Только агрегат: помеченная ячейка не называет помехи причиной.
    }

js-interf-built-none = { $name }: движок не построил ни одной карты.

js-interf-caveat-coverage = Покрытие определяется источником данных; прочтите примечания о покрытии.

js-interf-caveat-no-colour = Ячейка без цвета не наблюдалась. Это не доказательство того, что район был чист.

js-interf-caveat-not-finding = Ухудшенная или аномальная ячейка не является выводом о помехах. Существуют другие причины.

js-interf-caveat-past-reports = Это описание прошлых донесений о положении, а не прогноз и не измерение какого-либо приёмника.

js-interf-caveats = Оговорки

js-interf-cell-size-rule = Размер ячейки должен быть числом градусов больше 0 и не более 10 либо пустым (тогда 0.5).

js-interf-check-failed = { $name }: не удалось проверить ({ $reason }).

js-interf-click-cell = Щёлкните ячейку или переведите фокус на карту и используйте клавиши со стрелками, чтобы увидеть её показатели.

js-interf-close = Закрыть

js-interf-close-file = Закрыть { $name }

js-interf-col-affected = Затронуто

js-interf-col-cell-area = Площадь ячейки

js-interf-col-detectors = Детекторы

js-interf-col-observed = Наблюдалось

js-interf-col-sampled = В выборке

js-interf-col-share = Доля

js-interf-col-status = Статус

js-interf-coverage-limits = Ограничения охвата этого источника

js-interf-csv-too-big = { $name }: больше 24 MiB; постройте карту по фрагменту (инструмент командной строки принимает файл целиком).

js-interf-csv-too-big-short = { $name }: больше 24 MiB; постройте карту по фрагменту.

js-interf-custom-needs-licence = Для собственного набора данных нужны лицензия, её URL и текст указания авторства: они записываются в файл карты.

js-interf-dataset = Набор данных

js-interf-dates-rule = Даты в формате YYYY-MM-DD; пустое поле означает отсутствие ограничения.

js-interf-day = День

js-interf-day-aria = День ({ $kind })

js-interf-day-confounded-note = Этот день искажён сопутствующими факторами: ни одна ячейка не названа ухудшенной из-за фона этого дня. Ячейки, которые иначе выделялись бы, показаны как неоценённые.

js-interf-day-figures-aria = Показатели за день

js-interf-demo-csv-name = { $file } (синтетический образец)

js-interf-demo-failed = Не удалось открыть демонстрацию: { $reason }.

js-interf-demo-opened = Синтетическая демонстрация: три вымышленных файла по вымышленному району открытого океана (два дня ADS-B, один из них искажённый, и один день AIS). За ними не стоят ни реальные воздушные суда, ни суда, ни реальные дни. Используйте выбор дня на слое ADS-B.

js-interf-demo-route-name = route.csv (синтетический)

js-interf-describe-map = Карта { $kind } за { $date }: нарисовано ячеек: { $cells }, { $parts }. Ненарисованные ячейки не наблюдались.

js-interf-did-not-load = Не удалось загрузить { $url }

js-interf-engine-no-fn = В этой сборке движка (версия { $version }) нет { $fn }: она старше этой страницы. Эквивалент для командной строки есть на странице «Инструменты».

js-interf-engine-start-failed = Движок не удалось запустить здесь ({ $reason }). Открытие файлов карт выше по-прежнему работает.

js-interf-err-format-version = { $name }: это не поддерживаемая карта помех Kshana (format_version { $version }; эта страница поддерживает { $supported }).

js-interf-err-no-rows = { $name }: в этом отчёте нет rows[].

js-interf-err-not-json = { $name }: это не JSON ({ $reason }).

js-interf-err-not-map = { $name }: это GeoJSON, но не карта помех Kshana (нет члена kshana_interference_map).

js-interf-err-not-route = { $name }: это не отчёт Kshana об экспозиции маршрута (нет члена kshana_route_exposure).

js-interf-err-route-schema = { $name }: схема { $schema } не является { $expected }, которую читает эта страница.

js-interf-err-source-kind = { $name }: source_kind { $kind } не является ни adsb, ни ais.

js-interf-err-unknown-schema = { $name }: неизвестная схема { $schema }; эта страница читает { $supported }.

js-interf-foot-attribution = Указание авторства: { $text }

js-interf-foot-coverage = Охват: { $notes }

js-interf-foot-layer = Слой { $kind }, { $date }. Ненарисованные ячейки не наблюдались.

js-interf-foot-licence = Лицензия: { $licence }

js-interf-foot-licence-url = Лицензия: { $licence } ({ $url })

js-interf-grid = Сетка: квадратные ячейки { $size }° по широте и долготе ({ $type }). Ширина с востока на запад уменьшается с ростом широты.

js-interf-guards = Защита от других причин

js-interf-input = Вход

js-interf-land-set = Полигоны суши: { $name }.

js-interf-land-too-big = Этот файл суши больше 24 MiB.

js-interf-larger-than = { $name }: больше { $limit }; эта страница читает файлы карт не больше этого размера.

js-interf-layer-adsb-sub = ячейки, где воздушные суда сообщали о низкой точности навигации

js-interf-layer-ais-sub = ячейки, где суда сообщали о недостоверных позициях или движении

js-interf-layer-heading = Слой { $kind }

js-interf-layer-hidden = Слой { $kind } скрыт.

js-interf-layers-separate = ADS-B и AIS — отдельные слои со своими переключателями, легендами и строками лицензии. Они никогда не объединяются в одно цветовое поле или один подсчёт.

js-interf-legend-aria = Что означает каждое состояние ячейки; снимите отметку, чтобы приглушить такие ячейки

js-interf-licence = Лицензия

js-interf-licence-aria = Лицензия на данные { $name }

js-interf-licence-heading = Лицензия на данные и указание авторства

js-interf-map-aria = { $summary } Клавиши со стрелками перемещают между нарисованными ячейками.

js-interf-maps-open =
    { $n ->
        [one] Открыта { $n } карта.
        [few] Открыто { $n } карты.
        [many] Открыто { $n } карт.
       *[other] Открыто { $n } карты.
    }

js-interf-method-summary = Метод и оговорки

js-interf-no-cell-at = Нет ячейки в точке { $lat }, { $lon }: не наблюдалась. Это не свидетельствует о том, что район был свободен от помех.

js-interf-no-cell-drawn = ячейка не нарисована

js-interf-no-cells-draw = В этом файле нет ячеек для отрисовки.

js-interf-no-day-figures = В этом файле нет показателей на уровне дня.

js-interf-no-file-opened = Не удалось открыть ни одного файла.

js-interf-no-file-text = У открытых карт нет текста файла для проверки (они не были открыты как файлы).

js-interf-none = нет

js-interf-none-stated = (не указано)

js-interf-none-stated-file = (не указано в этом файле)

js-interf-north-abbr = С

js-interf-not-evaluated = не оценивалось

js-interf-not-opened-full = { $name }: не открыт, уже открыто карт: { $max }. Сначала закройте некоторые.

js-interf-nothing-open = Пока ничего не открыто.

js-interf-nothing-opened = Ничего не открыто.

js-interf-one-day = по одному дню

js-interf-opened-file-map = Открыто файлов: { $files }; открыто карт: { $maps }.

js-interf-opened-file-maps = Открыто файлов: { $files }; открыто карт: { $maps }.

js-interf-opened-files-map = Открыто файлов: { $files }; открыто карт: { $maps }.

js-interf-opened-files-maps = Открыто файлов: { $files }; открыто карт: { $maps }.

js-interf-opening-demo = Открывается синтетическая демонстрация…

js-interf-parameters = Параметры, зафиксированные до чтения каких-либо данных

js-interf-read-draw-failed = { $name }: не удалось прочитать или нарисовать ({ $reason }).

js-interf-read-failed = { $name }: не удалось прочитать ({ $reason }).

js-interf-read-with-map = Читайте вместе с картой

js-interf-reading = Чтение…

js-interf-route-aria = Экспозиция маршрута { $name }

js-interf-route-chip = Маршрут

js-interf-route-done =
    { $n ->
        [one] Экспозиция маршрута рассчитана на основе { $n } карты движком { $version }; отчёт показан ниже.
        [few] Экспозиция маршрута рассчитана на основе { $n } карт движком { $version }; отчёт показан ниже.
        [many] Экспозиция маршрута рассчитана на основе { $n } карт движком { $version }; отчёт показан ниже.
       *[other] Экспозиция маршрута рассчитана на основе { $n } карты движком { $version }; отчёт показан ниже.
    }

js-interf-route-explain = Доля длины маршрута в каждом состоянии, по дням и источникам. Четыре доли в сумме дают 1 и читаются вместе: низкая доля ухудшенных при высокой доле ненаблюдавшихся не показывает, что маршрут свободен. Строки ADS-B и AIS никогда не объединяются.

js-interf-route-exposure = Экспозиция маршрута

js-interf-route-needs-map = Сначала откройте или постройте хотя бы одну карту: маршрут проверяется по картам на этой странице.

js-interf-route-open-failed = Не удалось открыть маршрут: { $reason }.

js-interf-route-range = с { $from } по { $to }

js-interf-route-too-big = { $name }: больше 24 MiB.

js-interf-row-affected-share = Доля затронутых

js-interf-row-aircraft-affected = Затронуто воздушных судов

js-interf-row-aircraft-observed = Наблюдалось воздушных судов

js-interf-row-aircraft-sampled = Воздушных судов в выборке

js-interf-row-area = Площадь

js-interf-row-cell = Ячейка

js-interf-row-detectors = Сработавшие детекторы

js-interf-row-flagged = Отмечено: { $detector }

js-interf-row-status = Статус

js-interf-row-vessels-observed = Наблюдалось судов

js-interf-rows-skipped = Пропущено недопустимых строк: { $count }.

js-interf-rt-day = День

js-interf-rt-km = Км маршрута

js-interf-rt-licence = Лицензия и указание авторства карты

js-interf-rt-shares = Доли маршрута

js-interf-rt-source = Источник

js-interf-sample-failed = Не удалось открыть образец: { $reason }.

js-interf-save = Сохранить:

js-interf-save-report = Сохранить отчёт (JSON)

js-interf-show-layer = Показать этот слой

js-interf-st-anomalous-label = Аномально

js-interf-st-anomalous-text = По крайней мере один детектор в этот день отметил здесь достаточно различных судов (не менее 3 судов и 20 % от наблюдавшихся). Возможные причины включают помехи, но также и множество обычных.

js-interf-st-confounded-label = День искажён

js-interf-st-confounded-text = Медианная доля ячеек за весь день была высокой, что указывает на причину широкого масштаба. В такой день ни одна ячейка не объявляется ухудшенной; эта ячейка иначе выделялась бы.

js-interf-st-degraded-label = Ухудшено

js-interf-st-degraded-text = Высокая доля воздушных судов в выборке в этот день сообщила здесь о низкой точности навигации, значительно выше медианной ячейки дня. Причина не указывается.

js-interf-st-no-background-label = Нет оценки фона

js-interf-st-no-background-text = Фон дня (типичная доля воздушных судов, сообщающих о низкой точности) не удалось оценить по достаточному числу ячеек, поэтому ни одна ячейка с ним не сравнивается и никаких заключений не делается.

js-interf-st-not-anomalous-label = Не аномально

js-interf-st-not-anomalous-text = Наблюдалось, и ни один детектор не сработал. Это не доказательство того, что ничего не происходило.

js-interf-st-not-degraded-label = Не ухудшено

js-interf-st-not-degraded-text = Попало в выборку, и доля воздушных судов, сообщающих о низкой точности, ничем не выделялась. Это не доказательство того, что ничего не происходило.

js-interf-st-too-few-label = Слишком мало воздушных судов

js-interf-st-too-few-text = Опубликовано (наблюдалось не менее 5 различных воздушных судов), но в выборку попало менее 10 воздушных судов, поэтому заключение не делается.

js-interf-starting-build = Запуск движка и построение…

js-interf-starting-route = Запуск движка и проверка маршрута…

js-interf-state-clear-adsb = Чисто

js-interf-state-clear-adsb-text = Наблюдалось при достаточном числе воздушных судов и не отмечено. Это не доказательство того, что ничего не происходило.

js-interf-state-clear-ais = Чисто

js-interf-state-clear-ais-text = Наблюдалось при достаточном числе судов и не отмечено. Это не доказательство того, что ничего не происходило.

js-interf-state-degraded-adsb = Ухудшено

js-interf-state-degraded-adsb-text = Высокая доля воздушных судов в выборке в этот день сообщила здесь о низкой точности навигации, значительно выше медианной ячейки дня.

js-interf-state-degraded-ais = Аномально

js-interf-state-degraded-ais-text = По крайней мере один детектор в этот день отметил здесь достаточно различных судов (не менее 3 судов и 20 % от наблюдавшихся).

js-interf-state-notobs-adsb = Не наблюдалось

js-interf-state-notobs-adsb-text = Ячейка не нарисована: наблюдалось слишком мало воздушных судов, чтобы её опубликовать. Это не свидетельствует о том, что район был свободен от помех.

js-interf-state-notobs-ais = Не наблюдалось

js-interf-state-notobs-ais-text = Ячейка не нарисована: наблюдалось слишком мало судов, чтобы её опубликовать. Это не свидетельствует о том, что район был свободен от помех.

js-interf-state-unassessed-adsb = Не оценено

js-interf-state-unassessed-adsb-text = Наблюдалось, но в выборку попало слишком мало воздушных судов, день был искажён или фон дня не удалось оценить, поэтому заключение не делается.

js-interf-state-unassessed-ais = Не оценено

js-interf-state-unassessed-ais-text = Наблюдалось, но заключение не делается.

js-interf-status-unknown = Статус, который эта страница не описывает.

js-interf-table-first = Показаны первые { $shown } из { $total } ячеек, сначала значимые заключения.

js-interf-table-summary = Все нарисованные ячейки в виде таблицы ({ $n })

js-interf-the-day = День

js-interf-unknown-date = неизвестная дата

js-interf-warn-cell-size = Этот файл использует размер ячейки { $size }°, не совпадающий с предварительно зарегистрированным: это не предварительно зарегистрированный метод, поэтому его заключения несопоставимы с файлами, которые его используют.

js-interf-warn-cell-size-known = Этот файл использует размер ячейки { $size }°, не совпадающий с предварительно зарегистрированным ({ $registered }°): это не предварительно зарегистрированный метод, поэтому его заключения несопоставимы с файлами, которые его используют.

js-interf-warn-day-confounded = Этот день искажён сопутствующими факторами: ни одна ячейка не названа ухудшенной из-за фона этого дня (сама медианная доля ячеек была высокой).

js-interf-warn-flag-disagrees = Ячеек, у которых флаг «degraded» расходится со статусом: { $count }. Рисуется статус.

js-interf-warn-no-licence = В этом файле нет текста { $fields }. Он показан, но карту без лицензии и указания авторства не следует публиковать повторно.

js-interf-warn-on-land-off = Детектор «на суше» был отключён для этого файла (полигоны суши не заданы).

js-interf-warn-skipped = Пропущено недопустимых объектов GeoJSON: { $count }.

js-interf-warn-unknown-status = Значения статуса, которых эта страница не знает: { $values }. Они рисуются как «нет заключения».

js-interf-withheld = скрыто (менее 5)

js-interf-written-by = записано Kshana { $version }

js-kind-axis-3-d-position-error-m = ошибка 3-D положения (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = дрожание кода (m)

js-kind-axis-code-tracking-jitter-m = дрожание слежения за кодом (m)

js-kind-axis-doppler-shift-hz = доплеровский сдвиг (Hz)

js-kind-axis-effective-c-n0-db-hz = эффективное C/N0 (dB-Hz)

js-kind-axis-elevation = угол места (°)

js-kind-axis-fit-interval-s = интервал аппроксимации (s)

js-kind-axis-formal-position-sigma-m = формальная sigma положения (m)

js-kind-axis-latitude = широта (°)

js-kind-axis-leo-satellites-added-to-the = спутники LEO, добавленные к решению

js-kind-axis-mean-satellites-in-view = среднее число спутников в зоне видимости

js-kind-axis-median-dilution-of-precision = медианный геометрический фактор DOP

js-kind-axis-median-error-m = медианная ошибка (m)

js-kind-axis-median-pdop = медианный PDOP

js-kind-axis-metres = метры

js-kind-axis-observation-window-s = окно наблюдения (s)

js-kind-axis-offset-from-the-signal-s = смещение от центра сигнала (MHz)

js-kind-axis-offset-from-the-snapshot-centre = смещение от центра снимка (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = ошибка положения (m)

js-kind-axis-power-spectral-density-db-hz = спектральная плотность мощности (dB/Hz, единичная мощность)

js-kind-axis-power-spectral-density-dbw-hz = спектральная плотность мощности (dBW/Hz)

js-kind-axis-probability-of-detection = вероятность обнаружения

js-kind-axis-range-error-m = ошибка дальности (m)

js-kind-axis-relays = ретрансляторы

js-kind-axis-sisre-root-mean-square-m = SISRE, среднеквадратичное значение (m)

js-kind-axis-time-error-ns = ошибка времени (ns)

js-kind-axis-time-s = время (s)

js-kind-axis-time-since-the-start-min = время с начала (min)

js-kind-axis-update-period-s = период обновления (s)

js-kind-cap-body-pnt-label = Позиционирование по ретрансляторам

js-kind-cap-campaign-label = Кампания

js-kind-cap-constellation-design-label = Покрытие

js-kind-cap-leo-navmsg-label = Навигационное сообщение

js-kind-cap-leo-pass-label = Пролёт и линия связи

js-kind-cap-leo-pnt-chain-label = Сквозная цепочка

js-kind-cap-leo-ppp-label = Позиционирование

js-kind-cap-leo-pvt-label = Позиционирование

js-kind-cap-leo-signal-label = Проект сигнала

js-kind-cap-lunar-llr-datum-label = Реперная точка лазерной локации

js-kind-cap-ntn-positioning-label = Позиционирование

js-kind-cap-solar-system-label = Солнечная система

js-kind-cap-spectrum-label = Спектр

js-kind-guided-doppler-error-hz = Ошибка Доплера (Hz)

js-kind-guided-duration-s = Длительность (s)

js-kind-guided-earth-range-error-m = Ошибка дальности до Земли (m)

js-kind-guided-elevation-mask = Маска угла места (°)

js-kind-guided-first-jammer-bandwidth-mhz = Полоса первого источника подавления (MHz)

js-kind-guided-first-jammer-power-dbw = Мощность первого источника подавления (dBW)

js-kind-guided-first-jammer-range-m = Дальность до первого источника подавления (m)

js-kind-guided-first-jammer-received-power-dbw = Принимаемая мощность первого источника подавления (dBW)

js-kind-guided-first-phase-length-s = Длительность первой фазы (s)

js-kind-guided-first-shell-altitude-km = Высота первой оболочки (km)

js-kind-guided-first-shell-inclination = Наклонение первой оболочки (°)

js-kind-guided-first-signal-bandwidth-hz = Полоса первого сигнала (Hz)

js-kind-guided-first-system-range-error-m = Ошибка дальности первой системы (m)

js-kind-guided-fit-interval-s = Интервал аппроксимации (s)

js-kind-guided-gravity-field-degree = Степень гравитационного поля

js-kind-guided-grid-step = Шаг сетки (°)

js-kind-guided-integration-time-s = Время интегрирования (s)

js-kind-guided-leo-satellites-in-the-sweep = Спутники LEO в серии

js-kind-guided-loop-bandwidth-hz = Полоса контура (Hz)

js-kind-guided-monte-carlo-runs = Прогоны Монте-Карло

js-kind-guided-network-synchronisation-error-m = Ошибка синхронизации сети (m)

js-kind-guided-orbit-altitude-km = Высота орбиты (km)

js-kind-guided-orbit-determination-error-m = Ошибка определения орбиты (m)

js-kind-guided-orbit-inclination = Наклонение орбиты (°)

js-kind-guided-pdop-threshold = Порог PDOP

js-kind-guided-peak-elevation-of-the-pass = Максимальный угол места пролёта (°)

js-kind-guided-points-per-orbit-track = Точек на трассу орбиты

js-kind-guided-receiver-noise-figure-db = Коэффициент шума приёмника (dB)

js-kind-guided-receiver-power-when-awake-mw = Мощность приёмника в активном режиме (mW)

js-kind-guided-reference-c-n0-db-hz = Опорное C/N0 (dB-Hz)

js-kind-guided-relay-altitude-km = Высота ретрансляторов (km)

js-kind-guided-relay-inclination = Наклонение ретрансляторов (°)

js-kind-guided-relay-planes = Плоскости ретрансляторов

js-kind-guided-relay-range-error-m = Ошибка дальности до ретранслятора (m)

js-kind-guided-relays-per-plane = Ретрансляторов в плоскости

js-kind-guided-runs-per-case = Прогонов на случай

js-kind-guided-satellite-altitude-km = Высота спутника (km)

js-kind-guided-second-system-range-error-m = Ошибка дальности второй системы (m)

js-kind-guided-shared-condition = Общее условие

js-kind-guided-slant-electron-content-tecu = Наклонное электронное содержание (TECU)

js-kind-guided-slant-range-km = Наклонная дальность (km)

js-kind-guided-spoofed-offset-m = Смещение при спуфинге (m)

js-kind-guided-spoofing-starts-s = Начало спуфинга (s)

js-kind-guided-sweep-from = Серия от

js-kind-guided-sweep-steps = Шагов серии

js-kind-guided-sweep-to = Серия до

js-kind-guided-timeline-step-s = Шаг временной шкалы (s)

js-kind-guided-tracking-threshold-db-hz = Порог слежения (dB-Hz)

js-kind-guided-transmit-power-dbw = Мощность передачи (dBW)

js-kind-guided-update-period-s = Период обновления (s)

js-kind-guided-user-latitude = Широта пользователя (°)

js-kind-hint-a-band-under-this-carrier = диапазон с отношением несущей к шумовой плотности ниже этого значения потерял захват

js-kind-hint-a-grid-point-is-available = точка сетки доступна, пока её геометрический фактор по положению ниже этого значения

js-kind-hint-a-satellite-must-be-this = чтобы считаться в зоне видимости, спутник должен быть не ниже этой высоты над горизонтом

js-kind-hint-a-satellite-must-be-this-2 = чтобы использоваться, спутник должен быть не ниже этой высоты над горизонтом

js-kind-hint-a-satellite-of-the-first = спутник первой системы должен быть не ниже этой высоты над горизонтом

js-kind-hint-arc-one-message-is-fitted = дуга, на которой аппроксимируется одно сообщение

js-kind-hint-code-tracking-loop-noise-bandwidth = шумовая полоса контура слежения за кодом

js-kind-hint-detail-of-the-truth-orbit = детализация гравитационной модели эталонной орбиты

js-kind-hint-distance-from-the-first-jammer = расстояние от первого источника подавления до приёмника

js-kind-hint-distance-to-the-satellite-in = расстояние до спутника в сравнении диапазонов

js-kind-hint-drawn-while-acquiring-and-tracking = отрисовывается при захвате и слежении

js-kind-hint-equivalent-isotropically-radiated-power-of = эквивалентная изотропно излучаемая мощность первого источника подавления

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = эквивалентная изотропно излучаемая мощность диапазона

js-kind-hint-filter-runs-averaged-for-each = прогонов фильтра, усредняемых для каждого случая (чем больше, тем медленнее)

js-kind-hint-first-value-of-the-swept = первое значение изменяемого параметра

js-kind-hint-height-of-the-chain-s = высота спутника цепочки

js-kind-hint-height-of-the-first-shell = высота орбит первой оболочки

js-kind-hint-height-of-the-relay-orbits = высота орбит ретрансляторов над телом

js-kind-hint-height-of-the-satellite-whose = высота спутника, сообщение которого аппроксимируется

js-kind-hint-how-far-the-spoofer-moves = насколько спуфер смещает вычисленное положение

js-kind-hint-how-finely-each-orbit-is = насколько часто каждая орбита дискретизируется для рисунка

js-kind-hint-how-high-the-satellite-climbs = на какую высоту поднимается спутник

js-kind-hint-how-long-the-first-phase = как долго длится первая фаза

js-kind-hint-how-long-the-receiver-integrates = как долго приёмник интегрирует для одной дальности

js-kind-hint-how-many-low-orbit-satellites = сколько низкоорбитальных спутников добавляет серия по геометрии

js-kind-hint-how-many-seeded-runs-make = сколько прогонов с начальным значением (seed) образуют ансамбль

js-kind-hint-how-many-values-are-run = сколько значений прогоняется

js-kind-hint-how-often-a-new-message = как часто выдаётся новое сообщение

js-kind-hint-how-wide-the-first-jammer = как широко первый источник подавления распределяет свою мощность

js-kind-hint-ionosphere-along-the-path-in = ионосфера вдоль трассы, в единицах полного электронного содержания

js-kind-hint-last-value-of-the-swept = последнее значение изменяемого параметра

js-kind-hint-length-of-each-filter-run = длительность каждого прогона фильтра

js-kind-hint-length-of-the-run = длительность прогона

js-kind-hint-length-of-the-timeline = длина временной шкалы

js-kind-hint-occupied-bandwidth-of-the-first = занимаемая полоса первого опорного сигнала

js-kind-hint-one-sigma-doppler-measurement-error = ошибка измерения Доплера (одна сигма)

js-kind-hint-one-sigma-error-of-a = ошибка дальности до ретранслятора (одна сигма)

js-kind-hint-one-sigma-error-of-the = ошибка двусторонней дальности от Земли (одна сигма)

js-kind-hint-orbital-planes-of-the-navigation = орбитальные плоскости навигационных ретрансляторов

js-kind-hint-power-of-the-first-jammer = мощность первого источника подавления на входе приёмника

js-kind-hint-raises-the-noise-floor-under = повышает уровень шума под каждым диапазоном

js-kind-hint-satellites-in-each-plane = спутников в каждой плоскости

js-kind-hint-sets-the-doppler-range-a = задаёт диапазон Доплера, который должен охватить холодный поиск

js-kind-hint-signal-in-space-range-error = ошибка дальности в пространстве сигнала первой системы

js-kind-hint-signal-in-space-range-error-2 = ошибка дальности в пространстве сигнала второй системы

js-kind-hint-signal-level-the-tracking-figures = уровень сигнала, для которого приводятся показатели слежения

js-kind-hint-spacing-of-the-latitude-and = шаг сетки по широте и долготе

js-kind-hint-spacing-of-the-shared-mission = шаг общей временной сетки миссии

js-kind-hint-the-part-of-the-range = часть ошибки дальности, которую сообщение не может устранить

js-kind-hint-the-value-every-member-runs = значение, при котором работает каждый член

js-kind-hint-tilt-of-that-orbit = наклон этой орбиты

js-kind-hint-tilt-of-the-first-shell = наклон плоскостей первой оболочки

js-kind-hint-tilt-of-the-relay-planes = наклон плоскостей ретрансляторов

js-kind-hint-timing-error-between-satellites-as = ошибка синхронизации между спутниками, выраженная как дальность

js-kind-hint-when-the-spoofer-captures-the = когда спуфер захватывает приёмник

js-kind-hint-where-the-receiver-stands = где находится приёмник

js-kind-hint-where-the-user-stands = где находится пользователь

js-kind-label-3-d-error = ошибка 3-D

js-kind-label-3-d-error-time-of = ошибка 3-D, время прихода

js-kind-label-a-corrupted-frame-is-rejected = повреждённый кадр отклоняется

js-kind-label-all-channels = все каналы

js-kind-label-availability = Доступность

js-kind-label-band = Диапазон

js-kind-label-bodies = Тела

js-kind-label-body = Тело

js-kind-label-both = оба

js-kind-label-case = Случай

js-kind-label-class = Класс

js-kind-label-code-jitter = дрожание кода

js-kind-label-constellation = Орбитальная группировка

js-kind-label-doppler = Доплер

js-kind-label-event = Событие

js-kind-label-evidence = Доказательства

js-kind-label-fewest-in-view = Наименьшее в зоне видимости

js-kind-label-field = Поле

js-kind-label-first-detection-after-onset = Первое обнаружение после начала

js-kind-label-frame-length = Длина кадра

js-kind-label-fused = объединённое

js-kind-label-fused-cap = Объединённое

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS и LEO

js-kind-label-gnss-channels = Каналы GNSS

js-kind-label-gnss-highest-in-sky = GNSS { $id } (выше всех над горизонтом)

js-kind-label-gnss-only = только GNSS

js-kind-label-gnss-only-cap = Только GNSS

js-kind-label-gnss-signal = Сигнал GNSS

js-kind-label-hdop = HDOP

js-kind-label-highest = Наибольшее

js-kind-label-horizontal-error = горизонтальная ошибка

js-kind-label-horizontal-error-2 = Горизонтальная ошибка

js-kind-label-jammer = Источник подавления

js-kind-label-jump-threshold = Порог скачка

js-kind-label-largest-range-jump = Наибольший скачок дальности

js-kind-label-largest-range-jump-against-the = наибольший скачок дальности относительно порога

js-kind-label-leo = LEO

js-kind-label-leo-channels = Каналы LEO

js-kind-label-leo-only = только LEO

js-kind-label-light-time-from-observer = Время распространения света от { $observer }

js-kind-label-light-time-from-the-observer = Время распространения света от наблюдателя

js-kind-label-light-time-one-way = Время распространения света, в одну сторону

js-kind-label-lowest = Наименьшее

js-kind-label-lowest-c-n0 = Наименьшее C/N0

js-kind-label-mean = Среднее

js-kind-label-mean-in-view = Среднее в зоне видимости

js-kind-label-median-convergence = Медианная сходимость

js-kind-label-median-pdop = Медианный PDOP

js-kind-label-member-runs = Прогоны членов

js-kind-label-message-switch-iod = смена сообщения, выпуск данных с { $old } на { $new }

js-kind-label-mission-length = Длительность миссии

js-kind-label-model = модель

js-kind-label-monte-carlo-runs = Прогоны Монте-Карло

js-kind-label-noise-floor = Уровень шума

js-kind-label-parameters = Параметры

js-kind-label-payload = Полезная нагрузка

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, 95-й процентиль

js-kind-label-peak-elevation = Максимальный угол места

js-kind-label-peak-tracked-c-n0 = Пиковое отслеживаемое C/N0

js-kind-label-phase = Фаза

js-kind-label-predicted-horizontal-sigma = прогнозируемая горизонтальная sigma

js-kind-label-quantisation-position = Квантование, положение

js-kind-label-range-error = ошибка дальности

js-kind-label-relays-above-the-mask = ретрансляторы над маской

js-kind-label-relays-and-earth-link = ретрансляторы и линия связи с Землёй

js-kind-label-relays-only = только ретрансляторы

js-kind-label-satellite = Спутник

js-kind-label-satellites = Спутники

js-kind-label-satellites-used = Использовано спутников

js-kind-label-signal = Сигнал

js-kind-label-signal-chip-spacing = { $name } (разнос чипов { $spacing })

js-kind-label-sisre-after-quantisation = SISRE после квантования

js-kind-label-sisre-root-mean-square = SISRE, среднеквадратичное значение

js-kind-label-spoofing-starts = начало спуфинга

js-kind-label-standard-deviation = Стандартное отклонение

js-kind-label-sun-separation = Угловое расстояние до Солнца

js-kind-label-sweep-runs = Прогоны серии

js-kind-label-system = Система

js-kind-label-time-above-the-mask = Время над маской

js-kind-label-time-error-root-mean-square = Ошибка времени, среднеквадратичное значение

js-kind-label-tracked-component = отслеживаемый компонент

js-kind-label-tracking-threshold = Порог слежения

js-kind-label-transmit-bandwidth = Полоса передачи

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Оценка Уэлча по синтезированным отсчётам

js-kind-label-whole-signal = весь сигнал

js-kind-label-wideband-j-s-tolerated = Допустимое широкополосное J/S

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Доступность в наихудшем пункте

js-kind-no = нет

js-kind-note-a-gap-is-an-epoch = Разрыв — это эпоха, в которой в зоне видимости слишком мало ретрансляторов для определения положения.

js-kind-note-a-helmert-transform-is-the = Преобразование Гельмерта — это семипараметрический сдвиг, поворот и масштаб между двумя системами отсчёта.

js-kind-note-a-low-earth-orbit-leo = Спутник на низкой околоземной орбите (LEO) пересекает небо за минуты, поэтому его C/N0 (отношение несущей к шумовой плотности) растёт и падает колоколом; спутник GNSS за то же время почти не смещается.

js-kind-note-a-receiver-independent-exchange-format = Запись в стиле RINEX 4 (Receiver Independent Exchange Format). Типы записей LEO — расширение Kshana, как сказано в заголовке.

js-kind-note-a-single-pass-fixes-the = Один пролёт определяет направление вдоль трассы гораздо точнее, чем поперёк неё.

js-kind-note-aos-is-acquisition-of-signal = AOS — это захват сигнала, TCA — время наибольшего сближения, LOS — потеря сигнала.

js-kind-note-c-n0-is-the-carrier = C/N0 — это отношение несущей к шумовой плотности. Диапазон ниже порога слежения приёмника потерял захват.

js-kind-note-cells-are-the-code-and = Ячейки — это кодовые и доплеровские элементы, которые должен проверить холодный поиск.

js-kind-note-cold-is-a-first-fix = Холодный — это первое определение положения без предварительных сведений; горячий — определение вскоре после предыдущего.

js-kind-note-dilution-of-precision-dop-scales = Геометрический фактор DOP (ухудшение точности) пересчитывает ошибку дальности в ошибку положения: G — геометрический, P — по положению, H — горизонтальный, V — вертикальный. Процентили берутся по всем точкам сетки и эпохам.

js-kind-note-drawn-at-the-strongest-signal = Отрисовано при самом сильном сигнале за прогон. Разрыв — это участок, где в зоне видимости нет ни одного спутника.

js-kind-note-each-body-carries-its-own = Каждое тело несёт собственную метку уровня доказательств. Время распространения света дано в одну сторону, от наблюдателя, названного в сценарии.

js-kind-note-each-row-is-one-full = Каждая строка — это один полный прогон движка для изменяемого сценария.

js-kind-note-each-rule-is-a-switch = Каждое правило — это переключение на более новое сообщение в середине пролёта.

js-kind-note-each-signal-is-drawn-about = Каждый сигнал отрисован вокруг своей центральной частоты. Разрыв — это спектральный нуль.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP — это эквивалентная изотропно излучаемая мощность.

js-kind-note-every-phase-is-an-ordinary = Каждая фаза — это обычный прогон сценария. Хеши идентифицируют входные данные каждого члена и его документ результата.

js-kind-note-iod-is-the-issue-of = IOD — это выпуск данных: порядковый номер сообщения.

js-kind-note-j-s-is-the-jammer = J/S — это отношение мощности источника подавления к мощности сигнала. Доля слежения — это часть прогона, в течение которой диапазон остаётся выше порога.

js-kind-note-p05-p50-and-p95-are = p05, p50 и p95 — это 5-й, 50-й и 95-й процентили. ci95 — 95-процентный доверительный интервал для среднего.

js-kind-note-parameters-are-public-with-a = Параметры относятся к уровню PUBLIC (с источником), REPRESENTATIVE или WORKSHOP, как указано в каждой предустановке.

js-kind-note-precise-point-positioning-ppp-converges = Прецизионное абсолютное позиционирование (PPP) сходится, когда ошибка остаётся ниже критерия. NEES — нормированный квадрат ошибки оценивания, проверка согласованности фильтра.

js-kind-note-sisre-defined = SISRE — это ошибка дальности в пространстве сигнала: то, что передаваемое сообщение добавляет к дальности пользователя. Здесь это ошибка представления сообщения относительно собственной эталонной орбиты движка.

js-kind-note-sisre-is-the-signal-in = SISRE — это ошибка дальности в пространстве сигнала, принятая для передаваемой орбиты и часов каждой системы.

js-kind-note-ssc-is-the-spectral-separation = SSC — это коэффициент спектрального разделения: какая часть мощности одного сигнала попадает в приёмник другого. Прочерк означает, что два сигнала не перекрываются.

js-kind-note-the-chain-runs-the-signal = Цепочка выполняет по порядку этапы сигнала, пролёта, навигационного сообщения, позиционирования и прецизионного позиционирования. Каждая строка — это число, которое вычислил один этап и использовал следующий.

js-kind-note-the-doppler-and-pass-geometry = Монитор Доплера и геометрии пролёта сравнивает измеренные скорости изменения дальности с предсказанными по орбитам. Правило отмечает начало работы спуфера.

js-kind-note-the-engine-draws-its-spectrum = Движок отрисовывает модель спектра как синфазные и квадратурные (IQ) отсчёты в один момент времени и по ним заново оценивает спектр. Те же отсчёты составляют экспорт SigMF (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = Собственный документированный двоичный кадр движка, замкнутый 24-разрядной циклической проверкой избыточности (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = Среднеквадратичная полоса Габора определяет, насколько точно по сигналу можно измерять дальность.

js-kind-note-the-largest-jammer-to-signal = Наибольшее отношение мощности источника подавления к мощности сигнала (J/S), при котором каждый сигнал ещё отслеживается, для источника с непрерывной несущей (CW), с согласованным спектром и широкополосного.

js-kind-note-the-shapiro-delay-is-the = Задержка Шапиро — это дополнительное время распространения света из-за гравитации Солнца вдоль трассы.

js-kind-note-the-spectrum-kind-and-the = Вид spectrum и вид jamming вычисляют одну и ту же линию связи двумя способами; последний столбец — их разность.

js-kind-note-time-of-arrival-toa-ranging = Дальнометрия по времени прихода (TOA) в нисходящей линии нетеррестриальной сети (NTN): чем шире сигнал, тем точнее дальность.

js-kind-note-what-half-a-least-significant = Во что обходится половина младшего значащего бита (LSB) каждого поля для положения и для часов, в пересчёте на дальность.

js-kind-rowhead-block = Блок

js-kind-rowhead-condition = Условие

js-kind-rowhead-figure = Показатель

js-kind-rowhead-member = Член

js-kind-rowhead-metric = Метрика

js-kind-rowhead-monitor = Монитор

js-kind-rowhead-phase = Фаза

js-kind-rowhead-satellite = Спутник

js-kind-rowhead-signal = Сигнал

js-kind-rowhead-solution = Решение

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = только Доплер

js-kind-sub-from-to = от { $from } до { $to }

js-kind-sub-fused = объединённое

js-kind-sub-gnss-and-leo-latitude = GNSS и LEO, широта { $lat }°

js-kind-sub-gnss-only = только GNSS

js-kind-sub-gnss-only-latitude = только GNSS, широта { $lat }°

js-kind-sub-model-fit-seconds = { $model }, аппроксимация { $fit } s

js-kind-threshold-4-needed-for-a-fix = для определения положения нужно 4

js-kind-threshold-convergence-criterion = критерий сходимости

js-kind-threshold-elevation-mask = маска угла места

js-kind-threshold-gnss-median = медиана GNSS

js-kind-threshold-tracking-threshold = порог слежения

js-kind-title-acquisition = Захват

js-kind-title-against-a-simulated-campaign = В сравнении с имитированной кампанией

js-kind-title-assumptions = Допущения

js-kind-title-band-trade-at-equal-transmit = Сравнение диапазонов при равной мощности передачи

js-kind-title-bands = Диапазоны

js-kind-title-beside-the-published-figures = Рядом с опубликованными значениями

js-kind-title-beside-the-published-speed-up = Рядом с опубликованным ускорением

js-kind-title-bodies = Тела

js-kind-title-body = Тело

js-kind-title-by-latitude = По широте

js-kind-title-c-n0-by-band-over = C/N0 по диапазонам за прогон

js-kind-title-c-n0-over-the-pass = C/N0 за пролёт

js-kind-title-cases = Случаи

js-kind-title-central-body = Центральное тело

js-kind-title-closed-form-doppler-against-finite = Доплер в замкнутой форме и конечные разности

js-kind-title-code-tracking-jitter = Дрожание слежения за кодом

js-kind-title-code-tracking-jitter-against-c = Дрожание слежения за кодом в зависимости от C/N0

js-kind-title-combined-over-the-members = Сводно по членам

js-kind-title-compatibility-with-gnss-signals = Совместимость с сигналами GNSS

js-kind-title-constellations = Орбитальные группировки

js-kind-title-continuity-across-message-switches = Непрерывность при смене сообщений

js-kind-title-cross-check-against-the-jamming = Перекрёстная проверка с видом jamming

js-kind-title-datum-accuracy = Точность реперной точки

js-kind-title-dilution-of-precision-over-the = Геометрический фактор DOP по всей сетке

js-kind-title-doppler = Доплер

js-kind-title-doppler-envelopes = Огибающие Доплера

js-kind-title-doppler-only-fix = Определение положения только по Доплеру

js-kind-title-doppler-over-the-pass = Доплер за пролёт

js-kind-title-doppler-positioning-from-one-pass = Доплеровское позиционирование по одному пролёту

js-kind-title-earth-link = Линия связи с Землёй

js-kind-title-elevation = Угол места

js-kind-title-encoded-frame = Закодированный кадр

js-kind-title-epoch = Эпоха

js-kind-title-epoch-and-frame = Эпоха и система координат

js-kind-title-events = События

js-kind-title-every-node-of-the-sweep = Каждый узел серии

js-kind-title-field-table = Таблица полей

js-kind-title-figures-of-merit = Показатели качества

js-kind-title-filter-noise = Шум фильтра

js-kind-title-fit-interval-trade = Компромисс по интервалу аппроксимации

js-kind-title-fix-quality-against-observation-window = Качество определения положения в зависимости от окна наблюдения

js-kind-title-frame-checks = Проверки кадра

js-kind-title-frame-hexadecimal = Кадр, шестнадцатеричный

js-kind-title-geometry-against-latitude = Геометрия в зависимости от широты

js-kind-title-geometry-as-leo-satellites-are = Геометрия по мере добавления спутников LEO

js-kind-title-geometry-position-dilution-of-precision = Геометрия: геометрический фактор DOP по положению

js-kind-title-global-coverage = Глобальное покрытие

js-kind-title-gnss-leo-and-fused = GNSS, LEO и объединённое

js-kind-title-gnss-reference = Эталон GNSS

js-kind-title-hand-offs-between-phases = Передача данных между фазами

js-kind-title-helmert-fit = Аппроксимация Гельмерта

js-kind-title-helmert-transform-parameters = Параметры преобразования Гельмерта

js-kind-title-inputs = Входные данные

js-kind-title-ionosphere-free-band-pairs = Пары диапазонов, свободные от ионосферы

js-kind-title-jammer-tolerance = Устойчивость к источнику подавления

js-kind-title-jammers = Источники подавления

js-kind-title-joint-fix = Совместное определение положения

js-kind-title-leo-against-gnss = LEO в сравнении с GNSS

js-kind-title-limitations = Ограничения

js-kind-title-links = Ссылки

js-kind-title-member-runs = Прогоны членов

js-kind-title-members-under-the-shared-conditions = Члены при общих условиях

js-kind-title-message = Сообщение

js-kind-title-message-models-compared = Сравнение моделей сообщения

js-kind-title-message-switches = Смены сообщения

js-kind-title-metric-against-axis = { $metric } в зависимости от { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: распределение по прогонам

js-kind-title-mid-pass-update = Обновление в середине пролёта

js-kind-title-modelled = Смоделировано

js-kind-title-monte-carlo = Монте-Карло

js-kind-title-navigation-message-stage = Этап навигационного сообщения

js-kind-title-not-modelled = Не смоделировано

js-kind-title-notes = Примечания

js-kind-title-notes-on-the-spoofing-model = Примечания к модели спуфинга

js-kind-title-observation-windows = Окна наблюдения

js-kind-title-one-pass-alone = Один пролёт

js-kind-title-orbit = Орбита

js-kind-title-over-the-message-sequence = По последовательности сообщений

js-kind-title-pass = Пролёт

js-kind-title-pass-c-n0-of-the = Пролёт: C/N0 всего сигнала и отслеживаемого компонента

js-kind-title-pass-code-tracking-jitter = Пролёт: дрожание слежения за кодом

js-kind-title-pass-doppler = Пролёт: Доплер

js-kind-title-pass-stage = Этап пролёта

js-kind-title-passes = Пролёты

js-kind-title-phases = Фазы

js-kind-title-position-error-gnss-leo-and = Ошибка положения: GNSS, LEO и объединённое решение

js-kind-title-position-uncertainty-relays-alone-and = Неопределённость положения: только ретрансляторы и с линией связи с Землёй

js-kind-title-positioning-by-signal-bandwidth = Позиционирование по полосе сигнала

js-kind-title-positioning-gnss-alone-against-the = Позиционирование: только GNSS в сравнении с объединённым решением

js-kind-title-power-spectral-density = Спектральная плотность мощности

js-kind-title-power-spectral-density-of-each = Спектральная плотность мощности каждого сигнала

js-kind-title-precise-point-positioning = Прецизионное абсолютное позиционирование

js-kind-title-published-comparison = Опубликованное сравнение

js-kind-title-quantisation-budget = Бюджет квантования

js-kind-title-range-residuals = Невязки дальности

js-kind-title-ranging-stations = Станции дальнометрии

js-kind-title-reading-the-trade = Как читать компромисс

js-kind-title-realised-position-error = Реализованная ошибка положения

js-kind-title-receiver = Приёмник

js-kind-title-receiver-power-budget = Энергетический бюджет приёмника

js-kind-title-reflector-information = Сведения об отражателях

js-kind-title-relay-constellation = Группировка ретрансляторов

js-kind-title-relays-in-view = Ретрансляторы в зоне видимости

js-kind-title-reproducibility = Воспроизводимость

js-kind-title-retroreflectors = Ретрорефлекторы

js-kind-title-rinex-style-record = Запись в стиле RINEX

js-kind-title-round-trips = Проверка туда и обратно

js-kind-title-run = Прогон

js-kind-title-satellites-in-view-against-latitude = Спутники в зоне видимости в зависимости от широты

js-kind-title-sensitivity-to-a-line-of = Чувствительность к наклону линии визирования

js-kind-title-shared-conditions = Общие условия

js-kind-title-signal-components = Компоненты сигнала

js-kind-title-signal-stage = Этап сигнала

js-kind-title-signals = Сигналы

js-kind-title-sisre-against-fit-interval = SISRE в зависимости от интервала аппроксимации

js-kind-title-sisre-against-update-period = SISRE в зависимости от периода обновления

js-kind-title-sisre-weights = Веса SISRE

js-kind-title-snapshot = Снимок

js-kind-title-snapshot-against-the-model = Снимок в сравнении с моделью

js-kind-title-snapshot-spectrum-welch-estimate-against = Спектр снимка: оценка Уэлча в сравнении с моделью

js-kind-title-sources = Источники

js-kind-title-spoofer-and-monitor-settings = Параметры спуфера и монитора

js-kind-title-spoofing-monitor-probability-of-detection = Монитор спуфинга: вероятность обнаружения

js-kind-title-statistics-over-the-runs = Статистика по прогонам

js-kind-title-sweep = Серия

js-kind-title-systems = Системы

js-kind-title-systems-in-the-fix = Системы в решении

js-kind-title-the-archived-campaign = Архивная кампания

js-kind-title-time-error = Ошибка времени

js-kind-title-time-error-by-receiver-clock = Ошибка времени по часам приёмника

js-kind-title-time-scale = Шкала времени

js-kind-title-time-to-first-fix-and = Время до первого определения положения и энергия на одно определение

js-kind-title-time-transfer-by-clock-and = Передача времени по часам и уровню сигнала

js-kind-title-trade-conditions = Условия сравнения

js-kind-title-update-period-trade = Компромисс по периоду обновления

js-kind-title-user = Пользователь

js-kind-title-user-range-error-through-the = Ошибка дальности пользователя за пролёт

js-kind-title-validated = Проверено

js-kind-title-what-each-stage-hands-to = Что каждый этап передаёт следующему

js-kind-title-what-this-run-is-and = Что представляет собой этот прогон и чем он не является

js-kind-title-when-each-monitor-detects = Когда каждый монитор обнаруживает

js-kind-title-work-done = Выполненная работа

js-kind-yes = да

js-ledger-rows =
    { $n ->
        [one] { $n } строка реестра
        [few] { $n } строки реестра
        [many] { $n } строк реестра
       *[other] { $n } строки реестра
    }

js-lib-abbr-apv = заход на посадку с вертикальным наведением

js-lib-abbr-araim = усовершенствованный автономный контроль целостности приёмника

js-lib-abbr-auc = площадь под кривой

js-lib-abbr-c-n0 = отношение несущей к шумовой плотности

js-lib-abbr-ccsds = Консультативный комитет по космическим системам передачи данных

js-lib-abbr-cli = интерфейс командной строки

js-lib-abbr-csac = атомные часы микроразмерного исполнения

js-lib-abbr-cw = непрерывная несущая

js-lib-abbr-doi = цифровой идентификатор объекта

js-lib-abbr-dop = геометрический фактор DOP (ухудшение точности)

js-lib-abbr-eo = наблюдение Земли

js-lib-abbr-gnss = глобальная навигационная спутниковая система

js-lib-abbr-gps = Глобальная система позиционирования

js-lib-abbr-hal = горизонтальный предел тревоги

js-lib-abbr-hpl = горизонтальный уровень защиты

js-lib-abbr-imu = инерциальный измерительный блок

js-lib-abbr-ins = инерциальная навигационная система

js-lib-abbr-iot = интернет вещей

js-lib-abbr-itu-t = Международный союз электросвязи, сектор стандартизации электросвязи

js-lib-abbr-j-s = отношение мощности источника подавления к мощности сигнала

js-lib-abbr-leo = низкая околоземная орбита

js-lib-abbr-llr = лазерная локация Луны

js-lib-abbr-meo = средняя околоземная орбита

js-lib-abbr-mtie = максимальная ошибка временного интервала

js-lib-abbr-ntn = нетеррестриальная сеть

js-lib-abbr-ocxo = кварцевый генератор с термостатированием

js-lib-abbr-oem = сообщение об эфемеридах орбиты

js-lib-abbr-omm = сообщение о средних элементах орбиты

js-lib-abbr-pdop = геометрический фактор DOP по положению

js-lib-abbr-pnt = позиционирование, навигация и время

js-lib-abbr-ppp = прецизионное абсолютное позиционирование

js-lib-abbr-raim = автономный контроль целостности приёмника

js-lib-abbr-rf = радиочастота

js-lib-abbr-rinex = Независимый от приёмника формат обмена

js-lib-abbr-roc = рабочая характеристика приёмника

js-lib-abbr-sbas = спутниковая система функционального дополнения

js-lib-abbr-sgp4 = Simplified General Perturbations 4, распространитель орбит

js-lib-abbr-sisre = ошибка дальности в пространстве сигнала

js-lib-abbr-slam = одновременная локализация и построение карты

js-lib-abbr-spp = одноточечное позиционирование

js-lib-abbr-tdev = девиация времени

js-lib-abbr-tle = двухстрочный набор элементов орбиты

js-lib-abbr-toml = формат файла сценария

js-lib-abbr-trn = навигация по рельефу местности

js-lib-abbr-uhf = ультравысокая частота

js-lib-abbr-ukf = ункентированный фильтр Калмана

js-lib-abbr-utc = Всемирное координированное время

js-lib-abbr-val = вертикальный предел тревоги

js-lib-abbr-vlbi = радиоинтерферометрия со сверхдлинной базой

js-lib-abbr-vpl = вертикальный уровень защиты

js-lib-abbr-wg = Рабочая группа

js-lib-areas-ground-track = Подспутниковая трасса

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Доступность

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Время, p95

js-lib-compare-timing-rms = Время, RMS

js-lib-counts-explorer-tally = Проверено по внешнему оракулу возможностей: { $validated } из { $total } · смоделировано: { $modelled } · принадлежит партнёру: { $partner } — показано здесь как карточек возможностей: { $cards } в областях: { $domains }, заявлений о доказательствах: { $evidence }

js-lib-counts-validated-tally = Проверено по внешнему оракулу возможностей: { $validated } из { $total } — показано здесь как карточек возможностей: { $cards } и заявлений о доказательствах: { $evidence }

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = файл движка вернул HTTP { $status }

js-lib-engine-page-not-running = движок здесь не запущен

js-lib-engine-worker-crashed = рабочий процесс движка аварийно завершился

js-lib-evidence-aria = Доказательства: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } строка реестра
        [few] { $n } строки реестра
        [many] { $n } строк реестра
       *[other] { $n } строки реестра
    }

js-lib-evidence-rows-behind = Строки реестра, стоящие за этим результатом

js-lib-geometry-url-bad-mc = Число выборок Монте-Карло не входит в { $choices }; используется { $default }.

js-lib-geometry-url-bad-number = «{ $key }» — не число от { $min } до { $max }; используется значение по умолчанию.

js-lib-geometry-url-bad-site = Пункт задан не в виде «широта,долгота[,высота]» в допустимых пределах; используется пункт по умолчанию.

js-lib-geometry-url-bad-sky = Линия горизонта не является ни предустановкой, ни таблицей из 360 секторов, ни каньоном в допустимых пределах; используется открытый горизонт.

js-lib-geometry-url-bad-sys = Список орбитальных группировок — это не G, E, C и не более одной L:<предустановка LEO>, известной этому представлению; используется набор по умолчанию.

js-lib-geometry-url-own-tle = Отправитель использовал собственные элементы орбиты (TLE), которые ссылка не передаёт; вместо них показаны предустановки.

js-lib-geometry-url-repeated = «{ $key }» встречается более одного раза; используется первое значение.

js-lib-geometry-url-too-long = Адрес длиннее { $max } символов, поэтому ни один из его параметров не был прочитан.

js-lib-geometry-url-unreadable = Не удалось прочитать адрес.

js-lib-guided-duration-s-hint = как долго распространять подспутниковую трассу

js-lib-guided-duration-s-label = Длительность (s)

js-lib-guided-dut1-s-hint = смещение вращения Земли; сдвигает подспутниковую трассу на восток или запад

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = чтобы считаться видимым, спутник должен быть не ниже этой высоты над горизонтом

js-lib-guided-mask-deg-label = Маска угла места (°)

js-lib-guided-seed-hint = другая реализация шума при той же физике

js-lib-guided-seed-label = Начальное значение (seed)

js-lib-guided-sigma-uere-m-hint = эквивалентная ошибка дальности пользователя (1-σ) для сводки по положению

js-lib-guided-sigma-uere-m-label = Ошибка дальности σ (m)

js-lib-guided-station-lat-deg-hint = широта наземной станции — определяет геометрию пролёта

js-lib-guided-station-lat-deg-label = Широта станции (°)

js-lib-guided-station-lon-deg-hint = долгота наземной станции

js-lib-guided-station-lon-deg-label = Долгота станции (°)

js-lib-guided-step-s-hint = частота дискретизации подспутниковой трассы

js-lib-guided-step-s-label = Шаг времени (s)

js-lib-guided-threshold-ns-hint = допустимый по спецификации бюджет; «доступно», пока ошибка остаётся ниже него

js-lib-guided-threshold-ns-label = Порог по спецификации (ns)

js-lib-guided-time-duration-s-hint = общая длительность прогона

js-lib-guided-time-duration-s-label = Длительность (s)

js-lib-guided-time-step-s-hint = частота интегрирования и дискретизации

js-lib-guided-time-step-s-label = Шаг времени (s)

js-lib-guided-user-altitude-km-hint = орбитальная высота пользовательского космического аппарата

js-lib-guided-user-altitude-km-label = Высота пользователя (km)

js-lib-guided-user-inclination-deg-hint = наклонение орбиты пользователя

js-lib-guided-user-inclination-deg-label = Наклонение пользователя (°)

js-lib-imufit-card-accel-slope = Наклон девиации Аллана акселерометра, начальный (около -0,5 для белого шума)

js-lib-imufit-card-bias = Смещение акселерометра, среднее (m/s²)

js-lib-imufit-card-bias-instability = Нестабильность смещения акселерометра (m/s²), 0, если у кривой нет нижней границы

js-lib-imufit-card-gyro-bias = Смещение гироскопа, среднее (rad/s)

js-lib-imufit-card-gyro-slope = Наклон девиации Аллана гироскопа, начальный (около -0,5 для белого шума)

js-lib-imufit-card-note-n = Примечание { $n }

js-lib-imufit-card-q-arw = Случайное блуждание угла гироскопа, q_arw (rad²/s)

js-lib-imufit-card-q-va = Случайное блуждание скорости акселерометра, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Частота дискретизации

js-lib-imufit-card-samples = Отсчёты

js-lib-imufit-card-span = Охват

js-lib-jammertest-card-clean-epochs = Чистые эпохи

js-lib-jammertest-card-clean-hours = Чистые часы

js-lib-jammertest-card-detected = Обнаружено в допуске

js-lib-jammertest-card-detection-rate = Доля обнаружений (любая тревога)

js-lib-jammertest-card-evaluable = Поддаются оценке

js-lib-jammertest-card-fa-epochs = Эпохи ложной тревоги

js-lib-jammertest-card-fa-per-hour = Серий ложных тревог в час

js-lib-jammertest-card-fa-runs = Серии ложных тревог

js-lib-jammertest-card-in-tol-rate = Обнаружено в допуске, доля

js-lib-jammertest-card-late = С опозданием

js-lib-jammertest-card-median-latency = Медианная задержка обнаружения

js-lib-jammertest-card-median-recover = Медианное время восстановления

js-lib-jammertest-card-missed = Пропущено

js-lib-jammertest-card-na = н/д

js-lib-jammertest-card-not-assessable = В этом журнале не нашлось ни одного поддающегося оценке испытания, поэтому доля обнаружений и задержка не могут быть указаны. Это результат, а не сбой страницы: ничего из этого не является успешным прохождением.

js-lib-jammertest-card-not-json = { $name }: это не JSON ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name }: это не карта оценок jammertest (нужны tests[] и summary).

js-lib-jammertest-card-tests = Испытания в срезе плана

js-lib-jammertest-card-too-large = { $name }: больше 8 MiB; эта страница читает карту оценок не больше этого размера.

js-lib-kpi-available-everywhere = доступно везде, в каждую эпоху

js-lib-kpi-available-everywhere-pdop = доступно везде, в каждую эпоху (PDOP, геометрический фактор по положению, ниже { $thr })

js-lib-kpi-drops-under = опускается ниже порога слежения { $thr } dB-Hz: захват потерян

js-lib-kpi-end-of-mission = в конце миссии

js-lib-kpi-figure-tiers = Уровни показателей: { $parts }.

js-lib-kpi-n-modelled = смоделировано: { $n }

js-lib-kpi-n-partner = принадлежит партнёру: { $n }

js-lib-kpi-n-validated = проверено: { $n }

js-lib-kpi-no-change = без изменений

js-lib-kpi-no-fix = { $pct } % времени или мест без определения положения

js-lib-kpi-no-fix-pdop = { $pct } % времени или мест без определения положения при PDOP ниже { $thr }

js-lib-kpi-over-jump = выше порога скачка { $thr } m

js-lib-kpi-over-pdop = выше порога PDOP { $thr }

js-lib-kpi-stays-above = остаётся выше порога слежения { $thr } dB-Hz

js-lib-kpi-under-jump = ниже порога скачка { $thr } m

js-lib-kpi-under-pdop = ниже порога PDOP { $thr }

js-lib-orbit3d-apogee = апогей

js-lib-orbit3d-perigee = перигей

js-lib-orbit3d-prov-scenario = сценарий { $hash }

js-lib-orbit3d-title = Орбита (ECI, ортографическая проекция)

js-lib-orbit3d-view-angles = az { $az }° · el { $el }°

js-lib-overlay-meta-clock-bias-m = Смещение часов

js-lib-overlay-meta-converged-pos-3sigma-m = Положение 3σ

js-lib-overlay-meta-converged-pos-rms-m = Положение RMS

js-lib-overlay-meta-converged-pos-sigma-m = Положение σ

js-lib-overlay-meta-final-clock-freq-sigma = Частота часов σ

js-lib-overlay-meta-mean-relays-in-view = Ретрансляторы в зоне видимости

js-lib-overlay-meta-pos-p95-m = Положение p95

js-lib-overlay-meta-pos-rms-m = Положение RMS

js-lib-overlay-meta-postfit-rms-m = RMS после аппроксимации

js-lib-overlay-prov-scenario = сценарий { $hash }

js-lib-overlay-subtitle = |ошибка| (ns) от времени — прогонов: { $n }

js-lib-overlay-time-s = время (s)

js-lib-overlay-title = Наложение: ошибка времени во время перерыва

js-lib-packs-cannot-unpack = этот браузер не может распаковать записанный файл

js-lib-replay-demos-below-130 = Оставлены только азимуты ниже 130° (указано)

js-lib-replay-demos-coastal-drag-off = Прибрежный увод позиции

js-lib-replay-demos-combined-event = Комбинированное событие

js-lib-replay-demos-drag-off-stated = Увод позиции (указан демонстрацией)

js-lib-replay-demos-ferry-drag-off = Рейс парома, увод позиции

js-lib-replay-demos-ferry-drag-off-description = Вымышленный журнал парома, Таллин — Хельсинки, 1 Hz. С 1500 s увод позиции смещает сообщаемую позицию, пока приёмник продолжает сообщать о действительном определении положения.

js-lib-replay-demos-fjord = Естественная деградация в фьорде

js-lib-replay-demos-masked-sky = Рейс парома, закрыта половина неба

js-lib-replay-demos-masked-sky-description = Тот же журнал парома: западная половина неба заглушена с 600 s, более узкий сектор неба — с 900 s по 1200 s, а увод позиции — с 1500 s: один прогон, в котором по очереди отказывают небо, сигнал и позиция.

js-lib-replay-demos-open-sea-jamming = Подавление в открытом море

js-lib-replay-demos-port-approach = Спуфинг времени при заходе в порт

js-lib-replay-demos-source-training = Синтетический сценарий { $id }: поток nmea_training и журнал инструктора движка, оценённые его receiver-trust.

js-lib-replay-demos-source-trust = Синтетический журнал { $id }: вымышленные данные NMEA, оценённые receiver-trust движка.

js-lib-replay-demos-west-masked = Закрыта западная половина неба (указано)

js-lib-replay-demos-west-masked-again = Западная половина снова закрыта (указано)

js-lib-report-charts = Графики

js-lib-report-eyebrow = точный момент

js-lib-report-figures-of-merit = Показатели качества

js-lib-report-footer = Kshana { $version } · сценарий { $hash } · создано { $iso }. Воспроизводимо по сценарию, начальному значению (seed) и версии движка. Работает локально; ничего не загружается.

js-lib-report-not-applicable = неприменимо (атака не настроена)

js-lib-report-scenario-definition = Определение сценария (TOML)

js-lib-report-th-clock = Часы

js-lib-report-th-metric = Метрика

js-lib-report-th-validation = Проверка

js-lib-report-th-value = Значение

js-lib-report-tier-note = Каждый показатель качества помечен как { $validated } (проверено по внешнему оракулу) или { $modelled } (из первых принципов, проверено внутренними тестами) — на основе матрицы верификации.

js-lib-report-title = Kshana — отчёт по сценарию

js-lib-skydraw-azimuth-range = азимут от { $from } до { $to } градусов

js-lib-skydraw-describe = Перечислено спутников: { $listed }, с сигналом: { $heard }

js-lib-skydraw-describe-mean = Перечислено спутников: { $listed }, с сигналом: { $heard }, среднее { $snr } dB-Hz

js-lib-skydraw-east = В

js-lib-skydraw-no-signal-from = нет сигнала со стороны: { $sectors }

js-lib-skydraw-none-listed = В журнале на это время нет ни одного перечисленного спутника.

js-lib-skydraw-north = С

js-lib-skydraw-sat-heard = { $sys } { $prn }: угол места { $el }, азимут { $az }, сигнал { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }: угол места { $el }, азимут { $az }, перечислен, сигнала нет

js-lib-skydraw-south = Ю

js-lib-skydraw-unheard-sector = Спутники перечислены между азимутами { $from } и { $to } градусов, ни один не с сигналом

js-lib-skydraw-west = З

js-lib-skyline-edit-describe = Линия горизонта закрывает { $blocked } из 360 градусов азимута; наибольший угол { $el }° при азимуте { $az }°.

js-lib-skyline-edit-open = Открытый горизонт: линии горизонта нет.

js-lib-stages-all-planets = Все планеты

js-lib-stages-au-from-sun = { $d } au от Солнца

js-lib-stages-band-carrier = Несущая { $name }, { $mhz } MHz

js-lib-stages-bin-title = от { $from } до { $to }{ $unit }: прогонов: { $count }

js-lib-stages-body-and-moons = { $name } и её спутники

js-lib-stages-cell-title = широта { $lat }°, долгота { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Навигационное сообщение

js-lib-stages-chain-pass = Пролёт и линия связи

js-lib-stages-chain-ppp = Прецизионное абсолютное позиционирование

js-lib-stages-chain-pvt = Объединённое позиционирование

js-lib-stages-chain-signal = Проект сигнала

js-lib-stages-coverage-aria = { $field } над телом { $body }, по широте и долготе

js-lib-stages-feature-n = объект { $n }

js-lib-stages-flag = флаг

js-lib-stages-frequency-mhz = частота (MHz)

js-lib-stages-from-to = от { $from } до { $to }

js-lib-stages-geojson-aria = Экспорт GeoJSON, нарисованный на карте

js-lib-stages-histogram = Гистограмма

js-lib-stages-inner-planets = Внутренние планеты

js-lib-stages-km-from-centre = { $d } km от { $centre }

js-lib-stages-linear-scale = линейный масштаб

js-lib-stages-link-light-time = { $from } — { $to }: время распространения света в одну сторону { $time } s

js-lib-stages-longitude-axis = долгота · широта вдоль стороны

js-lib-stages-mission-time = время миссии (s)

js-lib-stages-noise-floor = уровень шума

js-lib-stages-orrery-note = { $scale } · плоскость x-y системы координат, вид с северного полюса

js-lib-stages-panel-n = Панель { $n }

js-lib-stages-plan-view-aria = Вид сверху на { $centre } и окружающие тела, { $scale }

js-lib-stages-psd-at-t = Спектральная плотность мощности при t = { $t } s

js-lib-stages-psd-axis = спектральная плотность мощности (dBW/Hz)

js-lib-stages-runs = прогоны

js-lib-stages-sat-title = { $constellation } { $id } · широта { $lat }°, долгота { $lon }°

js-lib-stages-satellites = спутники

js-lib-stages-spectrum-at-t = спектр при t = { $t } s

js-lib-stages-sqrt-scale = масштаб расстояний по квадратному корню

js-lib-stages-the-body = тело

js-lib-stages-time-s = время (s)

js-lib-stages-unit-alarm = Тревога

js-lib-stages-unit-cn0 = Отношение несущей к шумовой плотности

js-lib-stages-unit-position = Положение и защита

js-lib-stages-unit-satellites = Спутники

js-lib-stages-unit-time-error = Ошибка времени

js-lib-stages-waterfall-aria = Водопад спектральной плотности мощности: частота по горизонтали, время вниз

js-lib-stages-whole-band = Весь диапазон

js-lib-sweep-clock-availability = { $who }: доступность

js-lib-sweep-clock-holdover = { $who }: holdover (s)

js-lib-sweep-clock-timing-p95 = { $who }: время p95 (ns)

js-lib-sweep-clock-timing-rms = { $who }: время RMS (ns)

js-lib-sweep-max-altitude = макс. высота (km)

js-lib-sweep-max-elevation = макс. угол места (°)

js-lib-sweep-max-speed = макс. скорость (m/s)

js-lib-sweep-min-altitude = мин. высота (km)

js-lib-sweep-peak-doppler = пиковый Доплер (Hz)

js-lib-sweep-prov-scenario = сценарий { $hash }

js-lib-sweep-y-vs-x = { $y } от { $x }

js-lib-tabs-3d-orbit = Орбита 3D

js-lib-tabs-figures-of-merit = Показатели качества

js-lib-tabs-stability = Стабильность

js-lib-tabs-sweep = Серия

js-lib-tabs-time-series = Временной ряд

js-lib-tour-ashforde-body = Спасибо, что изучаете Kshana. Мы создаём открытую, воспроизводимую инженерию с приоритетом доказательств для миссий, которые не могут потерпеть неудачу, — честно говоря о том, что проверено, а что смоделировано. Вопросы, сотрудничество или исследование? Пишите нам: contact@ashforde.org.

js-lib-tour-ashforde-title = От Ashforde® OÜ

js-lib-tour-capabilities-body = Выберите вкладку области — Орбиты, Время, Инерциальная, GNSS, Устойчивость, Луна, ИИ/МО, Совместимость, — чтобы увидеть её возможности, каждая из которых помечена как «Проверено» или «Смоделировано», с кнопкой ▸ запуска для проработанных сценариев. Откройте «Доказательства и происхождение» в любой области, чтобы проследить доказательство, или включите «Только проверенные», чтобы показать лишь то, что сверено с внешним оракулом.

js-lib-tour-capabilities-title = Изучайте движок, область за областью

js-lib-tour-cite-body = Kshana создана для того, чтобы на неё ссылались: выпуск программного обеспечения, пригодный для цитирования, с DOI, а также статьи в духе рецензируемых о разрыве оптимизма RF-помех и условном уровне защиты времени. Скопируйте ссылку на цитирование прямо отсюда.

js-lib-tour-cite-title = Публикации и как цитировать

js-lib-tour-download-report-body = Вкладка «Серия» изменяет один параметр в диапазоне; «Закрепить для сравнения» накладывает два или более прогонов рядом с Δ между ними (работает для разных типов сценариев — часы, Mars-PNT, позиционирование…); а эта кнопка скачивает прогон в виде автономного отчёта HTML, работающего без сети.

js-lib-tour-download-report-title = Серия, сравнение и экспорт

js-lib-tour-guided-body = Управляющие параметры подстраиваются под сценарий — начальное значение (seed), порог по спецификации, длительность, маска угла места, высота орбиты — и каждое изменение мгновенно запускает прогон заново.

js-lib-tour-guided-title = Настройте ползунки

js-lib-tour-mcp-body = Сервер MCP позволяет ИИ-ассистентам запускать проверенный движок, а не гадать; плагин для JetBrains запускает сценарии из контекстного меню.

js-lib-tour-mcp-title = Используйте из ИИ-агента или IDE

js-lib-tour-playground-body = Выберите сценарий в списке — или нажмите ▸ запуск у любой возможности выше — и движок заработает как WebAssembly на вашем компьютере. Ничего не загружается.

js-lib-tour-playground-title = Запустите в браузере

js-lib-tour-run-body = Запустите текущий сценарий. Откройте «Расширенное», чтобы править TOML и менять что угодно; «Скопировать ссылку для общего доступа» воспроизводит именно этот прогон у другого человека.

js-lib-tour-run-title = Запустите

js-lib-tour-tabs-body = Переключайтесь между показателями качества, графиком временного ряда, стабильностью часов (девиация Аллана) и — для прогонов по орбите — интерактивным 3D-видом орбиты.

js-lib-tour-tabs-title = Читайте результаты

js-lib-tour-validation-body = Тот же обозреватель одновременно служит реестром доказательств: у каждой области есть панель «Доказательства и происхождение» — показатель, внешний оракул, по которому он проверен, и честный статус «Проверено» или «Смоделировано» для каждого утверждения. «Только проверенные» оставляет строки, проверенные по набору данных.

js-lib-tour-validation-title = Доказательства, а не эпитеты

js-lib-views-3-sigma-bound = граница 3 сигма

js-lib-views-3d-position-error = ошибка 3-D положения

js-lib-views-a-parameter = параметр

js-lib-views-band-runs = Полоса ошибки времени по { $runs } прогонам Монте-Карло

js-lib-views-band-the-runs = Полоса ошибки времени по прогонам Монте-Карло

js-lib-views-below-tracking = ниже порога слежения

js-lib-views-chart = график

js-lib-views-classical = классический

js-lib-views-epoch = эпоха

js-lib-views-four-needed = для определения положения нужно 4

js-lib-views-free-inertial = свободная инерциальная

js-lib-views-gnss-denied = GNSS недоступен

js-lib-views-ground-track = Подспутниковая трасса

js-lib-views-heatmap-effective = Эффективное отношение несущей к шумовой плотности по спутникам и времени

js-lib-views-heatmap-nominal = Номинальное (без источника подавления) отношение несущей к шумовой плотности по спутникам и времени

js-lib-views-horizontal-alert-limit = горизонтальный предел тревоги

js-lib-views-horizontal-hpl = горизонтальный (HPL)

js-lib-views-id-bound = граница { $id }

js-lib-views-id-median = медиана { $id }

js-lib-views-id-offset = смещение { $id }

js-lib-views-id-p95 = { $id } p95

js-lib-views-map-matched = привязка к карте

js-lib-views-map-matched-title = Привязка к карте в сравнении с ошибкой положения свободной инерциальной системы

js-lib-views-metric = метрика

js-lib-views-oscillator = генератор

js-lib-views-oscillator-source = генератор ({ $source })

js-lib-views-position-error-axis = ошибка положения ({ $unit })

js-lib-views-position-error-m = ошибка положения (m)

js-lib-views-position-error-run = Ошибка положения за прогон

js-lib-views-position-m = положение (m)

js-lib-views-predicted-time-error = Прогнозируемая ошибка времени с момента последнего определения положения

js-lib-views-protection-level-m = уровень защиты (m)

js-lib-views-protection-levels = Уровни защиты в сравнении с пределом тревоги

js-lib-views-quantum = квант

js-lib-views-relay-error-bound = Ошибка положения при навигации по ретрансляторам и её граница 3 сигма

js-lib-views-satellites = спутники

js-lib-views-satellites-tracking = Спутники в зоне видимости и всё ещё отслеживаемые

js-lib-views-shaded-gnss-denied = затенено: GNSS недоступен

js-lib-views-slot-guard = защита слота

js-lib-views-spoofed-offset = Смещение времени при спуфинге в сравнении с границей обнаружения

js-lib-views-sweep-of = Серия по параметру { $parameter }: { $metric }

js-lib-views-sync-error-axis = ошибка синхронизации ({ $unit })

js-lib-views-sync-error-run = Ошибка синхронизации за прогон

js-lib-views-threshold = порог

js-lib-views-time-error-ns = ошибка времени (ns)

js-lib-views-time-ns = время (ns)

js-lib-views-time-s = время (s)

js-lib-views-time-since-fix = время с последнего определения положения (s)

js-lib-views-timing-error-axis = ошибка синхронизации времени ({ $unit })

js-lib-views-timing-error-run = Ошибка синхронизации времени за прогон

js-lib-views-tracking = слежение

js-lib-views-value = значение

js-lib-views-vertical-vpl = вертикальный (VPL)

js-lib-views-visible = виден

js-lib-views-word-enbw = эквивалентная шумовая полоса

js-lib-views-word-nfft = длина FFT

js-lib-views-word-stec = наклонное TEC

js-lib-views-word-toa = время прихода

js-lib-views-word-ttff = время до первого определения положения

js-lib-views-word-tx = передача

js-lib-views-word-zwd = зенитная влажная задержка

js-lunar-address-outside-range = { $label }: «{ $raw }» вне диапазона от { $min } до { $max }; используется значение из файла.

js-lunar-address-too-long = Адрес был слишком длинным; показаны значения по умолчанию.

js-lunar-address-unknown-source = В адресе указан неизвестный источник; показана запись.

js-lunar-alert-limit = предел тревоги { $value } (иллюстративный)

js-lunar-alert-not-stated = предел тревоги не указан

js-lunar-bearing-east = 90° В

js-lunar-bearing-west = 90° З

js-lunar-cell-title = { $lat }°, { $lon }°: скорректированная ошибка { $corrected }, доступность { $availability }, покрытие { $coverage }

js-lunar-copy-address = Скопируйте адрес из адресной строки.

js-lunar-counts = Спутников: { $sats }, точек сетки: { $points }, эпох: { $epochs }, испытаний Монте-Карло на эпоху: { $trials }. Метка: { $label }.

js-lunar-engine-no-start = Движок не удалось запустить в этом браузере ({ $reason }). Откройте вместо этого файл результата.

js-lunar-engine-unknown-kind = Этот движок ({ $version }) не знает вида { $kind }; нужен движок 0.36.

js-lunar-fig-availability-region = Доступность по району

js-lunar-fig-corrected-3d = Скорректированная ошибка, { $n } %, 3‑D

js-lunar-fig-coverage = Покрытие

js-lunar-fig-epochs-within = эпох в пределах { $value }

js-lunar-fig-horizontal-vertical = горизонтальная { $h }, вертикальная { $v }

js-lunar-fig-hpl-below-alert = HPL ниже предела тревоги

js-lunar-fig-hpl-vpl = HPL, VPL не более

js-lunar-fig-improvement = Коэффициент улучшения

js-lunar-fig-lowest-point = Наименьшее в точке

js-lunar-fig-points-always-available = Точки, доступные в каждую эпоху

js-lunar-fig-uncorrected-3d = Нескорректированная ошибка, { $n } %, 3‑D

js-lunar-fig-worst-point = Наихудшая точка

js-lunar-file-not-json = Этот файл не является JSON.

js-lunar-file-not-object = Этот файл не является объектом JSON.

js-lunar-file-too-large = { $name }: больше 32 MiB; эта страница читает файлы результатов не больше этого размера.

js-lunar-file-value = файл: { $value }

js-lunar-full-of-total = { $full } из { $total }

js-lunar-give-value = { $label }: укажите значение от { $min } до { $max }.

js-lunar-give-whole-value = { $label }: укажите значение от { $min } до { $max } (целое число).

js-lunar-honesty-affiliation = Не связано ни с каким ведомством и не одобрено им.

js-lunar-honesty-assumptions = При указанных общедоступных допущениях; это не утверждение о характеристиках какой-либо реальной системы.

js-lunar-in-grid-spacing = Шаг колец сетки, градусы

js-lunar-in-latency = Задержка поправки, секунды

js-lunar-in-seed = Начальное значение (seed)

js-lunar-in-station-lat = Широта станции, градусы

js-lunar-in-station-lon = Долгота станции, градусы

js-lunar-in-survey-error = Ошибка привязки станции (1-sigma), метры

js-lunar-in-threshold = Порог точности, метры

js-lunar-in-time-step = Шаг времени, секунды

js-lunar-in-trials = Испытаний Монте-Карло на эпоху

js-lunar-input-out-of-range = { $label }: значение вне допустимого диапазона.

js-lunar-json-field-not-json = Поле json в файле не является JSON.

js-lunar-key-50-or-more = 50 % и более

js-lunar-key-90-or-more = 90 % и более

js-lunar-key-95-or-more = 95 % и более

js-lunar-key-99-or-more = 99 % и более

js-lunar-key-above = выше { $value }

js-lunar-key-above-threshold = выше { $value } × порог

js-lunar-key-below-50 = ниже 50 %

js-lunar-key-between = от { $from } до { $to }

js-lunar-key-between-threshold = от { $from } до { $to } × порог

js-lunar-key-up-to = до { $value }

js-lunar-key-up-to-threshold = до { $value } × порог

js-lunar-layer-availability = доступность

js-lunar-layer-coverage = покрытие

js-lunar-layer-error = скорректированная ошибка

js-lunar-layer-range = скорректированная ошибка в её собственном диапазоне

js-lunar-legend-no-figure = нет значения (недоступно на всём протяжении)

js-lunar-legend-radius = радиус покрытия

js-lunar-legend-threshold = порог, { $value }

js-lunar-legend-worst = наихудшая точка

js-lunar-link-copied = Ссылка скопирована.

js-lunar-map-desc = Точек сетки от полюса до широты { $rim }°: { $points }. У { $meet } из них скорректированная ошибка на уровне процентиля { $percentile } укладывается в порог { $threshold }. Цвет задан показателем: { $layer }. Станция находится в точке { $lat }°, { $lon }°.

js-lunar-map-note-one-band = { $share } % точек попадают в одну полосу шкалы порога, поэтому карта почти не показывает различий: раскрасьте «по собственному диапазону», чтобы увидеть, как ошибка меняется по району.

js-lunar-needs-newer-engine = Для этого исследования нужен движок { $need } или новее; здесь работает движок v{ $version }. Запись или файл результата по-прежнему можно показать.

js-lunar-no = нет

js-lunar-no-recording = Записи этого исследования пока нет в поставке: она создаётся при выпуске с движком 0.36. Запустите его здесь с движком, у которого есть этот вид, или откройте файл результата.

js-lunar-no-scenario = На этом сайте пока нет { $file }: он появится вместе с движком 0.36. Откройте вместо этого файл результата.

js-lunar-no-scenario-note = На этом сайте пока нет { $file } (он появится вместе с движком 0.36), поэтому запуск здесь невозможен; откройте вместо этого файл результата.

js-lunar-not-report = Это не отчёт вида { $kind }.

js-lunar-not-stated = не указано

js-lunar-note-none = В файле нет примечания.

js-lunar-note-withheld = В собственном заявлении файла названа программа или ведомство, поэтому эта страница его не показывает; действует заявление в верхней части страницы.

js-lunar-point-epochs-reason = эпохи в точке: { $reason }

js-lunar-radius-desc =
    Радиус покрытия по { $count } { $count ->
        [one] азимуту
        [few] азимутам
        [many] азимутам
       *[other] азимутам
    }: наименьший { $lo } km при { $loAz }°, наибольший { $hi } km при { $hiAz }°.

js-lunar-radius-desc-limited = Азимутов, достигающих края сетки: { $count }, поэтому там покрытие простирается как минимум настолько далеко.

js-lunar-radius-hollow = Пустые точки достигают края сетки: покрытие сохраняется как минимум настолько далеко по этому направлению.

js-lunar-radius-none = В отчёте не указан радиус покрытия.

js-lunar-radius-per-azimuth = радиус покрытия по азимутам

js-lunar-radius-point = { $az }°: { $km } km

js-lunar-radius-point-limited = { $az }°: { $km } km (достигает края сетки: не менее этого)

js-lunar-radius-zero = По каждому направлению покрытие уже на станции ниже 95 %, поэтому радиус равен 0 km: скорректированная ошибка там превышает порог { $value }.

js-lunar-reason-station-missing = станция видит не каждый спутник, который использует пользователь

js-lunar-reason-user-lt4 = в зоне видимости пользователя менее четырёх спутников

js-lunar-run-stopped = Прогон остановлен: { $message }

js-lunar-running = Исследование выполняется в этом браузере…

js-lunar-running-elapsed = Исследование выполняется в этом браузере… { $seconds } s

js-lunar-scenario-missing-keys = В файле сценария нет { $keys }; здесь его изменить нельзя.

js-lunar-set-inputs = Задайте входные данные и нажмите «Запустить здесь».

js-lunar-showing = Показано: { $what }.

js-lunar-showing-engine = Показано: { $what } (движок { $version }).

js-lunar-source-error = { $what }: { $error }

js-lunar-station = станция

js-lunar-station-title = станция { $lat }°, { $lon }°

js-lunar-table-count = Точек: { $n }, сначала ближайшие к станции.

js-lunar-th-corrected = Скорректированная ошибка, { $n } %

js-lunar-threshold-title = скорректированная ошибка { $value } (порог)

js-lunar-what-file = файл { $name }

js-lunar-what-recording = запись, входящая в поставку Studio

js-lunar-what-run = прогон в этом браузере (движок { $version })

js-lunar-worst-at = в точке { $lat }°, { $lon }°

js-lunar-worst-title = наихудшая точка { $lat }°, { $lon }°: { $value }

js-lunar-yes-at-least = да: не менее этого расстояния

js-lunarinfra-above-95-point = выше точки 95 %

js-lunarinfra-advisory = Программное обеспечение консультативного характера, не оборудование с утверждённым типом; никакого тракта передачи ни в каком виде.

js-lunarinfra-arc-note = Длина волны несущей { $value } m.

js-lunarinfra-arc-title = Каждая дуга

js-lunarinfra-bars-not-loaded = файл порогов не загрузился

js-lunarinfra-bars-not-shown = Предварительно зарегистрированные пороги не удалось показать ({ $reason }).

js-lunarinfra-bars-note = Зафиксированы до оценки какого-либо исследования, с вердиктами по протоколу (коммит движка { $commit }). Ничто не является VALIDATED; порог с отметкой NOT MET закреплён тестом, который утверждает промах, и ни один порог не ослаблялся.

js-lunarinfra-bars-title = По предварительно зарегистрированным порогам

js-lunarinfra-bars-wrong-file = файл порогов — не тот, который читает эта страница

js-lunarinfra-blurb-carrier-phase = Наземная станция и орбитальный аппарат, использующие фазу несущей сигналов Earth-GNSS с двойными разностями: можно ли зафиксировать целочисленные неоднозначности и как это влияет на границу положения? Быстрый пример прогона.

js-lunarinfra-blurb-frame-coestimation = Семь параметров лунной системы отсчёта по лазерной локации с земных станций, с дальностями от орбитального аппарата до станции на поверхности и без них: насколько улучшается информация?

js-lunarinfra-blurb-geodesy-sensitivity = Насколько чувствительны лазерная локация, слежение за орбитальным аппаратом, гравиметр и часы на поверхности к приливным числам Лява Луны h2, k2 и l2 и её физической либрации?

js-lunarinfra-blurb-od-consistency = Бортовое определение орбиты по Earth-GNSS на околопрямолинейной гало-орбите в сравнении с независимым наземным радиометрическим решением для той же дуги: согласуются ли они в пределах заявленных неопределённостей и замечает ли проверка согласованности ошибку моделирования, когда её вносят? Показано рядом.

js-lunarinfra-blurb-space-tie = GNSS, VLBI и лазерная локация на одном космическом аппарате: насколько точно можно связать смещения между тремя методами при заданной ошибке локальной привязки на космическом аппарате?

js-lunarinfra-bound-label = Неопределённость положения, плавающее и фиксированное решение, логарифмическая шкала

js-lunarinfra-bound-note = Неопределённость положения станции и орбитального аппарата (одна сигма) при неразрешённых (плавающих) неоднозначностях и при зафиксированных (что дала бы фиксация, если бы она достигалась).

js-lunarinfra-bound-title = Граница положения, плавающее и фиксированное решение

js-lunarinfra-chip-na = н/д

js-lunarinfra-comp-normal = нормаль

js-lunarinfra-comp-position = положение (3-D)

js-lunarinfra-comp-radial = радиальная

js-lunarinfra-comp-transverse = трансверсальная

js-lunarinfra-compare-note = Из { $sets } случайных наборов станций наименьшее собственное значение с каналами орбитального аппарата не уменьшилось в { $lambda } наборах, а след не увеличился в { $trace }; медианный рост наименьшего собственного значения: ×{ $median }.

js-lunarinfra-compare-title = Сравнение в числах

js-lunarinfra-crsigma-label = Сигма Крамера — Рао, логарифмическая шкала

js-lunarinfra-crsigma-note = В метрах на поверхности.

js-lunarinfra-crsigma-title = Сигма Крамера — Рао по каждому параметру

js-lunarinfra-days =
    { $n ->
        [one] { $n } день
        [few] { $n } дня
        [many] { $n } дней
       *[other] { $n } дня
    }

js-lunarinfra-direction = направление { $n }

js-lunarinfra-disclosures = Раскрытие сведений

js-lunarinfra-eig-label = Собственные значения информации, логарифмическая шкала

js-lunarinfra-eig-note = Семь собственных значений информационной матрицы, сначала наименьшее, без связей орбитальный аппарат — станция и с ними. Наименьшее растёт (×{ $times }), а след Крамера — Рао падает до { $share } от своего значения. Предполагается, что орбита известна в лунных осях (её ошибка учтена в сигме дальности до орбитального аппарата).

js-lunarinfra-eig-title = Информация по каждому направлению лунной системы отсчёта

js-lunarinfra-fact-arc = Дуга

js-lunarinfra-fact-hash = Хеш сценария

js-lunarinfra-fact-llr-rows = Строки лазерной локации

js-lunarinfra-fact-orbit-family = Семейство орбит

js-lunarinfra-fact-orbiter-arc = Дуга орбитального аппарата

js-lunarinfra-fact-orbiter-rows = Строки орбитального аппарата

js-lunarinfra-fact-study = Исследование

js-lunarinfra-fact-wavelength = Длина волны несущей

js-lunarinfra-families-note = RMS частной производной каждого параметра по строкам семейства и число строк. Ноль означает параметр, к которому это семейство слепо. Чувствительность семейства орбитального аппарата к k2 — оценка верхней границы.

js-lunarinfra-families-title = Что видит каждое семейство

js-lunarinfra-findings = Выводы

js-lunarinfra-fix-note-a = Доля испытаний Монте-Карло, в которых каждая целочисленная неоднозначность зафиксирована верно (со стандартной ошибкой), и доля, которую предсказывает оценка бутстрепом.

js-lunarinfra-fix-note-b = Фиксация целых чисел при этих входных данных НЕ достигается: лучшая дуга фиксирует { $share } испытаний.

js-lunarinfra-fix-note-c = Показывать время до фиксации нечего, потому что фиксация не достигается.

js-lunarinfra-fix-rate-label = Доля фиксаций целых чисел в зависимости от длины дуги

js-lunarinfra-fix-title = Доля фиксаций в зависимости от длины дуги

js-lunarinfra-fixed = фиксированное

js-lunarinfra-float = плавающее

js-lunarinfra-fraction-above-95 = Доля испытаний выше точки 95 %

js-lunarinfra-ground-radiometric = независимое наземное радиометрическое

js-lunarinfra-injected-error = внесённая ошибка { $value } m/s²

js-lunarinfra-mean-consistency = Среднее значение статистики согласованности

js-lunarinfra-mean-q = среднее q

js-lunarinfra-miss-line = { $id } — { $status }: { $value }

js-lunarinfra-miss-no-fix = Фиксация целочисленных неоднозначностей при этих входных данных НЕ достигается: лучшая дуга фиксирует { $share } испытаний Монте-Карло.

js-lunarinfra-na = н/д

js-lunarinfra-nominal = номинал

js-lunarinfra-not-result = это не результат по лунной инфраструктуре

js-lunarinfra-not-verified = Не проверено

js-lunarinfra-offset-precision-label = Точность смещений в зависимости от локальной привязки, двойная логарифмическая шкала

js-lunarinfra-offsets-note = Сигма сдвига по каждой оси, сигма масштаба и поворота на поверхности, в метрах.

js-lunarinfra-offsets-title = Смещения при каждой ошибке привязки (дуга { $days } сут, эпох: { $epochs })

js-lunarinfra-onboard-gnss = бортовое Earth-GNSS

js-lunarinfra-open-failed = { $title }: не удалось открыть ({ $reason }).

js-lunarinfra-opening = Открывается { $title }…

js-lunarinfra-orbit-uncertainty-log = Неопределённость орбиты по составляющим, логарифмическая шкала

js-lunarinfra-orbiter-days = орбитальный аппарат, { $days } сут

js-lunarinfra-q-note = Среднее статистики согласованности q по { $trials } испытаниям; { $expected } — значение, которое даёт согласованная пара решений. Доля испытаний выше точки 95 % — это доля обнаружений проверки.

js-lunarinfra-q-title = Проверка согласованности: номинал в сравнении с внесённой ошибкой

js-lunarinfra-recorded =
    { $n ->
        [one] { $title }: записанный результат движка (версия { $version }).
        [few] { $title }: записанные результаты движка (версия { $version }).
        [many] { $title }: записанные результаты движка (версия { $version }).
       *[other] { $title }: записанные результаты движка (версия { $version }).
    }

js-lunarinfra-rel-label = Сигма относительно номинала, логарифмическая шкала

js-lunarinfra-rel-note = Сигма Крамера — Рао в процентах от номинального значения, при совместном использовании всех четырёх семейств. h2 и l2 — точки линеаризации, а не проверенные значения; k2 взято из опубликованной аппроксимации.

js-lunarinfra-rel-title = Насколько хорошо можно зафиксировать каждый параметр относительно его номинала

js-lunarinfra-result-not-json = результат не является JSON ({ $reason })

js-lunarinfra-result-not-loaded = записанный результат { $file } не загрузился

js-lunarinfra-row-above-95 = Испытания выше точки 95 % (хи-квадрат 95 % = { $chi })

js-lunarinfra-row-crtrace = След Крамера — Рао

js-lunarinfra-row-degeneracy = Показатель вырожденности

js-lunarinfra-row-formal-diff = Формальная сигма этой разности

js-lunarinfra-row-ground-meas = Наземные: измерения, эпохи со станцией

js-lunarinfra-row-mean-diff = Средняя разность двух орбит

js-lunarinfra-row-mean-q = Среднее q (ожидается 6)

js-lunarinfra-row-observations = Наблюдения

js-lunarinfra-row-onboard-epochs = Бортовые: эпохи с одним и более / четырьмя и более спутниками

js-lunarinfra-row-onboard-meas = Бортовые: измерения, среднее число отслеживаемых спутников

js-lunarinfra-row-origin-scale = Корреляция начала координат и масштаба

js-lunarinfra-row-origin-sigma = Сигма начала координат, m

js-lunarinfra-row-rank-defect = Ранг (дефект)

js-lunarinfra-row-smallest-eig = Наименьшее собственное значение

js-lunarinfra-row-trace-ground = Выборочный след к формальному, наземные

js-lunarinfra-row-trace-onboard = Выборочный след к формальному, бортовые

js-lunarinfra-row-within-95 = Испытания в пределах точки 95 %

js-lunarinfra-series-bootstrapped = бутстреп

js-lunarinfra-series-floor = нижний уровень

js-lunarinfra-series-monte-carlo = Монте-Карло

js-lunarinfra-side-note = Орбита: { $family }, дуга { $arc } сут орбиты с периодом { $period } сут, отсчёты каждые { $sample } s.

js-lunarinfra-side-title = Рядом

js-lunarinfra-sigma-note = Неопределённость положения (одна сигма) по составляющим, в метрах, по двум оценкам одной и той же дуги.

js-lunarinfra-sigma-over-nominal = сигма / номинал

js-lunarinfra-sigma-title = Насколько хорошо каждая сторона знает орбиту

js-lunarinfra-station-days = станция, { $days } сут

js-lunarinfra-status-verdict = { $status }: { $verdict }

js-lunarinfra-subsets-note = Добавление семейства ни разу не уменьшило наименьшее собственное значение ({ $lambda } из { $pairs } { $pairs ->
        [one] добавления
        [few] добавлений
        [many] добавлений
       *[other] добавления
    }), но след псевдообратной матрицы оказался не больше лишь в { $trace } из { $pairs }, потому что добавленное семейство может повысить ранг.

js-lunarinfra-subsets-title = Все сочетания семейств

js-lunarinfra-sweep-note = Наихудшая составляющая сдвига каждого смещения, в метрах, при изменении ошибки привязки между тремя методами на космическом аппарате. При зарегистрированных сигмах методов (GNSS { $gnss } m, VLBI { $vlbi } m, лазер { $slr } m) смещения ограничены шумом измерений, а не привязкой; привязка задаёт нижний предел только для почти идеальных методов.

js-lunarinfra-sweep-title = Точность смещений методов в зависимости от локальной привязки (дуга { $days } сут)

js-lunarinfra-th-arc-days = Дуга, сутки

js-lunarinfra-th-bar = Порог

js-lunarinfra-th-bootstrapped = Доля по бутстрепу

js-lunarinfra-th-budget-exhausted = Исчерпан бюджет поиска (испытания)

js-lunarinfra-th-common-sats = Эпохи с 2 и более общими спутниками

js-lunarinfra-th-crtrace = След Крамера — Рао

js-lunarinfra-th-dd-ambiguities = Неоднозначности двойных разностей

js-lunarinfra-th-epochs = Эпохи

js-lunarinfra-th-families = Семейства

js-lunarinfra-th-family = Семейство

js-lunarinfra-th-local-tie = Сигма локальной привязки, m

js-lunarinfra-th-mc-fix-rate = Доля фиксаций по Монте-Карло

js-lunarinfra-th-median-ambiguity = Медианная сигма неоднозначности, циклы

js-lunarinfra-th-offset = Смещение

js-lunarinfra-th-quantity = Величина

js-lunarinfra-th-rank = Ранг

js-lunarinfra-th-rotation = Поворот на поверхности, m

js-lunarinfra-th-rows = Строки

js-lunarinfra-th-scale = Масштаб на поверхности, m

js-lunarinfra-th-smallest-eig = Наименьшее собственное значение

js-lunarinfra-th-translation = Сдвиг x, y, z, m

js-lunarinfra-th-value = Значение

js-lunarinfra-th-verdict = Вердикт

js-lunarinfra-th-with-links = Со связями орбитального аппарата

js-lunarinfra-th-without-links = Без связей орбитального аппарата

js-lunarinfra-title-carrier-phase = Фаза несущей, поверхность и орбитальный аппарат

js-lunarinfra-title-frame-coestimation = Совместная оценка системы отсчёта

js-lunarinfra-title-geodesy-sensitivity = Числа Лява и либрация

js-lunarinfra-title-od-consistency = Согласованность определения орбиты

js-lunarinfra-title-space-tie = Космическая привязка

js-lunarinfra-unknown-study = этот результат по лунной инфраструктуре относится к исследованию «{ $study }», которое эта страница не читает

js-lunarinfra-where-missed = Где это исследование дало промах.

js-lunarinfra-with-links = со связями орбитального аппарата

js-lunarinfra-without-links = без связей орбитального аппарата

js-lunarinfra-x-arc-length = длина дуги, сутки

js-lunarinfra-x-local-tie = сигма локальной привязки, m (лог.)

js-lunarinfra-y-fixed-correctly = зафиксировано верно, %

js-lunarinfra-y-offset-sigma = сигма смещения, m (лог.); пунктирный нижний уровень — одна лишь привязка, sqrt(2) × ошибка привязки

js-meaning-body-generic = тела

js-meaning-body-the = тела { $name }

js-meaning-card-label-sub = { $k }, { $sub }

js-meaning-checks-of = { $av } из { $n } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }

js-meaning-coverage-average-label = В среднем в зоне видимости

js-meaning-coverage-big-min = Не менее { $n } { $n ->
        [one] спутника
        [few] спутников
        [many] спутников
       *[other] спутника
    } в зоне видимости в каждом месте, в среднем { $mean }.

js-meaning-coverage-big-none = В некоторых местах временами не видно ни одного спутника; в среднем в зоне видимости { $mean }.

js-meaning-coverage-fewest-label = Наименьшее в зоне видимости, где угодно

js-meaning-coverage-line-many = При совместном использовании { $names } определение положения возможно в { $share } % мест и моментов времени вокруг { $body }.

js-meaning-coverage-line-many-pdop = При совместном использовании { $names } определение положения возможно в { $share } % мест и моментов времени вокруг { $body } (качество геометрии, PDOP, ниже { $thr }).

js-meaning-coverage-line-none = Определение положения возможно в { $share } % мест и моментов времени вокруг { $body }.

js-meaning-coverage-line-none-pdop = Определение положения возможно в { $share } % мест и моментов времени вокруг { $body } (качество геометрии, PDOP, ниже { $thr }).

js-meaning-coverage-line-one = При использовании { $names } определение положения возможно в { $share } % мест и моментов времени вокруг { $body }.

js-meaning-coverage-line-one-pdop = При использовании { $names } определение положения возможно в { $share } % мест и моментов времени вокруг { $body } (качество геометрии, PDOP, ниже { $thr }).

js-meaning-coverage-places-label = Места, где есть определение положения

js-meaning-duration-days =
    { $n ->
        [one] { $days } день
        [few] { $days } дня
        [many] { $days } дней
       *[other] { $days } дня
    }

js-meaning-ensemble-big-many = По многим реализациям шума { $q } в среднем удерживает { $thr } ns в течение { $qd }; { $c } — в течение { $cd }.

js-meaning-ensemble-big-runs = По { $n } { $n ->
        [one] реализации
        [few] реализациям
        [many] реализациям
       *[other] реализации
    } шума { $q } в среднем удерживает { $thr } ns в течение { $qd }; { $c } — в течение { $cd }.

js-meaning-ensemble-line = В девяти реализациях из десяти { $name } держится { $band }.

js-meaning-ensemble-mean = среднее

js-meaning-ensemble-mean-band = среднее; 90 %-ная полоса { $band }

js-meaning-error-p95-label = Ошибка, 95 % времени, { $name }

js-meaning-generic-big = { $label }: { $value }.

js-meaning-generic-line-one = Также из этого прогона: { $a }.

js-meaning-generic-line-two = Также из этого прогона: { $a } и { $b }.

js-meaning-generic-none = У этого прогона нет единственного главного показателя; результат показан на графике ниже.

js-meaning-holdover-label = Holdover, { $name }

js-meaning-hpl-sub = горизонтальный уровень защиты

js-meaning-inside-budget = в пределах { $budget }

js-meaning-integrity-big-checks-mostly = Да, в основном: в { $share } % проверок.

js-meaning-integrity-big-checks-no = Нет: в { $share } % проверок.

js-meaning-integrity-big-checks-partly = Лишь частично: в { $share } % проверок.

js-meaning-integrity-big-checks-yes = Да: в { $share } % проверок.

js-meaning-integrity-big-span-mostly = Да, в основном: на протяжении { $share } % от { $span }.

js-meaning-integrity-big-span-no = Нет: на протяжении { $share } % от { $span }.

js-meaning-integrity-big-span-partly = Лишь частично: на протяжении { $share } % от { $span }.

js-meaning-integrity-big-span-yes = Да: на протяжении { $share } % от { $span }.

js-meaning-integrity-bound-label = Типичная граница ошибки

js-meaning-integrity-bound-sub = горизонтальная / вертикальная, медиана

js-meaning-integrity-gap-all-passed = все проверки пройдены

js-meaning-integrity-gap-label = Самый длинный разрыв

js-meaning-integrity-gap-none = нет

js-meaning-integrity-gap-sub = { $n } { $n ->
        [one] проверка
        [few] проверки
        [many] проверок
       *[other] проверки
    } подряд, начиная с { $from }

js-meaning-integrity-line-h = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $h } m по горизонтали) при { $av } из { $tot } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }.

js-meaning-integrity-line-h-clean = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $h } m по горизонтали) при { $av } из { $tot } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }, и ни одно определение положения не вводило в заблуждение.

js-meaning-integrity-line-h-some = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $h } m по горизонтали) при { $av } из { $tot } { $tot ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }; { $n } { $n ->
        [one] определение положения вводило в заблуждение
        [few] определения положения вводили в заблуждение
        [many] определений положения вводили в заблуждение
       *[other] определения положения вводили в заблуждение
    }.

js-meaning-integrity-line-hv = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $h } m по горизонтали и { $v } m по вертикали) при { $av } из { $tot } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }.

js-meaning-integrity-line-hv-clean = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $h } m по горизонтали и { $v } m по вертикали) при { $av } из { $tot } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }, и ни одно определение положения не вводило в заблуждение.

js-meaning-integrity-line-hv-some = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $h } m по горизонтали и { $v } m по вертикали) при { $av } из { $tot } { $tot ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }; { $n } { $n ->
        [one] определение положения вводило в заблуждение
        [few] определения положения вводили в заблуждение
        [many] определений положения вводили в заблуждение
       *[other] определения положения вводили в заблуждение
    }.

js-meaning-integrity-line-none = Граница ошибки приёмника (его уровень защиты) оставалась ниже предела тревоги при { $av } из { $tot } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }.

js-meaning-integrity-line-none-clean = Граница ошибки приёмника (его уровень защиты) оставалась ниже предела тревоги при { $av } из { $tot } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }, и ни одно определение положения не вводило в заблуждение.

js-meaning-integrity-line-none-some = Граница ошибки приёмника (его уровень защиты) оставалась ниже предела тревоги при { $av } из { $tot } { $tot ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }; { $n } { $n ->
        [one] определение положения вводило в заблуждение
        [few] определения положения вводили в заблуждение
        [many] определений положения вводили в заблуждение
       *[other] определения положения вводили в заблуждение
    }.

js-meaning-integrity-line-v = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $v } m по вертикали) при { $av } из { $tot } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }.

js-meaning-integrity-line-v-clean = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $v } m по вертикали) при { $av } из { $tot } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }, и ни одно определение положения не вводило в заблуждение.

js-meaning-integrity-line-v-some = Граница ошибки приёмника (его уровень защиты) оставалась ниже пределов тревоги ({ $v } m по вертикали) при { $av } из { $tot } { $tot ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }; { $n } { $n ->
        [one] определение положения вводило в заблуждение
        [few] определения положения вводили в заблуждение
        [many] определений положения вводили в заблуждение
       *[other] определения положения вводили в заблуждение
    }.

js-meaning-integrity-misleading-label = Вводящие в заблуждение определения положения

js-meaning-integrity-misleading-sub = реальная ошибка выше границы

js-meaning-integrity-trusted-label = Время, когда определению положения можно доверять

js-meaning-jamming-above-label = Источник подавления выше сигнала

js-meaning-jamming-above-sub = среднее отношение мощности источника подавления к мощности сигнала

js-meaning-jamming-big-gone = Источник подавления полностью лишает определения положения.

js-meaning-jamming-big-share = При источнике подавления определение положения доступно { $share } % времени.

js-meaning-jamming-clear-label = Определение положения доступно, без источника подавления

js-meaning-jamming-fewest-label = Наименьшее число отслеживаемых спутников

js-meaning-jamming-fewest-sub = в наихудший момент

js-meaning-jamming-jammed-label = Определение положения доступно, при подавлении

js-meaning-jamming-line = Без источника подавления определение положения доступно { $share } % времени.

js-meaning-jamming-line-js = Без источника подавления определение положения доступно { $share } % времени; в среднем источник подавления превышает сигнал на { $db } dB.

js-meaning-kicker = { $domain } · { $title }

js-meaning-lunar-big-all = Да: при каждой из { $n } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }.

js-meaning-lunar-big-none = Нет: ни при одной из { $n } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    }.

js-meaning-lunar-big-some = При { $av } из { $n } { $n ->
        [one] проверки
        [few] проверок
        [many] проверок
       *[other] проверки
    } ({ $share } %).

js-meaning-lunar-largest-label = Наибольшая граница ошибки

js-meaning-lunar-line = Уровень защиты лежал в пределах от { $min } до { $max } m при пределе тревоги { $limit } m.

js-meaning-lunar-meet-label = Проверки, укладывающиеся в предел

js-meaning-lunar-meet-value = { $av } из { $tot }

js-meaning-lunar-smallest-label = Наименьшая граница ошибки

js-meaning-median-lower-better = медиана, чем ниже, тем лучше

js-meaning-of-the-time = времени

js-meaning-orbit-best-label = Наилучшая геометрия (PDOP)

js-meaning-orbit-best-sub = наименьшее за прогон

js-meaning-orbit-big-always = Определение положения возможно всё время.

js-meaning-orbit-big-share = Определение положения возможно { $share } % времени.

js-meaning-orbit-error-label = Типичная ошибка положения

js-meaning-orbit-error-sub = 1-sigma, медиана

js-meaning-orbit-line = Достаточное число спутников было в зоне видимости в { $fix } из { $n } { $n ->
        [one] момента
        [few] моментов
        [many] моментов
       *[other] момента
    }.

js-meaning-orbit-line-pdop = Достаточное число спутников было в зоне видимости в { $fix } из { $n } { $n ->
        [one] момента
        [few] моментов
        [many] моментов
       *[other] момента
    }; типичное качество геометрии (PDOP, геометрический фактор по положению) равно { $pdop }, чем ниже, тем лучше.

js-meaning-orbit-moments = { $fix } из { $n } { $n ->
        [one] момента
        [few] моментов
        [many] моментов
       *[other] момента
    }

js-meaning-orbit-time-label = Время, когда возможно определение положения

js-meaning-pair-big-diff-pos = { $best } остаётся в пределах { $budget } в течение { $bestDur }; { $other } — в течение { $otherDur }.

js-meaning-pair-big-diff-time = { $best } сохраняет время в пределах { $budget } в течение { $bestDur }; { $other } — в течение { $otherDur }.

js-meaning-pair-big-same-pos = И { $q }, и { $c } остаются в пределах { $budget } в течение { $dur }.

js-meaning-pair-big-same-time = И { $q }, и { $c } сохраняют время в пределах { $budget } в течение { $dur }.

js-meaning-pair-line-clock = Holdover — это то, как долго каждые часы остаются в пределах бюджета { $budget } после потери спутниковой навигации.

js-meaning-pair-line-navigator = Holdover — это то, как долго каждый навигатор остаётся в пределах бюджета { $budget } после потери спутниковой навигации.

js-meaning-pdop-label = Качество геометрии (PDOP)

js-meaning-places-times = мест и моментов времени

js-meaning-range-to = от { $from } до { $to }

js-meaning-satellites =
    { $n ->
        [one] спутник
        [few] спутника
        [many] спутников
       *[other] спутника
    }

js-meaning-spectrum-above = выше порога

js-meaning-spectrum-below = ниже порога: потерян

js-meaning-spectrum-big-kept =
    { $n ->
        [one] Единственный сигнал ({ $n }) продолжает отслеживаться.
        [few] Каждый из { $n } сигналов продолжает отслеживаться.
        [many] Каждый из { $n } сигналов продолжает отслеживаться.
       *[other] Каждый из { $n } сигнала продолжает отслеживаться.
    }

js-meaning-spectrum-big-lost = Источники подавления отнимают { $lost } из { $n } { $n ->
        [one] сигнала
        [few] сигналов
        [many] сигналов
       *[other] сигнала
    }: { $names }.

js-meaning-spectrum-line-kept =
    { $n ->
        [one] { $names } остаётся выше порога слежения приёмника на протяжении всего прогона.
        [few] { $names } остаются выше порога слежения приёмника на протяжении всего прогона.
        [many] { $names } остаются выше порога слежения приёмника на протяжении всего прогона.
       *[other] { $names } остаются выше порога слежения приёмника на протяжении всего прогона.
    }

js-meaning-spectrum-line-kept-thr =
    { $n ->
        [one] { $names } остаётся выше порога слежения приёмника { $thr } dB-Hz на протяжении всего прогона.
        [few] { $names } остаются выше порога слежения приёмника { $thr } dB-Hz на протяжении всего прогона.
        [many] { $names } остаются выше порога слежения приёмника { $thr } dB-Hz на протяжении всего прогона.
       *[other] { $names } остаются выше порога слежения приёмника { $thr } dB-Hz на протяжении всего прогона.
    }

js-meaning-spectrum-line-none = Ни один сигнал не остаётся выше порога слежения приёмника на протяжении всего прогона.

js-meaning-spectrum-line-none-thr = Ни один сигнал не остаётся выше порога слежения приёмника { $thr } dB-Hz на протяжении всего прогона.

js-meaning-spectrum-weakest-label = Самый слабый сигнал, { $name }

js-meaning-whole-run = за весь прогон

js-meaning-your-setting = ваша настройка

js-meankind-acm-big = Адаптивное кодирование передаёт больше данных, чем лучший фиксированный режим, — ×{ $gain }: { $acm } Gbit против { $ccm } Gbit за { $n } { $n ->
        [one] пролёт
        [few] пролёта
        [many] пролётов
       *[other] пролёта
    }.

js-meankind-acm-line = Фиксированный режим { $mode }; перерыв { $dur }.

js-meankind-anomaly-big = Квантовый монитор неисправностей получает { $q } против { $c } у классического (площадь под кривой, 1 — идеально).

js-meankind-anomaly-line = Наименьшая обнаруживаемая неисправность — { $q } против { $c }.

js-meankind-aocs-big-open = Разворот на { $slew }° не устанавливается ниже { $threshold }°.

js-meankind-aocs-big-settles = Разворот на { $slew }° устанавливается ниже { $threshold }° через { $dur }.

js-meankind-aocs-line = Итоговая ошибка наведения { $final }°.

js-meankind-aocs-line-filter = Итоговая ошибка наведения { $final }°. Фильтр ориентации в контуре ошибается на { $arcsec } arcsec (RMS).

js-meankind-aocs-line-wheel = Итоговая ошибка наведения { $final }°. Пиковый момент маховика { $torque } N m.

js-meankind-aocs-line-wheel-filter = Итоговая ошибка наведения { $final }°. Пиковый момент маховика { $torque } N m. Фильтр ориентации в контуре ошибается на { $arcsec } arcsec (RMS).

js-meankind-aperture-big = Навигация использует { $nav } % времени антенны, связь — { $comms } %.

js-meankind-aperture-big-idle = Навигация использует { $nav } % времени антенны, связь — { $comms } %; { $idle } % простаивает.

js-meankind-aperture-line-all = { $n } { $n ->
        [one] апертура
        [few] апертуры
        [many] апертур
       *[other] апертуры
    } по правилу { $policy }, при { $dur } конкуренции за ресурс.

js-meankind-aperture-line-contention = { $n } { $n ->
        [one] апертура
        [few] апертуры
        [many] апертур
       *[other] апертуры
    }, при { $dur } конкуренции за ресурс.

js-meankind-aperture-line-count = { $n } { $n ->
        [one] апертура
        [few] апертуры
        [many] апертур
       *[other] апертуры
    }.

js-meankind-aperture-line-nocount = Апертуры.

js-meankind-aperture-line-nocount-all = Апертуры по правилу { $policy }, при { $dur } конкуренции за ресурс.

js-meankind-aperture-line-nocount-contention = Апертуры, при { $dur } конкуренции за ресурс.

js-meankind-aperture-line-nocount-policy = Апертуры по правилу { $policy }.

js-meankind-aperture-line-policy = { $n } { $n ->
        [one] апертура
        [few] апертуры
        [many] апертур
       *[other] апертуры
    } по правилу { $policy }.

js-meankind-araim-big-no = Нет: уровни защиты движка не совпадают с опубликованным эталоном.

js-meankind-araim-big-yes = Да: уровни защиты движка совпадают с опубликованным эталоном.

js-meankind-araim-line = Наибольшая разность { $worst } m при собственном допуске эталона { $tol } m.

js-meankind-araim-line-vectors = Наибольшая разность { $worst } m при собственном допуске эталона { $tol } m, по { $n } { $n ->
        [one] опорному вектору
        [few] опорным векторам
        [many] опорным векторам
       *[other] опорного вектора
    }.

js-meankind-arc-big = Оценщик восстанавливает орбиту, как только у него есть { $dur } из дуги { $h } h.

js-meankind-arc-line = Космических аппаратов: { $n }, измерения: { $observable }.

js-meankind-ascent-big = Гравитация, сопротивление, управление и противодавление отнимают { $loss } m/s от идеального прироста скорости { $ideal } m/s.

js-meankind-ascent-line = Конец работы двигателя на { $km } km и { $speed } m/s; пиковый скоростной напор { $kpa } kPa.

js-meankind-attack-big-no = Спуфер на поверхности не может захватить лунный приёмник.

js-meankind-attack-big-yes = Спуфер на поверхности может захватить лунный приёмник.

js-meankind-attack-line = Передатчик на поверхности достигает { $km } km до того, как горизонт его перекроет.

js-meankind-attitude-big = Суммарная ошибка наведения { $total } угл. с.

js-meankind-attitude-big-from = Суммарная ошибка наведения { $total } угл. с; основной вклад: { $from }.

js-meankind-attitude-line = Наибольший гравитационно-градиентный момент { $torque } N·m.

js-meankind-beacon-big = Маяки на поверхности улучшают качество геометрии (PDOP): коэффициент ×{ $x }.

js-meankind-beacon-line = Добавление вместо этого спутников улучшает его: коэффициент ×{ $x }.

js-meankind-bodypnt-big = Одни ретрансляторы дают определение положения { $share } % времени вокруг { $body }.

js-meankind-bodypnt-big-earth = Одни ретрансляторы дают определение положения { $share } % времени вокруг { $body }; { $earth } % — со связью с Землёй.

js-meankind-bodypnt-line = В среднем в зоне видимости ретрансляторов: { $mean }.

js-meankind-by = { $a } на { $b }

js-meankind-campaign-compose-line = Каждый член — обычный прогон движка; кампания сопоставляет их результаты рядом.

js-meankind-campaign-compose-range = По { $n } { $n ->
        [one] сценарию
        [few] сценариям
        [many] сценариям
       *[other] сценария
    } при одинаковых условиях { $what } лежит в пределах от { $low } до { $high }.

js-meankind-campaign-compose-same = По { $n } { $n ->
        [one] сценарию
        [few] сценариям
        [many] сценариям
       *[other] сценария
    } при одинаковых условиях { $what } — { $value } в каждом.

js-meankind-campaign-line = { $n } { $n ->
        [one] фаза
        [few] фазы
        [many] фаз
       *[other] фазы
    }.

js-meankind-campaign-line-all = { $n } { $n ->
        [one] фаза
        [few] фазы
        [many] фаз
       *[other] фазы
    } и { $events }, по результатам { $runs }; в конце: { $label } — { $value }.

js-meankind-campaign-line-end = { $n } { $n ->
        [one] фаза
        [few] фазы
        [many] фаз
       *[other] фазы
    }; в конце: { $label } — { $value }.

js-meankind-campaign-line-events = { $n } { $n ->
        [one] фаза
        [few] фазы
        [many] фаз
       *[other] фазы
    } и { $events }.

js-meankind-campaign-line-events-end = { $n } { $n ->
        [one] фаза
        [few] фазы
        [many] фаз
       *[other] фазы
    } и { $events }; в конце: { $label } — { $value }.

js-meankind-campaign-line-events-runs = { $n } { $n ->
        [one] фаза
        [few] фазы
        [many] фаз
       *[other] фазы
    } и { $events }, по результатам { $runs }.

js-meankind-campaign-line-runs = { $n } { $n ->
        [one] фаза
        [few] фазы
        [many] фаз
       *[other] фазы
    }, по результатам { $runs }.

js-meankind-campaign-line-runs-end = { $n } { $n ->
        [one] фаза
        [few] фазы
        [many] фаз
       *[other] фазы
    }, по результатам { $runs }; в конце: { $label } — { $value }.

js-meankind-campaign-mission-alarm = Тревога подаётся в течение { $alarm } миссии длительностью { $dur }.

js-meankind-campaign-mission-phases = Миссия из { $phases } { $phases ->
        [one] фазы
        [few] фаз
        [many] фаз
       *[other] фазы
    } длительностью { $dur }, объединённых общими часами.

js-meankind-campaign-mission-quiet = Ни одной тревоги за всю миссию длительностью { $dur }.

js-meankind-campaign-montecarlo = По { $n } { $n ->
        [one] прогону
        [few] прогонам
        [many] прогонам
       *[other] прогона
    } с начальным значением (seed) { $name }: в среднем { $mean }, разброс { $std }.

js-meankind-campaign-montecarlo-line = Разброс — это одно стандартное отклонение по прогонам.

js-meankind-campaign-optimize = Поиск останавливается на значении { $value } ({ $name }) после { $n } { $n ->
        [one] прогона
        [few] прогонов
        [many] прогонов
       *[other] прогона
    }.

js-meankind-campaign-optimize-at = При { $at }.

js-meankind-campaign-optimize-kind = Поиск останавливается на значении { $value } ({ $name }) после { $n } { $n ->
        [one] прогона
        [few] прогонов
        [many] прогонов
       *[other] прогона
    } вида { $kind }.

js-meankind-campaign-sweep-flat = За { $n } { $n ->
        [one] прогон
        [few] прогона
        [many] прогонов
       *[other] прогона
    } по { $axis } от { $from } до { $to } { $metric } остаётся на уровне { $value }.

js-meankind-campaign-sweep-flat-line = График показывает каждый прогон.

js-meankind-campaign-sweep-goes = За { $n } { $n ->
        [one] прогон
        [few] прогона
        [many] прогонов
       *[other] прогона
    } по { $axis } от { $from } до { $to } { $metric } меняется от { $first } до { $last }.

js-meankind-campaign-sweep-goes-line = График показывает каждый прогон; значения лежат в пределах от { $min } до { $max }.

js-meankind-classical-link = классическая линия связи

js-meankind-clock-word = часы

js-meankind-conflict-big = Многослойная архитектура выдерживает лучше, чем один слой: коэффициент ×{ $ratio }.

js-meankind-conflict-line-threats = Монте-Карло по угрозам даёт ×{ $ratio }.

js-meankind-conflict-line-threats-corr = Монте-Карло по угрозам даёт ×{ $ratio }; при коррелированных угрозах значение может упасть до ×{ $low }.

js-meankind-conflict-line-trials = Монте-Карло из { $n } { $n ->
        [one] испытания
        [few] испытаний
        [many] испытаний
       *[other] испытания
    } даёт ×{ $ratio }.

js-meankind-conflict-line-trials-corr = Монте-Карло из { $n } { $n ->
        [one] испытания
        [few] испытаний
        [many] испытаний
       *[other] испытания
    } даёт ×{ $ratio }; при коррелированных угрозах значение может упасть до ×{ $low }.

js-meankind-contacts-big = План сохраняет { $kept } из { $n } { $n ->
        [one] возможного контакта
        [few] возможных контактов
        [many] возможных контактов
       *[other] возможного контакта
    } и доставляет { $gbit } Gbit.

js-meankind-contacts-big-waiting = План сохраняет { $kept } из { $n } { $n ->
        [one] возможного контакта
        [few] возможных контактов
        [many] возможных контактов
       *[other] возможного контакта
    } и доставляет { $gbit } Gbit из ожидающих { $waiting } Gbit.

js-meankind-contacts-line = Спутников: { $sats }, станций: { $stations } за { $hours } h.

js-meankind-dpnt-big = Дифференциальные поправки снижают ошибку с { $from } m до { $to } m.

js-meankind-dpnt-line = При опорной станции на расстоянии { $km } km.

js-meankind-duration-days =
    { $n ->
        [one] { $days } день
        [few] { $days } дня
        [many] { $days } дней
       *[other] { $days } дня
    }

js-meankind-earthgnss-big = На расстоянии Луны в зоне видимости { $visible } из { $n } { $n ->
        [one] спутника
        [few] спутников
        [many] спутников
       *[other] спутника
    }, но отслеживать можно { $trackable }.

js-meankind-earthgnss-line = Лучший сигнал { $best } dB-Hz при пороге слежения { $threshold } dB-Hz.

js-meankind-engine-run-count =
    { $n ->
        [one] { $n } прогон движка
        [few] { $n } прогона движка
        [many] { $n } прогонов движка
       *[other] { $n } прогона движка
    }

js-meankind-entry-big = Пиковое торможение { $g } g на высоте { $km } km, пиковый тепловой поток { $flux } W/cm².

js-meankind-entry-line = Вход на скорости { $speed } m/s под углом { $angle }° ниже горизонта.

js-meankind-eo-big = Камера охватывает полосу обзора { $swath } km с разрешением { $gsd } m.

js-meankind-eo-line-contiguous = Трассы на поверхности разнесены на { $km } km на экваторе, поэтому покрытие сплошное.

js-meankind-eo-line-gapped = Трассы на поверхности разнесены на { $km } km на экваторе, поэтому в покрытии есть разрывы.

js-meankind-eop-big = На расстоянии Луны вращение Земли проносится на { $m } m каждую секунду, поэтому важен возраст данных об ориентации Земли (здесь { $dur }).

js-meankind-eop-line = Входные данные: { $source }.

js-meankind-ephemeris-big = Спутник летит на высотах от { $min } до { $max } km, до широты { $lat }°.

js-meankind-ephemeris-line = Со станции он поднимается до { $deg }°.

js-meankind-ephemeris-line-doppler = Со станции он поднимается до { $deg }°, с доплеровским сдвигом до { $khz } kHz.

js-meankind-event-count =
    { $n ->
        [one] { $n } событие
        [few] { $n } события
        [many] { $n } событий
       *[other] { $n } события
    }

js-meankind-framecampaign-big-open = Кампания оставляет неопределёнными { $n } { $n ->
        [one] направление
        [few] направления
        [many] направлений
       *[other] направления
    } лунной системы отсчёта.

js-meankind-framecampaign-big-yes = Да: кампания полностью определяет лунную систему отсчёта.

js-meankind-framecampaign-line = Число обусловленности { $n }.

js-meankind-framereal-big = Лунная система отсчёта реализована с остаточной ошибкой { $m } m.

js-meankind-framereal-big-open = Лунная система отсчёта реализована с остаточной ошибкой { $m } m, хотя аппроксимация не сошлась.

js-meankind-framereal-line = Ошибка сдвига { $trans } m, ошибка масштаба { $scale } частей на миллиард.

js-meankind-gnsssim-big = Контроль целостности защищает определение положения { $share } % времени.

js-meankind-gnsssim-line = Ионосфера в среднем добавляет к каждой дальности { $iono } m, а тропосфера — { $tropo } m.

js-meankind-headline-figure = главный показатель

js-meankind-holdovertest-big = Относительно масок holdover записи длительностью { $dur } s достигает ошибки времени { $te } ns.

js-meankind-holdovertest-big-open = Относительно масок holdover записи длительностью { $dur } s достигает ошибки времени { $te } ns и не вернулся в полосу.

js-meankind-holdovertest-big-recovered = Относительно масок holdover записи длительностью { $dur } s достигает ошибки времени { $te } ns и восстановился через { $recover } s после возвращения GNSS.

js-meankind-holdovertest-line = Измерено относительно маски; это никогда не утверждение о том, что система соответствует требованиям; оба времени — заявление оператора.

js-meankind-holdovertest-line-masks = { $masks }. Измерено относительно маски; это никогда не утверждение о том, что система соответствует требованиям; оба времени — заявление оператора.

js-meankind-impairment-big = Детектор отделяет искажённые сигналы от чистых с площадью под кривой { $auc } (1 — идеально).

js-meankind-impairment-line = На случаях, не похожих на обучающий набор, он даёт { $auc }.

js-meankind-infra-carrier = Фиксация целочисленных неоднозначностей фазы несущей между станцией на поверхности и орбитальным аппаратом дала фиксацию в { $share } % испытаний на самой длинной дуге ({ $days } сут).

js-meankind-infra-frame = Связи орбитальный аппарат — станция повышают наименьшее собственное значение информации лунной системы отсчёта (×{ $x }) и снижают след Крамера — Рао до { $share } %, если орбита известна в лунных осях.

js-meankind-infra-geodesy = При совместном использовании всех четырёх семейств h2, k2 и l2 определяются с точностью { $h2 } %, { $k2 } % и { $l2 } % от номинальных значений.

js-meankind-infra-od = Бортовое определение орбиты по Earth-GNSS на окололунной орбите точно до { $gnss } m, независимое наземное слежение — до { $ground } m; статистика согласованности в среднем { $mean } (ожидается { $expected }).

js-meankind-infra-tail = MODELLED: ограниченная модель с иллюстративными входными данными, а не утверждение о какой-либо миссии.

js-meankind-infra-tie = Локальная привязка { $mm } mm на одном космическом аппарате связывает системы отсчёта GNSS, VLBI и лазерной локации при { $n } { $n ->
        [one] ошибке
        [few] ошибках
        [many] ошибках
       *[other] ошибки
    } привязки в серии.

js-meankind-inside-spec = в пределах { $spec }

js-meankind-instrn-big = При движении только по инерциальным данным ошибка положения превышает { $threshold } m через { $dur }.

js-meankind-instrn-dom = Преобладает { $dominant }.

js-meankind-instrn-line = Превышает { $passes }.

js-meankind-instrn-line-dom = Превышает { $passes }; преобладает { $dominant }.

js-meankind-instrn-pass = { $threshold } m через { $dur }

js-meankind-interop-big-no = Нет: файл лунных эфемерид не проходит проверку туда и обратно.

js-meankind-interop-big-yes = Да: файл лунных эфемерид проходит проверку туда и обратно без изменений.

js-meankind-interop-line = Состояний: { $n } в системе { $frame }, время { $time }.

js-meankind-its-spec = заданной спецификации

js-meankind-jointod-big = Добавление земной задержки интерферометрии уточняет положение станции: ×{ $x }.

js-meankind-jointod-line = Тогда положение станции известно с точностью { $m } m.

js-meankind-launch-big = Для выхода на орбиту { $incl }° с широты { $lat }° в сутки доступно { $n } { $n ->
        [one] окно запуска
        [few] окна запуска
        [many] окон запуска
       *[other] окна запуска
    }.

js-meankind-launch-line = Вращение Земли даёт { $speed } m/s бесплатно.

js-meankind-layer-agc = AGC (автоматическая регулировка усиления)

js-meankind-layer-raim = RAIM (автономный контроль целостности приёмника)

js-meankind-layer-sqm = SQM (контроль качества сигнала)

js-meankind-leochain-big = Сквозная цепочка низкоорбитальной системы снижает ошибку положения с { $from } m до { $to } m.

js-meankind-leochain-line = Её сигнал отслеживается при уровне до { $cn0 } dB-Hz.

js-meankind-leopass-big-many = Спутники проходят на высоте { $elev }° и остаются над маской { $dur } (первый из { $n }).

js-meankind-leopass-big-one = Спутник проходит на высоте { $elev }° и остаётся над маской { $dur }.

js-meankind-leopass-line = В пике сигнал низкой орбиты приходит на { $db } dB сильнее типичного сигнала спутниковой навигации.

js-meankind-leoppp-big = Прецизионное позиционирование сходится за { $best } min с наибольшим низкоорбитальным слоем против { $base } min только со спутниковой навигацией.

js-meankind-leoppp-line = Медиана прогонов по каждому случаю, до { $m } m.

js-meankind-leoppp-line-runs = Медиана по { $n } { $n ->
        [one] прогону
        [few] прогонам
        [many] прогонам
       *[other] прогона
    } на случай, до { $m } m.

js-meankind-leopvt-doppler-big = Доплеровское позиционирование по низкоорбитальным спутникам оказывается в { $m } m от истинного положения (по горизонтали).

js-meankind-leopvt-doppler-line = Использовано { $n } { $n ->
        [one] спутник
        [few] спутника
        [many] спутников
       *[other] спутника
    }.

js-meankind-leopvt-joint-big = Добавление низкоорбитального слоя снижает ошибку с { $from } m до { $to } m (3-D, среднеквадратичное значение).

js-meankind-leopvt-joint-line = Качество геометрии (PDOP) меняется с { $from } до { $to }.

js-meankind-leopvt-polar-big = Вблизи полюса низкоорбитальный слой улучшает качество геометрии (PDOP) с { $from } до { $to }.

js-meankind-leopvt-polar-line = По { $n } { $n ->
        [one] широте
        [few] широтам
        [many] широтам
       *[other] широты
    }.

js-meankind-leopvt-timing-big = Передача времени по низкой орбите удерживает лучшие часы в пределах { $ns } ns от UTC (среднеквадратичное значение).

js-meankind-leopvt-timing-line = Сравнено вариантов часов и сигнала: { $n }.

js-meankind-leosignal-big =
    { $n ->
        [one] Из { $n } варианта сигнала { $best } выдерживает наибольшее подавление: { $db } dB выше сигнала.
        [few] Из { $n } вариантов сигнала { $best } выдерживает наибольшее подавление: { $db } dB выше сигнала.
        [many] Из { $n } вариантов сигнала { $best } выдерживает наибольшее подавление: { $db } dB выше сигнала.
       *[other] Из { $n } вариантов сигнала { $best } выдерживает наибольшее подавление: { $db } dB выше сигнала.
    }

js-meankind-leosignal-line-fail = Проверки формы спектра не пройдены.

js-meankind-leosignal-line-pass = Проверки формы спектра пройдены.

js-meankind-link-big-closes = Линия связи замыкается с запасом { $margin } dB.

js-meankind-link-big-open = Линия связи не замыкается: запас { $margin } dB.

js-meankind-link-line = На дальности { $km } km.

js-meankind-link-line-band = Диапазон { $band } на дальности { $km } km.

js-meankind-link-line-band-rate = Диапазон { $band } на дальности { $km } km при { $rate } bit/s.

js-meankind-link-line-rate = На дальности { $km } km при { $rate } bit/s.

js-meankind-list-and = { $head } и { $last }

js-meankind-llr-big = Реальная лазерная локация привязывает лунную систему отсчёта с точностью { $mm } mm.

js-meankind-llr-line = Масштаб с точностью { $ppb } частей на миллиард.

js-meankind-mapmatch-altimeter = Высотомер измеряет с точностью { $sigma } m.

js-meankind-mapmatch-big = Сопоставление с картой удерживает положение с точностью { $matched } m, тогда как на одной инерциальной системе дрейф составляет { $free } m.

js-meankind-mapmatch-gravimeter = Гравиметр измеряет с точностью { $sigma } mGal.

js-meankind-mapmatch-sources = Только по гравитации: { $gravity } m, по магнитному полю: { $magnetic } m, по рельефу: { $terrain } m.

js-meankind-marspnt-big = Навигатор ({ $user }) сходится к { $m } m (среднеквадратичное значение).

js-meankind-marspnt-line =
    { $n ->
        [one] В зоне видимости в среднем ретрансляторов: { $mean }, за { $n } эпоху.
        [few] В зоне видимости в среднем ретрансляторов: { $mean }, за { $n } эпохи.
        [many] В зоне видимости в среднем ретрансляторов: { $mean }, за { $n } эпох.
       *[other] В зоне видимости в среднем ретрансляторов: { $mean }, за { $n } эпохи.
    }

js-meankind-moonlight-big = Сервис охватывает { $share } % проверенных мест и моментов времени.

js-meankind-moonlight-line =
    { $n ->
        [one] В зоне видимости от { $min } до { $n } спутника; качество геометрии (PDOP) лежит в пределах от { $pmin } до { $pmax }.
        [few] В зоне видимости от { $min } до { $n } спутников; качество геометрии (PDOP) лежит в пределах от { $pmin } до { $pmax }.
        [many] В зоне видимости от { $min } до { $n } спутников; качество геометрии (PDOP) лежит в пределах от { $pmin } до { $pmax }.
       *[other] В зоне видимости от { $min } до { $n } спутников; качество геометрии (PDOP) лежит в пределах от { $pmin } до { $pmax }.
    }

js-meankind-navmsg-big =
    { $n ->
        [one] Одно навигационное сообщение укладывается в { $n } байт.
        [few] Одно навигационное сообщение укладывается в { $n } байта.
        [many] Одно навигационное сообщение укладывается в { $n } байт.
       *[other] Одно навигационное сообщение укладывается в { $n } байта.
    }

js-meankind-navmsg-cases-big =
    { $n ->
        [one] По { $n } варианту ошибка дальности по орбите вещания составляет от { $min } до { $max } mm.
        [few] По { $n } вариантам ошибка дальности по орбите вещания составляет от { $min } до { $max } mm.
        [many] По { $n } вариантам ошибка дальности по орбите вещания составляет от { $min } до { $max } mm.
       *[other] По { $n } вариантам ошибка дальности по орбите вещания составляет от { $min } до { $max } mm.
    }

js-meankind-navmsg-cases-line = Ошибка дальности для сигнала в пространстве, среднеквадратичное значение.

js-meankind-navmsg-line = Округление до формата сообщения даёт ошибку дальности { $mm } mm.

js-meankind-navmsg-midpass-big = Обновление сообщения в середине пролёта вызывает скачок дальности не более чем на { $mm } mm.

js-meankind-navmsg-midpass-line = Предел составляет { $mm } mm.

js-meankind-ntn-big = Позиционирование 5G с орбиты достигает { $m } m (сигнал: { $signal }).

js-meankind-ntn-line = Доплер за один пролёт даёт { $m } m.

js-meankind-obs-big-full = Орбита становится полностью наблюдаемой после { $dur } слежения.

js-meankind-obs-big-partly = Орбита остаётся наблюдаемой частично на дуге в { $h } h.

js-meankind-obs-line = Ранг { $rank } из { $dim } в конце дуги.

js-meankind-oem-big = Файл эфемерид при записи и обратном чтении даёт ошибку положения не более { $mm } mm.

js-meankind-oem-line = Состояний: { $states }, сегментов: { $n }.

js-meankind-optical-big-alone = Лучший одиночный пункт удерживает оптическую линию { $best } % времени (потолок при безоблачном небе { $ceiling } %); никакой запас по безоблачности не поднимает её выше { $ceiling } %.

js-meankind-optical-big-team = Лучший одиночный пункт удерживает оптическую линию { $best } % времени (потолок при безоблачном небе { $ceiling } %); вместе пункты ({ $n }) достигают { $independent } %, если их погода независима, и { $correlated } % при заявленной корреляции.

js-meankind-optical-line-sites = Смоделировано пунктов: { $n }; климаты облачности иллюстративные.

js-meankind-optical-line-tech = { $name }: { $base } % становится { $with } %.

js-meankind-opticalrf-big = Совместная оптическая и радиодальнометрия даёт уровни защиты { $h } m по горизонтали и { $v } m по вертикали.

js-meankind-opticalrf-line-fault = Проверка согласованности показывает { $stat } при пороге { $threshold }: неисправность отмечена.

js-meankind-opticalrf-line-ok = Проверка согласованности показывает { $stat } при пороге { $threshold }: неисправность не отмечена.

js-meankind-packet-big-no = Нет: декодированный поток отличается от отправленного.

js-meankind-packet-big-yes = Да: поток пакетов декодируется обратно бит в бит.

js-meankind-packet-line = Пакетов: { $n }, всего октетов: { $octets }.

js-meankind-passes-big-day = Пролётов в сутки: { $n }, суммарное время связи { $dur }.

js-meankind-passes-big-window = Пролётов за окно в { $hours } h: { $n }, суммарное время связи { $dur }.

js-meankind-passes-line = Лучший пролёт поднимается до { $deg }°.

js-meankind-percentile-word = перцентиль

js-meankind-pnt-big = Квантовый комплект удерживает положение и время { $q }; классический комплект — { $c }.

js-meankind-pnt-classical-label = Holdover, классический комплект

js-meankind-pnt-line = Holdover — это время, в течение которого каждый комплект (часы { $q } против часов { $c }) остаётся в пределах { $spec } после потери спутниковой навигации.

js-meankind-pnt-quantum-label = Holdover, квантовый комплект

js-meankind-pnt-timing-classical-label = Ошибка времени, 95 %, классический

js-meankind-pnt-timing-quantum-label = Ошибка времени, 95 %, квантовый

js-meankind-pvt-big =
    { $n ->
        [one] Положение решено в { $solved } из { $n } эпохи, с точностью { $rms } m (3-D RMS).
        [few] Положение решено в { $solved } из { $n } эпох, с точностью { $rms } m (3-D RMS).
        [many] Положение решено в { $solved } из { $n } эпох, с точностью { $rms } m (3-D RMS).
       *[other] Положение решено в { $solved } из { $n } эпох, с точностью { $rms } m (3-D RMS).
    }

js-meankind-pvt-line = В среднем спутников: { $mean }; по реальным измерениям приёмника.

js-meankind-qnav-big = После перерыва ошибка навигатора на холодных атомах составляет { $q } m, навигатора навигационного класса — { $c } m.

js-meankind-qnav-big-outage = После { $dur } без спутников ошибка навигатора на холодных атомах составляет { $q } m, навигатора навигационного класса — { $c } m.

js-meankind-qnav-line = В пределах бюджета: { $q } против { $c }.

js-meankind-qnav-line-threshold = В пределах { $threshold } m: { $q } против { $c }.

js-meankind-qtt-big = Квантовая передача времени удерживает { $q } ps (1 сигма) против { $c } ns для классической цепочки.

js-meankind-qtt-line = Монитор безопасности обнаруживает { $pd } % атак.

js-meankind-qtt-line-pfa = Монитор безопасности обнаруживает { $pd } % атак при частоте ложных тревог { $pfa }.

js-meankind-quantum-link = квантовая линия

js-meankind-radiometry-big = Камера достигает NIIRS { $niirs } при расстоянии между центрами пикселей на местности { $gsd } m и отношении сигнал/шум { $snr }.

js-meankind-radiometry-line = Системная MTF на частоте Найквиста { $mtf }.

js-meankind-reentry-big = Пиковое замедление составляет { $g } g на высоте { $km } km.

js-meankind-reentry-line = Скорость аппарата при этом { $speed } m/s.

js-meankind-slam-big = Сопоставление с рельефом заканчивается с ошибкой { $matched } m, тогда как на одной инерциальной системе она составляет { $free } m.

js-meankind-slam-line =
    { $n ->
        [one] По { $n } путевой точке, сопоставление с картой рельефа при шуме высотомера { $sigma } m.
        [few] По { $n } путевым точкам, сопоставление с картой рельефа при шуме высотомера { $sigma } m.
        [many] По { $n } путевым точкам, сопоставление с картой рельефа при шуме высотомера { $sigma } m.
       *[other] По { $n } путевым точкам, сопоставление с картой рельефа при шуме высотомера { $sigma } m.
    }

js-meankind-slot-big = Часы выходят за защитный интервал слота через { $dur } после последней спутниковой привязки.

js-meankind-slot-line = Поэтому привязка нужна каждые { $interval }, примерно { $perDay } в сутки.

js-meankind-solar-big = Небесных тел, размещённых на одну эпоху: { $n }.

js-meankind-solar-big-link = Небесных тел, размещённых на одну эпоху: { $n }; свет идёт { $dur } от { $from } до { $to }.

js-meankind-solar-line = Всего линий связи с измеренным временем: { $n }.

js-meankind-spoof-caught = Спуфинг обнаруживается раньше, чем нарушается спецификация синхронизации.

js-meankind-spoof-caught-both = Спуфинг обнаруживается обоими часами раньше, чем нарушается спецификация синхронизации.

js-meankind-spoof-caught-label = Время обнаружения, { $name }

js-meankind-spoof-caught-thr = Спуфинг обнаруживается раньше, чем нарушается спецификация синхронизации в { $thr } ns.

js-meankind-spoof-caught-thr-both = Спуфинг обнаруживается обоими часами раньше, чем нарушается спецификация синхронизации в { $thr } ns.

js-meankind-spoof-detects = { $name } обнаруживает его через { $dur } при смещении { $offset } ns.

js-meankind-spoof-missed =
    { $n ->
        [one] Спуфинг нарушает спецификацию синхронизации раньше, чем его обнаруживает: { $names }.
        [few] Спуфинг нарушает спецификацию синхронизации раньше, чем его обнаруживает: { $names }.
        [many] Спуфинг нарушает спецификацию синхронизации раньше, чем его обнаруживает: { $names }.
       *[other] Спуфинг нарушает спецификацию синхронизации раньше, чем его обнаруживает: { $names }.
    }

js-meankind-spoof-offset = смещение { $offset } ns

js-meankind-spoofdetect-big-by = Да: спуфинг обнаружен ({ $by }).

js-meankind-spoofdetect-big-no = Нет: объединённый монитор не обнаруживает спуфинг.

js-meankind-spoofdetect-big-yes = Да: спуфинг обнаружен.

js-meankind-spoofdetect-line = Слоёв обнаружения, подающих сигнал тревоги: { $on } из { $n }.

js-meankind-spoofdetect-line-score = Слоёв обнаружения, подающих сигнал тревоги: { $on } из { $n }; объединённая оценка { $score }.

js-meankind-ssv-formation = При расстоянии { $km } km между аппаратами фильтр знает относительное положение с RMS { $filter } m, тогда как разность двух абсолютных привязок даёт { $absolute } m.

js-meankind-ssv-navigation = Бортовой фильтр удерживает положение с RMS { $inside } m внутри орбит GNSS и { $above } m выше них.

js-meankind-ssv-shell = На оболочке все орбитальные группировки вместе дают хотя бы один сигнал { $one } % времени и хотя бы четыре — { $four } % (L1).

js-meankind-ssv-tail = MODELLED: геометрический расчёт и расчёт бюджета линии связи с перебором параметров, а не измерение какого-либо сигнала в пространстве.

js-meankind-ssv-trajectory = На высотах от { $from } до { $to } km хотя бы один сигнал в зоне видимости { $one } % эпох и хотя бы четыре — { $four } % (L1, все орбитальные группировки).

js-meankind-station-big = Над южной полярной областью поправки лунной опорной станции снижают ошибку ({ $percentile }) с { $from } m до { $to } m (смоделировано).

js-meankind-station-line = В пределах порога точности { $share } % эпох; это не утверждение о какой-либо реальной системе.

js-meankind-sweep-big =
    { $n ->
        [one] По { $n } значению { $param }: { $parts }.
        [few] По { $n } значениям { $param }: { $parts }.
        [many] По { $n } значениям { $param }: { $parts }.
       *[other] По { $n } значениям { $param }: { $parts }.
    }

js-meankind-sweep-line = { $param } меняется от { $from } до { $to }.

js-meankind-sweep-line-log = { $param } меняется от { $from } до { $to } в логарифмическом масштабе.

js-meankind-sweep-part-flat = { $metric } ({ $key }) остаётся на уровне { $value }

js-meankind-sweep-part-goes = { $metric } ({ $key }) меняется от { $first } до { $last }

js-meankind-sweep-result-word = результат

js-meankind-sweepnd-big =
    { $n ->
        [one] По { $n } сочетанию { $keys }: { $metric } меняется от { $min } до { $max }.
        [few] По { $n } сочетаниям { $keys }: { $metric } меняется от { $min } до { $max }.
        [many] По { $n } сочетаниям { $keys }: { $metric } меняется от { $min } до { $max }.
       *[other] По { $n } сочетаниям { $keys }: { $metric } меняется от { $min } до { $max }.
    }

js-meankind-sweepnd-line = Сетка прогонов движка: { $shape }.

js-meankind-telecom-fail = Проверки телекоммуникационной ошибки времени, не пройденные часами: { $fail } из { $n }.

js-meankind-telecom-line = Проверки MTIE (максимальная ошибка временного интервала), TDEV (девиация времени) и огибающей holdover по маскам ITU-T, указанным в каждой строке.

js-meankind-telecom-line-margin = Проверки MTIE (максимальная ошибка временного интервала), TDEV (девиация времени) и огибающей holdover по маскам ITU-T, указанным в каждой строке. Наименьший запас до огибающей holdover составляет { $margin } ns.

js-meankind-telecom-pass = Часы проходят все проверки телекоммуникационной ошибки времени: { $n }.

js-meankind-the-best = лучший

js-meankind-the-body = небесное тело

js-meankind-the-first = первый

js-meankind-the-name = { $name }

js-meankind-the-second = второй

js-meankind-the-widest-signal = самый широкий сигнал

js-meankind-timebudget-big = Ошибка часов ({ $clock }) и ошибка системы отсчёта пересекаются при времени усреднения { $tau }.

js-meankind-timebudget-line = В этой точке пересечения ошибка времени составляет { $x } s.

js-meankind-timeoffset-big = Часы на Луне идут на { $rate } µs в сутки быстрее часов на Земле.

js-meankind-timeoffset-line = Опубликованный диапазон составляет от { $low } до { $high } µs в сутки.

js-meankind-timetransfer-big = { $q } удерживает два пункта в пределах { $qps } ps (среднеквадратичное значение); { $c } — в пределах { $cps } ps.

js-meankind-timetransfer-line = В пределах спецификации дальнометрии { $q } % времени, против { $c } %.

js-meankind-timetransfer-line-mm = В пределах спецификации дальнометрии в { $mm } mm { $q } % времени, против { $c } %.

js-meankind-tracking-big = Спуфер может захватить приёмник с расстояния до { $km } km.

js-meankind-tracking-line = При собственной динамике контуров приёмника захват теряется при превышении сигнала помехой на { $db } dB.

js-meankind-trade-big = Квантовые датчики точнее классического базового уровня в { $timing } раз по синхронизации времени и в { $inertial } раз по инерциальной навигации.

js-meankind-trade-line = Без спутников квантовый комплект работает автономно { $dur }.

js-meankind-ttbudget-big = Двустороннее смещение составляет { $offset } ns при суммарной неопределённости { $uncertainty } ns.

js-meankind-ttbudget-line = Sagnac { $sagnac } ns; ионосфера { $iono } ns.

js-meankind-ukf-big-no = Нет: фильтр не самосогласован.

js-meankind-ukf-big-yes = Да: фильтр самосогласован.

js-meankind-ukf-line-in = Его нормированный квадрат инновации в среднем равен { $mean }, внутри 95-процентной полосы от { $low } до { $high }. Это проверка согласованности, а не точности.

js-meankind-ukf-line-in-seeds = Его нормированный квадрат инновации в среднем равен { $mean }, внутри 95-процентной полосы от { $low } до { $high }, при числе начальных значений (seed): { $n }. Это проверка согласованности, а не точности.

js-meankind-ukf-line-out = Его нормированный квадрат инновации в среднем равен { $mean }, вне 95-процентной полосы от { $low } до { $high }. Это проверка согласованности, а не точности.

js-meankind-ukf-line-out-seeds = Его нормированный квадрат инновации в среднем равен { $mean }, вне 95-процентной полосы от { $low } до { $high }, при числе начальных значений (seed): { $n }. Это проверка согласованности, а не точности.

js-meankind-user-word = пользователь

js-meankind-vlbi-big = На базе { $km } km сигнал маяка приходит на две станции с разницей { $ms } ms.

js-meankind-vlbi-line = Поправка ближнего поля составляет { $us } µs.

js-meankind-vlbifim-big = Координата каждой станции известна с точностью { $m } m при этом расписании наблюдений.

js-meankind-vlbifim-line = Простая оценка с равными долями давала бы { $m } m.

js-meankind-weather-big = Верхняя атмосфера нагревается до { $k } K.

js-meankind-weather-big-ref = Верхняя атмосфера нагревается до { $k } K, против { $ref } K для эталона.

js-meankind-weather-line = Индекс геомагнитной активности ap равен { $ap }.

js-meankind-whole-run = за весь прогон

js-mthread-bcol-label = Метка

js-mthread-bcol-share = Размер относительно наибольшего члена положения

js-mthread-bcol-sigma = 1 сигма

js-mthread-bcol-source = Вклад

js-mthread-budget-caption = { $phase }: 1 сигма на входе { $entry }, в пике { $peak }, на выходе { $exit } (положение); ниже каждый вклад, от наибольшего.

js-mthread-chart-title = { $metric } в зависимости от времени миссии, по одной полосе на этап

js-mthread-col-kind = Вид

js-mthread-col-label = Метка

js-mthread-col-limit = Наибольший вклад

js-mthread-col-margin = Относительно предела

js-mthread-col-peak-pos = Пик положения

js-mthread-col-peak-time = Пик смещения часов

js-mthread-col-peak-vel = Пик скорости

js-mthread-col-phase = Этап

js-mthread-col-window = Время миссии

js-mthread-example-not-loaded = записанный результат не загрузился

js-mthread-file-failed = Не удалось прочитать { $name }: { $reason }.

js-mthread-kv-elapsed = Прошедшее время миссии

js-mthread-kv-engine = Движок

js-mthread-kv-epoch = Эпоха (UTC)

js-mthread-kv-limits = Этапы с заявленным пределом

js-mthread-kv-limits-value = { $n } (выполнено: { $met }, не выполнено: { $missed })

js-mthread-kv-phases = Этапы

js-mthread-kv-seed = Начальное значение (seed)

js-mthread-kv-title = Цепочка

js-mthread-layout-phases = Равная ширина на этап

js-mthread-layout-time = Истинное время миссии

js-mthread-limit-title = { $phase }: заявленный предел, { $limit }

js-mthread-log-scale = логарифмическая шкала

js-mthread-margin-met = { $m }× предела, выполнено

js-mthread-margin-missed = { $m }× предела, не выполнено

js-mthread-metric-pos = Положение, 1 сигма

js-mthread-metric-time = Смещение часов, 1 сигма

js-mthread-metric-vel = Скорость, 1 сигма

js-mthread-na = н/д

js-mthread-no-events = На этом этапе события не записаны.

js-mthread-no-phases = в результате нет этапов

js-mthread-no-requirement = предел не заявлен

js-mthread-no-series = В результате нет отсчётов этой величины.

js-mthread-no-weak = В результате не названо самое слабое звено.

js-mthread-not-json = результат не является JSON ({ $reason })

js-mthread-not-thread = это не результат цепочки миссии (ожидалась схема { $schema })

js-mthread-note-phases = Каждый этап нарисован одной и той же ширины, чтобы короткий этап был виден так же, как длинный; время начала каждого этапа указано под полосой. Переключитесь на истинное время миссии, чтобы увидеть реальные пропорции. Пунктирные линии — пределы, заявленные в документе; разрыв линии означает переход между этапами.

js-mthread-note-time = Истинное время миссии: этап в несколько минут может быть слишком узким, чтобы его разглядеть. Переключитесь на равную ширину, чтобы его прочитать. Пунктирные линии — пределы, заявленные в документе; разрыв линии означает переход между этапами.

js-mthread-open-failed = Не удалось открыть пример: { $reason }.

js-mthread-opened = { $name } прочитан на этой странице; ничего никуда не отправлялось.

js-mthread-opening = Открывается пример класса Artemis…

js-mthread-prov = Каждая метка на этой странице принадлежит самому движку; страница копирует каждое число из результата и лишь масштабирует его.

js-mthread-recorded = Записанный результат движка (версия { $version }): иллюстративная цепочка, построенная по публичным описаниям миссий; числа смоделированы и не соответствуют ничему реальному.

js-mthread-sets-peak = задаёт пик

js-mthread-too-large = Этот файл больше { $mb } MB; он не читается.

js-mthread-weak-line = Самое слабое звено — этап <b>{ $phase }</b>: { $margin }× его заявленного предела, задан источником { $source }. Запас — это наименьшее отношение заявленного предела к пику этапа; значение выше 1 означает, что требование выполнено.

js-mthread-weakest-flag = самое слабое звено

js-mthread-weakest-mark = самое слабое звено

js-obs-cell-extent = от { $south }° до { $north }° с. ш., от { $west }° до { $east }° в. д.

js-obs-cell-read = { $state }: { $cell }. Опрошено { $sampled }, затронуто { $affected }.

js-obs-cell-title = { $state }; опрошено { $sampled }, затронуто { $affected }

js-obs-cell-title-reason = { $state } ({ $reason }); опрошено { $sampled }, затронуто { $affected }

js-obs-clear-note = { $notClear } Ячейка без записи была замечена менее чем 5 разными воздушными судами и скрыта; она не рисуется. Цвет никогда не бывает единственным признаком: «не наблюдалось» показано штриховкой, а таблица прописывает каждое состояние словами.

js-obs-col-affected = Затронутые воздушные суда

js-obs-col-bbox = Охватывающий прямоугольник (Ю, З, С, В)

js-obs-col-bytes = Байты

js-obs-col-cause = Причина

js-obs-col-cell = Ячейка (широта, долгота)

js-obs-col-cells = Ячейки

js-obs-col-check = Проверка

js-obs-col-file = Файл

js-obs-col-incident = Инцидент

js-obs-col-sampled = Опрошенные воздушные суда

js-obs-col-sha = SHA-256 (манифест)

js-obs-col-share = Доля затронутых

js-obs-col-state = Состояние

js-obs-col-why = Почему не наблюдалось

js-obs-day-alt = Ячеек с ухудшением: { $degraded }, без ухудшения: { $notDegraded }, не наблюдалось: { $notObserved }, на { $date }.

js-obs-day-heading = День { $date } (UTC)

js-obs-ds-attribution = Атрибуция

js-obs-ds-coverage = Охват

js-obs-ds-dataset = Набор данных

js-obs-ds-licence = Лицензия

js-obs-ds-licence-address = Адрес лицензии

js-obs-ds-product = Продукт

js-obs-ds-written-by = Записано Kshana

js-obs-err-cause = { $name } указывает причину, отличную от «не приписана»; эта страница не показывает ни одной

js-obs-err-feature-polygon = { $name }: объект { $n } не является полигоном ячейки

js-obs-err-feature-state = { $name }: у объекта { $n } состояние «{ $state }», которого нет среди { $states }

js-obs-err-incident-object = { $name }: инцидент { $n } не является объектом

js-obs-err-no-date = { $name } не указывает дату

js-obs-err-no-features = { $name } не содержит объектов

js-obs-err-no-incidents = { $name } не содержит списка инцидентов

js-obs-err-not-day = { $name } не является файлом { $schema }

js-obs-err-not-incident = { $name } не является файлом { $schema }

js-obs-err-not-json = { $what } не является JSON ({ $reason })

js-obs-err-not-manifest = { $name } не является файлом { $schema }

js-obs-err-not-object = { $what } не является объектом JSON

js-obs-err-not-text = { $what } не является текстом или больше { $mib } MiB

js-obs-err-states = { $name } называет состояния, кроме трёх, которые показывает эта страница

js-obs-file-matches = совпадает

js-obs-file-mismatch = не совпадает

js-obs-file-no-hash = хеш не указан

js-obs-file-not-opened = не открыт

js-obs-files-note = Метод { $method }. SHA-256 каждого файла вычисляется здесь по открытому вами файлу и сравнивается с манифестом; файл, который вы не открывали, не проверяется.

js-obs-incident = инцидент

js-obs-incident-note = Соприкасающиеся ячейки с ухудшением (включая по диагонали) образуют один инцидент. Причина каждого инцидента: не приписана. Это не подтверждение и не NOTAM.

js-obs-kv-cells = Опубликовано ячеек

js-obs-kv-day-wide = Влияние на весь день

js-obs-kv-degraded = Ухудшено

js-obs-kv-not-degraded = Не ухудшено

js-obs-kv-not-observed = Не наблюдалось (опубликовано)

js-obs-kv-scope = Охват

js-obs-map-aria = { $summary } В таблице ниже перечислены все ячейки.

js-obs-means-degraded = Большая доля воздушных судов, опрошенных в ячейке, в этот день сообщала о низкой точности навигации, заметно выше фона этого дня.

js-obs-means-not-degraded = Опрошено достаточно воздушных судов, и доля не достигла порога правила.

js-obs-means-not-observed = Данные не позволили сделать вывод. Это не означает «чисто».

js-obs-na = н/д

js-obs-no = нет

js-obs-no-cells = В этом файле нет ячеек

js-obs-no-day-file = Среди файлов за { $date } нет файла дня (.geojson), поэтому показывать за этот день нечего.

js-obs-no-degraded = В этот день нет ячеек с ухудшением.

js-obs-no-file-read = Ни один файл не удалось прочитать.

js-obs-no-incident-file = Для этого дня файл инцидентов не открывался.

js-obs-no-manifest = Для этого дня манифест не открывался, поэтому файлы нельзя проверить по их хешам.

js-obs-no-notice = В этом файле нет уведомления. Консультативное заявление вверху этой страницы действует в любом случае.

js-obs-no-reason = причина не указана

js-obs-not-clear = «Не наблюдалось» не означает «чисто».

js-obs-not-readable = { $name }: этот файл эта страница не читает (.geojson, .incidents.json, .manifest.json или .png).

js-obs-not-stated = не указано

js-obs-note-day-wide = Это был день с влиянием на весь день: фон дня сам по себе был высоким, поэтому в этот день нельзя было сделать вывод ни по одной ячейке. Это не утверждение, что небо было чистым.

js-obs-note-summary-mismatch = Сводка, указанная в файле, не совпадает с перечисленными в нём ячейками; числа показаны как записаны.

js-obs-nothing-yet = Пока показывать нечего: откройте также файл .geojson этого дня.

js-obs-notice = Уведомление в файле: { $notice }

js-obs-opened-day-file = Открыто дней: { $days }, файлов: { $files }. Прочитано здесь; ничего не загружалось.

js-obs-opened-day-files = Открыто дней: { $days }, файлов: { $files }. Прочитано здесь; ничего не загружалось.

js-obs-opened-days-file = Открыто дней: { $days }, файлов: { $files }. Прочитано здесь; ничего не загружалось.

js-obs-opened-days-files = Открыто дней: { $days }, файлов: { $files }. Прочитано здесь; ничего не загружалось.

js-obs-read-failed = { $name }: не удалось прочитать ({ $reason }).

js-obs-reason-day-wide = фон дня сам по себе был высоким, поэтому в этот день нельзя было сделать вывод ни по одной ячейке

js-obs-reason-insufficient = опрошено слишком мало воздушных судов, чтобы сделать вывод

js-obs-reason-no-background = для этого дня не было фона, с которым можно было бы сравнить ячейку

js-obs-release = Выпущено не ранее { $when }: продукты публикуются не менее чем через { $hours } ч после окончания дня, на ячейках { $deg }°. Это не живое представление.

js-obs-release-default = конец дня плюс задержка

js-obs-show-all = Показать все ячейки: { $n }

js-obs-state-degraded = Ухудшено

js-obs-state-not-degraded = Не ухудшено

js-obs-state-not-observed = Не наблюдалось

js-obs-the-day-file = файл дня

js-obs-the-incident-file = файл инцидентов

js-obs-the-manifest = манифест

js-obs-too-large = { $name }: больше { $mib } MiB; откройте файл поменьше.

js-obs-unstated-number = неуказанное число

js-obs-withheld = скрыто

js-obs-yes-no-call = да: нельзя было сделать вывод ни по одной ячейке

js-opt-avail-label = Доступность, потолок и доступность при ясном небе по пунктам

js-opt-avail-note = По пунктам: доступность линии при замираниях из-за облачности и турбулентности, потолок, который не поднять никаким дополнительным запасом (облачность и наведение), и доступность при полном отсутствии облаков.

js-opt-avail-title = Доступность относительно потолка

js-opt-bar-available = { $name }: доступно

js-opt-bar-ceiling = { $name }: потолок

js-opt-bar-clear-sky = { $name }: ясное небо

js-opt-blurb-network = Более облачный северный, умеренный центральный и более ясный южный пункты наблюдают оптический терминал на LEO под углом 30 градусов: как часто линия работает и что дают дополнительные пункты?

js-opt-blurb-techniques = Одна восходящая линия под углом 25 градусов в облачности и турбулентности: что дают другая длина волны, большая апертура, адаптивная оптика или больший запас?

js-opt-cloud-episode = эпизод облачности

js-opt-correlated = коррелированы

js-opt-default-bars = столбцы

js-opt-default-chart = график

js-opt-direction-wave = { $direction }, волна { $wave }

js-opt-diversity-label = Доступность сети в зависимости от числа пунктов

js-opt-diversity-note = Доступность лучших 1, 2 и 3 пунктов при независимой погоде и при погоде, коррелированной на расстоянии { $km } km.

js-opt-diversity-title = Разнесение пунктов

js-opt-fact-capture-loss = Геометрические потери захвата

js-opt-fact-direction = Направление

js-opt-fact-elevation = Угол места

js-opt-fact-footprint = След луча

js-opt-fact-margin = Запас без атмосферы

js-opt-fact-received = Принятая мощность, без атмосферы

js-opt-fact-sensitivity = Чувствительность приёмника

js-opt-fact-wavelength = Длина волны

js-opt-gain-points = +{ $n } п. п.

js-opt-hours = часов

js-opt-independent = независимы

js-opt-link-down = линия не работает

js-opt-margin-label = Дополнительный запас, нужный для каждой целевой доступности

js-opt-margin-line-title = { $name }: запас линии, dB

js-opt-margin-note = Дополнительный запас линии, в dB сверх нынешнего, для каждой целевой доступности; отрицательное значение означает, что у линии уже больше запаса, чем нужно. Для цели выше потолка пункта нет запаса, который её достигает (движок её опускает).

js-opt-margin-title = Запас, который нужен для каждой целевой доступности

js-opt-model-output = Результат модели

js-opt-na = н/д

js-opt-no-data = В этом результате нет данных.

js-opt-no-series = В этом результате нет временного ряда.

js-opt-no-source = источник не указан

js-opt-not-result = это не результат оптической атмосферы с пунктами

js-opt-open-failed = Не удалось открыть { $title }: { $reason }.

js-opt-opening = Открывается { $title }…

js-opt-outage-label = Вероятность того, что перерыв длится дольше заданной продолжительности

js-opt-outage-note = Вероятность того, что перерыв длится дольше заданной продолжительности, по пунктам (ось времени логарифмическая).

js-opt-outage-title = Как долго длятся перерывы

js-opt-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

js-opt-prov = { $label } Пункты: { $sites }.

js-opt-realised-up = { $value } в работе

js-opt-recorded = { $title }: записанный результат движка (версия { $version }). Результат модели, а не измерение.

js-opt-result-not-json = результат не является JSON ({ $reason })

js-opt-result-not-loaded = записанный результат не загрузился

js-opt-series-label = Запас линии во времени

js-opt-series-note = Одна реализация заявленной модели пункта с заданным начальным значением (seed { $seed }, { $hours } h с шагом { $step } s): эпизоды облачности, столб жидкой воды для каждого, один отсчёт мерцания на шаг. Запас — это бюджет замираний за вычетом замираний из-за облачности и мерцания; ниже 0 dB линия не работает. Это один розыгрыш, а не климат: его доступность отличается от заявленной на ошибку выборки этого розыгрыша. Запас обрезается на уровне −40 dB для построения графика.

js-opt-series-title = Запас линии во времени

js-opt-stated = заявлено { $value }

js-opt-stripe-cloud = облачность

js-opt-stripe-down = не работает

js-opt-stripe-title = { $what }, час с { $from } по { $to }

js-opt-techniques-label = Выигрыш в доступности по методам

js-opt-techniques-note = Выигрыш в доступности в процентных пунктах относительно базового уровня, для одного пункта.

js-opt-techniques-title = Что даёт каждый метод

js-opt-th-availability = Доступность

js-opt-th-ceiling = Потолок

js-opt-th-clear-air = Потери в чистом воздухе

js-opt-th-cloud-prob = Вероятность облачности (вход)

js-opt-th-fade-budget = Бюджет замираний

js-opt-th-latlon = Широта, долгота

js-opt-th-mean-outage = Средний перерыв

js-opt-th-outages-year = Перерывов в год

js-opt-th-scint = Индекс мерцания

js-opt-th-site = Пункт

js-opt-timing-label = Доступность синхронизации времени по пунктам и часам

js-opt-timing-note = Доля всего времени, в течение которого ошибка времени остаётся в пределах порога, по пунктам и классам часов: holdover часов относительно длительностей перерывов.

js-opt-timing-title = Синхронизация времени, сохраняемая в перерывах

js-opt-title-network = Три наземных пункта, разнесение пунктов

js-opt-title-techniques = Одна восходящая линия, методы повышения доступности

js-opt-x-best-n = лучшие n пунктов

js-opt-x-outage-duration = длительность перерыва, h (лог.)

js-opt-x-target = целевая доступность, %

js-opt-y-availability = доступность, %

js-opt-y-extra-margin = дополнительный запас, dB

js-opt-y-p-longer = P(дольше)

js-replay-band-calibrating = калибровка

js-replay-band-degraded = ухудшено

js-replay-band-nominal = номинально

js-replay-band-run-ended = { $band } · прогон завершён

js-replay-band-untrusted = нет доверия

js-replay-clock = T+{ $t } из { $max }

js-replay-coast-hidden = побережье скрыто: выдуманные положения этого журнала попадают на сушу

js-replay-coast-note = Побережье: { $source }, только для иллюстрации.

js-replay-coast-note-hidden = { $reason }.

js-replay-coast-window = Natural Earth 1:10 млн, окно { $window }

js-replay-coast-world = Natural Earth 1:110 млн (контур мира в Studio), грубо

js-replay-demo-trust-log = { $title } (журнал доверия)

js-replay-dir-east = восток

js-replay-dir-north = север

js-replay-dir-south = юг

js-replay-dir-west = запад

js-replay-dirs-and = { $list } и { $last }

js-replay-drawing-animation = Рисуется анимация…

js-replay-drawing-frames = Рисуются кадры…

js-replay-every-direction = все направления

js-replay-file-error = { $name }: { $error }

js-replay-kinds-convergence-horizontal = Сходимость: медианная горизонтальная ошибка

js-replay-kinds-convergence-vertical = Сходимость: медианная вертикальная ошибка

js-replay-kv-course = Сообщённый путевой угол

js-replay-kv-heading = Курс (гироскоп)

js-replay-kv-position-error = Ошибка положения

js-replay-kv-receiver = Приёмник

js-replay-kv-run-time = Время прогона

js-replay-kv-satellites = Спутников использовано / в зоне видимости

js-replay-kv-sky = Небо

js-replay-legend = Легенда

js-replay-legend-no-fix = нет решения

js-replay-legend-true-track = истинная трасса

js-replay-moment = Момент T+{ $t }:

js-replay-no-coast = Побережье не рисуется: для этого окна оно не входит в поставку.

js-replay-no-gsv = в этом журнале нет GSV

js-replay-not-json = { $name }: не JSON.

js-replay-not-scored = не оценено

js-replay-obs-not-attributed = не приписана

js-replay-open-failed = Не удалось открыть { $id }: { $reason }.

js-replay-open-file = Открыть файл…

js-replay-opened = Открыт { $name } в панели { $n }. Прочитано здесь; ничего не загружалось.

js-replay-opening = Открывается { $id }…

js-replay-pause = Пауза

js-replay-play = Воспроизвести

js-replay-read-failed = { $name }: не удалось прочитать или нарисовать ({ $reason }).

js-replay-reading = Читается { $name }…

js-replay-reduced-motion = Предпочтительно уменьшение анимации, поэтому повтор начинается с 1x и не запускается сам.

js-replay-run = Прогон

js-replay-run-shown = Прогон, показанный в панели { $n }

js-replay-saved-svg = Сохранён { $name } ({ $size } kB): все кадры в одном файле, нарисованные по тем же строкам, что и эта страница.

js-replay-saved-zip = Сохранён { $name } ({ $size } MB): по одному SVG на кадр, манифест строк, лежащих за каждым, и README.

js-replay-src-instructor = Ваш файл { $name }: журнал инструктора сам по себе не содержит ни оценки движка, ни неба.

js-replay-src-trust = Ваш файл { $name }: результат доверия не содержит ни неба, ни курса, поэтому они не рисуются.

js-replay-status-ready = { $a } и { $b }: синтетические прогоны, оценённые движком. Нажмите «Воспроизвести» или сдвиньте время.

js-replay-status-synthetic = { $titles }: синтетические прогоны, оценённые движком.

js-replay-status-synthetic-no-coast = { $titles }: синтетические прогоны, оценённые движком. Береговая линия недоступна.

js-replay-strip-label = Оценка доверия за прогон

js-replay-titles-and = { $a } и { $b }

js-replay-too-large = { $name } больше, чем эта страница может прочитать.

js-replay-track = Трасса по строкам журнала: { $n }, север вверху.

js-replay-track-widened = Трасса по строкам журнала: { $n }, север вверху, расширена, чтобы показать ближайшее побережье.

js-replay-verdict = Вердикт

js-replay-verdict-degraded = { $dur } в полосе «ухудшено», в полосе «нет доверия» — ни разу

js-replay-verdict-early = Вердикт (предварительный)

js-replay-verdict-fine = Только по журналу и оценке движка; синтетически, носит консультативный характер, не является показателем качества обнаружения.

js-replay-verdict-first = впервые ниже номинала в T+{ $t }

js-replay-verdict-first-after = впервые ниже номинала в T+{ $t }, через { $dur } после начала первого события (T+{ $onset })

js-replay-verdict-first-before = впервые ниже номинала в T+{ $t }, до начала первого события (T+{ $onset })

js-replay-verdict-lowest = Наименьшая оценка доверия { $score } ({ $band }) в T+{ $t }

js-replay-verdict-never-left = оценка ни разу не выходила из номинальной полосы

js-replay-verdict-no-fix = нет решения в течение { $dur }

js-replay-verdict-not-scored = Не оценено: оценка доверия движка показана для прогонов из библиотеки

js-replay-verdict-peak-error = наибольшая записанная ошибка положения { $err } m в T+{ $t }

js-replay-verdict-untrusted = { $dur } в полосе «нет доверия»

js-replay-verdict-wait = Показывается по окончании этого прогона, в T+{ $t }.

js-ssv-altitude-label = Высота и использованные измерения

js-ssv-at-least-1 = хотя бы 1 сигнал

js-ssv-at-least-4 = хотя бы 4 сигнала

js-ssv-avail-label = Доступность, { $band }

js-ssv-bar-title = { $label }, { $name }: { $value }{ $unit }

js-ssv-blurb-formation-heo = Ведущий и ведомый аппараты на расстоянии километра друг от друга на сильно эллиптической орбите: насколько хорошо фильтр знает их относительное положение по сравнению с тем, что дали бы две абсолютные привязки.

js-ssv-blurb-heo = Сильно эллиптическая орбита (апогей около 58 600 km) с высокоусилительной надирной и зенитной патч-антенной и параметрической моделью боковых лепестков: сигналы в зоне видимости, наилучшее C/N0, главный лепесток и боковой лепесток, геометрический фактор DOP и сигналы, касающиеся атмосферы.

js-ssv-blurb-lunar-weak = Лунная трасса перелёта с приёмником, рассчитанным на самые слабые сигналы: что ему нужно для захвата и сопровождения и какую часть траектории он может использовать.

js-ssv-blurb-nav-lunar = Бортовой навигационный фильтр на лунном перелёте: ошибка его положения относительно заявленной границы, ниже и выше собственных орбит спутников GNSS.

js-ssv-blurb-shell = Сферическая оболочка на геостационарной высоте, выбранная по сетке: как часто находящийся там космический аппарат слышит хотя бы один и хотя бы четыре сигнала при 20 dB-Hz, на L1 и L5, для каждой орбитальной группировки и для всех вместе?

js-ssv-cn0-altitude-label = Наилучшее C/N0 и высота во времени, { $band }

js-ssv-cn0-label = Наилучшее C/N0, { $band }

js-ssv-cn0-note = Из сигналов в зоне видимости самый сильный в каждую эпоху: от наименьшего до наибольшего по эпохам, среднее отмечено.

js-ssv-cn0-title = Наилучшее отношение несущей к плотности шума, { $band }

js-ssv-comparison-failed = Не удалось показать сравнение ({ $reason }).

js-ssv-comparison-not-loaded = файл сравнения не загрузился

js-ssv-default-bars = столбцы

js-ssv-default-chart = график

js-ssv-default-ranges = диапазоны

js-ssv-deputies-note = Абсолютный RMS ведущего аппарата { $rms } m, эпох: { $epochs }.

js-ssv-deputies-title = Каждый ведомый аппарат

js-ssv-dop-note = Медиана, 95-й перцентиль и наихудший PDOP по эпохам, в которых есть решение, а там, где сценарий задаёт атмосферу, — и сигналы, касающиеся её.

js-ssv-dop-title = Геометрический фактор DOP и атмосфера, { $band }

js-ssv-err-label = Ошибка положения относительно заявленной границы

js-ssv-err-note = Пунктирная линия — граница в одну сигму, которую заявляет фильтр; сплошная линия — его ошибка относительно истины, известной сценарию. Прорежено движком.

js-ssv-err-title = Ошибка положения относительно собственной границы фильтра

js-ssv-fact-antenna = Антенна

js-ssv-fact-apogee = Высота апогея

js-ssv-fact-cn0-threshold = Порог отношения несущей к плотности шума

js-ssv-fact-duration = Длительность

js-ssv-fact-eccentricity = Эксцентриситет

js-ssv-fact-grid-points = Узлы сетки

js-ssv-fact-inclination = Наклонение

js-ssv-fact-mode = Режим

js-ssv-fact-perigee = Высота перигея

js-ssv-fact-period = Период

js-ssv-fact-shell-altitude = Высота оболочки

js-ssv-fact-sma = Большая полуось

js-ssv-fact-step = Шаг

js-ssv-filter = фильтр

js-ssv-formation-note = RMS ошибки относительного положения по фильтру и по разности двух абсолютных привязок, за весь прогон и выше орбит GNSS.

js-ssv-formation-title = Относительное положение ведомых аппаратов

js-ssv-from-absolute = по двум абсолютным привязкам

js-ssv-group-combined = все вместе

js-ssv-icg-note = { $label }; вердикты на уровне порогов по зафиксированным файлам результатов движка (коммит движка { $commit }). Таблицы буклета общедоступны; ничто здесь не является VALIDATED.

js-ssv-icg-wrong-file = файл сравнения ICG не тот, который читает эта страница

js-ssv-lobe-note = Сколько из пригодных линий прошло через главный лепесток и сколько через боковой, по подсчёту движка.

js-ssv-lobe-title = Главный и боковой лепесток, { $band }

js-ssv-na = н/д

js-ssv-nav-note = Использованные и отброшенные по стробу измерения, наибольший разрыв с менее чем четырьмя сигналами, итоговая ошибка и оценка давления солнечного излучения относительно истины, известной сценарию.

js-ssv-nav-title = Прогон в числах

js-ssv-never = никогда

js-ssv-never-had-four = ни разу не было четырёх

js-ssv-never-had-one = ни разу не было ни одного

js-ssv-no-range = В этом результате нет диапазона.

js-ssv-no-series = В результате нет ряда для этого графика.

js-ssv-not-in-variant = не входит в вариант

js-ssv-not-result = это не результат gnss-ssv

js-ssv-of = { $n } из { $total }

js-ssv-offset = смещение { $deg }°

js-ssv-open-failed = Не удалось открыть { $title }: { $reason }.

js-ssv-opening = Открывается { $title }…

js-ssv-outage-note = В минутах, за прогон. «Никогда» отмечает группу, у которой нигде на оболочке не было столько сигналов.

js-ssv-outage-title = Наибольшие перерывы на оболочке

js-ssv-phases-note = Статистика фильтра за прогон и за две его части. Средний NEES положения около 3 означает, что заявленная граница фильтра согласуется с его ошибкой.

js-ssv-phases-title = Ошибка положения по этапам

js-ssv-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

js-ssv-range-title = { $label }: мин. { $min }, среднее { $mean }, макс. { $max } { $unit }

js-ssv-range-value = от { $min } до { $max }

js-ssv-recorded = { $title }: записанный результат движка (версия { $version }).

js-ssv-relative-label = Ошибка относительного положения

js-ssv-result-not-json = результат не является JSON ({ $reason })

js-ssv-result-not-loaded = записанный результат не загрузился

js-ssv-row-acquires = Захват вплоть до

js-ssv-row-carrier = Сопровождение несущей вплоть до

js-ssv-row-code = Сопровождение кода вплоть до

js-ssv-row-coherent = Когерентное накопление

js-ssv-row-delay-mean = Задержка, среднее

js-ssv-row-detection = Порог обнаружения

js-ssv-row-false-alarm = Вероятность ложной тревоги на ячейку

js-ssv-row-final-error = Итоговая ошибка положения

js-ssv-row-gap = Наибольший разрыв

js-ssv-row-gated = Измерения, отброшенные по стробу

js-ssv-row-grazing = Касание ниже 100 km

js-ssv-row-limb-links = Линии через лимб

js-ssv-row-loss-mean = Потери, среднее

js-ssv-row-lost = Потеряно из-за атмосферы

js-ssv-row-pdop-median = PDOP, медиана

js-ssv-row-pdop-p95 = PDOP, 95-й перцентиль

js-ssv-row-pdop-worst = PDOP, наихудший

js-ssv-row-plasma-mean = Плазмосферный TEC, среднее

js-ssv-row-search-cells = Ячейки поиска

js-ssv-row-search-time = Время поиска

js-ssv-row-srp-est = Давление солнечного излучения, оценка

js-ssv-row-srp-truth = Давление солнечного излучения, истина

js-ssv-row-stec-mean = Наклонный TEC, среднее

js-ssv-row-tangent = Высота касания, от минимума до максимума

js-ssv-row-tracking = Использованный порог сопровождения

js-ssv-row-used = Использованные измерения

js-ssv-series-altitude = высота/1000

js-ssv-series-altitude-name = высота

js-ssv-series-best-cn0 = наилучшее C/N0

js-ssv-series-error = ошибка

js-ssv-series-measurements = измерения

js-ssv-series-note = Один прореженный ряд суммарного числа по всем орбитальным группировкам. Движок не записывает ряд по каждой группировке отдельно, поэтому он не рисуется.

js-ssv-series-signals = сигналов в зоне видимости

js-ssv-series-signals-label = Сигналы в зоне видимости во времени, { $band }

js-ssv-series-stated-bound = заявленная граница

js-ssv-series-title = Сигналы и наилучшее C/N0 вдоль орбиты, { $band }

js-ssv-shell-avail-note = Доля узлов сетки и моментов времени, где есть хотя бы один и хотя бы четыре сигнала выше { $cn0 } dB-Hz.

js-ssv-shell-avail-title = Доступность на оболочке, { $band }

js-ssv-tangent-value = от { $min } до { $max } km

js-ssv-th-above-absolute = Выше GNSS: по абсолютным, m

js-ssv-th-above-filter = Выше GNSS: фильтр, m

js-ssv-th-band-group = Диапазон и группа

js-ssv-th-bar = Порог

js-ssv-th-baseline = База, km

js-ssv-th-common-4 = Эпохи с 4 общими сигналами

js-ssv-th-common-mean = Среднее число общих сигналов

js-ssv-th-compares = Что сравнивается

js-ssv-th-deputy = Ведомый аппарат

js-ssv-th-epochs = Эпохи

js-ssv-th-group = Группа

js-ssv-th-main-lobe = Линии главного лепестка

js-ssv-th-nees = Средний NEES положения

js-ssv-th-phase = Этап

js-ssv-th-pos-p95 = Положение, 95-й перцентиль, m

js-ssv-th-pos-rms = Положение, RMS, m

js-ssv-th-quantity = Величина

js-ssv-th-rel-absolute = Относительный RMS, по абсолютным, m

js-ssv-th-rel-filter = Относительный RMS, фильтр, m

js-ssv-th-rel-vel = Относительный RMS скорости, m/s

js-ssv-th-run1-cells = Прогон 1: ячейки в пределах допуска

js-ssv-th-run1-verdict = Вердикт прогона 1

js-ssv-th-sidelobe = Линии бокового лепестка

js-ssv-th-sidelobe-share = Доля бокового лепестка

js-ssv-th-value = Значение

js-ssv-th-variant = Вариант (диагностический, опорные углы GLONASS из таблицы 4.2)

js-ssv-th-vel-rms = RMS скорости, m/s

js-ssv-th-with-4 = С 4 или более сигналами

js-ssv-th-without-1 = Наибольший промежуток без 1 сигнала

js-ssv-th-without-4 = Наибольший промежуток без 4 сигналов

js-ssv-title-formation-heo = Формация, сильно эллиптическая орбита

js-ssv-title-heo = Сильно эллиптическая орбита

js-ssv-title-lunar-weak = Лунный перелёт, приёмник слабых сигналов

js-ssv-title-nav-lunar = Бортовой фильтр, лунный перелёт

js-ssv-title-shell = Оболочка на 36 000 km

js-ssv-traj-avail-note = Доля эпох, где есть хотя бы один и хотя бы четыре сигнала выше { $cn0 } dB-Hz.

js-ssv-traj-avail-title = Доступность вдоль траектории, { $band }

js-ssv-transmit-pattern = Диаграмма передачи: { $pattern }

js-ssv-unit-signals = сигналов

js-ssv-unknown-mode = у этого результата gnss-ssv режим «{ $mode }», который эта страница не читает

js-ssv-variant-met = { $n } из { $total }, было бы выполнено

js-ssv-variant-not-met = { $n } из { $total }, всё ещё не выполнено

js-ssv-view-note = От наименьшего до наибольшего числа в зоне видимости по эпохам, среднее отмечено.

js-ssv-view-title = Сигналы в зоне видимости, { $band }

js-ssv-weak-note = Что нужно конструкции приёмника, как её вычисляет движок по заявленному накоплению.

js-ssv-weak-title = Приёмник слабых сигналов

js-ssv-x-minutes = минуты

js-ssv-y-altitude-measurements = высота, тысячи km; использованные измерения

js-ssv-y-cn0-altitude = dB-Hz; высота в тысячах km

js-ssv-y-position-log = положение, метры (лог.)

js-ssv-y-signals-all = сигналов в зоне видимости, все орбитальные группировки

js-t35data-ai-q-bench-export = Экспортировать движение и события сценария для лабораторного симулятора

js-t35data-ai-q-compliance-rows = Какие строки публичных рамок подкрепляют доказательствами эти прогоны?

js-t35data-ai-q-evidence-pack = Проверить или создать пакет доказательств события доверия

js-t35data-ai-q-interference-route = Где GNSS выглядел ухудшенным и какая часть этого маршрута в нём находится?

js-t35data-ai-q-iq-recordings = Записи GNSS IQ (сцена, захват, сопровождение, входной тракт, кампании)

js-t35data-ai-q-osnma-satellites = Данные навигации каких спутников Galileo аутентифицирует (OSNMA) этот поток приёмника?

js-t35data-ai-q-run-scenario = Запустить или объяснить сценарий PNT (орбиты, GNSS, синхронизация времени, объединение, Луна)

js-t35data-ai-q-training-nmea = Мне нужен синтетический NMEA с событием подавления, увода (drag-off), спуфинга времени или повтора для тренировки

js-t35data-ai-q-trustworthy-log = Заслуживал ли доверия этот журнал приёмника или NMEA этого судна и когда доверие пропало?

js-t35data-ai-tool-osnma-satellites = в MCP нет: используйте osnma_verify (карточка OSNMA здесь, WebAssembly), kshana osnma verify (CLI) или kshana.osnma_verify (Python)

js-t35data-card-evidence-create-title = Создать пакет доказательств

js-t35data-card-evidence-create-what = Подписывает окно журнала приёмника и то, что движок вычислил по нему, чтобы любой мог проверить, что после этого ничего не менялось. Studio проверяет пакеты.

js-t35data-card-evidence-create-why = Для подписи нужен закрытый ключ, который не следует пропускать через веб-страницу.

js-t35data-card-iq-title = Мониторы и инструменты GNSS IQ

js-t35data-card-iq-what = Построить сцену, захватывать и сопровождать сигналы, перебирать параметры, моделировать входной тракт, запускать мониторы IQ и кампании, подгонять лабораторный журнал. Доступно также из Python и, внутри одной рабочей папки, из инструментов ИИ-ассистента.

js-t35data-card-iq-why = Запись — это гигабайты отсчётов. Страница не может её вместить, а команды, которые преобразуют, извлекают и прореживают, перезаписывают записи на диске.

js-t35data-card-land-title = Загрузка полигонов суши для детектора AIS на суше

js-t35data-card-land-what = Загружает один закреплённый файл суши (Natural Earth, общественное достояние) и проверяет его SHA-256. Построитель карт принимает файл суши как текст.

js-t35data-card-land-why = Это единственная команда, которая открывает сетевое соединение, и ей нужны системный curl и явный флаг.

js-t35data-card-marine-title = Морские интеграции

js-t35data-card-marine-what = Плагин сервера Signal K и OpenCPN через NMEA в режиме gate по TCP выводят оценку доверия в программы, которыми яхтсмены уже пользуются; эталонная сборка выводит её на небольшой компьютер рядом с приёмником.

js-t35data-card-marine-why = Они потребляют работающий живой процесс и его шлюз TCP: это развёртывания на компьютере судна.

js-t35data-card-telemetry-title = Доверие как телеметрия безопасности

js-t35data-card-telemetry-what = Преобразует поток доверия (оценка, полоса, причины) в метрики Prometheus, события syslog в CEF или LEEF для SIEM и в OpenTelemetry. Он читает поток и никогда не меняет оценку.

js-t35data-card-telemetry-why = Это процесс, который отдаёт метрики и отправляет данные в ваши системы мониторинга, поэтому он работает рядом с приёмником, а не на странице.

js-t35data-card-training-stream-title = Тренировочные потоки на адрес TCP или UDP

js-t35data-card-training-stream-what = Отправляет сгенерированный тренировочный поток на симулятор мостика или картплоттер в реальном времени или быстрее. Страница тренировки в Studio генерирует тот же текст и позволяет его скачать.

js-t35data-card-training-stream-why = Отправка на сетевой адрес — это то, чего страница браузера не делает. Поток — только текст и никогда не предназначен для действующих навигационных систем судна.

js-t35data-feat-ai-ai = Варианты установки сервера MCP с вопросами, на которые отвечает каждый инструмент

js-t35data-feat-ai-name = Использование из ИИ-ассистента (сервер MCP)

js-t35data-feat-bench-bench = Экспортировать здесь движение, NMEA, путевые точки и события сценария

js-t35data-feat-bench-name = Экспорт test-bench для лабораторного симулятора

js-t35data-feat-compliance-compliance = Посмотрите здесь, какие строки рамок ваши прогоны подкрепляют доказательствами, и таблицы сопоставления

js-t35data-feat-compliance-name = Сопоставление compliance с публичными рамками устойчивости

js-t35data-feat-evidence-evidence = Проверить здесь пакет и приложить токен метки времени

js-t35data-feat-evidence-name = Подписанные пакеты доказательств

js-t35data-feat-evidence-why = Для создания пакета нужен закрытый ключ подписи, который не следует пропускать через веб-страницу. Пакеты создаются из командной строки, Python или инструментов ИИ-ассистента.

js-t35data-feat-interference-map-interference = Открыть файлы карт или построить здесь карту из CSV и проверить по ней маршрут

js-t35data-feat-interference-map-name = Карта помех (ADS-B и AIS) и подверженность маршрута

js-t35data-feat-iq-name = Мониторы и инструменты GNSS IQ (сцена, захват, сопровождение, перебор, входной тракт, монитор, кампании)

js-t35data-feat-iq-why = Запись — это гигабайты отсчётов, которые страница не может вместить, а некоторые команды перезаписывают записи на диске. В сборке для браузера нет функций IQ.

js-t35data-feat-jammertest-jammertest = Импортировать план для временного интервала журнала или оценить журнал приёмника (UBX, RINEX, Android, NMEA или Septentrio SBF) по каждому испытанию: задержка обнаружения, пропуски, ложные тревоги, время восстановления; MODELLED

js-t35data-feat-jammertest-name = Jammertest как арбитр: опубликованный план испытаний как расписание истины, журнал приёмника, оценённый по нему (0.38)

js-t35data-feat-live-gate-name = Живой поток доверия, шлюз и приёмник (stdin, файл, TCP, UDP, --gate, --listen)

js-t35data-feat-live-gate-why = Это работающий процесс на пути данных. Страница возвращается, когда завершается, и не может держать сокет открытым для картплоттера или помечать решение недействительным в живом потоке. Studio вместо этого оценивает ограниченный фрагмент в том же живом формате, без шлюза.

js-t35data-feat-machines-imufit = Подогнать параметры акселерометра и гироскопа гибридных сценариев и сценариев объединения по журналу неподвижной IMU; MODELLED

js-t35data-feat-machines-name = Входы приёмников и датчиков: RTKLIB .pos, NovAtel OEM7, RTCM 3 MSM, GNSS-SDR, IMU для курса и подгонка IMU для гибридных сценариев и сценариев объединения (0.38)

js-t35data-feat-machines-trust = Откройте журнал в любом из этих форматов (и необязательный файл IMU) в общем прогоне доверия к приёмнику; собственный флаг помехи NovAtel сравнивается с тревогами Kshana

js-t35data-feat-marine-name = Морские интеграции: плагин Signal K и OpenCPN

js-t35data-feat-marine-why = Они потребляют работающий живой процесс и его шлюз TCP, поэтому это развёртывания на компьютере судна, а не то, что может запустить страница.

js-t35data-feat-maritime-trust-name = Морская оценка доверия для движущегося судна (от 0 до 100, с причинами)

js-t35data-feat-maritime-trust-trust = Откройте результат или живой прогон JSON-lines и посмотрите трассу, оценку, причины и шлюз; оцените здесь журнал NMEA

js-t35data-feat-nmea-training-name = Тренировочные потоки NMEA с журналом инструктора

js-t35data-feat-nmea-training-training = Создайте здесь поток и его журнал инструктора, скачайте их и проведите разбор тренировки

js-t35data-feat-osnma-name = Проверка Galileo OSNMA (вход UBX SFRBX)

js-t35data-feat-osnma-osnma = Загрузите записанный файл и посмотрите статус аутентификации по каждому спутнику и каждому тегу

js-t35data-feat-telemetry-name = Экспорт телеметрии: метрики Prometheus, syslog CEF и LEEF, OpenTelemetry

js-t35data-feat-telemetry-why = Он отдаёт метрики, отправляет syslog и экспортирует OpenTelemetry из работающего потока: это процесс, который общается с вашими системами мониторинга, а страница им быть не может.

js-t35data-feat-training-stream-name = Потоковая отправка тренировочного потока на адрес TCP или UDP

js-t35data-feat-training-stream-why = Он отправляет данные на сетевой адрес, чего веб-страница не делает. Studio генерирует текст, а вы его скачиваете.

js-t35data-page-ai = Использование из вашего ИИ-ассистента

js-t35data-page-bench = Экспорт test-bench

js-t35data-page-cli = Возможности командной строки

js-t35data-page-compliance = Сопоставление compliance

js-t35data-page-evidence = Пакеты доказательств

js-t35data-page-geometry = Геометрия: скайплот, скайлайн и DOP

js-t35data-page-imufit = Подгонка IMU

js-t35data-page-interference = Карта помех

js-t35data-page-jammertest = Оценка Jammertest

js-t35data-page-osnma = Проверка OSNMA

js-t35data-page-training = Разбор тренировки

js-t35data-page-trust = Морское доверие

js-t35data-sample-iq-help = Список команд IQ

js-t35data-sample-telemetry-cef = Syslog в CEF для демонстрационного прогона

js-t35data-sample-telemetry-leef = Syslog в LEEF для демонстрационного прогона

js-t35data-sample-telemetry-metrics = Метрики Prometheus для демонстрационного прогона

js-tools-ai-group-engine = Установить движок и его библиотеки

js-tools-ai-group-integrations = Морские интеграции, плагины и панели мониторинга

js-tools-ai-group-mcp = Установить сервер MCP для вашего ассистента

js-tools-ai-heading = Использование Kshana из вашего ИИ-ассистента

js-tools-ai-install-mcp = Установить сервер MCP

js-tools-ai-intro = Сервер MCP Kshana позволяет ИИ-ассистенту запускать движок, а не угадывать числа. Он работает на вашем компьютере; в Kshana ничего не отправляется. Выберите способ, подходящий для вашего инструмента.

js-tools-ai-load-failed = Не удалось загрузить варианты установки ({ $reason }). См. документацию по серверу MCP.

js-tools-ai-mcp-docs = Документация по серверу MCP

js-tools-ai-more-ways = Другие способы установки

js-tools-ai-none-listed = В этой сборке нет перечня вариантов установки.

js-tools-ai-other-ways = Другие способы установить Kshana

js-tools-ai-read-agent-guide = Прочитать руководство для агента

js-tools-ai-rule = Правило для каждого ответа: ассистент запускает движок и сообщает то, что вернул инструмент, с единицей измерения и уровнем доказательств (проверено по внешнему оракулу или смоделировано), сценарием, начальным значением (seed) и версией движка, чтобы прогон можно было повторить. Собственные оговорки результата остаются при нём. Сервер MCP не читает и не записывает файлы вне одной папки, включаемой по желанию.

js-tools-ai-what-to-ask = О чём спрашивать и какой инструмент отвечает

js-tools-ai-where-reachable = Где доступна каждая возможность

js-tools-bench-files-written = Записано файлов в память вашего браузера: { $n }

js-tools-bench-note = Только движение и размеченные интервалы событий. Скачайте их, чтобы загрузить в лабораторный симулятор.

js-tools-bench-wrong-kind = { $name } — сценарий вида { $kind }. Траектория аппарата есть для видов { $kinds }; другие виды указывают, почему её нет.

js-tools-building-report = Строится отчёт…

js-tools-choose-catalogue-first = Сначала выберите JSON каталога.

js-tools-choose-file-first = Сначала выберите файл.

js-tools-choose-imu-log = Сначала выберите журнал неподвижной IMU.

js-tools-choose-pack-first = Сначала выберите файлы пакета.

js-tools-choose-pack-first-above = Сначала выберите файлы пакета (выше).

js-tools-choose-plan-file = Выберите хотя бы один файл плана.

js-tools-choose-receiver-log = Сначала выберите журнал приёмника.

js-tools-choose-result-first = Сначала выберите хотя бы один файл результата (*.result.json).

js-tools-choose-scenario-first = Сначала выберите сценарий.

js-tools-choose-tsr-first = Сначала выберите ответ с меткой времени (.tsr).

js-tools-chosen = Выбрано

js-tools-col-check = Проверка

js-tools-col-detail = Подробности

js-tools-col-first-monitors = Первые мониторы

js-tools-col-gap-that-stays = Остающийся разрыв

js-tools-col-last-auth-tag = Последний аутентифицированный тег (системное время Galileo)

js-tools-col-latency = Задержка, s

js-tools-col-name = Название

js-tools-col-outcome = Исход

js-tools-col-question = Вопрос

js-tools-col-recovered = Восстановлено

js-tools-col-reference = Эталон

js-tools-col-result = Результат

js-tools-col-row = Строка

js-tools-col-satellite = Спутник

js-tools-col-slot = Слот, s

js-tools-col-status = Статус

js-tools-col-tags = Теги

js-tools-col-test = Испытание

js-tools-col-these-runs = Эти прогоны

js-tools-col-tool = Инструмент

js-tools-col-what-is-missing = Чего не хватает

js-tools-col-what-it-asks = О чём спрашивает

js-tools-col-why-not-auth = Почему не аутентифицировано

js-tools-copied = Скопировано

js-tools-copy = Копировать

js-tools-copy-command-aria = Копировать: { $cmd }

js-tools-copy-labelled-aria = Копировать { $label }: { $text }

js-tools-did-not-work = Не получилось

js-tools-documentation = Документация

js-tools-download = Скачать

js-tools-download-all-zip = Скачать всё (zip)

js-tools-download-events-toml = Скачать события (TOML)

js-tools-download-md = Скачать (Markdown)

js-tools-download-report-json = Скачать отчёт (JSON)

js-tools-download-report-md = Скачать отчёт (Markdown)

js-tools-download-scorecard-json = Скачать оценочную карту (JSON)

js-tools-download-table-toml = Скачать таблицу (TOML)

js-tools-download-updated-pack = Скачать обновлённый пакет (zip)

js-tools-download-whole-report-json = Скачать весь отчёт (JSON)

js-tools-engine-lacks-error = В этой сборке движка (версия { $version }) нет { $need }, поэтому запустить это здесь пока нельзя. Записанные результаты и командная строка по-прежнему работают.

js-tools-engine-lacks-status = В этой сборке движка (версия { $version }) нет { $need }: она старше версии, которая нужна этому инструменту. Эквивалент для командной строки есть на вкладке «Командная строка».

js-tools-engine-running = Движок (версия { $version }) работает в этом браузере. Ничего не загружается.

js-tools-engine-starting = Движок запускается в этом браузере…

js-tools-engine-unavailable = Движок не удалось запустить здесь ({ $reason }). Открытие файлов работает; для запуска инструментов нужен WebAssembly.

js-tools-epoch-format = Используйте YYYY-MM-DDTHH:MM:SS с необязательной Z (UTC).

js-tools-epoch-not-real = Это не реальный момент UTC между 2000 и 2099 годами.

js-tools-every-check = Каждая проверка

js-tools-evidence-disclaimer = Пакет доказательств — это техническая запись того, что движок вычислил по указанному журналу при указанных настройках. Это не юридическое заключение, не установление фактов о каком-либо событии и не сертификация. Успешная проверка означает, что запись не изменена.

js-tools-example-pack = Синтетический пример пакета

js-tools-example-pack-note = Синтетический пакет, созданный командной строкой движка из демонстрационного журнала парома с демонстрационным ключом. Ключ подставлен ниже; ключ настоящего подписанта поступает от подписанта другим путём.

js-tools-example-pack-tampered = Пример пакета с одним изменённым байтом в epochs.json

js-tools-example-runs = Синтетические примеры прогонов

js-tools-example-tampered-note = Один байт файла в пакете изменён после подписания. Проверьте его: проверка назовёт файл.

js-tools-exporting = Экспорт…

js-tools-field-whole-number = { $field }: нужно целое число

js-tools-file-not-chosen = { $file } нет среди выбранных файлов

js-tools-file-too-large = { $name } больше 64 MiB

js-tools-files-selected = { $label }: { $files }

js-tools-fingerprint-not-pinned = Отпечаток подписанта: { $fingerprint } (не закреплён: ключ, который пакет называет сам)

js-tools-fingerprint-pinned = Отпечаток подписанта: { $fingerprint } (закреплён)

js-tools-fitting = Подгонка…

js-tools-framework-summary = { $name }: подкреплено доказательствами — { $evidenced }, частично — { $partly }, не подкреплено — { $notEvidenced }, вне области — { $outOfScope }

js-tools-fw-dhs-rpcf = US DHS Resilient PNT Conformance Framework, v2.0

js-tools-fw-easa-aviation = Руководство EASA по помехам GNSS для авиации

js-tools-fw-en-16803 = EN 16803 (только по номеру части и пункта)

js-tools-fw-imo-ships = Руководство IMO по помехам GNSS для судов

js-tools-fw-nis2-art21 = Директива ЕС NIS2, статья 21

js-tools-gst-none = нет

js-tools-gst-text = неделя { $week }, { $tow } s

js-tools-how-to-run = Как запустить

js-tools-imu-file-too-large = { $name } больше 32 MiB; откройте фрагмент.

js-tools-imu-mean-not-number = Удельная сила в покое не является числом (0 для горизонтальной оси, около 9.80665 для вертикальной).

js-tools-imu-notice = { $evidence }: оценщик проверен на синтетических журналах белого шума с известными коэффициентами, а не по внешнему оракулу. Таблица называет SHA-256 журнала ({ $sha }…).

js-tools-imu-selected = { $name } ({ $size }), прочитан здесь, никогда не загружается.

js-tools-jt-events-count = Запланированных событий: { $n }

js-tools-jt-events-note = как расписание истины: плановые слоты, а не записанное время в эфире. Не РЧ: { $nonRf }; вне журнала: { $outside }; неизвестные идентификаторы: { $unknown }.

js-tools-jt-guard-hold = Защитный интервал { $guard } s, удержание восстановления { $hold } s.

js-tools-jt-guard-hold-overlap = Защитный интервал { $guard } s, удержание восстановления { $hold } s. Базовый уровень калибровки пересёкся с запланированным слотом.

js-tools-jt-import-needs-start = Для импорта нужна первая эпоха журнала в UTC (ISO 8601), потому что план задан в местном времени.

js-tools-jt-sel-catalogue = каталог { $name }

js-tools-jt-sel-log = журнал { $name } ({ $size })

js-tools-jt-sel-no-catalogue = нет каталога

js-tools-jt-sel-no-log = нет журнала

js-tools-jt-sel-no-plan = нет плана

js-tools-jt-sel-plans = Файлов плана: { $n }

js-tools-jt-slot-range = от { $from } до { $to }

js-tools-jt-what-area = Область испытаний

js-tools-jt-what-guard = Защитный интервал

js-tools-jt-what-hold = Удержание восстановления

js-tools-jt-what-offset = Смещение от UTC

js-tools-jt-what-year = Год плана

js-tools-label-command = команда

js-tools-label-pinned-command = закреплённая команда

js-tools-label-settings-example = пример настроек { $n }

js-tools-loading = Загрузка…

js-tools-max-runs = Не более { $max } прогонов.

js-tools-merkle-root-format = Корень Меркла — 64 шестнадцатеричные цифры.

js-tools-must-be-number = { $what }: нужно число

js-tools-must-be-whole-zero = { $what }: нужно целое число, 0 означает «не задано»

js-tools-na = н/д

js-tools-needs = Нужно: { $requires }

js-tools-no = нет

js-tools-none = нет

js-tools-none-in-build = в этой сборке нет

js-tools-not-in-browser = Не в браузере.

js-tools-not-osnma = Не результат OSNMA

js-tools-not-used = Не использовано: { $item }

js-tools-notes = Примечания

js-tools-open = Открыть

js-tools-osnma-advisory = Носит консультативный характер: это результат анализа и мониторинга, а не навигационное оборудование с утверждённым типом. Сообщаемый здесь статус аутентификации не является службой целостности навигации и не должен служить единственным основанием для какого-либо решения по навигации или безопасности.

js-tools-osnma-authenticated = Аутентифицировано

js-tools-osnma-caption = Статус аутентификации по каждому спутнику

js-tools-osnma-demo-note = Одноразовый открытый ключ подставлен; нажмите «Проверить», чтобы запустить проверяющий модуль здесь, или покажите записанный результат.

js-tools-osnma-discarded = Отброшено

js-tools-osnma-events = Что увидел проверяющий модуль

js-tools-osnma-examples-missing = синтетических примеров в этой сборке пока нет

js-tools-osnma-failed = Ошибка

js-tools-osnma-nma-alert = Статус NMA { $status }; система выдала сообщение-предупреждение.

js-tools-osnma-nma-status = Статус NMA { $status }.

js-tools-osnma-not-json = Это не JSON команды kshana osnma verify --json (нужны overall и satellites).

js-tools-osnma-overall = Итог: { $status }

js-tools-osnma-pages-read = Прочитано страниц: { $n }.

js-tools-osnma-pending = Ожидает

js-tools-osnma-recorded-failed = записанный результат не загрузился

js-tools-osnma-recorded-result = Записанный результат kshana osnma verify --json для { $file }.

js-tools-osnma-tag-counts = аутентифицировано { $authenticated }, ошибок { $failed }, ожидает { $pending }, отброшено { $discarded }

js-tools-osnma-tag-totals = Тегов: { $n } — аутентифицировано { $authenticated }, ошибок { $failed }, ожидает { $pending }, отброшено { $discarded }.

js-tools-osnma-time-caveat = Время: каждая проверка относится к меткам времени страниц, переданных проверяющему модулю; здесь они берутся из самих данных и не защищают от повторного воспроизведения старых данных. Аутентификация говорит, что данные пришли от системы; она ничего не говорит о сигнале, по которому они пришли, и о качестве решения.

js-tools-osnma-unavailable = Недоступно

js-tools-osnma-word-authenticated = Хотя бы один спутник аутентифицирован, и ни у одного нет ошибки

js-tools-osnma-word-failed = Проверка данных какого-либо спутника не пройдена

js-tools-osnma-word-unavailable = Ни один спутник не аутентифицирован

js-tools-pack-selected = { $label }: { $files } ({ $size })

js-tools-pinned-to-release = Закреплено за этим выпуском:

js-tools-preview = Предпросмотр

js-tools-public-key-format = Открытый ключ — 64 шестнадцатеричные цифры (32 байта). Ничего другого не принимается.

js-tools-read-documentation = Прочитать документацию

js-tools-reading-plan = Читается план…

js-tools-refused-file-name = имя файла отклонено: { $name }

js-tools-run = Запустить

js-tools-runs-read = Прочитано прогонов — { $n }: { $runs }

js-tools-runs-read-engine = Прочитано прогонов — { $n }, движком { $engine }: { $runs }

js-tools-sample-load-failed = Не удалось загрузить образец ({ $reason }).

js-tools-sample-note = Настоящий вывод команды, записанный с движка на синтетическом демонстрационном прогоне. Не является измерением чего-либо.

js-tools-sample-output = Образец вывода: { $label }

js-tools-scenario-list-failed = Не удалось загрузить список сценариев

js-tools-scoring = Оценка…

js-tools-select-and-copy = Выделить и скопировать

js-tools-settings-example = Пример настроек { $n }:

js-tools-status-evidenced-label = Прогоны подкрепляют доказательствами эту строку

js-tools-status-evidenced-short = Подкреплено

js-tools-status-not-evidenced-label = Эти прогоны ничего не показывают по этой строке

js-tools-status-not-evidenced-short = Не подкреплено

js-tools-status-out-of-scope-label = Вне того, что может показать Kshana

js-tools-status-out-of-scope-short = Вне области

js-tools-status-partly-label = Прогоны подкрепляют доказательствами часть этой строки

js-tools-status-partly-short = Частично

js-tools-tab-ai = ИИ-ассистент

js-tools-tab-bench = Test-bench

js-tools-tab-cli = Командная строка

js-tools-tab-compliance = Compliance

js-tools-tab-evidence = Пакеты доказательств

js-tools-tab-imufit = Подгонка IMU

js-tools-tab-jammertest = Jammertest

js-tools-tab-osnma = OSNMA

js-tools-tele-all-events = Одно событие syslog на эпоху (по умолчанию: одно на смену полосы)

js-tools-tele-file-aria = Результат или файл JSON-lines

js-tools-tele-fmt-cef = Syslog, CEF

js-tools-tele-fmt-leef = Syslog, LEEF

js-tools-tele-fmt-mqtt = MQTT, обнаружение Home Assistant (тема, табуляция, полезная нагрузка)

js-tools-tele-fmt-otlp = OpenTelemetry (OTLP JSON)

js-tools-tele-fmt-prometheus = Метрики Prometheus

js-tools-tele-format-aria = Формат

js-tools-tele-host = Узел

js-tools-tele-host-aria = Имя узла, записываемое в события syslog

js-tools-tele-include-position = Включить сообщённое положение (по умолчанию выключено)

js-tools-tele-intro = Преобразуйте файл результата (session.result.json) или живые строки JSON в один из форматов, прямо в этом браузере. Нужна сборка движка с экспортом телеметрии (0.35 и позже, с экспортом); команды выше работают везде.

js-tools-tele-note = Строки syslog здесь не несут метки времени (страница не читает часы); их проставляет инструмент командной строки. Prometheus даёт итоговое состояние. MQTT даёт одну строку на сообщение: тема, затем табуляция, затем полезная нагрузка; отсюда ничего не публикуется. Текст тот же, что печатает команда.

js-tools-tele-run-here = Запустить здесь

js-tools-that-file-too-large = Этот файл больше 64 MiB.

js-tools-token-attached = Токен приложен

js-tools-token-attached-note = Обновлённый пакет ниже. Подпись службы меток времени здесь НЕ проверена: выполните openssl ts -verify.

js-tools-trust-monitor-sentence = Формулировка монитора доверия: { $sentence }

js-tools-two-files-same-name = два файла называются { $name }

js-tools-ubx-bad-crc = Страниц, не прошедших проверку CRC: { $n }.

js-tools-ubx-file = Файл UBX

js-tools-ubx-frames-pages = Кадров UBX: { $frames }; декодировано страниц I/NAV: { $pages }.

js-tools-ubx-ignored-sfrbx = Проигнорировано сообщений SFRBX: { $n } (другие системы, E5b, предупреждения, неверные контрольные суммы).

js-tools-ubx-skipped-bytes = Пропущено байтов между кадрами: { $n }.

js-tools-ubx-time-conflicts = Страниц со временем, противоречащим соседним: { $n }.

js-tools-ubx-unstamped = Страниц, которые не удалось привязать ко времени: { $n }.

js-tools-unknown = неизвестно

js-tools-unused-scenarios = Файлы сценариев без подходящего результата не использовались: { $files }.

js-tools-verdict-failed-text = Проверка не пройдена.

js-tools-verdict-failed-title = Не пройдена

js-tools-verdict-intact-text = Пакет не изменён относительно ключа, который он называет сам и который может создать кто угодно. Получите открытый ключ подписанта от самого подписанта другим путём и закрепите его.

js-tools-verdict-intact-title = Целостен, но подписант не закреплён

js-tools-verdict-verified-text = Пакет не изменён и подписан ключом, который вы закрепили.

js-tools-verdict-verified-title = Проверено

js-tools-verifying = Проверка…

js-tools-what-failed = Что не пройдено

js-tools-why-not-browser = Почему не в браузере:

js-tools-yes = да

js-training-active-events = Действующие события

js-training-band-large = более 100 m

js-training-band-medium = от 25 до 100 m

js-training-band-small = менее 25 m

js-training-chart-max = макс. { $v }

js-training-chart-mean-cn0 = среднее C/N0

js-training-chart-position-error = ошибка положения

js-training-chart-s-reported-minus-true = s, сообщённое минус истинное

js-training-chart-satellites = спутники

js-training-chart-time-offset = смещение времени

js-training-chart-used-tracked = использовано / сопровождается

js-training-col-reported = Сообщено приёмником

js-training-col-true = Истинное

js-training-cue-course = Курс по гироскопу и скорость по лагу не затрагиваются ни одним событием. Здесь сообщённый путевой угол отличается от курса по гироскопу на { $course }. Течение тоже разводит курс и путевой угол, поэтому сравнивайте с началом прогона.

js-training-cue-course-speed = Курс по гироскопу и скорость по лагу не затрагиваются ни одним событием. Здесь сообщённый путевой угол отличается от курса по гироскопу на { $course }, а сообщённая скорость от истинной — на { $speed } kn. Течение тоже разводит курс и путевой угол, поэтому сравнивайте с началом прогона.

js-training-cue-title = Подсказка для разбора.

js-training-cue-unknown-amount = неизвестную величину

js-training-debrief-now = Провести разбор сейчас

js-training-default-warning = Синтетические тренировочные данные. Только для тренировки и испытаний: никогда не подавайте этот поток в действующие навигационные системы судна.

js-training-demo-coastal-drag-off = Прибрежный увод (drag-off)

js-training-demo-combined-event = Комбинированное событие

js-training-demo-fjord-degradation = Естественное ухудшение в фьорде

js-training-demo-open-sea-jamming = Подавление в открытом море

js-training-demo-port-time-spoof = Спуфинг времени при подходе к порту

js-training-dl-log-json = Скачать журнал инструктора (JSON)

js-training-dl-log-text = Скачать журнал инструктора (текст)

js-training-dl-nmea = Скачать поток NMEA

js-training-err-demo-open = Не удалось открыть { $title }: { $reason }.

js-training-err-engine-old = В этой сборке движка (версия { $version }) нет генератора тренировочных данных NMEA; она старше этой страницы. Команда: { $command }.

js-training-err-engine-start = Движок не удалось запустить здесь ({ $reason }). Сценарии библиотеки выше по-прежнему открываются без него.

js-training-err-file-not-loaded = файл не загрузился

js-training-err-generate = Не удалось сгенерировать: { $reason }.

js-training-err-newer-schema = { $name }: схема { $schema } новее или отличается от { $supported }, которую читает эта страница. Обновите Studio, а не гадайте о её полях.

js-training-err-no-schema = { $name }: это не журнал инструктора тренировки Kshana (нет тега схемы).

js-training-err-no-track = { $name }: в журнале нет строк трассы для рисования.

js-training-err-no-usable-rows = { $name }: нет пригодных строк трассы.

js-training-err-not-json = { $name }: не JSON ({ $reason }).

js-training-err-read = { $name }: не удалось прочитать ({ $reason }).

js-training-err-read-or-draw = { $name }: не удалось прочитать или нарисовать ({ $reason }).

js-training-err-scenario-not-loaded = файл сценария не загрузился

js-training-err-seed = Начальное значение (seed) должно быть целым числом или пустым, чтобы использовалось значение самого сценария.

js-training-err-too-large = { $name }: больше { $max }. Эта страница читает журналы не больше этого размера.

js-training-err-too-many-rows = { $name }: в журнале строк трассы — { $count }; эта страница рисует не более { $max }. Записывайте реже (log_interval_s) или откройте фрагмент.

js-training-err-unknown-schema = { $name }: неизвестная схема { $schema }; эта страница читает { $supported }.

js-training-event-n = Событие { $id }

js-training-event-onset = Начало { $utc }

js-training-extra-bearing = Пеленг как применён, deg истинных

js-training-extra-peak-accel = Пиковое ускорение, добавляемое уводом, m/s²

js-training-extra-peak-speed = Пиковая скорость, добавляемая уводом, m/s

js-training-fact-duration = Длительность

js-training-fact-events = Внесённые события

js-training-fact-max-error = Наибольшая ошибка положения

js-training-fact-max-time-offset = Наибольшее смещение времени

js-training-fact-no-fix = Время без решения

js-training-fact-peak-accel = Пиковое ускорение, истинное / сообщённое

js-training-fact-peak-speed = Пиковая скорость, истинная / сообщённая

js-training-fact-seed = Начальное значение (seed)

js-training-fact-start = Начало (UTC)

js-training-fix-reported-span = решение выдано, с { $from } по { $to }

js-training-generated = Создано «{ $title }» движком { $version }: предложений NMEA — { $lines }. Синтетические данные: только для тренировки и испытаний; никогда не подавайте их в действующие навигационные системы судна.

js-training-generated-here = Создано здесь движком («{ $title }»). Синтетические данные: выдуманные положения и даты.

js-training-generating = Запуск движка и генерация…

js-training-kind-drag-off = Увод положения (drag-off)

js-training-kind-jamming = Подавление (jamming)

js-training-kind-natural-degradation = Естественное ухудшение (закрытое небо)

js-training-kind-replay-delay = Задержка повтора

js-training-kind-time-spoof = Спуфинг времени

js-training-legend-no-fix = Нет решения: приёмник ничего не сообщил

js-training-legend-reported = Сообщено, { $band } от истинного

js-training-legend-true = Истинная трасса

js-training-library-label = Синтетический сценарий библиотеки «{ $title }», записанный командой { $command }. Выдуманные положения и даты; ни реального судна, ни реальной записи.

js-training-log-row = Строка журнала { $row } из { $total }, { $utc }

js-training-max-error-at = { $m } m при T+{ $s } s

js-training-moment-event = (событие { $id })

js-training-moment-title = T+{ $s } s { $what }: { $text }

js-training-moments-shown = Показано моментов: { $shown } из { $total } (первые).

js-training-no-events = Нет: это чистый прогон.

js-training-no-fix-nothing = нет решения: ничего не сообщено

js-training-no-fix-span = нет решения, с { $from } по { $to }

js-training-no-moments = Моменты не записаны.

js-training-none = нет

js-training-none-now = В этот момент нет.

js-training-none-reported = не сообщено

js-training-north = С

js-training-not-touched = не затронуто ни одним событием

js-training-opened = Открыт { $name }: строк журнала — { $rows }, за { $secs } s.

js-training-opening = Открывается { $title }…

js-training-param-affect-time = Влияет на время

js-training-param-bearing-deg = Пеленг, deg истинных

js-training-param-cn0-drop-db = Падение C/N0, dB

js-training-param-counterfeit-cn0-dbhz = Поддельное C/N0, dB-Hz

js-training-param-delay-s = Задержка, s

js-training-param-duration-s = Длительность, s

js-training-param-final-offset-m = Итоговое смещение, m

js-training-param-kind = Вид

js-training-param-label = Метка

js-training-param-offset-s = Смещение времени, s

js-training-param-ramp-s = Нарастание в начале, s

js-training-param-recovery-s = Нарастание при восстановлении, s

js-training-param-relative-bearing-deg = Пеленг относительно путевого угла, deg

js-training-param-skyline = Линия горизонта

js-training-param-spread-db = Разброс по спутникам, dB

js-training-param-start-s = Начало, s

js-training-pause = Пауза

js-training-play = Воспроизвести

js-training-reading = Читается…

js-training-readout-fix = решение

js-training-readout-no-fix = нет решения

js-training-reduced-motion = Предпочтительно уменьшение анимации, поэтому повтор начинается с 1x. Используйте ползунок или клавиши со стрелками, чтобы перемещаться без анимации.

js-training-row-cn0 = Среднее C/N0, dB-Hz

js-training-row-cog = Путевой угол, deg

js-training-row-error = Ошибка положения, m

js-training-row-fix = решение

js-training-row-heading = Курс (гироскоп), deg

js-training-row-moments = моменты

js-training-row-position = Положение

js-training-row-sats = Спутников использовано / сопровождается

js-training-row-sog = Скорость относительно грунта, kn

js-training-row-time-offset = Смещение времени, s

js-training-say-active = действует: { $list }

js-training-say-event-id = событие { $id }

js-training-say-fix = приёмник выдаёт решение

js-training-say-mean-cn0 = среднее C/N0 { $cn0 } dB-Hz

js-training-say-no-fix = нет решения

js-training-say-position-from-true = сообщённое положение отличается от истинного на { $m } m

js-training-say-sats-used = используется спутников: { $used } из { $tracked }

js-training-say-time-ahead = сообщённое время опережает истинное на { $s } s

js-training-say-time-behind = сообщённое время отстаёт от истинного на { $s } s

js-training-sky-no-gsv = нет GSV

js-training-sky-none = Для этого журнала неба нет: в одном журнале инструктора спутников нет. Откройте сценарий библиотеки или сгенерируйте здесь поток и проведите его разбор, чтобы увидеть спутники из его GSV.

js-training-skyline-preset = набор { $name }

js-training-skyline-stated = заданный профиль

js-training-span-no-fix = от T+{ $from } до { $to } s

js-training-track-desc = Истинная трасса и сообщённая трасса, север вверху. Наибольшая ошибка положения { $error }. Периодов без решения: { $periods }.

js-training-track-end = конец

js-training-track-start = начало

js-training-trainer-note = Примечание инструктора

js-training-warn-no-warning-text = В этом файле нет текста предупреждения. Это журнал тренировки: не подавайте его поток в действующую навигацию.

js-training-warn-rows-skipped = Строк трассы, оказавшихся недействительными и пропущенных: { $count }.

js-training-what-fix-lost = Решение потеряно

js-training-what-fix-regained = Решение восстановлено

js-training-what-full-effect = Полный эффект

js-training-what-onset = Начало

js-training-what-recovered = Восстановлено

js-training-what-recovery-begins = Начало восстановления

js-trust-adv-carried = Консультативное заявление в этом файле:

js-trust-adv-none = В этом файле нет консультативного заявления

js-trust-adv-none-rest = (в более старых выходных данных его нет). Консультативное заявление вверху этой страницы действует в любом случае.

js-trust-agree-both = флаг у обоих: собственный флаг приёмника и монитор Kshana

js-trust-agree-calibrating = внутри окна калибровки: не сравнивается

js-trust-agree-kshana-only = тревога только у Kshana: приёмник не отмечает

js-trust-agree-neither = флага нет ни у кого

js-trust-agree-receiver-only = флаг только у приёмника: ни один монитор Kshana не подаёт тревогу

js-trust-assessed = { $name } оценён движком { $version } в этом браузере.

js-trust-assessed-as = { $name } оценён как { $format } движком в этом браузере. Ничего не загружалось.

js-trust-assessing = Запуск движка и оценка…

js-trust-class-also-costing = { $class } (также снижает баллы)

js-trust-class-environment = среда: сигнал (мощность, подавление, потеря спутников при открытом небе)

js-trust-class-geometry = геометрия: небо, а не сигнал

js-trust-class-inconsistency = несогласованность: похоже на атаку, не объясняется ни небом, ни сигналом

js-trust-dl-result-json = Скачать результат (JSON)

js-trust-dl-table-csv = Скачать таблицу по эпохам (CSV)

js-trust-edge-degraded = { $v } ухудшено

js-trust-edge-nominal = { $v } номинально

js-trust-err-assess = { $name }: не удалось оценить ({ $reason }).

js-trust-err-demo-files = демонстрационные файлы не загрузились

js-trust-err-demo-log-open = Не удалось открыть демонстрационный журнал: { $reason }.

js-trust-err-demo-open = Не удалось открыть демонстрацию: { $reason }.

js-trust-err-engine-no-receiver-trust = В этой сборке движка (версия { $version }) нет receiver_trust.

js-trust-err-engine-no-scorer = В этой сборке движка (версия { $version }) нет средства оценки журналов; она старше этой страницы. Команда: { $command }.

js-trust-err-engine-start = Движок не удалось запустить здесь ({ $reason }).

js-trust-err-engine-start-open = Движок не удалось запустить здесь ({ $reason }). Открытие файлов результатов выше по-прежнему работает.

js-trust-err-example-files = файлы примера не загрузились

js-trust-err-example-open = Не удалось открыть пример: { $reason }.

js-trust-err-file-2mib = { $name }: больше 2 MiB. Откройте фрагмент.

js-trust-err-file-too-large = { $name }: больше { $max }. Эта страница читает файлы не больше этого размера; откройте фрагмент.

js-trust-err-gen-too-large = { $name }: больше 2 MiB. Откройте фрагмент (инструмент командной строки принимает журнал целиком).

js-trust-err-imu-format = «{ $format }» — не формат IMU, который читает эта страница (csv или euroc)

js-trust-err-imu-heading = курс IMU в первом отсчёте не является числом

js-trust-err-log-format = «{ $format }» — не формат журнала, который эта страница может отправить движку

js-trust-err-no-epochs = В файле нет эпох.

js-trust-err-no-epochs-result = В этом файле результата нет epochs[]. Он должен быть получен командой `{ $command }` для сессии судна.

js-trust-err-no-epochs-returned = { $name }: движок не вернул эпох.

js-trust-err-no-score-model = В этом результате нет score_model, поэтому это прогон неподвижной платформы без оценки доверия. Представление рисует прогоны судов (движущихся платформ).

js-trust-err-not-readable = { $name }: не файл, который читает это представление (JSON результата, JSON lines, trust.csv, журнал NMEA или файл истины).

js-trust-err-nothing-to-draw = Нечего рисовать: выберите JSON результата, JSON lines или trust.csv.

js-trust-err-read = { $name }: не удалось прочитать ({ $reason }).

js-trust-err-read-or-draw = { $name }: не удалось прочитать или нарисовать ({ $reason }).

js-trust-err-score = { $name }: не удалось оценить ({ $reason }).

js-trust-err-score-file-too-large = { $name }: больше 2 MiB. Оценщик в браузере принимает фрагмент, содержащий пятиминутное окно калибровки.

js-trust-err-score-too-large = { $name }: больше 2 MiB. Оценщик в браузере принимает фрагмент (команда { $command } принимает журнал целиком); откройте фрагмент, содержащий пятиминутное окно калибровки.

js-trust-err-scorecard-too-large = { $name }: больше 8 MiB; эта страница читает оценочную карту не больше этого размера.

js-trust-err-session-empty = Параметры сессии пусты. Они объявляют судно ({ $setting }).

js-trust-err-too-many-epochs = В файле эпох: { $count }; эта страница рисует не более { $max }. Откройте фрагмент.

js-trust-err-triple-quote = { $what } содержит три одинарные кавычки подряд, которые нельзя встроить в параметры

js-trust-err-what-file = файл

js-trust-err-what-imu = файл IMU

js-trust-event-label = событие: { $label }

js-trust-event-onset = начало

js-trust-evt-col-first-alarm = Первая тревога, s

js-trust-evt-col-latency = Задержка, s

js-trust-evt-col-onset = Начало, s

js-trust-evt-col-outcome = Исход

js-trust-evt-col-stated = Заявленное событие

js-trust-fmt-android = Android GNSS Logger (текст)

js-trust-fmt-gnss-sdr = JSON lines, ретранслированные GNSS-SDR (текст)

js-trust-fmt-nmea = NMEA 0183 (текст)

js-trust-fmt-novatel = NovAtel OEM7 (ASCII или двоичный)

js-trust-fmt-rinex = Наблюдения RINEX (текст)

js-trust-fmt-rtcm3 = RTCM 3 MSM4 / MSM7 (двоичный)

js-trust-fmt-rtklib-pos = Решение RTKLIB .pos (текст)

js-trust-fmt-sbf = Septentrio SBF (двоичный)

js-trust-fmt-ubx = u-blox UBX (двоичный)

js-trust-gate-note-derived = В этом прогоне нет записи шлюза. Полоса показывает, где шлюз задержал бы решение: эпохи в полосе «нет доверия», удерживаемые до 30 s после выхода из неё. Выведено здесь, а не прочитано из шлюза. Шлюз включается по желанию и добавляет задержку.

js-trust-gate-note-read = Шлюз каждой эпохи так, как его сообщил живой поток: выключен, пропущено или задержано (решение помечено недействительным в переданном цикле).

js-trust-gate-now-derived = { $gate } · выведено

js-trust-gate-off = Выключен

js-trust-gate-off-cal = Выключен (калибровка)

js-trust-gate-passed = Пропущено: решение передаётся без изменений

js-trust-gate-span = шлюз { $gate }, с { $from } по { $to }

js-trust-gate-span-derived = шлюз { $gate } (выведено), с { $from } по { $to }

js-trust-gate-withheld = Задержано: решение было бы помечено недействительным ниже по потоку

js-trust-gen-chart-label = График прогона от движка: отношение несущей к плотности шума, состояние и тревоги во времени

js-trust-gen-epochs = Эпохи: номинально — { $nominal }, ухудшено — { $degraded }, нет доверия — { $untrusted } после окна калибровки (эпох: { $window }).

js-trust-gen-self-heading = Собственные флаги приёмника против тревог Kshana

js-trust-gen-self-note = Сравнение, а не проверка ни того, ни другого: флаг приёмника — его собственное сообщение.

js-trust-geo-deduction-class = { $points } б. ({ $class })

js-trust-geo-deduction-points = { $points } б.

js-trust-geo-flag-mismatch = HDOP, заявленный приёмником, расходится с выведенным из сообщаемого им неба: вычет за геометрию относится к несогласованности.

js-trust-geo-flag-signal-loss = Потеря сигнала: спутники в зоне видимости не сопровождаются, хотя их геометрия хорошая, поэтому вычет за геометрию относится к среде.

js-trust-geo-heading-label = геометрия { $label }

js-trust-geo-label-fair = { $label } (не оценивается)

js-trust-geo-label-poor = { $label } (единственная метка, за которую оценка вычитает баллы)

js-trust-geo-none-in-run = В этом прогоне нет геометрии (движок до 0.36 её не записывает).

js-trust-geo-reason-few-satellites = спутников меньше минимума

js-trust-geo-reason-high-hdop = HDOP выше порога

js-trust-geo-reason-high-pdop = PDOP выше порога

js-trust-geo-reason-sky-blocked = сопровождаемые спутники оставляют большой разрыв по азимуту (одна сторона неба закрыта)

js-trust-geo-row-deduction = Вычет за геометрию

js-trust-geo-row-from = С

js-trust-geo-row-gap = Наибольший разрыв по азимуту

js-trust-geo-row-label = Метка

js-trust-geo-row-open-sky = Открытое небо

js-trust-geo-row-reported-hdop = HDOP, заявленный приёмником

js-trust-geo-row-sats-used = Использовано спутников

js-trust-geo-row-sky-age = Возраст данных о небе

js-trust-geo-row-status = Статус

js-trust-geo-say-deduction = вычет за геометрию { $points } б.

js-trust-geo-say-label-hdop = геометрия { $label } (HDOP { $hdop })

js-trust-geo-say-mismatch = заявленный HDOP расходится

js-trust-geo-source-derived = выведено по спутникам, о которых сообщает журнал (GSV)

js-trust-geo-source-none = ничего

js-trust-geo-source-reported = DOP, заявленный приёмником (GSA)

js-trust-geo-status-reasons = { $status }: { $reasons }

js-trust-geo-status-title = геометрия { $status }

js-trust-geo-unknown-no-gsv = геометрия неизвестна: в журнале нет GSV или GSA

js-trust-geo-unknown-no-gsv-sentence = Геометрия неизвестна: в журнале нет GSV или GSA.

js-trust-geo-unknown-odd = Геометрия неизвестна (файл указывает «{ $odd }», чего эта страница не знает).

js-trust-geo-used-of-view = { $used } из { $inView } в зоне видимости

js-trust-got-file-kind = { $name }: { $kind }

js-trust-got-lines-skipped = Строк { $name }, не являющихся эпохами, пропущено: { $count }

js-trust-imu-csv = CSV со строкой заголовка

js-trust-imu-euroc = EuRoC MAV imu0 data.csv

js-trust-imu-file = Файл IMU: { $name } (символов: { $chars }). Будет использован при следующей оценке.

js-trust-imu-file-press = Файл IMU: { $name } (символов: { $chars }). Будет использован при следующей оценке; нажмите «Оценить выбранный файл».

js-trust-imu-none = Файла IMU нет.

js-trust-jt-col-latency = Задержка, s

js-trust-jt-col-monitors = Первые мониторы

js-trust-jt-col-name = Название

js-trust-jt-col-outcome = Исход

js-trust-jt-col-recovered = Восстановлено

js-trust-jt-col-slot = Слот, s

js-trust-jt-col-test = Испытание

js-trust-jt-label = { $label } Защитный интервал { $guard } s, удержание восстановления { $hold } s.

js-trust-jt-label-contaminated = { $label } Защитный интервал { $guard } s, удержание восстановления { $hold } s. Базовый уровень калибровки пересёкся с запланированным слотом.

js-trust-jt-opened = Открыт { $name }: испытаний — { $count }. Прочитано здесь; ничего не загружалось.

js-trust-kind-batch-result = пакетный результат

js-trust-kind-json-lines = JSON lines

js-trust-kind-nmea-log = журнал NMEA

js-trust-kind-truth-file = файл истины

js-trust-label-demo = Синтетическая демонстрация: выдуманный журнал парома с выдуманным уводом положения, оценённый Kshana. Записано с движка; журнал — текст, а не измерение.

js-trust-label-example = Иллюстративный пример: выдуманный журнал NMEA с выдуманным источником помех с 120 s до 240 s, оценённый здесь движком. Текст, а не измерение.

js-trust-label-geo-demo = Синтетическая демонстрация с закрытым небом: журнал парома, в котором западная половина неба обнулена с 600 s (естественное ухудшение, отнесённое к геометрии), и тот же выдуманный увод с 1500 s (похоже на атаку). Записано с движка с геометрией 0.36; текст, а не измерение.

js-trust-label-score-demo = Синтетический демонстрационный журнал, оценённый здесь движком. Выдуманный журнал парома и увод; текст, а не измерение.

js-trust-legend-calibrating = Калибровка (никогда не оценивается)

js-trust-legend-class = Класс вычета:

js-trust-legend-class-environment = среда: сигнал

js-trust-legend-class-geometry = геометрия: небо, а не сигнал

js-trust-legend-class-inconsistency = несогласованность (похоже на атаку)

js-trust-legend-degraded = Ухудшено

js-trust-legend-demo = В этой демонстрации приёмник на всём протяжении сообщает действительное решение (качество GGA 1, статус RMC A). Падает именно оценка.

js-trust-legend-geo-degraded = геометрия ухудшена

js-trust-legend-geo-good = геометрия хорошая

js-trust-legend-geo-unknown = геометрия неизвестна (нет GSV или GSA; не хорошая)

js-trust-legend-nominal = Номинально

js-trust-legend-self = Собственный флаг приёмника и тревоги Kshana:

js-trust-legend-self-both = флаг у обоих

js-trust-legend-self-kshana = только Kshana

js-trust-legend-self-neither = ни у кого

js-trust-legend-self-receiver = только приёмник

js-trust-legend-sky = Небо:

js-trust-legend-true-track = Истинная трасса (только синтетические данные)

js-trust-legend-underline = подчёркивание: геометрия тоже снижает баллы

js-trust-legend-untrusted = Нет доверия

js-trust-marks-cleared = Отметки сброшены.

js-trust-marks-set = { $name }: выше порога срабатывания в эпохах: { $count }; они отмечены на временной шкале и на трассе.

js-trust-mon-agc = Автоматическая регулировка усиления сместилась относительно своего базового уровня.

js-trust-mon-clock = Монитор с привязкой к часам: часы приёмника относительно предсказанной линии.

js-trust-mon-cn0-drop = Лишение мощности: уровень сигнала упал относительно базового уровня калибровки.

js-trust-mon-cn0-rise = Ищет признак одного передатчика: уровень сигнала по спутникам растёт одновременно относительно базового уровня.

js-trust-mon-cn0-spread = Ищет признак одного передатчика: уровень сигнала по спутникам резко падает одновременно относительно базового уровня калибровки.

js-trust-mon-geometry = Геометрия спутников (0.36): снижает баллы, только когда геометрия плохая (HDOP, PDOP или число используемых спутников за пределами порогов), с ограничением и никогда ниже полосы «ухудшено».

js-trust-mon-heading-course = Сравнивает направление трассы с тем, куда указывает судно, в пределах заданного угла сноса.

js-trust-mon-jam-ind = Собственный индикатор подавления приёмника.

js-trust-mon-kinematic = Сравнивает каждый шаг положения с сообщённой скоростью и путевым углом и с заданными для судна пределами скорости, ускорения и скорости поворота.

js-trust-mon-loss-of-lock = Потеря сопровождаемых спутников.

js-trust-mon-osnma = Читает сообщённый сбой аутентификации OSNMA. Статус читается, а не проверяется.

js-trust-mon-position-jump = Скачок сообщённого положения, больший, чем допускает базовый уровень.

js-trust-mon-raim = Тестовая статистика автономного контроля целостности приёмника относительно её порога.

js-trust-mon-receiver-self-report = Собственный флаг приёмника о спуфинге или подавлении (например, u-blox UBX-SEC-SIG или NAV-STATUS spoofDetState), показанный рядом с мониторами Kshana. Прочитан из журнала, не проверен; слот готов для монитора движка 0.38 и рисуется как полоса, как только результат его содержит.

js-trust-mon-sea-level = Проверяет, что высота находится там, где её помещают поверхность моря и заданная высота антенны.

js-trust-mon-solve-failure = Не удалось вычислить решение по положению.

js-trust-mon-speed-log = Сравнивает скорость относительно грунта со скоростью относительно воды в пределах заданного допуска на течение.

js-trust-mon-time-consistency = Проверяет время приёмника на неровные шаги или ход назад, а для потоков реального времени — ещё и по часам этого компьютера.

js-trust-mon-unknown = Монитор, для которого у этого представления нет описания (новее страницы). Считайте его монитором.

js-trust-na = н/д

js-trust-name-colon-text = { $name }: { $text }

js-trust-never = никогда

js-trust-no = нет

js-trust-no-deduction = нет вычета

js-trust-none = нет

js-trust-north = С

js-trust-not-stated = не указано

js-trust-note-advisories = В строках разных консультативных заявлений: { $count }; показано первое.

js-trust-note-csv-limits = trust.csv содержит оценки и причины, но не отношения и не положения.

js-trust-note-live-no-model = Живой поток не сообщает, какие мониторы работали и какая модель оценки; границы полос ниже — значения по умолчанию из документации, а полосы мониторов показывают только мониторы, снижавшие баллы.

js-trust-note-nmea-no-match = Ни одно решение NMEA не удалось сопоставить с эпохой по времени.

js-trust-note-nmea-skipped = Пропущено предложений NMEA с неверной контрольной суммой или полями: { $count }.

js-trust-note-skipped-epochs = Пропущено эпох без числового t_s: { $count }.

js-trust-note-truth-no-match = Времена файла истины не совпадают ни с одной эпохой.

js-trust-note-unknown-state = Эпох с состоянием, которого эта страница не знает ({ $states }): { $count }; они рисуются как калибровка и никогда не оцениваются.

js-trust-offset-at = В { $time } положение, сообщённое приёмником, находится в { $m } m от того места, где судно действительно было (синтетическая истина).

js-trust-offset-no-truth = В это время нет истинного положения.

js-trust-opened = Открыто эпох: { $count } ({ $source }).

js-trust-opening-demo = Открывается синтетическая демонстрация…

js-trust-opening-demo-log = Открывается синтетический демонстрационный журнал…

js-trust-opening-example = Открывается иллюстративный пример…

js-trust-opening-geo-demo = Открывается демонстрация с закрытым небом…

js-trust-pause = Пауза

js-trust-play = Воспроизвести

js-trust-reading = Читается…

js-trust-reasons-calibrating = Калибровка: первые секунды образуют базовый уровень и никогда не оцениваются.

js-trust-reasons-class-note = Каждый вычет несёт класс от движка: геометрия (небо), среда (сигнал) или несогласованность (похоже на атаку)

js-trust-reasons-live-unknown = В живом потоке не указано, какие мониторы работали; отсутствующая здесь проверка могла не выполняться.

js-trust-reasons-marked-none = отмечено; здесь нет вычета

js-trust-reasons-no-score = В этой эпохе нет оценки.

js-trust-reasons-no-score-note = В этой эпохе нет оценки: { $note }.

js-trust-reasons-not-run = Не выполнялась (не означает пройденную)

js-trust-reasons-nothing = В этой эпохе ничего не вычтено. Это не доказательство того, что решение хорошее: см. ниже, чего проверки не видят.

js-trust-reasons-pts = { $points } б.

js-trust-reasons-ran-free = Выполнялась, ничего не стоила

js-trust-reasons-ratio = отношение { $ratio }

js-trust-reasons-row-title = { $name }: { $text } Нажмите, чтобы отметить, где было выше порога срабатывания.

js-trust-reasons-weight = вес { $weight }

js-trust-reduced-motion = Предпочтительно уменьшение анимации, поэтому повтор начинается с 1x. Используйте ползунок или клавиши со стрелками, чтобы перемещаться без анимации.

js-trust-say-gate = шлюз { $gate }

js-trust-say-gate-derived = шлюз { $gate } (выведено)

js-trust-say-monitor-points = { $monitor } { $points } б.

js-trust-say-position-from-true = сообщённое положение отличается от истинного на { $m } m

js-trust-say-reasons = причины: { $list }

js-trust-say-score = оценка { $score }

js-trust-scored-label = Оценено эпох { $name }: { $count }, движком { $version }, в этом браузере.

js-trust-scored-summary = Оценено эпох: { $count }, движком { $version }: { $summary }. Носит только консультативный характер.

js-trust-scoring = Запуск движка и оценка…

js-trust-self-code-meaning = { $code }: { $meaning }

js-trust-self-none-at-time = В журнале нет флага приёмника на это время.

js-trust-self-not-in-log = нет в журнале

js-trust-self-row-flags = Флаги приёмника

js-trust-self-row-jamming = Состояние подавления у приёмника

js-trust-self-row-kshana-alarms = Монитор Kshana подаёт тревогу

js-trust-self-row-spoofing = Состояние спуфинга у приёмника

js-trust-self-unknown-agreement = вариант согласия, которого эта страница не знает ({ $odd })

js-trust-self-yes-state-2 = да (состояние 2 или выше)

js-trust-set-degraded-edge = граница «ухудшено»

js-trust-set-degraded-min = ухудшено при значении не ниже

js-trust-set-epochs = Эпохи

js-trust-set-epochs-counts = Всего { $total }: калибровка — { $calibrating }, номинально — { $nominal }, ухудшено — { $degraded }, нет доверия — { $untrusted }.

js-trust-set-epochs-counts-class = Всего { $total }: калибровка — { $calibrating }, номинально — { $nominal }, ухудшено — { $degraded }, нет доверия — { $untrusted }. По классу вычета: геометрия — { $geometry }, среда — { $environment }, несогласованность — { $inconsistency }.

js-trust-set-evidence-hold = удержание доказательств, s

js-trust-set-full-ratio = полный вес при отношении

js-trust-set-geo-counts = Небо: хорошее — { $good }, ухудшенное — { $degraded }, неизвестное — { $unknown }. Метка: хорошая — { $lgood }, удовлетворительная — { $fair }, плохая — { $poor } (баллы снижает только плохая). Эпох с вычетом класса «геометрия»: { $geometry }, «среда»: { $environment }, «несогласованность»: { $inconsistency }.

js-trust-set-geo-counts-odd = Небо: хорошее — { $good }, ухудшенное — { $degraded }, неизвестное — { $unknown } (из них со значением, которого эта страница не знает и которое читается как неизвестное, — { $odd }). Метка: хорошая — { $lgood }, удовлетворительная — { $fair }, плохая — { $poor } (баллы снижает только плохая). Эпох с вычетом класса «геометрия»: { $geometry }, «среда»: { $environment }, «несогласованность»: { $inconsistency }.

js-trust-set-geometry = Геометрия (параметры [geometry])

js-trust-set-gloss = На что смотрит каждая проверка

js-trust-set-live-geometry = Живой поток не сообщает пороги геометрии; действуют значения по умолчанию из документации (плохая — выше HDOP 4 или PDOP 6, либо менее 5 спутников; не более 15 баллов, никогда не ниже полосы «ухудшено»).

js-trust-set-no-geometry = В этом прогоне нет геометрии: он получен от движка до 0.36 или из trust.csv. О небе ничего не показано, и ничто не показано как хорошее.

js-trust-set-nominal-min = номинально при значении не ниже

js-trust-set-onset-ratio = снижает баллы начиная с отношения

js-trust-set-provenance = Откуда берутся пороги и как классифицируются вычеты

js-trust-set-ran = Выполненные проверки

js-trust-set-weights = Вес каждой проверки, баллы

js-trust-settings-assumed = Этот поток не сообщает свою модель оценки. Показанные границы полос — значения по умолчанию из документации, принятые по предположению.

js-trust-show-in-replay = Показать этот прогон в повторе ниже (трасса, оценка, собственный флаг приёмника)

js-trust-sky-no-gsv = нет GSV

js-trust-sky-none = Неба нет: откройте журнал NMEA вместе с прогоном (или демонстрацию), чтобы увидеть перечисленные в нём спутники.

js-trust-span-title = { $what }, с { $from } по { $to }

js-trust-state-0 = неизвестно или не включено

js-trust-state-1 = указаний нет

js-trust-state-2 = указано

js-trust-state-3 = множественные указания или подтверждено

js-trust-strip-band = полоса

js-trust-strip-class = класс

js-trust-strip-gate = шлюз

js-trust-strip-marked = отмечено

js-trust-strip-receiver = приёмник

js-trust-strip-sky = небо

js-trust-strips-none = В этом файле нет отношений мониторов.

js-trust-strips-note-ran = отношение статистики к порогу; пунктирная линия — тревога при 1

js-trust-strips-note-seen = только мониторы, замеченные в снижении баллов; отношение к порогу

js-trust-sum-both-flag = Флаг у обоих

js-trust-sum-epochs-compared = Сравнено эпох (после калибровки)

js-trust-sum-first-kshana = Первая тревога Kshana среди этих эпох

js-trust-sum-first-receiver = Первый флаг приёмника

js-trust-sum-jamming-flag = Флаг подавления у приёмника (состояние 2+)

js-trust-sum-neither = Ни у кого

js-trust-sum-only-kshana = Тревога только у Kshana

js-trust-sum-only-receiver = Флаг только у приёмника

js-trust-sum-spoofing-flag = Флаг спуфинга у приёмника (состояние 2+)

js-trust-thr-azimuth-gap = разрыв по азимуту, в градусах, начиная с которого небо частично закрыто

js-trust-thr-cap-in-force = наибольшее число баллов, которое вычет за геометрию забирает в этом прогоне

js-trust-thr-cap-points = наибольшее число баллов, которое может забрать вычет за геометрию

js-trust-thr-floor = наименьшая оценка, которую может оставить одна геометрия (пусто: граница полосы «ухудшено»)

js-trust-thr-floor-in-force = наименьшая оценка, которую одна геометрия может оставить в этом прогоне

js-trust-thr-full-ratio = отношение, при котором вычет за геометрию достигает своего предела

js-trust-thr-hdop-good = HDOP, при котором и ниже которого геометрия хорошая

js-trust-thr-hdop-max = HDOP, выше которого геометрия плохая

js-trust-thr-hold = как долго после поступления учитываются положения неба и GSA, s

js-trust-thr-low-elev = угол места, в градусах, ниже которого потерянный спутник относят на счёт неба

js-trust-thr-min-used = наименьшее число используемых спутников, ниже которого геометрия плохая

js-trust-thr-pdop-good = PDOP, при котором и ниже которого геометрия хорошая

js-trust-thr-pdop-max = PDOP, выше которого геометрия плохая

js-trust-thr-reported-rel = то же, как доля выведенного HDOP

js-trust-thr-reported-tol = разница между заявленным и выведенным HDOP, после которой они расходятся

js-trust-thr-sigma-uere = эквивалентная пользовательская ошибка дальности (UERE), которую предполагают пороги, метры

js-trust-thr-used-good = число используемых спутников, при котором и выше которого геометрия хорошая

js-trust-track-desc = Трасса по сообщённым положениям: { $positions }, север вверху. Эпох без доверия: { $untrusted }.

js-trust-track-desc-none = Трассы нет: файлы не содержат положений.

js-trust-track-desc-truth = Трасса по сообщённым положениям: { $positions }, север вверху. Эпох без доверия: { $untrusted }. Тонкая серая линия показывает истинную трассу.

js-trust-track-end = конец

js-trust-track-no-positions = В открытых файлах нет положений

js-trust-track-note = Север вверху, один масштаб по обеим осям. Линия — там, где приёмник сообщал положение судна, цвет — полоса доверия каждой эпохи.

js-trust-track-note-none = Этот файл не содержит положений. Добавьте журнал NMEA, из которого получен прогон (или поток v1.1 с положением), чтобы нарисовать трассу.

js-trust-track-start = начало

js-trust-unknown-agreement = вариант согласия, которого эта страница не знает

js-trust-yes = да

js-mthread-limiting-phase = Движок называет ограничивающий источник этой фазы как { $source }: источник фазы, а не одна строка этой таблицы.

js-mthread-limiting-row = ограничивающий источник по данным движка

js-cat-mission-thread-short-question = В какой фазе вдоль одной связки от запуска до входа в атмосферу, через встречу на низкой орбите и одни сутки транслунного перелёта, запас по навигации и времени наименьший? (вычислено по модели)

js-cat-mission-thread-short-title = Короткая цепочка фаз миссии: от запуска до входа

js-meankind-mthread-big = Вдоль цепочки наименьший запас относительно требования приходится на фазу { $phase }.

js-meankind-mthread-big-source = Вдоль цепочки наименьший запас относительно требования приходится на фазу { $phase }, ограничен источником { $source }.

js-meankind-mthread-line =
    { $n ->
        [one] { $n } фаза.
        [few] { $n } фазы.
        [many] { $n } фаз.
       *[other] { $n } фазы.
    }
