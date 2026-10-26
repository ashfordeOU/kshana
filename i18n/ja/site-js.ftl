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

js-site-capabilities-bd-fig-tail = 線はエンジンの短時間惰行での増大則とその二乗和平方根です。交差点は、バイアス項を抑える完全な九状態（シューラー）誤差モデルから得ており、そのため長い惰行では各交差が線の到達よりやや後になります。棒グラフ：四つの IMU グレードについての同じ交差点です。

js-site-capabilities-cd-title-gnss = 四つの GNSS の併用

js-site-capabilities-cg-compose-text = 一台のジャマー（{ $power } { $unit }）を一か所に置き、‹{ $kind }› 種別の { $n } 件のメンバー実行に結び付けています。海峡の船と海岸道路の車は同じ原因を見ても、異なる結果になります。

js-site-capabilities-cg-monte-text = 同じ ‹{ $kind }› シナリオを、基準シード { $seed } から 一回につき一つのシードで { $n } 回実行しました。自由走行クロックの最終誤差のばらつきと、平均に対する 95 % 信頼区間です。

js-site-capabilities-cg-sweep-text = 一つの ‹{ $kind }› シナリオを、ジャマーの送信電力を { $from } から { $to } { $unit } まで段階的に変えながら、ノードごとに一回ずつ実行しました。ジャミング下の可用性（実線）と平均 J/S（破線）は、各メンバー実行自身の性能指標から得ています。

js-site-capabilities-pnt-chart-title = 可視の中継衛星（線）· 地平線上の地球（網掛け）· 測位には四機が必要

js-site-capabilities-six-orbit-sgp4 = 二行軌道要素セットからの SGP4

js-site-caphero-rate = 実行の { $days } 日分を毎秒

js-site-evidence-allan-aria = NIST SP 1065 の 1000 点データセットの 四種類の偏差を平均化時間に対して表示。公表値 { $n } 件をすべて再現、最悪の相対誤差は { $err }

js-site-evidence-cowell-gto = 静止トランスファー軌道

js-site-evidence-cowell-leo = 低軌道

js-site-evidence-cowell-lg-con = ティア1～5、二体問題から太陽放射圧まで、各二軌道

js-site-evidence-cowell-lg-drag = ティア6、抗力：特性評価のみ（密度モデルが異なる）

js-site-evidence-cowell-read = { $h } h · ティア1～5の最悪値 { $con } · 抗力 { $drag }

js-site-evidence-cowell-st-drag = 抗力ティア、最悪値

js-site-evidence-cowell-st-epochs = ティア1～5のエポック

js-site-evidence-cowell-tip-tier = «ティア{ $tier }：{ $label }» · { $regime }

js-site-evidence-cowell-tip-worst = 最悪の差 «{ $err }»（{ $h } h）

js-site-evidence-hero-live = { $label }。{ $cap }。{ $oracle }

js-site-evidence-hero-no-oracle = 名前の挙がっている外部オラクルはありません。

js-site-evidence-hero-oracle = オラクル

js-site-evidence-hero-oracle-is = オラクル：{ $o }

js-site-evidence-hero-owner = 担当

js-site-evidence-hero-partner = これはパートナーの担当であり、エンジンはこれについて何も主張しません。

js-site-evidence-hero-pause = スイープを一時停止

js-site-evidence-hero-play = スイープを再生

js-site-evidence-hero-row = { $n } 行中 { $i } 行目

js-site-evidence-hold-accepted = 許容：係数 { $bar } 以内

js-site-evidence-hold-aria = セシウムクロックの実測二乗平均平方根の時刻誤差と惰行時間、およびエンジンの予測。予測値の実測値に対する比が違反する範囲は { $lo }～{ $hi }

js-site-evidence-hold-control = «対照：» 素朴な予測（一秒の安定度をホワイト周波数雑音として読んだもの）では比が { $ratio } となり、約 { $factor } 倍外れて、同じ合格基準を満たしません。この基準は有効に機能しています。

js-site-evidence-hold-lg-meas = ホールドアウトした記録での実測（点：違反）

js-site-evidence-hold-lg-pred = 最初の三分の一からの予測（輪：違反）

js-site-evidence-hold-nodata = このページの生成時に、実測記録は利用できませんでした。

js-site-evidence-hold-perfect = 1 = 完全一致

js-site-evidence-hold-ratio-aria = { $n } 個のしきい値について、予測値の実測値に対する比。すべて許容係数 { $bar } 以内

js-site-evidence-hold-read = 惰行 { $h } h · 実測 { $m } ns · 予測 { $p } ns

js-site-evidence-hold-st-fit = フィッティングに使用

js-site-evidence-hold-st-samples = 一秒サンプル

js-site-evidence-hold-st-syncs = ホールドアウトした同期点

js-site-evidence-hold-tip-breach = 予測した違反 { $p } s · 実測 { $m } s

js-site-evidence-hold-tip-error = «時刻誤差 { $thr } ns»

js-site-evidence-hold-tip-ratio = 予測値の実測値に対する比 «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · 予測値の実測値に対する比 «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = カイ二乗分布

js-site-evidence-kernel-chi2-quantile = カイ二乗分位点

js-site-evidence-kernel-noncentral = 非心カイ二乗

js-site-evidence-kernel-normal-cdf = 正規分布

js-site-evidence-kernel-normal-quantile = 正規分位点

js-site-evidence-kernel-pbias = 検出バイアス

js-site-evidence-ladder-aria = 軌道残差 { $lo }～{ $hi } m を一つの対数スケールで表示。機関の合格基準は { $bar } m

js-site-evidence-ladder-bar = 機関の合格基準 { $bar } m

js-site-evidence-ladder-cowell = Cowell と Orekit 12.2 の比較、最悪値

js-site-evidence-ladder-g24 = Galileo E11、24 時間フィット

js-site-evidence-ladder-g8 = Galileo E11、8 時間フィット

js-site-evidence-ladder-lg-headline = 代表残差

js-site-evidence-ladder-lg-over = 機関の合格基準 { $bar } m 超過

js-site-evidence-ladder-lg-ring = 力モデルのみ、経験的加速度を加える前

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter、4 時間フィット

js-site-evidence-ladder-read = スイープ { $v } · 代表残差 { $total } 件中 { $n } 件がこれ以下

js-site-evidence-ladder-rt-arc = { $arc } アーク · 次数と位数 { $do } · 観測 { $n } 件

js-site-evidence-ladder-rt-rtn = 動径方向 { $r } m · 沿軌道方向 { $a } m · 軌道直交方向 { $c } m

js-site-evidence-ladder-sgp4 = SGP4 と AIAA ベクトルの比較、最悪値

js-site-evidence-ladder-swarm = Swarm-A、3 時間フィット

js-site-evidence-ladder-tip-cowell = «Cowell · { $n } エポック中の最悪値» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · まる一日» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · 力モデルのみ» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · 経験的加速度あり» · { $rms } m

js-site-evidence-ladder-tip-lrd = «月周回機 · 力学的» · { $rms } m

js-site-evidence-ladder-tip-lrr = «月周回機 · 縮約力学的» · { $rms } m、合格基準 { $bar } m を上回っており、そのまま報告しています

js-site-evidence-ladder-tip-sgp4 = «SGP4 · { $n } ベクトル中の最悪値» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · 力学的» · { $rms } m、ほぼすべて沿軌道方向（抗力）

js-site-evidence-ladder-tip-swr = «Swarm-A · 縮約力学的» · { $rms } m

js-site-evidence-raim-aria = SciPy のケース { $n } 件中 { $pass } 件が許容帯域内、{ $kernels } 個のカーネルにわたる結果

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = どのケースでも使われた帯域の最大値

js-site-evidence-raim-read = ケース { $q } / { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = 帯域の { $pct } %

js-site-evidence-raim-scale-aria = カラースケール：使用した許容帯域の割合、10 のマイナス 11 乗から帯域の端までの対数

js-site-evidence-raim-st-inside = 帯域内

js-site-evidence-raim-st-most = 帯域の大部分を使用

js-site-evidence-raim-tick-edge = 帯域の端

js-site-evidence-raim-tick-exact = 完全一致

js-site-evidence-raim-tip-case = «{ $kernel }» · ケース { $j } / { $n }

js-site-evidence-raim-tip-exact = SciPy と«完全一致»

js-site-evidence-raim-tip-uses = 許容帯域の «{ $pct } %» を使用

js-site-evidence-sgp4-aria = AIAA ベクトル { $n } 件中 { $n } 件を再現。最悪値 { $worst }、中央値 { $median }、すべて許容差 { $tol } 以内

js-site-evidence-sgp4-deep = 深宇宙（SDP4）

js-site-evidence-sgp4-lg-deep = 深宇宙ベクトル（SDP4）

js-site-evidence-sgp4-lg-median = スケール上の中央値と最悪値

js-site-evidence-sgp4-lg-near = 地球近傍ベクトル（SGP4）

js-site-evidence-sgp4-near = 地球近傍（SGP4）

js-site-evidence-sgp4-read = ベクトル { $i } / { $n } · 衛星 { $sat } · 誤差 { $err }

js-site-evidence-sgp4-read-deep = ベクトル { $i } / { $n } · 衛星 { $sat }、深宇宙 · 誤差 { $err }

js-site-evidence-sgp4-scale-aria = 0.1 マイクロメートルから許容差までのカラースケール、対数

js-site-evidence-sgp4-st-deep = 深宇宙ベクトル

js-site-evidence-sgp4-st-sats = テスト衛星

js-site-evidence-sgp4-tip-sat = «衛星 { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = ベクトル { $j } / { $n } · 位置誤差 «{ $err }»

js-site-evidence-st-median = 中央値

js-site-evidence-st-worst = 最悪値

js-site-evidence-tolerance = 許容差 { $v }

js-site-filter-in-all = 全体で { $total } 件

js-site-filter-matches =
    { $n ->
       *[other] { $n } 件一致
    }

js-site-filter-n-of-m = { $total } 中 { $n }

js-site-filter-n-of-m-rows = { $total } 行中 { $n } 行

js-site-filter-rows = { $total } 行

js-site-home-banner-gnss-lost = GNSS 喪失 · ホールドオーバー

js-site-home-banner-holdover-out = ホールドオーバー · クロックがガード外

js-site-home-banner-integrity-holdover = インテグリティ警報 · ホールドオーバー継続

js-site-home-banner-integrity-none = インテグリティ警報 · 保護レベルなし

js-site-home-banner-integrity-pl = インテグリティ警報 · PL > AL

js-site-home-banner-jamming = ジャミング · C/N0 が下限付近

js-site-home-banner-spoofing = スプーフィング警報 · RF 検出器

js-site-home-cap-holdover = ジャマーが { $dbw } dBW に上がり、追尾衛星は { $trk } 機になります。クロックはスプーファーが残した { $carry } ns から自由走行し、{ $at } に { $guard } ns のガードを超えます。INS は惰行します。

js-site-home-cap-integrity = 衛星は復帰しますが、{ $mask }° のマスクより上のみで、追尾は { $trk } 機です。保護レベルが { $al } m のアラート限界を超えるか算出できないため、モニターが警報を出し、クロックはホールドオーバーのままです。

js-site-home-cap-jamming = { $km } km 離れた { $dbw } dBW の広帯域ジャマー。C/N0 は { $cn } dB-Hz まで低下し、{ $floor } dB-Hz の追尾下限を { $above } dB 上回ります。{ $trk } 機すべての衛星が引き続き追尾されます。

js-site-home-cap-nominal = 平均 C/N0 { $cn } dB-Hz で { $trk } 機の衛星を追尾しています。クロックは GNSS 時刻に同期しており、保護レベル（{ $pl } m）は { $al } m のアラート限界を下回っています。

js-site-home-cap-recovery = GNSS が再同期しました：{ $trk } 機の衛星を追尾、時刻誤差は { $te } ns に戻り、保護レベルは { $pl } m です。

js-site-home-cap-spoofing = スプーファーが受信機クロックを { $rate } ns/s で押し動かします。RF（無線周波数）検出器は即座に警報を出し、クロック支援モニターは { $det } s 後に作動して、{ $off } ns 引き込まれた状態でフェーズを終えます。

js-site-home-cn-no-lock = { $max } 機中 0 機を追尾 · ロックなし

js-site-home-cn-tracking = { $max } 機中 { $n } 機を追尾

js-site-home-no-pl = PL なし

js-site-home-pause = ミッションを一時停止

js-site-home-pl-alarm = 警報 · PL が AL を超過

js-site-home-pl-no-sats = 衛星なし、PL なし

js-site-home-pl-not-computed = このフェーズでは算出しません

js-site-home-pl-too-few = 衛星が少なすぎます

js-site-home-pl-under-al = { $thr } m の AL 未満

js-site-home-play = ミッションを再生

js-site-home-receiver-tracking = 受信機 · { $n } 機を追尾

js-site-home-replay-restarted = リプレイを再開しました · { $file }

js-site-home-te-disciplined = GNSS に同期

js-site-home-te-free-running = ホールドオーバー · 自由走行

js-site-home-te-outside-guard = ホールドオーバー · ガード外

js-site-home-te-spoofer = スプーファーがクロックを引っ張っています

js-site-home-thr-floor = 下限

js-site-home-thr-guard = ガード

js-site-kind-action = アクション

js-site-mcp-arguments-excerpt = 引数（抜粋）

js-site-mcp-axis-mission-time = ミッション時間

js-site-mcp-clock-holdover = { $clock }のホールドオーバー

js-site-mcp-dir-reply = kshana-mcp → アシスタント

js-site-mcp-dir-request = アシスタント → kshana-mcp

js-site-mcp-figcaption = 返された時系列から描画：各クロックの時刻誤差としきい値の比較

js-site-mcp-fom-availability = 可用性

js-site-mcp-fom-caption = run_scenario がクロックごとに返す性能指標

js-site-mcp-fom-header = 性能指標

js-site-mcp-fom-holdover = ホールドオーバー（s）

js-site-mcp-fom-p95 = 時刻誤差、95 パーセンタイル（ns）

js-site-mcp-fom-rms = 時刻誤差、二乗平均平方根（ns）

js-site-mcp-lede = 記録日時 { $recorded } · v{ $version } · 標準入出力 · プロトコル { $protocol } · 正確なメッセージのみ

js-site-mcp-legend-gnss-lost = { $s } s に GNSS 喪失

js-site-mcp-legend-threshold = しきい値 { $v } ns

js-site-mcp-pause = 一時停止

js-site-mcp-play = 再生

js-site-mcp-plot-aria = run_scenario が返した { $quantum } と { $classical } の時刻誤差と、{ $threshold } ns のしきい値の比較。GNSS（全球測位衛星システム）は { $lost } s に喪失

js-site-mcp-recorded-json = 記録された JSON：{ $label }

js-site-mcp-scenario-hash = シナリオのハッシュ

js-site-mcp-server-identity = サーバーの識別情報

js-site-mcp-show-json = JSON を表示

js-site-mcp-step-aria = ステップ { $n } / { $total }：{ $name }

js-site-mcp-step-result = 結果：性能指標

js-site-mcp-step-status = ステップ { $n } / { $total } · { $name }

js-site-mcp-summary-excerpt = サマリー行と結果（抜粋）

js-site-mcp-tab-result = 結果

js-site-mcp-threshold = しきい値

js-site-mcp-toml-lines =
    { $n ->
       *[other] { $n } 行
    }

js-site-mcp-toml-more = …（{ $file } の残り { $n } 行）

js-site-mcp-tool-count =
    { $n ->
       *[other] { $n } 個のツール
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
       *[other] 説明付きのツール { $n } 個
    }

js-site-menu-close = メニューを閉じる

js-site-menu-open = メニューを開く

js-site-missions-avail-title = 可用性：PDOP ≤ { $limit } だった実行の割合

js-site-missions-avail-uniform = すべてのセルで { $v } %

js-site-missions-chart-error-title = 位置誤差（m、対数）

js-site-missions-chart-four = 測位には四機が必要

js-site-missions-chart-four-short = 測位に四機

js-site-missions-chart-lg-earth = 地球が可視

js-site-missions-chart-lg-error-earth = 誤差、中継衛星と地球測距

js-site-missions-chart-lg-error-relays = 誤差、中継衛星のみ

js-site-missions-chart-lg-relays = 可視の中継衛星

js-site-missions-chart-relays-title = 可視の中継衛星 · 網掛け：地平線上の地球

js-site-missions-chip-at-pdop = PDOP ≤ { $limit } のとき

js-site-missions-chip-engine = エンジン：

js-site-missions-chip-fix-earth = 測位解、地球あり

js-site-missions-chip-median-pdop = PDOP の中央値

js-site-missions-chip-relays = 中継衛星

js-site-missions-chip-rms = RMS 誤差

js-site-missions-chip-satellites = 衛星

js-site-missions-chip-tracking-held = { $label }追尾維持

js-site-missions-clocks-aria = クロックのクラス別、ホールドオーバー一日後の時刻誤差（対数スケール）

js-site-missions-clocks-frame = フレーム下限 { $ns } ns

js-site-missions-clocks-note = 一日後の時刻誤差、秒（対数）

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }：一日後に { $ns } ns、σy(1 s) { $sigma }

js-site-missions-cone-aria = GNSS 喪失後の位置誤差コーン

js-site-missions-cone-axis-x = GNSS 喪失からの経過時間（s）

js-site-missions-cone-axis-y = 位置誤差（m）

js-site-missions-cone-budget = ±{ $m } m の許容値

js-site-missions-cone-clipped = ±{ $m } m で切り取り

js-site-missions-cone-leaves = { $s } s で逸脱

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = コマンドをコピー

js-site-missions-copy-title = 再現するコマンドをコピー

js-site-missions-deterministic = 決定論的

js-site-missions-engine-build = エンジン v{ $version }、ビルド

js-site-missions-engine-build-commit = エンジン v{ $version }、ビルド { $commit }

js-site-missions-fp-aria = ジャミング影響範囲マップ。矢印キーでセル間を移動し、Enter でその実行を開きます。

js-site-missions-fp-aria-svg = ジャマー周辺のジャミング影響範囲

js-site-missions-fp-darker = 濃いほど平均 J/S が高い · { $step } km セル · エンジン実行 { $n } 回

js-site-missions-fp-jammer = ジャマー

js-site-missions-fp-lg-held = 追尾維持

js-site-missions-fp-lg-lost = 全衛星を喪失

js-site-missions-fp-lg-some = 一部のエポックで喪失

js-site-missions-fp-open = この実行を{ $studio }で開く

js-site-missions-fp-read = ジャマーから約 { $km } km · 平均 J/S { $js } dB · 追尾の可用性 { $av }

js-site-missions-fp-ship = シナリオの船

js-site-missions-grades-aria = IMU グレード別、{ $a } m と { $b } m に達する前の自由慣性惰行

js-site-missions-grades-axis = GNSS 喪失後の惰行秒数（対数）

js-site-missions-grades-point = { $grade }：{ $m } m まで { $s } s（{ $why }）

js-site-missions-grades-reaches = 誤差が { $m } m に到達

js-site-missions-grades-speed = { $v } m/s で

js-site-missions-grades-this = このシナリオ

js-site-missions-hud-earth-link = 地球リンク

js-site-missions-hud-link-above = 地球リンク · 地平線上

js-site-missions-hud-link-occulted = 地球リンク · 掩蔽

js-site-missions-hud-orbiter = 周回機

js-site-missions-hud-receiver = 受信機

js-site-missions-hud-relays = 中継衛星

js-site-missions-hud-selected-lat = 選択した緯度

js-site-missions-info-in-view = 可視

js-site-missions-info-in-view-value = 平均 { $mean } · 最小 { $fewest }

js-site-missions-info-pdop-above = { $pdop }、{ $limit } 超

js-site-missions-json-title = エンジンの結果、無加工

js-site-missions-json-unavailable = JSON は利用できません

js-site-missions-key-avail = 可用性

js-site-missions-key-pdop-title = 平均 PDOP（位置の精度低下率）

js-site-missions-key-vis = 可視衛星

js-site-missions-key-vis-short = 可視

js-site-missions-leo-grid = グリッドのうち PDOP ≤ { $limit } の割合

js-site-missions-leo-in-view = 平均可視数

js-site-missions-leo-shells = 四つのシェルにある衛星

js-site-missions-map-aria = { $body }上の{ $title }、10 度セルごと。矢印キーで受信機を動かすと、そのセルが下に読み上げられます。

js-site-missions-map-colour-by = マップの色分け基準

js-site-missions-map-fewest-in-view = 最小可視数

js-site-missions-map-grey = グレー：測位解なし

js-site-missions-map-hatched = ハッチング：{ $limit } の PDOP 限界を超過

js-site-missions-map-in-view = 可視

js-site-missions-map-live = { $cell }：{ $rows }

js-site-missions-map-mean-in-view = 平均可視数

js-site-missions-map-mean-pdop = 平均 PDOP

js-site-missions-map-pdop-limit = PDOP 限界 { $limit }

js-site-missions-matrix-caption = 分野（行）と故障モード（列）別のシナリオファイル。件数を選ぶと、その分野を開きます。

js-site-missions-matrix-cell =
    { $n ->
       *[other] { $sector }、{ $mode }：シナリオファイル { $n } 件
    }

js-site-missions-matrix-files =
    { $n ->
       *[other] { $n } 件のファイル：
    }

js-site-missions-matrix-sector = 分野

js-site-missions-mode-int = 干渉

js-site-missions-mode-itg = インテグリティ

js-site-missions-mode-nav = 惰行

js-site-missions-mode-orb = ジオメトリ

js-site-missions-mode-spf = スプーフィング

js-site-missions-mode-tim = タイミング

js-site-missions-n-of-total = { $total } 中 { $n }

js-site-missions-no-fix = 測位解なし

js-site-missions-no-seed = 決定論的、シードなし

js-site-missions-open-in-studio = { $studio }で開く

js-site-missions-open-report = エンジンのレポートを開く

js-site-missions-ow-chart-aria = { $name }の実行全体にわたる受信機の応答：可視の中継衛星、および中継衛星のみの場合と地球測距を加えた場合の位置誤差

js-site-missions-ow-chip-epochs = エポック

js-site-missions-ow-chip-mask = マスク

js-site-missions-ow-chip-orbiter = 周回機

js-site-missions-ow-chip-range = 測距 σ

js-site-missions-ow-chip-relays = 中継衛星

js-site-missions-ow-chip-relays-value = { $planes } × { $per }、{ $alt } km、{ $inc }°

js-site-missions-ow-chip-span = 期間

js-site-missions-ow-count-relays = 中継衛星 { $n } 機と周回機 · { $body }

js-site-missions-ow-count-sats = 衛星 { $n } 機 · { $body }

js-site-missions-ow-engine = エンジン v{ $version } · ビルド { $commit }

js-site-missions-ow-lat-label = 受信機の緯度

js-site-missions-ow-map-aria = { $name }に対する受信機の応答：{ $body }の 10 度セルごとのマップと、その横に緯度別の可視衛星数の平均と最小、および平均 PDOP

js-site-missions-ow-note-imagery = { $body }の画像：NASA。

js-site-missions-ow-note-rebuilt = 軌道：中継衛星と周回機を、エンジンの構築方法どおりにシナリオから再構築しました。得られる可視衛星数は、全 { $n } エポックでエンジンの値と一致します。

js-site-missions-ow-note-sats = 軌道：実行の衛星をここで再伝搬し、エンジンが書き出した全 { $n } 個の地上軌跡サンプルと照合しました（最大 { $deg }°）。

js-site-missions-ow-note-scaled = 軌道半径は表示用に縮尺を変えています。軌道面、位相配置、周期は実行のものです。

js-site-missions-ow-note-tracks = エンジンは{ $total }機の衛星のうち{ $shown }機の地上軌跡を書き出しました。{ $total }機すべてをそのシェルから描画しています。

js-site-missions-ow-note-walker = 軌道：実行のウォーカー・シェルをここで再伝搬し、エンジンが書き出した全 { $n } 個の地上軌跡サンプルと照合しました（最大 { $deg }°）。

js-site-missions-ow-off = オフ

js-site-missions-ow-on = オン

js-site-missions-ow-pause = 軌道を一時停止

js-site-missions-ow-play = 軌道を再生

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = ミッション時間

js-site-missions-ow-valuetext = { $time }、可視の中継衛星 { $n } 機

js-site-missions-pdop-title = 平均 PDOP（位置の精度低下率）、対数スケール、小さいほど良好

js-site-missions-report = レポート

js-site-missions-report-title = この実行に関するエンジン自身のレポート

js-site-missions-ro-above-horizon = 地平線上

js-site-missions-ro-availability = 可用性、PDOP ≤ { $limit }

js-site-missions-ro-earth-light = 地球 · 光時間 { $s } s

js-site-missions-ro-error-relays = 位置誤差、中継衛星のみ

js-site-missions-ro-occulted = 掩蔽

js-site-missions-ro-place-availability = { $place }：可用性

js-site-missions-ro-place-in-view = { $place }：可視数、平均 · 最小

js-site-missions-ro-relays = 可視の中継衛星

js-site-missions-ro-satellites = 衛星

js-site-missions-ro-with-earth = 地球測距あり

js-site-missions-run-failed = 記録された実行をここで読み込めませんでした。下のリンクから{ $studio }で開いてください。

js-site-missions-seed = シード { $seed }

js-site-missions-spoof-aria = 時間に対するスプーフのオフセット、各モニターの検出境界と検出時刻

js-site-missions-spoof-axis-x = スプーフ開始からの経過時間（s）

js-site-missions-spoof-axis-y = 時刻オフセット（ns）

js-site-missions-spoof-detects = { $id } が { $s } s で検出

js-site-missions-spoof-lg-bound = { $id } の境界

js-site-missions-spoof-lg-offset = スプーフのオフセット

js-site-missions-spoof-readout = t { $t } s · オフセット { $offset } ns

js-site-missions-spoof-spec = 仕様 { $v } ns

js-site-missions-sr-aria = { $members }。共有ジャマー { $power } dBW

js-site-missions-sr-aria-member = { $label }：追尾維持 { $held } %、平均ジャマー対信号比 { $js } dB、追尾衛星数の最小 { $min }

js-site-missions-sr-car = 自動車

js-site-missions-sr-fewest = 追尾数の最小値

js-site-missions-sr-held = 追尾維持

js-site-missions-sr-mean-js = 平均 J/S

js-site-missions-sr-ship = 船

js-site-missions-swipe =
    { $n ->
       *[other] スワイプして全 { $n } 件のシナリオファイルを表示
    }

js-site-missions-toml-download-title = 実行されたシナリオファイルをダウンロード

js-site-missions-toml-title = 実行されたシナリオファイル

js-site-missions-vis-title = 可視衛星、実行全体の平均

js-site-missions-vis-uniform = すべてのセルで { $v }

js-site-palette-none = 結果なし

js-site-palette-results = { $count } 件の結果

js-site-pro-band-at = { $minutes } 分時点：5～95 パーセンタイル

js-site-pro-band-range = { $lo }～{ $hi } { $unit }

js-site-pro-band-runs-within = { $n } 回の実行のうち ±{ $limit } { $unit } 以内

js-site-pro-design-readout = 衛星 { $sat } 機、可用性 { $av } % · { $alt } km に { $planes } 軌道面、{ $incl }°

js-site-pro-front-design = フロント設計 { $id }

js-site-pro-front-design-knee = フロント設計 { $id } · 屈曲点

js-site-pro-more-designs =
    { $n ->
       *[other] （この点にフロント設計がほかに +{ $n } 件）
    }

js-site-pro-not-rerun = 再実行なし

js-site-pro-rerun-free = 無料エンジンで再実行：

js-site-pro-same-sha = 同じ SHA-256 { $sha }…

js-site-pro-same-sha-index = インデックスと同じ結果の SHA-256

js-site-toast-copied = コピーしました：{ $text }

js-site-toast-data-failed = データファイルを読み込めませんでした

js-site-toast-data-saved = データを CSV として保存しました

js-site-toast-no-data = このグラフにはデータがありません

js-site-toast-svg-saved = グラフを SVG として保存しました

js-site-toast-table-saved = 表を CSV として保存しました

js-site-waterfall-axis-now = 現在

js-site-waterfall-bar-title = { $band }：{ $cn0 } dB-Hz、{ $state }

js-site-waterfall-bar-title-js = { $band }：{ $cn0 } dB-Hz、{ $state }、J/S { $js } dB

js-site-waterfall-below-floor = 信号はノイズフロアより下にあります

js-site-waterfall-campaign-drives = 駆動するキャンペーン：

js-site-waterfall-campaign-seed = シード { $seed } · { $duration } s にわたる { $phases } フェーズ

js-site-waterfall-chip-aria = { $band }、{ $fc } メガヘルツ：このバンドを表示

js-site-waterfall-chip-title = { $band } · { $fc } MHz · 受信機帯域幅 { $bw } MHz

js-site-waterfall-engine-build = エンジン v{ $version } · ビルド

js-site-waterfall-fallback-head = Galileo へのフォールバック · { $s } s、CW トーンのみ

js-site-waterfall-fallback-text = { $band } が { $v } dB-Hz で復帰。Galileo のみでのインテグリティ監視：保護レベル { $min }–{ $max } m、アラート限界 { $limit } m 未満。

js-site-waterfall-floor = 追尾下限 { $thr } dB-Hz

js-site-waterfall-holdover-head = ホールドオーバー · { $s } s、チャープ有効

js-site-waterfall-holdover-text = { $band0 } { $v0 }、{ $band1 } { $v1 } dB-Hz、下限未満。クロックは自由走行：最悪 { $worst } ns、ガードは { $guard } ns。

js-site-waterfall-jammer-off = { $what }オフ

js-site-waterfall-jammer-on = { $what }オン

js-site-waterfall-live = { $freq } メガヘルツ、{ $time }：{ $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz、{ $state }

js-site-waterfall-live-none = モデル化されたバンドなし

js-site-waterfall-load-failed = 記録された実行を読み込めませんでした。下のエンジンのレポートが同じ実行を示しています。

js-site-waterfall-no-jammer-band = このバンドにジャマーはありません

js-site-waterfall-no-jammer-in-band = バンド内にジャマーなし

js-site-waterfall-no-seed = 決定論的、シードなし

js-site-waterfall-onset-head = 開始 · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = スペクトル実行が { $s } s に初めて { $band } を喪失するまで、全 { $n } バンドを追尾しています。

js-site-waterfall-pause = ウォーターフォールを一時停止

js-site-waterfall-play = ウォーターフォールを再生

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = 実行 T+{ $s } s

js-site-waterfall-scale-caption = { $floor } dBW/Hz の下限を上回る PSD · { $bin } MHz × { $step } s のセル

js-site-waterfall-seed = シード { $seed }

js-site-waterfall-short-lost = 喪失

js-site-waterfall-short-ok = 追尾

js-site-waterfall-short-rec = 復帰

js-site-waterfall-state-lost = ロック喪失

js-site-waterfall-state-lost-low = ロック喪失

js-site-waterfall-state-ok = 追尾中

js-site-waterfall-state-ok-low = 追尾中

js-site-waterfall-state-rec = 復帰

js-site-waterfall-state-rec-low = 復帰

js-site-waterfall-summary-recovers = { $band } は { $lost } s にロックを失い、{ $rec } s に復帰します。最低 { $min } dB-Hz。

js-site-waterfall-summary-rows = { $step } s の行が { $n } 行。

js-site-waterfall-summary-stays-lost = { $band } は { $lost } s にロックを失い、喪失したままです。最低 { $min } dB-Hz。

js-site-waterfall-summary-tracks = { $band } は全期間にわたり追尾します。最低 { $min } dB-Hz。

js-site-waterfall-tip-above-floor = ノイズフロアより上

js-site-waterfall-tip-at-floor = 熱雑音フロアにあります

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = この列をカバーする受信機帯域幅を持つモデル化バンドはありません

js-site-waterfall-wave-chirp = チャープ

js-site-waterfall-wave-cw = CW トーン

js-site-waterfall-wave-noise = ノイズ

js-site-waterfall-who-cursor = カーソル位置のバンド

js-site-waterfall-who-selected = 選択したバンド

js-site-waterfall-who-worst = 最悪のバンド
