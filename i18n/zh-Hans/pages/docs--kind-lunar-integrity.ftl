# docs--kind-lunar-integrity: translations (zh-Hans)

seg-1f17ef6a853e = 引擎 v{ $version } 的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-aec7fc2a4070 = <b>VALIDATED</b> 依据 ARAIM Airborne Design Document（ADD）v4.2 的 ARAIM 多假设解分离（araim_reference::add_v42_protection_levels 与 add_v42_protecti。参考基准（oracle，ExternalDataset）：三种独立工具，在任何夹具或参考基准输出出现之前已预先登记（0123cee1），容差在当时即已固定。（{ "1" }）ARAIM：Stanford MAAST for ARAIM { "2" }（提交 ab70e2a3，BSD-3）mhss_raim_baseline_v5.m，在 GNU Octave { "8.4" } 下作为独立程序运行，驱动端带一个 unique() 兼容垫片（已披露，算法未改动），ADD 的 TOL_PL 取 { "0.05" } m：该 Rust 实现复现了 ADD 参考实现于

seg-8ed008b206de = 来源：<c1/>

seg-26f0cf6d63c0 = <c1/>（场景类型）

seg-4b6daea39f5c = 月球南极 ARAIM 保护级计算，对照一组具有代表性的 LunaNet 中继卫星。sigma_ure_m 给出空间信号测距精度（保护级与它呈线性比例，因此对它作扫描即可回答某个告警限值需要多高的测距精度）。默认为历史上的 LNIS 级南极算例。

seg-a6eb6de27cb5 = <c1/> 的一次运行概括如下：lunar-integrity | 南极 | 0/24 个历元可用（{ "0.0" }%）| AL { "50" } m | σ_URE { "30" } m | HPL { "263" }–{ "452" } m

seg-79da500e2726 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-21d10aa98c33 = 示例 <c1/> 设置了下列内容等：

seg-610fa190a393 = 引擎为 scenarios/lunanet-araim.toml（类型 lunar-integrity）生成的图表

seg-1903c67a762d = <b>VALIDATED</b> 月球保护级中从几何到协方差的步骤——对全部可见及每个单故障子几何计算 (GᵀG)⁻¹，并投影到局部垂向 . 参考基准（oracle，ExternalDataset）：由两个成熟的第三方实现组合而成，均离线运行，并将测试数据从头重新生成，核验为逐字节相同。RTKLIB 2.4.2-p13（T. Takasu，BSD-2-Clause），提交 71db0ff，src/rtkcmn.c 以 -ULAPACK 由 C 源码编译：lsq() → matinv() → ludcmp()/lubksb() 以带部分主元的 Crout LU 对法矩阵求逆，这一算法与 kshana 手写的 Gauss-Jordan invert4() 无关

seg-3c54da43686e = <s1>上一页</s1>lunar-infrastructure

seg-f6b399c3fd4a = <s1>下一页</s1>lunar-interop-export
