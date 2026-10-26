# docs--kinds-clocks-timing-and-holdover: translations (zh-Hans)

seg-b03d56f501c3 = 类别

seg-78cba87823f7 = 时钟守时对照规格；可选的蒙特卡罗集合（运行次数 > { "1" }）。

seg-cb0b7da83f5c = 引擎为 scenarios/clock-ensemble.toml（类型 clock）生成的图表

seg-c0924aa36e64 = MODELLED 的授时系统守时（holdover）测试，依据由操作人员提供的钟差记录（时间误差记录）评分（linuxptp 的 ptp4l、phc2sys 或 ts2phc 日志，chrony 的 tracking 或 statistics 日志，TICC、TimeLab 或 RINEX 钟日志，或 time_s,time_error_ns 数据对）。该测试分四步，Kshana 一步也不执行：已锁定的基线，由操作人员在所述时刻移除 GNSS（天线电缆或模拟器输出；Kshana 不发射、也不驱动任何东西），系统凭自身振荡器守时，以及操作人员在第二个所述时刻恢复 GNSS 后的恢复。记录在这两个时刻处被切分。基线：钟差统计量以及针对已锁定时钟编写的 ITU-T 模板。守时：统计量、系统保持的分数频率偏移（最小二乘直线）、针对守时或自主时钟编写的模板、由所述已锁定时长得出的 ePRTC-A 守时包络，以及超出各钟差预算的时间。恢复：|TE| 是否以及何时进入所述范围并保持在其中，峰值与最大阶跃。每一项限值均转录自公开的 ITU-T 表格（电信授时模板）；用语为“对照模板测得”，这两个时刻是操作人员的陈述，未经验证。对于某个模板而言过短的记录为 INCOMPLETE，绝不外推。参见 docs/TIMING-HIL.md。

seg-8ce93392747b = 引擎为 scenarios/holdover-test-ptp4l.toml（类型 holdover-test）生成的图表

seg-4f19d4fb1341 = 通过点分 TOML 键/JSON 指标路径，对任意包进行的通用 N 维扫描。

seg-621a18c07044 = 引擎为 scenarios/sweep-nd-inertial.toml（场景类型 sweep-nd）生成的图表

seg-e7ab7b55c969 = 针对时钟包参数的 1-D 权衡研究扫描。

seg-c784b8f22f12 = 引擎为 scenarios/sweep-clock-stability.toml（场景类型 sweep）生成的图表

seg-a448b24ded2b = 电信授时：GNSS 守时（holdover）的钟差、最大时间间隔误差（MTIE）和时间偏差（TDEV），对照 ITU-T 模板检查，每个模板给出 PASS 或 FAIL 及余量。输入为以下两种之一：一是合成守时（SYNTHETIC HOLDOVER，即某个振荡器预设——ocxo、铷、铯或 csac，每种都带有某份具名的 Microchip 公开数据手册中的稳定度、老化和温度数据——加上 GNSS 丢失时间、记录长度和采样间隔；自由运行的时钟带有白频率噪声、闪烁频率噪声，以及数据手册拟合需要时的随机游走频率噪声，另有线性老化和正弦温度项），二是摄入的序列（INGESTED SERIES，即内联给出的 [time_s, time_error_ns] 数据对，仅在原生构建中还可使用 CSV 文件）。模板：ITU-T G.8272（07/2025）PRTC-A 和 PRTC-B（max|TE| 分别为 { "100" } / { "40" } ns，MTIE 表 1-2，TDEV 表 3-4）；G.8272.1（{ "2024" }）Amd. { "1" }（07/2025）ePRTC 锁定（{ "30" } ns，表 1-2）和 ePRTC-A 守时（表{ "3" }的时间误差包络，在由锁定时长设定的守时期 H 内从 { "30" } ns 上升到 { "100" } ns，MTIE 表{ "4" }，TDEV 表{ "5" }）；G.8273.2（{ "2023" }）Amd. { "2" }（11/2025）T-BC/T-TSC A-C 类（max|TE|、恒定时间误差、低通滤波后的 MTIE 和 TDEV）以及 D 类（max|TE_L| { "5" } ns，这是 D 类中唯一未留待进一步研究的数值）；G.8271.1（{ "2022" }）Amd. { "3" }（05/2025）参考点 C（max|TE_L| 分别为 { "1100" } / { "600" } / { "100" } ns，MTIE 表 7-1 至 7-3）。凡建议书标注为留待进一步研究的条目一律缺省，不予填补，每份报告都会列出未实现的内容。还报告超出各最大时间误差预算所需的时间（默认值：{ "100" } ns 为 ePRTC max|TE_HO|，{ "400" } ns 为网络守时分配，{ "1100" } ns 为 C 点，{ "1.5" } us 为 { "4" } 类）、附有各模板限值的 CSV 表形式的 MTIE/TDEV 曲线，以及每个数值字段的单位与出处条目。VALIDATED：MTIE 和 TDEV 估计器已在一条已提交的守时序列上与 allantools 软件包核对一致。MODELLED：模板表是转录而来，合成守时是依据数据手册最大值构建的模型，而非对任何设备的测量。不是一致性测试。

seg-ec7745a09d08 = 引擎为 scenarios/telecom-synce-eec.toml（场景类型 telecom-timing）生成的图表

seg-9a2bb9809aed = 两个站点之间经由地球静止中继的双向卫星时间频率传递：求解 T_A - T_B 的双向方程，计入所有非互易项（站点设备时延、Ku 波段电离层、转发器、Sagnac），一个正交合成的不确定度预算，其 A 类项为模拟链路在平均时间处的 TDEV，一条带有白相位噪声、闪烁相位噪声和昼夜非互易性的模拟链路，以及任何提供的 BIPM Circular T 第 { "1" } 节序列、MJD,ns CSV 或 IGS RINEX 站钟记录的稳定度（速率、残差 RMS、TDEV、ADEV）。MODELLED。

seg-92d3c84024d7 = 引擎为 scenarios/time-transfer-budget.toml（场景类型 time-transfer-budget）生成的图表

seg-ccb244e60d60 = 光学与射频的双向时间/频率传递对比。

seg-bd76bd68eab3 = 引擎为 scenarios/timetransfer.toml（场景类型 timetransfer）生成的图表

seg-4e31c8daf798 = 台账

seg-45a59bc9ac90 = 来源：<c1/>

seg-3b549536beed = 时钟、授时与守时（场景类型族）

seg-9095869ec445 = { "9" } 个场景类型，来自引擎 v{ $version }。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为 MODELLED（标签如何获得，见 README 的“证据”一节）。

seg-59c2beac56b5 = 专题页面：<a1>TELECOM-TIMING</a1>、<a2>SLOT-TIMING</a2>、<a3>TIMING-HIL</a3>、<a4>CLOCK-LOG-FORMATS</a4>。运行一个：<c1/>。所有类型族：<a5>KINDS.md</a5>。

seg-b333618375db = 引擎为“时钟、授时与守时”类型族的各类型生成的图表缩略总览

seg-efd15cff3d32 = MODELLED（结果标签）

seg-ff7dca09f0f2 = 电信授时：GNSS 守时（holdover）的钟差、最大时间间隔误差（MTIE）和时间偏差（TDEV），对照 ITU-T 模板检查，每个模板给出 PASS 或 FAIL 及余量。

seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

seg-413edbab9fa9 = 时隙授时：自由运行的时钟离开某个按时间索引的路由或任务时隙的保护间隔（该时隙所容许的最大绝对时间误差）所需的秒数，该时刻每一项的贡献

seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

seg-d425ce2b9f9c = 两个站点之间经由地球静止中继的双向卫星时间频率传递：求解 T_A - T_B 的双向方程，计入所有非互易项（站点设备时延、Ku

seg-a2a710b3204f = MODELLED 授时系统守时测试，依据操作人员提供的钟差记录评分（linuxptp ptp4l、phc2sys 或 ts2phc 日志，chrony 跟踪或统计日志，TICC、TimeLab 或 RINEX

seg-1da440dd525c = MODELLED 可信量子授时链：端到端的量子（光晶格钟 + 纠缠/单光子链路）对经典（CSAC + 射频双向）时间传递预算，复用的授时保护

seg-50d75d48ed43 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>。可选字段：<c7/>、<c8/>。

seg-3273244f755c = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>clock</a1>。

seg-ee8d6e20c844 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>。可选字段：<c7/>。

seg-e359cc42506e = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>sweep</a1>。

seg-616716b33732 = 必填字段：<c1/>、<c2/>、<c3/>。

seg-6f282be980ca = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>sweep-nd</a1>。

seg-79c3d3cd6c7d = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>。

seg-c23e498daa3d = <b>台账：</b>MODELLED { "5" } · VALIDATED { "1" }。完整页面（含输入、结果、证据与局限）：<a1>telecom-timing</a1>。

seg-248e1686fddc = 必填字段：<c1/>、<c2/>。可选字段：<c3/>。

seg-cc04bc2d43c5 = <b>台账：</b>MODELLED { "2" } · VALIDATED { "1" }。完整页面（含输入、结果、证据与局限）：<a1>slot-timing</a1>。

seg-50273a29deec = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>。

seg-adf570e18299 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>timetransfer</a1>。

seg-5134a01b60a0 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>。可选字段：<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>。

seg-09b554a74d49 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>time-transfer-budget</a1>。

seg-58952681ea9d = 必填字段：<c1/>、<c2/>。可选字段：<c3/>、<c4/>。

seg-635ec95c2e86 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>holdover-test</a1>。

seg-76bb4110ea36 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>。

seg-bb6d7df61e2f = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>quantum-time-transfer</a1>。

seg-245adc6e6766 = <s1>上一页</s1>测评活动

seg-960d5c757310 = <s1>下一页</s1>星座、覆盖与几何
