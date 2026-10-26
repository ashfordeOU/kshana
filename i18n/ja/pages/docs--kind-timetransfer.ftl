# docs--kind-timetransfer: translations (ja)

seg-2ccebbc74d9f = ソース：<c1/>

seg-289a9f8dc990 = <c1/>（シナリオ種別）

seg-ccb244e60d60 = 光と RF による双方向の時刻・周波数伝送。

seg-59347fda6c66 = <c1/> の一回の実行の要約：scenario 8f9c2e0e31a5 | optical sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

seg-890040dd3d96 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-7b887ea27a86 = 例 <c1/> では、とりわけ次を設定しています：

seg-2485eaa6dbf4 = 双方向衛星時刻・周波数伝送（TWSTFT、Ku バ

seg-fa54f1a81b57 = 光衛星間リンク、ピコ秒レベルの同期

seg-a30fe2b87ee2 = mm

seg-bd76bd68eab3 = エンジンが scenarios/timetransfer.toml（種別 timetransfer）に対して出力するグラフ

seg-3c9d28692f9f = <b>MODELLED</b> 双方向/TWSTFT（Sagnac）、GNSS コモンビュー、PPP；リンクジッターから距離への換算 テスト：<a1>time_transfer_error_budgeting_reference.rs</a1>。

seg-84fcf20588fb = <s1>前へ</s1>time-transfer-budget

seg-149ad280a1f9 = <s1>次へ</s1>tracking-loop

seg-37a77f49f048 = ps

seg-5a70fcb097dc = 任意フィールド：なし

seg-a1810bbca337 = <b>MODELLED</b> 双方向／TWSTFT（Sagnac）、GNSS コモンビュー、PPP；リンクジッター→距離。オラクル（ExternalDataset）：Sagnac の大きさは、権威ある公表値と照合しました — N. Ashby、'Relativity in the GPS'、Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }）、式{ "1.29" }：東向きの赤道周回では{ "207.4" } ns が蓄積されます（2ωA_E/c²）；kshana は{ "207.386" } ns を再現します。同じ 2Aω/c² の幾何を持つ RTKLIB { "2.4.3" } の geodist()（Takasu、BSD-2-Clause）によっても独立に裏付けられています。複合の BIPM TWSTFT トランスポンダー／コモンビュー／

seg-a8beb8dfc757 = 時刻比較の誤差バジェット設定は MODELLED であり、独立した外部の参照と照合して確認されてはいません：副次的な主張は外部で検証されていますが、機能全体はモデルから計算した部品を組み合わせているため、この機能はモデルから計算した状態のままです。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-c61e88721556 = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>時計、タイミング、ホールドオーバー</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-849c08d3ce70 = ファミリーページ：<a1>時計、タイミング、ホールドオーバー</a1>
