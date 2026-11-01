# docs--kind-oem-interop: translations (ja)

seg-4abcbdaddcf8 = ソース：<c1/>

seg-a92dcafd670e = <c1/>（シナリオの種類）

seg-dbffff25b57f = CCSDS OEM 相互運用ブリッジ：外部の飛行力学ツール（GMAT/Orekit/STK はいずれも OEM を出力します）が生成した Orbit Ephemeris Message を取り込み、そのセグメント、オブジェクト、座標系、エポック範囲と、速度の整合性チェックを報告します。入力がない場合は、生成した基準軌道を往復変換し、取り込みと書き出しの忠実度を報告します。MODELLED の構造的・物理的な取り込みチェックであり、元データの軌道精度の確認では「ありません」。

seg-21eb1c9d7571 = <c1/> の一回の実行の要約は次のとおりです：oem-interop：{ "2" } セグメントを往復変換、{ "12" } 状態、往復の最大誤差 { "4.88e-7" } km / { "4.61e-10" } km/s（MODELLED の相互運用）

seg-54c35d9fbfd9 = 任意のフィールド：<c1/>

seg-d4117f615cd8 = 例の <c1/> では、とりわけ次を設定しています：

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = 結果ラベル（エンジンによるもの）：MODELLED — CCSDS OEM の取り込み・往復の相互運用ブリッジ（GMAT/Orekit/STK は OEM を出力）。構造的・物理的な取り込みチェックであり、元データの軌道精度の確認ではありません

seg-5db5a7c812ca = エンジンが scenarios/oem-interop.toml（種類 oem-interop）に対して出力するグラフ

seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS { "502.0" } OEM インポーター（parse_oem）。COMMENT 行、追加のメタデータキーワード、共分散ブロックを許容し、ライターの厳密な逆変換です。往復変換と外部ファイルの取り込みを、速度の整合性チェックとともに行います。テスト：<a1>ccsds_oem_interop_reference.rs</a1>。

seg-20071a16b316 = <b>VALIDATED</b> CCSDS { "502.0" } OEM インポーター（parse_oem）。COMMENT 行、追加のメタデータキーワード、共分散ブロックを許容し、ライターの厳密な逆変換です。往復変換と。オラクル（ExternalDataset）：独立したサードパーティの CCSDS-502 パーサー <c1/> { "0.4.5" }（MIT、<a1>https://pypi.org/project/oem/</a1>）— 別のコードベースで、kshana が出力した EME2000/UTC の OEM をバイト単位で同一にデコードし（{ "2" } 件のフィクスチャにわたる { "24" } 状態、位置・速度の Δ = { "0" }）、その厳密なリーダーはメタデータのトークンを確認します。kshana のパーサーも、同梱した外部の OEM で同様にこれと一致します。相互運用に関する正直な所見が二つあります（oem ライブラリは kshana の衛星ごとの mu

seg-7ab6bb7a1b8a = MODELLED — CCSDS OEM の取り込み・往復の相互運用ブリッジ（GMAT/Orekit/STK は OEM を出力）。構造的・物理的な取り込みチェックであり、元データの軌道精度の確認ではありません (result <c1/>)

seg-343a56c07d02 = MODELLED の構造的・物理的な取り込みチェックであり、元データの軌道精度の確認ではありません。 (kind catalogue (<c1/>))

seg-44aba1ad1d37 = 正直な適用範囲：MODELLED の構造的・物理的な取り込みチェックであり、元のエフェメリスの軌道精度の確認ではありません。実行：kshana scenarios/oem-interop.toml (scenario file comment, lines { "11" } to { "13" })

seg-833df8eedc34 = <s1>前へ</s1>ntn-positioning

seg-28254e1b38d4 = <s1>次へ</s1>optical-atmosphere

seg-99ef7c1d552c = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>ミッション解析、リンク、宇宙運用</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = ファミリーページ：<a1>ミッション解析、リンク、宇宙運用</a1>

seg-3068552e4ab4 = VALIDATED：この種類を挙げている<a1>検証マトリクス</a1>の行。
