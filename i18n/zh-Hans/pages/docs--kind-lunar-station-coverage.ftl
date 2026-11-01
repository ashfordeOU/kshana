# docs--kind-lunar-station-coverage: translations (zh-Hans)

seg-9feefecdcf67 = rafs

seg-cd04f5662884 = MODELLED。（类型目录（<c1/>））

seg-1f17ef6a853e = 引擎v{ $version }的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-3bc1761c76ab = 有{ "3" }个内置场景使用此类型；其余的在<a1><c1/></a1>中。

seg-6f4246bd8f6f = <b>MODELLED</b> NovaMoon级差分参考站：共模抵消 + 随基线增长的残差 + DGNSS保护级。参考基准（oracle，InternalConsistency）：差分误差抵消恒等式，加上复用DO-229E SBAS保护级机制；单差加WLS求解另外还对照RTKLIB的lsq()/matinv()（Takasu，BSD-2-Clause，已编译的C代码）交叉检查——求解器代码是独立的，但一阶视线差代数相同，因此仍属InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b>差分改正数在计算它的历元与使用它的历元之间会带上三项误差，每一项此前都被当作未建模的余量：。参考基准（oracle，InternalConsistency）：闭式恒等式与自洽性：均匀量化器的step²/12方差，精确的 (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ 协方差传播在 σ 相等时退化为 σ·PDOP，测量项的{ "1" }:{ "1" }传递是 û_user ≈ û_ref的结果，以及开关切换的正交闭合。与orbit::dop的PDOP交叉检查共用 [−û, { "1" }] 法矩阵，因此它是一致性检查，并且被标注为一致性检查，而不是一项

seg-7171b2e3f29d = 月面差分PNT为MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-35f1876d023e = 月面差分PNT——改正数链路残差预算为MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-8f8871ac8a0f = 专题页面：<a1>LUNAR-REFERENCE-STATION.md</a1>

seg-f3231c08fa26 = 来源：<c1/>

seg-1a28838279fe = <c1/>（场景类型）

seg-f7ea776e70c9 = 由模型计算的月球参考站覆盖：对月球差分PNT模型在南极用户网格和一天的历元上作蒙特卡罗扫描。位于已知南极站点的差分参考站，对一个给定的星座（示意性的开普勒轨道或表格化星历）进行改正，并给定空间信号误差、测量误差、改正数延迟和链路量化；逐点及全区域报告改正后与未改正的位置误差百分位数（3-D、水平、垂直）、可用性、对照给定阈值的覆盖、DO-229E保护级、各方位角的覆盖半径，以及测站处和最差点处的改正数链路预算。不是对任何真实系统性能的陈述；与任何机构无隶属关系，也未获其背书。MODELLED。

seg-d18c93c2e136 = <c1/>的一次运行概括如下：lunar-station-coverage | { "346" }个点x { "144" }个历元x { "200" }次试验 | 可用性{ "92.2" } % | 覆盖{ "76.5" } %（p95 <= { "20" } m）| 改正后p95 3-D { "15.592" } m（未改正{ "1056.892" } m）| HPL最大{ "480.385" } m | MODELLED；不是对任何真实系统的陈述

seg-cb73ac0d57de = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>、<c22/>、<c23/>、<c24/>、<c25/>、<c26/>、<c27/>、<c28/>、<c29/>、<c30/>、<c31/>、<c32/>、<c33/>、<c34/>、<c35/>

seg-0c3460704315 = 示例<c1/>设置了下列内容等：

seg-2d84b341a41f = 结果标签（引擎给出）：MODELLED

seg-922b8656fcae = 引擎为scenarios/lunar-station-coverage.toml（类型lunar-station-coverage）生成的图表

seg-4f5941f12127 = <b>MODELLED</b>对月球差分PNT模型在南极用户网格和一天的历元上作蒙特卡罗扫描（<c1/>类型）：对位于已知南极站点的差分参考站，逐点及全区域，测试：<a1>lunar_station_coverage_reference.rs</a1>。

seg-d547d600ee2d = <b>MODELLED</b>对月球差分PNT模型在南极用户网格和一天的历元上作蒙特卡罗扫描（<c1/>类型）：对差分参考 . 参考基准（oracle，InternalConsistency）：算术由独立的numpy脚本对导出的算例重新计算（scripts/gen_lunar_station_ref.py，numpy { "2.5.4" }；已预先登记于tests/fixtures/lunar_station/PREREGISTRATION.md，在首次运行之前单独提交于9caedf97）：在{ "20" }个所有误差项均开启的算例上，可见集合和状态完全一致，原始测距误差一致到{ "1.4e-14" } m，位置误差矢量和模一致到{ "1.4e-9" } m，对照

seg-626ab55f0424 = MODELLED（结果<c1/>）

seg-6f09def22469 = 诚实说明（HONESTY）：MODELLED。在下列给定假设下，模型给出这些数值。不是对任何真实系统性能的陈述；与任何机构无隶属关系，也未获其背书；不声称有TRL或飞行传承。已省略：极区的地形与地平线遮蔽（第一项局限）、多路径、接收机硬件。（场景文件注释，第{ "15" }至{ "18" }行）

seg-db27cc015952 = 月球参考站覆盖与精度图为MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-6ac5bd1500a8 = <s1>上一页</s1>lunar-llr-datum

seg-625c1973128e = <s1>下一页</s1>lunar-time-budget

seg-bf7d64a925dd = <s1>上一页</s1>lunar-orbit-rendezvous

seg-0525bddd21ee = <s1>下一页</s1>lunar-surface
