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
