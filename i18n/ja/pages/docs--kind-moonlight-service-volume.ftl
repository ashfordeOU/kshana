# docs--kind-moonlight-service-volume: translations (ja)

seg-8f8871ac8a0f = トピックページ：<a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = トピックページ：<a1>integrations.md</a1>

seg-eb9f9a422d38 = ソース：<c1/>

seg-f8988314faf2 = <c1/>（シナリオの種類）

seg-28c6a5644152 = ILLUSTRATIVE（例示用）の、公開情報に基づく Moonlight/LCNS クラスの月周回コンステレーション（ESA とは無関係）を用いた、モデルに基づく月航法サービスボリューム解析です。時間範囲にわたって月面の緯度・経度グリッドを掃引し、DOP、カバレッジ、可用性（≥{ "4" } 機かつ PDOP がしきい値未満）と、そのボリュームにわたる一般化した月 ARAIM 保護レベル（HPL/VPL）の包絡を報告します。DOP のジオメトリは gnss_lib_py で VALIDATED なカーネル（crate::orbit::dop）を再利用し、保護レベルは LunaNet LNIS の月 ARAIM の仕組み（crate::lunar、σ_URE≈{ "30" } m）を再利用して、既存の南極 PL を特殊な場合として含みます。MODELLED の構成：円軌道・楕円ケプラー軌道のリレー群（実際の微分補正された LCNS/NRHO エフェメリスではありません）と、平均自転の月（秤動や歳差する極はなし）。決定論的（純粋なジオメトリ）。TRL・飛行実績・機関による承認はありません。

seg-8516d1ded5dd = <c1/> の一回の実行の要約は次のとおりです：moonlight-service-volume | { "8" } 機（例示用の LCNS クラス、無関係） | { "24" } 点 × { "12" } エポック | カバレッジ { "37.8" }%（PDOP<{ "6.0" }） | 衛星数 { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL 可用性 { "0.0" }% | MODELLED

seg-b59e8773bcb9 = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>、<c22/>、<c23/>、<c24/>、<c25/>、<c26/>

seg-0d935e7c43da = 例の <c1/> では、とりわけ次を設定しています：

seg-edb738273a3a = エンジンが scenarios/moonlight-service-volume.toml（種類 moonlight-service-volume）に対して出力するグラフ

seg-1974d1d64c9c = <b>VALIDATED</b> Moonlight クラスの月 DOP / カバレッジ / 可用性と、サービスボリュームにわたる一般化した月 ARAIM 保護レベル。オラクル（ExternalDataset）：独立したサードパーティの権威 ANISE { "0.10.2" } astro::Orbit ケプラー伝播器（Nyx Space、MPL-2.0）— kshana のニュートン・ラフソン法によるケプラー解とは異なる、春秋分点要素の二体コード経路。衛星ごとの MCI 位置は <{ "1e-3" } m で一致し、導出した可視衛星の数と集合はすべてのグリッド点で完全に一致します。DOP カーネルは gnss_lib_py で確認済みで、インテグリティには公表されている LunaNet/LCNS のパラメーターを使用

seg-47f496c1d603 = <b>VALIDATED</b> 指定した月面の地点における、衛星ごとの地平座標の見上げ角（方位角は北から時計回り、仰角）とスラント距離。衛星はその地点の座標系で与えます。オラクル（ExternalDataset）：ANISE { "0.10.2" }（Nyx Space、MPL-2.0。xval/anise-service-geometry からツールとして実行し、バイナリは lunar-look-angles-xval、Kshana のコードは呼び出さない）。ANISE 自身の方位角・仰角・距離ルーチン（azimuth_elevation_range_sez）を、緯度・経度・高度のコンストラクターで構築した地点（pck00011 の月、球 { "1737.4" } km）に適用し、衛星は moon_pa_de440_200625.bpc を通じて MOON_PA_DE440 に回転します。{ "768" } サンプル

seg-1f12671176ad = MODELLED の構成：円軌道・楕円ケプラー軌道のリレー群（実際の微分補正された LCNS/NRHO エフェメリスではありません）と、平均自転の月（秤動や歳差する極はなし）。 (kind catalogue (<c1/>))

seg-2ff91fe31123 = 正直な評価：MODELLED の構成。DOP のジオメトリは、確認済みのカーネルを再利用することで確認されています。カバレッジ・可用性・インテグリティの構成は MODELLED です。円軌道・楕円ケプラー軌道のリレー群（微分補正された LCNS / { "9" }:{ "2" } NRHO エフェメリスではありません）、平均自転の月（物理的な秤動や歳差する極はなし）、公表されている LunaNet LNIS のインテグリティパラメーターを用いています。これは月サービスボリュームの M を示すものです (scenario file comment, lines { "27" } to { "32" })

seg-f3279128de3b = <s1>前へ</s1>mars-pnt

seg-92cd937a3fb7 = <s1>次へ</s1>ntn-positioning

seg-1f17ef6a853e = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>月および地球・月間空間（シスルナー）</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-1c1eeb2dcaa0 = ファミリーページ：<a1>月および地球・月間空間（シスルナー）</a1>

seg-619127334cf3 = この種類を名前で挙げているマトリクスの行はありません。その結果のラベルは、上に示したエンジン自身のものです。

seg-e66e2ca31e54 = トピックページ：<a1>MISSION-THREAD-LUNAR.md</a1>

seg-25040e105bf7 = <b>MODELLED</b> <c1/> の種別とフェーズ：地点と季節ごとの、中継衛星の可用性と PDOP、地球と太陽の可視性、規律された月面の時計。地形のスカイラインは <c2/> のものを使い、単一地点の実行はその種別と一致します

seg-6730fa1b9820 = <s1>前へ</s1>mission-thread
