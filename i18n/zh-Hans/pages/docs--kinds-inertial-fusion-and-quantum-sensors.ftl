# docs--kinds-inertial-fusion-and-quantum-sensors: translations (zh-Hans)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = 类别

seg-ec26df467b88 = 基于同一组混合输入的联合卡尔曼传感器融合 PNT。

seg-c8a1c797f4b1 = 引擎为 scenarios/fusion-pnt.toml（类型 fusion）生成的图表

seg-38df285a3f25 = 松耦合与紧耦合 GNSS/INS 误差状态 EKF。

seg-7d993b676006 = 引擎为 scenarios/gnss-ins.toml（类型 gnss-ins）生成的图表

seg-c6edf89eb8d4 = 17 状态量子+经典混合紧耦合 GNSS/INS UKF（MODELLED）：{ "15" } 个 INS 误差状态 + 由 CAI 导出的加速度计偏置修正 + 来自 q 参数时钟引擎的 2 状态（相位+频率）时钟，由有界的 CAI 误差模型驱动。性能指标是滤波器的自洽性（NEES + 新息白度对照 χ² 界限）——这是自洽性陈述，不是对真实世界精度的保证。仅为仿真；无 TRL>{ "3" }，无飞行继承，无外部验证。

seg-2968660fa880 = 引擎为 scenarios/hybrid-ukf.toml（类型 hybrid-ukf）生成的图表

seg-22cd963c7042 = 混合 PNT 综合场景：时钟 + IMU + 时间传递辅助。

seg-52378a7b074c = 引擎为 scenarios/hybrid-pnt.toml（类型 hybrid）生成的图表

seg-bdedf28adc48 = GNSS 中断期间的 1-DOF 惯性航位推算。

seg-873c402bb724 = 引擎为 scenarios/imu-deadreckoning.toml（类型 inertial）生成的图表

seg-5b9a6efe6337 = INS/TRN 惰行误差模型：位置误差随惰行时长变化，由 IMU 系数构建，而不是按假定的漂移率扫描。五项增长贡献——加速度计偏置、经重力产生的陀螺偏置倾斜、速度随机游走、角度随机游走，以及随行进距离变化的标度因数——各自通过在所述纬度和高度带 Schuler 反馈的九状态局部水平惯性误差模型传播（旁边同时给出短惰行的首阶定律 t²、t³、t^{ "1.5" }、t^{ "2.5" } 和 t¹/t²），并按所述规则合成（默认为方和根，或线性求和，或确定性求和加随机项方和根；每次运行三种都会计算，使选择一目了然而不被掩盖）。达到调用方给定位置阈值（默认 { "10" } m 和 { "50" } m）的惰行时长由引擎现有的二分法求出，每项都附有指明主导来源的分贡献细目，并且每项单一贡献的穿越点还另以代数方法反演，使两者相符。地形相对导航模式以周期性位置修正约束惰行，并报告能满足各阈值的最大修正间隔；仅位置的修正会使速度误差和倾斜在修正前后依然存在，因此它并不总能在任何修正速率下约束惰行，报告会如实说明这一点，而不是返回零。MODELLED：IMU 等级系数为具代表性的区间数值，不是数据手册，地形修正残差是输入。未达到的阈值报告为带状态的 null，绝不报告为零。不是经认证的惯性导航性能产品。

seg-134a4c91da3a = 引擎为 scenarios/ins-trn-coast.toml（类型 ins-trn-coast）生成的图表

seg-4e31c8daf798 = 台账

seg-9095869ec445 = { "9" } 个场景类型，来自引擎 v{ $version }。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为 MODELLED（标签如何获得，见 README 的“证据”一节）。

seg-efd15cff3d32 = MODELLED（结果标签）

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-e6f2ab1647e2 = 来源：<c1/>

seg-23762f3a250b = 惯性、融合与量子传感器（场景类型族）

seg-6ec3ad751007 = 专题页面：<a1>QUANTUM-MODELS</a1>、<a2>QUANTUM</a2>、<a3>LEO-PNT-FUSION</a3>。运行一个：<c1/>。所有类型族：<a4>KINDS.md</a4>。

seg-0e73a37b716b = 引擎为“惯性、融合与量子传感器”类型族的各类型生成的图表缩略总览

seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

seg-084cf4eeccb5 = 17 状态的量子+经典混合紧耦合 GNSS/INS UKF（MODELLED）：{ "15" } 个 INS 误差状态 + 由 CAI 导出的加速度计零偏修正 + 取自 q 参数时钟引擎的 2 状态（相位+频率）时钟

seg-a7d3c32b29b3 = INS/TRN 惯性滑行误差模型：位置误差随滑行时长的变化，由 IMU 系数构建，而不是按假定的漂移率扫描。

seg-beb568dec44f = MODELLED 无 GNSS 的量子导航：在 GNSS 中断期间，量子（冷原子干涉仪）惯性预算对比经典导航级 INS——滑行期间的位置误差增长、守时

seg-d948ea4d1f33 = MODELLED 量子 PNT 系统的故障/异常检测：带标注的故障目录（时钟频率跳变/漂移/失锁；传感器零偏阶跃/丢失）、检测统计量的 ROC AUC（附 bootstrap 置信区间

seg-48e72d451a50 = 量子与经典 PNT 的权衡（{ "13503" }）：候选时钟（实测 ADEV 曲线——可辩护性的关键——或某个量子时钟等级）在授时守时和惯性守时上的收益，对比经典基

seg-5330b47bc0b6 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>。可选字段：<c7/>。

seg-75867e8b4b4f = <b>台账：</b>MODELLED { "6" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>inertial</a1>。

seg-fdf140d4ce68 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>。

seg-44c6371da5f9 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>hybrid</a1>。

seg-3246c9e1e0cb = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>。可选字段：<c11/>。

seg-e2bd8fd0d9e5 = <b>台账：</b>MODELLED { "4" } · VALIDATED { "4" }。完整页面（含输入、结果、证据与局限）：<a1>fusion</a1>。

seg-d0790a2643ae = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>。可选字段：<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>。

seg-85ab600e3050 = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>hybrid-ukf</a1>。

seg-3bbd5ce09bee = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>。可选字段：<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>。

seg-08ad3969f65b = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>gnss-ins</a1>。

seg-1703619ca20e = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>。

seg-ab3453d1ee51 = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>ins-trn-coast</a1>。

seg-a77cdf6e8e31 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>。

seg-b05e96ce392d = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>quantum-gnss-free-nav</a1>。

seg-3f3e48045d31 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>。

seg-cbefb1538dec = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>quantum-anomaly-detect</a1>。

seg-6eee03151521 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>。可选字段：<c5/>、<c6/>、<c7/>、<c8/>。

seg-6cb57dc94549 = <b>台账：</b>MODELLED { "1" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>quantum-trade</a1>。

seg-b6c31bdda166 = <s1>上一页</s1>GPS 拒止环境下的替代 PNT

seg-0585e4ae329e = <s1>下一页</s1>压制干扰、欺骗干扰与频谱
