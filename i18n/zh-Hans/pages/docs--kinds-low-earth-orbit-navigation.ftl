# docs--kinds-low-earth-orbit-navigation: translations (zh-Hans)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = 类别

seg-867f3e41b5ab = LEO 导航电文：低地球轨道（LEO）定位、导航与授时卫星的广播星历与钟，适用于任意轨道、载波和模型，并带可选的命名预设（Xona Pulsar、Iridium、Starlink、CentiSpace、一个具代表性的 C 波段系统、ATOMIC 零钟模型、Celeste IOD）。内容：辅助数据（SVID、数据期号、频段、信号健康状态）、同步（周、周内时、关于 toc 的二阶钟多项式 af0-af2）、四种模型之一的星历——Galileo OS SIS ICD 16 参数开普勒集；该集加沿迹、横向与径向修正多项式；Liu 等 { "2025" } 22 参数模型；不含钟项的 ECEF 多项式（ATOMIC 零钟）——以及其他服务（Klobuchar 广播集、带有效电离水平的 NeQuick-G ai0-ai2，以及依 ICD 闰秒逻辑的系统时到 UTC 参数）。拟合器：用 J2-J6 带谐项或 EGM2008 引力（取到所选阶数）加阻力积分出的真值轨道，以及带随机种子的自由或受控钟；对非奇异根数做 Levenberg-Marquardt 拟合开普勒集，再做线性最小二乘修正多项式；钟的拟合扣除用户加入的相对论项。分析：fit-interval-trade（信号在空间中的测距误差，SISRE，采用该轨道高度的全球平均权重，随拟合区间与更新周期变化，仅轨道与含钟两种情形）、model-comparison（四种模型、参数个数、编码比特数，以及 Kshana 在 Liu 等所用高度上的拟合结果与已发表数值并列）、midpass-update（用户上空最高的一次过境、每次电文切换的位置、钟与用户测距跳变、最差几何下的跳变、对照连续性阈值的 PASS/FAIL）、encode-decode（Kshana 自己记录在案的带 CRC-24Q 的二进制帧、逐字段的半步量化预算、损坏帧检查、标注为 Kshana 扩展的 RINEX-4 风格记录导出与导入，以及 CSV 表）。VALIDATED：SISRE 权重对照已发表的 MEO/GEO 表（Montenbruck 等 { "2018" }）；Galileo 用户算法对照 RTKLIB 在真实 Galileo 广播星历上的结果；CRC-24Q 对照其目录校验值与 RTCM { "1005" } 示例帧。MODELLED：每个拟合与 SISRE 数值都是相对于 Kshana 积分所得真值的表示误差（不含定轨或预报误差）；与 Liu 等的比较所用轨道不同；编码与文本格式是 Kshana 自己的。

seg-35e92abc6a23 = 引擎为 scenarios/leo-navmsg-celeste-iod.toml（类型 leo-navmsg）生成的图表

seg-c3861f7d717c = 面向 LEO-PNT（低地球轨道的定位、导航与授时）、与具体系统无关的 LEO 过境与逐频段链路预算：一个用户（地面、海上、空中或室内，静止或运动）与一颗或多颗 LEO 卫星，卫星来源为设计过境（轨道为圆轨道，布置成使用户在所选时刻看到一次所选最大仰角的过境，如有要求则为太阳同步）、显式轨道根数、经引擎 SGP4 的 TLE（两行根数）、或由星座设计代码构建的 Walker 星座（报告最高的若干次过境）。频段来自命名预设（通用多频段 UHF/L/S/C、通用 C 波段、Xona Pulsar X1/X5、Iridium STL、仅作多普勒机会信号使用的 Starlink、CentiSpace，以及标记为 WORKSHOP 的可选 Celeste IOD 预设）或直接写入场景；每个预设都说明其数值是 PUBLIC（附 URL）、REPRESENTATIVE 还是 WORKSHOP。对每颗卫星、每个频段和每个历元：仰角、方位角、距离、距离变化率和距离加速度；自由空间路径损耗；EIRP 与卫星方向图增益（等通量、高斯波束或平坦）；用户天线随仰角变化的增益（贴片、半球或各向同性）；气体衰减（ITU-R P.676-10 Annex { "2" }）、雨衰（ITU-R P.838-3 系数与 P.618-14 流程，依据降雨率和雨高）、对流层闪烁（ITU-R P.618-14 第 { "2.4.1" } 节）、室内用户的建筑物穿透损耗（ITU-R P.2109-2）、极化失配、系统噪声温度与 C/N0（载噪密度比）；由距离变化率和距离加速度得出的闭式多普勒与多普勒变化率，各自对照中心差分检查；一阶电离层延迟 { "40.3" } STEC/f^{ "2" }，由 Klobuchar 或垂直 TEC 的斜向 TEC 换算到卫星以下的那部分电离层。成对的频段给出无电离层组合系数、噪声放大和过境峰值处的码噪声。MEO GNSS 卫星（Galileo 或 GPS 预设）根据其接口文件中的接收功率，以相同的天线和噪声模型评估，因此 LEO 钟形过境与平坦的 GNSS 载波共用一张图。可选的 [iot] 部分给出在所述接收机功率预算下，首次定位时间、每次定位的能量以及随占空比变化的电池寿命（MODELLED）。每个频段对还给出其几何无关组合在峰值处恢复出的斜向 TEC，以及该估计的码噪声 sigma（电离层探测）。可选的 [spoofer] 部分伪造一个声称位置的信号，该位置在起始之后相对真实位置跳变或被牵引，并运行两个带有所述虚警与漏检概率的监测器：多普勒与过境几何一致性（实测距离变化率对照由轨道以及独立的先验位置与速度所预测的值，在 GNSS、LEO 和全部通道上做窗口内的广义最小二乘卡方检验），以及跨频段一致性（每个 LEO 频段对经模型修正的几何无关组合逐历元的阶跃），报告逐历元统计量以及各监测器何时检出（MODELLED）。VALIDATED 的部分：自由空间损耗、对照其表 { "5" } 的 P.838-3 系数、对照 ITU-R Study Group { "3" } 验证示例的 P.618-14 雨衰与闪烁流程以及 P.2109 建筑物穿透损耗、IS-GPS-200 的 L1/L2 群延迟比，以及对照 arXiv { "2509.19551" } 表 { "1" } 的圆轨道静止用户最大多普勒。MODELLED：EIRP、方向图、卫星以下 TEC 的 Chapman 比例以及整个过境。

seg-02ae51cfada6 = 引擎为 scenarios/leo-pass-iridium.toml（类型 leo-pass）生成的图表

seg-81d1604171a5 = 端到端的一个 LEO-PNT（低地球轨道的定位、导航与授时）系统，适用于任意星座与信号：由 signal_design 指定的 leo-signal 设计（公开预设或内联 [signal] 设计）设定 [pass] 频段的中心频率、带宽、码速率和 EIRP 分配，leo-pass 链路预算给出过境期间被跟踪的 C/N0 与带限码抖动，sin(仰角) 的 C/N0 直线以及 [navmsg] 电文的广播 SISRE（在过境卫星的高度上拟合）输入 [fusion] leo-pvt 联合定位解中的每个 LEO 系统，并可选地输入 [ppp] leo-ppp 各案例；每次交接都列出其数值与单位。MODELLED。

seg-abe0599498c9 = 引擎为 scenarios/leo-pnt-end-to-end.toml（类型 leo-pnt-chain）生成的图表
