# docs--kind-terrain-nav: translations (ja)

seg-1d36a7dc3fd0 = ソース：<c1/>

seg-7bfd6d049799 = <c1/>（シナリオ種別）

seg-0d7bf5a4f07e = GPS が使えない環境での地形参照航法（TERCOM/SITAN）：電波高度計・気圧高度計の地表標高プロファイルを SRTM 方式の DEM と照合し、INS のドリフトを復元します。

seg-54690375328b = <c1/> の一回の実行の要約：terrain-nav | free-inertial drift { "70659" } m | terrain-matched { "53" } m (1342x cut) | matching sigma { "17.0" } m

seg-db286a072e43 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>

seg-efc57f43bd6f = 任意フィールド：<c1/>、<c2/>、<c3/>

seg-96e3607379e0 = 例 <c1/> では、とりわけ次を設定しています：

seg-c5e33c7122e2 = エンジンが scenarios/terrain-nav.toml（種別 terrain-nav）に対して出力するグラフ

seg-0fcad0016c78 = <s1>前へ</s1>telecom-timing

seg-fa50992f818f = <s1>次へ</s1>terrain-slam

seg-216efc4e6fba = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>GPSが使えない状況での代替PNT</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-619127334cf3 = この種類を名前で挙げているマトリクスの行はありません。その結果のラベルは、上に示したエンジン自身のものです。

seg-0df60ac6343f = <b>MODELLED</b>重力マップマッチング、地形参照（TERCOM/SITAN）、磁気異常。オラクル（InternalConsistency）：IGRF-14の係数、第一原理による整合フィルターのCRLB。実場の重力ベンチマークの場は外部で確認されています（行「Gravity-anomaly synthesis from a spherical-harmonic model」）が、その航法結果には外部のオラクルがありません

seg-d776abd5691c = 代替・補完PNTはMODELLEDであり、独立した外部の参照との照合はされていません。自身の閉形式・解析的な恒等式に照らして確認しており、転記や係数の誤りは見つけられますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-98133e74f88a = ファミリーページ：<a1>GPSが使えない状況での代替PNT</a1>

seg-e66e2ca31e54 = トピックページ：<a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> <c1/> の種別とフェーズ：動力降下にわたる、水平軸ごとの五状態の慣性誤差モデル（位置、速度、加速度計バイアス、傾き、ジャイロバイアス）を、AFS フィックス（単独、または差分で、時計補助付きの三中継衛星
