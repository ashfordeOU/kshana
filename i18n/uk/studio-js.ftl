# studio-js.ftl (uk): translations

js-adv-all-domains = Усі області

js-adv-animation-frame-title = Анімація цього прогону, записана рушієм

js-adv-animation-html-player = Програвач HTML

js-adv-animation-html-player-title = Однофайловий програвач у тому вигляді, в якому його записав рушій

js-adv-animation-load-failed = Не вдалося завантажити записану анімацію ({ $reason }).

js-adv-animation-loading = Завантаження записаної анімації…

js-adv-animation-none = Для цього сценарію немає записаної анімації.

js-adv-animation-note = Рушій записує анімацію будь-якого прогону, що має часову вісь: самовідтворюваний SVG і однофайловий програвач HTML з власними елементами керування відтворенням і перемотуванням. Збірка для браузера не містить цього засобу запису, тож це файл, який записав нативний рушій командного рядка для вбудованого сценарію.

js-adv-animation-svg = Анімований SVG

js-adv-animation-svg-title = Самовідтворюваний SVG у тому вигляді, в якому його записав рушій

js-adv-axis-averaging-time = час усереднення τ (s)

js-adv-axis-observation-interval = інтервал спостереження τ (s)

js-adv-axis-value = значення

js-adv-badge-live-engine = Живий рушій

js-adv-badge-recorded = Записано

js-adv-badge-recorded-engine = Записаний прогін, рушій v{ $version }

js-adv-badge-recorded-native = Записаний прогін, нативний рушій v{ $version }

js-adv-band-carrier = Несівна

js-adv-band-carrier-not-set = не задано в цьому сценарії

js-adv-band-chip-rate = Чипова швидкість

js-adv-band-jammer-bandwidth = Смуга глушника

js-adv-band-jammer-label = глушник { $bandwidth } MHz

js-adv-band-jammer-power = Потужність глушника

js-adv-band-jammer-type = Тип глушника

js-adv-band-no-carrier-note = Рушій обчислює відношення глушник/сигнал за енергетичним бюджетом лінії. Цей сценарій не називає частоти несівної, тому спектр не будується.

js-adv-band-satellites = Супутники

js-adv-band-signal-main-lobe = головна пелюстка сигналу

js-adv-band-svg-label = Смуги сигналу та глушника навколо несівної

js-adv-band-tracking-threshold = Поріг супроводження

js-adv-browser-cannot-run = Збірка для браузера не може запустити цей сценарій.

js-adv-busy-running = Виконується

js-adv-busy-sweeping = Перебір

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } значення передано далі
        [few] { $n } значення передано далі
        [many] { $n } значень передано далі
       *[other] { $n } значення передано далі
    }

js-adv-chain-note = Одна система, простежена крізь кожен етап рушія. У таблиці нижче перелічено кожне число, яке обчислив етап і яке використав наступний.

js-adv-chain-stage = Етап { $n }

js-adv-chain-sub = вихід кожного етапу подається на наступний

js-adv-chain-title = Ланцюжок

js-adv-chart-allan-title = Девіація Аллана

js-adv-chart-budget-label = бюджет

js-adv-chart-default-title = Діаграма Kshana

js-adv-chart-effective-cn0 = Ефективне C/N0 за супутниками

js-adv-chart-ground-track = Траса на поверхні

js-adv-chart-holdover-budget = Holdover відносно бюджету синхронізації

js-adv-chart-mtie-title = MTIE (максимальна похибка часового інтервалу)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · сценарій { $hash } · kshana.dev

js-adv-chart-stability-title = Стабільність годинника (перекривна девіація Аллана)

js-adv-chart-tdev-title = TDEV (девіація часу)

js-adv-chart-undrawable = Цю діаграму не вдалося побудувати.

js-adv-chip-live = Живий рушій · v{ $version }

js-adv-chip-live-title = Рушій Kshana працює в цьому браузері як WebAssembly

js-adv-chip-recorded = Записані прогони · v{ $version }

js-adv-chip-recorded-title = WebAssembly тут не вдалося запустити. Показано справжні записані прогони вбудованих сценаріїв.

js-adv-chip-recorded-title-reason = WebAssembly тут не вдалося запустити ({ $reason }). Показано справжні записані прогони вбудованих сценаріїв.

js-adv-chip-unavailable = Рушій недоступний

js-adv-cmd-all-fields = Показати кожне числове поле

js-adv-cmd-compare = Порівняти закріплені прогони

js-adv-cmd-embed-code = Скопіювати код вбудовування

js-adv-cmd-exports = Завантажити результати (експорт)

js-adv-cmd-history = Відкрити історію прогонів

js-adv-cmd-parameters = Відкрити параметри

js-adv-cmd-pin = Закріпити цей прогін для порівняння

js-adv-cmd-report = Завантажити звіт

js-adv-cmd-reset = Скинути текст сценарію

js-adv-cmd-run = Запустити сценарій

js-adv-cmd-share-link = Скопіювати посилання для поширення

js-adv-cmd-start = Перейти на початковий екран

js-adv-cmd-theme = Перемкнути світлу або темну тему

js-adv-cmd-tour = Почати екскурсію

js-adv-command-line-only = лише командний рядок

js-adv-compare-deltas-note = Різницю подано щодо прогону A. Зелений позначає краще значення для кожного показника.

js-adv-compare-no-common = Ці прогони не мають спільних показників якості, які можна порівняти. Закріпіть прогони однієї родини сценаріїв, щоб побачити числа й різницю.

js-adv-compare-one-pinned = Закріплено один прогін. Змініть параметр, запустіть знову й закріпіть цей прогін, щоб порівняти обидва.

js-adv-compare-overlay = Накладення закріплених прогонів

js-adv-compare-overlay-diff = Накладення з різницею B − A

js-adv-compare-overlay-note = Суцільні лінії — прогін A, пунктирні — прогін B, на тих самих осях.

js-adv-compare-overlay-title = { $title }: прогін { $a } (A) проти прогону { $b } (B)

js-adv-compare-pin-two = Закріпіть щонайменше два прогони, щоб порівняти їх поруч. Закріпіть прогін, змініть параметр або оберіть інший сценарій тієї самої родини, запустіть його й закріпіть знову.

js-adv-compare-run-heading = { $letter } · прогін { $run }

js-adv-copy-blocked = Копіювання тут заблоковано.

js-adv-copy-command = Скопіювати: { $command }

js-adv-could-not-load = Не вдалося завантажити { $file }.

js-adv-coverage-dots = Крапки — це { $shown } із { $total } супутників, прокладених уздовж їхніх трас на поверхні; запустіть відтворення, щоб їх рухати.

js-adv-coverage-field-label = Поле для карти

js-adv-coverage-map = Карта покриття

js-adv-coverage-map-over = над { $body }

js-adv-coverage-map-select = Карта

js-adv-coverage-note = Кожна комірка — це одна точка сітки на { $body }, оцінена за кожну епоху прогону.

js-adv-coverage-title = { $field } над { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = Початковий екран: усі області

js-adv-decrease-field = Зменшити { $field }

js-adv-domain = Область

js-adv-domain-line-campaigns = Ланцюжки місій, переборів і прогонів Монте-Карло на одному годиннику.

js-adv-domain-line-constellations = Спроєктуйте орбітальне угруповання та побудуйте карту його покриття й PDOP (геометричний чинник погіршення точності положення).

js-adv-domain-line-deepspace = Навігація та час на Місяці, у цисмісячному просторі та на Марсі.

js-adv-domain-line-integrity = Визначення положення та те, чи можна йому довіряти: RAIM (автономний контроль цілісності приймачем) і його розширена форма ARAIM.

js-adv-domain-line-interference = Глушники проти приймачів ГНСС: що втрачається і коли.

js-adv-domain-line-leo = Навігаційні сигнали, проходи, повідомлення та визначення положення на низькій навколоземній орбіті.

js-adv-domain-line-leo-missions = Дослідження та послуги на основі шару низької навколоземної орбіти.

js-adv-domain-line-navigation = Інерціальна, рельєфна, гравітаційна та інша навігація без ГНСС.

js-adv-domain-line-optional = Необов'язкова група сценаріїв.

js-adv-domain-line-orbits = Поширення орбіти, ефемериди та геометрія ГНСС.

js-adv-domain-line-solar = Кожна планета й супутник планети в одну епоху, із часом проходження світла.

js-adv-domain-line-spaceops = Проходи, вікна запуску, вхід в атмосферу, бюджети лінії та орієнтації.

js-adv-domain-line-spectrum = Водоспади радіодіапазону: глушники, сигнали та те, що супроводжує приймач.

js-adv-domain-line-spoofing = Хибні сигнали та мікоінг (meaconing) і монітори, які їх виявляють.

js-adv-domain-line-studies = Квантові сенсори, порівняльні дослідження та формати сумісності.

js-adv-domain-line-timing = Годинники без ГНСС: holdover, стабільність, телекомунікаційні маски, передавання часу.

js-adv-domain-pick-hint = Оберіть один: він відкривається і виконується у вашому браузері. Далі ви зможете змінити його параметри.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } сценарій
        [few] { $label }: { $n } сценарії
        [many] { $label }: { $n } сценаріїв
       *[other] { $label }: { $n } сценарію
    }

js-adv-domain-select-label = Показати одну область

js-adv-download = Завантажити

js-adv-edited-cli-only-status = Змінено: цей сценарій виконується лише в рушії командного рядка.

js-adv-edited-needs-engine = Змінено: потрібен рушій { $need }.

js-adv-edited-needs-live-engine = Змінені сценарії потребують живого рушія.

js-adv-embed-copied = Код вбудовування скопійовано.

js-adv-engine-chart = Діаграма рушія

js-adv-engine-chart-alt = Діаграма рушія для цього прогону

js-adv-engine-file-http-error = файл рушія повернув HTTP { $status }

js-adv-engine-load-failed-no-recordings = рушій не вдалося завантажити ({ $reason }), і записаних прогонів не знайдено

js-adv-engine-loading = Завантаження рушія…

js-adv-engine-loading-title = Живий рушій ще завантажується. Коли він буде готовий, цей записаний результат буде замінено живим прогоном.

js-adv-engine-start-failed = Рушій не вдалося запустити: { $reason }. Віддайте цю теку через HTTP (наприклад, python3 -m http.server), а не відкривайте файл напряму.

js-adv-entries-count =
    { $n ->
        [one] { $n } запис
        [few] { $n } записи
        [many] { $n } записів
       *[other] { $n } запису
    }

js-adv-export-card-title = Експорт { $format }

js-adv-export-csv-desc = Ті самі байти, які інструмент командного рядка записує як { $file }.

js-adv-export-csv-title = Таблиця відтворюваності

js-adv-export-ephemeris-checking = Перевірка, у яких форматах ефемерид можна експортувати цей прогін…

js-adv-export-ephemeris-waiting = Експорт ефемерид з'явиться тут, коли рушій завантажиться.

js-adv-export-json-desc = Повний вихід рушія для цього прогону, разом з одиницями та походженням.

js-adv-export-json-title = Повний документ результату

js-adv-export-large-not-recorded = Цей експорт великий, тому його не записано. Він потребує живого рушія.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) для GMAT, Orekit або STK

js-adv-export-omm-desc = Каталог CCSDS OMM (Orbit Mean-elements Message)

js-adv-export-report-desc = Один автономний файл: підсумок, показники з їхніми рівнями, кожна діаграма й точний текст сценарію, позначені версією рушія та хешем сценарію.

js-adv-export-report-title = Відтворюваний звіт

js-adv-export-sp3-desc = Точні ефемериди SP3-c цього орбітального угруповання

js-adv-export-toml-desc = Точні вхідні дані цього прогону. Запустіть його знову будь-де за допомогою інструмента командного рядка або пакетів Python і npm.

js-adv-export-toml-title = Файл сценарію

js-adv-export-too-large = { $desc }. Завеликий для запису: потребує живого рушія.

js-adv-field-find-match =
    { $n ->
        [one] { $n } кероване поле та { $fields } з { $total } полів відповідають «{ $query }».
        [few] { $n } кероване поле та { $fields } з { $total } полів відповідають «{ $query }».
        [many] { $n } керованих елементів і { $fields } з { $total } полів відповідають «{ $query }».
       *[other] { $n } керованого елемента і { $fields } з { $total } полів відповідають «{ $query }».
    }

js-adv-field-find-none = Жодне поле цього сценарію не відповідає «{ $query }». Шукайте в усіх сценаріях через пошук у бібліотеці.

js-adv-field-hit-in = у { $title }

js-adv-field-not-single-number = У цьому сценарії це поле не є одним числом: змініть його у вихідному тексті.

js-adv-field-opened = Відкрито в { $field }. Змініть його, і сценарій виконається знову.

js-adv-fields-matching = Поля, що відповідають «{ $query }»

js-adv-fields-more = Ще { $n }: уточніть слова або скористайтеся пошуком на початковому екрані.

js-adv-fields-top-level = верхній рівень

js-adv-filter-check-tuning = перевірте налаштування

js-adv-filter-consistent = узгоджено

js-adv-from-the-link = з посилання

js-adv-geo-sub = { $name } · намальовано { $shown } із { $total } об'єктів · записано нативним рушієм

js-adv-geo-title = Експорт GeoJSON: { $name }

js-adv-gt-note = Виділено: супутник, видимий зі станції.

js-adv-gt-note-both = Виділено: супутник, видимий зі станції. Піковий кут над горизонтом { $elevation }°. Піковий доплерівський зсув { $doppler } Hz.

js-adv-gt-note-doppler = Виділено: супутник, видимий зі станції. Піковий доплерівський зсув { $doppler } Hz.

js-adv-gt-note-elevation = Виділено: супутник, видимий зі станції. Піковий кут над горизонтом { $elevation }°.

js-adv-heatmap-label = Теплова карта: { $metric }

js-adv-hist-runs-count =
    { $n ->
        [one] { $n } прогін.
        [few] { $n } прогони.
        [many] { $n } прогонів.
       *[other] { $n } прогону.
    }

js-adv-history-pin = Закріпити

js-adv-history-restore = Відновити

js-adv-history-run-time = прогін { $run } · { $time }

js-adv-holdover-engine-figure = Holdover рушія при бюджеті сценарію: { $duration }

js-adv-holdover-engine-figure-budget = Holdover рушія при бюджеті сценарію ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = похибка після втрати ГНСС при t = { $loss } s

js-adv-holdover-error-since-fix = похибка від останнього визначення положення

js-adv-holdover-stays-inside = залишається в межах цього бюджету протягом усього запису

js-adv-holdover-until-breached = доки бюджет не буде порушено

js-adv-honesty-modelled = Фізика з перших принципів із тестами, ще не перевірена за зовнішнім оракулом. { $text }

js-adv-honesty-partner = Показники належать партнеру. { $text }

js-adv-honesty-validated = Перевірено за незалежним зовнішнім оракулом. { $text }

js-adv-increase-field = Збільшити { $field }

js-adv-install-version = Встановити v{ $version }

js-adv-interop-no-file = Рушій не записав файлу цього формату для цього прогону.

js-adv-interop-not-applicable = Не стосується цього сценарію: { $reason }.

js-adv-interop-not-bundled = Тут не вбудовано (через розмір): його записує команда вище.

js-adv-interop-note = Рушій записує геометрію та відліки сигналу прогону у форматах, які відкривають інші інструменти: CZML для Cesium, KML (Keyhole Markup Language) для Google Earth, GeoJSON для карт, файли ефемерид STK (.e) і записи SigMF (Signal Metadata Format). Збірка для браузера не містить цих засобів запису, тож файли нижче — це ті, що записав нативний рушій командного рядка для вбудованого сценарію.

js-adv-js-range-label = діапазон J/S

js-adv-js-range-value = від { $low } до { $high } dB

js-adv-json-copied = JSON скопійовано.

js-adv-kind-default = kind: clock holdover (типове значення)

js-adv-kind-label = kind: { $kind }

js-adv-kpi-check = Перевірка

js-adv-kpi-delta-since-run = { $arrow } { $change } від прогону { $run }

js-adv-kpi-fail = Не пройдено

js-adv-kpi-first-run = перший прогін

js-adv-kpi-not-in-previous = немає у вашому попередньому прогоні

js-adv-kpi-pass = Пройдено

js-adv-lib-count-all =
    { $scenarios ->
        [one] { $scenarios } сценарій
        [few] { $scenarios } сценарії
        [many] { $scenarios } сценаріїв
       *[other] { $scenarios } сценарію
    } · { $domains ->
        [one] { $domains } область
        [few] { $domains } області
        [many] { $domains } областей
       *[other] { $domains } області
    }

js-adv-lib-count-filtered =
    { $n } з { $total ->
        [one] { $total } сценарію
        [few] { $total } сценаріїв
        [many] { $total } сценаріїв
       *[other] { $total } сценаріїв
    }

js-adv-lib-no-match = Жоден сценарій чи поле не відповідає. Спробуйте слово на кшталт глушіння, годинник, місячний, орбіта, маска або PDOP.

js-adv-loaded-shared = Завантажено спільний сценарій із посилання.

js-adv-mask-envelope = Огинаюча похибки часу в holdover ({ $source })

js-adv-mask-exceeded-after = перевищено через { $duration }

js-adv-mask-limit-label = межа { $limit } ns

js-adv-mask-max-te = макс. |TE|

js-adv-mask-not-exceeded = не перевищено

js-adv-matrix-counts = { $validated } з { $total }

js-adv-matrix-line = { $counts } можливостей перевірено за незалежними зовнішніми оракулами · { $modelled } змодельовано · { $partner } належать партнерам

js-adv-max-close = Закрити

js-adv-max-close-label = Закрити повноекранний режим

js-adv-max-expand = Розгорнути

js-adv-max-expand-label = Розгорнути цю панель на весь екран

js-adv-max-title = Показати цю панель на весь екран (Escape закриває її)

js-adv-meta-engine = рушій

js-adv-meta-file = файл

js-adv-meta-scenario = сценарій

js-adv-meta-seed = зерно (seed)

js-adv-meta-time = час

js-adv-mission-timeline = Хронологія місії

js-adv-native-edited-notice = { $why } Записаний прогін стосується вбудованого файлу, тож змінену копію тут показати не можна: запустіть її інструментом командного рядка або скористайтеся «Скинути», щоб побачити запис.

js-adv-native-notice-command = { $why } Ви бачите прогін, записаний нативним рушієм командного рядка v{ $version } командою { $command }, показаний без змін. Він не виконується знову під час редагування.

js-adv-native-notice-plain = { $why } Ви бачите прогін, записаний нативним рушієм командного рядка v{ $version }, показаний без змін. Він не виконується знову під час редагування.

js-adv-native-notice-platform = { $why } Ви бачите прогін, записаний нативним рушієм командного рядка v{ $version } ({ $platform }), показаний без змін. Він не виконується знову під час редагування.

js-adv-native-notice-platform-command = { $why } Ви бачите прогін, записаний нативним рушієм командного рядка v{ $version } ({ $platform }) командою { $command }, показаний без змін. Він не виконується знову під час редагування.

js-adv-needs-live-engine = Для цього потрібен живий рушій.

js-adv-needs-newer-engine-status = Потрібен новіший рушій.

js-adv-nees-line = NEES { $mean } (95% смуга { $low }–{ $high }, ціль 2.0)

js-adv-newer-engine-edited-notice = Цей сценарій потребує рушія { $need } або новішого; рушій, що працює тут, має версію v{ $version }. Можна показати лише запис вбудованого файлу: скористайтеся «Скинути», щоб побачити його, або запустіть змінену копію з рушієм { $need }.

js-adv-newer-engine-no-recording = Цей сценарій потребує рушія { $need } або новішого; рушій, що працює тут, має версію v{ $version }. Запису цього сценарію тут немає.

js-adv-newer-engine-shown-commit = Цей сценарій потребує рушія { $need } або новішого; рушій, що працює тут, має версію v{ $version }. Ви бачите прогін, записаний збіркою рушія з комітом { $commit }, показаний без змін; тут він не виконується знову.

js-adv-newer-engine-shown-version = Цей сценарій потребує рушія { $need } або новішого; рушій, що працює тут, має версію v{ $version }. Ви бачите прогін, записаний рушієм v{ $recorded }, показаний без змін; тут він не виконується знову.

js-adv-nis-line = NIS { $mean } (95% смуга { $low }–{ $high }, ціль 1.0)

js-adv-no-guided-controls = У цьому сценарії немає жодного з керованих елементів. Скористайтеся «Усі поля» або змініть вихідний текст.

js-adv-no-numeric-fields = Тут немає окремих числових полів для налаштування. Змініть вихідний текст безпосередньо.

js-adv-no-recorded-run = Для цього сценарію немає записаного прогону. Він потребує живого рушія.

js-adv-no-summary = (цей сценарій не публікує однорядкового підсумку)

js-adv-noise-floor = рівень шуму { $level }

js-adv-not-in-browser-status = Цей сценарій не виконується в браузері.

js-adv-open-and-run = Відкрити й запустити

js-adv-open-at-field = відкрити на цьому полі

js-adv-opened-from-simple = Відкрито із налаштуваннями, які ви змінили в простому поданні.

js-adv-optional-preset = необов'язковий пресет: scenarios/{ $file }

js-adv-orbit-canvas-label = Інтерактивне 3D-подання розрахованої траєкторії

js-adv-orbit-fallback-alt = Ортографічне подання розрахованої траєкторії

js-adv-orbit-note-epoch = Перетягніть, щоб обертати; прокрутіть або зведіть пальці, щоб масштабувати. Земля в масштабі, зображення NASA Blue Marble. Повернуто на епоху прогону.

js-adv-orbit-note-no-epoch = Перетягніть, щоб обертати; прокрутіть або зведіть пальці, щоб масштабувати. Земля в масштабі, зображення NASA Blue Marble. Цей прогін не вказує епохи, тому кут обертання Землі тут не має значення.

js-adv-orbit-static-note = Статичне подання (3D-бібліотеку тут не вдалося завантажити).

js-adv-pal-commands = Команди

js-adv-pal-domain = Область: { $name }

js-adv-pal-domains = Області

js-adv-pal-field = Поле: { $name }

js-adv-pal-fields = Поля

js-adv-pal-nothing = Нічого не знайдено

js-adv-pal-opens-page = відкриває сторінку

js-adv-pal-page = Сторінка: { $name }

js-adv-pal-pages = Сторінки

js-adv-pal-panel = Панель: { $name }

js-adv-pal-panels = Панелі

js-adv-pal-scenarios = Сценарії

js-adv-params-hint-all = Кожне окреме число в сценарії. Змінюйте його кроком, вводьте або користуйтеся стрілками; сценарій виконується знову.

js-adv-params-hint-guided = Перетягніть повзунок, і сценарій виконається знову. Кожен елемент керування записує значення прямо в текст сценарію нижче.

js-adv-pin-already = Цей прогін уже закріплено.

js-adv-pin-first = Прогін { $run } закріплено. Змініть параметр, запустіть знову, а потім закріпіть і той прогін.

js-adv-pin-label = { $letter } · { $title } · прогін { $run }

js-adv-pin-opening-compare =
    { $n ->
        [one] { $n } прогін закріплено. Відкриваю порівняння.
        [few] { $n } прогони закріплено. Відкриваю порівняння.
        [many] { $n } прогонів закріплено. Відкриваю порівняння.
       *[other] { $n } прогону закріплено. Відкриваю порівняння.
    }

js-adv-plan-view = Вигляд згори

js-adv-plan-view-epoch = на { $epoch }

js-adv-plan-view-note = Кожна крапка — це тіло в епоху прогону, а кожна крива — траса орбіти, яку для нього обчислив рушій. Пунктирна лінія — це лінія зв'язку, якої вимагає сценарій. Оберіть планету, щоб побачити її супутники навколо неї.

js-adv-player-name-mission = відтворення місії

js-adv-player-name-orbit = відтворення орбіти

js-adv-player-name-replay = відтворення

js-adv-player-name-waterfall = відтворення водоспаду

js-adv-player-pause = Призупинити: { $name }

js-adv-player-play = Відтворити: { $name }

js-adv-player-position = Позиція у відтворенні: { $name }

js-adv-png-download-title = Растрове зображення високої роздільності для слайдів і документів

js-adv-png-export-failed = Не вдалося експортувати PNG: { $reason }

js-adv-ready-live = Готово. Виконується локально у вашому браузері.

js-adv-ready-recorded = Готово. Показано записані прогони.

js-adv-receiver-at-time = Приймач при t = { $time }

js-adv-recorded-edit-notice = WebAssembly заблоковано на цій сторінці, тож вона показує справжні прогони вбудованих сценаріїв, записані рушієм v{ $version }. Змінені сценарії, перебори та нові експорти потребують живого рушія: відкрийте kshana.dev або віддайте цю теку локально. «Скинути» відновлює записаний сценарій.

js-adv-recorded-edited-warning = Ви змінили сценарій: цей запис стосується вбудованого файлу, а не вашої зміни. Запустіть команду на власному файлі, щоб отримати свій результат.

js-adv-recorded-intro = WebAssembly заблоковано на цій сторінці, тож вона показує справжні прогони вбудованих сценаріїв, записані рушієм v{ $version }. Редагування, перебори та нові експорти потребують живого рушія на kshana.dev.

js-adv-recorded-run-native = записаний прогін, нативний рушій

js-adv-recorded-written-by = Записано нативним рушієм командного рядка v{ $version } ({ $platform }) командою { $command }. Показано без змін.

js-adv-replay = Відтворення

js-adv-report-downloaded = Звіт завантажено.

js-adv-report-frame-title = Звіт про прогін, записаний рушієм

js-adv-report-html = Звіт (HTML)

js-adv-report-html-title = Файл звіту в тому вигляді, в якому його записав рушій

js-adv-report-load-failed = Не вдалося завантажити записаний звіт ({ $reason }).

js-adv-report-loading = Завантаження записаного звіту…

js-adv-report-none = Для цього сценарію немає записаного звіту.

js-adv-report-note = Кожен прогін командного рядка записує звіт: підсумок, вхідні дані, результати, діаграму, що перевірено і що змодельовано, та запис відтворюваності. Збірка для браузера не містить цього засобу запису, тож це звіт, який записав нативний рушій командного рядка для вбудованого сценарію. Власний звіт Studio про прогін на екрані — у розділі «Експорт».

js-adv-report-open-tab = Відкрити в новій вкладці

js-adv-report-open-tab-title = Відкрити звіт окремо

js-adv-report-orbit-title = Орбіта (земна інерціальна система, ортографічна)

js-adv-report-stability-chart = Стабільність годинника

js-adv-report-stability-title = Стабільність годинника (девіація Аллана)

js-adv-restored-run = Відновлено прогін { $run }.

js-adv-result = Результат

js-adv-run-cancelled = Прогін скасовано.

js-adv-run-cancelled-previous = Прогін скасовано. Попередній результат і далі показано.

js-adv-run-failed = Прогін не вдався. Див. повідомлення в результатах.

js-adv-scenario-copied = Сценарій скопійовано.

js-adv-scenarios-count =
    { $n ->
        [one] { $n } сценарій
        [few] { $n } сценарії
        [many] { $n } сценаріїв
       *[other] { $n } сценарію
    }

js-adv-share-link-copied = Посилання для поширення скопійовано. Воно містить точний сценарій.

js-adv-share-link-in-bar = Посилання розміщено в адресному рядку.

js-adv-shared-link = спільне посилання

js-adv-shared-needs-live = Це посилання містить власний сценарій, якому потрібен живий рушій. Відкрийте його на kshana.dev.

js-adv-shared-scenario = Спільний сценарій

js-adv-shared-scenario-question = Сценарій, відкритий за посиланням для поширення. Він виконується точно так, як його поширили.

js-adv-solar-bodies-label = Які тіла малювати

js-adv-spectrum-part-label = Яка частина спектра

js-adv-spectrum-row-note = Спектр уздовж рядка водоспаду, на якому перебуває відтворення.

js-adv-spectrum-row-title = Спектр уздовж показаного рядка

js-adv-start-field-meta = { $domain } · поле { $field }

js-adv-start-fields-hint = Кожне відкриває сценарій із підсвіченим елементом керування, готовим до зміни.

js-adv-start-fields-named =
    { $n ->
        [one] Поля з назвою, схожою на «{ $query }»: у { $n } сценарії
        [few] Поля з назвою, схожою на «{ $query }»: у { $n } сценаріях
        [many] Поля з назвою, схожою на «{ $query }»: у { $n } сценаріях
       *[other] Поля з назвою, схожою на «{ $query }»: у { $n } сценарії
    }

js-adv-start-more-matches =
    { $n ->
        [one] Ще { $n } збіг: додайте слово, щоб звузити.
        [few] Ще { $n } збіги: додайте слово, щоб звузити.
        [many] Ще { $n } збігів: додайте слово, щоб звузити.
       *[other] Ще { $n } збігу: додайте слово, щоб звузити.
    }

js-adv-start-nothing = Нічого не відповідає «{ $query }». Спробуйте слово на кшталт глушіння, годинник, місячний, орбіта, маска або PDOP.

js-adv-start-scenarios-count = Сценарії ({ $count })

js-adv-status-fetching-recorded = Завантаження рушія… Отримання записаного результату цього сценарію.

js-adv-status-ran-locally = Виконано локально о { $time }, прогін { $run }.

js-adv-status-ran-locally-secs = Виконано локально о { $time }, прогін { $run }, { $secs } s.

js-adv-status-recorded-native = Записаний прогін показано о { $time } (нативний рушій).

js-adv-status-recorded-needs-engine = Записаний прогін показано о { $time } (потрібен рушій { $need }).

js-adv-status-recorded-shown = Записаний прогін показано о { $time }, прогін { $run }.

js-adv-status-recorded-shown-secs = Записаний прогін показано о { $time }, прогін { $run }, { $secs } s.

js-adv-status-showing-recorded = Завантаження рушія… Показано записаний результат цього сценарію, доки живий рушій не буде готовий.

js-adv-subtabs-label = Плитки цього подання (телефон)

js-adv-suggest-campaign = Відтворити місію з глушінням, спуфінгом і holdover

js-adv-suggest-coverage = Побудувати карту покриття чотирьох орбітальних угруповань GNSS (глобальна навігаційна супутникова система)

js-adv-suggest-holdover = Утримання часу при втраті ГНСС

js-adv-suggest-waterfall = Спостерігати глушник на водоспаді діапазону L

js-adv-svg-download-title = Векторна діаграма із заголовком і походженням

js-adv-sweep-cancelled = Перебір скасовано.

js-adv-sweep-done-grid =
    { $total ->
        [one] Перебрано { $total } прогін ({ $columns } × { $rows }) локально за { $time }.
        [few] Перебрано { $total } прогони ({ $columns } × { $rows }) локально за { $time }.
        [many] Перебрано { $total } прогонів ({ $columns } × { $rows }) локально за { $time }.
       *[other] Перебрано { $total } прогону ({ $columns } × { $rows }) локально за { $time }.
    }

js-adv-sweep-done-line =
    Перебрано { $done } із { $total ->
        [one] { $total } прогону
        [few] { $total } прогонів
        [many] { $total } прогонів
       *[other] { $total } прогонів
    } локально за { $time }.

js-adv-sweep-enter-range = Введіть числовий діапазон.

js-adv-sweep-enter-range-second = Введіть числовий діапазон для другого параметра.

js-adv-sweep-failed = Перебір не вдався: { $reason }

js-adv-sweep-interrupted = Перебір перервано новим прогоном.

js-adv-sweep-needs-live = Перебір багаторазово запускає рушій, тому потребує живого рушія.

js-adv-sweep-none-line-chart = Немає (лінійна діаграма)

js-adv-sweep-nothing = Для цього сценарію немає чого перебирати.

js-adv-sweep-progress = Перебір прогону { $n } із { $total }…

js-adv-sweep-status-done =
    { $total ->
        [one] Перебрано { $total } прогін о { $time }.
        [few] Перебрано { $total } прогони о { $time }.
        [many] Перебрано { $total } прогонів о { $time }.
       *[other] Перебрано { $total } прогону о { $time }.
    }

js-adv-sweep-title-grid = { $metric } залежно від { $first } і { $second }

js-adv-sweep-title-line = { $metric } залежно від { $parameter }

js-adv-sweep-wait = Дочекайтеся завершення поточного прогону, а потім запустіть перебір.

js-adv-tab-animation = Анімація

js-adv-tab-compare = Порівняння

js-adv-tab-engine-report = Звіт рушія

js-adv-tab-exports-report = Експорт і звіт

js-adv-tab-ground-track = Траса на поверхні

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = Орбіта 3D

js-adv-tab-overview = Огляд

js-adv-tab-signal-band = Сигнал і смуга

js-adv-tab-stability = Стабільність

js-adv-tab-sweep = Перебір

js-adv-tab-time-series = Часовий ряд

js-adv-tab-timing-masks = Маски синхронізації

js-adv-th-at-tau-or-time = При τ або часі

js-adv-th-body = Тіло

js-adv-th-clock = Годинник

js-adv-th-distance-sun = Відстань від Сонця

js-adv-th-figure = Показник

js-adv-th-file = Файл

js-adv-th-format = Формат

js-adv-th-key-figure = Ключовий показник

js-adv-th-light-time-from = Односторонній час проходження світла від { $observer }

js-adv-th-light-time-observer = Односторонній час проходження світла від спостерігача

js-adv-th-limit = Межа

js-adv-th-margin = Запас

js-adv-th-mask-or-budget = Маска або бюджет

js-adv-th-metric = Метрика

js-adv-th-orbital-period = Орбітальний період

js-adv-th-provenance = Походження

js-adv-th-size = Розмір

js-adv-th-source = Джерело

js-adv-th-tier = Рівень

js-adv-th-unit = Одиниця

js-adv-th-value = Значення

js-adv-th-verdict = Вердикт

js-adv-th-what-it-is = Що це

js-adv-the-body = тіло

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } сценарій
        [few] { $n } сценарії
        [many] { $n } сценаріїв
       *[other] { $n } сценарію
    }

js-adv-timeline-chart-title = Хронологія місії: { $title }

js-adv-timeline-latest-event = Остання подія, о { $time }: { $label }

js-adv-timeline-no-event = Поки що немає подій на цей момент.

js-adv-timeline-note = Один повзунок керує кожною діаграмою нижче. Кожна фаза виконує звичайні сценарії; кампанія зводить їхні виходи на одну часову сітку. Затінені смуги — це фази, вертикальні лінії — події. Значення вгорі — це канали кампанії в момент відтворення.

js-adv-timeline-on-one-clock = { $duration } на одному годиннику

js-adv-timeline-phase = Фаза: { $phase }

js-adv-tour-back = Назад

js-adv-tour-done = Готово

js-adv-tour-eyebrow = Екскурсія

js-adv-tour-headline-body = Однорядковий підсумок, версія рушія та відбиток сценарію, а також те, чи кожен показник перевірено, чи змодельовано.

js-adv-tour-headline-title = Прочитайте відповідь

js-adv-tour-keyboard-body = ⌘K знаходить будь-який сценарій, подання чи команду. [ і ] перемикають між поданнями.

js-adv-tour-keyboard-title = Усе з клавіатури

js-adv-tour-library-body = Кожен вбудований сценарій, згрупований за областю місій: глушіння, спектр, спуфінг, годинники, навігація, цілісність, орбіти, проєктування орбітального угруповання, навігація на низькій навколоземній орбіті, кампанії, Місяць, Марс і Сонячна система. Шукайте за допомогою /.

js-adv-tour-library-title = Оберіть місію

js-adv-tour-next = Далі

js-adv-tour-params-body = Керовані повзунки для поширених параметрів або кожне числове поле сценарію. Кожна зміна запускає сценарій знову.

js-adv-tour-params-title = Налаштуйте

js-adv-tour-pin-body = Закріпіть до чотирьох прогонів і перегляньте їх поруч, із різницями та кривою різниці.

js-adv-tour-pin-title = Порівняйте прогони

js-adv-tour-run-body = Рушій на Rust виконується у вашому браузері як WebAssembly. Нічого не завантажується на сервер. ⌘↵ запускає звідусіль.

js-adv-tour-run-title = Запустіть локально

js-adv-tour-share-body = Завантажте звіт, результат, сценарій та експорти рушія, або скопіюйте посилання, що містить точний сценарій, або iframe для сторінки курсу чи вікі.

js-adv-tour-share-title = Поділіться або експортуйте

js-adv-tour-skip = Пропустити

js-adv-tour-source-body = Повний сценарій у TOML. Те, що ви запускаєте, — це саме те, чим можна поділитися й що можна відтворити.

js-adv-tour-source-title = Або змінюйте що завгодно

js-adv-tour-tabs-body = Подання з'являються, коли результат їх підтримує: сигнал і смуга для глушіння, водоспад для спектра, хронологія місії для кампаній, карти покриття для орбітальних угруповань, holdover для годинників, маски для телекомунікаційної синхронізації, орбіти 3D, траси на поверхні, перебори, а також власна анімація і звіт рушія.

js-adv-tour-tabs-title = Кожне подання прогону

js-adv-tracking-threshold-value = Поріг супроводження { $value }

js-adv-transport-label = Відтворення: один повзунок керує кожною панеллю цього прогону

js-adv-transport-sub = один повзунок керує кожною панеллю цього прогону

js-adv-unpin-run = Відкріпити прогін { $run }

js-adv-waterfall = Водоспад

js-adv-waterfall-note = Колір — це потужність над рівнем шуму приймача. Навігаційні сигнали лежать нижче цього рівня, тож світяться глушники. Відтворіть або перетягніть, і смуги праворуч покажуть, що приймач ще супроводжує в цей момент.

js-adv-waterfall-sub = спектральна густина потужності: частота по горизонталі, час донизу

js-adv-waterfall-title = Водоспад, { $name }

js-adv-webassembly-unavailable = WebAssembly недоступний

js-app-all-questions = Усі запитання

js-app-anim-frame-title = Анімація цього прогону, записана рушієм

js-app-anim-html-player = Програвач HTML

js-app-anim-html-player-title = Однофайловий програвач у тому вигляді, в якому його записав рушій

js-app-anim-load-failed = Не вдалося завантажити записану анімацію ({ $reason }).

js-app-anim-loading = Завантаження записаної анімації…

js-app-anim-none = Для цього сценарію немає записаної анімації.

js-app-anim-note = Рушій записує анімацію будь-якого прогону, що має часову вісь: самовідтворюваний SVG і однофайловий програвач HTML з власними елементами керування відтворенням і перемотуванням. Збірка для браузера не містить цього засобу запису, тож це файл, який записав нативний рушій командного рядка для вбудованого сценарію.

js-app-anim-svg = Анімований SVG

js-app-anim-svg-title = Самовідтворюваний SVG у тому вигляді, в якому його записав рушій

js-app-axis-averaging-time = час усереднення τ (s)

js-app-axis-observation-interval = інтервал спостереження τ (s)

js-app-axis-value = значення

js-app-badge-modelled = { $n } змодельовано

js-app-badge-recorded = Записано

js-app-badge-validated = { $n } перевірено

js-app-band-carrier = Несівна

js-app-band-carrier-unset = не задано в цьому сценарії

js-app-band-chip-rate = Чипова швидкість

js-app-band-jammer-bandwidth = Смуга глушника

js-app-band-jammer-mhz = глушник { $mhz } MHz

js-app-band-jammer-power = Потужність глушника

js-app-band-jammer-type = Тип глушника

js-app-band-main-lobe = головна пелюстка сигналу

js-app-band-no-carrier-note = Рушій обчислює відношення глушник/сигнал за енергетичним бюджетом лінії. Цей сценарій не називає частоти несівної, тому спектр не будується.

js-app-band-satellites = Супутники

js-app-band-svg-label = Смуги сигналу та глушника навколо несівної

js-app-band-tracking-threshold = Поріг супроводження

js-app-browse-all-title = Усі сценарії ({ $n })

js-app-browse-area-kicker =
    { $n ->
        [one] Область · { $n } сценарій
        [few] Область · { $n } сценарії
        [many] Область · { $n } сценаріїв
       *[other] Область · { $n } сценарію
    }

js-app-browse-area-lede = Оберіть один: він одразу відкривається на своєму результаті.

js-app-browse-evidence = У матриці верифікації для методів рушія, які виконують його сценарії: перевірених рядків — { $validated }, змодельованих — { $modelled }.

js-app-browse-evidence-title = Докази, що стоять за цією областю.

js-app-browse-kicker = Огляд

js-app-browse-lede = Шукайте або оберіть область. Кожен сценарій одразу відкривається на своєму результаті.

js-app-browse-validated-examples = Перевірено, наприклад: { $examples }.

js-app-browser-cannot-run = Збірка для браузера не може запустити цей сценарій.

js-app-btn-all-exports = Усі експорти

js-app-btn-all-exports-title = Кожен експорт цього прогону, зокрема власні формати рушія

js-app-btn-compare-pinned = Порівняти закріплені прогони

js-app-btn-copy-embed = Скопіювати код вбудовування

js-app-btn-copy-link = Скопіювати посилання на цей точний сценарій

js-app-btn-figure-png = Рисунок (PNG)

js-app-btn-figure-png-title = Діаграма на екрані як растрове зображення високої роздільності

js-app-btn-figure-svg = Рисунок (SVG)

js-app-btn-figure-svg-title = Діаграма на екрані із заголовком, версією рушія та DOI

js-app-btn-pin-compare = Закріпити цей прогін для порівняння

js-app-btn-pin-count = Закріпити цей прогін (закріплено: { $n })

js-app-btn-report-html = Відтворюваний звіт (HTML)

js-app-btn-report-html-title = Один автономний файл: підсумок, показники з рівнями, діаграми та точний сценарій

js-app-btn-result-json = Дані результату (JSON)

js-app-btn-result-json-title = Повний вихід рушія для цього прогону

js-app-btn-run-history = Історія прогонів

js-app-btn-scenario-toml = Файл сценарію (TOML)

js-app-btn-scenario-toml-title = Точні вхідні дані цього прогону

js-app-btn-table-csv = Таблиця (CSV)

js-app-btn-table-csv-title = Ті самі байти, які інструмент командного рядка записує як { $file }

js-app-bytes =
    { $n ->
        [one] { $n } байт
        [few] { $n } байти
        [many] { $n } байтів
       *[other] { $n } байта
    }

js-app-cap-sub = Областей: { $areas }, готових до запуску сценаріїв: { $total }. Кожна область показує справжній записаний результат і склад доказів за ним: частку методів її рушія, перевірених за зовнішнім еталоном.

js-app-chain-hint = вихід кожного етапу подається на наступний

js-app-chain-note = Одна система, простежена крізь кожен етап рушія. У таблиці нижче перелічено кожне число, яке обчислив етап і яке використав наступний.

js-app-chain-stage = Етап { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } значення передано далі
        [few] { $n } значення передано далі
        [many] { $n } значень передано далі
       *[other] { $n } значення передано далі
    }

js-app-chart-allan-deviation = Девіація Аллана

js-app-chart-cn0-by-satellite = Ефективне C/N0 за супутниками

js-app-chart-default-title = Діаграма Kshana

js-app-chart-ground-track = Траса на поверхні

js-app-chart-holdover-title = Holdover відносно бюджету синхронізації

js-app-chart-mtie-title = MTIE (максимальна похибка часового інтервалу)

js-app-chart-not-drawn = Цю діаграму не вдалося побудувати.

js-app-chart-scenario-hash = сценарій { $hash }

js-app-chart-stability-title = Стабільність годинника (перекривна девіація Аллана)

js-app-chart-tdev-title = TDEV (девіація часу)

js-app-chip-failed-title = WebAssembly тут не вдалося запустити. Показано справжні записані прогони вбудованих сценаріїв.

js-app-chip-failed-title-reason = WebAssembly тут не вдалося запустити ({ $reason }). Показано справжні записані прогони вбудованих сценаріїв.

js-app-chip-live = Живий рушій · v{ $version }

js-app-chip-live-title = Рушій Kshana працює в цьому браузері як WebAssembly

js-app-chip-loading = Завантаження рушія

js-app-chip-loading-title = Рушій завантажується. Тим часом показано записані результати.

js-app-chip-recorded = Записані прогони · v{ $version }

js-app-chip-unavailable = Рушій недоступний

js-app-cli-note = Встановіть за допомогою { $command }. Прогін записує { $file }, діаграму та звіт.

js-app-cli-only-title = Цей виконується в командному рядку, а не в браузері.

js-app-cli-save-comment = # збережіть файл сценарію нижче як { $file }, а потім

js-app-cmd-advanced = Показати кожне налаштування (розширені налаштування)

js-app-cmd-browse = Переглянути всі сценарії

js-app-cmd-compare = Порівняти закріплені прогони

js-app-cmd-embed = Скопіювати код вбудовування

js-app-cmd-exports = Завантажити результати (експорт)

js-app-cmd-history = Відкрити історію прогонів

js-app-cmd-home = Перейти на початковий екран

js-app-cmd-how = Як це обчислюється

js-app-cmd-pin = Закріпити цей прогін для порівняння

js-app-cmd-report = Завантажити звіт

js-app-cmd-research = Код, дані та цитування (для дослідників)

js-app-cmd-reset = Скинути текст сценарію

js-app-cmd-run = Запустити сценарій

js-app-cmd-share = Скопіювати посилання для поширення

js-app-cmd-theme = Перемкнути світлу або темну тему

js-app-cmd-tour = Почати екскурсію

js-app-compare-deltas = Різницю подано щодо прогону A. Зелений позначає краще значення для кожного показника.

js-app-compare-none = Ці прогони не мають спільних показників якості, які можна порівняти. Закріпіть прогони однієї родини сценаріїв, щоб побачити числа й різницю.

js-app-compare-pin-two = Закріпіть щонайменше два прогони, щоб порівняти їх поруч. Закріпіть прогін, змініть параметр або оберіть інший сценарій тієї самої родини, запустіть його й закріпіть знову.

js-app-compare-run-head = { $letter } · прогін { $id }

js-app-coverage-cell-note = Кожна комірка — це одна точка сітки на { $body }, оцінена за кожну епоху прогону.

js-app-coverage-dots-of = із

js-app-coverage-dots-post = супутників, прокладених уздовж їхніх трас на поверхні; запустіть відтворення, щоб їх рухати.

js-app-coverage-dots-pre = Крапки — це

js-app-coverage-field-label = Поле для карти

js-app-coverage-map = Карта покриття

js-app-coverage-map-select = Карта

js-app-coverage-over = над

js-app-coverage-title = { $field } над { $body }

js-app-crumb-all-scenarios = Усі сценарії

js-app-crumb-area = Область

js-app-crumb-search = Пошук: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Завантажити

js-app-edited-cli-only = Змінено: цей сценарій виконується лише в рушії командного рядка.

js-app-edited-needs-engine = Змінено: потрібен рушій { $need }.

js-app-edited-needs-live = Змінені сценарії потребують живого рушія.

js-app-embed-copied = Код вбудовування скопійовано.

js-app-engine-chart = Діаграма рушія

js-app-engine-chart-alt = Діаграма рушія для цього прогону

js-app-engine-could-not-start = Рушій не вдалося запустити: { $reason }. Віддайте цю теку через HTTP (наприклад, { $command }), а не відкривайте файл напряму.

js-app-engine-failed = Рушій не вдалося завантажити ({ $reason }).

js-app-engine-file-http = Файл рушія повернув HTTP { $status }.

js-app-engine-no-recordings = Рушій не вдалося завантажити ({ $reason }), і записаних прогонів не знайдено.

js-app-entries-count =
    { $n ->
        [one] { $n } запис
        [few] { $n } записи
        [many] { $n } записів
       *[other] { $n } запису
    }

js-app-ev-aria = Рядків матриці верифікації: перевірених — { $validated }, змодельованих — { $modelled }

js-app-ev-title = Рядків у матриці верифікації: перевірених — { $validated } · змодельованих — { $modelled }

js-app-ev-validated = перевірено

js-app-export-card-title = Експорт { $format }

js-app-export-checking = Перевірка, у яких форматах ефемерид можна експортувати цей прогін…

js-app-export-csv-desc = Ті самі байти, які інструмент командного рядка записує як { $file }.

js-app-export-csv-title = Таблиця відтворюваності

js-app-export-engine-loading = Експорт ефемерид з'явиться тут, коли рушій завантажиться.

js-app-export-json-desc = Повний вихід рушія для цього прогону, разом з одиницями та походженням.

js-app-export-json-title = Повний документ результату

js-app-export-not-recorded = Цей експорт великий, тому його не записано. Він потребує живого рушія.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) для GMAT, Orekit або STK

js-app-export-omm-desc = Каталог CCSDS OMM (Orbit Mean-elements Message)

js-app-export-report-desc = Один автономний файл: підсумок, показники з їхніми рівнями, кожна діаграма й точний текст сценарію, позначені версією рушія та хешем сценарію.

js-app-export-report-title = Відтворюваний звіт

js-app-export-sp3-desc = Точні ефемериди SP3-c цього орбітального угруповання

js-app-export-toml-desc = Точні вхідні дані цього прогону. Запустіть його знову будь-де за допомогою інструмента командного рядка або пакетів Python і npm.

js-app-export-toml-title = Файл сценарію

js-app-export-too-large = { $desc }. Завеликий для запису: потребує живого рушія.

js-app-fields-more = ще { $n }

js-app-fields-none = немає

js-app-fields-none-hint = Тут немає інших окремих чисел для зміни. Змініть файл у розділі «Для дослідників».

js-app-fields-top-of-file = початок файлу

js-app-find-matches =
    { $n ->
        [one] { $n } кероване поле та { $m } з { $total } полів відповідають «{ $query }».
        [few] { $n } кероване поле та { $m } з { $total } полів відповідають «{ $query }».
        [many] { $n } керованих елементів і { $m } з { $total } полів відповідають «{ $query }».
       *[other] { $n } керованого елемента і { $m } з { $total } полів відповідають «{ $query }».
    }

js-app-find-none = Жодне поле цього сценарію не відповідає «{ $query }». Шукайте в усіх сценаріях через пошук у бібліотеці.

js-app-geo-sub = { $name } · намальовано { $features } із { $total } об'єктів · записано нативним рушієм

js-app-geojson-title = Експорт GeoJSON: { $name }

js-app-gt-highlighted = Виділено: супутник, видимий зі станції.

js-app-gt-peak-doppler = Піковий доплерівський зсув { $value } Hz.

js-app-gt-peak-elevation = Піковий кут над горизонтом { $value }°.

js-app-health-check-tuning = перевірте налаштування

js-app-health-consistent = узгоджено

js-app-health-nees-band = NEES { $mean } (95% смуга { $lo }–{ $hi }, ціль 2.0)

js-app-health-nis-band = NIS { $mean } (95% смуга { $lo }–{ $hi }, ціль 1.0)

js-app-heat-map-label = Теплова карта: { $metric }

js-app-hero-clock = { $elapsed } із { $total }

js-app-hero-mask = маска висоти { $deg }°

js-app-hero-places =
    { $n ->
        [one] { $n } місце
        [few] { $n } місця
        [many] { $n } місць
       *[other] { $n } місця
    }

js-app-hero-positions-only = Лише положення супутників: без потужності сигналу, стану супутників чи рельєфу.

js-app-hero-ramp = від { $lo } до { $hi } { $field }

js-app-hero-ramp-over = від { $lo } до { $hi } { $field }, протягом { $duration }

js-app-hero-recorded-bare = Записаний результат

js-app-hero-satellites =
    { $n ->
        [one] { $n } супутник
        [few] { $n } супутники
        [many] { $n } супутників
       *[other] { $n } супутника
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } часовий крок
        [few] { $n } часові кроки
        [many] { $n } часових кроків
       *[other] { $n } часового кроку
    }

js-app-hist-runs =
    { $n ->
        [one] { $n } прогін.
        [few] { $n } прогони.
        [many] { $n } прогонів.
       *[other] { $n } прогону.
    }

js-app-history-pin = Закріпити

js-app-history-restore = Відновити

js-app-history-restored = Відновлено прогін { $id }.

js-app-history-run = прогін { $id } · { $time }

js-app-hit-in-scenario = у { $title }

js-app-hit-native-note = записаний прогін, нативний рушій

js-app-hit-setting-meta = { $area } · налаштування { $name }

js-app-ho-budget = бюджет

js-app-ho-engine-budget = Holdover рушія при бюджеті сценарію ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Holdover рушія при бюджеті сценарію: { $duration }

js-app-ho-error-after-loss = похибка після втрати ГНСС при t = { $t } s

js-app-ho-error-since-fix = похибка від останнього визначення положення

js-app-ho-stays-inside = залишається в межах цього бюджету протягом усього запису

js-app-ho-until-breached = доки бюджет не буде порушено

js-app-hover-classical = класичний

js-app-hover-quantum = квантовий

js-app-how-checks = (перевіряє: { $requirement })

js-app-how-matrix = У матриці верифікації для методів рушія, які виконує цей сценарій: перевірених рядків — { $validated }, змодельованих — { $modelled }:

js-app-how-matrix-partner = У матриці верифікації для методів рушія, які виконує цей сценарій: перевірених рядків — { $validated }, змодельованих — { $modelled }, а рядків, що належать партнерам, — { $partner }:

js-app-how-mix-chip = { $validated } перевірено · { $modelled } змодельовано

js-app-how-more-notes =
    { $n ->
        [one] Ще { $n } примітка з файлу сценарію
        [few] Ще { $n } примітки з файлу сценарію
        [many] Ще { $n } приміток з файлу сценарію
       *[other] Ще { $n } примітки з файлу сценарію
    }

js-app-how-more-rows =
    { $n ->
        [one] Ще { $n } рядок у матриці верифікації (сторінка «Докази» сайту).
        [few] Ще { $n } рядки в матриці верифікації (сторінка «Докази» сайту).
        [many] Ще { $n } рядків у матриці верифікації (сторінка «Докази» сайту).
       *[other] Ще { $n } рядка в матриці верифікації (сторінка «Докази» сайту).
    }

js-app-how-no-header = Файл цього сценарію не має вступної примітки. Підсумок рушія нижче каже, що було запущено.

js-app-how-no-matrix-row = Жоден рядок матриці верифікації ще не називає вид рушія цього сценарію.

js-app-how-no-sources = Файл сценарію не наводить джерел, і жоден перевірений рядок матриці не охоплює його вид.

js-app-how-own-label = Власна позначка цього прогону: { $label }

js-app-how-per-figure = За показниками, з блоку figure_tiers рушія: перевірено — { $validated }, змодельовано — { $modelled }. Рівень кожного показника наведено в поданні «Огляд».

js-app-install-copy = Скопіювати: { $command }

js-app-install-label = Встановити v{ $version }

js-app-interop-no-file = Рушій не записав файлу цього формату для цього прогону.

js-app-interop-not-apply = Не стосується цього сценарію: { $reason }.

js-app-interop-not-bundled = Тут не вбудовано (через розмір): його записує команда вище.

js-app-interop-note = Рушій записує геометрію та відліки сигналу прогону у форматах, які відкривають інші інструменти: CZML для Cesium, KML (Keyhole Markup Language) для Google Earth, GeoJSON для карт, файли ефемерид STK (.e) і записи SigMF (Signal Metadata Format). Збірка для браузера не містить цих засобів запису, тож файли нижче — це ті, що записав нативний рушій командного рядка для вбудованого сценарію.

js-app-job-running = Виконується

js-app-job-sweeping = Перебір

js-app-js-range-label = діапазон J/S

js-app-js-range-value = від { $lo } до { $hi } dB

js-app-latest-event-at = Остання подія, о

js-app-legend-all = можливостей рушія перевірено за всією матрицею верифікації; { $modelled } змодельовано, а { $partner } належать партнерам.

js-app-legend-count = { $validated } з { $total }

js-app-load-failed = Не вдалося завантажити { $file }.

js-app-mask-envelope = Огинаюча похибки часу в holdover ({ $source })

js-app-mask-exceeded-after = перевищено через { $duration }

js-app-mask-limit = межа { $value } ns

js-app-mask-not-exceeded = не перевищено

js-app-meta-engine = рушій

js-app-meta-file = файл

js-app-meta-scenario = сценарій

js-app-meta-seed = зерно (seed)

js-app-meta-shared-link = спільне посилання

js-app-meta-time = час

js-app-mission-timeline = Хронологія місії

js-app-native-edited-notice = Записаний прогін стосується вбудованого файлу, тож змінену копію тут показати не можна: запустіть її інструментом командного рядка або скористайтеся «Скинути», щоб побачити запис.

js-app-native-recorded = Ви бачите прогін, записаний нативним рушієм командного рядка v{ $version }, показаний без змін. Він не виконується знову під час редагування.

js-app-native-recorded-c = Ви бачите прогін, записаний нативним рушієм командного рядка v{ $version } командою { $command }, показаний без змін. Він не виконується знову під час редагування.

js-app-native-recorded-p = Ви бачите прогін, записаний нативним рушієм командного рядка v{ $version } ({ $platform }), показаний без змін. Він не виконується знову під час редагування.

js-app-native-recorded-pc = Ви бачите прогін, записаний нативним рушієм командного рядка v{ $version } ({ $platform }) командою { $command }, показаний без змін. Він не виконується знову під час редагування.

js-app-needs-live-engine = Для цього потрібен живий рушій.

js-app-needs-newer-engine = Потрібен новіший рушій.

js-app-needs-newer-why = Цей сценарій потребує рушія { $need } або новішого; рушій, що працює тут, має версію v{ $version }.

js-app-no-chart-export = У цьому поданні немає діаграми для експорту.

js-app-no-event-yet = Поки що немає подій на цей момент.

js-app-no-recorded-run = Для цього сценарію немає записаного прогону. Він потребує живого рушія.

js-app-no-recording-here = Запису цього сценарію тут немає.

js-app-no-summary = (цей сценарій не публікує однорядкового підсумку)

js-app-noise-floor = рівень шуму { $value }

js-app-not-in-browser = Цей сценарій не виконується в браузері.

js-app-notice-shared-needs-live = Це посилання містить власний сценарій, якому потрібен живий рушій. Відкрийте його на kshana.dev.

js-app-on-one-clock = на одному годиннику

js-app-only-bundled-recording = Можна показати лише запис вбудованого файлу: скористайтеся «Скинути», щоб побачити його, або запустіть змінену копію з рушієм { $need }.

js-app-opening-result = Відкриття результату…

js-app-orbit-canvas-label = Інтерактивне 3D-подання розрахованої траєкторії

js-app-orbit-epoch-set = Повернуто на епоху прогону.

js-app-orbit-epoch-unset = Цей прогін не вказує епохи, тому кут обертання Землі тут не має значення.

js-app-orbit-img-alt = Ортографічне подання розрахованої траєкторії

js-app-orbit-note = Перетягніть, щоб обертати; прокрутіть або зведіть пальці, щоб масштабувати. Земля в масштабі, зображення NASA Blue Marble.

js-app-orbit-static = Статичне подання (3D-бібліотеку тут не вдалося завантажити).

js-app-overlay-note = Суцільні лінії — прогін A, пунктирні — прогін B, на тих самих осях.

js-app-overlay-pinned = Накладення закріплених прогонів

js-app-overlay-title = { $title }: прогін { $a } (A) проти прогону { $b } (B)

js-app-overlay-with-diff = Накладення з різницею B − A

js-app-pal-area = Область: { $label }

js-app-pal-nothing = Нічого не знайдено

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } сценарій
        [few] { $n } сценарії
        [many] { $n } сценаріїв
       *[other] { $n } сценарію
    }

js-app-pal-sec-areas = Області

js-app-pal-sec-commands = Команди

js-app-pal-sec-scenarios = Сценарії

js-app-pal-sec-settings = Налаштування

js-app-pal-sec-views = Подання

js-app-pal-setting = Налаштування: { $label }

js-app-pal-view = Подання: { $label }

js-app-panel-close = Закрити

js-app-panel-close-full = Закрити повноекранний режим

js-app-panel-expand = Розгорнути

js-app-panel-expand-full = Розгорнути цю панель на весь екран

js-app-panel-expand-title = Показати цю панель на весь екран (Escape закриває її)

js-app-params-hint = Змініть значення, а потім запустіть знову. Відповідь і діаграма оновлюються на місці.

js-app-phase = Фаза:

js-app-pin-already = Цей прогін уже закріплено.

js-app-pin-compare =
    { $n ->
        [one] { $n } прогін закріплено. Відкриваю порівняння.
        [few] { $n } прогони закріплено. Відкриваю порівняння.
        [many] { $n } прогонів закріплено. Відкриваю порівняння.
       *[other] { $n } прогону закріплено. Відкриваю порівняння.
    }

js-app-pin-first = Прогін { $id } закріплено. Змініть параметр, запустіть знову, а потім закріпіть і той прогін.

js-app-pin-label = { $letter } · { $title } · прогін { $id }

js-app-plan-view = Вигляд згори

js-app-plan-view-at = на

js-app-player-pause = Призупинити відтворення

js-app-player-pause-mission = Призупинити відтворення місії

js-app-player-pause-orbit = Призупинити відтворення орбіти

js-app-player-pause-waterfall = Призупинити відтворення водоспаду

js-app-player-play = Відтворити

js-app-player-play-mission = Відтворити місію

js-app-player-play-orbit = Відтворити орбіту

js-app-player-play-waterfall = Відтворити водоспад

js-app-player-position = Позиція у відтворенні

js-app-player-position-mission = Позиція у відтворенні місії

js-app-player-position-orbit = Позиція у відтворенні орбіти

js-app-player-position-waterfall = Позиція у відтворенні водоспаду

js-app-png-button-title = Растрове зображення високої роздільності для слайдів і документів

js-app-png-export-failed = Не вдалося експортувати PNG: { $reason }

js-app-py-note = Встановіть за допомогою { $command }.

js-app-ran-locally = Виконано локально о { $time }, прогін { $n }.

js-app-ran-locally-took = Виконано локально о { $time }, прогін { $n }, { $took } s.

js-app-receiver-at = Приймач при t =

js-app-recorded-edit-notice = WebAssembly заблоковано на цій сторінці, тож вона показує справжні прогони вбудованих сценаріїв, записані рушієм v{ $version }. Змінені сценарії, перебори та нові експорти потребують живого рушія: відкрийте kshana.dev або віддайте цю теку локально. «Скинути» відновлює записаний сценарій.

js-app-recorded-intro = WebAssembly заблоковано на цій сторінці, тож вона показує справжні прогони вбудованих сценаріїв, записані рушієм v{ $version }. Редагування, перебори та нові експорти потребують живого рушія на kshana.dev.

js-app-recorded-shown-native = Записаний прогін показано о { $time } (нативний рушій).

js-app-recorded-shown-needs = Записаний прогін показано о { $time } (потрібен рушій { $need }).

js-app-recorded-shown-run = Записаний прогін показано о { $time }, прогін { $n }.

js-app-recorded-shown-took = Записаний прогін показано о { $time }, прогін { $n }, { $took } s.

js-app-recorded-with-commit = Ви бачите прогін, записаний збіркою рушія з комітом { $commit }, показаний без змін; тут він не виконується знову.

js-app-recorded-with-engine = Ви бачите прогін, записаний рушієм v{ $version }, показаний без змін; тут він не виконується знову.

js-app-recording-edited-warning = Ви змінили сценарій: цей запис стосується вбудованого файлу, а не вашої зміни. Запустіть команду на власному файлі, щоб отримати свій результат.

js-app-replay = Відтворення

js-app-report-downloaded = Звіт завантажено.

js-app-report-frame-title = Звіт про прогін, записаний рушієм

js-app-report-html = Звіт (HTML)

js-app-report-html-title = Файл звіту в тому вигляді, в якому його записав рушій

js-app-report-load-failed = Не вдалося завантажити записаний звіт ({ $reason }).

js-app-report-loading = Завантаження записаного звіту…

js-app-report-none = Для цього сценарію немає записаного звіту.

js-app-report-note = Кожен прогін командного рядка записує звіт: підсумок, вхідні дані, результати, діаграму, що перевірено і що змодельовано, та запис відтворюваності. Збірка для браузера не містить цього засобу запису, тож це звіт, який записав нативний рушій командного рядка для вбудованого сценарію. Власний звіт Studio про прогін на екрані — у розділі «Експорт».

js-app-report-open-tab = Відкрити в новій вкладці

js-app-report-open-tab-title = Відкрити звіт окремо

js-app-report-orbit-title = Орбіта (земна інерціальна система, ортографічна)

js-app-report-stability-short = Стабільність годинника

js-app-report-stability-title = Стабільність годинника (девіація Аллана)

js-app-run-again = Запустити знову

js-app-run-cancelled = Прогін скасовано.

js-app-run-cancelled-previous = Прогін скасовано. Попередній результат і далі показано.

js-app-run-failed = Прогін не вдався. Див. повідомлення в результатах.

js-app-run-when-ready = Запустити, коли рушій буде готовий

js-app-run-will-run = Запуститься, коли рушій буде готовий

js-app-run-with-settings = Запустити з цими налаштуваннями

js-app-search-more-matches =
    { $n ->
        [one] Ще { $n } збіг: додайте слово, щоб звузити.
        [few] Ще { $n } збіги: додайте слово, щоб звузити.
        [many] Ще { $n } збігів: додайте слово, щоб звузити.
       *[other] Ще { $n } збігу: додайте слово, щоб звузити.
    }

js-app-search-nothing = Нічого не відповідає «{ $query }». Спробуйте слово на кшталт глушіння, годинник, місячний, орбіта, маска або PDOP.

js-app-search-scenarios = Сценарії ({ $n })

js-app-search-settings =
    { $n ->
        [one] Налаштування з назвою, схожою на «{ $query }»: у { $n } сценарії
        [few] Налаштування з назвою, схожою на «{ $query }»: у { $n } сценаріях
        [many] Налаштування з назвою, схожою на «{ $query }»: у { $n } сценаріях
       *[other] Налаштування з назвою, схожою на «{ $query }»: у { $n } сценарії
    }

js-app-search-settings-hint = Кожне відкриває сценарій із підсвіченим налаштуванням, готовим до зміни.

js-app-share-copied = Посилання для поширення скопійовано. Воно містить точний сценарій.

js-app-share-in-address-bar = Посилання розміщено в адресному рядку.

js-app-share-link-sub = Він виконується точно так, як його поширили.

js-app-share-link-title = Сценарій, відкритий за посиланням для поширення

js-app-shared-scenario = Спільний сценарій

js-app-shown-unchanged = Показано без змін.

js-app-solar-note = Кожна крапка — це тіло в епоху прогону, а кожна крива — траса орбіти, яку для нього обчислив рушій. Пунктирна лінія — це лінія зв'язку, якої вимагає сценарій. Оберіть планету, щоб побачити її супутники навколо неї.

js-app-solar-which-bodies = Які тіла малювати

js-app-source-live = Живий результат · рушій v{ $version }

js-app-source-native = Записаний результат, нативний рушій · v{ $version }

js-app-source-recorded = Записаний результат · v{ $version }

js-app-source-recorded-loading = Записаний результат · v{ $version } · завантаження рушія

js-app-spectrum-row-note = Спектр уздовж рядка водоспаду, на якому перебуває відтворення.

js-app-spectrum-row-title = Спектр уздовж показаного рядка

js-app-spectrum-which-part = Яка частина спектра

js-app-status-last-run-took = Останній прогін тривав { $ms } ms у вашому браузері. Нічого не завантажується на сервер.

js-app-status-loading-kept = Рушій ще завантажується. Ваші зміни збережено, і вони виконаються, щойно він буде готовий.

js-app-status-loading-recorded = Рушій ще завантажується. Результат вище — це записаний прогін.

js-app-status-not-run-yet = Ваші зміни ще не виконано.

js-app-status-runs-in-browser = Виконується у вашому браузері. Нічого не завантажується на сервер.

js-app-status-wasm-blocked = WebAssembly тут заблоковано, тож показано записані прогони вбудованих сценаріїв.

js-app-stepper-decrease = Зменшити { $key }

js-app-stepper-increase = Збільшити { $key }

js-app-subtabs-label = Плитки цього подання (телефон)

js-app-svg-button-title = Векторна діаграма із заголовком і походженням

js-app-sweep-cancelled = Перебір скасовано.

js-app-sweep-done-1d =
    Перебрано { $done } із { $total ->
        [one] { $total } прогону
        [few] { $total } прогонів
        [many] { $total } прогонів
       *[other] { $total } прогонів
    } локально за { $duration }.

js-app-sweep-done-2d =
    { $total ->
        [one] Перебрано { $total } прогін ({ $a } × { $b }) локально за { $duration }.
        [few] Перебрано { $total } прогони ({ $a } × { $b }) локально за { $duration }.
        [many] Перебрано { $total } прогонів ({ $a } × { $b }) локально за { $duration }.
       *[other] Перебрано { $total } прогону ({ $a } × { $b }) локально за { $duration }.
    }

js-app-sweep-enter-range = Введіть числовий діапазон.

js-app-sweep-enter-range-2 = Введіть числовий діапазон для другого параметра.

js-app-sweep-failed = Перебір не вдався: { $reason }

js-app-sweep-interrupted = Перебір перервано новим прогоном.

js-app-sweep-needs-live = Перебір багаторазово запускає рушій, тому потребує живого рушія.

js-app-sweep-none-line = Немає (лінійна діаграма)

js-app-sweep-nothing = Для цього сценарію немає чого перебирати.

js-app-sweep-progress = Перебір прогону { $n } із { $total }…

js-app-sweep-status-done =
    { $total ->
        [one] Перебрано { $total } прогін о { $time }.
        [few] Перебрано { $total } прогони о { $time }.
        [many] Перебрано { $total } прогонів о { $time }.
       *[other] Перебрано { $total } прогону о { $time }.
    }

js-app-sweep-title-1d = { $metric } залежно від { $knob }

js-app-sweep-title-2d = { $metric } залежно від { $knob1 } і { $knob2 }

js-app-sweep-wait = Дочекайтеся завершення поточного прогону, а потім запустіть перебір.

js-app-tab-animation = Анімація

js-app-tab-compare = Порівняння

js-app-tab-exports = Експорт і звіт

js-app-tab-ground = Траса на поверхні

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Маски синхронізації

js-app-tab-orbit = Орбіта 3D

js-app-tab-overview = Огляд

js-app-tab-report = Звіт рушія

js-app-tab-signal = Сигнал і смуга

js-app-tab-stability = Стабільність

js-app-tab-sweep = Перебір

js-app-tab-timeseries = Часовий ряд

js-app-th-at-tau = При τ або часі

js-app-th-body = Тіло

js-app-th-clock = Годинник

js-app-th-figure = Показник

js-app-th-file = Файл

js-app-th-format = Формат

js-app-th-key-figure = Ключовий показник

js-app-th-light-time = Односторонній час проходження світла від { $observer }

js-app-th-limit = Межа

js-app-th-margin = Запас

js-app-th-mask-or-budget = Маска або бюджет

js-app-th-metric = Метрика

js-app-th-metric-2 = Метрика

js-app-th-orbital-period = Орбітальний період

js-app-th-provenance = Походження

js-app-th-size = Розмір

js-app-th-source = Джерело

js-app-th-sun-distance = Відстань від Сонця

js-app-th-tier = Рівень

js-app-th-unit = Одиниця

js-app-th-value = Значення

js-app-th-value-2 = Значення

js-app-th-value-3 = Значення

js-app-th-verdict = Вердикт

js-app-th-what-it-is = Що це

js-app-the-body = тіло

js-app-the-chain = Ланцюжок

js-app-the-observer = спостерігач

js-app-tile-browse-all = Переглянути всі сценарії ({ $n })

js-app-tile-browse-sub = Шукайте за назвою, запитанням або налаштуванням

js-app-tile-preview-label = Записаний попередній перегляд із { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } сценарій
        [few] { $n } сценарії
        [many] { $n } сценаріїв
       *[other] { $n } сценарію
    }

js-app-timeline-chart-title = Хронологія місії: { $title }

js-app-timeline-note = Один повзунок керує кожною діаграмою нижче. Кожна фаза виконує звичайні сценарії; кампанія зводить їхні виходи на одну часову сітку. Затінені смуги — це фази, вертикальні лінії — події. Значення вгорі — це канали кампанії в момент відтворення.

js-app-toast-copied = Скопійовано.

js-app-toast-copy-blocked = Копіювання тут заблоковано.

js-app-toast-copy-blocked-select = Копіювання тут заблоковано: натомість виділіть текст.

js-app-toast-json-copied = JSON скопійовано.

js-app-toast-loading-run = Рушій ще завантажується. Ваш прогін почнеться, щойно він буде готовий.

js-app-toast-no-scenario = Сценарію з назвою { $name } тут немає. Ось найближчі збіги.

js-app-toast-not-single-number = У цьому сценарії це налаштування не є одним числом: змініть його у файлі сценарію.

js-app-toast-one-pinned = Закріплено один прогін. Змініть налаштування, запустіть знову й закріпіть цей прогін, щоб порівняти обидва.

js-app-toast-opened-advanced = Відкрито із налаштуваннями, які ви змінили в розширеному поданні.

js-app-toast-opened-at = Відкрито в { $label }. Змініть його, а потім запустіть знову.

js-app-toast-scenario-copied = Сценарій скопійовано.

js-app-tour-answer-body = Просте речення, прочитане з результату, і звідки результат береться: живий прогін у вашому браузері або прогін, записаний тим самим рушієм.

js-app-tour-answer-title = Спершу відповідь

js-app-tour-back = Назад

js-app-tour-done = Готово

js-app-tour-eyebrow = Екскурсія

js-app-tour-figures-body = Кожна картка прочитана з документа результату рушія.

js-app-tour-figures-title = Показники, що на нього відповідають

js-app-tour-how-body = Метод, рівень доказів і посилання.

js-app-tour-how-title = Як це обчислюється

js-app-tour-next = Далі

js-app-tour-research-body = Командний рядок і Python, щоб запустити самому, дані та рисунки, і як цитувати.

js-app-tour-research-title = Для дослідників

js-app-tour-search-body = ⌘K знаходить будь-який сценарій, область, налаштування, подання чи команду.

js-app-tour-search-title = Пошук

js-app-tour-settings-body = П'ять налаштувань, найважливіших для цього запитання. Змініть одне, а потім запустіть знову. Рушій працює у вашому браузері; нічого не завантажується на сервер.

js-app-tour-settings-title = Спробуйте інші налаштування

js-app-tour-skip = Пропустити

js-app-tour-views-body = Діаграми, карти, відтворення, власний звіт рушія та експорти. [ і ] перемикають між поданнями.

js-app-tour-views-title = Кожне подання прогону

js-app-tracking-threshold = Поріг супроводження

js-app-transport-hint = один повзунок керує кожною панеллю цього прогону

js-app-transport-label = Відтворення: один повзунок керує кожною панеллю цього прогону

js-app-unpin-run = Відкріпити прогін { $id }

js-app-waterfall = Водоспад

js-app-waterfall-hint = спектральна густина потужності: частота по горизонталі, час донизу

js-app-waterfall-note = Колір — це потужність над рівнем шуму приймача. Навігаційні сигнали лежать нижче цього рівня, тож світяться глушники. Відтворіть або перетягніть, і смуги праворуч покажуть, що приймач ще супроводжує в цей момент.

js-app-waterfall-title = Водоспад, { $name }

js-app-webassembly-unavailable = WebAssembly недоступний

js-app-written-by-native = Записано нативним рушієм командного рядка v{ $version } ({ $platform }) командою

js-cat-acm-link-question = Яким режимом DVB-S2 утримується лінія вздовж кожного проходу, і скільки даних передає прохід? (змодельовано)

js-cat-acm-link-title = Низхідна лінія супутника з адаптивним кодуванням

js-cat-aocs-slew-mekf-question = Якщо регулятор отримує дані від фільтра орієнтації та гіроскопа зі зсувом, як розворот порівнюється з випадком істинного стану? (змодельовано)

js-cat-aocs-slew-mekf-title = Розворот за оцінкою орієнтації

js-cat-aocs-slew-question = Чи закон зворотного зв'язку заспокоює розворот на великий кут із чотирма маховиками, і наскільки напружено вони працюють? (контур керування перевірено; космічний апарат ілюстративний)

js-cat-aocs-slew-title = Розворот на реактивних маховиках

js-cat-aperture-duty-cycle-question = Коли одна апертура обслуговує і навігацію, і зв'язок, яких перерв у роботі це коштує? (змодельовано)

js-cat-aperture-duty-cycle-title = Робочий цикл апертури

js-cat-araim-gps-galileo-question = За GPS + Galileo та гіпотези про збій усього орбітального угруповання, наскільки доступний розширений RAIM?

js-cat-araim-gps-galileo-title = ARAIM для двох орбітальних угруповань

js-cat-araim-reference-check-question = Чи рівні захисту рушія збігаються з опублікованими розібраними прикладами Working Group C?

js-cat-araim-reference-check-title = Еталонна перевірка ARAIM

js-cat-ascent-losses-question = Яку частину ідеального приросту швидкості двоступеневої ракети-носія забирають гравітація, опір, керування та протитиск? (змодельовано)

js-cat-ascent-losses-title = Втрати під час виведення ракети-носія

js-cat-attitude-budget-question = Який збурювальний момент і бюджет похибки наведення в найгіршому випадку?

js-cat-attitude-budget-title = Бюджет наведення

js-cat-automotive-urban-canyon-question = Чи залишається автомобіль у межах бюджету півсмуги під шляхопроводом і за придорожнього глушника? (змодельовано)

js-cat-automotive-urban-canyon-title = Автомобіль у міському каньйоні

js-cat-campaign-jam-spoof-holdover-integrity-question = Що відбувається з одним приймачем під час глушіння, спуфінгу, втрати ГНСС, сигналу тривоги про цілісність і відновлення, на одній хронології? (змодельовано)

js-cat-campaign-jam-spoof-holdover-integrity-title = Ланцюжок місії: глушіння, спуфінг, holdover, тривога

js-cat-campaign-monte-carlo-clock-holdover-question = Чи на багатьох прогонах із фіксованим зерном (seed) похибка часу вільного годинника збігається з її розкидом у замкненій формі?

js-cat-campaign-monte-carlo-clock-holdover-title = Holdover годинника методом Монте-Карло

js-cat-campaign-optimize-link-budget-question = За дальності та швидкості передавання даних, де лінія діапазону X залишає рівно 3 dB запасу?

js-cat-campaign-optimize-link-budget-title = Оптимізація енергетичного бюджету лінії

js-cat-campaign-shared-jammer-sea-road-question = Під одним глушником яка платформа втрачає визначення положення: судно на відстані 30 km чи автомобіль на відстані 50 km? (змодельовано)

js-cat-campaign-shared-jammer-sea-road-title = Один глушник, судно й автомобіль

js-cat-campaign-spectrum-holdover-integrity-question = Глушник забирає два сигнали діапазону L, годинник переходить у holdover, а приймач переходить лише на Galileo: чи цілісність і далі контролюється? (змодельовано)

js-cat-campaign-spectrum-holdover-integrity-title = Місія, керована спектром

js-cat-campaign-sweep-jammer-power-question = Коли глушник на відстані 1 km посилюють від 10 nW до 10 W, коли приймач втрачає визначення положення? (змодельовано)

js-cat-campaign-sweep-jammer-power-title = Перебір потужності глушника

js-cat-cislunar-arc-recovery-question = Чи незалежний оцінювач найменших квадратів справді відновлює стан за довжиною дуги, яку передбачає тест рангу? (змодельовано; повільно — близько 15 s у браузері)

js-cat-cislunar-arc-recovery-title = Відновлення цисмісячної дуги

js-cat-cislunar-observability-question = Яку частину стану цисмісячного космічного апарата робить спостережуваною міжсупутникова дуга?

js-cat-cislunar-observability-title = Цисмісячна спостережуваність

js-cat-clock-ensemble-question = У якому довірчому діапазоні опиняється holdover на багатьох вибірках шуму?

js-cat-clock-ensemble-title = Ансамбль holdover годинника

js-cat-clock-holdover-labsr-question = Як лабораторний оптичний годинник на стронції порівнюється з атомним годинником чипового масштабу у holdover?

js-cat-clock-holdover-labsr-title = Holdover годинника, лабораторний оптичний годинник

js-cat-clock-holdover-question = Як довго годинник може тримати час після зникнення ГНСС?

js-cat-clock-holdover-title = Holdover годинника

js-cat-combined-altpnt-question = Що дає злиття трьох скалярних картографічних каналів порівняно з будь-яким одним?

js-cat-combined-altpnt-title = Комбінований alt-PNT

js-cat-conflict-resilience-question = Як багаторівнева архітектура PNT деградує під загрозами глушіння / спуфінгу / кінетичними / кібернетичними? (змодельовано)

js-cat-conflict-resilience-title = Стійкість у конфлікті

js-cat-constellation-multi-gnss-coverage-question = Якщо разом використати чотири глобальні системи, скільки супутників у полі зору і наскільки добра геометрія, будь-де на Землі? (змодельовано)

js-cat-constellation-multi-gnss-coverage-title = Чотири орбітальні угруповання GNSS, одна карта

js-cat-contact-schedule-question = Для трьох супутників і трьох станцій протягом 12 годин, які проходи зберігає план без конфліктів і скільки даних він передає? (змодельовано)

js-cat-contact-schedule-title = План наземних сеансів зв'язку

js-cat-domain-campaigns-label = Кампанії

js-cat-domain-campaigns-line = Ланцюжки місій, переборів і прогонів Монте-Карло на одному годиннику.

js-cat-domain-constellations-label = Проєктування орбітального угруповання

js-cat-domain-constellations-line = Спроєктуйте орбітальне угруповання та побудуйте карту його покриття й PDOP (геометричний чинник погіршення точності положення).

js-cat-domain-deepspace-label = Місяць, цисмісячний простір і Марс

js-cat-domain-deepspace-line = Навігація та час на Місяці, у цисмісячному просторі та на Марсі.

js-cat-domain-integrity-label = Цілісність і визначення положення

js-cat-domain-integrity-line = Визначення положення та те, чи можна йому довіряти: RAIM (автономний контроль цілісності приймачем) і його розширена форма ARAIM.

js-cat-domain-interference-label = Глушіння та завади

js-cat-domain-interference-line = Глушники проти приймачів супутникової навігації: що втрачається і коли.

js-cat-domain-leo-label = Навігація на низькій навколоземній орбіті (LEO)

js-cat-domain-leo-line = Навігаційні сигнали, проходи, повідомлення та визначення положення на низькій навколоземній орбіті.

js-cat-domain-leo-missions-label = Місії та дослідження LEO

js-cat-domain-leo-missions-line = Дослідження та послуги на основі шару низької навколоземної орбіти.

js-cat-domain-navigation-label = Інерціальна та альтернативна навігація

js-cat-domain-navigation-line = Інерціальна, рельєфна, гравітаційна та інша навігація без супутників.

js-cat-domain-orbits-label = Орбіти та геометрія ГНСС

js-cat-domain-orbits-line = Поширення орбіти, ефемериди та геометрія навігаційних супутників.

js-cat-domain-solar-label = Сонячна система

js-cat-domain-solar-line = Кожна планета й супутник планети в одну епоху, із часом проходження світла.

js-cat-domain-spaceops-label = Аналіз місій і космічні операції

js-cat-domain-spaceops-line = Проходи, вікна запуску, вхід в атмосферу, бюджети лінії та орієнтації.

js-cat-domain-spectrum-label = Спектр

js-cat-domain-spectrum-line = Водоспади радіодіапазону: глушники, сигнали та те, що супроводжує приймач.

js-cat-domain-spoofing-label = Спуфінг і безпека сигналу

js-cat-domain-spoofing-line = Хибні сигнали та мікоінг (meaconing) і монітори, які їх виявляють.

js-cat-domain-studies-label = Квантові технології, порівняльні дослідження та сумісність

js-cat-domain-studies-line = Квантові сенсори, порівняльні дослідження та формати сумісності.

js-cat-domain-timing-label = Годинники та синхронізація часу

js-cat-domain-timing-line = Годинники без супутників: holdover, стабільність, телекомунікаційні маски, передавання часу.

js-cat-earth-gnss-lunar-question = Чи може приймач біля Місяця чути земну ГНСС і чи цього коли-небудь досить для визначення положення? (змодельовано)

js-cat-earth-gnss-lunar-title = Земна ГНСС на Місяці

js-cat-entry-heating-stardust-question = Чи відтворює модель входу в атмосферу опубліковане пікове уповільнення капсули Stardust для повернення зразків?

js-cat-entry-heating-stardust-title = Вхід капсули Stardust в атмосферу

js-cat-eo-coverage-question = Яку смугу огляду, роздільність на місцевості та частоту повторного огляду дає орбіта ДЗЗ?

js-cat-eo-coverage-title = Покриття ДЗЗ

js-cat-eo-radiometry-question = Яке відношення сигнал/шум, MTF на частоті Найквіста та NIIRS дає сцена з коефіцієнтом відбиття 15 % для малої камери спостереження Землі? (змодельовано)

js-cat-eo-radiometry-title = Радіометрія засобу зображення та якість зображення

js-cat-ephemeris-question = Де перебуває супутник і коли він проходить над головою?

js-cat-ephemeris-title = Траса на поверхні

js-cat-europa-surface-pnt-question = Чи можна визначити положення посадкового модуля на Європі, супутнику Юпітера, за малим угрупованням ретрансляторів і відстанню від Землі? (змодельовано)

js-cat-europa-surface-pnt-title = Посадковий модуль на Європі

js-cat-fusion-pnt-coupled-question = Якщо один складений фільтр Калмана охоплює положення, годинник і зсув акселерометра, як навігатор переживає збій ГНСС? (змодельовано)

js-cat-fusion-pnt-coupled-title = Зв'язаний навігатор зі злиттям даних сенсорів

js-cat-fusion-pnt-question = Що дає єдиний спільний оцінювач для годинника й положення?

js-cat-fusion-pnt-title = Злиття даних сенсорів

js-cat-gnss-ins-aviation-question = Під час дводвохвилинного відмовлення ГНСС, що охоплює віраж, наскільки дрейфує щільно зв'язана INS навігаційного або тактичного класу? (змодельовано)

js-cat-gnss-ins-aviation-title = Віраж літака крізь пропуск ГНСС

js-cat-gnss-ins-maritime-question = Після п'ятихвилинного збою ГНСС на судні, що рискає курсом, наскільки дрейфує INS навігаційного або тактичного класу? (змодельовано)

js-cat-gnss-ins-maritime-title = Судно, що рискає курсом, крізь збій ГНСС

js-cat-gnss-ins-question = Наскільки добре інерціальний навігатор із підтримкою долає збій ГНСС?

js-cat-gnss-ins-rail-question = Крізь глибоку виїмку з двома супутниками, а потім тунель, наскільки дрейфує щільно зв'язана INS? (змодельовано)

js-cat-gnss-ins-rail-title = Потяг крізь виїмку й тунель

js-cat-gnss-ins-title = Злиття ГНСС/INS

js-cat-gnss-sim-container-terminal-skyline-question = Якщо крани з боку моря, а штабелі з боку суходолу, скільки супутників залишається і що відбувається із захистом RAIM? (змодельовано; репрезентативний обрій)

js-cat-gnss-sim-container-terminal-skyline-title = Портальний контейнерний навантажувач на причалі

js-cat-gnss-sim-raim-question = Як іоносфера й тропосфера формують необроблені псевдодальності, і чи RAIM і далі захищає?

js-cat-gnss-sim-raim-title = Вимірювання ГНСС

js-cat-gnss-ssv-formation-heo-question = Наскільки добре фільтр знає відносне положення двох космічних апаратів на відстані кілометра, порівняно з різницею їхніх абсолютних визначень? (змодельовано; прогін, записаний нативним рушієм)

js-cat-gnss-ssv-formation-heo-title = Відносна навігація в строю, високоеліптична орбіта

js-cat-gnss-ssv-heo-question = Що чує високоеліптична орбіта вздовж свого шляху: сигнали в полі зору, найкраще C/N0, головна пелюстка проти бічних, DOP і ковзні сигнали? (змодельовано; прогін, записаний нативним рушієм)

js-cat-gnss-ssv-heo-title = Сигнали ГНСС на високоеліптичній орбіті

js-cat-gnss-ssv-lunar-weak-question = Що може використати приймач, розрахований на найслабші сигнали, на шляху до Місяця? (змодельовано; прогін, записаний нативним рушієм)

js-cat-gnss-ssv-lunar-weak-title = Сигнали ГНСС на місячній трасі переходу, приймач слабких сигналів

js-cat-gnss-ssv-nav-lunar-question = Наскільки добре бортовий фільтр утримує місячну трасу переходу порівняно з межею, яку він заявляє? (змодельовано; прогін, записаний нативним рушієм)

js-cat-gnss-ssv-nav-lunar-title = Бортовий фільтр ГНСС на місячній трасі переходу

js-cat-gnss-ssv-shell-question = Як часто космічний апарат на геостаціонарній висоті чує щонайменше один і щонайменше чотири навігаційні сигнали, за орбітальними угрупованнями та діапазонами? (змодельовано; прогін, записаний нативним рушієм)

js-cat-gnss-ssv-shell-title = Сигнали ГНСС над супутниками: оболонка на 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = На реальному гравітаційному полі EGM2008 до степеня 70, чи може зіставлення з картою втримати трасу в умовах відсутності GPS? (змодельовано)

js-cat-gps-denied-gravity-nav-egm2008-title = Гравітаційна навігація на реальному полі

js-cat-gps-denied-gravity-nav-question = Наскільки дрейфує положення за цілу годину без ГНСС — і чи може гравітаційна карта його стримати?

js-cat-gps-denied-gravity-nav-title = Навігація без ГНСС

js-cat-gravity-map-error-mc-question = Коли збережена гравітаційна карта стає шумнішою, як часто зіставлення з нею все ж утримує визначення положення без GPS у межах цілі? (змодельовано)

js-cat-gravity-map-error-mc-title = Монте-Карло похибки гравітаційної карти

js-cat-gravity-map-nav-question = Чи може холодноатомний гравіметр утримувати положення без ГНСС, зіставляючи гравітаційне поле, крізь яке летить?

js-cat-gravity-map-nav-title = Навігація за гравітаційною картою

js-cat-holdover-test-example-question = Витягніть антену, оцініть holdover: запис, розділений у два моменти, названі оператором, кожен крок виміряно за масками ITU-T, написаними для нього. (змодельовано; запис вигаданий для прикладу)

js-cat-holdover-test-example-title = Тест holdover: запис похибки часу відносно масок

js-cat-holdover-test-ptp4l-question = Ті самі чотири кроки, прочитані з журналу сервоприводу ptp4l: наскільки далеко власне зміщення демона залишається від масок, поки ГНСС відсутня? (змодельовано; журнал вигаданий для прикладу)

js-cat-holdover-test-ptp4l-title = Тест holdover: журнал linuxptp

js-cat-hybrid-optical-rf-question = Яку безперервність і цілісність дає поєднання оптичного та радіочастотного PNT? (змодельовано)

js-cat-hybrid-optical-rf-title = Гібрид оптичного та радіочастотного

js-cat-hybrid-pnt-question = Що дає комбінований комплект із годинника та інерціальної системи?

js-cat-hybrid-pnt-title = Гібридний PNT

js-cat-hybrid-ukf-question = Чи самоузгоджений 17-вимірний щільно зв'язаний UKF (NEES + білість інновацій)? Перевірка самоузгодженості, а не твердження про точність.

js-cat-hybrid-ukf-title = Гібридний 17-вимірний UKF

js-cat-impairment-eval-question = Наскільки добре детектор відокремлює глушіння / спуфінг / багатопроменевість від номінального стану? (змодельовані ROC/AUC)

js-cat-impairment-eval-title = Оцінювання радіочастотних спотворень

js-cat-imu-deadreckoning-question = Наскільки дрейфує положення при рухові лише за IMU?

js-cat-imu-deadreckoning-title = Інерціальне зчислення шляху

js-cat-ins-trn-coast-question = Наскільки дрейфує положення під час навігаційного збою і коли воно перетинає 10 m та 50 m? (змодельовано)

js-cat-ins-trn-coast-title = Інерційний хід INS/TRN

js-cat-integrity-harbour-approach-question = Якщо будівлі причалу та хвилеріз ховають низькі супутники, чи утримують GPS і Galileo захист ARAIM в межах порогів сповіщення? (змодельовано; репрезентативний обрій)

js-cat-integrity-harbour-approach-title = ARAIM при вході в гавань

js-cat-integrity-raim-question = Чи геометрія відповідає порогам сповіщення (HPL / VPL)?

js-cat-integrity-raim-title = Цілісність RAIM

js-cat-jamming-demo-question = При якому відношенні глушник/сигнал приймач втрачає захоплення?

js-cat-jamming-demo-title = Глушіння

js-cat-jamming-harbour-approach-skyline-question = Під береговим глушником потужністю 2 W скільки супутників зберігає судно і скільки ховає сам причал? (змодельовано; репрезентативний обрій)

js-cat-jamming-harbour-approach-skyline-title = Судно під глушінням при вході в гавань

js-cat-l-band-waterfall-jamming-question = Як виглядає весь діапазон L ГНСС, поки вмикаються чирп-, тональний і шумовий глушники, і які сигнали забирає кожен із них? (змодельовано)

js-cat-l-band-waterfall-jamming-title = Водоспад діапазону L під глушінням

js-cat-launch-window-question = Який азимут запуску та Δv маневру dogleg досягають цільового нахилу з майданчика?

js-cat-launch-window-title = Вікно запуску

js-cat-leo-band-trade-question = Що виграє і втрачає навігаційний сигнал низької орбіти в кожному діапазоні, від ультрависокої частоти (UHF) до діапазону C? (репрезентативні конструкції)

js-cat-leo-band-trade-title = Порівняння діапазонів, від UHF до діапазону C

js-cat-leo-doppler-positioning-question = Наскільки добре визначення положення за десять хвилин доплерівських вимірювань на навігаційному угрупованні низької орбіти? (змодельовано)

js-cat-leo-doppler-positioning-title = Визначення положення лише за Доплером

js-cat-leo-focus-data-services-question = Чого коштує кожна додаткова служба даних у бітах навігаційного повідомлення? (змодельовано)

js-cat-leo-focus-data-services-title = Службові дані проти довжини кадру

js-cat-leo-focus-fused-pnt-sisre-question = Якою доброю має бути похибка дальності сигналу в космосі на низькій орбіті, щоб шар низької орбіти допомагав об'єднаному визначенню положення? (змодельовано)

js-cat-leo-focus-fused-pnt-sisre-title = Об'єднане визначення положення проти похибки орбіти та годинника

js-cat-leo-focus-indoor-uhf-question = Який діапазон ще досягає користувача всередині традиційної та теплоефективної будівлі? (змодельовано)

js-cat-leo-focus-indoor-uhf-title = Прийом у приміщенні за діапазоном і будівлею

js-cat-leo-focus-iot-eirp-question = Скільки потужності передавача супутника потрібно батарейній мітці, щоб працювати довго? (змодельовано)

js-cat-leo-focus-iot-eirp-title = Енергія трекера проти потужності передавача

js-cat-leo-focus-ntn-bandwidth-question = Як зменшується похибка визначення положення, коли опорний сигнал розширюється від 180 kHz до 20 MHz? (змодельовано)

js-cat-leo-focus-ntn-bandwidth-title = Визначення положення низхідною лінією 5G проти смуги пропускання

js-cat-leo-focus-ppp-altitude-question = Чи нижній, чи вищий шар низької орбіти більше скорочує збіжність? (змодельовано; повільно, близько хвилини в браузері)

js-cat-leo-focus-ppp-altitude-title = Прецизійне позиціонування проти висоти шару

js-cat-leo-focus-science-iono-sounding-question = Наскільки добре різниця затримок між двома діапазонами вимірює електронний вміст під супутником низької орбіти? (змодельовано)

js-cat-leo-focus-science-iono-sounding-title = Зондування іоносфери за двома діапазонами

js-cat-leo-indoor-uhf-question = Чому несівна UHF досягає внутрішньої частини будівлі, коли діапазони L, S і C мають труднощі? (змодельовано)

js-cat-leo-indoor-uhf-title = У приміщенні на UHF

js-cat-leo-iot-energy-question = Скільки енергії батарейна мітка витрачає на кожне визначення положення за сигналом низької орбіти? (змодельовано)

js-cat-leo-iot-energy-title = Енергія на одне визначення положення для трекера

js-cat-leo-navmsg-encode-decode-question = Чого коштує квантування кожного поля і чи переживає кадр кодування, декодування та пошкоджений біт? (змодельовано)

js-cat-leo-navmsg-encode-decode-title = Навігаційне повідомлення: двійковий кадр

js-cat-leo-navmsg-fit-interval-trade-question = Скільки може охоплювати одне широкомовне повідомлення, перш ніж похибка його орбіти перевищить ціль? (змодельовано; повільно, близько 30 s у браузері)

js-cat-leo-navmsg-fit-interval-trade-title = Навігаційне повідомлення: інтервал апроксимації

js-cat-leo-navmsg-midpass-update-question = Коли супутник посеред проходу перемикається на нове повідомлення, чи бачить користувач стрибок? (змодельовано)

js-cat-leo-navmsg-midpass-update-title = Навігаційне повідомлення: оновлення посеред проходу

js-cat-leo-navmsg-model-comparison-question = Яка модель ефемерид найкраще подає низьку орбіту і як вона співвідноситься з опублікованою таблицею? (змодельовано)

js-cat-leo-navmsg-model-comparison-title = Навігаційне повідомлення: чотири моделі

js-cat-leo-pass-iridium-question = Яку потужність сигналу і який доплерівський зсув бачить авіалайнер за один прохід Iridium? (змодельовано)

js-cat-leo-pass-iridium-title = Сплески Iridium з літака

js-cat-leo-pass-vs-gnss-cn0-question = Як потужність сигналу одного проходу низької орбіти порівнюється із супутниками Galileo в полі зору? (змодельовано)

js-cat-leo-pass-vs-gnss-cn0-title = Один прохід проти ГНСС

js-cat-leo-pass-xona-pulsar-question = Як виглядають сигнали X1 і X5 за один прохід для судна в Біскайській затоці? (змодельовано)

js-cat-leo-pass-xona-pulsar-title = Прохід Xona Pulsar

js-cat-leo-pnt-end-to-end-question = Від проєктування сигналу до остаточного визначення положення, що кожен етап передає наступному? (змодельовано)

js-cat-leo-pnt-end-to-end-title = Наскрізно, типове орбітальне угруповання

js-cat-leo-pnt-mega-shell-question = Яке покриття та геометрію дає навігаційне угруповання з 5 000 супутників на низькій навколоземній орбіті? (змодельовано; приклад конструкції)

js-cat-leo-pnt-mega-shell-title = Конструкція низької орбіти з 5 000 супутників

js-cat-leo-ppp-convergence-question = Наскільки швидше збігається прецизійне абсолютне позиціонування (PPP), коли додано шар низької орбіти? (змодельовано; повільно, близько 30 s у браузері)

js-cat-leo-ppp-convergence-title = Збіжність прецизійного позиціонування

js-cat-leo-pvt-fjord-skyline-question = Де стіни фіорду залишають смугу неба вздовж протоки, скільки додає шар низької орбіти до GPS і Galileo? (змодельовано; репрезентативний обрій)

js-cat-leo-pvt-fjord-skyline-title = Пором глибоко у фіорді

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Коли ГНСС заглушено, чи може шар низької орбіти в інших діапазонах зберегти визначення положення та його цілісність? (змодельовано)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = ГНСС заглушено, низька орбіта продовжує працювати

js-cat-leo-resilience-js-margin-question = Наскільки більше глушіння переживає сильніший сигнал низької орбіти, ніж сигнал ГНСС із середньої орбіти? (змодельовано)

js-cat-leo-resilience-js-margin-title = Запас за глушником із прийнятої потужності

js-cat-leo-resilience-multiband-diversity-question = Коли один глушник діапазону L посилюють, які з чотирьох діапазонів продовжують супроводження? (змодельовано)

js-cat-leo-resilience-multiband-diversity-title = Різноманітність діапазонів під загороджувальним глушником

js-cat-leo-resilience-spoof-doppler-question = Коли спуфер зсуває обчислене положення на 30 m, як швидко його виявляє перевірка за Доплером і геометрією проходу? (змодельовано)

js-cat-leo-resilience-spoof-doppler-title = Спуфінг, виявлений за Доплером

js-cat-leo-resilience-spoof-monitors-question = Який монітор бачить який вид спуфера? (змодельовано)

js-cat-leo-resilience-spoof-monitors-title = Монітори спуфінгу проти чотирьох спуферів

js-cat-leo-timing-utc-question = Наскільки точно приймач може відновити всесвітній координований час (UTC) за супутниками низької орбіти, залежно від генератора та рівня сигналу? (змодельовано)

js-cat-leo-timing-utc-title = Передавання часу до UTC

js-cat-leo-vertical-5g-network-timing-question = Коли ГНСС втрачено на добу, чи тримає час низької орбіти базову станцію в межах її обмеження за часом? (змодельовано)

js-cat-leo-vertical-5g-network-timing-title = Синхронізація базових станцій 5G

js-cat-leo-vertical-asset-tracking-iot-question = Уздовж подорожі контейнера, чого коштує кожне визначення положення батарейній мітці? (змодельовано)

js-cat-leo-vertical-asset-tracking-iot-title = Відстеження контейнера

js-cat-leo-vertical-autonomous-vehicle-question = Коли будівлі ховають низькі супутники, чи утримує шар низької орбіти автомобіль у межах похибки рівня смуги руху? (змодельовано)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Якщо змоделювати справжню вулицю замість плоского відсікання на 35°, чи шар низької орбіти все ще утримує автомобіль у межах похибки рівня смуги руху? (змодельовано; репрезентативний обрій)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Транспортний засіб на вулиці, а не за плоского відсікання

js-cat-leo-vertical-autonomous-vehicle-title = Транспортний засіб у міському каньйоні

js-cat-leo-vertical-critical-infrastructure-timing-question = Коли ГНСС втрачено, чи тримає час низької орбіти синхронізацію підстанції? (змодельовано)

js-cat-leo-vertical-critical-infrastructure-timing-title = Синхронізація підстанції

js-cat-leo-vertical-polar-arctic-question = Від Тромсе до Північного полюса, що додає полярний шар низької орбіти до ГНСС? (змодельовано)

js-cat-leo-vertical-polar-arctic-title = Арктична подорож

js-cat-leo-vertical-rail-maritime-question = Коли вбудовані сценарії судна й потяга втрачають ГНСС, чи прохід низької орбіти все ще їх досягає? (змодельовано)

js-cat-leo-vertical-rail-maritime-title = Залізниця й море з шаром низької орбіти

js-cat-link-budget-question = Чи замикається лінія в один бік із запасом за заданої дальності та швидкості передавання даних?

js-cat-link-budget-title = Енергетичний бюджет лінії

js-cat-lunanet-araim-question = Чи відповідає розріджений набір місячних ретрансляторів межам цілісності для приймача в районі Artemis?

js-cat-lunanet-araim-title = Місячна цілісність

js-cat-lunar-attack-surface-question = Що потрібно, щоб підмінити або заблокувати приймач на місячній поверхні, і який бюджет автентифікації на це відповідає? (змодельовано)

js-cat-lunar-attack-surface-title = Поверхня атаки на Місяці

js-cat-lunar-beacon-question = Наскільки жменя оглянутих поверхневих маяків зменшує південнополярний DOP? (змодельовано)

js-cat-lunar-beacon-title = Маяки на місячній поверхні

js-cat-lunar-differential-pnt-question = Наскільки диференціальна поправка скасовує синфазну похибку щодо базової лінії на Місяці? (змодельовано)

js-cat-lunar-differential-pnt-title = Місячний диференціальний PNT

js-cat-lunar-frame-campaign-question = Яка точність датума виходить із кампанії спостережень, а не з уведеного перетворення? (змодельовано)

js-cat-lunar-frame-campaign-title = Кампанія місячної системи відліку

js-cat-lunar-frame-realisation-question = Чи може підгонка датума за Гельмертом відновити перетворення місячної системи відліку? (змодельовано)

js-cat-lunar-frame-realisation-title = Місячна система відліку

js-cat-lunar-infrastructure-carrier-phase-question = Чи можуть наземна станція й орбітальний апарат разом розв'язати цілочисельні неоднозначності фази несівної сигналів земної ГНСС? Швидкий приклад прогону. (змодельовано; прогін, записаний нативним рушієм)

js-cat-lunar-infrastructure-carrier-phase-title = Фаза несівної на Місяці: поверхнева станція й орбітальний апарат

js-cat-lunar-infrastructure-frame-coestimation-question = Скільки додаткової інформації дають дальності між орбітальним апаратом і поверхневою станцією до семи параметрів місячного датума? (змодельовано; прогін, записаний нативним рушієм)

js-cat-lunar-infrastructure-frame-coestimation-title = Спільне оцінювання місячної системи відліку із зв'язками орбітального апарата

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Наскільки чутливі лазерна локація, відстеження орбітального апарата, гравіметр і поверхневий годинник до h2, k2, l2 і лібрації? (змодельовано; прогін, записаний нативним рушієм)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Чутливість до чисел Лява та лібрації Місяця

js-cat-lunar-infrastructure-od-consistency-model-error-question = Те саме порівняння з уведеним малим немоделюваним прискоренням: чи помічає його перевірка узгодженості? (змодельовано; прогін, записаний нативним рушієм)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Визначення місячної орбіти з уведеною похибкою моделювання

js-cat-lunar-infrastructure-od-consistency-question = Чи збігаються в межах заявлених невизначеностей бортове визначення орбіти за земною ГНСС на місячній орбіті типу «гало» і незалежне наземне радіометричне визначення орбіти? (змодельовано; прогін, записаний нативним рушієм)

js-cat-lunar-infrastructure-od-consistency-title = Визначення місячної орбіти: бортова ГНСС проти наземного відстеження

js-cat-lunar-infrastructure-space-tie-question = Наскільки точно можна зв'язати зсуви між трьома методами порівняно з похибкою локального зв'язку? (змодельовано; прогін, записаний нативним рушієм)

js-cat-lunar-infrastructure-space-tie-title = Космічний зв'язок: ГНСС, VLBI і лазерна локація на одному космічному апараті

js-cat-lunar-interop-export-question = Чи можуть місячна система відліку / час / ефемериди пройти туди й назад через CCSDS OEM + оболонку KIF?

js-cat-lunar-interop-export-title = Експорт сумісності для Місяця

js-cat-lunar-jamming-question = Наскільки далеко може перебувати глушник і все ж блокувати приймач на місячній поверхні? (змодельовано)

js-cat-lunar-jamming-title = Глушіння на Місяці

js-cat-lunar-joint-od-clock-question = Чи робить зв'язок VLBI із земною базою абсолютне положення місячної станції спостережуваним? (змодельовано)

js-cat-lunar-joint-od-clock-title = Спільні OD і годинник на Місяці

js-cat-lunar-llr-datum-question = Який вигляд має місячний датум, коли кампанія — це справжня архівна місячна лазерна локація (LLR)? (змодельовано; прогін, записаний нативним рушієм)

js-cat-lunar-llr-datum-title = Датум місячної лазерної локації

js-cat-lunar-relay-constellation-question = Яке покриття всього Місяця дає ретрансляційно-навігаційне угруповання на заморожених і низьких місячних орбітах? (змодельовано; приклад конструкції)

js-cat-lunar-relay-constellation-title = Місячне ретрансляційне угруповання

js-cat-lunar-station-coverage-public-sources-question = За лише публічно заявлених припущень, яку виправлену похибку станція дає над південним полюсом? Результат визначають елементи орбіти, які не є публічними і задані як ILLUSTRATIVE; це вхідні дані зафіксованого прогнозу. (змодельовано; не твердження про жодну реальну систему)

js-cat-lunar-station-coverage-public-sources-title = Місячна опорна станція, публічні припущення

js-cat-lunar-station-coverage-question = Над південнополярним районом і за добу, яку виправлену похибку дає місячна опорна станція і наскільки далеко від неї покриття зберігається? (змодельовано; не твердження про жодну реальну систему)

js-cat-lunar-station-coverage-terrain-question = Якщо горизонт кожного майданчика прорахований методом променевого маршу за справжньою місячною моделлю висот, скільки покриття станція втрачає через рельєф? (змодельовано)

js-cat-lunar-station-coverage-terrain-title = Місячна станція зі справжнім рельєфом

js-cat-lunar-station-coverage-title = Покриття місячної опорної станції

js-cat-lunar-station-geodesy-baseline-question = Наскільки добре нинішні п'ять масивів ретрорефлекторів фіксують місячний датум за справжнім графіком, до додавання будь-якої станції? Базовий рівень пари. (змодельовано; прогін, записаний нативним рушієм)

js-cat-lunar-station-geodesy-baseline-title = Геодезія місячної станції: лише п'ять масивів

js-cat-lunar-station-geodesy-with-station-question = Той самий архівний графік з одним доданим південнополярним відбивачем і маяком VLBI: наскільки звужується межа датума? (змодельовано, ілюстративний майданчик; прогін, записаний нативним рушієм)

js-cat-lunar-station-geodesy-with-station-title = Геодезія місячної станції: із південнополярною станцією

js-cat-lunar-station-time-lab-question = Після того як мініатюрний рубідієвий годинник станції востаннє підстроєно до місячного часу, як довго він залишається в межах 1, 10 і 100 ns і який доданок похибки домінує? (змодельовано)

js-cat-lunar-station-time-lab-title = Часова лабораторія місячної станції

js-cat-lunar-time-budget-question = Яким є зсув координатного часу Земля–Місяць і його бюджет похибки? (змодельовано)

js-cat-lunar-time-budget-title = Бюджет місячного часу

js-cat-lunar-time-offset-question = Як швидко місячний годинник розходиться із земним часом (~56–59 µs/добу)?

js-cat-lunar-time-offset-title = Зсув місячного часу

js-cat-lunar-vlbi-fim-question = Яку точність координат станції фактично дає заданий графік відстеження VLBI? (змодельовано)

js-cat-lunar-vlbi-fim-title = Інформація VLBI для Місяця

js-cat-lunar-vlbi-question = Яку затримку бачить пара VLBI із земною базою для маяка на місячній поверхні? (змодельовано)

js-cat-lunar-vlbi-title = Місячний VLBI

js-cat-maritime-port-approach-coast-question = Під час входу в порт без ГНСС, коли INS навігаційного класу виходить за бюджети гавані та океану? (змодельовано)

js-cat-maritime-port-approach-coast-title = Підхід до порту на інерціальній системі

js-cat-maritime-spoof-position-push-question = Коли спуфер відтягує визначення положення судна на 500 m, які рівні виявлення його ловлять? (змодельовано)

js-cat-maritime-spoof-position-push-title = Спуфінг положення судна

js-cat-maritime-strait-jamming-question = Через 30 km відкритої води, чи глушник потужністю 50 W відбирає в судна ГНСС? (змодельовано)

js-cat-maritime-strait-jamming-title = Судно під глушінням у протоці

js-cat-mars-orbit-pnt-question = Наскільки добре визначається положення низького марсіанського орбітального апарата за дванадцятьма навігаційними ретрансляторами і що додає дальність від Землі? (змодельовано)

js-cat-mars-orbit-pnt-title = Марсіанський орбітальний апарат із ретрансляторами та зв'язком із Землею

js-cat-mars-pnt-lmo-question = Чи може ретрансляційне угруповання MARCONI навігувати користувача на Марсі? (коваріаційний показник якості, а не сертифікований PL)

js-cat-mars-pnt-lmo-title = PNT на Марсі, низька орбіта

js-cat-mars-pnt-surface-question = Наскільки добре можна навігувати посадковий модуль або марсохід на обертовій поверхні Марса за ретрансляційним угрупованням?

js-cat-mars-pnt-surface-title = PNT на Марсі, поверхня

js-cat-mars-pnt-transfer-question = Наскільки добре навігується апарат на високій еліптичній дузі підходу або захоплення на Марсі?

js-cat-mars-pnt-transfer-title = PNT на Марсі, переліт

js-cat-meo-leo-fused-pvt-question = Що робить додавання шару низької орбіти до GPS і Galileo з похибкою положення та геометрією? (змодельовано)

js-cat-meo-leo-fused-pvt-title = Об'єднане визначення положення за ГНСС і низькою орбітою

js-cat-moonlight-service-volume-question = Які DOP, покриття та цілісність дає південному полюсу угруповання класу Moonlight/LCNS? (змодельовано)

js-cat-moonlight-service-volume-title = Місячний обсяг обслуговування

js-cat-multi-band-jamming-waterfall-question = Якщо навігаційні сигнали розподілені на чотири діапазони, що залишає недоторканим глушник, створений для одного діапазону? (змодельовано)

js-cat-multi-band-jamming-waterfall-title = Багатодіапазонний водоспад глушіння

js-cat-notinbrowser-elevation-model = Потребує фрагмента місячної моделі висот ({ $path }), який постачається з репозиторієм, а не зі збіркою для браузера.

js-cat-notinbrowser-laser-ranging-data = Потребує архівного зрізу даних лазерної локації, який постачається з репозиторієм, а не зі збіркою для браузера.

js-cat-notinbrowser-study-suite = Набір досліджень, а не окремий сценарій. Запустіть його інструментом командного рядка: { $command }.

js-cat-ntn-5g-positioning-question = Наскільки точно телефон може визначити своє положення за низхідною лінією нетерестріальної мережі 5G, залежно від смуги сигналу? (змодельовано)

js-cat-ntn-5g-positioning-title = Визначення положення за низхідною лінією супутника 5G

js-cat-oem-interop-question = Чи можна імпортувати ефемериди OEM з GMAT / Orekit / STK і провести їх туди й назад?

js-cat-oem-interop-title = Міст CCSDS OEM

js-cat-optical-atmosphere-network-question = Як часто оптична лінія синхронізації працює крізь хмари й турбулентність і що дають додаткові наземні пункти? (змодельовано; ілюстративні хмарні клімати)

js-cat-optical-atmosphere-network-title = Оптична лінія крізь атмосферу, три пункти

js-cat-optical-atmosphere-techniques-question = Що дають більша апертура, інша довжина хвилі або адаптивна оптика одній оптичній лінії вгору в хмарах і турбулентності? (змодельовано; ілюстративний хмарний клімат)

js-cat-optical-atmosphere-techniques-title = Прийоми оптичної лінії

js-cat-orbit-gnss-challenged-question = Коли визначення положення взагалі можливе за геометрією супутників?

js-cat-orbit-gnss-challenged-title = Доступність ГНСС

js-cat-orbit-molniya-question = Чи може користувач на сильно ексцентричній орбіті «Молнія» все ще бачити достатньо супутників ГНСС біля апогею?

js-cat-orbit-molniya-title = Користувач на орбіті «Молнія»

js-cat-orbit-multignss-question = Наскільки GPS + Galileo разом підвищують доступність і зменшують геометричний чинник DOP?

js-cat-orbit-multignss-title = Доступність мульти-ГНСС

js-cat-orbit-real-tle-question = Яке покриття забезпечує справжнє орбітальне угруповання, задане дворядковими наборами елементів?

js-cat-orbit-real-tle-title = Справжні дворядкові елементи

js-cat-orbit-rinex-question = Яка доступність виходить зі справжніх широкомовних ефемерид RINEX 3?

js-cat-orbit-rinex-title = Широкомовні ефемериди

js-cat-orbit-sgp4-gps-question = Як справжнє угруповання, схоже на GPS, поширюється впродовж доби?

js-cat-orbit-sgp4-gps-title = Орбіти SGP4

js-cat-orbit-urban-canyon-skyline-question = Унизу міської вулиці, яку частину доби GPS і Galileo дають чотири супутники і що смуга неба робить із PDOP? (змодельовано; репрезентативний обрій)

js-cat-orbit-urban-canyon-skyline-title = Доступність на міській вулиці

js-cat-passes-question = Коли супутник сходить і заходить над станцією і на який час?

js-cat-passes-title = Проходи над станцією

js-cat-polar-arctic-leo-coverage-question = Від екватора до полюса, як змінюються супутники в полі зору та геометрія за самої ГНСС, самого полярного шару низької орбіти та обох разом? (змодельовано)

js-cat-polar-arctic-leo-coverage-title = Від екватора до полюса

js-cat-pvt-abmf-question = Чи можна розв'язати справжнє положення приймача за необробленими вимірюваннями RINEX?

js-cat-pvt-abmf-title = Визначення положення (SPP)

js-cat-quantum-anomaly-detect-question = Наскільки добре виявляються збої квантових систем за фіксованої частоти хибних тривог? (змодельовано)

js-cat-quantum-anomaly-detect-title = Виявлення квантових аномалій

js-cat-quantum-cai-coast-question = Як довго холодноатомний інтерферометр, заданий своєю фізикою, утримує зчислення шляху в межах 100 m після втрати ГНСС, порівняно з кварцовим акселерометром навігаційного класу? (змодельовано)

js-cat-quantum-cai-coast-title = Інерційний хід квантового акселерометра

js-cat-quantum-gnss-free-nav-question = Наскільки далеко дрейфує холодноатомний навігатор порівняно з INS навігаційного класу без ГНСС? (змодельовано)

js-cat-quantum-gnss-free-nav-title = Квантова навігація без ГНСС

js-cat-quantum-pnt-demonstrator-suite-question = Три квантові прикладні області як одне дослідження (набір досліджень командного рядка: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Дослідження квантового демонстратора PNT

js-cat-quantum-time-transfer-question = Що дає довірений квантовий час порівняно з класичним ланцюжком CSAC + RF? (змодельовано)

js-cat-quantum-time-transfer-title = Квантове передавання часу

js-cat-quantum-trade-question = Який holdover часу / інерціальний забезпечує кандидатний годинник порівняно з класичним базовим рівнем? (змодельовано)

js-cat-quantum-trade-title = Порівняння квантового PNT

js-cat-rail-tunnel-coast-question = На швидкості 160 km/h крізь тунель, як скоро INS тактичного класу виходить за свій бюджет? (змодельовано)

js-cat-rail-tunnel-coast-title = Потяг крізь тунель

js-cat-realtime-frame-eop-question = Яку похибку системи відліку вносить орієнтація Землі в реальному часі (прогнозна)? (змодельовано)

js-cat-realtime-frame-eop-title = Система відліку / EOP у реальному часі

js-cat-reentry-question = Яке пікове перевантаження та яку швидкість піка нагрівання бачить балістичний вхід в атмосферу?

js-cat-reentry-title = Коридор входу в атмосферу

js-cat-slot-timing-ocxo-leo-question = Як довго кварцовий генератор із термостатом на малому супутнику низької орбіти залишається в межах захисного інтервалу слоту після останнього визначення за ГНСС? (змодельовано)

js-cat-slot-timing-ocxo-leo-title = Синхронізація слотів

js-cat-small-uas-jammed-nav-question = Після того як глушник забирає ГНСС, наскільки дрейфує інерціальний блок класу польотного контролера порівняно з блоком тактичного класу?

js-cat-small-uas-jammed-nav-title = Малий дрон під глушінням

js-cat-solar-system-tour-question = Де перебуває кожне тіло, яке знає рушій, від Сонця до Плутона та великих супутників, і скільки часу світло йде між ними?

js-cat-solar-system-tour-title = Сонячна система в одну епоху

js-cat-space-packet-question = Чи кодується й декодується потік пакетів CCSDS 133.0 з точністю до біта?

js-cat-space-packet-title = Космічний пакет

js-cat-space-weather-question = Як сонячна / геомагнітна активність змінює густину термосфери? (змодельовано)

js-cat-space-weather-title = Космічна погода

js-cat-spoof-attack-question = Чи виявляється наростальний часовий спуфінг до того, як він досягає специфікації?

js-cat-spoof-attack-title = Виявлення спуфінгу

js-cat-spoof-detect-question = Чи може об'єднаний монітор RF + вимірювань виявити скоординований спуфінг?

js-cat-spoof-detect-title = Багаторівневе виявлення спуфінгу

js-cat-spoof-meaconing-question = За явної форми атаки, як часто енергетичний детектор із підтримкою годинника виявляє спуфінг за фіксованої частоти хибних тривог?

js-cat-spoof-meaconing-title = Статистика детектора спуфінгу

js-cat-starlink-sop-doppler-positioning-question = Наскільки добре приймач може визначити своє положення за Доплером широкосмугового угруповання, яке не надсилає навігаційного повідомлення? (змодельовано)

js-cat-starlink-sop-doppler-positioning-title = Широкосмугові сигнали нагоди

js-cat-sweep-clock-stability-question = Як змінюється holdover, коли перебирають один параметр годинника?

js-cat-sweep-clock-stability-title = Перебір параметра

js-cat-sweep-nd-inertial-question = Як показник якості змінюється на багатопараметричній сітці?

js-cat-sweep-nd-inertial-title = N-вимірний перебір

js-cat-telecom-prtc-holdover-24h-question = Чи рубідієвий еталон, який втрачає ГНСС на 24 h, залишається в межах масок похибки часу ITU-T? (змодельовано)

js-cat-telecom-prtc-holdover-24h-title = Телекомунікаційний holdover, 24 h

js-cat-telecom-synce-eec-question = Чи вільно працюючий генератор із термостатом залишається в межах масок дрейфу тактового генератора обладнання синхронного Ethernet? (змодельовано)

js-cat-telecom-synce-eec-title = Синхронізація частоти проти масок SyncE

js-cat-telecom-tie-ingest-question = Чи проходить запис похибки часового інтервалу маски MTIE і TDEV ITU-T?

js-cat-telecom-tie-ingest-title = Перевірка телекомунікаційних масок, ваші дані

js-cat-terrain-nav-question = Чи може висотомір виправити дрейф INS, зіставляючи профіль висот рельєфу?

js-cat-terrain-nav-title = Рельєфна навігація

js-cat-terrain-slam-question = Чи може фільтр частинок відстежувати змінний у часі дрейф INS відносно карти рельєфу?

js-cat-terrain-slam-title = Рельєфний SLAM

js-cat-time-transfer-budget-question = Що роблять доданки станції, транспондера, іоносфери та Саньяка з двостороннім зсувом часу і який його бюджет невизначеності? (змодельовано)

js-cat-time-transfer-budget-title = Двостороннє супутникове передавання часу

js-cat-timetransfer-question = Наскільки щільно два пункти можуть залишатися синхронізованими через лінію?

js-cat-timetransfer-title = Передавання часу

js-cat-tracking-loop-question = При якому C/N0 приймач справді втрачає захоплення і чи може спуфер перетягнути контури? (змодельовано)

js-cat-tracking-loop-title = Контур супроводження

js-cat-xona-pulsar-end-to-end-question = Той самий ланцюжок на публічних числах Xona Pulsar: сигнал, прохід, повідомлення, об'єднане визначення положення й прецизійне позиціонування. (змодельовано)

js-cat-xona-pulsar-end-to-end-title = Наскрізно, Xona Pulsar

js-cat-xona-pulsar-signals-question = Наскільки точно приймач може вимірювати дальність за опублікованими сигналами X1 і X5 і наскільки великий пошук захоплення? (публічна таблиця сигналів)

js-cat-xona-pulsar-signals-title = Сигнали Xona Pulsar

js-geo-a-place = Місце…

js-geo-axis-east = E +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = Форма вуличного каньйону потребує рушія 0.36.

js-geo-canyon-out-of-range = Значення вуличного каньйону виходять за діапазон (азимут від 0 до 359.9°, ширина від 1 до 200 m, висоти від 0 до 500 m, антена від 0 до 50 m); використано відкритий горизонт.

js-geo-canyon-reduced = Зведення каньйону рушієм до таблиці з 360 комірок.

js-geo-compute-failed = Рушій не зміг обчислити це небо: { $reason }

js-geo-computing = Обчислення…

js-geo-copy-link = Скопіюйте це посилання: { $url }

js-geo-count-below = Під горизонтом

js-geo-count-hidden = Приховано обрієм

js-geo-count-in-view = У полі зору

js-geo-count-open-sky = Відкрите небо

js-geo-count-used = У розв'язку

js-geo-cursor-live = Азимут { $az }°, обрій { $el }°.

js-geo-dated-sky = Датоване небо настільки добре, наскільки добрі елементи та їхній вік; пресети не включено.

js-geo-dop-geometric = геометричний

js-geo-dop-geometric-title = геометричний чинник погіршення точності

js-geo-dop-horizontal = горизонтальний

js-geo-dop-horizontal-title = горизонтальний чинник погіршення точності

js-geo-dop-position = положення, 3D

js-geo-dop-position-title = просторовий (3D) чинник погіршення точності положення

js-geo-dop-time = часовий

js-geo-dop-time-title = часовий чинник погіршення точності

js-geo-dop-vertical = вертикальний

js-geo-dop-vertical-title = вертикальний чинник погіршення точності

js-geo-east = Сх

js-geo-engine-not-running = Рушій не працює в цьому браузері ({ $reason }).

js-geo-err-geometry-object = відповідь рушія про геометрію не є об'єктом

js-geo-err-mc-object = відповідь рушія про Монте-Карло не є об'єктом

js-geo-err-no-sentences = у відповіді рушія немає речень

js-geo-err-reply-kind-not-json = відповідь рушія ({ $what }) не була JSON

js-geo-err-reply-not-json = відповідь рушія не була JSON

js-geo-error-line = При σ_UERE = { $uere } m, за заявленою моделлю похибок (показники рушія): { $bits }.

js-geo-error-line-needs = Похибка положення ≈ σ_UERE × HDOP по горизонталі та σ_UERE × VDOP по вертикалі; цей показник потребує рушія 0.36.

js-geo-error-rms-3d = RMS у 3D σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = горизонтальний RMS σ_UERE × HDOP = { $m } m

js-geo-error-sigma = Похибка в 1 сигму: схід { $east } m, північ { $north } m

js-geo-fact-ellipse-1s = Еліпс, 1 сигма

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, довга вісь { $deg }° від півночі

js-geo-fact-ellipse-pct = Еліпс, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1 сигма × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = Усередині еліпса 95 %

js-geo-fact-inside-value = { $pct } % точок

js-geo-fact-line = { $key }: { $value }.

js-geo-fact-mc = Монте-Карло

js-geo-fact-mc-value = розв'язків методом найменших квадратів: { $n }, зерно { $seed }

js-geo-fact-rms-3d = RMS хмари, 3D

js-geo-fact-rms-3d-beside = { $rms } m, поруч із σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = RMS хмари, горизонтальний

js-geo-fact-rms-h-beside = { $rms } m, поруч із σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }: не GeoJSON (очікувалися FeatureCollection, Feature або геометрія).

js-geo-gj-not-json = { $name }: не JSON ({ $reason }).

js-geo-gj-not-object = { $name }: не об'єкт GeoJSON.

js-geo-gj-too-many = { $name }: об'єктів — { $count }; ця сторінка малює щонайбільше { $max }.

js-geo-legend-item = { $label }: { $used } у розв'язку з { $total }

js-geo-link-copied = Посилання скопійовано.

js-geo-link-copied-no-tle = Посилання скопійовано (без ваших вставлених елементів: посилання відкриває пресети).

js-geo-mc-off = Вимк.

js-geo-missing-ellipse = еліпс похибки

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = хмара Монте-Карло

js-geo-missing-open-sky = частка відкритого неба

js-geo-missing-skyline = скайлайн

js-geo-missing-tdop = TDOP

js-geo-needs = потребує рушія 0.36

js-geo-needs-cap = Потребує рушія 0.36

js-geo-no = Ні

js-geo-no-ellipse = Немає еліпса

js-geo-no-sats = Немає супутників для показу.

js-geo-north = Пн

js-geo-not-given = не вказано

js-geo-note-elements-skipped = Пропущено наборів елементів: { $count }: { $list }.

js-geo-note-latitude-limited = Ця збірка рушія моделює майданчики в межах 89° від екватора; широту обмежено цим значенням.

js-geo-note-leo-left-out = LEO: потребує рушія 0.36; пропущено.

js-geo-note-no-engine = Рушій не працює в цьому браузері, тож показувати нічого. Він працює як WebAssembly; браузер або хост, що блокує WebAssembly, не може запустити це подання.

js-geo-note-pick-one = Оберіть щонайменше одну з систем GPS, Galileo і BeiDou.

js-geo-note-skyline-not-applied = Скайлайн намальовано, але не застосовано: для застосування потрібен рушій 0.36. Супутники за ним тут усе одно враховуються.

js-geo-note-skyline-source = Скайлайн: { $source }.

js-geo-note-training-model = Навчальна модель неба рушія { $version } (nmea_training) на { $instant }: кути в цілих градусах, а DOP з одним знаком після коми, як їх несуть речення приймача; розв'язок використовує щонайбільше 12 супутників, обраних за потужністю сигналу.

js-geo-note-unknown-systems = Пропущено записів супутників системи, яку це подання не малює: { $count }.

js-geo-off-leo = LEO: потребує рушія 0.36.

js-geo-off-monte-carlo = Хмара Монте-Карло потребує рушія 0.36.

js-geo-off-skyline = Застосування скайлайну потребує рушія 0.36: тут його лише намальовано.

js-geo-offset-own = Зсув від епохи ваших елементів ({ $epoch })

js-geo-offset-ref = Зсув від опорної епохи угруповань

js-geo-open-sky-share = { $pct } % верхньої півсфери

js-geo-out-of-range = Поза діапазоном, тому збережено останнє правильне значення: { $names }.

js-geo-own-elements-at = Ваші власні елементи на { $epoch }.

js-geo-pick-constellation = Оберіть щонайменше одне орбітальне угруповання.

js-geo-place-geiranger = Геїрангер-фіорд, Норвегія

js-geo-place-manhattan = Мідтаун Мангеттена, США

js-geo-place-oslo = Гавань Осло, Норвегія

js-geo-place-rotterdam = Порт Роттердама, Нідерланди

js-geo-place-singapore = Сінгапурська протока

js-geo-place-tallinn = Гавань Таллінна, Естонія

js-geo-place-tromso = Тромсе, Норвегія

js-geo-plot-desc =
    { $total ->
        [one] { $total } супутник на графіку
        [few] { $total } супутники на графіку
        [many] { $total } супутників на графіку
       *[other] { $total } супутника на графіку
    }, { $used ->
        [one] { $used } у розв'язку.
        [few] { $used } у розв'язку.
        [many] { $used } у розв'язку.
       *[other] { $used } у розв'язку.
    }

js-geo-preset-illustrative = Ілюстративний контур, намальований цією сторінкою; застосування скайлайну потребує рушія 0.36.

js-geo-ready = Готово.

js-geo-ready-needs = Готово. Потребує рушія 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: азимут { $az }°, висота { $el }°, закрито скайлайном

js-geo-sat-unused = { $label } { $id }: азимут { $az }°, висота { $el }°, не використовується

js-geo-sat-used = { $label } { $id }: азимут { $az }°, висота { $el }°, у розв'язку

js-geo-scenarios-under = Сценарії рушія під цим скайлайном:

js-geo-sky-canyon = Вуличний каньйон

js-geo-sky-drawn = Намальовано на скайплоті

js-geo-sky-open = Відкритий горизонт

js-geo-sky-preset = Пресет: { $name }

js-geo-sky-source = Небо: { $source }.

js-geo-skyline-city-street = Міська вулиця

js-geo-skyline-container = Контейнерний термінал

js-geo-skyline-fjord = Фіорд

js-geo-skyline-harbour = Підхід до гавані

js-geo-skyline-load-failed = Не вдалося завантажити скайлайн ({ $reason }).

js-geo-skyplot-downloaded = Скайплот завантажено.

js-geo-skyplot-export-failed = Не вдалося експортувати скайплот ({ $reason }).

js-geo-source-geometry = Рушій Kshana { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Рушій Kshana { $version }, навчальна модель неба

js-geo-south = Пд

js-geo-style-own-elements = Ваші елементи

js-geo-svg-refused = SVG рушія було відхилено

js-geo-table-count =
    { $n ->
        [one] { $n } супутник, стільки ж, як на скайплоті.
        [few] { $n } супутники, стільки ж, як на скайплоті.
        [many] { $n } супутників, стільки ж, як на скайплоті.
       *[other] { $n } супутника, стільки ж, як на скайплоті.
    }

js-geo-tle-epoch = Вкажіть епоху UTC від 2000 до 2099 року.

js-geo-tle-paste-first = Спершу вставте один або кілька дворядкових наборів елементів.

js-geo-tle-too-large = Вставлені елементи більші за 4 MiB — ліміт вхідних даних рушія.

js-geo-used-masked = Ні: закрито скайлайном

js-geo-using-own = Використовуються ваші власні елементи. Посилання містить лише те, що ви їх використали, а не самі елементи.

js-geo-wasm-blocked = WebAssembly заблоковано

js-geo-west = Зх

js-geo-why = Чому

js-geo-why-interim = Еліпс похибки та хмара Монте-Карло потребують рушія 0.36 (його функцій sky_geometry і sky_monte_carlo); рушій на цій сторінці старіший.

js-geo-why-no-ellipse = Рушій не дав еліпса для цієї геометрії (замало супутників для визначення положення або вироджена геометрія).

js-geo-why-no-ellipse-reason = Рушій не дав еліпса для цієї геометрії (замало супутників для визначення положення або вироджена геометрія): { $reason }.

js-geo-why-waiting = Очікування рушія.

js-geo-yes = Так

js-hold-axis-seconds = секунди від першого відліку

js-hold-axis-tau = час спостереження τ, s (лог.)

js-hold-axis-te = похибка часу, ns

js-hold-band-title = Смуга відновлення ±{ $band } ns

js-hold-blurb-example = Відліки кожні 5 s: 600 s із захопленням, ГНСС вимкнено на 600 s, holdover, ГНСС відновлено на 2400 s. Запис згенеровано для прикладу; це не вимірювання.

js-hold-blurb-ptp4l = Ті самі чотири кроки, прочитані з журналу сервоприводу ptp4l (власне зміщення демона, у ns). Журнал написано для прикладу; жоден демон не працював.

js-hold-budget-exceeded = { $name } вперше перевищено через { $s } s після вимкнення

js-hold-chip-baseline = Базовий рівень відносно його масок

js-hold-chip-envelope = Огинаюча holdover ePRTC-A

js-hold-chip-holdover = Holdover відносно його масок

js-hold-chip-measured = виміряно за маскою

js-hold-chip-recovery = Відновлення

js-hold-chip-words = Слова

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } залежно від часу спостереження, з межами маски

js-hold-envelope-exceeded = Огинаюча holdover ePRTC-A вперше перевищена через { $s } s після вимкнення

js-hold-envelope-exceeded-short = { $verdict }, вперше перевищено через { $s } s після вимкнення (запис коротший за період огинаючої)

js-hold-envelope-exceeded-value = { $verdict }, вперше перевищено через { $s } s після вимкнення

js-hold-envelope-short = { $verdict } (запис коротший за період огинаючої)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: не JSON.

js-hold-file-read-here = { $name }, прочитано тут; нічого не завантажено на сервер.

js-hold-file-too-large = { $name } більший, ніж ця сторінка читає.

js-hold-from-record = запис результату

js-hold-from-record-decimated = запис результату, проріджений до { $have } із { $total } відліків

js-hold-gnss-removed = ГНСС вимкнено

js-hold-gnss-removed-stated = ГНСС вимкнено (вказав оператор)

js-hold-gnss-restored = ГНСС відновлено

js-hold-gnss-restored-stated = ГНСС відновлено (вказав оператор)

js-hold-largest-at = { $value } на T+{ $time } s

js-hold-limit-label = маска ±{ $ns } ns, крок { $step }

js-hold-limit-title = { $id }: ±{ $ns } ns, максимальна абсолютна похибка часу на кроці { $step }

js-hold-mark-title = { $id }, межа { $limit } ns при τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = н/д

js-hold-no-curve = Немає кривої похибки часу: запис не вдалося відтворити для малювання.

js-hold-no-which-curve = У цьому результаті немає кривої: { $which }.

js-hold-not-exceeded = не перевищено

js-hold-not-recovered = не залишався в межах смуги

js-hold-not-result = це не результат тесту holdover

js-hold-open-failed = Не вдалося відкрити { $title }: { $reason }.

js-hold-opening = Відкриття { $title }…

js-hold-phase-baseline = Базовий рівень: із захопленням

js-hold-phase-holdover = Holdover: ГНСС вимкнено

js-hold-phase-recovery = Відновлення: ГНСС відновлено

js-hold-phase-title = { $phase }, від T+{ $from } s до { $to } s

js-hold-read-failed = Не вдалося прочитати або намалювати ({ $reason }).

js-hold-recorded = { $title }: записаний результат рушія (версія { $version }).

js-hold-recovered = у межах ±{ $band } ns протягом { $dwell } s, через { $after } s після повернення ГНСС

js-hold-result-not-json = результат не є JSON ({ $reason })

js-hold-result-not-loaded = записаний результат не завантажився

js-hold-row-envelope = Огинаюча holdover ePRTC-A

js-hold-row-frequency = Утримане зміщення частоти (підігнаний нахил)

js-hold-row-largest = Найбільша абсолютна похибка часу

js-hold-row-length = Тривалість holdover

js-hold-row-margin = Найменший запас усередині огинаючої

js-hold-row-peak = Пік після відновлення

js-hold-row-recovery = Відновлення

js-hold-row-recovery-step = Найбільший крок під час відновлення

js-hold-row-residual = Залишок щодо цієї лінії (rms)

js-hold-row-step = Крок у момент вимкнення

js-hold-status-final = { $status } { $label }; виміряно за маскою.

js-hold-step-span = T+{ $from } до { $to } s

js-hold-te-aria = Похибка часу протягом запису, з фазами та межами масок

js-hold-te-line-title = Похибка часу, ns

js-hold-te-note = Похибка часу з { $from }. Обидва моменти вказав { $by }.

js-hold-th-budget = Бюджет

js-hold-th-budget-limit = Межа |TE|, ns

js-hold-th-first-exceeded = Вперше перевищено після вимкнення, s

js-hold-th-largest = Найбільша |TE|, ns

js-hold-th-limit = Межа, ns

js-hold-th-margin = Запас, ns

js-hold-th-mask = Маска

js-hold-th-mean = Середнє, ns

js-hold-th-measured-on = Виміряно на

js-hold-th-metric = Метрика

js-hold-th-rms = RMS, ns

js-hold-th-samples = Відліки

js-hold-th-source = Джерело

js-hold-th-span = Охоплення

js-hold-th-step = Крок

js-hold-th-value = Значення, ns

js-hold-th-verdict = Вердикт

js-hold-th-worst-at = Найгірше при τ або T+, s

js-hold-title-example = Запис похибки часу

js-hold-title-ptp4l = Журнал linuxptp

js-hold-why-no-samples = результат не містить відліків похибки часу (record.series), тому криву не малюють

js-hold-why-not-series = ряд у результаті не є часовим рядом (менше двох відліків або час не зростає), тому криву не малюють

js-hold-why-sentence = { $why }.

js-hold-why-too-many = ряд у результаті має { $have } відліків, тоді як рушій оцінив { $scored }, тому криву не малюють

js-interf-attribution = Атрибуція

js-interf-build-failed = { $name }: не вдалося побудувати ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] Побудовано { $n } карту дня з { $name } рушієм { $version } у цьому браузері.
        [few] Побудовано { $n } карти дня з { $name } рушієм { $version } у цьому браузері.
        [many] Побудовано { $n } карт дня з { $name } рушієм { $version } у цьому браузері.
       *[other] Побудовано { $n } карти дня з { $name } рушієм { $version } у цьому браузері.
    }

js-interf-built-detail = { $date }: опубліковано комірок — { $published }, позначено — { $flagged }

js-interf-built-from-sample = Побудовано із синтетичного зразка ({ $kind }) рушієм у цьому браузері. Вигадані звіти; жодного реального повітряного судна, судна чи дня.

js-interf-built-maps =
    { $n ->
        [one] Побудовано { $n } карту ({ $detail }). Лише агрегат: позначена комірка не називає завади причиною.
        [few] Побудовано { $n } карти ({ $detail }). Лише агрегат: позначена комірка не називає завади причиною.
        [many] Побудовано { $n } карт ({ $detail }). Лише агрегат: позначена комірка не називає завади причиною.
       *[other] Побудовано { $n } карти ({ $detail }). Лише агрегат: позначена комірка не називає завади причиною.
    }

js-interf-built-none = { $name }: рушій не побудував жодної карти.

js-interf-caveat-coverage = Покриття залежить від джерела даних; прочитайте примітки про покриття.

js-interf-caveat-no-colour = Комірку без кольору не спостерігали. Це не доказ того, що в районі було чисто.

js-interf-caveat-not-finding = Погіршена або аномальна комірка не є висновком про завади. Існують інші причини.

js-interf-caveat-past-reports = Це опис минулих звітів про положення, а не прогноз і не вимірювання жодного приймача.

js-interf-caveats = Застереження

js-interf-cell-size-rule = Розмір комірки має бути числом градусів більше 0 і не більше 10 або порожнім для 0.5.

js-interf-check-failed = { $name }: не вдалося перевірити ({ $reason }).

js-interf-click-cell = Клацніть комірку або сфокусуйте карту й скористайтеся стрілками, щоб побачити її показники.

js-interf-close = Закрити

js-interf-close-file = Закрити { $name }

js-interf-col-affected = Зачеплено

js-interf-col-cell-area = Площа комірки

js-interf-col-detectors = Детектори

js-interf-col-observed = Спостережено

js-interf-col-sampled = Опитано

js-interf-col-share = Частка

js-interf-col-status = Стан

js-interf-coverage-limits = Межі покриття цього джерела

js-interf-csv-too-big = { $name }: більший за 24 MiB; побудуйте з уривка (інструмент командного рядка приймає файл повністю).

js-interf-csv-too-big-short = { $name }: більший за 24 MiB; побудуйте з уривка.

js-interf-custom-needs-licence = Власний набір даних потребує ліцензії, її URL і тексту атрибуції: їх записують у файл карти.

js-interf-dataset = Набір даних

js-interf-dates-rule = Дати мають формат YYYY-MM-DD; порожнє поле означає відсутність обмеження.

js-interf-day = Доба

js-interf-day-aria = Доба { $kind }

js-interf-day-confounded-note = Ця доба зі спотворювальним фоном: жодну комірку не визнано погіршеною через фон доби. Комірки, які за інших умов виділялися б, показано як неоцінені.

js-interf-day-figures-aria = Показники за добу

js-interf-demo-csv-name = { $file } (синтетичний зразок)

js-interf-demo-failed = Не вдалося відкрити демонстрацію: { $reason }.

js-interf-demo-opened = Синтетична демонстрація: три вигадані файли для вигаданого району відкритого океану (дві доби ADS-B, одна з них зі спотворювальним фоном, і одна доба AIS). За ними немає жодного реального повітряного судна, судна чи доби. Скористайтеся вибором доби на шарі ADS-B.

js-interf-demo-route-name = route.csv (синтетичний)

js-interf-describe-map = Карта { $kind } за { $date }: намальовано комірок — { $cells }, { $parts }. Комірки, які не намальовано, не спостерігалися.

js-interf-did-not-load = { $url } не завантажився

js-interf-engine-no-fn = У цій збірці рушія (версія { $version }) немає { $fn }; вона старша за цю сторінку. Еквівалент для командного рядка наведено на сторінці «Інструменти».

js-interf-engine-start-failed = Тут не вдалося запустити рушій ({ $reason }). Відкриття файлів карт вище все одно працює.

js-interf-err-format-version = { $name }: це непідтримувана карта завад Kshana (format_version { $version }; ця сторінка підтримує { $supported }).

js-interf-err-no-rows = { $name }: у цьому звіті немає rows[].

js-interf-err-not-json = { $name }: це не JSON ({ $reason }).

js-interf-err-not-map = { $name }: це GeoJSON, але не карта завад Kshana (немає елемента kshana_interference_map).

js-interf-err-not-route = { $name }: це не звіт Kshana про вплив на маршрут (немає елемента kshana_route_exposure).

js-interf-err-route-schema = { $name }: схема { $schema } не є { $expected }, яку читає ця сторінка.

js-interf-err-source-kind = { $name }: source_kind { $kind } не є ні adsb, ні ais.

js-interf-err-unknown-schema = { $name }: невідома схема { $schema }; ця сторінка читає { $supported }.

js-interf-foot-attribution = Атрибуція: { $text }

js-interf-foot-coverage = Покриття: { $notes }

js-interf-foot-layer = Шар { $kind }, { $date }. Комірки, які не намальовано, не спостерігалися.

js-interf-foot-licence = Ліцензія: { $licence }

js-interf-foot-licence-url = Ліцензія: { $licence } ({ $url })

js-interf-grid = Сітка: квадратні комірки розміром { $size }° за широтою й довготою ({ $type }). Ширина зі сходу на захід зменшується з широтою.

js-interf-guards = Захист від інших причин

js-interf-input = Вхідні дані

js-interf-land-set = Полігони суходолу: { $name }.

js-interf-land-too-big = Цей файл суходолу більший за 24 MiB.

js-interf-larger-than = { $name }: більший за { $limit }; ця сторінка читає файли карт не більших за цей розмір.

js-interf-layer-adsb-sub = комірки, де повітряні судна повідомляли про низьку навігаційну точність

js-interf-layer-ais-sub = комірки, де судна повідомляли про неправдоподібні положення чи рух

js-interf-layer-heading = Шар { $kind }

js-interf-layer-hidden = Шар { $kind } приховано.

js-interf-layers-separate = ADS-B і AIS — окремі шари з власними перемикачами, легендами та рядками ліцензії. Їх ніколи не зводять в одне кольорове поле чи один підрахунок.

js-interf-legend-aria = Що означає кожен стан комірки; зніміть позначку, щоб приглушити такі комірки

js-interf-licence = Ліцензія

js-interf-licence-aria = Ліцензія на дані { $name }

js-interf-licence-heading = Ліцензія на дані та атрибуція

js-interf-map-aria = { $summary } Клавіші зі стрілками переміщують між намальованими комірками.

js-interf-maps-open =
    { $n ->
        [one] Відкрито { $n } карту.
        [few] Відкрито { $n } карти.
        [many] Відкрито { $n } карт.
       *[other] Відкрито { $n } карти.
    }

js-interf-method-summary = Метод і застереження

js-interf-no-cell-at = Немає комірки в { $lat }, { $lon }: не спостерігалася. Це не доказ того, що в районі було чисто.

js-interf-no-cell-drawn = комірку не намальовано

js-interf-no-cells-draw = У цьому файлі немає комірок для малювання.

js-interf-no-day-figures = Цей файл не містить показників за добу.

js-interf-no-file-opened = Жодного файлу не вдалося відкрити.

js-interf-no-file-text = Відкриті карти не містять тексту файлу для перевірки (їх не відкривали як файли).

js-interf-none = немає

js-interf-none-stated = (не вказано)

js-interf-none-stated-file = (у цьому файлі не вказано)

js-interf-north-abbr = Пн

js-interf-not-evaluated = не оцінювалося

js-interf-not-opened-full = { $name }: не відкрито, уже відкрито максимальну кількість карт ({ $max }). Спершу закрийте кілька.

js-interf-nothing-open = Поки що нічого не відкрито.

js-interf-nothing-opened = Нічого не відкрито.

js-interf-one-day = по одній добі

js-interf-opened-file-map = Відкрито файлів: { $files }; відкритих карт: { $maps }.

js-interf-opened-file-maps = Відкрито файлів: { $files }; відкритих карт: { $maps }.

js-interf-opened-files-map = Відкрито файлів: { $files }; відкритих карт: { $maps }.

js-interf-opened-files-maps = Відкрито файлів: { $files }; відкритих карт: { $maps }.

js-interf-opening-demo = Відкриття синтетичної демонстрації…

js-interf-parameters = Параметри, зафіксовані до читання будь-яких даних

js-interf-read-draw-failed = { $name }: не вдалося прочитати чи намалювати ({ $reason }).

js-interf-read-failed = { $name }: не вдалося прочитати ({ $reason }).

js-interf-read-with-map = Читайте це разом із картою

js-interf-reading = Читання…

js-interf-route-aria = Вплив на маршрут { $name }

js-interf-route-chip = Маршрут

js-interf-route-done =
    { $n ->
        [one] Вплив на маршрут обчислено за { $n } картою рушієм { $version }; звіт показано нижче.
        [few] Вплив на маршрут обчислено за { $n } картами рушієм { $version }; звіт показано нижче.
        [many] Вплив на маршрут обчислено за { $n } картами рушієм { $version }; звіт показано нижче.
       *[other] Вплив на маршрут обчислено за { $n } картами рушієм { $version }; звіт показано нижче.
    }

js-interf-route-explain = Частка довжини маршруту в кожному стані за добами та джерелами. Чотири частки в сумі дають 1 і читаються разом: низька частка погіршеного за високої частки неспостереженого не означає, що там показано чисто. Рядки ADS-B і AIS ніколи не поєднують.

js-interf-route-exposure = Вплив на маршрут

js-interf-route-needs-map = Спершу відкрийте або побудуйте принаймні одну карту: маршрут перевіряється за картами на цій сторінці.

js-interf-route-open-failed = Не вдалося відкрити маршрут: { $reason }.

js-interf-route-range = від { $from } до { $to }

js-interf-route-too-big = { $name }: більший за 24 MiB.

js-interf-row-affected-share = Частка зачеплених

js-interf-row-aircraft-affected = Зачеплені повітряні судна

js-interf-row-aircraft-observed = Спостережені повітряні судна

js-interf-row-aircraft-sampled = Опитані повітряні судна

js-interf-row-area = Площа

js-interf-row-cell = Комірка

js-interf-row-detectors = Детектори, що спрацювали

js-interf-row-flagged = Позначено: { $detector }

js-interf-row-status = Стан

js-interf-row-vessels-observed = Спостережені судна

js-interf-rows-skipped = Пропущено рядків, що були недійсними: { $count }.

js-interf-rt-day = Доба

js-interf-rt-km = Маршрут, km

js-interf-rt-licence = Ліцензія та атрибуція карти

js-interf-rt-shares = Частки маршруту

js-interf-rt-source = Джерело

js-interf-sample-failed = Не вдалося відкрити зразок: { $reason }.

js-interf-save = Зберегти:

js-interf-save-report = Зберегти звіт (JSON)

js-interf-show-layer = Показати цей шар

js-interf-st-anomalous-label = Аномальна

js-interf-st-anomalous-text = Принаймні один детектор позначив тут того дня достатньо різних суден (щонайменше 3 судна й 20% спостережених). Можливі причини включають завади, але також багато звичайних.

js-interf-st-confounded-label = Доба зі спотворювальним фоном

js-interf-st-confounded-text = Медіанна частка комірок за весь день була високою, що вказує на причину широкої дії. У такий день жодну комірку не визнають погіршеною; ця комірка за інших умов виділялася б.

js-interf-st-degraded-label = Погіршена

js-interf-st-degraded-text = Висока частка опитаних тут того дня повітряних суден повідомила про низьку навігаційну точність, значно вищу за медіанну комірку доби. Причину це не пояснює.

js-interf-st-no-background-label = Немає оцінки фону

js-interf-st-no-background-text = Фон доби (типова частка повітряних суден, що повідомляють про низьку точність) не вдалося оцінити за достатньою кількістю комірок, тому жодну комірку з ним не порівнюють і жодну не визначають.

js-interf-st-not-anomalous-label = Не аномальна

js-interf-st-not-anomalous-text = Спостерігалася, і жоден детектор не спрацював. Це не доказ того, що нічого не сталося.

js-interf-st-not-degraded-label = Не погіршена

js-interf-st-not-degraded-text = Опитана, і частка повітряних суден, що повідомляють про низьку точність, не виділялася. Це не доказ того, що нічого не сталося.

js-interf-st-too-few-label = Замало повітряних суден

js-interf-st-too-few-text = Опубліковано (спостережено щонайменше 5 різних повітряних суден), але опитати вдалося менше ніж 10 повітряних суден, тому висновок не робиться.

js-interf-starting-build = Запуск рушія та побудова…

js-interf-starting-route = Запуск рушія та перевірка маршруту…

js-interf-state-clear-adsb = Чисто

js-interf-state-clear-adsb-text = Спостерігалася за достатньої кількості повітряних суден і не була позначена. Це не доказ того, що нічого не сталося.

js-interf-state-clear-ais = Чисто

js-interf-state-clear-ais-text = Спостерігалася за достатньої кількості суден і не була позначена. Це не доказ того, що нічого не сталося.

js-interf-state-degraded-adsb = Погіршена

js-interf-state-degraded-adsb-text = Висока частка опитаних тут того дня повітряних суден повідомила про низьку навігаційну точність, значно вищу за медіанну комірку доби.

js-interf-state-degraded-ais = Аномальна

js-interf-state-degraded-ais-text = Принаймні один детектор позначив тут того дня достатньо різних суден (щонайменше 3 судна й 20% спостережених).

js-interf-state-notobs-adsb = Не спостерігалася

js-interf-state-notobs-adsb-text = Комірку не намальовано: спостережено замало повітряних суден, щоб її опублікувати. Це не доказ того, що в районі було чисто.

js-interf-state-notobs-ais = Не спостерігалася

js-interf-state-notobs-ais-text = Комірку не намальовано: спостережено замало суден, щоб її опублікувати. Це не доказ того, що в районі було чисто.

js-interf-state-unassessed-adsb = Не оцінена

js-interf-state-unassessed-adsb-text = Спостерігалася, але опитати вдалося замало повітряних суден, доба була зі спотворювальним фоном або фон доби не вдалося оцінити, тому висновок не робиться.

js-interf-state-unassessed-ais = Не оцінена

js-interf-state-unassessed-ais-text = Спостерігалася, але висновок не робиться.

js-interf-status-unknown = Стан, який ця сторінка не описує.

js-interf-table-first = Показано перші { $shown } із { $total } комірок, спершу ті, що мають значення.

js-interf-table-summary = Кожна намальована комірка у вигляді таблиці ({ $n })

js-interf-the-day = Доба

js-interf-unknown-date = невідома дата

js-interf-warn-cell-size = Цей файл використовує розмір комірки { $size }°, який не є попередньо зареєстрованим: це не попередньо зареєстрований метод, тому його висновки не можна порівнювати з файлами, що його використовують.

js-interf-warn-cell-size-known = Цей файл використовує розмір комірки { $size }°, який не є попередньо зареєстрованим ({ $registered }°): це не попередньо зареєстрований метод, тому його висновки не можна порівнювати з файлами, що його використовують.

js-interf-warn-day-confounded = Ця доба зі спотворювальним фоном: жодну комірку не визнано погіршеною через фон доби (медіанна частка комірок сама була високою).

js-interf-warn-flag-disagrees = Комірок, прапорець «degraded» яких не збігається з їхнім станом: { $count }. Малюється стан.

js-interf-warn-no-licence = Цей файл не містить тексту { $fields }. Його показано, але карту без ліцензії та атрибуції не слід повторно публікувати.

js-interf-warn-on-land-off = Детектор «на суходолі» для цього файлу було вимкнено (полігони суходолу не надано).

js-interf-warn-skipped = Пропущено об'єктів, що не були дійсним GeoJSON: { $count }.

js-interf-warn-unknown-status = Значення стану, яких ця сторінка не знає: { $values }. Їх малюють як «без висновку».

js-interf-withheld = приховано (менше ніж 5)

js-interf-written-by = записано Kshana { $version }

js-kind-axis-3-d-position-error-m = 3D-похибка положення (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = тремтіння коду (m)

js-kind-axis-code-tracking-jitter-m = тремтіння супроводження коду (m)

js-kind-axis-doppler-shift-hz = доплерівський зсув (Hz)

js-kind-axis-effective-c-n0-db-hz = ефективне C/N0 (dB-Hz)

js-kind-axis-elevation = висота (°)

js-kind-axis-fit-interval-s = інтервал підгонки (s)

js-kind-axis-formal-position-sigma-m = формальна сигма положення (m)

js-kind-axis-latitude = широта (°)

js-kind-axis-leo-satellites-added-to-the = супутники LEO, додані до розв'язку

js-kind-axis-mean-satellites-in-view = середня кількість супутників у полі зору

js-kind-axis-median-dilution-of-precision = медіанне погіршення точності

js-kind-axis-median-error-m = медіанна похибка (m)

js-kind-axis-median-pdop = медіанний PDOP

js-kind-axis-metres = метри

js-kind-axis-observation-window-s = вікно спостереження (s)

js-kind-axis-offset-from-the-signal-s = зсув від центру сигналу (MHz)

js-kind-axis-offset-from-the-snapshot-centre = зсув від центру знімка (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = похибка положення (m)

js-kind-axis-power-spectral-density-db-hz = спектральна щільність потужності (dB/Hz, одинична потужність)

js-kind-axis-power-spectral-density-dbw-hz = спектральна щільність потужності (dBW/Hz)

js-kind-axis-probability-of-detection = імовірність виявлення

js-kind-axis-range-error-m = похибка дальності (m)

js-kind-axis-relays = ретранслятори

js-kind-axis-sisre-root-mean-square-m = SISRE, середньоквадратичне значення (m)

js-kind-axis-time-error-ns = похибка часу (ns)

js-kind-axis-time-s = час (s)

js-kind-axis-time-since-the-start-min = час від початку (min)

js-kind-axis-update-period-s = період оновлення (s)

js-kind-cap-body-pnt-label = Позиціонування за ретрансляторами

js-kind-cap-campaign-label = Кампанія

js-kind-cap-constellation-design-label = Покриття

js-kind-cap-leo-navmsg-label = Навігаційне повідомлення

js-kind-cap-leo-pass-label = Прохід і лінія зв'язку

js-kind-cap-leo-pnt-chain-label = Наскрізний ланцюг

js-kind-cap-leo-ppp-label = Позиціонування

js-kind-cap-leo-pvt-label = Позиціонування

js-kind-cap-leo-signal-label = Проєктування сигналу

js-kind-cap-lunar-llr-datum-label = Опорна величина лазерної локації

js-kind-cap-ntn-positioning-label = Позиціонування

js-kind-cap-solar-system-label = Сонячна система

js-kind-cap-spectrum-label = Спектр

js-kind-guided-doppler-error-hz = Похибка Доплера (Hz)

js-kind-guided-duration-s = Тривалість (s)

js-kind-guided-earth-range-error-m = Похибка дальності до Землі (m)

js-kind-guided-elevation-mask = Маска висоти (°)

js-kind-guided-first-jammer-bandwidth-mhz = Смуга першого глушника (MHz)

js-kind-guided-first-jammer-power-dbw = Потужність першого глушника (dBW)

js-kind-guided-first-jammer-range-m = Дальність до першого глушника (m)

js-kind-guided-first-jammer-received-power-dbw = Прийнята потужність першого глушника (dBW)

js-kind-guided-first-phase-length-s = Тривалість першої фази (s)

js-kind-guided-first-shell-altitude-km = Висота першої оболонки (km)

js-kind-guided-first-shell-inclination = Нахил першої оболонки (°)

js-kind-guided-first-signal-bandwidth-hz = Смуга першого сигналу (Hz)

js-kind-guided-first-system-range-error-m = Похибка дальності першої системи (m)

js-kind-guided-fit-interval-s = Інтервал підгонки (s)

js-kind-guided-gravity-field-degree = Степінь гравітаційного поля

js-kind-guided-grid-step = Крок сітки (°)

js-kind-guided-integration-time-s = Час інтегрування (s)

js-kind-guided-leo-satellites-in-the-sweep = Супутники LEO в переборі

js-kind-guided-loop-bandwidth-hz = Смуга контуру (Hz)

js-kind-guided-monte-carlo-runs = Прогони Монте-Карло

js-kind-guided-network-synchronisation-error-m = Похибка синхронізації мережі (m)

js-kind-guided-orbit-altitude-km = Висота орбіти (km)

js-kind-guided-orbit-determination-error-m = Похибка визначення орбіти (m)

js-kind-guided-orbit-inclination = Нахил орбіти (°)

js-kind-guided-pdop-threshold = Поріг PDOP

js-kind-guided-peak-elevation-of-the-pass = Максимальна висота проходу (°)

js-kind-guided-points-per-orbit-track = Точок на трасі орбіти

js-kind-guided-receiver-noise-figure-db = Коефіцієнт шуму приймача (dB)

js-kind-guided-receiver-power-when-awake-mw = Потужність приймача в активному режимі (mW)

js-kind-guided-reference-c-n0-db-hz = Опорне C/N0 (dB-Hz)

js-kind-guided-relay-altitude-km = Висота ретрансляторів (km)

js-kind-guided-relay-inclination = Нахил ретрансляторів (°)

js-kind-guided-relay-planes = Площини ретрансляторів

js-kind-guided-relay-range-error-m = Похибка дальності до ретранслятора (m)

js-kind-guided-relays-per-plane = Ретрансляторів на площину

js-kind-guided-runs-per-case = Прогонів на випадок

js-kind-guided-satellite-altitude-km = Висота супутника (km)

js-kind-guided-second-system-range-error-m = Похибка дальності другої системи (m)

js-kind-guided-shared-condition = Спільна умова

js-kind-guided-slant-electron-content-tecu = Похилий електронний вміст (TECU)

js-kind-guided-slant-range-km = Похила дальність (km)

js-kind-guided-spoofed-offset-m = Зсув від спуфінгу (m)

js-kind-guided-spoofing-starts-s = Початок спуфінгу (s)

js-kind-guided-sweep-from = Перебір від

js-kind-guided-sweep-steps = Кроки перебору

js-kind-guided-sweep-to = Перебір до

js-kind-guided-timeline-step-s = Крок часової шкали (s)

js-kind-guided-tracking-threshold-db-hz = Поріг супроводження (dB-Hz)

js-kind-guided-transmit-power-dbw = Потужність передавача (dBW)

js-kind-guided-update-period-s = Період оновлення (s)

js-kind-guided-user-latitude = Широта користувача (°)

js-kind-hint-a-band-under-this-carrier = смуга з відношенням несівної до шуму нижче цього значення втратила захоплення

js-kind-hint-a-grid-point-is-available = точка сітки доступна, поки її геометричний чинник DOP для положення нижчий за це значення

js-kind-hint-a-satellite-must-be-this = супутник має бути не нижче цієї висоти, щоб вважатися видимим

js-kind-hint-a-satellite-must-be-this-2 = супутник має бути не нижче цієї висоти, щоб його використовували

js-kind-hint-a-satellite-of-the-first = супутник першої системи має бути не нижче цієї висоти

js-kind-hint-arc-one-message-is-fitted = дуга, на якій підганяється одне повідомлення

js-kind-hint-code-tracking-loop-noise-bandwidth = шумова смуга контуру супроводження коду

js-kind-hint-detail-of-the-truth-orbit = деталізація гравітаційної моделі еталонної орбіти

js-kind-hint-distance-from-the-first-jammer = відстань від першого глушника до приймача

js-kind-hint-distance-to-the-satellite-in = відстань до супутника в компромісі за смугою

js-kind-hint-drawn-while-acquiring-and-tracking = споживана під час захоплення та супроводження

js-kind-hint-equivalent-isotropically-radiated-power-of = еквівалентна ізотропно випромінювана потужність першого глушника

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = еквівалентна ізотропно випромінювана потужність смуги

js-kind-hint-filter-runs-averaged-for-each = прогони фільтра, усереднені для кожного випадку (більше означає повільніше)

js-kind-hint-first-value-of-the-swept = перше значення параметра, що перебирається

js-kind-hint-height-of-the-chain-s = висота супутника ланцюга

js-kind-hint-height-of-the-first-shell = висота орбіт першої оболонки

js-kind-hint-height-of-the-relay-orbits = висота орбіт ретрансляторів над тілом

js-kind-hint-height-of-the-satellite-whose = висота супутника, повідомлення якого підганяється

js-kind-hint-how-far-the-spoofer-moves = наскільки спуфер зміщує обчислене положення

js-kind-hint-how-finely-each-orbit-is = наскільки густо кожну орбіту дискретизують для малюнка

js-kind-hint-how-high-the-satellite-climbs = на яку висоту піднімається супутник

js-kind-hint-how-long-the-first-phase = скільки триває перша фаза

js-kind-hint-how-long-the-receiver-integrates = скільки приймач інтегрує для однієї дальності

js-kind-hint-how-many-low-orbit-satellites = скільки низькоорбітальних супутників додає перебір геометрії

js-kind-hint-how-many-seeded-runs-make = із скількох прогонів із зерном складається ансамбль

js-kind-hint-how-many-values-are-run = скільки значень запускається

js-kind-hint-how-often-a-new-message = як часто випускається нове повідомлення

js-kind-hint-how-wide-the-first-jammer = наскільки широко перший глушник розподіляє свою потужність

js-kind-hint-ionosphere-along-the-path-in = іоносфера вздовж траєкторії, в одиницях повного електронного вмісту

js-kind-hint-last-value-of-the-swept = останнє значення параметра, що перебирається

js-kind-hint-length-of-each-filter-run = тривалість кожного прогону фільтра

js-kind-hint-length-of-the-run = тривалість прогону

js-kind-hint-length-of-the-timeline = тривалість часової шкали

js-kind-hint-occupied-bandwidth-of-the-first = зайнята смуга першого опорного сигналу

js-kind-hint-one-sigma-doppler-measurement-error = односигмова похибка вимірювання Доплера

js-kind-hint-one-sigma-error-of-a = односигмова похибка дальності до ретранслятора

js-kind-hint-one-sigma-error-of-the = односигмова похибка двосторонньої дальності від Землі

js-kind-hint-orbital-planes-of-the-navigation = орбітальні площини навігаційних ретрансляторів

js-kind-hint-power-of-the-first-jammer = потужність першого глушника на приймачі

js-kind-hint-raises-the-noise-floor-under = піднімає рівень шуму під кожною смугою

js-kind-hint-satellites-in-each-plane = супутники в кожній площині

js-kind-hint-sets-the-doppler-range-a = задає діапазон Доплера, який має охопити холодний пошук

js-kind-hint-signal-in-space-range-error = похибка дальності сигналу в космосі першої системи

js-kind-hint-signal-in-space-range-error-2 = похибка дальності сигналу в космосі другої системи

js-kind-hint-signal-level-the-tracking-figures = рівень сигналу, для якого наведено показники супроводження

js-kind-hint-spacing-of-the-latitude-and = крок сітки за широтою та довготою

js-kind-hint-spacing-of-the-shared-mission = крок спільної часової сітки місії

js-kind-hint-the-part-of-the-range = частина похибки дальності, яку повідомлення не може усунути

js-kind-hint-the-value-every-member-runs = значення, за якого запускається кожен учасник

js-kind-hint-tilt-of-that-orbit = нахил цієї орбіти

js-kind-hint-tilt-of-the-first-shell = нахил площин першої оболонки

js-kind-hint-tilt-of-the-relay-planes = нахил площин ретрансляторів

js-kind-hint-timing-error-between-satellites-as = похибка часу між супутниками, виражена як дальність

js-kind-hint-when-the-spoofer-captures-the = коли спуфер захоплює приймач

js-kind-hint-where-the-receiver-stands = де розташований приймач

js-kind-hint-where-the-user-stands = де розташований користувач

js-kind-label-3-d-error = 3D-похибка

js-kind-label-3-d-error-time-of = 3D-похибка, час прибуття

js-kind-label-a-corrupted-frame-is-rejected = пошкоджений кадр відхиляється

js-kind-label-all-channels = усі канали

js-kind-label-availability = Доступність

js-kind-label-band = Смуга

js-kind-label-bodies = Тіла

js-kind-label-body = Тіло

js-kind-label-both = обидва

js-kind-label-case = Випадок

js-kind-label-class = Клас

js-kind-label-code-jitter = тремтіння коду

js-kind-label-constellation = Орбітальне угруповання

js-kind-label-doppler = Доплер

js-kind-label-event = Подія

js-kind-label-evidence = Докази

js-kind-label-fewest-in-view = Найменше у полі зору

js-kind-label-field = Поле

js-kind-label-first-detection-after-onset = Перше виявлення після початку

js-kind-label-frame-length = Довжина кадру

js-kind-label-fused = злито

js-kind-label-fused-cap = Злито

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS і LEO

js-kind-label-gnss-channels = Канали GNSS

js-kind-label-gnss-highest-in-sky = GNSS { $id } (найвище на небі)

js-kind-label-gnss-only = лише GNSS

js-kind-label-gnss-only-cap = Лише GNSS

js-kind-label-gnss-signal = Сигнал GNSS

js-kind-label-hdop = HDOP

js-kind-label-highest = Найвище

js-kind-label-horizontal-error = горизонтальна похибка

js-kind-label-horizontal-error-2 = Горизонтальна похибка

js-kind-label-jammer = Глушник

js-kind-label-jump-threshold = Поріг стрибка

js-kind-label-largest-range-jump = Найбільший стрибок дальності

js-kind-label-largest-range-jump-against-the = найбільший стрибок дальності відносно порога

js-kind-label-leo = LEO

js-kind-label-leo-channels = Канали LEO

js-kind-label-leo-only = лише LEO

js-kind-label-light-time-from-observer = Світловий час від { $observer }

js-kind-label-light-time-from-the-observer = Світловий час від спостерігача

js-kind-label-light-time-one-way = Світловий час в один бік

js-kind-label-lowest = Найнижче

js-kind-label-lowest-c-n0 = Найнижче C/N0

js-kind-label-mean = Середнє

js-kind-label-mean-in-view = Середнє у полі зору

js-kind-label-median-convergence = Медіанна збіжність

js-kind-label-median-pdop = Медіанний PDOP

js-kind-label-member-runs = Прогони учасників

js-kind-label-message-switch-iod = перемикання повідомлення, випуск даних { $old } на { $new }

js-kind-label-mission-length = Тривалість місії

js-kind-label-model = модель

js-kind-label-monte-carlo-runs = Прогони Монте-Карло

js-kind-label-noise-floor = Рівень шуму

js-kind-label-parameters = Параметри

js-kind-label-payload = Корисне навантаження

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, 95-й процентиль

js-kind-label-peak-elevation = Максимальна висота

js-kind-label-peak-tracked-c-n0 = Максимальне супроводжуване C/N0

js-kind-label-phase = Фаза

js-kind-label-predicted-horizontal-sigma = прогнозована горизонтальна сигма

js-kind-label-quantisation-position = Квантування, положення

js-kind-label-range-error = похибка дальності

js-kind-label-relays-above-the-mask = ретранслятори над маскою

js-kind-label-relays-and-earth-link = ретранслятори та лінія зв'язку із Землею

js-kind-label-relays-only = лише ретранслятори

js-kind-label-satellite = Супутник

js-kind-label-satellites = Супутники

js-kind-label-satellites-used = Використані супутники

js-kind-label-signal = Сигнал

js-kind-label-signal-chip-spacing = { $name } (крок чипа { $spacing })

js-kind-label-sisre-after-quantisation = SISRE після квантування

js-kind-label-sisre-root-mean-square = SISRE, середньоквадратичне значення

js-kind-label-spoofing-starts = початок спуфінгу

js-kind-label-standard-deviation = Стандартне відхилення

js-kind-label-sun-separation = Кутова відстань до Сонця

js-kind-label-sweep-runs = Прогони перебору

js-kind-label-system = Система

js-kind-label-time-above-the-mask = Час над маскою

js-kind-label-time-error-root-mean-square = Похибка часу, середньоквадратичне значення

js-kind-label-tracked-component = супроводжувана складова

js-kind-label-tracking-threshold = Поріг супроводження

js-kind-label-transmit-bandwidth = Смуга передавання

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Оцінка Велча синтезованих відліків

js-kind-label-whole-signal = увесь сигнал

js-kind-label-wideband-j-s-tolerated = Допустиме широкосмугове J/S

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Доступність у найгіршому місці

js-kind-no = ні

js-kind-note-a-gap-is-an-epoch = Прогалина — це епоха, коли у полі зору замало ретрансляторів для розв'язку.

js-kind-note-a-helmert-transform-is-the = Перетворення Гельмерта — це семипараметричні зсув, поворот і масштаб між двома системами відліку.

js-kind-note-a-low-earth-orbit-leo = Супутник на низькій навколоземній орбіті (LEO) перетинає небо за хвилини, тому його C/N0 (відношення несівної до густини шуму) зростає й спадає дзвоном; супутник GNSS за цей час майже не рухається.

js-kind-note-a-receiver-independent-exchange-format = Запис у стилі Receiver Independent Exchange Format (RINEX) 4. Типи записів LEO — розширення Kshana, як сказано в заголовку.

js-kind-note-a-single-pass-fixes-the = Один прохід визначає напрям уздовж траєкторії набагато краще, ніж поперек.

js-kind-note-aos-is-acquisition-of-signal = AOS — це захоплення сигналу, TCA — час найближчого зближення, а LOS — втрата сигналу.

js-kind-note-c-n0-is-the-carrier = C/N0 — це відношення несівної до густини шуму. Смуга, що нижча за поріг супроводження приймача, втратила захоплення.

js-kind-note-cells-are-the-code-and = Комірки — це біни коду та Доплера, які має перевірити холодний пошук.

js-kind-note-cold-is-a-first-fix = Холодний — це перший розв'язок без жодних попередніх відомостей; гарячий — розв'язок невдовзі після попереднього.

js-kind-note-dilution-of-precision-dop-scales = Геометричний чинник DOP (погіршення точності) перетворює похибку дальності на похибку положення: G — геометричний, P — положення, H — горизонтальний, V — вертикальний. Процентилі обчислено за всіма точками сітки та епохами.

js-kind-note-drawn-at-the-strongest-signal = Побудовано за найсильнішого рівня сигналу в прогоні. Прогалина — це відрізок без жодного супутника у полі зору.

js-kind-note-each-body-carries-its-own = Кожне тіло має власну позначку рівня доказів. Світловий час — в один бік, від спостерігача, названого в сценарії.

js-kind-note-each-row-is-one-full = Кожен рядок — це один повний прогін рушія для сценарію, що перебирається.

js-kind-note-each-rule-is-a-switch = Кожне правило — це перемикання на новіше повідомлення посеред проходу.

js-kind-note-each-signal-is-drawn-about = Кожен сигнал побудовано навколо власної центральної частоти. Прогалина — це спектральний нуль.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP — це еквівалентна ізотропно випромінювана потужність.

js-kind-note-every-phase-is-an-ordinary = Кожна фаза — це звичайний прогін сценарію. Хеші ідентифікують вхідні дані кожного учасника та його документ результату.

js-kind-note-iod-is-the-issue-of = IOD — це випуск даних: серійний номер повідомлення.

js-kind-note-j-s-is-the-jammer = J/S — це відношення потужностей глушника та сигналу. Частка супроводження — це частка прогону, протягом якої смуга лишається вище порога.

js-kind-note-p05-p50-and-p95-are = p05, p50 і p95 — це 5-й, 50-й і 95-й процентилі. ci95 — це 95-відсотковий довірчий інтервал середнього.

js-kind-note-parameters-are-public-with-a = Параметри мають позначку PUBLIC (з джерелом), REPRESENTATIVE або WORKSHOP, як зазначає кожен набір.

js-kind-note-precise-point-positioning-ppp-converges = Прецизійне точкове позиціонування (PPP) збігається, коли похибка лишається нижче критерію. NEES — це нормована квадратична похибка оцінювання, перевірка узгодженості фільтра.

js-kind-note-sisre-defined = SISRE — це похибка дальності сигналу в космосі: те, що транслюване повідомлення додає до дальності користувача. Тут це похибка подання повідомлення відносно власної еталонної орбіти рушія.

js-kind-note-sisre-is-the-signal-in = SISRE — це похибка дальності сигналу в космосі, прийнята для транслюваних орбіти та годинника кожної системи.

js-kind-note-ssc-is-the-spectral-separation = SSC — це коефіцієнт спектрального розділення: яка частина потужності одного сигналу потрапляє в приймач іншого. Риска означає, що ці два сигнали не перекриваються.

js-kind-note-the-chain-runs-the-signal = Ланцюг виконує етапи сигналу, проходу, навігаційного повідомлення, позиціонування та прецизійного позиціонування по черзі. Кожен рядок — це число, яке обчислив один етап і використав наступний.

js-kind-note-the-doppler-and-pass-geometry = Монітор Доплера та геометрії проходу порівнює виміряні швидкості зміни дальності з передбаченими за орбітами. Правило позначає початок спуфінгу.

js-kind-note-the-engine-draws-its-spectrum = Рушій будує свою модель спектра як синфазні та квадратурні (IQ) відліки в один момент і оцінює з них спектр назад. Ті самі відліки є експортом SigMF (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = Власний задокументований двійковий кадр рушія, закритий 24-бітною циклічною перевіркою надмірності (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = Середньоквадратична смуга Габора задає, наскільки точно за сигналом можна вимірювати дальність.

js-kind-note-the-largest-jammer-to-signal = Найбільше відношення глушника до сигналу (J/S), крізь яке супроводжує кожен сигнал, для глушників із неперервною хвилею (CW), узгодженого спектра та широкосмугового.

js-kind-note-the-shapiro-delay-is-the = Затримка Шапіро — це додатковий світловий час через гравітацію Сонця вздовж траєкторії.
