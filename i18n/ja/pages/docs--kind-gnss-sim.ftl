# docs--kind-gnss-sim: translations (ja)

seg-d5f4762f8455 = ソース：<c1/>

seg-b634bbba2197 = <c1/>（シナリオ種別）

seg-2ffccc9c1eff = 測定領域での疑似距離シミュレーション（Klobuchar 電離圏、Saastamoinen/Niell 対流圏）＋ RAIM。

seg-db93cbad6c6d = <c1/>の一回の実行は次のように要約されます：scenario ab854d9d7886 | gnss-sim | 平均電離圏 19.9m 対流圏 6.8m | RAIM 可用性{ "0.82" } 平均 HPL 22.2m VPL 39.9m 故障率{ "0.000" }

seg-55ee4fdf9240 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>

seg-ee0d38971d08 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>

seg-c7b57e696bc3 = 例の<c1/>では、とりわけ次を設定しています：

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = エンジンが scenarios/gnss-sim-raim.toml（種別 gnss-sim）について出力するグラフ

seg-ccc44a4ac68e = <b>VALIDATED</b> 放送された八個の α/β 係数による Klobuchar 単一周波数 L1 の斜め電離圏群遅延 テスト：<a1>klobuchar_reference.rs</a1>。

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM Airborne Design Document（ADD）v4.2 に従う ARAIM の複数仮説による解分離（araim_reference::add_v42_protection_levels と add_v42_protecti。オラクル（ExternalDataset）：三つの独立したツール。フィクスチャーやオラクル出力が存在する前に事前登録（0123cee1）し、許容差はその時点で固定しました。（{ "1" }）ARAIM：Stanford MAAST for ARAIM { "2" }（コミット ab70e2a3、BSD-3）の mhss_raim_baseline_v5.m を、GNU Octave { "8.4" } 上で別個のプログラムとして実行（ドライバー側に unique() の互換シムを置いています（開示済み、アルゴリズムの変更なし））、ADD の TOL_PL は{ "0.05" } m：Rust 実装は ADD の参照実装を次について再現します

seg-277205e56d73 = <b>VALIDATED</b> 視線方向の幾何から、Q=(HᵀH)⁻¹ とローカル ENU への分解によって求める GDOP/PDOP/HDOP/VDOP/TDOP。オラクル（ExternalDataset）：gnss_lib_py { "1.0.4" }（Stanford NAV Lab）の DOP — 独立したライブラリで、相対{ "1e-6" }まで一致

seg-752829346523 = <b>VALIDATED</b> 放送された八個の α/β 係数による Klobuchar 単一周波数 L1 の斜め電離圏群遅延。オラクル（ExternalDataset）：RTKLIB ionmodel（tomojitakasu/RTKLIB、src/rtkcmn.c）— ソースからコンパイルした独立の参照実装；< { "1e-4" } m まで一致

seg-78ff7db5ad3d = <b>VALIDATED</b> すべての保護レベルの土台となる分布の中核：スナップショット故障検出しきい値 χ²₁₋ₚfₐ(dof)、見逃しの非心度 pbias=√λ、そして。オラクル（ExternalDataset）：SciPy { "1.17.0" }（scipy.stats.chi2/.norm/.ncx2 + optimize.brentq）— 独立したライブラリ（Cephes/Boost）で、Kshana の不完全ガンマ級数とは異なるアルゴリズム；相対≤{ "1e-6" }まで一致。カーネルのみ。ARAIM MHSS の P_HMI バジェットの<em>配分</em>には、もはや公表された数値オラクルがないわけではありません — WG-C ARAIM Technical Subgroup 自身の計算例が、別の「ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = トピックページ：<a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = トピックページ：<a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>前へ</s1>gnss-ins

seg-7d677a362edd = <s1>次へ</s1>gnss-ssv
