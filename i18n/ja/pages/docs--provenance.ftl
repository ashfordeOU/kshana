# docs--provenance: translations (ja)

seg-9a2a5f0a8a02 = 太陽系

seg-d01db1c2710a = リファレンス

seg-28e87f407a10 = 領域

seg-ad856ad710eb = ステータス

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = 出典

seg-638b8d451550 = センサー

seg-d4a762001549 = ライセンス

seg-60cd077d82a7 = モデル

seg-2afa300864a9 = パラメーター

seg-32b620b3574e = 用途

seg-f3de25879362 = ソース：<c1/>

seg-257526f1f93f = 来歴：すべてのパラメーターを公表された出典まで追跡可能に

seg-8c12958898a8 = Kshana の中核となる誠実さの規律は、<b>すべてのセンサーパラメーター、物理モデル、検証データセットが、公表された出典（データシート、査読済み論文、信号空間の ICD（インターフェース管理文書）、または標準）まで追跡できること</b>です。この文書は、それらの来歴の文字列を、引用可能な一つの参照表にまとめたものです。

seg-279914171c2e = 来歴は単なるドキュメントではありません。シナリオ内の各センサーテーブル（たとえば <c1/> と <c2/>）は <c3/> 文字列（<c5/> の <c4/>、慣性計測装置（IMU）誤差モデルでは <c7/> の <c6/>）を持ち、これは <c8/> と <c9/> として<b>結果の JSON（JavaScript Object Notation）にそのまま引き継がれる</b>ため、どの実行も自身のパラメーターの出典を持ち運びます。結果の <c10/> ブロックも、すべての数値フィールドに来歴の区分（<c11/>、<c12/>、<c13/>、<c14/> など）を付けています。以下の表は、これらの文字列を集約した、人間が読めるインデックスに、ソースコードのコメントにあるアルゴリズムと検証の来歴を加えたものです。

seg-683fd369407a = 成熟度は全体を通して正直にラベル付けしています。<b>飛行適格</b>（飛行実績あり）、<b>地上ラボ/観測ロケット</b>（実証済み、飛行実績なし）、<b>地上ハードウェアでの宇宙目標</b>（飛行実績のないハードウェアに対する目標値で、特にストロンチウム光格子時計の数値すべてがこれに当たります）。数値ごとの <c2/> / <c3/> / <c4/> のラベルは <a1><c1/></a1>、地上ラボと飛行の成熟度に関する議論は <a2><c5/></a2> を参照してください。

seg-80834864bfdd = { "1" }. 時計・周波数基準のパラメーター

seg-305f560d4b08 = 主要な数値

seg-c35a20fa2529 = 成熟度

seg-302e481e5014 = Microchip（Microsemi）SA.45s / SA65 CSAC（チップスケール原子時計）

seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

seg-222707a1bde3 = メーカーのデータシート

seg-97709a803dea = <b>飛行適格</b>（配備済みの市販品）

seg-75db01df1aea = ストロンチウム光格子時計（宇宙目標）

seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al.、<a1>arXiv:{ "1503.08457" }</a1>

seg-b8c64caf79f3 = <b>地上ハードウェアでの宇宙目標</b> — Sr 光時計の飛行実績はありません

seg-b5a006507475 = ストロンチウム光格子時計（実験室の記録）

seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

seg-b21bb1b6bf40 = Oelker et al.、<em>Nature Photonics</em> ({ "2019" })

seg-95fb87b3a118 = 地上ラボのみ

seg-a36f415cccab = ACES/PHARAO（Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite、ISS（国際宇宙ステーション）のベンチマーク）

seg-9d6acc3191a5 = 数日間の積分後で { "1" }×{ "10" }⁻¹⁶ 程度

seg-1cddc44025d7 = ESA（欧州宇宙機関）の ACES/PHARAO。{ "2025" } 年4月から ISS で運用中（ESA が公表した結果を引用すること）

seg-75b7bb5ca4c8 = <b>飛行適格</b>（マイクロ波/メーザーであり、光ではありません）

seg-aeb8f189db37 = ホールドオーバーのモデルが使うアランの白色周波数係数は <c1/> です。フリッカー周波数変調（フリッカー FM）と経年変化は、<c2/> が明示的に設定されている場合にのみモデル化され、それ以外はモデル化されません（<a1><c3/></a1> を参照）。

seg-bfe4524b6664 = { "2" }. 慣性センサーのパラメーター

seg-5cd1984ba399 = 主要な数値

seg-53ad9ba8cecb = Exail ハイブリッド量子加速度計の三軸構成

seg-b40c95a6bea5 = バイアス安定度 { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s²（{ "24" } h）、ノイズ { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

seg-fdb8f1d648ba = Templier et al.、<em>Science Advances</em> ({ "2022" })、<a1>arXiv:{ "2209.13209" }</a1>

seg-570f41ff76c9 = Honeywell QA-2000 航法グレードの水晶加速度計

seg-a7dbc9a9705e = バイアス安定度 ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²、ノイズ ~{ "20" } µg/√Hz、バイアス不安定性 ~{ "1" } µg

seg-3ad7ce01c6e2 = メーカー / Groves <em>AESS（Aerospace and Electronic Systems Society）チュートリアル</em>

seg-37c841945d3e = IMU 誤差モデル（スケールファクター、ミスアライメント、g 感度、量子化、レートランプ）

seg-b7547264e608 = 五つの系統的な誤差分類

seg-2f20d848f9d3 = IEEE（Institute of Electrical and Electronics Engineers）Std 952-1997 §A.2、Groves { "2013" } §{ "4.3" }、Table { "4.1" }

seg-c24b9890cf3b = モデル

seg-67a38b3fe143 = ストラップダウン機械化（NED：北・東・下、コーニング/スカーリング）

seg-832b3645b515 = クォータニオン姿勢 §{ "2.2" }、§{ "5.5" }、NED 機械化 §{ "5.4" }、重力 §{ "2.4" }

seg-58c85c15b0aa = Groves、<em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>、第 2 版

seg-ac7ef2be17e0 = { "3" }. 時刻・周波数伝送のパラメーター

seg-7634c6f4b32c = リンク

seg-dddf65bbb231 = 自由空間光の双方向（衛星間）

seg-e3a8990e650a = 実験室の下限 ~{ "1" } fs、軌道上で現実的な目標は { "1" } ps

seg-1adf3425eda9 = Giorgetta et al.（{ "2013" }、<em>Nature Photonics</em>）、Deschênes et al.（{ "2016" }、<em>Physical Review X</em>）

seg-9ab60d7ed2a9 = TWSTFT（衛星双方向時刻・周波数比較、Ku バンド）

seg-543939310789 = 単一セッションで ~{ "0.5" } ns

seg-7f6127bdb4d9 = BIPM（国際度量衡局）/ PTB（Physikalisch-Technische Bundesanstalt、ドイツの国家計量機関）/ NIST（National Institute of Standards and Technology）

seg-d1f0ed9c0323 = { "4" }. 軌道、時刻系、座標系のモデル

seg-2ad53ecbee02 = 式 / 標準

seg-7ed15b9389e0 = 参照（ソースコードのコメント）

seg-4d6989c7153e = SGP4/SDP4（SGP4：Simplified General Perturbations { "4" }、SDP4：Simplified Deep-space Perturbations { "4" }）による伝搬

seg-0d46975247cc = WGS-72（WGS：World Geodetic System）の SGP4 モデル

seg-6dcfe89aeb8f = Vallado et al.、<em>「Revisiting Spacetrack Report #3」</em>、<b>AIAA（American Institute of Aeronautics and Astronautics）2006-6753</b> ({ "2006" })

seg-e46bf46a4d35 = うるう秒/時刻系（UTC/TAI/TT/UT1（UTC：協定世界時、TAI：国際原子時、TT：地球時、UT1：世界時 { "1" }、地球自転に基づく時刻））

seg-7505e93b9bf8 = 1972-01-01 以降の整数うるう秒の体制

seg-0ea35809be61 = IERS（International Earth Rotation and Reference Systems Service）Conventions ({ "2010" })、うるう秒の履歴は IERS Bulletin C

seg-d25f68665f8e = 地球回転角

seg-a3a803bdc8a0 = IAU（国際天文学連合）{ "2000" } 決議 B1.8

seg-049ad81ff5e8 = 放送エフェメリスの SV（宇宙機、すなわち衛星）の位置/時計

seg-a1a595008b2a = ユーザーアルゴリズム、相対論的な <c1/>、<c2/>

seg-8e2e3089e2e6 = IS-GPS-200（IS：Interface Specification、GPS：Global Positioning System）§{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

seg-8e14a54b1f09 = Galileo / QZSS（日本の準天頂衛星システム）/ BeiDou のエフェメリス定数（μ、Ω̇ₑ、C̄₂₀）

seg-93b03e3b3e43 = システムごとの SIS ICD（インターフェース管理文書）

seg-c7c6759c0373 = Galileo OS（オープンサービス）SIS ICD、BeiDou OS SIS ICD（CGCS2000、中国測地座標系 { "2000" }）、GLONASS（ロシアの全球航法衛星システム）ICD（PZ-90（PZ：Parametry Zemli、ロシアの測地系））

seg-7d59b9c3dabc = { "5" }. GNSS の観測量領域とレジリエンスのモデル

seg-dd7e88cfd703 = Klobuchar 単一周波数電離圏

seg-9920eb06b90c = セミサークルのアルゴリズム

seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

seg-0358759614c5 = Saastamoinen 天頂対流圏

seg-b4b7f91f6112 = 静水圧 + 湿潤の天頂遅延

seg-ba06204996b7 = Davis et al.（{ "1985" }）、Groves §{ "9.4" }

seg-9fc988ebf2aa = Niell マッピング関数

seg-8eb79ff7faaa = 静水圧と湿潤、仰角によるマッピング

seg-ca4642e37561 = Niell（{ "1996" }）

seg-7876aa9fc732 = アンチジャムのリンクバジェット

seg-75e1c40bdc0f = <c1/>（C/N₀ は搬送波対雑音密度比、J/S はジャミング対信号比、Q はスペクトル分離係数、Rc はチップレート）→ 実効 C/N₀ → ロックロス

seg-7afcd0de9ae8 = Kaplan & Hegarty、<em>Understanding GPS/GNSS</em>、第 3 版、§{ "9.4" }

seg-c6e2f2ee16cb = スプーフィング/エネルギー検出

seg-15390c9b849c = Neyman–Pearson / 両側 χ²₁ エネルギー検定、Φ⁻¹ は Acklam の方法、erf は Abramowitz & Stegun { "7.1.26" }

seg-1c30c0b6a81f = 古典的な検出理論

seg-023867611249 = アラン系列の安定度（ADEV/MDEV/TDEV/HDEV（ADEV：アラン偏差、MDEV：修正アラン偏差、TDEV：時間偏差、HDEV：アダマール偏差））

seg-478bb58f8a7f = 信頼区間付き

seg-2abd4df32f9c = NIST SP（Special Publication）{ "1065" }（Riley）、Kasdin、<em>Proc. IEEE</em> ({ "1995" })

seg-a958238e3d1c = RAIM（受信機自律インテグリティ監視）/ インテグリティ（HPL/VPL（HPL：水平保護レベル、VPL：垂直保護レベル）、ARAIM（高度な受信機自律インテグリティ監視）による解の分離）

seg-41b219635fbe = スナップショットと解の分離

seg-b971eeb2bf2b = <a1><c1/></a1> を参照

seg-926261321371 = { "6" }. 検証データセット

seg-04863ce407e7 = <b>ベンダリングの方針。</b>再配布がライセンス上許可されており、<em>かつ</em>サイズが git に無理なく収まる検証データセットは、すべて原本のまま commit します。これにより、クローンしたものでネットワークなし、リンク切れなしにオフラインで検証を再現できます。データセットが<b>fetch-gated</b>（<c1/> ヘルパーが git の管理対象外の <c2/> にダウンロードし、<em>導出した</em>小さな基準値だけを commit する）になるのは、ライセンスが再配布を明確には許可していない場合、またはサイズが git には大きすぎる場合に限ります。gated の各データセットには、その具体的な理由を以下に記録しており、利便性のために gated にしているものはありません。

seg-b966dd26caa6 = データセット

seg-e0351f9b83fc = リポジトリ内の状態

seg-ea1ad9965f74 = AIAA 2006-6753 SGP4 テストベクトル（全 { "666" } 件）

seg-cb7efe21070c = SGP4 の数値検証：最大 { "4.12" } mm

seg-a624c6877c48 = 公表されている基準ベクトル（Vallado、AIAA）

seg-d90675af2816 = ベンダリング済み

seg-c1cee31c42df = ⁸⁸Sr 光時計の ADEV σ_y(τ)（Norcia et al.、Science { "366" }:{ "93" }、{ "2019" }）

seg-232e54a0e396 = 光時計の実測安定度のフィットの検証

seg-3345cefbfa3c = <b>CC-BY-4.0</b>（Creative Commons Attribution { "4.0" }、Zenodo 10.5281/zenodo.3382347）

seg-2bb00a0c58ef = NASA/USGS（NASA：米国航空宇宙局、USGS：米国地質調査所）SRTM（Shuttle Radar Topography Mission）v3 標高タイル N36W117（デスバレー、6 秒角に間引き、{ "722" } KB）

seg-088a57c3a5b1 = 実際の起伏に対する地形 DEM（DEM：数値標高モデル）の <c1/> リーダーの検証（バッドウォーター盆地 ≈ −{ "86" } m）

seg-ed90325543c8 = <b>パブリックドメイン</b>（NASA/USGS SRTM v3、AWS（Amazon Web Services）Open Data <c1/> 経由）

seg-9607b2318cf5 = CCSDS 502.0/503.0 Blue Book の OEM/TDM（OEM：Orbit Ephemeris Message、TDM：Tracking Data Message）の例

seg-b53475918422 = CCSDS パーサーの往復変換の検証

seg-25d9f396b539 = 公表されている標準の例（CCSDS）

seg-35dfb14360e3 = IGS（国際 GNSS サービス）の SP3（Standard Product { "3" }、精密軌道のフォーマット）精密軌道 + RINEX（Receiver Independent Exchange Format）航法のサンプル

seg-5e321b8b5287 = 軌道フィットとインテグリティの検証

seg-ec0b6ff10fc5 = IGS のオープンデータ（用途を問わず無料、出典表示）

seg-00db9583ce55 = Celestrak の TLE（二行軌道要素）スナップショット（<c1/>、<c2/>）

seg-4dabd0f62f90 = 実在のコンステレーションのシナリオ

seg-6e7c8deb24b6 = Celestrak の利用条件（出典表示、米国政府由来の TLE（二行軌道要素））

seg-2827577f7008 = <c1/> + ライブの <c2/>

seg-c0945969860a = scipy / scikit-learn / filterpy の基準出力

seg-61546d769e23 = 数値カーネルと推定器の検証

seg-b74e03fddbca = BSD/MIT（BSD：Berkeley Software Distribution ライセンス）のライブラリからローカルで生成

seg-9d818fc79012 = <c1/>（+ ジェネレータースクリプト）

seg-4d6c3069b01f = Stable32 の基準偏差（ディケードごとの ADEV/HDEV の階段）

seg-0a7b677330a6 = アラン推定器の同等性

seg-3c91f9ae6473 = 導出した要約値（小さい）

seg-14aecb331164 = 5071A セシウムの<b>生</b>の位相系列（{ "556 990" } 点、{ "12" } MB）

seg-9d43f399613b = 実際の Cs 時計に対するオーバーラッピング ADEV/HDEV

seg-87b53409bedb = <b>不明</b> — <c1/> は LGPL-3.0（GNU Lesser General Public License、ソフトウェアライセンス）であり、<em>データ再配布の明示的な許諾はありません</em>。このファイルは PyPI（Python Package Index）の配布物から除外されています

seg-b741be74c8ad = <c1/>、導出した階段は commit 済み

seg-5e07eabcfe78 = <b>生</b>の PHASE.DAT（1000 点の回帰系列）

seg-d9f61f4b985c = Stable32 推定器の同等性の系列

seg-df8e0a135895 = <b>不明</b> — 商用の Stable32（Hamilton Technical Services）に同梱されています。NIST SP { "1065" } はパブリックドメインですが、値は掲載していません

seg-332b36d2b91f = <c1/>、導出した階段は commit 済み

seg-dd2ee7a9f1fa = JammerTest { "2024" } の GNSS ジャミング/スプーフィングのキャプチャ（{ "1.4" } GB）

seg-20065daf2305 = レジリエンス/異常シナリオの較正

seg-a4410133d410 = GPL-3.0-or-later（GNU General Public License、Zenodo 10.5281/zenodo.15910563）— 再配布は許可されていますが、<b>サイズが GitHub の { "100" } MB のファイル上限を超えており</b>、GPL のコピーレフトは AGPL（Affero General Public License）のツリーと両立しません

seg-d4c7d2f9ea0d = <b>Fetch-gated</b>、DOI（デジタルオブジェクト識別子）を参照

seg-c0e39f83efcd = fetch-gated の各データセットのライセンス状況は、上流の権威ある情報源に照らして調査しました。「不明」の二つの時計データセットは、再配布の明示的な許諾が得られるまで gated のままとします（公表するライセンスを<em>受けている</em>値は、すでに commit しています）。JammerTest のセットは、ライセンスはオープンですが、サイズとコピーレフトを理由に gated としています。

seg-e104e19931d4 = { "7" }. 新しい領域：パラメーターの出どころ

seg-c11f7c73d10b = 上の表より後に追加された種別にも、同じ規則を適用します。各行は、出典と、それに基づく機能の検証マトリクス上のステータスを示します（行全体は <a1><c1/></a1> を参照）。

seg-5d2c25dd2ff3 = 通信タイミング（<c1/>）

seg-c2ae6b1fe666 = 同期マスク

seg-e247606fe749 = ITU-T（国際電気通信連合 電気通信標準化部門）勧告。各限界値を、その表または条項とともに <a1><c1/></a1> に記載

seg-1150ab344107 = MODELLED（転記）

seg-01d31590ca44 = 発振器プリセット <c1/>、<c2/>、<c3/>、<c4/>

seg-9a4c0c214c54 = Microchip のデータシート四つ。文書番号は <a1><c1/></a1> に記載

seg-a03ea8950ab0 = MTIE（最大時間間隔誤差）と TDEV（時間偏差）の推定器

seg-389e18e1a900 = <c1/> の allantools { "2024.06" }

seg-29edfc0f6a6d = 太陽系（<c1/>、<c2/>）

seg-df22756e5209 = JPL（Jet Propulsion Laboratory）Standish のケプラー要素による惑星の位置

seg-194e3a13d51a = <c1/> の JPL Horizons DE441（Development Ephemeris { "441" }）状態ベクトルと照合して確認

seg-6d23934b3cb7 = VALIDATED。天王星、海王星、冥王星、衛星は MODELLED

seg-a2624ce2e89a = 各天体の重力パラメーター、半径、自転

seg-4d501821b508 = JPL Horizons の天体レコードと、JPL の衛星物理パラメーター表

seg-f2715a76f0ec = コンステレーション設計（<c1/>）

seg-784e471cdada = GPS、Galileo、GLONASS の公称スロット

seg-479ddafe5925 = Galileo オープンサービス サービス定義文書 { "1.1" }、GPS 標準測位サービス性能標準 第 5 版

seg-b5e3dc8605b1 = LEO（低軌道）PNT（<c1/>、<c2/>、<c3/>）

seg-0a535468ad51 = 名前付きのシステムプリセット

seg-aae7fe16f69a = 引用している公開数値。各プリセットに出典を付記

seg-a72c37136e3a = LEO 航法メッセージ（<c1/>）

seg-ac50550a250f = 信号空間レンジ誤差の重み

seg-5dae296d5484 = Montenbruck、Steigenberger、Hauschild（{ "2018" }）、<em>Advances in Space Research</em>

seg-9148986e8610 = 22 パラメーターのエフェメリスモデル

seg-5b82ad0bd2c9 = Liu et al.（{ "2025" }）、<em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

seg-2080b4fc31a8 = グラフの来歴フッター

seg-22d0b06d5df4 = Kshana が描画するすべてのグラフ（ブラウザープレイグラウンド、CLI（コマンドラインインターフェース）の <c1/> エクスポート、印刷可能な <c2/>（HTML、HyperText Markup Language）レポート内のグラフ）の右下には、次の内容が刻印されます。

seg-d8b4de856202 = <c1/> は、その実行の<b>シナリオハッシュ</b>の先頭 { "12" } 桁の十六進文字です。シナリオハッシュは、<em>正規化した</em>シナリオ定義（シード、しきい値、モデルパラメーター、GNSS の窓など）に対する SHA-256（SHA：Secure Hash Algorithm）です。これは、一行の実行サマリーや、結果 JSON の <c2/> フィールドに現れるものと同じフィンガープリントです。（結果ドキュメントに <c3/> を持たない種別、たとえばインテグリティレポートや月レポートは、シナリオソースの TOML（Tom's Obvious, Minimal Language）の SHA-256 で代用するため、すべてのグラフに安定したフィンガープリントが付きます。）

seg-8d218131da01 = ハッシュは決定的で入力に敏感なため、保存または貼り付けたグラフ画像は自己識別が可能です。エンジンのバージョン、それを生成した正確なシナリオ（ビット単位の再現のため）、およびソースが記録されており、パラメーターを一つでも変更するとハッシュが変わるため、誤ったラベルのグラフは検出できます。

seg-89c9b001868f = 引用と再現の方法

seg-6eca19b7978c = すべての結果は <c1/> から再現できます。エンジンは <a1><c2/></a1> / Zenodo のコンセプト DOI <a2>10.5281/zenodo.20528627</a2> で引用し、特定の実行が依存する数値については、上記の<em>パラメーター</em>の出典を引用してください。それらは結果 JSON の <c3/> フィールドに含まれて引き継がれるため、公表された結果は自己文書化されています。

seg-c5c58ef3771c = 数値が、地上ハードウェアでの宇宙目標（ストロンチウム光時計のすべての数値）または地上ラボでの実証（冷却原子加速度計）である場合は、この文書と結果の来歴にその旨を明記しています。Kshana は、ラボの数値や目標値を、飛行時の性能として示すことはありません。

seg-925d456df88c = <s1>前へ</s1>主張と実態

seg-19e8fefd1ceb = <s1>次へ</s1>再現性
