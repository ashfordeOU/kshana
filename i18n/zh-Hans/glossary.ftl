# 术语表（简体中文）。

## Evidence tiers
-tier-validated = VALIDATED
    .gloss = 与独立的外部参考基准（oracle）核对一致
-tier-modelled = MODELLED
    .gloss = 由模型计算得出，没有外部参考
-tier-partner = PARTNER
    .gloss = 合作方负责的部分，Kshana 不提供
-tier-exploratory = EXPLORATORY
    .gloss = 事先未设定为结论

## Verdicts against a pre-registered bar
-verdict-met = MET
    .gloss = 达到了事先设定的判据
-verdict-not-met = NOT MET
    .gloss = 未达到事先设定的判据

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
-term-scenario = 场景
-term-evidence-pack = 证据包
-term-ledger = 台账（ledger）
-term-verification-matrix = 验证矩阵
-term-interference = 干扰
-term-integrity = 完好性
-term-trust-score = 信任度
-term-receiver = 接收机
-term-clock = 时钟
-term-timing = 授时
-term-orbit-determination = 定轨
-term-ephemeris = 星历
-term-carrier-phase = 载波相位
-term-integer-ambiguity = 整周模糊度
-term-love-number = 勒夫数
-term-libration = 天平动
-term-reference-frame = 坐标系
-term-pre-registration = 预先登记
-term-oracle = 参考基准（oracle，独立参照）
-term-bar = 判据
-term-baseline = 基线
-term-holdout = 保留集（封存的数据集）
-term-advisory = 咨询性（仅供参考）
-term-type-approved = 经型式认可
-term-machine-translation = 机器翻译
-term-native-speaker = 母语人士
-term-reviewed = 已审校

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
-unit-metre = 米
-unit-second = 秒
-unit-nanosecond = 纳秒
-unit-decibel-hertz = 分贝赫兹

## Product name (never translated)
-brand = Kshana

## The advisory line: every Kshana surface carries it. The main value is the general line.
-advisory = 仅供参考的软件，不是经型式认可的设备。
    .maritime = 仅供参考的软件，不是经型式认可的导航设备（IEC 61108、IEC 61162）：船舶航行的责任仍由操作人员承担。
    .research-test = 用于研究、仿真和测试的仅供参考的软件。它不是经型式认可的设备，也不对接收机、时钟或实验室进行评级或认可。
    .short = 仅供参考：不是经型式认可的导航设备；责任仍由操作人员承担。证据等级：{ -tier-modelled }。

## The machine-translation notice (every translated page and the Studio show it)
-mt-notice = 机器翻译，未经母语人士审校。以英文版为准。
