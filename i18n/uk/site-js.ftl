# site-js.ftl (uk): translations

js-app-engine-failed = Не вдалося завантажити рушій ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } рядок реєстру
        [few] { $n } рядки реєстру
        [many] { $n } рядків реєстру
       *[other] { $n } рядка реєстру
    }

js-site-action-copy-install = Копіювати: cargo install kshana

js-site-action-launch = Запустити { $name }

js-site-action-licence = Зв'яжіться з нами щодо комерційної ліцензії

js-site-action-pro-eval = Запросити оцінювання Kshana Pro

js-site-action-study = Замовити дослідження

js-site-action-theme = Перемкнути світлу або темну тему

js-site-capabilities-bd-after = { $m } m через { $s } s

js-site-capabilities-bd-combined = сукупно

js-site-capabilities-bd-crossing = { $m } m на { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» через { $s } s, домінує { $dom }

js-site-capabilities-bd-fig-lead = Час від втрати GNSS на логарифмічній осі, IMU класу { $grade } за швидкості { $speed } m/s:

js-site-capabilities-bd-fig-tail = Лінії — це закони зростання рушія для короткого вибігу та їхній корінь із суми квадратів; перетини походять з його повної дев'ятистанової моделі похибки (Шулера), яка обмежує члени зміщення, тож на довгих вибігах кожен перетин настає трохи пізніше, ніж до нього доходить лінія. Стовпчики: ті самі перетини для чотирьох класів IMU.

js-site-capabilities-cd-canvas-aria = Орбітальне угруповання навколо свого тіла, справжні знімки: перетягуйте або натискайте стрілки, щоб обертати, плюс і мінус, щоб масштабувати

js-site-capabilities-cd-design-meta = супутників: { $n } · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Кожен супутник іде власною трасою рушія; радіус замороженої орбіти випливає з елементів оболонки.

js-site-capabilities-cd-foot-mean-motion = Кожен супутник іде власною трасою рушія, на радіусі, який випливає з його середнього руху.

js-site-capabilities-cd-foot-walker = Усі супутники ({ $n }) розміщено за власними параметрами Волкера оболонок (перевірено за { $shown } трасами рушія: найгірше { $deg }°); хвости — це { $shown } трас рушія.

js-site-capabilities-cd-hud-body = { $body } · супутників «{ $n }»

js-site-capabilities-cd-hud-mission = Місія «{ $time }»

js-site-capabilities-cd-legend-shell = оболонка { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Частка прогону з PDOP ≤ { $limit } (від 0 до 100 %)

js-site-capabilities-cd-map-pdop = Середній PDOP на комірку { $step }° (від { $lo } до { $hi }; світліше означає краще)

js-site-capabilities-cd-map-visible = Середня кількість супутників у полі зору (від { $lo } до { $hi })

js-site-capabilities-cd-metric-availability = Доступність

js-site-capabilities-cd-metric-pdop = Середній PDOP

js-site-capabilities-cd-metric-visible = У полі зору

js-site-capabilities-cd-pause = Призупинити орбіти

js-site-capabilities-cd-play = Відтворити орбіти

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: супутників { $n }, таблиця слотів оператора

js-site-capabilities-cd-span = з { $dur }, по колу

js-site-capabilities-cd-stat-in-view = У середньому в полі зору

js-site-capabilities-cd-stat-mask = Маска · прогін

js-site-capabilities-cd-stat-median = Медіанний PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, весь { $body }

js-site-capabilities-cd-stat-satellites = Супутники

js-site-capabilities-cd-stat-worst = Найгірший пункт

js-site-capabilities-cd-title-gnss = Чотири GNSS разом

js-site-capabilities-cd-title-leo = Мегаугруповання на низькій навколоземній орбіті

js-site-capabilities-cd-title-lunar = Набір місячних ретрансляторів

js-site-capabilities-cd-work-ratio = { $pct } % після попереднього фільтра за широтою · розв'язків DOP: { $dop }

js-site-capabilities-cd-work-tests = перевірок «супутник — точка»: { $after } із { $brute }, які виконало б повне сканування

js-site-capabilities-cd-work-title = Обсяг роботи з видимості

js-site-capabilities-cg-cn0-sub = C/N0 відносно порога супроводження

js-site-capabilities-cg-cn0-title = Густина несівної до шуму

js-site-capabilities-cg-compose-availability = Доступність

js-site-capabilities-cg-compose-fewest = Найменше супроводжуваних

js-site-capabilities-cg-compose-js = Середнє J/S

js-site-capabilities-cg-compose-text = Один глушник, { $power } { $unit }, в одному місці, прив'язаний до прогонів-складників виду ‹{ $kind }›: { $n }. Судно в протоці та автомобіль на прибережній дорозі бачать ту саму причину, а отримують різні відповіді.

js-site-capabilities-cg-log-campaign = кампанія { $file } · фаз: { $phases } · прогонів-складників: { $runs }

js-site-capabilities-cg-log-phase = починається фаза { $name }

js-site-capabilities-cg-log-phase-carries = починається фаза { $name } · переносить { $carried }

js-site-capabilities-cg-monte-axis = кінцева похибка годинника для зерен ({ $n }), ({ $path })

js-site-capabilities-cg-monte-ci = Середнє, інтервал 95 %

js-site-capabilities-cg-monte-mean = Середнє

js-site-capabilities-cg-monte-p05 = 5-й

js-site-capabilities-cg-monte-p05-p95 = від 5-го до 95-го

js-site-capabilities-cg-monte-p50 = медіана

js-site-capabilities-cg-monte-p95 = 95-й

js-site-capabilities-cg-monte-std = Стандартне відхилення

js-site-capabilities-cg-monte-text = Той самий сценарій виду ‹{ $kind }›, запущений { $n } разів від базового зерна { $seed }, по одному зерну на прогін: розкид кінцевої похибки вільно йдучого годинника з його 95-відсотковим довірчим інтервалом для середнього.

js-site-capabilities-cg-not-in-phase = не в цій фазі

js-site-capabilities-cg-now = Фаза { $n } із { $total }: { $name } · від { $from } до { $to }

js-site-capabilities-cg-phase-title = { $name }: від { $from } до { $to } · завершена чинником { $by } · види-складники { $kinds }

js-site-capabilities-cg-pl-sub = відносно межі тривоги

js-site-capabilities-cg-pl-title = Рівень захисту

js-site-capabilities-cg-pos-sub = відносно бюджету · лог.

js-site-capabilities-cg-pos-title = Похибка інерційного положення

js-site-capabilities-cg-range = від { $lo } до { $hi }

js-site-capabilities-cg-sweep-all-lost = Усе втрачено від

js-site-capabilities-cg-sweep-axis = потужність передавання глушника ({ $key })

js-site-capabilities-cg-sweep-first-loss = Перша втрата

js-site-capabilities-cg-sweep-lg-availability = доступність

js-site-capabilities-cg-sweep-lg-js = середнє J/S

js-site-capabilities-cg-sweep-never = ніколи

js-site-capabilities-cg-sweep-nodes = Вузли

js-site-capabilities-cg-sweep-none = немає

js-site-capabilities-cg-sweep-span = діапазон J/S

js-site-capabilities-cg-sweep-text = Один сценарій виду ‹{ $kind }›, запущений по разу на вузол, поки потужність передавання глушника зростає кроками від { $from } до { $to } { $unit }. Доступність під час глушіння (суцільна лінія) і середнє J/S (штрихова) походять з показників якості кожного прогону-складника.

js-site-capabilities-cg-te-sub = відносно його захисного інтервалу

js-site-capabilities-cg-te-title = Похибка часу годинника

js-site-capabilities-copy = Копіювати

js-site-capabilities-copy-aria = Скопіювати команду, що відтворює прогін: kshana { $file }

js-site-capabilities-cz-best = Найкращий PDOP

js-site-capabilities-cz-failed = Записаний прогін не вдалося завантажити тут; натомість відкрийте його в Studio.

js-site-capabilities-cz-fix = Відліки з розв'язком положення

js-site-capabilities-cz-fix-value = { $n } із { $total } ({ $pct }%)

js-site-capabilities-cz-median = Медіанний PDOP

js-site-capabilities-engine = Рушій v{ $version }

js-site-capabilities-engine-build = Рушій v{ $version }, збірка

js-site-capabilities-engine-report = Звіт рушія

js-site-capabilities-globe-aria = { $name } на справжніх знімках ({ $credit }). Перетягуйте або натискайте стрілки, щоб обертати; плюс і мінус масштабують.

js-site-capabilities-ho-ends = прогін завершується о { $t }

js-site-capabilities-ho-past-guard = за межею захисного інтервалу

js-site-capabilities-no-seed = детермінований, без зерна

js-site-capabilities-open-in-studio = Відкрити в { $studio }

js-site-capabilities-open-report = Відкрити звіт рушія

js-site-capabilities-orrery-aria = Сонячна система на епоху прогону: перетягуйте або натискайте стрілки, щоб обертати, плюс і мінус, щоб масштабувати

js-site-capabilities-orrery-bodies = тіл: { $n } · спостерігач «{ $observer }»

js-site-capabilities-orrery-epoch = Епоха «{ $epoch }» · TDB (барицентричний динамічний час), юліанська дата { $jd }

js-site-capabilities-pnt-chart-title = ретранслятори в полі зору (лінія) · Земля над горизонтом (заливка) · для розв'язку потрібні чотири

js-site-capabilities-pnt-kicker = Позиціонування біля цього тіла · вид body-pnt

js-site-capabilities-pnt-lander = Посадковий апарат на { $lat }°, { $lon }° на поверхні навігує за ретрансляторами, з двостороннім вимірюванням дальності від Землі, щоразу коли Земля над горизонтом (час проходження світла в один бік { $min } min). Доступність: { $a } % лише за ретрансляторами, { $b } % із каналом до Землі.

js-site-capabilities-pnt-orbiter = Користувач на орбіті навігує за ретрансляторами, з двостороннім вимірюванням дальності від Землі, щоразу коли Земля над горизонтом (час проходження світла в один бік { $min } min). Доступність: { $a } % лише за ретрансляторами, { $b } % із каналом до Землі.

js-site-capabilities-pnt-relays = ретрансляторів: { $n } на висоті { $alt } km навколо { $body }

js-site-capabilities-report-data = Звіт і дані

js-site-capabilities-result-data = Дані результату

js-site-capabilities-saved = Збережено { $name }

js-site-capabilities-scenario-file = Файл сценарію

js-site-capabilities-seed = зерно { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» тримається в межах захисного інтервалу { $dur }

js-site-capabilities-six-clock-guard = захисний інтервал { $v } ns

js-site-capabilities-six-coast-budget = бюджет { $m } m

js-site-capabilities-six-coast-denied = GNSS недоступна

js-site-capabilities-six-coast-fig = «{ $id }» у межах бюджету { $s } s

js-site-capabilities-six-floor = поріг супроводження

js-site-capabilities-six-integ-fig = «{ $ok }» із { $n } епох доступні · межі тривоги { $h } m по горизонталі, { $v } m по вертикалі

js-site-capabilities-six-integ-limit = вертикальна межа тривоги

js-site-capabilities-six-integ-pl = вертикальний (суцільна лінія) та горизонтальний (штрихова) рівень захисту

js-site-capabilities-six-jam-effective = ефективні, супутників: { $n }

js-site-capabilities-six-jam-fig = Супроводжується «{ $min }» із { $max } у полі зору · доступність під час глушіння «{ $av }» (номінальна { $nom }) · середнє J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = номінальна, без глушника (штрихова)

js-site-capabilities-six-orbit-fig = Висота «{ $lo }–{ $hi } km» · наземна траса за { $dur }

js-site-capabilities-six-orbit-label = { $source } · відліків: { $n }

js-site-capabilities-six-orbit-sgp4 = SGP4 за дворядковим набором елементів

js-site-capabilities-six-spoof-detects = { $id } виявляє

js-site-capabilities-six-spoof-fig = «{ $id }» виявляє на { $s } s (межа { $ns } ns)

js-site-capabilities-ss-angle = Кут від Сонця

js-site-capabilities-ss-credit = Знімки: { $credits }. * Карта не сягає полюсів; прогалина набуває полярного середнього кольору карти. Кільця Сатурна: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } діб

js-site-capabilities-ss-frame-origin = Початок системи відліку

js-site-capabilities-ss-from-sun = Від Сонця

js-site-capabilities-ss-gloss = NAIF: код тіла в Navigation and Ancillary Information Facility NASA. GM: гравітаційний параметр. J2: член сплюснутості. Полюс IAU: полюс обертання за Міжнародним астрономічним союзом, як пряме сходження (RA) і схилення (Dec).

js-site-capabilities-ss-j2-none = не опубліковано

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } тіла { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Час проходження світла від { $observer }

js-site-capabilities-ss-link = від { $from } до { $to }, час проходження світла в один бік { $one }, туди й назад { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Канал, який обчислює цей прогін:
        [few] Канали, які обчислює цей прогін:
        [many] Канали, які обчислює цей прогін:
       *[other] Канали, які обчислює цей прогін:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Його місяць, у масштабі, на епоху
        [few] Його місяці, у масштабі, на епоху
        [many] Його місяці, у масштабі, на епоху
       *[other] Його місяці, у масштабі, на епоху
    }

js-site-capabilities-ss-nominal-error = номінальна похибка { $km } km за відстанню

js-site-capabilities-ss-north = Вигляд з півночі екліптики.

js-site-capabilities-ss-period = Орбітальний період

js-site-capabilities-ss-period-about = Період навколо { $parent }

js-site-capabilities-ss-pole = Полюс IAU (RA, Dec)

js-site-capabilities-ss-radius = Середній радіус

js-site-capabilities-ss-retrograde = { $v } h, зворотний рух

js-site-capabilities-ss-rotation = Зоряне обертання

js-site-capabilities-ss-years = { $v } років

js-site-capabilities-st-bound = межа { $v } m

js-site-capabilities-st-fig-none = епох: { $n }, у жодній похибка не перевищує межі. Впоперек: справжня похибка положення; угору: рівень захисту; обидві осі логарифмічні.

js-site-capabilities-st-fig-some = епох: { $n }, у { $k } похибка перевищує межу. Впоперек: справжня похибка положення; угору: рівень захисту; обидві осі логарифмічні.

js-site-capabilities-st-limit = межа тривоги { $m } m

js-site-capabilities-st-misleading = оманливо: похибка вища за межу

js-site-capabilities-st-normal = нормальна робота

js-site-capabilities-st-unavailable = недоступно: межа вища за межу тривоги

js-site-capabilities-studio-embedded = { $studio }, вбудовано: прогін orbit-multignss

js-site-capabilities-studio-load = Завантажити { $studio } тут

js-site-capabilities-studio-outline = Показати структуру знову

js-site-capabilities-wave-chirp = чирп

js-site-capabilities-wave-cw = тон CW

js-site-capabilities-wave-noise = шум

js-site-capabilities-wf-an-caption = рядок T+{ $t } s · dB над порогом, логарифмічна шкала · пік усієї сітки { $peak } dB

js-site-capabilities-wf-degraded = Погіршено

js-site-capabilities-wf-degraded-low = погіршено

js-site-capabilities-wf-failed = Записаний прогін не вдалося завантажити тут.

js-site-capabilities-wf-grid = сітка

js-site-capabilities-wf-iq = На T+{ $t } s рушій також малює модель як { $n } відліків IQ (синфазних і квадратурних) навколо { $mhz } MHz і перевіряє за нею оцінку Велча (сегментів: { $segments } по { $nfft }): інтегральне відношення потужностей { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } вимкнено

js-site-capabilities-wf-jammer-on = { $what } увімкнено

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · від { $on } s до кінця

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Втрата захоплення

js-site-capabilities-wf-lost-low = втрата захоплення

js-site-capabilities-wf-max = { $peak } dB над ним · логарифмічна шкала від { $v0 } dB

js-site-capabilities-wf-no-jammer = без глушника

js-site-capabilities-wf-now = зараз

js-site-capabilities-wf-pause = Призупинити водоспад

js-site-capabilities-wf-peak = пік { $v } dB

js-site-capabilities-wf-play = Відтворити водоспад

js-site-capabilities-wf-replay-previous = початок відтворення · попередній прохід нижче

js-site-capabilities-wf-replay-start = початок відтворення

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = сигнал +{ $v } dB

js-site-capabilities-wf-summary = Записаний прогін { $file }: діапазонів { $bands }, глушників { $jammers } за { $seconds } s. Найгірший діапазон, { $worst }, падає до { $min } dB-Hz на { $at } s; поріг супроводження { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB над рівнем шуму

js-site-capabilities-wf-tip-in = у { $bands }

js-site-capabilities-wf-tracking = Супроводження

js-site-capabilities-wf-tracking-low = супроводження

js-site-caphero-aria = Сонячна система з прогону рушія для Сонячної системи на { $date }: Сонце і тіл: { $bodies }, що рухаються своїми орбітальними трасами рушія; орбіт, валідованих за JPL Horizons: { $valid }.

js-site-caphero-clock = +{ $days } діб · { $date }

js-site-caphero-copy-command = Копіювати команду

js-site-caphero-copy-title = Скопіювати команду, що це відтворює

js-site-caphero-credits = Відстані стиснуто логарифмічною шкалою, напрями справжні; тіла збільшено, обертання з показною швидкістю. Знімки: { $credits }; кільця Сатурна: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Масштаб і джерела знімків

js-site-caphero-engine-build = Рушій v{ $version }, збірка

js-site-caphero-explore = Дослідити кожне тіло

js-site-caphero-file-title = Файл сценарію, який виконувався

js-site-caphero-list-item = { $name }: { $label }, { $au } au від Сонця на епоху, орбітальний період { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au від Сонця на епоху, орбітальний період { $period }, час проходження світла від { $observer } { $light }.

js-site-caphero-no-seed = детермінований, без зерна

js-site-caphero-open-in-studio = Відкрити в { $studio }

js-site-caphero-pause = Призупинити орбіти

js-site-caphero-period-days = { $value } діб

js-site-caphero-period-years = { $value } років

js-site-caphero-play = Відтворити орбіти

js-site-caphero-rate = діб прогону за секунду: { $days }

js-site-caphero-rate-epoch = Кадр на епоху прогону

js-site-caphero-read-distance = { $au } au від Сонця

js-site-caphero-read-light = час проходження світла від { $observer } на епоху { $light }

js-site-caphero-read-orbit = орбіта { $period }

js-site-caphero-seed = зерно { $seed }

js-site-copy-aria = Копіювати: { $cmd }

js-site-developers-captured-from = записано { $recorded } з

js-site-developers-engine-build = Рушій v{ $version }, збірка

js-site-developers-exit-stamp = вихід { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: відкрити в { $studio }

js-site-developers-no-seed = (детермінований, без зерна)

js-site-developers-open-in-studio = Відкрити в { $studio }

js-site-developers-pause = Призупинити відтворення

js-site-developers-play = Відтворити

js-site-developers-replaying = # відтворення записаного сеансу

js-site-developers-seed = (зерно { $seed })

js-site-developers-what-runs-write = Що записує кожен прогін

js-site-editions-builds-on-it = { $label } будується на ньому

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } вид
        [few] { $n } види
        [many] { $n } видів
       *[other] { $n } виду
    }

js-site-editions-core-title = Відкрите ядро

js-site-editions-core-validated = валідовано

js-site-editions-core-validated-of = { $validated } із { $total }

js-site-editions-free-core = Безкоштовно у відкритому ядрі, як і кожен вид

js-site-editions-group-other = Інше

js-site-editions-kind-no-ledger = жоден модуль реєстру не збігається з ним за назвою

js-site-editions-kind-validated = рядків реєстру валідовано: { $v } із { $tot }

js-site-editions-pause = Призупинити кільця

js-site-editions-play = Відтворити кільця

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Індивідуальне дослідження

js-site-evidence-allan-aria = Чотири девіації набору даних NIST SP 1065 з 1000 точок проти часу усереднення; відтворено всі { $n } опублікованих значень, найгірша відносна похибка { $err }

js-site-evidence-allan-lg-published = опубліковане значення, SP 1065, таблиця 31

js-site-evidence-allan-mdev = модифікована девіація Аллана

js-site-evidence-allan-na = н/д

js-site-evidence-allan-oadev = девіація Аллана з перекриттям

js-site-evidence-allan-ohdev = девіація Адамара з перекриттям

js-site-evidence-allan-read = { $tau } s · Аллан { $oadev } · модифікована { $mdev } · Адамар { $ohdev }

js-site-evidence-allan-st-gate = брама тесту

js-site-evidence-allan-st-reproduced = опубліковані значення відтворено

js-site-evidence-allan-st-worst = найгірша відносна похибка

js-site-evidence-allan-tdev = девіація часу, у секундах

js-site-evidence-allan-tip-at = «{ $name }» на { $m } s

js-site-evidence-allan-tip-engine = рушій: «{ $got }» · відносна похибка { $err }

js-site-evidence-allan-tip-table = SP 1065, таблиця 31: «{ $want }»

js-site-evidence-cell-tip = Можливість { $i } із { $n } · «{ $label }»

js-site-evidence-cowell-aria = Різниця положень відносно Orekit за 24 години: рівні сил від 1 до 5 лишаються нижче { $worst }; рівень опору досягає { $drag }, смуга характеристики

js-site-capabilities-cd-no-webgl = Вигляд 3-D потребує WebGL; карта покриття та значення походять з того самого прогону.

js-site-evidence-cowell-gto = геостаціонарна трансферна орбіта

js-site-evidence-cowell-leo = низька навколоземна орбіта

js-site-evidence-cowell-lg-con = рівні від 1 до 5, задача двох тіл до тиску сонячного випромінювання, по дві орбіти

js-site-evidence-cowell-lg-drag = рівень 6, опір: лише характеристика (різні моделі густини)

js-site-evidence-cowell-read = { $h } h · рівні від 1 до 5 найгірший { $con } · опір { $drag }

js-site-evidence-cowell-st-drag = рівень опору, найгірший

js-site-evidence-cowell-st-epochs = епохи на рівнях від 1 до 5

js-site-evidence-cowell-tip-tier = «Рівень { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = найгірша різниця «{ $err }» на { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Зовнішнього оракула не названо.

js-site-evidence-hero-oracle = Оракул

js-site-evidence-hero-oracle-is = Оракул: { $o }

js-site-evidence-hero-owner = Власник

js-site-evidence-hero-partner = Це належить партнеру; рушій не заявляє жодних прав на це.

js-site-evidence-hero-pause = Призупинити розгортку

js-site-evidence-hero-play = Відтворити розгортку

js-site-evidence-hero-row = Рядок { $i } із { $n }

js-site-evidence-hold-accepted = прийнято: у межах коефіцієнта { $bar }

js-site-evidence-hold-aria = Виміряна середньоквадратична похибка часу цезієвого годинника проти часу вибігу, з прогнозом рушія; прогнозоване до виміряного перетинає межу від { $lo } до { $hi }

js-site-evidence-hold-control = «Контроль:» наївний прогноз (односекундна стабільність, прочитана як білий частотний шум) дає відношення { $ratio }, хибне приблизно в { $factor } раза, і не проходить той самий поріг. Поріг має зуби.

js-site-evidence-hold-lg-meas = виміряно на відкладеному записі (точка: перетин)

js-site-evidence-hold-lg-pred = передбачено за першою третиною (кільце: перетин)

js-site-evidence-hold-nodata = Виміряний запис був недоступний, коли генерувалася ця сторінка.

js-site-evidence-hold-perfect = 1 = ідеально

js-site-evidence-hold-ratio-aria = Прогнозоване до виміряного для порогів: { $n }, усі в межах прийнятого коефіцієнта { $bar }

js-site-evidence-hold-read = вибіг { $h } h · виміряно { $m } ns · передбачено { $p } ns

js-site-evidence-hold-st-fit = використано для підгонки

js-site-evidence-hold-st-samples = односекундні відліки

js-site-evidence-hold-st-syncs = відкладені точки синхронізації

js-site-evidence-hold-tip-breach = передбачений перетин { $p } s · виміряний { $m } s

js-site-evidence-hold-tip-error = «Похибка часу { $thr } ns»

js-site-evidence-hold-tip-ratio = прогнозоване до виміряного «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · прогнозоване до виміряного «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = розподіл хі-квадрат

js-site-evidence-kernel-chi2-quantile = квантиль хі-квадрат

js-site-evidence-kernel-noncentral = нецентральний хі-квадрат

js-site-evidence-kernel-normal-cdf = нормальний розподіл

js-site-evidence-kernel-normal-quantile = квантиль нормального розподілу

js-site-evidence-kernel-pbias = зміщення виявлення

js-site-evidence-ladder-aria = Залишки орбіти від { $lo } до { $hi } m на одній логарифмічній шкалі, з порогом агентства { $bar } m

js-site-evidence-ladder-bar = поріг агентства { $bar } m

js-site-evidence-ladder-cowell = Cowell проти Orekit 12.2, найгірший

js-site-evidence-ladder-g24 = Galileo E11, 24-годинна підгонка

js-site-evidence-ladder-g8 = Galileo E11, 8-годинна підгонка

js-site-evidence-ladder-lg-headline = основний залишок

js-site-evidence-ladder-lg-over = понад порогом агентства { $bar } m

js-site-evidence-ladder-lg-ring = лише модель сил, до емпіричних прискорень

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, 4-годинна підгонка

js-site-evidence-ladder-read = розгортка на { $v } · основних залишків на цьому рівні або нижче: { $n } із { $total }

js-site-evidence-ladder-rt-arc = дуга { $arc } · степінь і порядок { $do } · спостережень: { $n }

js-site-evidence-ladder-rt-rtn = радіально { $r } m · уздовж траєкторії { $a } m · поперек траєкторії { $c } m

js-site-evidence-ladder-sgp4 = SGP4 проти векторів AIAA, найгірший

js-site-evidence-ladder-swarm = Swarm-A, 3-годинна підгонка

js-site-evidence-ladder-tip-cowell = «Cowell · найгірша з епох: { $n }» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · повна доба» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · лише модель сил» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · з емпіричними прискореннями» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Місячний орбітальний апарат · динамічний» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Місячний орбітальний апарат · зредукований динамічний» · { $rms } m, понад порогом { $bar } m і подано як є

js-site-evidence-ladder-tip-sgp4 = «SGP4 · найгірший із векторів: { $n }» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · динамічний» · { $rms } m, майже повністю уздовж траєкторії (опір)

js-site-evidence-ladder-tip-swr = «Swarm-A · зредукований динамічний» · { $rms } m

js-site-evidence-raim-aria = Випадків SciPy у смузі допуску: { $pass } із { $n }, у ядрах: { $kernels }

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = найбільша частка смуги, яку використовує будь-який випадок

js-site-evidence-raim-read = випадок { $q } із { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % смуги

js-site-evidence-raim-scale-aria = Кольорова шкала: частка використаної смуги допуску, логарифмічна від 10 у мінус 11-му степені до краю смуги

js-site-evidence-raim-st-inside = у смузі

js-site-evidence-raim-st-most = використано найбільшу частку смуги

js-site-evidence-raim-tick-edge = край смуги

js-site-evidence-raim-tick-exact = точно

js-site-evidence-raim-tip-case = «{ $kernel }» · випадок { $j } із { $n }

js-site-evidence-raim-tip-exact = «точний збіг» зі SciPy

js-site-evidence-raim-tip-uses = використовує «{ $pct } %» своєї смуги допуску

js-site-evidence-sgp4-aria = Відтворено { $n } із { $n } векторів AIAA; найгірший { $worst }, медіана { $median }, усі в межах допуску { $tol }

js-site-evidence-sgp4-deep = далекий космос (SDP4)

js-site-evidence-sgp4-lg-deep = вектор далекого космосу (SDP4)

js-site-evidence-sgp4-lg-median = медіана й найгірший на шкалі

js-site-evidence-sgp4-lg-near = вектор біля Землі (SGP4)

js-site-evidence-sgp4-near = біля Землі (SGP4)

js-site-evidence-sgp4-read = вектор { $i } із { $n } · супутник { $sat } · похибка { $err }

js-site-evidence-sgp4-read-deep = вектор { $i } із { $n } · супутник { $sat }, далекий космос · похибка { $err }

js-site-evidence-sgp4-scale-aria = Кольорова шкала від 0,1 мікрометра до допуску, логарифмічна

js-site-evidence-sgp4-st-deep = вектори далекого космосу

js-site-evidence-sgp4-st-sats = тестові супутники

js-site-evidence-sgp4-tip-sat = «Супутник { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = вектор { $j } із { $n } · похибка положення «{ $err }»

js-site-evidence-st-median = медіана

js-site-evidence-st-worst = найгірший

js-site-evidence-tolerance = допуск { $v }

js-site-filter-in-all = { $total } у всіх

js-site-filter-matches =
    { $n ->
        [one] { $n } збіг
        [few] { $n } збіги
        [many] { $n } збігів
       *[other] { $n } збігу
    }

js-site-filter-n-of-m = { $n } із { $total }

js-site-filter-n-of-m-rows = { $n } із { $total } рядків

js-site-filter-rows = рядків: { $total }

js-site-home-banner-gnss-lost = Втрата GNSS · holdover

js-site-home-banner-holdover-out = Holdover · годинник поза захисним інтервалом

js-site-home-banner-integrity-holdover = Тривога цілісності · holdover триває

js-site-home-banner-integrity-none = Тривога цілісності · немає рівня захисту

js-site-home-banner-integrity-pl = Тривога цілісності · PL > AL

js-site-home-banner-jamming = Глушіння · C/N0 біля порога

js-site-home-banner-spoofing = Тривога спуфінгу · RF-детектор

js-site-home-cap-holdover = Глушник досягає { $dbw } dBW: супроводжується супутників: { $trk }. Годинник іде вільно від { $carry } ns, залишених спуфером, і перетинає свій захисний інтервал { $guard } ns на { $at }; INS іде за інерцією.

js-site-home-cap-integrity = Супутники повертаються, але лише вище маски { $mask }°: супроводжується { $trk }. Рівень захисту перевищує межу тривоги { $al } m або його не можна сформувати, тож монітор подає тривогу, а годинник лишається в holdover.

js-site-home-cap-jamming = Широкосмуговий глушник на відстані { $km } km за { $dbw } dBW. C/N0 падає до { $cn } dB-Hz, на { $above } dB вище за поріг супроводження { $floor } dB-Hz; усі супутники ({ $trk }) усе ще супроводжуються.

js-site-home-cap-nominal = Супроводжується супутників: { $trk }, за середнього C/N0 { $cn } dB-Hz. Годинник дисципліновано за часом GNSS, а рівень захисту ({ $pl } m) лежить під межею тривоги { $al } m.

js-site-home-cap-recovery = GNSS синхронізовано знову: супроводжується супутників: { $trk }, похибка часу повернулася до { $te } ns, рівень захисту { $pl } m.

js-site-home-cap-spoofing = Спуфер зсуває годинник приймача зі швидкістю { $rate } ns/s. RF-детектор (радіочастотний) подає тривогу одразу; монітор за допомогою годинника спрацьовує через { $det } s, завершуючи фазу з { $off } ns, стягнутими назад.

js-site-home-cn-no-lock = 0 із { $max } супроводжується · немає захоплення

js-site-home-cn-tracking = { $n } із { $max } супроводжується

js-site-home-no-pl = немає PL

js-site-home-pause = Призупинити місію

js-site-home-pl-alarm = тривога · PL вище AL

js-site-home-pl-no-sats = немає супутників, немає PL

js-site-home-pl-not-computed = не обчислено в цій фазі

js-site-home-pl-too-few = замало супутників

js-site-home-pl-under-al = під AL { $thr } m

js-site-home-play = Відтворити місію

js-site-home-receiver-tracking = Приймач · супроводжується { $n }

js-site-home-replay-restarted = Відтворення перезапущено · { $file }

js-site-home-te-disciplined = дисципліновано за GNSS

js-site-home-te-free-running = holdover · вільний хід

js-site-home-te-outside-guard = holdover · поза захисним інтервалом

js-site-home-te-spoofer = спуфер тягне годинник

js-site-home-thr-floor = поріг

js-site-home-thr-guard = захисний інтервал

js-site-kind-action = Дія

js-site-mcp-arguments-excerpt = аргументи (уривок)

js-site-mcp-axis-mission-time = час місії

js-site-mcp-clock-holdover = holdover годинника { $clock }

js-site-mcp-dir-reply = kshana-mcp → асистент

js-site-mcp-dir-request = асистент → kshana-mcp

js-site-mcp-figcaption = Намальовано з повернутого ряду: похибка часу кожного годинника проти порога

js-site-mcp-fom-availability = доступність

js-site-mcp-fom-caption = Показники якості, повернуті run_scenario, для кожного годинника

js-site-mcp-fom-header = Показник якості

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = похибка часу, 95-й процентиль (ns)

js-site-mcp-fom-rms = похибка часу, середньоквадратична (ns)

js-site-mcp-lede = Записано { $recorded } · v{ $version } · стандартний ввід і вивід · протокол { $protocol } · лише точні повідомлення

js-site-mcp-legend-gnss-lost = GNSS втрачено на { $s } s

js-site-mcp-legend-threshold = поріг { $v } ns

js-site-mcp-pause = Призупинити

js-site-mcp-play = Відтворити

js-site-mcp-plot-aria = Похибка часу { $quantum } і { $classical }, повернута run_scenario, проти порога { $threshold } ns; GNSS (глобальна навігаційна супутникова система) втрачено на { $lost } s

js-site-mcp-recorded-json = Записаний JSON: { $label }

js-site-mcp-scenario-hash = хеш сценарію

js-site-mcp-server-identity = ідентичність сервера

js-site-mcp-show-json = Показати JSON

js-site-mcp-step-aria = Крок { $n } із { $total }: { $name }

js-site-mcp-step-result = результат: показники якості

js-site-mcp-step-status = Крок { $n } із { $total } · { $name }

js-site-mcp-summary-excerpt = підсумковий рядок і результат (уривок)

js-site-mcp-tab-result = результат

js-site-mcp-threshold = поріг

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } рядок
        [few] { $n } рядки
        [many] { $n } рядків
       *[other] { $n } рядка
    }

js-site-mcp-toml-more = … (ще рядків у { $file }: { $n })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } інструмент
        [few] { $n } інструменти
        [many] { $n } інструментів
       *[other] { $n } інструмента
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } інструмент з описами
        [few] { $n } інструменти з описами
        [many] { $n } інструментів з описами
       *[other] { $n } інструмента з описами
    }

js-site-menu-close = Закрити меню

js-site-menu-open = Відкрити меню

js-site-missions-avail-title = Доступність: частка прогону з PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % у кожній комірці

js-site-missions-chart-error-title = похибка положення (m, лог.)

js-site-missions-chart-four = для розв'язку потрібні чотири

js-site-missions-chart-four-short = чотири для розв'язку

js-site-missions-chart-lg-earth = Земля видима

js-site-missions-chart-lg-error-earth = похибка, ретранслятори й дальність до Землі

js-site-missions-chart-lg-error-relays = похибка, лише ретранслятори

js-site-missions-chart-lg-relays = ретранслятори в полі зору

js-site-missions-chart-relays-title = ретранслятори в полі зору · заливка: Земля над горизонтом

js-site-missions-chip-at-pdop = за PDOP ≤ { $limit }

js-site-missions-chip-engine = Рушій:

js-site-missions-chip-fix-earth = розв'язок, із Землею

js-site-missions-chip-median-pdop = медіанний PDOP

js-site-missions-chip-relays = ретранслятори

js-site-missions-chip-rms = похибка RMS

js-site-missions-chip-satellites = супутники

js-site-missions-chip-tracking-held = { $label } супроводження втримано

js-site-missions-clocks-aria = Похибка часу після однієї доби holdover, за класом годинника, логарифмічна шкала

js-site-missions-clocks-frame = поріг системи { $ns } ns

js-site-missions-clocks-note = похибка часу після однієї доби, секунди (лог.)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns після однієї доби, σy(1 s) { $sigma }

js-site-missions-cone-aria = Конус похибки положення від втрати GNSS

js-site-missions-cone-axis-x = час від втрати GNSS (s)

js-site-missions-cone-axis-y = похибка положення (m)

js-site-missions-cone-budget = бюджет ±{ $m } m

js-site-missions-cone-clipped = обрізано на ±{ $m } m

js-site-missions-cone-leaves = виходить на { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Копіювати команду

js-site-missions-copy-title = Скопіювати команду, що це відтворює

js-site-missions-deterministic = детермінований

js-site-missions-engine-build = Рушій v{ $version }, збірка

js-site-missions-engine-build-commit = Рушій v{ $version }, збірка { $commit }

js-site-missions-fp-aria = Карта слідів глушіння. Стрілки переходять між комірками, Enter відкриває відповідний прогін.

js-site-missions-fp-aria-svg = Слід глушіння навколо глушника

js-site-missions-fp-darker = темніше = вище середнє J/S · комірки { $step } km · прогонів рушія: { $n }

js-site-missions-fp-jammer = глушник

js-site-missions-fp-lg-held = супроводження втримано

js-site-missions-fp-lg-lost = втрачено кожен супутник

js-site-missions-fp-lg-some = втрачено деякі епохи

js-site-missions-fp-open = Відкрити цей прогін у { $studio }

js-site-missions-fp-read = приблизно { $km } km від глушника · середнє J/S { $js } dB · доступність супроводження { $av }

js-site-missions-fp-ship = судно сценарію

js-site-missions-grades-aria = Вільний інерційний вибіг до { $a } m і { $b } m, за класом IMU

js-site-missions-grades-axis = секунди вибігу після втрати GNSS (лог.)

js-site-missions-grades-point = { $grade }: { $s } s до { $m } m ({ $why })

js-site-missions-grades-reaches = похибка досягає { $m } m

js-site-missions-grades-speed = за { $v } m/s

js-site-missions-grades-this = цей сценарій

js-site-missions-hud-earth-link = Канал до Землі

js-site-missions-hud-link-above = Канал до Землі · над горизонтом

js-site-missions-hud-link-occulted = Канал до Землі · закрито

js-site-missions-hud-orbiter = Орбітальний апарат

js-site-missions-hud-receiver = Приймач

js-site-missions-hud-relays = Ретранслятори

js-site-missions-hud-selected-lat = вибрана широта

js-site-missions-info-in-view = У полі зору

js-site-missions-info-in-view-value = у середньому { $mean } · щонайменше { $fewest }

js-site-missions-info-pdop-above = { $pdop }, вище за { $limit }

js-site-missions-json-title = Результат рушія, без змін

js-site-missions-json-unavailable = JSON недоступний

js-site-missions-key-avail = Доступність

js-site-missions-key-pdop-title = Середній PDOP (геометричний чинник DOP положення)

js-site-missions-key-vis = Супутники в полі зору

js-site-missions-key-vis-short = У полі зору

js-site-missions-leo-grid = сітки за PDOP ≤ { $limit }

js-site-missions-leo-in-view = у полі зору в середньому

js-site-missions-leo-shells = супутників у чотирьох оболонках

js-site-missions-map-aria = { $title } над { $body }, за комірками 10 градусів. Стрілки переміщують приймач; його комірку виведено нижче.

js-site-missions-map-colour-by = Розфарбувати карту за

js-site-missions-map-fewest-in-view = щонайменше в полі зору

js-site-missions-map-grey = сірий: немає розв'язку

js-site-missions-map-hatched = штриховка: вище за межу PDOP { $limit }

js-site-missions-map-in-view = у полі зору

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = у середньому в полі зору

js-site-missions-map-mean-pdop = середній PDOP

js-site-missions-map-pdop-limit = межа PDOP { $limit }

js-site-missions-matrix-caption = Файли сценаріїв за сектором (рядки) і режимом відмови (стовпці). Виберіть число, щоб відкрити відповідний сектор.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } файл сценарію
        [few] { $sector }, { $mode }: { $n } файли сценарію
        [many] { $sector }, { $mode }: { $n } файлів сценарію
       *[other] { $sector }, { $mode }: { $n } файла сценарію
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } файл:
        [few] { $n } файли:
        [many] { $n } файлів:
       *[other] { $n } файла:
    }

js-site-missions-matrix-sector = Сектор

js-site-missions-mode-int = Завади

js-site-missions-mode-itg = Цілісність

js-site-missions-mode-nav = Вибіг

js-site-missions-mode-orb = Геометрія

js-site-missions-mode-spf = Спуфінг

js-site-missions-mode-tim = Синхронізація часу

js-site-missions-n-of-total = { $n } із { $total }

js-site-missions-no-fix = немає розв'язку

js-site-missions-no-seed = детермінований, без зерна

js-site-missions-open-in-studio = Відкрити в { $studio }

js-site-missions-open-report = Відкрити звіт рушія

js-site-missions-ow-chart-aria = Відгук приймача протягом прогону для { $name }: ретранслятори в полі зору та похибка положення лише з ретрансляторами й з дальністю до Землі

js-site-missions-ow-chip-epochs = епохи

js-site-missions-ow-chip-mask = маска

js-site-missions-ow-chip-orbiter = орбітальний апарат

js-site-missions-ow-chip-range = дальність σ

js-site-missions-ow-chip-relays = ретранслятори

js-site-missions-ow-chip-relays-value = { $planes } × { $per } на { $alt } km, { $inc }°

js-site-missions-ow-chip-span = тривалість

js-site-missions-ow-count-relays = ретрансляторів: { $n } і орбітальний апарат · { $body }

js-site-missions-ow-count-sats = супутників: { $n } · { $body }

js-site-missions-ow-engine = рушій v{ $version } · збірка { $commit }

js-site-missions-ow-lat-label = Широта приймача

js-site-missions-ow-map-aria = Відгук приймача для { $name }: карта тіла { $body } за комірками 10 градусів, а поруч середня й найменша кількість супутників у полі зору та середній PDOP за широтою

js-site-missions-ow-note-imagery = Знімки тіла { $body }: NASA.

js-site-missions-ow-note-rebuilt = Орбіти: ретранслятори й орбітальний апарат відновлено зі сценарію точно так, як їх будує рушій; кількість супутників у полі зору, яку вони дають, дорівнює кількості рушія в усіх епохах ({ $n }).

js-site-missions-ow-note-sats = Орбіти: супутники прогону повторно пропаговано тут і звірено з усіма { $n } відліками наземної траси, записаними рушієм (найгірше { $deg }°).

js-site-missions-ow-note-scaled = Радіуси орбіт масштабовано для відображення; площини, фазування та періоди — як у прогоні.

js-site-missions-ow-note-tracks = Рушій записав наземні траси для { $shown } із { $total } супутників; усі { $total } намальовано з його оболонок.

js-site-missions-ow-note-walker = Орбіти: оболонки Волкера прогону повторно пропаговано тут і звірено з усіма { $n } відліками наземної траси, записаними рушієм (найгірше { $deg }°).

js-site-missions-ow-off = вимк.

js-site-missions-ow-on = увімк.

js-site-missions-ow-pause = Призупинити орбіти

js-site-missions-ow-play = Відтворити орбіти

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Час місії

js-site-missions-ow-valuetext = { $time }, ретрансляторів у полі зору: { $n }

js-site-missions-pdop-title = Середній PDOP (геометричний чинник DOP положення), логарифмічна шкала, нижче — краще

js-site-missions-report = Звіт

js-site-missions-report-title = Власний звіт рушія про цей прогін

js-site-missions-ro-above-horizon = над горизонтом

js-site-missions-ro-availability = Доступність, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Земля · час проходження світла { $s } s

js-site-missions-ro-error-relays = Похибка положення, лише ретранслятори

js-site-missions-ro-occulted = закрито

js-site-missions-ro-place-availability = У місці { $place }: доступність

js-site-missions-ro-place-in-view = У місці { $place }: у полі зору, у середньому · щонайменше

js-site-missions-ro-relays = Ретранслятори в полі зору

js-site-missions-ro-satellites = Супутники

js-site-missions-ro-with-earth = З дальністю до Землі

js-site-missions-run-failed = Записаний прогін не вдалося завантажити тут; відкрийте його в { $studio } за посиланням нижче.

js-site-missions-seed = зерно { $seed }

js-site-missions-spoof-aria = Зсув спуфінгу в часі, з межею виявлення кожного монітора та часом виявлення

js-site-missions-spoof-axis-x = час від початку спуфінгу (s)

js-site-missions-spoof-axis-y = зсув часу (ns)

js-site-missions-spoof-detects = { $id } виявляє на { $s } s

js-site-missions-spoof-lg-bound = межа { $id }

js-site-missions-spoof-lg-offset = зсув спуфінгу

js-site-missions-spoof-readout = t { $t } s · зсув { $offset } ns

js-site-missions-spoof-spec = специфікація { $v } ns

js-site-missions-sr-aria = { $members }; спільний глушник { $power } dBW

js-site-missions-sr-aria-member = { $label }: супроводження втримано { $held } %, середнє відношення глушника до сигналу { $js } dB, щонайменше супроводжується супутників: { $min }

js-site-missions-sr-car = Автомобіль

js-site-missions-sr-fewest = щонайменше супроводжується

js-site-missions-sr-held = супроводження втримано

js-site-missions-sr-mean-js = середнє J/S

js-site-missions-sr-ship = Судно

js-site-missions-swipe =
    { $n ->
        [one] Проведіть, щоб побачити { $n } файл сценарію
        [few] Проведіть, щоб побачити { $n } файли сценарію
        [many] Проведіть, щоб побачити { $n } файлів сценарію
       *[other] Проведіть, щоб побачити { $n } файла сценарію
    }

js-site-missions-toml-download-title = Завантажити файл сценарію, який виконувався

js-site-missions-toml-title = Файл сценарію, який виконувався

js-site-missions-vis-title = Супутники в полі зору, середнє за прогоном

js-site-missions-vis-uniform = { $v } у кожній комірці

js-site-palette-none = Немає результатів

js-site-palette-results = Результатів: { $count }

js-site-pro-band-at = Через { $minutes } хвилин: від 5-го до 95-го процентиля

js-site-pro-band-range = від { $lo } до { $hi } { $unit }

js-site-pro-band-runs-within = із прогонів ({ $n }) у межах ±{ $limit } { $unit }

js-site-pro-design-readout = супутників: { $sat }, доступність { $av } % · площин: { $planes } на { $alt } km, { $incl }°

js-site-pro-front-design = Проєкт із фронту { $id }

js-site-pro-front-design-knee = Проєкт із фронту { $id } · точка згину

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } ще один проєкт із фронту в цій точці)
        [few] (+{ $n } ще проєкти із фронту в цій точці)
        [many] (+{ $n } ще проєктів із фронту в цій точці)
       *[other] (+{ $n } ще проєкта із фронту в цій точці)
    }

js-site-pro-not-rerun = не перезапущено

js-site-pro-rerun-free = перезапуск у безкоштовному рушії:

js-site-pro-same-sha = той самий SHA-256 { $sha }…

js-site-pro-same-sha-index = той самий SHA-256 результату, що й в індексі

js-site-toast-copied = Скопійовано: { $text }

js-site-toast-data-failed = Не вдалося завантажити файл даних

js-site-toast-data-saved = Дані збережено як CSV

js-site-toast-no-data = Немає даних для цього графіка

js-site-toast-svg-saved = Графік збережено як SVG

js-site-toast-table-saved = Таблицю збережено як CSV

js-site-waterfall-axis-now = зараз

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = сигнали лежать нижче рівня шуму

js-site-waterfall-campaign-drives = Кампанія, яку він веде:

js-site-waterfall-campaign-seed = зерно { $seed } · фаз: { $phases } за { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } мегагерц: показати цей діапазон

js-site-waterfall-chip-title = { $band } · { $fc } MHz · смуга приймача { $bw } MHz

js-site-waterfall-engine-build = Рушій v{ $version } · збірка

js-site-waterfall-fallback-head = Резерв Galileo · { $s } s, лише тон CW

js-site-waterfall-fallback-text = { $band } повертається на { $v } dB-Hz. Моніторинг цілісності лише на Galileo: рівень захисту { $min }–{ $max } m, під межею тривоги { $limit } m.

js-site-waterfall-floor = поріг супроводження { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, чирп увімкнено

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, під порогом. Годинник іде вільно: найгірше { $worst } ns проти захисного інтервалу { $guard } ns.

js-site-waterfall-jammer-off = { $what } вимкнено

js-site-waterfall-jammer-on = { $what } увімкнено

js-site-waterfall-live = { $freq } мегагерц, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = немає змодельованого діапазону

js-site-waterfall-load-failed = Записаний прогін не вдалося завантажити. Звіт рушія нижче показує той самий прогін.

js-site-waterfall-no-jammer-band = Немає глушника в цьому діапазоні

js-site-waterfall-no-jammer-in-band = немає глушника в діапазоні

js-site-waterfall-no-seed = детермінований, без зерна

js-site-waterfall-onset-head = Початок · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Усі діапазони ({ $n }) супроводжуються, доки прогін спектра вперше не втрачає { $band } на { $s } s.

js-site-waterfall-pause = Призупинити водоспад

js-site-waterfall-play = Відтворити водоспад

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = прогін T+{ $s } s

js-site-waterfall-scale-caption = PSD над порогом { $floor } dBW/Hz · комірки { $bin } MHz × { $step } s

js-site-waterfall-seed = зерно { $seed }

js-site-waterfall-short-lost = втрата

js-site-waterfall-short-ok = супров.

js-site-waterfall-short-rec = віднов.

js-site-waterfall-state-lost = Втрата захоплення

js-site-waterfall-state-lost-low = втрата захоплення

js-site-waterfall-state-ok = Супроводження

js-site-waterfall-state-ok-low = супроводження

js-site-waterfall-state-rec = Відновлено

js-site-waterfall-state-rec-low = відновлено

js-site-waterfall-summary-recovers = { $band } втрачає захоплення на { $lost } s і відновлює його на { $rec } s, найнижче { $min } dB-Hz.

js-site-waterfall-summary-rows = рядків: { $n } по { $step } s.

js-site-waterfall-summary-stays-lost = { $band } втрачає захоплення на { $lost } s і лишається втраченим, найнижче { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } супроводжується весь час, найнижче { $min } dB-Hz.

js-site-waterfall-tip-above-floor = над рівнем шуму

js-site-waterfall-tip-at-floor = На тепловому рівні шуму

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Смуга приймача жодного змодельованого діапазону не охоплює цей стовпець

js-site-waterfall-wave-chirp = чирп

js-site-waterfall-wave-cw = тон CW

js-site-waterfall-wave-noise = шум

js-site-waterfall-who-cursor = Діапазон під курсором

js-site-waterfall-who-selected = Вибраний діапазон

js-site-waterfall-who-worst = Найгірший діапазон
