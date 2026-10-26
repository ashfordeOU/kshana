# docs--kind-solar-system: translations (ja)

seg-e27476e37522 = 地球

seg-5b561b4fd201 = 火星

seg-59f1f277012b = 木星

seg-e6e209ad07e0 = エウロパ

seg-6f12259c6ec4 = 土星

seg-3319b18ac61f = マトリクスには、ほかに { "1" } 件あります。

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }：この種別を挙げている<a1>検証マトリクス</a1>の行。

seg-028ac545e52e = ソース：<c1/>

seg-934e7998420c = <c1/>（シナリオの種類）

seg-0549bc926a9b = ある一つのエポックにおける太陽系全体を、任意の天体の周りの PNT（測位・航法・時刻）のために扱います。太陽、八つの惑星、冥王星、月、Phobos、Deimos、Io、Europa、Ganymede、Callisto、Titan について、ICRF（国際天文基準座標系、赤道 J2000）での太陽中心の位置と速度、太陽中心距離と J2000 黄道経度・緯度、重力定数、赤道半径と平均半径、公表されている場合は J2 とその基準半径、恒星自転周期、IAU の極とエポックでの本初子午線、一周にわたってサンプリングした軌道トラック（惑星は太陽中心、衛星は親天体中心）、そして観測者の天体（既定は地球）からの光行時間、片方向と双方向の距離、太陽の Shapiro 遅延、太陽との離角を報告します。追加の from/to リンクにも同じ処理を行います。位置：Standish と Williams による JPL のケプラー要素（{ "1800" } AD ～ { "2050" } AD は表 { "1" }、{ "3000" } BC ～ { "3000" } AD は表 2a/2b）と各惑星の公称誤差、地球と月の分離には Montenbruck & Gill の月の級数、火星と木星のガリレオ衛星には IAU の同期自転レートを用いた JPL の平均要素、Titan には IAU の自転モデルを使います。光行時間：放射測定の不動点解法で、送信側は遅延位置。ニュートン力学的で、Shapiro 遅延は別に報告します。公称誤差の二倍以内で JPL Horizons（DE441）と照合して VALIDATED：水星から土星および地球は表 { "1" }（最悪で公称の { "1.87" } 倍）、八つの惑星すべては表 2a/2b（最悪で { "1.71" } 倍）、そして地球から火星と木星への光行時間。MODELLED、各行にラベル付き：表 { "1" } の天王星と海王星（DE441 に対する公称誤差の { "2.0" } 倍と { "5.2" } 倍）、冥王星（{ "1992" } の行。誤差の記載なし）、月と七つの衛星（Horizons に対して測定、公表された限界なし）。

seg-bd2d27e1f91d = <c1/> の一回の実行の要約は次のとおりです：2026-09-28T00:{ "00" }:{ "00" } の太陽系（JD { "2461311.50080" } TDB）、{ "18" } 天体、観測者 Earth Standish 表 { "1" }（{ "1800" } AD ～ { "2050" } AD） Sun { "0.0000" } au 経度 { "0.00" } deg 光行時間 { "500.1" } s [原点] Mercury { "0.4666" } au 経度 { "259.05" } deg 光行時間 { "605.3" } s [VALIDATED] Venus { "0.7272" } au 経度 { "348.72" } deg 光行時間 { "182.1" } s [VALIDATED] Earth { "1.0022" } au 経度 { "4.52" } deg 観測者 [VALIDATED] Moon { "1.0046" } au 経度 { "4.56" } deg 光行時間 { "1.3" } s [MODELLED] Mars { "1.5544" } au 経度 { "83.81" } deg 光行時間 { "841.1" } s [VALIDATED] Phobos { "1.5545" } au 経度 { "83.81" } deg 光行時間 { "841.2" } s [MODELLED] Deimos { "1.5545" } au 経度 { "83.80" } deg 光行時間 { "841.1" } s [MODELLED] Jupiter { "5.3036" } au 経度 { "130.91" } deg 光行時間 { "2970.6" } s [VALIDATED] Io { "5.3049" } au 経度 { "130.94" } deg 光行時間 { "2971.5" } s [MODELLED] Europa { "5.2995" } au 経度 { "130.93" } deg 光行時間 { "2968.7" } s [MODELLED] Ganymede { "5.3005" } au 経度 { "130.98" } deg 光行時間 { "2969.6" } s [MODELLED] Callisto { "5.3153" } au 経度 { "130.96" } deg 光行時間 { "2976.7" } s [MODELLED] Saturn { "9.4356" } au 経度 { "10.77" } deg 光行時間 { "4212.2" } s [VALIDATED] Titan { "9.4401" } au 経度 { "10.74" } deg 光行時間 { "4214.3" } s [MODELLED] Uranus { "19.4363" } au 経度 { "62.62" } deg 光行時間 { "9444.1" } s [MODELLED] Neptune { "29.8775" } au 経度 { "2.62" } deg 光行時間 { "14409.3" } s [MODELLED] Pluto { "35.6122" } au 経度 { "304.19" } deg 光行時間 { "17529.1" } s [MODELLED] リンク Mars -> Jupiter：片方向 { "2193.539" } s、双方向 { "4386.919" } s、Shapiro { "15.0" } us、太陽 { "15.0" } deg リンク Saturn -> Earth：片方向 { "4212.176" } s、双方向 { "8424.347" } s、Shapiro { "22.1" } us、太陽 { "172.5" } deg リンク Europa -> Jupiter：片方向 { "2.218" } s、双方向 { "4.437" } s、Shapiro { "0.0" } us、太陽 { "22.0" } deg

seg-26ecec1af8af = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-13de19567146 = 例の <c1/> では、とりわけ次を設定しています：

seg-6081077a5c63 = 2026-09-28T00:{ "00" }:{ "00" }

seg-c4b64eb26210 = ICRF（赤道 J2000）、太陽中心、m

seg-6096a0ab243b = Standish 表 { "1" }（{ "1800" } AD ～ { "2050" } AD）

seg-5c9a8d4716f5 = 結果ラベル（エンジンによるもの）：混在：各天体はそれぞれ自身のラベルを持ちます。惑星の位置は、Standish の公称誤差の二倍以内で JPL Horizons と照合して VALIDATED です（水星から土星および地球は表 { "1" }、八つの惑星すべては表 2a/2b）。表 { "1" } の天王星と海王星、冥王星、月、七つの衛星は MODELLED です。

seg-537aa8010e50 = エンジンが scenarios/solar-system-tour.toml（種類 solar-system）に対して出力するグラフ

seg-7432155d5fec = <b>VALIDATED</b> planetary_kernel_path を指定した <c1/> の種類：報告する各天体のうち、その NAIF コードを SPK が保持するものは、エンジン自身のリーダーを通じてカーネルから太陽中心の J2000 位置と速度を取得し（ラベル KERNEL）、両端が

seg-84ce0dd8daef = <b>VALIDATED</b> 水星、金星、地球・月重心、地球、火星、木星、土星の太陽中心位置（Standish 表 { "1" }、{ "1800" } AD ～ { "2050" } AD）と、八つの惑星すべての太陽中心位置（表 2a/2b、{ "3000" } BC ～ { "3000" } AD、b、c、s、f の平均近点）。テスト：<a1>solar_system_standish_earth_icrf_preregistered.rs</a1>。

seg-cc5bd76ec542 = <b>MODELLED</b> 表 { "1" } の天王星と海王星の位置（{ "1800" } AD ～ { "2050" } AD の範囲内の既定）、現在の JPL のページにはもう載っていない { "1992" } の表 { "1" } の行による冥王星、そしてすべての惑星の太陽中心速度：二体の導関数と共に。テスト：<a1>solar_system_horizons_reference.rs</a1>。

seg-ad3da7fe8e46 = <b>VALIDATED</b> planetary_kernel_path を指定した <c1/> の種類：報告する各天体のうち、その NAIF コードを SPK が保持するものは、太陽中心の J2000 位置と速度を。オラクル（ExternalDataset）：NAIF SPICE Toolkit（CSPICE N0067、spiceypy { "8.3.0" } 経由）の、完全な de440s.bsp 上での spkezr による太陽中心状態。Kshana のコードを呼び出さない別のプログラムで（tests/fixtures/solar_system_kernel/、NOTICE.md）、エンジンは de440s の切り出しをビット単位で同一に読み取ります。事前登録済み f8e946ea。配線のライブラリ確認です。DE440 自体と解析的な天体は、ここでは確認していません。結果：docs/design/evidence/cap31-solar-system-kernel/RE

seg-735fb0bc1705 = <b>VALIDATED</b> 水星、金星、地球・月重心、地球、火星、木星、土星の太陽中心位置（Standish 表 { "1" }、{ "1800" } AD ～ { "2050" } AD）と、すべての。オラクル（ExternalDataset）：JPL Horizons DE441 の幾何学的な太陽中心ベクトル（黄道と ICRF）で、事前登録のコミット { "80451866" }、8d38a28b、558cc807 の後に取得。合格基準：惑星と成分ごとに、RMS が Explanatory Supplement 第3版 表 { "8.10.1" } の近似誤差（地球は EMB の行）の 1.0 倍以下。地球と EMB の分離は DE441 の { "399" } から { "3" } を引いたものに対して直接確認し、1950-2050 のすべてのエポックで { "0.3" } deg 以下かつ { "8.1" } km 以下（th

seg-ab1192de28f5 = <b>VALIDATED</b> 任意の天体から他の任意の天体への、あるエポックに受信するニュートン力学的な片方向の光行時間を、放射測定の不動点光行時間ソルバー（radiometric::light_t で解きます。オラクル（ExternalDataset）：JPL Horizons DE441 の片方向ダウンレッグのニュートン力学的な光行時間 LT（VEC_CORR=LT、観測者は地球中心）。事前登録済み（480037d3。修正 54d5c86f は、最初の取得が { "10" } m の補間の前提条件を満たさなかった後に、光行時間を一つも比較する前に、補間ノードの間隔のみを変更）で、合格基準は一つの光行時間あたり { "1e-6" } s。ソルバーには DE441 の太陽系重心位置を与えるため、遅延送信側の反復が明らか

seg-5a2e745828ea = <b>MODELLED</b> 表 { "1" } の天王星と海王星の位置（{ "1800" } AD ～ { "2050" } AD の範囲内の既定）、現在の JPL のページにはもう載っていない { "1992" } の表 { "1" } の行による冥王星。オラクル（ExternalDataset）：JPL Horizons DE441（コミット済みの同じフィクスチャ）に対して測定しましたが、確認済みではありません。表 { "1" } が示す天王星と海王星の数値は、DE441 の太陽中心位置に対して最大でそれぞれ { "2.0" } 倍と { "5.2" } 倍を超えます（海王星は太陽系重心位置に対しては満たしており、フィットは太陽中心ではなかったことを示唆します）。冥王星の誤差はページに記載がなく、速度については公表された限界がありません。表 2a/2b はそれ自身の

seg-0131b082906b = 混在：各天体はそれぞれ自身のラベルを持ちます。惑星の位置は、Standish の公称誤差の二倍以内で JPL Horizons と照合して VALIDATED です（水星から土星および地球は表 { "1" }、八つの惑星すべては表 2a/2b）。表 { "1" } の天王星と海王星、冥王星、月、七つの衛星は MODELLED です。光行時間はニュートン力学的で、同じ位置から求めます。 (result <c1/>)

seg-3e24f0bf9ccd = MODELLED、各行にラベル付き：表 { "1" } の天王星と海王星（DE441 に対する公称誤差の { "2.0" } 倍と { "5.2" } 倍）、冥王星（{ "1992" } の行。誤差の記載なし）、月と七つの衛星（Horizons に対して測定、公表された限界なし）。 (kind catalogue (<c1/>))

seg-62b2e925233a = VALIDATED であるもの、そうでないもの 各天体はそれぞれ自身のラベルを持ちます。水星から土星および地球は、Standish のページの公称誤差の二倍以内で JPL Horizons（Development Ephemeris DE441）と照合して VALIDATED です。表 { "1" } の天王星と海王星は、DE441 に対してそのページの数値を超えており（{ "2.0" } 倍と { "5.2" } 倍）、MODELLED です。冥王星、月、七つの衛星も同様で、これらは Horizons に対して測定しましたが、公表された限界が (scenario file comment, lines { "20" } to { "25" })

seg-2b36ac40e457 = 表 { "1" } の天王星と海王星の Standish による位置、冥王星、および惑星の速度は MODELLED であり、独立した外部の参照との照合による確認は行っていません。部分的な主張は外部で確認していますが、機能全体はモデルに基づく部分を組み合わせたものであるため、機能はモデルに基づくものにとどまります。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-c19e6d035b7e = 月と七つの主要な衛星（Phobos、Deimos、ガリレオ衛星、Titan）の位置は MODELLED であり、独立した外部の参照との照合による確認は行っていません。部分的な主張は外部で確認していますが、機能全体はモデルに基づく部分を組み合わせたものであるため、機能はモデルに基づくものにとどまります。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-ce15aaa5453c = 太陽系のすべての天体の物理定数と、系全体のレポートは MODELLED であり、独立した外部の参照との照合による確認は行っていません。これは自身の閉形式・解析的な恒等式に照らして確認したものであり、転記や係数の誤りは検出できますが、外部のオラクルではありません。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-ceadf891b1e2 = <s1>前へ</s1>slot-timing

seg-0493962a6937 = <s1>次へ</s1>space-packet

seg-4d208b6c0eb8 = 日

seg-11e8c29ecb45 = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>コンステレーション、カバレッジ、幾何</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-dae4184bb004 = <b>VALIDATED</b>任意の天体から任意の別の天体への、あるエポックに受信されるニュートン力学的な片道光行時間。放射測定の不動点光行時間ソルバー（radiometric::light_time_solution、送信機は遅延位置）により、solar_system::link_oを通して解きます テスト：<a1>solar_system_light_time_preregistered.rs</a1>。

seg-a4f1e7d2041e = ファミリーページ：<a1>コンステレーション、カバレッジ、幾何</a1>

seg-670191cf797f = トピックページ：<a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = トピックページ：<a1>CONSTELLATION-DESIGN.md</a1>
