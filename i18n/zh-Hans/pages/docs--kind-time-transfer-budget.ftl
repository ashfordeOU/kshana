# docs--kind-time-transfer-budget: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-dfe78b9d0811 = GHz

seg-cd04f5662884 = MODELLED。（类型目录（<c1/>））

seg-c61e88721556 = 引擎 v{ $version } 的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-937ebbbd612c = 来源：<c1/>

seg-6af6f07f5f5a = <c1/>（场景类型）

seg-9a2bb9809aed = 两个站点之间经由地球静止中继的双向卫星时间频率传递：求解 T_A - T_B 的双向方程，计入所有非互易项（站点设备时延、Ku 波段电离层、转发器、Sagnac），一个正交合成的不确定度预算，其 A 类项为模拟链路在平均时间处的 TDEV，一条带有白相位噪声、闪烁相位噪声和昼夜非互易性的模拟链路，以及任何提供的 BIPM Circular T 第 { "1" } 节序列、MJD,ns CSV 或 IGS RINEX 站钟记录的稳定度（速率、残差 RMS、TDEV、ADEV）。MODELLED。

seg-a4f8e9a09026 = <c1/> 的一次运行汇总为：time-transfer-budget: europe - north-america offset { "12.500" } ns (Sagnac { "204.365" } ns, ionosphere { "0.0213" } ns); combined u { "1.087" } ns (type A { "0.031" } ns at { "86400" } s); { "0" } real series (MODELLED)

seg-0353d795ebdf = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-fe3afa366df2 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>

seg-00026a1d3760 = 示例 <c1/> 设置了以下各项（节选）：

seg-2409cc9397c7 = 结果标签（引擎给出）：MODELLED — TWSTFT 双向方程（站点时延、Ku 波段电离层、转发器、Sagnac）由给定时延求解，一个正交合成的不确定度预算，以模拟链路的 TDEV 作为 A 类项，一条带有闪烁相位噪声和昼夜非互易性的模拟链路，以及任何实

seg-92d3c84024d7 = 引擎为 scenarios/time-transfer-budget.toml（场景类型 time-transfer-budget）生成的图表

seg-83b9c66b9e92 = <b>MODELLED</b> 求解 T_A - T_B 的 TWSTFT 双向方程，计入站点发射和接收时延、Ku 波段电离层上/下行不对称、转发器时延差以及 Sagnac 项，并与其精确的正向模型对照；一个正交合成的不确

seg-58cf4086c7a5 = <b>MODELLED</b> 求解 T_A - T_B 的 TWSTFT 双向方程，计入站点发射和接收时延、Ku 波段电离层上/下行不对称、转发器时延差。参考基准（oracle，InternalConsistency）：内部自洽：正向模型与所解方程在 { "1e-15" } s 内一致，Sagnac 项等于该模块独立的 BIPM 2A omega/c^{ "2" } 环路形式，电离层项为 { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c，且噪声过程呈现出预期的 TDEV 形状。不涵盖的内容：未与任何真实 TWSTFT 测量或校准报告作比较；所给时延和不确定度是输入，而非测量值；该

seg-15de1cdaa684 = MODELLED — TWSTFT 双向方程（站点时延、Ku 波段电离层、转发器、Sagnac）由给定时延求解，一个正交合成的不确定度预算，以模拟链路的 TDEV 作为 A 类项，一条带有闪烁相位噪声和昼夜非互易性的模拟链路，以及所提供的任何真实 UTC-UTC(k) 或站钟序列的稳定度；未与真实的 TWSTFT 链路作比较（结果 <c1/>）

seg-70448ca49780 = 两个 ILLUSTRATIVE 站点之间的双向卫星时间频率传递（TWSTFT），一个位于中欧，一个位于北美东部，经由 { "10" } 度 W 的地球静止中继。本次运行由给定的设备、转发器、电离层（Ku 波段，14/11 GHz）和 Sagnac 项求解 T_A - T_B 的双向方程。它构成一个不确定度预算，其统计项为一天时的 TDEV，取自一条模拟（场景文件注释，第 { "1" } 至 { "8" } 行）

seg-4b0d23aed0ab = 带有闪烁和昼夜非互易性的 TWSTFT 双向方程、不确定度预算和链路稳定度为 MODELLED，未经独立核对：只是对照其自身的闭式/解析恒等式进行检查——能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-52e06909ccc5 = <s1>上一页</s1>terrain-slam

seg-a22fa1c51042 = <s1>下一页</s1>timetransfer
