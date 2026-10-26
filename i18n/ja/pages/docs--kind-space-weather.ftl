# docs--kind-space-weather: translations (ja)

seg-95f8bd8e0078 = ソース：<c1/>

seg-24c21b5b0cc3 = <c1/>（シナリオの種類）

seg-5f25c5b71f0c = 宇宙天気の環境モデル：太陽（F10.7/F10.7a）と地磁気（Kp。定義上の Kp↔ap 表付き）の活動指数、それらが決める Jacchia-1971 の外圏温度（公表された太陽活動極小・平均・極大の値と照合して確認済み）、そして、昼夜平均の外圏温度での Jacchia-1971 の熱圏中性大気密度を、活動を含まない静的プロファイルと複数の高度で比較したもの — 静的な大気が省略している太陽周期による密度の依存性です。MODELLED：密度は、加速度計から導いた密度（TOLEOS の CHAMP と GRACE）と、太陽活動極大期には { "2" } 倍以内で一致しますが、{ "2008" } 年の太陽活動極小期には約 1.7 倍密すぎます。

seg-f2c2860db799 = <c1/> の一回の実行の要約は次のとおりです：space-weather：F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" }（ap={ "27" }）-> T_inf={ "1047" } K、{ "300" } km で密度 x1.49（MODELLED）

seg-6bb05c41eba2 = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>

seg-c367f1aacd0b = 例の <c1/> では、とりわけ次を設定しています：

seg-02dc0d42fb21 = sfu

seg-1dd966268e12 = { "2" } nT

seg-d245f215f331 = 結果ラベル（エンジンによるもの）：MODELLED — 太陽・地磁気の指数、Jacchia-71 の外圏温度、昼夜平均温度での Jacchia-71 の静的密度

seg-c1c6f2f73fb5 = エンジンが scenarios/space-weather.toml（種類 space-weather）に対して出力するグラフ

seg-15587da59e8e = <b>MODELLED</b> 太陽・地磁気の指数（定義上の Kp↔ap 表）、Jacchia-1971 の外圏温度、Jacchia { "1971" } の熱圏密度（SAO Special Report { "332" }：その表 { "7" } を再現する静的な拡散プロファイル、昼夜、地磁気

seg-f8eef6eabfb2 = <b>MODELLED</b> 太陽・地磁気の指数（定義上の Kp↔ap 表）、Jacchia-1971 の外圏温度、Jacchia { "1971" } の熱圏密度（SAO Special Report { "33" }。オラクル（ExternalDataset）：定義上の Kp↔ap 表と Jacchia-1971 の外圏温度の閉形式（公表されたアンカーとは <{ "1" } K で一致、tests/space_weather_reference.rs）。密度は pymsis の NRLMSISE-00（独立した NRL モデル）に対して特性評価しています。{ "800" } km の太陽周期の変動は 10.4x で、NRLMSISE-00 では 13.6x です。{ "0.30" } の改訂：較正した一次の活動係数を Jacchia { "1971" } に置き換えました（既定シナリオの密度は { "40" }

seg-72979b637644 = MODELLED — 太陽・地磁気の指数、Jacchia-71 の外圏温度、昼夜平均温度での Jacchia-71 の静的密度 (result <c1/>)

seg-0306ee022298 = MODELLED：密度は、加速度計から導いた密度（TOLEOS の CHAMP と GRACE）と、太陽活動極大期には { "2" } 倍以内で一致しますが、{ "2008" } 年の太陽活動極小期には約 1.7 倍密すぎます。 (kind catalogue (<c1/>))

seg-b86a312077b5 = 正直な適用範囲：MODELLED。Kp<->ap の変換は定義上の IAGA の表であり、外圏温度は公表された太陽活動極小・平均・極大の値と照合して確認していますが、密度の補正は較正した一次のスケールハイト結合です — 符号、単調性、桁は正しく捉えますが、データで確認済みの（NRLMSISE-00）大気の絶対精度までは捉えて「いません」。実行：kshana scenarios/space-weath (scenario file comment, lines { "10" } to { "15" })

seg-10cf16c12a2a = 宇宙天気の環境と、活動に左右される熱圏密度は MODELLED であり、独立した外部の参照との照合による確認は行っていません。部分的な主張は外部で確認していますが、機能全体はモデルに基づく部分を組み合わせたものであるため、機能はモデルに基づくものにとどまります。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-3dd29f8fba14 = <s1>前へ</s1>space-packet

seg-ff9d9a41692b = <s1>次へ</s1>spectrum

seg-37d29d8303fe = km

seg-8e845ce908ee = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>GNSSの測定、測位、インテグリティ</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-f6b7ca020692 = ファミリーページ：<a1>GNSSの測定、測位、インテグリティ</a1>
