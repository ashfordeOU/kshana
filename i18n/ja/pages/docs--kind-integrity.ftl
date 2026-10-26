# docs--kind-integrity: translations (ja)

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM Airborne Design Document（ADD）v4.2 に従う ARAIM の複数仮説による解分離（araim_reference::add_v42_protection_levels と add_v42_protecti。オラクル（ExternalDataset）：三つの独立したツール。フィクスチャーやオラクル出力が存在する前に事前登録（0123cee1）し、許容差はその時点で固定しました。（{ "1" }）ARAIM：Stanford MAAST for ARAIM { "2" }（コミット ab70e2a3、BSD-3）の mhss_raim_baseline_v5.m を、GNU Octave { "8.4" } 上で別個のプログラムとして実行（ドライバー側に unique() の互換シムを置いています（開示済み、アルゴリズムの変更なし））、ADD の TOL_PL は{ "0.05" } m：Rust 実装は ADD の参照実装を次について再現します

seg-277205e56d73 = <b>VALIDATED</b> 視線方向の幾何から、Q=(HᵀH)⁻¹ とローカル ENU への分解によって求める GDOP/PDOP/HDOP/VDOP/TDOP。オラクル（ExternalDataset）：gnss_lib_py { "1.0.4" }（Stanford NAV Lab）の DOP — 独立したライブラリで、相対{ "1e-6" }まで一致

seg-78ff7db5ad3d = <b>VALIDATED</b> すべての保護レベルの土台となる分布の中核：スナップショット故障検出しきい値 χ²₁₋ₚfₐ(dof)、見逃しの非心度 pbias=√λ、そして。オラクル（ExternalDataset）：SciPy { "1.17.0" }（scipy.stats.chi2/.norm/.ncx2 + optimize.brentq）— 独立したライブラリ（Cephes/Boost）で、Kshana の不完全ガンマ級数とは異なるアルゴリズム；相対≤{ "1e-6" }まで一致。カーネルのみ。ARAIM MHSS の P_HMI バジェットの<em>配分</em>には、もはや公表された数値オラクルがないわけではありません — WG-C ARAIM Technical Subgroup 自身の計算例が、別の「ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = ソース：<c1/>

seg-dd304550e695 = <c1/>（シナリオ種別）

seg-eb7e0c2feb2b = スナップショット／解分離／ARAIM の RAIM と、HPL/VPL、Stanford ダイアグラム。

seg-706887c285d8 = <c1/>の一回の実行は次のように要約されます：integrity | 衛星{ "24" }機 | 344/361 エポックで利用可能（{ "95.3" }%） | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V)：インテグリティイベント{ "0" }件、HMI { "0" }件

seg-c3f7debf260a = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>

seg-7b28ab6567df = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-581a5231b230 = 例の<c1/>では、とりわけ次を設定しています：

seg-ce7f6130ddee = エンジンが scenarios/integrity-raim.toml（種別 integrity）について出力するグラフ

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }：この種別を挙げる<a1>検証マトリクス</a1>の行です。

seg-dff469738ec3 = <b>VALIDATED</b> 異種ソースに対するスカラー時刻の解分離 TPL；PL は最悪の除外サブセットの雑音＋UTC(k) バイアスで決まります

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ))；下半連続 PL({ "0" }+)≥PL({ "0" }−)；K(IR/2) の走行最大値；τ/τ³/τ⁵ の位相指数

seg-4787b0b565df = <b>VALIDATED</b> 走行最大値の包絡線が、実際の計量学的な系列を、重ならない区間でテストしたすべてのラグ tau>=90d で過大に覆い（ゼロを突き抜けない）；短い tau（<=30d）は、開示されたモデルに基づく境界です テスト：<a1>cti_holdover_coverage_reference.rs</a1>。

seg-090415eca3b7 = さらに{ "6" }件が検証マトリクスにあります。

seg-b4bc9ccbcee2 = <s1>前へ</s1>ins-trn-coast

seg-f1ba804baade = <s1>次へ</s1>jamming
