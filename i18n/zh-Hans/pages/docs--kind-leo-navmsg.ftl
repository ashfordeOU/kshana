# docs--kind-leo-navmsg: translations (zh-Hans)

seg-debc2f07db78 = true

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = 有 { "5" } 个内置场景使用该类型；其余见<a1><c1/></a1>。

seg-648c27220789 = 来源：<c1/>

seg-087287602b47 = <c1/>（场景类型）

seg-49964654d5f4 = 引擎 v{ $version } 的场景类型，所属系列为<a1>近地轨道导航</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-867f3e41b5ab = LEO 导航电文：低地球轨道（LEO）定位、导航与授时卫星的广播星历与钟，适用于任意轨道、载波和模型，并带可选的命名预设（Xona Pulsar、Iridium、Starlink、CentiSpace、一个具代表性的 C 波段系统、ATOMIC 零钟模型、Celeste IOD）。内容：辅助数据（SVID、数据期号、频段、信号健康状态）、同步（周、周内时、关于 toc 的二阶钟多项式 af0-af2）、四种模型之一的星历——Galileo OS SIS ICD 16 参数开普勒集；该集加沿迹、横向与径向修正多项式；Liu 等 { "2025" } 22 参数模型；不含钟项的 ECEF 多项式（ATOMIC 零钟）——以及其他服务（Klobuchar 广播集、带有效电离水平的 NeQuick-G ai0-ai2，以及依 ICD 闰秒逻辑的系统时到 UTC 参数）。拟合器：用 J2-J6 带谐项或 EGM2008 引力（取到所选阶数）加阻力积分出的真值轨道，以及带随机种子的自由或受控钟；对非奇异根数做 Levenberg-Marquardt 拟合开普勒集，再做线性最小二乘修正多项式；钟的拟合扣除用户加入的相对论项。分析：fit-interval-trade（信号在空间中的测距误差，SISRE，采用该轨道高度的全球平均权重，随拟合区间与更新周期变化，仅轨道与含钟两种情形）、model-comparison（四种模型、参数个数、编码比特数，以及 Kshana 在 Liu 等所用高度上的拟合结果与已发表数值并列）、midpass-update（用户上空最高的一次过境、每次电文切换的位置、钟与用户测距跳变、最差几何下的跳变、对照连续性阈值的 PASS/FAIL）、encode-decode（Kshana 自己记录在案的带 CRC-24Q 的二进制帧、逐字段的半步量化预算、损坏帧检查、标注为 Kshana 扩展的 RINEX-4 风格记录导出与导入，以及 CSV 表）。VALIDATED：SISRE 权重对照已发表的 MEO/GEO 表（Montenbruck 等 { "2018" }）；Galileo 用户算法对照 RTKLIB 在真实 Galileo 广播星历上的结果；CRC-24Q 对照其目录校验值与 RTCM { "1005" } 示例帧。MODELLED：每个拟合与 SISRE 数值都是相对于 Kshana 积分所得真值的表示误差（不含定轨或预报误差）；与 Liu 等的比较所用轨道不同；编码与文本格式是 Kshana 自己的。

seg-e5a4f0290e9e = <c1/> 的一次运行汇总为：LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m The 16-parameter Keplerian set degrades from { "0.0003" } m at { "60" } s to { "0.1073" } m at { "900" } s: one Keplerian set with twice-per-revolution harmonics cannot follow the higher-frequency gravity terms and the drag of a LEO arc for more than a few minutes, and its least-squares residual oscillates across the window. The along/cross/radial polynomials, of higher degree than the Keplerian set spans, absorb what is left, giving { "0.0388" } m at { "900" } s.

seg-3f299f6b20c8 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>

seg-3adfcd7e275c = 示例 <c1/> 设置了以下内容等：

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Celeste IOD 报文（workshop 预设）

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bit

seg-fb689f03361c = byte

seg-c60901596100 = 引擎给出的结果标签：MIXED — 构件为 VALIDATED，结果为 MODELLED。SISRE 权重复现已发表的 MEO/GEO 表（Montenbruck 等 { "2018" }），Galileo ICD 用户算法在真实 Galileo 广播星历上复现 RTKLIB，CRC-24Q 复现其目录校验值与 RTCM { "1005" } 示例帧

seg-35e92abc6a23 = 引擎为 scenarios/leo-navmsg-celeste-iod.toml（类型 leo-navmsg）生成的图表

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }：点名该类型的<a1>验证矩阵</a1>行。

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights：径向权重 w_R 与横向权重平方 w_AC^{ "2" }，分别为视线天底角的 cos^{ "2" } 与 sin^{ "2" } 之半在均匀分布于仰角之上可见地球帽的用户上的平均值

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point：Galileo OS SIS ICD 开普勒求值（开普勒方程、二次谐波修正、地固升交点），与引擎的 RINEX 求值器分开编写，返回位置及其幅角 测试：<a1>leo_navmsg_reference.rs</a1>。

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q：生成多项式 0x1864CFB，初值 { "0" }，无反射，无最终异或，Kshana LEO 帧对其之前每个字节所携带的校验

seg-2b24c2669c23 = <b>VALIDATED</b> <c1/> 类型的拟合器与权衡：用 J2-J6 带谐项或 EGM2008 引力（取到所选阶数）加阻力积分出的真值轨道，以及带随机种子的自由或受控钟；对非奇异根数做 Levenberg-Marquardt 拟合 Galileo 开普勒集

seg-ddb27b07b9af = 矩阵中另有 { "7" } 项。

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights：径向权重 w_R 与横向权重平方 w_AC^{ "2" }，分别为视线天底角的 cos^{ "2" } 与 sin^{ "2" } 之半在。参考基准（oracle，ExternalDataset）：Montenbruck、Steigenberger 与 Hauschild（{ "2018" }）已发表的 SISRE 权重因子表，Multi-GNSS signal-in-space range error assessment - Methodology and results，Advances in Space Research { "61" }({ "12" }):3020-3038，doi 10.1016/j.asr.2018.03.041：GPS { "0.98" } 与 1/49，GLONASS { "0.98" } 与 1/45，Galileo { "0.98" } 与 1/61，BeiDou MEO { "0.98" } 与 1/54，BeiDou IGSO/GEO { "0.99" } 与 1/126。在 LEO 半径处计算同一平均值得到

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point：Galileo OS SIS ICD 开普勒求值（开普勒方程、二次谐波修正、地固升交点），分开编写。参考基准（oracle，ExternalDataset）：RTKLIB 2.4.2-p13 eph2pos 的 ECEF 位置（同一 ICD 算法的独立实现），针对 2024-09-10 的真实 BKG/IGS 广播记录，两者均连同来源出处提交于 tests/fixtures/rinex_sp3_interop（NOTICE、rinex_ecef_reference.txt、brdc_multignss_slice.rnx）。这验证的是开普勒用户算法；在其上叠加的沿迹/横向/径向修正由各自的行覆盖，而 Liu 项 b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q：生成多项式 0x1864CFB，初值 { "0" }，无反射，无最终异或，Kshana LEO 帧对其之前每。参考基准（oracle，ExternalDataset）：这些参数的 CRC 目录校验值（reveng.sourceforge.io CRC 目录，CRC-24/LTE-A：宽度 { "24" }，poly 0x864CFB，init { "0" }，check 0xCDE703），它们即 RTCM { "10403" } 与 Galileo OS SIS ICD 的 CRC-24Q 参数，以及 RTCM { "10403" } 中印出的 { "1005" } 号报文类型示例帧

seg-6e2719a28884 = <b>VALIDATED</b> <c1/> 类型的拟合器与权衡：用 J2-J6 带谐项或 EGM2008 引力（取到所选阶数）加阻力积分出的真值轨道，以及带随机种子的自由或受控。参考基准（oracle，ExternalDataset）：以真实精密科学轨道为真值（TU Graz IfG/ITSG 业务化简化动力学轨道，凭署名可任意使用；SHA-256 值见夹具 NOTICE），用 16 参数集在 { "20" } 与 { "30" } min 弧段上拟合，对照 Liu 等 { "2025" }（Remote Sensing { "17" }({ "16" }):{ "2894" }，CC BY { "4.0" }）针对相同卫星与日期发表的统计：沿迹、横向与径向 RMS 各在 1.5 倍以内（实测 { "0.804" } 至 { "1.087" }），SISR

seg-0c26ec09bf16 = SISRE 是电文相对于其所拟合的真值的表示误差；定轨误差与轨道预报误差未建模。（结果<c1/>）

seg-3762de39de07 = 真值轨道是 Kshana 的数值积分（带谐项或 EGM2008 引力，静态指数阻力），不是真实卫星的精密轨道；无第三体、太阳辐射压或潮汐。（结果<c1/>）

seg-4486dd350b57 = 二进制格式是 Kshana 自己记录在案的编码，依据已发表的电文组成部分建模；它不是 Celeste 或任何其他系统的比特布局（均未公开）。（结果<c1/>）

seg-2a5c1bce8320 = RINEX 风格的块是有记录的 Kshana 扩展；RINEX { "4.02" } 未定义 LEO 导航记录。（结果<c1/>）

seg-642d8f4d60e7 = 携带了 NeQuick-G 系数并计算了有效电离水平，但将其转换为延迟的 NeQuick 电子密度积分并未实现；已实现的是 Klobuchar 延迟，按 1/f^{ "2" } 缩放到载波频率，对在电离层内部飞行的卫星不作修正。（结果<c1/>）

seg-8ba04a3147bd = Liu 等 { "2025" } 的 22 参数项遵循该论文的用户算法（式 1-7）和拟合策略（第 { "2.3" } 节）；其 SISRE 随高度变化的数值使用的是真实精密轨道，因此在 Kshana 积分所得轨道上做的这一比较为 MODELLED，而非 VALIDATED（真实轨道的比较见 tests/leo_navmsg_fit_real_orbit_oracle.rs）。（结果<c1/>）

seg-b3585c7feb4e = MIXED — 构件为 VALIDATED，结果为 MODELLED。SISRE 权重复现已发表的 MEO/GEO 表（Montenbruck 等 { "2018" }），Galileo ICD 用户算法在真实 Galileo 广播星历上复现 RTKLIB，CRC-24Q 复现其目录校验值与 RTCM { "1005" } 示例帧。每个拟合、SISRE、连续性与量化数值均为 MODELLED：即电文相对于一个（结果<c1/>）

seg-d6e412aab1b4 = MODELLED：每个拟合与 SISRE 数值都是相对于 Kshana 积分所得真值的表示误差（不含定轨或预报误差）；与 Liu 等（类型目录（<c1/>））

seg-c5478f572d21 = 系列页面：<a1>近地轨道导航</a1>

seg-d9257241d523 = 主题页面：<a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>上一页</s1>launch-window

seg-2984c4c69850 = <s1>下一页</s1>leo-pass
