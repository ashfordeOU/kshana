# benchmark: translations (ja)

seg-0c0ce6abb920 = 同じログ、同じルール。<s1>スコアは公開されています。</s1>

seg-cb2911864ea1 = kshana-bench は、GNSS 干渉検出とタイミングのホールドオーバーについて、タスク、分割、指標を固定したセットであり、異なる手法を同じデータで比較できるようにするものです。投稿はファイル一つであり、投稿者に代わって何かが実行されることはありません。ベースラインはエンジン自身のモニターであり、合格基準は最初のスコア付き実行より前に書き残されています。

seg-11b19c2fd000 = ボードを見る

seg-b77706a0b8b5 = 仕様を読む

seg-63a783e8fa0b = リーダーボード

seg-556a1861ad9c = ボード

seg-64052578c384 = エンジンがスコア付けした結果ファイル。

seg-0ac1117a39b8 = kshana-bench リーダーボード

seg-b71ad83b27ad = <c1/> のもとでスコア付けされた結果ファイル。一行は、このファイルがこの分割でこの数値を記録したことを示します。いかなる製品も誰かによって格付けまたは承認されたことを意味せず、推奨者として名前が挙がる組織もありません。

seg-6a2052a10b6e = 助言のみ：示された参照に対してモデル計算または測定したものであり、承認、認証、適合の表明ではありません。スコアが表すのはログまたはコーパスであり、製品ではありません。

seg-2918ee229bdd = タスク (a)：受信機ログでの検出

seg-7f2573819278 = タスク (a)：受信機ログでの検出 dev の結果

seg-082f44ff5710 = 分割：dev

seg-46c7e6f003dd = システム

seg-5aa5efd6b7da = AUC

seg-dc9137d28ced = P_fa 上限での P_d（上界）

seg-75ada2743d1d = 真値 SHA-256

seg-e77eb0d4b34b = kshana receiver-trust agc_k_sigma（{ "0.35" } デフォルトのモニター統計量）<s1>kshana-bench/2.0.0</s1>

seg-c9d7efecc1d9 = スコア付け済み

seg-b47a5173a65c = kshana receiver-trust cn0_drop_db（{ "0.35" } デフォルトのモニター統計量）<s1>kshana-bench/2.0.0</s1>

seg-8b5d25c24aee = kshana receiver-trust jam_ind_threshold（{ "0.35" } デフォルトのモニター統計量）<s1>kshana-bench/2.0.0</s1>

seg-9c794cbe6919 = タスク (a)：受信機ログでの検出 holdout の結果

seg-bf455fb5bda5 = 分割：holdout

seg-d69e976e0fa9 = タスク (a)：受信機ログでの検出 test の結果

seg-c163c8084e23 = 分割：test

seg-4c475a58619d = タスク (b)：IQ での検出

seg-26740783c99e = タスク (b)：IQ での検出 test の結果

seg-6f1b3b3729bf = kshana iq モニター：cn0_drop (CUSUM) <s1>kshana-bench/2.0.0</s1>

seg-7e2dd8e3fb49 = 引き継ぎ：docs/design/DETECTION-ROC.md の第{ "3" }節、tests/iq_campaign_roc.rs の R1 キャンペーン、2026-10-13 に実行。bench v1 では再実行していません。基準 R1（AUC >= { "0.95" }）は NOT MET でした。

seg-e7c2cfbb1e8c = タスク (c)：タイミングのホールドオーバー予測

seg-9198e0e61f53 = タスク (c)：タイミングのホールドオーバー予測 dev の結果

seg-46487e0c8856 = RMSE { "3600" } s (ns)

seg-6c032477c78f = RMSE { "300" } s (ns)

seg-780fda205195 = RMSE { "7200" } s (ns)

seg-2246c31f1782 = kshana-bench ベースライン：線形 <s1>kshana-bench/2.0.0</s1>

seg-af33c581ac95 = kshana-bench ベースライン：二次 <s1>kshana-bench/2.0.0</s1>

seg-d8bb527fe5be = kshana-bench ベースライン：保持 <s1>kshana-bench/2.0.0</s1>

seg-18fd676cd356 = タスク (c)：タイミングのホールドオーバー予測 test の結果

seg-ca13357b9f63 = タスク (d)：分布外の楽観ギャップ

seg-dbbcfa3baaf4 = タスク (d)：分布外の楽観ギャップ dev の結果

seg-b022faebf582 = 分布内の AUC

seg-824b2aff7e8d = 分布外の AUC

seg-835f66c4ee63 = 楽観ギャップ

seg-fea8fb19c38c = フラグ

seg-698f3f00492d = impairment-eval ベースライン：fused(max-z) <s1>kshana-bench/2.0.0</s1>

seg-6320a9edbdca = 許容差内

seg-aa7cda114a64 = impairment-eval ベースライン：sqm-imbalance <s1>kshana-bench/2.0.0</s1>

seg-c272e7fd6a7f = impairment-eval ベースライン：agc-excess <s1>kshana-bench/2.0.0</s1>

seg-02fb2080da2e = impairment-eval ベースライン：raim-parity <s1>kshana-bench/2.0.0</s1>

seg-00c8aea0d4fe = impairment-eval ベースライン：energy(cn0-drop) <s1>kshana-bench/2.0.0</s1>

seg-ee090c2f6612 = タスク (d)：分布外の楽観ギャップ test の結果

seg-88c3cc6c3800 = 行に外部オラクルが一致したと明記されていない限り、すべてのスコアはモデル計算によるものです。仕様とマニフェストのライセンス：CC-BY-4.0 / CC0 を提案中であり、所有者の決定待ちです。実データのホールドアウトは秘密ではありません。仕様の第{ "4" }節を参照してください。

seg-68e7ed4fc6ee = 行に記載してよい内容

seg-7912ad415e48 = 行の意味

seg-7b6aa7dbc2e4 = スコアが表すのはログであり、製品ではありません。

seg-69cc3c1470b3 = 一行が示すのは、このファイルが仕様バージョン V のもとで分割 S において X をスコアしたということです。製品が認証済み、適合、承認済み、推奨されていることを示すものではなく、推奨者として名前が挙がる組織もありません。

seg-dd289a4fc50a = データは記録されたものか合成されたもので、仕様に明記されています。第三者のデータがリポジトリにコピーされることはありません。マニフェストと取得スクリプトが各ファイルを SHA-256 で固定し、データを使用する前に各ライセンスを記録します。

seg-d48b2ec4cbe8 = 記録されたログの真値は、実際の放送時刻の記録ではなく、試験計画で予定されたスロットです。そのため、検出確率は下限値です。仕様は各タスクの横にその旨を記しています。

seg-6883a66f3bdd = 封印されたホールドアウトは、リーダーボードのラウンドでのみスコア付けされ、そのシードはラウンド後に公開されます。数値を主張するベースラインの合格基準は、スコア付き実行の前に確定され、その後に緩められることはありません。未達は NOT MET として記録されます。

seg-97d14f361df5 = 結果ファイルに記録された判定：スコアラーの合格基準、C1 から C3、および D2 は満たしています。A2 は NOT MET（test 分割で agc_k_sigma の AUC が { "0.766" }、基準は { "0.80" } 以上）、D1 は NOT MET（最大ギャップ { "0.0301" }）、タスク (b) の R1 は NOT MET（引き継ぎであり、再実行していません）です。合格基準は緩められていません。

seg-23023a10ef10 = 助言のみ：Kshana の結果は、示された参照に対してモデル計算または測定したものであり、承認や適合の表明ではありません。

seg-b30115d8c2eb = ご自身で実行できます。<c1/> は提出物と分割の真値から結果ファイルを作成し、<c2/> は結果ファイルをこのページに描画します。
