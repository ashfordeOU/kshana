# docs--kind-constellation-design: translations (zh-Hans)

seg-e27476e37522 = 地球

seg-37d29d8303fe = km

seg-11e8c29ecb45 = 引擎v{ $version }的场景类型，所属类别为<a1>星座、覆盖与几何</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-a4f1e7d2041e = 类别页面：<a1>星座、覆盖与几何</a1>

seg-670191cf797f = 主题页面：<a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = 来源：<c1/>

seg-f708c26a5139 = <c1/>（场景类型）

seg-de173c9f4034 = 大规模星座设计：i: T/P/F约定下的Walker delta和Walker star构型（节点分布在{ "360" }或{ "180" } deg上，面内间隔{ "360" }<em>P/T，面间相位偏移{ "360" }</em>F/T）、显式的根数列表和多壳层设计，一次运行中有多个星座，围绕地球、月球、火星或任何其他行星、冥王星或主要卫星，使用body模块中的常数（太阳系和body-pnt类型使用的是同一些常数）。来自已发布标称根数的预设：gps-baseline和gps-expandable（GPS Standard Positioning Service Performance Standard第5版{ "2020" }的{ "24" }个轨位和六对可扩展的前后轨位，表3.2-1至3.2-3）、galileo（Walker 24/3/1，{ "29 599.801" } km和{ "56" } deg，Galileo Open Service Service Definition Document第{ "1.1" }版，表{ "1" }和{ "23" }）、beidou和beidou-meo（Walker 24/3/1，{ "21 528" } km和{ "55" } deg，外加位于东经{ "80" }、{ "110.5" }和{ "140" } deg的三颗地球静止卫星，以及倾角{ "55" } deg的三颗倾斜地球同步卫星，BeiDou Open Service Performance Standard { "3.0" }第{ "4.1" }节；MEO相位和东经{ "118" } deg的倾斜地球同步穿越是由模型计算得出的，因为标准没有给出）以及glonass（24/3/1，{ "19 100" } km和{ "64.8" } deg，取自GLONASS Interface Control Document第{ "5.1" }版第{ "5.2" }节的轨位公式）。覆盖与精度因子：在纬度/经度网格和带仰角遮蔽的采样窗口上，给出每个单元的可见卫星数、GDOP、PDOP、HDOP和VDOP，每个单元的可用性（PDOP不高于某一阈值时可定位，默认为{ "6" }），全球（按面积加权）可用性和最差站点的可用性，每个星座一个接收机钟，除非clock = "common"。它可扩展到数千颗卫星：可见性是对每颗卫星覆盖半角的点积，且每个历元按星下点纬度对卫星分带，因此网格的一行只测试可能可见的那些卫星；报告会统计省去的配对测试次数。JSON中带有网格图和降采样的逐卫星星下点轨迹。VALIDATED：Walker生成器对照Galileo OS SDD表{ "23" }和GLONASS ICD轨位公式，GPS预设对照SPS PS表3.2-1已发布的赤道穿越列，GPS基线全球HDOP分布对照SPS PS附录B（中位数{ "0.94" }，{ "95" }% 为{ "1.25" }，均值{ "0.96" }，容差{ "0.03" }）。MODELLED：二体轨道（可选长期J2）、球形天体、仅几何可见性（无信号功率、健康状态或地形），以及不同系统之间的相对相位，它并不是任何真实日期的快照。

seg-21fbd84bfba1 = 运行一次<c1/>的摘要为：constellation-design: 围绕地球的{ "5000" }颗卫星（LEO-PNT）；可用性{ "99.22" }%（{ "20" } deg遮蔽角下PDOP <= { "3" }），最差站点{ "0.00" }%，PDOP中位数{ "1.11" }，平均可见{ "39.4" }颗；{ "648" }个网格点x { "12" }个历元（MODELLED）

seg-af572ce1fd89 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>

seg-fd393ddc7d5d = 示例<c1/>设置了以下内容等：

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = 有{ "3" }个内置场景使用此类型；其余的在<a1><c1/></a1>中。

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = 结果标签（引擎给出的）：MODELLED - 围绕球形天体的二体开普勒轨道（可选长期J2）、仰角遮蔽之上的几何可见性、全视场精度因子，每个星座一个接收机钟，除非clock = "common"；无信号功率、健康状态或地形。Walker几何和已发布

seg-899e728ad9bd = 引擎为scenarios/leo-pnt-mega-shell.toml（类型constellation-design）生成的图表

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }：列出此类型的<a1>验证矩阵</a1>各行。

seg-602493ac6987 = <b>VALIDATED</b> <c1/>类型的生成器：T/P/F约定下的Walker delta和star构型（节点间隔360/P或180/P，面内间隔{ "360" }·P/T，面间相位偏移{ "360" }·F/T），以及GPS基线和可扩展的24轨位、Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> <c1/>覆盖引擎在GPS基线24轨位预设上，按GPS Standard Positioning Service Performance Standard（SPS PS）附录B的条件（一个恒星日，{ "287" }个五分钟步长，{ "4" } x { "4" } deg全球网格，带

seg-1272200ad4f2 = <b>MODELLED</b> <c1/>类型在两个固定算例之外的部分：显式和多壳层设计，每次运行有多个星座且每个星座一个接收机钟，由天体常数得到的地球、月球和火星，BeiDou预设 测试：<a1>coverage_dop_gnss_lib_py_oracle.rs</a1>。

seg-0c64f22330d2 = <b>VALIDATED</b> <c1/>类型的生成器：T/P/F约定下的Walker delta和star构型（节点间隔360/P或180/P，面内间隔{ "360" }·P/T，面 。参考基准（ExternalDataset）：已发布的机构文件：Galileo Open Service Service Definition Document第{ "1.1" }版（European GNSS Service Centre）表{ "1" }和{ "23" }，2016-11-21 { "00" }:{ "00" } UTC的参考星座；GLONASS Interface Control Document第{ "5.1" }版（{ "2008" }年）第{ "5.2" }节，节点经度和纬度幅角的轨位公式；GPS Standard Positioning Service Performance Standard第5版（{ "2020" }年4月）表3.2-1、3.2-2和

seg-87c4e19dc780 = <b>VALIDATED</b> <c1/>覆盖引擎在GPS基线24轨位预设上，按GPS Standard Positioning Service Performance Standard（SPS PS）附录 。参考基准（ExternalDataset）：GPS SPS PS第5版（{ "2020" }年4月）附录B第B.3.2.2和B.3.2.3节，满编基线24轨位星座已发布的全球平均HDOP分布（中位数{ "0.94" }，{ "90" } % 为{ "1.16" }，{ "95" } % 为{ "1.25" }，{ "98" } % 为{ "1.37" }，均值{ "0.96" }），表3.8-1（PDOP可用性）和表B.3-1（降级星座的集合PDOP，仅用作上界），外加针对一个历元的手工推导闭式。VDOP和PD

seg-04289f7252cd = <b>MODELLED</b> <c1/>类型在两个固定算例之外的部分：显式和多壳层设计，每次运行有多个星座且每个星座一个接收机钟。参考基准（InternalConsistency）：内部自洽：暴力仰角扫描、手工计算与orbit::dop的归约，以及闭式的Walker和地球同步几何。二体轨道带可选的长期J2，球形天体且局部垂线沿半径方向，仅几何可见性（无信号功率、卫星健康状态、地形或第三体摄动），以及取自不同来源的系统之间的相对相位

seg-00fa65d44cbd = MODELLED - 围绕球形天体的二体开普勒轨道（可选长期J2）、仰角遮蔽之上的几何可见性、全视场精度因子，每个星座一个接收机钟，除非clock = "common"；无信号功率、健康状态或地形。Walker几何和已发布的预设对照Galileo OS SDD、GLONASS ICD和GPS SPS Performance Standard的轨位表进行检查，（结果<c1/>）

seg-62f0fc16a247 = MODELLED：二体轨道（可选长期J2）、球形天体、仅几何可见性（无信号功率、健康状态或地形），以及不同系统之间的相对相位，它并不是任何真实日期的快照。（类型目录（<c1/>））

seg-3ef4276dd40b = 该运行回答的问题：可见卫星数、每个{ "10" } deg单元的PDOP/HDOP/VDOP/GDOP，以及在{ "20" } deg遮蔽角之上、两小时内PDOP不高于{ "3" }的时间占比。地图显示的薄弱之处是极冠：没有任何壳层达到约{ "82" } deg纬度以上，因此靠近极点的用户会看到所有卫星都在天空的一侧，垂直几何会变差。MODELLED：一个示意性的设计，带J2的二体轨道，球（场景文件注释，第{ "17" }至{ "21" }行）

seg-c333d3fe22cd = 围绕任意中心天体、大规模任意多星座设计的覆盖和精度因子地图为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-436504a8b26f = <s1>上一页</s1>conflict-resilience

seg-cba188459c80 = <s1>下一页</s1>contact-schedule
