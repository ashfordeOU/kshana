> Це машинний переклад README.md версії v0.40.0, який ще не перевірив жоден носій мови; еталоном є англійський README. [English](README.md)

<!-- Зображення в docs/assets/readme/ згенеровано з реальних запусків рушія за допомогою
     tools/gen_readme_assets.py (світлий і темний варіанти); перегенеруйте їх командою
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` і перевірте з `--check`.
     Знімки екрана Kshana Studio в docs/assets/readme/studio/ зроблено з
     запущеного Studio за допомогою tools/capture_studio_shots.mjs і записано в studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: знак, компасна сітка, що позначає точну мить, поруч зі словесним знаком kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>точна мить</em></strong><br>
  Симулятор стійкості PNT (позиціювання, навігації та синхронізації часу) з відкритим кодом.
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Стан безперервної інтеграції на main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Покриття рядків близько 95 % для src/, виміряне в docs/COVERAGE.md і з порогом 85 % у безперервній інтеграції"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 із 401 можливостей VALIDATED за незалежним зовнішнім оракулом, з матриці верифікації"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Стан порогу якості SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Випуск v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Англійська та ще 17 мов, машинний переклад"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Ліцензія: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, концептуальний запис Zenodo для кожного випуску"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Комерційна ліцензія доступна від Ashforde® OÜ, див. Редакції"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana на crates.io, поточна опублікована версія"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana на PyPI, поточна опублікована версія"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana на npm, поточна опублікована версія"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Відкрити Kshana Studio</a> ·
  <a href="#install">Встановлення</a> ·
  <a href="#capabilities">Можливості</a> ·
  <a href="#evidence">Докази</a> ·
  <a href="#research">Дослідження</a> ·
  <a href="docs/CONCEPTS.md">Документація</a> ·
  <a href="#cite">Цитування</a>
</p>

<p align="center">
  <strong>Мови:</strong> <a href="README.md">English</a> ·
  <a href="README.nl.md"><span lang="nl">Nederlands</span></a> ·
  <a href="README.pl.md"><span lang="pl">Polski</span></a> ·
  <a href="README.pt-BR.md"><span lang="pt-BR">Português (Brasil)</span></a> ·
  <a href="README.pt-PT.md"><span lang="pt-PT">Português (Portugal)</span></a> ·
  <a href="README.fi.md"><span lang="fi">Suomi</span></a> ·
  <a href="README.sv.md"><span lang="sv">Svenska</span></a> ·
  <a href="README.da.md"><span lang="da">Dansk</span></a> ·
  <a href="README.nb.md"><span lang="nb">Norsk bokmål</span></a> ·
  <a href="README.cs.md"><span lang="cs">Čeština</span></a> ·
  <a href="README.uk.md"><span lang="uk">Українська</span></a> ·
  <a href="README.ru.md"><span lang="ru">Русский</span></a> ·
  <a href="README.de.md"><span lang="de">Deutsch</span></a> ·
  <a href="README.fr.md"><span lang="fr">Français</span></a> ·
  <a href="README.es.md"><span lang="es">Español</span></a> ·
  <a href="README.et.md"><span lang="et">Eesti</span></a> ·
  <a href="README.ja.md"><span lang="ja">日本語</span></a> ·
  <a href="README.zh-Hans.md"><span lang="zh-Hans">简体中文</span></a><br>
  <sub>Командний рядок, підсумки запусків, графіки та звіти говорять кожною мовою з <code>--lang &lt;tag&gt;</code>
  (наприклад <code>kshana scenarios/holdover-test-example.toml --lang de</code>), так само як і інтерфейси Python, WebAssembly та MCP.
  Це машинні переклади, які ще не перевірив жоден носій мови; еталоном є англійська.
  Див. <a href="docs/i18n.md">Локалізація</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Відрепетируйте хвилину, коли GNSS зникає. Консоль місії Kshana, побудована з реального запуску рушія v0.40.0: ланцюгова кампанія campaign-jam-spoof-holdover-integrity (зерно 20260928, 6 фаз, 18 запусків-учасників протягом T+01:16:10) і 102 супутники GPS, Galileo, BeiDou та GLONASS з constellation-multi-gnss-coverage, кожен намальований на круговій орбіті задачі двох тіл, відновленій із наземної траси рушія, з радіусами, стиснутими для відображення. Похибка часу годинника досягає піку 62.7 ns проти запобіжної межі 50 ns, відношення потужності несівної до спектральної густини шуму падає до -12.2 dB-Hz проти нижньої межі 25 dB-Hz, а вертикальний рівень захисту досягає 135.4 m проти межі тривоги 50 m." width="100%">
</picture>

<details>
<summary><strong>Зміст</strong></summary>

- [Відрепетируйте хвилину, коли GNSS зникає](#rehearse-the-minute-gnss-goes-dark)
- [Що нового в 0.40](#whats-new-in-040), [Що нового в 0.39](#whats-new-in-039), [Що нового в 0.38](#whats-new-in-038) і [0.38 детально](#038-in-depth): оцінювання jammertest, власні прапорці приймача, машинні вхідні дані, синхронізація часу та holdover, пакети стандартів, LunaNet AFS, лабораторний цикл туди й назад, kshana-bench, обсерваторія, експортери, оптика, [навігація космічних користувачів](#space-user-navigation-gnss-ssv) і [місячна інфраструктура](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) і кожна сторінка Studio
- [Можливості](#capabilities): таблиця областей, [кожен вид сценарію за сімейством](#every-scenario-kind-by-family), [кожна команда](#every-command), [кожен інтерфейс](#every-surface)
- [Як працює запуск](#how-a-run-works), [Місії](#missions)
- [Докази](#evidence): реєстр, [домени можливостей](#capability-domains)
- [Встановлення](#install), [Архітектура](#architecture) (і [діаграми](#diagrams)), [AI-асистент](#ai-assistant)
- [Редакції](#editions), [Дослідження](#research), [Цитування](#cite), [Ліцензія](#licence)
- [Довідка](#reference): використання, формат сценарію, вивід, структура репозиторію, FAQ, усунення несправностей, версіонування, дорожня карта, внесок, документація

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Відрепетируйте хвилину, коли GNSS зникає

Kshana відтворює глушіння, спуфінг і holdover годинника, коли сигнали GNSS (глобальної навігаційної супутникової
системи) зникають, і показує, як довго система втримує час і положення в межах свого
бюджету та який годинник чи датчик дає найбільший запас. Це один рушій на Rust. Він працює в
терміналі, блокноті, IDE (інтегрованому середовищі розробки), AI-асистенті (штучного
інтелекту) або у вашому браузері.

Кожен запуск відтворюється біт у біт зі сценарію, зерна та версії рушія.
Кожна можливість має одну з трьох позначок у машинно перевірюваному реєстрі: **VALIDATED** (з нею
погоджується незалежний зовнішній оракул), **MODELLED** (внутрішньо узгоджено, і про це сказано прямо)
або **PARTNER** (нею володіє апаратний партнер).

> **Стан: v0.40.0.** Перевірений, відтворюваний симуляційний субстрат для стійкості PNT.
> Синхронізація часу та holdover на першому місці, бо ця область перевірена найкраще. Kshana — це
> інструмент для досліджень і порівняння компромісів: не апаратний генератор радіочастотних (РЧ) сигналів (він
> не керує жодним радіо і нічого не передає; його вивід на рівні сигналу — це файли базосмугових IQ-відліків
> для програмних приймачів), не апаратний чи сертифікований приймач GNSS (його програмний приймач
> є інструментом аналізу) і не льотний продукт. Новачок у цій галузі? Почніть із
> [посібника простою мовою](docs/CONCEPTS.md) і [глосарія](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Що нового в 0.40

0.40 додає бюджет похибки на рівні місії, позначає кожен рисунок і таблицю рівнем доказів, читає журнали виміряних годинників,
перевіряє подання від партнерів із даних, оцінює, де може бути джерело завад, і говорить сімнадцятьма мовами, крім англійської.
Реєстр тепер має 401 рядок: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Жоден рядок не підвищено до VALIDATED, і кожен промах нижче
закріплено тестом.

- **Нитка місії.** Вид `mission-thread` поєднує фази від запуску до входу в атмосферу (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` і чотири місячні види) із зазначеними правилами передачі, запасом відносно зазначених вимог і найслабшою
  ланкою; наскрізний приклад класу Artemis на 11 фазах (земний і місячний сегменти), загалом 92 види сценаріїв. Кожне число — MODELLED. Поширення в цисмісячному просторі порівняно з публічною траєкторією Artemis I
  **не досягає** свого попередньо зареєстрованого порогу (45.3 km і 0.25 m/s проти 5 km і 0.05 m/s; причина — малі маневри, яких модель не враховує), а місячний пропагатор порівняно з орбітою CAPSTONE
  **не досягає** порогу (136.8 km проти 25 km наприкінці одного оберту); порівняння з LRO досягнуто. Рядки залишаються MODELLED
  ([Нитка місії](docs/MISSION-THREAD.md), [місячний сегмент](docs/MISSION-THREAD-LUNAR.md)). У Studio нитку читають на `/studio/mission-thread/`.
- **Позначки доказів.** Кожен рисунок і таблиця, які записує запуск, несуть рівень і ідентифікатори рядків реєстру, на яких вони ґрунтуються, прочитані з матриці.
- **Виміряні годинники.** Читається вісім форматів журналів годинників ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)), і підігнаний
  ряд може керувати holdover. Порівняно з попередньо зареєстрованими порогами підгонка **не досягає** F1(a) на п'яти з шести записів і F2 на одному; обидва
  залишаються MODELLED ([Журнал змін](CHANGELOG.md#0400---2026-10-29)).
- **Партнери з даних.** `kshana partner check` перевіряє формат подання і нічого не оцінює ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Область джерела.** `kshana interference-map locate` дає область і еліпс, ніколи не голу точку, зі звітів ADS-B або AIS.
  Після одноразового порівняння з місцями передавачів Jammertest 2025 результат — **NOT ASSESSABLE** для обох джерел (замало
  запланованих сеансів у відкритих даних), тому рядок залишається MODELLED ([Карта завад](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Бенчмарк.** Повторна кампанія 0.40 досягає A3, D3 (обидва EXPLORATORY), R3 і R4; A2, D1 і R1 залишаються NOT MET ([Bench](docs/BENCH.md)).
- **Мови.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja і zh-Hans, як **машинні переклади, які не перевірив жоден носій
  мови**; еталоном є англійська, а неангломовні запуски тривають приблизно вдвічі довше
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Що нового в 0.39

0.39 не додає жодної функції і не змінює жодного результату; вивід рушія — це вивід 0.38. Він виправляє одну річ
у командному рядку, оновлює залежності інструментів перехресної перевірки і повністю наводить вердикти
бенчмарку.

- **Командний рядок.** `kshana kinds | head` (будь-який закритий стандартний вивід) більше не спричиняє паніки: програма тихо
  завершується зі статусом 141, як це роблять інші інструменти для закритого каналу. Про інші помилки запису програма й далі повідомляє.
- **Залежності.** `memmap2` 0.9.11 у двох lock-файлах перехресної перевірки ANISE, а також `pillow` 13.0.0 і
  `certifi` 2026.10.19 у закріплених версіях середовища оракула, усе в `xval/`: нічого з того, що постачається, не змінилося.
- **kshana-bench, усі вердикти.** Порівняно з попередньо зареєстрованими порогами три мають статус NOT MET, кожен закріплено тестом:
  A2 (`agc_k_sigma` AUC 0.766 проти щонайменше 0.80), D1 (найбільший розрив 0.0301) і завдання (b) R1 (перенесено,
  не перезапущено). Жоден поріг не послаблено ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Що нового в 0.38

0.38 робить нейтрального арбітра вимірюваним: він оцінює журнали приймачів за опублікованим розкладом
випробувань, читає більше приймачів і датчиків, тестує системи синхронізації часу та постачає бенчмарк і
обсерваторію завад. Він залишається консультативним: ніщо тут не сертифіковано, жоден результат не є затвердженням типу,
і ніщо не передає сигнал. Кожен рядок зазначає, що для нього містить реєстр ([як заробляють позначку](#evidence));
статус називає лише те, що перевірено, а рядок реєстру і сторінка за посиланням кажуть, що перевірено не було.

| Нове в 0.38 | Що робить і навіщо | Статус у реєстрі | Читати |
|---|---|---|---|
| **Оцінювання Jammertest** | `kshana jammertest import` читає опублікований каталог випробувань NPRA і план передавання як запланованої істини; `jammertest score` оцінює журнал приймача за кожним випробуванням (затримка виявлення, пропущені тривоги, хибні тривоги, час до відновлення), як підписаний пакет доказів, якщо ви надасте ключ | **MODELLED**: один рядок реєстру. Пороги попередньо зареєстровано до будь-якого оцінюваного запуску; на даних JammerTest 2024 правило мінімуму даних не виконалося в обох запусках (4 і 7 придатних до оцінювання вікон проти 10 потрібних), тому **жоден поріг не можна оцінити** і нічого не заявлено | [Jammertest](docs/JAMMERTEST.md) |
| **Власні прапорці приймача** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG і NovAtel RXSTATUS зчитуються в `self_report` для кожної епохи і порівнюються з тривогами Kshana (обидва, лише приймач, лише Kshana, жоден); читач Septentrio SBF і вхід `--serial` лише для читання | **MODELLED**; узгодженість між детектором приймача і детектором Kshana не є валідацією | [Довіра до приймача](docs/RECEIVER-TRUST.md) |
| **Більше приймачів і датчиків** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (з таблиць pyrtcm за ліцензією BSD, а не з тексту RTCM), потоки монітора GNSS-SDR, журнал IMU як другий датчик, пакет ROS 2, міст `gnss_lib_py` і `imu-fit` для параметрів гібридних датчиків | **MODELLED**: шість рядків реєстру; лише власноруч написані тестові дані, жодного запису з реального приймача, IMU, запуску GNSS-SDR чи графа ROS не прочитано | [Машинні вхідні дані](docs/MACHINE-INPUTS.md) |
| **Випробування синхронізації часу та holdover** | вид `holdover-test` оцінює випробування holdover (GNSS вимкнено оператором, holdover, відновлення) за записом виміряної похибки часу відносно масок ITU-T, «виміряно відносно маски»; читачі журналів linuxptp і chrony; апаратні етапи і поле `lab-attestation` | **MODELLED**: два рядки реєстру; моменти часу є заявою оператора, не перевіреною | [Timing HIL](docs/TIMING-HIL.md), [Апаратна безпека](docs/HARDWARE-SAFETY.md) |
| **Пакети стандартів, LunaNet AFS, лабораторний цикл туди й назад** | оцінювані пакети для DHS RPCF, IMO MSC.1/Circ.1575 і ICAO Doc 9849 Appendix F відносно порогів, зазначених до запуску, «підтримує докази для»; таблиця відповідності NIST IR 8323r1; генератор і перевіряльник кодів LunaNet AFS; підписаний пакет, що пов'язує сценарій лабораторного запуску, умови випробування, журнал приймача й оцінку | **MODELLED** для пакетів і циклу туди й назад; перевірка кодів AFS — **VALIDATED** за її надрукованими контрольними стовпцями (див. рядки реєстру) | [Стандарти](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench і обсерваторія** | фіксовані завдання, розбиття і метрики для виявлення завад, виявлення за IQ, прогнозування holdover і розриву оптимізму, із запечатаним holdout (відкладеним набором) і статичною таблицею лідерів; відтворюваний щоденний продукт завад із затримкою 24 h, грубими комірками і без атрибуції | власного рядка реєстру немає: він оцінює подання, а його базові рівні позначено MODELLED у файлах результатів; порівняно з попередньо зареєстрованими порогами оцінювач, C1–C3 і D2 досягнуто, а три пороги мають статус **NOT MET** (закріплено тестами): A2 (`agc_k_sigma` AUC 0.766 проти щонайменше 0.80 на тестовому розбитті), D1 (найбільший розрив 0.0301) і завдання (b) R1 (перенесено, не перезапущено); див. `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Обсерваторія](docs/observatory/METHOD.md) |
| **Експортери** | телеметрія довіри як повідомлення виявлення і стану Home Assistant MQTT (лише публікація, без облікових даних) поряд із Prometheus, CEF, LEEF і OTLP | **MODELLED**: один рядок реєстру | [Телеметрія довіри](docs/TRUST-TELEMETRY.md) |
| **Запас оптичної лінії в часі** | вид `optical-atmosphere` може записати одну реалізацію погоди на ділянці з заданим зерном як ряд запасу лінії | **MODELLED**: один рядок реєстру; одна вибірка з моделі, а не клімат | [Оптична атмосфера](docs/OPTICAL-ATMOSPHERE.md) |

Основне в 0.37: [журнал змін](CHANGELOG.md#0370---2026-10-17). Повний список 0.38 є в
[журналі змін](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 детально

Кожна можливість із таблиці вище в кількох рядках: що вона робить, одна команда для запуску, один
рисунок із реального запуску рушія і що для неї містить реєстр. Рисунки
записує [`tools/gen_figures_038.py`](tools/gen_figures_038.py) у
[`docs/figures/0.38/`](docs/figures/0.38/) (ніколи не малюються вручну): `python3 tools/gen_figures_038.py`
переписує їх зі зібраного рушія, а `--check` завершується помилкою, якщо якийсь застарів або його підпис тут відрізняється.
Якщо вхідні дані — журнал, то це вигаданий журнал, який записує скрипт, бо реальні журнали третіх сторін
ніколи не включаються до репозиторію, і підпис про це каже. Усе нижче має консультативний характер: не сертифіковано, не
затвердження типу, і ніщо не передає сигнал. Статус називає те, що перевірено, і нічого більше;
[як заробляють позначку](#evidence).

### Оцінювання Jammertest

`kshana jammertest import` перетворює опублікований каталог випробувань NPRA і план передавання на
заплановану істину, а `kshana jammertest score` оцінює за нею журнал приймача: для кожного
запланованого випробування — чи його виявлено, з якою затримкою і скільки часу приймач відновлювався, плюс
хибні тривоги поза всіма слотами. Каталог завантажується, ніколи не включається до репозиторію.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Оцінювання одного синтетичного журналу приймача за розкладом із трьох випробувань, із реального запуску рушія v0.40.0 (`kshana jammertest score`). Журнал вигаданий: 1800 s NMEA з падінням C/N0 на 20 dB у двох інтервалах. Розклад містить три слоти; у середньому слоті в журналі немає глушника. Оцінка позначає 2 з 3 випробувань як виявлені (медіанна затримка 0 s) і 1 як пропущене, з 0 серій хибних тривог за 0.25 h чистого часу. Ніщо тут нічого не каже про реальний приймач. Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу (IEC 61108, IEC 61162): відповідальність за навігацію судна залишається на операторі.">
</picture>

**Статус у реєстрі: MODELLED.** Пороги зафіксовано до будь-якого оцінюваного запуску; на даних JammerTest 2024
правило мінімуму даних не виконалося в обох запусках, тому жоден поріг не можна оцінити і нічого не заявлено.
[Jammertest](docs/JAMMERTEST.md).

### Власні прапорці приймача

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG і NovAtel RXSTATUS зчитуються в `self_report` для кожної
епохи і ставляться поряд із тривогами Kshana: обидва, лише приймач, лише Kshana або жоден.
Читач Septentrio SBF і вхід `--serial` лише для читання живлять те саме порівняння. Жодна сторона не є
еталонною істиною.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Власний прапорець спуфінгу приймача поряд із тривогами Kshana, із реального запуску рушія v0.40.0 на вигаданому журналі UBX (200 епох з частотою 1 Hz). C/N0 падає на 20 dB на 80–90 s і 120–130 s; приймач позначає 120–130 s і 160–165 s. Із 140 епох, порівняних після калібрування, в 11 позначали обидва, в 6 лише приймач, в 11 лише Kshana і в 112 жоден. Жодна сторона не є еталонною істиною, і узгодженість не є валідацією. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

**Статус у реєстрі: MODELLED.** Узгодженість між детектором приймача і детектором Kshana не є
валідацією. [Довіра до приймача](docs/RECEIVER-TRUST.md).

### Більше приймачів і датчиків

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, потоки монітора GNSS-SDR, журнал IMU як другий
датчик, пакет ROS 2 і міст `gnss_lib_py` — усе закінчується в тій самій часовій шкалі довіри до приймача.
`imu-fit` зчитує параметри датчика, потрібні гібридним сценаріям і сценаріям злиття, зі стаціонарного журналу IMU,
тож сценарій можна запустити з тим датчиком, який у вас справді є.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Що `kshana imu-fit` зчитує зі стаціонарного журналу IMU, із реального запуску рушія v0.40.0 на вигаданому журналі (20,000 відліків з частотою 100 Hz, 200 s): випадкове блукання швидкості акселерометра q_va = 4.02e-06, випадкове блукання кута гіроскопа q_arw = 9e-08, нестабільність зміщення 0.00296 і початкові нахили Аллана (-0.51 і -0.49; близько -0.5 там, де домінує білий шум). Таблиця поруч — це TOML, який друкує команда. Оцінювач перевірено лише на синтетичних журналах. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

**Статус у реєстрі: MODELLED.** Лише власноруч написані тестові дані; жодного запису з реального приймача, IMU,
запуску GNSS-SDR чи графа ROS не прочитано. [Машинні вхідні дані](docs/MACHINE-INPUTS.md).

### Випробування синхронізації часу та holdover

Вид `holdover-test` оцінює випробування holdover (GNSS вимкнено оператором, holdover, відновлення)
за записом виміряної похибки часу відносно масок ITU-T і каже це саме такими словами: виміряно
відносно маски. Його живлять читачі журналів linuxptp і chrony; апаратні етапи і поле
`lab-attestation` кажуть, хто що заявив.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Випробування holdover, оцінене за записом похибки часу, із реального запуску рушія v0.40.0 на scenarios/holdover-test-example.toml (601 відлік кожні 5 s). Оператор вимикає GNSS на 600 s і відновлює на 2400 s; похибка часу дрейфує до 299 ns наприкінці holdover, виходить за бюджет 100 ns через 675 s і повертається в смугу 100 ns через 70 s після відновлення. Вердикти: маски базового рівня PASS, маски holdover FAIL, обвідна holdover FAIL, відновлення RECOVERED. Виміряно відносно маски, не затвердження. Моменти часу є заявою оператора, Kshana їх не перевіряв. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

**Статус у реєстрі: MODELLED.** Моменти, коли GNSS вимкнули і відновили, є заявою оператора,
не перевіреною. [Timing HIL](docs/TIMING-HIL.md), [Апаратна безпека](docs/HARDWARE-SAFETY.md).

### Пакети стандартів

Оцінювані пакети для профілів випробувань DHS Resilient PNT, IMO MSC.1/Circ.1575 і ICAO Doc 9849
Appendix F, плюс таблиця відповідності NIST IR 8323r1 у `compliance-report`. Кожне випробування запускає вбудований
сценарій і порівнює поле результату з порогом, зазначеним до запуску; випробування, якому потрібен журнал
приймача, позначено як таке, що потребує вхідних даних, і не оцінюється. Формулювання — «підтримує докази для».

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Кожне випробування трьох оцінюваних пакетів стандартів, із реальних запусків рушія v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 досягнуто, 1 не досягнуто, 2 потребують вхідних даних; imo-circ-1575: 1 досягнуто, 4 не досягнуто, 2 потребують вхідних даних; icao-doc9849-appf: 6 досягнуто, 0 не досягнуто, 2 потребують вхідних даних. Загалом 13 досягнуто, 5 не досягнуто і 6 потребують вхідних даних, яких рушій не має (журналу приймача або документації на обладнання). Кожен поріг зазначено до запуску; промах залишається промахом. Досягнутий поріг означає, що змодельований сценарій досяг зазначеного порогу, і нічого не каже про продукт. Пакети підтримують докази для рядків, на які посилаються; вони не є оцінюванням. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя; він не повинен бути єдиною основою для будь-якого рішення щодо навігації чи безпеки.">
</picture>

**Статус у реєстрі: MODELLED.** Досягнутий поріг означає, що змодельований сценарій досяг зазначеного порогу, і нічого не каже про
продукт; кожен промах збережено і закріплено тестом. [Стандарти](docs/STANDARDS.md).

### LunaNet AFS

Генератор кодів LunaNet Augmented Forward Signal (коди Gold, Weil і третинні коди, кадр
повідомлення та його завадостійке кодування) і перевіряльник записаного або згенерованого потоку символів, прив'язаний до однієї
редакції специфікації.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="Генератор кодів LunaNet AFS, перевірений за надрукованими стовпцями специфікації, із реального запуску рушія v0.40.0 (`kshana lunanet-afs-check spec`, прив'язано до LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 January 2025; документ позначає свої таблиці кодів {LSIS-TBC}). 9 із 10 перевірок досягнуто; B4 має статус NOT MET (420 із 421 збіглися). Він перевіряє потік символів за однією редакцією опублікованої специфікації і нічого не каже про будь-який вузол чи службу LunaNet. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя. Він перевіряє потік символів за однією редакцією опублікованої специфікації і нічого не каже про будь-який вузол чи службу LunaNet.">
</picture>

**Статус у реєстрі: VALIDATED** для перевірок кодів і синхронізації, за значеннями, які
друкує специфікація (і які вона позначає TBC); одна перевірка має статус NOT MET, збережена і закріплена (один надрукований
стовпець третинного коду відрізняється: документ друкує те саме значення для двох PRN). Слова LDPC і CRC
підкадрів 2–4 не перевіряються. Рядки реєстру точно кажуть, які саме. [LunaNet AFS](docs/LUNANET-AFS.md).

### Лабораторний цикл туди й назад

`kshana.test-conditions/1` — це опублікований опис того, що зробила лабораторія (події, моменти часу,
потужності). `kshana evidence round-trip` пов'язує хеш сценарію, хеш умов, хеш журналу
приймача і оцінку в один підписаний пакет і відхиляє пакет, умови і сценарій оцінювання якого
розходяться щодо подій. Kshana ніколи не створює і не відтворює сигнал: як сценарій потрапив до
приймача — відповідальність оператора.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Структура пакета доказів. Журнал приймача (NMEA, u-blox UBX, RINEX 3 або журнал Android) і часове вікно надходять у kshana receiver-trust evidence, який записує сім файлів: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig і необов'язковий timestamp.tsr. Маніфест записує SHA-256 усього журналу і кожного файлу та хеш-ланцюжок по файлах; підпис покриває маніфест. kshana evidence verify перевіряє підпис, хеш кожного файлу, ланцюжок і відсутність неперелічених файлів і завершується з кодом 0, коли перевірено, 1, коли щось не вдалося, і 3, коли підписувача не закріплено. Пакет — це технічний запис, а не юридичний висновок.">
</picture>

Рисунок показує структуру пакета. **Статус у реєстрі: MODELLED.**
[Умови випробування](docs/spec/TEST-CONDITIONS.md), [Випробувальний стенд](docs/TEST-BENCH.md).

### kshana-bench

Фіксовані завдання, розбиття і метрики для виявлення завад, виявлення за IQ, прогнозування holdover і
розриву оптимізму, із запечатаним holdout і статичною таблицею лідерів. Він оцінює подання; це не
рейтинг приймачів.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="Вбудовані базові рівні завдання D kshana-bench (розрив оптимізму) на тестовому розбитті, із реального запуску рушія v0.40.0 (`kshana bench baseline`). Кожна пара стовпців — це площа під кривою ROC на випадках усередині розподілу і на зсунутих випадках; розрив між ними — це розрив оптимізму, порівняно з допуском 0.05. fused-max-z: 0.998 і 0.983 (розрив 0.015); sqm-imbalance: 0.882 і 0.882 (розрив 0.001); agc-excess: 0.848 і 0.819 (розрив 0.030); raim-parity: 0.682 і 0.672 (розрив 0.010); energy-cn0-drop: 0.595 і 0.565 (розрив 0.030). Мітки — це мітки генеративної моделі синтетичного корпусу, ніколи не польові дані: MODELLED. Консультативно: змодельовано або виміряно відносно зазначених еталонів, не затвердження, сертифікація чи заява про відповідність. Оцінка описує журнал або корпус, ніколи не продукт.">
</picture>

**Статус у реєстрі:** власного рядка реєстру немає; базові рівні позначено MODELLED у файлах результатів.
Порівняно з попередньо зареєстрованими порогами оцінювач, C1–C3 і D2 досягнуто, а три пороги мають статус NOT MET, кожен
закріплено тестом: A2 (`agc_k_sigma` AUC 0.766 проти щонайменше 0.80 на тестовому розбитті), D1 (найбільший розрив
0.0301) і завдання (b) R1 (перенесено з попередньої кампанії, не перезапущено). Числа наведено в
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Обсерваторія завад

Один продукт на добу UTC і регіон із відкритого архіву положень повітряних суден, на фіксованій грубій сітці:
кожна комірка погіршена, не погіршена або не спостерігалася (що не означає «чисто»). Публікується не раніше
ніж через 24 h після закінчення доби, з придушенням малих комірок і без атрибуції причини.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Дві синтетичні доби карти завад, побудовані із закомічених зразків у examples/interference-map/output, кожна зі своїм синтетичним маршрутом і частками експозиції маршруту, які повідомляє рушій. Ліворуч доба ADS-B: 1 погіршена комірка, 6 не погіршених, 4 неоцінені (заштриховані) і комірки без запису, намальовані порожніми, які не спостерігалися. Маршрут має 525 km: 11.5% його довжини в погіршених комірках, 38.3% у не погіршених, 9.1% у неоцінених і 41.1% у тих, що не спостерігалися. Праворуч доба AIS: комірки, позначені детекторами кола і суходолу, неаномальні комірки і порожні комірки; маршрут має 454 km, з них 10.5% в аномальних комірках, 21.2% у неаномальних, 0.0% у неоцінених і 68.3% у тих, що не спостерігалися. ADS-B і AIS — окремі шари, ніколи не об'єднані. Позначена комірка не є висновком про завади, а комірка без кольору не спостерігалася, що не те саме, що чисто. Усі дані вигадані, розташовані у відкритій частині середньої Атлантики, і не є вимірюванням.">
</picture>

Рисунок показує закомічені зразкові доби, а не продукт обсерваторії. **Статус у реєстрі: MODELLED**:
немає зовнішнього оракула, немає еталонної істини і немає атрибуції причини; комірку, яка не спостерігалася, не
оцінено, що не те саме, що чисто. [Метод обсерваторії](docs/observatory/METHOD.md).

### Експортери

Телеметрія довіри як текст Prometheus, CEF, LEEF, OTLP і повідомлення виявлення та стану Home Assistant MQTT.
Команда публікує лише до призначення, яке ви їй надали, і не зберігає облікових даних.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Один результат довіри в трьох форматах експорту, із реальних запусків рушія v0.40.0 (`kshana trust-telemetry`) на examples/maritime-trust: текстове представлення Prometheus (остання оцінка довіри 5.9, і встановлено діапазон «недовірений»), а також останні повідомлення CEF і LEEF. Команда нічого не публікує, якщо не задано призначення, не зберігає облікових даних і не передає жодного радіосигналу. Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу (IEC 61108, IEC 61162): відповідальність за навігацію судна залишається на операторі.">
</picture>

**Статус у реєстрі: MODELLED.** [Телеметрія довіри](docs/TRUST-TELEMETRY.md).

### Запас оптичної лінії в часі

Вид `optical-atmosphere` може записати одну реалізацію погоди на ділянці з заданим зерном як ряд запасу
лінії: епізоди хмарності, стовп рідкої води для кожного, один відлік сцинтиляції на крок.
Сторінка Optical PNT у Studio відкриває сценарії optical-atmosphere.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Одна реалізація із заданим зерном запасу лінії ділянки 'northern' протягом 336 h, із реального запуску рушія v0.40.0 на scenarios/optical-atmosphere-network.toml (зерно 37, крок 600 s). Запас падає нижче нуля під час епізодів хмарності; у цій вибірці лінія працює 40.5 % часу, з 27 перервами і найдовшою перервою 30.7 h. Вхідні дані ілюстративні, ряд — це одна вибірка з моделі, а не клімат, і він відрізняється від статистичної доступності (37.8 %) на похибку вибірки. Лише консультативний аналіз: не сертифікований продукт доступності, цілісності чи навігації і не прогноз для будь-якої реальної ділянки, якщо її кліматичні вхідні дані не взято із зазначеного набору даних.">
</picture>

**Статус у реєстрі: MODELLED.** Одна вибірка з моделі, а не клімат. [Оптична атмосфера](docs/OPTICAL-ATMOSPHERE.md).

### Нові подання Studio

[kshana.dev/studio](https://kshana.dev/studio/) отримує повтор Bridge (два запуски поруч на одному
годиннику місії, на [`/studio/replay/`](https://kshana.dev/studio/replay/)), сторінку Optical PNT
(`/studio/optical/`), сторінку випробування holdover (`/studio/holdover/`) і переглядач обсерваторії
(`/studio/observatory/`). Вони запускають той самий рушій у браузері, нічого не вивантажується, і вони несуть
ту саму консультативну заяву. Рисунки вище намальовано скриптом із власного виводу рушія;
це не знімки екрана цих сторінок.

<a id="space-user-navigation-gnss-ssv"></a>
### Навігація космічних користувачів (`gnss-ssv`)

Для космічного апарата над орбітами GNSS, навколо них або далеко за ними: скільки сигналів GNSS він може використати, наскільки
вони сильні, наскільки добра геометрія і що з ними може зробити бортовий фільтр. Один вид,
чотири режими, вибрані таблицями сценарію: **оболонка** користувачів (частка часу з одним і чотирма
сигналами, для кожного сузір'я), **траєкторія** (сигнали, C/N0, геометричний фактор точності і
середовище променя через лімб уздовж орбіти), запуск **навігації** (фільтр із дев'ятьма станами на псевдовідстанях, до
Місяця) і **формація** (відносна навігація ведених відносно ведучого). Публічне джерело для
порівняння доступності — буклет interoperable GNSS Space Service Volume (UN OOSA
ST/SPACE/75, від International Committee on GNSS), який сам є симуляцією; його завантажують, ніколи не
включають до репозиторію. Повна сторінка: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Доступність сигналів для користувача на сфері на висоті 36000 km з напівсферичною антеною, із реального запуску рушія v0.40.0 на scenarios/gnss-ssv-shell.toml (скорочений запуск: 162 користувачі, 3 доби, кроки по 10 min), за порогу 20 dB-Hz. Для кожного сузір'я і смуги — два стовпці: частка пар (користувач, епоха) щонайменше з одним сигналом і щонайменше з чотирма. Разом, L1: 99.4 % щонайменше один, 73.2 % щонайменше чотири, найдовша перерва з менш ніж чотирма сигналами 160 min. Разом, L5: 100.0 % щонайменше один, 99.9 % щонайменше чотири, найдовша перерва з менш ніж чотирма сигналами 20 min. MODELLED: змодельоване дослідження за зазначеними вхідними даними, не вимірювання і не заява про обсяг обслуговування для будь-якої системи. Скорочений розмір не є порівнянням із буклетом. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Сигнали вздовж однієї високої навколоземної орбіти (перигей 497 km, апогей 58622 km, період 18.8 h), із реального запуску рушія v0.40.0 на scenarios/gnss-ssv-heo.toml, смуга L1. Угорі: найкраще відношення потужності несівної до спектральної густини шуму серед видимих сигналів порівняно з порогом 20 dB-Hz. Посередині: кількість видимих сигналів від усіх сузір'їв, від 4 до 55 у вибраних точках. Із прийнятих ліній 2252 пройшли через головну пелюстку і 696 через бічні пелюстки, з використанням позначеної параметричної замінної діаграми, а не виміряної діаграми будь-якої системи. Медіанний PDOP 67, 95-й процентиль 358. MODELLED: змодельоване дослідження за зазначеними вхідними даними, не вимірювання і не заява про обсяг обслуговування для будь-якої системи. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Бортовий фільтр із дев'ятьма станами на перельоті з низької орбіти до Місяця, із реального запуску рушія v0.40.0 на scenarios/gnss-ssv-nav-lunar.toml (289 епох, намальовано 13 точок). На логарифмічній осі — справжня похибка положення і власна межа фільтра в одну сигму залежно від часу від початку. Усередині орбіт GNSS середньоквадратична похибка положення 1.4 m; над ними вона 90 m, а кінцева похибка 184 m на висоті 193,330 km з 1 вимірюванням. Середній квадрат нормалізованої похибки оцінювання за весь запуск становить 4.4 (близько 3 для узгодженого блоку положення). Істина і фільтр мають спільні замінники Сонця і Місяця. MODELLED: змодельоване дослідження за зазначеними вхідними даними, не вимірювання і не заява про обсяг обслуговування для будь-якої системи. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Відносна навігація 2 ведених навколо ведучого на високій орбіті, із реального запуску рушія v0.40.0 на scenarios/gnss-ssv-formation-heo.toml (401 епоха). Для кожного веденого два стовпці: середньоквадратична відносна похибка положення від віднімання двох незалежних абсолютних оцінок і від відносного фільтра на одинарних різницях псевдовідстаней. База 0.8 km: 5.1 m і 1.2 m. База 2.0 km: 4.1 m і 2.1 m. Абсолютний фільтр тут не узгоджений: середній квадрат нормалізованої похибки оцінювання 187 проти близько 3 для узгодженого фільтра, тож його заявлена невизначеність набагато замала. MODELLED: змодельоване дослідження за зазначеними вхідними даними, не вимірювання і не заява про обсяг обслуговування для будь-якої системи. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

**Статус у реєстрі: MODELLED, і порівняння з буклетом здебільшого не досягає порогів.** Пороги зафіксовано до
запуску. Із восьми досягнуто лише S0 (обернений бюджет лінії, 13 із 13 значень) і S6 (місячна місія).
**S1–S5 і S7 мають статус NOT MET**: геометрія верхнього і нижнього обсягу обслуговування (43 із 52 і 48 із 52
комірок), верхній обсяг обслуговування за 15/20/25 dB-Hz, шість місій GEO, місія HEO і
параметрична діаграма бічних пелюсток порівняно з виміряними діаграмами панелей GPS. Майже кожен промах у S1–S5 стосується
GLONASS, і буклет друкує для нього два різні опорні кути; діагностичний варіант, що використовує
іншу пару, доводить S1, S2 і S4 до кожної комірки, але він не замінює офіційний запуск, і жоден рядок не є
VALIDATED. Абсолютний фільтр запуску формації також надмірно впевнений (середній квадрат нормалізованої похибки
значно вищий за значення близько 3, яке дає узгоджений фільтр).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Записане порівняння моделі доступності для космічних користувачів із публічним буклетом Space Service Volume, із закомічених результатів попередньо зареєстрованого запуску (xval/gnss-ssv/results-run1.json, записано прикладом ssv_booklet_check рушія v0.40.0). Стовпець за стовпцем, комірки в межах допуску: S0 13 із 13 (MET); S1 43 із 52 (NOT MET); S2 48 із 52 (NOT MET); S3 122 із 155 (NOT MET); S4 132 із 156 (NOT MET); S5 18 із 26 (NOT MET); S6 26 із 26 (MET); S7 0 із 20 діаграм панелей (NOT MET). За попередньо зареєстрованого прочитання досягнуто лише S0 і S6. Діагностичний варіант, що використовує інші кути GLONASS з буклета, доводить S1, S2 і S4 до кожної комірки, але не замінює офіційний запуск. Жоден рядок реєстру не є VALIDATED. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

[Навігація космічних користувачів](docs/SSV.md), [що показує порівняння](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Місячна інфраструктура (`lunar-infrastructure`)

Орбіта і поверхня Місяця як навігаційна та геодезична інфраструктура, у п'яти дослідженнях, вибраних через
`study`: **od-consistency** (бортове визначення орбіти за земними GNSS на гало-орбіті порівняно з
незалежним наземним), **carrier-phase** (фіксація цілочисельної неоднозначності між поверхневими станціями і
орбітальним апаратом), **frame-coestimation** (місячний датум з далекометрії земних станцій із лініями до орбітального апарата і без них),
**space-tie** (зсуви лазера, VLBI і GNSS на одному космічному апараті порівняно з похибкою локальної прив'язки) і
**geodesy-sensitivity** (яке сімейство спостережуваних бачить числа Лява h2, k2 і l2). Модель —
обмежена задача трьох тіл із зазначеними спрощеннями та ілюстративними вхідними даними. Повна сторінка:
[docs/LUNAR-INFRASTRUCTURE.md](docs/LUNAR-INFRASTRUCTURE.md).

```sh
kshana scenarios/lunar-infrastructure-od-consistency.toml
kshana scenarios/lunar-infrastructure-carrier-phase.toml            # quick; the scored run takes about eight minutes
kshana scenarios/lunar-infrastructure-frame-coestimation.toml
kshana scenarios/lunar-infrastructure-space-tie.toml
kshana scenarios/lunar-infrastructure-geodesy-sensitivity.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-od-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-od-light.svg">
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Узгодженість бортового визначення орбіти за земними GNSS на майже прямолінійній гало-орбіті з незалежним наземним визначенням орбіти, із реальних запусків рушія v0.40.0 на scenarios/lunar-infrastructure-od-consistency.toml і варіанті з похибкою моделі (по 400 випробувань). Середня нормалізована різниця q становить 5.81 без похибки моделі і 5.95 із внесеною похибкою прискорення 3e-10 m/s2, проти очікуваних 6: два розв'язки орбіти узгоджені (поріг C1 MET). Частка випробувань вище точки 95 % становить 0.040 і 0.052; поріг для виявлення внесеної похибки становив щонайменше 0.5, тож він NOT MET (C3): бортовий розв'язок відомий з точністю близько 352 m проти 23 m для наземного, тож зміщення в десять метрів ховається в його коваріації. MODELLED: модель обмеженої задачі трьох тіл із зазначеними спрощеннями та ілюстративними вхідними даними, не вимірювання будь-якої місячної величини. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Фіксація цілочисельної неоднозначності фази несівної між місячними поверхневими станціями і орбітальним апаратом, із закоміченого результату оцінюваного запуску рушія v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 довжини дуги, Монте-Карло по 401 вибірці кожна, записано scenarios/carrier-phase-scored.toml). 1 доба: успіх 1.0 % (стандартна похибка 0.5 %), 134 неоднозначності, сигма положення орбітального апарата 45.6 m з плаваючим і 18.5 m з фіксованим розв'язком; 2 доби: успіх 0.5 % (стандартна похибка 0.4 %), 259 неоднозначностей, сигма положення 21.5 m з плаваючим і 8.7 m з фіксованим; 3 доби: успіх 2.8 % (стандартна похибка 0.8 %), 375 неоднозначностей, сигма положення 6.3 m з плаваючим і 2.1 m з фіксованим. Цілочисельної фіксації не досягнуто: успіх залишається між 1 % і 3 % за 25 dBi, а за зареєстрованих 12 dBi задачу неможливо сформувати. MODELLED: модель обмеженої задачі трьох тіл із зазначеними спрощеннями та ілюстративними вхідними даними, не вимірювання будь-якої місячної величини. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Точність семипараметричного місячного датуму (три зсуви, масштаб і три повороти) з далекометрії земних станцій, з далекометрією між орбітальним апаратом і поверхневими станціями і без неї, із реального запуску рушія v0.40.0 на scenarios/lunar-infrastructure-frame-coestimation.toml. Сигма Крамера-Рао зсувів і поворотів зменшується з лініями до орбітального апарата (наприклад t_z з 0.98 m до 0.046 m); найменше власне значення інформаційної матриці зростає в 111 разів, а слід CRLB падає до 1.0 % (поріг F3 MET). Це припускає, що орбіта відома в місячних осях, а її похибка врахована сигмою дальності до орбітального апарата 1 m. MODELLED: модель обмеженої задачі трьох тіл із зазначеними спрощеннями та ілюстративними вхідними даними, не вимірювання будь-якої місячної величини. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Точність зсувів між положеннями одного космічного апарата за лазерною далекометрією, VLBI і GNSS залежно від похибки наземної локальної прив'язки, із реального запуску рушія v0.40.0 на scenarios/lunar-infrastructure-space-tie.toml (одна дуга 6.56 доби, сигми методів GNSS 10 m, VLBI 1 m, лазер 0.1 m). За локальної прив'язки від 1 mm до 1 m сигма зсуву «лазер мінус GNSS» залишається близько 1.04 m, доки прив'язка не досягне 1 m: її обмежує шум вимірювань методів, а не локальна прив'язка. Нижня межа, задана лише прив'язкою, — це квадратний корінь із двох, помножений на її сигму. MODELLED: модель обмеженої задачі трьох тіл із зазначеними спрощеннями та ілюстративними вхідними даними, не вимірювання будь-якої місячної величини. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Яке сімейство спостережуваних чутливе до місячних чисел Лява h2, k2 і l2, із реального запуску рушія v0.40.0 на scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Кожна комірка — середньоквадратична частинна похідна спостережень сімейства за параметром, у власних одиницях сімейства (тож комірки порівнюють уздовж рядка, а не вниз по стовпцю); тире означає, що сімейство не має чутливості. лазерна далекометрія: h2 7.6, k2 немає, l2 9.8. супровід орбітального апарата: h2 немає, k2 0.00086, l2 немає. поверхневий гравіметр: h2 2.9e+03, k2 4.3e+03, l2 немає. поверхневий годинник: h2 2.8e-17, k2 2.8e-17, l2 немає. З усіма чотирма сімействами сигма Крамера-Рао становить 0.36 % від номінального h2, 0.52 % від k2 і 1.16 % від l2. Додавання сімейства жодного разу не зменшило найменше власне значення (28 із 28 додавань), але слід псевдооберненої матриці не збільшився лише в 16 із 28: ця половина порогу G3 має статус NOT MET. Сімейство орбітального апарата бачить інтеграл уздовж лінії візування прискорення k2, оцінку з верхнього краю. MODELLED: модель обмеженої задачі трьох тіл із зазначеними спрощеннями та ілюстративними вхідними даними, не вимірювання будь-якої місячної величини. Консультативно: результат аналізу з дослідницького та інженерного інструмента, не навігаційне обладнання із затвердженням типу і не служба безпеки життя.">
</picture>

**Статус у реєстрі: MODELLED, і три пороги мають статус NOT MET.** Числові розрахунки перевірено незалежними
програмами на numpy і scipy; ніщо не порівнюється з вимірюванням місячної величини, і ніщо не є
VALIDATED. Досягнуто: два розв'язки орбіти узгоджені (середнє q 5.81 проти очікуваних 6), а лінії до орбітального апарата
підвищують найменше власне значення датуму приблизно в 111 разів, якщо орбіта відома. **Не досягнуто**:
внесена похибка моделі 3e-10 m/s2 **не виявляється** (C3: бортовий розв'язок відомий з точністю близько 350 m, тож
близько десяти метрів ховається в його коваріації); **цілочисельної фіксації не досягнуто** (успіх 1–3 % за
25 dBi, а за зареєстрованих 12 dBi задачу неможливо сформувати); і половина G3 щодо сліду при додаванні
сімейства спостережуваних (слід зріс у 12 із 28 додавань, щоразу тому, що сімейство підвищило ранг).
Кожен промах закріплено тестом. [Місячна інфраструктура](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Відкрийте [kshana.dev/studio](https://kshana.dev/studio/), і весь рушій працюватиме у вашому
браузері, скомпільований у WebAssembly. Нічого не треба встановлювати, і нічого не вивантажується. Studio має
два подання того самого рушія, і перемикач у заголовку переходить між ними, зберігаючи
сценарій, подання і будь-які змінені вами налаштування.

**Просте подання** — це те, з чого відкривається Studio. Воно починається із запитань (скільки супутників
я бачу, чи можу я довіряти своєму розв'язку положення, як довго годинник може втримувати час, що глушник робить
із моїм приймачем) і з карти всього, що вміє рушій, кожна область зі своєю часткою
перевірених методів. Відкрийте сценарій, і відповідь буде першою: одне просте речення, написане для
того, що вимірює цей сценарій, потім його ключові показники і графік. Показано щонайбільше п'ять налаштувань,
тих, що найбільше змінюють відповідь; решта чекають у розділі **Розширені налаштування**.
**Як це обчислюється** пояснює метод, а **Для дослідників** дає власні
показники рушія, файл сценарію, код для запуску з Python і цитування.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, просте подання, на вбудованому сценарії integrity-raim, рушій v0.40.0 працює локально. Запитання: чи відповідає геометрія межам тривоги (горизонтальний і вертикальний рівень захисту)? Спершу відповідь із позначкою «Результат наживо»: Так, здебільшого: протягом 95.3 % з 12 h. Межа похибки приймача залишалася в межах тривоги (40 m горизонтально і 50 m вертикально) у 344 з 361 перевірок, і жоден розв'язок не був оманливим. Ключові показники: час, коли розв'язку можна довіряти, 95.3 %, найдовша перерва 10 min, типова межа похибки 6.5 / 13 m, оманливих розв'язків 0. Поруч — «Спробуйте інші налаштування» з п'ятьма з них (похибка дальності, дві межі тривоги, тривалість і маска кута підвищення) і «Запустити знову», далі згорнуті розділи «Розширені налаштування» (ще 13), «Як це обчислюється» (8 перевірених, 6 змодельованих) і «Для дослідників». Нижче — подання цього результату і рівні захисту на графіку порівняно з межею тривоги." width="100%">
</picture>

**Розширене подання** — це повна панель: бібліотека сценаріїв, п'ять пронумерованих кроків
(Вибрати, Налаштувати, Запустити, Прочитати результати, Поділитися або експортувати), ключові показники з позначками PASS і FAIL
там, де запуск зазначає поріг, і кожна панель: огляд, графіки, карти, повтор,
звіт рушія і експорт. Одне поле пошуку охоплює сценарії, домени і поля всередині
них, і ви можете закріпити до чотирьох запусків і порівняти їх поруч.

<details>
<summary>Початковий екран простого подання і розширене подання після запуску</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, просте подання, початковий екран із заголовком «Що ви хотіли б дізнатися?», з рушієм v0.40.0 наживо і, у верхній панелі, трьома посиланнями: Training debrief, Interference map і Receiver trust. Чотири запитання: скільки супутників я бачу будь-де на Землі, чи можу я довіряти своєму розв'язку положення, як довго годинник може втримувати час без супутників і що глушник робить із моїм приймачем. Під першим — його записаний результат: щонайменше 22 видимі супутники в кожному місці і 31 у середньому з GPS, Galileo, BeiDou і GLONASS разом, розв'язок можливий у 100 % місць і моментів часу, на карті світу з видимими супутниками, з кнопкою «Відкрити цей результат». Поруч — «Усе, що вміє Kshana»: 16 областей і 139 готових до запуску сценаріїв, кожна плитка з невеликим графіком записаного запуску і своєю часткою перевірених методів, і 173 з 350 можливостей у реєстрі перевірено." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, розширене подання, після запуску вбудованого сценарію constellation-multi-gnss-coverage (Чотири сузір'я GNSS, одна карта), рушій v0.40.0 працює локально. Ліворуч бібліотека сценаріїв, 139 сценаріїв у 16 доменах. П'ять кроків «Вибрати», «Налаштувати», «Запустити», «Прочитати результати» і «Поділитися або експортувати», поточний крок 4. Ключові показники: 102 супутники, доступність 100 % (PASS), медіанний геометричний фактор точності положення (PDOP) 0.95 (PASS), 95-й процентиль PDOP 1.105 (PASS), 31.03 видимих супутника в середньому і щонайменше 22. Нижче — рядок панелей з вибраним «Покриттям», панель повтору, карта світу середнього PDOP від 0.831 до 1.0853 з кожним намальованим супутником і глобальні показники покриття." width="100%">
</picture>

</details>

Вихідний код Studio і примітки щодо збирання є у [`web/README.md`](web/README.md).

### Сайт

Решту [kshana.dev](https://kshana.dev) зібрано з власних файлів цього репозиторію і
запусків рушія: місії, можливості, реєстр доказів, опубліковані дослідження і
редакції.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Три сторінки kshana.dev поруч. Головний банер: рядок назви Kshana · क्षण · точна мить над заголовком «Відрепетируйте хвилину, коли GNSS зникає», з консоллю місії реального запуску рушія v0.40.0 (глобус і три графіки наживо: похибка часу годинника, відношення потужності несівної до спектральної густини шуму і рівень захисту). Докази, опубліковані дослідження: шість статей arXiv, побудованих на відкритому рушії, найновіша з рисунком рушія. Редакції, Kshana Pro, той самий рушій, підсилений: Free запускає один сценарій, Pro відповідає на запитання програми." width="100%">
</picture>

<a id="capabilities"></a>
## Можливості

Один рушій охоплює весь ланцюг збою, від першого заглушеного супутника до останньої
наносекунди holdover годинника. Рушій має 92 види сценаріїв; `kshana kinds` перелічує
їх, а [`docs/SCENARIOS.md`](docs/SCENARIOS.md) документує кожне поле.

| Можливість | На що відповідає |
|---|---|
| [Спектр](docs/SPECTRUM.md) | як глушник захоплює L-діапазон GNSS, смуга за смугою, секунда за секундою |
| [Годинники і синхронізація часу](docs/TELECOM-TIMING.md) | як довго кожен годинник утримує час після втрати GNSS |
| [Сузір'я навколо будь-якого тіла](docs/CONSTELLATION-DESIGN.md) | покриття, геометричний фактор точності і доступність навколо Землі, Місяця або Марса |
| [Сонячна система](docs/SOLAR-SYSTEM.md) | де перебуває кожна планета і час поширення світла для будь-якої лінії |
| [Навігація на низькій навколоземній орбіті](docs/LEO-PNT.md) | проліт, лінія, навігаційне повідомлення і злитий розв'язок, етап за етапом |
| [Кампанії](docs/CAMPAIGNS.md) | ланцюгова місія, перебір параметрів або ансамбль Монте-Карло в одному сценарії |
| [Анімація](docs/ANIMATION.md) | часові ряди запуску як анімований рисунок, програвач або кадри |
| [Звіти](docs/REPORTS.md) | кожен показник з одиницею і позначкою, в HTML (HyperText Markup Language) і JSON (JavaScript Object Notation) |
| [Експорт для сумісності](docs/INTEROP.md) | орбіти і геометрія для інших інструментів: SP3, CCSDS OMM і OEM, CZML, KML, GeoJSON, STK і SigMF |
| [Морська довіра](docs/MARITIME-TRUST.md) | чи може місток довіряти цьому розв'язку: оцінка 0-100 і причини для NMEA судна, наживо або з журналу (консультативно, не навігаційне обладнання із затвердженням типу) |
| [Навчальні потоки NMEA](docs/NMEA-TRAINING.md) | синтетичний NMEA містка із заскриптованим глушінням і спуфінгом та журналом інструктора, для навчання екіпажу (лише текст; ніколи не для робочих навігаційних систем судна; консультативно, не навігаційне обладнання із затвердженням типу) |
| [Карта завад](docs/INTERFERENCE-MAP.md) | де повітряні судна і кораблі повідомляли про погіршені навігаційні дані і яку частину маршруту це зачіпає |
| [Область джерела](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | де за зазначених припущень може бути джерело погіршених звітів про положення: області із зазначеною довірчою ймовірністю, центроїд із його еліпсом, ніколи не точка (MODELLED; `kshana interference-map locate`) |
| [Пакети доказів](docs/EVIDENCE-PACKS.md) | підписаний технічний запис, який можна перевірити офлайн, про вікно журналу судна і те, що рушій із нього обчислив, для звіту про інцидент (консультативно, не навігаційне обладнання із затвердженням типу) |
| [Телеметрія довіри](docs/TRUST-TELEMETRY.md) | потік довіри як метрики Prometheus, події SIEM і необов'язково OpenTelemetry, із прикладом панелі Grafana (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K і OpenCPN](docs/MARINE-INTEGRATIONS.md) | оцінка довіри на сервері Signal K човна і в OpenCPN, з еталонним збиранням для невеликого комп'ютера поруч із приймачем (консультативно, не навігаційне обладнання із затвердженням типу) |
| [Експорт для випробувального стенда](docs/TEST-BENCH.md) | `kshana bench-export`: рух транспортного засобу і події сценарію для лабораторного симулятора GNSS (сигнал не записується) і як потім оцінити журнал приймача |
| [Відповідність і звіт про відповідність](docs/compliance/README.md) | `kshana compliance-report`: для яких рядків публічних рамок стійкості набір запусків підтримує докази і яка прогалина залишається |
| [Блокноти](notebooks/README.md) | інтерактивні посібники: довіра до судна і навчальні потоки, експозиція маршруту на карті завад, відповідність і випробувальний стенд, квантовий проти класичного GDOP |
| [Верифікатор Galileo OSNMA](docs/OSNMA.md) | дані яких супутників приймач може криптографічно автентифікувати і чому перевірка не проходить; Kshana не надає жодних прав за EU OSNMA ICD IPRs (див. NOTICE на сторінці) |

Формати експорту повністю: SP3 — це Standard Product 3; CCSDS OMM і OEM — повідомлення
середніх елементів орбіти та ефемерид орбіти (Orbit Mean-elements і Orbit Ephemeris Messages) Consultative Committee for Space Data
Systems; CZML і KML — мови розмітки Cesium і Keyhole; STK — це Systems Tool Kit;
SigMF — це Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Ланцюгова кампанія campaign-jam-spoof-holdover-integrity, один реальний запуск рушія (зерно 20260928): 6 фаз (Номінальна робота → Глушіння → Спуфінг → Holdover → Тривога цілісності → Відновлення) і 18 запусків-учасників на сітці 10 s протягом T+01:16:10. Три доріжки: похибка часу годинника проти запобіжної межі 50 ns (пік 62.7 ns), ефективне відношення потужності несівної до спектральної густини шуму проти нижньої межі 25 dB-Hz (мінімум -12.2 dB-Hz) і вертикальний рівень захисту проти межі тривоги 50 m (пік 135.4 m), з подіями тривоги запуску: T+00:20:00 тривога РЧ-детектора спуфінгу (злиті монітори узгодженості, потужності і якості сигналу); T+00:26:10 тривога монітора спуфінгу з допомогою годинника." width="100%">
</picture>

<details>
<summary>Кожна можливість, намальована з реального запуску: водоспад L-діапазону, карта покриття, Сонячна система і проліт на низькій навколоземній орбіті</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="L-діапазон GNSS як одна спектральна густина потужності протягом 60 s, із реального запуску виду spectrum (l-band-waterfall-jamming.toml, зерно 7, рушій v0.40.0): частота по горизонталі, час донизу, колір для потужності над рівнем шуму -202.0 dBW/Hz. Глушники: chirp-пристрій приватності (chirp, увімкнено на 10 s, вимкнено на 40 s); тон CW на L1 (cw, увімкнено на 30 s); вузькосмуговий шум L2 (narrowband, увімкнено на 45 s). Найгірша смуга GPS L1 C/A: мінімальне ефективне C/N0 3.2 dB-Hz на 31 s проти порогу супроводу 25 dB-Hz. GPS L1 C/A мінімум 3.2 dB-Hz; Galileo E1 мінімум 4.7 dB-Hz; GPS L2C мінімум 36.9 dB-Hz; GPS L5 мінімум 44.1 dB-Hz; Galileo E5a мінімум 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Видимі супутники над усією Землею протягом однієї доби, із реального запуску constellation-design (constellation-multi-gnss-coverage.toml, рушій запущено цим генератором): 102 супутники (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Кожну 10-градусну комірку затінено за середньою кількістю супутників над 10-градусною маскою (від 27.2 до 36.5); точки — це відліки наземної траси рушія, один на годину на супутник. Глобальна доступність 100.00 % за PDOP не більше 6, медіанний PDOP 0.95, у середньому 31.0 і щонайменше 22 видимі супутники." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Сонячна система на епоху сценарію 2026-09-28T00:00:00, із реального запуску виду solar-system (solar-system-tour.toml): Сонце, 9 планет і карликова планета Плутон, вигляд згори над екліптикою, відстані логарифмічно стиснуті для відображення, з однобічним часом поширення світла від Землі для кожного тіла. Меркурій 0.47 au, 10.1 світлової хвилини, VALIDATED; Венера 0.73 au, 3.0 світлової хвилини, VALIDATED; Марс 1.55 au, 14.0 світлової хвилини, VALIDATED; Юпітер 5.30 au, 49.5 світлової хвилини, VALIDATED; Сатурн 9.44 au, 70.2 світлової хвилини, VALIDATED; Уран 19.44 au, 157.4 світлової хвилини, MODELLED; Нептун 29.88 au, 240.2 світлової хвилини, MODELLED; Плутон 35.61 au, 292.2 світлової хвилини, MODELLED. Лінії: Марс–Юпітер в один бік 2193.5 s; Сатурн–Земля в один бік 4212.2 s; Європа–Юпітер в один бік 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Один проліт на низькій навколоземній орбіті (LEO) із реального запуску виду leo-pass (leo-pass-iridium.toml, рушій запущено цим генератором): Iridium-pass на висоті 781 km, смуга STL на 1621 MHz, видимий для повітряного користувача на 50° N 30° W. Над маскою 5° протягом 750 s, максимальний кут підвищення 65.0° на 444 s. Відношення потужності несівної до спектральної густини шуму досягає піку 80.5 dB-Hz (медіана 71.3), на 34.3 dB вище за медіану GNSS 46.2 dB-Hz від 8 видимих супутників GPS (від 38.2 до 51.1 dB-Hz); доплерівський зсув досягає 35.4 kHz." width="100%">
</picture>

Запустіть будь-який із них командою `kshana example <scenario> > s.toml && kshana s.toml`: сценарії —
`l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
і `leo-pass-iridium`.

</details>

<details>
<summary>Морські можливості та можливості щодо завад, намальовані із закомічених синтетичних вхідних даних: оцінка довіри, карта завад з експозицією маршруту, навчальний потік і пакет доказів</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Оцінка довіри протягом одного синтетичного переходу, із реального запуску рушія v0.40.0 на examples/maritime-trust (вигаданий журнал NMEA порома на маршруті Таллінн–Гельсінкі, 3001 епоха з частотою 1 Hz). Три доріжки мають спільну часову вісь. Угорі: відстань між положенням, яке повідомляє приймач, і справжнім положенням судна, що залишається в межах кількох метрів приблизно до 1576 s, коли заскриптоване в журналі відтягування положення відводить його вбік, тоді як приймач і далі повідомляє дійсний розв'язок. Посередині: оцінка довіри від 0 до 100, яка не обчислюється протягом перших 300 s калібрування, у номінальному діапазоні (щонайменше 90) до відтягування, а потім падає через погіршений діапазон (щонайменше 55) до недовіреного діапазону. Унизу: діапазон кожної епохи як кольорова стрічка з назвою. Оцінка консультативна. Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу (IEC 61108, IEC 61162): відповідальність за навігацію судна залишається на операторі. Журнал вигадано, щоб показати формат і монітори; він не є вимірюванням і нічого не каже про те, як працював би будь-який приймач." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Дві синтетичні доби карти завад, побудовані із закомічених зразків у examples/interference-map/output, кожна зі своїм синтетичним маршрутом і частками експозиції маршруту, які повідомляє рушій. Ліворуч доба ADS-B: 1 погіршена комірка, 6 не погіршених, 4 неоцінені (заштриховані) і комірки без запису, намальовані порожніми, які не спостерігалися. Маршрут має 525 km: 11.5% його довжини в погіршених комірках, 38.3% у не погіршених, 9.1% у неоцінених і 41.1% у тих, що не спостерігалися. Праворуч доба AIS: комірки, позначені детекторами кола і суходолу, неаномальні комірки і порожні комірки; маршрут має 454 km, з них 10.5% в аномальних комірках, 21.2% у неаномальних, 0.0% у неоцінених і 68.3% у тих, що не спостерігалися. ADS-B і AIS — окремі шари, ніколи не об'єднані. Позначена комірка не є висновком про завади, а комірка без кольору не спостерігалася, що не те саме, що чисто. Усі дані вигадані, розташовані у відкритій частині середньої Атлантики, і не є вимірюванням." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Навчальний потік зі сценарію coastal-drag-off (рушій v0.40.0, зерно 22, 25 хвилин з одним розв'язком на 10 s журналу інструктора). Карта показує справжню траєкторію судна і траєкторію, яку повідомляє приймач: вони збігаються, доки на 421 s не починається заскриптоване відтягування положення, потім повідомлена траєкторія відходить від справжньої, тоді як приймач зберігає дійсний розв'язок, і повертається, коли подія закінчується на 1140 s. Поруч — відстань між двома траєкторіями в часі і середнє відношення потужності несівної до спектральної густини шуму, яке повідомляє приймач і яке підіймається до одного підвищеного рівня на час події. Синтетичні навчальні дані, згенеровані Kshana. Лише для навчання і тестування: ніколи не подавайте цей потік у робочі навігаційні системи судна. Консультативно, не навігаційне обладнання із затвердженням типу. Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу (IEC 61108, IEC 61162): відповідальність за навігацію судна залишається на операторі. Положення, дати і траєкторії вигадано." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Структура пакета доказів. Журнал приймача (NMEA, u-blox UBX, RINEX 3 або журнал Android) і часове вікно надходять у kshana receiver-trust evidence, який записує сім файлів: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig і необов'язковий timestamp.tsr. Маніфест записує SHA-256 усього журналу і кожного файлу та хеш-ланцюжок по файлах; підпис покриває маніфест. kshana evidence verify перевіряє підпис, хеш кожного файлу, ланцюжок і відсутність неперелічених файлів і завершується з кодом 0, коли перевірено, 1, коли щось не вдалося, і 3, коли підписувача не закріплено. Пакет — це технічний запис, а не юридичний висновок." width="100%">
</picture>

Усі чотири — вигадані дані і мають консультативний характер: вони показують формат і поведінку програмного забезпечення, а не те, як будь-який приймач чи система працює в умовах завад. Запустіть перший командою `kshana receiver-trust examples/maritime-trust/session.toml`, другий — командою `kshana route-exposure` на зразках у `examples/interference-map/`, третій — командою `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (лише для навчання: ніколи не подавайте його в робоче навігаційне обладнання), а четвертий — як у [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Повна таблиця можливостей, домен за доменом</summary>

Далі наведено повну деталізацію за доменами; реєстр зрілості для кожної можливості див. у
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) і [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Домен | Можливість |
|--------|------------|
| **Орбіта і геометрія** | Поширення SGP4/SDP4 (перевірено до 4.12 mm на всіх 666 векторах AIAA 2006-6753); реальні дворядкові елементи (закомічений знімок Celestrak `gps-ops` із датою) або синтетичні сузір'я Walker-delta, чиї середні елементи реалізують формулу `i:T/P/F` з похибкою менше 1 km за 24 h поширення; видимість кількох сузір'їв, **геометричні фактори точності — геометричний, положення, горизонтальний, вертикальний і часу (GDOP/PDOP/HDOP/VDOP/TDOP), перевірені до 1e-6 за gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), і доступність GNSS; безградієнтний оптимізатор проєктування сузір'їв, визначення мінімальної кількості супутників методом streets-of-coverage, інструмент порівняння кількох сузір'їв і **перебір проєктів** Walker, що табулює покриття / PDOP / час повторного огляду на сітці площини × супутники і повідомляє Парето-оптимальні проєкти. |
| **Числовий пропагатор** | Числовий пропагатор **Cowell** (`src/propagator.rs`), що доповнює аналітичний шлях SGP4/SDP4, з ієрархічною моделлю сил із **семи збурень** (`src/forces.rs`): задача двох тіл + повне **зональне поле J2–J6** (зональні гармонічні коефіцієнти сплюснутості Землі від J2 до J6; точний аналітичний градієнт його збурювального потенціалу), необов'язковий **тесеральний сферично-гармонічний геопотенціал EGM2008 до степеня/порядку 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; реальні коефіцієнти NGA — US (United States) National Geospatial-Intelligence Agency, нормалізована рекурсія Лежандра Holmes–Featherstone, перехресно перевірена із замкненими функціями Лежандра і аналітичною тотожністю ∇V), гравітація **третіх тіл Сонця і Місяця, керована епохою** (вбудовані ефемериди низької точності, без ядра DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel), **тиск сонячного випромінювання** (модель гарматного ядра з конічною тінню umbra+penumbra), **атмосферний опір** (кусково-експоненційна густина Vallado, атмосфера, що обертається разом із Землею), **постньютонівська релятивістська поправка Шварцшильда** і член **захоплення системи відліку Лензе–Тіррінга** (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, лінійний за моментом імпульсу Землі, на ~1–2 порядки менший за Шварцшильда) — з вибором одного з двох адаптивних інтеграторів (RK4 — Рунге–Кутти четвертого порядку — з подвоєнням кроку або вкладена пара **Dormand–Prince RK5(4)**). **Перевірено за Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 епох на LEO (низькій навколоземній орбіті) + GTO (геоперехідній орбіті), рівні консервативних сил збігаються в найгіршому випадку до **\|Δr\| 0.08 m за 24 h** (`tests/numerical_cowell_propagator_reference.rs`); рівень атмосферного опору охарактеризовано окремо (≈ 333 m / 24 h), а абсолютні вхідні дані ефемерид Сонця/Місяця і густини чесно залишаються **Modelled**. Додаткові внутрішні докази (не зовнішня валідація): незбурену орбіту перевірено за точним розв'язком Кеплера в універсальних змінних до **менше метра за 24 h**, енергія/момент імпульсу зберігаються до ~1e-9, і кожне збурення збігається з виведеною вручну замкненою сигнатурою. |
| **Маневри і проєктування траєкторій** | Імпульсні вузли ΔV з поширенням коваріації 6×6 (системи похибок виконання ECI — Earth-centred inertial — / LVLH — local vertical, local horizontal), інтегрування скінченного ввімкнення двигуна, перевірене за замкненим рівнянням ракети **Ціолковського** до < 0.01 %, однообертовий розв'язувач **Ламберта** **Izzo-2015**, точний пропагатор **Кеплера** в універсальних змінних і перебір **porkchop** (запуск × прибуття) C3 (енергії запуску) / V∞ прибуття, що видається як JSON-сітка контурів — шар моделювання характеристик над GMAT/Orekit, де кожен вихід Ламберта перевіряється туди й назад за істиною задачі двох тіл, а мінімум porkchop перевіряється за аналітичною нижньою межею Гомана. |
| **Системи часу і системи відліку** | Шкали **UTC / TAI / TT / UT1** із секундами координації IERS (Coordinated Universal Time, International Atomic Time, Terrestrial Time і час обертання Землі Universal Time 1), API (інтерфейс прикладного програмування) для юліанських дат, **Earth Rotation Angle** (ERA) IAU-2000 (International Astronomical Union), перетворення **TEME ↔ ECEF** на основі GMST (Greenwich Mean Sidereal Time) (true equator, mean equinox ↔ Earth-centred, Earth-fixed) з геодезичними системами WGS-84 (World Geodetic System 1984), прецесія IAU 2006 (Fukushima–Williams), повна **нутація IAU 2000A/2000B**, **рух полюсів** IERS і вільна від рівнодення **редукція GCRS↔ITRS на основі CIO IAU 2006/2000A** (CIO = Celestial Intermediate Origin) — усе перевірено **біт у біт** за векторами SOFA/ERFA і **незалежно перехресно перевірено за ANISE** (повторна реалізація NAIF/SPICE на чистому Rust; NAIF = Navigation and Ancillary Information Facility NASA, US National Aeronautics and Space Administration): GCRS→ITRS kshana проти ITRF93 (International Terrestrial Reference Frame 1993) ANISE з `earth_latest_high_prec.bpc` JPL, з тими самими параметрами орієнтації Землі IERS для обох, збігаються до **≤ 0.86 m на землі / ≤ 3.6 m на орбіті GNSS** (макс. 0.028″) на восьми епохах 2020–2023. |
| **Інерціальна навігація** | Тривісна безплатформна INS — кватерніонна орієнтація, механізація WGS-84 NED (north-east-down), компенсація конічного руху/sculling і детермінована модель похибок IMU (масштабний коефіцієнт, перекіс осей, g-чутливість, квантування, дрейф); **акселерометр на холодноатомному інтерферометрі з перших принципів** (фаза Маха–Цендера, квантовий проєкційний шум, спадання контрасту, вібраційний зв'язок), який *виводить* коефіцієнт випадкового блукання швидкості; і **фільтр частинок** із послідовною вибіркою за значущістю з перевибіркою для навігації без GPS з допомогою карти (з прив'язкою до рельєфу/гравітації). |
| **Alt-PNT (без GPS)** | **Модель вимірювань гравіметра** на холодних атомах, чий рівень білого шуму (`σ = ASD/√τ`, ASD = амплітудна спектральна густина) виведено з фізики акселерометра CAI; повністю нормалізоване **сферично-гармонічне поле гравітаційних аномалій** низького степеня (перевірене за замкненими функціями Лежандра і виведеною вручну однотермовою аномалією) плюс синтетичні маскони; **ядро синтезу гравітаційних функціоналів** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — «читач карти», з яким звіряється навігатор з допомогою гравітації, — перевірено за **стандартом нормальної гравітації GRS80** (Geodetic Reference System 1980): він відтворює замкнену нормальну гравітацію Сомільяни і опубліковані γ_e / γ_p до **3.5e-12** і дає фізично обмежену карту збурень із реального поля **EGM2008** ICGEM (International Centre for Global Earth Models) (RMS — середньоквадратичне значення — ≈ 26 mGal, макс. ≈ 89 mGal за ступеня/порядку 70; `tests/icgem_gravity_reference.rs`); і **фільтр частинок зіставлення з гравітаційною картою**, що відновлює траєкторію без GPS з послідовності аномалій, крізь які вона пролітає. Він поширюється на **навігацію з прив'язкою до рельєфу** (TERCOM/SITAN — terrain contour matching / Sandia Inertial Terrain-Aided Navigation — за SRTM (Shuttle Radar Topography Mission) `.hgt` DEM (цифровою моделлю висот), `src/altpnt/terrain.rs`), **головне геомагнітне поле IGRF-14** (14-те покоління International Geomagnetic Reference Field) до степеня/порядку 13 (`src/igrf.rs`, перевірено за замкненою формою нахиленого диполя і скінченними різницями ∇V) і **комбінований навігатор гравітація + магнетизм + рельєф**, що зливає всі три скалярні канали через один фільтр частинок (інформація адитивна — жоден канал не погіршує розв'язок). **60-хвилинний бенчмарк без GPS** (перерва ~700 km / одна година, за якої інерціальний розв'язок дрейфує до ~70 km) відновлюється до **~145 m (< 500 m)** ієрархічним зіставлювачем від грубого до точного — ціль ESA NAVISP (Navigation Innovation and Support Programme) *Quantum Wayfarer*. |
| **Злиття** | Слабко зв'язаний 15-станний EKF (розширений фільтр Калмана) похибок стану GNSS/INS зі зворотним зв'язком у замкненому контурі (пакет `gnss-ins`); **тісно зв'язане** оновлення за псевдовідстанями, яке продовжує коригувати за менш ніж чотирьох супутників; зв'язаний фільтр **годинник + положення**; загальний **нецентрований (sigma-point) фільтр Калмана** для сильно нелінійних вимірювань; тісно зв'язаний **навігатор UKF** GNSS/INS (псевдовідстань + Доплер), чий орбітальний вибіг за моделлю сил перевірено на самоузгодженість до **0.77 m RMS** на 30-хвилинному вигнутому пролітанні LEO, що включає 120-секундну перерву GNSS (показник узгодженості фільтра, не валідація зовнішнім оракулом — цей навігатор залишається MODELLED); і повний **17-станний тісно зв'язаний UKF GNSS/INS** (положення, швидкість, похибка орієнтації, зміщення акселерометра і гіроскопа, зміщення і дрейф годинника), чиє **квантове CAI-зчислення** проходить 120-секундну перерву на виведеному випадковому блуканні швидкості холодноатомного акселерометра. |
| **Визначення орбіти** | Відновлення орбітального стану `[r, v]` з далекометричного супроводу наземними станціями, що поєднує модель сил задача двох тіл + J2 та інтегратор RK4 з **пакетним** коректором **Гаусса–Ньютона** (`determine_orbit_batch`, менше метра / mm·s⁻¹ з дальностей без шуму, ~2 m за рівня шуму 5 m) і **послідовним** варіантом із нецентрованим фільтром (`determine_orbit_sequential`). |
| **Спостережуваність і теорія оцінювання** | Загальний повторно використовуваний шар **інформації Фішера / Крамера–Рао** (`src/fim.rs`): інформаційна матриця M = HᵀWH, **нижня межа Крамера–Рао**, **ранг спостережуваності і нуль-простір дефекту датуму** (псевдообернена Мура–Пенроуза) і скаляри планування експерименту **D/A/E/T-оптимальності** із симетричного власного розв'язувача Якобі. **Перевірено** — власні значення проти `numpy.linalg.eigh`, коваріація CRLB проти σ²(XᵀX)⁻¹ через `numpy.linalg.inv`, і DOP GNSS з інформаційної матриці, усе збігається до **1e-9** (`tests/fim_observability_reference.rs`), а також додатково перехресно перевірено за замкненими межами **Kay (1993)** з досягненням CRLB методом Монте-Карло. Він лежить в основі рушія DOP, CRLB пасивної геолокації і місячної **теореми спостережуваності** абсолютної станції (нижче). |
| **Місяць і цисмісячний простір** | Пропагатор **колової обмеженої задачі трьох тіл (CR3BP)** Земля–Місяць в обертовій системі — зі збереженою сталою Якобі і всіма п'ятьма точками Лагранжа (`src/cr3bp.rs`) — тепер із **матрицею переходу стану (STM) 6×6 і диференційним коректором одинарної стрільби** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`), що дає справді періодичні **гало / NRHO** (near-rectilinear halo orbit) орбіти: STM перевірено за скінченними різницями, скориговані орбіти замикаються до машинної точності, а задання опублікованого стану в апоселенії відтворює **південну NRHO 9:2 навколо L2** (L2 = друга точка Лагранжа Земля–Місяць; орбіта Gateway) з періодом ≈ 6.57 d / периселенієм ≈ 3,250 km, що узгоджується з опублікованими ≈ 6.56 d / ≈ 3,370 km (розв'язок CR3BP — коловий, без Сонця, — **не** перевірений за реальними ефемеридами LANS (Lunar Augmented Navigation Service)/Gateway; селеноцентричне перетворення MCI/MCMF (Moon-centred inertial / Moon-centred, Moon-fixed) скоригованої орбіти — наступний крок); плюс цисмісячна геометрія PNT **LunaNet / LNIS** (LunaNet Interoperability Specification) (редукція MCI↔MCMF, селенографічні координати) з проходом **ARAIM на південному полюсі Місяця**, який чесно показує прогалину цілісності: σ_URE (похибка дальності користувача) ~30 m виводить рівень захисту значно вище межі тривоги 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); і **доповнення DOP поверхневими маяками** (`src/lunar_beacon.rs`), що показує, як кілька відзнятих поверхневих далекомірних маяків дають рядки прямої видимості з низьким кутом підвищення і широким азимутом, яких бракує набору лише з орбітальних апаратів над головою, — знижуючи погано обумовлений південнополярний GDOP і, через бюджет похибки за коренем із суми квадратів, реалізовану точність положення в метрах (з повторним використанням ядра DOP, перевіреного gnss_lib_py, і замкненої форми видимості безатмосферного горизонту; аналіз геометричного фактора точності описано в [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Набір місячного PNT** | Набір навігації для Місяця/цисмісячного простору поверх ядра CR3BP, кожен елемент — запускний `kind`: **Lunar Coordinate Time** (`lunar-time-offset`, `src/lunar_time.rs` — вікова швидкість LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL — її французька форма, Temps-Coordonnée Lunaire) з різниці власних потенціалів + кінетичного члена, повідомлена разом з опублікованим діапазоном 56–59 µs/day); геодезична спостережувана затримки **місячної VLBI** (інтерферометрії з наддовгою базою) (`lunar-vlbi`, `src/lunar_vlbi.rs` — затримка + швидкість різниці двох дальностей у ближній зоні для земної бази, перехресно перевірена за плоскохвильовою Δ-DOR (delta differential one-way ranging) з тієї самої кодової бази в границі дальньої зони, частинні похідні перевірено скінченними різницями); пакетний оцінювач **спільного багатометодного OD + годинника** (`lunar-joint-od-clock`, `src/lunar_combination.rs` — підгонка Гаусса–Ньютона, що зливає VLBI + місячні локальні дальності + міжсупутникові дальності) з результатом **спостережуваності за інформацією Фішера**: сама лише внутрішня далекометрія залишає **дефект датуму** твердого тіла з шістьма ступенями вільності, тож *абсолютне* положення поверхневої станції неспостережуване, доки не додано прив'язку до земної системи — затримка **VLBI** на земній базі *відновлює* спостережуваність для розрідженого сузір'я і *загострює* межу Крамера–Рао для насиченого, а абсолютний датум замикається на **трьох** неколінеарних земних станціях (результат спостережуваності описано в [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **реалізація системи відліку** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — 7-параметрична підгонка датуму Гельмерта + прив'язка орієнтації IAU 2015 WGCCRE — WGCCRE = IAU Working Group on Cartographic Coordinates and Rotational Elements); аналіз **обсягу обслуговування класу Moonlight/LCNS** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / покриття / доступність + узагальнена обвідна HPL/VPL (горизонтального/вертикального рівня захисту) місячного ARAIM, з повторним використанням ядра DOP, перевіреного gnss_lib_py, і механізму LunaNet σ_URE≈30 m); **місячний диференційний PNT** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — місячний аналог диференційного GNSS / системи супутникового функціонального доповнення (SBAS): точне скасування синфазної складової годинника + просторова декореляція першого порядку залежно від бази, з повторним використанням рівня захисту SBAS DO-229E — DO-229E є мінімальним стандартом робочих характеристик RTCA (раніше Radio Technical Commission for Aeronautics) для приймачів SBAS); і **експорт для сумісності з LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + перевірка туди й назад місячної шкали часу в місячній тілесній системі IAU 2015, загорнута в конверт KIF). Рівні доказів для кожної частини наведено в [матриці верифікації](docs/VERIFICATION-MATRIX.md): Lunar Coordinate Time, спільний оцінювач OD + годинника, реалізація системи відліку і геометрія обсягу обслуговування — **VALIDATED** (кожен за незалежним оракулом, названим у його рядку, як і шлях ядра затримки VLBI); спостережувана VLBI, результат спостережуваності дефекту датуму, диференційний PNT і експорт для сумісності — **MODELLED**. Параметри — **ілюстративні значення з публічних джерел** — **не** перевірені за реальним супроводом VLBI/Gateway, **не** пов'язані з жодною агенцією і не схвалені нею, без заяв про TRL (рівень технологічної готовності) / льотну спадковість. |
| **Далекий космос і PNT для Марса** | Відкритий **рушій радіометричної навігації**: ітеративний час поширення світла + релятивістська затримка **Шапіро**, двобічні/однобічні/трибічні **Доплер і дальність** (двоплечова модель Moyer), коефіцієнти когерентного перетворення транспондера, регенеративна/PN (псевдошумова) далекометрія (CCSDS 414, стандарт псевдошумової далекометрії) і **Δ-DOR** у картинній площині (CCSDS 506, стандарт Delta-DOR), із середовищами сонячної плазми/тропосфери/іоносфери; розбір + видача повідомлення даних супроводу **CCSDS-TDM (503)**; **квадратно-кореневий інформаційний фільтр зі зниженою динамікою** (емпіричні прискорення RTN — radial, transverse, normal — + 3-станний бортовий годинник + атмосферний опір Марса), що виконує **визначення орбіти Mars-LMO до ≈ 0.2 m** у синтетичному замкненому контурі; спільний оцінювач **злиття однобічних + двобічних** вимірювань; ядро динаміки кількох тіл (`Body{μ, re, zonals, gravity, IAU-pole}`, гравітація Mars GMM-3 (Goddard Mars Model 3), тілесна система Марса IAU, змінний інтерфейс `EphemerisProvider`, двочастинні юліанські дати + TT↔TDB (Barycentric Dynamical Time)); і сценарій ретрансляційного PNT **`mars-pnt`** (ареостаціонарне ретрансляційне сузір'я MARCONI) з наскрізним **симулятором характеристик GSE** (GSE = наземне обладнання підтримки) (геометрія → бюджет лінії → спостережувані → SRIF → коваріація). **Перевірено симуляцією** (показники якості коваріації / замкненого контуру); геліоцентричну динаміку Марса перехресно перевірено за JPL **DE440** (137 m на дузі в 1 добу, `xval/anise-mars-od`). Валідація за реальними даними супроводу DSN/ESTRACK є в дорожній карті. |
| **Сонячна система і PNT навколо будь-якого тіла** | **Ефемериди всієї Сонячної системи** без ядер (`src/ephem.rs`, `src/ephem_provider.rs`): кожна планета з **кеплерових елементів Standish** JPL (Table 1, 1800–2050 AD; Tables 2a/2b, 3000 BC–3000 AD) з опублікованою номінальною похибкою кожної планети, Земля і Місяць розділені за місячним рядом, а Фобос, Деймос, Іо, Європа, Ганімед, Каллісто і Титан — із середніх елементів JPL і моделі обертання IAU (International Astronomical Union); **будь-яке тіло відносно будь-якого іншого** в ICRF (International Celestial Reference Frame). `Body` тепер містить **GM (гравітаційний параметр), радіуси, J2 (другу зональну гармоніку), де її опубліковано, і полюс та нульовий меридіан IAU для вісімнадцяти тіл**. Вид **`solar-system`** повідомляє положення, швидкості, сталі, **час поширення світла і однобічну/двобічну дальність** між будь-якими двома тілами (наявний радіометричний розв'язувач часу поширення світла із сонячною затримкою Шапіро) і орбітальну траєкторію для кожного тіла — досить, щоб намалювати інтерактивну Сонячну систему; вид **`body-pnt`** визначає положення орбітального апарата або посадкового модуля **навколо будь-якого тіла** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) з локальним сузір'ям Walker, механізмом геометричного фактора точності і Гаусса–Ньютона та дальністю з Землі в далекому космосі. **Перевірено** за JPL Horizons (DE441, JPL Development Ephemeris 441): Меркурій–Сатурн і Земля з Table 1 у межах подвоєної номінальної похибки (найгірше 1.87×), усі вісім планет з Tables 2a/2b (найгірше 1.71×) і час поширення світла Земля–Марс/Юпітер. **Змодельовано**: Уран і Нептун з Table 1 (2.0× і 5.2× від заявленої похибки порівняно з DE441), Плутон, супутники і навігаційні результати `body-pnt`. |
| **Злитий PNT MEO + LEO** | `src/leo_fusion/`: системно-незалежні позиціювання, навігація і синхронізація часу на LEO для будь-якого сузір'я (оболонки Walker, набори елементів, пресети GNSS) і будь-якого сигналу (несівна, чипова швидкість, обвідна C/N0, похибка дальності сигналу в космосі), з необов'язковими однофайловими пресетами, що містять свої джерела (Xona Pulsar X1/X5, Iridium STL, сигнали можливості Starlink, CentiSpace, репрезентативна система C-діапазону, модель ефемерид з нульовим годинником ATOMIC). **`leo-pvt`**: пакетне **доплерівське позиціювання** за швидкістю зміни дальності (одно- і багатосупутникове, стани дрейфу годинника і швидкості, геометрія вздовж/поперек траси за один проліт і дзеркальний розв'язок), **спільний зважений метод найменших квадратів GNSS + LEO** з міжсистемними зміщеннями для кожної системи і сигмами для кожного сигналу, наданими користувачем, DOP залежно від кількості супутників LEO, покриття **полярних і арктичних** районів і **передавання часу через LEO до UTC** залежно від C/N0 і осцилятора. **`leo-ppp`**: EKF (розширений фільтр Калмана) плаваючого PPP (точного точкового позиціювання) лише з GNSS і з LEO, його час збіжності і тест узгодженості NEES за хі-квадрат. **`ntn-positioning`**: позиціювання в неназемній мережі 5G за межею Крамера-Рао для смуги пропускання. **Перевірено**: доплерівська обвідна LEO за опублікованими даними Iridium і Xona. **Змодельовано**: решта, з трендом PPP, порівняним із Li et al. (2019) — див. [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Цілісність** | RAIM — автономний контроль цілісності в приймачі — знімковий і з розділенням розв'язків (у стилі ARAIM), з горизонтальним/вертикальним рівнями захисту (HPL/VPL), виявленням і виключенням несправностей і діаграмами цілісності Stanford; рівень захисту **розділення розв'язків за кількома гіпотезами (MHSS)** з явним бюджетом ризику цілісності, включно з **режимом несправності всього сузір'я для двох/кількох сузір'їв** (EU (Європейський Союз) ARAIM / DO-316, стандарт характеристик RTCA для бортового обладнання GPS з бортовим функціональним доповненням), випробуваним на реальному знімку GPS + Galileo (`scenarios/araim-gps-galileo.toml`). Рівень захисту застосовує однобічну проєкцію **номінального зміщення** `b_k = Σ_i|s_i|·b_nom` для кожного режиму несправності і сигму **цілісності** σ_URA (точність дальності користувача; відмінна від сигми точності σ_URE, похибки дальності користувача) з Integrity Support Message — див. [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Ядро виявлення (пороги χ²/нецентрального χ²/нормального розподілу і K-множники) **зовнішньо перевірено за SciPy** на 171 випадку (`tests/raim_reference.rs`); геометрія повторно використовує ядро DOP, перевірене gnss_lib_py. Сам *розподіл бюджету* ризику цілісності ARAIM MHSS не має опублікованого числового оракула і чесно залишається Modelled. |
| **Функціональне доповнення (SBAS)** | **Рівні захисту SBAS / WAAS** (WAAS = Wide Area Augmentation System) у формі зваженого методу найменших квадратів DO-229E (K-фактори для точного заходу на посадку і маршруту) і **двочастотна вільна від іоносфери** комбінація **L1/L5** (L1 і L5 — дві цивільні смуги сигналів GPS; IS-GPS-705, специфікація інтерфейсу GPS для сигналу L5, γ₁₅ ≈ 1.793), що лежить в основі DO-316 — `src/sbas.rs`. Алгоритм рівня захисту **зовнішньо перевірено за форком RTKLIB SBAS-PL** (RTKLIB = відкрита бібліотека кінематичного позиціювання в реальному часі; PL = рівень захисту) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — попередня редакція DO-229 — App. J), запущеним на **реальних даних EGNOS** (European Geostationary Navigation Overlay Service), відтворюючи його HPL до < 2e-3 m (`tests/sbas_reference.rs`); gLAB (набір інструментів GNSS Laboratory) v6.0.0 підтвердив ідентичну конвенцію. |
| **Годинник і синхронізація часу** | Двостанний holdover за Калманом (коваріація у формі Джозефа, стан узгодженості NIS/NEES — нормалізований квадрат інновації / нормалізований квадрат похибки оцінювання); стабільність сімейства Аллана (ADEV / MDEV / TDEV / HDEV / MTIE — девіація Аллана, модифікована девіація Аллана, часова девіація і девіація Адамара та максимальна похибка часового інтервалу) з довірчими інтервалами для конкретного типу шуму і повною **п'ятикоефіцієнтною степеневою підгонкою IEEE-1139** (IEEE Std 1139, визначення метрології частоти і часу Institute of Electrical and Electronics Engineers) — оцінювачі перевірено на реальному обладнанні за **Stable32**: **реальний первинний цезієвий стандарт 5071A проти водневого мазера** (556,990 фазових відліків, 16 коефіцієнтів усереднення, OADEV/OHDEV — перекривна девіація Аллана/Адамара — до 1e-3; `tests/cs5071a_reference.rs`) і **канонічний регресійний ряд Stable32 PHASE.DAT** (139 коефіцієнтів усереднення, OADEV/MDEV/TDEV до 1e-3; `tests/phasedat_reference.rs`); оцінювачі ADEV/MDEV/TDEV і телекомунікаційну метрику блукання **MTIE** додатково перехресно перевірено за **незалежною бібліотекою allantools 2024.06** до **< 1e-9** на ряді NIST SP 1065 (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); геометричні поправки (Саньяка, спільний огляд GNSS); і робочі методи передавання — **TWSTFT** (двобічне супутникове передавання часу і частоти) із замкненою формою Саньяка BIPM (International Bureau of Weights and Measures), **спільний огляд GNSS**, вільне від іоносфери передавання часу **PPP** (точне точкове позиціювання), **оптична** лінія у вільному просторі зі сцинтиляцією від турбулентності і **(паперова) шкала часу ансамблю годинників** з оберненою дисперсією нижче найкращого годинника-учасника. **Калькулятор holdover годинника без GNSS** (`src/holdover.rs`) подає замкнений ріст похибки вибігу van-Loan як інверсію *holdover до порогу* — як довго годинник вільно працює, перш ніж його похибка часу перевищить бюджет, — для репрезентативних класів класичних і квантових годинників; **змодельовано** (перехресно перевірено за багатокроковою рекурсією коваріації `clock_state`), і чесно визнає, що для дуже стабільного годинника holdover до жорсткого порогу визначається *припущеною* нижньою межею шуму на довгих tau, а не процитованою ADEV. **Умовний рівень захисту часу** (`src/tpl.rs`) поширює holdover на спуфінг: межа *невиявленої* похибки часу за наявності незалежної перехресної перевірки, що складає нижню межу монітора k-сигма, дисперсію вибігу van-Loan за затримку виявлення і час до тривоги CUSUM (кумулятивної суми). Відкалібровано на реальному записаному спуфінгу (JammerTest 2024) і відтворюється через `cargo run --example tpl_jammertest`; композиція **MODELLED** (без бюджету ризику цілісності на годину), умовна щодо виявлення — скінченної *безумовної* межі не існує. |
| **Домен вимірювань GNSS** | Пряма синтеза псевдовідстаней / Доплера з іоносферою **Klobuchar** (трансльована) і **IONEX / TEC-grid** (IONosphere map EXchange format / повний вміст електронів; виміряна) — включно з парсером файлів IONEX, інтерполяцією в часі між картами і відображенням похилості тонкої оболонки, — тропосферою **Saastamoinen + Niell** і знімковим RAIM (HPL/VPL). |
| **Стійкість** | **Глушіння** за бюджетом лінії (J/S → ефективне C/N₀ → втрата захоплення — відношення глушник/сигнал, відношення потужності несівної до спектральної густини шуму) з коефіцієнтом спектрального розділення для захисту від глушіння `Q`, тепер **виведеним із фактичних спектрів потужності сигналу і глушника** через `src/navsignal.rs` — `Q = 1/(R_c·κ)`, перехресно перевіреним у CI за попередньою репрезентативною сталою; стохастичний **детектор спуфінгу часу** (енергетичний тест Неймана–Пірсона / χ²₁ із замкненими та Монте-Карло P_fa/P_md і показником безпеки Security figure of merit (FoM), що дорівнює 1 − P_md); і **багатошаровий детектор спуфінгу**, що зливає тест парності на узгодженість RAIM (із чесно змодельованою сліпою зоною синфазної складової), РЧ-монітор потужності AGC (автоматичного регулювання підсилення) і монітор якості сигналу (SQM — моніторинг якості сигналу, early-minus-late); і **бюджет похибки квантово-інерціального зчислення** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`), що складає випадкове блукання швидкості від білого шуму холодноатомного інтерферометра із залишковим зміщенням (перехресно перевірено за незалежним інтегратором `AccelModel`) і похибкою масштабного коефіцієнта в показник дрейфу положення за holdover — інерціальний двійник holdover годинника. **Рушій оцінювання стійкості, узгоджений із рамкою** (`src/resilience/`), відображає змодельовану поведінку архітектури на підоцінки за вимірами в семи власних категоріях стійкості Kshana (не термінах DHS), узгоджених із Resilient PNT Conformance Framework Міністерства внутрішньої безпеки США, а потім досліджує **стабільність рішення** для будь-якої окремої складеної оцінки чи рівня зрілості на симплексі ваг Діріхле і ансамблі з п'яти загроз — рангова нестабільність τ Кендалла, частота зміни переможця top-1 і **колапс різноманітності** синфазної складової (Hill-N2), зі звітом про впевненість із хешем цілісності (35 виведених вручну тестів-оракулів). Відтворюється через `cargo run --example resilience_report`; **MODELLED** синтетичні архітектури, самооцінювання, узгоджене з RPCF v2.0, **не** сертифікація. Див. [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Пасивна РЧ-геолокація** | **Геолокація джерел за TDOA/FDOA** (різницею часу/частоти приходу; `src/geolocation.rs`) — визначення положення глушника або спуфера (чи джерела можливості для зворотного PNT) з гіперболоїдів **різниці часу приходу** в мережі приймачів, розв'язане методом найменших квадратів Гаусса–Ньютона; додавання **різниці частот приходу** з рухомими приймачами спільно відновлює положення *і* швидкість джерела, з межею **Крамера–Рао** для коваріації положення, виведеною з геометрії мережі. **MODELLED** (оракули внутрішньої узгодженості: перевірки туди й назад пряме→обернене, тотожність J·CRLB = I, монотонність GDOP і досягнення оцінювачем власної CRLB за Монте-Карло) — модель точкового джерела в прямій видимості, без членів багатопроменевості / NLOS (поза прямою видимістю), зміщення годинника приймача чи рефракції. |
| **Навігаційний сигнал і супровід коду** | **Рівень сигналу** між бюджетом лінії і доменом вимірювань (`src/navsignal.rs`): **спектральні густини потужності** (PSD) з одиничною площею для **BPSK-R(n)** (двійкова фазова маніпуляція з прямокутними чипами) і **sine-BOC(m,n)** (двійкова зсунута несівна); **коефіцієнт спектрального розділення** (SSC) κ = ∫ G_s·G_i df, який **виводить `Q` захисту від глушіння**, що його використовує модель глушіння (`Q = 1/(R_c·κ)`), із фактичних спектрів сигналу/глушника замість репрезентативної сталої; **середньоквадратична (Габорова) ширина смуги** (BOC > BPSK — міра далекомірної інформації / Крамера–Рао); **тепловий шумовий джитер когерентного супроводу коду DLL early–late** (DLL = контур стеження за затримкою; Kaplan & Hegarty; ~менше метра для C/A — грубого коду/коду захоплення GPS — за 45 dB-Hz); і **обвідна похибки багатопроменевості** (когерентний EML, early-minus-late — придушення вузьким корелятором). Перевірено за замкненими опорними значеннями (власний SSC BPSK = 2/(3·R_c), PSD з одиничною площею, джитер C/A менше метра). Це аналіз **характеристик** сигналу, **не** проєктування антен / апаратури РЧ-корисного навантаження (роль партнера з корисного навантаження). |
| **Сумісність** | Прийом трансльованих ефемерид кількох GNSS у **RINEX-3** (GPS, Galileo, QZSS — японська Quasi-Zenith Satellite System, BeiDou MEO/IGSO — середня навколоземна орбіта / нахилена геосинхронна орбіта — через IS-GPS-200, специфікацію інтерфейсу GPS; GLONASS, російська Global Navigation Satellite System, через PZ-90 — російський датум Parametry Zemli 1990 — вектор стану RK4), придатний як джерело сузір'я (RINEX на вході, геометрія PNT на виході); парсер спостережень **RINEX-3** (псевдовідстань, фаза несівної, Доплер, сила сигналу; макет спостережень 4.00 мав би розбиратися, але не протестований, а навігаційні файли RINEX 4 відхиляються за назвою, а не декодуються хибно), що тепер **живить розв'язувач одноточкового позиціювання (SPP)** (`pvt`) — реальні кодові спостереження на вході, реальне **положення приймача** на виході, перевірено на даних IGS; читач/записувач точних ефемерид **SP3-c/d** з інтерполяцією Лагранжа 9-го порядку; експорт **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) для інструментів динаміки польоту (GMAT, Orekit, STK — Systems Tool Kit); і розбір + видача повідомлень даних супроводу **CCSDS-TDM (503)** для радіометричного супроводу в далекому космосі. |
| **Аналіз місії (системна інженерія)** | Бюджети проєктування місії першого порядку, кожен — запускний вид: геометрія **запуску і виведення** задачі двох тіл (`launch-window` — азимут запуску `sin Az = cos i/cos lat`, мінімальний нахил, бонус від обертання Землі, Δv зміни площини маневром dogleg, щоденні можливості; `src/launch.rs`); **коридор балістичного входу в атмосферу Аллена–Еггерса** (`reentry` — пікове перевантаження, швидкість/висота пікового g, швидкість пікового нагріву; `src/reentry.rs`); **геометрія покриття для спостереження Землі** (`eo-coverage` — смуга огляду / GSD у надирі (відстань між відліками на землі) / доступ поза надиром / повторний огляд через космічний трикутник SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); **бюджет похибки орієнтації і наведення 3-DOF** (три ступені вільності; `attitude-budget` — найгірший гравітаційно-градієнтний момент + бюджет наведення RSS (корінь із суми квадратів); `src/attitude_budget.rs`); **прогнозування пролітань над наземною станцією** (`passes` — AOS/TCA/LOS, захоплення сигналу / момент найбільшого зближення / втрата сигналу, максимальний кут підвищення, час доступу; `src/passes.rs`); і **бюджет однобічної лінії** за рівнянням лінії CCSDS 401 / DSN 810-005 (стандарт радіочастот і модуляції CCSDS / довідник з проєктування ліній Deep Space Network; `link-budget` — FSPL (втрати поширення у вільному просторі), C/N₀, Eb/N₀ (відношення енергії на біт до спектральної густини шуму), запас, замикання; `src/linkbudget.rs`). **MODELLED** аналітичні бюджети першого порядку — передапаратний шар нижче STK/GMAT/Basilisk, не заміна 6-DoF чи радіометрії. |
| **Аналіз рішень і компромісів (MCDA)** | Повний набір **багатокритеріального аналізу рішень** (MCDA) (`src/mcda/`), що охоплює всі чотири сімейства методів — агрегування значень (**WSM**, **WPM**, **WASPAS** — модель зваженої суми, модель зваженого добутку, зважене агреговане оцінювання суми і добутку), відстань до ідеалу (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), компромісне програмування (**VIKOR**, від сербського «багатокритеріальна оптимізація і компромісний розв'язок») і перевершення (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, від французького «усунення і вибір, що виражають реальність»), плюс система відношень **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) і пропорційний **COPRAS** (Complex Proportional Assessment) — зі зважуванням пріоритетів попарним порівнянням **AHP** (Analytic Hierarchy Process) (коефіцієнт узгодженості), недомінованим фронтом **Парето**, аналізом **чутливості** до ваг і багатоатрибутним оцінюванням **корисності**. Дев'ять агрегаторів відтворюють незалежні сторонні бібліотеки **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) і **pyDecision** (ELECTRE I, COPRAS) до **< 1e-9**, а вектор пріоритетів AHP + коефіцієнт узгодженості збігаються з таблицею Random-Index Сааті і головним власним розв'язувачем SciPy/LAPACK до < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — шар рішень під рушієм компромісних досліджень. |
| **Космічне середовище** | **Модель середовища космічної погоди** (`space-weather`, `src/space_weather.rs`): сонячні (F10.7 / центрований 81-денний F10.7a — сонячний радіопотік на 10.7 cm) і геомагнітні (Kp, планетарний K-індекс, з визначальною таблицею Kp↔ap — ap є його лінійною планетарною амплітудою) індекси активності, екзосферна температура **Jacchia-1971**, яку вони визначають (перевірено за опублікованими сонячними мін./сер./макс.), і скоригована на активність порівняно зі статичною густина нейтральної термосфери на висоті — залежність густини від сонячного циклу, яку пропускає статична атмосфера USSA76 (US Standard Atmosphere 1976). **MODELLED**: відкалібрований зв'язок першого порядку через висоту однорідної атмосфери, **не** атмосфера, перевірена за даними (NRLMSISE — модель екзосфери US Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar). |
| **Оцінювання AI/ML і компроміси** | **Випробувальний стенд оцінювання виявлення РЧ-порушень** (`impairment-eval`, `src/impairment_eval.rs`): розмічений, прив'язаний до параметрів **синтетичний** корпус (номінальний / глушіння / спуфінг часу / спуфінг положення / багатопроменевість), незалежний від детектора каркас **ROC/AUC** (робоча характеристика приймача / площа під кривою), що оцінює будь-який детектор (energy \| agc \| sqm \| parity \| fused) з Pd (імовірністю виявлення) за класами за цільової Pfa (імовірності хибної тривоги), і **розрив оптимізму** всередині розподілу проти поза ним (режим зсуву розподілу). Плюс **компроміс PNT «квантове проти класичного»** (`quantum-trade`, `src/quantum_trade.rs`), що кількісно оцінює вигоду кандидатного годинника для синхронізації часу/інерціального holdover за кривою **виміряної ADEV** порівняно з класичним базовим рівнем, із застереженням щодо нижньої межі на довгих τ в артефакті та обвідною стійкості в часі без GNSS. **Метрики** оцінювання (AUC / матриця помилок / Pd-Pmd, де Pmd — імовірність пропущеного виявлення) **перевірено на точний збіг за scikit-learn 1.9.0** — включно з **реальною телеметрією ESA OPS-SAT** (набір даних виявлення аномалій OPSSAT-AD, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), де ROC AUC Манна–Вітні в Kshana відтворює `roc_auc_score` scikit-learn до < 1e-9 на відкладеному тестовому розбитті, а прозорий детектор кількості піків розділяє розмічені аномалії з AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`), — а числові **ядра** рушія компромісів (підгонка ADEV NNLS — невід'ємний метод найменших квадратів, — смуги узгодженості χ², Q годинника van-Loan) **за scipy 1.17.1**; числа вигоди пристроїв, побудовані на них, залишаються **MODELLED** робочими характеристиками — ніколи не польові дані/IQ (синфазні/квадратурні відліки), без вердикту «добре/погано». Спираючись на стенд, глибше **дослідження розриву оптимізму** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) оцінює панель із **13 детекторів** (energy/AGC/SQM/parity плюс детектори логістичної регресії із зерном і MLP з одним прихованим шаром — багатошарового перцептрона), підганяє **закони масштабування** всередині розподілу проти поза ним із перестановочною нульовою гіпотезою і навчає **провісник за схемою «залишити один»** погіршення поза розподілом зі статистик усередині розподілу (`cargo run --example optimism_study`). **Вхідний каскад програмно-визначеного приймача** (`src/sdr.rs` — сирі IQ/IF (проміжна частота) → відводи корелятора early/prompt/late → SQM) і **адаптери прийому реальних даних** (`src/realdata/` — RINEX, u-blox UBX (двійковий протокол u-blox), GnssLogger, JammerTest, Yunnan, SatGrid) дають змогу тим самим детекторам працювати над записами, наданими локально (жодних наборів даних не закомічено). **Карта переходу стійкості «квантове проти класичного»** за невизначеності параметрів (`src/crossover.rs`; `cargo run --bin crossover_study`) перегенеровує дослідження інерціального і годинникового переходу, що стоять за рисунками розділу «Результати». |
| **Демонстратор Quantum-Enabled PNT** | Три запускні **MODELLED** прикладні області за відкритим рушієм, кожна видає чесний `TradeEvidence` + запис про репрезентативність / прогалини до польоту (`src/representativeness.rs`): **довірене квантове передавання часу** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — наскрізний бюджет оптичного годинника на ґратці + фотонної лінії проти CSAC (атомного годинника масштабу чипа) + двобічної РЧ-лінії, з повторно використаним рівнем захисту часу, показником безпеки FoM (1 − P_md) щодо атак затримки/повторення і виявленням аномалій годинника + затримкою CUSUM); **квантова навігація без GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — інерціальний вибіг на холодноатомному інтерферометрі проти INS навігаційного класу під час перерви GNSS, що чесно визнає: без зовнішнього розв'язку зміщення акселерометра неспостережуване, тож похибка однаково росте); і **виявлення несправностей/аномалій** квантових систем (`quantum-anomaly-detect`, `src/quantum_faults.rs` — розмічений каталог несправностей із ROC AUC з бутстреп-CI (довірчим інтервалом) від зовнішньо перевіреного `eval_stats` і мінімальною виявною несправністю за фіксованої частоти хибних тривог). В їхній основі — спільна **бібліотека моделей похибок квантових пристроїв** (`src/quantum_devices.rs`) і уніфікований **каркас компромісів «квантове проти класичного»** (`src/qtrade.rs`). Перевірені ядра, на яких вони працюють (метрики оцінювання проти scikit-learn, ядра компромісів проти scipy), використовуються повторно; числа вигоди пристроїв, побудовані на них, залишаються **MODELLED** — **ілюстративні параметри пристроїв/ліній із публічних джерел**, моделюється *клас*, без TRL / льотної спадковості / сертифікації, без схвалення агенцій. |
| **Ощадлива інженерія і вплив на цілісність** | Лінза **ROI** (рентабельності інвестицій) **вартості на покриття** (`src/frugal.rs`) — вартість на одиницю наданого покриття для порівняння архітектур — і відображення **пропущене виявлення → вплив на цілісність** (`src/integrity_impact.rs`), що перетворює частоту пропущених виявлень монітора на його внесок у ризик цілісності. **MODELLED** бюджети підтримки рішень, адитивні. |
| **Обмін артефактами** | **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — версіонований самоописний конверт, що обгортає результат сценарію разом із його видом, версією схеми і позначками MODELLED/VALIDATED, щоб збережений артефакт залишався самодокументованим, а старіші конверти залишалися читабельними з прямою сумісністю. |

Кожна можливість доступна як Rust API, запускний `kind` сценарію або і те, і інше.
Зрілість кожної можливості — *validated*, *runnable* або *library* — відстежується в
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). **Машинно перевірювана матриця верифікації**
(`src/verification.rs`) будує перехресну таблицю вимога → модуль → тест → оракул → статус,
з інваріантами чесності, покритими модульними тестами, які дозволяють позначку *validated*
лише там, де її підтримує незалежний **зовнішній** оракул, — і які фіксують
апаратні/PA (забезпечення якості продукції) можливості, яких Kshana свідомо **не** надає.

</details>

<details>
<summary>Чотири пакети датчиків, як їх уперше опубліковано (результати)</summary>

### Результати

Кожен сценарій порівнює квантовий датчик із його класичним відповідником протягом
~1.8 h перерви GNSS. Числа відтворювані (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Що дають квантові датчики, коли GNSS зникає, сценарій holdover годинника: квантовий утримує 6600 s автономності проти 2610 s класичного, значно меншу похибку часу і доступність 100% проти 95.6%" width="88%">
  <br><sub>Що дають квантові датчики, коли GNSS зникає — <code>clock-holdover</code> · зерно 42 · намальовано на рушії 0.40.0, і кожен рисунок вище повторно перевіряється за поточним рушієм під час кожного збирання тестом <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Перевага **залежить від тривалості перерви і вібрації**, з явною точкою беззбитковості, де виграє класичний варіант, — чесно показано на всій драбині технологічної готовності (показники оптичних годинників — цілі наземних демонстраторів; жоден стронцієвий оптичний годинник ще не літав):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Перехід «квантове проти класичного» для holdover годинника на драбині технологічної готовності, з довірчими смугами" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Теплова карта інерціальної переваги «квантове проти класичного» залежно від тривалості перерви і вібрації, з контуром беззбитковості, де виграє класичний варіант" width="96%">
  <br><sub>Перехід стійкості «квантове проти класичного» — драбина TRL для holdover годинника (угорі) · карта інерціальної переваги з контуром беззбитковості (унизу). Перегенеровується через <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Інерціальне зчислення: похибка положення під час перерви GNSS — квантовий (холодноатомний) датчик залишається біля лінії специфікації, тоді як датчик навігаційного класу розходиться до десятків кілометрів" width="80%">
  <br><em>Похибка положення при зчисленні під час перерви GNSS: квантовий датчик (синій)
  залишається пласким біля специфікації; класичний датчик (червоний) розходиться до десятків кілометрів.
  Згенеровано Kshana з <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Пакет | Сценарій | Квантовий | Класичний |
|------|----------|---------|-----------|
| **1 — Holdover годинника** | `clock-holdover.toml` (специфікація 20 ns) | оптичний годинник утримує всю перерву | CSAC порушує специфікацію посеред перерви |
| **2 — Інерціальне зчислення** | `imu-deadreckoning.toml` (специфікація 100 m) | холодноатомний: **~41 m**, утримує всю перерву | навігаційного класу: порушує за **~350 s** → десятки km |
| **3 — Передавання часу** (оптична міжсупутникова лінія) | `timetransfer.toml` | оптична: далекометрія **~0.3 mm** | РЧ (TWSTFT): далекометрія **~150 mm** |
| **4 — Гібридне злиття** (завершальний) | `hybrid-pnt.toml` | повні положення+час протягом усієї перерви | **обмежено положенням на ~350 s** |

Завершальний сценарій показує тезу злиття: оптичне міжсупутникове передавання часу утримує синхронним навіть
класичний *годинник*, виокремлюючи *інерціальний* датчик як слабку ланку класичного
набору — тобто квантова інерціальна навігація + оптична синхронізація часу разом.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Holdover годинника: фазова похибка під час перерви GNSS — оптичний годинник залишається в межах специфікації 20 ns протягом усієї перерви, тоді як годинник масштабу чипа порушує її посеред перерви" width="80%">
  <br><em>Holdover годинника під час перерви GNSS: оптичний годинник (синій) залишається в межах
  специфікації 20 ns протягом усього вибігу; годинник масштабу чипа (червоний) порушує її на півдорозі.
  Згенеровано Kshana з <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Ще один сценарій, `orbit-gnss-challenged.toml`, виводить доступність GNSS з
**орбітальної геометрії**, а не з вікон, заданих вручну: космічний апарат усередині оболонки
GNSS поширюється відносно GPS-подібного сузір'я Walker, і кількість видимих супутників
(пряма видимість, затінення Землею, маска кута підвищення) задає стан розв'язку на кожному
кроці. Протягом доби користувач має розв'язок лише ~59% часу; квантовий годинник утримує
розв'язок часу 5 ns через кожну прогалину (доступність **1.0**), годинник масштабу чипа —
лише **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Орбіта з обмеженим GNSS: похибка часу годинника протягом доби для космічного апарата всередині оболонки GNSS, де прогалини покриття виведено з орбітальної геометрії — оптичний годинник залишається в межах специфікації 5 ns на всіх прогалинах, тоді як годинник масштабу чипа порушує її" width="80%">
  <br><em>Похибка часу протягом доби з доступністю GNSS, виведеною з орбітальної геометрії:
  кількість видимих супутників (пряма видимість, затінення Землею, маска кута підвищення) задає стан
  розв'язку на кожному кроці, тож годинник мусить пройти вибігом кожну прогалину — оптичний годинник утримує
  специфікацію 5 ns, тоді як годинник масштабу чипа порушує її. Згенеровано Kshana з
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Сузір'я також можна задати реальними наборами дворядкових елементів (TLE). *Повний* TLE
(рядок 1 + рядок 2) поширюється повною моделлю **SGP4/SDP4** — включно з
атмосферним опором і місячно-сонячними членами далекого космосу та резонансними членами 12 h / 24 h, які
мають значення для ~12-годинних орбіт GNSS, — перевіреною за офіційними векторами AIAA 2006-6753
з найгіршою похибкою ≈ 4 mm. `scenarios/orbit-sgp4-gps.toml` постачає **реальний знімок Celestrak
`gps-ops`** робочого сузір'я GPS (2021-07-28, 30 супутників)
і вимагає дійсних контрольних сум TLE — набори дворядкових елементів є відкритими даними з каталогу US
Space Force / 18th Space Defense Squadron, що їх поширює Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); оновлюйте командою
`scripts/fetch_tles.sh`. Блок лише з рядком 2 зберігає
аналітичне поширення задачі двох тіл (`scenarios/orbit-real-tle.toml`); обидві форми можна
змішувати в одному сузір'ї. Сузір'я так само можна побудувати з блоку
записів **трансльованих ефемерид GPS у RINEX-3** — формату, який декодує приймач, —
поширених алгоритмом користувача IS-GPS-200 і пропущених через ту саму геометрію
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Що це таке / чим не є, повністю</summary>

<a id="what-it-is--is-not"></a>
### Що це таке / чим не є

**Це:** детермінований рушій з малою кількістю залежностей, що охоплює стек PNT — орбітальну
геометрію, інерціальну навігацію, злиття GNSS/INS, цілісність, годинники і синхронізацію часу. Він
запускає сценарій (часто перерву GNSS), розвиває відкалібровані моделі похибок датчиків
через відповідний оцінювач і оцінює результат за робочими
показниками якості — видаючи відтворюваний результат JSON (JavaScript Object Notation) і графік SVG, з
бібліотеки Rust, інтерфейсу командного рядка (CLI), розширення Python, модуля WebAssembly в браузері,
**сервера Model Context Protocol (MCP)** для AI-агентів або **плагіна JetBrains IDE (інтегрованого
середовища розробки)**.

**Це не:** льотне обладнання, проєкт квантового корисного навантаження, повний приймач сигналів
GNSS, симулятор радіочастотних (РЧ) сигналів чи стенд hardware-in-the-loop або
сертифікований продукт авіоніки — і він не замінює MATLAB/Simulink, STK (Systems Tool
Kit) чи Orekit; він стоїть поруч із ними й обмінюється з ними файлами. Точність моделювання квантового обладнання береться з
опублікованих моделей похибок, а не з цього інструмента. Детальну зрілість кожної
можливості задокументовано в [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Це (поки що) не:** *повний* фізичний рушій атомної інтерферометрії (більшість квантових датчиків
використовують опубліковані коефіцієнти Аллана/бюджету шуму; акселерометр CAI (холодноатомний інтерферометр) має
шар із перших принципів — фаза Маха–Цендера, проєкційний шум, спадання контрасту і
вібраційний зв'язок, плюс систематики Коріоліса і світлового зсуву, — але систематики хвильового фронту і
розв'язання неоднозначності смуг залишаються шаром дорожньої карти **P2** (фаза 2 дорожньої карти, шар квантової фізики),
див. [`ROADMAP.md`](ROADMAP.md) і [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
сертифікований чи апаратний приймач GNSS (він обчислює одноточковий розв'язок **PVT** (положення, швидкість і час)
з реальних кодових спостережень RINEX (Receiver Independent Exchange Format) — перевірено
на реальних даних IGS (International GNSS Service), — а його шар IQ (`kshana iq`, починаючи з 0.31.0)
програмно захоплює і супроводжує записані або згенеровані базосмугові відліки, як аналітичний
приймач: він не керує радіообладнанням і не передає, не є сертифікованим приймачем і не виконує
позиціювання за фазою несівної (RTK чи PPP)); або повний набір для проєктування місій (він має будівельні блоки Ламберта / porkchop /
маневрів / визначення орбіти, але є шаром моделювання характеристик
*над* GMAT (General Mission Analysis Tool)/Orekit, а не заміною). Таке окреслення меж — свідоме. Якщо вам потрібні бюджети похибок
холодноатомного інтерферометра з перших принципів (наприклад, рівня CARIOQA-PMP — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — або валідація в стилі X-37B), див.
дорожню карту P2 і [зв'яжіться з нами](#support--professional-services) для співпраці.

</details>

### Навігація на низькій навколоземній орбіті

Супутники на низькій навколоземній орбіті (LEO) пролітають швидко і з сильним сигналом. Вид `leo-pnt-chain` проводить одну
систему через кожен етап: сигнал, проліт і його лінію, навігаційне повідомлення і
злитий розв'язок положення, швидкості і часу (PVT) та точне точкове позиціювання (PPP). Кожен
етап передає свої числа наступному. Див. [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="Ланцюг LEO PNT з реального запуску leo-pnt-chain (leo-pnt-end-to-end.toml): етап сигналу (generic-l на 1191.795 MHz, пілот супроводжується на 10.23 Mchip/s) передає етапу пролітання (1080 km, пік супроводжуваного C/N0 58.2 dB-Hz), який передає навігаційному повідомленню (kepler-rac, підгонка 300 s, SISRE представлення 0.91 mm RMS, 0.250 m з визначенням орбіти), яке живить злитий розв'язок (лише GNSS 1.60 m RMS 3D, GNSS плюс LEO 0.43 m) і точне точкове позиціювання (збіжність 11.5 min лише з GNSS, 7.5 min з 240 супутниками LEO). Між етапами передається 11 значень." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Кожен вид сценарію за сімейством

Види сценаріїв рушія, розкладені за сімействами. Кожне сімейство має сторінку з одним записом на вид (
опис і поля рушія, приклад команди, головні числа із запуску, рядки
[матриці верифікації](docs/VERIFICATION-MATRIX.md), що його називають, і графік, який записує сам рушій) і
аркуш мініатюр цих графіків; [`docs/KINDS.md`](docs/KINDS.md) індексує їх усі. Таблицю записує
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py), а сторінки —
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), і обидва завершуються помилкою, якщо рушій отримує вид, якого не називає жодне сімейство.

<!-- generated:kind-families -->
| Сімейство | На що відповідає | Види | Запустити один |
|---|---|---|---|
| **[Годинники, синхронізація часу і holdover](docs/kinds/clocks-timing-and-holdover.md)** | як довго годинник утримує час без GNSS і як система синхронізації часу витримує свої маски | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Інерціальні, злиті і квантові датчики](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | зчислення і злиття датчиків під час перерви GNSS, з класичними і квантовими датчиками | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[Альтернативний PNT без GPS](docs/kinds/gps-denied-alternative-pnt.md)** | навігація за гравітацією, рельєфом та іншими полями, коли GNSS зникає | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Сузір'я, покриття і геометрія](docs/kinds/constellations-coverage-and-geometry.md)** | де перебувають супутники, хто їх бачить і наскільки добра геометрія навколо Землі, Місяця чи Марса | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[Вимірювання GNSS, позиціювання і цілісність](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | псевдовідстані, розв'язки положення, рівні захисту і космічне середовище | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Глушіння, спуфінг і спектр](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | як завади досягають приймача і чи їх виявлено | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Навігація на низькій навколоземній орбіті](docs/kinds/low-earth-orbit-navigation.md)** | проліт, лінія, навігаційне повідомлення і злитий розв'язок, етап за етапом | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Місяць і цисмісячний простір](docs/kinds/lunar-and-cislunar.md)** | навігація, час, системи відліку і геодезія біля Місяця | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Навігація космічних користувачів](docs/kinds/space-user-navigation.md)** | сигнали GNSS для космічних апаратів над орбітами GNSS, навколо них і за ними | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Оптичний PNT](docs/kinds/optical-pnt.md)** | оптичні лінії крізь атмосферу і показники якості оптика-плюс-РЧ | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Аналіз місії, лінії і космічні операції](docs/kinds/mission-analysis-links-and-space-operations.md)** | запуск, виведення, вхід в атмосферу, орієнтація, лінії, планування сеансів зв'язку і формати файлів | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Нитки місій](docs/kinds/mission-threads.md)** | бюджет похибки навігації та синхронізації часу для ланцюга фаз від запуску до входу в атмосферу | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Кампанії](docs/kinds/campaigns.md)** | ланцюгові місії, перебори параметрів і ансамблі, побудовані з інших видів | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Кожна команда

`kshana <scenario.toml>` запускає сценарій; кожна інша команда є підкомандою, а `kshana --help` друкує використання
їх усіх. Команди: `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (з `live` і
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` і `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) наводить призначення кожної, перевірений приклад і її сторінку документації.

<a id="every-surface"></a>
### Кожен інтерфейс

Один рушій, ті самі результати всюди: командний рядок, бібліотека Rust, Python, JavaScript і WebAssembly,
сервер MCP з його командами плагіна і навичками, Kshana Studio (кожна сторінка працює в браузері, без встановлення, нічого не вивантажується),
інтеграції ROS 2, Signal K, OpenCPN, GNSS-SDR і `gnss_lib_py`, набори розгортання systemd, Docker і Grafana та
плагін JetBrains. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) перелічує їх разом зі способом отримати кожен і назвами всіх
команд плагіна, навичок і сторінок Studio; [`docs/SURFACES.md`](docs/SURFACES.md) для кожної команди і виду каже,
який інтерфейс її підтримує, а який ні, і чому.

<a id="how-a-run-works"></a>
## Як працює запуск

Сценарій — це файл TOML (Tom's Obvious, Minimal Language): вид, зерно і
параметри. Рушій запускає його і записує поруч результат, графік і звіт, а також
експорти, які ви запитаєте.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Як відбувається запуск. Файл сценарію TOML (вид, зерно і його параметри) надходить у рушій kshana 0.40.0 через диспетчер api::run_toml для 92 видів сценаріїв, детермінований за сценарієм, зерном і версією рушія. Рушій записує result.json, chart.svg, report.html і report.json, table.csv для видів, що її визначають, і на запит експорти SP3, CCSDS OMM і OEM, CZML, KML, GeoJSON, STK і SigMF; набір записує study.json і study.html. Ці файли живлять Kshana Studio в браузері, AI-асистента через сервер kshana-mcp і безперервну інтеграцію." width="100%">
</picture>

Цей вбудований сценарій триває 2 h: 10 min з GNSS, потім близько 1.8 h без GNSS. Він запитує,
як довго стронцієвий оптичний годинник на ґратці і атомний годинник масштабу чипа (CSAC) утримують
час у межах 20 ns.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Оптичний годинник утримує бюджет 20 ns протягом усієї перерви 6600 s; CSAC утримує його
2610 s і перебуває в межах бюджету 95.6% запуску проти 100% для оптичного годинника.
`kshana example` перелічує кожен вбудований сценарій.

<a id="missions"></a>
## Місії

Десять секторів ставлять тому самому рушію десять різних запитань. Кожен має вбудовані сценарії, з яких
можна почати.

| Сектор | Почніть із |
|---|---|
| Оборона і безпека | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Космос, навколоземна орбіта | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Місяць, Марс і далекий космос | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Авіація і дрони | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Морський сектор | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Автомобільні дороги | `automotive-urban-canyon` |
| Залізниця | `rail-tunnel-coast` |
| Критична інфраструктура і синхронізація часу | `clock-holdover`, `clock-ensemble` |
| Телекомунікації і 5G (п'яте покоління мобільних мереж) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Наука і дослідження | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Запитання, яке ставить кожен сектор</summary>

<br>

| Сектор | Запитання, яке він ставить | Почніть із |
|---|---|---|
| **Оборона і безпека** | Як довго наша навігація і синхронізація часу залишаються надійними під час глушіння і спуфінгу, і які шари утримують нас у межах специфікації? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Космос: навколоземна орбіта** | Чи бачить мій космічний апарат достатньо навігаційних супутників, як довго його годинник утримує час між розв'язками і що додав би навігаційний шар на низькій орбіті? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Місяць і далекий космос** | Чи отримає посадковий модуль, ровер чи орбітальний апарат біля Місяця, біля Марса чи далі надійне положення і час? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Авіація і дрони** | Після того як глушник позбавляє GNSS, як довго моя безпілотна авіаційна система (UAS) залишається в межах свого бюджету положення і чи доступна цілісність на моєму маршруті? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Морський сектор** | Як далеко над водою сягає глушник, чи буде виявлено зсув положення і як довго судно може йти до порту вибігом? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Автомобільні дороги і автотранспорт** | Наскільки дрейфує автомобіль під естакадою або повз придорожній глушник? | `automotive-urban-canyon` |
| **Залізниця** | Скільки секунд у тунелі потяг ще може визначити, на якій колії він перебуває? | `rail-tunnel-coast` |
| **Критична інфраструктура і синхронізація часу** | Якщо час GNSS втрачено або підроблено, як довго енергомережа, торговий майданчик чи центр обробки даних зберігають простежуваний час? | `clock-holdover`, `clock-ensemble` |
| **Телекомунікації і 5G** | Якщо часову опору GNSS втрачено, чи залишається мій мережевий годинник у межах масок ITU-T і як довго? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Наука і дослідження** | Чи можу я відтворити, розширити і процитувати результат PNT аж до зерна? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Докази

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 перевірено за всіма 666 еталонними векторами AIAA 2006-6753, найгірша похибка положення 4.12 mm"></a></p>

<strong>176 із 401</strong> можливостей перевірено за незалежними зовнішніми оракулами; 221 чесно позначено Modelled.
Кожен рядок матриці верифікації називає можливість, оракул, за яким її перевіряють,
тест, що виконує перевірку, і позначку, що з цього випливає. Безперервна інтеграція (CI) унеможливлює
назвати можливість VALIDATED без незалежного зовнішнього оракула.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Як можливість заробляє свою позначку. Кожен рядок матриці верифікації називає можливість, оракул, за яким її перевіряють, тест, що виконує перевірку в безперервній інтеграції, і позначку, що з цього випливає. Рядок може бути VALIDATED лише з незалежним зовнішнім оракулом; інакше він MODELLED або PARTNER, коли ним володіє апаратний партнер. Приклад: SGP4/SDP4, Cowell 6-DOF + збурення, пакетне/послідовне OD, оракул — вектори верифікації SGP4 AIAA 2006-6753, тест tests/sgp4_verification.rs, позначка VALIDATED. Поточні кількості: 176 VALIDATED, 221 MODELLED, 4 PARTNER із 401 рядка. Загалом 176 можливостей перевірено за незалежними зовнішніми оракулами; ще 221 чесно позначено MODELLED, а 4 належать PARTNER." width="100%">
</picture>

| Позначка | Рядки | Значення |
|---|---|---|
| VALIDATED | 176 | погоджується незалежний зовнішній оракул: реальні дані, незалежна реалізація або опубліковані еталонні вектори |
| MODELLED | 221 | перевірено за аналітичною істиною або самоузгодженістю симуляції, і про це сказано прямо |
| PARTNER | 4 | належить апаратному партнерові; Kshana не має для неї оракула |

Кілька перевірок: усі 666 векторів SGP4 (Simplified General Perturbations 4) AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 до 4.12 mm; модель сил Cowell
до 0.08 m за Orekit 12.2; Galileo до 0.61 m і Swarm-A до 0.10 m за реальними
точними ефемеридами Європейського космічного агентства (ESA). Тести утримують покриття рядків близько 95 % для
`src/`, з порогом 85 % у CI. Реєстр — це
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), згенерований з
`src/verification.rs`: [повна матриця з 401 рядка](docs/VERIFICATION-MATRIX.md), а чому кожен
рядок Modelled не має зовнішнього оракула — у [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Як працює валідація, вибрана таблиця основних результатів і рисунки доказів</summary>

### Валідація, відтворюваність і чесність

- Кожен шумовий член відкалібровано за **опублікованим, процитованим** значенням і перевірено
  за стандартним співвідношенням (девіація Аллана для годинників; ріст похибки зчислення за Groves
  для інерціальної навігації; перетворення час→дальність для передавання часу). Статус
  кожного члена відстежується в [`docs/VALIDATION.md`](docs/VALIDATION.md) як `validated` або
  `not modeled` — ніщо не подається як перевірене, якщо воно таким не є.
- **Відтворюваність за побудовою:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` це забезпечує; квантові і класичні запуски використовують
  незалежні зерна, тож їхній шум некорельований.
- Зрілість зазначено чесно: показники оптичних годинників і оптичних ліній — це результати *цілей /
  наземних демонстраторів*, не льотні.

### Позначка доказів на кожному рисунку

Кожен рисунок і таблиця, які записує запуск, кажуть, наскільки їм можна довіряти і на яких рядках реєстру це ґрунтується. Результат JSON має
ключ `evidence`, графік SVG — рядок під графіком (і елемент `<metadata id="kshana-evidence">`), а таблиця CSV —
рядки коментарів `# evidence:` на початку (читайте з `comment='#'`). Позначка називає рівень, `VALIDATED`, `MODELLED` або `PARTNER`, і
ідентифікатори (`VM-` і вісім шістнадцяткових цифр) рядків матриці верифікації, які задіяв запуск. Рівень — найслабший із цих
рядків, тож запуск, що спирається на один змодельований рядок, позначається MODELLED, скільки б перевірених рядків не стояло поруч; позначка
ніколи не може заявити більше, ніж реєстр. Рядки, статуси й ідентифікатори зчитуються з матриці, а не вводяться вручну
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), і
`tests/evidence_labels_doc_sync.rs` завершується помилкою, якщо рисунок не має позначки або позначка розходиться з матрицею.

### Валідація коротко

Кожен рядок забезпечується названим тестом у CI. Ця таблиця — **вибрані основні результати**;
повна машинно перевірювана матриця має **401 рядок — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), з повними доказами (і тим, що чесно *ще не*
перевірено) в [`docs/VALIDATION.md`](docs/VALIDATION.md) і артефакті кожного випуску
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
(генерується `cargo run --bin validation_report`, з атестацією SLSA — Supply-chain
Levels for Software Artifacts).

Стовпець **Статус** зазначає *вид* доказу відповідно до драбини валідації вище: **VALIDATED** = перевірено за незалежним зовнішнім оракулом (реальні дані, незалежна бібліотека або опубліковані еталонні вектори); **MODELLED** = перевірено за аналітичною істиною або самоузгодженістю симуляції (без незалежного зовнішнього набору даних). VALIDATED описує *метод* перевірки, а не «пройдено/не пройдено» — чесний промах відносно реального зовнішнього оракула залишається VALIDATED, тоді як порівняння, яке жоден рядок матриці не називає оракулом (підгонка LRO — Lunar Reconnaissance Orbiter — вище), показано як MODELLED. Рядки `CI` — це процесні запобіжники, а не показники якості. Кілька острівців реальних даних (виміряний цезієвий годинник, Stable32 PHASE.DAT і перевірки OPS-SAT/ICGEM, де сирі вхідні дані не мають ліцензії на повторне поширення) **залежать від даних**: тест друкує повідомлення про пропуск і залишається зеленим, коли вхідних даних немає, а публічні еталонні числа закомічено в `tests/fixtures/`. Відтворіть сирі вхідні дані відповідним `scripts/fetch_*.sh`.

| Статус | Можливість | Збіг | Еталон / оракул |
|--------|------------|-----------|--------------------|
| **VALIDATED** | Поширення SGP4/SDP4 | 666/666 векторів, найгірше **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + пряме порівняння з незалежним крейтом `sgp4` |
| **VALIDATED** | Системи відліку — нутація IAU 2000A/B, ланцюг CIO IAU 2006/2000A, ERA | **біт у біт** (X,Y до 1e-14, s до 1e-18, ERA до 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS порівняно з незалежним рушієм SPICE | макс. **0.028″** → ≤ 0.86 m на землі, ≤ 3.6 m на орбіті GNSS | ANISE (NAIF/SPICE на чистому Rust), ті самі EOP IERS `finals2000A`, 8 епох 2020–2023 (порівняно з цим еталоном; жоден рядок матриці верифікації не називає його зовнішнім оракулом, тому він не позначений VALIDATED) |
| **MODELLED** | Геопотенціал EGM2008 (степінь/порядок 70) | прискорення = ∇V до **< 1e-6**; зональне згортання до перевіреного J2 | коефіцієнти NGA EGM2008 + аналітична тотожність ∇V |
| **VALIDATED** | Синтез гравітаційних функціоналів (навігаційна карта з допомогою гравітації / без GNSS) | GRS80 Somigliana + γ_e/γ_p до **3.5e-12**; реальна карта збурень EGM2008 фізична (RMS ≈ 26 mGal, d/o 70) | нормальна гравітація Сомільяни GRS80 (Moritz 1980, IAG — International Association of Geodesy) + реальний ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Оцінювачі Аллана (ADEV/MDEV/TDEV/HDEV) + довірчі смуги | відтворюють еталонні девіації; смуги χ² збігаються | NIST SP 1065 (Riley), 1000-точкові Table 31/32 |
| **VALIDATED** | Оцінювачі Аллана на **реальному виміряному цезієвому годиннику** | OADEV/OHDEV до **1e-3** (спостережено ≤ 3e-5), 16 коефіцієнтів усереднення | Stable32 на реальному 5071A Cs проти H-мазера, 556,990 точок (`tests/cs5071a_reference.rs`, залежить від даних) |
| **VALIDATED** | Оцінювачі Аллана на **канонічному Stable32 PHASE.DAT** | OADEV/MDEV/TDEV до **1e-3** (спостережено ≤ 5e-5), 139 коефіцієнтів усереднення | еталонні девіації Stable32 для PHASE.DAT (`tests/phasedat_reference.rs`, залежить від даних) |
| **MODELLED** | Модель похибок IMU — ARW / VRW / нестабільність зміщення | відновлено до **< 5 %** (нестабільність зміщення < 15 %) | технічний опис Analog Devices ADIS16465; еталонний профіль NaveGo |
| **VALIDATED** | Числовий пропагатор Cowell + модель сил (рівні консервативних сил) | найгірша похибка положення **0.08 m** за 24 h, 278 епох (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Рівень опору Cowell + абсолютні вхідні дані ефемерид Сонця/Місяця і густини | рівень опору охарактеризовано ≈ 333 m / 24 h; незбурений збігається з Кеплером в універсальних змінних менше метра, енергія/момент ~1e-9 | вбудовані ефемериди низької точності + аналітичний Кеплер |
| **MODELLED** | Ламберт · Ціолковський · porkchop | туди й назад до істини задачі двох тіл; ΔV **< 0.01 %** | Izzo 2015 · рівняння ракети · аналітична нижня межа Гомана |
| **MODELLED** | Визначення орбіти (пакетний Гаусс–Ньютон) | менше метра / mm·s⁻¹ без шуму; ~2 m за рівня шуму 5 m | задача двох тіл + J2 на дузі RK4 |
| **MODELLED** | Підгонка моделі сил до точних ефемерид Galileo (уся дуга) | **0.61 m** 3-D RMS, 24 h, d/o-70, лише сили | фінальна орбіта ESA/ESOC `ESA0MGNFIN` (E11), реальні EOP `finals2000A` (порівняно з цим еталоном; жоден рядок матриці верифікації не називає його зовнішнім оракулом, тому він не позначений VALIDATED) |
| **MODELLED** | Підгонка моделі сил до точних ефемерид Swarm-A (знижена динаміка) | **0.10 m** 3-D RMS (межа емпіричного рівня, не вимірювання) | точна орбіта ESA `SW_OPER_SP3ACOM_2_` (порівняно з цим еталоном; жоден рядок матриці верифікації не називає його зовнішнім оракулом, тому він не позначений VALIDATED) |
| **MODELLED** | Підгонка моделі сил до місячного LRO (чесний промах) | **6.67 m** зі зниженою динамікою, *вище* цілі 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (порівняно з цим еталоном; жоден рядок матриці верифікації не називає його зовнішнім оракулом, тому він не позначений VALIDATED) |
| **MODELLED** | OD Марса в далекому космосі (SRIF зі зниженою динамікою) | **≈ 0.2 m** Mars-LMO (FoM симуляції, *не* реальна місія) | синтетичне OD у замкненому контурі — валідація механізму оцінювача |
| **MODELLED** | Геліоцентрична динаміка Марса порівняно з JPL DE440 | **137 m на дузі в 1 добу** (росте з дугою = незмодельована задача n тіл) | JPL DE440 через ANISE (`xval/anise-mars-od`, залежить від ядра) (порівняно з цим еталоном; жоден рядок матриці верифікації не називає його зовнішнім оракулом, тому він не позначений VALIDATED) |
| **VALIDATED** | Одноточкове позиціювання порівняно з відзнятою координатою IGS (реальні спостереження) | **5.7 m** 3-D RMS / **1.1 m** горизонтально, двочастотне вільне від іоносфери кодове SPP | зйомка станції IGS ABMF + трансльовані ефемериди GPS, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Тісно зв'язаний UKF GNSS/INS | **0.77 m RMS** на 30-хвилинному пролітанні LEO, включно з перервою 120 s | вибіг за моделлю сил, виведено вручну |
| **MODELLED** | Навігація за гравітаційною картою без GPS | дрейф INS ~70 km → відновлено **~145 m** | ціль ESA NAVISP *Quantum Wayfarer* |
| **MODELLED** | Навігація з прив'язкою до рельєфу (TERCOM/SITAN) | дрейф 70 km → **< 500 m** (нижня межа роздільності сітки ~140 m) | SRTM `.hgt` DEM; дрейф, внесений вручну (некругова перевірка) |
| **MODELLED** | Головне поле IGRF-14 (степінь/порядок 13) | полюс ~80.7°N, диполь ~29.7 µT, фізичний діапазон 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (напівнормалізовані за Шмідтом) |
| **MODELLED** | Модуляція навігаційного сигналу і супровід коду | власний SSC BPSK = **2/(3·R_c)**; PSD з одиничною площею; джитер DLL C/A **менше метра** за 45 dB-Hz | замкнені опорні значення SSC/PSD + формула теплового шуму DLL Kaplan & Hegarty |
| **MODELLED** | Диференційний коректор гало/NRHO CR3BP | STM = скінченні різниці; орбіта замикається до **машинної точності**; L2 9:2 NRHO **≈ 6.57 d / периселеній ≈ 3,250 km** | перевірка STM скінченними різницями + опублікована південна NRHO 9:2 навколо L2 (≈ 6.56 d / ≈ 3,370 km) — CR3BP, не реальні ефемериди Gateway |
| **MODELLED** | Цілісність ARAIM для двох сузір'їв | режим несправності всього сузір'я на реальних GPS + Galileo | EU ARAIM TR (технічний звіт) / DO-316; Celestrak `gps-ops` 2021-07-28 (порівняно з цим еталоном; жоден рядок матриці верифікації не називає його зовнішнім оракулом, тому він не позначений VALIDATED) |
| **VALIDATED** | Геометрія GNSS / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | збіг до **1e-6 відносно** на 8 геометріях (від добре обумовлених до майже вироджених) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — незалежна бібліотека (`tests/dop_reference.rs`) |
| **VALIDATED** | Метрики оцінювання детекторів ML (AUC/ROC/матриця помилок/Pd-Pmd/точність/F1) | **точні кількості + < 1e-9** на 5 наборах даних × 24 порогах | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — незалежна бібліотека (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC виявлення аномалій на **реальній телеметрії ESA OPS-SAT** | AUC відтворює scikit-learn до **< 1e-9**; AUC детектора кількості піків **≈ 0.85** на розміченому тестовому розбитті | scikit-learn `roc_auc_score` на тестовому розбитті OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0) — реальна телеметрія OPS-SAT (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Числові ядра квантових компромісів (підгонка ADEV NNLS · смуги узгодженості χ² · Q годинника van-Loan) | NNLS + Q **точно**; χ² **< 5e-4** за робочих ступенів вільності ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Телекомунікаційні метрики блукання MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811 — рекомендації Сектору стандартизації телекомунікацій Міжнародного союзу електрозв'язку) | MTIE (9 коефіцієнтів усереднення, біт у біт) і MDEV + TDEV (8 коефіцієнтів, **< 1e-9** відносно) на ряді NIST SP 1065 LCG (лінійного конгруентного генератора) | allantools 2024.06 `mtie` / `mdev` / `tdev` — незалежна бібліотека (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | Методи компромісних досліджень MCDA — усі чотири сімейства рішень, дев'ять зовнішньо перевірених агрегаторів (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) плюс зважування пріоритетів попарним порівнянням **AHP** | оцінки / ранжування / матриці узгодження відтворено до **< 1e-9** | pymcdm + pyDecision (незалежні сторонні бібліотеки MCDA) + Saaty RI (Random Index) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | Доплерівська обвідна LEO з орбіти і несівної | максимум Iridium у межах **5 %** від опублікованих ±36 kHz; Xona Pulsar X1 у межах опублікованих **32–34 kHz** | результати випробувань RNTF LEO PNT; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | Збіжність PPP з доповненням LEO | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min з 60 / 96 / 192 / 288 супутниками LEO, монотонно; NEES фільтра в межах смуги χ² | тренд порівняно з Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); сузір'я і шум не відтворено |
| **MODELLED** | Умовний рівень захисту часу (обмежена holdover невиявлена похибка часу за спуфінгу) | композиція відтворює багатокрокову рекурсію коваріації `clock_state`; відкалібровано на реальному записаному спуфінгу | скаляри JammerTest 2024 (Zenodo 15911589) + замкнені форми van-Loan / CUSUM (`examples/tpl_jammertest`) |
| **MODELLED** | Оцінювання стійкості PNT + нестабільність рішень | 35 виведених вручну тестів-оракулів; побайтово детермінований артефакт дослідження (фіксоване зерно) | відображення DHS RPCF v2.0 + замкнені форми Діріхле / τ Кендалла / Hill-N2 — синтетичні архітектури, не сертифікація |
| **MODELLED** | Дослідження розриву оптимізму РЧ-порушень (закони масштабування + провісник за схемою «залишити один») | значущість за перестановочною нульовою гіпотезою; побайтово детермінований артефакт (5 зерен) | синтетичний корпус, прив'язаний до параметрів — *метрики* оцінювання VALIDATED за scikit-learn (вище); дослідження MODELLED |
| CI | Кросплатформна відтворюваність | біт у біт ідентичні вхідні дані + еталони форми на 3 ОС (операційних системах) | матриця CI Linux / macOS / Windows, еталони SHA-256 |
| CI | Покриття тестами | **~95 % рядків** для `src/`, крім `src/*_data.rs` і `src/main.rs`, з порогом ≥ 85 % | cargo-tarpaulin (рушій LLVM) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Як можливість заробляє свою позначку: вимога відображається на модуль у src, на тест у tests, на зовнішній оракул (реальний набір даних, незалежна еталонна реалізація або опубліковані вектори), на статус — із запобіжником у CI, за яким жодна можливість не може бути Validated без зовнішнього оракула. Поточні кількості: 176 Validated, 221 Modelled, 4 Partner, загалом 401" width="900">
  <br><sub>Як можливість заробляє свою позначку — інваріант, що забезпечується CI: немає зовнішнього оракула ⇒ не може бути Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Чим підкріплено кожне твердження: стовпець Validated — це 176 із 176 ExternalDataset за побудовою (забезпечується CI); рядки Modelled чесно позначено InternalConsistency, ReferenceImpl або ExternalDataset; рядки Partner не мають оракула Kshana" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Найгірша похибка положення SGP4/SDP4 порівняно з еталоном AIAA 2006-6753 за режимами, логарифмічна шкала: кожен режим значно нижче допуску AIAA, найгірший випадок 4.12 mm у нерезонансному режимі далекого космосу" width="96%">
  <br><sub>Угорі: кожен рядок Validated підкріплено зовнішнім набором даних за побудовою. Унизу: SGP4 збігається з офіційним еталоном у кожному режимі (найгірше 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Статус верифікації для всіх 401 можливостей: 176 Validated (перевірено за зовнішнім оракулом), 221 Modelled, 4 належать Partner" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Домени можливостей

Кожна можливість публічної карти, за доменами, з позначкою в реєстрі. Таблицю доменів записує
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) з `web/capabilities.json` — того самого файлу, який
читає карта всього в Studio.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Можливості Kshana за доменами і зрілістю: перевірені і змодельовані публічні можливості в кожному домені, побудовано з web/capabilities.json за допомогою tools/gen_validation_figures.py" width="900">
</picture>

Повна таблиця, домен за доменом з кожною можливістю та її позначкою, — це [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Встановлення

Інструмент командного рядка встановлюється одним рядком: **`cargo install kshana`**. Кожен канал постачає
v0.40.0 з того самого позначеного тегом коміту.

<!-- channels:begin -->
| Канал | Встановлення | Посібник |
|---|---|---|
| Спробувати в браузері | відкрийте https://kshana.dev | [Посібник зі Studio](https://kshana.dev/docs/studio.html) |
| Командний рядок (Rust) | `cargo install kshana` | [Використання командного рядка](https://kshana.dev/docs/rust.html#usage--cli) |
| Бібліотека Rust | `cargo add kshana` | [Довідка API на docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Посібник з Python API](https://kshana.dev/docs/python-api.html) |
| JavaScript і WebAssembly | `npm install kshana` | [Посібник з npm і WebAssembly](https://kshana.dev/docs/npm.html) |
| AI-асистент (сервер MCP, cargo) | `cargo install kshana-mcp` | [Посібник із сервера MCP](https://kshana.dev/docs/mcp.html) |
| Образ Docker | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Посібник із сервера MCP: Docker](https://kshana.dev/docs/mcp.html#install) |
| Розширення Claude Desktop | двічі клацніть `.mcpb` для своєї системи: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (одним клацанням) | [Додати до Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Додати до Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (одним клацанням) | [Встановити у VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Встановити у VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Готовий двійковий файл | завантажте kshana-mcp-<target> з випуску і перевірте його за SHA256SUMS | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Офіційний реєстр MCP | шукайте io.github.ashfordeOU/kshana-mcp | [Усі фрагменти встановлення MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Віддалений (streamable HTTP), власний хостинг | `kshana-mcp --http 127.0.0.1:8080` | [Посібник із власного хостингу](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Маркетплейс плагінів Claude Code | `/plugin marketplace add ashfordeOU/kshana` | [Використання Kshana з агента](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| Плагін JetBrains IDE | Settings → Plugins → Marketplace → шукайте "Kshana" (ID плагіна dev.kshana.ide) | [Посібник із плагіна](https://kshana.dev/docs/jetbrains.html) |
| Плагін Signal K | `npm install signalk-kshana-trust` | [Посібник із плагіна Signal K](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| Плагін OpenCPN | завантажте tar-архів плагіна з випуску | [Подання до каталогу OpenCPN](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Панель Grafana | імпортуйте kshana-grafana-*.json з випуску | [Вихідний код панелі](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Образ еталонного збирання | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Морські інтеграції](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana на JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Збирається з Rust 1.88 або новішим, rust-version у Cargo.toml"></a></p>

MCP — це Model Context Protocol. Закріпіть випуск командою `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` або `npm install kshana@0.40.0`. Щоб зібрати з вихідного коду, див.
[Встановлення і збирання](#install--build) у розділі «Довідка».

<details>
<summary>Запуск сценарію з Python і з WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Окрім `run`, модуль надає `run_full` (JSON, SVG і однорядковий підсумок одразу),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` і `error_kind`; див.
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

Пакет npm — це весь рушій, скомпільований у WebAssembly. У Node.js передайте двійковий файл до
`initSync`; у браузері `await init()` завантажує його (див. [`README.npm.md`](README.npm.md)).

```js
import { readFileSync } from "node:fs";
import { createRequire } from "node:module";
import { initSync, run, summary, version } from "kshana";

const wasm = createRequire(import.meta.url).resolve("kshana/kshana_bg.wasm");
initSync({ module: readFileSync(wasm) });

const toml = readFileSync("clock-holdover.toml", "utf8");
const result = JSON.parse(run(toml));
console.log(version(), result.quantum.fom.holdover_s, result.classical.fom.holdover_s);
// 0.40.0 6600 2610
console.log(summary(toml));
```

</details>

<a id="architecture"></a>
## Архітектура

У центрі стоїть один відкритий рушій, і кожен інтерфейс запускає саме його: командний рядок, бібліотека
Rust, Python, WebAssembly і Kshana Studio, сервер MCP, образ Docker і
плагін JetBrains. Той самий файл сценарію дає ті самі байти на кожному з них. Kshana Pro розташовано
зверху як окрему надбудову, що залежить від рушія і ніколи не створює його форк.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Архітектура Kshana: один відкритий рушій у центрі, kshana 0.40.0 за ліцензією AGPL-3.0, з api::run_toml, типізованим диспетчером для кожного виду, і реєстром верифікації з 401 можливості (176 VALIDATED, 221 MODELLED, 4 PARTNER). Навколо нього кожен інтерфейс запускає той самий рушій: командний рядок (cargo install kshana); бібліотека Rust (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); сервер MCP (cargo install kshana-mcp); образ Docker (ghcr.io/ashfordeou/kshana-mcp); плагін JetBrains (Marketplace: &quot;Kshana&quot;). Під ним — Kshana Pro, пропрієтарна надбудова, що залежить від відкритого рушія як від бібліотеки, ніколи не створює його форк і не додає жодної фізичної моделі." width="100%">
</picture>

<details>
<summary>Усередині рушія: доменні шари і реєстр верифікації</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Архітектура Kshana за шарами. П'ять вхідних дверей (командний рядок, Python, JavaScript і WebAssembly, сервер MCP і плагін JetBrains) ведуть до одного api::run_toml, типізованого диспетчера для 92 видів. Під ним — вісім доменних шарів: час і системи відліку, годинники і синхронізація часу, інерціальна навігація і злиття, GNSS і цілісність, астродинаміка, LEO PNT, Місяць, Марс і далекий космос, а також місії і дослідження, на спільному ядрі, усі перехресно пов'язані модулем верифікації — машинно перевірюваною матрицею з 401 можливості, яка є єдиним джерелом істини для кожної позначки." width="100%">
</picture>

**Один рушій, багато вхідних дверей.** Одне ядро на Rust (`kshana`) запускає кожен сценарій,
доступне через CLI, розширення Python, модуль WebAssembly в браузері, **сервер
MCP** для AI-агентів і **плагін JetBrains IDE** — усі вони сходяться на одному
диспетчері `api::run_toml`. Усередині пакети датчиків підключаються до спільного інтерфейсу
моделі похибок; поруч із ними розташовані **шар систем відліку** (прецесія–нутація IAU 2006/2000A
і редукція GCRS↔ITRS на основі CIO), **астродинамічний/числовий
шар** (аналітичний SGP4/SDP4 **і** числовий пропагатор Cowell з його
моделлю сил EGM2008/збурень, проєктування маневрів і визначення орбіти),
**шар цілісності/GNSS** (RAIM/ARAIM, SBAS, домен вимірювань, глушіння, цисмісячний простір),
**шар злиття / alt-PNT** (оцінювачі GNSS/INS і зіставлювачі з гравітаційними/рельєфними/магнітними
картами), **шар далекого космосу і Місяця** (радіометричний Mars-PNT і
набір місячного PNT, з рівнем доказів для кожної частини в матриці — час LTC, VLBI, спільне OD+годинник, реалізація системи відліку, обсяг обслуговування,
диференційний PNT, сумісність), **шар аналізу місії** (бюджети запуску / входу в атмосферу / покриття /
наведення / пролітань / ліній і середовище космічної погоди) і відкритий
**шар досліджень стійкості та AI/ML** (оцінювання стійкості RPCF, розрив оптимізму
РЧ-порушень і демонстратор quantum-enabled PNT), чиї відтворювані артефакти працюють на
перевірених ядрах.

Два окремі крейти, **виключені з робочого простору**, стоять поруч із ядром — `mcp/kshana-mcp`
(сервер MCP, побудований на SDK `rmcp` редакції 2024) і `xval/anise-frames` (перехресна перевірка
систем відліку ANISE/SPICE, яка підтягує залежності MPL-2.0 (Mozilla Public License 2.0)), — їх виключено з графа залежностей
опублікованого крейта, `Cargo.lock`, ліцензійної перевірки і збирання MSRV (мінімальна підтримувана версія Rust) списком `exclude` кореневого
`Cargo.toml`. Плагін JetBrains (`ide/jetbrains`) — окремий проєкт на Kotlin.
Повний набір діаграм див. у [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

Відрендерені діаграми (потік рушія, карта модулів, поширення) є в [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Діаграми

Діаграми — це джерела Mermaid у [`docs/diagrams/`](docs/diagrams/), відрендерені в SVG і PNG у
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` на Linux, два інші
скрипти `render-diagram` деінде), і запис прив'язує кожен PNG до точного SVG, з якого його отримано. Тести закріплюють
кількості, які вони зазначають. Графіки в розділах вище намальовано інструментами із запусків рушія; ці показують, як
частини поєднуються.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Система: шість вхідних дверей (командний рядок, Python, WebAssembly і npm з Kshana Studio, сервер MCP з плагінами і навичками, плагін JetBrains, інтеграції) усі викликають один диспетчер для кожного виду сценарію, який запускає один рушій зі спільного ядра, пакетів датчиків і систем відліку та доменних моделей і записує відтворюваний результат і графік" width="900"><br>
  <sub>Один диспетчер, один рушій, відтворюваний вивід · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · джерело <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Інтерфейси: один детермінований офлайн-рушій живить командний рядок, бібліотеку Rust, Python, WebAssembly і npm та сервер MCP; Studio працює на збиранні WebAssembly, команди плагіна і навички — на сервері MCP, інтеграції і набори розгортання — на командному рядку, а плагін JetBrains — на бібліотеці" width="900"><br>
  <sub>Кожен інтерфейс, з того самого рушія · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · джерело <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Усередині одного запуску: файл сценарію із зерном і часовою шкалою GNSS живить рушій, який на кожному часовому кроці розвиває модель похибок, запускає оцінювач і оцінює показники якості, а потім записує відтворюваний результат і графік" width="900"><br>
  <sub>Внутрішній цикл запуску · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · джерело <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Довіра до приймача: журнал або потік приймача приймається в спостережувані для кожної епохи і власні прапорці приймача, проходить через монітори і стає консультативною оцінкою довіри з діапазоном і причинами, яка живить Studio, телеметрію, підписаний пакет доказів, оцінювання Jammertest і bench та звіт про відповідність" width="900"><br>
  <sub>Від журналу приймача до оцінки довіри і того, що її використовує · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · джерело <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Лабораторний цикл туди й назад: сценарій експортується з подіями та умовами випробування, оператор поза Kshana відтворює файл через лабораторний симулятор, журнал приймача оцінюється відносно зазначених подій, а цикл доказів пов'язує хеші сценарію, умов і журналу та оцінку в підписаний пакет" width="420"><br>
  <sub>Від сценарію до підписаного пакета; Kshana ніколи не створює і не відтворює сигнал · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · джерело <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: браузер локально запускає рушій, скомпільований у WebAssembly, нічого не вивантажуючи, бере вбудовані сценарії або відкритий вами сценарій чи журнал і показує результат у простому поданні, розширеному поданні і на сторінках завдань, з експортами, які зберігає користувач" width="900"><br>
  <sub>Як Studio працює, локально · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · джерело <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Потік тестування і випуску: локальні перевірки (форматування, clippy, перевірка відсутності атрибуції, храповик покриття документацією і scripts/gate.sh, який запускає повний набір і повторні запуски та записує квитанцію, яку перевіряє хук pre-push) ведуть до pull request лише через CI і зеленого повного CI; власник перемотує main до зеленого коміту, і на нього ставиться анотований тег після перевірки синхронізації версій; робочий процес випуску перевіряє повний набір на позначеному тегом коміті, перш ніж щось опублікувати, збирає двійкові файли з SBOM, контрольними сумами і походженням збирання, публікує на crates.io, PyPI, npm, у реєстр контейнерів, реєстр MCP і JetBrains Marketplace, опитує кожен реєстр, доки той не почне віддавати нову версію, і запускає збирання сайту з тегу; окремий шлях лише для сайту запускає робочий процес pages з тегом main і відхиляється, якщо поза web/ і .github/ щось змінилося з моменту останнього випуску" width="900"><br>
  <sub>Потік тестування і випуску, від локальних перевірок до перевіреного випуску і шляху лише для сайту · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · джерело <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Карта модулів: командний рядок, Python, WebAssembly, сервер MCP і плагін JetBrains викликають типізований диспетчер для кожного виду, який досягає спільного ядра, часу і систем відліку, пакетів датчиків, астродинаміки, цілісності, виявлення спуфінгу, злиття, далекого космосу і Місяця, стійкості та модулів арбітра і бенчмарку, усе це гарантоване матрицею верифікації" width="1000"><br>
  <sub>Де живе код · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · джерело <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Поширення: один репозиторій постачає основний крейт, сервер MCP, плагін IDE і крейти перехресної перевірки на crates.io, PyPI, npm, GitHub Releases, пісочницю Pages, реєстр контейнерів, реєстр MCP і JetBrains Marketplace, з архівом Zenodo" width="900"><br>
  <sub>Що куди постачається і що це перевіряє · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · джерело <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## AI-асистент

[`kshana-mcp`](mcp/kshana-mcp/) — це сервер MCP: ваш асистент запускає справжній рушій і
читає його JSON, замість того щоб вгадувати математику. Кожен із його 49 інструментів — тонка обгортка
над публічною функцією бібліотеки `kshana`, тож у сервері немає логіки симуляції.

### Встановлення сервера MCP

> Консультативно, не навігаційне обладнання із затвердженням типу: відповідальність за навігацію залишається на операторі.
> Сервер працює на вашому комп'ютері; нічого не надсилається до Ashforde OÜ.

Виберіть будь-який канал. Кожне посилання і фрагмент згенеровано одним скриптом
(`scripts/gen_mcp_install.py`) і перевірено в безперервній інтеграції; фрагменти для Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI і Continue є в
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Канал | Команда або кнопка | Потрібно | Закріплена форма |
|---|---|---|---|
| Розширення Claude Desktop | двічі клацніть `.mcpb` для своєї системи: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | нічого | `kshana-mcp-<target>.mcpb` з v0.40.0 |
| Cursor (одним клацанням) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node або Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (одним клацанням) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node або Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · плагін: `/plugin marketplace add ashfordeOU/kshana`, потім `/plugin install kshana@ashforde` | Node (або Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ з uv або pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | формула для v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket`, потім `scoop install kshana-mcp` | Scoop (Windows) | маніфест для v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Готовий двійковий файл | [сторінка випуску](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, перевіряється через `SHA256SUMS` і `gh attestation verify` | нічого | v0.40.0 |
| Реєстр MCP | `io.github.ashfordeOU/kshana-mcp` (знаходять клієнти з підтримкою реєстру) | клієнт із підтримкою реєстру | `0.40.0` |
| Віддалений (streamable HTTP) | `kshana-mcp --http 127.0.0.1:8080`, власний хостинг: див. [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | ваш власний хост | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp на Glama, оцінка якості його сервера MCP"></a></p>

У Claude Code той самий сервер надходить як плагін: `/plugin marketplace add ashfordeOU/kshana`, потім
`/plugin install kshana@ashforde`. Плагін додає слеш-команди поверх інструментів: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` і `/kshana-jammertest`. Інструменти довіри до судна живлять інтеграції Signal K і
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Налаштування для кожного клієнта є в [`docs/integrations.md`](docs/integrations.md). Сервер зареєстровано
в офіційному реєстрі MCP як `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>49 інструментів</summary>

<br>

**Сценарії і звіти**

| Інструмент | Що робить |
|---|---|
| `run_scenario` | Запускає сценарій із визначення TOML (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | 92 вбудовані види сценаріїв з описами + обов'язковими/необов'язковими полями — щоб агент міг побудувати дійсний сценарій |
| `validate_scenario` | Попередня перевірка: розбирає TOML і визначає його вид, без запуску |
| `list_example_scenarios` | Вбудовані еталонні сценарії як JSON |
| `get_example_scenario` | Текст TOML одного вбудованого еталонного сценарію, байт у байт файл у `scenarios/` |
| `report_scenario` | Запускає сценарій і повертає його звіт |
| `animate_scenario` | Запускає сценарій і повертає його часові ряди як анімацію |
| `sky_geometry` | Геометрія неба під залежною від азимута лінією горизонту: видимі і приховані супутники, DOP, коваріація схід-північ-угору і горизонтальний еліпс похибки; або пресет лінії горизонту з його походженням |

**Експорт і сумісність**

| Інструмент | Що робить |
|---|---|
| `list_export_formats` | Які формати сумісності застосовні до сценарію (`czml`, `kml`, `geojson`, `stk`, `sigmf`), причина, коли формат не застосовний, і специфікація, якої дотримується кожен записувач |
| `export_interop` | Експортує сценарій як CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, ефемериди STK (Systems Tool Kit) `.e` або SigMF (Signal Metadata  |
| `import_route` | Записує маршрут GeoJSON `LineString` у сценарій, що пролітає траєкторію за точками маршруту (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`), і повертає новий TOML |
| `export_sp3` | Експортує сузір'я сценарію `orbit` як точні ефемериди SP3-c (Standard Product 3, revision c) |
| `export_omm` | Експортує елементи сценарію `orbit` як каталог OMM (Orbit Mean-elements Message) CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 |
| `export_oem` | Експортує ряд станів сценарію `orbit` як ефемериди CCSDS OEM (Orbit Ephemeris Message) 2.0 — положення TEME (true equator, mean equinox) *і*  |
| `export_table_csv` | Запускає сценарій і повертає його таблицю відтворюваності як CSV (значення, розділені комами) — побайтово стабільну таблицю, яку CLI (інтерфейс командного рядка) записує як `<scenario>.table.csv` |
| `export_test_bench` | Рух транспортного засобу і події сценарію для лабораторного симулятора GNSS (`kshana bench-export`) |

**Довіра до приймача і судна**

| Інструмент | Що робить |
|---|---|
| `assess_receiver_log` | Оцінює довіру до журналу реального приймача GNSS (глобальної навігаційної супутникової системи) |
| `assess_vessel_stream` | Оцінює обмежений фрагмент NMEA 0183 (щонайбільше 2 MiB і 20,000 епох |
| `assess_vessel_log` | Журнал NMEA 0183 судна (щонайбільше 4 MiB) як пакетний запуск, із сеансовим TOML, що зазначає межі судна |
| `create_evidence_pack` | Підписаний пакет доказів для вікна журналу судна (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Прив'язує маркер часу RFC 3161 (base64 байтів `.tsr`) до пакета, у пам'яті (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Перевіряє пакет (`kshana evidence verify`) |
| `generate_training_nmea` | Синтетичний NMEA 0183 містка для навчання екіпажу з TOML `nmea-scenario` (глушіння, відтягування положення, спуфінг часу, затримка повторення) з журналом інструктора (`kshana-nmea-training/1`) |
| `build_interference_map` | Карта завад GNSS зі звітів про положення ADS-B або AIS як текст CSV (щонайбільше 4 MiB) |
| `route_exposure` | Частка довжини маршруту в погіршених, не погіршених, неоцінених і не спостережених комірках однієї чи кількох карт завад, за потреби в межах діапазону дат |
| `trust_telemetry` | Потік довіри (рядки JSON) або результат `receiver-trust`, відрендерений як текст Prometheus, рядки syslog CEF або LEEF чи корисне навантаження OTLP JSON, кодувальниками `kshana trust-telemetry` |
| `jammertest_import` | Читає опублікований каталог випробувань Jammertest і план передавання (NPRA/jammertest-plan, MIT) як заплановану істину (`kshana jammertest import`): слоти однієї зони випробувань стають подіями receiver-trust з ідентифікатором каталогу і роком у кожній мітці. Заплановані слоти, а не записані фактичні моменти ефіру; жодне контактне поле плану не читається. MODELLED. Див. [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Оцінює журнал приймача за цим розкладом (`kshana jammertest score`): для кожного випробування затримку виявлення, пропущені тривоги і час до відновлення, а також хибні тривоги поза всіма слотами. Текстові журнали як `log`, двійкові (`ubx`, `sbf`) як `log_base64`. Підписаному пакету потрібен ключ: командний рядок. Лише консультативно; MODELLED. |
| `fit_imu_log` | Параметри акселерометра і гіроскопа сценаріїв `hybrid` і `fusion`, підігнані зі стаціонарного журналу IMU (CSV або EuRoC) за девіацією Аллана, з готовою до вставлення таблицею `[accel_classical]` і SHA-256 журналу (`kshana imu-fit`). Текст на вході, JSON на виході; MODELLED. |

**GNSS IQ (файли робочого каталогу; вимкнено в режимі HTTP)**

| Інструмент | Що робить |
|---|---|
| `iq_signals` | Налаштування шару GNSS IQ |
| `iq_info` | Описує один запис IQ (синфазний і квадратурний) у робочому каталозі без його обробки |
| `iq_scene` | Генерує багатосупутникову сцену GNSS IQ у робочому каталозі (`kshana iq scene`) |
| `iq_acquire` | Захоплення FFT (швидким перетворенням Фур'є) одного чи кількох PRN (псевдовипадкових шумових кодів) у записі (`kshana iq acquire`), за потреби після етапів вхідного каскаду |
| `iq_track` | Захоплює, потім супроводжує банком DLL/PLL/FLL (контурів стеження за затримкою, фазою і частотою) (`kshana iq track`), з контурами з `kshana.loop-desig |
| `iq_frontend` | Застосовує DSP (цифрову обробку сигналів) вхідного каскаду приймача і пом'якшення завад |
| `iq_sweep` | Відтворює один запис IQ у робочому каталозі з кількома проєктами контуру супроводу (`kshana iq sweep`) |
| `iq_monitor` | Запускає монітори виявлення завад і спуфінгу над записом IQ у робочому каталозі (`kshana iq monitor`) |
| `iq_labfit` | Підганяє модель втрати захоплення контуру супроводу до лабораторних запусків (`kshana iq labfit`) зі сценарію `iq-labfit`, журнали якого вбудовані (`text` або `base64` |
| `iq_test_conditions` | Перевіряє файл `kshana.test-conditions/1`, наданий як текст, і повертає розв'язані умови з їхнім хешем |
| `iq_campaign` | Запускає кампанію лабораторного відтворення (`kshana iq campaign`) |
| `iq_campaign_status` | Поступ теки виводу кампанії |

**Відповідність**

| Інструмент | Що робить |
|---|---|
| `compliance_report` | Відображення на публічні рамки, заповнене з документів результатів, наданих як текст (`kshana compliance-report`) |
| `compliance_mapping` | Статичні таблиці відображення (або, з `sources`, вихідні документи, на які вони посилаються, з версіями та URL) як Markdown, на початку з тією самою заявою |
| `list_standards_packs` | Пакети стандартів (`kshana standards-pack list`): оцінювані набори сценаріїв для профілів випробувань рамки DHS Resilient PNT, IMO MSC.1/Circ.1575 і ICAO Doc 9849 Appendix F |
| `run_standards_pack` | Запуск одного пакета відносно порогів, зазначених до запуску: кожне випробування `MET`, `NOT MET` або `NEEDS INPUT`; MODELLED, не оцінює жоден продукт |
| `lunanet_afs_check` | LunaNet Augmented Forward Signal, перевірений за LNIS V5 AD1 Volume A (LSIS-AFS V1.0): коди за надрукованими таблицями або потік символів за форматом кадру; LDPC і CRC-24Q підкадрів 2–4 не перевіряються |
| `create_round_trip_pack` | Підписаний пакет лабораторного циклу туди й назад: сценарій, документ `kshana.test-conditions/1`, журнал приймача і оцінка, пов'язані хешем |

**Бенчмарк**

| Інструмент | Що робить |
|---|---|
| `score_benchmark` | Подання kshana-bench, оцінене за файлом істини, обидва як текст JSON (`kshana bench score`, `bench/SPEC.md`): файл результату з версією специфікації, розбиттям, хешами вхідних даних і метриками завдання. MODELLED; описує журнал або корпус, ніколи не продукт. |
| `render_leaderboard` | Файли результатів kshana-bench, відрендерені як статична сторінка таблиці лідерів (текст HTML), кожен спершу перевіряється. |

</details>

<a id="editions"></a>
## Редакції

Увесь рушій безкоштовний. Kshana Pro і замовні дослідження призначені для програм, яким потрібно більше,
і кожен платний шлях починається з повідомлення: цін тут немає.

| | Free | Kshana Pro | Замовне дослідження |
|---|---|---|---|
| Що це | увесь відкритий рушій, усі 92 види сценаріїв, без обмеження функцій | пропрієтарна надбудова над тим самим рушієм, за договором | дослідження стійкості PNT вашої системи (MODELLED), виконане для вас |
| Ліцензія | AGPL-3.0 (GNU Affero General Public License, версія 3) або комерційна ліцензія | пропрієтарна | договір |
| Як почати | [встановіть](#install) або відкрийте [kshana.dev](https://kshana.dev) | [запросити оцінювання Pro](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [запросити дослідження](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Що таке Pro, словами [`docs/PRO.md`](docs/PRO.md):

> **Строга надмножина відкритого Kshana.** Pro залежить від відкритого рушія як від бібліотеки і
> ніколи не створює його форк. Кожен відкритий вид сценарію працює в Pro без змін, а відкритий сценарій працює
> в Pro взагалі без ліцензії.
>
> **Жодної нової фізики.** Pro не додає жодної фізичної моделі і не змінює жодної. Кожне число Pro походить
> із запусків відкритого рушія, тож показник Pro настільки ж надійний, як відкритий вид сценарію,
> з якого він походить, і ніколи не більше.

Pro відповідає на наступні запитання програми: який проєкт запускати в політ (оптимізатор проєктів і його
фронт Парето), наскільки певна відповідь (невизначеність і чутливість) і чи відповідає місія
своїм вимогам (досьє місії, простежуваність вимог, компромісні дослідження, регресійна перевірка
сценаріїв, цифрові двійники годинників, досьє дослідження і локальна
служба). Він також стежить за кампанією показників і зупиняє конвеєр, коли якийсь із них погіршується,
тестує кандидатні плани сигналів відносно відкритих сигналів супутникової навігації в обох
напрямках (співіснування в спектрі) і ставить дослідження в чергу в локальній службі завдань з
реєстром доставлення на хеш-ланцюжку. Кожну функцію описано, разом із тим, що вона створює і чого не робить, у
[`docs/PRO.md`](docs/PRO.md). Ніщо, що створює Pro, не є сертифікацією, і замовне дослідження
теж не є сертифікацією.

<details>
<summary>Що Kshana Pro читає з відкритого рушія, і підтримка від Ashforde® OÜ</summary>

<br>

**На чому будується Kshana Pro.** Кожна частина Pro працює з відкритим рушієм і залишає
його незмінним:

- **Оптимізатор проєктів, дослідження невизначеності і досьє місії** запускають сценарії відкритого рушія
  через публічний інтерфейс рушія і обчислюють кожне число з результатів
  запусків. Кожен вихід зберігає рівень VALIDATED, MODELLED або PARTNER, який відкритий рушій надав
  кожному показнику, ніколи не вищий.
- **Цифрові двійники годинників** використовують модель годинника відкритого рушія і його оцінювач
  девіації Аллана: двійника калібрують за опублікованим бюджетом Аллана пристрою, а потім перевіряють,
  оцінюючи девіацію Аллана двійника відкритим оцінювачем.
- **Компромісні дослідження** запускають кожен варіант архітектури як сценарій відкритого рушія, без змін,
  і ранжують варіанти за показником якості, прочитаним із результату кожного запуску.
- **Стеження за кампанією** зчитує свої показники з результатів запусків відкритого рушія для
  сценаріїв у пакеті і порівнює їх із попереднім успішним запуском.
- **Співіснування в спектрі** зчитує кожне фізичне число із запусків відкритого рушія видів
  `leo-signal` і `constellation-design` і додає лише суму за видимими супутниками
  та ранжування планів.
- **Локальна служба завдань** запускає відкриті сценарії і сценарії Pro через той самий рушій і
  зберігає кожен результат таким, яким його повернув запуск.
- **Пакети доказів** записують для кожного запуску хеш сценарію, який відкритий рушій ставить на
  свій результат, тож показник у пакеті можна відтворити, повторно запустивши його сценарій.
- **Інструменти системної інженерії та програм.** Інструменти Kshana Pro для системної інженерії на основі
  моделей (MBSE) і програм перевіряють вимоги програми
  за запусками відкритого рушія: вони імпортують вимоги як значення, розділені комами
  (CSV), або як задокументовану підмножину Requirements Interchange Format (ReqIF) чи
  тексту Systems Modeling Language версії 2 (SysML v2), оцінюють кожен критерій
  приймання з його одиницею за значеннями, які записав запуск, і створюють матрицю
  перехресних посилань верифікації (VCRM), модель SysML v2, звіт про вплив змін і офлайн-пакет
  доказів. Вони нічого не перезапускають і не перераховують і читають лише те, що публікує відкритий рушій:
  `result.json` кожного запуску (поля, які називає критерій, їхні одиниці, штамп
  відтворюваності з хешу сценарію, зерна, версії рушія і версії схеми, а також
  позначку запуску і рівні показників), його `report.json` (вид, запис відтворюваності і
  позначки можливостей), файл сценарію (його хеш, вид, зерно і параметри), схему
  одиниць полів (одиниця, походження і рівень доказів кожного поля) і
  матрицю верифікації (позначку VALIDATED, MODELLED або PARTNER кожної можливості).

<a id="support--professional-services"></a>
### Підтримка і професійні послуги

Kshana є вільним програмним забезпеченням з відкритим кодом за ліцензією AGPL-3.0 і **професійно розробляється та
супроводжується Ashforde® OÜ** (Естонія). Відкритий рушій повний і придатний до використання
самостійно. Для організацій, яким потрібно більше, Ashforde® OÜ пропонує:

- **Комерційна підтримка та інтеграція** — вбудовування Kshana у ваш ланцюжок інструментів, замовні
  сценарії і пріоритетні виправлення.
- **Замовні моделі датчиків** — відкалібровані під ваше обладнання, включно з чутливими щодо експорту
  моделями стійкості, що супроводжуються в приватній надбудові.
- **Kshana Pro** — пропрієтарні інструменти системної інженерії на основі моделей (MBSE) і програм,
  які перевіряють вимоги програми за запусками відкритого рушія і
  створюють матрицю перехресних посилань верифікації (VCRM), модель Systems Modeling Language
  версії 2 (SysML v2), звіт про вплив змін і офлайн-пакет доказів. Вони
  нічого не перезапускають і читають лише опубліковані виходи рушія: `result.json`
  і `report.json` кожного запуску, файл сценарію, схему одиниць полів і позначки матриці
  верифікації (повний перелік — у розділі [Редакції](#editions)).
- **Інструменти Kshana Pro для проєктування, невизначеності та місій** — фронт Парето простору
  проєктів, невизначеність і чутливість за тисячами запусків і досьє місії однією командою
  з матрицею верифікації і PDF; див. [`docs/PRO.md`](docs/PRO.md).
- **Стеження за кампанією, співіснування в спектрі і служба завдань Kshana Pro** — конвеєр, що
  зупиняється, коли відстежуваний показник погіршується, плани сигналів, протестовані відносно відкритих
  сигналів супутникової навігації в обох напрямках, і локальна черга завдань з
  реєстром доставлення на хеш-ланцюжку; див. [`docs/PRO.md`](docs/PRO.md).
- **Навчання і консультації** з аналізу характеристик квантового/класичного PNT.

Це модель open-core: рушій має і зберігатиме відкриту ліцензію; бізнес, що його підтримує, —
це експертиза, підтримка і пропрієтарні розширення, а не ліцензійні платежі.
Контакт: **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Дослідження

Дослідження, побудовані на відкритому рушії, публікуються на arXiv. Кожне називає команду рушія,
що стоїть за ним, тож його числа можна перегенерувати із закоміченого сценарію чи прикладу дослідження.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Дослідження, побудовані на відкритому рушії: шість статей на arXiv, кожна картка називає статтю, її дату і категорію та команду рушія, що перегенеровує її числа. Ті самі шість статей із посиланнями і командами наведено в таблиці нижче." width="100%">
</picture>

| Стаття | Що вона показує | Команда рушія |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | Падіння оцінки детектора завад GNSS після зсуву умов можна передбачити лише зі статистик усередині розподілу — на відкритому синтетичному стенді, а потім на відкритих польових записах. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Приймач синхронізації часу GNSS під час спуфінгу не має скінченної безумовної межі невиявленої похибки часу, тому стаття дає умовну, відкалібровану на записаному в ефірі спуфінгу з публічної кампанії JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Одна складена оцінка стійкості є стабільною основою для рішення лише там, де один проєкт домінує; там, де проєкти конкурують, саме лише перезважування може змінити переможця. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Далекометрія всередині місячного сузір'я залишає абсолютне положення поверхневої станції неспостережуваним; затримка інтерферометрії з наддовгою базою (VLBI) від Землі відновлює його, коли сузір'я розріджене, і загострює, коли воно насичене. | вид `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Заплановані сузір'я з чотирьох–шести супутників дають погану геометрію на південному полюсі Місяця, а кілька поверхневих далекомірних маяків виправляють її значно дешевше, ніж додаткові супутники. | вид `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Геометричний фактор точності не визначений для цисмісячного супроводу лише за дальністю, бо швидкість неспостережувана в окремому знімку, тому стаття використовує граміан спостережуваності на чотирьох плоских далеких ретроградних орбітах: лише дальність дає ранг 2 із 4 у знімку і потребує дуги близько 2.09 h, щоб стати повністю спостережуваною, а обумовленість поліпшується з подовженням дуги; швидкість зміни дальності (Доплер) дає ранг 4 миттєво; а спільне оцінювання станції зі станами і годинниками супутників залишається дефіцитним за рангом на одиницю, якщо не додати зовнішню інтерферометричну спостережувану. Вимоги належать до бюджетів довжини дуги, обумовленості і типу вимірювань, а не DOP. | вид `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (споріднений `cislunar-arc-recovery` перевіряє поріг незалежним оцінювачем на скінченних різницях) |

Три приклади досліджень записують побайтово детерміновані артефакти (фіксовані зерна), які фіксують
версію рушія, зерна і хеш конфігурації. Три статті про Місяць і цисмісячний простір побудовано на
місячному наборі (рівень доказів кожної частини наведено в матриці верифікації); їхні твердження щодо геометрії і геометричного фактора точності також перехресно перевірено
незалежними оракулами в `tests/validate_p*.rs`. Більше — у
[Відтворюваних артефактах досліджень](#reproducible-study-artifacts) у розділі «Довідка».

<a id="cite"></a>
## Цитування

Якщо ви використовуєте Kshana в академічній чи технічній роботі, будь ласка, цитуйте використану версію разом зі
сценарієм і зерном. [`CITATION.cff`](CITATION.cff) містить машиночитні метадані, і
GitHub показує на їх основі кнопку "Cite this repository". Кожен випуск архівується на Zenodo;
концептуальний DOI (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) завжди вказує на
останню версію.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Статті вище:

> Baweja, C. (2026). *Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*. arXiv:2606.22054. https://doi.org/10.48550/arXiv.2606.22054
>
> Baweja, C. (2026). *A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*. arXiv:2606.24210. https://doi.org/10.48550/arXiv.2606.24210
>
> Baweja, C. (2026). *How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*. arXiv:2607.05415. https://doi.org/10.48550/arXiv.2607.05415
>
> Baweja, C. (2026). *Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*. arXiv:2607.02566. https://doi.org/10.48550/arXiv.2607.02566
>
> Baweja, C. (2026). *The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*. arXiv:2607.06212. https://doi.org/10.48550/arXiv.2607.06212
>
> Baweja, C. (2026). *Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*. arXiv:2610.23871. https://doi.org/10.48550/arXiv.2610.23871

<a id="licence"></a>
## Ліцензія

Kshana має подвійну ліцензію: GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)) або
**комерційна ліцензія** від Ashforde® OÜ для закритої інтеграції, якій не підходить AGPL.
[`LICENSING.md`](LICENSING.md) пояснює, яка з них застосовується. Внески ліцензуються на вході
за AGPL і також надають Ashforde® OÜ право включати їх до комерційної
редакції; підписуйте кожен коміт за допомогою `git commit -s` (див. [`CONTRIBUTING.md`](CONTRIBUTING.md)).
"Kshana" та його знаки є торговельними марками Ashforde® OÜ: ліцензія охоплює код, а не
назву, тож, будь ласка, перейменовуйте форки.

<a id="reference"></a>
## Довідка

Об'ємний матеріал, згорнутий. Кожен документ перелічено в розділі [Документація](#documentation).

<details>
<summary>Встановлення і збирання з вихідного коду</summary>

<a id="install--build"></a>
### Встановлення і збирання

Потрібен ланцюжок інструментів Rust (≥ 1.88, `rust-version` у Cargo.toml; розробляється на 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Використання: командний рядок повністю</summary>

### Використання

Запустіть будь-який сценарій; CLI вибирає обробник за полем `kind` сценарію і записує
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` і
`<scenario>.report.json` поруч із ним — плюс `<scenario>.table.csv` для видів, що
публікують таблицю. Звіт (сторінка HyperText Markup Language (HTML) і документ JSON
з тим самим вмістом) містить резюме для керівництва, кожен вхідний параметр з його одиницею,
результати і графіки, таблиці перебору, Монте-Карло чи ланцюга кампанії, часову шкалу подій,
позначку VALIDATED / MODELLED / PARTNER і джерело кожної можливості, яку використав запуск,
те, що не змодельовано, і запис відтворюваності (версія рушія, дайджести Secure Hash
Algorithm 256-bit (SHA-256), зерно, платформа і точна команда). Він друкується в
чистий файл PDF (Portable Document Format) з браузера на папері A4 або Letter; сам
рушій PDF не записує. Див. [`docs/REPORTS.md`](docs/REPORTS.md).

```bash
cargo run -- scenarios/clock-holdover.toml
cargo run -- scenarios/imu-deadreckoning.toml
cargo run -- scenarios/timetransfer.toml
cargo run -- scenarios/hybrid-pnt.toml
cargo run -- scenarios/orbit-gnss-challenged.toml
cargo run -- scenarios/orbit-sgp4-gps.toml
cargo run -- scenarios/orbit-rinex.toml
cargo run -- scenarios/integrity-raim.toml

# Export a propagated constellation to an SP3-c precise-ephemeris file:
cargo run -- scenarios/orbit-sgp4-gps.toml --export-sp3 gps.sp3

# Export the constellation's mean elements to a CCSDS OMM catalogue (one OMM
# message per TLE-defined satellite, with its real NORAD id / COSPAR designator):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-omm gps.omm

# Export the velocity-carrying state to a CCSDS OEM 2.0 ephemeris (GMAT/Orekit/STK):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-oem gps.oem

# Export the geometry for a globe, a map or a mission-analysis tool: CZML, KML,
# GeoJSON, STK .e, or SigMF for the spectrum kind (every format that applies):
cargo run -- scenarios/jamming-demo.toml --export all
```

`--export <czml|kml|geojson|stk|sigmf|all|list>` записує CZML (Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), ефемериди Ansys STK (Systems Tool Kit) `.e`
і записи SigMF (Signal Metadata Format) поруч зі сценарієм, а
`--import-route <route.geojson>` подає лінію GeoJSON у види, що пролітають траєкторію. Кожен
формат перевірено за його опублікованою специфікацією, а сценарій, до якого формат не
застосовний, каже чому: див. [docs/INTEROP.md](docs/INTEROP.md).

**Інші режими CLI** — перевірити сценарій, подати реальні дані орієнтації Землі або запустити цілий набір:

```bash
# Lint a scenario without running it (checks the kind + required fields):
cargo run -- --validate scenarios/integrity-raim.toml

# Feed a real IERS Earth-orientation file (finals2000A) for frame precision:
cargo run -- scenarios/orbit-sgp4-gps.toml --eop tests/fixtures/agency/eop/finals2000A_2022001.txt

# Run a SUITE of scenarios into one aggregated, stamped study artifact
# (writes <suite>.study.json + <suite>.study.html next to the manifest):
cargo run -- --study scenarios/quantum-pnt-demonstrator.suite.toml

# Animate a run's time series: an animated SVG, a self-contained HTML player, and a
# numbered SVG frame sequence with manifest.json (see docs/ANIMATION.md):
cargo run -- scenarios/campaign-jam-spoof-holdover-integrity.toml --animate all
```

**Експорт анімації.** `--animate svg|html|frames|all` записує `<scenario>.animation.svg`
(ключові кадри Cascading Style Sheets (CSS), без скриптів), `<scenario>.animation.html` (відтворення, пауза, прокручування, швидкість і
синхронізовані панелі, без зовнішніх ресурсів) і `<scenario>.frames/` (`frame_0000.svg`, … плюс
`manifest.json` з кількістю кадрів на секунду і тривалістю). Кампанія відтворює свої фази і
тривоги, запуск spectrum — свій водоспад; тема відповідає `prefers-color-scheme`, а
`prefers-reduced-motion` показує завершений рисунок. Вона рендерить власні відліки запуску,
байт у байт ідентичні при повторному запуску, і не додає жодних доказів. Див. [docs/ANIMATION.md](docs/ANIMATION.md).

Маніфест **набору** — це невеликий файл TOML (Tom's Obvious, Minimal Language) — `title` і масив `scenarios = [ … ]` шляхів
до сценаріїв, — які рушій запускає по черзі, згортаючи кожен результат (з його
позначками MODELLED / VALIDATED) в один самоописний артефакт дослідження. Див.
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Роль у сумісності.** Kshana — це шар *моделювання характеристик*, що стоїть
поруч із ланцюжком інструментів постобробки, а не його заміна: подайте його вивід **RINEX**
у RTKLIB або gLAB для розв'язку положення, а його вивід **SP3** використовуйте як
продукт точних орбіт для інструментів на кшталт Ginan — Kshana відповідає, *яку стійкість дає певна
архітектура PNT*, ще до того, як у вас з'являться реальні сигнали, у форматах, які ці інструменти вже
приймають (`--export-sp3` або `export_sp3 = true` у сценарії `orbit` записує
`<scenario>.sp3`). Ту саму орбіту можна опублікувати як середні елементи **CCSDS OMM**
за стандартом (`--export-omm` або `export_omm = true` записує `<scenario>.omm`) —
одне повідомлення OMM 502.0 KVN (нотація ключове слово = значення) на кожен супутник, заданий TLE, з реальним
каталожним номером NORAD (North American Aerospace Defense Command), міжнародним позначенням COSPAR (Committee
on Space Research) і епохою кожного об'єкта, для будь-якого
споживача, що розуміє OMM, замість нестандартного набору дворядкових елементів.

Приклад виводу (holdover годинника — зверніть увагу, як повідомляються показники якості Integrity і Security):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Похибка часу оптичного годинника на 95-му процентилі (p95) становить 1.20e-4 ns: підсумок
друкує малі значення зі значущими цифрами, а не округлює їх до `0.0`.
`security` показує `n/a (no attack)`, бо цей сценарій не налаштовує жодної атаки, тож
немає чого виявляти. Результат JSON однак містить аналітичну межу
виявності спуфінгу для кожного годинника в `fom.security` (0.997 для оптичного годинника, 0.000 для
атомного годинника масштабу чипа, власний шум якого за вікно моніторингу перевищує специфікацію 20 ns),
а його блок `figure_tiers` позначає цей показник `applicable: false`. Вид сценарію `spoof`
оцінює виявлення відносно внесеної атаки. `figure_tiers` також надає
кожному повідомленому показнику його рівень верифікації — VALIDATED (перевірено за зовнішнім
оракулом) або MODELLED — і рядок матриці верифікації, з якого зчитано рівень. Сценарій orbit
додатково повідомляє блок геометрії — частку відліків із розв'язком і
найкращий/медіанний геометричний фактор точності положення (PDOP) та точність положення — поряд із
результатом годинника.

> **Читайте ці два числа уважно.** `security` — це *аналітична межа виявності
> спуфінгу*, виведена зі стабільності кожного годинника, — вона має сенс лише щодо
> налаштованого сценарію спуфінгу і **не** є багатосупутниковим детектором RAIM. `integrity`
> тут — це *самоузгодженість* фільтра (частка відліків перерви в межах його власної межі k-сигма),
> **а не** авіаційний показник цілісності HPL/VPL. Див.
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Для справжнього автономного контролю цілісності в приймачі **вид сценарію `integrity`**
> (`scenarios/integrity-raim.toml`) запускає реальний знімковий RAIM і RAIM з розділенням розв'язків
> (у стилі ARAIM) над поширеною геометрією сузір'я: він обчислює
> горизонтальний/вертикальний **рівні захисту (HPL/VPL)** для кожної епохи і повідомляє
> частку епох, що відповідають налаштованим межам тривоги, з діаграмою цілісності Stanford
> для класифікації похибка проти PL (рівня захисту).

<a id="reproducible-study-artifacts"></a>
#### Відтворювані артефакти досліджень

Чотири відкриті дослідження кожне перегенеровують побайтово детермінований артефакт (фіксоване зерно) однією
командою — числа, що стоять за дослідженнями переходу «квантове проти класичного», розриву оптимізму
РЧ-порушень, оцінювання стійкості PNT і рівня захисту часу:

```bash
# Quantum-vs-classical resilience crossover map (writes paper/crossover/*.json):
cargo run --release --bin crossover_study -- paper/crossover

# RF-impairment optimism-gap study (13-detector panel, scaling laws, LOO predictor):
cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json

# Framework-aligned PNT-resilience scoring + decision-instability study:
cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json

# Conditional Timing Protection Level, calibrated on a real recorded spoof:
cargo run --release --example tpl_jammertest
```

Кожен артефакт фіксує версію рушія, зерна і хеш конфігурації та несе чесну
позначку MODELLED/VALIDATED. Зонди реальних даних (`*_probe`) запускають той самий конвеєр над
записами, які ви надаєте локально; жодні набори даних у репозиторії не постачаються. Дослідження розриву оптимізму
РЧ-порушень описано в препринті
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), а умовний рівень захисту
часу (`tpl_jammertest` вище) — у препринті
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (див. [Цитування](#cite)).

Для опублікованих досліджень місячного PNT ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP поверхневих маяків, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) спостережуваність
VLBI і [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) спостережуваність за довжиною дуги в цисмісячному просторі)
твердження щодо геометрії, геометричного фактора точності, прогнозування системи відліку в реальному часі /
параметрів орієнтації Землі (EOP), далеких ретроградних орбіт і РЧ-далекометрії
незалежно перехресно перевірено в
`tests/validate_p*.rs` окремими оракулами (`scipy.special.j1`, незалежний розв'язок DOP на NumPy
`(HᵀH)⁻¹`, повторний розбір на NumPy тих самих рядків IERS `finals2000A` і
NASA/JPL Three-Body Periodic Orbit Database). Це додаткові регресійні перевірки над
**змодельованим** місячним набором; вони не змінюють кількість у машинно перевірюваній матриці.

</details>

<details>
<summary>Формат сценарію</summary>

<a id="scenario-format"></a>
### Формат сценарію

Сценарії — це декларативний TOML. Поле верхнього рівня `kind` вибирає пакет — загалом **п'ятдесят**
(`clock` за замовчуванням, якщо поле пропущено): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (випробувальний стенд оцінювання виявлення РЧ-порушень AI/ML
— розмічений синтетичний корпус + незалежний від детектора каркас ROC/AUC +
розрив оптимізму всередині/поза розподілом), `quantum-trade` (компроміс PNT «квантове проти класичного»
з прийомом виміряної ADEV + обвідна стійкості без GNSS; MODELLED),
`space-weather` (сонячні/геомагнітні індекси + екзосферна температура Jacchia-71 +
термосферна густина, керована активністю, понад статичну атмосферу; MODELLED),
`oem-interop` (міст імпорту/перевірки туди й назад CCSDS OEM для ефемерид GMAT/Orekit/STK;
MODELLED), трійка аналізу місії `launch-window` (азимут запуску задачі двох тіл /
зміна площини / можливості), `reentry` (коридор балістичного входу в атмосферу Allen-Eggers),
`eo-coverage` (геометрія смуги огляду / GSD / доступу / повторного огляду EO), `space-packet` (кадрування CCSDS
133.0 TM/TC — телеметрія/телекоманди — Space Packet — точний бітовий макет, перевірено туди й назад) і
`attitude-budget` (гравітаційно-градієнтний момент 3-DOF + бюджет похибки наведення RSS),
`passes` (прогнозування сходу/заходу пролітань над наземною станцією — AOS/TCA/LOS, максимальний кут підвищення,
доступ) і `link-budget` (рівняння однобічної лінії CCSDS/DSN — FSPL / Eb·N₀ /
запас / замикання); `telecom-timing` (похибка часу holdover, MTIE і TDEV, перевірені
за масками ITU-T); `spectrum` (увесь L-діапазон GNSS як одна спектральна густина потужності:
водоспад частота-час під заскриптованою часовою шкалою глушника безперервної хвилі, вузькосмугового, chirp або
узгодженого шуму, відношення глушник/сигнал для кожної смуги і ефективне
відношення потужності несівної до спектральної густини шуму з коефіцієнта спектрального розділення, а також вхід і вихід записів Signal Metadata
Format (SigMF) з оцінками спектра за Велчем; спектри сигналів
VALIDATED за підручниковими значеннями, сценарій глушника MODELLED; див.
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); той самий вид малює панелі діапазонів UHF, S і C з
проєктованими сигналами низької навколоземної орбіти); `leo-signal` (проєкти сигналів позиціювання, навігації і
синхронізації часу на низькій навколоземній орбіті для будь-якої системи: спектри з обмеженою смугою, джитер супроводу коду і точність
далекометрії, пошук і час захоплення, спектральне розділення з GPS і Galileo, стійкість до глушника
і компроміс діапазонів від UHF до C, з публічних пресетів, таких як Xona Pulsar, Iridium,
Starlink і CentiSpace, або вбудованих проєктів; замкнені форми і доплерівська обвідна LEO VALIDATED,
проєкти MODELLED; див. [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (Сонце, планети, Плутон, Місяць і сім великих
супутників на одну епоху — положення, сталі, часи поширення світла і орбітальні траєкторії; положення планет
VALIDATED за JPL Horizons) і `body-pnt` (позиціювання навколо будь-якого з цих тіл з
локальним навігаційним сузір'ям і лінією далекого космосу з Землі; MODELLED); `campaign` (наявні види, складені в ланцюгову часову шкалу місії
з передаванням стану між фазами, перебір параметрів, ансамбль Монте-Карло із зерном або
кілька сценаріїв за однієї спільної умови; MODELLED, див.
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (шаблони Walker delta і star,
списки елементів і багатооболонкові проєкти з пресетами GPS, Galileo, BeiDou і GLONASS
та покриття і геометричний фактор точності на сітці широта/довгота;
генератор і глобальний DOP GPS VALIDATED за опублікованими документами про обслуговування, див.
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (проліт супутника позиціювання, навігації і синхронізації часу (PNT)
на низькій навколоземній орбіті (LEO) і бюджет його лінії смуга за
смугою, з будь-якого сузір'я і будь-якого проєкту сигналу: кути огляду, Доплер і швидкість зміни Доплера,
втрати ITU-R на дощ, гази, сцинтиляцію і проникнення в будівлі, відношення потужності несівної до спектральної густини шуму порівняно з
видимими супутниками MEO GNSS, іоносфера першого порядку і вільні від іоносфери пари та
бюджет розв'язку з низькою енергією, зондування іоносфери з кожної пари смуг і монітори спуфінгу за
узгодженістю Доплера і геометрії пролітання та за міжсмуговою узгодженістю; члени ITU-R і
доплерівська обвідна для нерухомого користувача VALIDATED, проліт MODELLED, див.
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (трансльоване
повідомлення ефемерид і годинника супутника LEO PNT, для будь-якої орбіти і
несівної: підгонка від інтегрованої істинної орбіти до кеплерового набору Galileo, цей набір
з поліномами поправок уздовж траси, поперек траси і радіально, 22-параметрова модель Liu et al. 2025
або поліном ECEF з нульовим годинником ATOMIC; похибка дальності сигналу в космосі
(SISRE) залежно від інтервалу підгонки і періоду оновлення, перевірка неперервності оновлення посеред пролітання,
власний задокументований двійковий кадр Kshana з циклічною надлишковою перевіркою CRC-24Q і бюджетом квантування, і
блок у стилі RINEX-4 з позначкою розширення Kshana; ваги SISRE, алгоритм користувача Galileo
і CRC-24Q VALIDATED, підгонки MODELLED; необов'язкові пресети для Xona Pulsar,
Iridium, Starlink, CentiSpace, репрезентативної системи C-діапазону, ATOMIC і Celeste IOD; див.
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); трійка **злитого PNT MEO + LEO**
`leo-pvt` (доплерівське позиціювання за швидкістю зміни дальності на низькій навколоземній орбіті (LEO), спільні
розв'язки за псевдовідстанями GNSS + LEO з міжсистемними зміщеннями і DOP залежно від кількості супутників
LEO, покриття полярних і арктичних районів і передавання часу через LEO до UTC — для будь-якого сузір'я,
з необов'язковими пресетами, такими як Xona Pulsar, Iridium і сигнали можливості Starlink;
доплерівська обвідна LEO VALIDATED за опублікованими даними Iridium і Xona), `leo-ppp`
(збіжність точного точкового позиціювання лише з GNSS і з доповненням LEO, порівняно
з Li et al. 2019) і `ntn-positioning` (позиціювання в неназемній мережі 5G за
межею Крамера-Рао для смуги сигналу), MODELLED, крім цієї обвідної, див.
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (одна система LEO-PNT наскрізно:
проєкт `leo-signal`, перенесений смугою `leo-pass`, C/N0 пролітання і похибка дальності сигналу в космосі
навігаційного повідомлення передаються до злитого розв'язку `leo-pvt` і збіжності `leo-ppp`,
кожну передачу перелічено; MODELLED, див.
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), де також є огляд
кожного виду і сценарію LEO-PNT, включно з кампаніями стійкості, одним сценарієм на кожну
фокусну область експериментів і одним на кожну вертикаль кінцевих користувачів); **набір місячного PNT** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; **демонстратор Quantum-Enabled PNT**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; і
дослідницькі види **безпеки сигналу, цисмісячного простору і багатошарової стійкості** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — трійка аналізу місії і ці пізніші види всі MODELLED
(кожен із перевіреним замкненим ядром; див. матрицю).
Спільні поля: `seed`, сітка `[time]`, часова шкала доступності `[gnss]` (рушій
перерви) і блоки для кожного датчика з рядками `provenance`, що цитують джерело кожного
значення. Приклад (clock):

```toml
seed = 42
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 7200.0
[gnss]
windows = [
  { t0 = 0.0,   t1 = 600.0,  state = "nominal" },  # 10 min GNSS sync
  { t0 = 600.0, t1 = 7200.0, state = "denied"  },  # ~1.8 h outage
]
[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15 (arXiv:1503.08457)"
y0 = 5.0e-17
q_wf = 1.0e-30   # white FM:  q_wf = sigma_y(1s)^2
q_rw = 0.0       # random-walk FM
drift = 0.0      # linear aging (per second)
[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)=3e-10"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
drift = 0.0
```

Необов'язкові поля (вимкнені, якщо відсутні): годинник може додати `flicker_floor` (нижня межа Аллана для 1/f FM — частотної
модуляції); інерціальний датчик може додати `gyro_bias` і `q_arw` (зміщення гіроскопа і випадкове блукання
кута), а також `bias_instability` і `q_aa` (нижня межа нестабільності зміщення за Алланом і
випадкове блукання прискорення) — разом це **бюджет похибки одновісного (1-DOF) акселерометра**
(VRW/ARW — випадкове блукання швидкості/кута — і нестабільність зміщення). Саме цей бюджет похибки запускає постачений
*пакет* сценаріїв `inertial`. Окремо бібліотека тепер містить перевірений
**тривісний безплатформний навігатор** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
кватерніонна орієнтація з компенсацією конічного руху/sculling, повна механізація NED
(члени швидкості обертання Землі і транспортної швидкості, гравітація Сомільяни WGS-84) і
детермінована модель похибок IMU, в якій **змодельовано масштабний коефіцієнт, перекіс осей,
g-чутливість, квантування і лінійне наростання швидкості** (IEEE Std 952-1997, стандарт IEEE
специфікації і процедур випробування гіроскопів, §A.2; Groves 2013 §4.3). Цей тривісний шлях тепер **підключено до запускного
пакета слабко зв'язаного GNSS/INS** (`kind = "gnss-ins"`): 15-станний EKF похибок стану
коригує безплатформний розв'язок за зашумленими розв'язками, поки GNSS доступний, а потім
проходить перерву вибігом, повідомляючи злиту горизонтальну похибку порівняно з
вибігом вільної INS у розімкненому контурі. Також доступне **тісно зв'язане оновлення за
псевдовідстанями** (воно формує інновацію в домені дальності, тож продовжує коригувати
за менш ніж чотирьох супутників). Сценарій
holdover годинника може додати `runs` (> 1), щоб запустити **ансамбль Монте-Карло** — тоді кожен
показник якості повідомляється як середнє з розкидом від 5-го до 95-го процентиля, а
графік затінює довірчу смугу похибки (див. `scenarios/clock-ensemble.toml`).

Сценарій `fusion` (ті самі блоки, що й `hybrid`) запускає **два незалежні оцінювачі Калмана**
— один для стану годинника, один для стану положення, — що коригуються GNSS і отримують допомогу від
оптичного передавання часу, і повідомляє комбінований FoM holdover. Два блоки не мають спільної
перехресної коваріації: це складена пара бюджетів похибок, **а не** справжній зв'язаний
спільний фільтр годинник+положення (перехресна коваріація між блоками є пунктом дорожньої карти). Див.
`scenarios/fusion-pnt.toml`.

Сценарій `spoof` вносить спуфінг часу — один із чотирьох видів `[attack.shape]`
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; голе `rate_ns_per_s` досі
приймається як лінійне наростання) — і запускає детектор спуфінгу кожного годинника. Детектор — це
двобічний **енергетичний тест χ²₁ / тест Неймана–Пірсона** на статистиці монітора з допомогою годинника:
поріг задається з цільового бюджету хибних тривог `target_pfa`, а
**імовірність пропущеного виявлення `P_md`** повідомляється і в замкненій формі, і за
Монте-Карло (`mc_runs` випробувань на гіпотезу — обидва збігаються з точністю до кількох ×1/√N).
**Показник безпеки Security дорівнює `1 − P_md`** за експлуатаційно шкідливої (специфікаційної)
величини, тож тихий годинник, що ловить спуфінг розміру специфікації, отримує ≈ 1, а зашумлений,
що часто його пропускає, отримує менше (див. `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Сценарій `gnss-sim` — це симуляція в **домені вимірювань**: для кожного видимого
супутника вона синтезує псевдовідстань `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` і доплерівський зсув L1, з одночастотною іоносферою **Klobuchar**
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) і зенітною тропосферою **Saastamoinen**,
спроєктованою функцією відображення **Niell (1996)** (`[tropo]`).
Залишки живлять **знімковий RAIM** для HPL/VPL кожної епохи, а псевдовідстань, Доплер, C/N₀ і
поправки іоносфери/тропосфери кожного супутника видаються в масиві JSON
`gnss_measurements`. Це прямий симулятор (він генерує вимірювання з
відомої істини), а не приймач/розв'язувач — запуск без шуму відтворює геометрію плюс
поправки з точністю менше міліметра (див. `scenarios/gnss-sim-raim.toml`).

Сценарій `jamming` моделює РЧ-завади як **бюджет лінії**: `[jammer]`
(положення ECEF, потужність передавання `power_dbw`, тип) підвищує відношення глушник/сигнал на
`[receiver]`, що спостерігає сузір'я Walker `[constellation]`. З геометрії (втрати поширення
у вільному просторі і коефіцієнт підсилення приймальної антени для кожного напрямку) він обчислює для кожного супутника
`J/S`, **ефективне C/N₀** за стандартним рівнянням захисту від глушіння (виграш обробки
від розширення спектра × коефіцієнт спектрального розділення `Q`; Kaplan & Hegarty §9.4) і
позначає втрату захоплення нижче налаштовуваного порогу супроводу — повідомляючи
показник якості `availability_under_jamming`. Широкосмуговий глушник 10 W на відстані 1 km
повністю позбавляє приймач сигналу (J/S ≈ 72 dB); той самий глушник на відстані 100 km лише
погіршує лінії (див. `scenarios/jamming-demo.toml`).

Сценарій `sweep` виконує **компромісне дослідження**: він змінює один `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` або `classical_q_wf`) від `start` до `stop` за `steps`
точок на шкалі `scale` `lin` або `log`, записує `metric` (наприклад, `holdover_s`) для обох
годинників і будує графік двох кривих. Базовий сценарій розміщується в `[base]` (див.
`scenarios/sweep-clock-stability.toml`).

Сценарій `sweep-nd` узагальнює це на **будь-який пакет і будь-яку кількість осей**: він
змінює ключі TOML із крапками сценарію `[base]` (будь-якого `kind`) на декартовому
добутку `[[axes]]`, перезапускає кожен вузол сітки і записує `metrics`, задані як
шляхи JSON із крапками в результаті (наприклад, `classical.fom.holdover_s`). Він працює для
кожного пакета, бо діє на межі TOML/результату; нативні запуски обчислюють
сітку паралельно (без додаткової залежності, wasm переходить на послідовне виконання), а
вивід детермінований і впорядкований за рядками (див. `scenarios/sweep-nd-inertial.toml`).

Сценарій `orbit` виводить часову шкалу `[gnss]` з геометрії замість того, щоб задавати
її вручну — задайте орбіту `[user]`, `[constellation]`, маску кута підвищення `mask_deg` і два
блоки годинників. Він також повідомляє точність положення з геометрії супутників;
необов'язковий `sigma_uere_m` (еквівалентна похибка дальності користувача в 1 сигму, за замовчуванням 1 m) масштабує
геометричний фактор точності положення в сигму положення. Орбіту користувача можна зробити
**ексцентричною** за допомогою `eccentricity` і `argp_deg`, а `j2 = true` додає вікового дрейфу
від сплюснутості Землі (див. `scenarios/orbit-molniya.toml`). Сузір'я натомість може бути
**реальним**: задайте в `[constellation]` блок `tle` з наборами дворядкових елементів, і
супутники буде розібрано з нього (див. `scenarios/orbit-real-tle.toml`). Додайте один або кілька
блоків `[[constellations]]` для **кількох GNSS** (наприклад, GPS + Galileo; див.
`scenarios/orbit-multignss.toml`):

```toml
kind = "orbit"
seed = 7
threshold_ns = 5.0
mask_deg = 10.0
sigma_uere_m = 1.0           # optional; position sigma = position-DOP * this
[time]
step_s = 60.0
duration_s = 86400.0
[user]                       # spacecraft (altitude in km, angles in deg)
altitude_km = 8000.0
inclination_deg = 0.0
[constellation]              # Walker-delta GNSS (GPS-like)
altitude_km = 20180.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 1.0
[clock_quantum]  # ... as above
[clock_classical]  # ... as above
```

Види **alt-PNT без GPS** навігують узагалі без GNSS, зіставляючи виміряну послідовність
поля з картою через фільтр частинок. Сценарій `gravity-map` пролітає траєкторію
крізь сферично-гармонічне поле гравітаційних аномалій і відновлює її з показів холодноатомного
гравіметра (`scenarios/gps-denied-gravity-nav.toml`); сценарій `terrain-nav`
робить те саме за SRTM DEM висот (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
а сценарій `combined-altpnt` зливає **гравітацію + магнітне поле IGRF + рельєф** в одному фільтрі
(`scenarios/combined-altpnt.toml`).

Сценарій `lunar-integrity` оцінює **цисмісячний** PNT: він виконує прохід рівня захисту ARAIM
на південному полюсі Місяця з набором ретрансляторів LunaNet/LNIS і чесно повідомляє
прогалину цілісності — місячна σ_URE ~30 m виводить рівень захисту значно вище межі тривоги
50 m, тож служба *недоступна* за правилами цілісності авіаційного типу
(`scenarios/lunanet-araim.toml`).

Сценарій `lunar-time-offset` повідомляє **релятивістську швидкість ходу годинників Земля–Місяць** —
основу шкали Lunar Coordinate Time (LTC/TCL). Постньютонівська тотожність із перших принципів
підсумовує різницю власних потенціалів (потенціал геоїда IAU `L_G` мінус власний потенціал
поверхні Місяця) і кінетичний член Місяця (доплерівський другого порядку) до вікової
швидкості ≈ 57 µs/day, повідомленої разом з опублікованим діапазоном 56–59 µs/day; він також дає
накопичене зміщення LTC−TT за горизонт і ансамбль з оберненою дисперсією (місячний
паперовий годинник). **MODELLED** — головне число *залежить від еталона* (геоїд Землі
проти селеноїда Місяця, вікно усереднення), тому повідомляється діапазон, а не одне сертифіковане
число (`scenarios/lunar-time-offset.toml`).

Див. `scenarios/`, де є щонайменше один опрацьований приклад кожного виду (92 види, 193 файли сценаріїв
`.toml` + 1 маніфест набору — кілька видів постачаються з більш ніж одним прикладом). Не кожен
вид має файл, названий на його честь: `lunar-integrity` → `scenarios/lunanet-araim.toml` і
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` — два з кількох таких випадків.
Перелік видів, що підтримуються диспетчером, можна будь-коли отримати з помилок `cargo run -- --validate <file>`,
з Python `list_kinds()` або з інструмента MCP `list_scenario_kinds`.

</details>

<details>
<summary>Вивід</summary>

### Вивід

Артефакт результату — версіонований самоописний JSON: часові ряди для кожного кроку,
оцінені показники якості, специфікації активних моделей (з походженням), зерно,
**хеш сценарію** — щоб будь-який графік можна було відтворити з файлу — і, для кожного годинника,
`adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): перекривна
девіація Аллана на часах усереднення з октавним кроком — стандартний спосіб читати
стабільність годинника — тепер із **95% довірчою смугою для конкретного типу шуму** для кожної точки (степеневий
тип запису визначається з нахилу модифікованої девіації Аллана, а інтервал χ² використовує
відповідні ефективні ступені вільності NIST SP 1065). Браузерна пісочниця рендерить його як
log-log графік "Clock stability (ADEV)". (MDEV, TDEV і HDEV доступні як бібліотечні
оцінювачі; експортована крива результату — це перекривна ADEV.) Кожне поле з одиницями і
посиланням на джерело задокументовано в [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Кожен графік самоописний.** Браузерна пісочниця, експорт CLI `*.chart.svg`
і табло результатів HTML (HyperText Markup Language) ставлять на кожне зображення графіка нижній колонтитул
`Kshana v<version> · scenario <hash> · kshana.dev`. `scenario <hash>` — це перші
12 шістнадцяткових символів **хешу сценарію** запуску — дайджесту SHA-256 (256-бітного Secure Hash Algorithm) канонічного визначення
сценарію (зерно, пороги, параметри моделей, вікна GNSS, …); звіти integrity і lunar,
які не мають власного хешу, використовують натомість SHA-256 вихідного тексту сценарію.
Це **той самий відбиток**, що показано в однорядковому підсумку і в результаті JSON, тож
збережений або вставлений графік завжди несе свою версію, точний сценарій, що його створив (для
відтворення біт у біт), і джерело — змініть будь-який вхідний параметр, і хеш зміниться.

Показники якості відповідають стандартним робочим показникам якості PNT:

| Показник якості | Як Kshana його обчислює |
|-----------------|------------------------|
| Характеристики синхронізації часу (пакети clock/orbit) | RMS + 95-й процентиль фазової похибки годинника за перерву, у **наносекундах** (`timing_rms_ns`) — метрика часу, а не положення |
| Характеристики позиціювання (пакети inertial/hybrid) | RMS + 95-й процентиль похибки положення 1-DOF за перерву, у **метрах** (`pos_rms_m`); одновісна. Окремий запуск позначено `monte_carlo: false`; задайте `runs = N` для ансамблю Монте-Карло, який повідомляє середнє, розкид і бутстреп-95% CI (довірчий інтервал) для кожної метрики. Досі **не** 2-D CEP/2DRMS (кругова імовірна похибка / подвоєна середньоквадратична відстань) чи точність зі зважуванням DOP (для них потрібна тривісна модель — дорожня карта) |
| Автономність | тривалість holdover — час у межах специфікації після втрати GNSS (квантовано сіткою: нижня межа) |
| Стійкість | нахил росту похибки під час перерви |
| Доступність | частка запуску з розв'язком у межах специфікації |
| Цілісність | **самоузгодженість** фільтра — частка відліків перерви, похибка яких залишається в межах власної межі k-сигма фільтра Калмана. **Не** авіаційний показник цілісності HPL/VPL/RAIM (див. [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Безпека | **аналітична межа *виявності* спуфінгу** зі стабільності годинника — наскільки малий/повільний спуфінг часу міг би позначити монітор узгодженості одного годинника. Має сенс лише з налаштованою атакою; **не** багатосупутниковий детектор RAIM |

Новачок у цих термінах? Кожен визначено простою мовою в [глосарії](docs/GLOSSARY.md).

</details>

<details>
<summary>Структура репозиторію</summary>

### Структура репозиторію

```
kshana/
├── src/                                       # the kshana core crate (library + CLI)
│   ├── api.rs · main.rs · lib.rs              # typed dispatch (92 kinds) + CLI + crate root
│   ├── python.rs · wasm.rs                    # optional PyO3 / wasm-bindgen bindings
│   ├── types.rs · scenario.rs · allan.rs      # shared core (time grid, GNSS timeline, Allan)
│   │
│   ├── models.rs · estimator.rs · kalman.rs   # Pack 1 — clock holdover + integrity
│   ├── security.rs · detection.rs · spoof.rs · spoof_monitors.rs  # spoof detection
│   ├── filter_health.rs · fom.rs · fom_label.rs · report.rs · chart.rs · run.rs  # health · FoM scoring + labelling · output
│   ├── suite.rs · study.rs                     # scenario suites + aggregated multi-scenario study artifacts (`--study`)
│   ├── inertial/                              # Pack 2 — strapdown INS (attitude · mechanization · imu_errors · quantum_imu)
│   ├── timetransfer.rs · timetransfer_adv.rs · timegeo.rs  # Pack 3 — TWSTFT/CV/PPP/optical, Sagnac
│   ├── hybrid.rs · ensemble.rs · sweep.rs     # Pack 4 — fused PNT, Monte-Carlo, trade sweeps
│   │
│   ├── timescales.rs · jd2.rs · ephem.rs      # time systems, two-part JD, Sun/Moon ephemeris
│   ├── precession.rs · nutation.rs · cio.rs   # IAU 2006/2000A precession-nutation + CIO GCRS↔ITRS
│   ├── frames.rs · *_data.rs                  # TEME↔ECEF + generated nutation/CIO/EGM2008/IGRF tables
│   │
│   ├── orbit.rs · sgp4.rs · tle.rs · walker.rs   # geometry, SGP4/SDP4, TLE, Walker design
│   ├── propagator.rs · forces.rs · gravity_sh.rs · integrator.rs  # Cowell + perturbations (EGM2008 d/o70, GR) + RK4/DOPRI
│   ├── maneuver.rs · batch_ls.rs · orbit_determination.rs  # burns/Lambert/porkchop, Gauss-Newton, OD
│   ├── cr3bp.rs · lunar.rs · lunar_frame.rs · lunar_od.rs  # Earth–Moon CR3BP + halo/NRHO STM corrector, cislunar/LunaNet ARAIM, MCI↔MCMF, lunar OD
│   ├── lunar_time.rs · lunar_vlbi.rs · lunar_combination.rs · lunar_frame_realise.rs · lunar_service.rs · lunar_dpnt.rs · lunar_interop.rs  # tiers per piece in the matrix lunar PNT suite — LTC time · geodetic VLBI · joint OD+clock · frame realisation · Moonlight service-volume · differential PNT · LunaNet/IOAG interop export
│   ├── body.rs · mars_frame.rs · ephem_provider.rs · radiometric.rs · ccsds_tdm.rs  # deep-space: multi-body · Mars frame · ephemeris seam · radiometric obs + CCSDS-TDM
│   ├── deepspace_od.rs · clock_state.rs · mars_atmos.rs · mars_pnt.rs · linkbudget.rs · gse_sim.rs  # SRIF OD · onboard clock · Mars drag · relay-PNT · link budget · GSE sim
│   │
│   ├── fusion/                                # GNSS/INS — EKF · UKF · tightly_coupled(17) · coupled · closed_loop
│   ├── raim.rs · sbas.rs                      # RAIM/ARAIM HPL/VPL, SBAS DO-229E PLs + L1/L5 iono-free
│   ├── gnss_sim.rs · ionex.rs · pvt.rs · jamming.rs  # measurement domain · ionosphere maps · single-point positioning · jamming
│   ├── navsignal.rs                            # nav-signal PSD (BPSK-R/BOC) · spectral-separation → anti-jam Q · DLL code-tracking jitter · multipath envelope
│   ├── gravimeter.rs · igrf.rs · mapmatch.rs · particle_filter.rs · altpnt/  # gravity/magnetic/terrain alt-PNT
│   ├── rinex.rs · rinex_obs.rs · glonass.rs · sp3.rs · oem.rs · omm.rs · permalink.rs  # interop formats
│   ├── launch.rs · reentry.rs · eo_payload.rs · attitude_budget.rs · passes.rs · space_packet.rs  # mission-analysis budgets + CCSDS Space Packet
│   ├── space_weather.rs · holdover.rs · tpl.rs   # space-weather environment · GNSS-denied clock-holdover calculator · conditional Timing Protection Level (under spoofing)
│   ├── resilience/                              # framework-aligned PNT-resilience scoring + decision-instability study (RPCF · Dirichlet · Kendall-τ · diversity collapse · assurance report)
│   ├── impairment_eval.rs · impairment_study.rs · impairment_ml.rs · eval_stats.rs  # AI/ML RF-impairment eval testbed · optimism-gap study · LR/MLP detectors · bootstrap/DeLong/Spearman stats
│   ├── sdr.rs · realdata/                       # software-defined-receiver front end (IQ/IF → E/P/L taps → SQM) + real-data ingest adapters (RINEX · UBX · GnssLogger · JammerTest · Yunnan · SatGrid)
│   ├── crossover.rs · quantum_trade.rs · frugal.rs · integrity_impact.rs  # quantum-vs-classical crossover map · PNT trade · cost-per-coverage ROI · integrity impact
│   ├── quantum_devices.rs · quantum_faults.rs · quantum_nav_od.rs · qtrade.rs · timetransfer_chain.rs · representativeness.rs  # Quantum-Enabled PNT demonstrator — device error models · fault catalogue · GNSS-free quantum OD · unified trade harness · quantum time-transfer chain · representativeness / gaps-to-flight ledger
│   ├── interchange.rs · verification.rs          # KIF artifact envelope · machine-checked verification matrix
│   └── bin/crossover_study.rs · bin/validation_report.rs  # crossover-study artifact generator · release validation-summary HTML
│
├── mcp/kshana-mcp/        # standalone, workspace-EXCLUDED crate — the MCP server (+ Dockerfile, server.json)
├── ide/jetbrains/         # standalone Kotlin/Gradle IntelliJ-Platform plugin
├── xval/                  # standalone, workspace-EXCLUDED external cross-checks: anise-{frames,lunar-od,mars-od,service-geometry} (Rust ANISE/SPICE DE440) + orekit-passes (Java Orekit)
│
├── examples/            # reproducible study generators: tpl_jammertest · resilience_report · optimism_study + real-data probes (jammertest_probe · yunnan_probe · satgrid_probe · texbat_probe · ingest_realdata)
├── paper-artifacts/     # byte-deterministic study artifacts, regenerable from examples/ (optimism-study.json · resilience-study.json); raw datasets stay out
├── scenarios/            # one cited .toml per kind + geometry-driven + GPS-denied
├── scripts/              # reproducibility + repo-hygiene + SBOM guards
├── docs/                 # CONCEPTS, ARCHITECTURE, CAPABILITY, VALIDATION, PROVENANCE, GLOSSARY, …
├── web/                  # the WebAssembly playground + kshana.dev site
├── tools/                # table generators (EGM2008 · IGRF · nutation · CIO) + fetch_tles.sh
├── .github/workflows/    # ci · release · publish · wheels · pages · mcp-publish · jetbrains-plugin · frame-xval
├── pyproject.toml        # Python packaging (maturin)
├── CHANGELOG.md          # Keep a Changelog + SemVer
└── CITATION.cff · ROADMAP.md · CONTRIBUTING.md · SECURITY.md
```

</details>

<details>
<summary>FAQ (поширені запитання)</summary>

### FAQ

**Чи потрібно розуміти квантову фізику, щоб цим користуватися?**
Ні. Якщо ви вмієте запускати командний рядок, ви можете запустити Kshana. Почніть із
[посібника простою мовою](docs/CONCEPTS.md); терміни шукайте в [глосарії](docs/GLOSSARY.md).

**Це проєкт квантового обладнання чи льотне програмне забезпечення?**
Ні. Це *симулятор* характеристик. Точність моделювання квантового обладнання береться з опублікованих
моделей похибок, а не з цього інструмента. Див. [Що це таке / чим не є](#what-it-is--is-not).

**Квантові результати реалістичні чи це маркетинг?**
Кожен параметр має посилання на технічний опис або статтю, кожну модель перевірено за
підручниковим співвідношенням, а зрілість чесно позначено в
[VALIDATION.md](docs/VALIDATION.md) — включно з тим, що жоден стронцієвий оптичний годинник ще не
літав. Рушій нейтральний: квантове і класичне — це той самий код з різними
опублікованими числами.

**Чи можу я бути певним, що два запуски збіжаться?**
Так — запуски детерміновані: `scenario + seed + engine version → bit-identical output`,
що забезпечує `scripts/check-reproducible.sh`.

**Чи можна користуватися ним з Python або в браузері?**
Так — див. [Встановлення](#install): приклади для Python і WebAssembly наведено там. Обидва викликають той самий рушій.

**Як змоделювати власний датчик?**
Напишіть сценарій `.toml` з опублікованими характеристиками вашого датчика в полях
`provenance`. Див. [Формат сценарію](#scenario-format) і приклади в `scenarios/`.

**Чи безкоштовний він для комерційного використання?**
Так — за ліцензією AGPL-3.0, зокрема в комерційних умовах, якщо ви дотримуєтеся
копілефту AGPL (зокрема: якщо ви змінюєте Kshana і пропонуєте його через мережу, ви мусите
надати цим користувачам свій змінений вихідний код). Якщо це вам не підходить — наприклад, вам потрібно
вбудувати Kshana в пропрієтарний продукт або запустити закриту мережеву службу, — комерційна
ліцензія доступна від Ashforde® OÜ; див. [`LICENSING.md`](LICENSING.md) і
[Підтримка](#support--professional-services).

</details>

<details>
<summary>Усунення несправностей</summary>

### Усунення несправностей

**`cargo build` не вдається на старому ланцюжку інструментів.** Kshana потребує Rust ≥ 1.88. Оновіть командою
`rustup update`.

**Збирання розширення Python не компонується на macOS** (`Undefined symbols … _Py…`).
Розширення Python розв'язує свої символи під час завантаження. `maturin` автоматично задає правильний прапорець
компонувальника — використовуйте `maturin develop --features python`, а не голий
`cargo build`.

**Збирання Python скаржиться, що інтерпретатор новіший, ніж відомо PyO3.** Задайте
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (колеса abi3 мають пряму сумісність між
версіями CPython).

**Збирання WebAssembly не може знайти ціль.** Встановіть її один раз командою
`rustup target add wasm32-unknown-unknown`, потім `wasm-pack build --target web -- --features wasm`.

**Куди подівся мій вивід?** Кожен запуск записує `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` і `<scenario>.report.json` поруч із
вхідним `.toml`, а також
`<scenario>.table.csv` для видів, що публікують таблицю. Усі вони
навмисно ігноруються git.

</details>

<details>
<summary>Версіонування і випуски</summary>

### Версіонування і випуски

Kshana дотримується [Semantic Versioning](https://semver.org). До версії 1.0 публічна
схема сценаріїв/результатів ще може змінюватися; несумісні зміни явно позначаються в
[`CHANGELOG.md`](CHANGELOG.md). Кожен результат відтворюється з
`scenario + seed + engine version`.

**Кожен тег `vX.Y.Z` автоматично публікує всі канали в одному порядку** — спершу на позначеному тегом коміті
запускається повний набір тестів, нічого не публікується, доки він не пройде, а
потім конвеєр перевіряє, що кожен реєстр справді віддає нову версію
([`docs/RELEASING.md`](docs/RELEASING.md)). Канали:

| Канал | Встановлення / отримання | Вміст |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | бібліотека Rust + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | сервер MCP |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | колеса abi3 (Linux/macOS/Windows) + sdist (дистрибутив вихідного коду) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | модуль WebAssembly + обгортка JS |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | багатоархітектурний образ OCI (Open Container Initiative) — ланцюжок інструментів не потрібен |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | запускач: завантажує двійковий файл випуску, перевіряє `SHA256SUMS`, запускає його |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | той самий запускач для Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | двійковий файл `kshana-mcp`, згенерований із `SHA256SUMS` кожного випуску |
| Claude Desktop | двічі клацніть `kshana-mcp-<target>.mcpb` з випуску | розширення з двійковим файлом усередині |
| офіційний реєстр MCP | автоматично знаходиться клієнтами MCP | `io.github.ashfordeOU/kshana-mcp` (образ OCI, пакети npm і PyPI) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → шукайте "Kshana" | плагін IDE **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | завантаження | двійковий файл командного рядка `kshana` для Linux x86-64, macOS (Apple silicon та Intel) і Windows x86-64, двійковий файл `kshana-mcp` для кожної з цих систем і Linux Arm, розширення Claude Desktop `.mcpb` для кожної системи, **SBOM** CycloneDX, походження збирання **SLSA**, HTML-підсумок валідації і файл контрольних сум `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | придатний для цитування архів кожного випуску |
| [kshana.dev](https://kshana.dev) | відкрийте в браузері | Kshana Studio, застосунок WebAssembly в браузері, перезбирається з кожного тегу випуску (тож версія, яку він показує, — це версія, яку він запускає) |

Версія крейта / образу / реєстру сервера MCP відповідає рушію (він містить
бібліотеку); плагін JetBrains версіонується незалежно (він викликає встановлений у вас
двійковий файл `kshana`).

</details>

<details>
<summary>Дорожня карта</summary>

### Дорожня карта

Див. [`ROADMAP.md`](ROADMAP.md) щодо поетапної дорожньої карти, [`CHANGELOG.md`](CHANGELOG.md)
щодо історії випусків і [`docs/CAPABILITY.md`](docs/CAPABILITY.md) щодо
дорожньої карти для кожної можливості. Порядок пріоритетів: **спершу докази щодо синхронізації часу і holdover для
критичної інфраструктури** (телекомунікаційні маски, довший holdover зі старінням і фліккер-шумом,
прийом даних виміряних годинників); **на другому місці — нейтральний метод компромісу «квантове проти класичного»**
(результати позначено MODELLED, доки виміряні дані партнера їх не підвищать); і
**навігація для Місяця / цисмісячного простору і далекого космосу підтримується**, але не розширюється як провідна. **Точну редукцію системи відліку ITRF** тепер реалізовано — повний
ланцюг GCRS↔ITRS IAU 2006/2000A на основі CIO (рух полюсів + нутація з точністю до часток кутової секунди),
перевірений біт у біт за SOFA/ERFA і незалежно перехресно перевірений за ANISE
(SPICE на чистому Rust) до ≤ 3.6 m на орбіті GNSS. Найближчі пункти включають тісно зв'язане злиття за фазою несівної і виведення
слабко/тісно зв'язаного навігатора GNSS/INS у більше пакетів; рушій **радіометричної навігації
для далекого космосу / Марса** з'явився у v0.17.0 (перевірено симуляцією).
**Шар квантової фізики** — пункт **P2**: акселерометр CAI тепер симулюється з
перших принципів (фаза Маха–Цендера, проєкційний шум, спадання контрасту, вібраційний
зв'язок), тоді як датчики годинників/передавання часу досі керуються опублікованими
коефіцієнтами Аллана/бюджету шуму. TEME&harr;ECEF на основі GMST, системи часу IERS
із секундами координації (UTC/TAI/TT/UT1), поширення орбіт SGP4/SDP4 (v0.7.0,
перевірене за векторами AIAA 2006-6753) і запускний пакет злиття `gnss-ins`
усі **випущено**, а інерціальна швидкість доступна далі за ланцюгом. Активний
стохастичний детектор спуфінгу часу (енергетичний тест Неймана–Пірсона / χ²₁ з P_fa/P_md за Монте-Карло
і показником безпеки Security FoM 1−P_md), модель глушіння за бюджетом лінії (J/S → ефективне
C/N₀ → втрата захоплення), доступність кількох сузір'їв, одновісний (1-DOF)
бюджет похибки IMU, два незалежні (годинник + положення) оцінювачі Калмана, що повідомляються як
комбінований FoM, реальна геометрія сузір'їв з TLE, звіт-табло результатів у HTML,
виведені з геометрії доступність GNSS
*і* геометричний фактор точності з кеплерових орбіт з ексцентриситетом і дрейфом J2,
довірчі смуги Монте-Карло, перебори параметрів для компромісних досліджень, браузерна пісочниця WebAssembly
і необов'язкові прив'язки Python (PyO3) і WebAssembly (wasm-bindgen) —
усе це потрапило в `main`.

</details>

<details>
<summary>Участь у розробці</summary>

### Участь у розробці

Див. [`CONTRIBUTING.md`](CONTRIBUTING.md). Коротко: тести проходять (`cargo test`),
два скрипти-запобіжники проходять, Conventional Commits і запис `CHANGELOG.md` `[Unreleased]`
для кожної зміни, видимої користувачам. Участь регулюється нашим
[Кодексом поведінки](CODE_OF_CONDUCT.md). Щоб повідомити про проблему безпеки, див.
[Політику безпеки](SECURITY.md) — будь ласка, не відкривайте публічне issue щодо вразливостей.

</details>

<details>
<summary>Документація: кожен документ і для кого він</summary>

<a id="documentation"></a>
### Документація

| Документ | Для кого | Що в ньому |
|----------|----------|--------------|
| [Посібник із понять](docs/CONCEPTS.md) | усі, почніть звідси | що робить Kshana і навіщо, від нуля до фізики |
| [Kshana Studio](web/README.md) | усі | запуск рушія у вашому браузері (WebAssembly); примітки щодо збирання і розгортання |
| [Глосарій](docs/GLOSSARY.md) | усі | визначення кожного терміна простою мовою |
| [Види сценаріїв](docs/KINDS.md) | усі | кожен вид, який підтримує диспетчер рушія: що він робить, його поля, приклад команди, його рядки реєстру і графік, який рушій для нього записує |
| [Дані партнерів](docs/PARTNER-DATA.md) | лабораторії і виробники, що мають виміряні дані | які рядки MODELLED міг би підвищити запис виміряного годинника чи IMU, формати, як подання перевіряється (`kshana partner check`), оцінюється і зараховується |
| [Архітектура](docs/ARCHITECTURE.md) | розробники / рецензенти | карта модулів, конвеєр рушія, диспетчер і діаграми |
| [Стан валідації](docs/VALIDATION.md) | рецензенти / ті, хто цитує | що є `validated`, а що `not modeled`, з доказами |
| [Матриця верифікації](docs/VERIFICATION-MATRIX.md) | рецензенти / ті, хто цитує | машинно перевірюваний реєстр доказів — кожен рядок можливості з її статусом, модулем, тестом і зовнішнім оракулом, згенерований з `src/verification.rs` |
| [Обґрунтування Modelled](docs/MODELLED-RATIONALE.md) | рецензенти | чому кожен рядок **Modelled** не має зовнішнього оракула, рядок за рядком |
| [Походження](docs/PROVENANCE.md) | рецензенти / ті, хто цитує | кожен параметр датчика, модель і набір даних, простежені до опублікованого джерела, в одній таблиці, придатній для цитування |
| [Відтворюваність і походження](docs/REPRODUCIBILITY.md) | рецензенти / пакувальники | гарантії детермінованості, закріплення еталонів, SBOM (специфікація програмних компонентів), походження збирання |
| [Теги платформ коліс](docs/WHEEL_TAGS.md) | пакувальники | матриця коліс Python abi3 — який тег платформи вибирає `pip install kshana` |
| [Позиціонування](docs/POSITIONING.md) | ті, хто оцінює | місце Kshana порівняно з RTKLIB/gLAB (взаємодоповнення) і браузерний рівень без встановлення |
| [Kshana Pro](docs/PRO.md) | ті, хто оцінює / менеджери програм | що пропрієтарна надбудова Pro додає над тим самим рушієм: оптимізатор проєктів, невизначеність і чутливість, досьє місії, стеження за кампанією, співіснування в спектрі, локальна служба завдань, простежуваність вимог; що створює кожна функція і чого вона не робить |
| [Технічний звіт](paper/kshana-technical-report.md) · [Стаття JOSS](paper/paper.md) | рецензенти / ті, хто цитує / ті, хто оцінює | повна розширена дослідницька стаття — архітектура, моделі за доменами, валідація, приклади застосування й обмеження — плюс стисле подання до JOSS (Journal of Open Source Software) |
| [Валідація SGP4](docs/SGP4-VALIDATION.md) | рецензенти / ті, хто цитує | збіг з еталоном AIAA 2006-6753 (666 станів, ~4 mm) **і** пряме порівняння з незалежним крейтом `sgp4` (збіг до менше мікрона / 4.12 mm) |
| [Валідація моделі сил](docs/AGENCY-ORBIT-VALIDATION.md) | рецензенти / ті, хто цитує | рушій з повною моделлю сил (`src/precise_od.rs`), підігнаний до ефемерид агенцій — методологія і перевірені залишки |
| [Посібник із реальних TLE](docs/REAL_TLE_GUIDE.md) | користувачі | керування сценаріями за реальними TLE сузір'їв з Celestrak / Space-Track (порівняно з вбудованим синтетичним набором Walker) |
| [FoM цілісності](docs/INTEGRITY.md) | ті, хто оцінює | що означають показники `integrity` / `security` — і чим вони **не** є порівняно з авіаційними HPL/VPL |
| [Довідка ARAIM](docs/ARAIM_REFERENCE.md) | рецензенти / інтегратори | відкрита реалізація рівня захисту MHSS ARAIM — проєкція номінального зміщення `b_k`, σ_URA проти σ_URE і апріорні ймовірності режимів несправностей |
| [Квантові моделі](docs/QUANTUM.md) · [подробиці](docs/QUANTUM-MODELS.md) | рецензенти | фізичний шар холодноатомного інтерферометра і де коефіцієнти досі беруться з таблиць |
| [Відповідність](docs/COMPLIANCE.md) | ті, хто оцінює | обсяг алгоритмів DO-229E / DO-316 і що **не** є заявою про відповідність |
| [Морська довіра](docs/MARITIME-TRUST.md) | моряки / інтегратори | оцінка довіри GNSS 0-100 для NMEA судна, її монітори та обмеження (консультативно, не навігаційне обладнання із затвердженням типу) |
| [Навчальні потоки NMEA](docs/NMEA-TRAINING.md) | морські інструктори | синтетичний NMEA містка із заскриптованим глушінням і спуфінгом та журналом інструктора; лише текст, ніколи для робочої навігації |
| [Карта завад](docs/INTERFERENCE-MAP.md) | аналітики / моряки | де повітряні судна і кораблі повідомляли про погіршені навігаційні дані і яку частину маршруту це зачіпає |
| [Пакети доказів](docs/EVIDENCE-PACKS.md) | оператори / страховики | підписані технічні записи про подію довіри і як їх перевірити |
| [Телеметрія довіри](docs/TRUST-TELEMETRY.md) | команди експлуатації / безпеки | потік довіри як метрики Prometheus, події SIEM і OpenTelemetry, з панеллю Grafana |
| [Морські інтеграції](docs/MARINE-INTEGRATIONS.md) | власники човнів / інтегратори | плагін Signal K, режим шлюзу OpenCPN і еталонне збирання |
| [Випробувальний стенд](docs/TEST-BENCH.md) | виробники приймачів | відтворення експортованого сценарію через лабораторний симулятор і оцінювання журналу приймача |
| [Відповідність рамкам](docs/compliance/README.md) | ті, хто оцінює | публічні рамки стійкості, відображені на виходи Kshana, з джерелами і прогалинами; `kshana compliance-report` |
| [Блокноти](notebooks/README.md) | користувачі | інтерактивні посібники з відрендереним текстом |
| [Стандарти і сумісність](docs/STANDARDS.md) | інтегратори | формати обміну GNSS / динаміки польоту / агенцій, які Kshana читає і записує (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [Злиття LEO PNT](docs/LEO-PNT-FUSION.md) | користувачі / ті, хто оцінює | злиті позиціювання, навігація і синхронізація часу MEO + LEO: Доплер, спільна псевдовідстань, збіжність PPP, 5G NTN, полярне покриття і передавання часу через LEO для будь-якого сузір'я; необов'язкові пресети та їхні публічні джерела |
| [Кампанії](docs/CAMPAIGNS.md) | користувачі / ті, хто оцінює | складання сценаріїв: ланцюгові часові шкали місій, перебори параметрів, ансамблі Монте-Карло і запуски за спільної умови, з тотожностями композиції, які закріплюють тести |
| [Каталог сценаріїв](docs/SCENARIOS.md) | користувачі / інтегратори | кожен вид, що підтримується диспетчером, з обов'язковими і необов'язковими полями TOML — згенеровано з `api::list_scenario_kinds()` |
| [Схема результату](docs/SCHEMA.md) | інтегратори | кожне поле результату JSON з одиницями і посиланням на джерело |
| [Python API](docs/PYTHON_API.md) | користувачі Python | інтерфейс прив'язки PyO3 — виклик рушія, типи сценарію/результату і приклади |
| [Заяви проти реальності](docs/CLAIMS-VS-REALITY.md) | рецензенти | реєстр закриття перебільшених заяв + запобіжник CI (`tests/no_overclaims.rs`), що утримує його розв'язаним |
| [Дорожня карта](ROADMAP.md) | усі | поетапна дорожня карта — що випущено і що далі |
| [Сервер MCP](mcp/kshana-mcp/README.md) · [Плагін JetBrains](ide/jetbrains/README.md) | агенти / користувачі IDE | запуск Kshana з AI-асистента або JetBrains IDE |
| [Посібник для агентів](docs/AGENTS.md) · [Інтерфейси](docs/SURFACES.md) | агенти / інтегратори | який інструмент відповідає на яке запитання, що зберігати з кожною відповіддю; де доступна кожна можливість (CLI, Rust, Python, WASM, MCP, плагін, JetBrains, блокноти) і чому комірка N/A |
| [Журнал змін](CHANGELOG.md) | усі | історія випусків (Keep a Changelog + SemVer, Semantic Versioning) |
| [Участь у розробці](CONTRIBUTING.md) | учасники | збирання, запобіжники, дисципліна тестів/цитування, DCO (Developer Certificate of Origin) |
| [Врядування](GOVERNANCE.md) | учасники / спільнота | як керується Kshana — хто вирішує, як, і межа між відкритим і закритим |
| [Кодекс поведінки](CODE_OF_CONDUCT.md) | спільнота | очікувана поведінка (Contributor Covenant) |
| [Політика безпеки](SECURITY.md) | ті, хто повідомляє | як повідомити про вразливість; примітка про подвійне призначення |

</details>

<details>
<summary>Ключові джерела</summary>

### Ключові джерела

**Оракули валідації і стандарти** — зовнішні авторитетні джерела, до яких прив'язано перевірки Kshana:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [тестові дані](https://celestrak.org/publications/AIAA/2006-6753/)): набір верифікації SGP4/SDP4, з яким Kshana збігається до 4.12 mm, і опрацьовані приклади систем відліку, за якими перевіряється ланцюг TEME→ITRF.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — еталонні процедури часу і систем відліку, за якими біт у біт перевірено нутацію IAU 2000A і редукцію CIO GCRS↔ITRS.
- Petit & Luzum (eds.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (стандарти орієнтації Землі, руху полюсів і систем відліку).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (співвідношення девіації Аллана і еталонний ряд NBS14; NBS = колишнє US National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): еталонні реалізації ROC/AUC, матриці помилок і precision/recall/F1, з якими точно збігається випробувальний стенд оцінювання РЧ-порушень (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` і `linalg.expm` — еталонні процедури, за якими перевірено підгонку NNLS виміряної ADEV у квантових компромісах, смуги узгодженості χ² і коваріацію процесного шуму годинника van-Loan (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): використовується і як відкритий попередній рівень техніки (див. *Порівняння і відкритий попередній рівень техніки* нижче), і як **незалежний оракул DOP**, з яким обчислення GDOP/PDOP/HDOP/VDOP/TDOP збігається до 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): моделі сил, що стоять за підгонкою моделі сил до точних ефемерид агенцій.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (сімейства гало/NRHO, які відтворює диференційний коректор CR3BP).

**Фізика пристроїв і методів** — процитовані джерела, що стоять за моделями датчиків:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (стронцієвий оптичний годинник на ґратці, ціль для космосу).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (лабораторний Sr-годинник, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (гібридна тріада квантових акселерометрів).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [посібник IEEE AESS (Aerospace and Electronic Systems Society) (репозиторій University College London Discovery)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (ріст похибки зчислення).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (оптичне двобічне передавання часу і частоти; оптична міжсупутникова лінія моделює свій бюджет невзаємності за цими роботами).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (модуляція BOC і теорія спектрального розділення, що стоять за `src/navsignal.rs`).
- Kaplan & Hegarty (eds.) — *Understanding GPS/GNSS: Principles and Applications* (3rd ed., Artech House, 2017): рівняння ефективного C/N₀ із захистом від глушіння і тепловий шумовий джитер супроводу коду DLL early–late, які використовують моделі навігаційного сигналу і глушіння.

**Порівняння і відкритий попередній рівень техніки** — інструменти й огляди, відносно яких позиціонується Kshana:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): параметри тестової батареї спуфінгу, за якими охарактеризовано багатошаровий детектор.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): відкриті перевірені профілі похибок інерціальної навігації, що використовуються як класичний базовий рівень.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): відкритий симулятор місячного PNT.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): відкритий аналіз даних GNSS.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): OD GRAIL зі зниженою динамікою, нижня межа емпіричного прискорення, яку відтворює підгонка LRO.

</details>
