# docs--compliance-mapping: translations (zh-Hans)

seg-d6476863f862 = 能力

seg-ad856ad710eb = 状态

seg-6555ff9a6d8e = 输出

seg-2247a2344710 = 含义

seg-8d216d42c776 = 接收机日志信任度评估

seg-ff808ce8ec48 = 替代与多样化 PNT 信号源

seg-3621a68a508c = 可复现的运行来源记录

seg-50fe2a3ff712 = 完好性监测与保护级

seg-554a16dc7965 = 来源：<c1/>

seg-76db63e8d2de = 买方和接收机制造商要对公开的韧性框架负责。本文件夹逐行将 { -brand } 所计算和记录的内容映射到这些框架，而 <c1/> 会依据你实际拥有的运行结果填充该映射。

seg-e22a3aca9550 = <b>措辞。</b>{ -brand } 的输出<em>为某项要求提供证据支持（supports evidence for）</em>。它们不是对任何产品的评级或批准，这些文件也都不是评估机构的声明；{ -brand } 不是评估机构。要求文本一律为释义，绝不转载原文。

seg-2602c3f5aff6 = 框架

seg-245fe1f87b08 = 文件

seg-d104ce416298 = 美国 DHS 韧性 PNT Conformance 框架，v2.0

seg-0f7279ffb619 = IMO 船舶 GNSS 干扰指南

seg-f318176b86de = EASA 航空 GNSS 干扰指南

seg-7939ac1eea3b = 欧盟 NIS2 指令，第 { "21" } 条

seg-f2eccc9b815f = EN { "16803" }（付费标准；仅按分部和目录中可见的条款编号）

seg-4970f6c15605 = NIST IR 8323r1，基础 PNT 概要（{ "2023" }年1月）

seg-499fc17fb83a = <b>标准包</b>（{ "0.38" }）把框架转化为经评分的场景：每个包含有场景、运行前就已设定的判据，以及它可为之提供证据支持的各行。<c1/> 会显示这些内容。

seg-9c0eb89a2fbe = 包

seg-191baf9f2738 = DHS 韧性 PNT Conformance 框架，级别 { "1" } 至 { "4" } 的测试概要

seg-13e63b993f26 = IMO MSC.1/Circ.1575，船载 PNT 数据处理：精度等级与完好性

seg-aa77ffe0acbf = ICAO Doc { "9849" } 附录 F，监测、评估并缓解 GNSS 干扰

seg-b9387be0e4f1 = 每个文件都列出其来源文件，包括版本、URL、读取日期，以及已检查和未检查的内容。各来源均读取于 2026-10-09（NIST 概要读取于 2026-10-18；EASA 公告和 EN { "16803" } 目录页面于 2026-10-10 再次核对）。凡来源只能通过镜像或目录页面读取的，文件中均有说明。

seg-e98e25897176 = 三个评分标准包的每一项测试，均来自引擎 v{ $version } 的真实运行（`kshana standards-pack run`）：dhs-rpcf：{ "6" } 项达到判据，{ "1" } 项未达到判据，{ "2" } 项需要输入；imo-circ-1575：{ "1" } 项达到判据，{ "4" } 项未达到判据，{ "2" } 项需要输入；icao-doc9849-appf：{ "6" } 项达到判据，{ "0" } 项未达到判据，{ "2" } 项需要输入。总计 { "13" } 项达到判据，{ "5" } 项未达到判据，{ "6" } 项需要引擎所没有的输入（接收机日志或设备文档）。每条判据都在运行前设定；未达到的就如实记为未达到。达到判据只说明某个建模场景达到了所述判据，并不说明任何关于产品的事。这些标准包为其所引用的各行提供证据支持（supports evidence for）；它们不是评估。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务；不得作为任何导航或安全决策的唯一依据。

seg-092dd691ca17 = 报告

seg-10fac3e641e0 = 写出 <c1/> 和 <c2/>（<c3/> 可更改名称）。输入是此前运行得到的结果文件：场景运行会在 <c5/> 旁写出 <c4/>，<c6/> 则写出它自己的结果文件。每次运行的类型（kind）从结果旁的场景文件、receiver-trust 结果的内容，或顶层的 <c7/> 中读取，并且必须是引擎已知的类型。当某个结果的类型无法找到、不是已知类型，或其旁的场景与结果自身的 <c8/> 不一致时，该结果会连同原因被列为未使用，不计入任何内容。（结果的 <c9/> 与场景文件的哈希值不做比较：前者由引擎针对其解析后的场景计算，而文件哈希针对文本，二者是不同的量。）

seg-464351dcdcc3 = <b>仅有类型标签不是证据。</b>只有当某次运行的结果同时带有该类型所写出的字段时，这次运行才计入某项能力（例如，<c1/> 结果需要有其性能指标和逐历元的行；<c2/> 结果需要有其样本计数）。这些字段列在 <c3/>（<c4/>）中，缺少其中任何一项的结果不予计入。不是十六进制的哈希值不会被报告为哈希值。receiver-trust 结果如果其计数不是整数，或其检测到的或一致的计数超过其可评估计数，则被排除并列为未使用。

seg-5a316d97f37b = 对于每一行，报告给出以下之一：

seg-2243532bd26b = 该行所列的每项能力在这组运行中至少有一次运行

seg-e905ae20cec1 = 其中一部分有

seg-e23d6dfc4a00 = 都没有

seg-cf223ce076ce = 没有任何 { -brand } 输出与该行相关

seg-ec76997fb4d4 = 差距一栏对每一行都会打印，包括已有证据的行：某次运行为某项能力提供了证据支持，也仍有一项要求的大部分内容有待其他证据来满足。报告开头重复了措辞规则。<c1/> 打印静态表格，<c2/> 打印来源列表。

seg-f1c508a908ad = receiver-trust 运行还会贡献其所陈述的计数（在可评估的事件中检测到的事件数，在可评估的预测中一致的预测数）。这些计数描述的是该日志，依据运行前设定的事件和容差评分，并按该运行所陈述的原样报告。

seg-662b717575e0 = 运行类型

seg-4377e24c36f5 = 真实接收机自身日志的逐历元信任状态、告警时间，以及与运行前设定的事件的一致情况

seg-766182e85848 = 压制干扰链路预算效应

seg-6bee09017be6 = 在给定干扰机几何条件下，每颗卫星的载噪密度和锁定状态

seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

seg-48fb757a45fc = 欺骗干扰与转发式欺骗（meaconing）检测

seg-2e4a3355a936 = 在给定欺骗干扰攻击下的检测器判决与检测器区分能力

seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

seg-e9a55e5a015b = 保护级、对照告警限值的可用性，以及故障检测结果

seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

seg-6344bf03463c = 守时（holdover）与惯性滑行

seg-a643345646c3 = GNSS 被拒止期间，位置或时间误差相对于给定阈值的增长

seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

seg-97e06c8a9b7f = 来自与主 GNSS 频段无关的信号源的导航或授时性能

seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

seg-25291db2798d = 威胁集合上的韧性评分

seg-9eef8dd0d9b9 = 在给定集合上，每个威胁向量的存活比和韧性比，并注明各项假设

seg-bdaa039247bd = conflict-resilience, campaign

seg-e4be26a0cc63 = 每个结果中携带的场景哈希值、引擎版本和随机种子（seed），使运行可以重复

seg-89edc36c3560 = 任何结果带有 <c1/> 的运行

seg-488aeabdc552 = <s1>上一页</s1>针对场景运行接收机

seg-53a872636d5a = <s1>下一页</s1>美国 DHS 韧性 PNT 框架
