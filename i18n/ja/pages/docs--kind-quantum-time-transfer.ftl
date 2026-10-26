# docs--kind-quantum-time-transfer: translations (ja)

seg-f42465f7d066 = ns

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> 再現可能な TradeEvidence オブジェクト一つ（固定フレーム：シナリオ＋シード＋エンジン。極性を正しく扱った利益を伴う、性能指標ごとの共通の量子対古典の値、任意の { "95" }%。オラクル（InternalConsistency）：閉形式の利益・勝者の恒等式と、既存の quantum_trade::TradeResult の忠実なラップ。正直さは代表性台帳と検証ラベルに結び付けています

seg-eb75c6a4dcec = 量子と古典のトレード証拠（共通の形式）は MODELLED であり、独立した外部の参照との照合による確認は行っていません。これは自身の閉形式・解析的な恒等式に照らして確認したものであり、転記や係数の誤りは検出できますが、外部のオラクルではありません。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-eee91dc5741d = ソース：<c1/>

seg-05060df7f0b7 = <c1/>（シナリオの種類）

seg-540545e6f846 = MODELLED の信頼できる量子タイミングチェーン：エンドツーエンドの量子（光格子時計＋もつれ/単一光子リンク）と古典（CSAC＋RF 双方向）の時刻比較バジェット、再利用したタイミング保護レベルと遅延・リプレイ攻撃のセキュリティ性能指標（1-P_md）、時計異常の検出確率と CUSUM の遅延、そして量子と古典のトレードを、代表性と飛行に至るまでのギャップの記録とともに正直な TradeEvidence として示します。デバイス/リンクのパラメーターは公開情報に基づく例示用で、このクラスをモデル化したものであり、TRL・飛行実績・認証は主張しません。

seg-ed79bfe80fe7 = <c1/> の一回の実行の要約は次のとおりです：quantum-time-transfer | 量子チェーン 1.233e-12s 対 古典 5.292e-9s | PL { "555.24" } ns | セキュリティ Pd { "1.000" }（Pfa { "1e-3" }） | 異常 Pd { "0.761" } | トレードは量子が 2/2 で優位 | MODELLED

seg-80e94491c3df = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-6b03fa15a60d = 例の <c1/> では、とりわけ次を設定しています：

seg-09760f892c7b = エンジンが scenarios/quantum-time-transfer.toml（種類 quantum-time-transfer）に対して出力するグラフ

seg-873de4d05663 = <b>VALIDATED</b> 表形式 CUSUM 検出器の最悪時の検出遅延（⌊h/(z−k)⌋+{ "1" }）と管理外れの平均ラン長。タイミング保護レベルとスプーフィング監視で使用。オラクル（ExternalDataset）：公表された表形式 CUSUM の ARL：Siegmund（{ "1985" }）のブラウン運動近似（Hawkins & Olwell { "1998" }、式 { "3.7" }）を、Montgomery、Introduction to Statistical Quality Control（Wiley）の ARL 表（k=½、h∈{ "{" }{ "4,5" }{ "}" }）と相互に照合。決定論的な遅延は初通過のオラクルと完全に一致。合成した TPL の限界は MODELLED のまま

seg-b51e62b8dc63 = MODELLED の信頼できる量子タイミングチェーン：エンドツーエンドの量子（光格子時計＋もつれ/単一光子リンク）と古典（CSAC＋RF 双方向）の時刻比較バジェット、再利用したタイミング保護レベルと遅延・リプレイ攻撃のセキュリティ性能指標（1-P_md）、時計異常の検出確率と CUSUM の遅延、そして量子と古典のトレードを、代表性と飛行に至るまでのギャップの記録とともに正直な TradeEvidence として示します。 (kind catalogue (<c1/>))

seg-dee0faf63e7f = 信頼できる量子タイミング — エンドツーエンドの時刻比較チェーン、安全な配信、異常検出、量子と古典のトレード。MODELLED。例示用の公開情報に基づくデバイス/リンクのパラメーター。このクラスをモデル化したものであり、TRL・飛行実績の主張はありません。 (scenario file comment, lines { "1" } to { "3" })

seg-6e9f5dfca6b0 = 信頼できる量子タイミング（時刻比較、安全な配信、異常）は MODELLED であり、独立した外部の参照との照合による確認は行っていません。これは自身の閉形式・解析的な恒等式に照らして確認したものであり、転記や係数の誤りは検出できますが、外部のオラクルではありません。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-d3665be74ff1 = <s1>前へ</s1>quantum-gnss-free-nav

seg-0d4b1f97541f = <s1>次へ</s1>quantum-trade

seg-a3697ad561db = Hz

seg-496b17a8d3b9 = トピックページ：<a1>QUANTUM-MODELS.md</a1>

seg-a1810bbca337 = <b>MODELLED</b> 双方向／TWSTFT（Sagnac）、GNSS コモンビュー、PPP；リンクジッター→距離。オラクル（ExternalDataset）：Sagnac の大きさは、権威ある公表値と照合しました — N. Ashby、'Relativity in the GPS'、Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }）、式{ "1.29" }：東向きの赤道周回では{ "207.4" } ns が蓄積されます（2ωA_E/c²）；kshana は{ "207.386" } ns を再現します。同じ 2Aω/c² の幾何を持つ RTKLIB { "2.4.3" } の geodist()（Takasu、BSD-2-Clause）によっても独立に裏付けられています。複合の BIPM TWSTFT トランスポンダー／コモンビュー／

seg-a8beb8dfc757 = 時刻比較の誤差バジェット設定は MODELLED であり、独立した外部の参照と照合して確認されてはいません：副次的な主張は外部で検証されていますが、機能全体はモデルから計算した部品を組み合わせているため、この機能はモデルから計算した状態のままです。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-bb07c8ee153f = <b>PARTNER</b> 提供しません — 性能モデルのみ；冷却原子／時計のハードウェアはパートナーのものです。オラクル（NoneKind）：なし：パートナーが所管する分野であり、設計上モジュールもテストもありません
