# docs--kind-acm-link: translations (ja)

seg-a686bcdc6cc9 = ソース：<c1/>

seg-a53e57719a74 = <c1/>（シナリオの種類）

seg-99ef7c1d552c = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>ミッション解析、リンク、宇宙運用</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-cb9447893c7f = 一機の衛星と 一つの地上局：各パスの斜距離、仰角、パス沿いのEs/N0、各ステップで選ばれるDVB-S2のMODCOD（ETSI EN { "302" } 307-1 Table { "13" }のしきい値に実装マージンを加えたもの）、およびマスクで閉じる一定符号化のベースラインに対してACMが運ぶデータ量。MODELLED。

seg-1ab30ff9616a = <c1/>の 一回の実行は、次のように要約されます：acm-link: { "3" } pass(es); ACM { "92866" } Mbit vs CCM 8PSK 3/4 { "58495" } Mbit -> gain x1.59 (MODELLED)

seg-54e2159e532d = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-c7d1b4b1f247 = 例の<c1/>が設定している項目（一部）：

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-b77b8420b4f5 = Mbit

seg-37d29d8303fe = km

seg-eeaa777e4301 = 8PSK 3/4

seg-d62795b9fdc0 = 結果ラベル（エンジンによるもの）：MODELLED — 一つの地上局における一機の衛星のパスにわたるDVB-S2適応符号化変調：各見かけのパス沿いの晴天時Es/N0、ETSI EN { "302" } 307-1 Table { "13" }のしきい値にマージンを加えたものを満たす最も効率的なMODCOD、およびマスクで閉じる一定符号化のMODCODとの比較。降雨フェードなし、指向損失なし

seg-046f69293874 = scenarios/acm-link.toml（種類acm-link）についてエンジンが書き出すグラフ

seg-0f4c2ab525ac = <b>MODELLED</b>一つの地上局における一機の衛星の各パス沿いのダウンリンクEs/N0（EIRP、自由空間損失、コセカント則の大気損失、その他の損失、G/T、ボルツマン定数、シンボルレート）、最も効率的なDVB-S2のMODCODで、そのしきい値がETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b>検証済みの地球軌道経路上での、WGS-84地上局に対するSGP4要素セットの可視パス（AOS、TCA、LOS、最大見かけ仰角、継続時間）（IAU { "2006" }。オラクル（ExternalDataset）：Orekit { "13.1.8" }（CS GROUP、Apache-2.0）とHipparchus { "4.0.3" }：同じ要素セットに対するTLEPropagatorを、Orekitが定義どおりに構築するTEME（そのIERS { "2010" } TODをGAST - GMSTで回転したもの）で実行し、ITURP834AtmosphericRefractionあり・なしのElevationDetectorとElevationExtremumDetector、光行時間の場合はAngularRadioRefractionModifier付きのAngularAzElを使い、交差と最大値はHipparchusが解きます。{ "60" }ケース（f

seg-35588ca8e9bb = <b>MODELLED</b>一つの地上局における一機の衛星の各パス沿いのダウンリンクEs/N0（EIRP、自由空間損失、コセカント則の大気損失、その他の損失、G/T、ボルツマン定数。オラクル（InternalConsistency）：内部整合性：Table 5aのK_bchとフレーム長から閉形式で計算したスペクトル効率は、Table { "13" }に記載された効率と一致します（しきい値テーブルの転記チェック）。リンクバジェットの各要素は閉形式と一致します。選択はEs/N0に対して単調で、マージンを守ります。ACMは少なくとも一定符号化のデータ量を運びます。パスの幾何は、別個にVALIDATEDとされたa

seg-02e9f2e87410 = MODELLED — 一つの地上局における一機の衛星のパスにわたるDVB-S2適応符号化変調：各見かけのパス沿いの晴天時Es/N0、ETSI EN { "302" } 307-1 Table { "13" }のしきい値にマージンを加えたものを満たす最も効率的なMODCOD、およびマスクで閉じる一定符号化のMODCODとの比較。降雨フェードなし、パス沿いの指向損失なし（結果<c1/>）

seg-cd04f5662884 = MODELLED。（種類カタログ（<c1/>））

seg-a2cdc7dff1e3 = 以下の数値はすべてILLUSTRATIVEです：特定の運用者の軌道、地上局、リンクバジェットではありません。MODELLED。（シナリオファイルのコメント、{ "8" }行目）

seg-7f8667e8d8fe = LEOダウンリンクパスに沿ったDVB-S2適応符号化変調はMODELLEDであり、独立した外部の参照との照合はされていません。自身の閉形式・解析的な恒等式に照らして確認しており、転記や係数の誤りは見つけられますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-8f1e7d3f5a07 = ファミリーページ：<a1>ミッション解析、リンク、宇宙運用</a1>

seg-72fd0321e4af = トピックページ：<a1>CONTACT-SCHEDULING.md</a1>

seg-1f67ae89028b = <s1>次へ</s1>aocs
