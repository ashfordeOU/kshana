# docs--kind-integrity: translations (zh-Hans)

seg-37d29d8303fe = km

seg-8e845ce908ee = 引擎 v{ $version } 的场景类型，所属类别为<a1>GNSS 测量、定位与完好性</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-f6b7ca020692 = 类别页面：<a1>GNSS 测量、定位与完好性</a1>

seg-f4cf8b629797 = 主题页面：<a1>INTEGRITY.md</a1>

seg-5b3dbe0aed82 = <b>MODELLED</b> clock 类型的可选 [integrity] 部分（clock_integrity::run）：根据所述的站点和星座预设（geometry::sky_geometry），在 GNSS 时间线未被拒止的每个完好性历元，进行快照 RAIM（raim::snapshot_ 测试：<a1>clock_integrity.rs</a1>。

seg-ee7dd15019d0 = 主题页面：<a1>CAMPAIGNS.md</a1>

seg-3bc1761c76ab = 有 { "3" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-aec7fc2a4070 = <b>VALIDATED</b> 依据 ARAIM Airborne Design Document（ADD）v4.2 的 ARAIM 多假设解分离（araim_reference::add_v42_protection_levels 与 add_v42_protecti。参考基准（oracle，ExternalDataset）：三种独立工具，在任何夹具或参考基准输出出现之前已预先登记（0123cee1），容差在当时即已固定。（{ "1" }）ARAIM：Stanford MAAST for ARAIM { "2" }（提交 ab70e2a3，BSD-3）mhss_raim_baseline_v5.m，在 GNU Octave { "8.4" } 下作为独立程序运行，驱动端带一个 unique() 兼容垫片（已披露，算法未改动），ADD 的 TOL_PL 取 { "0.05" } m：该 Rust 实现复现了 ADD 参考实现于

seg-277205e56d73 = <b>VALIDATED</b> 由视线几何经 Q=(HᵀH)⁻¹ 并按局部 ENU 分解得到 GDOP/PDOP/HDOP/VDOP/TDOP。参考基准（oracle，ExternalDataset）：gnss_lib_py { "1.0.4" }（Stanford NAV Lab）DOP——独立的库，吻合到相对 { "1e-6" }

seg-78ff7db5ad3d = <b>VALIDATED</b> 每个保护级所依赖的分布核心：快照故障检测门限 χ²₁₋ₚfₐ(dof)、漏检非中心参数 pbias=√λ，以及。参考基准（oracle，ExternalDataset）：SciPy { "1.17.0" }（scipy.stats.chi2/.norm/.ncx2 + optimize.brentq）——独立的库（Cephes/Boost），算法不同于 Kshana 的不完全伽马级数；吻合到相对 ≤{ "1e-6" }。仅限核心部分。ARAIM MHSS P_HMI 预算<em>分配</em>不再是没有已发表数值参考基准的状态——WG-C ARAIM Technical Subgroup 自己的算例现已支撑独立的“ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = 来源：<c1/>

seg-dd304550e695 = <c1/>（场景类型）

seg-eb7e0c2feb2b = 快照/解分离/ARAIM RAIM，含 HPL/VPL 与 Stanford 图。

seg-706887c285d8 = <c1/> 的一次运行汇总为：integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

seg-c3f7debf260a = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>

seg-7b28ab6567df = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-581a5231b230 = 示例 <c1/> 设置了以下内容等：

seg-ce7f6130ddee = 引擎为 scenarios/integrity-raim.toml（类型 integrity）生成的图表

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }：点名该类型的<a1>验证矩阵</a1>行。

seg-dff469738ec3 = <b>VALIDATED</b> 针对异构来源的标量时间解分离 TPL；PL 由最坏排除子集噪声 + UTC(k) 偏差驱动

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ))；下半连续 PL({ "0" }+)≥PL({ "0" }−)；K(IR/2) 滑动最大值；τ/τ³/τ⁵ 相位指数

seg-4787b0b565df = <b>VALIDATED</b> 滑动最大值包络在不相交段上、在每个测试的滞后 tau>=90d 处都过界覆盖（零穿越）真实的计量学序列；短 tau（<=30d）是已披露的由模型计算得出的边界 测试：<a1>cti_holdover_coverage_reference.rs</a1>。

seg-090415eca3b7 = 矩阵中另有 { "6" } 项。

seg-b4bc9ccbcee2 = <s1>上一页</s1>ins-trn-coast

seg-f1ba804baade = <s1>下一页</s1>jamming
