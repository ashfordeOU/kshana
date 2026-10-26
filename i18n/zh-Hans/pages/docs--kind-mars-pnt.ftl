# docs--kind-mars-pnt: translations (zh-Hans)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = 引擎 v{ $version } 的场景类型，所属类别为<a1>星座、覆盖与几何</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-45259ad33a01 = <b>MODELLED</b> <c1/> 类型：围绕按名称选定的天体运行的轨道器或表面着陆器，利用该天体周围 Walker 导航星座（二体轨道，含该天体的 J2 长期漂移，用户时钟未知

seg-a4f1e7d2041e = 类别页面：<a1>星座、覆盖与几何</a1>

seg-670191cf797f = 主题页面：<a1>SOLAR-SYSTEM.md</a1>

seg-3ea0aa9b3907 = <b>MODELLED</b> 3状态（相位/频率/漂移）van-Loan 卡尔曼时钟，Joseph 稳定化。参考基准（ReferenceImpl）：filterpy { "1.4.5" } KalmanFilter（R. Labbe，MIT），F 通过 scipy.linalg.expm 得到，Q 通过 Van-Loan { "1978" } 分块矩阵得到：这是一个独立的参考实现，复现了 kshana 的完整滤波器轨迹。跨实现一致性：时钟物理和阿伦校准没有经外部验证，因此该行仍为 MODELLED。{ "0.30" } 外部比较，一项发现（仍为 MODELLED）：在 { "11" } 颗 GPS Blo 的 IGS 最终 { "30" } s 钟差上

seg-8de95b3a9229 = 星载时钟状态估计为 MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-3bc1761c76ab = 有 { "3" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。
