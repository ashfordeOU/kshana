# docs--kind-gnss-sim: translations (zh-Hans)

seg-37d29d8303fe = km

seg-51362910dcb7 = 有 { "2" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-8e845ce908ee = 引擎 v{ $version } 的场景类型，所属类别为<a1>GNSS 测量、定位与完好性</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-3068552e4ab4 = VALIDATED：列出此类型的<a1>验证矩阵</a1>各行。

seg-f6b7ca020692 = 类别页面：<a1>GNSS 测量、定位与完好性</a1>

seg-d5f4762f8455 = 来源：<c1/>

seg-b634bbba2197 = <c1/>（场景类型）

seg-2ffccc9c1eff = 测量域伪距仿真（Klobuchar 电离层、Saastamoinen/Niell 对流层）+ RAIM。

seg-db93cbad6c6d = <c1/> 的一次运行汇总为：scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

seg-55ee4fdf9240 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>

seg-ee0d38971d08 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>

seg-c7b57e696bc3 = 示例 <c1/> 设置了以下内容等：

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = 引擎为 scenarios/gnss-sim-raim.toml（类型 gnss-sim）生成的图表

seg-ccc44a4ac68e = <b>VALIDATED</b> 由八个广播 α/β 系数得出的 Klobuchar 单频 L1 斜向电离层群延迟 测试：<a1>klobuchar_reference.rs</a1>。

seg-aec7fc2a4070 = <b>VALIDATED</b> 依据 ARAIM Airborne Design Document（ADD）v4.2 的 ARAIM 多假设解分离（araim_reference::add_v42_protection_levels 与 add_v42_protecti。参考基准（oracle，ExternalDataset）：三种独立工具，在任何夹具或参考基准输出出现之前已预先登记（0123cee1），容差在当时即已固定。（{ "1" }）ARAIM：Stanford MAAST for ARAIM { "2" }（提交 ab70e2a3，BSD-3）mhss_raim_baseline_v5.m，在 GNU Octave { "8.4" } 下作为独立程序运行，驱动端带一个 unique() 兼容垫片（已披露，算法未改动），ADD 的 TOL_PL 取 { "0.05" } m：该 Rust 实现复现了 ADD 参考实现于

seg-277205e56d73 = <b>VALIDATED</b> 由视线几何经 Q=(HᵀH)⁻¹ 并按局部 ENU 分解得到 GDOP/PDOP/HDOP/VDOP/TDOP。参考基准（oracle，ExternalDataset）：gnss_lib_py { "1.0.4" }（Stanford NAV Lab）DOP——独立的库，吻合到相对 { "1e-6" }

seg-752829346523 = <b>VALIDATED</b> 由八个广播 α/β 系数得出的 Klobuchar 单频 L1 斜向电离层群延迟。参考基准（oracle，ExternalDataset）：RTKLIB ionmodel（tomojitakasu/RTKLIB，src/rtkcmn.c）——由源码编译的独立参考实现；吻合到 < { "1e-4" } m

seg-78ff7db5ad3d = <b>VALIDATED</b> 每个保护级所依赖的分布核心：快照故障检测门限 χ²₁₋ₚfₐ(dof)、漏检非中心参数 pbias=√λ，以及。参考基准（oracle，ExternalDataset）：SciPy { "1.17.0" }（scipy.stats.chi2/.norm/.ncx2 + optimize.brentq）——独立的库（Cephes/Boost），算法不同于 Kshana 的不完全伽马级数；吻合到相对 ≤{ "1e-6" }。仅限核心部分。ARAIM MHSS P_HMI 预算<em>分配</em>不再是没有已发表数值参考基准的状态——WG-C ARAIM Technical Subgroup 自己的算例现已支撑独立的“ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = 主题页面：<a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = 主题页面：<a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>上一页</s1>gnss-ins

seg-7d677a362edd = <s1>下一页</s1>gnss-ssv
