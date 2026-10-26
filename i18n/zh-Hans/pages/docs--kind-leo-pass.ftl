# docs--kind-leo-pass: translations (zh-Hans)

seg-ad20a7bebf23 = STL

seg-37d16b499bc5 = dB

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-49964654d5f4 = 引擎 v{ $version } 的场景类型，所属系列为<a1>近地轨道导航</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-c5478f572d21 = 系列页面：<a1>近地轨道导航</a1>

seg-fad0b45fd9c2 = 来源：<c1/>

seg-f0433f09f033 = <c1/>（场景类型）

seg-c3861f7d717c = 面向 LEO-PNT（低地球轨道的定位、导航与授时）、与具体系统无关的 LEO 过境与逐频段链路预算：一个用户（地面、海上、空中或室内，静止或运动）与一颗或多颗 LEO 卫星，卫星来源为设计过境（轨道为圆轨道，布置成使用户在所选时刻看到一次所选最大仰角的过境，如有要求则为太阳同步）、显式轨道根数、经引擎 SGP4 的 TLE（两行根数）、或由星座设计代码构建的 Walker 星座（报告最高的若干次过境）。频段来自命名预设（通用多频段 UHF/L/S/C、通用 C 波段、Xona Pulsar X1/X5、Iridium STL、仅作多普勒机会信号使用的 Starlink、CentiSpace，以及标记为 WORKSHOP 的可选 Celeste IOD 预设）或直接写入场景；每个预设都说明其数值是 PUBLIC（附 URL）、REPRESENTATIVE 还是 WORKSHOP。对每颗卫星、每个频段和每个历元：仰角、方位角、距离、距离变化率和距离加速度；自由空间路径损耗；EIRP 与卫星方向图增益（等通量、高斯波束或平坦）；用户天线随仰角变化的增益（贴片、半球或各向同性）；气体衰减（ITU-R P.676-10 Annex { "2" }）、雨衰（ITU-R P.838-3 系数与 P.618-14 流程，依据降雨率和雨高）、对流层闪烁（ITU-R P.618-14 第 { "2.4.1" } 节）、室内用户的建筑物穿透损耗（ITU-R P.2109-2）、极化失配、系统噪声温度与 C/N0（载噪密度比）；由距离变化率和距离加速度得出的闭式多普勒与多普勒变化率，各自对照中心差分检查；一阶电离层延迟 { "40.3" } STEC/f^{ "2" }，由 Klobuchar 或垂直 TEC 的斜向 TEC 换算到卫星以下的那部分电离层。成对的频段给出无电离层组合系数、噪声放大和过境峰值处的码噪声。MEO GNSS 卫星（Galileo 或 GPS 预设）根据其接口文件中的接收功率，以相同的天线和噪声模型评估，因此 LEO 钟形过境与平坦的 GNSS 载波共用一张图。可选的 [iot] 部分给出在所述接收机功率预算下，首次定位时间、每次定位的能量以及随占空比变化的电池寿命（MODELLED）。每个频段对还给出其几何无关组合在峰值处恢复出的斜向 TEC，以及该估计的码噪声 sigma（电离层探测）。可选的 [spoofer] 部分伪造一个声称位置的信号，该位置在起始之后相对真实位置跳变或被牵引，并运行两个带有所述虚警与漏检概率的监测器：多普勒与过境几何一致性（实测距离变化率对照由轨道以及独立的先验位置与速度所预测的值，在 GNSS、LEO 和全部通道上做窗口内的广义最小二乘卡方检验），以及跨频段一致性（每个 LEO 频段对经模型修正的几何无关组合逐历元的阶跃），报告逐历元统计量以及各监测器何时检出（MODELLED）。VALIDATED 的部分：自由空间损耗、对照其表 { "5" } 的 P.838-3 系数、对照 ITU-R Study Group { "3" } 验证示例的 P.618-14 雨衰与闪烁流程以及 P.2109 建筑物穿透损耗、IS-GPS-200 的 L1/L2 群延迟比，以及对照 arXiv { "2509.19551" } 表 { "1" } 的圆轨道静止用户最大多普勒。MODELLED：EIRP、方向图、卫星以下 TEC 的 Chapman 比例以及整个过境。

seg-04509d8245b7 = <c1/> 的一次运行汇总为：LEO pass link budget, air user at { "50.00" }, -30.00; { "1" } LEO satellite(s), { "900" } s window Iridium-pass [iridium-stl PUBLIC]: { "781" } km, max elevation { "65.0" } deg at { "444" } s, { "750" } s above the mask STL { "1621.000" } MHz: C/N0 peak { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } in view, C/N0 { "38.2" } dB-Hz to { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL peak { "80.5" } dB-Hz is { "34.3" } dB above the GNSS median; above the strongest GNSS carrier for { "750" } s

seg-e6f4e5c502d7 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>

seg-e12426a79a2f = 示例 <c1/> 设置了以下内容等：

seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

seg-7cd17bf1ac74 = 机载 Iridium STL

seg-f4d857403ae0 = descending

seg-08bc462d676c = 有 { "8" } 个内置场景使用该类型；其余见<a1><c1/></a1>。

seg-ee6d9e6d9556 = 引擎给出的结果标签：MODELLED：LEO 过境几何与逐频段链路预算，依据所述 EIRP 和理想化天线方向图并含 ITU-R 传播项；各组成模型在验证矩阵中带有各自的标签。不是对任何卫星的测量。

seg-02ae51cfada6 = 引擎为 scenarios/leo-pass-iridium.toml（类型 leo-pass）生成的图表

seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }：点名该类型的<a1>验证矩阵</a1>行。

seg-69ed19957592 = <b>VALIDATED</b> ITU-R（国际电信联盟无线电通信部门）P.838-3 式（{ "1" }）至（{ "5" }）：k_H、alpha_H、k_V、alpha_V 取自表 { "1" } 至 { "4" } 的曲线拟合，随路径与极化而定的（k, alpha），以及比衰减 测试：<a1>leo_link_reference.rs</a1>。

seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 第 { "2.2.1.1" } 节步骤 { "2" } 至 { "10" }（低于雨高的斜向与水平路径、水平缩减与垂直调整因子、A0.01 及其对平均年 { "0.001" } % 至 { "5" } % 的换算），雨高（P.839）为 测试：<a1>leo_link_reference.rs</a1>。

seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 第 { "2.4.1" } 节步骤 { "3" } 至 { "9" }（由 N_wet 得出的参考 sigma、有效路径长度、天线平均因子、{ "0.01" } % 至 { "50" } % 时间的衰落深度），N_wet 为输入量，或由温度、湿度和气压通过 测试：<a1>leo_link_reference.rs</a1>。

seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 Annex { "1" } 式（{ "1" }）至（{ "10" }）与表 { "1" }：在路径于外墙处的仰角下，传统与热效率建筑物的不超过概率 P 的损耗，{ "80" } MHz 至 { "100" } GHz；逐频段、逐历元应用 测试：<a1>leo_link_reference.rs</a1>。

seg-ac1927b760d5 = 矩阵中另有 { "8" } 项。

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 第 { "2.4.1" } 节步骤 { "3" } 至 { "9" }（由 N_wet 得出的参考 sigma、有效路径长度、天线平均因子、{ "0.01" } % 至 { "50" } % 时间的衰落深度。参考基准（oracle，ExternalDataset）：ITU-R Study Group { "3" } 验证示例（CG-3M3J-13-ValEx-Rev8.3.0），用于 P.618-14 闪烁，各站点的 P.453-14 N_wet 取自同一批示例；连同 URL 与获取日期提交于 tests/fixtures/leo_link/p618_14_scintillation.csv。由温度和湿度得出的湿折射率表达式不在该行覆盖范围之内

seg-ab58ab4e7dc6 = <b>VALIDATED</b> 每个频段的群延迟 { "40.3" } STEC/f^{ "2" }；无电离层组合系数 f1^2/(f1^{ "2" } - f2^{ "2" }) 与 -f2^2/(f1^{ "2" } - f2^{ "2" })，以及噪声放大 sqrt(a1^{ "2" } s1^{ "2" } + a2^。参考基准（oracle，ExternalDataset）：IS-GPS-200 第 { "20.3.3.3.3.2" } 节，其中给出由一阶 1/f^{ "2" } 缩放得出的 L1/L2 群延迟比 gamma = (77/60)^{ "2" }，以及 Friis 传输公式（Proc. IRE，{ "1946" }）。验证的是缩放定律，而不是斜向 TEC

seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate：对圆轨道每个轨道位置和卫星地平线上每个用户的搜索，并带地球。参考基准（oracle，ExternalDataset）：Leclere、Marathe 与 Reid，Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design，ION GNSS+ { "2025" }，arXiv { "2509.19551" }，表 { "1" }（静止接收机位于 { "6371" } km 球面上，地球自转是唯一的其他效应）：L1 上为 { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz。涵盖圆形二体轨道

seg-b952b2928bbe = <b>MODELLED</b> <c1/> 类型：卫星来自设计过境、轨道根数、经 SGP4 的 TLE 或来自 constellation-design 的 Walker 星座；对每个频段和历元，。参考基准（oracle，InternalConsistency）：闭式解与自洽性：距离变化率与距离加速度恒等式对照数值导数、等通量增益抵消距离增长、教科书中的极化损耗极限、LEO 与 GNSS 的定性观测对比（持续数分钟的钟形过境，峰值比平坦的 44-51 dB-Hz GNSS 载波高出数 dB）。EIRP 与方向图是将已发表的接收功率换算成的 EIRP 或具代表性

seg-65a0444ca451 = MODELLED：LEO 过境几何与逐频段链路预算，依据所述 EIRP 和理想化天线方向图并含 ITU-R 传播项；各组成模型在验证矩阵中带有各自的标签。不是对任何卫星的测量。（结果<c1/>）

seg-8b3ffb30c23c = 可选的 [iot] 部分给出在所述接收机功率预算下，首次定位时间、每次定位的能量以及随占空比变化的电池寿命（MODELLED）。（类型目录（<c1/>））

seg-597be3a6eb96 = 可选的 [spoofer] 部分伪造一个声称位置的信号，该位置在起始之后相对真实位置跳变或被牵引，并运行两个带有所述虚警与漏检概率的监测器：多普勒与过境几何一致性（实测距离变化率对照由轨道以及独立的先验位置与速度所预测的值，在窗（类型目录（<c1/>））

seg-dbcc7b9c9b9b = MODELLED：EIRP、方向图、卫星以下 TEC 的 Chapman 比例以及整个过境。（类型目录（<c1/>））

seg-e675c999f303 = MODELLED。点波束、突发时序和 STL 波形未建模。（场景文件注释，第 { "14" } 行）

seg-c3665ac09bf6 = LEO-PNT 过境及其与可见 MEO GNSS 卫星对比的逐频段链路预算为 MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-ab0fc0d88556 = 带有所述来源的命名 LEO-PNT 系统预设，以及与具体系统无关的引擎，为 MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-ae15d15bf151 = 主题页面：<a1>LEO-PASS.md</a1>

seg-3ddcc0ea097f = <s1>上一页</s1>leo-navmsg

seg-7c0d4c0f536d = <s1>下一页</s1>leo-pnt-chain
