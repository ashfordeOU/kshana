# docs--kind-spoof: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-debc2f07db78 = true

seg-51362910dcb7 = 有 { "2" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-f4cf8b629797 = 主题页面：<a1>INTEGRITY.md</a1>

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC 数据手册 sigma_y(1s)={ "3e-10" }；q_

seg-a8d92406e428 = 锶光晶格钟，面向空间应用的目标 sigma_y

seg-b9174c70772f = <b>MODELLED</b> 钟辅助 χ²、RAIM、AGC、SQM 融合的逐历元安全性 FoM。参考基准（ExternalDataset）：TEXBAT 场景参数（Humphreys { "2012" }）：是特性描述，不是固定的向量。{ "0.30" } 外部比较，一项发现（仍为 MODELLED）：在 JammerTest { "2024" }（Bleik；GPL-3.0 数据）上，观测量层面的监测器（钟辅助卡方、RAIM、求解失败）在 { "8" } 个可评估的已发布欺骗干扰起始时刻中的任何一个之后 { "10" } s 内都没有报警（在起始前窗口干净的情况下，首次报警出现在 { "10.2" } 至 { "39" } s 之后，起始 pu

seg-e4b64d7277da = 欺骗干扰检测为 MODELLED，而不是经独立验证：其中一项子声明经过外部核对，但整项能力由模型计算的部分组合而成，因此该能力仍属于由模型计算得出一级。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-ee7dd15019d0 = 主题页面：<a1>CAMPAIGNS.md</a1>

seg-5a70fcb097dc = 可选字段：无

seg-304496607bd7 = 引擎 v{ $version } 的场景类型，所属系列为<a1>压制干扰、欺骗干扰与频谱</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-5d23d7f8f872 = 系列页面：<a1>压制干扰、欺骗干扰与频谱</a1>

seg-03d8dc3de7ca = <b>MODELLED</b> 钟差辅助 χ²、RAIM、AGC、SQM 融合的逐历元安全性能指标 测试：<a1>spoof_texbat_validation.rs</a1>。

seg-09125f609abe = 来源：<c1/>

seg-8bf73eca4115 = <c1/>（场景类型）

seg-cbd77f6ffd63 = 随机时间欺骗检测器（Neyman–Pearson / χ²₁），含蒙特卡罗 P_fa/P_md。

seg-2a1e4e7893ba = <c1/> 的一次运行汇总为：scenario 2b6bd22c3b80 | spoof LinearRamp { "{" } rate_ns_per_s: { "0.1" } { "}" } vs { "20.000" } ns spec (P_fa { "0.010" }) | quantum security { "1.000" } (P_md { "0.000" }, MC { "0.000" }) detected 70s | classical security { "0.558" } (P_md { "0.442" }, MC { "0.444" }) detected 430s

seg-b577342dfe39 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-adb7ff15a702 = 示例 <c1/> 设置了以下各项（节选）：

seg-6f6a8c975111 = 引擎为 scenarios/spoof-attack.toml（场景类型 spoof）生成的图表

seg-ecc2dc8489bb = <b>MODELLED</b> <c1/> 类型的 <c2/> 部分：欺骗源在距离和距离变化率上自洽地伪造在声称位置处所见的信号，该声称位置在起始时刻之后相对真实位置发生跳变和/或被推移（针对每个 LEO 频段以及 MEO 测试：<a1>leo_resilience_verticals.rs</a1>。

seg-8b3523b5fa2c = <b>MODELLED</b> 对每颗 LEO 卫星和每一对测距频段，<c1/> 部分构成无几何伪距组合，去除接收机的电离层模型，并将其逐历元的阶跃与两个频段的码噪声以及一个 测试：<a1>leo_resilience_verticals.rs</a1>。

seg-e5bbd2fca4fb = <s1>上一页</s1>spoof-detect

seg-8d3311751876 = <s1>下一页</s1>sweep-nd
