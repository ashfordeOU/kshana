# docs--kinds-low-earth-orbit-navigation: translations (zh-Hans)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = 类别

seg-867f3e41b5ab = LEO导航电文：低地球轨道（LEO）定位、导航与授时卫星的广播星历与钟，适用于任意轨道、载波和模型，并带可选的命名预设（Xona Pulsar、Iridium、Starlink、CentiSpace、一个具代表性的C波段系统、ATOMIC零钟模型、Celeste IOD）。内容：辅助数据（SVID、数据期号、频段、信号健康状态）、同步（周、周内时、关于toc的二阶钟多项式af0-af2）、四种模型之一的星历——Galileo OS SIS ICD 16参数开普勒集；该集加沿迹、横向与径向修正多项式；Liu等{ "2025" } 22参数模型；不含钟项的ECEF多项式（ATOMIC零钟）——以及其他服务（Klobuchar广播集、带有效电离水平的NeQuick-G ai0-ai2，以及依ICD闰秒逻辑的系统时到UTC参数）。拟合器：用J2-J6带谐项或EGM2008引力（取到所选阶数）加阻力积分出的真值轨道，以及带随机种子的自由或受控钟；对非奇异根数做Levenberg-Marquardt拟合开普勒集，再做线性最小二乘修正多项式；钟的拟合扣除用户加入的相对论项。分析：fit-interval-trade（信号在空间中的测距误差，SISRE，采用该轨道高度的全球平均权重，随拟合区间与更新周期变化，仅轨道与含钟两种情形）、model-comparison（四种模型、参数个数、编码比特数，以及Kshana在Liu等所用高度上的拟合结果与已发表数值并列）、midpass-update（用户上空最高的一次过境、每次电文切换的位置、钟与用户测距跳变、最差几何下的跳变、对照连续性阈值的PASS/FAIL）、encode-decode（Kshana自己记录在案的带CRC-24Q的二进制帧、逐字段的半步量化预算、损坏帧检查、标注为Kshana扩展的RINEX-4风格记录导出与导入，以及CSV表）。VALIDATED：SISRE权重对照已发表的MEO/GEO表（Montenbruck等{ "2018" }）；Galileo用户算法对照RTKLIB在真实Galileo广播星历上的结果；CRC-24Q对照其目录校验值与RTCM { "1005" }示例帧。MODELLED：每个拟合与SISRE数值都是相对于Kshana积分所得真值的表示误差（不含定轨或预报误差）；与Liu等的比较所用轨道不同；编码与文本格式是Kshana自己的。

seg-35e92abc6a23 = 引擎为scenarios/leo-navmsg-celeste-iod.toml（类型leo-navmsg）生成的图表

seg-c3861f7d717c = 面向LEO-PNT（低地球轨道的定位、导航与授时）、与具体系统无关的LEO过境与逐频段链路预算：一个用户（地面、海上、空中或室内，静止或运动）与一颗或多颗LEO卫星，卫星来源为 DESIGNED PASS（设计过境：轨道为圆轨道，布置成使用户在所选时刻看到一次所选最大仰角的过境，如有要求则为太阳同步）、显式轨道根数、经引擎SGP4的TLE（两行根数）、或由星座设计代码构建的Walker星座（报告最高的若干次过境）。频段来自命名预设（通用多频段UHF/L/S/C、通用C波段、Xona Pulsar X1/X5、Iridium STL、仅作多普勒机会信号使用的Starlink、CentiSpace，以及标记为WORKSHOP的可选Celeste IOD预设）或直接写入场景；每个预设都说明其数值是PUBLIC（附URL）、REPRESENTATIVE还是WORKSHOP。对每颗卫星、每个频段和每个历元：仰角、方位角、距离、距离变化率和距离加速度；自由空间路径损耗；EIRP与卫星方向图增益（等通量、高斯波束或平坦）；用户天线随仰角变化的增益（贴片、半球或各向同性）；气体衰减（ITU-R P.676-10 Annex { "2" }）、雨衰（ITU-R P.838-3系数与P.618-14流程，依据降雨率和雨高）、对流层闪烁（ITU-R P.618-14第{ "2.4.1" }节）、室内用户的建筑物穿透损耗（ITU-R P.2109-2）、极化失配、系统噪声温度与C/N0（载噪密度比）；由距离变化率和距离加速度得出的闭式多普勒与多普勒变化率，各自对照中心差分检查；一阶电离层延迟{ "40.3" } STEC/f^{ "2" }，由Klobuchar或垂直TEC的斜向TEC换算到卫星以下的那部分电离层。成对的频段给出无电离层组合系数、噪声放大和过境峰值处的码噪声。MEO GNSS卫星（Galileo或GPS预设）根据其接口文件中的接收功率，以相同的天线和噪声模型评估，因此LEO钟形过境与平坦的GNSS载波共用一张图。可选的 [iot] 部分给出在所述接收机功率预算下，首次定位时间、每次定位的能量以及随占空比变化的电池寿命（MODELLED）。每个频段对还给出其几何无关组合在峰值处恢复出的斜向TEC，以及该估计的码噪声sigma（电离层探测）。可选的 [spoofer] 部分伪造一个声称位置的信号，该位置在起始之后相对真实位置跳变或被牵引，并运行两个带有所述虚警与漏检概率的监测器：多普勒与过境几何一致性（实测距离变化率对照由轨道以及独立的先验位置与速度所预测的值，在GNSS、LEO和全部通道上做窗口内的广义最小二乘卡方检验），以及跨频段一致性（每个LEO频段对经模型修正的几何无关组合逐历元的阶跃），报告逐历元统计量以及各监测器何时检出（MODELLED）。VALIDATED的部分：自由空间损耗、对照其表{ "5" }的P.838-3系数、对照ITU-R Study Group { "3" }验证示例的P.618-14雨衰与闪烁流程以及P.2109建筑物穿透损耗、IS-GPS-200的L1/L2群延迟比，以及对照arXiv { "2509.19551" }表{ "1" }的圆轨道静止用户最大多普勒。MODELLED：EIRP、方向图、卫星以下TEC的Chapman比例以及整个过境。

seg-02ae51cfada6 = 引擎为scenarios/leo-pass-iridium.toml（类型leo-pass）生成的图表

seg-81d1604171a5 = 端到端的一个LEO-PNT（低地球轨道的定位、导航与授时）系统，适用于任意星座与信号：由signal_design指定的leo-signal设计（公开预设或内联 [signal] 设计）设定 [pass] 频段的中心频率、带宽、码速率和EIRP分配，leo-pass链路预算给出过境期间被跟踪的C/N0与带限码抖动，sin(仰角) 的C/N0直线以及 [navmsg] 电文的广播SISRE（在过境卫星的高度上拟合）输入 [fusion] leo-pvt联合定位解中的每个LEO系统，并可选地输入 [ppp] leo-ppp各案例；每次交接都列出其数值与单位。MODELLED。

seg-abe0599498c9 = 引擎为scenarios/leo-pnt-end-to-end.toml（类型leo-pnt-chain）生成的图表

seg-32a570f1a4fa = 仅用GNSS以及加入LEO增强的精密单点定位（PPP）收敛：对无电离层组合的码和载波相位采用浮点扩展卡尔曼滤波，状态包括静态测站坐标、白噪声接收机钟差、每增加一个系统对应一个系统间偏差、以1/sin(仰角) 映射的随机游走天顶湿延迟，以及每个卫星弧段一个浮点模糊度；精密轨道与钟差误差为白噪声，且同一颗卫星的码与相位共有该误差，因此每颗卫星都是一次采用Joseph稳定形式的相关两行更新。测量值由同一模型在多个测站和多个随机种子下以带种子的噪声模拟生成，每个情形（先是仅GNSS，然后是各个LEO系统的 [[case]]，可为任何星座或预设）报告收敛时间中位数（此后水平与垂直误差保持在阈值以下的第一个历元，默认{ "10" } cm）、已收敛的比例、误差曲线中位数以及滤波器一致性（多次运行平均的位置NEES对照双侧{ "95" }% 卡方区间）。可选地与已发表的Li等人（{ "2019" }，J. Geod. { "93" }:{ "749" }，doi 10.1007/s00190-018-1195-2）的中纬度数据并列给出：多系统GNSS为{ "9.6" }分钟，加入{ "60" }、{ "96" }、{ "192" }和{ "288" }颗LEO卫星后分别缩短为{ "7.0" }、{ "3.2" }、{ "2.1" }和{ "1.3" }分钟。MODELLED：这是对趋势的一致性比较，并非复现该研究的星座、噪声或测站；不含整周模糊度解算、周跳、相位缠绕、潮汐或时间相关的产品误差。

seg-225ef04c64af = 引擎为scenarios/leo-ppp-convergence.toml（类型leo-ppp）生成的图表

seg-093aac4b5ff1 = 融合中地球轨道（MEO）与低地球轨道（LEO）的定位、导航与授时（PNT），适用于任意星座：每个 [[system]] 可以是星座设计类型的GNSS预设、LEO预设（xona-pulsar、iridium-stl、starlink-sop、centispace、generic-c-band、atomic-zero-clock星历模型，或另一个预设文件，每个预设位于各自的文件中，其来源标注为PUBLIC、WORKSHOP或DERIVED）、Walker壳层或显式的轨道根数集，并带有载波、码片速率、从仰角截止角到天顶的载噪比密度（C/N0）包络、空间信号测距误差（SISRE）、多普勒标准差和时钟模型（自带接收机钟，因此系统间偏差需要估计，或采用已知的广播偏移）。共有四种模式。DOPPLER：基于距离变化率的批处理Gauss-Newton定位，带解析偏导数、钟漂和可选的速度状态以及可选的高程约束，可用单颗或多颗卫星，给出误差随窗口长度的变化、每个LEO系统的多普勒、多普勒变化率和加加速度包络，以及单次过境的沿轨与横轨精度随横轨偏移的变化（过境弧段经过头顶时横轨误差无限增大；单次过境还存在关于星下点轨迹对称的镜像解）。仅用多普勒的机会信号（starlink-sop）在此运行。JOINT：逐历元的加权最小二乘伪距定位，分别采用仅GNSS、仅LEO以及两者合用，各测量值的标准差取自C/N0下的延迟锁定环热噪声模型加上SISRE（或取固定标准差，以便由信号模型提供），并给出估计的系统间偏差，以及PDOP/HDOP/VDOP随加入的LEO卫星数的变化。POLAR：给出GNSS、LEO以及两者合用时，可见卫星数和DOP随纬度的变化。TIMING：用位置已知的LEO卫星向协调世界时（UTC）进行时间传递，采用双状态钟滤波器，其过程噪声来自引擎的振荡器等级，给出随C/N0和振荡器的变化，以及IS-GPS-200的系统时到UTC表达式；设置 [timing] trace = true时，每一行还报告其在每个历元的钟差及预测标准差。VALIDATED：一次从头顶到地平线的过境弧段的最大多普勒，对照已发表的Iridium（最高{ "36" } kHz）和Xona Pulsar X1（{ "32" }至{ "34" } kHz）数据。MODELLED：其余全部；DOP对照手工推导的算例检查，定位解对照其协方差检查，多普勒模型对照距离加速度恒等式检查。

seg-90361a6f4e3c = 引擎为scenarios/leo-pvt-fjord-skyline.toml（类型leo-pvt）生成的图表

seg-97b8d07150d4 = LEO-PNT信号设计：适用于任意系统、频段和结构的参数化低地球轨道（LEO）定位、导航与授时（PNT）信号。信号（SIGNAL）由一个频段（中心频率、发射带宽、ITU频率划分RNSS/RDSS/MSS/EESS/non-RNSS/other）和若干分量（捕获、数据、导频；可取任意子集）构成，每个分量各有调制方式（n可为分数的BPSK(n)、BOC(m,n)、MBOC({ "6,1" },p) 或类OFDM的平坦频带）、功率份额、可选的FDMA子载波偏移、码长和数据速率。信号来自编译内置的公开预设文件（xona-pulsar、iridium-stl、starlink-soo、centispace、generic-c-band、generic-bands；每个都附来源URL，且每个未公开的数值均标注为REPRESENTATIVE），或以内联方式书写。逐信号（PER SIGNAL）给出：带限功率谱密度，以及发射频带所通过的各分量功率的比例（BPSK闭式与数值并列），RMS（Gabor）带宽，延迟锁定环码跟踪热噪声抖动随C/N0和超前-滞后间距的变化（取自Betz & Kolodziejski { "2009" }的带限相干（或非相干）超前-滞后公式，并附其不限带宽的教科书形式及其间距趋于零时的Gabor界），以米计的测距精度，捕获搜索空间（由轨道最大多普勒加上振荡器和用户项得到的多普勒单元，乘以码单元），平方律检测概率以及串行和码并行的平均捕获时间，该信号对GPS L1 C/A、Galileo E1、GPS L5、Galileo E5a、E5b和E5 AltBOC的谱分离系数，以及上述各信号对该信号的谱分离系数及C/N0劣化，还有被跟踪分量可容忍的CW、宽带和匹配J/S，均取自频谱类型自身的SSC机制。频段权衡（BAND TRADE）：一阶电离层延迟（{ "40.3" } TEC/f^{ "2" }）、自由空间损耗、等C/N0和等EIRP下的测距精度，以及干扰机容限。可选的形状检查（SHAPE CHECKS）将设计的频谱与某次所述测量比对（MODELLED一致性）。VALIDATED：BPSK带内功率（主瓣内{ "90.3" } %）和Gabor带宽闭式，带限抖动可还原为教科书的相干超前-滞后形式及其Gabor界，偏移BPSK谱分离系数对照其Parseval闭式，AltBOC频谱的单位面积，以及LEO最大多普勒对照已发表的Xona Pulsar（32-34 kHz）和Iridium（{ "36" } kHz）数据。MODELLED：每一个设计、功率分配、C/N0和干扰机电平；EFQPSK、CSK和OFDM的频谱为近似。

seg-8bf45b6989d1 = 引擎为scenarios/leo-band-trade.toml（类型leo-signal）生成的图表

seg-4f0edb786a35 = 基于移动卫星业务（MSS）S频段5G非地面网络（NTN）下行链路的定位（3GPP n256频段，下行{ "2170" }至{ "2200" } MHz；默认载波{ "2172.5" } MHz）：到达时间的克拉默-拉奥界（CRB）c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T))，其中beta为平坦OFDM频谱的均方根（Gabor）带宽（B/sqrt({ "12" })），以及复单音多普勒的CRB sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" }))，分别针对每种信号（默认为占用{ "4.5" } MHz的{ "5" } MHz新空口信道，以及占用{ "180" } kHz的{ "200" } kHz窄带信道）；然后，在任意LEO星座上，对含未知接收机钟差的下行到达时间定位（带随机种子，以该界加网络同步误差作为sigma）、其PDOP与形式3D sigma，以及在保持高度的条件下对最长过境弧段的单卫星多普勒定位。MODELLED：从带宽到界的这一步是教科书式的闭式解，已与平坦及带限BPSK频谱的数值积分核对（内部自洽，没有固定任何已发表的算例数值），而定位精度是在无多径信道、带明确给定同步误差下的一个界，不是已取得的结果。

seg-c200240dd65e = 引擎为scenarios/ntn-5g-positioning.toml（类型ntn-positioning）绘制的图表

seg-4e31c8daf798 = 台账

seg-6800289a282d = { "7" }个场景类型，来自引擎v{ $version }。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为MODELLED（标签如何获得，见README的“证据”一节）。

seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-22eb3a688624 = 来源：<c1/>

seg-561a783e9516 = 低地球轨道导航（场景类型族）

seg-47751d798019 = 专题页面：<a1>LEO-PNT</a1>、<a2>LEO-SIGNAL</a2>、<a3>LEO-PASS</a3>、<a4>LEO-NAVMSG</a4>。运行一个：<c1/>。所有类型族：<a5>KINDS.md</a5>。

seg-4867ae5d108b = 引擎为“低地球轨道导航”类型族的各类型生成的图表缩略总览

seg-1e724b481e67 = LEO-PNT信号设计：适用于任意系统、频段和结构的参数化低地球轨道（LEO）定位、导航与授时（PNT）信号。

seg-82ad7da67939 = LEO过境与链路预算，逐频段，面向LEO-PNT（来自低地球轨道的定位、导航与授时），与具体系统无关：一个用户（地面、海上、空中或室内，静止或运动）以及一个或多

seg-3f28c23605a4 = MODELLED { "7" } · VALIDATED { "5" }

seg-c20a76308fb3 = LEO导航电文：低地球轨道（LEO）定位、导航与授时卫星的广播星历和时钟，适用于任意轨道、载波和模型，带可选的具名预设（Xona P

seg-04fdaadf1cba = MODELLED { "5" } · VALIDATED { "6" }

seg-06236b581684 = 对任意星座的中地球轨道（MEO）与低地球轨道（LEO）融合定位、导航与授时（PNT）：每个 [[system]] 是constellation-design类型的一个GNSS预设、一个LEO预

seg-d9e5f4726bbb = 仅用GNSS以及加入LEO增强的精密单点定位（PPP）收敛：对无电离层组合的码和载波相位以及静态站坐标运行浮点扩展卡尔曼滤波器，一个

seg-44f4148f4a5f = 利用移动卫星服务（MSS）S波段中的5G非地面网络（NTN）下行链路定位（3GPP频段n256，下行{ "2170" }至{ "2200" } MHz；默认载波{ "2172.5" } MHz）：克拉美-罗界

seg-1ee838a551ef = 端到端的一个LEO-PNT（来自低地球轨道的定位、导航与授时）系统，适用于任意星座和信号：由signal_design指名的leo-signal设计（公开预设或内联 [s

seg-70d1ac6ddc95 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>。

seg-472d9e86ee20 = <b>台账：</b>MODELLED { "2" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>leo-signal</a1>。

seg-17d1c06ba5c5 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>。

seg-9a7671c30d7e = <b>台账：</b>MODELLED { "7" } · VALIDATED { "5" }。完整页面（含输入、结果、证据与局限）：<a1>leo-pass</a1>。

seg-cba2c7f7050a = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>。

seg-7ba3e667487d = <b>台账：</b>MODELLED { "5" } · VALIDATED { "6" }。完整页面（含输入、结果、证据与局限）：<a1>leo-navmsg</a1>。

seg-8ca53a87d092 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>。

seg-389c67090de1 = <b>台账：</b>MODELLED { "3" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>leo-pvt</a1>。

seg-e004092d6056 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>。

seg-e485df9372e6 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>leo-ppp</a1>。

seg-089266c42199 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>。

seg-e0a3133f468f = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>ntn-positioning</a1>。

seg-ea759d0040db = 必填字段：<c1/>、<c2/>、<c3/>。可选字段：<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>。

seg-db08b7916378 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>leo-pnt-chain</a1>。

seg-534d13455a76 = <s1>上一页</s1>压制干扰、欺骗干扰与频谱

seg-ec3fb19fb5bd = <s1>下一页</s1>月球与地月空间
