# docs--kind-leo-navmsg: translations (ru)

seg-debc2f07db78 = true

seg-648c27220789 = Источник: <c1/>

seg-087287602b47 = <c1/> (вид сценария)

seg-49964654d5f4 = Вид сценария движка v{ $version }, семейство <a1>Навигация на низких околоземных орбитах</a1>. Носит консультативный характер: результат анализа исследовательского и инженерного инструмента; это не навигационное оборудование с утверждённым типом и не служба обеспечения безопасности жизни. Все обозначения здесь принадлежат движку или матрице верификации; вид относится к уровню MODELLED, если матрица не указывает иное (как заслуживается обозначение: раздел Evidence в README).

seg-e5a4f0290e9e = Один прогон <c1/> кратко выглядит так: навигационное сообщение LEO — { "510" } km, { "97.4" } deg, степень гравитации { "20" }, модель kepler-rac веса SISRE: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (маска { "0" } deg) encode-decode: модель kepler-rac, кадр { "152" } bytes ({ "1156" } бит полезной нагрузки, { "891" } бит эфемерид+часов), CRC-24Q 0x58ADF2 квантование: наибольшее изменение позиции { "0.52" } mm, часов { "0.09" } mm; SISRE точное { "0.0013" } m, квантованное { "0.0013" } m повреждённый кадр отклонён: true; круговой обход RINEX { "4.43e-6" } m; круговой обход CSV { "0.00e0" } m fit-interval trade на { "1800" } s (период использования = интервал подгонки): kepler16 { "60" } s SISRE орбита RMS { "0.0003" } m max { "0.0015" } m с часами RMS { "0.0006" } m kepler16 { "120" } s SISRE орбита RMS { "0.0003" } m max { "0.0015" } m с часами RMS { "0.0007" } m kepler16 { "300" } s SISRE орбита RMS { "0.0036" } m max { "0.0141" } m с часами RMS { "0.0037" } m kepler16 { "600" } s SISRE орбита RMS { "0.0293" } m max { "0.1023" } m с часами RMS { "0.0293" } m kepler16 { "900" } s SISRE орбита RMS { "0.1073" } m max { "0.3812" } m с часами RMS { "0.1075" } m kepler-rac { "60" } s SISRE орбита RMS { "0.0000" } m max { "0.0000" } m с часами RMS { "0.0005" } m kepler-rac { "120" } s SISRE орбита RMS { "0.0001" } m max { "0.0002" } m с часами RMS { "0.0007" } m kepler-rac { "300" } s SISRE орбита RMS { "0.0005" } m max { "0.0021" } m с часами RMS { "0.0012" } m kepler-rac { "600" } s SISRE орбита RMS { "0.0097" } m max { "0.0395" } m с часами RMS { "0.0096" } m kepler-rac { "900" } s SISRE орбита RMS { "0.0388" } m max { "0.1143" } m с часами RMS { "0.0390" } m 16-параметрический кеплеровский набор ухудшается с { "0.0003" } m при { "60" } s до { "0.1073" } m при { "900" } s: один кеплеровский набор с гармониками дважды за оборот не может следовать за более высокочастотными членами гравитации и сопротивлением дуги LEO дольше нескольких минут, а его остаток по методу наименьших квадратов колеблется по окну. Полиномы вдоль/поперёк/радиально, имеющие более высокую степень, чем охватывает кеплеровский набор, поглощают остаток, давая { "0.0388" } m при { "900" } s.

seg-3f299f6b20c8 = Необязательные поля: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3adfcd7e275c = Пример <c1/> задаёт, среди прочего:

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Сообщение Celeste IOD (пресет для семинара)

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = бит

seg-fb689f03361c = байт

seg-35e92abc6a23 = График, который движок строит для scenarios/leo-navmsg-celeste-iod.toml, вид leo-navmsg

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: строки <a1>матрицы верификации</a1>, в которых назван этот вид.

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: радиальный вес w_R и квадрат поперечного веса w_AC^{ "2" } как средние от cos^{ "2" } и половины sin^{ "2" } надирного угла линии визирования по пользователям, равномерно распределённым на видимом сегменте Земли выше возвышения

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: кеплеровское вычисление по Galileo OS SIS ICD (уравнение Кеплера, поправки второй гармоники, связанный с Землёй узел), написанное отдельно от вычислителя RINEX движка, возвращающее позицию с аргументом Тесты: <a1>leo_navmsg_reference.rs</a1>.

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: порождающий полином 0x1864CFB, начальное значение { "0" }, без отражения, без финального XOR, проверка, которую кадр LEO Kshana несёт поверх каждого предшествующего байта

seg-2b24c2669c23 = <b>VALIDATED</b> Подгонка и компромисс вида <c1/>: истинная орбита, проинтегрированная с зональной гравитацией J2-J6 или EGM2008 до выбранной степени и с сопротивлением, и заданные начальным значением (seed) свободные или управляемые часы; подгонка кеплеровского набора Galileo методом Левенберга — Марквардта по неособым

seg-ddb27b07b9af = и ещё { "7" } в матрице.

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: радиальный вес w_R и квадрат поперечного веса w_AC^{ "2" } как средние от cos^{ "2" } и половины sin^{ "2" } надирного угла линии визирования. Оракул (ExternalDataset): опубликованная таблица весовых коэффициентов SISRE из Montenbruck, Steigenberger и Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } и 1/49, GLONASS { "0.98" } и 1/45, Galileo { "0.98" } и 1/61, BeiDou MEO { "0.98" } и 1/54, BeiDou IGSO/GEO { "0.99" } и 1/126. То же среднее, вычисленное на радиусах LEO, даёт

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: кеплеровское вычисление по Galileo OS SIS ICD (уравнение Кеплера, поправки второй гармоники, связанный с Землёй узел), написанное отдельно. Оракул (ExternalDataset): позиции ECEF по RTKLIB 2.4.2-p13 eph2pos (независимая реализация того же алгоритма ICD) для реальных записей вещания BKG/IGS за 2024-09-10, обе зафиксированы с происхождением в tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Это валидирует кеплеровский пользовательский алгоритм; добавляемые сверху поправки вдоль/поперёк/радиально охвачены собственными строками, а члены Liu b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: порождающий полином 0x1864CFB, начальное значение { "0" }, без отражения, без финального XOR, проверка, которую кадр LEO Kshana несёт поверх каждого предшествующего. Оракул (ExternalDataset): контрольное значение каталога CRC для этих параметров (каталог CRC reveng.sourceforge.io, CRC-24/LTE-A: ширина { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), которые являются параметрами CRC-24Q в RTCM { "10403" } и Galileo OS SIS ICD, и пример кадра типа сообщения { "1005" }, приведённый в RTCM { "10403" }

seg-6e2719a28884 = <b>VALIDATED</b> Подгонка и компромисс вида <c1/>: истинная орбита, проинтегрированная с зональной гравитацией J2-J6 или EGM2008 до выбранной степени и с сопротивлением, и заданные начальным значением (seed) свободные или управляемые. Оракул (ExternalDataset): реальные прецизионные научные орбиты как истина (оперативные редуцированно-динамические орбиты TU Graz IfG/ITSG, свободные для любого использования с указанием авторства; значения SHA-256 в NOTICE фикстуры), подогнанные 16-параметрическим набором на дугах { "20" } и { "30" } мин, в сравнении со статистикой, которую Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) публикуют для тех же спутников и дней: RMS вдоль, поперёк и радиально каждое в пределах 1.5x (измерено { "0.804" } до { "1.087" }), SISR

seg-0c26ec09bf16 = SISRE — это ошибка представления сообщения относительно истины, к которой оно было подогнано; ошибки определения и прогноза орбиты не моделируются. (результат <c1/>)

seg-3762de39de07 = Истинная орбита — это численное интегрирование Kshana (зональная гравитация или EGM2008, статическое экспоненциальное сопротивление), а не прецизионная орбита реального спутника; без третьего тела, светового давления и приливов. (результат <c1/>)

seg-4486dd350b57 = Двоичный формат — собственная документированная кодировка Kshana, смоделированная по опубликованным компонентам сообщений; это не битовая раскладка Celeste или какой-либо другой системы (ни одна не опубликована). (результат <c1/>)

seg-2a5c1bce8320 = Блок в стиле RINEX — документированное расширение Kshana; RINEX { "4.02" } не определяет навигационных записей LEO. (результат <c1/>)

seg-642d8f4d60e7 = Коэффициенты NeQuick-G передаются, и эффективный уровень ионизации вычисляется, но интегрирование электронной плотности NeQuick, превращающее его в задержку, не реализовано; задержка Klobuchar реализована, приведена к несущей множителем 1/f^{ "2" } и без поправки на спутник, летящий внутри ионосферы. (результат <c1/>)

seg-8ba04a3147bd = Члены 22-параметрической модели Liu et al. { "2025" } следуют пользовательскому алгоритму статьи (ур. 1-7) и стратегии подгонки (раздел { "2.3" }); её значения SISRE в зависимости от высоты получены на реальных прецизионных орбитах, поэтому это сравнение на орбите, проинтегрированной Kshana, относится к уровню MODELLED, а не VALIDATED (сравнение на реальной орбите — tests/leo_navmsg_fit_real_orbit_oracle.rs). (результат <c1/>)

seg-d6e412aab1b4 = MODELLED: каждое значение подгонки и SISRE — это ошибка представления относительно истины, проинтегрированной Kshana (без ошибки определения или прогноза орбиты); сравнение с Liu et al. (каталог видов (<c1/>))

seg-c5478f572d21 = Страница семейства: <a1>Навигация на низких околоземных орбитах</a1>

seg-d9257241d523 = Страница темы: <a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>Назад</s1>launch-window

seg-2984c4c69850 = <s1>Далее</s1>leo-pass

seg-cb91473bfdda = Тематическая страница: <a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = Этот вид используют { "5" } поставляемых сценариев; остальные находятся в <a1><c1/></a1>.

# words to translate: MIXED
# EN: Result label (the engine's): MIXED — VALIDATED building blocks, MODELLED results. The SISRE weights reproduce the published MEO/GEO table (Montenbruck et al. { "2018" }), the Galileo ICD user algorithm reproduces RTKLIB on real Galileo broadcast ephemerides, and CRC-24Q reproduces its catalogue check value and the RTCM { "1005" } example f
seg-c60901596100 = Обозначение результата (от движка): СМЕШАННЫЙ — компоненты VALIDATED, результаты MODELLED. Веса SISRE воспроизводят опубликованную таблицу MEO/GEO (Montenbruck et al. { "2018" }), пользовательский алгоритм Galileo ICD воспроизводит RTKLIB на реальных вещательных эфемеридах Galileo, а CRC-24Q воспроизводит своё контрольное значение каталога и пример кадра RTCM { "1005" }

# words to translate: MIXED
# EN: MIXED — VALIDATED building blocks, MODELLED results. The SISRE weights reproduce the published MEO/GEO table (Montenbruck et al. { "2018" }), the Galileo ICD user algorithm reproduces RTKLIB on real Galileo broadcast ephemerides, and CRC-24Q reproduces its catalogue check value and the RTCM { "1005" } example frame. Every fit, SISRE, continuity and quantisation figure is MODELLED: the representation error of a message against a (result <c1/>)
seg-b3585c7feb4e = СМЕШАННЫЙ — компоненты VALIDATED, результаты MODELLED. Веса SISRE воспроизводят опубликованную таблицу MEO/GEO (Montenbruck et al. { "2018" }), пользовательский алгоритм Galileo ICD воспроизводит RTKLIB на реальных вещательных эфемеридах Galileo, а CRC-24Q воспроизводит своё контрольное значение каталога и пример кадра RTCM { "1005" }. Каждое значение подгонки, SISRE, непрерывности и квантования относится к уровню MODELLED: ошибка представления сообщения относительно (результат <c1/>)

# words to translate: ATOMIC
# EN: LEO navigation message: the broadcast ephemeris and clock of a low Earth orbit (LEO) positioning, navigation and timing satellite, for any orbit, carrier and model, with optional named presets (Xona Pulsar, Iridium, Starlink, CentiSpace, a representative C-band system, the ATOMIC zero-clock model, Celeste IOD). CONTENT: auxiliary data (SVID, issue of data, band, signal health), synchronisation (week, time of week, a second-order clock polynomial af0-af2 about toc), ephemeris in one of four models -- the Galileo OS SIS ICD 16-parameter Keplerian set; that set plus along-track, cross-track and radial correction polynomials; the Liu et al. { "2025" } 22-parameter model; an ECEF polynomial with no clock terms (ATOMIC zero-clock) -- and other services (a Klobuchar broadcast set, NeQuick-G ai0-ai2 with the effective ionisation level, and system-time-to-UTC parameters with the ICD leap-second logic). FITTER: a truth orbit integrated with zonal J2-J6 or EGM2008 gravity to the chosen degree and drag, and a seeded free or steered clock; Levenberg-Marquardt fit of the Keplerian set on non-singular elements, then linear least-squares correction polynomials; clock fitted net of the relativistic term the user adds. ANALYSES: fit-interval-trade (signal-in-space range error, SISRE, with global-average weights for the orbit altitude, versus fit interval and update period, orbit-only and with clock), model-comparison (four models, parameter count, encoded bits, and Kshana's fit at the Liu et al. altitudes beside the published figures), midpass-update (the highest pass over a user, each message switch's position, clock and user-range jump, worst-geometry jump, PASS/FAIL against a continuity threshold), encode-decode (Kshana's own documented binary frame with CRC-24Q, a per-field half-step quantisation budget, a corrupted-frame check, a RINEX-4-style record export and import labelled a Kshana extension, and a CSV table). VALIDATED: the SISRE weights against the published MEO/GEO table (Montenbruck et al. { "2018" }); the Galileo user algorithm against RTKLIB on real Galileo broadcast ephemerides; CRC-24Q against its catalogue check value and the RTCM { "1005" } example frame. MODELLED: every fit and SISRE figure is representation error against a Kshana-integrated truth (no orbit determination or prediction error); the Liu et al. comparison uses different orbits; the encoding and text formats are Kshana's own.
seg-867f3e41b5ab = Навигационное сообщение LEO: передаваемые эфемериды и поправка часов спутника позиционирования, навигации и времени на низкой околоземной орбите (LEO) для любой орбиты, несущей и модели, с необязательными именованными пресетами (Xona Pulsar, Iridium, Starlink, CentiSpace, репрезентативная система C-диапазона, модель ATOMIC с нулевыми часами, Celeste IOD). СОДЕРЖИМОЕ: вспомогательные данные (SVID, выпуск данных, диапазон, признак исправности сигнала), синхронизация (неделя, время недели, полином часов второго порядка af0-af2 относительно toc), эфемериды в одной из четырёх моделей -- 16-параметрический кеплеровский набор из Galileo OS SIS ICD; этот набор плюс полиномы поправок вдоль трека, поперёк трека и радиальных; 22-параметрическая модель Liu et al. { "2025" }; полином в ECEF без членов часов (ATOMIC с нулевыми часами) -- и прочие службы (вещательный набор Klobuchar, NeQuick-G ai0-ai2 с эффективным уровнем ионизации и параметры перехода от системного времени к UTC с логикой високосной секунды по ICD). ПОДГОНКА: истинная орбита, проинтегрированная с зональной гравитацией J2-J6 или EGM2008 до выбранной степени и с сопротивлением, и заданные начальным значением (seed) свободные или управляемые часы; подгонка кеплеровского набора методом Левенберга — Марквардта по неособенным элементам, затем линейные поправочные полиномы по методу наименьших квадратов; часы подгоняются за вычетом релятивистского члена, который добавляет пользователь. АНАЛИЗЫ: fit-interval-trade (ошибка дальности в сигнале в пространстве, SISRE, с глобально усреднёнными весами для высоты орбиты, в зависимости от интервала подгонки и периода обновления, только по орбите и с часами), model-comparison (четыре модели, число параметров, кодированные биты и подгонка Kshana на высотах Liu et al. рядом с опубликованными значениями), midpass-update (самый высокий пролёт над пользователем, скачок позиции, часов и дальности пользователя при каждой смене сообщения, скачок при наихудшей геометрии, PASS/FAIL относительно порога непрерывности), encode-decode (собственный документированный двоичный кадр Kshana с CRC-24Q, бюджет квантования с полушагом по каждому полю, проверка повреждённого кадра, экспорт и импорт записи в стиле RINEX-4, помеченный как расширение Kshana, и таблица CSV). VALIDATED: веса SISRE по опубликованной таблице MEO/GEO (Montenbruck et al. { "2018" }); пользовательский алгоритм Galileo по RTKLIB на реальных вещательных эфемеридах Galileo; CRC-24Q по контрольному значению каталога и примеру кадра RTCM { "1005" }. MODELLED: каждое значение подгонки и SISRE — это ошибка представления относительно истины, проинтегрированной Kshana (без ошибки определения или прогноза орбиты); сравнение с Liu et al. использует другие орбиты; форматы кодирования и текстовые форматы — собственные для Kshana.
