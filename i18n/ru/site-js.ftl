# site-js.ftl (ru): translations

js-app-engine-failed = Не удалось загрузить движок ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } строка реестра
        [few] { $n } строки реестра
        [many] { $n } строк реестра
       *[other] { $n } строки реестра
    }

js-site-action-copy-install = Копировать: cargo install kshana

js-site-action-launch = Запустить { $name }

js-site-action-licence = Обсудить коммерческую лицензию

js-site-action-pro-eval = Запросить пробную версию Kshana Pro

js-site-action-study = Заказать исследование

js-site-action-theme = Переключить светлую или тёмную тему

js-site-capabilities-bd-after = { $m } m через { $s } s

js-site-capabilities-bd-combined = суммарно

js-site-capabilities-bd-crossing = { $m } m на { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» через { $s } s, преобладает { $dom }

js-site-capabilities-bd-fig-lead = Время с момента потери GNSS на логарифмической оси, IMU класса { $grade } при { $speed } m/s:

js-site-capabilities-bd-fig-tail = Линии показывают законы роста ошибки движка на коротком выбеге и их корень из суммы квадратов; пересечения получены по его полной девятисостоянной модели ошибок (Шулера), которая ограничивает смещения, поэтому на длинных выбегах каждое пересечение наступает чуть позже, чем линия до него доходит. Столбцы: те же пересечения для четырёх классов IMU.

js-site-capabilities-cd-canvas-aria = Орбитальная группировка вокруг своего тела, реальные снимки: перетаскивайте или используйте клавиши со стрелками для поворота, плюс и минус для масштаба

js-site-capabilities-cd-design-meta = { $n } спутников · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Каждый спутник движется по собственному треку движка; радиус замороженной орбиты определяется элементами оболочки.

js-site-capabilities-cd-foot-mean-motion = Каждый спутник движется по собственному треку движка, на радиусе, который задаёт его среднее движение.

js-site-capabilities-cd-foot-walker = Все { $n } спутников размещены по собственным параметрам Уокера для оболочек (сверено с { $shown } треками движка: наихудшее { $deg }°); следы — это { $shown } треков движка.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» спутников

js-site-capabilities-cd-hud-mission = Миссия «{ $time }»

js-site-capabilities-cd-legend-shell = оболочка { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Доля прогона с PDOP ≤ { $limit } (от 0 до 100 %)

js-site-capabilities-cd-map-pdop = Средний PDOP на ячейку { $step }° (от { $lo } до { $hi }; чем ярче, тем лучше)

js-site-capabilities-cd-map-visible = Среднее число спутников в зоне видимости (от { $lo } до { $hi })

js-site-capabilities-cd-metric-availability = Доступность

js-site-capabilities-cd-metric-pdop = Средний PDOP

js-site-capabilities-cd-metric-visible = В зоне видимости

js-site-capabilities-cd-pause = Приостановить орбиты

js-site-capabilities-cd-play = Воспроизвести орбиты

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: { $n } спутников, таблица слотов оператора

js-site-capabilities-cd-span = из { $dur }, по кругу

js-site-capabilities-cd-stat-in-view = В среднем в зоне видимости

js-site-capabilities-cd-stat-mask = Маска · прогон

js-site-capabilities-cd-stat-median = Медианный PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, всё тело { $body }

js-site-capabilities-cd-stat-satellites = Спутники

js-site-capabilities-cd-stat-worst = Наихудший пункт

js-site-capabilities-cd-title-gnss = Четыре GNSS вместе

js-site-capabilities-cd-title-leo = Мегагруппировка на низкой околоземной орбите

js-site-capabilities-cd-title-lunar = Набор лунных ретрансляторов

js-site-capabilities-cd-work-ratio = { $pct } % после префильтра по широте · { $dop } решений DOP

js-site-capabilities-cd-work-tests = { $after } проверок «спутник — точка» из { $brute }, которые потребовал бы полный перебор

js-site-capabilities-cd-work-title = Объём расчёта видимости

js-site-capabilities-cg-cn0-sub = C/N0 относительно порога слежения

js-site-capabilities-cg-cn0-title = Отношение несущей к спектральной плотности шума

js-site-capabilities-cg-compose-availability = Доступность

js-site-capabilities-cg-compose-fewest = Наименьшее число отслеживаемых

js-site-capabilities-cg-compose-js = Средний J/S

js-site-capabilities-cg-compose-text = Один источник помех, { $power } { $unit }, в одной точке, привязанный к { $n } прогонам-участникам вида ‹{ $kind }›: судно в проливе и автомобиль на прибрежной дороге видят одну и ту же причину, но получают разные результаты.

js-site-capabilities-cg-log-campaign = кампания { $file } · фаз: { $phases } · прогонов-участников: { $runs }

js-site-capabilities-cg-log-phase = начинается фаза { $name }

js-site-capabilities-cg-log-phase-carries = начинается фаза { $name } · переносит { $carried }

js-site-capabilities-cg-monte-axis = итоговая ошибка часов по { $n } значениям seed ({ $path })

js-site-capabilities-cg-monte-ci = Среднее, 95-процентный интервал

js-site-capabilities-cg-monte-mean = Среднее

js-site-capabilities-cg-monte-p05 = 5-й

js-site-capabilities-cg-monte-p05-p95 = с 5-го по 95-й

js-site-capabilities-cg-monte-p50 = медиана

js-site-capabilities-cg-monte-p95 = 95-й

js-site-capabilities-cg-monte-std = Стандартное отклонение

js-site-capabilities-cg-monte-text = Один и тот же сценарий ‹{ $kind }›, запущенный { $n } раз с базовым начальным значением (seed) { $seed }, по одному seed на прогон: разброс итоговой ошибки свободно идущих часов с 95-процентным доверительным интервалом для среднего.

js-site-capabilities-cg-not-in-phase = не в этой фазе

js-site-capabilities-cg-now = Фаза { $n } из { $total }: { $name } · от { $from } до { $to }

js-site-capabilities-cg-phase-title = { $name }: от { $from } до { $to } · завершена по условию { $by } · виды участников { $kinds }

js-site-capabilities-cg-pl-sub = относительно предела оповещения

js-site-capabilities-cg-pl-title = Уровень защиты

js-site-capabilities-cg-pos-sub = относительно бюджета · лог.

js-site-capabilities-cg-pos-title = Ошибка инерциального положения

js-site-capabilities-cg-range = от { $lo } до { $hi }

js-site-capabilities-cg-sweep-all-lost = Все потеряны начиная с

js-site-capabilities-cg-sweep-axis = мощность передатчика источника помех ({ $key })

js-site-capabilities-cg-sweep-first-loss = Первая потеря

js-site-capabilities-cg-sweep-lg-availability = доступность

js-site-capabilities-cg-sweep-lg-js = средний J/S

js-site-capabilities-cg-sweep-never = никогда

js-site-capabilities-cg-sweep-nodes = Узлы

js-site-capabilities-cg-sweep-none = нет

js-site-capabilities-cg-sweep-span = Диапазон J/S

js-site-capabilities-cg-sweep-text = Один сценарий ‹{ $kind }›, запускаемый по разу на каждый узел, пока мощность передатчика источника помех меняется от { $from } до { $to } { $unit }. Доступность при подавлении (сплошная линия) и средний J/S (пунктир) берутся из собственных показателей качества каждого прогона-участника.

js-site-capabilities-cg-te-sub = относительно его защитного интервала

js-site-capabilities-cg-te-title = Ошибка времени часов

js-site-capabilities-copy = Копировать

js-site-capabilities-copy-aria = Скопировать команду, воспроизводящую прогон: kshana { $file }

js-site-capabilities-cz-best = Лучший PDOP

js-site-capabilities-cz-failed = Записанный прогон не удалось загрузить здесь; откройте его в Studio.

js-site-capabilities-cz-fix = Отсчёты с определением положения

js-site-capabilities-cz-fix-value = { $n } из { $total } ({ $pct }%)

js-site-capabilities-cz-median = Медианный PDOP

js-site-capabilities-engine = Движок v{ $version }

js-site-capabilities-engine-build = Движок v{ $version }, сборка

js-site-capabilities-engine-report = Отчёт движка

js-site-capabilities-globe-aria = { $name } на реальных снимках ({ $credit }). Для поворота перетаскивайте или используйте клавиши со стрелками; плюс и минус меняют масштаб.

js-site-capabilities-ho-ends = прогон заканчивается на { $t }

js-site-capabilities-ho-past-guard = за пределом защитного интервала

js-site-capabilities-no-seed = детерминированно, без seed

js-site-capabilities-open-in-studio = Открыть в { $studio }

js-site-capabilities-open-report = Открыть отчёт движка

js-site-capabilities-orrery-aria = Солнечная система на эпоху прогона: перетаскивайте или используйте клавиши со стрелками для поворота, плюс и минус для масштаба

js-site-capabilities-orrery-bodies = тел: { $n } · наблюдатель «{ $observer }»

js-site-capabilities-orrery-epoch = Эпоха «{ $epoch }» · TDB (барицентрическое динамическое время), юлианская дата { $jd }

js-site-capabilities-pnt-chart-title = ретрансляторы в зоне видимости (линия) · Земля над горизонтом (заливка) · для определения положения нужно четыре

js-site-capabilities-pnt-kicker = Позиционирование у этого тела · вид body-pnt

js-site-capabilities-pnt-lander = Посадочный аппарат на { $lat }°, { $lon }° на поверхности ориентируется по ретрансляторам, с двусторонним измерением дальности от Земли всякий раз, когда Земля над горизонтом (односторонняя задержка света { $min } min). Доступность: { $a } % только по ретрансляторам, { $b } % с линией связи с Землёй.

js-site-capabilities-pnt-orbiter = Орбитальный пользователь ориентируется по ретрансляторам, с двусторонним измерением дальности от Земли всякий раз, когда Земля над горизонтом (односторонняя задержка света { $min } min). Доступность: { $a } % только по ретрансляторам, { $b } % с линией связи с Землёй.

js-site-capabilities-pnt-relays = ретрансляторов: { $n } на { $alt } km вокруг тела { $body }

js-site-capabilities-report-data = Отчёт и данные

js-site-capabilities-result-data = Данные результата

js-site-capabilities-saved = Сохранено: { $name }

js-site-capabilities-scenario-file = Файл сценария

js-site-capabilities-seed = seed { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» удерживается в защитном интервале { $dur }

js-site-capabilities-six-clock-guard = защитный интервал { $v } ns

js-site-capabilities-six-coast-budget = бюджет { $m } m

js-site-capabilities-six-coast-denied = GNSS недоступна

js-site-capabilities-six-coast-fig = «{ $id }» в пределах бюджета в течение { $s } s

js-site-capabilities-six-floor = порог слежения

js-site-capabilities-six-integ-fig = «{ $ok }» из { $n } эпох доступно · пределы оповещения: { $h } m по горизонтали, { $v } m по вертикали

js-site-capabilities-six-integ-limit = вертикальный предел оповещения

js-site-capabilities-six-integ-pl = вертикальный (сплошная линия) и горизонтальный (пунктир) уровень защиты

js-site-capabilities-six-jam-effective = эффективное, спутников: { $n }

js-site-capabilities-six-jam-fig = Отслеживается «{ $min }» из { $max } в зоне видимости · доступность при подавлении «{ $av }» (номинально { $nom }) · средний J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = номинальное, без источника помех (пунктир)

js-site-capabilities-six-orbit-fig = Высота «{ $lo }–{ $hi } km» · трасса по поверхности за { $dur }

js-site-capabilities-six-orbit-label = { $source } · отсчётов: { $n }

js-site-capabilities-six-orbit-sgp4 = SGP4 по двухстрочному набору элементов

js-site-capabilities-six-spoof-detects = { $id } обнаруживает

js-site-capabilities-six-spoof-fig = «{ $id }» обнаруживает на { $s } s (граница { $ns } ns)

js-site-capabilities-ss-angle = Угол от Солнца

js-site-capabilities-ss-credit = Снимки: { $credits }. * Карта не доходит до полюсов; пробел заполняется средним цветом карты у полюса. Кольца Сатурна: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } сут.

js-site-capabilities-ss-frame-origin = Начало системы отсчёта

js-site-capabilities-ss-from-sun = От Солнца

js-site-capabilities-ss-gloss = NAIF: код тела в Службе навигационной и вспомогательной информации NASA. GM: гравитационный параметр. J2: член сжатия. Полюс IAU: полюс вращения по определению Международного астрономического союза, в виде прямого восхождения (RA) и склонения (Dec).

js-site-capabilities-ss-j2-none = не опубликовано

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } тела { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Время света от { $observer }

js-site-capabilities-ss-link = от { $from } до { $to }, односторонняя задержка света { $one }, туда и обратно { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Линия связи, которую рассчитывает этот прогон:
        [few] Линии связи, которые рассчитывает этот прогон:
        [many] Линии связи, которые рассчитывает этот прогон:
       *[other] Линии связи, которые рассчитывает этот прогон:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Его спутник в масштабе на эпоху
        [few] Его спутники в масштабе на эпоху
        [many] Его спутники в масштабе на эпоху
       *[other] Его спутники в масштабе на эпоху
    }

js-site-capabilities-ss-nominal-error = номинальная ошибка { $km } km по расстоянию

js-site-capabilities-ss-north = Вид с севера от эклиптики.

js-site-capabilities-ss-period = Орбитальный период

js-site-capabilities-ss-period-about = Период обращения вокруг тела { $parent }

js-site-capabilities-ss-pole = Полюс IAU (RA, Dec)

js-site-capabilities-ss-radius = Средний радиус

js-site-capabilities-ss-retrograde = { $v } h, попятное вращение

js-site-capabilities-ss-rotation = Звёздное вращение

js-site-capabilities-ss-years = { $v } лет

js-site-capabilities-st-bound = граница { $v } m

js-site-capabilities-st-fig-none = Эпох: { $n }, ни в одной ошибка не превышает свою границу. По горизонтали: истинная ошибка положения; по вертикали: уровень защиты; обе оси логарифмические.

js-site-capabilities-st-fig-some = Эпох: { $n }, из них в { $k } ошибка превышает свою границу. По горизонтали: истинная ошибка положения; по вертикали: уровень защиты; обе оси логарифмические.

js-site-capabilities-st-limit = предел оповещения { $m } m

js-site-capabilities-st-misleading = вводит в заблуждение: ошибка выше границы

js-site-capabilities-st-normal = нормальная работа

js-site-capabilities-st-unavailable = недоступно: граница выше предела

js-site-capabilities-studio-embedded = { $studio }, встроенная: прогон orbit-multignss

js-site-capabilities-studio-load = Загрузить { $studio } здесь

js-site-capabilities-studio-outline = Показать контур снова

js-site-capabilities-wave-chirp = ЛЧМ-сигнал

js-site-capabilities-wave-cw = тон CW

js-site-capabilities-wave-noise = шум

js-site-capabilities-wf-an-caption = строка T+{ $t } s · dB выше порога, логарифмический масштаб · пик по всей сетке { $peak } dB

js-site-capabilities-wf-degraded = Ухудшено

js-site-capabilities-wf-degraded-low = ухудшено

js-site-capabilities-wf-failed = Записанный прогон не удалось загрузить здесь.

js-site-capabilities-wf-grid = сетка

js-site-capabilities-wf-iq = На T+{ $t } s движок также строит модель в виде { $n } отсчётов IQ (синфазная и квадратурная составляющие) около { $mhz } MHz и сверяет с ней оценку Уэлча ({ $segments } сегментов по { $nfft }): интегральное отношение мощностей { $ratio }.

js-site-capabilities-wf-jammer-off = { $what }: выключен

js-site-capabilities-wf-jammer-on = { $what }: включён

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · с { $on } s до конца

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Захват потерян

js-site-capabilities-wf-lost-low = захват потерян

js-site-capabilities-wf-max = на { $peak } dB выше · логарифмический масштаб от { $v0 } dB

js-site-capabilities-wf-no-jammer = без источника помех

js-site-capabilities-wf-now = сейчас

js-site-capabilities-wf-pause = Приостановить водопад

js-site-capabilities-wf-peak = пик { $v } dB

js-site-capabilities-wf-play = Воспроизвести водопад

js-site-capabilities-wf-replay-previous = начало повтора · ниже предыдущий проход

js-site-capabilities-wf-replay-start = начало повтора

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = сигнал +{ $v } dB

js-site-capabilities-wf-summary = Записанный прогон { $file }: диапазонов — { $bands }, источников помех — { $jammers }, длительность { $seconds } с. Наихудший диапазон, { $worst }, опускается до { $min } dB-Hz на { $at } s; порог слежения { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = на { $v } dB выше уровня шума

js-site-capabilities-wf-tip-in = в диапазонах: { $bands }

js-site-capabilities-wf-tracking = Слежение

js-site-capabilities-wf-tracking-low = слежение

js-site-caphero-aria = Солнечная система по прогону движка solar-system на { $date }: Солнце и тел — { $bodies }, движущихся по орбитальным трекам движка; орбит, проверенных по JPL Horizons: { $valid }.

js-site-caphero-clock = +{ $days } сут. · { $date }

js-site-caphero-copy-command = Копировать команду

js-site-caphero-copy-title = Скопировать команду, воспроизводящую его

js-site-caphero-credits = Расстояния сжаты по логарифмической шкале, направления истинные; тела увеличены, вращаются с условной скоростью. Снимки: { $credits }; кольца Сатурна: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Масштаб и источники снимков

js-site-caphero-engine-build = Движок v{ $version }, сборка

js-site-caphero-explore = Исследовать каждое тело

js-site-caphero-file-title = Файл сценария, который выполнялся

js-site-caphero-list-item = { $name }: { $label }, { $au } au от Солнца на эпоху, орбитальный период { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au от Солнца на эпоху, орбитальный период { $period }, время света от { $observer } { $light }.

js-site-caphero-no-seed = детерминированно, без seed

js-site-caphero-open-in-studio = Открыть в { $studio }

js-site-caphero-pause = Приостановить орбиты

js-site-caphero-period-days = { $value } сут.

js-site-caphero-period-years = { $value } лет

js-site-caphero-play = Воспроизвести орбиты

js-site-caphero-rate = { $days } сут. прогона в секунду

js-site-caphero-rate-epoch = Кадр на эпоху прогона

js-site-caphero-read-distance = { $au } au от Солнца

js-site-caphero-read-light = время света от { $observer } на эпоху { $light }

js-site-caphero-read-orbit = орбита { $period }

js-site-caphero-seed = seed { $seed }

js-site-copy-aria = Копировать: { $cmd }

js-site-developers-captured-from = записано { $recorded } из

js-site-developers-engine-build = Движок v{ $version }, сборка

js-site-developers-exit-stamp = выход { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: открыть в { $studio }

js-site-developers-no-seed = (детерминированно, без seed)

js-site-developers-open-in-studio = Открыть в { $studio }

js-site-developers-pause = Приостановить воспроизведение

js-site-developers-play = Воспроизвести запись

js-site-developers-replaying = # воспроизведение записанного сеанса

js-site-developers-seed = (seed { $seed })

js-site-developers-what-runs-write = Что записывает каждый прогон

js-site-editions-builds-on-it = { $label } строится на нём

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } вид
        [few] { $n } вида
        [many] { $n } видов
       *[other] { $n } вида
    }

js-site-editions-core-title = Открытое ядро

js-site-editions-core-validated = проверено

js-site-editions-core-validated-of = { $validated } из { $total }

js-site-editions-free-core = Бесплатно в открытом ядре, как и каждый вид

js-site-editions-group-other = Другое

js-site-editions-kind-no-ledger = ни один модуль реестра не совпадает с ним по имени

js-site-editions-kind-validated = проверено строк реестра: { $v } из { $tot }

js-site-editions-pause = Приостановить кольца

js-site-editions-play = Воспроизвести кольца

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Индивидуальное исследование

js-site-evidence-allan-aria = Четыре девиации набора данных NIST SP 1065 из 1000 точек в зависимости от времени усреднения; воспроизведены все { $n } опубликованных значений, наибольшая относительная ошибка { $err }

js-site-evidence-allan-lg-published = опубликованное значение, SP 1065, таблица 31

js-site-evidence-allan-mdev = модифицированная девиация Аллана

js-site-evidence-allan-na = н/д

js-site-evidence-allan-oadev = перекрывающаяся девиация Аллана

js-site-evidence-allan-ohdev = перекрывающаяся девиация Адамара

js-site-evidence-allan-read = { $tau } s · Аллан { $oadev } · модифицированная { $mdev } · Адамар { $ohdev }

js-site-evidence-allan-st-gate = порог теста

js-site-evidence-allan-st-reproduced = опубликованные значения воспроизведены

js-site-evidence-allan-st-worst = наибольшая относительная ошибка

js-site-evidence-allan-tdev = девиация времени, в секундах

js-site-evidence-allan-tip-at = «{ $name }» на { $m } s

js-site-evidence-allan-tip-engine = движок: «{ $got }» · относительная ошибка { $err }

js-site-evidence-allan-tip-table = SP 1065, таблица 31: «{ $want }»

js-site-evidence-cell-tip = Возможность { $i } из { $n } · «{ $label }»

js-site-evidence-cowell-aria = Расхождение положения с Orekit за 24 часа: уровни сил с 1 по 5 остаются ниже { $worst }; уровень с сопротивлением достигает { $drag }, характеризационная полоса

js-site-capabilities-cd-no-webgl = Для 3-D-вида нужен WebGL; карта покрытия и показатели относятся к тому же прогону.

js-site-evidence-cowell-gto = геостационарная переходная орбита

js-site-evidence-cowell-leo = низкая околоземная орбита

js-site-evidence-cowell-lg-con = уровни с 1 по 5, задача двух тел вплоть до светового давления Солнца, по две орбиты на каждый

js-site-evidence-cowell-lg-drag = уровень 6, сопротивление: только характеризация (разные модели плотности)

js-site-evidence-cowell-read = { $h } h · уровни с 1 по 5, наихудшее { $con } · сопротивление { $drag }

js-site-evidence-cowell-st-drag = уровень сопротивления, наихудшее

js-site-evidence-cowell-st-epochs = эпох на уровнях с 1 по 5

js-site-evidence-cowell-tip-tier = «Уровень { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = наибольшее расхождение «{ $err }» на { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Внешний оракул не назван.

js-site-evidence-hero-oracle = Оракул

js-site-evidence-hero-oracle-is = Оракул: { $o }

js-site-evidence-hero-owner = Ответственный

js-site-evidence-hero-partner = Это находится в ведении партнёра; движок ничего из этого не заявляет.

js-site-evidence-hero-pause = Приостановить обзор

js-site-evidence-hero-play = Воспроизвести обзор

js-site-evidence-hero-row = Строка { $i } из { $n }

js-site-evidence-hold-accepted = принято: в пределах множителя { $bar }

js-site-evidence-hold-aria = Измеренная среднеквадратическая ошибка времени цезиевых часов относительно времени выбега и прогноз движка; прогноз к измеренному: нарушение границы от { $lo } до { $hi }

js-site-evidence-hold-control = «Контроль:» наивный прогноз (односекундная стабильность, прочитанная как белый частотный шум) даёт отношение { $ratio }, мимо примерно в { $factor } раз, и не проходит тот же порог. У порога есть зубы.

js-site-evidence-hold-lg-meas = измерено на отложенной записи (точка: нарушение границы)

js-site-evidence-hold-lg-pred = предсказано по первой трети (кольцо: нарушение границы)

js-site-evidence-hold-nodata = Измеренная запись была недоступна, когда создавалась эта страница.

js-site-evidence-hold-perfect = 1 = идеально

js-site-evidence-hold-ratio-aria = Прогноз к измеренному для { $n } пороговых значений, все в пределах принятого множителя { $bar }

js-site-evidence-hold-read = выбег { $h } h · измерено { $m } ns · предсказано { $p } ns

js-site-evidence-hold-st-fit = использовано для подгонки

js-site-evidence-hold-st-samples = односекундные отсчёты

js-site-evidence-hold-st-syncs = отложенные точки синхронизации

js-site-evidence-hold-tip-breach = предсказанное нарушение границы { $p } s · измеренное { $m } s

js-site-evidence-hold-tip-error = «Ошибка времени { $thr } ns»

js-site-evidence-hold-tip-ratio = прогноз к измеренному «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · прогноз к измеренному «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = распределение хи-квадрат

js-site-evidence-kernel-chi2-quantile = квантиль хи-квадрат

js-site-evidence-kernel-noncentral = нецентральное хи-квадрат

js-site-evidence-kernel-normal-cdf = нормальное распределение

js-site-evidence-kernel-normal-quantile = квантиль нормального распределения

js-site-evidence-kernel-pbias = смещение обнаружения

js-site-evidence-ladder-aria = Невязки орбиты от { $lo } до { $hi } m в одном логарифмическом масштабе, с порогом агентства { $bar } m

js-site-evidence-ladder-bar = порог агентства { $bar } m

js-site-evidence-ladder-cowell = Коуэлл относительно Orekit 12.2, наихудшее

js-site-evidence-ladder-g24 = Galileo E11, подгонка за 24 часа

js-site-evidence-ladder-g8 = Galileo E11, подгонка за 8 часов

js-site-evidence-ladder-lg-headline = основная невязка

js-site-evidence-ladder-lg-over = сверх порога агентства { $bar } m

js-site-evidence-ladder-lg-ring = только модель сил, до эмпирических ускорений

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, подгонка за 4 часа

js-site-evidence-ladder-read = обзор на { $v } · основных невязок не выше него: { $n } из { $total }

js-site-evidence-ladder-rt-arc = дуга { $arc } · степень и порядок { $do } · наблюдений: { $n }

js-site-evidence-ladder-rt-rtn = радиально { $r } m · вдоль трека { $a } m · поперёк трека { $c } m

js-site-evidence-ladder-sgp4 = SGP4 относительно векторов AIAA, наихудшее

js-site-evidence-ladder-swarm = Swarm-A, подгонка за 3 часа

js-site-evidence-ladder-tip-cowell = «Коуэлл · наихудшее из { $n } эпох» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · полные сутки» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · только модель сил» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · с эмпирическими ускорениями» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Лунный орбитальный аппарат · динамический» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Лунный орбитальный аппарат · редуцированно-динамический» · { $rms } m, выше порога { $bar } m, приведено как есть

js-site-evidence-ladder-tip-sgp4 = «SGP4 · наихудший из { $n } векторов» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · динамический» · { $rms } m, почти целиком вдоль трека (сопротивление)

js-site-evidence-ladder-tip-swr = «Swarm-A · редуцированно-динамический» · { $rms } m

js-site-evidence-raim-aria = { $pass } из { $n } случаев SciPy в пределах своей полосы допуска, по { $kernels } ядрам

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = наибольшая доля полосы, которую использует какой-либо случай

js-site-evidence-raim-read = случай { $q } из { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % полосы

js-site-evidence-raim-scale-aria = Цветовая шкала: доля использованной полосы допуска, логарифмическая, от 10 в степени минус 11 до границы полосы

js-site-evidence-raim-st-inside = в пределах полосы

js-site-evidence-raim-st-most = использована большая часть полосы

js-site-evidence-raim-tick-edge = граница полосы

js-site-evidence-raim-tick-exact = точно

js-site-evidence-raim-tip-case = «{ $kernel }» · случай { $j } из { $n }

js-site-evidence-raim-tip-exact = «точное совпадение» с SciPy

js-site-evidence-raim-tip-uses = использует «{ $pct } %» своей полосы допуска

js-site-evidence-sgp4-aria = Воспроизведено { $n } из { $n } векторов AIAA; наихудшее { $worst }, медиана { $median }, все в пределах допуска { $tol }

js-site-evidence-sgp4-deep = дальний космос (SDP4)

js-site-evidence-sgp4-lg-deep = вектор дальнего космоса (SDP4)

js-site-evidence-sgp4-lg-median = медиана и наихудшее на шкале

js-site-evidence-sgp4-lg-near = околоземный вектор (SGP4)

js-site-evidence-sgp4-near = околоземное пространство (SGP4)

js-site-evidence-sgp4-read = вектор { $i } из { $n } · спутник { $sat } · ошибка { $err }

js-site-evidence-sgp4-read-deep = вектор { $i } из { $n } · спутник { $sat }, дальний космос · ошибка { $err }

js-site-evidence-sgp4-scale-aria = Цветовая шкала от 0,1 микрометра до допуска, логарифмическая

js-site-evidence-sgp4-st-deep = векторы дальнего космоса

js-site-evidence-sgp4-st-sats = испытательные спутники

js-site-evidence-sgp4-tip-sat = «Спутник { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = вектор { $j } из { $n } · ошибка положения «{ $err }»

js-site-evidence-st-median = медиана

js-site-evidence-st-worst = наихудшее

js-site-evidence-tolerance = допуск { $v }

js-site-filter-in-all = всего { $total }

js-site-filter-matches =
    { $n ->
        [one] { $n } совпадение
        [few] { $n } совпадения
        [many] { $n } совпадений
       *[other] { $n } совпадения
    }

js-site-filter-n-of-m = { $n } из { $total }

js-site-filter-n-of-m-rows = { $n } из { $total } строк

js-site-filter-rows = строк: { $total }

js-site-home-banner-gnss-lost = GNSS потеряна · holdover

js-site-home-banner-holdover-out = Holdover · часы вне защитного интервала

js-site-home-banner-integrity-holdover = Тревога целостности · holdover продолжается

js-site-home-banner-integrity-none = Тревога целостности · нет уровня защиты

js-site-home-banner-integrity-pl = Тревога целостности · PL > AL

js-site-home-banner-jamming = Подавление · C/N0 у порога

js-site-home-banner-spoofing = Тревога спуфинга · РЧ-детектор

js-site-home-cap-holdover = Источник помех доходит до { $dbw } dBW: отслеживается спутников — { $trk }. Часы идут свободно от { $carry } ns, оставленных спуфером, и пересекают свой защитный интервал { $guard } ns на { $at }; INS движется по инерции.

js-site-home-cap-integrity = Спутники возвращаются, но только выше маски { $mask }°: отслеживается { $trk }. Уровень защиты превышает предел оповещения { $al } m или не может быть сформирован, поэтому монитор подаёт тревогу, а часы остаются в режиме holdover.

js-site-home-cap-jamming = Широкополосный источник помех на расстоянии { $km } km при { $dbw } dBW. C/N0 падает до { $cn } dB-Hz, на { $above } dB выше порога слежения { $floor } dB-Hz; все { $trk } спутников по-прежнему отслеживаются.

js-site-home-cap-nominal = Отслеживается спутников: { $trk }, средний C/N0 { $cn } dB-Hz. Часы подстроены под время GNSS, а уровень защиты ({ $pl } m) ниже предела оповещения { $al } m.

js-site-home-cap-recovery = GNSS синхронизирована заново: отслеживается спутников — { $trk }, ошибка времени вернулась к { $te } ns, уровень защиты { $pl } m.

js-site-home-cap-spoofing = Спуфер сдвигает часы приёмника со скоростью { $rate } ns/s. РЧ-детектор (радиочастотный) подаёт тревогу сразу; монитор с опорой на часы срабатывает через { $det } s, завершая фазу с { $off } ns сдвига, возвращённого назад.

js-site-home-cn-no-lock = 0 из { $max } отслеживается · нет захвата

js-site-home-cn-tracking = { $n } из { $max } отслеживается

js-site-home-no-pl = нет PL

js-site-home-pause = Приостановить миссию

js-site-home-pl-alarm = тревога · PL выше AL

js-site-home-pl-no-sats = нет спутников, нет PL

js-site-home-pl-not-computed = не вычисляется в этой фазе

js-site-home-pl-too-few = слишком мало спутников

js-site-home-pl-under-al = ниже AL { $thr } m

js-site-home-play = Воспроизвести миссию

js-site-home-receiver-tracking = Приёмник · отслеживается: { $n }

js-site-home-replay-restarted = Повтор перезапущен · { $file }

js-site-home-te-disciplined = подстроены под GNSS

js-site-home-te-free-running = holdover · свободный ход

js-site-home-te-outside-guard = holdover · вне защитного интервала

js-site-home-te-spoofer = спуфер тянет часы

js-site-home-thr-floor = порог

js-site-home-thr-guard = защитный интервал

js-site-kind-action = Действие

js-site-mcp-arguments-excerpt = аргументы (фрагмент)

js-site-mcp-axis-mission-time = время миссии

js-site-mcp-clock-holdover = holdover: { $clock }

js-site-mcp-dir-reply = kshana-mcp → ассистент

js-site-mcp-dir-request = ассистент → kshana-mcp

js-site-mcp-figcaption = Построено по возвращённому ряду: ошибка времени каждых часов относительно порога

js-site-mcp-fom-availability = доступность

js-site-mcp-fom-caption = Показатели качества, возвращённые run_scenario, по каждым часам

js-site-mcp-fom-header = Показатель качества

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = ошибка времени, 95-й процентиль (ns)

js-site-mcp-fom-rms = ошибка времени, среднеквадратическая (ns)

js-site-mcp-lede = Записано { $recorded } · v{ $version } · стандартный ввод и вывод · протокол { $protocol } · только точные сообщения

js-site-mcp-legend-gnss-lost = GNSS потеряна на { $s } s

js-site-mcp-legend-threshold = порог { $v } ns

js-site-mcp-pause = Пауза

js-site-mcp-play = Воспроизвести

js-site-mcp-plot-aria = Ошибка времени { $quantum } и { $classical }, возвращённая run_scenario, относительно порога { $threshold } ns; GNSS (глобальная навигационная спутниковая система) потеряна на { $lost } s

js-site-mcp-recorded-json = Записанный JSON: { $label }

js-site-mcp-scenario-hash = хеш сценария

js-site-mcp-server-identity = идентичность сервера

js-site-mcp-show-json = Показать JSON

js-site-mcp-step-aria = Шаг { $n } из { $total }: { $name }

js-site-mcp-step-result = результат: показатели качества

js-site-mcp-step-status = Шаг { $n } из { $total } · { $name }

js-site-mcp-summary-excerpt = итоговая строка и результат (фрагмент)

js-site-mcp-tab-result = результат

js-site-mcp-threshold = порог

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } строка
        [few] { $n } строки
        [many] { $n } строк
       *[other] { $n } строки
    }

js-site-mcp-toml-more = … (ещё строк в { $file }: { $n })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } инструмент
        [few] { $n } инструмента
        [many] { $n } инструментов
       *[other] { $n } инструмента
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } инструмент с описаниями
        [few] { $n } инструмента с описаниями
        [many] { $n } инструментов с описаниями
       *[other] { $n } инструмента с описаниями
    }

js-site-menu-close = Закрыть меню

js-site-menu-open = Открыть меню

js-site-missions-avail-title = Доступность: доля прогона с PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % в каждой ячейке

js-site-missions-chart-error-title = ошибка положения (m, лог.)

js-site-missions-chart-four = для определения положения нужно четыре

js-site-missions-chart-four-short = четыре для определения

js-site-missions-chart-lg-earth = Земля видна

js-site-missions-chart-lg-error-earth = ошибка, ретрансляторы и дальность до Земли

js-site-missions-chart-lg-error-relays = ошибка, только ретрансляторы

js-site-missions-chart-lg-relays = ретрансляторы в зоне видимости

js-site-missions-chart-relays-title = ретрансляторы в зоне видимости · заливка: Земля над горизонтом

js-site-missions-chip-at-pdop = при PDOP ≤ { $limit }

js-site-missions-chip-engine = Движок:

js-site-missions-chip-fix-earth = определение положения, с Землёй

js-site-missions-chip-median-pdop = медианный PDOP

js-site-missions-chip-relays = ретрансляторы

js-site-missions-chip-rms = СКО

js-site-missions-chip-satellites = спутники

js-site-missions-chip-tracking-held = { $label }: слежение сохранено

js-site-missions-clocks-aria = Ошибка времени после суток holdover, по классам часов, логарифмическая шкала

js-site-missions-clocks-frame = нижний порог системы отсчёта { $ns } ns

js-site-missions-clocks-note = ошибка времени через сутки, секунды (лог.)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns через сутки, σy(1 s) { $sigma }

js-site-missions-cone-aria = Конус ошибки положения с момента потери GNSS

js-site-missions-cone-axis-x = время с момента потери GNSS (s)

js-site-missions-cone-axis-y = ошибка положения (m)

js-site-missions-cone-budget = бюджет ±{ $m } m

js-site-missions-cone-clipped = обрезано на ±{ $m } m

js-site-missions-cone-leaves = выходит за пределы на { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Копировать команду

js-site-missions-copy-title = Скопировать команду, воспроизводящую его

js-site-missions-deterministic = детерминированно

js-site-missions-engine-build = Движок v{ $version }, сборка

js-site-missions-engine-build-commit = Движок v{ $version }, сборка { $commit }

js-site-missions-fp-aria = Карта зоны подавления. Клавиши со стрелками перемещают между ячейками, Enter открывает этот прогон.

js-site-missions-fp-aria-svg = Зона подавления вокруг источника помех

js-site-missions-fp-darker = темнее = выше средний J/S · ячейки { $step } km · прогонов движка: { $n }

js-site-missions-fp-jammer = источник помех

js-site-missions-fp-lg-held = слежение сохранено

js-site-missions-fp-lg-lost = потеряны все спутники

js-site-missions-fp-lg-some = часть эпох потеряна

js-site-missions-fp-open = Открыть этот прогон в { $studio }

js-site-missions-fp-read = примерно { $km } km от источника помех · средний J/S { $js } dB · доступность слежения { $av }

js-site-missions-fp-ship = судно из сценария

js-site-missions-grades-aria = Свободный инерциальный выбег до { $a } m и { $b } m, по классам IMU

js-site-missions-grades-axis = секунд выбега после потери GNSS (лог.)

js-site-missions-grades-point = { $grade }: { $s } s до { $m } m ({ $why })

js-site-missions-grades-reaches = ошибка достигает { $m } m

js-site-missions-grades-speed = при { $v } m/s

js-site-missions-grades-this = этот сценарий

js-site-missions-hud-earth-link = Линия связи с Землёй

js-site-missions-hud-link-above = Линия связи с Землёй · над горизонтом

js-site-missions-hud-link-occulted = Линия связи с Землёй · закрыта

js-site-missions-hud-orbiter = Орбитальный аппарат

js-site-missions-hud-receiver = Приёмник

js-site-missions-hud-relays = Ретрансляторы

js-site-missions-hud-selected-lat = выбранная широта

js-site-missions-info-in-view = В зоне видимости

js-site-missions-info-in-view-value = в среднем { $mean } · наименьшее { $fewest }

js-site-missions-info-pdop-above = { $pdop }, выше { $limit }

js-site-missions-json-title = Результат движка без изменений

js-site-missions-json-unavailable = JSON недоступен

js-site-missions-key-avail = Доступность

js-site-missions-key-pdop-title = Средний PDOP (геометрический фактор положения)

js-site-missions-key-vis = Спутники в зоне видимости

js-site-missions-key-vis-short = В зоне видимости

js-site-missions-leo-grid = сетки при PDOP ≤ { $limit }

js-site-missions-leo-in-view = в зоне видимости в среднем

js-site-missions-leo-shells = спутников в четырёх оболочках

js-site-missions-map-aria = { $title } над телом { $body }, по ячейкам 10 градусов. Клавиши со стрелками перемещают приёмник; его ячейка показана ниже.

js-site-missions-map-colour-by = Раскрасить карту по

js-site-missions-map-fewest-in-view = наименьшее в зоне видимости

js-site-missions-map-grey = серый: нет определения положения

js-site-missions-map-hatched = штриховка: выше предела PDOP { $limit }

js-site-missions-map-in-view = в зоне видимости

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = в среднем в зоне видимости

js-site-missions-map-mean-pdop = средний PDOP

js-site-missions-map-pdop-limit = предел PDOP { $limit }

js-site-missions-matrix-caption = Файлы сценариев по отраслям (строки) и видам отказа (столбцы). Выберите число, чтобы открыть отрасль.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } файл сценария
        [few] { $sector }, { $mode }: { $n } файла сценария
        [many] { $sector }, { $mode }: { $n } файлов сценария
       *[other] { $sector }, { $mode }: { $n } файла сценария
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } файл:
        [few] { $n } файла:
        [many] { $n } файлов:
       *[other] { $n } файла:
    }

js-site-missions-matrix-sector = Отрасль

js-site-missions-mode-int = Помехи

js-site-missions-mode-itg = Целостность

js-site-missions-mode-nav = Выбег

js-site-missions-mode-orb = Геометрия

js-site-missions-mode-spf = Спуфинг

js-site-missions-mode-tim = Время

js-site-missions-n-of-total = { $n } из { $total }

js-site-missions-no-fix = нет определения положения

js-site-missions-no-seed = детерминированно, без seed

js-site-missions-open-in-studio = Открыть в { $studio }

js-site-missions-open-report = Открыть отчёт движка

js-site-missions-ow-chart-aria = Отклик приёмника за прогон для { $name }: ретрансляторы в зоне видимости и ошибка положения только по ретрансляторам и с дальностью до Земли

js-site-missions-ow-chip-epochs = эпохи

js-site-missions-ow-chip-mask = маска

js-site-missions-ow-chip-orbiter = орбитальный аппарат

js-site-missions-ow-chip-range = дальность σ

js-site-missions-ow-chip-relays = ретрансляторы

js-site-missions-ow-chip-relays-value = { $planes } × { $per } на { $alt } km, { $inc }°

js-site-missions-ow-chip-span = интервал

js-site-missions-ow-count-relays = ретрансляторов: { $n } и орбитальный аппарат · { $body }

js-site-missions-ow-count-sats = спутников: { $n } · { $body }

js-site-missions-ow-engine = движок v{ $version } · сборка { $commit }

js-site-missions-ow-lat-label = Широта приёмника

js-site-missions-ow-map-aria = Отклик приёмника для { $name }: карта тела { $body } по ячейкам 10 градусов, рядом среднее и наименьшее число спутников в зоне видимости и средний PDOP по широте

js-site-missions-ow-note-imagery = Снимки { $body }: NASA.

js-site-missions-ow-note-rebuilt = Орбиты: ретрансляторы и орбитальный аппарат восстановлены по сценарию точно так, как их строит движок; получаемое число спутников в зоне видимости совпадает с числом движка на всех { $n } эпохах.

js-site-missions-ow-note-sats = Орбиты: спутники прогона заново распространены здесь и сверены со всеми { $n } отсчётами трассы по поверхности, записанными движком (наихудшее { $deg }°).

js-site-missions-ow-note-scaled = Радиусы орбит масштабированы для отображения; плоскости, фазирование и периоды — те, что в прогоне.

js-site-missions-ow-note-tracks = Движок записал трассы по поверхности для { $shown } из { $total } спутников; все { $total } нарисованы по его оболочкам.

js-site-missions-ow-note-walker = Орбиты: оболочки Уокера прогона заново распространены здесь и сверены со всеми { $n } отсчётами трассы по поверхности, записанными движком (наихудшее { $deg }°).

js-site-missions-ow-off = выкл.

js-site-missions-ow-on = вкл.

js-site-missions-ow-pause = Приостановить орбиты

js-site-missions-ow-play = Воспроизвести орбиты

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Время миссии

js-site-missions-ow-valuetext = { $time }, ретрансляторов в зоне видимости: { $n }

js-site-missions-pdop-title = Средний PDOP (геометрический фактор положения), логарифмическая шкала, чем меньше, тем лучше

js-site-missions-report = Отчёт

js-site-missions-report-title = Собственный отчёт движка об этом прогоне

js-site-missions-ro-above-horizon = над горизонтом

js-site-missions-ro-availability = Доступность, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Земля · время света { $s } s

js-site-missions-ro-error-relays = Ошибка положения, только ретрансляторы

js-site-missions-ro-occulted = закрыта

js-site-missions-ro-place-availability = В точке { $place }: доступность

js-site-missions-ro-place-in-view = В точке { $place }: в зоне видимости, в среднем · наименьшее

js-site-missions-ro-relays = Ретрансляторы в зоне видимости

js-site-missions-ro-satellites = Спутники

js-site-missions-ro-with-earth = С дальностью до Земли

js-site-missions-run-failed = Записанный прогон не удалось загрузить здесь; откройте его в { $studio } по ссылке ниже.

js-site-missions-seed = seed { $seed }

js-site-missions-spoof-aria = Смещение спуфинга во времени, с границей обнаружения и временем обнаружения каждого монитора

js-site-missions-spoof-axis-x = время с начала спуфинга (s)

js-site-missions-spoof-axis-y = смещение времени (ns)

js-site-missions-spoof-detects = { $id } обнаруживает на { $s } s

js-site-missions-spoof-lg-bound = граница { $id }

js-site-missions-spoof-lg-offset = смещение спуфинга

js-site-missions-spoof-readout = t { $t } s · смещение { $offset } ns

js-site-missions-spoof-spec = требование { $v } ns

js-site-missions-sr-aria = { $members }; общий источник помех { $power } dBW

js-site-missions-sr-aria-member = { $label }: слежение сохранено { $held } %, среднее отношение помехи к сигналу { $js } dB, наименьшее число отслеживаемых спутников { $min }

js-site-missions-sr-car = Автомобиль

js-site-missions-sr-fewest = наименьшее число отслеживаемых

js-site-missions-sr-held = слежение сохранено

js-site-missions-sr-mean-js = средний J/S

js-site-missions-sr-ship = Судно

js-site-missions-swipe =
    { $n ->
        [one] Проведите, чтобы увидеть все { $n } файл сценария
        [few] Проведите, чтобы увидеть все { $n } файла сценария
        [many] Проведите, чтобы увидеть все { $n } файлов сценария
       *[other] Проведите, чтобы увидеть все { $n } файла сценария
    }

js-site-missions-toml-download-title = Скачать файл сценария, который выполнялся

js-site-missions-toml-title = Файл сценария, который выполнялся

js-site-missions-vis-title = Спутники в зоне видимости, среднее за прогон

js-site-missions-vis-uniform = { $v } в каждой ячейке

js-site-palette-none = Нет результатов

js-site-palette-results = Результатов: { $count }

js-site-pro-band-at = На { $minutes } минуте: с 5-го по 95-й процентиль

js-site-pro-band-range = от { $lo } до { $hi } { $unit }

js-site-pro-band-runs-within = из { $n } прогонов в пределах ±{ $limit } { $unit }

js-site-pro-design-readout = спутников: { $sat }, доступность { $av } % · плоскостей: { $planes } на { $alt } km, { $incl }°

js-site-pro-front-design = Проект на фронте { $id }

js-site-pro-front-design-knee = Проект на фронте { $id } · излом

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } ещё проект на фронте в этой точке)
        [few] (+{ $n } ещё проекта на фронте в этой точке)
        [many] (+{ $n } ещё проектов на фронте в этой точке)
       *[other] (+{ $n } ещё проекта на фронте в этой точке)
    }

js-site-pro-not-rerun = не перезапускалось

js-site-pro-rerun-free = перезапуск в бесплатном движке:

js-site-pro-same-sha = тот же SHA-256 { $sha }…

js-site-pro-same-sha-index = тот же SHA-256 результата, что и в указателе

js-site-toast-copied = Скопировано: { $text }

js-site-toast-data-failed = Не удалось загрузить файл данных

js-site-toast-data-saved = Данные сохранены как CSV

js-site-toast-no-data = Для этого графика нет данных

js-site-toast-svg-saved = График сохранён как SVG

js-site-toast-table-saved = Таблица сохранена как CSV

js-site-waterfall-axis-now = сейчас

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = сигналы лежат ниже уровня шума

js-site-waterfall-campaign-drives = Кампания, которой он управляет:

js-site-waterfall-campaign-seed = seed { $seed } · фаз: { $phases } за { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } мегагерц: показать этот диапазон

js-site-waterfall-chip-title = { $band } · { $fc } MHz · полоса приёмника { $bw } MHz

js-site-waterfall-engine-build = Движок v{ $version } · сборка

js-site-waterfall-fallback-head = Резерв на Galileo · { $s } s, только тон CW

js-site-waterfall-fallback-text = { $band } снова на { $v } dB-Hz. Мониторинг целостности только по Galileo: уровень защиты { $min }–{ $max } m, ниже предела оповещения { $limit } m.

js-site-waterfall-floor = порог слежения { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, ЛЧМ включён

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, ниже порога. Часы идут свободно: наихудшее { $worst } ns при защитном интервале { $guard } ns.

js-site-waterfall-jammer-off = { $what }: выключен

js-site-waterfall-jammer-on = { $what }: включён

js-site-waterfall-live = { $freq } мегагерц, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = нет смоделированного диапазона

js-site-waterfall-load-failed = Записанный прогон не удалось загрузить. Отчёт движка ниже показывает тот же прогон.

js-site-waterfall-no-jammer-band = В этом диапазоне нет источника помех

js-site-waterfall-no-jammer-in-band = в диапазоне нет источника помех

js-site-waterfall-no-seed = детерминированно, без seed

js-site-waterfall-onset-head = Начало · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Отслеживаются все диапазоны ({ $n }), пока прогон спектра впервые не теряет { $band } на { $s } s.

js-site-waterfall-pause = Приостановить водопад

js-site-waterfall-play = Воспроизвести водопад

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = прогон T+{ $s } s

js-site-waterfall-scale-caption = PSD выше порога { $floor } dBW/Hz · ячейки { $bin } MHz × { $step } s

js-site-waterfall-seed = seed { $seed }

js-site-waterfall-short-lost = потеря

js-site-waterfall-short-ok = слеж.

js-site-waterfall-short-rec = восст.

js-site-waterfall-state-lost = Захват потерян

js-site-waterfall-state-lost-low = захват потерян

js-site-waterfall-state-ok = Слежение

js-site-waterfall-state-ok-low = слежение

js-site-waterfall-state-rec = Восстановлено

js-site-waterfall-state-rec-low = восстановлено

js-site-waterfall-summary-recovers = { $band } теряет захват на { $lost } s и восстанавливается на { $rec } s, минимум { $min } dB-Hz.

js-site-waterfall-summary-rows = строк: { $n } по { $step } s.

js-site-waterfall-summary-stays-lost = { $band } теряет захват на { $lost } s и остаётся потерянным, минимум { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } отслеживается на всём протяжении, минимум { $min } dB-Hz.

js-site-waterfall-tip-above-floor = выше уровня шума

js-site-waterfall-tip-at-floor = На уровне теплового шума

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Полоса приёмника ни одного смоделированного диапазона не покрывает этот столбец

js-site-waterfall-wave-chirp = ЛЧМ-сигнал

js-site-waterfall-wave-cw = тон CW

js-site-waterfall-wave-noise = шум

js-site-waterfall-who-cursor = Диапазон под курсором

js-site-waterfall-who-selected = Выбранный диапазон

js-site-waterfall-who-worst = Наихудший диапазон
