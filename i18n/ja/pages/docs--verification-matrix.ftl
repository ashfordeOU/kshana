# docs--verification-matrix: translations (ja)

seg-619f89bf160c = 月の座標系の実現

seg-2db69c58f694 = 月面ディファレンシャル PNT

seg-1ff1d8ebf1e7 = 公開フレームワークへの compliance マッピング

seg-aab745a65e76 = モジュール

seg-d6476863f862 = 機能

seg-ad856ad710eb = ステータス

seg-60a43431ebe0 = 要件

seg-cbf0f9bcd2d8 = オラクル

seg-1603e76bcf66 = ラグ 1 自己相関によるべき乗則ノイズの識別

seg-d95fe5878ee3 = allan::lag1_noise_id：Riley と Greenhall（{ "2004" }）のラグ 1 自己相関ノイズ識別器（間引いた位相は 二次成分を除去し、グループ平均した周波数は直線成分を除去。delta = r1/({ "1" }+r1) < { "0.25" } または d = dmax になるまで一階差分を繰り返します）で、任意の平均化係数におけるべき乗則指数 alpha（+{ "2" } のホワイト PM から -2 のランダムウォーク FM まで）を、整数値と丸めない値で返します。実測クロックライブラリのデバイスカードのノイズ種別の自由度を決めます

seg-6e0cb6acc073 = VALIDATED

seg-4d820e75cd4f = allantools { "2024.6" } の autocorr_noise_id（A. Wallin ほか貢献者、LGPL-3.0-or-later、フィクスチャ生成器が別プログラムとして実行）：公表されている Riley-Greenhall アルゴリズムの独立した実装で、所定の規約の下で一意に定まる量です。検証するのは識別器であり、実際のクロックのノイズの内容ではありません

seg-aedf395f3597 = Galileo OSNMA の受信機側での航法データ認証

seg-1e6e62438dad = osnma + <c1/>：Galileo OSNMA（SIS ICD Issue { "1.1" }、Receiver Guidelines Issue { "1.3" }）のための、オープンな純 Rust の受信機側検証器で、I/NAV ページまたは u-blox UBX-RXM-SFRBX ストリームを入力とします。対応するのは、Merkle ツリーの公開鍵（DSM-PKR）、DSM-KROOT の ECDSA P-256/P-521 署名、TESLA 鍵チェーンの検証（SHA-256 または SHA3-256）、ADKD { "0" }、{ "4" }、{ "12" } の MACSEQ とタグの検証（HMAC-SHA-256 または CMAC-AES）と相互認証、チェーン終端/失効/更新、公開鍵の更新と失効、およびアラートメッセージです。衛星ごとの状態は Authenticated/Failed/Unavailable で、失敗または遅延のたびに理由が付きます。助言のみ：型式承認を受けた航法装置ではなく、航法インテグリティサービスでもありません。スプーフィング対策の性能は主張していません

seg-a6bd60ed728f = 欧州 GNSS サービスセンターが Receiver Guidelines の附属書として公開している、公式の Galileo OSNMA テストベクター（Test_vectors.zip、sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370）：{ "18" } セット中 { "18" } セットで { "186,382" } 件のタグを認証し、{ "0" } 件が失敗。2026-10-10 にオフラインで実行（エビデンス記録は kshana-pro の docs/evidence）。範囲：このベクターが検証するのは、暗号による検証（Merkle、KROOT/ECDSA、TESLA チェーン、MACK タグ、ADKD 0/4/12）と、公開されたシナリオでのその結果です。使われているのは HMAC-SHA-256、SHA-256 チェーン、128 ビット鍵、40 ビットタグ、ルックアップエントリ { "33" } と { "34" } だけなので、CMAC-AES、SHA3-256 チェーン、その他のパラメーターは、公表されているプリミティブの既知解テストと合成テストでしかカバーされていません。信頼できる時刻、データの紐付け、有効期限、ヘッダー確認の堅牢化は、外部オラクルではなく合成の攻撃テストで試験しています。確認していないもの：証明書失効リスト、実際の信号や実際の受信機（UBX のワード配置は合成フレームでのみ確認）、SHA3-256 の Merkle ツリー、独立した時刻なしでの鮮度。EU のサービスではありません

seg-27a61718eb95 = 周波数安定度の特性評価

seg-56174d771190 = アラン/修正アラン/アダマール偏差 + べき乗則ノイズ識別（χ² 信頼区間付き）

seg-ed01b2ab3481 = NBS14 に対する NIST SP { "1065" }（Riley）/ Stable32 の参照偏差

seg-25b78672c194 = 実測クロックでの周波数安定度

seg-fd378f5fe04a = 実際のセシウム標準に対する、オーバーラッピング・アラン偏差とオーバーラッピング・アダマール偏差

seg-64fd49d58394 = 実測の 5071A セシウム位相系列（allantools）に対する Stable32 のオーバーラッピング ADEV/HDEV

seg-f305dbc83f2b = 標準の Stable32 参照系列でのアラン推定量の一致

seg-5bfca5dcfb7c = AF の全段階にわたる、オーバーラッピング・アラン偏差 + 修正アラン偏差 + 時間偏差

seg-327ab6dcf16a = PHASE.DAT の Stable32 参照偏差（Riley。標準の回帰試験系列）

seg-96c4275f5a89 = 拡張範囲の周波数安定度（Theo1 / TOTDEV）

seg-7f59c3631ca4 = Theo1 と全偏差（TOTVAR）：長い tau まで届く拡張範囲の安定度推定量で、アラン偏差が限界を迎える記録長の約 { "50" }% 付近を超えて、約 { "75" }% まで到達します。これらを基にしたバイアス除去型の ThêoH ハイブリッド（allan::theoh_curve）は MODELLED のままです

seg-a38edc2526f5 = allantools { "2024.06" }（独立したサードパーティの周波数安定度ライブラリ）の theo1（NIST SP { "1065" } 式 { "30" }）と totdev（NIST SP { "1065" } 式 { "25" }）を、密閉された NIST SP { "1065" } §{ "12.4" } LCG データセットに対して実行。tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py でオフライン再生成できます

seg-cc40472fbcbf = 最大時間間隔誤差（MTIE）：通信のワンダー指標

seg-5c54ba2748f7 = MTIE(τ)：τ = m·tau0 の任意のスライディングウィンドウにおける、時刻誤差のピーク間の最大振れ幅で、同期ネットワークの限界（MTIE マスク）が基準とする ITU-T G.810/G.823/G.8261 のワンダー統計量です。RMS 系のアラン偏差とは異なる、極値（最大/最小）の指標です

seg-300fd3f945a0 = allantools { "2024.06" }（独立したサードパーティの周波数安定度ライブラリ）の mtie() を、密閉された NIST SP { "1065" } §{ "12.4" } LCG 位相系列に対して実行。MTIE は純粋な最大/最小の統計量なので、推定器の出力は、同一に構築した位相配列に対する allantools とビット単位で一致します（コミット済みの有効数字 15 桁の参照定数は { "1" } ULP 以内）。tests/fixtures/mtie/generate_mtie_reference.py でオフライン再生成できます

seg-67d73f3ca14d = 修正アラン偏差 / 時間偏差（MDEV / TDEV）

seg-9ac9d2b0bdf8 = MDEV(τ)：オーバーラッピング修正アラン偏差（ホワイト位相ノイズとフリッカー位相ノイズを分離する、二階差分のスライディングウィンドウ推定量）と、同期マスクが基準とする ITU-T G.811/G.812/G.823 の時間領域ワンダー統計量 TDEV(τ) = τ/√{ "3" }·MDEV(τ)

seg-24a441f32375 = allantools { "2024.06" }（独立したサードパーティの周波数安定度ライブラリ）の mdev() と tdev() を、密閉された NIST SP { "1065" } §{ "12.4" } LCG 位相系列（Theo1/TOTDEV/MTIE の行と同じ系列）に対して実行し、一意に定義される同じ推定量を計算しています。相対誤差 <{ "1e-9" } で一致。tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py でオフライン再生成できます。（データが揃うと動く phasedat_reference.rs も、これらを Stable32 と { "1e-3" } で照合します。こちらは常時動作する、厳密で密閉されたクロスチェックです）

seg-e4b6d707cbf5 = 実測曲線での光時計の周波数安定度

seg-e9077554a08f = 公表されている実測の ⁸⁸Sr 光時計遷移のアラン偏差からの、べき乗則（ホワイト FM + 赤色ノイズフロア）の NNLS 復元：σ_y(τ) と、短い τ での代表的な 4.7e-16/√τ のスケーリングを、実測の長い τ のフロアとともに再現します。holdover.rs が他の箇所で仮定している、合成した光時計級のフロアとは異なります

seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" }（{ "2019" }）、Fig. { "4" } の実測 ADEV。曲線は Zenodo 10.5281/zenodo.3382347（CC-BY-4.0）からそのまま同梱。範囲は公表された実測の安定度曲線の再現に限られ、時計の等級ごとのしきい値までのホールドオーバーのデバイス値は MODELLED のままです

seg-cc95c8615d39 = インテグリティ（RAIM/ARAIM/SBAS）

seg-d4ad9cfa4f9b = ARAIM Airborne Design Document（ADD）v4.2 に沿った ARAIM の多重仮説解分離（araim_reference::add_v42_protection_levels と add_v42_protection_levels_ecef：P_THRES と FC_THRES の規則による部分集合の決定、VPL、HPL、有効モニターしきい値 EMT、sigma_acc）。単一衛星の除外を伴うカイ二乗スナップショット RAIM の故障検出（raim::snapshot_raim、raim::snapshot_raim_fde）と、測地の局所水平面上の傾きに基づく HPL/VPL。L1 サービスでの SBAS DO-229E の保護レベルの組み合わせ（sbas::sbas_protection_level）。カバーしていないものをはっきり述べます：一様シグマの簡易関数 raim::araim_raim と raim::araim_dual_raim は ADD に適合していません（一致する入力では、Stanford MAAST に対し VPL で { "0.75" } m、HPL で { "4.04" } m、および VPL で { "0.39" } m、HPL で { "1.93" } m 届きません。これは調査結果です）。二周波多衛星システム（DFMC）の L5 SBAS の比較は調査結果です（GEO が視界にない { "308" } のユーザーエポックの組は Kshana では保護され、MAAST では保護されません。MAAST の GEO 受信ゲートは Kshana ではモデル化していません）。raim::solution_separation_raim には外部との比較がありません

seg-a83c68500982 = 独立した三つのツールで、フィクスチャやオラクルの出力が存在する前に事前登録（0123cee1）し、許容差はその時点で固定しました。({ "1" }) ARAIM：Stanford MAAST for ARAIM { "2" }（commit ab70e2a3、BSD-3）の mhss_raim_baseline_v5.m を、GNU Octave { "8.4" } 上で別プログラムとして、ドライバー側の unique() 互換シム（開示済み、アルゴリズムの変更なし）付きで、ADD の TOL_PL である { "0.05" } m で実行しました。Rust は ADD の参照実装を { "270" } 件の実ケースで再現します。開示事項：Kshana の ADD の経路は事前登録の後に、MAAST が実装する形の ADD に従って書かれました。査読者による独立したホールドアウト（{ "270" } 件の新しいユーザー幾何と 二つ目のインテグリティ支援メッセージ。凍結したコードに対して MAAST を再実行）は、同じ合格基準で合格しました。({ "2" }) スナップショット RAIM：RTKLIB v2.4.2-p13（BSD-2）の estpos/valsol/raim_fde を別の C ハーネスで動かし、検出と除外を確認しました。傾きに基づく PL は RTKLIB の matinv/xyz2enu に SciPy { "1.18.1" } の chi2/ncx2 を組み合わせたもので、どちらの側も同じ閉形式（Brown、Parkinson と Axelrad）を評価するため、PL の照合が対象とするのは式ではなく実装です。({ "3" }) SBAS：Stanford MAAST（commit 7d32b049）の usr_vhpl を無改変で、MAAST 自身が記録した WAAS の放送に対して実行しました。L1 のレベルは K の再スケーリング後に { "1e-4" } m 以内で、保護される集合も等しくなっています。これらの同じ比較から、この機能に記載した調査結果が得られました。一様シグマの ARAIM 関数は ADD に適合しておらず、L5 の集合の一致は GEO が視界にない { "308" } の組で成立しません（両ツールが保護する { "3267" } の組でのレベルは { "1e-13" } m まで一致します）。DO-229E/DO-316 の K 係数は転記した定数であり、実際の幾何は入力です。どちらもオラクルとは数えません。{ "0.30" } の改訂：snapshot_raim の保護レベルを動径方向から測地の局所水平面へ移しました（北緯 { "16" } 度で HPL が最大 { "0.31" } m、VPL が最大 { "0.14" } m 変わります）

seg-1c37702cc5f2 = 軌道伝搬と軌道決定

seg-4d8ef6c0aa45 = SGP4/SDP4、Cowell 6 自由度 + 摂動、バッチ/逐次 OD

seg-c84585f43297 = AIAA 2006-6753 の SGP4 検証ベクター

seg-50c545872e4f = 数値 Cowell 伝搬器と力モデル

seg-74f8c585bcfd = 階層的な力モデル（二体、J2〜J6 帯状項、太陽/月の第三体、キャノンボール SRP、指数関数的な大気抵抗）を備えた Cowell 数値伝搬器。RK4 ステップ倍化 / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" }（CS GROUP、Apache-2.0）の NumericalPropagator/DormandPrince853：独立したライブラリで、積分器も球面調和関数の漸化式も異なります。保存力の各段階（二体 → J2〜J6 帯状項 → 太陽/月の第三体 → キャノンボール SRP）は { "24" } 時間のアークでサブメートルまで一致しており、積分器と力の代数が検証されています。大気抵抗の段階と、太陽/月エフェメリスと密度入力の絶対的な忠実度は MODELLED のままです（特性評価のみ）

seg-d38c4be472ac = 扁平な地球での SRP の影（オプトイン）

seg-ab8247c6b4d2 = WGS-84 楕円体を掩蔽天体とした SRP の日照割合（太陽方向の楕円体の縁から求めた見かけの地球半径、二円盤レンズの式。srp_shadow::oblate_conical_shadow）。Cowell 力モデルでは propagator::ForceModel::srp_shadow によりオプトインです（既定：従来どおりの球形の円錐状の影で、変更なし）

seg-26c2db527cec = Orekit { "12.2" }（Apache-2.0）の SolarRadiationPressure.getLightingRatio を、WGS-84 と球形の OneAxisEllipsoid の掩蔽天体で、太陽を同じ慣性位置に固定して別プログラムとして実行。合格基準は xval/srp-oblate-shadow-orekit/PREREGISTRATION.md（6d6d269c）で事前登録しました。両方で { "1e-6" }、そして扁平と球の差のばらつきが > { "1e-2" }。すべて満たしました。楕円体の軸は両側とも慣性 z 軸です（歳差・章動なし）

seg-01066d639b39 = ボックスウィングと ECOM2 の太陽放射圧、偏微分付き（オプトイン）

seg-2a5fc9708bd0 = キャノンボールではない SRP：ボックスウィングの平板モデル（Vallado 式 8-44。片面の本体パネル、太陽指向の翼）に、GSC 衛星メタデータにある Galileo FOC、IOV、IOV の寿命末期の各表を用い、通常の GNSS ヨーステアリングで、放射係数と各パネルの鏡面・拡散係数に対する解析的な偏微分を備えます。加えて、偏微分付きの ECOM2 経験モデル（D2/B1）もあります。ボックスウィングは Cowell 伝搬器（propagator::ForceModel::box_wing_srp。srp_boxwing フィールドを設定）と精密軌道決定モデル（precise_od::PreciseForceModel::box_wing_srp）でオプトインで、放射係数としての cr を伴うキャノンボール項を置き換えます。どちらも既定は None で、既存のすべての経路はバイト単位で同一のままです。ECOM2 は力モデルには接続されていません

seg-8f1d7126375c = Orekit { "12.2" }（Apache-2.0）の BoxAndSolarArraySpacecraft を FixedPanel と PointingPanel で、SolarRadiationPressure(dRef = { "1" } au、pRef = 1361/c)、GenericGNSS の通常ヨーと ECOM2(nD = { "2" }、nB = { "1" }) とともに、太陽を固定した慣性位置に置いて別プログラムとして実行。放射係数の導関数は Hipparchus の Gradient から、パネルごとの導関数は Orekit の中心差分で求めました（Orekit にはありません）。合格基準は xval/srp-boxwing-orekit/PREREGISTRATION.md（e59df6bf）で、Orekit の出力が存在する前に事前登録しました。相対で { "1e-12" }（エンドツーエンドで { "1e-11" }、差分で { "1e-9" }）。すべて満たしました（RESULTS.md）。VALIDATED が対象とするのはモデルの評価だけです。GSC の表は転記した入力であり、実際の Galileo 軌道に対するボックスウィングの妥当性、熱再放射、修正された低ベータのヨー則、食のターンは対象外です。Galileo の SRP 予測は MODELLED のままです

seg-bde1b3a94a47 = 太陽の周縁減光を考慮した SRP の影（オプトイン）

seg-eaaec545dd68 = 周縁減光を考慮した太陽フラックスのうち、掩蔽されない割合としての SRP の日照割合（Eddington 近似の法則 I(mu)/I({ "1" }) = 2/5 + 3/5 mu、ガウス・ルジャンドル求積）。球形または WGS-84 の地球を対象とします（srp_shadow::limb_darkened_shadow、ShadowModel の OblateEarthLimbDarkened バリアント）

seg-76cb4b668ad5 = 外部のものはありません：Orekit { "12.2" } には周縁減光を考慮した照明比がありません。同じ法則の閉形式に対してのみ照合しています

seg-673b17e9dcf7 = NRLMSISE-00 の熱圏密度

seg-09e997231de8 = NRLMSISE-00 経験的熱圏モデル（gtd7 と gtd7d：化学種密度、異常酸素を含む全質量密度、温度。{ "24" } 個のスイッチ。日別 Ap と 3 時間ごとの ap 配列のモード）の、NRL の Fortran のパブリックドメインの C 版からの移植

seg-80963ee0de61 = pymsis { "0.13.0" }（MIT）version={ "0" }（NRL の Fortran GTD7D を単精度で実行）と、別プログラムとしてコンパイルした NRLMSISE-00 の C 移植版（リリース { "20190709" }、パブリックドメイン）、さらに C 配布物に含まれる { "17" } 件の公表テスト出力。合格基準は xval/nrlmsise00-pymsis/PREREGISTRATION.md（e90ae26a）で、移植が存在する前に事前登録しました。すべて満たしました（RESULTS.md）。検証するのは移植であり、実測密度に対するモデルの精度ではありません

seg-12977f65b2ea = NRLMSISE-00 の大気抵抗密度の段階（オプトイン）

seg-17aec847b675 = forces::DensityModel（既定は Exponential、Nrlmsise00 { "{" } f107a, f107, ap { "}" }）と propagator::ForceModel::drag_density：共回転する大気に対する二次の大気抵抗で、WGS-84 測地点での NRLMSISE-00 の密度を用います（UT1 = TT での地球自転角、地方太陽時 UT + lon/15）。宇宙天気はモデルごとに一定で、既定はオフでビット単位で同一です

seg-3878bf3b62d7 = Orekit { "12.2" }（Apache-2.0）の NumericalPropagator/DormandPrince853 を、Orekit 自身の NRLMSISE00 実装による DragForce とともに、同じ地球自転角の座標系、WGS-84 の形状、地方太陽時の規約（平均太陽）、UT としての TT で、別プログラムとして実行。規約の設定はオラクル同士で照合しました（Orekit 対 pymsis、密度で { "5.2e-5" }）。合格基準は xval/drag-tier-orekit/PREREGISTRATION.md（{ "21647478" }）で事前登録しました。大気抵抗による変位の { "0.5" } m + { "1e-3" }、および > { "100" } m の感度チェック二件。すべて満たしました。対象外：実測密度に対するモデルの精度、時間変化する宇宙天気、GMAT による検証

seg-1ac7430e88fc = 既定の指数関数的な大気抵抗を独立した実装と照合（赤道）

seg-a9c41b03f2ca = Cowell 伝搬器の既定の大気抵抗：共回転する大気に対する二次の大気抵抗で、forces::atmospheric_density、すなわち球面高度での Vallado 表 8-4 の区分指数関数表を使います（propagator::ForceModel::drag と、forces::DensityModel の既定の Exponential バリアント）

seg-e2e177761b30 = GMAT R2022a（NASA GSFC、Apache-2.0）の GmatConsole を、Exponential 大気（同じ 28 バンドの表）、質点の地球、PrinceDormand78 で実行し、同梱はしていません。合格基準は xval/drag-exponential-gmat/PREREGISTRATION.md（640c85c1）で、双方の大気抵抗による変位（大気抵抗ありの実行から、なしの実行を引いたもの）について事前登録しました。これにより両者の地球の mu 値と積分器の違いが打ち消されます。すべて満たしました（RESULTS.md）。GMAT は測地高度、kshana は球面高度を取るため、両者が一致するのは赤道上だけであり、VALIDATED が対象とするのは赤道軌道です。赤道を外れると、モデルは設計上異なります（{ "24" } 時間の変位の { "10.4" } %、{ "51.6" } 度、{ "400" } km）。GMAT の公開ビルドには NRLMSISE-00 がない（プラグインなし）ため、NRLMSISE-00 の段階には Orekit のオラクルしかありません。表の実測密度に対する精度は対象外です

seg-9e15970435c3 = Cowell 力モデルでの DE440 の太陽と月（オプトイン）

seg-de6831cf7785 = 数値 Cowell ForceModel の第三体と SRP の項に対するオプトインのエフェメリス段階：任意の EphemerisProvider（KernelEphemeris を通じた DE440 SPK カーネル）から、TDB = TT + (TDB - TT) で地心の太陽と月を取得します。そのエポックを提供できないプロバイダーは拒否し、解析級数へのフォールバックはすべて数えます。既定はオフです

seg-50027b9f4251 = Orekit { "12.2" }（Apache-2.0）の NumericalPropagator/DormandPrince853 を、ThirdBodyAttraction と SolarRadiationPressure とともに、Orekit 自身の DE440 リーダー（orekit-data lnxp1990.440）で、別プログラムとして実行。kshana は NAIF の de440s.bsp をビット単位で一致させ、SPICE で確認した切り出しを読みます。合格基準は xval/propagator-de440-orekit/PREREGISTRATION.md（22a5a01d）で事前登録しました。軌道の基準（{ "0.5" } m）と感度の対照は満たしましたが、太陽/月の位置の基準（{ "3" } m / { "0.2" } m）は { "6.39" } m / { "0.244" } m で届きませんでした。同じカーネルを正確な TDB で読む SPICE も、Orekit から同じ程度ずれます（{ "6.25" } m / { "0.240" } m）。そのため差は NAIF の de440s の経路と Orekit の DE440 リーダーまたは時刻系の間にありますが、原因は特定できていません。記録して固定したので、この行は MODELLED のままです

seg-057c21daf4f2 = S1 大気潮汐（オプトイン）

seg-f600a39f297e = 日周の S1 気圧潮汐を、ジオポテンシャルの摂動として扱います：Biancale と Bode（{ "2006" }）のモデル N1、次数 { "2" } から { "6" } を、IERS { "2010" } 式 { "6.21" } の荷重の式（tides::atmospheric_tide_s1、s1_air_tide_acceleration）で適用し、Cowell モデルと精密力モデルでオプトインです（air_tide_s1、既定はオフ）

seg-7dd9fccac779 = ジオポテンシャルへの効果について、外部のものはありません。{ "24" } 個の係数は GFZ STR06/01 の表 { "1" } のモデル N1 から転記し、報告書と行ごとに再確認しました（SHA-256 890865ae）。次数 { "0" }、{ "1" }、{ "7" }、{ "8" } は使いません。Ray と Ponte（{ "2003" }）は球面調和関数の表を載せていないため、二つ目の情報源との比較はしていません

seg-b150b1bdb599 = IERS の規約での S2 大気潮汐係数

seg-87e9238b8c53 = Ray（{ "2001" }）の S2 気圧の調和成分（n <= { "4" }、順行と逆行）を、IERS { "2010" } 式 6.20-6.21 の完全正規化・正弦先行の形（振幅を N_nm で割り、epsilon = { "90" } deg - psi）に変換し、tides::atmospheric_tide の S2 項として適用

seg-4745148b6c60 = Biancale と Bode、GFZ Scientific Technical Report STR06/01（{ "2006" }）、表 { "5" }、モデル A2：Ray（{ "2001" }）が完全正規化の調和成分と正弦先行の位相で公表したもので、同じモデルの独立した表現です。それが検証する修正とともに xval/s2-air-tide-fix/PREREGISTRATION.md（5e31c37a）で事前登録しました。対象は係数の変換のみで、気圧潮汐のジオポテンシャルへの効果には外部オラクルがありません

seg-444f0a65b6fd = Cowell 伝搬器でのテッセラル項を含むジオポテンシャル

seg-ad475816bc78 = 数値 Cowell ForceModel の中心重力として、オプトインの EGM2008 テッセラル場（次数・位数 { "70" } まで）を使います。IAU { "2000" } の地球自転角（または CIO の GCRS から ITRS への連鎖）で回転させた地球固定座標系で評価し、既定はオフなので既存の出力は変わりません

seg-e6db530c96c7 = Orekit { "12.2" }（CS GROUP、Apache-2.0）の NumericalPropagator/DormandPrince853 を、同じ係数（tools/egm2008_to70.gfc）に対する HolmesFeatherstoneAttractionModel とともに、同じ地球自転角の式で回転させた天体固定座標系で、別プログラムとして実行。合格基準は事前登録しました（f0e0e65。比較の前に 2da899a で修正）：|dr| <= { "0.5" } m かつ |dv| <= { "5e-4" } m/s、さらに二つの負の対照がどちらも > { "100" } m 外れること。すべて満たし、その後基準を { "0.1" } m と { "1e-4" } m/s に厳しくしました。検証していないもの：地球姿勢の忠実度（Era 座標系では両側とも歳差・章動なしで UT1 = TT を使用）、Cio 座標系オプション（内部チェックのみ）、次数 { "70" } を超える次数

seg-e8f5ff8c9149 = 高次の球面調和重力（EGM2008 を { "2190" } 次まで）

seg-d3b2f32dcecb = 完全正規化された場を次数 { "2190" } まで、アンダーフローと極に対して安全に評価します（SphericalHarmonicField::acceleration_hf / potential_hf。Holmes-Featherstone { "2002" } の修正順方向列漸化式で、勾配に 1/cos phi を含みません）。ストリーミングの ICGEM .gfc ローダー（from_gfc_file / from_gfc_reader。完全な EGM2008 は同梱せず実行時に取得）と、オプトインの Cowell Geopotential で選べる Holmes-Featherstone 評価器もあります

seg-8651532685f3 = Orekit { "12.2" }（Apache-2.0）の HolmesFeatherstoneAttractionModel と pyshtools { "4.14.1" }（BSD-3-Clause）の MakeGravGridPoint を別プログラムとして実行。合格基準は xval/high-degree-gravity/PREREGISTRATION.md（276c869f）と xval/cowell-tesseral-200-orekit/PREREGISTRATION.md（0aa312a6）で事前登録しました。Orekit は定義されているすべての場所で一致しますが、pyshtools は極近傍の二点で事前登録した基準に届きません（最大 { "7.3e-10" } m/s^{ "2" }。50 桁の mpmath チェックでは誤差は pyshtools 側にあります）。極軸上ちょうどにはオラクルの値がなく、{ "24" } 時間軌道について事前登録した次数 70 の感度の対照も届きませんでした（{ "0.726" } m で、> { "1" } m に対して）。外れはどれも記録しており、調整で消してはいないため、この行は MODELLED のままです

seg-e81b7418c382 = DOP853 積分器

seg-e6e3638aa68e = Hairer の DOP853 { "8" }({ "5,3" }) 陽的ルンゲ・クッタ法で、5 次/3 次を組み合わせた誤差推定量、SciPy/Hairer のステップ制御、自動の初期ステップ、失敗時に閉じるステップガード、7 次の稠密出力を備えます。伝搬器の Integrator バリアント Dop853 / propagator::propagate_dop853 として選べます

seg-6ea79a5b89e9 = SciPy { "1.18.1" }（BSD-3-Clause）の solve_ivp(method=DOP853) と、その単一ステップ、誤差ノルム、稠密出力、初期ステップのルーチン（独立した実装）。厳密な二体の状態は mpmath { "1.3.0" } で { "40" } 桁。合格基準は xval/dop853-scipy/PREREGISTRATION.md（ae1b25e）で、最初の比較の前に事前登録しました。すべて満たしました（xval/dop853-scipy/RESULTS.md）。フル実行では SciPy の最初のステップを両方のソルバーに与え、初期ステップのルーチンは別に比較しています。対象外：RKF7({ "8" })、剛性の検出、イベント位置の特定

seg-9ad7c1f4da77 = 頑健なケプラー方程式ソルバー

seg-4b9d812fd13e = すべての { "0" } <= e < { "1" } とすべての平均近点角に対する楕円ケプラーソルバー：Markley（{ "1995" }）の三次の初期値と五次の補正、桁落ちのない残差 (1-e)E + e(E - sin E) - M、保護付きのニュートン法による仕上げ（kepler::solve_kepler_markley、propagator::solve_kepler_robust）

seg-6fedaf34608d = mpmath { "1.3.0" }（BSD-3-Clause）の、厳密な二進入力からの 50 桁の根。合格基準は xval/kepler-mpmath/PREREGISTRATION.md（df22174）で、|E| に対する相対値として、e -> { "1" }、M -> { "0" } の条件数の議論とともに事前登録しました。すべて満たしました（xval/kepler-mpmath/RESULTS.md）。従来のソルバー（solve_kepler_checked、orbit::solve_kepler、ephem::solve_kepler）は、コミット済みの出力がそれらに依存しているため数値的に変更しておらず、この行の対象外です

seg-1960804ef2f4 = 局の可視マスクを伴う、距離変化率と方位角/仰角のバッチ軌道決定

seg-4c185244bc66 = 仰角マスク以上の、距離、距離変化率、方位角/仰角の混在した追跡から、H = (dh/dx(t)) Phi(t, t0) に対するガウス・ニュートン法でエポックの状態を復元します。解析的な測定偏微分と、二体 + J2 の解析的な偏微分を持つ変分状態遷移行列（RK4 で積分。閉形式の STM ではありません）を使います

seg-6c6a42c25433 = Orekit { "12.2" }（Apache-2.0）の BatchLSEstimator を、カスタムの瞬時幾何 RangeRate と AzEl 測定（Orekit の TopocentricFrame と照合済み）とともに、同一のマスク済みでシード付きの観測に対して、別プログラムとして実行。合格基準は xval/od-measurements-orekit/PREREGISTRATION.md（0cf9076）で事前登録しました。B4（ノイズなしの状態一致 { "1" } cm）を除いてすべての基準を満たしましたが、これは { "2" } / { "4" } のシナリオで届きませんでした（{ "1.46" }、{ "1.74" } cm）：Orekit 自身のノイズなしの推定が、そのシミュレーションの真値からそれだけ離れています（Orekit 側の原因は特定できていません）。記録して固定したので、この行は MODELLED のままです。モデル化していないもの：光行時間、光行差、屈折、地球自転、これらの測定種別向けの逐次フィルター

seg-bc3d1ee7c639 = SP3 精度コードによる観測の重み付け

seg-63b1fab84f85 = SP3 の精度コード（ヘッダーの ++ の指数は { "2" }^n mm、%f の底、レコードごとの底^n mm の標準偏差）を、精密軌道決定エンジン向けの観測ごとの位置シグマに対応づけます（sp3::parse_sp3_accuracy、Sp3Accuracy::position_sigma_m）

seg-ebecb8906506 = 外部のものはありません：重みはモデル化上の選択です（SP3 形式は、このコードを提供者の精度指標としか定義しておらず、ここでは軸ごとの一シグマとして読んでいます）。既存の記録済み機関の実行は変更していません

seg-e35df6881c80 = PDS SHADR テーブルからの惑星重力場

seg-f78b73ae8742 = PDS SHADR 球面調和テーブルを読み込み（src/gravity_pds.rs の SphericalHarmonicField の from_shadr。単位変換、与えられた C00 = { "1" }、完全性と正規化のチェック）、火星 GMM-3（d/o { "120" }）と GRAIL の月重力場 GL0660B（d/o { "660" }）の天体固定重力を評価します

seg-08590d67a7d3 = pyshtools { "4.14.1" }（BSD-3-Clause）が同じ PDS ファイルを読んで点重力を評価したもの（別プログラムとして実行）と、公表されている PDS プロダクトのヘッダーとラベル。合格基準は xval/planetary-gravity-pyshtools/PREREGISTRATION.md（32c5b50）で事前登録しました。すべて満たしました（RESULTS.md）。データ：NASA PDS Geosciences Node、パブリックドメイン。次数 20 で切り出したものを NOTICE 付きで同梱し、完全なファイルはテスト時に取得します

seg-ae3e8833a5ef = 公表された重力場を天体に接続

seg-ffb2b20e5f32 = with_gravity_field（src/gravity_pds.rs の Body 上）：読み込んだ任意の球面調和場（例：GMM-3 や GL0660B）を Body に接続し、伝搬器が天体固定で評価するようにします。オプトインで、既定の天体は変わりません

seg-bcb731f7a9b5 = 内部整合性のみ。公表された各重力場は、それぞれの作成元の天体固定座標系で定義されており（GMM-3 は Konopliv ほか { "2006" } の火星座標系、GL0660B は DE421 の月主軸座標系）、一方でこの重力場は IAU 座標系で評価されます。その差はモデル化していません

seg-659bfeba459c = バッチ軌道決定と逐次軌道決定

seg-dbc98f498941 = 二体 + J2 の力モデルの下で、地上局からの測距から、ガウス・ニュートン型のバッチ微分補正器と逐次フィルターによりエポックの状態 [r,v] を復元します

seg-ecfce82a4e3d = Orekit { "12.2" }（CS GROUP、Apache-2.0）の BatchLSEstimator（Levenberg–Marquardt）+ KalmanEstimator（EKF）：一致させた力モデル上の、独立したサードパーティの推定ライブラリ。復元したエポック状態とフィット後の残差 RMS は、ノイズなしで <{ "1e-3" } m、{ "5" } m のノイズフロアで <{ "3" } m の範囲で一致します

seg-acdac055acb9 = 深宇宙の電波計測の光行時間ソルバー

seg-62a478e40850 = 深宇宙の電波計測航法（地球→火星/太陽/月）のための、遅延（下りレグ）の一方向光行時間の解 τ = |r_rx − r_target(t−τ)|/c

seg-a38690bb69fa = ANISE { "0.10" }（Nyx Space、MPL-2.0）の収束ニュートン型の光行差光行時間（Aberration::CN。SPICE の spkapo 相当）を JPL DE440 上で実行：独立した Rust の SPICE 実装であり、kshana の固定点法の遅延ソルバーはサブナノ秒まで一致しました。より広いドップラー / シャピロ / 簡約力学の OD の数値は MODELLED のままです

seg-c69ef9342160 = 放送エフェメリスによる衛星位置（マルチ GNSS RINEX）

seg-62702fc6f242 = 解析した RINEX-3 航法レコードからの、IS-GPS-200 / Galileo-OS / BeiDou-OS 放送エフェメリスのケプラー要素 → ECEF 衛星位置

seg-cb66d33b7ba7 = C のソースからコンパイルした RTKLIB v2.4.2-p13 の eph2pos()（T. Takasu、BSD-2-Clause）：独立した IS-GPS-200/SIS-ICD の実装で、同一の RINEX-3 航法レコードを入力し、衛星の ECEF 位置は約 { "62" } nm まで一致しました。（SP3 精密エフェメリスの補間は別に検証しています。「SP3 精密エフェメリスの補間」を参照）

seg-c807a782b20e = SP3 精密エフェメリスの補間

seg-238de70daab9 = SP3 精密エフェメリスの衛星位置に対する、IGS 標準のラグランジュ補間に、ノードごとの地球自転補正を加えたもの（多項式の当てはめの前に、各ノードを ω⊕·(t_node−t) だけ回転させて、問い合わせ時刻の地球固定座標系に合わせます）

seg-e9249ae44a11 = C のソースからコンパイルした RTKLIB の peph2pos()（preceph.c。T. Takasu、BSD-2-Clause）：事実上の IGS 基準であり、独立した実装です。kshana の補間器（現在は同じ地球自転のノード補正を備えています）は、実際の SP3 プロダクトで約 { "15" } nm まで一致しました。補正前の約 { "5.5" } cm から改善しています

seg-9762cf428435 = GPS LNAV 以外の航法メッセージエンコーダー（GPS CNAV、Galileo I/NAV と F/NAV）

seg-9b703b9607d8 = GPS CNAV のメッセージ種別 10/11/30、通常の偶数/奇数ページでの Galileo I/NAV のワード種別 1-5、Galileo F/NAV のページ種別 1-4：ICD のフィールドパッキングと量子化、CRC-24Q、レート 1/2 K={ "7" } の畳み込み符号化（Galileo では G2 を反転）、ブロックインターリーブと同期パターン、対応するテスト用デコーダー付き

seg-7939b210e83c = 内部の往復変換と ICD の既知解のみで、サードパーティのデコーダーは実行していません（KSHANA_NAVMSG_ORACLE_JSON を読む RTKLIB/GNSS-SDR ハーネスは、データが揃うと動く方式です）。MODELLED

seg-5ce7cd3d6011 = 実際の CODE GIM での IONEX 全球電離圏マップのリーダーと補間

seg-502656556ddf = IONEX { "1.0" } リーダー（ヘッダー、固定桁の I5 値、TEC と RMS のマップ、絶対エポック、欠損値）に、双一次の空間補間、形式が定める最近傍 / 連続 / 回転マップの時間補間（式 1-3）、薄殻のスラント TEC を加えたもの

seg-1575dc4cfb4a = CODE GIM の印字された値（すべてのノードで厳密。ライセンスが未確認のため、マップは同梱せずテスト時に取得）と、フィクスチャとともにコミットした IONEX { "1.0" } 補間式の、独立した Python 標準ライブラリによる再実装（合格基準は e4d8b1f で事前登録、{ "1e-9" } TECU）。サードパーティによる確認（B6、事前登録済み、初回実行）：RTKLIB v2.4.2-p13 の iontec（BSD-2-Clause、別ツールとして実行）が { "6885" } の問い合わせ点で、両方の補間モードにおいて IonexFile::vtec_at と { "3.6e-13" } TECU まで一致し、基準は { "1e-5" } TECU でした。データ依存：CODE GIM はテスト時に取得し、SHA を固定しています。RTKLIB は getindex が緯度の切り出しを拒否するため、ファイル全体を読みます。tests/fixtures/ionex_code_gim/fetch.sh が取得して SHA-256 を確認し、他のバイト列ならテストは失敗します。run_rtklib.sh が文書化された再現手順です（ネットワークアクセスが必要）。データ依存のエビデンスに基づく所有者の判断により、VALIDATED に引き上げました（2026-10-13）

seg-974d8c1f7876 = 実際の RINEX 観測での Hatch 搬送波スムージング

seg-f26b5da0f52e = 精密単独測位の組み立ての中での、発散しない Hatch フィルター（電離圏フリーの搬送波で運ぶ電離圏フリーのコード、ウィンドウは N エポック、ロスオブロック、幾何学フリーのジャンプ、欠測で再起動）

seg-fac84cb9b256 = 所見：公表された ITRF2020 の WTZR 座標に対して、事前登録した基準（スムージング後の中央値と p95 が生の { "0.6" } 倍以下。tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md）には届かず、比率は { "0.718" } と { "0.923" } でした。残るメートル級の誤差はバイアス的なもの（C1C のコードバイアス、アンテナ、潮汐、長周期マルチパス）であり、スムージングが除去するホワイトノイズではありません。MODELLED：フィルターの統計は内部でチェックしています

seg-2eec513ae8c8 = 実際の RINEX 観測での、LAMBDA による整数値固定を伴う RTK 二重差

seg-6571676bf918 = 実際の二周波 GPS のコードと搬送波位相による短基線の相対測位：最高仰角の衛星に対する二重差とその完全な共分散、基線と一重差アンビギュイティに対するフロートカルマンフィルター（スリップ時に再初期化）、比検定を伴う LAMBDA 整数最小二乗、そして固定した整数値で条件付けた基線です

seg-e50c5d4b65c7 = WTZR と WTZZ の公表された ITRF2020 座標（IGN ITRF2020_GNSS.SSC、解 { "3" }、RINEX のアンテナ高付き）が基準基線を与えます。合格基準は、コードを書く前に tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md で事前登録しました。短基線のみで、電離圏と対流圏の二重差はモデル化していません

seg-f9aa0c529393 = IGS 最終局時計に対する PPP 受信機時計の時刻解

seg-83ad9e893db9 = 実際の二周波 GPS のコードと位相に対し、IGS 最終軌道・時計を用いた静的フロート PPP フィルターが推定する受信機時計：受信機から IGS 時刻への時刻比較であり、PPP の電離圏フリーの時刻解です。

seg-91a882dd71e8 = 局 WTZR に対する IGS 最終統合時計（IGS0OPSFIN_20250550000_01D_05M_CLK の AR レコード、SHA-256 d19f3d45...993d。複数の解析センターのネットワーク解の統合。IGS プロダクトで、出典を明記すれば自由に使えます）。合格基準は、比較の前に xval/ppp-time/PREREGISTRATION.md で事前登録し、初回実行ですべて満たしました。対象外のもの：一つの局と二時間の収束した区間のみ。IGS 時刻であり UTC(k) ではない。一定のオフセットには受信機のコードバイアスが含まれ、有界ですが較正はされていない。Circular T へのトレーサビリティはない。

seg-a9b2a93401a3 = 実際の RINEX 観測でのフロート精密単独測位

seg-cc991ccec112 = IGS 最終軌道・時計を用いた、実際の二周波 GPS のコードと搬送波位相に対する静的フロート PPP 拡張カルマンフィルター：電離圏フリー結合、衛星と受信機のアンテナオフセット（受信機の変動）、固体地球潮汐、位相ワインドアップ、シャピロ遅延、推定した天頂湿潤遅延、幾何学フリー / Melbourne-Wübbena スリップ検出を伴うアークごとのフロートアンビギュイティ

seg-36e7c9286af7 = WTZR の公表された ITRF2020 座標（IGN ITRF2020_GNSS.SSC、解 { "3" }、速度で伝搬）。合格基準は、フィルターを書く前に tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md で事前登録しました。開発は同じ場所の局 WTZZ のみで行いました。モデル化していないもの：海洋荷重、衛星 PCV、整数アンビギュイティの決定

seg-c8d87abed330 = RINEX { "4" } 航法ファイルの読み込み

seg-28913a01af00 = RINEX 4.00-4.02 の航法ファイル：GPS LNAV、Galileo I/NAV と F/NAV、BeiDou D1/D2、QZSS LNAV の <c1/> レコードを放送エフェメリス型に復号します。CNAV、CNV1-3、FDMA、SBAS、STO、EOP、ION のレコードは、次のレコードヘッダーまで読み飛ばします。ヘッダーが別の衛星を指すレコードや、途中で切れたレコードは拒否します

seg-687b3b159691 = 同じ日の IGS の RINEX { "3" } 統合放送ファイル（公開データで、同じ放送メッセージから別のファイル生成器が書き出したもの）。合格基準は tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md（7aa264b）で、最初の実行の前に事前登録しました

seg-278ca396127a = RINEX { "4" } 観測ファイルの読み込み

seg-e0883aa933eb = RINEX 4.0x の観測ヘッダー（DOI、LICENSE OF USE、STATION INFORMATION、MERGED FILE。ラベルはバージョン { "4" } 以降で 61-80 桁目に対応）とエポックレコード

seg-971fb1203a6d = 実際に公開された RINEX { "4.00" } ファイル（読み戻した値がファイルの印字リテラルと等しい）と、仕様から導いたヘッダーでの形式適合性。独立したリーダーは実行していないため、MODELLED

seg-33e5c74720ff = BeiDou GEO の放送衛星位置

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } の、放送エフェメリスからの静止衛星の位置（慣性系に近い座標系、その後 Rz(Ω̇e·tk)·Rx(−{ "5" }°)）。NavParseOptions の include_beidou_geo フィールドでオプトインするため、既定のリーダーは今も GEO を読み飛ばします

seg-06d500099814 = GEO を含む IGS MGEX の精密軌道に対して事前登録しました（7aa264b、110fef9）。構築したセッションからはそのようなプロダクトに到達できなかったため、比較は保留中で、この行は MODELLED です（公表された公称の GEO スロットとの照合のみ）

seg-559814996a4c = SP3 精密時計の補間

seg-8e7a0dbd1755 = 表になった SP3 時計ノードの間の衛星時計オフセットを、両側の有効な二つのノードで線形補間して求めます（RTKLIB の pephclk 方式。不良時計のセンチネルは読み飛ばし）。また、同じノードを RINEX 時計相当のレコードとして精密プロダクトの連鎖に渡します

seg-1f4f0f841802 = IGS 最終 { "30" } s 衛星時計の統合（IGS0OPSFIN 30S CLK、2025-02-24）：問い合わせ時刻での公表された時計推定値であり、SP3 から補間したものではありません。合格基準は tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md で、最初の実行の前に事前登録しました（RMS { "0.15" } ns、p95 { "0.30" } ns、ノード中央値 { "1e-12" } s、識別力 2x）

seg-71f48628ebb2 = フロートアンビギュイティを伴う搬送波位相のタイトカップリング GNSS/INS

seg-5a156aa81275 = { "15" } の INS 状態に対する誤差状態 EKF、二状態の受信機時計、追跡中の衛星ごとに一つのフロート搬送波アンビギュイティ。SGP4 ウォーカーコンステレーションからの疑似距離、搬送波位相、オプションの距離変化率（光行時間とサニャック効果）、フィルター自身の位置でループ内に適用するクロバチャーと Saastamoinen/Niell の補正、速度の不確かさで広げた衛星ごとのしきい値による時間差分搬送波のスリップ検出、スリップ時の再初期化と再捕捉でのアンビギュイティ再初期化を備えます

seg-00576e8c1032 = 内部整合性：測定値はフィルターが使うモデルから合成しています（シードごとの χ² NEES/NIS、ノイズなしの収束、スリップの注入）。MODELLED。実際の受信機データやサードパーティのフィルターとは比較していません

seg-7d644516b1ec = タイトカップリングのオプションを備えた、GNSS/INS の海上・鉄道・航空パック

seg-cbb03a8baf73 = 軌跡ライブラリ上の三つの gnss-ins シナリオ（{ "8" } m/s で蛇行し五分間の途絶がある船舶、衛星が二つしか見えない切り通しとトンネルを通る列車、途絶が 25 度のバンクターンにまたがる航空機）と、パックのオプションの [tight] テーブル：SGP4 ウォーカーコンステレーションからの疑似距離を閉ループ航法器で融合し、正常時はマスク以上のすべての衛星を、劣化時は最も高い数機だけを使います

seg-273c14256d4c = 内部：各パックの性能指標を自身の真値に対して評価し、同一入力でルーズ/タイトの比較を行います。MODELLED。監査で挙がった NaveGo との比較は実行していません

seg-f4dab73c4eda = バイアス状態を持つ連成疑似距離 PNT フィルターと、フュージョンパックの 3-D 拡張

seg-742b60089361 = 位置、速度、時計位相、周波数にわたる一つの積み上げカルマンフィルターで、位置と時計を連成させる疑似距離を入力とします（交差共分散を保持する Joseph 形式の更新）。定数の加速度計バイアス状態で拡張した 1-DOF の変種は、フュージョンパックが [coupled] の下で実行します。さらに、視線方向の行を持つ 3-D 8 状態版もあります

seg-9558d7aad3af = 内部整合性：真値はフィルター自身のモデルからシミュレートしています（モンテカルロのシードにわたる χ² NEES、同一センサーでの非連成パック）。MODELLED

seg-4a64aa1fe3ca = KF-GINS データセットでの、レバーアームを伴うルーズカップリング GNSS/INS EKF

seg-30f503856ac5 = IMU の増分で駆動される閉ループの 15 状態の誤差状態 EKF で、GNSS アンテナ位置をレバーアームモデル H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }] で融合し、KF-GINS の YAML ファイル（初期状態とシグマ、ARW/VRW、ガウス・マルコフバイアス）から設定します

seg-b01d28a09abe = データセットの公表された参照軌跡と、KF-GINS の C++ プログラム（GPL-3.0、commit 8291a93e、別ツールとして実行）。合格基準は xval/kfgins/PREREGISTRATION.md で事前登録しており、その登録の前に KF-GINS をこのデータで実行してはいません（Results で確認済み）。六つの基準すべてが初回の実行で満たされました。データゲート付き：KF-GINS のデモデータセット（実際の Leador-A15 IMU と RTK GNSS、参照軌跡付き）にはライセンスがないため同梱しません。xval/kfgins/fetch.sh がテスト時に、各ファイルの SHA-256 を固定して取得し、不一致ならテストは失敗します。ネットワークアクセスが必要な再現手順は xval/kfgins/PREREGISTRATION.md にあります。データゲート付きのエビデンスに基づく所有者の判断により、VALIDATED に引き上げました（2026-10-13）

seg-e6b6c605564c = シミュレーターのモーションファイルリーダー（gps-sdr-sim）による、test bench出力の読み込み

seg-a07429aa1998 = オープンソース GNSS シミュレーター自身のリーダーに渡したbench出力のモーションファイルは、出力した軌跡として読み戻せます：NMEA GGA ファイル（-g）、モーション CSV の時刻/緯度/経度/高さの切り出し（-x）とその時刻/x/y/z の切り出し（-u）で、{ "6" } の gnss-ins シナリオ（海上・鉄道・航空パックを含み、シミュレーターの 3000 サンプルの上限まで読み込み）と、{ "2" } の静止シナリオが対象です。モーションのみで、信号は書き出しも生成もしません。

seg-07b5f46a900f = 外部で確認されている範囲（限定して記述）：gps-sdr-sim（MIT、commit 28ca29a6）の readNmeaGGA、readUserMotion、readUserMotionLLH を、自身の WGS { "84" } llh2xyz とともに xval/testbench-gpssdrsim/driver.c 経由で呼び出し（信号関数は呼び出していません）、モーション CSV の地球固定の列と行ごとに照合しました。合格基準は、実行の前に xval/testbench-gpssdrsim/PREREGISTRATION.md で事前登録しています。{ "8" } のシナリオすべてで、すべてのサンプルが読み込まれ、NMEA は最悪で { "1.21" } mm（基準は { "1" } cm）、LLH の切り出しは最悪で { "0.145" } mm（基準は { "1" } mm）、四列の地球固定の切り出しは厳密に一致（基準は { "1" } um、修正 { "1" }）、gnss-ins の行はシミュレーターの { "10" } Hz グリッドに { "2.3e-13" } s まで一致しました。所見（実行 { "1" }、固定）：ヘッダーを除いた全幅の CSV は -u では読めません。リーダーの 100 文字の行バッファが、161 文字の各行を二つのサンプルに分割してしまうためで、四列の切り出しは docs/TEST-BENCH.md に示しています。対象外のもの：シナリオの真値軌跡の物理、gps-sdr-sim の信号出力、他のシミュレーターのリーダー、あらゆる受信機。

seg-2db2b9dc3b45 = GNSS/INS 軌跡ライブラリと CSV 真値の取り込み

seg-e1fe83c75a6c = gnss-ins パック向けの選択可能なモーションプロファイル（直線、8 の字、市街地のストップアンドゴー、航空機の上昇と協調旋回、測量ドローン）。オイラーレートと進行方向加速度の指令で定義し、運動学的 IMU（向心力、重力、コリオリの項）で真値の状態に閉じています。また、取り込んだ CSV の真値を、それを再現する IMU に変換します。プロファイルが指定されない場合、従来の走行は変わりません

seg-30ea002a06a0 = 内部：剛体運動学の恒等式、CSV の往復変換、フィルター自身の共分散。MODELLED（実際の走行ログとは比較していません）

seg-8685fd899e3c = ストラップダウン INS の機械化

seg-ba942e322f8a = (Δθ, Δv) の増分から航法状態を伝搬する、クォータニオン姿勢の WGS-84 NED ストラップダウン慣性機械化（コーニング/スカーリング補償付き）

seg-5cfcb186d59e = Octave で実行した NaveGo v1.4（R. Gonzalez ほか、LGPL-3）：同一の (Δθ,Δv) 増分ストリームで駆動した、独立して公開されている INS ツールボックスです。姿勢はビット単位で一致します（NED / スカラー先頭クォータニオン / 地球自転率 / 輸送率の規約は同じ）。速度と位置は、文書化された二つの違いを除いて一致します。一つは、NaveGo が含み kshana が設計上省く鉛直線偏差の北向き重力項（鉛直線の重力。Groves の閉形式とすべての桁で一致し、健全性の下限のアサートあり）、もう一つは O(dt²) の積分器の違いで、機械化の誤りではありません

seg-d1a5c8e7ca74 = 重力場の汎関数の合成（重力支援 / GNSS フリー航法マップ）

seg-8336eb12eb7b = 任意の ICGEM .gfc モデルからの、球面調和の重力の大きさと擾乱（mGal）。GRS80 の標準重力

seg-b5a7fc986751 = GRS80（Moritz { "1980" }、IAG）の Somigliana 標準重力と、公表されている γ_e/γ_p。実際の ICGEM EGM2008 場

seg-86f9186bb884 = 地球・月 CR3BP の { "9" }:{ "2" } NRHO と、CAPSTONE が実際に飛んだ軌道との比較

seg-d4127cf241f3 = cr3bp::differential_correct_halo が補正する、円制限の { "9" }:{ "2" } の L2 南側の近直線ハロー軌道（Gateway と CAPSTONE の軌道ファミリー）を、その平均的な幾何（周期、近月点半径、遠月点半径）について、CAPSTONE が実際に飛んだ軌道と比較します。CR3BP のメンバーが実際の軌道をどれだけ記述できているかの測定であり、CR3BP の軌道はエフェメリスモデルの軌道ではなく、エポックごとの比較はしていません

seg-e0cc33dfb10b = JPL Horizons の再構成された CAPSTONE エフェメリス（NAIF -1176、CAPSTONE_merged、月中心 ICRF、2023-03-01..31、{ "10" } 分間隔）に対して測定。バイト単位で同一のままコミットしており（tests/fixtures/capstone_horizons/、NOTICE.md）、取得する前に { "4e868170" } で事前登録しました。平均的な幾何に対する基準付きの測定です。検証ではありません：CR3BP は太陽、月の離心率、CAPSTONE が行った軌道維持を省いているため、基準が示すのはモデル軌道がどれだけ代表的かであって、精度ではありません。結果：docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

seg-c866a5bd4318 = DE440 の地球・月の線上で、月中心 ICRF に写像した CR3BP の回転系の状態

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf は、無次元の地球・月 CR3BP の回転系の状態を、瞬時の地球・月の線上で月中心 ICRF の位置と速度に写像します（長さの単位は地球・月間距離、時間の単位は軌道角速度の逆数、座標系の完全な角速度は、月の加速度に由来する面外の角速度を含みます）。逆変換は from_moon_centred_icrf で、cr3bp::to_moon_centred_icrf_de440 は DE440 SPK から地心の月の状態を読みます。これは状態を写像するものであり、CR3BP の軌道をエフェメリスモデルの軌道にするものではありません

seg-d91ce10ea439 = NAIF SPICE Toolkit（spiceypy { "8.3.0" } 経由の CSPICE N0067）の、二ベクトルの動的座標系の sxform（第一ベクトルの +X は地球に対する月の位置に沿い、第二ベクトルの +Y はその速度に沿う。de440s）を、SPICE 自身の月の状態から作った次元付きの回転系の状態に適用し、Kshana のコードを一切呼ばない別プログラムで実行（tests/fixtures/cr3bp_to_mci_spice/、NOTICE.md）。2313eb1b で事前登録し、実行の前に d5ef79b3 で、座標系の面外角速度を含めるよう修正しました（含めない場合、速度は最大 { "8e-2" } m/s ずれます）。変換のみのライブラリチェックです。結果：docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

seg-d543e3e84f36 = JPL カーネル上の solar-system kind（planetary_kernel_path）

seg-e8a96f29afc7 = planetary_kernel_path を指定した <c1/> kind：SPK が固有の NAIF コードを持つ報告対象の各天体は、エンジン自身のリーダーを通じて、カーネルから太陽中心 J2000 の位置と速度を取得します（ラベルは KERNEL）。両端がカーネルにあるリンクはカーネル上で計算し、惑星の代わりに重心を使うことはなく、それ以外の天体は従来どおり解析的でそれぞれのラベルを保ちます。レポートに kernel ブロック（パス、SHA-256、そこから取得した天体とリンク）が加わるのは、このオプションを設定した場合のみです。de440s.bsp では、水星、金星、地球、月が対象です

seg-05cc6642285b = NAIF SPICE Toolkit（spiceypy { "8.3.0" } 経由の CSPICE N0067）が、完全な de440s.bsp 上で行う spkezr による太陽中心の状態。Kshana のコードを一切呼ばない別プログラムです（tests/fixtures/solar_system_kernel/、NOTICE.md）。エンジンはビット単位で一致する de440s の切り出しを読みます。f8e946ea で事前登録しました。接続のライブラリチェックであり、DE440 そのものと解析的な天体はここでは検証されていません。結果：docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

seg-7f3d53b4e8d1 = DE440 エフェメリスでのポークチョップ

seg-bd813d7e0b58 = maneuver::porkchop_kernel：出発日 x 到着日の掃引で、出発 C3（km²/s²）と到着 V-infinity（km/s）を、一周の順行ランベルトソルバーと { "0.5" } 度の共線ガードで求めます。対象は、クレート自身のリーダーが JPL DE440 SPK から読んだ、任意の二つの NAIF 天体の太陽中心 J2000 状態です。一周、順行で、打ち上げ機や到着の制約はなく、掃引であってミッション設計ではありません

seg-bd19ca214f29 = NAIF SPICE Toolkit（spiceypy { "8.3.0" } 経由の CSPICE N0067）による de440s.bsp 上の太陽中心の状態と、pykep { "3.0.1" } の lambert_problem（ESA、C++ の kep3 コア、MPL-2.0。独立したランベルトソルバー）を、Kshana のコードを一切呼ばない別プログラムとして実行（tests/fixtures/porkchop_de440/、NOTICE.md）。エンジンはビット単位で一致する de440s の切り出しを読みます。2d857fb1 で事前登録しました。掃引のライブラリチェックです。結果：docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

seg-b1401bed5da8 = DE440 エフェメリスでのインパルス遷移の最適化器

seg-6c695aef043b = 独立した最適化器：同じ de440s の切り出しの上での NAIF SPICE Toolkit（spiceypy { "8.3.0" } 経由の CSPICE N0067）による太陽中心の状態、pykep { "3.0.1" } の lambert_problem（ESA、MPL-2.0）、SciPy { "1.18.1" } のネルダー・ミード法を用い、Kshana のコードは呼びません。NASA の地球から火星へのハンドブック（MIDAS、エフェメリスは不明、2 日刻みの日付グリッド）は、副次的な公表参照であり、ステータスを決めるものではありません

seg-93f3cdbb7297 = 複数周回のランベルト遷移ソルバー

seg-995a6a995b78 = 最大三周回までの完全な周回を含む、ランベルト問題のすべての解（maneuver::lambert_multirev：一周回の解に続いて、各周回数の左右の分枝。Izzo { "2015" }）を、境界速度 v1 と v2 とともに、順行と逆行の遷移について、正準単位と太陽中心の SI 単位で求めます。周回数ごとの最小飛行時間の { "1" } % 以内の遷移や、180 度に近い幾何も含みます。二体ソルバーのみです（摂動なし）

seg-77c43836cafe = pykep { "3.0.1" } の lambert_problem（ESA、C++ の kep3 コア、MPL-2.0）：独立したライブラリで、scripts/gen_lambert_multirev_ref.py により別プログラムとして実行し、その数値出力のみをコミットしています。比較の前に a75de851（ケースセット、合格基準、結果の規則）で事前登録しました。参照は独立に再生成し、バイト単位で同一でした。結果：docs/design/evidence/lambert-multirev/RESULTS.md

seg-ff9c6140fe1c = ランベルト二体遷移ソルバー

seg-d8c39ced64b2 = LEO→GEO→太陽中心の遷移にわたる、順行と逆行の Izzo-2015 一周ランベルトソルバー（r1、r2、飛行時間 → 境界速度）

seg-d0470acf4f29 = lamberthub { "1.0.0" } の izzo2015（J. Martínez Garrido、MIT）：独立したサードパーティのランベルトソルバー。一周（M={ "0" }）のランベルト問題には唯一の解があるため、ライブラリ同士の一致は本物の外部チェックです。<{ "1e-4" } m/s で一致（観測値は約 { "1e-11" }）し、これは DOP が gnss_lib_py に対して得る検証と同種のものです

seg-347cece5df63 = 座標系と時刻系

seg-5a4bc2c15eaa = IAU 2006/2000A の歳差・章動、CIO による GCRS↔ITRS、うるう秒を考慮した時刻系

seg-51d28ab9d256 = IAU SOFA / ERFA の参照ベクター。Vallado AIAA 2006-6753（{ "0.1" }–{ "4" } mm）

seg-c3d4b9bef817 = 地球軌道の時刻経路における二部構成のユリウス日とうるう秒

seg-5e859e3aa613 = UTC の暦日と時刻を、うるう秒で終わる日（{ "86 401" } s の長さ、{ "23" }:{ "59" }:{ "60" }.x が有効）に対する SOFA の dtf2d 規約で、二部構成の UTC ユリウス日に変換し、UTC から TAI とその逆、TAI を経由した UTC からの UT1 を、1972-01-01 からの二部構成の日付で扱います。これは SGP4（Sgp4::propagate_at、二部構成のエポックから測定）と、IAU 2006/2000A の地球固定回転（sgp4::teme_to_itrs_matrix_eop と二部構成の地球自転角）が通る時刻経路です

seg-ec12724c3c04 = pyerfa { "2.0.1.5" }（liberfa { "2.0.1" }、BSD-3-Clause。ERFA プロジェクトが公開した SOFA アルゴリズム）：独立したライブラリで、コミット済みの時刻に対する erfa.dtf2d("UTC")、erfa.utctai、erfa.taiutc を用い、差は二部構成の日付上で部分ごとに形成しました。基準は実行の前に { "1e-6" } s に固定しました（事前登録 e947e69d）。最悪の差は { "9.6e-12" } s（dtf2d）と { "1.9e-11" } s（utctai、taiutc）です。すべての UTC 日を { "86 400" } s として扱ったり、うるう日の端数を換算しないままにしたりすると、テストは失敗します。TAI を経由した UT1（iauUtcut1）は、地球軌道経路の行の ERFA のレグで確認しています。範囲：1972-01-01 以降の UTC。それ以前の、レートが変動していた UTC はモデル化していません

seg-f1c7bc235a6b = 軌道経路での地球自転に至る二部構成のユリウス日

seg-cee11d4bad08 = 軌道経路で二部構成の UT1 ユリウス日から地球自転を求めることで、地球固定位置は、単一の f64 の日付では失われるマイクロ秒を保てます（{ "2020" } 年付近で約 { "3e-9" } rad）：jd2::gmst82（二部構成に対する、TEME の規約の IAU { "1982" } GMST）、cio::gcrs_to_itrs_matrix_jd2（二部構成から求めた地球自転角を用いた CIO の GCRS から ITRS への行列）、そしてそれらの上に構築され内部でチェックされる frames::teme_to_itrf_jd2 / itrf_to_teme_jd2、orbit::Propagator::position_in_frame_jd2 と own_jd2_utc、エフェメリスシナリオのオプトインの two_part_jd（ECEF 位置、地上軌跡、局のビュー。既定はオフで変更なし）、および jd2::Jd2 と timescales::TwoPartJd の間の無損失な From 変換です。歳差・章動と Cowell 力モデルのエポックは単一の f64 のままで、そこでは { "40" } us の丸めは { "1e-15" } rad を下回るか、解析的な太陽/月エフェメリスの誤差をはるかに下回ります

seg-a658c7b16d6d = pyerfa { "2.0.1.5" }（liberfa { "2.0.1" }、BSD-3-Clause。ERFA プロジェクトが公開した SOFA アルゴリズム）：独立したライブラリで、コミット済みの二部構成の日付に対する gmst82 と c2t06a、極運動 { "0.1" } と { "0.3" } 秒角。関数を書く前、かつオラクルを実行する前に b10475ee（日付、基準）で事前登録しました。内部テスト（シナリオのオプション、TEME/ITRF の往復、型変換）は、補助的な自己整合性です

seg-096df3971f5f = ERFA ベクターに対する座標系行列：IAU { "2006" } のバイアス・歳差、TEME から GCRS、天の極オフセットを伴う CIO の連鎖

seg-731a5ed967b3 = 三つの座標系行列を、任意のエポックで ERFA と成分ごとまたは回転角で比較します：precession::precession_matrix（Fukushima-Williams 角による IAU { "2006" } のバイアス・歳差）、nutation::teme_to_gcrs_matrix（TEME から GCRS への回転 P^T N^T Rz(-EE)。IAU { "2006" } の歳差、IAU 2000B の章動、先頭の二つの補足項を持つ分点方程式を使用）、cio::gcrs_to_cirs_matrix_with_offsets（IERS の天の極オフセット dX、dY を、回転の前にモデルの CIP の X、Y に加えた GCRS から CIRS への回転。SOFA クックブックの規約。新規）。モデルの選択そのもの（TEME 経路での 2000B 章動、二項の補足級数）は検証しておらず、検証したのはその実装だけです

seg-411cd8622b4d = pyerfa { "2.0.1.5" }（liberfa { "2.0.1" }、BSD-3-Clause。ERFA プロジェクトが公開した SOFA アルゴリズム）：独立したライブラリで、pmat06、eect00 からの分点方程式（完全な補足級数）を使った numat(obl06, nut00b) を P^T N^T Rz(-EE) として合成したもの、そして xys06a に続く c2ixys(X + dX, Y + dY, s)。オラクルを実行する前に 979c1e39（エポック、オフセット、基準）で事前登録しました。{ "1.1e-10" } rad の TEME の残差は、二つの補足項を残したことによる予測どおりの影響です（GNSS 軌道で約 { "3" } mm）

seg-4e2fe2e3dabb = 二部構成のユリウス日の時刻経路での 1972 年より前の UTC（レートが変動していた時代）

seg-1d086e669f09 = 1960-01-01 から 1971-12-31 までの UTC。この期間、UTC は TAI に対してオフセットしたレートで進み、秒の端数単位で階段状に調整されていました。二部構成のユリウス日の経路で、各期間のドリフト表から TAI - UTC（timescales::tai_minus_utc_on_date）、UTC の暦日から二部構成の UTC ユリウス日への変換（日の長さ { "86 400" } s + dleap。Jd2::from_utc_calendar）、日の端数を UTC から SI 秒に換算した UTC から TAI への変換（jd2::utc_to_tai）、TAI から UTC への逆変換（jd2::tai_to_utc）を扱い、SOFA の dtf2d、utctai、taiutc に従います。{ "1960" } 年より前は、TAI - UTC を { "0" } とします（SOFA の値。UTC は未定義）が、主張の対象外です。単一の f64 の timescales::tai_minus_utc は、{ "1972" } 年より前は今も { "10" } s に固定されており、対象外です

seg-036d5b0b4f51 = pyerfa { "2.0.1.5" }（liberfa { "2.0.1" }、BSD-3-Clause。ERFA プロジェクトが公開した SOFA アルゴリズム）：独立したライブラリで、コミット済みの時刻に対する erfa.dtf2d("UTC")、erfa.utctai、erfa.taiutc を用い、差は部分ごとに形成しました。エンジンの変更の前、かつオラクルを実行する前に 23c40661（時刻、許容差、{ "1972" }+ のチェックサム）で事前登録しました。ドリフト表は、オラクルが使うのと同じ SOFA の iauDat 表から転記したので、この比較が対象とするのは変換の演算（日の長さ、UTC から SI への換算、反復）であり、歴史的な表そのものではありません

seg-efacec095051 = GLONASS の放送衛星時計と放送軌道の伝搬

seg-4478a2518341 = RTKLIB v2.4.2-p13（T. Takasu、BSD-2-Clause、commit 71db0ffa）の geph2clk と geph2pos を、C のソースから別のハーネス（xval/rtklib-glonass）でコンパイルしたもので、RTKLIB 自身のリーダーで同じ RINEX ファイルを読むため、時計と軌道に加えて、解析、-tau_n の符号、単位、反復も比較されます。関数が存在する前、かつハーネスを構築する前に e099c42a で事前登録しました。両側が同じ時計の閉形式を評価するため、時計の比較が対象とするのは式ではなく実装です。軌道積分器は異なり（RTKLIB は { "60" } s ずつ進めて残りを処理、Kshana は最大 { "60" } s の等間隔）、定数も異なります（RTKLIB の mu は { "3.9860044e14" }、Kshana は PZ-90.11 の { "3.986004418e14" }）。最悪値の { "1.1" } mm はその違いによるもので、実行の前に予測したとおりです。範囲：有効区間内の放送エフェメリスであり、真の軌道や時計ではありません（精密プロダクトとの比較はなし）

seg-d3b72a6fbb18 = 一つの地球軌道経路：地球姿勢パラメーターを用いた IAU 2006/2000A の連鎖での、SGP4 要素セットから GCRS と ITRS まで

seg-e4eca7205b5e = ルーティングされるすべての地球軌道 kind が共有する、伝搬と座標系の経路：二部構成の UTC エポックを持つ SGP4 平均要素セット（sgp4::MeanElementSet。コンステレーション設計の要素から MeanElementSet::from_earth_fixed で読み込み）を SGP4/SDP4 で TEME まで伝搬し（sgp4::SgpOrbit）、UT1 - UTC と極運動を用いた IAU 2006/2000A の連鎖の TEME -> ITRS と GCRS -> ITRS の回転（sgp4::teme_to_itrs_matrix_eop、gcrs_to_itrs_matrix_eop、パラメーターなしの形の teme_to_itrs_matrix と gcrs_to_itrs_matrix）を行います。TEME は、平均分点を持つ瞬時の真の赤道であり、GCRS から IAU { "2006" } のバイアス・歳差、IAU 2000B の章動、分点方程式を経て到達します

seg-44f28276f859 = レグ { "1" }：python-sgp4 { "2.24" }（MIT ライセンス。D. Vallado の参照 C++ SGP4 で、AIAA 2006-6753 の検証ベクターを生成したコード）、WGS-72、improved モード。レグ { "2" }：pyerfa { "2.0.1.5" }（ERFA、BSD-3-Clause、SOFA ルーチン）：utctai/taitt からの TT と utcut1 からの UT1 を使った c2t06a、TEME では c2t06a . pnm06a^T . rz(-ee06a)。基準は実行の前に固定しました（事前登録 72ea9eb0）。開示事項：初回の実行は、2016-12-31T23:{ "59" }:{ "59.5" } でレグ { "2" } に一秒分の回転で失敗しました（うるう秒の日に、UT1 を UTC の準ユリウス日から取っていたため）。エンジンを修正し（jd2::utc_to_ut1）、二回目の実行は基準を変えずに一致しています。極運動を落とすと（{ "46" } 件の失敗）、または WGS-72 の代わりに WGS-84 の定数を使うと（{ "4432" } 件の失敗）、テストは失敗します。この三レグの設計は、Orekit の SDP4 の e = { "0" } と IERS { "1996" } の TEME で失敗したエンドツーエンドの Orekit 比較に置き換わったものです（この所見は tests/leo_polar_coverage_full_claim_orekit_oracle.rs に固定されています）

seg-f650a11458b8 = 測距符号の設計トレードオフ

seg-071e552a7179 = m 系列/Gold 符号のサイドローブと相互相関の限界、長さ↔アンビギュイティ

seg-65b7902a2d8f = 公表されている GPS C/A の Gold 相互相関（−{ "23.9" } dB）。Gold { "1967" } の限界

seg-5ec4c0730280 = GNSS ジオメトリ / DOP（精度低下率）

seg-edcd694d2b3c = Q=(HᵀH)⁻¹ による、視線方向のジオメトリからの GDOP/PDOP/HDOP/VDOP/TDOP（ローカル ENU への分解付き）

seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" }（Stanford NAV Lab）の DOP：独立したライブラリで、相対 { "1e-6" } で一致

seg-1a5623c81b48 = ジオメトリからの位置誤差：エンジンの最小二乗解の RMS 誤差 = sigma_UERE x DOP

seg-7a94b44a8738 = dop_error_mc::run_geometry と check：エンジン自身の反復最小二乗解（pvt::solve_spp、単位重み、真の位置から解く）の、シード付きモンテカルロ（ジオメトリごとに N = { "20,000" } エポック、sigma = { "1.5" } m、ChaCha8 シード { "36" } + i）を、tests/fixtures/dop/dop_reference.csv の { "8" } 個のジオメトリで実行し、東、北、上、時計の誤差分散、H/V/P の RMS、東北の相関、平均誤差、そして同じジオメトリでの orbit::dop カーネルの共分散因子（orbit::dop_cofactor、同じ演算）である Q を用いた sigma^{ "2" } Q の { "95" } % 水平楕円内に入る割合を比較します

seg-90f18c774d57 = 閉形式に対する内部整合性：線形ガウスモデルの下で、最小二乗の共分散は sigma^{ "2" } (H^T H)^-1 です（Kaplan and Hegarty（編）、Understanding GPS: Principles and Applications、第 2 版、Artech House、{ "2006" }、第 { "7" } 章）。{ "0.36" } のジオメトリ設計メモの方法と許容差（第 { "5.2" } 節）は、最初の実行の前に事前登録のコミットで固定しました：各分散は { "5" } % 以内（N = { "20,000" } での標本分散の標準誤差 { "5" } 個分）、各 RMS は { "2.5" } % 以内、東北の相関は { "0.035" } 以内（5/sqrt(N)）、各平均は標準誤差 { "5" } 個分以内、{ "95" } % 楕円の割合は { "0.95" } +/- { "0.0077" } 以内（二項分布の標準誤差 { "5" } 個分）。負の対照（PDOP を倍にしたもの、重み付けしない Q に対して誤差が 1/sin(elevation) で増えるもの）は失敗しなければなりません。構成のされ方：Q は orbit::dop カーネルの共分散因子で、tests/dop_reference.rs で同じ { "8" } 個のジオメトリについて gnss_lib_py { "1.0.4" } に対して VALIDATED です（行「GNSS ジオメトリ / DOP（精度低下率）」）。この行は、それらの因子からエンジンのソルバーを通じてメートルへ進む段階を加えるものであり、その行のステータスを借りません。MODELLED である理由：外部データセットが関与していません。一致が示すのは、教科書的なモデルの下で推定器とノイズが sigma x DOP を実現することであって、どの受信機の誤差も UERE x DOP に等しいということではなく、sigma_UERE は入力です

seg-9acfde1b57f7 = ジオメトリを考慮した信頼性の分類：受信機の信頼スコアと並べた衛星ジオメトリと、すべての減点に付けるクラス

seg-6138c41e13ff = receiver_trust::geometry：エポックごとの衛星ジオメトリ（good、理由 few-satellites/high-pdop/high-hdop/sky-blocked を伴う degraded、またはログに GSV、NAV-SAT、GSA がない場合は unknown）。報告された仰角と方位角から orbit::dop を通じて導くか GSA から取得し、ラベル（good、fair、poor、unknown）は常に報告し、スコアには使わず、HDOP、PDOP、VDOP、衛星数、信号喪失を言葉で示します。船舶スコアのジオメトリモニターは、ジオメトリが poor のときだけ減点します（比 max(hdop/4, pdop/6, 5/n_used) が { "1" } を超える場合）。その後 { "1.5" } で上限の { "15" } 点までランプし、ジオメトリだけでは degraded の帯を下回れません（上限、ランプ終端、下限は [geometry] で設定。アラームなし）。すべての減点にクラス（geometry、environment、inconsistency）を付けます。{ "15" } 度未満の衛星へのロスオブロックは geometry、視界にあるが追跡されていない衛星は environment、示された HDOP が示された空から max({ "1.0" }, 導出した HDOP の { "25" } %) を超えて離れている poor ジオメトリの減点は inconsistency に分類します

seg-6987737c5fe4 = 内部整合性：分類は、それが述べる規則と、コミット済みのデモログを合成的に編集したものでの手導出の比率に対してチェックされ、変更なしの固定が { "0.35.0" } の出力を保ちます。ジオメトリが poor でない限りスコアは変わらず、ラベルは常に報告されます。MODELLED である理由：しきい値は適合したものではなく選んだものであり（出典は各実行の geometry_model にあります。IEC 61108-1 と GPS SPS の数値は引用どおりで、規格の本文と照合する必要があります）、分類を検証できる、攻撃に対する自然なジオメトリ劣化の外部のラベル付きデータセットはありません。導出した DOP は orbit::dop カーネルを再利用しており、これは gnss_lib_py に対して VALIDATED ですが、この行はそのステータスを借りません。ジオメトリのクラスは空についての記述であり、攻撃がなかったという所見ではありません

seg-540420863a5a = 放送電離圏モデル（Klobuchar、IS-GPS-200）

seg-fd157c537502 = 放送された八つの α/β 係数からの、Klobuchar の単一周波数 L1 スラント電離圏群遅延

seg-0b0b02e8b0b8 = RTKLIB ionmodel（tomojitakasu/RTKLIB、src/rtkcmn.c）：ソースからコンパイルした独立した参照実装。< { "1e-4" } m で一致

seg-0af6b1a073ce = RAIM/ARAIM インテグリティの統計カーネル（χ² / 非心 χ² / 正規則）

seg-224a6c4200cd = すべての保護レベルが拠り所とする分布の中核：スナップショットの故障検出しきい値 χ²₁₋ₚfₐ(dof)、見逃しの非心度 pbias=√λ、K_fa/K_md/K_V の解分離の乗数

seg-03578217425f = SBAS 保護レベル（DO-229E の重み付き最小二乗 HPL/VPL）

seg-df640d6c7a5d = DO-229E 付録 J の重み付き最小二乗の保護レベル：衛星ごとの仰角/方位角と誤差バジェットからの D=(GᵀWG)⁻¹、水平誤差楕円の長軸と鉛直 σ を、公表された K 係数でスケーリング

seg-39aed7b4bffd = RTKLIB の SBAS-PL フォーク zsiki/rtklib_ws の waasprotlevels()（Siki & Takács { "2017" }、「DO-229D Appendix J」）を、rnx2rtkp -ws で、実際の EGNOS の GEO-PRN120 メッセージと実際の BUTE/ブダペストの RINEX に対して実行。独立したサードパーティの実装で、HPL は < { "2e-3" } m で一致。gLAB { "v6.0.0" }（core/filter.c）も同一の規約であることを確認しました。両方のオラクルは K_V→{ "5.33" } に丸めますが、Kshana は厳密な Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" }（約 { "0.06" }%）を使うため、鉛直は K 係数を含まない d_U として確認します

seg-8f32eb9c8167 = ML 検出器の評価指標（ROC/AUC/混同行列/Pfa-Pmd）

seg-b0d8e1b45bf9 = AUC（Mann-Whitney、同順位は ½）、しきい値での混同行列、P_d/P_md/P_fa/適合率/正解率/F1

seg-d87c8bae7c5e = scikit-learn { "1.9.0" }（Pedregosa ほか、JMLR { "2011" }）：独立したライブラリで、完全一致

seg-e7af87ce5e72 = 実際の宇宙機テレメトリでの異常検出のスコアリング

seg-9659b33fca5b = 実際のラベル付き異常を分離する ROC AUC + ブートストラップ信頼区間。透明な検出器（ラベルを再現）

seg-b4ed67ce7e7e = OPSSAT-AD のテスト分割（Ruszczak ほか { "2025" }、CC BY { "4.0" }）に対する scikit-learn の roc_auc_score：実際の OPS-SAT テレメトリ

seg-5c3f1057c6cc = 量子トレードの数値カーネル（NNLS / χ² バンド / van-Loan Q）

seg-f82113ccb30b = 測定した ADEV の NNLS フィット、NEES/NIS の χ² 整合性バンド、時計の van-Loan 離散プロセスノイズ（ホールドオーバーの惰性航行）共分散：トレードエンジンの計算の中核

seg-823da1deb3af = scipy { "1.17.1" }：optimize.nnls / stats.chi2.ppf / linalg.expm。NNLS+Q は厳密、χ² は動作自由度で <{ "5e-4" }。カーネルのみ。デバイス性能の数値はモデル計算のままです（次の行）

seg-6f3099e7562c = 地磁気参照場（IGRF-14 の合成）

seg-e9534723cb34 = 地磁気異常 alt-PNT レイヤーに供給する、IGRF-14 主磁場の球面調和合成：X/Y/Z/F の成分、偏角、伏角

seg-b1431734301a = ppigrf { "2.1.0" }（K. M. Laundal、MIT）：公式の IGRF14.shc 係数（IAGA 第 14 世代、Zenodo 10.5281/zenodo.14012302）を同梱する、IAGA-VMOD の純 Python の IGRF 参照実装。一意に定義される IGRF-14 の磁場を計算する、独立したサードパーティのコードベースで、全球グリッド上で一致

seg-cb3fea409de7 = 検出統計：ガウス AUC と最小検出可能故障

seg-ca677becb465 = 解析的な二正規 ROC AUC = Φ(μ/(σ√{ "2" }))と、量子故障と異常の検出器を支える最小検出可能故障 σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d))

seg-7d296e4199af = scipy { "1.17" }（Cephes ndtr/ndtri）+ scikit-learn の roc_auc_score（Pedregosa ほか、JMLR { "2011" }）、どちらも BSD-3-Clause：一意に定義される同じガウス裾 / AUC の量を計算する独立したライブラリで、A&S の erf の下限（約 { "7e-8" }）まで一致。その上に構築した量子対古典の優位性は MODELLED のままです

seg-1ed12110fb74 = 順位統計カーネル（Kendall-τ / ディリクレ / パーセンタイル）

seg-0fb003404a5b = レジリエンスの意思決定不安定性研究の下にある、順位相関とリサンプリングのカーネル：Kendall τ-b、ディリクレ平均、競技順位、パーセンタイル信頼区間

seg-396602ddeef4 = scipy { "1.18" }（stats.kendalltau variant='b'、rankdata）+ numpy.percentile（BSD-3-Clause）：一意に定義される順位統計量の独立した実装（マージソートの τ）で、{ "1e-12" } で一致。これらのカーネルの上に構築した意思決定不安定性の研究は MODELLED のままです

seg-fdd2ba203d5b = MCDA 優先度導出カーネル（AHP 固有ベクトル / 整合度）

seg-d01c155fbddf = 階層分析法（AHP）の優先度の重み = 逆数の一対比較行列の、冪乗法で求めた正規化主（Perron）固有ベクトル。Saaty の整合性指数 / 整合比と、CR<{ "0.10" } の受け入れゲート付き

seg-d1947f2f2b3b = Saaty（{ "1980" }）の標準のランダム指数表（RI({ "5" })={ "1.12" }）を厳密に再現したものと、一意に定義される同じ Perron 固有ベクトル/固有値を計算する独立した固有値ソルバーとしての SciPy/LAPACK の scipy.linalg.eig（BSD-3-Clause）を用い、<{ "1e-9" } で一致。このカーネルの上に構築したパレート / 感度 / MAUT の意思決定レイヤーは MODELLED のままです（WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE の集約器は別に外部で検証されています。以下の行を参照）

seg-73e933220afb = MCDA の重み付き集約カーネル（WSM / WPM）

seg-c436cdc991a2 = 重み付き和モデル（min–max 正規化した加法的な集約 + 順位付け）と重み付き積モデル（総和で正規化し、コストは逆数にした乗法的な集約）：二つの価値集約のトレードスタディ用スコアラー

seg-1b5b9abcca69 = pymcdm（methods.WSM + normalizations.minmax_normalization、methods.WPM + normalizations.sum_normalization）：一意に定義される同じ重み付き集約を計算する、独立した広く使われているサードパーティの Python MCDA ライブラリで、<{ "1e-9" } で一致。tests/fixtures/mcda_wsm/ と tests/fixtures/mcda_wpm/ からオフラインで再生成できます。入力についてはゴミを入れればゴミが出ます。感度/頑健性のレイヤーは MODELLED のままです

seg-f00bdb66a052 = MCDA の理想解への距離による順位付け（TOPSIS）

seg-631578cb1259 = 理想解類似度順位選好法：min–max 正規化、重み付き正/負の理想解、相対近接度 Cᵢ = d⁻/(d⁺+d⁻) と順位付け

seg-68265fb0034c = pymcdm の methods.TOPSIS + normalizations.minmax_normalization：一意に定義される同じ近接係数を計算する、独立したサードパーティの MCDA ライブラリで、<{ "1e-9" } で一致。tests/fixtures/mcda_topsis/generate_topsis_reference.py からオフラインで再生成できます

seg-ef33d848c985 = MCDA の妥協解による順位付け（VIKOR）

seg-cf879fb770f2 = VlseKriterijumska Optimizacija：集団効用 Sᵢ、個別後悔 Rᵢ、戦略重み v={ "0.5" } での妥協指数 Qᵢ と、小さいほど良い順位付け

seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — 一意に定まる範囲正規化 S/R/Q 集約を計算する、独立したサードパーティの MCDA ライブラリです。<{ "1e-9" } で一致しました。オフラインで再生成できます：tests/fixtures/mcda_vikor/generate_vikor_reference.py

seg-790176ba8196 = MCDA アウトランキングのネットフローによる順位付け（PROMETHEE II）

seg-b25cedf6da6e = Preference Ranking Organization METHod — 六種類の標準的な一般化基準の形状による一対比較の選好指標、正負のアウトランキングフロー、完全なネットフロー順位（通常基準は検証済み）

seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — 一意に定まるネットアウトランキングフローを計算する、独立したサードパーティの MCDA ライブラリです。<{ "1e-9" } で一致しました。オフラインで再生成できます：tests/fixtures/mcda_promethee/generate_promethee_reference.py。しきい値付き（q/p/σ）の選好形状は同じ一般化基準の代数に帰着し、性質検査の対象のままです

seg-72248291c388 = MCDA アウトランキングの選択カーネル（ELECTRE I）

seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — 一致・不一致行列、一致かつ拒否権なしの優越関係、アウトランキングの選択カーネル（全項目が便益、重みの総和による正規化、単一の全体スケールという規約）

seg-bd625ceb90cc = pyDecision algorithm.electre_i（Valdecy Pereira）— 一意に定まる一致・不一致・優越・カーネルを計算する、独立したサードパーティの多基準意思決定ライブラリです。要素ごとに <{ "1e-9" } で一致しました。オフラインで再生成できます：tests/fixtures/mcda_electre/generate_electre_reference.py。ĉ/d̂ のしきい値の選択は解析者の入力です（感度は MODELLED のままです）

seg-95942c6a2689 = MCDA 集約カーネル（WASPAS / MOORA）

seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment（線形正規化した凸結合 λ·WSM+({ "1" }−λ)·WPM、λ={ "0.5" }）と MOORA 比率システム（ベクトル正規化した重み付き便益合計から重み付きコスト合計を引いたもの）— 安定性を強化した値の結合と、符号付きの比率システムのスコアラーです

seg-7727f311faa3 = pymcdm（methods.WASPAS + normalizations.linear_normalization、l={ "0.5" }；methods.MOORA 比率システム、ベクトル正規化）— 一意に定まる集約値を計算する、広く使われている独立したサードパーティの Python MCDA ライブラリです。<{ "1e-9" } で一致しました。オフラインで再生成できます：tests/fixtures/mcda_waspas/ と tests/fixtures/mcda_moora/。入力が不正なら出力も不正になります。感度・頑健性の層は MODELLED のままです

seg-7de67fedc1da = MCDA 比例順位付け（COPRAS）

seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — 列和で正規化した便益の重要度 S⁺ に逆コスト重要度の項を加えたもの、相対重要度 Q、効用度 U = Q/max Q（最良の代替案 = { "1" }）

seg-49aeef0b79e4 = pyDecision algorithm.copras_method（Valdecy Pereira）— 一意に定まる COPRAS の相対重要度・効用を計算する、独立したサードパーティの MCDA ライブラリです。pyDecision を意図的に使っています。pymcdm { "1.4.0" } の COPRAS は代数的に自明な S⁺+S⁻ に帰着し、忠実な参照ではない一方、pyDecision は正準形の Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)) を実装しているためです。<{ "1e-9" } で一致しました。オフラインで再生成できます：tests/fixtures/mcda_copras/generate_copras_reference.py

seg-bdb2917a2520 = CUSUM の変化検出遅延と ARL

seg-302f5db625df = 表形式 CUSUM 検出器の最悪ケースの検出遅延（⌊h/(z−k)⌋+{ "1" }）と管理外の平均ラン長です。タイミング保護レベルとスプーフィングモニターで使用します

seg-691a506ce13f = 公表されている表形式 CUSUM の ARL：Siegmund（{ "1985" }）のブラウン運動近似（Hawkins & Olwell { "1998" }、式 { "3.7" }）を、k=½、h∈{ "{" }{ "4,5" }{ "}" } について Montgomery, Introduction to Statistical Quality Control（Wiley）の ARL 表と相互に突き合わせています。決定論的な遅延は、初到達のオラクルと完全に一致しました。合成した TPL の上限は MODELLED のままです

seg-d923a77bd31a = 時計ホールドオーバーのコースト分散としきい値の逆算

seg-4fafaf5f919d = コースト位相誤差の分散の増大 q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 と、その単調な逆算によるタイミング誤差のホールドオーバーしきい値

seg-8993c7d8b080 = scipy { "1.18" }（BSD-3-Clause）：linalg.expm により、{ "6" }×{ "6" } の拡大行列に対する Padé のスケーリング・二乗法で Van-Loan { "1978" } の離散プロセスノイズ Q₀₀ = ∫₀ᵗ ΦQcΦᵀds を計算します。kshana の多項式係数を一切参照しない独立した経路です。あわせて optimize.brentq が、同じ単調曲線を kshana の二分法と比較しながら逆算します。クラスごとのレッドノイズフロアの数値（ClockClass）は MODELLED のままです

seg-eb3cd9e92d8d = 逆シンプソン多様性カーネル

seg-244d57819f2b = 実効的なアーキテクチャの多様性 = 独立グループごとのソース品質 pᵢ に対する逆シンプソン／ヒル次数 2 の数 1/Σpᵢ²（レジリエンススコアの多様性の項）

seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson（McDonald ら、BSD-3-Clause）— 一意に定まる逆シンプソン指数を計算する、独立したサードパーティのライブラリです。バイト単位で一致して再現されました。その上に構築した DHS-RPCF のスコアリングフレームワーク（重み・レベル）は MODELLED のままです

seg-c14b8fe46517 = 方位依存のスカイラインマスク：可視集合、方位角と仰角、マスク下の DOP

seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry：地上サイトから見た衛星の測地（WGS-84）方位角と仰角、{ "360" } 度で折り返して方位角方向に線形補間した方位角・仰角マスクテーブル、可視集合 el >= max(mask_deg, mask(az))、およびその集合の共通クロック DOP と ENU・クロックのコファクター行列（orbit::dop の背後にあるカーネル）です。これにより、[skyline] セクションが gnss-sim、jamming、leo-pvt、leo-pass、nmea-scenario の各種別で、また地上サイト user_site を伴う orbit と integrity で、可視性をどう判定するかが決まります

seg-578d7acd3288 = Orekit { "12.2" }（Apache-2.0）：視線角には WGS-84 OneAxisEllipsoid 上の TopocentricFrame を、テーブルごとに ElevationMask を使い、xval/orekit-skyline/OrekitSkyline.java がコミット済みの地球固定の状態に対して実行します（伝搬は比較しません）。DOP と、Orekit が可視と判定した集合の ENU・クロック DOP 行列には gnss_lib_py { "1.0.4" }（ホイールのメタデータは MIT）の get_dop を使います。どちらのオラクルも比較入力に対して実行する前に事前登録しました（xval/orekit-skyline/PREREGISTRATION.md、コミット e4b9d912）。Orekit の折り返し付き線形補間は、合成プローブで事前に確認しました。範囲：テーブルマスク、測地の視線角、マスクされた可視集合とその共通クロック DOP およびコファクター。ここでは検証していないもの：キャニオン、セクター、地形の縮約とプリセット（360 点のテーブルは入力として与えました。行「Street-canyon, sector and terrain reductions to a table」と「Skyline presets」）、システムごとのクロック状態と誤差楕円（行「Horizontal error ellipse and per-system cofactor from the geometry covariance」）、orbit/integrity における地上サイト user_site の GMST 回転と各伝搬器を 一つの時刻に揃える処理（Orekit には地球固定の状態を与えます）、および現実の遮蔽物（見通し線のみ）

seg-bbb1828b3db1 = ストリートキャニオン、セクター、地形のテーブルへの縮約

seg-2864aec7be88 = skyline：閉形式のストリートキャニオン（カット atan((h - a) / d)、d = (w/2) / abs(sin(az - s))、有限長の場合は端が開放）、折り返しありで時計回りの鋭いエッジのセクター、曲率降下 d^2/({ "2" } * 4/3 R) でテーブルに縮約した地形点。スカイラインは、これらと任意のテーブルの点ごとの最大値です

seg-50f1df206b30 = 内部検証：閉形式は手計算の値（指定した街路の壁上端の仰角、開放端の条件、指定した点の曲率降下）と照合しています。外部のオラクルはありません。設計メモはこれらの縮約を MODELLED と位置づけており、Orekit の ElevationMask はテーブルを受け取るため、行「Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask」の比較はそれらの 360 点のテーブルを入力として読み込むだけで、検証はしていません

seg-3f3d657854ce = スカイラインのプリセット（市街の街路、港湾への進入路、フィヨルド、コンテナターミナル）

seg-b915c06fa3f1 = skyline::PRESETS：設計メモに記された寸法と、それぞれの出典の 一行を備えた 四つのREPRESENTATIVEな形状です。city-street（キャニオン、街路の向き { "0" } 度、{ "30" } m の壁の間隔 { "20" } m、アンテナ高 { "1.5" } m）、harbour-approach（セクター：海側は { "180" } 度にわたり開放、岸壁の建物は { "90" } 度にわたり { "8" } 度、防波堤は { "3" } 度）、fjord（地形：南北の水路の両側 { "1.5" } km に、アンテナより { "600" } m 高い壁、曲率降下を適用）、container-terminal（セクター：陸側の半分にわたりコンテナの山が { "12" } 度、二つの狭いセクターにわたりクレーンのブームが { "35" } 度と { "25" } 度）。項目ごとに上書きできます

seg-44ae9b6289d9 = なし：選定して明記した寸法であり、特定の街路、港、フィヨルド、ターミナルの測量ではありません（街路のアスペクト比は Oke（{ "1988" }）の 0.5-2 の範囲内、フィヨルドは西ノルウェーのフィヨルド程度、コンテナの山には ISO { "668" } のハイキューブの高さを使用）。テストはプリセットを自身が明記した寸法と照合しており、これは転記の検査であって、検証規則では数えません

seg-2c53381d48ae = 幾何の共分散から得る水平誤差楕円とシステムごとのコファクター

seg-15fea5c05cbd = geometry::sky_geometry：受信機クロックを共通にした場合またはシステムごとに一つとした場合の ENU・クロックのコファクター (H^T H)^-1（orbit::cofactor_from_los カーネル）と、その東・北ブロックから得る水平誤差楕円（半軸 k sigma sqrt(lambda)、k = sqrt(-2 ln({ "1" } - p))、長軸の方位角は北から測る）

seg-1982bafa3466 = numpy { "2.5.4" }（BSD-3-Clause）、xval/numpy-ellipse/ellipse.py：コミット済みの入力に対して G^T G の numpy.linalg.inv とその水平ブロックの numpy.linalg.eigh を実行します。逆行列と固有値分解を独自のアルゴリズムで行う、独立した数値ライブラリです（標準 P2）。実行前に xval/numpy-ellipse/PREREGISTRATION.md（コミット 0bbeeaee）で事前登録しました。ドライバーの出力形式は事前登録後に一度だけ修正しており（numpy のスカラーが np.float64(...) として書き出される問題）、プロトコルと許容差は変更していません。検証した主張は、それらの入力に対する線形代数です。ガウス誤差モデルと UERE は明記した入力であり、実測の精度でもインテグリティの限界でもありません

seg-6012113b4836 = スカイジオメトリ関数：可視性、DOP、共分散、誤差楕円、モンテカルロ点群

seg-17352a3aa356 = geometry（sky_geometry、sky_monte_carlo、skyline_presets、skyline_profile、skyplot_svg；CLI の <c1/> と <c2/>、同名の Python と WASM の関数、MCP の <c3/>）：サイト、時刻、衛星コンステレーションのプリセット（または方位角・仰角か ECEF で与えた衛星）から、スカイラインの下での可視衛星とマスクされた衛星、GDOP/PDOP/HDOP/VDOP/TDOP、単位分散のコファクター (H^T H)^-1、システムごとに一つまたは共通の受信機クロックを用いた東・北・上の共分散、水平誤差楕円（半軸 k sigma sqrt(lambda)、k = sqrt(-2 ln({ "1" } - p))、北からの向き { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE)）、独立なガウス距離誤差の下での n 個のシード付き最小二乗誤差と、その経験共分散、RMS、{ "95" } % 包含率を求めます。コファクターは orbit::cofactor_from_los であり、orbit::dop と orbit::dop_cov の背後にある唯一のカーネルです（dop は dop_cov の縮約）。二つ目の DOP 実装はありません

seg-aa0da1028636 = 単一クロックの DOP 係数は、gnss_lib_py { "1.0.4" } に対して検証したカーネルに基づいています（行「GNSS geometry / dilution of precision (DOP)」）。この行自身の検査は内部的なものです。sky_geometry は同じ幾何に対して orbit::dop と dop_cov を再現し、楕円は解析的な 2x2 固有値分解を再現し、ECEF の入力と方位角・仰角の入力は一致し、シード付き点群の RMS と { "95" } % 包含率は幾何と一致します。システムごとに 一つのクロックを用いた ENU 共分散と楕円は、行「Horizontal error ellipse and per-system cofactor from the geometry covariance」（numpy、P2）で VALIDATED です。ここで MODELLED のままなのは合成の部分です。代表的な空へのプリセット伝搬、モンテカルロ点群（サンプリング元の幾何に対して検査しており、自己整合性の検査です）、およびサーフェスです。コンステレーションのプリセットが与えるのは代表的な空であり、日付を特定した空ではありません。ガウス誤差モデルと UERE は明記した入力であり、実測の精度でもインテグリティの限界でもありません

seg-7f66be0f15c8 = GNSS が使えない状況での時計ホールドオーバー

seg-4d8f87668a0f = 閉形式のコースト誤差の増大としきい値までのホールドオーバー、量子時計のクラス

seg-2d260626e3d2 = 多段階の clock_state 共分散の再帰（同一コードベースでの相互検査）。基盤となるコースト分散・ホールドオーバー逆算カーネルは、scipy に対して外部で検証済みです（「Clock-holdover coast-variance & threshold inversion」を参照）。クラスごとのレッドノイズフロアのホールドオーバーの数値は MODELLED のままです

seg-29b482d88916 = 実測した時計のデバイスカード（ホールドアウト予測）

seg-8c68c5b25004 = clock_library：名前の付いた実測時計記録の 三分の一 に、記録される前処理（ギャップ、位相の外れ値、位相ステップ、バーストを除去し、周波数ステップは記録）を施した後に当てはめたデバイスカード（白色位相、白色、フリッカー、ランダムウォークの FM と線形周波数ドリフト）です。ラグ 1 で同定したノイズ種別の自由度で重み付けし、予測したアラン偏差を残り 三分の二 のホールドアウトで評価します。RINEX と IGS のクロックファイル、BIPM の各ラボのファイル、Circular T のセクション { "1" } のリーダー。カードのスロットタイミングのノイズモデル、拡張カルマンクロックモデル、スプーフィングモニターのノイズレベルへの変換

seg-af2d78e2986c = 実測記録、ホールドアウト：{ "11" } 機の GPS Block IIF 衛星の IGS 最終合成 { "30" } 秒クロック、2026-03-01 から { "14" } まで（どのテストも開いたことのない期間。IGS、帰属表示付きで公開）と、JammerTest { "2024" } の u-blox ZED-F9P 受信機の採点対象外の静止セッション（GPL-3.0-or-later）。D9 外部比較（事前登録 2ec76864、すべてのカードで予測／実測のアラン偏差が、当てはめた平均化時間において [1/1.5、{ "1.5" }] 以内）、知見（MODELLED のまま）：{ "11" } 枚中 { "10" } 枚の GPS IIF カードが基準内です。G27 は 二時間スケールで楽観的です（{ "7680" } 秒で { "0.662" }、最悪の係数は { "1.510" }）。これは、べき乗則のカードが持たない、一時間スケールの周期的な誤差です。受信機の TCXO カードはブロックされています。記録された送信の外では、データセットの他のセッションに残るのは必要な { "3600" } エポックに対し { "167" } エポックです。報告のみで、ブラインドではありません（以前の行で記録を開いたもの）：5071A セシウムカードは基準内です（{ "4096" } 秒まで最悪 { "1.070" }）。OCXO カードは保守的で、基準の外です（{ "128" } 秒で { "2.348" }。記録の途中でノイズフロアが変化します）。最も短い 三つの公表点に当てはめた Norcia ストロンチウムカードは、採点した二点で基準内です（{ "1.291" }、{ "1.405" }）。Galileo のパッシブ水素メーザー（最終 Galileo クロックのログイン不要の入手元に到達できません）と深宇宙原子時計（宇宙空間での公開値は 一つのみ）はブロックされています。D9 ラウンド { "2" }：モデルクラスとしての ZED-F9P 受信機 TCXO を、{ "12" } か所の静止 Wroclaw 観測局の { "14" } 日間で評価（Zenodo { "6488497" }、CC BY { "4.0" }；事前登録 fb475550）、知見：登録したパイプラインでは { "12" } 局中 { "11" } 局が評価不能で（RAIM が電離圏フリーのエポックの大半を棄却）、BX14 は失敗しました。修正したパイプライン（事前登録 c9cc0d49）による開示済みの再実行では、ブラインドの { "11" } 局中 { "1" } 局が合格します（BX12、{ "1.412" }；BX07 の { "1.532" } と BX13 の { "1.542" } はわずかに基準外）。断続的な { "30" } 秒ファイルから得た単独測位の受信機クロックは、きれいな発振器の記録ではないためです

seg-5097a0e6460d = 一周回あたりの項を持つ実測の GPS Block IIF クロックカード（ホールドアウト予測）

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic：一周回あたり一回から四回の位相項（周期 T/k、T = { "43 082.05" } 秒）を持つデバイスカードで、実測した衛星クロック記録の 三分の一 に対して 二次項とともに最小二乗法で同時に当てはめ、予測アラン偏差には各項の閉形式のアラン寄与 { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } を含めます

seg-83981cd13a17 = 実測記録、ホールドアウト：{ "11" } 機の GPS Block IIF 衛星の IGS 最終合成 { "30" } 秒クロック、2026-04-01 から { "14" } まで（どのテストも開いたことのない期間。IGS、帰属表示付きで公開）。D9 外部比較（事前登録 fb475550、すべての衛星のすべての当てはめた平均化時間で、予測／実測のアラン偏差が [1/1.5、{ "1.5" }] 以内）、知見（MODELLED のまま）：{ "11" } 枚中 { "9" } 枚のカードが基準内です。G03（{ "1.947" }）と G25（{ "1.581" }）は、ホールドアウトの記録が当てはめに使った 三分の一 より雑音が大きいため、{ "60" } 秒から { "2000" } 秒の間で楽観的です（G25 のホールドアウト部分には { "16" } 件のギャップと { "29" } 件の位相の外れ値があります）。これは周期項の欠落ではなく、時計自体の変化です。予測から周期項を除くと { "11" } 枚すべてのカードが基準を外れる（{ "1.77" } から { "4.96" }）ため、予測を支えているのはこれらの項です

seg-0d72fcc0fbea = 搭載時計の状態推定

seg-6db5391f8ebe = 3 状態（位相／周波数／ドリフト）の van-Loan カルマン時計、Joseph 安定化

seg-f41b4c81df2a = filterpy { "1.4.5" } KalmanFilter（R. Labbe、MIT）。F は scipy.linalg.expm、Q は Van-Loan { "1978" } のブロック行列で求めます。kshana のフィルターの軌跡全体を再現する、独立した参照実装です。実装間の整合性：時計の物理とアラン偏差の較正は外部で検証されていないため、これは MODELLED のままです。{ "0.30" } 外部比較、知見（MODELLED のまま）：{ "11" } 機の GPS Block IIF 衛星の IGS 最終 { "30" } 秒クロック（2025-08-17 から { "30" } まで）で、前半の ADEV に Q を当てはめ、ホールドアウトした後半でフィルターを採点したところ、フィルターは 一ステップ先では整合していますが（エポックの { "0.906" } から { "0.971" } が { "95" } % 帯の内側、基準 { "90" } %）、{ "11" } 台中 { "9" } 台で 一時間先では過信となり（{ "0.486" } から { "0.829" }）、{ "5" } 台でイノベーションの和が [{ "2.4" }、{ "3.6" }] の外に出ます。当てはめた白色位相ノイズはすべての衛星でゼロであり、一時間スケールの誤差（周期項、フリッカー FM）は 3 状態モデルに含まれていません。{ "0.30" } ラウンド { "2" }：新たにホールドアウトした 2025-09-01 から { "14" } までの IGS クロックに対する拡張フィルター（フリッカー FM と 一周回あたり一回・二回の状態）（事前登録 4b1a841e）、知見（MODELLED のまま）：一ステップ先と 一時間先の整合性基準は { "11" } 機すべてで満たされます（{ "0.948" } から { "0.988" } と { "0.907" } から { "0.996" }）が、イノベーションの和の基準は G24（{ "0.964" }）と G30（{ "1.929" }）で [{ "2.4" }、{ "3.6" }] に対して満たされません。D9 ラウンド { "3" }：ラウンド 2 の拡張フィルターで、固定した clock_library の前処理検出器の後も調整と基準は変えず、2026-04-01 から { "14" } までの新たな IGS クロックに適用（事前登録 fb475550）、知見（MODELLED のまま）：(a) 一ステップ先の { "0.941" } から { "0.968" } と (c) 三重 NIS の平均 { "2.641" } から { "3.549" } は { "11" } 機すべてで満たされます。(b) 一時間先は G09（{ "0.894" }）と G26（{ "0.876" }）で { "0.90" } に対して満たされません

seg-3f0a9d7c2971 = 時刻伝送の誤差配分

seg-216f46b43860 = 双方向／TWSTFT（Sagnac）、GNSS コモンビュー、PPP；リンクジッターから距離への換算

seg-e7b6aac2ec58 = Sagnac の大きさは、権威ある公表値と照合しています — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }）、式 { "1.29" }：東向きの赤道一周で { "207.4" } ns が蓄積されます（2ωA_E/c²）。kshana は { "207.386" } ns を再現します。同じ 2Aω/c² の幾何を持つ RTKLIB { "2.4.3" } の geodist()（Takasu、BSD-2-Clause）によっても独立に裏付けられています。BIPM の TWSTFT トランスポンダー／コモンビュー／PPP を合成した誤差配分には外部のオラクルがないため、この機能はモデルから計算した区分のままです

seg-157fadeb5d67 = 航法信号の変調とコード追尾の解析

seg-ab633d191396 = BPSK-R/BOC の PSD、スペクトル分離係数 κ、Gabor 帯域幅、DLL ジッター、マルチパス

seg-94f0c4fc2930 = GPS C/A のゴールド符号の相互・自己相関は、独立した IS-GPS-200 のコード生成に対して完全に（整数 ±65/−1/63）一致しました。BPSK-R({ "1" })/BOC({ "1,1" }) の PSD の形状は、独立した scipy のピリオドグラムと比較しました。変調／SSC／DLL の閉形式（Betz { "2001" } / Kaplan & Hegarty）は解析的なままであるため、この行は MODELLED のままですが、コード相関という部分的な主張は外部と一致しています。{ "0.30" } ラウンド { "2" }：Betz { "2001" } と Hein ら { "2006" } の印刷値に対して（事前登録 9f4f2ce8、印刷単位の半分）、知見（MODELLED のまま）：表 { "1" } のスペクトルセル { "45" } 個すべて、{ "1" } GHz の相関値、MBOC の干渉の数値、図 { "17" } のオフセット { "3" } 個中 { "2" } 個は一致します。{ "24" } MHz の第一サイドローブ、BOC({ "8,4" }) の図 { "17" } のオフセット、図 18-21 のすべての最悪ケースのマルチパスバイアス（{ "11" } から { "15" } % 低い）は一致しません。Kshana と、事前登録した読み方に対する独立した NumPy による評価は一致しているため、差は、その読み方、あるいは論文に明記されていない細部にあります。原因は未解明です

seg-589e0053e3e8 = GPS L1 C/A 拡散符号の生成

seg-782d4da75b59 = G1/G2 の LFSR による C/A コード生成器で、PRN { "1" }–{ "9" } について IS-GPS-200 が公表している先頭 10 チップの 八進検証ベクトルを再現します（加えて 1023 チップの長さ、512 個のワンによるバランス、三値の周期自己相関）

seg-473f24d4e06a = IS-GPS-200 表 3-Ia「Code Phase Assignments」— 権威ある米国政府のパブリックドメインの、公表された先頭 10 チップの 八進検証ベクトルです（GPS Directorate、navcen.uscg.gov）。kshana 自身の G1/G2 LFSR は、PRN { "1" }–{ "9" } のすべてのベクトルを正確に再生成します。下流の変調／SSC／DLL の閉形式はモデルから計算した区分のままです（別の行）

seg-e6c08e1e6ae3 = 量子慣性センサーの性能

seg-d28e1f6a430f = 第一原理からの冷却原子干渉計加速度計（k_eff·T²、QPN）

seg-57fd0a6e5d72 = 公表された CAI の主要論文の数値ベクトル（Cheinet { "2008" } の伝達関数；Peters/Freier の感度）：k_eff·T² は完全に一致し、ショットノイズ ASD は片側の下限として、公表された各装置の ~{ "2" }× 以内に収まります（実機には量子下限を上回る技術的ノイズがあります）。これは範囲を示すものであり、一致ではありません。{ "0.30" } ラウンド { "2" }（事前登録 fcb9ac64）、知見（MODELLED のまま）：QPN のみの回転ノイズを、Gauguet ら { "2009" } の図 { "14" } の実測点に対して比べると、採用した三点で比は { "0.695" } から { "0.788" }（動作点では { "0.751" }）となり、事前登録した { "30" } % の基準に { "0.5" } ポイント届きません。QPN の下限は実測ノイズより { "21" } から { "31" } % 低く、レーザーと検出のノイズを持たないモデルとして想定どおりです。グラジオメーターの合成は Janvier ら { "2022" } の QPN モデル線と一致します（比 { "1.013" } から { "1.017" }、参照）。実測のテストは sqrt({ "2" }) の合成誤差を識別できません。識別できるのはコントラストが等しくない Janvier の線だけです

seg-4b79d03cecf5 = 量子慣性センサーの縞のアンビギュイティ／ダイナミックレンジ

seg-deb2850546d5 = Mach–Zehnder の縞のアンビギュイティによるダイナミックレンジ：2π 周期の縞の読み出しが、曖昧さなく測れる最大の比力 a_max=π/(k_eff·T²) を決めます。分解能セル数で表した曖昧さのない範囲 a_max/σ_a=π/σ_Φ は光学スケールファクターに依存しません。T² の感度向上は、曖昧さのない範囲を厳密に同じ比率で失います（干渉時間は分解能と範囲をトレードオフし、セル数は読み出し位相ノイズで固定されたままです）

seg-7603ff7a7693 = 干渉計の縞モデルの自己整合性：半縞の端、2π 周期のエイリアシング構造、範囲／分解能比でのスケールファクターの相殺は、閉形式の代数的恒等式であり、エンジン自身の Mach–Zehnder の位相関数と感度関数に対して検査しています。これは内部整合性の検査であり、外部のデータセットではないため、この行は InternalConsistency のままです。MODELLED の理想的な 三パルスの縞のアンビギュイティであり、曖昧さのない範囲に対する波面収差やコントラスト低下の限界は含みません

seg-d04bf321d4a1 = 量子慣性デッドレコニングのレジリエンス

seg-c4989abb5d40 = ホールドオーバー中の、バイアス + スケールファクター + VRW + 安定性の減衰を合成した位置誤差配分

seg-bfe4085115c1 = 二重積分した白色加速度ノイズの、独立した numpy モンテカルロ SDE 積分（真に独立したアルゴリズムにより、解析的な VRW 分散を検証）と、バイアス・スケールファクターの項に対する Groves { "2013" } の公表値アンカー。CAI デバイスの数値はパートナーのハードウェアを定量化するものであり、MODELLED のままです

seg-bc6e733c39b3 = GNSS/INS センサーフュージョン

seg-16514286bb51 = 15 状態の誤差状態 EKF、疎結合（NaveGo に対し、実際の IMU/GNSS の走行で検証済み）。密結合の疑似距離／ドップラー UKF と、結合したクロック+位置フィルター（整合性のみ、検証済みの主張の範囲外）

seg-4a9bf6adeb45 = NaveGo v1.4（R. Gonzalez、LGPL-3.0、GNU Octave 上でツールとして実行し、リンクはしません）：その疎結合の ins_gnss を、NaveGo 自身の実際の Ekinox IMU/GNSS 陸上車両の走行データに適用し、両方の解を Ekinox の参照軌跡に対して採点しました。両方のフィルターは同じ { "20" } Hz の float32 入力を読み込み、Kshana の設定はデータセットの公表パラメーターから機械的に対応づけました。Kshana の水平・垂直の位置 RMS と位置イノベーション RMS は NaveGo の 1.2 倍以内（実測 { "0.912" }、{ "0.940" }、{ "0.861" }）で、平均の正規化イノベーションは最大 { "1.5" } 以下（実測 { "0.395" }：データセットが明記した GNSS シグマを前提にすると約 2.5 倍の過小信頼）です。許容差は比較の前に固定しました。範囲：GNSS は走行の全期間で { "5" } Hz で利用可能なため、途絶やコーストは試験しておらず、この検査は微調整ではなく重大なフィルターの欠陥を捉えるものです（レバーアーム補正済みの生の測位解は垂直の基準付近に着地します）。レバーアームの変換はテストハーネスで計算しています。密結合の UKF と結合したクロック+位置フィルターは、filterpy { "1.4.5" } による整合性の検査（線形の事後分布が { "2.4e-12" } まで一致）を維持し、検証済みの主張の範囲外のままです

seg-5692c7b936b6 = GNSS が使えない状況でのジャミングへのレジリエンス

seg-f4ff77caa47b = 幾何による J/S のリンクバジェット、耐ジャム C/N₀、衛星ごとのロックロス

seg-daf317735edb = 耐ジャム C/N₀ のリンクバジェット式を、独立した numpy による再導出と照合しました（同じ閉形式を共有しているため、InternalConsistency）。あわせて、実際の JammerTest-2024 の C/N₀ 劣化の特性評価も行いました。{ "0.30" } ラウンド { "2" }、ブロック（MODELLED のまま）：JammerTest { "2024" } で実測した C/N0 の低下を、リンクバジェットの予測（事前登録 6a66994b、{ "3" } dB 以内）と比較する試験は、Bleik での F8.1 のアンテナ位置と向き、およびマルチバンド { "1.6.4" } のランプ電力のうちの L1 の割合が、試験カタログにも公式ログにも記載されていないため、実行しませんでした

seg-ff90679d1de9 = スプーフィング検出

seg-b843f63e77e6 = クロック支援 χ²、RAIM、AGC、SQM をエポックごとに融合したセキュリティ性能指標

seg-baeb1c3db11f = TEXBAT のシナリオパラメーター（Humphreys { "2012" }）— 特性評価であり、固定したベクトルではありません。{ "0.30" } 外部比較、知見（MODELLED のまま）：JammerTest { "2024" }（Bleik、GPL-3.0 のデータ）では、観測量レベルのモニター（クロック支援カイ二乗、RAIM、解の失敗）は、評価可能な公表済みのスプーフィング開始 { "8" } 件のいずれでも { "10" } 秒以内に警報を出しませんでした（開始前の区間が正常だった場合、最初の警報は公表された枠の開始から { "10.2" } から { "39" } 秒後に出ました）。また、開始前の三つの区間で、クロックモニターによる誤警報がありました（{ "81" }、{ "64" }、{ "173" } エポック）。最初に観測された影響は、二周波 GPS の追尾の喪失であり、RAIM の不整合ではありませんでした。公表された開始時刻は分単位のスケジュール枠の開始であり、それが RF の取得より前にあるというのは、測定ではなく解釈です。{ "0.30" } ラウンド { "2" }：主催者による公式の JammerTest { "2024" } ログ（秒単位。事前登録 6a66994b、ラッチなしで Hadamard により較正した 三状態クロックモニター）に対する知見（MODELLED のまま）：モニターは記録された開始 { "10" } 件中 { "4" } 件で { "10" } 秒以内に警報を出します。残りの六件では { "18" } から { "211" } 秒遅れるか、開始前にクロックの誤警報を出します（{ "2.1.4" } で { "1" } 件、{ "2.3.15" } で { "85" } 件）。D9 ラウンド { "3" }（JammerTest 装置の他のセッションから得た受信機カード、事前登録 2ec76864）はブロックされました：{ "3600" } 必要なところ、学習エポックは { "167" } です。D9 ラウンド { "4" } と 4b（u-blox ZED-F9P のモデルクラスカード、Wroclaw { "2021" } によるノイズレベル、事前登録 fb475550；4b は修正した抽出による開示済みの再実行、c9cc0d49）、知見（MODELLED のまま）：記録された開始 { "10" } 件すべてで、開始前の誤警報はゼロ、{ "10" } 件中 { "6" } 件が { "10" } 秒以内です。{ "2.1.1" }、{ "2.3.5" }、{ "2.3.10" }、{ "2.6.1" } は遅れたままで（+{ "211" }、+{ "23" }、+{ "18" }、+{ "51" } 秒）、クロックのノイズレベルでは変わりません

seg-b10d07921f5e = スプーフィング下のタイミング保護レベル

seg-2a829711b997 = 検出されない最悪ケースの時刻誤差の閉形式の上限 = モニターの下限 + CUSUM の検出遅延にわたる発振器のコーストσ。レッドノイズフロアの帯として報告します

seg-682251b2e3c7 = 検証済みの基本要素（allan/holdover van-Loan、セキュリティ下限）を合成します。JammerTest { "2024" } のシナリオ { "2.1.1" } で較正しました（実際の供給時刻の引き込み量 ~{ "1.01" } ms に対し、主張は ≤{ "51" } ns）。検証済みの部品の上に架けた橋渡しであり、それ自体は外部検証ではありません。{ "0.30" } 外部比較、知見（MODELLED のまま）：JammerTest { "2024" } のスプーフィングシナリオでは、検出された開始 { "8" } 件中 { "3" } 件で、測定した未検出の供給時刻誤差が公称の TPL を上回ります：{ "184.3" } 対 { "34.6" } ns（{ "2.1.4" }）、{ "295.7" } 対 { "159.3" } ns（{ "2.3.5" }）、{ "143.0" } 対 { "69.0" } ns（{ "2.3.11" }）。範囲内の五件のうち三件は自明です（ラッチされた開始前の誤警報）。考えられる原因：ドリフトノイズをゼロとした { "60" } 秒の較正から得たコースト項は、{ "15" } から { "39" } 秒にわたる受信機 TCXO の周波数のふらつきをカバーしていません。測定した誤差は、Kshana 自身の単独測位クロック推定を、自身の開始前推定に当てはめた直線と比べたものであり、一致していたとしても完全に独立ではありませんでした。{ "0.30" } ラウンド { "2" }：公式の JammerTest { "2024" } ログの開始と測定した受信機の時刻誤差に対して（事前登録 6a66994b）、知見（MODELLED のまま）：記録された開始 { "10" } 件中 { "4" } 件で、未検出の誤差がドリフト状態の TPL を上回ります（{ "2.1.1" } で { "458.5" } ns に対し { "634.7" }、{ "2.3.5" } で { "16.2" } ns に対し { "232.6" }、{ "2.3.10" } で { "6.0" } ns に対し { "41.3" }、{ "2.6.3" } で { "47.4" } ns に対し { "218.6" }）

seg-0ec37553bbc4 = 地球・月間空間（シスルナー）のミッション解析

seg-a47465f682ba = CR3BP の STM と単一シューティングの微分修正器；L2 南 NRHO

seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database（SSD、periodic_orbits.api；地球・月 L2 南ハローファミリー、Howell/Davis の手法）— 外部で公表された周期 T、ヤコビ定数 C、垂直横断の初期条件です。kshana の単一シューティング STM 修正器は、カタログの初期条件を種として摂動を加えても、カタログのメンバーに再び収束します

seg-f1d49eac89f8 = 代替・補完的な PNT

seg-023dda973f66 = 重力マップ照合、地形参照（TERCOM/SITAN）、磁気異常

seg-da869d48e505 = IGRF-14 係数；第一原理のマッチドフィルター CRLB。実際の場を用いた重力ベンチマークの場は外部で検査済み（行「Gravity-anomaly synthesis from a spherical-harmonic model」）ですが、その航法結果には外部のオラクルがありません

seg-db7767ab661d = 球面調和モデルからの重力異常の合成

seg-2db367c4a473 = 球面近似での重力異常（Barthelmes STR09/02 式 { "126" }、ICGEM gravity_anomaly_sa）。完全正規化係数から、閉形式の水準楕円体（WGS84/GRS80）に対して零次項を含めて求め、重力マップ照合器向けにグリッド化します

seg-abcb0965dd2b = ICGEM Calculation Service（GFZ Potsdam）、独立した実装：次数 { "70" } で打ち切った EGM2008、gravity_anomaly_sa、WGS84、潮汐フリー、零次項、h = { "0" }。サービスの出力には明示的なライセンスがないため、グリッドはテスト時に固定した SHA-256（tools/fetch_icgem_grid.sh）で取得し、帰属表示付きで引用するのは十個の値だけです

seg-31f51d4998cb = 実地形での SRTM 数値標高リーダー

seg-08ea4ae0b671 = 自前の SRTM .hgt パーサー（16 ビットのビッグエンディアン、北の行が先頭、空白セル対応）と、実際のパブリックドメインの DEM タイルを読み込み、文書化された測量ベンチマークを解決するバイリニアサンプラー

seg-aae487789add = NASA/USGS SRTM v3（1 秒角）N36W117 タイル — AWS の elevation-tiles-prod オープンミラーから得た米国政府の PUBLIC-DOMAIN の標高データで、6 秒角に間引いて tests/fixtures/terrain/ にコミットしています（NOTICE.md を参照）。加えて、N36W117 と N36W119 の全解像度の切り出しを、GDAL の独立した SRTMHGT リーダーとノード単位で照合し、Mount Whitney（{ "4421" } m）と Badwater（−{ "86" } m）の測量ベンチマークとも照合しました。文書化された Badwater Basin のベンチマーク（−{ "86" } m、北米で最も低い地点）が、地理参照付きの読み取りの基準になります。この DEM を使う地形照合／TERCOM の航法解は、モデルから計算した区分のままです（別の「Alternative/complementary PNT」の行）

seg-791e7285c291 = 再現性とソフトウェア保証

seg-7177355a482c = 決定論的、シナリオのハッシュ化、SBOM、クロスプラットフォームのゴールデンゲート

seg-6cf9d570cc51 = SBOM の、公式の CycloneDX { "1.5" } JSON スキーマ（および有効な SPDX 識別子）への適合 — 外部で公表された標準であり、依存関係グラフ全体で検証エラーはゼロです。FoM の決定論性とバイト単位の再現性の部分は、固定した自己整合性の検査のままであるため、この行は MODELLED のままです

seg-89b2114542bb = AI/ML による RF 障害検出の評価（{ "13494" }）

seg-241f2eeaef12 = ラベル付きの合成障害コーパスと、検出器に依存しない ROC/AUC/混同行列/Pfa-Pmd のハーネス。リーケージガード、層化分割、分布シフト（レジーム内と外）の楽観性レポート。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/impairment-eval.toml）

seg-72a3c97ef04b = 閉形式の AUC 境界（Mann–Whitney）と完全なオラクル検出器。コーパスは合成です（パラメーターに基づくもので、実フィールド／IQ ではありません）

seg-c38ebee794b3 = AI/ML による RF 障害検出の楽観性ギャップ研究と、ID のみのギャップ予測器

seg-642087659fda = 公表された手法と学習済み（ロジスティック回帰／一隠れ層の MLP）の検出器にわたる、分布内から分布外への AUC の楽観性ギャップについての、制御された合成研究です。クラスごとのスケーリング則の傾向（Spearman ρ と { "1" }−severity に対する傾き）と、分布内の診断だけからギャップを推定する ID のみのリッジ予測器を扱い、検出器一つ抜き・クラス一つ抜きで採点します。<c1/> で再現できます

seg-c46973920f5b = 手導出の統計量と閉形式（二正規 AUC Φ(d'/√{ "2" })、DeLong 分散、同順位つきの Spearman、厳密な OLS の復元）の比較と、平均を予測するベースラインに対する一つ抜き交差検証です。コーパスは合成であり（パラメーターに基づくもので、実フィールド／IQ では決してありません）、楽観性ギャップは合成から合成への深刻度のシフトであって、シミュレーションから実環境への結果ではありません

seg-fd6424213d1f = 量子と古典の PNT のトレードと GNSS が使えない状況でのレジリエンス（{ "13503" }）

seg-21b2b54200a8 = 実測 ADEV の取り込み（NNLS）、トレード表（タイミング／慣性のホールドオーバーと利点）、レジリエンスの時間包絡線。下限についての注意書きは成果物に付けてあります。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/quantum-trade.toml）

seg-37d11937c966 = 実測 ADEV から PSD への当てはめ（NNLS）カーネルは scipy.optimize.nnls に一致します（tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs）— 独立した外部カーネルです。ただしトレードの数値はパートナーの時計／CAI を定量化するもの（検証するものではありません）であり、トレード自体は MODELLED のままで、検証のハローはありません

seg-1fa865bfddd1 = 宇宙天気の環境と、活動に連動する熱圏密度

seg-47308f611c7e = 太陽・地磁気の指数（定義による Kp↔ap の表）、Jacchia-1971 の外気圏温度、および静的な USSA76 大気に対する Jacchia { "1971" } の熱圏密度（SAO Special Report { "332" }：その表 { "7" } を再現する静的な拡散プロファイルに、日変化、地磁気、半年、季節・緯度、ヘリウムの変動を加えたもの）。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/space-weather.toml）

seg-1cad4329e226 = 定義による Kp↔ap の表と、Jacchia-1971 の外気圏温度の閉形式（公表されたアンカーに対して <{ "1" } K で一致、tests/space_weather_reference.rs）。密度は pymsis NRLMSISE-00（独立した NRL のモデル）に対して特性評価しました：{ "800" } km での太陽周期の振れ幅は、NRLMSISE-00 の 13.6 倍に対して 10.4 倍です。{ "0.30" } 改訂：較正済みの一次の活動係数を Jacchia { "1971" } に置き換えました（{ "400" } km でのデフォルトシナリオの密度 { "4.176e-12" } -> { "6.929e-12" } kg/m3；reference_exospheric_temperature_k を削除し、mean_exospheric_temperature_k を追加）。{ "0.30" } ラウンド { "2" }：TOLEOS で実測した CHAMP/GRACE/GRACE-FO の加速度計密度（ESA Swarm DISC；事前登録 20eed695）、知見（MODELLED のまま）：{ "400" } から { "500" } km での軌道平均は、嵐を除く太陽活動極大期には係数 { "2" } 以内に入ります（CHAMP { "2001" } 521/521、GRACE-A { "2002" } 120/120、GRACE-FO { "2024" } 526/547）。一方、Jacchia { "1971" } は { "2008" } の太陽活動極小期に約 1.7 倍密度が高すぎます（GRACE-A は係数 { "2" } 以内が 412/544）。したがって、密度は検証されていません

seg-29bedb28c34f = CCSDS OEM の相互運用性（GMAT/Orekit/STK のエフェメリス取り込み）

seg-edb58ffbbb5b = CCSDS { "502.0" } OEM インポーター（parse_oem）。COMMENT 行、追加のメタデータキーワード、共分散ブロックを許容し、ライターの厳密な逆変換になっています。往復変換と、速度の整合性検査を伴う外部ファイルの取り込みを行います。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/oem-interop.toml）

seg-c76b8c395ef0 = 打ち上げウィンドウと上昇の幾何（ミッション解析）

seg-6066c634faba = 二体の打ち上げ方位角（sin Az = cos i / cos lat）、到達可能な最小軌道傾斜角、円軌道速度、地球自転による東向きの利得、ドッグレッグの面変更 Δv と日ごとの機会、さらにエポックと IERS finals2000A の行が与えられた場合の、真の極まわりのサイト速度（launch::site_rotation_speed_at）。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/launch-window.toml）

seg-2515ab37f99b = 閉形式の球面三角法による打ち上げ幾何を、公表された例題のアンカー（Vallado, Fundamentals of Astrodynamics 第 4 版、アルゴリズム { "37" } の打ち上げ方位角と第 6 章の面変更；tests/launch_window_ascent_geometry_reference.rs）と比較しています。これらは kshana が実装する閉形式をそのまま再利用しており（公表値との一致と転記の検査、InternalConsistency）、MODELLED の二体で、回転する地球の速度三角形、上昇、抗力損失のモデルはありません。{ "0.30" } Orekit { "12.2" }（Apache-2.0）との外部比較、知見（MODELLED のまま）：幾何は丸め誤差の範囲で一致します（燃焼終了時の方位角から読み戻した傾斜角は { "158" } ケースで最悪 { "2.6e-15" } rad、最小傾斜角、円軌道速度、ドッグレッグの delta-v は { "3e-16" } まで）。しかし地球自転によるサイト速度は、緯度 { "62.9" } 度で、事前登録した相対 { "1e-6" } に届きません（{ "1.12e-6" }）。ギャップは tan(lat) に比例して大きくなり、球面の ω·R·cos(lat) が省略している、Orekit の地球座標系での約 { "5.8e-7" } rad の極運動による極のずれと整合します。主張は実行前に絞り込まれていなかったため、この比較では行の区分を引き上げることはできません。{ "0.30" } ラウンド { "2" }（事前登録 71bebf63）：エポックと IERS の行がある場合、真の極でのサイト速度（シナリオのフィールド site_rotation_speed_true_pole_m_s）は、四つの経度にわたる { "24" } か所のサイトで Orekit と { "1e-6" } 以内に一致します（最悪 { "4.9e-8" }）。しかしシナリオが地球自転による利得としてデフォルトで出力する、エポックなしの公称速度は依然として { "1.12e-6" } だけ外れるため、デフォルトの出力についての判断が出るまで、この行は MODELLED のままです

seg-ff2cd766bb52 = 弾道再突入コリドー（Allen–Eggers）

seg-c3f3422f96e4 = 指数関数的な大気中の弾道突入について、最大減速度（弾道係数に依存しない）、最大 g での速度と高度、最大加熱時の速度。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/reentry.toml）

seg-121f02d79ae0 = 閉形式の Allen–Eggers の解析的な突入を、同一の抗力のみの突入 ODE に対する scipy { "1.18" } の solve_ivp（DOP853）数値積分とも照合しました（tests/ballistic_re_entry_corridor_reference.rs、{ "36" } ケース、最悪の a_max 相対誤差 { "2.9e-9" }）。数値積分と自身の解析形の照合であるため、依然として InternalConsistency であり、外部検証ではありません。MODELLED の弾道（揚力なし）で、空力加熱／TPS はなく、加熱の出力は速度であって熱流束ではありません。{ "0.30" } 外部比較、知見（MODELLED のまま）：Stardust SRC の突入再構成（Desai と Qualls、NASA NTRS { "20080008567" }）に対して、記載された慣性系の突入状態（{ "12.9" } km/s、-8.2 度、H { "7200" } m）での Allen–Eggers の最大減速度は { "61.8" } g で、最良推定軌道の { "32.89" } g に対して +{ "88" } %、許容差 { "15" } % を外れます。飛行経路角が一定で重力なしの解は、浅く脱出速度を超える突入の最大値をおよそ倍にします。Stardust は加速度計を搭載していなかったため、この再構成は軌道の推定です。{ "0.30" } ラウンド { "2" }、ブロック（MODELLED のまま）：積分した平面質点の解（reentry::simulate_planar_entry、US76、逆二乗の重力、曲率）は、Stardust と Genesis の最良推定軌道と { "15" } % 以内で一致します（+{ "11.3" } %、+{ "5.6" } %）が、それらの最大値は機関のシミュレーション出力であり測定ではないため、これは相互検査にとどまります。加速度計との比較（事前登録 a94a283d）は、Hayabusa2 REMM 解析（doi 10.57350/jesa.16）の閲覧可能なコピーが得られず、ブロックされています

seg-8c10b50407d3 = EO ペイロードのフットプリントとカバレッジの幾何

seg-45c1e799c87c = SMAD の宇宙三角形の幾何：地球の角半径、観測幅、直下点 GSD、最大オフナディアアクセス、円軌道周期。加えて、軌道高度、傾斜角、センサーの FOV/IFOV に対する、一次の J2 昇交点周期（eo_payload::j2_nodal_period）と、連続カバレッジのフラグを伴う赤道での地上軌跡間隔 R_e (omega_E - dOmega/dt) T_nodal（eo_payload::ground_track_spacing_equator_j2）。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/eo-coverage.toml）。そのデフォルトの傾斜角は eo_payload::sun_synchronous_inclination による太陽同期のものであり、検証済みの主張の範囲外の便宜的なデフォルトです

seg-42411e7c37c9 = Orekit { "12.2" }（Apache-2.0）と GeographicLib { "2.1" }（MIT）、どちらも別のプログラムとして実行し、エンジンの変更とオラクルの実行の前に事前登録しました（766823f3）：球の量では相対 { "1e-9" } 以内（最悪：角半径 { "5.4e-16" }、観測幅 { "7.0e-13" }、アクセス { "1.9e-14" }）、周期は { "1e-12" }（{ "1.6e-16" }）、直下点 GSD は { "1e-7" }（{ "2.9e-10" }）、J2 昇交点周期と昇交点間隔は、昇交点検出器を用いた Orekit の数値 J2 伝搬の { "0.1" } % 以内（{ "1.2e-5" } と { "6.7e-5" }）、連続フラグは厳密に一致（168/168）、WGS-84 楕円体に対しては、リムが { "0.3" } 度以内（{ "0.186" } 度）、最大地上距離が { "0.5" } % 以内（{ "3.2e-3" }）です。昇交点の回帰項を除くと、{ "42" } 個の昇交点のうち { "35" } 個が基準を外れます。MODELLED の範囲：球形地球のフットプリント；放射測定、MTF、大気、ジッター、グリントはなし；太陽同期のデフォルトの傾斜角は比較していません。以前の Skyfield/SGP4 の相互検査は回帰テストとして残しています。{ "0.30" } 改訂：間隔は J2 の昇交点回帰を含むようになりました（デフォルトシナリオ { "2756.37" } -> { "2752.17" } km）

seg-940692c550f3 = CCSDS Space Packet（{ "133.0" }）の TM/TC フレーミング

seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet のプライマリヘッダーのエンコード／デコード（version/type/sec-hdr/APID/seq-flags/count/data-length）とフレーミングのシナリオ。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/space-packet.toml）

seg-6bec79623cc8 = spacepackets { "0.32.0" }（us-irs/spacepackets-py、R. Mueller、Apache-2.0）— CCSDS 133.0-B-2 の独立したサードパーティ実装です。kshana の encode_packet/decode_packet はバイト単位で一致しました（{ "33" } ケースの 6 オクテットのプライマリヘッダーと、{ "12" } ケースの完全にエンコードされたパケット）

seg-5510c82f671a = CCSDS Space Packet のセカンダリヘッダー、パケット誤り制御、セグメンテーション

seg-7503bf761df9 = プライマリヘッダーに加えた CCSDS 133.0-B-2 Space Packet の拡張：CCSDS 301.0-B のタイムコード（CUC または CDS、P フィールドは明示または暗黙）と補助データを運ぶセカンダリヘッダー、CRC-16 のパケット誤り制御フィールド、大きなユーザーデータ単位のセグメント化とその再構築、シーケンスの欠落と順序の検査を伴うストリームのデコード、PUS-TM パケット。プライマリヘッダーの出力は、従来とバイト単位で同一です

seg-4123d600477a = いずれの比較よりも前に事前登録（003ef3eb）。四つの独立した実装を用い、いずれも GPL ではなく、何も同梱していません：ccsdspy { "2.0.1" }（BSD-3-Clause）は、Kshana が書いた { "34" } 個のパケットを { "5" } 本のストリームでデコードし（プライマリヘッダー、P フィールド、粗い時刻と細かい時刻、CDS フィールド、補助データ、ユーザーデータ、PEC）、1000 オクテットの二つのセグメント化された単位は、そのユーザーデータから不一致 { "0" } 件で再構築されます。また、Kshana が拒否する、パケットが欠落したストリームと入れ替わったストリームも検出します。{ "8" } 個のメッセージの CRC と { "57" } 個の PEC フィールドは、CPython の binascii.crc_hqx と spacepackets-rs { "0.18.0" }（チェック値 0x29B1）に一致します。{ "66" } 個の CUC と CDS のタイムコードのケースは、spacepackets-rs { "0.18.0" } の書き込みと読み取りにオクテット単位で一致します（{ "3" } 個の CDS ケースは spacepackets-py { "0.32.0" } でも一致）。{ "4" } 個の spacepackets-py { "0.32.0" } の PusTm パケットは、Kshana のものとバイト単位で同一です。対象外：機関のエポックのタイムコード（{ "7" } ケースは単体テストに依拠）、TC 転送フレーム、パケットより下のあらゆるリンク層

seg-7c61da52b8f8 = SPICE SPK のエクスポート（タイプ { "9" } と { "13" }）

seg-582ce23522f6 = タイプ { "9" }（ラグランジュ、不等間隔の時刻ステップ）とタイプ { "13" }（エルミート、不等間隔の時刻ステップ）の NAIF SPICE SPK カーネルのライターとリーダー。DAF レイアウト、セグメント記述子、エポックディレクトリを含み、CCSDS OEM の SPK カーネルへのエクスポート（UTC または TDB のエポックから暦表時への変換）も行います

seg-194c37ac787f = spiceypy { "8.3.0" } 経由の CSPICE N0067、うるう秒カーネル naif0012.tls。SPICE が Kshana のカーネルを読む前に事前登録しました（5059fd2a）：SPICE による Kshana の四つのカーネルの目録は厳密に一致します。{ "5 516" } エポックでの spkpvn と spkgeo、および { "690" } 件のチェーン評価は、Kshana 自身の評価とビット単位で一致し、すべてのノードで基準の内側にあります（最悪で基準の { "0.022" }）。Kshana は SPICE が書いたカーネルをビット単位で同一に読み込みます。同じ入力に対して Kshana のカーネルは SPICE のものとバイト単位で同一です（四つのファイルで異なるバイトは { "0" }）。OEM のエポックは str2et と { "6.0e-8" } 秒以内で暦表時に変換され（基準 { "1e-6" } 秒）、SPICE は OEM のエクスポートを基準内で評価します（最悪 { "0.060" }）。合成したケプラー弧であり、物理的な精度については何も示しません。他の SPK タイプは書き出しません

seg-d699104fc2af = SPICE SPK タイプ { "3" } と { "21" }（チェビシェフ、拡張差分ライン）

seg-7d3e8b5b40af = タイプ { "3" }（位置と速度の、固定区間にわたるチェビシェフ多項式、次数 { "0" } から { "27" }）とタイプ { "21" }（拡張修正差分配列、JPL の積分器の差分ライン、MAXDIM { "15" } から { "25" }）の NAIF SPICE SPK セグメントのライターとリーダー。与えられたレコードから、タイプ { "9" } と { "13" } のセグメントも含むファイルに書き出し、レコードの選択と評価は SPICE のリーダーの順序に従います。Kshana はチェビシェフ係数の当てはめも差分ラインの生成も行いません

seg-40323a2adce1 = spiceypy { "8.3.0" } 経由の CSPICE N0067（spkw03、spkw13、および同じライブラリから f2c シンボルで呼び出す spkw21；spkpvn、spkgeo）。コードが存在する前に事前登録し（e1cf80d8）、合成レコードはそのコミットの SHA-1 から生成しました：三つのファイル（タイプ { "3" } の次数 { "0" }、{ "12" }、{ "27" } でレコード { "3" } から { "150" } 件；タイプ { "21" } の MAXDIM { "15" }、{ "20" }、{ "25" } でライン { "1" } から { "250" } 件、ディレクトリエントリはゼロから二つ、中心チェーンあり；タイプ { "3" }、{ "21" }、{ "13" } を一つのファイルにコメント付きで収めたもの）について、SPICE による Kshana のカーネルの目録は厳密に一致し、Kshana のカーネルは同じレコードから SPICE が書くものとバイト単位で同一で、spkpvn と spkgeo は Kshana のファイルでも SPICE のファイルでも Kshana のリーダーとビット単位で一致します（各方向 { "48 876" } 成分、基準は相対 { "1e-12" }）。合成レコードであり、物理的な精度については何も示しません。実際の JPL 製のタイプ { "21" } カーネルはケースの集合に含まれていません

seg-39517faae95c = CCSDS 姿勢データメッセージ（AEM、APM）

seg-f88f6ea002c8 = KVN と NDM/XML の CCSDS 504.0-B-2 姿勢データメッセージのライターとリーダー：AEM バージョン { "2.0" }（および KVN の { "1.0" }、ATTITUDE_DIR、QUATERNION_TYPE、数値の回転シーケンスを含む）。クォータニオン、オイラー角、スピンの姿勢タイプと、その微分、角速度、章動のバリアント、複数のセグメントを扱います。APM バージョン { "2.0" }：クォータニオン、オイラー、角速度、スピン、慣性、マニューバの各ブロック。レコードの A から B へのクォータニオン（504.0-B-2 附属書 F）

seg-8853058de1f3 = Orekit { "13.1.8" }（Apache-2.0）のパーサーとライターを別のプログラム（xval/adm-orekit）として実行し、いずれの比較よりも前に事前登録しました（7a6a05fe）：Orekit は Kshana が書いたすべてのメッセージ（AEM KVN { "14" } 件、AEM XML { "11" } 件、APM KVN { "4" } 件、APM XML { "4" } 件）をパースし、すべての値が各基準の内側にあります（クォータニオン { "1e-14" }、角度 { "1e-9" } 度；最悪で基準の { "0.054" }）。Kshana は、同じ入力から Orekit が書く { "31" } 件のメッセージを、すべての基準の内側でパースします。{ "135" } 件のクォータニオン、オイラー、スピンの各レコードの回転は、AemSegment.getAngularCoordinates と { "1e-12" } 以内で一致します（最悪で基準の { "0.0071" }）。Kshana の XML メッセージ { "15" } 件すべてが NDM/XML { "4.0.0" } スキーマに対して検証に通ります（データによるゲート、固定した SHA-256 で取得）。知見：Orekit の APM ライターは MAN_DELTA_MASS のないマニューバを拒否する（標準では任意）ため、APM のマニューバは Kshana が書く方向でしか確認していません。ケースの集合の対象外：AEM { "1.0" } の */RATE タイプと XML、繰り返される APM ブロック

seg-5f26f879037e = CCSDS 軌道データメッセージ（OPM、OMM、OCM）

seg-eaddfd311fea = KVN と NDM/XML の CCSDS 502.0-B-3 軌道データメッセージのライターとリーダー：OPM { "3.0" } と { "2.0" }（状態ベクトル、接触ケプラー要素、宇宙機パラメーター、共分散、マニューバ、ユーザー定義パラメーター）、OMM { "3.0" } と { "2.0" }（平均運動または軌道長半径による平均要素、BSTAR または BTERM と AGOM を伴う TLE 関連パラメーター、共分散）、OCM { "3.0" }（軌道（CARTP、CARTPV、CARTPVA；絶対または相対のエポック）、物理特性、共分散（LTM 順の CARTP、CARTPV）、マニューバ、ユーザー定義の各ブロック）。変更のない OmmFile::to_omm_kvn とは別に、SGP4 要素セットからの全精度の OMM も扱います

seg-d4c7896b5963 = Orekit { "13.1.8" }（Apache-2.0）の OPM、OMM、OCM のパーサーとライターを別のプログラム（xval/odm-orekit）として実行し、いずれの比較よりも前に事前登録しました（cc6841da）：Kshana が書いた { "30" } 件のメッセージ（KVN の OPM { "6" } 件、OMM { "5" } 件、OCM { "5" } 件のケースと、バージョン { "3.0" } の XML）のうち { "27" } 件が Orekit でパースでき、すべての値は相対 { "1e-14" } 以内、すべてのエポックは { "1e-9" } 秒以内です（{ "904" } 個の値、最悪で基準の { "0.021" }）。Kshana は Orekit が書き戻した { "25" } 件すべてを同じ基準の内側で読み込みます（{ "858" } 個の値、最悪 { "0.020" }）。Kshana の XML メッセージ { "14" } 件すべてが NDM/XML { "4.0.0" } スキーマに対して検証に通ります（データによるゲート）。主張を狭める、固定した知見：Orekit は ELEMENT_SET_NO を必須とし（502.0-B-3 では任意）、XML のユーザー定義パラメーターでの COMMENT を拒否し（スキーマは許可）、BSTAR なしの BTERM を書かず（このため BTERM と AGOM は Kshana が書く方向でしか確認していません）、OCM の相対エポックを SI 秒として加算するため、TDB では TDB の暦の読みと約 { "1.9e-10" } s/s 異なります（UTC、TAI、TT は一致）。従来の OmmFile::to_omm_kvn の出力は、OMM のメタデータを META_START/META_STOP で囲んでおり、Orekit に拒否されます（記録済み）。範囲外：OCM の PERT と OD ブロック、非デカルト要素セット、他の共分散の順序

seg-1e5ea1d9918d = 3-DOF の姿勢・ポインティング誤差配分（AOCS）

seg-21f2f8efcf19 = 重力傾斜による最悪ケースの外乱トルク（(3/2)(μ/R³)ΔI）を姿勢にわたるピークとして求めたもの（検証した主張）と、名前の付いた 1σ の寄与要素にわたる RSS ポインティング誤差配分および支配的な項（呼び出し側が与えた数値の二乗和平方根であり、検証した主張の範囲外）。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/attitude-budget.toml）

seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector（AVSLab、ISC）、完全なテンソルによる重力傾斜トルクの独立した C++ 実装：Kshana のピーク (3/2)(μ/R³)ΔI は、{ "5" } 通りの高度と { "8" } 通りの慣性テンソルにわたって、{ "45" } 度の姿勢での Basilisk のトルクと相対 { "1e-12" } 以内で一致し（最悪 { "2.1e-15" }）、ケースごとにランダムな { "2000" } 通りの姿勢にわたる Basilisk のトルクを上から抑えます。許容差は比較の前に固定しました。検証した主張：重力傾斜トルクのピーク。RSS ポインティング配分は、呼び出し側が与えた数値の二乗和平方根で外部の真値がなく、その範囲外のままです。手書きの Hipparchus による完全テンソルの最大化は、補助的な自己整合性として残しています。制御ループ／6-DoF／柔軟モードのシミュレーションは含みません

seg-1461aa14a7ff = 地上局のパス予測（地上セグメント）

seg-e1cf1ec4f005 = 仰角マスクより上にある局に対する、エンジンの伝搬器の時間領域の可視パス（AOS/TCA/LOS、最大仰角、継続時間）。補間した出没の交差と総アクセスを含みます：passes::predict_passes、幾何的なスケジューラー（屈折と光行時間なし）。<c1/> シナリオ種別は、行「Apparent ground-station pass prediction with refraction and light time」の見かけのパス予測を実行します

seg-b351cd4245dd = Orekit { "12.2" }（CS GROUP、Apache-2.0）+ Hipparchus { "3.1" } — 独立した飛行力学ライブラリ：ITRF エフェメリス上の ElevationDetector（Brent の求根法）+ EventsLogger、局は WGS-84 の TopocentricFrame。AOS/LOS/最大仰角/パス数/総アクセスを、同一の軌道、局、マスク、期間で照合しました（コミット済みのフィクスチャ；ドライバー xval/orekit-passes）

seg-1dd8b2655b18 = 屈折と光行時間を考慮した、見かけの地上局パス予測

seg-46f93d3c24d2 = 検証済みの地球周回軌道パス（IAU 2006/2000A、任意の地球姿勢パラメーター）上での、SGP4 要素セットの WGS-84 局に対する可視パス（AOS、TCA、LOS、見かけの最大仰角、継続時間）。ITU-R P.834-9 の対流圏屈折（式 { "9" } から { "14" }、勧告に記載された係数）とダウンリンクの光行時間を、それぞれ切り替え可能に含みます。交差は { "1e-7" } 秒まで二分法で、最大点は黄金分割探索で求めます。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/passes.toml）。両方の補正がデフォルトで有効です

seg-19d166cb653f = Orekit { "13.1.8" }（CS GROUP、Apache-2.0）と Hipparchus { "4.0.3" }：同じ要素セットに対する TLEPropagator を、Orekit が定義どおりに構築する TEME（IERS { "2010" } の TOD を GAST - GMST で回転したもの）で実行し、ITURP834AtmosphericRefraction あり・なしの ElevationDetector と ElevationExtremumDetector、光行時間のケースには AngularRadioRefractionModifier を伴う AngularAzEl を使い、交差と最大点は Hipparchus で解きます。{ "60" } ケース（四つの軌道、五つの海面高度の局、マスク { "0" }、{ "5" }、{ "10" } 度、{ "24" } 時間）。基準は実行前に固定しました（事前登録 e947e69d、72ea9eb0 の第 { "3" } レッグ）。光行時間を無視する（{ "9777" } 件の失敗）か、P.834 の定数 { "1.728" } を { "1.828" } に変える（{ "7883" } 件の失敗）と、テストは失敗します。範囲：局は海面高度；Orekit の P.834 の h*theta0^{ "2" } 係数は、勧告が { "0.01380" } と記載しているところ { "0.011380" } であり（固定）、そのため海面より上の高度は比較していません。ラウンド { "1" } は、Orekit のデフォルトの IERS { "1996" } TEME に対して、パスの基準はすべて満たしましたが、{ "72" } mas の TEME の規約の差により方向の基準を外しました（固定）

seg-7b4a8e25c3c9 = LEO ダウンリンクのパスに沿った DVB-S2 適応符号化変調

seg-3912fb8ccb15 = 一つの局の上空での一機の衛星の各パスに沿ったダウンリンクの Es/N0（EIRP、自由空間損失、余割則の大気損失、その他の損失、G/T、ボルツマン定数、シンボルレート）、各ステップでの ETSI EN { "302" } 307-1 V1.4.1 表 { "13" } の準誤りなしのしきい値に実装マージンを加えたものをクリアする最も効率的な DVB-S2 MODCOD、パスの ACM データ量、およびマスクと最長距離で閉じる固定符号化のベースライン。<c1/> シナリオ種別として実行できます。例示用の入力；MODELLED。

seg-a7f26e3a6030 = 内部整合性：表 5a の K_bch とフレーム長から閉形式で計算したスペクトル効率は、表 { "13" } が記載する効率と一致します（しきい値表の転記の検査）。リンクバジェットの各部分はその閉形式と一致し、選択は Es/N0 に対して単調でマージンを守り、ACM は少なくとも固定符号化のデータ量を転送します。パスの幾何は、別に VALIDATED の見かけのパス予測器から得ています。検証していないもの：外部のツールや実測のリンクとは比較していません。しきい値は規格の理想的な AWGN の値であり、モデムのものではありません。降雨フェージング、パス途中のポインティング損失、パイロットはモデル化していません。

seg-19603a7e0fe8 = 競合解決を伴う、複数衛星・複数局の地上コンタクトのスケジューリング

seg-40edeae6e48b = すべての衛星と局のパスから、その ACM データ量を付けて求めたコンタクト候補。一つのアンテナが旋回時間内に二機の衛星を担当することになる競合や、一機の衛星が同時に二つの局へダウンリンクすることになる競合。各衛星のバックログを上限とした、優先度で重み付けした配信目的関数。遅延評価の限界価値による貪欲な計画、先着順のベースライン、最大 { "26" } 個の候補に対する厳密な分枝限定法。貪欲法の最適性ギャップも報告します。<c1/> シナリオ種別として実行できます。例示用の入力；MODELLED。

seg-bc520db98f9a = 内部整合性：厳密な分枝限定法は、小さなランダム集合での全探索と一致し、すべての計画は競合規則に対して実行可能であることを検査し、貪欲法は厳密な最適解を上回りません。検証していないもの：外部のスケジューラーや運用上の計画とは比較していません。コンタクトは分割せず全体として扱い、バックログはウィンドウの開始時点で固定し、固定の旋回時間を超えるスルー時間と搭載ストレージはモデル化していません。

seg-ddf2bc2f13a9 = 片道リンクバジェット（通信／リンク設計）

seg-83331f513dba = EIRP/G·T/距離/レート/帯域に対する、必要な Eb/N₀ との比較における、CCSDS { "401" } / DSN 810-005 のリンク方程式にわたる自由空間伝搬損失、C/N₀、Eb/N₀、マージン、リンクの成立。CLI やバインディングから <c1/> シナリオ種別として実行できます（scenarios/link-budget.toml）

seg-195bf7e31f24 = 公表された深宇宙通信の設計管理表を、固定した数値ベクトルとして使用：DESCANSO / J. H. Yuen（編）、Deep Space Telecommunications Systems Engineering、JPL Pub 82-76、表 1-1（Galileo X バンド）— kshana は表の各項目を組み直し、公表されたエンドツーエンドの L_fs { "290.54" } dB と Pr/N0 { "54.6" } dB-Hz を再現します。自由空間損失は ITU-R P.525 とも照合しています

seg-3742d2aea62a = 倹約的なカバレッジ当たりのコスト／ROI の枠組み

seg-4228311689f8 = 衛星コンステレーションの規模設計エンジンにわたる、カバレッジのパーセント当たりのコストとユーロ当たりのカバレッジの ROI。衛星ごとのコストは、呼び出し側が出所を示した低／公称／高の幅であり、価格を捏造しません

seg-d542ac64c31c = 閉形式のコスト計算を手導出の値と比較しています。モデル化したカバレッジの数値についての経済的な位置づけであり、見積もりでも、検証済みのコストモデルでもありません

seg-8ba6ee9acc8a = 検出見逃しのインテグリティへの影響（状況に応じた HPL/VPL とアラート限界の比較）

seg-f5985399d0d5 = 未検出のスプーフィング／ジャミングのバイアスを実効誤差に対応づけ、状況ごとの HAL/VAL（開けた空と都市）に対する Stanford 領域（利用可能／利用不可／MI／HMI）に分類します

seg-124d0ffe959e = 外部で検証済みの RAIM の Stanford 分類（raim::classify_stanford）を合成します。検出見逃しから AL への対応づけ自体はモデル化したものであり、認証されたインテグリティの配分ではありません

seg-37d43b5b918a = CAI の引用付き誤差モデルのパラメーターシート（{ "13503" }）

seg-0b6a901f5ad2 = 範囲を示した（最良／公称／保守的な）冷却原子干渉計の性能 — バイアス不安定性、速度／角度ランダムウォーク、スケールファクター安定性、干渉時間に制限されるサンプルレート、縞のアンビギュイティによるダイナミックレンジ — それぞれ出典をたどれます。ハードウェアをモデル化せずに QuantumNavBudget に入力します

seg-4b66096727b8 = 内部整合性：引用した VRW の範囲を CaiAccelerometer::accel_asd の物理と照合し、縞のアンビギュイティの限界から計算した生のダイナミックレンジも確認しています。数値は MODELLED の文献調査による範囲（needs_source_confirmation）であり、検証したデバイスはなく、検証のハローもありません

seg-c93f2d3a3167 = タイミングインテグリティ適合性ベンチマーク — Stanford インテグリティ図のエポック分類器

seg-712d5c35a6a6 = TIB の Stanford インテグリティ図によるエポック分類（公称／利用不可／MI／HMI）

seg-93b913e60063 = 同一のサンプル集合に対する、四領域の規則の独立した numpy 再実装（scripts/gen_tib_scorer_reference.py）。手法は Stanford–ESA インテグリティ図（Tossaint ら、ION GNSS { "2007" }）と RTCA DO-229 WAAS MOPS からの引用です。ExternalDataset の精度のオラクルではありません — このベンチマークは正直さの検査の影響を受けません。

seg-573aa0193cb3 = タイミングインテグリティ適合性ベンチマーク — インテグリティカバレッジのスコアラー

seg-4d86f3c2d8f5 = TIB のインテグリティカバレッジ採点（HMI/MI/可用性の比率と、オーバーバウンドのカバレッジの判定）

seg-645eb084ae8e = tests/fixtures/tib/reference.json にある、独立した numpy による領域の再集計。スコアラーの仕組みの相互検査のみであり、精度の主張はありません。

seg-372dd0fdb025 = タイミングインテグリティ適合性ベンチマーク — 故障カタログ（パラメトリックな生成器）

seg-2604e7cf27d2 = TIB の故障メニュー（ドメインの乖離、クロックの急変、ホールドオーバーのコースト、静的／増分／対称／非対称の遅延、鮮度内のリプレイ、経路選択的、k-of-N クォーラム）

seg-b907aecaccd0 = 代表的なパラメトリックな故障生成器（モデル計算）。検出不能な集合（対称遅延、鮮度内のリプレイ）は Mizrahi RFC { "7384" } と Narula & Humphreys（IEEE JSTSP { "2018" }）からの引用です。外部のオラクルはありません — 故障カタログは測定に基づく主張をしません。

seg-90c0eb1e7c14 = タイミングインテグリティ適合性ベンチマーク — 検出不能な故障の吸収の判定

seg-f713acf042ff = TIB の検出不能な故障の吸収の判定（対称遅延／リプレイは、PL に吸収されなければならず、検出されたと報告してはならない）

seg-6840c2467c63 = Verdict の列挙型が、検出不能な故障を検出されたものとして報告することが構造上できないことの性質検査です（Mizrahi RFC { "7384" }）。吸収 ⟺ PL ≥ オフセット。精度のオラクルはありません。

seg-3652a591eefc = 宇宙機バスのエンジニアリング（AOCS／熱／構造／推進／電力）

seg-50a9c1c7dff0 = 提供しません — Kshana は航法性能のシミュレーターであり、バスの設計会社ではありません

seg-a349aa76b0ed = PARTNER

seg-b28dd62dca1c = 航法 RF ペイロードとアンテナのハードウェア設計

seg-76c983a23e7b = 提供しません — Kshana がモデル化するのは信号性能であり、ペイロードやアンテナのハードウェアではありません

seg-7bba3b35214c = 量子ペイロードのハードウェア設計と成熟化

seg-15fcc200b859 = 提供しません — 性能モデルのみです。冷却原子／時計のハードウェアはパートナーの担当です

seg-d69dd4c5167b = 飛行ハードウェアのプロダクトアシュアランス（放射線／EEE／MAIT）

seg-b1540f78ffd4 = 提供しません — Kshana が扱うのはソフトウェアの PA のみで、飛行用の PA はパートナーの担当です

seg-1f200f8efc71 = 月の座標時

seg-2e6961dbffe9 = 相対論的な地球・月のクロックレート（LTC/TCL）+ TT/TAI/UTC の連鎖 + アンサンブル

seg-3f52d6e04361 = Ashby & Patla { "2024" }、'A Relativistic Framework to Estimate Clock Rates on the Moon'、Astronomical Journal { "167" }:{ "149" }（NIST；IAU/IAG LunaNet の LTC の基礎）：月面の自己ポテンシャル L_m = { "3.13881e-11" } と永年項の合計 { "56.02" } µs/日を、公表された数値として照合しました。地心での月の速度は JPL DE440（SPICE 経由の de440s.bsp）と照合しています

seg-8adbbd2cdb74 = ハイブリッド光／RF レポートの自己記述

seg-2a5e48b558e1 = hybrid-optical-rf レポートは、実際に実行したリンク構成（搬送波波長、送信・受信の開口、距離、パルス幅、積分時間、効率と損失、解決済みのデフォルト）を明記し、論文が引用しそうなすべての量の単位と出所の区分を示す units ブロックを備えます。これには、平方メートルで表したハンドオフ共分散のトレースも含まれます

seg-23f0c10237f4 = 外部のオラクルはなく、あり得ません：これは測定ではなく自己記述です。記録しているのは、これがなかったことが欠陥だったためです。P5 は、搬送波波長と送信開口をソースのデフォルトから引用し、裸の <c1/> が平方メートルであることを内部整合性の検査から推定しなければなりませんでした。その推定は正しかったのですが、だからこそ重要でした。誤っていても、それを捕捉するものは何もありませんでした

seg-0691f3dee8cb = RF 側のハイブリッド光／RF リンクの可用性

seg-72ccb655caf0 = hybrid-optical-rf レポートは RF リンクの可用性を示します。これは、外部から取り込んだ気候統計ではなく、エンジンがすでに計算している量から合成したもので、その合成を名前の付いた規則として明記します：A_rf = I_closure * I_track。I_closure は、シナリオ自身の距離での片道 CCSDS-401 / DSN-810-005 リンクバジェット（linkbudget::link_budget、Eb/N0 マージン >= { "0" }）の成立の判定で、I_track は、その同一のバジェットが返した C/N0 に対する追尾ループの判定（jamming::lock_status）です。各因子は入力の出所の区分を出力まで引き継ぎ、意図的に積に含めていない因子 — 幾何的な可視性、干渉による拒否、RF の途絶の気候統計 — は、黙って { "1" } とせずに、理由とともに明記します。解決済みの RF レグは、独自の rf_link_configuration ブロックとして出力し、指標の隣にある連続的な数値（リンクマージン、C/N0 マージン、閉形式の成立距離と追尾距離、距離の利用率）は、同じバジェットの距離の逆算です。レポートは、読者が行き着くブロックと units の項目の両方で、この数値がマージン／幾何で制限され決定論的であるのに対し、光の可用性は天候／気候で制限され確率的であることを全文で明記しており、このため両者を比較可能な一対のパーセンテージとして引用することはできません

seg-319705ea0166 = 外部のオラクルはなく、ExternalDataset は採用しません。二つの入力は、Eb/N0 マージンと C/N0 のしきい値交差であり、どちらも MODELLED の EIRP、性能指数、一括した損失配分の関数です。合成した数値と照合できる、地球・月の光／RF ハイブリッドサービスの実測の可用性の記録はありません。存在する検査は内部のものであり、そう明記します：合成は、エミッターの内部ではなく、レポート自身が公表したマージンから再計算し、成立距離は、その距離でリンク方程式を再実行してマージンが消えることを確認して検証します — これは独立した実装ではなく、逆算の往復です。この数値の正直な限界はレポート自身に記録されています：これは決定論的な 0/1 の指標であって確率ではありません。このエンジンのどこにも、この帯域と幾何での RF リンクの途絶分布を測定するものがないためです。その欠けている入力は、でっち上げず rf_availability.factors_not_included に名前を挙げており、それを与えることが、確率的な RF 可用性に必要なことです

seg-22c5df9b6c7c = 同じ条件での光と RF の測距の比較

seg-70eb396f40af = hybrid-optical-rf レポートは、光と RF の測距比を、両方のレグを評価した単一の構成を同じオブジェクトに載せて出力します：同じ片道の経路、同じ距離、同じ積算時間です。光のレグは、片道の光子数に対するエンジンの光子制限の ToA CRLB で、RF のレグは、エンジン自身のリンクバジェットがその同じ片道距離で返す C/N0 での、エンジンの DLL の早遅の熱雑音による符号追尾ジッターです。ループ雑音帯域幅は選ぶものではなく導出されます：B_L = 1/({ "2" }*integration_s) により RF のレグはちょうど光の積算時間に置かれ、呼び出し側が上書きして二つの平均化時間が食い違った場合、比は REFUSED となり — null、食い違いと両方の時間を明記 — 二つの動作点で引用することはしません。シナリオの選定したパラメトリックな rf_position_sigma_m に対しては比を作らず、拒否の理由も示します：その入力は構成をまったく持たないためです。公開された双方向の光の見出しの値と、それを片道の比較レグに橋渡しする正確な係数は比の隣に出力されるため、レポートが食い違う二つの光のシグマを持つものとして読まれることはありません

seg-acbb3ac98ee3 = 比についての外部のオラクルはなく、ExternalDataset は意図的に採用しません。基礎となる RF の連鎖にはあり — tests/validate_p5_rf_ranging_precision.rs は linkbudget::link_budget と navsignal::dll_code_jitter_chips を、独立した Python/NumPy のフィクスチャと、ハードコードされた Kaplan & Hegarty の例題の値（{ "2.814e-3" } チップ / { "0.825" } m、{ "45" } dB-Hz）に対して検査します — 光の CRLB にも独自の閉形式の行があります。どちらかのアンカーをこの行に主張するのは、借り物の検証であり、検証マトリクスの不変条件はそれを防ぐためにあります。ここでの量は、MODELLED の EIRP、性能指数、送信電力、開口を持つ構成での比であり、共通の動作点での光と RF の測距の実測の比較は、照合先として存在しません。内部で検査しているのは、比が実際に誤り得ることです：二つのレグが一つの動作点にあることです。これは共通の積算時間をスケールし、両方のレグが同じ平方根則で動き、比が変わらないことを確認して測定し、平均化時間が食い違う場合に比をそもそも拒否することで担保しています。両方のレグは熱雑音／ショット雑音の限界であり、どちらも媒質遅延、クロック誤差、アンビギュイティを除外しているため、除外は両側で同一です。レポートは、それを読者の推測に任せず明記します

seg-3f26f598e013 = リンクバジェットレポートの自己記述

seg-b88bf41d6d4c = リンクバジェットレポートは、そのマージンの計算に使った絶対定数のすべて — 自由空間損失で使った搬送波周波数、EIRP、性能指数、一括した損失、ボルツマン項 — に加えて、マージンがゼロになる必要 G/T、公表されたレート／利得の表が固定できる唯一の組み合わせであるリンク定数（EIRP - 損失 - 必要 Eb/N0）、そして呼び出し側がシステム雑音温度を与えた場合には、その性能指数が意味する受信アンテナ利得を明記します

seg-52f98f50522f = 外部のオラクルはありません：これは、公表された設計管理表に対してすでに検証済みの方程式についての自己記述です（片道リンクバジェットの行を参照）。記録しているのは、これがなかったことが測定された欠陥だったためです — 公開された d1_rate_gain_beamwidth.csv の再現には、三十行すべてから一つの実効定数を { "0.0034" } dB まで逆算する必要があり、エンジンは今ではその組み合わせに名前を付けるとともに、公開されたどの表もその三つの構成要素を分離できなかったことをテストで証明します

seg-a7b192e27cb5 = クロッククラスごとの月の時刻のクロスオーバー表

seg-cab605dc6ea2 = 月の時刻配分の一回の実行は、単一の共有フレーム項に対してクロッククラスごとにクロックとフレームのクロスオーバーの行を出力するため、比較で変わるのはクロックだけです。各行は二通りの方法で得たクロスオーバーを持ちます — 一般的なべき乗則の時刻誤差曲線から二分法で求めたものと、その行の支配的なノイズ種別から代数的に逆算したもので、両者の相対差も併記します

seg-ccec15f0b125 = 同じ量についての、コードベース内の二つの異なる計算であり、一つを言い換えたものではありません：IEEE-1139 のべき乗則曲線への二分法はノイズ種別を何も知らず、閉形式は支配的な種別を代数的に逆算するため、ノイズ種別の分類の誤りや不適切な区間は、小さくない相対差として現れます。四つの値は、論文の公表された表も、印刷された最後の桁の半分の範囲で再現しますが、その表自体が同じ閉形式から再構成されたものであるため、これは再現性の検査であり、外部のオラクルではなく、照合の基準にしたフレーム項はモデル計算による配分です

seg-ff32b78acb8c = 共通の行集合にわたる UT1 と極運動の合算誤差

seg-561e588153af = 一つの表が、地平線ごとに同一のエポック集合にわたる、月での UT1 予測誤差、極運動の極誤差、およびそれらの二乗和平方根による合成を報告し、各成分を測定したエポックも出力します。これとは別に、シナリオは有効な EOP 入力に名前を付けてその行の集計を分解し、予測と確定の地平線の表を常に出力します。表が空の場合は、その理由を明示的に述べます

seg-093191c1ddce = astropy { "8.0.1" } utils.iers（BSD-3）は IERS finals2000A の成果物を独自の Bulletin-B 優先、なければ A の規則で読み込み、pyerfa { "2.0.1.5" }（SOFA）は完全な天球から地球への回転（c2i06a、sp00、pom00、c2tcio；IERS { "2010" } 式 { "5.15" } による地球自転角を厳密な演算で）を実行します。どちらも別のプログラムとして、固定した 2026-09-30 の finals2000A.all の原文どおりの行に対して動かしました。事前登録（455b8fb5）で、オラクルの数値精度だけを固定する修正 A1 と A2 を加えています（どちらも、その後に続いた実行とともに開示）：表 { "3" } のすべてのエポックリストが一致し、UT1 と極の統計量は { "6e-16" } 以内、合成は { "1.9e-7" } 以内、予測と確定の 12/12 のケースが一致します。合成の検査では、UT1 が支配的なため、相対で約 { "1e-4" } 未満の極の項の誤差を判別できません。極の精度は { "1e-9" } の極の統計量の検査に拠ります。エポック集合とフォールバックの規則は、Kshana の定義を映した生成器であり、空の表のステータスは外部の真値がない設計上の挙動です。大きさ：IERS Annual Report { "2019" } 表 3a の実現した予測誤差、Kshana/IERS は { "1" } から { "90" } 日で { "1.001" } から { "1.100" }（基準 [{ "0.8" }、{ "1.25" }]、実測）。行の集計：astropy（オフライン入力の行）。ラウンド { "1" }（回帰テストとして維持）：{ "178" } 件の Bulletin A の発行に印刷された精度の式に対して、極は 1.5x 以内で一致し UT1 は一致しません。これは IERS の式を、その実現した誤差に対して検証するものです

seg-3692f1fc89e6 = オフラインのデフォルトの地球姿勢入力は実際の IERS の成果物です

seg-f9a9d385fd26 = <c1/> のランタイムのデフォルトは、IERS finals2000A の原文どおりの抜粋をライブラリ自身が埋め込んだ複製です（tools/finals2000A_20260930.txt：連続する日次の { "174" } 行、MJD 61224-61397、2026-09-30 の finals2000A.all から切り出し）。形式が定める三種類の行の版をすべて含み、IERS の I/P フラグ（eop::row_vintage）で分類されます：{ "30" } 行の Bulletin B 確定値、{ "54" } 行の速報の実測値（Bulletin B ブロックのないフラグ I）、{ "90" } 行の Bulletin A 予測値（フラグ P）。ファイル引数もネットワークもない素の実行は、母数の入った地平線ごとの表を出力し、集計は rows = final_rows + rapid_rows + prediction_rows（{ "174" } = { "30" } + { "54" } + { "90" }）、MJD 61308-61397 にわたって predicted_rows.n = { "90" } となります。予測と確定の比較の発行時点の打ち切りは、最後の実測行です。以前の 32 行の抜粋（tools/finals2000A_2026.txt、すべての行がフラグ I）と、五行の確定値のみの抜粋は引き続き同梱され、試験されています：それらでは predicted_rows.n は { "0" } であり、これは入力ファイルの性質であって、パーサーの結果ではありません

seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A（BSD-3-Clause）が独自のリーダーで同じバイト列を読み、IERS Bulletin A Vol. XXXIX No. { "039" } の表と数値を一つずつ照合しました。astropy を実行する前に六つの厳密な基準を事前登録しました（6fdae01b）。六つすべてが成立します：MJD リストが一致する確定 { "30" } 行、速報 { "54" } 行、予測 { "90" } 行、すべての予測行がフラグ P、デフォルト実行の集計が一致、予測が Bulletin A と印刷された最後の桁の範囲で一致。開示：切り出しは、コミット前に、フラグと Bulletin B ブロックを単純な列スライスで見て 30/54/90 と示されたことで選びました。抜粋は、このリポジトリが IERS の成果物から切り出した原文どおりのスライスです（SHA-256 はフィクスチャの NOTICE に記載）。検証した主張は、同梱のデフォルト入力の版の分類と集計およびその予測行であり、任意のユーザー入力は同じフラグ規則で分類されますが、比較の対象ではありません。{ "0.30" } ラウンド { "1" }（置き換え済み）：以前のデフォルトは { "12" } 行のフラグ I を Bulletin A の予測値としていましたが、エンジンはフラグで分類するようになりました。改訂：動いたデフォルト実行のセルは、docs/revisions/M035-default-eop-recut-cell-changes.md に旧から新の順で列挙しています（predicted_rows { "12" } -> { "90" }、極の下限 { "0.06776" } -> { "0.05550" } mas、地球姿勢の項 { "14.01601" } -> { "14.01583" } m、合計 { "20.09759" } -> { "20.09746" } m と { "67.03834" } -> { "67.03790" } ns、tests/golden/realtime-frame-eop.csv の表 { "2" } の行、運用予測器との一致の数値）。以前のものは docs/revisions/G12-default-eop-cell-changes.md にあります

seg-18c72a7565d6 = 高度とビーム幅に対するキャプチャのフットプリント

seg-9c30a0ab5233 = 送信機の高度とディッシュの直径にわたる、パターンで重み付けした、高度に制限された地表キャプチャのフットプリントの二軸の掃引。動作点ごとに一行を出力し、各直径が意味する半値ビーム幅を添えます。リムのキャプチャはしきい値として報告します — 行ごとにリムの J/S、そのマージン、それを成立させる送信電力、グリッドごとには位置を特定した交差、またはグリッドのどこでもリムに届かないという明示的な記述と不足分を示します

seg-4d866b62d4f7 = 集合の包含：ジャマーと信号の比は一様なデシベルのオフセットとして入るため、送信電力が高いときのキャプチャされた集合は低いときの集合を含み、割合は上がるだけです — Airy パターンは、ビーム幅や高度についてはこの性質を与えません。そこではキャプチャされる領域がリング状に分かれ、割合は本当に非単調になるためです。月周回の送信機のキャプチャされた円盤の割合を、高度とビーム幅に対して示した公表表はないため、これらのセルを照合できる外部のものはありません。その基礎にあるパターンは、公表されたベッセル関数の値に対して別途検証済みであり、独自の行を持ちます

seg-fc0a64b9a280 = 月の時刻誤差配分の再現性

seg-5d5970506b9c = 月の時刻配分シナリオは、配列値の出力を、レポートとともに（グリッドの添字、平均化時間、項の）縦長形式の表として公開するため、七つの項ごとの x(tau) 曲線と二乗和平方根の合計は、読者が手法の節から組み立て直すものではなく、エンジンの出力です

seg-62df6258bc62 = 自己整合性のみ：公表された合計は、同じファイル内の各項の二乗和平方根と照合し、出力した曲線は、公開された p3_time_budget_curve.csv を { "57" } 点すべてで再現します。両方の検査はこのエンジン自身の項の定義を共有しているため、どちらも独立ではありません。クロック項は公表されたクロック仕様に基づいていますが、リンク、フレーム、相対論、エフェメリスの下限の大きさは、外部のオラクルがない、文書化された配分値です

seg-675887733454 = 月面局の時刻ラボ：miniRAFS のホールドオーバーと LTC

seg-7dfedc40da6a = lunar-time-budget シナリオの任意の [time_lab] ブロックは、月面の基準局クロック（デフォルトは miniRAFS クラス、または名前を指定した任意のクラス、あるいは指定した安定度の点に当てはめたデバイスカード）を協定月時刻にステアリングし、その後は自走させるか N 秒ごとに再ステアリングする状況をモデル化します。時刻誤差曲線 x(t) は、クロックのべき乗則の項、一定のステアリング残差（ILLUSTRATIVE）、一定の LTC 実現残差、任意選択の局の高さによるレート項の二乗和平方根です。ステアリング後に { "1" }、{ "10" }、{ "100" } ns（または指定したしきい値）に達するまでの時間を二分法で求め、支配的なノイズ種別の閉形式の逆算と並べ、指定した各地平線での支配的な項を、すべて単位付きで示します

seg-af3ff120b707 = 月の測地 VLBI

seg-cfd7d0126028 = 月のビーコンを観測する地球基線の近傍場 VLBI 遅延と偏微分

seg-d1943f9932af = 遠方場の極限での平面波 delta_dor（同一コードベース）；有限差分の偏微分。{ "0.30" } 外部比較、知見（MODELLED のまま）：DE440 を通した ANISE { "0.10" } の収束した光行時間（2024-01-01 の { "75" } 件の遅延、三つの DSN 基線、Kshana のコードを使わない xval/anise-lunar-od で生成）に対して、{ "1" } ps の許容差内にある遅延はありません。最大の差は { "24" } µs で、その原因は、解析的な月の中心（DE440 から約 { "200" } km）、光行時間の反復を行わない単一の瞬時幾何（{ "3.6" } µs）、省略した極運動です。ビーコンの偏微分は、相対 { "1e-6" } に対して最大 { "2.9e-3" } 異なります。フレームの近似がモデルの忠実度を下回るというモジュールドキュメントの主張は、この水準では成り立ちません。{ "0.30" } ラウンド { "2" }：カーネル経路（lunar_vlbi::KernelGeometry）は、独自の行 Lunar geodetic VLBI, kernel path で NAIF SPICE の光行時間に対して検証されています。その経路の ANISE との比較（75/75 が { "1" } ps 以内、最悪 { "0.12" } ps、tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference）は、そのハーネスでの光行時間の解がこのプロジェクト自身のものであるため、カーネル評価の相互検査にすぎません。この行（解析的なデフォルト経路）は、上の知見とともに MODELLED のままです

seg-d12d4565b01d = 月の測地 VLBI、カーネル経路

seg-11e1c942e41c = カーネル経路（lunar_vlbi::KernelGeometry）での、月のビーコンを観測する地球基線の近傍場 VLBI 遅延と、ビーコンと局の偏微分：DE440 の地球と月、DE440 の月の主軸、UT1 と極運動を含む ITRF93 の地球姿勢、重心系で収束させたそれぞれの光行時間、光行時間係数 1/(c - u.V) による偏微分。planetary_kernel_path、earth_orientation_kernel_path、moon_orientation_kernel_path を設定した <c1/> シナリオとして実行できます。検証した出力は、カーネル経路の geometric_delay_s 系列と epoch_partials です。カーネル経路では delay_s に、比較していない解析的な差分シャピロ項が加わり、delay_rate と near_field_correction_us も比較していません

seg-c7f6842b6019 = NAIF SPICE Toolkit N0067（spiceypy { "8.2.0" }、MIT）による収束したニュートン光行時間（spkcpt/spkcpo、CN）。MOON_PA_DE440 に固定したビーコンから、NAIF の局カーネル earthstns_itrf93_260814.bsp の DSN 局 DSS-14、DSS-43、DSS-63 まで、de440s、moon_pa_de440_200625、moon_de440_250416.tf、earth_latest_high_prec、naif0012 を用いて求めます。偏微分は SPICE の光行時間の五点中心差分であり、Kshana の 1/(c - u.V) の式ではありません。事前登録しました（a689c797、{ "2024" } のエポック）。基準は、すべての遅延で { "1" } ps、すべての偏微分で相対 { "1e-6" } です。その最初の実行は失敗しました（遅延の 17/75 が { "1" } ps 以内、最悪 { "1.03e-11" } s）：SPICE は ET を一つの倍精度で保持し、{ "2024" } 年付近のその間隔により放射エポックが最大 { "6e-8" } s、光行時間で約 { "6" } ps 丸められ、残差はその丸めと相関 { "0.99999" } で一致します（固定；査読者が独立に再現）。修正 66e365d4 は、その結果の後、フィクスチャが存在する前に書かれ、同じオラクルと基準を J2000 付近の { "25" } 個の毎時のエポックに移しました。そこでは ET の間隔は最大 { "1.5e-11" } s です：75/75 の遅延が { "1" } ps 以内（最悪 { "6.2e-14" } s）、75/75 のビーコンの偏微分（最悪 { "7.4e-9" }）、150/150 の局の偏微分（最悪 { "3.8e-11" }）。主張の範囲外：解析的なデフォルト経路（級数の月と平均月面座標系、DE440 を通した ANISE から { "24" } µs、Lunar geodetic VLBI の行）、シナリオが解析的に加える差分シャピロ項、媒質、重心系から地心系へのスケール

seg-1f10810131be = NAIF カーネルリーダー：DAF コンテナ、SPK タイプ { "2" }、バイナリ PCK タイプ { "2" }

seg-7da4847e7a28 = エンジン自身の純 Rust による NAIF バイナリカーネルのリーダー（naif_kernel）：DAF コンテナ（両方のバイト順、リンクされたサマリーレコード）、中心を通じて最下位の共通の祖先までつなげた SPK タイプ 2 のチェビシェフ位置セグメント、J2000 から天体への回転にしたバイナリ PCK タイプ 2 のオイラー角セグメント。エポックは二部構成の ET として扱うため、マイクロ秒未満のオフセットも精度を保ちます。これは、KernelEphemeris（ephem_provider）と、lunar_vlbi、lunar_llr、lunar_vlbi_fim のカーネル経路が DE440 を読み込むための仕組みです。主張は、JPL のカーネルを正しく読めることであり、DE440 やエンジンの解析的な太陽と月の級数が正確であるという主張ではありません

seg-e08e98908f3a = 月までの距離での Earth-GNSS

seg-dd8ce373d1f6 = 月までの距離での Earth-GNSS の受信：P7 の表 { "1" } が名指しし、エンジンにモデルがなかった微弱信号の層です。衛星ごと、エポックごとに、送信機のナディアに対するオフボアサイト角、地球が直線経路を遮蔽するかどうか、スラントレンジとその自由空間損失、その角度での送信利得、受信電力、搬送波対雑音密度を計算します。そのうえで、追尾しきい値を満たすリンクだけを集計し、コンステレーションの一周回全体を掃引するため、答えは一つのスナップショットではなく分布になります。結果を決めるのは三つの事実であり、レポートはそれぞれを明記します：地球はコンステレーションの半径から { "13.90" } 度を張るため、ビームのピークは月へ向かうどの電波線にも幾何的に利用できません。残るのはメインローブの縁とサイドローブであり、これは LuGRE が { "2025" } 年に月で運用した領域です。そして L1 の経路損失は約 { "208" } dB で、地上のユーザーが負担するより約 { "25" } dB 大きくなります。同梱の 24 衛星の GPS クラスの幾何で、一軌道周期にわたる { "64" } エポックについて実測した値：信号の可用性は { "0.375" }、最良のリンクは { "30.93" } dB-Hz、測位解の可用性は { "0.000" } です — 同時に追尾可能なリンクは最大で二つで、測位に必要な四つには決して届きません。この二つの可用性の分離こそが要点であり、レポートはそれらが混同されることを許しません：月までの距離での Earth-GNSS はタイミング級の層であり、測位級の層ではなく、階層化レジリエンスの事前分布は測位解の可用性を使わなければなりません。コンディショニングを出力するのも同じ理由からです — 見えているすべての衛星は、月から見て数度の幅の円錐の内側にあるため、視線は構造上ほぼ平行です。<c1/> の種別として実行できます。D7 に従って言い直しました：月までの距離での主張は、実測した二次元の送信パターン（NAVCEN Block IIR/IIR-M）に基づく、一つのエポックでの衛星間の相対的な搬送波対雑音密度と、幾何的な可視性であり、絶対的な C/N0 は主張しません（Parker らは共通の { "7" } から { "12" } dB の損失を報告しています）

seg-bed2679f88e5 = 閉形式の恒等式と内部整合性；外部のオラクルは主張しません。限界の半角は asin(R_earth/r_orbit) と照合し、幾何もそれと照合しています。これが合成する自由空間損失、DOP カーネル、SGP4 伝搬は、それぞれ独自の行で外部検証されており、この行はそれらの区分を借りません。MODELLED である理由は送信パターンです：その角度での利得は、一様に照射された円形開口、すなわち Airy パターンですが、実際の GPS L1 アンテナは、地球の円盤全体で電力を均すためにメインローブをオフボアサイトにずらして整形した十二素子のヘリカルアレイで、サイドローブも Airy ではありません。公表された実測パターンは存在しますが、ここには同梱していないため、順序と桁は成立しても、個々の衛星の dB は成立しません。この行の最初の実装は、記録に値する形で誤っていました：Airy の式は前方の半球でのみ有効で、その引数は sin(theta) に比例するため、theta が { "180" } 度付近では折り返して、開口の背後で全ボアサイト利得を返します。そのため、最初のレポートで最も強い二つのリンクは、アンテナを月とは反対に向けた衛星であり、しきい値を満たしたのはその二つだけでした。開口の背後では、モデルは今では平坦なバックローブの下限を適用しており、作り上げたパターン形状ではなく、境界として明記しています。意図的に含めていないものは、いずれもバジェットを楽観的にします：リムをかすめる電波線の電離圏・対流圏の損失、偏波損失、ポインティング損失、実装損失はなく、屈折による拡張のない球形の地球を使います。月の位置はエフェメリスの参照ではなく入力です。試験しているのはリンクとビームの幾何だからです。この行を検証済みに引き上げるには、照合先となる実測の送信パターンと LuGRE の標準点が必要です。どちらもリポジトリにはなく、ここで作り上げてもいません。{ "0.30" } ラウンド { "2" }、知見（MODELLED のまま）：実測入力に基づくリンク経路（実際の SP3 位置、ブロックごとの送信電力、表にした送受信パターン、捕捉と追尾のヒステリシス）を、{ "6000" } km での GENESIS についての Montenbruck ら { "2023" } の表 { "3" } と照合しました（事前登録 5b414f0a）：天頂アンテナの平均は { "6" } 件中 { "5" } 件で、論文の感度の一 dB 以内に一致します。ナディアアンテナの平均は、印刷された値より { "1.0" } から { "2.4" } 機多くなっており、論文が公表されていない方位依存の GPS サイドローブパターンを使ったためと考えられます。この行の月までの距離の数値は、依然として Airy の代用を使っています。{ "0.30" }+ D7、知見（MODELLED のまま）：言い直した量、すなわち一つのエポックで追尾した Block IIR/IIR-M 衛星間の C/N0 の差を、NAVCEN の SVN ごとの実測 L1 パターン（二次元、ヨーステアリング座標系）で予測し、LuGRE の飛行 C/N0 と比べる検証（事前登録 768cb62b：{ "99" } % が可視、組の RMS <= { "3.0" } dB、中央値 <= { "2.0" } dB、記録は少なくとも { "50" } 件、組は { "30" } 組）は、データが少なすぎます：条件を満たす { "26" } 個の遷移・月周回のエポックには、追尾された IIR/IIR-M の記録が { "15" } 件しかなく（追尾されるのは主に IIF と III）、組は一つだけです。{ "15" } 件すべてが可視と予測され、その一組の残差は -0.06 dB です。何も主張しません

seg-29df5b40a3f9 = 月軌道決定：Earth-GNSS と地上の電波計測の比較

seg-647902ebcee3 = 近直線ハロー軌道（または楕円の凍結軌道）での軌道決定を、二つの独立なデータ種別から行います：搭載で受信した Earth-GNSS の擬似距離（Earth-GNSS-at-lunar-distance の行のリンク規則に、月による掩蔽を加えたもの）と、三つの Deep Space Network 局からの地上の双方向の距離と距離変化率です。それぞれ、基準軌道まわりの一段階のバッチ最小二乗法で、形式的な共分散を持ちます。二つの推定値の差のシード付きモンテカルロにより、二つの共分散がその差を説明できるか（q = d' (P_G + P_R)^-1 d、モデルが一致する場合は自由度六のカイ二乗）と、モデル化していない加速度がこの統計量に何をもたらすかを検定します。

seg-226dedaba243 = 独立した scipy/numpy のプログラムが、同じ変分方程式を積分します（基準 O1）。月軌道の測定との比較はありません。オラクルが検査するのは、明記した式の数値計算であり、物理ではないため、この行は MODELLED のままです。制限三体モデル：太陽なし、月の調和係数なし、地球の自転軸は軌道の法線方向、受信機と局の入力はILLUSTRATIVEです。

seg-652bdc29deea = 月の搬送波位相アンビギュイティ解決：月面と周回機

seg-02496f9e9af2 = 月面局と周回機での、受信機間の一重差の Earth-GNSS 搬送波位相とコードで、エポックごとのクロック差を消去し、連続したパスごとに一つのアンビギュイティを持ち、最長のパスをゲージとします。フロートのアンビギュイティ共分散はシュール補元です。LAMBDA が整数を決定し、ブートストラップ率を、シード付きモンテカルロの整数最小二乗の成功率、およびフロート解と固定解の位置シグマと並べて報告します。見つかったとおりに報告：登録した { "12" } dBi では二重差の問題を構成できず（修正 { "1" } は、可用性の数のみを見た後に、デフォルトを { "25" } dBi に移しました）、{ "25" } dBi でも整数の固定は達成されません — 到達不能です（せいぜい数パーセント）。ただしフロート解は弧が長くなるほど改善します。

seg-8d8296752eb8 = 書き出した行（Q3）からの同じ正規方程式の独立した numpy による解と、総当たりの整数列挙（Q4）です。GNSS や月の搬送波位相の測定との比較はありません。MODELLED。

seg-11dd1bb8e4e1 = 月のフレームの共推定：月面局と周回機

seg-a38c8d95e6c9 = 地球の局から五つの反射器へのレーザー測距のみの場合と、周回機から月面局への測距を加えた場合の、七パラメーターの月フレームのデータムのフィッシャー情報：情報行列、ランク、クラメール・ラオのシグマ、月の識別可能性モジュールの縮退指標、シード付きのランダムな局集合。軌道は月の軸で既知として固定します（その誤差は周回機の距離シグマに含めます）。

seg-47d2afc53b3d = 順モデルの独立した numpy による有限差分（F2）です。実際の月フレームの解との比較はありません。この係数は、仮定した既知の軌道と { "1" } m の距離シグマを前提としています。MODELLED。

seg-862977c4bb01 = 宇宙結合のフレーム結合精度：同一場所の GNSS、VLBI、レーザー測距

seg-a9ae8e99f00d = 一機の宇宙機が三つすべてを搭載する場合の、GNSS、VLBI、レーザー測距のフレーム間の並進、スケール、回転のオフセットのクラメール・ラオ精度です。宇宙機の位置はエポックごとに消去し、事前分布を持つ九つのローカルタイのニュイサンスパラメーターを含み、ローカルタイの精度にわたって掃引します。共分散は平方根法で求めます（技術が完全に近いとき、正規方程式は桁を失うため）。

seg-b37ac7294112 = 位置の未知数を明示的なシュール補元で消去した、独立した numpy の積み重ね系（T3）です。GRASP、Genesis、その他のミッションのデータとの比較はありません。MODELLED。

seg-ae627996875e = 月のラブ数と秤動の感度

seg-180d74388339 = 独立した numpy による有限差分の組み立て（G2）と閉形式の評価（G4）です。周回機ファミリーの k2 感度は上限側の数値です（ここでは軌道状態が定数とトレンドだけを吸収します）。月の潮汐や秤動の測定との比較はありません。k2 は Lemoine ら { "2014" } から公称値として引用しています。MODELLED。

seg-da712b740519 = 月面ビーコンによる DOP の補強

seg-83e6341e01b1 = 月面ユーザーに対するビーコンで補強した精度低下率：可視衛星の視線行と可視の月面ビーコンの測距行を一つの設計行列に連結し、共有の DOP カーネルで評価します。得られた DOP は、クロック同期、マルチパス、測量の項の二乗和平方根として組み立てたビーコンごとのユーザー等価測距誤差を通して、メートル単位の実現 1 シグマ精度に対応づけます。ビーコンの可視性は、大気のない月の二つの高さによる幾何学的な地平線であり、屈折による拡張がないため、近似ではなく正確です。<c1/> シナリオ種別として実行でき、衛星のみ、衛星とビーコン、そして同じ幾何への競合する経路としてのより大きなコンステレーションを報告します。同梱のゴールデン幾何で実測した値（ユーザーは -80 度、測量した三つのビーコン、t={ "0" } の六衛星の例示用 LCNS、{ "5" } 度のマスク）：可視衛星 { "5" } 機で PDOP { "9.6941" }、3-D の 1 シグマは { "11.222" } m。実際に地平線を越えるビーコンを加えると PDOP { "4.1160" }、{ "4.765" } m で、係数は { "2.355" } です。24 衛星のサービスでは代わりに PDOP { "2.4226" }、{ "2.804" } m で、係数は { "4.002" } です。レポートは、設定したビーコンの数ではなく可視のビーコンの数を出力し、この幾何では三つのビーコンのうち地平線を越えるのは一つだけです：両側の二か所の場所はユーザーから約 { "333" } km 離れており、{ "2" } m のアンテナの地平線は { "86" } km であるため、読者が三つすべてが寄与したと思い込むことはありません

seg-179fb996fc72 = DOP の計算は crate::orbit::dop カーネルであり、tests/dop_reference.rs で gnss_lib_py に対して別途外部検証されています。この行は、その行の区分を再び借りることはしません。ビーコンの可視性の地平線は L01 の閉形式で、sigma = DOP x sigma_URE は標準的な GNSS の関係です（Kaplan と Hegarty、Understanding GPS/GNSS、第 { "7" } 節）。この行の内部では、補強そのものを、リポジトリ内の独立した DOP 経路と照合し、コミット済みのゴールデンに固定しています。MODELLED である理由：コンステレーションの設計、ビーコンの配置、アンテナの高さ、三つの誤差バジェットの大きさのすべてが、運用中の測量や実測のリンクではなく例示用の入力であるため、報告されるメートルの値は、選んだシナリオの性質であって、配備されたいかなるサービスの性質でもありません。出所についての注記：この機能は README で宣伝され、二つの検証テストで試験されていましたが、マトリクスの行もシナリオ種別も持たなかったため、実行から到達することがそもそもできませんでした。文章では主張され、台帳にはなく、エンジンでは到達できないという状態が同時にありました。行と種別は一緒に追加しました。{ "0.30" } ラウンド { "2" }（事前登録 db0eb9ec）、ブロック（MODELLED のまま）：ANISE { "0.10.6" } の可視性と、その行の幾何に対する numpy の DOP は一致します（可視集合は、{ "72" } 件の地平線付近と { "48" } 件のマスク付近のケースを含めて厳密に一致；DOP は { "7.2e-13" } 以内）。ただし報告されるメートルの値は、DOP に例示用の { "1.158" } m の二乗和平方根の測距誤差を掛けたものでオラクルがなく、それを除外することになる範囲の設定は、担当者の判断を待っています

seg-b0b618abf402 = 同相成分によるインテグリティの盲点

seg-e732ac99a9ae = 測定誤差を、RAIM に見えない部分と見える部分に、パリティ部分空間で厳密に分割します。線形化したスナップショットモデル y = G·x + e では、任意の誤差 dy は、range(G) 内の盲点成分と、パリティ空間内の検出可能成分に一意に分解されます。盲点成分は状態誤差 S·dy として吸収され、残差射影行列 Pperp = I − G·S で消えるため、特定のしきい値だけでなく、どの残差検定にも見えません。モジュールは射影行列、分割、盲点の割合を返すので、呼び出し側は、特定の誤差のうちどれだけをスナップショットモニターが構造上報告できないかを定量化できます。実際のエフェメリス間の下限に適用しました：地心の月位置における、メートルレベルの DE440 と INPOP21a、および DE440 と EPM2021 の不一致は、ほぼ完全にユーザーの位置誤差として吸収されます（盲点の割合の中央値 { "1.000000" }；盲点の位置誤差の中央値 { "2.3955" } m と { "2.0050" } m）。これに対し、パリティ残差は { "1e-15" } m の水準です

seg-077303e9dd72 = P2：numpy linalg.lstsq（LAPACK gelsd SVD、BSD-3）が、コミット済みの入力に対して、実際のパリティ成分を持つ（dy = E·Δs + w、w ~ N({ "0" }、{ "1" } m)、シード { "20261001" }）最小二乗の分割を再計算します。8 衛星の幾何と 6 衛星の部分集合、二つの実際のエフェメリス間の組にわたる { "1464" } ケースで、事前登録しました（f672a314）：blind_dx、residual、blind_norm、detectable_norm は |dy| に対して相対 { "1e-12" } 以内、blind_fraction は絶対 { "1e-12" } 以内（最悪の blind_dx は { "1.06e-14" }、residual は { "4.4e-15" }、blind_fraction は { "3.1e-15" }）。numpy は G 自体をコミット済みの位置から組み立てる一方、エンジンは Gauss-Jordan による正規方程式を使います。斜交した左逆行列は、{ "5.5e-2" } |dy| でテストを失敗させます。修正 { "1" }（86c53301、最初の実行の後、開示済み）は、パリティの割合についての入力の前提条件（すべてのケースが少なくとも { "1e-3" }、各幾何の { "95" } % が少なくとも { "0.05" }）だけを緩和し、一致の基準は緩和していません。P2 が認めるとおりの検証した主張：それらの入力に対する分割の線形代数。エフェメリス間の下限の大きさと例示用の月の幾何（{ "5000" } km の { "8" } 個の LCNS 類似ノード）は入力であって、検証されておらず、盲点はあらゆるスナップショット RAIM が持つ既知の性質です。ラウンド 1 の numpy による比較（tests/lunar_common_mode_integrity_reference.rs）は、その入力が range(G) 内にあったため、恒等式 S·G = I だけを検査しており、回帰テストとして残しています。エフェメリスの出所：tests/fixtures/inter_ephemeris/NOTICE.md（JPL、IMCCE、IAA RAS）

seg-845e9f5eec81 = 同相成分の保護レベルとインテグリティの総合包絡

seg-ffc59a7ed497 = 射影行列の解析的な代数を自分自身と照合しました：range(G) に限定された共分散は正の CMPL を与えなければならず、パリティ空間に限定された共分散はほぼゼロを与えなければならず、包絡は測定空間で直交する二つの寄与を合計しなければなりません。同相成分の共分散、コンステレーションの幾何、k は、代表的なモデル計算の入力であり、認証された配分ではなく、三角不等式の上界が厳密だという主張はしていません。出所についての注記：cmpl_horizontal、blind_position_covariance、integrity_envelope は公開され出荷されており、その単体テストは同相成分の盲点の行ですでに引用されていましたが、包絡の主張自体には行がありませんでした。そのため、それを正直に保つ唯一の注意事項、すなわち合計は RSS ではなく三角不等式の上界であるという点は、台帳のどこにも記されていませんでした。この行は、主張と注意事項を一緒に登録します。

seg-5ed34a5b402e = 月の統合マルチテクニック OD + クロック

seg-5ace1caff5a9 = VLBI + 月面局所の距離 + 衛星間距離のバッチ融合により、局とコンステレーションの位置とクロックを復元します

seg-82824963aef7 = P2：numpy { "2.4.6" }（LAPACK gelsd を用いた numpy.linalg.lstsq、numpy.linalg.inv；BSD-3）が、六つのシミュレーションネットワークのコミット済みのヤコビアンと観測に対して、各ガウス・ニュートンのステップ、収束した重み付き最小二乗解、形式的なシグマ、局の誤差を再計算します。事前登録（5094bc31）の相対基準は max({ "1e-8" }、{ "100" } kappa eps) です。最初の実行は VLBI なしのネットワークで失敗しました（{ "1e-8" } に対して { "6.1e-7" }、条件数 { "1.4e5" } での正規方程式の逆行列）。その結果の後に書いたエンジンの修正（batch_ls::gauss_newton_qr、estimate と formal_covariance が使う Householder QR のステップ）を、基準を変えずに再実行しました：ステップは { "1.1e-14" } から { "2.4e-11" }、シグマは最大 { "1.3e-11" } です。検証した主張は、それらの入力に対する融合解の線形代数であり、シミュレーションネットワークの物理的な大きさやその観測モデルではありません：月の測地 VLBI 遅延の行は MODELLED のままです（その解析経路は ANISE と最大 { "24" } µs 異なります）。フレームには独自の行があります。注入したシミュレーションの真値の復元と NEES の整合性は内部の検査のままです。以前の Orekit { "12.2" } / Hipparchus の Levenberg-Marquardt による相互検査（tests/lunar_joint_multi_technique_od_reference.rs）は、estimate がもう呼び出さない batch_ls::gauss_newton を試験しており、その基本要素の検査として残しています。{ "0.30" } 改訂：デフォルトの lunar-joint-od-clock の局誤差は、VLBI ありで { "3.541344" } -> { "3.541350" } m、なしで { "2183.119" } -> { "2183.558" } m です（QR 解）。{ "0.36" } 改訂（STUDIO-15、移植可能な数学；docs/revisions/STUDIO15-portable-math-rebaseline.md）：VLBI ありで { "3.541350" } -> { "3.536885" } m、なしで { "2183.558" } -> { "2184.021" } m となり、VLBI なしの解は { "2" } 回ではなく { "5" } 回の反復で停止します（悪条件のネットワークでの、丸め誤差で制限された停止）。事前登録した比較は、再出力した入力に対して、基準を変えずに再実行しました（numpy { "2.4.6" }、六つすべてのネットワークが合格）

seg-69fbe488dec5 = フィッシャー情報量とクラメール・ラオ観測可能性

seg-043d4c7a2d6a = フィッシャー情報行列 M=HᵀWH、クラメール・ラオ下限、観測可能性のランク／データム欠損の零空間（ムーア・ペンローズ擬似逆行列）、および対称ヤコビ固有値解法から得られる D/A/E/T 最適の実験計画スカラー

seg-4035d9a23e64 = NumPy { "2.4.1" }（numpy.linalg.eigh / .inv；BSD-3-Clause、LAPACK ベース）。独立した第三者のオラクルであり、一意に定まる固有値、σ²(XᵀX)⁻¹ のクラメール・ラオ共分散、GNSS の DOP（精度低下率）係数を、Kshana の巡回ヤコビ掃引とスペクトル擬似逆行列とは別のアルゴリズム（LAPACK の分割統治法と LU 分解）で計算します。{ "1e-9" } まで一致しました。同じ種類の外部ライブラリは、すでに DOP エンジン（gnss_lib_py との比較）とχ²／erf カーネル（SciPy との比較）の検証にも使われています。加えて、Kay（{ "1993" }）の閉形式 CRLB およびモンテカルロでの CRLB 達成（内部）とも照合しています

seg-e4ec41d0f5e1 = 月面の絶対局位置の観測可能性（データム欠損）

seg-b3e4160042d2 = 月面の統合解のフィッシャー情報による観測可能性：地球基線がなければ、絶対座標系のデータムは HᵀWH の零空間にあり（局位置は観測不能）、基線が{ "3" }本以上あればフルランクに戻って局位置のクラメール・ラオ誤差が定まり、推定器はこれを達成します

seg-238597f6aa01 = 解析的なデータム欠損の構造：観測不能な絶対座標系のモードはフィッシャー情報の零空間にあり（閉形式）、ランクのしきい値は公表されている3局構成の設計根拠と一致し、推定器はモンテカルロで得られる CRLB を達成します。ただし月面の幾何は代表的なネットワークであり（実際に飛行した軌道暦ではありません）、この行は MODELLED のままです。基盤となる FIM/CRLB エンジンは、別途 Kay（{ "1993" }）の閉形式と照合しています。{ "0.30" } 第{ "2" }ラウンド（事前登録 fab02df9）、保留（MODELLED のまま）：NumPy/SciPy が、定めた { "1e-9" } のしきい値でのランクと欠損、零空間に占める局座標軸の割合（{ "8.4e-10" } 以内）、局の CRLB（{ "1.2e-10" } 以内）を、Kshana が生成してコミット済みの{ "17" }個の構成について再計算しました（P2）。昇格せず：推定器が下限を達成するという主張（モンテカルロ効率は約 { "0.98" }）にはオラクルがなく、MODELLED のままにするための範囲設定は所有者の判断待ちです

seg-ae4b71d54dfa = 点のネットワークからの7パラメーターヘルマート・データムフィットと ICRF 方位の結び付け

seg-9e434924b34c = 独立した閉形式の重み付きウメヤマ（ホーン）相似変換ソルバー（numpy/scipy の SVD ベース；Umeyama { "1991" } IEEE TPAMI、Horn { "1987" } JOSA A）。kshana の反復ガウス・ニュートンフィットとは異なるアルゴリズムで、バイト単位で同一の点ネットワークに対し、一意に定まる同じ重み付き最小二乗の最適解に到達します

seg-4bcec6e2dd9f = 月面ナビゲーションのサービスボリューム

seg-dba98ad5df1c = サービスボリュームにわたる Moonlight クラスの月面 DOP／カバレッジ／可用性、および一般化した月面 ARAIM 保護レベル

seg-7e981d90a806 = 独立した第三者のオラクルである ANISE { "0.10.2" } astro::Orbit のケプラー伝搬器（Nyx Space、MPL-2.0）。kshana のニュートン・ラフソン法によるケプラー方程式とは別の、春分点要素による二体問題のコード経路です。衛星ごとの MCI 位置は <{ "1e-3" } m 以内で一致し、導出した可視衛星数と可視衛星の組は、すべての格子点で完全に一致します。DOP カーネルは gnss_lib_py で検証済みで、インテグリティには公表されている LunaNet/LCNS のパラメーターを使います

seg-2ed7181c97dd = LunaNet AFS 拡散符号の生成（LSIS V1.0）

seg-13ff6c381275 = LSIS V1.0（{ "2025" }年1月{ "29" }日）の Augmented Forward Signal 符号：IS-GPS-800 の L1C パイロット構成と IS-GPS-800J のインデックスから生成した AFS-Q の10230チップのプライマリ符号（LSIS 付録 D に記載されている{ "210" }個の割り当てと同一）、g1 = x^{ "11" } + x^{ "2" } + { "1" } および g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } から生成した AFS-I の2046チップのゴールド符号（各 PRN の G2 遅延は規格の付属書{ "3" }ファイルから復元）、四種類のセカンダリ符号、1500チップのターシャリ符号、暫定の表{ "11" }のノード割り当て、階層化パイロット符号。LSIS の内容は、NASA がホストする PDF から作成した SHA-256 検証済みのローカルキャッシュから実行時に読み込み、再配布は行いません

seg-dc1dd144b107 = 参照：検証のために LSIS V1.0 が記載している値（表 C-1〜C-5、D-1〜D-6、E-1〜E-6）と、その付属書{ "3" }の電子符号ファイル。比較の前に定めた不一致ゼロの基準を用います。この基準は、規格自身の付属書{ "3" }ファイルと内部で矛盾する記載セル一つのために満たされなかったため、この行は MODELLED のままで、正誤表の覚え書きを起草済みです。同じチップは LANS-AFS-SIM のものとも一致します（行「チャネル状態を与えた場合の、独立したジェネレーターに対する LunaNet AFS ベースバンド生成」）

seg-ea20909686ea = チャネル状態を与えた場合の、独立したジェネレーターに対する LunaNet AFS ベースバンド生成（LSIS V1.0）

seg-c0f021c38842 = AFS ベースバンドの生成コア（LSIS-130：複素包絡線 I + jQ、I = AFS-I ゴールド符号に{ "1.023" } Mchip/s での{ "500" }シンボル/s のフレームを掛けたもの、Q = { "5.115" } Mchip/s の階層化 AFS-Q パイロット、搬送波回転、チップとシンボルの整列）は、独立したジェネレーター自身が記録したチャネル状態（符号位相と符号レート、搬送波位相と搬送波周波数、チャネルごとの振幅）で駆動すると、そのジェネレーターのサンプルを再現します。対象外：ドップラー、遅延、搬送波対雑音密度からその状態を導くノードモデル、搬送波対雑音密度から計算する50/50の電力配分（振幅はシミュレーターから取得）、および SigMF メタデータと8ビットサンプルの書き出し

seg-dd1142957a05 = ライブラリ：LANS-AFS-SIM（T. Ebinuma、BSD-2-Clause、コミット 480c6bf353717bafc04b5ee5bafb38ed90e61aae、S バンドビルド、別プログラムとして実行）。Kshana のサンプルはシミュレーターが記録したチャネル状態だけで駆動し、出力のみのトレースビルドが未修正のビルドとバイト単位で同一であることを確認しています。実行前に定めた合格基準：チップとシンボルの不一致ゼロ、実行全体で |rho| >= { "0.999" }、{ "2" } ms ブロックごとに >= { "0.99" }、位相は { "0.05" } rad 以内。I と Q の振幅を等しくすることは比較の入力であり、電力配分はこの比較では試験されません。LANS-AFS-SIM は、ターシャリ符号を LSIS 付録{ "3" }ファイルから読み込むため、その部分は符号の行から独立していません。LANS-AFS-SIM と PocketSDR-AFS は作者が同じで、独立した実装一つとして数えます。データ依存：LANS-AFS-SIM との比較にはローカルの LSIS V1.0 キャッシュ（xval/lunar-afs/fetch_lsis.sh、SHA-256 検証済み）が必要で、ない場合は通知を出してスキップします

seg-5d79da539912 = LunaNet AFS フレームのチャネル符号化、FID { "0" }（LSIS V1.0）

seg-6ed2b4c792e6 = LSIS V1.0 の{ "12" } s、6000シンボルの FID { "0" } フレーム：68シンボルの同期パターン、BCH（{ "51" }、{ "8" }）サブフレーム{ "1" }（八進数 763 の生成多項式）、サブフレーム2〜4の CRC-24（({ "1" } + X)·P(X)）、記載された A、B^-1、C、D を用いた符号化率1/2の LDPC 符号化（LSIS 付録{ "1" }、SHA-256 検証済みのローカルキャッシュから実行時に読み込み）と規格のパンクチャリング、{ "60" } x { "98" } のブロックインターリーバー。{ "0" }..99の範囲外の TOI を検出する網羅的なサブフレーム1デコーダーと、H = [[A, B, { "0" }], [C, D, I]] だけから書いた正規化 min-sum LDPC デコーダー

seg-46879e2e8ab5 = ライブラリ：LANS-AFS-SIM（T. Ebinuma、BSD-2-Clause、コミット 480c6bf353717bafc04b5ee5bafb38ed90e61aae）。同一の内容に対し、独自の BCH、CRC、LDPC、インターリーバーが Kshana とシンボル単位で同一のフレームを生成します（不一致ゼロ、基準は実行前に設定）。参照値による裏付け：LSIS V1.0 図{ "8" }の BCH の計算例と CRC-24/LTE-A のチェック値（Greg Cook によるパラメーター化 CRC アルゴリズムのカタログ）はどちらもビット単位で一致し、PocketSDR-AFS は、同期できたフレームのすべてのサブフレームを三回の実行でデコードして、CRC が通り、サブフレーム2のビットも一致しました。パリティ検査テストは内部の恒等式に近く（記載された B^-1 が記載された B の逆行列であることを確認するもの）、オラクルとは数えません。データ依存：LANS-AFS-SIM との比較にはローカルの LSIS V1.0 キャッシュ（xval/lunar-afs/fetch_lsis.sh、SHA-256 検証済み）が必要で、ない場合は通知を出してスキップします

seg-56c7aeac59c1 = 独立した受信機による LunaNet AFS のクローズドループ復号可能性（LSIS V1.0）

seg-da2d29d437b0 = Kshana の AFS 記録を、独立したソフトウェア受信機で捕捉、追尾、復号し、記録自身の真値ラベルと比較します。これが示すのは規格への適合性とラベルの整合性だけです。チャネル物理、伝搬、受信電力、リンクバジェットについて述べるものではなく、記録中のこれらの値は選択された入力です

seg-8211583afc64 = ライブラリ：PocketSDR-AFS（T. Ebinuma、T. Takasu の PocketSDR { "0.13" } に基づく、BSD-2-Clause、コミット 5b23809f30d68518b7fad7a564fd0fac57cc497d、S バンドビルド、出力のみのログレベルコピー）。基準は各実行の前に設定しました。事前登録した三回目の比較は、復号と追尾の基準 C1 と C2 を完全に満たしましたが、記載どおりのガード G0 は満たしませんでした（未修正の受信機の二回の実行で、同じ四件の捕捉記録が異なります）。また二回目は{ "5" }件の違反で基準に届かなかったため、この行は MODELLED のままです。LANS-AFS-SIM と PocketSDR-AFS は作者が同じで、独立した実装一つとして数えます。フレーム符号化の行の記載ベクトルの照合は、共通の読み違いに対する防護になっています

seg-780369fb9a54 = GPS L1 C/A のジェネレーター間適合性

seg-ee47b60515f1 = GPS L1 C/A 拡散符号（sdr::CaCode）と LNAV サブフレーム1〜3（gps_lnav：IS-GPS-200 のフィールド量子化と規格の pi、二の補数表現、TLM ワードと HOW ワード、D29*/D30* の反転を伴う表 20-XIV のパリティ、ワード{ "2" }と{ "10" }のパリティ解決ビット）を、同梱の brdc0010.22n（{ "32" }機の衛星）上で gps-sdr-sim とビット単位で比較

seg-39b0d6a58d29 = gps-sdr-sim（MIT、コミット 28ca29a6、コミット済みのハーネスを通して別プログラムとして実行）、事前登録 f88f2969、基準は (A) C/A チップ、(B) 計算したすべての LNAV フィールド、(C) すべてのパリティビットについてのビット単位の一致。所見：(A) { "32 736" } チップのうち{ "0" }が相違、(C) { "1 920" } ワードのうちパリティが相違するのは{ "0" }、(B) 計算したフィールド{ "1 152" }のうち{ "230" }が一単位だけ相違します。放送用の整数には丸めが必要なところで、gps-sdr-sim の eph2sbf が C のキャストによってゼロ方向への切り捨てを行うためです（相違する値はすべて、Kshana の丸めた整数から { "0.01" } 単位以内にあります）。MODELLED のまま：登録した基準は論理積でした

seg-325900ed59ea = 独立したベースバンドジェネレーターに対する GNSS IQ シーンの信号幾何

seg-ee5625b30ff2 = GPS L1 C/A の放送エフェメリスのシーンについて、IQ シーンジェネレーターが衛星ごとに持つ真値（iq::scene：放送エフェメリスの SatGeometry から TruthRecord の真値レコードとして生成）：どの衛星が地平線の上にあるか、疑似距離、最初のサンプルでの符号位相、搬送波ドップラー、視線角。静止受信機について、同じエフェメリス、受信機、開始時刻（両側とも電離圏なし）で gps-sdr-sim が自身の I/Q 出力の最初のブロックを作るもとになるチャネル状態と比較

seg-59c06411d647 = gps-sdr-sim（T. Ebinuma、MIT、コミット 28ca29a6）。独立した GPS L1 C/A ベースバンドジェネレーターで、専用の Makefile でビルドし、別プログラムとして、同梱の brdc0010.22n を使い、使用方法テキストの例の位置（scripts/gen_iq_gpssdrsim_ref.sh）で実行しています。同じビルドにリンクしたコミット済みのハーネスが、このプログラムの最初のブロックの背後にあるチャネル状態（computeRange、computeCodePhase）を出力します。基準はジェネレーターを実行する前に設定しました（事前登録 7777da53）。範囲：電離圏、対流圏、受信機クロックのない、静止受信機の GPS L1 C/A 幾何。シーンのチャネルモデル、雑音、航法データの内容はこの行の対象外です

seg-bf429c8f00fb = 独立に生成した I/Q サンプルでの GNSS IQ 捕捉

seg-9a0c52bfb06e = GpsL1Ca レプリカを用いた iq::acq::acquire（二乗則 Marcum-Q しきい値による FFT 並列符号位相探索）を、iq::io サンプルデコーダーで復号した gps-sdr-sim 自身の8ビット I/Q 出力の{ "20" } ms 分（ci8、{ "2.6" } MHz、{ "11" }機の衛星、雑音なし）に適用：PRN { "1" }〜{ "32" }のすべてを二つの{ "10" } ms ウィンドウで探索し、結果を gps-sdr-sim が変調した符号位相とドップラーと比較

seg-fb96290003e1 = gps-sdr-sim（MIT、コミット 28ca29a6）の I/Q サンプルとそのチャネル状態、事前登録 7777da53：(B1) シミュレートしたすべての PRN を捕捉、(B2) それ以外の PRN は捕捉しない、(B3) 符号位相は { "0.5" } チップ以内、(B4) ドップラーは { "125" } Hz 以内。所見：B1、B3、B4 は両方のウィンドウで成立しました（最大で { "0.195" } チップ、{ "72" } Hz）が、B2 は成立しません。gps-sdr-sim がシミュレートしなかった{ "21" }個の PRN すべてもしきい値を超えます（統計量は { "151" }〜{ "206" }、しきい値は { "79.5" }。シミュレートした PRN は { "1 300" } 以上）。しきい値は、測定したサンプル電力のガウス雑音に対して設定されています。gps-sdr-sim は雑音を加えないため、存在しない PRN のセルには他の衛星の相互相関が入ります。MODELLED のまま：登録した基準は論理積でした

seg-f40dc3dac990 = ラボリプレイキャンペーンで評価した IQ モニター：検出、見逃し、誤警報、および閉形式の誤警報の数値

seg-93fb3109728c = iq::campaign::detect とキャンペーンランナー：オプションの [monitors] テーブルにより、ランナーの一回の処理ですべてのセルで IQ モニターを実行します。電力モニターとスペクトルモニターは各フロントエンドチェーンを通った後のサンプルを見て、C/N0、SQM、ロックの各モニターは追尾チャネルごとのループ更新を見ます。各アラームは、定めたイベントに照らして評価されます：（イベント、アラーム種別、チャネル）ごとの検出または見逃し、検出までの時間、そしてイベント外での誤警報をその露出時間で割ったもの。各テストの閉形式の誤警報の数値も示します：ブロックごとの電力（厳密なガンマ分布の裾）、ブロックごとのスペクトル超過（近似）、尖度（片側ガウス）、パルス（二項分布の上限）、平均化した更新ごとの SQM（2Q(k) = Q(1/2, k^2/2)、新規）、C/N0 CUSUM の ARL0（Siegmund）。テーブルがない場合、セル、キー、ダイジェストは変わりません。干渉波形は合成しません

seg-4c4fff313585 = Kshana 自身の GPS L1 C/A シーン（雑音と正規の信号、衛星自身の信号の減衰イベント）に対する、モニター自身の閉形式。基準は docs/design/MONITORS-IN-CAMPAIGN.md（382ab2f4）に事前登録済みです。所見：M1、M2、M4 は基準を満たしました。M3 は検出（{ "18" } 件の減衰のうち{ "18" }件、P_md { "0" }）では基準を満たしましたが、タイミング条項は NOT MET です：検出までの時間の中央値は { "1.001" } s で、{ "2" } x ARL1 サンプル = { "0.433" } s に対して超過しています。CUSUM は { "1" } s のウィンドウごとに一つの推定値しか見ないため、サンプル数による上限は一サンプル未満になります。内部の整合性のみ：実在の受信機や記録された干渉は確認していません

seg-5b7eb7ddb474 = スコア付きラボリプレイキャンペーンによる IQ モニターの検出 ROC

seg-57fe85965c9c = iq::campaign::detect（windows、roc）と iq::campaign::report::rocs：モニター付きキャンペーンの各セルは、アラーム種別とチャネルごとに、モニター自身の検定統計量の最大値を、定めた各イベントウィンドウ（陽性）と、イベント外を敷き詰めた roc_window_s ウィンドウ（陰性）で保持します。統計量は、ブロック電力の乖離、PSD の超過、尖度 z、平均化した指標の SQM |z|、C/N0 CUSUM です。レポートはこれらを種別ごとにまとめて、AUC と設定しきい値での動作点を持つ、ウィンドウ単位の経験的 ROC とし、roc.json（kshana.campaign-roc/1）と report.html の検出 ROC セクションとして書き出します。モニターのないキャンペーンはどちらも書き出しません

seg-e882dd678998 = Kshana 自身の GPS L1 C/A シーン（衛星自身の信号の減衰）による合成キャンペーン。基準は docs/design/DETECTION-ROC.md（b47e358d）に事前登録済みです。所見：R2 は基準を満たしました（検出対象がないときは偶然水準）。R1 は NOT MET：cn0_drop の AUC は { "0.7855" } で、基準は { "0.95" } です。イベント後の陰性ウィンドウはすべて、検出から CUSUM の減衰を引き継ぐためです（イベント後の陰性{ "18" }件はすべて { "81" } 以上に達し、イベント前の{ "18" }件はすべて { "0" } のままです）。内部の整合性のみ：実在の受信機や記録された干渉は確認していません

seg-3a3cfa322f01 = オープン受信機の C/N0 モデルとロックモデルの IQ キャンペーン結果への較正（予測誤差を明示）

# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit（campaign、cn0、iqfit、iqreport）、<c2/> 上の <c1/>、Python の <c3/>、MCP の labfit ツール（作業ディレクトリ内のキャンペーンフォルダーのみ）：<c4/> の出力フォルダーを DIGEST で読み込み、スコア付きセルをフィット単位（信号 x ループ設計 x フロントエンドチェーン x ジャマー種別、プールしない）にまとめます。単位ごとに、測定した C/N0 を、定めた J/S に対してスペクトル分離の形でフィットします。ジャマーと信号の電力を独立に測定しなければ Q_eff は C/N0 データから同定できないため、Q は定めた値とし、フィットはしません（種別表の値、イベントの q、種別が不明な場合は定められた中で最も影響の大きい値、cw Q = { "1" }）。フィットするパラメーターは同定可能なオフセット delta_eff = delta - { "10" } log10 Q で、相関ガードが縮退を報告します。ロックが{ "90" } % 未満の C/N0 ビンは打ち切りとして一覧にします。しきい値 J/S は直接と閉形式の両方で求めます。追尾ループモデルと経験的ロックモデルは C/N0 モデルを通して結合し、脱落と再ロックのドウェルを含みます。記録にわたるシード付きクラスターブートストラップ（{ "1000" } 回の反復）がパーセンタイル区間を与え、{ "90" } % 予測区間は残差の抽出から得られます。一記録除外のホールドアウトは内挿と外挿に分け、事前登録した [validation] テーブルはハッシュ化し、各基準を PASS/FAIL で判定します。レポート kshana.labfit-iq/1 は JSON、CSV、生成した Markdown で、単位ごとのブロック付きです。合成のみ（第三者の記録もジャマー波形もなし）。受信機ログの labfit 経路は変更ありません

seg-f9abecb1eea6 = Kshana 自身の GPS L1 C/A シーンで、節{ "3.1" }の式から既知の C/N0 プロファイルを与え、kshana iq campaign で追尾して評価する合成パラメーター回復。基準は docs/design/LABFIT-FROM-IQ.md（節{ "5.1" }、2026-10-12 に b7117bf で改訂、節{ "13" }）に事前登録済みです。キャンペーンの C/N0 推定器（M2M4）は、開示した診断用の追尾実行を一回行った後、最初の基準評価の前にプッシュした 5b13e3c2 で固定しました（フィットのコードと一緒にコミットしており、単独ではありません）。18イベントの基準キャンペーンでの所見：(c) PASS、(a') NOT MET、delta_eff の誤差は -1.097 dB で基準は { "0.5" } dB（{ "38" } dB-Hz 以上のビンでも -0.89 dB）、(b') NOT MET、{ "50" }キャンペーン中{ "0" }件が真値を区間に含みます（誤差 -1.189 +/- { "0.093" } dB、区間は約 { "0.3" } dB）、(d) NOT MET、閉形式は喪失時の直接 J/S より { "2.20" } dB 低く、これはフィットした脱落ドウェルにランプ速度を掛けた値（{ "2.09" } dB）にほぼ相当します。(a) と (b) の元の Q の条項は、Q が同定できないため NOT MET です。追跡（基準は 1e532f84、docs/design/evidence/labfit-followup/RESULTS.md に事前登録）：ステップ J/S キャンペーンでは delta_eff が +{ "0.185" } dB 以内で回復し（S1 MET：ランプ誤差は推定器の遅れです）、記載どおりの (d) は追尾ループモデル（{ "0.45" } dB）では基準を満たしましたが、経験モデル（{ "6.42" } dB）では満たさないため、S2 は NOT MET です。新しいランプキャンペーンでは、フィットした脱落ドウェルに各イベントのランプ速度を加えた (d) は両モデルとも { "1" } dB 以内となり（R1 MET）、記載どおりの (a') と (d) は再び基準に届きませんでした（-1.25 dB；{ "2.32" } dB と { "9.47" } dB）。確認されたのは手法であり、特定の受信機ではありません。合成データから VALIDATED にすることはできません

seg-9537d301c95e = 独立した受信機ライブラリによる GPS LNAV 符号化の復号

seg-909415621881 = brdc0010.22n の{ "32" }個のエフェメリスについて、Kshana の LNAV サブフレーム1〜3（gps_lnav::encode_subframes）を RTKLIB の decode_word と decode_frame に入力：全ワードのパリティ、データ発行番号が整合したサブフレームの復号、および復号した全パラメーターを Kshana の整数と入力値の両方と照合

seg-9b21219e9572 = RTKLIB v2.4.2-p13（BSD-2-Clause、コミット 71db0ffa）の decode_word/decode_frame を別プログラムとして実行、事前登録 ca5f0142：R1 パリティと復号、R2 復号値が Kshana の整数に IS-GPS-200 のスケールを掛けた値と相対誤差 { "2" }^-52 以内で等しいこと、R3 入力値と量子化幅の半分以内で一致すること。所見：R1 は{ "960" }ワード中{ "960" }、{ "96" }サブフレーム中{ "96" }で成立。R3 はすべてのパラメーター、週番号、基準時刻が一致。R2 は{ "41" }個の値（af1、delta-n、IDOT）で、最下位桁の{ "1" }〜{ "4" }単位分だけ不一致でした。RTKLIB の P2_43 が十進数の { "1.136868377216160E-13" } で、{ "2" }^-43 から相対で { "2.6e-16" } ずれているためです。RTKLIB の定数で割ると、いずれの場合も Kshana の整数に一致します。MODELLED のまま：登録した R2 の基準は、オラクル自身の定数に対して厳しすぎました

seg-f66855e35c53 = GPS LNAV 航法メッセージの符号化

seg-8caf8366e2f8 = IS-GPS-200 LNAV サブフレーム1〜3（gps_lnav::encode_subframes：すべての時計パラメーターと軌道パラメーターを、規格のスケール係数と pi の値で最近接への丸めにより量子化、二の補数表現、TLM ワードと HOW ワード、D29*/D30* の反転を伴う表 20-XIV のパリティ、ワード{ "2" }と{ "10" }のパリティ解決ビット）。GPS L1 C/A 信号ジェネレーターが送信するメッセージです

seg-2b71b166b9d5 = IGS の日次放送ファイル BRDC00IGS_R_20250610000_01D_MN.rnx を RTKLIB v2.4.2-p13（BSD-2-Clause、コミット 71db0ffa）の readrnx で解析し、Kshana のワードを decode_word/decode_frame で復号する比較を、別プログラムとして実行。ファイルを取得する前に d4d9eb9d を事前登録し、基準は整数の完全一致です。ミューテーション：丸めの代わりに切り捨てると{ "235" }件の失敗が出ます。同じエンコーダーの以前の比較は所見として記録しています：切り捨てを行う gps-sdr-sim との比較（{ "230" }フィールド）、および RTKLIB のスケール済みの値との比較で、その十進数の { "2" }^-43 定数が一 ulp の基準を満たしませんでした（{ "41" }個の値）。インテグレーターによる事後検証（MODELLED のまま）：比較は一致し、パリティを設定するミューテーションでも不合格になりますが、事前登録 d4d9eb9d が公開ブランチに届いたのは UTC の { "20" }:{ "02" }:{ "29" } で、このファイルに対する RTKLIB の出力をすでに含む結果コミット 1783f904（UTC の { "20" }:{ "02" }:{ "27" }）の二秒後だったため、「ファイルを取得する前に登録した」という順序は示せません。未確認の放送ファイルを取得する前にプッシュした新しい登録で、この点は決着します

seg-c5c944357643 = 実際の月面 IQ での捕捉と C/N0 推定

seg-f5dcb5e06bf4 = 並列符号位相探索（acquisition::pcps_acquire：可搬な FFT、コヒーレント畳み込み、ノンコヒーレント積算、探索全体の誤警報確率に対するカイ二乗しきい値）、精密化、符号ドップラー付きのオープンループ・プロンプト相関、M2M4 C/N0 推定器を、realdata::ion_sdr 経由で読み込んだ LuGRE L1 の4ビット IQ バッチに対して実行

seg-c53c795135d6 = GNSS-SDR { "0.0.19" }（GPL-3.0、別プログラム、固定した設定）を、表面以外の九つの L1 バッチと飛行受信機の RAW C/N0（LuGRE ミッションデータ、Zenodo { "16411687" }、CC BY { "4.0" }）に適用、事前登録 768cb62b。所見：Kshana のリーダーは、比較した{ "288" }区間のすべてを独立したコンバーターと同一に復号します。GNSS-SDR は{ "288" }件の探索のうち{ "266" }件を陽性と判定し、Kshana は{ "266" }件すべての判定で一致しますが、GNSS-SDR のセルで位置が一致するのは{ "250" }件だけです（A2 は不成立）。C/N0 の項目は空です。どのバッチからも { "30" } s 以内に飛行 RAW エポックがありません（最も近いもので { "141" } s）。陽性の大半はアーティファクトです：素の二の補数のレベルは I と Q に -0.5 の平均を持ち、{ "1" } kHz ビンで雑音より { "32" } dB 高い零周波数のラインがあり、両方の受信機がこれを捕捉します。二つのバッチ（OP5、OP12）は誤って除外されました。数字を除去したメタデータの読み取りを、ヘッダーとの矛盾と取り違えたためで、実際の原因はリーダーがワードより幅の広いサンプルを読めなかったことです（修正済み）。MODELLED のまま

seg-709626569a5c = 軌道予測ドップラーに対する、実際の月面 IQ での捕捉（サンプル電力による判定）

seg-784ebd80c425 = mid-rise レベルの、表面以外の LuGRE L1 バッチ九つに対して、サンプル電力による判定を用いた acquisition::pcps_acquire：捕捉した衛星間のドップラー差を、ESA の最終軌道と Firefly が再構成した Blue Ghost の軌跡から予測した差と比較

seg-38b8127db267 = ESA/ESOC の最終軌道と NAIF の CLPS 再構成軌跡から予測したドップラー（xval/lugre-predicted-doppler/predict.py、Kshana から独立）、事前登録 0d1839d2。所見：{ "288" }件の探索すべてが雑音でしきい値を超え（サンプル電力の統計量は約 { "430" }〜{ "520" }、しきい値は { "346.3" }）、そのため P1 は自明に成立し、P3 も成立します（{ "288" }件中{ "274" }件が可視と予測）が、P2 は{ "4036" }組中{ "4033" }組で不成立です。帯域制限されたフロントエンドは、すべてのセルの雑音を約 { "1.46" } 倍に引き上げますが（固定：OP2 PRN { "1" } で雑音フロアは { "292" }、白色雑音では { "200" }）、サンプル電力の統計量はこれを捉えません。MODELLED のまま

seg-89875d67b253 = 軌道予測ドップラーで評価した、実際の月面 IQ での捕捉

seg-956bcfeaf319 = mid-rise レベルの、表面以外の LuGRE L1 バッチ九つに対して、セル平均による判定（格子の平均セルに対するピーク、帯域制限雑音に頑健）を用いた acquisition::pcps_acquire：捕捉した衛星間のドップラー差を、ESA の最終軌道と Firefly が再構成した Blue Ghost の軌跡から予測した差と比較

seg-f80a751bc49b = ESA/ESOC の最終軌道と NAIF の CLPS 再構成軌跡から予測したドップラー（xval/lugre-predicted-doppler/predict.py、Kshana から独立）、事前登録 a81a9a4e。所見：P1 と P3 は成立します（{ "4" }バッチ、{ "12" }件中{ "12" }件の捕捉が可視と予測）が、P2 は{ "8" }組中{ "8" }組で不成立です。最も強い二組は、符号が逆のまま大きさが予測と一致します（OP2 PRN 18/24：測定 +{ "7670.0" } Hz、予測 -7693.9、OP17 PRN 11/30：+{ "11155.0" }、-11114.4）。そのため、登録した「I が下位ニブル」という順序はバッチの共役にあたります。しきい値をわずかに超えた六件の検出は、どちらの符号とも一致しません。精密化のドップラーのばらつき（二回の実行間で { "30" }〜{ "50" } Hz）も、登録では過小評価されていました。MODELLED のまま

seg-8fa779dd1788 = 軌道予測ドップラーに対する、ホールドアウトした実際の月面 IQ での捕捉

seg-484868771231 = 月面で記録された LuGRE L1 バッチ（I が上位ニブル、mid-rise レベル）に対して、セル平均による判定（誤警報確率 { "1e-7" }）と refine_doppler_coherent を用いた acquisition::pcps_acquire：捕捉した衛星間のドップラー差を、ESA の最終軌道と Firefly の着陸地点カーネルから予測した差と比較

seg-8bfd18bb6478 = ESA/ESOC の最終軌道と NAIF CLPS の Firefly 着陸地点カーネルから予測したドップラー（xval/lugre-predicted-doppler/predict_surface.py、Kshana から独立）、これまで開いたことのないバッチに対して事前登録 2108e6ff。所見：非空虚性が成立しません。二件の捕捉を含むバッチはありません。OP40 は除外しました（メタデータが存在しないファイルを指しています）。OP38、OP73、OP77_0、OP77_1 は何も捕捉せず、{ "1e-7" } で誤警報も示しません（上位の統計量は { "325" }〜{ "356" }、しきい値は { "385.9" }）。OP74 と OP76 は PRN { "31" } を、OP78_0 と OP78_1 は PRN { "12" } を、それぞれ単独で捕捉し、いずれも可視と予測されていました。MODELLED のまま。開示する逸脱：登録した { "10" } Hz のドップラー基準は、インテグレーターが求めた、すでに見たバッチのばらつきではなく、コヒーレント精密化の合成モンテカルロに基づいています。OP40 は、メタデータがデータセットに含まれないサンプルファイルを指していたため、実行前に除外しました

seg-758af035b3ce = 月面の通信・航法統合ジオメトリ

seg-11f861bdc6bf = 指定した月面地点（selenographic）での衛星ごとのトポセントリックな視線角（北から時計回りの方位角、仰角）と斜距離。衛星はその地点の月固定座標系で与えます（独立した参照と照合して確認済みの主張）。信号空間の測距精度はシナリオのパラメーターとして公開されているため、サービスボリュームの掃引では、ある固定のσでの合否ではなく、測距の要求値が得られます。このパラメーターは設計入力であり、独立した参照と照合して確認済みの主張の範囲外です

seg-eb721568afc7 = ANISE { "0.10.2" }（Nyx Space、MPL-2.0、xval/anise-service-geometry のツールとして実行、バイナリ lunar-look-angles-xval、Kshana のコードは呼び出しません）：ANISE 自身の方位角・仰角・距離ルーチン（azimuth_elevation_range_sez）を、緯度・経度・高度のコンストラクターで構築した地点（pck00011 の月、球 { "1737.4" } km）に適用し、衛星は moon_pa_de440_200625.bpc を通して MOON_PA_DE440 に回転させています。{ "8" }地点（指定の{ "4" }地点とそれ以外の{ "4" }地点、地平線の上と下）、{ "12" }エポック、{ "8" }機の衛星にわたる{ "768" }サンプルが、方位角と仰角で { "1e-6" } deg 以内、距離と地点位置で { "1" } mm 以内に一致しました（基準は比較の前に設定）。実測値は { "2.2e-12" } deg、{ "2.1e-13" } deg、{ "5.6e-9" } m です。主張：衛星をその地点の月固定座標系で与えた場合の、地点の配置と視線角。Kshana 自身の平均回転による月固定座標系の実現と測距精度パラメーターはこれに含まれません。閉形式の幾何ユニットテストは補助的な確認として残しています

seg-10af60b488b9 = NovaMoon クラスの差分基準局：同相成分の相殺、基線とともに増える残差、DGNSS 保護レベル

seg-96b2627b388a = 差分による誤差相殺の恒等式と、DO-229E の SBAS 保護レベルの仕組みの再利用。一重差分と WLS の解は、RTKLIB の lsq()/matinv()（Takasu、BSD-2-Clause、コンパイル済み C）とも追加で照合しています。ソルバーのコードは独立していますが、LOS 差分の代数は同じ一次の形なので、依然として InternalConsistency です

seg-c04a3591074c = 月面の相互運用エクスポート

seg-91f4a066b3c0 = ラウンドトリップ適合性を確認した、LunaNet/IOAG に整合する月面の座標系・時刻・エフェメリスのエクスポート（CCSDS OEM + KIF）

# c1: oem
seg-f5f8ed69bea7 = kshana の月面 OEM エクスポートを、独立した第三者の <c1/> ライブラリ（R. J. Anderson）で再解析：座標系と時刻のトークン、およびエポックごとの状態が書き込み精度（{ "1" } mm / { "1e-9" } km/s）で一致し、TIME_SYSTEM を落としたエクスポートは拒否されます。これは構造上の交換のラウンドトリップです。月面の座標系と時刻の物理的な意味は、それぞれの行で独立した参照と照合して確認しているため、この行は MODELLED のままです。{ "0.30" } 外部比較、所見（MODELLED のまま）：二つ目の独立したリーダーである Orekit { "12.2" } の CCSDS OEM パーサー（Apache-2.0、厳格なデフォルト）は、LTC と TCL の時刻系を実装していないため、二つの月面ファイルをどちらも拒否します（クレートの EME2000/UTC の OEM は復号でき、TIME_SYSTEM を TDB に置き換えれば月面ファイルも復号できます）。oem { "0.4.5" } は、未対応の時刻系にフォールバックすることによってのみ、書き込み精度の範囲内でこれらを復号します。これらの月面ファイルを主流の CCSDS リーダーとやり取りできることは、確立していません

seg-8ab65cbefb75 = PNT レジリエンスのフレームワークに整合したスコアリング

seg-c48198f31d63 = Kshana 自身の七つのレジリエンスカテゴリ（DHS の用語ではありません）、RethinkPNT の RDRR 機能、Yang の基準にわたる次元別のサブスコア。それぞれに、その要因を添えてモデル計算によるものと表示します。劣化の上限を課すゲートを備えた、暫定の RPCF レベル。シミュレーションに基づく自己評価であり、認証ではありません。

seg-f905aeb203bb = 手導出の指標別の式：逆シンプソン多様性、加重平均の総合値、上限あり／なしのタイムライン継続時間、最弱リンクのレベル段階

seg-d7bdb6fe186e = レジリエンススコアの判断不安定性の研究

seg-5fcf18a68bb1 = 単一の総合スコアや RPCF レベルが、妥当な重みの単体と脅威アンサンブルのもとで、アーキテクチャの順位をどれだけ入れ替えるかを定量化します（top-1 の入れ替わり率、Kendall-tau の分散、レベルの入れ替わり率、順位の範囲）。あわせて、宣言値と測定値の比較、および多様性の崩壊の分析も行います。

seg-b6bf76a752a0 = 閉形式の順位統計の恒等式（手計算した値を持つ tau in [-1,{ "1" }]、決定論的なシード付きディリクレ）と、構成した安定／不安定の証拠例

seg-1bf03544a010 = デモンストレーションの代表性と飛行に向けたギャップ

seg-db24d16d38c9 = デモンストレーション出力を修飾する、結果ごとの誠実性台帳：外部の拠り所、モデル計算に基づく仮定、飛行に向けたギャップ、代表的な TRL の範囲を記載し、不変条件を強制します（独立した参照と照合して確認済みとするには外部の拠り所が必要で、モデル計算によるものにはギャップが必要であり、TRL { "4" } を超えると主張することはできません）。

seg-81d3adb239c5 = 「代表性の正当化とフライトに向けたギャップの特定」という compliance の運用規律に対応する閉形式の不変条件。検証ステータスとオラクル種別の境界に結び付けています

seg-52ab936eb5f5 = 量子と古典のトレードのエビデンス（共通の形式）

seg-a6679ed5bed7 = 再現可能な一つの TradeEvidence オブジェクト（固定されたフレーム：シナリオ + シード + エンジン。極性を正しく扱った効果を持つ、性能指標ごとの共通の量子と古典の値、任意の { "95" }% CI、確認済み／モデル計算の区分）が代表性の記録を保持するため、すべての量子 PNT の分野が、同じ誠実な方法でトレードを報告します。

seg-70da3e15ea8b = 閉形式の効果／勝者の恒等式と、既存の quantum_trade::TradeResult の忠実なラッパー。誠実性は代表性台帳と検証ラベルに結び付けています

seg-20fee61b3107 = 量子デバイス誤差モデルライブラリ

seg-e42eabe9bc2a = デバイスカード（光学／捕捉イオン／水銀イオンと、holdover/clock_state から再利用した古典時計、冷却原子干渉計、古典およびエンタングルメント／単一光子の時刻比較リンク）。それぞれが代表性の記録を持ちます。エンタングルメントリンクには、ショット雑音で制限されるタイミング精密度モデル（~jitter/sqrt(R*tau)、ダークカウントのペナルティ、系統的フロア）を加えています。

seg-632600203e1f = 再利用した時計／CAI の係数（holdover/clock_state、公表値）と、エンタングルメントリンクの閉形式のショット雑音／損失の恒等式

seg-86d71fd89f26 = 信頼できる量子タイミング（時刻比較、安全な配信、異常）

seg-d2a3d37825ef = 量子と古典の時刻比較チェーンのエンドツーエンド（時計のコースティングとリンク精密度を二乗和で合成）、再利用したタイミング保護レベル、遅延／リプレイ攻撃のセキュリティ性能指標（1-P_md）、時計異常の検出確率と CUSUM の遅延を、代表性の記録を付けた誠実な TradeEvidence として出力します。

seg-ac95d112a17a = 再利用した、独立した参照と照合して確認済みのカーネル（Stable32/NIST に対する ADEV、TPL の限界、検出の analytic_pd/pmd）に対する閉形式の二乗和予算。誠実性は代表性台帳に結び付けています

seg-eaf341ff4522 = GNSS に依存しない量子ナビゲーション

seg-908a44a9f7c7 = GNSS 停止中の、量子（冷却原子干渉計）と古典のナビゲーション級 INS による推測航法の比較：位置誤差の増加、位置しきい値までのホールドオーバー、および誠実な TradeEvidence としての量子と古典のトレード。観測可能性に関する誠実な注記（測位解がなければバイアスは観測不能で、誤差が増加する）。

seg-508f2c8884e2 = 再利用した慣性予算を、同じ推測航法の ODE を独立した Octave で二重積分した結果と照合しています（実行環境は異なりますがモデルは共通のため ReferenceImpl）。また、Freier-2016 が公表した短期雑音を片側の拠り所として用います。量子と古典の複合値は MODELLED のままです

seg-914132833f5a = 量子 PNT システムの故障／異常検出

seg-f20392820b9d = ラベル付きの量子故障カタログ（時計の周波数ジャンプ／ドリフト／ロック喪失、センサーのバイアスステップ／ドロップアウト）、ブートストラップ CI 付きの検出統計量の ROC AUC、固定の誤警報率での最小検出可能故障。量子時計で支援したモニターは、古典のモニターより小さな故障を検出し、誠実な TradeEvidence として出力します。

seg-a689ab2ebb84 = 閉形式のガウス AUC = Phi(mu/(sigma*sqrt2)) を、外部で検証済みの eval_stats::bootstrap_auc_ci（scikit-learn との比較）および検出の解析的しきい値と照合

seg-0633e05d393f = トルクフリーの剛体姿勢ダイナミクス

seg-23f43007bcbf = オイラーの回転運動方程式（I ω̇ = τ − ω × Iω、主軸および一般の慣性テンソル）をクォータニオン姿勢運動学（q̇ = ½ q ⊗ ω）と結合し、各ステップでクォータニオンを再正規化する固定ステップ RK4 積分器で伝搬

seg-2d21a01ea132 = Basilisk { "2.9.1" } の宇宙機ハブ剛体伝搬（AVSLab、ISC；MRP 姿勢を自身の結合ハブ方程式で扱い、svIntegratorRKF78 を相対許容差 { "1e-12" } で使用）。トルクフリーの剛体方程式の独立した実装です。Kshana の RK4 クォータニオン（dt { "0.01" } s）と機体角速度は、対角でない一般の慣性二通りで { "1e4" } s にわたって { "1e-9" } 以内に一致します（最大で { "3.3e-11" } と { "3.4e-12" } rad/s）。許容差は比較の前に設定しました。独立した参照と照合して確認済みの主張：トルクフリーの運動。外部トルク項は比較していません。保存則と対称コマの確認は、補助的な自己整合性の確認として残しています。柔軟体、制御ループ、外部トルクの環境はありません

seg-93b8ba1ba0e5 = クローヒー・ウィルトシャー／ヒルの相対運動ダイナミクス

seg-17f27a95d009 = LVLH 座標系での、円形の基準軌道上のターゲットを周回するチェイサーの相対運動：線形化したクローヒー・ウィルトシャー方程式（ẍ−2nẏ−3n²x={ "0" }、ÿ+2nẋ={ "0" }、z̈+n²z={ "0" }）を、閉形式の { "6" }×{ "6" } 状態遷移行列 Φ(n,t) で解き（Clohessy–Wiltshire { "1960" }；Vallado Alg. { "48" }）、有界な相対軌道条件 ẏ₀=−2n·x₀ と、閉形式の二次補正（cw_dynamics::second_order_correction、厳密な円軌道チーフ方程式の二次項に対する CW 応答；Karlgaard and Lutze { "2003" }、Newman, Lovell and Pratt { "2015" }）を cw_dynamics::propagate_second_order として合成しています。独立した参照と照合して確認済みの出力は propagate_second_order です。線形の Φ 単独は非線形の真値に対して特性評価したもので、検証はしていません

seg-29adc2d68a7b = Orekit { "12.2" }（Apache-2.0）の NumericalPropagator、二体、LOFType.QSW を別プログラムとして実行（フィクスチャーはラウンド{ "1" }から変更なし）。事前登録した基準は、すべてのケースのすべてのサンプルで { "1e-3" } m。二次エンジンの修正は、この基準に対して変更せずに再実行しました（修正 8c8e768d、伝搬器が存在する前に記述し、一次のギャップが既知であったことを開示）。propagate_second_order は { "1.15e-7" } m（C1）、{ "9.8e-8" }、{ "5.4e-8" }、{ "2.2e-8" } m 以内で一致します。二次項を半分にすると { "1.85e-3" }〜{ "3.14e-3" } m で不一致になります。線形の Φ 単独は、{ "100" } m で軌道の三分の一にわたり、非線形の真値から { "1.2" }〜{ "6.3" } mm 離れます（省略した二次項によるもので、その厳密なテストは ignore のままです）。したがって特性評価であり、検証はしていません。保持する内部確認：Φ とヒル方程式の RK4 積分との比較、Φ(t)Φ(−t)=I、有界軌道と −12π·x₀ のドリフトの恒等式、二次項の三次の残差スケーリング。範囲：円軌道のチーフ、{ "100" } m 付近の離隔、軌道の三分の一まで。離心率（Tschauner–Hempel）、J2、差動抗力の項はなく、小さな離隔を仮定しています

seg-d31be81dfd8f = TDOA/FDOA による受動エミッターの測位

seg-aa870cee16f6 = 受信機ネットワークにわたる到達時間差から、エミッター（ジャマー／スプーファー、またはリバース PNT のための機会信号源）を特定します（τᵢ=(Rᵢ−R₀)/c の双曲面の交点を Gauss–Newton の最小二乗法で解く）。さらに、移動する受信機で到達周波数差（距離変化率の差）を加えて、位置と速度を同時に復元します。測定ジオメトリから、位置共分散に対するクラメール・ラオ下限も求めます

seg-17b45796fd43 = 推定器とジオメトリの自己整合性：順方向と逆方向のラウンドトリップ、フィッシャー情報／CRLB の恒等式 J·CRLB=I、GDOP の単調性、およびモンテカルロ雑音のもとで推定器が自身のクラメール・ラオ下限を達成すること。これらは内部整合性の確認であり、外部データセットではないため、この行は InternalConsistency のままです。MODELLED の受動測位：点源の見通し線モデルで、マルチパス／NLOS、受信機クロックバイアス、大気屈折の項はありません。{ "0.30" } 第{ "2" }ラウンド、Ho and Chan { "1993" } および Ho and Xu { "2004" } との比較（事前登録 f89018b8、記載値の各 { "1" } %）、所見（MODELLED のまま）：地表拘束の TDOA 下限は { "40" } N の幾何係数（-0.11 %、-0.02 %）と最大 TDOA を再現します。TDOA+FDOA 統合の下限は図{ "6" }（+{ "0.06" } %、-0.17 %）を再現し、著者自身のコードが図{ "7" }に挙げる音源では（その結果を見た後に修正を記述、開示済み）、図{ "7" }（+{ "0.11" } %、-0.02 %）を再現します。著者が公開した下限のコード（BSD 系、GNU Octave で実行）とは { "3e-12" } まで一致します。共分散で重み付けした最尤ソルバーは、記載された下限を達成します（+{ "0.3" }〜+{ "0.4" } %）。論文がモンテカルロから記載しているオタワの係数（{ "251" }、{ "7.1" }）は +{ "1.3" } % と +{ "4.4" } % 異なり、{ "1" } % の基準の外です

seg-36b74b49f82f = 公表された Stardust の公称値に対する、3-DoF 弾道突入のピーク減速度

# c1: entry-heating
seg-a05ca2fde6fc = 自転する球形の地球上での3-DoF 質点の突入を、US Standard Atmosphere { "1976" } のもとで、慣性系の突入状態から RK4 で積分し、ピーク減速度とその高度を報告します。慣性系の状態から惑星相対の突入状態を求めます。<c1/> シナリオ種別として実行できます。

seg-5ab7065c0803 = Desai、Mitcheltree、Cheatwood（{ "1999" }、NASA NTRS { "20050042027" }）の Stardust 公称値：惑星相対 { "12.6" } km/s、打ち上げ質量 { "45.8" } kg での最大減速度 { "33.4" } g。完全な空力データベースを用いた6-DoF の POST 軌道です。突入インターフェースは Desai、Lyons、Tooley、Kangas（NTRS { "20090004445" }）：半径 { "6503.14" } km、慣性系で { "12.9" } km/s、-8.2 deg。基準は、これらの入力での実行の前に xval/entry-stardust/PREREGISTRATION.md に事前登録し、最初の実行でどちらも成立しました。対象外：公表されている事例は一つ、量も一つだけ（ピーク減速度。弾道近似では弾道係数に依存しません）。突入の緯度と方位は仮定です。加熱、熱負荷、着地点はこれと照合していません。一定の C_D を持つ質点であり、6-DoF ではありません。

seg-5bd3882531b6 = 3-DoF 突入でのよどみ点の対流突入加熱（Sutton-Graves）

seg-4f97036ed72f = よどみ点の対流熱流束 q = k sqrt(rho/R_n) V^{ "3" }。地球の空気と火星の大気に対する Sutton-Graves 定数（NASA TR R-376、{ "1971" }）を用い、地球または火星での、弾道または一定バンクの揚力を持つ3-DoF 突入に沿って、そのピークと積算熱負荷を求めます。

seg-5a203ecfeaee = 内部整合性：NASA TR R-376 に記載のとおりの関係式と定数、半ステップの収束確認、加熱と減速度のピークの順序が想定どおりであること。対象外：公表された加熱値とは比較していません（Stardust の論文が示すのは設計限界と、対流と放射を合わせた約 { "1200" } W/cm2 の推定値であり、対流のみの関係式では一致しません）。放射加熱、壁温や触媒性の補正、熱防護の応答はありません。

seg-1b96577665fc = 電気光学イメージャーの放射計測、MTF、相対エッジ応答、GIQE { "4" } NIIRS

# c1: eo-radiometry
seg-38902593e841 = 直下視イメージャーの信号対雑音の予算（ランバートシーン放射輝度、カメラ方程式、ショット雑音、暗電流雑音、読み出し雑音、量子化雑音）、遮蔽のない開口の回折、検出器開口、線形スミア、ガウスジッターの積としてのナイキスト周波数でのシステム MTF、その MTF から積分したエッジ応答と相対エッジ応答、Q = lambda F / p、および MTF 補償なしの GIQE バージョン{ "4" } の NIIRS。<c1/> シナリオ種別として実行できます。

seg-bb3a01edc95d = 閉形式：半カットオフでの回折 MTF、純粋な検出器開口の一画素ランプエッジ（RER { "1" }）、ガウスぼけの正規 CDF エッジ（RER = erf(0.5/(sigma sqrt { "2" }))）、ショット雑音のスケーリング、および公表されたとおりの GIQE { "4" } 係数（Leachtenauer et al., Applied Optics { "36" }({ "32" })、{ "1997" }）。対象外：外部のイメージャー、測定した MTF、評価済みの画像とは比較していません。GIQE は固有の誤差を持つ経験的な回帰です。迷光、大気 MTF、MTF 補償、エイリアシングはありません。

seg-07ca77a67207 = 打ち上げ上昇の重力損失、抗力損失、操舵損失、背圧損失

# c1: ascent-losses
seg-7a1802cf2c80 = 自転しない球形の地球上での多段機体の平面重力ターン上昇を、US Standard Atmosphere { "1976" }（密度と圧力）のもとで扱い、ピッチキック、ノズル背圧による推力低下、正確なステップ境界での段の燃焼終了を含み、重力、抗力、操舵、背圧の各損失を状態と並べて積分します。<c1/> シナリオ種別として実行できます。

seg-174ed29adbbe = 内部整合性：厳密な恒等式「燃焼終了速度 = sum Isp g0 ln(m0/mf) から積分した四つの損失を引いたもの」（残差は { "1e-6" } m/s 未満）、重力のみが損失となる鉛直真空燃焼でのツィオルコフスキーの式、US76 の海面圧力と対流圏界面圧力。対象外：公表された機体の損失とは比較していません。地球の自転、コースト、スロットリング、キック以外の誘導はなく、C_D は一定で、軌道最適化器ではありません。

seg-55e8345def8b = TWSTFT の双方向方程式、不確かさの予算、フリッカーと日変化する非相反性を含むリンク安定度

# c1: time-transfer-budget
seg-5ca5226c24ec = T_A - T_B について解いた TWSTFT の双方向方程式（局の送信遅延と受信遅延、Ku バンドの電離圏の上り／下りの非対称、トランスポンダー遅延差、Sagnac 項を含む）を、その厳密な順方向モデルと照合します。リンクの TDEV をタイプ A の項とする二乗和の不確かさ予算。ホワイトとフリッカーの位相雑音（Kasdin-Walter）、日変化する非相反性、一定の相反性残差を含む双方向系列。与えられた Circular T、MJD-CSV、IGS RINEX の局時計系列の変化率、残差 RMS、TDEV、ADEV。<c1/> シナリオ種別として実行できます。

seg-244f7396ac25 = 内部整合性：順方向モデルと解いた方程式が { "1e-15" } s まで一致し、Sagnac 項はモジュールが独立に持つ BIPM の 2A omega/c^{ "2" } のループ形式に等しく、電離圏項は { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c で、雑音過程は想定どおりの TDEV の形を示します。対象外：実際の TWSTFT の測定や較正レポートとは比較していません。示した遅延と不確かさは入力であり、測定値ではありません。与えられた系列の安定度は報告するだけで、検証はしていません。

seg-2f9be02c92bc = 光スラントパス大気の数値計算：Rytov 分散、シンチレーション、ガンマ・ガンマのフェージング確率、開口平均化、雲と晴天大気の光学的厚さ

# c1: optical-atmosphere
seg-032cf76c2ec0 = Hufnagel-Valley の Cn2 をスラントパスに沿って積分し、平面波と球面波の Rytov 分散（上りと下り）、Andrews-Phillips のシンチレーション指数とガンマ・ガンマのパラメーター、ガンマ・ガンマのフェージング確率とフェードマージン、弱乱流の開口平均化係数、液水柱の雲の光学的厚さ、Kim 視程と Rayleigh による晴天大気の光学的厚さを求めます。大気を与えた場合は、光リンクバジェットの一括した大気損失の代わりに用います。<c1/> シナリオ種別の内部で実行できます。

seg-7ca512adff99 = 数値計算を、Kshana とコードを共有しない独立したプログラム（xval/optical-atmosphere/oracle.py、{ "30" } 桁の mpmath { "1.4.1" }、元の高度変数での tanh-sinh 求積、Bessel-K のガンマ・ガンマ密度）と、実装が存在する前に設定した基準（xval/optical-atmosphere/PREREGISTRATION.md）のもとで比較しています。MODELLED の理由：このオラクルは同じ公表式を評価するため、確認しているのは記載した式の実装であり、大気そのものではありません。ITU-R の検証例も、測定したシンチレーションやスラントパス消散の記録も使っていません（ITU の値はライセンスの判断が未決のため、リポジトリには含めていません）。Cn2 プロファイルのレベル、視程、エアロゾルと分子のスケールハイト、開口平均化の経路長、開口平均化をガンマ・ガンマのパラメーターに適用するためのモーメント整合は、記載した入力または規約です。モジュール内のソース行には、広く複製されている一つのサーベイが、二つ目のシンチレーション指数を、Andrews と Phillips の 5/6 ではなく 7/6 と記載していることを記録しており、5/6 の形を実装しています

seg-a2faab92e760 = 天候に左右される光地上局の可用性と、距離相関のあるサイトダイバーシティ

# c1: optical-atmosphere
seg-7f4e4e763d62 = 対数正規分布の雲の液水量の気候（ITU-R P.840 の量、幾何光学的な消散）と、独立したガンマ・ガンマの乱流フェードから、定めたリンクマージンに対する光リンクの可用性。目標の可用性に必要なリンクマージンと、どのマージンでも引き上げられない上限。対数正規分布の停止継続時間、強化技術の仮定シナリオ、およびペア相関が exp(-distance/decorrelation length) である一因子ガウスコピュラのネットワーク可用性。<c1/> シナリオ種別として実行できます。

seg-20eab6e9b925 = 内部整合性：ダイバーシティモデルの閉形式の極限と単調性、雲の上限の閉形式、対数正規分布の停止の恒等式。外部オラクルは一切主張しておらず、比較もしていません：光地上局の可用性や雲のない見通し線の測定記録は使っていません。MODELLED の理由：雲の気候（雲の確率、液水柱の中央値とばらつき、停止継続時間）、雲と乱流の独立性、ガウスコピュラの形、相関距離、すべての技術の利得は仮定です。同梱のシナリオが示すのはILLUSTRATIVEの気候であり、データセットではありません。この行を引き上げるには、引用できる測定された可用性の記録と、比較の前に登録した基準が必要です

seg-043ece801e72 = 光の停止をまたぐタイミングと測距の連続性

# c1: optical-atmosphere
seg-bb9cb3fe4180 = 光地上局の停止継続時間の分布を、時計ホールドオーバーモデルの閉形式のコースト分散に結合：定めた停止の分位数でのタイミング誤差と測距誤差、タイミングしきい値までのホールドオーバー、その範囲に収まる停止の割合と停止時間の割合、古典と量子の時計クラスでのタイミング可用性 A + U E[min(D, T_h)]/E[D]。<c1/> シナリオ種別の内部で実行できます。

seg-ab2a33c1b1a4 = ホールドオーバーモジュールとの内部整合性はビット単位で一致します。外部オラクルは一切主張していません。クラスの PSD は、ホールドオーバーモジュールがすでに持っている合成した長い tau のフロアであるため、数値は、厳しいしきい値までのホールドオーバーは、引用したアラン偏差ではなく、仮定した赤色雑音のフロアで決まるという、同モジュールの注意書きを引き継ぎます。停止継続時間は、記載したパラメーターを持つ対数正規モデルであり、測定した雲の滞留記録ではありません

# c1: [timeseries]
# c2: optical-atmosphere
seg-b119df65d2a7 = 光リンクマージンの時間変化：地点の天候の、シード付きの一つの実現

seg-06125f3cae90 = オプトインの <c1/> テーブル（duration、step、seed）により、<c2/> 種別は、地点ごとに、記載した地点モデルの時間にわたる、シード付きの一つの実現も書き出します：雲のエピソード（晴れの区間は指数分布、雲による停止は記載した平均とばらつきを持つ対数正規分布、雲に覆われる時間の割合は記載した雲の確率に設定）、雲のエピソードごとの対数正規分布の液水柱一つ、ステップごとのガンマ・ガンマのシンチレーションサンプル一つ、そしてこれらから得られるリンクマージン、雲とシンチレーションのフェード、リンク稼働フラグ。あわせて、実現した可用性、雲の割合、停止の回数、最長の停止を出力します。テーブルがなければ、結果は { "0.37" } のドキュメントです。抽選は可搬な分布と数学のルートを通るため、ネイティブと wasm32 で同じバイト列になります。

seg-d25e5d2449bd = 内部整合性のみです。外部オラクルは一切主張しておらず、天候の実現に対するオラクルは存在しません。確認は、一つの抽選を同じモデルの統計的な出力と比較するため、合格が示すのは、生成器が記載した分布からサンプリングしているということ（抽選の可用性と雲の割合が、記載した数値に対して事前登録した許容差の範囲内にあること）であり、実在の地点がそのように振る舞うということではありません。この系列は気候ではなく一つの実現です。可用性は、抽選のサンプリング誤差の分だけ記載値と異なり、異なるステップのシンチレーションサンプルは独立ですが、これはミリ秒で相関が失われる過程を単純化したものであると明記しています。天候の入力は、引き続きシナリオの仮定です。

seg-58cbf576c959 = TRK-2-18 Orbit Data File リーダーと、火星のランプ付き 2-way ドップラーモデル

seg-d1055650a77f = DSN Orbit Data File（TRK-2-18）のリーダー：36-byte のレコードグループ（ファイルラベル、識別子、軌道データ、局ごとのランプ、時計オフセット、サマリー、ファイル終端）と、各軌道データレコード内の { "1950" } 年からの時刻タグ、ダウンリンクとアップリンクの遅延、観測量、局、データ種別、バンド、有効性、チャネル、宇宙機、46-bit の基準周波数、圧縮時間。ランプの開始時刻と終了時刻、変化率、開始周波数。その上に、ランプ付き 2-way X バンドドップラーモデル（積分したアップリンクのランプ、Shapiro 遅延と対流圏を含む往復の光行時間、IAU 2006/2000A の CIO 系列と IERS EOP を通した DSN 局、局の時刻）と、火星周回機のバッチ軌道決定（GMM-3 場、第三体、SRP、抗力）。

seg-6d533149f6f0 = DSN 航法データ調整プロセスがファイルとともに作成した PDS3 ラベル（NASA PDS Geosciences Node、MRO-M-RSS-1-MAGR-V1.0）に対して、リーダーが存在する前に xval/mro-odf/PREREGISTRATION.md に事前登録した基準で確認。MODELLED である理由は、登録した基準の一つ（ファイル終端テーブルの行数。ファイルでは { "121" }、ラベルでは { "120" }）に届かなかったためで、ラベルはこの点で内部的に矛盾しています。段階{ "2" }（xval/mro-od/PREREGISTRATION.md、採点結果より前の修正 A1 と A2）：MRO 航法チームの再構成（mro_psp5、NAIF）から予測したドップラーは、開発で使わなかったパスで観測されたランプ付き 2-way ドップラーと { "12.5" } mHz まで一致し、基準は満たしました。登録した軌道決定は採点対象の弧で失敗し（正規行列が正定値でない）、軌道が得られなかったため、軌道の基準は満たしませんでした。実行{ "2" }（xval/mro-od/PREREGISTRATION-RUN2.md、減衰付き推定器、同じ弧と基準、docs/revisions に開示した採点修正 R2-A1）は収束しました：推定した軌道は再構成から { "0.36" } km RMS 以内（最大 { "0.53" } km）で基準は満たしましたが、フィット後のドップラー RMS は { "48.6" } mHz で、基準の { "30" } mHz を満たさなかったため、この行は MODELLED のままです。対象外：推定した軌道が、登録したすべての基準を満たしたことはありません。電離圏、太陽プラズマ、アンテナオフセットの大部分（{ "1.5" } m の半径方向オフセットは開発パスでフィットしています）はモデル化していません。

seg-c7d292f14693 = リアクションホイールによる閉ループ MRP フィードバック姿勢制御

# c1: aocs
seg-f33781b74cc2 = 釣り合った三基以上のリアクションホイールを持つ剛体ハブの慣性指向姿勢制御：MRP フィードバック則 L_r = -K sigma_BR - P omega_BR（Schaub and Junkins）、各ホイールの限界でクリップした最小ノルムのホイールモータートルク G_s u = -L_r、ホイールのスピン慣性をハブ慣性に含めた結合ハブ・ホイールダイナミクス、クォータニオン運動学、ゼロ次ホールド付きの RK4。<c1/> シナリオ種別として実行できます（真値状態ループ）。

seg-9563d5843891 = Basilisk { "2.9.1" }（AVSLab、ISC；bsk のホイール実行は別ツールとして実行し、リンクもベンダリングもしません）：宇宙機ハブ、reactionWheelStateEffector（BalancedWheels、トルク制限あり）、simpleNav、inertial3D、attTrackingError、mrpFeedback（積分項なし）、rwMotorTorque を dt = { "0.1" } s、同梱の RK4 で実行し、Kshana 自身の実装と三つのケース（直交する三基のホイール、四基のピラミッド、飽和する四基のケース）で比較しました。基準はコードと実行より前に xval/aocs-basilisk/PREREGISTRATION.md に事前登録し、最初の実行ですべて成立しました。対象外：ループ内のセンサー雑音、積分フィードバック、追尾ガイダンス、ホイール摩擦、ジッター、回転数の制限と電力、実際の宇宙機のゲイン。この比較が確認するのは、制御則とダイナミクスの実装を独立した実装と照合することであり、飛行用コントローラーではありません。

seg-455dc946c965 = ジャイロとスタートラッカーからの乗法 EKF による姿勢推定

# c1: aocs
seg-553d043438b4 = Lefferts-Markley-Shuster の乗法 EKF：機体座標系の姿勢誤差とジャイロバイアスの状態、ジャイロ角速度からバイアス推定値を引いた値と Farrenkopf の離散プロセス雑音（角度ランダムウォークと角速度ランダムウォーク）による伝搬、残差 { "2" } vec(q^-1 q_st) を用いた Joseph 形式のスタートラッカー更新、乗法リセット、そして Farrenkopf の離散ジャイロとスタートラッカーのシミュレーター。<c1/> 種別は、その推定値で制御ループを閉じることができます。

seg-846cb1eeb35c = 内部整合性：同じセンサーモデルからモンテカルロのシードにわたってシミュレートした真値に対する、フィルターの正規化推定誤差二乗と、姿勢とバイアスの推定値の収束。対象外：外部の推定器や飛行データとは比較していません（Basilisk { "2.9.1" } には MEKF モジュールがありません）。センサーモデルは教科書どおりのもので、ミスアライメント、スケールファクター、スタートラッカーの視野の影響はありません。

seg-059732bda693 = Wahba/TRIAD/QUEST による姿勢決定

seg-3ee6e56d790f = 重み付きベクトル観測（恒星／太陽／磁力計の方向）からの最適な三軸姿勢：決定論的な二ベクトルの TRIAD、Davenport の q 法（Wahba 損失の厳密な最小化解で、最適クォータニオンは { "4" }×{ "4" } の Davenport 行列 K の最大固有値の固有ベクトルであり、対称ヤコビ固有値解法で解く）、そして QUEST（Σ 重みを初期値とした K の特性方程式のニュートン／割線法の根、続いてギブスベクトルからのクォータニオン復元）

seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors（SciPy { "1.13" }；Virtanen et al., Nature Methods { "2020" }）。Wahba 問題の Kabsch/Markley SVD 解であり、kshana の Davenport-K 固有値解法／QUEST 特性根法とは、アルゴリズム（姿勢プロファイル行列の SVD）もコードベースも真に独立していますが、一意に定まる同じ Wahba 最適姿勢を計算します。雑音のない重み付きベクトル観測の組では、TRIAD、q 法、QUEST は、scipy の最適回転を <{ "1e-9" } rad 以内で再現します（符号に依存しない姿勢誤差角で比較）。雑音を含むモンテカルロの「最適解は TRIAD に勝る」という統計的な主張は MODELLED のままです（外部オラクルなし）。点方向の単位ベクトル観測のみで、センサーの視野、バイアス、時間相関のモデル化はなく、QUEST は { "180" }° で特異です（q 法はそのケースを扱えます）

seg-cd342cc48afc = GNSS 二乗則捕捉の検出統計量

seg-6d97452de33e = 符号位相 × ドップラー探索に対する二乗則（ノンコヒーレント）捕捉検出器：誤警報確率（2M 自由度の中心χ²）、目標の P_fa を達成するしきい値（χ² の CDF を二分法で逆算）、検出確率（セルごとの相関後 SNR ρ に対する非心度 2M·ρ の非心χ²）、および一般化 Marcum Q 関数 Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2（SciPy { "1.13" }；Cephes/Boost）。kshana の不完全ガンマ級数（raim::chi2_cdf / noncentral_chi2_cdf）とは独立したアルゴリズム（連分数による非心／中心χ²）で、一意に定まる同じ検出統計量のカーネルを計算します：一般化 Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²)、検出確率 P_d、誤警報確率 P_fa、P_fa→しきい値の逆算が ~{ "1e-6" } で一致しました。これは、検証済みの行「RAIM/ARAIM のインテグリティ統計カーネル」と同じ独立性の根拠です。対象はカーネルのみです：セルごとの CFAR セル平均化と、符号／ドップラービンにまたがる損失は MODELLED のままです

seg-77f425a38aa2 = GNSS 搬送波位相の整数値バイアス決定（LAMBDA）

seg-410ce8b6cebf = LAMBDA 方式による整数最小二乗のアンビギュイティ固定：体積を保存する整数（Z）の無相関化変換（L D Lᵀ 因子の整数ガウス・サイズ縮小）と、厳密な Schnorr–Euchner の深さ優先分枝限定による整数最小二乗探索、および上位二つの候補に対する比検定（独立した参照と照合して確認済みの主張）。加えて、閉形式のブートストラップ成功率 P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }) は、内部でのみ確認しており、独立した参照と照合して確認済みの主張の範囲外です

seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 の lambda()（そのソースファイル lambda.c、T. Takasu、BSD-2-Clause）。C からコンパイルし、ツールとして実行した独立した LAMBDA 縮小と MLAMBDA 探索を、{ "300" } 個のランダムな共分散（n { "2" }〜{ "10" }）で比較しました。整数最小二乗の最小化解は一意なので、固定した整数は同一でなければならず（不一致 { "0" } 件）、比検定に使う上位二つの二乗ノルムは相対で { "1e-9" } まで一致しました（実測 { "5.6e-13" }）。許容差は比較の前に設定しました。独立した参照と照合して確認済みの主張：ILS の解とその上位二つのノルム。RTKLIB はブートストラップ成功率を計算せず、これは丸め処理のモンテカルロとの内部照合にとどまります。Z 変換の不変量と総当たりの列挙は補助的な確認として残しています。整数ガウスの無相関化のみです（完全な LAMBDA 縮小の並べ替えの置換は探索を速めますが、厳密な ILS の答えもブートストラップ率も変えません）

seg-4ad1ec05610f = B 平面ターゲティングとパッチドコニックによる重力アシスト

seg-d249aea7c3ea = 双曲線フライバイの幾何（a=−μ/v∞²、e={ "1" }+r_p·v∞²/μ、転向角 δ={ "2" }·asin(1/e)、衝突パラメーター |B|=|a|·√(e²−{ "1" })）、B 平面の Ŝ/T̂/R̂ 目標点座標系と B·T̂/B·R̂ への分解、パッチドコニックの重力アシスト（v∞ の大きさは保存され、方向が δ だけ偏向し、日心の Δv={ "2" }·v∞·sin(δ/2) が推進剤コストなしで得られる）、およびティスラン・パラメーター T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

seg-1ec7b0d8a32c = GMAT R2026a（Apache-2.0、別プログラムとして実行）を、{ "192" } 個の地球の双曲線状態に適用：B.T、B.R、|B| は { "1e-6" } km 以内（最大 { "1.35e-8" } km）、転向角と両方の漸近線は { "1e-9" } rad 以内（最大 { "9.3e-15" } rad）、GMAT の C3 と漸近線から求めたアシスト速度変化は { "1e-9" } v_inf 以内（最大 { "5.6e-14" }）、アシストの前後の{ "350" }個の太陽中心状態での日心の SMA、ECC、INC は相対で { "1e-9" }、{ "1e-12" } rad 以内（最大 { "2.2e-14" } と { "4.1e-14" } rad）。ティスラン・パラメーターは、GMAT の軌道要素で sbpy { "0.6.0" }（BSD-3）と { "1e-9" } 以内（最大 { "1.3e-15" }）、{ "3" } - C3/v_c^{ "2" }（{ "8.9e-16" }）とも一致し、ティスランの閉形式は Kasuga and Jewitt（{ "2019" }）の表 { "8.1" } の{ "12" }天体について、記載値の丸めの範囲内（その最大 { "0.39" }。P1 の公表された計算例）で一致しました。事前登録済み（436293bf；日心の修復 6fd9f5e6）。修正 374c806b は、オラクルのファイルを生成した後、Kshana の値を見る前に書かれ、傾斜角入力のフィルターを { "1e-2" } から { "1e-3" } rad に広げて、条件の悪い状態をより多く残しました。MODELLED の範囲：円形の惑星軌道でのパッチドコニックの二体フライバイで、影響圏の遷移、遭遇時の摂動、エフェメリスは含みません

seg-8e82da17a463 = CRPA アンチジャムアレイのビームフォーミング

seg-1744f527b4d1 = 制御受信パターンアンテナのヌル形成：複素アレイのステアリングベクトル a(û)=exp(j·k·pₙ·û)、決定論的なヌルステアリング（SV 方向に単位利得、最小ノルム w=Aᴴ(AAᴴ)⁻¹b により最大 N−{ "1" } 個のジャマー方向に厳密なヌル）、および強い干渉源に深いヌルを自律的に向ける MVDR 適応ウェイト w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv)（ゼロから実装した複素線形代数カーネルを使用）

seg-8016dae66350 = numpy.linalg / scipy.linalg（LAPACK zgesv による複素解法）。kshana のゼロから実装した複素カーネルとは独立した線形代数のコードベースで、一意に定まる同じウェイトを計算します：MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) と最小ノルムのヌルステアリング w=Aᴴ(AAᴴ)⁻¹b、およびその結果のアレイ応答利得が ~{ "1e-9" } で一致しました。これは、検証済みの DOP（gnss_lib_py）とフィッシャー情報（numpy）の行と同じ種類のオラクルです。MODELLED の狭帯域・遠方界・同一等方性素子のアレイであり、相互結合、素子ごとのミスマッチ、有限帯域幅（STAP）、ステアリングベクトルの推定誤差はありません

seg-f2c973f14d52 = IEEE-1139 のべき乗則クロック雑音とフリッカー FM フロア

seg-4a0159558671 = 五係数の IEEE-1139 PSD とアラン分散の変換 S_y(f)=Σh_α f^α → σ_y²(τ)（ホワイト／フリッカー PM、ホワイト／フリッカー／ランダムウォーク FM）、フィット可能な第一級の項としてのフリッカー FM フロア σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" })、およびドリフト基底 { "{" }1/τ,τ,τ³{ "}" } では表せないフロアを回復する、{ "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" } 基底での非負の FM 系フィット

seg-24f6f26046b6 = allantools { "2024.06" }（A. Wallin；Kasdin & Walter { "1992" } / Vernotte { "2015" } の係数）。独立した第三者のコードベースと引用系統で、五種類のべき乗則雑音のそれぞれについて、一意に定まる同じ IEEE-1139 の PSD からアラン偏差への変換 σ_y(τ) を計算します。kshana の powerlaw::allan_deviation は allantools の閉形式と一致します（ホワイト／フリッカー FM、RW-FM、ホワイト PM は相対で <{ "5e-9" }、フリッカー PM は ~{ "1e-5" }。これが真の独立性の兆候で、kshana は NIST-SP-1065 の表の { "1.038" } 定数を、allantools は完全な 3γ−ln2 を用いています）。フリッカー FM フロア √({ "2" } ln2·h_{ "{" }-1{ "}" }) も、全範囲で allantools と一致します。これは、検証済みの MDEV/TDEV/Theo1/MTIE の行が満たしているのと同じ基準です。MODELLED の定常べき乗則モデルであり、決定論的ドリフト（τ²）項はなく、デバイスごとの係数と測定したフロアはモデル計算によるもののままです

seg-cc1ac065e684 = CCSDS OEM 共分散ブロックの相互運用

seg-ec4d44e7cf78 = CCSDS { "502.0" } OEM の COVARIANCE_START…COVARIANCE_STOP ブロックのシリアライズと解析：{ "6" }×{ "6" } の位置／速度共分散を、21要素の下三角（標準の CX_X … CZ_DOT_Z_DOT の順）として書き出し、任意の COV_REF_FRAME を付けます。既存の OEM 状態ベクトルのライターとパーサーを補完し、軌道決定とフィルターの共分散が標準形式でラウンドトリップします

seg-ae061c7f082c = INS/TRN コースティングの誤差増加としきい値の通過

# c1: ins-trn-coast
seg-7bacdc8aa0d8 = IMU 係数から構築した、位置誤差対コースティング継続時間の予算。各誤差源（加速度計バイアス、ジャイロバイアス、速度ランダムウォーク、角度ランダムウォーク、巡航時と持続的な比力下でのスケールファクター）を、シューラーフィードバックを含む九状態の局所水平 INS 誤差モデルで伝搬します（inertial::coast::ErrorDynamics、Groves 2nd ed. ch. { "14" } に基づく：姿勢、速度、位置の誤差、重力勾配を持つ鉛直チャネル、WGS-84 の半径と正規重力、設定した速度、latitude_deg、height_m で北に向かう水平なプラットフォーム。系統的な項は拡張行列指数、ランダムウォークは Van Loan による）。平坦地球の単項式は leading_order_m としてのみ残します。寄与は定めた規則（rss／線形和／決定論的和と確率的 rss）で合成します。呼び出し側が与えた位置しきい値（既定は { "10" } m と { "50" } m）に達するコースティング継続時間は、最初の通過を前方走査で求め（first_crossing_s。シューラーで有界な曲線は単調ではないため）、各通過での支配的な誤差源も示します。さらに、各しきい値を保つ最大の地形フィックス間隔を与える TRN 有界モードがあります。<c1/> シナリオ種別として実行できます

seg-622af0bd27de = NaveGo v1.4（コミット 24d9488、LGPL-3.0）を GNU Octave { "8.4.0" } のもとで別プログラムとして実行：同じ IMU 誤差プロファイルでの自由慣性コースティングの実行。クォータニオン更新（qua_update.m）の数値的な不感帯を一か所修正しており（{ "1e-8" } rad/s 未満の角速度に対するガードを wnorm == { "0" } に置き換え、実行時のコピーに適用して一度だけ一致を確認）、ガードがあるとゆっくりドリフトするプラットフォームの姿勢が固まり、シューラーフィードバックが断たれました。修正済みのジェネレーターとともに、実行前に事前登録しました（4262b969）。エンジン（440b3877）は、修正後の出力をどれも開く前にコミットしました。基準はラウンド{ "1" }と同じ { "5" } %、{ "48" } 点、項、シード、統計量です。結果：48/48 が { "5" } % 以内（最大は { "1200" } s での速度ランダムウォークの +{ "3.70" } %、{ "1800" } s での角度ランダムウォークの +{ "3.33" } %）。{ "3600" } s では、加速度計バイアスについて NaveGo/Kshana が 2375.4/2376.2 m、ジャイロバイアスについて { "130" } 885/131 { "675" } m を示します。シューラーの輸送レートフィードバックをゼロにすると、テストは不合格になります（{ "3600" } s で +{ "695" } %）。開示事項：単一チャネルのシューラー予測と round-1 の NaveGo の値は既知でした。モデルにフィットしたパラメーターはありません。範囲：戦術級、{ "45" } deg N、水平かつ北向きでの、{ "3600" } s までの項ごとの誤差曲線。しきい値通過、合成規則、TRN モードは、それらの曲線の決定論的な関数です。IMU クラスの係数（Groves { "2013" } 表 { "4.1" } の帯の数値）と TRN フィックスの残差は、MODELLED の入力のままです。ラウンド{ "1" }（置き換え済み）：現在は leading_order_m である平坦地球の単項式は、{ "600" } s を超えると過大になります（一時間で 2.2x〜8x）。{ "0.30" } の改訂：ins-trn-coast のすべての出力が変わります（同梱シナリオの TRN ピーク { "52.932679" } -> { "44.711834" } m）

seg-a971ff07592a = アパーチャの航法対通信のデューティサイクル

# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = 一回の実行で、コンタクトプラン（aos_s/los_s ウィンドウのリスト。各ウィンドウはアパーチャに航法または通信を求め、<c1/> が出力するのと同じウィンドウの語彙を <c2/> で変換したもの）、アパーチャ数、明示的な調停ポリシーを受け取り、航法デューティ、通信デューティ、アイドルデューティ、セッションごとの停止を返します。ポリシーは文書化された既定値を持つ入力であり（<c3/>。ほかに <c4/> と非プリエンプティブの <c5/>）、レポートには、解決したポリシー、その完全な定義、デューティと停止の定義を載せます。調停規則なしで引用したデューティの数値は再現できないためです。スケジュールはウィンドウ境界にわたる厳密な区間掃引であり、あるウィンドウが終わる位置でちょうど次が始まる場合は競合せず、航法、通信、アイドルのアパーチャ秒は、その一回の掃引で独立に積算されます。<c6/> シナリオ種別として実行できます

# c1: passes::predict_passes
seg-656fd7d44a9e = 内部整合性。同じ掃引で異なる式から計算した三つの量が、最後に閉じることを要求します。航法のアパーチャ秒、通信のアパーチャ秒、アイドルのアパーチャ秒は別々に積算され（アイドルは、基本区間ごとの（アパーチャ − |served|）から求め、残りとしては求めません）、それらの合計は apertures × horizon_s と照合されます。境界の括り方の誤り、区間の二重計上、区間の欠落があれば、これはただちに破れます。セッションごとの提供時間も、二つのサービス合計に戻ることが別途要求されます。スケジューラーの構造上の性質は、仮定せずに測定しています。提供時間がアパーチャ数に対して非減少であることを、三つのポリシーすべてについて { "200" } 個の擬似乱数プランで確認しており（アパーチャが一つ増えると、以降のすべての境界で誰が何を保持するかが変わる非プリエンプティブのポリシーでは自明ではありません）、境界の算術は、そうしなければ 一つのずれによる誤りが隠れてしまう、接する／一秒重なるペアで固定しています。パス予測ブリッジは <c1/> の出力と照合します。アパーチャが一つで競合するサービスがない場合、航法のアパーチャ秒は予測器自身のパス継続時間の合計に等しくなります。外部オラクルは主張しておらず、存在もしません。この機能は手計算を置き換えるものであり、手計算と照合するものではありません。同梱のコンタクトプランは飛行したものではなく例示用であり、調停規則を明記したプランと答えの組を公表している運用スケジューラーはありません。明記されていないポリシーで計算したデューティは、明記されたポリシーで計算したものとは比較できず、ポリシー依存性は測定しています（同一のプランで航法デューティが 100/150 対 50/150）。スルーと切り替えの時間、データ量、バッファ状態、エネルギー、リンクの成立は、暗黙にモデル化するのではなく、レポートのラベルで除外しています

# c1: jamming
# c2: lunar-jamming
seg-43cd7aa7ab53 = 月面ナビゲーションの RF ジャミング（衛星ごとの J/S）

seg-e0566f37ad8f = 月面固有のジャマー対信号比、実効 C/N₀、ロック喪失を、月面（または高い位置）のジャマーのもとにある selenographic な地表ユーザーについて、例示用の公開情報に基づく Moonlight/LCNS クラスのコンステレーション上で求めます。オープンなジャミングチェーン（j_over_s_db、effective_cn0_dbhz、rx_antenna_gain_db、lock_status、q_factor、nominal_cn0_dbhz、free_space_path_loss_db）を、オープンな月面の天空ジオメトリ（lunar_service::LunarConstellation と topocentric、lunar::selenographic_to_mcmf）と合成します。幾何も放射計測も再導出しません。地球の <c1/> 種別とは異なり、信号側は固定の受信電力ではありません。衛星ごとの等方受信電力は、その衛星自身のリンクバジェットの EIRP − FSPL（斜距離）なので、J/S は月面での距離と仰角に応じて衛星ごとに変わります。可視の（エポック、衛星）リンクごとに一行を、JSON と *.table.csv 成果物として出力し、J/S の差のもとになる二つの受信電力を並べて記載します。集計した性能指標はその表の横に置き、表の代わりにはしません。<c2/> シナリオ種別として実行できます

seg-2a4393ae7c52 = リポジトリ内の独立したコード経路に対する合成のクロスチェック：リンクごとの J/S はすべて、linkbudget::received_signal_power_dbw で計算した二つのリンクバジェットの差として再導出します。その自由空間損失は、jamming::free_space_path_loss_db が使う三項の和ではなく、{ "20" }·log10(4πRf/c) という単一の式です。両者はすべての行で < { "1e-9" } dB 以内で一致します（実測の最悪値は { "7.11e-14" } dB、つまり浮動小数点の丸め誤差）。合成の基盤にある干渉チェーンは、tests/gnss_denied_jamming_resilience_reference.rs で別途外部に裏付けています（独立した numpy/scipy による J/S と実効 C/N₀ の再導出を Kaplan & Hegarty §{ "9.4" } に固定し、JammerTest { "2024" } の測定 C/N₀、Zenodo 10.5281/zenodo.15910563 も使用）。合成している月面の幾何は、それ自身のオラクルを持つ lunar_service/lunar の幾何です。ここで確認した閉形式の恒等式：ジャマーの距離を半分にすると、すべての行にちょうど { "20" }·log10({ "2" }) dB が加わる。J/S はユーザーアンテナのボアサイト利得に対して厳密に不変で、C/N₀ はちょうどその利得だけ動く。仰角マスクは、残る行をビット単位で変えない。この行自体は ReferenceImpl/モデル計算のままです：検証の対象となる、測定した月面ジャミングキャンペーンはなく、コンステレーションは飛行したエフェメリスではなく、例示用の公開情報に基づく Moonlight/LCNS クラスの幾何です

seg-4c116e25c5c5 = 測定した C/N₀ のばらつきによる不確かさの帯を持つ月面の拒否コンター

# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = <c1/> レポートは、拒否コンターを一つのスカラーに依存しなくなりました。衛星ごとの表にわたって、測定した目的信号 C/N₀ の完全な分布を出力します：n、min、p05、p25、median、p75、p95、max、mean、標本標準偏差、そして標本自身の非対称性 (p95 − median) − (median − p05)。これは、変更のないリンクごとの行の横に載せます。コンターはその後、これらの各順序統計量で、エンジンが認める両方の拒否基準のもとで報告され、どちらか一方で代用することはありません：従来の電力比基準（J/S = { "30" } dB。attack_surface と tracking_loop が使うのと同じしきい値で、公開済みの月面リンクジャミング表の <c2/> 列の背後にある基準）と、ロック喪失基準（実効 C/N₀ が tracking_threshold_dbhz まで低下すること。このレポート自身の links[].status 列の採点に使う基準）です。各コンター点は拒否平面の両方の軸で与えます：シナリオの離隔で必要なジャマー EIRP と、シナリオの EIRP での拒否離隔です。そのため、帯はコンタープロットを描く軸と同じ軸上の区間になります。帯の端は contour(p05) と contour(p95) です：標本自身の分位数に同じ閉形式の写像を適用したものであり、標本にフィットしたσでも、median ± k·stdev でもなく、レポートは数値の横の band_definition 文字列でそのことを明記します。stdev は連続性のために出力されますが、何にも使われません。C/N₀ がすでに追尾しきい値以下の分位数には、有限の拒否 J/S がありません。その列は、無限大や切り詰めた半径としてではなく、数えた理由を付けた null として出力します

seg-f7457156f960 = エンジン自身の順方向関数に対する内部整合性であり、この機能が誠実に主張できるのはこれだけです。コンター点はすべて閉形式の逆算であり、各逆算は、その答えを、レポート自身の行を採点した順方向関数に通し直して確認します：J/S の列は jamming::effective_cn0_dbhz を通して（tracking_threshold_dbhz を < { "1e-9" } dB-Hz 以内で返さなければならない）、離隔の列は jamming::free_space_path_loss_db と jamming::j_over_s_db を通して（同じ J/S を < { "1e-9" } dB 以内で）、EIRP の列はシナリオ自身の離隔での jamming::j_over_s_db を通して確認します。コンターは、拒否集合の内側の点ではなく境界であることも確認します。lock_status は厳密な不等式でロックを失うため、判定が、コンターの両側 { "1e-4" } dB の J/S にわたって DEGRADED から LOST へ切り替わることを測定しており、イプシロンずれのあるコンターはこれに失敗します。最も強い確認は分位数ごとではなくリンクごとです：すべての行自身の C/N₀ に同じ写像を適用すると、レポートの status 列が正確に再現されます。文書化された動作点（kind = lunar-jamming、jammer.range_m = { "25 000" } m 以外のすべての入力は既定値）で、{ "38" } 行中 { "38" } 行について不一致は { "0" } 件で、{ "26" } 行が LOST、{ "12" } 行がそうではありません。単調性は仮定せず測定しています：[tracking_threshold + { "1e-3" }, { "80" }] dB-Hz にわたる { "20 001" } サンプルで、厳密に減少する離隔と厳密に増加する必要電力への違反は { "0" } 件であり、帯の分位数の順序は、主張ではなく実証されています。ExternalDataset は不採用とし、したがって検証済みとはしません：拒否半径と比較できる、測定した月面ジャミングキャンペーンはなく、コンステレーションは飛行したエフェメリスではなく、例示用の公開情報に基づく Moonlight/LCNS クラスの幾何であり、コンターの入力（EIRP、ジャマー電力、アンテナ利得、雑音温度）は代表的な大きさです。ReferenceImpl も検討のうえ不採用としました。逆算と順方向の式は、同じ代数を二方向から読んだものであり、往復で捕まえられるのは転記ミスと符号の誤りであって、独立した実装ではないためです。これをクロスチェックと呼ぶことは、マトリクスの不変条件が防ぐためにある、独立性の借用にあたります。帯が何をもたらすかは、主張ではなく測定して示します：その動作点では、単一スカラーのコンターは { "27.402916" } km で、{ "38" } 行すべてについて { "25" } km を拒否される側に置きますが、帯 { "21.256108" } .. { "29.921360" } km は動作点を含むため、表が実際に示す分かれ方を報告します。二つの基準が一致しないことも測定しています。電力比の帯（{ "38.186527" } .. { "53.691675" } km）は { "25" } km をまったく含まないため、両方を出力します

seg-2d3944107ba0 = クロスモダリティ・インテグリティモニターの検出力

seg-38bc7c0bfe57 = hybrid-optical-rf レポートは、クロスモダリティのカイ二乗モニターが実際に検出できるものを示します。故障のないケースに合格するということだけではありません：シナリオに記載した誤警報確率と見逃し確率での、監視する軸ごと（東、北、上、時計）の最小検出可能バイアス、その前後の検出力曲線、雑音のない状態で統計量が初めてしきい値を超えるバイアスの倍数、記載した変化率のバイアスランプに対する検出までの時間。故障は実際のモニターを通しても注入され、返された統計量を解析予測と並べて報告します

seg-b6b8dec4dcff = 二つの内部オラクルがあり、外部データセットはありません。({ "1" }) 閉形式のラウンドトリップ：最小検出可能バイアスは、非心度に関する非心カイ二乗の裾を逆算して求め（raim::pbias）、得られた非心度を、モニター自身のしきい値で raim::noncentral_chi2_cdf に戻して確認します。これは P_md を返さなければなりません。({ "2" }) 注入と解析：一つの軸の RF 推定値にバイアスを書き込み、cross_raim::run_cross_raim を再実行するため、解析的な非心度と比較する統計量は、再導出ではなく、モニターが計算したものです。統計量そのもののシード付きモンテカルロは、三つ目の確認としてテストに含めていますが、レポートには意図的に含めていません。標本からの推定は遅く、ビット単位で再現できないためです。ExternalDataset は不採用です：この量は、このシナリオのσの配分での、このモニターの検出力であり、MDB を拡縮するσの大きさは測定値ではなく、モデル計算に基づく代表的な入力です。ReferenceImpl も検討のうえ不採用としました。モンテカルロは、解析が記述するのと同じ統計量をサンプリングするため、転記ミスと係数の誤りは捕まえられますが、モニターの独立した実装ではありません。{ "0.30" } 第{ "2" }ラウンド（事前登録 0135a9e4）、保留（MODELLED のまま）：SciPy { "1.18.1" } の chi2/ncx2/brentq が、五つの構成について、レポートのしきい値（{ "5.4e-12" } 以内）、軸ごとの MDB、検出力曲線、通過倍数、ランプの検出までの時間（{ "5.3e-10" } 以内）を再現しました。注入した故障の統計量には独立したオラクルがなく、σの大きさはモデル計算に基づく入力であるため、範囲の設定は所有者の判断待ちです

seg-38cabd4921c1 = ハンドオーバー後の共分散の再増大とアラート限界

seg-9287268bbada = hybrid-optical-rf レポートは、フィルターのプロセス雑音モデルを公開し、ハンドオーバー後の解がアラート限界の内側にとどまる時間を示します：両方のハンドオフ方向について、ハンドオーバーが残した軸ごとの共分散を持ち、記載したランダムウォークのプロセス雑音のもとで前方に伝搬し、カバレッジで拡縮した 1σ が水平、垂直、タイミングの各アラート限界に達する時刻、どの限界が先に効くか、分散の倍増時定数、そして通過をはさむサンプリングしたコースティングプロファイルを報告します。プロセス雑音の PSD、カバレッジ係数、アラート限界は、いずれも文書化された既定値を持つ入力です

seg-c85b822227f3 = 外部オラクルはありません。通過時刻はランダムウォーク分散増大の閉形式の解であり、テストは、エミッターの内部ではなく、レポート自身が公開する値から独立にこれを再計算します。開始時の共分散は、既存のハンドオフブロックがすでに報告したトレースにビット単位で固定しているため、コースティングが、誰も見ていない共分散を伝搬することはありません。プロセス雑音の PSD は MODELLED の代表的な入力であり、通過時刻はそれに比例して直接変わります。これは、スケーリングテストが、主張ではなく測定された性質として述べています。ExternalDataset は意図的に不採用としています：コースティング時間は、二つのモデル計算による PSD と、それ自体が代表値であるアラート限界の直接の関数であり、比較できる、測定された月面の光／RF ハンドオーバーのコースティングはありません。ここでの外部オラクルには、プロセス雑音モデルを明記した、同等の受信機についての、公表されたハンドオーバー後の共分散増大曲線またはホールドオーバー精度の曲線があり、それを許容差まで照合している必要があります

seg-a3b8272862aa = 月面ジオメトリのエクスポートにおけるオフボアサイトのアンテナパターン

seg-27d246503a48 = 衛星ごとのジオメトリのエクスポートは、（エポック、衛星）ごとに、衛星側でのオフボアサイト角と、実際の一様照射円形開口（Airy）パターンからの地点方向への送信利得を持ち、そのパターンでのビーム内の数を、対称な利得とビーム幅の近似（θ_3dB[deg] = √(31000/G_lin)）でのビーム内の数と並べて報告します。その差は、リンク数、エポックあたりの衛星数、最悪の単一エポックとして、明示的な補正として出力されます。この近似が暗に含む開口効率は二つとも出力されます（引用元の { "70" }·λ/D 度の規則に対して { "0.641" }、一様円形開口に対して { "0.920" }）。そのため、近似が黙って仮定している効率は、推測ではなく明示されます。既定では無効です：このブロックが現れるのは、エクスポート地点と開口の両方が与えられたときだけです

seg-f7f79e2dd6c5 = 混在しており、プールせずに分けています。基盤となるパターンは、外部の参照と照合して確認済みで、独自の行を持ちます（tests/validate_p1_orbital_footprint.rs の scipy.special.j1 フィクスチャーで < { "0.05" } dB、加えてここでは、公表されている Airy 半値電力の横軸 x = { "1.61634" } を、仮定せず二分法で求めています）。幾何は、検証対象の内積とは別の式で書いた、閉形式の三角法と照合しています。近似円錐による実ビームの包含は導出した代数であり（28.019/√η 対 λ/D あたり { "29.479" } 度）、したがって補正は η ≤ { "0.9035" } の場合にのみ非正になります。しかし、ビーム内の数そのものには外部オラクルがありません：Moonlight/LCNS クラスのシェルの衛星のうち、南極地点を、ある口径のアンテナの半値電力ビーム内に捉える衛星の数を示す公表された表はなく、コンステレーションは飛行したエフェメリスではなく、例示用の公開情報に基づく近似です。したがって、文書化された動作点で測定した不一致（実パターンではビーム内のリンクが { "0" } 件、近似では { "28" } 件、エポックあたり −{ "2.33" } 機、最悪のエポックは { "3" }、評価したリンク { "76" } 件）は、近似についての MODELLED の所見であり、回帰用のリテラルとして固定しています（最も近い行は、どちらのビーム端からも { "0.069" }° 離れており、最終桁の不一致より四桁大きい）。外部で検証したカバレッジの数値ではありません。パターン自身の外部の拠り所を根拠に、この行に ExternalDataset のラベルを付けることは、借用した検証にあたり、マトリクスの不変条件が防ぐためにある行為です。{ "0.30" } 第{ "2" }ラウンド（事前登録 d9755d28）、保留（MODELLED のまま）：SPICE の幾何と SciPy のベッセル関数が、飛行した周回機の状態と、文書化された動作点の { "6 336" } 行で、オフボアサイト角（最大 { "3.0e-5" } deg）、Airy 利得、ビーム内フラグを再現しました。ただし、飛行した幾何ではフラグが衛星の識別によって分かれ（最も近いリンクはビーム端から { "1.66" } deg）、{ "5" } deg の可視性は数値の仰角ではなくフラグとして確認され、対称近似のフラグは、規則を検証することなく、検証済みの角度に 31000/G の経験則を適用しており、暗に含まれる効率にはオラクルがありません。範囲の設定は所有者の判断待ちです

seg-6fbfa234ef3e = 干渉下でのトラッキングループのロック喪失とスプーフィングの引き込み

# c1: tracking-loop
seg-f78c1f28a3f7 = 電力比ではなくループダイナミクスから計算するロック喪失：搬送波（Costas）と符号（ノンコヒーレントの早期／遅延）の 1σ 熱ジッターを、二乗損失を含めて C/N₀ に対して求め、記載した規則 3σ_PLL + θ_e ≤ { "45" }° と 3σ_DLL + ランプ遅れ ≤ d/2 チップと照合します。脱落と再ロックの C/N₀ しきい値は、支配するループを明示して示し、ヒステリシスは、主張するのではなく、より広い引き込み帯域幅から導出します。確認の滞留時間を持つ二しきい値のロック検出器から得られる、宣言されたロック喪失までの時間は、物理的な位相脱出時間（サイクルスリップ間の Viterbi 平均時間。数百桁にわたるため log₁₀ s で表示）とは別に報告します。被害側のループが追従できる最大の符号スルーと搬送波ドップラーレート。そしてループダイナミクスが示す拒否半径は、既存の電力比の半径と並べて報告し、符号付きの差を専用の名前付きフィールドとして示します。<c1/> シナリオ種別として実行できます

seg-c3794c8d85c5 = エンジン自身の sdr コリレーター（sdr::correlate / synth_if / CaCode）を、較正した C/N₀ のシード付き合成 IF 上で前進させます。これは、代数的なジッターの式ではなく、サンプリングした IQ の数値相関によって同じ数値に到達する別のコード経路であり、言い換えではなく別の経路です。加えて、サイクルスリップ項には、標準の表にある修正ベッセル I₀ の値を使います。ループ理論は Kaplan & Hegarty ch. { "8" } に従い、スリップ時間は Viterbi と Gardner に従います。この行は ReferenceImpl/MODELLED のままです：クロスチェックは同じコードベース内にあり、bessel_i0 の確認が検証しているのは一つの特殊関数であって追尾モデルではないため、これを根拠にこの行を引き上げるのは、自己に都合のよいラベル付けになります。ExternalDataset には、真値の C/N₀ とロック喪失の瞬間を注釈した、記録された生の IF データセット（TEXBAT/OAKBAT クラス）が必要ですが、このツリーにはありません。また、IQ があっても、それらのデータセットはエポックごとのループ状態の真値を公開していないため、宣言されたロック喪失時刻は、別の受信機のロック検出器に対してしか検証できず、これはモデルに基づく選択であってオラクルではありません。ループ帯域幅、積分時間、コリレーター間隔、引き込み比、滞留時間、ジャマー電力、アンテナ利得は、データシートではなく、代表的な帯の数値です。{ "0.30" } 第{ "2" }ラウンド、GNSS-SDR { "0.0.19" }（GPL-3.0、プログラムとして実行）を独立に生成した IF に適用（事前登録 6ef7698c、測定方法の修正は開示済み）、所見（MODELLED のまま）：閉ループの PLL と DLL のジッターは、{ "35" }〜{ "45" } dB-Hz で { "8" } % 以内、{ "10" } Hz/s の動的ストレスは { "1" } % 以内、一次の符号ランプ遅れは { "2" } % 以内で一致します。{ "30" } dB-Hz では、PLL のジッターが { "21" } % 高く、DLL のジッターが { "32" } % 低く、測定した 15-degree-rule のしきい値はエンジンより { "1.5" } dB 上にあり、二次ループは、一次のスリップ時間の上限より { "0.5" }〜{ "2" } 桁多くスリップします。{ "0.30" } の改訂：Costas のスリップ時間は、ループ SNR rho/4（半サイクルのスリップ）を使うようになりました。既定の jitter_table の log10_mean_time_to_cycle_slip_s は、{ "25.47" } dB-Hz のしきい値で { "11.58" } から { "2.10" } に下がります

seg-69155fb79ebd = 追尾スケジュールからの月面 VLBI の局座標共分散

# c1: lunar-vlbi-fim
seg-141285301f58 = 基線 × エポックのスケジュールにわたって遅延の偏微分を積算してフィッシャー情報行列とし、これを逆行列にして局座標の共分散と座標ごとの局σを求めます。スカラーの遅延精度から仮定した等方の等分配リンクの代わりになります。状態は地球固定（ITRS）の局座標を持つため、ヤコビアンは慣性系の偏微分を各エポックの GCRS→ITRS 行列で回転させたものであり、地球の自転がそれらの座標を観測可能にします。レポートは、地球固定の視線方向の掃引とビーコンの赤緯を、仮定せずに測定します。ランク、データム欠損、条件数、情報スペクトル、自由ネットワークの零空間は、すべての実行で出力され、ランク落ちの場合、代表のσは、ほぼ特異な逆行列から読み出すのではなく、ステータス付きの NULL として公開します。同じスケジュールでの等分配の値 c·σ_τ·√(g/N) は、計算した値と並べて比とともに出力され、AM-HM により厳密な下限となる等方なトレース限界 √(p/trace(M)) も併せて出力します。<c1/> シナリオ種別として実行できます

seg-b259d4d18f42 = リポジトリ内の独立した経路。ヤコビアンの各行は、状態自身の地球固定座標と月固定座標から、座標系チェーンを通して前方に回転させて評価した lunar_vlbi::vlbi_delay_s の中心有限差分で再導出します。これは、微分を計算せず、解析的な偏微分と式を共有しない経路であり、二つの経路が構築する情報行列は、最大の対角成分の < { "1e-6" } 以内で一致します。これが合成する線形代数カーネル（information_matrix、crlb、sym_eig）は、tests/fim_observability_reference.rs で numpy.linalg.eigh / numpy.linalg.inv に対して別途外部に裏付けており、遅延観測量は lunar_vlbi 自身の delta-DOR 遠方界オラクルを持ちますが、この行はどちらのステータスも借りていません。ここで確認し、そのように明記した閉形式の恒等式：σ² と 1/N のスケーリング、および、計算したσが下回れない AM-HM の下限としての √(p/trace(M))。これは、等方な幾何でのみ等分配の値と一致するため、測定した比は、仮定が捨てた異方性にほかなりません。{ "0.30" } 外部比較（ライブラリ：spiceypy { "8.2.0" } 経由の NAIF SPICE CSPICE N0067、MIT、DE440、ITRF93 earth_latest_high_prec、MOON_PA）、エンジン側のモデル誤差感度の実行とともに事前登録（{ "50863551" }）：ヤコビアンの各行は、SPICE の幾何から収束させたニュートン力学の光行時間差の中心差分で再構築し（光行時間の方程式は SPICE の位置に対する短いスクリプトで、幾何は SPICE が持ちます）、スケジュールは SPICE の仰角から再構築しました。スケジュール、ランク、欠損、情報スペクトル、条件数、局のσ、代表値、トレース限界、等分配の比、自由ネットワークの零空間、視線方向の掃引、ビーコンの赤緯は、事前登録した { "1" } % / { "0.1" } deg 以内で一致し、これはエンジンの既知の解析的な月のずれ（σで { "3.2e-3" }、実行前に測定）より上にあります。NumPy { "2.3.5" } が、コミット済みのエンジンのヤコビアンで線形代数を { "2e-13" } までやり直しました（P2）。記載した例示用の入力での、記載した縮約パラメーター集合に対するクラメール・ラオ限界として、独立した参照と照合して確認済みです。月の中心のエフェメリス、時計、対流圏、地球の向きのパラメーターは、どちらの側でも固定されているため、実際のキャンペーンの精度ではありません

seg-0f4d023fe2d4 = VLBI 遅延スケジュールからの月面地点の座標共分散。地球局のものとは別に保持

# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = 三つ目のデータム選択肢である <c1/> は、すべての地球局を固定し、ビーコンの月固定座標だけを推定します。地球局の座標は遅延モデルの入力であって未知数ではないため、これが月面地点の不確かさが実際に示される構成です。これが存在するのは、局レベルの共分散と月面地点の共分散が、レバーアーム ρ/B で隔てられた別の量であり、これまで一方を他方に対して引用することを妨げるものがなかったためです。出力される <c2/> ブロックは、ρ、最長の基線、レバーアーム、等分配リンクの月面地点形式 c·σ_τ·(ρ/B)·√(g/N)、計算した座標ごとのビーコンσ、およびその比を持ちます。ビーコンを推定しない場合や行列がランク落ちの場合、この比は、誤解を招く値ではなく null になります。B は、存在する最長の基線、つまり最も有利なものを採るため、比は過小評価にしかなりません。<c4/> を伴う <c3/> として実行でき、ビーコンを推定しない場合は、欠けている入力を示すメッセージとともに拒否されます

seg-18096ae23d96 = 閉形式の恒等式であり、外部オラクルは主張しておらず、利用できるものもありません。レバーアームは ρ/B と、二つの等分配形式は互いに { "1e-15" } まで照合しています。これらは代数的な恒等式なので、配線の誤りしか捕まえず、そのように明記しています。実質的な結果は、主張ではなく測定したものです：固定基線からの遅延はビーコンの方向を拘束するため、視線方向の成分は近傍界の距離項を通してのみ情報行列に入り、テストは、その結果の異方性を、導出するのではなく、出力されたスペクトルから読み取ります。AM-HM により √(p/trace(M)) は厳密な下限になるため、等方な等分配のリンクは過小評価にしかならず、計算値の等分配に対する比は、それが捨てた異方性にほかなりません。弦が { "10726.748" } km の Goldstone 類似／Canberra 類似のペアで測定：サンプリングした { "112" } 日のうち、{ "10" }° のマスクで相互に可視のエポックがまったくない日が { "36" } 日、相互に可視となる最大は 49 サンプルのスケジュール中 { "17" }、実行可能な { "73" } 日では、三成分の比は { "113.9" }× から四桁多い値まで、中央値は { "1513" }× であり、視線方向が飢餓状態にならない二つの横方向に限ると { "3.94" }× から { "25.8" }×、中央値は { "7.8" }× です。この行が主張しないこと：これらの数値のいずれも、実際のキャンペーンの性質として主張しません。示すのは、月面地点の量が仮定ではなく計算されるようになったことと、局レベルのものと黙って取り替えることはできないことです。ReferenceImpl/MODELLED のままです：検証の対象となる、公表された月面 VLBI の地点共分散はなく、局とビーコン地点は測量したものではなく例示用であり、エフェメリス、時計、対流圏、地球の向きのパラメーターは固定されているため、これは縮約パラメーター集合に対するクラメール・ラオ限界であり、それ自体が楽観的です。カーネル経路（DE440 の月上のビーコン）での同じ量は、専用の行「…、カーネル経路」で確認済みであり、この解析経路では、最小のビーコンσがその行の SPICE オラクルより { "3.9" } % 小さく、これがこの行が MODELLED のままである理由です

seg-8958521eedf7 = VLBI 遅延スケジュールからの月面地点の座標共分散、カーネル経路

# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = lunar-vlbi-fim シナリオの全局固定のビーコン共分散（地球局をすべて固定し、ビーコンの月固定座標だけを推定）。ビーコンは、エンジン自身のカーネルリーダー（planetary_kernel_path；lunar_vlbi_fim::epoch_geometry_with、ephem_provider::KernelEphemeris）で読み込んだ JPL DE440 の月上に置きます。解析経路と異なるのは月の中心だけで、IAU { "2015" } の天体回転、局、地球の自転、線形代数は同じです。独立した参照と照合して確認済みの出力は、既定のスケジュールでの観測集合、{ "3" } x { "3" } の情報スペクトル、ランクと条件数、三つの月固定のビーコンσとその RMS、レバーアーム、計算値の等分配に対する比です。datum = "all-stations-fixed"、estimate_beacon = true、planetary_kernel_path を設定した <c1/> シナリオとして実行できます

seg-63250578ec6b = 拘束力のあるライブラリ側：NAIF SPICE Toolkit N0067（spiceypy { "8.2.0" }、MIT）を、de440s、earth_latest_high_prec（UT1 と極運動を含む ITRF93）、DE440 の月座標系で使用し、ビーコンは MOON_ME に固定。ヤコビアンの各行は、収束させたニュートン力学の光行時間差の { "3" } km の中心差分であり（M069 オラクル自身の光行時間コードをインポート）、Kshana の偏微分は使いません。可視性は WGS-84 の仰角から再構築し、NumPy { "2.3.5" } / SciPy { "1.18.1" }（BSD-3-Clause、LAPACK）の eigh と inv を使います。P2 側：エンジンのコミット済みヤコビアンに対する NumPy。フィクスチャーやオラクルが存在する前に事前登録し（4a51256）、基準は固有値、条件、σ、RMS、比で { "1" } %、レバーアームで { "1e-4" }、観測集合とランクは完全一致、P2 は { "1e-9" } です。開示事項：解析的な月とカーネルの月のエンジンのみの比較（y のσで { "3.9" } %）は、カーネル経路を選ぶために事前登録の前に実行し、事前登録に記載されています。結果：両側が一致し、最大で { "1.7e-3" }（ビーコンの y のσは { "0.081211" } m に対して { "0.081351" } m）。ミューテーション：ビーコンの偏微分の天体回転を転置すると、両側とも失敗します。両側が DE440 を読むため、一致が検証するのは DE440 上での幾何と線形代数であり、DE440 の検証ではありません。主張の範囲外：実際のキャンペーンの地点精度（時計、対流圏、地球の向きは固定、局とビーコン地点は例示用）、および解析的な既定の経路（上の行。MODELLED のままで、解析的な月では y のσがこのオラクルより { "3.9" } % 小さい）

seg-0315968c8214 = 月面ディファレンシャル PNT：補正リンクの残差予算

seg-c6785166a44c = 差分補正が、計算されたエポックと使われるエポックの間に拾う三つの項。これまでは、モデル化しない余裕として残されていました：基準局の測量誤差（衛星間で相関し、基線に依存せず、~{ "1" }:{ "1" } の位置の伝達で、DOP で増幅されないことが証明されている）、補正の経年（凍結した軌道誤差ベクトルを、エンジン自身の伝搬器が一つ後の遅延で衛星を置く視線方向に再投影したものに、較正したべき乗則からの c·σ_y(τ)·τ の時計ドリフトを加えたもの）、および ±(orbit_err + clock_err) のフルスケールにわたる一様なリンクの量子化（分散は step²/12）。距離領域と位置領域の両方で、既存の残差と保護レベルの横に（代わりにではなく）報告し、単一の数値の横にレイテンシ曲線を添えます

seg-29b8e6c12471 = 閉形式の恒等式と自己整合性：一様量子化器の step²/12 の分散、等しいσでは σ·PDOP に帰着する厳密な (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ の共分散伝搬、û_user ≈ û_ref の帰結としての測量項の { "1" }:{ "1" } の伝達、そしてスイッチオフ時の二乗和の閉じ方。orbit::dop に対する PDOP のクロスチェックは [−û, { "1" }] の正規行列を共有するため、独立したオラクルではなく、整合性の確認であり、そのように明記しています。利用できる ExternalDataset はなく、主張もしません：測量精度が公表されている月面局はなく、公表されたレイテンシやメッセージ形式を持つ月面の差分補正リンクもなく、量子化の結果は測定ではなく閉形式です。RTKLIB は、一重差分と重み付き最小二乗カーネルの外部コードのオラクルとして既に使っていますが、意図的に測量を誤らせた基準局で動かして { "1" }:{ "1" } の測量の伝達を確認できる一方、それは同じ一次の視線方向代数に対する独立したコードです。数値の大きさはモデル計算によるもの（MODELLED）です：測量の既定値は、測定した局ではなく、このクレート自身の月面座標系実現の割り当てであり、レイテンシとビット数はILLUSTRATIVEの入力で、放送エフェメリス誤差ベクトルそのものの増大は一切モデル化していません。これは、実際のリンクで支配的になる可能性が最も高い項であるため、出力される経年の法則の文字列に明記しています

seg-c42646ae4707 = 月面基準局のカバレッジと精度のマップ

# c1: lunar-station-coverage
seg-1f9834b32629 = 南極のユーザーグリッドと一日分のエポックにわたる、月面ディファレンシャル PNT モデルのモンテカルロ掃引（<c1/> 種別）：既知の南極地点にある差分基準局について、点ごとと領域全体で、補正後と補正前の位置誤差（3-D、水平、垂直）のパーセンタイル、利用不可のエポックごとに理由（user_lt4、station_missing_sat）を付けた可用性、実行前に定めたしきい値に対するカバレッジ、DO-229E の保護レベル、方位セクターごとのカバレッジ半径、局と最悪点での補正リンクバジェットを求めます。実在のどのシステムの性能についても述べるものではありません。いかなる機関とも提携しておらず、承認も受けていません

seg-2308d94fa25e = 独立した numpy スクリプトによる、エクスポートしたケースでの算術の再計算（scripts/gen_lunar_station_ref.py、numpy { "2.5.4" }；tests/fixtures/lunar_station/PREREGISTRATION.md に事前登録、最初の実行の前に 9caedf97 で単独コミット）：すべての誤差項を有効にした { "20" } ケースで、可視集合とステータスは同一、生の距離誤差は { "1.4e-14" } m まで一致、位置誤差のベクトルと大きさは { "1e-6" } m の基準に対して { "1.4e-9" } m まで一致し、各点の p95 は numpy.percentile とビット単位で一致します。局の補正は { "1e-9" } m の基準に届きませんでした（最大 { "3.73e-9" } m、{ "20" } ケース中 { "15" } ケース）。それに伴い補正後の距離誤差も同様です：60桁の算術で確認したところ、どちらの側も厳密な値に対する倍精度の丸めの範囲内で、測量項は二つの { "1e7" } m の距離の差であり、その最終桁の単位は { "1.86e-9" } m です。記録しており、調整はしていません。この種別は、一点、一エポック、一試行では、lunar-differential-pnt 種別に厳密に帰着します。誤差モデル、相関消失モデル、すべてのしきい値は、このプロジェクト自身のものかILLUSTRATIVEであり、ここにあるものは実在のどのシステムについても述べるものではありません

seg-7ecf4b0038b0 = 記載したプロファイルまたは極域 DEM からの月面地形の地平線マスク

seg-7102948907bc = lunar-station-coverage 種別（基準局とすべてのユーザー点）と、moonlight-service-volume のグリッドおよびその衛星ごとのエクスポート地点（各エクスポート行に clears_terrain が加わる）に対する、地点ごとの方位依存の地平線マスク。{ "0.36" } のスカイライン表形式（skyline::Skyline、方位に対して線形で { "360" } deg で折り返し。ある地点での記載したプロファイルと DEM の地平線は、点ごとの最大値として合成）：出典を付けて記載した [terrain] の station_horizon または user_horizon、および／または、南極ステレオ投影の DEM（LRO LOLA のグリッド化された極域レイアウト。サイズと SHA-256 を固定する記述子から読み込むか、SHA-256 を添えて返される、[terrain] の dem_tile_path による緯度／経度の realdata::lola_dem タイル）上で、月の球面の大円に沿って、厳密な曲率で、記載したマスト高、記載した方位ステップと範囲でレイマーチングして求めた地平線。衛星は、平坦な mask_deg とその方位での地平線の両方を越えたとき、その地点で数えられます（lunar_service::topocentric）。平坦なマスクでは四機となる点で、地平線によって四機未満になるエポックは、利用不可の理由 terrain_masked として数えます。同梱の DEM は、パブリックドメインの LOLA LDEM_75S_240M 製品の切り出しで、{ "5" } x { "5" } のブロック平均で { "1200" } m にリサンプリングしたものです（data/lunar-dem/NOTICE.md）。指定がなければ、すべての地点は平坦なマスクを保ち、すべてのドキュメントはバイト単位で同一です

seg-dd838d199a0d = 閉形式の曲面（InternalConsistency）：球面のみの俯角、球面上の台地にあるクレーターとその中心上および中心外の観測者、そして解析的な円錐とそれ自身のラスタライズ。実際の切り出しでは、独立した numpy のレイキャスト（scripts/gen_lunar_terrain_ref.py、numpy { "2.5.3" }；tests/fixtures/lunar_terrain/PREREGISTRATION.md に事前登録、スクリプトが存在する前に edbb9b02 で単独コミット）が五か所で一致します：地点の高さは { "1.0e-11" } m、{ "1800" } 件すべての地平線仰角は { "5.5e-10" } deg まで、基準 { "1e-6" } に対して一致し、打ち切られたレイの数は完全一致です。これが確認するのは算術であり、地形ではありません。公表されている極域の地平線や日照の数値は再現していません：同梱の { "1200" } m の切り出しは、公表された日照研究が解像する、キロメートル未満の起伏を平滑化するため、DEM の地平線は、リサンプリングした実際の DEM 上の MODELLED の見通し線であり、検証済みの地平線ではありません。局の地点とコンステレーションはILLUSTRATIVEのままです。ここにあるものは実在のどのシステムについても述べるものではありません

seg-d37bb01e270b = 月面基準局のマルチパスと受信機ハードウェアの項

seg-1103199f019b = lunar-station-coverage（LRS-02）の任意の [receiver] セクション：ユーザーと局での仰角依存のマルチパス sigma(el) = a + b exp(-el / el0)（RTCA DO-229 の航空機用の関数形で、既定値は a = { "0.13" } m、b = { "0.53" } m、el0 = { "10" } deg。月面ではすべての値がILLUSTRATIVEです）、ユーザーではホワイト、局ではエポックにわたる一次のガウス・マルコフ（rho = exp(-dt / tau)）。早期−遅延の DLL 熱符号雑音 sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0)))。ユーザーと局での、試行中は一定のチャネル間バイアス。局の項は局の補正に入り、ユーザーの項は生の測定値と補正後の測定値に入り、それぞれ専用のシード付きストリームを使います。指定がなければ、すべてのドキュメントは変わりません

seg-4fbc7d86b491 = 閉形式とモデル自身の抽選の統計（InternalConsistency）：手計算に対する DLL の式、DO-229 の形、二つの受信機のゼロ基線差分、ガウス・マルコフの lag-1 相関。比較できる月面のマルチパスや受信機の測定はなく、値はILLUSTRATIVEであり、ここにあるものは実在のどの受信機についても述べるものではありません

seg-03796cb741b6 = 補正レイテンシにわたる月面基準局のエフェメリス誤差の増大

seg-13b0ae9a874a = lunar-station-coverage（LRS-03）の任意の orbit_err_growth_m_per_s 入力：計算から latency_s 後に適用される補正は、放送軌道誤差の増大 g latency_s を取りこぼします。g は 3-D RMS レートの等方的なもので、衛星と試行ごとに専用のシード付きストリームから抽選します（距離の 1-sigma レート tau / sqrt({ "3" })）。これは、凍結誤差の視線方向への再投影に加えて行います。指定がなければ、すべてのドキュメントは変わりません。公表された主張との比較への K5 の補遺は、単独で事前登録され、K5 を { "0.001" }、{ "0.01" }、{ "0.1" } m/s で実行します（ILLUSTRATIVE）

seg-332ceb320b65 = 増大項の閉形式のσと、一次の伝搬の確認（InternalConsistency）。K5 の補遺（tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md、59d88248 で単独に事前登録）：K5 はすべてのレートで不成立で、補正後の p95 3-D は { "369.8" } m、{ "2315" } m、{ "22797" } m で、基準 { "1.5" } m に対するものです（増大なしでは { "292.96" } m を記録）。これは実行前に述べたとおりです。月面の増大レートを示す公開された出典はありません：ILLUSTRATIVE

seg-90307f07e0ef = 月面基準局の解のモード：高さ拘束、衛星三機、静止ユーザーのウィンドウ

seg-366c7ad03fb2 = lunar-station-coverage（LRS-06）の任意の [solution] セクション：dx = e_h による高さの疑似観測行（指定した 1-sigma を持ち、距離行と重み付けして用いる）、高さ拘束がある場合に限って許容される最少三機の衛星、そして直近の window_epochs エポックにわたる、静止位置を共有しエポックごとに一つの時計を持つ重み付き最小二乗解（同じデータに対してプロセスノイズのない静止位置のフィルターが出す答えに相当し、各エポックの誤差は独立として扱います）。このセクションがない場合、スナップショット解とすべてのドキュメントは変わりません。公表された主張との比較に対する追補で、出典の解のスタイルに合わせたものであり、単独で事前登録しています

seg-bfe05379b7aa = スナップショットの縮約と、ソルバーの閉形式のケース（InternalConsistency）。追補（tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md、001ca100 で単独で事前登録）では、{ "1" } m の高さ拘束、衛星三機、6エポックのウィンドウを用います（ILLUSTRATIVEの設定であり、出典はフィルター、高さ拘束、衛星三機を述べていますが、その設定は述べていません）。K1～K5は不合格、K6は合格で、記録済みの実行どおり{ "6" }件中{ "1" }件です。R300 の補正後 p95 3-D 誤差は{ "280.6" } m から{ "2.11" } m に下がり（水平方向は{ "0.90" } m、採点対象外）、カバレッジは{ "0" }のままです。ウィンドウの独立性の仮定は結果に有利に働きます。実在のいかなるシステムについての記述でもありません

seg-611ba369ed00 = 公表された主張に対する月面基準局の精度とカバレッジ

seg-4fe4f1cffa2b = 月面ディファレンシャル基準局に関する公表資料の公開された前提のもとで実行した lunar-station-coverage 種別（{ "24" }時間の凍結楕円軌道にある航法衛星四機、{ "10" } m の{ "95" } % SISE、{ "0.30" } m のコード雑音、{ "1" }秒と{ "600" }秒の補正遅延、サブデシメートル級の基準局測量、公表されている基準局の設置例、{ "300" } km と{ "600" } km の南極周回円）で、実行前に事前登録した片側の六つの合格基準により、出典の数値的な主張に対して採点しました。基準は、南極全域でのサブメートル級 p95 のカバレッジ（K1、K2）、サブメートル級およびデシメートル級の補正後 p95（K3、K4）、{ "600" }秒の遅延でも維持されるサブメートル級（K5）、基線長{ "10" } km から{ "500" } km にわたって維持される精度（K6）です

seg-eb6d3be85fec = 基準：五件の公開出典の数値的な主張を、URL、取得日、SHA-256、ライセンスとともに tests/fixtures/lunar_station/SOURCES.md に登録し（arXiv:2602.08432v3、IOAG Cislunar PNT Workshop { "2025" } および { "2026" } のスライド、UNOOSA ICG WG-B Lunar PNT、{ "2024" }年6月）、ページ参照付きで tests/fixtures/lunar_station_published/CLAIMS.md に転記しています。合格基準、ケース、入力は、tests/fixtures/lunar_station_published/PREREGISTRATION.md（改訂{ "2" }、05bf9a19、実行前に単独でコミット）で事前登録しました。{ "0.36" } の最初の実行は所見であり（MODELLED のまま）、{ "6" }件の基準のうち{ "1" }件が合格しています。カバレッジは両方の円で{ "0.00" }であり、基準は >= { "0.95" } です。補正後 p95 3-D 誤差は{ "300" } km で{ "280.6" } m、{ "600" }秒の遅延で{ "293.0" } m であり、基準は <= { "1.5" } m です。デシメートル級の基準（K4）は、出典の{ "0.30" } m のコード雑音では合格できませんでした。これはモデルの結果ではなく、出典どうしの食い違いを反映したものです。K6 は合格（比は{ "1.39" }、基準は <= { "1.5" }）ですが、幾何に支配された二つの値の比であるため、非相関化についてはどちらの方向の証拠にもなりません。原因：衛星の軌道要素は公開されておらず、ILLUSTRATIVEとしてツリー内に置いた軌道要素では、ユーザーと基準局が仰角{ "5" }度を超える同じ四機の衛星を共有するのは、エポックのわずか{ "8.2" } %（{ "300" } km）と{ "6.3" } %（{ "600" } km）にすぎず、しかもほぼ特異な幾何です（補正前 p95 は{ "3.8" } km で、出典の < { "10" } m とは大きく異なります）。出典のシミュレーションはフィルター、高さ拘束、共通視界の衛星三機を用いており、スナップショット種別はそれらをモデル化していません。したがって、この比較は公表された「南極全域でサブメートル級」を裏付けも否定もしません。このモデルの結果が、公開されていない軌道に依存することを示しています。実在のいかなるシステムについての記述でもなく、いかなる機関とも提携しておらず、いかなる機関からも推奨されていません

seg-478225d0a8e1 = 月面 ARAIM 保護レベルのカーネル

seg-863690a44f21 = 月面の保護レベルにおける、幾何から共分散への段階（全可視衛星と各単一故障のサブ幾何に対する (GᵀG)⁻¹ を、局所鉛直と水平ブロックのトレースに射影したもの）と、その統計カーネル（Bonferroni 検出器の乗数、各故障仮説のガウス上側確率、そしてインテグリティリスクの配分を保護レベルに対応づける求根計算）を、7点の月面サービス空間にわたって検証します

seg-8191906fc700 = 確立された二つのサードパーティ実装を組み合わせ、いずれもオフラインで実行し、フィクスチャーをエンドツーエンドで再生成してバイト単位で同一であることを確認しました。RTKLIB 2.4.2-p13（T. Takasu、BSD-2-Clause）、コミット 71db0ff の src/rtkcmn.c を -ULAPACK 付きで C ソースからコンパイルしたもので、lsq() → matinv() → ludcmp()/lubksb() は、部分ピボット選択付きの Crout LU で正規行列を反転します。これは kshana が手書きした Gauss-Jordan 法の invert4() とは無関係のアルゴリズムです。numpy.linalg.inv（LAPACK getrf/getri）が、すべての行列を第三の独立した逆行列として再度反転し、RTKLIB と相対で{ "1.112e-12" }まで一致しています。SciPy { "1.17.0" } / NumPy { "2.4.1" }（BSD-3-Clause）は、kshana の Numerical-Recipes の不完全ガンマ級数、二分法による逆関数、200ステップの二分法に対して、norm.isf、norm.sf（Cephes の ndtri/ndtr）、optimize.brentq を提供します。SciPy の直接の sf は、kshana の{ "1" } − Φ とは裾の遠い領域に至る数値的な経路が異なるため、深い裾での桁落ちは、鏡映するのではなく実測されます。鉛直軸は動径方向の単位ベクトル（球形の月における局所鉛直の定義）であり、水平方向の分散は水平ブロックのトレースであるため、東・北の方位角の規約は共有していません。この行が明示的に VALIDATED としないもの：σ_URE、衛星ごとの故障事前確率、例示用の Moonlight/LCNS クラスのコンステレーションは MODELLED の入力であり、与えられたままオラクルに渡しています。また、単一故障 MHSS のインテグリティ方程式の形は、kshana が実装しているのと同じ公表済みの境界から転記したものです。閉形式を共有することは仮定を共有することであるため、この行がカバーするのはその方程式の誤った評価であり、方程式の選択の誤りではありません。サードパーティによる MHSS ARAIM の実装は利用できません（RTKLIB には保護レベルのエントリーポイントがなく、そのような PyPI ディストリビューションは存在せず、Stanford MAAST は MATLAB です）。これが残されたアップグレード課題です

seg-0ec1699f5754 = 公表された参照ベクトルに対する ARAIM MHSS 保護レベル

seg-fbaaf3ad7648 = 多重仮説の解分離による保護レベルの方程式そのもの：コンステレーションごとに時計状態を一つ持つ東・北・上の幾何に対する、全可視衛星と故障モードごとの重み付き最小二乗、サブ解のシグマ、解分離のシグマ、片側の公称バイアス射影、Bonferroni の K_fa しきい値、監視されない故障のリスク配分、そしてインテグリティリスク方程式を解く VPL/HPL。<c1/> シナリオ種別として実行できます

seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup、Reference Airborne Algorithm Description Document v3.1（{ "2019" }年6月{ "20" }日）、付録 D の数値計算例——公表された入力（10衛星2コンステレーションの幾何行列、C_int/C_acc の対角成分、b_nom、P_sat、P_const、LPV-200 の定数）と、公表された出力（VPL { "18.3" } m、HPL { "13.45" } m、EMT { "7.2998" } m、σ_v_acc { "1.3694" } m、K_fa_3 { "5.1083" }、および六つのコンステレーション故障の中間値）、取得日 2026-09-20、出典の SHA-256 は 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7。参照自身が述べる許容差 TOL_PL = { "5e-2" } m で一致しました：VPL { "0.0074" } m、HPL { "0.0437" } m。EMT と σ_v_acc は印刷されている精度まで一致しています。同じサブグループの Milestone { "3" } Report（{ "2016" }）Annex A §A.IX は同じ例を述べていますが、内部で矛盾しています。G の{ "3" }行目に符号の誤り（{ "2019" }年版の文書では −{ "0.7477" } と印刷されているところが +{ "0.7477" }。プラスのままだと、文書自身の σ_v_acc は公表値の{ "1.47" } m に対して{ "0.8690" } m になります）があり、また K_fa_3 は故障モード{ "57" }個で評価されているのに対し、文書は N_fault_max = { "1" }、すなわち{ "12" }と述べているため、EMT は57モードのしきい値に従い、VPL/HPL は従っていません。準拠する実装であっても、その出力のすべてを同時に再現することはできません。幾何の中間値は正確に再現され、保護レベルは実測した不一致として記録されます（VPL { "0.0171" } m、HPL { "0.0842" } m、EMT { "0.4806" } m）。これらは合格の数値から除外しており、それらを吸収するために許容差を広げることはしていません。適用範囲：N_fault_max = { "1" } のみです。複数事象の故障部分集合は、切り捨てるのではなく拒否します。除外、カイ二乗整合性検査、二重計上の再配分の手順は MODELLED のままです

seg-7bfcb5c6a985 = 複数衛星の同時故障仮説を扱う ARAIM

seg-15043111e437 = araim_reference::add_v42_subset_plan：ADD v4.2 の部分集合決定規則（P_THRES、FC_THRES、除去数の少ない順に監視する部分集合）を、ペアから、最大 max_order 個の衛星・コンステレーション事象の同時の組み合わせへ一般化したもので、正確な事前確率 P_no fault prod q_e を持ちます。add_v42_protection_levels_to_order は、その上で ADD v4.2 の保護レベルの経路を実行します（次数{ "2" }は既存の経路と完全に一致します）。raim::araim_subset_raim（オプトイン）：その仮説集合に対する高度な RAIM で、監視される各部分集合はインテグリティリスクの和における一つの (p_fault, T, b, sigma) モードとなり、観測不能な部分集合は監視されないリスクへ移され、予算は監視されないリスクの ADD 配分でスケールされ、故障が検出されたときは正規化した分離が最大の部分集合を報告します。max_order より深い部分集合を必要とする事前確率は、切り捨てずに拒否します

seg-6c6076ea1eee = 内部整合性（InternalConsistency）：MAAST で検査済みの ADD v4.2 の経路への次数2の縮約、事前確率の独立した再導出、そして構成した衛星二機の故障です。ペアを超える MAAST や RTKLIB の実行は行っていないため、より深い仮説集合と、部分集合 RAIM の保護レベルは外部では検査されていません。araim_subset_raim は araim_dual_raim の簡略化（インテグリティと精度に共通の sigma 一つ、時計一つ、単純な正規分布の裾）を共有しており、ADD に準拠したものではありません

seg-48ca01332f8f = ホールドオーバーの性能指標と並べた RAIM

seg-890f1006a75d = clock 種別の任意の [integrity] セクション（clock_integrity::run）：指定した設置場所とコンステレーションのプリセット（geometry::sky_geometry）から、GNSS タイムラインが拒否されていない各インテグリティエポックで、マスクより上の衛星に対し、指定した sigma のシード付きガウス残差と任意で指定したバイアスを用いて、スナップショット RAIM（raim::snapshot_raim：パリティのカイ二乗検定、スロープ保護レベル）を実行します。エポックごとの判定、保護レベル、可用性を持つ別個の integrity_fom ブロックを出力します。拒否されたエポックは外挿せず、利用不可として報告します。ホールドオーバーの性能指標は変わらず、このセクションがない場合、出力はバイト単位で同一です

seg-c2860bf4b562 = 内部整合性（InternalConsistency）：保護レベルは snapshot_raim のものであり、snapshot_raim は RTKLIB に対して専用の行で検証されており、それを同じ幾何で再計算しています。故障なしの挙動と、注入した故障の挙動です。空は代表的なプリセットの幾何（日付付きのアルマナックではない）であり、残差は合成で、sigma、アラートリミット、確率は指定した入力です。実在の受信機の可用性についての記述は、ここには一切ありません

seg-9cbb4ee7588a = 空間・雑音あり・複数ファミリーの地球・月間空間（シスルナー）弧長可観測性

seg-5ebd771deef8 = 平面の四状態ではなく空間の六状態の CR3BP における、地球・月間空間（シスルナー）の弧長可観測性のしきい値を、DRO、L2 ハロー、L2 準直線ハローの各ファミリーにわたって求めます。測定雑音はグラミアンに入り、唯一の正直な基準というものはないため、基準を二つ報告します。一つは公表されているランク基準で、均質な測定 sigma に対して不変であることが証明されています（白色化は可観測性行列にスカラーを掛けるだけで、相対的な特異値スペクトルは変わらず、したがってランク、欠損、条件数も変わりません）。もう一つは推定可能性の基準で、チーフの初期状態の形式的な 1σ 位置不確かさが指定した上限を下回る最初の弧であり、こちらは雑音に応じて動きます。各しきい値は、それが含まれるエポックグリッドの区間を併記します。到達しない基準は理由付きの null になります。平面モードは引き続き既定であり、面外のファミリーは、それを表現できない状態に押し込めるのではなく、平面モードでは拒否されます

seg-046231819882 = 部分ピボット選択付きのガウス消去による独立した行階段形のランクが、六状態のランクの判定をすべて確認します。これは、検証対象の固有値/SVD の経路とコードを共有しない別のアルゴリズムです。これが構成要素とする{ "6" }×{ "6" } の CR3BP 状態遷移行列は、SciPy の変分積分に対する独自の ReferenceImpl オラクルを備えており、ハロー/NRHO の初期条件は、公表されている L2 南側{ "9" }:{ "2" } の Gateway 軌道を再現する修正器から得ています。既存の平方根情報フィルターの経路は、裏付けとしては明示的に数えていません。同じヤコビアンを使い、同じ正規行列に帰着するため、二つの数値計算機のあいだの整合性検査にすぎず、出力される拡張ラベルにもその旨が書かれています。外部の基準には裏付けられておらず、そのため ExternalDataset は STM の行から借用せず、見送っています。しきい値の弧長そのものが、MODELLED のコンステレーション設計、エポックグリッド、そして特異値の許容差に依存しており、特異値の許容差については、測定上、最大{ "40" }倍も変わります。公表されている平面の{ "2.09" }時間は rel_tol = { "1e-6" } で正確に再現され、それ自体が許容差に依存します（{ "1e-4" } で{ "10.25" }時間、{ "1e-8" } で{ "0.42" }時間）。これは軌道ではなく基準の性質です。選んだ地球・月間空間（シスルナー）コンステレーションの弧長可観測性のしきい値を公表している公開データセットはありません。実測結果：空間六状態のしきい値は、L2 NRHO で{ "22.17" }時間、L2 ハローで{ "40.42" }時間であり、公表された主張の導出元である平面 DRO ファミリーには存在しません。ランクは{ "6" }のうち{ "4" }、データム欠損は{ "2" }、固有値は正確にゼロのものが二つあり、どのような弧長でも回復できない構造的な欠損です

seg-e250321394bc = 運用形式の地球姿勢予測誤差：予測値と最終値の比較による実測

seg-0e443d241460 = 直近のウィンドウに対するバイアス＋レートの最小二乗フィットに、主要な周期項（UT1 では年周、半年周、二つの主要な帯状潮汐、極運動では Chandler、年周、半年周）を加え、ウィンドウ内の最後の残差を持ち越して外挿したものです。これは IERS Bulletin A が用いる種類のもので、公表された予測期間の根拠となっていた持続予測器の代わりに用います。採点は唯一の正直な方法で行います。T 以前の速報版 Bulletin A の行から作った T+h の予測を、T+h の、後に公表された Bulletin B の最終値に対して測定し、同一のエポック集合・同一の最終値に対する持続予測も並べて採点します。公表された最終値のない対象エポックは、速報値の列に対して再採点するのではなく除外します。ウィンドウでは拘束できない周期項は、実際にまたがるサイクル数とともに棄却として報告します。不完全なウィンドウは、黙って短縮するのではなく拒否します

seg-822a1ce99154 = 三つの独立した経路で、いずれも公表された予測精度の数値ではありません。({ "1" }) 係数が既知の解析信号：コミット済みのどの系列も年周項を許容できるほど長くないため、周期項の仕組みを動かす唯一の方法です。({ "2" }) 教科書的な閉形式の最小二乗解で、検証対象の行列解法とは異なる代数であり、実データの行に適用します。({ "3" }) 実際の{ "2026" }年の製品が公表している、実際にアーカイブされた Bulletin A の予測行を、リードごとに一致度の統計として比較したもので、誤差としては明示的に扱いません：{ "1" }日で{ "0.256" } ms、{ "2" }日で{ "0.695" } ms、{ "3" }日で{ "1.252" } ms、{ "9" }日では{ "3.885" } ms まで増大します。したがって、これは Bulletin A そのものではなく、短いリードで近い Bulletin A のクラスです。予測値と最終値の残差は、実際の IERS の行に対する実測量ですが、その大きさは比較の方向とのみ照合され、IERS が公表した精度の数値とは照合していません。実際の製品を読むことは出所であり、オラクルではありません。実測：{ "1" }日目では、運用形式の予測器は月座標系の誤差{ "3.78" } m を与え、持続予測の{ "11.39" } m に対して{ "3.01" }倍です。{ "2" }日目は{ "10.23" } m 対{ "21.72" } m（{ "2.12" }倍）、{ "3" }日目は{ "20.33" } m 対{ "30.57" } m（{ "1.50" }倍）です。そして三日を超えると悪化します（{ "5" }日で{ "0.87" }倍、{ "10" }日で{ "0.43" }倍）。レポートは、有利に見える予測期間だけを示すのではなく、これも出力します。再現していないもの：自己回帰の残差フィルターと表形式の帯状潮汐の縮約、コミット済みのデータでは365日の運用ウィンドウに届かないこと、そしてこのリポジトリには系列の過去のアーカイブ版が存在しないこと。そのためアーカイブ版の表は、合成した版を採点するのではなく、行なしと報告します。{ "0.30" } の外部比較は所見であり（MODELLED のまま）、クレートの既定の15日ウィンドウで、{ "178" }件のアーカイブ済み Bulletin A 発行に対して同じ最終値で採点したところ、予測器の UT1 MAE は、{ "1" }～{ "10" }日で Bulletin A の 2.4倍から 12.6倍（基準は 1.5倍）、{ "10" }日で{ "5.32" } ms であり、第2回 EOP PCC の{ "0.36" }～{ "3.13" } ms の範囲の外です。極運動は Bulletin A の 1.5倍から 1.85倍です（1.5倍以内に収まるのは{ "6" }日と{ "7" }日のみ）。事前登録した条件{ "21" }件のうち{ "19" }件が不合格です。経路({ "3" })の訂正：比較に用いた{ "2026" }年の製品の行は、P ではなく IERS の I（実測）フラグを持っているため、それらの一致度の数値は、Bulletin A の予測ではなく、実測の速報値に対するものです。{ "0.30" } のラウンド{ "2" }は、帯状潮汐を解析的に除去した最小二乗＋自己回帰の予測器を、ラウンド1の基準（事前登録 c93605b4）で{ "178" }件のアーカイブ済み Bulletin A 発行に対して評価したもので、所見です（MODELLED のまま）：{ "21" }件の条件のうち{ "12" }件が成立します。UT1 MAE は、{ "2" }～{ "10" }日で Bulletin A の{ "1.73" }倍から 2.11倍（基準は 1.5倍）であり、極運動はどのリードでも 1.27倍以内です。{ "0.30" } の改訂：オフライン入力を IERS フラグで分類した結果、経路({ "3" })の一致度の数値は、実際の Bulletin A の予測に対するものとなりました（速報値の行に対する 0.256/0.695/1.252/3.885 ms（1/2/3/9日）→ 0.133/0.421/0.839/2.786 ms）

seg-f4efd94dd746 = 観測キャンペーンから得る月面座標系のデータム

seg-a6972eb89d7d = 注入した変換から回復するのではなく、シミュレートした観測キャンペーンから伝播させた七パラメーターの Helmert データムです。地球局が、出典のある月面ビーコンのカタログを明示的なスケジュールで観測します。月面 VLBI の遅延偏微分はビーコン座標のフィッシャー情報行列に累積され、Helmert 設計行列 A = [I₃ | [p]ₓ | p] を通して H = AᵀM_bA に押し込まれます。そのため、報告されるデータムの精度は観測計画の関数となり、遅延 sigma に対して正確に線形で、レポートが実測する秤動を通して弧に対して単調です。データムの欠損は脚注ではなく主題です。ランク、欠損、条件数、スペクトル、七パラメーター基底での観測不能な方向、フルランクでも最も弱い方向、そして各パラメーターがそれに占める割合を、すべての実行で出力し、キャンペーンが拘束しないパラメーターは、状態付きの NULL として公表します。ビーコン誤差の相関は仮定ではなく実測であり、地球局を固定した場合は正確にゼロ、推定した場合はそのコストとともに出力します。<c1/> シナリオ種別として実行できます

seg-8eedf0240350 = 閉形式の恒等式と、リポジトリ内の独立した経路であり、外部オラクルは主張しません。Helmert 設計行列は、モジュールで唯一新しい導関数であり、lunar_frame_realise::apply_helmert の中心差分によって再導出されます。これは解析形と式を共有しない経路です。これが組み込む累積処理は lunar-vlbi-fim のもので、そのヤコビアンは lunar_vlbi::vlbi_delay_s に対して有限差分で検査され、線形代数カーネルは tests/fim_observability_reference.rs で numpy に対して別途外部から裏付けられています。この行は、そのどちらのステータスも借用しません。物理のオラクルは数値ではなく構造的なものです。ビーコンの遅延偏微分は、ほぼ平行な二つの単位ベクトルの近距離場の差であるため、最も決まりにくい並進方向は、地球へ向かう天体固定の方向でなければならず、テストは計算された答えを、別途測定した方向に対して検証します。実測：キャンペーンから導いた並進 sigma は{ "6.3975" } m で、注入変換シナリオの{ "0.3125" } m の回復誤差に対して{ "20.5" }倍小さい一方、回転とスケールは逆の向きで、それぞれ{ "2.32" }倍と{ "13.5" }倍大きくなります。注入経路は単一の等方的な sigma を仮定するため、誤差を七つのパラメーターに一様に広げますが、遅延の観測量はそうなりません。ランクは 7/7 ですが条件数は{ "3.8e5" }で、一つの方向は{ "99.57" } % が純粋な地球向きの並進であり、ほかのどの方向よりも四十倍悪くなっています。この行が主張しないこと：キャンペーンの数値が絶対値として正しいということ。この行が確立するのは、その数値が、仕込まれた答えではなく、スケジュール、幾何、誤差モデルから導かれるようになったということです。ReferenceImpl/MODELLED のままです：公表された月面 VLBI のキャンペーン＋データム共分散の組はなく、地球局ネットワークと遅延 sigma はILLUSTRATIVEの入力であり（ビーコンのカタログは出典がありますが、キャンペーンはありません）、観測は独立として扱っていますが、実際のセッションでは近接したスキャン間で対流圏と時計が相関しており、暦、時計、対流圏、地球姿勢パラメーターは固定です。{ "0.30" } の外部比較は所見であり（MODELLED のまま）、すべてのビーコンのヤコビアン行を NAIF SPICE の光行時間（DE440、ITRF93、MOON_ME、事前登録 { "50863551" }）から再構築すると、スケジュール、Helmert のランク、データムの sigma（{ "4.7e-3" } 以内）、条件数、最も弱い方向（{ "0.07" }度）、秤動の掃引、弧の順序は、六つのシナリオで事前登録した{ "1" } % / { "0.2" } / { "0.05" }度の範囲内で一致します。コミット済みのエンジンのヤコビアンに対する NumPy は、地球局を固定した場合に{ "3e-14" }まで一致します。地球局を推定した場合は、事前登録した{ "1e-9" }に対して{ "6.8e-6" }の差があり、その条件数に関する前提が誤っていました（Helmert の条件数は{ "2.1e8" }で、独立した NumPy の経路どうしが{ "3e-6" }食い違います。エンジンの{ "1e-9" }の擬似逆行列へのフォールバックの寄与は否定できません）。そのため、この事前登録ではこの行を昇格させません。{ "0.36" } の再登録は、条件数に応じてスケールした合格基準（事前登録 b887eb05、t = max({ "1e-12" }, { "10" } kappa { "2" }^-53)、結合した情報行列とその Helmert 縮約の条件数から算出）で行い、所見です（MODELLED のまま、NOT MET）：ステップ{ "0" }は、{ "6.8e-6" }の差について擬似逆行列へのフォールバックを除外します（元の六つのシナリオでは、Helmert 行列より上流の行列にフォールバックはなく、最も厳しい余裕は{ "2.6" }倍です）。SPICE の脚は六つすべてで成立し、NumPy は八つのシナリオのうち六つで基準の範囲内で一致します（既定、二つの弧、3倍の遅延 sigma、共線欠損、そして2026-12-01 の新規の地球局固定の実行で、最悪値は基準の{ "0.13" }）。stations_estimated では不合格で（データムの sigma は最大{ "6.8e-6" }、条件数{ "9.1e-6" }、独立性を捨てたノルム{ "3.5e-6" }、t = { "5.9e-7" } に対して）、新規の日付では南極のビーコンに観測がないため、ビーコンの情報行列はランク欠損となり（新規の二つのシナリオとも、Helmert 行列より上流で擬似逆行列にフォールバック）、変更していない NumPy オラクルは stations_estimated_fresh を評価できません（特異行列）。結果：docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

seg-ca481f2d8f9e = 地球・月間空間（シスルナー）弧長しきい値の独立した推定器による裏付け

seg-3d5fbf896209 = 衛星間の模擬測定から、ランク対弧長の表が用いるのと同じエポックグリッドの、伸びていく接頭部にわたって、チーフの初期状態を回復するバッチ最小二乗推定器です。測定の偏微分は、合成した順方向モデルの中心差分で求めます。しきい値の測定に用いた仕組みは一切使いません。解析的なヤコビアンの行、変分状態遷移行列、特異値分解や固有値分解、ランクの許容差、平方根情報フィルターのいずれも使わず、共有するのは、力学、初期条件、スカラーの観測量、エポックグリッドだけであり、それぞれ出力ドキュメントに明記されます。二つの基準をどちらも掃引します。雑音なしの回復（ランクに相当）と、モンテカルロによる推定可能性（共分散から予測するのではなく、既知の真値に対して測定する、推定可能性に相当）です。<c1/> シナリオ種別として実行できます

seg-60e30948cee7 = このコードベースにある別の推定器で、アルゴリズムが異なり、コードの経路も重なりません：有限差分の偏微分を用いる非線形の重み付きガウス・ニュートン法で、その判定は、km と mm/s で測った状態回復誤差として読み取ります。グラミアンのランクと共分散の経路とは共通する式がなく、その分離は、主張するだけでなくソーステキストのガードによって強制されます。公表されている平面 DRO グリッドでの実測：推定可能性の基準は CORROBORATED です。モンテカルロで測定した境界は{ "5.739130" }時間で、形式的な{ "5.739130" }時間と一致し（比は{ "1.0000" }）、測定された RMS は、{ "21" }個の弧長にわたって形式的な 1σ を、幾何平均の比{ "0.9804" }で再現します。ランク基準は、回復可能性の境界としては NOT corroborated です。推定器は{ "0.782609" }時間から回復しますが、グラミアンは{ "2.086957" }時間であり、比は{ "0.375" }で、ランクの読み取りが{ "4" }のうち{ "3" }と採点する最後の接頭部である{ "1.826087" }時間でも、事前変位の{ "1.96e-5" }まで回復します。回復の境界は、その境界自身の三桁の範囲にわたって動かない一方、ランクのしきい値は、rel_tol の四桁にわたって「なし」から{ "0.782609" }時間まで広がり、両者は rel_tol = { "1e-8" } で正確に一致します。この範囲は、最初は{ "0.260870" }時間に達すると記録されていましたが、その数値はアーチファクトであり、f64 の雑音床を下回る測定行{ "2" }本から{ "4" }方向を数えたランクの読み取りによって生じたものです。ここで訂正し、そのまま残すことはしません。ランクの読み取りは、理由を出力したうえで Sylvester の不等式で上から抑えられるようになり、訂正後の範囲は、独立した推定器が回復する弧とちょうど同じ位置で飽和します。これはこの行のクロスバリデーションを弱めるのではなく強めます。公表されている{ "1e-6" }は保守的な特異値の慣例であり、回復可能性についての記述ではありません。空間でも同じパターンです。NRHO は{ "9.290323" }時間対{ "21.677419" }時間、ハローは{ "22.978723" }時間対{ "39.829787" }時間で、推定可能性は両方で正確に一致します。平面 DRO の六状態は、どの弧でも回復せず、それについて何も知らされていない推定器から、そのファミリーの構造的なデータム欠損を独立に再現します。外部の基準には裏付けられておらず（力学と初期条件は検証対象の解析と共有しており、そのようなしきい値を公表している公開データセットもありません）、そのため ExternalDataset は見送っています

seg-f839285852d9 = 実際に取得したコンステレーション幾何から得る月面サービス空間

seg-c3059fcced49 = 表形式の月中心状態暦（SPK/BSP カーネルの評価結果）、または <c1/> の背後にある公表済みのコンステレーション定義を受け付け、それに対して同一のカバレッジ / DOP / 保護レベルの掃引を実行し、それが含意する σ_URE 測距要件を、変更していない例示のケプラー解および摂動解の結果と並べて出力し、その差を独立した名前付きの量として示します。すべての数値は、カーネル由来、公表された軌道要素由来、モデル由来を区別する出所クラスを持つため、下流での引用で両者が混同されることはありません

seg-cbe9bd6bf989 = 幾何は外部のものであり、ハッシュ化されています。数値が、URL、取得日、SHA-256 付きで取得した文書のみから得られる三つのフィクスチャーがあり、コミット済みのジェネレーターで再生成でき、ジェネレーターは上流のハッシュを検証し、数値を出力せずに中止します。LANS 相互運用性実証の参照コンステレーション（NASA NTRS { "20250009447" }、SHA-256 d1b916be…）、LNCSS のケーススタディ（NAVIGATION { "70" }({ "4" }) navi.613、CC BY、SHA-256 { "4e294687" }…）、そして LRO、Danuri、Chandrayaan-2、CAPSTONE について、JPL 自身が再構築したカーネルから Horizons 経由で評価した、実際に飛行した宇宙機の暦です。公開されている月航法コンステレーションのカーネルは存在せず（Moonlight/LCNS、LCRNS、LNSS は飛行しておらず、NAIF はそれらについて何も公開していません）、何も作り出していません。導出した σ_URE 要件には外部オラクルがありません（このサービス空間で{ "50" } m の月面 HPL が要求する測距精度を公表している者はいません）。そのため、それ自身の代数的な恒等式に対して、また独立に、算出した要件で掃引全体を再実行して可用性がそこで反転することを確認することで検査しています。実測：公表されている8衛星設計は、カバレッジ{ "100" } % で σ_URE { "2.9044" } m を必要とし、例示のコンステレーションでは{ "37.85" } % で{ "0.3591" } m です。これはプログラム規則 R4 のもとで、公表された数値を{ "8.09" }倍に改訂するものです。定性的な結論は成り立ちます（LNIS クラスの{ "30" } m では、南極の{ "50" } m の HPL を依然として満たせません）が、不足は八倍に誇張されていました。5衛星の LANS デモでは保護レベルのサンプルがゼロです。単一故障の仮説集合に必要な六機の可視衛星を、五機では確保できないためで、要件のフィールドは捏造せず、存在しません。{ "0" } % のカバレッジとなった四機の実際の宇宙機についても同様です。InternalConsistency は正直な種類です。入力データは外部のものでハッシュ化されていますが、この行が扱う量は、それ自身に対してのみ確認されています。{ "0.30" } の外部比較は所見であり（MODELLED のまま）、{ "346" }個の格子点における navi.613 の LNCSS ケーススタディの統計に対して、{ "12" }件の可用性統計のうち{ "4" }件が、事前登録した{ "2" }パーセントポイントの外に出ます（ケース A：-4.0、+{ "22.5" }、-3.6 pp、ケース B：-12.1 pp）。考えられる原因：軌道要素を誤った座標系で読んだこと、論文が明示していない力モデルに対して{ "15" }日間にわたる二体ケプラーを用いたこと、テキストから再現できない格子です。PDOP の半分は評価できませんでした（LANS は数値統計を出力していません）。比較テストは無視設定でコミットされています。{ "0.30" } のラウンド{ "2" }は所見であり（MODELLED のまま）、レポート全体を計算する Orekit { "12.2" } / Hipparchus { "3.1" } のオラクル（Orekit による伝播、DOPComputer による可視性と DOP、Hipparchus で構成した MHSS 保護レベル、サンプルごとに解いた要件、事前登録 d3ce97b2）に対し、取得した五つの幾何すべてと二つの格子で、{ "160" }個の値のうち{ "155" }個が事前登録した基準（{ "2" } pp、{ "5" } %、{ "1" } %）の範囲内で一致します。これには、LNCSS の A と C の sigma_URE 要件（ケース A は両側で{ "3.879072208" } m）と、LANS と周回機で要件が存在しないことが含まれます。密な格子の LNCSS B は、最悪サンプルの統計で不合格です（sigma_required は{ "0.001511" } m に対して{ "0.000923" }、hpl_max は{ "0.99e6" } m に対して{ "1.63e6" }）。ほぼ特異な幾何（PDOP は約{ "1e6" }）が、メートル級の位置の一致を増幅するためです。その p95 要件は一致しています（{ "1.6357" } m に対して{ "1.6343" }）。最悪サンプルの要件は、縮退した幾何では不良設定です。navi.613 に対しては、{ "12" }件のうち{ "4" }件が依然として{ "2" } pp の外にあります（固定）

seg-36a6cfaf5afa = 報告されるすべての量について宣言された単位と出所

seg-12460501e82b = すべてのシナリオレポートのすべての数値フィールドについて、単位、出所クラス、定義を与える機械可読なスキーマと、登録されたすべてのシナリオ種別を実行し、出力された数値フィールドのどちらかが欠けていれば失敗する、単一のグローバルなゲートです。出所の語彙は閉じており、各クラスはエビデンスのティアを持ちます。ただし二つのクラスは、そのクラスが決定しないティアを割り当てるのではなく、意図的に <c1/> と <c2/> に対応づけています

seg-a8c4a6fd4989 = 出力されたドキュメントそのもの：すべての数値の末端は、そのドキュメント自身の units ブロックのエントリーに解決されなければなりません。宣言された単位を照合する外部の単位レジストリはないため、宣言された単位はレビュー済みの主張であって、検証済みのものではありません。ゲートが検証するのは完全性と形式の正しさであり、真偽ではなく、<c2/> という名前のフィールドの正しい単位が <c1/> であることを外部で確認するものはないため、「確認済み」とするのは誤りです。独立した名前の接尾辞によるクロスチェックを、当時記述されていた{ "1,434" }個のフィールドに対して実行しました。単位を示す接尾辞を持つ{ "691" }個のうち、{ "40" }個が宣言された単位と食い違い、その{ "40" }個すべてが説明できました（毎秒の接尾辞、最小値、開口秒、ナノメートルに見える接尾辞に対するニュートンメートル）。そのため、誤った単位は見つかりませんでした。このクロスチェックはその後再実行されておらず、カバレッジはそれを超えて拡大しています。数値は、現在の合計で言い直すのではなく、実際に測定した値のままにしています。その変更の時点（{ "0.27.0" }）で、カバレッジは{ "56" }種別のうち{ "7" }から{ "61" }種別のうち{ "60" }へ、また{ "1354" }個のフィールドのうち{ "389" }から{ "1,744" }個のうち{ "1,742" }へ移りました（docs/field-units-schema.json、陳腐化の検査が最新に保ちます）。未対応の種別は残っていません（上限は{ "0" }、FUT-28、{ "0.36" }）。最後の一つは <c3/> で、その列のうち二つは呼び出し側がキーを指定するため、単位がデータになります。それらは <c4/> と記述されるようになり、すべての位置の単位は、掃引対象のパック自身の units 表から <c5/> と <c6/> に読み込まれます（または軸の宣言された <c7/> から取得しますが、両方ある場合はパックのものと一致しなければならず、どちらもない場合は推測せず null と明記します）。<c8/> はその一つ前のもので、リリース済みのドキュメントに units ブロックが加わったことでリストから外れました。<c9/> を禁止キーとして挙げていた加法性の固定は、今では追加が加法的であることを証明します。ブロックを再び取り除いても、ドキュメントは、それが存在する前に固定した二つの定数に対してハッシュが一致するため、追加の下でリリース済みの値が動いた場合は、依然として失敗します。この作業では、既存コードの単位またはドキュメントの欠陥が十二件見つかりましたが、R1 のもとで修正せず報告しています

seg-cf779c468eed = 実際の観測キャンペーンから得る月面座標系のデータム

seg-96151f13a92b = 七パラメーターの Helmert データム共分散で、シミュレートした二つの入力を実測のものに置き換えています。スケジュールは、アーカイブされた{ "337" }個の ILRS 月レーザー測距ノーマルポイントの地上送信エポック（2015-04-08 から 2015-06-27、Grasse MeO { "7845" } と Matera MLRO { "7941" }、五つの再帰反射器アレイすべて）であり、すべての観測の重みは、そのポイント自身のアーカイブされた精密度 bin_rms/√n_raw で、片道距離の中央値は{ "5.13" } mm であり、ファイルから読み出しています。地球局の座標は IERS ITRF2020、反射器の座標は JPL DE430 の Table { "7" } です。<c1/> シナリオ種別として実行できます。確認済みの主張（{ "0.36" }）は限定的です。解析的な既定の経路で、データム共分散の計算が、新しい実測ノーマルポイントに対する独立した SPICE の光行時間と NumPy のオラクルと一致するというものです。これは LLR の精度ではなく、解析的な月が正確であることの証拠でもありません

seg-50c60fc25ded = 閉形式の恒等式、リポジトリ内の独立した経路、そして{ "0.36" } 以降は、新しい実測データに対する独立した SPICE と NumPy のライブラリオラクル（下記）です。照合できる公表済みの月 LLR のデータム共分散の組はなく、したがって精度は主張しません。唯一新しい導関数である、反射器の天体固定位置に関する距離の偏微分は、それが微分する往復光行時間の中心差分によって再導出され、これは解析形と式を共有しない経路です。物理のオラクルは構造的なものです。距離の偏微分は視線の二倍であるため、地球への平均方向に沿った天体固定座標は、天空面の二つの座標よりもはるかによく決まらなければならず、後者は秤動によってのみ到達されます。五つのアレイにわたって{ "50.7" }倍から{ "71.7" }倍と測定され、レポートが独立に測定する秤動の掃引と、等方的な小角度の予測、および差を説明する横方向の異方性の両方が出力されます。変更点：スケジュール、観測数、すべての観測の重みが、今では実測です。アーカイブされた{ "349" }個のポイントのうち{ "337" }個が使われ、使われない{ "12" }個はスキップして数えています。ITRF2020 には Apache Point の位置がないためです。実測：データムの並進 sigma は{ "1.851746e-2" } m で、シミュレートしたキャンペーンの{ "6.3975" } m に対して（{ "345" }倍）、回転は{ "36" }倍、スケールは{ "24" }倍です。これはレーザー測距ネットワークと VLBI 遅延ネットワークの比であり、したがって検証ではなく所見です。反射器の情報ランクは 15/15 で、アレイ間の結合は正確に{ "0" }であり、Helmert のランクは 7/7、条件数は{ "2.4e4" }です。この行が主張しないこと：その数値が絶対値として正しいということ。実際の LLR 解は、月の軌道、物理秤動、地球姿勢、地球局座標、潮汐および相対論のパラメーターを同時に推定し、デシメートル級（DE430 Table { "7" } 自身の 0.12-0.27 m）を報告するのに対し、この下限ははるかに小さく、これは、指定した縮約パラメーター集合に対する Cramér-Rao 下限であり、精度ではありません。確認済みの主張の範囲外（モデルから計算したもので、確認済みではない）：月中心の暦と IAU { "2015" } の天体の向きはモデルから計算したものであり、対流圏、潮汐、局の偏心、極運動、UT1-UTC、相対論的遅延、局の時計はありません。それらを合わせた大きさは、論じるのではなく公表されています。観測値から計算値を引いた片道距離は、{ "337" }点で RMS { "156,494" } m です。共分散への影響は、論じるのではなく上限が示されています。すべての偏微分を{ "0.1" }°傾けて（実測した最悪エポックの暦の傾きの二倍、符号は交互）データム全体を解き直すと、成果物は{ "0.288" } % 動きます。外部検査（{ "0.30" } のラウンド{ "2" }、事前登録 6b27964a）は所見であり（MODELLED のまま）、有限差分の偏微分を用いた SPICE の往復光行時間（DE440、ITRF93、DE440 の月の向き）と numpy の逆行列は、同じ{ "337" }個の実測ノーマルポイントと重みに対して、帳簿、両方のランク、ゼロの結合、残差 RMS（{ "2.1e-5" }）、そして{ "16" }個の共分散の数値のうち{ "15" }個で一致します。z 並進の sigma は、事前登録した{ "1" } % の基準に対して{ "1.03" } % 高くなっています。月中心を DE440 とすると{ "0.049" } % に下がり（c51f8b2、既知のデータ）、新しい{ "2019" }年のノーマルポイントでは、カーネルの月のデータムはすべての基準を満たします（行「…、カーネルの月中心」）。解析的な月も基準の範囲内にとどまる（最悪値{ "3.8e-3" }、参考情報のみ）ため、その比較は月のモデルを区別しません。解析経路の新規データでの実行（{ "0.36" }、点を一つも取得する前に事前登録 31f5283）：変更していない SPICE と NumPy のオラクルを、2025-04..06 の使用した{ "151" }個の EDC CRD v2 ノーマルポイント（どのテストも使っていない年で、ファイルは再取得され、オラクルは独立に再実行されました。フィクスチャーの NOTICE を参照）に、同じ基準で適用しました。帳簿、ランク、アレイごとの数、ゼロの結合は等しく、sigma とノルムは最悪で{ "1.11e-3" }（{ "1" } % の基準）、条件数は{ "8.95e-4" }（{ "2" } %）、横方向/縦方向の比は最悪で{ "1.79e-3" }（{ "2" } %）、SPICE の O-C は{ "10.79" } m でした。その証拠に基づき、共分散の計算のみについて、ライブラリ検査として VALIDATED です。その区間の解析的な残差 RMS は{ "222" } km であるため、基準は月のモデルを区別しません（カーネルの行と同様）。結果：docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md

seg-c815cb90dcde = 月面基準局の測地：五アレイのデータムに対して追加した再帰反射器と VLBI ビーコン

seg-103cf21173ac = lunar-llr-datum シナリオの任意の extra_reflectors と extra_beacons の入力は、station_geodesy ブロックを追加します。アーカイブされた月レーザー測距の区間から得る五アレイの Helmert 情報に、追加した再帰反射器（測距局が地平線より上にある、アーカイブされたノーマルポイントのエポックで測距し、それぞれにそのノーマルポイントのアーカイブされた重みを用いる）と、追加した VLBI ビーコン（lunar-frame-campaign のネットワークとスケジュールで、地球局を固定して観測し、lunar-vlbi-fim の遅延偏微分を通す）が、指定した地点で七パラメーターのデータムにもたらす情報を加えて、解き直します。各 Helmert パラメーターの前後の 1-sigma、その比、前後のノルム、フィッシャー差の極端な固有値を出力します。ない場合や空の場合、レポートは変わりません

seg-479a7e6bbedb = 内部整合性のみ：追加した各地点は互いに異なる点であり、レーザー測距や固定局の VLBI 遅延は一つの点にしか触れないため、その情報 A_p^T M_p A_p は半正定値で、加算されます。テストは、フィッシャー差とすべての分散をそれに照らして検査します。五アレイの結果は既存の実データの行であり、変わりません。追加した反射器は、既存の五つのアレイ用に計画されたエポックを再利用しており、これはILLUSTRATIVEのスケジュールです。追加したビーコンのネットワーク、スケジュール、遅延 sigma は、lunar-frame-campaign のILLUSTRATIVEの入力であり、その地点はILLUSTRATIVEの南極の位置です。南極の地点では、地球が地平線の低い位置に見えるか、まったく見えず、これは既存の視線角テストが表現しています。どちらの地点も連続して測距されることはありません。数値は縮約パラメーター集合に対する Cramer-Rao 下限であり、解かれたデータムではなく、実在のいかなる局についての記述でもありません

seg-d9f033ebf109 = 実際の観測キャンペーンから得る月面座標系のデータム、カーネルの月中心

seg-6f272a06c9f3 = アーカイブされた ILRS のノーマルポイントとその実測の重みから得る lunar-llr-datum の七パラメーター Helmert データム共分散を、カーネルの経路で求めたものです。地心の月中心は、エンジン自身のカーネルリーダー（planetary_kernel_path、lunar_llr::llr_geometry_with、ephem_provider::KernelEphemeris）によって JPL DE440 から読み取ります。解析的な行と異なるのは月中心のみで、IAU { "2015" } の向き、極運動と UT1 がないこと、カタログ、選択規則、重み、線形代数は同じです。確認済みの主張は、この経路のデータム共分散が、新しい未見のノーマルポイントに対する独立した SPICE と NumPy のオラクルと一致するという点のみです。この比較は月のモデルを区別せず、月中心も検査しません。同じ区間で解析的な月もすべての基準を満たし、事前登録した変異（カーネルの月を一時間遅れで読む）は検出されず、約{ "4,650" } km 誤った月中心もすべての基準を満たします（オラクルのテキストを参照）。カーネルの月がデータムを改善することの証拠ではありません。planetary_kernel_path 付きの <c1/> シナリオとして実行できます（別の区間では normal_points_dir を指定）

seg-ec47513b1828 = NAIF SPICE Toolkit N0067（spiceypy { "8.2.0" }、MIT）による、DE440、ITRF93 の地球姿勢、DE440 の月の向き（MOON_ME）上の往復光行時間と、{ "100" } m の有限差分の偏微分、および numpy { "2.3.5" }（BSD-3-Clause、LAPACK）による情報行列と逆行列：解析的な行の比較（6b27964a）の変更していないジェネレーターを、新しい区間（EDC CRD ノーマルポイント、2019-04..06）に対して、その取得を始める前に 830d945a で事前登録し、解析的な行の基準（sigma とノルムは{ "1" } %、条件数と比は{ "2" } %、帳簿、ランク、結合は完全一致）とそのオラクルの自己検査（SPICE の O-C は{ "10.86" } m < { "100" } m）で実行しました。すべての量が成立し、最悪値は{ "7.6e-5" }です。変異：計画した一時間の月の遅れは検出されません（共分散は視線の広がりに依存し、そのタイミングには依存しないため）。後から選んで、その旨を開示した構造的な変異である、下りの偏微分を落とすものは、すべての sigma で不合格です。所見：この区間では解析的な月も基準を満たす（最悪値{ "3.8e-3" }）ため、基準は月のモデルを区別せず、これは新しいデータでの共分散を確認するものであり、カーネルの月の改善ではありません。折り込み時の積分器検査（事前登録なし）：カーネルの月を地球ではなく地球・月重心に対して読んだ場合（残差 RMS { "4,649" } km）と、カーネルのエポックから TT マイナス UTC（{ "69" }秒、残差{ "2.6" } km）を除いた場合は、どちらもすべての基準を満たしますが、実測の重みから sqrt(n_raw) を落とすと、帯域のある{ "16" }個の量すべてが不合格になります。比較は、重み、偏微分、線形代数には敏感ですが、月中心には敏感ではありません。両側とも DE440 を読んでいるため、これは DE440 上での計算を確認するものであり、DE440 を確認するものではありません。主張の範囲外：LLR の精度（縮約パラメーター集合に対する Cramér-Rao 下限）

seg-bd3af378b613 = 組み込みの解析的な月暦：その明示された精度の上限を実データで検査

seg-a51c4e234a4f = ephem::moon_position は、DE/SPK カーネルがないときにクレートが頼る低精度の地心月面級数で、実際の月レーザー測距と、同じ期間にわたる公表済みの惑星暦に対して測定しました。この行が確認するのは、モジュールが自身について述べる上限であり、精度ではありません。級数は、述べているより悪くないことが確認されたのであって、良いことが確認されたのではありません

seg-81dff68ddd9c = 何も共有しない二つの独立した外部データセット。({ "1" }) アーカイブされた{ "337" }個の ILRS 月レーザー測距ノーマルポイント（EUROLAS Data Center、DGFI-TUM、2015-04-08 から 2015-06-27、五つの再帰反射器アレイ、ファイルごとの SHA-256 と再ダウンロード・検証スクリプト付きでコミット）：観測値から計算値を引いた片道距離は RMS { "156,494" } m で、地球局の座標は IERS ITRF2020、反射器の座標は JPL DE430 Table { "7" } のものであるため、残差は月中心の級数に支配されます。({ "2" }) 同じ期間にわたる JPL Horizons の幾何学的な地心月状態：動径方向の RMS { "112,567" } m、ベクトルの RMS { "195,655" } m、最悪エポックは{ "360,324" } m = { "0.0536" }°。距離の残差は暦誤差の動径方向の成分に反応するため、({ "1" }) と ({ "2" }) は同じ量に二通りの方法で到達したものであり、{ "1.39" }倍の範囲で一致します。これが、lunar-llr-datum シナリオが残差を暦に帰属させることの根拠です。エンジン自身のモジュールのドキュメントは ~{ "0.3" }° / ~few·10² km と主張しており、両方の測定値はその内側にあり、角度の主張では{ "5.6" }倍の余裕があります。適用範囲、読者が取り違えないよう明記します：これが確認するのは明示された上限であり、精度の数値ではありません。この級数は、~{ "1e5" } m より良い値を必要とする用途には引き続き不向きであり、その制約は、一致と同じくらいこの行の内容です。コミット済みの取得・検証スクリプトにより、オフラインで再生成できます

seg-44f582b17fa9 = ゲートの整合性：表示どおりの意味を持つグリーン

seg-43fbcfbe990c = 検証プロセスそのものに対する三つの構造的なガードで、それぞれが、断続的または偽のレッドとして正式なゲートに到達した欠陥の一つのクラスを閉じます。({ "1" }) Rust ソースで構成されるすべての一時パスは、呼び出しごとに一意の要素を持たなければなりません。プロセス ID は拒否されます。cargo はライブラリのテストを一つのプロセスの並列スレッドとして実行し、pid はそのすべてで共有されるためです。({ "2" }) バイト単位またはハッシュによるすべての固定は、それ自身の隣またはモジュールのヘッダーに、何をカバーし何を意図的に除外するかを宣言しなければなりません。これにより、横断的な変更で、どの固定が対象で、どれが黙ってリポジトリ全体の変更検出器になったかが一目で分かります。({ "3" }) グリーンを主張できるのは、全スイートからのみです。scripts/gate.sh が <c1/> を実行し、パイプを介さずに真の終了コードを取得し、コミット、統合バイナリ数、テスト数、所要時間を記したレシートを書き出します。プッシュ前の検査は、クリーンなツリーで、そのコミットを記した有効なレシートがないプッシュを拒否します。再現性は scripts/check-repeatability.sh が別に抽出し、ライブラリのスイートを N 回実行して、合格するテストの集合が異なれば失敗とします。

seg-17a5f9da54a4 = 閉形式：各ガードは、反応しなければならない既知の不良スニペットと、沈黙を保たなければならない既知の良好なスニペットに対して実行され、どちらも検出器が影響を及ぼせないリテラル定数です。二つの既知の不良スニペットは、F22 と F25 の欠陥の元の形です。これは内部のオラクルであり、この行はそれに応じて MODELLED です。ガードが欠陥とその修正を区別することを証明するものであり、それらが述べるクラスが網羅的であることを証明するものではありません。明示された盲点は、パスではない共有状態、短い名前付き定数に保持された固定、三回の実行では標本にならないまれな競合、そしてファイルを書き込める人なら誰でも偽造できるレシートであり、見つかるのを待つのではなく、tests/source_guards.rs のモジュールのドキュメントと各スクリプトのヘッダーに書き出されています。

seg-178192c9c87a = 合成タイミング PL：スカラー MHSS の特殊化（H=1_N）

seg-431aaf94ec31 = 異種の情報源にわたるスカラー時間の解分離 TPL。PL は、最悪の除外部分集合の雑音と UTC(k) のバイアスによって決まります

seg-9a5ea79248c8 = P2：numpy { "2.3.5" } の linalg.lstsq と scipy { "1.18.1" }（norm.isf、norm.sf、brentq）が、それぞれ独自のアルゴリズムで、部分集合の重み付き最小二乗推定量、一般の分離共分散 sqrt(Δ Σ Δᵀ)、バイアス、およびそこからの保護レベルを、コミット済みの{ "300" }個の入力（tests/fixtures/tpl_scalar_numpy_oracle）で再計算します。PL は相対で{ "1e-9" }以内で一致し（最悪{ "1.2e-10" }）、決定的な除外部分集合は同一で、許容差は比較の前に固定しました。乗数、事前確率、バイアスの上限は入力であり、PL 方程式の構造（モードのリスト、ir/2 の分割、バイアス射影）は、月面 ARAIM 保護レベルのカーネルの行と同様に、明示された入力です。確認済みの主張は、それらの入力に対する線形代数と PL であり、タイミングのシナリオの物理的な大きさではありません。ARAIM の系譜：Blanch { "2015" } / Joerger { "2014" }

seg-b7cd952ff133 = 合成タイミング PL：P0 を初期値とするホールドオーバーの継続

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ))；下半連続 PL({ "0" }+)≥PL({ "0" }−)；K(IR/2) の累積最大；τ/τ³/τ⁵ の位相の指数

seg-1438193381be = 性質テスト（単調性、ハンドオーバーでの非低下）と、holdover::coast_phase_variance に対する指数の lint

seg-3ab4509b62a2 = 合成タイミング PL：ホールドオーバー包絡線のカバレッジ、複数年の領域（tau>=90d）

seg-d9520f6c1769 = 累積最大の包絡線は、互いに素な区間で、試験したすべてのラグ tau>=90d において、実際の計量学的な系列を上界で覆い（ゼロの突き抜けなし）ます。短い tau（<=30d）は、外部の参照なしにモデルから計算した値にとどまる、開示済みの境界です

seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] の5日系列、MJD 56074-60429（{ "872" }点、webtai API）。フィットとテストは互いに素、複数年のゼロ突き抜けのないカバレッジ

seg-096b6cdfe2dc = 合成タイミング PL：LIL a.s. 包絡線（不可能性と整合性）

seg-1671add2210d = 有限の最悪ケースのホールドオーバーは存在しません（ブラウン運動の上限は発散）。IR を割り当てた HPL は、IR→{ "0" } として Hartman-Wintner の包絡線と整合します

seg-c9ed8bbede70 = 閉形式の a.s. 包絡線 √(2Dt·lnln t) の恒等式と、HPL の支配性の検査。Baweja arXiv:{ "2606.24210" } の不可能性の継ぎ目

seg-5a27c9f0a67d = 異種の UTC(k) トレーサビリティバイアスのインテグリティ上界

seg-fd09ab2adbf6 = 情報源ごとのバイアス上界 b = (U/k_cov)·Phi^-1(1-tail/2) + ageing で、公表された Type-B の拡張不確かさを、割り当てたインテグリティの裾へ膨らませたもの。bias_s として tpl_scalar に橋渡しします

seg-1fd53acf9a3f = 上界の閉形式を、独立した numpy と標準ライブラリの statistics で再現したもの（InternalConsistency）。BIPM Circular-T [UTC-UTC(USNO)] の系列は引用のみの入力です。これは R4 のホールドオーバーカバレッジの行ですでに確認済みの同じ系列であり、ここで再確認したものではなく、その値を再現しても R2 については何も証明しません。深いインテグリティの裾は、外部の参照なしにモデルから計算した値にとどまります。{ "0.30" } の外部比較は所見であり（MODELLED のまま）、BIPM の研究所ごとの UTC-UTC(k) ファイル（{ "102" }研究所、公表された不確かさ付きの{ "105 024" }行）では、{ "1e-2" } の裾での上界 b = { "2.576" } u を、行の{ "50.8" } % が超えており（Clopper-Pearson { "95" } %：{ "50.4" }～{ "51.1" } %）、{ "102" }研究所のうち{ "101" }研究所で{ "1" } % を超えています。公表された u は、BIPM による UTC-UTC(k) の決定の不確かさであり、オフセットの上限ではなく、オフセットは日常的に u の何倍にも達します。仕様どおりの上界は、実際の UTC(k) のトレーサビリティバイアスを上界で覆いません。{ "0.30" } のラウンド{ "2" }は、2015-2022 で学習し、2023-2026 の BIPM Circular T データで試験した、実現した UTC-UTC(k) オフセットの上界（事前登録 ca0921a4、プールした超過は最大{ "1e-2" }）で、所見です（MODELLED のまま）：プールした超過は{ "0.0333" }です（{ "82" }研究所の{ "20 826" }行のうち{ "694" }行。規則により上界がない{ "430" }行を除くと{ "0.0127" }）。D9 のラウンド{ "3" }は、プールした階層的な経年の上界（utck_bound）で、fb475550 で事前登録し、{ "465" }号以降の Circular T の号で前向きに採点します：まだ実行していません（{ "465" }号は 2026-10-12 に約{ "285" }個の試験値とともに公表されました。事前登録した 1000 値の規則には約{ "468" }号までの号が必要で、BIPM がその後{ "113" }個のうち{ "87" }個を書き換えたため、実行にはアーカイブされた 2026-09-30 の研究所ごとのファイルが必要です）

seg-d75b900ad25f = 相関のあるトレーサビリティバイアスの相互共分散（共通モードに対して安全でない配分）

seg-0641f6d38c23 = UTC(k) の実現元を共有する情報源に対する、rho·b_i·b_j の非対角成分を持つ N×N のバイアス相互共分散。証明済み：correlated_fused_bias >= independent_fused_bias（独立を仮定した素朴な配分は、融合したバイアスを過小に上界化する → 楽観的 → 安全でない）

seg-72359f29aab1 = 相互共分散と、相関ありと独立の融合バイアスの不等式の、独立した numpy による再現（InternalConsistency）。代表的な情報源の集合であり、モデルから計算したシナリオです。

seg-0359a9194c60 = GLS の共通モードの白色化（Aitken）と Mahalanobis の恒等式

seg-67b11ff6d055 = 手書きの Cholesky Omega=LL^T と前進代入による白色化 z=L^-1 r（Cov(r)=Omega のとき Cov(z)=I）。Mahalanobis の二乗 z^T z = r^T Omega^-1 r

seg-24cb37529637 = P2：numpy { "2.3.5" } の linalg.cholesky（LAPACK potrf）、solve（gesv）、inv が、コミット済みの{ "201" }個の SPD 入力（tests/fixtures/gls_whitening_numpy_oracle）に対して、手書きの因子、白色化した残差、白色化演算子を検査します。Mahalanobis の二乗は Cholesky を使わない solve(Omega, r) に対して検査され、恒等式 z^T z = r^T Omega^-1 r は別の経路で確認されます。すべて相対で{ "1e-12" }以内（最悪{ "7.9e-16" }）で、許容差は比較の前に固定しました。最大の条件数は{ "19.3" }であり、悪条件の行列はカバーしていません。GLS/Aitken { "1935" } の白色化は引用です。

seg-1a3bb032960f = 共通モードの整合性統計量（分離では見えない共有参照の故障）

seg-1b03f522b8fc = スコア統計量 ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1。解分離（{ "1" } に直交する対比）では見えない共通モードのシフトに対するもので、共通モードのシフトはこれを膨らませますが、ペアごとの分離は変わりません

seg-d79071a5d9ec = 統計量の独立した numpy による再現と、共通モードの注入がそれを膨らませるという性質テスト（InternalConsistency）。モデルから計算したシナリオです。{ "0.30" } のラウンド{ "2" }（事前登録 f9aa360d）はブロックされています（MODELLED のまま）：numpy { "2.3.5" } の LAPACK gesv は、コミット済みの{ "261" }ケースで統計量の値を再現します（条件のよい場合は{ "3.5e-15" }以内、条件数が最大{ "6.1e7" }では{ "1.2e-9" }）。カイ二乗（{ "1" }）の帰無分布は引用された定理であり、平坦なペアごとの分離は、比較すべきエンジン出力のない恒等式であるため、範囲の決定は所有者の判断を待っています

seg-91fc18cde833 = Omega の外にある残差の、検出不能な共通モードの上限

seg-0cc2c0f033c8 = 検出不能な共通モードの上限：分離（alpha_ss = T_ss / d の白色化した対比ノルム）と共通モード統計量（alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|）の両方を逃れる、方向 d に沿った最大の故障の大きさで、min(alpha_ss, alpha_cm) として報告します。正定値の Omega のもとでは、二つの盲方向（{ "1" } に比例する d と、{ "1" }^T Omega^-1 d = { "0" }）は互いに排他的であり、したがって上限は、ゼロでないすべての d に対して有限です。無限になるのは、ゼロの方向、または正定値でない Omega の場合のみです。モデル化した共通軸の外にある方向は、共通モード統計量に対してのみ盲であり、分離によって上界が与えられます

seg-b67c71daa7de = P2：numpy { "2.3.5" } の linalg.solve（LAPACK gesv、Cholesky なしの LU）が、コミット済みの{ "256" }個の (Omega, d, T_ss, T_cm) 入力（tests/fixtures/gls_outside_omega_bound_numpy_oracle）で、alpha_ss（GLS の共通モード係数を取り除いた後の d の白色化した対比ノルムに対するしきい値）、alpha_cm、およびその最小値を再計算します。これには、純粋な共通モードの方向、モデル化した共通軸の外にある方向、+inf を与えなければならないゼロ方向と正定値でないケースが含まれます。事前登録（d070699a、行列形式を言い直した修正 8a44267b は、いかなる比較よりも前）、許容差は比較の前に固定しました。機能のテキストは、所有者の判断（2026-10-02）によって訂正されました。以前は、共通軸の外にある方向について上限が無限であると述べており、それはコードとこの比較に矛盾していました。理想化した単一対比の検出器が、実際の部分集合検出器の検出不能な大きさの下界になるという点は、モデルから計算した値のままです

seg-a7a33523bb1c = 月面データムの識別可能性：分解の線形代数

seg-bd59cc76557a = 7パラメーターの Helmert データムのフィッシャー情報の { "{" }lunocenter-X, scale{ "}" } ブロックの Schur 補行列による周辺化：スカラーの縮退指標 lambda_min(S)、原点 X の CRLB、原点とスケールの相関

seg-0f7e4fb31c44 = 独立した SciPy/NumPy の参照（scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv）：Schur 補行列、その固有値、2x2 の逆行列を、独立したライブラリで計算します。分解の線形代数に限定されます。実際の幾何から得る月面の相関/CRLB の大きさは MODELLED のままです。

seg-3359eee713a5 = 月面データムの零空間の分類（LLR のランク加法性＋秤動による欠損の解消）

seg-6d722c176052 = 内部測距のデータム問題の分類：一回の距離観測はランク{ "1" }を寄与します（6次元の零空間）。原点 X とスケールの対は近零であり、物理的な DE440 の秤動は欠損をゼロに引き上げますが、この対はほぼ縮退したままです

seg-ae6dc4e6ea8b = エンジンが再現した幾何構造と閉形式の 2x2 Schur の恒等式です。構造については Sosnica et al. { "2025" }（arXiv:{ "2510.15484" }）と整合していますが、そこで報告されている大きさはここでは再現していません。分類は構造的なものであり、実際の幾何のもとでの相関/CRLB の大きさは MODELLED です（反射器の座標と向きは固定）。{ "0.30" } の外部比較は所見であり（MODELLED のまま）、Sosnica et al. { "2025" } に対して、距離フィッシャー情報の原点とスケールの相関（-0.993 / -0.988）は、公表された -0.97 の{ "0.05" }以内ですが、論文自身の五反射器の幾何では、等重みの 7パラメーター Helmert 相関は -0.78 です（公表値は、論文が示していない反射器ごとの誤差に依存しています）。原点の CRLB（{ "3" } mm の測距雑音で{ "0.6" }～{ "1.2" } mm）は、論文の{ "3.07" } cm より{ "96" }～{ "98" } % 小さく、許容差は{ "20" } % です。大きさは再現していません

seg-3fd19007ea67 = 複数技術の月面データム情報（LLR＋月面 VLBI＋周回機の測距）

seg-23d0dd7d0666 = 地球・反射器間の LLR 距離、二局の月面 VLBI の差遅延、周回機・ビーコン間の距離に対するデータムのヤコビアンの行を、7パラメーターのデータムにわたり、一貫して前処理した一つのフィッシャー情報に結合したものです。径方向以外の（周回機の/深さの多様な）追跡が原点 X とスケールの縮退を解消する一方、横方向の VLBI は間接的にしか寄与しないことを示します

seg-b2f5715c4577 = 各技術の偏微分の解析と有限差分の相互検査（内部）。改善の方向は幾何学的な事実です。ビーコンの位置、スケジュール、雑音は MODELLED/代表的なものです（tests/fixtures/llr_geometry/NOTICE.md を参照）。

seg-f9796a4c9a85 = DE440 の月の主軸の向きを与えるプロバイダー

seg-ebe4519a40e4 = MOON_PA_DE440 から J2000 への回転を、2014-01-01 から 2030-12-31 TDB の間の任意のエポックで、コミット済みの{ "6" } 209行の日次系列のノード間で、測地線補間 R0·Exp(f·Log(R0ᵀR1)) により求めます（try_ 関数はその範囲外で OrientationSpanError を返し、失敗しない関数は panic し、クランプは行いません）。コンパイル時に埋め込まれるため、実行時のファイルシステム I/O はなく、WASM ビルドにも含まれます

seg-3b710c49338c = NAIF SPICE Toolkit（CSPICE N0067、spiceypy { "8.2.0" } 経由、ツールとして実行）：JPL のバイナリ PCK moon_pa_de440_200625.bpc を、NAIF 自身のフレームカーネル moon_de440_250416.tf とともに直接評価して、MOON_PA_DE440 から J2000 への pxform を、埋め込まれたウィンドウ内のノードを外れた{ "2 000" }個のランダムなエポックで計算します。Kshana と SPICE の行列の回転角は{ "1.7e-5" } rad 以内で（平均半径{ "1737.4" } km で{ "30" } m、比較の前に固定）、実測の最悪値は{ "1.7e-6" } rad（{ "3" } m）、RMS は{ "7.8e-7" } rad で、検証者が引いたさらに{ "6 000" }個のエポックでの最悪値は{ "1.75e-6" } rad でした。日次のノードは、同じカーネルから抽出したものであるため（scripts/gen_de440_moon_pa.py、フィクスチャーの SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7）、この比較が検査するのは、ノード間の補間であり、それが主張の対象です。この比較で見つかり、修正されたもの：以前の、Gram-Schmidt を用いた要素ごとの線形補間は、{ "13.2" }度/日の回転の軸は保ちましたが角度は保たず、四分点付近で最大{ "2.0e-4" } rad（{ "340" } m）の誤差がありました。約{ "14" } m という以前の数値は、区間の中点のみを標本とするガードによるものでした。この系列は 2014-01-01 から 2030-12-31 をカバーし、その外ではエラーになります（ラウンド{ "2" }）。2024-2025 のノードは、同じカーネルから{ "4.3e-13" }まで再生成されます。上記の SPICE によるノード外の比較は 2024-2025 のみをカバーしており、これが確認済みのウィンドウです。拡張したノードは同じカーネルとスクリプトから得ていますが、ノード外では比較していません。識別可能性解析のための幾何の基盤であり、サブメートル級の向きの製品ではありません

seg-ab96cfc8d48c = 月面 LLR データム幾何の基盤（主軸の反射器、地上局、解析的な距離偏微分）

seg-40e91288f81a = PA 天体固定座標系（メートル）での近側の五つの再帰反射器アレイと、測地座標での LLR の地上局。DE440 PA の向きによる反射器の天体固定から慣性系への配置。4パラメーターのデータムに関する地球・反射器間の距離の解析的な偏微分。そして、7パラメーター解析の動機となる、月中心 X とスケールの縮退を示す LLR のみのフィッシャー行列

seg-89ce1f95d9f6 = 計算は内部で検査されています：すべての解析的な偏微分を有限差分に対して、ゼロデータムのケースを公称距離に対して検査します。カタログは外部から独立に検査されています。DE440 の主軸座標（Park et al. { "2021" }、tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv）は、DE430 の表面座標メモの Table { "6" }（tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv、SHA-256 を検証した PDF から tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py で機械抽出）と照合し、{ "1.12" } m の範囲で一致します。一方、同じ五つのアレイの平均地球での実現は、{ "672" }～{ "871" } m 異なります。縮退の構造は、公表された結果に対して検査しています。Sosnica et al. { "2025" }、'Definition and Realization of the International Lunar Reference Frame'、arXiv:{ "2510.15484" } は、月の主軸座標系について、月中心 X とスケールの相関係数 r = -0.97 を報告し、その相関のために、LLR は月の実際の質量中心に{ "12" } cm より良い精度では到達できないと報告しています。このモジュールは、LLR のみのフィッシャー設計から同じ構造（|corr(t_x, scale)| は{ "0.9" }から{ "0.9999" }の間、データム欠損 <= { "1" }）を再現します。裏付けは往復の再現ではなく暦をまたぐものです。論文は INPOP21a、DE430、EPM2021 を組み合わせているのに対し、このモジュールは DE440 の秤動で駆動されます。再現していないのは大きさです。ここでの相関は約 -0.988 であり、彼らの -0.97 と異なり、4パラメーターの CRLB は、彼らが達成した{ "12" } cm の下限に対してサブミリメートルです。向きと反射器の座標を、ここでは固定し、そこでは解いているためです。幾何と縮退の構造のみであり、解いたデータムの精度についての主張はありません。{ "0.30" } の外部比較：このモジュールの実測距離の部分（reflectors()、stations_itrf()、DE440 PA の配置、重心の光行時間 llr_bcrs_one_way_m）は、独自の行である LLR の実測距離モデルで、{ "192" }個の ILRS ノーマルポイントに対して確認済みです（RMS { "2.81" } m、基準は{ "10" } m）。実測の比較は主張の残りの部分を検証しないため、この行は MODELLED のままです。測地の地球局カタログ stations() は APOLLO を{ "0.001" }度に丸めており、地心光行時間では同じ点で{ "22.7" } m になります（テスト reflector_ranges_against_ilrs_normal_points。以前の要素ごとの向きの補間では{ "96" } m）。解析的な距離の偏微分と LLR のみのフィッシャーは、llr_range_m と reflector_inertial を通じて、解析的な月の級数（ephem::moon_position、GCRS から約{ "0.3" }度）を用い、光行時間なしで計算されます

seg-a78ba110b64c = LLR の実測距離モデル（反射器カタログ、ITRF2020 の地球局、DE440 主軸の配置、IERS { "2010" } の重心光行時間）

seg-c9827c1a427b = 月レーザー測距のノーマルポイントにおける、地球局から反射器までの片道距離：DE440 の主軸（PA）天体固定座標系（メートル）での近側の五つの再帰反射器アレイ（lunar_llr_geometry::reflectors）、stations_itrf() の地球局、すなわち ITRF2020 のエポック{ "2015.0" }での Grasse { "7845" } と Matera { "7941" }（速度を含む）で、Bulletin A の極運動を用いた IERS { "2010" } 変換によって地心天球座標系（GCRS）に置いたもの（lunar_vlbi::station_inertial_position_itrs）、および運用者が公表した概略の地心位置にある APOLLO { "7045" }（速度なし）、DE440 PA の向きによる反射器の天体固定から慣性系への配置（lunar_orientation::try_de440_moon_pa_body_to_inertial、2014-2030 の外ではエラー）、そして IERS Conventions { "2010" } の Section { "11.2" } の重心光行時間（lunar_llr_geometry::llr_bcrs_one_way_m：地球局と反射器の式 { "11.19" } の天体から BCRS への変換、そして太陽、地球、月による式 { "11.17" } の Shapiro 遅延）です。入力であり、主張の一部ではないもの：重心系の地球、月、太陽の状態とポテンシャル（SPICE 経由の DE440）、IERS の UT1-UTC と極運動、そして TT から TDB に変換した実測の往復時間。ハーネス側であり、主張の一部ではないもの：テスト内の FCULa マッピングを用いた Mendes-Pavlis の天頂遅延で、仰角は測地の stations() カタログから得ます。モデル化していないもの：潮汐、地球局の偏心、反射器の熱の項

seg-536c75eebae3 = 実測：{ "192" }個の ILRS CRD v2 月ノーマルポイント（EUROLAS Data Center、DGFI-TUM、2024-04 から 2024-06、Grasse { "151" }、APOLLO { "32" }、Matera { "9" }、SHA256SUMS とともに原文のままコミット）。予測した片道距離を、TDB での実測往復時間の半分に c を掛けたものと比較します。比較の前に固定した基準：すべての{ "192" }点、かつ二つの ITRF2020 局のみの{ "160" }点の両方で、RMS が{ "10" } m 以下。基準は、エンジンの変更と実行の前にコミットした、第三の事前登録修正 3e0f5cdf によるもので、{ "10" } m という値はラウンド{ "1" }から変わっていません。実測：全点で{ "2.81" } m（平均{ "2.67" } m）、ITRF2020 局で{ "2.96" } m、APOLLO は{ "1.94" } m、{ "2015" }年の区間（{ "349" }点、副次的）は{ "3.82" } m です。変異：太陽の Shapiro の脚をゼロにすると{ "10.19" } m となり、不合格になります。開示した経緯：要素ごとの向きの補間では{ "96" } m、測地カタログによる測地線補間後は{ "22.7" } m、ITRF2020 の地球局と極運動を用いても地心光行時間では{ "10.94" } m（共通の +{ "10.9" } m のオフセット）でした。重心モデルは、そのオフセットを見た後に書かれました。これは公表された IERS { "2010" } の Section { "11.2" } のモデルで、自由パラメーターはありません。第三の修正は、ブロックされた結果の後に、自ら課した、すべて ITRF2020/SLRF2020 という条件を置き換えました。ITRF2020 のみの RMS は、ITRF2020 や SLRF2020 の解を持たず、位置が運用者の示した概略のものである APOLLO なしで基準を満たします。共通の +{ "2.7" } m が残りますが、基準を下回っており、調整していません。基準は結果に対してゆるく、{ "7.6" } m の太陽項が欠けても{ "10.19" } m になります。基準を下回る項は一つずつ分解していません。極運動をゼロにすると RMS は{ "6.15" } m（ITRF2020 局は{ "5.98" } m）、式 { "11.19" } の変換を取り除くと{ "2.96" } m で、どちらも基準を満たします。地球局の速度と、地球と月の Shapiro の項はさらに小さくなります。この比較が確認するのは、組み立てた片道距離の RMS { "10" } m と太陽の Shapiro 項であり、挙げた各構成要素ではありません

seg-9b1dfa736cb6 = 結合した月面座標系と時間尺度のゲージ：空間データム、時計オフセット、時計レートを合わせた零空間

seg-a000ef6ab2e0 = assemble_coupled_info は [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha] に対する9パラメーターの結合フィッシャー情報を構築します。classify_null_space は、その零空間を、空間のみ、時間のみ、真に結合した次元に分解した基底不変の結果と、空間から時間への射影の結合ノルムを返します。coupled_marginal_eigs は { "{" }scale, offset{ "}" } の Schur 補行列による周辺化を与えます。コミット済みのネットワークで、エンジンは、よく設定された問題ではフルランクのデータム（欠損{ "0" }）を、単一エポックの問題では、単一のレート方向の欠損を厳密に報告し（経過時間がゼロであるため、レートは構成上観測できません）、どちらについても { "{" }s, d_tau{ "}" } の周辺化を計算します。

seg-35eebbc8a2e9 = 外部で検査されるものを限定して述べます：kshana は固有値分解を自前の手書きの Jacobi ソルバー（fim::sym_eig）で、周辺化を自前の擬似逆行列で計算し、オラクルは scripts/gen_coupled_gauge_ref.py を通じて numpy/LAPACK（np.linalg.eigvalsh/eigh/pinv）で両方を再計算します。したがって rel<{ "1e-3" } での一致は、このクレートの算術を標準的な実装に対して独立したライブラリで検査したものであり、それが確認済みの主張であり、そのすべてです。検査されないもの：組み立てと零空間の分類はこのモジュール自身の規則であり、オラクルはそれらを独立した出典からではなく同じ仕様から再現するため、裏付けるのは実装であって規則ではありません。ビーコンと周回機の幾何は、モデルから計算した代表的なものです。観測行は実際の DE440 の月 PA の向き（lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial）を持ちますが、それは両側が受け取る入力であって、答えについての証拠ではなく、ステータスの根拠ではなく出所としてここに記録しています。共通モードのインテグリティの行で main がすでに引いているのと同じ区別です。network.json を書き出す前に、すべての行の浮動小数点数は小数点以下{ "6" }桁に丸めており、両側が同一の IEEE-754 倍精度を読み、残る違いはソルバーだけです。

seg-63a8571f8eb0 = 片道月面測距における距離と時計オフセットの縮退、および幾何の多様性による設計則

seg-cdd70f56051a = ノードごとの動径距離と受信機の時計オフセットの縮退は、{ "1" } m で{ "3.336" } ns（c 分の一）と厳密です。{ "{" }scale, offset{ "}" } の Schur 補行列による周辺化（coupled_marginal_fisher）は、幾何的に多様なネットワークでは、往復測距が周辺化を引き上げる割合は、同数の追加の片道データとほぼ同じである一方、理想化した単一ノードの領域では、往復の効果が桁違いに大きいことを示します。そこから得られる設計則：片道測距で月面座標系のスケールと時間尺度のオフセットを分けるのは、往復測距そのものではなく幾何の多様性であり、往復または外部の時刻の結び付けが必要なのは、多様性の低い、または単一ユーザーの領域に限られます。

seg-25dd0e9134c8 = 結合した情報行列の Schur 補行列によるフィッシャー周辺化を閉形式の線形代数で表し、それが予測する二つの極限の領域に対して検査しました。{ "1" } m と{ "3.336" } ns の等価性は c によるメートルの定義であり、経験的な結果ではありません。観測ネットワークは、モデルから計算した代表的な幾何であるため、設計則は、与えられた幾何についての記述であり、実際に配備されたいかなる月面ネットワークについても主張していません。

seg-16ec8283f9b4 = 月面時間尺度における相対論的な時計レートと座標系の結合

seg-d9a426dc8620 = rate_frame_jacobian(_with) は、次数{ "2" }で打ち切った赤道有効ポテンシャル（GM、赤道半径、J2、自転、LunarSurfacePotential）から、月面時間尺度のレートの、座標系の実現に対する感度を与えます：d_alpha/d_scale = L_m、約 +{ "3.1388e-11" }。d_alpha/d_velocity = -|v_moon|/c^{ "2" }、約 -1.11e-14（時間依存）。d_alpha/d_r_radial = g_eff/c^{ "2" }、メートルあたり約 +{ "1.806e-17" }。{ "1" } m の動径方向のデータムのずれでは、これは約{ "1.8e-17" }のレートの摂動（動径成分の算術的な帰結）であり、月面時間尺度の TT に対するおよそ{ "1.7e-11" }のレートオフセットよりはるかに小さくなります

seg-6fc3d01ea825 = 事前登録（5590ab21）：Ashby and Patla { "2024" }（AJ { "167" }:{ "149" }）の式({ "10" })、{ "3.13881" }({ "15" })e-11 に対する L_m を、論文の GM、a_m、omega_m、および論文が引用する二つの次数350の場（Bertone et al. { "2021" }、AIUB-GRL350A/B）の J2 から求め、{ "1e-4" }以内で照合しました。動径成分は、同じ場の pyshtools { "4.14.1" }（BSD-3）による赤道重力に対して{ "1e-4" }以内（実測{ "8.3e-5" }と{ "6.7e-5" }、余裕は小さい）、速度成分は JPL Horizons DE441 の月の速度に対して{ "4.5e-3" }以内で照合しました。次数350の公表値の、次数2の閉形式です（残差は次数3-350、リファレンスであり P1 ではありません）。開示：項目1の結果は事前登録の前に分かっていました。また、同梱の既定半径{ "1738.14" } km は論文の表面定義で、ラウンド{ "1" }の後に採用しました。潮汐の寄与と比較の帯域は、モデルから計算した基準面の数値のままです

seg-a666792106d9 = 結合した座標系と時間尺度の零空間の、基底不変の分類

seg-5ee36574d1b4 = classify_null_space は、データムの零空間を、空間のみ（次元 d から rank U_T を引いたもの）、時間のみ（d から rank U_S を引いたもの）、真に結合した（rank U_S に rank U_T を足して d を引いたもの）部分に分解し、さらに、零空間の射影子の非対角ブロックの Frobenius ノルムである、空間から時間への射影子の結合ノルム p_st_norm を求めます。これらはいずれも、選んだ基底ではなく射影子の関数であるため、零ベクトルの任意の正規直交な選び方の下で不変であり、これが、この分類を報告可能にしているものです。

seg-0608e1dc5183 = SciPy/NumPy（BSD-3-Clause、scipy.linalg.null_space と numpy.linalg.svd、LAPACK gesdd）は、同じコミット済みの行列を、部分空間の共通部分 dim null([F; E_T]) と dim null([F; E_S])、および SVD の零空間の射影子で分類します。これは Kshana の Jacobi 固有ベクトルと Gram ランクの式とは異なります。事前登録（d429993c）：整数は完全一致、p_st_norm は{ "1e-9" }まで（P2、独立した数値ライブラリ）、ランクのしきい値は事前に固定し、{ "1e6" }以上のスペクトルギャップを表明しています。この行の主張は、与えられた行列の分類であるため、P2 はそれを完全にカバーします。構成したケースには、直和、結合、混合の零空間、およびランダムな基底の取り直しが含まれます。coupled-gauge の行の実ネットワークの次元は、ここでは数え直していません。クレート内の不変性テスト（回転させた零空間の基底が同一の結果を与える）は維持しています

seg-2c074d6260ba = 代表的な複数技術の測定メニューと、加法的なフィッシャー結合の規則

seg-beefac5c1b13 = MeasurementBlock は、候補となる一つの測定キャンペーンを、7x7 のフィッシャー情報の寄与とスカラーの相対コストとして保持します。block_from_rows は、生のデータムのヤコビアンの行から一つを構築し、すべてのブロックが lunar_identifiability::assemble_multi_info を通じて同一に前処理されます。combine は選んだ部分集合の情報を合計します。フィッシャー情報は独立な測定にわたって加法的であるため、これが正しい規則です。representative_lunar_menu は、決定論的な四ブロックのメニュー（LLR、横方向の VLBI リムビーコン、近側の周回機、遠側の周回機）を提供します。このメニューを使う、予算制約付きの設計オプティマイザーは、このクレートの一部ではありません。

seg-d83a9942ee72 = 独立した測定にわたるフィッシャー情報の加法性は閉形式の性質であり、ここでは、独立に書いた要素ごとの和と、そこから従う順序不変性と単調性に対して検査しています。証拠についての注意：結合器には以前はテストが全くなく、モジュールの一つのテストは、それを呼ばずに二つの情報行列をインラインで合計していたため、壊れた結合器があってもモジュールはグリーンのままでした。テストは今では combine を通り、変異させると失敗します。すべてのビーコンの位置、周回機の幾何、技術ごとの精度、相対コストは、ミッションの値ではなく代表的な選択であるため（tests/fixtures/llr_geometry/NOTICE.md を参照）、このメニューを通じて得られるすべての縮退指標と CRLB の数値は、lunar_identifiability::decompose の、モデルから計算した値という位置づけを引き継ぎます。

seg-341eedfc47da = プロバイダー間の月面座標系/力学の整合性（実際の暦間比較）

seg-f8d94c0771cc = DE440/INPOP21a/EPM2021 の地心月位置の不一致を、低減可能な共通の ICRF 座標系の結び付けと、低減不能な月軌道の向きの超過に分解する、回転のみ（6パラメーターの並進＋回転）の分解（完全な 7パラメーターの Helmert フィットは別の公開関数であり、この外部検査ではカバーされません：その証拠は、内部の解析的な回復の単体テストと tests/lunar_helmert_fit_cross_check.rs であり、後者は lunar_frame_realise の確認済みの厳密な Gauss-Newton フィットと一致することを確認し、両者の逆の回転符号の規約を固定します）

seg-c69fd3fc645b = 三つの独立した権威ある暦：DE440（JPL）、INPOP21a（IMCCE）、EPM2021（IAA RAS）を IMCCE の calceph でサンプリングし、独立した numpy の SVD 最小二乗フィットで相互検査しました。同じ三つの暦について、lunar_common_mode ではなくここが確認済みである理由：ここで報告される量は公表データの性質、すなわち互いの不一致であるため、暦は入力ではなくオラクルです。lunar_common_mode では、同じ不一致が MODELLED のコンステレーション幾何に入力され、答えはそのモデルの性質であり、そのため、その行がモデルから計算した値/ReferenceImpl であるのは正しいのです。

seg-2d3347bcb15e = 複数プロバイダーを併用するユーザーのための、プロバイダー間の整合性の許容差

seg-9decf2cb6b0c = consistency_tolerance：ユーザー位置の予算を、基準のレバーアームでの、パラメーターごとのプロバイダー間 Helmert 一致の要件（原点/スケール/回転）に逆算し、必要に応じて P1 の単一プロバイダーの実現 CRLB で膨らませます

seg-b8dc68eb4bda = Helmert の点ヤコビアン作用に対する最悪ケースの三角不等式の上界（閉形式）

seg-5450d921dfc9 = 複数プロバイダーの月面相互運用性の誤差予算と、座標系対暦の設計則

seg-e1e30f5c17a6 = interop_budget：PerProvider / CommonFrameTie / CommonEphemeris の規約のもとでの、低減可能（共通の座標系の結び付け）と低減不能（力学）の分割と、低減不能な割合の設計則の指標（実際の DE440/INPOP/EPM で約{ "0.69" }：共通の座標系タグだけでは、支配的な下限が残ります）

seg-46304ae1efa4 = 各規約のもとでの、確認済みのペアごとの分割の RMS 集約（閉形式）

seg-a01f394a36d3 = 自律的な自由ネットワークの故障可観測性の線形代数パイプライン（パリティ射影子、検出可能性、MDB の非心度、ビザンチンのブロックスパーク）

seg-b3389bb90e8d = 実際の DE440 によるノードごとの月面ネットワーク（各行は、実際の DE440 の月 PA 座標系の視線を用いて pernode_range_row で構築した、ノード間の差の片道距離）で、エンジンは、重み付きパリティ射影子 P⊥ = I − G(GᵀWG)⁺GᵀW（8次元のデータム⊕時間尺度のゲージを超えて成り立つ、ランク欠損の擬似逆行列の形式）、T1 の検出可能性の残差 ‖P⊥·b‖（範囲内の故障は消え、一般の故障は検出可能）、Baarda の MDB の非心度の二次形式 cᵀWP⊥c（正しい単一の P⊥ の重み付き形式であり、二重の P⊥ の形式 cᵀP⊥WP⊥c ではありません）で MDB = √(λ₀/cᵀWP⊥c)、そして、積み重ねた有効なピア署名 P⊥·B_T（単なる非ゼロではなく列ランク）に対するビザンチンのブロックスパークの検出/識別の数を計算します

seg-8cb248423fd0 = 実際の DE440 の月 PA 座標系の視線の行に対する、独立した numpy/scipy の線形代数による再現（P⊥ は白色化した設計行列 W^{ "{" }1/2{ "}" }G の SVD から、MDB の非心度は古典的な Baarda（{ "1968" }）のパリティ部分空間の二乗ノルムから、ブロックのランクは numpy の SVD の特異値の個数から求めます）。これは、クレートの GᵀWG の巡回 Jacobi による固有値分解とは本当に異なる数値的な経路です。適用範囲（tests/fixtures/faultobs/NOTICE.md による）：これが確認するのは、これらの行に対する線形代数のパイプラインのみです。ノードの幾何は、モデルから計算したものです。運用上のインテグリティの保証、保護レベルの認証、RAIM/ARAIM の可用性についてのいかなる主張でもなく、ビザンチン故障耐性のミッションの保証でもありません。このネットワークで許容される故障の数は、モデルから計算した値である一方、検出 > f / 識別 > 2f のブロックスパークの上界は引用（Fawzi–Tabuada–Diggavi { "2014" }、Shoukry–Tabuada { "2016" }、Donoho–Elad { "2003" } のブロックごとのスパーク）であり、コードでは証明済みの具体化です

seg-ebb827739614 = 自律的なノードごとの月面ネットワークにおけるビザンチンのブロックスパークの検出/識別の上界（T3）

seg-4fb935e6193d = byzantine_bound は、安全な状態推定の符号化/疎な可観測性の上界を、ノードごとのネットワーク幾何に具体化します。ビザンチンのピアは、自身が関与する測定の任意の線形結合を注入し、ネットワークは、f = block_spark − { "1" } 以下のピアの連合を検出（DETECTS）し、⌊(block_spark − { "1" })/2⌋ 以下のピアの連合を一意に識別（IDENTIFIES）します。block_spark は、積み重ねた有効な署名 P⊥·B_T が列ランク欠損となる、最小のピアの連合です。ピアの検出可能性は P⊥·B_j の列フルランク（FULL COLUMN RANK）です（非ゼロでもランク欠損のブロックは、range(G) に入って残差を残さない非ゼロの攻撃です）。単に P⊥·B_j ≠ { "0" } であることではありません

seg-3b8b54db475d = ブロックごとのスパーク/安全な状態推定の上界（Fawzi–Tabuada–Diggavi { "2014" }、Shoukry–Tabuada { "2016" }、Donoho–Elad { "2003" } のブロックごとのスパーク、Candès–Tao { "2005" }）の幾何学的な具体化です。Lamport–Shostak–Pease の 3f+{ "1" } の合意しきい値ではありません（「ビザンチン」は任意の/結託した故障のモデル（MODEL）のみを指します）。具体的な許容故障数は、代表的なネットワーク幾何の、モデルから計算した性質であり、手で構成した解析的なケースと数の式によって自己整合性を検査しています

seg-4f57f586cf82 = 自己参照的な月面コンステレーションの自律ホールドオーバーの時間ゲージの下限（T4）

seg-eb690e8f5c9b = holdover_floor は、ノード間の測定のみで結ばれた自律ノードのアンサンブルでは、共通の時計レート（δα_j += { "1" } ∀j）が N(GᵀWG) に属するアンサンブル時間の自由パラメーターであり、ノード間測距をいくら追加してもそれを観測できないことを示します（rate_in_gauge = true、共通オフセットと合わせて temporal_gauge_dim = { "2" }）。これが真のホールドオーバーの下限であり、剛体座標系の位置ゲージに対応する時間版です。外部の絶対レートの結び付け（ネットワーク外の参照への直接リンク）を一つ加えると、共通レートが零空間から除かれ（rate_in_gauge = false、temporal_gauge_dim = { "1" }）、この下限が発振器モデルのアーチファクトではなく、実際のゲージであることが証明されます

seg-097f126797bb = アンサンブル時間の自由パラメーターの議論（Percival { "1978" }、Lewandowski & Thomas { "1991" }）を、代表的な実際の DE440 によるノードごとのネットワークに具体化したもの：解析的な共通レートの生成子を GᵀWG に対して行う相対残差の零検定で、結び付けを切り替えた対比により、真のゲージと発振器モデルのアーチファクトを区別します。代表的な、モデルから計算した幾何であり、タイミング予算の認証ではありません

seg-25ffd6e1979c = プロバイダーの共通/差分の分割、ランク欠損の一本化、保護ギャップの傾き（T5 / §{ "0" } / g7）

seg-72c7ec3724bf = 単一の分解 ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) の三つの側面です。N(G) は 8次元のデータム⊕時間尺度のゲージ、range(G) は state_dim − { "8" } = { "32" } の観測可能な方向です。(T5) provider_mismatch_split は、共通の複数プロバイダーのバイアス（∈ range(G)）を検出不能（UNDETECTABLE）で外部の結び付けが必要なものと分類し、差分のバイアス（∉ range(G)）を自己監視される/検出可能（DETECTABLE）なものと分類します。(§{ "0" }) 一本化とは、同じ（SAME）range(G) の盲部分空間が検出不能な故障のクラスを支配するため、データムのゲージ N(G) と故障に盲な部分空間 range(G) は二つではなく一つの幾何であるということです。(g7) slope は、故障 b ∈ range(G)（パリティがゼロで推定量が破損）に対して Brown の保護ギャップの傾き ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ を、検出可能な故障に対して有限の値を返します

seg-e0fd3860fce9 = 代表的な実際の DE440 によるノードごとのネットワークにおける、閉形式のパリティ射影子/擬似逆行列の代数：共通/差分の分割、N(G) ⊕ range(G) の一本化、Brown（{ "1992" }）の保護ギャップの傾きは、いずれも範囲の消去 P⊥·G = { "0" } から導かれます。代表的な、モデルから計算した幾何であり、保護レベルの認証ではありません

seg-101b0551d987 = ホールドオーバーの時刻誤差系列に対する通信タイミングの MTIE と TDEV

seg-b4762fd3cb9d = <c1/> シナリオ種別が報告する最大時間間隔誤差と時間偏差を、通信規模のホールドオーバー記録に対して求めます。O(n) の単調キューによるスライディングウィンドウ MTIE（telecom_timing::mtie_sliding、一日分の一秒サンプルを高速に保つために必要）と、エンジンの TDEV（allan::time_deviation）を、その種別が報告するグリッドで評価し、系列を取り込む完全な実行から読み戻します

seg-59cb2711355c = allantools { "2024.06" }（独立したサードパーティの周波数安定度ライブラリ）の mtie() と tdev() を tests/fixtures/telecom_timing/holdover_te_series.csv に適用します。系列は両側で同じ 17桁の有効数字のテキストから解析し、参照は系列の SHA-256 を記録し、tests/fixtures/telecom_timing/generate_telecom_timing_reference.py でオフラインで再生成できます。確認するのはこの記録に対する推定量（ESTIMATORS）であり、それを生んだ合成のホールドオーバーではありません

seg-632add2dbd3c = PASS/FAIL とマージンを持つ ITU-T 通信同期マスク

seg-47687529aee7 = ITU-T G.8272（07/2025）PRTC-A/B、G.8272.1（{ "2024" }）Amd. { "1" }（07/2025）ePRTC のロック時と ePRTC-A のホールドオーバー（Table { "3" } の時刻誤差エンベロープを含む）、G.8273.2（{ "2023" }）Amd. { "2" }（11/2025）T-BC/T-TSC のクラス A-D、G.8271.1（{ "2022" }）Amd. { "3" }（05/2025）の参照点 C の限界値を、各区間は表の記載どおり開区間または閉区間として転記し、「for further study」の項目はすべて除いています。検査ごとに、判定と、拘束される点でのマージン、各予算を超えるまでの時間を出します。<c1/> シナリオ種別として実行できます

seg-46b139a58bb0 = 名前を挙げた勧告（itu.int から自由にダウンロード可能）の転記であり、各限界値には表または条項が付き、未確認または未実装の項目はすべて docs/TELECOM-TIMING.md に列挙されています。表が含意する折れ点の連続性の恒等式はテストで検査します。内部整合性の検査を伴う標準の転記であり、適合性試験でも外部での検証でもありません。{ "0.30" } のラウンド{ "2" }（事前登録 970003ee）はブロックされています（MODELLED のまま）：勧告が計算例として印刷している十個のマスクの値と十三個の ePRTC-A ホールドオーバーの値（G.8272 Figs. 1-2、G.8272.1 Amd.1 cl. { "8.2.1" } と Figs. V.1-V.3、G.8271.1 Amd.3 Figs. 7-2 to 7-4）は、印刷された単位の半分以内で再現され、その大半は表の定数または折れ点です。G.8271.1 Fig. 7-2 は、自身の Table 7-1（{ "197.5" } ns）に対して{ "1.3" } s で{ "200" } ns と表記しています。G.8273.2 のクラス A-D の限界値には印刷された計算例がなく、G.8272.1 の ePRTC のロック時の折れ点のラベル（実線の作図線上）は、事前登録した選択規則により除外されたため、それらは転記のままです

seg-165ed2bc771a = ITU-T 周波数同期のワンダー生成マスク（G.811、G.812、G.8262、G.8262.1）

seg-953793d4446a = <c1/> 種別のための、七つの恒温の MTIE と TDEV のワンダー生成マスク：G.811（09/1997）PRC（自律）、G.812（06/2004）の Type I、II、III、G.8262（10/2024）EEC の Option { "1" } と { "2" }、G.8262.1（11/2025）eEEC（ロックモード）で、表が書くべき乗則の部分（<c2/> など）を含み、各区間は印刷どおり開区間または閉区間として、条項が述べる{ "10" } Hz フィルターを通して測定します（サンプリングの前に適用されるものとして扱います）。参照シナリオ scenarios/telecom-synce-eec.toml は、フリーランの OCXO を三つの EEC マスクに対して設定します。未実装：温度変化時の許容値、ホールドオーバー、過渡、ジッター、G.811 の周波数精度

seg-ca16d9c98dc5 = 名前を挙げた勧告（2026-10-13 に itu.int からダウンロード）の転記であり、すべての行をテキストに照らして読み直し、印刷された係数が含意する折れ点の連続性をテストで上から抑えています（例：G.812 Table { "4" } の{ "100" } ns のプラトーに対して{ "40" } · { "10" }^{ "0.4" } = { "100.48" } ns）。内部整合性の検査を伴う標準の転記であり、適合性試験でも外部での検証でもありません。G.812（06/2004）は、先行公開された 08/2026 版によって置き換えられたと記載されており、G.811 には Amd. { "1" }（04/2016）がありますが、どちらも読めなかったため、どちらも検査していません。フリーランの OCXO シナリオは、ループの時定数に対して長い観測間隔では、発振器の寄与を過大に見せます。いかなる機器の時計についても何も述べていません

seg-5fc2ad88faf0 = 正規化した位相系列として読み込む、クロックログ形式（RINEX clock、TimeLab ASCII、TAPR TICC）

seg-5b5bcbdea166 = clock_log::read_input：RINEX クロックファイル（名前を指定した一つの時計の AS/AR レコード、バージョン{ "2" }と{ "3.00" }から{ "3.04" }）、TimeLab 形式の ASCII の位相または周波数ログ、または TAPR TICC のタイムスタンプまたは間隔のログを、tau0 をヘッダーまたは中央値の間隔から定めた一様な位相グリッドに変換する、一つのパーサー層です。すべての欠損、グリッド外の読み値、重複を数え、拒否、最長連続区間、線形補間のいずれかの欠損ポリシーを持ちます。telecom-timing の系列（<c1/>、<c2/> ブロックを追加）と clock 種別（<c3/>、ADEV、TDEV、MTIE、表の SHA-256、位相の SHA-256 を含む <c4/> ブロックを追加、runs = { "1" }）に、オプトインで組み込まれています。表がない場合、どちらの種別もバイト単位で同一です

seg-1d3df655c14c = tests/fixtures/clock_log/PREREGISTRATION.md で事前登録（単独でコミット、159334f2、フィクスチャーの存在前）し、RESULTS.md に記録しました。形式ごとに一つの、シード付きの三つの合成ログ（三エポックの TICC の欠損、無視すべき二つ目の RINEX の時計）を、同じ作者が docs/CLOCK-LOG-FORMATS.md から書いた独立したリーダーで読み戻しました：グリッド、欠損、補完の数は等しく、最大の位相差は{ "0" } s（基準は{ "1e-13" } s）でした。その位相に対する allantools { "2024.6" } の oadev、tdev、mtie は、評価するすべての平均化係数で、相対{ "2.5e-14" }以内で一致します（基準は{ "1e-10" }）。エンジンが報告する記録全体の MTIE は評価しないため、ログごとのその一点にはオラクルの値がなく、記載どおりの基準はそこでは満たされていません。MODELLED：合成ログであり、リーダーのオラクルは作者を共有しています。機器から得た実際の TimeLab、TICC、RINEX のクロックファイルは比較していません

seg-acdb0337bce7 = 正規化した位相系列として読み込む、クロックログ形式 linuxptp（ptp4l、phc2sys、ts2phc）と chrony（tracking、statistics）

seg-e87b3dba2072 = clock_log::read_input の形式 ptp4l、phc2sys、ts2phc、chrony-tracking、chrony-statistics：linuxptp のサーボ行のログされたオフセット（ns、その行自身の角括弧付きのタイムスタンプ、サーボが最初に s2 を報告する前の読み値は除外して数える）、または chrony の tracking または statistics ログのオフセット（s、列の位置、UTC の日付と時刻）は、ほかの形式と同じ欠損ポリシーを通して、一様な位相グリッドになります。ソースセレクター（<c1/>）は、複数のインターフェース、時計、アドレスのうち一つを指定します。ログは telecom-timing の系列、clock 種別、holdover-test 種別に入力されます

seg-fb9393044576 = フィクスチャーは、デーモンの公開されている行のレイアウトから Kshana のために書いたもので、値は作り物です（フィクスチャーフォルダーの NOTICE.md）。実際のインストールのログは読んでおらず、解析を別のリーダーと比較するオラクルもないため、デーモンのバージョンによって異なるレイアウトは、拒否されたり、誤って読まれたりする可能性があります。位相系列に入力される推定量は、上の行で allantools に対して照合して確認したものです

seg-97aebb84576e = 運用者が提供した時刻誤差の記録から採点するホールドオーバー試験

seg-ab533cf99c56 = <c1/> 種別：時刻誤差の記録（linuxptp、chrony、TICC、TimeLab、RINEX のクロックログ、または time_s,time_error_ns の組）は、運用者が示す GNSS 除去と復旧の二つの時刻で、ベースライン、ホールドオーバー、復旧の各ステップに分割されます。ベースラインはロックされた時計向けに書かれた ITU-T マスクに対して、ホールドオーバーはホールドオーバーまたは自律時計向けに書かれたもの、ePRTC-A のホールドオーバーのエンベロープ、時刻誤差の予算に対して測定されます。ホールドオーバーは、システムが保った最小二乗の周波数オフセットを報告し、復旧は、|TE| が指定した帯域内に入ったかどうか、いつ入ったか、指定した滞留時間にわたってとどまったかどうかを、ピークと最大のステップとともに報告します。すべての限界値は telecom-timing 種別が転記したものであり、二つの時刻は運用者の申告であって、検証されません

seg-a54380cf95ea = 傾き、ステップ、極値、復旧時間が実行前に分かっている式から作った記録に対する手計算（テストがそれらを述べています）と、上の telecom-timing の行のマスク、エンベロープ、予算です。実際のホールドオーバーの実験室測定は採点しておらず、外部オラクルとの比較も行っていないため、この種別は、いかなる時計やシステムについても主張しません。時計クラスごとのいかなる数値も昇格させるには、タイミングラボのパートナーが必要です

seg-94cbac97a1aa = 宇宙サービスボリュームとその先での GNSS 信号の可用性：ICG SSV ブックレットとの比較

seg-c59e349fdc9e = <c1/> 種別の可用性の掃引：コンステレーションごと（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）と合成で、球面上のユーザー（ブックレットの 2,562点のグローバルシェル、{ "14" }日間、{ "1" }分刻み）または軌道上のユーザー（GEO、HEO、月遷移）について、信号が一つ以上、および四つ以上ある（ユーザー、エポック）の組の割合と、最長の途絶を、ブックレットの付録 C のケプラー軌道、基準のオフボアサイト角内での一定の最小放射電力、球に{ "50" } km を加えた地球による遮蔽、C/N0 のしきい値から求めます。ユーザーアンテナはブックレットの表 B10 のものです

seg-d71c9d361342 = ICG 宇宙サービスボリュームのブックレット（UN OOSA ST/SPACE/75、{ "2018" }）は、それ自体がシミュレーションですが、実行の前にコミットした事前登録（xval/gnss-ssv/PREREGISTRATION.md、結果は xval/gnss-ssv/RESULTS.md、tests/ssv_booklet_results.rs で固定され、外れも含む）のもとで比較しました。事前登録した読み方での実行{ "1" }：最小放射電力の定数と月の基準は一致します（S0、S6 は合致）。上側と下側の SSV、RF しきい値、GEO、HEO の基準は NOT MET で、ほぼすべて GLONASS によるものであり、ブックレットは表 B2 と B6 で{ "20" }度と{ "28" }度、表{ "4.2" }で{ "26" }度と{ "34" }度としています。表{ "4.2" }の角度を用いる診断用の変種は、上側 SSV、下側 SSV、六つの GEO ミッションのすべてのセルで一致します（実行{ "1" }を置き換えるものではなく、RF、HEO、月のセルは依然として外れます）。実測の GPS L1 パネルパターンは、パラメトリックな代用では再現されません（基準{ "3" } dB に対して RMS { "6" }～{ "9" } dB）。一致が示すのは、ブックレットの述べる方法が再現されたということであって、GNSS 信号がそのように振る舞うということではありません

seg-d2f04991c8a4 = <c1/> 種別における、掠める GNSS 信号に対するリム線の電離圏、プラズマ圏、大気の効果と、弱信号の受信機設計

seg-1a1786ba90b6 = Chapman 電離圏、Gallagher 型のプラズマ圏、中性大気（屈折率による曲がり、酸素吸収、デフォーカス）を、送信機とユーザーを結ぶ直線の光線に沿って積分したもの：斜め方向の全電子数、そのプラズマ圏の部分、余剰遅延、接線高度、掠めるリンクでの損失。そして、捕捉とトラッキングループのモデルから C/N0 のしきい値を定める、弱信号の受信機設計（コヒーレントおよび非コヒーレント積分、データビットの限界、アイディング、ドップラー探索）

seg-4ca1217472ab = テストにおける閉形式と公表された大きさ（Chapman 層のピークと地表のリムの曲がり、GPS から GEO への光線でのプラズマ圏の数 TECU）。受信機設計は、捕捉とトラッキングループのモデルとそのテストを再利用します。実測のリム観測や弱信号受信のデータとの比較は行っていません

seg-6b8f9f3ca2a3 = 高軌道および月遷移軌道の宇宙機のための、搭載 GNSS 航法フィルター

seg-39ddc494f103 = <c1/> 種別の <c2/> モード：擬似距離に対する九状態の拡張カルマンフィルター（位置、速度、受信機の時計バイアスとドリフト、太陽輻射圧のスケール）で、擬似距離の可用性、雑音、C/N0 は掃引と同じリンク幾何から得ます。真値は J2、太陽と月の第三体、影を含む輻射圧で積分し、フィルターは J2 と第三体をモデル化し、輻射圧を推定します。GNSS 軌道の内側と上側での位置と速度の誤差、最長の測定欠損、平均 NEES を報告します

seg-469602656ab4 = フィルター自身の推定に対するシミュレートした真値（整合したフィルターの平均正規化推定誤差二乗は、位置でおよそ{ "3" }）と、固定シードでの決定性です。飛行データや記録された高軌道の GNSS データとの比較は行っておらず、太陽と月は低精度の円軌道の代用です

seg-5fc242476828 = GNSS による高楕円軌道の複数宇宙機フォーメーションの相対航法

seg-f67eb29d4483 = <c1/> 種別の <c2/> モード：チーフとデピュティがそれぞれ絶対フィルターを実行し、チーフに対するデピュティの位置を、絶対推定値を引くことと、両機が追跡する信号の一重差分の擬似距離に対する相対フィルターによって推定します。相対的な力学は、二つの非線形な軌道の差です

seg-69c078b57fc8 = 絶対フィルターと同じシミュレートした真値：真の相対状態に対する相対フィルターの誤差と、二つの独立した絶対測位を引くのと少なくとも同程度によいことの検査です。飛行フォーメーションのデータとの比較は行っていません

seg-7038f6902820 = 冷却原子干渉計の誤差項：ラマンレーザーの位相雑音、波面曲率のバイアス、縞の曖昧さの解決

seg-4d9690207607 = inertial::cai_error_terms（ライブラリ関数であり、まだシナリオ種別からは到達できません）：方形パルスの三パルス干渉計のラマン位相の重み関数（Cheinet et al. { "2008" }、式 { "8" }）と、白色位相の閉形式 (pi/2)^{ "2" } S_phi0/tau_R、および任意のスペクトルに対する数値的な経路。再帰反射の遅延が打ち消さないレーザーの周波数雑音（Le Gouet et al. { "2007" }、式 { "9" } から { "11" }）。熱的な雲の純粋なデフォーカスによる波面バイアス sigma_v^2/R と、検出半径によるその低減。古典的な加速度計の補助と二つの問い合わせ時間に対する誤った縞の次数の確率 erfc(pi/(sqrt({ "2" }) s)) と、その逆関数

seg-a7b220763674 = 各閉形式は、テストにおける独立した数値的な経路（正確な伝達関数と遅延フィルターの周波数領域の求積、波面バイアスに対する原子にわたるモンテカルロ、縞の次数に対するショットにわたるモンテカルロ）とその極限ケースに対して検査します。公表された計算例が一つあります：Cheinet et al. { "2008" }（arXiv:physics/0510197、Sec. IV）は、tau_R = { "20" } us で、ショットあたり{ "1" } mrad のためには、-111 dB rad^2/Hz 未満の白色ラマン位相雑音が必要であると述べています。白色項のみでは{ "0.99" } mrad になります（論文はそのレベルを、フリッカーと白色を合わせた式 { "17" } で導いています）。内部整合性と一つの計算例であり、外部での検証ではありません。高次の収差と、特定のレーザーの雑音はモデル化していません

seg-c380ec16a4f8 = Allan、修正 Allan、Hadamard の各分散の、Greenhall と Riley による厳密な等価自由度

seg-dee2a54c5019 = allan::edf_greenhall（edf_greenhall_adev、_mdev、_hdev のラッパー付き）：Greenhall と Riley、Proc. 35th PTTI（{ "2003" }）、Section { "3" }（式 { "7" } から { "13" } と、Tables { "1" } から { "3" } の大きな J の係数）の完全なアルゴリズムで、差分の次数{ "1" }から{ "3" }、雑音の指数 +{ "2" } から -4 で alpha + 2d > { "1" } となるすべての場合、オーバーラップありとなし、修正ありと修正なしの推定量に対応します。適用されない場合は NaN で、ceil(M/S) <= d の修正なしホワイト PM のケース（閉形式は未実装）を含みます。assurance::uncertainty::edf は現在このコードを共有し、出力をビット単位で維持しています

seg-695ec24f9676 = allantools { "2024.6" } の ci.edf_greenhall は、公表されたアルゴリズムのサードパーティ実装で、xval/greenhall-edf/PREREGISTRATION.md で事前登録したグリッド（単独でコミット、0db0bb7a、いかなる比較よりも前）に対して scripts/gen_greenhall_edf_ref.py で実行しました：有限の edf を返すすべての{ "4 876" }点で、kshana は相対{ "6.0e-13" }以内で一致します（基準は{ "1e-9" }）。{ "46" }個の NotImplementedError の点では kshana は NaN を返します。すべてのケースラベルが現れます。ラッパーはコアとビット単位で等しく、uncertainty::edf は{ "274 280" }個の値にわたってビット単位で同一です（リファクタリングの前に SHA-256 として固定）。{ "32" }点（alpha -4、d { "3" }、修正なし、ケース{ "2.2" }）では、allantools が Table { "2" } の参照で失敗するため、オラクルの値がなく、数えていません。Stable32 は実行していません。{ "0.36" } の改訂（docs/revisions/STUDIO15-greenhall-edf-portable.md）：ポータブルな演算では、カーネルは対数を、一度だけ丸めた double-double の評価から取り（allan::greenhall_ln）、変更していない基準{ "1" }は、すべての{ "4 876" }点で再び成立し、相対の最悪値は{ "6.0e-13" }です。uncertainty::edf のガードは、{ "0.36" } のポータブルなダンプに再基準化されています（{ "274 280" }個の値のうち{ "3 746" }個が、ホスト演算の基準から、最大で相対{ "1.6e-12" }動きました）

seg-363705e03bac = 公開データシートからの発振器ホールドオーバーのプリセット

seg-9750d9e0ec7a = 四つのプリセット：OCXO（Microchip OX-208）、ルビジウム（Microchip 8040C）、セシウム（Microchip 5071A 高性能チューブ）、CSAC（Microchip SA.45s）で、それぞれがデータシートのアラン偏差の最大値、エージング、温度の上限を持ちます。非負の最小二乗による白色＋フリッカー＋ランダムウォークの周波数雑音のフィットを、すべてのデータシートの点を包絡するようにスケールし、最長 τ の数値を決して下回らないフリッカーの下限、線形のエージング、正弦波の温度項を用い、GNSS 喪失後のシード付きホールドオーバーとして合成します

seg-95aaa171864b = 入力の数値については、名前を挙げた四つの Microchip データシート（文書番号と URL は各プリセットと docs/TELECOM-TIMING.md にあります）、内部検査としては、閉形式のエージングのランプと、フィットの包絡の性質です。数値を雑音モデルにする方法（フィット、下限の規則、30日の月、線形の温度の読み取り）はモデル化の選択であり、どのプリセットも個体の測定ではありません。{ "0.30" } のラウンド{ "2" }は、実測の個体に対する片側の基準（事前登録 a01c491c）で、所見です（MODELLED のまま）：ESA MGEX の最終クロックにある IGS 局 THU2 の Symmetricom 8040C は、アラン偏差がルビジウムのプリセットの{ "0.35" }から{ "0.87" }ですが、ホールドオーバー誤差はその{ "1.07" }から{ "1.60" }です。5071A の記録は、{ "1000" } s まではセシウムのプリセットの外にあり（測定の白色位相雑音、{ "1" } s で 30倍）、ホールドオーバーでもそうです（{ "1.15" }から{ "8.74" }）。{ "2011" }年の最悪の生産品の SA.45s は、{ "1" } s で CSAC のプリセットの 1.26倍です。OX-208 には実測の記録がありません（ブロック）

seg-69f93d5ec864 = 実測の時計記録からのホールドオーバー予測、ホールドアウトのデータで検査

seg-8bdc5a24c66d = <c1/> 種別の実測記録の経路：位相記録のオーバーラップ Allan 偏差を、edf 重み付きの非負最小二乗で、白色位相と IEEE Std { "1139" } の周波数変調の基底にフィットし（slot_timing::fit_weighted）、時刻誤差がしきい値に達するコースト時間について反転します（slot_timing::slot_budget）。赤色雑音の下限は、仮定するのではなく、記録から測定します

seg-c888226296fe = 実際のフリーランの原子時計：水素メーザーに対して測定した、5071A セシウム標準の{ "556 990" }個の一秒の位相サンプル（A. Wallin、allantools とともに配布、固定したコミットと SHA-256 は scripts/fetch_cs5071a.sh）で、推定量について tests/cs5071a_reference.rs が使うのと同じ記録です。ホールドアウトした三分の二は、予測が見ていない外部の測定です。データによるゲート：realdata-clock ワークフローが記録を取得し、KSHANA_REQUIRE_REALDATA={ "1" } でテストを実行します。確認するのは、白色 FM が支配的な原子標準に対する、約{ "50 000" } s までのコーストでの、フィットしてから反転する経路であり、データシートやクラスの出典、決定論的な項ではありません。水晶発振器ではありません：実測の OCXO の記録（tests/slot_timing_ocxo_holdout.rs、allantools、水素メーザーに対して{ "5.5" }時間）では、ホールドアウトの予測は保守的で、測定した逸脱の{ "0.59" }から{ "0.70" }であり、その発振器の雑音の下限が記録の間に半分になったため、大半は基準の外です。標本内では{ "0.98" }から{ "1.17" }の範囲内です。水晶のケースは MODELLED のままです。軌道上の原子時計でもありません：{ "10" }個の GPS Block IIF 衛星時計（tests/slot_timing_igs_holdout.rs、IGS の最終{ "30" } s クロック、{ "14" }日間、プロトコルはダウンロード前に作成）では、{ "8" }個が基準の範囲に収まり、{ "2" }個（G25、G30）は最大で約2倍まで楽観的であるため、プロトコルのもとでは、軌道上のケースは MODELLED のままです

seg-d7e03158b972 = フリーランの時計が時刻指定スロットのガードを離れるまでの秒数と、それを内側にとどめる補正の頻度

seg-0b4d8815f756 = <c1/> 種別：予測誤差 E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² を、逸脱、残り時間、補正の遅延を差し引いた再同期の間隔、一日あたりの補正回数について反転し、各項を内訳として示し、支配的なものを名指しします。時計は、六つの ClockClass の既定値（TCXO、OCXO、RAFS を追加し、それぞれ一つのデータシートを引用）、telecom-timing のプリセット、インラインのデータシート、または実測の記録から取ります。出典の最長の平均化時間を超える逸脱は、外挿としてフラグを立てます

seg-cc0464060e58 = 各項単独の閉形式と、独立した holdover::holdover_seconds の求根です。データシートの数値は、名前を挙げた文書です（docs/SLOT-TIMING.md）。クラスの既定値は仮定した赤色雑音の下限に基づき、データシートの出典は最大値の包絡であるため、どちらも個体の測定ではありません

seg-2797643153dc = GNSS スプーフィング下にある軌道上の受信機のタイミング保護レベル

seg-cb412a2ffadf = orbital_timing::orbital_timing。<c1/> kind のスプーフィングのセクションとして利用できます。円軌道の速度と周期、地上のスプーファーが 一回の通過で衛星に到達できる最長時間、時計支援モニターの下限と CUSUM の検出遅延、条件付き保護レベル（下限に、検出遅延の間のコースティングを加えたもの）、規定の最大ランプレートのスプーファーが、衛星が可視範囲を離れるか独立した確認が行われるまでに蓄積する引き込み量、そして各地上接触またはクロスリンクの確認が 一台の地上スプーファーから独立しているかどうかを扱います

seg-3d441db3a373 = 既存のタイミング保護レベルと、円軌道および球形地球での可視性の閉形式への帰着です。検出されることを前提とし、規定のランプレートの地上スプーファー 一台、自転しない地球上での真上の通過を条件とします。スプーフィングを受けた軌道上の受信機では、外部の参照による確認は行っていません

seg-158a99d40b0d = L バンド信号の電力スペクトル密度とスペクトル分離係数の閉形式

seg-17060c71fa54 = GPS L1 C/A と L2C（BPSK({ "1" })）、GPS L5 と Galileo E5a（BPSK({ "10" })）、sine-BOC({ "1,1" })、Galileo E1 MBOC(6,1,1/11)（navsignal::Modulation::psd に MBOC の変種を追加）の単位面積の電力スペクトル密度、数値的に求めたそのヌルと最大値（spectrum::psd_nulls_hz、psd_peak_hz、main_lobe_null_to_null_hz）、任意のオフセットでの任意のスペクトルに対する信号のスペクトル分離係数（navsignal::spectral_separation_coeff_offset）、またはトーン、平坦な雑音、チャープ、整合雑音に対するスペクトル分離係数（spectrum::Jammer::ssc）、および耐ジャミング係数 Q = 1/(R_c kappa)

seg-d8fadba57203 = 公表されている教科書の値：ヌルからヌルまでが 2n x { "1.023" } MHz である BPSK(n) のメインローブ、狭帯域（CW）ジャマーに対する耐ジャミング係数 Q = { "1" } と、C/A に整合したスペクトル拡散ジャマーに対する Q = { "1.5" }（Kaplan & Hegarty, Understanding GPS/GNSS, 第 3 版, section { "9.4" }）、プラスマイナス m x { "1.023" } MHz に中心をもつ BOC(m,n) のメインローブ（Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }）、C/A と C/A、BOC({ "1,1" }) と BOC({ "1,1" })、C/A と BOC({ "1,1" }) のスペクトル分離係数 -61.8、-64.8、-67.8 dB/Hz（Betz { "2001" }、Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, May/June { "2006" }）で、いずれもパーセバルの自己相関の閉形式から再現しています。BOC({ "1,1" }) の最大値は { "1.023" } MHz にはありません。ローブはキャリアのヌルから { "2.046" } MHz まで広がり、{ "0.759" } MHz でピークとなり、テストは両方を固定しています。MBOC の混合は ICD の定義であり、確認したのは単位面積と線形性のみです

seg-f134975d4ffa = スクリプト化したジャマーのタイムラインに基づく、帯域ごとの J/S と実効 C/N0 を伴う L バンドスペクトルのウォーターフォール

seg-86ad8f89a822 = <c1/> kind：L バンドの電力スペクトル密度の周波数×時間グリッドです（熱雑音の下限 k T_sys、ここで T_sys = T_ant + { "290" } K (F - { "1" })、インターフェース仕様上の最小受信電力にある各信号、および on/off の時刻をもつ連続波、狭帯域、チャープ、整合雑音のジャマー）。各セルはそのビンと行にわたって平均されます（チャープは完全および部分的なスイープにわたって厳密に、ジャマーはデューティによって平均）。行ごとに、帯域ごとの実効 C/N0 = [1/(C/N0) + sum (J/S) kappa]^-1、帯域ごとの J/S、帯域内の J/S、そして C/N0 のバーを伴う SVG ウォーターフォールを出力します。レポートには、同じリンク入力に対する <c2/> kind のチェーンとの相互チェックを含みます

seg-deead3dc3c43 = 既存の <c1/> kind の耐ジャミング式とリンクバジェット（同じコードを同じ入力で呼び出したもの）、および k T0 F の雑音下限の閉形式への帰着です。その下にある信号スペクトルは上の、外部の参照と照合して確認済みの行であり、ジャマーの電力、タイムライン、フロントエンドの帯域幅はシナリオの入力で、スペクトルは連続的であり（拡散符号の線スペクトルなし）、ジャマーに対して自動利得制御、ブランキング、アンテナパターンは作用しません。この合成を照合できる、測定されたジャミング下のスペクトルはリポジトリにありません。<c2/> kind の Q の表（CW と狭帯域は { "1" }、広帯域とスイープは { "0.36" } 以降 { "2" }：教科書の値で、navsignal の閉形式に固定）は、このモデルの CW の値とは一致しますが、このモデルが導く C/A に整合した雑音の値（{ "1.5" }）や、帯域内の正規化を行わない平坦なヌルからヌルまでの雑音の値（{ "2.2" }）とは異なります。レポートは両方を表示します

seg-1461dcaed6be = SigMF 記録の入出力、および複素 IQ の Welch スペクトル推定

seg-2195d95299b2 = sigmf：Signal Metadata Format の記録を読み書きします（コアの global、captures、annotations フィールドをもつ JSON の .sigmf-meta、cf32_le、ci16_le、ci8 の生の .sigmf-data。整数デコーダーは realdata::iqif::load_iq と共有）。すべて文字列とバイトバッファ上で行います。spectrum::welch_psd：ハン窓、オーバーラップ、平均化したピリオドグラムで、密度スケーリングを行い、クレート内の基数 2 の変換（spectrum::fft_in_place）上で動作します。この 二つが確認済みとする主張の範囲です。spectrum::synthesise_iq はモデルを IQ として生成し、<c1/> kind の [iq] セクションは、モデルから IQ、SigMF、Welch へと処理してモデルと比較します。[recording] セクションは実際の記録を推定します（ネイティブビルド）。この合成とそれらのモデルとの比較は、確認済みとする主張の範囲外です

seg-4e51d1a77382 = scipy { "1.18.1" } の scipy.signal.welch（BSD-3-Clause）で、同じ周期的ハン窓、オーバーラップ、密度スケーリング、デトレンドなし、両側の平均を用いたもの：{ "27" } ケースにわたり、すべてのビンが相対 { "1e-12" } 以内（観測値 { "6.0e-14" }）で一致し、セグメント数は scipy 自身のスペクトログラムから取得しています。sigmf-python { "1.13.0" }（LGPL-3.0、ツールとして実行）が 五件のサードパーティ製の記録（cf32_le、ci16_le、ci8、annotations をもつ 二件の captures、ゼロでない最初の sample_start）を書き出し、クレートはそれらをビット単位で同一にデコードして、コアフィールドも同一でした。クレートの記録も、ビット単位で同一に読み戻されます。SigMF { "v1.2.6" } のメタデータスキーマは、クレートのメタデータに対してエラーなしと報告します。許容差は最初の比較より前に固定しています。主張の範囲外：spectrum::synthesise_iq、および [iq] と [recording] のモデルとの比較（合成には 一つだけの正解はありません。周期的なチャープでは、滑らかなモデルにはない線スペクトル、フレネルリップル、端のテールが現れ、全電力は { "2" } % 以内です）、整数から浮動小数点へのスケーリングの規約（クレートは { "32767" } と { "127" } で割り、sigmf-python の autoscale は { "2" }^{ "15" } と { "2" }^{ "7" } で割ります。仕様はこれを規定していないため、比較には生のコードを使います）、マルチチャネルの記録、およびリーダーが拒否するデータ型

seg-bf2d02d76762 = JPL Standish のケプラー要素による太陽系全域の惑星位置

seg-c9d3549045eb = 水星、金星、地月系重心、地球、火星、木星、土星の日心位置は Standish の Table { "1" }（西暦 { "1800" } 年から { "2050" } 年）から、全 八惑星の日心位置は Tables 2a/2b（紀元前 { "3000" } 年から西暦 { "3000" } 年、b、c、s、f の平均近点角の項を含む）から求めます。JPL のページのアルゴリズムを一歩ずつ踏襲し、ページの黄道傾斜角によって ICRF（International Celestial Reference Frame）へ回転します。地球は、Montenbruck & Gill の月の級数と質量比により重心から分離します。任意の天体を他の任意の天体に対する相対位置として扱えるよう、ephem_provider::AnalyticSolarSystem として構成されており、<c1/> kind として実行できます

seg-24e058d4d094 = JPL Horizons DE441 の幾何学的な日心ベクトル（黄道座標と ICRF）で、事前登録のコミット { "80451866" }、8d38a28b、558cc807 の後に取得しました。合格基準：惑星と成分ごとに、RMS が Explanatory Supplement 第 3 版 Table { "8.10.1" } の近似誤差（地球は EMB の行）の 1.0 倍以下であること。地球と EMB の分離は DE441 の { "399" } から { "3" } を引いたものと直接照合し、1950 年から 2050 年のすべてのエポックで { "0.3" } 度以下、{ "8.1" } km 以下です（{ "8.1" } km の長さの基準は、Montenbruck と Gill を引用する Kshana 自身のエフェメリス文書に記された月の級数の精度に由来し、書籍とは照合していません。測定値 { "6.09" } km はこれに近い値です）。RMS という統計量は、以前の 27エポックの比較で最大時に公称の 1.87 倍に達したことを知った上で選びました。単一エポックの誤差は 3.83 倍に達します（ICRF の場合は 3.87 倍）。Supplement はその数値を RMS として定義していません。ケース B はテスト内に記した IAU { "1976" } の黄道傾斜角で両側を回転するため、回転が自分自身と照合されることはありません。AnalyticSolarSystem の既定のテーブル選択は検証していません（テストは Table { "1" } を強制）。Table { "1" } による天王星と海王星は、別の MODELLED の行です

seg-4ea08a296b37 = UTC エポックにおける DE440 カーネルからの太陽、月、水星、金星の位置（KernelEphemeris）

seg-8d47467c36e4 = 太陽、水星、金星、地球、月の互いに対する幾何学的な位置（J2000/ICRF 軸、メートル）を、UTC エポックで ephem_provider::KernelEphemeris を通じて JPL DE440 カーネルから求めます。天体名は NAIF コードに対応付け、UTC はうるう秒テーブルと 二項の TDB-TT 級数による TT から TDB への変換を経由し、カーネルはエンジン自身のリーダーで読み込みます。カーネルが系の重心としてのみ保持する天体（de440s では火星から海王星、冥王星）は、代用せずに拒否します。カーネルを使わない Standish の行は、ブラウザーとフォールバックの経路として残ります

seg-f0e09f78814a = Skyfield { "1.54" }（MIT）で、独自のうるう秒テーブル、独自の TDB-TT、同じ NAIF の de440s.bsp の独自のリーダー（jplephem）を用い、UTC エポックで別プログラムとして実行したもの。フィクスチャが存在する前（0bfafe6d）に事前登録し、そのコミットのハッシュからグリッドのシードを決め、合格基準は成分ごとに { "5e-5" } s に相対速度を掛けたもの（エンジンが明示する 二項の TDB-TT の精度）に、重心距離の { "1e-13" }、さらに { "1e-5" } m を加えたものです。結果：{ "600" } 件すべてが基準内で、最悪値は基準の { "0.66" }（高速な組での { "2.96" } m で、TDB-TT 級数自身の誤差）。ミューテーション：TT を TDB として使うと、基準の { "33" } 倍で不合格になります。双方とも DE440 を読むため、これが確認するのはプロバイダーとその時刻の連鎖であり、DE440 ではありません。主張の範囲外：金星より外側の惑星を天体として扱うこと（de440s は重心のみを保持）、惑星の衛星、および 二項の TDB-TT 級数を下回る精度（最速の組で数メートル）

seg-b59153f28d69 = 太陽系の天体間の光行時間

seg-48ebe0983725 = ある天体から他の任意の天体へ、あるエポックに受信される、ニュートン力学的な片道の光行時間を、ラジオメトリックな不動点の光行時間ソルバー（radiometric::light_time_solution、送信側は遅延位置）により、任意の EphemerisProvider 上の solar_system::link_on を通じて解きます。solar-system kind は、日心座標系の解析的な太陽系上でこれを実行します（solar_system::link）。radiometric::two_way_range による往復距離と radiometric::shapiro_delay による太陽のシャピロ遅延は別に報告し、外部との比較は行っていません。<c1/> kind は、観測者に対するすべての天体と任意の追加リンクについて、<c2/> kind は天体から地球へのダウンリンクについて出力します

seg-0685ab1ef2d3 = JPL Horizons DE441 の片道のダウンレグのニュートン力学的な光行時間 LT（VEC_CORR=LT、観測者は地心）で、事前登録（480037d3。最初の取得が { "10" } m の補間精度の前提条件を満たさなかったため、補間のノード間隔のみを変更した修正 54d5c86f は、光行時間の比較を行う前に追加）しており、合格基準は光行時間ごとに { "1e-6" } s です。ソルバーには DE441 の重心位置を与えているため、遅延した送信側の反復の効果が見えます（第 一反復のみのソルバーでは最大 { "0.1" } s ずれます）。解析的な Standish の位置では、光行時間はその位置の精度どまりです（惑星位置の行を参照）。同梱のリンクは太陽を慣性中心として扱い、その位置誤差の範囲内に収まりますが、個別には外部の参照による確認を行っていません。two_way_range と shapiro_delay は外部との比較を行っていません

seg-6e0b9687e8ee = Standish Table { "1" } による天王星と海王星、冥王星、および惑星の速度

seg-df3bf502dfe9 = 天王星と海王星の位置は Standish の Table { "1" }（西暦 { "1800" } 年から { "2050" } 年の既定）から、冥王星は現在の JPL のページにはもう載っていない { "1992" } 年の Table { "1" } の行から、そして全惑星の日心速度は、要素が示す平均運動を用いた二体問題の導関数に、近日点、軌道傾斜角、昇交点の変化率による楕円の回転を加えて求めます

seg-f49245efe44f = JPL Horizons DE441（同じコミット済みのフィクスチャ）と照合して測定しましたが、外部の参照による確認は行っていません。天王星と海王星について Table { "1" } が明示する数値は、DE441 の日心位置に対して最大でそれぞれ { "2.0" } 倍と { "5.2" } 倍超過します（海王星は重心位置に対しては基準を満たしており、フィットが日心座標で行われていなかったことを示唆します）。ページには冥王星の誤差の記載がなく、速度について公表された限界もありません。Tables 2a/2b は天王星と海王星について自らの数値を満たし、確認済みの行に含まれます

seg-a50be56f605a = 月と 七つの主要な衛星（フォボス、ダイモス、ガリレオ衛星、タイタン）の位置

seg-2cfbe5a1eece = 地心の月は Montenbruck & Gill の級数による（その世紀あたり -1.3972 度の項は、すでに J2000 の春分点を基準としています）。フォボス、ダイモス、イオ、エウロパ、ガニメデ、カリストの惑星中心の位置と速度は、JPL Solar System Dynamics の平均要素を各衛星のラプラス面で用い、平均経度の変化率には IAU の同期自転率を採用します（表は周期の桁数が少なく、位相を保持できません）。タイタンは IAU の自転モデル（平均距離で、体固定 x 軸の負の側に衛星があるとする）による。これは、タイタンの公表されているラプラス面の行が、自身のエポックにおいてさえ Horizons を再現しないためです

seg-6c81bd570fe5 = JPL Horizons の衛星暦（DE441、MAR099、JUP365、SAT441）と照合して測定しました。クエリと取得日とともに tests/fixtures/solar_system/horizons_satellites_icrf.csv にコミットしています。平均要素や自転モデルによる配置については公表された精度がないため、固定した基準はリグレッションを検出するもので、外部の参照による確認ではありません。平均要素は共鳴摂動と太陽による摂動を省いており、フォボスの永年加速度はモデル化していません

seg-8b8c8e28ece9 = 太陽系のすべての天体の物理定数と、太陽系全体のレポート

seg-d225a30de35c = Body に、水星、金星、木星、土星、天王星、海王星、冥王星、フォボス、ダイモス、イオ、エウロパ、ガニメデ、カリスト、タイタンが加わります（重力パラメーター、基準半径、公表されている場合は参照する半径とともに J2、IAU の極と本初子午線）。さらに名前による検索と、BodyFacts レコード（NAIF コード、クラス、親天体、赤道半径と平均半径）が加わります。<c1/> kind は、これらを 十八天体すべてについて、位置、光行時間、一周回にわたる軌道トラックとともに報告し、各天体には VALIDATED または MODELLED のラベルが付きます

seg-6adc29de51fd = 公表されている定数の転記で、それぞれ定義された箇所で出典を示しています。重力パラメーターは JPL Horizons の天体レコードと JPL の衛星物理パラメーター表から、半径は JPL の物理パラメーター表（IAU WGCCRE { "2015" }）から、極と本初子午線は IAU Working Group on Cartographic Coordinates and Rotational Elements から（平均値で、T の変化率と周期項を含まない）、J2 は Smith et al. { "2012" }、Iess et al. { "2018" } と { "2019" }、Jacobson { "2009" } と { "2014" } からです。内部の整合性（木星の自転周期と System III の速度、各 J2 とその参照半径）は確認しましたが、外部のオラクルとは照合していません。{ "0.30" } ラウンド { "2" }：GM の値は gm_de440 から、フォボスとダイモスの要素は pck00011 から採用したため、追加した 十四天体の { "84" } 個の定数のうち、NAIF と異なるものは { "0" } 個になりました（以前は { "12" } 個）。これは転記のチェックであり、カウントには含めません。{ "0.36" }：IAU の体固定の向きと、追加した 十四天体の GM は、独自の VALIDATED の行（「追加した 十四個の太陽系天体の IAU の天体の向きと重力パラメーター」）に分離しました。この行には残りが含まれます。J2 と平均半径は出典の明示にとどまり、外部の参照による確認は行っていません。レポートの位置は各自の行に基づいており、地球、月、火星についてのレポートの prime_meridian_deg は、従来の慣習的な定数のままです（IAU_<BODY> から最大 { "6.6e-3" }、{ "2.8e-2" }、{ "9.6e-4" } rad）。{ "0.30" } の改訂：フォボスの GM { "7.087e5" } -> { "7.087546066894452e5" }、ダイモス { "9.62e4" } -> { "9.615569648120313e4" }、天王星 { "5.7939506103e15" } -> { "5.793951256527211e15" }、海王星 { "6.83509997e15" } -> { "6.835103145462294e15" }、冥王星 { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²。フォボスの赤道半径 { "13.1" } -> { "13.0" } km。prime_meridian_deg は 二次の項と周期項を含むようになりました

seg-fa8a4b082cd5 = 追加した 十四個の太陽系天体の IAU の天体の向きと重力パラメーター

seg-fc8d277aa2fd = Body::iau_rotation_et は、水星、金星、木星、土星、天王星、海王星、冥王星、フォボス、ダイモス、イオ、エウロパ、ガニメデ、カリスト、タイタンについて、J2000 から IAU の体固定座標系への回転を、pck00011 が各天体にもつすべての世紀あたりの変化率、二次の項、周期項とともに与えます。また、同じ 十四天体の重力パラメーターのフィールド mu も与えます。太陽、地球、月、火星は、他の行が所有する慣習的な定数をもち、対象外です

seg-29bad4bd8e09 = NAIF SPICE Toolkit（spiceypy 経由の CSPICE N0067）の pxform('J2000', 'IAU_<BODY>') を pck00011.tpc に適用したもの（同じ IAU 自転モデルの独立した実装）と、GM については NAIF の gm_de440.tpc。フィクスチャは、Kshana のコードを一切呼び出さない別プログラムで生成しています（tests/fixtures/body_orientation_spice_oracle/、NOTICE.md）。新しいエポックのフィクスチャが存在する前に 154bc54 として事前登録しており（当初の { "1e-9" } rad の基準は c2434204 のもの）、新しいフィクスチャは独立に再生成され、バイト単位で同一でした。GM は DE440 の転記を公表されたファイルと照合したものであり、GM の独立した決定ではありません。結果：docs/design/evidence/mr08-body-orientation/RESULTS.md

seg-87ab655f8270 = 任意の太陽系天体の周りでの、ローカルなコンステレーションと地球からの深宇宙リンクによる測位

seg-d9b1b0ac97d3 = <c1/> kind：名前で選んだ天体の周りの周回機または地表のランダーが、その天体の周りの Walker 航法コンステレーションからの片道の疑似距離（天体の J2 による永年ドリフトを含む二体軌道、未知のユーザー時計）と、任意で地球からの時計に依存しない往復距離（各エポックでの地球の方向と距離は解析的なエフェメリスから）を用いて航法を行います。視線は天体の球と地表の仰角マスクによって遮られます。エポックごとに、コンステレーションのみの GDOP と PDOP（orbit::dop）、地球の行がある場合とない場合の形式的な位置の不確かさ、それぞれについてシード付きのガウス・ニュートン法による解（batch_ls::gauss_newton）、および天体から地球への光行時間と往復時間を出力します

seg-3538c49df107 = 閉形式と自己整合性：中継機の周期に関するケプラーの第三法則、実行中に保たれる軌道半径と地表半径、測定を追加しても形式的な不確かさが増えないこと、そしてシード付きの誤差が共分散と一致すること。中継機の軌道は第三体を無視し（エウロパの周りの中継機に対する木星の引力はモデル化していません）、雑音は規定のレベルのガウス雑音で、測定モデルは瞬時的であるため、いかなるミッションの航法データとも外部の参照による確認は行っていません

seg-281b680a9897 = Walker コンステレーションの幾何と、GPS、Galileo、GLONASS の公表されている公称スロット

seg-cba54289b732 = <c1/> kind のジェネレーター：T/P/F の規約による Walker デルタ型とスター型のパターン（ノード間隔 360/P または 180/P、軌道面内の間隔 { "360" }·P/T、軌道面間の位相オフセット { "360" }·F/T）、そして公表されている公称要素から構築した GPS のベースラインおよび拡張 24 スロット、Galileo、GLONASS のプリセット。これらは、各文書が明示するグリニッジ時角により、地球固定座標系に配置されます

seg-bdf83007af50 = 公表されている機関の文書：Galileo Open Service Service Definition Document issue { "1.1" }（European GNSS Service Centre）の Tables { "1" } と { "23" }（2016-11-21 { "00" }:{ "00" } UTC の基準コンステレーション）、GLONASS Interface Control Document edition { "5.1" }（{ "2008" }）の section { "5.2" }（昇交点経度と緯度引数のスロット式）、GPS Standard Positioning Service Performance Standard 第 5 版（{ "2020" } 年 四月）の Tables 3.2-1、3.2-2、3.2-3（プリセットが再現すべき地球固定の幾何を独立に示した、地上軌跡の赤道通過の列を含む）。確認するのはジェネレーターと転記です。BeiDou の中軌道の位相と傾斜静止軌道のノードは公表されておらず、対象外です

seg-0f1d49ab5d51 = GPS ベースラインコンステレーションの全球の精度低下率

seg-83775b77f5ca = GPS ベースラインの 24 スロットのプリセットに対する <c1/> のカバレッジエンジンを、GPS Standard Positioning Service Performance Standard（SPS PS）の Appendix B の条件（恒星日 一日、{ "287" } 回の 五分ステップ、緯度の余弦で重み付けした { "4" } x { "4" } 度の全球グリッド、すべて可視、マスク { "5" } 度、受信機の時計は 一つ）で実行したもの：全球の HDOP の分布、PDOP の中央値、および PDOP が 6 以下となる可用性を、全球と最悪地点で示します

seg-6fb3c2028c4a = GPS SPS PS 第 5 版（{ "2020" } 年 四月）の Appendix B の B.3.2.2 と B.3.2.3 に公表されている、全スロットが占有されたベースラインの 24 スロットのコンステレーションの全球平均の HDOP の分布（中央値 { "0.94" }、{ "90" } % が { "1.16" }、{ "95" } % が { "1.25" }、{ "98" } % が { "1.37" }、平均 { "0.96" }）、Table 3.8-1（PDOP の可用性）、Table B.3-1（縮退したコンステレーションのアンサンブルの PDOP で、上限としてのみ使用）、および 一エポックについて手で導いた閉形式。完全なコンステレーションの VDOP と PDOP の分布は図としてのみ公表されているため、PDOP は片側のみ固定しています。最悪の時空間点（ここでは HDOP { "2.40" } と VDOP { "5.22" }、公表値は { "2.49" } と { "5.43" }）はグリッドに依存するため、固定せず報告にとどめます

seg-7d4d7200cbca = 任意の中心天体の周りの、任意の複数コンステレーション設計に対する、大規模なカバレッジと精度低下率のマップ

seg-b78b79e9fae4 = 固定した 二つのケースを超える <c1/> kind：明示的な設計とマルチシェルの設計、一回の実行での複数のコンステレーション（コンステレーションごとに受信機の時計 一つ）、天体定数による地球、月、火星、BeiDou のプリセット（中軌道の位相と東経 { "118" } 度の傾斜静止軌道の交差をモデル化）、セルごとの可視衛星数、GDOP、PDOP、HDOP、VDOP と可用性、間引いた地上軌跡、そして { "5" } 000 機の設計を { "10" } 度のグリッドで 一秒に満たない時間で実行する、衛星直下点の緯度による可視性のプレフィルター

seg-2c0f28426ab9 = 内部の整合性：総当たりの仰角走査、手計算と orbit::dop による簡約、および閉形式の Walker と静止軌道の幾何。任意で永年 J2 を含む二体軌道、局所の鉛直が半径方向に沿う球形の天体、幾何学的な可視性のみ（信号電力、衛星の健全性、地形、第三体の摂動は考慮しません）、そして異なる基準エポックから取った系統間の相対位相のため、いかなる日付のスナップショットでもありません。{ "0.30" } のレビューでの所見（MODELLED のまま）：プリセットは、公表されている片側の DOP 可用性の下限（BeiDou OS Performance Standard { "3.0" }、Galileo OS SDD）を { "100" } % で満たしますが、作業用コピーでエンジンの PDOP を 二倍にしても、それらを満たします（最悪点 { "99.36" } %）。このため、この行が計算する量における { "100" } % の誤りさえ、これらの下限では検出できません。実行後にそれらを厳しくすることは、事後の許容差になります。格上げするには、同一の幾何に対する DOP の値の両側比較を、あらかじめ設定した許容差で行う必要があります。{ "0.30" } ラウンド { "2" }（tests/coverage_dop_full_oracle.rs、事前登録 add671d6）での所見（MODELLED のまま）：Orekit { "12.2" } による位置、仰角、方位角、地上軌跡と、gnss_lib_py { "1.0.4" } による GDOP/PDOP/HDOP/VDOP（共通の時計）および numpy の逆行列（コンステレーションごとに時計 一つ）は、Galileo、GPS、BeiDou、Galileo+GPS（それぞれ時計 一つ）、および 1584 機の地球の設計において、すべての基準で一致します（DOP は相対 { "2e-14" } 以内で、解、可用性、可視数も同一）。月と火星の設計では、要素、位置、可視性、軌跡は一致しますが、最大の PDOP が { "1434" } 以上のセルでは DOP があらかじめ設定した相対 { "1e-9" } の基準を超え（最大 { "8e-6" }）、数値的に特異な幾何では { "4" } セルで解のエポックが 一つ異なる（エンジンのピボット { "1e-10" } と numpy のランク）ため、この行は外部の参照による確認を行っていません。{ "0.30" } の改訂：TDOP/GDOP の基準時計は、可視となる最小番号のコンステレーションになりました（constellation-multi-gnss-coverage の全球 GDOP の最大値 { "2.2236" } -> { "2.1205" }、平均 { "1.122" } -> { "1.131" }）。またコンステレーションごとの可視数は整数として合計します

seg-278c77438493 = 共有された 一つのタイムライン上での、シナリオの kind をまたいだ連鎖ミッション

seg-3dcfb26f6234 = <c1/> kind のフェーズ：各フェーズは、既存の kind の 一つ以上のシナリオを run_toml で実行し、その出力を、kind ごとのプリセットまたは明示的な結果パスにより名前付きチャネル（時計の時刻誤差とガード、平均の実効搬送波電力対雑音密度比と追尾下限、垂直保護レベルとアラート限界、位置誤差、追尾中の衛星、警報フラグ）へ読み込み、フェーズの開始位置に配置して共通のグリッドに保持し、フェーズの境界とイベントを付けます。状態は、carry（チャネルが前のフェーズの終了値から継続）、handoff（前のフェーズの数値を次のシナリオに書き込む）、end_at（スプーフィングモニターの検出時刻など、実行が計算した時刻にフェーズが終了）によって引き継がれます。さらにキャンペーンのハッシュと、すべてのメンバー結果にわたるダイジェストを出力します

seg-fd018ef7bc3b = 同じ kind の単独実行に対する合成の恒等性：一フェーズのキャンペーンは単独実行の出力をビット単位で再現し、引き継がれたオフセットは前の実行自身の最後のサンプルと等しく、end_at で終了したフェーズの長さは、その実行の検出時刻とちょうど等しくなります。フェーズ境界をまたぐ加算的な carry とゼロ次ホールドはモデル化上の選択であり、各フェーズの確からしさはそれを実行した kind と同程度にとどまります。連鎖ミッションを実測のものと照合した例はありません

seg-ad6105af464c = 任意のシナリオ kind に対するパラメーター掃引と、シード付きのモンテカルロアンサンブル

seg-95921611839e = <c1/> kind の sweep（任意の kind のドット区切りキーを一つから三つ、汎用の sweep の軸の値上で指定し、必要に応じて各ノードでアンサンブルを実行）と monte_carlo セクション：実現 k は base_seed + k で実行され、各メトリクスは平均、標準偏差、最近順位法による 5th/50th/95th パーセンタイル、および平均に対する固定シードのパーセンタイルブートストラップ { "95" }% 信頼区間を報告します（inertial::metric_stat）。メトリクスの単位は、掃引する kind 自身の units ブロックから読み取ります

seg-03d15c27b3b9 = 白色周波数雑音下での位相ランダムウォークの閉形式、分散 q_wf tau（NIST Technical Note { "1337" }）を統計処理の仕組みの確認に用い、シードの確認には単独実行とのバイト単位の一致を用います。これが確認するのはエンジン自身の時計モデル上でのアンサンブルの演算であり、外部のデータセットではありません

seg-24327a0ed82e = 共有された条件下での複数のシナリオと、その統合サマリー

seg-5833fb3b06e3 = <c1/> kind の compose セクション：名前付きの共有値（たとえば一つのジャマーの電力と位置）を、それぞれが束縛するキーで各メンバーに書き込み、すべてのメンバーを実行し、メトリクスごとにメンバー間の最小値、最大値、平均値を、該当するメンバー名とともに出力します。メトリクスの単位はメンバー間で一致している必要があります

seg-67ffd6684b1c = 単独実行に対する合成の恒等性。共有条件の演算は帳簿的な処理であり、物理はメンバーの kind のものです。それぞれに独自の行があります

seg-0bc866720bde = キャンペーンのパラメーターに対する、一つのメトリクスの有界な最適化

seg-f9bdb89c2b4f = <c1/> kind の optimize セクション（CAP-32）：lin または log スケールで [lo, hi] に制限した、ドット区切りのシナリオキーを一つから三つ、結果パスで読み取る一つのメトリクス、目標は minimize、maximize、または target。手法は grid（sweep の軸の値）、または正規化座標での決定論的な Nelder-Mead シンプレックス（ボックス射影と標準の係数を使用）です。メトリクスが欠落または有限でない場合は最悪のスコアとなり、trace に残ります。runs > { "1" } の場合、メトリクスは共通のシードにわたる平均です。すべての評価は指定した kind の実際の実行であり、trace に列挙され、再現性ダイジェストに数えられます

seg-e3a2f80b04dc = 内部のみ：リンク方程式の厳密な -20 log10(range) の閉形式、同じ kind に対する独立した総当たりグリッド、および Rosenbrock 関数。ラウンド { "1" } の 1-D の合格基準は NOT MET です（事前登録したボックスには { "3" } dB の解が含まれておらず、オプティマイザーは境界で停止しました）。docs/design/evidence/cap32-optimize/RESULTS.md に記録しており、再採点はしていません。最適値はボックスと開始点に対して局所的であり、大域的な最適値であるという主張はしません

seg-b9b1637d326c = 任意の測距信号に対する帯域制限された閉形式：帯域内電力と、公表値に対する早期・遅延符号追尾ジッター。ガボール帯域幅とオフセットのスペクトル分離係数との相互チェック付き

seg-6cfdc433b120 = navsignal：正弦積分（sine_integral）、両側帯域内の BPSK-R の電力割合の閉形式（bpsk_power_in_band_closed_form）、帯域制限された BPSK のガボール帯域幅の閉形式（bpsk_gabor_bandwidth_closed_form_hz）、Betz & Kolodziejski { "2009" } に基づく、任意の単位面積スペクトルに対する帯域制限されたコヒーレントおよび非コヒーレントの早期・遅延 DLL ジッター（dll_jitter_bandlimited_s）とその間隔が消える極限のガボール限界（dll_jitter_small_spacing_limit_s）、オフセットのある BPSK のスペクトル分離係数の閉形式（bpsk_offset_ssc_closed_form）、Galileo E5 AltBOC({ "15,10" }) スペクトル（altboc_15_10_psd）、および変調ラベルのパーサー（parse_modulation）。<c1/> kind がすべての信号設計に使用します

seg-15d8c44be46f = 外部に固定したもの：メインローブ電力 { "90.3" } パーセント、規定の動作点でのコヒーレントな早期・遅延ジッター、正弦積分の表の値、ゼロオフセットでの BPSK 自身のスペクトル分離係数 2/({ "3" } R_c)。内部の相互チェックのみで、外部の参照による確認ではないもの：帯域制限された BPSK のガボール帯域幅の閉形式とその漸近線、およびゼロでないオフセットでのオフセット BPSK のスペクトル分離係数で、いずれもここで導出し、数値積分と照合しました。公表されている閉形式：BPSK-R の sinc 二乗スペクトルとその { "90" } パーセントのメインローブ電力（Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed.）、コヒーレントな早期・遅延符号追尾ジッター sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" }（Kaplan & Hegarty, section { "8" }）と、そのガボール帯域幅の限界をもつ帯域制限への一般化（Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }）、Abramowitz & Stegun の正弦積分表（Table { "5.1" }）、自己相関の二乗のフーリエ変換としてのスペクトル分離係数（Betz { "2001" }）。AltBOC スペクトルについて確認したのは単位面積とローブ位置のみです（Galileo Open Service Signal-in-Space Interface Control Document の式は積分すると { "8" } になり、それで割っています）。

seg-def449efa852 = 捕捉の探索範囲を決める、低軌道の航法衛星の最大ドップラー

seg-2ff7cc7a8846 = leo_signal::max_doppler_hz：円軌道について、仰角マスクでの真上の通過における最大の衛星ドップラーで、v R_E cos(el) / (R_E + h) に f / c を掛けたもの、各プリセット自身の搬送波と軌道高度から求めます。<c1/> kind は、これに発振器とユーザーの項を加えて、ドップラービンに変換します

seg-652e28dfa10f = 低軌道の測位・航法・時刻信号の設計：符号追尾、捕捉、GNSS との互換性、および任意のシステムのバンドトレード

seg-c0ba5c7e708e = <c1/> kind：パラメーター化された信号設計（バンド、送信帯域幅、ITU の割り当て。BPSK(n)、BOC(m,n)、MBOC、または平坦なスペクトルをもつ捕捉、データ、パイロットの各成分、電力配分、FDMA サブキャリア、符号長、データレート）を、コンパイル済みの公開プリセットファイル（Xona Pulsar、Iridium STL、機会信号としての Starlink 信号、CentiSpace、汎用の C バンド設計、汎用の UHF/L/S/C/広帯域 C の設計。それぞれ出典 URL を持ち、非公表の値には REPRESENTATIVE のラベルを付けています）またはインラインの記述から構築します。信号ごとに、帯域制限した電力スペクトル密度、帯域内の電力割合、ガボール帯域幅、C/N0 と間隔に対する符号ジッターと測距精度、捕捉の探索空間、二乗検波による検出確率と、シリアルおよび符号並列の平均捕捉時間、GPS L1 C/A、Galileo E1、GPS L5、Galileo E5a、E5b、AltBOC への、およびそれらからのスペクトル分離係数と C/N0 の劣化、spectrum kind の SSC チェーンによる CW、広帯域、整合の J/S 耐性を出力します。さらに、電離圏遅延、自由空間損失、等しい C/N0 と等しい EIRP での測距精度、ジャマー耐性のバンドトレードと、設計を記述された測定と照らし合わせる定性的な形状チェックも行います

seg-040b3f5cc70e = 上の二つの行の、外部の参照と照合して確認済みの閉形式、二乗検波の誤警報の恒等式 P_d(snr = { "0" }) = P_fa と Holmes の平均捕捉時間、そして spectrum kind 自身の SSC チェーンへの帰着（同じ Jammer::ssc のコード）。設計そのものは入力です。REPRESENTATIVE または WORKSHOP とマークしたプリセットは公表された仕様ではなく、拡張 Feher QPSK、符号シフトキーイング、OFDM のスペクトルは近似であり、形状チェックが比較するのは形状であり、較正されたレベルではありません。

seg-c2b9c8e4a364 = 設計した信号とバンドごとのジャマーを伴う、マルチバンドのスペクトルウォーターフォール（UHF、L、S、C）

seg-609df4e0a085 = L バンドを超えて拡張した <c1/> kind：バンドは、プリセットの信号設計（すべての成分を描画し、送信帯域幅に帯域制限し、C/N0 と J/S は追尾する成分を基準とする）またはカスタムの搬送波と変調として指定します。同じタイムラインとカラースケール上で、任意の周波数範囲に追加のウォーターフォールパネルを置けます。CW、狭帯域、チャープ、整合雑音に加えて、広帯域（バラージ）ジャマーも扱えます。バンドごとの J/S と実効 C/N0 は、変更していないスペクトル分離係数のチェーンから求めます

seg-a3b398f66ad3 = 既存のスペクトルのチェーンとジャミング kind の耐ジャミング式（単一成分のバンドは、拡張前と同じ数値を与えます）、および外部の参照と照合して確認済みの行の信号スペクトルへの帰着です。ジャマーの電力、タイムライン、フロントエンドの帯域幅、設計した信号は入力であり、設計した信号は送信バンドで打ち切られます（帯域外放射はありません）。

seg-f92d6cbc58d4 = LEO-PNT リンクが使用する任意のバンドに対する、雨の比減衰係数

seg-96b6a118d374 = ITU-R（International Telecommunication Union, Radiocommunication Sector）P.838-3 の式 ({ "1" }) から ({ "5" })：Tables { "1" } から { "4" } の曲線フィットによる k_H、alpha_H、k_V、alpha_V、経路と偏波に依存する (k, alpha)、および比減衰 k R^alpha。<c1/> kind の雨の項が使用します

seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) の Table { "5" }。勧告自身が表にした k_H、alpha_H、k_V、alpha_V を、PDF の URL と取得日とともに tests/fixtures/leo_link/p838_3_table5.csv にコミットしています。表は印刷された桁に丸められているため、合格基準はその丸めです

seg-f4a311f936de = 地球・宇宙リンクにおける長期の斜め経路の雨減衰

seg-2b2dba8bf5a7 = ITU-R P.618-14 の section { "2.2.1.1" } のステップ { "2" } から { "10" }（降雨高度より下の斜め経路と水平経路、水平方向の低減係数と垂直方向の調整係数、A0.01 と、それを平均的な年の { "0.001" } % から { "5" } % へスケーリングしたもの）。このエンジンはどちらのデジタルマップも持たないため、降雨高度（P.839）と R0.01（P.837）は入力とします。<c1/> kind がバンドとエポックごとに適用します

seg-325d1bb9c26d = ITU-R Study Group { "3" } の P.618-14 検証例ファイル CG-3M3J-13-ValEx-Rev8.3.0 を ITU-Rpy の検証ページが表にしたもので、各地点の P.839-4 の降雨高度は同じ例から取っています。URL と取得日とともに tests/fixtures/leo_link/p618_14_rain_attenuation.csv にコミットしています。確認するのは h_R と R0.01 が与えられたときの手順であり、マップではありません

seg-6b51ec84bdce = 地球・宇宙リンクにおける対流圏の振幅シンチレーション

seg-869894dec004 = ITU-R P.618-14 の section { "2.4.1" } のステップ { "3" } から { "9" }（N_wet からの基準 sigma、有効経路長、アンテナ平均化係数、時間の { "0.01" } % から { "50" } % に対するフェード深さ）。N_wet は入力とするか、ITU-R P.453-14 の式で気温、湿度、気圧から計算します。{ "4" } GHz 未満では、<c1/> kind はその値を外挿としてフラグを立てます

seg-7fc4a1e7960a = ITU-R Study Group { "3" } の P.618-14 シンチレーション検証例（CG-3M3J-13-ValEx-Rev8.3.0）で、各地点の P.453-14 の N_wet は同じ例から取っています。URL と取得日とともに tests/fixtures/leo_link/p618_14_scintillation.csv にコミットしています。気温と湿度から湿潤屈折率を求める式は、この行の対象外です

seg-e0d40cf4ea79 = 屋内の LEO-PNT ユーザーに対する建物侵入損失

seg-4f06274e38ec = ITU-R P.2109-2 Annex { "1" } の式 ({ "1" }) から ({ "10" }) と Table { "1" }：ファサードでの経路の仰角における、従来型および断熱性能の高い建物について、確率 P で超えられない損失、{ "80" } MHz から { "100" } GHz。<c1/> kind が、バンドとエポックごとに屋内ユーザーへ適用します（UHF の屋内ケース）

seg-99c648f9c6eb = ITU-R Study Group { "3" } の Clutter and BEL 検証ワークブックの値を、参照用の MATLAB 実装の検証スクリプト（github.com/eeveetza/p2109）に転記されたとおりに用いたもので、URL と取得日とともに tests/fixtures/leo_link/p2109_bel.csv にコミットしています。ワークブックは小数点以下三桁で印刷されています

seg-8c5e291c8ff8 = バンドごとの一次の電離圏遅延、電離圏フリーの組み合わせ、および自由空間損失

seg-89df726127f9 = バンドごとの群遅延 { "40.3" } STEC/f^{ "2" }、任意のバンドの組に対する電離圏フリーの係数 f1^2/(f1^{ "2" } - f2^{ "2" }) と -f2^2/(f1^{ "2" } - f2^{ "2" }) と雑音増幅 sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" })、およびキロメートル・メガヘルツ形式での linkbudget::free_space_loss_db の自由空間損失 { "20" } log10({ "4" } pi R f/c)

seg-9bf00f744174 = 一次の 1/f^{ "2" } スケーリングから導かれる L1/L2 の群遅延比 gamma = (77/60)^{ "2" } を述べた IS-GPS-200 の section { "20.3.3.3.3.2" }、および Friis の伝送公式（Proc. IRE, { "1946" }）。確認するのはスケーリング則であり、斜め方向の TEC ではありません

seg-c584a867fcda = LEO または MEO 軌道から静止したユーザーが見る最大ドップラー

seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate：地球の自転を考慮した円軌道について、軌道上のすべての位置と、衛星の地平線上のすべてのユーザーにわたって最大の距離変化率を探索し、あわせて軌道速度と最大の地球固定の衛星速度を求めます。<c1/> kind がバンドごとにドップラーの包絡線として報告し、その低エネルギーモデルのコールドスタートの探索窓として使用します

seg-4abd3afebad2 = Leclere, Marathe and Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Table { "1" }（{ "6371" } km の球上の静止した受信機で、他の効果は地球の自転のみ）：L1 で { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz。円形の二体軌道を対象とします

seg-d9eb3e7e69c2 = LEO-PNT の通過と、可視の MEO GNSS 衛星に対するバンドごとのリンクバジェット

seg-d986e44443dd = <c1/> kind：設計した通過、軌道要素、SGP4 を通した TLE、または constellation-design の Walker コンステレーションから衛星を生成します。バンドとエポックごとに、見通し角、距離、閉形式の距離変化率と距離加速度（実行のたびに中心差分と照合して報告）、自由空間損失、等フラックス、ガウス型、または平坦なパターンによる EIRP、パッチ型、半球型、または等方性のユーザーアンテナ、ITU-R P.676-10 Annex { "2" } のガスによる減衰、P.618 の雨とシンチレーション、P.2109 の建物侵入損失、偏波不整合、システム雑音温度、C/N0、ドップラーとドップラー変化率、そして Klobuchar または垂直 TEC の斜め TEC を衛星より下のチャップマン分率でスケーリングした一次の遅延、通過のピークでの符号雑音を伴う電離圏フリーの組、同じ受信機を通した、インターフェース文書の受信電力による Galileo または GPS の搬送波を扱います

seg-c558a6519038 = 閉形式と自己整合性：数値微分に対する距離変化率と距離加速度の恒等式、距離の増大を打ち消す等フラックスの利得、教科書の偏波損失の限界、定性的な LEO 対 GNSS の観測（数分間の釣り鐘形の通過で、平坦な 44-51 dB-Hz の GNSS 搬送波を数 dB 上回るピーク）。EIRP とパターンは、公表されている受信電力を EIRP に換算したものか代表的な選択であり、ガスの項は置き換えられた P.676-10 の簡易法で、実測の LEO C/N0 との比較は行っていません

seg-95a077a980b6 = 出典を明記した、名前付きの LEO-PNT システムのプリセットと、システムに依存しないエンジン

seg-4b47033cda24 = leo_link::presets：汎用のマルチバンド（UHF、L、S、C）、汎用の C バンド、Xona Pulsar X1/X5、Iridium STL、ドップラーのみの機会信号としての Starlink、CentiSpace、およびオプションの Celeste IOD プリセット。それぞれの出典には、PUBLIC（URL 付き）、REPRESENTATIVE、または WORKSHOPの別を付けています。ワークショップのものはオプションの Celeste IOD プリセットファイルにあり、そのファイルが存在する場合にのみコンパイルされます。すべてのバンドと軌道はシナリオで上書きでき、シナリオはプリセットをまったく指定しなくても構いません

seg-399dc53ceafb = 引用した公開数値の転記と整合性チェック：公表されている最小受信電力から設定した EIRP は、平坦なパターンで、公表されている最大値を { "0.5" } dB 以内で予測します。これは距離の広がりのチェックであり、いかなる衛星のアンテナについても外部の参照による確認ではありません。代表的なプリセットは、実在のシステムについて何も主張しません

seg-a39f34973373 = 低エネルギーの測位：デューティサイクルに対する初回測位までの時間と、一回の測位あたりのエネルギー

seg-f3b9b669a76f = leo_link::energy と <c1/> kind の [iot] セクション：ドップラー変化率で上限が決まるコヒーレント積分、検出しきい値までの二乗検波の非コヒーレント加算、軌道の静止ユーザーの包絡線（コールド）または支援された窓（ホット）にわたるドップラービンの探索、並列またはシリアルの符号探索、コールドスタート時の航法メッセージ時間、測位間隔にわたる一回の測位あたりのエネルギーと電池寿命を、各 LEO バンドと GNSS 信号について求めます

seg-a5fa1ef1be9b = 規定した設計モデルの内部整合性：すべての電力、しきい値、探索の選択は入力であり、モデルはビット境界のあいまいさ、見逃し、再捕捉を無視します。実測の受信機とは比較していません

seg-7e94f8b38cff = 任意の軌道高度に対する、全球平均の衛星信号の距離誤差の重み

seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights：動径方向の重み w_R と、横方向の重みの二乗 w_AC^{ "2" } を、仰角マスクより上の可視の地球キャップ上に一様に分布するユーザーにわたる、視線の天底角の cos^{ "2" } と sin^{ "2" } の半分の平均として、任意の軌道半径についてシンプソン積分で求めます。すべての leo-navmsg の SISRE の数値に使用します（{ "510" } km では、w_R は { "0.46" }、w_AC^{ "2" } は 1/2.5）

seg-b9b5fe9d3b25 = Montenbruck, Steigenberger and Hauschild（{ "2018" }）, Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041 が公表している SISRE の重み係数表：GPS は { "0.98" } と 1/49、GLONASS は { "0.98" } と 1/45、Galileo は { "0.98" } と 1/61、BeiDou MEO は { "0.98" } と 1/54、BeiDou IGSO/GEO は { "0.99" } と 1/126。同じ平均を LEO の半径で評価すると LEO の重みが得られます。公表された LEO の表は固定していないため、LEO の値は、外部の参照と照合して確認済みの手法を適用したものであり、個別に外部の参照による確認を行ったものではありません

seg-3cbb8b6afe3c = LEO 航法メッセージの基盤としての、Galileo ICD の放送エフェメリスのユーザーアルゴリズム

seg-88efbce1f836 = leo_navmsg::elements::kepler_point：Galileo OS SIS ICD のケプラー評価（ケプラー方程式、二次高調波補正、地球固定の昇交点）で、エンジンの RINEX 評価器とは別に記述しています。along/cross/radial の補正フレームの基になる緯度引数、軌道傾斜角、昇交点とともに位置を返し、Liu et al. { "2025" } の拡張項も扱います

seg-6a90728fcea9 = RTKLIB 2.4.2-p13 の eph2pos による ECEF 位置（同じ ICD アルゴリズムの独立した実装）を、2024-09-10 の実際の BKG/IGS 放送レコードについて求めたもので、どちらも出所とともに tests/fixtures/rinex_sp3_interop（NOTICE、rinex_ecef_reference.txt、brdc_multignss_slice.rnx）にコミットしています。これが確認するのはケプラーのユーザーアルゴリズムであり、その上に加えた along/cross/radial の補正にはそれぞれ独自の行があり、Liu の項は Liu et al. { "2025" } の 22 パラメーターの行が扱います

seg-d65102fd4a1d = LEO 航法メッセージの CRC-24Q フレームチェック

seg-aed568016867 = leo_navmsg::codec::crc24q：生成多項式 0x1864CFB、初期値 { "0" }、反転なし、最終 XOR なし。Kshana の LEO フレームが、それまでのすべてのバイトに付けるチェックです

seg-18c79d18e4e4 = これらのパラメーターに対する CRC カタログのチェック値（reveng.sourceforge.io の CRC カタログ、CRC-24/LTE-A：width { "24" }、poly 0x864CFB、init { "0" }、check 0xCDE703）で、これは RTCM { "10403" } と Galileo OS SIS ICD の CRC-24Q のパラメーターです。あわせて、RTCM { "10403" } に印刷されているメッセージタイプ { "1005" } のフレーム例を用います

seg-82b9b0f7b07c = LEO の放送エフェメリスのフィッターと、フィット区間と更新周期に対する信号の距離誤差

seg-8c7065aa22bd = <c1/> kind のフィッターとトレードオフ：帯状の J2-J6 または選択した次数までの EGM2008 の重力と抗力で積分した真の軌道と、シード付きの自由またはステアリングされた時計。非特異要素に弱い事前分布を置いた Galileo のケプラー要素セットの Levenberg-Marquardt フィット、続いて along-track、cross-track、radial の補正多項式の線形最小二乗フィット。ユーザーの相対論的な項を差し引いた時計の多項式のフィット。フィット窓の中央に置いた使用期間にわたる SISRE（軌道のみ、および時計を含む）の、フィット区間と更新周期に対する変化。外部の参照と照合して確認済みの部分：実際の精密軌道に対する、フィット区間ごとの 16 パラメーターのケプラーフィットとその軌道のみの SISRE、および積分した J2-J6/EGM2008({ "20" }, { "70" })/抗力の真の軌道を Orekit { "12.2" } と照合して { "6" } 時間で { "4.6" } mm 以内（合格基準 { "2" } cm、同じ密度入力）。補正多項式、時計のフィット（シード付きの自由またはステアリングされた時計）、更新周期のトレードオフは、モデルに基づくままです

seg-7dfbc8297444 = 実際の精密な科学軌道を真値としたもの（TU Graz IfG/ITSG の運用用の縮約力学軌道で、謝辞の明記により自由に利用可能。SHA-256 の値は fixture の NOTICE にあります）を、{ "20" } 分と { "30" } 分のアークにわたり 16 パラメーターのセットでフィットし、同じ衛星と日について Liu et al. { "2025" }（Remote Sensing { "17" }({ "16" }):{ "2894" }、CC BY { "4.0" }）が公表している統計と照合しました。along、cross、radial の RMS はそれぞれ 1.5 倍以内（測定値 { "0.804" } から { "1.087" }）、SISRE は 1.5 倍以内（測定値 { "0.716" } から { "0.809" }）、SISRE の重みはその Table { "2" } の { "0.005" } 以内（測定値 { "0.0007" }）です。許容差は比較の前に固定しています。成分ごとのゲートが、このテストに検出力を与えます。軌道傾斜角の変化率をゼロにしても、すべての SISRE の比は 1.5 倍以内に収まりますが、cross-track のゲートでは不合格になります。{ "0.72" } から { "0.81" } で一様な SISRE の比は、論文に由来します。論文に印刷された SISRE の値は、自身の Eq. { "9" } ではなく Table { "2" } の重みを二乗せずに用いており、Kshana はこの式に従っています（Montenbruck et al. { "2018" }）。積分した真の軌道（帯状の J2-J6、次数 { "20" } と { "70" } までの EGM2008、抗力）は、Orekit { "12.2" }（CS GROUP, Apache-2.0）および Hipparchus { "3.1" } と、同じ初期状態から、同じ座標系で、同じ密度入力で伝搬させて、{ "6" } 時間で { "4.55" } mm 以内で一致します（合格基準 { "0.02" } m は実行前に固定、事前登録 65e4d46c）。主張の範囲外：補正多項式、時計のフィット、更新周期のトレードオフで、これらには内部チェックがあります（二体の真値を 16 パラメーターのセットで { "1" } mm 未満に復元したことと、GRACE-FO とその CLK1B 時計での、エクスポートしたメッセージの内部の numpy による相互チェックで、後者はこのプロジェクトが書いて実行したものであり、独立したオラクルではありません）

seg-8121e7db3db3 = 切り替え時の連続性チェックを伴う、通過中の LEO 航法メッセージの更新

seg-34c310d85c42 = <c1/> midpass-update 解析：探索期間内でユーザーの上空を通る最高の通過、フィット窓の中央に使用期間を置いた全球スケジュールのメッセージ、そして各切り替え時の 3D 位置のジャンプ、時計のジャンプ、ユーザーの疑似距離のジャンプ、可視の任意の視線にわたる最大のジャンプ（天底円錐上の閉形式）、前後の距離誤差、およびしきい値に対する PASS/FAIL を求めます

seg-418f2cd21141 = 内部の整合性（ジャンプの恒等式と、総当たりサンプリングに対する円錐の上限）。しきい値は入力であり、公表されている LEO の連続性要件は固定していません

seg-7635a8339e78 = 量子化誤差の見積もりを伴う、LEO 航法メッセージの文書化されたバイナリ符号化

seg-e4d9b16a2dc4 = leo_navmsg::codec：Kshana 独自のフレーム（プリアンブル、バージョン、モデル、長さ、ペイロード、CRC-24Q）で、四つのエフェメリスモデル、時計の多項式、SVID、データの発行番号、バンド、健全性、Klobuchar のセット、NeQuick-G の係数、UTC パラメーターを扱います。すべてのフィールドに規定の幅とステップがあり（field_table）、範囲外は拒否する量子化と、有効期間にわたって各フィールドの半ステップの変化が生じさせる位置と時計の最大の変化の見積もりがあります

seg-4261a9fac5d9 = ラウンドトリップの恒等式と見積もりそのもの。この形式は Kshana 独自のもので、公表されているメッセージ成分と Galileo ICD のフィールドセットをモデルにしており、Celeste やその他のシステムのビットレイアウトではありません（どれも公開されていません）。そのため、照合すべき外部のレイアウトはありません

seg-17ca41d7fd71 = LEO 航法メッセージの RINEX-4 形式と CSV のエクスポート

seg-185e12ccef0d = leo_navmsg::text：RINEX-4 形式のブロック（> EPH のレコードヘッダー、三つの時計項をもつ衛星とエポックの行、D19.12 の放送軌道の行）で、システム文字は L、レコードタイプは KP16、KRAC、LU22、APOL とし、すべてのヘッダーに Kshana の拡張であり RINEX { "4.02" } の一部ではないと明記しています。さらに、既定の列スキーマとプリセットのスキーマをもつ CSV の表があり、それぞれにインポーターがあります

seg-5cc5b6382437 = ラウンドトリップと暦の演算。RINEX { "4.02" } は LEO の航法レコードを定義していない（IGS RINEX { "4.02" }）ため、このレイアウトは文書化された拡張であり、arXiv { "2401.17767" } を先行例として引用しています。これを照合できる外部のリーダーは存在しません

seg-ff15935ba1b3 = Liu et al. { "2025" } の 22 パラメーターの LEO エフェメリスモデルと、実際の精密軌道へのそのフィット

seg-6af1b6f3bbd4 = leo_navmsg::elements::EphemerisModel の Liu22 バリアントで、Liu22Extra を用いて kepler_point が評価します。16 パラメーターのセットに、長半径の変化率 a_dot、n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk として入る平均運動の変化率 n_dot（論文の Eq. { "1" } から転記。フィットの比較はこのスケールの規約に依存しないため、送信された nDot の値の意味はここでは外部の参照による確認を行っていません）、そして補正前の緯度引数に対する、一周回あたり一回と三回の動径の高調波 Crs1、Crc1、Crs3、Crc3 を加えたものです。leo_navmsg::fit::fit_message によるフィットは、論文の Section { "2.3" } の開始値と推定法（すべての補正はゼロから開始、事前分布なしの通常の最小二乗、論文の 100 回の反復上限）に従いますが、論文の RMS の変化が { "0.1" } mm 未満という規則の代わりに、Kshana のパラメーター収束規則（すべてのステップが形式的な sigma の { "1e-3" } 未満）で停止します。表形式の精密軌道の { "20" } 分と { "30" } 分のアークでフィットしました

seg-90768b99ab5f = 測定：GRACE-A、GRACE-C、Sentinel-2A、Sentinel-6A の TU Graz IfG/ITSG の運用用の縮約力学軌道（謝辞の明記により自由に利用可能。SHA-256 の値は fixture の NOTICE にあります）を真値として { "20" } 分と { "30" } 分のアークでフィットし、Liu, Su, Xie, Zhou and Qu（{ "2025" }）, Remote Sensing { "17" }({ "16" }):{ "2894" }, doi 10.3390/rs17162894（CC BY { "4.0" }。数値は引用であり、同梱はしていません）の Tables { "4" }、{ "5" }、{ "6" }、{ "8" } の 22 パラメーターの行（a_dot、n_dot、Crs3、Crc3、Crs1、Crc1）と比較しました。合格基準は最初の比較の前に固定しました：すべての衛星と両方のアーク長について、along、cross、radial の RMS はそれぞれ両側で 1.5 倍以内、SISRE は 1.5 倍以内です。ラウンド 2 の再実行は、エンジンの変更の前、およびホールドアウトの軌道を取得する前に事前登録しました（aa559785）：論文の Eq. { "1" } と Section { "2.3" } のフィットに、衛星ごとに新たに二日分のホールドアウトを加え、同じ印刷値と照合します。測定値：論文の日のすべての比は { "0.755" } から { "1.138" }、すべてのホールドアウトの比は { "0.683" } から { "1.186" } でした。開示：最初の実行の { "20" } 分の along-track の比 { "1.71" }（Sentinel-2A）と { "1.86" }（Sentinel-6A）は、再実行の前に分かっていました。ホールドアウトの SISRE の比の最も低いものが下限の { "0.667" } 付近にあるのは、論文に印刷された SISRE が Table { "2" } の重みを二乗せずに用いているためです（16 パラメーターのフィッターの行を参照）。事前登録は論文の停止規則を誤って記述していました（論文は RMS の変化が { "0.1" } mm 未満で停止します）。事前登録したパラメーター収束規則を維持しました。ミューテーション：ゼロ中心の事前分布を戻すと、Sentinel-6A の { "20" } 分の along-track は { "0.70" } cm に対して { "1.08" }（{ "1.54" }）となり、不合格になります。レビュアーによる検証：0.30 より前の規約（n_dot に係数 1/2）でもすべての数値が変わらないため、この比較が制約するのは 22 パラメーターモデルの関数空間とそのフィットの質であり、n_dot の規約ではありません。主張の範囲外：ATOMIC の ECEF 多項式と、合成の五つの高度のモデル比較表で、これらには独自の MODELLED の行があります

seg-e79047fc95af = ATOMIC のゼロ時計 ECEF 多項式と、合成の五つの高度による LEO モデルの比較

seg-e261843e35b1 = leo_navmsg::elements::EphemerisModel の EcefPoly バリアント：時計項をもたない軸ごとの ECEF 多項式で、相対論的な項は -2 r.v/c^{ "2" } から求め、ステアリングされた時計に対して採点します。あわせて、モデル比較の解析（LIU2025_TABLE に対する liu_comparison）があり、論文の五つの高度で、Kshana が積分した軌道の 20 分のアークに 22 パラメーターのモデルをフィットし、その結果を公表されている SISRE の隣に出力します

seg-a3b92fdcc591 = InsideGNSS による ATOMIC モデルの事実（6 次の多項式、有効期間は約一分、{ "30" } 秒ごとの更新、時計はステアリング、時計誤差 { "24" } cm）。これらは記述的な事実であり、比較できる公表数値はありません。五つの高度の表は、Liu et al. { "2025" } の SISRE（{ "320" }、{ "475" }、{ "786" }、{ "966" }、{ "1336" } km の 20 分のアークで、{ "8.88" }、{ "6.21" }、{ "2.87" }、{ "2.11" }、{ "0.75" } cm）を、Kshana が自身の積分した軌道にフィットした値（{ "4.25" }、{ "2.87" }、{ "2.20" }、{ "1.25" }、{ "0.51" } cm、比は { "0.46" } から { "0.77" }）の隣に出力するもので、論文は実際の精密軌道にフィットしており真値が異なるため、固定はしていません。22 パラメーターのモデルとそのフィットそのものは、「Liu et al. { "2025" } の 22 パラメーターの LEO エフェメリスモデルと、実際の精密軌道へのそのフィット」の行で、実際の軌道に対して外部の参照と照合して確認済みです。{ "0.30" } の改訂：表の数値は、論文の規約のフィットに伴って変わりました（GRACE-A { "5.40" } -> { "4.25" } cm、GRACE-C { "4.12" } -> { "2.87" }、Sentinel-2A { "2.95" } -> { "2.20" }、HY-2A { "2.38" } -> { "1.25" }、Sentinel-6A { "0.70" } -> { "0.51" }）

seg-7a9fca5166d4 = LEO 航法メッセージの単一周波数の電離圏サービスと UTC サービス

seg-bc73bfeca68e = leo_navmsg::services：任意の搬送波での Klobuchar の放送遅延（エンジンの L1 モデルを (f_L1/f)^{ "2" } でスケーリング）、全ゼロと [{ "0" }, { "400" }] sfu の規則を含む NeQuick-G の実効電離レベル Az = ai0 + ai1 mu + ai2 mu^{ "2" }、および ICD の三つのうるう秒のケースによる、システム時刻から UTC への変換

seg-84500ea94d49 = GNSSTk { "15.3.1" }（ARL:UT、LGPL-3.0、コミット 55ea3344、ハーネス経由で別プログラムとして実行。GNSSTk のコードは同梱していません）：L1、L2、L5 での KlobucharIonoNavData の getIonoCorr、全ゼロと [{ "0" }, { "400" }] sfu の規則での Az についての NeQuickIonoNavData の getEffIonoLevel、UTC ドリフトについての GPSLNavTimeOffset の getOffset で、{ "1e-3" } m、{ "1e-6" } sfu、{ "1e-9" } s 以内。また ERFA（pyerfa { "2.0.1.5" }、BSD-3 経由）は、IERS のうるう秒テーブルから UTC を導出し、実際の 2015-06-30 と 2016-12-31 のうるう秒をまたぐ ICD の三つのうるう秒のケース（{ "23" }:{ "59" }:{ "60" } の表記を含む）について、{ "1e-9" } s 以内です（GNSSTk は ICD のケース (b) の一日の長さの規則を実装していないため、事前登録に記したとおり、そこでは使用していません）。入力は実際の IGS BRDC ヘッダー係数です。事前登録済み（6a66994b。修正 88807a7e は、Kshana の値をどれも比較する前に、うるう秒のグリッドから { "21" } 602 行の部分集合をコミットしたもの）。NeQuick の電子密度の積分は実装しておらず、電離圏の内側を飛ぶ LEO 衛星に対する補正も行っていません

seg-0af8030f4d21 = 地上の受信機が LEO 航法衛星に対して扱わなければならないドップラー

seg-9714103964d6 = 地球固定の位置と速度が、永年 J2 ドリフトと地球の自転を伴う二体軌道から得られる衛星（leo_fusion::geom::EarthOrbit::state、速度は位置の厳密な時間微分）の厳密な距離変化率を搬送波でのドップラーに変換したもの、および窓にわたる仰角マスク上の最大の絶対ドップラー、ドップラー変化率、ジャーク（leo_fusion::doppler::doppler_envelope）。<c1/> kind が doppler モードで LEO システムごとに報告します

seg-ebf6cee8ec4c = 規定の軌道と搬送波から再現した公表数値：Iridium のドップラーは最大でプラスマイナス { "36" } kHz（Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites）、Xona Pulsar X1 の最大ドップラーは { "32" } から { "34" } kHz（Leclère, Marathe and Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }）。Iridium の数値は丸めた上限であるため、合格基準は { "5" }% です。ドップラー変化率とジャークは報告しますが、外部の参照による確認は行っていません：Pulsar X1 の真上の通過のモデル化したジャークは約 { "1.0" } Hz/s^{ "2" } で、公表値は { "1.26" } です

seg-d2e18c8bdc14 = LEO ドップラーによる測位：単一衛星と複数衛星、時計ドリフトと速度の状態を含む

seg-de6cb3c06490 = 解析的な偏微分を用いた、距離変化率からのバッチのガウス・ニュートン法による測位（d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho、d/dv = -u、d/d drift = { "1" }）。オプションとして一定のユーザー速度、地表のユーザーに対する高さの擬似測定、ダンピングしたステップ、真値での形式的な共分散、along-track、cross-track、鉛直への射影、ユーザーの cross-track のオフセットに対する単一通過の精度、最接近の時刻を扱います。<c1/> kind の doppler モードは、窓の長さに対する誤差と、ドップラーのみの機会信号モード（starlink-sop プリセット）を加えます

seg-84e2eb636579 = 内部の整合性：雑音なしでの復元、数値的に微分した運動学の恒等式 rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho、最接近でのゼロドップラー、単一通過の鏡像解、シード付きの誤差と形式的な共分散との比較。Kozhaya, Saroufim and Kassas の Starlink の数値（NAVIGATION { "72" }({ "1" }), { "2025" }：三機の衛星で { "20" } 秒に約 { "2" } m）は比較にとどまります。完全なエフェメリスと、すべての誤差を { "30" } Hz のドップラー sigma に含めたモデル化した受信機は、同じ窓では数倍精度が低く、論文の受信機と測定レートは再現していません

seg-7f462969d2d4 = システム間バイアスと信号ごとの誤差モデルを用いた、GNSS と LEO の統合疑似距離測位

seg-b9b5298e3408 = 任意のシステムの組み合わせに対する重み付き最小二乗のガウス・ニュートン法による解で、受信機の時計はシステムごとに一つ（システム間バイアスは位置とともに推定）、または基準の時間尺度上の既知の放送オフセットを用います。測定ごとの sigma は呼び出し側が与えるか、既定ではエンジンの遅延ロックループの熱雑音（navsignal::dll_code_jitter_chips）を、その仰角での C/N0 で評価し、衛星信号の距離誤差と合成したものです。ローカルの測地座標系での重み付けなし DOP（GDOP、PDOP、HDOP、VDOP、TDOP）、形式的な東・北・上の sigma とバイアスの sigma も出力します。<c1/> の joint モードは、GNSS のみ、LEO のみ、融合した解を比較し、追加した LEO 衛星の数に対して DOP を掃引します

seg-e83699418c0e = 手で導いた四衛星の DOP（一機が天頂に、三機が水平線上で { "120" } 度ずつ離れ、その正規行列は手で逆行列を求められます）、独自の時計をもつ一衛星のシステムは幾何を追加しないという構造上の恒等式、位置、時計、バイアスの雑音なしでの復元、シード付きの誤差と共分散との比較。内部のチェックのみで、受信機の出力とは比較していません。{ "0.30" } の外部比較での所見（MODELLED のまま）：複数 GNSS の IGS の一日（ABMF 2018-05-13、GPS と Galileo の C1C、放送エフェメリス、Klobuchar）で、システム間バイアスは RTKLIB v2.4.2-p13 rnx2rtkp と一致します（{ "0.30" } の放送群遅延の修正後は中央値の差 -0.11 ns、修正前は -0.35 ns、合格基準は { "1" } ns）。しかし、ITRF2020 座標から { "3" } m 以内に入るエポックは { "280" } 件のうち { "93.6" } % のみ（修正前は { "93.2" } %）で、事前登録した { "95" } % に届きません。RTKLIB 自身も同じデータで { "88.2" } % であるため、この基準はソルバーの不一致ではなく、この局とこの日の単一周波数の放送測位の限界を超えたものです。比較テストは無視された状態でコミットしています。{ "0.30" } ラウンド { "2" }、より厳しい入力で、変更しない { "3" } m / { "95" } % / { "1" } ns の基準による所見（MODELLED のまま）：Galileo E1/E5a の電離圏フリーの組（事前登録 { "6927e039" }）では { "3" } m 以内のエポックは { "79.9" } %（RTKLIB は { "67.9" } %）、精密な CODE MGEX の軌道、時計、衛星アンテナオフセット、符号バイアス（事前登録 7d8c3597）では { "94.2" } %（RTKLIB は { "94.1" } %）で、システム間バイアスは RTKLIB と -1.03 ns 異なります。これは RTKLIB の単独モードが衛星アンテナオフセットを無視するためです（双方が省略した場合は +{ "0.04" } ns）

seg-ee9a4a0cb530 = GNSS のみの場合と LEO による補強がある場合の、精密単独測位の収束

seg-a54f36c27d90 = 電離圏フリーの符号と位相に対するフロート PPP の拡張カルマンフィルター：静的な座標、白色の受信機時計、追加システムごとに一つのシステム間バイアス、1/sin(仰角) でマッピングしたランダムウォークの天頂湿潤遅延、衛星のアークごとに、昇りで追加し沈みで削除するフロートのアンビギュイティ、そして衛星の符号と位相に共通する精密な軌道と時計の誤差を、Joseph 安定化形式の相関のある二行の更新として一括処理します。測定は同じモデルからシミュレートします。収束時間（実行の終わりまで誤差がしきい値を下回る）、誤差曲線、実行平均の位置の NEES を、GNSS のみと各 LEO ケースについて求め、<c1/> kind として実行します

seg-be4593802ccf = NEES のカイ二乗検定は内部の整合性チェックです（真値とフィルターはモデルを共有しています）。傾向は Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764（{ "2019" }）, doi 10.1007/s00190-018-1195-2 と比較しています：複数 GNSS の { "9.6" } 分は、{ "60" }、{ "96" }、{ "192" }、{ "288" } 機の LEO 衛星でそれぞれ { "7.0" }、{ "3.2" }、{ "2.1" }、{ "1.3" } 分に短縮されます。同梱のシナリオは、独自の代表的な { "1000" } km、{ "60" } 度のシェル、雑音、局で { "7.4" }、{ "4.8" }、{ "3.2" }、{ "2.7" }、{ "2.3" } 分を与えます。論文のコンステレーション、雑音、収束の定義は再現していないため、これは傾向（単調な短縮、最大のコンステレーションで GNSS のみの時間の三分の一未満）の MODELLED の整合性であり、外部の参照による確認ではありません

seg-8ef013b46d0f = 信号帯域幅から求める 5G 非地上系ネットワークの測位精度

seg-12b1e4657370 = 二乗平均平方根（ガボール）帯域幅からの到達時刻に対するクラメール・ラオ下界 c/({ "2" } pi beta sqrt({ "2" } (C/N0) T))：平坦な OFDM スペクトル（beta = B/sqrt({ "12" })）、帯域制限された BPSK スペクトル（閉形式の分子）、または数値積分による任意のスペクトルについて、および複素トーンの周波数についての sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" }))。受信機の時計が未知のダウンリンクの到達時刻による解と、3GPP n256 MSS の S バンドでの通過にわたる単一衛星のドップラーによる解を、<c1/> kind として実行します

seg-f63e1d78cfff = 公表されている計算例の値（P1）：Bachl, Lei and Nabeel, arXiv:{ "2608.10270" }（{ "2026" }）の NR NTN の単一 SSB の下界を、3GPP TS { "38.211" } の SSB マップから、Kshana 自身の数値関数を通じて再現しました（W_rms { "1.9616" } 対 { "1.96" } MHz、sigma_t { "38.755" } 対 { "39" } us、sigma_f 100.79/87.28 対 101/87 Hz、sigma_rho 0.5970/0.5831 対 0.60/0.58 m で、いずれも印刷された最後の桁の半分以内）。Betz { "2001" } の Table { "1" } の BPSK-R の RMS 帯域幅（1.128/3.477 対 1.1/3.5 MHz、補足）。到達時刻とドップラーの解の共分散は、エクスポートした幾何に対する numpy { "2.4.6" } の numpy.linalg.inv と一致します（P2。相対 { "5e-15" } と { "1.2e-5" }、合格基準は { "1e-5" } と { "1e-3" }）。事前登録済み（9f2875db。part C は 0d66dccd）。エンジンの解 joint_pvt::formal_sigma_enu（ノイズを含む解ではなく、真の位置で評価した下界）は、最初の { "200" } kHz の実行が { "6.5e-5" } で不合格になった後に書かれ、許容差を変えずに再実行しました。シナリオが実行する平坦スペクトルと複素トーンの形式（gabor_bandwidth_flat_hz、doppler_crb_sigma_hz）は、クレート内の恒等式の単体テストを通じて P1 のチェックに到達します。多重反射のないチャネルでの下界であり、達成された精度ではありません。{ "0.30" } の改訂：ntn-5g-positioning の toa_median_sigma_3d_m { "2.0903959" } -> { "2.0903962" } m（NR { "5" } MHz）と { "25.938613" } -> { "25.938839" } m（NB { "200" } kHz）

seg-9306f1c06081 = C/N0 と受信機の発振器に対する、LEO 支援による UTC への時刻比較

seg-c618feb01476 = 既知の位置から可視のすべての LEO 衛星からの時計測定を、疑似距離の雑音モデルによる逆分散で合成し、二状態（位相、周波数）のカルマンフィルターでフィルタリングします。その過程雑音は、発振器クラスの白色およびランダムウォークの周波数雑音です（slot_timing::ClockNoise、clock_state::ClockClass。holdover::coast_phase_variance のコースト分散）。同じレベルからシード付きの真の時計を生成し、IS-GPS-200 の section { "20.3.3.5.2.4" } のシステム時刻から UTC への式に、放送オフセットの不確かさを実行ごとのバイアスとして加えます。<c1/> の timing モードは、発振器と C/N0 のオフセットを掃引します

seg-4a878bd4a90f = 内部の整合性：公表されているオフセットの式を手で評価したもの、{ "40" } 個のシードにわたる正規化した誤差、およびオフセットの不確かさで決まる下限。小型原子時計を備えた Iridium のタイミング受信機についての NIST の数値（{ "40" } 日間で UTC(NIST) から { "40" } ns 未満）は比較にとどまります。同梱の Iridium シナリオは、代表的な { "5" } m の距離誤差で公称電力のとき、RMS { "10" } から { "11" } ns を与えます。フリッカー周波数雑音と電離圏遅延はシミュレートしていません

seg-cef79d82f0d4 = 極域と北極圏のユーザーに対する、LEO のカバレッジと精度低下率の、MEO GNSS との比較

seg-462a5e95d480 = 緯度に対する、可視衛星数と、可用性を伴う PDOP、HDOP、VDOP の中央値を、サンプリングした経度とエポックにわたり、MEO GNSS システムのみ、LEO システムのみ、およびそのすべてについて、各システムに独自のマスクと時計モデルを用いて求め、<c1/> polar モードとして実行します。軌道は、掃引エポック（polar モードでは 2026-01-01T00:{ "00" }:{ "00" } UTC）の SGP4/SDP4 の要素セットで、外部の参照と照合して確認済みの地球軌道の経路（IAU 2006/2000A、UT1 = UTC、極運動なし）で地球固定座標系に移します

seg-a16896913438 = Orekit { "13.1.8" }（Apache-2.0）と Hipparchus { "4.0.3" }：エンジンの GCRS の状態を Orekit で ITRF に回転し（IERS { "2010" }）、WGS-84 の TopocentricFrame の可視性を各システムのマスクに対して評価し、時計の未知数が一つの場合は org.orekit.gnss.DOPComputer、複数の場合は NumPy { "2.4.6" } の numpy.linalg.inv（P2）を用います。経路は python-sgp4 と ERFA（「単一の地球軌道の経路」の行）で確認しています。合格基準は実行前に固定しました（事前登録 72ea9eb0。T2 と T3 は { "0.30" } ラウンド 2 の基準）。TEME -> GCRS の段階を J2000 に固定するとテストは赤になります（{ "4739" } 件の失敗）。幾何のみで、シンチレーション、地形、信号電力は含みません。GNSS の VDOP は極に向かって上昇します（同梱のシナリオの GPS と Galileo で、赤道の { "1.20" } から { "89.9" } 度の { "1.51" } へ）が、極に近い LEO のシェルはそこで収束します。履歴：ラウンド { "2" }（3254d456）は表形式の二体の状態で一致しました。D8 のラウンド 1 の、Orekit 自身の TLE 伝搬に対する完全な主張（e947e69d）は所見であり、e = { "0" } での Orekit の SDP4 と、その IERS { "1996" } の TEME が固定されました

seg-d92777401093 = 出典を明記した、任意のデータプリセットとしての名前付き LEO PNT システム

seg-5130bfe2410c = システムに依存しない入力：すべてのシステムは、Walker シェル、明示的な要素、または GNSS プリセット、信号（搬送波、チップレート、帯域幅、受信電力または C/N0 の範囲）、SISRE、ドップラー sigma、時計モデルからなります。プリセットはシナリオが省略した部分のみを補い、ファイルは一つずつで、出典はPUBLIC（URL 付き）、WORKSHOP、または導出のいずれかを付け、非公表の値は代表値として記載します：Xona Pulsar X1/X5、Iridium STL、機会信号としての Starlink、CentiSpace、代表的な C バンドのシステム、ATOMIC のゼロ時計エフェメリスモデル、およびオプションの Celeste IOD プリセットファイルにあるワークショップ由来のプリセット一つで、そのファイルとそのシナリオを削除することで除外できます

seg-c6f71b3937cd = 引用した公開値の転記で、構造の確認（すべての公開出典に URL がある、Walker パターンが均等に割り切れる、{ "290" } K での受信電力を kT で割った C/N0）を行っており、外部のオラクルとの照合ではありません。代表値は各プリセットに名前が示され、例示です

seg-dec52b5b9cd6 = 一つの LEO-PNT システムのエンドツーエンド：信号設計、通過のリンクバジェット、航法メッセージ、融合した測位で、各段階の出力が次の段階に渡されます

seg-39443b31d418 = <c1/> kind：leo-signal の設計（公開プリセットまたはインライン）が、leo-pass のバンドの中心、帯域幅、チップレート、EIRP の配分を設定します。通過はエポックごとに、追尾する成分の C/N0 と帯域制限された符号ジッターを与えます。sin(仰角) に対する C/N0 の最小二乗の直線、leo-navmsg のメッセージの SISRE（通過する衛星の軌道でフィットしたものに、規定の軌道決定の項を二乗和平方根で加えたもの）、および設計の搬送波とチップレートが、leo-pvt の融合解のすべての LEO システムに、また任意で leo-ppp の LEO ケースにも渡されます。すべての引き継ぎは、値と単位とともに報告されます

seg-854d3c1428d0 = 引き継ぎの自己整合性：引き継がれた各値は上流の段階自身の出力と等しく、上流の入力を変えると、それに依存するすべての下流の数値が動きます。各段階は自身のラベルを保ち、このチェーンは物理も外部のオラクルも追加しません

seg-55ca63edff02 = LEO のドップラーと通過の幾何の整合性によるスプーフィング検出

seg-b12fc1728220 = <c1/> kind の <c2/> セクション：スプーファーが、偽装した位置で見える信号を、距離と距離変化率について自己整合的に偽装します。この位置は、開始時点の後に、真の位置からジャンプするか、押しやられるか、またはその両方が起きます（LEO のバンドごと、および MEO の GNSS 信号について）。受信機は、すべての距離変化率を放送軌道と独立した事前の位置と速度から予測し、測定された距離変化率を、エポックの窓にわたる一般化最小二乗のカイ二乗統計量で検定します（時計ドリフトは攪乱要因とするか、事前値を与える）。これを GNSS チャネル、LEO チャネル、全チャネルについて、C/N0 からの周波数ロックループの熱雑音（Kaplan & Hegarty { "2006" }, section { "5.6.2" }）とともに行います。検出確率は、規定の誤警報確率における非心カイ二乗分布から求め、検出は、規定の見逃し確率で宣言されます

seg-787c07c08c7f = 閉形式と恒等式であり、外部の測定ではありません：中心差分に対する距離変化率の勾配、密な共分散形式に対する情報形式の統計量、純粋な時計ドリフトはゼロを与えること、事前値で説明できる押しやりは最大でも |dx|^2/sigma_p^{ "2" } を与えること、ジャンプに対して二次である統計量。検出の数値は、測定された攻撃とは比較していません。スプーファーは理想化されています（電力、到来角、相関ピークの特徴はありません）

seg-5f341f85ac07 = マルチバンド LEO 信号のバンド間の整合性によるスプーフィング検出

seg-2f9c4d351b0f = <c1/> セクションは、すべての LEO 衛星と測距バンドの組について、幾何フリーの疑似距離の組み合わせを作り、受信機の電離圏モデルを除去して、そのエポック間のステップを、二つのバンドの符号雑音と、規定の許容するモデル化されていない電離圏変化率に対して検定します（両側ガウス、厳密な検出確率）。一部のバンドを偽装して他を偽装しないスプーファー、または電離圏なしですべてのバンドを偽装するスプーファーは、開始時点で検出されます。すべてのバンドを偽装して電離圏をシミュレートするものは検出されず、結果はこのことを明記します

seg-87fd44fa1d94 = 恒等式：電離圏フリーのスプーファーの開始時点のステップは、その組のモデル化した電離圏遅延の差に等しく、しきい値は両側の正規分位点にステップの標準偏差を掛け、変化率の上限を加えたものです。受信機の電離圏モデルはエンジンのものであるため、本物の残差は構成上、平均がゼロです。外部のオラクルはありません

seg-97dbcd5f2728 = 電離圏の観測：LEO の通過の二バンドの遅延からの斜め TEC

seg-844de34fd2f3 = <c1/> 衛星のすべてのバンドの組について、レポートは、幾何フリーの符号の組み合わせが通過のピークで復元する斜め全電子数 (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })) と、二つのバンドの熱的な符号雑音からの 1-sigma を与えます。これにより、あらゆるマルチバンドの LEO-PNT の設計を、電離圏の観測装置としてトレードできます

seg-2562ae9e6180 = 一次の分散の恒等式で、エンジン自身の一次遅延（その 1/f^{ "2" } のスケーリングは、IS-GPS-200 に対して、その行で VALIDATED）に対して構成上厳密です。精密度は熱的な符号雑音のみで、マルチパスや周波数間バイアスは含みません。{ "0.30" } ラウンド { "2" }、測定（事前登録 5e795f93）、所見（MODELLED のまま）：CODE の全球電離圏マップ CODG1330.18I を、CODE のバイアスを用いた ABMF の C1C/C2W の符号と比較すると、{ "36" } のアーク平均のうち { "33" } が { "3" } TECU 以内に収まり（夕方のアークで最悪 +{ "6.84" } TECU、エポックごとの RMS { "3.95" } TECU）、基準はすべてのアークであるため、外部の参照による確認は行っていません

seg-0a63a69e181d = 局を推定した場合の月の座標系のデータム共分散を、50 桁の拡張精度に対して照合

seg-de2ee45f6527 = lunar-frame-campaign シナリオの七パラメーターのヘルマートデータム共分散を、地球の局を推定した場合（局 { "1" } を固定）について、lunar_frame_campaign が binary64 で計算したとおりに求めたもの：遅延ヤコビアンから累積した局とビーコンの結合フィッシャー情報、ヤコビのスペクトル逆行列を通じたシュール補行列による局ブロックの周辺化、ヘルマートの設計で形成して、スペクトルにより逆行列を求めた H = AᵀSA。この問題は構成上、悪条件です（ヘルマートの条件数は { "2.1e8" } から { "2.3e8" }、結合情報の条件数は { "1.6e12" } から { "3.0e13" }）：シュール補正の相対変化 { "1e-9" } は、データムの sigma を最大 { "28" } % 動かします。報告：七つのデータムの sigma、ヘルマートの条件数、最も弱い方向。主張（範囲を狭めたもの）：エンジンのデータムの sigma と条件数は、この問題に対する後退安定な倍精度パイプラインの事前の最悪ケースの誤差の上限の範囲内にあります。倍精度で可能な限り正確であるとは主張しません（同じ入力で、因数分解の経路は約千倍、オプトインの平方根ソルバーは約一千万倍正確です）。最も弱い方向について外部の参照と照合して確認済みなのは、その基準が直角を下回る場合（局を固定した対照）のみです

seg-1aab389815b3 = mpmath { "1.3.0" }（BSD-3-Clause）で { "50" } 桁の有効数字、{ "80" } 桁で自己チェック済み（一致は { "1.1e-38" } 以上）、エンジンのコミット済みのヤコビアン、重み、ヘルマートの設計に対して：シュール補行列については mpmath 自身の LU 解、H についてはその逆行列、そしてそのヤコビの固有値分解（P2、独立した数値ライブラリ）。フィクスチャが存在する前に 804662d5 として事前登録し、合格基準は一次の後方誤差の式から導きました：定数 (3n+{ "1" })n + m に単位丸めを掛けたもの（Higham, Accuracy and Stability of Numerical Algorithms, Theorem { "10.4" }、Tier B の形）に、結合情報、シュール補行列、H に対する各量の厳密な一次感度を掛けたものです。測定値：データムの sigma は 2026-03-18 で { "4.8e-6" } 以内（基準 { "9.6e-2" } から { "2.2e-1" }）、2024-01-01 で { "9.7e-6" }（基準 { "2.8e-2" } から { "6.9e-2" }）、局を固定した場合は { "2.0e-14" }（基準 { "1.0e-11" } から { "2.8e-7" }）、条件数は { "4.6e-6" }、{ "1.3e-5" }、{ "4.1e-14" } 以内です。局を推定するシナリオでは、基準は最悪ケースで測定誤差より四桁大きく、そこでの最も弱い方向の基準は直角を超えるため、そのチェックは数えていません。局を固定した対照では、最も弱い方向は { "9.4e-11" } の基準に対して { "6.6e-16" } rad で一致し、単位ベクトル間の弦で測定しました（以前の acos による比較では { "1.5e-8" } rad 未満の角度を分解できませんでした。基準は変更していません）。診断：NumPy { "2.3.5" } のコレスキーと QR の経路は、2024-01-01 の入力で { "9e-9" } と { "5e-9" }、その逆行列と固有値の経路は { "2.9e-6" } と { "6.2e-6" } に達します：エンジンは上限の範囲内ですが、因数分解の経路より約千倍精度が低くなります。確認するのはコミット済みの入力に対する線形代数であり、ヤコビアン（それはキャンペーンの行の SPICE の部分が行います）や、例示的なキャンペーンの物理的な精度ではありません

seg-71b463388e80 = 平方根情報によるデータムソルバーを、50 桁の拡張精度に対して照合

seg-5ec3e3c2bf19 = データムのための情報行列を形成も反転もしない、オプトインの平方根情報ソルバー（lunar-frame-campaign solver = "srif"。既定は変更なし）：平方根情報フィルターの測定更新としての、白色化した遅延ヤコビアンの Householder QR（直交三角分解）、後続の三角ブロックを通じて周辺化した地球の局（その Gram 積がシュール補行列）、七パラメーターのヘルマートデータムのための R_bb A の二回目の QR、三角逆行列の行ノルムとしての sigma、そして片側ヤコビ特異値分解によるスペクトル（条件数、最も弱い方向）。内積は Dekker 分割の誤差なし積で補償しているため、すべての演算は正しく丸められた IEEE-754 の基本演算または平方根であり、すべてのプラットフォームで同一の結果になることは、これに基づいて論じたもので、プラットフォームをまたいだテストはしていません

seg-271cba640489 = mpmath { "1.3.0" }（BSD-3-Clause）で { "50" } 桁の有効数字、{ "80" } 桁で自己チェック済み（一致は { "1.4e-43" } 以上）、エンジンのコミット済みのヤコビアン、重み、ヘルマートの設計に対して（P2、独立した数値ライブラリ：mpmath 自身の LU 解、逆行列、コレスキー、ヤコビの固有値分解）。ソルバーが書かれる前に b41908c9 として事前登録し、合格基準は平方根形式の一次の後方誤差の上限から導きました：Householder QR の定数 mn に (3n+{ "1" })n を加え、単位丸めを掛けたもの（Higham, Accuracy and Stability of Numerical Algorithms, Theorem { "19.4" } と Chapter { "8" }）に厳密な感度を掛けたものです。測定値：データムの sigma は 2026-06-09 で { "3.0e-13" } 以内（基準 { "4.1e-7" } から { "5.3e-7" }）、局を固定した場合は { "1.9e-15" }（基準は最小で { "4.8e-12" }）、2026-03-18 で { "3.8e-13" }、2024-01-01 で { "2.3e-13" } で、既定のスペクトルソルバーは { "4.8e-6" } と { "9.7e-6" } ずれています。条件数は { "4.9e-13" } 以内、最も弱い方向は { "1.4e-13" } rad 以内（対照は { "5.1e-10" } に対して { "1.7e-16" }）。確認の限界：基準が保証するのは、相対でおよそ { "2e-7" } 未満のデータム誤差のみで、測定した { "1e-13" } の数値は観測であり、基準が保証するものではありません。このチェックは、既定のスペクトルソルバー（2024-01-01 では sigma が { "2.9e-7" } に対して { "9.7e-6" }、拘束となる日付では { "4.9e-7" } に対して { "1.3e-6" }、余裕は { "1.3" } から { "2.6" }）と、誤って取った三角逆行列（列ノルム：赤）を退けますが、符号を反転させた Householder、補償なしの内積、平方根因子から形成した H のスペクトル逆行列による sigma（{ "3.7e-9" }）は、すべて合格してしまうため、平方根の各ステップが必要であることを示すものではありません。確認するのは、コミット済みの入力に対するオプトインのソルバーの線形代数であり、ヤコビアンでも既定のソルバーでもありません。プラットフォームをまたいだビット単位の再現性は、使用する演算に基づいて論じており、テストは一つのプラットフォームでの再実行の同一性のみです

seg-433b52bf0ba2 = 海事の信頼性モニター：その土台となる演算（NMEA のデコード、測地線オフセット、運動学とセンサー残差の統計量）

seg-c61c575f9c38 = 船舶について、<c1/> は、受信機とその機器が出力する NMEA { "0183" } センテンス（GGA、RMC、VTG、HDT、VHW、VBW、ZDA、GSV）をデコードし、測位間の東・北オフセット（<c2/>）を求め、これらからモニターが判断の基にする統計量を求めます。{ "30" } 秒の窓での推定速度、推測航法の残差、推定加速度、推定旋回率、針路に対する船首方位、対地速度に対するスピードログ、アンテナ高度の各残差（{ "10" } 秒の中央値）、そして衛星の信号対雑音比の広がりと上昇です。

seg-1fdbb476c8ab = 海事の信頼スコア：モニターの証拠を 0-100 のスコアと三つの区分に集約したもの

seg-0d76b33144f1 = 各モニターは証拠を、統計量としきい値の比に落とし込みます。スコアは { "100" } から、モニターごとの重みに、その比の上下限付きの線形ランプ（{ "0" } から { "0.5" }、{ "1.5" } で { "1" }）を掛けたものの総和を引き、{ "0" } から { "100" } に制限して { "0.1" } に丸めたもので、区分の境界は { "90" } と { "55" } です。各エポックには、減点したモニターとその点数が列挙されます。

seg-b2d3c6d6ac36 = 仕様に対する実装であり、外部のオラクルではありません：クリーンルームでの Python による再実装（scripts/maritime_score_cleanroom.py）は、docs/RECEIVER-TRUST.md と docs/MARITIME-TRUST.md のみを与えられ Rust のソースは見ていない読み手が書いたもので、score_from_ratios と { "600" } 個の比のベクトルで一致します（スコア、区分、点数、減点の順序、差は { "0" }）。これは、最初の読み手が記述の欠落や不整合を見つけた箇所（同順位の順序、丸め、合否型モニターの比、数値が式と合わない二つの例）について、文書を完成させた後の結果です。これが示すのは、文書が十分であり、コードが記述どおりに動作するということです。確認していない内容と、この行が MODELLED のままである理由：規則そのもの（重み、ランプ、区分の境界、証拠の保持）はこのプロジェクト独自のもので、事前登録はしていますが外部の出典はなく、スコアの { "80" } や { "40" } が、実際の干渉の下で航海士が望む意味を持つことを示すものはここにはありません。その種の数値は示していません。モニターのしきい値も同様にこのプロジェクト独自のものです（Row A が確認するのはその演算のみ）。

seg-f52fceaf06ca = NMEA { "0183" } の訓練ストリームの適合性とデコードされた値

seg-684f86418933 = 乗組員の訓練のための合成ブリッジ NMEA { "0183" } ストリーム（kshana nmea-scenario）：GGA、RMC、VTG、ZDA、GNS、GSA、GSV、HDT、VBW と PKSHT マーカーを、モデル化した受信機、空、ジャミング、スプーフィングの効果を伴う真の航跡から生成します。テキスト出力のみで、何も送信しません。

seg-4591ed75149c = 外部で確認した内容（範囲を限定して記述）：八本の合成訓練ストリーム（四つのライブラリシナリオ、シード { "1" } と { "7" }。GGA、RMC、VTG、ZDA、GNS、GSA、GSV、HDT、VBW と PKSHT マーカー）のすべての { "225,227" } センテンスが、独立した NMEA パーサーである pynmea2 { "1.19.0" } で、有効なチェックサムと期待されるトーカーと種別で解析されます。それがデコードする位置、対地速度、対地針路、船首方位、UTC の時刻と日付、測位ステータス、GGA の衛星数は、最初の比較の前に固定した許容差（{ "1.5e-6" } 度、{ "0.06" } kn、{ "0.07" } km/h、針路 { "0.11" } 度、船首方位 { "0.5" } 度、{ "0.02" } 秒）の範囲で、ジェネレーターの真の航跡と等しく、tests/fixtures/nmea_training_ref/ のフィクスチャを用いて scripts/gen_nmea_training_ref.py が実行します。GGA の衛星数の期待値は、最初の実行の後に NMEA の規約（測位なしの場合は { "00" }）に修正しました。数値の許容差は事前登録のコミットから変更していません。確認していない内容：いずれかの受信機、チャートプロッター、ブリッジシステムがこのストリームを受け付けること、受信機、空、ジャミング、スプーフィングのモデルの現実性（公称の空、モデル化した雑音、ドラッグとリプレイのプロファイルは、いずれも MODELLED）、構文と数を超える HDOP、高度、DOP と GSA/GSV の内容、教官ログ。何も送信せず、対ジャミングや対スプーフィングの性能は主張していません。

seg-1be1cfcb95c8 = 干渉マップ：精度コードの意味、AIS の利用不可の値、グリッドセルの割り当て、セルの状態ごとの経路長、および内陸のマスキング

seg-71cff2a675e8 = マップが用いる ADS-B の航法精度とインテグリティのコードの読み取り（NACp コードが表す EPU の上限、NIC コードが表す包含半径の上限、およびそれらから手法が導く低と良のクラス）、AIS リーダーが破棄する AIS の位置と速度の利用不可の値、位置が属する固定の緯度・経度グリッドセル、経路の長さと、経路の曝露が報告するセルの状態（劣化、劣化なし、未評価、未観測）ごとの内訳、そして位置が陸地のポリゴンから、バッファを超えて内陸側にあるかどうか。劣化または異常とフラグが付いたセルは、報告された精度フィールドや非現実的な位置についての記述であり、干渉があったという所見ではなく、ここではそれを確認していません。

seg-beee15333c89 = 外部で確認した内容（範囲を限定して記述）：五つの独立した実装が同じ合成入力を読みます。({ "1" }) pyModeS { "2.21" } が合成の DF17 運用ステータスと空中位置のフレームをデコードし、Kshana の NACp の EPU の上限は { "0.5" } m 以内で一致し（最大の差 { "0.4" } m）、コード { "5" } から { "11" } の NIC の包含上限は { "1" } m 以内で一致し、低と良のクラスは、{ "12" } 個の NACp コードすべてと、オラクルが生成するすべての NIC コード（{ "0" } から { "11" }）を、オラクルの上限が示すしきい値の同じ側に置きます（不一致は { "0" } 件）。({ "2" }) pyais { "3.3.0" } は、ペイロードのビットをスクリプトが生の ITU-R M.1371 のフィールド値から詰めた AIVDM タイプ { "1" } のセンテンスをデコードします。Kshana は、デコードされた利用不可の位置（緯度 { "91" }、経度 { "181" }）と速度（{ "102.3" } kn）をちょうど拒否し、{ "0" } から { "102.2" } kn はデコードされたとおり保持します（{ "94" } フレームで不一致は { "0" } 件）。({ "3" }) セルのポリゴンに対する shapely { "2.2.0" } の covers() は、セルサイズ { "0.5" }、{ "0.25" }、{ "1" }、{ "0.07" } 度にわたる { "1770" } 点について、端に近い点、両極、日付変更線を含めて、grid::Grid::cell_of と一致します（不一致は { "0" } 件）。({ "4" }) shapely { "2.2.0" } による経路とセルの交差を、GeographicLib { "2.1" } の WGS84 の測地線の長さと組み合わせたものは、日付変更線をまたぐ二つを含む { "8" } 本の合成経路について、経路の曝露と一致します：総延長は { "0.6" }% 以内（最大の差 { "0.49" }%、球と楕円体の違い）、各セルの状態の長さは { "0.6" }% に一区間あたり { "125" } m を加えた範囲内（最大でその許容差の { "21" }%）。({ "5" }) shapely { "2.2.0" } の contains() と、pyproj の方位等距離図法による海岸線までの距離は、湖をもつ一つを含む四つの合成の島の周りの { "992" } 個の格子中心点について、{ "2000" } m の内陸マスクと一致します（不一致は { "0" } 件。バッファから { "20" } m 以内の { "4" } 点は除外し、数えました）。許容差は、比較の前に tests/fixtures/interference_map_ref/PREREGISTRATION.md に固定し、その後は変更していません。最初の実行で見つかった合成入力の二つの欠陥は、そこに記録されています。確認していない内容：Kshana は生の Mode S フレームや AIVDM センテンスをデコードしないため、これが確認するのはすでにデコードされた値の読み取りであり、デコーダーではありません。コード { "1" }、{ "2" }、{ "4" } についてのオラクルの NIC の包含半径は DO-260B（{ "20" }、{ "8" }、{ "2" } NM）と異なるため、数値で比較するのはコード { "5" } から { "11" } のみです。({ "0" }, { "0" }) の位置の規則、高度の下限、ソース種別のフィルター、識別子のハッシュ化、手法のしきい値と統計量、セルサイズの選択は Kshana 独自のもので、何とも照合していません。経路の比較は、緯度と経度で直進する同じ経路の定義を両側で用いるため、確認するのは長さとセルの割り当てであり、この経路が船舶や航空機にとって正しいかどうかではありません。フラグの付いたセルが干渉であることを示すものは、ここにはありません。入力は合成です。オラクルのフィクスチャは scripts/gen_interference_map_ref.py が書きます（pyModeS は GPL-3.0 で、そのオフラインスクリプトでのみ使用します。CI に Python は不要です）。

seg-57ace69bdf1a = 信頼性テレメトリのワイヤーフォーマット：Prometheus のテキスト形式と OpenTelemetry の OTLP/HTTP JSON

seg-654126a9d073 = GNSS の信頼性（スコア、区分、理由、ゲート、要求に応じて位置）を、/metrics で提供する Prometheus のテキスト形式として、および OTLP/HTTP JSON のメトリクスとして出力し、理由ラベルのカーディナリティには上限を設けています。

seg-b037c999443b = 信頼性テレメトリの SIEM イベント：syslog 上の Common Event Format（CEF）

seg-ffd8d7062055 = 区分の変化（またはエポックごと）のイベントを、UDP または TCP 上の RFC { "5424" } エンベロープ内の Common Event Format のペイロードとして出力します。フィールドのマッピングと CEF のエスケープは文書化しています。

seg-59fd23d6607e = 外部で確認した内容（範囲を限定して記述）：独立した二つのオープンソースのパーサー（オラクル：pycef { "1.11" }（PyPI、MIT）、Logstash の CEF コーデック（Logstash { "8.15.3" } の logstash-codec-cef { "6.2.7" }））に対して、このクレートが書いた CEF 行のコーパス（後述の修正 { "4" } の前は { "157" } 行、その後は { "170" } 行、修正 { "5" } の後は { "176" } 行）を用いました：コミット済みの 84 行の合成の信頼ストリームのすべての区分の変化とすべてのエポック、さらにホスト、理由、時刻ラベル、ゲート名に、等号、バックスラッシュ、バックスラッシュと等号、パイプ、改行、キャリッジリターン、タブ、連続するスペース、マルチバイト文字とアストラル文字、キーに似た文字列を含めた敵対的なテキスト、極端なスコアとオフセット、直前の区分がある場合とない場合のすべての区分です。pycef は、ヘッダーにエスケープが不要な行（修正 { "4" } の前は { "153" }、その後は { "166" }、修正 { "5" } の後は { "172" }）を解析し、CEF 仕様のアンエスケープ規則（pycef は適用せず、scripts/gen_cef_ref.py が適用）の後で、ヘッダーのフィールド、重大度、拡張キーの正確な集合、すべての値（数値は f64 の等価性で比較）を厳密に復元します。自らアンエスケープする Logstash コーデックは、すべての行を解析し（{ "157" }、次に { "170" }、次に { "176" }）、同じ基準を満たし、さらに、pycef のヘッダーパターンでは読めない、エスケープが必要な四つのヘッダーフィールド（バージョン文字列内のパイプ、バックスラッシュ、等号）も復元するため、ヘッダーのエスケープは Logstash コーデックのみに依拠しています。比較の基準は、どちらのパーサーも実行する前に、コミット { "5172e579" }（pycef）と 0a7598aa（Logstash）に登録し、どちらも最初の比較で満たしました。五件の修正を開示します。修正 ({ "1" }) から ({ "3" }) は、比較の規則も期待値も変えていません：({ "1" }) コーパスのサイズのアサーションを、区分の変化 { "5" } 件から { "4" } 件に訂正（数え間違いで、ストリームには { "4" } 件）、({ "2" }) Logstash の実行環境のパイプラインの区切り文字の配線を、最初の試行でイベントが生成されなかった後に修正、({ "3" }) 信頼スコアとエポックオフセットを、CEF の整数フィールド cn1 と cn2 から浮動小数点フィールド cfp1 と cfp2 に移動（このリリースで行ったワイヤーフォーマットの変更で、その後コーパスを再生成し、両方のオラクルを基準を変えずに再実行して、再び満たしました）。修正 ({ "4" })、{ "0.36" } は、コーパスと期待されるキーの集合を拡張し、どちらのパーサーも新しい行で実行する前に d6331429 に登録しました：スキーマ { "1.3" } の入力は、衛星のジオメトリをカスタムフィールドの cs6（ラベル geometry：ステータス、次に「;」と減点クラス）、cfp3（geometryHdop）、cfp4（geometryPdop）に加え、{ "13" } 件のジオメトリのケース（コーパスは { "170" } 行に）と三つの新しいキーを追加します。どちらも、それ以外は変更なしで最初の比較で基準を満たしました（pycef は { "170" } 行中 { "166" } 行を解析し、{ "4" } 件の tier { "2" } のヘッダーのケースは従来どおり、Logstash は { "170" } 行中 { "170" } 行）。修正 ({ "5" })、{ "0.36" } は、{ "6" } 件のジオメトリラベルのケースを追加し（コーパスは { "176" } 行に）、どちらのパーサーもそれらで実行する前に 9a8e4fa9 に登録しました：ジオメトリラベルをもつ入力では、cs6 に第三のフィールド（「;」とラベル）が加わり、cn1（geometryUsedSatellites）に使用した衛星数が入ります。Logstash コーデックのマッピング表を先に読みました（flexString フィールドがないため、flexString1 ではなく cs6 を使用）。どちらも最初の比較で基準を満たし（pycef は { "176" } 行中 { "172" } 行、Logstash は { "176" } 行中 { "176" } 行）、以前の参照エントリはすべて変更なしで再現されました。確認していない内容：どちらのパーサーも cfp の値の型チェックは行わず（どちらもテキストとして保持）、そのため浮動小数点フィールドの使用は、オラクルではなく CEF の辞書に基づいています。ベンダーの SIEM は実行していません。拡張キー名とそのマッピングはこのクレートの選択であり、パーサーが示すのは、それらが書いたとおりに読み戻されることのみです。RFC { "5424" } のエンベロープ、配信、タイムアウト、再接続は対象外です。pycef は { "2020" } 年が最後のリリースである小さなパーサーであり、Logstash コーデックの方がより実質的なオラクルです。

seg-51640405c9b7 = 信頼性テレメトリの SIEM イベント：syslog 上の Log Event Extended Format（LEEF）

seg-1b3245506847 = 区分の変化（またはエポックごと）のイベントを、UDP または TCP 上の RFC { "5424" } エンベロープ内の Log Event Extended Format { "2.0" } のペイロードとして出力します。フィールドのマッピングは文書化しています。

seg-563ccb0adbe5 = 確認した内容：このクレート自身による、文書化した LEEF のフィールドマッピングと RFC { "5424" } のエンベロープのフィールドについての、厳密な文字列のテスト。保守されているオープンソースの LEEF パーサーは存在しない（Python パッケージインデックスの検索では見つからなかった）ため、この形式は、同じ作者が読んだその仕様自体に対して確認したものであり、外部のオラクルに対するものではありません。確認していない内容：LEEF のペイロードがいずれかのベンダーのパーサーや SIEM に受け付けられるかどうか、文書化したもの以外のエスケープ規則、実際の syslog コレクターの動作。

seg-96a95b89faa5 = エビデンスパックのインテグリティ：署名、ハッシュチェーン、検証手順

seg-943a853d8a4a = GNSS の信頼イベントの、署名付きでハッシュチェーン化されたエビデンスパック：すべてのファイルに対する SHA-256 とマニフェストにわたるチェーン、マニフェストのバイト列そのものに対する Ed25519 署名、そしてあらゆる失敗を名前で示す検証器（変更、削除、名前変更、入れ替え、追加されたファイル、並べ替えまたは編集されたマニフェスト、鍵なしで再ハッシュされたマニフェスト、再署名されたパック、誤った固定鍵、そして除去、置換、ゴミ、または別の文書に対するタイムスタンプトークン）。

seg-0699ef2074fd = 外部で確認した内容（範囲を限定して記述）：({ "1" }) パックが署名と厳格な検証に使う Ed25519 の関数（evidence::bundle::sign_detached、evidence::verify::verify_detached）は、RFC { "8032" } section { "7.1" } のテストベクトル { "1" }、{ "2" }、{ "3" }、{ "1024" } バイトの公開鍵と署名をバイト単位で再現し、それらを受け入れ、ベクトル { "1" } のすべての反転ビットと他のベクトルの七番目ごとのビット、および非正準の S+L 署名を拒否します。ベクトルは RFC のテキストから解析し、scripts/gen_ed25519_rfc8032_ref.py で二つの独立した実装（cryptography/OpenSSL と PyNaCl/libsodium）で再現しています。({ "2" }) すべてのパックのハッシュとチェーンの基になるハッシュ evidence::bundle::sha256_hex は、FIPS 180-4 の SHA-256 の例（abc、448 ビットのメッセージ、百万個の a）、空のメッセージ、パディング境界をまたぐ { "0" } から { "130" } バイトの段階での hashlib のダイジェストを、厳密に再現します。({ "3" }) docs/EVIDENCE-PACKS.md のみから Python で書いた検証器（scripts/evidence_verify_cleanroom.py：hashlib と cryptography。作者は Rust のコードを読んでいません）は、{ "71" } 個の合成の無傷および改ざんされたパックについて、判定、ファイル名付きの失敗の集合、署名の判定、ファイルから再計算したチェーンの先頭とマニフェストが記録するものについて、Rust の検証器と厳密に一致します。最初の実行では { "71" } 件中 { "64" } 件が一致し、不一致は、仕様の曖昧さ一つ（読めないマニフェストに対する固定鍵の確認）、オラクルのインターフェースの逸脱一つ、構築が不完全なケース一つでした。仕様の文を明確にし、オラクルをテキストから再実装し、ケースを完成させ、許容差も期待値も変えていません（コミット d54e14c6 に記録）。確認していない内容：クリーンルームの検証器は、別の作者による独立した実装であって第三者の機関ではなく、仕様の選択を共有しているため、裏付けるのはこの実装の規則に対する適合であり、規則そのものではありません。ベクトルが確認するのはプリミティブであり、パック形式の設計ではありません。この行では、RFC { "3161" } のトークンはメッセージインプリントのみ読み取り、テスト用のトークンは合成で署名されていません。認証局の署名とチェーンは、別の行「RFC { "3161" } タイムスタンプトークンの署名とチェーンの検証」で、オプトイン（<c1/>）で検証します。改ざんのケースは合成です。ここには、いかなるパックに対する法的見解も証明もありません。

seg-c15736afcbc9 = RFC { "3161" } タイムスタンプトークンの署名とチェーンの検証

seg-cd64bbf39459 = evidence::tsa::verify_token と、パックの timestamp.tsr に対するオプトインの <c1/>：RFC { "3161" } の TimeStampResp または裸の TimeStampToken（TSTInfo に対する CMS SignedData）を、信頼するアンカーに対してオフラインで、<c2/> が確認するのと同じ方法で確認します。署名属性のコンテンツタイプと TSTInfo に対するメッセージダイジェスト、署名属性に対する署名（RSA PKCS#1 v1.5、RSASSA-PSS、ECDSA P-256 と P-384。RSA の公開鍵演算は crypto-bigint）、トークンおよび呼び出し側の信頼されない証明書の中から見つかる、署名者の証明書を指す ESS signing-certificate v1（SHA-1）または v2 のハッシュ、署名者のクリティカルで唯一の timeStamping の拡張鍵用途、各証明書の署名、CA ステータス、鍵用途を伴う信頼する自己発行のアンカーまでのチェーン、そしてトークンの genTime で有効なすべての証明書、そしてデータに対するメッセージインプリントです。確認していないもの：失効（CRL、OCSP）、名前とポリシーの制約、ナンス

seg-d305c442506d = OpenSSL { "3.0.13" }（<c1/>、および RSA-PSS のトークンについては TSTInfo のインプリントに加えた <c2/>）を、tests/fixtures/evidence_tsa/run_openssl.sh が cases.tsv の { "27" } ケースで実行しました：SHA-256 と SHA-512 の RSA PKCS#1 v1.5 と ESS v1 と v2、P-256 の中間局の上の ECDSA P-384 のルートと P-256 と P-384 の TSA、RSA-PSS、署名者の証明書がないトークンと、それを提供した場合、CAdES で署名されたトークン、反転した署名バイト（三つのアルゴリズム）、変更された TSTInfo（二つ）、反転した中間局の署名、ESS の双子の証明書、誤ったアンカー（四つ）、期限切れの TSA 証明書、クリティカルでない拡張鍵用途と誤った拡張鍵用途、そして誤ったデータ（三つ）。tests/fixtures/evidence_tsa/PREREGISTRATION.md に事前登録済み（単独でコミット、30ad70b2、検証器が存在する前。OpenSSL の判定はその後に再実行し、バイト単位で同一）。最初の実行：すべての { "27" } 件の判定が一致し（B1）、すべての genTime が秒まで一致しました（B2）。範囲を限定して記述：自己生成のテスト用証明書とトークンで、それを判定するのと同じ OpenSSL が作ったもの。OpenSSL は独立した実装であり、タイムスタンプ機関ではありません。公的機関のトークンは同梱していません（freetsa.org はライセンスを明示していません）。ここには、いかなる実際のタイムスタンプに対する証明もありません

seg-c04042b0270a = JammerTest { "2024" } データセットで較正した受信機の信頼性の干渉しきい値

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset：公開の JammerTest { "2024" } データセット（Zenodo { "15911589" }、GPL-3.0-or-later、実行時に取得し、同梱はしません）に対する、C/N0 低下、AGC、ジャミングインジケーターの各モニターの事前登録した較正。フォルダごとに、mon_rf.csv と rinex.csv から { "1" } 秒のタイムラインを作り、モニターを一回実行し、較正後の各エポックを、フォルダの attack_log（CEST から UTC にシフトし、{ "60" } 秒のガード）に基づいてクリーンまたはジャミングとラベル付けし、すべてのしきい値を固定のグリッド上で掃引し、プールしたクリーンの誤警報確率が { "0.01" } 以下となる最小のしきい値を選択し、フォルダ一つを除外した場合のホールドアウトの件数を求めます。UBX リーダーの相互チェックもあります。選択結果はオプトインのプロファイル [monitors] profile = "jammertest-2024-calibrated"（cn0_drop_db { "1.5" }、agc_k_sigma { "3.5" }、jam_ind_threshold { "29" }）としてのみ提供され、既定の規則と、それを使わないすべての出力は変更ありません

seg-3ccd1b09ad09 = データセットが公表しているイベントログ（attack_log の窓）をイベントの真値として、事前登録 xval/jammertest-trust/PREREGISTRATION.md（単独でコミット、0fa012b、ハーネスの実行前）に基づいて用いました。最初で唯一の実行（xval/jammertest-trust/RESULTS.md）：{ "24" } フォルダのうち { "14" } が評価可能（ジャミングありは { "7" }）、クリーンが { "3,502" }、ジャミングが { "9,560" } エポックです。ホールドアウトのクリーンの誤警報確率：cn0_drop_db は { "0.0231" }（81/3502）で、基準 { "0.02" } に対して FAIL。agc_k_sigma は { "0.0003" } で合格。jam_ind_threshold は { "0.0094" } で合格。三つの和集合：誤警報 { "0.0328" }、検出 { "0.807" } で、基準はそれぞれ { "0.05" } と { "0.50" } に対して合格。登録した規則により、この行は MODELLED です（基準が一つ不合格）。限定：受信機の種類は一つ（u-blox ZED-F9P）、イベントは一つ、真値としてスケジュールされた一分間のスロット（検出は下限で、クリーンとはログに記録された窓の外を意味する）。較正は CSV ログで行っており、UBX リーダーでは二つのフォルダで誤警報が増えます。海事の信頼スコアの区分は較正していません

seg-c3c260b7063e = テスト

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel：単一周回の弾道二インパルス遷移について、Type I または Type II の範囲内で、出発 C3 または到着 V-infinity を最小化する出発日と到着日を、連続的な最適解として求めます（両方のウィンドウに対する 2 日刻みのグリッドの後、2 次元の Nelder-Mead 法）。DE440 SPK の太陽中心状態を用います。一区間のための日付最適化ツールであり、ミッション設計ではありません。打上げ機、駐機軌道、深宇宙マヌーバ、複数周回のオプションはありません

seg-821b9c01b56e = 衛星クロックで読み取った時刻における GLONASS 放送衛星クロックバイアス -tau_n + gamma_n (t - t_b)（glonass::GlonassEphemeris::sv_clock_bias_s。クロックバイアスで補正したオフセットを 二回の不動点反復で求める）と、放送状態ベクトルの PZ-90 地球固定位置（基準エポックの ±15 分以内で GLONASS ICD の運動方程式を RK4 で伝搬、GlonassEphemeris::position_ecef）を、実際の RINEX { "3" } の GLONASS 航法レコードから求めます。PZ-90.11 から ITRF への変換は適用していません（{ "2014" } 年以降は両者がセンチメートル級で一致し、RTKLIB も変換を適用しません）。シナリオ出力には接続されていません：ライブラリ関数です

seg-3801e9b32309 = 内部整合性のみ：二分法で求めたしきい値到達時間は、クロックの支配的な雑音タイプの閉形式の逆関数と照合し、自由走行のクロック項は、バジェット自身のクロック項と照合しています。クロッククラスは公表されている 一日あたりの仕様に基づきます（それぞれ独自の行があります）。LTC レートはここでは再導出せず、独自の VALIDATED の行（月座標時）を保っています。ステア残差はILLUSTRATIVEなものであり、実現残差はバジェット上の割り当てで、熱モデルは含みません。{ "2024" } 年6月の ICG WG-B の月 PNT 資料に記載されたナノ秒級の目標は、出典の記述として引用しているだけで、主張としては採用しておらず、ここには実在のいかなる地上局クロックについての記述もありません

seg-09773b73d785 = 同じ NAIF ファイルに対する、独立した二つのカーネルリーダー：NAIF SPICE Toolkit N0067（spiceypy { "8.2.0" } 経由の CSPICE、MIT、spkezr と pxform）と ANISE { "0.10.6" }（Nyx Space、MPL-2.0、Almanac.translate と Almanac.rotate）を、de440s.bsp と moon_pa_de440_200625.bpc に対して別々のプログラムとして実行しました。フィクスチャーやオラクルの値が存在する前に事前登録（abcd9133）しています。グリッドのシードは、そのコミットのハッシュの最初の { "16" } 個の十六進数字なので、{ "200" } 個のエポックも天体の組も、結果を見ながら選ぶことはできませんでした。各エポックには、地球に対する月と太陽も含みます。合格基準は、倍精度のチェビシェフ評価（係数は最大 { "15" } 個、評価ごとに n^{ "2" } u = { "2.5e-14" }、二回の評価、片側あたり最大二ホップ）から事前に定めました：位置は { "1e-13" } R + { "1e-5" } m、速度は { "1e-13" } V + { "1e-10" } m/s（R と V は、最下位の共通祖先に対する大きいほうの大きさ）、回転要素は { "1e-13" } W + { "1e-15" }（W は対象レコードの係数和）で、ANISE にはナノ秒エポック用に相対運動として { "2" } ns を加えます。結果：{ "600" } 個の状態と { "200" } 個の回転のすべてが、両方のオラクルに対して合格基準の内側に入りました（切り出したカーネルと完全なカーネルの両方）。最悪値は、基準に対して位置が { "6.0e-3" }、速度が { "5.9e-3" }、回転が { "3.7e-3" } です。ミューテーション：各レコードを -s で評価すると、{ "3597" } 件の比較が失敗します。開示事項：SPICE に対する以前の 25 エポックの確認（{ "4.6e-5" } m、tests/naif_kernel_reader_check.rs）は、この行より前に見ており、この行の証拠ではありません。フィクスチャー生成器の最初の実行は、値を出す前に空のグリッド区間で中断したため、修正しました。両側とも DE440 を読むため、一致が検証するのはリーダーであって、エフェメリスではありません

seg-28780d07c4a7 = h2、k2、l2 および物理秤動振幅のフィッシャー情報を、次の観測から求めます：レーザー測距（動径方向と水平方向の潮汐変位、反射器の回転）、周回機の追跡（視線方向に沿って積分した 2 次の k2 加速度、トレンドは除去）、地表重力計（重力係数 { "1" } + h2 - { "1.5" } k2）、地表クロック（相対レート ({ "1" } + k2 - h2) W2/c2、月時間の定数に結び付けたもの）。h2 と l2 の公称値は線形化点です。この研究が示すのは、何が何に対して敏感かであり、数値が何であるかではありません。

seg-32fcf6956dac = 外部で確認している範囲（限定して述べます）：（{ "1" }）モニターが読むすべてのフィールドのデコードを、{ "8" } 件の合成ログ（{ "1,086" } エポック）について pynmea2 { "1.19.0" }（MIT）と照合し、フィールドの単位で { "1e-9" } 以内で一致しました（緯度と経度、高度、ジオイド分離、HDOP、速度、針路、方位、信号対雑音比。整数と日付は完全一致。時刻は { "1e-6" } 秒以内）。最大の差は倍精度の最下位桁の水準です。（{ "2" }）二つの測位解の間の東・北オフセットを、距離と方位として、geographiclib { "2.1" }（MIT）の WGS84 測地線と照合しました。測位解の組 { "223" } 件、基線は最大 { "2" } km、緯度は -45 から { "70" } 度、日付変更線をまたぐものを含み、{ "0.01" } m と { "0.001" } 度以内で一致しました（方位は測地線の平均方位角、つまり弦の方向と照合）。（{ "3" }）旋回と位置ステップを含む { "400" } 秒の合成航海のうち、採点した { "341" } エポックにおけるモニターの入力統計を、距離と方位角には geographiclib、デコードには pynmea2、中央値と標準偏差には numpy を使う Python での再計算と照合しました：推定速度は { "0.005" } m/s、推測航法の残差は { "0.02" } m、加速度は { "5e-4" } m/s^{ "2" }、旋回レートは { "1e-3" } deg/s、残差の中央値と信号対雑音比のばらつきおよび上昇は { "1e-6" } 以内です。確認していない範囲：モニターのウィンドウ長、許容量、しきい値は、このプロジェクト独自の規則です。Python は同じ文書からそれらを再現するので、一致が裏付けるのは演算の実装であって、規則そのものではありません。THS センテンスには pynmea2 のクラスがなく、ROT センテンスは読み込まないため、どちらも対象外です。NMEA のトーカーと衛星番号から RINEX 形式の衛星 ID への対応表は、このプロジェクト独自のものです（比較したのは番号、トーカー、値のみ）。タイムステップ、ホストクロック、認証状態の入力にはオラクルがありません。すべてのデータは receiver_trust::synth による合成テキストであり、ここにある何ものも測定ではなく、実際の干渉に対して各モニターがどう動作するかについては何も述べていません。方位：測地線の平均方位角と比較しました。測位解 { "1" } での前方方位角との事前登録済みの比較は、定義上の不一致が原因で（演算の誤りではなく）{ "0.001" } 度では不合格でした（{ "223" } 組中 { "77" } 組、最悪 { "8.3e-3" } 度）。修正は最初の実行の後に行い、両方の結果を記録しています（前方方位角との比較は、{ "0.01" } 度の記述的な、事前登録ではない上限として、テストに残してあります）。開示事項：最初の実行で、入力が十分に作用していなかったことが分かりました（加速度と旋回レートがすべてのエポックでゼロに丸められ、日付変更線をまたぐ軌跡が実際にはまたいでいませんでした）。また、合成データ生成器のバグ（経度の折り返しなし）と、方位について、登録したオラクルの量（最初の測位解での測地線の前方方位角）が弦の方向とは子午線収束角の約半分だけ異なること（{ "223" } 組中 { "77" } 組が { "0.001" } 度の外、最悪 { "8.3e-3" }）も見つかりました。入力は修正し、方位は同じ許容差で平均方位角と比較しました（事前登録の修正 { "1" } から { "3" }。結果を見た後に行ったため、盲検ではありません）。針路と方位の比較は円環的にしました（{ "360" } 度と { "0" } 度は同じ針路、修正 { "5" }）。ミューテーション：東オフセットに { "1e-4" } のスケーリングをかけると、測地線の比較が失敗します。

seg-9cbde962155c = 外部で確認している範囲（限定して述べます）：84 行の合成ストリームに対する当方の Prometheus テキスト形式の出力（引用符、バックスラッシュ、改行、非 ASCII テキストを含むラベル値、{ "64" } 個の理由の系列と「other」にまとめた系列、ゲートと位置のゲージ）は、prometheus_client { "0.26.0" } のテキストパーサーに受理され、パーサーが読み取るメトリクスファミリー、型、ヘルプテキスト、ラベルセット、値は、レジストリの状態と完全に一致します（値は f64 の等価比較）。同じレジストリに対する当方の OTLP/HTTP JSON は、protobuf { "7.36.2" } の json_format.Parse(ignore_unknown_fields=False) で opentelemetry-proto { "1.45.1" } の ExportMetricsServiceRequest として解析でき、すべてのメトリクス名、説明、単位、種別、単調性、集計テンポラリティ、属性、値、開始時刻、時刻がレジストリの状態と完全に一致します。どちらのパーサーも、未知のフィールド、型の誤った値、不正な行を拒否することを確認しています（scripts/gen_telemetry_formats_ref.py）。スキーマ { "1.3" }（{ "0.36" }）は、どのツールが読む前にも事前登録（fb226057）しています。64 行の合成スキーマ 1.3 ストリーム（ジオメトリの状態、DOP、ラベル、信号喪失について、存在、null、不在、不明の場合を含み、控除クラスと解析できない行もある）について、同じ二つのパーサーが、ジオメトリの系列（Prometheus の kshana_trust_geometry*、OTLP の kshana.geometry.*）と kshana_trust_reason_active の class ラベルを、レジストリが示すとおりに読み取りました（{ "24" } ファミリーと { "54" } サンプル、{ "12" } メトリクスと { "31" } ポイント）。promtool { "3.5.0" } check metrics は lint の問題なしで { "0" } を返して終了し、OpenTelemetry Collector contrib { "0.135.0" } は OTLP/HTTP JSON を受理し（ステータス { "200" }、拒否なし）、そのファイルエクスポーターはリクエストを変更せずに記録します（xval/telemetry-1.3、データゲート付き：リリースのターボールは固定した SHA-256 で取得し、出力はコミット済み）。確認していない範囲：HTTP エンドポイント、配信、タイムアウト、再接続はオラクルによる確認を行っておらず、Collector の prometheus レシーバーも同様です。レジストリはアクセサー経由で読むため、レジストリ状態自体の不具合は検出されません。OTLP の「コミット済み出力が最新である」という確認は otlp フィーチャーがあるときだけ実行されます。メトリクス名と、運用センターにとっての有用性は検証していません。CEF と LEEF は対象外です（次の行を参照）。

seg-65a8361b4a22 = Jammertest の採点：公表されているテスト計画に対し、予定されたテストごとに受信機ログを採点（検出レイテンシ、見逃した警報、誤警報、回復までの時間）

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" }（kshana jammertest import|score）：NPRA のテストカタログと送信計画（MIT、固定した SHA-256 で取得し、同梱はしない）を、カタログ ID を保ったまま予定された真値として読み込みます。receiver-trust の実行をテストごとに採点し（最初の警報から計画上の開始時刻を引いた値、許容差に対する検出／遅延／見逃しの判定、最初の警報なしの区間までの時間、すべてのスロットとそのガード区間の外での警報）、採点表を含む署名付きエビデンスパックを出力します。スケジュールは計画上のスロットであり、実際の放送時刻の記録ではありません

seg-49b912adb7a9 = 計画の、テストエリアごとのスロット数（{ "76" }、{ "77" }、{ "45" } スロットで、そのうち送信するのは { "61" }、{ "63" }、{ "32" }）は、同じ JSON に対するスクリプトで独立に数えました。{ "2024" } のデータセットの attack_log のウィンドウをイベントの真値とし、xval/jammertest-score/PREREGISTRATION.md（単独でコミット、c2e6d3b、採点器の実行前）に基づきます。最初で唯一の実行（xval/jammertest-score/RESULTS.md）：登録した最小データ規則は FAILED でした（採点可能なジャミングウィンドウは、{ "12" } 個の UBX フォルダーのうち { "4" } 個からの { "4" } 件で、最小要件は { "2" } フォルダーからの { "10" } ウィンドウ。{ "5" } フォルダーはベースライン規則で除外、{ "3" } 個の UBX ログは GPS 週内時刻しか持たない）ため、合格基準 B1 から B4 は評価できません。何も緩めず、再実行もしていません。v2（xval/jammertest-score/PREREGISTRATION-v2.md、単独でコミット、データの扱いのみ：GPS 時刻のみのログは日付から配置、{ "12" } 個の CSV のみのフォルダー、移動ローバーには移動プラットフォームのセッション。合格基準と最小データ規則は同じ）：{ "24" } フォルダー中 { "14" } を採用しましたが、採点可能なジャミングウィンドウは { "7" } 件で、最小データ規則は再び不合格となり、評価できる合格基準はありません（RESULTS-v2.md）。予定された真値：計画上のスロットは実際の放送の記録ではなく、見逃しは実施されなかったテストの可能性があり、レイテンシは計画上の開始時刻からのもので、クリーンとは計画上のスロットの外を意味します。測定領域のモニターによる検出は、低電力のスプーファーについては何も語りません。受信機の種類は一つです（u-blox ZED-F9P）。{ "2025" } の SimulaMet NMEA データセットは使用していません（ライセンスの記載がなく、購読制のため）

seg-0d227bbcb5f1 = test bench向けエクスポート（kshana bench-export）：地球固定、測地、局所速度の各列、姿勢の各列、NMEA { "0183" } 出力

seg-c6a6e08afadd = モーション CSV の地球固定位置、測地位置、地球固定速度、方位／ピッチ／ロール、UTC の各列と、NMEA の GGA／RMC センテンスを、合成シナリオ（automotive-urban-canyon を含む gnss-ins、jamming、gnss-sim）から書き出します。出力は動きとイベントのみで、信号は書き出さず、シミュレーターや受信機の性能についての主張もしません。

seg-f953ad11fe08 = 外部で確認している範囲（限定して述べます）：pyproj { "3.8.0" }（PROJ { "9.8.1" }）、geographiclib { "2.1" }、pynmea2 { "1.19.0" }、scipy { "1.18.1" } と照合しました。実行は scripts/gen_testbench_ref.py により { "4" } 件の合成シナリオで行い、許容差は最初の比較の前に固定しています（それぞれ書き込み側の丸めの最悪ケース）。すべての行で、地球固定の列は測地列の WGS { "84" } 変換と一致し（最悪 { "1.3e-4" } m、基準 { "3e-4" }）、逆変換とも一致しました（{ "1.3e-9" } 度、基準 { "2e-9" }。高さは { "1.3e-4" } m、基準 { "3e-4" }）。PROJ のトポセントリック演算で北東下に回転した地球固定速度は、エンジンの真の NED 速度と一致します（{ "7.5e-5" } m/s、基準 { "2e-4" }）。方位、ピッチ、ロールは、エンジンの真のクォータニオンから求めた scipy のヨー・ピッチ・ロールと一致します（{ "5.0e-7" } 度、基準 { "1e-6" }）。すべての NMEA センテンスは pynmea2 で正しいチェックサムのまま解析でき、デコードした位置（{ "1.2e-3" } m、基準 { "5e-3" }）、高さ、速度、針路（{ "5.0e-4" } 度、基準 { "1e-3" }）、時刻は、モーションの値と一致します。UTC 列は、独立した日時演算と一致します。確認した CSV と NMEA の正確なバイト列の SHA-256 は固定しています。確認していない範囲：シナリオの真の軌跡そのもの（走行プロファイルとその積分）。規約（方位は車体のヨーであって針路ではなく、automotive-urban-canyon では針路と最大で約 { "77" } 度異なります。GGA の品質、衛星数、HDOP はプレースホルダーです）。実験室のシミュレーターがこれらのファイルを意図どおりに読み取るかどうか。シミュレーターや受信機の性能。オラクルが確認するのは変換とエンコードであり、シナリオの物理ではありません。局所座標系の扱いは、速度の回転と NMEA の速度および針路でのみ確認しています（CSV に局所位置の列はありません）。

seg-ee99388f7b15 = compliance（kshana compliance-report）：Kshana の出力を、公的フレームワークの条項へ番号のみで対応付けたもので、与えられた実行から埋めます。結果がある機能の根拠として数えられるのは、対応付けが挙げる証拠を伴う場合だけであり、空の集合は何も裏付けず、表現は「supports evidence for」です。このレポートは、いずれかのフレームワークが満たされたという所見ではなく、誰かによる格付けや承認でもありません。

seg-8659260fd38e = 参照は、2026-10-10 に読んだ、引用された公開文書のスクリプト抽出による見出しインデックスと照合して確認しました（tests/compliance_references.rs）。確認している範囲：引用された条項、節、段落、見出しの参照 { "49" } 件が引用先の文書に存在し、引用された URL { "7" } 件が記録した日付に解決されました（{ "2" } 件は別経路でも確認）。ネガティブコントロールは失敗します。確認していない範囲：言い換え、対応付け、ギャップのいずれかが正しいかどうか。EN { "16803" } の条項（有料、カタログのテキストのみ）。その後の改訂。インデックスは独立した実装ではありません。

seg-98c360d82d56 = マリン統合：Signal K プラグイン、OpenCPN のゲートストリームとスコアパネル、リファレンスビルド

seg-7af9ce566646 = Signal K サーバーの navigation.gnss.kshana の下に公開される、信頼スコア、バンド、理由、ゲートの状態、受信機が報告した位置（warn、alarm、normal の通知付き、integrations/signalk）。ゲートを通した NMEA ストリーム（信頼が崩壊している間は測位解を無効とし、サイクルごとに PKSHT センテンスを付加）を、ゲート自身または小さなリレーが TCP で OpenCPN に提供し、PKSHT センテンスを読むネイティブの OpenCPN スコアパネル（integrations/opencpn）。そして、ゲートを動かす systemd ユニットとコンテナ（deploy/reference-build）です。これらが出力を表示する場所には、助言用ソフトウェアであり、型式承認を受けた航法装置（IEC { "61108" }、IEC { "61162" }）ではありません。船舶の航行の責任は引き続き運用者にあります。という助言の文言を付けます。

seg-00a0f52f7458 = 確認している範囲（限定して述べます）：これらの統合が、想定している実際のソフトウェアに対して動作すること。証拠は integrations/signalk/evidence/README.md（JSON ファイル付き）と integrations/opencpn/evidence/README.md（スクリーンショットとログ付き）にコミットされており、それぞれ再現用のスクリプトがあります。（{ "1" }）Signal K：固定した signalk-server { "2.33.0" } の npm パッケージにプラグインを読み込み、ループバック専用の非公開ネットワーク名前空間で、合成データを与えて確認しました。サーバー自身の REST と WebSocket のインターフェースに、公開されたパス、スコアのメタデータが現れ、データが止まったときに通知が、なし、warn、alarm、normal（保持時間の後）、再び warn と推移しました。プラグインが実際の kshana を、サーバー自身が受信した NMEA に対して実行すると、通知は warn、次に alarm となり、報告された位置が公開されました。サーバー自身の navigation.position は NMEA プロバイダーが書き込んだもので、プラグインは書き込んでいません。ライブの JSON スキーマ { "1.2" } に対して再実行しました。（{ "2" }）OpenCPN：OpenCPN のプラグイン API ヘッダーと wxWidgets { "3.2.4" } に対してプラグインをビルドし、仮想ディスプレイ上の OpenCPN { "5.8.4" } の Ubuntu { "24.04" } パッケージに読み込みました。OpenCPN はそれを読み込み、初期化を実行し、ゲートを通したストリームの PKSHT センテンスを渡し、パネルは信頼できないバンドで赤になりました。一回のクリーンな実行では、ゲートが測位解を無効とした際に、OpenCPN 自身の自船位置の更新が止まり、測位解インジケーターが下がりました。ゲートの TCP リスナーから直接与えた 二回目の実行では、プラグインへの配信は示されましたが、きれいな前後比較にはなりませんでした。（{ "3" }）リレーのテストは、ゲートを通したストリームの記録済み抜粋を実際の TCP ソケットに流し直し、コンシューマーが受け取るものを確認します（バイト列は変更なし、書き換えたものを含むすべてのセンテンスで正しいチェックサム、GGA と RMC が一致、一サイクルにつき PKSHT が一つで、測位解が無効な場合はゲートのフィールド付き）。エンドツーエンドのスクリプトは、ゲートのリスナーのコンシューマーが、同じゲートが標準出力に書くバイト列とまったく同じものを受け取ることを確認します。（{ "4" }）PKSHT パーサー（JavaScript と C++）は、kshana の出力から記録したセンテンスに対して実行し、誤ったチェックサム、バージョン、{ "0" } から { "100" } の範囲外のスコアを拒否します。（{ "5" }）systemd ユニットは systemd-analyze verify（systemd { "255" }、バイナリはスタブ）で確認し、ExecStart 内のシェル、再起動ポリシー、サンドボックスキーに対するガードも設けています。コンテナのエントリーポイントの引数処理は、スタブのバイナリで確認します。確認していない範囲：これらの統合が表示するどの値にも、外部のオラクルはありません。信頼の値そのものは上の行にあり、統合の実行が示すのは、配管がそれらを運ぶことだけです。この行が VALIDATED ではなく MODELLED なのはそのためです（docs/VALIDATION.md）。実際の船舶、受信機、長時間の実行、いずれかのホストの別バージョン、他のオペレーティングシステム、他のデスクトップは使用していません。すべてのデータは合成テキストであり、ここにある何ものも測定ではありません。実際の Signal K クライアントによる通知の音と視覚的な扱い、OpenCPN のツールバーボタン、設定、古くなった状態、OpenCPN プラグインマネージャー向けのパッケージングは実行していません。systemd のサンドボックスキーは構文のみを確認し、稼働中の systemd では実行しておらず、コンテナイメージのビルドとそのヘルスチェックには、ここにコミットされた証拠がありません。検出や誤警報の数値は主張していません。助言用ソフトウェアであり、型式承認を受けた航法装置（IEC { "61108" }、IEC { "61162" }）ではありません。船舶の航行の責任は引き続き運用者にあります。

seg-89ab9ef155eb = BOC({ "1,1" }) 追尾：DLL のスケーリングとバンプジャンプによるアンビギュイティ解決（オプトイン）

seg-ef24be9b5917 = iq::track::LoopConfig の boc フィールド（オプトイン、デフォルトは None）：三つの DLL ディスクリミネーターを、サイン BOC({ "1,1" }) のメインピーク上でコード誤差をチップ単位で単位傾きとして読み取れるように再スケーリングし、サブキャリアの半周期（{ "0.5" } チップ）離れた very-early と very-late の相関器にバンプジャンプモニターを置いて、アップ／ダウンカウンターが N（デフォルトは { "8" }）に達したときにコード NCO をメインピークの方向へジャンプさせます。このオプションを使わない場合、すべての出力は変わりません。

seg-416ce4dfc6f5 = 注入した真値および閉形式に対する内部整合性で、合格基準は 6b68f6cc（docs/design/evidence/boc-bump-jump/）で事前登録しています。iq::scene が生成した BeiDou B1C データ信号（PRN { "19" }、{ "5" } MS/s）について：オプションをオフにすると、サイドピークからの開始は、予測される ±({ "0.5" } + d/4) チップで誤ロックしたままになります（測定値は ±{ "0.549" }）。オンにすると、{ "0.08" } 秒でメインピークへ一回ジャンプし、後半ウィンドウの RMS は { "45" } dB-Hz で { "0.0008" } チップ、{ "35" } dB-Hz で { "0.0048" } チップとなります。{ "35" }、{ "40" }、{ "45" } dB-Hz のいずれでも、{ "4" } 秒の間、メインピークからのジャンプはありません。スケーリング後の EMLP の傾きは、サンプリングした信号で { "0.94" } から { "0.99" } です（スケーリングなしでは { "3.6" } から { "3.8" }）。バンプジャンプ検出器のみを、正確な BOC({ "1,1" }) 雑音共分散を持つ相関器の三つ組に対して { "25" } から { "45" } dB-Hz で { "100 000" } 回更新して試した結果、誤ったジャンプはなく、{ "35" } dB-Hz ではサイドピークからの開始 { "1000" } 件中 { "1000" } 件を検出しました。NOT MET（所見 F1）：スケーリングについて事前登録した単体テストのグリッドには、ディスクリミネーターの線形範囲外のオフセットが含まれ、そこではスケーリング後の読みがオフセットを最大 { "48" } % 外します。確認していない範囲：フィールドの IQ、帯域制限されたフロントエンド、合成 MBOC/QMBOC レプリカ、外部の受信機。

seg-2c32955cbfb3 = IQ 電離圏シンチレーションチャネル（Cornell モデル）を、実測の { "50" } Hz の GPS L1 シンチレーションと照合

seg-2fdcb373ab25 = iq::channel::scint、Cornell シンチレーションモデル（Rice 強度、二次のバターワーススペクトル、位相 arg z）を、実測ウィンドウの S4 と強度の相関時間で駆動し、この二つの入力を超えて生成するものについて比較します。realdata::scint50 が実測ログを読み込み、トレンドを除去して比較を実行します。

seg-bdc9fe963c5c = 実測データ。合格基準は b6ccb499（xval/scint-malindi/）で事前登録：Zenodo レコード { "16941224" }（INGV、マリンディ、{ "2023" } 年3月 { "18" } 日、GPS PRN { "26" }、{ "50" } Hz の強度と搬送波位相、CC BY { "4.0" }、SHA-256 を確認）。条件を満たす { "60" } 秒のウィンドウが { "22" } 個（N1 を満たした）。MET：強度の分布（コルモゴロフ・スミルノフの D は { "0.0415" }、合格基準は { "0.05" }）と、S4 に結び付いた位相シンチレーション（実測／モデルの sigma-phi の中央値は { "0.779" }、合格基準は 2/3 から 3/2）。NOT MET（所見 F1）：モデルの深いフェージングの割合は実測の { "2.38" } 倍（合格基準は { "0.5" } から { "2" }）、平均フェージング長は { "3.51" } 倍の長さ（合格基準は 2/3 から 3/2）。所見 F2：登録した処理はモデルのラップされた位相を読み取っており、これは自己チェックで判明しました。位相をアンラップして事後的に繰り返した B3 は { "0.804" } となります。確認していない範囲：他の夜、観測局、緯度、信号。モデルの受信機雑音。この行は MODELLED のままです。

seg-160507ac3702 = IQ 捕捉におけるセル平均 CFAR オプション

seg-7c0a1adc9ae6 = iq::acq::ca_cfar と ca_cfar_cells（オプトイン）：捕捉グリッドのセルを、そのドップラー行の参照セルの平均と比較します（ガードとストライドのラグ、周期で折り返し）。係数 alpha は、M 個の非コヒーレントブロックに対する閉形式の CA-CFAR 誤警報確率から設定します（ca_cfar_pfa、ca_cfar_alpha）。サンプル電力検出器は引き続きデフォルトで、既存の出力はすべて変わりません。

seg-ba35daac2aed = 閉形式。合格基準は 3724aefa（docs/design/evidence/acq-cfar/）で事前登録しています。Gamma(M) セルに対する CA-CFAR の誤警報確率を、正確なモデルのモンテカルロと照合：{ "18" } 件中 { "18" } 件が二項分布の { "3" } シグマ以内でした。iq::acq の探索（GPS L1 C/A、{ "2.5" } MS/s、各 { "210 000" } セル）のすべてのセルで、設計値 { "1" } % に対し、ガウス雑音では { "0.977" } % と { "0.969" } %、2 ビット量子化雑音では { "1.006" } % と { "0.999" } % でした（M = { "1" } と { "4" }、合格基準は ±{ "20" } %）。入力をスケーリングしても判定は変わりません。NOT MET（所見 F1）：雑音のない 2 ビット信号では、検出とそのセルは正しいものの、ピークの行のピーク以外のセルの { "1.28" } %（合格基準は { "1" } %）が、コードの決定論的な相関サイドローブでしきい値を超えます。確認していない範囲：他の CFAR の変種、二次元ウィンドウ、帯域制限されたフロントエンド、フィールドデータ。

seg-5bd3bf0c22a7 = スペクトルモデル：GLONASS、BeiDou、Galileo E6 の各バンド（オプトイン）

seg-9c16189c63ac = spectrum::default_band は、名前のみで（MORE_BAND_NAMES）、次を解決します：すべての FDMA チャネル K = -7 から { "6" } の GLONASS L1OF と L2OF（BPSK、{ "0.511" } Mchip/s）、BeiDou B1I（BPSK({ "2" })）、B1C（MBOC(6,1,1/11)）、B2a と B3I（BPSK({ "10" })）、Galileo E6（BPSK({ "5" })）。搬送波と最小受信電力はそれぞれのインターフェース管理文書に従います。デフォルトのバンドセットと既存の出力はすべて変わりません。

seg-6d674bc4b40a = 公表されているインターフェース管理文書と閉形式。合格基準は 5806f28b（docs/design/evidence/spectrum-bands/）で事前登録：GLONASS ICD Edition { "5.1" }、BDS-SIS-ICD B1I { "3.0" }、B1C { "1.0" }、B2a { "1.0" }、B3I { "1.0" }、Galileo OS SIS ICD Issue { "2.1" }。MET：すべての搬送波、チップレート、受信電力が転記のとおり（GLONASS は { "28" } チャネル）、BPSK の最初の零点がチップレートにあること、B1C の合成が、その ICD の電力表のとおり MBOC(6,1,1/11) に等しいこと、C/N0 の経路の恒等式、およびバイト単位で同一のスペクトルシナリオ。NOT MET：記載のままでは達成不可能だった単位面積の基準（所見 F1。面積は閉形式の帯域内割合に等しい）と、IQ 層の B1I と B1C の波形のビンごとのモデルエンベロープとの一致（{ "0.5" } dB に対して { "1.26" } dB と { "1.56" } dB、所見 F2。GLONASS は { "0.07" } dB）。Gold 符号と Weil 符号は線スペクトルが不均一なためです。帯域平均では、メインローブは { "0.25" } dB 以内で一致します。確認していない範囲：記録された IQ、他の信号、システム内干渉。

seg-63b7da996265 = BeiDou B1I の主測距コードを、独立した生成器と照合

seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits と b1i：{ "2046" } チップに切り詰めた BDS-SIS-ICD-B1I-3.0 の Gold コードで、PRN { "1" } から { "63" }。IQ 層が生成、捕捉、追尾するものです。

seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" }（タグ { "v0.0.19" }、コミット 1ddd4562）は、同じ ICD の独立したオープンソース実装で、その beidou_b1i_code_gen_int を単体でコンパイルして、{ "63" } 個のコードをすべて生成しました。コミットしているのはそのプログラム出力のみです：tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt、先頭 64 チップと、2046 チップの各コードの SHA-256。この出力は、公開されている BDS-SIS-ICD-B1I-3.0 が定義する BeiDou B1I の PRN コードであり、GNSS-SDR のソースもバイナリもリポジトリには含まれません。合格基準は 911106d1（xval/beidou-b1i-gnss-sdr/）で事前登録：{ "63" } 個すべての PRN の { "2046" } チップすべてが同一で、反転、シフト、ラベルの付け替えがないこと。結果：{ "63" } 件中 { "63" } 件が同一。フィクスチャーは新たにチェックアウトした { "v0.0.19" } から再生成し（ソースファイルの SHA-256 は記録のとおり）、バイト単位で同一です。確認していない範囲：NH20 の副符号、GEO の PRN の一覧、搬送波とチップレート。

seg-b4787b04338e = GPS L1C の測距コードとオーバーレイコードを、IS-GPS-800J に印刷されたチェック列と照合

seg-708967246fd8 = iq::signals::gps::l1c_p_bits、l1c_d_bits、l1c_o_bits：L1CP と L1CD の Weil 測距コード（計算したルジャンドル系列、Weil インデックス、チップ p の前に挿入する拡張系列）と、L1CO の S1 オーバーレイコードで、PRN { "1" } から { "63" }。

seg-3f4bbdd3666b = IS-GPS-800J（01-AUG-2022、配布区分 A）が生成器パラメーターの横に印刷しているチェック列：Table 3.2-2 は L1CP と L1CD のすべてのコードの先頭と末尾の { "24" } チップ、Table 3.2-3 は L1CO のすべてのコードの先頭と末尾の { "11" } ビット、Table 6.2-1 は長さ 10223 のルジャンドル系列で、scripts/extract_is_gps_800_tables.py が PDF（SHA-256 c4aad710...）から転記しています。合格基準は fe372e26（docs/design/evidence/l1c-codes/）で事前登録：{ "252" } 列中 { "252" } 列、{ "63" } オーバーレイ中 { "63" } 件、ルジャンドルビット { "10 223" } 個中 { "10 223" } 個が同一で、抽出の --check は合格し、ネガティブコントロールはラベルの付け替え、反転、シフトしたコードで失敗します。確認していない範囲：生成器パラメーターそのもの（同じ表に由来する）、印刷された列の間のチップ、TMBOC サブキャリアのパターン、L1CO の S2 コード。

seg-5cba09089e09 = LunaNet AFS-I と AFS-Q の主コードを、LSIS-AFS V1.0 に印刷されたチェック列と照合

seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits と afs_q_primary_bits（kshana iq での信号名は lunanet-afs-i と lunanet-afs-q）：AFS-I の Gold コード（{ "2047" } を { "2046" } に短縮サイクル化し、G2 を PRN ごとに遅延）と、AFS-Q の Weil 主コード（計算したルジャンドル系列、Weil インデックス、チップ p の前に挿入する拡張系列）で、PRN { "1" } から { "210" }。

seg-330ed84e8e78 = LSIS-AFS V1.0 に印刷された表（仕様書では TBC と記載）との照合：LunaNet Interoperability Specification V5、Applicable Document { "1" } Volume A：LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0、{ "2025" } 年1月 { "29" } 日（NASA、PDF の SHA-256 は { "986e0795" }...）が生成器パラメーターの横に印刷しているチェック列：Tables C-1 から C-5 と D-2 から D-6 は AFS-I と AFS-Q のすべてのコードの先頭と末尾の { "24" } チップ、Table D-1 は長さ 10223 のルジャンドル系列で、scripts/extract_lunanet_afs_tables.py（xval/lunanet-afs/oracle/）で抽出しています。合格基準は生成器が存在する前の b3ba5d5（xval/lunanet-afs/PREREGISTRATION.md）で事前登録：B1 は { "420" } 件中 { "420" } 件、B2 は同一、B3 は { "420" } 件中 { "420" } 件。この文書はコードの表に { "{" }LSIS-TBC{ "}" } と記しており、試験と統合のみを目的としていると述べているため、ここで検証しているのはその版の表に対する構成であって、後の版に対するものではありません。印刷された G2 の初期状態についての事前登録済みの主張（B1b）は、方向を誤って記述しており、NOT MET です（{ "210" } 件中 { "0" } 件）。これは固定してあります。修正した関係（{ "2047" } から遅延を引いたもの）は { "210" } 件中 { "210" } 件で成り立ち、事後的なものとして記録しています。確認していない範囲：生成器パラメーターそのもの（同じ表）、印刷された列の間のチップ、三次符号、メッセージ層、LDPC 符号化。

seg-7b1ae0c7ca28 = LunaNet AFS の三次符号とメッセージ層（SB1 BCH、CRC-24Q、インターリーバー）を、LSIS-AFS V1.0 と照合

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits、afs_q_tiered、iq::lunanet_afs：同期パターン、SB1 の BCH({ "51,8" }) エンコーダーと 256 仮説デコーダー、CRC-24Q、{ "60" } x { "98" } のブロックインターリーバー、シンボルストリームのチェッカー（kshana lunanet-afs-check）、およびプレースホルダーのサブフレームを持つテストストリーム生成器。サブフレーム { "2" } から { "4" } のレート 1/2 の LDPC 符号化は未実装です（その行列は別の附属書にあります）。

seg-b6f39f180fdd = LSIS-AFS V1.0（上記のとおり）：長さ 1499 のルジャンドル系列（Table E-1、同一）と、三次符号の先頭と末尾の { "24" } チップ（Tables E-2 から E-6：{ "420" } 列中 { "419" } 列が同一。この文書は PRN { "147" } と PRN { "151" } に同じ末尾 { "24" } チップ A14850 を印刷しており、生成器は PRN { "151" } のものを再現するため、PRN { "147" } の項目は誤植である可能性が高い。{ "420" } 件中 { "420" } 件という合格基準は NOT MET で、この不一致は固定してある）。SB1 符号の Figure { "8" } の計算例（例は一つ：0x045 は 0x229F61DBB84A0 に符号化される）。ASCII { "123456789" } に対するカタログ上のチェック値 0xCDE703 との CRC-24Q。この文書自身のフレーム演算。合格基準は b3ba5d5 で事前登録。記録上の不一致が一件で、メッセージ層の計算例が一つのみのため、この行は MODELLED のままです。確認していない範囲：サブフレーム { "2" } から { "4" } の LDPC と CRC ワード、メッセージの内容、記録されたストリーム

seg-0d7b17524c04 = 標準パック：実行前に定めた合格基準に照らして採点するシナリオ

seg-6e5c04fd4531 = standards_pack（kshana standards-pack）：レベル { "1" } から { "4" } の DHS Resilient PNT フレームワークのテストプロファイル、IMO MSC.1/Circ.1575 の精度レベルとインテグリティ評価、ICAO Doc { "9849" } Appendix F の監視、評価、緩和のパックです。各テストは同梱のシナリオ種別を実行し、結果のフィールドをパックに定めた合格基準と比較します。受信機ログを必要とするテストは NEEDS INPUT として一覧に載せ、採点しません。

seg-d9ea966abdd6 = シナリオ結果に外部の照合はありません：パックのすべてのテストは MODELLED のシナリオ種別を実行します。合格基準はパック作成者が定めたプロファイルです（DHS フレームワークは値を定めておらず、IMO の精度の限界値は MSC.1/Circ.1575 の Table C-1 を全文読んだもので、ICAO のパックは ICAO 自身の RFI Mitigation Plan の発表資料に従っています。Doc { "9849" } は有料の刊行物であり、読んでいないためです）。採点した実行より前に、standards/ 以下の xval 方式の PREREGISTRATION.md ファイルにコミットしています。MET の合格基準が示すのは、モデル化したシナリオが定めた合格基準を満たしたということであり、製品については何も述べていません

seg-8a8f2c85e0c3 = ラボのラウンドトリップ用エビデンスパック（シナリオ、試験条件、受信機ログ、スコア）

seg-a090b06a920d = evidence::roundtrip（kshana evidence round-trip）と、kshana bench-export の kshana.test-conditions/1 受信機ログのエクスポート：シナリオのハッシュ、記載した条件のハッシュ、ログのハッシュ、および記載したイベントに対するスコアを記録する署名付きパックです。採点イベントと食い違う条件や、ハッシュが記載のものと一致しないログは拒否します。信号の書き出し、再生、スケジュールは行いません。

seg-76da58fe670a = 外部の照合はありません：パックが結び付けるのはハッシュと、MODELLED の受信機ログのスコアであり、合成データで確認しています（同梱シナリオのエクスポートした NMEA を、受信機のログとして扱ったもの）。ラボでの実行は主張していません

seg-a9189e4fe413 = IQ 追尾エンジンを、独立した記録データ上の GNSS-SDR { "0.0.19" } と照合

seg-364de05e5b1b = IQ 層の完全な追尾エンジン（iq::track、kshana iq track 経由：捕捉からの引き継ぎ、相関器、NCO、二次の { "15" } Hz Costas PLL、一次の { "2" } Hz 搬送波補助 EML エンベロープ DLL、ロック指標、C/N0 推定器）を、{ "30" } から { "45" } dB-Hz の GPS L1 C/A で扱います。

seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" }（GPL-3.0-or-later、Ubuntu { "24.04" } のパッケージ、別のプログラムとして実行。コミットしているのは導出した数値のみ）が、同じ numpy の記録データ（エンジンからは独立）を追尾し、どちらも解析的な真値に対して測定しました。合格基準は 48edd4a5 で事前登録し、どの試験記録よりも前の 1e4288c4 で修正しています（両方の受信機でプルイン中のみ { "10" } Hz の FLL を使う。登録した較正が GNSS-SDR の誤った引き継ぎで失敗した後で、所見 F3）。{ "30" }、{ "35" }、{ "40" }、{ "45" } dB-Hz で MET：搬送波ジッターは { "4.3" } % 以内、コードジッターは { "4.6" } % 以内、ドップラーの平均とばらつきは GNSS-SDR のもの以内。NOT MET：エンジンの NWPR C/N0 は GNSS-SDR の SNV より { "2.3" } から { "7.1" } dB 低く読めます（所見 F4、NWPR の既知の限界。M2M4 は真値から { "0.06" } dB 以内）。位相ロック指標は定義が異なります（F5）。{ "30" } dB-Hz では GNSS-SDR が二回スリップし、エンジンはスリップしませんでした（F6）。GNSS-SDR 自身の引き継ぎは、較正の実行 { "30" } 回中 { "3" } 回で誤った周波数にロックしました。確認していない範囲：他の信号、データビットの除去、再捕捉、フィールドの記録データ。この行は MODELLED のままです。

seg-259d201c2ff8 = ジャミング種別の CRPA アンテナ利得を、独立した numpy での再計算と照合

seg-192144c57783 = ジャミング種別の任意の [crpa] セクション：各衛星に向けたチャネルごとのビーム（ジャマーをヌルとするヌルステアリング、または sigma^{ "2" } I + P_j a_j a_j^H に対する MVDR）で、既存の耐ジャミング C/N0 の式の前に、各リンクの雑音を ||w||^{ "2" } で、ジャマーを |w^H a_j|^{ "2" } でスケーリングします。

seg-232d040b575d = 4 素子の正方配列を用いた jamming-demo の幾何のすべてのリンクについて、両方の重み付けで、独立した numpy での再計算（xval/crpa-jamming/oracle.py、コードの共有なし：numpy のステアリングベクトル、numpy.linalg.solve と inv）を行いました。合格基準は 08d83b4d で事前登録。MET：A1（セクションなしで、{ "150" } 件のシナリオ結果すべてがバイト単位で同一。修正後：最初のビルドでは、crpa の単位をすべてのジャミング実行の単位表に追加していました）、A2（一素子は配列なしと { "1e-12" } dB 以内で等しい）、配列の雑音利得と実効 C/N0 についての A3（{ "912" } 件のリンクと重み付けの組が { "1e-9" } dB 以内、最悪 { "2.1e-14" } dB）、およびヌルステアリングのジャマーヌル（両方で -200 dB 未満）、A4（JNR { "80" } dB で MVDR はヌルステアリングの { "0.1" } dB 以内）。NOT MET：MVDR のジャマー利得についての A3。{ "0.36" } のポータブル数学では { "456" } 件のリンクのうち { "194" } 件が { "1e-9" } dB を超えました（ホスト数学では { "202" } 件。docs/revisions/STUDIO15-batch4-rebaseline.md）（最悪 { "1.7e-6" } dB）。残差は -100 から -188 dB で、float64 の桁落ちが両方の実装を制限しています（numpy の inv と solve は { "169" } 件のリンクで互いに食い違い、最悪 { "7.9e-7" } dB）。これらが供給する実効 C/N0 には影響しません。確認していない範囲：相互結合、素子の不整合、広帯域処理、複数のジャマー、アンテナのハードウェア。同じ式の再計算であって、外部のオラクルではありません。この行は MODELLED のままです。

seg-a2f34cff9338 = ジャミング種別におけるジャマーの地形による遮蔽を、実際の SRTM タイルでの独立した numpy 再計算と照合

seg-334c569d9cae = ジャミング種別の任意の [terrain] セクション：SRTM の .hgt タイル上でジャマーと受信機の間の大圏の地形プロファイルを、k ファクターによる地球の膨らみとともに求め、支配的なナイフエッジ（最大の Fresnel-Kirchhoff nu）と ITU-R P.526-15 の節 { "4.1" } の単一ナイフエッジ損失を、ジャマーの受信電力から差し引きます。

seg-615ea67dd756 = 独立した numpy での再計算（xval/jamming-terrain/oracle.py、コードの共有なし：独自の .hgt の読み取り、双線形補間、WGS { "84" } の往復、プロファイル、膨らみ、nu と J(nu)）を、コミット済みの実際の SRTM タイル tests/fixtures/terrain/N36W117_sub6.hgt にある Badwater Basin の受信機の周囲の十か所のジャマー配置について行いました。合格基準と配置は 92cd2bfd で事前登録。すべて MET：加法性（セクションなしで { "150" } 件のシナリオ結果すべてがバイト単位で同一）。すべての配置のプロファイルの点と障害物が等しく、nu と損失が { "1.6e-10" } 以内（合格基準は { "1e-9" }）。ジャマーが { "2" } から { "4902" } m に上がっても損失は増えない。損失はすべての J/S をちょうどその分だけ下げ、他は変えない。J(nu) はオラクルの値と { "1e-12" } dB 以内。所見：Black Mountains と Funeral Mountains を挟む配置は { "44" } から { "48" } dB の損失となります。谷底の二つの配置は、アンテナ高 { "2" } m で地球の膨らみだけにより { "8" } dB と { "15" } dB の損失となり、これは単一ナイフエッジモデルのかすめるケースです。確認していない範囲：実測の伝搬、複数エッジの回折、地面反射、クラッター、DEM 自身の誤差。同じモデルの再計算であって、外部のオラクルではありません。この行は MODELLED のままです。

seg-825c121c7512 = ジャミング種別の捕捉ヒステリシスとフロントエンドの量子化器を、独立した再計算と照合

seg-f7207263d881 = ジャミング種別の任意の [acquisition] セクション（衛星は、再捕捉遅延の後、捕捉しきい値以上で捕捉され、追尾しきい値以上である間は保持される）と [front_end] セクション（AGC の読み { "10" } log10({ "1" } + J/N) と、ADC のガウス入力量子化器の損失を、すべてのリンクから差し引き、非ガウスのジャマーには有効でないと明示する）。

seg-6abc60ee9ec4 = エンジンのエポックごとの実効 C/N0 からの、すべての捕捉フラグの独立した Python 再計算（xval/jamming-acq-agc/hysteresis.py）、量子化器損失の独立した numpy モンテカルロ（xval/jamming-acq-agc/quantiser_mc.py、独自の最適ステップ探索、{ "2" }^{ "22" } サンプル）、および IQ 層の AGC ループ。合格基準は 70c72fcc で事前登録し、補足の実行セットは { "37793290" } です。MET：加法性（セクションなしで { "150" } 件のシナリオ結果すべてがバイト単位で同一）。補足の実行ですべてのフラグが等しい（{ "1824" } 件のリンク、うち { "732" } 件でヒステリシスが現れた）。しきい値に対して単調。量子化器損失は { "1" } から { "4" } ビットでモンテカルロと { "0.0007" } dB 以内（合格基準は { "0.02" } dB）。AGC の読みは AGC ループと { "0.012" } dB 以内（合格基準は { "0.05" } dB）。NOT MET：登録したヒステリシスの実行（{ "10" } から { "30" } dBW の jamming-demo）は、すべてのリンクがロスト状態となって有益ではなく、その H2 と H4 は自明な形でしか満たされていません。所見：CW ジャマーでは、1 ビットの ADC はエンジンが適用するガウスの値より約 { "5" } dB 余分に損失し、有効でないと明示されます。確認していない範囲：捕捉探索そのもの、AGC の時間的な動特性、受信機のハードウェア。同じモデルの再計算であって、外部のオラクルではありません。この行は MODELLED のままです。

seg-9c46f1c76486 = 既定設計の FLL から PLL への引き継ぎの下限を下回る領域での、上限付き FLL プルイン（オプトイン）

seg-efa1d1a9e904 = iq::track のオプトインの carrier.fll_pull_in_max_s（iq::track::LoopConfig の fll_pull_in_max_s フィールド）：fll_assist = pull-in のもとで、FLL は PLI にかかわらず一定のプルイン時間の後に PLL へ引き継ぎ、PLI が初めて fll_off_pli に達するまで、対応する戻りの滞留を伴います。

seg-76cce58eaddd = 注入した真値に対する内部整合性：搬送波位相が既知の、データなしの合成 GPS L1 C/A ソース（PRN { "13" }、{ "1500" } Hz、{ "4.1" } MHz、{ "8" } 秒、雑音シードは十個）で、合格基準は 58789af0（docs/design/evidence/fll-handover-floor/）で事前登録しています。MET：コントロール（上限なしのデフォルトは、{ "33" } dB-Hz では { "10" } 個のシード中 { "9" } 個で引き継がない）、加法性（デフォルトのハッシュと既存の追尾テストは変わらない）、{ "45" } dB-Hz での { "100" } Hz ずれた引き継ぎのプルイン。NOT MET：{ "1.0" } 秒の上限では、引き継ぎと保持がすべての実行で成立せず（{ "33" } dB-Hz では { "20" } 回中 { "16" } 回、{ "31" } dB-Hz では { "20" } 回中 { "8" } 回。残りは、強制的な引き継ぎと FLL の戻りの間を循環する）、位相ジッターは PLL のみの場合の { "25" } % 以内に収まりません（{ "33" } dB-Hz で { "6.1" } 度に対して { "10.8" } 度）。確認していない範囲：データビット、他の信号とサンプルレート、フィールドの記録データ。デフォルトは変わりません。この行は MODELLED のままです。

seg-ac0f97e945a7 = receiver-trust 向けの RTKLIB .pos 解の読み取り

seg-0b8bc2c89de4 = RTKLIB の解ファイル（暦または GPS 週／TOW の時刻、緯度／経度または ECEF の位置、使用衛星数）を、receiver-trust のタイムラインに読み込みます（receiver_trust::machines::rtklib）。

seg-3de364392f92 = 外部の照合はありません：RTKLIB が生成したファイルは読んでおらず、列のレイアウトは RTKLIB のマニュアルによるものです。確認したのは自作のファイルのみで、ECEF 変換は frames::ecef_to_geodetic を再利用しており、それには独自の行があります

seg-849393517c04 = receiver-trust 向けの NovAtel OEM7 の ASCII とバイナリのログ（BESTPOS、RANGE、RXSTATUS）

seg-7e0021922025 = ASCII とバイナリの OEM7 ログから、BESTPOS（位置）、RANGE（信号ごとの C/No）、RXSTATUS（受信機のジャマーフラグ。そのエポックの自己申告として）を読み取ります。CRC を確認し、読み取り専用です（receiver_trust::machines::novatel）。

seg-1f7c6d1009a8 = 合格基準としての外部の照合はありません。フィールドのレイアウトと CRC は公開されている OEM7 の文書（docs.novatel.com）に従い、CRC ルーチンは、文書が自身の BESTPOSA の例について示す CRC に対して一度だけ確認しました（引用であり、転載ではありません）。フィクスチャーは自作で、実際の受信機のログは読んでいません

seg-a45c53a9deb3 = receiver-trust 向けの RTCM { "3" } MSM4 と MSM7 の搬送波対雑音の読み取り

seg-0a0c9976236f = RTCM { "3" } の MSM4 と MSM7 メッセージ（GPS、GLONASS、Galileo、SBAS、QZSS、BeiDou、NavIC）の、すべての信号セルの C/N0 を、フレームストリームから読み取ります。CRC-24Q を確認します（receiver_trust::machines::rtcm3）。レイアウトは、RTCM 規格の本文ではなく、BSD ライセンスの pyrtcm の表によります。

seg-2af6fc1abe98 = テストスイートのテストではなく、一度きりの確認での ReferenceImpl：pyrtcm { "1.2.0" } のデコーダーは、同じ自作のフレームを読み、同じ C/N0 とエポック時刻を得ます。このリーダーと表の出典を共有しているため、確認するのはビットの扱いであって、レイアウトではありません。実際の受信機や基準局からのキャプチャーは読んでいません

seg-cd554a7c1649 = receiver-trust 向けの GNSS-SDR モニターアダプター

seg-22b587ac642d = GNSS-SDR の Monitor（Gnss_Synchro）と PVT モニターのメッセージを、proto のフィールド名のまま JSON 行に中継したものから読み取り、チャネルごとの C/N0、測位解、使用衛星数、HDOP、スカイに変換します（receiver_trust::machines::gnss_sdr、integrations/gnss-sdr/relay.py）。

seg-d22aed9d9a16 = 外部の照合はありません：フィールド名は GNSS-SDR の文書に由来し、リーダーも relay.py も、稼働中の GNSS-SDR や実際のキャプチャーに対しては実行していません

seg-217e5953c128 = IMU ログの取り込み、ジャイロ方位の入力、およびハイブリッドセンサーパラメーターのアラン分散フィット

seg-9dadc819daef = IMU の CSV（文書化された列、または EuRoC のレイアウト）を読み込み、ヨーレートを積分して、方位・針路モニターが読む方位にし（[log.imu]）、静止ログから、重なりのあるアラン偏差によって、ハイブリッドおよびフュージョンのシナリオの加速度計とジャイロの雑音パラメーターをフィットします（imu-fit）。

seg-9099f3467e9e = 外部の照合はありません：フィットは係数が既知の合成ホワイトノイズのログで、方位は一定ヨーレートのログで確認しています。実際の IMU ログはフィットしておらず、q_aa はフィットしていません

seg-15a852a2dcb0 = 信頼テレメトリ向けの Home Assistant MQTT ディスカバリーおよび状態エクスポーター

seg-6d6b07b26966 = 信頼ストリームのための JSON の状態ドキュメントと Home Assistant MQTT ディスカバリーメッセージで、すべてのサーフェスでテキストとして出力され、CLI が MQTT { "3.1.1" } の QoS { "0" } で公開します（telemetry::mqtt、trust-telemetry --mqtt-tcp、--print-mqtt、format mqtt）。

seg-79a8f3864af3 = 外部の照合はありません：パケットを読んだのは、テストのために書いたループバックのリスナーであり、実際のブローカーではなく、Home Assistant も実行していません

seg-68caf86157c2 = ROS { "2" } の receiver-trust パッケージと gnss_lib_py ブリッジ

seg-e7d7d99fe538 = 測位解と衛星のメッセージを NMEA として書き出し、Python バインディングで採点する、ROS を使わないブリッジ（integrations/ros2/kshana_trust）と、rtklib-pos 形式を介して gnss_lib_py の NavData を receiver-trust に橋渡しするブリッジ（integrations/gnss_lib_py）。

seg-05ded40b17d2 = 外部の照合はありません：ROS ノードは稼働中の ROS { "2" } グラフでは実行しておらず、ublox_ubx_msgs のフィールド名は、稼働中のドライバーとは照合していません。gnss_lib_py（MIT）は、ブリッジのテストのために実行しました

seg-33d506570c1b = srp_shadow::tests（円環の閉形式、円錐影を再現する一様な法則、完全な日照と本影の極限）

seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs（{ "5" } ケース × { "24" } h にわたる { "25" } 個の毎時の状態、LEO、GEO、HEO、第三体、および第三体 + SRP：最悪値 |dr| { "0.0170" } m、|dv| { "1.84e-5" } m/s。解析級数のコントロールは { "9.96" } m 外れます。Orekit の DE440 位置に対して、太陽は { "6.39" } m、月は { "0.244" } m で、記録済みの未達）、propagator の単体テスト（プロバイダーの拒否、クローン間で共有されるフォールバックのカウント）

seg-448f4acf5c7b = tides, propagator, precise_od

seg-4014447d4bcc = tides::tests（S1 項は日周で、四分の一日で { "90" } 度回り、各行の負荷係数の振幅を持つ。LEO での物理的な大きさ）、propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

seg-3f7d3003656e = tests/gravity_sh_high_degree.rs（軸から外れた { "8" } 点での Orekit：N = { "70" } で最大 |da| { "2.2e-17" } m/s^{ "2" }（常に実行）。N = { "200" }、{ "360" }、{ "2190" } では { "3.5e-17" }、{ "3.9e-17" }、{ "7.3e-17" } m/s^{ "2" }（KSHANA_EGM2008_GFC があるデータの場合のみ実行））、tests/cowell_tesseral_200_orekit_oracle.rs（{ "24" } h の 200x200 の軌道、データがある場合のみ実行：最悪値 |dr| { "0.1317" } m、|dv| { "1.45e-4" } m/s。70次のコントロール { "0.726" } m）、gravity_sh の単体テスト（{ "70" }次で従来の評価器と { "1e-13" } まで一致、2190次の場での有限差分と極での連続性、拡張指数による計算に対するアンダーフローする2190次の項）

seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs（{ "8" } シナリオ：range-rate、az/el、その混合、LEO と MEO、ノイズなしと、シードつきの sigma { "5" } m / { "5" } mm/s / { "1e-4" } rad、{ "5" } 度と { "10" } 度のマスク、Orekit { "12.2" } との比較：可視集合は同一。測定値は { "5.84e-8" } m、{ "6.30e-10" } m/s、{ "1.44e-13" } rad 以内。STM は相対で { "1.2e-14" } 以内。ノイズありの状態は { "1.74" } cm と { "1.14e-5" } m/s 以内。タイプごとのポストフィット RMS は相対で { "2.7e-4" } 以内。ノイズなしの kshana と真値は { "1.06e-8" } m。ノイズなしの kshana と Orekit は、二つのシナリオで { "1.464" } cm と { "1.740" } cm で、{ "1" } cm の合格基準に対する記録済みの未達）、orbit_determination と batch_ls の単体テスト

seg-f5a76ae1fcaa = sp3, precise_od

seg-39a552abfcab = src/sp3.rs の単体テスト、tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit（コミット済みの { "8" } h の ESOC フィクスチャ、ヘッダーの指数 { "5" } から sigma { "0.032" } m：Tier-1 の 3D RMS { "0.132" } m は変わらず、Tier-2 は sigma { "1" } m での { "0.070" } m に対して { "0.035" } m。この変化は、再均衡した経験的な事前制約によるもの）、tests/agency_swarm.rs（Swarm の製品には精度コードがなく、フォールバックし、固定してあります）

seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator、gravity_pds::tests::with_gravity_field_is_opt_in

seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

seg-dbe0dd5dcf47 = gnss_navmsg::tests（CRC-24Q のチェック値 0xCDE703、畳み込みのインパルス応答、Viterbi が注入した誤りを訂正、レイアウトの幅）、tests/gnss_navmsg_roundtrip.rs（フィールドの開始ビットが ICD のビット番号と一致。エンコード → FEC → インターリーブ → Viterbi → デコードのラウンドトリップが半 LSB 以内）、tests/gnss_navmsg_galileo_brdc_grid.rs（LSB のグリッド上の IGS BRDC 2018-133 の Galileo レコード、最悪値 { "3.6e-3" } LSB。事前登録した衛星数の合格基準は { "20" } 機中 { "15" } 機で満たせず、所見）

seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

seg-e892fffaaf07 = hatch::tests（ノイズなしの素通し、ホワイトノイズの分散 1/(2N-1)、再スタート）、tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned（WTZR 2025-02-24 01-06 h、{ "600" } エポック、N = { "100" }：3-D 誤差の中央値 { "1.553" } -> { "1.116" } m、p95 { "3.473" } -> { "3.207" } m）

seg-bdda05057c91 = rinex_obs (parse_obs)

seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs（IGS MGEX の RINEX { "4.00" } ファイル MAO000USA_R_20231980000_01D_30S_MO の最初の { "4" } エポック、{ "58" } 機の衛星、{ "7" } システム：ヘッダーレコードと最初のエポックの値が、公開されたリテラルと一致）、rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records（仕様から作った合成の { "4.02" } ヘッダー）

seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs（実際の C01-C04 のレコード：静止軌道の半径、公開されたスロットでの経度 140.02/80.04/110.55/159.99 度、傾きありで |緯度| { "2.13" } 度に対して傾きなしで { "6.65" }。事前登録した放送対精密 SP3 の比較は、KSHANA_BDS_GEO_SP3 があるデータの場合のみ実行で、実行していません）、rinex::tests

seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs（8の字走行：同一の測定値で、定常状態の 3-D RMS は搬送波で { "0.025" } m、コードで { "0.470" } m。{ "12" } シードで、NIS/dof の平均 { "1.00" }、定常状態の NEES/dof { "0.92" }。1サイクルのスリップをそのエポックで検出し、誤警報はなく、解は損なわれませんでした。放送補正を切ると、コードの誤差は { "0.51" } m から { "19.6" } m（電離圏）と { "8.0" } m（対流圏）に増えます。ノイズなしの実行は { "0.3" } mm に収束します）

seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scenarios gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

seg-3f9bc3b0027f = tests/gnss_ins_packs.rs（各パック：途絶の間、両方のセンサーで、融合が自由慣性航法より小さい誤差。鉄道：途絶の間、密結合 { "5.3" } m に対して疎結合 { "12.9" } m（ナビゲーショングレード）、および { "15.6" } m に対して { "18.8" } m（タクティカル）、可用性 { "0.97" } に対して { "0.95" }。tight のテーブルは独立した参照と照合して確認）、tests/gnss_ins_legacy_trajectory_pin.rs（疎結合の既定はビット単位で同一）

seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

seg-260ef8ae3823 = tests/fusion_coupled_filters.rs（{ "60" } シードでの 3-D フィルター：後半の NEES の平均 { "8.12" }（{ "8" } 状態）、最終エポックの χ² の和は { "95" } % の帯の内側。{ "0.1" } ns の時計の固定で、3-D の位置の sigma は { "5.58" } m から { "3.07" } m に下がります。{ "60" } シードでのバイアスフィルター：χ²({ "5" }) の和は帯の内側、バイアスは { "60" } 中 { "59" } で { "3" } シグマ以内。バイアスのある加速度計での fusion-pnt-coupled：位置の p95 は { "18.7" } m / { "90.0" } m、インテグリティは { "1.00" } / { "0.97" }（結合）に対して、{ "430" } m / { "4060" } m、{ "0.006" } / { "0.000" }（非結合））、fusion::coupled::tests、tests/fusion_coupled_pack.rs（[coupled] のない fusion と hybrid はビット単位で同一）

seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

seg-5a6b5289a473 = fusion::trajectory::tests（協調旋回には横力がなく、荷重倍数は 1/cos φ。CSV のインポートは、飛行したプロファイルを { "1e-3" } m/s と { "1" } m まで再現）、tests/gnss_ins_trajectory_library.rs（すべてのプロファイルが実行され、途絶の間は融合が自由慣性航法に勝る。それぞれが指定された動きを飛行する。方位の可観測性：{ "240" } s 後のヨーの sigma は、直進の巡航で { "1.27" } 度、8の字で { "0.039" } 度、ストップアンドゴーで { "0.062" } 度）、tests/gnss_ins_legacy_trajectory_pin.rs（従来の結果と真値のハッシュがビット単位で同一）

seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry（CAPSTONE の{ "2023" }年3月、近月点 { "4" } 回と遠月点 { "5" } 回：周期 { "6.5004" } d に対して { "6.5699" } d（{ "1.07" } %、基準 { "3" } %）、遠月点 { "71 182" } に対して { "71 215" } km（{ "0.05" } %、基準 { "5" } %）、近月点 { "3 385" } に対して { "3 245" } km（{ "4.1" } %、基準 { "20" } %））、cr3bp::tests::reproduces_l2_southern_nrho_92_regime

seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs（position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries：事前登録 e50c88d2 の後の最初の実行で、{ "104" } 個の検査すべてが通過。最悪値は、分散 { "3.2" } %、RMS { "1.6" } %、相関 { "0.012" }、平均は標準誤差の { "2.2" } 倍、楕円の割合 { "0.0039" }。negative_control_a_doubled_pdop_fails_every_geometry、negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries：どちらのコントロールも、求められたとおり失敗。position_error_is_sigma_times_dop_on_masked_skies：設計ノートの、マスクされたスカイラインの二つのジオメトリ、すなわち city-street プリセット（衛星 { "4" } 機、PDOP { "16.6" }）と container-terminal プリセット（衛星 { "9" } 機、PDOP { "2.5" }）の下の 10sat-mixed の空で、事前登録 03999c11、tests/fixtures/dop/PREREGISTRATION-MASKED.md の後の最初の実行で、{ "26" } 個の検査すべてが通過）、tests/position_error_dop_ci.rs（手で選んだ四つの空（開けた空、集中した空、峡谷、半天）での、最初の独立した検査。sigma { "1" } m、シード 0x0D0B5EED。{ "20" } 個の検査にわたり、合計 { "1e-6" } のカイ二乗信頼区間を使用：比は { "0.987" } から { "1.009" }、ソルバー自身の PDOP/GDOP はカーネルのものと { "2.5e-12" } まで一致。{ "10" } % の DOP 誤差と 1/sin(仰角) の誤差に対するネガティブコントロール。事前登録の前に実行したため、事前登録ではなく、報告として扱う）、dop_error_mc::tests、dop_error_ci::tests

seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

seg-fd57dab04d68 = tests/natural_degradation_trust.rs（a_stated_skyline_reads_the_fjord_as_geometry：scenarios/training/fjord-natural-degradation.toml の合成のフィヨルド航行では、指定した [skyline] の有無にかかわらず、同じ { "624" } エポックが減点されます。ありの場合は sky-blocked が { "680" } エポックで報告され（なしの場合は { "0" }：両側が囲まれたフィヨルドでは、方位角のギャップによるフォールバックは何も検出しません）、open_fraction は { "0.758" } で、環境クラスのエポックは { "78" } から { "33" } に減ります。残りは、指定したスカイラインが開けた場所に残す衛星の喪失です。イベントの外では、スカイラインはスコアを変えません）、receiver_trust::geometry::tests（しきい値での手で導いた比、しきい値の境界、ランプと上限、下限、ラベルの境界、[geometry] による上書き、独立した参照と照合して確認したカーネル上の DOP、保持された空と期限切れの空、推測しない unknown、信号の喪失、悪いジオメトリの許容、測位解なしの番兵値）、tests/geometry_trust.rs（ラベルは付くが採点されない fair のマスクされた空、poor のマスクされた空、低仰角の喪失、電力の低下、偽造された HDOP、信号の全喪失、悪いジオメトリの間のドラッグオフ、unknown のジオメトリ、セッションの上書き、ライブのスキーマ）、tests/geometry_trust_no_change.rs（追加されたキーを取り除くと、二つのサンプルセッションがどちらも { "0.35.0" } とバイト単位で同一）、tests/geometry_corpus_identity.rs（コミット済みのすべての船舶 NMEA コーパス、GPS のみの開けた空としても、および乗組員訓練のシナリオ：poor のエポックを除いて { "0.35.0" } とバイト単位で同一。poor のエポックは、ジオメトリの減点だけが異なります）

seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs（単一クロックのカーネルを gnss_lib_py に対して）

seg-085cbc64bab2 = holdover

seg-b31ed8fc6801 = holdover::tests（複数ステップのカルマン共分散の再帰に対して。white-FM は厳密。ラウンドトリップ）。惰行分散のカーネルは、tests/gnss_denied_clock_holdover_reference.rs で外部の参照と照合して確認（scipy の Van-Loan/brentq に対して）

seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; 事前登録 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; データがある場合のみ実行)

seg-d302e2ef46ad = clock_library (card)

seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; 事前登録 fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

seg-3016100a7015 = clock_state::tests (analytic van-Loan Q; NEES; PSD positivity); tests/clock_state_reference.rs（予測と更新の全軌跡：状態 x と { "3" }×{ "3" } の共分散 P を、{ "1925" } ステップ・{ "4" } 組のパラメーターで filterpy { "1.4.5" } と比較。最悪値 |relΔ| { "2.8e-14" }）; tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding（所見を固定）; tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 のラウンド { "3" })

seg-509026100595 = timetransfer, timetransfer_adv

seg-a1ad8fb8537d = timetransfer::tests（相反性による相殺、二形式の Sagnac 恒等式）、tests/time_transfer_error_budgeting_reference.rs（赤道一周の Sagnac = { "207.386" } ns に対し、公表された Ashby の { "207.4" } ns と <{ "0.05" } ns まで一致。加えて、Sagnac と geodist のジオメトリを、C のソースからコンパイルした RTKLIB { "2.4.3" } の geodist() と相互確認）

seg-10e0cb39ac3b = navsignal

seg-1035f877de94 = navsignal::tests (BPSK self-SSC = 2/3R_c; unit-area PSD; DLL); tests/nav_signal_modulation_code_tracking_reference.rs（GPS C/A の Gold 符号の相互相関・自己相関が、独立した IS-GPS-200 の符号生成と整数で完全一致。BPSK-R({ "1" })/sine-BOC({ "1,1" }) の PSD を、独立した scipy のピリオドグラムに対して確認）; tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath、固定)

seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; Freier-2016 floor bracket); tests/quantum_inertial_sensor_reference.rs（伝達関数 |H(ω)|、k_eff·T²、ショットノイズの ASD を、公表された Cheinet { "2008" } / Peters / Freier の数値ベクトルに対して）; tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise、固定; gradiometer_qpn_line_matches_janvier_model)

seg-81802510f112 = quantum_imu::tests（a_max は ±π の半フリンジの端にあり、範囲は 1/T² でスケールする。折り返した位相の復元は [−a_max,a_max] の内側では厳密で、外側ではちょうど { "2" }·a_max だけエイリアシングする。曖昧さのない動的範囲 a_max/σ_a=π/σ_Φ は、大きく異なる二つの波長/T のスケールファクターにわたって同一。CaiAccelerometer のメソッドは、自由関数と一致する）

seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

seg-60fb2adb58ce = budget_tests (bias vs AccelModel integrator; VRW vs analytic integral); tests/quantum_inertial_dead_reckoning_reference.rs（VRW を、白色加速度ノイズの独立した numpy モンテカルロ二重積分と比較。{ "6" } 通りの惰行時間にわたり、最悪の偏差 { "0.42" }% は ±{ "3" }% 以内。バイアスとスケールファクターを Groves { "2013" } の閉形式の値と比較。ホールドオーバーのラウンドトリップ）

seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form and cw_q_equals_the_spectral_separation_closed_form：Q テーブル、CW と狭帯域は { "1" }、広帯域とスイープは { "2" }、navsignal の閉形式に固定; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs（FSPL/J-S/実効 C-N₀ を、Kaplan & Hegarty §{ "9.4" } のリンクバジェットの独立した numpy による再導出と比較。実際の JammerTest の C/N₀ は、{ "25" } dB-Hz のしきい値を単調に下回る）; tests/jamming_jammertest_cn0_oracle.rs（事前登録、ブロック、未実行）

seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs（TEXBAT のパラメーターの特性評価）; tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement（所見を固定）; tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — メンバーの結果は単独実行とバイト単位で同一であり、整列したすべての値は単独実行の系列と等しい。the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — 白色周波数雑音の時計が tau = { "3010" } s のコースティングを行う { "200" } 個のシード：真の平均 { "0" } が報告区間の内側にあり、区間の半幅が { "1.96" } sigma/sqrt(n) の { "25" }% 以内、標本分散が sigma = sqrt(q_wf tau) = { "16.459" } ns の両側 { "99" }% カイ二乗区間の内側にある；較正アンサンブル (CAP-10, 事前登録 ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs)：{ "200" } 個の独立したアンサンブルのうち、区間が真の平均を含んだのは { "192" } 個（Binomial({ "200" }, { "0.95" }) の { "99" } % 領域 [{ "181" }, { "197" }] の内側）、カイ二乗検定に合格したのは { "196" } 個であるのに対し、単一シードのパーセンタイル許容差（p05 と p95 が { "0.3" } sigma 以内）に合格したのは { "200" } 個中 { "183" } 個にとどまり、事前登録した { "190" } に対して NOT MET である。これはシードに脆弱な検査であり、基準を緩めずにそのまま記録している；a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

seg-c0c2439ee1f6 = campaign (run_compose)

seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — メンバーが一つの合成は、単独実行の数値と結果ダイジェストを読み取る)

seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

seg-94a984382eee = tests/campaign_optimize_reference.rs (事前登録 fbe6c8b3 と、ラウンド 1 のプロトコル上の未達を受けた 441f31bc：p2_prime_interior_target_range_matches_the_closed_form — 1 次元の目標解が r* = r0 { "10" }^((m(r0) - { "3" })/20) の { "6.1e-15" } 以内、{ "96" } 回の評価；p3_prime_contour_target_grid_and_nelder_mead と p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — グリッド法の最良値が run_toml 上の独立した { "41" } x { "41" } の総当たりループとビット単位で等しく、Nelder-Mead は { "177" } 回と { "161" } 回の評価で同等以上；p4_nelder_mead_reaches_the_corner_maximum；p5_the_document_is_byte_stable_and_counts_agree；p2_round1_not_met_the_box_excludes_the_closed_form（記録済みのラウンド 1 の未達を固定する）)；campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" }、{ "234" } 回の評価；a_non_finite_score_is_never_the_best；the_grid_mapping_is_the_sweeps)

seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs)；tests/leo_signal_reference.rs (同梱のシステム非依存シナリオはすべてワークショップのデータなしで実行できる、バンドトレードの電離圏比は (f_ref/f)^{ "2" } に等しく自由空間の差は { "20" } log10(f/f_ref) に等しい、基準 C/N0 でのジッタはそのガボール限界と帯域無制限の形式の間に収まる、ワークショップのパラメーターを使うシナリオの E5 形状検査は当該ファイルが存在する場合に整合する、そして当該ファイルをコンパイルするソースファイルはない)

seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

seg-17f462b8768d = tests/leo_signal_reference.rs (マルチバンドのウォーターフォールは 四つのパネルで実行され、UHF、L5 バンド、S、C のジャマーはそれぞれ自分のバンドだけを妨害し、単一バンドの実行は拡張によって変化しない)；leo_signal::tests::to_spectrum_band_is_consistent_with_the_design；spectrum::tests (agrees_with_the_jamming_kind_chain)

seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: { "0.01" } Hz と { "0.01" } Hz/s の未満；indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit)；leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion)；leo_link::antenna::tests

seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop)；leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: -139.1 dBW と -136.2 dBW の { "0.5" } dB 以内)；leo_link::presets::iridium::tests；leo_pass::tests (a_fully_custom_band_needs_no_preset)

seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor)；leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (切り替えごとの距離のジャンプは距離誤差の変化に等しく、{ "150" } s ごとに更新する補正済みの { "300" } s フィットは { "5" } cm のしきい値に合格する)；leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged；leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (閉形式が円錐の密なサンプリングを上から抑える)

seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference)；leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (すべてのモデルが、復号後に正確なメッセージの { "2" } mm 以内、再エンコードでビット単位で同一、反転したビットは CRC で拒否される)；leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped)；leo_navmsg::tests::rinex_and_csv_round_trips (すべてのモデルがテキストブロックの後で { "0.1" } mm 以内、CSV は完全に一致)

seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: 位置は { "1" } mm まで、ドリフトは { "1e-6" } m/s まで；a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user)；leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: 重み付き残差 RMS が [{ "0.8" }, { "1.2" }] の範囲にあり、誤差が四つの形式 sigma 未満)；tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging)；tests/starlink_doppler_published_proxy.rs ("Unveiling Starlink for PNT" の公表されたデータセット 3 のパーセンタイル（doi:10.33012/navi.685）に対する事前登録の代替指標：衛星 { "3" } 機（マスク { "47" } deg）、高度補助なし、{ "30" } Hz で、p90 の 3 次元誤差は { "20" } s で { "92.2" } m、{ "8" } s で { "870" } m であり、公表値の { "2" } m と { "10" } m に対して、二倍以内という両方の基準は NOT MET である。いずれも高い側に外れており、未達としてアサートしている；docs/design/evidence/cap11-starlink-doppler-proxy/)

seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) が { "1e-9" } まで一致；a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca)；leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered)；tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias)；tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned；tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } 個のシード、実行平均の NEES 平均が [{ "2.4" }, { "3.6" }] にあり、少なくとも { "75" }% のエポックが両側 { "95" }% カイ二乗帯域の内側；{ "150" } 個のシードで測定した平均は GNSS のみで { "2.84" }、LEO ありで { "2.87" }；leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit)；tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor)；tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz)；tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: src、scenarios、tests のソーステキストのスキャン)；leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line)；tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: より強い EIRP、より長いフィット間隔、より大きな軌道決定の項は、それぞれ受け渡される値と融合した測位解を動かす；the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form)；tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power)；tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: ピークでパスのスラント TEC に { "1e-9" } まで等しく、その sigma は { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" }) で割ったコード雑音の RSS に等しい)；tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

seg-aa2667aa0296 = receiver_trust (score, monitors, live)

seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (あらゆる統計量について単調、モニターを追加してもスコアは決して上がらない、健全な統計量は { "100" } にとどまる)

seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

seg-fe08580cd8d3 = telemetry::syslog::tests (厳密な LEEF 文字列、エスケープ、重大度、RFC { "5424" } のエンベロープ、配信タイムアウトと再接続)；tests/telemetry_cli.rs

seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (無効化、KSHANA_JAMMERTEST_DIR によるデータゲート：記録済みの選択、ホールドアウトの件数、基準ごとの判定と全体の判定)；receiver_trust::calibration::tests (タイムスタンプ、ウィンドウの対応付けとタイムゾーンのずれ、ラベル、ガードバンド、除外、選択)；receiver_trust::monitors::tests::threshold_profile_is_opt_in

seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (KSHANA_JAMMERTEST_PLAN_DIR によるデータゲート：{ "2025" } の計画の試験領域ごとのスロット数、カタログ ID、TOML のラウンドトリップ)；tests/jammertest_score.rs (既知の低下を含む合成ログ：検出、見逃し、評価不能、誤警報の実行、スコアカードを載せた署名付きパック)；jammertest::plan::tests；tests/jammertest_score_2024.rs (KSHANA_JAMMERTEST_DIR によるデータゲート：記録済みの実行)

seg-bf1156de0226 = compliance

seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); outside the crate: integrations/signalk (JavaScript), integrations/opencpn (JavaScript relay, C++ native plugin), deploy/reference-build (systemd units, container)

seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (ゲートとその TCP リスナー、Rust 側)；integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js and integrations/signalk/test/plugin.test.js (記録した合成出力に対する { "24" } 件の Node テスト)；integrations/opencpn/test/relay.test.mjs ({ "5" } 件の Node テスト)；integrations/opencpn/test/e2e-live.mjs (実際のバイナリから TCP の受信側まで、手動と CI で実行)；integrations/opencpn/plugin/test/pksht_test.cpp and integrations/opencpn/plugin/test/trust_state_test.cpp (PKSHT パーサーとパネル状態の C++ による検査)；deploy/reference-build/check-units.sh and deploy/reference-build/test-entrypoint.sh

seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level)；iq::track::boc の単体テスト (b4_unit_grid_misses_are_the_recorded_ones：事前登録した B4 の単体テストの基準は記載のまま保持し、記録済みの未達を所見 F1 としてアサートする)

seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one：登録した判定を記録どおりにアサート、所見 F1；finding_model_fades_are_deeper_and_longer_than_measured；posthoc_b3_with_the_model_phase_unwrapped：報告のみ；データゲート、scripts/fetch_scint_malindi.sh で取得)；realdata::scint50 の単体テスト (model_data_through_the_harness_shows_the_wrapped_phase_finding、所見 F2)

seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale；c4_noise_free_two_bit_signal_verdict_is_the_recorded_one：登録した判定を記録どおりにアサート、所見 F1、finding_noise_free_sidelobes_exceed_the_cfar_rate で固定)；iq::acq の単体テスト ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands；s2_closed_form_densities_verdict_is_the_recorded_one、所見 F1、finding_s2_areas_are_the_closed_form_in_band_fraction で固定；s3_iq_layer_verdict_is_the_recorded_one、所見 F2、finding_s3_per_bin_errors_follow_the_code_line_spectrum で固定；posthoc_s3_band_averaged_shape：報告のみ)

seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss)；iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found)；tests/lunanet_afs_cli.rs

seg-662887e17adb = standards_pack; compliance (standards-pack facts in compliance-report)

seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes：L4-T1 の未達と四件の IMO 精度テストを含む、すべてのテストのステータス)；standards_pack::tests

seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned)、tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py が導出した数値に対して

seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr)。照合先は xval/crpa-jamming/oracle.py から生成した xval/crpa-jamming/expected.json

seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression)。照合先は xval/jamming-terrain/oracle.py から生成した xval/jamming-terrain/expected.json

seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop)。照合先は xval/jamming-acq-agc/expected_hysteresis.json、expected_hysteresis_s1.json、expected_quantiser.json

seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (the FLL gate)

seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error)、tests/fixtures/fll_handover_floor/results.csv に対して

seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (緯度・経度のエポック、週/TOW と ECEF、dms は拒否、悪意のある入力)；tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log；integrations/gnss_lib_py/test_bridge.py

seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (固定した CRC、ASCII とバイナリのレコード、不正な CRC はスキップ、悪意のある入力)；tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (CRC-24Q のカタログのチェック値、MSM4/MSM7 の C/N0 とエポックの統合、GLONASS 時刻と SBAS ID のマッピング、不正な CRC とその他のメッセージ)

seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (既知の白色雑音係数を { "10" } % 以内で復元、拒否、TOML は AccelCfg として解析される)；tests/receiver_trust_machines.rs (方位の一致と不一致、インラインの搬送波、imu_fit)

seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

seg-21059291ea8b = telemetry::mqtt::tests (パケットのバイト列、ループバックのブローカー、停止したブローカーを数える)；tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log：gnss_lib_py のブリッジが書き出す形式を receiver-trust に通す)；ブリッジの Python テストは、integrations/ros2/kshana_trust/test/test_bridge.py（モックエンジンによるブリッジ）、integrations/ros2/kshana_trust/test/test_engine_integration.py（実際の wheel が、定常的な測位解を nominal、{ "1.1" } km のジャンプを untrusted と採点する）、integrations/gnss_lib_py/test_bridge.py（実際の gnss_lib_py { "1.1.0" } と wheel）で、cargo ではなく pytest で実行します

seg-f9767a6109d5 = hybrid_integrity::tests（コーストは、両方向とも、ハンドオフブロックが報告する共分散のトレースからちょうど始まるため、再生した対角成分が報告済みのハンドオーバーからずれることはありません。報告された交差時刻は、レポート自身のハンドオーバー sigma、プロセスノイズ PSD、カバレッジ係数から再計算され、その直前では境界が警報限界の内側に、直後では外側にあります。コースト時間はプロセスノイズ PSD にちょうど反比例してスケールし、警報限界が厳しくなると短くなります。PSD がゼロのコーストは、ゼロ時間ではなく null を報告します。「決して」は「直ちに」ではないためです。出力されるプロファイルはちょうど 一回だけ交差し、報告された交差時刻を挟みます。分散の倍増時間と警報限界の交差時刻は切り離して固定されており、精密な光学段の後では 八桁、緩い RF 段の後では 一桁以内の差になります。光学モダリティを外れるほうが RF を外れるよりコースト時間が長くなり、その差は共分散の差を水平方向の増加率で割った値にちょうど等しくなります。また random_walk_time_to_limit は、すでに外側にある場合、時刻 t で交差する場合、交差しない場合を区別します）

seg-6d2b55212f40 = lunar_service, antenna

seg-730b359e2c3f = antenna::tests と lunar_service::tests（パターン上で二分法により求めた半値交差は、公表されているエアリーの x = { "1.61634" } と一致し、厳密な { "1.02899" }·λ/D の幅が得られます。これにより、慣例の { "1.02" } 係数は −{ "3.010" } dB ではなく −{ "2.955" } dB に位置することが記録されます。パターンは、ボアサイトから最初のヌルまでの { "400" } 点にわたって厳密に減少します。暗黙の効率の代数は { "1e-12" } まで往復一致し、{ "0.641" } / { "0.920" } を再現します。軸外角は { "20" } 点で tan θ = R·sin γ/(r − R·cos γ) と一致し、両方の極限も { "1e-12" } まで一致します。近似コーンは、行ごとに実ビームを含みます。見出しのカウントは、それが要約する行ごとのフラグと等しく、補正値はその差に等しくなります。各行の判定は、出力されたレポートだけから再計算できます。出力される数値フィールドと真偽値フィールドにはすべて単位と出所クラスがあります。不可能な開口では、ブロックは出力されません。アンテナが未設定の場合、エクスポートは従来の 六つのキーをそのまま保ち、変更された葉は { "0" }、削除された葉は { "0" } です）、tests/validate_lunar_export_offboresight_spice.rs（flown_orbiter_export_matches_spice_geometry_and_scipy_pattern、documented_working_point_matches_anise_propagation_and_scipy_pattern）

seg-9910640b7886 = tracking_loop（sdr、jamming を合成）

seg-a3538a1ff1f4 = tracking_loop::tests（開ループの Costas 弁別器ジッタを、シード付き合成 IF 上で進めた sdr::correlate と照合しています。{ "3" } 回分の雑音実現をプールし、{ "900" } エポックで、35〜45 dB-Hz にわたり { "0.63" }% まで一致します。二乗損失項は、分解可能な範囲ではどこでも、二乗損失のない形より少なくとも { "3" } 倍よく合うことが求められます。約 { "32" } dB-Hz の atan 弁別器の飽和は、述べるだけでなく表明（アサート）されているため、有効範囲の限界は固定されています。閉ループの σ は、{ "4000" } エポックにわたる sdr Costas ループの実行と { "3.7" }% まで一致します。一次 DLL のランプ遅れは、sdr DLL の実行と { "0.17" }% まで一致します。bessel_i0 は表値の I₀ と { "7.4e-8" } まで一致します。ヒステリシス幅は、{ "4" } 通りの比 × { "2" } 通りの積分時間 × { "3" } 通りの帯域幅のすべてで、[{ "5" }·log₁₀ r, { "10" }·log₁₀ r] に収まることが求められます）、api::tests::tracking_loop_kind_round_trips_through_the_dispatch、tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

seg-e6236f142dae = lunar_vlbi_fim（lunar_vlbi、fim、cio、lunar_frame、frames を合成）

seg-5744a8471387 = lunar_vlbi_fim::tests（lib テスト { "7" } 件：すべてのデータム表記は parse/as_str で往復一致し、未知の表記は拒否されます。ビーコンなしですべての局を固定すると、<c1/> を名指しするエラーとともに拒否されます。レバーアームは ρ/B に等しいと表明され、ビーコンの等分配は局の等分配にそれを掛けたものに等しいと表明されます。どちらも { "1e-15" } まで一致し、さらに、この幾何で 二つの予算が混同されないよう、レバーアームが { "10" } を超えるという表明もあります。フィクスチャの公表基線は { "10726.748" } km に固定され、49 サンプルのスケジュールは、相互に可視の観測が { "49" } 未満であることが表明されています。単一基線上のビーコンスペクトルは少なくとも 五桁にわたることが測定され、結果の比は AM-HM により { "1" } を、実際には { "100" } を超えることが表明されています。局とビーコンのレイアウトは、計算されたフィールドが両方とも null のまま、モデル上の比較対象は引き続き報告される、階数不足であることが表明されています。さらに、フィクスチャ自体への保護策があります。テーブル配列の後に挿入されたトップレベルのキーは、代わりに局データになってしまうため、挿入位置が表明され、解析されたシナリオがそのキーを保持していることが確認されます。失敗モードは、テストが名指しするものとは異なる構成を黙って使う実行です）

seg-08708f044bb5 = lunar_dpnt::tests（純粋に加算的なガード：キー集合の差分はちょうど { "{" }correction_link, units{ "}" } であり、既存の値はすべて、変更前に取得したリテラルとビット単位で同一です。測量誤差は基線とともに非相関化しませんが、軌道項は非相関化し、また、軌道項がちょうどゼロとなるゼロ基線でも残ります。これは、その項を誤った場所に配線した場合に検出する構造的な確認です。{ "1" } m の局誤差は { "1" }:{ "1" } で伝達し、DOP で増幅されないことが証明されています。ゼロ遅延では、エイジングのない残差がビット単位で再現され、残差は遅延に対して単調で、出力される曲線は直接の実行と等しくなります。量子化ステップはビットごとにちょうど半分になり、σ² = step²/12 で、フルスケールは注入した大きさに追従します。各項を順にオフにすると、残りの 二つが直交和で回復します。衛星ごとに等しい σ は、ちょうど σ·PDOP に伝搬し、その PDOP は orbit::dop と一致します。出力されるすべてのフィールドには単位と出所クラスがあり、両方向で確認されています）

seg-810a6946b5cd = lunar_station（lunar_dpnt、lunar_service の上）

seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs（one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt：受信機ノイズの有無にかかわらず { "1e-12" } m まで。zero_baseline_floor_is_zero_in_every_trial：{ "0" } から { "1e-9" } m まで。survey_floor_matches_the_survey_transfer_prediction：p95 は実行前に述べた { "5" } % の帯の内側。coverage_is_non_decreasing_in_the_threshold。corrected_error_grows_with_distance_along_an_azimuth。three_satellites_are_unavailable_with_a_reason_and_no_error。a_satellite_the_station_does_not_see_is_reported。deterministic_for_a_seed_and_moved_by_another。the_work_guard_refuses_an_oversized_grid。the_bundled_scenario_states_a_source_for_every_input。the_result_is_labelled_modelled_with_the_honesty_statement）、tests/lunar_station_numpy_oracle.rs（事前登録した numpy による再計算で、未達とともに記録）、lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid、tests/lunar_differential_pnt_reference.rs と、レジストリおよびクロスプラットフォームのゴールデンは変更なし（加算性）、tests/field_units_global.rs（出力されるすべてのフィールドが記述されており、免除なし）

seg-641b41572fd9 = lunar_terrain（skyline、lunar_service::topocentric_basis の上）、lunar_station、lunar_service（coverage_masked、masked_visible）

seg-44e74fb6a0a1 = lunar_terrain::tests（bare_sphere_horizon_is_the_dip：レイマーチは、すべての方位角で -acos(R / (R + a)) を { "1e-3" } deg まで再現します。a_cone_on_a_lat_lon_tile_matches_the_analytic_cone：同じコーンを { "0.005" } deg の緯度/経度タイルにサンプリングすると、解析的なコーンと { "0.25" } deg まで一致します。a_lat_lon_tile_is_none_outside_and_wraps_longitude。crater_in_plateau_matches_the_closed_form：球面上の平らな床のクレーターで、観測者が中心にいる場合と、中心から { "4" } km および { "7" } km の位置にいる場合について、球面のリム交差方程式から得た s を用いた閉形式のリム仰角 atan2((R + H) cos s - (R + a), (R + H) sin s) と、すべての方位角で { "0.01" } deg まで一致します。rasterised_cone_matches_the_analytic_cone：{ "200" } m の極ステレオグラフィックグリッドにラスタライズし、グリッドサンプラー経由で読み取ったコーンは、解析的なコーンと { "0.25" } deg まで一致します。projection_round_trips_through_the_rasteriser_layout。bilinear_reproduces_a_plane_exactly。stated_horizon_goes_through_the_skyline_rules。an_empty_skyline_is_exactly_the_flat_test）、tests/lunar_station_terrain.rs（without_terrain_the_document_has_no_terrain_keys。a_zero_horizon_under_a_positive_mask_is_the_flat_run（両方の種別について）。a_horizon_only_removes_satellites_and_a_wall_removes_everything：user_lt4 は平地の本数を保ち、水平線によって失われるエポックは terrain_masked となり（水平線が、局には見えない衛星を隠すことがあるため、可用性自体は上がりうる）、局での { "89" } deg の水平線では何も可用になりません。bad_terrain_sections_are_refused。the_vendored_crop_loads_and_is_oriented_as_the_source：シャクルトンとハワースのクレーター床は低く、マラパート山塊は高く、鏡像ではありません。the_station_site_horizon_from_the_crop。service_volume_dem_points_outside_the_crop_keep_the_flat_mask。a_lat_lon_dem_tile_gives_the_station_the_crop_horizon：同梱のクロップから再サンプリングしたタイルは、局にクロップの水平線を { "0.22" } deg まで与えます（上限 { "0.5" } deg、実行前に固定）。タイルのエコーと単位が付き、dem_path と dem_tile_path の併用は拒否されます。the_export_site_is_masked_by_the_terrain：エクスポートのすべての行は、可視であり、かつその方位角での地点の水平線以上であるときにだけ、地形をクリアします。幾何は動かず、CSV は地形がある場合にのみ列が増えます。the_horizon_matches_the_preregistered_numpy_ray_cast）、tests/prediction_frozen.rs と、レジストリおよびクロスプラットフォームのゴールデンは変更なし（加算性）

seg-27acdf36c5da = lunar_receiver、lunar_station

seg-8fa2f3da879e = lunar_receiver::tests（multipath_is_the_do229_form。dll_noise_matches_a_hand_computation：{ "45" } dB-Hz、{ "0.5" } Hz、d = { "1" }、{ "20" } ms で { "0.825279" } m。bad_sections_are_refused）、tests/lunar_station_ext.rs（receiver_absent_or_silent_is_the_plain_run。zero_baseline_multipath_is_the_difference_of_two_receivers：サンプル sigma sqrt({ "2" }) a が { "6" } % 以内。station_multipath_is_gauss_markov：ラグ 1 相関 exp(-dt / tau) が { "0.01" } 以内、単位分散が { "2" } % 以内。inter_channel_biases_are_constant_over_a_trial）、tests/prediction_frozen.rs とゴールデンは変更なし（加算性）

seg-304fd4238326 = lunar_station（orbit_growth_range_sigma_m）

seg-c3a151ee3d10 = tests/lunar_station_ext.rs（growth_absent_or_zero_is_the_frozen_error_run。the_growth_term_has_the_closed_form_sigma：増加あり・なしのリンク誤差の差は、{ "1600" } 回の乱数で、サンプル sigma が rate tau / sqrt({ "3" }) の { "6" } % 以内。linear_growth_is_the_first_order_propagated_error：速度誤差 dv を、ツリー内の二体問題積分器でシナリオ軌道から伝搬させると、位置は { "60" } s と { "600" } s で dv tau の { "1" } % 以内で動きます）、tests/lunar_station_published_oracle.rs::k5_growth_addendum_run（無視（ignored）、記録された補遺）

seg-a866350f7eb2 = lunar_solution、lunar_station（solution_figures）

seg-41f22cf8dd08 = lunar_solution::tests（one_epoch_without_height_is_the_snapshot_solve：lunar_dpnt::position_error_vector_from_range_errors と { "1e-8" } m まで等しく、ゆるい高度行は何も変えず、厳しい行は高度誤差を固定します。three_satellites_need_the_height_row。a_window_shares_the_position。bad_sections_are_refused）、tests/lunar_station_ext.rs（the_default_solution_mode_is_the_snapshot_solve：すべての数値が相対 { "1e-6" } まで一致。height_aiding_and_a_window_do_what_they_say）、tests/lunar_station_published_oracle.rs::solution_style_addendum_run（無視（ignored）、記録された補遺）

seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes（記録された数値と登録済みの合格基準の照合）、tests/lunar_station_published_oracle.rs::published_claims_comparison_run（無視（ignored）、リリースビルドで約 { "7" } s：登録済みの六つのケースを再実行し、記録された数値を表明します）

seg-9b655d02dc39 = araim_reference（add_v42_subset_plan、add_v42_protection_levels_to_order）、raim（araim_subset_raim、SubsetRule）

seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs（deeper_orders_change_nothing_when_pairs_suffice。triples_are_refused_at_order_two_and_planned_deeper：N_fault,max >= { "3" }、監視されないリスクは P_THRES 以内、三つ以上の衛星を除くサブセットは監視対象、十を超える監視対象の事前確率は P_no fault q^k として { "1e-12" } まで独立に再導出されます。a_two_satellite_fault_is_found_as_a_pair：故障なしでは警報なし、二つの衛星に { "30" } m のバイアスがあるときは、正規化した分離が最大のサブセットとしてのペアとともに検出されます）、tests/araim_reference_vectors.rs と tests/integrity_araim_stanford_oracle.rs は変更なし（2 次の経路は MAAST で確認済みのものです）

seg-7fa54ce845e3 = clock_integrity（run、sky_at、IntegrityCfg）、scenario（Scenario::integrity）、report（RunResult::integrity_fom）、api（clock dispatch）

seg-b9a184f14d5a = tests/clock_integrity.rs（the_block_is_separate_and_absent_by_default：ホールドオーバーの数値は変わらず、拒否された { "111" } エポックは保護レベルなしで利用不可となり、runs > { "1" } では拒否されます。protection_levels_are_the_snapshot_raims_on_the_same_sky：サンプルしたすべてのエポックの HPL と VPL は、同じプリセットの空での残差ゼロの snapshot_raim とちょうど等しく、故障なしの実行は警報を発しません。a_stated_bias_is_detected_while_it_lasts：{ "60" } m のバイアスは、それが及ぶ { "10" } エポックのちょうどそこで警報を発します。every_integrity_field_has_a_unit）、clock_integrity::tests、clock のゴールデンは変更なし

seg-3ba62864dd31 = cislunar_observability、observability_gramian、intersat_range、cislunar_srif

seg-02de44e48cf6 = cislunar_observability::tests と observability_gramian::tests（既定の文書は、その JSON、サマリー、SVG の FNV-1a によってビット単位で固定されており、明示した既定値が何も変えないこと、および拡張キー八つが不在であることが表明されているため、キャプチャが自己比較に再生成されることはありません。加算的な <c1/> ブロックは、取り除いたうえで、それが存在する前に固定した定数と照らして再ハッシュすることで、凍結の対象から外しており、リリース済みのものが何も動いていないことを、仮定ではなく証明しています。同次の sigma のもとでの階数の不変性は、σ = { "0" }、{ "0.1" }、{ "1" }、{ "10" }、{ "100" } m で表明されています。σ_pos は σ に対してちょうど線形にスケールすることが、相対 { "1e-6" } まで表明されています。DRO の零空間はちょうど z と ż の座標軸であることが表明され、二つの原因が分離されています。同一平面上の宇宙機間の距離行は û_z = { "0" } であり、CR3BP の面外ブロックは z = { "0" } でちょうど分離します。空間ヤコビアンは、中心有限差分、およびこのクレートの独立した3 次元の距離変化率の観測量と照合されています。面外のファミリーは、平面モードでは拒否されます）

seg-455bea44de27 = frame_eop、realtime_frame_eop

seg-faacca83ed58 = frame_eop::tests、realtime_frame_eop::tests、tests/operational_eop_predictor_reference.rs（解析信号の係数の回復は、365 日ウィンドウで { "1e-9" } まで。バイアスとレートのフィットは、実際の行での閉形式の通常最小二乗の傾きと切片に { "1e-12" } まで等しい。発行エポック以降のすべての行の速報 UT1 と極の列を破壊する二つの先読み検出器は、Bulletin B の最終値には手を触れず、ビット単位で同一の出力を要求し、フィットの障壁をちょうど一日緩めると { "10" } 件のテストが赤になることがミューテーションで確認されています。独立に再構築したエポック一覧。対象の Bulletin B ブロックを空にし、エポックが表から外れることを示す。項の採用は、{ "6" }、{ "15" }、{ "150" }、365 日のウィンドウで確認。行数は単調。そして、既定のレポートの変更前に凍結したキャプチャを、許容差なしでフィールドごとに表明し、さらに、キャプチャに新しいキーが含まれていないことも表明するため、自己比較に黙って再生成されることはありません）、tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding、tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding、tests/eop_prediction_beyond_table.rs（最後の行を超える、オプトインの EopSeries::with_ls_ar_prediction 拡張：表内の答えはビット単位で同一、予測行は ls_ar_predict に等しく、表を超える座標系の引数はクランプされず予測に従います。内部整合性）

seg-c77bd56a0619 = lunar_frame_campaign（lunar_vlbi、lunar_vlbi_fim、fim、lunar、lunar_frame_realise、frames、cio、lunar_frame を合成）

seg-98fa9786f0c9 = lunar_frame_campaign::tests（lib テスト { "21" } 件：ヘルマート設計を lunar_frame_realise::apply_helmert の中心有限差分と照合しています。このモジュールはデータムのためのものであり、導関数を計算しないため、[p]ₓ の符号の規約を固定します。{ "84" } 件の設計要素がすべて < { "1e-6" } まで一致します。純粋なネットワークの並進は、他の六つのパラメータへの漏れが < { "1e-6" } の純粋な並進として読み戻されます。データムの sigma は、七つのパラメータすべてで、遅延 sigma の { "3" } 倍の変化に対して { "1e-8" } までちょうど線形です。{ "16" } h の弧は { "24" } h より悪く、{ "48" } h の弧は良いと測定され、出力される秤動の掃引も同じ順序になります。最悪の並進軸は、別に測定した地球への天体固定方向の支配的な軸であり、他より > { "5" } 倍悪いと表明されます。これは、ソルバーに一切伝えていない物理のオラクルです。三つの共線ビーコンは、すべてのデータム sigma が NULL の欠陥を生じ、零方向は七パラメータの基底で出力されます。offblock_fraction とビーコン間相関は、局が固定のときはちょうど { "0.0" }、局を推定するときはどちらも > { "0" } です。比較ブロックの注入変換の数値は、転記ではなく、そのシナリオの独立した実行と相対 { "1e-14" } まで等しいことが示されています。注入/回復したデータムが文書のどこにも現れないことの保護策。月面座標系実現の出力は、作業開始前に指紋を取った、三つの入力形状に対する json‖summary‖svg の FNV-1a-64 によってバイト単位で固定されています）、tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision（ゲート付き。厳格な lunar_frame_campaign_matches_spice_geometry_and_numpy は無視（ignored）のまま）、tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision（所見。創設者の決定 2026-10-02、選択肢 A：この行は MODELLED のままで、別の行の位置づけは借用しません。50 桁の mpmath オラクル（事前登録 804662d5）に対して、エンジンの局推定のデータム sigma は、事前の後退誤差の上限以内にあり、2024-01-01 で { "9.7e-6" } の差があり、{ "1e-9" } の合格基準は、どの倍精度の経路も達成できる水準を下回っていました。最良の NumPy QR 射影でも { "5.5e-9" } の差があります。この証拠は、別の行「Lunar frame datum covariance with the stations estimated, against 50-digit extended precision」を裏付けます）、tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back（固定）、tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios（固定）

seg-f3fcc6b9e10a = cislunar_arc_recovery、batch_ls

seg-457a19842691 = cislunar_arc_recovery::tests と tests/cislunar_arc_recovery_reference.rs（公表されたグリッド上で、二つの境界とその比が固定されています。測定した誤差曲線は、形式的な共分散と行ごとに比較され、行ごとの二倍の上限と幾何平均の上限が課されます。陰性対照（平面 DRO の六状態）は、基準が失敗しうること、および正則化されていない推定器が、もっともらしい小さな誤差を返すのではなく { "1e6" } km を超えて発散することを表明します。パラメータ化への不変性は、すべてのプレフィックスで相対 { "1e-3" } まで表明されています。コメント、文字列リテラル、テストモジュールを取り除いたソーステキストのガードは、ヤコビアン、STM、SVD 階数、SRIF の仕組みへの言及があれば失敗し、禁止された呼び出しを注入することでミューテーションの確認がなされています。テスト専用の確認により、有限差分が解析的な行に等しいことが示されるため、解析的な経路が推定器に存在しない一方で、線形化が正しいことがわかっています。決定性はバイト単位で表明されています。リリース済みの cislunar-observability の文書は、キー集合、正規のフィンガープリント、サマリー行によって固定されています）

seg-b6b73589032f = lunar_ephemeris、lunar_service

seg-4cab37e82f00 = lunar_ephemeris::tests（形式と座標系の解析。ラグランジュ補間はノードで厳密で、ノード外の線形軌跡でも厳密。ICRF の要素は IAU { "2015" } の縮約を受け、明示的な icrf_to_iau_moon の適用とバイト単位で等しい。真近点角↔平均近点角は、順方向のケプラー解法に対して往復一致する。不正な形式のファイルは、理由を名指しして拒否されます）。lunar_service::tests（<c1/> が未設定のとき、レポートのキー集合と SHA-256 は固定されます。ケプラー要素の行は、単独のケプラー実行とフィールドごとに等しくなります。恒等式 σ_required · HPL_max / σ_URE = AL、その後、計算した要件でのエンドツーエンドの再実行は保護レベルの可用性 { "100" } % に達し、それを { "1" } % 上回る値での再実行は達しません。新しい二つのブロックの出力されるすべての数値フィールドは、生成された JSON から、単位と出所クラスを求めて走査されます。コミット済みのフィクスチャは、元の表と衛星ごとに一致します。表の末尾を超える期間は拒否されます）、tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged、tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

seg-34bff3218a01 = tests/field_units_global.rs（登録済みの { "61" } 種別すべてを実行し、それぞれ一つの文書形状で確認します。すべての数値の葉は、その文書自身の units ブロックの項目に解決されなければなりません。不正な形式の項目は、免除かどうかにかかわらずすべての種別で欠落として数えられるため、プレースホルダーでカバレッジを得ることはできません。免除リストは固定した上限を超えてはならず、完全にカバーされていると判明した掲載種別はゲートを不合格にするため、リストを水増しできません。また、ランナーのテーブルにない登録済みの種別は不合格となるため、新しいパックが検討されないまま紛れ込むことはできません。実際に、この作業の開始後に加わった二つの種別の両方を捕捉しました。記述されているが未定義のバックログに対する一方向のラチェット。そして、コミット済みのスキーマ文書に対する陳腐化チェック）、field_schema::tests

seg-926c069f8a2e = lunar_llr（lunar_frame_campaign::beacon_information、schedule_for、solve_datum_information、lunar_vlbi_fim の上）

seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs（empty_or_absent_extra_lists_are_bit_identical：空のリストとベースラインの例は、既定のレポートとサマリーをバイト単位で与えます。an_added_site_never_increases_any_variance：H_after - H_before の最小固有値は、最大固有値の { "1e-9" } まで非負で、after/before のすべての sigma 比は一以下であり、追加された二つの地点はどちらも観測されます。the_rest_of_the_report_is_the_five_array_result。every_station_geodesy_field_has_a_unit。a_beacon_list_inside_the_campaign_block_is_refused）、scenarios/lunar-station-geodesy-baseline.toml と scenarios/lunar-station-geodesy-with-station.toml（同じアーカイブ済みスケジュールと同じ VLBI キャンペーンブロック）

seg-c56512172ce5 = scripts/gate.sh、scripts/check-gate-receipt.sh、scripts/check-repeatability.sh、scripts/install-gate-hook.sh

seg-94641c011229 = tests/source_guards.rs（{ "9" } 件のテスト：ソースツリー全体に対する両方のガード、および各ガードを両方向で採点するミューテーションフィクスチャ。衝突する両方のパスで報告される F22 パターン、出荷済みの原子的シーケンスの修正が受理されること、一意な構成要素を失ったパスでのみ報告される中途半端な修正、一時ファイルのハンドルと継承された一意なディレクトリが受理されること、壁時計が拒否されること。宣言のないピンが報告され、宣言されたものが受理され、除外のないスコープが拒否され、囲んでいるテストのドキュメントコメントでの宣言が受理されて次のテストに漏れないことが示されること。そして、ピンの各表記（十六進、十進、ダイジェスト文字列、バイト長、名前付きのバイト数、ゴールデンファイル）が検出される一方で、アルゴリズム定数、RNG のシード、小さな基数のチェックは検出されないこと）

seg-416def055790 = integrity::composed_pl::tests（単調性、P0 下限、K(IR/2)、指数、下半連続性）

seg-3d4a4ed81148 = integrity::lil_envelope::tests（発散、しきい値、IR による引き締めの支配性）

seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs、tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding（データ依存：BIPM の系列がないときは、メッセージを出してスキップ）、tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding、tests/utck_bound_prospective_oracle.rs（D9 のラウンド { "3" }、前向き、未実行：Circular T { "465" } は 2026-10-12 に現れ、事前登録した 1000 値の規則には約 { "468" } 号までの発行が必要です）

seg-477c4bbb36ab = integrity::hetero_budget::tests（correlated_fused_bias_dominates_independent_when_correlated、rho_one_single_realizer_recovers_linear_sum）+ tests/hetero_budget_reference.rs

seg-75e4936b4c2d = integrity::gls_commonmode::tests（common_mode_shift_inflates_statistic_but_not_contrasts、post_fit_common_mode_statistic_is_zero）+ tests/gls_reference.rs、tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

seg-7bbbfeb6e7b9 = lunar_identifiability、lunar_datum

seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs（single_internal_range_row_has_six_dim_datum_null_space、extending_the_librating_arc_lifts_the_origin_scale_degeneracy）、tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

seg-36da2dd8d3db = lunar_datum、lunar_identifiability

seg-12c2f3ad1982 = lunar_datum::tests（LLR/VLBI/周回機の解析的な偏微分と有限差分の比較）、lunar_identifiability::tests（adding_an_offradial_technique_collapses_the_origin_scale_degeneracy、crlb_diag による横方向と動径方向の比較）

seg-13c488ae75a6 = lunar_llr_geometry::tests（reflector_and_station_catalogs_are_well_formed、analytic_partials_match_finite_difference、llr_one_way_range_is_earth_moon_scale、zero_datum_reproduces_nominal_range、llr_only_fisher_shows_strong_com_x_scale_degeneracy）、tests/lunar_pa_frame_realisation_guard.rs、tests/llr_datum_degeneracy_reference.rs、tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

seg-f741d9570b10 = lunar_gauge::tests（coupled_marginal_well_posed_network_is_psd、coupled_marginal_twoway_equals_more_oneway_in_diverse_network、coupled_marginal_twoway_lift_three_orders、oneway_range_row_has_correct_temporal_entries、twoway_range_row_has_zero_at_offset_and_rate、time_tie_row_equals_pure_offset_vector、rate_tie_row_has_correct_structure）

seg-c4c5426a700b = lunar_techniques::tests（combine_is_additive_order_independent_and_empty_is_zero - 空の選択はゼロ行列を与え、単一の選択は恒等で、ペアは独立に書いた要素ごとの和に等しく、結果は選択順序に対して不変です。adding_a_block_never_reduces_the_degeneracy_metric - 情報を加えたときの単調性。radial_diversity_beats_transverse_for_breaking_the_degeneracy - 月の裏側の周回機のブロックは、横方向の VLBI ブロックよりも縮退指標を大きく引き上げます）

seg-c5ebc071ce3e = lunar_interop_budget::tests（予算に対する単調性、プロバイダーごとの CRLB のもとでの RSS 予算の削減、月面のレバーアームでの回転許容差の計算例、支配項 = 回転）

seg-f4fbaefa3a11 = lunar_interop_budget::tests（CommonEphemeris は予算をゼロにします。CommonFrameTie < PerProvider。irreducible_fraction は実際の分割で > { "0.5" }。規約の順序）

seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable（非ゼロだが階数不足のブロック ⇒ block_spark { "1" }、f_detect { "0" }。独立な列 ⇒ block_spark { "2" }、f_detect { "1" }）、byzantine_real_network_uniform_bias_is_clock_offset（ノードの測定をすべて所有するピア = range(G) に属する時計オフセット誤差で、検出不能であり、明確なグラムのスペクトルギャップを伴う）、byzantine_redundant_net_identifies_at_least_one（独立な単一測定のピア六つ ⇒ block_spark { "7" }、f_identify { "3" }）、byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations（P⊥ = I の手計算ケースが f_detect = block_spark − { "1" }、f_identify = ⌊(block_spark − { "1" })/2⌋ を固定します）

seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored（自己参照ネット：共通レートは N(GᵀWG) にあり、temporal_gauge_dim { "2" }。外部レートタイ行を一つ加えた後：レートはゲージから排除され、共通オフセットが残って temporal_gauge_dim { "1" }）

seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable（共通バイアスは検出不能、差分は検出可能）、slope_infinity_in_range_finite_detectable（g7：b ∈ range(G) では傾き ∞、b ∉ range(G) では有限）、pernode_rank_is_state_dim_minus_eight（§{ "0" }：rank(GᵀWG) = state_dim − { "8" }、8 次元のゲージが零空間全体で、>{ "1e6" } のスペクトルギャップがある）

seg-95c049581604 = telecom_timing（MASKS、eprtc_a_holdover_limit_ns、check_curve、check_mask）

seg-35e253f27caa = telecom_timing::tests（mask_boundaries_follow_the_tables_exactly — 開端と閉端、G.8271.1 表 7-3 の τ = { "400" } s の間隙、表が含意するすべてのブレークポイントでの連続性。a_curve_exactly_on_the_limit_passes_and_just_above_fails。eprtc_a_holdover_envelope_follows_table_3。a_coarse_record_is_not_evaluated_against_a_filtered_mask）、tests/telecom_timing_reference.rs（telecom_timing_kind_round_trips_through_the_dispatch）、tests/telecom_masks_itu_printed_values.rs（mask_values_match_the_numbers_the_recommendations_print、figure_7_2_label_at_1_3_s_is_not_its_own_table_value）

seg-f8b7bc046be6 = telecom_timing（MASKS、Segment::tau_exponent、MeasurementFilter::LowPass10HzAtSource、MaskCondition::Autonomous）

seg-3ae5550f6aaa = telecom_timing::tests（g811_prc_masks_follow_clause_6_1、g812_masks_follow_tables_3_4_6_and_7、g8262_masks_follow_tables_1_3_4_and_5、g8262_1_eeec_masks_follow_tables_1_and_3、a_linear_piece_is_evaluated_without_powf、wander_masks_pass_a_quiet_white_fm_flicker_series、wander_masks_fail_the_same_series_scaled_up）

seg-82af02048968 = clock_log（read_input、MeasuredPhaseReport、MEASURED_UNITS、TELECOM_LOG_UNITS）、telecom_timing（SeriesInput::clock_log）、api（clock kind [clock_log]）

seg-df411365b9ab = clock_log::tests（形式ごとの手書きログ：ヘッダー、区切り文字、単位、周波数の積分、TICC のチャネルとモード、欠測とポリシー、拒否）、tests/clock_log_allantools.rs（事前登録した比較：b1_each_log_reads_to_the_reference_phase、b2_adev_tdev_and_mtie_agree_with_allantools、b3_a_telecom_series_read_from_a_log_equals_the_same_samples、b3_the_clock_kind_measured_block_is_opt_in）

seg-0a789b9f3db1 = clock_log（parse_linuxptp、parse_chrony、grid_timed_offsets）

seg-b1a8738d620b = clock_log::tests（ptp4l_reads_the_locked_offsets_in_ns、linuxptp_reads_only_the_named_program、ts2phc_gap_is_refused_or_filled、linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface、linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps、chrony_tracking_reads_the_local_offset_in_seconds、chrony_statistics_needs_a_source_when_there_are_two、chrony_columns_of_the_other_log_are_not_read、clock_selector_is_refused_for_timelab_and_ticc_only）。対象は tests/fixtures/clock_log/linuxptp_chrony/ のフィクスチャです

seg-5fb2f4812479 = holdover_test（HoldoverTestScenario、recovery、linear_fit）、telecom_timing（check_mask、check_envelope、budget_results）

seg-d028f2b41fe8 = holdover_test::tests（the_record_is_split_at_the_stated_times、holdover_figures_match_a_hand_computation、recovery_is_timed_from_the_restoration、masks_are_measured_on_the_step_their_condition_names、a_record_with_no_baseline_says_so、bad_inputs_are_refused_with_the_reason、the_report_carries_the_label_the_units_and_no_conformance_word、a_ptp4l_log_is_scored_end_to_end）

seg-ea770cfea799 = ssv（constellations、geom、sweep、pattern、check）

seg-9a49009f27cd = ssv::geom::tests（the_grid_has_the_booklets_2562_points_on_the_unit_sphere、the_interval_form_equals_the_general_predicate、a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not）、ssv::sweep::tests（a_small_shell_run_is_internally_consistent、pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not）、ssv::pattern::tests（table_b10_antenna_reads_as_gain_against_angle_from_the_boresight）

seg-05a12f571867 = ssv（limb、weak）

seg-4b5cbdee9714 = ssv::limb::tests（the_chapman_layer_peaks_at_its_height_with_its_density、the_surface_limb_bends_about_one_and_a_third_degrees、plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray）、ssv::weak::tests（longer_integration_lowers_the_acquisition_threshold、aiding_narrows_the_search_and_the_loop、a_conventional_receiver_is_far_above_the_ssv_signal_levels）、ssv::scenario::tests（the_limb_medium_adds_statistics_and_can_cost_signals、a_weak_signal_receiver_replaces_the_fixed_threshold）

seg-89cac0893981 = ssv::nav（run_nav、Ekf）

seg-18bbbb4578fc = ssv::nav::tests（the_filter_converges_where_signals_are_plentiful_and_is_deterministic、the_covariance_is_consistent_with_the_error、without_signals_the_filter_coasts_and_the_gap_is_reported）、ssv::scenario::tests（navigation_and_formation_run_and_report）

seg-59bd0b502622 = ssv::formation（run_formation、RelEkf）

seg-70f8b2a10f03 = ssv::formation::tests（differencing_beats_subtracting_absolute_estimates_and_is_deterministic）、ssv::scenario::tests（navigation_and_formation_run_and_report、formation_needs_navigation_and_one_mode_only）

seg-9f89545da2ca = inertial::cai_error_terms::tests（raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function、white_raman_phase_closed_form_matches_quadrature、short_pulse_band_limited_closed_form_matches_quadrature、cheinet_2008_white_phase_noise_requirement_is_reproduced、delay_term_closed_form_matches_exact_filter_quadrature、defocus_phase_is_position_independent_and_tilt_cancels、curvature_bias_monte_carlo_matches_closed_form、curvature_bias_limiting_cases、classical_aided_resolution_monte_carlo_matches_closed_form、multi_t_resolution_monte_carlo_matches_closed_form、ambiguity_limits_and_inverse）

seg-869454221ef4 = telecom_timing（PRESETS、fit_noise、with_flicker_floor、synthesize_holdover）、models（ClockModel）

seg-2fb7b4c2396c = telecom_timing::tests（every_preset_carries_a_named_datasheet_and_figures、the_noise_fit_envelopes_every_datasheet_point、pure_aging_matches_its_closed_form — 離散的なエイジングのランプが、一日にわたって (1/2)·D·t² の { "0.1" } % 以内、same_seed_same_series_and_hash_different_seed_different_series）、tests/oscillator_presets_measured.rs（caesium_finding_pinned、rubidium_finding_pinned、csac_finding_pinned、ocxo_preset_has_no_measured_record）

seg-d31b872adcb6 = slot_timing（predicted_error_s、breach_after_sync_s、terms_at、slot_budget、ClockNoise::from_datasheet、SlotTimingScenario）、clock_state（ClockClass::Tcxo、Ocxo、Rafs、source）

seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs（{ "10" } 基の GPS Block IIF 衛星クロック、IGS 最終クロックの { "14" } 日間：{ "8" } 基は { "1.5" } の合格基準以内で、G25 と G30 は最大約 2x まで楽観的、固定）、tests/slot_timing_ocxo_holdout.rs（測定した OCXO：ホールドアウトした予測は決して楽観的でなく、測定した逸脱の { "0.59" } 〜 { "0.70" }。サンプル内では { "0.98" } 〜 { "1.17" } 以内。fix 周波数項がなければ、サンプル内の予測はすべてのしきい値で楽観的）、slot_timing::tests（fix_frequency_uncertainty_alone_is_linear_in_time、reduces_to_the_holdover_inversion — すべてのクラスが holdover::holdover_seconds と { "1e-9" } まで一致、white_fm_with_fix_error_has_its_closed_form、flicker_floor_alone_is_linear_in_time、ageing_alone_is_quadratic_in_time、frequency_offsets_add_in_magnitude、the_error_at_the_breach_is_the_guard、datasheet_fit_envelopes_every_point、datasheet_classes_match_their_presets_at_one_second、a_breach_beyond_the_datasheet_is_flagged_as_extrapolated、the_report_carries_the_result_and_a_unit_for_each_field）

seg-a1318b5603cd = orbital_timing（orbital_timing、visibility_half_angle_rad、max_pass_s、crosslink_neighbour_is_outside_footprint）

seg-4c4e4d92c416 = orbital_timing::tests（reduces_to_the_terrestrial_tpl — 時計にフリッカー、白色位相、ランダムラン項がないとき、tpl::timing_protection_level_ns とちょうど一致、leo_geometry_matches_its_closed_forms、crosslink_independence_follows_the_footprint、an_independent_check_caps_the_ramp_before_the_pass_ends、a_crosslink_inside_the_footprint_does_not_count、a_ramp_below_the_reference_is_never_detected）

seg-06c475d7eb73 = spectrum（SpectrumScenario、SpectrumModel::bin_psd_w_per_hz、SpectrumModel::band_state、effective_cn0_multi_dbhz、system_temp_k、Jammer::power_fraction_in、Jammer::duty）

seg-266d9c05d9be = spectrum::tests（agrees_with_the_jamming_kind_chain — J/S は jamming::j_over_s_db と、実効 C/N0 は jamming::effective_cn0_dbhz と、Q = 1/(R_c kappa) で { "1e-9" } dB まで等しく、jamming 種別自身のテストの { "32.105" } dB のアンカーとも一致、noise_floor_is_kt0f、chirp_window_splits_whole_and_partial_sweeps、duty_weights_partial_rows、demo_scenario_runs_and_denies_l1_while_l5_survives、defaults_run_with_no_jammer、bad_inputs_are_refused）

seg-1d43f89b7a30 = ephem（standish_state、StandishElements::state_at_mean_anomaly、Planet::Pluto）、solar_system（position_label）

seg-1af48aec2408 = tests/solar_system_horizons_reference.rs（standish_table1_uranus_and_neptune_exceed_the_nominal_error：公称の経度誤差の { "2.04" } 倍と { "5.16" } 倍で固定され、六倍未満。pluto_from_the_1992_row_is_measured_not_validated：{ "39" } 秒角と { "1.14e9" } m 以内。standish_velocities_track_horizons_to_one_percent：最悪で速さの { "3.7e-3" }）、ephem::tests（standish_velocity_is_the_derivative_of_the_position、pluto_has_no_table2_row_and_no_stated_error）

seg-de8a26ea4d61 = ephem（satellite_state、Satellite、SatelliteMethod、moon_icrf、moon_icrf_velocity）、ephem_provider（AnalyticSolarSystem）

seg-06601f6fb837 = tests/solar_system_horizons_reference.rs（moons_track_horizons_to_the_measured_angles：{ "2000" } から { "2040" } にわたって惑星から見た最悪の角度誤差は、フォボス { "5.65" } deg、ダイモス { "0.38" }、イオ { "0.40" }、エウロパ { "1.63" }、ガニメデ { "0.22" }、カリスト { "0.27" }、タイタン { "3.31" }。geocentric_moon_tracks_horizons：{ "0.046" } deg）、ephem::tests（moons_sit_at_their_mean_distance_and_move_at_their_mean_speed）、ephem_provider::tests（earth_and_moon_balance_about_their_barycentre）

seg-24749f350eb2 = body（Body::by_name、Body::facts、Body::prime_meridian、SOLAR_SYSTEM、BodyFacts）、solar_system（SolarSystemScenario、position_label）

seg-a2ffe20b07aa = body::tests（every_catalogue_body_resolves_by_name_and_carries_its_record、a_zonal_field_is_referenced_to_its_sources_radius、retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate）、solar_system::tests（defaults_report_all_eighteen_bodies_with_tracks、earth_heliocentric_distance_is_one_au_and_period_one_year、a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position、moons_orbit_their_planets_at_their_mean_distance、pluto_outside_its_table_is_an_error_not_a_guess、every_emitted_number_has_a_unit）、tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

seg-0de56af96b3e = body_pnt（BodyPntScenario、formal_sigma、fix_error）、orbit（dop）、batch_ls（gauss_newton）、mars_pnt（chord_clears_sphere）、mars_frame（bodyfixed_to_inertial）

seg-92943f4850b5 = body_pnt::tests（relay_period_is_keplers_third_law_for_the_body、an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface、the_earth_range_never_worsens_the_formal_uncertainty、seeded_fix_errors_are_consistent_with_the_formal_sigma：各 fix 誤差の二乗平均平方根を、それ自身の形式的な sigma で割った値が [{ "0.6" }, { "1.5" }] に入ること、earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic、defaults_run_around_mars_and_every_number_has_a_unit）

seg-17bf1df86b49 = constellation（coverage、ConstellationDesignScenario、beidou_slots、body_by_name）

seg-4d15849bdf7c = constellation::tests（prefilter_matches_brute_force_exactly — すべてのマップとカウンターは、直接の仰角テストによるスキャンと等しい、five_thousand_satellites_on_a_coarse_grid — { "5 000" } 基の衛星で、実行時間と保持したペアテストを出力する、a_clock_per_constellation_needs_one_more_satellite、beidou_geo_and_igso_geometry、lunar_shell_runs_around_the_moon、presets_are_earth_only_and_errors_are_clear、preset_counts）、tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability（回帰チェックのみ）、tests/coverage_dop_full_oracle.rs::finding_is_pinned、tests/coverage_dop_gnss_lib_py_oracle.rs（回帰）

seg-9cb72e60e080 = tpl

seg-b96e16aba41a = tpl::tests（閉形式のオラクル + CUSUM）; examples/tpl_jammertest.rs（JammerTest { "2024" } の実スプーフィング較正）; tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement（所見を固定）; tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs（マップマッチングの CRLB; IGRF-14の場）; mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs（実際の EGM2008 の次数70の場での60分の GPS 拒否ベンチマーク。xval/icgem-egm2008/ で事前登録：一致は { "3106" } m で、< { "500" } m の合格基準は NOT MET であり、未達として明示的に検証しています。{ "70.6" } km のドリフトを十倍低減する基準は MET です。加えて、シード付きの地図誤差モンテカルロ）; altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel と tests/emag2_real_grid.rs（実際の切り出しに対するデータ依存の EMAG2v3 リーダー。これによる航法結果は主張しません）; tests/terrain_slam_rbpf.rs（地図の同時推定、FastSLAM 型の RBPF を、{ "15" } m の相関のある地図誤差のもとで、既知地図の SITAN と { "20" } 個のシードにわたり比較。xval/terrain-slam-rbpf/ で事前登録：平均の改善は { "1.5" }% で、{ "20" } 個中 { "10" } 個で優れていたため、{ "10" }% および20個中12個の合格基準は NOT MET であり、未達として明示的に検証しています。完全な地図では悪化なし、MET）

seg-4bcb7eeb020a = report, scenario; CI（ゴールデン/決定性/SBOM）

seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs（生成した SBOM は、default + python + wasm の機能を含む出荷済みの全66コンポーネントのグラフに対して、公式の CycloneDX { "1.5" } JSON スキーマで検証エラーなしに検証されます。dev-dependencies は除外）

seg-e4edd8fd654c = impairment_eval::tests（AUC：完全=1／同一=0.5／タイ={ "0.125" }、ROC は単調、融合>{ "0.8" }、クラスごとの層分離、リーケージガード、再現可能なコーパス、分布シフトによる楽観性のフラグ）; dominance_demonstrators（到達可能 + 再現可能 + MODELLED-not-VALIDATED + 楽観性ギャップの自己整合）

seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

seg-b30ce36e7afb = impairment_study::tests（クラスごとのオラクル AUC≈{ "1" }、学習済みの楽観性ギャップ>{ "0" }、グリッド形状 + ブートストラップ CI が平均を挟む + 正のスケーリング傾向、ID 特徴量は有限、ギャップ予測器は検出器リーブワンアウトとクラスリーブワンアウトの両方の交差検証で平均予測を上回る + 決定的）; impairment_ml::tests（ロジスティック回帰が分離する + 決定的 + 損失の減少、MLP は線形モデルには解けない XOR を解く + シード付き）; eval_stats::tests（ブートストラップ/DeLong/Spearman/リッジを閉形式と比較）

seg-e0f68f57399d = quantum_trade::tests（ADEV の往復復元、NNLS の非負性、フロアの注意書きの有無、利得>{ "1" }、単調な包絡線 + alt-PNT の上限）; dominance_demonstrators（測定 ADEV はデータ駆動でありフロアを仮定したものではない、仮定クラスはフロアと注意書きを示す、不正な曲線は拒否、MODELLED-not-VALIDATED）

seg-550bd3cee63e = space_weather::tests（Kp↔ap がグリッド点で厳密 + 往復 + 単調、日次 Ap の平均、公表された太陽活動極小/平均/極大と嵐増分のアンカーに対する外気圏温度、基準点で密度が単位値、観測された { "5" }–{ "10" }× の帯に収まる太陽周期の変動幅、シナリオが再現可能 + MODELLED-not-VALIDATED + 範囲外の拒否）; dominance_demonstrators（到達可能 + 再現可能 + 物理的な T + MODELLED-not-VALIDATED）; tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

seg-80847ffc93bf = launch

seg-2095b880eb39 = launch::tests（真東への打ち上げは i=緯度に到達、KSC→ISS = 教科書どおりの { "45" }°、極軌道 = 北/南、i<緯度は到達不可、赤道ボーナス { "465" } m/s、面変更 { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v、日ごとの機会数、シナリオが再現可能/MODELLED + ドッグレッグ経路）; dominance_demonstrators（到達可能 + 再現可能 + KSC→ISS { "45" }° + MODELLED-not-VALIDATED）; tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

seg-c763ac7e3cda = reentry::tests（ピーク g は弾道係数に依存しない + 物理的な g の範囲、γ が急なほど/突入が速いほど増加、ピーク g の速度 = V_e·e^(−1/2) で、ピーク加熱はより速い V_e·e^(−1/6)、ピーク g の高度は物理的であり B が高いほど深い、シナリオが再現可能/MODELLED + 退化した幾何は拒否）; dominance_demonstrators（到達可能 + 再現可能 + V_e·e^(−1/2) の比 + MODELLED-not-VALIDATED）; tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries（クロスチェックのみ）; tests/reentry_point_mass_accelerometer_oracle.rs（ブロック、未実行）

seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

seg-c6fab6332435 = frugal（walker 上）

seg-257dfa053c24 = frugal::tests（手導出のカバレッジ当たりコスト 48/96={ "0.5" }、ROI 比 { "2.667" }、ブラケットの順序 + カバレッジゼロのガード）

seg-412105b0f541 = integrity_impact（raim 上）

seg-35bc1db56d2a = integrity_impact::tests（同じ見逃しでも、文脈が厳しくなるにつれて Available→MI→HMI と変わる；保守的な PL→Unavailable；軸ごとの HMI；入力ガード）

seg-fd95a229bdb3 = inertial::cai_params（inertial::quantum_imu 上）

seg-061a65493a4a = inertial::cai_params::tests（物理的な VRW が、すべての { "3" } レベルで引用した VRW の範囲内に入る；生のフリンジ曖昧性の範囲を k_eff·T² から計算；保守的な予算は最良より大きくドリフトする；すべての範囲に出典があり確認フラグが付く；範囲の順序のガード）

seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests（四つの領域 + 境界値を含む + |error| + PL>AL の使用不可）; tests/tib_scorer_reference.rs（固定の合成サンプル集合での、独立した numpy に対する分類数）

seg-60f627e001ad = src/benchmark/coverage.rs::tests（クリーン/境界が過小/すべて使用不可/空）; tests/tib_scorer_reference.rs（件数 + 率 + coverage_ok を numpy と { "1e-12" } まで比較）

seg-6b48be996d76 = src/benchmark/faults.rs::tests（オフセットのプロファイル、単調なコースト、検出不能集合のフラグ付け、max_offset の整合性、検出不能なクラスがちょうど二つ）

seg-b19cbd364dea = src/benchmark/scorecard.rs::tests（基準の PL は吸収する；壊れた PL は吸収されず、検出もされない；検出可能なカバレッジの判定；検出不能なシナリオに対しては、カバレッジ/検出の判定に到達できないという誠実性の性質）

seg-6d963d838eed = hybrid_integrity::tests（解決済みの構成が、既定値と上書きの両方について、波長をメートルに往復変換することなくエコーされる；すべての単位エントリが単位と出所クラスの両方を持つ；単位ブロックが挙げるすべてのフィールドが実際に出力され、存在しないフィールドを文書化することがない）

seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

seg-188ab5b1b2e9 = hybrid_integrity::tests（可用性は、報告書自身のマージンから再計算した二つの指標の積に等しく、そのマージンも報告書自身の EIRP、自由空間損失、一括損失、性能指標、ボルツマン項、データレート、要件から { "1e-9" } dB まで再構成される；値は { "0" } または { "1" } であると測定され、同じ実行での光の可用性はその間の厳密な内側にあると測定される；各要因の行は、閉じた field_schema の語彙から出所クラスを持つ；報告された閉合距離をリンクバジェットで再実行するとマージンは { "0" } から { "1e-9" } dB を返し、実行時の距離に依存しないことが四桁にわたって測定され、一方、距離利用率は距離比とちょうど同じだけ動く；-40 dBW のリンクは可用性 { "0" }、LOST、そして分数ではなく { "1" } を超える利用率を報告する；置き換えられた「このエンジンは RF 可用性に相当するものを計算しない」という注記は削除されたことが表明され、置換後の注記は新しいフィールドを挙げることが表明される；不正な RF 入力はクランプされずに拒否される）

seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

seg-d3a72a60b237 = hybrid_integrity::tests（比は出力された光側と RF 側の除算に等しく、相対 { "1e-15" } まで一致し、その逆数とデシベル形式も一致する；各側の距離と時間のシグマはちょうど c で関係づけられる；出力された共通構成はシナリオ自身の距離と積分時間に等しいと表明され、RF 側の距離は光側の距離に等しいと表明される；RF 側の C/N0 は可用性ブロックのものとビット単位で同一であり、再導出ではなく一つのリンクバジェットから得られる；同条件比較の性質は表明ではなく測定される -- 共通の積算時間を四倍にすると光側は { "1e-12" } まで、RF 側は { "1e-7" } まで半分になり、比は相対 { "3.19e-9" } まで動かない。これは、密かに別の何かで平均化している側にはできない；rf_dll_bandwidth_hz の上書きが共通の平均化時間を壊すと、両方の時間を挙げた理由とともに比は null になるが、両側は引き続き出力される；一方向の実行は、比較側を公表済みの見出し値とビット単位で同一にし、ペナルティ係数はちょうど { "1" } となり、双方向の実行は、報告書自身の geometric_loss_db から再計算したペナルティ 0.5/sqrt(復路の幾何損失) を { "1e-12" } まで再現する）

seg-7f3efc1e9fa0 = linkbudget

seg-da19fa334661 = linkbudget::tests（三つの帯域、四桁の距離、両方の閉合判定にわたり、マージンとその下の自由空間損失は報告書のみから { "1e-9" } dB より良い精度で再計算される；方程式の項から組み立てた必要 G/T は、G/T からマージンを引いて得た同じ量と一致し、そこで再実行するとマージンはゼロになる；EIRP、損失、しきい値が大きく異なるが、リンク定数が等しい三つのバジェットは同一の要件を与え、定数の { "1" } dB は要件をちょうど { "1" } dB 動かす；利得の分割は雑音温度が示されない限り存在せず、非正の雑音温度は拒否される；単位ブロックが挙げるすべてのフィールドが実際に出力される）

seg-d9742b5a3a48 = lunar_time_budget::tests と lunar_time_budget_scenario::tests（四つのクラスすべてが一回の実行で、また要求された部分集合の順序で出力される；すべての行が自身の閉形式と相対 { "1e-12" } より良い精度で一致する；フレーム誤差を k 倍すると、交差点はフリッカー FM の時計では k 倍、ホワイト FM の時計では k^{ "2" } 倍になり、k={ "2" } と k={ "3" } で確認され、これで二つの雑音クラスが区別される；各行は、バジェットが既に報告した単一時計の交差点を再現する；すべての行が、共有された一つのフレーム項を復元する；未知の時計名は拒否される）

seg-024dfb3684f1 = antenna

seg-7e64cec1882e = antenna::tests と attack_surface::tests（グリッドは完全で、捕捉された割合はすべて [{ "0,1" }] にある；捕捉割合は、すべてのノードで送信電力に対して非減少である；ビーム幅や高度に対しては単調ではなく、これは専用のテストで固定されるため、掃引が後で平滑化されることはない；ベースラインのノードは既存の捕捉割合をビット単位で再現する；リムのみの評価は、完全な掃引の最後の点とビット単位で同一である；特定された交差はしきい値に { "1e-9" } dB まで位置し、挟み込まれている）

seg-d804d9874191 = lunar_time_budget_scenario::tests（{ "57" } 個すべての平均化時間 x { "8" } 個の項が存在し、グリッドのインデックスは { "0" }..={ "56" } で、それぞれ { "8" } 行を持つ；<c1/> の行は、すべての tau で、その隣の七つの項の二乗和平方根に等しい；表はハードコードされたグリッドではなく、要求されたグリッドに従う；出力しても、レポートの JSON はバイト単位で同一のまま）

seg-61e51873ef4b = lunar_time_lab（clock_specs、lunar_time_budget、lunar_time 上）

seg-73a747390b44 = lunar_time_lab::tests（free_run_clock_term_is_the_budget_clock_term：ステアリングをオフにすると、時計項は四つすべてのクラスでバジェットの時計項とビット単位で等しい；bisection_matches_the_closed_form は両方の雑音クラスで相対 { "1e-9" } 以内；threshold_below_the_floor_is_flagged；steering_holds_and_resets；height_term_is_opt_in_and_linear；device_card_reproduces_a_named_class；bad_inputs_are_refused）; tests/lunar_station_time_lab.rs（the_block_is_additive：既定のドキュメント、表、要約は変わらず、ブロックは自身のオブジェクトと単位だけを追加する；time_to_threshold_matches_the_closed_form_through_the_scenario；clocks_are_ordered_over_the_span_where_the_model_orders_them：{ "1" } s から { "7e5" } s まで光学 < PHM < RAFS < miniRAFS。PHM と RAFS の曲線は { "7e5" } s と { "8e5" } s の間で交差し、これは単一雑音タイプの時計モデルについて開示した性質として固定されている；every_time_lab_field_has_a_unit；unknown_time_lab_fields_and_clocks_are_refused）

seg-71c4fb3e4d08 = lunar_vlbi::tests（遠方場の極限は delta_dor と一致；近接場補正；有限差分の偏微分）; tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

seg-1755ed282a7d = earth_gnss_lunar::tests（{ "11" } 件の lib テスト：地球リムの半角を閉形式 asin(R/r) と照合し、さらに、掩蔽されていないすべてのリンクがその円錐の外にあることを表明するので、掩蔽テストとリム角が食い違うことはない；掩蔽判定を、近側、遠側、天体が送信機の背後にある場合で確認；経路損失は、すべてのリンクで、もっともらしい月距離の範囲内に収まる；追尾可能な集合が幾何的に可視な集合の部分集合であり、掩蔽された集合とは互いに素であることを示す；両方向の単調性 - 受信利得を増やしても数は減らず、しきい値を厳しくしても増えない；ボアサイト利得を超える利得を得るリンクはない；地球内部にある受信機は拒否される；掃引がエポックとともに実際に変化することを表明；信号の可用性と測位解の可用性が区別され、正しい順序であり、エポックごとの行と整合することを表明）; tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper（固定）; tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar（固定した所見）

seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs（合格基準 O1：三日間および一周期にわたって連鎖させた状態遷移行列は、相対 { "1e-6" } で scipy DOP853 と等しい；合格基準 C1：平均 q と 95 % 以内の割合；合格基準 C2：各推定器の形式トレースに対する標本；合格基準 C3、NOT MET で固定：{ "3e-10" } m/s2 のモデル化されていない加速度があると、95 % 以内の超過は { "0.0525" } であり、少なくとも { "0.5" } には届かない - 搭載推定値は数百メートルしか分かっておらず、約十メートルの変位がその共分散の内側に隠れる）; lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

seg-2d4d23841d56 = lunar_infra::phase; lambda

seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs（合格基準 Q1：モンテカルロの成功率は、ブートストラップの境界から三標準誤差を引いた値以上；Q2：弧長に対して三標準誤差を超える低下はない；Q4：LAMBDA は、次元が最大五の { "200" } 個の抽出に対して総当たりの列挙と等しい；Q3：浮動解の設計は、アンビギュイティと位置の共分散について、独立した numpy の解と { "1e-9" } まで等しいが、ブートストラップしたレートは { "1e-9" } では NOT MET で固定：LAMBDA の正規 CDF が Abramowitz and Stegun の近似であるため、相対 { "1.7e-6" } 異なる）

seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs（合格基準 F1：CRLB のトレースは上がらず、最小固有値は、例と { "20" } 個のシード付きランダム集合の両方で、周回機とのリンクがあっても下がらない；合格基準 F2：距離の偏微分は、{ "50" } 個の幾何で、ロドリゲスの順モデルの独立した numpy longdouble 有限差分と等しい；合格基準 F3：最小固有値は少なくとも2.0倍上昇し、約111倍が見つかった）

seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs（合格基準 T1：局所タイが緩むにつれて並進シグマは下がらない；T2：技法のシグマを { "1e-6" } 倍すると、各ペアの並進シグマは局所タイのシグマの sqrt({ "2" }) 倍の { "1" } % 以内に入り、{ "3e-7" } 以内で見つかった；T3：情報行列は、独立した numpy の積み上げ組み立てと { "1e-9" } まで等しい）。正規方程式の反転を用いた最初の T2 の実行は未達でした（{ "0.1" } m のタイで { "1.3" } %、{ "1" } m では値がフロアを下回る）。原因は数値的なもので、共分散は、合格基準を再採点する前に平方根経路に移されました。

seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs（合格基準 G1：解析的な偏微分は、各順モデルの中心有限差分と { "1e-8" } まで等しい；G2：5x5 の情報は独立した numpy の組み立てと { "1e-6" } まで等しい；G4：時計の潮汐振幅とその k2 および h2 感度は、独立した評価と { "1e-9" } まで等しい；合格基準 G3 はトレース側で NOT MET、固定：ファミリーを追加しても最小固有値は下がらない（{ "28" } 件中 { "28" } 件）が、追加によってランクが上がったため、擬似逆行列のトレースは { "28" } 件の追加のうち { "12" } 件で上昇した）

seg-2e097e952eb5 = lunar_beacon::tests（地平線の可視性を L01 の閉形式と；ビーコンで増強した DOP を素の DOP と；誤差バジェットの二乗和平方根；DOP からメートルへの関係）; tests/validate_p2_beacon_before_after_table.rs（前後の表全体を、コミット済みのゴールデンに相対 { "1e-9" } で固定）; tests/validate_p2_beacon_before_after_independent_dop.rs（同じ幾何を独立した DOP 経路に通すため、増強が、それを生成したカーネルと照合されることはない）; tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

seg-f8ac8be96a63 = cmpl_horizontal は、ブラインドな共通モードのクラスが寄与する k シグマの水平位置誤差を、blind_position_covariance = S<em>Cov</em>S^T を形成して ENU に射影することで上限評価します。integrity_envelope は hpl_total = hpl_araim + cmpl を報告します。この組が区別するために存在する点：RAIM/ARAIM の残差テストは range(G) の誤差に対して証明可能にブラインドですが、ARAIM の保護レベルはそうではありません - そのフォールトフリー項は、既にそれらを、プロバイダーの URA と公称バイアスまで上限評価しています。したがって CMPL は、単一プロバイダーのプロバイダーごとの URA/ISM が上限評価しない、プロバイダー間の超過分にすぎず、その和は RSS ではなく保守的な三角不等式の上界であり、その超過分が既に URA の内側にない場合にのみ有効です。

seg-9e4affc02b0b = lunar_common_mode::tests（common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split）

seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

seg-e927515cc210 = lunar_combination::tests（地球基線がないとランク不足；三つの基線で完全ランクに回復 — 3局のしきい値は、解の誤差ではなく情報ランクから決まる；局の CRLB は効率 { "0.98" } で推定器が到達；CRLB は基線とともに単調に厳しくなる）; tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params（IS-GPS-800J のインデックス）

seg-d111b6550515 = lunar_afs::codes::tests（最大長レジスター、ルジャンドルのバランス、G2 遅延の往復、ティアの合成）; tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell（LSIS キャッシュなしの場合：四つの引用した数値が所見を固定する；ありの場合：{ "2 937 232" } チップとビットを LSIS Annex { "3" } ファイルと、印刷された最初/最後の { "24" } チップ、ルジャンドルの表 D-1 と E-1、G2 の初期化と比較すると、違う項目はちょうど一つで、表 E-5 の PRN { "147" } の「最後の { "24" } チップ」のセルであり、これは PRN { "151" } のものと重複するが、Annex { "3" } ファイルは生成器と一致する）；厳格な事前登録テスト afs_codes_match_lsis_v1_tables_and_annex3_bit_exact は、そのギャップとともに無視（ignored）されている

seg-8cd700abad59 = lunar_afs::waveform（記録と正解ラベル）, xval/lunar-afs/run_pocketsdr.sh

seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism（三回目の事前登録：{ "2" } ノード、{ "4" } チャンネルを追尾、最悪のドップラー誤差 { "0.57" } Hz、最悪のコードオフセット誤差 { "0.008" } チップ、{ "6" } フレームすべてが、{ "99" } -> { "0" } のラップをまたいで正しい TOI で、サブフレーム { "2" } と一致して復号された；G0 は記載どおりには満たされず、受信機自身の捕捉レコードの実行ごとのばらつき）; tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations（二回目：{ "5" } 件の違反）; tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range（一回目：無効）; 三つのファイルの厳格なテストは、それぞれのギャップとともに無視されている

seg-9b511cb035c0 = gps_lnav, sdr

seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding（固定した所見）; tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly（厳格、ギャップとともに無視）; gps_lnav::tests

seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples（固定した所見）; tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples（厳格、ギャップとともに無視）

seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form（{ "5900" } ブロックのうち { "73" } 個、P_fa { "0.01" } の { "99" } % の二項区間 [{ "40" }, { "80" }] に対して）, m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k（delta { "0.0160" }、比 { "0.0131" }、対 { "0.01" }）, m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0（{ "0" } 対 { "0" }）, the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1（厳格、ギャップとともに無視）; iq::campaign::detect のテスト; iq::monitor::stats のテスト（gaussian_two_sided_tail_matches_known_values）; tests/iq_campaign.rs（固定したダイジェストは、表がなくても変わらない）

seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance（何も減衰させない指定のイベントでの AUC：cn0_drop { "0.500" }、sqm_delta { "0.566" }、power_drop { "0.639" }）; r1_the_cn0_drop_roc_separates_6_db_attenuations（厳格、ギャップとともに無視）; iq::campaign::detect のテスト（the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events）

seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent（各ロックモデルで、PI90 のカバレッジは { "558" } ビンで { "0.891" }、ロス到達時間イベント { "10" } 件で { "0.900" }）, the_report_carries_its_inputs_censoring_validation_and_labels（入力、打ち切り、[validation] のハッシュと判定、単位ブロックの監査）, the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db および bar_b_prime_ci_subset（厳格、ギャップとともに無視）; bar_b_prime_full_set_of_50_campaigns（無視、リリース前に実行）; iq::labfit::cn0 のテスト（厳密な Q-delta の縮退、既定の Q での delta の復元、閉形式のしきい値の逆関数）; iq::labfit::iqfit のテスト（ロックモデルの条件は C/N0 モデルを厳密に再現する）; tests/iq_labfit_followup.rs（1e532f84 で登録したフォローアップ：s1_delta_eff_on_the_stepped_campaign MET、s2_d_as_written_on_the_stepped_campaign は記録した NOT MET を表明、r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET、リリースビルドで）

seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43（固定した所見）; tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters（厳格、ギャップとともに無視）

seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file（{ "2025" } 年3月{ "2" } 日の IGS 放送ファイルの { "32" } 機の衛星：{ "960" } ワード中 { "960" } ワードが RTKLIB のパリティを通過、{ "96" } サブフレーム中 { "96" } 個が復号、復号した放送整数 { "608" } 個中 { "608" } 個が Kshana のものと等しい、すべての入力が量子化幅の半分以内、週と時刻は厳密）; gps_lnav::tests

seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0（固定した所見、データ依存）; tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver（厳格、ギャップとともに無視）; acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

seg-709106f38b9d = acquisition, realdata::ion_sdr

seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq（固定した所見、データ依存）; tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction（厳格、ギャップとともに無視）

seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed（固定した所見、データ依存）; tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler（厳格、ギャップとともに無視）

seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite（固定した所見、データ依存）; tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler（厳格、ギャップとともに無視）

seg-b4e5e57515cc = lunar_dpnt::tests（時計の共通モードは厳密に相殺する；残差は基線とともに増大する；SBAS PL を再利用する；衛星数はビルダーの上限 { "24" } まで尊重されるため、大きなコンステレーションが黙って小さなものを返すことはない）; tests/lunar_differential_pnt_reference.rs（単一差分の残差 + WLS の位置解を、C のソースからコンパイルした RTKLIB の lsq() と比較）

seg-6a567344f386 = lunar_interop::tests（OEM は月の REF_FRAME/TIME_SYSTEM を持つ；時刻メタデータは往復する；KIF エンベロープ）; tests/lunar_interoperability_export_reference.rs（kshana が出力した月の OEM を独立した <c1/> の Python ライブラリで再パース：REF_FRAME/TIME_SYSTEM/CENTER のトークン + エポックごとの状態をフォーマット精度で；破損したエクスポートは拒否される）; tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

seg-921e4d47fd96 = resilience::score::tests（単調性、合成値の境界、レベルの上限、モデルから計算した出所）; resilience::diversity::tests（逆シンプソン、共通モード、SPOF）

seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

seg-0e1bd42aca5a = resilience::stats::tests（ケンドールの tau の手計算例、ディリクレ単体、反転率）; resilience::study::tests（安定性の対照、不安定性の証拠例、宣言対測定、多様性の崩壊）

seg-246c5acb36ac = representativeness

seg-300e70ee2f22 = representativeness::tests（validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, JSON フィールド）

seg-03c943a8f1fc = qtrade

seg-2d5a97db03cb = qtrade::tests（便益の極性 高いほど良い/低いほど良い、実際の TradeResult を忠実にラップする、不誠実な証拠は拒否される、外部の参照と照合して確認済みの FoM には外部のアンカーが必要、決定的な JSON）

seg-fe77856b9e9d = quantum_devices::tests（時計カードは誠実 + 順序づけ済み；もつれの精度 ~1/sqrt(tau)；検出レート -10x/10dB；ダークカウントは劣化させる；系統的フロアの境界；カードはモデルから計算 + 有効）

seg-65f4bc801f94 = timetransfer_chain::tests（精度は積分とともに向上する；量子が勝つことも負けることもある；PL は有限で正；セキュリティ FoM は [{ "0,1" }] にあり、攻撃遅延とともに増加する；異常の Pd は単調；トレードは is_honest）

seg-52d8ccc852f8 = quantum_nav_od::tests（長い途絶では量子が古典を上回る；優位性は途絶に依存する；トレードは is_honest）; tests/gnss_free_quantum_navigation_reference.rs（推測航法の位置の増大を、独立した Octave の二重積分 + Freier-2016 の公表ノイズのアンカーと比較）

seg-8e49ee940482 = quantum_faults::tests（解析的な AUC の既知値；経験的ブートストラップ AUC が閉形式を挟む；量子はより小さな故障を検出する / AUC が高い；巨大な故障では優位性が消える；5 クラスのカタログ；トレードは is_honest）

seg-d0119a3cb762 = geolocation

seg-f85f780a9859 = geolocation::tests（ノイズなしの TDOA の順→逆は { "1e-6" } m まで；J·CRLB=I と対称な正定値共分散；CRLB の位置分散のトレースは、受信機を追加しても増加しない；結合 TDOA+FDOA は移動する発信源の位置 + 速度を復元する；<{ "4" } 受信機は拒否される）; tests/geolocation_reference.rs（3-D の多様性のあるネットワークを持つ四つの幾何での往復；ガウス・ニュートン推定器は自身のクラメール・ラオ境界に到達する — 経験的誤差共分散は { "4000" } 回のモンテカルロ試行で解析的境界に追従する）; tests/geolocation_crlb_published_oracle.rs（ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound と finding_ho_xu_fig7_printed_source_is_not_the_plotted_one、固定）

seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs（Stardust について { "746" } W/cm2 を、合格基準なしで記録する）

seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

seg-998c0585be86 = twstft_budget::tests（双方向の式はオフセットを厳密に復元する；サニャック項は BIPM のループの閉形式と等しい；電離圏項は周波数分割に従い、対流圏は相殺される；フリッカー位相は平坦な TDEV を持つ；日周の残差は半日付近の TDEV を持ち上げる；相反性バイアスはオフセットをずらすが TDEV はずらさない；系列の安定度はレートを除去する）; time_transfer_budget::tests

seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs（独立した mpmath オラクルに対する事前登録した合格基準 A1-A3：{ "216" } 点の Rytov グリッドで最悪の相対誤差は { "3.4e-7" }（合格基準は { "1e-6" }）、シンチレーションは最悪 { "4.5e-16" }、開口係数は最悪 { "5.7e-16" }、{ "96" } 個のガンマ-ガンマのフェード確率は log10 で最悪 { "1.3e-12" }、雲と晴天の光学的厚さは最悪 { "6.6e-16" }）; tests/optical_atmosphere_no_moved_output.rs（合格基準 A5：一括損失のリンクバジェットと既存の局可用性の出力は、{ "1,000" } 個のパラメーター集合にわたり、基底コミットとビット単位で同一）

seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs（合格基準 A4：rho = { "0" } は独立した和集合に、rho = { "1" } は最良の単一サイトに { "1e-12" } まで等しく、サイト数と相関に関する単調性の違反はゼロ；この合格基準の最初の実行は { "3e-9" } 外れました。使用していた正規 CDF が { "1.5e-7" } の Abramowitz-Stegun 形式だったためで、これは実装上の欠陥であり、不完全ガンマの CDF に置き換え、合格基準は変更していません）; optical_weather::tests と optical_sitediv::tests（単調なマージン、閉形式としての雲天井、途絶継続時間の恒等式、マージン探索の反転）

seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs（合格基準 A6：途絶ごとのタイミング誤差は holdover::coast_phase_sigma に、距離誤差は phase_to_range_m に、{ "9" } 個の時計、{ "3" } 個の平均継続時間、{ "3" } 個の広がり、{ "4" } 個の分位点にわたりビット単位で等しい）; optical_outage_holdover::tests

seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs（xval/optical-atmosphere/PREREGISTRATION-timeseries.md の合格基準 T1-T6、最初の実行の前に固定：同じシードでは同じバイト列、別のシードでは別のバイト列；表がなければキーはない；{ "600" } s のステップで { "8760" } h にわたり、シード { "37" } と { "38" } で、三つの既定のサイトそれぞれの実現した可用性は、記載した値の { "6" } ポイント以内（最悪 { "3.3" }）、実現した雲の割合は記載した確率の { "5" } ポイント以内（最悪 { "2.1" }）；マージンはバジェットから二つのフェードを引いたものに等しく、up はすべてのステップでマージンが負でないことに等しい；モジュール内に移植性のない数学呼び出しはない；長すぎる実行と不正なステップは拒否される）

seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK type { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs（実際の MRO の ODF、2007-304/305 を、その PDS ラベルと照合：レコード数、グループの位置、局、開始・終了時刻、データタイプは成り立つ；ファイル末尾の表の行数は一つ外れ、これはラベルの不整合であり、所見として固定）; odf::tests（手作りのレコードの往復、{ "1950" } エポック）; tests/mro_odf_short_arc_od_oracle.rs（データ依存、入力の SHA-256 を固定、実データを必須とする月次 CI：採点対象の DSS { "63" } と DSS { "14" } のパスで、MRO 航法の再構成 mro_psp5 から予測したドップラー、{ "12.5" } mHz RMS、合格基準 { "30" } mHz、満たした；登録した軌道決定は軌道を出さず、所見として固定；減衰付き推定器によるラン { "2" }、別途登録：軌道は mro_psp5 に対して { "0.36" } km RMS、最大 { "0.53" } km、満たした、フィット後のドップラー { "48.6" } mHz、対 { "30" } mHz、満たさず、所見として固定；SPK タイプ { "1" } のリーダーを CSPICE と比較、{ "5e-7" } m）; mars_od::tests

seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds（{ "40" } 個のシード、後半での六自由度の平均 NEES が { "4.5" }～{ "7.5" } 以内）; aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

seg-4da98593fe6a = aperture_duty::tests（次の窓が始まるのとちょうど同時に終わる窓は競合せず、それを一秒早めるとちょうど一秒のコストがかかる -- 一つずれのガード；アパーチャ数を超えて重なる窓は、順位の低いセッションを途絶にし、競合区間を固定する；調停ポリシーがどのサービスがアパーチャを保持するかを決め、三つのポリシーすべての数値を一つのプランで固定する；先着順は、既にアパーチャを保持しているセッションを先取りしない；開始時の調停に負けたセッションは、アパーチャが空いたときに取得する；三つのデューティは、{ "3" } ポリシー × { "4" } アパーチャ数にわたり、利用可能なアパーチャ秒のすべてを説明する；アパーチャを追加しても、どのセッションの途絶も増えず、{ "200" } 個の疑似乱数プラン × { "3" } ポリシー × すべてのアパーチャ数で測定；すべてのセッションに十分なアパーチャがあれば、途絶はまったく残らない；報告の期間はプランを切り詰め、デューティの分母を決める；予測したパスのリストは、別の窓の型を使わずにコンタクトプランになる；同梱のプランのデューティの数値は、アパーチャ一つと二つでのエンジンの出力である；報告書は、その数値を出したポリシーを明記する；報告されるすべての数値は単位と出所クラスを持つ；シナリオは再現可能で、自身を MODELLED と宣言する；シナリオは、スケジュールできないプランを拒否する）; api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

seg-d206adbe8e04 = lunar_jamming::tests（{ "17" } 件の lib テスト：j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number）; api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)

seg-cdcfbbc52ae5 = lunar_jamming::tests（{ "10" } 件の lib テスト：the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits）

seg-83724a2a8e06 = hybrid_integrity::tests（検出力曲線は、故障ゼロでの誤警報率から、最小検出可能バイアスでの { "1" } − P_md まで走る；最小検出可能バイアスを、モニター自身が適用したしきい値で noncentral_chi2_cdf に戻すと、すべての軸と公開ヘルパー経由で、{ "1e-9" } まで P_md を返す；RF 推定値に実際に注入したバイアスは、モニター自身の統計量を、手計算した b²/(σ_rf² + σ_opt²) だけちょうど動かす；ノイズなしのバイアスは √(T/λ*)×MDB を超えると検出され、下回ると見逃され、注入した段階はその交差をまたぐ；検出力は故障の大きさに対して単調で、MDB の倍数では四つの軸すべてで同一；200,000 サンプルのシード付きモンテカルロによるモニター統計量は、曲線上の四つの点で解析的な検出力を 4σ 以内で再現する；タイミングの MDB はタイミングのアラート限界より上に固定されており、これは機能ではなく測定された弱点である；Wilson-Hilferty の分位点は、モニターの厳密なしきい値と約 { "4" }% 食い違うことが測定され、使わなかった理由を記録している；ランプの数値はちょうど MDB/rate であり、レートに反比例してスケールし、非正のレートはゼロではなく null を報告する）; tests/hybrid_fault_power_scipy_oracle.rs（report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas）

seg-e8e0e0618afa = 出典：<c1/>

seg-4cb1d67922ed = 機械で検査される完全なエビデンスの台帳：<b>{ "388" } 行——{ "176" } 行が VALIDATED、{ "208" } 行が MODELLED、{ "4" } 行が PARTNER</b>。行が VALIDATED となれるのは、独立した外部オラクルがある場合だけです（マトリクスの不変条件のテストがこれを強制します）。同じデータは、各テスト、モジュール、コミット済みフィクスチャへの行ごとのクリック可能なリンク付きで、<a1>https://kshana.dev</a1> の<em>検証台帳</em>にあります。モデル計算の各行が外部で検証されていない理由は、<a2>MODELLED-RATIONALE.md</a2> を参照してください。

seg-6e5e0a1e1c99 = allan (lag1_noise_id, lag1_acf)

seg-b04cb81fc402 = tests/clock_library_lag1_noise_id_allantools.rs（{ "140" } ケース：Kasdin のべき乗則記録十本、b = { "0" } から -4、位相データと周波数データの両方、af = { "1" } から { "64" }。alpha_int と d は一致し、最悪の |d alpha| は { "9.6e-13" }、|d rho| は { "4.8e-13" }（基準は { "1e-9" }）。事前登録済み 2ec76864）、allan::tests (lag1_identifies_white_pm_white_fm_and_random_walk_fm; lag1_is_blind_to_a_quadratic_phase_trend)

seg-9c4769edcf2b = osnma (page, subframe, dsm, merkle, signature, tesla, mac, maclt, navdata, verifier, ubx, cli)

seg-af088012df3f = tests/osnma_official_vectors.rs（オプトイン、KSHANA_OSNMA_VECTORS：{ "18" } 個のベクトルセットすべて、{ "186,382" } 個のタグを認証、{ "0" } 個が失敗、セットごとの下限、チェーンの通知、ADKD 0/4/12、アラートの検証、チェーン終了後の認証の再開、チェーンと鍵の失効と新しい公開鍵。オフライン、ベクトルは再配布しません）、tests/osnma_synthetic.rs（攻撃スイート：偽装された遠い将来のサブフレーム、期限切れとデータの結び付け、アラートと使用禁止、ヘッダーの確認、ダミータグ、MACSEQ、鍵の衝突、古いまたは再生された KROOT、検証器を通じた CMAC-AES/SHA3-256/P-521）、osnma の単体テスト（RFC { "4231" }、RFC { "4493" }、FIPS { "197" }、FIPS { "202" }、RFC { "6979" }、CRC-24Q の既知解）

seg-be26fdfb4a7c = allan

seg-a59477833676 = tests/allan_reference.rs（NBS14 を Stable32 に対して { "1e-4" } まで）、allan::tests

seg-b8ed4780ccb7 = tests/cs5071a_reference.rs（実際の 5071A の Cs 対 H メーザー、{ "556 990" } 点、{ "16" } 個の平均化係数を Stable32 に対して { "1e-3" } まで。データゲート付きで scripts/fetch_cs5071a.sh を使用）

seg-17f05fc54f98 = tests/phasedat_reference.rs（Stable32 の PHASE.DAT、{ "139" } 個の平均化係数、OADEV/MDEV/TDEV を { "1e-3" } まで。データゲート付きで scripts/fetch_phasedat.sh を使用）

seg-8c6006055d29 = tests/theo1_totvar_reference.rs（NIST SP { "1065" } §{ "12.4" } の 1000点 LCG データセットに対する Theo1 と TOTDEV、{ "6" } 個と { "6" } 個の平均化係数を allantools { "2024.06" } に対して <{ "1e-9" } まで）、allan::tests（white-FM の閉形式の追従、m={ "1" } での TOTVAR=ADEV の恒等式、Theo1/TOTVAR の位相／周波数オフセット不変性、-1/2 の white-FM 勾配）

seg-ca3c7f74a002 = allan (mtie, mtie_curve)

seg-deb9fe96d3bd = tests/mtie_reference.rs（密閉された NIST SP { "1065" } §{ "12.4" } の 1000点 LCG 位相系列に対する MTIE、{ "9" } 個の平均化係数 m={ "1" }..256 を allantools { "2024.06" } の mtie に対して <{ "1e-9" } まで、観測値は ≤{ "4e-15" }）、allan::tests（手計算によるピークツーピーク、τ に対して単調非減少、純粋なランプでの正確な a·m）

seg-a8f98bb9ff1b = allan (modified_adev, time_deviation)

seg-271a3d6ac7b1 = tests/mdev_tdev_reference.rs（密閉された NIST SP { "1065" } §{ "12.4" } の 1000点 LCG 位相系列に対する MDEV と TDEV、{ "8" } 個の平均化係数 m={ "1" }..200 を allantools { "2024.06" } の mdev/tdev に対して相対 <{ "1e-9" } まで、さらに実系列での τ/√{ "3" } の恒等式）、allan::tests（white-FM の -1/2 勾配、手計算による MDEV の小さなケース）

seg-ad8d37a343f0 = quantum_trade (qparams_from_adev_curve), powerlaw

seg-1df335e6eff2 = tests/optical_clock_adev_reference.rs（Norcia らの ⁸⁸Sr ツイーザークロックの σ_y(τ)、{ "0.92" }–{ "117.76" } s の { "8" } 個の平均化時間を CC-BY-4.0 の下でそのまま同梱。NNLS は曲線を約 { "10" }% の RMS／最悪点で ≤{ "21" }% まで再構成し、復元した √q_wf = { "4.33e-16" } は公表されている 4.7e-16/√τ と一致し、q_rw > { "0" } は測定された赤色雑音の下限）

seg-5efe6e680a2e = araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar

seg-c7fea4d91077 = tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2（{ "270" } 件の実際の幾何のケース、Celestrak の GPS+Galileo と IGS SP3：最悪の |dVPL| は { "2.2e-3" } m、|dHPL| は { "1.1e-3" } m、|dEMT| は { "2.1e-10" } m で、ADD の TOL_PL { "0.05" } m に対する値）、tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding（一様 σ のギャップ、固定）、tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib（実際の IGS ABMF 2018-05-13、{ "288" } エポック、{ "10" } から { "100" } m のバイアスを注入した { "2016" } ケース：2016/2016 の検出と 801/801 の除外の判定が同一、スロープ HPL/VPL は { "1e-6" } m に対して { "2.7e-12" } m 以内）、tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages（実際の WAAS 放送に対する { "2868" } 組のユーザーエポック、同じ保護対象集合、最悪の |dVPL| は { "7.1e-6" } m、|dHPL| は { "1.6e-5" } m で、{ "1e-4" } m に対する値）、tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate（L5 の所見、固定）、tests/igs_real_data.rs と tests/araim_dual_real_data.rs（実際の IGS SP3 と Celestrak の幾何に対する妥当性確認で、オラクルではなく回帰検査として保持）

seg-a58b3968c6b7 = sgp4, propagator, orbit_determination, precise_od

seg-9b9adc7d7cd4 = tests/sgp4_verification.rs（{ "666" } 個の AIAA 検証ベクトル、最悪 { "4.12" } mm）、tests/sgp4_crate_comparison.rs（独立した sgp4 クレート）

seg-1f6277967a05 = propagator, forces

seg-f07882adc2a4 = tests/numerical_cowell_propagator_reference.rs（{ "275" } エポック = { "11" } ケース × { "25" } の毎時の状態、LEO+GTO、Orekit { "12.2" } の DormandPrince853 に対して、保守的なティア T1–T5 の最悪の |Δr| は { "24" } 時間で { "0.08" } m、ドラッグのティアは { "333" } m と特性評価）

seg-0010700556ee = srp_shadow, forces (srp_accel_with_lit_fraction), propagator

seg-2e312ba33e1b = tests/srp_oblate_shadow_orekit_oracle.rs（影の縁をまたぐ { "2400" } 個の幾何、そのうち { "884" } 個は半影、LEO から GEO、太陽赤緯は { "0" } と +-23.44 deg、{ "8" } 個の方位角：最悪の |dnu| は WGS-84 で { "7.41e-9" }、球面ベースラインで { "2.24e-9" }。Orekit の WGS-84 と球面の比は最大 { "0.98" } 異なるため、このセットは扁平率を識別できます）、srp_shadow と propagator の単体テスト

seg-7c521cb02ac6 = srp_boxwing, propagator, precise_od

seg-2d4f28a19e1d = tests/srp_boxwing_orekit_oracle.rs（{ "252" } 個の Galileo 軌道の幾何、近日点と遠日点の距離を含む { "7" } 個の太陽のケース、{ "100" } 個のランダムな姿勢。平板の和は { "1056" } ケースにわたって最悪で相対 { "2.05e-15" }。Orekit 自身の姿勢と圧力を用いたエンドツーエンドでは、{ "747" } 個の全日照のケースで最悪 { "2.39e-15" } であり、一方 Orekit の既定の圧力定数は >= { "4.43e-3" } 異なるため、この比較は定数を識別できます。公称ヨー行列は最悪 { "1.89e-15" }、放射係数の偏微分は最悪 { "1.35e-15" }、パネルごとの偏微分は Orekit の中心差分に対して { "10836" } 個のパネルのケースで最悪の相対 { "4.12e-13" }。ECOM2 の加速度と偏微分は最悪 { "1.74e-15" }）、srp_boxwing の単体テスト（閉形式の極限、有限差分による偏微分）、propagator と precise_od の配線テスト

seg-d23a475337fb = tests/nrlmsise00_reference.rs（{ "720" } 個の格子点、{ "90" } から { "1000" } km、{ "4" } 個の緯度、{ "2" } 個の地方時、{ "3" } 日、低／中／高の活動度：密度は pymsis に対して相対 { "1.866e-6" } 以内、温度は { "1.97e-4" } K 以内、C 移植版とビット単位で同一、公表されている { "17" } 個の C のテストケース、{ "187" } 個の値が有効数字7桁目の { "0.496" } 単位以内）、nrlmsise00 の単体テスト

seg-caf1ae1b5cc2 = forces (density_at, drag_accel_with_density), propagator

seg-1ac527ac9ccd = tests/drag_tier_orekit_oracle.rs（円軌道の { "51.6" } deg、{ "400" } km の低／中／高の活動度と { "300" } km における、{ "24" } 時間にわたる { "4" } ケース × { "25" } の毎時の状態：最悪の |dr| は { "0.0303" } m、|dv| は { "3.36e-5" } m/s で、ドラッグによる変位 { "3.3" } から { "141.8" } km に対する値、最悪の誤差／基準は { "0.003" }。指数関数的な密度の対照は { "119.1" } m 外れます）、forces と propagator の単体テスト（既定ではビット単位で同一、ティアは地球固定の測地点で移植版を評価）

seg-7f91101322d5 = forces (atmospheric_density, drag_accel), propagator

seg-751bc9c9df58 = tests/drag_exponential_gmat_oracle.rs（赤道面のケース E400、E300、E250x600、J2000.0、{ "24" } h にわたる { "25" } 個の毎時の状態：ドラッグによる変位は、{ "21.5" } から { "143.9" } km の変位に対して、GMAT と、基準 { "0.5" } m + { "1e-3" }|D| の最大 { "0.016" } 以内で一致し、+{ "1" } % の Cd*A/m の変化は基準の { "9.83" } 倍に達します。傾斜した I400 のケースは報告しており、{ "10.4" } % 離れていますが、これは明記された高度定義の違いによります）

seg-aa8686f7fb0a = tides (s2_air_waves, atmospheric_tide)

seg-2143047934b5 = tests/s2_air_tide_gfz_table5.rs（{ "21" } 波のうち { "21" } 波が公表されているモデル A2 と一致：最悪 { "0.00050" } cm、{ "0.050" } deg、基準は { "0.0006" } cm、{ "0.1" } deg）、tests/tides_iers.rs（S2 の振幅の帯）

seg-41e949982e14 = propagator (Geopotential, EarthFixedFrame), gravity_sh

seg-0a12253e87b6 = tests/cowell_tesseral_orekit_oracle.rs（{ "6" } ケース x { "24" } h にわたる { "25" } 個の毎時の状態：LEO { "45" } deg、極軌道 { "89.9" } deg、太陽同期 { "98.2" } deg、GTO での EGM2008 8x8 と 70x70、および太陽・月と SRP を含む 70x70。最悪の |dr| は { "0.0355" } m、|dv| は { "3.74e-5" } m/s。負の対照は { "6168" } m（固定した地球）と { "20871" } m（帯球関数のみ）外れます）、propagator の単体テスト（帯球関数の極限の恒等式は { "1e-12" } まで、CIO 座標系は precise_od とビット単位で一致、ヤコビ積分は { "6" } h にわたって { "1e-9" } まで保持）

seg-f75dcdead7a4 = integrator, propagator

seg-a921a1135cd7 = tests/dop853_scipy_oracle.rs（{ "8" } 回の単一ステップ：状態は相対 { "5.55e-15" } 以内、FSAL 導関数は { "3.46e-15" }、稠密出力は { "1.99e-14" }、受理／棄却の判定は同一。rtol = atol = { "1e-12" } での { "3" } 回の全実行（LEO { "58000" } s、e = { "0.7" } で { "5" } 周期、Arenstorf は一周期）：初期ステップは同一、受理ステップは 502/501、390/390、298/298、評価回数は SciPy に対して 6025/6013、5497/5497、4285/4285、終端状態は相対 { "2.95e-13" }（二体）と { "1.58e-12" }（Arenstorf）以内、稠密出力は { "9.5e-13" } 以内。厳密な mpmath の Kepler 解に対する精度は SciPy と等しい（LEO { "8.44e-5" } m、Arenstorf の周期性 { "1.475e-9" }））、integrator と propagator の単体テスト（{ "24" } h の二体を厳密な Kepler 解に対して { "0.1" } m 未満）

seg-c6da65825c67 = kepler, propagator

seg-a8bfc307a73b = tests/kepler_mpmath_oracle.rs（{ "405" } 個の格子点、e は { "0" } から { "0.999999" }、M は [-pi, pi] で { "1e-12" } まで：最悪の |E - E_ref| は { "0.898" } eps|E|、基準は { "8" } eps|E|。{ "9" } 個の巻き付けた M の点は最悪でも基準の { "0.013" }。{ "414" } 個のどの点でもニュートン法の仕上げのステップは不要。ラッパーはビット単位で同一）、kepler の単体テスト

seg-9a2263ce0872 = gravity_pds, gravity_sh

seg-43b33973adff = tests/planetary_gravity_pds.rs（次数20の切り出しは常に実行：最悪の |dg|/|g| は { "9.7e-16" }、摂動の相対値は { "3.4e-11" }。GMM-3 の d/o { "120" } は球面全体で { "3.7e-15" } / { "6.3e-12" }、GL0660B の d/o { "660" } は |lat| <= { "60" } deg で { "5.0e-14" } / { "1.0e-10" }（データゲート付き）。ヘッダーと選択した係数は公表されている PDS プロダクトと等しく、レコード数は { "7380" } と { "218790" }）、gravity_pds の単体テスト

seg-a7e3ecdbd2db = orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)

seg-4adc303e81c8 = tests/batch_sequential_orbit_determination_reference.rs（{ "8" } シナリオ：雑音なしの LEO/MEO/離心軌道/3–4局が { "6" } 件と σ={ "5" } m が { "2" } 件、Orekit { "12.2" } に対して。最悪のバッチ |Δr| は { "1e-3" } m、|Δv| は { "1e-6" } m/s、逐次 |Δr| は { "0.9" } m）

seg-9edf08007870 = radiometric (light_time_solution)

seg-c77ce1873266 = tests/deep_space_mars_radiometric_reference.rs（{ "2020" }–{ "2027" } の { "8" } エポックにわたる { "24" } 区間を ANISE DE440 に対して。最悪の |Δτ| は { "1.03e-9" } s、|Δrange| は最大 { "2.5" } AU で { "0.31" } m）

seg-8c4b011702b8 = rinex (parse_nav, RinexEphemeris::sv_position_ecef)

seg-d202a16aba3f = tests/rinex_sp3_interop_reference.rs（{ "84" } 件の SV-エポックのケース：GPS + Galileo + BeiDou-MEO、{ "12" } 機の SV × { "7" } 個のオフセット、RTKLIB の eph2pos に対して。軸ごとの最悪の |Δ| は { "6.2e-8" } m）

seg-8233e5fa4199 = sp3 (Sp3Interpolator::position_ecef)

seg-4e11ff43fdf7 = tests/sp3_interp_reference.rs（ノード外の { "72" } 件の SV-エポックのケース／{ "6" } 機の衛星を RTKLIB の peph2pos に対して。軸ごとの最悪の |Δ| は { "1.5e-8" } m）

seg-724b7f1d8d6e = ionex (parse_ionex, parse_ionex_file, IonexFile::vtec_at, IonexFile::slant_tec_at, interpolate_tec_in_time, TecGrid::vtec_at)

seg-bec58d3dc51b = tests/ionex_code_gim_oracle.rs（コミット済みの合成 IONEX マップを式の参照に対して：{ "20 075" } 個のノードが完全一致、補間の最大 |Δ| は { "3.5e-13" } TECU。KSHANA_IONEX_CODE_GIM_DIR によるデータゲート付きで、fetch.sh が固定した SHA-256 で取得した、実際の CODE 最終 GIM 2018-05-13 の緯度の切り出しを使用：ノードは完全一致、補間の最大 |Δ| は { "15 795" } 個の標本にわたって { "3.6e-13" } TECU、斜め TEC は { "5.1e-13" } TECU。データゲート付きで、{ "6885" } 個の問い合わせ点における RTKLIB v2.4.2-p13 の iontec に対して、2026-10-13 に実行：最大 |Δ| は両方の時間モードで { "3.6e-13" } TECU、基準 { "1e-5" } は事前登録済み）、ionex::tests

seg-b930d9f826c3 = rtk_real (run_rtk), lambda (resolve)

seg-b182934a1bbc = tests/rtk_real_wettzell_oracle.rs（IGS 局 WTZR 基準局／WTZZ 移動局、{ "1.4" } m、2025-02-24 00-03 h、{ "30" } s：{ "359" } エポック、{ "00" }:{ "10" } から { "100" } % でフィックス、固定基線の誤差の中央値は { "4.5" } mm、p95 は { "5.5" } mm。最初の { "10" } min の固定解は { "2.6" } mm、フロート解は { "13" } cm）、rtk_real::tests

seg-4ca93c8734ba = ppp_real (run_ppp, PppEpoch::clock_m)

seg-3f5cbf55df2d = tests/ppp_time_igs_station_clock.rs（WTZR 2025-02-24、{ "04" }:00-05:{ "55" }、{ "24" } エポック：Kshana と IGS の差の標準偏差は { "0.075" } ns、基準は { "0.20" }。平均は -0.659 ns、基準は { "5.0" }）

seg-3f47749cb7a6 = ppp_real (run_ppp, parse_antex_receiver, solid_tide_ecef, phase_windup)

seg-5e3b87bbbee5 = tests/ppp_real_wettzell_oracle.rs（IGS 局 WTZR、2025-02-24 00-06 h、{ "30" } s、開発には使わず保留：最終エポックの水平は { "1.5" } mm、上方向は −{ "2.9" } cm。04-06 h の 240/240 エポックが 3-D で { "0.10" } m 以内、p95 は { "6.7" } cm。コードのみの p95 は { "1.70" } m。データゲート付きの ZTD RMS は EUREF に対して { "1.7" } cm）、ppp_real::tests、tests/ppp_parity_glab_rtklib.rs（RM-31：同じ入力に対する RTKLIB v2.4.2-p13 の PPP が、240/240 エポックで { "0.05" } m 以内、最終エポックで { "9.7" } mm で一致。これは、RTKLIB の設定に固体潮汐がなくアンテナを基準局のスロットに置いていた二回の実行の後の、三回目の登録におけるもので、その二回はいずれも所見として記録しました。SPP の一致の基準は未達で、中央値 { "1.085" } m に対して基準 { "0.50" } m。gLAB { "6.0.0" } は最初に登録した実行で、修正 { "4" } のコマンドライン：PPP は 240/240 エポックで { "0.05" } m 以内、最終エポックで { "5.0" } mm、SPP の基準は未達で、中央値 { "1.187" } m、これは所見です。二つの参照ツール自身の SPP 解は中央値で { "0.852" } m 異なり、この基準はツール間の一致よりも厳しく設定されていました）

seg-285c8c81e033 = rinex (parse_nav, parse_nav_with)

seg-a0832efb1056 = tests/rinex4_nav_brd400_oracle.rs（2026-07-19 の IGS BRD400DLR_S RINEX { "4.02" } と BRDM00DLR_S RINEX { "3.04" }、00-02 h の切り出し：G { "37" } / E { "478" } / C { "72" } 件のレコードが双方向で一致し、全フィールドが同一、Toe での位置は { "0" } m。丸一日はデータゲート付き：G { "416" } / E { "5668" } / C { "865" } / J { "118" }）、rinex::tests

seg-bc1599eb4b29 = sp3 (Sp3File::clock_s, clock_nodes), precise_products (ClockRinex::from_sp3)

seg-0b017f6fc258 = tests/sp3_clock_igs_oracle.rs（2025-02-24 の IGS 最終 { "15" } min SP3 と IGS 最終 { "30" } s クロックの比較、{ "32" } 機の GPS 衛星：ノードの中央値 |Δ| は { "2.6e-13" } s。{ "3038" } 個の中間点のレコードは RMS { "0.121" } ns、p95 { "0.265" } ns。代わりにノードを保持した場合は RMS { "4.24" } ns）、sp3::tests::clock_interpolation_is_linear_between_valid_nodes_and_exact_at_them

seg-5a2ded5bd597 = fusion::kfgins (run, loaders, score), fusion::closed_loop (propagate_increments, fuse_position_lever_arm), fusion::gnss_ins_ekf (update_position_lever_arm)

seg-5c5f9bc7a90a = tests/fusion_kfgins_dataset_oracle.rs（合成ローダーと回転プラットフォームのレバーアームのテストは常に実行。KSHANA_KFGINS_DIR によるデータゲート付きで、KF-GINS のデモデータセットに対して 2026-10-13 に実行：参照軌跡に対する水平／鉛直の RMS は { "0.0109" } / { "0.0090" } m で、KF-GINS C++ の { "0.0111" } / { "0.0083" } m に対し、事前登録した六つの基準はすべて保持。レバーアームをオフにした場合は { "0.329" } m）

seg-ffaf10c69f30 = interop::testbench (write_motion_csv, write_nmea, export)

seg-25ce559f870b = tests/testbench_gpssdrsim_oracle.rs（{ "6" } 件のテスト：オラクルとシナリオ、エクスポートのバイト列の固定、NMEA と LLH のリーダー、四列の ECEF の切り出し、全幅の CSV でのrun-1 の所見、{ "10" } Hz の行グリッド）

seg-e93e26936fc3 = inertial::mechanization, inertial::attitude, inertial::imu_errors

seg-add45d97ffaf = tests/classical_strapdown_ins_reference.rs（静止／旋回／コーニングのプロファイル、各 { "30" } エポック、NaveGo に対して：姿勢はビット単位で同一で { "0" } rad、速度と位置は名前の付いた解析的な上界以内）

seg-c7a20cc3b4ab = tests/icgem_gravity_reference.rs（GRS80 の合成は Somigliana を { "3.5e-12" } まで再現し、実際の ICGEM EGM2008 の擾乱マップは物理的に妥当）

seg-6e415a0f75f2 = cr3bp (to_moon_centred_icrf, from_moon_centred_icrf, to_moon_centred_icrf_de440)

seg-28bd9e3f225a = tests/cr3bp_to_mci_spice_oracle.rs::cr3bp_to_mci_matches_a_spice_two_vector_frame（{ "72" } ケース：{ "2025" } 年1月の { "12" } エポック x L1 と L2 の点、JPL の Three-Body Periodic Orbits API の二つの L2 南側ハローと一つの DRO の初期状態、および一般的な状態。最悪の位置は { "1.8e-7" } m で、基準 { "1" } mm に対する値、速度は { "1.2e-9" } m/s で、基準 { "1e-6" } m/s に対する値、逆変換は { "2.7e-15" }）、cr3bp::tests::moon_centred_map_round_trips_and_sends_the_moon_to_the_origin

seg-49991cf99411 = solar_system (SolarSystemScenario::planetary_kernel_path, KernelOut); ephem_provider (KernelEphemeris)

seg-dca7500cee83 = tests/solar_system_kernel_oracle.rs::kernel_backed_solar_system_matches_spice（水星、金星、地球、月の 2026-01-01、2030-06-15、2040-12-31 での値：最悪 { "3.3e-5" } m と { "1.0e-11" } m/s で、基準 { "1" } mm と { "1e-6" } m/s に対する値。カーネルのブロックとラベルは完全一致）、tests/solar_system_kernel_oracle.rs::without_a_kernel_the_report_has_no_kernel_block

seg-7a164bdd2e29 = maneuver (porkchop_kernel, PorkchopGrid); ephem_provider (KernelEphemeris)

seg-24424bbd7dd7 = tests/porkchop_de440_oracle.rs::de440_porkchop_matches_spice_and_pykep（地球から火星系重心へ、{ "16" } 個の出発日 2026-09-01..2027-01-29 x { "19" } 個の到着日 2027-06-01..2028-02-26：{ "304" } セルが両側で有限、最悪の C3 は相対 { "2.5e-14" }、V-infinity は { "2.6e-14" }（基準は { "1e-8" }）、C3 最小のセルは同一で { "9.1997" } km²/s²）

seg-90681122a5e8 = maneuver (optimise_transfer_kernel, TransferObjective, TransferType, TransferOptimum); ephem_provider (KernelEphemeris)

seg-945e4a7acbe5 = tests/transfer_optimiser_oracle.rs::transfer_optimiser_matches_spice_pykep_scipy（地球から火星系重心へ、出発日 2026-09-15..2027-01-15 x 到着日 2027-05-01..2028-03-01、Type I/II x 最小 C3／最小 V-infinity：最悪の目的関数は相対 { "8.7e-13" }、日付は { "1e-5" } 日以内、もう一方の量は相対 { "2.5e-7" } 以内で、事前登録した基準 { "1e-7" }、{ "0.01" } 日、{ "1e-4" } に対する値。docs/design/evidence/cap20cd-transfer-optimiser/）、tests/transfer_optimiser_oracle.rs::transfer_optimiser_against_the_published_2026_handbook（二次的な公表済みの参照 NASA/TM-2010-216764 の表 { "2" }：Type II の最小 C3 は { "9.182" } 対 { "9.144" }、Type II の最小 V-infinity は { "2.564" } 対 { "2.565" } で MET。Type I の最小 C3 は { "10.535" } 対 { "11.11" } で -5.18 %、NOT MET であり、未達として明示的に検証され、ライブラリのオラクルは Kshana と一致）

seg-d79a333a38ef = maneuver (lambert_multirev, LambertSolution, LambertBranch)

seg-57940d590f8e = tests/lambert_multirev_oracle.rs::multirev_lambert_matches_pykep_on_the_preregistered_cases（{ "382" } ケース：ランダムな 3-D が { "300" } 件、{ "180" } deg 付近が { "18" } 件、M = { "1" }..3 の最小時間付近が { "24" } 件、太陽中心が { "40" } 件。{ "1058" } 個の解。個数と分枝の順序は一致。速度は相対 { "1e-8" } 以内、最悪 { "1.6e-13" }。最小時間の { "1" } % 以内では { "1e-6" } 以内、最悪 { "7.5e-15" }。Kepler による着地の内部ガードは、e = { "0.994" } の弧での固定された所見一件を除き、すべての解を |r2| の { "4.2e-12" } 以内に着地させます。これは kepler_universal の限界であり、ソルバーの限界ではありません）

seg-67d3c2e5a311 = maneuver (lambert)

seg-5965501f44b7 = tests/lambert_reference.rs（{ "13" } 件の遷移を lamberthub izzo2015 に対して。最悪の |Δv| は { "7e-12" } m/s）

seg-559cbdef5e7b = frames, precession, nutation, cio, timescales

seg-3c23a80630da = tests/frame_reference_vectors.rs（Vallado のエンドツーエンド、SOFA/ERFA のベクトル）

seg-05552ed067f9 = jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)

seg-47eebaccfd86 = tests/jd2_sofa_time_oracle.rs（{ "224" } 個の UTC の時刻：1972-2016 年の { "27" } 回のうるう秒それぞれの前後に六つ、固定が二つ、1972-2026 年にわたるシード付きが { "60" } 個。dtf2d、utctai、taiutc はそれぞれ { "1e-6" } s 以内で、最悪 { "1.9e-11" } s）、jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one)、sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch

seg-5a1b94ecd89e = jd2 (gmst82, From<TwoPartJd>, From<Jd2>); cio (gcrs_to_itrs_matrix_jd2); frames (teme_to_itrf_jd2, itrf_to_teme_jd2); orbit (Propagator::position_in_frame_jd2, own_jd2_utc); ephemeris (EphemerisScenario::two_part_jd)

seg-53fd1421f96e = tests/jd2_earth_rotation_erfa_oracle.rs::two_part_earth_rotation_agrees_with_erfa（{ "40" } 個の二部構成の UT1/TT の日付 1980-2050、うち二つの日付で +{ "1" }、+{ "10" }、+{ "50" } us のステップを含む：gmst82 は { "1e-12" } rad 以内で、最悪 { "0" }。GCRS から ITRS への要素は { "5e-12" } 以内で、最悪 { "2.7e-14" }。+1/+10/+{ "50" } us での回転は ERFA の { "1e-13" } rad 以内で、最悪 { "1.1e-14" } rad。一方、単一の f64 の経路は +{ "1" } と +{ "10" } us のステップを全く捉えられません）、ephemeris::tests::two_part_jd_agrees_with_the_default_and_resolves_microsecond_steps、frames::tests::the_two_part_teme_to_itrf_round_trips_and_resolves_a_microsecond、jd2::tests::gmst82_matches_the_single_f64_gstime_away_from_the_floor、jd2::tests::two_part_types_convert_without_moving_the_instant

seg-dc25004c0845 = precession (precession_matrix); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix_with_offsets)

seg-c3deb78a651c = tests/frames_erfa_vector_oracle.rs::frame_matrices_agree_with_erfa_vectors（1950-2100 の { "40" } 個の TT エポック、dX と dY は最大 { "0.5" } mas：歳差の要素は { "1e-13" } 以内で、最悪 { "0" }。TEME から GCRS は { "5e-10" } rad 以内で、最悪 { "1.10e-10" } rad。オフセット付きの CIO は { "1e-13" } 以内で、最悪 { "0" }。ゼロオフセットは cio::gcrs_to_cirs_matrix とビット単位で同一）

seg-351739161c56 = timescales (tai_minus_utc_on_date); jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc)

seg-e9e659ebde98 = tests/jd2_pre1972_sofa_oracle.rs::pre_1972_utc_conversions_agree_with_erfa（{ "117" } 個の UTC の時刻：1960-1972 の TAI-UTC の式の { "15" } 個の開始点それぞれの前後に四つと、1960-1971 年にわたるシード付きが { "60" } 個。dtf2d、utctai、taiutc はそれぞれ { "1e-6" } s 以内で、最悪 { "2.9e-11" } s）、tests/jd2_pre1972_sofa_oracle.rs::post_1972_results_are_bit_identical（{ "1972" }+ の行の { "224" } 個の時刻はビット単位で変化なし）

seg-65230d78e0c2 = glonass (GlonassEphemeris::sv_clock_bias_s, position_ecef, parse_glonass_nav)

seg-6567510c9726 = tests/glonass_broadcast_rtklib_oracle.rs::glonass_broadcast_clock_and_orbit_match_rtklib（{ "292" } ケース：実際の 2013-01-01 の IGS MGEX 放送ファイルの { "4" } 件の GLONASS レコード x +/-900 s 内の { "73" } 個のオフセット。クロックは { "1e-14" } s 以内で、最悪 { "0" } s。位置は { "0.01" } m 以内で、最悪 { "1.12e-3" } m）

seg-945e951061c2 = sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)

seg-f11a8313d1ec = tests/earth_orbit_path_sgp4_erfa_oracle.rs（区間 { "1" }：コミット済みの { "232" } 個の要素セットの { "4432" } 個の TEME 位置を python-sgp4 { "2.24" } に対して、最悪 { "6.1e-8" } m、基準 { "1" } cm。区間 { "2" }：{ "108" } 個の時刻、そのうち { "23" } 個は地球姿勢パラメーターを伴い、一つはうるう秒の日の最後の一秒で、ERFA に対して：GCRS から ITRS は最悪 { "2.9e-6" } mas、基準 { "0.1" } mas。TEME から ITRS は最悪 { "0.41" } mas、基準 { "2" } mas）、sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch)、tests/no_private_models.rs

seg-5235d736ac3e = navsignal (CodeFamily)

seg-532eb9a2900f = navsignal::code_tests (GPS C/A Gold ≈ −{ "23.9" } dB; φ({ "1023" })/10 = { "60" })

seg-6f9de921ca86 = orbit (dop)

seg-b215ace86be9 = tests/dop_reference.rs（{ "8" } 個の幾何、良条件から特異に近いものまで）

seg-686687c1fa8d = gnss_sim (klobuchar_delay_m)

seg-aee414a8d8ec = tests/klobuchar_reference.rs（仰角／方位角／地方時にわたる { "10" } ケース、二組の係数）

seg-1c1d27c45546 = raim (chi2_cdf, chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile, pbias)

seg-b3663ac963e1 = tests/raim_reference.rs（{ "171" } ケース：χ² の CDF／分位点、正規分布の CDF／分位点、非心 χ² の CDF、P_fa／P_md／冗長度の範囲にわたる pbias）

seg-afe92c4623d2 = SciPy { "1.17.0" }（scipy.stats.chi2/.norm/.ncx2 + optimize.brentq）——独立したライブラリ（Cephes/Boost）で、Kshana の不完全ガンマ級数とは異なるアルゴリズム。相対 ≤{ "1e-6" } で一致。カーネルのみ。ARAIM MHSS の P_HMI 予算の<em>配分</em>は、もはや公表された数値オラクルがない状態ではありません。WG-C ARAIM 技術サブグループ自身の計算例が、別の行「公表された参照ベクトルに対する ARAIM MHSS の保護レベル」を裏付けており、参照自身の TOL_PL = { "5e-2" } m で一致しています。そのため、この行の範囲は統計カーネルで、配分はその行が担います（docs/ARAIM_REFERENCE.md を参照）

seg-116377f12c14 = sbas (sbas_protection_level)

seg-f4fa833999f3 = tests/sbas_reference.rs（{ "6" } 件の実際の EGNOS のエポック：HPL は直接一致、鉛直 d_U は K 係数なしで確認）

seg-2053116957cc = impairment_eval (auc, confusion_at, roc_curve)

seg-f0853f1adeaa = tests/eval_metrics_reference.rs（{ "5" } 個のデータセット、{ "24" } 個のしきい値、カウントは完全一致＋ <{ "1e-9" }）

seg-ee20bf2a4315 = impairment_eval, eval_stats

seg-f546b062df87 = tests/opssat_ad_reference.rs（実際の ESA OPS-SAT、AUC は scikit-learn を { "1e-9" } まで再現）、tests/ai_ml_rf_impairment_detection_evaluation_reference.rs（実際の OPSSAT-AD のテスト分割に対する { "122" } ケース：動作点ごとの完全な混同行列と Pd/Pfa/適合率/F1 を scikit-learn に対して、整数まで完全一致）

seg-c085cbd2a029 = quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)

seg-42b83604390f = tests/scipy_reference.rs（NNLS、動作自由度 ≥ { "48" } での χ²、van-Loan Q）

seg-f571816b43fc = igrf, igrf_data

seg-7bd357bd734a = tests/alternative_complementary_pnt_reference.rs（{ "2520" } 個の全球の点 × 高度を ppigrf @ エポック { "2025.0" } に対して。最悪の |ΔXYZF| は { "3.9e-4" } nT、|ΔD| は { "2.8e-6" }°、|ΔI| は { "3.6e-7" }°）

seg-88c8996b8e2e = quantum_faults, eval_stats, detection

seg-1f37560eef48 = tests/quantum_faults_reference.rs（{ "109" } ケースを scipy { "1.17" } の norm.cdf/ppf と scikit-learn の roc_auc_score に対して。最悪の |Δ| は AUC で { "6.9e-8" }、最小検出可能故障で { "1.3e-8" }、経験的 AUC で { "1.1e-16" }）

seg-7353cfaa51c0 = tests/resilience_score_decision_instability_reference.rs（{ "124" } ケースを scipy { "1.18" } / numpy { "2.4" } に対して：{ "61" } 個の Kendall τ-b は { "2e-16" } まで、順位は完全一致、Dirichlet 平均とパーセンタイルの信頼区間は { "1e-12" } まで）

seg-1c3ad165ae7d = tests/mcda_ahp_reference.rs（Saaty { "1980" } のランダム整合性指標の表 n={ "1" }..10 が完全一致。優先度ベクトル + λ_max + CR を、整合的な { "3" }×{ "3" } と、非整合的な { "3" }×{ "3" } / { "4" }×{ "4" } で SciPy/LAPACK の eig に対して、<{ "1e-9" } まで一致）

seg-ffb971fd45e1 = mcda::wsm, mcda::wpm

seg-f10f7b107cb9 = tests/mcda_wsm_reference.rs（WSM のスコアと順位）と tests/mcda_wpm_reference.rs（WPM のスコアと順位）。いずれも固定した { "4" }×{ "3" } の便益／費用の意思決定行列で、pymcdm に対して <{ "1e-9" } まで

seg-3b78f01d1992 = tests/mcda_topsis_reference.rs（近接係数と順位を、固定した { "4" }×{ "3" } の便益／費用の行列で、pymcdm に対して <{ "1e-9" } まで）

seg-863ebd5e97c5 = tests/mcda_vikor_reference.rs（Q 指標と順位を、固定した { "4" }×{ "3" } の便益／費用の行列で、pymcdm に対して <{ "1e-9" } まで）

seg-faaffee99e67 = tests/mcda_promethee_reference.rs（正味の優越フローと順位、ユーザー基準で、固定した { "4" }×{ "3" } の便益／費用の行列で、pymcdm に対して <{ "1e-9" } まで）

seg-c3c1ab11c426 = tests/mcda_electre_reference.rs（一致、不一致、支配の各行列を要素ごとに、およびカーネル／被支配集合を、固定した { "4" }×{ "3" } の全便益データセットで、pyDecision に対して <{ "1e-9" } まで）

seg-08e153bbaef7 = mcda::waspas, mcda::moora

seg-eafdba85247a = tests/mcda_waspas_reference.rs（WASPAS の選好と順位）と tests/mcda_moora_reference.rs（MOORA のスコアと順位）。いずれも固定した { "4" }×{ "3" } の便益／費用の意思決定行列で、pymcdm に対して <{ "1e-9" } まで

seg-3d6cd006d21f = tests/mcda_copras_reference.rs（効用度と順位を、固定した { "4" }×{ "3" } の便益／費用の行列で、pyDecision に対して <{ "1e-9" } まで）

seg-7fb7df3cd534 = tpl (Cusum), security

seg-7600ece37358 = tests/timing_protection_level_under_spoofing_reference.rs（{ "16" } 件の決定論的な遅延のケースが初通過時間のオラクルに対して完全一致。{ "8" } 件の ARL₁ のケースを、Siegmund 近似と公表されている Montgomery の表に対して、60k 試行のモンテカルロで）

seg-034d00c5844a = holdover (coast_phase_variance, holdover_seconds)

seg-f41c77ef0855 = tests/gnss_denied_clock_holdover_reference.rs（{ "27" } ケースを scipy { "1.18" } に対して：{ "12" } 件の惰行分散を linalg.expm の Van-Loan Q₀₀ に対して、最悪の相対 { "1.1e-15" }。{ "7" } 件のホールドオーバーの逆算を optimize.brentq に対して、最悪の相対 { "1.5e-16" }）

seg-817055dfe79a = resilience::diversity (effective_diversity)

seg-9cad75e722bc = tests/resilience_diversity_reference.rs（{ "17" } ケース：scikit-bio の inv_simpson に対して { "14" } 件と、固定されたゼロの境界が { "3" } 件。最悪の |Δ| は { "0.0" }）

seg-140080386c90 = skyline (Skyline::cut_deg, Skyline::visible); frames (look_angles, is_visible_skyline); orbit (UserPath, sky_view, cofactor_from_los); geometry (sky_geometry)

seg-d4dabd188012 = tests/skyline_orekit_oracle.rs（skyline_masks_agree_with_orekit_and_gnss_lib_py_as_pre_registered：六つの地点と四つのエポックでの { "1173" } 個の視線角、六つのマスク表、{ "142" } 個の可視集合。最悪の |d el| は { "1.3e-13" } deg、|d az| は { "2.3e-13" } deg で、基準 { "1e-9" } に対する値、最悪の |d mask| は { "1.1e-12" } deg で、基準 { "1e-9" } に対する値、可視集合は同一で、{ "1e-6" } deg の境界帯に入るものはなし、最悪の DOP は相対 { "3.3e-13" }、余因子は行列スケールの { "6.6e-13" } で、基準 { "1e-9" } に対する値。事前登録済み e4b9d912）、skyline::tests (table_interpolates_linearly_between_rows; table_wraps_through_north_without_a_seam)、tests/skyline_scenarios.rs (every_wired_scenario_is_byte_identical_to_the_0_35_0_release)

seg-cec96e27c310 = geometry (sky_geometry, ellipse); orbit (cofactor_from_los)

seg-48069ecceb4a = tests/ellipse_numpy_oracle.rs（ellipse_and_cofactor_agree_with_numpy_as_pre_registered：{ "270" } ケース、スカイライン比較でコミット済みの { "142" } 個の可視集合を、共通の一つのクロックの下と、システムごとに一つのクロックの下で。最悪の軸は相対 { "5.1e-13" }、向きは { "5.3e-12" } deg、真円に近いものはなし、余因子は行列スケールの { "1.0e-12" } で、基準 { "1e-9" } と { "1e-6" } deg に対する値。事前登録済み 0bbeeaee）、geometry::tests (ellipse_of_an_analytic_two_by_two_case)

seg-db663720ff55 = sdr

seg-02c8f0d7ea55 = sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal — PRN { "1" }–{ "9" } の最初の10チップが IS-GPS-200 表 3-Ia の八進表記 1440/1620/1710/1744/1133/1455/1131/1454/1626 を完全に再現。ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)

seg-e8e5abbe7b58 = fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)

seg-e941099918ef = fusion::tests（UKF==線形 KF の恒等式、途絶中の惰行、NEES）、tests/gnss_ins_sensor_fusion_reference.rs（{ "50" } ケースを filterpy { "1.4.5" } に対して：線形 EKF の疎結合／密結合と、結合 PNT の事後分布は ≤{ "2.4e-12" } まで。UKF の 40 エポックの実行は最悪 |Δx| が { "1.9e-7" } / |ΔP| が { "9.5e-6" }）、tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego（NaveGo の実際の Ekinox の IMU/GNSS の走行データでの NaveGo v1.4 の疎結合解：水平 RMS は NaveGo の 0.912x、鉛直は 0.940x、位置イノベーションの RMS は 0.861x、正規化イノベーションの平均は { "0.395" }。基準は実行前に固定した 1.2x、1.2x、1.2x と { "1.5" }）

seg-e53182bd8d30 = cr3bp::tests（STM を有限差分に対して）、tests/cislunar_mission_analysis_reference.rs（{ "5" } 個の JPL L2-S NRHO のメンバー：{ "9" }:{ "2" } と { "4" } 個の近傍。最悪の |ΔC| は { "1.5e-5" }、|ΔT|/T は { "9.6e-5" }、ペリルーンは JPL の長さの単位で { "0.7" } km）

seg-4cac09f2382e = gravity_sh, altpnt::maps, gravimeter

seg-d0ee49fda1e0 = tests/icgem_gravity_anomaly_oracle.rs（egm2008_n70_matches_cited_icgem_values は、CI で引用した十個の ICGEM ノードに対して、egm2008_n70_gravity_anomaly_sa_matches_icgem は、取得した 0.25 deg の全格子、チャドの 9-15N 19-25E とデスバレーの 35-38N 242-245E の { "794" } 個のノードに対して：RMS は { "1.3e-8" } と { "2.6e-8" } mGal、最大 { "2.9e-8" } mGal で、事前登録した基準 { "0.005" } / { "0.02" } mGal に対する値、xval/icgem-egm2008/）、gravity_sh::tests

seg-d5b8ca2a48cc = tests/terrain_nav_validation.rs（real_srtm_committed_badwater_tile_reads_real_relief——パブリックドメインの SRTM v3 N36W117 タイルのコミット済みの 6 秒角の間引き版は、北米で最も低い地点であるバッドウォーター盆地を −{ "78" } m に置き、これは測量の範囲 [−{ "95" },−{ "70" }] m の内側で、タイルの実際の約 { "2.2" } km の東側山地の起伏を読み取ります。さらに、N36W119 と N36W117 のコミット済みの 1 秒角 361x361 の切り出しそのままの二つについて、real_srtm_tile_whitney_in_survey_band（{ "4421" } m の測量に対し、範囲 [{ "4380,4430" }] m の中で { "4412.1" } m）、real_srtm_tile_badwater_in_survey_band（[−{ "95" },−{ "70" }] m の中で −{ "78.0" } m）、gdal_cross_check（最近傍ノードは、完全なタイルでの GDAL { "3.8.4" } の gdallocationinfo と、事前登録した { "8" } 点すべてで完全に一致、xval/srtm-ungate/。さらに、手作りの双線形中点と合成フィクスチャのパーサーのオラクル）

seg-d86971b6e158 = oem

seg-f00dd400fa2d = tests/ccsds_oem_interop_reference.rs（{ "24" } 個の状態 / { "2" } 個のフィクスチャを、独立した <c1/> パーサーがバイト単位で同一にデコード、pos/vel Δ = { "0" }）、oem::tests（追加のキーワード・コメント・共分散を含む外部ツールの OEM の解析、完全な状態の書き込み→読み込みの往復、pos+vel+accel の許容、位置のみのものと必須メタデータの欠落したものの拒否、シナリオの往復での高忠実度と外部取り込み）、dominance_demonstrators（到達可能 + 再現可能 + 往復が厳密 + MODELLED-not-VALIDATED）

seg-ab37fdc7a543 = 独立したサードパーティの CCSDS-502 パーサー <c1/> { "0.4.5" }（MIT、<a1>https://pypi.org/project/oem/</a1>）。別個のコードベースであり、kshana が出力する EME2000/UTC の OEM をバイト単位で同一にデコードし（{ "2" } 個のフィクスチャにわたる { "24" } 個の状態、pos/vel Δ = { "0" }）、その厳格なリーダーがメタデータのトークンを確認しています。kshana のパーサーも、同梱した外部の OEM について同様にこれと一致します。誠実な相互運用上の所見が二件あり（oem ライブラリは kshana の衛星ごとの複数セグメントの規約と、複数エントリーの共分散行を拒否します）、テスト内に記録しています。したがって、これが検証するのは適合する単一オブジェクトの交換であり、kshana のあらゆる変種についての CCSDS-502 への完全な適合ではありません

seg-3814a35508eb = eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)

seg-e26317a36469 = eo_payload::tests（高度 { "700" } km での角半径 { "64" }° と高度に伴う縮小、天底→天頂/距離ゼロ、地平線→ε=0/最大中心角、地平線の外側でのエラー、視野角に応じた観測幅の拡大と高度に応じた GSD の拡大、約 { "2750" } km の軌道間隔、シナリオの再現可能性/MODELLED と不正入力の拒否）、dominance_demonstrators（到達可能 + 再現可能 + 角半径 { "64" }° + MODELLED-not-VALIDATED）、tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib（高度 400-1500 km、軌道傾斜角 1-98 deg、視野角の半値 7.5-50 deg、IFOV 10-50 microrad、スルー角 { "30" } および { "89" } deg：すべての量が事前登録した合格基準の範囲内、連続フラグ 168/168）、tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines、回帰テスト tests/eo_payload_coverage_reference.rs

seg-ee8ce4b84732 = space_packet::tests（ヘッダービットが CCSDS-133 のレイアウトと一致、全フィールドのエンコード→デコードの往復、範囲外・切り詰められたものの拒否）、tests/ccsds_space_packet_reference.rs（spacepackets { "0.32.0" } との { "33" } 件の比較、うち { "12" } 件は完全なパケットの比較、不一致のオクテットはゼロ）

seg-6566a3bdb3b4 = space_packet (TimeCode, SecondaryHeader, packet error control, segmentation and reassembly, stream decoding)

seg-f9c3b678f754 = tests/space_packet_ext_oracle.rs（事前登録した五つの合格基準：CRC、時刻コード、ストリーム、欠落と順序、PUS TM、不一致はゼロ）、space_packet::tests

seg-49684da520e1 = spk_writer (SpkSegment, to_bytes, from_bytes, eval, et_from_label, oem_to_spk_segments)

seg-d0468ecef524 = tests/spk_writer_spice_oracle.rs（インベントリ、評価、ビット単位およびバイト単位の同一性、OEM のエポック変換、計画した四つの変異チェックがいずれもこれを失敗させます）

seg-7b7d5c79bcde = spk_writer (SpkType::Chebyshev3, SpkType::DiffLines21, SpkSegment, InterpolatedSpk)

seg-fa6c68bfeb74 = tests/spk_3_21_spice_oracle.rs（インベントリ、双方向の評価、バイト単位の同一性）、spk_writer::tests

seg-2b73bbf7fd60 = adm (AemMessage, ApmMessage, quaternion_a_to_b), ndm_xml

seg-6d6d69a7117e = tests/adm_orekit_oracle.rs（L1 では Orekit が { "33" } 個の Kshana ファイルを読み、L2 では Kshana が { "31" } 個の Orekit ファイルを読み、L3 では { "135" } 件のレコードの回転を比較、所見は固定）、adm::tests、ndm_xml::tests

seg-4fc5845019f2 = odm (OpmMessage, OmmMessage, OcmMessage, Section, OcmBlock), ndm_xml

seg-4dd013dd6b9e = tests/odm_orekit_oracle.rs（L1 では Orekit が { "30" } 個の Kshana ファイルを読み、L2 では Kshana が { "25" } 個の Orekit ファイルを読む、所見は固定され、再発することをアサート）、odm::tests

seg-2e7fd9b81080 = attitude_budget::tests（GG トルクは対称な物体で消え、低い位置ほど大きくなり、ΔI に比例し、RSS の二乗和で合成され、分散の比率の合計は 1 になる）、tests/attitude_gg_torque_reference.rs（{ "20" } 件のケースを、Hipparchus { "3.1" } の linalg で姿勢について数値的に最大化した独立の完全テンソル GG トルク T=(3μ/R³)(n̂×(I·n̂)) と比較、最悪の相対誤差 { "6e-15" }、加えて Wertz/Sidi が公表した O({ "1e-6" }) s⁻² の範囲）、tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk（{ "40" } 件のケースを Basilisk { "2.9.1" } の GravityGradientEffector と比較：ピークは { "45" } deg の姿勢で相対 { "1e-12" } 以内、最悪 { "2.1e-15" }、ケースごとに { "2000" } 個のランダムな姿勢でピークを超えるトルクはなく、{ "3" } つの対角慣性テンソルと { "5" } つの一般慣性テンソル、{ "5" } つの高度）

seg-49b30066ff1b = passes::tests（補間の交差は線形かつ退化に対して安全、極域→中緯度のパス、マスクを高くすると同数以下になる）、tests/ground_station_pass_prediction_reference.rs（{ "22" } 件のシナリオ / { "129" } 件のパスを Orekit { "12.2" } の ElevationDetector と比較、AOS/LOS の最悪 |Δ| { "0.0000" } s、最大仰角 { "0.0014" }°、総アクセス時間 { "0.0001" } s、パス数は同一）

seg-302a5a17401b = passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)

seg-be96bc40b05d = tests/pass_predictor_on_path_orekit_oracle.rs（{ "60" } 件のケース、{ "1210" } 件のパス：AOS/LOS は { "3.4e-6" } s 以内で合格基準は { "5" } ms、最大仰角は { "5.5e-7" } deg 以内で合格基準は { "1e-3" } deg、{ "8979" } 個の見かけの方向は { "8.8e-7" } deg 以内で合格基準は { "1e-4" } deg）、tests/earth_orbit_path_sgp4_erfa_oracle.rs（経路）、passes::tests（p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith、refraction_lengthens_passes_and_light_time_delays_them）、tests/pass_predictor_apparent_orekit_oracle.rs（第 1 ラウンドの所見、固定、orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level）

seg-b985f72dcdf4 = linkbudget::tests（自由空間損失の形、リンク方程式の閉包）、tests/one_way_link_budget_reference.rs（DESCANSO/JPL の Galileo X バンド DCT をエンドツーエンドで再現、加えて DSN の S/X/Ka バンド中心にわたる { "6" } 件の ITU-R P.525 FSL ケース、最悪 |ΔFSL| { "4.6e-3" } dB、|Δcarrier| { "2.5e-2" } dB）

seg-ca02c7483ba8 = lunar_time::tests（閉形式の変化率、往復）、tests/lunar_coordinate_time_reference.rs（LTC の自己ポテンシャルと永年変化率の項を、公表された Ashby & Patla { "2024" } の値と比較、および地心から見た月の速度を JPL DE440 と比較）

seg-7ef514b90798 = frame_eop::tests および realtime_frame_eop::tests（三つの成分すべてが、実際の IERS 抽出データ二件にわたって、等しく要素ごとに同一で厳密に昇順のエポック集合を持つ。二つの Bulletin B ブロックが実際に食い違う場合は結合集合が共通部分に縮退し、共有する行のない予測期間はゼロ埋めではなく省略される。予測と確定値の表が空であることは、欠落したフィールドで暗示されるのではなくドキュメント内に明記される。実際の第二の版があればそこに値が入り、行ごとに照合される。後の版が欠けている場合は、黙って空の表になるのではなくエラーとなる）、tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa（シナリオの表 { "3" }、{ "4" }、{ "6" } をエンドツーエンドで：エポック集合は完全一致、UT1 と極運動の統計は { "1e-9" } 以内、月での合成は完全な ERFA 回転の { "1e-5" } 以内、予測と確定値の各ケースの明記された状態）、tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics（{ "1" } 日から { "90" } 日で Kshana/IERS が { "1.001" } から { "1.100" }）、行の集計：tests/embedded_eop_vintage_astropy_preregistered.rs（オフライン入力の行）、第 1 ラウンドの回帰：tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not

seg-8d703fef00d5 = realtime_frame_eop, eop

seg-41f91517a4bb = tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a（六つの厳密な基準：抽出データのバイト、{ "174" } 行、版ごとの件数と完全な MJD リスト 30/54/90、極運動と UT1 の両方で予測された全行のフラグ P、既定の実行の集計、予測された全行が IERS Bulletin A Vol. XXXIX No. { "039" } と最後に印字された桁以内で一致、最悪 { "5.0e-5" } arcsec と { "4.9e-6" } s）、tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy（フラグ分類器の下での旧 32 行の抽出データの回帰固定：確定 { "20" }、速報 { "12" }、予測 { "0" }）、tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy（第 1 ラウンドの所見、保持）、realtime_frame_eop::tests、tests/operational_eop_predictor_reference.rs

seg-d25312c585d1 = lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel

seg-1caf84a930c6 = tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000（J2000 付近の { "25" } エポックにおける DSS-14、DSS-43、DSS-63 に対する { "75" } 個の遅延：遅延は { "1" } ps 以内、最悪 { "0.06" } ps、天体固定座標系のビーコン偏微分は { "1e-6" } 以内、最悪 { "7.4e-9" }、ITRF93 の局偏微分は { "1e-6" } 以内、最悪 { "3.8e-11" }）、tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged、tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference（カーネル評価のクロスチェック）、tests/naif_kernel_reader_check.rs、lunar_vlbi::tests

seg-5140b9231f4b = naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)

seg-3747d76d3c5c = tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid（1849-2150 年の { "200" } エポックにおける { "600" } 個の de440s.bsp の状態と { "200" } 個の MOON_PA_DE440 の回転、および事前登録のコミット自身のハッシュから選んだランダムな天体の組を、NAIF のものとビット単位で同一の切り出しカーネルで SPICE および ANISE と比較：最悪の差は合格基準の { "0.6" } %、絶対値で { "1.95e-3" } m）、tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present（完全な NAIF ファイルでの同じ比較、SHA-256 を確認、データがある場合のみ実行）、tests/naif_kernel_reader_check.rs（エンジニアリング上のガードであり、エビデンスではありません）、naif_kernel::tests、ephem_provider::tests

seg-92c70de528b4 = lunar_common_mode::tests（{ "8" } 件のライブラリテスト：分割は加法的で dy を再構成する、共通モードの共分散は正の共通モード保護レベルを与え、パリティのみの共分散はほぼゼロの保護レベルを与える、射影は range(G) を消去する）、tests/lunar_common_mode_integrity_reference.rs（コミット済みの 366 エポックのサンプルについて、バイト単位で同一の入力で、エンジンの分割を独立した numpy の計算と比較、相対誤差と絶対誤差の両方が { "1e-3" } 未満）、tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs（8 衛星の配置と、実際の二組の天体暦間の 6 衛星の部分集合における { "1464" } 件のパリティを含むケース：blind_dx、残差、ノルムは |dy| の { "1e-12" } 以内、最悪 { "1.06e-14" }）

seg-5cd36a6d71b9 = lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)

seg-63056b57baab = lunar_combination::tests（シミュレートした真値を復元する、VLBI は局の 3 次元可観測性を回復する、決定論的）、tests/lunar_joint_multi_technique_od_reference.rs（{ "6" } 通りの配置 × { "16" } 個のパラメーター、各 { "31" } 個の観測を、同一の観測に対する Orekit { "12.2" } / Hipparchus の Levenberg-Marquardt と比較、復元した状態の最悪 |Δ| { "1.4e-8" } m）、tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy（VLBI のない一つを含む六つのネットワーク：ガウス・ニュートンのステップは { "4.3e-11" } 以内、形式的なシグマは { "1.9e-11" } 以内、局の誤差は等しい。{ "0.36" } のポータブルな数学入力では { "2.4e-11" } と { "1.3e-11" }、{ "0.30" } の入力では同様）

seg-ef4de80a0e79 = fim

seg-6a5729ed13c5 = tests/fim_observability_reference.rs（固有値を numpy.linalg.eigh と、CRLB 共分散を numpy.linalg.inv による σ²(XᵀX)⁻¹ と、情報行列から求めた GNSS の GDOP/PDOP/HDOP/VDOP/TDOP を numpy と比較：すべて { "1e-9" } で一致）、fim::tests（ヤコビ固有値ソルバーを閉形式のスペクトルと、CRLB を Kay { "1993" } の閉形式である WGN 中の DC の σ²/N と直線フィットの σ²(XᵀX)⁻¹ と、モンテカルロによる CRLB の達成、ムーア・ペンローズ恒等式 MM⁺M=M、データム欠陥の零空間）

seg-454f4440a5c8 = lunar_frame_realise::tests（注入したヘルマート変換を復元する）、tests/lunar_reference_frame_realisation_reference.rs（{ "14" } 件のケースを独立した閉形式の Umeyama-SVD ソルバーと比較、並進の最悪 |Δ| { "2.0e-5" } m、回転 { "5.3e-12" } rad、スケール { "9.3e-2" } ppb、フィット後の RMS { "6.1e-9" } m）

seg-86ded53b2aac = lunar_service::tests（DOP は検証済みのカーネルを再利用する、保護レベルは南極のケースに帰着する）、tests/lunar_navigation_service_volume_reference.rs（グリッド×エポック全体の掃引にわたって、衛星ごとの MCI 位置を <{ "1e-3" } m で、可視衛星の集合を完全一致で、ANISE { "0.10.2" } と比較）

seg-01d0c0630ded = lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame

seg-38c8b9bffaf9 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim（{ "210" } 個の AFS-Q プライマリコードは常時、KSHANA_LANS_RUN と LSIS キャッシュがあれば { "630" } 個すべてのコード、チップの不一致はゼロ）、tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim（LSIS キャッシュがある場合：{ "3" } 個のフレーム、シンボルの不一致はゼロ、コミット済みの { "24" } 個の { "2" } ms ウィンドウ、|rho| = { "0.999990" }）、tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim（データがある場合のみ実行：{ "23.9" } s の全体の実行、|rho| = { "0.999990" }、最悪の { "2" } ms ブロック { "0.999948" }、位相 { "8e-9" } rad）

seg-67eae9b2de36 = lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis

seg-e73c88408052 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim（LSIS キャッシュがある場合：同じ FID、TOI、データビットから構築した、LANS-AFS-SIM が送信する { "3" } 個のフレーム：{ "18 000" } 個のシンボルのうち相違はゼロ）、tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact（LSIS の図 { "8" }：0x045 -> 0x229f61dbb84a0、CRC-24/LTE-A のチェック値 0xCDE703、常時実行）、tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices（{ "100" } 個の符号語、印刷された H の未充足チェックはゼロ）、tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame（H のみからのデコーダー、ノイズなしと { "3" } dB の Es/N0、および { "10" } 個の完全なフレーム）、lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b、lunar_afs::frame::tests

seg-7c4e5dff6562 = iq::scene (Scene, SatGeometry, TruthRecord)

seg-ba9337fe40c0 = tests/iq_gpssdrsim_cross_generator.rs::scene_geometry_matches_gps_sdr_sim_channels（{ "11" } チャンネル：疑似距離の最悪値 { "1.6e-3" } m（基準 { "0.05" } m）、コード位相 { "5.5e-6" } chip（基準 { "2e-4" }）、ドップラー { "7.4e-5" } Hz（基準 { "0.02" } Hz）、見通し角 { "4e-9" } degree（基準 { "1e-4" }）、可視集合は同一）、tests/iq_gpssdrsim_cross_generator.rs::harness_reproduces_the_gps_sdr_sim_program_channel_listing（オラクルのハーネスがプログラム自身の印字するチャンネル一覧を完全に再現）

seg-80e62d2d7748 = lunar_service::tests（手計算した幾何に対するトポセントリックな値：真上、真北/真東/真西、対蹠点、および退化した極での東方向。出力される可視フラグは { "6" } h の全掃引にわたって独立した可視性フィルターと一致する。出力は既定でオフであり、他には何も変えないことが証明される。保護レベルは、下位の幾何に手を加えない限り、公開されたシグマに対して厳密に線形である）、tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites（{ "8" } 地点、{ "12" } エポック、{ "8" } 衛星の { "768" } サンプルを ANISE { "0.10.2" } と比較：方位角と仰角は { "1e-6" } deg 以内、距離と地点の位置は { "1" } mm 以内、最悪は { "2.2e-12" } deg、{ "2.1e-13" } deg、{ "5.6e-9" } m）

seg-5613845e8514 = attitude_dynamics::tests（適用/解の逆、球形コマのトルクはゼロ、主軸の不動点、短時間の実行でのエネルギーと運動量の保存、q̇=½q⊗ω、対称コマの回転率の符号と物体円錐の歳差）、tests/attitude_dynamics_reference.rs（{ "200" } 000 ステップのトルクフリー実行：|q|={ "1" } を { "1e-10" } まで、運動エネルギー T=½ωᵀIω を相対 { "1e-9" } まで保存、|Iω| と慣性系の運動量ベクトルを相対 1e-9/1e-8 まで保存、三軸と一般の非対角の慣性の両方で。対称コマのオブレートとプロレートの物体円錐の歳差を、解析解 λ=ω₃(I_a−I_t)/I_t に対して { "1e-6" } まで再現）、tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk（二つの一般の非対角慣性、{ "1e4" } s のトルクフリー運動を RKF78 の Basilisk { "2.9.1" } スペースクラフトハブと比較：クォータニオンは { "1e-9" } 以内、最悪 { "3.3e-11" }、機体角速度は { "1e-9" } rad/s 以内、最悪 { "3.4e-12" } rad/s）

seg-c7acd78b6a27 = cw_dynamics (propagate, second_order_correction, propagate_second_order)

seg-8edf60f6eb8c = cw_dynamics::tests（Φ({ "0" })=I、クロストラックは分離した単振動）、tests/cw_dynamics_reference.rs（閉形式の Φ を、同じ Hill 方程式の独立した固定ステップ RK4 積分と軌道の三分の一にわたって <{ "1e-6" } で比較、Φ(t)Φ(−t)=I を { "1e-9" } まで、有界条件 ẏ₀=−2n·x₀ は 一周期後に全状態を { "1e-9" } まで閉じ、{ "10" } 周回にわたって along-track の永年ドリフトはなく、純粋な半径方向のオフセットは 一周回あたり解析的な −12π·x₀ だけドリフトする）、tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm（{ "500" } km 軌道の三分の一にわたる { "100" } m の四ケース：最悪 { "1.15e-7" } m（基準 { "1e-3" } m））、tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding（線形の Φ のみの場合：{ "1.2" } から { "6.3" } mm、固定）

seg-9d7e00484999 = entry_eo_ascent::entry_heating (simulate_entry, inertial_to_relative, EntryHeatingScenario)

seg-e9749b2960a2 = tests/entry_stardust_published.rs（ピーク { "35.44" } g を公表値 { "33.4" } g と比較、+{ "6.1" } %、基準 { "10" } %、惑星相対の突入速度 { "12.551" } km/s を { "12.6" } と比較、基準 { "0.1" } km/s）、entry_eo_ascent::entry_heating::tests（回転系のエネルギーは抗力による仕事の分だけ正確に減少する、真空中の慣性飛行はヤコビエネルギーを保存する、非回転の弾道ケースは reentry モジュールの平面質点と一致する、Allen-Eggers の閉形式はその適用範囲で成り立つ）

seg-c23c0440cc75 = aocs (AocsConfig, required_torque, motor_torques, rates, rk4_step, simulate, mrp_from_quaternion); aocs_kind (AocsScenario)

seg-4f446e123d4e = tests/aocs_basilisk_oracle.rs（{ "3" } 件のケース、各 { "601" } サンプル：MRP の最悪値 { "2.4e-14" }（基準 { "1e-9" }）、機体角速度 { "1.6e-15" } rad/s（基準 { "1e-9" }）、ホイール回転数 { "2.9e-11" } rad/s（基準 { "1e-6" }）、印加モータートルク { "1.2e-13" } N m（基準 { "1e-9" }）、t = { "0" } のトルクは { "1e-12" } N m 以内、飽和は両方のツールで到達）、aocs::tests（角運動量の保存、最小ノルムの写像、MRP の分枝、飽和下での収束）、aocs_kind::tests

seg-ec141da2fe8e = wahba

seg-7ece946b2cb0 = wahba::tests（A(単位クォータニオン)=I、ヤコビ固有値ソルバーは既知の対称行列で Kv=λv を満たしトレースを保存する、K は対称）、tests/wahba_reference.rs（TRIAD、Davenport の q 法、QUEST は、ノイズのない重み付きベクトル集合に対して scipy.spatial.transform.Rotation.align_vectors の最適な DCM を、座標系に依存しない姿勢誤差角で <{ "1e-9" } rad まで再現する。加えて、q 法は λ_max=Σ重み でウォルバ損失ゼロとなる既知の回転を復元する、q 法の解は摂動の下でウォルバ損失を最小にする、QUEST は最適な q 法と <{ "1e-7" } rad で一致する、{ "2000" } 回のノイズ付きモンテカルロ試行で最適推定器は 二ベクトル TRIAD を RMS 姿勢誤差で上回る）

seg-e35ff28ef879 = acquisition

seg-e6a7ff99874a = acquisition::tests（Marcum-Q の中心ケース Q_1({ "0" },b)=exp(−b²/2)、P_d=Q_M(√(2Mρ),√γ) の恒等式、M と P_fa にわたる P_fa↔閾値の往復、ROC の単調性：P_d は SNR とともに上昇し、閾値とともに低下し、SNR→{ "0" } で P_d→P_fa となる、非コヒーレント積分の利得は P_fa を固定したとき P_d を引き上げる、Marcum-Q は a と b について単調で [{ "0,1" }] に有界）、tests/acquisition_reference.rs（一般化 Marcum Q_M(a,b)、P_d、P_fa、および P_fa→閾値の逆変換を、(M,a,b)/(M,P_fa)/(M,SNR) のグリッドにわたって scipy.stats.ncx2/chi2 と ~{ "1e-6" } まで照合）

seg-4f480ce145f7 = lambda

seg-7c55c072cfb7 = lambda::tests（L D Lᵀ は Q を再構成する）、tests/lambda_reference.rs（Z 変換はユニモジュラーで |det Z|={ "1" }、Q_z=ZᵀQZ は SPD で行列式を保存し、非対角相関の合計が小さくなる、Schnorr–Euchner の ILS は { "300" } 個のランダムな共分散にわたる総当たり列挙と一致する、無相関化→探索→逆変換の全パイプラインは直接の ILS と等しく、Z⁻ᵀZᵀ は整数を往復で保つ、逐次条件付き丸めの閉形式のブートストラップ成功率は 200k 試行のモンテカルロと <{ "0.01" } で一致する）、tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances（固定された整数は、n が { "2" } から { "10" } の { "300" } 個のランダムな共分散で RTKLIB v2.4.2-p13 の lambda() と等しく、そのうち { "226" } 個は丸めでは解けない、上位二つの二乗ノルムは相対 { "1e-9" } で一致し、実測は { "5.6e-13" }）

seg-18befb9e9596 = bplane

seg-5eb675d6585e = bplane::tests（フライバイのスカラーは閉形式を満たし、二つの |B| の恒等式が一致して |B|>r_p となる、転向角は近点半径とともに減少し δ→{ "0" } / δ→π の極限に達する、偏向は v∞ の速さを保存し正確に δ だけ回転させる、アシストの Δv の大きさは { "2" }·v∞·sin(δ/2) に等しく { "2" }·v∞ で抑えられる、B 平面の軸は正規直交で Ŝ に直交し |B|²=(B·T̂)²+(B·R̂)² となる、ティスラン・パラメーターは a,e,i を変える v∞ 保存の偏向の前後で不変であり、{ "3" }−(v∞/v_circ)² に等しい）、tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid、tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3、tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy、tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1

seg-3111857b93df = crpa

seg-d333f700ca8a = crpa::tests（z/z={ "1" }、|exp(jθ)|={ "1" }、zᴴz=|z|² を含む複素数演算の恒等式、決定論的なヌルステアリングは、{ "3" } 個のジャマーに対して、SV の利得を厳密に単位利得とし、ジャマーのヌルを <{ "1e-9" } とする（4 素子 ULA）、N 素子のアレイは >N−{ "1" } 個のジャマーを除去できず、それより少ない場合は最小ノルムでヌルを形成する、MVDR は SV 方向で無歪みのままで、ジャマーのヌルはジャマー電力とともに単調に深くなり { "60" } dB で <{ "1e-3" } に達する）、tests/crpa_reference.rs（MVDR と最小ノルムのヌルステアリングの重みベクトル、およびその結果のアレイ応答利得を、独立した numpy/scipy の LAPACK による計算と ~{ "1e-9" } まで照合）

seg-97d39969aa50 = powerlaw

seg-213c2856bc78 = powerlaw::tests（各純粋ノイズ種は固有の ADEV の log-log 傾きを示す：ホワイト FM −½、フリッカー FM { "0" }、ランダムウォーク FM +½、ホワイト PM −{ "1" }。フリッカー FM の項は、τ の五桁にわたって √({ "2" } ln2·h_{ "{" }-1{ "}" }) に等しい平坦な下限となる。FM 系列のフィットは、合成曲線から既知の h_{ "{" }-2{ "}" }、h_{ "{" }-1{ "}" }、h_0 を <{ "1e-6" } で往復して復元する。そして、フリッカー支配の曲線の下限はここで復元されるのに対し、ドリフト基底のフィット（quantum_trade::qparams_from_adev_curve）は長い τ で >{ "10" }% 外れる。これにより、文書化されていたギャップが解消される）、tests/powerlaw_oadev_reference.rs（σ_y(τ) を allantools { "2024.06" } の Noise.adev の閉形式と、τ の系列にわたって 五種類すべてのノイズについて照合、加えて h_a の水準について allantools の Kasdin ジェネレーター→oadev 推定器の裏付け）

seg-0a7be53acff4 = oem (covariance_block_kvn, parse_covariance_block)

seg-c3f4fe461c45 = oem::tests（対称な PD 共分散は KVN→解析で f64 の丸め誤差まで往復し、対称のままである、ブロックは COV_REF_FRAME の有無にかかわらず、下三角のちょうど { "21" } 個の要素（行列の各行で i+{ "1" } 個）を出力する、値の個数が誤っているブロックと欠落したブロックはどちらも拒否される）、tests/ccsds_oem_covariance_reference.rs（独立した oem { "0.4.5" } ライブラリが、kshana の出力した OEM セグメントを解析して対称な { "6" }×{ "6" } を再構成し、kshana の入力共分散と f64 の丸め誤差まで一致する。摂動を加えた負の対照と、oem がラベル付きの CX_X 変種を拒否することの確認を伴う）

seg-5dd227be45fe = oem { "0.4.5" }（MIT、<a1>https://pypi.org/project/oem/</a1>）。独立した検証済みの「CCSDS OEM interoperability」の行が信頼しているものと同一の独立した CCSDS-502 パーサーであり、完全に別個のコードベースです（独自の KVN トークナイザー、共分散セクションの状態機械、numpy の行列組み立て）。kshana はラベルのない数値のみの下三角の COVARIANCE ブロックを持つ完全な OEM セグメントを出力し、oem はそれを解析して対称な { "6" }×{ "6" } を再構成し、kshana の入力共分散と要素ごとに f64 の丸め誤差まで一致します。これは本物のライブラリ対ライブラリの交換の往復であり（kshana の再解析ではなく、oem の再構成と比較）、この行にあった以前の「サードパーティのフィクスチャがない」というギャップを解消します

seg-8fd49e7a4cc3 = inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario); scenario kind <c1/>

seg-ece63653ae22 = tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs（{ "48" } 点、{ "30" } s から { "3600" } s の 六つの誤差項、Tactical グレード、北緯 { "45" } deg、水平かつ北向き：すべての点が { "5" } % 以内、最悪は { "1200" } s での速度ランダムウォークの +{ "3.70" } %）、inertial::coast::tests（the_error_model_follows_the_leading_order_law_on_a_short_coast、a_bias_error_is_schuler_bounded、doubling_the_coast_scales_each_contribution_by_two_to_its_own_power、every_contributions_closed_form_crossing_agrees_with_the_engines_bisection、the_located_crossing_puts_the_model_on_the_threshold_it_searched_for、the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward、the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner、the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model、a_full_reset_fix_makes_every_inter_fix_excursion_identical、the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold、an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero、every_published_field_carries_a_unit_and_a_provenance_class、the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible）、tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond（平坦な地球モデルの主要次数の法則についての第 1 ラウンドの所見であり、回帰として保持）

seg-14054e77e0d4 = lunar_vlbi_fim::tests（{ "24" } 件のライブラリテスト：解析的ヤコビアンを、状態自身の座標を順方向に回転させ偏微分を一切使わない経路で取った lunar_vlbi::vlbi_delay_s の中心有限差分と比較し、列ごとに 1/c の < { "1e-6" } で一致、二つの情報行列は最大の対角要素の < { "1e-6" } で、共分散は相対 < { "1e-5" } で一致する。共分散が軸ごとに閉形式で c·σ_τ となる直交単位幾何は { "1e-12" } まで一致し、これは等分配の関係が厳密に成り立つ唯一のケースでもある。共分散のスペクトルと各局の 3 次元シグマは、ネットワーク全体の剛体回転の下で { "1e-9" } まで不変であり、C_rot = R·C·Rᵀ をブロックごとに固定したうえで、軸ごとのシグマが実際に動いたことを明示的にアサートするため、テストが空虚に通ることはない。共分散は σ² および 1/N に正確に比例してスケールする。AM-HM のトレース境界は破られない。遅延の閉包 τ_ik = τ_ij + τ_jk は、遅延とヤコビアンの行で 一 ULP まで固定され、冗長な基線は情報を加えるがランクは増やさないことが示される。単一エポックは、ヘッドラインを null としてランク不足と報告される。より長いアークは、観測数を揃えた条件でより良い条件数になることが測定される。ビーコンブロックはこのスケジュールでは可観測でないことが示される。無視した差分シャピロ項の偏微分は、実行時に有限差分で測定されて出力され、無視されることはない）、tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy（既定のアンカー付きネットワークと自由ネットワーク：SPICE で構築したヤコビアン、16 観測のスケジュールは同一、局のシグマは { "2.2e-3" } 以内、固有値は { "2.3e-3" }、条件数は { "2.4e-3" }、ヘッドラインは { "1.0e-3" }、視線方向は { "0.018" } deg、赤緯は { "0.007" } deg で、合格基準は { "1" } % と { "0.1" } deg、自由ネットワークのランクは 8/9 でヘッドラインは null、零空間は { "0.006" } deg 離れている、コミット済みのヤコビアンに対する NumPy は { "2e-13" } まで一致）

seg-484388449426 = lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel

seg-d44b405dbeba = tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy（{ "16" } 個の観測は同一、ランク 3/3、固有値は { "5.9e-5" } 以内、条件数は { "5.9e-5" }、ビーコンのシグマは { "1.7e-3" } 以内（基準 { "1e-2" }）、RMS { "2.9e-5" }、レバーアーム { "1.4e-8" }、P2 のシグマは { "3.9e-14" }（基準 { "1e-9" }））、lunar_vlbi_fim::tests

seg-30cc52d98bbd = lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)

seg-9d5628188bd8 = tests/lunar_protection_level_reference.rs（{ "7" } 件のサービスボリュームのケース（南極、中緯度、赤道、隆起した高地）、衛星数 { "6" } から { "19" }、σ_URE 10/30/60 m、P_HMI は { "1e-3" } から { "1e-7" } まで、保護レベルは { "1.7e2" } から { "6.9e3" } m にわたる：HPL/VPL を合成した RTKLIB + SciPy のオラクルと比較し、最悪 |Δ| は { "1.061e-8" } m と { "1.044e-8" } m で、許容差は { "1e-6" } m、DOP を RTKLIB 自身の (GᵀG)⁻¹ と相対 { "1.790e-14" } まで、K_fa を scipy.stats.norm.isf と相対 { "2.716e-11" } まで比較、三つの負の対照（{ "5" } km の衛星のずれ、相対 { "1e-6" } の σ_URE の変化、{ "0.1" } % 厳しくした P_HMI）はいずれも保護レベルを許容差の少なくとも { "171" } 倍動かすことが測定され、さらに、コミット済みの幾何をエンジン自身のコンステレーションと可視性のコードが生成するものにビット単位で固定する古いフィクスチャへのガードにより、下でコンステレーションが変わっても green が生き残ることはない）

seg-842722fa9e91 = araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)

seg-68b534869ac3 = tests/araim_reference_vectors.rs（公表された { "2" } 個のベクトル + { "6" } 個の負の対照、フィクスチャ tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt：公称バイアスを落とすと公表された VPL を { "2.6457" } m 外し、{ "10" } % の ISM 誤差では { "0.2798" } m、K_fa を { "12" } モードではなく { "57" } モードで取ると { "0.4015" } m、+{ "2" } %/+{ "5" } % のインテグリティ分散誤差では 0.0750/0.1971 m 外し、+{ "1" } % の誤差では { "0.0339" } m しか動かず、これは隠さずにこのチェックの分解能の限界として報告する。二つの文書の答えは、それぞれ相手の答えを許容差以上に外すため、これらのベクトルは互換ではない。コミット済みのフィクスチャとコンパイル済みの定数は、一致をアサートされた二つの独立した転記であり、公表された数値を片方だけ編集してチェックを通すことはできない。そして C_int − C_acc = σ²_URA − σ²_URE = { "0.3125" } m² は、転記した { "40" } 個の分散すべてについて成り立ち、転記の誤字があれば破れる算術上の恒等式である）

seg-7e8963a7c86f = lunar_llr, realdata::llr_crd (composing fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)

seg-617e168e2460 = tests/lunar_llr_real_data.rs（{ "11" } 件のテスト：コミット済みの { "15" } 個の CRD ファイルすべてが記録されたダイジェストとバイト単位で同一、{ "349" } 件のレコードすべてが説明され、{ "337" } 件を使用し { "12" } 件は明記した理由でスキップ、アーカイブされた全レンジが実際の近地点/遠地点の範囲内、重みが bin_rms/√n_raw であることの確認、各アレイで視線方向の座標が最もよく決まり、それをもたらす秤動の掃引は別個に測定される、残差と JPL Horizons による独立した確認、0.1 度の幾何の傾きに対する感度、シミュレートしたキャンペーンの比較が当該シナリオの独立した実行と等しいことの確認、既存の三つの月座標系パックに対するビット単位の R1 固定）、lunar_llr::tests（{ "12" } 件：レンジの偏微分を、モデル化した飛行時間の中心有限差分と相対 < { "1e-6" } で比較、光行時間は収束した月往復のものであること、データムのシグマは重みのスケールに { "1e-9" } まで厳密に線形、ブロック対角性は厳密、データのディレクトリがない場合は代用せず拒否、編集されたカタログの行は自身の半径列で検出される）、realdata::llr_crd::tests（{ "7" } 件：フィールドの意味、真夜中の繰り上がり、UTC でない時刻系と未対応のフォーマットバージョンの拒否、空のビンに対してシグマを代用しないこと）、tests/validate_llr_datum_spice_oracle.rs（llr_datum_finding_tz_sigma_one_percent_gap、固定、reported_residual_is_the_engine_to_spice_light_time_gap）、tests/validate_llr_datum_analytic_fresh_2025.rs::llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points（未使用の 2025-Q2 のノーマルポイント { "151" } 点：シグマとノルムの最悪値は { "1e-2" } のうち { "1.11e-3" }、条件数は { "2e-2" } のうち { "8.95e-4" }、比は { "2e-2" } のうち { "1.79e-3" }、帳簿、ランク、結合は厳密）

seg-9e17b852f721 = lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel

seg-ed8e396d7fb6 = tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points（未使用の 2019-Q2 のノーマルポイント { "447" } 点：シグマとノルムは { "1e-2" } のうち { "4.0e-5" } 以内、条件数は { "2e-2" } のうち { "1.6e-5" }、比は { "2e-2" } のうち { "7.6e-5" }、帳簿とランクは厳密）、tests/validate_llr_datum_kernel_moon.rs（{ "2015" } 年の既出データによる診断、tz で { "0.049" } %、この行のエビデンスではありません）、lunar_llr::tests

seg-0bd1d423f40a = ephem (moon_position), lunar_llr, realdata::llr_crd

seg-e73eed7ff8b5 = tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount（週ごとの地心状態 { "12" } 件、最悪エポックの角度が < { "0.3" }° かつ RMS が < { "5e5" } m であることを、モジュール自身が文書化した主張に対してアサート、加えて LLR 残差が径方向の不一致と < { "5" }× で一致することをアサート）、::the_measured_residual_is_the_ephemeris_error（実際のノーマルポイント { "337" } 点）

seg-e6eeb246d545 = integrity::tpl_scalar::tests（ランク 1、融合/除外、バイアス支配、IR のクロスチェック）、tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy（コミット済みの { "300" } 件のケース：numpy lstsq の部分集合推定器、一般の分離共分散、scipy brentq による PL、PL は相対 { "1e-9" } 以内、最悪 { "1.2e-10" }、支配的な部分集合は厳密）

seg-2737758e6542 = integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack（コミット済みの { "201" } 件の SPD ケース：因子、白色化残差、白色化演算子、マハラノビス二乗を numpy LAPACK と相対 { "1e-12" } 以内で比較、最悪 { "7.9e-16" }）

seg-d36e19a6e2a9 = integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling)、tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack（コミット済みの { "256" } 件のケース：{ "210" } 件の良条件と境界のケースで alpha_ss、alpha_cm、最小値は相対 { "1e-12" } 以内、最悪 { "3.3e-15" }、条件数 { "1.3e8" } までの { "40" } 件の悪条件のケースは、明記した条件数でスケールした境界内、最悪 { "1.1e-9" }、六つの厳密な無限大）

seg-fa85ee9b1daa = tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference（良条件から { "{" }{ "0,3" }{ "}" } のほぼ退化したものまでにわたる { "16" } 個の合成 7x7 SPD 行列：Schur の lambda_min / 原点 CRLB / |corr| を SciPy/NumPy と <{ "1e-9" } rel で比較）

seg-4fcff50bca2e = lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration)、tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre、tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node（バイナリ PCK 上の { "2 000" } 個のランダムなノード外エポックを SPICE の pxform と比較：回転角は { "1.7e-5" } rad 以内、最悪 { "1.7e-6" } rad、平均半径で { "3" } m）

seg-3e86011ef650 = lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent); lunar_orientation (try_de440_moon_pa_body_to_inertial); lunar_vlbi (station_inertial_position_itrs)

seg-ef1e57e7bf3d = tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic（{ "192" } 件の ILRS ノーマルポイント：RMS { "2.81" } m、ITRF2020 の二局だけでは { "2.96" } m、どちらも最大 { "10" } m）、tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres（置き換えられた地心の光行時間モデル、{ "10.94" } m、固定）

seg-32da421d27ef = tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows（well_posed の 120 行と single_epoch の 30 行のネットワークについて、{ "9" } 個の固有値、defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm、および { "{" }scale,offset{ "}" } の Schur 周辺化を、rel<{ "1e-3" } と abs<{ "1e-3" } で比較）、lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)

seg-9f0fd0918105 = lunar_gauge, lunar_time

seg-abab0c3bfa30 = tests/lunar_rate_frame_coupling_preregistered.rs（entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields：L_m は AIUB-GRL350A/B の J2 を用いた Ashby と Patla { "2024" } の値の { "2.8e-6" } 以内、entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields：径方向の項は pyshtools の 350 次の赤道重力の { "8.3e-5" } 以内、entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed：速度の項は { "2000" } エポックでの DE441 の月の速度の { "2.5e-3" } 以内）、lunar_gauge::tests、回帰テスト tests/lunar_rate_frame_coupling_oracle.rs

seg-57b6f02016e4 = lunar_gauge::tests（classify_is_invariant_under_null_basis_rotation - 軸に揃えた零空間基底とその { "0.6" } rad の回転が、同一の defect、dim_spatial、dim_temporal、coupled_dim、p_st_norm を与える、classify_direct_sum_null と classify_coupled_null - 構成した直和のケースと真に結合したケースが次元分解を確認する、classify_basis_invariant、index_consts_are_correct）、tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection（{ "18" } 個の零部分空間にわたる { "72" } 個の構成した 9x9 のフィッシャー行列、それぞれ四通りのランダムな正規直交の基底変更：defect、dim_spatial、dim_temporal、coupled_dim は厳密、p_st_norm は { "6.0e-15" } 以内、基準 { "1e-9" }）

seg-e9319e19b9f3 = tests/lunar_interop_budget_reference.rs（{ "3" } 組のプロバイダーについての raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible を、tests/fixtures/inter_ephemeris/reference.json にある独立した SciPy の SVD lstsq フィットと比較、rel<{ "1e-3" } abs<{ "1e-3" } m、フィクスチャとオラクルは、公開されている DE440/INPOP21a/EPM2021 のカーネルに対し IMCCE の calceph を通して scripts/gen_interop_ref.py で生成されバイト単位で整合）

seg-89624a7374e9 = tests/lunar_faultobs_reference.rs（faultobs_matches_numpy_scipy_on_real_de440_rows：{ "84" }×{ "84" } の P⊥ を要素ごとに、trace(P⊥) = parity_dim = { "52" } と rank(G) = { "32" }、検出可能性のノルムとフラグ、MDB の二次形式 cᵀWP⊥c と MDB の値、各ピア連合についてのブロックスパークの検出/識別の件数を、独立した numpy/scipy のオラクルと rel<{ "1e-3" } abs<{ "1e-3" } で再現し、整数の件数は厳密、入力は examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py によってバイト単位で整合）

seg-cbdf069c7baa = telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns); allan (mtie, time_deviation)

seg-d4dfc8374544 = tests/telecom_timing_reference.rs（エージング、フリッカー、温度を含む、コミット済みの { "2" } 048 サンプルのチップスケール原子時計のホールドオーバー系列に対する { "17" } 個の MTIE と { "12" } 個の TDEV の平均化係数を、allantools { "2024.06" } と <{ "1e-12" } / <{ "1e-9" } の相対で比較、観測は厳密 / { "1.1e-15" }、CSV を取り込む完全な telecom-timing の実行から読み出した同じ曲線）、telecom_timing::tests（スライディング MTIE はすべてのウィンドウで allan::mtie に等しい、手計算で導いた MTIE と TDEV、単調な MTIE）

seg-776723e1171a = allan (edf_greenhall, greenhall_edf_core); assurance::uncertainty (edf)

seg-d98eb984ce90 = tests/greenhall_edf_allantools.rs (bars_1_to_3_against_allantools; bar_4_wrappers_equal_the_core)、tests/greenhall_edf_no_moved_output.rs (uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline)、tests/uncertainty_edf_reference.rs

seg-51a5b33f0b62 = slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)

seg-02d2f67a9284 = tests/slot_timing_cs5071a_holdout.rs（holdover_inversion_predicts_the_held_out_caesium_record：記録の最初の三分の一でフィットし、{ "0.5" }、{ "0.75" }、{ "1" }、{ "1.5" }、{ "2" }、{ "2.5" } ns での一シグマの逸脱を予測し、残りの三分の二で { "997" } s ごとの同期点から測定する。合格基準は最初の実行の前に確定した、どちらの向きにも { "1.5" } 倍。観測された比は { "0.84" } から { "1.03" }。対照として、一秒のアラン偏差をホワイト FM と読んだものは約 { "1 000" } 倍外れ、基準を満たさないはずであり、ホワイト FM の水準を半分にする変異はテストを失敗させる）、slot_timing::tests（a_measured_white_fm_record_recovers_its_level、reduces_to_the_holdover_inversion、ieee1139_conversion_matches_the_powerlaw_module）

seg-83c8f23a4b53 = navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc); spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)

seg-436f7a545a7b = spectrum::tests（bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz — BPSK({ "1" }) の { "2.046" } MHz と BPSK({ "10" }) の { "20.46" } MHz を閉形式上で数値的に特定、boc11_lobes_are_centred_at_plus_minus_1_023_mhz — 搬送波のヌル、{ "2.046" } MHz の最初のヌル、{ "1.023" } MHz のローブ中心、そして tan y = 2y の独立したニュートン法による解と照らした { "0.7590" } MHz の厳密な最大値、ssc_matches_parseval_closed_forms — C/A x C/A 2/(3R_c) = -61.86 dB/Hz、BOC({ "1,1" }) x BOC({ "1,1" }) 1/(3R_c) = -64.87 dB/Hz、C/A x BOC({ "1,1" }) 1/(6R_c) = -67.88 dB/Hz、いずれも { "0.02" } dB 以内、q_values_match_kaplan_hegarty — 搬送波上の CW では Q = { "1" }、スペクトル整合の雑音では Q = { "1.5" }、平坦なヌル間雑音では Q = { "2.215" }、mboc_is_a_unit_area_one_eleventh_mix）

seg-500eea1d6b4a = sigmf (read, write, encode, decode, parse_meta, meta_to_json); spectrum (welch_psd, fft_in_place, synthesise_iq)

seg-19aa57a32add = sigmf::tests (cf32_round_trip_is_exact_to_single_precision; ci16_round_trip_is_within_half_a_code; ci16_is_little_endian_i_then_q; integer_encoding_counts_saturation; metadata_uses_the_core_namespace; unsupported_types_and_channels_are_refused; sample_start_offsets_into_the_data)、spectrum::tests（fft_matches_a_direct_dft、welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power — 下限は分散をサンプルレートで割った値の { "2" } % 以内、Parseval の合計は { "2" } % 以内、Hann の等価雑音帯域幅は { "1.5" } ビン、noise_like_synthesis_is_unbiased_through_welch — ci16_le の往復を通した Welch とモデルの差の中央値は { "0.1" } dB 以内、synthesised_iq_through_sigmf_reproduces_the_model_spectrum）、tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python（Welch PSD を scipy { "1.18.1" } の signal.welch とビンごとに { "27" } 件のケースにわたって相対 { "1e-12" } で比較、観測は { "6.0e-14" }、sigmf-python { "1.13.0" } の五つの記録をビット単位で同一に、メタデータも同一にデコード、クレートが書き出した記録を sigmf-python がビット単位で同一に読み戻し、SigMF { "v1.2.6" } に対してスキーマ上も有効）

seg-390697edfd7d = ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf); ephem_provider (AnalyticSolarSystem); solar_system (SolarSystemScenario)

seg-0e2a03d21df4 = tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1（表 { "1" } による 1800-2050 年の重心と、表 { "2" } による { "3000" } BC-3000 AD、{ "8908" } 個と { "21857" } 個のエポック、最悪の RMS は表 { "8.10.1" } の値の { "0.778" }）、tests/solar_system_standish_earth_icrf_preregistered.rs（earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms：AnalyticSolarSystem と icrf_to_ecliptic を通した地球、RMS は EMB の値の { "0.483" }、icrf_positions_are_within_the_table_8_10_1_rms：表 { "1" } の天体と地球の ICRF 位置、最悪 { "0.778" }、earth_minus_barycentre_offset_matches_de441_1950_to_2050：月の級数による分割、最悪 { "0.088" } deg と { "6.1" } km）、ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse)。ゲートに含めない回帰：tests/solar_system_horizons_reference.rs

seg-af9dc8bcbd0a = ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2); naif_kernel; timescales

seg-02aaea0ff091 = tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs（事前登録のハッシュから選んだ 1973-2026 年の { "200" } 個の UTC エポックにおける { "600" } 個の位置、最悪は基準の { "0.66" }、{ "2.96" } m）、tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present（データがある場合のみ実行）、tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted、ephem_provider::tests

seg-19387ac03ee7 = radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)

seg-12ea8306ca6a = tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s（水星、金星、火星、木星、土星の重心、太陽、地球中心に対する月、補間した DE441 位置で各 { "1576" } エポック、最悪 { "6.7e-9" } s（基準 { "1e-6" } s））、解析経路についてのゲートに含めない精度の記述：tests/solar_system_light_time_preregistered.rs（RMS c dLT は表 { "8.10.1" } の位置の基準の { "0.17" } から { "0.30" }）、solar_system::tests

seg-2e83f70b6649 = body (Body::iau_rotation_et, Body::iau_angles_et, Body)

seg-803d90c9eacb = tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies（{ "1955" } 年から { "2044" } 年の { "41" } エポック、{ "574" } 個の行列が { "1e-9" } rad 以内、最悪はフォボスの { "1.43e-10" } rad）、tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_at_fresh_epochs（これまで比較していない { "1961" } 年から { "2038" } 年の { "41" } エポック、{ "574" } 個の行列が { "1e-9" } rad 以内、最悪はフォボスの { "1.38e-10" } rad）、tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440（十四天体の { "84" } 個の定数のうち、NAIF と異なるものは { "0" } 個）

seg-cf5cfbb6b468 = constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)

seg-92ee79866544 = constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23（{ "24" } 行すべての RAAN と平均近点角を { "1e-9" } deg まで）、constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1（ICD のスロット式と Walker 24/3/1 は、同じ { "24" } 個の昇交点と緯度引数の組である）、constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings（RAAN、緯度引数、{ "100.765" } deg の時角から求めた { "36" } 個の GPS 位置すべての地上軌跡の赤道横断：{ "35" } 個は { "0.015" } deg の丸めの基準に対して { "0.0108" } deg 以内、E3F は { "0.06" } deg 以内で、これは表自身の E3F の行が RAAN および緯度引数と約 { "0.06" } deg 食い違っているため。永年的な昇交点の後退は表の -0.0402 deg/day の { "5" } % 以内）、constellation::tests::walker_geometry_identities_are_exact（デルタパターンとスターパターンについて、{ "1 584" } 機までの衛星での三つの間隔の恒等式、{ "1e-9" } deg まで）

seg-0aaf33611680 = constellation (coverage, dop_at, NormalAccum)

seg-7bc2428f22d9 = constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard（HDOP の中央値 { "0.940" }、{ "90" } % 値 { "1.165" }、{ "95" } % 値 { "1.255" }、{ "98" } % 値 { "1.370" }、平均 { "0.965" } を、{ "0.94" }、{ "1.16" }、{ "1.25" }、{ "1.37" }、{ "0.96" } と比較、それぞれの基準 { "0.03" } は最初の実行の前に確定した、PDOP の中央値 { "1.795" } は、衛星数 20-24 機の劣化した構成についての表 B.3-1 の { "1.815" } 以下、可用性は全球でも最悪地点でも { "100" } %、表 3.8-1 の { "98" } % と { "88" } % に対して）、constellation::tests::single_epoch_dop_matches_the_hand_computation（天頂と、仰角 { "30" } deg の三機の衛星：HDOP 4/3、VDOP { "2.3094" }、PDOP 8/3、TDOP { "1.5275" }、GDOP { "3.0732" } を { "1e-9" } まで、かつ共通クロックでの orbit::dop に等しい）

seg-54bf21cf90d7 = navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)

seg-d2b3b13002dd = navsignal::band_limited_tests（sine_integral_matches_tables_and_its_limit — Si({ "1" })、Si(pi)、Si({ "2" } pi) を { "1e-12" } まで、bpsk_power_in_band_closed_form_matches_textbook_and_numeric — BPSK(1/3)、BPSK({ "1" })、BPSK({ "5" })、BPSK({ "10" }) で電力の { "0.9028" } がメインローブに入り、閉形式は { "10" }、{ "15" }、{ "20" }、{ "51.15" } MHz で求積と { "1e-7" } まで等しい、bpsk_gabor_closed_form_matches_numeric_and_asymptote — { "1e-4" } まで、および sqrt(B R_c / ({ "2" } pi^{ "2" })) の漸近線、bandlimited_dll_reduces_to_the_textbook_forms — { "45" } dB-Hz、B_L { "1" } Hz、d { "1" } chip、T { "20" } ms でのコヒーレントなアーリー・レイト BPSK({ "1" })：{ "0.0039564" } chip（{ "1.159" } m）が { "1" } % 以内、非コヒーレント形は navsignal::dll_code_jitter_chips と { "1" } % 以内で等しい、間隔が消える極限はその閉形式と { "1e-5" } まで等しい、offset_bpsk_ssc_matches_parseval_closed_form — オフセット { "0" } から { "3.2" } R_c で { "0.01" } dB 以内、BPSK({ "10" }) のオフセットゼロで -71.86 dB/Hz、altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b、modulation_labels_round_trip）

seg-56f381a3f611 = leo_signal (max_doppler_hz)

seg-da02936f6d75 = leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures — Xona Pulsar X1（{ "1593.3225" } MHz、{ "1080" } km）の { "33.2" } kHz は公表された { "32" } から { "34" } kHz の範囲内、Iridium（{ "1621" } MHz、{ "780" } km）は公表された { "36" } kHz の { "0.5" } kHz 以内

seg-f1cdf8728c6b = 公表された数値：Xona Pulsar X1 の最大ドップラーは { "32" } から { "34" } kHz（Leclère、Marathe、Reid、ION GNSS+ { "2025" }、<a1>https://arxiv.org/abs/2509.19551</a1>）、Iridium のドップラーは最大 +/-36 kHz（Resilient Navigation and Timing Foundation、Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites）。地球の自転は含めておらず、これにより数値は最大で約 { "2.3" } kHz 動きますが、公表された二つの数値はいずれも、これを含めなくても満たされています。

seg-70fb5eb759aa = leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)

seg-6ef512cefe4d = tests/leo_link_reference.rs（p838_coefficients_reproduce_table5_to_its_printed_digits：表 { "5" } の { "115" } 行すべて、{ "1" } GHz から { "1000" } GHz、すべての係数が最後に印字された桁の { "0.6" } 以内、観測された最悪値は { "0.51" }）

seg-53d288ecc889 = leo_link::itu (p618_rain_attenuation_db, RainPath)

seg-e1ab19315242 = tests/leo_link_reference.rs（p618_rain_attenuation_matches_the_itu_validation_examples：五地点、{ "14.25" } GHz と { "29" } GHz、{ "0.001" } % から { "1" } % の { "56" } 件のケース、{ "1e-4" } dB 以内、観測は { "5e-6" } dB）

seg-cfe59399d0a3 = leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)

seg-8a35d6b6f974 = tests/leo_link_reference.rs（p618_scintillation_matches_the_itu_validation_examples：七地点、{ "14.25" } GHz と { "20" } GHz の { "42" } 件のケース、{ "1e-5" } dB 以内、観測は { "5e-7" } dB）

seg-f7d2ab81d7d2 = leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)

seg-05bb3df0fcc5 = tests/leo_link_reference.rs（p2109_building_entry_loss_matches_the_itu_workbook：{ "568" } 個の値、{ "0" } deg での { "28" } GHz と { "45" } deg での { "2" } GHz、両方のクラス、P は { "1e-7" } から { "0.998" }、{ "0.001" } dB 以内）

seg-5b682a1911e5 = leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)

seg-09369862fb72 = tests/leo_link_reference.rs（first_order_iono_reproduces_the_is_gps_200_group_delay_ratio：gamma = (77/60)^{ "2" } を { "1e-12" } まで、L1/L2 と L1/L5 の増幅率は { "2.978" } と { "2.588" }、free_space_loss_is_the_friis_kilometre_megahertz_form：{ "32.4478" } + { "20" } log d + { "20" } log f を { "1e-4" } dB まで）、leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)

seg-ba1455ed0740 = leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)

seg-88f10ca1e3bc = tests/leo_link_reference.rs（doppler_envelope_reproduces_the_pulsar_paper_table_1：Pulsar IOV { "520" } km { "97" } deg、Pulsar FOC 極軌道 { "1080" } km { "97" } deg、Pulsar FOC 傾斜軌道 { "1080" } km { "53" } deg、GPS { "20180" } km { "55" } deg、軌道速度、ECEF の最大速度、最大相対速度、L1 帯と L5 帯の最大搬送波ドップラー、{ "20" } 個の値、それぞれ { "0.05" } % 以内）

seg-45309f1545cc = leo_navmsg::sisre (sisre_weights, StatsAcc)

seg-64d379a46dbc = leo_navmsg::sisre::tests（weights_reproduce_the_published_meo_and_geo_table — GPS { "0.979" } と 1/48.9、GLONASS 1/45.0、Galileo { "0.984" } と 1/61.1、BeiDou MEO 1/54.2、静止軌道 { "0.992" } と 1/126.2、マスク { "0" } deg で、それぞれ w_R の { "0.005" } 以内、1/w_AC^{ "2" } の { "0.5" } 以内、leo_weights_shift_toward_the_transverse_axes — { "510" } km での地平線の天底角 { "67.8" } deg）

seg-d579e3a4f58f = leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)

seg-7bb3e4112c28 = tests/leo_navmsg_reference.rs（the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre — 実際の Galileo の放送エフェメリス四つ、E10、E19、E24、E25 を tk = { "0" }、+/-600、+/-1800、+/-3600 s で、すべての軸が RTKLIB の { "1" } mm 以内、real_galileo_records_survive_the_binary_frame_and_the_text_block — Kshana のバイナリフレームを経由すると { "5" } mm 以内、RINEX 形式のブロックを経由すると { "1" } mm 以内）

seg-405df44dd887 = leo_navmsg::codec (crc24q, encode, decode)

seg-577acdb9b84b = leo_navmsg::codec::tests（crc24q_matches_the_catalogue_check_value — ASCII 文字列 { "123456789" } に対して 0xCDE703、crc24q_matches_the_rtcm_1005_example_frame — RTCM { "10403" } のメッセージタイプ { "1005" } の例のフレームの三つのチェックバイト 0x360B98、およびフレーム全体に対してゼロ）

seg-4213f6b60bf1 = leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)

seg-7f4e08aeede7 = leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre、leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections、leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term、leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it（{ "1" } 分から { "15" } 分まで単調に増加し、{ "15" } 分で少なくとも三倍の改善）、leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic、tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits（GRACE-A、GRACE-C、Sentinel-2A、Sentinel-6A の TU Graz ITSG 簡約力学軌道を { "20" } 分と { "30" } 分のアークでフィット：along、cross、radial の RMS は Liu ら { "2025" } の { "0.804" } から { "1.087" }、SISRE は { "0.716" } から { "0.809" }、1.5x の範囲内、SISRE の重みは同論文の表 { "2" } の { "0.0007" } 以内）、tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h（Orekit { "12.2" } + Hipparchus { "3.1" }、同じ初期状態と密度入力：二体で最悪 { "3.95" } mm、J2-J6 と { "20" } 次および { "70" } 次までの EGM2008 で { "3.92" } mm、{ "400" } km で抗力を伴う { "20" } 次の EGM2008 で { "4.55" } mm、{ "6" } h にわたって基準は { "0.02" } m）、内部のクロスチェックでありオラクルではありません：tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo

seg-4a631f12459a = leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)

seg-c79d4b5fdd17 = tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre（論文の四日分：along、cross、radial、SISRE の比は Liu ら { "2025" } の { "0.755" } から { "1.138" }、1.5x の範囲内）、tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days（ホールドアウトの八日分、それぞれ二つのアーク：{ "0.683" } から { "1.186" }）

seg-765c69669bfa = leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)

seg-4693b7ddd7b2 = leo_navmsg::services::tests（klobuchar_scales_with_inverse_frequency_squared — L1 の値は RTKLIB の { "6.1278" } m、nequick_az_rules、utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day、utc_drift_terms_follow_the_icd_formula、an_inserted_leap_second_reads_86400_at_the_end_of_the_day）、tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa（L1、L2、L5 での Klobuchar を { "4 320" } 件のケースで、最悪 { "7.0e-13" } m、すべてゼロの係数と { "400" } sfu の規則を含む { "222" } 組の係数での Az、最悪 { "5.7e-14" } sfu、{ "50" } 件のケースでの UTC ドリフト、最悪 { "3.6e-15" } s、実際の { "2015" } 年と { "2016" } 年のうるう秒をまたぐ { "21 602" } 時点での三つのうるう秒のケース、{ "0" } s）

seg-0111fd0b84a5 = leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)

seg-a8dd3751a688 = tests/leo_doppler_reference.rs（iridium_doppler_reaches_the_published_36_khz：{ "780" } km、{ "86.4" } deg の衛星一機を { "1621" } MHz で一日飛行させ、四つの緯度にわたって、最大値は { "36" } kHz の { "5" }% 以内、xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz：公表された各シェルの衛星一機、{ "53" } deg と { "97" } deg の { "1080" } km、{ "1593.3225" } MHz、コンステレーションの最大値は { "32" } から { "34" } kHz の範囲内で拡張なし（{ "33.6" } kHz、{ "97" } deg のシェルで決まり、{ "53" } deg のシェルだけではピークは { "31.8" } kHz））、leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)

seg-8ac77c9b9588 = leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)

seg-50b92f3ed7eb = leo_fusion::ntn::tests（the_numerical_rms_bandwidth_matches_the_closed_forms、the_range_bound_scales_as_one_over_bandwidth_and_root_cn0：{ "5" } MHz、{ "45" } dB-Hz、{ "0.1" } s で手計算の { "0.4157" } m、the_frequency_bound_is_the_complex_tone_crlb、defaults_run_wider_is_better_and_every_number_has_a_unit）、tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one)、tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)

seg-cc3d01973493 = leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)

seg-e1d9acf84101 = tests/leo_polar_coverage_on_path_orekit_oracle.rs（構成 A と B、{ "4040" } サンプル：地球固定座標の位置は { "6.8e-5" } m 以内で基準は { "0.2" } m、可視数は 4040/4040 で同一、DOP の中央値は相対 { "2.3e-11" } 以内で基準は { "1e-3" }、可用性と可視数の平均は同一）、tests/earth_orbit_path_sgp4_erfa_oracle.rs（経路）、leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it)、tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens)、tests/leo_polar_coverage_orekit_oracle.rs（ラウンド { "2" }、与えられた状態に対する幾何）、tests/leo_polar_coverage_full_claim_orekit_oracle.rs（第 1 ラウンドの full-claim の所見、固定）

seg-bd265d530763 = lunar_frame_campaign, fim

seg-7c8144a7376a = tests/lunar_frame_campaign_mpmath_oracle.rs（lunar_frame_campaign_datum_matches_mpmath_extended_precision：三つのシナリオ — 新しいキャンペーン日 2026-03-18 に局を推定（拘束力あり）、その日に局を固定（対照）、2024-01-01 に局を推定（以前の倍精度での外れを起こしたシナリオ）、すべてのデータムのシグマ、条件数、最も弱い方向を、オラクルの厳密な感度からテスト内で再計算した条件数でスケールした基準に対して、engine_inputs_match_the_committed_fixture：コミット済みのヤコビアン、重み、ヘルマート設計は、エンジンが現在構築するものである、record_engine_accuracy_against_a_factorisation_route：エンジンの誤差の幅と NumPy のコレスキー診断を固定）

seg-691a05f06e4d = linalg_sr, lunar_frame_campaign

seg-f26d99df9184 = tests/lunar_frame_campaign_srif_mpmath_oracle.rs（srif_datum_matches_mpmath_extended_precision：四つのシナリオ — 新しいキャンペーン日 2026-06-09 に局を推定（拘束力あり）、その日に局を固定（対照）、および 2026-03-18 と 2024-01-01 の局推定の入力、すべてのデータムのシグマ、条件数、最も弱い方向を、オラクルの厳密な要素からテスト内で再計算した平方根形式の基準に対して、engine_inputs_match_the_committed_fixture）、linalg_sr::tests（{ "9" } 件のライブラリテスト：{ "20 000" } 組での Dekker の積と融合積和の残差の一致、打ち消し合う和の補償総和、R^T R と A^T A の一致、逐次のフィルター更新と一括更新の一致、末尾ブロックとシューア補行列の平方根の一致、三角行列の逆行列、ヤコビ SVD、良条件のケースでのスペクトルデータムとの一致、ビット単位で同一の再実行）、lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected および the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so

seg-02fed5e55709 = receiver_trust (ingest, maritime)

seg-3c5f4229618e = tests/maritime_trust_reference.rs (t1_nmea_decoding_matches_pynmea2, t2_east_north_offsets_match_the_wgs84_geodesic, t3_t4_monitor_input_statistics_match_the_oracle)。比較対象は tests/fixtures/maritime_trust/reference.json で、examples/gen_maritime_trust_ref_inputs.rs が書き出した合成 NMEA から scripts/gen_maritime_trust_ref.py によって再生成されます。許容差は tests/fixtures/maritime_trust/PREREGISTRATION.md に事前登録されています

seg-684b87e7f358 = nmea_synth (track, sentences, scenarios); cli nmea-scenario

seg-5699d8162c69 = tests/nmea_training_reference.rs（pynmea2 のオラクルとの比較）、tests/nmea_training_scenarios.rs::every_sentence_is_checksum_valid_and_the_reader_accepts_it、::every_sentence_type_is_present_each_epoch、::deterministic_per_seed_and_sensitive_to_it

seg-87e0596369cb = interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)

seg-48689d047304 = tests/interference_map_reference.rs::adsb_accuracy_and_integrity_codes_agree_with_pymodes（{ "12" } 個の NACp コード、{ "59" } 行の NIC）、tests/interference_map_reference.rs::ais_field_rules_agree_with_pyais_decoding（{ "94" } 個のフレーム）、tests/interference_map_reference.rs::grid_cell_assignment_agrees_with_shapely（{ "1770" } 点、四種類のセルサイズ）、tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib（{ "8" } 本の経路、{ "420" } 個の区間、{ "11634" } km）、tests/interference_map_reference.rs::land_masking_agrees_with_shapely_and_pyproj（{ "996" } 点）、interference_map の単体テスト

seg-a14a79333731 = telemetry (prometheus: Registry, render; otlp: build_payload, Exporter (feature otlp); sample)

seg-bce7247612db = tests/telemetry_formats_reference.rs (prometheus_client_reads_our_exposition_as_the_registry_implies, the_official_otlp_proto_reads_our_json_as_the_registry_implies, awkward_reason_text_survives_the_parser, the_committed_outputs_are_what_this_crate_produces；スキーマ { "1.3" }：prometheus_client_reads_the_schema_13_exposition_as_the_registry_implies, the_official_otlp_proto_reads_the_schema_13_json_as_the_registry_implies, promtool_accepts_the_schema_13_exposition, the_collector_receives_and_exports_the_schema_13_payload_unchanged)、tests/telemetry_cli.rs、telemetry::prometheus::tests（ゴールデンな出力）

seg-40e8b0a596fb = telemetry (syslog: cef, rfc5424, SyslogSink; time)

seg-baadfddd02b2 = tests/cef_reference.rs (pycef_reads_every_tier_1_event_as_the_sample_implies, the_logstash_cef_codec_reads_every_event_including_escaped_headers_as_the_sample_implies, the_committed_corpus_is_what_this_crate_produces_and_covers_what_was_registered)、telemetry::syslog::tests（CEF 文字列そのもの、エスケープ、重大度、RFC { "5424" } のエンベロープ）、tests/telemetry_cli.rs

seg-66f38fc734a7 = evidence (bundle: create_bundle, sign_detached, chain_link, sha256_hex; verify: verify_bundle, verify_detached; tsr; assemble; cli)

seg-d50f70b4c20a = tests/evidence_crypto_reference.rs（RFC { "8032" } の第 { "7.1" } 節のベクトル { "1" }、{ "2" }、{ "3" }、{ "1024" }、FIPS 180-4 の SHA-256 の例、厳密）、tests/evidence_pack_reference.rs::kshana_and_the_clean_room_verifier_agree_on_every_case（{ "71" } 件のケース）、tests/evidence_pack.rs（改ざんテスト）

seg-703f4b4ac682 = evidence::tsa (verify_token, pem_certificates); evidence::verify (VerifyOptions::tsa_anchors, Failure::TimestampAuthorityInvalid); evidence::cli (--tsa-ca)

seg-39bc6b70440b = tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl（事前登録した比較）、evidence::tsa::tests（暦の日付と時刻、base64、RSA の公開鍵演算）、evidence::verify::tests::anchors_make_the_authority_checked（署名のないトークンはアンカーがあると失敗し、アンカーがなければレポートは変わらない）

seg-837193c4e1dc = interop::testbench (write_motion_csv, write_nmea, trajectory_of, export); fusion::pack::truth_trajectory

seg-0094102cc5b8 = tests/testbench_reference.rs（{ "7" } 件のテスト：オラクルの固定、出力のバイト、全行にわたる最悪ケース、位置の列、局所速度と真の NED 速度、オイラー角と scipy、NMEA と pynmea2）、tests/interop_testbench.rs（書き出し側自身の往復）

seg-3266b898bfd2 = iq::signals::beidou (b1i_bits, b1i)

seg-ba514f7e73ce = iq::signals::gps (l1c_weil, l1c_ranging_bits, l1c_p_bits, l1c_d_bits, l1co_s1_run, l1c_o_bits); iq::signals::tables

seg-9e651a7f8dc9 = tests/iq_signals_gps_l1c.rs (c1_l1cp_and_l1cd_initial_and_final_24_chips_match_is_gps_800j_table_3_2_2, c2_l1co_initial_and_final_11_bits_match_is_gps_800j_table_3_2_3, c3_legendre_sequence_matches_is_gps_800j_table_6_2_1, the_column_check_rejects_relabelled_inverted_and_shifted_codes)

seg-b289551b0bb5 = iq::signals::lunanet (afs_i_bits, afs_q_primary_bits, legendre_bits); iq::signals::lunanet_tables; iq::lunanet_afs::check_spec

seg-176e3b9ea0e7 = tests/lunanet_afs_codes.rs (b1_afs_i_gold_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b2_the_legendre_sequence_of_length_10223_is_the_printed_table_d1, b3_afs_q_primary_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b1b_not_met_the_printed_g2_state_is_not_the_state_after_the_printed_delay, b1c_post_hoc_the_printed_g2_state_is_the_state_after_2047_minus_the_delay)、tests/iq_signal_matrix.rs (lunanet_afs_i, lunanet_afs_q)

seg-af826b47d00e = { "388" } 行：{ "176" } 行は外部の参照と照合して確認済み、{ "208" } 行はモデルから計算、{ "4" } 行はパートナーの所管です。

seg-6bb40f180cf0 = <s1>前へ</s1>検証ステータス

seg-defb46c5bc80 = <s1>次へ</s1>機能リファレンス
