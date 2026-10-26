# docs--kind-leo-pass: translations (ja)

seg-ad20a7bebf23 = STL

seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate：円軌道の衛星の地平線上にいるすべてのユーザーと、すべての軌道位置にわたる探索。地球を伴う。オラクル（ExternalDataset）：Leclere, Marathe and Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Table { "1" }（半径 { "6371" } km の球上の静止受信機、他の効果は地球の自転のみ）：L1 で { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz。対象は円形の二体軌道

seg-b952b2928bbe = <b>MODELLED</b> <c1/> の種別：設計されたパス、軌道要素、SGP4 を通した TLE、または constellation-design の Walker コンステレーションからの衛星。バンドとエポックごとに l。オラクル（InternalConsistency）：閉形式と自己整合性：距離変化率と距離加速度の恒等式を数値微分と比較すること、アイソフラックス利得が距離の増大を打ち消すこと、教科書的な偏波損失の限界、LEO と GNSS の定性的な観測の違い（数分間続き、平坦な 44-51 dB-Hz の GNSS 搬送波より数 dB 高いピークを持つ釣鐘形のパス）。EIRP とパターンは、公表された受信電力を EIRP または representat

seg-65a0444ca451 = MODELLED：LEO パスのジオメトリと、明示した EIRP と理想化したアンテナパターン、ITU-R の伝搬項に基づくバンドごとのリンクバジェット。構成モデルはそれぞれ検証マトリクスに独自のラベルを持ちます。いかなる衛星の測定でもありません。（結果 <c1/>）

seg-8b3ffb30c23c = 任意の [iot] セクションは、明示した受信機の電力バジェットについて、デューティサイクルに対する初回測位までの時間、一回の測位あたりのエネルギー、電池寿命を与えます（MODELLED）。（種別カタログ（<c1/>））

seg-597be3a6eb96 = 任意の [spoofer] セクションは、主張する位置の信号を偽装します。この位置は開始後に真の位置からジャンプするか押し出され、明示した誤警報確率と見逃し確率を持つ 二つのモニターを実行します。ドップラーとパスのジオメトリの整合性（測定した距離変化率を、軌道と独立した事前の位置・速度から予測した値と比較する、窓にわたる一般化最小二乗のカイ二乗検定（種別カタログ（<c1/>））

seg-dbcc7b9c9b9b = MODELLED：EIRP、パターン、衛星より下の TEC のチャップマン分率、およびパス全体。（種別カタログ（<c1/>））

seg-e675c999f303 = MODELLED。スポットビーム、バーストスケジュール、STL 波形はモデル化していません。（シナリオファイルのコメント、{ "14" } 行目）

seg-c3665ac09bf6 = 視界内の MEO GNSS 衛星に対する LEO-PNT パスとバンドごとのリンクバジェットは MODELLED であり、独立した外部の参照と照合して確認されていません。自身の閉形式・解析的な恒等式と照合しており、転記や係数の誤りは検出できますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-ab0fc0d88556 = 出典を明示した名前付きの LEO-PNT システムプリセットと、システムに依存しないエンジンは MODELLED であり、独立した外部の参照と照合して確認されていません。自身の閉形式・解析的な恒等式と照合しており、転記や係数の誤りは検出できますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-ae15d15bf151 = トピックページ：<a1>LEO-PASS.md</a1>

seg-3ddcc0ea097f = <s1>前へ</s1>leo-navmsg

seg-7c0d4c0f536d = <s1>次へ</s1>leo-pnt-chain
