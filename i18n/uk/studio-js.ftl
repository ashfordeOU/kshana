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

js-kind-note-the-spectrum-kind-and-the = Різновиди «спектр» і «глушіння» обчислюють ту саму лінію двома способами; останній стовпець — їхня різниця.

js-kind-note-time-of-arrival-toa-ranging = Вимірювання дальності за часом прибуття (TOA) на низхідній лінії нетеррестріальної мережі (NTN): ширший сигнал дає точніше вимірювання дальності.

js-kind-note-what-half-a-least-significant = Чого коштує половина наймолодшого біта (LSB) кожного поля в положенні та в годиннику, виражена як дальність.

js-kind-rowhead-block = Блок

js-kind-rowhead-condition = Умова

js-kind-rowhead-figure = Показник

js-kind-rowhead-member = Учасник

js-kind-rowhead-metric = Метрика

js-kind-rowhead-monitor = Монітор

js-kind-rowhead-phase = Фаза

js-kind-rowhead-satellite = Супутник

js-kind-rowhead-signal = Сигнал

js-kind-rowhead-solution = Розв'язок

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = лише Доплер

js-kind-sub-from-to = від { $from } до { $to }

js-kind-sub-fused = злито

js-kind-sub-gnss-and-leo-latitude = GNSS і LEO, широта { $lat }°

js-kind-sub-gnss-only = лише GNSS

js-kind-sub-gnss-only-latitude = лише GNSS, широта { $lat }°

js-kind-sub-model-fit-seconds = { $model }, підгонка { $fit } s

js-kind-threshold-4-needed-for-a-fix = для розв'язку потрібно 4

js-kind-threshold-convergence-criterion = критерій збіжності

js-kind-threshold-elevation-mask = маска висоти

js-kind-threshold-gnss-median = медіана GNSS

js-kind-threshold-tracking-threshold = поріг супроводження

js-kind-title-acquisition = Захоплення

js-kind-title-against-a-simulated-campaign = Порівняно із змодельованою кампанією

js-kind-title-assumptions = Припущення

js-kind-title-band-trade-at-equal-transmit = Компроміс за смугою за однакової потужності передавача

js-kind-title-bands = Смуги

js-kind-title-beside-the-published-figures = Поруч з опублікованими показниками

js-kind-title-beside-the-published-speed-up = Поруч з опублікованим прискоренням

js-kind-title-bodies = Тіла

js-kind-title-body = Тіло

js-kind-title-by-latitude = За широтою

js-kind-title-c-n0-by-band-over = C/N0 за смугами протягом прогону

js-kind-title-c-n0-over-the-pass = C/N0 протягом проходу

js-kind-title-cases = Випадки

js-kind-title-central-body = Центральне тіло

js-kind-title-closed-form-doppler-against-finite = Доплер у замкненому вигляді порівняно зі скінченними різницями

js-kind-title-code-tracking-jitter = Тремтіння супроводження коду

js-kind-title-code-tracking-jitter-against-c = Тремтіння супроводження коду залежно від C/N0

js-kind-title-combined-over-the-members = Об'єднано за учасниками

js-kind-title-compatibility-with-gnss-signals = Сумісність із сигналами GNSS

js-kind-title-constellations = Орбітальні угруповання

js-kind-title-continuity-across-message-switches = Безперервність під час перемикань повідомлень

js-kind-title-cross-check-against-the-jamming = Перехресна перевірка з різновидом «глушіння»

js-kind-title-datum-accuracy = Точність опорної величини

js-kind-title-dilution-of-precision-over-the = Погіршення точності на всій сітці

js-kind-title-doppler = Доплер

js-kind-title-doppler-envelopes = Огинаючі Доплера

js-kind-title-doppler-only-fix = Розв'язок лише за Доплером

js-kind-title-doppler-over-the-pass = Доплер протягом проходу

js-kind-title-doppler-positioning-from-one-pass = Доплерівське позиціонування за один прохід

js-kind-title-earth-link = Лінія зв'язку із Землею

js-kind-title-elevation = Висота

js-kind-title-encoded-frame = Закодований кадр

js-kind-title-epoch = Епоха

js-kind-title-epoch-and-frame = Епоха та система відліку

js-kind-title-events = Події

js-kind-title-every-node-of-the-sweep = Кожен вузол перебору

js-kind-title-field-table = Таблиця полів

js-kind-title-figures-of-merit = Показники якості

js-kind-title-filter-noise = Шум фільтра

js-kind-title-fit-interval-trade = Компроміс за інтервалом підгонки

js-kind-title-fix-quality-against-observation-window = Якість розв'язку залежно від вікна спостереження

js-kind-title-frame-checks = Перевірки кадру

js-kind-title-frame-hexadecimal = Кадр, шістнадцяткове подання

js-kind-title-geometry-against-latitude = Геометрія залежно від широти

js-kind-title-geometry-as-leo-satellites-are = Геометрія в міру додавання супутників LEO

js-kind-title-geometry-position-dilution-of-precision = Геометрія: погіршення точності положення

js-kind-title-global-coverage = Глобальне покриття

js-kind-title-gnss-leo-and-fused = GNSS, LEO і злитий розв'язок

js-kind-title-gnss-reference = Еталон GNSS

js-kind-title-hand-offs-between-phases = Передавання між фазами

js-kind-title-helmert-fit = Підгонка Гельмерта

js-kind-title-helmert-transform-parameters = Параметри перетворення Гельмерта

js-kind-title-inputs = Вхідні дані

js-kind-title-ionosphere-free-band-pairs = Пари смуг без впливу іоносфери

js-kind-title-jammer-tolerance = Стійкість до глушника

js-kind-title-jammers = Глушники

js-kind-title-joint-fix = Спільний розв'язок

js-kind-title-leo-against-gnss = LEO порівняно з GNSS

js-kind-title-limitations = Обмеження

js-kind-title-links = Лінії зв'язку

js-kind-title-member-runs = Прогони учасників

js-kind-title-members-under-the-shared-conditions = Учасники за спільних умов

js-kind-title-message = Повідомлення

js-kind-title-message-models-compared = Порівняння моделей повідомлення

js-kind-title-message-switches = Перемикання повідомлень

js-kind-title-metric-against-axis = { $metric } залежно від { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: розподіл за прогонами

js-kind-title-mid-pass-update = Оновлення посеред проходу

js-kind-title-modelled = Змодельовано

js-kind-title-monte-carlo = Монте-Карло

js-kind-title-navigation-message-stage = Етап навігаційного повідомлення

js-kind-title-not-modelled = Не змодельовано

js-kind-title-notes = Примітки

js-kind-title-notes-on-the-spoofing-model = Примітки до моделі спуфінгу

js-kind-title-observation-windows = Вікна спостереження

js-kind-title-one-pass-alone = Лише один прохід

js-kind-title-orbit = Орбіта

js-kind-title-over-the-message-sequence = За послідовністю повідомлень

js-kind-title-pass = Прохід

js-kind-title-pass-c-n0-of-the = Прохід: C/N0 усього сигналу та супроводжуваної складової

js-kind-title-pass-code-tracking-jitter = Прохід: тремтіння супроводження коду

js-kind-title-pass-doppler = Прохід: Доплер

js-kind-title-pass-stage = Етап проходу

js-kind-title-passes = Проходи

js-kind-title-phases = Фази

js-kind-title-position-error-gnss-leo-and = Похибка положення: GNSS, LEO і злитий розв'язок

js-kind-title-position-uncertainty-relays-alone-and = Невизначеність положення: лише ретранслятори та разом із лінією зв'язку із Землею

js-kind-title-positioning-by-signal-bandwidth = Позиціонування залежно від смуги сигналу

js-kind-title-positioning-gnss-alone-against-the = Позиціонування: лише GNSS порівняно зі злитим розв'язком

js-kind-title-power-spectral-density = Спектральна щільність потужності

js-kind-title-power-spectral-density-of-each = Спектральна щільність потужності кожного сигналу

js-kind-title-precise-point-positioning = Прецизійне точкове позиціонування

js-kind-title-published-comparison = Опубліковане порівняння

js-kind-title-quantisation-budget = Бюджет квантування

js-kind-title-range-residuals = Залишки дальності

js-kind-title-ranging-stations = Станції вимірювання дальності

js-kind-title-reading-the-trade = Як читати компроміс

js-kind-title-realised-position-error = Реалізована похибка положення

js-kind-title-receiver = Приймач

js-kind-title-receiver-power-budget = Енергетичний бюджет приймача

js-kind-title-reflector-information = Відомості про відбивач

js-kind-title-relay-constellation = Угруповання ретрансляторів

js-kind-title-relays-in-view = Ретранслятори у полі зору

js-kind-title-reproducibility = Відтворюваність

js-kind-title-retroreflectors = Ретрорефлектори

js-kind-title-rinex-style-record = Запис у стилі RINEX

js-kind-title-round-trips = Круговий обмін

js-kind-title-run = Прогін

js-kind-title-satellites-in-view-against-latitude = Супутники у полі зору залежно від широти

js-kind-title-sensitivity-to-a-line-of = Чутливість до нахилу лінії візування

js-kind-title-shared-conditions = Спільні умови

js-kind-title-signal-components = Складові сигналу

js-kind-title-signal-stage = Етап сигналу

js-kind-title-signals = Сигнали

js-kind-title-sisre-against-fit-interval = SISRE залежно від інтервалу підгонки

js-kind-title-sisre-against-update-period = SISRE залежно від періоду оновлення

js-kind-title-sisre-weights = Ваги SISRE

js-kind-title-snapshot = Знімок

js-kind-title-snapshot-against-the-model = Знімок порівняно з моделлю

js-kind-title-snapshot-spectrum-welch-estimate-against = Спектр знімка: оцінка Велча порівняно з моделлю

js-kind-title-sources = Джерела

js-kind-title-spoofer-and-monitor-settings = Параметри спуфера та монітора

js-kind-title-spoofing-monitor-probability-of-detection = Монітор спуфінгу: імовірність виявлення

js-kind-title-statistics-over-the-runs = Статистика за прогонами

js-kind-title-sweep = Перебір

js-kind-title-systems = Системи

js-kind-title-systems-in-the-fix = Системи в розв'язку

js-kind-title-the-archived-campaign = Архівована кампанія

js-kind-title-time-error = Похибка часу

js-kind-title-time-error-by-receiver-clock = Похибка часу за годинником приймача

js-kind-title-time-scale = Шкала часу

js-kind-title-time-to-first-fix-and = Час до першого розв'язку та енергія на розв'язок

js-kind-title-time-transfer-by-clock-and = Передавання часу за годинником і рівнем сигналу

js-kind-title-trade-conditions = Умови компромісу

js-kind-title-update-period-trade = Компроміс за періодом оновлення

js-kind-title-user = Користувач

js-kind-title-user-range-error-through-the = Похибка дальності користувача протягом проходу

js-kind-title-validated = Перевірено

js-kind-title-what-each-stage-hands-to = Що кожен етап передає наступному

js-kind-title-what-this-run-is-and = Що це за прогін і чим він не є

js-kind-title-when-each-monitor-detects = Коли кожен монітор виявляє

js-kind-title-work-done = Виконана робота

js-kind-yes = так

js-ledger-rows =
    { $n ->
        [one] { $n } рядок реєстру
        [few] { $n } рядки реєстру
        [many] { $n } рядків реєстру
       *[other] { $n } рядка реєстру
    }

js-lib-abbr-apv = заходження на посадку з вертикальним наведенням

js-lib-abbr-araim = розширений автономний контроль цілісності приймача

js-lib-abbr-auc = площа під кривою

js-lib-abbr-c-n0 = відношення несівної до густини шуму

js-lib-abbr-ccsds = Консультативний комітет з космічних інформаційних систем

js-lib-abbr-cli = інтерфейс командного рядка

js-lib-abbr-csac = атомний годинник чипового масштабу

js-lib-abbr-cw = неперервна хвиля

js-lib-abbr-doi = цифровий ідентифікатор об'єкта

js-lib-abbr-dop = геометричний чинник (погіршення точності)

js-lib-abbr-eo = спостереження Землі

js-lib-abbr-gnss = глобальна навігаційна супутникова система

js-lib-abbr-gps = Глобальна система позиціонування

js-lib-abbr-hal = горизонтальна межа тривоги

js-lib-abbr-hpl = горизонтальний рівень захисту

js-lib-abbr-imu = інерціальний вимірювальний блок

js-lib-abbr-ins = інерціальна навігаційна система

js-lib-abbr-iot = Інтернет речей

js-lib-abbr-itu-t = Міжнародний союз електрозв'язку, сектор стандартизації електрозв'язку

js-lib-abbr-j-s = відношення потужностей глушника та сигналу

js-lib-abbr-leo = низька навколоземна орбіта

js-lib-abbr-llr = лазерна локація Місяця

js-lib-abbr-meo = середня навколоземна орбіта

js-lib-abbr-mtie = максимальна похибка часового інтервалу

js-lib-abbr-ntn = нетеррестріальна мережа

js-lib-abbr-ocxo = кварцовий генератор з термостатуванням

js-lib-abbr-oem = повідомлення про ефемериди орбіти

js-lib-abbr-omm = повідомлення про середні елементи орбіти

js-lib-abbr-pdop = геометричний чинник DOP для положення (погіршення точності)

js-lib-abbr-pnt = позиціонування, навігація та час

js-lib-abbr-ppp = прецизійне точкове позиціонування

js-lib-abbr-raim = автономний контроль цілісності приймача

js-lib-abbr-rf = радіочастота

js-lib-abbr-rinex = незалежний від приймача формат обміну

js-lib-abbr-roc = робоча характеристика приймача

js-lib-abbr-sbas = супутникова система функціонального доповнення

js-lib-abbr-sgp4 = спрощені загальні збурення 4, розповсюджувач орбіт

js-lib-abbr-sisre = похибка дальності сигналу в космосі

js-lib-abbr-slam = одночасна локалізація та картографування

js-lib-abbr-spp = одноточкове позиціонування

js-lib-abbr-tdev = девіація часу

js-lib-abbr-tle = двострокова множина елементів

js-lib-abbr-toml = формат файлу сценарію

js-lib-abbr-trn = навігація за рельєфом місцевості

js-lib-abbr-uhf = ультрависока частота

js-lib-abbr-ukf = ненаближений фільтр Калмана

js-lib-abbr-utc = координований всесвітній час

js-lib-abbr-val = вертикальна межа тривоги

js-lib-abbr-vlbi = радіоінтерферометрія наддовгої бази

js-lib-abbr-vpl = вертикальний рівень захисту

js-lib-abbr-wg = робоча група

js-lib-areas-ground-track = Траса на поверхні

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Доступність

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Синхронізація p95

js-lib-compare-timing-rms = Синхронізація RMS

js-lib-counts-explorer-tally = { $validated } з { $total } можливостей перевірено за незалежним зовнішнім оракулом · { $modelled } змодельовано · { $partner } належать партнеру — показано тут як { $cards } карток можливостей у { $domains } областях, тверджень про докази: { $evidence }

js-lib-counts-validated-tally = { $validated } з { $total } можливостей перевірено за незалежним зовнішнім оракулом — показано тут як { $cards } карток можливостей і тверджень про докази: { $evidence }

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = файл рушія повернув HTTP { $status }

js-lib-engine-page-not-running = рушій тут не працює

js-lib-engine-worker-crashed = виконавець рушія аварійно завершився

js-lib-evidence-aria = Докази: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } рядок реєстру
        [few] { $n } рядки реєстру
        [many] { $n } рядків реєстру
       *[other] { $n } рядка реєстру
    }

js-lib-evidence-rows-behind = Рядки реєстру, що стоять за цим результатом

js-lib-geometry-url-bad-mc = Кількість вибірок Монте-Карло не належить до { $choices }; використано { $default }.

js-lib-geometry-url-bad-number = «{ $key }» не є числом від { $min } до { $max }; використано типове значення.

js-lib-geometry-url-bad-site = Місце не задано як широта,довгота[,висота] у припустимих межах; використано типове місце.

js-lib-geometry-url-bad-sky = Скайлайн не є ні набором, ні таблицею з 360 інтервалів, ні каньйоном у припустимих межах; використано відкритий горизонт.

js-lib-geometry-url-bad-sys = Список орбітальних угруповань не є G, E, C і щонайбільше одним L:<набір LEO>, відомим цьому поданню; використано типову суміш.

js-lib-geometry-url-own-tle = Відправник використав власні орбітальні елементи (TLE), яких посилання не містить; натомість показано набори.

js-lib-geometry-url-repeated = «{ $key }» трапляється більш ніж один раз; використано перше значення.

js-lib-geometry-url-too-long = Адреса довша за { $max } символів, тому жодного з її параметрів не прочитано.

js-lib-geometry-url-unreadable = Адресу не вдалося прочитати.

js-lib-guided-duration-s-hint = як довго розповсюджувати трасу на поверхні

js-lib-guided-duration-s-label = Тривалість (s)

js-lib-guided-dut1-s-hint = зсув обертання Землі; зсуває трасу на поверхні на схід або захід

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = супутник має бути не нижче цієї висоти, щоб вважатися видимим

js-lib-guided-mask-deg-label = Маска висоти (°)

js-lib-guided-seed-hint = інша реалізація шуму тієї самої фізики

js-lib-guided-seed-label = Зерно випадковості

js-lib-guided-sigma-uere-m-hint = 1-σ еквівалентна похибка дальності користувача для підсумку положення

js-lib-guided-sigma-uere-m-label = Похибка дальності σ (m)

js-lib-guided-station-lat-deg-hint = широта наземної станції — визначає геометрію проходу

js-lib-guided-station-lat-deg-label = Широта станції (°)

js-lib-guided-station-lon-deg-hint = довгота наземної станції

js-lib-guided-station-lon-deg-label = Довгота станції (°)

js-lib-guided-step-s-hint = частота відліків траси на поверхні

js-lib-guided-step-s-label = Крок часу (s)

js-lib-guided-threshold-ns-hint = бюджет у межах специфікації; «доступно», поки похибка нижча за нього

js-lib-guided-threshold-ns-label = Поріг специфікації (ns)

js-lib-guided-time-duration-s-hint = загальна тривалість прогону

js-lib-guided-time-duration-s-label = Тривалість (s)

js-lib-guided-time-step-s-hint = частота інтегрування / відліків

js-lib-guided-time-step-s-label = Крок часу (s)

js-lib-guided-user-altitude-km-hint = орбітальна висота космічного апарата користувача

js-lib-guided-user-altitude-km-label = Висота користувача (km)

js-lib-guided-user-inclination-deg-hint = нахил орбіти користувача

js-lib-guided-user-inclination-deg-label = Нахил користувача (°)

js-lib-imufit-card-accel-slope = Нахил девіації Аллана акселерометра, на початку (близько -0.5 для білого шуму)

js-lib-imufit-card-bias = Зміщення акселерометра, середнє (m/s²)

js-lib-imufit-card-bias-instability = Нестабільність зміщення акселерометра (m/s²), 0, коли крива не має мінімуму

js-lib-imufit-card-gyro-bias = Зміщення гіроскопа, середнє (rad/s)

js-lib-imufit-card-gyro-slope = Нахил девіації Аллана гіроскопа, на початку (близько -0.5 для білого шуму)

js-lib-imufit-card-note-n = Примітка { $n }

js-lib-imufit-card-q-arw = Випадкове блукання кута гіроскопа, q_arw (rad²/s)

js-lib-imufit-card-q-va = Випадкове блукання швидкості акселерометра, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Частота дискретизації

js-lib-imufit-card-samples = Відліки

js-lib-imufit-card-span = Інтервал

js-lib-jammertest-card-clean-epochs = Чисті епохи

js-lib-jammertest-card-clean-hours = Чисті години

js-lib-jammertest-card-detected = Виявлено в межах допуску

js-lib-jammertest-card-detection-rate = Частка виявлення (будь-яка тривога)

js-lib-jammertest-card-evaluable = Придатні до оцінювання

js-lib-jammertest-card-fa-epochs = Епохи хибної тривоги

js-lib-jammertest-card-fa-per-hour = Серії хибної тривоги за годину

js-lib-jammertest-card-fa-runs = Серії хибної тривоги

js-lib-jammertest-card-in-tol-rate = Виявлено в межах допуску, частка

js-lib-jammertest-card-late = Із запізненням

js-lib-jammertest-card-median-latency = Медіанна затримка виявлення

js-lib-jammertest-card-median-recover = Медіанний час відновлення

js-lib-jammertest-card-missed = Пропущено

js-lib-jammertest-card-na = н/д

js-lib-jammertest-card-not-assessable = У цьому журналі жоден тест не придатний до оцінювання, тому частку виявлення чи затримку навести не можна. Це результат, а не збій сторінки: тут нічого не пройдено.

js-lib-jammertest-card-not-json = { $name }: це не JSON ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name }: це не таблиця оцінок jammertest (потрібні tests[] і summary).

js-lib-jammertest-card-tests = Тести у зрізі плану

js-lib-jammertest-card-too-large = { $name }: більший за 8 MiB; ця сторінка читає таблицю оцінок не більшого розміру.

js-lib-kpi-available-everywhere = доступно скрізь, у кожну епоху

js-lib-kpi-available-everywhere-pdop = доступно скрізь, у кожну епоху (PDOP, геометричний чинник DOP для положення, нижче за { $thr })

js-lib-kpi-drops-under = опускається нижче порога супроводження { $thr } dB-Hz: захоплення втрачено

js-lib-kpi-end-of-mission = наприкінці місії

js-lib-kpi-figure-tiers = Рівні показників: { $parts }.

js-lib-kpi-n-modelled = { $n } змодельовано

js-lib-kpi-n-partner = { $n } належать партнеру

js-lib-kpi-n-validated = { $n } перевірено

js-lib-kpi-no-change = без змін

js-lib-kpi-no-fix = { $pct } % часу чи місць без розв'язку

js-lib-kpi-no-fix-pdop = { $pct } % часу чи місць без розв'язку за PDOP нижче { $thr }

js-lib-kpi-over-jump = понад поріг стрибка { $thr } m

js-lib-kpi-over-pdop = понад поріг PDOP { $thr }

js-lib-kpi-stays-above = лишається вище порога супроводження { $thr } dB-Hz

js-lib-kpi-under-jump = нижче порога стрибка { $thr } m

js-lib-kpi-under-pdop = нижче порога PDOP { $thr }

js-lib-orbit3d-apogee = апогей

js-lib-orbit3d-perigee = перигей

js-lib-orbit3d-prov-scenario = сценарій { $hash }

js-lib-orbit3d-title = Орбіта (ECI, ортографічна проєкція)

js-lib-orbit3d-view-angles = азимут { $az }° · висота { $el }°

js-lib-overlay-meta-clock-bias-m = Зміщення годинника

js-lib-overlay-meta-converged-pos-3sigma-m = Положення 3σ

js-lib-overlay-meta-converged-pos-rms-m = Положення RMS

js-lib-overlay-meta-converged-pos-sigma-m = Положення σ

js-lib-overlay-meta-final-clock-freq-sigma = Частота годинника σ

js-lib-overlay-meta-mean-relays-in-view = Ретранслятори у полі зору

js-lib-overlay-meta-pos-p95-m = Положення p95

js-lib-overlay-meta-pos-rms-m = Положення RMS

js-lib-overlay-meta-postfit-rms-m = RMS після підгонки

js-lib-overlay-prov-scenario = сценарій { $hash }

js-lib-overlay-subtitle = |похибка| (ns) залежно від часу — прогонів: { $n }

js-lib-overlay-time-s = час (s)

js-lib-overlay-title = Накладання: похибка часу під час перерви

js-lib-packs-cannot-unpack = цей браузер не може розпакувати записаний файл

js-lib-replay-demos-below-130 = Залишено лише азимути нижче 130° (заявлено)

js-lib-replay-demos-coastal-drag-off = Берегове відтягування положення

js-lib-replay-demos-combined-event = Комбінована подія

js-lib-replay-demos-drag-off-stated = Відтягування положення (заявлено демонстрацією)

js-lib-replay-demos-ferry-drag-off = Рейс порома, відтягування положення

js-lib-replay-demos-ferry-drag-off-description = Вигаданий журнал порома, Таллінн — Гельсінкі, 1 Hz. З 1500 s відтягування положення відводить повідомлене положення, тоді як приймач і далі повідомляє про дійсне визначення.

js-lib-replay-demos-fjord = Природна деградація у фіорді

js-lib-replay-demos-masked-sky = Рейс порома, половину неба замасковано

js-lib-replay-demos-masked-sky-description = Той самий журнал порома із заглушеною західною половиною неба з 600 s, вужчим небом від 900 s до 1200 s і відтягуванням положення з 1500 s: один прогін, у якому небо, сигнал і положення по черзі виходять з ладу.

js-lib-replay-demos-open-sea-jamming = Глушіння у відкритому морі

js-lib-replay-demos-port-approach = Спуфінг часу під час заходу в порт

js-lib-replay-demos-source-training = Синтетичний сценарій { $id }: потік nmea_training рушія та журнал інструктора, оцінені його receiver-trust.

js-lib-replay-demos-source-trust = Синтетичний журнал { $id }: вигаданий NMEA, оцінений receiver-trust рушія.

js-lib-replay-demos-west-masked = Західну половину неба замасковано (заявлено)

js-lib-replay-demos-west-masked-again = Західну половину знову замасковано (заявлено)

js-lib-report-charts = Діаграми

js-lib-report-eyebrow = точний момент

js-lib-report-figures-of-merit = Показники якості

js-lib-report-footer = Kshana { $version } · сценарій { $hash } · створено { $iso }. Відтворюється зі сценарію, зерна та версії рушія. Працює локально; нічого не завантажується.

js-lib-report-not-applicable = не застосовується (атаку не налаштовано)

js-lib-report-scenario-definition = Визначення сценарію (TOML)

js-lib-report-th-clock = Годинник

js-lib-report-th-metric = Метрика

js-lib-report-th-validation = Перевірка

js-lib-report-th-value = Значення

js-lib-report-tier-note = Кожен показник якості позначено як { $validated } (перевірено за незалежним зовнішнім оракулом) або { $modelled } (з перших принципів, внутрішньо протестовано) — виведено з матриці верифікації.

js-lib-report-title = Kshana — звіт про сценарій

js-lib-skydraw-azimuth-range = азимут від { $from } до { $to } градусів

js-lib-skydraw-describe = Перелічено супутників: { $listed }, із сигналом: { $heard }

js-lib-skydraw-describe-mean = Перелічено супутників: { $listed }, із сигналом: { $heard }, середнє { $snr } dB-Hz

js-lib-skydraw-east = Сх

js-lib-skydraw-no-signal-from = немає сигналу з: { $sectors }

js-lib-skydraw-none-listed = У журналі на цей момент немає жодного супутника.

js-lib-skydraw-north = Пн

js-lib-skydraw-sat-heard = { $sys } { $prn }: висота { $el }, азимут { $az }, сигнал { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }: висота { $el }, азимут { $az }, у списку, сигналу немає

js-lib-skydraw-south = Пд

js-lib-skydraw-unheard-sector = Супутники в списку між азимутами { $from } і { $to } градусів, жоден із сигналом

js-lib-skydraw-west = Зх

js-lib-skyline-edit-describe = Скайлайн на { $blocked } із 360 градусів азимута; найвищий { $el }° на азимуті { $az }°.

js-lib-skyline-edit-open = Відкритий горизонт: скайлайну немає.

js-lib-stages-all-planets = Усі планети

js-lib-stages-au-from-sun = { $d } au від Сонця

js-lib-stages-band-carrier = Несівна { $name }, { $mhz } MHz

js-lib-stages-bin-title = від { $from } до { $to }{ $unit }: прогонів — { $count }

js-lib-stages-body-and-moons = { $name } і місяці

js-lib-stages-cell-title = шир. { $lat }°, довг. { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Навігаційне повідомлення

js-lib-stages-chain-pass = Прохід і лінія зв'язку

js-lib-stages-chain-ppp = Прецизійне точкове позиціонування

js-lib-stages-chain-pvt = Злите позиціонування

js-lib-stages-chain-signal = Проєктування сигналу

js-lib-stages-coverage-aria = { $field }: { $body }, за широтою та довготою

js-lib-stages-feature-n = об'єкт { $n }

js-lib-stages-flag = прапорець

js-lib-stages-frequency-mhz = частота (MHz)

js-lib-stages-from-to = від { $from } до { $to }

js-lib-stages-geojson-aria = Експорт GeoJSON, намальований на карті

js-lib-stages-histogram = Гістограма

js-lib-stages-inner-planets = Внутрішні планети

js-lib-stages-km-from-centre = { $d } km від центру ({ $centre })

js-lib-stages-linear-scale = лінійна шкала

js-lib-stages-link-light-time = { $from } — { $to }: світловий час в один бік { $time } s

js-lib-stages-longitude-axis = довгота · широта вздовж боку

js-lib-stages-mission-time = час місії (s)

js-lib-stages-noise-floor = рівень шуму

js-lib-stages-orrery-note = { $scale } · площина x-y системи відліку, вид від її північного полюса

js-lib-stages-panel-n = Панель { $n }

js-lib-stages-plan-view-aria = Вид зверху: { $centre } і тіла навколо, { $scale }

js-lib-stages-psd-at-t = Спектральна щільність потужності за t = { $t } s

js-lib-stages-psd-axis = спектральна щільність потужності (dBW/Hz)

js-lib-stages-runs = прогони

js-lib-stages-sat-title = { $constellation } { $id } · шир. { $lat }°, довг. { $lon }°

js-lib-stages-satellites = супутники

js-lib-stages-spectrum-at-t = спектр за t = { $t } s

js-lib-stages-sqrt-scale = шкала відстаней за квадратним коренем

js-lib-stages-the-body = тіло

js-lib-stages-time-s = час (s)

js-lib-stages-unit-alarm = Тривога

js-lib-stages-unit-cn0 = Відношення несівної до густини шуму

js-lib-stages-unit-position = Положення та захист

js-lib-stages-unit-satellites = Супутники

js-lib-stages-unit-time-error = Похибка часу

js-lib-stages-waterfall-aria = Водоспад спектральної щільності потужності: частота по горизонталі, час донизу

js-lib-stages-whole-band = Уся смуга

js-lib-sweep-clock-availability = { $who }: доступність

js-lib-sweep-clock-holdover = { $who }: holdover (s)

js-lib-sweep-clock-timing-p95 = { $who }: синхронізація p95 (ns)

js-lib-sweep-clock-timing-rms = { $who }: синхронізація RMS (ns)

js-lib-sweep-max-altitude = макс. висота (km)

js-lib-sweep-max-elevation = макс. висота над горизонтом (°)

js-lib-sweep-max-speed = макс. швидкість (m/s)

js-lib-sweep-min-altitude = мін. висота (km)

js-lib-sweep-peak-doppler = пік Доплера (Hz)

js-lib-sweep-prov-scenario = сценарій { $hash }

js-lib-sweep-y-vs-x = { $y } залежно від { $x }

js-lib-tabs-3d-orbit = 3D-орбіта

js-lib-tabs-figures-of-merit = Показники якості

js-lib-tabs-stability = Стабільність

js-lib-tabs-sweep = Перебір

js-lib-tabs-time-series = Часовий ряд

js-lib-tour-ashforde-body = Дякуємо, що досліджуєте Kshana. Ми створюємо відкриту, відтворювану інженерію, що ставить докази на перше місце, для місій, які не можуть зазнати невдачі, і чесно говоримо про те, що перевірено, а що змодельовано. Запитання, співпраця чи дослідження? Пишіть нам на contact@ashforde.org.

js-lib-tour-ashforde-title = Від Ashforde® OÜ

js-lib-tour-capabilities-body = Оберіть вкладку області — Орбіти, Синхронізація, Інерційні, GNSS, Стійкість, Місяць, AI/ML, Сумісність — щоб побачити її можливості, кожна з позначкою «Перевірено» або «Змодельовано», і кнопку запуску ▸ для робочих сценаріїв. Відкрийте «Докази та походження» в будь-якій області, щоб простежити підтвердження, або ввімкніть «Лише перевірені», щоб побачити тільки те, що перевірено за зовнішнім оракулом.

js-lib-tour-capabilities-title = Досліджуйте рушій по одній області

js-lib-tour-cite-body = Kshana створено, щоб на неї посилатися: цитований випуск програмного забезпечення з DOI, а також статті в рецензованому стилі про розрив оптимізму щодо RF-завад і умовний рівень захисту часу. Скопіюйте цитату прямо звідси.

js-lib-tour-cite-title = Публікації та як цитувати

js-lib-tour-download-report-body = Вкладка «Перебір» змінює один параметр у діапазоні; «Закріпити для порівняння» накладає два чи більше прогонів поруч із Δ між ними (працює для різних типів сценаріїв — годинник, Mars-PNT, позиціонування…); а ця кнопка завантажує прогін як автономний офлайновий звіт HTML.

js-lib-tour-download-report-title = Перебір, порівняння та експорт

js-lib-tour-guided-body = Керовані регулятори пристосовуються до сценарію — зерно, поріг специфікації, тривалість, маска висоти, висота орбіти — і кожна зміна миттєво запускає прогін заново.

js-lib-tour-guided-title = Налаштуйте повзунки

js-lib-tour-mcp-body = Сервер MCP дає змогу асистентам ШІ запускати перевірений рушій замість того, щоб гадати; плагін JetBrains запускає сценарії клацанням правою кнопкою.

js-lib-tour-mcp-title = Користуйтеся з агента ШІ чи вашого IDE

js-lib-tour-playground-body = Виберіть сценарій зі списку — або натисніть ▸ на будь-якій можливості вище — і рушій запуститься як WebAssembly на вашому комп'ютері. Нічого не завантажується.

js-lib-tour-playground-title = Запустіть у браузері

js-lib-tour-run-body = Запустіть поточний сценарій. Відкрийте «Розширене», щоб редагувати TOML і змінювати що завгодно; «Скопіювати посилання» відтворює саме цей прогін для когось іншого.

js-lib-tour-run-title = Запустіть

js-lib-tour-tabs-body = Перемикайтеся між показниками якості, діаграмою часового ряду, стабільністю годинника (девіація Аллана) і — для прогонів орбіт — інтерактивним 3D-поданням орбіти.

js-lib-tour-tabs-title = Читайте результати

js-lib-tour-validation-body = Цей самий оглядач є також реєстром доказів: кожна область має панель «Докази та походження» — показник, зовнішній оракул, за яким його перевірено, і чесний статус «Перевірено» / «Змодельовано» для кожного твердження. «Лише перевірені» відфільтровує рядки, перевірені за наборами даних.

js-lib-tour-validation-title = Докази, а не прикметники

js-lib-views-3-sigma-bound = межа 3 сигма

js-lib-views-3d-position-error = 3D-похибка положення

js-lib-views-a-parameter = параметр

js-lib-views-band-runs = Смуга похибки часу за { $runs } прогонами Монте-Карло

js-lib-views-band-the-runs = Смуга похибки часу за прогонами Монте-Карло

js-lib-views-below-tracking = нижче порога супроводження

js-lib-views-chart = діаграма

js-lib-views-classical = класичний

js-lib-views-epoch = епоха

js-lib-views-four-needed = для розв'язку потрібно 4

js-lib-views-free-inertial = вільна інерційна навігація

js-lib-views-gnss-denied = GNSS недоступна

js-lib-views-ground-track = Траса на поверхні

js-lib-views-heatmap-effective = Ефективне відношення несівної до густини шуму за супутниками та часом

js-lib-views-heatmap-nominal = Номінальне (без глушника) відношення несівної до густини шуму за супутниками та часом

js-lib-views-horizontal-alert-limit = горизонтальна межа тривоги

js-lib-views-horizontal-hpl = горизонтальний (HPL)

js-lib-views-id-bound = { $id }: межа

js-lib-views-id-median = { $id }: медіана

js-lib-views-id-offset = { $id }: зсув

js-lib-views-id-p95 = { $id }: p95

js-lib-views-map-matched = зіставлення з картою

js-lib-views-map-matched-title = Зіставлення з картою порівняно з похибкою положення вільної інерційної навігації

js-lib-views-metric = метрика

js-lib-views-oscillator = генератор

js-lib-views-oscillator-source = генератор ({ $source })

js-lib-views-position-error-axis = похибка положення ({ $unit })

js-lib-views-position-error-m = похибка положення (m)

js-lib-views-position-error-run = Похибка положення протягом прогону

js-lib-views-position-m = положення (m)

js-lib-views-predicted-time-error = Прогнозована похибка часу від останнього розв'язку

js-lib-views-protection-level-m = рівень захисту (m)

js-lib-views-protection-levels = Рівні захисту відносно межі тривоги

js-lib-views-quantum = квант

js-lib-views-relay-error-bound = Похибка положення за навігацією через ретранслятори та її межа 3 сигма

js-lib-views-satellites = супутники

js-lib-views-satellites-tracking = Видимі супутники, що ще супроводжуються

js-lib-views-shaded-gnss-denied = затінено: GNSS недоступна

js-lib-views-slot-guard = захисний інтервал слота

js-lib-views-spoofed-offset = Спуфінговий зсув часу відносно межі виявлення

js-lib-views-sweep-of = Перебір, параметр { $parameter }: { $metric }

js-lib-views-sync-error-axis = похибка синхронізації ({ $unit })

js-lib-views-sync-error-run = Похибка синхронізації протягом прогону

js-lib-views-threshold = поріг

js-lib-views-time-error-ns = похибка часу (ns)

js-lib-views-time-ns = час (ns)

js-lib-views-time-s = час (s)

js-lib-views-time-since-fix = час від останнього розв'язку (s)

js-lib-views-timing-error-axis = похибка синхронізації часу ({ $unit })

js-lib-views-timing-error-run = Похибка синхронізації часу протягом прогону

js-lib-views-tracking = супроводження

js-lib-views-value = значення

js-lib-views-vertical-vpl = вертикальний (VPL)

js-lib-views-visible = видимі

js-lib-views-word-enbw = еквівалентна шумова смуга

js-lib-views-word-nfft = довжина FFT

js-lib-views-word-stec = похилий TEC

js-lib-views-word-toa = час прибуття

js-lib-views-word-ttff = час до першого розв'язку

js-lib-views-word-tx = передавання

js-lib-views-word-zwd = зенітна волога затримка

js-lunar-address-outside-range = { $label }: «{ $raw }» виходить за межі від { $min } до { $max }; використано значення з файлу.

js-lunar-address-too-long = Адреса була задовга; показано типові значення.

js-lunar-address-unknown-source = Невідоме джерело в адресі; показано запис.

js-lunar-alert-limit = межа тривоги { $value } (ілюстративна)

js-lunar-alert-not-stated = межу тривоги не вказано

js-lunar-bearing-east = 90° Сх

js-lunar-bearing-west = 90° Зх

js-lunar-cell-title = { $lat }°, { $lon }°: скоригована { $corrected }, доступність { $availability }, покриття { $coverage }

js-lunar-copy-address = Скопіюйте адресу з адресного рядка.

js-lunar-counts = Супутників: { $sats }, точок сітки: { $points }, епох: { $epochs }, випробувань Монте-Карло на епоху: { $trials }. Позначка: { $label }.

js-lunar-engine-no-start = Рушій не вдалося запустити в цьому браузері ({ $reason }). Натомість відкрийте файл результату.

js-lunar-engine-unknown-kind = Цей рушій ({ $version }) не знає різновиду { $kind }; потрібен рушій 0.36.

js-lunar-fig-availability-region = Доступність у районі

js-lunar-fig-corrected-3d = Скоригована похибка, { $n } %, 3D

js-lunar-fig-coverage = Покриття

js-lunar-fig-epochs-within = епох у межах { $value }

js-lunar-fig-horizontal-vertical = горизонтальна { $h }, вертикальна { $v }

js-lunar-fig-hpl-below-alert = HPL нижче межі тривоги

js-lunar-fig-hpl-vpl = HPL, VPL не більше ніж

js-lunar-fig-improvement = Коефіцієнт покращення

js-lunar-fig-lowest-point = Найнижче в точці

js-lunar-fig-points-always-available = Точки, доступні в кожну епоху

js-lunar-fig-uncorrected-3d = Нескоригована похибка, { $n } %, 3D

js-lunar-fig-worst-point = Найгірша точка

js-lunar-file-not-json = Цей файл не є JSON.

js-lunar-file-not-object = Цей файл не є об'єктом JSON.

js-lunar-file-too-large = { $name }: більший за 32 MiB; ця сторінка читає файли результатів не більших за цей розмір.

js-lunar-file-value = файл: { $value }

js-lunar-full-of-total = { $full } із { $total }

js-lunar-give-value = { $label }: вкажіть значення від { $min } до { $max }.

js-lunar-give-whole-value = { $label }: вкажіть значення від { $min } до { $max } (ціле число).

js-lunar-honesty-affiliation = Не пов'язано з жодним агентством і не схвалено жодним агентством.

js-lunar-honesty-assumptions = За заявлених публічних припущень; це не твердження про характеристики жодної реальної системи.

js-lunar-in-grid-spacing = Крок кілець сітки, градуси

js-lunar-in-latency = Затримка поправки, секунди

js-lunar-in-seed = Зерно

js-lunar-in-station-lat = Широта станції, градуси

js-lunar-in-station-lon = Довгота станції, градуси

js-lunar-in-survey-error = Похибка зйомки станції (1 сигма), метри

js-lunar-in-threshold = Поріг точності, метри

js-lunar-in-time-step = Крок часу, секунди

js-lunar-in-trials = Випробувань Монте-Карло на епоху

js-lunar-input-out-of-range = { $label } виходить за допустимі межі.

js-lunar-json-field-not-json = Поле json у файлі не є JSON.

js-lunar-key-50-or-more = 50 % або більше

js-lunar-key-90-or-more = 90 % або більше

js-lunar-key-95-or-more = 95 % або більше

js-lunar-key-99-or-more = 99 % або більше

js-lunar-key-above = понад { $value }

js-lunar-key-above-threshold = понад { $value } × поріг

js-lunar-key-below-50 = нижче 50 %

js-lunar-key-between = від { $from } до { $to }

js-lunar-key-between-threshold = від { $from } до { $to } × поріг

js-lunar-key-up-to = до { $value }

js-lunar-key-up-to-threshold = до { $value } × поріг

js-lunar-layer-availability = доступність

js-lunar-layer-coverage = покриття

js-lunar-layer-error = скоригована похибка

js-lunar-layer-range = скоригована похибка за власним діапазоном

js-lunar-legend-no-figure = показника немає (недоступно протягом усього часу)

js-lunar-legend-radius = радіус покриття

js-lunar-legend-threshold = поріг, { $value }

js-lunar-legend-worst = найгірша точка

js-lunar-link-copied = Посилання скопійовано.

js-lunar-map-desc = Точок сітки: { $points } — від полюса до широти { $rim }°. Для { $meet } із них скоригована похибка (процентиль { $percentile }) лежить у межах порога { $threshold }. Колір за: { $layer }. Станція на { $lat }°, { $lon }°.

js-lunar-map-note-one-band = { $share } % точок потрапляють в одну смугу шкали порога, тому карта майже не показує змін: розфарбуйте за «власним діапазоном», щоб побачити, як похибка змінюється по району.

js-lunar-needs-newer-engine = Це дослідження потребує рушія { $need } або новішого; тут працює рушій v{ $version }. Запис або файл результату все одно можна показати.

js-lunar-no = ні

js-lunar-no-recording = Запис цього дослідження ще не постачається: його створюють під час випуску з рушієм 0.36. Запустіть його тут із рушієм, що має цей різновид, або відкрийте файл результату.

js-lunar-no-scenario = На цьому сайті ще немає { $file }: він з'явиться з рушієм 0.36. Натомість відкрийте файл результату.

js-lunar-no-scenario-note = На цьому сайті ще немає { $file } (він з'явиться з рушієм 0.36), тому прогін тут неможливий; натомість відкрийте файл результату.

js-lunar-not-report = Це не звіт { $kind }.

js-lunar-not-stated = не вказано

js-lunar-note-none = Файл не містить примітки.

js-lunar-note-withheld = У власному твердженні файлу названо програму чи агентство, тому ця сторінка його не показує; діє твердження вгорі сторінки.

js-lunar-point-epochs-reason = point-epochs: { $reason }

js-lunar-radius-desc = Радіус покриття (азимутів: { $count }): найкоротший { $lo } km на { $loAz }°, найдовший { $hi } km на { $hiAz }°.

js-lunar-radius-desc-limited = Азимутів, на яких покриття сягає краю сітки: { $count }; покриття там простягається щонайменше так далеко.

js-lunar-radius-hollow = Порожні точки сягають краю сітки: покриття тримається щонайменше так далеко в цьому напрямі.

js-lunar-radius-none = У звіті не вказано радіуса покриття.

js-lunar-radius-per-azimuth = радіус покриття за азимутами

js-lunar-radius-point = { $az }°: { $km } km

js-lunar-radius-point-limited = { $az }°: { $km } km (сягає краю сітки: щонайменше так далеко)

js-lunar-radius-zero = У кожному напрямі покриття нижче 95 % уже на станції, тому радіус дорівнює 0 km: скоригована похибка там перевищує поріг { $value }.

js-lunar-reason-station-missing = станція не бачить кожного супутника, якого використовує користувач

js-lunar-reason-user-lt4 = у полі зору користувача менше чотирьох супутників

js-lunar-run-stopped = Прогін зупинено: { $message }

js-lunar-running = Дослідження виконується в цьому браузері…

js-lunar-running-elapsed = Дослідження виконується в цьому браузері… { $seconds } s

js-lunar-scenario-missing-keys = У файлі сценарію немає { $keys }; його не можна змінити тут.

js-lunar-set-inputs = Задайте вхідні дані й натисніть «Запустити тут».

js-lunar-showing = Показано: { $what }.

js-lunar-showing-engine = Показано: { $what } (рушій { $version }).

js-lunar-source-error = { $what }: { $error }

js-lunar-station = станція

js-lunar-station-title = станція { $lat }°, { $lon }°

js-lunar-table-count = Точок: { $n }, спершу найближчі до станції.

js-lunar-th-corrected = Скоригована похибка, { $n } %

js-lunar-threshold-title = скоригована похибка { $value } (поріг)

js-lunar-what-file = файл { $name }

js-lunar-what-recording = запис, що постачається зі Studio

js-lunar-what-run = прогін у цьому браузері (рушій { $version })

js-lunar-worst-at = на { $lat }°, { $lon }°

js-lunar-worst-title = найгірша точка { $lat }°, { $lon }°: { $value }

js-lunar-yes-at-least = так: щонайменше так далеко

js-lunarinfra-above-95-point = вище точки 95 %

js-lunarinfra-advisory = Консультативне програмне забезпечення, не обладнання із затвердженням типу; жодного шляху передавання.

js-lunarinfra-arc-note = Довжина хвилі несівної { $value } m.

js-lunarinfra-arc-title = Кожна дуга

js-lunarinfra-bars-not-loaded = файл порогів не завантажився

js-lunarinfra-bars-not-shown = Попередньо зареєстровані пороги не вдалося показати ({ $reason }).

js-lunarinfra-bars-note = Зафіксовано до оцінювання будь-якого дослідження, із вердиктами в протоколі (коміт рушія { $commit }). Ніщо не є VALIDATED; поріг із позначкою NOT MET закріплено тестом, що стверджує невдачу, і жоден поріг не було послаблено.

js-lunarinfra-bars-title = Щодо попередньо зареєстрованих порогів

js-lunarinfra-bars-wrong-file = файл порогів не той, який читає ця сторінка

js-lunarinfra-blurb-carrier-phase = Поверхнева станція й орбітальний апарат, що використовують подвійно-різницеву фазу несівної сигналів Earth-GNSS: чи можна зафіксувати цілочисельні неоднозначності і що це дає для межі положення? Швидкий приклад прогону.

js-lunarinfra-blurb-frame-coestimation = Сім параметрів місячної опорної величини за лазерною локацією із земних станцій, із діапазонами «орбітальний апарат — поверхнева станція» та без них: наскільки покращується інформація?

js-lunarinfra-blurb-geodesy-sensitivity = Наскільки чутливі лазерна локація, відстеження орбітального апарата, гравіметр і поверхневий годинник до приливних чисел Лява Місяця h2, k2 і l2 та його фізичної лібрації?

js-lunarinfra-blurb-od-consistency = Бортове визначення орбіти за Earth-GNSS на майже прямолінійній гало-орбіті порівняно з незалежним наземним радіометричним розв'язком тієї самої дуги: чи збігаються вони в межах заявлених невизначеностей і чи помічає перевірка узгодженості похибку моделювання, коли її вносять? Показано поруч.

js-lunarinfra-blurb-space-tie = GNSS, VLBI і лазерна локація на одному космічному апараті: наскільки точно можна прив'язати зсуви між трьома методами порівняно з похибкою локальної прив'язки на космічному апараті?

js-lunarinfra-bound-label = Невизначеність положення, плаваюча та фіксована, логарифмічна шкала

js-lunarinfra-bound-note = Односигмова невизначеність положення станції та орбітального апарата із залишеними плаваючими неоднозначностями та з зафіксованими (що дала б фіксація, якби її досягли).

js-lunarinfra-bound-title = Межа положення, плаваюча та фіксована

js-lunarinfra-chip-na = н/д

js-lunarinfra-comp-normal = нормальна

js-lunarinfra-comp-position = положення (3D)

js-lunarinfra-comp-radial = радіальна

js-lunarinfra-comp-transverse = поперечна

js-lunarinfra-compare-note = На { $sets } випадкових наборах станцій найменше власне значення не було меншим за наявності ліній орбітального апарата: { $lambda }, а слід не був більшим: { $trace }; медіанне зростання найменшого власного значення — множник { $median }.

js-lunarinfra-compare-title = Порівняння в числах

js-lunarinfra-crsigma-label = Сигма Крамера — Рао, логарифмічна шкала

js-lunarinfra-crsigma-note = У метрах на поверхні.

js-lunarinfra-crsigma-title = Сигма Крамера — Рао за параметрами

js-lunarinfra-days =
    { $n ->
        [one] { $n } день
        [few] { $n } дні
        [many] { $n } днів
       *[other] { $n } дня
    }

js-lunarinfra-direction = напрям { $n }

js-lunarinfra-disclosures = Застереження

js-lunarinfra-eig-label = Власні значення інформації, логарифмічна шкала

js-lunarinfra-eig-note = Сім власних значень інформаційної матриці, спершу найменше, без ліній «орбітальний апарат — станція» та з ними. Найменше значення зростає з множником { $times }, а слід Крамера — Рао падає до { $share } свого значення. Це припускає, що орбіта відома в місячних осях (її похибка враховується сигмою дальності орбітального апарата).

js-lunarinfra-eig-title = Інформація в кожному напрямі опорної величини

js-lunarinfra-fact-arc = Дуга

js-lunarinfra-fact-hash = Хеш сценарію

js-lunarinfra-fact-llr-rows = Рядки лазерної локації

js-lunarinfra-fact-orbit-family = Сімейство орбіт

js-lunarinfra-fact-orbiter-arc = Дуга орбітального апарата

js-lunarinfra-fact-orbiter-rows = Рядки орбітального апарата

js-lunarinfra-fact-study = Дослідження

js-lunarinfra-fact-wavelength = Довжина хвилі несівної

js-lunarinfra-families-note = RMS часткової похідної кожного параметра за рядками сімейства та кількість рядків. Нуль означає параметр, до якого це сімейство сліпе. Чутливість сімейства орбітального апарата до k2 — це оцінка верхньої межі.

js-lunarinfra-families-title = Що бачить кожне сімейство

js-lunarinfra-findings = Висновки

js-lunarinfra-fix-note-a = Частка випробувань Монте-Карло, у яких усі цілочисельні неоднозначності зафіксовано правильно (зі стандартною похибкою), і частка, яку передбачає оцінка, отримана бутстрепом.

js-lunarinfra-fix-note-b = Фіксації цілих значень за цих вхідних даних НЕ досягнуто: найкраща дуга фіксує { $share } випробувань.

js-lunarinfra-fix-note-c = Немає часу до фіксації, який можна було б показати, бо фіксації не досягнуто.

js-lunarinfra-fix-rate-label = Частка фіксації цілих значень залежно від довжини дуги

js-lunarinfra-fix-title = Частка фіксації залежно від довжини дуги

js-lunarinfra-fixed = фіксовані

js-lunarinfra-float = плаваючі

js-lunarinfra-fraction-above-95 = Частка випробувань вище точки 95 %

js-lunarinfra-ground-radiometric = незалежний наземний радіометричний

js-lunarinfra-injected-error = уведена похибка { $value } m/s²

js-lunarinfra-mean-consistency = Середня статистика узгодженості

js-lunarinfra-mean-q = середнє q

js-lunarinfra-miss-line = { $id } має статус { $status }: { $value }

js-lunarinfra-miss-no-fix = Фіксації цілочисельних неоднозначностей за цих вхідних даних НЕ досягнуто: найкраща дуга фіксує { $share } випробувань Монте-Карло.

js-lunarinfra-na = н/д

js-lunarinfra-nominal = номінальне

js-lunarinfra-not-result = це не результат для місячної інфраструктури

js-lunarinfra-not-verified = Не перевірено

js-lunarinfra-offset-precision-label = Точність зсуву залежно від локальної прив'язки, лог-лог

js-lunarinfra-offsets-note = Сигма зсуву за віссю, сигма масштабу та повороту на поверхні, у метрах.

js-lunarinfra-offsets-title = Зсуви за кожної похибки прив'язки (дуга { $days } d, епох: { $epochs })

js-lunarinfra-onboard-gnss = бортова Earth-GNSS

js-lunarinfra-open-failed = Не вдалося відкрити { $title }: { $reason }.

js-lunarinfra-opening = Відкриття { $title }…

js-lunarinfra-orbit-uncertainty-log = Невизначеність орбіти за складовими, логарифмічна шкала

js-lunarinfra-orbiter-days = орбітальний апарат, { $days } d

js-lunarinfra-q-note = Середнє статистики узгодженості q за { $trials } випробуваннями; { $expected } — це те, що дає узгоджена пара розв'язків. Частка випробувань вище точки 95 % — це частка виявлення перевіркою.

js-lunarinfra-q-title = Перевірка узгодженості, номінальна проти уведеної похибки

js-lunarinfra-recorded =
    { $n ->
        [one] { $title }: записаний результат рушія (версія { $version }).
        [few] { $title }: записані результати рушія (версія { $version }).
        [many] { $title }: записані результати рушія (версія { $version }).
       *[other] { $title }: записані результати рушія (версія { $version }).
    }

js-lunarinfra-rel-label = Сигма відносно номіналу, логарифмічна шкала

js-lunarinfra-rel-note = Сигма Крамера — Рао у відсотках від номінального значення, з усіма чотирма сімействами разом. h2 і l2 — це точки лінеаризації, а не перевірені значення; k2 узято з опублікованої підгонки.

js-lunarinfra-rel-title = Наскільки добре можна визначити кожен параметр відносно його номінального значення

js-lunarinfra-result-not-json = результат не є JSON ({ $reason })

js-lunarinfra-result-not-loaded = записаний результат { $file } не завантажився

js-lunarinfra-row-above-95 = Випробування вище точки 95 % (хі-квадрат 95 % = { $chi })

js-lunarinfra-row-crtrace = Слід Крамера — Рао

js-lunarinfra-row-degeneracy = Метрика виродженості

js-lunarinfra-row-formal-diff = Формальна сигма цієї різниці

js-lunarinfra-row-ground-meas = Земля: вимірювання, епохи зі станцією

js-lunarinfra-row-mean-diff = Середня різниця двох орбіт

js-lunarinfra-row-mean-q = Середнє q (очікується 6)

js-lunarinfra-row-observations = Спостереження

js-lunarinfra-row-onboard-epochs = Борт: епохи з одним чи більше / чотирма чи більше супутниками

js-lunarinfra-row-onboard-meas = Борт: вимірювання, середня кількість супутників у супроводженні

js-lunarinfra-row-origin-scale = Кореляція початку відліку та масштабу

js-lunarinfra-row-origin-sigma = Сигма початку відліку, m

js-lunarinfra-row-rank-defect = Ранг (дефект)

js-lunarinfra-row-smallest-eig = Найменше власне значення

js-lunarinfra-row-trace-ground = Вибірковий слід до формального, земля

js-lunarinfra-row-trace-onboard = Вибірковий слід до формального, борт

js-lunarinfra-row-within-95 = Випробування в межах точки 95 %

js-lunarinfra-series-bootstrapped = бутстреп

js-lunarinfra-series-floor = нижня межа

js-lunarinfra-series-monte-carlo = Монте-Карло

js-lunarinfra-side-note = Орбіта: { $family }, дуга { $arc } d орбіти з періодом { $period } d, відліки кожні { $sample } s.

js-lunarinfra-side-title = Поруч

js-lunarinfra-sigma-note = Односигмова невизначеність положення за складовими, у метрах, за двома оцінками тієї самої дуги.

js-lunarinfra-sigma-over-nominal = сигма / номінал

js-lunarinfra-sigma-title = Наскільки добре кожна сторона знає орбіту

js-lunarinfra-station-days = станція, { $days } d

js-lunarinfra-status-verdict = { $status }: { $verdict }

js-lunarinfra-subsets-note = Додавання сімейства жодного разу не зменшило найменшого власного значення (випадків додавання: { $pairs }, без зменшення: { $lambda }), але слід псевдооберненої матриці не збільшився лише у випадках: { $trace } із { $pairs }, оскільки додане сімейство може підвищити ранг.

js-lunarinfra-subsets-title = Кожна комбінація сімейств

js-lunarinfra-sweep-note = Найгірша складова перенесення кожного зсуву, у метрах, коли перебирають похибку прив'язки між трьома методами на космічному апараті. За зареєстрованих сигм методів (GNSS { $gnss } m, VLBI { $vlbi } m, лазер { $slr } m) зсуви обмежені шумом вимірювань, а не прив'язкою; прив'язка задає нижню межу лише для майже досконалих методів.

js-lunarinfra-sweep-title = Точність зсувів методів залежно від локальної прив'язки (дуга { $days } d)

js-lunarinfra-th-arc-days = Дуга, доби

js-lunarinfra-th-bar = Поріг

js-lunarinfra-th-bootstrapped = Частка за бутстрепом

js-lunarinfra-th-budget-exhausted = Бюджет пошуку вичерпано (випробувань)

js-lunarinfra-th-common-sats = Епохи з 2 чи більше спільними супутниками

js-lunarinfra-th-crtrace = Слід Крамера — Рао

js-lunarinfra-th-dd-ambiguities = Подвійно-різницеві неоднозначності

js-lunarinfra-th-epochs = Епохи

js-lunarinfra-th-families = Сімейства

js-lunarinfra-th-family = Сімейство

js-lunarinfra-th-local-tie = Сигма локальної прив'язки, m

js-lunarinfra-th-mc-fix-rate = Частка фіксації за Монте-Карло

js-lunarinfra-th-median-ambiguity = Медіанна сигма неоднозначності, цикли

js-lunarinfra-th-offset = Зсув

js-lunarinfra-th-quantity = Величина

js-lunarinfra-th-rank = Ранг

js-lunarinfra-th-rotation = Поворот на поверхні, m

js-lunarinfra-th-rows = Рядки

js-lunarinfra-th-scale = Масштаб на поверхні, m

js-lunarinfra-th-smallest-eig = Найменше власне значення

js-lunarinfra-th-translation = Перенесення x, y, z, m

js-lunarinfra-th-value = Значення

js-lunarinfra-th-verdict = Вердикт

js-lunarinfra-th-with-links = З лініями орбітального апарата

js-lunarinfra-th-without-links = Без ліній орбітального апарата

js-lunarinfra-title-carrier-phase = Фаза несівної, поверхня та орбітальний апарат

js-lunarinfra-title-frame-coestimation = Спільне оцінювання системи відліку

js-lunarinfra-title-geodesy-sensitivity = Числа Лява та лібрація

js-lunarinfra-title-od-consistency = Узгодженість визначення орбіти

js-lunarinfra-title-space-tie = Космічна прив'язка

js-lunarinfra-unknown-study = цей результат для місячної інфраструктури належить до дослідження «{ $study }», якого ця сторінка не читає

js-lunarinfra-where-missed = Де це дослідження не досягло порогів.

js-lunarinfra-with-links = з лініями орбітального апарата

js-lunarinfra-without-links = без ліній орбітального апарата

js-lunarinfra-x-arc-length = довжина дуги, доби

js-lunarinfra-x-local-tie = сигма локальної прив'язки, m (log)

js-lunarinfra-y-fixed-correctly = зафіксовано правильно, %

js-lunarinfra-y-offset-sigma = сигма зсуву, m (log); штрихова нижня межа — це лише прив'язка, sqrt(2) × похибка прив'язки

js-meaning-body-generic = тіло

js-meaning-body-the = { $name }

js-meaning-card-label-sub = { $k }, { $sub }

js-meaning-checks-of =
    { $n ->
        [one] { $av } з { $n } перевірки
        [few] { $av } з { $n } перевірок
        [many] { $av } з { $n } перевірок
       *[other] { $av } з { $n } перевірки
    }

js-meaning-coverage-average-label = У середньому у полі зору

js-meaning-coverage-big-min =
    { $n ->
        [one] Щонайменше { $n } супутник у полі зору в кожному місці, у середньому { $mean }.
        [few] Щонайменше { $n } супутники у полі зору в кожному місці, у середньому { $mean }.
        [many] Щонайменше { $n } супутників у полі зору в кожному місці, у середньому { $mean }.
       *[other] Щонайменше { $n } супутника у полі зору в кожному місці, у середньому { $mean }.
    }

js-meaning-coverage-big-none = Деякі місця подекуди не бачать жодного супутника; у середньому у полі зору: { $mean }.

js-meaning-coverage-fewest-label = Найменше у полі зору, будь-де

js-meaning-coverage-line-many = З { $names } разом визначення положення можливе у { $share } % місць і моментів (центральне тіло: { $body }).

js-meaning-coverage-line-many-pdop = З { $names } разом визначення положення можливе у { $share } % місць і моментів (центральне тіло: { $body }; якість геометрії, PDOP, нижче { $thr }).

js-meaning-coverage-line-none = Визначення положення можливе у { $share } % місць і моментів (центральне тіло: { $body }).

js-meaning-coverage-line-none-pdop = Визначення положення можливе у { $share } % місць і моментів (центральне тіло: { $body }; якість геометрії, PDOP, нижче { $thr }).

js-meaning-coverage-line-one = З { $names } визначення положення можливе у { $share } % місць і моментів (центральне тіло: { $body }).

js-meaning-coverage-line-one-pdop = З { $names } визначення положення можливе у { $share } % місць і моментів (центральне тіло: { $body }; якість геометрії, PDOP, нижче { $thr }).

js-meaning-coverage-places-label = Місця, що отримують розв'язок

js-meaning-duration-days =
    { $n ->
        [one] { $days } доба
        [few] { $days } доби
        [many] { $days } діб
       *[other] { $days } доби
    }

js-meaning-ensemble-big-many = За багатьма реалізаціями шуму { $q } утримує { $thr } ns у середньому протягом { $qd }; { $c } — протягом { $cd }.

js-meaning-ensemble-big-runs = За реалізаціями шуму (їх { $n }) { $q } утримує { $thr } ns у середньому протягом { $qd }; { $c } — протягом { $cd }.

js-meaning-ensemble-line = Дев'ять реалізацій із десяти для { $name } тримаються від { $band }.

js-meaning-ensemble-mean = середнє

js-meaning-ensemble-mean-band = середнє; смуга 90 %: { $band }

js-meaning-error-p95-label = Похибка, 95 % часу, { $name }

js-meaning-generic-big = { $label }: { $value }.

js-meaning-generic-line-one = Також із цього прогону: { $a }.

js-meaning-generic-line-two = Також із цього прогону: { $a } і { $b }.

js-meaning-generic-none = Цей прогін не має єдиного головного показника; діаграма нижче показує його результат.

js-meaning-holdover-label = Holdover, { $name }

js-meaning-hpl-sub = горизонтальний рівень захисту

js-meaning-inside-budget = у межах { $budget }

js-meaning-integrity-big-checks-mostly = Так, переважно: у { $share } % перевірок.

js-meaning-integrity-big-checks-no = Ні: у { $share } % перевірок.

js-meaning-integrity-big-checks-partly = Лише частково: у { $share } % перевірок.

js-meaning-integrity-big-checks-yes = Так: у { $share } % перевірок.

js-meaning-integrity-big-span-mostly = Так, переважно: протягом { $share } % ({ $span }).

js-meaning-integrity-big-span-no = Ні: протягом { $share } % ({ $span }).

js-meaning-integrity-big-span-partly = Лише частково: протягом { $share } % ({ $span }).

js-meaning-integrity-big-span-yes = Так: протягом { $share } % ({ $span }).

js-meaning-integrity-bound-label = Типова межа похибки

js-meaning-integrity-bound-sub = горизонтальна / вертикальна, медіана

js-meaning-integrity-gap-all-passed = усі перевірки пройдено

js-meaning-integrity-gap-label = Найдовша прогалина

js-meaning-integrity-gap-none = немає

js-meaning-integrity-gap-sub =
    { $n ->
        [one] { $n } перевірка поспіль, від { $from }
        [few] { $n } перевірки поспіль, від { $from }
        [many] { $n } перевірок поспіль, від { $from }
       *[other] { $n } перевірки поспіль, від { $from }
    }

js-meaning-integrity-line-h = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $h } m горизонтально) у { $av } із { $n ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }.

js-meaning-integrity-line-h-clean = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $h } m горизонтально) у { $av } із { $n ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }, і жоден розв'язок не вводив в оману.

js-meaning-integrity-line-h-some = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $h } m горизонтально) у { $av } із { $tot ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }; розв'язків, що вводили в оману: { $n }.

js-meaning-integrity-line-hv = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $h } m горизонтально і { $v } m вертикально) у { $av } із { $n ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }.

js-meaning-integrity-line-hv-clean = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $h } m горизонтально і { $v } m вертикально) у { $av } із { $n ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }, і жоден розв'язок не вводив в оману.

js-meaning-integrity-line-hv-some = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $h } m горизонтально і { $v } m вертикально) у { $av } із { $tot ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }; розв'язків, що вводили в оману: { $n }.

js-meaning-integrity-line-none = Межа похибки приймача (його рівень захисту) залишалася нижче межі тривоги у { $av } із { $n ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }.

js-meaning-integrity-line-none-clean = Межа похибки приймача (його рівень захисту) залишалася нижче межі тривоги у { $av } із { $n ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }, і жоден розв'язок не вводив в оману.

js-meaning-integrity-line-none-some = Межа похибки приймача (його рівень захисту) залишалася нижче межі тривоги у { $av } із { $tot ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }; розв'язків, що вводили в оману: { $n }.

js-meaning-integrity-line-v = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $v } m вертикально) у { $av } із { $n ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }.

js-meaning-integrity-line-v-clean = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $v } m вертикально) у { $av } із { $n ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }, і жоден розв'язок не вводив в оману.

js-meaning-integrity-line-v-some = Межа похибки приймача (його рівень захисту) залишалася нижче меж тривоги ({ $v } m вертикально) у { $av } із { $tot ->
        [one] { $tot } перевірки
        [few] { $tot } перевірок
        [many] { $tot } перевірок
       *[other] { $tot } перевірки
    }; розв'язків, що вводили в оману: { $n }.

js-meaning-integrity-misleading-label = Оманливі розв'язки

js-meaning-integrity-misleading-sub = реальна похибка вище межі

js-meaning-integrity-trusted-label = Час, коли розв'язку можна довіряти

js-meaning-jamming-above-label = Глушник вище сигналу

js-meaning-jamming-above-sub = середнє відношення глушника до сигналу

js-meaning-jamming-big-gone = Глушник повністю позбавляє розв'язку положення.

js-meaning-jamming-big-share = З глушником розв'язок доступний { $share } % часу.

js-meaning-jamming-clear-label = Розв'язок доступний, без глушника

js-meaning-jamming-fewest-label = Найменше супутників у супроводженні

js-meaning-jamming-fewest-sub = у найгірший момент

js-meaning-jamming-jammed-label = Розв'язок доступний, з глушником

js-meaning-jamming-line = Без глушника розв'язок доступний { $share } % часу.

js-meaning-jamming-line-js = Без глушника розв'язок доступний { $share } % часу; глушник у середньому на { $db } dB вищий за сигнал.

js-meaning-kicker = { $domain } · { $title }

js-meaning-lunar-big-all =
    { $n ->
        [one] Так: у кожній із { $n } перевірки.
        [few] Так: у кожній із { $n } перевірок.
        [many] Так: у кожній із { $n } перевірок.
       *[other] Так: у кожній із { $n } перевірки.
    }

js-meaning-lunar-big-none =
    { $n ->
        [one] Ні: в жодній із { $n } перевірки.
        [few] Ні: в жодній із { $n } перевірок.
        [many] Ні: в жодній із { $n } перевірок.
       *[other] Ні: в жодній із { $n } перевірки.
    }

js-meaning-lunar-big-some =
    { $n ->
        [one] У { $av } із { $n } перевірки ({ $share } %).
        [few] У { $av } із { $n } перевірок ({ $share } %).
        [many] У { $av } із { $n } перевірок ({ $share } %).
       *[other] У { $av } із { $n } перевірки ({ $share } %).
    }

js-meaning-lunar-largest-label = Найбільша межа похибки

js-meaning-lunar-line = Рівень захисту коливався від { $min } до { $max } m за межі тривоги { $limit } m.

js-meaning-lunar-meet-label = Перевірки, що вкладаються в межу

js-meaning-lunar-meet-value = { $av } із { $tot }

js-meaning-lunar-smallest-label = Найменша межа похибки

js-meaning-median-lower-better = медіана, менше — краще

js-meaning-of-the-time = часу

js-meaning-orbit-best-label = Найкраща геометрія (PDOP)

js-meaning-orbit-best-sub = найнижче за прогін

js-meaning-orbit-big-always = Розв'язок можливий увесь час.

js-meaning-orbit-big-share = Розв'язок можливий { $share } % часу.

js-meaning-orbit-error-label = Типова похибка положення

js-meaning-orbit-error-sub = 1 сигма, медіана

js-meaning-orbit-line =
    { $n ->
        [one] Достатньо супутників було у полі зору в { $fix } із { $n } моменту.
        [few] Достатньо супутників було у полі зору в { $fix } із { $n } моментів.
        [many] Достатньо супутників було у полі зору в { $fix } із { $n } моментів.
       *[other] Достатньо супутників було у полі зору в { $fix } із { $n } моменту.
    }

js-meaning-orbit-line-pdop =
    { $n ->
        [one] Достатньо супутників було у полі зору в { $fix } із { $n } моменту; типова якість геометрії (PDOP, геометричний чинник DOP для положення) — { $pdop }, менше — краще.
        [few] Достатньо супутників було у полі зору в { $fix } із { $n } моментів; типова якість геометрії (PDOP, геометричний чинник DOP для положення) — { $pdop }, менше — краще.
        [many] Достатньо супутників було у полі зору в { $fix } із { $n } моментів; типова якість геометрії (PDOP, геометричний чинник DOP для положення) — { $pdop }, менше — краще.
       *[other] Достатньо супутників було у полі зору в { $fix } із { $n } моменту; типова якість геометрії (PDOP, геометричний чинник DOP для положення) — { $pdop }, менше — краще.
    }

js-meaning-orbit-moments =
    { $n ->
        [one] { $fix } із { $n } моменту
        [few] { $fix } із { $n } моментів
        [many] { $fix } із { $n } моментів
       *[other] { $fix } із { $n } моменту
    }

js-meaning-orbit-time-label = Час, коли розв'язок можливий

js-meaning-pair-big-diff-pos = { $best } лишається в межах { $budget } протягом { $bestDur }; { $other } — протягом { $otherDur }.

js-meaning-pair-big-diff-time = { $best } тримає час у межах { $budget } протягом { $bestDur }; { $other } — протягом { $otherDur }.

js-meaning-pair-big-same-pos = І { $q }, і { $c } лишаються в межах { $budget } протягом { $dur }.

js-meaning-pair-big-same-time = І { $q }, і { $c } тримають час у межах { $budget } протягом { $dur }.

js-meaning-pair-line-clock = Holdover — це тривалість, протягом якої кожен годинник лишається в межах бюджету { $budget } після втрати супутникової навігації.

js-meaning-pair-line-navigator = Holdover — це тривалість, протягом якої кожен навігатор лишається в межах бюджету { $budget } після втрати супутникової навігації.

js-meaning-pdop-label = Якість геометрії (PDOP)

js-meaning-places-times = місць і моментів

js-meaning-range-to = від { $from } до { $to }

js-meaning-satellites =
    { $n ->
        [one] супутник
        [few] супутники
        [many] супутників
       *[other] супутника
    }

js-meaning-spectrum-above = вище порога

js-meaning-spectrum-below = нижче порога: втрачено

js-meaning-spectrum-big-kept =
    { $n ->
        [one] Кожен із { $n } сигналу лишається в супроводженні.
        [few] Кожен із { $n } сигналів лишається в супроводженні.
        [many] Кожен із { $n } сигналів лишається в супроводженні.
       *[other] Кожен із { $n } сигналу лишається в супроводженні.
    }

js-meaning-spectrum-big-lost =
    { $n ->
        [one] Глушники забирають { $lost } із { $n } сигналу: { $names }.
        [few] Глушники забирають { $lost } із { $n } сигналів: { $names }.
        [many] Глушники забирають { $lost } із { $n } сигналів: { $names }.
       *[other] Глушники забирають { $lost } із { $n } сигналу: { $names }.
    }

js-meaning-spectrum-line-kept =
    { $n ->
        [one] { $names } лишається вище порога супроводження приймача протягом усього прогону.
        [few] { $names } лишаються вище порога супроводження приймача протягом усього прогону.
        [many] { $names } лишаються вище порога супроводження приймача протягом усього прогону.
       *[other] { $names } лишаються вище порога супроводження приймача протягом усього прогону.
    }

js-meaning-spectrum-line-kept-thr =
    { $n ->
        [one] { $names } лишається вище порога супроводження приймача { $thr } dB-Hz протягом усього прогону.
        [few] { $names } лишаються вище порога супроводження приймача { $thr } dB-Hz протягом усього прогону.
        [many] { $names } лишаються вище порога супроводження приймача { $thr } dB-Hz протягом усього прогону.
       *[other] { $names } лишаються вище порога супроводження приймача { $thr } dB-Hz протягом усього прогону.
    }

js-meaning-spectrum-line-none = Жоден сигнал не лишається вище порога супроводження приймача протягом усього прогону.

js-meaning-spectrum-line-none-thr = Жоден сигнал не лишається вище порога супроводження приймача { $thr } dB-Hz протягом усього прогону.

js-meaning-spectrum-weakest-label = Найслабший сигнал, { $name }

js-meaning-whole-run = протягом усього прогону

js-meaning-your-setting = ваш параметр

js-meankind-acm-big = Адаптивне кодування передає даних більше в { $gain }×, ніж найкращий фіксований режим: { $acm } Gbit проти { $ccm } Gbit за { $n ->
        [one] { $n } прохід
        [few] { $n } проходи
        [many] { $n } проходів
       *[other] { $n } проходу
    }.

js-meankind-acm-line = Фіксований режим { $mode }; перерва: { $dur }.

js-meankind-anomaly-big = Квантовий монітор несправностей отримує { $q } проти { $c } у класичного (площа під кривою, 1 — ідеал).

js-meankind-anomaly-line = Найменша виявна несправність — { $q } проти { $c }.

js-meankind-aocs-big-open = Розворот на { $slew }° не стабілізується нижче { $threshold }°.

js-meankind-aocs-big-settles = Розворот на { $slew }° стабілізується нижче { $threshold }° через { $dur }.

js-meankind-aocs-line = Кінцева похибка наведення { $final }°.

js-meankind-aocs-line-filter = Кінцева похибка наведення { $final }°. Фільтр орієнтації в контурі помиляється на { $arcsec } arcsec RMS.

js-meankind-aocs-line-wheel = Кінцева похибка наведення { $final }°. Піковий момент маховика { $torque } N m.

js-meankind-aocs-line-wheel-filter = Кінцева похибка наведення { $final }°. Піковий момент маховика { $torque } N m. Фільтр орієнтації в контурі помиляється на { $arcsec } arcsec RMS.

js-meankind-aperture-big = Навігація використовує { $nav } % часу антени, а зв'язок — { $comms } %.

js-meankind-aperture-big-idle = Навігація використовує { $nav } % часу антени, а зв'язок — { $comms } %; { $idle } % простоює.

js-meankind-aperture-line-all = Апертур: { $n }, за правилом { $policy }; змагання за доступ: { $dur }.

js-meankind-aperture-line-contention = Апертур: { $n }; змагання за доступ: { $dur }.

js-meankind-aperture-line-count = Апертур: { $n }.

js-meankind-aperture-line-nocount = Апертури.

js-meankind-aperture-line-nocount-all = Апертури за правилом { $policy }; змагання за доступ: { $dur }.

js-meankind-aperture-line-nocount-contention = Апертури; змагання за доступ: { $dur }.

js-meankind-aperture-line-nocount-policy = Апертури за правилом { $policy }.

js-meankind-aperture-line-policy = Апертур: { $n }, за правилом { $policy }.

js-meankind-araim-big-no = Ні: рівні захисту рушія розходяться з опублікованим еталоном.

js-meankind-araim-big-yes = Так: рівні захисту рушія збігаються з опублікованим еталоном.

js-meankind-araim-line = Найбільша різниця — { $worst } m при власному допуску еталона { $tol } m.

js-meankind-araim-line-vectors = Найбільша різниця — { $worst } m при власному допуску еталона { $tol } m, за { $n ->
        [one] { $n } еталонним вектором
        [few] { $n } еталонними векторами
        [many] { $n } еталонними векторами
       *[other] { $n } еталонними векторами
    }.

js-meankind-arc-big = Оцінювач відновлює орбіту, щойно має { $dur } дуги тривалістю { $h } h.

js-meankind-arc-line = Космічних апаратів: { $n }, вимірювання: { $observable }.

js-meankind-ascent-big = Гравітація, опір, кермування та протитиск забирають { $loss } m/s з ідеального приросту швидкості { $ideal } m/s.

js-meankind-ascent-line = Вигорання на { $km } km і { $speed } m/s; піковий швидкісний напір { $kpa } kPa.

js-meankind-attack-big-no = Спуфер на поверхні не може захопити місячний приймач.

js-meankind-attack-big-yes = Спуфер на поверхні може захопити місячний приймач.

js-meankind-attack-line = Передавач на поверхні сягає { $km } km, перш ніж горизонт його заблокує.

js-meankind-attitude-big = Похибка наведення сумарно становить { $total } arcsec.

js-meankind-attitude-big-from = Похибка наведення сумарно становить { $total } arcsec, переважно від: { $from }.

js-meankind-attitude-line = Найбільший гравітаційно-градієнтний момент — { $torque } N·m.

js-meankind-beacon-big = Поверхневі маяки покращують якість геометрії (PDOP) у { $x }×.

js-meankind-beacon-line = Додавання супутників натомість покращує її у { $x }×.

js-meankind-bodypnt-big = Самі лише ретранслятори дають розв'язок у { $share } % часу (центральне тіло: { $body }).

js-meankind-bodypnt-big-earth = Самі лише ретранслятори дають розв'язок у { $share } % часу (центральне тіло: { $body }); { $earth } % — із лініями зв'язку із Землею.

js-meankind-bodypnt-line = У середньому у полі зору ретрансляторів: { $mean }.

js-meankind-by = { $a } на { $b }

js-meankind-campaign-compose-line = Кожен учасник — звичайний прогін рушія; кампанія читає їхні результати поруч.

js-meankind-campaign-compose-range = За { $n ->
        [one] { $n } сценарієм
        [few] { $n } сценаріями
        [many] { $n } сценаріями
       *[other] { $n } сценаріями
    } за однакових умов { $what } лежить у діапазоні від { $low } до { $high }.

js-meankind-campaign-compose-same = За { $n ->
        [one] { $n } сценарієм
        [few] { $n } сценаріями
        [many] { $n } сценаріями
       *[other] { $n } сценаріями
    } за однакових умов { $what } дорівнює { $value } у кожному.

js-meankind-campaign-line = Фаз: { $n }.

js-meankind-campaign-line-all = Фаз: { $n } і { $events }, із { $runs }; наприкінці { $label } — { $value }.

js-meankind-campaign-line-end = Фаз: { $n }; наприкінці { $label } — { $value }.

js-meankind-campaign-line-events = Фаз: { $n } і { $events }.

js-meankind-campaign-line-events-end = Фаз: { $n } і { $events }; наприкінці { $label } — { $value }.

js-meankind-campaign-line-events-runs = Фаз: { $n } і { $events }, із { $runs }.

js-meankind-campaign-line-runs = Фаз: { $n }, із { $runs }.

js-meankind-campaign-line-runs-end = Фаз: { $n }, із { $runs }; наприкінці { $label } — { $value }.

js-meankind-campaign-mission-alarm = Тривога подається протягом { $alarm } місії тривалістю { $dur }.

js-meankind-campaign-mission-phases = Місія тривалістю { $dur } (фаз: { $phases }), пов'язаних одним годинником.

js-meankind-campaign-mission-quiet = Тривоги не було протягом усієї місії тривалістю { $dur }.

js-meankind-campaign-montecarlo = За { $n ->
        [one] { $n } прогоном із зерном
        [few] { $n } прогонами із зерном
        [many] { $n } прогонами із зерном
       *[other] { $n } прогонами із зерном
    } { $name } у середньому становить { $mean }, розкид — { $std }.

js-meankind-campaign-montecarlo-line = Розкид — це одне стандартне відхилення за прогонами.

js-meankind-campaign-optimize = Пошук зупиняється на значенні { $name } = { $value } після { $n ->
        [one] { $n } прогону
        [few] { $n } прогонів
        [many] { $n } прогонів
       *[other] { $n } прогону
    }.

js-meankind-campaign-optimize-at = За { $at }.

js-meankind-campaign-optimize-kind = Пошук зупиняється на значенні { $name } = { $value } після { $n ->
        [one] { $n } прогону
        [few] { $n } прогонів
        [many] { $n } прогонів
       *[other] { $n } прогону
    } типу { $kind }.

js-meankind-campaign-sweep-flat = За { $n ->
        [one] { $n } прогоном
        [few] { $n } прогонами
        [many] { $n } прогонами
       *[other] { $n } прогонами
    } для { $axis } від { $from } до { $to } { $metric } лишається на рівні { $value }.

js-meankind-campaign-sweep-flat-line = Діаграма показує кожен прогін.

js-meankind-campaign-sweep-goes = За { $n ->
        [one] { $n } прогоном
        [few] { $n } прогонами
        [many] { $n } прогонами
       *[other] { $n } прогонами
    } для { $axis } від { $from } до { $to } { $metric } змінюється від { $first } до { $last }.

js-meankind-campaign-sweep-goes-line = Діаграма показує кожен прогін; значення лежать від { $min } до { $max }.

js-meankind-classical-link = класична лінія зв'язку

js-meankind-clock-word = годинник

js-meankind-conflict-big = Багаторівнева архітектура виживає у { $ratio }× краще, ніж один рівень.

js-meankind-conflict-line-threats = Монте-Карло за загрозами дає { $ratio }×.

js-meankind-conflict-line-threats-corr = Монте-Карло за загрозами дає { $ratio }×; за корельованих загроз воно може впасти до { $low }×.

js-meankind-conflict-line-trials = Монте-Карло з { $n ->
        [one] { $n } випробування
        [few] { $n } випробувань
        [many] { $n } випробувань
       *[other] { $n } випробування
    } дає { $ratio }×.

js-meankind-conflict-line-trials-corr = Монте-Карло з { $n ->
        [one] { $n } випробування
        [few] { $n } випробувань
        [many] { $n } випробувань
       *[other] { $n } випробування
    } дає { $ratio }×; за корельованих загроз воно може впасти до { $low }×.

js-meankind-contacts-big = План залишає { $kept } із { $n ->
        [one] { $n } можливого контакту
        [few] { $n } можливих контактів
        [many] { $n } можливих контактів
       *[other] { $n } можливого контакту
    } і доставляє { $gbit } Gbit.

js-meankind-contacts-big-waiting = План залишає { $kept } із { $n ->
        [one] { $n } можливого контакту
        [few] { $n } можливих контактів
        [many] { $n } можливих контактів
       *[other] { $n } можливого контакту
    } і доставляє { $gbit } Gbit із { $waiting } Gbit, що очікують.

js-meankind-contacts-line = Супутників: { $sats }, станцій: { $stations }, протягом { $hours } h.

js-meankind-dpnt-big = Диференціальні поправки зменшують похибку з { $from } m до { $to } m.

js-meankind-dpnt-line = З опорною станцією на відстані { $km } km.

js-meankind-duration-days =
    { $n ->
        [one] { $days } доба
        [few] { $days } доби
        [many] { $days } діб
       *[other] { $days } доби
    }

js-meankind-earthgnss-big = На відстані Місяця у полі зору { $visible } із { $n ->
        [one] { $n } супутника
        [few] { $n } супутників
        [many] { $n } супутників
       *[other] { $n } супутника
    }, але супроводжувати можна { $trackable }.

js-meankind-earthgnss-line = Найкращий сигнал — { $best } dB-Hz проти порога супроводження { $threshold } dB-Hz.

js-meankind-engine-run-count =
    { $n ->
        [one] { $n } прогін рушія
        [few] { $n } прогони рушія
        [many] { $n } прогонів рушія
       *[other] { $n } прогону рушія
    }

js-meankind-entry-big = Пікове гальмування — { $g } g на { $km } km, пік теплового потоку — { $flux } W/cm².

js-meankind-entry-line = Вхід зі швидкістю { $speed } m/s під кутом { $angle }° до горизонту.

js-meankind-eo-big = Камера бачить смугу огляду { $swath } km з роздільністю { $gsd } m.

js-meankind-eo-line-contiguous = Траси на поверхні розташовані на відстані { $km } km одна від одної на екваторі, тож покриття суцільне.

js-meankind-eo-line-gapped = Траси на поверхні розташовані на відстані { $km } km одна від одної на екваторі, тож покриття має прогалини.

js-meankind-eop-big = На відстані Місяця обертання Землі проходить { $m } m щосекунди, тож має значення вік даних про орієнтацію Землі (тут { $dur }).

js-meankind-eop-line = Вхідні дані: { $source }.

js-meankind-ephemeris-big = Супутник летить на висоті від { $min } до { $max } km, до широти { $lat }°.

js-meankind-ephemeris-line = Зі станції він піднімається до { $deg }°.

js-meankind-ephemeris-line-doppler = Зі станції він піднімається до { $deg }°, з Доплером до { $khz } kHz.

js-meankind-event-count =
    { $n ->
        [one] { $n } подія
        [few] { $n } події
        [many] { $n } подій
       *[other] { $n } події
    }

js-meankind-framecampaign-big-open = Кампанія залишає невизначеними { $n ->
        [one] { $n } напрям опорної величини
        [few] { $n } напрями опорної величини
        [many] { $n } напрямів опорної величини
       *[other] { $n } напряму опорної величини
    }.

js-meankind-framecampaign-big-yes = Так: кампанія повністю фіксує опорну величину місячної системи відліку.

js-meankind-framecampaign-line = Число обумовленості { $n }.

js-meankind-framereal-big = Місячну систему відліку реалізовано із залишковою похибкою { $m } m.

js-meankind-framereal-big-open = Місячну систему відліку реалізовано із залишковою похибкою { $m } m, хоча підгонка не збіглася.

js-meankind-framereal-line = Похибка перенесення { $trans } m, похибка масштабу { $scale } частин на мільярд.

js-meankind-gnsssim-big = Контроль цілісності захищає розв'язок { $share } % часу.

js-meankind-gnsssim-line = Іоносфера додає в середньому { $iono } m, а тропосфера — { $tropo } m до кожної дальності.

js-meankind-headline-figure = головний показник

js-meankind-holdovertest-big = Порівняно з масками holdover запису тривалістю { $dur } s сягає { $te } ns похибки часу.

js-meankind-holdovertest-big-open = Порівняно з масками holdover запису тривалістю { $dur } s сягає { $te } ns похибки часу і не відновився в межах смуги.

js-meankind-holdovertest-big-recovered = Порівняно з масками holdover запису тривалістю { $dur } s сягає { $te } ns похибки часу і відновився через { $recover } s після повернення GNSS.

js-meankind-holdovertest-line = Виміряно щодо маски; це ніколи не є твердженням про відповідність системи вимогам; обидва моменти — це твердження оператора.

js-meankind-holdovertest-line-masks = { $masks }. Виміряно щодо маски; це ніколи не є твердженням про відповідність системи вимогам; обидва моменти — це твердження оператора.

js-meankind-impairment-big = Детектор відокремлює погіршені сигнали від чистих із площею під кривою { $auc } (1 — ідеал).

js-meankind-impairment-line = На випадках, несхожих на навчальний набір, він отримує { $auc }.

js-meankind-infra-carrier = Цілочисельна фіксація фази несівної між поверхневою станцією та орбітальним апаратом зафіксувала { $share } % випробувань на найдовшій дузі ({ $days } d).

js-meankind-infra-frame = Лінії «орбітальний апарат — станція» підвищують найменше інформаційне власне значення місячної опорної величини у { $x }× і зменшують слід Крамера — Рао до { $share } %, якщо орбіту відомо в місячних осях.

js-meankind-infra-geodesy = За всіх чотирьох сімейств разом h2, k2 і l2 визначено з точністю { $h2 } %, { $k2 } % і { $l2 } % від їхніх номінальних значень.

js-meankind-infra-od = Бортове визначення орбіти за Earth-GNSS на місячній орбіті має точність { $gnss } m, незалежне наземне відстеження — { $ground } m; статистика узгодженості в середньому { $mean } (очікується { $expected }).

js-meankind-infra-tail = MODELLED: обмежена модель з ілюстративними вхідними даними, а не твердження про жодну місію.

js-meankind-infra-tie = Локальна прив'язка { $mm } mm на одному космічному апараті зв'язує системи відліку GNSS, VLBI і лазерної локації за { $n ->
        [one] { $n } перебраною похибкою прив'язки
        [few] { $n } перебраними похибками прив'язки
        [many] { $n } перебраними похибками прив'язки
       *[other] { $n } перебраними похибками прив'язки
    }.

js-meankind-inside-spec = у межах { $spec }

js-meankind-instrn-big = За руху лише за інерцією похибка положення перевищує { $threshold } m через { $dur }.

js-meankind-instrn-dom = { $dominant } домінує.

js-meankind-instrn-line = Вона перевищує { $passes }.

js-meankind-instrn-line-dom = Вона перевищує { $passes }; { $dominant } домінує.

js-meankind-instrn-pass = { $threshold } m через { $dur }

js-meankind-interop-big-no = Ні: файл місячних ефемерид не проходить круговий обмін.

js-meankind-interop-big-yes = Так: файл місячних ефемерид проходить круговий обмін без втрат.

js-meankind-interop-line = Станів: { $n } у системі відліку { $frame }, час { $time }.

js-meankind-its-spec = його специфікація

js-meankind-jointod-big = Додавання затримки інтерферометрії із Землі уточнює положення станції у { $x }×.

js-meankind-jointod-line = Тоді положення станції відоме з точністю { $m } m.

js-meankind-launch-big =
    { $n ->
        [one] { $n } можливість запуску на добу дає змогу досягти орбіти { $incl }° із широти { $lat }°.
        [few] { $n } можливості запуску на добу дають змогу досягти орбіти { $incl }° із широти { $lat }°.
        [many] { $n } можливостей запуску на добу дають змогу досягти орбіти { $incl }° із широти { $lat }°.
       *[other] { $n } можливості запуску на добу дають змогу досягти орбіти { $incl }° із широти { $lat }°.
    }

js-meankind-launch-line = Обертання Землі безкоштовно дає { $speed } m/s.

js-meankind-layer-agc = AGC (автоматичне регулювання підсилення)

js-meankind-layer-raim = RAIM (автономний контроль цілісності приймача)

js-meankind-layer-sqm = SQM (контроль якості сигналу)

js-meankind-leochain-big = Наскрізно низькоорбітальна система зменшує похибку положення з { $from } m до { $to } m.

js-meankind-leochain-line = Її сигнал супроводжується до { $cn0 } dB-Hz.

js-meankind-leopass-big-many = Супутники проходять на висоті { $elev }° і лишаються над маскою { $dur } (перший із { $n }).

js-meankind-leopass-big-one = Супутник проходить на висоті { $elev }° і лишається над маскою { $dur }.

js-meankind-leopass-line = У піку сигнал низької орбіти приходить на { $db } dB сильнішим за типовий сигнал супутникової навігації.

js-meankind-leoppp-big = Прецизійне позиціонування збігається за { $best } min із найбільшим низькоорбітальним шаром проти { $base } min лише із супутниковою навігацією.

js-meankind-leoppp-line = Медіана прогонів на випадок, до { $m } m.

js-meankind-leoppp-line-runs = Медіана за { $n ->
        [one] { $n } прогоном
        [few] { $n } прогонами
        [many] { $n } прогонами
       *[other] { $n } прогонами
    } на випадок, до { $m } m.

js-meankind-leopvt-doppler-big = Доплерівське позиціонування за низькоорбітальними супутниками потрапляє на { $m } m від істини (горизонтально).

js-meankind-leopvt-doppler-line = Використано супутників: { $n }.

js-meankind-leopvt-joint-big = Додавання низькоорбітального шару зменшує похибку з { $from } m до { $to } m (3D середньоквадратична).

js-meankind-leopvt-joint-line = Якість геометрії (PDOP) змінюється від { $from } до { $to }.

js-meankind-leopvt-polar-big = Поблизу полюса низькоорбітальний шар покращує якість геометрії (PDOP) від { $from } до { $to }.

js-meankind-leopvt-polar-line = Широт: { $n }.

js-meankind-leopvt-timing-big = Низькоорбітальне передавання часу тримає найкращий годинник у межах { $ns } ns від UTC (середньоквадратично).

js-meankind-leopvt-timing-line =
    { $n ->
        [one] Порівняно { $n } випадок для годинника й сигналу.
        [few] Порівняно { $n } випадки для годинника й сигналу.
        [many] Порівняно { $n } випадків для годинника й сигналу.
       *[other] Порівняно { $n } випадку для годинника й сигналу.
    }

js-meankind-leosignal-big =
    { $n ->
        [one] З { $n } конструкції сигналу { $best } витримує найбільше глушіння: { $db } dB понад сигнал.
        [few] З { $n } конструкцій сигналу { $best } витримує найбільше глушіння: { $db } dB понад сигнал.
        [many] З { $n } конструкцій сигналу { $best } витримує найбільше глушіння: { $db } dB понад сигнал.
       *[other] З { $n } конструкції сигналу { $best } витримує найбільше глушіння: { $db } dB понад сигнал.
    }

js-meankind-leosignal-line-fail = Перевірки форми спектра не пройдено.

js-meankind-leosignal-line-pass = Перевірки форми спектра пройдено.

js-meankind-link-big-closes = Лінія зв'язку замикається із запасом { $margin } dB.

js-meankind-link-big-open = Лінія зв'язку не замикається: запас { $margin } dB.

js-meankind-link-line = На відстані { $km } km.

js-meankind-link-line-band = Діапазон { $band } на відстані { $km } km.

js-meankind-link-line-band-rate = Діапазон { $band } на відстані { $km } km зі швидкістю { $rate } bit/s.

js-meankind-link-line-rate = На відстані { $km } km зі швидкістю { $rate } bit/s.

js-meankind-list-and = { $head } та { $last }

js-meankind-llr-big = Реальна лазерна локація фіксує місячну систему відліку з точністю { $mm } mm.

js-meankind-llr-line = Масштаб з точністю { $ppb } частин на мільярд.

js-meankind-mapmatch-altimeter = Висотомір вимірює з точністю { $sigma } m.

js-meankind-mapmatch-big = Зіставлення з картою утримує положення в межах { $matched } m проти { $free } m дрейфу лише за інерціальним рішенням.

js-meankind-mapmatch-gravimeter = Гравіметр вимірює з точністю { $sigma } mGal.

js-meankind-mapmatch-sources = Лише гравітація дає { $gravity } m, магнітне поле — { $magnetic } m, рельєф — { $terrain } m.

js-meankind-marspnt-big = Навігатор користувача «{ $user }» встановлюється в межах { $m } m (середньоквадратичне значення).

js-meankind-marspnt-line =
    { $n ->
        [one] У середньому в зоні видимості { $mean } ретрансляторів за { $n } епоху.
        [few] У середньому в зоні видимості { $mean } ретрансляторів за { $n } епохи.
        [many] У середньому в зоні видимості { $mean } ретрансляторів за { $n } епох.
       *[other] У середньому в зоні видимості { $mean } ретрансляторів за { $n } епохи.
    }

js-meankind-moonlight-big = Послуга охоплює { $share } % перевірених місць і моментів часу.

js-meankind-moonlight-line =
    { $n ->
        [one] У зоні видимості від { $min } до { $n } супутника; якість геометрії (PDOP) — від { $pmin } до { $pmax }.
        [few] У зоні видимості від { $min } до { $n } супутників; якість геометрії (PDOP) — від { $pmin } до { $pmax }.
        [many] У зоні видимості від { $min } до { $n } супутників; якість геометрії (PDOP) — від { $pmin } до { $pmax }.
       *[other] У зоні видимості від { $min } до { $n } супутника; якість геометрії (PDOP) — від { $pmin } до { $pmax }.
    }

js-meankind-navmsg-big =
    { $n ->
        [one] Одне навігаційне повідомлення вміщується в { $n } байт.
        [few] Одне навігаційне повідомлення вміщується в { $n } байти.
        [many] Одне навігаційне повідомлення вміщується в { $n } байтів.
       *[other] Одне навігаційне повідомлення вміщується в { $n } байта.
    }

js-meankind-navmsg-cases-big =
    { $n ->
        [one] У { $n } випадку похибка дальності за транслюваною орбітою становить від { $min } до { $max } mm.
        [few] У { $n } випадках похибка дальності за транслюваною орбітою становить від { $min } до { $max } mm.
        [many] У { $n } випадках похибка дальності за транслюваною орбітою становить від { $min } до { $max } mm.
       *[other] У { $n } випадку похибка дальності за транслюваною орбітою становить від { $min } до { $max } mm.
    }

js-meankind-navmsg-cases-line = Похибка дальності сигналу в космосі, середньоквадратична.

js-meankind-navmsg-line = Округлення до формату повідомлення дає { $mm } mm похибки дальності.

js-meankind-navmsg-midpass-big = Оновлення повідомлення посеред проходу змінює дальність стрибком щонайбільше на { $mm } mm.

js-meankind-navmsg-midpass-line = Межа — { $mm } mm.

js-meankind-ntn-big = Позиціонування 5G з орбіти досягає { $m } m із сигналом { $signal }.

js-meankind-ntn-line = Доплер за один прохід дає { $m } m.

js-meankind-obs-big-full = Орбіта стає повністю спостережуваною після { $dur } супроводження.

js-meankind-obs-big-partly = Орбіта лишається частково спостережуваною на дузі { $h } h.

js-meankind-obs-line = Ранг { $rank } з { $dim } наприкінці дуги.

js-meankind-oem-big = Файл ефемерид відтворюється туди й назад із похибкою положення щонайбільше { $mm } mm.

js-meankind-oem-line =
    { $n ->
        [one] Станів: { $states } у { $n } сегменті.
        [few] Станів: { $states } у { $n } сегментах.
        [many] Станів: { $states } у { $n } сегментах.
       *[other] Станів: { $states } у { $n } сегменті.
    }

js-meankind-optical-big-alone = Найкраща окрема станція підтримує оптичну лінію { $best } % часу (стеля за відсутності хмар { $ceiling } %); жоден запас за відсутності хмар не піднімає її вище { $ceiling } %.

js-meankind-optical-big-team =
    { $n ->
        [one] Найкраща окрема станція підтримує оптичну лінію { $best } % часу (стеля за відсутності хмар { $ceiling } %); { $n } станція разом досягають { $independent } %, якщо їхня погода незалежна, і { $correlated } % із заявленою кореляцією.
        [few] Найкраща окрема станція підтримує оптичну лінію { $best } % часу (стеля за відсутності хмар { $ceiling } %); { $n } станції разом досягають { $independent } %, якщо їхня погода незалежна, і { $correlated } % із заявленою кореляцією.
        [many] Найкраща окрема станція підтримує оптичну лінію { $best } % часу (стеля за відсутності хмар { $ceiling } %); { $n } станцій разом досягають { $independent } %, якщо їхня погода незалежна, і { $correlated } % із заявленою кореляцією.
       *[other] Найкраща окрема станція підтримує оптичну лінію { $best } % часу (стеля за відсутності хмар { $ceiling } %); { $n } станції разом досягають { $independent } %, якщо їхня погода незалежна, і { $correlated } % із заявленою кореляцією.
    }

js-meankind-optical-line-sites =
    { $n ->
        [one] Змодельовано { $n } станцію; хмарні клімати ілюстративні.
        [few] Змодельовано { $n } станції; хмарні клімати ілюстративні.
        [many] Змодельовано { $n } станцій; хмарні клімати ілюстративні.
       *[other] Змодельовано { $n } станції; хмарні клімати ілюстративні.
    }

js-meankind-optical-line-tech = { $name }: { $base } % стає { $with } %.

js-meankind-opticalrf-big = Поєднання оптичних і радіовимірювань дальності дає рівні захисту { $h } m по горизонталі та { $v } m по вертикалі.

js-meankind-opticalrf-line-fault = Перевірка узгодженості показує { $stat } за порога { $threshold }: несправність позначено.

js-meankind-opticalrf-line-ok = Перевірка узгодженості показує { $stat } за порога { $threshold }: несправність не позначено.

js-meankind-packet-big-no = Ні: декодований потік відрізняється від надісланого.

js-meankind-packet-big-yes = Так: потік пакетів декодується назад біт у біт.

js-meankind-packet-line =
    { $n ->
        [one] { $n } пакет, усього { $octets } октетів.
        [few] { $n } пакети, усього { $octets } октетів.
        [many] { $n } пакетів, усього { $octets } октетів.
       *[other] { $n } пакета, усього { $octets } октетів.
    }

js-meankind-passes-big-day =
    { $n ->
        [one] { $n } прохід на добу, усього { $dur } контакту.
        [few] { $n } проходи на добу, усього { $dur } контакту.
        [many] { $n } проходів на добу, усього { $dur } контакту.
       *[other] { $n } проходу на добу, усього { $dur } контакту.
    }

js-meankind-passes-big-window =
    { $n ->
        [one] { $n } прохід за вікно { $hours } h, усього { $dur } контакту.
        [few] { $n } проходи за вікно { $hours } h, усього { $dur } контакту.
        [many] { $n } проходів за вікно { $hours } h, усього { $dur } контакту.
       *[other] { $n } проходу за вікно { $hours } h, усього { $dur } контакту.
    }

js-meankind-passes-line = Найкращий прохід піднімається до { $deg }°.

js-meankind-percentile-word = перцентиль

js-meankind-pnt-big = Квантовий комплект утримує положення та час протягом { $q }; класичний — протягом { $c }.

js-meankind-pnt-classical-label = Holdover, класичний комплект

js-meankind-pnt-line = Holdover — це тривалість, протягом якої кожен комплект (годинник { $q } проти годинника { $c }) лишається в межах { $spec } після втрати супутникової навігації.

js-meankind-pnt-quantum-label = Holdover, квантовий комплект

js-meankind-pnt-timing-classical-label = Похибка часу, 95 %, класичний

js-meankind-pnt-timing-quantum-label = Похибка часу, 95 %, квантовий

js-meankind-pvt-big =
    { $n ->
        [one] Положення розв'язано на { $solved } з { $n } епохи, з похибкою { $rms } m (тривимірна середньоквадратична).
        [few] Положення розв'язано на { $solved } з { $n } епох, з похибкою { $rms } m (тривимірна середньоквадратична).
        [many] Положення розв'язано на { $solved } з { $n } епох, з похибкою { $rms } m (тривимірна середньоквадратична).
       *[other] Положення розв'язано на { $solved } з { $n } епохи, з похибкою { $rms } m (тривимірна середньоквадратична).
    }

js-meankind-pvt-line = У середньому за { $mean } супутниками, за реальними вимірюваннями приймача.

js-meankind-qnav-big = Після перерви холодноатомний навігатор відхиляється на { $q } m; навігаційного класу — на { $c } m.

js-meankind-qnav-big-outage = Через { $dur } без супутників холодноатомний навігатор відхиляється на { $q } m; навігаційного класу — на { $c } m.

js-meankind-qnav-line = У межах бюджету: { $q } проти { $c }.

js-meankind-qnav-line-threshold = У межах { $threshold } m: { $q } проти { $c }.

js-meankind-qtt-big = Квантове передавання часу тримає { $q } ps (1-sigma) проти { $c } ns для класичного ланцюга.

js-meankind-qtt-line = Монітор безпеки виявляє { $pd } % атак.

js-meankind-qtt-line-pfa = Монітор безпеки виявляє { $pd } % атак за частоти хибних тривог { $pfa }.

js-meankind-quantum-link = квантова лінія

js-meankind-radiometry-big = Камера досягає NIIRS { $niirs } за просторового розрізнення на місцевості { $gsd } m та відношення сигнал/шум { $snr }.

js-meankind-radiometry-line = MTF системи на частоті Найквіста: { $mtf }.

js-meankind-reentry-big = Пікове гальмування — { $g } g на висоті { $km } km.

js-meankind-reentry-line = Тоді апарат має швидкість { $speed } m/s.

js-meankind-slam-big = Зіставлення з рельєфом завершується з відхиленням { $matched } m проти { $free } m лише за інерціальним рішенням.

js-meankind-slam-line =
    { $n ->
        [one] На { $n } шляховій точці зіставлено з картою рельєфу за шуму висотоміра { $sigma } m.
        [few] На { $n } шляхових точках зіставлено з картою рельєфу за шуму висотоміра { $sigma } m.
        [many] На { $n } шляхових точках зіставлено з картою рельєфу за шуму висотоміра { $sigma } m.
       *[other] На { $n } шляховій точці зіставлено з картою рельєфу за шуму висотоміра { $sigma } m.
    }

js-meankind-slot-big = Годинник залишає свій слотовий допуск через { $dur } після останнього супутникового визначення.

js-meankind-slot-line = Тож визначення потрібне кожні { $interval }, приблизно { $perDay } на добу.

js-meankind-solar-big =
    { $n ->
        [one] { $n } тіло розміщено на одну епоху.
        [few] { $n } тіла розміщено на одну епоху.
        [many] { $n } тіл розміщено на одну епоху.
       *[other] { $n } тіла розміщено на одну епоху.
    }

js-meankind-solar-big-link =
    { $n ->
        [one] { $n } тіло розміщено на одну епоху; світло йде { $dur } від { $from } до { $to }.
        [few] { $n } тіла розміщено на одну епоху; світло йде { $dur } від { $from } до { $to }.
        [many] { $n } тіл розміщено на одну епоху; світло йде { $dur } від { $from } до { $to }.
       *[other] { $n } тіла розміщено на одну епоху; світло йде { $dur } від { $from } до { $to }.
    }

js-meankind-solar-line = Усього виміряно час { $n ->
        [one] { $n } лінії зв'язку.
        [few] { $n } ліній зв'язку.
        [many] { $n } ліній зв'язку.
       *[other] { $n } лінії зв'язку.
    }

js-meankind-spoof-caught = Спуфінг виявляється до того, як порушує специфікацію синхронізації.

js-meankind-spoof-caught-both = Спуфінг виявляється обома годинниками до того, як порушує специфікацію синхронізації.

js-meankind-spoof-caught-label = Виявлено через, { $name }

js-meankind-spoof-caught-thr = Спуфінг виявляється до того, як порушує специфікацію синхронізації { $thr } ns.

js-meankind-spoof-caught-thr-both = Спуфінг виявляється обома годинниками до того, як порушує специфікацію синхронізації { $thr } ns.

js-meankind-spoof-detects = { $name } виявляє його через { $dur } зі зміщенням { $offset } ns.

js-meankind-spoof-missed =
    { $n ->
        [one] Спуфінг порушує специфікацію синхронізації до того, як його виявляє { $names }.
        [few] Спуфінг порушує специфікацію синхронізації до того, як його виявляє { $names }.
        [many] Спуфінг порушує специфікацію синхронізації до того, як його виявляє { $names }.
       *[other] Спуфінг порушує специфікацію синхронізації до того, як його виявляє { $names }.
    }

js-meankind-spoof-offset = зміщення { $offset } ns

js-meankind-spoofdetect-big-by = Так: спуфінг виявлено, засобом { $by }.

js-meankind-spoofdetect-big-no = Ні: об'єднаний монітор не виявляє спуфінгу.

js-meankind-spoofdetect-big-yes = Так: спуфінг виявлено.

js-meankind-spoofdetect-line =
    { $n ->
        [one] Тривогу подає { $on } з { $n } шару виявлення.
        [few] Тривогу подає { $on } з { $n } шарів виявлення.
        [many] Тривогу подає { $on } з { $n } шарів виявлення.
       *[other] Тривогу подає { $on } з { $n } шару виявлення.
    }

js-meankind-spoofdetect-line-score =
    { $n ->
        [one] Тривогу подає { $on } з { $n } шару виявлення; об'єднана оцінка — { $score }.
        [few] Тривогу подає { $on } з { $n } шарів виявлення; об'єднана оцінка — { $score }.
        [many] Тривогу подає { $on } з { $n } шарів виявлення; об'єднана оцінка — { $score }.
       *[other] Тривогу подає { $on } з { $n } шару виявлення; об'єднана оцінка — { $score }.
    }

js-meankind-ssv-formation = На відстані { $km } km фільтр знає відносне положення з точністю { $filter } m RMS проти { $absolute } m від різниці двох абсолютних визначень.

js-meankind-ssv-navigation = Бортовий фільтр утримує положення з точністю { $inside } m RMS всередині орбіт GNSS і { $above } m над ними.

js-meankind-ssv-shell = На оболонці всі сузір'я разом дають щонайменше один сигнал { $one } % часу і щонайменше чотири — { $four } % (L1).

js-meankind-ssv-tail = MODELLED: геометричний розрахунок і розрахунок бюджету лінії, а не вимірювання будь-якого сигналу в космосі.

js-meankind-ssv-trajectory = На висотах від { $from } до { $to } km щонайменше один сигнал у зоні видимості { $one } % епох і щонайменше чотири — { $four } % (L1, усі сузір'я).

js-meankind-station-big = Над південною полярною областю поправки місячної опорної станції зменшують похибку { $percentile } з { $from } m до { $to } m (змодельовано).

js-meankind-station-line = У межах порога точності протягом { $share } % епох; це не твердження про жодну реальну систему.

js-meankind-sweep-big =
    { $n ->
        [one] За { $n } значенням параметра { $param }: { $parts }.
        [few] За { $n } значеннями параметра { $param }: { $parts }.
        [many] За { $n } значеннями параметра { $param }: { $parts }.
       *[other] За { $n } значення параметра { $param }: { $parts }.
    }

js-meankind-sweep-line = Параметр { $param } пробігає від { $from } до { $to }.

js-meankind-sweep-line-log = Параметр { $param } пробігає від { $from } до { $to } за логарифмічною шкалою.

js-meankind-sweep-part-flat = { $key }: { $metric } лишається на рівні { $value }

js-meankind-sweep-part-goes = { $key }: { $metric } змінюється від { $first } до { $last }

js-meankind-sweep-result-word = результат

js-meankind-sweepnd-big =
    { $n ->
        [one] За { $n } комбінацією { $keys }: { $metric } — від { $min } до { $max }.
        [few] За { $n } комбінаціями { $keys }: { $metric } — від { $min } до { $max }.
        [many] За { $n } комбінаціями { $keys }: { $metric } — від { $min } до { $max }.
       *[other] За { $n } комбінації { $keys }: { $metric } — від { $min } до { $max }.
    }

js-meankind-sweepnd-line = Сітка прогонів рушія: { $shape }.

js-meankind-telecom-fail =
    { $n ->
        [one] Годинник не проходить { $fail } з { $n } телекомунікаційної перевірки похибки часу.
        [few] Годинник не проходить { $fail } з { $n } телекомунікаційних перевірок похибки часу.
        [many] Годинник не проходить { $fail } з { $n } телекомунікаційних перевірок похибки часу.
       *[other] Годинник не проходить { $fail } з { $n } телекомунікаційної перевірки похибки часу.
    }

js-meankind-telecom-line = Перевірки MTIE (максимальної похибки часового інтервалу), TDEV (девіації часу) та огинаючої holdover за масками ITU-T, названими в кожному рядку.

js-meankind-telecom-line-margin = Перевірки MTIE (максимальної похибки часового інтервалу), TDEV (девіації часу) та огинаючої holdover за масками ITU-T, названими в кожному рядку. Найменший запас до огинаючої holdover — { $margin } ns.

js-meankind-telecom-pass =
    { $n ->
        [one] Годинник проходить усі { $n } телекомунікаційну перевірку похибки часу.
        [few] Годинник проходить усі { $n } телекомунікаційні перевірки похибки часу.
        [many] Годинник проходить усі { $n } телекомунікаційних перевірок похибки часу.
       *[other] Годинник проходить усі { $n } телекомунікаційної перевірки похибки часу.
    }

js-meankind-the-best = найкращий

js-meankind-the-body = тіло

js-meankind-the-first = перший

js-meankind-the-name = { $name }

js-meankind-the-second = другий

js-meankind-the-widest-signal = найширший сигнал

js-meankind-timebudget-big = Похибка годинника { $clock } і похибка системи відліку перетинаються за часу усереднення { $tau }.

js-meankind-timebudget-line = У цій точці перетину похибка часу становить { $x } s.

js-meankind-timeoffset-big = Годинник на Місяці випереджає земний на { $rate } µs на добу.

js-meankind-timeoffset-line = Опублікований діапазон — від { $low } до { $high } µs на добу.

js-meankind-timetransfer-big = { $q } тримає дві станції в межах { $qps } ps (середньоквадратично); { $c } — у межах { $cps } ps.

js-meankind-timetransfer-line = У межах специфікації дальності { $q } % часу проти { $c } %.

js-meankind-timetransfer-line-mm = У межах специфікації дальності { $mm } mm { $q } % часу проти { $c } %.

js-meankind-tracking-big = Спуфер може захопити приймач з відстані до { $km } km.

js-meankind-tracking-line = За власної динаміки контурів приймача захоплення втрачається за { $db } dB глушника над сигналом.

js-meankind-trade-big = Квантові датчики кращі за класичний базовий рівень у { $timing } раза за синхронізацією часу та у { $inertial } раза за інерціальною навігацією.

js-meankind-trade-line = Без супутників квантовий комплект рухається за інерцією { $dur }.

js-meankind-ttbudget-big = Двобічне зміщення становить { $offset } ns із сукупною невизначеністю { $uncertainty } ns.

js-meankind-ttbudget-line = Саньяк { $sagnac } ns; іоносфера { $iono } ns.

js-meankind-ukf-big-no = Ні: фільтр не є самоузгодженим.

js-meankind-ukf-big-yes = Так: фільтр є самоузгодженим.

js-meankind-ukf-line-in = Його нормований квадрат інновації в середньому становить { $mean }, у межах 95-відсоткової смуги від { $low } до { $high }. Це перевіряє узгодженість, а не точність.

js-meankind-ukf-line-in-seeds =
    { $n ->
        [one] Його нормований квадрат інновації в середньому становить { $mean }, у межах 95-відсоткової смуги від { $low } до { $high }, за { $n } зерном (seed). Це перевіряє узгодженість, а не точність.
        [few] Його нормований квадрат інновації в середньому становить { $mean }, у межах 95-відсоткової смуги від { $low } до { $high }, за { $n } зернами (seed). Це перевіряє узгодженість, а не точність.
        [many] Його нормований квадрат інновації в середньому становить { $mean }, у межах 95-відсоткової смуги від { $low } до { $high }, за { $n } зернами (seed). Це перевіряє узгодженість, а не точність.
       *[other] Його нормований квадрат інновації в середньому становить { $mean }, у межах 95-відсоткової смуги від { $low } до { $high }, за { $n } зерна (seed). Це перевіряє узгодженість, а не точність.
    }

js-meankind-ukf-line-out = Його нормований квадрат інновації в середньому становить { $mean }, поза 95-відсотковою смугою від { $low } до { $high }. Це перевіряє узгодженість, а не точність.

js-meankind-ukf-line-out-seeds =
    { $n ->
        [one] Його нормований квадрат інновації в середньому становить { $mean }, поза 95-відсотковою смугою від { $low } до { $high }, за { $n } зерном (seed). Це перевіряє узгодженість, а не точність.
        [few] Його нормований квадрат інновації в середньому становить { $mean }, поза 95-відсотковою смугою від { $low } до { $high }, за { $n } зернами (seed). Це перевіряє узгодженість, а не точність.
        [many] Його нормований квадрат інновації в середньому становить { $mean }, поза 95-відсотковою смугою від { $low } до { $high }, за { $n } зернами (seed). Це перевіряє узгодженість, а не точність.
       *[other] Його нормований квадрат інновації в середньому становить { $mean }, поза 95-відсотковою смугою від { $low } до { $high }, за { $n } зерна (seed). Це перевіряє узгодженість, а не точність.
    }

js-meankind-user-word = користувача

js-meankind-vlbi-big = На базовій лінії { $km } km сигнал маяка надходить на дві станції з різницею { $ms } ms.

js-meankind-vlbi-line = Поправка ближнього поля — { $us } µs.

js-meankind-vlbifim-big = Кожна координата станції відома з точністю { $m } m за цим графіком спостережень.

js-meankind-vlbifim-line = Проста оцінка з рівним розподілом заявляла б { $m } m.

js-meankind-weather-big = Верхня атмосфера нагрівається до { $k } K.

js-meankind-weather-big-ref = Верхня атмосфера нагрівається до { $k } K проти { $ref } K для еталона.

js-meankind-weather-line = Індекс геомагнітної активності ap — { $ap }.

js-meankind-whole-run = за весь прогін

js-mthread-bcol-label = Позначка

js-mthread-bcol-share = Розмір відносно найбільшого складника положення

js-mthread-bcol-sigma = 1-sigma

js-mthread-bcol-source = Внесок

js-mthread-budget-caption = { $phase }: 1-sigma на вході { $entry }, на піку { $peak }, на виході { $exit } (положення); нижче — кожен внесок, від найбільшого.

js-mthread-chart-title = { $metric } залежно від часу місії, одна смуга на фазу

js-mthread-col-kind = Вид

js-mthread-col-label = Позначка

js-mthread-col-limit = Найбільший внесок

js-mthread-col-margin = Відносно межі

js-mthread-col-peak-pos = Пікове положення

js-mthread-col-peak-time = Пікове зміщення годинника

js-mthread-col-peak-vel = Пікова швидкість

js-mthread-col-phase = Фаза

js-mthread-col-window = Час місії

js-mthread-example-not-loaded = записаний результат не завантажився

js-mthread-file-failed = Не вдалося прочитати { $name }: { $reason }.

js-mthread-kv-elapsed = Час місії від старту

js-mthread-kv-engine = Рушій

js-mthread-kv-epoch = Епоха (UTC)

js-mthread-kv-limits = Фази із заявленою межею

js-mthread-kv-limits-value = { $n } ({ $met } виконано, { $missed } не виконано)

js-mthread-kv-phases = Фази

js-mthread-kv-seed = Зерно (seed)

js-mthread-kv-title = Ланцюжок

js-mthread-layout-phases = Однакова ширина на фазу

js-mthread-layout-time = Справжній час місії

js-mthread-limit-title = { $phase }: заявлена межа, { $limit }

js-mthread-log-scale = логарифмічна шкала

js-mthread-margin-met = { $m }× межі, виконано

js-mthread-margin-missed = { $m }× межі, не виконано

js-mthread-metric-pos = Положення, 1-sigma

js-mthread-metric-time = Зміщення годинника, 1-sigma

js-mthread-metric-vel = Швидкість, 1-sigma

js-mthread-na = н/д

js-mthread-no-events = Ця фаза не фіксує жодних подій.

js-mthread-no-phases = результат не містить фаз

js-mthread-no-requirement = межу не вказано

js-mthread-no-series = Результат не містить відліків цієї величини.

js-mthread-no-weak = Результат не називає найслабшої ланки.

js-mthread-not-json = результат не є JSON ({ $reason })

js-mthread-not-thread = це не результат ланцюжка місії (очікується схема { $schema })

js-mthread-note-phases = Кожну фазу накреслено однакової ширини, щоб коротка фаза була так само помітна, як довга; час початку кожної вказано під смугою. Перемкніться на справжній час місії, щоб побачити реальні пропорції. Штрихові лінії — межі, які вказує документ; розрив лінії — це передача.

js-mthread-note-time = Справжній час місії: фаза завдовжки кілька хвилин може бути надто вузькою, щоб її побачити. Перемкніться на однакову ширину, щоб її прочитати. Штрихові лінії — межі, які вказує документ; розрив лінії — це передача.

js-mthread-open-failed = Не вдалося відкрити приклад: { $reason }.

js-mthread-opened = { $name } прочитано на цій сторінці; нічого нікуди не надсилалося.

js-mthread-opening = Відкривається приклад класу Artemis…

js-mthread-prov = Кожна позначка на цій сторінці належить самому рушію; сторінка копіює кожне число з результату й лише масштабує його.

js-mthread-recorded = Записаний результат рушія (версія { $version }): ілюстративний ланцюжок, побудований за публічними описами місій; числа змодельовані й не відповідають нічому реальному.

js-mthread-sets-peak = задає пік

js-mthread-too-large = Цей файл більший за { $mb } MB; його не прочитано.

js-mthread-weak-line = Найслабша ланка — фаза <b>{ $phase }</b>: { $margin }× її заявленої межі, яку задає { $source }. Запас — це найменше відношення заявленої межі до піку фази; значення понад 1 відповідає вимозі.

js-mthread-weakest-flag = найслабша ланка

js-mthread-weakest-mark = найслабша ланка

js-obs-cell-extent = від { $south }° до { $north }° пн. ш., від { $west }° до { $east }° сх. д.

js-obs-cell-read = { $state }: { $cell }. У вибірці { $sampled }, уражено { $affected }.

js-obs-cell-title = { $state }; у вибірці { $sampled }, уражено { $affected }

js-obs-cell-title-reason = { $state } ({ $reason }); у вибірці { $sampled }, уражено { $affected }

js-obs-clear-note = { $notClear } Комірку без запису бачили менш ніж 5 різних повітряних суден, тому її приховано й не намальовано. Колір ніколи не є єдиною підказкою: «не спостерігалося» заштриховано, а таблиця прописує кожен стан.

js-obs-col-affected = Уражені повітряні судна

js-obs-col-bbox = Охоплювальна рамка (Пд, Зх, Пн, Сх)

js-obs-col-bytes = Байти

js-obs-col-cause = Причина

js-obs-col-cell = Комірка (широта, довгота)

js-obs-col-cells = Комірки

js-obs-col-check = Перевірка

js-obs-col-file = Файл

js-obs-col-incident = Інцидент

js-obs-col-sampled = Повітряні судна у вибірці

js-obs-col-sha = SHA-256 (маніфест)

js-obs-col-share = Частка уражених

js-obs-col-state = Стан

js-obs-col-why = Чому не спостерігалося

js-obs-day-alt = На { $date }: комірок із погіршенням — { $degraded }, без погіршення — { $notDegraded }, не спостерігалося — { $notObserved }.

js-obs-day-heading = День { $date } (UTC)

js-obs-ds-attribution = Атрибуція

js-obs-ds-coverage = Охоплення

js-obs-ds-dataset = Набір даних

js-obs-ds-licence = Ліцензія

js-obs-ds-licence-address = Адреса ліцензії

js-obs-ds-product = Продукт

js-obs-ds-written-by = Записано Kshana

js-obs-err-cause = { $name } указує причину, відмінну від «не приписано»; ця сторінка жодної не показує

js-obs-err-feature-polygon = { $name }: об'єкт { $n } не є полігоном комірки

js-obs-err-feature-state = { $name }: об'єкт { $n } має стан «{ $state }», якого немає серед { $states }

js-obs-err-incident-object = { $name }: інцидент { $n } не є об'єктом

js-obs-err-no-date = { $name } не вказує дати

js-obs-err-no-features = { $name } не містить об'єктів

js-obs-err-no-incidents = { $name } не містить списку інцидентів

js-obs-err-not-day = { $name } не є файлом { $schema }

js-obs-err-not-incident = { $name } не є файлом { $schema }

js-obs-err-not-json = { $what } не є JSON ({ $reason })

js-obs-err-not-manifest = { $name } не є файлом { $schema }

js-obs-err-not-object = { $what } не є об'єктом JSON

js-obs-err-not-text = { $what } не є текстом або більший за { $mib } MiB

js-obs-err-states = { $name } називає стани, відмінні від трьох, які показує ця сторінка

js-obs-file-matches = збігається

js-obs-file-mismatch = не збігається

js-obs-file-no-hash = хеш не вказано

js-obs-file-not-opened = не відкрито

js-obs-files-note = Метод { $method }. SHA-256 кожного файлу обчислюється тут із файлу, який ви відкрили, і порівнюється з маніфестом; файл, якого ви не відкрили, не перевіряється.

js-obs-incident = інцидент

js-obs-incident-note = Суміжні комірки з погіршенням (разом із діагональними) утворюють один інцидент. Причина кожного інциденту: не приписано. Це не підтвердження і не NOTAM.

js-obs-kv-cells = Опубліковано комірок

js-obs-kv-day-wide = Вплив на весь день

js-obs-kv-degraded = Погіршено

js-obs-kv-not-degraded = Не погіршено

js-obs-kv-not-observed = Не спостерігалося (опубліковано)

js-obs-kv-scope = Обсяг

js-obs-map-aria = { $summary } Таблиця нижче перелічує кожну комірку.

js-obs-means-degraded = Висока частка повітряних суден у вибірці комірки повідомила того дня про низьку точність навігації, явно вищу за фон цього дня.

js-obs-means-not-degraded = Повітряних суден у вибірці було достатньо, а частка не відповідала правилу.

js-obs-means-not-observed = Дані не дозволили винести судження. Це не «чисто».

js-obs-na = н/д

js-obs-no = ні

js-obs-no-cells = У цьому файлі немає комірок

js-obs-no-day-file = Для { $date } немає файлу дня (.geojson), тому показувати нічого.

js-obs-no-degraded = Цього дня немає комірок із погіршенням.

js-obs-no-file-read = Жодного файлу не вдалося прочитати.

js-obs-no-incident-file = Для цього дня не відкрито файлу інцидентів.

js-obs-no-manifest = Для цього дня не відкрито маніфесту, тож файли не можна перевірити за хешами.

js-obs-no-notice = Цей файл не містить застереження. Консультативне застереження вгорі цієї сторінки однаково чинне.

js-obs-no-reason = причину не вказано

js-obs-not-clear = «Не спостерігалося» не означає «чисто».

js-obs-not-readable = { $name }: не файл, який читає ця сторінка (.geojson, .incidents.json, .manifest.json або .png).

js-obs-not-stated = не вказано

js-obs-note-day-wide = Це був день із впливом на весь день: фон цього дня сам був високим, тож жодної комірки не можна було оцінити. Це не твердження, що небо було чистим.

js-obs-note-summary-mismatch = Зведення, яке вказує файл, не збігається з комірками, які він перелічує; числа показано так, як записано.

js-obs-nothing-yet = Поки що нічого показувати: відкрийте також файл .geojson цього дня.

js-obs-notice = Застереження, яке містить файл: { $notice }

js-obs-opened-day-file = Відкрито днів: { $days }, з файлів: { $files }. Прочитано тут; нічого не завантажено.

js-obs-opened-day-files = Відкрито днів: { $days }, з файлів: { $files }. Прочитано тут; нічого не завантажено.

js-obs-opened-days-file = Відкрито днів: { $days }, з файлів: { $files }. Прочитано тут; нічого не завантажено.

js-obs-opened-days-files = Відкрито днів: { $days }, з файлів: { $files }. Прочитано тут; нічого не завантажено.

js-obs-read-failed = { $name }: не вдалося прочитати ({ $reason }).

js-obs-reason-day-wide = фон цього дня сам був високим, тож жодної комірки не можна було оцінити

js-obs-reason-insufficient = у вибірці було надто мало повітряних суден, щоб винести судження

js-obs-reason-no-background = для цього дня не було фону, з яким можна порівняти комірку

js-obs-release = Випущено не раніше { $when }: продукти публікуються щонайменше через { $hours } h після завершення дня, на { $deg }-градусних комірках. Це не живе подання.

js-obs-release-default = кінець дня плюс затримка

js-obs-show-all =
    { $n ->
        [one] Показати { $n } комірку
        [few] Показати всі { $n } комірки
        [many] Показати всі { $n } комірок
       *[other] Показати всі { $n } комірки
    }

js-obs-state-degraded = Погіршено

js-obs-state-not-degraded = Не погіршено

js-obs-state-not-observed = Не спостерігалося

js-obs-the-day-file = файл дня

js-obs-the-incident-file = файл інцидентів

js-obs-the-manifest = маніфест

js-obs-too-large = { $name }: більший за { $mib } MiB; відкрийте менший файл.

js-obs-unstated-number = невказана кількість

js-obs-withheld = приховано

js-obs-yes-no-call = так: жодної комірки не можна було оцінити

js-opt-avail-label = Доступність, стеля та доступність за ясного неба для кожної станції

js-opt-avail-note = Для кожної станції: доступність лінії за завмирань через хмари й турбулентність, стеля, яку не підніме жоден додатковий запас (хмари та наведення), і доступність за повної відсутності хмар.

js-opt-avail-title = Доступність проти стелі

js-opt-bar-available = { $name }: доступно

js-opt-bar-ceiling = { $name }: стеля

js-opt-bar-clear-sky = { $name }: ясне небо

js-opt-blurb-network = Хмарніша північна, помірна центральна та ясніша південна станції бачать низькоорбітальний оптичний термінал під кутом 30 градусів: як часто лінія працює і що дають додаткові станції?

js-opt-blurb-techniques = Одна висхідна лінія під кутом 25 градусів у хмарах і турбулентності: що дають інша довжина хвилі, більша апертура, адаптивна оптика чи більший запас?

js-opt-cloud-episode = хмарний епізод

js-opt-correlated = корельовані

js-opt-default-bars = стовпці

js-opt-default-chart = діаграма

js-opt-direction-wave = { $direction }, хвиля { $wave }

js-opt-diversity-label = Доступність мережі залежно від кількості станцій

js-opt-diversity-note = Доступність найкращих 1, 2 і 3 станцій за незалежної погоди та за погоди, корельованої на відстані { $km } km.

js-opt-diversity-title = Рознесення станцій

js-opt-fact-capture-loss = Геометричні втрати захоплення

js-opt-fact-direction = Напрям

js-opt-fact-elevation = Кут місця

js-opt-fact-footprint = Пляма променя

js-opt-fact-margin = Запас без атмосфери

js-opt-fact-received = Прийнята потужність, без атмосфери

js-opt-fact-sensitivity = Чутливість приймача

js-opt-fact-wavelength = Довжина хвилі

js-opt-gain-points =
    { $n ->
        [one] +{ $n } відсотковий пункт
        [few] +{ $n } відсоткові пункти
        [many] +{ $n } відсоткових пунктів
       *[other] +{ $n } відсоткового пункту
    }

js-opt-hours = годин

js-opt-independent = незалежні

js-opt-link-down = лінія не працює

js-opt-margin-label = Додатковий запас, потрібний для кожної цілі доступності

js-opt-margin-line-title = { $name }: запас лінії, dB

js-opt-margin-note = Додатковий запас лінії в dB понад нинішній — для кожної цілі доступності; від'ємне значення означає, що лінія вже має більше, ніж потрібно. Для цілі вище за стелю станції немає запасу, який її досягає (рушій її пропускає).

js-opt-margin-title = Запас, потрібний кожній цілі доступності

js-opt-model-output = Результат моделі

js-opt-na = н/д

js-opt-no-data = У цьому результаті немає даних.

js-opt-no-series = У цьому результаті немає часового ряду.

js-opt-no-source = джерело не вказано

js-opt-not-result = це не результат оптичної атмосфери зі станціями

js-opt-open-failed = Не вдалося відкрити { $title }: { $reason }.

js-opt-opening = Відкривається { $title }…

js-opt-outage-label = Імовірність того, що перерва триває довше за певну тривалість

js-opt-outage-note = Імовірність того, що перерва триває довше за певну тривалість, для кожної станції (логарифмічна вісь часу).

js-opt-outage-title = Скільки тривають перерви

js-opt-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

js-opt-prov = { $label } Станції: { $sites }.

js-opt-realised-up = { $value } працює

js-opt-recorded = { $title }: записаний результат рушія (версія { $version }). Результат моделі, а не вимірювання.

js-opt-result-not-json = результат не є JSON ({ $reason })

js-opt-result-not-loaded = записаний результат не завантажився

js-opt-series-label = Запас лінії залежно від часу

js-opt-series-note = Одна реалізація заявленої моделі станції із зерном (seed { $seed }, { $hours } h із кроком { $step } s): хмарні епізоди, стовп рідкої води для кожного, один відлік сцинтиляції на крок. Запас — це бюджет завмирань мінус завмирання через хмари та сцинтиляцію; лінія не працює нижче 0 dB. Це одна вибірка, а не клімат: її доступність відрізняється від заявленої на вибіркову похибку цієї вибірки. Для малювання запас обрізується на −40 dB.

js-opt-series-title = Запас лінії залежно від часу

js-opt-stated = заявлено { $value }

js-opt-stripe-cloud = хмари

js-opt-stripe-down = не працює

js-opt-stripe-title = { $what }, година від { $from } до { $to }

js-opt-techniques-label = Приріст доступності для кожного методу

js-opt-techniques-note = Приріст доступності у відсоткових пунктах відносно базового рівня для однієї станції.

js-opt-techniques-title = Що дає кожен метод

js-opt-th-availability = Доступність

js-opt-th-ceiling = Стеля

js-opt-th-clear-air = Втрати в чистому повітрі

js-opt-th-cloud-prob = Імовірність хмар (вхід)

js-opt-th-fade-budget = Бюджет завмирань

js-opt-th-latlon = Широта, довгота

js-opt-th-mean-outage = Середня перерва

js-opt-th-outages-year = Перерв на рік

js-opt-th-scint = Індекс сцинтиляції

js-opt-th-site = Станція

js-opt-timing-label = Доступність синхронізації для кожної станції та годинника

js-opt-timing-note = Частка всього часу, протягом якої похибка часу лишається в межах порога, для кожної станції та класу годинника: holdover годинника проти тривалості перерв.

js-opt-timing-title = Синхронізація, збережена крізь перерви

js-opt-title-network = Три наземні станції, рознесення станцій

js-opt-title-techniques = Одна висхідна лінія, методи покращення

js-opt-x-best-n = найкращі n станцій

js-opt-x-outage-duration = тривалість перерви, h (log)

js-opt-x-target = ціль доступності, %

js-opt-y-availability = доступність, %

js-opt-y-extra-margin = додатковий запас, dB

js-opt-y-p-longer = P(довше)

js-replay-band-calibrating = калібрування

js-replay-band-degraded = погіршено

js-replay-band-nominal = номінально

js-replay-band-run-ended = { $band } · прогін завершено

js-replay-band-untrusted = недовірений

js-replay-clock = T+{ $t } з { $max }

js-replay-coast-hidden = берег приховано: вигадані положення цього журналу потрапляють на суходіл

js-replay-coast-note = Берег: { $source }, лише для ілюстрації.

js-replay-coast-note-hidden = { $reason }.

js-replay-coast-window = Natural Earth 1:10 мільйонів, вікно { $window }

js-replay-coast-world = Natural Earth 1:110 мільйонів (контур світу в Studio), грубий

js-replay-demo-trust-log = { $title } (журнал довіри)

js-replay-dir-east = сходу

js-replay-dir-north = півночі

js-replay-dir-south = півдня

js-replay-dir-west = заходу

js-replay-dirs-and = { $list } та { $last }

js-replay-drawing-animation = Малюється анімація…

js-replay-drawing-frames = Малюються кадри…

js-replay-every-direction = усіх напрямів

js-replay-file-error = { $name }: { $error }

js-replay-kinds-convergence-horizontal = Збіжність: медіанна горизонтальна похибка

js-replay-kinds-convergence-vertical = Збіжність: медіанна вертикальна похибка

js-replay-kv-course = Повідомлений шляховий кут

js-replay-kv-heading = Курс (гіроскоп)

js-replay-kv-position-error = Похибка положення

js-replay-kv-receiver = Приймач

js-replay-kv-run-time = Час прогону

js-replay-kv-satellites = Супутників використано / у зоні видимості

js-replay-kv-sky = Небо

js-replay-legend = Умовні позначення

js-replay-legend-no-fix = немає визначення

js-replay-legend-true-track = справжня траса

js-replay-moment = Момент T+{ $t }:

js-replay-no-coast = Берег не малюється: для цього вікна його не вбудовано.

js-replay-no-gsv = у цьому журналі немає GSV

js-replay-not-json = { $name }: не JSON.

js-replay-not-scored = не оцінено

js-replay-obs-not-attributed = не приписано

js-replay-open-failed = Не вдалося відкрити { $id }: { $reason }.

js-replay-open-file = Відкрити файл…

js-replay-opened = Відкрито { $name } на панелі { $n }. Прочитано тут; нічого не завантажено.

js-replay-opening = Відкривається { $id }…

js-replay-pause = Пауза

js-replay-play = Відтворити

js-replay-read-failed = { $name }: не вдалося прочитати або намалювати ({ $reason }).

js-replay-reading = Читається { $name }…

js-replay-reduced-motion = Надано перевагу зменшеному рухові, тож відтворення починається з 1x і не запускається саме.

js-replay-run = Прогін

js-replay-run-shown = Прогін, показаний на панелі { $n }

js-replay-saved-svg = Збережено { $name } ({ $size } kB): усі кадри в одному файлі, намальовані за тими самими рядками, що й ця сторінка.

js-replay-saved-zip = Збережено { $name } ({ $size } MB): один SVG на кадр, маніфест рядків, що стоять за кожним, і README.

js-replay-src-instructor = Ваш файл { $name }: оцінки рушія чи неба немає лише з журналом інструктора.

js-replay-src-trust = Ваш файл { $name }: результат довіри не містить неба чи курсу, тому їх не намальовано.

js-replay-status-ready = { $a } та { $b }: синтетичні прогони, оцінені рушієм. Натисніть «Відтворити» або перемістіть годинник.

js-replay-status-synthetic = { $titles }: синтетичні прогони, оцінені рушієм.

js-replay-status-synthetic-no-coast = { $titles }: синтетичні прогони, оцінені рушієм. Берегова лінія недоступна.

js-replay-strip-label = Оцінка довіри протягом прогону

js-replay-titles-and = { $a } та { $b }

js-replay-too-large = { $name } більший, ніж читає ця сторінка.

js-replay-track =
    { $n ->
        [one] Траса з { $n } рядка журналу, північ угорі.
        [few] Траса з { $n } рядків журналу, північ угорі.
        [many] Траса з { $n } рядків журналу, північ угорі.
       *[other] Траса з { $n } рядка журналу, північ угорі.
    }

js-replay-track-widened =
    { $n ->
        [one] Траса з { $n } рядка журналу, північ угорі, розширена, щоб показати найближчий берег.
        [few] Траса з { $n } рядків журналу, північ угорі, розширена, щоб показати найближчий берег.
        [many] Траса з { $n } рядків журналу, північ угорі, розширена, щоб показати найближчий берег.
       *[other] Траса з { $n } рядка журналу, північ угорі, розширена, щоб показати найближчий берег.
    }

js-replay-verdict = Вердикт

js-replay-verdict-degraded = { $dur } погіршено, недовіреного немає

js-replay-verdict-early = Вердикт (ранній)

js-replay-verdict-fine = Лише за журналом і оцінкою рушія; синтетичний, консультативний, не показник якості виявлення.

js-replay-verdict-first = уперше нижче номінального на T+{ $t }

js-replay-verdict-first-after = уперше нижче номінального на T+{ $t }, через { $dur } після початку першої події (T+{ $onset })

js-replay-verdict-first-before = уперше нижче номінального на T+{ $t }, до початку першої події (T+{ $onset })

js-replay-verdict-lowest = Найнижча оцінка довіри { $score } ({ $band }) на T+{ $t }

js-replay-verdict-never-left = оцінка ніколи не залишала номінальної смуги

js-replay-verdict-no-fix = немає визначення протягом { $dur }

js-replay-verdict-not-scored = Не оцінено: оцінку довіри рушія показано для прогонів бібліотеки

js-replay-verdict-peak-error = найбільша записана похибка положення { $err } m на T+{ $t }

js-replay-verdict-untrusted = { $dur } у недовіреній смузі

js-replay-verdict-wait = Показується, коли цей прогін завершиться, на T+{ $t }.

js-ssv-altitude-label = Висота та використані вимірювання

js-ssv-at-least-1 = щонайменше 1 сигнал

js-ssv-at-least-4 = щонайменше 4 сигнали

js-ssv-avail-label = Доступність, { $band }

js-ssv-bar-title = { $label }, { $name }: { $value }{ $unit }

js-ssv-blurb-formation-heo = Головний і заступний апарати на відстані кілометра один від одного на високоеліптичній орбіті: наскільки добре фільтр знає їхнє відносне положення порівняно з тим, що дали б два абсолютні визначення.

js-ssv-blurb-heo = Високоеліптична орбіта (апогей близько 58 600 km) із надирною антеною з високим підсиленням, зенітною патч-антеною та параметричною моделлю бічних пелюсток: сигнали в зоні видимості, найкраще C/N0, головна пелюстка проти бічної, геометричний чинник DOP і сигнали, що дотичні до атмосфери.

js-ssv-blurb-lunar-weak = Місячна трансферна траєкторія з приймачем, створеним для найслабших сигналів: що йому потрібно для захоплення й супроводження і яку частину траєкторії він може використати.

js-ssv-blurb-nav-lunar = Бортовий навігаційний фільтр на місячному трансфері: його похибка положення відносно заявленої межі, нижче й вище власних орбіт супутників GNSS.

js-ssv-blurb-shell = Сферична оболонка на геостаціонарній висоті, вибрана на сітці: як часто космічний апарат там чує щонайменше один і щонайменше чотири сигнали на 20 dB-Hz, на L1 і L5, для кожного сузір'я та для всіх разом?

js-ssv-cn0-altitude-label = Найкраще C/N0 і висота залежно від часу, { $band }

js-ssv-cn0-label = Найкраще C/N0, { $band }

js-ssv-cn0-note = Із сигналів у зоні видимості — найсильніший на кожній епосі: від найменшого до найбільшого за епохами, з позначеним середнім.

js-ssv-cn0-title = Найкраща густина відношення несівної до шуму, { $band }

js-ssv-comparison-failed = Порівняння не вдалося показати ({ $reason }).

js-ssv-comparison-not-loaded = файл порівняння не завантажився

js-ssv-default-bars = стовпці

js-ssv-default-chart = діаграма

js-ssv-default-ranges = діапазони

js-ssv-deputies-note = Абсолютна RMS головного апарата { $rms } m на епохах: { $epochs }.

js-ssv-deputies-title = Кожен заступний апарат

js-ssv-dop-note = Медіана, 95-й перцентиль і найгірший PDOP за епохами з визначенням і, якщо сценарій задає атмосферу, сигнали, що дотичні до неї.

js-ssv-dop-title = Геометричний чинник DOP і атмосфера, { $band }

js-ssv-err-label = Похибка положення відносно заявленої межі

js-ssv-err-note = Штрихова лінія — односигмова межа, яку заявляє фільтр; суцільна лінія — його похибка відносно істини, яку знає сценарій. Проріджено рушієм.

js-ssv-err-title = Похибка положення відносно власної межі фільтра

js-ssv-fact-antenna = Антена

js-ssv-fact-apogee = Висота апогея

js-ssv-fact-cn0-threshold = Поріг густини відношення несівної до шуму

js-ssv-fact-duration = Тривалість

js-ssv-fact-eccentricity = Ексцентриситет

js-ssv-fact-grid-points = Точки сітки

js-ssv-fact-inclination = Нахил

js-ssv-fact-mode = Режим

js-ssv-fact-perigee = Висота перигея

js-ssv-fact-period = Період

js-ssv-fact-shell-altitude = Висота оболонки

js-ssv-fact-sma = Велика піввісь

js-ssv-fact-step = Крок

js-ssv-filter = фільтр

js-ssv-formation-note = Відносна похибка положення RMS від фільтра та від різниці двох абсолютних визначень, за весь прогін і вище орбіт GNSS.

js-ssv-formation-title = Відносне положення заступних апаратів

js-ssv-from-absolute = з двох абсолютних визначень

js-ssv-group-combined = усі разом

js-ssv-icg-note = { $label }; вердикти щодо порога з закомічених файлів результатів рушія (коміт рушія { $commit }). Таблиці буклета публічні; тут нічого не VALIDATED.

js-ssv-icg-wrong-file = файл порівняння ICG не той, який читає ця сторінка

js-ssv-lobe-note = Скільки з придатних ліній пройшло через головну пелюстку, а скільки через бічну, за підрахунком рушія.

js-ssv-lobe-title = Головна й бічна пелюстки, { $band }

js-ssv-na = н/д

js-ssv-nav-note = Використані та відкинуті вимірювання, найдовша перерва з менш ніж чотирма сигналами, кінцева похибка та оцінка тиску сонячного випромінювання відносно істини, яку знає сценарій.

js-ssv-nav-title = Прогін у числах

js-ssv-never = ніколи

js-ssv-never-had-four = ніколи не було чотирьох

js-ssv-never-had-one = ніколи не було жодного

js-ssv-no-range = У цьому результаті немає діапазону.

js-ssv-no-series = Результат не містить ряду для цієї діаграми.

js-ssv-not-in-variant = не входить до варіанта

js-ssv-not-result = це не результат gnss-ssv

js-ssv-of = { $n } з { $total }

js-ssv-offset = зміщення { $deg }°

js-ssv-open-failed = Не вдалося відкрити { $title }: { $reason }.

js-ssv-opening = Відкривається { $title }…

js-ssv-outage-note = У хвилинах, за прогін. «Ніколи» позначає групу, яка ніколи не мала стільки сигналів ніде на оболонці.

js-ssv-outage-title = Найдовші перерви на оболонці

js-ssv-phases-note = Статистика фільтра за прогін і за дві його частини. Середній NEES положення поблизу 3 означає, що заявлена межа фільтра узгоджується з його похибкою.

js-ssv-phases-title = Похибка положення за фазами

js-ssv-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

js-ssv-range-title = { $label }: мін. { $min }, середнє { $mean }, макс. { $max } { $unit }

js-ssv-range-value = від { $min } до { $max }

js-ssv-recorded = { $title }: записаний результат рушія (версія { $version }).

js-ssv-relative-label = Відносна похибка положення

js-ssv-result-not-json = результат не є JSON ({ $reason })

js-ssv-result-not-loaded = записаний результат не завантажився

js-ssv-row-acquires = Захоплює аж до

js-ssv-row-carrier = Супроводження несівної аж до

js-ssv-row-code = Супроводження коду аж до

js-ssv-row-coherent = Когерентне інтегрування

js-ssv-row-delay-mean = Затримка, середня

js-ssv-row-detection = Поріг виявлення

js-ssv-row-false-alarm = Імовірність хибної тривоги на комірку

js-ssv-row-final-error = Кінцева похибка положення

js-ssv-row-gap = Найдовша перерва

js-ssv-row-gated = Вимірювання, відкинуті стробуванням

js-ssv-row-grazing = Дотичні нижче 100 km

js-ssv-row-limb-links = Лінії крізь лімб

js-ssv-row-loss-mean = Втрати, середні

js-ssv-row-lost = Втрачено в атмосфері

js-ssv-row-pdop-median = PDOP, медіана

js-ssv-row-pdop-p95 = PDOP, 95-й перцентиль

js-ssv-row-pdop-worst = PDOP, найгірший

js-ssv-row-plasma-mean = TEC плазмосфери, середній

js-ssv-row-search-cells = Комірки пошуку

js-ssv-row-search-time = Час пошуку

js-ssv-row-srp-est = Тиск сонячного випромінювання, оцінений

js-ssv-row-srp-truth = Тиск сонячного випромінювання, істина

js-ssv-row-stec-mean = Похилий TEC, середній

js-ssv-row-tangent = Висота дотичної, від мін. до макс.

js-ssv-row-tracking = Використаний поріг супроводження

js-ssv-row-used = Використані вимірювання

js-ssv-series-altitude = висота/1000

js-ssv-series-altitude-name = висота

js-ssv-series-best-cn0 = найкраще C/N0

js-ssv-series-error = похибка

js-ssv-series-measurements = вимірювання

js-ssv-series-note = Один проріджений ряд сукупної кількості за всіма сузір'ями. Рушій не записує ряду для окремих сузір'їв, тому жодного не намальовано.

js-ssv-series-signals = сигнали в зоні видимості

js-ssv-series-signals-label = Сигнали в зоні видимості залежно від часу, { $band }

js-ssv-series-stated-bound = заявлена межа

js-ssv-series-title = Сигнали та найкраще C/N0 уздовж орбіти, { $band }

js-ssv-shell-avail-note = Частка точок сітки та моментів часу з щонайменше одним і щонайменше чотирма сигналами понад { $cn0 } dB-Hz.

js-ssv-shell-avail-title = Доступність на оболонці, { $band }

js-ssv-tangent-value = від { $min } до { $max } km

js-ssv-th-above-absolute = Над GNSS: з абсолютних, m

js-ssv-th-above-filter = Над GNSS: фільтр, m

js-ssv-th-band-group = Діапазон і група

js-ssv-th-bar = Поріг

js-ssv-th-baseline = Базова лінія, km

js-ssv-th-common-4 = Епохи з 4 спільними сигналами

js-ssv-th-common-mean = Середня кількість спільних сигналів

js-ssv-th-compares = Що порівнюється

js-ssv-th-deputy = Заступний апарат

js-ssv-th-epochs = Епохи

js-ssv-th-group = Група

js-ssv-th-main-lobe = Лінії головної пелюстки

js-ssv-th-nees = Середній NEES положення

js-ssv-th-phase = Фаза

js-ssv-th-pos-p95 = Положення, 95-й перцентиль, m

js-ssv-th-pos-rms = Положення RMS, m

js-ssv-th-quantity = Величина

js-ssv-th-rel-absolute = Відносна RMS, з абсолютних, m

js-ssv-th-rel-filter = Відносна RMS, фільтр, m

js-ssv-th-rel-vel = Відносна швидкість RMS, m/s

js-ssv-th-run1-cells = Прогін 1: комірки в межах допуску

js-ssv-th-run1-verdict = Вердикт прогону 1

js-ssv-th-sidelobe = Лінії бічної пелюстки

js-ssv-th-sidelobe-share = Частка бічної пелюстки

js-ssv-th-value = Значення

js-ssv-th-variant = Варіант (діагностичний, опорні кути ГЛОНАСС із таблиці 4.2)

js-ssv-th-vel-rms = Швидкість RMS, m/s

js-ssv-th-with-4 = Із 4 або більше сигналами

js-ssv-th-without-1 = Найдовше без 1 сигналу

js-ssv-th-without-4 = Найдовше без 4 сигналів

js-ssv-title-formation-heo = Формація, високоеліптична орбіта

js-ssv-title-heo = Високоеліптична орбіта

js-ssv-title-lunar-weak = Місячний трансфер, приймач слабких сигналів

js-ssv-title-nav-lunar = Бортовий фільтр, місячний трансфер

js-ssv-title-shell = Оболонка на 36 000 km

js-ssv-traj-avail-note = Частка епох із щонайменше одним і щонайменше чотирма сигналами понад { $cn0 } dB-Hz.

js-ssv-traj-avail-title = Доступність уздовж траєкторії, { $band }

js-ssv-transmit-pattern = Діаграма передавання: { $pattern }

js-ssv-unit-signals = сигнали

js-ssv-unknown-mode = цей результат gnss-ssv має режим «{ $mode }», якого ця сторінка не читає

js-ssv-variant-met = { $n } з { $total }, було б виконано

js-ssv-variant-not-met = { $n } з { $total }, усе ще не виконано

js-ssv-view-note = Від найменшої до найбільшої кількості в зоні видимості за епохами, з позначеним середнім.

js-ssv-view-title = Сигнали в зоні видимості, { $band }

js-ssv-weak-note = Що потрібно конструкції приймача, як її обчислює рушій із заявленого інтегрування.

js-ssv-weak-title = Приймач слабких сигналів

js-ssv-x-minutes = хвилини

js-ssv-y-altitude-measurements = висота, тис. km; використані вимірювання

js-ssv-y-cn0-altitude = dB-Hz; висота в тис. km

js-ssv-y-position-log = положення, метри (log)

js-ssv-y-signals-all = сигнали в зоні видимості, усі сузір'я

js-t35data-ai-q-bench-export = Експортувати рух і події сценарію для лабораторного симулятора

js-t35data-ai-q-compliance-rows = Для яких рядків публічних рамок ці прогони підтримують докази (supports evidence for)?

js-t35data-ai-q-evidence-pack = Перевірити або створити пакет доказів події довіри

js-t35data-ai-q-interference-route = Де GNSS виглядав погіршеним і яка частина цього маршруту в цій зоні?

js-t35data-ai-q-iq-recordings = Записи IQ GNSS (сцена, захоплення, супроводження, вхідний каскад, кампанії)

js-t35data-ai-q-osnma-satellites = Дані навігації яких супутників Galileo автентифікує цей потік приймача (OSNMA)?

js-t35data-ai-q-run-scenario = Запустити або пояснити сценарій PNT (орбіти, GNSS, синхронізація часу, об'єднання, Місяць)

js-t35data-ai-q-training-nmea = Мені потрібен синтетичний NMEA з подією глушіння, відтягування положення, спуфінгу часу чи відтворення для навчання

js-t35data-ai-q-trustworthy-log = Чи був цей журнал приймача або NMEA цього судна надійним і коли він перестав бути таким?

js-t35data-ai-tool-osnma-satellites = немає в MCP: використайте osnma_verify (картка OSNMA тут, WebAssembly), kshana osnma verify (CLI) або kshana.osnma_verify (Python)

js-t35data-card-evidence-create-title = Створити пакет доказів

js-t35data-card-evidence-create-what = Підписує вікно журналу приймача та те, що рушій із нього обчислив, щоб будь-хто міг перевірити, що згодом нічого не змінювали. Studio перевіряє пакети.

js-t35data-card-evidence-create-why = Підписування потребує приватного ключа, який не повинен проходити через вебсторінку.

js-t35data-card-iq-title = Монітори й інструменти IQ GNSS

js-t35data-card-iq-what = Побудуйте сцену, захоплюйте й супроводжуйте сигнали, перебирайте параметри, змоделюйте вхідний каскад, запускайте монітори IQ і кампанії, підгоняйте лабораторний журнал. Доступно також із Python і, в межах однієї робочої папки, з інструментів ШІ-асистента.

js-t35data-card-iq-why = Запис — це гігабайти відліків. Сторінка не може його вмістити, а команди, що перетворюють, видобувають і проріджують, переписують записи на диску.

js-t35data-card-land-title = Завантаження полігонів суші для детектора AIS на суходолі

js-t35data-card-land-what = Отримує один закріплений файл суші (Natural Earth, суспільне надбання) і перевіряє його SHA-256. Будівник карти натомість приймає файл суші як текст.

js-t35data-card-land-why = Це єдина команда, що відкриває мережеве з'єднання, і їй потрібні системний curl та явний прапорець.

js-t35data-card-marine-title = Морські інтеграції

js-t35data-card-marine-what = Плагін сервера Signal K і OpenCPN через NMEA у режимі шлюзу по TCP виводять оцінку довіри на програмне забезпечення, яким судноводії-любителі вже користуються; еталонна збірка виводить її на невеликий комп'ютер поруч із приймачем.

js-t35data-card-marine-why = Вони споживають працюючий живий процес і його шлюз TCP: це розгортання на комп'ютері судна.

js-t35data-card-telemetry-title = Довіра як телеметрія безпеки

js-t35data-card-telemetry-what = Перетворює потік довіри (оцінка, смуга, причини) на метрики Prometheus, події syslog у CEF або LEEF для SIEM і на OpenTelemetry. Лише читає потік і ніколи не змінює оцінку.

js-t35data-card-telemetry-why = Це процес, що віддає метрики та надсилає до ваших систем моніторингу, тому він працює поруч із приймачем, а не на сторінці.

js-t35data-card-training-stream-title = Навчальні потоки на адресу TCP або UDP

js-t35data-card-training-stream-what = Надсилає згенерований навчальний потік до мостового симулятора або картплотера в реальному часі чи швидше. Навчальна сторінка Studio генерує той самий текст і дає змогу його завантажити.

js-t35data-card-training-stream-why = Надсилати на мережеву адресу сторінка браузера не може. Потік — лише текст і ніколи не призначений для живих навігаційних систем судна.

js-t35data-feat-ai-ai = Варіанти встановлення сервера MCP із запитаннями, на які відповідає кожен інструмент

js-t35data-feat-ai-name = Використання з ШІ-асистента (сервер MCP)

js-t35data-feat-bench-bench = Експортуйте тут рух, NMEA, шляхові точки та події сценарію

js-t35data-feat-bench-name = Експорт test-bench для лабораторного симулятора

js-t35data-feat-compliance-compliance = Дивіться тут, для яких рядків рамок ваші прогони підтримують докази (supports evidence for), і таблиці зіставлення

js-t35data-feat-compliance-name = Зіставлення compliance з публічними рамками стійкості

js-t35data-feat-evidence-evidence = Перевірте тут пакет і додайте токен позначки часу

js-t35data-feat-evidence-name = Підписані пакети доказів

js-t35data-feat-evidence-why = Створення пакета потребує приватного ключа підпису, який не повинен проходити через вебсторінку. Пакети створюють командним рядком, Python або інструментами ШІ-асистента.

js-t35data-feat-interference-map-interference = Відкрийте файли карт або побудуйте тут карту з CSV і перевірте за нею маршрут

js-t35data-feat-interference-map-name = Карта завад (ADS-B і AIS) та вплив на маршрут

js-t35data-feat-iq-name = Монітори й інструменти IQ GNSS (сцена, захоплення, супроводження, перебір, вхідний каскад, монітор, кампанії)

js-t35data-feat-iq-why = Запис — це гігабайти відліків, які сторінка не може вмістити, а деякі команди переписують записи на диску. Збірка для браузера не має функцій IQ.

js-t35data-feat-jammertest-jammertest = Імпортуйте план для часового проміжку журналу або оцініть журнал приймача (UBX, RINEX, Android, NMEA чи Septentrio SBF) за кожним тестом: затримка виявлення, пропущені, хибні тривоги, час відновлення; MODELLED

js-t35data-feat-jammertest-name = Jammertest як суддя: опублікований план тестів як запланована істина, журнал приймача, оцінений за ним (0.38)

js-t35data-feat-live-gate-name = Живий потік довіри, шлюз і слухач (stdin, файл, TCP, UDP, --gate, --listen)

js-t35data-feat-live-gate-why = Це працюючий процес на шляху даних. Сторінка повертається, коли завершується, і не може тримати сокет відкритим для картплотера, а також позначити визначення недійсним у живому потоці. Studio натомість оцінює обмежений уривок у тому самому живому форматі, без шлюзу.

js-t35data-feat-machines-imufit = Підігнати параметри акселерометра й гіроскопа гібридних сценаріїв і сценаріїв об'єднання за журналом нерухомого IMU; MODELLED

js-t35data-feat-machines-name = Входи приймача й датчиків: RTKLIB .pos, NovAtel OEM7, RTCM 3 MSM, GNSS-SDR, IMU для курсу та підгонка IMU для гібридних сценаріїв і сценаріїв об'єднання (0.38)

js-t35data-feat-machines-trust = Відкрийте журнал в одному з цих форматів (і необов'язковий файл IMU) у загальному прогоні довіри до приймача; власний прапорець глушника NovAtel порівнюється з тривогами Kshana

js-t35data-feat-marine-name = Морські інтеграції: плагін Signal K і OpenCPN

js-t35data-feat-marine-why = Вони споживають працюючий живий процес і його шлюз TCP, тож це розгортання на комп'ютері судна, а не те, що може виконати сторінка.

js-t35data-feat-maritime-trust-name = Морська оцінка довіри для судна в русі (від 0 до 100, з причинами)

js-t35data-feat-maritime-trust-trust = Відкрийте результат або живий прогін JSON-lines і дивіться трасу, оцінку, причини та шлюз; оцініть тут журнал NMEA

js-t35data-feat-nmea-training-name = Навчальні потоки NMEA з журналом інструктора

js-t35data-feat-nmea-training-training = Згенеруйте тут потік і його журнал інструктора, завантажте їх і проведіть розбір для тренера

js-t35data-feat-osnma-name = Перевірка Galileo OSNMA (вхід UBX SFRBX)

js-t35data-feat-osnma-osnma = Завантажте записаний файл і дивіться стан автентифікації для кожного супутника й кожного тега

js-t35data-feat-telemetry-name = Експорт телеметрії: метрики Prometheus, syslog CEF і LEEF, OpenTelemetry

js-t35data-feat-telemetry-why = Він віддає метрики, надсилає syslog і експортує OpenTelemetry із працюючого потоку: це процес, що спілкується з вашими системами моніторингу, чим сторінка бути не може.

js-t35data-feat-training-stream-name = Потокове передавання навчального потоку на адресу TCP або UDP

js-t35data-feat-training-stream-why = Він надсилає на мережеву адресу, чого вебсторінка не робить. Studio генерує текст, а ви його завантажуєте.

js-t35data-page-ai = Використання з вашого ШІ-асистента

js-t35data-page-bench = Експорт test-bench

js-t35data-page-cli = Можливості командного рядка

js-t35data-page-compliance = Зіставлення compliance

js-t35data-page-evidence = Пакети доказів

js-t35data-page-geometry = Геометрія: скайплот, скайлайн і DOP

js-t35data-page-imufit = Підгонка IMU

js-t35data-page-interference = Карта завад

js-t35data-page-jammertest = Оцінка Jammertest

js-t35data-page-osnma = Перевірка OSNMA

js-t35data-page-training = Розбір навчання

js-t35data-page-trust = Морська довіра

js-t35data-sample-iq-help = Список команд IQ

js-t35data-sample-telemetry-cef = Syslog у CEF для демонстраційного прогону

js-t35data-sample-telemetry-leef = Syslog у LEEF для демонстраційного прогону

js-t35data-sample-telemetry-metrics = Метрики Prometheus для демонстраційного прогону

js-tools-ai-group-engine = Встановіть рушій і його бібліотеки

js-tools-ai-group-integrations = Морські інтеграції, плагіни та інформаційні панелі

js-tools-ai-group-mcp = Встановіть сервер MCP для вашого асистента

js-tools-ai-heading = Використовуйте Kshana зі свого ШІ-асистента

js-tools-ai-install-mcp = Встановити сервер MCP

js-tools-ai-intro = Сервер MCP Kshana дає змогу ШІ-асистентові запускати рушій замість того, щоб вгадувати числа. Він працює на вашому комп'ютері; нічого не надсилається до Kshana. Оберіть спосіб, що пасує вашому інструменту.

js-tools-ai-load-failed = Варіанти встановлення не завантажилися ({ $reason }). Дивіться документацію сервера MCP.

js-tools-ai-mcp-docs = Документація сервера MCP

js-tools-ai-more-ways = Інші способи встановлення

js-tools-ai-none-listed = У цій збірці немає переліку варіантів встановлення.

js-tools-ai-other-ways = Інші способи встановити Kshana

js-tools-ai-read-agent-guide = Прочитати посібник для агентів

js-tools-ai-rule = Правило для кожної відповіді: асистент запускає рушій і повідомляє те, що повернув інструмент, з одиницею та рівнем доказів (перевірено за зовнішнім оракулом, або змодельовано), сценарієм, зерном (seed) і версією рушія, щоб прогін можна було повторити. Застереження результату лишаються з ним. Сервер MCP не читає й не записує файлів поза однією папкою, яку ви вмикаєте самі.

js-tools-ai-what-to-ask = Що питати і який інструмент відповідає

js-tools-ai-where-reachable = Де доступна кожна можливість

js-tools-bench-files-written =
    { $n ->
        [one] { $n } файл записано в пам'ять вашого браузера
        [few] { $n } файли записано в пам'ять вашого браузера
        [many] { $n } файлів записано в пам'ять вашого браузера
       *[other] { $n } файлу записано в пам'ять вашого браузера
    }

js-tools-bench-note = Лише рух і позначені інтервали подій. Завантажте їх, щоб відкрити в лабораторному симуляторі.

js-tools-bench-wrong-kind = { $name } — сценарій виду { $kind }. Траєкторія апарата існує для видів { $kinds }; інші види пояснюють, чому її немає.

js-tools-building-report = Будується звіт…

js-tools-choose-catalogue-first = Спершу виберіть JSON каталогу.

js-tools-choose-file-first = Спершу виберіть файл.

js-tools-choose-imu-log = Спершу виберіть журнал нерухомого IMU.

js-tools-choose-pack-first = Спершу виберіть файли пакета.

js-tools-choose-pack-first-above = Спершу виберіть файли пакета (вище).

js-tools-choose-plan-file = Виберіть принаймні один файл плану.

js-tools-choose-receiver-log = Спершу виберіть журнал приймача.

js-tools-choose-result-first = Спершу виберіть принаймні один файл результату (*.result.json).

js-tools-choose-scenario-first = Спершу виберіть сценарій.

js-tools-choose-tsr-first = Спершу виберіть відповідь із позначкою часу (.tsr).

js-tools-chosen = Вибрано

js-tools-col-check = Перевірка

js-tools-col-detail = Подробиці

js-tools-col-first-monitors = Перші монітори

js-tools-col-gap-that-stays = Розрив, що лишається

js-tools-col-last-auth-tag = Останній автентифікований тег (час системи Galileo)

js-tools-col-latency = Затримка, s

js-tools-col-name = Назва

js-tools-col-outcome = Підсумок

js-tools-col-question = Запитання

js-tools-col-recovered = Відновлено

js-tools-col-reference = Еталон

js-tools-col-result = Результат

js-tools-col-row = Рядок

js-tools-col-satellite = Супутник

js-tools-col-slot = Слот, s

js-tools-col-status = Статус

js-tools-col-tags = Теги

js-tools-col-test = Тест

js-tools-col-these-runs = Ці прогони

js-tools-col-tool = Інструмент

js-tools-col-what-is-missing = Чого бракує

js-tools-col-what-it-asks = Що вимагається

js-tools-col-why-not-auth = Чому не автентифіковано

js-tools-copied = Скопійовано

js-tools-copy = Копіювати

js-tools-copy-command-aria = Копіювати: { $cmd }

js-tools-copy-labelled-aria = Копіювати { $label }: { $text }

js-tools-did-not-work = Не спрацювало

js-tools-documentation = Документація

js-tools-download = Завантажити

js-tools-download-all-zip = Завантажити все (zip)

js-tools-download-events-toml = Завантажити події (TOML)

js-tools-download-md = Завантажити (Markdown)

js-tools-download-report-json = Завантажити звіт (JSON)

js-tools-download-report-md = Завантажити звіт (Markdown)

js-tools-download-scorecard-json = Завантажити таблицю оцінок (JSON)

js-tools-download-table-toml = Завантажити таблицю (TOML)

js-tools-download-updated-pack = Завантажити оновлений пакет (zip)

js-tools-download-whole-report-json = Завантажити весь звіт (JSON)

js-tools-engine-lacks-error = Ця збірка рушія (версія { $version }) не має { $need }, тому ще не може виконати це тут. Записані результати та командний рядок усе ще працюють.

js-tools-engine-lacks-status = Ця збірка рушія (версія { $version }) не має { $need }: вона старша за версію, якої потребує цей інструмент. Еквівалент у командному рядку є на вкладці «Командний рядок».

js-tools-engine-running = Рушій (версія { $version }) працює в цьому браузері. Нічого не завантажується.

js-tools-engine-starting = Рушій запускається в цьому браузері…

js-tools-engine-unavailable = Рушій не вдалося запустити тут ({ $reason }). Відкриття файлів працює; для запуску інструментів потрібен WebAssembly.

js-tools-epoch-format = Використовуйте YYYY-MM-DDTHH:MM:SS, за потреби із Z (UTC).

js-tools-epoch-not-real = Це не справжній момент UTC між 2000 і 2099 роками.

js-tools-every-check = Кожна перевірка

js-tools-evidence-disclaimer = Пакет доказів — це технічний запис того, що рушій обчислив зі вказаного журналу за вказаних налаштувань. Це не юридичний висновок, не встановлення фактів про будь-яку подію і не сертифікація. Успішна перевірка означає, що запис не змінено.

js-tools-example-pack = Синтетичний приклад пакета

js-tools-example-pack-note = Синтетичний пакет, створений командним рядком рушія з демонстраційного журналу порома за допомогою демонстраційного ключа. Ключ підставлено нижче; ключ справжнього підписувача надходить від підписувача іншим шляхом.

js-tools-example-pack-tampered = Приклад пакета зі зміною одного байта в epochs.json

js-tools-example-runs = Синтетичні приклади прогонів

js-tools-example-tampered-note = Один байт файлу в пакеті змінено після підписання. Перевірте його: перевірка назве цей файл.

js-tools-exporting = Експортується…

js-tools-field-whole-number = { $field } має бути цілим числом

js-tools-file-not-chosen = { $file } немає серед вибраних файлів

js-tools-file-too-large = { $name } більший за 64 MiB

js-tools-files-selected = { $label }: { $files }

js-tools-fingerprint-not-pinned = Відбиток підписувача: { $fingerprint } (не закріплено: ключ, який називає сам пакет)

js-tools-fingerprint-pinned = Відбиток підписувача: { $fingerprint } (закріплено)

js-tools-fitting = Підгонка…

js-tools-framework-summary = { $name }: підкріплено доказами — { $evidenced }, частково — { $partly }, без доказів — { $notEvidenced }, поза обсягом — { $outOfScope }

js-tools-fw-dhs-rpcf = US DHS Resilient PNT Conformance Framework, v2.0

js-tools-fw-easa-aviation = Настанова EASA щодо завад GNSS для авіації

js-tools-fw-en-16803 = EN 16803 (лише за номером частини та пункту)

js-tools-fw-imo-ships = Настанова IMO щодо завад GNSS для суден

js-tools-fw-nis2-art21 = Директива ЄС NIS2, стаття 21

js-tools-gst-none = немає

js-tools-gst-text = тиждень { $week }, { $tow } s

js-tools-how-to-run = Як запустити

js-tools-imu-file-too-large = { $name } більший за 32 MiB; відкрийте уривок.

js-tools-imu-mean-not-number = Питома сила в спокої не є числом (0 для горизонтальної осі, близько 9.80665 для вертикальної).

js-tools-imu-notice = { $evidence }: оцінювач перевірено на синтетичних журналах білого шуму з відомими коефіцієнтами, а не за зовнішнім оракулом. Таблиця називає SHA-256 журналу ({ $sha }…).

js-tools-imu-selected = { $name } ({ $size }), прочитано тут, ніколи не завантажується.

js-tools-jt-events-count =
    { $n ->
        [one] { $n } запланована подія
        [few] { $n } заплановані події
        [many] { $n } запланованих подій
       *[other] { $n } запланованої події
    }

js-tools-jt-events-note = як запланована істина: заплановані слоти, а не записані часи ефіру. Не RF: { $nonRf }; поза журналом: { $outside }; невідомі ідентифікатори: { $unknown }.

js-tools-jt-guard-hold = Охоронний інтервал { $guard } s, утримання відновлення { $hold } s.

js-tools-jt-guard-hold-overlap = Охоронний інтервал { $guard } s, утримання відновлення { $hold } s. Базовий рівень калібрування перекрився із запланованим слотом.

js-tools-jt-import-needs-start = Для імпорту потрібна перша епоха журналу в UTC (ISO 8601), бо план указано за місцевим часом.

js-tools-jt-sel-catalogue = каталог { $name }

js-tools-jt-sel-log = журнал { $name } ({ $size })

js-tools-jt-sel-no-catalogue = немає каталогу

js-tools-jt-sel-no-log = немає журналу

js-tools-jt-sel-no-plan = немає плану

js-tools-jt-sel-plans =
    { $n ->
        [one] { $n } файл плану
        [few] { $n } файли плану
        [many] { $n } файлів плану
       *[other] { $n } файлу плану
    }

js-tools-jt-slot-range = від { $from } до { $to }

js-tools-jt-what-area = Ділянка тесту

js-tools-jt-what-guard = Охоронний інтервал

js-tools-jt-what-hold = Утримання відновлення

js-tools-jt-what-offset = Зсув від UTC

js-tools-jt-what-year = Рік плану

js-tools-label-command = команда

js-tools-label-pinned-command = закріплена команда

js-tools-label-settings-example = приклад налаштувань { $n }

js-tools-loading = Завантаження…

js-tools-max-runs = Щонайбільше { $max } прогонів.

js-tools-merkle-root-format = Корінь Меркла — це 64 шістнадцяткові цифри.

js-tools-must-be-number = { $what } має бути числом

js-tools-must-be-whole-zero = { $what } має бути цілим числом, 0 означає «не задано»

js-tools-na = н/д

js-tools-needs = Потрібно: { $requires }

js-tools-no = ні

js-tools-none = немає

js-tools-none-in-build = немає в цій збірці

js-tools-not-in-browser = Не в браузері.

js-tools-not-osnma = Не результат OSNMA

js-tools-not-used = Не використано: { $item }

js-tools-notes = Примітки

js-tools-open = Відкрити

js-tools-osnma-advisory = Лише консультативно: це результат аналізу та моніторингу, а не навігаційне обладнання із затвердженням типу. Стан автентифікації, поданий тут, не є послугою цілісності навігації й не може бути єдиною підставою для будь-якого навігаційного рішення або рішення щодо безпеки.

js-tools-osnma-authenticated = Автентифіковано

js-tools-osnma-caption = Стан автентифікації для кожного супутника

js-tools-osnma-demo-note = Підставлено одноразовий публічний ключ; натисніть «Перевірити», щоб запустити тут верифікатор, або покажіть записаний результат.

js-tools-osnma-discarded = Відкинуто

js-tools-osnma-events = Що бачив верифікатор

js-tools-osnma-examples-missing = синтетичних прикладів у цій збірці ще немає

js-tools-osnma-failed = Збій

js-tools-osnma-nma-alert = Статус NMA { $status }; система подала повідомлення-тривогу.

js-tools-osnma-nma-status = Статус NMA { $status }.

js-tools-osnma-not-json = Це не JSON від kshana osnma verify --json (потрібні overall і satellites).

js-tools-osnma-overall = Загалом: { $status }

js-tools-osnma-pages-read =
    { $n ->
        [one] Прочитано { $n } сторінку.
        [few] Прочитано { $n } сторінки.
        [many] Прочитано { $n } сторінок.
       *[other] Прочитано { $n } сторінки.
    }

js-tools-osnma-pending = Очікує

js-tools-osnma-recorded-failed = записаний результат не завантажився

js-tools-osnma-recorded-result = Записаний результат kshana osnma verify --json для { $file }.

js-tools-osnma-tag-counts = автент.: { $authenticated }, збоїв: { $failed }, очікує: { $pending }, відкинуто: { $discarded }

js-tools-osnma-tag-totals =
    { $n ->
        [one] { $n } тег: автентифіковано — { $authenticated }, збій — { $failed }, очікує — { $pending }, відкинуто — { $discarded }.
        [few] { $n } теги: автентифіковано — { $authenticated }, збій — { $failed }, очікує — { $pending }, відкинуто — { $discarded }.
        [many] { $n } тегів: автентифіковано — { $authenticated }, збій — { $failed }, очікує — { $pending }, відкинуто — { $discarded }.
       *[other] { $n } тега: автентифіковано — { $authenticated }, збій — { $failed }, очікує — { $pending }, відкинуто — { $discarded }.
    }

js-tools-osnma-time-caveat = Час: кожна перевірка відраховується від міток часу сторінок, поданих верифікаторові, які тут беруться із самих даних і не захищають від повторного відтворення старих даних. Автентифікація каже, що дані надійшли від системи; вона нічого не каже про сигнал, яким вони прийшли, чи про якість визначення.

js-tools-osnma-unavailable = Недоступно

js-tools-osnma-word-authenticated = Автентифіковано щонайменше один супутник, і жоден не дав збою

js-tools-osnma-word-failed = Перевірка даних якогось супутника дала збій

js-tools-osnma-word-unavailable = Жодного супутника не автентифіковано

js-tools-pack-selected = { $label }: { $files } ({ $size })

js-tools-pinned-to-release = Закріплено за цим випуском:

js-tools-preview = Попередній перегляд

js-tools-public-key-format = Публічний ключ — це 64 шістнадцяткові цифри (32 байти). Нічого іншого не приймається.

js-tools-read-documentation = Прочитати документацію

js-tools-reading-plan = Читається план…

js-tools-refused-file-name = відхилено назву файлу: { $name }

js-tools-run = Запустити

js-tools-runs-read =
    { $n ->
        [one] Прочитано { $n } прогін: { $runs }
        [few] Прочитано { $n } прогони: { $runs }
        [many] Прочитано { $n } прогонів: { $runs }
       *[other] Прочитано { $n } прогону: { $runs }
    }

js-tools-runs-read-engine =
    { $n ->
        [one] Прочитано { $n } прогін рушієм { $engine }: { $runs }
        [few] Прочитано { $n } прогони рушієм { $engine }: { $runs }
        [many] Прочитано { $n } прогонів рушієм { $engine }: { $runs }
       *[other] Прочитано { $n } прогону рушієм { $engine }: { $runs }
    }

js-tools-sample-load-failed = Зразок не завантажився ({ $reason }).

js-tools-sample-note = Справжній вивід команди, записаний із рушія на синтетичному демонстраційному прогоні. Не вимірювання чогось.

js-tools-sample-output = Зразок виводу: { $label }

js-tools-scenario-list-failed = Список сценаріїв не завантажився

js-tools-scoring = Оцінювання…

js-tools-select-and-copy = Виділити й скопіювати

js-tools-settings-example = Приклад налаштувань { $n }:

js-tools-status-evidenced-label = Прогони підтримують докази для (supports evidence for) цього рядка

js-tools-status-evidenced-short = Підкріплено доказами

js-tools-status-not-evidenced-label = Ці прогони нічого не показують для цього рядка

js-tools-status-not-evidenced-short = Без доказів

js-tools-status-out-of-scope-label = Поза тим, що може показати Kshana

js-tools-status-out-of-scope-short = Поза обсягом

js-tools-status-partly-label = Прогони підтримують докази для (supports evidence for) частини цього рядка

js-tools-status-partly-short = Частково

js-tools-tab-ai = ШІ-асистент

js-tools-tab-bench = Test-bench

js-tools-tab-cli = Командний рядок

js-tools-tab-compliance = Compliance

js-tools-tab-evidence = Пакети доказів

js-tools-tab-imufit = Підгонка IMU

js-tools-tab-jammertest = Jammertest

js-tools-tab-osnma = OSNMA

js-tools-tele-all-events = Одна подія syslog на епоху (типово: одна на кожну зміну смуги)

js-tools-tele-file-aria = Файл результату або JSON-lines

js-tools-tele-fmt-cef = Syslog, CEF

js-tools-tele-fmt-leef = Syslog, LEEF

js-tools-tele-fmt-mqtt = MQTT, виявлення Home Assistant (тема, табуляція, корисне навантаження)

js-tools-tele-fmt-otlp = OpenTelemetry (OTLP JSON)

js-tools-tele-fmt-prometheus = Метрики Prometheus

js-tools-tele-format-aria = Формат

js-tools-tele-host = Хост

js-tools-tele-host-aria = Ім'я хоста, що записується в події syslog

js-tools-tele-include-position = Додати повідомлене положення (типово вимкнено)

js-tools-tele-intro = Перетворіть файл результату (session.result.json) або живі рядки JSON на один із форматів, у цьому браузері. Потрібна збірка рушія з експортом телеметрії (0.35 і новіші з експортом); команди вище працюють усюди.

js-tools-tele-note = Рядки syslog тут не мають позначки часу (сторінка не читає годинника); її ставить інструмент командного рядка. Prometheus дає кінцевий стан. MQTT дає один рядок на повідомлення: тема, потім табуляція, потім корисне навантаження; звідси нічого не публікується. Текст той самий, що його друкує команда.

js-tools-tele-run-here = Запустити тут

js-tools-that-file-too-large = Цей файл більший за 64 MiB.

js-tools-token-attached = Токен долучено

js-tools-token-attached-note = Оновлений пакет нижче. Підпис органу позначок часу тут НЕ перевірено: виконайте openssl ts -verify.

js-tools-trust-monitor-sentence = Речення монітора довіри: { $sentence }

js-tools-two-files-same-name = два файли мають назву { $name }

js-tools-ubx-bad-crc =
    { $n ->
        [one] { $n } сторінка не пройшла перевірку CRC.
        [few] { $n } сторінки не пройшли перевірку CRC.
        [many] { $n } сторінок не пройшли перевірку CRC.
       *[other] { $n } сторінки не пройшли перевірку CRC.
    }

js-tools-ubx-file = Файл UBX

js-tools-ubx-frames-pages = Кадрів UBX: { $frames }; декодовано сторінок I/NAV: { $pages }.

js-tools-ubx-skipped-bytes =
    { $n ->
        [one] Між кадрами пропущено { $n } байт.
        [few] Між кадрами пропущено { $n } байти.
        [many] Між кадрами пропущено { $n } байтів.
       *[other] Між кадрами пропущено { $n } байта.
    }

js-tools-ubx-time-conflicts =
    { $n ->
        [one] { $n } сторінка мала час, що суперечив сусіднім.
        [few] { $n } сторінки мали час, що суперечив сусіднім.
        [many] { $n } сторінок мали час, що суперечив сусіднім.
       *[other] { $n } сторінки мали час, що суперечив сусіднім.
    }

js-tools-ubx-unstamped =
    { $n ->
        [one] { $n } сторінку не вдалося розмістити в часі.
        [few] { $n } сторінки не вдалося розмістити в часі.
        [many] { $n } сторінок не вдалося розмістити в часі.
       *[other] { $n } сторінки не вдалося розмістити в часі.
    }

js-tools-unknown = невідомо

js-tools-unused-scenarios = Файли сценаріїв без відповідного результату не використано: { $files }.

js-tools-verdict-failed-text = Перевірка не пройшла.

js-tools-verdict-failed-title = Збій

js-tools-verdict-intact-text = Пакет цілий щодо ключа, який він називає сам і який може згенерувати будь-хто. Отримайте публічний ключ підписувача від підписувача іншим шляхом і закріпіть його.

js-tools-verdict-intact-title = Цілий, але підписувача не закріплено

js-tools-verdict-verified-text = Пакет не змінено, і його підписано закріпленим вами ключем.

js-tools-verdict-verified-title = Перевірено

js-tools-verifying = Перевіряється…

js-tools-what-failed = Що дало збій

js-tools-why-not-browser = Чому не в браузері:

js-tools-yes = так

js-training-active-events = Активні події

js-training-band-large = понад 100 m

js-training-band-medium = від 25 до 100 m

js-training-band-small = менш ніж 25 m

js-training-chart-max = макс. { $v }

js-training-chart-mean-cn0 = середнє C/N0

js-training-chart-position-error = похибка положення

js-training-chart-s-reported-minus-true = s, повідомлений мінус істинний

js-training-chart-satellites = супутники

js-training-chart-time-offset = зсув часу

js-training-chart-used-tracked = використано / відстежується

js-training-col-reported = Повідомлено приймачем

js-training-col-true = Істинне

js-training-cue-course = Курс гіроскопа та швидкість за лагом жодна подія не змінює. Тут повідомлений шляховий кут відрізняється від курсу гіроскопа на { $course }. Течія також розводить курс і шляховий кут, тож порівняйте з початком прогону.

js-training-cue-course-speed = Курс гіроскопа та швидкість за лагом жодна подія не змінює. Тут повідомлений шляховий кут відрізняється від курсу гіроскопа на { $course }, а повідомлена швидкість від істинної — на { $speed } kn. Течія також розводить курс і шляховий кут, тож порівняйте з початком прогону.

js-training-cue-title = Підказка для розбору.

js-training-cue-unknown-amount = невідому величину

js-training-debrief-now = Розібрати зараз

js-training-default-warning = Синтетичні навчальні дані. Лише для навчання й тестування: ніколи не подавайте цей потік у живі навігаційні системи судна.

js-training-demo-coastal-drag-off = Берегове відтягування положення

js-training-demo-combined-event = Комбінована подія

js-training-demo-fjord-degradation = Природне погіршення у фіорді

js-training-demo-open-sea-jamming = Глушіння у відкритому морі

js-training-demo-port-time-spoof = Спуфінг часу під час заходу в порт

js-training-dl-log-json = Завантажити журнал інструктора (JSON)

js-training-dl-log-text = Завантажити журнал інструктора (текст)

js-training-dl-nmea = Завантажити потік NMEA

js-training-err-demo-open = Не вдалося відкрити { $title }: { $reason }.

js-training-err-engine-old = Ця збірка рушія (версія { $version }) не має генератора навчального NMEA; вона старша за цю сторінку. Команда: { $command }.

js-training-err-engine-start = Рушій не вдалося запустити тут ({ $reason }). Сценарії бібліотеки вище, як і раніше, відкриваються без нього.

js-training-err-file-not-loaded = файл не завантажився

js-training-err-generate = Не вдалося згенерувати: { $reason }.

js-training-err-newer-schema = { $name }: схема { $schema } новіша або відмінна від { $supported }, яку читає ця сторінка. Оновіть Studio, а не вгадуйте її поля.

js-training-err-no-schema = { $name }: це не журнал інструктора навчання Kshana (немає тега схеми).

js-training-err-no-track = { $name }: у журналі немає рядків траси для малювання.

js-training-err-no-usable-rows = { $name }: немає придатних рядків траси.

js-training-err-not-json = { $name }: не JSON ({ $reason }).

js-training-err-read = { $name }: не вдалося прочитати ({ $reason }).

js-training-err-read-or-draw = { $name }: не вдалося прочитати або намалювати ({ $reason }).

js-training-err-scenario-not-loaded = файл сценарію не завантажився

js-training-err-seed = Зерно (seed) має бути цілим числом або порожнім, щоб використати власне зерно сценарію.

js-training-err-too-large = { $name }: більший за { $max }. Ця сторінка читає журнали до цього розміру.

js-training-err-too-many-rows = { $name }: у журналі рядків траси — { $count }; ця сторінка малює щонайбільше { $max }. Записуйте рідше (log_interval_s) або відкрийте уривок.

js-training-err-unknown-schema = { $name }: невідома схема { $schema }; ця сторінка читає { $supported }.

js-training-event-n = Подія { $id }

js-training-event-onset = Початок { $utc }

js-training-extra-bearing = Пеленг, як застосовано, град. істинних

js-training-extra-peak-accel = Пікове прискорення, яке додає відтягування, m/s²

js-training-extra-peak-speed = Пікова швидкість, яку додає відтягування, m/s

js-training-fact-duration = Тривалість

js-training-fact-events = Введено подій

js-training-fact-max-error = Найбільша похибка положення

js-training-fact-max-time-offset = Найбільший зсув часу

js-training-fact-no-fix = Час без визначення

js-training-fact-peak-accel = Пікове прискорення, істинне / повідомлене

js-training-fact-peak-speed = Пікова швидкість, істинна / повідомлена

js-training-fact-seed = Зерно (seed)

js-training-fact-start = Початок (UTC)

js-training-fix-reported-span = визначення подано, від { $from } до { $to }

js-training-generated = Згенеровано «{ $title }» рушієм { $version }: речень NMEA — { $lines }. Синтетично: лише для навчання й тестування; ніколи не подавайте його в живі навігаційні системи судна.

js-training-generated-here = Згенеровано тут рушієм («{ $title }»). Синтетично: вигадані положення й дати.

js-training-generating = Рушій запускається й генерує…

js-training-kind-drag-off = Відтягування положення

js-training-kind-jamming = Глушіння

js-training-kind-natural-degradation = Природне погіршення (закрите небо)

js-training-kind-replay-delay = Затримка відтворення

js-training-kind-time-spoof = Спуфінг часу

js-training-legend-no-fix = Немає визначення: приймач нічого не повідомив

js-training-legend-reported = Повідомлено, { $band } від істинної

js-training-legend-true = Справжня траса

js-training-library-label = Синтетичний сценарій бібліотеки «{ $title }», записаний командою { $command }. Вигадані положення й дати; жодного реального судна чи запису.

js-training-log-row = Рядок журналу { $row } з { $total }, { $utc }

js-training-max-error-at = { $m } m на T+{ $s } s

js-training-moment-event = (подія { $id })

js-training-moment-title = T+{ $s } s { $what }: { $text }

js-training-moments-shown =
    { $total ->
        [one] Показано перші { $shown } з { $total } моменту.
        [few] Показано перші { $shown } з { $total } моментів.
        [many] Показано перші { $shown } з { $total } моментів.
       *[other] Показано перші { $shown } з { $total } моменту.
    }

js-training-no-events = Немає: це чистий прогін.

js-training-no-fix-nothing = немає визначення: нічого не повідомлено

js-training-no-fix-span = немає визначення, від { $from } до { $to }

js-training-no-moments = Моментів не записано.

js-training-none = немає

js-training-none-now = У цей момент немає.

js-training-none-reported = нічого не повідомлено

js-training-north = Пн

js-training-not-touched = не зачеплено жодною подією

js-training-opened = Відкрито { $name }: рядків журналу — { $rows } за { $secs } s.

js-training-opening = Відкривається { $title }…

js-training-param-affect-time = Впливає на час

js-training-param-bearing-deg = Пеленг, град. істинних

js-training-param-cn0-drop-db = Падіння C/N0, dB

js-training-param-counterfeit-cn0-dbhz = Підроблене C/N0, dB-Hz

js-training-param-delay-s = Затримка, s

js-training-param-duration-s = Тривалість, s

js-training-param-final-offset-m = Кінцевий зсув, m

js-training-param-kind = Вид

js-training-param-label = Позначка

js-training-param-offset-s = Зсув часу, s

js-training-param-ramp-s = Наростання на початку, s

js-training-param-recovery-s = Спад під час відновлення, s

js-training-param-relative-bearing-deg = Пеленг відносно шляхового кута, град.

js-training-param-skyline = Скайлайн

js-training-param-spread-db = Розкид за супутниками, dB

js-training-param-start-s = Початок, s

js-training-pause = Пауза

js-training-play = Відтворити

js-training-reading = Читається…

js-training-readout-fix = визначення

js-training-readout-no-fix = немає визначення

js-training-reduced-motion = Надано перевагу зменшеному рухові, тож відтворення починається з 1x. Користуйтеся повзунком або стрілками, щоб переходити без анімації.

js-training-row-cn0 = Середнє C/N0, dB-Hz

js-training-row-cog = Шляховий кут, град.

js-training-row-error = Похибка положення, m

js-training-row-fix = визначення

js-training-row-heading = Курс (гіроскоп), град.

js-training-row-moments = моменти

js-training-row-position = Положення

js-training-row-sats = Супутників використано / відстежується

js-training-row-sog = Шляхова швидкість, kn

js-training-row-time-offset = Зсув часу, s

js-training-say-active = активні: { $list }

js-training-say-event-id = подія { $id }

js-training-say-fix = приймач повідомляє про визначення

js-training-say-mean-cn0 = середнє C/N0 { $cn0 } dB-Hz

js-training-say-no-fix = немає визначення

js-training-say-position-from-true = повідомлене положення на { $m } m від істинного

js-training-say-sats-used = використано супутників: { $used } із { $tracked }

js-training-say-time-ahead = повідомлений час випереджає істинний на { $s } s

js-training-say-time-behind = повідомлений час відстає від істинного на { $s } s

js-training-sky-no-gsv = немає GSV

js-training-sky-none = Для цього журналу немає неба: сам лише журнал інструктора не має супутників. Відкрийте сценарій бібліотеки або згенеруйте тут потік і розберіть його, щоб побачити супутники з його GSV.

js-training-skyline-preset = пресет { $name }

js-training-skyline-stated = заявлений профіль

js-training-span-no-fix = від T+{ $from } до { $to } s

js-training-track-desc = Справжня траса та повідомлена траса, північ угорі. Найбільша похибка положення { $error }. Періодів без визначення: { $periods }.

js-training-track-end = кінець

js-training-track-start = початок

js-training-trainer-note = Примітка тренера

js-training-warn-no-warning-text = Цей файл не містить тексту застереження. Це навчальний журнал: не подавайте його потік у живу навігацію.

js-training-warn-rows-skipped =
    { $count ->
        [one] { $count } рядок траси був недійсним і його пропущено.
        [few] { $count } рядки траси були недійсними і їх пропущено.
        [many] { $count } рядків траси були недійсними і їх пропущено.
       *[other] { $count } рядка траси були недійсними і їх пропущено.
    }

js-training-what-fix-lost = Визначення втрачено

js-training-what-fix-regained = Визначення відновлено

js-training-what-full-effect = Повний ефект

js-training-what-onset = Початок

js-training-what-recovered = Відновлено

js-training-what-recovery-begins = Початок відновлення

js-trust-adv-carried = Консультативне застереження, яке містить цей файл:

js-trust-adv-none = Цей файл не містить консультативного застереження

js-trust-adv-none-rest = (старіші вихідні файли його не містять). Консультативне застереження вгорі цієї сторінки однаково стосується й цього файлу.

js-trust-agree-both = обидва позначають: власний прапорець приймача та монітор Kshana

js-trust-agree-calibrating = у вікні калібрування: не порівнюється

js-trust-agree-kshana-only = тривога лише від Kshana: приймач не позначає

js-tools-ubx-ignored-sfrbx =
    { $n ->
        [one] { $n } повідомлення SFRBX проігноровано
        [few] { $n } повідомлення SFRBX проігноровано
        [many] { $n } повідомлень SFRBX проігноровано
       *[other] { $n } повідомлення SFRBX проігноровано
    } (інші системи, E5b, тривоги, хибні контрольні суми).
