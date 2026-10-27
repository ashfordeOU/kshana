# docs--glossary: translations (ja)

seg-daf25c6479c1 = 標準

seg-c851aa23ea42 = カンマ区切り値

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = 温度補償水晶発振器

seg-1bac97ee312a = ルビジウム原子周波数標準

seg-b09ffb8a9095 = モンテカルロ

seg-9939da5da283 = JSON

seg-e464509f3abb = 搬送波対雑音密度比

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = デジタルオブジェクト識別子

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = 国際天球基準座標系

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = 国際宇宙ステーション

seg-865e7d1794b6 = Secure Hash Algorithm、256 ビット

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = 極超短波

seg-5907283b71da = 略語

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = システム間バイアス

seg-7dabf60fd17e = QPN

seg-dae80c23262e = 量子射影雑音

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-6ce4c2164aee = ソース：<c1/>

seg-bee5d056ef03 = Kshana で使う用語の平易な定義です。各項目は一行の「平たく言えば」から始まり、必要に応じて正確な意味を補います。各セクションで定義していない略語は、末尾近くの A から Z までの表にあります（<a1>その他すべての略語、A から Z</a1>）。

seg-f8c5433d1026 = 航法とタイミング

seg-2a42d84608ea = <b>PNT — 測位・航法・時刻（Positioning, Navigation, and Timing）。</b>自分が<em>どこに</em>いるか、<em>どちらへ</em>向かっているか、<em>今何時か</em>を精密に知ることです。現代の PNT の大半は衛星信号（GNSS、次に定義する全球測位衛星システム）から得られます。Kshana が調べるのは、それらの信号が失われたときに<em>時刻</em>と<em>位置</em>に何が起きるかです。

seg-6227db2c94e1 = <b>GNSS — 全球測位衛星システム（Global Navigation Satellite System）。</b>PNT を提供する衛星コンステレーションです。GPS（Global Positioning System、米国（United States of America））、Galileo（EU）、GLONASS（ロシアの Global Navigation Satellite System）、BeiDou（中国）があります。≥ { "4" } 機の衛星が見える受信機は、3 次元の位置と時刻の解を完全に計算できます。

seg-f8eda357e640 = <b>GNSS の途絶・拒否・劣化・ジャミング。</b>衛星信号が利用できない状態（遮蔽、ジャミング、視界外）です。途絶中、システムは自身の搭載センサーだけで「惰行」しなければなりません。Kshana の目的は、その惰行がどれだけうまくいくかを測ることに尽きます。

seg-a3ade199f465 = <b>ホールドオーバー。</b>平たく言えば、<em>GNSS を失った後、時計が自力でどれだけ長く正しい時刻を保てるか</em>です。優れた時計ほど、誤差が許容限界を超えるまでの時間が長くなります。

seg-83b33c15312f = <b>推測航法（デッドレコニング）。</b>平たく言えば、<em>外部の参照なしに、測定した運動を積算して現在位置を推定すること</em>です。誤差は蓄積するため、優れた慣性センサーほどドリフトが遅くなります。

seg-da9bcc994b9c = <b>仕様・しきい値。</b>解が「仕様外」とみなされるまでに許される最大誤差です。例：「タイミングは { "20" } ns 以内」「位置は { "100" } m 以内」。

seg-6f37a60a30c7 = Kshana が比較するセンサー

seg-308b59d89586 = <b>時計（原子時計）。</b>原子の固有振動を数えて時刻を刻む装置です。ここでは 二つの例を挙げます。

seg-3389d08be6bc = <b>CSAC — チップスケール原子時計（Chip-Scale Atomic Clock）。</b>小型で、実運用されている市販の時計です（「古典」側の基準）。性能は良好ですが、長い途絶ではかなりドリフトします。

seg-3e121d8e6400 = <b>光格子時計（例：ストロンチウム）。</b>はるかに安定した「量子」時計です。研究室では最先端ですが、宇宙ではまだ飛行していません。

seg-4daa6cdf8ae2 = <b>加速度計。</b>加速度（運動の変化）を測ります。二回積分すると位置になるため、誤差は急速に増大します。<b>コールドアトム加速度計</b>は長期安定性がはるかに優れた量子版で、<b>航法級</b>は古典版です。

seg-91793676c57c = <b>ジャイロスコープ。</b>回転を測ります。わずかな回転誤差でもプラットフォームが傾き、重力が水平方向に漏れ込んで位置推定を狂わせます。

seg-2d36110effc3 = <b>IMU — 慣性計測装置（Inertial Measurement Unit）。</b>加速度計とジャイロスコープをまとめたパッケージそのものです。それぞれ三軸を備え、比力と角速度を出力します。運動を測りますが、それだけでは自分がどこにいるかを知りません。

seg-e3b6b40e0cd0 = <b>INS — 慣性航法システム（Inertial Navigation System）。</b>IMU に、その出力を積分して姿勢・速度・位置を求める「メカナイゼーション」を加えたものです。GNSS の途絶中に推測航法を行うのが INS であり、その精度は下に挙げる IMU の誤差過程で決まります。

seg-a618ff7ee429 = <b>時刻比較・時刻伝送。</b>二地点間（例：衛星間）で精密な時刻信号を送ることです。<b>光</b>リンクは <b>RF</b>（無線周波数）リンクよりはるかに精密です。

seg-847fbbeecfae = 誤差のモデル化（時計ノイズ）

seg-5cf197bdbbad = 時計の誤差は、既知の特徴を持つ標準的な「ノイズの種類」から構成されます。

seg-3806d1b1cb50 = <b>ホワイト FM（white frequency modulation）。</b>平たく言えば、<em>時計の周波数に生じる、速くランダムなジッター</em>です。平均化すると、時間とともに改善します。パラメーターは <c1/> です。

seg-0793fdd3abab = <b>ランダムウォーク FM。</b>平たく言えば、<em>時計の周波数がゆっくりさまようこと</em>です。長い途絶ではこれが支配的になります。パラメーターは <c1/> です。

seg-42b74c8b88ff = <b>フリッカー FM（1/f ノイズ）。</b>平たく言えば、<em>時計がどれだけ平均化しても下回れない、頑固なノイズフロア</em>です。平均化時間によらず一定です。パラメーターは <c1/> です。

seg-b3bd841a5a2d = <b>エージング・ドリフト。</b>周波数がゆっくりと、<em>予測可能な形で</em>変化することです。予測可能なので、Kshana の推定器はこれを除去します。パラメーターは <c1/> です。

seg-d929960492e4 = <b>VRW — 速度ランダムウォーク（Velocity Random Walk）。</b>加速度計におけるホワイトノイズに相当するものです。速度へのランダムな擾乱が積み重なり、位置誤差になります。パラメーターは <c1/> です。

seg-4a97f8d14174 = <b>ARW — 角度ランダムウォーク（Angular Random Walk）。</b>ジャイロスコープにおける相当物で、向きへのランダムな擾乱です。パラメーターは <c1/> です。

seg-dcd03b326110 = 安定度の測り方

seg-2181832c6253 = <b>アラン偏差（<c1/>）。</b>平たく言えば、<em>ある平均化時間 <c2/> における時計の安定度を表す標準的な方法</em>です。時計のデータシートでは、たとえば <c3/> のように示します。Kshana は、自らの出力のアラン偏差を計算し、公表値と一致することを確認して、時計モデルを検証しています。（参考文献：Riley, NIST SP { "1065" } — 米国国立標準技術研究所特別刊行物 { "1065" }。）

seg-11cbe561e633 = <b>PSD — パワースペクトル密度（Power Spectral Density）。</b>ノイズの電力が周波数にどう分布するかを表します。ホワイト、ランダムウォーク、フリッカーの各ノイズを規定する正式な方法です。

seg-0737d620eb5f = 性能指標（実行のスコアの付け方）

seg-20b66e0d4809 = Kshana が報告する 六つの運用上の PNT 性能指標です（README の「Output」表を参照）。

seg-b17d08246e49 = <b>FoM — 性能指標（Figure of Merit）。</b>実行の一つの側面を一つの数値で評価するもので、単位と、独立した外部の参照と照合して確認済みか、モデルから計算したものかを添えて報告します。以下の六つが Kshana の運用上の FoM です。

seg-b229a69fb4ac = <b>測位・タイミング性能</b> — 誤差の大きさを、RMS（二乗平均平方根、二次平均）と 95 パーセンタイルで示します。

seg-ba3ed5a28518 = <b>自律性</b> — ホールドオーバー時間（GNSS なしで仕様内にとどまる時間）です。

seg-13ecdd037098 = <b>レジリエンス</b> — GNSS を失った後に誤差がどれだけ速く増大するかです。

seg-be0168f24d6e = <b>可用性</b> — 実行のうち、仕様内の解が得られた時間の割合です。

seg-44ef500b371d = <b>インテグリティ</b> — <em>システム自身による誤差の推定を信頼できるか。</em>Kshana は、途絶中のサンプルのうち、真の誤差がフィルターの保護境界内に収まった割合を報告します。

seg-d1cc3819cde9 = <b>セキュリティ</b> — スプーフィングへの頑健性です。クロック安定度に基づくスプーフィング検出可能性スコア（{ "v0.3.0" } 以降）で、スプーフィング攻撃シナリオを設定した場合にのみ意味を持ちます。これは航空用グレードのインテグリティでは<em>ありません</em>。水平・垂直の保護レベル（HPL/VPL）は計算せず、受信機自律インテグリティ監視（RAIM）も、高度化したものを含めて実行しません。それらは別のインテグリティおよび ARAIM（高度 RAIM）のシナリオ種別が担い、下の「インテグリティと補強」で定義しています。輸出管理の対象となる可能性があります。

seg-5cae59204d9e = 性能指標とあわせて使われる用語：

seg-7adc0e49a981 = <b>スプーフィング。</b>平たく言えば、<em>位置や時刻について嘘をつく偽の衛星信号</em>です。スプーフィングを行う側は、もっともらしいが誤った答えを受信機に与えます。受信機が気づかないことがあるため、ジャミングより悪質です。

seg-2d2e6cbeade6 = <b>1-DOF — 一自由度。</b>単一の軸です。Kshana のシナリオパックの位置誤差は単一軸であり、完全な 3 次元の答えには三軸モデルが必要です。

seg-14a32d281c4b = <b>モンテカルロ・アンサンブル。</b>同じシナリオを異なる乱数シードで何度も実行し、一回の実行ではなく結果のばらつきを報告します。

seg-fcbea49a3592 = <b>CI — 信頼区間（confidence interval）。</b>ある統計量が、定められた確率（たとえば { "95" } %）で収まると期待される範囲です。README の表やバッジでは、「CI」はむしろ<b>継続的インテグレーション</b>、つまり変更のたびに実行される自動のビルドとテストを指すことが多く、どちらかは文脈で決まります。

seg-310abfd6a64c = <b>k シグマ境界。</b>フィルター自身の不確かさの標準偏差の <em>k</em> 倍に設定した境界です。インテグリティの性能指標は、真の誤差がその内側にとどまる頻度を数えます。

seg-ad26afbaa7b4 = <b>CEP / 2DRMS — 半数必中界 / 二乗平均平方根距離の二倍。</b>2 次元の水平精度を表す 二つの標準的な方法です。CEP は測位解の { "50" } % を含む半径、2DRMS は水平方向の二乗平均平方根誤差の二倍です。ライブラリは位置共分散（<c1/>）から両方を計算できますが、現時点でそれらを報告するシナリオ種別はありません。

seg-fd93c1effba8 = 結果の読み方：出力に現れる用語

seg-3432498093cf = 結果ファイルやプレイグラウンドの要約で出会う名前を、まず平たく説明します。

seg-099bf2eb4602 = <b>ホールドオーバー（<c1/>）。</b>平たく言えば、<em>GNSS を失った後、システムが誤差限界内にとどまった秒数</em>です。Kshana は、実行内のすべての途絶にわたって最も短い惰行時間を、実行の時間グリッド上で測って報告するため、時間刻みの分解能における下限値になります。ホールドオーバーが途絶の長さと等しい場合は、限界を一度も超えなかったことを意味します。

seg-e68708a219f1 = <b>p95（<c1/>）。</b>平たく言えば、<em>{ "95" } % の時間で、タイミング誤差がこの値以下だった</em>ということです。途絶中の誤差の 95 パーセンタイルです。非常に小さい値は、短い要約では <c2/> と表示されることがあります。結果の JSON（JavaScript Object Notation）ファイルには、完全な精度の数値が入っています。

seg-4dfaee63262d = <b>インテグリティ（<c1/>）。</b>平たく言えば、<em>システム自身の誤差推定がどれだけ誠実だったか</em>です。途絶中のサンプルのうち、真の誤差がフィルターの k シグマ境界（下で定義）の内側にとどまった割合です。{ "1" } に近い値は、推定器が自らの誤差を過小評価しなかったことを意味します。これは航空用の保護レベルではありません。下の「インテグリティと補強」と <a1><c2/></a1> を参照してください。

seg-5af09f5129e0 = <b>セキュリティスコア（<c1/>）。</b>平たく言えば、<em>スプーフィング攻撃が検出される可能性</em>です。設定された攻撃が検出される確率、つまり 一から見逃し確率 <c2/> を引いたものであり、時計の安定度から導かれます。シナリオでスプーフィング攻撃を設定した場合にのみ意味を持ちます。攻撃が設定されていないとき、一行の要約は <c3/> と表示し、結果は <c5/> ブロックでこの指標を <c4/> とします。値は文書に残り、「適用外」を意味するのであって、「セキュリティがゼロ」という意味ではありません。

seg-70113d509997 = <b>PDOP — 位置の精度低下率（<c1/> などのキー）。</b>平たく言えば、<em>衛星配置が測距誤差を位置誤差へどれだけ拡大するか</em>です。位置誤差はおおよそ PDOP に測距誤差を掛けた値になるため、小さいほど良好です。「推定と幾何」の <b>DOP</b> を参照してください。

seg-a445bf9a3c5f = <b>sigma_y（<c1/>、アラン偏差）。</b>平たく言えば、<em>時間 <c2/> で平均したとき、時計の周波数がどれだけ揺らぐか</em>です。<c3/> のようなデータシートの記載は、一秒で平均した周波数が 10¹⁰ 分の約 { "3" } 変動することを意味します。小さいほど安定した時計です。上の「安定度の測り方」を参照してください。

seg-03b4bb05148d = <b>q_wf — ホワイト周波数ノイズの強度。</b>平たく言えば、<em>時計の周波数に生じる速くランダムなジッターの強さ</em>です。ホワイト周波数ノイズについて <c1/> の係数にあたるため、シナリオはデータシートの一秒のアラン偏差から <c2/> を設定します。関連するものに <c3/>（ランダムウォーク周波数ノイズ）と <c4/>（エージング）があります。上の「誤差のモデル化」を参照してください。

seg-074a1337ed99 = 通信タイミングの用語

seg-9f61398628e4 = 通信ネットワークは、GNSS で駆動される基準時計から、パケットネットワーク（Precision Time Protocol）で時刻を配信します。国際電気通信連合 電気通信標準化部門（ITU-T）は、各時計が加えてよい時刻誤差の限度を定めています。これらの用語は <c1/> 種別に現れます。<a1><c2/></a1> を参照してください。

seg-f48712300b30 = <b>TE — 時刻誤差（time error）。</b>平たく言えば、<em>ある瞬間における、時計の時刻と基準時刻とのずれ</em>です。正負があり、通常はナノ秒で表します。

seg-ceda70656c6a = <b>max|TE| — 最大絶対時刻誤差。</b>平たく言えば、<em>測定中に見られた最悪の時刻誤差を、符号を無視して見たもの</em>です。多くのマスクが定める主要な限度です。

seg-38d2922cd91d = <b>cTE — 定常時刻誤差（constant time error）。</b>平たく言えば、<em>時刻誤差のうち一定のオフセット分</em>、つまり測定中に変化しない平均誤差です。

seg-a4a61df332cd = <b>dTE — 動的時刻誤差（dynamic time error）。</b>平たく言えば、<em>時刻誤差のうち揺らぐ分</em>、つまり定常オフセットを除いた後に残るものです。MTIE と TDEV で評価します。

seg-31c0a85788b1 = <b>MTIE — 最大時間間隔誤差（maximum time interval error）。</b>平たく言えば、<em>ある長さの任意の窓の中で見られる、時刻誤差の最大の振れ</em>です。窓の長さごとに、記録に沿って窓をスライドさせ、最大のピーク間変化を取ります。マスクは窓の長さごとに許容される最大値を与えます。

seg-53fa12cab0c6 = <b>TDEV — 時間偏差（time deviation）。</b>平たく言えば、<em>短期のジッターを平均して除いた後の、ある平均化時間における時刻誤差の典型的な（二乗平均平方根の）ゆらぎ</em>です。アラン偏差の時間領域における親戚にあたり、MTIE と同様にマスクと照合して確認します。

seg-62b5eea14f6c = <b>PRTC — 一次基準時刻クロック（primary reference time clock）。</b>通信タイミングチェーンの最上位にある時計で、通常は GNSS で制御されます。性能限度は ITU-T 勧告 G.8272 にあります。

seg-8d6d4538981b = <b>ePRTC — 拡張一次基準時刻クロック（enhanced primary reference time clock）。</b>時刻誤差の限度がより厳しい PRTC で、非常に安定したローカルの原子時計を備えており、長い GNSS 喪失の間も時刻を保てます。ITU-T 勧告 G.8272.1。

seg-93fa4ac7c6fa = <b>T-BC — 通信用バウンダリークロック（telecom boundary clock）。</b>上流から時刻を受け取り、下流へ渡すネットワーククロックで、自身でもわずかな時刻誤差を加えます。ITU-T 勧告 G.8273.2。

seg-52d32a5db6b8 = <b>T-TSC — 通信用タイムスレーブクロック（telecom time slave clock）。</b>チェーンの末端で時刻を受け取り、それを必要とする機器（たとえば無線基地局）へ供給する時計です。これも ITU-T 勧告 G.8273.2 の対象です。

seg-04d8ed12ca88 = <b>OCXO — 恒温槽付き水晶発振器（oven-controlled crystal oscillator）。</b>小さな恒温槽の中で一定温度に保たれた水晶発振器で、通常の水晶発振器よりはるかに安定します。ネットワーク機器でよく使われるホールドオーバー用の時計で、数日のうちにかなりエージング（ドリフト）します。

seg-6742f7ba35ac = <b>CSAC — チップスケール原子時計（chip-scale atomic clock）。</b>非常に小型の原子時計です（上の「Kshana が比較するセンサー」を参照）。長いホールドオーバーでは OCXO より安定しますが、コストと消費電力は高くなります。

seg-c0e0c18bd867 = エビデンスのティア：VALIDATED、MODELLED、PARTNER

seg-61c0aa107fd9 = 機械でチェックされる検証マトリクス（<a1><c1/></a1>）のすべての機能には、三つのティアのいずれかが付きます。

seg-13fb20435df3 = <b>VALIDATED。</b>平たく言えば、<em>他者の答えと照合して確認したもの</em>です。その機能の出力を、独立した外部のオラクル（実測データ、他者が書いた独立したライブラリ、公表された基準値）と比較し、定められた許容差の範囲内で一致しました。外部のオラクルを挙げていない VALIDATED の行は、継続的インテグレーションのチェックで拒否されます。

seg-a5dfb48e4dcb = <b>MODELLED。</b>平たく言えば、<em>確かな物理に基づいて構築し、内部の整合性は確認したが、外部の答えとはまだ比較していないもの</em>です。数値は比較や設計上のトレードオフには意味がありますが、実機がその通りに動作する証拠ではありません。<a1><c1/></a1> は、そうした各行がなぜモデルによる計算なのかを説明しています。

seg-0512b2d2145a = <b>PARTNER。</b>平たく言えば、<em>この部分はハードウェアまたは製品保証のパートナーの担当であり、Kshana はそれについて何も主張しません</em>。ギャップが黙って見過ごされず、見えるようにするために、この行が存在します。

seg-278dee6d3d4c = スペクトルと干渉の用語

seg-285a240c9958 = これらの用語は <c1/> 種別に現れます。<a1><c2/></a1> を参照してください。

seg-db4fdef1c562 = <b>BPSK(n) — n × { "1.023" } Mchip/s の二相位相偏移変調（binary phase-shift keying）。</b>GPS L1 の C/A（coarse/acquisition）と L2 民生用（L2C）（n = { "1" }）、および GPS L5 と Galileo E5a（n = { "10" }）の矩形チップ変調です。スペクトルは sinc² で、n × { "1.023" } MHz ごとにヌルがあります。

seg-cdd0f4194f42 = <b>BOC(m, n) — バイナリオフセットキャリア（binary offset carrier）。</b>n × { "1.023" } Mchip/s の拡散符号に、m × { "1.023" } MHz の方形波サブキャリアを掛けたもので、スペクトルは搬送波の両側の 二つのローブに分かれます。

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — 多重化バイナリオフセットキャリア（multiplexed binary offset carrier）。</b>パワースペクトル密度は 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }) で、Galileo E1 オープンサービスと GPS L1C で合意されています。Galileo はこれを複合 BOC（CBOC）として送信します。

seg-7423f94e3018 = <b>CW — 連続波（continuous wave）。</b>変調されていない搬送波、つまり単一のトーンです。

seg-55d03dd4af03 = <b>J/S — ジャマー対信号比（jammer-to-signal ratio）。</b>受信したジャマー電力を受信した信号電力で割った値で、デシベルで表します。

seg-b0f2974647d4 = <b>SSC — スペクトル分離係数（spectral separation coefficient）。</b>κ = ∫ G_s(f) G_j(f) df（受信機の帯域にわたる積分）です。単位電力の干渉波のスペクトルのうち、どれだけが信号のスペクトルと重なる位置に入るかを表します。実効的な搬送波対雑音密度比は [1/(C/N₀) + (J/S)·κ]⁻¹ です。

seg-c5affeee5269 = <b>雑音指数。</b>受信機が熱雑音にどれだけ上乗せするかを、デシベルで表す比 F として示したものです。システム雑音温度は T_ant + { "290" } K × (F − { "1" }) です。

seg-5307c38d3036 = <b>ウォーターフォール。</b>スペクトルの時間周波数の表示です。横に周波数、下方向に時間、色で電力を表します。

seg-3b1ac094fdc5 = <b>ウェルチ推定。</b>窓をかけて重ね合わせたピリオドグラムを平均して推定するパワースペクトル密度です（Welch { "1967" }）。

seg-9901d64fb895 = <b>SigMF — 信号メタデータフォーマット（Signal Metadata Format）。</b>オープンな記録フォーマットで、サンプルの生の <c2/> ファイル（ここでは複素 <c3/>、<c4/>、または <c5/>）を記述する JSON の <c1/> ファイルからなります。

seg-83041671f422 = <b>IQ — 同相と直交（in-phase and quadrature）。</b>複素ベースバンドサンプルの 二つの成分です。

seg-39e6ea8506b3 = LEO-PNT 信号の用語

seg-36452ee3f5cc = これらの用語は <c1/> 種別と、複数帯域の <c2/> シナリオに現れます。<a1><c3/></a1> を参照してください。

seg-8363a15f3c5a = <b>LEO-PNT — 低軌道の測位・航法・時刻（low Earth orbit positioning, navigation and timing）。</b>高度数百 km から約 { "1200" } km の衛星から放送される航法信号です。中軌道の GNSS より強く、速く移動します。

seg-523469643156 = <b>RNSS、RDSS、MSS、EESS — 無線航行衛星業務、無線測位衛星業務、移動衛星業務、地球探査衛星業務（Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service）。</b>ある帯域が属しうる ITU（国際電気通信連合）の業務分類です。

seg-d1e494623341 = <b>パイロット、データ、捕捉の各成分。</b>一つの信号を構成する部分です。測距用のデータなしのパイロット、航法メッセージを運ぶデータ成分、そして見つけやすい短くて低レートの捕捉成分があります。

seg-cce232b7cd6a = <b>FDMA — 周波数分割多元接続（frequency-division multiple access）。</b>符号ではなく搬送波周波数によって、成分や衛星を分離する方式です。

seg-9d9476ee62b1 = <b>ガボール（RMS）帯域幅。</b>β = √(∫ f² G df / ∫ G df)（受信機の帯域にわたる積分）です。信号の電力が周波数上でどれだけ広がっているかを表し、どれだけ細かく測距できるかを決めます。

seg-6febe9c2e506 = <b>DLL — 遅延ロックループ（delay lock loop）。</b>符号追尾ループです。アーリー・レイト相関器の間隔と雑音帯域幅が、熱雑音による測距ジッターを決めます。

seg-5a55da97daf9 = <b>EFQPSK — 拡張フェーア直交位相偏移変調（enhanced Feher quadrature phase-shift keying）。</b>定包絡線の変調です（Xona Pulsar）。ここでは矩形チップのスペクトルで近似しています。

seg-6dcbf1de9904 = <b>OFDM — 直交周波数分割多重（orthogonal frequency-division multiplexing）。</b>マルチキャリアの波形です（Starlink のダウンリンク）。ここでは平坦な帯域として描いています。

seg-548b285c7c8e = <b>TEC — 全電子数（total electron content）。</b>経路に沿った 平方メートルあたりの電子数です。{ "1" } TECU = 10¹⁶ el/m²。一次の電離圏遅延は { "40.3" }·TEC/f² メートルです。

seg-dd7e0743f364 = <b>EIRP — 等価等方輻射電力（effective isotropic radiated power）。</b>送信電力に、受信機方向へのアンテナ利得を掛けたものです。

seg-aba3b3eaba85 = インテグリティと補強

seg-eab1b2c6728e = インテグリティは<em>信頼</em>の問いです。「自分の誤差はどれだけ大きいか」ではなく、「それを境界で抑えられるか、境界が破られたときに知らされるか」です。これは、そのための航空分野の用語です。

seg-696a73449c49 = <b>RAIM — 受信機自律インテグリティ監視（Receiver Autonomous Integrity Monitoring）。</b>平たく言えば、<em>受信機が衛星どうしを突き合わせて確認すること</em>です。測位解に必要な 四機より多くの衛星があれば、余りの分（残差）は小さいはずです。残差が大きければ、ある衛星が嘘をついているということであり、受信機は地上の助けなしにそれを知らせることができます。<a1><c1/></a1> に実装されています。

seg-89237433f01a = <b>ARAIM — 高度受信機自律インテグリティ監視（Advanced Receiver Autonomous Integrity Monitoring）。</b>RAIM の現代的な、二周波・複数コンステレーションの形です。各衛星の想定誤差と故障確率を示すインテグリティ支援メッセージを受け取り、合否のフラグではなく保護レベルを返します。すべての前提を含む詳細な扱いは <a1><c1/></a1> にあります。

seg-4cc13de05193 = <b>SISRE — 信号空間測距誤差（Signal-in-Space Range Error）。</b>平たく言えば、<em>衛星が放送する軌道と時計によって、典型的なユーザーが測る距離がどれだけずれるか</em>です。軌道誤差を径方向、進行方向、軌道面直交方向の成分に分け、それぞれが平均的な視線方向にどれだけ現れるかで重み付けし、時計誤差と合成します（Montenbruck et al. { "2018" }）。低軌道衛星では、ユーザーが天底から大きく離れた方向から見るため、進行方向と軌道面直交方向の成分の重みが GPS よりはるかに大きくなります。<c1/> 種別で使用します。

seg-847e40a033e1 = <b>RAC — 径方向、進行方向、軌道面直交方向（Radial, Along-track, Cross-track）。</b>軌道誤差を分解する 三つの方向で、地球の中心から外向き、飛行方向、軌道面に垂直な方向です。<c1/> 種別の <c2/> モデルは、それぞれに補正多項式を加えます。

seg-b725d23c839e = <b>SVID — 衛星識別子（Space-Vehicle Identifier）。</b>航法メッセージが、送信した衛星を指すために使う番号です。

seg-b0f850eb04b1 = <b>IOD — データ発行番号（Issue of Data）。</b>衛星の航法メッセージの内容が変わるたびに変化するカウンターで、受信機が新しいメッセージと繰り返しを区別できるようにします。（IOD と略される軌道上実証（in-orbit demonstration）、たとえば ESA の Celeste IOD とは別物です。）

seg-985a5e9c9ce9 = <b>TOW — 週内時間（Time of Week）。</b>現在の GNSS 週の始まり（日曜日の { "00" }:{ "00" }）からの秒数です。

seg-1fc62dca46d6 = <b>CRC-24Q — 24 ビット巡回冗長検査（Qualcomm 多項式）。</b>RTCM { "10403" } と Galileo のメッセージが持つ誤り検出用のチェックで、メッセージのビット列を多項式 <c1/> で割った 24 ビットの剰余です。受信機はこれを再計算し、一致しないメッセージを破棄します。

seg-abb4679dab23 = <b>URE — ユーザー測距誤差（User Range Error）。</b>平たく言えば、<em>衛星自身が放送する軌道と時計によって、その衛星へのすべての距離がどれだけ誤るか</em>です。信号空間誤差（SISE）とも呼ばれ、ARAIM と RAIM に与える衛星ごとの誤差予算です（<a1><c2/></a1> の <c1/>）。

seg-158c210fd3fe = <b>MHSS — 複数仮説解分離（Multiple Hypothesis Solution Separation）。</b>ARAIM が用いる手法です。コンステレーションに起こりうる故障の仕方ごとに、疑わしい衛星を除外した解を作り、その部分解が全可視衛星による解からどれだけ離れうるかを境界で抑えます。

seg-671711003a6f = <b>HPL / VPL — 水平 / 垂直保護レベル（Horizontal / Vertical Protection Level）。</b>平たく言えば、<em>定められたインテグリティリスクのもとで、真の誤差がその内側にあるとシステムが約束する半径</em>です。測定された誤差ではなく、アルゴリズムが計算する境界です。保護レベルが、その運用で許容されるアラート限界（VAL は垂直アラート限界、HAL は水平アラート限界）を下回っている間、その実行は利用可能です。

seg-5bbd2d664862 = <b>SBAS — 衛星型補強システム（Satellite-Based Augmentation System）。</b>GNSS を監視し、補正値とインテグリティ境界を計算して、静止衛星から放送する地上ネットワークです。<b>WAAS — 広域補強システム（Wide Area Augmentation System）</b>は米国のもの、EGNOS（欧州静止衛星航法オーバーレイサービス）は欧州の対応するものです。Kshana は、DO-229E の重み付き最小二乗の形式で保護レベルを計算します（DO-229E は SBAS 受信機に対する RTCA の最低運用性能基準で、RTCA はかつての Radio Technical Commission for Aeronautics です）（<a1><c1/></a1>）。

seg-ba8b448582af = 推定と幾何

seg-2eb6e72496b8 = <b>推定器。</b>センサーモデルに基づいて、途絶中の真の位置・時刻を予測するアルゴリズムです。Kshana には、解析的なホールドオーバー予測器と<b>カルマンフィルター</b>があります。

seg-9b4aa612c5a9 = <b>カルマンフィルター。</b>平たく言えば、<em>ある量を追跡すると同時に、その不確かさも追跡するアルゴリズム</em>です。Kshana は、その不確かさの境界を使ってインテグリティを計算します。

seg-8fda81dfccc9 = <b>EKF — 拡張カルマンフィルター（Extended Kalman Filter）。</b>非線形の問題に対するカルマンフィルターで、各ステップで現在の推定値の周りでモデルを線形化します。GNSS と INS を結合する際の標準的な選択です。

seg-9bc2c6f74b29 = <b>UKF — アンセンテッドカルマンフィルター（Unscented Kalman Filter）。</b>線形化せずに同じ役割を果たします。決定論的に選んだ少数のサンプル点を真の非線形モデルに通し、それらが落ち着いた位置から平均と共分散を再構成します。非線形性が強い場合にもよく振る舞うため、軌道決定にはこれを使っています。

seg-a1e52820e3a0 = <b>DOP — 精度低下率（Dilution Of Precision）。</b>平たく言えば、<em>衛星の配置が測距誤差を位置誤差や時刻誤差へどれだけ拡大するか</em>です。位置誤差 ≈ PDOP × 測距誤差なので、小さい値は良好な配置を意味します。系列は次のとおりです。<b>GDOP</b>（幾何：位置と時刻を合わせたもの）、<b>PDOP</b>（位置）、<b>HDOP</b>（水平）、<b>VDOP</b>（垂直）、<b>TDOP</b>（時刻）。

seg-e769a91a3e4b = <b>ウォーカー・コンステレーション。</b>衛星コンステレーションを、軌道面の数と 一面あたりの衛星数で記述する標準的な方法です（GPS はおおよそ 24/6 のウォーカーシェルです）。

seg-b557933a4e4d = <b>仰角マスク。</b>衛星を利用可能とみなす、ローカルな水平線からの最小角度です。これより低い信号は除外されます。

seg-3ac8e11c3e33 = <b>掩蔽。</b>地球が衛星への視線を物理的に遮ることです。

seg-249bf472cb00 = <b>スカイライン（スカイラインマスク）。</b>平たく言えば、<em>建物、クレーン、丘が空に描く輪郭を、方位ごとの仰角として表したもの</em>です。衛星は、その方位での <c1/> より上にあるときだけ可視とみなされ、マスクより上でもスカイラインの背後にある衛星は「スカイラインによってマスクされた」ものとなります。Kshana は、表、ストリートキャニオン、セクター、地形（それらの点ごとの最大値）、または REPRESENTATIVE のプリセットから作成します。扱うのは視線のみで、反射や回折は含みません（<a1><c2/></a1>）。

seg-620a88820a2d = <b>天空の幾何。</b>スカイラインのもとで、ある地点にどの衛星が見え、それが解にどう影響するかです。DOP の各係数、最小二乗解の東・北・上の共分散とその<b>誤差楕円</b>、そして独立で等しいガウス分布の距離誤差を仮定したときに、測位解のうち定められた割合（既定は { "95" } %）を含む水平領域を示します。これは定められた誤差モデルのもとでの MODELLED の幾何であり、受信機の実際の誤差ではありません（<a1><c1/></a1>）。

seg-f0e610122425 = <b>CTI — 合成タイミングインテグリティ（Composed Timing Integrity）。</b>位置ではなく<em>時刻</em>の保護レベルで、異なる時刻源の間の切り替え、たとえば衛星で検査された（RAIM が利用可能な）時計から、ホールドオーバー中の自走時計への切り替えをまたいで計算されます。これにより、遷移の間も境界が有効に保たれます（<a1><c1/></a1>）。

seg-56642f614c3f = <b>TIB — タイミングインテグリティ・ベンチマーク（Timing Integrity Benchmark）。</b><em>他者の</em>タイミング監視装置のための物差しです。さまざまな故障を注入し、その監視装置が示す保護レベルが実際に誤差を抑えていたかを確認します。自らは精度についての主張をしないため、過大に主張することもありえません（<a1><c1/></a1>）。

seg-8b89f8b913b9 = 軌道とシスルナー

seg-ba6b669eb8ba = <b>CR3BP — 円制限三体問題（Circular Restricted Three-Body Problem）。</b>地球・月系を、共通の重心の周りを円軌道で回る 二つの天体と、引き戻すことのできない軽い宇宙機として扱うものです。月の近くでは、二体のケプラー楕円は形そのものが誤りであり、CR3BP は正しい力学のなかで最も低コストなものです（<a1><c1/></a1>）。

seg-2726a22bf14c = <b>NRHO — 近直線ハロー軌道（Near-Rectilinear Halo Orbit）。</b>周期的な CR3BP 軌道で、月の一方の極の上空を近くで通り、もう一方の極の上空では遠くまで離れます。そのため真横から見ると、ほぼ直線になるので「近直線」と呼ばれます。月周回ゲートウェイに選ばれた軌道で、地球とのほぼ連続した視線を保ちます。

seg-2b2e6d04376c = <b>DRO — 遠方逆行軌道（Distant Retrograde Orbit）。</b>もう一つの CR3BP の軌道族で、回転座標系から見て月の周りを逆向きに回る、大きく安定した軌道です。

seg-6bb9229aee5c = <b>EOP — 地球姿勢パラメーター（Earth Orientation Parameters）。</b>地球のわずかに不規則な揺れと自転を実測したもの（極運動、UT1（世界時 { "1" }、地球自転時）−UTC — 地球自転時から協定世界時を引いたもの — そして日長）で、地球固定の位置をメートル未満の精度で慣性系の位置に変換するために必要です。IERS（国際地球回転・基準系事業）が公表しており、Kshana は <c2/> を通じてその <c1/> ファイルを読み込みます。

seg-7f1e7e523e5b = 標準、フォーマット、組織

seg-5d8d6144c13a = README とパッケージのページが、標準、ファイル形式、時刻系、座標系、およびそれらを支える団体について使う略語です。それぞれ、それらのページで最初に使われる箇所でも正式名称を示しています。

seg-800d42de0777 = 軌道、座標系、時刻

seg-320a1594dcf1 = <b>SGP4 / SDP4 — 簡易一般摂動 { "4" } / 簡易深宇宙摂動 { "4" }。</b>公表されている衛星軌道に対する標準的な解析的伝播器です。

seg-87a098568846 = <b>TLE — 二行軌道要素（two-line element set）。</b>SGP4 が読み込む公開の軌道フォーマットです。

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — 低軌道 / 中軌道 / 静止トランスファー軌道 / 傾斜静止軌道（low Earth orbit / medium Earth orbit / geostationary transfer orbit / inclined geosynchronous orbit）。</b>軌道の領域です。GNSS 衛星の大半は MEO を飛行します。

seg-1ec323dbd7a6 = LMO — 低火星軌道（low Mars orbit）。

seg-d0be640282af = <b>ECI / ECEF — 地球中心慣性 / 地球中心・地球固定（Earth-centred inertial / Earth-centred, Earth-fixed）。</b>地球とともに回転しない座標系と、回転する座標系です。

seg-09a937adc1db = <b>TEME — 真赤道・平均春分点（true equator, mean equinox）。</b>SGP4 が出力する座標系です。

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — 地心天球基準系 / 国際地球基準系 / その実現である国際地球基準座標系（Geocentric Celestial Reference System / International Terrestrial Reference System / International Terrestrial Reference Frame）。</b>現代の慣性系と地球固定系です。

seg-56b24c3734be = <b>CIO — 天球中間原点（Celestial Intermediate Origin）。</b>春分点を用いない現代の地球自転の変換系列における基準点です。

seg-a23b05c85a63 = <b>LVLH — 局所鉛直・局所水平（local vertical, local horizontal）。</b>宇宙機とともに動く座標系です。

seg-ac37217cda0d = <b>WGS-84 — 世界測地系 { "1984" }。</b>GPS が使用する地球楕円体です。

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — 協定世界時 / 国際原子時 / 地球時 / 世界時 { "1" }（地球自転時） / 太陽系力学時。

seg-ea7eb1f34cae = <b>LTC / TCL — 月座標時（Lunar Coordinate Time、Temps-Coordonnée Lunaire）。</b>月のために提案されている時刻系です。

seg-c6e5976d9dff = <b>OD — 軌道決定（orbit determination）。</b>追跡測定から軌道を復元することです。

seg-dcb9e011c868 = <b>CR3BP</b>、<b>NRHO</b>、<b>DRO</b> は、上の「軌道とシスルナー」で定義しています。

seg-2e6ba9069396 = ファイル形式とメッセージ

seg-ed5ea0a21e3f = <b>SP3 — 標準プロダクト { "3" }。</b>国際 GNSS 事業（IGS）の精密軌道ファイル形式で、バージョン c と d があります。

seg-1bfa0d083935 = <b>RINEX — 受信機独立交換フォーマット（Receiver Independent Exchange Format）。</b>GNSS 観測データと放送エフェメリスの標準ファイル形式です。

seg-39ce08a9ae66 = IONEX — 電離圏マップ交換フォーマット（IONosphere map EXchange format）。

seg-c23ea3515008 = <b>OEM / OMM / TDM — 軌道エフェメリスメッセージ / 軌道平均要素メッセージ / 追跡データメッセージ（Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message）。</b>宇宙データシステム諮問委員会（CCSDS）による、軌道と追跡データの標準メッセージです。

seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language。</b>Kshana のシナリオのプレーンテキスト形式です。

seg-2795dff8d607 = <b>KIF — Kshana 交換フォーマット（Kshana Interchange Format）。</b>Kshana のバージョン付きで自己記述的な結果のエンベロープです。

seg-cd048e90fa3f = <b>DO-229E / DO-316。</b>SBAS 受信機、および航空機ベースの補強を伴う GPS 機上装置に対する RTCA の最低運用性能基準です。

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705。</b>GPS のインターフェース仕様です（後者は L5 信号を扱います）。

seg-2230000aa30b = <b>NIST SP { "1065" }。</b>米国国立標準技術研究所の<em>周波数安定度解析ハンドブック（Handbook of Frequency Stability Analysis）</em>です。

seg-8b89719c1859 = <b>TRL — 技術成熟度レベル（technology readiness level）。</b>ハードウェアの成熟度を 1 から 9 で表す尺度です。

seg-16c972f4ea0a = 組織

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — 欧州宇宙機関、その欧州宇宙運用センター、およびその欧州宇宙追跡ネットワークです。

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — 米国航空宇宙局、そのジェット推進研究所、SPICE（Spacecraft, Planet, Instrument, C-matrix, Events）ツールキットを公開している航法・補助情報施設（Navigation and Ancillary Information Facility）、およびその深宇宙ネットワークです。

seg-eaa5a2a51169 = <b>IGS</b> — 国際 GNSS 事業。<b>IERS</b> — 国際地球回転・基準系事業。<b>IAU</b> — 国際天文学連合（その SOFA ライブラリ（Standards of Fundamental Astronomy）と、そのオープンな移植版 ERFA（Essential Routines for Fundamental Astronomy）は、Kshana の座標系の参照です）。

seg-81af4c0f4c48 = <b>CCSDS</b> — 宇宙データシステム諮問委員会。<b>AIAA</b> — 米国航空宇宙学会。<b>RTCA</b> — かつての Radio Technical Commission for Aeronautics です。

seg-aa0b395df17f = ソフトウェアとサプライチェーン

seg-b42188d3a6f4 = CLI — コマンドラインインターフェース（command-line interface）。

seg-198c591514ab = <b>MCP — Model Context Protocol</b>。Kshana のエージェントサーバーが話すプロトコルです。<b>IDE — 統合開発環境（integrated development environment）。</b>

seg-287bf61a1a16 = SBOM — ソフトウェア部品表（software bill of materials）。

seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>。Kshana のリリースが証明されているビルド来歴フレームワークです。

seg-7487c6f9ed18 = その他すべての略語、A から Z

seg-56f6039bb38a = リポジトリのドキュメント（<c1/> と 四つの README）で使われている略語のうち、上のどのセクションでも定義していないものすべてと、参照しやすいように重複して載せたいくつかです。各ページでも最初に使う箇所で略語を正式名称で示していますが、この表は、それらすべてを調べられる唯一の場所です。いくつかの項目は略語ではなく識別子や名前であり、その旨を示しています。

seg-c0dfa446e523 = 正式名称

seg-f272d28225ae = 登場する場面

seg-ffb0596f134b = 第三世代パートナーシッププロジェクト（Third Generation Partnership Project）

seg-77c1b4478387 = 非地上系ネットワークを含む 5G 標準を策定する団体

seg-eaf19768b977 = 第五世代移動通信ネットワーク

seg-692ddc163c55 = その非地上系ネットワーク（NTN）による測位を含む

seg-9524be916f07 = ABI

seg-0e8332db764b = アプリケーションバイナリインターフェース（application binary interface）

seg-762ea76708dc = Python の wheel タグ

seg-d419d06ed622 = ABMF

seg-b294c714487d = グアドループのル・ムールにある IGS 観測局

seg-586a8ea87638 = 四文字の観測局識別子

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = 交流（alternating current）

seg-9cfb5dc4b4bc = AC-Stark（光シフト）効果など

seg-90308009c536 = ADD

seg-49d97c65662d = アルゴリズム記述文書（Algorithm Description Document）

seg-493b5ceaa0fb = WG-C の ARAIM 基準機上アルゴリズム

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = アラン偏差 / 重複アラン偏差

seg-23c38ecbc543 = 上のアラン偏差を参照

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488、STIM300、3DM-GX3（GX3）

seg-4b642742f2d4 = 慣性センサーの型番（Analog Devices、Safran Sensonor、MicroStrain）

seg-c4c0a93477a8 = 略語ではなく識別子

seg-36743c7fe98e = AEM

seg-142ca108a070 = 姿勢エフェメリスメッセージ（Attitude Ephemeris Message）

seg-c34185a83d8e = CCSDS のメッセージ

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = 航空宇宙・電子システム部会（Aerospace and Electronic Systems Society）

seg-78692bf5addf = IEEE の

seg-f429be16014e = AF

seg-afa04bc28b42 = 平均化係数

seg-b3db60632b92 = アラン型推定器における、サンプル間隔の整数倍

seg-6097c4709542 = AFS

seg-7043ab3fe32b = 拡張順方向信号（Augmented Forward Signal）

seg-20380d29d286 = LunaNet の月航法信号

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = 自動利得制御

seg-750b8717220b = 受信機フロントエンドにおけるジャミングの指標

seg-31b864b910d5 = AHP

seg-f956cbe86552 = 階層分析法（Analytic Hierarchy Process）

seg-c2b63847e2dc = 多基準の重み付け手法（Saaty）

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = 人工知能 / 機械学習

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = アラート限界 / 水平アラート限界 / 垂直アラート限界

seg-1e52f04eb047 = インテグリティ監視装置が抑えなければならない誤差

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = 代替バイナリオフセットキャリア（alternative binary offset carrier）

seg-e3acb231cf4d = Galileo E5 の変調

seg-79b130764f97 = 算術平均・調和平均（の不等式）

seg-190b782b70ce = AOCS

seg-6459d9bce282 = 姿勢・軌道制御系

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = 信号捕捉 / 最接近時刻 / 信号喪失

seg-8b73e2c51498 = 地上局パスのイベント（LOS は視線も意味し、どちらかは文脈で決まります）

seg-27ceb7163571 = API

seg-7903f5ff4027 = アプリケーションプログラミングインターフェース

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = アプリケーションプロセス識別子

seg-55730824c8cf = CCSDS スペースパケットのヘッダーフィールド

seg-611cd7a0d378 = APS

seg-55842a648c47 = 米国物理学会（American Physical Society）

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = 垂直ガイダンス付き進入

seg-69a6cc8a532a = APV-I：水平アラート限界 { "40" } m、垂直アラート限界 { "50" } m

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = 平均ラン長

seg-08a5d53f813c = 変化検出器が警報を出すまでの平均時間

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = Arm プロセッサーアーキテクチャ / その 64 ビット版

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = 振幅スペクトル密度

seg-9fb629e35a25 = パワースペクトル密度の平方根

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = 天文単位

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = 曲線下面積 / 受信者動作特性

seg-4d65dbf47a5c = 検出器の評価

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = SRTM 標高タイルのオープンなミラーをホストしている

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = 建物侵入損失

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = バイアス不安定性

seg-ff2ba8692cbc = 慣性センサーのアラン偏差の平坦な最小値

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = 国際度量衡局（Bureau International des Poids et Mesures）

seg-6ec98084ac58 = Circular T を公表している

seg-4ff08facda60 = BKG

seg-d29da95f483c = ドイツ連邦地図・測地庁（Bundesamt für Kartographie und Geodäsie）

seg-ac4765a77015 = IGS データミラーを運営している

seg-a85954d9176e = BSD

seg-eb42c5807e5a = Berkeley Software Distribution

seg-a332a259125a = BSD ライセンスなど

seg-97764c651815 = BSP

seg-8f85848ee08a = バイナリ SPK

seg-6e01dca47581 = バイナリ形式の SPICE エフェメリスカーネルファイル

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = 二行軌道要素の抗力項

seg-628e6c686508 = CAI

seg-a2418a88886c = コールドアトム干渉計

seg-273a3b8d5385 = QUANTUM.md を参照

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation（量子加速度測定のための軌道上コールドアトム・ルビジウム干渉計 – パスファインダーミッション準備）

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = クリエイティブ・コモンズ / クリエイティブ・コモンズ 表示

seg-a1f55ee72524 = データまたはテキストのライセンス

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = 地殻変動データ情報システム（Crustal Dynamics Data Information System）

seg-5b3f50bed1f6 = NASA の宇宙測地アーカイブ

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = 累積分布関数

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = 定誤警報確率

seg-b38b56b63da6 = 捕捉検出器のしきい値規則

seg-46835ce9641a = 中国測地座標系 { "2000" }

seg-4dab086e5c3d = BeiDou の測地系

seg-8f7751d39781 = CIP

seg-e34a194da574 = 天球中間極（Celestial Intermediate Pole）

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = 天球中間基準系（Celestial Intermediate Reference System）

seg-a543c4d02ace = CISA

seg-c34a7f26944d = サイバーセキュリティ・インフラストラクチャセキュリティ庁（Cybersecurity and Infrastructure Security Agency）

seg-59c481cb5741 = 米国 DHS の

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = 民生中（civil moderate）/ 民生長（civil long）

seg-cc0c8f1524f8 = GPS L2C の 二つの時間多重コード

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = 同相保護レベル（common-mode protection level）

seg-d469cd44d9d4 = 残差検定では見えない誤差の境界

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = 収束ニュートン（converged Newtonian）

seg-5d679a981a34 = SPICE の光行時間収差補正

seg-3da9a2841b6c = C/N0（C/N₀）

seg-cf60da0631b4 = dB-Hz 単位

seg-f4488db8194d = COPRAS

seg-6379891c1750 = COmplex PRoportional ASsessment（複合比例評価）

seg-b99fe66bd09c = 多基準のランキング手法

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = 宇宙空間研究委員会（Committee on Space Research）

seg-235850ad0d1f = 国際衛星識別符号を発行している

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = 一周回あたりのサイクル数

seg-a1d4080ce019 = 軌道周波数での経験的な軌道加速度

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = 中央処理装置 / グラフィックス処理装置 / ニューラル処理装置

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = クラメル・ラオ限界 / クラメル・ラオ下界

seg-6eb684e34f56 = 不偏推定量が達成しうる最小の分散

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = Consolidated laser Ranging Data format（統合レーザー測距データ形式）

seg-eb95135f849c = ILRS ノーマルポイントファイル

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = 受信パターン制御アンテナ

seg-7111b9c4d382 = 耐ジャミング用のアンテナアレイ

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = 整合比 / ランダム指数

seg-cfa91dc02138 = AHP の整合性チェック（CR < { "0.10" } を受理）

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = Orekit を保守しているフランスの企業

seg-58d5f143ff3b = 企業名であり、展開すべき略語ではありません

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = 符号シフトキーイング

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = カスケーディングスタイルシート（Cascading Style Sheets）

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = 累積和

seg-66f752e15abc = 逐次的な変化検出器

seg-92ac0357d01e = CV

seg-28f75c073917 = （時刻伝送におけるコモンビュー。どちらかは文脈で決まります）

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium Language

seg-fd0a7af2ebeb = CesiumJS の JSON シーン形式

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = デシベル / デシベルワット / デシベルヘルツ

seg-c485de5bcd85 = 電力比、絶対電力、および C/N0 の単位

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = 直流

seg-0ea7fccee332 = 周波数ゼロの極限

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = 方向余弦行列

seg-9d3d9ca79a9d = 回転行列

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = Developer Certificate of Origin（開発者原産証明）

seg-1545bd59f5ef = DCT

seg-8b6866288bea = 設計管理表

seg-80d95f099e9a = リンクバジェット表（JPL DESCANSO の Galileo X バンドの例）

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL 開発エフェメリス（バージョン { "421" }、{ "430" }、{ "440" }、{ "441" }）

seg-748af19e3f0b = 惑星・月のエフェメリス。「DE-grade」はその水準の精度を意味します

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = 数値標高モデル

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = 深宇宙通信・航法システム卓越センター（Deep Space Communications and Navigation Systems Center of Excellence）

seg-2e11a1976171 = JPL のモノグラフシリーズ

seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München（ミュンヘン工科大学ドイツ測地研究所）

seg-e7cedd55549e = EUROLAS データセンターをホストしている

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = 差動 GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = 国土安全保障省

seg-6b487421c547 = 米国

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = 国防総省

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = 自由度

seg-bf5bc69cb873 = 上の 1-DOF を参照

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = 差動片道測距 / デルタ差動片道測距

seg-6ba2d3b5b724 = 深宇宙の角度追跡

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = ドルマン・プリンス { "5" }({ "4" }) / ルンゲ・クッタ { "4" } / ルンゲ・クッタ { "5" } / ドルマン・プリンス { "8" }({ "5,3" })

seg-00ecc6de9912 = 数値積分器

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = 二乗平均平方根距離

seg-a8ed04890ded = 2DRMS を参照

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = Microchip のデータシート文書番号

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = 深宇宙原子時計（Deep Space Atomic Clock）

seg-e80350ed521f = NASA の捕捉水銀イオン時計

seg-52e838301c0b = UT1 から UTC を引いたもの

seg-fbce3b3b7b80 = 地球自転の補正

seg-8aa996f34920 = ビットあたりのエネルギー対雑音密度

seg-463b21c0b791 = 実行開始時に地球固定系と一致させた慣性系

seg-4dc987bd9dbf = leo-pass の相互運用エクスポートで使用

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = JavaScript の元になっている標準 / ES モジュール

seg-e1a4fd0a6a76 = 経験的 CODE 軌道モデル { "2" }

seg-2967e958f353 = GNSS の太陽輻射圧モデル（CODE：Center for Orbit Determination in Europe）

seg-244af4062ccc = ECSS

seg-b74029376aba = 欧州宇宙標準化協力機構（European Cooperation for Space Standardization）

seg-d452e23d503a = ECSS-E-ST-10-02 はその検証標準

seg-becb6685ff13 = ED

seg-b6448e14a567 = EUROCAE 文書

seg-ee4ada9c4c6e = ED-259A など

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = 進入・降下・着陸

seg-69f37001de44 = EEE

seg-18a1b66286ee = 電気・電子・電気機械（部品）

seg-f814c1301059 = 宇宙製品保証

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = 地球重力モデル（{ "2008" } 年版）

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques（新手法による欧州改良地球重力モデル）

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité（現実を表現する消去と選択）

seg-efb2f919955a = 優越関係に基づく多基準手法

seg-88a2f1813af8 = Éphéméride Lunaire Parisienne の MPP02 版（Chapront）

seg-b1d699d70339 = 解析的な月の理論

seg-aee5eeb23064 = J2000 の地球平均赤道・春分点

seg-16d9b8eac95d = 慣性系

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = 符号弁別器

seg-0e4110d33849 = EMT

seg-103c6de62575 = 有効監視しきい値

seg-4b2101113387 = ARAIM の出力

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = 東・北・上 / 北・東・下

seg-aae7610833a7 = 局所水平座標系

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = 地球観測

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = 惑星と月のエフェメリス（{ "2021" } 年版）

seg-bd2a27a17f6d = IAA RAS のエフェメリス

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = 地球回転角

seg-966ed500f705 = ESKF

seg-e79112a3132a = 誤差状態カルマンフィルター

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = 有効サンプルサイズ

seg-57ce1c1b617b = パーティクルフィルターの

seg-f529300f944b = ESSR

seg-869be8388d26 = 欧州宇宙ソフトウェアリポジトリ（European Space Software Repository）

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = エフェメリス時

seg-e0c49639649e = SPICE における TDB の呼び名

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = 欧州民間航空装置機関（European Organisation for Civil Aviation Equipment）

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = 欧州レーザーネットワーク

seg-fa7025d88c88 = 衛星レーザー測距と月レーザー測距

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = よくある質問

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = 連邦通信委員会

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = 全結合ニューラルネットワーク

seg-1de7b4410369 = FD

seg-4e73ff36d37f = 有限差分

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = 故障検出・除外

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = 有限要素解（Finite Element Solution）（{ "2004" } 年版）

seg-878b4a645ae9 = 海洋潮汐モデル

seg-55c14f474a10 = FIM

seg-b68c86e68570 = フィッシャー情報行列

seg-d39671724dfc = Fowler–Noll–Vo ハッシュ、バリアント 1a

seg-3354ad42f7dd = ゴールデン出力を固定するために使用

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = 完全運用能力 / 軌道上検証

seg-ce13cca7f222 = 衛星の世代（Galileo、Xona Pulsar）

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = 視野 / 瞬時視野

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = フィールドプログラマブルゲートアレイ / マイクロコントローラーユニット / リアルタイム OS

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = 自由空間損失 / 自由空間伝搬損失

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = ギガバイト / キロバイト / メガバイト

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = 地心天球基準座標系（Geocentric Celestial Reference Frame）

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = Geospatial Data Abstraction Library（地理空間データ抽象化ライブラリ）

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = 静止軌道

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = Geographic JavaScript Object Notation

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = 重力傾斜

seg-d8ef4d361e86 = 重力傾斜トルクなど

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = ギガヘルツ / キロヘルツ

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = 全球電離圏マップ

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = GNSS/INS 統合 / 武漢大学のカルマンフィルターによる GNSS/INS のデータセットとコード

seg-deca3cbe41ac = GIS

seg-36275ece527d = 地理情報システム

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = グリッド電離圏垂直誤差

seg-20a40777d78a = SBAS のメッセージ用語

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = ESA が配布している GNSS データ処理スイート

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = GNU C ライブラリ

seg-2630ae5f0bc5 = ロシアの全球測位衛星システム（Globalnaya Navigatsionnaya Sputnikovaya Sistema）

seg-361f1f18d454 = GLS

seg-397d58b727ee = 一般化最小二乗法

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = 重力パラメーター

seg-e3a296392ac0 = 万有引力定数に天体の質量を掛けたもの

seg-45a8f50bce06 = General Mission Analysis Tool（汎用ミッション解析ツール）

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = Goddard Mars Model { "3" }

seg-45abee95253b = 火星の重力場

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = グリニッジ平均恒星時

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = 誘導・航法・制御

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = Grid Processing On Demand

seg-14782f821cde = GR

seg-762f364a05f3 = 一般相対性理論

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = NASA ゴダードによる GRAIL の月重力モデル（GRAIL：Gravity Recovery and Interior Laboratory）

seg-220fae5cfc61 = 測地基準系 { "1980" }（Geodetic Reference System）

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = 地上サンプル間隔

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = 地上支援装置

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = ゴダード宇宙飛行センター

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = アダマール偏差 / 重複アダマール偏差

seg-bb846135ceb4 = ドリフトの影響を受けない安定度の尺度

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = ハードウェア・イン・ザ・ループ

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = 危険なほど誤解を招く情報 / 誤解を招く情報

seg-1cbf9d6f135d = スタンフォード・ダイアグラムの領域

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = HyperText Markup Language

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = ロシア科学アカデミー応用天文学研究所

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = 国際測地学協会

seg-e4d6251ec64d = IAGA / V-MOD（VMOD）

seg-01880debd7e0 = 国際地磁気学・超高層物理学協会 / その作業部会 V-MOD（地磁気モデリング）

seg-28805f15bae8 = IGRF を維持管理している

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = 初期条件

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = 国際民間航空機関

seg-c2d2d459177d = ICD

seg-a018300615e2 = インターフェース管理文書

seg-433b45040abd = Galileo OS SIS ICD など

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = 国際地球モデルセンター

seg-e9650a618b38 = ID

seg-e40875ab1090 = 識別子（または、ノイズ種別の ID のような識別）

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = 米国電気電子学会

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = インターネット技術タスクフォース / コメント募集

seg-ce9375732735 = IF

seg-746eae5ce367 = 中間周波数

seg-ed568f55aa8f = 受信機のサンプル

seg-cb4aaa2581bb = ITRF2014 の IGS による実現

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = 国際標準地球磁場

seg-669611e731d0 = IGRF-14（ファイル IGRF14.shc）は第14世代

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = 傾斜静止軌道

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on

seg-8a19be8033a9 = GPS 衛星の世代

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = 国際レーザー測距事業

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = 整数最小二乗法

seg-a214c483b8a8 = 整数値バイアスの決定（アンビギュイティ解決）

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides（天体力学・天体暦研究所）

seg-22048a770612 = パリ天文台。INPOP を公表している

seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris、バージョン 21a

seg-577acd29f11b = 惑星エフェメリス

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = 機関間運用諮問グループ（Interagency Operations Advisory Group）

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = 米国航法学会（Institute of Navigation） / その国際技術会議

seg-53abad80634c = IoT

seg-9b766d557bd1 = モノのインターネット

seg-1b41d114662e = IR

seg-ff2d89b32d07 = インテグリティリスク

seg-2dc9fcadccd6 = 危険なほど誤解を招く情報の確率

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = 無線技術者協会（Institute of Radio Engineers）

seg-3fbae7e11fca = IEEE の前身の一つ

seg-9e3d84279d56 = 二つの GNSS 間の時計オフセット

seg-2ffee4396fbd = ISL

seg-505dee046f7a = 衛星間リンク

seg-010ea5a76e2e = ISM

seg-330b25f923db = インテグリティ支援メッセージ

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = 国際標準化機構

seg-8291ac1ccba6 = ISO { "8601" } はその日時形式

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = 国際地球基準座標系 { "1993" } / { "2020" }

seg-14dc2a58e2c3 = 国際電気通信連合 無線通信部門

seg-0e8094e4d45c = その P シリーズ勧告が電波伝搬をモデル化している

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = 測地・天文測量のための国際 VLBI 事業

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = ユリウス日 / 修正ユリウス日

seg-996d4952554f = JMLR

seg-a1ef35b98931 = Journal of Machine Learning Research（機械学習研究ジャーナル）

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = Journal of the Optical Society of America（米国光学会誌）

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = 欧州委員会共同研究センター / その報告書番号の一つ

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript Object Notation

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

seg-919a951f3d02 = KF

seg-436a208697f1 = カルマンフィルター

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole Markup Language

seg-ffe25881cef6 = Google Earth が読み込む OGC 標準

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = Kshana 独自の LEO 航法メッセージのテキスト形式のレコード種別ラベル

seg-3269a4e6b3e3 = 標準ではなく Kshana の拡張

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = 重要業績評価指標

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = ケネディ宇宙センター

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = Keyword = Value Notation

seg-7379ade4ee0e = CCSDS メッセージのテキスト形式

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = Lunar Augmented Navigation Service（月補強航法サービス）

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = Linear Algebra PACKage（線形代数パッケージ）

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = 線形合同法による乱数生成器

seg-8927ca404e64 = NIST SP { "1065" } の試験系列の生成器

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = Lunar Communications and Navigation Services（月通信・航法サービス）

seg-5253cae4b05b = ESA の Moonlight サービス

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems（月通信中継・航法システム）

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = 線形フィードバックシフトレジスタ

seg-5b09c8e3f127 = 拡散符号の生成

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU Lesser General Public License

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = 反復対数の法則

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = ロック喪失指標 / 信号強度指標

seg-7d95179a5a1f = RINEX の観測フラグ

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = 月レーザー測距

seg-20deda97c876 = LLVM

seg-5a84a3219546 = LLVM コンパイラ基盤（もとは Low Level Virtual Machine）

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = レガシー航法メッセージ

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = 月航法・通信衛星システム

seg-4ce3c0ea7a31 = NAVIGATION { "70" }({ "4" })、navi.613 のコンステレーションのケーススタディ

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet Interoperability Specification（LunaNet 相互運用仕様）

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = Lunar Navigation Satellite System（月航法衛星システム）

seg-97ff1706b4bd = 提案されている月のコンステレーション

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = 垂直ガイダンス付きローカライザー性能 / その決心高 { "200" } ft の区分

seg-090ba62634a8 = 航空の進入方式

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = 月周回衛星 Lunar Reconnaissance Orbiter

seg-8f782bde5659 = LS

seg-c5bc49526464 = うるう秒

seg-54ea05b82cb4 = Δt_LS など

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = 光行時間

seg-4729314afd46 = LTE

seg-1a7e158f020f = Long-Term Evolution

seg-3c1b3acc46d9 = 4G のセルラー標準

seg-3530cdaca137 = LU

seg-58ad64b9d450 = 下三角・上三角（分解）

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = Lunar GNSS Receiver Experiment（月 GNSS 受信機実験）

seg-84874825a5d1 = { "2025" } 年に月へ飛行した

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = スタンフォード大学の月 PNT ライブラリ

seg-893ba320da76 = 名前

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool（MATLAB アルゴリズム可用性シミュレーションツール）

seg-a24b3840d248 = スタンフォード大学

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = 製造、組立、統合、試験

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = 火星、木星、土星の衛星に対する JPL の衛星エフェメリス解

seg-9b0688bfc31e = 識別子

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = 航空システム最低性能基準

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = MATrix LABoratory

seg-e722ea781fdf = 数値計算製品

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = 多属性効用理論

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = Mars Climate Database（火星気候データベース）

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = 多基準意思決定分析

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = 月中心慣性 / 月中心・月固定

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = 最小検出可能バイアス

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = 修正アラン偏差

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = 微小電気機械システム

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO（Métrologie Optique）、グラース・レーザー局 / マテーラ・レーザー測距観測所（Matera Laser Ranging Observatory）

seg-a8fcbefbbf4c = 月レーザー測距局

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = 平均地球 / 主軸

seg-f30f1a2778cf = 月の二つの天体固定座標系（MOON_ME、MOON_PA）

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = マルチ GNSS 実験（Multi-GNSS Experiment）

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = マサチューセッツ工科大学

seg-e9d7062835a9 = MIT ライセンスなど

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = 多層パーセプトロン

seg-6975432180f6 = 小規模なニューラルネットワーク

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = 日付の平均 / 日付の真

seg-1af66f9b771d = 赤道・春分点座標系

seg-b5db821f8008 = MOORA

seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis（比率分析に基づく多目的最適化）

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = 最低運用性能基準

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla Public License

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = Mars Reconnaissance Orbiter の重力モデル { "110" } と 110B2

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = サポートされる最小の Rust バージョン

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = 変調伝達関数

seg-7f60d1ac40ad = 光学撮像

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = 最小分散ひずみなし応答

seg-83f57219e5b7 = 適応ビームフォーミング

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = マイクロ波リンク

seg-639266912f59 = ACES の時刻伝送リンク

seg-5ac07401e4f8 = NaN

seg-722d679807ee = 非数

seg-0e4abc653325 = NavIC

seg-355821380384 = Navigation with Indian Constellation（インドのコンステレーションによる航法）

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = Navigation Innovation and Support Programme（航法革新・支援プログラム）

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = 航法（メッセージ） / 観測

seg-1729ddf0eafa = RINEX の二つのファイル種別。スタンフォード大学の NAV Lab は Navigation and Autonomous Vehicles Laboratory（航法・自律走行車研究室）

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = かつての米国国立標準局 / NBS14 周波数安定度の参照データセット

seg-3d1ac5146fea = アラン推定器の検査に使用

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = 正規化推定誤差二乗 / 正規化イノベーション二乗

seg-af167a77a1dc = フィルターの整合性検定

seg-beb7a86721ec = 米国国家地理空間情報局

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = 米国国立測地調査所 / 米国海洋大気庁

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = 米国国家画像地図局 / その技術報告書 TR8350.2（WGS { "84" } の定義）

seg-ffa6025b5a70 = NIMA は NGA のかつての名称

seg-af4be907e56c = NLOS

seg-22ab7d58324b = 反射波のみの信号

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = 非負最小二乗法

seg-af8ca8550600 = NORAD

seg-07428e7224cf = 北米航空宇宙防衛司令部

seg-4edb033e3432 = 公開の衛星カタログを維持している

seg-dd984e16dbcd = NP

seg-f92816d7c936 = ネイマン・ピアソン

seg-fc214695fa83 = 検出理論

seg-3ef8006482bb = NPA

seg-81a072ee0520 = 非精密進入

seg-b9fd2cf6a2b9 = 航空

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = 章動・歳差・バイアス

seg-b4562efbafdf = IAU 2006/2000A の行列

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = 米国海軍研究所 / その質量分析計・非干渉散乱レーダー拡張大気モデル（{ "2000" } 年版）

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = 非地上系ネットワーク

seg-1ae0305d8455 = 衛星からの 5G

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA Technical Reports Server（NASA 技術報告サーバー）

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = 過大主張の識別子

seg-47ba87f3730b = CLAIMS-VS-REALITY.md の行

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = Open Container Initiative

seg-b5bf07ed6c8c = コンテナイメージ形式

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = 常微分方程式 / 確率微分方程式

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = 軌道データメッセージ

seg-35fe6a2f3de3 = OEM と OMM を含む CCSDS のファミリー

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = Open Geospatial Consortium

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = 通常最小二乗法 / 重み付き最小二乗法

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = ESA の軌道上ソフトウェア実験室衛星 / その異常検知データセット

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = Open Space Innovation Platform

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = オープンサービス航法メッセージ認証 / Timed Efficient Stream Loss-tolerant Authentication

seg-95b6b14facf1 = Galileo の信号認証

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = オープンサービス（Galileo、BeiDou）、またはオペレーティングシステム

seg-6db10af375e3 = どちらかは文脈で決まります

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = オルンシュタイン・ウーレンベック

seg-9be9042ec983 = 平均回帰するノイズ過程

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = 製品保証（K_H,PA のように、精密進入も意味する）

seg-65ad442b3faa = PCK

seg-c788fe80678e = 惑星定数カーネル

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = Portable Document Format

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = 検出確率 / 誤警報確率

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = TEME と ITRF の間の座標系

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = 衛星識別子：SP3 の GPS 衛星ラベル、SBAS の擬似ランダム雑音番号、Galileo の衛星名

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite（軌道上の原子冷却による原子時計プロジェクト）

seg-302c8cb738ac = ACES のセシウム時計

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = 保護レベル

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = 位相同期ループ

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central / その論文識別子の一つ

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = 位相変調 / 周波数変調

seg-279251adb2eb = 時計の位相、または周波数のノイズ

seg-685fc49957e2 = PN

seg-209dacf76ff3 = PN 測距など

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = Portable Network Graphics

seg-06998de7b6be = POD

seg-178f55858efb = 精密軌道決定

seg-b7919977bf20 = PPN

seg-ed81960f1282 = パラメーター化ポストニュートン

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = 精密単独測位 / リアルタイムキネマティック / 単独測位

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = 秒パルス

seg-2619e854281a = PR

seg-66c53cdfc3d9 = プルリクエスト

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = 擬似ランダム雑音（符号番号）

seg-6f384580af80 = 信号の中で GNSS 衛星を呼ぶ名前

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations（評価の充実のための選好順位付け手法）

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = 学術誌

seg-78a947083d45 = PSD

seg-6eb799bd1582 = パワースペクトル密度

seg-ab1af8b3d968 = 上記を参照

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = 性能標準 / 標準測位サービス

seg-2800b3a8cd2e = GPS SPS PS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt（ドイツ物理工学研究所）

seg-611e7e4a34f4 = ドイツの国家計量機関

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = Precision Time Protocol

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = 位置、速度、時刻

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = Rust と Python の連携ライブラリ / Python Packaging Authority / Python Package Index

seg-96b2c707a6b8 = Parametry Zemli { "1990" }

seg-3d5012a62544 = GLONASS の測地系

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = 品質保証

seg-7025be647972 = QEMU

seg-d2209c7eea42 = Quick Emulator

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = 四相位相偏移変調

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = 準天頂衛星システム

seg-531943b17837 = 日本

seg-697c55525b36 = RAAN

seg-85cd6997e07e = 昇交点赤経

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = Resist–Detect–Respond–Recover（抵抗・検出・対応・復旧）

seg-76da7c5bf39a = RethinkPNT/Firesmith のレジリエンスモデル

seg-7bb5ed20c788 = RF

seg-35b036272c8e = 無線周波数

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = 右辺

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = 二乗平均平方根 / 二乗和平方根

seg-8b2bd83256f1 = RNG

seg-b90957003307 = 乱数生成器

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

seg-43d17f884c69 = ROI

seg-597432415e53 = 投資収益率

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = Resilient PNT Conformance Framework

seg-2f030c1d70c1 = 米国 DHS

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = 海上無線技術委員会（Radio Technical Commission for Maritime Services）

seg-4a7703f1b605 = そのメッセージ標準は CRC-24Q を採用している

seg-520c91fa0ef0 = オープンソースの GNSS 測位ライブラリ（リアルタイムキネマティックのライブラリ）

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = 径方向、横方向、法線方向

seg-b1b635ff08e4 = 軌道固定座標系

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = ランダムウォーク

seg-8b593d7d5dbd = バイアスのランダムウォークなど

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = ランダムウォーク、ホワイト、フリッカー周波数変調 / ホワイト、フリッカー位相変調

seg-7fced178bcc5 = べき乗則に従う時計ノイズの種類

seg-e39ddb9e8ec1 = SA.45s / SA65、OX-208

seg-0c397d845610 = Microchip の製品名（チップスケール原子時計二種、恒温槽付き水晶発振器一種）

seg-8a1ae00c4a52 = 略語ではなく名前

seg-a58426a850fd = SD

seg-d46cb77d53f6 = 標準偏差

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = サービス定義文書

seg-9415da7a79ab = Galileo OS SDD など

seg-1022626b788c = SDK

seg-2076da4dd4dd = ソフトウェア開発キット

seg-9fb492bced01 = SDR

seg-1a1082059103 = ソフトウェア無線

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = 宇宙防衛飛行隊

seg-c3f6fc1456ed = 第 18 SDS が米国の衛星カタログを維持している

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = 太陽・地球・探査機角（球面誤差確率も意味する）

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = 確率的勾配降下法

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = 単振動

seg-b0973ab206ed = SI

seg-35624e5e4630 = 国際単位系

seg-02aa435dc884 = SIB

seg-262a811c8b69 = 安全情報速報（Safety Information Bulletin）

seg-b9ee445609f5 = EASA。EASA は欧州連合航空安全機関

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = Solution INdependent EXchange format（解独立交換フォーマット）

seg-3466519e4c62 = 測地解

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = 重点サンプリングによるリサンプリング

seg-7a2e0e9cac08 = パーティクルフィルター

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = 信号空間 / 信号空間精度

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation（サンディア慣性地形支援航法）

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = 衛星レーザー測距

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = Space Mission Analysis and Design（宇宙ミッションの解析と設計）

seg-dfc105c0178b = 教科書

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = 信号対雑音比

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = 二乗和 / 残差二乗和

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = 最先端

seg-127e73a3610b = NIST 特別刊行物 { "1065" }

seg-bedc9a3d8d9f = NIST SP { "1065" } と同じ文書

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = 対称正定値 / 正定値

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = Software Package Data Exchange

seg-c10b1f20f37e = ファイルヘッダーのライセンス識別子

seg-b377a91a047f = SPK

seg-5603642c612d = 宇宙機と惑星のエフェメリス用の SPICE カーネル

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = 単一障害点

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = 信号品質監視

seg-a4e75468e6f9 = 相関器の形状によるスプーフィング検査

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = 平方根情報フィルター

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = 太陽輻射圧

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = Shuttle Radar Topography Mission（スペースシャトル・レーダー地形ミッション） / その標高ファイル形式

seg-4692354a98de = タイルは南西の角で命名されます（例：N36W117）

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = Solar System Dynamics（太陽系力学）

seg-1d8167212f57 = JPL のグループ

seg-d21315ea8c52 = STEC

seg-84689b829867 = 斜め方向の全電子数

seg-eabee4bfb30e = Systems Tool Kit

seg-a7ff60ab0bd9 = ミッション解析製品

seg-17d792c12885 = Iridium の測位・時刻サービス

seg-3efaadad9c96 = STM

seg-da395fa674ec = 状態遷移行列

seg-d116578b987b = SV

seg-caa37a1e7d12 = 宇宙機（衛星）

seg-845e6f3a37ec = SVD

seg-e775c436db4b = 特異値分解

seg-3e5561868a7f = Scalable Vector Graphics

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = テレコマンド / テレメトリ

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = テスト駆動開発

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = 到来時間差 / 到来周波数差

seg-aecac9c9d2d0 = 受動的な発信源の位置推定

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = 地形等高線照合

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = Texas Spoofing Test Battery（テキサス・スプーフィング試験セット）

seg-941eccec7400 = 記録された GNSS スプーフィングデータ（OAKBAT は同種のデータセット）

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = 時間間隔誤差

seg-eb12660210bd = TIES

seg-9335f08b6381 = Telecommunication Information Exchange Service（電気通信情報交換サービス）

seg-12f4af2b48c1 = ITU 加盟者のアカウント

seg-c05ba396ac1e = ToA

seg-78a41e672189 = 到来時刻

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = 許容差

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution（理想解への類似度による選好順位付け手法）

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = トータル偏差 / トータル分散

seg-7350da5c5c30 = 拡張範囲の安定度推定器

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

seg-85692b01a12d = TPL

seg-123ed92776a3 = タイミング保護レベル

seg-10c9563602b7 = SLOT-TIMING.md を参照

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = 熱防護システム

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = 地形参照航法

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = 技術報告書 / 技術ノート

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = デルフト工科大学

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = 衛星双方向時刻周波数比較 / 双方向時刻周波数比較

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = u-blox のバイナリ受信機プロトコル

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = ユーザー差分距離誤差

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = ユーザー等価距離誤差

seg-7d87e82154ed = UFFC

seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control（超音波、強誘電体、周波数制御）

seg-f4da31f92a79 = IEEE Transactions の一つ

seg-573db7b5995b = { "300" } MHz から { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = ユーザーインターフェース / ユーザー体験

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = 等間隔リニアアレイ

seg-db65f4a7586d = ULP

seg-ae7458813685 = 最下位桁の単位

seg-d7f4df5a9d13 = 浮動小数点の精密度

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = ユーザー測距精度 / ユーザー測距誤差

seg-17e8fb142c6c = URA はインテグリティのための境界、URE は精度の RMS

seg-1e02dfc0a52b = URL

seg-f726bcd9d4ad = 統一資源位置指定子

seg-088e05d67af1 = USGS

seg-ffed8eca324d = 米国地質調査所

seg-1ded2eb40061 = USNO

seg-2b5f7bbe22e9 = 米国海軍天文台

seg-39ed84639c60 = USO

seg-f9f684640e53 = 超安定発振器

seg-b3a829cb7d84 = 米国標準大気 { "1976" }

seg-ba97a4005ee8 = VIKOR

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje（多基準最適化と妥協解）

seg-7fe170288e4e = 超長基線電波干渉法

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = 広域補強システム / 欧州静止衛星航法オーバーレイサービス

seg-1746693259e0 = SBAS。上記を参照

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment（重み付き集約和積評価）

seg-c9710476b8b5 = 衛星航法に関する欧州連合・米国協力の作業部会 C

seg-79f0e87410bf = ARAIM の参照文書を公表している

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = 地図座標・自転要素作業部会（Working Group on Cartographic Coordinates and Rotational Elements）

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = ホワイトガウスノイズ

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = 世界測地系 { "1972" } / { "1984" }

seg-5964aa61f847 = SGP4 は WGS72 の定数を使用

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = 武漢大学

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = 重み付き和モデル / 重み付き積モデル

seg-cc68c85bb2b9 = 多基準の集約（WPM はホワイト位相変調も意味し、どちらかは文脈で決まります）

seg-9041c866d202 = XML

seg-0e55c3adc568 = Extensible Markup Language

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = 排他的論理和

seg-7fba187cb552 = X / Y / Z / F（XYZF）、D / I

seg-195082605699 = 地磁気の成分：北、東、下、全磁力、偏角、伏角

seg-94835748fcbb = YAGNI

seg-76430d755d74 = you aren't gonna need it（それは必要にならない）

seg-e4e177088376 = 設計原則

seg-565c1908393c = ZHD

seg-77a0948bc15d = 天頂静水圧遅延

seg-749be52554c5 = 再現性とライセンス

seg-d78d9bbb905c = <b>再現可能（決定論的）。</b>同じ入力からは、常にビット単位で同一の出力が得られます（<c1/>）。隠れたランダム性はありません。

seg-1412347e2298 = <b>シード。</b>（決定論的な）乱数生成器を初期化する数値で、実行を繰り返せるようにします。

seg-3a35740e04a8 = <b>オープンコア。</b>ビジネスモデルの一つで、エンジンは無料のオープンソース（AGPL-3.0、下で定義する GNU Affero General Public License。商用のデュアルライセンス）です。事業を支えるのは、サポート、統合、商用ライセンス、独自のアドオンであり、オープンなエンジンに対する利用者ごとの料金ではありません。

seg-8ea21ebded3c = <b>AGPL-3.0。</b>GNU Affero General Public License v3 — OSI（Open Source Initiative）が承認した、強力なコピーレフトのオープンソースライセンスです。GPL（GNU General Public License）に似ていますが、ソフトウェアを<b>ネットワーク越しに</b>利用者へ提供する場合を対象とする追加の条項（§{ "13" }）があります。ネットワーク経由で到達できる改変版は、それらの利用者に対応するソースを提供しなければなりません。Kshana のオープンライセンスです。

seg-f87860d8197d = <b>デュアルライセンス。</b>同じコードを二つのライセンスで提供し、利用者が選べるようにすることです。ここでは、AGPL-3.0（オープン、コピーレフト）<b>または</b>、AGPL が適さない独自・クローズドな用途向けに Ashforde OÜ（エストニアの非公開有限会社。OÜ = osaühing）が提供する商用ライセンスです。<c1/> を参照してください。

seg-dd5f4a1bbbf5 = kshana.dev でも使用

seg-9d0c42560a90 = 上のリポジトリの用語集にない、ウェブサイトで使う略語です。

seg-67a54ce8c89e = 全地球測位システム（Global Positioning System）

seg-814b0d29bbb2 = 搬送波対雑音密度比（dB-Hz 単位）

seg-f22a269bc575 = GNSS が使う { "1" } から { "2" } GHz の無線帯域

seg-1f4360a0405c = GPS L1 の C/A コード（coarse/acquisition）

seg-6f7910207534 = 拡張順方向信号（月）

seg-74f02864ce32 = 微小電気機械システム

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = 無人航空機システム

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = 保護レベル · アラート限界

seg-78134bcc48da = 垂直ガイダンス付き進入、レベル I

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = 低軌道 · 静止軌道

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = CCSDS の軌道エフェメリス、軌道平均要素、追跡データの各メッセージ

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = 深宇宙ネットワーク

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = 温度補償水晶発振器 · 恒温槽付き水晶発振器

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = パッシブ水素メーザー

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = 超安定発振器 · 深宇宙原子時計

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = 最大時間間隔誤差 · 時間偏差

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = 一次基準時刻クロック · 拡張 PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = 平均化時間 τ におけるアラン偏差

seg-96fae3b4fb8e = 国際電気通信連合 電気通信標準化部門

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = 正規化イノベーション二乗 · 正規化推定誤差二乗

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript Object Notation · カンマ区切り値 · Scalable Vector Graphics

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = コマンドラインインターフェース · アプリケーションプログラミングインターフェース · 統合開発環境

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = ソフトウェア部品表 · Supply-chain Levels for Software Artifacts

seg-347b23148b8f = NDA

seg-969d2489de28 = 秘密保持契約

seg-564cfa0d3084 = デジタルオブジェクト識別子（Digital Object Identifier）

seg-5cbd99859d90 = C/N₀ ウォーターフォール

seg-ed4a9e041a83 = 衛星ごとの搬送波対雑音密度比の時間変化を示すグラフ

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = 水平 · 垂直保護レベル

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera（月周回衛星カメラ）

seg-c5da9d350518 = <s1>前へ</s1>概念入門

seg-670504be0531 = <s1>次へ</s1>Studio ガイド
