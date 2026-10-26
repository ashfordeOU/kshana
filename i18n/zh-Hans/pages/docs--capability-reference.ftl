# docs--capability-reference: translations (zh-Hans)

seg-f4f59f19e091 = 能力卡片

seg-501d3a72ea43 = 完好性

seg-20db2c79b998 = 已独立核对

seg-65d239fc4894 = 基于真实激光测距的月球坐标系基准

seg-c92dd319fa36 = { "337" }个ILRS标准点 · 中位数{ "5.13" } mm

seg-2f7f950518be = 以真实数据取代仿真活动：{ "337" }个已归档的ILRS月球激光测距标准点，覆盖五个后向反射器阵列，每个观测值按文件中记录的自身精密度加权。反射器坐标采用主轴系DE440星表，以独立文件名保存，与平均地球系DE430表分开；把其中一个送入另一个的旋转中，会使反射器偏移数百米而没有任何报错，因为两者都是格式正确的坐标。

seg-2db69c58f694 = 月球差分PNT

seg-32adcb9b1b02 = 精确的共模恒等式 · 建模得到的去相关

seg-d4ac8cbac83e = 月球参考站与用户之间的差分改正。共模抵消是精确恒等式；空间去相关残差是随基线增长的一阶几何模型，改正链路残差预算与其并列给出，使起限制作用的一项保持可见，而不是并入一个数字之中。

seg-9b83e78dcd7b = 月球时间尺度与大地测量VLBI

seg-bcd769beab07 = 各时钟类别的交叉时间表

seg-80107b7841bf = 月球时间尺度下各时钟类别的交叉时间，即各类振荡器在没有更新的情况下何时不再满足给定界限，同时给出月球大地测量VLBI观测量及其对基准贡献的费希尔信息。

seg-99084680c321 = 真实检索得到的月球星座几何

seg-a7be7d68e767 = { "5" }个已提交的固定数据集，均可由其记录的来源重新生成

seg-d3591b4b4633 = 服务体积基于已发布的星座设计运行，而不是示意性设计：五颗卫星的LANS互操作性演示参考集，{ "8" }、{ "12" }和{ "16" }颗卫星的LNCSS案例研究，以及来自JPL Horizons的2023-01-01当日实际在月球轨道上的四个航天器。每个文件都说明自身的坐标系和来源类别；超出列表星历末端的时间范围会被拒绝而不是外推；示意性的开普勒结果与检索得到的结果并列给出，并附两者之差，绝不以后者取而代之。

seg-807b9fc7b517 = 基于实测C/N₀ 离散度的月球拒止等值线

seg-a908030a9fcc = 按功率比的对峙距离为{ "49.2" } km，按失锁的为{ "19.4" } km

seg-3ee440e8b619 = 在真实的月球斜距上逐卫星计算干信比，并把有用信号一侧保持为分布而不是压缩为中位数，使拒止等值线带有中继几何实际产生的不确定度范围。两项判据并列报告：功率比阈值，以及由跟踪环动力学计算的失锁。轨道捕获覆盖区按发射机高度和波束宽度扫描；网格始终未达到临边捕获时，报告会如实说明并给出差额。

seg-229134190045 = 从VLBI观测计划到站坐标协方差

seg-547181855481 = 秩{ "6" }，亏数{ "0" }；自由网亏数{ "1" }，被指认为共同平移

seg-6d147beefb43 = 在基线乘历元的观测计划上，把月球VLBI时延偏导数累加为费希尔信息矩阵，并返回站坐标协方差，使从时延精密度到坐标标准差的这一步是估计出来的，而不是假定的。自由网与基准固定网并列报告，并指明其秩亏数和不可观测方向。表面点协方差与地球站协方差分开保存，因为近场信标偏导数是两个测站单位矢量之差，其表现与远场情形不同。

seg-028833cc45bc = 无线电测量导航与中继PNT

seg-6c94ae122721 = 深空与火星PNT

seg-ef21cd4b1962 = 经仿真验证（协方差与闭环性能指标，不是经认证的保护级）；以太阳为中心的火星动力学与JPL DE440交叉核对，1天弧段上为{ "137" } m；火星低轨定轨 ≈ { "0.2" } m。

seg-469988966702 = 一个开放的深空与火星无线电测量导航引擎：迭代光行时加夏皮罗延迟，双向、单向和三向多普勒与测距（Moyer双程），相干转发器转换，再生式与PN测距以及 Δ-DOR；CCSDS-TDM输入输出；简化动力学平方根信息滤波器（经验加速度、星载时钟和火星大气阻力），在合成闭环中完成火星低轨定轨；单向加双向融合；以及带有端到端GSE性能仿真器的MARCONI火星静止中继星座。

seg-b4284bd2629e = 具有跨模态完好性的光学与射频切换

seg-ae131bc1ba67 = 光学 / 射频PNT

seg-1b25468c9780 = 最小可检测偏差：水平{ "8.20" } m，垂直{ "12.30" } m，授时{ "24.6" } ns

seg-a5387333ab2d = 故障注入使跨模态监测器具有检测功效，而不只是无故障时的通过：在给定的虚警和漏检预算下，给出每个轴的最小可检测偏差。切换之后，协方差的重新增长会对照告警限值向前传播，因此报告说明单一模态解保持在限值之内的时长，而不只是说明切换是连续的。光学与射频测距环节仅在积累时间和路径匹配时才进行比较，报告拒绝与选定而非实测的数值构成比值。

seg-00cb9df27979 = 接收机自主完好性（ARAIM）

seg-f86ecc2fda8e = 基于真实GPS + Galileo快照的MHSS · DO-316双星座

seg-841a6f3f0277 = 快照式和解分离式RAIM，含水平与垂直保护级（HPL/VPL）、故障检测与排除以及斯坦福完好性图；另有显式的完好性风险预算（MHSS）保护级，含双星座和多星座的全星座故障模式（EU ARAIM / DO-316）。

seg-695aa5c57d83 = 对照已发布参考向量的ARAIM

seg-08f9dd480ba7 = 最大误差{ "0.044" } m，对照各来源自身的{ "0.05" } m容差

seg-68185dd65478 = 引擎的MHSS保护级对照欧美C工作组参考机载算法自身已发布的算例运行，每个算例都连同其检索URL、日期、页码和文件SHA-256一并转录，并保存在两处，由测试断言两者一致。验收向量是内部自洽的《参考机载算法描述文件》v3.1附录D。里程碑{ "3" }报告含有两处内部缺陷：几何中的一处符号笔误，以及在{ "57" }个故障模式下求值的虚警乘数，而正文称其为一个；因此其保护级按实测差异报告，而不予评定，这些缺陷通过运行该文件自身的数值加以演示。

seg-17b28b3cf1fa = SBAS / WAAS保护级与双频

seg-99766b79a00a = 增强（SBAS）

seg-4cfec990b19b = DO-229E K因子 · L1/L5无电离层组合

seg-ef3a5513bbd8 = 采用DO-229E加权最小二乘形式的SBAS / WAAS保护级（精密进近和航路K因子），以及作为DO-316基础的L1/L5双频无电离层组合（IS-GPS-705）；保护级几何结构与参考线性代数实现交叉核对。

seg-0a5bd5230c32 = 守时（holdover）、稳定度与时间频率传递

seg-69a0269c4732 = 时钟与授时

seg-641ae762b453 = 按时钟数据手册标定 · 守时与范洛恩协方差递推交叉核对

seg-6f1c2e1f0bf4 = 二态卡尔曼守时，含置信区间的阿伦族稳定度（ADEV / MDEV / TDEV / HDEV）和完整的IEEE-1139五系数幂律拟合，以及实用的传递方法：采用BIPM Sagnac闭式的TWSTFT、GNSS共视、PPP无电离层传递、带湍流闪烁的自由空间光链路，以及逆方差时钟集合时间尺度。GNSS拒止下的时钟守时（holdover）计算器把范洛恩滑行误差增长反演为守时至阈值时间，即时钟自由运行多久其钟差才超出预算，涵盖经典与量子时钟类别；结果由模型计算得出，并如实指出：对于非常稳定的时钟，达到严格阈值的守时时间取决于假定的长tau噪声底，而不是所引用的ADEV。

seg-85b181275293 = 伪距、电离层与对流层

seg-835df2d05f2a = GNSS测量域

seg-ef01abb1cfe8 = Saastamoinen ZHD ≈ { "2.3" } m · 天顶处Niell为一 · Klobuchar依据IS-GPS-200

seg-43c0372fe6e7 = 前向伪距 / 多普勒合成，电离层采用Klobuchar（广播）和IONEX / TEC格网（实测），包括IONEX文件解析器、时间内插和薄壳斜向倾斜映射；对流层采用Saastamoinen + Niell；以及快照式RAIM。

seg-3458cb02f156 = 单点定位（PVT）

seg-640e4cd9f008 = GNSS定位

seg-4fa43feda96a = 在真实IGS数据上验证（测站ABMF，2018-05-13），对照测量坐标，3-D RMS为{ "5.7" } m，水平为{ "1.1" } m。

seg-b107ba0607b0 = 由真实RINEX码伪距加广播星历，经迭代加权最小二乘解算出真实接收机位置：含萨尼亚克 / 地球自转改正、带TGD的广播钟差、L1/L2双频无电离层组合（或单频Klobuchar）、Saastamoinen/Niell对流层、高度角加权、DOP以及快照式RAIM。

seg-5819c351d123 = 压制干扰（jamming）与多层欺骗干扰（spoofing）检测

seg-9a03f3db9ef0 = χ²₁ NP检测器 · 闭式与蒙特卡罗P_fa/P_md一致

seg-788fdc9a22a1 = 一个链路预算压制干扰模型（J/S → 有效C/N₀ → 失锁），一个随机时间欺骗干扰检测器（Neyman–Pearson / χ²₁ 能量检验，含蒙特卡罗P_fa/P_md以及等于{ "1" } − P_md的安全性能指标），以及一个融合RAIM一致性奇偶检验、射频AGC功率监测和信号质量（SQM）监测的多层欺骗干扰检测器。另有量子惯性航位推算误差预算：将冷原子干涉仪白噪声漂移与残余偏差（与独立积分器交叉核对）以及标度因子误差合成为守时期间的位置漂移数值，即时钟守时的惯性对应项。

seg-87bca15c6939 = 调制、抗干扰与码跟踪

seg-c7d3ff7ea829 = 导航信号性能

seg-1aec700caefe = BPSK自SSC = 2/(3R_c) · { "45" } dB-Hz下C/A DLL抖动低于一米 · GPS C/A Gold互相关 -23.9 dB

seg-304803ee178d = 位于链路预算与测量域之间的信号性能层：BPSK-R(n) 和正弦BOC(m,n) 的单位面积功率谱密度；由实际信号和干扰机频谱直接导出抗干扰Q（压制干扰模型所使用的量）的谱分离系数；决定测距信息量的RMS（Gabor）带宽（BOC > BPSK）；相干早迟DLL码跟踪热噪声抖动；带窄相关器抑制的相干早减迟多路径误差包络；以及测距码设计权衡（m序列 / Gold自相关旁瓣和三值Gold互相关界，外加码长到无模糊距离的反演）。这是信号性能分析，不是射频载荷或天线硬件设计。

seg-684494a7877c = 无源射频地理定位（TDOA/FDOA）

seg-414872cdf952 = 无源射频地理定位

seg-bed5944d15dd = 无噪声TDOA正向到反向精度达{ "1e-6" } m · J·CRLB = I · GDOP随接收机数单调变化 · 估计器在{ "4000" }次蒙特卡罗试验中达到其CRLB

seg-be8f2a419275 = 利用接收机网络上的到达时间差双曲面，经高斯–牛顿最小二乘解算，定位压制干扰源或欺骗干扰源（或用于反向PNT的机会信号源）；加入到达频率差并使用移动接收机，可联合恢复辐射源的位置和速度，并由网络几何给出位置协方差上的克拉美–罗界。采用点源视线模型，不含多路径 / NLOS、接收机钟差或折射项。

seg-48e98ff7065e = RINEX、SP3与CCSDS格式

seg-7c6f4dc6bcba = 互操作性

seg-ae8dc649ab26 = 广播星历加SP3内插对照RTKLIB；OEM对照独立的CCSDS解析器

seg-75aae4d201fd = 多GNSS RINEX-3广播星历摄取（GPS、Galileo、QZSS、北斗、GLONASS），RINEX-3观测值解析器（RINEX { "4.00" }观测值布局预期可解析，但尚未用其读取过任何{ "4.00" }文件；RINEX { "4" }导航文件按名称被拒绝），带拉格朗日内插的SP3-c/d精密星历读写器，面向飞行动力学工具（GMAT、Orekit、STK）的CCSDS OEM { "2.0" } + OMM（平均根数）导出，以及面向深空无线电测量跟踪的CCSDS-TDM（{ "503" }）跟踪数据消息解析与生成。

seg-1f379e235f5f = 机器检查的验证矩阵

seg-a4d10bb41065 = 验证与保证

seg-72ec664ea7ae = 标注为已验证的行必须有外部参考基准（oracle）（该不变式在CI中强制执行）

seg-cab165105f32 = 一份从引擎自身生成（Markdown/CSV）的需求—模块—测试—参考基准（oracle）—状态交叉对照表，并带有经单元测试的诚实性不变式：仅当某行带有独立的外部参考基准（oracle）（NIST / AIAA / SOFA / IGS / 已发表的数值）时才可标注为已验证，因此内部自洽性检查不能冒充验证；Kshana不提供的硬件 / 功放能力则记录为合作方负责的缺口。这是ECSS-E-ST-10-02验证交叉对照的可执行骨架。

seg-190cdf3ca8dc = 每个报告量都带有单位和来源

seg-1c7bb8c3e887 = { "87" }种中的{ "87" }种，{ "3127" }个数值字段中的{ "3127" }个

seg-3e7fb040a7c4 = 场景输出的每个数值字段都带有单位，以及取自封闭词表的来源类别，并在有定义时附带定义，作为机器可读的模式与引擎一同发布。一个逐级收紧的检查门会运行每种内置类型，对未带这些信息的字段判定失败；尚未完成的类型逐一列出，并说明各自仍未完成的原因，该清单只会缩短。自带常数的报告（单向链路预算、光学与射频预算）使读者仅凭报告本身即可重新计算要点数值。

seg-0e1a01c9158a = 发射、再入、覆盖与指向预算

seg-f5cf9e86d3c9 = 任务分析

seg-767b2cd5f4ba = 对照闭式解核对（发射方位角 · Allen-Eggers · SMAD）

seg-23bac81d700b = 一阶任务设计预算，每项都是可运行的场景：二体发射与上升几何（发射方位角、最小倾角、地球自转增益、转弯平面变轨 Δv、每日发射窗口数），Allen–Eggers弹道再入走廊（峰值减速度、峰值过载和峰值加热速度），对地观测覆盖几何（经SMAD空间三角形得到幅宽 / 星下点GSD / 偏离星下点可达性 / 重访），三自由度（3-DOF）姿态与指向误差预算（重力梯度力矩 + RSS指向预算），地面站过境预测（AOS/TCA/LOS、最大仰角、可达性），以及基于CCSDS { "401" } / DSN 810-005链路方程的单向链路预算（FSPL、C/N₀、Eb/N₀、余量、闭合）。这是位于STK/GMAT/Basilisk之下的硬件前期解析层：由模型计算得出的一阶预算，不能替代六自由度（6-DoF）或无线电测量分析。

seg-43f53b910042 = 导航与通信的天线口径共享

seg-989637b0c6fc = 逐会话的中断与争用，而不是单一的占空比数值

seg-5c63a4559aff = 输入接触计划和天线口径数量；输出导航占空比、通信占空比、逐会话中断与争用。仲裁策略在报告中明确写出，而不是隐含其中；无法被完全满足的会话会报告其损失的比例，而不是消失在平均值之中。

seg-c8eb43aeb31a = 空间天气与热层密度

seg-37b8c9397544 = 空间环境

seg-25e24a6c0ba3 = Jacchia-71对照已发表的太阳活动极小 / 平均 / 极大值核对

seg-1eff250f41c3 = 一个空间天气环境模型：太阳（F10.7 / 以81天为中心的F10.7a）和地磁（Kp，附定义性的Kp↔ap对照表）活动指数，由其驱动的Jacchia-1971外逸层温度，以及某一高度上经活动修正与静态热层中性密度的对比，即静态大气所忽略的太阳周期密度依赖。这是经标定的一阶标高耦合，不是经数据验证的NRLMSISE大气。

seg-49bac998eb07 = 射频损伤检测评估与PNT权衡

seg-dca720256d85 = 机器学习评估与权衡

seg-5f0a39efe160 = AUC测试框架对照双正态闭式 Φ(d′/√{ "2" })（Gneiting & Vogel { "2018" }）核对；评估指标与scikit-learn { "1.9.0" }逐位一致地验证；合成语料，不是原始IQ/TEXBAT

seg-0dc3a7135442 = 一个射频损伤检测评估试验台：带标签、参数有依据的合成语料（标称 / 压制干扰 / 时间欺骗 / 位置欺骗 / 多路径），一个与检测器无关的ROC/AUC测试框架，可对任意检测器评分，并给出目标Pfa下各类别的Pd，以及分布内与分布外的乐观性差距。更深入的乐观性差距研究将其扩展到13个检测器的组合（能量 / AGC / SQM / 奇偶，外加带随机种子的逻辑回归和单隐层MLP检测器）、带置换零假设的分布内与分布外缩放规律，以及分布外性能退化的留一法预测器；软件定义接收机前端（原始IQ/IF到相关器早 / 即时 / 晚抽头再到SQM）和真实数据摄取适配器（RINEX、u-blox UBX、GnssLogger、JammerTest、Yunnan、SatGrid）使同样的检测器可在本地提供的记录上运行。另有量子与经典PNT的权衡：对照经典基线，从实测ADEV曲线量化候选时钟的授时与惯性守时收益，并给出GNSS拒止下韧性随时间变化的包络。这是由模型计算得出的工作特性，绝不是现场 / IQ数据，也不给出好坏结论。

seg-8766e058334d = 量子与经典韧性交叉图

seg-8f851e9cf8c2 = 重新生成结果图背后的惯性与时钟交叉研究；权衡核对照scipy { "1.17.1" }验证

seg-a057ad4c89ce = 一张可复现的图，展示在参数不确定的情况下量子传感器在何处超过其经典对应物：冷原子对导航级航位推算，以及光学对芯片级时钟的守时，覆盖中断时长和平台振动范围，每条曲线都带有技术成熟度标签。可通过cargo run --bin crossover_study复现。这是由模型计算得出的性能预算，输入是已发表或有界的系数，不是飞行数据。

seg-6347618838dd = 条件授时保护级

seg-a846e806e577 = 授时完好性

seg-762bc9f28716 = 组合结果与多步clock_state协方差递推交叉核对；在JammerTest { "2024" }（Zenodo { "15911589" }）上标定

seg-3622798325cd = GNSS欺骗干扰下未检出钟差的守时受限界：给定独立的交叉核对，所提供时间的误差受k倍标准差的监测器下限、检测时延内的范洛恩滑行方差以及CUSUM报警时间所限定。在一次真实记录的欺骗干扰（JammerTest { "2024" }）上标定，可通过cargo run --example tpl_jammertest复现。这是由模型计算得出的组合结果，以检测为条件；不存在有限的无条件界，因为足够缓慢的斜坡会躲过单一的时钟辅助监测器。

seg-734a93b6a809 = PNT韧性评分与决策不稳定性

seg-c25b4e240fb5 = 韧性评估

seg-f42ae8719e02 = { "35" }项手工推导的参考基准（oracle）测试；字节级确定的研究产物（固定随机种子）；与DHS RPCF v2.0对齐

seg-62ef40799af4 = 漏检 → 完好性区域

seg-52e55797d77c = 完好性影响

seg-99025f66f277 = 斯坦福-ESA完好性区域（Tossaint等，NAVIGATION { "2007" }）

seg-13f23ffe5840 = 一座从漏检到完好性的桥梁：欺骗干扰 / 压制干扰 / RAIM检测被漏检后遗留的未检出偏差会放大有效位置误差，将其对照特定场景的告警限值，即被划入斯坦福-ESA完好性区域（可用 / 不可用 / 误导 / 危险）。其组合了有外部基准的RAIM斯坦福分类；不增加任何新的完好性数学。

seg-3a7572774192 = 单位覆盖成本投资回报

seg-797d137dc022 = 决策支持

seg-d77993b6ef59 = 单位覆盖成本投资回报视角：星座 / 架构权衡中每单位所交付覆盖的成本。覆盖部分组合了经独立外部参考基准核对的覆盖几何，其算术经过单元测试，但成本是用户输入，因此该比值是规划辅助，不是经外部验证的量（所以如实说明，没有验证徽章）。

seg-690b4cb0df55 = Kshana交换格式（KIF）

seg-558523b5e0ac = 产物交换

seg-b882cccf5cee = 带版本的封装 · 已验证往返读写与向前兼容读取

seg-ff5a4ead87fe = 一种带版本、自描述的封装，把场景结果连同其类型、模式版本以及由模型计算得出 / 经独立外部参考基准核对的标签一并包裹，使存储的产物保持自我说明，较旧的封装仍可向前兼容地读取。

seg-5052e1720602 = 船舶接收机信任度评分

seg-70144aeea2d1 = 监测器算术已对照pynmea2和GeographicLib核对

seg-9d9329128f06 = 根据船舶接收机和仪器已经输出的NMEA { "0183" }，对船舶导航定位结果是否可信打分：逐历元、批量、实时或作为门限，给出0-100的分数、三个等级及其背后的原因。监测器将定位结果与船舶自身的运动、航向传感器、计程仪和卫星信号电平进行比较。仅供参考的软件，不是经型式认可的导航设备：责任仍由操作人员承担。监测器的算术已对照独立的库核对；评分规则和阈值是本项目自己的，仍属由模型计算得出。

seg-a47934361f43 = 船员培训NMEA数据流

seg-c6492d4a7dae = { "225,227" }条语句由pynmea2解析并解码

seg-9ca765cc09fc = 为一次按脚本设定的航程写出合成的驾驶台NMEA { "0183" }，其中包含教员编排的压制干扰、位置拖离、时间欺骗和重放事件，并附教员日志，使船员能在自己的仪器上看到劣化的定位结果是什么样子。仅为文本，绝不用于船舶的实时导航系统；不发射任何内容，也不产生任何无线电信号。语句及其解码值经过核对；接收机、天空和事件模型则是由模型计算得出。

seg-39f61b88209e = 代码含义和几何已对照pyModeS、pyais、shapely和GeographicLib核对

seg-4c1667d3d453 = 基于公开许可的输入，生成逐日的GeoJSON地图，显示飞机（ADS-B）和船舶（AIS）在何处报告了劣化的导航数据，以及航线穿过劣化单元的比例。劣化单元只是关于所报告精度字段或不合理位置的陈述，不是存在干扰的结论；无人观测的单元也不能证明航线畅通。反映的是过去的报告，不是预报。

seg-e0962980e96f = 面向安全运营的信任度遥测

seg-9b538e790bd7 = Prometheus、OTLP和CEF由独立解析器回读核对

seg-f33e062790d9 = 将信任度数据流导出为Prometheus指标、OpenTelemetry（OTLP/HTTP）以及经stdout、HTTP、UDP或TCP发送的CEF或LEEF系统日志事件，使安全运营中心能在其他告警旁边看到导航故障。采集器失效既不会使评估停滞，也不会无人察觉。Prometheus、OTLP和CEF由独立解析器回读核对；LEEF仅对照其自身规范核对。

seg-c74f3b9569b1 = 签名证据包

seg-28016686504c = RFC { "8032" }向量逐字节一致；一个净室验证器在{ "71" }个包上结果一致

seg-123fa1de2e23 = 把信任事件前后的时间窗口打包成哈希链接、Ed25519签名的包，任何人都可离线验证：文件被修改、删除、替换或添加、包被重新签名或固定的密钥有误，均会被指出。可选的RFC { "3161" }时间戳令牌与其绑定。这是技术记录，不是法律意见、事实认定或证明。

seg-ee2e250497f9 = Test-bench导出

seg-ea618add831e = 转换与编码已对照PROJ、GeographicLib、pynmea2和SciPy核对

seg-be8af88f4f99 = 把场景中的载体运动和事件写为CSV轨迹和NMEA { "0183" }，供实验室GNSS模拟器使用：含地固、大地和局部速度列、姿态和UTC。仅限运动和事件：不写出信号，也不声称任何模拟器或接收机的性能。

seg-1ff1d8ebf1e7 = 与公开框架的compliance对应

seg-83af3fa21509 = 仅按条款编号，把Kshana的输出对应到公开框架的条款（面向船舶的IMO指南、欧盟NIS2第{ "21" }条、EN { "16803" }、美国DHS韧性PNT框架以及EASA航空指南），依据你所提供的运行结果填写，并说明一组运行结果为哪些行提供证据支持（supports evidence for），同时给出每一行的差距。这不能据此认定任何框架已被满足，也不是任何一方的评级或批准。

seg-1b784a8701ac = GNSS认证

seg-2b5a6095013a = 全部{ "18" }套官方测试向量集：{ "186,382" }个标签通过认证，{ "0" }个失败

seg-0419e9af208d = 一个开放的、纯Rust的接收机侧验证器，用于Galileo开放服务导航电文认证：它通过空间信号规范中的公钥、密钥链和标签检查，判断接收机能从I/NAV页面或u-blox UBX数据流认证哪些卫星的导航数据，并按卫星和按时间报告认证结果。它认证的是数据；不声称任何抗欺骗干扰性能。

seg-d8bb6226f2e3 = 天际线遮蔽下的可见性、DOP与误差椭圆

seg-6c6e7248496f = 天空几何

seg-94ff262653a6 = { "1173" }个观测角和{ "142" }个可见卫星集合与Orekit { "12.2" }和gnss_lib_py { "1.0.4" }在{ "1e-12" }内一致；该椭圆在{ "270" }个算例上与numpy一致

seg-309521d4c9e1 = 当建筑物、码头、起重机或地形遮挡部分天空时，某地点能看见哪些卫星，以及这对精度因子（DOP）和水平误差椭圆有何影响。随方位角变化的天际线取代了单一的高度截止角；可见集合、其DOP和误差椭圆按历元和按星座给出。天际线只剔除视线卫星，别无其他：它不建模反射、不建模衍射，也不建模信号强度。

seg-448e81d36ca4 = 天际线预设与天空几何函数

seg-6483f9d89f15 = 手工计算的数值以及点云所采样的几何；没有外部参考基准（oracle）

seg-ebc2904904d3 = 把街道峡谷、扇区和地形化简为天际线表，四个有代表性的预设（城市街道、港口进近、峡湾、集装箱码头），以及把它们组合成天空图和蒙特卡罗点云的函数，可通过CLI、MCP、Python和浏览器使用。这些预设是具有选定并已说明尺寸的代表性几何，不是实测勘测，并且这些化简仅对照手工计算的数值核对。

seg-c2a5a6a7bcb0 = 顾及几何的信任度分类

seg-2f51e4da63b4 = 分类规则和阈值是本项目自己的，仅对照自身核对

seg-b664ce284745 = 把卫星几何与接收机信任度评分并列，并为每一项扣分指明类别：信号丢失、几何不佳，或接收机所报DOP与由所见卫星导出的DOP之间不一致。只有在几何已知时才对其评判，标签是首要信息：只有几何不佳才会扣分。仅供参考的软件，不是经型式认可的导航设备。

seg-5026aab26cb8 = 月球参考站研究

seg-d6935d32272b = 组合已测试的月球差分、时钟和坐标系函数；仅对照自身和一个numpy参考核对，没有外部飞行数据

seg-4f9696706384 = 一项可复现的研究，考察在公开假设下月球南极参考站能做什么：覆盖整个极区的覆盖与精度地图（改正与未改正位置误差的百分位数、附每个不可用历元原因的可用性、保护级和改正链路预算），在原子钟上保持月球时间基准的时间实验室，以及新增激光后向反射器和VLBI信标相对于五阵列基准的大地测量。每项输入都标明其公开来源，或标明为示意性。这不是对任何真实系统性能的陈述，Kshana与任何机构均无隶属关系。

seg-cad8be3b66a3 = 穿过云层与湍流的光学授时链路

seg-e86745da72f0 = { "7" }项中的{ "7" }项预先登记的数值判据达到，对照独立的mpmath程序；尚未与任何实测可用性记录比较

seg-dd98aa94f8c8 = 大气处于路径上时，光学时间传递链路有多大比例的时间可用。对每个地面站，引擎给出晴空损耗、含伽马-伽马闪烁衰落和孔径平均的Hufnagel-Valley湍流状态、依据所述云气候相对于链路余量的可用性、任何余量都无法突破的上限、中断时长分布，以及中断给守时时钟造成的钟差。随后展示增加站点、加大口径、改用另一波长或采用自适应光学能带来什么。所附带的云气候是示意性的，不是实测的；输出仅供参考。

seg-861d57389dd7 = 星座之外的GNSS：空间服务体积及其以远

seg-8705c276af61 = ICG SSV手册表格，预先登记；多数判据NOT MET（xval/gnss-ssv/RESULTS.md）

seg-2dc82174942a = 针对位于球面上（ICG空间服务体积手册的全球壳层）或位于从LEO到月球转移的开普勒轨迹上的航天器，按每个星座（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）以及全部合计，统计C/N0阈值以上的信号：一路与四路信号的可用性、最长中断、接收C/N0、精度因子，以及主瓣与旁瓣链路对比。发射方向图取手册中的、参数化替代模型或由你提供的；临边射线电离层、等离子体层和大气模型以及弱信号接收机设计为可选；包含面向高轨和月球转移轨道的星载GNSS滤波器以及编队相对导航。MODELLED：在运行之前提交的预先登记之下与手册表格比较，最小辐射功率常数和月球判据一致，其余判据在预先登记的读法下为NOT MET（几乎全部源于手册中不一致的GLONASS波束角），并且参数化旁瓣替代模型不能复现实测的GPS面板方向图。

seg-61817375c8ea = 作为导航与大地测量基础设施的月球轨道与月面

seg-d2439abaeabb = 数值部分的numpy/scipy参考基准（oracle）；三项预先登记的判据NOT MET（xval/lunar-infra/RESULTS.md）

seg-db45ac2940af = 限制性三体模型中的五项研究：近直线晕轨道上的星载地球GNSS定轨，对照独立的地面测距与测距变率定轨；月面站与轨道器联合的载波相位整周模糊度固定（LAMBDA）；有无轨道器至月面测距时七参数月球基准的费希尔信息；GNSS、VLBI和激光测距相对于局部联测的偏移；以及对月球潮汐和天平动参数的敏感性。MODELLED，输入为示意性：数值部分已对照独立的numpy和scipy程序核对，物理部分未核对。在预先登记的判据之下，三项为NOT MET：注入的力误差未以所述比率检出（C3），自助法成功率与numpy参考基准相差{ "1.7e-6" }，而判据为{ "1e-9" }（Q3），且增加一类测距并不总是降低伪逆矩阵的迹（G3，迹的一半）。

seg-d6476863f862 = 能力

seg-ad856ad710eb = 状态

seg-6962adaa6a1f = 在构建时根据仓库的场景文件和验证矩阵生成。

seg-6f44f45f6bf9 = 来自<c1/>的{ "61" }张能力卡片，之后是验证矩阵的全部{ "388" }行。

seg-30200bb5be58 = 在Kshana Studio中运行orbit-sgp4-gps.toml

seg-ecacc78711a1 = 在Kshana Studio中运行realtime-frame-eop.toml

seg-fe9baedab7f0 = 在Kshana Studio中运行imu-deadreckoning.toml

seg-58a3232bc4cf = 在Kshana Studio中运行ins-trn-coast.toml

seg-27ffc4dfa394 = 在Kshana Studio中运行gps-denied-gravity-nav.toml

seg-eb0c08082d24 = 在Kshana Studio中运行gnss-ins.toml

seg-8d0f45d119a9 = 在Kshana Studio中运行lunanet-araim.toml

seg-09641b89ad3a = 在Kshana Studio中运行lunar-frame-realisation.toml

seg-4eea1b7d77cd = 在Kshana Studio中运行moonlight-service-volume.toml

seg-3cd4cd7d7c16 = 在Kshana Studio中运行lunar-interop-export.toml

seg-d767de2fa87a = 在Kshana Studio中运行lunar-llr-datum.toml

seg-29266e8878ac = 在Kshana Studio中运行lunar-differential-pnt.toml

seg-0955d6ded82d = 在Kshana Studio中运行lunar-time-budget.toml

seg-ab41004755ea = 在Kshana Studio中运行lunar-jamming.toml

seg-edbe5cf449a0 = 在Kshana Studio中运行lunar-vlbi-fim.toml

seg-d706c2d59dd1 = 在Kshana Studio中运行mars-pnt-lmo.toml

seg-71586c459df8 = 在Kshana Studio中运行hybrid-optical-rf.toml

seg-87634a6d41b5 = 在Kshana Studio中运行integrity-raim.toml

seg-a281aa02ddc7 = 在Kshana Studio中运行araim-reference-check.toml

seg-9184b54b1173 = 在Kshana Studio中运行clock-holdover.toml

seg-2f270136b41d = 在Kshana Studio中运行gnss-sim-raim.toml

seg-f2f3ede70967 = 在Kshana Studio中运行pvt-abmf.toml

seg-eac325fbeed1 = 在Kshana Studio中运行spoof-attack.toml

seg-07d55d3e7bdc = 在Kshana Studio中运行oem-interop.toml

seg-5b70a59accce = 在Kshana Studio中运行aperture-duty-cycle.toml

seg-d3df277fd118 = 在Kshana Studio中运行space-weather.toml

seg-7dc863bf8f7b = 在Kshana Studio中运行impairment-eval.toml

seg-1c3083a77264 = 在Kshana Studio中运行conflict-resilience.toml

seg-b3f2b2d88d8c = 在Kshana Studio中运行gnss-ssv-shell.toml

seg-e42b759ccbaf = 在Kshana Studio中运行lunar-infrastructure-od-consistency.toml

seg-60a43431ebe0 = 要求

seg-cbf0f9bcd2d8 = 参考基准

seg-1603e76bcf66 = 基于滞后1自相关的幂律噪声识别

seg-d95fe5878ee3 = allan::lag1_noise_id：Riley与Greenhall（{ "2004" }）的滞后1自相关噪声识别器（对抽取后的相位去除其二次项，或对分组平均后的频率去除其直线项；反复取一阶差分，直到delta = r1/({ "1" }+r1) < { "0.25" }或d = dmax），可在任意平均因子下返回幂律指数alpha的整数值和未取整值（+{ "2" }为白噪声相位调制，-2为随机游走频率调制）；它设定了实测时钟库中各器件卡片的噪声类型自由度

seg-6e0cb6acc073 = VALIDATED

seg-4d820e75cd4f = allantools { "2024.6" }的autocorr_noise_id（A. Wallin及贡献者，LGPL-3.0-or-later，由测试夹具生成器作为独立程序运行）：对已发表的Riley-Greenhall算法的独立实现，在所述约定下是唯一确定的量。核对的是识别器本身，而不是任何真实时钟的噪声内容

seg-aedf395f3597 = Galileo OSNMA接收机侧导航电文认证

seg-1e6e62438dad = osnma + <c1/>：一个开放的、纯Rust实现的Galileo OSNMA接收机侧校验器（SIS ICD { "1.1" }版，接收机指南{ "1.3" }版），输入为I/NAV页面或u-blox UBX-RXM-SFRBX数据流：默克尔树公钥（DSM-PKR）、DSM-KROOT的ECDSA P-256/P-521签名、TESLA密钥链校验（SHA-256或SHA3-256）、针对ADKD { "0" }、{ "4" }和{ "12" }的MACSEQ与标签校验（HMAC-SHA-256或CMAC-AES）及交叉认证、密钥链终止/撤销/更新、公钥更新与撤销，以及告警消息；逐卫星的状态为Authenticated/Failed/Unavailable，每一次失败或延迟都附有原因。仅供参考：不是经型式认可的导航设备，也不是导航完好性服务；不声称具有任何抗欺骗干扰性能

seg-a6bd60ed728f = 欧洲GNSS服务中心作为接收机指南附件发布的官方Galileo OSNMA测试向量（Test_vectors.zip，sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370）：{ "18" }组中的{ "18" }组，{ "186,382" }个标签通过认证，{ "0" }个失败，于2026-10-10离线运行（证据记录见kshana-pro的docs/evidence）。适用范围：这些向量验证的是密码学校验（默克尔树、KROOT/ECDSA、TESLA密钥链、MACK标签、ADKD 0/4/12）及其在已发布场景上的结果；它们只使用HMAC-SHA-256、SHA-256密钥链、128位密钥、40位标签以及查找表条目{ "33" }和{ "34" }，因此CMAC-AES、SHA3-256密钥链和其他参数仅由已发布的基本算法已知答案测试和合成测试覆盖。可信时间、数据绑定、过期和报头确认方面的加固由合成攻击测试检验，而不是由外部参考基准检验。未检查：证书撤销列表、实时信号或实时接收机（UBX字布局仅在合成帧上检查）、SHA3-256默克尔树、没有独立时间时的新鲜性。不是欧盟的服务

seg-27a61718eb95 = 频率稳定度表征

seg-56174d771190 = 阿伦/修正/阿达马偏差 + 带 χ² 置信区间的幂律噪声识别

seg-ed01b2ab3481 = 在NBS14上与NIST SP { "1065" }（Riley）/ Stable32的参考偏差对照

seg-25b78672c194 = 真实实测时钟上的频率稳定度

seg-fd378f5fe04a = 真实铯钟标准上的重叠阿伦偏差 + 重叠阿达马偏差

seg-64fd49d58394 = 与Stable32对照：实测5071A铯钟相位序列上的重叠ADEV/HDEV（allantools）

seg-f305dbc83f2b = 在标准Stable32参考序列上的阿伦估计器一致性

seg-5bfca5dcfb7c = 覆盖完整AF阶梯的重叠阿伦 + 修正阿伦 + 时间偏差

seg-327ab6dcf16a = PHASE.DAT的Stable32参考偏差（Riley；标准回归序列）

seg-96c4275f5a89 = 扩展范围的频率稳定度（Theo1 / TOTDEV）

seg-7f59c3631ca4 = Theo1与总偏差（TOTVAR）——扩展范围的长 τ 稳定度估计器，可达记录长度的约{ "75" }%，而阿伦偏差在约{ "50" }% 附近即告失效；建立在它们之上、已去除偏差的ThêoH混合估计器（allan::theoh_curve）仍为MODELLED

seg-a38edc2526f5 = allantools { "2024.06" }——独立的第三方频率稳定度库——的theo1（NIST SP { "1065" }式{ "30" }）和totdev（NIST SP { "1065" }式{ "25" }），所用数据为封闭的NIST SP { "1065" } §{ "12.4" } LCG数据集；可离线通过tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py重新生成

seg-cc40472fbcbf = 最大时间间隔误差（MTIE）——电信漂移指标

seg-5c54ba2748f7 = MTIE(τ)：在任意长度为 τ = m·tau0的滑动窗口内，时间误差的最大峰峰值摆幅；这是ITU-T G.810/G.823/G.8261的漂移统计量，同步网络限值（MTIE模板）即以此编写——它是极值（最大/最小）量，不同于RMS类的阿伦族

seg-300fd3f945a0 = allantools { "2024.06" }——独立的第三方频率稳定度库——在封闭的NIST SP { "1065" } §{ "12.4" } LCG相位序列上的mtie()；MTIE是纯粹的最大/最小统计量，因此在以相同方式构造的相位数组上，估计器输出与allantools逐位一致（已提交的15位有效数字参考常数相差在{ "1" } ULP以内）。可离线通过tests/fixtures/mtie/generate_mtie_reference.py重新生成

seg-67d73f3ca14d = 修正阿伦 / 时间偏差（MDEV / TDEV）

seg-9ac9d2b0bdf8 = MDEV(τ)：重叠修正阿伦偏差（二阶差分滑动窗口估计器，可区分白相位噪声与闪烁相位噪声），以及TDEV(τ) = τ/√{ "3" }·MDEV(τ)，即ITU-T G.811/G.812/G.823的时域漂移统计量，同步模板即以此编写

seg-24a441f32375 = allantools { "2024.06" }——独立的第三方频率稳定度库——在封闭的NIST SP { "1065" } §{ "12.4" } LCG相位序列（与Theo1/TOTDEV/MTIE各行所用序列相同）上的mdev() 和tdev()，计算的是同样唯一确定的估计器；相对偏差匹配至<{ "1e-9" }。可离线通过tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py重新生成。（受数据门控的phasedat_reference.rs也会将它们与Stable32对照至{ "1e-3" }；而这里是严格的、始终开启的封闭交叉核对）

seg-e4b6d707cbf5 = 真实实测曲线上的光钟频率稳定度

seg-e9077554a08f = 从已发表的 ⁸⁸Sr光钟跃迁实测阿伦偏差出发，做幂律（白噪声调频 + 红噪声下限）NNLS恢复——复现 σ_y(τ) 以及标志性的4.7e-16/√τ 短 τ 标度，并带有真实实测的长 τ 下限，而不是holdover.rs通常所假设的合成光学级下限

seg-4eaf0c102678 = Norcia、Young、Eckner、Oelker、Ye、Kaufman，Science { "366" }：{ "93" }（{ "2019" }），图{ "4" }实测ADEV；曲线原样取自Zenodo 10.5281/zenodo.3382347（CC-BY-4.0）。范围限于复现已发表的实测稳定度曲线——时钟级别的守时至阈值器件数字仍为MODELLED

seg-cc95c8615d39 = 完好性（RAIM/ARAIM/SBAS）

seg-a83c68500982 = 三个独立工具，均在任何测试夹具或参考基准输出出现之前预先登记（0123cee1），容差在当时固定。（{ "1" }）ARAIM：Stanford MAAST for ARAIM { "2" }（提交ab70e2a3，BSD-3）mhss_raim_baseline_v5.m，在GNU Octave { "8.4" }下作为独立程序运行，驱动端带有unique() 兼容性垫片（已披露，不改变算法），采用ADD的TOL_PL { "0.05" } m：该Rust实现在{ "270" }个真实算例上复现了ADD参考实现。已披露：Kshana的ADD路径是在预先登记之后、按照MAAST实现ADD的方式编写的；审阅者另做了独立保留集检验（{ "270" }个新的用户几何以及第二条完好性支持电文，针对冻结代码重新运行MAAST），在同一判据下通过。（{ "2" }）快照RAIM：RTKLIB v2.4.2-p13（BSD-2）的estpos/valsol/raim_fde，在单独的C测试程序中用于检测与剔除；斜率PL取自RTKLIB matinv/xyz2enu加SciPy { "1.18.1" } chi2/ncx2，两侧计算的是同一个闭式表达式（Brown；Parkinson与Axelrad），因此PL检查覆盖的是实现，而不是公式。（{ "3" }）SBAS：Stanford MAAST（提交7d32b049）的usr_vhpl，未经修改，用于MAAST自己记录的WAAS广播：L1保护级在K重新缩放之后相差在{ "1e-4" } m以内，且受保护集相等。同样的比较得出了能力描述中所述的各项发现：统一sigma的ARAIM函数不符合ADD，并且L5集合相等性在{ "308" }个视野内没有GEO的历元对上不成立（两个工具都提供保护的{ "3267" }个历元对上，其保护级吻合至{ "1e-13" } m）。DO-229E/DO-316的K因子是抄录的常数，真实几何是输入；两者都不算作参考基准。{ "0.30" }版修订：snapshot_raim的保护级由径向改为大地测量局部水平面（在{ "16" }度N处，HPL最多变化{ "0.31" } m，VPL最多变化{ "0.14" } m）

seg-1c37702cc5f2 = 轨道外推与定轨

seg-4d8ef6c0aa45 = SGP4/SDP4、Cowell 6-DOF + 摄动、批处理/序贯定轨

seg-c84585f43297 = AIAA 2006-6753 SGP4验证向量

seg-50c545872e4f = 数值Cowell外推器与力模型

seg-74f8c585bcfd = 带分层力模型的Cowell数值外推器（二体、J2–J6带谐项、太阳/月球三体、炮弹形太阳辐射压、指数大气阻力）；RK4步长加倍 / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" }（CS GROUP，Apache-2.0）的NumericalPropagator/DormandPrince853——一个独立的库，积分器不同，球谐递推也不同。保守力各层（二体 → J2–J6带谐项 → 太阳/月球三体 → 炮弹形太阳辐射压）在{ "24" } h弧段上吻合至亚米级，验证了积分器 + 力代数；大气阻力层以及太阳/月球绝对星历和密度输入的保真度仍为MODELLED（仅作表征）

seg-d38c4be472ac = 扁球形地球的太阳辐射压地影（可选）

seg-ab8247c6b4d2 = 以WGS-84椭球作为遮挡天体的太阳辐射压受照比例（采用从椭球边缘朝向太阳的视地球半径，双圆盘透镜公式；srp_shadow::oblate_conical_shadow），可通过propagator::ForceModel::srp_shadow在Cowell力模型上选用（默认：球形锥形地影，保持不变）

seg-26c2db527cec = Orekit { "12.2" }（Apache-2.0）的SolarRadiationPressure.getLightingRatio，遮挡天体分别采用WGS-84和球形OneAxisEllipsoid，作为独立程序运行，太阳固定在相同的惯性位置。判据已在xval/srp-oblate-shadow-orekit/PREREGISTRATION.md（6d6d269c）中预先登记：两者均为{ "1e-6" }，以及扁球对球的差异 > { "1e-2" }；全部达到。两侧的椭球轴均为惯性z轴（不含岁差章动）

seg-01066d639b39 = 盒翼模型与ECOM2太阳辐射压，带偏导数（可选）

seg-2a5fc9708bd0 = 非炮弹形太阳辐射压：盒翼平板模型（Vallado式8-44；单面星体面板，太阳指向翼板），采用GSC卫星元数据中的Galileo FOC、IOV和IOV寿命末期表，按标称GNSS偏航姿态控制，并带有辐射因子以及每块面板镜面与漫反射系数的解析偏导数；以及ECOM2经验模型（D2/B1）及其偏导数。盒翼模型可在Cowell外推器（propagator::ForceModel::box_wing_srp，设置其srp_boxwing字段）和精密定轨模型（precise_od::PreciseForceModel::box_wing_srp）上选用，以cr作为辐射因子取代炮弹形项；两者默认均为None，使所有既有路径保持逐字节一致。ECOM2未接入任何力模型

seg-8f1d7126375c = Orekit { "12.2" }（Apache-2.0）的BoxAndSolarArraySpacecraft，带FixedPanel和PointingPanel，SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c)，GenericGNSS标称偏航以及ECOM2(nD = { "2" }, nB = { "1" })，作为独立程序运行，太阳位于固定的惯性位置；辐射因子的导数来自Hipparchus Gradient，每块面板的导数取为Orekit的中心差分（Orekit没有此项）。判据在任何Orekit输出出现之前已于xval/srp-boxwing-orekit/PREREGISTRATION.md（e59df6bf）中预先登记：相对{ "1e-12" }（端到端{ "1e-11" }，差分{ "1e-9" }）；全部达到（RESULTS.md）。VALIDATED仅涵盖模型求值：GSC表是抄录的输入，盒翼模型对真实Galileo轨道是否够用、热再辐射、修正的低beta偏航律以及食季转弯均不在涵盖范围内；Galileo太阳辐射压预测仍为MODELLED

seg-bde1b3a94a47 = 太阳临边昏暗的太阳辐射压地影（可选）

seg-eaaec545dd68 = 以未被遮挡的临边昏暗太阳通量比例作为太阳辐射压受照比例（Eddington近似律I(mu)/I({ "1" }) = 2/5 + 3/5 mu，Gauss-Legendre求积），作用于球形或WGS-84地球（srp_shadow::limb_darkened_shadow，ShadowModel变体OblateEarthLimbDarkened）

seg-76cb4b668ad5 = 没有外部基准：Orekit { "12.2" }没有临边昏暗的受照比例。仅对照同一定律的闭式解做了核对

seg-673b17e9dcf7 = NRLMSISE-00热层密度

seg-09e997231de8 = 对NRLMSISE-00经验热层模型的移植（gtd7和gtd7d：各组分密度、含反常氧的总质量密度、温度；{ "24" }个开关；日Ap和3小时ap数组模式），源自NRL Fortran的公有领域C版本

seg-80963ee0de61 = pymsis { "0.13.0" }（MIT）version={ "0" }，它以单精度运行NRL Fortran GTD7D；以及编译为独立程序的NRLMSISE-00 C移植版（发布{ "20190709" }，公有领域），外加该C发行版的{ "17" }个已发布测试输出。判据在该移植版出现之前已于xval/nrlmsise00-pymsis/PREREGISTRATION.md（e90ae26a）中预先登记；全部达到（RESULTS.md）。验证的是该移植版，而不是模型对照实测密度的精度

seg-12977f65b2ea = NRLMSISE-00阻力密度层（可选）

seg-17aec847b675 = forces::DensityModel（默认Exponential，Nrlmsise00 { "{" } f107a, f107, ap { "}" }）和propagator::ForceModel::drag_density：对随地球共转的大气取二次阻力，采用WGS-84大地点处的NRLMSISE-00密度（UT1 = TT的地球自转角，地方太阳时UT + lon/15），每个模型使用恒定的空间天气；默认关闭且逐位一致

seg-3878bf3b62d7 = Orekit { "12.2" }（Apache-2.0）的NumericalPropagator/DormandPrince853，使用Orekit自己的NRLMSISE00实现计算DragForce，作为独立程序运行，采用相同的地球自转角坐标系、WGS-84形状、地方太阳时约定（平太阳）以及作为UT的TT；约定设置已在参考基准之间互相核对（Orekit对pymsis，密度相差{ "5.2e-5" }）。判据已在xval/drag-tier-orekit/PREREGISTRATION.md（{ "21647478" }）中预先登记：阻力位移的{ "0.5" } m + { "1e-3" }，以及两项 > { "100" } m的灵敏度检查；全部达到。未涵盖：模型对照实测密度的精度、随时间变化的空间天气、GMAT一支

seg-1ac7430e88fc = 默认指数大气阻力对照独立实现（赤道）

seg-a9c41b03f2ca = Cowell外推器的默认阻力：对随地球共转的大气取二次阻力，使用forces::atmospheric_density，即Vallado表8-4在球面高度处的分段指数表（propagator::ForceModel::drag，采用forces::DensityModel的默认Exponential变体）

seg-e2e177761b30 = GMAT R2022a（NASA GSFC，Apache-2.0）的GmatConsole，采用Exponential大气（同一张28段表）、点质量地球和PrinceDormand78，仅运行，从不纳入仓库。判据已在xval/drag-exponential-gmat/PREREGISTRATION.md（640c85c1）中就两侧各自的阻力位移（有阻力运行减去无阻力运行）预先登记，这样可抵消两个地球mu值和积分器的差异；全部达到（RESULTS.md）。GMAT取大地高度，而kshana取球面高度：二者仅在赤道上重合，因此VALIDATED仅涵盖赤道轨道；离开赤道，两个模型按设计有所不同（在{ "51.6" }度、{ "400" } km处，为{ "24" } h位移的{ "10.4" } %）。GMAT的公开构建没有NRLMSISE-00（缺少插件），因此NRLMSISE-00层只有Orekit这一参考基准。该表对照实测密度的精度不在涵盖范围内

seg-9e15970435c3 = Cowell力模型中的DE440太阳与月球（可选）

seg-de6831cf7785 = 面向数值Cowell ForceModel的三体和太阳辐射压项的可选星历层：来自任意EphemerisProvider（通过KernelEphemeris使用DE440 SPK核文件）的地心太阳与月球，取TDB = TT + (TDB - TT)，拒绝无法为该历元提供服务的提供者，并统计任何回退到解析级数的次数；默认关闭

seg-50027b9f4251 = Orekit { "12.2" }（Apache-2.0）的NumericalPropagator/DormandPrince853，带ThirdBodyAttraction和SolarRadiationPressure，使用Orekit自己的DE440读取器（orekit-data lnxp1990.440），作为独立程序运行；kshana读取的是NAIF de440s.bsp经逐位一致且经SPICE核对的截取件。判据已在xval/propagator-de440-orekit/PREREGISTRATION.md（22a5a01d）中预先登记。轨道判据（{ "0.5" } m）和灵敏度对照已达到，但太阳/月球位置判据（{ "3" } m / { "0.2" } m）未达到，实测为{ "6.39" } m / { "0.244" } m。SPICE在其精确的TDB上读取同一核文件，与Orekit的差距相同（{ "6.25" } m / { "0.240" } m），因此差距出在NAIF的de440s路径与Orekit的DE440读取器或时间尺度之间；原因尚未查明。已记录并固定，故该行仍为MODELLED

seg-057c21daf4f2 = S1大气潮汐（可选）

seg-f600a39f297e = 作为位势摄动的日周期S1气压潮：Biancale与Bode（{ "2006" }）的模型N1，{ "2" }至{ "6" }阶，通过IERS { "2010" }式{ "6.21" }的负荷公式（tides::atmospheric_tide_s1、s1_air_tide_acceleration），可在Cowell和精密力模型上选用（air_tide_s1，默认关闭）

seg-7dd9fccac779 = 对位势效应没有外部基准。{ "24" }个系数抄录自GFZ STR06/01表{ "1" }模型N1，并已逐行对照该报告重新核对（SHA-256 890865ae）；不使用{ "0" }、{ "1" }、{ "7" }和{ "8" }阶。Ray与Ponte（{ "2003" }）没有印出球谐表，因此没有比较第二个来源

seg-b150b1bdb599 = IERS约定下的S2大气潮汐系数

seg-87e9238b8c53 = Ray（{ "2001" }）的S2气压谐波（n <= { "4" }，顺行和逆行）被转换为IERS { "2010" }式6.20-6.21的完全归一化、正弦超前形式（振幅除以N_nm，epsilon = { "90" }度 - psi），并作为S2项用于tides::atmospheric_tide

seg-4745148b6c60 = Biancale与Bode，GFZ科学技术报告STR06/01（{ "2006" }），表{ "5" }，模型A2：Ray（{ "2001" }）以完全归一化谐波和正弦超前相位发表，是同一模型的独立呈现。已与其所验证的修正一并在xval/s2-air-tide-fix/PREREGISTRATION.md（5e31c37a）中预先登记。仅涵盖系数转换；气压潮的位势效应没有外部参考基准

seg-444f0a65b6fd = Cowell外推器中的田谐位势

seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" })：一个独立的第三方MCDA库，计算同一个唯一确定的、按值域归一化的S/R/Q聚合；与之吻合到<{ "1e-9" }。可离线重新生成，见tests/fixtures/mcda_vikor/generate_vikor_reference.py

seg-790176ba8196 = MCDA优序净流量排序（PROMETHEE II）

seg-b25cedf6da6e = Preference Ranking Organization METHod：成对偏好指数，含六种标准广义准则形状、正向与负向优序流量以及完整的净流量排序（常规准则已独立检验）

seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual')：一个独立的第三方MCDA库，计算同一个唯一确定的净优序流量；与之吻合到<{ "1e-9" }。可离线重新生成，见tests/fixtures/mcda_promethee/generate_promethee_reference.py。带阈值的（q/p/σ）偏好形状可化为同一套广义准则代数，仍只做性质检查

seg-72248291c388 = MCDA优序选择核（ELECTRE I）

seg-a40e985d369d = ELimination Et Choix Traduisant la REalité：一致性/不一致性矩阵、一致且无否决的支配关系以及优序选择核（全部为效益型、权重和归一化、单一全局尺度的约定）

seg-bd625ceb90cc = pyDecision algorithm.electre_i（Valdecy Pereira）：一个独立的第三方多准则决策库，计算同一个唯一确定的一致性/不一致性/支配关系/核；逐元素与之吻合到<{ "1e-9" }。可离线重新生成，见tests/fixtures/mcda_electre/generate_electre_reference.py。ĉ/d̂ 阈值的选取属于分析人员的输入（敏感性仍为MODELLED）

seg-95942c6a2689 = MCDA聚合核（WASPAS / MOORA）

seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment（线性归一化的凸组合 λ·WSM+({ "1" }−λ)·WPM，λ={ "0.5" }）以及MOORA比率系统（向量归一化的加权效益总和减去加权成本总和）：前者是经稳定性加固的取值组合，后者是带符号的比率系统评分器

seg-7727f311faa3 = pymcdm（methods.WASPAS + normalizations.linear_normalization，l={ "0.5" }；methods.MOORA比率系统，向量归一化）：一个独立的、应用广泛的第三方Python MCDA库，计算同一组唯一确定的聚合值；与之吻合到<{ "1e-9" }。可离线重新生成，见tests/fixtures/mcda_waspas/ 和tests/fixtures/mcda_moora/。输入若有误，输出同样有误；敏感性/稳健性层仍为MODELLED

seg-7de67fedc1da = MCDA比例排序（COPRAS）

seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment：按列和归一化的效益显著度S⁺ 加上成本倒数显著度项、相对显著度Q以及效用度U = Q/max Q（最优备选方案 = { "1" }）

seg-49aeef0b79e4 = pyDecision algorithm.copras_method（Valdecy Pereira）：一个独立的第三方MCDA库，计算同一个唯一确定的COPRAS相对显著度/效用。有意选用pyDecision：pymcdm { "1.4.0" }的COPRAS在代数上退化为平凡的S⁺+S⁻，不是忠实的参照，而pyDecision实现的是规范的Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻))。与之吻合到<{ "1e-9" }；可离线重新生成，见tests/fixtures/mcda_copras/generate_copras_reference.py

seg-bdb2917a2520 = CUSUM变化检测的延迟与ARL

seg-302f5db625df = 表格式CUSUM检测器的最坏情况检测延迟（⌊h/(z−k)⌋+{ "1" }）与失控平均运行长度，供授时保护级和欺骗干扰监测器使用

seg-691a506ce13f = 已发表的表格式CUSUM ARL：Siegmund（{ "1985" }）布朗运动近似（Hawkins & Olwell { "1998" }，式{ "3.7" }），并与Montgomery所著Introduction to Statistical Quality Control（Wiley）中k=½、h∈{ "{" }{ "4,5" }{ "}" }的ARL表交叉锚定；确定性延迟与首次通过参考基准（oracle）完全吻合。组合得到的TPL界仍为MODELLED

seg-d923a77bd31a = 时钟守时（holdover）滑行方差与阈值反演

seg-4fafaf5f919d = 滑行相位误差方差增长q_wf·t + q_rw·t³/3 + q_drift·t⁵/20，及其到授时误差守时阈值的单调反演

seg-8993c7d8b080 = scipy { "1.18" }（BSD-3-Clause）：linalg.expm通过Padé 缩放平方法，在{ "6" }×{ "6" }增广矩阵上计算Van-Loan { "1978" }离散过程噪声Q₀₀ = ∫₀ᵗ ΦQcΦᵀds，这是一条从不接触kshana多项式系数的独立路径；另用optimize.brentq对同一条单调曲线求反，与kshana的二分法对照。各类红噪声底数值（ClockClass）仍为MODELLED

seg-eb3cd9e92d8d = 逆辛普森多样性核

seg-244d57819f2b = 有效架构多样性 = 逆辛普森/2阶Hill数1/Σpᵢ²，基于各独立性分组的源质量（韧性评分中的多样性项）

seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson（McDonald等，BSD-3-Clause）：一个独立的第三方库，计算唯一确定的逆辛普森指数；逐字节复现。建立在其上的DHS-RPCF评分框架（权重/等级）仍为MODELLED

seg-c14b8fe46517 = 随方位角变化的天际线遮蔽：可见集合、方位角与高度角，以及遮蔽下的DOP

seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry：由地面站点得到卫星的大地（WGS-84）方位角和高度角；方位角/高度角遮蔽表在方位角上线性插值，并在{ "360" } deg处回绕；可见集合为el >= max(mask_deg, mask(az))；以及该集合的共钟DOP和ENU与钟差的协因数矩阵（orbit::dop背后的核）。[skyline] 段正是借此在gnss-sim、jamming、leo-pvt、leo-pass和nmea-scenario各类场景中判定可见性，并在orbit和integrity中配合地面站点user_site使用

seg-578d7acd3288 = Orekit { "12.2" }（Apache-2.0）：在WGS-84 OneAxisEllipsoid上用TopocentricFrame计算观测角，并为每张表使用一个ElevationMask，由xval/orekit-skyline/OrekitSkyline.java在已提交的地固系状态上运行（不比较轨道外推）；DOP以及Orekit判定可见的卫星集合的ENU与钟差DOP矩阵，则用gnss_lib_py { "1.0.4" }（wheel元数据为MIT）的get_dop计算。在任一参考基准（oracle）于比较输入上运行之前已预先登记（xval/orekit-skyline/PREREGISTRATION.md，提交e4b9d912）；Orekit带回绕的线性插值事先已在一个合成探测用例上得到确认。范围：表格式遮蔽、大地观测角、遮蔽后的可见集合及其共钟DOP与协因数。此处并未检查：街道峡谷、扇区和地形的归约以及各预设（其360点表作为输入进入；见“Street-canyon, sector and terrain reductions to a table”与“Skyline presets”两行）、各系统的钟状态和误差椭圆（见“Horizontal error ellipse and per-system cofactor from the geometry covariance”一行）、orbit/integrity中user_site地面站点的GMST旋转及其把各外推器归到同一时刻的定时（给Orekit的是地固系状态），以及任何真实遮挡（仅视线）

seg-bbb1828b3db1 = 街道峡谷、扇区和地形归约为表

seg-2864aec7be88 = skyline：街道峡谷的闭式解（截断角atan((h - a) / d)，其中d = (w/2) / abs(sin(az - s))，有限长度时两端开口）、顺时针且带回绕的锐边扇区，以及归约为表的地形点（含曲率下降量d^2/({ "2" } * 4/3 R)）；天际线是它们与任意表的逐点最大值

seg-50f1df206b30 = 内部：闭式解以手工算出的数值核对（给定街道的墙顶高度角、开口端条件、给定点的曲率下降量）。没有外部参考基准：设计说明将这些归约界定为MODELLED，而Orekit的ElevationMask接收的是表，因此“Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask”一行的比较只是把它们的360点表当作输入，并不检查它们

seg-3f3d657854ce = 天际线预设（城市街道、港口进近、峡湾、集装箱码头）

seg-b915c06fa3f1 = skyline::PRESETS：四种具REPRESENTATIVE的几何，各附设计说明给出的尺寸和一行来源说明：city-street（一条峡谷，街道走向{ "0" } deg，{ "30" } m高的两侧墙体相距{ "20" } m，天线高{ "1.5" } m）、harbour-approach（扇区：朝海一侧在{ "180" } deg范围内开阔，码头建筑{ "8" } deg高、跨{ "90" } deg，防波堤{ "3" } deg）、fjord（地形：南北向水道两侧各{ "1.5" } km处有高出天线{ "600" } m的山壁，并计入曲率下降量）、container-terminal（扇区：朝陆一侧的半边为{ "12" } deg高的堆垛，在两个窄扇区内有{ "35" } deg和{ "25" } deg高的起重机吊臂）；可逐字段覆盖

seg-44ae9b6289d9 = 无：这些是选定并已说明的尺寸，不是对任何街道、港口、峡湾或码头的实测（街道的宽高比处于Oke（{ "1988" }）所述0.5-2的范围内；峡湾的量级与挪威西部峡湾相当；堆垛采用ISO { "668" }高箱的高度）。测试依据各预设自身给出的尺寸进行核对，属于转录检查，验证规则不将其计入

seg-2c53381d48ae = 由几何协方差得到的水平误差椭圆与分系统协因数

seg-15fea5c05cbd = geometry::sky_geometry：ENU与钟差的协因数 (H^T H)^-1，接收机钟为共用一个或每个系统各一个（orbit::cofactor_from_los核），以及由其东-北子块得到的水平误差椭圆（半轴k sigma sqrt(lambda)，k = sqrt(-2 ln({ "1" } - p))，长轴方位角自北起算）

seg-1982bafa3466 = numpy { "2.5.4" }（BSD-3-Clause），xval/numpy-ellipse/ellipse.py：在已提交的输入上用numpy.linalg.inv求G^T G的逆，并用numpy.linalg.eigh求其水平子块的特征分解；这是一个独立的数值库，以自身算法完成求逆和特征分解（标准P2）。运行前已在xval/numpy-ellipse/PREREGISTRATION.md（提交0bbeeaee）中预先登记；预先登记之后，驱动程序的输出格式曾更正一次（numpy标量被写成np.float64(...)），协议和容差均未改变。已独立检验的结论是这些输入上的线性代数；高斯误差模型和UERE是已说明的输入，不是实测精度，也不是完好性界

seg-6012113b4836 = 天空几何函数：可见性、DOP、协方差、误差椭圆、蒙特卡罗点云

seg-17352a3aa356 = geometry（sky_geometry、sky_monte_carlo、skyline_presets、skyline_profile、skyplot_svg；命令行<c1/>和<c2/>，同名的Python和WASM函数，MCP <c3/>）：给定站点、时间和星座预设（或以方位角/高度角或ECEF给出的卫星），得出可见及被天际线遮蔽的卫星、GDOP/PDOP/HDOP/VDOP/TDOP、单位方差协因数 (H^T H)^-1和东-北-天坐标下的协方差（每个系统一个接收机钟，或共用一个），水平误差椭圆（半轴k sigma sqrt(lambda)，k = sqrt(-2 ln({ "1" } - p))，自北起的方向角{ "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE)），以及在相互独立的高斯距离误差下n个带随机种子的最小二乘误差及其经验协方差、RMS和{ "95" } % 包含率。协因数即orbit::cofactor_from_los，它是orbit::dop和orbit::dop_cov背后的同一个核（dop是dop_cov的归约）：没有第二套DOP实现

seg-aa0da1028636 = 单钟DOP因子依赖的核，已对照gnss_lib_py { "1.0.4" }做过独立检验（见“GNSS geometry / dilution of precision (DOP)”一行）；本行自身的检查是内部的：sky_geometry在同一几何上复现orbit::dop和dop_cov，椭圆复现解析的2x2特征分解，ECEF与方位角/高度角输入一致，带随机种子的点云RMS和{ "95" } % 包含率与几何一致。每个系统一个钟的ENU协方差和椭圆在“Horizontal error ellipse and per-system cofactor from the geometry covariance”一行中为VALIDATED（numpy，P2）；此处仍为MODELLED的是组合部分：由预设外推得到具代表性的天空、蒙特卡罗点云（对照其所采样的几何检查，属自洽检查）以及各界面。星座预设给出的是具代表性的天空，不是某一日期的天空；高斯误差模型和UERE是已说明的输入，不是实测精度，也不是完好性界

seg-7f66be0f15c8 = 无GNSS条件下的时钟守时（holdover）

seg-4d8f87668a0f = 闭式滑行误差增长 + 守时至阈值；量子时钟类别

seg-2d260626e3d2 = 多步clock_state协方差递推（同一代码库内的交叉核对）；其底层的滑行方差与守时反演核已对照scipy做过外部检验（见“Clock-holdover coast-variance & threshold inversion”）。各类红噪声底守时数值仍为MODELLED

seg-29b482d88916 = 实测时钟器件卡（留出集预测）

seg-8c68c5b25004 = clock_library：器件卡（白相位、白噪声、闪烁和随机游走调频，外加线性频率漂移），在经过留痕的整理处理（去除间隙、相位离群值、相位阶跃、突发；记录频率阶跃）之后，拟合某一条具名实测时钟记录的三分之一，并以滞后1阶识别出的噪声类型自由度加权，再用其预测的阿伦偏差在留出的三分之二上评分；含RINEX和IGS钟差文件、BIPM各实验室文件以及Circular T第{ "1" }节的读取器；把器件卡转换为时隙定时噪声模型、扩展卡尔曼时钟模型和欺骗干扰监测器的噪声水平

seg-af2d78e2986c = 实测记录，已留出：2026-03-01至{ "14" }期间{ "11" }颗GPS Block IIF卫星的IGS最终组合{ "30" } s钟差（此前无任何测试打开过的时间窗口；IGS，开放，须注明出处），以及JammerTest { "2024" }中u-blox ZED-F9P接收机在其不计分的静止时段的数据（GPL-3.0-or-later）。D9外部比较（已预先登记2ec76864，每张卡在其拟合平均时间上的预测/实测阿伦偏差均落在 [1/1.5, { "1.5" }] 之内），一项发现（仍为MODELLED）：{ "11" }张GPS IIF卡中有{ "10" }张达到判据；G27在两小时尺度上偏乐观（{ "7680" } s处为{ "0.662" }，最差倍数{ "1.510" }），这是幂律卡所不含的小时尺度周期性误差。接收机TCXO卡被阻塞：在已记录的发射时段之外，数据集中其余时段只剩{ "167" }个历元，而需要{ "3600" }个。已报告但非盲测（记录已被先前的行打开过）：5071A铯钟卡达到判据（直到{ "4096" } s最差为{ "1.070" }），OCXO卡偏保守且在判据之外（{ "128" } s处为{ "2.348" }；其噪声底在记录期间发生变化），Norcia锶钟卡以已发表的三个最短点拟合，在两个计分点上达到判据（{ "1.291" }、{ "1.405" }）。Galileo被动型氢原子钟（找不到无需登录即可获取的Galileo最终钟差来源）和深空原子钟（仅有一个公开的在轨数值）被阻塞。D9第{ "2" }轮，把ZED-F9P接收机TCXO作为一个模型类别，用{ "12" }个静态Wroclaw站{ "14" }天的数据（Zenodo { "6488497" }，CC BY { "4.0" }；已预先登记fb475550），一项发现：按登记的流程，{ "12" }个站中有{ "11" }个无法评估（RAIM拒绝了大部分无电离层组合历元），BX14失败；公开说明的、使用修正后流程的重跑（已预先登记c9cc0d49）在{ "11" }个盲测站中通过{ "1" }个（BX12，{ "1.412" }；BX07 { "1.532" }和BX13 { "1.542" }仅略超出），原因是来自间断的{ "30" } s文件的单点接收机钟，并不是干净的振荡器记录

seg-5097a0e6460d = 带每圈项的实测GPS Block IIF钟卡（留出集预测）

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic：器件卡带有每圈一次至四次的相位项（周期T/k，T = { "43 082.05" } s），与二次项一起，用最小二乘联合拟合一条实测卫星钟记录的三分之一，各项在预测阿伦偏差中的闭式贡献为{ "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" }

seg-83981cd13a17 = 实测记录，已留出：2026-04-01至{ "14" }期间{ "11" }颗GPS Block IIF卫星的IGS最终组合{ "30" } s钟差（此前无任何测试打开过的时间窗口；IGS，开放，须注明出处）。D9外部比较（已预先登记fb475550，每颗卫星在每个拟合平均时间上的预测/实测阿伦偏差均落在 [1/1.5, { "1.5" }] 之内），一项发现（仍为MODELLED）：{ "11" }张卡中有{ "9" }张达到判据；G03（{ "1.947" }）和G25（{ "1.581" }）在{ "60" } s至{ "2000" } s之间偏乐观，因为它们留出的记录比拟合所用的三分之一噪声更大（G25留出部分有{ "16" }处间隙和{ "29" }个相位离群值），这是时钟本身发生了变化，而不是缺少周期项。从预测中去掉周期项会使全部{ "11" }张卡失败（{ "1.77" }至{ "4.96" }），可见这些项承载着预测

seg-0d72fcc0fbea = 星载时钟状态估计

seg-6db5391f8ebe = 3状态（相位/频率/漂移）Van-Loan卡尔曼时钟，Joseph稳定化

seg-f41b4c81df2a = filterpy { "1.4.5" } KalmanFilter（R. Labbe，MIT），F通过scipy.linalg.expm得到，Q通过Van-Loan { "1978" }分块矩阵得到：这是一个独立的参考实现，复现了kshana完整的滤波器轨迹。跨实现的一致性：时钟物理与阿伦标定未经外部检验，因此仍为MODELLED。{ "0.30" }外部比较，一项发现（仍为MODELLED）：在{ "11" }颗GPS Block IIF卫星的IGS最终{ "30" } s钟差上（2025-08-17至{ "30" }），Q按前半段的ADEV拟合，滤波器在留出的后半段上评分，滤波器的一步预测是一致的（{ "0.906" }至{ "0.971" }的历元落在其{ "95" } % 区间内，判据{ "90" } %），但在一小时处于{ "11" }个钟中的{ "9" }个过度自信（{ "0.486" }至{ "0.829" }），其新息之和在{ "5" }个钟上落在 [{ "2.4" }, { "3.6" }] 之外。拟合所得白相位噪声在每颗卫星上均为零，而小时尺度的误差（周期项、闪烁调频）不在3状态模型之内。{ "0.30" }第{ "2" }轮，一个扩展滤波器（闪烁调频，以及每圈一次和两次的状态），用2025-09-01至{ "14" }的全新留出IGS钟差（已预先登记4b1a841e），一项发现（仍为MODELLED）：一步和一小时一致性判据在全部{ "11" }颗卫星上成立（{ "0.948" }至{ "0.988" }以及{ "0.907" }至{ "0.996" }），但新息之和判据在G24（{ "0.964" }）和G30（{ "1.929" }）上相对 [{ "2.4" }, { "3.6" }] 不成立。D9第{ "3" }轮，沿用第2轮的扩展滤波器，在冻结的clock_library整理检测器之后，调参和判据不变，用2026-04-01至{ "14" }的全新IGS钟差（已预先登记fb475550），一项发现（仍为MODELLED）：（a）一步{ "0.941" }至{ "0.968" }和（c）三倍NIS均值{ "2.641" }至{ "3.549" }在全部{ "11" }颗卫星上成立；（b）一小时在G09（{ "0.894" }）和G26（{ "0.876" }）上相对{ "0.90" }不成立

seg-3f0a9d7c2971 = 时间传递误差预算

seg-216f46b43860 = 双向/TWSTFT（Sagnac）、GNSS共视、PPP；链路抖动→距离

seg-e7b6aac2ec58 = Sagnac量级已对照权威的已发表数值核对：N. Ashby，“Relativity in the GPS”，Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }），式{ "1.29" }：向东绕赤道一周累积{ "207.4" } ns（2ωA_E/c²）；kshana复现为{ "207.386" } ns。RTKLIB { "2.4.3" }的geodist()（Takasu，BSD-2-Clause）也独立印证了这一点，它带有同样的2Aω/c² 几何。BIPM TWSTFT转发器/共视/PPP的组合预算没有外部参考基准，因此该能力仍属由模型计算得出

seg-157fadeb5d67 = 导航信号调制与码跟踪分析

seg-ab633d191396 = BPSK-R/BOC功率谱密度、谱分离系数 κ、Gabor带宽、DLL抖动、多路径

seg-94f0c4fc2930 = GPS C/A Gold码的互相关/自相关与独立的IS-GPS-200码生成完全吻合（整数 ±65/−1/63）；BPSK-R({ "1" })/BOC({ "1,1" }) 的功率谱密度形状与独立的scipy周期图对照。调制/SSC/DLL的闭式解（Betz { "2001" } / Kaplan & Hegarty）仍是解析的，因此该行仍为MODELLED，但码相关这一子结论已得到外部吻合。{ "0.30" }第{ "2" }轮，对照Betz { "2001" }和Hein等{ "2006" }的印刷数值（已预先登记9f4f2ce8，容差为半个印刷单位），一项发现（仍为MODELLED）：表{ "1" }的全部{ "45" }个谱单元、{ "1" } GHz相关值、MBOC干扰数值，以及{ "3" }个图{ "17" }偏移中的{ "2" }个一致；{ "24" } MHz第一旁瓣、BOC({ "8,4" }) 的图{ "17" }偏移以及图18-21中每一项最坏情况多路径偏差（偏低{ "11" }至{ "15" } %）则不一致。Kshana与对该预先登记读法的独立NumPy计算相互一致，所以差距出在这种读法或论文未说明的某个细节上；原因尚未查明

seg-589e0053e3e8 = GPS L1 C/A扩频码生成

seg-782d4da75b59 = G1/G2 LFSR C/A码生成器，复现IS-GPS-200已发表的PRN { "1" }–{ "9" }前10个码片的八进制验证向量（另有1023码片长度、512个值为一的码片的平衡性、三值周期自相关）

seg-473f24d4e06a = IS-GPS-200表3-Ia“Code Phase Assignments”：权威的、属美国政府公有领域的已发表前10个码片八进制验证向量（GPS Directorate，navcen.uscg.gov）；kshana自己的G1/G2 LFSR完全复现了每一个PRN { "1" }–{ "9" }的向量。下游的调制/SSC/DLL闭式解仍属由模型计算得出（另一行）

seg-e6c08e1e6ae3 = 量子惯性传感器性能

seg-d28e1f6a430f = 从第一性原理出发的冷原子干涉仪加速度计（k_eff·T²，QPN）

seg-57fd0a6e5d72 = 已发表的CAI主要论文数值向量（Cheinet { "2008" }传递函数；Peters/Freier灵敏度）：k_eff·T² 完全吻合，散粒噪声ASD是单边下限，在每台已发表仪器的约{ "2" }× 之内（真实器件的技术噪声高于量子下限）。这是一个界定范围，不是相等。{ "0.30" }第{ "2" }轮（已预先登记fcb9ac64），一项发现（仍为MODELLED）：仅含QPN的转动噪声对照实测的Gauguet等{ "2009" }图{ "14" }各点，在三个纳入的点上比值为{ "0.695" }至{ "0.788" }（工作点处为{ "0.751" }），以{ "0.5" }个百分点未达预先登记的{ "30" } % 判据；QPN下限比实测噪声低{ "21" }至{ "31" } %，这符合缺少激光和探测噪声的模型的预期。梯度仪的组合与Janvier等{ "2022" }的QPN模型线吻合（比值{ "1.013" }至{ "1.017" }，Reference）。该实测检验无法分辨sqrt({ "2" }) 的组合误差；只有对比度不等的Janvier线才能做到

seg-4b79d03cecf5 = 量子惯性传感器的条纹模糊/动态范围

seg-deb2850546d5 = Mach–Zehnder条纹模糊动态范围：2π 周期的条纹读出决定了最大无模糊比力a_max=π/(k_eff·T²)，而以分辨单元计的无模糊范围a_max/σ_a=π/σ_Φ 与光学标度因子无关：T² 的灵敏度增益恰好同步地消耗无模糊范围（询问时间以分辨率换范围，单元数则由读出相位噪声固定）

seg-7603ff7a7693 = 干涉仪条纹模型的自洽性：半条纹边缘、2π 周期的混叠结构，以及范围/分辨率之比中标度因子的抵消，都是闭式代数恒等式，对照引擎自身的Mach–Zehnder相位和灵敏度函数核对：这是内部一致性检查，并非外部数据集，因此该行仍为InternalConsistency。MODELLED的理想三脉冲条纹模糊；对无模糊范围没有波前像差或对比度损失的界

seg-d04bf321d4a1 = 量子惯性航位推算的韧性

seg-c4989abb5d40 = 守时期间由偏置 + 标度因子 + VRW + 稳定性衰减合成的位置预算

seg-bfe4085115c1 = 独立的numpy蒙特卡罗SDE积分，对双重积分的白加速度噪声求解（以真正独立的算法检验解析的VRW方差）+ 针对偏置/标度因子项的Groves { "2013" }已发表数值锚定；CAI器件数值量化的是合作方硬件，仍为MODELLED

seg-bc6e733c39b3 = GNSS/INS传感器融合

seg-16514286bb51 = 15状态误差状态EKF，松耦合（已对照NaveGo在真实IMU/GNSS行驶数据上检验）；紧耦合的伪距/多普勒UKF以及钟差与位置耦合滤波器（仅有一致性检查，在已检验的结论之外）

seg-4a9bf6adeb45 = NaveGo v1.4（R. Gonzalez，LGPL-3.0，作为工具在GNU Octave下运行，从不链接）：其松耦合ins_gnss在自带的真实Ekinox IMU/GNSS陆地车辆行驶数据上运行，两种解均对照Ekinox参考轨迹评分。两个滤波器读取同一个{ "20" } Hz float32输入，Kshana的配置由数据集公布的参数机械映射而来。Kshana的水平和垂直位置RMS及其位置新息RMS均在NaveGo的1.2x之内（实测{ "0.912" }、{ "0.940" }和{ "0.861" }），其平均归一化新息至多为{ "1.5" }（实测{ "0.395" }：按数据集所述的GNSS标准差，约有2.5x的信心不足）；容差在比较之前已固定。范围：GNSS在整个行驶过程中以{ "5" } Hz持续存在，因此没有测试中断或滑行，该检查能发现的是严重的滤波器缺陷，而不是精细调参（经杆臂修正的原始定位解会接近垂直方向的判据）；杆臂变换在测试框架中计算。紧耦合UKF以及钟差与位置耦合滤波器仍保留各自的filterpy { "1.4.5" }一致性检查（线性后验精确到{ "2.4e-12" }），并仍在已检验的结论之外

seg-5692c7b936b6 = 无GNSS条件下的压制干扰韧性

seg-f4ff77caa47b = 几何J/S链路预算、抗干扰C/N₀、逐卫星失锁

seg-daf317735edb = 抗干扰C/N₀ 链路预算方程对照独立的numpy重新推导做了交叉核对（与之共用同一个闭式解 → InternalConsistency），并附有真实JammerTest-2024 C/N₀ 下降的特征刻画。{ "0.30" }第{ "2" }轮，被阻塞（仍为MODELLED）：实测的JammerTest { "2024" } C/N0下降对照链路预算预测（已预先登记6a66994b，在{ "3" } dB之内）未能运行，因为Bleik处F8.1天线的位置与指向，以及多频段{ "1.6.4" }斜坡功率中L1所占份额，在测试目录和官方日志中均未记载

seg-ff90679d1de9 = 欺骗干扰（spoofing）检测

seg-b843f63e77e6 = 时钟辅助 χ²、RAIM、AGC、SQM融合的逐历元安全性能指标

seg-baeb1c3db11f = TEXBAT场景参数（Humphreys { "2012" }）：属于特征刻画，不是固定的向量。{ "0.30" }外部比较，一项发现（仍为MODELLED）：在JammerTest { "2024" }（Bleik；GPL-3.0数据）上，观测量级的监测器（时钟辅助卡方、RAIM、解算失败）在{ "8" }个可评估的已公布欺骗干扰起始时刻中，没有一个在{ "10" } s内发出告警（起始前窗口干净时，首次告警出现在公布的时隙开始之后{ "10.2" }至{ "39" } s），并且有三个起始前窗口出现了来自时钟监测器的虚警（{ "81" }、{ "64" }和{ "173" }个历元）。首个可观测的影响是双频GPS跟踪丢失，而不是RAIM不一致。公布的起始时刻是分钟级的计划时隙开始时间；它们先于射频采集，这是一种解释，不是测量。{ "0.30" }第{ "2" }轮，对照组织方官方的JammerTest { "2024" }日志（秒级分辨率；已预先登记6a66994b，使用经Hadamard标定、不带锁存的三状态时钟监测器），一项发现（仍为MODELLED）：在{ "10" }个已记录的起始时刻中，监测器在{ "4" }个上于{ "10" } s内告警；其余六个则晚了{ "18" }至{ "211" } s，或出现起始前的时钟虚警（{ "2.1.4" }处{ "1" }个，{ "2.3.15" }处{ "85" }个）。D9第{ "3" }轮（取自JammerTest设备其他时段的接收机卡，已预先登记2ec76864）被阻塞：训练历元{ "167" }个，而需要{ "3600" }个。D9第{ "4" }轮和4b（噪声水平取自u-blox ZED-F9P模型类别卡，Wroclaw { "2021" }，已预先登记fb475550；4b是采用修正后提取方法的、已公开说明的重跑，c9cc0d49），一项发现（仍为MODELLED）：全部{ "10" }个已记录起始时刻均无起始前虚警，其中{ "10" }个里有{ "6" }个在{ "10" } s内告警；{ "2.1.1" }、{ "2.3.5" }、{ "2.3.10" }和{ "2.6.1" }仍然偏晚（+{ "211" }、+{ "23" }、+{ "18" }、+{ "51" } s），不受时钟噪声水平影响

seg-b10d07921f5e = 欺骗干扰下的授时保护级

seg-2a829711b997 = 最坏情况下未检出时间误差的闭式界 = 监测器下限 + CUSUM检测延迟期间的振荡器滑行 σ，以红噪声底区间的形式给出

seg-682251b2e3c7 = 组合已独立检验的基本单元（allan/holdover van-Loan、安全下限）；以JammerTest { "2024" }场景{ "2.1.1" }标定（实际被牵引的授时偏差约{ "1.01" } ms，而声称的为 ≤{ "51" } ns）。这是建立在已独立检验部分之上的桥接，其本身不是外部检验。{ "0.30" }外部比较，一项发现（仍为MODELLED）：在JammerTest { "2024" }的欺骗干扰场景中，实测的未检出授时偏差在{ "8" }个已检出的起始时刻中有{ "3" }个超过名义TPL：{ "2.1.4" }为{ "184.3" }对{ "34.6" } ns，{ "2.3.5" }为{ "295.7" }对{ "159.3" } ns，{ "2.3.11" }为{ "143.0" }对{ "69.0" } ns；界内的五个中有三个是平凡情形（已锁存的起始前虚警）。可能的原因：来自{ "60" } s标定、漂移噪声为零的滑行项，没有覆盖接收机TCXO在{ "15" }至{ "39" } s内的频率漂游。实测误差是Kshana自己的单点钟差估计相对于对其自身起始前估计拟合的直线，因此即便吻合，也不会是完全独立的。{ "0.30" }第{ "2" }轮，对照官方JammerTest { "2024" }日志的起始时刻和实测的接收机时间误差（已预先登记6a66994b），一项发现（仍为MODELLED）：在{ "10" }个已记录起始时刻中有{ "4" }个，未检出误差超过含漂移状态的TPL（{ "2.1.1" }处为{ "634.7" }对{ "458.5" } ns，{ "2.3.5" }处为{ "232.6" }对{ "16.2" } ns，{ "2.3.10" }处为{ "41.3" }对{ "6.0" } ns，{ "2.6.3" }处为{ "218.6" }对{ "47.4" } ns）

seg-0ec37553bbc4 = 地月空间任务分析

seg-a47465f682ba = CR3BP状态转移矩阵 + 单次打靶微分修正器；L2南向NRHO

seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database（SSD，periodic_orbits.api；地月L2南向halo族，Howell/Davis方法）：外部公布的周期T、Jacobi常数C和垂直穿越初始条件；kshana的单次打靶STM修正器以目录初值为种子并加以扰动，收敛回目录中的成员

seg-f1d49eac89f8 = 替代/补充性PNT

seg-023dda973f66 = 重力图匹配、地形参考（TERCOM/SITAN）、磁异常

seg-da869d48e505 = IGRF-14系数；基于第一性原理的匹配滤波器CRLB。真实重力场基准测试所用的场已经外部核对（见“Gravity-anomaly synthesis from a spherical-harmonic model”一行），但其导航结果没有外部参考基准（oracle）

seg-db7767ab661d = 由球谐模型合成重力异常

seg-2db367c4a473 = 球近似下的重力异常（Barthelmes STR09/02式{ "126" }，ICGEM gravity_anomaly_sa），由完全归一化系数相对于闭式水准椭球（WGS84/GRS80）计算，含零阶项，并网格化供重力图匹配器使用

seg-abcb0965dd2b = ICGEM Calculation Service（GFZ Potsdam），一个独立的实现：截断到{ "70" }阶的EGM2008、gravity_anomaly_sa、WGS84、无潮汐、含零阶项、h = { "0" }。该服务的输出没有明确的许可，因此网格在测试时取得并以固定的SHA-256（tools/fetch_icgem_grid.sh）核对，仅注明出处引用十个数值

seg-31f51d4998cb = 真实地形上的SRTM数字高程读取器

seg-08ea4ae0b671 = 手写的SRTM .hgt解析器（16位大端、先北行、识别空洞）+ 双线性采样器，读取一块真实的公有领域DEM图块，并求得一个已有记载的测量基准

seg-aae487789add = NASA/USGS SRTM v3（1角秒）N36W117图块：美国政府PUBLIC-DOMAIN的高程数据，取自AWS elevation-tiles-prod开放镜像，抽稀到6角秒后提交于tests/fixtures/terrain/ 之下（见NOTICE.md），另有N36W117和N36W119的全分辨率裁切，逐节点与GDAL独立的SRTMHGT读取器核对，并与惠特尼山（{ "4421" } m）和Badwater（−{ "86" } m）的测量基准核对。已有记载的Badwater Basin基准（−{ "86" } m，北美最低点）锚定了地理配准的读取。使用该DEM的地形匹配/TERCOM导航定位仍属由模型计算得出（见另一行Alternative/complementary PNT）

seg-791e7285c291 = 可复现性与软件保证

seg-7177355a482c = 确定性、场景哈希、SBOM + 跨平台golden关卡

seg-6cf9d570cc51 = SBOM与官方CycloneDX { "1.5" } JSON Schema（及有效的SPDX标识符）的一致性：这是一个外部已发布的标准，对整个依赖图零验证错误；FoM确定性/逐字节可复现的部分仍是固定的自洽检查，因此该行仍为MODELLED

seg-89b2114542bb = AI/ML射频损伤检测评估（{ "13494" }）

seg-241f2eeaef12 = 带标注的合成损伤语料库 + 与检测器无关的ROC/AUC/混淆矩阵/Pfa-Pmd测评框架；含泄漏防护、分层划分、分布偏移（域内对域外）的乐观性报告。可作为<c1/>场景类型从命令行/绑定运行（scenarios/impairment-eval.toml）

seg-72a3c97ef04b = 闭式AUC界（Mann–Whitney）+ 完美参考基准（oracle）检测器；语料库为合成（以参数为依据，不是外场/IQ）

seg-c38ebee794b3 = AI/ML射频损伤乐观性差距研究与仅依据域内数据的差距预测器

seg-642087659fda = 对已发表方法和学习型（逻辑回归/单隐层MLP）检测器的域内→域外AUC乐观性差距所做的受控合成研究：每类的标度律趋势（Spearman ρ 及对{ "1" }−严重程度的斜率），以及仅依据域内诊断量估计该差距的岭预测器，按留一检测器法和留一类别法评分。可通过<c1/>复现

seg-c46973920f5b = 手工推导的统计量与闭式解对照（双正态AUC Φ(d'/√{ "2" })、DeLong方差、含同秩处理的Spearman、精确的OLS恢复）+ 对照“预测均值”基线的留一交叉验证。语料库为合成（以参数为依据，绝非外场/IQ），乐观性差距是合成→合成的严重程度偏移，并非仿真到外场的结果

seg-fd6424213d1f = 量子与经典PNT的权衡及无GNSS条件下的韧性（{ "13503" }）

seg-21b2b54200a8 = 实测ADEV摄取（NNLS）、权衡表（授时/惯性守时 + 收益）、韧性随时间的包络；下限的注意事项随制品一并给出。可作为<c1/>场景类型从命令行/绑定运行（scenarios/quantum-trade.toml）

seg-37d11937c966 = 实测ADEV→PSD拟合（NNLS）核与scipy.optimize.nnls吻合（tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs），这是一个独立的外部核；但权衡的数值只是对合作方时钟/CAI的量化（绝不是检验），因此权衡本身仍为MODELLED，没有检验光环

seg-1fa865bfddd1 = 空间天气环境与活动驱动的热层密度

seg-47308f611c7e = 太阳/地磁指数（按定义的Kp↔ap表）、Jacchia-1971外逸层温度，以及Jacchia { "1971" }热层密度（SAO Special Report { "332" }：静态扩散剖面，复现其表{ "7" }，含周日、地磁、半年、季节-纬度和氦的变化），对照静态USSA76大气。可作为<c1/>场景类型从命令行/绑定运行（scenarios/space-weather.toml）

seg-1cad4329e226 = 按定义的Kp↔ap表 + Jacchia-1971外逸层温度闭式解（与已发表的锚点吻合到<{ "1" } K，tests/space_weather_reference.rs）；密度则对照pymsis NRLMSISE-00（独立的NRL模型）做特征刻画：{ "800" } km处的太阳周期变幅为10.4x，而NRLMSISE-00为13.6x。{ "0.30" }修订：经标定的一阶活动因子已被Jacchia { "1971" }取代（默认场景在{ "400" } km处的密度{ "4.176e-12" } -> { "6.929e-12" } kg/m3；移除reference_exospheric_temperature_k，新增mean_exospheric_temperature_k）。{ "0.30" }第{ "2" }轮，实测的TOLEOS CHAMP/GRACE/GRACE-FO加速度计密度（ESA Swarm DISC；已预先登记20eed695），一项发现（仍为MODELLED）：在太阳活动极大期、风暴之外，{ "400" }至{ "500" } km的轨道平均值在{ "2" }倍以内（CHAMP { "2001" } 521/521，GRACE-A { "2002" } 120/120，GRACE-FO { "2024" } 526/547），但Jacchia { "1971" }在{ "2008" }年太阳活动极小期约高估1.7x（GRACE-A在{ "2" }倍以内为412/544），因此该密度未经独立检验

seg-29bedb28c34f = CCSDS OEM互操作性（GMAT/Orekit/STK星历导入）

seg-edb58ffbbb5b = CCSDS { "502.0" } OEM导入器（parse_oem），容许COMMENT行/额外的元数据关键字/协方差块，并且是写出器的精确逆；往返 + 外部文件摄取，带速度一致性检查。可作为<c1/>场景类型从命令行/绑定运行（scenarios/oem-interop.toml）

seg-bc507f96c4df = 独立的第三方CCSDS-502解析器<c1/> { "0.4.5" }（MIT，https://pypi.org/project/oem/）：这是一个独立的代码库，能逐字节一致地解码kshana输出的EME2000/UTC OEM（{ "2" }个夹具共{ "24" }个状态，位置/速度 Δ = { "0" }），其严格读取器也确认了元数据记号；kshana的解析器在一份引入的外部OEM上同样与它一致。两项如实说明的互操作发现（oem库拒绝kshana的每颗卫星多段约定及其多条目协方差行）已记录在测试中，因此这检验的是符合规范的单对象交换，不是kshana每一种变体的完整CCSDS-502一致性

seg-c76b8c395ef0 = 发射窗口与上升段几何（任务分析）

seg-6066c634faba = 二体发射方位角（sin Az = cos i / cos lat）、最小可达倾角、圆轨道速度、地球自转的向东增益、分支（dogleg）转面 Δv和每日发射机会，并且在给定历元与IERS finals2000A行时，给出绕真极的站点速度（launch::site_rotation_speed_at）。可作为<c1/>场景类型从命令行/绑定运行（scenarios/launch-window.toml）

seg-2515ab37f99b = 闭式球面三角发射几何，对照已发表的算例锚点（Vallado，Fundamentals of Astrodynamics第4版，算法{ "37" }发射方位角 + 第6章转面；tests/launch_window_ascent_geometry_reference.rs）。这些算例沿用kshana所实现的同一个闭式解（已发表数值一致/转录检查，InternalConsistency）；MODELLED的二体模型，没有自转地球速度三角形/上升段/阻力损失模型。{ "0.30" }与Orekit { "12.2" }（Apache-2.0）的外部比较，一项发现（仍为MODELLED）：几何在舍入误差范围内一致（由{ "158" }个算例中的入轨方位角回算倾角，最差{ "2.6e-15" } rad；最小倾角、圆轨道速度和分支delta-v到{ "3e-16" }），但地球自转的站点速度在纬度{ "62.9" } deg处未达预先登记的{ "1e-6" }相对误差（{ "1.12e-6" }）。差距按tan(lat) 增长，与Orekit地球坐标系中约{ "5.8e-7" } rad的极移极点偏移一致，而球面的 ω·R·cos(lat) 没有计入这一项。该结论在运行前没有收窄，因此该行不能依据这次比较升级。{ "0.30" }第{ "2" }轮（已预先登记71bebf63）：给定历元和IERS行时，真极站点速度（场景字段site_rotation_speed_true_pole_m_s）在四个经度的{ "24" }个站点上与Orekit吻合到{ "1e-6" }以内（最差{ "4.9e-8" }），但场景默认作为地球自转增益输出的无历元名义速度仍然偏差{ "1.12e-6" }，因此该行仍为MODELLED，待就默认输出作出决定

seg-ff2cd766bb52 = 弹道再入走廊（Allen–Eggers）

seg-c3f3422f96e4 = 指数大气中弹道再入的峰值减速度（与弹道系数无关）、峰值过载处的速度与高度，以及峰值加热速度。可作为<c1/>场景类型从命令行/绑定运行（scenarios/reentry.toml）

seg-121f02d79ae0 = 闭式Allen–Eggers解析再入，另外对照scipy { "1.18" } solve_ivp（DOP853）对同一个仅含阻力的再入ODE做的数值积分核对（tests/ballistic_re_entry_corridor_reference.rs，{ "36" }个算例，最差a_max相对误差{ "2.9e-9" }）：这是数值积分对其自身解析形式的检查，因此仍为InternalConsistency，并非外部检验。MODELLED的弹道再入（无升力），没有气动热/TPS，加热输出是速度，不是热流密度。{ "0.30" }外部比较，一项发现（仍为MODELLED）：对照Stardust SRC再入重建（Desai和Qualls，NASA NTRS { "20080008567" }），所印惯性系再入状态（{ "12.9" } km/s，-8.2 deg，H { "7200" } m）下Allen–Eggers的峰值减速度为{ "61.8" } g，而最佳估计轨迹为{ "32.89" } g，高出 +{ "88" } %，而容差为{ "15" } %：恒定飞行路径角、无重力的解，使浅角度、超逃逸速度再入的峰值约增至两倍。Stardust没有携带加速度计，因此该重建是一种轨迹估计。{ "0.30" }第{ "2" }轮，被阻塞（仍为MODELLED）：积分的平面质点解（reentry::simulate_planar_entry，US76，平方反比重力，曲率）与Stardust和Genesis的最佳估计轨迹在{ "15" } % 之内吻合（+{ "11.3" } %、+{ "5.6" } %），但这些最大值是机构的仿真输出，不是测量，因此这只是交叉核对。加速度计比较（已预先登记a94a283d）因缺少可读的Hayabusa2 REMM分析副本（doi 10.57350/jesa.16）而被阻塞

seg-8c10b50407d3 = 对地观测载荷的足迹与覆盖几何

seg-45c1e799c87c = SMAD空间三角形几何：地球角半径、幅宽、星下点GSD、最大离天底接入角和圆轨道周期，加上一阶J2交点周期（eo_payload::j2_nodal_period）和赤道星下点轨迹间距R_e (omega_E - dOmega/dt) T_nodal（eo_payload::ground_track_spacing_equator_j2）以及连续覆盖标志，输入为轨道高度、倾角和传感器FOV/IFOV。可作为<c1/>场景类型从命令行/绑定运行（scenarios/eo-coverage.toml）；其默认倾角是eo_payload::sun_synchronous_inclination给出的太阳同步倾角，这是一个便利性默认值，不属于已独立检验的结论

seg-42411e7c37c9 = Orekit { "12.2" }（Apache-2.0）和GeographicLib { "2.1" }（MIT），均作为独立程序运行，在引擎改动和任何参考基准（oracle）运行之前已预先登记（766823f3）：球面量在相对{ "1e-9" }之内（最差：角半径{ "5.4e-16" }，幅宽{ "7.0e-13" }，接入角{ "1.9e-14" }），周期{ "1e-12" }（{ "1.6e-16" }），星下点GSD { "1e-7" }（{ "2.9e-10" }），J2交点周期和交点间距与带交点检测器的Orekit数值J2外推相差在{ "0.1" } % 之内（{ "1.2e-5" }和{ "6.7e-5" }），连续标志完全一致（168/168），对照WGS-84椭球，临边在{ "0.3" } deg之内（{ "0.186" } deg），最大地面距离在{ "0.5" } % 之内（{ "3.2e-3" }）。去掉交点退行项会使{ "42" }个交点中的{ "35" }个失败。MODELLED的范围：球形地球的足迹；没有辐射测量、MTF、大气、抖动或耀光；太阳同步默认倾角未做比较。此前的Skyfield/SGP4交叉核对作为回归保留。{ "0.30" }修订：间距现在计入J2交点退行（默认场景{ "2756.37" } -> { "2752.17" } km）

seg-940692c550f3 = CCSDS Space Packet（{ "133.0" }）TM/TC成帧

seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet主头的编码/解码（版本/类型/次级头标志/APID/序列标志/计数/数据长度）+ 一个成帧场景。可作为<c1/>场景类型从命令行/绑定运行（scenarios/space-packet.toml）

seg-6bec79623cc8 = spacepackets { "0.32.0" }（us-irs/spacepackets-py，R. Mueller，Apache-2.0）：CCSDS 133.0-B-2的独立第三方实现；kshana的encode_packet/decode_packet与之逐字节吻合（{ "33" }个算例的6八位组主头 + { "12" }个算例的完整编码包）

seg-5510c82f671a = CCSDS Space Packet次级头、包差错控制与分段

seg-7503bf761df9 = 主头之外的CCSDS 133.0-B-2 Space Packet扩展：携带CCSDS 301.0-B时间码（CUC或CDS，显式或隐式P字段）和辅助数据的次级头、CRC-16包差错控制字段、大型用户数据单元的分段及其重组、带序列间隙和顺序检查的流解码，以及PUS-TM包。主头输出与此前逐字节相同

seg-4123d600477a = 在任何比较之前已预先登记（003ef3eb）；四个独立实现，均非GPL，无任何内置：ccsdspy { "2.0.1" }（BSD-3-Clause）解码{ "5" }个流中的{ "34" }个Kshana写出的包（主头、P字段、粗时间和细时间、CDS字段、辅助数据、用户数据、PEC），并由其用户数据重建两个1000八位组的分段单元，不一致为{ "0" }处，它还标出了Kshana所拒绝的丢包流和乱序流；{ "8" }条报文和{ "57" }个PEC字段的CRC与CPython binascii.crc_hqx和spacepackets-rs { "0.18.0" }相等（校验值0x29B1）；{ "66" }个CUC和CDS时间码算例的写入与读取与spacepackets-rs { "0.18.0" }逐八位组相等（其中{ "3" }个CDS算例也与spacepackets-py { "0.32.0" }相等）；{ "4" }个spacepackets-py { "0.32.0" }的PusTm包与Kshana的逐字节相同。未覆盖：机构历元的时间码（{ "7" }个算例仅依靠单元测试）、TC传送帧以及包以下的任何链路层

seg-af843a3a830a = <s1>space_packet（TimeCode、SecondaryHeader、包差错控制、分段与重组、流解码）</s1>

seg-7c61da52b8f8 = SPICE SPK导出（类型{ "9" }和{ "13" }）

seg-582ce23522f6 = NAIF SPICE SPK内核的写出器和读取器，类型为{ "9" }（Lagrange，不等时间步长）和{ "13" }（Hermite，不等时间步长），含DAF布局、段描述符和历元目录，并可将CCSDS OEM导出为SPK内核（UTC或TDB历元转换为星历时）

seg-194c37ac787f = 通过spiceypy { "8.3.0" }使用的CSPICE N0067，闰秒内核naif0012.tls，在SPICE读取任何Kshana内核之前已预先登记（5059fd2a）：SPICE对Kshana四个内核的清单完全吻合；spkpvn和spkgeo在{ "5 516" }个历元和{ "690" }次链式求值上与Kshana自己的求值逐位相等，并在每个节点上都落在判据之内（最差为判据的{ "0.022" }）；Kshana读取SPICE写出的内核逐位一致；对相同输入，Kshana的内核与SPICE的逐字节相同（四个文件中不同字节为{ "0" }）；OEM历元转换为星历时，与str2et相差在{ "6.0e-8" } s之内（判据{ "1e-6" } s），SPICE对OEM导出的求值落在判据之内（最差{ "0.060" }）。合成的开普勒弧段：不涉及物理精度。其他SPK类型不写出

seg-d699104fc2af = SPICE SPK类型{ "3" }和{ "21" }（Chebyshev，扩展差分线）

seg-7d3e8b5b40af = NAIF SPICE SPK类型{ "3" }（对位置和速度在固定区间上的Chebyshev多项式，阶数{ "0" }至{ "27" }）和类型{ "21" }（扩展修正差分数组，即JPL积分器的差分线，MAXDIM { "15" }至{ "25" }）段的写出器和读取器，由给定的记录出发，写入同时含类型{ "9" }和{ "13" }段的文件；记录选取和求值按SPICE读取器的顺序进行。Kshana不拟合Chebyshev系数，也不生成差分线

seg-40323a2adce1 = 通过spiceypy { "8.3.0" }使用的CSPICE N0067（spkw03、spkw13，以及由同一库按其f2c符号提供的spkw21；spkpvn、spkgeo），在代码存在之前已预先登记（e1cf80d8），合成记录取自该提交的SHA-1：对于三个文件（类型{ "3" }，阶数{ "0" }、{ "12" }和{ "27" }，含{ "3" }至{ "150" }条记录；类型{ "21" }，MAXDIM { "15" }、{ "20" }和{ "25" }，含{ "1" }至{ "250" }条线，零至两个目录项和一条中心链；类型{ "3" }、{ "21" }和{ "13" }同在一个带注释的文件中），SPICE对Kshana内核的清单完全吻合，Kshana的内核与SPICE由同样记录写出的内核逐字节相同，并且spkpvn和spkgeo在Kshana的文件和SPICE的文件上都与Kshana的读取器逐位相等（每个方向{ "48 876" }个分量，判据为相对{ "1e-12" }）。合成记录：不涉及物理精度；真实的JPL生成的类型{ "21" }内核不在算例集之内

seg-39517faae95c = CCSDS姿态数据报文（AEM、APM）

seg-f88f6ea002c8 = CCSDS 504.0-B-2姿态数据报文的写出器和读取器，支持KVN和NDM/XML：AEM版本{ "2.0" }（以及KVN下的{ "1.0" }，含其ATTITUDE_DIR、QUATERNION_TYPE和数值旋转序列），含四元数、欧拉角和自旋姿态类型及其导数、角速度和章动变体，可有多个段；APM版本{ "2.0" }，含四元数、欧拉、角速度、自旋、惯量和机动块；记录的A到B四元数（504.0-B-2附录F）

seg-8853058de1f3 = Orekit { "13.1.8" }（Apache-2.0）的解析器和写出器，作为独立程序运行（xval/adm-orekit），在任何比较之前已预先登记（7a6a05fe）：Orekit解析Kshana写出的每一条报文（{ "14" }条AEM KVN、{ "11" }条AEM XML、{ "4" }条APM KVN、{ "4" }条APM XML），每个值都落在各自的判据之内（四元数{ "1e-14" }，角度{ "1e-9" } deg；最差为判据的{ "0.054" }）；Kshana解析Orekit由相同输入写出的{ "31" }条报文，均落在各判据之内；{ "135" }条四元数、欧拉和自旋记录的旋转，各自与AemSegment.getAngularCoordinates相等，差在{ "1e-12" }之内（最差为判据的{ "0.0071" }）。Kshana的全部{ "15" }条XML报文都通过NDM/XML { "4.0.0" } schema的验证（数据门控，以固定的SHA-256取得）。发现：Orekit的APM写出器拒绝不带MAN_DELTA_MASS的机动（该字段在标准中是可选的），因此APM机动仅在Kshana写出的方向上得到覆盖。算例集之外：AEM { "1.0" } */RATE类型和XML、重复的APM块

seg-5f26f879037e = CCSDS轨道数据报文（OPM、OMM、OCM）

seg-eaddfd311fea = CCSDS 502.0-B-3轨道数据报文的写出器和读取器，支持KVN和NDM/XML：OPM { "3.0" }和{ "2.0" }（状态矢量、密切开普勒根数、航天器参数、协方差、机动、用户定义参数），OMM { "3.0" }和{ "2.0" }（以平均运动或半长轴给出的平均根数、含BSTAR或BTERM及AGOM的TLE相关参数、协方差），以及OCM { "3.0" }，含轨迹（CARTP、CARTPV、CARTPVA；绝对或相对历元）、物理属性、协方差（LTM顺序的CARTP、CARTPV）、机动和用户定义块；以及由SGP4根数集生成的全精度OMM，与保持不变的OmmFile::to_omm_kvn并存

seg-d4c7896b5963 = Orekit { "13.1.8" }（Apache-2.0）的OPM、OMM和OCM解析器和写出器，作为独立程序运行（xval/odm-orekit），在任何比较之前已预先登记（cc6841da）：Kshana写出的{ "30" }条报文中有{ "27" }条（KVN下{ "6" }个OPM、{ "5" }个OMM和{ "5" }个OCM算例，以及版本{ "3.0" }的XML）能在Orekit中解析，每个值的相对误差在{ "1e-14" }之内，每个历元在{ "1e-9" } s之内（{ "904" }个值，最差为判据的{ "0.021" }），并且Kshana读取Orekit写回的全部{ "25" }条报文，落在同样的判据之内（{ "858" }个值，最差{ "0.020" }）；Kshana的全部{ "14" }条XML报文都通过NDM/XML { "4.0.0" } schema的验证（数据门控）。发现，已固定，用来收窄结论：Orekit要求ELEMENT_SET_NO（在502.0-B-3中是可选的），拒绝XML用户定义参数中的COMMENT（schema允许），不会在没有BSTAR时写出BTERM（因此BTERM和AGOM仅在Kshana写出的方向上得到覆盖），并且把OCM相对历元按SI秒相加，所以在TDB下与TDB日历读数相差约{ "1.9e-10" } s/s（UTC、TAI和TT一致）。旧版OmmFile::to_omm_kvn的输出把OMM元数据包在META_START/META_STOP中，被Orekit拒绝（已记录）。范围之外：OCM的PERT和OD块、非笛卡尔的根数集、其他协方差排列顺序

seg-69fbe488dec5 = Fisher信息与Cramér–Rao可观测性

seg-043d4c7a2d6a = Fisher信息M=HᵀWH、Cramér–Rao下界、可观测性秩／基准亏损零空间（Moore–Penrose伪逆），以及由对称Jacobi特征值求解器得出的D/A/E/T最优实验设计标量

seg-4035d9a23e64 = NumPy { "2.4.1" }（numpy.linalg.eigh / .inv；BSD-3-Clause，基于LAPACK）——一个独立的第三方参照，用与Kshana的循环Jacobi扫描和谱伪逆不同的算法（LAPACK分治法加LU分解）计算同样唯一确定的特征值、σ²(XᵀX)⁻¹ Cramér–Rao协方差和GNSS精度因子；两者吻合到{ "1e-9" }。同一类外部库已经对DOP引擎（对照gnss_lib_py）以及χ²/erf核（对照SciPy）做了独立外部核对。另外还与Kay（{ "1993" }）闭式CRLB及蒙特卡罗CRLB达成情况（内部）做了交叉核对

seg-e4ec41d0f5e1 = 月面绝对测站可观测性（基准亏损）

seg-b3e4160042d2 = 联合月面解算的Fisher信息可观测性：没有地球基线时，绝对坐标系基准位于HᵀWH的零空间中（测站位置不可观测）；≥{ "3" }条基线可恢复满秩，并约束测站的Cramér–Rao误差，估计器可达到该误差

seg-238597f6aa01 = 解析的基准亏损结构——不可观测的绝对坐标系模态位于Fisher信息的零空间中（闭式），秩阈值与已发表的3测站设计依据相符，估计器在蒙特卡罗中达到由此得出的CRLB。月面几何本身是一个有代表性的网络（不是已飞行的星历），因此该行保持MODELLED；底层的FIM/CRLB引擎另行对照Kay（{ "1993" }）闭式结果做了核对。{ "0.30" }第{ "2" }轮（预先登记fab02df9），受阻（保持MODELLED）：NumPy/SciPy在所述{ "1e-9" }阈值下重新计算了秩和亏损、测站坐标轴在零空间中所占份额（吻合到{ "8.4e-10" }）以及测站CRLB（吻合到{ "1.2e-10" }），所用为{ "17" }个已提交的Kshana生成配置（P2）。未予提升：估计器达到该下界这一论断（蒙特卡罗效率约{ "0.98" }）没有参考基准（oracle），而使其保持MODELLED的范围界定正等待所有者作出决定

seg-ae4b71d54dfa = 由点网络得出的7参数Helmert基准拟合与ICRF定向联结

seg-9e434924b34c = 独立的闭式加权Umeyama（Horn）相似变换求解器（基于numpy/scipy的SVD；Umeyama { "1991" } IEEE TPAMI，Horn { "1987" } JOSA A）——与kshana的迭代Gauss–Newton拟合算法不同，在逐字节相同的点网络上得到同一个唯一确定的加权最小二乘最优解

seg-4bcec6e2dd9f = 月球导航服务体积

seg-dba98ad5df1c = Moonlight类月球DOP／覆盖／可用性，以及服务体积上的广义月球ARAIM保护级

seg-7e981d90a806 = 独立的第三方参照ANISE { "0.10.2" } astro::Orbit Keplerian传播器（Nyx Space，MPL-2.0）——一条与kshana的Newton-Raphson Kepler解法不同的春分点两体代码路径；每颗卫星的MCI位置吻合到<{ "1e-3" } m，导出的可见卫星数量和集合在每个网格点上完全一致。DOP核已对照gnss_lib_py核对；完好性使用已发表的LunaNet/LCNS参数

seg-2ed7181c97dd = LunaNet AFS扩频码生成（LSIS V1.0）

seg-13ff6c381275 = LSIS V1.0（{ "2025" }年一月{ "29" }日）的Augmented Forward Signal码：AFS-Q的10230码片主码，由IS-GPS-800 L1C导频构造方法结合IS-GPS-800J索引生成（与LSIS附录D所列的{ "210" }个分配相同）；AFS-I的2046码片Gold码，由g1 = x^{ "11" } + x^{ "2" } + { "1" }与g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }生成，各PRN的G2延迟取自标准的附件{ "3" }文件；四组副码、1500码片的三级码、临时的表{ "11" }节点分配以及分级导频码。LSIS内容在运行时从经SHA-256校验的本地缓存读取，该缓存取自NASA托管的PDF，从不再分发

seg-dc1dd144b107 = 参照：LSIS V1.0为核对而印出的数值（表C-1至C-5、D-1至D-6、E-1至E-6）及其附件{ "3" }电子码文件，依据在比较之前确定的零失配判据。该判据被一个印出的单元格未达到，而该单元格与标准自身的附件{ "3" }文件在内部不一致，因此该行保持MODELLED；勘误说明已起草。同样的码片也等于LANS-AFS-SIM的码片（行“LunaNet AFS基带渲染对照独立生成器，给定其信道状态”）

seg-ea20909686ea = LunaNet AFS基带渲染对照独立生成器，给定其信道状态（LSIS V1.0）

seg-c0f021c38842 = AFS基带的渲染核心（LSIS-130：复包络I + jQ，I = AFS-I Gold码乘以{ "1.023" } Mchip/s下的{ "500" }符号/秒帧，Q = {"5.115"} Mchip/s下的分级AFS-Q导频，载波旋转，码片与符号对齐），在由该生成器自己记录的信道状态（码相位与速率、载波相位与频率、每通道幅度）驱动时，可复现独立生成器的采样。不涵盖：由多普勒、延迟和载噪比推导该状态的节点模型、由载噪比计算得出的50/50功率分配（幅度取自模拟器），以及SigMF元数据和8位采样写入

seg-dd1142957a05 = 库：LANS-AFS-SIM（T. Ebinuma，BSD-2-Clause，提交480c6bf353717bafc04b5ee5bafb38ed90e61aae，S波段构建，作为单独程序运行）；Kshana的采样仅由模拟器记录的信道状态驱动，且仅打印跟踪记录的构建经核对与未打补丁的构建逐字节相同。运行之前确定的判据：码片和符号零失配，整个运行中|rho| >= { "0.999" }，每个{ "2" } ms块中 >= { "0.99" }，相位在{ "0.05" } rad以内。相等的I和Q幅度是比较的输入，因此功率分配不在此项测试之列。LANS-AFS-SIM从LSIS附件{ "3" }文件读取其三级码，因此该部分并不独立于码行。LANS-AFS-SIM与PocketSDR-AFS出自同一作者，算作一个独立实现。受数据限制：LANS-AFS-SIM的比较需要本地LSIS V1.0缓存（xval/lunar-afs/fetch_lsis.sh，经SHA-256校验），没有该缓存时会跳过并给出提示

seg-5d79da539912 = LunaNet AFS帧信道编码，FID { "0" }（LSIS V1.0）

seg-6ed2b4c792e6 = LSIS V1.0的{ "12" } s、6000符号的FID { "0" }帧：68符号同步图样，BCH（{ "51" }，{ "8" }）子帧{ "1" }（八进制763生成器），子帧2-4上的CRC-24（（{ "1" } + X）·P(X)），使用所印出的A、B^-1、C、D的1/2码率LDPC编码（LSIS附件{ "1" }，运行时从经SHA-256校验的本地缓存读取）及标准的打孔，{ "60" } x { "98" }块交织器；一个会标记超出{ "0" }..99的TOI的穷举子帧1译码器，以及仅依据H = [[A, B, { "0" }], [C, D, I]]编写的归一化min-sum LDPC译码器

seg-46879e2e8ab5 = 库：LANS-AFS-SIM（T. Ebinuma，BSD-2-Clause，提交480c6bf353717bafc04b5ee5bafb38ed90e61aae），其自带的BCH、CRC、LDPC和交织器对相同内容产生的帧与Kshana的逐符号相同（零失配，判据在运行之前确定）。另有参考值佐证：LSIS V1.0图{ "8" }的BCH算例和CRC-24/LTE-A校验值（Greg Cook的参数化CRC算法目录），均逐位精确；以及PocketSDR-AFS在三次运行中对其同步到的帧的每个子帧译码，CRC通过且子帧2的比特一致。奇偶校验测试近乎内部恒等式（它确认所印出的B^-1是所印出的B的逆），不计作参考基准（oracle）。受数据限制：LANS-AFS-SIM的比较需要本地LSIS V1.0缓存（xval/lunar-afs/fetch_lsis.sh，经SHA-256校验），没有该缓存时会跳过并给出提示

seg-56c7aeac59c1 = 由独立接收机对LunaNet AFS闭环可译码性的检验（LSIS V1.0）

seg-da2d29d437b0 = 一份Kshana AFS记录由独立的软件接收机捕获、跟踪并译码，并与该记录自身的真值标签比较。这仅证明与标准的一致性以及标签的一致性；它不是关于信道物理、传播、接收功率或链路预算的声明，这些在记录中的值都是选定的输入

seg-8211583afc64 = 库：PocketSDR-AFS（T. Ebinuma基于T. Takasu的PocketSDR { "0.13" }，BSD-2-Clause，提交5b23809f30d68518b7fad7a564fd0fac57cc497d，S波段构建，仅打印的日志级别副本），判据在每次运行之前确定。第三次预先登记的比较完全达到其译码与跟踪判据C1和C2，但未按所写达到其防护条件G0（未经修改的接收机的两次运行在相同的四条捕获记录上不同），第二次则有{ "5" }处违反而未达到，因此该行保持MODELLED。LANS-AFS-SIM与PocketSDR-AFS出自同一作者，算作一个独立实现；帧编码行的印出向量核对用于防范共同的误读

seg-780369fb9a54 = GPS L1 C/A跨生成器一致性

seg-ee47b60515f1 = GPS L1 C/A扩频码（sdr::CaCode）和LNAV子帧1-3（gps_lnav：按IS-GPS-200规范以规范的pi值进行字段量化，二进制补码打包，TLM与HOW字，带D29*/D30*翻转的表20-XIV奇偶校验，字{ "2" }和{ "10" }的奇偶求解位），与gps-sdr-sim在其自带的brdc0010.22n（{ "32" }颗卫星）上逐位比较

seg-39b0d6a58d29 = gps-sdr-sim（MIT，提交28ca29a6，通过已提交的测试装置作为单独程序运行），预先登记f88f2969，对（A）C/A码片、（B）每个计算的LNAV字段、（C）每个奇偶位采用逐位精确的判据。发现：（A）{ "32 736" }个码片中有{ "0" }个不同，（C）{ "1 920" }个字中有{ "0" }个字的奇偶不同，（B）{ "1 152" }个计算字段中有{ "230" }个相差一个单位：gps-sdr-sim的eph2sbf用C强制转换向零截断，而广播整数需要四舍五入（每个不同的值都在Kshana四舍五入整数的{ "0.01" }个单位以内）。保持MODELLED：登记的判据是各项的合取

seg-325900ed59ea = GNSS IQ场景信号几何对照独立基带生成器

seg-ee5625b30ff2 = IQ场景生成器对GPS L1 C/A广播星历场景的逐卫星真值（iq::scene：由广播星历SatGeometry生成的TruthRecord真值记录）：哪些卫星在地平线之上、伪距、第一个采样处的码相位、载波多普勒和视角，针对静止接收机，与gps-sdr-sim在相同星历、接收机和起始时间下（双方均关闭电离层）构建其自身I/Q输出第一个块所用的信道状态比较

seg-59c06411d647 = gps-sdr-sim（T. Ebinuma，MIT，提交28ca29a6），一个独立的GPS L1 C/A基带生成器，用其自带Makefile构建，作为单独程序在其自带的brdc0010.22n上于其使用说明文本的示例位置运行（scripts/gen_iq_gpssdrsim_ref.sh）；一个与同一构建链接的已提交测试装置会打印该程序第一个块背后的信道状态（computeRange、computeCodePhase）。判据在运行生成器之前确定（预先登记7777da53）。范围：静止接收机在无电离层、对流层或接收机钟的情况下的GPS L1 C/A几何；场景的信道模型、噪声和导航数据内容不属于该行

seg-bf429c8f00fb = 独立生成的I/Q采样上的GNSS IQ捕获

seg-9a0c52bfb06e = iq::acq::acquire（采用平方律Marcum-Q阈值的FFT并行码相位搜索）配合GpsL1Ca复制码，作用于gps-sdr-sim自身8位I/Q输出的{ "20" } ms（由iq::io采样译码器译码，ci8，{ "2.6" } MHz，{ "11" }颗卫星，无噪声）：PRN { "1" }至{ "32" }的每个都在两个{ "10" } ms窗口中搜索，结果与gps-sdr-sim调制的码相位和多普勒比较

seg-fb96290003e1 = gps-sdr-sim（MIT，提交28ca29a6）的I/Q采样及其自身的信道状态，预先登记7777da53：（B1）每个模拟的PRN都被捕获，（B2）没有其他PRN被捕获，（B3）码相位在{ "0.5" }码片以内，（B4）多普勒在{ "125" } Hz以内。发现：B1、B3和B4在两个窗口中均成立（最差{ "0.195" }码片、{ "72" } Hz），但B2不成立：gps-sdr-sim未模拟的全部{ "21" }个PRN也越过了阈值（统计量{ "151" }至{ "206" }，阈值为{ "79.5" }；模拟的PRN为{ "1 300" }及以上）。阈值是按所测采样功率的高斯噪声设定的；gps-sdr-sim不加噪声，因此缺席PRN的单元中含有其他卫星的互相关。保持MODELLED：登记的判据是各项的合取

seg-f40dc3dac990 = 在实验室回放测评活动中评分的IQ监测器：检测、漏检、虚警和闭式虚警数值

seg-93fb3109728c = iq::campaign::detect与测评活动运行器：可选的[monitors]表使IQ监测器在运行器的单次遍历中对每个单元运行。功率和频谱监测器看到每条前端链之后的采样；C/N0、SQM和锁定监测器看到每个被跟踪通道的环路更新。每个告警都针对所述事件评分：按（事件，告警类型，通道）判定检测到或漏检，检测时间，以及事件之外的虚警及其暴露时间。每项测试的闭式虚警数值均已给出：每块功率（精确Gamma尾部）、每块频谱超额（近似）、峰度（单侧高斯）、脉冲（二项式上限）、每次平均更新的SQM（2Q(k) = Q(1/2, k^2/2)，新增）以及C/N0 CUSUM的ARL0（Siegmund）。没有该表时，单元、键和摘要均不变。不合成任何干扰波形

seg-4c4fff313585 = 监测器自身的闭式结果，作用于Kshana自己的GPS L1 C/A场景（噪声与合法信号；卫星自身信号的衰减事件），判据在docs/design/MONITORS-IN-CAMPAIGN.md中预先登记（382ab2f4）。发现：M1、M2和M4达到判据。M3在检测上达到判据（{ "18" }次衰减中有{ "18" }次，P_md { "0" }），而在其时间条款上为NOT MET：检测时间中位数为{ "1.001" } s，对比{ "2" } x ARL1个采样 = { "0.433" } s。CUSUM每{ "1" } s窗口只看到一个估计值，因此采样数上界低于一个采样。仅为内部一致性：未核对任何真实接收机或记录的干扰

seg-5b7eb7ddb474 = 来自评分的实验室回放测评活动的IQ监测器检测ROC

seg-57fe85965c9c = iq::campaign::detect（windows、roc）和iq::campaign::report::rocs：带监测器的测评活动的每个单元，针对每种告警类型和通道，保留监测器自身检验统计量在每个所述事件窗口上的最大值（正例）以及在事件之外平铺的roc_window_s窗口上的最大值（负例）。这些统计量为块功率偏离、PSD超额、峰度z、平均指标的SQM |z|以及C/N0 CUSUM。报告按类型汇集它们，得到带AUC的经验窗口级ROC以及在所配置阈值处的工作点，写入roc.json（kshana.campaign-roc/1）和report.html的检测ROC一节。没有监测器的测评活动两者都不写入

seg-e882dd678998 = 来自Kshana自己GPS L1 C/A场景（卫星自身信号的衰减）的合成测评活动，判据在docs/design/DETECTION-ROC.md中预先登记（b47e358d）。发现：R2达到判据（无可检测对象时处于随机水平）。R1 NOT MET：cn0_drop的AUC为{ "0.7855" }，对比{ "0.95" }，原因是事件之后的每个负例窗口都继承了检测时CUSUM的衰减（全部{ "18" }个事件后负例都达到{ "81" }或更高；全部{ "18" }个事件前负例都保持在{ "0" }）。仅为内部一致性：未核对任何真实接收机或记录的干扰

seg-3a3cfa322f01 = 依据IQ测评活动结果标定开放接收机的C/N0和锁定模型，并给出预测误差

seg-9affed6218d6 = iq::labfit（campaign、cn0、iqfit、iqreport）以及<c1/>（位于<c2/>）、Python <c3/>和MCP labfit工具（仅限其工作目录内的测评活动文件夹）：按DIGEST读取<c4/>输出文件夹，并将评分后的单元分组为拟合单元（信号x环路设计x前端链x干扰源类型，绝不合并）。对每个单元，用频谱分离形式将测得的C/N0对所述J/S拟合。没有对干扰和信号功率的独立测量，就无法从C/N0数据中辨识Q_eff，因此Q是给定的，绝不拟合（类型表、事件的q，或对未知类型取最具破坏性的给定值，cw Q = { "1" }）。被拟合的参数是可辨识的偏移delta_eff = delta - { "10" } log10 Q，并由相关性防护报告其简并。锁定率低于{ "90" } %的C/N0分箱被截尾并列出。阈值J/S既直接给出，也由闭式给出；跟踪环路模型与经验锁定模型通过C/N0模型耦合，并带有失锁与重锁驻留时间。对记录做带种子的聚类自助法（{ "1000" }次重复）给出百分位区间；{ "90" } %预测区间来自残差抽样；留一记录保留集分为内插与外推；预先登记的[validation]表被哈希，每个判据判定为PASS/FAIL。报告kshana.labfit-iq/1以JSON、CSV和生成的Markdown给出，并带一个units块。仅为合成数据（无第三方记录，无干扰波形）。接收机日志的labfit路径不变

seg-f9abecb1eea6 = 在Kshana自己的GPS L1 C/A场景上做合成参数恢复，场景中施加按第{ "3.1" }节公式得到的已知C/N0剖面，由kshana iq campaign跟踪并评分，判据在docs/design/LABFIT-FROM-IQ.md（第{ "5.1" }节，2026-10-12在b7117bf中修订，第{ "13" }节）中预先登记。测评活动的C/N0估计器（M2M4）在5b13e3c2中固定，在首次判据评估之前推送（与拟合代码一同提交，而非单独提交），此前有一次已披露的诊断性跟踪运行。对18事件判据测评活动的发现：（c）PASS；（a'）NOT MET，delta_eff误差为-1.097 dB，对比{ "0.5" } dB（在{ "38" } dB-Hz及以上的分箱上仍为-0.89 dB）；（b'）NOT MET，{ "50" }个测评活动中有{ "0" }个覆盖真值（误差-1.189 +/- { "0.093" } dB，区间约{ "0.3" } dB）；（d）NOT MET，闭式值在失锁时比直接J/S低{ "2.20" } dB，约等于拟合的失锁驻留时间乘以斜坡速率（{ "2.09" } dB）；（a）和（b）原有的Q条款为NOT MET，因为Q不可辨识。后续（判据在1e532f84中预先登记，docs/design/evidence/labfit-followup/RESULTS.md）：在阶跃J/S测评活动上，delta_eff恢复到+{ "0.185" } dB以内（S1 MET：斜坡误差是估计器滞后）；（d）按所写在其上由跟踪环路模型达到判据（{ "0.45" } dB），经验模型则未达到（{ "6.42" } dB），因此S2为NOT MET；在新的斜坡测评活动上，用拟合的失锁驻留时间加上每个事件的斜坡速率，（d）对两种模型均在{ "1" } dB以内（R1 MET），而（a'）和（d）按所写再次未达到（-1.25 dB；{ "2.32" }和{ "9.47" } dB）。被检验的是方法，而不是任何接收机：它不能从合成数据得到VALIDATED

seg-9537d301c95e = 由独立接收机库对GPS LNAV编码的译码

seg-909415621881 = Kshana的LNAV子帧1-3（gps_lnav::encode_subframes），针对{ "32" }个brdc0010.22n星历，输入RTKLIB的decode_word和decode_frame：每个字的奇偶校验、数据期号一致的子帧译码，以及每个译码参数对照Kshana的整数和输入值

seg-9b21219e9572 = RTKLIB v2.4.2-p13（BSD-2-Clause，提交71db0ffa）的decode_word/decode_frame作为单独程序，预先登记ca5f0142：R1奇偶与译码，R2译码值等于Kshana的整数乘以IS-GPS-200比例因子，相对误差在{ "2" }^-52以内，R3在输入的半个量化单位以内。发现：R1 {"960"}个字中有{ "960" }个、{ "96" }个子帧中有{ "96" }个；R3每个参数、周数和参考时间都精确；R2在{ "41" }个值（af1、delta-n、IDOT）上失败，在最后一位上相差{ "1" }到{ "4" }个单位，因为RTKLIB的P2_43是十进制{ "1.136868377216160E-13" }，相对{ "2" }^-43偏差{ "2.6e-16" }；除以RTKLIB的常数则在每种情况下都得到Kshana的整数。保持MODELLED：登记的R2判据对参考基准（oracle）自身的常数而言过紧

seg-f66855e35c53 = GPS LNAV导航电文编码

seg-8caf8366e2f8 = IS-GPS-200 LNAV子帧1-3（gps_lnav::encode_subframes：按规范的比例因子和pi值对每个钟和轨道参数做就近取整量化，二进制补码打包，TLM与HOW字，带D29*/D30*翻转的表20-XIV奇偶校验，字{ "2" }和{ "10" }的奇偶求解位），即GPS L1 C/A信号生成器所发射的电文

seg-2b71b166b9d5 = RTKLIB v2.4.2-p13（BSD-2-Clause，提交71db0ffa）的readrnx解析IGS每日广播文件BRDC00IGS_R_20250610000_01D_MN.rnx，并由decode_word/decode_frame译码Kshana的字，作为单独程序运行；预先登记d4d9eb9d，早于获取该文件，采用精确整数判据。变异：用截断代替四舍五入给出{ "235" }次失败。同一编码器此前的比较被记录为发现：对照gps-sdr-sim（其采用截断，{ "230" }个字段），以及对照RTKLIB的缩放值（其十进制{ "2" }^-43常数未达到一个ulp的判据，{ "41" }个值）。集成方事后核验（保持MODELLED）：比较一致，奇偶集变异也使其变红，但预先登记d4d9eb9d到达公开分支的时间为UTC { "20" }:{ "02" }:{ "29" }，比已含有RTKLIB对该文件输出的结果提交1783f904（UTC { "20" }:{ "02" }:{ "27" }）晚两秒，因此无法证明“在获取该文件之前已登记”这一先后顺序；在获取一份未见过的广播文件之前推送一次新的登记即可解决此事

seg-c5c944357643 = 真实月球IQ上的捕获与C/N0估计

seg-f5dcb5e06bf4 = 并行码相位搜索（acquisition::pcps_acquire：可移植FFT、相干折叠、非相干累积、针对全搜索虚警概率的卡方阈值）、精化、带码多普勒的开环即时相关以及M2M4 C/N0估计器，作用于经realdata::ion_sdr读取的LuGRE L1 4位IQ批次

seg-c53c795135d6 = GNSS-SDR { "0.0.19" }（GPL-3.0，单独程序，固定配置）作用于九个非月面L1批次以及飞行接收机的RAW C/N0（LuGRE任务数据，Zenodo { "16411687" }，CC BY { "4.0" }），预先登记768cb62b。发现：Kshana的读取器对全部{ "288" }个比较区间的译码与独立转换器完全一致；GNSS-SDR判定{ "288" }次搜索中有{ "266" }次为阳性，Kshana在全部{ "266" }项判定上与之一致，但只有{ "250" }次定位在GNSS-SDR的单元上（A2失败）；C/N0一环是空洞的，没有任何飞行RAW历元落在任一批次的{ "30" } s之内（最近为{ "141" } s）。多数阳性是伪迹：裸二进制补码电平在I和Q上带有-0.5的均值，即在{ "1" } kHz分箱中高出噪声{ "32" } dB的零频线，两台接收机都会捕获它。两个批次（OP5、OP12）被错误排除：把其元数据去掉数字后的读法当成了与其头部的矛盾；真正的原因是读取器无法读取宽于一个字的采样（此后已修复）。保持MODELLED

seg-709626569a5c = 真实月球IQ上对照轨道预测多普勒的捕获（采样功率判决）

seg-784ebd80c425 = acquisition::pcps_acquire以其采样功率判决作用于九个具有中升电平的非月面LuGRE L1批次；被捕获卫星之间的多普勒差与由ESA最终轨道和Firefly重构的Blue Ghost轨迹预测的差比较

seg-38b8127db267 = 由ESA/ESOC最终轨道和NAIF CLPS重构轨迹预测的多普勒（xval/lugre-predicted-doppler/predict.py，独立于Kshana），预先登记0d1839d2。发现：全部{ "288" }次搜索都因噪声越过阈值（采样功率统计量约{ "430" }至{ "520" }，对比{ "346.3" }），因此P1平凡成立，P3成立（{ "288" }个中有{ "274" }个预测可见），而P2在{ "4036" }对中有{ "4033" }对失败。带限前端使每个单元的噪声升高约{ "1.46" }倍（已固定：OP2 PRN { "1" }上的噪声底为{ "292" }，对比白噪声的{ "200" }），采样功率统计量看不到这一点。保持MODELLED

seg-89875d67b253 = 真实月球IQ上按轨道预测多普勒评分的捕获

seg-956bcfeaf319 = acquisition::pcps_acquire以单元平均判决（峰值对照网格的平均单元，对带限噪声稳健）作用于九个具有中升电平的非月面LuGRE L1批次；被捕获卫星之间的多普勒差与由ESA最终轨道和Firefly重构的Blue Ghost轨迹预测的差比较

seg-f80a751bc49b = 由ESA/ESOC最终轨道和NAIF CLPS重构轨迹预测的多普勒（xval/lugre-predicted-doppler/predict.py，独立于Kshana），预先登记a81a9a4e。发现：P1和P3成立（{ "4" }个批次，{ "12" }次捕获中有{ "12" }次预测可见），但P2在{ "8" }对中有{ "8" }对失败。最强的两对在量值上与预测吻合而符号相反（OP2 PRN 18/24：测得+{ "7670.0" } Hz，预测-7693.9；OP17 PRN 11/30：+{ "11155.0" }，-11114.4），因此登记的I在低半字节的顺序是这些批次的共轭；刚过阈值的六次检测与两种符号都不吻合。精化的多普勒散布（两次运行之间{ "30" }至{ "50" } Hz）也被登记低估。保持MODELLED

seg-8fa779dd1788 = 对保留的真实月球IQ按轨道预测多普勒的捕获

seg-484868771231 = acquisition::pcps_acquire（单元平均判决，虚警概率{ "1e-7" }）配合refine_doppler_coherent，作用于在月面记录的LuGRE L1批次（I在高半字节，中升电平）；被捕获卫星之间的多普勒差与由ESA最终轨道和Firefly着陆点内核预测的差比较

seg-8bfd18bb6478 = 由ESA/ESOC最终轨道和NAIF CLPS Firefly着陆点内核预测的多普勒（xval/lugre-predicted-doppler/predict_surface.py，独立于Kshana），预先登记2108e6ff，作用于此前从未打开过的批次。发现：非空洞性失败；没有任何批次含有两次捕获。OP40被排除（元数据指向一个缺失的文件）；OP38、OP73、OP77_0、OP77_1什么也没有捕获，且在{ "1e-7" }下没有虚警（最高统计量{ "325" }至{ "356" }，对比{ "385.9" }）；OP74和OP76捕获PRN { "31" }，OP78_0和OP78_1捕获PRN { "12" }，每个都只有一颗，且均预测可见。保持MODELLED。已披露的偏离：登记的{ "10" } Hz多普勒判据依据的是相干精化的合成蒙特卡罗，而不是集成方所要求的、对已见过的批次的散布；OP40在运行之前被排除，因为其元数据指向一个数据集并未提供的采样文件

seg-758af035b3ce = 月球通信与导航联合几何

seg-11f861bdc6bf = 在指定的月面经纬度站点处，给定卫星在该站点月固坐标系中的位置，每颗卫星的站心视角（方位角自正北顺时针，高度角）和斜距（经核对的论断）。信号在空间中的测距精度作为场景参数给出，使服务体积扫描得出测距要求，而不是在某个固定sigma上给出通过/未通过；该参数是位于经核对论断之外的设计输入

seg-eb721568afc7 = ANISE { "0.10.2" }（Nyx Space，MPL-2.0，作为工具从xval/anise-service-geometry运行，二进制lunar-look-angles-xval，不调用任何Kshana代码）：ANISE自身的方位角、高度角和距离例程（azimuth_elevation_range_sez），站点由其经纬高构造器在pck00011月球（球体{ "1737.4" } km）上构建，卫星通过moon_pa_de440_200625.bpc旋转到MOON_PA_DE440。{ "8" }个站点（{ "4" }个指定站点和{ "4" }个其他站点，位于地平线之上和之下）、{ "12" }个历元和{ "8" }颗卫星上的{ "768" }个采样，方位角和高度角吻合到{ "1e-6" }度以内，距离和站点位置吻合到{ "1" } mm以内（在比较之前确定）；实测{ "2.2e-12" }度、{ "2.1e-13" }度和{ "5.6e-9" } m。论断：给定卫星在站点月固坐标系中的位置时的站点放置与视角。Kshana自己的平均自转月固坐标系实现以及测距精度参数不在其内；闭式几何单元测试仍作为辅助检验保留

seg-10af60b488b9 = NovaMoon类差分参考站：共模抵消 + 随基线增长的残差 + DGNSS保护级

seg-96b2627b388a = 差分误差抵消恒等式 + 复用DO-229E SBAS保护级机制；单差 + WLS解算另外还与RTKLIB的lsq()/matinv()（Takasu，BSD-2-Clause，编译的C代码）做了交叉核对——这是独立的求解器代码，但采用同样的一阶视线差代数，因此仍为InternalConsistency

seg-c04a3591074c = 月球互操作性导出

seg-91f4a066b3c0 = 与LunaNet/IOAG对齐的月球坐标系 + 时间 + 星历导出（CCSDS OEM + KIF），带往返一致性检验

seg-f5f8ed69bea7 = kshana的月球OEM导出被独立的第三方<c1/>库（R. J. Anderson）重新解析：坐标系/时间标记及每个历元状态吻合到写入精度（{ "1" } mm / { "1e-9" } km/s），且缺少TIME_SYSTEM的导出被拒绝——这是结构性的交换往返检验；月球坐标系/时间的物理语义由各自的行核对，因此该行保持MODELLED。{ "0.30" }外部比较，一项发现（保持MODELLED）：第二个独立读取器，Orekit { "12.2" } CCSDS OEM解析器（Apache-2.0，严格默认值），拒绝两个月球文件，因为它没有实现LTC和TCL时间系统（它能译码该crate的EME2000/UTC OEM，并在把TIME_SYSTEM换成TDB之后译码月球文件）；oem { "0.4.5" }仅在从不受支持的时间系统回退之后，才在写入精度之内译码这些文件。这些月球文件与主流CCSDS读取器的互换尚未确立

seg-8ab65cbefb75 = 与PNT韧性框架对齐的评分

seg-c48198f31d63 = 针对Kshana自己的七个韧性类别（不是DHS术语）、RethinkPNT RDRR功能和Yang准则的各维度子分数，每项都标注为由模型计算得出并注明其驱动因素；带有有界退化门限的暂定RPCF等级。基于仿真得出的自我评估，绝非认证。

seg-f905aeb203bb = 手工推导的各指标公式：逆Simpson多样性、加权平均综合分、有界/无界时间线持续时间、最弱环节等级阶梯

seg-d7bdb6fe186e = 韧性分数的决策不稳定性研究

seg-b6bf76a752a0 = 闭式秩统计恒等式（tau位于[-1,{ "1" }]，附手算数值；确定性带种子的Dirichlet）以及构造的稳定/不稳定见证例

seg-1bf03544a010 = 演示的代表性与距飞行的差距

seg-db24d16d38c9 = 对演示输出作出限定的逐结果诚实台账：其外部锚点、建模假设、距飞行的差距和有代表性的TRL区间，并强制执行不变量（经核对的项需要外部锚点；由模型计算得出的项需要差距，且不能声称高于TRL { "4" }）。

seg-81d3adb239c5 = 对应“论证了代表性并识别出距飞行差距”这一compliance规程的闭式不变量；与核对状态/参考基准（oracle）类型的边界相联系

seg-52ab936eb5f5 = 量子对经典的权衡证据（通用形式）

seg-a6679ed5bed7 = 一个可复现的TradeEvidence对象（固定框架：场景+种子+引擎；每个性能指标上通用的量子对经典数值，带极性正确的收益，可选的{ "95" }%置信区间，经核对/由模型计算得出的标签），附带一条代表性记录，使每个量子PNT垂直领域都以同样诚实的方式报告权衡。

seg-70da3e15ea8b = 闭式收益/胜者恒等式 + 对现有quantum_trade::TradeResult的忠实封装；诚实性与代表性台账和核对标签相联系

seg-20fee61b3107 = 量子器件误差模型库

seg-e42eabe9bc2a = 器件卡片（光学/囚禁离子/汞离子 + 复用自holdover/clock_state的经典时钟；冷原子干涉仪；经典与纠缠/单光子时间传递链路），每张都带有代表性记录；纠缠链路增加一个散粒噪声受限的授时精密度模型（~jitter/sqrt(R*tau)，暗计数惩罚，系统误差下限）。

seg-632600203e1f = 复用的时钟/CAI系数（holdover/clock_state，已发表的数值）+ 纠缠链路的闭式散粒噪声/损耗恒等式

seg-86d71fd89f26 = 可信量子授时（时间传递 + 安全分发 + 异常）

seg-d2a3d37825ef = 端到端的量子对经典时间传递链路（时钟滑行 + 链路精密度按平方和合成），复用的授时保护级，延迟/重放攻击安全性能指标（1-P_md）以及时钟异常检测概率 + CUSUM延迟，作为诚实的TradeEvidence给出，并附代表性记录。

seg-ac95d112a17a = 在复用的经核对内核上的闭式平方和预算（ADEV对照Stable32/NIST；TPL界；检测analytic_pd/pmd）；诚实性与代表性台账相联系

seg-eaf341ff4522 = 无GNSS的量子导航

seg-908a44a9f7c7 = 在GNSS中断期间，量子（冷原子干涉仪）对经典导航级INS航位推算：位置误差增长、守时（holdover）到位置阈值，以及作为诚实TradeEvidence的量子对经典权衡；诚实的可观测性说明（没有定位修正时偏差不可观测，因此误差增长）。

seg-508f2c8884e2 = 复用的惯性预算与同一航位推算ODE的独立Octave二重积分做了交叉核对（不同运行时，共用模型 → ReferenceImpl），并以Freier-2016已发表的短期噪声作为单侧锚点；量子对经典的综合结果保持MODELLED

seg-914132833f5a = 量子PNT系统的故障/异常检测

seg-f20392820b9d = 带标签的量子故障目录（时钟频率跳变/漂移/失锁；传感器偏差阶跃/掉线），带自助法置信区间的检测统计量ROC AUC，以及在固定虚警率下的最小可检测故障；量子时钟辅助的监测器能检测到比经典监测器更小的故障，作为诚实的TradeEvidence给出。

seg-a689ab2ebb84 = 闭式Gaussian AUC = Phi(mu/(sigma*sqrt2))，与经外部核对的eval_stats::bootstrap_auc_ci（对照scikit-learn）及检测解析阈值做了交叉核对

seg-0633e05d393f = 无力矩刚体姿态动力学

seg-23f43007bcbf = Euler转动运动方程（I ω̇ = τ − ω × Iω，主轴与一般惯量张量）与四元数姿态运动学（q̇ = ½ q ⊗ ω）耦合，用每步对四元数重新归一化的定步长RK4积分器传播

seg-2d21a01ea132 = Basilisk { "2.9.1" }航天器主体刚体传播（AVSLab，ISC；通过其自身的耦合主体方程得到MRP姿态，svIntegratorRKF78，相对容差{ "1e-12" }），这是无力矩刚体方程的独立实现：Kshana的RK4四元数（dt { "0.01" } s）与本体角速率在{ "1e4" } s内、在两个一般的非对角惯量上吻合到{ "1e-9" }以内（最差{ "3.3e-11" }和{ "3.4e-12" } rad/s）；容差在比较之前确定。经核对的论断：无力矩运动；外力矩项未做比较。守恒律和对称陀螺检验仍作为辅助的自洽性检验保留。没有柔性体/控制回路/外力矩环境

seg-93b8ba1ba0e5 = Clohessy–Wiltshire / Hill相对运动动力学

seg-17f27a95d009 = 追踪器相对于圆形参考轨道上目标的相对运动，在LVLH坐标系中：线性化的Clohessy–Wiltshire方程（ẍ−2nẏ−3n²x={ "0" }，ÿ+2nẋ={ "0" }，z̈+n²z={ "0" }）由闭式{ "6" }×{ "6" }状态转移矩阵Φ(n,t)求解（Clohessy–Wiltshire { "1960" }；Vallado Alg. { "48" }），并带有有界相对轨道条件ẏ₀=−2n·x₀，以及一个闭式二阶修正（cw_dynamics::second_order_correction，即CW对精确圆形主星方程二次项的响应；Karlgaard和Lutze { "2003" }，Newman、Lovell和Pratt { "2015" }），组合为cw_dynamics::propagate_second_order。经核对的输出是propagate_second_order；仅线性Φ是针对非线性真值做了刻画，并未经核对

seg-29adc2d68a7b = Orekit { "12.2" }（Apache-2.0）NumericalPropagator，两体，LOFType.QSW，作为单独程序运行（测试夹具自第{ "1" }轮以来未变）。预先登记的判据为每个算例的每个采样上{ "1e-3" } m；二阶引擎修复对照它在不变的情况下重新运行（修订8c8e768d，写于传播器存在之前，披露了一阶差距是已知的）。propagate_second_order吻合到{ "1.15e-7" } m（C1）、{ "9.8e-8" }、{ "5.4e-8" }和{ "2.2e-8" } m；把二阶项减半则在{ "1.85e-3" }至{ "3.14e-3" } m处失败。仅线性Φ在{ "100" } m处、三分之一轨道内偏离非线性真值{ "1.2" }至{ "6.3" } mm（被省略的二阶项；其严格测试保持忽略），因此是被刻画而非经核对。保留的内部检验：Φ对照Hill方程的RK4积分、Φ(t)Φ(−t)=I、有界轨道与−12π·x₀漂移恒等式，以及二阶项的三阶残差缩放。范围：圆形主星，间距接近{ "100" } m，至多三分之一轨道；没有偏心率（Tschauner–Hempel）、J2或差分阻力项；小间距假设

seg-d31be81dfd8f = TDOA/FDOA被动辐射源地理定位

seg-aa870cee16f6 = 由接收机网络上的到达时间差定位辐射源（干扰源/欺骗源，或用于反向PNT的机会源）——τᵢ=(Rᵢ−R₀)/c双曲面交点用Gauss–Newton最小二乘求解——并在加入到达频率差（距离变化率差）且接收机运动时，联合恢复位置和速度；并由测量几何给出位置协方差上的Cramér–Rao下界

seg-17b45796fd43 = 估计器与几何的自洽性：正向→逆向往返、Fisher/CRLB恒等式J·CRLB=I、GDOP单调性，以及估计器在蒙特卡罗噪声下达到其自身的Cramér–Rao界——内部一致性检验，不是外部数据集，因此该行保持InternalConsistency。MODELLED被动地理定位——点源视线模型；没有多路径/NLOS、接收机钟差或大气折射项。{ "0.30" }第{ "2" }轮，对照Ho和Chan { "1993" }以及Ho和Xu { "2004" }（预先登记f89018b8，每个印出值的{ "1" } %），一项发现（保持MODELLED）：受地表约束的TDOA界复现了{ "40" } N几何因子（-0.11 %，-0.02 %）和最大TDOA；联合TDOA+FDOA界复现了图{ "6" }（+{ "0.06" } %，-0.17 %），并在作者自己的代码为图{ "7" }所指明的源处，复现了图{ "7" }（+{ "0.11" } %，-0.02 %）（该修订写于看到该结果之后，已披露）；它与作者已发表的界代码（BSD风格，在GNU Octave下运行）相等，吻合到{ "3e-12" }；协方差加权的最大似然求解器达到印出的界（+{ "0.3" }至+{ "0.4" } %）。该论文由蒙特卡罗印出的Ottawa因子（{ "251" }，{ "7.1" }）相差+{ "1.3" } %和+{ "4.4" } %，超出{ "1" } %的判据

seg-36b74b49f82f = 3-DoF弹道式再入峰值减速度对照已发表的Stardust标称值

seg-a05ca2fde6fc = 在旋转球形地球上通过US Standard Atmosphere { "1976" }的3-DoF质点再入，由惯性再入状态用RK4积分，报告峰值减速度及其高度；行星相对再入状态由惯性状态得出。可作为<c1/>场景类型运行。

seg-5ab7065c0803 = Desai、Mitcheltree和Cheatwood（{ "1999" }，NASA NTRS { "20050042027" }）的Stardust标称值：自{ "12.6" } km/s行星相对速度起，{ "45.8" } kg发射质量时最大减速度{ "33.4" } g，为带完整气动数据库的6-DoF POST轨迹；再入界面取自Desai、Lyons、Tooley和Kangas（NTRS { "20090004445" }）：半径{ "6503.14" } km，惯性速度{ "12.9" } km/s，-8.2度。判据在任何基于这些输入的运行之前已在xval/entry-stardust/PREREGISTRATION.md中预先登记；两者在首次运行时均达到。不涵盖：仅一个已发表的算例和一个量（峰值减速度，在弹道近似中它不取决于弹道系数）；再入纬度和航向是假设的；热流、热负荷和着陆点未对照它核对；是带常数C_D的质点，不是6-DoF。

seg-5bd3882531b6 = 3-DoF再入上的驻点对流再入加热（Sutton-Graves）

seg-4f97036ed72f = 驻点对流热流q = k sqrt(rho/R_n) V^{ "3" }，采用地球空气和火星大气的Sutton-Graves常数（NASA TR R-376，{ "1971" }），其峰值和沿3-DoF再入（弹道式或恒定倾侧角的升力式，在地球或火星上）的积分热负荷。

seg-5a203ecfeaee = 内部一致性：NASA TR R-376中印出的关系式与常数、半步收敛检验，以及加热与减速度峰值的预期次序。不涵盖：未对任何已发表的加热值做比较（Stardust论文给出的是设计限值和约{ "1200" } W/cm2的对流加辐射估计，仅含对流的关系式无法与之吻合）；没有辐射加热、壁温或催化性修正，也没有热防护响应。

seg-1b96577665fc = 光电成像仪辐射测量、MTF、相对边缘响应与GIQE { "4" } NIIRS

seg-38902593e841 = 天底成像仪信噪比预算（Lambertian场景辐亮度、相机方程、散粒噪声、暗噪声、读出噪声和量化噪声），奈奎斯特处的系统MTF（为无遮挡孔径衍射、探测器孔径、线性拖尾与Gaussian抖动之积），由该MTF积分得到的边缘响应与相对边缘响应，Q = lambda F / p，以及不带MTF补偿的GIQE { "4" }版NIIRS。可作为<c1/>场景类型运行。

seg-bb3a01edc95d = 闭式结果：半截止频率处的衍射MTF、纯探测器孔径的一像素斜坡边缘（RER { "1" }）、Gaussian模糊的正态CDF边缘（RER = erf(0.5/(sigma sqrt { "2" }))）、散粒噪声缩放，以及按已发表形式的GIQE { "4" }系数（Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }）。不涵盖：未对任何外部成像仪、实测MTF或已评级图像做比较；GIQE是带自身误差的经验回归；没有杂散光、大气MTF、MTF补偿或混叠。

seg-07ca77a67207 = 发射上升段的重力、阻力、转向和背压损失

seg-7a1802cf2c80 = 多级飞行器在非旋转球形地球上通过US Standard Atmosphere { "1976" }（密度和压力）的平面重力转弯上升，带俯仰踢动、因喷管背压而减小的推力、恰在步长边界上的级关机，以及与状态一同积分的重力、阻力、转向和背压损失。可作为<c1/>场景类型运行。

seg-174ed29adbbe = 内部一致性：精确恒等式 关机速度 = sum Isp g0 ln(m0/mf) 减去四项积分损失（残差低于{ "1e-6" } m/s）、仅有重力损失的垂直真空燃烧上的Tsiolkovsky方程，以及US76海平面和对流层顶压力。不涵盖：未对任何已发表飞行器的损失做比较；没有地球自转、滑行、节流或踢动之外的制导；C_D为常数；不是轨迹优化器。

seg-55e8345def8b = TWSTFT双向方程、不确定度预算与带闪烁和日变非互易性的链路稳定度

seg-5ca5226c24ec = 针对T_A - T_B求解的TWSTFT双向方程，含站发射与接收延迟、Ku波段电离层上/下行不对称、转发器延迟差和Sagnac项，并对照其精确正向模型；以链路TDEV为A类项的平方和不确定度预算；带白相位噪声和闪烁相位噪声（Kasdin-Walter）、日变非互易性和恒定互易性残差的双向序列；以及所提供的Circular T、MJD-CSV或IGS RINEX测站钟序列的速率、残差RMS、TDEV和ADEV。可作为<c1/>场景类型运行。

seg-244f7396ac25 = 内部一致性：正向模型与所解方程吻合到{ "1e-15" } s，Sagnac项等于该模块独立的BIPM 2A omega/c^{ "2" }回路形式，电离层项为{ "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c，噪声过程显示出其预期的TDEV形状。不涵盖：未对任何真实TWSTFT测量或标定报告做比较；所述延迟和不确定度是输入，不是测得的；所提供序列的稳定度是被报告的，并未经核对。

seg-2f9be02c92bc = 光学斜程大气数值：Rytov方差、闪烁、gamma-gamma衰落概率、孔径平均、云与晴空光学厚度

seg-032cf76c2ec0 = 沿斜程积分的Hufnagel-Valley Cn2，得到平面波与球面波Rytov方差（上行与下行）、Andrews-Phillips闪烁指数和gamma-gamma参数、gamma-gamma衰落概率与衰落裕度、弱湍流孔径平均因子、液态水柱的云光学厚度，以及Kim能见度加Rayleigh晴空光学厚度；在提供大气时，取代光链路预算中的集总大气损耗。可在<c1/>场景类型内运行。

seg-7ca512adff99 = 这些数值与一个独立程序（xval/optical-atmosphere/oracle.py，mpmath { "1.4.1" }，{ "30" }位数字，对原始高度变量做tanh-sinh求积，并用Bessel-K gamma-gamma密度）做了比较，该程序与Kshana没有共用代码，判据在任何实现存在之前确定（xval/optical-atmosphere/PREREGISTRATION.md）。为何为MODELLED：该参考基准（oracle）计算的是同样已发表的公式，因此它核对的是所述公式的实现，而不是大气；没有使用ITU-R核验算例，也没有使用实测的闪烁或斜程消光记录（ITU数值是待定的许可决定，因此不放入代码库）。Cn2剖面水平、能见度、气溶胶与分子标高、孔径平均路径长度，以及把孔径平均应用于gamma-gamma参数所用的矩匹配，都是所述的输入或约定。模块中的一行源码注释记录了一份被广泛复制的综述把第二个闪烁指数印成7/6，而Andrews和Phillips给出的是5/6；这里实现的是5/6形式

seg-a2faab92e760 = 受天气驱动的光学地面站点可用性与随距离相关的站点分集

seg-7f4e4e763d62 = 光链路在给定链路裕度下的可用性，来自对数正态云液态水气候（ITU-R P.840量，几何光学消光）和独立的gamma-gamma湍流衰落，目标可用性所需的链路裕度及任何裕度都无法突破的上限，对数正态中断持续时间，增强技术的假设分析，以及单因子Gaussian-copula网络可用性，其成对相关性为exp(-distance/decorrelation length)。可作为<c1/>场景类型运行。

seg-20eab6e9b925 = 内部一致性：分集模型的闭式极限与单调性、云上限闭式，以及对数正态中断恒等式。不声称存在、也未比较任何外部参考基准（oracle）：没有使用实测的光学地面站可用性或无云视线记录。为何为MODELLED：云气候（云的概率、液态水柱的中位数与散布、中断持续时间）、云与湍流的独立性、Gaussian-copula形式、去相关长度以及每项技术增益都是假设；所附场景给出的是ILLUSTRATIVE气候，而不是数据集。要提升该行，需要一份引用的实测可用性记录以及一条在比较之前登记的判据

seg-bb9cb3fe4180 = 光学站点的中断持续时间分布，与守时（holdover）模型的闭式滑行方差耦合：在给定中断分位数处的授时与测距误差、到授时阈值的守时时长、处于其内的中断比例和中断时间比例，以及授时可用性A + U E[min(D, T_h)]/E[D]，分别针对经典和量子时钟类别。可在<c1/>场景类型内运行。

seg-ab2a33c1b1a4 = 与守时（holdover）模块逐位一致的内部一致性；不声称存在外部参考基准（oracle）。各类别的PSD是守时模块已带有的合成长tau下限，因此这些数值继承了它所述的告诫：到严格阈值的守时由假设的红噪声下限决定，而不是由所引用的阿伦偏差决定。中断持续时间是带所述参数的对数正态模型，而不是实测的云驻留记录

seg-06125f3cae90 = 一个可选启用的<c1/>表（持续时间、步长、种子）使<c2/>类型还会针对每个站点，写出所述站点模型随时间的一次带种子的实现：云事件（晴期为指数分布，云中断为带所述均值与散布的对数正态，云中时间占比设为所述云概率），每个云事件一个对数正态液态水柱，每步一个gamma-gamma闪烁采样，并由这些得出链路裕度、云与闪烁衰落和链路在线标志，以及实现的可用性、云占比、中断次数和最长中断。没有该表时，结果就是{ "0.37" }文档。抽样经由可移植的分布与数学路径进行，因此原生与wasm32给出相同的字节。

seg-d25e5d2449bd = 仅为内部一致性；不声称存在外部参考基准（oracle），对天气实现而言也并不存在。这些检验把一次抽样与同一模型的统计输出比较，因此通过只说明生成器是按所述分布取样的（抽样的可用性与云占比落在对所述数值的预先登记容差之内），而不说明任何真实站点会如此表现。该序列是一次实现，而不是气候：其可用性与所述值相差抽样误差，且不同步的闪烁采样彼此独立，这是对一个在毫秒内去相关的过程所作的所述简化。天气输入仍是该场景的假设。

seg-90307f07e0ef = 月面参考站解算模式：高度约束、三颗卫星、静态用户窗口

seg-366c7ad03fb2 = lunar-station-coverage（LRS-06）的可选 [solution] 部分：一行高度伪观测up . dx = e_h，按所给的1-sigma加权并与距离观测行联合，仅在启用该约束时才允许最少三颗卫星；并在最近window_epochs个历元上做加权最小二乘解算，各历元共用一个静态位置、每个历元一个钟差（等同于滤波器对同一数据、无过程噪声的静态位置所给出的答案；各历元的误差按相互独立处理）。若缺省，则快照解算及所有文档均保持不变。这是对已发表声明比较的补充，采用与原文献相同的解算方式，并单独预先登记

seg-bfe05379b7aa = 快照约化与解算器的闭式情形（InternalConsistency）。补充文档（tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md，在001ca100中单独预先登记），采用{ "1" } m的高度约束、三颗卫星和6个历元的窗口（ILLUSTRATIVE设置：原文献说明了滤波器、高度约束和三颗卫星，但未给出其设置）：K1至K5未通过，K6通过，即{ "6" }项中{ "1" }项通过，与已记录的运行一致；R300修正后p95 3-D误差从{ "280.6" } m降至{ "2.11" } m（水平{ "0.90" } m，不计分），覆盖率仍为{ "0" }。窗口的独立性假设对结果有利。不构成对任何真实系统的说明

seg-611ba369ed00 = 月面参考站的精度与覆盖率：与已发表声明的对照

seg-4fe4f1cffa2b = 在已发表的月面差分参考站资料所给的公开假设下运行lunar-station-coverage类型（四颗导航卫星位于{ "24" } h冻结椭圆轨道，{ "10" } m { "95" } % SISE，{ "0.30" } m码噪声，{ "1" } s与{ "600" } s的修正延迟，亚分米级的测站测量，已发表的示例测站位置，{ "300" } km与{ "600" } km的南极圆），并依据运行前预先登记的六条单侧判据，对照原文献的数值声明评分：整个南极在p95亚米级的覆盖（K1、K2），修正后p95达到亚米级和分米级（K3、K4），在{ "600" } s延迟下仍保持亚米级（K5），以及基线从{ "10" } km到{ "500" } km时精度保持不变（K6）

seg-eb6d3be85fec = 参考：五个公开来源的数值声明，已连同URL、检索日期、SHA-256和许可登记于tests/fixtures/lunar_station/SOURCES.md（arXiv:2602.08432v3；IOAG Cislunar PNT Workshop { "2025" }与{ "2026" }年的幻灯片；UNOOSA ICG WG-B Lunar PNT，{ "2024" }年六月），并附页码转录于tests/fixtures/lunar_station_published/CLAIMS.md。判据、案例和输入已预先登记于tests/fixtures/lunar_station_published/PREREGISTRATION.md（修订版{ "2" }，05bf9a19，在运行前单独提交）。{ "0.36" }首次运行，一项发现（仍为MODELLED）：{ "6" }条判据中有{ "1" }条通过。两个圆上的覆盖率均为{ "0.00" }，而判据为 >= { "0.95" }；修正后p95 3-D误差为{ "280.6" } m（{ "300" } km），在{ "600" } s延迟下为{ "293.0" } m，而判据为<= { "1.5" } m。分米级判据（K4）在原文献的{ "0.30" } m码噪声下无法通过，这反映的是各来源之间的矛盾，而不是模型的结果。K6通过（比值{ "1.39" }，判据为<= { "1.5" }），但由于它是两个由几何主导的量之比，对去相关性而言，它在任何方向上都不构成证据。原因：卫星的轨道根数未公开，在ILLUSTRATIVE的树内轨道根数下，用户与测站在仰角{ "5" }度以上共视四颗卫星的历元仅占{ "8.2" } %（{ "300" } km）和{ "6.3" } %（{ "600" } km），且几何接近奇异（未修正p95为{ "3.8" } km，而原文献为< { "10" } m）。原文献的仿真使用了滤波器、高度约束和三颗共视卫星，而快照类型并不对此建模。因此，该比较既不能证实、也不能否定已发表的“整个南极达到亚米级”。它表明的是，本模型的结果取决于未公开的轨道。不构成对任何真实系统的说明；与任何机构无关联，也未获其背书

seg-478225d0a8e1 = 月面ARAIM保护级内核

seg-863690a44f21 = 月面保护级从几何到协方差的步骤，即对全视场和每个单故障子几何计算 (GᵀG)⁻¹，投影到局部垂直方向和水平块的迹上；以及其统计内核：Bonferroni检测器乘数、各故障假设的高斯上尾，以及把完好性风险预算映射为保护级的求根，在7点的月面服务体积上进行

seg-8191906fc700 = 组合了两个成熟的第三方实现，均离线运行，夹具从头到尾重新生成并验证为逐字节一致。RTKLIB 2.4.2-p13（T. Takasu，BSD-2-Clause），提交71db0ff，src/rtkcmn.c以 -ULAPACK从C源码编译：lsq() → matinv() → ludcmp()/lubksb() 用带部分主元的Crout LU对法方程矩阵求逆，该算法与kshana手写的Gauss-Jordan invert4() 无关；numpy.linalg.inv（LAPACK getrf/getri）对每一个矩阵再次求逆，作为第三个独立的逆，与RTKLIB的相对一致性达到{ "1.112e-12" }。SciPy { "1.17.0" } / NumPy { "2.4.1" }（BSD-3-Clause）提供norm.isf、norm.sf（Cephes ndtri/ndtr）和optimize.brentq，与kshana的Numerical-Recipes不完全伽马级数、二分求逆和200步二分法相对照；而且SciPy直接计算sf进入远尾部的数值路径不同于kshana的{ "1" } − Φ，因此深尾部的相消是被实测的，而不是被照搬的。垂直轴取径向单位矢量（球形月球上局部垂直的定义），水平方差取水平块的迹，因此不共用任何东/北方位角约定。本行明确不对以下各项给出VALIDATED：σ_URE、每颗卫星的故障先验以及示意性的Moonlight/LCNS类星座，它们是按给定值交给参考基准的MODELLED输入；单故障MHSS完好性方程的形式转录自kshana所实现的同一已发表界限，共用闭式即共用假设，因此本行涵盖的是对该方程的错误求值，而不是对它的错误选择。目前无法获得第三方的MHSS ARAIM实现（RTKLIB未提供保护级入口，PyPI上没有此类发行包，Stanford MAAST是MATLAB实现），这是尚待完成的升级

seg-0ec1699f5754 = ARAIM MHSS保护级与已发表参考向量的对照

seg-fbaaf3ad7648 = 多假设解分离保护级方程本身：在东/北/天几何上，每个星座一个钟差状态，分别对全视场和各故障模式做加权最小二乘，得到子解标准差、解分离标准差和单侧标称偏差投影，Bonferroni K_fa门限，未监测故障的风险分配，以及求解完好性风险方程的VPL/HPL。可作为<c1/>场景类型运行

seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup，Reference Airborne Algorithm Description Document v3.1（{ "2019" }年六月{ "20" }日），附录D的数值算例：已发表的输入（10颗卫星2个星座的几何矩阵、C_int/C_acc对角线、b_nom、P_sat、P_const、LPV-200常数）和已发表的输出（VPL { "18.3" } m，HPL { "13.45" } m，EMT { "7.2998" } m，σ_v_acc { "1.3694" } m，K_fa_3 { "5.1083" }，以及六个星座故障中间量），检索于2026-09-20，来源SHA-256为7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7。在该参考文献自身给出的容差TOL_PL = { "5e-2" } m下一致：VPL { "0.0074" } m，HPL { "0.0437" } m；EMT与 σ_v_acc在其印刷精度内一致。同一小组的Milestone { "3" } Report（{ "2016" }）Annex A §A.IX给出了同一算例，但其内部不一致：G的第{ "3" }行有一处符号笔误（该处为 +{ "0.7477" }，而{ "2019" }年文档印刷的是 −{ "0.7477" }；取正号时，该文档自身的 σ_v_acc为{ "0.8690" } m，而其公布值为{ "1.47" } m），并且K_fa_3是按{ "57" }个故障模式求得的，而该文档声明N_fault_max = { "1" }，即{ "12" }，因此其EMT对应57模式门限，而其VPL/HPL并非如此。没有任何符合规范的实现能够同时复现它的全部输出。其几何中间量可精确复现，其保护级则记录为实测差异（VPL { "0.0171" } m，HPL { "0.0842" } m，EMT { "0.4806" } m），不计入验收数字；容差没有被放宽来吸收这些差异。范围：仅限N_fault_max = { "1" }，多事件故障子集会被拒绝而不是被截断，而排除、卡方一致性检验和重复计数的重新分配步骤仍为MODELLED

seg-7bfcb5c6a985 = 含多颗卫星同时故障假设的ARAIM

seg-15043111e437 = araim_reference::add_v42_subset_plan：ADD v4.2的子集确定规则（P_THRES、FC_THRES，受监测子集按移除数量从少到多排列），从成对推广到至多max_order个卫星和星座事件的同时组合，先验为精确的P_no fault prod q_e；add_v42_protection_levels_to_order在其上运行ADD v4.2的保护级路径（阶数{ "2" }恰好就是现有路径）。raim::araim_subset_raim（需主动启用）：在该假设集上的先进RAIM，每个受监测子集在完好性风险求和中对应一个 (p_fault, T, b, sigma) 模式，不可观测的子集移入未监测风险，预算按ADD对未监测风险的分配进行缩放，并在检测到故障时报告归一化分离最大的子集。需要比max_order更深子集的先验会被拒绝，绝不截断

seg-6c6076ea1eee = 内部自洽（InternalConsistency）：2阶情形约化为经MAAST核对的ADD v4.2路径，先验的独立重新推导，以及一个构造出的双卫星故障。尚未在超出成对的情形下进行MAAST或RTKLIB运行，因此更深的假设集和子集RAIM的保护级没有经过外部核对。araim_subset_raim沿用araim_dual_raim的简化（完好性与精度共用一个sigma，一个钟差，普通的正态尾部）：它不符合ADD

seg-48ca01332f8f = RAIM与时钟守时（holdover）性能指标并列

seg-890f1006a75d = 时钟类型的可选 [integrity] 部分（clock_integrity::run）：根据给定的站点和星座预设（geometry::sky_geometry），在GNSS时间线未被拒止的每个完好性历元，对高于截止角的卫星做快照RAIM（raim::snapshot_raim：奇偶校验卡方检验、斜率保护级），残差为所给sigma的带种子高斯噪声，并可附加所给的偏差；另有独立的integrity_fom块，含逐历元的判定、保护级和可用性。被拒止的历元报告为不可用，绝不外推；守时性能指标保持不变，缺省该部分时输出逐字节一致

seg-c2860bf4b562 = 内部自洽（InternalConsistency）：保护级即snapshot_raim的保护级（它已在自己的一行中与RTKLIB对照验证），在同一几何上重新计算；含无故障与注入故障的行为。天空是具代表性的预设几何（不是带日期的历书），残差是合成的，sigma、告警限值和概率均为给定输入；此处任何内容都不构成对真实接收机可用性的说明

seg-9cbb4ee7588a = 空间、含噪声、多族的地月空间弧长可观测性

seg-5ebd771deef8 = 在空间六状态CR3BP（而非平面四状态）中，跨DRO、L2晕轨道和L2近直线晕轨道各族的地月空间弧长可观测性阈值，测量噪声进入Gramian，并报告两项判据，因为不存在唯一诚实的判据：其一是已发表的秩判据，可证明它对同方差测量sigma不变（白化把可观测性矩阵乘以一个标量，相对奇异值谱，因而秩、亏秩和条件数都不变）；其二是可估计性判据，即首领星初始状态的形式1σ 位置不确定度降到给定界限以下的第一个弧长，它才是会随噪声变化的那一个。每个阈值都带有它所处的历元网格区间；未达到的判据为null并附原因。平面模式仍为默认，平面模式下会拒绝面外各族，而不是把它们压平成无法表示它们的状态

seg-046231819882 = 一个独立的、用带部分主元的高斯消元得到的行阶梯秩，确认每一个六状态秩判定，其算法不同，且与被测的特征值/SVD路径不共用任何代码。它所组合的{ "6" }×{ "6" } CR3BP状态转移矩阵自带ReferenceImpl参考基准，对照SciPy变分积分，而晕轨道/NRHO初始条件来自一个校正器，该校正器复现了已发表的L2南向{ "9" }:{ "2" } Gateway轨道。已有的平方根信息滤波器环节明确不算作佐证：它使用相同的雅可比矩阵并归结为同一个法方程矩阵，所以它只是两台数值机器之间的一致性检查，所发出的扩展标签也这样说明。没有外部锚定，因此ExternalDataset被拒绝，而不是从STM的那一行借用：阈值弧长本身取决于MODELLED星座设计、历元网格，以及奇异值容差，其影响经测量可达{ "40" }倍。已发表的平面{ "2.09" } h在rel_tol = { "1e-6" }下精确复现，而它本身也依赖容差（在{ "1e-4" }下为{ "10.25" } h，在{ "1e-8" }下为{ "0.42" } h），这是该判据的性质，而不是轨道的性质。没有公开数据集发布过所选地月空间星座的弧长可观测性阈值。实测结果：空间六状态阈值在L2 NRHO上为{ "22.17" } h，在L2晕轨道上为{ "40.42" } h，而对已发表声明所依据的平面DRO族则不存在：秩为{ "6" }中的{ "4" }，基准亏秩{ "2" }，有两个精确为零的特征值，这是任何弧长都无法恢复的结构性亏秩

seg-e250321394bc = 运行式的地球定向预测误差，按预测值对终值实测

seg-0e443d241460 = 在尾随窗口上做最小二乘的偏置加速率拟合，再加上主要周期项：UT1取周年、半周年和两个主要带谐潮，极移取Chandler、周年和半周年项；外推时沿用窗口内最后一个残差：这是IERS Bulletin A所用的一类方法，取代已发表预测时段所依据的持续性预测器。以唯一诚实的方式评分：用不晚于T的快速Bulletin A各行构造T+h的预测，对照稍后发布的Bulletin B在T+h的终值来衡量，并在同一历元集合上、对照同一批终值，并列给出持续性预测的评分。没有已发布终值的目标历元会被舍弃，而不是改用快速列重新评分；窗口无法约束的周期项会被报告为已拒绝，并附其实际跨越的周数；不完整的窗口会被拒绝，而不是悄悄缩短

seg-822a1ce99154 = 三条独立路线，其中没有一条是已发表的预测精度数字。（{ "1" }）已知系数的解析信号：这是检验周期项机制的唯一办法，因为已提交的序列都不够长，无法容纳周年项。（{ "2" }）教科书式的闭式最小二乘解，其代数不同于被测的矩阵求解，在真实数据行上进行。（{ "3" }）真实{ "2026" }年产品所发布的实际归档Bulletin A预测行，按预报时长作为一致性统计量比较，明确不是作为误差：{ "1" }天为{ "0.256" } ms，{ "2" }天为{ "0.695" } ms，{ "3" }天为{ "1.252" } ms，{ "9" }天漂移到{ "3.885" } ms。所以这是Bulletin A的同一类方法，在短预报时长内接近，但并不就是Bulletin A。预测值对终值的残差是对真实IERS数据行的真实测量量，但其量级只与比较的方向对照检查，绝不与IERS发布的精度数字对照；读取真实产品是出处，不是参考基准。实测：第{ "1" }天，运行式预测器的月固系误差为{ "3.78" } m，持续性预测为{ "11.39" } m（{ "3.01" }×）；第{ "2" }天为{ "10.23" } m对{ "21.72" } m（{ "2.12" }×）；第{ "3" }天为{ "20.33" } m对{ "30.57" } m（{ "1.50" }×）；而超过三天后更差（{ "5" }天为{ "0.87" }×，{ "10" }天为{ "0.43" }×），报告会如实给出这些结果，而不是只展示对它有利的时段。未复现：自回归残差滤波器和表列带谐潮的归算；365天的运行式窗口在已提交的数据下无法达到；本仓库中不存在该序列更早的任何归档版本，因此归档版本表不报告任何行，而不是对合成的版本评分。{ "0.30" }外部比较，一项发现（仍为MODELLED）：在{ "178" }期归档Bulletin A上对照同一批终值评分，采用该crate默认的15天窗口，预测器的UT1 MAE在{ "1" }至{ "10" }天为Bulletin A的2.4x至12.6x（判据1.5x），{ "10" }天为{ "5.32" } ms，超出第2次EOP PCC的{ "0.36" }至{ "3.13" } ms范围；极移为Bulletin A的1.5x至1.85x（仅在{ "6" }天和{ "7" }天处在1.5x以内）；{ "21" }个预先登记的条件中有{ "19" }个未通过。对路线（{ "3" }）的更正：与之比较的{ "2026" }年产品数据行带有IERS的I（实测）标志，而不是P，所以那些一致性数字对照的是实测的快速值，而不是Bulletin A的预测。{ "0.30" }第{ "2" }轮，用解析方式去除带谐潮的最小二乘加自回归预测器，在{ "178" }期归档Bulletin A上按第1轮（round-1）的判据评分（预先登记c93605b4），一项发现（仍为MODELLED）：{ "21" }个条件中有{ "12" }个成立；UT1 MAE在{ "2" }至{ "10" }天为Bulletin A的{ "1.73" }至2.11x（判据1.5x），而极移在每个预报时长上都在1.27x以内。{ "0.30" }修订：离线输入现已按IERS标志分类后，路线（{ "3" }）的一致性数字对照的是真实的Bulletin A预测（0.256/0.695/1.252/3.885 ms，对应1/2/3/9天，对照快速数据行 -> 0.133/0.421/0.839/2.786 ms）

seg-f4efd94dd746 = 由观测活动得到的月面坐标系基准

seg-a6972eb89d7d = 七参数Helmert基准由模拟观测活动传播得到，而不是由注入的变换恢复得到。地球测站按明确的计划观测一份有来源的月面信标目录；月面VLBI延迟偏导数累积成信标坐标Fisher信息矩阵，并通过Helmert设计矩阵A = [I₃ | [p]ₓ | p] 推送为H = AᵀM_bA，因此所报告的基准精度是观测计划的函数，对延迟sigma严格呈线性，并通过报告所实测的天平动随弧长单调变化。基准亏秩是研究对象，而不是脚注：每次运行都会给出秩、亏秩、条件数、谱、七参数基下的不可观测方向、即使满秩时最弱的方向，以及各参数在其中所占的份额，而观测活动未约束的任何参数都会以NULL并附状态发布。信标误差相关性是实测的，而不是假设的：测站固定时恰好为零，测站被估计时则连同其代价一并给出。可作为<c1/>场景类型运行

seg-8eedf0240350 = 闭式恒等式和一条仓库内独立的路线，不声称有任何外部参考基准。Helmert设计矩阵是该模块中唯一新增的导数，它通过对lunar_frame_realise::apply_helmert做中心有限差分重新推导，这条路径与解析形式不共用任何表达式。它所组合的累积来自lunar-vlbi-fim，其雅可比矩阵在那里对lunar_vlbi::vlbi_delay_s做有限差分，其线性代数内核又在tests/fim_observability_reference.rs中单独对numpy做了外部锚定；本行不借用这两者的地位。物理参考基准是结构性的，而不是数值性的：信标延迟偏导数是两个近乎平行的单位矢量的近场之差，所以确定得最差的平移方向必然是指向地球的体固方向，而测试把计算出的答案与另行测得的方向对照断言。实测：由观测活动得到的平移sigma为{ "6.3975" } m，而注入变换场景的恢复误差为{ "0.3125" } m（紧{ "20.5" }×），同时旋转和尺度则朝相反方向，分别松{ "2.32" }× 和{ "13.5" }×；注入路径假设单一的各向同性sigma，因此把误差均匀分摊到七个参数上，而延迟观测量并非如此。秩7/7，但条件数为{ "3.8e5" }，其中一个方向有{ "99.57" } % 是纯粹的指向地球的平移，且比任何其他方向差四十倍。本行不声称的内容：观测活动的数字在绝对意义上是正确的。它确立的只是，该数字现在由计划、几何和误差模型推导而来，而不是来自预先植入的答案。仍为ReferenceImpl/MODELLED：不存在已发表的月面VLBI观测活动加基准协方差的配对，测站网络和延迟sigma是ILLUSTRATIVE输入（信标目录有来源，观测活动没有），观测被按独立处理，而真实观测时段中邻近扫描之间的对流层和时钟是相关的，星历、时钟、对流层和地球定向参数则保持固定。{ "0.30" }外部比较，一项发现（仍为MODELLED）：每一行信标雅可比矩阵都用NAIF SPICE光行时重建（DE440、ITRF93、MOON_ME；预先登记{ "50863551" }），计划、Helmert秩、基准sigma（在{ "4.7e-3" }以内）、条件数、最弱方向（{ "0.07" }度）、天平动扫描和弧长排序在六个场景上一致，处于预先登记的{ "1" } % / { "0.2" } / { "0.05" }度以内。在测站固定的情形下，NumPy对已提交的引擎雅可比矩阵的一致性达到{ "3e-14" }。测站被估计时，差异为{ "6.8e-6" }，而预先登记的是{ "1e-9" }，其条件数的前提是错误的（Helmert条件数为{ "2.1e8" }；独立的NumPy路线之间相差{ "3e-6" }；不能排除引擎{ "1e-9" }伪逆回退的贡献），因此本行不据该预先登记升级。{ "0.36" }以随条件数缩放的判据重新登记（预先登记b887eb05；t = max({ "1e-12" }, { "10" } kappa { "2" }^-53)，由联合信息矩阵及其Helmert约化的条件数得出），一项发现（仍为MODELLED，NOT MET）：第{ "0" }步排除了伪逆回退是造成{ "6.8e-6" }差距的原因（在原先六个场景中，Helmert矩阵上游没有任何矩阵发生回退，最紧的裕量为{ "2.6" }倍），SPICE环节在全部六个场景上仍成立，NumPy在八个场景中的六个在判据内一致（默认、两种弧长、3x延迟sigma、共线亏秩，以及2026-12-01的全新测站固定运行；最差为其判据的{ "0.13" }）。它在stations_estimated上失败（基准sigma最高{ "6.8e-6" }，条件数{ "9.1e-6" }，舍弃独立性后的范数{ "3.5e-6" }，而t = { "5.9e-7" }），并且在全新日期上，南极信标没有任何观测，因此信标信息秩亏（两个全新场景中Helmert矩阵上游都出现伪逆回退），未更改的NumPy参考基准无法评估stations_estimated_fresh（矩阵奇异）。结果：docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

seg-ca481f2d8f9e = 地月空间弧长阈值的独立估计器佐证

seg-3d5fbf896209 = 一个批量最小二乘估计器，在与秩对弧长表所用的同一历元网格的递增前缀上，由模拟的星间测量恢复首领星的初始状态，其测量偏导数取自组合前向模型的中心有限差分。它不使用测得该阈值时所用的任何机制：没有解析雅可比行，没有变分状态转移矩阵，没有奇异值或特征值分解，没有秩容差，没有平方根信息滤波器；它只共用动力学、初始条件、标量观测量和历元网格，这些在所发出的文档中都有指明。两项判据，均做扫描：无噪声恢复（对应秩）和蒙特卡罗可估计性（对应可估计性，对照已知真值测量，而不是由协方差预测）。可作为<c1/>场景类型运行

seg-60e30948cee7 = 本代码库中另一个估计器，算法不同、代码路径互不相交：带有限差分偏导数的非线性加权高斯-牛顿法，其判定读作以km和mm/s表示的实测状态恢复误差。它与Gramian的秩加协方差路线没有任何共同的表达式，而这种分离由源文本守卫强制保证，而不是仅仅声称。在已发表的平面DRO网格上的实测：可估计性判据为CORROBORATED：实测的蒙特卡罗边界为{ "5.739130" } h，形式值为{ "5.739130" } h（比值{ "1.0000" }），而实测RMS在{ "21" }个弧长上复现形式1σ，几何平均比值为{ "0.9804" }。秩判据作为可恢复性边界未得到佐证：估计器从{ "0.782609" } h起即可恢复，而Gramian为{ "2.086957" } h，比值{ "0.375" }；在{ "1.826087" } h，即秩读数评为{ "4" }中的{ "3" }的最后一个前缀，恢复到先验位移的{ "1.96e-5" }。恢复边界在其自身界限的三个数量级内保持不动，而秩阈值在rel_tol的四个数量级内从“从不”跨到{ "0.782609" } h，两者在rel_tol = { "1e-8" }处恰好重合。该跨度最初曾记录为达到{ "0.260870" } h；那个数字是一个假象，由一次秩读数产生，它在{ "2" }个测量行低于f64噪声底的情况下数出了{ "4" }个方向，现已在此更正，而不是任其留存。秩读数现在受Sylvester不等式约束并给出原因，更正后的跨度恰好饱和于独立估计器能够恢复的那个弧长，这加强而不是削弱本行的交叉验证：已发表的{ "1e-6" }是一个保守的奇异值约定，而不是关于可恢复性的陈述。空间情形同理：NRHO为{ "9.290323" } h对{ "21.677419" } h，晕轨道为{ "22.978723" } h对{ "39.829787" } h，两者的可估计性都恰好一致。平面DRO六状态在任何弧长下都无法恢复，由一个未被告知此情况的估计器独立地复现了该族的结构性基准亏秩。没有外部锚定：动力学和初始条件与被测分析共用，且没有公开数据集发布这样的阈值，因此ExternalDataset被拒绝

seg-f839285852d9 = 由实际检索到的星座几何得到的月面服务体积

seg-c3059fcced49 = 接受表格化的月心状态星历（对SPK/BSP内核求值的结果）或<c1/>之后的已发表星座定义，对其运行相同的覆盖率 / DOP / 保护级扫描，并给出由此推出的 σ_URE测距要求，与保持不变的示意性开普勒及摄动结果并列，两者之差作为单独命名的量。每个数字都带有出处类别，区分由内核导出、由已发表轨道根数导出和由模型计算得出的三类，使下游引用时绝不会把它们混淆

seg-cbe9bd6bf989 = 几何是外部的并带有哈希：三套夹具，其数字只来自连同URL、检索日期和SHA-256一起检索到的文档，可由已提交的生成器重新生成，生成器会校验上游哈希，校验不符即中止，而不是输出数字，它们是LANS互操作性演示参考星座（NASA NTRS { "20250009447" }，SHA-256 d1b916be…）、LNCSS案例研究（NAVIGATION { "70" }({ "4" }) navi.613，CC BY，SHA-256 { "4e294687" }…），以及由JPL自己的重建内核经Horizons求值得到的、LRO、Danuri、Chandrayaan-2和CAPSTONE的真实在轨航天器星历。公开渠道不存在任何月面导航星座内核（Moonlight/LCNS、LCRNS和LNSS均未在轨运行，NAIF也没有为它们发布任何内容），也没有凭空捏造任何内核。导出的 σ_URE要求没有外部参考基准（没有人发布过{ "50" } m月面HPL在该服务体积上所要求的测距精度），因此它对照自身的代数恒等式检查，并且另以独立方式检查：在算得的要求值上重新运行整个扫描，确认可用性在该处翻转。实测：已发表的8颗卫星设计在{ "100" } % 覆盖率下需要 σ_URE { "2.9044" } m，而示意性星座在{ "37.85" } % 下为{ "0.3591" } m，这是按计划规则R4对一个已发表数字所做的{ "8.09" }× 修订。定性结论仍然成立（LNIS级的{ "30" } m仍无法满足{ "50" } m的南极HPL），但差距被夸大了八倍。5颗卫星的LANS演示得到零个保护级样本（五颗卫星无法给出单故障假设集所需的六颗共视卫星），要求字段缺失而不是编造；覆盖率为{ "0" } % 的四个真实航天器同样如此。InternalConsistency是诚实的一类：输入数据是外部的并带有哈希，但本行所涉及的量只与自身核对。{ "0.30" }外部比较，一项发现（仍为MODELLED）：对照navi.613的LNCSS案例研究在{ "346" }个网格点上的统计量，{ "12" }项可用性统计量中有{ "4" }项落在预先登记的{ "2" }个百分点之外（案例A：-4.0、+{ "22.5" }和 -3.6 pp；案例B：-12.1 pp）。可能的原因：轨道根数按错误的坐标系读取，在{ "15" }天内采用二体开普勒而论文未说明其力模型，以及网格无法根据文本复现。PDOP部分无法评估（LANS没有给出数值统计量）；该比较测试已提交但被忽略。{ "0.30" }第{ "2" }轮，一项发现（仍为MODELLED）：对照一个Orekit { "12.2" } / Hipparchus { "3.1" }参考基准，它计算整份报告（Orekit传播，DOPComputer可见性和DOP，Hipparchus组合的MHSS保护级，逐样本求解要求值；预先登记d3ce97b2），在全部五个检索到的几何和两个网格上，{ "160" }个值中有{ "155" }个在预先登记的判据内一致（{ "2" } pp、{ "5" } %、{ "1" } %），包括LNCSS A和C的sigma_URE要求（案例A双方均为{ "3.879072208" } m），以及LANS和各轨道器缺失的要求值。稠密网格上的LNCSS B在其最差样本统计量上未通过（sigma_required为{ "0.000923" }，对照{ "0.001511" } m；hpl_max为{ "1.63e6" }，对照{ "0.99e6" } m），近奇异的几何（PDOP约{ "1e6" }）放大了米级的位置一致性；其p95要求值一致（{ "1.6343" }对照{ "1.6357" } m）。最差样本要求值在退化几何上是不适定的。对照navi.613：{ "12" }项中仍有{ "4" }项在{ "2" } pp之外（已固定）

seg-36a6cfaf5afa = 为每个报告的量声明单位和出处

seg-12460501e82b = 一份机器可读的模式，为每个场景报告的每个数值字段给出单位、出处类别和定义；另有一个全局唯一的闸门，运行每一种已登记的场景类型，并在所发出的数值字段缺少其中任何一项时失败。出处词汇是封闭的，每个类别都带有一个证据等级，其中两个类别被有意映射到<c1/>和<c2/>，而不是被指派一个该类别无法决定的等级

seg-a8c4a6fd4989 = 所发出的文档本身：每个数值叶节点都必须解析到该文档自身units块中的某一条目。没有外部的单位登记表可用来核对已声明的单位，所以已声明的单位是经审阅的断言，而不是经验证的结论：闸门验证的是完整性和格式良好性，而不是真实性，说“已与独立参考基准核对一致”是错误的，因为没有任何外部来源确认<c1/>是名为<c2/>的字段的正确单位。曾对当时所描述的{ "1,434" }个字段做过一次独立的名称后缀交叉检查：在带有表示单位的后缀的{ "691" }个字段中，{ "40" }个与声明的单位不一致，这{ "40" }个全部得到解释（每秒后缀、最小值、孔径秒、牛顿米与看似纳米的后缀相对），因此没有发现错误的单位。此后没有重新运行该交叉检查，而覆盖范围已经超出当时的范围：这个数字保持为实际测得的数值，而不是按当前总数重述。在那次变更时（{ "0.27.0" }），覆盖范围从{ "56" }种类型中的{ "7" }种增至{ "61" }种中的{ "60" }种，字段从{ "1354" }个中的{ "389" }个增至{ "1,744" }个中的{ "1,742" }个（docs/field-units-schema.json，由一项过期检查保持其为最新）。没有任何类型仍未覆盖（上限{ "0" }，FUT-28，{ "0.36" }）：最后一个是<c3/>，其中两列由调用方指定键名，所以它们的单位是数据；现在它们被描述为<c4/>，每个位置的单位都从被扫描包自身的单位表读入<c5/>和<c6/>（或取自坐标轴声明的<c7/>，两者同时存在时必须与包中的一致；两者都不存在时为null，如实说明而不是猜测）。<c8/>是它之前的一个，当其已发布的文档增加了units块后，它就从清单上移除了：曾把<c9/>列为禁用键的可加性固定现在转而证明这一新增是可加的，即把该块再删除，文档的哈希仍等于在它出现之前冻结的两个常量，所以已发布的值若在该新增之下发生移动，仍会失败。这项工作还发现现有代码中有十二处单位或文档缺陷，已按R1报告而不是修复

seg-cf779c468eed = 由真实观测活动得到的月面坐标系基准

seg-96151f13a92b = 七参数Helmert基准协方差，其两项模拟输入被实测输入取代：计划是{ "337" }个已归档的ILRS月球激光测距标准点的地面发射历元（2015-04-08至2015-06-27，Grasse MeO { "7845" }和Matera MLRO { "7941" }，全部五个后向反射器阵列），每个观测权重是该点自身已归档的精度bin_rms/√n_raw，其单程距离的中位数为{ "5.13" } mm，直接读自文件。测站坐标取IERS ITRF2020，反射器坐标取JPL DE430表{ "7" }。可作为<c1/>场景类型运行。已验证的声明（{ "0.36" }）范围很窄：在解析默认路径上，基准协方差的计算与一个独立的SPICE光行时和NumPy参考基准在新的实测标准点上一致；它不是LLR的精度，也不是解析月球精确的证据

seg-50c60fc25ded = 闭式恒等式、一条仓库内独立的路线，以及自{ "0.36" }起在新的实测数据上的一个独立的SPICE与NumPy库参考基准（见下）；不存在可对照的已发表月球LLR基准协方差配对，所以不声称任何精度。唯一新增的导数，即距离对反射器体固位置的偏导，通过对它所求导的双程光行时做中心有限差分重新推导，这条路径与解析形式不共用任何表达式。物理参考基准是结构性的：距离的偏导就是视线方向的两倍，因此沿指向地球平均方向的体固坐标必须比两个天球平面坐标确定得好得多，后者只有天平动才能触及；在五个阵列上实测为{ "50.7" }× 至{ "71.7" }×，对照报告独立测量的天平动扫描，并同时给出各向同性小角预测和解释该差距的横向各向异性。变化之处：计划、观测数量和每个观测权重现在都是实测的；已归档的{ "349" }个点中使用了{ "337" }个，其余{ "12" }个被跳过并计数，因为ITRF2020没有Apache Point的位置。实测：基准平移sigma为{ "1.851746e-2" } m，而模拟观测活动为{ "6.3975" } m（{ "345" }×），旋转{ "36" }×，尺度{ "24" }×，这是激光测距网络与VLBI延迟网络之间的比值，所以是一项发现，而不是一次验证。反射器信息秩15/15，阵列间耦合恰好为{ "0" }；Helmert秩7/7，条件数{ "2.4e4" }。本行不声称的内容：该数字在绝对意义上是正确的。真实的LLR解会同时估计月球轨道、物理天平动、地球定向、测站坐标以及潮汐和相对论参数，并报告分米级（DE430表{ "7" }自身的0.12-0.27 m），而本界限要小得多；这是针对所述缩减参数集的Cramér-Rao界，而不是精度。在已验证的声明之外（按模型计算，未经验证）：月心星历和IAU { "2015" }天体方位是按模型计算的，而对流层、潮汐、测站偏心、极移、UT1-UTC、相对论延迟和测站时钟均不存在。它们合起来的大小是已发表的，而不是推论得出的：{ "337" }个点上单程距离的观测减计算RMS为{ "156,494" } m；它们对协方差的影响是有界的，而不是推论得出的：把整个基准重新求解，使每个偏导倾斜{ "0.1" }°（实测最差历元星历倾斜的两倍，符号交替），交付量仅移动{ "0.288" } %。外部检查（{ "0.30" }第{ "2" }轮，预先登记6b27964a），一项发现（仍为MODELLED）：SPICE双程光行时（DE440、ITRF93、DE440月球方位）加有限差分偏导，以及numpy求逆，在同样的{ "337" }个实测标准点和权重上，在记账、两个秩、零耦合、残差RMS（{ "2.1e-5" }）以及{ "16" }个协方差数字中的{ "15" }个上一致。z向平移sigma偏高{ "1.03" } %，而预先登记的判据为{ "1" } %。月心取自DE440后，降至{ "0.049" } %（c51f8b2，已见数据），在新的{ "2019" }年标准点上，内核月球基准满足每条判据（行“……，kernel Moon centre”），而解析月球也仍在判据之内（最差{ "3.8e-3" }，仅供参考），所以该比较并不能区分各种月球模型。解析路径的新数据运行（{ "0.36" }，在获取任何点之前即预先登记31f5283）：未更改的SPICE和NumPy参考基准，在{ "151" }个所用的EDC CRD v2标准点（2025-04..06，一个没有任何测试用过的年份；文件已重新获取，参考基准已独立重新运行，见夹具NOTICE）上，采用同样的判据：记账、秩、各阵列计数和零耦合相等；sigma与范数最差{ "1.11e-3" }（{ "1" } % 判据），条件数{ "8.95e-4" }（{ "2" } %），横向/纵向比值最差{ "1.79e-3" }（{ "2" } %）；SPICE O-C { "10.79" } m。仅就协方差计算而言，据此证据作为库检查得到VALIDATED；该时段上的解析残差RMS为{ "222" } km，所以这些判据无法区分各种月球模型（与内核那一行相同）。结果：docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md

seg-c815cb90dcde = 月面参考站大地测量：对照五阵列基准新增的后向反射器与VLBI信标

seg-103cf21173ac = lunar-llr-datum场景上可选的extra_reflectors和extra_beacons输入会增加一个station_geodesy块：来自已归档月球激光测距时段的五阵列Helmert信息，加上在所述站点新增的后向反射器（在测距站位于其地平线以上的已归档标准点历元上测距，每个点使用该标准点已归档的权重）和新增的VLBI信标（由lunar-frame-campaign网络与计划观测，地球测站固定，经由lunar-vlbi-fim延迟偏导）对七参数基准所增加的信息，重新求解，并给出每个Helmert参数前后的1-sigma、其比值、前后的范数以及Fisher差的极端特征值。缺省或为空时，报告保持不变

seg-479a7e6bbedb = 仅为内部自洽：每个新增站点都是一个不同的点，一次激光测距或一次固定测站的VLBI延迟只涉及一个点，所以其信息A_p^T M_p A_p是半正定的并可累加；测试据此检查Fisher差和每个方差。五阵列的结果即现有的真实数据行，保持不变。新增的反射器沿用为五个现有阵列安排的历元，这是ILLUSTRATIVE的计划，而新增信标的网络、计划和延迟sigma是lunar-frame-campaign的ILLUSTRATIVE输入；该站点是ILLUSTRATIVE的南极位置。南极站点看到的地球在其地平线上很低或完全看不到，现有的视角测试已对此作了表达；两个站点都不是连续测距的。这些数字是缩减参数集的Cramer-Rao界，不是解出的基准，也不是对任何真实测站的说明

seg-d9f033ebf109 = 由真实观测活动得到的月面坐标系基准，月心取自星历内核

seg-6f272a06c9f3 = lunar-llr-datum的七参数Helmert基准协方差，来自已归档的ILRS标准点及其实测权重，走内核路径：地心月球中心由引擎自带的内核读取器从JPL DE440读出（planetary_kernel_path；lunar_llr::llr_geometry_with、ephem_provider::KernelEphemeris）。与解析行相比，只有月心不同；IAU { "2015" }方位、缺失的极移和UT1、星表、选取规则、权重和线性代数都相同。已验证的声明只是：该路径的基准协方差与一个独立的SPICE和NumPy参考基准在新的、未见过的标准点上一致。该比较并不区分各种月球模型，也不检查月心：在同一时段上，解析月球同样通过每条判据，预先登记的变异（内核月球晚读一小时）没有被检测到，月心偏差约{ "4,650" } km同样通过（见参考基准的文字）。它不是内核月球改进了基准的证据。可作为带planetary_kernel_path的<c1/>场景运行（另一时段另加normal_points_dir）

seg-ec47513b1828 = NAIF SPICE Toolkit N0067（spiceypy { "8.2.0" }，MIT）在DE440上的双程光行时、ITRF93地球定向和DE440月球方位（MOON_ME），采用{ "100" } m有限差分偏导，以及numpy { "2.3.5" }（BSD-3-Clause，LAPACK）的信息矩阵与逆矩阵：即解析行比较所用的未更改的生成器（6b27964a），在一个新的时段（EDC CRD标准点，2019-04..06）上运行，该时段在获取其中任何数据之前即已在830d945a中预先登记，采用解析行的判据（sigma和范数{ "1" } %，条件数和比值{ "2" } %，记账、秩和耦合须精确一致）及其参考基准自检（SPICE O-C { "10.86" } m < { "100" } m）。每个量都成立，最差{ "7.6e-5" }。变异：计划中的一小时月球延迟没有被检测到（协方差取决于视线方向的分布，而不是其时序）；事后选定并如实披露的一个结构性变异，即去掉下行链路偏导，使每个sigma都失败。发现：在该时段上解析月球同样通过（最差{ "3.8e-3" }），所以该判据无法区分各种月球模型，这验证的是新数据上的协方差，而不是内核月球的改进。折叠处的积分器检查（未预先登记）：内核月球改为相对地月质心而不是相对地球读取（残差RMS { "4,649" } km），以及内核历元缺少TT减UTC（{ "69" } s；残差{ "2.6" } km），二者仍通过每条判据，而从实测权重中去掉sqrt(n_raw) 则使全部{ "16" }个带判据的量失败；该比较对权重、偏导和线性代数敏感，而对月心不敏感。两侧读取的都是DE440：这验证的是在DE440上的计算，而不是DE440本身。在声明之外：LLR精度（针对缩减参数集的Cramér-Rao界）

seg-bd3af378b613 = 内置的解析月球星历：其所述的精度界限已对照真实数据检查

seg-a51c4e234a4f = ephem::moon_position，即该crate在没有DE/SPK内核时回退使用的低精度地心月球级数，对照真实月球激光测距以及同一时间跨度上的已发表行星星历进行测量。本行验证的是该模块对自身所述的界限，而不是精度：确认的是该级数不比它自己所说的更差，而不是确认它很好

seg-81dff68ddd9c = 两个互不相干的独立外部数据集。（{ "1" }）{ "337" }个已归档的ILRS月球激光测距标准点（EUROLAS Data Center，DGFI-TUM，2015-04-08至2015-06-27，五个后向反射器阵列，附带逐文件SHA-256和重新下载并验证的脚本）：单程距离观测减计算RMS为{ "156,494" } m，测站坐标取自IERS ITRF2020，反射器坐标取自JPL DE430表{ "7" }，所以残差由月心级数主导。（{ "2" }）同一时间跨度上的JPL Horizons几何地心月球状态：径向RMS { "112,567" } m，矢量RMS { "195,655" } m，最差历元{ "360,324" } m = { "0.0536" }°。距离残差对星历误差的径向分量有响应，所以（{ "1" }）与（{ "2" }）是通过两种途径得到的同一个量，彼此一致到{ "1.39" }×，这正是允许lunar-llr-datum场景把其残差归因于星历的依据。引擎自带的模块文档声称为 ~{ "0.3" }° / ~数·10² km；两项测量都在其范围之内，其中角度声明有{ "5.6" }× 的裕量。范围，特此说明，以免读者误解：这验证的是所述的界限，而不是精度数字。该级数仍不适用于需要优于 ~{ "1e5" } m的任何应用，而这一限制与一致性同样是本行的内容。可由已提交的获取并验证脚本离线重新生成

seg-44f582b17fa9 = 闸门完整性：绿灯就意味着它所说的

seg-43fbcfbe990c = 针对验证过程本身的三项结构性防护，各自堵住一类曾以间歇性或虚假红灯的形式进入规范闸门的缺陷。（{ "1" }）Rust源码中每个构造出来的临时路径都必须带有每次调用唯一的组成部分；进程号会被拒绝，因为cargo把库测试作为同一个进程的并行线程运行，而进程号为它们全体所共用。（{ "2" }）每一个逐字节或哈希固定都必须在自身旁边或其模块头部声明它涵盖什么、又有意排除什么，这样，一项跨领域的变更就能一眼看出哪些固定在其范围之内，哪些已经悄然变成整个仓库范围的变更检测器。（{ "3" }）只有完整套件才能声称绿灯：scripts/gate.sh运行<c1/>，在中间没有管道的情况下捕获真实退出码，并写出一份回执，注明提交、集成二进制数、测试数和耗时；推送前检查会拒绝这样的推送：在干净的工作树上，没有任何有效回执指明其提交。可重复性由scripts/check-repeatability.sh另行抽样，它把库套件运行N次，并在通过的测试集合不一致时失败。

seg-17a5f9da54a4 = 闭式：每个防护都在一段固定的已知有缺陷的代码片段（必须触发）和一段固定的已知正确的代码片段（必须保持静默）上运行，两者都是检测器无法影响的字面常量。两个已知有缺陷的片段就是原始形态下的F22和F25缺陷。这是内部参考基准，因此本行相应为MODELLED：它证明这些防护能把缺陷与其修复区分开来，而不是证明它们所描述的类别已穷尽。其所述的盲区（不是路径的共享状态、保存在简短具名常量中的固定、三次运行无法抽样到的罕见竞态，以及任何能写入该文件的人都能伪造的回执）都已写在tests/source_guards.rs的模块文档和每个脚本的头部，而不是留待日后发现。

seg-178192c9c87a = 组合授时PL：标量MHSS特化（H=1_N）

seg-431aaf94ec31 = 异构来源上的标量时间解分离TPL；PL由最差排除子集的噪声加UTC(k) 偏差驱动

seg-9a5ea79248c8 = P2：numpy { "2.3.5" } linalg.lstsq和scipy { "1.18.1" }（norm.isf、norm.sf、brentq）以各自的算法，在{ "300" }个已提交的输入上（tests/fixtures/tpl_scalar_numpy_oracle）重新计算子集加权最小二乘估计量、一般分离协方差sqrt(Δ Σ Δᵀ)、偏差以及由它们得到的保护级；PL的相对一致性在{ "1e-9" }以内（最差{ "1.2e-10" }），驱动的排除子集完全相同，容差在比较之前固定。乘数、先验和偏差上界是输入，PL方程的结构（模式列表、ir/2拆分、偏差投影）是给定的输入，与月面ARAIM保护级内核那一行相同；已验证的声明是线性代数以及这些输入上的PL，而不是授时场景的物理量级。ARAIM的渊源Blanch { "2015" } / Joerger { "2014" }

seg-b7cd952ff133 = 组合授时PL：以P0为种子的守时（holdover）穿越

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ))；下半连续PL({ "0" }+)≥PL({ "0" }−)；K(IR/2) 滑动最大值；τ/τ³/τ⁵ 相位指数

seg-1438193381be = 性质测试（单调性、交接时不下降）加针对holdover::coast_phase_variance的指数检查

seg-3ab4509b62a2 = 组合授时PL：守时（holdover）包络覆盖，多年期区段（tau>=90d）

seg-d9520f6c1769 = 滑动最大值包络在不相交的区段上，对每个被测滞后tau>=90d的真实计量序列都构成上界覆盖（零穿越）；短tau（<=30d）是已披露的按模型计算的边界

seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] 5天序列MJD 56074-60429（{ "872" }个点，webtai API）；拟合与测试不相交，多年期零穿越覆盖

seg-096b6cdfe2dc = 组合授时PL：LIL a.s. 包络（不可能性与一致性）

seg-1671add2210d = 不存在有限的最坏情形守时（布朗运动的上确界发散）；当IR→{ "0" }时，按IR分配的HPL与Hartman-Wintner包络一致

seg-c9ed8bbede70 = 闭式a.s. 包络 √(2Dt·lnln t) 恒等式加HPL支配性检查；Baweja arXiv:{ "2606.24210" }不可能性接缝

seg-5a27c9f0a67d = 异构UTC(k) 可溯源性偏差的完好性上界

seg-fd09ab2adbf6 = 每个来源的偏差上界b = (U/k_cov)·Phi^-1(1-tail/2) + 老化，把已发表的B类扩展不确定度放大为分配到的完好性尾部；以bias_s的形式桥接到tpl_scalar

seg-1fd53acf9a3f = 对上界闭式的独立numpy加标准库statistics复现（InternalConsistency）。BIPM Circular-T [UTC-UTC(USNO)] 序列仅为被引用的输入：它就是已经就R4守时覆盖那一行与外部参考核对一致的同一序列，在此并未重新验证；复现其数值对R2没有任何证明作用。深层完好性尾部是按模型计算的。{ "0.30" }外部比较，一项发现（仍为MODELLED）：在BIPM各实验室的UTC-UTC(k) 文件上（{ "102" }个实验室，{ "105 024" }行带有已发表的不确定度），在{ "1e-2" }尾部处的上界b = { "2.576" } u被{ "50.8" } % 的行超出（Clopper-Pearson { "95" } %：{ "50.4" }至{ "51.1" } %），并且在{ "102" }个实验室中的{ "101" }个，超出比例都大于{ "1" } %。已发表的u是BIPM对UTC-UTC(k) 的测定的不确定度，而不是对偏移量的界限，偏移量常常达到u的许多倍；按所规定的方式，该上界并不能界定真实的UTC(k) 可溯源性偏差。{ "0.30" }第{ "2" }轮，一个对实现的UTC-UTC(k) 偏移的上界，以2015-2022年的数据训练，在2023-2026年的BIPM Circular T数据上测试（预先登记ca0921a4，合并超出率至多{ "1e-2" }），一项发现（仍为MODELLED）：合并超出率为{ "0.0333" }（{ "82" }个实验室的{ "20 826" }行中有{ "694" }行；去掉按规则没有界限的{ "430" }行后为{ "0.0127" }）。D9第{ "3" }轮，一个合并的分层老化界限（utck_bound），预先登记fb475550，并对自{ "465" }期起的Circular T各期做前瞻评分：尚未运行（第{ "465" }期于2026-10-12发布，约有{ "285" }个测试值；预先登记的1000值规则需要到约第{ "468" }期，而运行需要已归档的2026-09-30各实验室文件，因为BIPM此后已改写了{ "113" }个中的{ "87" }个）

seg-d75b900ad25f = 相关的可溯源性偏差互协方差（共模不安全的分配）

seg-0641f6d38c23 = N×N偏差互协方差，对共用同一UTC(k) 实现者的来源，非对角元为rho·b_i·b_j；已证明correlated_fused_bias >= independent_fused_bias（朴素的独立分配会低估融合偏差，从而偏乐观，因而不安全）

seg-72359f29aab1 = 对互协方差以及相关与独立融合偏差不等式的独立numpy复现（InternalConsistency）。具代表性的来源集；按模型计算的场景。

seg-0359a9194c60 = GLS共模白化（Aitken）加Mahalanobis恒等式

seg-67b11ff6d055 = 手写Cholesky Omega=LL^T与前代白化z=L^-1 r（当Cov(r)=Omega时Cov(z)=I）；Mahalanobis平方z^T z = r^T Omega^-1 r

seg-7dfedc40da6a = lunar-time-budget场景的可选 [time_lab] 块对月球参考站时钟建模（默认为miniRAFS等级，或任一具名等级，或按所述稳定度点拟合的器件卡），该时钟被牵引到协调月球时，随后自由运行或每N秒重新牵引一次：时间误差曲线x(t) 为时钟幂律项、常值牵引残差（ILLUSTRATIVE）、常值LTC实现残差以及可选启用的测站高度速率项的方和根；牵引后到达{ "1" }、{ "10" }和{ "100" } ns（或所述阈值）的时间，由二分法给出，并附主导噪声类型的闭式反解，以及每个所述时效上的主导项，全部带单位

seg-3801e9b32309 = 仅为内部一致性：二分得到的到达阈值时间对照时钟主导噪声类型的闭式反解检查，自由运行的时钟项对照预算自身的时钟项检查。各时钟等级依据已发布的一日规格（有各自的行）；LTC速率未在此重新推导，保有自己的VALIDATED行（月球坐标时）；牵引残差为ILLUSTRATIVE，实现残差是预算分配，且不包含热模型。ICG WG-B月球PNT资料（{ "2024" }年六月）所述的纳秒级目标仅作为来源陈述引用，未被采纳为声明；此处没有任何内容是关于真实测站时钟的陈述

seg-226dedaba243 = 一个独立的scipy/numpy程序积分同样的变分方程（判据O1）。没有任何内容与月球轨道的测量值比较。该参考基准核对的是所述公式的数值，而不是物理，因此该行仍为MODELLED。受限三体模型：没有太阳，没有月球谐项，地球自转轴沿轨道法向，接收机和测站输入为ILLUSTRATIVE。

seg-c0ba5c7e708e = <c1/>类型：参数化的信号设计（频段、发射带宽、ITU划分；含BPSK(n)、BOC(m,n)、MBOC或平坦谱的捕获、数据和导频分量，功率份额，FDMA子载波，码长和数据速率），来自编译进来的公开预设文件（Xona Pulsar、Iridium STL、Starlink机会信号、CentiSpace、一个通用C波段设计以及通用UHF/L/S/C/宽C设计，每个都带有其来源网址，未公开的数值标注为REPRESENTATIVE）或内联编写；每个信号给出带限功率谱密度、带内功率占比、Gabor带宽、码抖动对C/N0和间距的关系以及测距精度、捕获搜索空间、平方律检测概率以及平均串行和码并行捕获时间、进出GPS L1 C/A、Galileo E1、GPS L5、Galileo E5a、E5b和AltBOC的谱分离系数及C/N0劣化，以及取自频谱类型SSC链的CW、宽带和匹配J/S容限；电离层延迟、自由空间损耗、等C/N0和等EIRP下的测距精度以及干扰容限的频段权衡；以及设计对照所描述测量的定性形状检查

seg-040b3f5cc70e = 上面两行已独立核对的闭式解，平方律虚警恒等式P_d(snr = { "0" }) = P_fa和Holmes的平均捕获时间，以及归约到频谱类型自己的SSC链（同一份Jammer::ssc代码）。设计本身是输入：标注为REPRESENTATIVE或WORKSHOP的预设不是已发表的规范，增强型Feher QPSK、码移键控和OFDM谱是近似的，形状检查比较的是形状，而不是校准过的电平。

seg-4b47033cda24 = leo_link::presets：通用多频段（UHF、L、S、C）、通用C波段、Xona Pulsar X1/X5、Iridium STL、作为仅多普勒机会信号的Starlink、CentiSpace，以及一个可选的Celeste IOD预设，每个都把来源标注为PUBLIC（附网址）、REPRESENTATIVE或WORKSHOP，工作坊的那一个在可选的Celeste IOD预设文件中，仅当该文件存在时才编译进来；每个频段和轨道在场景中都可覆盖，场景也可以完全不指名任何预设

seg-5130bfe2410c = 与系统无关的输入：每个系统都是沃克壳层、显式根数或GNSS预设，一个信号（载波、码速率、带宽、接收功率或C/N0范围），一个SISRE，一个多普勒sigma和一个钟模型；预设只填补场景遗漏的部分，每个一个文件，来源标注为PUBLIC（附网址）、WORKSHOP或派生，未公开的数值列为具代表性：Xona Pulsar X1/X5、Iridium STL、Starlink机会信号、CentiSpace、一个具代表性的C波段系统、ATOMIC零钟差星历模型，以及可选的Celeste IOD预设文件中一个源自工作坊的预设，删除该文件及其场景即可将其撤出

seg-29e58493fdd4 = 由模型计算得出

seg-298cc35fe9d1 = 惯性

seg-b03984610dc0 = 月球

seg-f1f903f1b9ff = 韧性

seg-bd64cfb4dc52 = 轨道外推与星座设计

seg-a7cfe6f135f1 = 轨道与几何

seg-3060564c3e21 = 666/666个AIAA向量 · { "4.12" } mm

seg-5b265eaf8f29 = 基于真实两行根数（已提交的Celestrak GPS快照）或合成Walker星座的SGP4/SDP4外推，后者的平均根数实现i:T/P/F公式，{ "24" } h内偏差小于{ "1" } km。包括多星座可见性、精度因子和GNSS可用性，星座设计优化器，覆盖带尺寸设计，以及在轨道面数 × 卫星数网格上报告帕累托最优设计的Walker设计扫描。

seg-66e33b899daf = Cowell外推器与六摄动力模型

seg-a5a572db3bed = 数值外推器

seg-52a4410a54da = 保守等级< { "0.08" } m / { "24" } h，对照Orekit { "12.2" }

seg-463ed85c6e40 = 一个与解析SGP4/SDP4路径互补的数值（Cowell）外推器，采用分层力模型：二体 + 完整的J2–J6带谐场，可选的EGM2008田谐地球重力位（阶/次至{ "70" }），由历元驱动的太阳和月球第三体引力（内置星历，不用DE/SPK核），带锥形本影/半影的太阳辐射压，大气阻力，后牛顿Schwarzschild相对论修正，以及Lense–Thirring框架拖曳项；由RK4步长倍增或Dormand–Prince RK5({ "4" }) 自适应积分器两者择一驱动。

seg-797370a2faef = 点火、Lambert与porkchop

seg-57b120fb0aac = 机动与轨迹设计

seg-5081c84dfdd7 = Tsiolkovsky < { "0.01" } % · Lambert往返回到二体真值

seg-da6b16ebd59b = 带{ "6" }×{ "6" }协方差传播的脉冲 ΔV节点，对照Tsiolkovsky火箭方程核对到误差小于{ "0.01" } % 的有限推力点火积分，Izzo-2015单圈Lambert求解器和精确的通用变量Kepler外推器，以及以JSON等值线网格输出的porkchop（发射 × 到达）C3 / 到达V∞ 扫描：位于GMAT/Orekit之上的性能仿真层。

seg-831552a45712 = 时间尺度与地球定向坐标系

seg-76b323512350 = 时间系统

seg-60208bd726eb = 与SOFA/ERFA逐位一致 · Vallado端到端{ "4" } mm

seg-42373dd9ca64 = IERS含闰秒的UTC / TAI / TT / UT1时间尺度，儒略日API，IAU-2000地球自转角，基于GMST的TEME ↔ ECEF与WGS-84大地坐标系，完整的IAU 2000A/2000B章动和IAU { "2006" }岁差，以及基于CIO的无春分点IAU 2006/2000A GCRS↔ITRS归算（含IERS极移）：已与SOFA/ERFA向量逐位核对一致，并与ANISE（纯Rust的SPICE）独立交叉核对：GCRS→ITRS对照ANISE ITRF93，使用相同的IERS EOP，地面处相符至 ≤ { "0.86" } m，GNSS轨道处相符至 ≤ { "3.6" } m。

seg-dd766880e73a = 实时地球定向预测

seg-54169bca19e9 = 对照已存档Bulletin A的{ "12" }个提前期：UT1 { "2.93" } ms，极移{ "1.76" } mas

seg-81be07e41d1c = 一个运行级风格的地球定向预测器：在尾随窗口内对偏置、速率和主要周期项做最小二乘，并对照真正已存档的Bulletin A预测来衡量，而不是对照持续性。离线默认输入是一份带有Bulletin A预测行的真实IERS finals2000A产品，因此直接运行即可输出填充好的各提前期表格，而不是空表。UT1与极移连同它们的组合在同一组行上报告，所以联合数字是一个统计量，而不是两个不同样本的二次和。

seg-0e18bc4add10 = 捷联INS与地图辅助导航

seg-26561c9a96a7 = 第一性原理CAI加速度计 · 推导的VRW与独立积分器交叉核对

seg-d18714ee32fb = 三轴捷联INS：四元数姿态，WGS-84 NED机械编排，圆锥/划桨补偿，以及完整的确定性IMU误差模型；外加第一性原理冷原子干涉仪加速度计（Mach–Zehnder相位、投影噪声、对比度衰减、振动耦合），以及用于地形/重力参考GPS拒止导航的粒子滤波器。

seg-0e44bdf12d16 = 中断期间的惯性与地形相对滑行

seg-07cb40aa5cd1 = { "10" } m出现在{ "249" } s，{ "50" } m出现在{ "595" } s，两处均以加速度计偏置为主

seg-d5df17e4425b = 由IMU误差预算得到的位置误差随滑行时长的变化：偏置、随机游走和比例因子，各有自己的增长规律和各自在越限中所占的份额，因此导航中断的代价是一条计算出的曲线，而不是扫描出的漂移率。阈值越限是引擎输出，每一处都注明主导贡献，涵盖四个IMU等级；地形修正间隔在自己的块中评分，因此主要的越限结果保持无辅助。

seg-6631a5d69c84 = 重力、地形与磁场地图匹配

seg-6af8e99df46d = 替代PNT（GPS拒止）

seg-72527f4459c7 = 60分钟GPS拒止 · ~{ "145" } m（< { "500" } m）

seg-89bd5fb3e90b = 一个冷原子重力仪测量模型，其白噪声下限由CAI加速度计物理推导而来；一个低阶全归一化球谐重力异常场外加合成质量瘤；以及一个重力图匹配粒子滤波器；并扩展到对照SRTM高程DEM的地形参考导航（TERCOM/SITAN）、阶/次至{ "13" }的IGRF-14地磁主场，以及融合全部三个标量通道的重力 + 磁场 + 地形组合导航器。一个60分钟GPS拒止基准测试：约{ "700" } km、持续一小时的中断，其间惯性解漂移到约{ "70" } km；由分层由粗到精的匹配器恢复到约{ "145" } m：即ESA NAVISP Quantum Wayfarer目标。

seg-dbd63be796ff = GNSS / INS传感器融合

seg-f9582184adea = 融合

seg-f2166e96405f = 紧耦合UKF · { "0.77" } m RMS

seg-d6ad19d1d47b = 一个15状态误差状态EKF，在GNSS中断期间依靠已校准的惯性解滑行；一种紧耦合伪距模式，在可见卫星少于四颗时仍持续修正；一个耦合的时钟 + 位置滤波器；一个通用的无迹（sigma点）卡尔曼估计器；一个紧耦合GNSS/INS UKF导航器，在弯曲的LEO过境上经过{ "120" } s中断验证达到{ "0.77" } m RMS；以及一个完整的17状态紧耦合GNSS/INS UKF，其量子CAI航位推算依靠冷原子加速度计推导出的速度随机游走来滑行通过中断。

seg-4af862bd1307 = 批处理与序贯定轨

seg-ca67c864635c = 定轨

seg-948441304a32 = 批处理 + 序贯定轨，对照Orekit { "12.2" } BatchLSEstimator/KalmanEstimator

seg-22e738b2ab57 = 由地面站测距跟踪恢复轨道状态，将二体 + J2力模型和RK4积分器与高斯–牛顿批处理微分校正器（无噪声测距下为亚米级 / mm·s⁻¹，{ "5" } m噪声下限下约{ "2" } m）以及序贯无迹滤波器变体组合起来。

seg-06406b3d0b88 = Fisher信息与可观测性

seg-4e28248ef77b = 可观测性与估计理论

seg-a5b38d0a8d64 = 特征值对照numpy.linalg.eigh · CRLB对照经numpy.linalg.inv得到的 σ²(XᵀX)⁻¹ · 由信息矩阵得到的GNSS DOP，均到{ "1e-9" } · Kay（{ "1993" }）闭式解 + 蒙特卡罗CRLB达到情况

seg-3ee5597d6f8a = 一个通用、可复用的Fisher信息 / Cramér–Rao层（src/fim.rs）：信息矩阵M = HᵀWH、Cramér–Rao下界、可观测性秩和基准缺陷零空间（Moore–Penrose伪逆），以及由对称Jacobi特征值求解器得到的D/A/E/T最优实验设计标量。它支撑DOP引擎、被动地理定位界限，以及月球绝对站点可观测性结果：内部测距会留下六自由度刚体基准缺陷，对稀疏星座而言，地球基线VLBI连接可将其恢复，对丰富星座则可使其更锐化，绝对基准在三个不共线的地球站处闭合。

seg-ed467622dbd0 = CR3BP外推与LunaNet完好性

seg-e386dced1d16 = 月球与地月空间

seg-f444bc39efbe = 复现已发表的L2 { "9" }:{ "2" } NRHO（周期约{ "6.57" } d · 近月点约{ "3,250" } km）；STM对照有限差分核对

seg-272afbca5e48 = 一个旋转坐标系中的地月圆形限制性三体（CR3BP）外推器：守恒的Jacobi常数和全部五个拉格朗日点，带{ "6" }×{ "6" }状态转移矩阵和单次打靶微分校正器，可生成真正周期性的晕轨道 / 近直线晕轨道（NRHO）：它复现已发表的L2南向{ "9" }:{ "2" } NRHO（Gateway轨道），周期约{ "6.57" }天，近月点约{ "3,250" } km。外加LunaNet / LNIS地月空间PNT几何（MCI↔MCMF归算、月面坐标），以及一次月球南极ARAIM过境，它如实暴露出完好性缺口：约{ "30" } m的 σ_URE使保护级远高于{ "50" } m的告警限值。

seg-619f89bf160c = 月球参考坐标系实现

seg-c6b12768a219 = 对照numpy/scipy Umeyama–Horn SVD

seg-29327b86ea27 = 由观测活动实现月固坐标系：对站点–反射器几何做加权高斯–牛顿相似变换拟合，报告基准、其协方差和确定得最差的坐标轴。耦合的坐标系与时间尺度规范被明确保留而不是被吸收，因此秩亏在报告中清晰可见，而不是埋没在伪逆里。

seg-b3ba1e7b197d = 月球导航服务区与ARAIM

seg-353878596468 = ANISE { "0.10.2" }轨道 · RTKLIB 2.4.2-p13

seg-70b9c02c1f6a = 在月面坐标网格上扫描一个示意性的Moonlight/LCNS级星座：可见性、精度因子、覆盖，以及对照可配置告警限值的逐历元ARAIM保护级。空间信号测距精度是一个参数，因此该扫描回答的是整个服务区内的测距要求，而不是在某个固定值上的通过/不通过。

seg-a94db5b03c9c = 跨提供方的月球互操作预算

seg-a2e8a8dfd666 = DE440 · INPOP21a · EPM2021，经calceph

seg-646a00230694 = 衡量三种独立的权威月球星历实际相差多远，并将其转化为一条设计规律：混合提供方用户所继承的坐标系与星历误差预算，以及提供方为将该预算保持在规定界限内必须维持的一致性容差。

seg-0f359c118090 = 自主自由网故障可观测性

seg-ae99396c03bd = 对照独立的numpy/scipy奇偶代数

seg-51828c93731b = 自参照月球星座在没有地面真值时检测自身故障所需的线性代数：以秩亏伪逆形式给出的、在基准与时间尺度规范下仍然成立的加权奇偶投影，逐节点可检测性，Baarda最小可检测偏差，以及基于真实DE440节点间几何的拜占庭块火花检测/识别计数。

seg-8e69193ca540 = 一个与框架对齐的评分引擎（DHS RPCF类别），把某个架构的仿真行为映射为各维度的子分数，然后检验任何单一的综合分数或成熟度等级是否构成稳定的决策依据：通过Dirichlet权重单纯形、Kendall-tau排序不稳定性、top-1胜者翻转率和共模多样性坍缩（Hill-N2），并给出带完整性哈希的保障报告。可通过cargo run --example resilience_report复现。由模型计算的合成架构，与RPCF v2.0对齐；这是一项自我评估，不是认证。

seg-aab745a65e76 = 模块

seg-d4ad9cfa4f9b = 依据ARAIM机载设计文档（ADD）v4.2的ARAIM多假设解分离（araim_reference::add_v42_protection_levels和add_v42_protection_levels_ecef：按P_THRES与FC_THRES规则确定子集、VPL、HPL、有效监测阈值EMT以及sigma_acc）；带单星排除的卡方快照RAIM故障检测（raim::snapshot_raim、raim::snapshot_raim_fde），以及在大地测量当地水平面上基于斜率的HPL/VPL；以及L1服务上的SBAS DO-229E保护级组合（sbas::sbas_protection_level）。明确说明，未涵盖：均匀sigma便捷函数raim::araim_raim和raim::araim_dual_raim不满足ADD要求（在匹配的输入上，它们相对Stanford MAAST的偏差分别为VPL { "0.75" } m / HPL { "4.04" } m和VPL { "0.39" } m / HPL { "1.93" } m，这是一项发现）；双频多星座（DFMC）L5 SBAS比较是一项发现（{ "308" }个视野内无GEO的用户历元对由Kshana给出保护而MAAST未给出，Kshana未对MAAST的GEO接收门限建模）；raim::solution_separation_raim没有外部比较

seg-ad475816bc78 = 可选启用的EGM2008田谐场（至阶数/次数{ "70" }），作为数值Cowell ForceModel的中心引力，在由IAU { "2000" }地球自转角（或CIO GCRS到ITRS链路）旋转得到的地固系中求值；默认关闭，因此现有输出均不变

seg-e6db530c96c7 = Orekit { "12.2" }（CS GROUP，Apache-2.0）NumericalPropagator/DormandPrince853，配HolmesFeatherstoneAttractionModel，使用相同系数（tools/egm2008_to70.gfc），在按同一地球自转角公式旋转的本体系中，作为单独程序运行。判据已预先登记（f0e0e65，在任何比较之前于2da899a修订）：|dr| <= { "0.5" } m且 |dv| <= { "5e-4" } m/s，且两个负对照的偏差均 > { "100" } m；全部达到，随后判据收紧至{ "0.1" } m和{ "1e-4" } m/s。未经独立核对：地球定向保真度（两侧在Era系中均采用UT1 = TT且无岁差章动）、Cio系选项（仅内部检查）、高于{ "70" }的阶数

seg-e8f5ff8c9149 = 高阶球谐重力（EGM2008至{ "2190" }）

seg-d3b2f32dcecb = 对至{ "2190" }阶的全归一化场做防下溢、防极点奇异的求值（SphericalHarmonicField::acceleration_hf / potential_hf，Holmes-Featherstone { "2002" }改进前向列递推，梯度不含1/cos phi），流式ICGEM .gfc加载器（from_gfc_file / from_gfc_reader；完整的EGM2008在运行时获取，不随附），以及可在可选启用的Cowell Geopotential上选用的Holmes-Featherstone求值器

seg-8651532685f3 = Orekit { "12.2" }（Apache-2.0）HolmesFeatherstoneAttractionModel和pyshtools { "4.14.1" }（BSD-3-Clause）MakeGravGridPoint，作为单独程序运行；判据已预先登记于xval/high-degree-gravity/PREREGISTRATION.md（276c869f）和xval/cowell-tesseral-200-orekit/PREREGISTRATION.md（0aa312a6）。Orekit在其有定义之处全部一致，但pyshtools在两个近极点处未达到其预先登记的判据（最大{ "7.3e-10" } m/s^{ "2" }；50位mpmath核对表明误差在pyshtools一侧），极轴正上方没有参考基准（oracle）的值，且{ "24" } h轨道的预先登记70阶敏感度对照未达标（{ "0.726" } m，而要求 > { "1" } m）。每一次未达标都已记录，而非调参掩盖，因此该行仍为MODELLED

seg-e81b7418c382 = DOP853积分器

seg-e6e3638aa68e = Hairer DOP853 { "8" }({ "5,3" }) 显式Runge-Kutta，配5阶/3阶组合误差估计器、SciPy/Hairer步长控制器、自动初始步长、失效即关闭的步长保护以及7阶稠密输出；可作为传播器Integrator变体Dop853 / propagator::propagate_dop853选用

seg-6ea79a5b89e9 = SciPy { "1.18.1" }（BSD-3-Clause）solve_ivp(method=DOP853) 及其单步、误差范数、稠密输出和初始步长例程，属独立实现；精确二体状态来自mpmath { "1.3.0" }，取{ "40" }位。判据已预先登记于xval/dop853-scipy/PREREGISTRATION.md（ae1b25e），早于首次比较；全部达到（xval/dop853-scipy/RESULTS.md）。完整运行中，SciPy的第一步长同时给予两个求解器；初始步长例程单独比较。未涵盖：RKF7({ "8" })、刚性检测、事件定位

seg-9ad7c1f4da77 = 稳健的开普勒方程求解器

seg-4b9d812fd13e = 适用于所有{ "0" } <= e < { "1" }及所有平近点角的椭圆开普勒求解器：Markley（{ "1995" }）三次起始值与五阶修正，无抵消的残差 (1-e)E + e(E - sin E) - M，以及带保护的Newton精修（kepler::solve_kepler_markley、propagator::solve_kepler_robust）

seg-6fedaf34608d = mpmath { "1.3.0" }（BSD-3-Clause）由精确二进制输入得到的50位根。判据已预先登记于xval/kepler-mpmath/PREREGISTRATION.md（df22174），相对 |E| 表述，并附e -> { "1" }、M -> { "0" }的条件数论证；全部达到（xval/kepler-mpmath/RESULTS.md）。旧有求解器（solve_kepler_checked、orbit::solve_kepler、ephem::solve_kepler）在数值上保持不变，因为已提交的输出依赖它们，且不在该行的覆盖范围内

seg-1960804ef2f4 = 带测站遮蔽的测距速率与方位/俯仰批处理定轨

seg-4c185244bc66 = 对高于仰角遮蔽的测距、测距速率和方位/俯仰混合跟踪数据，用Gauss-Newton法在H = (dh/dx(t)) Phi(t, t0) 上恢复历元状态：解析的测量偏导数，以及带解析二体 + J2偏导数的变分状态转移矩阵（RK4积分，而非闭式STM）

seg-6c6a42c25433 = Orekit { "12.2" }（Apache-2.0）BatchLSEstimator，配自定义的瞬时几何RangeRate和AzEl测量（与Orekit的TopocentricFrame交叉核对），作为单独程序在相同的遮蔽、带随机种子的观测上运行。判据已预先登记于xval/od-measurements-orekit/PREREGISTRATION.md（0cf9076）。除B4（无噪声状态一致性{ "1" } cm）外，每项判据均达到，该项在{ "4" }个场景中有{ "2" }个未达到（{ "1.46" }、{ "1.74" } cm）：Orekit自身的无噪声估计与其模拟真值就相差这么多（Orekit一侧的原因未查明）。已记录并固定，因此该行仍为MODELLED。未建模：光行时、光行差、折射、地球自转、针对这些测量类型的序贯滤波器

seg-bc3d1ee7c639 = SP3精度码观测加权

seg-63b1fab84f85 = 将SP3精度码（头部 ++ 指数，以{ "2" }^n mm计，%f基数，逐记录的 基数^n mm标准差）映射为精密定轨引擎中每条观测的位置sigma（sp3::parse_sp3_accuracy、Sp3Accuracy::position_sigma_m）

seg-ebecb8906506 = 无外部参考：权重是一种建模选择（SP3格式仅把该码定义为生产方的精度指示，此处将其读作每轴一倍标准差）。现有已记录的机构运行结果不变

seg-e35df6881c80 = 来自PDS SHADR表的行星重力场

seg-f78b73ae8742 = 读取PDS SHADR球谐表（src/gravity_pds.rs中SphericalHarmonicField上的from_shadr：单位换算、提供C00 = { "1" }、完整性与归一化检查），并计算火星GMM-3（阶数/次数{ "120" }）和GRAIL月球重力场GL0660B（阶数/次数{ "660" }）的本体固连重力

seg-08590d67a7d3 = pyshtools { "4.14.1" }（BSD-3-Clause）读取同样的PDS文件并计算点重力，作为单独程序运行，另有已发布的PDS产品头部和标签。判据已预先登记于xval/planetary-gravity-pyshtools/PREREGISTRATION.md（32c5b50）；全部达到（RESULTS.md）。数据：NASA PDS Geosciences Node，公有领域；附带NOTICE的20阶截取随附，完整文件在测试时获取

seg-ae3e8833a5ef = 为天体附加已发布的重力场

seg-ffb2b20e5f32 = with_gravity_field（位于Body上，在src/gravity_pds.rs中）：把任意已加载的球谐场（例如GMM-3或GL0660B）附加到Body，使传播器在本体固连系中对其求值；需选择启用，默认天体不变

seg-bcb731f7a9b5 = 仅为内部一致性。每个已发布的场都定义在其生产方的本体固连系中（GMM-3在Konopliv等人{ "2006" }的火星坐标系，GL0660B在DE421月球主轴系），而该场却在IAU坐标系中求值；这一偏差未建模

seg-659bfeba459c = 批处理与序贯定轨

seg-dbc98f498941 = 在二体 + J2力模型上，通过Gauss–Newton批处理微分改正器和序贯滤波器，由地面站测距恢复历元状态 [r,v]

seg-ecfce82a4e3d = Orekit { "12.2" }（CS GROUP，Apache-2.0）BatchLSEstimator（Levenberg–Marquardt）+ KalmanEstimator（EKF）——在匹配的力模型上使用的独立第三方估计库；恢复的历元状态与拟合后残差RMS的一致性：无噪声时<{ "1e-3" } m，{ "5" } m噪声底时<{ "3" } m

seg-acdac055acb9 = 深空射电测量光行时求解器

seg-62a478e40850 = 用于深空射电测量导航（地球→火星/太阳/月球）的推迟（下行段）单向光行时解 τ = |r_rx − r_target(t−τ)|/c

seg-a38690bb69fa = ANISE { "0.10" }（Nyx Space，MPL-2.0）在JPL DE440上的收敛牛顿式光行差光行时（Aberration::CN；与SPICE spkapo等价）——一个独立的Rust SPICE实现；kshana的不动点推迟求解器与之吻合至亚纳秒。更广泛的多普勒 / Shapiro / 简化动力学定轨数据仍为MODELLED

seg-c69ef9342160 = 广播星历卫星位置（多GNSS RINEX）

seg-62702fc6f242 = 由解析出的RINEX-3导航记录，按IS-GPS-200 / Galileo-OS / BeiDou-OS广播星历把开普勒根数换算为ECEF卫星位置

seg-cb66d33b7ba7 = 由C源码编译的RTKLIB v2.4.2-p13 eph2pos()（T. Takasu，BSD-2-Clause）——独立的IS-GPS-200/SIS-ICD实现，输入相同的RINEX-3导航记录；卫星ECEF位置吻合至约{ "62" } nm。（SP3精密星历内插另行经独立核对——见“SP3精密星历内插”）

seg-c807a782b20e = SP3精密星历内插

seg-238de70daab9 = 对SP3精密星历卫星位置做IGS标准的Lagrange内插，并对每个节点做地球自转改正（在多项式拟合之前，按 ω⊕·(t_node−t) 把各节点旋转到查询时刻的地固系中）

seg-e9249ae44a11 = 由C源码编译的RTKLIB peph2pos()（preceph.c；T. Takasu，BSD-2-Clause）——事实上的IGS参考，独立实现；kshana的内插器（现已带同样的地球自转节点改正）在真实SP3产品上吻合至约{ "15" } nm，改正前约为{ "5.5" } cm

seg-9762cf428435 = GPS LNAV之外的导航电文编码器（GPS CNAV、Galileo I/NAV和F/NAV）

seg-9b703b9607d8 = GPS CNAV电文类型10/11/30、名义偶/奇页中的Galileo I/NAV字类型1-5，以及Galileo F/NAV页类型1-4：ICD字段打包与量化、CRC-24Q、码率1/2 K={ "7" }卷积编码（Galileo的G2取反）、块交织与同步码型，并配有匹配的测试解码器

seg-7939b210e83c = 内部往返与ICD已知答案；尚未运行任何第三方解码器（读取KSHANA_NAVMSG_ORACLE_JSON的RTKLIB/GNSS-SDR测试装置受数据门控）。MODELLED

seg-5ce7cd3d6011 = 真实CODE GIM上的IONEX全球电离层图读取与内插

seg-502656556ddf = IONEX { "1.0" }读取器（头部、固定列I5值、TEC与RMS图、绝对历元、缺失值），带双线性空间内插、该格式的最近/连续/旋转图时间内插（公式1-3）以及薄层斜向TEC

seg-1575dc4cfb4a = CODE GIM的印刷值（每个节点处精确；该图在测试时获取，不纳入代码库，因其许可状态未确认），以及随夹具提交的IONEX { "1.0" }内插公式的独立Python标准库重新实现（判据已预先登记e4d8b1f，{ "1e-9" } TECU）。第三方核对（B6，已预先登记，首次运行）：RTKLIB v2.4.2-p13 iontec（BSD-2-Clause，作为单独工具运行）在{ "6885" }个查询点上与IonexFile::vtec_at在两种内插模式下均吻合至{ "3.6e-13" } TECU，判据为{ "1e-5" } TECU。数据门控：CODE GIM在测试时获取，SHA固定；RTKLIB读取完整文件，因为其getindex拒绝纬度裁剪。tests/fixtures/ionex_code_gim/fetch.sh获取该文件并核对SHA-256，测试遇到任何其他字节均失败，run_rtklib.sh是记录在案的复现路径（需要网络访问）。经所有者基于数据门控证据的决定升级为VALIDATED（2026-10-13）

seg-974d8c1f7876 = 真实RINEX观测上的Hatch载波平滑码

seg-f26b5da0f52e = 精密单点定位组件中的无发散Hatch滤波器（以无电离层载波平滑无电离层码，窗口N个历元，在失锁、几何无关跳变或间断时重启）

seg-fac84cb9b256 = 对照已发布的ITRF2020 WTZR坐标的发现：预先登记的判据（平滑后的中位数和p95至多为原始值的{ "0.6" }倍；tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md）未达到，比值为{ "0.718" }和{ "0.923" }；残余的米级误差呈偏差型（C1C码偏差、天线、潮汐、长周期多路径），而不是平滑所能去除的白噪声。MODELLED：滤波器的统计量为内部检查

seg-2eec513ae8c8 = 真实RINEX观测上的RTK双差与LAMBDA整数固定

seg-6571676bf918 = 由真实双频GPS码与载波相位得到的短基线相对定位：相对最高卫星的双差及其完整协方差，覆盖基线与单差模糊度的浮点Kalman滤波器（含周跳重新初始化），带比率检验的LAMBDA整数最小二乘，以及以固定整数为条件的基线

seg-e50c5d4b65c7 = WTZR与WTZZ已发布的ITRF2020坐标（IGN ITRF2020_GNSS.SSC，解{ "3" }，含RINEX天线高）给出参考基线；判据已预先登记于tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md，早于代码编写。仅限短基线：未对电离层或对流层双差建模

seg-f9aa0c529393 = 对照IGS最终测站钟的PPP接收机钟时间解

seg-83ad9e893db9 = 静态浮点PPP滤波器在真实双频GPS码与相位上、采用IGS最终轨道和钟差所估计的接收机钟：从接收机到IGS时间的时间传递，即PPP无电离层时间解。

seg-91a882dd71e8 = 测站WTZR的IGS最终组合钟（IGS0OPSFIN_20250550000_01D_05M_CLK的AR记录，SHA-256 d19f3d45...993d，由多个分析中心的网解组合而成；IGS产品，注明出处可自由使用）；判据已预先登记于xval/ppp-time/PREREGISTRATION.md，早于任何比较；首次运行即全部成立。不包括的内容：一个测站和一个两小时的已收敛窗口；是IGS时间，而非UTC(k)；常数偏差包含接收机码偏差，且仅有界，未经校准；无Circular T溯源。

seg-a9b2a93401a3 = 真实RINEX观测上的浮点精密单点定位

seg-cc991ccec112 = 在真实双频GPS码与载波相位上、采用IGS最终轨道和钟差的静态浮点PPP扩展Kalman滤波器：无电离层组合、卫星与接收机天线偏移（含接收机变化）、固体潮、相位缠绕、Shapiro延迟、估计的天顶湿延迟、逐弧段浮点模糊度，以及基于几何无关 / Melbourne-Wübbena的周跳检测

seg-36e7c9286af7 = WTZR已发布的ITRF2020坐标（IGN ITRF2020_GNSS.SSC，解{ "3" }，按其速度外推）——判据已预先登记于tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md，早于滤波器编写；开发仅在同址测站WTZZ上进行。未建模：海洋负荷、卫星PCV、整周模糊度解算

seg-c8d87abed330 = RINEX { "4" }导航文件读取

seg-28913a01af00 = RINEX 4.00-4.02导航文件：GPS LNAV、Galileo I/NAV和F/NAV、BeiDou D1/D2以及QZSS LNAV的<c1/>记录被解码为广播星历类型；CNAV、CNV1-3、FDMA、SBAS、STO、EOP和ION记录跳到下一个记录头；头部指明另一颗卫星的记录，或被截断的记录，均予拒绝

seg-687b3b159691 = IGS同一天的RINEX { "3" }合并广播文件（已发布数据，由不同的文件生成器根据相同的广播电文写成）；判据已预先登记于tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md（7aa264b），早于首次运行

seg-278ca396127a = RINEX { "4" }观测文件读取

seg-e0883aa933eb = RINEX 4.0x观测文件头（DOI、LICENSE OF USE、STATION INFORMATION、MERGED FILE；对版本{ "4" }及以后，标签在第61-80列匹配）和历元记录

seg-971fb1203a6d = 在一份真实已发布的RINEX { "4.00" }文件（读回的值等于文件印刷的字面值）和一份由规范推导的头部上做格式一致性检查；未运行任何独立读取器，因此为MODELLED

seg-33e5c74720ff = BeiDou GEO广播卫星位置

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" }由广播星历得到的地球静止卫星位置（类惯性系，再经Rz(Ω̇e·tk)·Rx(−{ "5" }°)），通过NavParseOptions的include_beidou_geo字段选择启用，因此默认读取器仍跳过GEO

seg-06d500099814 = 已预先登记（7aa264b、110fef9），对照含GEO的IGS MGEX精密轨道；构建它的会话无法获得此类产品，因此比较尚待进行，该行为MODELLED（仅对照已发布的名义GEO轨位检查）

seg-559814996a4c = SP3精密钟差内插

seg-8e7a0dbd1755 = 在SP3钟差表节点之间，对括住查询时刻的两个有效节点做线性内插得到卫星钟差（RTKLIB pephclk方案；跳过坏钟标记值），并把同样的节点作为相当于RINEX钟差的记录送入精密产品链路

seg-1f4f0f841802 = IGS最终{ "30" } s卫星钟组合（IGS0OPSFIN 30S CLK，2025-02-24）：查询时刻的已发布钟差估计，而非由SP3内插；判据已预先登记于tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md，早于首次运行（RMS { "0.15" } ns，p95 { "0.30" } ns，节点中位数{ "1e-12" } s，区分度2x）

seg-71f48628ebb2 = 带浮点模糊度的载波相位紧耦合GNSS/INS

seg-5a156aa81275 = 基于{ "15" }个INS状态、一个双状态接收机钟以及每颗被跟踪卫星一个浮点载波模糊度的误差状态EKF；伪距、载波相位和可选的距离变化率来自SGP4 Walker星座（含光行时与Sagnac效应），Klobuchar与Saastamoinen/Niell改正在滤波器自身位置处于环内施加；基于时间差分载波的周跳检测，每颗卫星的阈值随速度不确定度放宽；周跳和重新捕获时重新初始化模糊度

seg-00576e8c1032 = 内部一致性：测量值由滤波器所用的模型合成（跨随机种子的 χ² NEES/NIS、无噪声收敛、周跳注入）。MODELLED；未与真实接收机数据或第三方滤波器比较

seg-7d644516b1ec = 带紧耦合选项的GNSS/INS海事、铁路和航空场景包

seg-cbb03a8baf73 = 轨迹库上的三个gnss-ins场景（一艘以{ "8" } m/s蛇行的船舶，含五分钟中断；一列穿过双卫星路堑和隧道的列车；一架中断期覆盖25度倾斜转弯的飞机），以及该场景包可选的 [tight] 表：由闭环导航器融合SGP4 Walker星座的伪距，名义情况下使用遮蔽角以上的每颗卫星，降级情况下使用最高的几颗

seg-273c14256d4c = 内部：每个场景包对照其自身真值的性能指标，以及在相同输入上的松/紧耦合比较。MODELLED；审计中的NaveGo比较尚未运行

seg-f4dab73c4eda = 融合包中带偏差状态的耦合伪距PNT滤波器及3-D扩展

seg-742b60089361 = 一个覆盖位置、速度、钟相位和频率的堆叠Kalman滤波器，输入同时耦合位置与钟差的伪距（带互协方差的Joseph形式更新）；一个增广了常值加速度计偏差状态的1-DOF变体，融合包在 [coupled] 下运行它；以及带视线行的3-D 8状态版本

seg-9558d7aad3af = 内部一致性：真值由各滤波器自身的模型模拟（跨蒙特卡罗随机种子的 χ² NEES，同一传感器上的解耦场景包）。MODELLED

seg-4a64aa1fe3ca = KF-GINS数据集上带杆臂的松耦合GNSS/INS EKF

seg-30f503856ac5 = 闭环15状态误差状态EKF，由IMU增量驱动，GNSS天线位置通过杆臂模型H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }] 融合，由KF-GINS YAML文件配置（初始状态与sigma、ARW/VRW、Gauss-Markov偏差）

seg-b01d28a09abe = 该数据集已发布的参考轨迹和KF-GINS C++ 程序（GPL-3.0，提交8291a93e，作为单独工具运行）；判据已预先登记于xval/kfgins/PREREGISTRATION.md，且在该登记之前KF-GINS未在此数据上运行（已在其Results中核对）。六项判据首次运行即全部成立。受数据门控：KF-GINS演示数据集（真实的Leador-A15 IMU和RTK GNSS，带参考轨迹）没有许可证，因此不纳入代码库；xval/kfgins/fetch.sh在测试时获取，每个文件的SHA-256均已固定，不一致则测试失败；复现路径（需要网络访问）见xval/kfgins/PREREGISTRATION.md。经所有者基于数据门控证据的决定升级为VALIDATED（2026-10-13）

seg-e6b6c605564c = 由某仿真器的运动文件读取器读取的测试bench导出（gps-sdr-sim）

seg-a07429aa1998 = 把bench导出的运动文件交给某开源GNSS仿真器自带的读取器，读回的就是所导出的轨迹：NMEA GGA文件（-g）、运动CSV的时间/纬度/经度/高度截取（-x）及其时间/x/y/z截取（-u），覆盖{ "6" }个gnss-ins场景（含海事、铁路和航空场景包，读取至该仿真器的3000个采样上限）和{ "2" }个静止场景。仅涉及运动；不写入也不生成任何信号。

seg-07b5f46a900f = 外部核对的范围，狭义表述：gps-sdr-sim（MIT，提交28ca29a6）的readNmeaGGA、readUserMotion和readUserMotionLLH及其自带的WGS { "84" } llh2xyz，通过xval/testbench-gpssdrsim/driver.c调用（不调用任何信号函数），与运动CSV的地固系列逐行比较，判据已预先登记于xval/testbench-gpssdrsim/PREREGISTRATION.md，早于任何运行：全部{ "8" }个场景中的每个采样均被读取；NMEA最差{ "1.21" } mm（判据{ "1" } cm）；LLH截取最差{ "0.145" } mm（判据{ "1" } mm）；四列地固系截取精确一致（判据{ "1" } um，修订{ "1" }）；gnss-ins行在仿真器的{ "10" } Hz网格上偏差至{ "2.3e-13" } s。发现（运行{ "1" }，已固定）：去掉头部的全宽CSV无法被 -u读取，因为读取器100字符的行缓冲区把每个161字符的行拆成两个采样；docs/TEST-BENCH.md给出了四列截取。不包括的内容：场景真值轨迹的物理；gps-sdr-sim的信号输出；任何其他仿真器的读取器；任何接收机。

seg-2db2b9dc3b45 = GNSS/INS轨迹库与CSV真值导入

seg-e1fe83c75a6c = 供gnss-ins场景包选用的运动剖面（直线、8字、城市走走停停、飞机爬升与协调转弯、测绘无人机），由欧拉角速率和沿轨加速度指令定义，并以运动学IMU（向心、重力和科里奥利项）在真值状态上闭合，导入的CSV真值则被转换为能复现它的IMU；未给定剖面时，原有的驾驶轨迹保持不变

seg-30ea002a06a0 = 内部：刚体运动学恒等式、CSV往返以及滤波器自身的协方差。MODELLED（未与任何真实驾驶日志比较）

seg-8685fd899e3c = 捷联INS机械编排

seg-ba942e322f8a = 四元数姿态、WGS-84 NED捷联惯性机械编排（含圆锥/划船补偿），由 (Δθ, Δv) 增量传播导航状态

seg-5cfcb186d59e = 在Octave下运行的NaveGo v1.4（R. Gonzalez等，LGPL-3）——一个独立发布的INS工具箱，由相同的 (Δθ,Δv) 增量流驱动。姿态逐位一致（NED / 标量在前四元数 / 地球自转率 / 传输率的约定相同）；速度/位置的吻合受限于两处已记录的差异——NaveGo包含而kshana有意省略的垂线偏差北向重力项（铅垂重力；与Groves闭式解吻合到每一位数字，并带有合理性下限断言）以及O(dt²) 的积分器差异——并非机械编排误差

seg-d1a5c8e7ca74 = 重力场泛函合成（重力辅助 / 无GNSS导航图）

seg-8336eb12eb7b = 来自任意ICGEM .gfc模型的球谐重力大小 + 扰动（mGal）；GRS80正常重力

seg-b5a7fc986751 = GRS80（Moritz { "1980" }，IAG）Somigliana正常重力 + 已发布的 γ_e/γ_p；真实的ICGEM EGM2008场

seg-86f9186bb884 = 地月CR3BP { "9" }:{ "2" } NRHO对照CAPSTONE实际飞行的轨道

seg-d4127cf241f3 = cr3bp::differential_correct_halo所修正的圆形限制性{ "9" }:{ "2" } L2南向近直线晕轨道（Gateway与CAPSTONE轨道族），就其平均几何（周期、近月点半径、远月点半径）与CAPSTONE实际飞行的轨道比较。这是对CR3BP成员描述真实轨道的程度的一次测量；CR3BP轨道不是星历模型轨道，也不逐历元比较

seg-e0cc33dfb10b = 对照JPL Horizons重建的CAPSTONE星历（NAIF -1176，CAPSTONE_merged，月心ICRF，2023-03-01..31，{ "10" } min间隔），逐字节提交（tests/fixtures/capstone_horizons/，NOTICE.md），在获取之前已预先登记{ "4e868170" }，作为对平均几何设有判据的测量。不是经独立核对：CR3BP省略了太阳、月球偏心率以及CAPSTONE实施的轨位保持，因此这些判据描述的是模型轨道的代表程度，而不是精度。结果：docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

seg-c866a5bd4318 = 把CR3BP旋转系状态映射到DE440地月连线上的月心ICRF

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf把无量纲的地月CR3BP旋转系状态映射为瞬时地月连线上的月心ICRF位置和速度（长度单位为地月距离，时间单位为轨道角速率的倒数，坐标系的完整角速度包含由月球加速度引起的面外分量），其逆映射为from_moon_centred_icrf，而cr3bp::to_moon_centred_icrf_de440从DE440 SPK读取地心月球状态。它映射的是状态；并不使CR3BP轨道成为星历模型轨道

seg-d91ce10ea439 = NAIF SPICE Toolkit（CSPICE N0067，经spiceypy { "8.3.0" }）对双矢量动态坐标系的sxform（主轴 +X沿月球相对地球的位置，次轴 +Y沿其速度，de440s），作用于由SPICE自身月球状态构造的有量纲旋转系状态，由不调用任何Kshana代码的单独程序完成（tests/fixtures/cr3bp_to_mci_spice/，NOTICE.md）。预先登记2313eb1b，并在任何运行之前于d5ef79b3中修订，纳入坐标系的面外角速度（缺少它，速度最多会偏差{ "8e-2" } m/s）。仅为该变换的库级核对。结果：docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

seg-d543e3e84f36 = 基于JPL星历核的太阳系类场景（planetary_kernel_path）

seg-e8a96f29afc7 = 带planetary_kernel_path的<c1/>类场景：SPK中包含其自身NAIF编号的每个被报告天体，通过引擎自己的读取器从星历核取得日心J2000位置和速度（标签KERNEL），两端都在星历核中的链路在其上计算，质心绝不替代行星，其余天体仍保持解析解并带各自的标签；仅当设置了该选项时，报告才增加一个星历核块（路径、SHA-256、取自它的天体和链路）。使用de440s.bsp时，即水星、金星、地球和月球

seg-05cc6642285b = NAIF SPICE Toolkit（CSPICE N0067，经spiceypy { "8.3.0" }）在完整de440s.bsp上的spkezr日心状态，由不调用任何Kshana代码的单独程序完成（tests/fixtures/solar_system_kernel/，NOTICE.md）；引擎读取逐位一致的de440s截取。预先登记f8e946ea。仅为接线的库级核对：DE440本身和解析天体在此并未经独立核对。结果：docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

seg-7f3d53b4e8d1 = DE440星历上的porkchop

seg-bd813d7e0b58 = maneuver::porkchop_kernel：用单圈顺行Lambert求解器和{ "0.5" }度共线保护，对出发C3（km²/s²）和到达V无穷（km/s）做发射日期 × 到达日期扫描，基于由本crate自己的读取器从JPL DE440 SPK读取的任意两个NAIF天体的日心J2000状态。一圈、顺行，无运载火箭或到达约束：这是一次扫描，不是任务设计

seg-bd19ca214f29 = NAIF SPICE Toolkit（CSPICE N0067，经spiceypy { "8.3.0" }）在de440s.bsp上的日心状态，以及pykep { "3.0.1" } lambert_problem（ESA，C++ kep3核心，MPL-2.0）这一独立Lambert求解器，由不调用任何Kshana代码的单独程序运行（tests/fixtures/porkchop_de440/，NOTICE.md）；引擎读取逐位一致的de440s截取。预先登记2d857fb1。仅为该扫描的库级核对。结果：docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

seg-b1401bed5da8 = DE440星历上的脉冲转移优化器

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel：单圈弹道双脉冲转移的出发日期和到达日期，在Type I或Type II内使出发C3或到达V无穷最小，作为连续最优解（对两个窗口做2天网格，再做2-D Nelder-Mead），基于DE440 SPK的日心状态。这是针对单一航段的日期优化器，不是任务设计：没有运载火箭、停泊轨道、深空机动或多圈选项

seg-6c695aef043b = 一个独立的优化器：NAIF SPICE Toolkit（CSPICE N0067，经spiceypy { "8.3.0" }）在同一de440s截取上的日心状态、pykep { "3.0.1" } lambert_problem（ESA，MPL-2.0）以及SciPy { "1.18.1" } Nelder-Mead，不调用任何Kshana代码。NASA地球到火星手册（MIDAS，未说明星历，2天日期网格）是次要的已发布参考，不决定其状态

seg-93f3cdbb7297 = 多圈Lambert转移求解器

seg-995a6a995b78 = Lambert问题至多三个完整圈数的每一个解（maneuver::lambert_multirev：单圈解，然后是每个圈数的左右分支，Izzo { "2015" }），含边界速度v1和v2，适用于顺行与逆行转移，采用无量纲和日心SI单位，包括处于某圈数最小飞行时间{ "1" } % 以内的转移以及接近180度的几何。仅为二体求解器（无摄动）

seg-77c43836cafe = pykep { "3.0.1" } lambert_problem（ESA，C++ kep3核心，MPL-2.0），独立库，由scripts/gen_lambert_multirev_ref.py作为单独程序运行；只提交其数值输出。在任何比较之前已预先登记a75de851（算例集、判据、结论规则）；参考值经独立重新生成，逐字节一致。结果：docs/design/evidence/lambert-multirev/RESULTS.md

seg-ff9c6140fe1c = Lambert二体转移求解器

seg-d8c39ced64b2 = Izzo-2015单圈Lambert求解器（r1、r2、飞行时间 → 边界速度），覆盖LEO→GEO→日心转移，顺行与逆行

seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015（J. Martínez Garrido，MIT）——独立的第三方Lambert求解器。单圈（M={ "0" }）Lambert问题有唯一解，因此库与库之间的一致是真正的外部核对；吻合至<{ "1e-4" } m/s（实测约{ "1e-11" }），与DOP对照gnss_lib_py所得的核对性质相同

seg-347cece5df63 = 参考系与时标

seg-5a4bc2c15eaa = IAU 2006/2000A岁差章动、CIO GCRS↔ITRS、含闰秒的时标

seg-51d28ab9d256 = IAU SOFA / ERFA参考向量；Vallado AIAA 2006-6753（{ "0.1" }–{ "4" } mm）

seg-c3d4b9bef817 = 地球轨道时间路径上的两部分儒略日与闰秒

seg-5e859e3aa613 = 把UTC日历日期和时间转换为两部分UTC儒略日，对以闰秒结束的日子采用SOFA dtf2d约定（长{ "86 401" } s，{ "23" }:{ "59" }:{ "60" }.x有效），UTC与TAI互转，以及经由TAI从UTC得到UT1，适用于1972-01-01起的两部分日期：SGP4（Sgp4::propagate_at，自两部分历元起算）和IAU 2006/2000A地固旋转（sgp4::teme_to_itrs_matrix_eop，带两部分地球自转角）所采用的时间路径

seg-ec12724c3c04 = pyerfa { "2.0.1.5" }（liberfa { "2.0.1" }，BSD-3-Clause；ERFA项目发布的SOFA算法），独立库：对已提交时刻调用erfa.dtf2d("UTC")、erfa.utctai和erfa.taiutc，在两部分日期上分部分求差，判据{ "1e-6" } s于运行前固定（预先登记e947e69d）。最差偏差{ "9.6e-12" } s（dtf2d）和{ "1.9e-11" } s（utctai、taiutc）。若把每个UTC日都当作{ "86 400" } s，或不缩放闰日小数部分，测试即变红。经TAI的UT1（iauUtcut1）由地球轨道路径一行的ERFA分支核对。范围：自1972-01-01起的UTC；更早的漂移率UTC未建模

seg-f1c7bc235a6b = 轨道路径上经地球自转的两部分儒略日

seg-cee11d4bad08 = 在轨道路径上由两部分UT1儒略日计算地球自转，使地固位置保持单个f64日期所丢失的微秒（在{ "2020" }年附近约{ "3e-9" } rad）：jd2::gmst82（IAU { "1982" } GMST，即TEME约定，作用于两部分）、cio::gcrs_to_itrs_matrix_jd2（CIO GCRS到ITRS矩阵，地球自转角取自两部分），以及基于它们并经内部检查的frames::teme_to_itrf_jd2 / itrf_to_teme_jd2、orbit::Propagator::position_in_frame_jd2和own_jd2_utc、星历场景可选启用的two_part_jd（ECEF位置、星下点轨迹和测站视图；默认关闭，保持不变），以及jd2::Jd2与timescales::TwoPartJd之间的无损From转换。岁差章动和Cowell力模型历元仍为单个f64，其中{ "40" } us的舍入低于{ "1e-15" } rad，或远低于解析的太阳/月球星历误差

seg-a658c7b16d6d = pyerfa { "2.0.1.5" }（liberfa { "2.0.1" }，BSD-3-Clause；ERFA项目发布的SOFA算法），独立库：在已提交的两部分日期上调用gmst82和c2t06a，极移{ "0.1" }和{ "0.3" }角秒。在编写这些函数之前、在运行参考基准（oracle）之前，已预先登记b10475ee（日期、判据）。内部测试（场景选项、TEME/ITRF往返、类型转换）属辅助性的自洽检查

seg-096df3971f5f = 对照ERFA向量的坐标系矩阵：IAU { "2006" }偏差岁差、TEME到GCRS，以及含天极偏差的CIO链路

seg-731a5ed967b3 = 在任意历元上与ERFA逐元素或按旋转角比较的三个坐标系矩阵：precession::precession_matrix（由Fukushima-Williams角给出的IAU { "2006" }偏差岁差）、nutation::teme_to_gcrs_matrix（TEME到GCRS旋转P^T N^T Rz(-EE)，采用IAU { "2006" }岁差、IAU 2000B章动以及含两项主要补充项的分点方程）和cio::gcrs_to_cirs_matrix_with_offsets（GCRS到CIRS旋转，在旋转前把IERS天极偏差dX、dY加到模型CIP X、Y上，即SOFA手册约定；新增）。模型选择本身（TEME路径上的2000B章动、两项补充级数）未经独立核对，仅核对其实现

seg-411cd8622b4d = pyerfa { "2.0.1.5" }（liberfa { "2.0.1" }，BSD-3-Clause；ERFA项目发布的SOFA算法），独立库：pmat06；numat(obl06, nut00b)，分点方程取自eect00（完整补充级数），按P^T N^T Rz(-EE) 组合；xys06a随后c2ixys(X + dX, Y + dY, s)。在运行参考基准（oracle）之前已预先登记979c1e39（历元、偏差和判据）。{ "1.1e-10" } rad的TEME残差是保留两项补充项的预期效应（在GNSS轨道上约{ "3" } mm）

seg-4e2fe2e3dabb = 两部分儒略日时间路径上的1972年以前UTC（漂移率时代）

seg-1d086e669f09 = 1960-01-01至1971-12-31的UTC，其时UTC以相对TAI的偏移速率运行并以不足一秒的量阶跃，处理于两部分儒略日路径：每个时期按漂移表求TAI - UTC（timescales::tai_minus_utc_on_date），UTC日历日期转为两部分UTC儒略日，日长取{ "86 400" } s + dleap（Jd2::from_utc_calendar），UTC到TAI时把日小数部分由UTC缩放为SI秒（jd2::utc_to_tai），TAI回到UTC（jd2::tai_to_utc），遵循SOFA dtf2d、utctai和taiutc。{ "1960" }年以前TAI - UTC取为{ "0" }（SOFA的取值；UTC未定义），不在声明范围内。单个f64的timescales::tai_minus_utc在{ "1972" }年以前仍钳位到{ "10" } s，不在覆盖范围内

seg-036d5b0b4f51 = pyerfa { "2.0.1.5" }（liberfa { "2.0.1" }，BSD-3-Clause；ERFA项目发布的SOFA算法），独立库：对已提交时刻调用erfa.dtf2d("UTC")、erfa.utctai和erfa.taiutc，分部分求差。在修改引擎之前、在运行参考基准（oracle）之前，已预先登记23c40661（时刻、容差和{ "1972" }年以后的校验和）。漂移表转录自参考基准所用的同一份SOFA iauDat表，因此比较覆盖的是换算运算（日长、UTC到SI的缩放、迭代），而不是历史表本身

seg-efacec095051 = GLONASS广播卫星钟差与广播轨道传播

seg-821b9c01b56e = 在卫星钟读数时刻的GLONASS广播卫星钟差 -tau_n + gamma_n (t - t_b)（glonass::GlonassEphemeris::sv_clock_bias_s，对钟差改正的偏移做两次不动点迭代），以及广播状态向量的PZ-90地固位置，由RK4按GLONASS ICD运动方程在参考历元前后 +/-15 min内传播（GlonassEphemeris::position_ecef），取自真实的RINEX { "3" } GLONASS导航记录。未做PZ-90.11到ITRF的转换（自{ "2014" }年起二者在厘米级一致；RTKLIB同样不做）。未接入任何场景输出：库函数

seg-4478a2518341 = RTKLIB v2.4.2-p13（T. Takasu，BSD-2-Clause，提交71db0ffa）的geph2clk和geph2pos，由C源码在单独的测试装置（xval/rtklib-glonass）中编译，该装置用RTKLIB自己的读取器读取同一份RINEX文件，因此除钟差和轨道外，解析、-tau_n的符号、单位和迭代也一并比较。在该函数存在之前、在测试装置构建之前已预先登记e099c42a。双方求值的是同一个钟差闭式，所以钟差比较覆盖的是实现，而不是公式。轨道积分器不同（RTKLIB先以{ "60" } s步进再处理余量，Kshana采用不超过{ "60" } s的等步长），常数也不同（RTKLIB mu { "3.9860044e14" }，Kshana为PZ-90.11的{ "3.986004418e14" }）；{ "1.1" } mm的最差情形正是这一差异，与运行前的预测一致。范围：有效期内的广播星历，而非真实轨道或钟差（未与精密产品比较）

seg-d3b72a6fbb18 = 一条地球轨道路径：带地球定向参数、基于IAU 2006/2000A链路，从SGP4根数集到GCRS和ITRS

seg-e4eca7205b5e = 每个经路由的地球轨道类场景共用的传播与坐标系路径：带两部分UTC历元的SGP4平根数集（sgp4::MeanElementSet，由MeanElementSet::from_earth_fixed从星座设计根数读取），经SGP4/SDP4传播到TEME（sgp4::SgpOrbit），以及IAU 2006/2000A链路的TEME -> ITRS和GCRS -> ITRS旋转，含UT1 - UTC和极移（sgp4::teme_to_itrs_matrix_eop、gcrs_to_itrs_matrix_eop，以及零参数形式teme_to_itrs_matrix和gcrs_to_itrs_matrix）。TEME是瞬时真赤道与平春分点，从GCRS经IAU { "2006" }偏差岁差、IAU 2000B章动和分点方程得到

seg-44f28276f859 = 分支{ "1" }：python-sgp4 { "2.24" }（MIT许可；D. Vallado的参考C++ SGP4，即产生AIAA 2006-6753验证向量的代码），WGS-72，improved模式。分支{ "2" }：pyerfa { "2.0.1.5" }（ERFA，BSD-3-Clause，SOFA例程）：c2t06a，TT取自utctai/taitt，UT1取自utcut1，对TEME则为c2t06a . pnm06a^T . rz(-ee06a)。判据于运行前固定（预先登记72ea9eb0）。已披露：首次运行时分支{ "2" }在2016-12-31T23:{ "59" }:{ "59.5" }失败，偏差一秒的旋转（在闰秒日由UTC准儒略日取UT1）；引擎已修正（jd2::utc_to_ut1），第二次运行在不变的判据下一致。去掉极移（{ "46" }项失败）或以WGS-84常数代替WGS-72（{ "4432" }项失败），测试即变红。这一三分支设计取代了一次端到端的Orekit比较，后者因Orekit在e = { "0" }处的SDP4以及其IERS { "1996" } TEME而失败（该发现仍固定在tests/leo_polar_coverage_full_claim_orekit_oracle.rs中）

seg-f650a11458b8 = 测距码设计权衡

seg-071e552a7179 = m序列/Gold码旁瓣与互相关界、长度↔模糊度

seg-65b7902a2d8f = 已发布的GPS C/A Gold互相关（−{ "23.9" } dB）；Gold { "1967" }界

seg-5ec4c0730280 = GNSS几何 / 精度因子（DOP）

seg-edcd694d2b3c = 由视线几何经Q=(HᵀH)⁻¹ 并做局部ENU分解得到的GDOP/PDOP/HDOP/VDOP/TDOP

seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" }（Stanford NAV Lab）DOP——独立库，相对偏差吻合至{ "1e-6" }

seg-1a5623c81b48 = 几何导致的位置误差：对引擎的最小二乘定位，RMS误差 = sigma_UERE x DOP

seg-7a94b44a8738 = dop_error_mc::run_geometry及其检查：对引擎自身的迭代最小二乘定位（pvt::solve_spp，单位权重，自真实位置起解算）做带随机种子的蒙特卡罗（每种几何N = { "20,000" }个历元，sigma = { "1.5" } m，ChaCha8种子{ "36" } + i），在tests/fixtures/dop/dop_reference.csv的{ "8" }种几何上，比较东、北、天向和钟差的误差方差、H/V/P RMS、东北相关性、平均误差，以及落在{ "95" } % 水平椭圆内的比例，椭圆由sigma^{ "2" } Q给出，其中Q为orbit::dop核的协方差因子（orbit::dop_cofactor，同一运算），取自同一几何

seg-90f18c774d57 = 对照闭式的内部一致性：在线性高斯模型下，最小二乘协方差为sigma^{ "2" } (H^T H)^-1（Kaplan与Hegarty编，Understanding GPS: Principles and Applications，第2版，Artech House，{ "2006" }，第{ "7" }章）。方法与容差取自{ "0.36" }几何设计说明第{ "5.2" }节，已在首次运行前的预先登记提交中固定：各方差在{ "5" } % 以内（N = { "20,000" }时样本方差的{ "5" }个标准误），各RMS在{ "2.5" } % 以内，东北相关性在{ "0.035" } (5/sqrt(N)) 以内，各平均值在{ "5" }个标准误以内，{ "95" } % 椭圆比例在{ "0.95" } +/- { "0.0077" }以内（{ "5" }个二项标准误）；负对照（PDOP加倍；误差按1/sin(仰角) 增长而对照未加权的Q）必须失败。组合方式：Q是orbit::dop核的协方差因子，在tests/dop_reference.rs中对照gnss_lib_py { "1.0.4" }在同样这{ "8" }种几何上VALIDATED（“GNSS几何 / 精度因子”一行）；本行增加的是经引擎求解器从这些因子到米的一步，并不借用那一行的状态。为何为MODELLED：不涉及外部数据集；吻合只表明在教科书模型下估计器与噪声实现了sigma x DOP，而不是任何接收机的误差等于UERE x DOP，且sigma_UERE是输入

seg-9acfde1b57f7 = 几何感知的信任分类：接收机信任度评分旁的卫星几何，以及每项扣分的类别

seg-6138c41e13ff = receiver_trust::geometry：逐历元的卫星几何（良好；降级，原因为few-satellites/high-pdop/high-hdop/sky-blocked；或在日志没有GSV、NAV-SAT或GSA时为未知），由所报告的仰角和方位角经orbit::dop推导，或取自GSA，并始终报告一个不计分的标签（good、fair、poor、unknown），以及用文字表述的HDOP、PDOP、VDOP、卫星数和信号丢失；一个船舶评分几何监视器，除非几何较差（比值max(hdop/4, pdop/6, 5/n_used) 高于{ "1" }）否则不扣分，随后在{ "1.5" }处线性升至{ "15" }分的上限，仅凭几何不能使评分低于降级区间（上限、升坡终点和下限位于 [geometry]；无告警）；每项扣分带一个类别（几何、环境、不一致），其中对低于{ "15" }度卫星的失锁归为几何，视野内但未被跟踪的卫星归为环境，而若某项较差几何扣分所述的HDOP与由所述天空推导的HDOP相差超过max({ "1.0" }, { "25" } %)，则归为不一致

seg-6987737c5fe4 = 内部一致性：分类对照其自身陈述的规则检查，并在已提交演示日志的合成编辑上对照手工推导的比值检查，无变化固定项保持{ "0.35.0" }的输出：除非几何较差，否则没有评分变化；标签始终报告。为何为MODELLED：阈值是选定的而非拟合的（来源见每次运行的geometry_model；IEC 61108-1和GPS SPS的数字依引文给出，有待对照标准正文核对），且不存在把自然几何退化与攻击区分开来的外部标注数据集可用于核对该分类。推导的DOP复用orbit::dop核，该核已对照gnss_lib_py VALIDATED，本行不借用其状态。几何类别是关于天空的陈述，而不是未发生攻击的结论

seg-540420863a5a = 广播电离层模型（Klobuchar，IS-GPS-200）

seg-fd157c537502 = 由八个广播 α/β 系数得到的Klobuchar单频L1斜向电离层群延迟

seg-0b0b02e8b0b8 = RTKLIB ionmodel（tomojitakasu/RTKLIB，src/rtkcmn.c）——由源码编译的独立参考实现；吻合至< { "1e-4" } m

seg-0af6b1a073ce = RAIM/ARAIM完好性统计核（χ² / 非中心 χ² / 正态分布律）

seg-224a6c4200cd = 每个保护级所依赖的分布核心：快照故障检测阈值 χ²₁₋ₚfₐ(dof)、漏检非中心参数pbias=√λ，以及K_fa/K_md/K_V解分离乘子

seg-49f7d0c26e0a = SciPy { "1.17.0" }（scipy.stats.chi2/.norm/.ncx2 + optimize.brentq）——独立库（Cephes/Boost），算法不同于Kshana的不完全伽马级数；相对偏差吻合至 ≤{ "1e-6" }。仅限该核。ARAIM MHSS的P_HMI预算*分配*不再缺少已发布的数值参考基准（oracle）——WG-C ARAIM技术子组自己的算例现已支撑另一行“对照已发布参考向量的ARAIM MHSS保护级”，在该参考自身的TOL_PL = { "5e-2" } m下吻合——因此本行的范围是统计核，而分配由那一行承担（见docs/ARAIM_REFERENCE.md）

seg-03578217425f = SBAS保护级（DO-229E加权最小二乘HPL/VPL）

seg-df640d6c7a5d = DO-229E附录J加权最小二乘保护级：由各卫星仰角/方位角和误差预算得D=(GᵀWG)⁻¹，取水平误差椭圆长轴和垂向 σ，再乘以已发布的K因子

seg-39aed7b4bffd = RTKLIB SBAS-PL分支——zsiki/rtklib_ws waasprotlevels()（Siki & Takács { "2017" }，“DO-229D Appendix J”），由rnx2rtkp -ws在真实的EGNOS GEO-PRN120电文 + 真实的BUTE/布达佩斯RINEX上运行；独立的第三方实现，HPL吻合至< { "2e-3" } m。gLAB { "v6.0.0" }（core/filter.c）确认约定相同。两个参考基准（oracle）都把K_V取整为{ "5.33" }，而Kshana的精确值为 Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" }（约{ "0.06" }%），因此垂向按不含K因子的d_U核对

seg-8f32eb9c8167 = 机器学习检测器评估指标（ROC/AUC/混淆矩阵/Pfa-Pmd）

seg-b0d8e1b45bf9 = AUC（Mann-Whitney，并列取 ½）、阈值处的混淆矩阵、P_d/P_md/P_fa/精确率/准确率/F1

seg-d87c8bae7c5e = scikit-learn { "1.9.0" }（Pedregosa等，JMLR { "2011" }）——独立库，完全一致

seg-e7af87ce5e72 = 真实航天器遥测上的异常检测评分

seg-9659b33fca5b = 区分真实已标注异常的ROC AUC + 自助法置信区间；透明检测器（复现标签）

seg-b4ed67ce7e7e = scikit-learn roc_auc_score，在OPSSAT-AD测试划分上（Ruszczak等{ "2025" }，CC BY { "4.0" }）——真实的OPS-SAT遥测

seg-5c3f1057c6cc = 量子权衡数值核（NNLS / χ² 区间 / van-Loan Q）

seg-f82113ccb30b = 实测ADEV的NNLS拟合、NEES/NIS χ² 一致性区间，以及时钟van-Loan离散过程噪声（守时滑行）协方差——权衡引擎的计算主干

seg-823da1deb3af = scipy { "1.17.1" }——optimize.nnls / stats.chi2.ppf / linalg.expm；NNLS+Q精确一致，在工作自由度下 χ² <{ "5e-4" }。仅限各核——器件性能数字仍由模型计算得出（见下一行）

seg-6f3099e7562c = 地磁参考场（IGRF-14合成）

seg-e9534723cb34 = IGRF-14主磁场的球谐合成——X/Y/Z/F分量、磁偏角和磁倾角——供给磁异常alt-PNT层

seg-b1431734301a = ppigrf { "2.1.0" }（K. M. Laundal，MIT）——IAGA-VMOD纯Python IGRF参考实现，随附官方IGRF14.shc系数（IAGA第14代，Zenodo 10.5281/zenodo.14012302）；一个独立的第三方代码库，计算唯一确定的IGRF-14场，在全球网格上吻合

seg-cb3fea409de7 = 检测统计量——高斯AUC与最小可检测故障

seg-ca677becb465 = 解析的双正态ROC AUC = Φ(μ/(σ√{ "2" })) 和最小可检测故障 σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d))，支撑量子故障检测器和异常检测器

seg-7d296e4199af = scipy { "1.17" }（Cephes ndtr/ndtri）+ scikit-learn roc_auc_score（Pedregosa等，JMLR { "2011" }），均为BSD-3-Clause——独立库，计算同样唯一确定的高斯尾部 / AUC量，吻合至A&S-erf下限（约{ "7e-8" }）。其上构建的量子对经典优势仍为MODELLED

seg-1ed12110fb74 = 秩序统计核（Kendall-τ / Dirichlet / 百分位数）

seg-0fb003404a5b = 韧性决策不稳定性研究所用的秩相关与重采样核：Kendall τ-b、Dirichlet均值、竞赛排名和百分位置信区间

seg-396602ddeef4 = scipy { "1.18" }（stats.kendalltau variant='b'、rankdata）+ numpy.percentile（BSD-3-Clause）——对唯一确定的秩统计量的独立实现（归并排序 τ），吻合至{ "1e-12" }。基于这些核构建的决策不稳定性研究仍为MODELLED

seg-fdd2ba203d5b = MCDA优先级推导核（AHP特征向量 / 一致性比率）

seg-d01c155fbddf = 层次分析法优先级权重 = 互反成对比较矩阵经幂迭代得到的归一化主（Perron）特征向量，附Saaty一致性指数 / 一致性比率以及CR<{ "0.10" }的接受门限

seg-d1947f2f2b3b = 精确复现Saaty（{ "1980" }）标准随机指数表（RI({ "5" })={ "1.12" }），并以SciPy/LAPACK scipy.linalg.eig（BSD-3-Clause）作为独立特征值求解器，计算同样唯一确定的Perron特征向量/特征值，吻合至<{ "1e-9" }。基于该核构建的Pareto / 敏感度 / MAUT决策层仍为MODELLED（WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE聚合器另行经外部核对——见下面各行）

seg-73e933220afb = MCDA加权聚合核（WSM / WPM）

seg-c436cdc991a2 = 加权和模型（最小–最大归一化的加性聚合 + 排序）和加权积模型（求和归一化、成本取倒数的乘性聚合）——两种价值聚合的权衡研究评分器

seg-1b5b9abcca69 = pymcdm（methods.WSM + normalizations.minmax_normalization；methods.WPM + normalizations.sum_normalization）——独立、被广泛使用的第三方Python MCDA库，计算同样唯一确定的加权聚合；吻合至<{ "1e-9" }。可经tests/fixtures/mcda_wsm/ 和tests/fixtures/mcda_wpm/ 离线重新生成。输入是垃圾则输出也是垃圾；敏感度/稳健性层仍为MODELLED

seg-f00bdb66a052 = MCDA距理想解排序（TOPSIS）

seg-631578cb1259 = 逼近理想解的排序技术——最小–最大归一化、加权正/负理想解、相对贴近度Cᵢ = d⁻/(d⁺+d⁻) 及排序

seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization——独立的第三方MCDA库，计算同样唯一确定的贴近系数；吻合至<{ "1e-9" }。可经tests/fixtures/mcda_topsis/generate_topsis_reference.py离线重新生成

seg-ef33d848c985 = MCDA折中排序（VIKOR）

seg-cf879fb770f2 = VlseKriterijumska Optimizacija——群体效用Sᵢ、个体遗憾Rᵢ 以及在策略权重v={ "0.5" }下的折中指数Qᵢ，按越低越好排序

seg-1e5ea1d9918d = 3-DOF姿态与指向误差预算（AOCS）

seg-21f2f8efcf19 = 重力梯度最坏情况扰动力矩（(3/2)(μ/R³)ΔI），取其在各姿态上的峰值（经独立核对的声明），外加基于具名1σ 贡献项的RSS指向误差预算及其主导项（由调用方提供的数字的求方和，不在经独立核对的声明之内）。可从CLI/绑定作为<c1/>场景类运行（scenarios/attitude-budget.toml）

seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector（AVSLab，ISC），全张量重力梯度力矩的独立C++ 实现：Kshana的峰值 (3/2)(μ/R³)ΔI在{ "45" }度姿态下与Basilisk的力矩相对偏差在{ "1e-12" }以内（最差{ "2.1e-15" }），覆盖{ "5" }个高度和{ "8" }个惯量张量，并在每个算例{ "2000" }个随机姿态上界定Basilisk的力矩；容差在比较之前固定。经独立核对的声明：重力梯度力矩峰值。RSS指向预算是由调用方提供的数字的求方和，没有外部真值，仍在其之外；手写的Hipparchus全张量最大化仍作为辅助的自洽检查。没有控制回路/6-DoF/柔性模态仿真

seg-1461aa14a7ff = 地面站过境预测（地面段）

seg-e1cf1ec4f005 = 引擎传播器在高于仰角遮蔽的测站上的时域可见过境（AOS/TCA/LOS、最大仰角、持续时间），带内插的升/落穿越及总接入时间：passes::predict_passes，即几何调度器（无折射或光行时）。<c1/>场景类运行“含折射与光行时的地面站视过境预测”一行的视预测器

seg-b351cd4245dd = Orekit { "12.2" }（CS GROUP，Apache-2.0）+ Hipparchus { "3.1" }——独立的飞行动力学库：在ITRF星历上使用ElevationDetector（Brent求根）+ EventsLogger，测站为WGS-84 TopocentricFrame。在相同的轨道+测站+遮蔽+窗口上，AOS/LOS/最大仰角/过境次数/总接入时间吻合（已提交的夹具；驱动程序xval/orekit-passes）

seg-1dd8b2655b18 = 含折射与光行时的地面站视过境预测

seg-46f93d3c24d2 = WGS-84测站上SGP4根数集的可见过境（AOS、TCA、LOS、最大视仰角、持续时间），采用经独立核对的地球轨道路径（IAU 2006/2000A，可选地球定向参数），带ITU-R P.834-9对流层折射（公式{ "9" }至{ "14" }，取该建议书印刷的系数）和下行光行时，二者均可开关；穿越时刻用二分法解至{ "1e-7" } s，中天用黄金分割搜索。可从CLI/绑定作为<c1/>场景类运行（scenarios/passes.toml），两项改正默认开启

seg-19d166cb653f = Orekit { "13.1.8" }（CS GROUP，Apache-2.0）配Hipparchus { "4.0.3" }：在同样的根数集上用TLEPropagator，TEME由Orekit按所述定义构造（其IERS { "2010" } TOD经GAST - GMST旋转），ElevationDetector和ElevationExtremumDetector分别在有无ITURP834AtmosphericRefraction下运行，光行时情形用带AngularRadioRefractionModifier的AngularAzEl，穿越和最大值由Hipparchus求解；{ "60" }个算例（四条轨道，五个海平面测站，遮蔽角{ "0" }、{ "5" }和{ "10" }度，{ "24" }小时）。判据于运行前固定（预先登记e947e69d，72ea9eb0的分支{ "3" }）。忽略光行时（{ "9777" }项失败）或把P.834常数{ "1.728" }改为{ "1.828" }（{ "7883" }项失败），测试即变红。范围：海平面测站；Orekit的P.834 h*theta0^{ "2" }系数为{ "0.011380" }，而建议书印刷的是{ "0.01380" }（已固定），因此高于海平面的高度不做比较。第{ "1" }轮对照Orekit默认的IERS { "1996" } TEME，所有过境判据均成立，但方向判据因{ "72" } mas的TEME约定差而未达到（已固定）

seg-7b4a8e25c3c9 = LEO下行过境中的DVB-S2自适应编码调制

seg-3912fb8ccb15 = 一颗卫星经过一个测站每次过境沿途的下行Es/N0（EIRP、自由空间损耗、余割律大气损耗、其他损耗、G/T、Boltzmann常数、符号率），每一步选取满足ETSI EN { "302" } 307-1 V1.4.1表{ "13" }准无误码门限加实现余量的最高效DVB-S2 MODCOD，该次过境的ACM数据量，以及在遮蔽角和最远距离处仍闭合的恒定编码基线。可作为<c1/>场景类运行。示意性输入；MODELLED。

seg-a7f26e3a6030 = 内部一致性：由表5a的K_bch和帧长以闭式计算的频谱效率，与表{ "13" }印刷的效率一致（对门限表的转录检查）；链路预算各部分与其闭式一致；选择随Es/N0单调并遵守余量；ACM传送的数据量不少于恒定编码。过境几何来自另行VALIDATED的视过境预测器。不包括的内容：未与任何外部工具或实测链路比较；门限是标准给出的理想AWGN值，而非某调制解调器的值；雨衰、沿途的指向损耗和导频未建模。

seg-19603a7e0fe8 = 带冲突消解的多卫星多测站地面接触调度

seg-40edeae6e48b = 来自每次卫星-测站过境的候选接触及其ACM数据量；同一天线在其转换时间内要服务两颗卫星、或一颗卫星要同时向两个测站下行时的冲突；以各卫星积压量为上限的优先级加权交付目标；惰性边际价值贪心方案、先到先服务基线，以及在至多{ "26" }个候选上的精确分支定界，并报告贪心的最优性差距。可作为<c1/>场景类运行。示意性输入；MODELLED。

seg-bc520db98f9a = 内部一致性：精确分支定界在小型随机集上与暴力枚举一致，每个方案均对照冲突规则检查可行，且贪心从不优于精确最优解。不包括的内容：未与任何外部调度器或运行计划比较；接触按整体处理（不拆分），积压量在窗口开始时固定，超出固定转换时间的转向时间和星上存储未建模。

seg-ddf2bc2f13a9 = 单向链路预算（通信 / 链路设计）

seg-83331f513dba = 针对所需Eb/N₀，在CCSDS { "401" } / DSN 810-005链路方程上对EIRP/G·T/距离/速率/频段给出自由空间路径损耗、C/N₀、Eb/N₀、余量和闭合性。可从CLI/绑定作为<c1/>场景类运行（scenarios/link-budget.toml）

seg-195bf7e31f24 = 已发布的深空通信设计控制表，作为固定的数值向量：DESCANSO / J. H. Yuen（编），Deep Space Telecommunications Systems Engineering，JPL Pub 82-76，表1-1（Galileo X波段）——kshana重新组装该表的各行条目，并复现其已发布的端到端L_fs { "290.54" } dB和Pr/N0 { "54.6" } dB-Hz；自由空间损耗还对照ITU-R P.525核对

seg-3742d2aea62a = 精打细算的单位覆盖成本 / ROI框架

seg-4228311689f8 = 在星座规模引擎之上的每百分点覆盖成本 + 每欧元覆盖ROI；每颗卫星的成本是调用方提供来源的低/标称/高区间（没有捏造的价格）

seg-d542ac64c31c = 闭式成本算术对照手工推导的值；这是对建模覆盖数字的经济学表述，不是报价，也不是经独立核对的成本模型

seg-8ba6ee9acc8a = 漏检的完好性影响（情境感知HPL/VPL对告警限值）

seg-f5985399d0d5 = 把未检出的欺骗/压制偏差映射为有效误差 → Stanford区域（可用/不可用/MI/HMI），对照特定情境的HAL/VAL（开阔天空对城市）

seg-124d0ffe959e = 组合经外部核对的RAIM Stanford分类（raim::classify_stanford）；漏检→AL的映射本身由模型得出，不是经认证的完好性分配

seg-37d43b5b918a = CAI引用的误差模型参数表（{ "13503" }）

seg-0b6a901f5ad2 = 带区间（最佳/标称/保守）的冷原子干涉仪性能——偏置不稳定性、速度/角度随机游走、标度因数稳定性、受询问限制的采样率、条纹模糊动态范围——每项均可追溯到引用；供给QuantumNavBudget，而不对硬件建模

seg-4b66096727b8 = 内部一致性：所引用的VRW区间对照CaiAccelerometer::accel_asd物理做交叉核对，并由条纹模糊极限算出原始动态范围；这些数字是MODELLED的文献调研区间（needs_source_confirmation），没有任何器件经独立核对，也没有核对光环

seg-c93f2d3a3167 = 授时完好性conformance基准测试——Stanford完好性图历元分类器

seg-712d5c35a6a6 = TIB Stanford完好性图历元分类（标称/不可用/MI/HMI）

seg-93b913e60063 = 在同一采样集上对四区域规则的独立numpy重新实现（scripts/gen_tib_scorer_reference.py）；方法引自Stanford–ESA完好性图（Tossaint等，ION GNSS { "2007" }）和RTCA DO-229 WAAS MOPS。不是ExternalDataset精度参考基准（oracle）——该基准测试对如实性免疫。

seg-573aa0193cb3 = 授时完好性conformance基准测试——完好性覆盖评分器

seg-4d86f3c2d8f5 = TIB完好性覆盖评分（HMI/MI/可用性比率 + 包络覆盖结论）

seg-645eb084ae8e = tests/fixtures/tib/reference.json中的独立numpy区域重新计数；仅为评分器机制的交叉核对，不作精度声明。

seg-372dd0fdb025 = 授时完好性conformance基准测试——故障目录（参数化生成器）

seg-2604e7cf27d2 = TIB故障菜单（域发散、钟猛调、守时滑行、静态/增量/对称/非对称延迟、新鲜度内重放、路径选择性、k-of-N表决）

seg-b907aecaccd0 = 有代表性的参数化故障生成器（由模型得出）；不可检测集合（对称延迟、新鲜度内重放）引自Mizrahi RFC { "7384" }以及Narula & Humphreys（IEEE JSTSP { "2018" }）。没有外部参考基准（oracle）——故障目录不作实测声明。

seg-90c0eb1e7c14 = 授时完好性conformance基准测试——不可检测量吸收结论

seg-f713acf042ff = TIB不可检测量吸收结论（对称/重放必须由PL吸收，绝不报告为已检出）

seg-6840c2467c63 = 性质检查：Verdict枚举在结构上不可能把不可检测的故障报告为已检出（Mizrahi RFC { "7384" }）；被吸收 ⟺ PL ≥ 偏移。没有精度参考基准（oracle）。

seg-3652a591eefc = 航天器平台工程（AOCS/热控/结构/推进/电源）

seg-50a9c1c7dff0 = 不提供——Kshana是导航性能仿真器，不是平台制造商

seg-a349aa76b0ed = PARTNER

seg-b28dd62dca1c = 导航射频载荷与天线硬件设计

seg-76c983a23e7b = 不提供——Kshana对信号性能建模，而不是载荷/天线硬件

seg-7bba3b35214c = 量子载荷硬件设计与成熟化

seg-15fcc200b859 = 不提供——仅有性能模型；冷原子/时钟硬件由合作方负责

seg-d69dd4c5167b = 飞行硬件产品保证（辐射/EEE/MAIT）

seg-b1540f78ffd4 = 不提供——Kshana只涉及软件产品保证；飞行产品保证由合作方负责

seg-1f200f8efc71 = 月球坐标时

seg-2e6961dbffe9 = 相对论地月时钟速率（LTC/TCL）+ TT/TAI/UTC链接 + 集合

seg-3f52d6e04361 = Ashby & Patla { "2024" }，“A Relativistic Framework to Estimate Clock Rates on the Moon”，Astronomical Journal { "167" }:{ "149" }（NIST；IAU/IAG LunaNet LTC的基础）：月面自身势L_m = { "3.13881e-11" }和长期总量{ "56.02" } µs/天，与已发布数值吻合；地心月球速度对照JPL DE440（经SPICE的de440s.bsp）交叉核对

seg-8adbbd2cdb74 = 光/射频混合报告的自我描述

seg-2a5e48b558e1 = hybrid-optical-rf报告说明其实际运行的链路配置（载波波长、发射与接收口径、距离、脉宽、积分时间、效率与损耗，默认值已解析），并带有一个单位块，给出论文可能引用的每个量的单位和来源类别，包括以平方米为单位的交接协方差迹

seg-23f0c10237f4 = 没有外部参考基准（oracle），也不可能有：这是自我描述，不是测量。之所以记录，是因为缺少它曾是一个缺陷——P5不得不从源码默认值引用载波波长和发射口径，并通过内部一致性检查推断出裸<c1/>的单位是平方米。这一推断是正确的，而这正是它重要的原因：即使它是错的，也没有任何东西能发现

seg-0691f3dee8cb = 射频侧的光/射频混合链路可用性

seg-72ccb655caf0 = hybrid-optical-rf报告给出一个射频链路可用性，它由引擎已经计算的量组合而成，而不是来自导入的气候统计，并把这种组合表述为一条具名规则：A_rf = I_closure * I_track，其中I_closure是单向CCSDS-401 / DSN-810-005链路预算（linkbudget::link_budget，Eb/N0余量 >= { "0" }）在该场景自身距离上的闭合结论，I_track是对同一份预算所返回的C/N0做出的跟踪环路结论（jamming::lock_status）。每个因子都把其输入的来源类别带到输出，而有意不在乘积中的因子——几何可见性、干扰拒止和射频中断气候统计——则连同原因一并指明，而不是悄悄取为{ "1" }。已解析的射频分支作为独立的rf_link_configuration块回显，指示量旁的连续数字（链路余量、C/N0余量、闭式闭合距离与跟踪距离，以及距离利用率）是同一份预算的距离反演。报告在读者所见的块和单位条目中完整说明：该数字受余量/几何限制，且是确定性的，而光学可用性受天气/气候统计限制，且是概率性的，因此二者绝不能作为可比的一对百分比引用

seg-319705ea0166 = 没有外部参考基准（oracle），并且拒绝采用ExternalDataset。两个输入是Eb/N0余量和C/N0阈值穿越，二者都是MODELLED的EIRP、品质因数和集总损耗分配的函数；不存在地月光/射频混合服务的实测可用性记录可用来核对组合后的数字。现有的核对是内部的，并如实说明：组合由报告自身公布的余量重新计算，而不是由发射端内部量计算，闭合距离则通过在该距离上重新运行链路方程并要求余量归零来核对——这是反演往返，而不是独立实现。该数字的诚实局限记录在报告本身：它是确定性的0/1指示量，不是概率，因为本引擎中没有任何东西测量该频段和几何下的射频链路中断分布。该缺失的输入在rf_availability.factors_not_included中指明，而不是被编造，而提供它正是概率性射频可用性所需要的

seg-22c5df9b6c7c = 同等条件下的光学对射频测距比较

seg-70eb396f40af = hybrid-optical-rf报告给出光学对射频测距比，并在同一对象中带上两个分支所评估的唯一配置：同一单向路径、同一距离、同一累积时间。光学分支是引擎基于单向光子计数的光子受限ToA CRLB；射频分支是引擎的DLL超前-滞后热噪声码跟踪抖动，取自引擎自身链路预算对同一单向距离所返回的C/N0。环路噪声带宽是推导出的，而非选定：B_L = 1/({ "2" }*integration_s) 使射频分支恰好处于光学累积时间；如果调用方覆盖它而使两个平均时间不一致，则该比值为REFUSED——null，并指明不一致之处和两个时间——而不是在两个工作点上引用。不对场景所选的参数化rf_position_sigma_m形成比值，拒绝时说明了原因：该输入根本不带配置。已发布的双向光学头条数字以及把它与单向比较分支衔接的精确因子，一并给出在该比值旁，因此报告不会被读成带有两个互相矛盾的光学sigma

seg-acbb3ac98ee3 = 该比值没有外部参考基准（oracle），并且有意拒绝采用ExternalDataset。其底层射频链路确实有——tests/validate_p5_rf_ranging_precision.rs对照独立的Python/NumPy夹具和写死的Kaplan & Hegarty算例值（{ "45" } dB-Hz时{ "2.814e-3" }码片 / { "0.825" } m）检查linkbudget::link_budget和navsignal::dll_code_jitter_chips——光学CRLB也有自己的闭式一行。为本行借用任一锚点，就是借用的核对，而矩阵的不变式正是为防止这种情况而设：这里的量是某个配置下的比值，该配置的EIRP、品质因数、发射功率和口径均为MODELLED，并且不存在在共同工作点上对光学与射频测距的实测比较可供核对。内部检查的是比值真正可能出错之处：两个分支是否处于同一个工作点。做法是缩放共同的累积时间，并要求两个分支按同样的平方根律变化、比值保持不动；当平均时间不一致时，则直接拒绝该比值以强制保证。两个分支都是热噪声/散粒噪声下界，且都不含介质延迟、钟差和模糊度，因此两侧的排除项相同；报告予以说明，而不是留给读者去推断

seg-3f26f598e013 = 链路预算报告的自我描述

seg-b88bf41d6d4c = 链路预算报告说明其余量所依据的每个绝对常数——自由空间损耗所用的载波频率、EIRP、品质因数、集总损耗和Boltzmann项——外加余量为零时所需的G/T，链路常数（EIRP - 损耗 - 所需Eb/N0）（这是已发布的速率/增益表唯一能确定的组合），以及当调用方给出系统噪声温度时，该品质因数所隐含的接收天线增益

seg-52f98f50522f = 没有外部参考基准（oracle）：这是在一个已对照已发布设计控制表核对过的方程之上的自我描述（见单向链路预算一行）。之所以记录，是因为缺少它曾是一个已测得的缺陷——复现已发布的d1_rate_gain_beamwidth.csv，需要从全部三十行反解出一个有效常数，精度{ "0.0034" } dB，而引擎现在既指明了该组合，又通过测试证明：任何已发布的表都不可能把它的三个分量分开

seg-a7b192e27cb5 = 按时钟等级划分的月球时间交叉表

seg-cab605dc6ea2 = 一次月球时间预算运行，为每个时钟等级相对同一个共享的坐标系项输出一行时钟对坐标系的交叉点，因此比较中唯一的变量是时钟；每行带有以两种方式得到的交叉点——由一般幂律钟差曲线二分求得，以及由该行的主导噪声类型代数反解——并给出二者之间的相对差异

seg-ccec15f0b125 = 这是对同一个量在代码库内的两种不同计算，而不是把同一个结果复述一遍：对IEEE-1139幂律曲线做二分，对噪声类型一无所知，而闭式解则以代数方式反解主导类型，因此噪声类型分类错误或区间选取不当，都会表现为不微小的相对差异。这四个值还把论文已发布的表复现到其最后一位印刷数字的一半——但该表本身是由同一个闭式重建的，所以这只是可复现性检查，而不是外部参考基准（oracle），并且与之度量的坐标系项是由模型得出的分配

seg-ff32b78acb8c = 同一行集合上的UT1与极移联合误差

seg-561e588153af = 一张表在每个预报时效的同一历元集合上，给出月球处的UT1预测误差、极移极点误差及其方和根组合，并输出每个分量被测量时的历元。另外，场景会指明当前生效的EOP输入并分解其行统计，并始终输出预测对最终值的时效表，且在表为空时明确说明原因

seg-093191c1ddce = astropy { "8.0.1" } utils.iers（BSD-3）按其自身的Bulletin-B优先、否则A的规则读取IERS finals2000A产品，以及pyerfa { "2.0.1.5" }（SOFA）的完整天球到地球旋转（c2i06a、sp00、pom00、c2tcio；地球自转角按IERS { "2010" }公式{ "5.15" }以精确算术计算），作为单独程序在冻结的2026-09-30 finals2000A.all的逐字行上运行；已预先登记（455b8fb5），并带修订A1和A2，仅固定参考基准的数值精度（两者连同其后的运行均已披露）：表{ "3" }的每个历元列表一致，UT1和极点统计在{ "6e-16" }以内，组合在{ "1.9e-7" }以内，12/12个预测对最终值的算例成立。组合检查无法分辨低于约{ "1e-4" }相对量的极点项误差，因为UT1在其中占主导；极点精度依赖{ "1e-9" }的极点统计检查。历元集合和回退规则是生成器对Kshana定义的镜像，空表状态是设计行为，没有外部真值。量级：IERS Annual Report { "2019" }表3a已实现的预测误差，Kshana/IERS在{ "1" }至{ "90" }天为{ "1.001" }至{ "1.100" }（判据 [{ "0.8" }, { "1.25" }]，实测）。行统计：astropy（离线输入行）。第{ "1" }轮（保留作为回归）：对照{ "178" }期Bulletin A中印刷的精度公式，极点在1.5x以内吻合而UT1不吻合，这是用IERS公式对照其已实现的误差

seg-3692f1fc89e6 = 离线默认的地球定向输入是真实的IERS产品

seg-f9a9d385fd26 = <c1/>运行时默认值是库自带的一份逐字IERS finals2000A摘录（tools/finals2000A_20260930.txt：{ "174" }个连续的每日行，MJD 61224-61397，截自2026-09-30的finals2000A.all），带有该格式定义的全部三种行版本，由IERS的I/P标志分类（eop::row_vintage）：{ "30" }个Bulletin B最终值、{ "54" }个快速实测行（带I标志而无Bulletin B块）和{ "90" }个Bulletin A预测值（P标志）。不带文件参数且无网络的裸运行会输出填充好的逐时效表、行统计rows = final_rows + rapid_rows + prediction_rows（{ "174" } = { "30" } + { "54" } + { "90" }）以及在MJD 61308-61397上predicted_rows.n = { "90" }；预测对最终值比较的发布时截止点是最后一个实测行。较早的32行摘录（tools/finals2000A_2026.txt，每行均为I标志）和五行仅含最终值的节选仍随附并被运行：在它们上predicted_rows.n为{ "0" }，这是输入文件的性质，而不是解析器的结果

seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A（BSD-3-Clause），用其自身读取器读取同样的字节，以及IERS Bulletin A Vol. XXXIX No. { "039" }表，逐个数字抄录；在运行astropy之前，已预先登记（6fdae01b）六条精确准则。六条全部成立：{ "30" }个最终行、{ "54" }个快速行和{ "90" }个预测行，MJD列表相同，每个预测行均为P标志，默认运行的行统计一致，预测值与Bulletin A吻合至最后一位印刷数字。已披露：截取位置是在提交之前，用对标志和Bulletin B块的简单列切片选定的，该切片显示30/54/90；摘录是本仓库从IERS产品中截取的逐字切片（SHA-256见夹具NOTICE）。经独立核对的声明是所随附默认输入的版本分类和行统计及其预测行；任意用户输入按同一标志规则分类，但不属于比较的一部分。{ "0.30" }第{ "1" }轮（已被取代）：较早的默认值把{ "12" }个I标志行称为Bulletin A预测值；引擎现按标志分类。修订：发生变动的默认运行单元格按新旧列于docs/revisions/M035-default-eop-recut-cell-changes.md（predicted_rows { "12" } -> { "90" }，极点下限{ "0.06776" } -> { "0.05550" } mas，地球定向项{ "14.01601" } -> { "14.01583" } m，总计{ "20.09759" } -> { "20.09746" } m以及{ "67.03834" } -> { "67.03790" } ns，tests/golden/realtime-frame-eop.csv的表{ "2" }各行，以及运行预测器的一致性数字）；更早的见docs/revisions/G12-default-eop-cell-changes.md

seg-18c72a7565d6 = 捕获覆盖区随高度与波束宽度的变化

seg-9c30a0ab5233 = 对按方向图加权、受高度限制的地表捕获覆盖区，在发射机高度和天线口径上做双轴扫描，每个工作点输出一行，附各口径所隐含的半功率波束宽度，并把临边捕获作为阈值报告——每行给出临边J/S、其余量以及使其闭合所需的发射功率；每个网格给出所定位的穿越点，或明确说明网格内处处未达临边，并给出差额

seg-4d866b62d4f7 = 集合包含关系：干信比以均匀的分贝偏移进入，因此较高发射功率下的捕获集合包含较低功率下的集合，比例只会上升——Airy方向图在波束宽度或高度上并不具备这一性质，那里捕获区域会碎成环状，比例确实非单调。没有任何已发布的表给出月球轨道发射机的捕获圆盘比例随高度和波束宽度的变化，因此没有可用来核对这些单元格的外部对象；其底层的方向图另行对照已发布的Bessel值经独立核对，并保有自己的一行

seg-fc0a64b9a280 = 月球时间误差预算的可复现性

seg-5d5970506b9c = lunar-time-budget场景把其数组型输出以长格式（网格索引、平均时间、项）表的形式与报告一并发布，使七个逐项x(tau) 曲线和方和根总量成为引擎输出，而不是读者根据方法章节自行重建的东西

seg-62df6258bc62 = 仅为自洽：已发布的总量对照同一文件中各项的方和根检查，且输出的曲线在全部{ "57" }个点上复现已发布的p3_time_budget_curve.csv。这两项检查共用本引擎自己的项定义，因此都不是独立的。时钟项依据已发布的时钟规格，但链路、坐标系、相对论和星历下限的量级是有文档记录的预算分配，没有外部参考基准（oracle）

seg-675887733454 = 月球测站时间实验室：miniRAFS守时对LTC

seg-af3ff120b707 = 月球测地VLBI

seg-cfd7d0126028 = 地球基线观测月球信标的近场VLBI时延 + 偏导数

seg-d1943f9932af = 远场极限下的平面波delta_dor（同代码库）；有限差分偏导数。{ "0.30" }外部比较，一项发现（仍为MODELLED）：对照ANISE { "0.10" }经DE440的收敛光行时（2024-01-01的{ "75" }个时延，覆盖三条DSN基线，由xval/anise-lunar-od不使用Kshana代码生成），没有任何时延落在{ "1" } ps容差之内。最大差距为{ "24" } µs，来自解析的月心（距DE440约{ "200" } km）、没有光行时迭代的单一瞬时几何（{ "3.6" } µs）以及被舍去的极移；信标偏导数的相对差异最大{ "2.9e-3" }，而判据为{ "1e-6" }。模块文档中关于坐标系近似低于模型保真度的说法，在这一水平上并不成立。{ "0.30" }第{ "2" }轮：星历核路径（lunar_vlbi::KernelGeometry）在其自己的一行“月球测地VLBI，星历核路径”中对照NAIF SPICE光行时经独立核对；对该路径的ANISE比较（75/75在{ "1" } ps以内，最差{ "0.12" } ps，tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference）仅为星历核求值的交叉核对，因为该测试装置中的光行时求解是本项目自己的。本行（解析默认路径）连同上述发现仍为MODELLED

seg-d12d4565b01d = 月球测地VLBI，星历核路径

seg-11e1c942e41c = 地球基线观测月球信标的近场VLBI时延，附信标和测站偏导数，采用星历核路径（lunar_vlbi::KernelGeometry）：DE440地球与月球、DE440月球主轴、带UT1和极移的ITRF93地球定向，每个光行时在质心系中收敛，偏导数带光行时因子1/(c - u.V)。可作为<c1/>场景运行，需设置planetary_kernel_path、earth_orientation_kernel_path和moon_orientation_kernel_path；经独立核对的输出是星历核路径的geometric_delay_s序列和epoch_partials。在星历核路径上，delay_s加上解析的差分Shapiro项，该项未被比较，delay_rate和near_field_correction_us也未被比较

seg-c7f6842b6019 = NAIF SPICE Toolkit N0067（spiceypy { "8.2.0" }，MIT）收敛牛顿式光行时（spkcpt/spkcpo，CN），从固定于MOON_PA_DE440的信标到DSN测站DSS-14、DSS-43和DSS-63，测站取自NAIF测站星历核earthstns_itrf93_260814.bsp，并配de440s、moon_pa_de440_200625、moon_de440_250416.tf、earth_latest_high_prec和naif0012；偏导数是SPICE光行时的五点中心差分，而不是Kshana的1/(c - u.V) 公式。已预先登记（a689c797，{ "2024" }年历元），判据为每个时延{ "1" } ps，每个偏导数相对{ "1e-6" }。首次运行失败（17/75个时延在{ "1" } ps以内，最差{ "1.03e-11" } s）：SPICE把ET存为一个双精度数，其在{ "2024" }年的间距使发射历元舍入最多{ "6e-8" } s，约合{ "6" } ps光行时，而残差与该舍入的相关系数为{ "0.99999" }（已固定；审阅者独立复现了它）。修订66e365d4写于该结果之后、其夹具存在之前，把同一参考基准和判据移到J2000附近的{ "25" }个每小时历元，那里ET间距至多为{ "1.5e-11" } s：75/75个时延在{ "1" } ps以内（最差{ "6.2e-14" } s），75/75个信标偏导数（最差{ "7.4e-9" }），150/150个测站偏导数（最差{ "3.8e-11" }）。不在声明范围内：解析默认路径（级数月球与平均月球坐标系，经DE440对照ANISE为{ "24" } µs，见“月球测地VLBI”一行）、场景以解析方式加入的差分Shapiro项、介质，以及质心到地心的尺度

seg-1f10810131be = NAIF星历核读取器：DAF容器、SPK类型{ "2" }和二进制PCK类型{ "2" }

seg-7da4847e7a28 = 引擎自己的纯Rust NAIF二进制星历核读取器（naif_kernel）：DAF容器（两种字节序，链接的摘要记录），经其中心链接到最低公共祖先的SPK type-2 Chebyshev位置段，以及被转成J2000到本体旋转的二进制PCK type-2欧拉角段，历元取为两部分ET，使亚微秒偏移保持精度。KernelEphemeris（ephem_provider）以及lunar_vlbi、lunar_llr和lunar_vlbi_fim的星历核路径都经由它读取DE440。所声明的是它能正确读取JPL星历核；并不声明DE440或引擎的解析太阳与月球级数是精确的

seg-09773b73d785 = 同样的NAIF文件上的两个独立星历核读取器：NAIF SPICE Toolkit N0067（经spiceypy { "8.2.0" }的CSPICE，MIT；spkezr和pxform）以及ANISE { "0.10.6" }（Nyx Space，MPL-2.0；Almanac.translate和Almanac.rotate），均作为单独程序在de440s.bsp和moon_pa_de440_200625.bpc上运行。在任何夹具或参考基准值存在之前已预先登记（abcd9133）：网格种子取该提交哈希的前{ "16" }位十六进制数字，因此无论是{ "200" }个历元还是天体对，都不可能在已知结果的情况下选定；每个历元还带有月球和太阳相对地球的状态。判据由双精度Chebyshev求值预先固定（至多{ "15" }个系数，每次求值n^{ "2" } u = { "2.5e-14" }，每侧两次求值和至多两跳）：位置{ "1e-13" } R + { "1e-5" } m，速度{ "1e-13" } V + { "1e-10" } m/s，R和V取相对最低公共祖先的较大量值；旋转元素{ "1e-13" } W + { "1e-15" }，W为覆盖记录的系数和；ANISE因其纳秒历元再加{ "2" } ns的相对运动。结果：{ "600" }个状态和{ "200" }个旋转，每个都在对照两个参考基准的判据以内，对截取版和完整星历核均如此；最差为判据的{ "6.0e-3" }（位置）、{ "5.9e-3" }（速度）、{ "3.7e-3" }（旋转）。变异测试：在 -s处对每条记录求值会使{ "3597" }项比较失败。已披露：此前对照SPICE的25个历元检查（{ "4.6e-5" } m，tests/naif_kernel_reader_check.rs）在本行之前就已看过，不属于其证据；夹具生成器首次运行因网格区间为空而中止，未产生任何值，已修正。双方读取的都是DE440，因此吻合核对了读取器，而不是星历

seg-e08e98908f3a = 月球距离处的Earth-GNSS

seg-dd8ce373d1f6 = 月球距离处的Earth-GNSS接收：P7表{ "1" }所指的弱信号层，而引擎此前没有对应模型。针对每颗卫星和每个历元，它计算相对发射机天底的离轴角、地球是否遮挡直线路径、斜距及其自由空间损耗、该角度处的发射增益、接收功率和载噪密度比；然后只汇总越过跟踪阈值的链路，并扫过整整一圈星座运行，使答案是一个分布，而不是单个快照。三个事实决定结果，报告对每一个都有说明：从星座半径看，地球张角为{ "13.90" }度，因此波束峰值在几何上对任何射向月球的射线都不可用；剩下的是主瓣边缘和旁瓣，也就是LuGRE于{ "2025" }年在月球上运行时所处的状态；而L1路径损耗约为{ "208" } dB，比地面用户多约{ "25" } dB。在所随附的24颗GPS级几何上，对一个轨道周期的{ "64" }个历元实测：信号可用性{ "0.375" }，最佳链路{ "30.93" } dB-Hz，而定位可用性{ "0.000" }——同时可跟踪的链路至多两条，从未达到定位所需的四条。这两种可用性之分正是要点，报告也不允许把它们混为一谈：月球距离处的Earth-GNSS是授时级的层，而不是定位级的层，分层韧性的先验必须取定位可用性。输出条件数也是出于同样的原因——从月球看去，每颗可见卫星都落在只有几度宽的锥内，因此视线按构造就近乎平行。可作为<c1/>类场景运行。按D7重述：月球距离处的声明是同一历元各卫星之间的相对载噪密度比，依据实测的二维发射方向图（NAVCEN Block IIR/IIR-M），再加几何可见性；不声明绝对C/N0（Parker等报告共同损耗为{ "7" }至{ "12" } dB）。

seg-bed2679f88e5 = 闭式恒等式与内部一致性；不声称有外部参考基准（oracle）。月缘半角对照asin(R_earth/r_orbit) 检查，几何对照它检查；本行所组合的自由空间损耗、DOP核和SGP4传播各自在自己的行中经外部核对，本行不借用它们的状态。为何为MODELLED，原因在于发射方向图：给定角度处的增益取自均匀照射圆形口径的Airy方向图，而真实的GPS L1天线是十二单元螺旋阵列，主瓣经过整形、峰值偏离视轴以使整个地球盘面功率均匀，其旁瓣也不是Airy形。已发布的实测方向图存在，但未纳入本库，因此排序和数量级是可信的，而任何单颗卫星的dB值则不然。本行的首个实现曾有一处值得记录的错误：Airy表达式仅在前向半球有效，其自变量按sin(theta) 变化，在theta接近{ "180" }度时会绕回并在口径背后返回满视轴增益——于是首份报告中最强的两条链路是天线背向月球的卫星，而它们恰是仅有的两条越过阈值的链路。现在在口径背后模型采用平坦的背瓣下限，作为一个界给出，而不是编造方向图形状。有意缺失、且各使预算偏乐观的内容：掠过月缘的射线没有电离层或对流层损耗，没有极化、指向或实现损耗，且采用无折射延伸的球形地球。月球位置是输入，而不是星历查询，因为被检验的量是链路和波束几何。若要把本行升级为经独立核对，需要实测的发射方向图和LuGRE的正常点来核对；二者都不在仓库中，也都不在此编造。{ "0.30" }第{ "2" }轮，一项发现（仍为MODELLED）：一条以实测为输入的链路路径（真实SP3位置、逐Block发射功率、列表化的发射和接收方向图、捕获与跟踪滞回）对照Montenbruck等{ "2023" }表{ "3" }中{ "6000" } km处的GENESIS做了核对（预先登记5b414f0a）：天顶天线均值在{ "6" }项中有{ "5" }项与论文灵敏度相差在一dB之内；天底天线均值比印刷值高{ "1.0" }至{ "2.4" }颗卫星，原因很可能是该论文使用了未公布的随方位角变化的GPS旁瓣方向图。本行的月球距离数字仍使用Airy替代。{ "0.30" }+ D7，一项发现（仍为MODELLED）：重述后的量，即同一历元所跟踪的Block IIR/IIR-M卫星之间的C/N0差，用NAVCEN逐SVN的实测L1方向图（二维，偏航转向坐标系）预测，对照LuGRE飞行C/N0（预先登记768cb62b：{ "99" } % 可见，成对RMS <= { "3.0" } dB，中位数<= { "2.0" } dB，至少{ "50" }条记录和{ "30" }个配对），数据太少：{ "26" }个合格的转移和月球轨道历元仅含{ "15" }条被跟踪的IIR/IIR-M记录（所跟踪的多为IIF和III）和一个配对。全部{ "15" }条均被预测为可见，该单一配对的残差为 -0.06 dB；不作任何声明

seg-29df5b40a3f9 = 月球轨道确定：Earth-GNSS对地面射电测量

seg-647902ebcee3 = 在近直线晕轨道（或椭圆冻结轨道）中，用两种独立数据类型做定轨：星上接收的Earth-GNSS伪距（采用月球距离处Earth-GNSS一行的链路规则，加月球遮挡），以及来自三个深空网测站的地面双程测距和测距速率。每种都是围绕参考轨道的一步批处理最小二乘，带其形式协方差；对两个估计之差做带随机种子的蒙特卡罗，检验两个协方差能否解释该差（q = d' (P_G + P_R)^-1 d，模型吻合时为六自由度的卡方），以及未建模加速度对该统计量有何影响。

seg-652bdc29deea = 月球载波相位整周模糊度解算：月面与轨道器

seg-02496f9e9af2 = 月面测站与轨道器处的接收机间单差Earth-GNSS载波相位和码，逐历元的钟差已被剖离，每个连续过境一个模糊度，以最长过境作为基准。浮点模糊度协方差是一个Schur补；LAMBDA解算整数，自举成功率与带随机种子的蒙特卡罗整数最小二乘成功率以及浮点和固定位置sigma并列报告。如实报告：在登记的{ "12" } dBi下，双差问题无法构成（修订{ "1" }在只看到可用性计数之后把默认值改为{ "25" } dBi），而在{ "25" } dBi下，整数固定未能实现——遥不可及（至多百分之几），尽管浮点解随弧段增长而改善。

seg-8d8296752eb8 = 一个独立的numpy对导出行上的同一正规方程求解（Q3），以及暴力整数枚举（Q4）。没有与任何GNSS或月球载波相位测量比较。MODELLED。

seg-11dd1bb8e4e1 = 月球坐标系联合估计：月面测站与轨道器

seg-a38c8d95e6c9 = 七参数月球坐标系基准的Fisher信息：仅用地球测站对五个反射器的激光测距，以及加入轨道器对月面测站测距之后：信息矩阵、秩、Cramer-Rao sigma、月球可辨识性模块的退化度量以及带随机种子的随机测站集。轨道在月球轴系中视为已知（其误差由轨道器测距sigma承担）。

seg-47d2afc53b3d = 一个独立的numpy对前向模型的有限差分（F2）。没有任何内容与真实的月球坐标系解比较。该因子以假定的已知轨道和{ "1" } m的测距sigma为条件。MODELLED。

seg-862977c4bb01 = 空间联结的坐标系联结精度：同址GNSS、VLBI与激光测距

seg-a9ae8e99f00d = 当同一航天器同时携带三种技术时，GNSS、VLBI和激光测距坐标系之间技术间平移、尺度和旋转偏移的Cramer-Rao精度，在每个历元消去航天器位置，并带九个带先验的局地联结冗余参数，随局地联结精度扫描。协方差用平方根法求得（技术接近完美时，正规方程会丢失数字）。

seg-b37ac7294112 = 一个独立的numpy堆叠系统，位置未知量由显式Schur补消去（T3）。没有与GRASP、Genesis或其他任务数据比较。MODELLED。

seg-ae627996875e = 月球勒夫数与天平动灵敏度

seg-28780d07c4a7 = h2、k2、l2以及物理天平动振幅的Fisher信息，来自激光测距（径向与水平潮汐位移、反射器旋转）、轨道器跟踪（沿视线积分的degree-2 k2加速度，已去除趋势）、月面重力仪（重力因子{ "1" } + h2 - { "1.5" } k2）和月面时钟（分数速率 ({ "1" } + k2 - h2) W2/c2，与月球时间常数相联系）。h2和l2的名义值是线性化点；该研究说明的是什么对什么敏感，而不是这些数值是多少。

seg-180d74388339 = 一个独立的numpy有限差分组装（G2）和闭式求值（G4）。轨道器族的k2灵敏度是上端数字（此处轨道状态只吸收一个常数和一个趋势）。没有与任何月球潮汐或天平动测量比较；k2引自Lemoine等{ "2014" }，作为名义值。MODELLED。

seg-da712b740519 = 月面信标DOP增强

seg-83e6341e01b1 = 月面用户的信标增强精度因子：可见卫星的视线行与可见月面信标的测距行被拼接成一个设计矩阵，经共享的DOP核求值，所得DOP再经每个信标的用户等效测距误差映射为以米计的已实现1-sigma精度，该误差由时钟同步、多路径和测量项的方和根组成。信标可见性是无大气月球的双高度几何地平线，它没有折射延伸，因此是精确的而非近似的。可作为<c1/>场景类运行，它报告仅卫星、卫星加信标，以及作为达到同样几何的竞争路线的更大星座。在所随附的黄金几何上实测（用户位于 -80度，三个已测量的信标，t={ "0" }时六颗卫星的示意性LCNS，{ "5" }度遮蔽角）：{ "5" }颗可见卫星给出PDOP { "9.6941" }和3-D 1-sigma { "11.222" } m；加入真正越过地平线的信标后，PDOP为{ "4.1160" }，精度为{ "4.765" } m，改善倍数为{ "2.355" }；24颗卫星的服务则给出PDOP { "2.4226" }和{ "2.804" } m，改善倍数为{ "4.002" }。报告打印的是可见信标数，而不是配置的数目，在这一几何上，三个信标中只有一个越过地平线：两个侧翼站点距用户约{ "333" } km，而{ "2" } m天线的地平线为{ "86" } km，因此读者不会误以为三个都有贡献

seg-179fb996fc72 = DOP运算即crate::orbit::dop内核，已在tests/dop_reference.rs中对照gnss_lib_py单独做过外部核对；本行不沿用那一行的状态。信标可见性地平线采用L01闭式解，sigma = DOP x sigma_URE是标准的GNSS关系式（Kaplan与Hegarty，Understanding GPS/GNSS，第{ "7" }节）。在本行之内，增强本身对照仓库内独立的DOP路径进行核对，并固定到已提交的golden基准。为何为MODELLED：星座设计、信标布设、天线高度以及全部三项误差预算量值都是示意性输入，不是实地测量或实测链路，因此所报告的米数是所选场景的属性，而非任何已部署服务的属性。关于来源的说明：该能力曾在README中宣称，并有两项验证测试加以演练，却没有矩阵行，也没有场景类型，因此根本无法通过一次运行触及。它同时存在于行文之中、缺席于台账、在引擎中无法访问。现已把这一行和这一类型一并添加。{ "0.30" }第{ "2" }轮（预先登记db0eb9ec），受阻（仍为MODELLED）：ANISE { "0.10.6" }的可见性与在该行几何上算出的numpy DOP一致（可见集合完全一致，包括{ "72" }个近地平线情形和{ "48" }个近掩模角情形；DOP偏差在{ "7.2e-13" }以内），但所报告的米数是DOP乘以一项示意性的{ "1.158" } m均方根测距误差，没有参考基准；排除这些米数的范围界定有待所有者决定

seg-b0b618abf402 = 共模完好性盲区

seg-e732ac99a9ae = 把测量误差精确地按奇偶子空间拆分为RAIM看不见的部分和能看见的部分。对线性化的快照模型y = G·x + e，任何误差dy都唯一地分解为range(G) 中的不可见（BLIND）分量，以及奇偶空间中的可检测（DETECTABLE）分量：前者被吸收为状态误差S·dy，并被残差投影算子Pperp = I − G·S湮灭，因此对任何残差检验都不可见，而不只是对某个特定阈值不可见。该模块返回投影算子、拆分结果和不可见比例，使调用方能够量化快照监测器在结构上无法报告某一特定误差的多少。应用于真实的星历间基底：地心月球位置上DE440与INPOP21a、DE440与EPM2021之间米级的差异，几乎完全被吸收为用户位置误差（不可见比例的中位数为{ "1.000000" }；不可见位置误差的中位数为{ "2.3955" } m和{ "2.0050" } m），而奇偶残差只有{ "1e-15" } m量级

seg-077303e9dd72 = P2：numpy linalg.lstsq（LAPACK gelsd SVD，BSD-3）在已提交的输入上重新计算最小二乘拆分，这些输入带有真实的奇偶部分（dy = E·Δs + w，w ~ N({ "0" }, { "1" } m)，随机种子{ "20261001" }），几何为8颗卫星及其6颗卫星子集，覆盖两组真实星历间差异，共{ "1464" }个算例，预先登记（f672a314）：blind_dx、residual、blind_norm和detectable_norm相对 |dy| 的偏差在{ "1e-12" }以内，blind_fraction的绝对偏差在{ "1e-12" }以内（最差blind_dx为{ "1.06e-14" }，residual为{ "4.4e-15" }，blind_fraction为{ "3.1e-15" }）。numpy自行由已提交的位置构造G，而引擎使用正规方程与Gauss-Jordan；斜左逆会使该测试在{ "5.5e-2" } |dy| 处变红。修订{ "1" }（86c53301，首次运行之后，已披露）只放宽了对奇偶比例的一项输入前提条件（每个算例至少{ "1e-3" }，且每种几何中{ "95" } % 至少为{ "0.05" }），没有改动一致性判据。如P2所允许，经独立核对的结论是：在这些输入上拆分的线性代数；星历间基底的量值和示意性的月球几何（{ "8" }个LCNS类节点，位于{ "5000" } km）是输入，未经核对，而盲区是所有快照RAIM已知的属性。第1轮的numpy比较（tests/lunar_common_mode_integrity_reference.rs）只核对了恒等式S·G = I，因为其输入位于range(G) 之内；它作为回归测试保留。星历来源：tests/fixtures/inter_ephemeris/NOTICE.md（JPL、IMCCE、IAA RAS）

seg-845e9f5eec81 = 共模保护级与总完好性包络

seg-2246ffa73869 = cmpl_horizontal通过构造blind_position_covariance = S*Cov*S^T并将其投影到ENU，界定不可见共模类所贡献的k倍sigma水平位置误差；integrity_envelope报告hpl_total = hpl_araim + cmpl。这一对量要说明的区别是：RAIM/ARAIM的残差（RESIDUAL）检验对range(G) 误差可证明是盲的，但ARAIM保护级（PROTECTION LEVEL）并不盲：其无故障项已把这些误差界定到提供方URA加标称偏差的程度。因此CMPL只是单个提供方的各提供方URA/ISM未能包络的跨提供方超出量（EXCESS），而这个和是保守的三角不等式界，不是RSS，仅在该超出量尚未包含于URA之内时才成立。

seg-ffc59a7ed497 = 解析的投影算子代数与自身相互核对：限于range(G) 的协方差必须给出正的CMPL，限于奇偶空间的协方差必须给出近似为零，并且包络必须是两项在测量空间中相互正交的贡献之和。共模协方差、星座几何和k是有代表性的模型输入，不是经认证的预算，也不声称三角不等式界是紧的。关于来源的说明：cmpl_horizontal、blind_position_covariance和integrity_envelope是公开且已发布的，其单元测试也早已被共模盲区那一行引用，但包络这一结论本身（ENVELOPE CLAIM）没有对应的行，因此使其保持诚实的那条限定，即这个和是三角不等式界而不是RSS，在台账中无处陈述。这一行把该结论和该限定一并登记。

seg-5ed34a5b402e = 月球多技术联合定轨与时钟

seg-5ace1caff5a9 = 对VLBI、月面局部测距和星间测距做批处理融合，以恢复测站与星座的位置和时钟

seg-82824963aef7 = P2：numpy { "2.4.6" }（numpy.linalg.lstsq配合LAPACK gelsd，以及numpy.linalg.inv；BSD-3）在六个模拟网络已提交的雅可比矩阵和观测上，重新计算每一步Gauss-Newton迭代、收敛的加权最小二乘解、形式sigma和测站误差，预先登记（5094bc31），相对判据为max({ "1e-8" }, { "100" } kappa eps)。首次运行在无VLBI的网络上失败（{ "6.1e-7" }，对照{ "1e-8" }，这是条件数为{ "1.4e5" }时的正规方程求逆）；该结果之后所写的引擎修复（batch_ls::gauss_newton_qr，一个由estimate和formal_covariance使用的Householder QR步骤）在不变的判据下重新运行：步长为{ "1.1e-14" }至{ "2.4e-11" }，sigma至多{ "1.3e-11" }。经独立核对的结论是这些输入上的融合求解线性代数，而不是模拟网络的物理量值或其观测模型：月球大地测量VLBI时延这一行仍为MODELLED（其解析路径与ANISE相差最多{ "24" } µs），坐标系另有各自的行。对注入的模拟真值的恢复和NEES一致性仍属内部检验；先前的Orekit { "12.2" } / Hipparchus Levenberg-Marquardt交叉核对（tests/lunar_joint_multi_technique_od_reference.rs）演练的是batch_ls::gauss_newton，而estimate已不再调用它，该核对作为对这一基础函数的检查保留。{ "0.30" }修订：默认的lunar-joint-od-clock测站误差，有VLBI时由{ "3.541344" }变为{ "3.541350" } m，无VLBI时由{ "2183.119" }变为{ "2183.558" } m（QR求解）。{ "0.36" }修订（STUDIO-15，可移植数学；docs/revisions/STUDIO15-portable-math-rebaseline.md）：有VLBI时由{ "3.541350" }变为{ "3.536885" } m，无VLBI时由{ "2183.558" }变为{ "2184.021" } m，并且无VLBI的求解在{ "5" }次迭代后停止，而不是{ "2" }次（在病态网络上由舍入误差限制而停止）；预先登记的比较在重新导出的输入上、于不变的判据下重新运行（numpy { "2.4.6" }，六个网络全部通过）

seg-5fcf18a68bb1 = 量化在合理的加权单纯形和威胁集合下，单一综合得分 / RPCF Level如何重新排列各架构的次序（top-1翻转率、Kendall-tau离散度、Level翻转率、排名范围）；以及声明值与实测值对比和多样性坍缩分析。

seg-043ece801e72 = 光学中断期间的授时与测距连续性

seg-b119df65d2a7 = 光链路裕度随时间变化：某一站点天气的一次带随机种子的实现

seg-58cbf576c959 = TRK-2-18轨道数据文件读取器与火星斜坡式2-way多普勒模型

seg-d1055650a77f = DSN轨道数据文件（TRK-2-18）的读取器：36字节的记录组（文件标签、标识符、轨道数据、各测站斜坡、时钟偏差、摘要、文件结束），以及每条轨道数据记录中的自{ "1950" }年起算的时间标记、下行与上行时延、观测量、测站、数据类型、频段、有效性、通道、航天器、46位参考频率和压缩时间；斜坡的起止时间、速率和起始频率。在此之上，还有斜坡式2-way X波段多普勒模型（积分的上行斜坡、含Shapiro效应和对流层的往返光行时、经IAU 2006/2000A CIO链和IERS EOP的DSN测站、测站时间），以及火星轨道器批处理定轨（GMM-3场、第三体、SRP、阻力）。

seg-6d533149f6f0 = DSN导航数据调理流程随该文件一起生成的PDS3标签（NASA PDS Geosciences Node，MRO-M-RSS-1-MAGR-V1.0），对照在读取器出现之前就已在xval/mro-odf/PREREGISTRATION.md中预先登记的判据进行核对。为MODELLED，是因为有一条登记的判据（文件结束表的行数，文件中为{ "121" }，标签中为{ "120" }）未达到；标签在此处自身不一致。第{ "2" }阶段（xval/mro-od/PREREGISTRATION.md，修订A1和A2均在评分结果之前）：由MRO导航团队重建结果（mro_psp5，NAIF）预测的多普勒，与观测到的斜坡式2-way多普勒在开发中未使用的弧段上相符到{ "12.5" } mHz，达到判据；登记的定轨在评分弧段上失败（正规矩阵非正定），没有产生轨道，因此轨道判据未达到。第{ "2" }次运行（xval/mro-od/PREREGISTRATION-RUN2.md，阻尼估计器，同一弧段和判据，评分修订R2-A1已在docs/revisions中披露）收敛：估计轨道与重建结果的均方根偏差在{ "0.36" } km以内（最大{ "0.53" } km），达到判据，但拟合后多普勒均方根为{ "48.6" } mHz，对照{ "30" } mHz的判据，未达到，因此这一行仍为MODELLED。不包括的内容：没有任何一条估计轨道达到了全部登记判据；电离层、太阳等离子体以及大部分天线偏移（在开发弧段上拟合了一个{ "1.5" } m的径向偏移）均未建模。

seg-c7d292f14693 = 使用反作用轮的闭环MRP反馈姿态控制

seg-f33781b74cc2 = 带有三个或更多平衡反作用轮的刚性中心体的惯性指向姿态控制：MRP反馈律L_r = -K sigma_BR - P omega_BR（Schaub与Junkins）、截断到各轮限幅的最小范数轮电机力矩G_s u = -L_r、中心体与轮的耦合动力学（中心体惯量含轮的自旋惯量）、四元数运动学、带零阶保持的RK4。可作为<c1/>场景类型运行（真实状态回路）。

seg-9563d5843891 = Basilisk { "2.9.1" }（AVSLab，ISC；bsk轮运行为单独的工具，从不链接或内置）：航天器中心体、reactionWheelStateEffector（BalancedWheels，开启力矩限幅）、simpleNav、inertial3D、attTrackingError、mrpFeedback（无积分项）和rwMotorTorque，dt = { "0.1" } s并采用其自带的RK4，在三种算例上与Kshana自身的实现对照（三个正交轮；四轮金字塔构型；一个饱和的四轮算例），判据在代码和运行之前已在xval/aocs-basilisk/PREREGISTRATION.md中预先登记。所有判据在首次运行时均成立。不包括的内容：回路中的传感器噪声、积分反馈、跟踪制导、轮摩擦、抖动、转速限制与功率，以及任何真实航天器的增益；这一比较检验的是该控制律和动力学的实现与独立实现之间的一致，不是飞行控制器。

seg-455dc946c965 = 基于陀螺和星敏感器的乘性EKF姿态估计

seg-553d043438b4 = Lefferts-Markley-Shuster乘性EKF：本体系姿态误差和陀螺偏置状态，以陀螺速率减去偏置估计并采用Farrenkopf离散过程噪声（角度与速率随机游走）进行传播，星敏感器更新采用Joseph形式的残差{ "2" } vec(q^-1 q_st)，以及乘性重置；还有Farrenkopf离散陀螺与星敏感器模拟器。<c1/>类型可以基于其估计值闭合控制回路。

seg-846cb1eeb35c = 内部一致性：滤波器的归一化估计误差平方，对照由相同传感器模型模拟的真值，遍历蒙特卡罗随机种子；以及姿态和偏置估计的收敛。不包括的内容：没有与外部估计器或飞行数据比较过（Basilisk { "2.9.1" }没有MEKF模块）；传感器模型是教科书式的，不含安装失准、标度因子或星敏感器视场效应。

seg-059732bda693 = Wahba/TRIAD/QUEST姿态确定

seg-3ee6e56d790f = 由加权矢量观测（恒星/太阳/磁强计方向）得到最优三轴姿态：确定性的双矢量TRIAD、Davenport的q方法（Wahba损失的精确极小化器：最优四元数是{ "4" }×{ "4" } Davenport矩阵K最大特征值对应的特征向量，由对称Jacobi特征求解得到），以及QUEST（以 Σ 权重为初值，对K的特征方程做Newton/割线求根，再恢复Gibbs矢量四元数）

seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors（SciPy { "1.13" }；Virtanen等，Nature Methods { "2020" }）：Wahba问题的Kabsch/Markley SVD解，是真正独立的算法（姿态剖面矩阵的SVD）和代码库，不同于kshana的Davenport-K特征求解/QUEST特征根方法，计算的是同一个唯一确定的Wahba最优姿态。在无噪声的加权矢量观测集上，TRIAD、q方法和QUEST复现scipy的最优旋转，偏差小于{ "1e-9" } rad（通过与符号无关的姿态误差角比较）。带噪声的蒙特卡罗“最优优于TRIAD”这一统计结论仍为MODELLED（没有外部参考基准）；仅限点方向的单位矢量观测，不含传感器视场/偏置/时间相关性建模，且QUEST在{ "180" }° 处奇异（q方法涵盖该情形）

seg-cd342cc48afc = GNSS平方律捕获检测统计量

seg-6d97452de33e = 在码相位 × 多普勒搜索上的平方律（非相干）捕获检测器：虚警概率（自由度为2M的中心 χ²），达到目标P_fa的门限（对 χ² 累积分布函数用二分法求逆），以及检测概率（对每个单元相关后信噪比 ρ，非中心参数为2M·ρ 的非中心 χ²），并含广义Marcum Q函数Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2（SciPy { "1.13" }；Cephes/Boost）：是与kshana的不完全伽马级数（raim::chi2_cdf / noncentral_chi2_cdf）不同的独立算法（连分式非中心/中心 χ²），计算同一个唯一确定的检测统计量内核（KERNEL）：广义Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²)、检测概率P_d、虚警概率P_fa以及由P_fa到门限的反演，符合到约{ "1e-6" }；独立性的依据与经独立核对的“RAIM/ARAIM完好性统计内核”行相同。仅限内核（KERNEL）：逐单元的CFAR单元平均以及码/多普勒单元跨越损失仍为MODELLED

seg-77f425a38aa2 = GNSS载波相位整周模糊度解算（LAMBDA）

seg-410ce8b6cebf = 按LAMBDA方式的整数最小二乘模糊度固定：保持体积的整数（Z）去相关变换（对L D Lᵀ 因子做整数Gauss尺寸缩减），加上精确的Schnorr–Euchner深度优先分支定界整数最小二乘搜索，并对两个最佳候选做比值检验（经独立核对的结论）；另有闭式的自举成功率P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" })，仅做了内部核对，不在经独立核对的结论之内

seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda()（其lambda.c源文件，T. Takasu，BSD-2-Clause），一个独立的LAMBDA缩减和MLAMBDA搜索，由C编译并作为工具运行，在{ "300" }个随机协方差上（n为{ "2" }至{ "10" }）：整数最小二乘有唯一的极小解，因此固定的整数必须完全一致（{ "0" }处不一致），而供比值检验使用的两个最佳平方范数，相对偏差在{ "1e-9" }以内（实测{ "5.6e-13" }）；容差在比较之前就已确定。经独立核对的结论：ILS解及其两个最佳范数。RTKLIB不计算自举成功率，该项仍对照舍入过程的蒙特卡罗做内部核对；Z变换的不变量以及暴力枚举仍作为辅助检查。仅限整数Gauss去相关（完整LAMBDA缩减中的重排置换会加快搜索，但既不改变精确的ILS答案，也不改变自举成功率）

seg-4ad1ec05610f = B平面瞄准与圆锥曲线拼接引力辅助

seg-d249aea7c3ea = 双曲线飞越几何（a=−μ/v∞²，e={ "1" }+r_p·v∞²/μ，转角 δ={ "2" }·asin(1/e)，瞄准参数 |B|=|a|·√(e²−{ "1" })），B平面 Ŝ/T̂/R̂ 瞄准点坐标系及B·T̂/B·R̂ 分解，以及圆锥曲线拼接引力辅助（v∞ 的大小守恒，方向偏转 δ，日心 Δv={ "2" }·v∞·sin(δ/2)，不耗推进剂），以及Tisserand参数T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

seg-1ec7b0d8a32c = GMAT R2026a（Apache-2.0，作为单独的程序运行）在{ "192" }个双曲线地球状态上：B.T、B.R和 |B| 偏差在{ "1e-6" } km以内（最差{ "1.35e-8" } km），转角和两条渐近线偏差在{ "1e-9" } rad以内（最差{ "9.3e-15" } rad）；由GMAT的C3和渐近线得到的辅助速度变化偏差在{ "1e-9" } v_inf以内（最差{ "5.6e-14" }）；辅助前后{ "350" }个以太阳为中心的状态上的日心SMA、ECC和INC，相对偏差在{ "1e-9" }以内，角度偏差在{ "1e-12" } rad以内（最差分别为{ "2.2e-14" }和{ "4.1e-14" } rad）；Tisserand参数在GMAT轨道根数上对照sbpy { "0.6.0" }（BSD-3），偏差在{ "1e-9" }以内（最差{ "1.3e-15" }），并对照{ "3" } - C3/v_c^{ "2" }（{ "8.9e-16" }）；Tisserand闭式解对照Kasuga与Jewitt（{ "2019" }）表{ "8.1" }中{ "12" }个天体，在印刷舍入界之内（最差为该界的{ "0.39" }；一项P1已发表的算例值）。预先登记（436293bf；日心修复6fd9f5e6）；修订374c806b写于参考基准文件生成之后、任何Kshana数值出现之前，把倾角输入过滤条件从{ "1e-2" }放宽到{ "1e-3" } rad，保留了更多、条件更差的状态。MODELLED范围：圆形行星轨道上的圆锥曲线拼接二体飞越，没有影响球过渡、遭遇摄动或星历

seg-8e82da17a463 = CRPA抗干扰阵列波束形成

seg-1744f527b4d1 = 受控接收方向图天线调零：复阵列导向矢量a(û)=exp(j·k·pₙ·û)，确定性调零（朝向SV的增益为一，经最小范数w=Aᴴ(AAᴴ)⁻¹b对至多N−{ "1" }个干扰源形成精确的零点），以及MVDR自适应权值w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv)，可把深零点自行指向强干扰源（附带从零实现的复线性代数内核）

seg-8016dae66350 = numpy.linalg / scipy.linalg（LAPACK zgesv复数求解）：是与kshana从零实现的复数内核不同的独立线性代数代码库，计算同一组唯一确定的权值：MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) 和最小范数调零w=Aᴴ(AAᴴ)⁻¹b，以及由此得到的阵列响应增益，符合到约{ "1e-9" }；与经独立核对的DOP（gnss_lib_py）和Fisher信息（numpy）两行属于同一类参考基准。MODELLED的窄带远场、相同的各向同性阵元阵列：不含互耦、逐阵元失配、有限带宽（STAP）或导向矢量估计误差

seg-f2c973f14d52 = IEEE-1139幂律时钟噪声与闪烁调频底限

seg-4a0159558671 = 五系数的IEEE-1139 PSD与阿伦方差互换S_y(f)=Σh_α f^α → σ_y²(τ)（白/闪烁调相，白/闪烁/随机游走调频），把闪烁调频底限 σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) 作为一等可拟合项，以及在{ "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" }基上的非负调频族拟合，可恢复漂移基{ "{" }1/τ,τ,τ³{ "}" }无法表示的底限

seg-24f6f26046b6 = allantools { "2024.06" }（A. Wallin；Kasdin与Walter { "1992" } / Vernotte { "2015" }系数）：是独立的第三方代码库和引用谱系，对五种幂律噪声类型中的每一种，计算同一个唯一确定的IEEE-1139 PSD到阿伦偏差 σ_y(τ) 的转换。kshana的powerlaw::allan_deviation与allantools的闭式解相符（白/闪烁调频、随机游走调频和白调相相对偏差小于{ "5e-9" }；闪烁调相约{ "1e-5" }，这是真正体现独立性的信号，因为kshana使用NIST-SP-1065列表中的{ "1.038" }常数，而allantools使用完整的3γ−ln2），闪烁调频底限 √({ "2" } ln2·h_{ "{" }-1{ "}" }) 在整个梯度上与allantools相符；与经独立核对的MDEV/TDEV/Theo1/MTIE各行所达到的判据相同。MODELLED的平稳幂律模型：没有确定性漂移（τ²）项；逐器件的系数/实测底限仍为模型计算得出

seg-cc1ac065e684 = CCSDS OEM协方差块互换

seg-ec4d44e7cf78 = 序列化并解析CCSDS { "502.0" } OEM的COVARIANCE_START…COVARIANCE_STOP块：{ "6" }×{ "6" }位置/速度协方差以其21个元素的下三角写出（标准的CX_X … CZ_DOT_Z_DOT次序），并带可选的COV_REF_FRAME，与现有的OEM状态矢量写入器/解析器相配合，使定轨和滤波器的协方差能以标准格式往返转换

seg-891b86506bf6 = oem { "0.4.5" }（MIT，https://pypi.org/project/oem/）：与经独立核对的“CCSDS OEM互操作性”行所信赖的是同一个独立的CCSDS-502解析器，是完全独立的代码库（有自己的KVN词法分析器、协方差段状态机和numpy矩阵装配）。kshana输出一个完整的OEM段，其中带有无标签的纯数字下三角COVARIANCE块；oem将其解析并重建出对称的{ "6" }×{ "6" }矩阵，与kshana输入的协方差逐元素相符，直到f64舍入误差；这是真正的库对库互换往返（与oem的重建结果比较，而不是kshana的再次解析），弥补了该行此前“没有第三方测试数据”的缺口

seg-ae061c7f082c = INS/TRN惯性滑行误差增长与阈值穿越

seg-7bacdc8aa0d8 = 由IMU系数构建的位置误差对滑行时长的预算，各误差源（加速度计偏置、陀螺偏置、速度随机游走、角度随机游走、巡航时和持续比力下的标度因子）通过带Schuler反馈的九状态当地水平INS误差模型传播（inertial::coast::ErrorDynamics，依据Groves第2版第{ "14" }章：姿态、速度和位置误差，含重力梯度的垂向通道，WGS-84半径和正常重力，以配置速度向北飞行的水平平台，latitude_deg和height_m；系统项用增广矩阵指数，随机游走用Van Loan方法），平地球单项式仅作为leading_order_m保留；各贡献按一条声明的规则组合（rss / linear-sum / deterministic-sum-with-stochastic-rss）；达到调用方提供的位置阈值（默认{ "10" } m和{ "50" } m）的滑行时长，由对首次穿越的前向扫描确定（first_crossing_s，因为受Schuler约束的曲线不是单调的），并给出每次穿越处的主导误差源；还有TRN约束模式，给出能守住每个阈值的最大地形定位间隔。可作为<c1/>场景类型运行

seg-622af0bd27de = NaveGo v1.4（提交24d9488，LGPL-3.0），在GNU Octave { "8.4.0" }下作为单独的程序运行：使用相同IMU误差剖面的自由惯性滑行运行，并对其四元数更新中的一处数值死区做了更正（qua_update.m：把速率低于{ "1e-8" } rad/s的保护条件替换为wnorm == { "0" }，应用于运行时副本并断言只匹配一次；有该保护条件时，缓慢漂移的平台姿态会冻结并切断Schuler反馈）。更正后的生成器在运行之前已预先登记（4262b969）；引擎（440b3877）在打开任何更正后的输出之前就已提交；与第{ "1" }轮采用相同的{ "5" } % 判据、{ "48" }个点、误差项、随机种子和统计量。结果：48/48在{ "5" } % 以内（最差为{ "1200" } s处速度随机游走的 +{ "3.70" } %，以及{ "1800" } s处角度随机游走的 +{ "3.33" } %）；在{ "3600" } s时，NaveGo/Kshana对加速度计偏置给出2375.4/2376.2 m，对陀螺偏置给出{ "130" } 885/131 { "675" } m。把Schuler输运速率反馈置零会使测试失败（{ "3600" } s时为 +{ "695" } %）。已披露：单通道的Schuler预测和第1轮的NaveGo数值是已知的；该模型没有拟合参数。范围：Tactical级的逐项误差曲线，{ "45" }度N，水平且指向正北，至多{ "3600" } s；穿越、组合规则和TRN模式都是这些曲线的确定性函数。IMU等级系数（Groves { "2013" }表{ "4.1" }的区间数值）和TRN定位残差仍为MODELLED输入。第{ "1" }轮（已被取代）：平地球单项式，现为leading_order_m，在{ "600" } s之后偏高（一小时时为2.2倍至8倍）。{ "0.30" }修订：每一项ins-trn-coast输出都有变动（所发布场景的TRN峰值由{ "52.932679" }变为{ "44.711834" } m）

seg-a971ff07592a = 孔径的导航与通信占空比

seg-5b0ba97379bf = 一次运行接收一份联系计划（aos_s/los_s窗口列表，每个窗口请求孔径用于导航或通信，使用与<c1/>输出相同的窗口词汇，由<c2/>转换）、孔径数量和一条明确的仲裁策略，并返回导航占空、通信占空、空闲占空以及每次会话的中断。策略是一项输入，有文档化的默认值（<c3/>；另有<c4/>和非抢占的<c5/>），报告中带有解析后的策略、其完整定义以及占空和中断的定义，因为不附带其仲裁规则的占空数字是不可复现的。调度是对窗口边界做的精确区间扫描，因此恰好在下一个窗口开始处结束的窗口从不发生争用，而导航、通信和空闲的孔径秒数在这一次扫描中被独立累计。可作为<c6/>场景类型运行

seg-656fd7d44a9e = 内部一致性：取自在同一次扫描中用不同表达式算出、再要求闭合的三个量。导航孔径秒数、通信孔径秒数和空闲孔径秒数分别累计（空闲由每个基本区间的（孔径数 − |被服务数|）得出，绝不作为余数），并断言其总和等于孔径数 × horizon_s，边界划分错误、区间重复计数或遗漏都会立刻使之失败；各会话被服务的时间另外要求加回后等于两项服务总量。调度器的结构性质是实测的而不是假定的：对三种策略，在{ "200" }个伪随机计划上断言被服务时间随孔径数不减（对非抢占策略并不显然，因为多一个孔径会改变此后每个边界上由谁占用什么），并且边界运算被固定在恰好相接和重叠一秒的一对情形上，否则这里的差一错误会被掩盖。通过预测器的桥接对照<c1/>的输出进行核对：在一个孔径且无竞争服务时，导航孔径秒数等于预测器自身汇总的过境时长。不声称有外部参考基准，也不存在这样的基准：该能力取代的是手工算术，而不是对照手工算术来核对；所附的联系计划是示意性的，不是实际飞行的；没有任何运行中的调度器发布附带其仲裁规则的计划与答案成对数据：在未声明策略下算出的占空，与在已声明策略下算出的占空不可比，而对策略的依赖是实测的（在完全相同的计划上，导航占空分别为100/150与50/150）。转向与切换时间、数据量、缓冲状态、能量和链路闭合在报告标签中明确排除，而不是悄悄地建模

seg-43cd7aa7ab53 = 月面导航射频压制干扰（逐卫星J/S）

seg-e0566f37ad8f = 在示意性的、取自公开来源的Moonlight/LCNS类星座之上，月面（或抬高的）干扰源作用下，月面经纬坐标用户的月球原生干信比、有效C/N₀ 和失锁。它组合了开放的压制干扰链（j_over_s_db、effective_cn0_dbhz、rx_antenna_gain_db、lock_status、q_factor、nominal_cn0_dbhz、free_space_path_loss_db）与开放的月球天空几何（lunar_service::LunarConstellation加topocentric、lunar::selenographic_to_mcmf）；不重新推导任何几何或辐射度量。与地球的<c1/>类型不同，信号一段不是固定的接收功率：每颗卫星的各向同性接收功率是其自身链路预算的EIRP − FSPL（斜距），所以J/S随月球距离和仰角逐卫星变化。对每条可见（历元，卫星）链路各输出一行（每条链路一行），格式为JSON以及 *.table.csv制品，并在旁边印出构成J/S之差的两个接收功率；汇总性能指标放在该表之旁，决不取代该表。可作为<c2/>场景类型运行

seg-2a4393ae7c52 = 对照仓库内一条独立代码路径的组合交叉核对：每条链路的J/S都被重新推导为用linkbudget::received_signal_power_dbw算出的两份链路预算之差，其自由空间损耗是单一表达式{ "20" }·log10(4πRf/c)，而不是jamming::free_space_path_loss_db所用的三项之和；两者在每一行上相符，偏差小于{ "1e-9" } dB（实测最差{ "7.11e-14" } dB，即浮点舍入）。它所组合的底层干扰链，另外已在tests/gnss_denied_jamming_resilience_reference.rs中取得外部锚定（对J/S和有效C/N₀ 做独立的numpy/scipy重新推导，固定到Kaplan与Hegarty §{ "9.4" }，并加上JammerTest { "2024" }的实测C/N₀，Zenodo 10.5281/zenodo.15910563）；它所组合的月球几何，是带有自身参考基准的lunar_service/lunar几何。这里核对的闭式恒等式：干扰源距离减半，每一行恰好增加{ "20" }·log10({ "2" }) dB；J/S对用户天线视轴增益严格不变，而C/N₀ 恰好随该增益变化；仰角掩模不会使任何保留下来的行有逐位变化。该行本身仍为ReferenceImpl/Modelled：不存在可供核对的实测月球压制干扰测评活动，且星座是示意性的、取自公开来源的Moonlight/LCNS类几何，不是实际飞行的星历

seg-4c116e25c5c5 = 带有由实测C/N₀ 散布得到的不确定带的月球拒止等值线

seg-77828c25f3ab = <c1/>报告不再把拒止等值线建立在单个标量上。它在逐卫星表之上输出完整的实测期望信号C/N₀ 分布：n、最小值、p05、p25、中位数、p75、p95、最大值、均值、样本标准差，以及样本自身的不对称度 (p95 − median) − (median − p05)，并置于逐链路各行之旁，各行不变。随后，等值线按这些顺序统计量逐一给出，同时采用引擎认可的两种拒止判据（BOTH），绝不以其一取代另一：现行的功率比判据（J/S = { "30" } dB，与attack_surface和tracking_loop使用的阈值相同，也是已发布的月球链路压制干扰表中<c2/>一列背后的判据），以及失锁判据（有效C/N₀ 降到tracking_threshold_dbhz），本报告自身的links[].status一列即以此评分。每个等值点都在拒止平面的两条轴上给出：在场景的干扰距离下所需的干扰源EIRP，以及在场景的EIRP下的拒止距离，因此这个带是绘制等值线图所用的同一坐标轴上的一个区间。带的边缘就是（ARE）contour(p05) 和contour(p95)：同一个闭式映射作用于样本自身的分位数，不是拟合到样本上的sigma，也不是中位数 ± k·stdev，报告在数值旁的band_definition字符串中如此说明。stdev是为保持连续性而输出的，不被任何部分使用。C/N₀ 已处于或低于跟踪阈值的分位数没有有限的拒止J/S；这些列输出为null并附带计数的原因，而不是输出为无穷大或被截断的半径

seg-f7457156f960 = 对照引擎自身正向函数的内部一致性，这是该能力能够如实声称的全部。每个等值点都是闭式反演，每个反演都通过把其答案送回报告各行评分所用的正向（FORWARD）函数来核对：J/S一列经jamming::effective_cn0_dbhz（必须返回tracking_threshold_dbhz，偏差小于{ "1e-9" } dB-Hz），距离一列经jamming::free_space_path_loss_db和jamming::j_over_s_db（得到同一J/S，偏差小于{ "1e-9" } dB），EIRP一列在场景自身的距离下经jamming::j_over_s_db。还进一步核对了等值线确实是拒止集合的边界，而不是其内部的一点：lock_status按严格不等式失锁，因此实测判定在等值线两侧各{ "1e-4" } dB的J/S范围内由DEGRADED翻转为LOST，差一个epsilon的等值线会使之失败。最强的核对是逐链路而不是逐分位数的：把同一映射应用于每一行自身的C/N₀，能精确复现报告的状态列，在文档记载的工作点上（kind = lunar-jamming，除jammer.range_m = { "25 000" } m外所有输入均为默认值），{ "38" }行中{ "38" }行都相符，不一致{ "0" }行，其中{ "26" }行为LOST，{ "12" }行不是。单调性是实测的，不是假定的：在 [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz上取{ "20 001" }个样本，距离严格递减、所需功率严格递增，违反{ "0" }次，因此带的分位数次序是被演示出来的，而不是被断言的。ExternalDataset被拒绝，经独立核对（Validated）亦随之被拒绝：不存在可用来对照拒止半径的实测月球压制干扰测评活动，星座是示意性的、取自公开来源的Moonlight/LCNS类几何，而不是实际飞行的星历，而且等值线的输入（EIRP、干扰源功率、天线增益、噪声温度）是有代表性的量值。ReferenceImpl也曾被考虑并被拒绝：反演与正向表达式是同一套代数从两个方向读取，所以往返只能发现抄写和符号错误，并不是独立的实现；称之为交叉核对，就是矩阵不变量所要防止的借用独立性之举。带带来的好处是实测并引用的，而不是断言的：在该工作点上，单一标量的等值线为{ "27.402916" } km，把{ "25" } km放在全部{ "38" }行的被拒止一侧，而带{ "21.256108" } .. { "29.921360" } km包含该工作点，因此报告了该表实际显示的分裂。两种判据也被实测为不一致：功率比的带（{ "38.186527" } .. { "53.691675" } km）完全不包含{ "25" } km，这正是两者都被印出的原因

seg-2d3944107ba0 = 跨模态完好性监测器的检测能力

seg-38bc7c0bfe57 = hybrid-optical-rf报告说明跨模态卡方监测器实际上能检测（DETECT）到什么，而不只是说明它通过无故障情形：在场景所述的虚警概率和漏检概率下，每个受监测轴（东、北、天、钟）的最小可检测偏差、其两侧的检测能力曲线、实际统计量首次越过阈值时的无噪声偏差倍数，以及在所述速率下对偏差斜坡的检测时间。还通过真实的监测器注入故障，并将其返回的统计量与解析预测一并报告

seg-b6b8dec4dcff = 两个内部参考基准，没有外部数据集。（{ "1" }）闭式往返：最小可检测偏差由对非中心参数反演非中心卡方尾部（raim::pbias）得出，并通过把所得非中心参数在监测器自身阈值处送回raim::noncentral_chi2_cdf来验证，其结果必须返回P_md。（{ "2" }）注入与解析对比：把偏差写入某一轴的射频估计并重新运行cross_raim::run_cross_raim，因此与解析非中心参数相比较的统计量是监测器自身算出的，而不是重新推导的。统计量本身的带随机种子的蒙特卡罗作为第三项核对放在测试中；它被有意不放入报告（NOT），因为抽样估计会更慢，且不能逐位复现。ExternalDataset被拒绝：被量化的是此监测器在此场景的sigma分配下的检测能力，而MDB所依据的sigma量值是有代表性的模型输入，不是测量值。ReferenceImpl也曾被考虑并被拒绝：蒙特卡罗抽样的是解析所描述的同一统计量，所以能发现抄写和系数错误，但不是该监测器的独立实现。{ "0.30" }第{ "2" }轮（预先登记0135a9e4），受阻（仍为MODELLED）：SciPy { "1.18.1" }的chi2/ncx2/brentq在五种配置上复现了报告阈值（偏差在{ "5.4e-12" }以内）、各轴MDB、功率曲线、越过倍数和斜坡检测时间（偏差在{ "5.3e-10" }以内）；注入故障的统计量没有独立的参考基准，且sigma量值是模型输入，因此范围界定有待所有者决定

seg-38cabd4921c1 = 切换后协方差重新增长与告警限值的对比

seg-9287268bbada = hybrid-optical-rf报告公开了滤波器的过程噪声模型，并说明切换后的解在告警限值之内能维持多久：对两个切换方向，报告给出切换后遗留的各轴协方差，在所述的随机游走过程噪声下向前传播，并报告覆盖系数缩放后的1σ 达到水平、垂直和授时告警限值的时间、哪一个限值最先起作用、方差倍增时间常数，以及一条括住该穿越的抽样滑行剖面。过程噪声PSD、覆盖系数和告警限值都是带有文档化默认值的输入

seg-c85b822227f3 = 没有外部参考基准。该穿越是随机游走方差增长的闭式解，测试根据报告自身公布的数值独立地重新计算它，而不是根据输出器的内部量。起始协方差逐位固定为现有切换块已报告的迹，因此滑行不会传播无人见过的协方差。过程噪声PSD是MODELLED的有代表性的输入，穿越时间与它们直接成比例，缩放测试把这一点作为实测属性陈述，而不是作为声明。ExternalDataset被有意拒绝：滑行时间是两个模型PSD和本身也只是有代表性的告警限值的直接函数，且不存在可对照的实测月球光学/射频切换滑行。这里的外部参考基准需要为可比的接收机公布的、说明其过程噪声模型的切换后协方差增长或守时精度曲线，并核对到一个容差

seg-a3b8272862aa = 月球几何导出中的偏离视轴天线方向图

seg-27d246503a48 = 逐卫星几何导出在每个（历元，卫星）上给出卫星处（AT THE SATELLITE）的偏离视轴角，以及由真实的均匀照射圆口径（Airy）方向图得到的朝向站点的发射增益，并把该方向图下的波束内计数，与对称的增益-波束宽度近似（θ_3dB[deg] = √(31000/G_lin)）下的波束内计数并列报告，二者之差作为显式修正，分别以链路数、每历元卫星数和最差的单个历元给出。该近似隐含的两个孔径效率都已输出（对其所引用的{ "70" }·λ/D度规则为{ "0.641" }，对均匀圆口径为{ "0.920" }），因此它悄悄假定的效率被陈述出来，而不是由人推断。默认关闭：仅当同时给出导出站点和孔径时才出现该块

seg-f7f79e2dd6c5 = 混合，且分开而不是合并。其下的方向图（PATTERN）经过外部核对，保有自己的一行（tests/validate_p1_orbital_footprint.rs中一个scipy.special.j1的固定数据，偏差小于{ "0.05" } dB，此外这里还通过二分法求得了已发表的Airy半功率横坐标x = { "1.61634" }，而不是假定）。几何（GEOMETRY）对照闭式的三角形三角学核对，该三角学写成与被测的点积不同的表达式。真实波束被近似锥体包容（CONTAINMENT）是推导出的代数：每 λ/D为28.019/√η 对{ "29.479" }度，因此对 η ≤ { "0.9035" }，修正只可能为非正。但波束内计数本身（COUNTS）没有外部参考基准：没有已发表的表格给出一个Moonlight/LCNS类壳层中有多少颗卫星会让某个南极站点落在某口天线的半功率波束内，而且星座是示意性的、取自公开来源的近似，不是实际飞行的星历。在文档记载的工作点上实测到的分歧（在真实方向图下波束内有{ "0" }条链路，在近似下为{ "28" }条，每历元 −{ "2.33" }颗卫星，最差历元为{ "3" }，评估了{ "76" }条链路），因此是关于该近似的MODELLED发现，被固定为回归字面值（最近的一行距任一波束边缘{ "0.069" }°，比任何末位数字的分歧高出四个数量级），不是经外部核对的覆盖数字。凭方向图自身的外部锚点就把这一行标为ExternalDataset，将是借用核对，而这正是矩阵不变量所要防止的做法。{ "0.30" }第{ "2" }轮（预先登记d9755d28），受阻（仍为MODELLED）：SPICE几何和SciPy的Bessel函数在{ "6 336" }行实际飞行轨道器状态和文档记载的工作点上复现了偏离视轴角（最差{ "3.0e-5" } deg）、Airy增益和波束内标志；但在实际飞行几何上，标志按卫星身份而分裂（最近的链路距波束边缘{ "1.66" } deg），{ "5" } deg的可见性是作为标志核对的，不是数值仰角，对称近似的标志把31000/G经验法则应用于一个经核对的角度，却没有核对该法则，而隐含的效率没有参考基准；范围界定有待所有者决定

seg-6fbfa234ef3e = 干扰下的跟踪环失锁与欺骗拉出

seg-f78c1f28a3f7 = 由环路动力学而不是功率比算出的失锁：载波（Costas）和码（非相干超前/滞后）的1σ 热噪声抖动对C/N₀ 的关系（含平方损耗），对照所述规则3σ_PLL + θ_e ≤ { "45" }° 和3σ_DLL + 斜坡滞后 ≤ d/2码片；掉锁和重新锁定的C/N₀ 阈值，并指明起约束作用的环路，其迟滞由更宽的牵入带宽推导（DERIVED）而不是断言；由带确认驻留的双阈值锁定检测器得出的声明失锁时间，与物理的相位逃逸时间（Viterbi平均周跳间隔，因跨越数百个数量级而以log₁₀ s表示）分开报告；受害方环路能够跟随的最大码滑移和载波多普勒变化率；以及环路动力学所隐含的拒止半径（DENIAL RADIUS），与现有的功率比半径并列报告，二者的带符号之差作为单独命名的字段。可作为<c1/>场景类型运行

seg-c3794c8d85c5 = 引擎自身的sdr相关器（sdr::correlate / synth_if / CaCode）在以校准的C/N₀ 生成的、带随机种子的合成IF上逐步向前运行：这是一条独立的代码路径，通过对采样IQ的数值相关而不是代数抖动表达式得到同样的数值，所以是另一条路径，而不是同一说法的复述；另外还有周跳项所用的标准列表修正Bessel I₀ 值。环路理论依Kaplan与Hegarty第{ "8" }章，周跳时间依Viterbi和Gardner。这一行仍为ReferenceImpl/MODELLED：交叉核对存在于同一代码库中，bessel_i0核对所核对的是一个特殊函数而不是跟踪模型，因此据此提升该行就是自我标榜的标注。ExternalDataset需要一份带有真值C/N₀ 和带注释的失锁时刻的原始IF录制数据集（TEXBAT/OAKBAT一类）；本代码树中没有随附这样的数据，而且即使有IQ，这些数据集也不公布逐历元的环路状态真值，因此声明的失锁时间只能对照另一台接收机的锁定检测器来核对，而那是模型选择，不是参考基准。环路带宽、积分时间、相关器间隔、牵入比、驻留、干扰源功率和天线增益是有代表性的频段数值，不是数据手册。{ "0.30" }第{ "2" }轮，GNSS-SDR { "0.0.19" }（GPL-3.0，作为程序运行）在独立生成的IF上（预先登记6ef7698c，对测量方法的修订已披露），一项发现（仍为MODELLED）：闭环PLL和DLL抖动在{ "35" }至{ "45" } dB-Hz上相符到{ "8" } % 以内，{ "10" } Hz/s的动态应力相符到{ "1" } % 以内，一阶码斜坡滞后相符到{ "2" } % 以内；在{ "30" } dB-Hz时，PLL抖动高出{ "21" } %，DLL抖动低{ "32" } %，实测的15度规则阈值比引擎高{ "1.5" } dB，而二阶环路的周跳比一阶周跳时间界限频繁{ "0.5" }至{ "2" }个数量级。{ "0.30" }修订：Costas周跳时间现使用环路SNR rho/4（半周跳）；默认的jitter_table log10_mean_time_to_cycle_slip_s在{ "25.47" } dB-Hz阈值处由{ "11.58" }降至{ "2.10" }

seg-69155fb79ebd = 由跟踪计划得到的月球VLBI测站坐标协方差

seg-141285301f58 = 把基线 × 历元的计划上累积的时延偏导数汇成Fisher信息矩阵，求逆得到测站坐标协方差和逐坐标的测站sigma，取代由标量时延精度假设出的各向同性均分关系。状态携带地固（ITRS）测站坐标，因此雅可比矩阵是由每个历元的GCRS→ITRS矩阵旋转的惯性偏导数，正是地球自转使这些坐标可观测：报告测量（MEASURES）地固视线扫掠和信标赤纬，而不是假定它们。每次运行都输出秩、基准亏损、条件数、信息谱和自由网零空间，而在秩亏时，头条sigma以NULL并附状态的方式发布，而不是从近奇异的逆矩阵中读出。对同一计划的均分值c·σ_τ·√(g/N) 与算出的值并列印出并给出其比值，同时给出各向同性迹界 √(p/trace(M))，AM-HM使它成为硬下限。可作为<c1/>场景类型运行

seg-b259d4d18f42 = 一条独立的仓库内路径。每一行雅可比都由lunar_vlbi::vlbi_delay_s的中心有限差分重新推导，该函数在状态自身的地固和月固坐标上取值，并通过坐标系链向前旋转：这条路径不计算任何导数，也与解析偏导数没有共用的表达式；两条路径构建的信息矩阵相符，偏差小于最大对角元的{ "1e-6" }。它所组合的线性代数内核（information_matrix、crlb、sym_eig）另外已在tests/fim_observability_reference.rs中对照numpy.linalg.eigh / numpy.linalg.inv取得外部锚定，而时延观测量带有lunar_vlbi自身的delta-DOR远场参考基准；该行不借用这两者的状态。这里核对的闭式恒等式并如此标注：σ² 和1/N缩放，以及作为AM-HM下界的 √(p/trace(M))（算出的sigma不可能优于它），它仅在各向同性几何上与均分值重合：这正是实测比值恰好就是该假设所舍弃的各向异性的原因。{ "0.30" }外部比较（库：NAIF SPICE CSPICE N0067，经spiceypy { "8.2.0" }，MIT；DE440、ITRF93 earth_latest_high_prec、MOON_PA），连同引擎一侧的模型误差敏感性运行一起预先登记（{ "50863551" }）：每一行雅可比都由SPICE几何得出的、已收敛的牛顿光行时差的中心差分重建（光行时方程是基于SPICE位置的一小段脚本；SPICE提供几何），计划由SPICE仰角重建。计划、秩、亏损、信息谱、条件数、测站sigma、头条数值、迹界、均分比值、自由网零空间、视线扫掠和信标赤纬，在预先登记的{ "1" } % / { "0.1" } deg以内相符，该范围高于引擎已知的解析月球误差（sigma上为{ "3.2e-3" }，在运行之前测得）。NumPy { "2.3.5" }在已提交的引擎雅可比上重做线性代数，相符到{ "2e-13" }（P2）。经独立核对的是：在所述示意性输入上、对所述缩减参数集的Cramér-Rao界：月心星历、时钟、对流层和地球定向参数在两侧都保持固定，因此它不是真实测评活动的精度

seg-0f4d023fe2d4 = 由VLBI时延计划得到的月面点坐标协方差，与地球测站的协方差分开

seg-47352405133b = 第三种基准选择<c1/>，保持所有地球测站不变，仅估计信标（BEACON）的月固坐标：这正是月面点不确定度实际被引用时的配置，因为地球测站坐标是时延模型的输入，而不是其未知量。之所以存在这一选择，是因为测站级协方差和月面点协方差是由杠杆臂 ρ/B分开的不同量（DIFFERENT QUANTITIES），而此前没有任何机制阻止把其中一个当作另一个来引用。输出的<c2/>块给出 ρ、最长基线、杠杆臂、均分关系的月面点形式c·σ_τ·(ρ/B)·√(g/N)、算出的逐坐标信标sigma及其比值：每当信标未被估计或矩阵秩亏时，该比值为null，而不是产生误导。B取现有的最长基线（LONGEST），也是最有利的一条，因此该比值只会低估。可作为<c3/>配合<c4/>运行，当信标未被估计时，会被拒绝并附一条指出缺失输入的消息

seg-18096ae23d96 = 闭式恒等式，不声称也没有外部参考基准。杠杆臂对照 ρ/B核对，两种均分形式相互核对，偏差到{ "1e-15" }：这些是代数恒等式，因此只能发现接线错误而不能发现其他，并如此标注。实质性的结果是实测的而不是断言的：来自固定基线的时延约束的是信标的方向（DIRECTION），所以视线分量只通过近场距离项进入信息矩阵，测试从输出的谱中读出由此产生的各向异性，而不是推导它。AM-HM使 √(p/trace(M)) 成为硬下限，因此各向同性均分关系只可能低估（UNDERSTATE），而算出值与均分值之比，恰好就是它所舍弃的各向异性。在弦长为{ "10726.748" } km的Goldstone类/Canberra类站对上实测：在抽样的{ "112" }天中，有{ "36" }天在{ "10" }° 掩模下完全没有互相可见的历元，互相可见最多的一天为49个采样计划中的{ "17" }个，在{ "73" }个可行的日子里，三分量比值从{ "113.9" }× 到高出四个数量级，中位数{ "1513" }×，而限于视线不致匮乏的两个横向方向时，为{ "3.94" }× 至{ "25.8" }×，中位数{ "7.8" }×。本行不声称的内容（WHAT THIS ROW DOES NOT CLAIM）：把其中任何数字当作真实测评活动的属性。它确立的是，月面点这个量现在是算出的（COMPUTED）而不是假定的，并且它不能被悄悄地与测站级的量互换。仍为ReferenceImpl/MODELLED：不存在已发表的月球VLBI月面点协方差可供核对，测站和信标站点是示意性的，不是经过测量的，而星历、时钟、对流层和地球定向参数保持固定（FIXED），所以这是针对缩减参数集的Cramér-Rao界，本身就偏乐观。内核路径（信标位于DE440月球上）上的同一个量，在其自己的一行“……，内核路径”中经独立核对；在这条解析路径上，最小的信标sigma比该行的SPICE参考基准低{ "3.9" } %，这就是本行仍为MODELLED的原因

seg-8958521eedf7 = 由VLBI时延计划得到的月面点坐标协方差，内核路径

seg-8ac12ca0f272 = lunar-vlbi-fim场景的“所有测站固定”的信标协方差（所有地球测站保持不变，仅估计信标的月固坐标），信标置于由引擎自身内核读取器读出的JPL DE440月球上（planetary_kernel_path；lunar_vlbi_fim::epoch_geometry_with、ephem_provider::KernelEphemeris）。只有月心与解析路径不同；IAU { "2015" }天体自转、测站、地球自转和线性代数都相同。经独立核对的输出是观测集、{ "3" } x { "3" }信息谱、秩和条件数、三个月固信标sigma及其RMS、杠杆臂，以及在默认计划上的算出值与均分值之比。可作为<c1/>场景运行，设置datum = "all-stations-fixed"、estimate_beacon = true并设置planetary_kernel_path

seg-63250578ec6b = 起约束作用的库一侧：NAIF SPICE Toolkit N0067（spiceypy { "8.2.0" }，MIT），使用de440s、earth_latest_high_prec（含UT1和极移的ITRF93）以及DE440月球坐标系，信标固定在MOON_ME中；每一行雅可比都是已收敛的牛顿光行时差的{ "3" } km中心差分（引入M069参考基准自身的光行时代码），绝不是Kshana的偏导数；可见性由WGS-84仰角重建；NumPy { "2.3.5" } / SciPy { "1.18.1" }（BSD-3-Clause，LAPACK）的eigh和inv。P2一侧：NumPy在引擎已提交的雅可比上运行。在测试数据或参考基准出现之前预先登记（4a51256），特征值、条件数、sigma、RMS和比值的判据为{ "1" } %，杠杆臂为{ "1e-4" }，观测集和秩要求完全一致；P2为{ "1e-9" }。已披露：解析月球与内核月球的仅引擎比较（y sigma上为{ "3.9" } %）是在预先登记之前运行的，目的是选择内核路径，并已在登记中说明。结果：两侧相符，最差{ "1.7e-3" }（信标y sigma为{ "0.081211" } m，对照{ "0.081351" } m）。变异检验：把信标偏导数的天体自转转置，两侧都失败。两侧都读取DE440，因此相符所核对的是DE440上的几何和线性代数，而不是DE440本身。不在声明之内：真实测评活动的月面点精度（时钟、对流层和地球定向保持固定；测站和信标站点是示意性的），以及解析默认路径（上一行，仍为MODELLED：在解析月球上，y sigma比该参考基准低{ "3.9" } %）

seg-0315968c8214 = 月球差分PNT：修正链路的残差预算

seg-c6785166a44c = 差分修正在其被计算的历元与被使用的历元之间会增加的三项，此前每一项都作为未建模的余量留空：参考站测量误差（跨卫星相关，与基线无关，位置传递约为{ "1" }:{ "1" }，可证明不被DOP放大）；修正老化（冻结的轨道误差矢量，被重新投影到引擎自身的传播器在一个时延之后把卫星放置的视线方向上，加上由已校准幂律得到的c·σ_y(τ)·τ 时钟漂移）；以及在精确的 ±(orbit_err + clock_err) 满量程上、方差为step²/12的均匀链路量化。同时在距离域和位置域报告，置于现有残差和保护级之旁，决不取代它们，并在单一数字之旁给出时延曲线

seg-29b8e6c12471 = 闭式恒等式与自洽性：均匀量化器的step²/12方差，精确的 (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ 协方差传播在 σ 相等时坍缩为 σ·PDOP，测量项的{ "1" }:{ "1" }传递是 û_user ≈ û_ref的结果，以及关闭项后的求积闭合。对照orbit::dop的PDOP交叉核对共用 [−û, { "1" }] 正规矩阵，因此它是一致性检查，并如此标注，而不是独立的参考基准。没有可用的也没有声称的ExternalDataset：没有任何月面站有已发表的测量精度，没有任何月球差分修正链路有已发表的时延或消息格式，而且量化结果是闭式解，不是测量。RTKLIB已是单差和加权最小二乘内核的外部代码参考基准，可以用一个有意测错的基准站来驱动，以确认{ "1" }:{ "1" }的测量传递，但那是在同一套一阶视线代数之上的独立代码。量值为MODELLED：测量默认值是本crate自己的月球坐标系实现分配，不是实测的测站，时延和比特数是示意性（ILLUSTRATIVE）输入，而广播星历误差矢量本身的增长则完全没有建模，这一点在输出的老化律字符串中有说明，因为它是最可能在真实链路中占主导的项

seg-c42646ae4707 = 月球参考站覆盖与精度地图

seg-1f9834b32629 = 对月球差分PNT模型在南极用户网格和一天历元上的蒙特卡罗扫描（<c1/>类型）：对位于已知南极站点的差分参考站，逐点并在整个区域上，给出修正后与未修正的位置误差分位数（3-D、水平、垂直），可用性以及对每个不可用历元的原因（user_lt4、station_missing_sat），相对于运行前所述阈值的覆盖，DO-229E保护级，每个方位扇区的覆盖半径，以及在站点和最差点上的修正链路预算。不是对任何真实系统性能的陈述；与任何机构无隶属关系，也未经其认可

seg-2308d94fa25e = 算术由一份独立的numpy脚本在导出的算例上重新计算（scripts/gen_lunar_station_ref.py，numpy { "2.5.4" }；预先登记于tests/fixtures/lunar_station/PREREGISTRATION.md，在首次运行之前单独提交于9caedf97）：在每一项误差都开启的{ "20" }个算例上，可见集合和状态完全相同，原始距离误差相符到{ "1.4e-14" } m，位置误差矢量和大小相符到{ "1.4e-9" } m（判据为{ "1e-6" } m），每个点的p95与numpy.percentile逐位相同；测站修正未达到其{ "1e-9" } m的判据（最差{ "3.73e-9" } m，{ "20" }个算例中有{ "15" }个），修正后的距离误差也随之未达到：以60位算术核对，两侧都在双精度舍入范围内逼近精确值，测量项是两个{ "1e7" } m距离之差，其末位单位为{ "1.86e-9" } m；如实记录，未做调整。在一个点、一个历元、一次试验时，该类型与lunar-differential-pnt类型严格相同。误差模型、去相关模型和每个阈值都是本项目自己的，或是示意性（ILLUSTRATIVE）的；此处没有任何内容是对真实系统的陈述

seg-7ecf4b0038b0 = 由所述剖面或极区DEM得到的月球地形地平线掩模

seg-7102948907bc = 为lunar-station-coverage类型（参考站及每个用户点）以及moonlight-service-volume网格及其逐卫星导出站点（每个导出行新增clears_terrain）提供按站点的、随方位变化的地平线掩模，采用{ "0.36" }天际线表格式（skyline::Skyline，沿方位线性，在{ "360" } deg处回绕；同一站点上所述剖面与DEM地平线按逐点最大值组合）：可以是带来源标注的 [terrain] station_horizon或user_horizon，和/或在南极立体投影DEM上（LRO LOLA网格化极区布局，由固定其大小和SHA-256的描述符读取，或带有 [terrain] dem_tile_path的经纬度realdata::lola_dem图块，并回显其SHA-256）沿月球球面上的大圆、以精确曲率、从所述桅杆高度、按所述方位步长和距离做射线步进得到的地平线。当卫星越过平坦的mask_deg以及其方位上的地平线时，它在某站点计入；如果某个历元在某点被地平线挡到不足四颗卫星，而平坦掩模下为四颗，则该历元被计为不可用原因terrain_masked。所附DEM是公有领域LOLA LDEM_75S_240M产品的一块裁剪，经{ "5" } x { "5" }块均值重采样到{ "1200" } m（data/lunar-dem/NOTICE.md）。未提供时，每个站点保持平坦掩模，每份文档逐字节相同

seg-dd838d199a0d = 闭式曲面（InternalConsistency）：裸球的俯角，球面上高原中的一个陨石坑（观测者位于其中心和偏离中心两种情形），以及一个解析圆锥对照其自身的栅格化。在真实裁剪上，一份独立的numpy射线投射（scripts/gen_lunar_terrain_ref.py，numpy { "2.5.3" }；预先登记于tests/fixtures/lunar_terrain/PREREGISTRATION.md，在脚本存在之前单独提交于edbb9b02）在五个站点上相符：站点高度相符到{ "1.0e-11" } m，全部{ "1800" }个地平线仰角相符到{ "5.5e-10" } deg，对照{ "1e-6" }的判据，被截断射线的计数完全一致；这核对的是算术，不是地形。没有复现任何已发表的极区地平线或光照数字：所附的{ "1200" } m裁剪抹平了已发表光照研究所分辨的亚千米级起伏，所以DEM地平线是在重采样的真实DEM上的MODELLED视线，不是经独立核对的地平线。站点和星座仍为示意性（ILLUSTRATIVE）；此处没有任何内容是对真实系统的陈述

seg-d37bb01e270b = 月球参考站的多路径与接收机硬件项

seg-1103199f019b = lunar-station-coverage的可选 [receiver] 段（LRS-02）：用户处和站点处随仰角变化的多路径sigma(el) = a + b exp(-el / el0)（RTCA DO-229机载函数形式，默认a = { "0.13" } m、b = { "0.53" } m、el0 = { "10" } deg；在月球上每个值都是示意性（ILLUSTRATIVE）的），用户处为白噪声，站点处为历元间的一阶Gauss-Markov（rho = exp(-dt / tau)）；超前减滞后DLL热码噪声sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0)))；用户处和站点处在一次试验内保持不变的逐通道通道间偏置。站点项进入其修正，用户项进入原始测量和修正后的测量，各自使用自己的带随机种子的流。未提供时，每份文档不变

seg-4fbc7d86b491 = 闭式解以及模型自身抽样的统计量（InternalConsistency）：DLL公式对照手算，DO-229形式，两台接收机的零基线差，以及Gauss-Markov的lag-1相关。不存在可供比较的月球多路径或接收机测量；这些数值是示意性（ILLUSTRATIVE）的，此处没有任何内容是对真实接收机的陈述

seg-03796cb741b6 = 月球参考站星历误差在修正时延内的增长

seg-13b0ae9a874a = lunar-station-coverage的可选输入orbit_err_growth_m_per_s（LRS-03）：在计算之后latency_s才应用的修正，会漏掉广播轨道误差的增长g latency_s，其中g为各向同性，3-D RMS速率，按每颗卫星和每次试验在其自己的带随机种子的流上抽取（距离1-sigma速率tau / sqrt({ "3" })），叠加在冻结误差的视线重新投影之上。未提供时，每份文档不变。已发表声明比较的K5附录，单独预先登记，在{ "0.001" }、{ "0.01" }和{ "0.1" } m/s下运行K5（示意性，ILLUSTRATIVE）

seg-332ceb320b65 = 增长项的闭式sigma和一阶传播核对（InternalConsistency）。K5附录（tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md，单独预先登记于59d88248）：K5在每一个速率下都失败，修正后p95 3-D误差为{ "369.8" } m、{ "2315" } m和{ "22797" } m，对照{ "1.5" } m的判据（无增长时记录为{ "292.96" } m），这在运行之前已经说明。没有公开来源给出月球的增长速率：示意性（ILLUSTRATIVE）

seg-24cb37529637 = P2：numpy { "2.3.5" }的linalg.cholesky（LAPACK potrf）、solve（gesv）和inv，在{ "201" }个已提交的SPD输入（tests/fixtures/gls_whitening_numpy_oracle）上，核对手写的分解因子、白化残差和白化算子；马氏距离平方对照solve(Omega, r) 核对，后者不使用Cholesky，因此恒等式z^T z = r^T Omega^-1 r经由另一条路径得到确认。全部在相对{ "1e-12" }以内（最差{ "7.9e-16" }），容差在比较之前就已确定。最大条件数为{ "19.3" }，因此不涵盖病态矩阵。GLS/Aitken { "1935" }白化为引用（Cited）。

seg-1a3bb032960f = 共模一致性统计量（分离盲区的共享参考故障）

seg-1b03f522b8fc = 得分统计量 ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1，针对解分离（与{ "1" }正交的对比）无法看见的共模偏移；共模偏移会使它增大，而两两分离保持平坦

seg-d79071a5d9ec = 对该统计量的独立numpy复现，加上共模注入会使其增大的性质测试（InternalConsistency）。模型场景。{ "0.30" }第{ "2" }轮（预先登记f9aa360d），受阻（仍为MODELLED）：numpy { "2.3.5" }的LAPACK gesv在{ "261" }个已提交的算例上复现了统计量的值（条件良好时在{ "3.5e-15" }以内，条件数高达{ "6.1e7" }时在{ "1.2e-9" }以内）；chi-square({ "1" }) 零分布律是被引用的定理，而平坦的两两分离是恒等式，没有可供比较的引擎输出，因此范围界定有待所有者决定

seg-91fc18cde833 = Omega之外残差的不可检测共模界

seg-0cc2c0f033c8 = 不可检测的共模上限：沿方向d同时逃过（BOTH）分离（alpha_ss = T_ss / d的白化对比范数）和共模统计量（alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|）的最大故障量值，报告为min(alpha_ss, alpha_cm)。在正定的Omega下，两个盲方向（d与{ "1" }成比例，以及{ "1" }^T Omega^-1 d = { "0" }）互相排斥，所以对每个非零d，该上限都是有限的（FINITE）；仅当方向为零或Omega非正定时才为无穷大。位于建模的共模轴之外的方向仅对共模统计量是盲的，并受分离所界定

seg-b67c71daa7de = P2：numpy { "2.3.5" }的linalg.solve（LAPACK gesv，LU，不用Cholesky）在{ "256" }个已提交的（Omega、d、T_ss、T_cm）输入上（tests/fixtures/gls_outside_omega_bound_numpy_oracle）重新计算alpha_ss（阈值除以去掉其GLS共模系数之后d的白化对比范数）、alpha_cm及其最小值，包括纯共模方向、位于建模共模轴之外的方向，以及必须给出 +inf的零方向和非正定情形；预先登记（d070699a；修订8a44267b，在任何比较之前，重述矩阵形式）；容差在比较之前就已确定。能力文本已按所有者决定（2026-10-02）更正：它此前称对位于共模轴之外的方向，该界为无穷大，这与代码及本比较相矛盾。理想化的单对比检测器是否构成真实子集检测器不可检测量值的下界，仍为模型计算得出

seg-a7a33523bb1c = 月球基准可辨识性：分解的线性代数

seg-bd59cc76557a = 7参数Helmert基准Fisher阵的{ "{" }lunocenter-X, scale{ "}" }块的Schur补边缘分布：标量退化度量lambda_min(S)、origin-X的CRLB，以及origin-scale相关

seg-0f7e4fb31c44 = 独立的SciPy/NumPy参考（scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv）：Schur补、其特征值，以及由独立库计算的2x2逆矩阵。范围限于分解的线性代数（LINEAR ALGEBRA）；由真实几何得到的月球相关/CRLB量值（MAGNITUDES）仍为MODELLED。

seg-3359eee713a5 = 月球基准零空间分类（LLR秩可加性加天平动亏损提升）

seg-6d722c176052 = 对内部测距基准问题的分类：单次测距观测贡献的秩为{ "1" }（6维零空间）；origin-X与尺度这一对近乎为零，而物理的DE440天平动把亏损提升为零，但这一对仍近乎退化

seg-ae6dc4e6ea8b = 引擎复现的几何结构，加上闭式的2x2 Schur恒等式；在结构（STRUCTURE）上与Sosnica等{ "2025" }（arXiv:{ "2510.15484" }）一致，其所报告的量值在此并未复现（NOT）。该分类是结构性的；真实几何下的相关/CRLB量值为MODELLED（反射器坐标和朝向保持固定）。{ "0.30" }外部比较，一项发现（仍为MODELLED）：对照Sosnica等{ "2025" }，测距Fisher的origin-scale相关（-0.993 / -0.988）与已发表的 -0.97相差在{ "0.05" }以内，但在该论文自己的五反射器几何上，等权重7参数Helmert相关为 -0.78（已发表的值依赖论文未印出的逐反射器误差），而origin CRLB（在{ "3" } mm测距噪声下为{ "0.6" }至{ "1.2" } mm）比论文的{ "3.07" } cm低{ "96" }至{ "98" } %，而容差为{ "20" } %。量值未复现

seg-3fd19007ea67 = 多技术月球基准信息（LLR加月球VLBI加轨道器测距）

seg-23d0dd7d0666 = 在7参数基准上，针对地球反射器LLR测距、双站月球VLBI差分时延和轨道器到信标测距的基准雅可比行，合并为一个经一致预处理的Fisher阵；演示了偏离径向（轨道器/深度多样）的跟踪能打破origin-X与尺度的退化，而横向VLBI只能间接起作用

seg-b2f5715c4577 = 对每种技术偏导数的解析与有限差分交叉核对（内部）；改善方向（DIRECTION）是几何事实。信标位置、计划和噪声为MODELLED/有代表性的（见tests/fixtures/llr_geometry/NOTICE.md）。

seg-f9796a4c9a85 = DE440月球主轴朝向提供器

seg-ebe4519a40e4 = 在2014-01-01至2030-12-31 TDB范围内任意历元的MOON_PA_DE440到J2000旋转，由已提交的{ "6" } 209行日序列的节点之间的测地线插值R0·Exp(f·Log(R0ᵀR1)) 得到（try_ 函数在范围之外返回OrientationSpanError，不带try_ 的函数则panic；它从不截断）；在编译时嵌入，因此没有运行时文件系统I/O，WASM构建也带有它

seg-3b710c49338c = NAIF SPICE Toolkit（CSPICE N0067，通过spiceypy { "8.2.0" }，作为工具运行）：pxform从MOON_PA_DE440到J2000，直接计算JPL的二进制PCK moon_pa_de440_200625.bpc，并采用NAIF自己的坐标系内核moon_de440_250416.tf，在嵌入窗口内的{ "2 000" }个随机非节点历元上。Kshana与SPICE矩阵之间的旋转角在{ "1.7e-5" } rad以内（在平均半径{ "1737.4" } km处为{ "30" } m，比较之前就已确定）；实测最差{ "1.7e-6" } rad（{ "3" } m），RMS { "7.8e-7" } rad，而在验证程序另外抽取的{ "6 000" }个历元上最差为{ "1.75e-6" } rad。每日节点本身就是从同一内核提取的（scripts/gen_de440_moon_pa.py，测试数据SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7），所以这一比较检验的是节点之间的插值，那正是所声明的内容。由这一比较发现并修复：此前带Gram-Schmidt的逐元素线性插值保住了轴，却没有保住{ "13.2" } deg/day旋转的角度，在四分点附近误差最高达{ "2.0e-4" } rad（{ "340" } m）；此前约{ "14" } m的数字，来自仅在区间中点取样的保护检查。该序列覆盖2014-01-01至2030-12-31，在其之外报错（第{ "2" }轮）；其2024-2025的节点由同一内核重新生成，相符到{ "4.3e-13" }。上述SPICE非节点比较仅覆盖2024-2025，这是经核对的窗口；扩展的节点来自同一内核和脚本，但未做非节点比较。这是用于可辨识性分析的几何基础，不是亚米级的朝向产品

seg-ab96cfc8d48c = 月球LLR基准几何基础（主轴反射器、地面站、解析测距偏导数）

seg-40e91288f81a = 以PA本体系米为单位的五个近侧后向反射器阵列，以及以大地坐标表示的LLR地面站；经DE440 PA朝向的反射器本体到惯性系的放置；地球到反射器距离相对4参数基准的解析偏导数；以及仅LLR的Fisher矩阵，它展现了促成7参数分析的月心X与尺度的退化

seg-89ce1f95d9f6 = 计算是内部核对的：每个解析偏导数对照有限差分，零基准情形对照标称距离。目录（CATALOGUE）是外部独立核对的：DE440主轴坐标（Park等{ "2021" }，tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv）与DE430月面坐标备忘录表{ "6" }（tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv，由tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py从经SHA-256验证的PDF机器提取）交叉核对，相符到{ "1.12" } m，而同样五个阵列的平均地球实现相差{ "672" }至{ "871" } m。退化结构（DEGENERACY STRUCTURE）对照已发表的结果核对：Sosnica等{ "2025" }，“Definition and Realization of the International Lunar Reference Frame”，arXiv:{ "2510.15484" }，该文报告月球主轴坐标系的月心X与尺度之间的相关系数为r = -0.97，并指出由于这一相关，LLR无法以优于{ "12" } cm的精度到达月球的实际质心。本模块从仅LLR的Fisher设计中恢复了同样的结构（|corr(t_x, scale)| 介于{ "0.9" }与{ "0.9999" }之间，基准亏损<= { "1" }）。这一印证是跨星历的，不是往返：该论文综合了INPOP21a、DE430和EPM2021，而本模块由DE440天平动驱动。未复现的是量值（NOT reproduced）：此处的相关约为 -0.988，对照其 -0.97，而4参数CRLB为亚毫米级，对照其{ "12" } cm的已达成底限，因为朝向和反射器坐标在此保持固定，而在那里则被求解。仅限几何和退化结构；不对已求解的基准作任何精度声明。{ "0.30" }外部比较：本模块的实测测距部分（reflectors()、stations_itrf()、DE440 PA放置以及质心光行时llr_bcrs_one_way_m）在其自己的一行“LLR实测测距模型”中，对照{ "192" }个ILRS标准点经独立核对（RMS为{ "2.81" } m，对照{ "10" } m）。这一行仍为MODELLED，因为实测比较并未检验其声明的其余部分。大地测站目录stations() 把APOLLO舍入到{ "0.001" } deg；采用地心光行时，在同样的点上给出{ "22.7" } m（测试reflector_ranges_against_ilrs_normal_points；采用此前逐元素朝向插值时为{ "96" } m）。解析测距偏导数和仅LLR的Fisher阵是通过llr_range_m和reflector_inertial、采用解析月球级数（ephem::moon_position，与GCRS相差约{ "0.3" } deg）且不含光行时算出的

seg-a78ba110b64c = LLR实测测距模型（反射器目录、ITRF2020测站、DE440主轴放置、IERS { "2010" }质心光行时）

seg-c9827c1a427b = 月球激光测距标准点的单程地球测站到反射器距离：DE440主轴（PA）本体系米单位的五个近侧后向反射器阵列（lunar_llr_geometry::reflectors）；stations_itrf() 中的测站，即取自历元{ "2015.0" }的ITRF2020、带其速度的Grasse { "7845" }和Matera { "7941" }，经IERS { "2010" }变换并加上Bulletin A极移（lunar_vlbi::station_inertial_position_itrs）置于地心天球参考系（GCRS）中，以及位于运营方公布的近似地心位置的APOLLO { "7045" }（无速度）；反射器本体到惯性系的放置经DE440 PA朝向（lunar_orientation::try_de440_moon_pa_body_to_inertial，在2014-2030之外报错）；以及IERS Conventions { "2010" }第{ "11.2" }节的质心光行时（lunar_llr_geometry::llr_bcrs_one_way_m：测站和反射器的式{ "11.19" }本体到BCRS变换，以及来自太阳、地球和月球的式{ "11.17" } Shapiro时延）。输入（INPUTS），不属于声明：质心的地球、月球和太阳状态及势（经SPICE的DE440），IERS UT1-UTC和极移，以及由TT转换为TDB的实测往返。测试装置一侧（HARNESS-SIDE），不属于声明：测试中采用FCULa映射的Mendes-Pavlis天顶时延，其仰角取自大地stations() 目录。未建模：潮汐、测站偏心、反射器热学项

seg-536c75eebae3 = 实测：{ "192" }个ILRS CRD v2月球标准点（EUROLAS Data Center，DGFI-TUM，2024-04至2024-06；Grasse { "151" }，APOLLO { "32" }，Matera { "9" }；连同SHA256SUMS逐字提交）。预测的单程距离与c乘以TDB中实测往返的一半相比较。判据在比较之前就已确定：在全部{ "192" }个点上，并且（AND）仅在两个ITRF2020测站的{ "160" }个点上，RMS至多{ "10" } m。该判据来自第三次预先登记修订3e0f5cdf，在引擎改动和运行之前提交；{ "10" } m这一数字自第{ "1" }轮以来未变。实测：全部点上为{ "2.81" } m（均值{ "2.67" } m）；ITRF2020测站上为{ "2.96" } m；APOLLO为{ "1.94" } m；{ "2015" }年切片（{ "349" }个点，次要）为{ "3.82" } m。变异检验：把太阳Shapiro项置零给出{ "10.19" } m，未通过。已披露的历史：采用逐元素朝向插值时为{ "96" } m；采用测地线插值和大地目录后为{ "22.7" } m；采用ITRF2020测站和极移但使用地心光行时时为{ "10.94" } m（共同的 +{ "10.9" } m偏移）。质心模型是在看到该偏移之后写成的。它是已发表的IERS { "2010" }第{ "11.2" }节模型，没有自由参数。第三次修订取代了在BLOCKED结果之后自行施加的全ITRF2020/SLRF2020条件。仅ITRF2020的RMS在不含APOLLO时通过，而APOLLO没有ITRF2020或SLRF2020解，其位置是运营方给出的近似位置。仍留有共同的 +{ "2.7" } m，低于判据，未做调整。该判据相对结果是宽松的：缺失{ "7.6" } m的太阳项仍给出{ "10.19" } m。低于判据的项并未逐一分辨：极移置零时RMS为{ "6.15" } m（ITRF2020测站{ "5.98" } m），去掉式{ "11.19" }变换时为{ "2.96" } m；两者仍会通过。测站速度以及地球和月球的Shapiro项还要更小。这一比较核对的是在{ "10" } m RMS下组装的单程距离和太阳Shapiro项，不是所列各个分量

seg-9b1dfa736cb6 = 耦合的月球坐标系与时标规范：联合的空间基准、钟差和钟速零空间

seg-a000ef6ab2e0 = assemble_coupled_info在 [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha] 上构建9参数耦合Fisher阵；classify_null_space返回其零空间的、与基无关的分解，分为仅空间、仅时间和真正耦合的维度，以及空间到时间投影算子的耦合范数；coupled_marginal_eigs给出{ "{" }scale, offset{ "}" }的Schur补边缘分布。在已提交的网络上，引擎对适定情形报告满秩基准（亏损{ "0" }），对单历元情形报告精确的单个速率方向亏损（经过的时间为零，因此速率在构造上不可观测），并对两者都计算{ "{" }s, d_tau{ "}" }边缘分布。

seg-35eebbc8a2e9 = 外部核对了什么（WHAT IS EXTERNALLY CHECKED），陈述从窄：kshana用自己手写的Jacobi求解器（fim::sym_eig）计算特征分解，用自己的伪逆计算边缘分布；参考基准通过scripts/gen_coupled_gauge_ref.py，用numpy/LAPACK（np.linalg.eigvalsh/eigh/pinv）重新计算两者。因此，rel<{ "1e-3" }的一致，是以独立库对照标准实现，对本crate算术（THIS CRATE ARITHMETIC）所做的核对，这就是经独立核对的结论，也是它的全部。不包括的内容（WHAT IS NOT）：装配和零空间分类是本模块自己的规则，参考基准是依据同一规格而不是独立来源复现它们的：这印证的是实现，而不是规则。信标和轨道器几何是模型计算得出且有代表性的。观测行确实带有真实的DE440月球PA朝向（lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial），但那是双方都接收的输入（INPUT），不是关于答案的证据，在此作为来源记录，而不是作为状态的依据：这与main在共模完好性那一行中已划出的区别相同。每个行浮点数在写入network.json之前都舍入到小数点后{ "6" }位，因此双方读取的是相同的IEEE-754双精度数，剩下的唯一差别就是求解器。

seg-63a8571f8eb0 = 单向月球测距中的距离与钟差退化，以及几何多样性设计律

seg-cdd70f56051a = 每个节点的径向距离与接收机钟差之间的退化在{ "1" } m对{ "3.336" } ns（即c的倒数）处是精确的。{ "{" }scale, offset{ "}" } Schur补边缘分布（coupled_marginal_fisher）表明，在几何多样的网络中，双向测距对边缘分布的提升，与同样数量的额外单向数据大致相同，而在理想化的单节点情形中，双向的提升要大几个数量级。由此得出的设计律是：在单向测距中，把月球坐标系尺度与时标偏差区分开来的，是几何多样性，而不是双向测距本身；只有在低多样性或单用户情形下，才需要双向或外部时间联系。

seg-25dd0e9134c8 = 耦合信息矩阵的Schur补边缘Fisher阵，用闭式线性代数给出，并对照其所预测的两种极限情形做了核对。{ "1" } m对{ "3.336" } ns的等价关系是通过c对米的定义，不是经验结果。观测网络是有代表性的模型几何，因此该设计律是关于所给几何的陈述，不对任何已部署的月球网络作出声明。

seg-16ec8283f9b4 = 月球时标的相对论时钟速率与坐标系耦合

seg-d9a426dc8620 = rate_frame_jacobian(_with) 给出月球时标速率对坐标系实现的敏感度，基于截断到{ "2" }阶的赤道有效位势（GM、赤道半径、J2、自转；LunarSurfacePotential）：d_alpha/d_scale = L_m，约为 +{ "3.1388e-11" }；d_alpha/d_velocity = -|v_moon|/c^{ "2" }，约为 -1.11e-14（随时间变化）；d_alpha/d_r_radial = g_eff/c^{ "2" }，每米约为 +{ "1.806e-17" }。对{ "1" } m的径向基准移动，这是约{ "1.8e-17" }的速率扰动（径向项的算术结果），远小于月球时标相对TT约{ "1.7e-11" }的速率偏差

seg-6fc3d01ea825 = 预先登记（5590ab21）：L_m对照Ashby与Patla { "2024" }（AJ { "167" }:{ "149" }）式 ({ "10" })，{ "3.13881" }({ "15" })e-11，取自该论文的GM、a_m、omega_m，以及该论文所引用的两个350阶场（Bertone等{ "2021" }，AIUB-GRL350A/B）的J2，偏差在{ "1e-4" }以内；径向项对照pyshtools { "4.14.1" }（BSD-3）对同样两个场的赤道重力，偏差在{ "1e-4" }以内（实测{ "8.3e-5" }和{ "6.7e-5" }，余量很窄）；速度项对照JPL Horizons DE441月球速度，偏差在{ "4.5e-3" }以内。这是对一个350阶已发表数值的2阶闭式近似（残差为3-350阶；Reference，不是P1）。已披露：第1项的结果在预先登记之前就已知，所附默认半径{ "1738.14" } km是该论文的表面定义，在第{ "1" }轮之后采用。潮汐贡献和比较带仍为模型计算得出的参考表面数字

seg-a666792106d9 = 耦合的坐标系与时标零空间的与基无关分类

seg-5ee36574d1b4 = classify_null_space把基准零空间分解为仅空间（维数d减rank U_T）、仅时间（d减rank U_S）和真正耦合（rank U_S加rank U_T减d）三部分，另加空间到时间投影算子耦合范数p_st_norm，即零空间投影算子非对角块的Frobenius范数。这些量中的每一个都是投影算子（PROJECTOR）的函数，而不是所选基的函数，因此在零向量的任何标准正交选择下都不变：这正是该分类能够被报告的原因。

seg-0608e1dc5183 = SciPy/NumPy（BSD-3-Clause；scipy.linalg.null_space和numpy.linalg.svd，LAPACK gesdd）通过子空间交集dim null([F; E_T]) 和dim null([F; E_S])，以及SVD零空间投影算子，对同样已提交的矩阵做分类，这与Kshana的Jacobi特征向量和Gram秩公式不同；预先登记（d429993c）：整数完全一致，p_st_norm到{ "1e-9" }（P2，独立的数值库），秩阈值事先确定，并断言谱间隙至少为{ "1e6" }。该行的声明是对所述矩阵的分类，因此P2对其作了完整覆盖。构造的算例包括直和、耦合和混合的零空间以及随机换基；耦合规范行的真实网络维数在此不重新计数。保留crate内的不变性测试（旋转后的零空间基给出相同结果）

seg-2c074d6260ba = 有代表性的多技术测量菜单与可加的Fisher组合规则

seg-beefac5c1b13 = MeasurementBlock保存一次候选测量活动，其形式为7x7的Fisher信息贡献加一个标量相对成本；block_from_rows由原始基准雅可比行构建一个，使每个块都通过lunar_identifiability::assemble_multi_info得到相同的预处理；combine对所选子集的信息求和，这是正确的规则，因为Fisher信息在独立测量之间是可加的；representative_lunar_menu提供确定性的四块菜单（LLR、横向VLBI月缘信标、近侧轨道器和远侧轨道器）。使用该菜单的受预算约束的设计优化器不属于本crate。

seg-d83a9942ee72 = Fisher信息在独立测量之间的可加性是闭式性质，在此对照独立写成的逐元素求和核对，并对照由此得出的次序不变性和单调性核对。关于证据的说明：组合器此前根本没有测试，模块中唯一的测试是直接内联地对两个信息矩阵求和，而没有调用它，因此即使组合器坏了，模块也仍会通过；该测试现在经由combine，并且在其被变异时失败。所有信标位置、轨道器几何、各技术的精度和相对成本都是有代表性的选择，而不是任务数值（见tests/fixtures/llr_geometry/NOTICE.md），因此通过该菜单得到的每一个退化度量和CRLB数字，都继承lunar_identifiability::decompose的模型计算得出的状态。

seg-341eedfc47da = 跨提供方的月球坐标系/动力学一致性（真实星历间差异）

seg-f8d94c0771cc = 对DE440/INPOP21a/EPM2021地心月球差异的仅旋转（6参数平移加旋转）分解，分为可消除的共同ICRF坐标系联系和不可消除的月球轨道朝向超出量（完整的7参数Helmert拟合是另一个公开函数，不在这一外部核对的涵盖范围之内（NOT）：其证据是一项内部解析恢复单元测试，加上tests/lunar_helmert_fit_cross_check.rs，后者使其与lunar_frame_realise中经独立核对的精确Gauss-Newton拟合相符，并固定二者之间相反的旋转符号约定）

seg-c69fd3fc645b = 三个独立的权威星历：DE440（JPL）、INPOP21a（IMCCE）、EPM2021（IAA RAS），通过IMCCE calceph采样，并由独立的numpy SVD最小二乘拟合交叉核对。为什么这一行是经独立核对的，而lunar_common_mode却不是，尽管用的是同样三个星历：这里所报告的量就是已发表数据本身的属性（它们之间的相互差异），所以这些星历就是参考基准，而不是输入。在lunar_common_mode中，同样的差异输入到一个MODELLED的星座几何，答案是该模型的属性，所以那一行被正确地标为Modelled/ReferenceImpl。

seg-2d3347bcb15e = 混合提供方用户的跨提供方一致性容差

seg-9decf2cb6b0c = consistency_tolerance：把用户位置预算反演为，在参考杠杆臂处，对每个参数的提供方间Helmert一致性要求（origin/scale/rotation），可选择按P1单提供方实现CRLB放大

seg-b8dc68eb4bda = Helmert点雅可比作用的最坏情形三角不等式界（闭式）

seg-5450d921dfc9 = 多提供方月球互操作误差预算与坐标系对星历设计律

seg-e1e30f5c17a6 = interop_budget：在PerProvider / CommonFrameTie / CommonEphemeris约定下，把可消除（共同坐标系联系）与不可消除（动力学）分开，并给出不可消除比例这一设计律度量（在真实DE440/INPOP/EPM上约为{ "0.69" }：仅有共同的坐标系标记，仍留下占主导的底限）

seg-46304ae1efa4 = 在每种约定下，对经独立核对的逐对拆分做RMS汇总（闭式）

seg-a01f394a36d3 = 自主自由网故障可观测性线性代数流程（奇偶投影算子、可检测性、MDB非中心参数、拜占庭块spark）

seg-b3389bb90e8d = 在基于真实DE440的逐节点月球网络上（每一行是通过pernode_range_row构建的节点间差分单向距离，带真实DE440月球PA坐标系视线），引擎计算加权奇偶投影算子P⊥ = I − G(GᵀWG)⁺GᵀW（在8维基准⊕时标规范下仍然成立的秩亏伪逆形式）、T1可检测性残差 ‖P⊥·b‖（位于值域内的故障被湮灭，一般故障可检测）、Baarda MDB非中心二次型cᵀWP⊥c（正确的单P⊥ 加权形式，而不是（NOT）双P⊥ 形式cᵀP⊥WP⊥c），MDB = √(λ₀/cᵀWP⊥c)，以及堆叠的有效对等节点特征P⊥·B_T的拜占庭块spark检测/辨识计数（列秩，而不仅是非零）

seg-8cb248423fd0 = 在真实DE440月球PA坐标系视线行上做独立的numpy/scipy线性代数复现（P⊥ 来自白化设计W^{ "{" }1/2{ "}" }G的SVD；MDB非中心参数来自经典的Baarda（{ "1968" }）奇偶子空间平方范数；块的秩来自numpy SVD的奇异值计数）：这是与本crate对GᵀWG的循环Jacobi特征分解真正不同的数值路径。范围（依据tests/fixtures/faultobs/NOTICE.md）：这只在这些行上核对线性代数流程（LINEAR-ALGEBRA PIPELINE）。节点几何是模型计算得出的。它不是（NOT）运行中的完好性保证，不是保护级认证，也不是任何RAIM/ARAIM可用性声明，也不是（NOT）拜占庭容错的任务保证：该网络所容忍的故障计数（COUNT）是模型计算得出的，而detect>f / identify>2f块spark界（BOUND）是引用的（Fawzi–Tabuada–Diggavi { "2014" }；Shoukry–Tabuada { "2016" }；Donoho–Elad { "2003" }的块式spark），并在代码中作了已证明的实例化

seg-ebb827739614 = 自主逐节点月球网络上的拜占庭块spark检测/辨识界（T3）

seg-4fb935e6193d = byzantine_bound在逐节点网络几何上实例化了安全状态估计的编码/稀疏可观测性界：拜占庭对等节点会注入它所参与的测量的任意线性组合，网络可检测（DETECTS）任何 ≤ f = block_spark − { "1" }个对等节点的联盟，并可唯一辨识（IDENTIFIES）任何 ≤ ⌊(block_spark − { "1" })/2⌋ 个的联盟，其中block_spark是堆叠的有效特征P⊥·B_T列秩亏的最小对等节点联盟。对等节点的可检测性是P⊥·B_j的满列秩（FULL COLUMN RANK）（非零但秩亏的块是落入range(G) 而不留下残差的非零攻击），而不仅仅是P⊥·B_j ≠ { "0" }

seg-3b8b54db475d = 块式spark / 安全状态估计界的几何实例化（Fawzi–Tabuada–Diggavi { "2014" }；Shoukry–Tabuada { "2016" }；Donoho–Elad { "2003" }的块式spark；Candès–Tao { "2005" }），不是（NOT）Lamport–Shostak–Pease的3f+{ "1" }共识阈值（“拜占庭”仅指任意/共谋的故障模型）。具体的容忍故障计数是有代表性的网络几何的模型计算得出的属性，由手工构造的解析算例和计数公式做了自洽性核对

seg-4f57f586cf82 = 自洽月球星座的自主守时时间规范底限（T4）

seg-eb690e8f5c9b = holdover_floor确立：在仅由节点间测量相连的自主节点集合中，共同时钟速率（δα_j += { "1" } ∀j）是位于N(GᵀWG) 中的集合时间自由参数：再多的节点间测距也无法观测它（rate_in_gauge = true，连同共同偏差temporal_gauge_dim = { "2" }）。这就是真正的守时底限：刚性坐标系位置规范在时间上的对应物。加入一个外部绝对速率联系（与网络之外参考的直接链路），就把共同速率从零空间中排除（rate_in_gauge = false，temporal_gauge_dim = { "1" }），证明该底限是真实的规范，不是振荡器模型的人为产物

seg-097f126797bb = 集合时间自由参数论证（Percival { "1978" }；Lewandowski与Thomas { "1991" }），在有代表性的、基于真实DE440的逐节点网络上实例化：对解析共同速率生成元相对GᵀWG做相对残差零空间检验，并用打破联系后的对比区分真正的规范与振荡器模型的人为产物。有代表性的模型几何，不是经认证的授时预算

seg-25ffd6e1979c = 提供方共同/差分拆分、单一秩亏统一，以及保护间隙斜率（T5 / §{ "0" } / g7）

seg-72c7ec3724bf = 同一分解 ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) 的三个侧面，其中8维基准⊕时标规范为N(G)，而state_dim − { "8" } = { "32" }个可观测方向为range(G)：（T5）provider_mismatch_split把共同的多提供方偏差（∈ range(G)）归类为不可检测（UNDETECTABLE），需要外部联系，而把差分偏差（∉ range(G)）归类为自监测/可检测（DETECTABLE）；（§{ "0" }）统一在于，同一个range(G) 盲子空间支配着不可检测的故障类，因此基准规范N(G) 与故障盲子空间range(G) 是同一种几何，而不是两种；（g7）slope返回Brown保护间隙斜率 ‖Π_obs Δx̂‖ / ‖P⊥b‖_W，对故障b ∈ range(G)（估计器受到破坏而奇偶为零）趋于 ∞，对可检测故障则有限

seg-e0fd3860fce9 = 在有代表性的、基于真实DE440的逐节点网络上的闭式奇偶投影算子/伪逆代数：共同/差分拆分、N(G) ⊕ range(G) 统一，以及Brown（{ "1992" }）保护间隙斜率，都由值域湮灭P⊥·G = { "0" }推出。有代表性的模型几何，不是经认证的保护级

seg-101b0551d987 = 守时时间误差序列上的电信授时MTIE与TDEV

seg-b4762fd3cb9d = <c1/>场景类型所报告的最大时间间隔误差和时间偏差，在电信量级的守时记录上：一个O(n) 的单调队列滑动窗口MTIE（telecom_timing::mtie_sliding，使一天的秒级采样仍然很快所必需），以及引擎的TDEV（allan::time_deviation），在该类型所报告的网格上求值，并从摄入该序列的一次完整运行中读回

seg-59cb2711355c = allantools { "2024.06" }：一个独立的第三方频率稳定度库，对tests/fixtures/telecom_timing/holdover_te_series.csv做mtie() 和tdev()，双方从同一份17位有效数字的文本解析该序列；参考基准记录了该序列的SHA-256，并可通过tests/fixtures/telecom_timing/generate_telecom_timing_reference.py离线重新生成。核对的是该记录上的估计器（ESTIMATORS），不是产生它的合成守时

seg-632add2dbd3c = 带PASS/FAIL和裕度的ITU-T电信同步模板

seg-47687529aee7 = 转录的限值：ITU-T G.8272（07/2025）PRTC-A/B，G.8272.1（{ "2024" }）Amd. { "1" }（07/2025）ePRTC锁定与ePRTC-A守时（包括表{ "3" }时间误差包络），G.8273.2（{ "2023" }）Amd. { "2" }（11/2025）T-BC/T-TSC A-D类，以及G.8271.1（{ "2022" }）Amd. { "3" }（05/2025）参考点C，每个区间按表中所述为开或闭，并略去每一项“待进一步研究”的条目；每项检查给出判定和约束点上的裕度，以及超出每个预算的时间。可作为<c1/>场景类型运行

seg-46b139a58bb0 = 对所列建议书的转录（可从itu.int免费下载），每项限值都带有其表或条款，并连同每一个未经确认或未实现的条目列于docs/TELECOM-TIMING.md；这些表所隐含的断点连续性恒等式在测试中核对。这是带内部一致性核对的标准转录，不是一致性测试，也不是外部核对。{ "0.30" }第{ "2" }轮（预先登记970003ee），受阻（仍为MODELLED）：建议书以算例形式印出的十个模板值和十三个ePRTC-A守时值（G.8272图1-2，G.8272.1 Amd.1第{ "8.2.1" }条和图V.1-V.3，G.8271.1 Amd.3图7-2至7-4）在半个印刷单位之内被复现，其中大多是表中常数或断点；G.8271.1图7-2在{ "1.3" } s处标注{ "200" } ns，与其自身的表7-1（{ "197.5" } ns）不一致。G.8273.2 A-D类的限值没有印出的算例值，而G.8272.1 ePRTC锁定断点标注（位于实线构造线上）被预先登记的选取规则排除，所以这些仍是转录

seg-165ed2bc771a = ITU-T频率同步漂移产生模板（G.811、G.812、G.8262、G.8262.1）

seg-953793d4446a = 为<c1/>类型提供七个恒温MTIE和TDEV漂移产生模板：G.811（09/1997）PRC（自主）、G.812（06/2004）I、II和III型、G.8262（10/2024）EEC选项{ "1" }和{ "2" }，以及G.8262.1（11/2025）eEEC（锁定模式），包括表中所写的幂律片段（<c2/>之类），每个区间按印刷所示为开或闭，通过条款所述的{ "10" } Hz滤波器测量（取为在采样之前施加）；参考场景scenarios/telecom-synce-eec.toml把一台自由运行的OCXO对照三个EEC模板。未实现：变温容许量、守时、瞬变、抖动，以及G.811的频率精度

seg-ca16d9c98dc5 = 对所列建议书的转录（于2026-10-13从itu.int下载），每一行都对照文本重新读过，并在测试中界定了印刷系数所隐含的断点连续性（例如{ "40" } · { "10" }^{ "0.4" } = { "100.48" } ns，对照G.812表{ "4" }的{ "100" } ns平台）。这是带内部一致性核对的标准转录，不是一致性测试，也不是外部核对。G.812（06/2004）被列为已被一个预先发布的08/2026版取代，G.811有Amd. { "1" }（04/2016）；二者都无法读到，因此都未核对。自由运行的OCXO场景在相对于环路时间常数较长的观测间隔上，高估了振荡器的贡献；它对任何设备时钟都没有说明

seg-5fc2ad88faf0 = 读成归一化相位序列的时钟日志格式（RINEX时钟、TimeLab ASCII、TAPR TICC）

seg-5b5bcbdea166 = clock_log::read_input：一个解析层，把RINEX时钟文件（某个指定时钟的AS/AR记录，版本{ "2" }以及{ "3.00" }至{ "3.04" }）、TimeLab式ASCII相位或频率日志，或TAPR TICC时间戳或间隔日志，转成统一的相位网格，tau0由声明、由头部或由中位间隔给出，每个间隙、离网格读数和重复都被计数，并有拒绝、最长连续段或线性的间隙策略；以可选方式接入电信授时序列（<c1/>，增加一个<c2/>块）和时钟类型（<c3/>，增加一个<c4/>块，含ADEV、TDEV和MTIE、表的SHA-256和相位的SHA-256；runs = { "1" }）。没有该表时，两种类型逐字节相同

seg-1d3df655c14c = 预先登记于tests/fixtures/clock_log/PREREGISTRATION.md（单独提交，159334f2，在测试数据存在之前）；记录于RESULTS.md。三份带随机种子的合成日志，每种格式一份（一份TICC有三个历元的间隙，一份RINEX带需忽略的第二个时钟），由同一作者依据docs/CLOCK-LOG-FORMATS.md写成的独立读取器读回：网格、间隙和填充计数相等，最大相位差为{ "0" } s（判据{ "1e-13" } s）。allantools { "2024.6" }的oadev、tdev和mtie在该相位上，对其评估的每个平均因子，相对偏差在{ "2.5e-14" }以内（判据{ "1e-10" }）；它不评估整个记录上的MTIE，而引擎会报告这一项，因此每份日志的这一个点没有参考基准值，按其措辞的判据在该处未达到。MODELLED：合成日志，且读取器参考基准与作者相同；没有对仪器的真实TimeLab、TICC和RINEX时钟文件做比较

seg-acdb0337bce7 = 读成归一化相位序列的时钟日志格式linuxptp（ptp4l、phc2sys、ts2phc）和chrony（tracking、statistics）

seg-e87b3dba2072 = clock_log::read_input支持格式ptp4l、phc2sys、ts2phc、chrony-tracking和chrony-statistics：linuxptp伺服行所记录的偏移（ns，采用该行自带的括号内时间戳，在伺服首次报告s2之前的读数被略去并计数），或chrony tracking或statistics日志的偏移（s，按列位置，UTC日期和时间），经与其他格式相同的间隙策略成为统一的相位网格；来源选择器（<c1/>）指定若干接口、时钟或地址之一；这些日志供给电信授时序列、时钟类型和守时测试类型

seg-fb9393044576 = 测试数据是为Kshana依据各守护进程公开的行布局编写的，数值为编造（见测试数据文件夹中的NOTICE.md）；没有读取任何真实安装的日志，也没有参考基准把解析结果与另一个读取器比较，因此在不同守护进程版本之间有差异的布局，仍可能被拒绝或被误读。由相位序列供给的估计器，就是在上面各行中对照allantools经独立核对的那些

seg-97aebb84576e = 由运营方提供的时间误差记录评分的守时测试

seg-ab533cf99c56 = <c1/>类型：时间误差记录（linuxptp、chrony、TICC、TimeLab或RINEX时钟日志，或time_s,time_error_ns数据对）在运营方声明的GNSS移除和恢复两个时刻处被拆分为基线、守时和恢复三步；基线对照为锁定时钟编写的ITU-T模板度量，守时对照为守时或自主时钟编写的模板、ePRTC-A守时包络和时间误差预算度量；守时部分报告系统所保持的最小二乘频率偏差，恢复部分报告 |TE| 是否以及何时进入所述的带并在所述驻留时间内保持其中，以及峰值和最大阶跃。每项限值都是电信授时类型所转录的那一项；这两个时刻是运营方的陈述，未经核实

seg-a54380cf95ea = 对由公式构建的记录做手工计算，其斜率、阶跃、极值和恢复时间在运行之前就已知（测试中陈述了它们），并对照上面电信授时各行的模板、包络和预算。没有对真实守时做过实验室测量评分，也没有与外部参考基准比较，因此该类型不对任何时钟或系统作出声明；在任何逐时钟等级的数字能够被提升之前，需要一个授时实验室合作方

seg-94cbac97a1aa = 空间服务体积及以外的GNSS信号可用性，与ICG SSV手册对比

seg-c59e349fdc9e = <c1/>类型的可用性扫描：逐星座（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）以及合并后，至少有一个信号和至少有四个信号的（用户，历元）对所占的份额，以及最长中断，对象是位于球面上的用户（手册的2,562点全球球壳，{ "14" }天，间隔{ "1" }分钟）或位于轨迹上的用户（GEO、HEO、月球转移），由手册附录C的开普勒轨道、参考偏离视轴角之内恒定的最小辐射功率、球体加{ "50" } km的地球遮挡以及C/N0阈值得出；用户天线取自手册的表B10

seg-d71c9d361342 = ICG空间服务体积手册（UN OOSA ST/SPACE/75，{ "2018" }）本身就是一次仿真，在运行之前提交的预先登记下做了比较（xval/gnss-ssv/PREREGISTRATION.md；结果见xval/gnss-ssv/RESULTS.md，由tests/ssv_booklet_results.rs固定，包含未达到的项）。第{ "1" }次运行采用预先登记的解读：最小辐射功率常数和月球判据相符（S0、S6达到判据）；上SSV、下SSV、射频阈值、GEO和HEO的判据NOT MET，几乎全部由GLONASS引起，手册在表B2和B6中给出的是{ "20" }和{ "28" }度，而在表{ "4.2" }中是{ "26" }和{ "34" }度。采用表{ "4.2" }角度的诊断变体，在上SSV、下SSV和六个GEO任务的每个单元格中都相符（它不取代第{ "1" }次运行；射频、HEO和月球单元格仍有未达到）。实测的GPS L1面板方向图没有被参数化的替代复现（RMS为{ "6" }至{ "9" } dB，对照{ "3" } dB的判据）。相符说明手册所述的方法被复现了，而不是说明GNSS信号就是这样表现的

seg-d2f04991c8a4 = <c1/>类型中，掠射GNSS信号的临边射线电离层、等离子体层和大气效应，以及弱信号接收机设计

seg-1a1786ba90b6 = 沿发射机与用户之间的直线射线积分的Chapman电离层、Gallagher型等离子体层和中性大气（折射率弯曲、氧吸收、散焦）：斜向总电子含量、其等离子体层部分、附加时延、切点高度以及掠射链路上的损耗；以及一个弱信号接收机设计（相干与非相干积分、数据比特限制、辅助、多普勒搜索），它根据捕获和跟踪环路模型确定C/N0阈值

seg-4ca1217472ab = 测试中的闭式解与已发表的量级（查普曼层的峰值和地表临边的弯曲，GPS至GEO射线上几TECU的等离子体层）；接收机设计复用捕获和跟踪环路模型及其测试。没有拿实测的临边探测数据或弱信号接收数据与之比较

seg-6b8f9f3ca2a3 = 面向高轨和月球转移轨道航天器的星载GNSS导航滤波器

seg-39ddc494f103 = <c1/>类型的<c2/>模式：九状态扩展卡尔曼滤波器（位置、速度、接收机钟差和钟漂、一个太阳辐射压尺度），作用于伪距，其可用性、噪声和C/N0与扫描所用的链路几何一致；真值积分计入J2、太阳和月球第三体引力以及带阴影的辐射压，滤波器对J2和第三体建模并估计辐射压；报告GNSS轨道之内和之上的位置与速度误差、最长的测量间隙以及平均NEES

seg-469602656ab4 = 仿真真值对照滤波器自身的估计（一致的滤波器，其位置的平均归一化估计误差平方约为{ "3" }），以及固定随机种子下的确定性。没有拿飞行数据或已记录的高轨GNSS数据与之比较；太阳和月球是低精度的圆轨道替代模型

seg-5fc242476828 = 基于GNSS的大椭圆轨道多航天器编队相对导航

seg-f67eb29d4483 = <c1/>类型的<c2/>模式：主星和副星各自运行绝对滤波器；副星相对主星的位置，一方面由绝对估计相减得到，另一方面由一个相对滤波器估计，该滤波器作用于两颗航天器都跟踪的信号的单差伪距，相对动力学为两条非线性轨道之差

seg-69c078b57fc8 = 与绝对滤波器相同的仿真真值：相对滤波器相对真实相对状态的误差，以及检验其表现至少不逊于两个独立绝对定位结果相减。没有拿飞行编队数据与之比较

seg-7038f6902820 = 冷原子干涉仪误差项：拉曼激光相位噪声、波前曲率偏差和条纹模糊度解算

seg-4d9690207607 = inertial::cai_error_terms（库函数，尚不能从场景类型调用）：方脉冲三脉冲干涉仪的拉曼相位权重函数（Cheinet等，{ "2008" }，式{ "8" }）及白相位闭式解 (pi/2)^{ "2" } S_phi0/tau_R，并提供适用于任意谱的数值方法；回射延迟无法抵消的激光频率噪声（Le Gouet等，{ "2007" }，式{ "9" }至{ "11" }）；热原子云的纯离焦波前偏差sigma_v^2/R及其随探测半径的减小；经典加速度计辅助下以及两个询问时间下的错误条纹级次概率erfc(pi/(sqrt({ "2" }) s))，及其反函数

seg-a7b220763674 = 测试中每个闭式解都对照一条独立的数值途径（对精确传递函数和延迟滤波器作频域求积，对波前偏差对原子作蒙特卡罗，对条纹级次对测量次数作蒙特卡罗）及其极限情形。一个已发表的算例：Cheinet等{ "2008" }（arXiv:physics/0510197，第IV节）指出，在tau_R = { "20" } us时，要使每次测量为{ "1" } mrad，白拉曼相位噪声须低于 -111 dB rad^2/Hz；仅白噪声项给出{ "0.99" } mrad（该文以其式{ "17" }，闪烁加白噪声，推出此水平）。这是内部自洽加一个算例，不是外部验证；高阶像差和任何具体激光器的噪声均未建模

seg-c380ec16a4f8 = 阿伦方差、修正阿伦方差和哈达玛方差的Greenhall与Riley精确等效自由度

seg-dee2a54c5019 = allan::edf_greenhall（及edf_greenhall_adev、_mdev和 _hdev封装）：Greenhall与Riley的完整算法，Proc. 35th PTTI（{ "2003" }），第{ "3" }节（公式{ "7" }至{ "13" }及表{ "1" }至{ "3" }的大J系数），差分阶数{ "1" }至{ "3" }，噪声指数 +{ "2" }至 -4（凡alpha + 2d > { "1" }），重叠与非重叠、修正与未修正估计量；不适用处给出NaN，包括ceil(M/S) <= d的未修正白PM情形，其闭式解尚未实现。assurance::uncertainty::edf现共用该代码，输出保持逐位一致

seg-695ec24f9676 = allantools { "2024.6" } ci.edf_greenhall，这是该已发表算法的第三方实现，由scripts/gen_greenhall_edf_ref.py在xval/greenhall-edf/PREREGISTRATION.md预先登记的网格上运行（单独提交，0db0bb7a，早于任何比较）：在其返回有限edf的全部{ "4 876" }个点上，kshana的相对一致程度在{ "6.0e-13" }以内（判据{ "1e-9" }）；在其{ "46" }个NotImplementedError点上，kshana返回NaN；每个用例标签均出现；各封装与核心逐位相等；uncertainty::edf在{ "274 280" }个值上逐位一致（重构之前已固定为SHA-256）。在{ "32" }个点上（alpha -4，d { "3" }，未修正，情形{ "2.2" }），allantools在其表{ "2" }查找中失败，因此这些点没有参考基准值，不计入。未运行Stable32。{ "0.36" }修订（docs/revisions/STUDIO15-greenhall-edf-portable.md）：在可移植数学库上，核心从一次舍入的双双精度求值取对数（allan::greenhall_ln），未改动的判据{ "1" }在全部{ "4 876" }个点上再次成立，最坏相对{ "6.0e-13" }；uncertainty::edf的防护基线重设为{ "0.36" }可移植转储（{ "274 280" }个值中有{ "3 746" }个发生移动，相对至多{ "1.6e-12" }，相对于主机数学库基线）

seg-363705e03bac = 基于公开数据手册的振荡器守时（holdover）预设

seg-9750d9e0ec7a = 四个预设：OCXO（Microchip OX-208）、铷钟（Microchip 8040C）、铯钟（Microchip 5071A高性能管）和CSAC（Microchip SA.45s），各自带有其数据手册的阿伦偏差上限、老化和温度界限；对白噪声、闪烁噪声与随机游走频率噪声做非负最小二乘拟合，并缩放以包络每个数据手册点，闪烁下限不低于最长 τ 的数值，另有线性老化和正弦温度项，合成为GNSS丢失之后带随机种子的守时（holdover）

seg-95aaa171864b = 输入数值来自四份指名的Microchip数据手册（文档编号和网址见各预设及docs/TELECOM-TIMING.md）；闭式的老化斜坡和拟合的包络性质作为内部检查。这些数值如何变成噪声模型（拟合、下限规则、30天的月、线性温度读法）是一种建模选择；没有任何预设是对某台设备的测量。{ "0.30" }第{ "2" }轮，针对实测设备的单侧判据（预先登记a01c491c），一项发现（仍为MODELLED）：ESA MGEX最终钟差中的IGS站THU2 Symmetricom 8040C，其阿伦偏差为铷钟预设的{ "0.35" }至{ "0.87" }，但守时（holdover）误差为其{ "1.07" }至{ "1.60" }；5071A记录在{ "1000" } s以内处于铯钟预设之外（测量白相位噪声，在{ "1" } s处为30倍），在守时（holdover）中也是如此（{ "1.15" }至{ "8.74" }）；{ "2011" }年最差的量产SA.45s在{ "1" } s处为CSAC预设的1.26倍；OX-208没有实测记录（受阻）

seg-69f93d5ec864 = 基于实测时钟记录的守时（holdover）预测，并在保留数据上检验

seg-8bdc5a24c66d = <c1/>类型的实测记录路径：相位记录的重叠阿伦偏差，在白相位与IEEE Std { "1139" }调频基下，以edf加权非负最小二乘拟合（slot_timing::fit_weighted），再反解出钟差达到阈值的滑行时间（slot_timing::slot_budget）。红噪声下限由记录实测得出，而非假定

seg-c888226296fe = 一台真实的自由运行原子钟：以氢钟为参照测得的5071A铯标准的{ "556 990" }个一秒相位采样（A. Wallin，随allantools分发；固定的提交和SHA-256见scripts/fetch_cs5071a.sh），与tests/cs5071a_reference.rs用于估计量的是同一份记录。保留的三分之二是预测从未见过的外部测量。受数据门控：realdata-clock工作流获取该记录，并在KSHANA_REQUIRE_REALDATA={ "1" }下运行该测试。验证了在以白调频为主的原子标准上、滑行至约{ "50 000" } s的拟合再反解路径；不包括数据手册或等级来源，也不包括确定性项。并非晶体振荡器：在一份实测OCXO记录上（tests/slot_timing_ocxo_holdout.rs，allantools，对氢钟{ "5.5" } h），保留数据上的预测偏保守，为实测越限的{ "0.59" }至{ "0.70" }，且大多在判据之外，因为该振荡器的噪声下限在记录期间减半；在样本内为{ "0.98" }至{ "1.17" }。晶体情形仍为MODELLED。也并非轨道上的原子钟：在{ "10" }颗GPS Block IIF卫星钟上（tests/slot_timing_igs_holdout.rs，IGS最终{ "30" } s钟差，{ "14" }天，协议在下载之前写定），{ "8" }颗落在判据之内，{ "2" }颗（G25、G30）偏乐观，最多约2倍，因此按该协议，轨道情形仍为MODELLED

seg-d7e03158b972 = 自由运行的时钟离开某个按时间编排的时隙保护间隔所需的秒数，以及使其保持在间隔之内的定位更新节奏

seg-0b4d8815f756 = <c1/>类型：预测误差E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t²，反解得出越限、剩余时间、扣除定位更新延迟后的重新同步间隔以及每天的定位更新次数，每一项逐一列出并指明起主导作用的一项；时钟来自六个ClockClass默认值（新增TCXO、OCXO和RAFS，各引用一份数据手册）、电信授时预设、内联数据手册或实测记录；越限超出来源最长平均时间的，标记为外推

seg-cc0464060e58 = 每一项单独的闭式解，以及独立的holdover::holdover_seconds求根；数据手册数值即所指名的文档（docs/SLOT-TIMING.md）。等级默认值建立在假定的红噪声下限之上，数据手册来源是上限值的包络，因此两者都不是对任何设备的测量

seg-2797643153dc = 轨道上接收机在GNSS欺骗干扰（spoofing）下的授时保护级

seg-cb412a2ffadf = orbital_timing::orbital_timing，可作为<c1/>类型的欺骗干扰（spoofing）部分调用：圆轨道速度和周期，地面欺骗源每次过境能触及卫星的最长时间，钟辅助的监测下限和CUSUM检测延迟，条件保护级（下限加检测延迟内的滑行），在规定的最大斜坡速率下欺骗源在卫星离开其覆盖区或独立检查运行之前累积的牵引量，以及每次地面接触或星间链路检查是否独立于一个地面欺骗源

seg-3d441db3a373 = 归约到现有的授时保护级，以及圆轨道和球形地球可见性闭式解。以检测到为条件，一个地面欺骗源，规定的斜坡速率，在非旋转地球上的正上方过境；没有在遭受欺骗干扰的在轨接收机上做过独立核对

seg-158a99d40b0d = L波段信号功率谱密度和谱分离系数的闭式解

seg-17060c71fa54 = GPS L1 C/A和L2C（BPSK({ "1" })）、GPS L5和Galileo E5a（BPSK({ "10" })）、正弦BOC({ "1,1" }) 以及Galileo E1 MBOC(6,1,1/11) 的单位面积功率谱密度（navsignal::Modulation::psd，另增MBOC变体），其数值定位的零点和极大值（spectrum::psd_nulls_hz、psd_peak_hz、main_lobe_null_to_null_hz），某个信号相对任意谱在任意偏移处的谱分离系数（navsignal::spectral_separation_coeff_offset），或相对单音、平坦噪声、线性调频或匹配噪声的谱分离系数（spectrum::Jammer::ssc），以及抗干扰系数Q = 1/(R_c kappa)

seg-d8fadba57203 = 已发表的教科书数值：BPSK(n) 主瓣零点到零点为2n x { "1.023" } MHz，抗干扰系数对窄带（CW）干扰源为Q = { "1" }，对与C/A匹配的扩频干扰源为Q = { "1.5" }（Kaplan与Hegarty，Understanding GPS/GNSS，第3版，第{ "9.4" }节）；BOC(m,n) 主瓣以正负m x { "1.023" } MHz为中心（Betz，Binary Offset Carrier Modulations for Radionavigation，NAVIGATION { "48" }({ "4" })，{ "2001" }）；C/A与C/A、BOC({ "1,1" }) 与BOC({ "1,1" })、C/A与BOC({ "1,1" }) 的谱分离系数分别为 -61.8、-64.8和 -67.8 dB/Hz（Betz { "2001" }；Hein等，MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C，Inside GNSS，{ "2006" }年5/6月），此处由其帕塞瓦尔自相关闭式解复现。BOC({ "1,1" }) 的极大值不在{ "1.023" } MHz：主瓣自载波零点延伸到{ "2.046" } MHz，峰值在{ "0.759" } MHz，测试对两者都做了固定。MBOC混合取自ICD定义，仅检查了单位面积和线性

seg-f134975d4ffa = 在脚本化干扰源时间线下，带有各频段J/S和有效C/N0的L波段频谱瀑布图

seg-86ad8f89a822 = <c1/>类型：L波段功率谱密度的频率-时间网格（热噪声下限k T_sys，其中T_sys = T_ant + { "290" } K (F - { "1" })，各信号取接口规范的最小接收功率，以及带开关时间的连续波、窄带、线性调频和匹配噪声干扰源），每个单元在其频率格和行上取平均（线性调频对完整和部分扫频精确取平均，干扰源按占空比取平均），每行的各频段有效C/N0 = [1/(C/N0) + sum (J/S) kappa]^-1，各频段J/S、带内J/S，以及带C/N0条的SVG瀑布图。报告含有与<c2/>类型在相同链路输入下的链路的交叉检查

seg-deead3dc3c43 = 归约到现有<c1/>类型的抗干扰方程和链路预算（同一份代码，以相同输入调用），以及k T0 F噪声下限闭式解。其下的信号谱即上面那条已独立核对的行；干扰源功率、时间线和前端带宽是场景输入，谱是连续的（没有扩频码谱线），也没有自动增益控制、消隐或天线方向图作用于干扰源。仓库中没有实测的受干扰频谱可用来核对该合成结果。<c2/>类型的Q表（CW和窄带{ "1" }，自{ "0.36" }起宽带和扫频{ "2" }：教科书数值，固定于navsignal闭式解）与本模型的CW值一致，但与本模型对与C/A匹配的噪声（{ "1.5" }）以及对未作带内归一化的平坦零点到零点噪声（{ "2.2" }）所推导的值不同；报告同时给出两者

seg-1461dcaed6be = SigMF记录的输入输出，以及复IQ的Welch谱估计

seg-2195d95299b2 = sigmf：读写Signal Metadata Format记录（JSON .sigmf-meta，含核心的global、captures和annotations字段；原始 .sigmf-data为cf32_le、ci16_le或ci8，其整数解码器与realdata::iqif::load_iq共用），全部基于字符串和字节缓冲区。spectrum::welch_psd：汉宁窗、重叠、平均周期图，按密度缩放，基于crate内的基2变换（spectrum::fft_in_place）。这两项是已独立核对的声明。spectrum::synthesise_iq把模型绘制为IQ，<c1/>类型的 [iq] 部分依次运行模型到IQ、到SigMF、再到Welch，并与模型比较；其 [recording] 部分估计真实记录（原生构建）；合成以及这些与模型的比较不在已独立核对的声明范围之内

seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch（BSD-3-Clause），使用相同的周期汉宁窗、重叠、密度缩放、不去趋势和双边均值平均：在{ "27" }个用例上每个频点的相对一致程度都在{ "1e-12" }以内（观测为{ "6.0e-14" }），分段数取自scipy自己的频谱图。sigmf-python { "1.13.0" }（LGPL-3.0，作为工具运行）写出五份第三方记录（cf32_le、ci16_le、ci8，两份带标注的采集，一份首个sample_start非零），该crate逐位一致地解码并得到相同的核心字段，也逐位一致地读回该crate的记录；SigMF { "v1.2.6" }元数据模式对该crate的元数据报告零个错误。容差在首次比较之前固定。不在声明范围之内：spectrum::synthesise_iq以及 [iq] 和 [recording] 与模型的比较（合成没有唯一正确的答案；周期线性调频会显示谱线、菲涅耳波纹和平滑模型所忽略的边缘拖尾，总功率在{ "2" } % 以内），整数到浮点的缩放约定（该crate除以{ "32767" }和{ "127" }，sigmf-python的自动缩放除以{ "2" }^{ "15" }和{ "2" }^{ "7" }，规范对此未作规定；比较使用原始码值），多通道记录，以及读取器拒绝的数据类型

seg-bf2d02d76762 = 基于JPL Standish开普勒根数的太阳系行星位置

seg-c9d3549045eb = 水星、金星、地月质心、地球、火星、木星和土星的日心位置取自Standish表{ "1" }（公元{ "1800" }年至{ "2050" }年），全部八大行星的日心位置取自表2a/2b（公元前{ "3000" }年至公元{ "3000" }年，含b、c、s、f平近点角项），逐步遵循JPL页面的算法，并按该页面的黄赤交角旋转到ICRF（国际天球参考系）；地球由Montenbruck & Gill月球级数和质量比从质心中分离。组合为ephem_provider::AnalyticSolarSystem，使任一天体都可相对任一其他天体取得，并可作为<c1/>类型运行

seg-24e058d4d094 = JPL Horizons DE441几何日心矢量（黄道和ICRF），在预先登记提交{ "80451866" }、8d38a28b和558cc807之后获取。判据：对每颗行星每个分量，RMS至多为《Explanatory Supplement》第3版表{ "8.10.1" }近似误差的1.0倍（地球取EMB行）；地球与EMB的分离直接对照DE441 { "399" }减{ "3" }检验，在1950-2050年的每个历元至多{ "0.3" }度和{ "8.1" } km（{ "8.1" } km的长度判据来自Kshana自身星历文档所述的月球级数精度，该文档引用Montenbruck和Gill，并未对照该书核对；实测的{ "6.09" } km与之接近）。选用RMS统计量时已知，先前一次27历元的比较在最大处达到名义值的1.87倍；单历元误差达到3.83倍（ICRF情形为3.87倍）。该《Supplement》并未把其数值定义为RMS。情形B对两侧都用测试中键入的IAU { "1976" }黄赤交角旋转，因此旋转并非对照自身检查。AnalyticSolarSystem的默认表选择未被演练（测试强制使用表{ "1" }）。来自表{ "1" }的天王星和海王星是另一条MODELLED行

seg-4ea08a296b37 = 在UTC历元上取自DE440星历核文件的太阳、月球、水星和金星位置（KernelEphemeris）

seg-8d47467c36e4 = 太阳、水星、金星、地球和月球彼此之间的几何位置（J2000/ICRF轴，米），由JPL DE440核文件通过ephem_provider::KernelEphemeris在UTC历元上给出：天体名称映射到NAIF编码，UTC经闰秒表，TT经两项TDB-TT级数转换到TDB，核文件由引擎自己的读取器读取。核文件中只以系统质心形式保存的天体（火星到海王星，de440s中的冥王星）会被拒绝，绝不替代。不依赖核文件的Standish行仍是浏览器和回退路径

seg-f0e09f78814a = Skyfield { "1.54" }（MIT），使用自己的闰秒表、自己的TDB-TT以及自己对同一份NAIF de440s.bsp的读取器（jplephem），作为独立程序在UTC历元上运行。在测试数据出现之前预先登记（0bfafe6d），网格由该提交的哈希播种，判据为每个分量{ "5e-5" } s乘以相对速度（引擎所述两项TDB-TT的精度），加上质心距离的{ "1e-13" }，再加{ "1e-5" } m。结果：全部{ "600" }个都在判据之内，最坏为判据的{ "0.66" }（快速天体对上为{ "2.96" } m，即TDB-TT级数自身的误差）。变异检验：把TT当作TDB使用，在判据的{ "33" }倍处失败。两侧都读取DE440：这验证的是提供器及其时间链，而不是DE440。不在声明范围之内：金星以外的行星作为天体（de440s只含其质心）、行星卫星，以及低于两项TDB-TT级数的精度（最快的天体对为几米）

seg-b59153f28d69 = 太阳系天体之间的光行时

seg-48ebe0983725 = 从任一天体到任一其他天体、在某历元接收的牛顿单程光行时，由射电测量不动点光行时求解器（radiometric::light_time_solution，发射器取其推迟位置）经solar_system::link_on在任一EphemerisProvider上求解；太阳系类型在日心坐标系中的解析太阳系上运行它（solar_system::link）。来自radiometric::two_way_range的双程距离和来自radiometric::shapiro_delay的太阳夏皮罗延迟分别报告，未与外部比较。<c1/>类型对每个天体相对一个观测者、对任何额外链路都会给出，<c2/>类型则对天体到地球的下行链路给出

seg-0685ab1ef2d3 = JPL Horizons DE441单程下行牛顿光行时LT（VEC_CORR=LT，观测者为地心），已预先登记（480037d3，修订54d5c86f只在首次获取未通过其{ "10" } m插值精度前提之后改动插值节点间距，早于任何光行时的比较），判据为每个光行时{ "1e-6" } s，求解器输入DE441质心位置，使推迟发射器的迭代可见（一阶迭代求解器最多偏差{ "0.1" } s）。在解析的Standish位置上，光行时只与这些位置一样好（见行星位置一行）；随附的链路把太阳视为惯性中心，这仍在该位置误差之内，但没有另行独立核对。two_way_range和shapiro_delay未与外部比较

seg-6e0b9687e8ee = 取自Standish表{ "1" }的天王星和海王星、冥王星，以及行星速度

seg-df3bf502dfe9 = 天王星和海王星的位置取自Standish表{ "1" }（在公元{ "1800" }年至{ "2050" }年内为默认），冥王星取自当前JPL页面不再列出的{ "1992" }年表{ "1" }行，以及每颗行星的日心速度：二体导数采用根数所蕴含的平均运动，再加上近日点、倾角和升交点变化率引起的椭圆转动

seg-f49245efe44f = 对照JPL Horizons DE441（同样的已提交测试数据）测得，但没有经过独立核对：对照DE441日心位置，天王星和海王星超出表{ "1" }所述数值最多{ "2.0" }倍和{ "5.2" }倍（海王星对照质心位置则达到该数值，这表明拟合并非日心的），该页面未给出冥王星的误差，速度也没有已发表的界限。表2a/2b对天王星和海王星达到其自身的数值，并已包含在已独立核对的行中

seg-a50be56f605a = 月球和七颗主要卫星（火卫一、火卫二、伽利略卫星、土卫六）的位置

seg-2cfbe5a1eece = 地心月球取自Montenbruck & Gill级数（其每世纪 -1.3972度的项已使其归算到J2000春分点），火卫一、火卫二、木卫一、木卫二、木卫三和木卫四的行星中心位置与速度取自JPL太阳系动力学平均根数，在各卫星的拉普拉斯平面中，平经度变化率取自IAU同步自转速率（该表给出的周期位数太少，无法保持相位），土卫六取自IAU自转模型（卫星位于沿体固x轴负方向、平均距离处），因为土卫六所印的拉普拉斯平面一行即使在其自身历元也不能复现Horizons

seg-6c81bd570fe5 = 对照JPL Horizons卫星星历（DE441、MAR099、JUP365、SAT441）测得，附有查询和检索日期，提交于tests/fixtures/solar_system/horizons_satellites_icrf.csv；平均根数和自转模型定位都没有已发表的精度，因此所固定的判据只用于捕捉回归，并不构成独立核对。平均根数略去了共振和太阳摄动，火卫一的长期加速度未建模

seg-8b8c8e28ece9 = 每个太阳系天体的物理常数，以及整个系统的报告

seg-d225a30de35c = Body新增水星、金星、木星、土星、天王星、海王星、冥王星、火卫一、火卫二、木卫一、木卫二、木卫三、木卫四和土卫六（引力参数、参考半径、已发表时的J2及其所参照的半径、IAU极点和本初子午线）、一个名称查找，以及一条BodyFacts记录（NAIF编码、类别、母天体、赤道半径和平均半径）；<c1/>类型对全部十八个天体报告这些，连同位置、光行时和一圈的轨道轨迹，每个天体标注为VALIDATED或MODELLED

seg-6adc29de51fd = 抄录已发表的常数，每一项在其定义处注明出处：引力参数取自JPL Horizons天体记录和JPL卫星物理参数表，半径取自JPL物理参数表（IAU WGCCRE { "2015" }），极点和本初子午线取自IAU制图坐标与自转要素工作组（均值，不含T变化率和周期项），J2取自Smith等{ "2012" }、Iess等{ "2018" }和{ "2019" }，以及Jacobson { "2009" }和{ "2014" }。检查了内部自洽（木星自转周期对照系统III速率，每个J2对照其参考半径），而没有对照外部参考基准。{ "0.30" }第{ "2" }轮：GM值采自gm_de440，火卫一和火卫二的根数采自pck00011，因此新增的十四个天体的{ "84" }个常数中，现在有{ "0" }个与NAIF不同（原为{ "12" }个），这是抄录检查，不计入。{ "0.36" }：新增十四个太阳系天体的IAU体固定姿态和GM已拆出，归入各自的VALIDATED行（“新增十四个太阳系天体的IAU天体姿态和引力参数”）；本行保留其余部分。J2和平均半径是引用的，没有经过独立核对；报告中的位置依赖各自的行；而报告中地球、月球和火星的prime_meridian_deg仍采用约定常数（与IAU_<BODY>相差最多{ "6.6e-3" }、{ "2.8e-2" }和{ "9.6e-4" } rad）。{ "0.30" }修订：火卫一GM { "7.087e5" } -> { "7.087546066894452e5" }，火卫二{ "9.62e4" } -> { "9.615569648120313e4" }，天王星{ "5.7939506103e15" } -> { "5.793951256527211e15" }，海王星{ "6.83509997e15" } -> { "6.835103145462294e15" }，冥王星{ "8.69326e11" } -> { "8.696138177608748e11" } m³/s²；火卫一赤道半径{ "13.1" } -> { "13.0" } km；prime_meridian_deg现包含二次项和周期项

seg-fa8a4b082cd5 = 新增十四个太阳系天体的IAU天体姿态和引力参数

seg-fc8d277aa2fd = Body::iau_rotation_et，即从J2000到水星、金星、木星、土星、天王星、海王星、冥王星、火卫一、火卫二、木卫一、木卫二、木卫三、木卫四和土卫六的IAU体固定坐标系的旋转，含pck00011中该天体所带的每一项世纪变化率、二次项和周期项，以及同样这十四个天体的引力参数字段mu。太阳、地球、月球和火星采用约定常数，归其他行负责，不在本行范围之内

seg-29bad4bd8e09 = NAIF SPICE Toolkit（CSPICE N0067，经spiceypy）在pck00011.tpc上的pxform('J2000', 'IAU_<BODY>')，这是同一IAU自转模型的独立实现，GM则取NAIF gm_de440.tpc，测试数据由不调用任何Kshana代码的独立程序生成（tests/fixtures/body_orientation_spice_oracle/，NOTICE.md）。预先登记154bc54（含c2434204最初的{ "1e-9" } rad判据），早于全新历元测试数据出现；全新的测试数据由独立重新生成，且逐字节一致。GM是对DE440的抄录，已对照已发布的文件检查，并非对GM的独立测定。结果：docs/design/evidence/mr08-body-orientation/RESULTS.md

seg-87ab655f8270 = 以本地星座和来自地球的深空链路，对任一太阳系天体周围进行定位

seg-d9b1b0ac97d3 = <c1/>类型：按名称选定的天体周围的轨道器或表面着陆器，利用来自该天体周围沃克导航星座的单程伪距（二体轨道，含该天体J2的长期漂移，用户钟差未知）以及可选的来自地球的无钟差双程测距进行导航，地球的方向和距离在每个历元取自解析星历；被该天体球体遮挡的视线和一个表面高度截止角；每个历元的仅星座GDOP和PDOP（orbit::dop），含地球行与不含地球行的形式位置不确定度，以及两种情形各自带随机种子的高斯-牛顿定位解（batch_ls::gauss_newton），连同天体到地球的光行时和往返时间

seg-3538c49df107 = 闭式解与自洽性：中继周期的开普勒第三定律，整个运行期间保持的轨道半径和表面半径，增加一个测量绝不会增大形式不确定度，以及带随机种子的误差与协方差相符。中继轨道忽略第三体（木星对木卫二周围中继卫星的引力未建模），噪声是所述水平的高斯噪声，测量模型是瞬时的，因此没有对照任何任务的导航数据做独立核对

seg-281b680a9897 = 沃克星座几何，以及GPS、Galileo和GLONASS已发表的标称轨位

seg-cba54289b732 = <c1/>类型的生成器：T/P/F约定下的沃克delta和star构型（节点间距360/P或180/P，面内间距{ "360" }·P/T，轨道面间相位偏移{ "360" }·F/T），以及由其已发表的标称根数建立的GPS基线和可扩展的24轨位、Galileo和GLONASS预设，按其文档所述的格林尼治时角放置在地固坐标系中

seg-bdf83007af50 = 已发表的机构文件：Galileo Open Service Service Definition Document第{ "1.1" }版（European GNSS Service Centre）表{ "1" }和表{ "23" }，2016-11-21 { "00" }:{ "00" } UTC的参考星座；GLONASS Interface Control Document第{ "5.1" }版（{ "2008" }）第{ "5.2" }节，节点经度和纬度幅角的轨位公式；GPS Standard Positioning Service Performance Standard第5版（{ "2020" }年4月）表3.2-1、3.2-2和3.2-3，包括星下点轨迹赤道穿越一列，它是对预设必须复现的地固几何的独立陈述。验证生成器和抄录；北斗中圆轨道的相位和倾斜地球同步轨道的节点没有公布，不在范围之内

seg-0f1d49ab5d51 = GPS基线星座的全球精度因子

seg-83775b77f5ca = <c1/>覆盖引擎在GPS基线24轨位预设上，按GPS Standard Positioning Service Performance Standard（SPS PS）附录B的条件（一个恒星日，{ "287" }个五分钟步长，{ "4" } x { "4" }度的全球网格按纬度余弦加权，全部可见，{ "5" }度截止角，一个接收机钟）：全球HDOP分布、PDOP中位数、PDOP不大于6的可用性，分别给出全球和最差站点的结果

seg-6fb3c2028c4a = GPS SPS PS第5版（{ "2020" }年4月）附录B第B.3.2.2和B.3.2.3节，满星座基线24轨位星座已发表的全球平均HDOP分布（中位数{ "0.94" }，{ "90" } % 为{ "1.16" }，{ "95" } % 为{ "1.25" }，{ "98" } % 为{ "1.37" }，均值{ "0.96" }），表3.8-1（PDOP可用性）和表B.3-1（降级星座的集合PDOP，仅用作上界），外加一个对单个历元手工推导的闭式解。满星座的VDOP和PDOP分布只以图的形式发表，因此PDOP采用单侧固定；最差的时空点（此处HDOP { "2.40" }和VDOP { "5.22" }，已发表为{ "2.49" }和{ "5.43" }）取决于网格，只报告，不固定

seg-7d4d7200cbca = 围绕任一中心天体、面向大规模任意多星座设计的覆盖和精度因子地图

seg-b78b79e9fae4 = <c1/>类型在两个固定算例之外：显式设计和多壳层设计，每次运行含多个星座且每个星座一个接收机钟，由天体常数给出的地球、月球和火星，北斗预设（已建模中圆轨道相位和{ "118" }度E的倾斜地球同步轨道穿越），每个单元的可见卫星数、GDOP、PDOP、HDOP、VDOP和可用性，降采样的星下点轨迹，以及一个星下点纬度可见性预筛选，可在不到一秒内对{ "10" }度网格运行{ "5" } 000颗卫星的设计

seg-2c0f28426ab9 = 内部自洽：暴力仰角扫描、手算和orbit::dop的归约，以及闭式的沃克和地球同步几何。二体轨道，可选长期J2，球形天体且局部垂线沿半径方向，仅几何可见性（不含信号功率、卫星健康状态、地形或第三体摄动），而且各系统之间的相对相位取自不同的参考历元，因此它不是任何日期的快照。{ "0.30" }审查，一项发现（仍为MODELLED）：这些预设在{ "100" } % 时达到已发表的单侧DOP可用性下限（北斗OS Performance Standard { "3.0" }，Galileo OS SDD），但在一份临时副本中把引擎的PDOP加倍后它们仍然达到（最差点{ "99.36" } %），因此这些下限连本行所计算的量中{ "100" } % 的误差都无法检出；运行之后再收紧它们，就成了事后容差。晋升需要在相同几何上对DOP值作双侧比较，并事先设定容差。{ "0.30" }第{ "2" }轮（tests/coverage_dop_full_oracle.rs，预先登记add671d6），一项发现（仍为MODELLED）：Orekit { "12.2" }的位置、仰角、方位角和星下点轨迹，加上gnss_lib_py { "1.0.4" }的GDOP/PDOP/HDOP/VDOP（共用一个钟）以及一个numpy求逆（每个星座一个钟），在Galileo、GPS、北斗、Galileo+GPS（各一个钟）以及一个1584颗卫星的地球设计上，每一项判据都一致（DOP相对误差在{ "2e-14" }以内，定位解、可用性和可见数完全一致）。在月球和火星设计上，根数、位置、可见性和轨迹一致，但在最大PDOP为{ "1434" }或更大的单元中，DOP超出事先设定的{ "1e-9" }相对判据（最多{ "8e-6" }），并且有{ "4" }个单元在数值奇异的几何上相差一个定位历元（引擎主元{ "1e-10" }对numpy秩），因此本行没有经过独立核对。{ "0.30" }修订：TDOP/GDOP参考钟现为可见的编号最小的星座（constellation-multi-gnss-coverage全球GDOP最大值{ "2.2236" } -> { "2.1205" }，均值{ "1.122" } -> { "1.131" }），各星座的可见数按整数求和

seg-278c77438493 = 在同一条共享时间线上跨场景类型串联的任务

seg-3dcfb26f6234 = <c1/>类型的各阶段：每个阶段通过run_toml运行一个或多个现有类型的场景，按各类型预设或显式结果路径把其输出读入具名通道（时钟钟差与保护间隔、平均有效载噪密度比与跟踪下限、垂直保护级与告警限值、位置误差、跟踪的卫星数、告警标志），在阶段起点放置并保持到共同网格上，带有阶段边界和事件；状态通过carry（通道从上一阶段的终值继续）、handoff（上一阶段的某个数写入下一个场景）和end_at（阶段在某次运行算出的时刻结束，例如欺骗干扰监测的检测时间）传递；以及一个测评活动哈希，外加对每个成员结果的摘要

seg-fd018ef7bc3b = 与相同类型的独立运行比对的组合恒等式：单阶段的测评活动逐位复现独立运行的输出，携带的偏移等于上一次运行自己的最后一个采样，由end_at结束的阶段，其长度恰好等于该次运行的检测时间。跨阶段边界的加性携带和零阶保持是建模选择，各阶段的质量取决于运行它的类型；没有任何串联任务对照过实测任务

seg-ad6105af464c = 针对任一场景类型的参数扫描和带随机种子的蒙特卡罗集合

seg-95921611839e = <c1/>类型的sweep（一至三个任一类型的点分键，取通用扫描的轴值，可在每个节点上选择性地加一个集合）和monte_carlo部分：第k次实现以base_seed + k运行；每个指标报告均值、标准差、最近秩法的第5/50/95百分位数，以及对均值的固定随机种子百分位自助法{ "95" }% 置信区间（inertial::metric_stat）；指标单位取自被扫描类型自己的units块

seg-03d15c27b3b9 = 白频率噪声下相位随机游走的闭式解，方差q_wf tau（NIST Technical Note { "1337" }），用于统计机制；以及与独立运行逐字节相等，用于随机种子。它检查的是引擎自身时钟模型上的集合算术，而不是外部数据集

seg-24327a0ed82e = 共享条件下的多个场景，附合并摘要

seg-5833fb3b06e3 = <c1/>类型的compose部分：具名共享值（例如某个干扰源的功率和位置）写入各成员所绑定的键，运行每个成员，每个指标给出各成员中的最小值、最大值和平均值，并指明对应的成员；各成员的指标单位必须一致

seg-67ffd6684b1c = 与独立运行比对的组合恒等式。共享条件的算术只是记账；物理属于各成员类型，各有自己的行

seg-0bc866720bde = 在测评活动参数上对一个指标做有界优化

seg-f9bdb89c2b4f = <c1/>类型的optimize部分（CAP-32）：一至三个点分场景键，在lin或log尺度上限定于 [lo, hi]，一个按结果路径读取的指标，目标为minimize、maximize或target；方法为grid（扫描的轴值）或在归一化坐标下的确定性Nelder-Mead单纯形，带箱形投影和标准系数；缺失或非有限的指标记为最差并保留在trace中；runs > { "1" }时，指标为各共同随机种子上的均值；每次评估都是对所指名类型的一次真实运行，列于trace并计入可复现性摘要

seg-e3a2f80b04dc = 仅限内部：链路方程的精确 -20 log10(range) 闭式解、对同一类型的独立暴力网格，以及Rosenbrock函数。第{ "1" }轮的1-D判据NOT MET（预先登记的区间排除了{ "3" } dB的解；优化器停在边界上），已记录于docs/design/evidence/cap32-optimize/RESULTS.md，未重新评分。最优值只在该区间和起点的局部范围内成立；不作全局最优的声明

seg-b9b1637d326c = 任意测距信号的带限闭式解：带内功率和早迟码跟踪抖动对照已发表的数值，并交叉检查Gabor带宽和偏移谱分离

seg-6cfdc433b120 = navsignal：正弦积分（sine_integral），BPSK-R双边频带内功率占比的闭式解（bpsk_power_in_band_closed_form），带限BPSK Gabor带宽的闭式解（bpsk_gabor_bandwidth_closed_form_hz），依Betz与Kolodziejski { "2009" }的、适用于任意单位面积谱的带限相干与非相干早迟延迟锁定环抖动（dll_jitter_bandlimited_s）及其间距趋零的Gabor界（dll_jitter_small_spacing_limit_s），偏移BPSK谱分离系数的闭式解（bpsk_offset_ssc_closed_form），Galileo E5 AltBOC({ "15,10" }) 谱（altboc_15_10_psd）和一个调制标签解析器（parse_modulation）；由<c1/>类型用于每一种信号设计

seg-15d8c44be46f = 由外部固定：{ "90.3" } % 的主瓣功率、所述工作点的相干早迟抖动、正弦积分表值，以及零偏移处BPSK自谱分离系数2/({ "3" } R_c)。仅为内部交叉检查，不是外部验证：带限BPSK Gabor带宽闭式解及其渐近线，以及非零偏移处的偏移BPSK谱分离系数，两者均在此推导并与求积核对。已发表的闭式解：BPSK-R的sinc平方谱及其{ "90" } % 的主瓣功率（Kaplan & Hegarty，Understanding GPS/GNSS，第3版）；相干早迟码跟踪抖动sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" }（Kaplan & Hegarty，第{ "8" }节），以及带限推广及其Gabor带宽极限（Betz & Kolodziejski，Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I，IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" })，{ "2009" }）；Abramowitz与Stegun的正弦积分表（表{ "5.1" }）；谱分离系数作为平方自相关函数的傅里叶变换（Betz { "2001" }）。AltBOC谱只检查了单位面积和瓣的位置（Galileo Open Service Signal-in-Space Interface Control Document的表达式积分为{ "8" }，并除以该值）。

seg-def449efa852 = 低地球轨道导航卫星的最大多普勒，用以确定捕获搜索的规模

seg-2ff7cc7a8846 = leo_signal::max_doppler_hz：圆轨道在截止仰角处过顶时卫星的最大多普勒，v R_E cos(el) / (R_E + h) 乘以f / c，取自每个预设自己的载波和轨道高度；<c1/>类型再加上振荡器项和用户项，并将其转换为多普勒格

seg-c26e0c7c6821 = 已发表的数值：Xona Pulsar X1最大多普勒{ "32" }至{ "34" } kHz（Leclère、Marathe和Reid，ION GNSS+ { "2025" }，https://arxiv.org/abs/2509.19551）；Iridium多普勒最高 +/-36 kHz（Resilient Navigation and Timing Foundation，Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites）。地球自转未计入，这会使该数值最多变动约{ "2.3" } kHz；不计入它，两个已发表的数值也都达到。

seg-652e28dfa10f = 低地球轨道定位、导航与授时信号设计：码跟踪、捕获、GNSS兼容性，以及适用于任何系统的频段权衡

seg-c2b9c8e4a364 = 带有设计信号和各频段干扰源的多频段频谱瀑布图（UHF、L、S、C）

seg-609df4e0a085 = <c1/>类型扩展到L波段之外：频段由预设信号设计给出（绘出每个分量，带限于发射带宽，C/N0和J/S以被跟踪分量为参照），或由自定义载波和调制给出；在同一时间线和色标上、针对任意频率范围的额外瀑布图面板；除CW、窄带、线性调频和匹配噪声外，还有宽带（阻塞式）干扰源；由未改动的谱分离系数链给出各频段J/S和有效C/N0

seg-a3b398f66ad3 = 归约到现有的频谱链和干扰类型的抗干扰方程（单分量频段给出与扩展之前相同的数值），以及已独立核对各行的信号谱。干扰源功率、时间线、前端带宽和设计信号都是输入，设计信号在其发射频段处截断（无带外辐射）。

seg-f92d6cbc58d4 = LEO-PNT链路所用任一频段的降雨比衰减系数

seg-96b6a118d374 = ITU-R（国际电信联盟无线电通信部门）P.838-3公式（{ "1" }）至（{ "5" }）：k_H、alpha_H、k_V、alpha_V取自表{ "1" }至{ "4" }的曲线拟合，随路径和极化而变的 (k, alpha)，以及比衰减k R^alpha；由<c1/>类型的降雨项使用

seg-5c256ff404b6 = ITU-R P.838-3（03/2005）表{ "5" }，建议书自己列表给出的k_H、alpha_H、k_V、alpha_V，已提交于tests/fixtures/leo_link/p838_3_table5.csv，附PDF网址和检索日期。该表按其印出的位数舍入，因此判据即该舍入

seg-f4a311f936de = 地空链路上的长期斜路径降雨衰减

seg-2b2dba8bf5a7 = ITU-R P.618-14第{ "2.2.1.1" }节步骤{ "2" }至{ "10" }（降雨高度以下的斜路径和水平路径，水平缩减和垂直调整因子，A0.01及其换算到平均年的{ "0.001" } % 至{ "5" } %），降雨高度（P.839）和R0.01（P.837）作为输入，因为引擎不带这两种数字地图；由<c1/>类型按频段和历元应用

seg-325d1bb9c26d = ITU-R第{ "3" }研究组的P.618-14验证算例文件CG-3M3J-13-ValEx-Rev8.3.0，按ITU-Rpy验证页面所列，每个站点的P.839-4降雨高度取自同一算例；已提交于tests/fixtures/leo_link/p618_14_rain_attenuation.csv，附网址和检索日期。验证的是给定h_R和R0.01时的流程，而不是地图

seg-6b51ec84bdce = 地空链路上的对流层幅度闪烁

seg-869894dec004 = ITU-R P.618-14第{ "2.4.1" }节步骤{ "3" }至{ "9" }（由N_wet得出参考sigma，有效路径长度，天线平均因子，{ "0.01" } % 至{ "50" } % 时间的衰落深度），N_wet为输入，或由ITU-R P.453-14的表达式从温度、湿度和气压算出；低于{ "4" } GHz时，<c1/>类型把该值标记为外推

seg-7fc4a1e7960a = ITU-R第{ "3" }研究组针对P.618-14闪烁的验证算例（CG-3M3J-13-ValEx-Rev8.3.0），每个站点的P.453-14 N_wet取自同一算例；已提交于tests/fixtures/leo_link/p618_14_scintillation.csv，附网址和检索日期。由温度和湿度得出湿折射率的表达式不在本行范围之内

seg-e0d40cf4ea79 = 室内LEO-PNT用户的建筑物穿透损耗

seg-4f06274e38ec = ITU-R P.2109-2附件{ "1" }公式（{ "1" }）至（{ "10" }）及表{ "1" }：传统建筑和热效率建筑的损耗，在立面处路径仰角下，以概率P不被超过，{ "80" } MHz至{ "100" } GHz；由<c1/>类型按频段和历元应用于室内用户（UHF室内情形）

seg-99c648f9c6eb = ITU-R第{ "3" }研究组的Clutter and BEL验证工作簿数值，如参考MATLAB实现的验证脚本（github.com/eeveetza/p2109）所抄录，已提交于tests/fixtures/leo_link/p2109_bel.csv，附网址和检索日期。该工作簿印出三位小数

seg-8c5e291c8ff8 = 各频段的一阶电离层延迟、无电离层组合和自由空间损耗

seg-89df726127f9 = 群延迟{ "40.3" } STEC/f^{ "2" }（每个频段）；任一频段对的无电离层系数f1^2/(f1^{ "2" } - f2^{ "2" }) 和 -f2^2/(f1^{ "2" } - f2^{ "2" }) 以及噪声放大sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" })；linkbudget::free_space_loss_db的自由空间损耗{ "20" } log10({ "4" } pi R f/c)，取其千米-兆赫形式

seg-9bf00f744174 = IS-GPS-200第{ "20.3.3.3.3.2" }节，其中给出由一阶1/f^{ "2" }缩放得出的L1/L2群延迟比gamma = (77/60)^{ "2" }，以及Friis传输公式（Proc. IRE，{ "1946" }）。验证的是缩放规律，而不是斜向TEC

seg-c584a867fcda = 静止用户在LEO或MEO轨道上所见的最大多普勒

seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate：在圆轨道上，对每一个轨道位置和卫星地平线上的每一个用户作搜索，计入地球自转，求最大距离变化率，另加轨道速度和最大地固卫星速度；由<c1/>类型按频段报告为多普勒包络，并用作其低能耗模型的冷启动搜索窗口

seg-4abd3afebad2 = Leclere、Marathe和Reid，Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design，ION GNSS+ { "2025" }，arXiv { "2509.19551" }，表{ "1" }（{ "6371" } km球面上的静止接收机，地球自转是仅有的其他效应）：L1上为{ "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz。涵盖圆形二体轨道

seg-d9eb3e7e69c2 = LEO-PNT过境及其各频段链路预算，对照所见的MEO GNSS卫星

seg-d986e44443dd = <c1/>类型：卫星来自设计的过境、根数、经SGP4的TLE，或来自constellation-design的沃克星座；每个频段和历元给出观测角、距离、闭式距离变化率和距离加速度（每次运行都对照中心差分检查并报告）、自由空间损耗、带等通量、高斯或平坦方向图的EIRP、贴片、半球或全向用户天线、ITU-R P.676-10附件{ "2" }气体衰减、P.618降雨和闪烁、P.2109建筑物穿透损耗、极化失配、系统噪声温度、C/N0、多普勒和多普勒变化率，以及由Klobuchar或垂直TEC斜向TEC按卫星以下的查普曼分数缩放得出的一阶延迟；过境峰值处带码噪声的无电离层频率对；Galileo或GPS载波，取自其接口文档的接收功率，经同一接收机处理

seg-c558a6519038 = 闭式解与自洽性：距离变化率和距离加速度恒等式对照数值导数，等通量增益抵消距离增长，教科书的极化损耗极限，以及定性的LEO对GNSS观测（持续数分钟的钟形过境，峰值比平坦的44-51 dB-Hz GNSS载波高几dB）。EIRP和方向图是由已发表的接收功率换算成的EIRP或具代表性的选择，气体项是已被取代的P.676-10简化方法，也没有任何东西与实测的LEO C/N0比较

seg-95a077a980b6 = 带有所述来源的具名LEO-PNT系统预设，以及一个与系统无关的引擎

seg-399dc53ceafb = 抄录所引用的公开数值并做一致性检查：由已发表的最小接收功率设定的EIRP，在平坦方向图下预测已发表的最大值，误差在{ "0.5" } dB以内。这是对距离跨度的检查，不是对任何卫星天线的独立核对；具代表性的预设不对真实系统作任何声明

seg-a39f34973373 = 低能耗定位：首次定位时间和每次定位能耗对占空比

seg-f3b9b669a76f = leo_link::energy和<c1/>类型的 [iot] 部分：受多普勒变化率限制的相干积分，到检测门限的平方律非相干累加，在轨道静止用户包络上的多普勒格搜索（冷启动）或辅助窗口（热启动），并行或串行码搜索，冷启动时的导航电文时间，各定位间隔下每次定位的能耗和电池寿命，针对每个LEO频段和GNSS信号

seg-a5fa1ef1be9b = 对所述设计模型的内部自洽检查：每个功率、门限和搜索选择都是输入，该模型忽略比特边沿模糊、漏检和重新捕获。没有与实测接收机比较

seg-7e94f8b38cff = 任意轨道高度的全球平均空间信号测距误差权重

seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights：径向权重w_R和横向权重的平方w_AC^{ "2" }，分别为视线天底角的cos^{ "2" }和二分之一sin^{ "2" }在截止仰角之上可见地球球冠上均匀分布的用户上的平均值，适用于任意轨道半径，由辛普森积分得出；用于leo-navmsg的每一个SISRE数值（在{ "510" } km处，w_R { "0.46" }，w_AC^{ "2" }为1/2.5）

seg-b9b5fe9d3b25 = Montenbruck、Steigenberger和Hauschild（{ "2018" }）已发表的SISRE加权因子表，Multi-GNSS signal-in-space range error assessment - Methodology and results，Advances in Space Research { "61" }({ "12" }):3020-3038，doi 10.1016/j.asr.2018.03.041：GPS { "0.98" }和1/49，GLONASS { "0.98" }和1/45，Galileo { "0.98" }和1/61，北斗MEO { "0.98" }和1/54，北斗IGSO/GEO { "0.99" }和1/126。在LEO半径处计算同一平均，得出LEO权重；没有固定已发表的LEO表，因此LEO数值是应用了经独立核对的方法，本身并未另行独立核对

seg-3cbb8b6afe3c = 以Galileo ICD广播星历用户算法作为LEO导航电文的基础

seg-88efbce1f836 = leo_navmsg::elements::kepler_point：Galileo OS SIS ICD的开普勒求值（开普勒方程、二阶谐波改正、地固节点），与引擎的RINEX求值器分开编写，返回位置以及构建沿迹/横迹/径向改正坐标系所用的纬度幅角、倾角和节点，以及Liu等{ "2025" }的扩展项

seg-6a90728fcea9 = RTKLIB 2.4.2-p13 eph2pos的ECEF位置（同一ICD算法的独立实现），针对2024-09-10的真实BKG/IGS广播记录，两者都连同出处提交于tests/fixtures/rinex_sp3_interop（NOTICE、rinex_ecef_reference.txt、brdc_multignss_slice.rnx）。这验证了开普勒用户算法；在其上叠加的沿迹/横迹/径向改正由各自的行覆盖，Liu项由Liu等{ "2025" } 22参数一行覆盖

seg-d65102fd4a1d = LEO导航电文的CRC-24Q帧校验

seg-aed568016867 = leo_navmsg::codec::crc24q：生成多项式0x1864CFB，初值{ "0" }，无反射，无最终异或，Kshana LEO帧对其之前的每个字节都带有该校验

seg-18c79d18e4e4 = 这些参数的CRC目录校验值（reveng.sourceforge.io CRC目录，CRC-24/LTE-A：宽度{ "24" }，poly 0x864CFB，init { "0" }，check 0xCDE703），它们即RTCM { "10403" }和Galileo OS SIS ICD的CRC-24Q参数，以及RTCM { "10403" }中印出的消息类型{ "1005" }示例帧

seg-82b9b0f7b07c = LEO广播星历拟合器，以及空间信号测距误差随拟合区间和更新周期的变化

seg-8c7065aa22bd = <c1/>类型的拟合器和权衡：真值轨道按所选阶数的带谐J2-J6或EGM2008引力和大气阻力积分，并带一个带随机种子的自由或受控时钟；对非奇异根数带弱先验，用Levenberg-Marquardt拟合Galileo开普勒参数集，再用线性最小二乘得到沿迹、横迹和径向改正多项式；钟差多项式在扣除用户相对论项之后拟合；SISRE（仅轨道和含钟差）在以拟合窗口居中的使用期上，随拟合区间和更新周期变化。已独立核对的部分：16参数开普勒拟合及其仅轨道SISRE随拟合区间的变化，针对真实精密轨道；以及积分得到的J2-J6/EGM2008({ "20" }, { "70" })/大气阻力真值轨道，对照Orekit { "12.2" }，在{ "6" } h内相差{ "4.6" } mm以内（判据{ "2" } cm，同样的密度输入）；改正多项式、钟差拟合（带随机种子的自由或受控时钟）和更新周期权衡仍属模型计算

seg-7dfbc8297444 = 以真实的精密科学轨道作为真值（TU Graz IfG/ITSG业务化简化动力学轨道，凡注明出处即可自由使用；SHA-256值见测试数据NOTICE），用16参数集在{ "20" }和{ "30" } min弧段上拟合，并对照Liu等{ "2025" }（Remote Sensing { "17" }({ "16" }):{ "2894" }，CC BY { "4.0" }）针对相同卫星和相同日期公布的统计：沿迹、横迹和径向RMS各在1.5倍以内（实测{ "0.804" }至{ "1.087" }），SISRE在1.5倍以内（实测{ "0.716" }至{ "0.809" }），SISRE权重与其表{ "2" }相差{ "0.005" }以内（实测{ "0.0007" }）；容差在比较之前固定。逐分量的门限使该测试有了约束力：把倾角变化率置零，每个SISRE比值仍在1.5倍以内，却通不过横迹门限。统一的{ "0.72" }至{ "0.81" } SISRE比值出自该论文：其印出的SISRE值使用的是表{ "2" }中未平方的权重，而不是其自己的式{ "9" }，Kshana则遵循后者（Montenbruck等{ "2018" }）。积分得到的真值轨道（带谐J2-J6、{ "20" }和{ "70" }阶的EGM2008、大气阻力）与Orekit { "12.2" }（CS GROUP，Apache-2.0）和Hipparchus { "3.1" }一致，二者由同一初始状态、在同一坐标系、用同一密度输入外推，在{ "6" } h内相差{ "4.55" } mm以内（判据{ "0.02" } m，运行之前固定，预先登记65e4d46c）。不在声明范围之内：改正多项式、钟差拟合和更新周期权衡，它们保留内部检查（16参数集把二体真值恢复到{ "1" } mm以下，以及对GRACE-FO及其CLK1B钟差所导出电文做的内部numpy交叉检查，该检查由本项目编写并运行，不是独立参考基准）

seg-8121e7db3db3 = LEO导航电文在过境中途更新，并在切换处做连续性检查

seg-34c310d85c42 = <c1/>中途更新分析：在搜索时间范围内，用户上空最高的一次过境，按全局时间表发出的、使用期以拟合窗口居中的电文，以及在每次切换处的3D位置跳变、钟差跳变、用户伪距跳变、任一可见视线上的最大跳变（天底锥上的闭式解）、前后的距离误差，以及对照某个阈值的PASS/FAIL

seg-418f2cd21141 = 内部自洽（跳变恒等式和锥界对照暴力采样）。阈值是输入；没有固定任何已发表的LEO连续性要求

seg-7635a8339e78 = LEO导航电文的文档化二进制编码，附量化误差预算

seg-e4d9b16a2dc4 = leo_navmsg::codec：Kshana自己的帧（前导码、版本、模型、长度、载荷、CRC-24Q），涵盖四种星历模型、钟差多项式、SVID、星历数据龄期、频段、健康状态、一组Klobuchar参数、NeQuick-G系数和UTC参数，每个字段都有所述的宽度和步长（field_table），量化时超出范围则拒绝，另有一份预算，给出每个字段改变半个步长时在有效期内引起的最大位置和钟差变化

seg-4261a9fac5d9 = 往返恒等式和预算本身。该格式是Kshana自己的，仿照已发表的电文成分和Galileo ICD的字段集；它不是Celeste或任何其他系统的比特布局（均未公开），因此没有可供核对的外部布局

seg-17ca41d7fd71 = LEO导航电文的RINEX-4风格和CSV导出

seg-185e12ccef0d = leo_navmsg::text：RINEX-4风格的块（> EPH记录头，带三个钟差项的卫星和历元行，D19.12广播轨道行），系统字母为L，记录类型为KP16、KRAC、LU22和APOL，每个头部都标注其为Kshana扩展，不属于RINEX { "4.02" }；以及带默认列模式和预设模式的CSV表，各有一个导入器

seg-5cc5b6382437 = 往返和日历算术。RINEX { "4.02" }没有定义LEO导航记录（IGS RINEX { "4.02" }），因此该布局是一种文档化的扩展，引用arXiv { "2401.17767" }作为在先工作；没有可供核对的外部读取器

seg-ff15935ba1b3 = Liu等{ "2025" } 22参数LEO星历模型及其在真实精密轨道上的拟合

seg-6af1b6f3bbd4 = leo_navmsg::elements::EphemerisModel的Liu22变体，由kepler_point配合Liu22Extra求值：16参数集，外加半长轴变化率a_dot、以n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk形式进入的平均运动变化率n_dot（抄自论文式{ "1" }；拟合比较不依赖该尺度约定，因此所发送的nDot值的含义在此并未独立核对），以及对未改正纬度幅角的每圈一次和每圈三次的半径谐波Crs1、Crc1、Crs3、Crc3。其由leo_navmsg::fit::fit_message做的拟合采用论文第{ "2.3" }节的起点和估计器（每一项改正都从零开始；无先验的普通最小二乘；论文的100次迭代上限），但按Kshana的参数收敛规则停止（每一步都低于其形式sigma的{ "1e-3" }），而不是按论文的RMS变化低于{ "0.1" } mm的规则。在一条列表化精密轨道的{ "20" }和{ "30" }分钟弧段上拟合

seg-90768b99ab5f = 实测：TU Graz IfG/ITSG业务化简化动力学轨道（凡注明出处即可自由使用；SHA-256值见测试数据NOTICE）中GRACE-A、GRACE-C、Sentinel-2A和Sentinel-6A的轨道作为真值，在{ "20" }和{ "30" } min弧段上拟合，并与Liu、Su、Xie、Zhou和Qu（{ "2025" }）的表{ "4" }、{ "5" }、{ "6" }和{ "8" }的22参数各行（a_dot、n_dot、Crs3、Crc3、Crs1、Crc1）比较，Remote Sensing { "17" }({ "16" }):{ "2894" }，doi 10.3390/rs17162894（CC BY { "4.0" }；数值为引用，未随附）。判据在首次比较之前固定：对每颗卫星和两种弧长，沿迹、横迹和径向RMS各在1.5倍以内（双侧），SISRE在1.5倍以内。第2轮重新运行已在引擎改动之前、保留轨道获取之前预先登记（aa559785）：论文式{ "1" }和第{ "2.3" }节的拟合，外加每颗卫星两个新的保留日，对照相同的印出数值。实测：论文各日的比值均为{ "0.755" }至{ "1.138" }，各保留日的比值均为{ "0.683" }至{ "1.186" }。披露：首次运行时{ "20" } min沿迹比值{ "1.71" }（Sentinel-2A）和{ "1.86" }（Sentinel-6A）在重新运行之前就已知。保留日SISRE比值最低的接近{ "0.667" }下界，因为论文印出的SISRE使用的是表{ "2" }中未平方的权重（见16参数拟合器一行）。预先登记误述了论文的停止规则（论文在RMS变化低于{ "0.1" } mm时停止）；预先登记的参数收敛规则得以保留。变异检验：恢复以零为中心的先验，则Sentinel-6A { "20" } min沿迹为{ "1.08" }，对照{ "0.70" } cm（{ "1.54" }），未通过。审阅者探查：0.30之前的约定（n_dot乘以1/2的因子）使每个数值保持不变，因此该比较约束的是22参数模型的函数空间及其拟合质量，而不是n_dot的约定。不在声明范围之内：ATOMIC ECEF多项式和合成的五高度模型比较表，它们有各自的MODELLED行

seg-e79047fc95af = ATOMIC零钟差ECEF多项式，以及合成的五高度LEO模型比较

seg-e261843e35b1 = leo_navmsg::elements::EphemerisModel的EcefPoly变体：每轴一个ECEF多项式，没有钟差项，相对论项取自 -2 r.v/c^{ "2" }，对照受控时钟打分。还有模型比较分析（liu_comparison，作用于LIU2025_TABLE），它在论文的五个高度上，对Kshana积分轨道的20分钟弧段拟合22参数模型，并把结果印在已发表的SISRE旁边

seg-a3b92fdcc591 = 取自InsideGNSS的ATOMIC模型事实（6阶多项式，约一分钟有效期，{ "30" } s刷新，钟差受控，{ "24" } cm钟差误差）。这些是描述性事实，没有可供比较的已发表数值。五高度表把Liu等{ "2025" }的SISRE（在{ "320" }、{ "475" }、{ "786" }、{ "966" }和{ "1336" } km、20分钟弧段上分别为{ "8.88" }、{ "6.21" }、{ "2.87" }、{ "2.11" }和{ "0.75" } cm）印在Kshana对其自身积分轨道的拟合（{ "4.25" }、{ "2.87" }、{ "2.20" }、{ "1.25" }和{ "0.51" } cm；比值{ "0.46" }至{ "0.77" }）旁边，未固定，因为论文拟合的是真实精密轨道，真值不同。22参数模型及其拟合本身已对照真实轨道独立核对，见Liu等{ "2025" } 22参数LEO星历模型及其在真实精密轨道上的拟合一行。{ "0.30" }修订：表中数值随论文约定的拟合而变动（GRACE-A { "5.40" } -> { "4.25" } cm，GRACE-C { "4.12" } -> { "2.87" }，Sentinel-2A { "2.95" } -> { "2.20" }，HY-2A { "2.38" } -> { "1.25" }，Sentinel-6A { "0.70" } -> { "0.51" }）

seg-7a9fca5166d4 = LEO导航电文的单频电离层和UTC服务

seg-bc73bfeca68e = leo_navmsg::services：任一载波的Klobuchar广播延迟（引擎的L1模型按 (f_L1/f)^{ "2" }缩放），NeQuick-G有效电离水平Az = ai0 + ai1 mu + ai2 mu^{ "2" }，含全零规则和 [{ "0" }, { "400" }] sfu规则，以及系统时间到UTC，含ICD的三种闰秒情形

seg-84500ea94d49 = GNSSTk { "15.3.1" }（ARL:UT，LGPL-3.0，提交55ea3344，经测试框架作为独立程序运行；未随附任何GNSSTk代码）：L1、L2和L5上KlobucharIonoNavData的getIonoCorr，NeQuickIonoNavData的getEffIonoLevel（对Az，含全零规则和 [{ "0" }, { "400" }] sfu规则），以及用于UTC漂移的GPSLNavTimeOffset的getOffset，分别在{ "1e-3" } m、{ "1e-6" } sfu和{ "1e-9" } s以内；以及经pyerfa { "2.0.1.5" }（BSD-3）使用的ERFA，它由IERS闰秒表推出UTC，用于ICD的三种闰秒情形，涵盖真实的2015-06-30和2016-12-31闰秒，包括{ "23" }:{ "59" }:{ "60" }读数，在{ "1e-9" } s以内（GNSSTk没有实现ICD情形 (b) 的日长规则，因此那里没有使用它，如预先登记所写）。输入是真实的IGS BRDC头部系数。已预先登记（6a66994b；修订88807a7e在比较任何Kshana数值之前，提交了闰秒网格的一个{ "21" } 602行子集）。NeQuick电子密度积分未实现，也没有对在电离层内部飞行的LEO卫星做任何改正

seg-0af8030f4d21 = 地面接收机必须应对的、来自LEO导航卫星的多普勒

seg-9714103964d6 = 地固位置和速度来自带长期J2漂移和地球自转的二体轨道的卫星的精确距离变化率（leo_fusion::geom::EarthOrbit::state，速度为位置的精确时间导数），在某一载波上换算为多普勒；在截止仰角之上，一个窗口内最大的绝对多普勒、多普勒变化率和加加速度（leo_fusion::doppler::doppler_envelope），由<c1/>类型在doppler模式下按每个LEO系统报告

seg-ebf6cee8ec4c = 由所述轨道和载波复现的已发表数值：Iridium多普勒最高正负{ "36" } kHz（Resilient Navigation and Timing Foundation，Recent PNT improvements and test results based on LEO satellites），以及Xona Pulsar X1最大多普勒{ "32" }至{ "34" } kHz（Leclère、Marathe和Reid，ION GNSS+ { "2025" }，arXiv:{ "2509.19551" }）。Iridium的数值是取整的上界，因此判据为{ "5" }%。多普勒变化率和加加速度已报告，但没有独立核对：Pulsar X1的模型过顶加加速度约为{ "1.0" } Hz/s^{ "2" }，而已发表的为{ "1.26" }

seg-d2e18c8bdc14 = 基于LEO多普勒的定位，单星和多星，带钟漂和速度状态

seg-de6cb3c06490 = 以距离变化率为基础、带解析偏导数的批量高斯-牛顿定位（d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho，d/dv = -u，d/d drift = { "1" }），可选恒定用户速度，对地表用户的高度伪测量，带阻尼的步长；真值处的形式协方差；沿迹、横迹和垂直方向的投影；单次过境精度随用户横迹偏移的变化；最接近时刻。<c1/>类型的doppler模式增加误差随窗口长度的变化，以及仅多普勒的机会信号模式（starlink-sop预设）

seg-84e2eb636579 = 内部自洽：无噪声恢复，数值微分的运动学恒等式rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho，最接近时刻的多普勒为零，单次过境的镜像解，以及带随机种子的误差对照形式协方差。Kozhaya、Saroufim和Kassas的Starlink数值（NAVIGATION { "72" }({ "1" })，{ "2025" }：三颗卫星在{ "20" } s内约{ "2" } m）只是比较：模型接收机在完美星历下，把全部误差计入{ "30" } Hz的多普勒sigma，在同一窗口内的精度要差好几倍，而论文的接收机和测量速率没有复现

seg-7f462969d2d4 = 带系统间偏差和各信号误差模型的GNSS与LEO联合伪距定位

seg-b9b5298e3408 = 对任意系统组合的加权最小二乘高斯-牛顿定位，每个系统一个接收机钟（系统间偏差与位置一并估计），或在参考时间尺度上取已知的广播偏移；各测量的sigma由调用方提供，默认为引擎的延迟锁定环热噪声（navsignal::dll_code_jitter_chips），取该仰角的C/N0，并与空间信号测距误差合成；局部大地坐标系中的未加权DOP（GDOP、PDOP、HDOP、VDOP、TDOP）、形式的东-北-天sigma以及偏差sigma；<c1/>联合模式比较仅GNSS、仅LEO和融合的定位解，并扫描DOP随所加LEO卫星数的变化

seg-e83699418c0e = 一个手工推导的四卫星DOP（一颗卫星在天顶，三颗在地平线上相隔{ "120" }度，其法矩阵可手工求逆），一个结构恒等式，即带自己时钟且只有一颗卫星的系统不增加任何几何，位置、钟差和偏差的无噪声恢复，以及带随机种子的误差对照协方差。仅为内部检查；没有与接收机的输出比较。{ "0.30" }外部比较，一项发现（仍为MODELLED）：在一个多GNSS的IGS日（ABMF 2018-05-13，GPS和Galileo C1C，广播星历，Klobuchar）上，系统间偏差与RTKLIB v2.4.2-p13 rnx2rtkp一致（在{ "0.30" }广播群延迟修正之后差值中位数为 -0.11 ns，修正之前为 -0.35 ns；判据{ "1" } ns），但对照预先登记的{ "95" } %，在{ "280" }个历元中只有{ "93.6" } %（修正之前为{ "93.2" } %）位于ITRF2020坐标的{ "3" } m以内。RTKLIB自己在同一数据上达到{ "88.2" } %，因此该判据超出了该站点和该日的单频广播定位能力，而不是求解器的差异；该比较测试以忽略状态提交。{ "0.30" }第{ "2" }轮，在判据{ "3" } m / { "95" } % / { "1" } ns不变的情况下采用更严格的输入，一项发现（仍为MODELLED）：采用Galileo E1/E5a无电离层组合（预先登记{ "6927e039" }），{ "79.9" } % 的历元在{ "3" } m以内（RTKLIB { "67.9" } %）；采用精密CODE MGEX轨道、钟差、卫星天线偏移和码偏差（预先登记7d8c3597），为{ "94.2" } %（RTKLIB { "94.1" } %），系统间偏差与RTKLIB相差 -1.03 ns，因为RTKLIB的单点模式忽略卫星天线偏移（两者都略去时为 +{ "0.04" } ns）

seg-ee9a4a0cb530 = 仅用GNSS和用LEO增强的精密单点定位收敛

seg-a54f36c27d90 = 基于无电离层码和相位的浮点PPP扩展卡尔曼滤波器：静态坐标，白噪声接收机钟，每多一个系统一个系统间偏差，按1/sin(仰角) 映射的随机游走天顶湿延迟，每个卫星弧段一个浮点模糊度（升起时加入，落下时删除），以及卫星码与相位共有的精密轨道和钟差误差，按约瑟夫稳定形式以一次相关的两行更新处理；测量由同一模型仿真；收敛时间（误差在阈值以下直到运行结束）、误差曲线以及仅GNSS和各个LEO情形的运行平均位置NEES，作为<c1/>类型运行

seg-be4593802ccf = NEES卡方检验是内部自洽检查（真值和滤波器共用模型）。趋势与Li等，LEO constellation-augmented multi-GNSS for rapid PPP convergence，J. Geod. { "93" }:749-764（{ "2019" }），doi 10.1007/s00190-018-1195-2比较：多GNSS的{ "9.6" } min，在{ "60" }、{ "96" }、{ "192" }和{ "288" }颗LEO卫星下缩短为{ "7.0" }、{ "3.2" }、{ "2.1" }和{ "1.3" } min。随附场景采用其自己具代表性的{ "1000" } km、{ "60" }度壳层、噪声和测站，给出{ "7.4" }、{ "4.8" }、{ "3.2" }、{ "2.7" }和{ "2.3" } min；论文的星座、噪声和收敛定义没有复现，因此这是趋势上的一种MODELLED一致性（单调缩短，最大星座不到仅GNSS时间的三分之一），而不是独立核对

seg-8ef013b46d0f = 由信号带宽决定的5G非地面网络定位精度

seg-12b1e4657370 = 基于均方根（Gabor）带宽的到达时间克拉美-罗界，c/({ "2" } pi beta sqrt({ "2" } (C/N0) T))，适用于平坦OFDM谱（beta = B/sqrt({ "12" })）、带限BPSK谱（闭式分子）或由求积得到的任意谱，以及复单音频率的界sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" }))；在3GPP n256 MSS S波段上，一次过境中接收机钟差未知的下行到达时间定位和单星多普勒定位，作为<c1/>类型运行

seg-f63e1d78cfff = 已发表的算例（P1）：Bachl、Lei和Nabeel，arXiv:{ "2608.10270" }（{ "2026" }），NR NTN的单SSB界，由3GPP TS { "38.211" } SSB映射经Kshana自己的数值函数复现（W_rms { "1.9616" }对{ "1.96" } MHz，sigma_t { "38.755" }对{ "39" } us，sigma_f 100.79/87.28对101/87 Hz，sigma_rho 0.5970/0.5831对0.60/0.58 m，各在所印末位的半个单位以内）；Betz { "2001" }表{ "1" }的BPSK-R RMS带宽（1.128/3.477对1.1/3.5 MHz，补充）；到达时间和多普勒定位协方差与导出几何上的numpy { "2.4.6" } numpy.linalg.inv一致（P2；相对{ "5e-15" }和{ "1.2e-5" }，判据{ "1e-5" }和{ "1e-3" }）。已预先登记（9f2875db；C部分0d66dccd）。引擎定位joint_pvt::formal_sigma_enu（在真实位置而不是含噪定位解处求值的界）是在首次{ "200" } kHz运行以{ "6.5e-5" }失败之后编写的，并在容差不变的情况下重新运行。场景运行的平坦谱和复单音形式（gabor_bandwidth_flat_hz、doppler_crb_sigma_hz）通过crate内的恒等式单元测试到达P1检查。这些是无多径信道上的界，不是已达到的精度。{ "0.30" }修订：ntn-5g-positioning toa_median_sigma_3d_m { "2.0903959" } -> { "2.0903962" } m（NR { "5" } MHz）和{ "25.938613" } -> { "25.938839" } m（NB { "200" } kHz）

seg-9306f1c06081 = LEO辅助的对UTC时间传递，随C/N0和接收机振荡器变化

seg-c618feb01476 = 来自视野内每颗已知位置LEO卫星的钟差测量，按伪距噪声模型以逆方差合并，由两状态（相位、频率）卡尔曼滤波器滤波，其过程噪声为振荡器等级的白噪声和随机游走频率噪声（slot_timing::ClockNoise、clock_state::ClockClass；holdover::coast_phase_variance的滑行方差），由同样水平给出带随机种子的真值时钟，以及IS-GPS-200第{ "20.3.3.5.2.4" }节的系统时间到UTC表达式，并把广播偏移的不确定度作为每次运行的偏差加入；<c1/>授时模式扫描振荡器和C/N0偏移

seg-4a878bd4a90f = 内部自洽：手工求值已发表的偏移表达式，在{ "40" }个随机种子上的归一化误差，以及由偏移不确定度设定的下限。NIST对带微型原子钟的Iridium授时接收机的数值（在{ "40" }天内相对UTC(NIST) 低于{ "40" } ns）只是比较；随附的Iridium场景在标称功率下，计入其具代表性的{ "5" } m距离误差，给出{ "10" }至{ "11" } ns RMS。闪烁频率噪声和电离层延迟未仿真

seg-cef79d82f0d4 = 极区和北极用户的LEO覆盖和精度因子，对照MEO GNSS

seg-462a5e95d480 = 视野内卫星数，以及PDOP、HDOP和VDOP的中位数及可用性随纬度的变化，取样经度和历元，分别针对仅MEO GNSS系统、仅LEO系统和全部系统，每个系统带自己的截止角和钟模型，作为<c1/>极区模式运行；轨道是扫描历元（极区模式中为2026-01-01T00:{ "00" }:{ "00" } UTC）的SGP4/SDP4根数集，经已独立核对的地球轨道路径（IAU 2006/2000A，UT1 = UTC，无极移）转到地固坐标系

seg-a16896913438 = Orekit { "13.1.8" }（Apache-2.0）配合Hipparchus { "4.0.3" }：引擎的GCRS状态由Orekit旋转到ITRF（IERS { "2010" }），WGS-84 TopocentricFrame的可见性对照各系统的截止角，一个钟未知量用org.orekit.gnss.DOPComputer，多个用NumPy { "2.4.6" } numpy.linalg.inv（P2）；路径对照python-sgp4和ERFA检查（“One Earth-orbit path”一行）。判据在运行之前固定（预先登记72ea9eb0；T2和T3是{ "0.30" }第2轮的判据）。把TEME -> GCRS步骤冻结在J2000，测试即变红（{ "4739" }次失败）。仅几何；没有闪烁、地形或信号功率。GNSS的VDOP向极区上升（在随附场景中，GPS和Galileo从赤道的{ "1.20" }升到{ "89.9" }度处的{ "1.51" }），而近极轨LEO壳层则在那里收敛。历史：第{ "2" }轮（3254d456）与列表化的二体状态一致；D8第1轮对照Orekit自己的TLE外推的完整声明（e947e69d）是一项发现，即Orekit在e = { "0" }时的SDP4及其IERS { "1996" } TEME，已固定

seg-d92777401093 = 具名的LEO PNT系统，作为可选的数据预设，各附其来源

seg-c6f71b3937cd = 抄录所引用的公开数值，并检查了结构（每个公开来源都有网址，沃克构型能均分，C/N0由接收功率除以{ "290" } K下的kT得出），没有对照外部参考基准。具代表性的数值已在各预设中指明，属于示意性

seg-dec52b5b9cd6 = 端到端的一个LEO-PNT系统：信号设计、过境链路预算、导航电文和融合定位，每个阶段的输出交给下一阶段

seg-39443b31d418 = <c1/>类型：一个leo-signal设计（公开预设或内联）设定leo-pass频段的中心、带宽、码速率和EIRP分配；过境给出每个历元被跟踪分量的C/N0和带限码抖动；对sin(仰角) 的最小二乘C/N0直线、leo-navmsg电文的SISRE（在过境卫星的轨道上拟合，再按方和根加上所述的定轨项）以及该设计的载波和码速率，交给leo-pvt联合定位的每一个LEO系统，并可选地交给leo-ppp的LEO情形；每一次交接都连同其数值和单位一并报告

seg-854d3c1428d0 = 交接的自洽性：每个交接的值都等于上游阶段自己的输出，改动上游输入会使依赖它的每个下游数值随之变动。各阶段保留自己的标签；该链条不增加物理，也没有外部参考基准

seg-55ca63edff02 = 基于LEO多普勒与过境几何一致性的欺骗干扰（spoofing）检测

seg-b12fc1728220 = <c1/>类型的<c2/>部分：欺骗源在距离和距离变化率上自洽地伪造在某个声称位置处所见的信号，该位置在起始之后发生跳变和/或被从真实位置推开（针对每个LEO频段和MEO GNSS信号）；接收机根据广播轨道和一个独立的先验位置与速度预测每一个距离变化率，并在若干历元的窗口上，对GNSS通道、LEO通道和全部通道，用广义最小二乘卡方统计量检验测得的距离变化率（钟漂作为干扰量或带先验），锁频环热噪声由C/N0得出（Kaplan & Hegarty { "2006" }，第{ "5.6.2" }节）；检测概率取自给定虚警概率下的非中心卡方分布，检测在给定漏检概率下宣告

seg-787c07c08c7f = 闭式解与恒等式，不是外部测量：距离变化率梯度对照中心差分，信息形式的统计量对照稠密协方差形式，纯钟漂给出零，先验可解释的推动至多给出 |dx|^2/sigma_p^{ "2" }，统计量对跳变呈二次关系。没有把任何检测数值与实测攻击比较；欺骗源是理想化的（没有功率、到达角或相关峰特征）

seg-5f341f85ac07 = 基于多频段LEO信号跨频段一致性的欺骗干扰（spoofing）检测

seg-2f9c4d351b0f = 对每颗LEO卫星和每一对测距频段，<c1/>部分构成无几何伪距组合，去掉接收机的电离层模型，并把其历元间的阶跃与两个频段的码噪声以及所述可容许的未建模电离层变化率相比较（双侧高斯，精确检测概率）；欺骗源若伪造某些频段而不伪造另一些，或伪造每个频段而没有电离层，则在其起始时被发现；若伪造每个频段并仿真电离层，则不被发现，结果对此有明确说明

seg-87fd44fa1d94 = 恒等式：无电离层欺骗源的起始阶跃等于该频段对的模型电离层延迟差，阈值为双侧正态分位数乘以该阶跃的标准差，再加上变化率界。接收机的电离层模型即引擎自己的，因此真实信号的残差按构造均值为零；没有外部参考基准

seg-97dbcd5f2728 = 电离层探测：由一次LEO过境的双频延迟得出斜向TEC

seg-844de34fd2f3 = 对<c1/>卫星的每个频段对，报告给出无几何码组合在过境峰值处恢复的斜向总电子含量 (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" }))，以及由两个频段热码噪声得出的1-sigma，因此任何多频段LEO-PNT设计都可以作为电离层探测器来权衡

seg-2562ae9e6180 = 一阶色散恒等式，按构造相对引擎自己的一阶延迟是精确的（其1/f^{ "2" }缩放已在自己的一行中对照IS-GPS-200达到VALIDATED）；精度仅取决于热码噪声，不含多径或频间偏差。{ "0.30" }第{ "2" }轮，实测（预先登记5e795f93），一项发现（仍为MODELLED）：CODE全球电离层图CODG1330.18I对照ABMF C1C/C2W码及CODE偏差，在{ "36" }个弧段均值中有{ "33" }个在{ "3" } TECU以内（最差为傍晚弧段上的 +{ "6.84" } TECU；逐历元RMS为{ "3.95" } TECU），而判据要求每个弧段都满足；没有经过独立核对

seg-0a63a69e181d = 估计测站时的月球坐标系基准协方差，对照50位扩展精度

seg-de2ee45f6527 = lunar-frame-campaign场景在估计地球测站（测站{ "1" }锚定）时的七参数Helmert基准协方差，按lunar_frame_campaign在binary64中的计算方式：由延迟雅可比矩阵累积的测站与信标联合费舍尔信息，测站块经Schur补通过雅可比谱逆边缘化，H = AᵀSA由Helmert设计构成并按谱方法求逆。该问题按构造就是病态的（Helmert条件数{ "2.1e8" }至{ "2.3e8" }，联合信息条件数{ "1.6e12" }至{ "3.0e13" }）：Schur修正中{ "1e-9" }的相对变化可使基准sigma变动最多{ "28" } %。报告：七个基准sigma、Helmert条件数和最弱方向。声明，已收窄：引擎的基准sigma和条件数处于该问题上后向稳定的双精度流程的先验最坏情形误差界之内；这并不声称它们达到双精度所能允许的精度（采用分解途径时，同样输入上的精度约高一千倍，选择启用的平方根求解器则约高一千万倍），而最弱方向只在其判据低于直角处才经过独立核对（测站固定的对照）

seg-1aab389815b3 = mpmath { "1.3.0" }（BSD-3-Clause），{ "50" }位有效数字，在{ "80" }位自检（一致性{ "1.1e-38" }或更好），作用于引擎已提交的雅可比矩阵、权重和Helmert设计：Schur补用mpmath自己的LU求解，H用其求逆，并用其雅可比特征分解（P2，独立的数值库）。在测试数据出现之前预先登记804662d5，判据来自一阶后向误差公式：常数 (3n+{ "1" })n + m乘以单位舍入误差（Higham，Accuracy and Stability of Numerical Algorithms，定理{ "10.4" }，Tier B形式），再乘以每个量对联合信息、Schur补和H的精确一阶灵敏度。实测：基准sigma在2026-03-18为{ "4.8e-6" }以内（判据{ "9.6e-2" }至{ "2.2e-1" }），2024-01-01为{ "9.7e-6" }（判据{ "2.8e-2" }至{ "6.9e-2" }），测站固定时为{ "2.0e-14" }（判据{ "1.0e-11" }至{ "2.8e-7" }）；条件数在{ "4.6e-6" }、{ "1.3e-5" }和{ "4.1e-14" }以内。在估计测站的场景上，判据是最坏情形，比实测误差高四个数量级，而且那里最弱方向的判据超过直角，因此该项检查不计入；在测站固定的对照上，最弱方向一致到{ "6.6e-16" } rad，判据为{ "9.4e-11" }，由单位向量之间的弦测得（先前的acos比较器无法分辨低于{ "1.5e-8" } rad的角度；判据不变）。诊断：NumPy { "2.3.5" }的Cholesky和QR途径在2024-01-01输入上达到{ "9e-9" }和{ "5e-9" }，其求逆和特征值途径为{ "2.9e-6" }和{ "6.2e-6" }：引擎在其界之内，但精度约比分解途径低一千倍。验证的是已提交输入上的线性代数，不是雅可比矩阵（测评活动一行的SPICE一支负责这一点），也不是该示意性测评活动的物理精度

seg-71b463388e80 = 平方根信息基准求解器，对照50位扩展精度

seg-5ec3e3c2bf19 = 一个选择启用的平方根信息求解器（lunar-frame-campaign solver = "srif"；默认不变），对基准从不形成或求逆信息矩阵：对白化的延迟雅可比矩阵作Householder QR（正交-三角分解），作为平方根信息滤波器的测量更新，地球测站通过尾部三角块边缘化（其Gram积即Schur补），对七参数Helmert基准再对R_bb A作第二次QR，sigma为三角逆的行范数，谱（条件数、最弱方向）来自单边雅可比奇异值分解。内积用Dekker拆分的无误差乘积补偿，因此每个运算都是正确舍入的IEEE-754基本运算或平方根；各平台上结果相同，是据此论证的，没有跨平台测试

seg-271cba640489 = mpmath { "1.3.0" }（BSD-3-Clause），{ "50" }位有效数字，在{ "80" }位自检（一致性{ "1.4e-43" }或更好），作用于引擎已提交的雅可比矩阵、权重和Helmert设计（P2，独立的数值库：mpmath自己的LU求解、求逆、Cholesky和雅可比特征分解）。在求解器编写之前预先登记b41908c9，判据来自平方根形式的一阶后向误差界：Householder QR常数mn加 (3n+{ "1" })n乘以单位舍入误差（Higham，Accuracy and Stability of Numerical Algorithms，定理{ "19.4" }和第{ "8" }章）再乘以精确灵敏度。实测：基准sigma在2026-06-09为{ "3.0e-13" }以内（判据{ "4.1e-7" }至{ "5.3e-7" }），测站固定时为{ "1.9e-15" }（判据低至{ "4.8e-12" }），2026-03-18为{ "3.8e-13" }，2024-01-01为{ "2.3e-13" }，而默认谱求解器在这两天偏差为{ "4.8e-6" }和{ "9.7e-6" }；条件数在{ "4.9e-13" }以内；最弱方向在{ "1.4e-13" } rad以内（对照为{ "1.7e-16" }，判据{ "5.1e-10" }）。该检查的局限：判据只能保证基准误差低于约{ "2e-7" }相对；实测的{ "1e-13" }数值是观测，并非判据所保证的。该检查拒绝了默认谱求解器（在2024-01-01上sigma为{ "9.7e-6" }，对照{ "2.9e-7" }；在起约束作用的日期上为{ "1.3e-6" }，对照{ "4.9e-7" }，裕度为{ "1.3" }至{ "2.6" }）和取错的三角逆（列范数：red），但符号翻转的Householder、未补偿的点积，以及由平方根因子构成的H的谱逆所得的sigma（{ "3.7e-9" }）全都通过，因此它并不表明每个平方根步骤都是必要的。验证的是选择启用的求解器在已提交输入上的线性代数，不是雅可比矩阵，也不是默认求解器；跨平台的逐位可复现性是据所用运算论证的，只在一个平台上以重新运行的一致性做了测试

seg-433b52bf0ba2 = 海事信任监测器：其所依赖的算术（NMEA解码、测地线偏移、运动学和传感器残差统计）

seg-c61c575f9c38 = 对一艘船舶，<c1/>解码接收机及其仪器发出的NMEA { "0183" }语句（GGA、RMC、VTG、HDT、VHW、VBW、ZDA、GSV），形成各定位之间的东-北偏移（<c2/>），并由此得出其监测器据以判断的统计量：在{ "30" } s窗口上的隐含速度、航位推算残差、隐含加速度和隐含转向率，航向对航迹、计程仪速度对对地速度以及天线高度的残差（{ "10" } s中位数），以及卫星信噪比的离散度和上升。

seg-32fcf6956dac = 外部核对的范围，狭义表述：({ "1" }) 监测器所读每个字段的解码，对照pynmea2 { "1.19.0" }（MIT），在{ "8" }份合成日志（{ "1,086" }个历元）上，在该字段单位下一致到{ "1e-9" }（纬度和经度、高度、大地水准面差距、HDOP、速度、航迹、航向、信噪比；整数和日期完全一致；一天中的时刻一致到{ "1e-6" } s），最大差异处于双精度末位的水平；({ "2" }) 两个定位之间的东-北偏移，以距离和方位表示，对照geographiclib { "2.1" }（MIT）的WGS84测地线，在{ "223" }对定位上，基线最长{ "2" } km，纬度从 -45至{ "70" }度并跨越反子午线，一致到{ "0.01" } m和{ "0.001" }度（方位对照测地线的平均方位角，即弦的方向）；({ "3" }) 监测器在一段{ "400" } s的合成航程（含一次转向和一次位置阶跃）的{ "341" }个计分历元上的输入统计量，对照Python重新计算（距离和方位角用geographiclib，解码用pynmea2，中位数和标准差用numpy）：隐含速度一致到{ "0.005" } m/s，航位推算残差{ "0.02" } m，加速度{ "5e-4" } m/s^{ "2" }，转向率{ "1e-3" } deg/s，残差中位数以及信噪比的离散度和上升{ "1e-6" }。不在核对范围之内：监测器的窗口长度、容许量和阈值是本项目自己的规则；该Python依据同一份文档复现它们，因此一致只是佐证算术的实现，并不佐证这些规则。THS语句没有pynmea2类，ROT语句未被读取；两者都不在覆盖范围之内。从NMEA发射器和卫星编号到RINEX风格卫星标识的对照表是本项目自己的（只比较编号、发射器和数值）。时间步长、主机时钟和认证状态输入没有参考基准。所有数据都是由receiver_trust::synth生成的合成文本；这里没有任何东西是测量，对于任何监测器在真实干扰下的表现也不作任何陈述。方位：与测地线平均方位角比较。对照定位{ "1" }处正向方位角的预先登记比较，在{ "0.001" }度处失败（{ "223" }对中有{ "77" }对，最差{ "8.3e-3" }度），原因是定义上的不一致，而不是算术；修订是在首次运行之后作出的，两个结果都已记录（正向方位角的比较作为描述性的、未预先登记的{ "0.01" }度界保留在测试中）。披露：首次运行发现输入的覆盖太少（加速度和转向率在每个历元都被钳为零，反子午线航迹也从未跨越它）、合成生成器中的一处缺陷（没有经度回绕），以及对方位而言，所登记的参考量（首个定位处测地线的正向方位角）与弦方向相差约半个子午线收敛角（{ "223" }对中有{ "77" }对在{ "0.001" }度之外，最差{ "8.3e-3" }）；输入已更正，方位在相同容差下对照平均方位角比较（预先登记中的修订{ "1" }至{ "3" }，是在看到结果之后作出的，因此不是盲测）；航迹和航向的比较改为循环比较（{ "360" }度和{ "0" }度是同一航迹，修订{ "5" }）。变异检验：把东向偏移缩放{ "1e-4" }，则测地线比较失败。

seg-1fdbb476c8ab = 海事信任度：把监测器的证据汇总为0-100的分数及其三个档位

seg-0d76b33144f1 = 每个监测器把其证据归约为统计量对阈值的比值；分数为{ "100" }减去各监测器的权重乘以该比值的限幅线性斜坡（{ "0" }到{ "0.5" }，在{ "1.5" }处为{ "1" }）之和，限定在{ "0" }至{ "100" }并舍入到{ "0.1" }，档位在{ "90" }和{ "55" }；每个历元列出扣分的监测器及其分数。

seg-b2d3c6d6ac36 = 对照规范的实现，并非外部参考基准：一份洁净室Python重新实现（scripts/maritime_score_cleanroom.py），由只拿到docs/RECEIVER-TRUST.md和docs/MARITIME-TRUST.md而没有Rust源码的读者编写，与score_from_ratios在{ "600" }个比值向量上一致（分数、档位、分值和扣分顺序，差值{ "0" }），这是在文档于第一位读者发现其沉默或不一致之处（并列顺序、舍入、通过或失败型监测器的比值、两个数字与公式不符的示例）得到补全之后。这表明文档是充分的，代码做的就是它所说的事。不在核对范围之内，也是该行仍为MODELLED的原因：规则本身（权重、斜坡、档位边界、证据保持）是本项目自己的，已预先登记但没有外部来源，这里没有任何东西表明{ "80" }或{ "40" }的分数在真实干扰下就是领航员所希望它表示的含义；也不给出这类数值。监测器的阈值同样是本项目自己的（行A只检查它们的算术）。

seg-f52fceaf06ca = NMEA { "0183" }训练数据流的一致性和解码数值

seg-684f86418933 = 供船员训练用的合成驾驶台NMEA { "0183" }数据流（kshana nmea-scenario）：GGA、RMC、VTG、ZDA、GNS、GSA、GSV、HDT、VBW和PKSHT标记，由真值航迹生成，带有经建模的接收机、天空、压制干扰和欺骗干扰效应。仅文本输出；不发射任何信号。

seg-4591ed75149c = 外部核对的范围，狭义表述：八条合成训练数据流（四个库内场景，随机种子{ "1" }和{ "7" }；GGA、RMC、VTG、ZDA、GNS、GSA、GSV、HDT、VBW和PKSHT标记）的全部{ "225,227" }条语句，在独立的NMEA解析器pynmea2 { "1.19.0" }中都能解析，校验和有效，发射器和类型符合预期。它所解码的位置、对地速度、对地航向、航向、UTC时间和日期、定位状态以及GGA卫星数，在首次比较之前固定的容差内与生成器的真值航迹相等（{ "1.5e-6" }度、{ "0.06" } kn、{ "0.07" } km/h、航向{ "0.11" }度、航首向{ "0.5" }度、{ "0.02" } s），由scripts/gen_nmea_training_ref.py运行，测试数据位于tests/fixtures/nmea_training_ref/。GGA卫星数的预期在首次运行之后依NMEA约定作了更正（无定位时为{ "00" }）；数值容差与预先登记的提交相比未变。不在核对范围之内：任何接收机、海图绘图仪或驾驶台系统是否接受这些数据流；接收机、天空、压制干扰或欺骗干扰模型的真实性（标称天空、经建模的噪声、拖曳和重放剖面，均为MODELLED）；HDOP、高度，以及句法和计数之外的DOP与GSA/GSV内容；教员日志。不发射任何信号，也不声称任何抗压制或抗欺骗干扰的性能。

seg-1be1cfcb95c8 = 干扰地图：精度代码的含义、AIS不可用值、网格单元归属、各单元状态下的航线长度，以及内陆屏蔽

seg-71cff2a675e8 = 地图所用ADS-B导航精度和完好性代码的解读（NACp代码所代表的EPU界、NIC代码所代表的包含半径界，以及该方法由它们推出的低类和良好类）；AIS读取器所丢弃的AIS位置和速度不可用值；一个位置所落入的固定纬度/经度网格单元；航线长度及其按单元状态（降级、未降级、未评估、未观测）的划分，由航线暴露报告给出；以及一个位置是否位于某个陆地多边形内陆一侧且超过缓冲距离。被标记为降级或异常的单元，所述的是所报告的精度字段或不合理的位置，不是对干扰的结论，这里也没有任何东西核对这一点。

seg-beee15333c89 = 外部核对的范围，狭义表述：五种独立实现读取同样的合成输入。({ "1" }) pyModeS { "2.21" }解码合成的DF17运行状态帧和空中位置帧；Kshana的NACp EPU界一致到{ "0.5" } m（最大差异{ "0.4" } m），其代码{ "5" }至{ "11" }的NIC包含界一致到{ "1" } m，其低类和良好类把全部{ "12" }个NACp代码以及参考基准产生的每个NIC代码（{ "0" }至{ "11" }）放在该参考基准的界所隐含的阈值的同一侧（{ "0" }处不一致）。({ "2" }) pyais { "3.3.0" }解码AIVDM类型{ "1" }语句，其载荷比特由脚本依据ITU-R M.1371原始字段值打包；Kshana恰好拒绝解码所得的不可用位置（纬度{ "91" }，经度{ "181" }）和速度（{ "102.3" } kn），并把{ "0" }至{ "102.2" } kn保留为解码所得（{ "94" }帧上{ "0" }处不一致）。({ "3" }) shapely { "2.2.0" }在单元多边形上的covers() 与grid::Grid::cell_of在{ "1770" }个点上一致，单元尺寸为{ "0.5" }、{ "0.25" }、{ "1" }和{ "0.07" }度，包括近边缘的点、两极和反子午线（{ "0" }处不一致）。({ "4" }) shapely { "2.2.0" }的航线与单元相交，配合GeographicLib { "2.1" }的WGS84测地线长度，与航线暴露在{ "8" }条合成航线上一致，其中两条跨越反子午线：总长度一致到{ "0.6" }%（最大差异{ "0.49" }%，球体对椭球体），每个单元状态的长度一致到{ "0.6" }% 加每段{ "125" } m（最大为该容差的{ "21" }%）。({ "5" }) shapely { "2.2.0" }的contains() 配合pyproj的方位等距到海岸线的距离，与{ "2000" } m内陆屏蔽在围绕四座合成岛屿（其中一座带湖）的{ "992" }个格点中心点上一致（{ "0" }处不一致；{ "4" }个距缓冲区边界{ "20" } m以内的点被排除并计数）。容差在任何比较之前固定于tests/fixtures/interference_map_ref/PREREGISTRATION.md，此后未作改动；首次运行发现的合成输入中的两处缺陷记录在那里。不在核对范围之内：Kshana不解码原始Mode S帧或AIVDM语句，因此这验证的是它对已解码数值的解读，不是解码器。参考基准对代码{ "1" }、{ "2" }和{ "4" }的NIC包含半径与DO-260B（{ "20" }、{ "8" }和{ "2" } NM）不同，因此只对代码{ "5" }至{ "11" }做了数值比较。({ "0" }, { "0" }) 位置规则、高度下限、来源类型过滤器、标识符哈希、该方法的阈值和统计量，以及单元尺寸的选择，都是Kshana自己的，没有对照任何东西核对。航线比较在两侧使用同样的纬度和经度上的直线路径定义，因此它检查的是长度和单元归属，而不是该路径对船舶或飞机是否正确。这里没有任何东西表明被标记的单元就是干扰。输入是合成的；参考基准的测试数据由scripts/gen_interference_map_ref.py写出（pyModeS为GPL-3.0，只在该离线脚本中使用；CI不需要Python）。

seg-57ace69bdf1a = 信任遥测的线路格式：Prometheus文本展示格式和OpenTelemetry OTLP/HTTP JSON

seg-654126a9d073 = GNSS信任度（分数、档位、原因、门控，以及按请求给出的位置），作为在 /metrics上提供的Prometheus文本展示格式，以及作为OTLP/HTTP JSON指标，对原因标签的基数设有上限。

seg-9cbde962155c = 外部核对的范围，狭义表述：我们针对一条84行合成数据流的Prometheus文本展示（含引号、反斜杠、换行符和非ASCII文本的标签值，{ "64" }条原因序列加一个“other”折叠，门控和位置仪表）被prometheus_client { "0.26.0" }的文本解析器接受，其读出的指标族、类型、帮助文本、标签集和数值与注册表的状态完全相等（数值按f64相等）。针对同一注册表的OTLP/HTTP JSON，经protobuf { "7.36.2" } json_format.Parse(ignore_unknown_fields=False) 解析为opentelemetry-proto { "1.45.1" }的ExportMetricsServiceRequest，每个指标的名称、描述、单位、种类、单调性、聚合时间性、属性、值、起始时间和时间都与注册表的状态完全相等。两个解析器都已证明会拒绝未知字段、类型错误的值和格式错误的行（scripts/gen_telemetry_formats_ref.py）。模式{ "1.3" }（{ "0.36" }），在任何工具读取之前预先登记（fb226057）：对一条64行合成的模式1.3数据流（几何状态、DOP、标签和信号丢失，分别为存在、空值、缺失和未知；扣分类别；无法解析的行），同样的两个解析器读出几何序列（Prometheus kshana_trust_geometry*，OTLP kshana.geometry.*）以及kshana_trust_reason_active上的类别标签，与注册表所隐含的完全一致（{ "24" }个指标族和{ "54" }个样本；{ "12" }个指标和{ "31" }个数据点），promtool { "3.5.0" } check metrics以{ "0" }退出，无任何lint问题，OpenTelemetry Collector contrib { "0.135.0" }接受该OTLP/HTTP JSON（状态{ "200" }，无任何被拒绝），其文件导出器原样记录该请求（xval/telemetry-1.3，受数据门控：发布压缩包按固定的SHA-256获取，并提交其输出）。不在核对范围之内：HTTP端点、投递、超时和重连都没有参考基准核对，Collector的prometheus接收器也没有；注册表是通过访问器读取的，因此注册表状态本身的故障不会被发现；OTLP“已提交输出为最新”的检查只在启用otlp特性时运行；指标名称及其对运行中心的用处没有经过独立核对；CEF和LEEF不在覆盖范围之内（见下一行）。

seg-b037c999443b = 信任遥测的SIEM事件：基于syslog的通用事件格式（CEF）

seg-ffd8d7062055 = 档位变化（或逐历元）事件，作为通用事件格式载荷，装在经UDP或TCP的RFC { "5424" }信封中，带有文档化的字段映射和CEF转义。

seg-59fd23d6607e = 外部核对的范围，狭义表述：对照两个独立的开源解析器（参考基准：pycef { "1.11" }（PyPI，MIT）；Logstash CEF编解码器（Logstash { "8.15.3" }中的logstash-codec-cef { "6.2.7" }）），在本crate写出的一组CEF行上（下面的修订{ "4" }之前为{ "157" }行，之后为{ "170" }行，修订{ "5" }之后为{ "176" }行）：一条已提交的84行合成信任数据流中的每一次档位变化和每一个历元，加上主机、原因、时间标签和门控名称中的对抗性文本，其中含等号、反斜杠、反斜杠加等号、竖线、换行符、回车符、制表符、连续空格、多字节和星面字符以及形似键的文本，极端分数和偏移，以及有和没有前一档位的每个档位。pycef解析其头部无需转义的行（修订{ "4" }之前为{ "153" }，之后为{ "166" }，修订{ "5" }之后为{ "172" }），并按CEF规范的反转义规则（pycef不应用，由scripts/gen_cef_ref.py应用）精确恢复头部字段、严重度、精确的扩展键集和每一个值（数值按f64相等）。Logstash编解码器自己做反转义，解析每一行（{ "157" }，然后{ "170" }，然后{ "176" }），达到同样的判据，并且还恢复出四个需要转义的头部字段（版本字符串中的竖线、反斜杠和等号），而pycef的头部模式读不出这些，因此头部转义仅依靠Logstash编解码器。比较判据在任一解析器运行之前登记于提交{ "5172e579" }（pycef）和0a7598aa（Logstash），两者在首次比较时都达到了该判据。披露五项修订。修订 ({ "1" }) 至 ({ "3" }) 没有触及任何比较规则和任何预期值：({ "1" }) 语料库大小断言由{ "5" }更正为{ "4" }次档位变化，这是数错了，因为数据流中有{ "4" }次；({ "2" }) 在首次尝试没有产生事件之后，修复了Logstash运行器的管道分隔符接线；({ "3" }) 信任度分数和历元偏移从CEF整数字段cn1和cn2移到浮点字段cfp1和cfp2，这是本次发布中作出的线路格式改动，此后重新生成语料库，并在判据不变的情况下重新运行两个参考基准，它们再次达到判据。修订 ({ "4" })，{ "0.36" }，扩展了语料库和预期键集，在任一解析器在新行上运行之前登记于d6331429：模式{ "1.3" }的输入在自定义字段cs6（标签geometry：状态，然后是“;”和扣分类别）、cfp3（geometryHdop）和cfp4（geometryPdop）中加入卫星几何；{ "13" }个几何用例（语料库增至{ "170" }行）和三个新键；两者在首次比较时都达到判据，其余不变（pycef解析了{ "170" }行中的{ "166" }行，{ "4" }个tier { "2" }头部用例同前；Logstash为{ "170" }行中的{ "170" }行）。修订 ({ "5" })，{ "0.36" }，追加了{ "6" }个几何标签用例（语料库增至{ "176" }行），在任一解析器在这些行上运行之前登记于9a8e4fa9：对带有几何标签的输入，cs6增加第三个字段（“;”和标签），cn1（geometryUsedSatellites）给出所用卫星数；先读取了Logstash编解码器的映射表（没有flexString字段，因此用cs6而不是flexString1）；两者在首次比较时都达到判据（pycef为{ "176" }行中的{ "172" }行，Logstash为{ "176" }行中的{ "176" }行），而此前的每个参考条目都原样复现。不在核对范围之内：两种解析器都不对cfp值做类型检查（两者都按文本保留），因此浮点字段的使用依据的是CEF数据字典，而不是参考基准；没有运行任何厂商的SIEM；扩展键名及其映射是本crate的选择，解析器只表明它们按所写读回；RFC { "5424" }信封、投递、超时和重连不在覆盖范围之内；pycef是一个最后发布于{ "2020" }年的小型解析器，Logstash编解码器是更有分量的参考基准。

seg-51640405c9b7 = 信任遥测SIEM事件：基于syslog的Log Event Extended Format（LEEF）

seg-1b3245506847 = 频段变化（或逐历元）事件，以Log Event Extended Format { "2.0" }载荷的形式封装在RFC { "5424" }信封中，经UDP或TCP发送，并附有文档化的字段映射。

seg-563ccb0adbe5 = 检查范围：本crate自身对文档化LEEF字段映射和RFC { "5424" }信封字段所做的精确字符串测试；目前没有维护中的开源LEEF解析器（在Python包索引中检索未发现），因此该格式只是对照其自身规范、由同一作者读取后进行检查，而不是对照外部参考基准（oracle）。不在检查范围：任何厂商的解析器或SIEM是否接受这些LEEF载荷；文档化规则之外的转义规则；真实syslog收集器的行为。

seg-96a95b89faa5 = 证据包完好性：签名、哈希链与验证流程

seg-943a853d8a4a = GNSS信任事件的签名哈希链证据包：对每个文件计算SHA-256，并在清单上建立哈希链；对清单的精确字节做Ed25519签名；验证器会逐一指明每种失败（文件被更改、删除、重命名、调换或新增，清单被重排或编辑，清单在无密钥的情况下被重新哈希，证据包被重新签名，所固定的密钥有误，以及时间戳令牌被剥离、被替换、为无效内容或对应另一份文档）。

seg-0699ef2074fd = 外部核对的内容（范围从窄表述）：（{ "1" }）证据包用于签名和严格验证的Ed25519函数（evidence::bundle::sign_detached、evidence::verify::verify_detached）能逐字节复现RFC { "8032" }第{ "7.1" }节测试向量{ "1" }、{ "2" }、{ "3" }和{ "1024" }的公钥与签名，接受这些向量，并拒绝向量{ "1" }的每一个翻转比特、其余向量中每隔七位的翻转比特以及非规范的S+L签名；这些向量取自RFC文本，并由scripts/gen_ed25519_rfc8032_ref.py中的两个独立实现（cryptography/OpenSSL和PyNaCl/libsodium）复现。（{ "2" }）evidence::bundle::sha256_hex，即所有证据包哈希及哈希链背后的哈希函数，能精确复现FIPS 180-4的SHA-256示例（abc；448比特消息；一百万个a）、空消息，以及跨越填充边界的{ "0" }至{ "130" }字节阶梯的hashlib摘要。（{ "3" }）仅依据docs/EVIDENCE-PACKS.md用Python编写的验证器（scripts/evidence_verify_cleanroom.py：使用hashlib和cryptography；其作者未读过任何Rust代码）在{ "71" }个合成的完好与被篡改证据包上与Rust验证器完全一致，包括裁决、带文件名的失败集合、签名裁决，以及由文件重新计算出的哈希链头与清单所记录的哈希链头。首次运行{ "71" }个中有{ "64" }个一致；不一致之处为一处规范歧义（对照一份不可读的清单检查所固定的密钥）、一处参考基准接口偏差和一个构建不完整的用例；随后澄清了规范语句，依据文本重新实现了参考基准并补全了该用例，未更改任何容差或预期（记录于提交d54e14c6）。不在检查范围：该洁净室验证器是由另一位作者完成的独立实现，而不是第三方权威，且与规范共享相同的取舍，因此它印证的是对规则的这一实现，而不是规则本身；这些向量验证的是密码原语，而不是证据包格式的设计。在本行中，RFC { "3161" }令牌仅读取其消息摘要印记，测试令牌为合成且未签名；时间戳机构的签名与证书链由另一行“RFC { "3161" }时间戳令牌签名与证书链验证”以可选方式（<c1/>）验证。篡改用例为合成。此处没有任何内容构成对任何证据包的法律意见或证明。

seg-c15736afcbc9 = RFC { "3161" }时间戳令牌签名与证书链验证

seg-cd64bbf39459 = evidence::tsa::verify_token，以及针对证据包timestamp.tsr的可选命令<c1/>：对RFC { "3161" } TimeStampResp或裸TimeStampToken（基于TSTInfo的CMS SignedData），依据受信任的锚点离线检查，方式与<c2/>的检查方式相同：已签名属性的内容类型以及对TSTInfo的消息摘要；对已签名属性的签名（RSA PKCS#1 v1.5、RSASSA-PSS、ECDSA P-256和P-384；RSA公钥运算基于crypto-bigint）；指明签名者证书的ESS signing-certificate v1（SHA-1）或v2哈希，该证书在令牌自带证书与调用方提供的不受信任证书中查找；签名者证书的关键性、唯一的timeStamping扩展密钥用途；到受信任的自签发锚点的证书链，包括每份证书的签名、CA状态和密钥用途，以及每份证书在令牌genTime时均有效；还有消息摘要印记与数据的比对。未检查：吊销（CRL、OCSP）、名称与策略约束、随机数

seg-d305c442506d = OpenSSL { "3.0.13" }（<c1/>，对RSA-PSS令牌则为<c2/>加上TSTInfo印记），由tests/fixtures/evidence_tsa/run_openssl.sh在cases.tsv的{ "27" }个用例上运行：使用SHA-256和SHA-512以及ESS v1和v2的RSA PKCS#1 v1.5，P-256中间证书之上的ECDSA P-384根证书以及P-256和P-384 TSA，RSA-PSS，缺少签名者证书的令牌（分别在提供与不提供该证书时），CAdES签名的令牌，被翻转一个字节的签名（三种算法），被更改的TSTInfo（两个），被翻转的中间证书签名，ESS孪生证书，错误的锚点（四个），已过期的TSA证书，非关键的和错误的扩展密钥用途，以及错误的数据（三个）。预先登记于tests/fixtures/evidence_tsa/PREREGISTRATION.md（单独提交，30ad70b2，早于验证器存在之时；OpenSSL裁决随后重新运行，逐字节一致）。首次运行：全部{ "27" }个裁决一致（B1），且每个genTime精确到秒一致（B2）。范围，从窄表述：自行生成的测试证书和令牌，由作出裁决的同一个OpenSSL制作；OpenSSL是独立实现，而不是时间戳机构；未收录任何公共机构的令牌（freetsa.org未声明许可）。此处不证明任何真实的时间戳

seg-c04042b0270a = 在JammerTest { "2024" }数据集上标定的接收机信任干扰阈值

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset：在公开的JammerTest { "2024" }数据集（Zenodo { "15911589" }，GPL-3.0-or-later，运行时获取，从不内置）上，对C/N0下降、AGC和压制干扰指示器三类监测器进行的预先登记标定：对每个文件夹，依据mon_rf.csv和rinex.csv生成{ "1" } s时间线，监测器运行一次，标定之后的每个历元依据该文件夹的attack_log（由CEST换算为UTC，{ "60" } s保护间隔）标记为干净或存在压制干扰，每个阈值在固定网格上扫描，选取使汇总的干净虚警概率不超过{ "0.01" }的最小阈值，并给出留一文件夹的保留集计数；另有UBX读取器交叉核对。所选结果仅作为可选配置发布：[monitors] profile = "jammertest-2024-calibrated"（cn0_drop_db { "1.5" }，agc_k_sigma { "3.5" }，jam_ind_threshold { "29" }）；默认规则以及未使用该配置的所有输出均不变

seg-3ccd1b09ad09 = 以该数据集已发布的事件日志（attack_log时间窗）作为事件真值，依据预先登记xval/jammertest-trust/PREREGISTRATION.md（单独提交，0fa012b，早于测试框架运行）。首次也是唯一一次运行（xval/jammertest-trust/RESULTS.md）：{ "24" }个文件夹中有{ "14" }个可评估（其中{ "7" }个含压制干扰），干净历元{ "3,502" }个，压制干扰历元{ "9,560" }个。保留集干净虚警概率：cn0_drop_db为{ "0.0231" }（81/3502），判据为{ "0.02" }，FAIL；agc_k_sigma为{ "0.0003" }，通过；jam_ind_threshold为{ "0.0094" }，通过；三者的并集：虚警{ "0.0328" }，检测{ "0.807" }，判据分别为{ "0.05" }和{ "0.50" }，通过。依据登记的规则，该行为MODELLED（有一项判据未通过）。范围有限：仅一种接收机类型（u-blox ZED-F9P）、一次事件，以预定的一分钟时隙作为真值（检测率为下界；干净指处于记录的时间窗之外）；标定基于CSV日志，而UBX读取器在两个文件夹上给出更多虚警。船舶信任度分级未经标定

seg-65a8361b4a22 = Jammertest评分：依据已发布的测试计划，对接收机日志按每次预定测试评分（检测延迟、漏报警、虚警、恢复时间）

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" }（kshana jammertest import|score）：将NPRA测试目录与发射计划（MIT，以固定的SHA-256获取，从不内置）读作预定真值，并保留目录标识；对接收机信任度运行按每次测试评分（首次报警减去计划开始时间，对照容差判定为detected/late/missed，到首个无报警时段的时间，位于所有时隙及其保护间隔之外的报警），并附带携带评分卡的已签名证据包。该时间表是计划时隙，而不是实际播发时间的记录

seg-49b912adb7a9 = 计划中每个测试区域的时隙数（{ "76" }、{ "77" }和{ "45" }个时隙，其中{ "61" }、{ "63" }和{ "32" }个发射）由脚本对同一份JSON独立计数；以{ "2024" }数据集的attack_log时间窗作为事件真值，依据预先登记xval/jammertest-score/PREREGISTRATION.md（单独提交，c2e6d3b，早于评分器运行）。首次也是唯一一次运行（xval/jammertest-score/RESULTS.md）：登记的最小数据量规则未通过（{ "12" }个UBX文件夹中有{ "4" }个共{ "4" }个可评分的压制干扰时间窗，而最低要求为来自{ "2" }个文件夹的{ "10" }个时间窗：{ "5" }个文件夹被基线规则剔除，{ "3" }个UBX日志仅含GPS周内时），因此判据B1至B4无法评估；未放宽任何条件，也未重新运行。v2（xval/jammertest-score/PREREGISTRATION-v2.md，单独提交，仅涉及数据处理：仅含GPS时间的日志按日期定位，{ "12" }个仅有CSV的文件夹，针对移动流动站的移动平台会话；判据和最小数据量规则不变）：{ "24" }个文件夹中保留{ "14" }个，但可评分的压制干扰时间窗仅{ "7" }个，最小数据量规则再次未通过，没有任何判据可评估（RESULTS-v2.md）。预定真值：计划时隙不是实际播发记录，漏检可能是该测试根本没有运行，延迟自计划开始时间算起，干净指处于计划时隙之外。测量域监测器的检测结果并不能说明低功率欺骗源的情况。仅一种接收机类型（u-blox ZED-F9P）。{ "2025" } SimulaMet NMEA数据集未被使用（未声明许可，需订阅访问）

seg-0d227bbcb5f1 = Test-bench导出（kshana bench-export）：地固系、大地坐标和局部速度各列、姿态各列以及NMEA { "0183" }输出

seg-c6a6e08afadd = 运动CSV的地固系位置、大地位置、地固系速度、航向/俯仰/横滚和UTC各列，以及NMEA GGA/RMC语句，由合成场景生成（gnss-ins，含automotive-urban-canyon、jamming、gnss-sim）。仅含运动与事件；不写入任何信号，也不声称任何模拟器或接收机的性能。

seg-f953ad11fe08 = 外部核对的内容（范围从窄表述）：对照pyproj { "3.8.0" }（PROJ { "9.8.1" }）、geographiclib { "2.1" }、pynmea2 { "1.19.0" }和scipy { "1.18.1" }，由scripts/gen_testbench_ref.py在{ "4" }个合成场景上运行，容差在首次比较之前固定（均取写出程序舍入的最坏情形）：每一行的地固系各列等于大地坐标各列的WGS { "84" }换算结果（最差{ "1.3e-4" } m，判据{ "3e-4" }），反向换算亦然（{ "1.3e-9" } deg，判据{ "2e-9" }；高度{ "1.3e-4" } m，判据{ "3e-4" }）；经PROJ的站心运算旋转到北东地的地固系速度等于引擎的真实NED速度（{ "7.5e-5" } m/s，判据{ "2e-4" }）；航向、俯仰和横滚等于scipy对引擎真实四元数求得的偏航-俯仰-横滚（{ "5.0e-7" } deg，判据{ "1e-6" }）；每条NMEA语句都能在pynmea2中解析且校验和有效，其解码得到的位置（{ "1.2e-3" } m，判据{ "5e-3" }）、高度、速度、航迹向（{ "5.0e-4" } deg，判据{ "1e-3" }）和时间均等于运动数值；UTC列等于独立的日期时间运算。所检查的CSV和NMEA精确字节的SHA-256已固定。不在检查范围：场景的真值轨迹本身（行驶剖面及其积分）；各项约定（航向是机体偏航角，而不是航迹向，在automotive-urban-canyon上与航迹向最多相差约{ "77" }度；GGA质量指示、卫星数和HDOP为占位值）；任何实验室模拟器是否按预期读取这些文件；任何模拟器或接收机的性能。这些参考基准检查的是换算和编码，而不是场景的物理。局部坐标系的处理仅通过速度旋转以及NMEA速度和航迹向来检查（CSV没有局部位置列）。

seg-ee99388f7b15 = compliance（kshana compliance-report）：仅按编号，将Kshana的输出映射到公共框架的条款，依据所给的运行填写；一项结果只有在携带该映射所指明的证据时才计为对某项能力的支持，空集不证明任何事情，措辞为“supports evidence for”；该报告不是任何框架已被满足的结论，也不是任何人作出的评级或批准。

seg-8659260fd38e = 参考文献依据对所引公共文档于2026-10-10读取并由脚本提取的标题索引进行核对（tests/compliance_references.rs）。检查范围：{ "49" }处所引条款、章节、段落或标题的引用存在于所引文档中，{ "7" }个所引URL在记录的日期可解析（其中{ "2" }个通过第二条途径）；负面对照均失败。不在检查范围：任何转述、映射或缺口是否正确；EN { "16803" }的条款（付费，仅有目录文本）；后续修订版；该索引不是独立实现。

seg-98c360d82d56 = 船舶集成：Signal K插件、OpenCPN门控数据流与评分面板、参考构建

seg-7af9ce566646 = 在Signal K服务器中发布于navigation.gnss.kshana之下的信任度、分级、原因、门控状态和接收机上报位置，并带有warn、alarm和normal通知（integrations/signalk）；经门控的NMEA数据流，在信任度崩溃时将定位标记为无效，并每个周期输出一条PKSHT语句，由门控自身或一个小型中继经TCP提供给OpenCPN，以及读取PKSHT语句的原生OpenCPN评分面板（integrations/opencpn）；还有运行该门控的systemd单元和容器（deploy/reference-build）。这些组件显示输出之处均带有咨询性声明：仅供参考的软件，不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }）：船舶航行的责任仍由操作人员承担。

seg-00a0f52f7458 = 检查范围，从窄表述：这些集成能够与其所针对的真实软件协同工作。证据已提交于integrations/signalk/evidence/README.md（含其JSON文件）和integrations/opencpn/evidence/README.md（含其截图和日志），并各附复现它的脚本。（{ "1" }）Signal K：插件加载到固定版本的signalk-server { "2.33.0" } npm包中，运行在仅限环回的私有网络命名空间内，输入合成数据。服务器自身的REST和WebSocket接口显示了所发布的路径、评分元数据，以及一条通知；当数据停止时，该通知依次经历缺失、warn、alarm、normal（保持时间之后）、再次warn。在由插件运行真实kshana、处理服务器自己收到的NMEA的情况下，通知先为warn后为alarm，并发布了上报的位置；服务器自身的navigation.position由其NMEA提供方写入，从不由插件写入。已对照实时JSON schema { "1.2" }重新运行。（{ "2" }）OpenCPN：插件依据OpenCPN插件API头文件和wxWidgets { "3.2.4" }构建，加载到虚拟显示下OpenCPN { "5.8.4" }的Ubuntu { "24.04" }软件包中；OpenCPN加载了它，运行了其初始化，并将经门控数据流的PKSHT语句交给它，面板在不受信任的分级上变为红色。在一次干净的运行中，当门控将定位标记为无效时，OpenCPN自身的本船位置停止更新，其定位指示灯也熄灭。第二次运行由门控的TCP监听器直接馈送，显示了向插件的传递，但没有得到干净的前后对比。（{ "3" }）中继测试通过真实的TCP套接字重放一段已记录的门控数据流摘录，并检查消费方收到的内容（字节不变，每条语句（包括被改写的语句）校验和有效，GGA与RMC一致，每个周期一条PKSHT，且在定位无效处带有门控字段），端到端脚本则检查门控监听器的消费方收到的字节，与同一门控写入标准输出的字节完全相同。（{ "4" }）PKSHT解析器（JavaScript和C++）在由kshana输出记录的语句上运行，并拒绝错误的校验和、版本或位于{ "0" }至{ "100" }之外的评分。（{ "5" }）systemd单元以systemd-analyze verify（systemd { "255" }，二进制文件为桩）检查，并带有针对ExecStart中的shell、重启策略和沙箱键的防护检查；容器入口点的参数处理以桩二进制文件检查。不在检查范围：这些集成所显示的任何数值都没有外部参考基准（oracle）。信任度数值本身即上面各行，而集成运行只表明这套管线能够传递它们；因此该行为MODELLED，而不是VALIDATED（docs/VALIDATION.md）。未使用真实船舶、接收机、长时间运行、任一宿主软件的其他版本、其他操作系统或桌面环境；所有数据均为合成文本，这里没有任何内容是测量结果。真实Signal K客户端对通知的声音和视觉处理、OpenCPN的工具栏按钮、首选项和陈旧状态，以及OpenCPN插件管理器的打包，均未试验。systemd沙箱键仅检查了语法，未在实际运行的systemd下运行，且容器镜像构建及其健康检查在此没有已提交的证据。不声称任何检测或虚警数据。仅供参考的软件，不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }）：船舶航行的责任仍由操作人员承担。

seg-475397d05dd0 = <s1>receiver_trust（实时：门控、其TCP监听器、PKSHT）；crate之外：integrations/signalk（JavaScript）、integrations/opencpn（JavaScript中继、C++ 原生插件）、deploy/reference-build（systemd单元、容器）</s1>

seg-89ab9ef155eb = BOC({ "1,1" }) 跟踪：DLL缩放与bump-jump模糊度解算（可选）

seg-ef24be9b5917 = iq::track::LoopConfig的boc字段（可选，默认为None）：将三种DLL鉴别器重新缩放，使其以码片为单位读出码误差，并在正弦BOC({ "1,1" }) 主峰上具有单位斜率；以及一个位于极早和极晚相关器上、间隔为一个副载波半周期（{ "0.5" }码片）的bump-jump监测器，当增减计数器达到N（默认{ "8" }）时，将码NCO向主峰跳变。不启用该选项时，所有输出均不变。

seg-416ce4dfc6f5 = 针对注入的真值和闭式解的内部自洽性，判据于6b68f6cc预先登记（docs/design/evidence/boc-bump-jump/）。由iq::scene生成的北斗B1C数据信号（PRN { "19" }，{ "5" } MS/s）：关闭该选项时，从旁瓣起步的跟踪仍错锁在预测的 ±({ "0.5" } + d/4) 码片处（实测 ±{ "0.549" }）；开启时，在{ "0.08" } s处向主峰跳变一次，后段窗口RMS在{ "45" } dB-Hz时为{ "0.0008" }码片，在{ "35" } dB-Hz时为{ "0.0048" }码片；在{ "35" }、{ "40" }和{ "45" } dB-Hz下，{ "4" } s内从主峰处无跳变；缩放后的EMLP斜率在采样信号上为{ "0.94" }至{ "0.99" }（未缩放为{ "3.6" }至{ "3.8" }）。仅bump-jump检测器，在具有精确BOC({ "1,1" }) 噪声协方差的相关器三元组上，在{ "25" }至{ "45" } dB-Hz的{ "100 000" }次更新中没有出现虚假跳变，并在{ "35" } dB-Hz下检测出{ "1000" }次旁瓣起步中的{ "1000" }次。NOT MET（发现F1）：缩放的预先登记单元测试网格包含超出鉴别器线性范围的偏移，其中缩放后的读数与偏移相差最多{ "48" } %。不在检查范围：现场IQ、带限前端、复合MBOC/QMBOC副本以及任何外部接收机。

seg-2c32955cbfb3 = 对照实测{ "50" } Hz GPS L1闪烁的IQ电离层闪烁信道（Cornell模型）

seg-2fdcb373ab25 = iq::channel::scint，即Cornell闪烁模型（Rice强度、二阶Butterworth谱、相位arg z），以实测窗口的S4和强度去相关时间驱动，并就其在这两个输入之外所生成的内容进行比较；realdata::scint50读取实测日志，去除趋势并运行该比较。

seg-bdc9fe963c5c = 实测数据，判据于b6ccb499预先登记（xval/scint-malindi/）：Zenodo记录{ "16941224" }（INGV，Malindi，{ "2023" }年3月{ "18" }日，GPS PRN { "26" }，{ "50" } Hz强度和载波相位，CC BY { "4.0" }，已核对SHA-256）。{ "22" }个合格的{ "60" } s窗口（N1达到）。MET：强度分布（Kolmogorov-Smirnov D为{ "0.0415" }，判据{ "0.05" }）以及与S4相关联的相位闪烁（实测/模型sigma-phi的中位数{ "0.779" }，判据2/3至3/2）。NOT MET（发现F1）：模型的深衰落占比为实测的{ "2.38" }倍（判据{ "0.5" }至{ "2" }），其平均衰落时长为实测的{ "3.51" }倍（判据2/3至3/2）。发现F2：登记的处理读取的是模型的缠绕相位，这一点由一次自检暴露；事后在相位解缠的情况下重复B3，得到{ "0.804" }。不在检查范围：其他夜晚、台站、纬度或信号；模型中的接收机噪声。该行仍为MODELLED。

seg-160507ac3702 = IQ捕获中的单元平均CFAR选项

seg-7c0a1adc9ae6 = iq::acq::ca_cfar和ca_cfar_cells（可选）：将捕获网格的一个单元与其多普勒行的参考单元均值（保护延迟和步进延迟，绕周期回卷）比较，所用因子alpha由M个非相干块的闭式CA-CFAR虚警概率（ca_cfar_pfa、ca_cfar_alpha）设定。采样功率检测器仍为默认，所有现有输出均不变。

seg-ba35daac2aed = 闭式解，判据于3724aefa预先登记（docs/design/evidence/acq-cfar/）。Gamma(M) 单元的CA-CFAR虚警概率，对照精确模型的蒙特卡罗：{ "18" }个用例中有{ "18" }个落在{ "3" }个二项sigma之内。在iq::acq搜索的每个单元上（GPS L1 C/A，{ "2.5" } MS/s，每次{ "210 000" }个单元），设计值为{ "1" } %：高斯噪声下为{ "0.977" } % 和{ "0.969" } %，2比特量化噪声下为{ "1.006" } % 和{ "0.999" } %（M = { "1" }和{ "4" }；判据为正负{ "20" } %）；输入被缩放时，判决不变。NOT MET（发现F1）：在无噪声的2比特信号上，检测及其单元均正确，但峰值所在行的非峰值单元中有{ "1.28" } %（判据{ "1" } %）超过门限，位于该码的确定性相关旁瓣处。不在检查范围：其他CFAR变体、二维窗口、带限前端、现场数据。

seg-5bd3bf0c22a7 = 频谱模型：GLONASS、北斗和Galileo E6频段（可选）

seg-9c16189c63ac = spectrum::default_band仅按名称（MORE_BAND_NAMES）解析：每个FDMA频道K = -7至{ "6" }上的GLONASS L1OF和L2OF（BPSK，{ "0.511" } Mchip/s），北斗B1I（BPSK({ "2" }))、B1C（MBOC(6,1,1/11)）、B2a和B3I（BPSK({ "10" }))，以及Galileo E6（BPSK({ "5" }))，其载波和最小接收功率取自各自的接口控制文件；默认频段集和所有现有输出均不变。

seg-6d674bc4b40a = 已发布的接口控制文件和闭式解，判据于5806f28b预先登记（docs/design/evidence/spectrum-bands/）：GLONASS ICD Edition { "5.1" }、BDS-SIS-ICD B1I { "3.0" }、B1C { "1.0" }、B2a { "1.0" }和B3I { "1.0" }、Galileo OS SIS ICD Issue { "2.1" }。MET：每个载波、码速率和接收功率均与转录值一致（{ "28" }个GLONASS频道），BPSK的第一零点位于码速率处，B1C复合信号等于其ICD功率表给出的MBOC(6,1,1/11)，C/N0路径恒等式成立，以及频谱场景逐字节一致。NOT MET：单位面积判据，按原文写法无法达到（发现F1；这些面积等于闭式的带内占比），以及IQ层的B1I和B1C波形与模型包络的逐频点一致性（{ "1.26" }和{ "1.56" } dB，判据为{ "0.5" } dB，发现F2；GLONASS为{ "0.07" } dB），原因是Gold码和Weil码的线谱不均匀；按频带平均，主瓣在{ "0.25" } dB之内一致。不在检查范围：记录的IQ、其他信号、系统内干扰。

seg-63b7da996265 = 对照独立生成器检验北斗B1I主测距码

seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits和b1i：截断为{ "2046" }个码片的BDS-SIS-ICD-B1I-3.0 Gold码，PRN { "1" }至{ "63" }，即IQ层生成、捕获和跟踪的码。

seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" }（标签{ "v0.0.19" }，提交1ddd4562），同一ICD的一个独立开源实现：其beidou_b1i_code_gen_int经单独编译后生成了全部{ "63" }个码。仅提交其程序输出：tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt，即64个码片的前缀以及每个2046码片码的SHA-256。该输出就是公开的BDS-SIS-ICD-B1I-3.0所定义的北斗B1I PRN码；仓库中不含GNSS-SDR的源代码或二进制文件。判据于911106d1预先登记（xval/beidou-b1i-gnss-sdr/）：全部{ "63" }个PRN的全部{ "2046" }个码片完全一致，无反相、移位或重新标号。结果：{ "63" }个中有{ "63" }个一致；该固定数据由全新的{ "v0.0.19" }检出重新生成（源文件SHA-256按所记录），并逐字节一致。不在检查范围：NH20二次码、GEO PRN列表、载波和码速率。

seg-b4787b04338e = 对照IS-GPS-800J印刷校验列检验GPS L1C测距码和叠加码

seg-708967246fd8 = iq::signals::gps::l1c_p_bits、l1c_d_bits和l1c_o_bits：L1CP和L1CD的Weil测距码（计算得到的Legendre序列、Weil索引、插在码片p之前的扩展序列）以及L1CO的S1叠加码，PRN { "1" }至{ "63" }。

seg-3f4bbdd3666b = IS-GPS-800J（01-AUG-2022，分发声明A），即其在生成器参数旁印出的校验列：表3.2-2中每个L1CP和L1CD码的起始和末尾{ "24" }个码片，表3.2-3中每个L1CO码的起始和末尾{ "11" }比特，表6.2-1中长度为10223的Legendre序列；由scripts/extract_is_gps_800_tables.py自PDF转录（SHA-256 c4aad710...）。判据于fe372e26预先登记（docs/design/evidence/l1c-codes/）：{ "252" }列中有{ "252" }列、{ "63" }个叠加码中有{ "63" }个、{ "10 223" }个Legendre比特中有{ "10 223" }个完全一致；提取的 --check通过；负面对照使重新标号、反相和移位的码均失败。不在检查范围：生成器参数本身（它们来自同样的表格）、印刷列之间的码片、TMBOC副载波图样以及L1CO的S2码。

seg-5cba09089e09 = 对照LSIS-AFS V1.0印刷校验列检验LunaNet AFS-I和AFS-Q主码

seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits和afs_q_primary_bits（kshana iq中的信号名为lunanet-afs-i和lunanet-afs-q）：AFS-I Gold码（{ "2047" }经短周期截断为{ "2046" }，G2按PRN延迟）和AFS-Q Weil主码（计算得到的Legendre序列、Weil索引、插在码片p之前的扩展序列），PRN { "1" }至{ "210" }。

seg-330ed84e8e78 = 对照LSIS-AFS V1.0印刷表格（规范中标注为TBC）：LunaNet Interoperability Specification V5，适用文件{ "1" }卷A：LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0，{ "2025" }年1月{ "29" }日（NASA；PDF SHA-256 { "986e0795" }...），即其在生成器参数旁印出的校验列：表C-1至C-5和D-2至D-6中每个AFS-I和AFS-Q码的起始和末尾{ "24" }个码片，表D-1中长度为10223的Legendre序列；由scripts/extract_lunanet_afs_tables.py提取（xval/lunanet-afs/oracle/）。判据于生成器存在之前在b3ba5d5预先登记（xval/lunanet-afs/PREREGISTRATION.md）：B1 { "420" }个中有{ "420" }个，B2一致，B3 { "420" }个中有{ "420" }个。该文件将其码表标注为{ "{" }LSIS-TBC{ "}" }，并说明这些码表仅用于测试和集成，因此这里验证的是该版本表格所对应的构造，而不是后续版本的。一项关于印刷的G2初始状态的预先登记声明（B1b）当初方向表述有误，为NOT MET（{ "210" }个中有{ "0" }个），已固定；更正后的关系（{ "2047" }减去延迟）在{ "210" }个中有{ "210" }个成立，并记录为事后结果。不在检查范围：生成器参数本身（同样来自这些表格）、印刷列之间的码片、三次码、电文层和LDPC编码。

seg-7b1ae0c7ca28 = 对照LSIS-AFS V1.0检验LunaNet AFS三次码与电文层（SB1 BCH、CRC-24Q、交织器）

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits、afs_q_tiered；iq::lunanet_afs：同步图样、SB1 BCH({ "51,8" }) 编码器与256假设解码器、CRC-24Q、{ "60" } x { "98" }分组交织器、符号流检查器（kshana lunanet-afs-check），以及带占位子帧的测试流生成器。子帧{ "2" }至{ "4" }的码率1/2 LDPC编码尚未实现（其矩阵位于另一附件中）。

seg-b6f39f180fdd = LSIS-AFS V1.0（同上）：长度为1499的Legendre序列（表E-1，一致），以及三次码的起始和末尾{ "24" }个码片（表E-2至E-6：{ "420" }列中有{ "419" }列一致；该文件为PRN { "147" }和PRN { "151" }印出了相同的末尾{ "24" }个码片A14850，而生成器复现的是PRN { "151" }的，因此PRN { "147" }条目很可能是印刷错误；{ "420" }个中有{ "420" }个的判据为NOT MET，该未达标已固定）；SB1码的图{ "8" }算例（一个算例：0x045编码为0x229F61DBB84A0）；对照目录校验值0xCDE703检验ASCII { "123456789" }的CRC-24Q；该文件自身的帧算术。判据于b3ba5d5预先登记。记录在案的有一处未达标，电文层只有一个算例，因此该行保持MODELLED。不在检查范围：LDPC及子帧{ "2" }至{ "4" }内的CRC字、电文内容以及任何已记录的数据流

seg-0d7b17524c04 = 标准包：对照运行前已声明的判据进行评分的场景

seg-6e5c04fd4531 = standards_pack（kshana standards-pack）：DHS Resilient PNT框架针对{ "1" }至{ "4" }级的测试配置、IMO MSC.1/Circ.1575精度等级与完好性评估，以及ICAO Doc { "9849" }附录F的监测、评估与缓解包：每项测试运行一种内置场景类型，并将结果字段与包中声明的判据比较，需要接收机日志的测试列为NEEDS INPUT，不予评分。

seg-d9ea966abdd6 = 场景结果没有外部参考基准：每项包内测试运行的都是MODELLED场景类型。判据是包作者声明的配置（DHS框架未给出数值；IMO精度限值为MSC.1/Circ.1575的表C-1，已通读；ICAO包依据ICAO自己的RFI Mitigation Plan演示文稿，因为Doc { "9849" }为付费出版物，未读），在任何评分运行之前，提交于standards/ 下xval风格的PREREGISTRATION.md文件中。MET的判据说明的是某个模型化场景达到了所声明的判据，与任何产品无关

seg-8a8f2c85e0c3 = 实验室往返证据包（场景、测试条件、接收机日志、评分）

seg-a090b06a920d = evidence::roundtrip（kshana evidence round-trip）以及kshana bench-export的kshana.test-conditions/1接收机日志导出：一个已签名的证据包，记录场景哈希、所声明条件的哈希、日志哈希以及对照所声明事件的评分，并拒绝与评分事件不一致的条件，或哈希不是所声明哈希的日志。不写入、重放或调度任何信号。

seg-76da58fe670a = 无外部参考基准：该证据包关联各哈希以及一项MODELLED的接收机日志评分，在合成数据上检查（将内置场景导出的NMEA视作接收机日志）。不声称进行过任何实验室运行

seg-a9189e4fe413 = 在独立录制数据上对照GNSS-SDR { "0.0.19" }检验IQ跟踪引擎

seg-364de05e5b1b = 完整的IQ层跟踪引擎（经kshana iq track使用iq::track：捕获交接、相关器、NCO、二阶{ "15" } Hz Costas PLL、一阶{ "2" } Hz载波辅助EML包络DLL、锁定指示器和C/N0估计器），用于{ "30" }至{ "45" } dB-Hz的GPS L1 C/A。

seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" }（GPL-3.0-or-later，Ubuntu { "24.04" }软件包，作为单独的程序运行；仅提交推导出的数值）跟踪相同的numpy录制数据（独立于引擎），两者均对照解析真值衡量。判据于48edd4a5预先登记，并在任何测试录制之前于1e4288c4修订（仅在牵引阶段，两台接收机均使用{ "10" } Hz FLL，原因是登记的标定因GNSS-SDR的交接有误而失败，发现F3）。在{ "30" }、{ "35" }、{ "40" }和{ "45" } dB-Hz下均为MET：载波抖动在GNSS-SDR的{ "4.3" } % 之内，码抖动在{ "4.6" } % 之内，多普勒的均值与离散度在GNSS-SDR的范围之内。NOT MET：引擎的NWPR C/N0比GNSS-SDR的SNV低{ "2.3" }至{ "7.1" } dB（发现F4，即已知的NWPR局限；其M2M4与真值相差在{ "0.06" } dB之内）；相位锁定指示器因定义不同而不同（F5）；在{ "30" } dB-Hz下GNSS-SDR发生了两次周跳而引擎没有（F6）。GNSS-SDR自身的交接在{ "30" }次标定运行中有{ "3" }次锁定到错误的频率。不在检查范围：其他信号、数据比特剥离、重新捕获、现场录制数据。该行仍为MODELLED。

seg-259d201c2ff8 = 对照独立numpy重新计算检验压制干扰类型中的CRPA天线增益

seg-192144c57783 = 压制干扰类型的可选 [crpa] 段：对每颗卫星的逐通道波束（以干扰源为零陷的零陷转向，或基于sigma^{ "2" } I + P_j a_j a_j^H的MVDR），在现有的抗干扰C/N0公式之前，以 ||w||^{ "2" }缩放每条链路的噪声，并以 |w^H a_j|^{ "2" }缩放干扰。

seg-232d040b575d = 对压制干扰演示几何的每条链路，在4单元方阵、两种加权下，做独立的numpy重新计算（xval/crpa-jamming/oracle.py，不共享代码：numpy导向矢量、numpy.linalg.solve和inv）。判据于08d83b4d预先登记。MET：A1（不含该段时，全部{ "150" }个场景结果逐字节一致，经一次修复后：首个构建曾在每次压制干扰运行的单位表中加入了crpa单位），A2（单个阵元与无阵列相等，精确到{ "1e-12" } dB），A3的阵列噪声增益和有效C/N0（{ "912" }个链路加权在{ "1e-9" } dB之内，最差{ "2.1e-14" } dB）以及零陷转向的干扰零陷（两侧均低于 -200 dB），A4（在JNR为{ "80" } dB时，MVDR与零陷转向相差在{ "0.1" } dB之内）。NOT MET：A3的MVDR干扰增益，在{ "0.36" }可移植数学库下，{ "456" }条链路中有{ "194" }条超过{ "1e-9" } dB（在宿主数学库下为{ "202" }条；docs/revisions/STUDIO15-batch4-rebaseline.md）（最差{ "1.7e-6" } dB），残差为 -100至 -188 dB，此处float64的相消限制了两种实现（numpy的inv和solve在{ "169" }条链路上彼此不一致，最差{ "7.9e-7" } dB）；由此产生的有效C/N0不受影响。不在检查范围：互耦、阵元失配、宽带处理、多个干扰源、任何天线硬件。这是对同一组公式的重新计算，不是外部参考基准；该行保持MODELLED。

seg-a2f34cff9338 = 在真实SRTM图幅上，对照独立numpy重新计算检验压制干扰类型中干扰源的地形遮蔽

seg-334c569d9cae = 压制干扰类型的可选 [terrain] 段：在SRTM .hgt图幅上取干扰源与接收机之间的大圆地形剖面，含k因子地球隆起，取主导刃形边缘（最大的Fresnel-Kirchhoff nu）以及ITU-R P.526-15第{ "4.1" }节的单刃损耗，并从干扰源的接收功率中扣除。

seg-615ea67dd756 = 针对位于Badwater Basin的一台接收机周围十个干扰源布置，在已提交的真实SRTM图幅tests/fixtures/terrain/N36W117_sub6.hgt上做独立的numpy重新计算（xval/jamming-terrain/oracle.py，不共享代码：自有的 .hgt读取、双线性插值、WGS { "84" }往返、剖面、隆起、nu和J(nu)）。判据与布置于92cd2bfd预先登记。全部MET：可加性（不含该段时，全部{ "150" }个场景结果逐字节一致）；每个布置的剖面点和障碍物相等，nu与损耗在{ "1.6e-10" }之内（判据{ "1e-9" }）；干扰源高度从{ "2" }升到{ "4902" } m时，损耗从不上升；该损耗使每个J/S恰好降低其自身大小，不影响其他量；J(nu) 与参考基准相差在{ "1e-12" } dB之内。发现：跨越Black和Funeral山脉的布置损耗{ "44" }至{ "48" } dB；两个谷底布置在{ "2" } m天线高度下，仅地球隆起就分别损耗{ "8" }和{ "15" } dB，这是单刃模型的掠射情形。不在检查范围：任何实测传播、多刃衍射、地面反射、杂波、DEM自身的误差。这是对同一模型的重新计算，不是外部参考基准；该行保持MODELLED。

seg-825c121c7512 = 对照独立重新计算检验压制干扰类型中的捕获迟滞与前端量化器

seg-f7207263d881 = 压制干扰类型的可选 [acquisition] 段（卫星在重新捕获延迟之后，于不低于捕获门限时被捕获，并在不低于跟踪门限时保持）与 [front_end] 段（AGC读数{ "10" } log10({ "1" } + J/N)，以及ADC的高斯输入量化损耗，两者从每条链路中扣除，并标注对非高斯干扰源无效）。

seg-6abc60ee9ec4 = 依据引擎逐历元的有效C/N0，对每个捕获标志做独立的Python重新计算（xval/jamming-acq-agc/hysteresis.py）；对量化损耗做独立的numpy蒙特卡罗（xval/jamming-acq-agc/quantiser_mc.py，自有的最优步长搜索，{ "2" }^{ "22" }个样本）；以及IQ层的AGC环路。判据于70c72fcc预先登记，另有一组补充运行，种子为{ "37793290" }。MET：可加性（不含这些段时，全部{ "150" }个场景结果逐字节一致）；补充运行中每个标志均相等（{ "1824" }条链路，其中{ "732" }条表现出迟滞）；对门限单调；量化损耗在{ "1" }至{ "4" }比特下与蒙特卡罗相差在{ "0.0007" } dB之内（判据{ "0.02" } dB）；AGC读数与AGC环路相差在{ "0.012" } dB之内（判据{ "0.05" } dB）。NOT MET：登记的迟滞运行（{ "10" }至{ "30" } dBW下的jamming-demo）没有信息量，所有链路均已丢失，其H2和H4仅是平凡地达到。发现：对于CW干扰源，1比特ADC比引擎所用的高斯数值多损耗约{ "5" } dB，并被标注为无效。不在检查范围：捕获搜索本身、AGC的时间动态、任何接收机硬件。这是对同一模型的重新计算，不是外部参考基准；该行保持MODELLED。

seg-9c46f1c76486 = 低于默认设计FLL到PLL交接下限的封顶FLL牵引（可选）

seg-efa1d1a9e904 = iq::track的可选carrier.fll_pull_in_max_s（iq::track::LoopConfig的fll_pull_in_max_s字段）：在fll_assist = pull-in下，无论PLI如何，FLL都在固定的牵引时间之后交接给PLL，并带有一段对应的返回驻留，直到PLI首次达到fll_off_pli。

seg-76cce58eaddd = 针对注入真值的内部自洽性：一个无数据的合成GPS L1 C/A信号源（PRN { "13" }，{ "1500" } Hz，{ "4.1" } MHz，{ "8" } s，十个噪声种子），其载波相位已知，判据于58789af0预先登记（docs/design/evidence/fll-handover-floor/）。MET：对照（不封顶的默认设置在{ "33" } dB-Hz下，{ "10" }个种子中有{ "9" }个从不交接）；可加性（默认哈希及现有跟踪测试不变）；在{ "45" } dB-Hz下对偏差{ "100" } Hz的交接的牵引。NOT MET：在{ "1.0" } s封顶下，每次运行都实现交接并保持（{ "33" } dB-Hz下{ "20" }次中有{ "16" }次，{ "31" } dB-Hz下{ "20" }次中有{ "8" }次；其余在强制交接与FLL返回之间循环），且相位抖动在单独PLL的{ "25" } % 之内（{ "33" } dB-Hz下为{ "10.8" }度对{ "6.1" }度）。不在检查范围：数据比特、其他信号和采样率、现场录制数据。默认设置不变；该行保持MODELLED。

seg-ac0f97e945a7 = 用于receiver-trust的RTKLIB .pos解文件读取器

seg-0b8bc2c89de4 = 将RTKLIB解文件（日历或GPS周/TOW时间、纬度/经度或ECEF位置、所用卫星数）读入receiver-trust时间线（receiver_trust::machines::rtklib）。

seg-3de364392f92 = 无外部参考基准：未读取任何RTKLIB生成的文件，列布局来自RTKLIB手册。仅在自行编写的文件上检查；ECEF转换复用frames::ecef_to_geodetic，后者有自己的行

seg-849393517c04 = 用于receiver-trust的NovAtel OEM7 ASCII与二进制日志（BESTPOS、RANGE、RXSTATUS）

seg-7e0021922025 = 从ASCII和二进制OEM7日志中读取BESTPOS（位置）、RANGE（每个信号的C/No）和RXSTATUS（接收机的干扰标志，作为该历元的自报告），带CRC检查，只读（receiver_trust::machines::novatel）。

seg-1f7c6d1009a8 = 作为通过判据，没有外部参考基准。字段布局和CRC遵循公开的OEM7文档（docs.novatel.com）；CRC例程曾对照文档为其BESTPOSA示例所给出的CRC检查过一次（仅引用，未摘录）。测试数据为自行编写；未读取任何真实接收机的日志

seg-a45c53a9deb3 = 用于receiver-trust的RTCM { "3" } MSM4和MSM7载噪比读取器

seg-0a0c9976236f = 从帧流中读取RTCM { "3" } MSM4和MSM7消息（GPS、GLONASS、Galileo、SBAS、QZSS、北斗、NavIC）每个信号单元的C/N0，带CRC-24Q检查（receiver_trust::machines::rtcm3）。布局来自BSD许可的pyrtcm表格，而不是RTCM标准文本。

seg-2af6fc1abe98 = 一次性检查中的ReferenceImpl，而不是套件中的测试：pyrtcm { "1.2.0" }的解码器读取同样自行编写的帧，得到相同的C/N0和历元时间。它与本读取器共享表格来源，因此检查的是比特处理，而不是布局。未读取任何来自真实接收机或基站的采集数据

seg-cd554a7c1649 = 用于receiver-trust的GNSS-SDR监测适配器

seg-22b587ac642d = 读取GNSS-SDR Monitor（Gnss_Synchro）和PVT监测消息（以proto字段名转发为JSON行），得到逐通道的C/N0、定位、所用卫星数、HDOP和天空图（receiver_trust::machines::gnss_sdr；integrations/gnss-sdr/relay.py）。

seg-d22aed9d9a16 = 无外部参考基准：字段名来自GNSS-SDR文档；读取器和relay.py均未对照实时GNSS-SDR或真实采集数据运行过

seg-217e5953c128 = IMU日志导入、陀螺航向输入，以及混合传感器参数的Allan拟合

seg-9dadc819daef = 读取IMU CSV（文档化的列，或EuRoC布局）；将偏航角速率积分为航向-航迹监测器所读取的航向（[log.imu]）；并通过重叠阿伦偏差，由静止日志拟合混合与融合场景的加速度计和陀螺噪声参数（imu-fit）。

seg-9099f3467e9e = 无外部参考基准：拟合在系数已知的合成白噪声日志上检查，航向在恒定偏航角速率日志上检查。未拟合任何真实IMU日志，且q_aa未被拟合

seg-15a852a2dcb0 = 用于信任遥测的Home Assistant MQTT发现与状态导出器

seg-6d6b07b26966 = 一份JSON状态文档和Home Assistant MQTT发现消息，用于信任数据流；在所有界面上以文本打印，并由命令行通过MQTT { "3.1.1" } QoS { "0" }发布（telemetry::mqtt；trust-telemetry --mqtt-tcp、--print-mqtt、format mqtt）。

seg-79a8f3864af3 = 无外部参考基准：数据包由为该测试编写的环回监听器读取，而不是由真实代理读取，也未运行Home Assistant

seg-68caf86157c2 = ROS { "2" } receiver-trust包与gnss_lib_py桥接

seg-e7d7d99fe538 = 一个不依赖ROS的桥接，将定位和卫星消息写成NMEA，并通过Python绑定评分（integrations/ros2/kshana_trust），以及一个经由rtklib-pos格式将gnss_lib_py NavData接入receiver-trust的桥接（integrations/gnss_lib_py）。

seg-05ded40b17d2 = 无外部参考基准：ROS节点未在实时ROS { "2" }图上运行，ublox_ubx_msgs的字段名也未对照正在运行的驱动程序检查。桥接测试运行了gnss_lib_py（MIT）

seg-6eee4b0e40b9 = <s1>上一页</s1>验证矩阵

seg-c3e7639ccf1a = <s1>下一页</s1>为何各行保持为由模型计算得出
