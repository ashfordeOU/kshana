# docs--kind-terrain-slam: translations (ja)

seg-bb7c9c4d4b5d = ソース：<c1/>

seg-562e59d703e3 = <c1/>（シナリオ種別）

seg-6bdc150ab25b = GPS が使えない環境での逐次（再帰）地形参照航法：パーティクルフィルタがエポックごとに地形照合の測定モデルを実行し（実行中のフィルタとしての SITAN）、軌跡に沿って時間変化する INS ドリフトを追跡します。バッチ方式の terrain-nav が復元できるのは、単一の一定オフセットだけです。

seg-1e4350c2c5f0 = <c1/> の一回の実行の要約：terrain-slam | { "60" } waypoints | free-inertial RMS { "2947" } m (final { "5082" } m) | terrain-matched RMS { "1241" } m (final { "69" } m, 2x cut) | mean ESS 2599/4000 | matching sigma { "17.0" } m

seg-939d877137f6 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>

seg-5ceb5b8597ac = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-48e022b0945e = 例 <c1/> では、とりわけ次を設定しています：

seg-4aca87f022dc = エンジンが scenarios/terrain-slam.toml（種別 terrain-slam）に対して出力するグラフ

seg-832919783819 = <s1>前へ</s1>terrain-nav

seg-1693abd546fe = <s1>次へ</s1>time-transfer-budget

seg-216efc4e6fba = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>GPSが使えない状況での代替PNT</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-619127334cf3 = この種類を名前で挙げているマトリクスの行はありません。その結果のラベルは、上に示したエンジン自身のものです。

seg-0df60ac6343f = <b>MODELLED</b>重力マップマッチング、地形参照（TERCOM/SITAN）、磁気異常。オラクル（InternalConsistency）：IGRF-14の係数、第一原理による整合フィルターのCRLB。実場の重力ベンチマークの場は外部で確認されています（行「Gravity-anomaly synthesis from a spherical-harmonic model」）が、その航法結果には外部のオラクルがありません

seg-d776abd5691c = 代替・補完PNTはMODELLEDであり、独立した外部の参照との照合はされていません。自身の閉形式・解析的な恒等式に照らして確認しており、転記や係数の誤りは見つけられますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-98133e74f88a = ファミリーページ：<a1>GPSが使えない状況での代替PNT</a1>
