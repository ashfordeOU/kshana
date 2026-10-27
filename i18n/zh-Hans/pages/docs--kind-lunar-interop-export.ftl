# docs--kind-lunar-interop-export: translations (zh-Hans)

seg-debc2f07db78 = true

seg-1f17ef6a853e = 引擎v{ $version }的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-834408a40783 = min

seg-d36e6d7d8a10 = 来源：<c1/>

seg-fdf560e675f4 = <c1/>（场景类型）

seg-5a4dcb93a643 = 由模型计算的月球互操作性导出：以与LunaNet/IOAG对齐、基于CCSDS的交换格式输出月球参考框架、月球时间尺度和月球星历，并带有往返 / 字段一致性检查。复用（REUSES）本crate的CCSDS OEM { "2.0" }生成器与解析器（crate::oem），重新标记为月球场景——OEM的REF_FRAME采用IAU { "2015" } WGCCRE月球天体框架（MOON_ME / MOON_PA），TIME_SYSTEM采用月球时间尺度（LTC / TCL / UTC），CENTER_NAME = MOON——作用于一份示意性的LCNS级星历样例（位置来自crate::lunar_service，速度由有限差分得到）。还输出一份与LunaNet/IOAG对齐的月球时间描述符（尺度标识、来自crate::lunar_time的长期速率 µs/天、公布的范围、参考面），可通过serde_json往返，并把这些产物封装进现有的KIF信封（crate::interchange），带有MODELLED的诚实标注。报告输出的产物、OEM行数、字段一致性检查通过与否以及已有/缺失的字段清单、OEM往返是否正常、时间元数据往返是否正常，以及KIF的字节大小。MODELLED——确定性的往返，加上对照已发表的CCSDS OEM与LunaNet/IOAG字段语义的字段名一致性，是参考基准（oracle）；并非（NOT）经认证的互操作性一致性测试；示意性的、取自公开来源的星历，与ESA无隶属关系；没有TRL、飞行传承或机构背书。

seg-1726861e444f = <c1/>的一次运行概括如下：lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" }个状态，OEM { "23" }行 | 一致性检查PASS（已有{ "9" }项 / 缺失{ "0" }项）| OEM往返正常 | 时间元数据往返正常 | KIF { "1640" }字节 | MODELLED

seg-f8353e15aabd = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-169f9446e90d = 示例<c1/>设置了下列内容等：

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = 八位字节

seg-0e86ff364c17 = 引擎为scenarios/lunar-interop-export.toml（类型lunar-interop-export）生成的图表

seg-98acb538942f = <b>MODELLED</b>与LunaNet/IOAG对齐的月球坐标框架 + 时间 + 星历导出（CCSDS OEM + KIF），带往返一致性检查。参考基准（oracle，InternalConsistency）：kshana的月球OEM导出由独立的第三方<c1/>库（R. J. Anderson）重新解析：框架/时间记号与逐历元状态在写入精度内一致（{ "1" } mm / { "1e-9" } km/s），且缺少TIME_SYSTEM的导出会被拒绝——这是结构性的交换往返；月球坐标框架/时间的物理语义由各自的行验证，因此该行仍为MODELLED。{ "0.30" }外部比较，一项发现（仍为MODELLED）：一个

seg-c9a1d76625d6 = MODELLED（结果<c1/>）

seg-633bcd62ce93 = 还输出一份与LunaNet/IOAG对齐的月球时间描述符（尺度标识、来自crate::lunar_time的长期速率 µs/天、公布的范围、参考面），可通过serde_json往返，并把这些产物封装进现有的KIF信封（crate::interchange），带有MODELLED的诚实标注。（类型目录（<c1/>））

seg-0e91697e3036 = MODELLED——确定性的往返，加上对照已发表的CCSDS OEM与LunaNet/IOAG字段语义的字段名一致性，是参考基准（oracle）；并非（NOT）经认证的互操作性一致性测试；示意性的、取自公开来源的星历，与ESA无隶属关系；没有TRL、飞行传承或机构背书。（类型目录（<c1/>））

seg-11d0ccba5ee7 = src/lunar_interop.rs做什么（WHAT ... does）：* export_lunar_oem——复用（REUSES）本crate的CCSDS OEM { "2.0" }生成器（crate::oem），重新标记为月球场景：REF_FRAME = IAU { "2015" } WGCCRE月球天体框架（MOON_ME / MOON_PA），TIME_SYSTEM = 月球时间尺度（LTC / TCL / UTC），CENTER_NAME = MOON，作用于一份ILLUSTRATIVE的LCNS级星历样例（位置来自crate::lunar_service，速度由中心有限差分得到）。* export_（场景文件注释，第{ "6" }至{ "19" }行）

seg-f730e8f789cf = 诚实说明（HONESTY）：MODELLED。字段名称（NAMES）和单位与公开（PUBLIC）标准对齐（CCSDS 502.0-B OEM、IAU WGCCRE { "2015" }月球框架、LunaNet互操作性规范 / IOAG月球架构）。确定性的往返和字段名一致性是参考基准（oracle）。这并非（NOT）经认证的互操作性一致性测试。该星历是示意性的、取自公开来源的，与ESA无隶属关系（NOT affiliated），也不意味着任何TRL（场景文件注释，第{ "21" }至{ "26" }行）

seg-254d48fe58a5 = 月球互操作性导出为MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-07d6cc44724f = <s1>上一页</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>下一页</s1>lunar-jamming
