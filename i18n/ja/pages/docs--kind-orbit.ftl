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
