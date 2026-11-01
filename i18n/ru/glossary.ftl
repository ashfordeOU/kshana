# Glossary terms (Russian).

## Evidence tiers
-tier-validated = VALIDATED
    .gloss = проверено по независимому внешнему эталону
-tier-modelled = MODELLED
    .gloss = вычислено по модели, без внешнего эталона
-tier-partner = PARTNER
    .gloss = часть партнёра; Kshana её не обеспечивает
-tier-exploratory = EXPLORATORY
    .gloss = не определено заранее как вывод

## Verdicts against a pre-registered bar
-verdict-met = MET
    .gloss = заранее установленный порог достигнут
-verdict-not-met = NOT MET
    .gloss = заранее установленный порог не достигнут

## Status words (all-caps words kept as written)
-status-prediction = PREDICTION
-status-corroborated = CORROBORATED
-status-not-corroborated = NOT CORROBORATED
-status-refused = REFUSED
-status-degraded = DEGRADED
-status-deficient = DEFICIENT
-status-observed = OBSERVED
-status-lost = LOST
-status-mismatch = MISMATCH
-status-verified = VERIFIED
-status-consistent = CONSISTENT
-status-inconsistent = INCONSISTENT
-status-spoof-detected = SPOOF DETECTED
-status-intact = INTACT, BUT THE SIGNER IS NOT PINNED

## Terms
-term-scenario = сценарий
-term-evidence-pack = пакет доказательств
-term-ledger = реестр (ledger)
-term-verification-matrix = матрица верификации
-term-interference = помехи
-term-integrity = целостность
-term-trust-score = оценка доверия
-term-receiver = приёмник
-term-clock = часы
-term-timing = синхронизация времени
-term-orbit-determination = определение орбиты
-term-ephemeris = эфемериды
-term-carrier-phase = фаза несущей
-term-integer-ambiguity = целочисленная неоднозначность
-term-love-number = число Лява
-term-libration = либрация
-term-reference-frame = система отсчёта
-term-pre-registration = предварительная регистрация
-term-oracle = оракул (независимый эталон)
-term-bar = порог (критерий соответствия)
-term-baseline = базовый уровень
-term-holdout = holdout (отложенная выборка)
-term-advisory = консультативный
-term-type-approved = с утверждённым типом
-term-machine-translation = машинный перевод
-term-native-speaker = носитель языка
-term-reviewed = проверенный

## Kept as written (acronyms and field terms; listed so the check knows them)
-kept-gnss = GNSS
-kept-pnt = PNT
-kept-raim = RAIM
-kept-araim = ARAIM
-kept-nmea = NMEA
-kept-cusum = CUSUM
-kept-auc = AUC
-kept-roc = ROC
-kept-lambda = LAMBDA
-kept-dop = DOP

## Commands (always kept)
-cmd-kshana = kshana
-cmd-check = --check
-cmd-study = --study
-cmd-bench = bench
-cmd-receiver-trust = receiver-trust

## Units in running text (symbols such as m, s, ns, dB-Hz never change)
-unit-metre = метр
-unit-second = секунда
-unit-nanosecond = наносекунда
-unit-decibel-hertz = децибел-герц

## Product name (never translated)
-brand = Kshana

## The advisory line: every Kshana surface carries it. The main value is the general line.
-advisory = Программное обеспечение консультативного характера, не оборудование с утверждённым типом.
    .maritime = Программное обеспечение консультативного характера, не навигационное оборудование с утверждённым типом (IEC 61108, IEC 61162): ответственность за судовождение остаётся на операторе.
    .research-test = Программное обеспечение консультативного характера для исследований, моделирования и испытаний. Оно не является оборудованием с утверждённым типом и не оценивает и не одобряет приёмник, часы или лабораторию.
    .short = Носит консультативный характер: это не навигационное оборудование с утверждённым типом; ответственность остаётся на операторе. Уровень доказательств: { -tier-modelled }.

## The machine-translation notice (every translated page and the Studio show it)
-mt-notice = Машинный перевод, не проверенный носителем языка. Эталоном служит английская версия.
