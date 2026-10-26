# docs--kind-orbit: translations (zh-Hans)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = 引擎 v{ $version } 的场景类型，所属类别为<a1>星座、覆盖与几何</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-a4f1e7d2041e = 类别页面：<a1>星座、覆盖与几何</a1>

seg-be831b52a339 = 以及矩阵中另有 { "4" } 项。

seg-a8d92406e428 = 锶光晶格钟，面向空间应用的目标 sigma_y

seg-f70076ea4a77 = <b>VALIDATED</b> 阿伦/修正/哈达玛偏差加带 χ² 置信区间的幂律噪声识别。参考基准（ExternalDataset）：NIST SP { "1065" }（Riley）/ Stable32 在 NBS14 上的参考偏差

seg-5278ccdaf16f = <b>MODELLED</b> 闭式滑行误差增长加守时到阈值；量子时钟等级。参考基准（ReferenceImpl）：多步 clock_state 协方差递推（同一代码库内的交叉检查）；底层的滑行方差与守时反演核对照 scipy 经外部验证（见“Clock-holdover coast-variance & threshold inversion”）。各等级的红噪声底守时数字仍为 MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3状态（相位/频率/漂移）van-Loan 卡尔曼时钟，Joseph 稳定化。参考基准（ReferenceImpl）：filterpy { "1.4.5" } KalmanFilter（R. Labbe，MIT），F 通过 scipy.linalg.expm 得到，Q 通过 Van-Loan { "1978" } 分块矩阵得到：这是一个独立的参考实现，复现了 kshana 的完整滤波器轨迹。跨实现一致性：时钟物理和阿伦校准没有经外部验证，因此该行仍为 MODELLED。{ "0.30" } 外部比较，一项发现（仍为 MODELLED）：在 { "11" } 颗 GPS Blo 的 IGS 最终 { "30" } s 钟差上

seg-b9174c70772f = <b>MODELLED</b> 钟辅助 χ²、RAIM、AGC、SQM 融合的逐历元安全性 FoM。参考基准（ExternalDataset）：TEXBAT 场景参数（Humphreys { "2012" }）：是特性描述，不是固定的向量。{ "0.30" } 外部比较，一项发现（仍为 MODELLED）：在 JammerTest { "2024" }（Bleik；GPL-3.0 数据）上，观测量层面的监测器（钟辅助卡方、RAIM、求解失败）在 { "8" } 个可评估的已发布欺骗干扰起始时刻中的任何一个之后 { "10" } s 内都没有报警（在起始前窗口干净的情况下，首次报警出现在 { "10.2" } 至 { "39" } s 之后，起始 pu

seg-e12f672ae71d = GNSS 拒止下的时钟守时为 MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-8de95b3a9229 = 星载时钟状态估计为 MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e4b64d7277da = 欺骗干扰检测为 MODELLED，而不是经独立验证：其中一项子声明经过外部核对，但整项能力由模型计算的部分组合而成，因此该能力仍属于由模型计算得出一级。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-d291f20074f0 = <b>VALIDATED</b> 轨道路径上由两部分 UT1 儒略日得到的地球自转，使地固位置保留单个 f64 日期所丢失的微秒量级精度（{ "2020" } 年前后约 { "3e-9" } rad）：jd2::gmst82（IAU { "1982" } GMST，即 TEME 约定，作用于两部分），cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }：点名该类型的<a1>验证矩阵</a1>行。

seg-277205e56d73 = <b>VALIDATED</b> 由视线几何经 Q=(HᵀH)⁻¹ 并按局部 ENU 分解得到 GDOP/PDOP/HDOP/VDOP/TDOP。参考基准（oracle，ExternalDataset）：gnss_lib_py { "1.0.4" }（Stanford NAV Lab）DOP——独立的库，吻合到相对 { "1e-6" }

seg-53a78e98af12 = 主题页面：<a1>SKYLINE.md</a1>

seg-ae15d15bf151 = 主题页面：<a1>LEO-PASS.md</a1>

seg-99a3c57c7926 = 有 { "7" } 个随附场景使用此类型；其余的在 <a1><c1/></a1> 中。
