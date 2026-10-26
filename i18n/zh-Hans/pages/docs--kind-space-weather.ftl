# docs--kind-space-weather: translations (zh-Hans)

seg-37d29d8303fe = km

seg-8e845ce908ee = 引擎v{ $version }的场景类型，所属类别为<a1>GNSS测量、定位与完好性</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-f6b7ca020692 = 类别页面：<a1>GNSS测量、定位与完好性</a1>

seg-95f8bd8e0078 = 来源：<c1/>

seg-24c21b5b0cc3 = <c1/>（场景类型）

seg-5f25c5b71f0c = 空间天气环境模型：太阳（F10.7/F10.7a）与地磁（Kp，附定义性的Kp↔ap对照表）活动指数、由它们驱动的Jacchia-1971外逸层温度（与已发表的太阳活动极小/平均/极大值做了核对验证），以及在一组高度上，Jacchia-1971热层中性密度（取昼夜平均外逸层温度）相对于不含活动的静态剖面，即静态大气所忽略的太阳周期密度依赖。MODELLED：该密度与加速度计反演的密度（TOLEOS CHAMP和GRACE）在太阳活动极大期相符到{ "2" }倍以内，但在{ "2008" }年太阳活动极小期偏高约1.7x。

seg-f2c2860db799 = <c1/>的一次运行汇总如下：space-weather：F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" }（ap={ "27" }）-> T_inf={ "1047" } K；密度在{ "300" } km处为x1.49（MODELLED）

seg-6bb05c41eba2 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>

seg-c367f1aacd0b = 示例<c1/>设置了以下内容等：

seg-02dc0d42fb21 = sfu

seg-1dd966268e12 = { "2" } nT

seg-d245f215f331 = 结果标签（引擎给出）：MODELLED：太阳/地磁指数、Jacchia-71外逸层温度，以及昼夜平均温度下的Jacchia-71静态密度

seg-c1c6f2f73fb5 = 引擎为scenarios/space-weather.toml（类型space-weather）绘制的图表

seg-15587da59e8e = <b>MODELLED</b>太阳/地磁指数（定义性的Kp↔ap对照表）、Jacchia-1971外逸层温度，以及Jacchia { "1971" }热层密度（SAO特别报告{ "332" }：静态扩散剖面，复现其表{ "7" }，含昼夜、地磁

seg-f8eef6eabfb2 = <b>MODELLED</b>太阳/地磁指数（定义性的Kp↔ap对照表）、Jacchia-1971外逸层温度，以及Jacchia { "1971" }热层密度（SAO特别报告{ "33" }。参考基准（ExternalDataset）：定义性的Kp↔ap对照表 + Jacchia-1971外逸层温度闭式解（与已发表锚点一致到<{ "1" } K，tests/space_weather_reference.rs）；密度对照pymsis NRLMSISE-00（独立的NRL模型）做了表征：{ "800" } km处的太阳周期摆幅为10.4x，而NRLMSISE-00为13.6x。{ "0.30" }版修订：经校准的一阶活动因子被Jacchia { "1971" }取代（默认场景密度在{ "40" }

seg-72979b637644 = MODELLED：太阳/地磁指数、Jacchia-71外逸层温度，以及昼夜平均温度下的Jacchia-71静态密度（结果<c1/>）

seg-0306ee022298 = MODELLED：该密度与加速度计反演的密度（TOLEOS CHAMP和GRACE）在太阳活动极大期相符到{ "2" }倍以内，但在{ "2008" }年太阳活动极小期偏高约1.7x。（类型目录（<c1/>））

seg-b86a312077b5 = 诚实范围：MODELLED。Kp<->ap换算是定义性的IAGA对照表，外逸层温度与已发表的太阳活动极小/平均/极大量级做了核对验证，但密度修正是经校准的一阶标高耦合，它抓住了正确的符号、单调性和数量级，而不是经数据核对验证的（NRLMSISE-00）大气所具有的绝对精度。运行：kshana scenarios/space-weath（场景文件注释，第{ "10" }至{ "15" }行）

seg-10cf16c12a2a = 空间天气环境与活动驱动的热层密度是MODELLED，而非经独立核对验证：其中一项子声明经过外部核对，但整项能力由建模的部分组合而成，因此该能力仍是Modelled。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-3dd29f8fba14 = <s1>上一页</s1>space-packet

seg-ff9d9a41692b = <s1>下一页</s1>spectrum
