# docs--kind-gnss-ssv: translations (zh-Hans)

seg-37d29d8303fe = km

seg-834408a40783 = min

seg-1b94e5a24a2d = 来源：<c1/>

seg-ee3ecc6e0330 = <c1/>（场景类型）

seg-d07af7221334 = 引擎 v{ $version } 的场景类型，所属系列为<a1>空间用户导航</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-d6d7bca305dc = MODELLED 的 GNSS 可用性与链路强度，适用于空间服务空域（Space Service Volume）及更远处：对位于球面（ICG 手册的全球壳层）或开普勒轨迹（LEO 至月球转移）上的用户，按星座（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）及全部合计，统计高于 C/N0 门限的可用信号——至少一个信号与至少四个信号的可用性、最大中断时长、接收 C/N0、精度因子、主瓣与旁瓣链路——可采用手册、参数化或用户提供的发射方向图，并可选用掠射射线电离层、等离子层和大气效应以及可选的弱信号接收机设计；此外还有适用于 HEO 与月球转移航天器的星载 GNSS 扩展卡尔曼滤波器（轨道动力学、太阳辐射压、第三体、时钟），以及基于单差伪距的多航天器编队相对导航。已在预先登记下对照 ICG SSV 手册表格核对（xval/gnss-ssv）

seg-d739ae994bf0 = <c1/> 的一次运行汇总为：gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

seg-79d2e350ed73 = 必填字段：<c1/>

seg-7fc75803140d = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-cebc76420d69 = 示例 <c1/> 设置了以下内容等：

seg-ce3b64e8c1f4 = [l1, l5]

seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

seg-b02a3ef32d54 = HEO，高增益天底天线与贴片天顶天线，参数化

seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

seg-3421a66993bd = heo

seg-8974ff39f695 = parametric

seg-1d65b71c5de0 = 有 { "5" } 个内置场景使用该类型；其余见<a1><c1/></a1>。

seg-8ac8f00f6c77 = 1/m^{ "3" }

seg-15ca016a7a4f = 引擎给出的结果标签：MODELLED：几何与链路预算扫描。手册方向图为恒功率主瓣，参数化方向图为具代表性的替代，掠射射线介质为一个简单的既定模型；此处没有任何一项是对空间信号的测量。可用性与中断数据遵循

seg-7dae5e291c8b = 引擎为 scenarios/gnss-ssv-heo.toml（类型 gnss-ssv）生成的图表

seg-0aae0574c5e6 = <b>MODELLED</b> <c1/> 类型的可用性扫描：按星座（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）及合计，统计（用户，历元）对中至少有一个信号和至少有四个信号的占比及最长中断时间，针对位于球面上的用户

seg-07c94d5ad15c = <b>MODELLED</b> <c1/> 类型的 <c2/> 模式：九状态扩展卡尔曼滤波器（位置、速度、接收机钟差与钟漂、太阳辐射压标度），处理伪距，其可用性、噪声和 C/N0 来自同一条链路

seg-41bfe74c6f6f = <b>MODELLED</b> <c1/> 类型的 <c2/> 模式：一个主航天器与若干副航天器各自运行绝对滤波器；副航天器相对主航天器的位置，通过绝对估计值相减以及基于单差伪距的相对滤波器来估计

seg-de9a2a5b5f04 = <b>MODELLED</b> <c1/> 类型的可用性扫描：按星座（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）及合计，统计（用户，历元）对中至少有。参考基准（oracle，ExternalDataset）：ICG Space Service Volume 手册（UN OOSA ST/SPACE/75，{ "2018" }）本身就是一项仿真，对照是在运行之前提交的预先登记下进行的（xval/gnss-ssv/PREREGISTRATION.md；结果见 xval/gnss-ssv/RESULTS.md，由 tests/ssv_booklet_results.rs 固定，未达到判据的项也包含在内）。按预先登记的解读进行的第 { "1" } 轮：最小辐射功率常数与月球判据相符（S0、S6 达到判据）；上、下 SSV、RF 门限

seg-f0b778c4922a = <b>MODELLED</b> Chapman 电离层、Gallagher 型等离子层与中性大气（折射率弯曲、氧吸收、散焦）沿直线积分。参考基准（oracle，InternalConsistency）：测试中的闭式解与已发表的量级（Chapman 层的峰值与地表临边的弯曲、GPS 到 GEO 射线上几个 TECU 的等离子层）；接收机设计复用了捕获与跟踪环路模型及其测试。没有拿实测的临边探测数据或弱信号接收数据与之比较

seg-77cef183420e = <b>MODELLED</b> <c1/> 类型的 <c2/> 模式：九状态扩展卡尔曼滤波器（位置、速度、接收机钟差与钟漂、太阳辐射压。参考基准（oracle，InternalConsistency）：以仿真真值对照滤波器自身的估计（一致的滤波器，其位置的平均归一化估计误差平方约为 { "3" }），以及固定随机种子下的确定性。没有拿飞行数据或已记录的高轨 GNSS 数据作比较；太阳和月球是低精度的圆轨道替代

seg-429e154cd691 = <b>MODELLED</b> <c1/> 类型的 <c2/> 模式：一个主航天器与若干副航天器各自运行绝对滤波器；副航天器相对主航天器的位置，通过。参考基准（oracle，InternalConsistency）：与绝对滤波器相同的仿真真值：相对滤波器相对于真实相对状态的误差，以及检查其表现至少不逊于对两个独立绝对定位解作差。没有拿飞行编队数据作比较

seg-1dd1beb01075 = MODELLED：几何与链路预算扫描。手册方向图为恒功率主瓣，参数化方向图为具代表性的替代，掠射射线介质为一个简单的既定模型；此处没有任何一项是对空间信号的测量。可用性与中断数据遵循 ICG Space Service Volume 手册（UN ST/SPACE/75）的方法，并对照 xval/gnss-ssv/ 中的表格核对。（结果<c1/>）

seg-e9c2dedbc971 = MODELLED 的 GNSS 可用性与链路强度，适用于空间服务空域（Space Service Volume）及更远处：对位于球面（ICG 手册的全球壳层）或开普勒轨迹（LEO 至月球转移）上的用户，按星座（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）及全部合计，统计高于 C/N0 门限的可用信号——至少一个信号与至少四个信号的可用性、最大中断时长、接收 C/N0，（类型目录（<c1/>））

seg-3add0e744c54 = MODELLED：方向图具代表性，并非实测；介质为既定的简单模型（docs/SSV.md）。（场景文件注释，第 { "14" } 行）

seg-6b4655dd5270 = 空间服务空域及更远处的 GNSS 信号可用性，并与 ICG SSV 手册比较，为 MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-a9e1798308df = <c1/> 类型中，掠射 GNSS 信号上的临边射线电离层、等离子层与大气效应，以及弱信号接收机设计，为 MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-132be2813c10 = 高轨与月球转移航天器的星载 GNSS 导航滤波器为 MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-f9405de9adb8 = 基于 GNSS 的高椭圆轨道多航天器编队相对导航为 MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-4881f925ea7f = 系列页面：<a1>空间用户导航</a1>

seg-4b72df59b3f9 = 主题页面：<a1>SSV.md</a1>

seg-c9ac9a99bcbb = <s1>上一页</s1>gnss-sim

seg-9df48482a140 = <s1>下一页</s1>gravity-map
