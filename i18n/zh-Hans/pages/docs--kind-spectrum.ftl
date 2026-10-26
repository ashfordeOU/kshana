# docs--kind-spectrum: translations (zh-Hans)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> 未提供：Kshana 对信号性能建模，不对有效载荷或天线硬件建模。参考基准（NoneKind）：无：由合作方负责的学科，按设计没有模块也没有测试

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = 有 { "3" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-a3697ad561db = Hz

seg-304496607bd7 = 引擎 v{ $version } 的场景类型，所属系列为<a1>压制干扰、欺骗干扰与频谱</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-5d23d7f8f872 = 系列页面：<a1>压制干扰、欺骗干扰与频谱</a1>

seg-f85a85f0c7e4 = MHz

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }：点名此类型的<a1>验证矩阵</a1>行。

seg-3319b18ac61f = 矩阵中另有 { "1" } 项。

seg-9ca82c79430e = <b>MODELLED</b> <c1/> 类型扩展到 L 频段以外：频段以预设信号设计给出（绘出每个分量，带限于发射带宽，C/N0 和 J/S 参照被跟踪分量），或以自定义载波和调制给出 测试：<a1>leo_signal_reference.rs</a1>。

seg-ab8fe1c3cb79 = 来源：<c1/>

seg-10a4479141b5 = <c1/>（场景类型）

seg-fef00c827c6a = L波段频谱模型与瀑布图：把整个GNSS L波段作为一张功率谱密度（PSD），横向为频率，纵向为时间，覆盖一条脚本化的干扰机时间线。信号：GPS L1 C/A和L2C（BPSK({ "1" })）、Galileo E1开放服务（MBOC(6,1,1/11)，或BOC({ "1,1" })）、GPS L5和Galileo E5a（BPSK({ "10" })），各自位于其载波，除非另行指定，均取接口规范的最小接收功率（IS-GPS-200、IS-GPS-705、Galileo OS SIS ICD）；未对GLONASS、北斗和Galileo E6建模。干扰机：连续波单音、平坦窄带噪声、线性锯齿啁啾，以及与某个频带自身调制匹配的宽带噪声，各有中心频率、带宽、接收功率（直接给定，或通过jamming类型的自由空间路径损耗由EIRP和距离得出）以及开关时间。每个干扰机按其在接收机带宽上的频谱分离系数kappa对每个频带评分，且(C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1；对单个干扰机，这等于jamming类型的抗干扰方程，其中Q = 1/(R_c kappa)，报告载有这一交叉核对（以及jamming类型的代表性Q数值，并列给出）。噪声底限为k T_sys，其中T_sys = T_ant + { "290" } K (F - { "1" })。瀑布图把每个单元在其频率栅格和所在行上取平均（啁啾精确处理，含整次扫频加上不完整的一次；行中途开关的干扰机按其占空比处理），因此C/N0时间线和图像来自同样的数字；result.json载有按功率做块平均的栅格、每行每个频带的C/N0和J/S，以及每个干扰机每个频带的SSC、Q、J/S、带内J/S和稳态C/N0。可选的[iq]：模型在某一时刻绘制为复IQ，写入SigMF记录（cf32_le或ci16_le）再读回，并与Welch估计比较。可选的[recording]（原生构建）：真实SigMF记录的Welch PSD与模型并列。VALIDATED：信号PSD对照教科书的主瓣宽度（BPSK(n)零点到零点为2n x { "1.023" } MHz；BOC({ "1,1" })瓣中心在 +/-1.023 MHz），频谱分离系数对照其帕塞瓦尔闭式解以及Kaplan与Hegarty的Q = { "1" }（CW）和{ "1.5" }（匹配）。MODELLED：干扰机功率、时间线、前端带宽、连续谱（无码线）处理，以及不含AGC、消隐和天线方向图。

seg-92f1d6d2c0f2 = <c1/>的一次运行汇总如下：场景spectrum | { "5" }个频带 | { "3" }个干扰机 | 噪声底限 -202.0 dBW/Hz | 最差频带gps-l1ca最小C/N0 { "3.2" } dB-Hz（J/S { "60.2" } dB）

seg-ed3a383d6f1e = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>

seg-fb332c77fd0e = 示例<c1/>设置了以下内容等：

seg-df78607f9cdb = 结果标签（引擎给出）：MODELLED：由闭式信号谱（对照教科书主瓣宽度和频谱分离系数做了VALIDATED）、干扰机频谱和kT噪声底限构建的L波段功率谱密度，经频谱分离系数归约为J/S和有效C/N0。干扰机功率、时

seg-ea1678eb9e84 = 引擎为scenarios/l-band-waterfall-jamming.toml（类型spectrum）绘制的图表

seg-ce0afea7b030 = <b>VALIDATED</b> GPS L1 C/A和L2C（BPSK({ "1" })）、GPS L5和Galileo E5a（BPSK({ "10" })）、正弦BOC({ "1,1" })和Galileo E1 MBOC(6,1,1/11)的单位面积功率谱密度（navsignal::Modulation::psd，新增了MBOC变体），其数值定位的零点和

seg-7e315c5675d0 = <b>MODELLED</b> <c1/>类型：L波段功率谱密度的频率-时间栅格（热底限k T_sys，其中T_sys = T_ant + { "290" } K (F - { "1" })，信号取其接口规范的最小接收功率，以及连续波、窄带

seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf：读写Signal Metadata Format记录（JSON .sigmf-meta，含核心的global、captures和annotations字段；原始 .sigmf-data为cf32_le、ci16_le或ci8，整数解码器与realdata::iqif::load_iq共用），全部在

seg-4e35cc861b15 = <b>VALIDATED</b> GPS L1 C/A和L2C（BPSK({ "1" })）、GPS L5和Galileo E5a（BPSK({ "10" })）、正弦BOC({ "1,1" })和Galileo E1 MBOC(6,1,1/11)的单位面积功率谱密度（navsignal::M. 参考基准（ExternalDataset）：已发表的教科书数值：BPSK(n)主瓣零点到零点为2n x { "1.023" } MHz，窄带（CW）干扰机的抗干扰系数Q = { "1" }，与C/A匹配的扩频干扰机的Q = { "1.5" }（Kaplan与Hegarty，Understanding GPS/GNSS，第3版，第{ "9.4" }节）；BOC(m,n)主瓣中心在正负m x { "1.023" } MHz（Betz，Binary Offset Carrier Modulations for Radionavigation，NAVIGATION { "48" }({ "4" })，{ "2001" }）；

seg-287de49e90a8 = <b>MODELLED</b> <c1/>类型：L波段功率谱密度的频率-时间栅格（热底限k T_sys，其中T_sys = T_ant + { "290" } K (F - { "1" })，信号取其. 参考基准（InternalConsistency）：归约到现有的<c2/>类型的抗干扰方程和链路预算（同一代码，在同样的输入上调用），以及k T0 F噪声底限闭式解。其下的信号谱就是上面那一行已核对验证的结果；干扰机功率、时间线和前端带宽是场景输入，频谱是连续的（没有扩频码线），也没有自动增益控制、消隐或天线方向图作用于干扰

seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf：读写Signal Metadata Format记录（JSON .sigmf-meta，含核心的global、captures和annotations字段；原始 .sigmf-data为cf32_le、ci1. 参考基准（ExternalDataset）：scipy { "1.18.1" } scipy.signal.welch（BSD-3-Clause），采用相同的周期Hann窗、重叠、密度缩放、不去趋势和双边均值平均：在{ "27" }个算例中每个频点都在相对{ "1e-12" }之内（实测{ "6.0e-14" }），段数取自scipy自身的谱图。sigmf-python { "1.13.0" }（LGPL-3.0，作为工具运行）写出五份第三方记录（cf32_le、ci16_le、ci8、两份带注解的捕获、一份非零fir

seg-0cbbe567f1c8 = 扩频码的谱线结构（例如 C/A 的 { "1" } kHz 谱线）：谱线按相对于平滑包络的程度评分（结果 <c1/>）

seg-2efdae3f5764 = 自动增益控制、量化、脉冲消隐与陷波滤波（结果 <c1/>）

seg-f3e58705c9a2 = 接收天线朝向干扰源的方向图（仅用一个增益数值，不再细化）（结果 <c1/>）

seg-c0d379cb1ab3 = 同一频段内各卫星之间的系统内多址干扰（结果 <c1/>）

seg-83f414112e45 = GLONASS G1/G2、BeiDou B1/B2 与 Galileo E6（结果 <c1/>）

seg-249d8a46f95a = 设计信号在其发射带宽之外的辐射：其频谱在该处被截断，因此不会有带外辐射进入相邻频段（结果 <c1/>）

seg-cc83c047f02a = 扫频速率与环路带宽相当时，啁啾对环路的影响：其 C/N0 采用按行平均的频谱（结果 <c1/>）

seg-7155706bc289 = MODELLED：由闭式信号频谱（VALIDATED，已与教科书给出的主瓣宽度和谱分离系数核对）、干扰源频谱和 kT 噪声底构建的 L 波段功率谱密度，再通过谱分离系数换算为 J/S 和有效 C/N0。干扰源功率、时间线和前端带宽均为场景输入，而非测量值。（结果 <c1/>）

seg-95879767c438 = 专题页面：<a1>LEO-SIGNAL.md</a1>

seg-ce69d8d2d9d1 = <s1>上一页</s1>space-weather

seg-ac2c9c25fbb6 = <s1>下一页</s1>spoof-detect
