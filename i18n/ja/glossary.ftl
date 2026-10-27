# 用語集（日本語）。

## Evidence tiers
-tier-validated = VALIDATED
    .gloss = 独立した外部の参照と照合して確認済み
-tier-modelled = MODELLED
    .gloss = 外部の参照なしに、モデルから計算
-tier-partner = PARTNER
    .gloss = パートナーの担当部分であり、Kshana は提供しません
-tier-exploratory = EXPLORATORY
    .gloss = あらかじめ結論として設定していないもの

## Verdicts against a pre-registered bar
-verdict-met = MET
    .gloss = あらかじめ設定した合格基準に到達した
-verdict-not-met = NOT MET
    .gloss = あらかじめ設定した合格基準に届かなかった

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
-term-scenario = シナリオ
-term-evidence-pack = エビデンスパック
-term-ledger = 台帳（ledger）
-term-verification-matrix = 検証マトリクス
-term-interference = 干渉
-term-integrity = インテグリティ（完全性）
-term-trust-score = 信頼スコア
-term-receiver = 受信機
-term-clock = 時計（クロック）
-term-timing = タイミング
-term-orbit-determination = 軌道決定
-term-ephemeris = エフェメリス（軌道暦）
-term-carrier-phase = 搬送波位相
-term-integer-ambiguity = 整数アンビギュイティ
-term-love-number = ラブ数
-term-libration = 秤動
-term-reference-frame = 座標系
-term-pre-registration = 事前登録
-term-oracle = オラクル（独立した参照）
-term-bar = 合格基準
-term-baseline = ベースライン
-term-holdout = ホールドアウト（封印したデータセット）
-term-advisory = 助言（アドバイザリー）
-term-type-approved = 型式承認済み
-term-machine-translation = 機械翻訳
-term-native-speaker = ネイティブスピーカー
-term-reviewed = 確認済み

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
-unit-metre = メートル
-unit-second = 秒
-unit-nanosecond = ナノ秒
-unit-decibel-hertz = デシベルヘルツ

## Product name (never translated)
-brand = Kshana

## The advisory line: every Kshana surface carries it. The main value is the general line.
-advisory = 助言用ソフトウェアであり、型式承認を受けた機器ではありません。
    .maritime = 助言用ソフトウェアであり、型式承認を受けた航法装置（IEC 61108、IEC 61162）ではありません。船舶の航行の責任は引き続き運用者にあります。
    .research-test = 研究、シミュレーション、試験のための助言用ソフトウェアです。型式承認を受けた機器ではなく、受信機、時計、ラボの評価も承認も行いません。
    .short = 助言のみ：型式承認を受けた航法装置ではありません。運用者が引き続き責任を負います。エビデンスのティア：{ -tier-modelled }。

## The machine-translation notice (every translated page and the Studio show it)
-mt-notice = 機械翻訳であり、ネイティブスピーカーによる確認は行われていません。英語版が基準です。
