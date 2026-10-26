# docs--kind-constellation-design: translations (ja)

seg-e27476e37522 = 地球

seg-37d29d8303fe = km

seg-11e8c29ecb45 = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>コンステレーション、カバレッジ、幾何</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-a4f1e7d2041e = ファミリーページ：<a1>コンステレーション、カバレッジ、幾何</a1>

seg-670191cf797f = トピックページ：<a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = トピックページ：<a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = ソース：<c1/>

seg-f708c26a5139 = <c1/>（シナリオの種類）

seg-de173c9f4034 = 大規模なコンステレーション設計：i: T/P/F表記によるWalker DELTAとWalker STARのパターン（ノードを{ "360" } degまたは{ "180" } degに分布、軌道面内の間隔{ "360" }<em>P/T、軌道面間の位相オフセット{ "360" }</em>F/T）、明示的な要素リストとマルチシェル設計、一つの実行内の複数のコンステレーション。地球、月、火星、またはその他の惑星、冥王星や主要な衛星を周回するもので、bodyモジュールの定数（太陽系およびbody-pntの種類が使うものと同じ）を用います。公表された公称要素からのプリセット：gps-baselineとgps-expandable（GPS Standard Positioning Service Performance Standard、{ "2020" }年第5版、Tables 3.2-1 to 3.2-3の{ "24" }スロットと、前後の六組の拡張可能なペア）、galileo（{ "29 599.801" } km、{ "56" } degのWalker 24/3/1。Galileo Open Service Service Definition Document issue { "1.1" } Tables { "1" } and { "23" }）、beidouとbeidou-meo（{ "21 528" } km、{ "55" } degのWalker 24/3/1に、{ "80" }、{ "110.5" }、{ "140" } deg Eの静止衛星三機と、{ "55" } degの傾斜静止軌道衛星三機を加えたもの。BeiDou Open Service Performance Standard { "3.0" } section { "4.1" }。MEOの位相と{ "118" } deg Eの傾斜静止軌道の交差は、規格が述べていないためモデル上の設定です）、およびglonass（GLONASS Interface Control Document edition { "5.1" } section { "5.2" }のスロット式による{ "19 100" } km、{ "64.8" } degの24/3/1）。カバレッジとDOP（精度低下率）：緯度／経度グリッドと、仰角マスク付きのサンプリングしたウィンドウにわたって、セルごとの視野内の衛星数、GDOP、PDOP、HDOP、VDOP、セルごとの可用性（PDOPがしきい値以下、既定は{ "6" }の測位解）を、全球（面積加重）と最悪地点で求め、clock = "common"でない限りコンステレーションごとに一つの受信機クロックを使います。数千機の衛星まで拡張できます。可視性は各衛星のカバレッジ半角に対する内積であり、衛星は各エポックで星下点の緯度によって帯分けされるため、グリッドの行は視野に入りうるものだけを検査し、レポートは節約した組検査の数を数えます。JSONには、グリッドマップと間引いた衛星ごとの地上軌跡が含まれます。VALIDATED：WalkerジェネレーターはGalileo OS SDD Table { "23" }とGLONASS ICDのスロット式に対して、GPSプリセットはSPS PS Table 3.2-1に公表された赤道通過の列に対して、GPSベースラインの全球HDOP分布はSPS PS Appendix B（中央値{ "0.94" }、{ "95" }% { "1.25" }、平均{ "0.96" }、許容差{ "0.03" }）に対して検証されています。MODELLED：任意で永年J2を含む二体軌道、球形の天体、幾何学的な可視性のみ（信号電力、ヘルス、地形は含まない）、および異なるシステム間の相対位相であり、これは実際のどの日付のスナップショットでもありません。

seg-21fbd84bfba1 = <c1/>の一回の実行は、次のように要約されます：constellation-design: { "5000" } satellites (LEO-PNT) around the Earth; availability { "99.22" }% (PDOP <= { "3" } at { "20" } deg mask), worst site { "0.00" }%, median PDOP { "1.11" }, mean { "39.4" } in view; { "648" } grid points x { "12" } epochs (MODELLED)

seg-af572ce1fd89 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>

seg-fd393ddc7d5d = 例の<c1/>が設定している項目（一部）：

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = 同梱のシナリオのうち{ "3" }個がこの種類を使用しています。その他は<a1><c1/></a1>にあります。

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = 結果ラベル（エンジンによるもの）：MODELLED - 球形の天体の周りの二体ケプラー軌道（任意で永年J2）、仰角マスク上の幾何学的な可視性、clock = "common"でない限りコンステレーションごとに一つの受信機クロックを使う全視野のDOP（精度低下率）。信号電力、ヘルス、地形は含みません。Walkerの幾何と公表された

seg-899e728ad9bd = scenarios/leo-pnt-mega-shell.toml（種類constellation-design）についてエンジンが書き出すグラフ

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }：この種類を挙げている<a1>検証マトリクス</a1>の行。

seg-602493ac6987 = <b>VALIDATED</b> <c1/>の種類のジェネレーター：T/P/F表記によるWalkerデルタおよびスターのパターン（ノード間隔360/Pまたは180/P、軌道面内の間隔{ "360" }·P/T、軌道面間の位相オフセット{ "360" }·F/T）、そしてGPSベースラインと拡張可能な24スロット、Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> GPS Standard Positioning Service Performance Standard（SPS PS）Appendix Bの条件（一恒星日、{ "287" }回の五分刻みのステップ、{ "4" } x { "4" } degの全球グリッドw）での、GPSベースライン24スロットのプリセットに対する<c1/>のカバレッジエンジン

seg-1272200ad4f2 = <b>MODELLED</b>固定した二つのケースを超える<c1/>の種類：明示的およびマルチシェルの設計、一つの実行内でコンステレーションごとに一つの受信機クロックを持つ複数のコンステレーション、天体の定数による地球、月、火星、BeiDouのプリセット テスト：<a1>coverage_dop_gnss_lib_py_oracle.rs</a1>。

seg-0c64f22330d2 = <b>VALIDATED</b> <c1/>の種類のジェネレーター：T/P/F表記によるWalkerデルタおよびスターのパターン（ノード間隔360/Pまたは180/P、軌道面内の間隔{ "360" }·P/T、int. オラクル（ExternalDataset）：公表された機関文書：Galileo Open Service Service Definition Document issue { "1.1" }（European GNSS Service Centre）Tables { "1" } and { "23" }（2016-11-21 { "00" }:{ "00" } UTCの基準コンステレーション）、GLONASS Interface Control Document edition { "5.1" }（{ "2008" }）section { "5.2" }（昇交点経度と緯度引数のスロット式）、GPS Standard Positioning Service Performance Standard 5th edition（{ "2020" }年四月）Tables 3.2-1, 3.2-2 and

seg-87c4e19dc780 = <b>VALIDATED</b> GPSベースライン24スロットのプリセットに対する<c1/>のカバレッジエンジン、GPS Standard Positioning Service Performance Standard（SPS PS）Appendix . オラクル（ExternalDataset）：GPS SPS PS 5th edition（{ "2020" }年四月）Appendix BのB.3.2.2とB.3.2.3。完全に埋まったベースライン24スロットのコンステレーションについて公表された、全球平均のHDOP分布（中央値{ "0.94" }、{ "90" } % { "1.16" }、{ "95" } % { "1.25" }、{ "98" } % { "1.37" }、平均{ "0.96" }）、Table 3.8-1（PDOPの可用性）、Table B.3-1（劣化したコンステレーションのアンサンブルPDOP。上限としてのみ使用）、および一つのエポックに対する手で導出した閉形式。VDOPとPD

seg-04289f7252cd = <b>MODELLED</b>固定した二つのケースを超える<c1/>の種類：明示的およびマルチシェルの設計、一つの実行内でコンステレーションごとに一つの受信機クロックを持つ複数のコンステ。オラクル（InternalConsistency）：内部整合性：総当たりの仰角スキャン、手計算とorbit::dopによる縮約、および閉形式のWalkerと静止軌道の幾何。任意で永年J2を含む二体軌道、局所鉛直が動径方向にある球形の天体、幾何学的な可視性のみ（信号電力、衛星のヘルス、地形、第三体の摂動は含まない）、そして異なる再

seg-00fa65d44cbd = MODELLED - 球形の天体の周りの二体ケプラー軌道（任意で永年J2）、仰角マスク上の幾何学的な可視性、clock = "common"でない限りコンステレーションごとに一つの受信機クロックを使う全視野のDOP（精度低下率）。信号電力、ヘルス、地形は含みません。Walkerの幾何と公表されたプリセットは、Galileo OS SDD、GLONASS ICD、GPS SPS Performance Standardのスロット表に照らして確認されており、 （結果<c1/>）

seg-62f0fc16a247 = MODELLED：任意で永年J2を含む二体軌道、球形の天体、幾何学的な可視性のみ（信号電力、ヘルス、地形は含まない）、および異なるシステム間の相対位相であり、これは実際のどの日付のスナップショットでもありません。（種類カタログ（<c1/>））

seg-3ef4276dd40b = この実行が答えるもの：視野内の衛星、{ "10" } degセルごとのPDOP/HDOP/VDOP/GDOP、およびPDOPが{ "3" }以下になる時間の割合（二時間にわたり、{ "20" } degのマスクの上）。マップが示す弱点は極冠です。どのシェルも緯度約{ "82" } degより上には届かないため、極付近のユーザーはすべての衛星を空の片側に見ることになり、鉛直方向の幾何が劣化します。MODELLED：例示的な設計、J2付きの二体軌道、球（シナリオファイルのコメント、{ "17" }〜{ "21" }行目）

seg-c333d3fe22cd = 任意の中心天体の周りの、大規模な任意の複数コンステレーション設計に対するカバレッジとDOP（精度低下率）のマップはMODELLEDであり、独立した外部の参照との照合はされていません。自身の閉形式・解析的な恒等式に照らして確認しており、転記や係数の誤りは見つけられますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-436504a8b26f = <s1>前へ</s1>conflict-resilience

seg-cba188459c80 = <s1>次へ</s1>contact-schedule
