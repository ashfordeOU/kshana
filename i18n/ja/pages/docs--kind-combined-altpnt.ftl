# docs--kind-combined-altpnt: translations (ja)

seg-a83b25413fd8 = ソース：<c1/>

seg-92b24377c9be = <c1/>（シナリオの種類）

seg-216efc4e6fba = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>GPSが使えない状況での代替PNT</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-f496b7f4c63a = GPSが使えない状況での、重力・磁気・地形を組み合わせた航法装置：三つのスカラー場チャンネルをウェイポイントごとに融合し、どの単一の場よりも鋭い（CRLBの低い）ドリフト補正を得ます。

seg-670730bd221e = <c1/>の一回の実行は、次のように要約されます：combined-altpnt | free-inertial drift { "70659" } m | gravity { "464" } m magnetic { "782" } m terrain { "368" } m | FUSED { "365" } m

seg-cf6981466329 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>

seg-078f09d100fa = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-557db767b9c3 = 例の<c1/>が設定している項目（一部）：

seg-df8d5e07e737 = mGal

seg-498b1aea3770 = scenarios/combined-altpnt.toml（種類combined-altpnt）についてエンジンが書き出すグラフ

seg-619127334cf3 = この種類を名前で挙げているマトリクスの行はありません。その結果のラベルは、上に示したエンジン自身のものです。

seg-0df60ac6343f = <b>MODELLED</b>重力マップマッチング、地形参照（TERCOM/SITAN）、磁気異常。オラクル（InternalConsistency）：IGRF-14の係数、第一原理による整合フィルターのCRLB。実場の重力ベンチマークの場は外部で確認されています（行「Gravity-anomaly synthesis from a spherical-harmonic model」）が、その航法結果には外部のオラクルがありません

seg-d776abd5691c = 代替・補完PNTはMODELLEDであり、独立した外部の参照との照合はされていません。自身の閉形式・解析的な恒等式に照らして確認しており、転記や係数の誤りは見つけられますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-98133e74f88a = ファミリーページ：<a1>GPSが使えない状況での代替PNT</a1>

seg-49efcd2ced81 = <s1>前へ</s1>clock

seg-f2ccea3bb03e = <s1>次へ</s1>conflict-resilience
