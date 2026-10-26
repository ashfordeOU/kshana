# docs--kind-optical-atmosphere: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-51362910dcb7 = 有{ "2" }个内置场景使用此类型；其余的在<a1><c1/></a1>中。

seg-72ad48275ebe = 引擎v{ $version }的场景类型，所属系列为<a1>光学PNT</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为MODELLED（标签如何获得，见README的Evidence一节）。

seg-a97755cb13eb = 系列页面：<a1>光学PNT</a1>

seg-9fd02351d844 = ms

seg-d4e4da22fadb = 来源：<c1/>

seg-deb0a932a76f = <c1/>（场景类型）

seg-a878d9be65b7 = MODELLED的穿越大气光学PNT：针对一条光链路和一组给定云气候的地面站点，报告随波长和高度角变化的晴空损耗（Kim能见度定律加瑞利散射）、Hufnagel-Valley湍流状态（雷托夫方差、闪烁指数、伽马-伽马参数、孔径平均）、相对链路余量由天气决定的可用性（云光学厚度取自对数正态液态水气候，几何光学消光，独立的湍流衰落）、达到目标可用性所需的链路余量、中断持续时间分布、经时钟守时（holdover）模型得出的每次中断的授时与测距误差增长、与距离相关的站点分集可用性，以及增强技术（波长、接收孔径、自适应光学闪烁抑制、额外余量）的假设性增益。作为对所述公式的实现，VALIDATED于一个独立的mpmath参考基准（oracle）：雷托夫方差、闪烁指数、伽马-伽马衰落概率、孔径平均因子、云与晴空光学厚度。MODELLED：所有天气、技术和时钟输入，以及独立性和copula假设；没有与任何实测可用性记录作过比较。仅供参考的分析，不是经认证的可用性或导航产品。

seg-c443d8d3e4ce = <c1/>的一次运行汇总如下：optical-atmosphere：{ "1550" } nm，高度角{ "30" }度，穿越大气前的余量{ "19.2" } dB；最佳站点为南部{ "74.66" } %；3站点网络{ "92.72" } %（天气独立）/ { "91.62" } %（天气相关）（MODELLED，仅供参考）

seg-e466ecbd4e6d = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>

seg-8adae3ea6e60 = 示例<c1/>设置了以下内容等：

seg-687f2930a40d = downlink

seg-e794d481aed4 = plane

seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

seg-9799bd5f9fdb = nm

seg-7707c45d1d30 = dBm

seg-0fd6a569077f = 结果标签（引擎给出）：MODELLED：穿越大气的光学PNT：晴空消光（Kim能见度定律 + 瑞利散射）、取自给定液态水气候的云光学厚度（P.840含量，几何光学消光）、带伽马-伽马衰落和孔径平均的Hufnagel-Valley湍流、相对

seg-4e2b759aff17 = 引擎为scenarios/optical-atmosphere-network.toml（类型optical-atmosphere）绘制的图表

seg-a18d144f149e = <b>MODELLED</b>沿斜程路径对Hufnagel-Valley Cn2积分，得到平面波与球面波雷托夫方差（上行和下行）、Andrews-Phillips闪烁指数和伽马-伽马参数、伽马-伽马衰落概率与衰落余量，测试：<a1>optical_atmosphere_reference.rs</a1>。

seg-d97535fd4875 = <b>MODELLED</b>光链路相对给定链路余量的可用性，基于对数正态云液态水气候（ITU-R P.840含量，几何光学消光）和独立的伽马-伽马湍流衰落，达到目标所需的链路余量 测试：<a1>optical_atmosphere_identities.rs</a1>。

seg-6e2c643df3a6 = <b>MODELLED</b>光学站点的中断持续时间分布，与时钟守时（holdover）模型的闭式滑行方差耦合：给定中断分位数下的授时与测距误差、到达授时阈值的守时时间、中断的比例 测试：<a1>optical_atmosphere_identities.rs</a1>。

seg-00c76aeadb90 = <b>MODELLED</b>一个可选启用的<c1/>表（时长、步长、随机种子）使<c2/>类型还会按站点写出一次带随机种子的、对所述站点模型随时间的实现：云事件（晴空时段服从指数分布，云中断服从对数正态 测试：<a1>optical_atmosphere_timeseries.rs</a1>。

seg-f1ee20e52b46 = <b>MODELLED</b>沿斜程路径对Hufnagel-Valley Cn2积分，得到平面波与球面波雷托夫方差（上行和下行）、Andrews-Phillips闪烁指. 参考基准（ExternalDataset）：数值计算结果与一个独立程序（xval/optical-atmosphere/oracle.py，mpmath { "1.4.1" }，{ "30" }位精度，对原始高度变量做tanh-sinh求积，并使用Bessel-K伽马-伽马密度）比较，该程序与Kshana不共用任何代码，判据在任何实现出现之前就已固定（xval/optical-atmosphere/PREREGISTRATION.md）。为何是MODELLED：该参考基准（oracle）评估的是同样的已发表公式，因此它检查的是实

seg-4af9bc99ef29 = <b>MODELLED</b>光链路相对给定链路余量的可用性，基于对数正态云液态水气候（ITU-R P.840含量，几何光学消光）和. 参考基准（InternalConsistency）：内部自洽：分集模型的闭式极限与单调性、云顶闭式解，以及对数正态中断恒等式。没有宣称任何外部参考基准（oracle），也没有与任何外部基准比较过：没有使用任何实测的光学地面站可用性或无云视线记录。为何是MODELLED：云气候（有云概率、液态水柱的中位数与离散度、中断持续时间），

seg-b3abf6cbeba4 = <b>MODELLED</b>光学站点的中断持续时间分布，与时钟守时（holdover）模型的闭式滑行方差耦合：给定中. 参考基准（InternalConsistency）：与守时模块逐位一致的内部自洽；没有宣称任何外部参考基准（oracle）。各等级的功率谱密度是守时模块本身已带有的合成长tau底限，因此这些数字继承了它所声明的局限：到达严格阈值的守时时间由假定的红噪声底限决定，而不是由所引用的阿伦偏差决定。中断持续时间是带给定参数的对数正态模型，而非实测的

seg-c4772a9e1a26 = MODELLED：穿越大气的光学PNT：晴空消光（Kim能见度定律 + 瑞利散射）、取自给定液态水气候的云光学厚度（P.840含量，几何光学消光）、带伽马-伽马衰落和孔径平均的Hufnagel-Valley湍流、相对链路余量的可用性、与时钟守时（holdover）耦合的中断持续时间，以及与距离相关的站点分集。数值计算结果已核对（结果<c1/>）

seg-32c6524b0baf = MODELLED的穿越大气光学PNT：针对一条光链路和一组给定云气候的地面站点，报告随波长和高度角变化的晴空损耗（Kim能见度定律加瑞利散射）、Hufnagel-Valley湍流状态（雷托夫方差、闪烁指数、伽马-伽马参数、孔径平均）、相对链路余量由天气决定的可用性（云光学厚度取自（类型目录（<c1/>））

seg-2c7493ee5042 = MODELLED：所有天气、技术和时钟输入，以及独立性和copula假设；没有与任何实测可用性记录作过比较。（类型目录（<c1/>））

seg-b4402211e3fe = 穿越大气的光学PNT：三个ILLUSTRATIVE地面站点（云量较多的北部站点、居中的中部站点和较晴朗的南部站点）在{ "30" }度高度角、{ "1550" } nm下观测一个LEO光学终端。云气候是给定的输入，而不是测量值，也不是任何数据集的取值，因此下面的每个可用性都是MODELLED。每个站点的运行报告晴空损耗、Hufnagel-Valley湍流状态、（场景文件注释，第{ "1" }至{ "8" }行）

seg-384f5c73cdf9 = 对每个站点链路随时间的一次带随机种子的实现（MODELLED；是对上述模型的一次抽样，而不是气候本身）。缺省时不写出任何序列，结果即为{ "0.37" }文档。（场景文件注释，第{ "78" }至{ "79" }行）

seg-c75fa5787bd4 = 光学斜程大气数值计算：雷托夫方差、闪烁、伽马-伽马衰落概率、孔径平均、云与晴空光学厚度，是MODELLED，而非经独立核对验证：其中一项子声明经过外部核对，但整项能力由建模的部分组合而成，因此该能力仍是Modelled。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e5013bdf86bb = 由天气决定的光学地面站点可用性及与距离相关的站点分集，是MODELLED，而非经独立核对验证：它与自身的闭式/解析恒等式核对，只能发现转录和系数错误，并不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-dc1132147318 = 专题页：<a1>OPTICAL-ATMOSPHERE.md</a1>

seg-bd5b1654b3ed = <s1>上一页</s1>oem-interop

seg-ef0a779c300c = <s1>下一页</s1>orbit
