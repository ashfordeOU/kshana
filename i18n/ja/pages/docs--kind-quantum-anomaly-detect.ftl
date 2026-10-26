# docs--kind-quantum-anomaly-detect: translations (ja)

seg-29e58493fdd4 = モデル計算

seg-836d5102f0d1 = ソース：<c1/>

seg-ad4ce0110e8d = <c1/>（シナリオの種類）

seg-04310cd6cbec = 量子PNTシステムのための MODELLED の故障・異常検出：ラベル付きの故障カタログ（時計の周波数ジャンプ/ドリフト/ロック喪失、センサーのバイアスステップ/ドロップアウト）、検出統計量の ROC AUC（外部で確認済みの eval_stats によるブートストラップ信頼区間付き）、固定の誤警報率での最小検出可能故障を扱い、量子時計支援モニター（低ノイズ）がより小さな故障を検出することを、正直な TradeEvidence と代表性として示します。ガウス型の検出統計量モデル（AUC = Phi(mu/(sigma*sqrt2))）。このクラスをモデル化し、パラメーターは公開情報に基づく例示用で、TRL・飛行実績・認証はありません。

seg-442310afbb13 = <c1/> の一回の実行の要約は次のとおりです：quantum-anomaly-detect | AUC 量子 { "0.9908" } 対 古典 { "0.7603" } | 最小検出可能故障 量子 { "1.312" } 対 古典 { "4.372" } | 故障クラス { "5" } 種 | トレードは量子が 2/2 で優位 | MODELLED

seg-335b8d87e27d = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-c2b10c0bdaf8 = 例の <c1/> では、とりわけ次を設定しています：

seg-f44afe581836 = { $version }

seg-25da07e56aa8 = 量子と古典の PNT 異常検出

seg-2f1d14239d1a = エンジンが scenarios/quantum-anomaly-detect.toml（種類 quantum-anomaly-detect）に対して出力するグラフ

seg-af9aaf95d4f8 = <b>VALIDATED</b> 解析的な二正規 ROC AUC = Φ(μ/(σ√{ "2" })) と、量子故障・異常検出器の基礎となる最小検出可能故障 σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d))。オラクル（ExternalDataset）：scipy { "1.17" }（Cephes ndtr/ndtri）と scikit-learn roc_auc_score（Pedregosa ら、JMLR { "2011" }）、どちらも BSD-3-Clause — 一意に定義されたガウス裾・AUC の量を計算する独立したライブラリで、A&S の erf フロア（約 { "7e-8" }）まで一致。その上に構築した量子対古典の優位性は MODELLED のまま

seg-c37642bb24fe = <b>MODELLED</b> 再現可能な TradeEvidence オブジェクト一つ（固定フレーム：シナリオ＋シード＋エンジン。極性を正しく扱った利益を伴う、性能指標ごとの共通の量子対古典の値、任意の { "95" }%。オラクル（InternalConsistency）：閉形式の利益・勝者の恒等式と、既存の quantum_trade::TradeResult の忠実なラップ。正直さは代表性台帳と検証ラベルに結び付けています

seg-b854cedc8a51 = <b>MODELLED</b> ラベル付きの量子故障カタログ（時計の周波数ジャンプ/ドリフト/ロック喪失、センサーのバイアスステップ/ドロップアウト）、ブートストラップ信頼区間付きの検出統計量の ROC AUC、最小。オラクル（InternalConsistency）：閉形式のガウス AUC = Phi(mu/(sigma*sqrt2)) を、外部で確認済みの eval_stats::bootstrap_auc_ci（scikit-learn との比較）および検出の解析的しきい値と相互確認

seg-7b465c2bb7cf = 量子PNTシステムのための MODELLED の故障・異常検出：ラベル付きの故障カタログ（時計の周波数ジャンプ/ドリフト/ロック喪失、センサーのバイアスステップ/ドロップアウト）、検出統計量の ROC AUC（外部で確認済みの eval_stats によるブートストラップ信頼区間付き）、固定の誤警報率での最小検出可能故障を扱い、量子時計支援モニター（低ノイズ）がより小さな故障を検出することを、正直な TradeEvidence と代表性として示します (kind catalogue (<c1/>))

seg-7f43972b246d = 量子PNTシステムの故障・異常検出 — ラベル付きの故障カタログ、ROC AUC、最小検出可能故障、量子時計支援モニターと古典モニターの比較。MODELLED。例示用の公開情報に基づくパラメーター。このクラスをモデル化したものであり、TRL・飛行実績の主張はありません。 (scenario file comment, lines { "1" } to { "3" })

seg-eb75c6a4dcec = 量子と古典のトレード証拠（共通の形式）は MODELLED であり、独立した外部の参照との照合による確認は行っていません。これは自身の閉形式・解析的な恒等式に照らして確認したものであり、転記や係数の誤りは検出できますが、外部のオラクルではありません。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-3f92aec2b92a = 量子PNTシステムの故障・異常検出は MODELLED であり、独立した外部の参照との照合による確認は行っていません。これは自身の閉形式・解析的な恒等式に照らして確認したものであり、転記や係数の誤りは検出できますが、外部のオラクルではありません。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-6524a69e4835 = <s1>前へ</s1>pvt

seg-aa689568cf84 = <s1>次へ</s1>quantum-gnss-free-nav

seg-7b2721b7588d = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>慣性・フュージョン・量子センサー</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-f7f12029e0ec = ファミリーページ：<a1>慣性・フュージョン・量子センサー</a1>

seg-496b17a8d3b9 = トピックページ：<a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> 提供しません — 性能モデルのみ；冷却原子／時計のハードウェアはパートナーのものです。オラクル（NoneKind）：なし：パートナーが所管する分野であり、設計上モジュールもテストもありません
