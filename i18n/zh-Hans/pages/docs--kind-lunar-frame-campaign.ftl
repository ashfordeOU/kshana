# docs--kind-lunar-frame-campaign: translations (zh-Hans)

seg-1f17ef6a853e = 引擎 v{ $version } 的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-3319b18ac61f = 矩阵中另有 { "1" } 项。

seg-dd57b833cb20 = 来源：<c1/>

seg-120769aba2cc = <c1/>（场景类型）

seg-55679aff66db = 七参数 Helmert（相似变换）坐标基准由模拟观测测评活动（SIMULATED OBSERVING CAMPAIGN）驱动，而不是由注入的变换驱动。一个地面站网络按明确的观测计划观测一批月面信标；月球 VLBI 时延偏导数在该计划上累积成信标坐标的 Fisher 信息矩阵，做法与 lunar-vlbi-fim 完全相同；该信息再通过目录点处的 Helmert 设计矩阵 A = [I3 | [p]_x | p] 传播为基准协方差 H = A^T M_b A，并由 crate::fim::crlb 诊断。没有注入任何变换，也没有从预设答案中恢复任何东西，因此所报告的基准精度源自观测方案本身：时延 sigma 减半则它精确减半，延长弧段则它得到改善，因为报告所测量（MEASURES）的天平动（sub_earth_direction_sweep_deg）正是把沿视线方向的信标坐标与天球平面内的坐标区分开来的因素。每次运行都会输出秩、基准亏秩、条件数、完整谱、七参数基准中的不可观测方向（IN THE SEVEN-PARAMETER BASIS）、即使满秩时最弱的方向以及各参数在其中的占比；测评活动没有约束的参数发布为 NULL 并附状态，绝不从近奇异的逆矩阵中读出。信标误差相关性是测量得到的，而不是假设的：测站固定时，没有任何一次观测涉及两个信标，因此信息矩阵恰为分块对角（offblock_fraction { "0" }），而估计测站时，经 Schur 边缘化的分块是耦合的，并打印出所引起的相关性，同时整个传播在舍弃该相关性的情况下重新运行，使独立性假设的代价成为一个数。在各向同性的逐坐标 sigma 下的同一传播，以及 lunar-frame-realisation 场景所报告的恢复误差，都在此运行，并连同其比值一并打印在测评活动数值旁边。MODELLED：信标目录有来源，但测评活动是模拟的（CAMPAIGN is simulated）——地面站网络和时延 sigma 是示意性的输入，各个时延观测被视为相互独立，月心星历、站钟、对流层和地球定向参数保持固定（FIXED），因此基准协方差是针对缩减参数集的 Cramer-Rao 界。不是大地测量产品。

seg-2e02c1ff8f48 = <c1/> 的一次运行概括如下：lunar-frame-campaign | { "4" } 个信标 x { "3" } 条基线 x { "49" } 个历元 = { "64" } 个观测（时延 sigma { "1.000e-11" } s）| 测站基准固定 | Helmert 秩 7/7 条件数 { "3.798e5" } | 基准平移 sigma { "6.397500" } m，对比注入变换的恢复误差 { "0.3125" } m（比值 { "0.049" }）

seg-9c5feacf15ce = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>

seg-1d70a5b4a197 = 示例 <c1/> 设置了下列内容等：

seg-df90e5910fb4 = 小时

seg-d9523213de9f = 结果标签（引擎给出）：MODELLED 的由测评活动驱动的月面坐标基准。七参数 Helmert 协方差由信标坐标信息矩阵传播而来，该矩阵由引擎自身的月球 VLBI 时延偏导数在信标、基线和历元的明确计划上累积得到；没有注入任何相似变换，并且

seg-883d94b321b4 = 引擎为 scenarios/lunar-frame-campaign.toml（类型 lunar-frame-campaign）生成的图表

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }：点名此类型的<a1>验证矩阵</a1>行。

seg-2595bd629ffb = <b>MODELLED</b> 七参数 Helmert 基准由模拟观测测评活动（SIMULATED OBSERVING CAMPAIGN）传播而来，而不是由注入的变换恢复。

seg-fd34d760edb1 = <b>VALIDATED</b> 七参数 Helmert 基准协方差，其两个模拟输入被实测输入取代：观测计划取自 { "337" } 个已归档的 ILRS 月球激光测距标准点的地面发射历元（2015-04-08 至 2015-06-27，Grasse MeO { "7" } 测试：<a1>lunar_llr_real_data.rs</a1>。

seg-055864084843 = <b>MODELLED</b> lunar-llr-datum 场景上可选的 extra_reflectors 和 extra_beacons 输入增加一个 station_geodesy 块：来自已归档月球激光测距片段的五数组 Helmert 信息，加上增设的后向反射器（ran 测试：<a1>lunar_station_geodesy.rs</a1>。

seg-23bd763c32d8 = <b>VALIDATED</b> lunar-frame-campaign 场景在估计地面站（测站 { "1" } 固定）时的七参数 Helmert 基准协方差，按 lunar_frame_campaign 以 binary64 的计算方式：联合的测站与信标 Fisher 信息累积 测试：<a1>lunar_frame_campaign_mpmath_oracle.rs</a1>。

seg-49f323360dc3 = <b>VALIDATED</b> 来自一个点网络的 7 参数 Helmert 基准拟合 + ICRF 定向联系。参考基准（oracle，ExternalDataset）：独立的闭式加权 Umeyama（Horn）相似变换求解器（基于 numpy/scipy 的 SVD；Umeyama { "1991" } IEEE TPAMI，Horn { "1987" } JOSA A）——与 kshana 的迭代 Gauss–Newton 拟合是不同的算法，在逐字节相同的点网络上得到同一个唯一确定的加权最小二乘最优解

seg-d024abcfd87c = <b>MODELLED</b> 七参数 Helmert 基准由模拟观测测评活动（SIMULATED OBSERVING CAMPAIGN）传播而来，而不是由注入的变换恢复。地面站观测一个有来源的 . 参考基准（oracle，ReferenceImpl）：闭式恒等式与仓库内的一条独立路径，不声称有外部参考基准。Helmert 设计矩阵——该模块中唯一新增的导数——通过对 lunar_frame_realise::apply_helmert 作中心有限差分重新推导，这条路径与解析形式不共用任何表达式。它所组合的累积来自 lunar-vlbi-fim，其雅可比矩阵在那里对照 lunar_vlbi::vlbi_delay_s 作有限差分，并且

seg-0abd7b181f21 = MODELLED 的由测评活动驱动的月面坐标基准。七参数 Helmert 协方差由信标坐标信息矩阵传播而来，该矩阵由引擎自身的月球 VLBI 时延偏导数在信标、基线和历元的明确计划上累积得到；没有注入任何相似变换（NO similarity transform），也没有从预设答案中恢复任何东西。信标目录是本 crate 有来源的具名站点表，但 CAMPA（结果 <c1/>）

seg-f92d22c06cd5 = 信标误差相关性是测量得到的，而不是假设的：测站固定时，没有任何一次观测涉及两个信标，因此信息矩阵恰为分块对角（offblock_fraction { "0" }），而估计测站时，经 Schur 边缘化的分块是耦合的，并打印出所引起的相关性，同时整个传播在舍弃该相关性的情况下重新运行，使独立性假设的代价成为一个数。（类型目录（<c1/>））

seg-534cea416496 = MODELLED：信标目录有来源，但测评活动是模拟的——地面站网络和时延 sigma 是示意性的输入，各个时延观测被视为相互独立，月心星历、站钟、对流层和地球定向参数保持固定（FIXED），因此基准协方差是针对缩减参数集的 Cramer-Rao 界。（类型目录（<c1/>））

seg-ec67b9d3adbb = 信标误差相关性是测量得到的（MEASURED），而不是假设的。测站固定时，没有任何一次观测涉及两个信标，因此信息矩阵恰为分块对角（offblock_fraction { "0" }）；估计测站时，经 Schur 边缘化的分块是耦合的，所引起的相关性会被打印出来，同时整个传播在舍弃该相关性的情况下重新运行，使独立性假设的代价成为一个数，而不是一个（场景文件注释，第 { "17" } 至 { "21" } 行）

seg-a2bb557da7ba = MODELLED：信标目录有来源，但测评活动是模拟的——地面站网络和时延 sigma 是示意性的输入，各个时延观测被视为相互独立，月心星历、站钟、对流层和地球定向参数保持固定（FIXED）。不是大地测量产品。（场景文件注释，第 { "27" } 至 { "30" } 行）

seg-57a371bca2c7 = 由观测测评活动得到的月面坐标基准为 MODELLED，而非已与独立的外部参考基准核对：对照本代码库中另一套独立的实现检查——独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-7b56c979b2c9 = <s1>上一页</s1>lunar-differential-pnt

seg-70072dbfa305 = <s1>下一页</s1>lunar-frame-realisation
