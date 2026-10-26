# docs--kind-pvt: translations (ja)

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry と check：エンジン自身の反復最小二乗測位解（pvt::solve_spp、単位重み、真の位置から解く）に対する、シード付きモンテカルロ（ジオメトリごとに N = { "20,000" } エポック、sigma = { "1.5" } m、ChaCha8 のシード { "36" } + i）について。テスト：<a1>uere_dop_monte_carlo.rs</a1>。

seg-aab2f85048b7 = ソース：<c1/>

seg-56f864d32367 = <c1/>（シナリオの種類）

seg-b7b67e03f125 = 実観測による単独測位：RINEX { "3" } の観測ファイルと放送航法ファイル（コード疑似距離、放送エフェメリス、Klobuchar 電離層、Saastamoinen/Niell 対流圏）から受信機の位置を解き、必要に応じて測量済みの座標と照合して確認します。

seg-79d2a463393d = <c1/> の一回の実行の要約は次のとおりです：pvt 55bdd18628e1 | 航法衛星 { "11" } 機 | 2/3 エポックを解いた | 平均 { "9.0" } 機、PDOP { "1.8" } | 3D 誤差 RMS { "5.74" } m（最大 { "7.12" } m）

seg-fd22bc5c2b67 = 必須フィールド：<c1/>、<c2/>

seg-4b39ee73d65d = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>

seg-4f02bdcbc7c7 = 例の <c1/> では、とりわけ次を設定しています：

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = エンジンが scenarios/pvt-abmf.toml（種類 pvt）に対して出力するグラフ

seg-e6f678eeb384 = <b>MODELLED</b> 精密単独測位の構成における、発散しない Hatch フィルター（電離層フリーの搬送波で補正した電離層フリーのコード、ウィンドウ N エポック、ロックロス・ジオメトリフリーのジャンプ・欠測での再起動）

seg-5a42823318a8 = <b>VALIDATED</b> 解析した RINEX-3 航法レコードから求める、IS-GPS-200 / Galileo-OS / BeiDou-OS の放送エフェメリスのケプラー要素から ECEF 衛星位置への変換。オラクル（ExternalDataset）：C ソースからコンパイルした RTKLIB v2.4.2-p13 の eph2pos()（T. Takasu、BSD-2-Clause）— 独立した IS-GPS-200/SIS-ICD の実装に、同一の RINEX-3 航法レコードを入力。衛星の ECEF 位置は約 { "62" } nm まで一致。（SP3 精密エフェメリスの補間は別途確認しています — 「SP3 精密エフェメリスの補間」を参照）

seg-51cac2f918e0 = トピックページ：<a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>前へ</s1>passes

seg-d1dc82bbfb73 = <s1>次へ</s1>quantum-anomaly-detect

seg-debc2f07db78 = true

seg-8e845ce908ee = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>GNSSの測定、測位、インテグリティ</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-f6b7ca020692 = ファミリーページ：<a1>GNSSの測定、測位、インテグリティ</a1>

seg-f4cf8b629797 = トピックページ：<a1>INTEGRITY.md</a1>
