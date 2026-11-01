# docs--kind-entry-heating: translations (ja)

seg-b3a829cb7d84 = 米国標準大気 { "1976" }

seg-13b9e9187ab9 = ソース：<c1/>

seg-3a3f732cc2dd = <c1/>（シナリオ種別）

seg-b843e2e0a4ee = 自転する球形の地球または火星上での3-DoF 質点による大気圏突入（弾道型、または一定バンクの揚力型）を、US76、指数関数型、または火星の大気を通して RK4 で計算し、Sutton-Graves 式による淀み点対流加熱（NASA TR R-376）を適用します：ピーク減速度、熱流束と動圧、熱負荷、ダウンレンジ、回転座標系でのエネルギー検査、そして並べて示す Allen-Eggers の閉形式。ピーク減速度は公表されている Stardust の公称値と照合しており、加熱は MODELLED です。

seg-05c8dac8d411 = <c1/>の一回の実行は次のように要約されます：entry-heating（地球）：V_rel { "12551" } m/s、γ { "8.43" }° -> ピーク{ "35.4" } g（高度{ "54.2" } km）、ピーク q { "746" } W/cm²（高度{ "62.0" } km）、熱負荷{ "20970" } J/cm²、ピーク q_dyn { "20.8" } kPa；terminal-altitude に{ "317" } s で到達（閉形式{ "60.2" } g；MODELLED 3-DoF、放射加熱・TPS なし）

seg-96504cafb034 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>

seg-1b68d973fd30 = 例の<c1/>では、とりわけ次を設定しています：

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" }（{ "1958" }）の弾道定数

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = 結果ラベル（エンジンによるもの）：MODELLED — 自転する球形惑星上での3-DoF 質点突入（中心重力のみで J2 なし、共回転する無風の大気、一定の C_D、L/D、バンク、RK4）；NASA TR R-376（{ "1971" }）による淀み点対流加熱、冷壁、放射加熱は含まず、TPS／アブレーション応答は含まず、6-DoF ではありません

seg-dbb618cd6357 = エンジンが scenarios/entry-heating-stardust.toml（種別 entry-heating）について出力するグラフ

seg-e73b339df97b = <b>VALIDATED</b> 自転する球形の地球上での3-DoF 質点突入を、US Standard Atmosphere { "1976" }を通して慣性系の突入状態から RK4 で積分し、ピーク減速度とその高度を報告します；惑星相対の突入状態は慣性 テスト：<a1>entry_stardust_published.rs</a1>。

seg-10124432b79b = <b>MODELLED</b> 淀み点の対流熱流束 q = k sqrt(rho/R_n) V^{ "3" }。地球の空気と火星の大気に対する Sutton-Graves 定数（NASA TR R-376、{ "1971" }）を用い、3-DoF 突入（弾道型、または一定の揚力型）に沿ったそのピークと積算熱負荷を求めます。 テスト：<a1>entry_stardust_published.rs</a1>。

seg-54d133781215 = <b>VALIDATED</b> 自転する球形の地球上での3-DoF 質点突入を、US Standard Atmosphere { "1976" }を通して慣性系の突入状態から RK4 で積分し、報告。オラクル（ExternalDataset）：Desai、Mitcheltree、Cheatwood（{ "1999" }、NASA NTRS { "20050042027" }）による Stardust の公称値：最大減速度{ "33.4" } g、惑星相対{ "12.6" } km/s、打ち上げ質量{ "45.8" } kg、完全な空力データベースを用いた6-DoF POST 軌道；突入インターフェースは Desai、Lyons、Tooley、Kangas（NTRS { "20090004445" }）による：半径{ "6503.14" } km、慣性系で{ "12.9" } km/s、-8.2 deg。合格基準は xval/entry-stardust/PREREGISTRATION で事前登録済みです。

seg-03878684f9a1 = <b>MODELLED</b> 淀み点の対流熱流束 q = k sqrt(rho/R_n) V^{ "3" }。地球の空気と火星の大気に対する Sutton-Graves 定数（NASA TR R-376、{ "1971" }）を用い、その。オラクル（InternalConsistency）：内部整合性：NASA TR R-376 に印刷されているとおりの関係式と定数、半刻み収束検査、そして加熱ピークと減速ピークの予想される順序。含まれないもの：公表されている加熱値との比較は行っていません（Stardust の論文には設計限界と、対流加熱と放射加熱を合わせた約{ "1200" } W/cm2 の見積りがありますが、対流のみの関係式ではこれに一致できません）；放射加熱、壁面温度、あるいは

seg-a0f300b2ce78 = MODELLED — 自転する球形惑星上での3-DoF 質点突入（中心重力のみで J2 なし、共回転する無風の大気、一定の C_D、L/D、バンク、RK4）；NASA TR R-376（{ "1971" }）による淀み点対流加熱、冷壁、放射加熱は含まず、TPS／アブレーション応答は含まず、6-DoF ではありません（結果<c1/>）

seg-47f81ab160cc = ピーク減速度は公表されている Stardust の公称値と照合しており、加熱は MODELLED です。（種別カタログ（<c1/>））

seg-47cda83af127 = 突入インターフェースは半径{ "6503.14" } km、慣性系で{ "12.9" } km/s、-8.2 deg、{ "45.8" } kg、直径{ "0.811" } m、ノーズ半径{ "0.2202" } m（Desai ら、NASA NTRS { "20050042027" } および{ "20090004445" }）。緯度と方位は太平洋上の突入を想定した概略の仮定値であり、C_D はモジュールの{ "60" } deg 球円錐の既定値です。公表されている6-DoF 公称のピーク減速度：{ "33.4" } g。加熱は Sutton-Graves の対流のみで、MODELLED です。（シナリオファイルのコメント、{ "4" }～{ "8" }行目）

seg-98af076be1ac = 3-DoF 突入における淀み点対流突入加熱（Sutton-Graves）は MODELLED であり、独立した外部の参照と照合して確認されてはいません：自身の閉形式・解析的な恒等式との照合であり、転記ミスや係数の誤りは検出できますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-77c073cd5d67 = <s1>前へ</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>次へ</s1>eo-coverage

seg-99ef7c1d552c = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>ミッション解析、リンク、宇宙運用</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-8f1e7d3f5a07 = ファミリーページ：<a1>ミッション解析、リンク、宇宙運用</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }：この種類を挙げている<a1>検証マトリクス</a1>の行。

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = トピックページ：<a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth
