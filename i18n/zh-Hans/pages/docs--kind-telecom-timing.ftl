# docs--kind-telecom-timing: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-98151954f217 = false

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-c61e88721556 = 引擎 v{ $version } 的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input：一个解析层，把 RINEX 钟文件（某一指定时钟的 AS/AR 记录，版本 { "2" } 以及 { "3.00" } 至 { "3.04" }）、TimeLab 式 ASCII 相位或频率日志，或 TAPR TICC 时间戳或间隔日志转换为统一的相位 测试：<a1>clock_log_allantools.rs</a1>。

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-3bc1761c76ab = 有 { "3" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-e7273fd2a640 = <b>VALIDATED</b> <c1/> 场景类型报告的最大时间间隔误差与时间偏差，针对电信量级的守时记录：O(n) 单调队列滑动。参考基准（oracle，ExternalDataset）：allantools { "2024.06" }——独立的第三方频率稳定度库——对 tests/fixtures/telecom_timing/holdover_te_series.csv 调用 mtie() 与 tdev()，两侧均由同一份 17 位有效数字的文本解析出序列；该参考基准记录了序列的 SHA-256，并可通过 tests/fixtures/telecom_timing/generate_telecom_timing_reference.py 离线重新生成。验证的是该记录上的估计器，而非合成

seg-4cf0f94f96c9 = <b>MODELLED</b> 转录自 ITU-T G.8272（07/2025）PRTC-A/B、G.8272.1（{ "2024" }）Amd. { "1" }（07/2025）ePRTC 锁定与 ePRTC-A 守时（包括 Table { "3" } 的钟差包络。参考基准（oracle，InternalConsistency）：对所指明建议书的转录（可从 itu.int 免费下载），每项限值均注明其表格或条款，所有未确认或未实现的项目列于 docs/TELECOM-TIMING.md；各表所蕴含的断点连续性恒等式在测试中核对。这是附带内部自洽检查的标准转录，不是一致性测试，也不是外部验证。{ "0.30" } 第 { "2" } 轮（预先登记

seg-5547f1f662d3 = 矩阵中另有{ "2" }项。

seg-8aee75a55007 = ocxo

seg-9b72d3b3a0ab = 来源：<c1/>

seg-f4dc88ffe6b5 = <c1/>（场景类型）

seg-a448b24ded2b = 电信授时：GNSS 守时（holdover）的钟差、最大时间间隔误差（MTIE）和时间偏差（TDEV），对照 ITU-T 模板检查，每个模板给出 PASS 或 FAIL 及余量。输入为以下两种之一：一是合成守时（SYNTHETIC HOLDOVER，即某个振荡器预设——ocxo、铷、铯或 csac，每种都带有某份具名的 Microchip 公开数据手册中的稳定度、老化和温度数据——加上 GNSS 丢失时间、记录长度和采样间隔；自由运行的时钟带有白频率噪声、闪烁频率噪声，以及数据手册拟合需要时的随机游走频率噪声，另有线性老化和正弦温度项），二是摄入的序列（INGESTED SERIES，即内联给出的 [time_s, time_error_ns] 数据对，仅在原生构建中还可使用 CSV 文件）。模板：ITU-T G.8272（07/2025）PRTC-A 和 PRTC-B（max|TE| 分别为 { "100" } / { "40" } ns，MTIE 表 1-2，TDEV 表 3-4）；G.8272.1（{ "2024" }）Amd. { "1" }（07/2025）ePRTC 锁定（{ "30" } ns，表 1-2）和 ePRTC-A 守时（表{ "3" }的时间误差包络，在由锁定时长设定的守时期 H 内从 { "30" } ns 上升到 { "100" } ns，MTIE 表{ "4" }，TDEV 表{ "5" }）；G.8273.2（{ "2023" }）Amd. { "2" }（11/2025）T-BC/T-TSC A-C 类（max|TE|、恒定时间误差、低通滤波后的 MTIE 和 TDEV）以及 D 类（max|TE_L| { "5" } ns，这是 D 类中唯一未留待进一步研究的数值）；G.8271.1（{ "2022" }）Amd. { "3" }（05/2025）参考点 C（max|TE_L| 分别为 { "1100" } / { "600" } / { "100" } ns，MTIE 表 7-1 至 7-3）。凡建议书标注为留待进一步研究的条目一律缺省，不予填补，每份报告都会列出未实现的内容。还报告超出各最大时间误差预算所需的时间（默认值：{ "100" } ns 为 ePRTC max|TE_HO|，{ "400" } ns 为网络守时分配，{ "1100" } ns 为 C 点，{ "1.5" } us 为 { "4" } 类）、附有各模板限值的 CSV 表形式的 MTIE/TDEV 曲线，以及每个数值字段的单位与出处条目。VALIDATED：MTIE 和 TDEV 估计器已在一条已提交的守时序列上与 allantools 软件包核对一致。MODELLED：模板表是转录而来，合成守时是依据数据手册最大值构建的模型，而非对任何设备的测量。不是一致性测试。

seg-07f81cfd606a = <c1/> 的一次运行汇总为：telecom-timing: max|TE| { "488.2" } ns over { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

seg-17f291bfc65d = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-d192feecd4b3 = 示例 <c1/> 设置了以下各项（节选）：

seg-e7cab30ef039 = []（无元素）

seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

seg-01b1287f233b = 结果标签（引擎给出）：MODELLED — 对照转录的 ITU-T 模板检查钟差、MTIE 和 TDEV。估计器已与 allantools 核对一致；模板表是对所列建议书的转录；合成守时是依据公开数据手册数据构建的模型，而非对任何设备的测量。不是一

seg-ec7745a09d08 = 引擎为 scenarios/telecom-synce-eec.toml（场景类型 telecom-timing）生成的图表

seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }：点名此类型的<a1>验证矩阵</a1>行。

seg-c21ebd79f497 = <b>VALIDATED</b> <c1/> 场景类型在电信级守时记录上报告的最大时间间隔误差和时间偏差：采用 O(n) 单调队列滑动窗口 MTIE（telecom_timing::mtie_sliding，其作用是使一天的每秒采样 测试：<a1>telecom_timing_reference.rs</a1>。

seg-75aa6f7234ae = <b>MODELLED</b> 转录的 ITU-T G.8272（07/2025）PRTC-A/B、G.8272.1（{ "2024" }）Amd. 限值。测试：<a1>telecom_timing_reference.rs</a1>。

seg-d0ab0ca72b80 = <b>MODELLED</b> 为 <c1/> 类型提供的七个恒温 MTIE 与 TDEV 漂移产生模板：G.811（09/1997）PRC（自主）、G.812（06/2004）I、II 和 III 型、G.8262（10/2024）EEC 选项 { "1" } 和 { "2" }，以及 G.8262.1（11/2025）eEEC（锁定

seg-d4bd840708db = <b>MODELLED</b> 四种预设——OCXO（Microchip OX-208）、铷（Microchip 8040C）、铯（Microchip 5071A 高性能管）和 CSAC（Microchip SA.45s）——各自带有。参考基准（oracle，InternalConsistency）：输入数据取自四份具名的 Microchip 数据手册（文档编号和 URL 见每个预设以及 docs/TELECOM-TIMING.md）；闭式老化斜坡及拟合的包络性质作为内部检查。这些数据如何转化为噪声模型——拟合、下限规则、30 天月、线性温度读数——属于建模选择；没有任何预设是对某台设备的测量。{ "0.30" } round { "2" }，单侧判据与

seg-cbb39b4105ac = 建议书标注为“留待进一步研究”的所有要求（超出 max|TE_L| 的 D 类、ePRTC-B 守时、两路输入均丢失时的 T-BC/T-TSC 守时、TDEV 网络限值，以及超过 { "10 000" } s 的 ePRTC-A 守时 MTIE 和 TDEV）（结果 <c1/>）

seg-a70f575aeb21 = 高通滤波后的动态时间误差（dTE_H，G.8273.2 表 7-7 以及 G.8271.1 第 7.3.2-7.3.3 条）（结果 <c1/>）

seg-66446247fc49 = G.8273.2 表 7-6 的变温 MTIE，以及 G.8273.2 表 7-10 的物理层辅助守时 MTIE（结果 <c1/>）

seg-c1d601b45182 = 两路输出之间的相对时间误差（cTE_R、dTE_R,L）（结果 <c1/>）

seg-6146f857c2df = G.8272 和 G.8272.1 针对 PTP 接口规定的滑动平均分组滤波器：该序列被视为每秒一个脉冲的时间间隔误差（结果 <c1/>）

seg-d5e956023b48 = MODELLED — 对照转录的 ITU-T 模板检查钟差、MTIE 和 TDEV。估计器已与 allantools 核对一致；模板表是对所列建议书的转录；合成守时是依据公开数据手册数据构建的模型，而非对任何设备的测量。不是一致性测试。（结果 <c1/>）

seg-f163ae37b8c7 = MODELLED：模板表是转录而来，合成守时是依据数据手册最大值构建的模型，而非对任何设备的测量。（类型目录（<c1/>））

seg-a0ddb65b00af = 时钟：OCXO 预设（Microchip OX-208 数据手册，Rev 12-1-2021），自第一个采样起自由运行，白频率噪声、闪烁频率噪声以及（拟合需要时的）随机游走频率噪声均按数据手册的阿伦偏差最大值拟合，并带有其线性老化。温度保持恒定（幅度 { "0" } K），与模板的假设一致。（场景文件注释，第 { "12" } 至 { "15" } 行）

seg-101dbde1c65b = 专题页面：<a1>CLOCK-LOG-FORMATS.md</a1>

seg-c32dc02f981d = <s1>上一页</s1>sweep

seg-8aef86c9aa68 = <s1>下一页</s1>terrain-nav
