# docs--kind-lunar-time-offset: translations (ja)

seg-64813e3da228 = ソース：<c1/>

seg-000bb13909f1 = <c1/>（シナリオの種類）

seg-7f3e13712f10 = モデルに基づく相対論的な地球・月間の時計レート（月座標時、LTC/TCL）です。自己ポテンシャルの差と月の運動項から LTC−TT の永年レートを求め、公表されている { "56" }–{ "59" } µs/日の範囲とあわせて報告し、期間にわたる累積オフセットも示します。

seg-9efcf3e1be04 = <c1/> の一回の実行の要約は次のとおりです：lunar-time-offset | LTC−TT の永年レート { "57.04" } µs/日（範囲 { "56" }–{ "59" }） | 自己ポテンシャル { "57.50" } 運動項 -0.46 | オフセット @ { "1.00" } 日 = { "57.04" } µs

seg-9367773c4889 = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>

seg-4731141e6aac = 例の <c1/> では、とりわけ次を設定しています：

seg-3843825d0733 = us

seg-e9deb6ed41c1 = エンジンが scenarios/lunar-time-offset.toml（種類 lunar-time-offset）に対して出力するグラフ

seg-982426693747 = <b>VALIDATED</b> 相対論的な地球・月間の時計レート（LTC/TCL）と TT/TAI/UTC の連鎖およびアンサンブル。オラクル（ExternalDataset）：Ashby & Patla { "2024" }、'A Relativistic Framework to Estimate Clock Rates on the Moon'、Astronomical Journal { "167" }:{ "149" }（NIST。IAU/IAG LunaNet LTC の基礎）。月面の自己ポテンシャル L_m = { "3.13881e-11" } と永年の合計 { "56.02" } µs/日を、公表された数値として照合。地心から見た月の速度は JPL DE440（SPICE 経由の de440s.bsp）と相互確認

seg-96b65f604cc2 = 正直な評価：MODELLED であり、認証を受けたものではありません。見出しの us/日の値は基準に依存します（地球のジオイド W0 か月のセレノイドか、時間平均の窓、無視したサブ us/日の遠心力・J2 補正）。そのため、単一の数値ではなく範囲を示すことが正直な出力です。ここでの結果は、サブナノ秒の絶対精度について独立した外部の参照との照合による確認を行ったものではなく、運用上の時刻管理について認証を受けたものでもありません。レポートは期間にわたる累積 LTC-TT オフセットも示します (scenario file comment, lines { "11" } to { "16" })

seg-e4552368a6a7 = <s1>前へ</s1>lunar-time-budget

seg-777dc23bac6a = <s1>次へ</s1>lunar-vlbi-fim

seg-4d208b6c0eb8 = 日

seg-1f17ef6a853e = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>月および地球・月間空間（シスルナー）</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-1c1eeb2dcaa0 = ファミリーページ：<a1>月および地球・月間空間（シスルナー）</a1>

seg-619127334cf3 = この種類を名前で挙げているマトリクスの行はありません。その結果のラベルは、上に示したエンジン自身のものです。

seg-e66e2ca31e54 = トピックページ：<a1>MISSION-THREAD-LUNAR.md</a1>
