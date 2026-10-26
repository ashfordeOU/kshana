# site-js.ftl (ja): translations

js-app-engine-failed = エンジンを読み込めませんでした（{ $reason }）。

js-ledger-rows =
    { $n ->
       *[other] 台帳の{ $n }行
    }

js-site-action-copy-install = コピー：cargo install kshana

js-site-action-launch = { $name }を起動

js-site-action-licence = 商用ライセンスについて相談する

js-site-action-pro-eval = Kshana Pro の評価を依頼する

js-site-action-study = スタディを依頼する

js-site-action-theme = ライトテーマとダークテーマの切り替え

js-site-capabilities-bd-after = { $s } s 後に { $m } m

js-site-capabilities-bd-combined = 合成

js-site-capabilities-bd-crossing = { $s } s で { $m } m

js-site-capabilities-bd-fig-crossing = «{ $s } s 後に { $m } m»、支配的な要因は{ $dom }

js-site-capabilities-bd-fig-lead = 対数軸で見た GNSS 喪失からの経過時間（{ $grade }グレードの IMU、{ $speed } m/s）：

js-site-capabilities-cd-canvas-aria = 天体の周りの衛星コンステレーション、実画像：ドラッグまたは矢印キーで回転、プラスとマイナスで拡大縮小

js-site-capabilities-cd-design-meta = { $n }機の衛星 · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = 各衛星はエンジン自身の軌跡をたどります。凍結軌道の半径はシェルの軌道要素から求めます。

js-site-capabilities-cd-foot-mean-motion = 各衛星はエンジン自身の軌跡を、平均運動から決まる半径でたどります。

js-site-capabilities-cd-foot-walker = 全{ $n }機の衛星は、各シェル自身のウォーカー・パラメータから配置しています（エンジンの{ $shown }本の軌跡と照合済み：最大{ $deg }°）。尾はエンジンの{ $shown }本の軌跡です。

js-site-capabilities-cd-hud-body = { $body } · «{ $n }機の衛星»

js-site-capabilities-cd-hud-mission = ミッション «{ $time }»

js-site-capabilities-cd-legend-shell = シェル { $n } · { $inc }°

js-site-capabilities-cd-map-availability = PDOP ≤ { $limit } だった実行の割合（0～100 %）

js-site-capabilities-cd-map-pdop = { $step }° セルごとの平均 PDOP（{ $lo }～{ $hi }、明るいほど良好）

js-site-capabilities-cd-map-visible = 可視衛星数の平均（{ $lo }～{ $hi }）

js-site-capabilities-cd-metric-availability = 可用性

js-site-capabilities-cd-metric-pdop = 平均 PDOP

js-site-capabilities-cd-metric-visible = 可視

js-site-capabilities-cd-no-webgl = 3-D ビューには WebGL が必要です。カバレッジマップと数値は同じ実行によるものです。

js-site-capabilities-cd-pause = 軌道を一時停止

js-site-capabilities-cd-play = 軌道を再生

js-site-capabilities-cd-shell = { $name }：ウォーカー { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }：{ $n }機の衛星、運用者のスロット表

js-site-capabilities-cd-span = { $dur }をループ再生

js-site-capabilities-cd-stat-in-view = 平均可視数

js-site-capabilities-cd-stat-mask = マスク · 実行

js-site-capabilities-cd-stat-median = PDOP の中央値

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }、{ $body }全体

js-site-capabilities-cd-stat-satellites = 衛星

js-site-capabilities-cd-stat-worst = 最悪地点

js-site-capabilities-cd-title-leo = 低軌道メガコンステレーション

js-site-capabilities-cd-title-lunar = 月中継衛星群

js-site-capabilities-cd-work-ratio = 緯度プリフィルタ後 { $pct } % · DOP 解 { $dop } 個

js-site-capabilities-cd-work-tests = 総当たりスキャンなら { $brute } 回のところ、衛星と地点の判定は { $after } 回

js-site-capabilities-cd-work-title = 可視判定の作業量

js-site-capabilities-cg-cn0-sub = C/N0 と追尾下限の比較

js-site-capabilities-cg-cn0-title = 搬送波対雑音密度比

js-site-capabilities-cg-compose-availability = 可用性

js-site-capabilities-cg-compose-fewest = 追尾数の最小値

js-site-capabilities-cg-compose-js = 平均 J/S

js-site-capabilities-cg-log-campaign = キャンペーン { $file } · { $phases } フェーズ · { $runs } 件のメンバー実行

js-site-capabilities-cg-log-phase = フェーズ { $name } 開始

js-site-capabilities-cg-log-phase-carries = フェーズ { $name } 開始 · 引き継ぎ：{ $carried }

js-site-capabilities-cg-monte-axis = { $n } 個のシードにわたる最終クロック誤差（{ $path }）

js-site-capabilities-cg-monte-ci = 平均、95 % 区間

js-site-capabilities-cg-monte-mean = 平均

js-site-capabilities-cg-monte-p05 = 5 パーセンタイル

js-site-capabilities-cg-monte-p05-p95 = 5～95 パーセンタイル

js-site-capabilities-cg-monte-p50 = 中央値

js-site-capabilities-cg-monte-p95 = 95 パーセンタイル

js-site-capabilities-cg-monte-std = 標準偏差

js-site-capabilities-cg-not-in-phase = このフェーズではありません

js-site-capabilities-cg-now = フェーズ { $n } / { $total }：{ $name } · { $from }～{ $to }

js-site-capabilities-cg-phase-title = { $name }：{ $from }～{ $to } · 終了条件 { $by } · メンバー種別 { $kinds }

js-site-capabilities-cg-pl-sub = アラート限界との比較

js-site-capabilities-cg-pl-title = 保護レベル

js-site-capabilities-cg-pos-sub = 許容値との比較 · 対数

js-site-capabilities-cg-pos-title = 慣性位置誤差

js-site-capabilities-cg-range = { $lo }～{ $hi }

js-site-capabilities-cg-sweep-all-lost = 全喪失の開始点

js-site-capabilities-cg-sweep-axis = ジャマーの送信電力（{ $key }）

js-site-capabilities-cg-sweep-first-loss = 最初の喪失

js-site-capabilities-cg-sweep-lg-availability = 可用性

js-site-capabilities-cg-sweep-lg-js = 平均 J/S

js-site-capabilities-cg-sweep-never = なし

js-site-capabilities-cg-sweep-nodes = ノード

js-site-capabilities-cg-sweep-none = なし

js-site-capabilities-cg-sweep-span = J/S の範囲

js-site-capabilities-cg-te-sub = ガードとの比較

js-site-capabilities-cg-te-title = クロックの時刻誤差

js-site-capabilities-copy = コピー

js-site-capabilities-copy-aria = 実行を再現するコマンドをコピー：kshana { $file }

js-site-capabilities-cz-best = 最良の PDOP

js-site-capabilities-cz-failed = 記録された実行をここで読み込めませんでした。代わりに Studio で開いてください。

js-site-capabilities-cz-fix = 測位解が得られたサンプル

js-site-capabilities-cz-fix-value = { $total } 件中 { $n } 件（{ $pct }%）

js-site-capabilities-cz-median = PDOP の中央値

js-site-capabilities-engine = エンジン v{ $version }

js-site-capabilities-engine-build = エンジン v{ $version }、ビルド

js-site-capabilities-engine-report = エンジンレポート

js-site-capabilities-globe-aria = { $name }の実画像（{ $credit }）。ドラッグまたは矢印キーで回転し、プラスとマイナスで拡大縮小します。

js-site-capabilities-ho-ends = 実行は { $t } で終了

js-site-capabilities-ho-past-guard = ガード超過

js-site-capabilities-no-seed = 決定論的、シードなし

js-site-capabilities-open-in-studio = { $studio }で開く

js-site-capabilities-open-report = エンジンのレポートを開く

js-site-capabilities-orrery-aria = 実行のエポックにおける太陽系：ドラッグまたは矢印キーで回転、プラスとマイナスで拡大縮小

js-site-capabilities-orrery-bodies = { $n }個の天体 · 観測者 «{ $observer }»

js-site-capabilities-orrery-epoch = エポック «{ $epoch }» · TDB（太陽系力学時）、ユリウス日 { $jd }

js-site-capabilities-pnt-kicker = この天体での測位 · body-pnt 種別

js-site-capabilities-pnt-lander = 表面の { $lat }°、{ $lon }° にいる着陸機は、中継衛星を使って航法を行い、地球が地平線上にあるときは地球からの双方向測距も使います（片道の光時間 { $min } min）。可用性：中継衛星のみで { $a } %、地球リンクを加えると { $b } %。

js-site-capabilities-pnt-orbiter = 周回するユーザーは、中継衛星を使って航法を行い、地球が地平線上にあるときは地球からの双方向測距も使います（片道の光時間 { $min } min）。可用性：中継衛星のみで { $a } %、地球リンクを加えると { $b } %。

js-site-capabilities-pnt-relays = { $body }の周回 { $alt } km に中継衛星 { $n } 機

js-site-capabilities-report-data = レポートとデータ

js-site-capabilities-result-data = 結果データ

js-site-capabilities-saved = { $name }を保存しました

js-site-capabilities-scenario-file = シナリオファイル

js-site-capabilities-seed = シード { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» は { $dur } の間ガードを維持

js-site-capabilities-six-clock-guard = ガード { $v } ns

js-site-capabilities-six-coast-budget = 許容値 { $m } m

js-site-capabilities-six-coast-denied = GNSS 拒否

js-site-capabilities-six-coast-fig = «{ $id }» は { $s } s の間、許容値内

js-site-capabilities-six-floor = 追尾下限

js-site-capabilities-six-integ-fig = «{ $n } エポック中 { $ok }» が利用可能 · アラート限界は水平 { $h } m、垂直 { $v } m

js-site-capabilities-six-integ-limit = 垂直アラート限界

js-site-capabilities-six-integ-pl = 垂直（実線）と水平（破線）の保護レベル

js-site-capabilities-six-jam-effective = 有効、衛星 { $n } 機

js-site-capabilities-six-jam-fig = 可視 { $max } 機のうち追尾 «{ $min }» · ジャミング下の可用性 «{ $av }»（公称 { $nom }）· 平均 J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = 公称、ジャマーなし（破線）

js-site-capabilities-six-orbit-fig = 高度 «{ $lo }–{ $hi } km» · { $dur } にわたる地上軌跡

js-site-capabilities-six-orbit-label = { $source } · { $n } サンプル

js-site-capabilities-six-spoof-detects = { $id } が検出

js-site-capabilities-six-spoof-fig = «{ $id }» は { $s } s で検出（境界 { $ns } ns）

js-site-capabilities-ss-angle = 太陽からの角度

js-site-capabilities-ss-credit = 画像：{ $credits }。* 地図は極まで届いていません。空白部分には地図の極域の平均色を使っています。土星の環：{ $ring }（{ $licence }）。

js-site-capabilities-ss-days = { $v } 日

js-site-capabilities-ss-frame-origin = 座標系の原点

js-site-capabilities-ss-from-sun = 太陽から

js-site-capabilities-ss-gloss = NAIF：NASA の Navigation and Ancillary Information Facility による天体コード。GM：重力定数。J2：扁平率の項。IAU 極：国際天文学連合の自転極で、赤経（RA）と赤緯（Dec）で表します。

js-site-capabilities-ss-j2-none = 公表値なし

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $parent }の{ $class } · NAIF { $naif }

js-site-capabilities-ss-light-time = { $observer }からの光時間

js-site-capabilities-ss-link = { $from }から{ $to }まで、片道の光時間 { $one }、往復 { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
       *[other] この実行が計算するリンク：
    }

js-site-capabilities-ss-moons =
    { $n ->
       *[other] エポックにおける衛星（縮尺どおり）
    }

js-site-capabilities-ss-nominal-error = 距離の公称誤差 { $km } km

js-site-capabilities-ss-north = 黄道の北側から見た図です。

js-site-capabilities-ss-period = 公転周期

js-site-capabilities-ss-period-about = { $parent }まわりの周期

js-site-capabilities-ss-pole = IAU 極（RA、Dec）

js-site-capabilities-ss-radius = 平均半径

js-site-capabilities-ss-retrograde = { $v } h、逆行

js-site-capabilities-ss-rotation = 恒星自転

js-site-capabilities-ss-years = { $v } 年

js-site-capabilities-st-bound = 境界 { $v } m

js-site-capabilities-st-fig-none = { $n } エポック、誤差が境界を超えたものはありません。横軸：真の位置誤差、縦軸：保護レベル、どちらも対数軸です。

js-site-capabilities-st-fig-some = { $n } エポック、うち { $k } で誤差が境界を超えています。横軸：真の位置誤差、縦軸：保護レベル、どちらも対数軸です。

js-site-capabilities-st-limit = アラート限界 { $m } m

js-site-capabilities-st-misleading = 誤誘導：誤差が境界を超過

js-site-capabilities-st-normal = 通常動作

js-site-capabilities-st-unavailable = 利用不可：境界がアラート限界を超過

js-site-capabilities-studio-embedded = { $studio }（埋め込み）：orbit-multignss の実行

js-site-capabilities-studio-load = ここに{ $studio }を読み込む

js-site-capabilities-studio-outline = アウトラインを再表示

js-site-capabilities-wave-chirp = チャープ

js-site-capabilities-wave-cw = CW トーン

js-site-capabilities-wave-noise = ノイズ

js-site-capabilities-wf-an-caption = 行 T+{ $t } s · 下限からの dB、対数スケール · 全グリッドのピーク { $peak } dB

js-site-capabilities-wf-degraded = 劣化

js-site-capabilities-wf-degraded-low = 劣化

js-site-capabilities-wf-failed = 記録された実行をここで読み込めませんでした。

js-site-capabilities-wf-grid = グリッド

js-site-capabilities-wf-iq = T+{ $t } s で、エンジンはモデルを { $mhz } MHz 付近の { $n } 個の IQ（同相・直交）サンプルとしても描画し、Welch 推定（{ $nfft } 点の { $segments } セグメント）と照合します。積分電力比：{ $ratio }。

js-site-capabilities-wf-jammer-off = { $what }オフ

js-site-capabilities-wf-jammer-on = { $what }オン

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · { $on } s から終了まで

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = ロック喪失

js-site-capabilities-wf-lost-low = ロック喪失

js-site-capabilities-wf-max = それより { $peak } dB 上 · 対数スケール、{ $v0 } dB から

js-site-capabilities-wf-no-jammer = ジャマーなし

js-site-capabilities-wf-now = 現在

js-site-capabilities-wf-pause = ウォーターフォールを一時停止

js-site-capabilities-wf-peak = ピーク { $v } dB

js-site-capabilities-wf-play = ウォーターフォールを再生

js-site-capabilities-wf-replay-previous = リプレイ開始 · 下に前回のパス

js-site-capabilities-wf-replay-start = リプレイ開始

js-site-capabilities-wf-say = T+{ $t } s、{ $band } { $v } dB-Hz、{ $state }

js-site-capabilities-wf-signal = 信号 +{ $v } dB

js-site-capabilities-wf-summary = { $file }の記録された実行：{ $bands }バンド、{ $jammers }台のジャマー、{ $seconds }秒。最悪のバンド { $worst } は { $at } s に { $min } dB-Hz まで低下し、追尾下限は { $floor } dB-Hz です。

js-site-capabilities-wf-tip-above = ノイズフロアより { $v } dB 上

js-site-capabilities-wf-tip-in = { $bands }内

js-site-capabilities-wf-tracking = 追尾中

js-site-capabilities-wf-tracking-low = 追尾中

js-site-caphero-aria = { $date }時点のエンジンの solar-system 実行による太陽系：太陽と、エンジンの軌道トラックに沿って動く{ $bodies }個の天体。軌道のうち{ $valid }本は JPL Horizons と照合して検証済みです。

js-site-caphero-clock = +{ $days } 日 · { $date }

js-site-caphero-copy-command = コマンドをコピー

js-site-caphero-copy-title = 再現するコマンドをコピー

js-site-caphero-credits = 距離は対数スケールで圧縮し、方向は実際のままです。天体は拡大し、自転は表示用の速さです。画像：{ $credits }。土星の環：{ $ring }（{ $licence }）。

js-site-caphero-credits-summary = スケールと画像のクレジット

js-site-caphero-engine-build = エンジン v{ $version }、ビルド

js-site-caphero-explore = すべての天体を調べる

js-site-caphero-file-title = 実行されたシナリオファイル

js-site-caphero-list-item = { $name }：{ $label }、エポックで太陽から { $au } au、公転周期 { $period }。

js-site-caphero-list-item-light = { $name }：{ $label }、エポックで太陽から { $au } au、公転周期 { $period }、{ $observer }からの光時間 { $light }。

js-site-caphero-no-seed = 決定論的、シードなし

js-site-caphero-open-in-studio = { $studio }で開く

js-site-caphero-pause = 軌道を一時停止

js-site-caphero-period-days = { $value } 日

js-site-caphero-period-years = { $value } 年

js-site-caphero-play = 軌道を再生

js-site-caphero-rate-epoch = 実行のエポックにおけるフレーム

js-site-caphero-read-distance = 太陽から { $au } au

js-site-caphero-read-light = エポックにおける{ $observer }からの光時間 { $light }

js-site-caphero-read-orbit = 軌道 { $period }

js-site-caphero-seed = シード { $seed }

js-site-copy-aria = コピー：{ $cmd }

js-site-developers-captured-from = { $recorded } に取得、取得元：

js-site-developers-engine-build = エンジン v{ $version }、ビルド

js-site-developers-exit-stamp = 終了 { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }：{ $studio }で開く

js-site-developers-no-seed = （決定論的、シードなし）

js-site-developers-open-in-studio = { $studio }で開く

js-site-developers-pause = リプレイを一時停止

js-site-developers-play = リプレイを再生

js-site-developers-replaying = # 記録されたセッションをリプレイ中

js-site-developers-seed = （シード { $seed }）

js-site-developers-what-runs-write = すべての実行が書き出すもの

js-site-editions-builds-on-it = { $label }はこれを土台にしています

js-site-editions-core-kinds =
    { $n ->
       *[other] { $n } 種別
    }

js-site-editions-core-title = オープンコア

js-site-editions-core-validated = 検証済み

js-site-editions-core-validated-of = { $total } 中 { $validated }

js-site-editions-free-core = すべての種別と同様、オープンコアでは無料

js-site-editions-group-other = その他

js-site-editions-kind-no-ledger = 名前が一致する台帳モジュールはありません

js-site-editions-kind-validated = 台帳 { $tot } 行中 { $v } 行が検証済み

js-site-editions-pause = リングを一時停止

js-site-editions-play = リングを再生

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = カスタムスタディ

js-site-evidence-allan-lg-published = 公表値、SP 1065 表 31

js-site-evidence-allan-mdev = 修正アラン偏差

js-site-evidence-allan-na = 該当なし

js-site-evidence-allan-oadev = オーバーラッピング・アラン偏差

js-site-evidence-allan-ohdev = オーバーラッピング・アダマール偏差

js-site-evidence-allan-read = { $tau } s · アラン { $oadev } · 修正 { $mdev } · アダマール { $ohdev }

js-site-evidence-allan-st-gate = テストのゲート

js-site-evidence-allan-st-reproduced = 再現した公表値

js-site-evidence-allan-st-worst = 最悪の相対誤差

js-site-evidence-allan-tdev = 時間偏差（秒）

js-site-evidence-allan-tip-at = «{ $name }»（{ $m } s）

js-site-evidence-allan-tip-engine = エンジン：«{ $got }» · 相対誤差 { $err }

js-site-evidence-allan-tip-table = SP 1065 表 31：«{ $want }»

js-site-evidence-cell-tip = 機能 { $i } / { $n } · «{ $label }»

js-site-evidence-cowell-aria = Orekit との位置差（24 時間）：力のティア 1～5 は { $worst } 未満にとどまり、抗力ティアは { $drag } に達します（特性評価の帯域）
