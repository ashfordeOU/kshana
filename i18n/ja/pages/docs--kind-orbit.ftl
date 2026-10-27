# docs--kind-orbit: translations (ja)

seg-ae15d15bf151 = トピックページ：<a1>LEO-PASS.md</a1>

seg-99a3c57c7926 = 同梱のシナリオのうち { "7" } 件がこの種別を使用しています。残りは <a1><c1/></a1> にあります。

seg-0e3518dc3ddb = ソース：<c1/>

seg-1428025a91e1 = <c1/>（シナリオの種類）

seg-cb4262b66b8f = 衛星コンステレーション（Walker / TLE / RINEX）による GNSS の可用性と DOP。

seg-97680b4587c8 = <c1/> の一回の実行の要約は次のとおりです：シナリオ bffc887db977 | 77/361 サンプルが GNSS 正常 | 最良 PDOP { "2.53" } 位置 2.53m | 量子ホールドオーバー 0s p95 6.49e-5ns インテグリティ { "1.000" } セキュリティ n/a（攻撃なし） | 古典的ホールドオーバー 0s p95 25.0ns インテグリティ { "1.000" } セキュリティ n/a（攻撃なし）

seg-b3a080b98bd9 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-c818cc4f87da = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-364139ff447d = 例の <c1/> では、とりわけ次を設定しています：

seg-d5063dda3971 = Microchip SA.45s / SA65 チップスケール原子時計、sigma_y(1s)

seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

seg-3b652c0da6de = エンジンが scenarios/orbit-rinex.toml（種類 orbit）に対して出力するグラフ

seg-a150aaacf072 = <b>VALIDATED</b> 視線方向のジオメトリから Q=(HᵀH)⁻¹ により求める GDOP/PDOP/HDOP/VDOP/TDOP。局所 ENU への分解を伴います。テスト：<a1>dop_reference.rs</a1>。

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry と check：エンジン自身の反復最小二乗測位解（pvt::solve_spp、単位重み、真の位置から解く）に対する、シード付きモンテカルロ（ジオメトリごとに N = { "20,000" } エポック、sigma = { "1.5" } m、ChaCha8 のシード { "36" } + i）について。テスト：<a1>uere_dop_monte_carlo.rs</a1>。

seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry：地上局から見た衛星の測地（WGS-84）方位角と仰角、方位角で線形補間し { "360" } 度で折り返す方位角・仰角マスク表、可視集合の仰角。テスト：<a1>skyline_orekit_oracle.rs</a1>。

seg-d86884be3f98 = <s1>前へ</s1>optical-atmosphere

seg-da202333ae8d = <s1>次へ</s1>passes

seg-d291f20074f0 = <b>VALIDATED</b> 軌道経路上の二部構成 UT1 ユリウス日から地球自転を求めることで、地球固定座標の位置が、単一の f64 日付では失われるマイクロ秒を保ちます（{ "2020" }年付近で約{ "3e-9" } rad）：jd2::gmst82（IAU { "1982" } GMST、二部に対する TEME の規約）、cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }：この種別を挙げる<a1>検証マトリクス</a1>の行です。

seg-277205e56d73 = <b>VALIDATED</b> 視線方向の幾何から、Q=(HᵀH)⁻¹ とローカル ENU への分解によって求める GDOP/PDOP/HDOP/VDOP/TDOP。オラクル（ExternalDataset）：gnss_lib_py { "1.0.4" }（Stanford NAV Lab）の DOP — 独立したライブラリで、相対{ "1e-6" }まで一致

seg-53a78e98af12 = トピックページ：<a1>SKYLINE.md</a1>

seg-debc2f07db78 = true

seg-11e8c29ecb45 = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>コンステレーション、カバレッジ、幾何</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-a4f1e7d2041e = ファミリーページ：<a1>コンステレーション、カバレッジ、幾何</a1>

seg-be831b52a339 = マトリクスにはさらに{ "4" }件あります。

seg-a8d92406e428 = ストロンチウム光格子時計、宇宙向けの目標sigma_y

seg-f70076ea4a77 = <b>VALIDATED</b>アラン偏差／修正アラン偏差／アダマール偏差と、χ² 信頼区間付きのべき乗則ノイズの同定。オラクル（ExternalDataset）：NIST SP { "1065" }（Riley）／NBS14に対するStable32の参照偏差

seg-5278ccdaf16f = <b>MODELLED</b>閉形式の惰性誤差増大としきい値までのホールドオーバー、量子時計のクラス。オラクル（ReferenceImpl）：複数ステップのclock_stateの共分散漸化（同じコードベース内でのクロスチェック）。基礎となる惰性分散とホールドオーバー逆算のカーネルは、scipyに対して外部で照合済みです（「Clock-holdover coast-variance & threshold inversion」を参照）。クラスごとのレッドノイズフロアのホールドオーバーの数値はMODELLEDのままです

seg-3ea0aa9b3907 = <b>MODELLED</b> 3状態（位相／周波数／ドリフト）のvan-Loanカルマン時計、ジョセフ形で安定化。オラクル（ReferenceImpl）：filterpy { "1.4.5" }のKalmanFilter（R. Labbe、MIT）、Fはscipy.linalg.expm、QはVan-Loan { "1978" }のブロック行列によるもの。kshanaのフィルター軌跡全体を再現する、独立した参照実装です。実装間の整合性：時計の物理とアラン偏差の較正は外部の参照とは照合されていないため、これはMODELLEDのままです。{ "0.30" }外部比較、所見（MODELLEDのまま）：IGSの最終{ "30" }秒クロック、{ "11" }機のGPS Blo

seg-b9174c70772f = <b>MODELLED</b>時計支援の χ²、RAIM、AGC、SQMをエポックごとに融合したセキュリティFoM。オラクル（ExternalDataset）：TEXBATのシナリオパラメーター（Humphreys { "2012" }）— 特性評価であり、固定したベクトルではありません。{ "0.30" }外部比較、所見（MODELLEDのまま）：JammerTest { "2024" }（Bleik、GPL-3.0のデータ）では、観測量レベルのモニター（時計支援のカイ二乗、RAIM、解の失敗）は、評価可能な公表済みスプーフィング開始{ "8" }件のいずれについても{ "10" }秒以内に警報を出しませんでした（開始前のウィンドウがクリーンだった場合、最初の警報は{ "10.2" }〜{ "39" }秒後に出ました。公

seg-e12f672ae71d = GNSSが使えない状況での時計のホールドオーバーはMODELLEDであり、独立した外部の参照との照合はされていません。同じコードベース内の別個の実装に照らして確認しており、テスト対象のユニットからは独立していますが、外部の権威あるものではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-8de95b3a9229 = 搭載時計の状態推定はMODELLEDであり、独立した外部の参照との照合はされていません。同じコードベース内の別個の実装に照らして確認しており、テスト対象のユニットからは独立していますが、外部の権威あるものではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-e4b64d7277da = スプーフィングの検出はMODELLEDであり、独立した外部の参照との照合はされていません。サブクレームの一つは外部で確認されていますが、機能全体はモデルから計算した要素を組み合わせているため、この機能はモデルから計算したものにとどまります。（検証マトリクス（docs/MODELLED-RATIONALE.md））
