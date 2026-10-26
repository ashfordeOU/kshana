# docs--kind-lunar-integrity: translations (ja)

seg-8ed008b206de = ソース：<c1/>

seg-26f0cf6d63c0 = <c1/>（シナリオ種別）

seg-4b6daea39f5c = 代表的な LunaNet 中継衛星の集合に対する、月南極の ARAIM 保護レベルのパス。sigma_ure_m は信号空間の測距精度を公開します（保護レベルはこれに比例して線形にスケールするため、これを掃引すれば、警報限界がどの測距精度を要求するかが分かります）。既定値は従来の LNIS クラスの南極のケースです。

seg-a6eb6de27cb5 = <c1/> の 一回の実行の要約：lunar-integrity | 南極 | 0/24 エポックで利用可能（{ "0.0" }%）| AL { "50" } m | σ_URE { "30" } m | HPL { "263" }–{ "452" } m

seg-79da500e2726 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-21d10aa98c33 = 例 <c1/> では、とりわけ次を設定しています：

seg-610fa190a393 = scenarios/lunanet-araim.toml（種別 lunar-integrity）についてエンジンが書き出すグラフ

seg-1903c67a762d = <b>VALIDATED</b> 月の保護レベルの、ジオメトリから共分散への段階 — 全視界および単一故障のすべての部分ジオメトリにわたる (GᵀG)⁻¹ を、局所鉛直に射影したもの。オラクル（ExternalDataset）：確立された第三者の二つの実装を組み合わせ、どちらもオフラインで実行し、フィクスチャはエンドツーエンドで再生成してバイト単位で同一であることを確認しました。RTKLIB 2.4.2-p13（T. Takasu、BSD-2-Clause）、コミット 71db0ff、src/rtkcmn.c を C ソースから -ULAPACK でコンパイル：lsq() → matinv() → ludcmp()/lubksb() が、部分ピボット付きの Crout LU 分解で正規行列の逆行列を求めます。これは kshana の手書きの Gauss-Jordan invert4() とは無関係のアルゴリズムです

seg-3c54da43686e = <s1>前へ</s1>lunar-infrastructure

seg-f6b399c3fd4a = <s1>次へ</s1>lunar-interop-export

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM Airborne Design Document（ADD）v4.2 に従う ARAIM の複数仮説による解分離（araim_reference::add_v42_protection_levels と add_v42_protecti。オラクル（ExternalDataset）：三つの独立したツール。フィクスチャーやオラクル出力が存在する前に事前登録（0123cee1）し、許容差はその時点で固定しました。（{ "1" }）ARAIM：Stanford MAAST for ARAIM { "2" }（コミット ab70e2a3、BSD-3）の mhss_raim_baseline_v5.m を、GNU Octave { "8.4" } 上で別個のプログラムとして実行（ドライバー側に unique() の互換シムを置いています（開示済み、アルゴリズムの変更なし））、ADD の TOL_PL は{ "0.05" } m：Rust 実装は ADD の参照実装を次について再現します
