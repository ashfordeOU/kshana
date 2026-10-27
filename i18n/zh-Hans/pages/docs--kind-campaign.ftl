# docs--kind-campaign: translations (zh-Hans)

seg-8784979d6569 = dBW

seg-68a2bcb6eedd = 来源：<c1/>

seg-24ce6aee5e53 = <c1/>（场景类型）

seg-931a3d27c0f0 = 引擎v{ $version }的场景类型，所属类别为<a1>测评活动</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-a07990e776cb = 测评活动（campaign）：把现有的场景类型组合成一次运行，每个数值都读自所指定类型的真实运行。共四个部分，可任意组合。阶段（PHASES）：在同一条共享时间线上的链式任务，每个阶段运行一个或多个场景（例如先压制干扰，再欺骗干扰，再是时钟守时（holdover）并有惯性导航系统在一旁滑行，然后是完好性告警，最后是恢复），其输出按每种类型的预设或显式的结果路径读入已命名的通道（时钟钟差对其保护限、载噪比对跟踪下限、保护级对告警限、位置误差、跟踪卫星数、告警标志），并通过零阶保持重采样到公共网格上，附带阶段边界和事件；状态通过carry（通道从上一阶段的结束值继续）、handoff（把上一阶段的某个数值写入本阶段的场景）和end_at（阶段在某次运行算出的时刻结束，例如欺骗干扰监测器的检测时刻）传递。扫描（SWEEP）：在任意类型的一至三个点分隔的场景键上建立网格（整数段用于索引表数组，如system.2.sisre_m），指标按结果路径读取，运行次数大于1时，每个节点都有一个带随机种子的蒙特卡罗集合。MONTE_CARLO：第k次实现以base_seed + k运行；每个指标报告均值、标准差、最近秩法的第5/50/95百分位数，以及对均值的固定随机种子自助法{ "95" }% 置信区间。组合（COMPOSE）：若干场景共用相同的数值（一个干扰源的功率和位置同时写入一个海事接收机和一个道路接收机），并带有合并的最佳/最差摘要。结果带有测评活动哈希、覆盖每个成员结果的摘要，以及每个输出数值的单位条目；互操作导出会把每个带几何的成员场景写成各自独立的文件集。组合恒等式经过测试：单阶段测评活动逐位复现独立运行，固定随机种子的集合逐字节稳定，而在白频率噪声时钟上，集合均值落在所报告的区间内，离散程度与sqrt(q_wf * tau) 相符。MODELLED：加性carry和零阶保持是建模选择，每个阶段都带有运行它的类型的标签。

seg-05e842f80dbb = 运行一次<c1/>的摘要为：campaign 46aa07cb58fb | 干扰源功率扫描：可用性和J/S随发射功率的变化 | <c2/>的扫描：在 [jammer_power] 上有{ "13" }个节点 | { "13" }次成员运行（MODELLED）

seg-bf339fa14645 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-abd3eac6da41 = 示例<c1/>设置了以下内容等：

seg-c4f955d5f506 = 可用性

seg-7bcf77278958 = 有{ "22" }个内置场景使用此类型；其余的在<a1><c1/></a1>中。

seg-38faa927b2bd = lin

seg-1a33a746eeee = 结果标签（引擎给出的）：对现有场景类型的MODELLED组合。每个数值都读自所指定类型的真实运行；链式处理（通道跨阶段边界的加性carry、对时间线网格的零阶保持、在算出的时刻结束的阶段）是建模选择，每个阶段都带有该

seg-b2c7cd1f9712 = 引擎为scenarios/campaign-sweep-jammer-power.toml（类型campaign）生成的图表

seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect和测评活动运行器：可选的 [monitors] 表在运行器的单次遍历中对每个单元运行IQ监测器。测试：<a1>iq_campaign.rs</a1>。

seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect（windows、roc）和iq::campaign::report::rocs：带监测器的测评活动的每个单元，对每种告警类型和通道，保留监测器自身检验统计量在每个所述事件窗口（正例）和在

seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit（campaign、cn0、iqfit、iqreport），以及<c2/>上的<c1/>、Python <c3/>和MCP labfit工具（仅限其工作目录内的测评活动文件夹）：按<c4/>的输出文件夹读取其 测试：<a1>iq_labfit_followup.rs</a1>。

seg-f16a176dc1f8 = <b>MODELLED</b> <c1/>类型的各阶段：每个阶段通过run_toml运行一个或多个现有类型的场景，将其输出读入已命名的通道（时钟钟差与保护限、有效载噪比均值与跟踪下限、v测试：<a1>campaign_composition_reference.rs</a1>。

seg-be831b52a339 = 以及矩阵中另有{ "4" }项。

seg-cc2ad9e12064 = <b>MODELLED</b>几何J/S链路预算、抗干扰C/N₀、逐卫星失锁。参考基准（InternalConsistency）：抗干扰C/N₀ 链路预算方程对照独立的numpy重新推导进行交叉检查（与其共用同一闭式，故为InternalConsistency），外加对真实JammerTest-2024 C/N₀ 劣化的表征。{ "0.30" }轮{ "2" }，受阻（仍为MODELLED）：实测的JammerTest { "2024" } C/N0下降对照链路预算预测（预先登记6a66994b，在{ "3" } dB以内）未运行，因为F8.1天线位置和指向

seg-59afd80736c5 = <b>PARTNER</b>未提供：Kshana对信号性能建模，不对有效载荷或天线硬件建模。参考基准（NoneKind）：无：由合作方负责的学科，按设计没有模块也没有测试

seg-fa3ad6babe54 = <b>MODELLED</b> <c1/>类型的扫描（在任意类型的一至三个点分隔的键上，使用通用扫描的坐标轴取值，可选地在每个节点上做一个集合）以及monte_carlo部。参考基准（InternalConsistency）：白频率噪声下相位随机游走的闭式，方差q_wf tau（NIST Technical Note { "1337" }），用于统计机制；以及与独立运行逐字节相等，用于随机种子设定。它检查的是引擎自身时钟模型上的集合运算，而不是外部数据集

seg-c15b5ac32282 = 对现有场景类型的MODELLED组合。每个数值都读自所指定类型的真实运行；链式处理（通道跨阶段边界的加性carry、对时间线网格的零阶保持、在算出的时刻结束的阶段）是建模选择，每个阶段都带有产生它的类型的标签。（结果<c1/>）

seg-9e33dcc39c27 = MODELLED：加性carry和零阶保持是建模选择，每个阶段都带有运行它的类型的标签。（类型目录（<c1/>））

seg-adcc6ea59840 = MODELLED：与<c1/>类型相同。（场景文件注释，第{ "14" }行）

seg-143f3f1cc521 = GNSS拒止下的压制干扰韧性为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-d1c11e493795 = 对任意场景类型的参数扫描和带随机种子的蒙特卡罗集合为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-edbda7aca5b9 = 类别页面：<a1>测评活动</a1>

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-c4ed27a559df = 主题页面：<a1>RESILIENCE-CROSSWALK.md</a1>

seg-774e035da605 = <s1>上一页</s1>body-pnt

seg-fadd92303a4d = <s1>下一页</s1>cislunar-arc-recovery
