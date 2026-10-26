# docs--leo-signal: translations (zh-Hans)

seg-cbf0f9bcd2d8 = 参考基准

seg-6e0cb6acc073 = VALIDATED

seg-3ea93ae372ca = 包含内容

seg-6cb7a787ac67 = 参考文献

seg-f63dd3d7aad4 = 来源

seg-587beeccaa11 = 预设

seg-6752521002b2 = 部分

seg-2b0d77219437 = 预设

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-c5ce76c91ff7 = 标签

seg-a86ce24d81de = 频段

seg-74f4e80c65cb = 分量

seg-e769f0411e64 = 已被发布方撤下；无存档副本

seg-2255f9acec5b = 来源：<c1/>

seg-ff4c44ecdecb = LEO-PNT信号设计与多频段频谱

seg-5e222f965192 = <c1/>场景种类分析低地球轨道（LEO）定位、导航与授时（PNT）信号。它不与某一个系统绑定。信号是参数化设计（数据，而非代码），因此同一个种类可以分析已发布的商业信号、为无人发布过的频段设计的代表性方案，或场景内联写出的任何设计。<c2/>种类同样绘制这些设计，频段范围从超高频（UHF）到C，每个频段有各自的干扰源，而<c3/>频段或<c4/>运行可以携带其中任何一个（见<a1>这些设计用在何处</a1>）。

seg-caccfa826a1a = 运行内置示例：

seg-441136f32290 = <c1/>：在代表性设计上的UHF到宽C频段权衡；

seg-23cea428326c = <c1/>：已发布的Xona Pulsar X1和X5信号；

seg-5dcfa318a4f3 = <c1/>：各频段干扰源下的UHF、L、S和C面板（一个<c2/>场景）；

seg-0390769a8d7f = <c1/>，来自代码仓库的检出（未内置）：欧洲航天局（ESA）导航创新与支持计划（NAVISP）LEO-PNT研讨会（{ "2026" }）上展示的Celeste在轨演示（IOD）频段与信号配置（见下文<a1>研讨会参数</a1>）。

seg-62511ee92f8a = 代码：<c1/>（信号设计，该种类）、<c2/>（闭式）、<c3/>（多频段瀑布图），预设文件位于<c4/>之下。

seg-ce08de9a19de = 一个信号设计

seg-fc0d265f4006 = 中心频率、发射带宽（频谱在其之外为零）和国际电信联盟（ITU）划分：无线电导航卫星业务（RNSS）、无线电测定卫星业务（RDSS）、移动卫星业务（MSS）、地球探测卫星业务（EESS）、非RNSS频段或其他

seg-be2d5e822342 = <b>捕获</b>分量（短而低速率，易于发现）、<b>数据</b>分量（导航电文）和<b>导频</b>分量（无数据，用于测距）的任意子集

seg-e73d9832efe0 = 每个分量

seg-dac784d5f41a = 调制：n × { "1.023" } Mchip/s的二相相移键控BPSK(n)（n可为分数，BPSK(1/3) 为{ "341" } kchip/s）、二进制偏移载波BOC(m,n)、复用BOC，或用于正交频分复用（OFDM）信标的<c1/>；功率份额；频分多址（FDMA）子载波偏移；码长；数据速率

seg-4ccb9e269d64 = 可选

seg-4c22d21ea8f0 = 参考和最大接收功率、轨道高度、用于仅多普勒信号的<c1/>，以及哪些已发布、哪些是假定的说明

seg-c6b46532af9a = 场景从<c1/>以及内联的<c2/>表取得信号。两者都没有时，它分析<c3/>预设。

seg-a917a5ccfb79 = <c1/>之下每个一份文件，编译进来，各自引用其来源URL。来源未发布的值在文件和报告中标为REPRESENTATIVE。

seg-7159574bf255 = 信号

seg-c2831d853b1d = 声明的近似

seg-7816d4f1c3f1 = <c1/>（{ "1593.3225" } MHz，{ "1.023" } Mchip/s），<c2/>（{ "1190.51625" } MHz，{ "10.23" } Mchip/s）；最小和最大接收功率；{ "1080" } km

seg-332a08bef0de = 以矩形码片BPSK包络绘制的增强Feher正交相移键控（EFQPSK）；码移键控和叠加码未建模；发射带宽 = 主瓣（未公布）

seg-d37420c5c9f5 = <c1/>卫星授时与定位（STL）突发，{ "25" } ksymbol/s的正交相移键控（QPSK），{ "780" } km，仅多普勒和授时

seg-a765878134e2 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF) 报告</a1>

seg-5ca54b21f017 = 载波位于{ "1616" }至{ "1626" } MHz的中间；接收功率由已公布的全球定位系统（GPS）的{ "300" }至{ "2400" }倍推得

seg-e43d1db73131 = <c1/>，{ "240" } MHz OFDM信标，仅多普勒

seg-ff9e0075e868 = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>

seg-fee9a553c9ae = 平坦频谱；信道中心和壳层高度为REPRESENTATIVE；已发布的约{ "57" } dB-Hz载噪密度比（C/N₀）通过接收机设定

seg-f89372b5231e = <c1/>、<c2/>，BPSK { "2.046" } Mchip/s

seg-2e6475b25d55 = PUBLIC, <a1>PubMed Central PMC10301026</a1>

seg-ac53cebe5303 = 载波置于GPS L1和L5载波处（来源中为“near”）；码长REPRESENTATIVE

seg-cb1420efc108 = <c1/>，{ "5020" } MHz，{ "20" } MHz内的BPSK({ "10" })

seg-895f6039fce2 = REPRESENTATIVE，用于参数未公开的C频段系统（如TrustPoint）

seg-a407aaab864c = 整个设计

seg-2f679a429dae = REPRESENTATIVE，划分取自<a1>ITU《无线电规则》</a1>；{ "465" } MHz UHF载波取自公开的<s1>openRECEIVER LEO-PNT信号调查</s1>

seg-2054d9ce8a0d = 整个设计（UHF带宽和调制也在内）

seg-24360342e8e6 = ATOMIC“零钟”多项式星历是一种导航电文模型，不是信号设计，属于导航电文工作，不在此处。

seg-ebfc032d7898 = 每个信号计算什么

seg-211f655e00fa = <b>带限功率谱密度（PSD）</b>，以及每个分量中发射频带所通过的功率比例。对位于中心的BPSK分量，闭式<c1/>与数值并列（主瓣为{ "90.3" } %）。

seg-05e2a7b8235a = 带内被跟踪分量的<b>均方根（RMS，Gabor）带宽</b>，及其BPSK闭式<c1/>。

seg-f878fd0359c9 = 延迟锁定环（DLL）相对于C/N₀ 和早迟相关器间距的<b>码跟踪热噪声抖动</b>，取自Betz和Kolodziejski（{ "2009" }）的带限早迟公式：<c1/>，默认相干，可按需加入非相干平方损耗。报告还加上无限带宽的教科书形式（Kaplan和Hegarty）以及由Gabor带宽所定的间距趋零下界。<b>测距精度</b>即该抖动在参考C/N₀ 和间距下以米计的值。

seg-089e4e98af82 = <b>捕获</b>：在仰角掩模处过顶飞越时的最大卫星多普勒（<c1/>，圆轨道，不计地球自转）加上振荡器和用户项；多普勒频率格宽为<c2/>；一个周期内的码相位格；平方律检测器（广义Marcum Q）在每个单元虚警概率下的检测概率，分别给出居中和最坏跨格两种情形；以及串行与码并行单驻留搜索的平均捕获时间（Holmes）。

seg-1e2029183bdc = <b>兼容性</b>：带限信号在每个全球导航卫星系统（GNSS）接收机频段内，对GPS L1粗捕获码（C/A）、Galileo E1、GPS L5、Galileo E5a、E5b以及E5交替二进制偏移载波（AltBOC）信号的谱分离系数（SSC），以其接收功率造成的C/N₀ 损失，以及每个GNSS信号对LEO被跟踪分量的SSC和C/N₀ 损失。

seg-864f3f2a5aa1 = <b>干扰机容限</b>：使被跟踪分量降至跟踪门限的干扰信号功率比（J/S），分别针对位于载波处的连续波（CW）单音、覆盖发射频带的平坦噪声以及与被跟踪分量匹配的噪声，由<c1/>类型自带的SSC代码（<c2/>）得出。

seg-0fbea397ab93 = C/N₀ 约定：扫描和参考值均为<b>带内总</b> C/N₀。某一分量的份额以<c1/>（其占未滤波功率的份额除以带内比例）的形式进入跟踪和干扰机公式，这与<c2/>类型对普通频段采用的约定相同，其调制在接收机频段之外的功率同样视为损失。

seg-3b7d16e8873a = 频段权衡

seg-39382eb3a60c = <c1/>将每个信号与一个参考信号并列比较：针对您给定的斜向总电子含量（TEC，{ "1" } TEC单位，TECU，= 10¹⁶ 电子/m²）的一阶电离层群延迟<c2/>、给定斜距上的自由空间路径损耗（FSPL）、<b>等C/N₀</b>和<b>等有效全向辐射功率（EIRP）</b>下的测距精度（C/N₀ 减去自由空间损耗之差，两端均为全向天线），以及等EIRP C/N₀ 下的干扰机容限。

seg-58ced9eba711 = <c1/>（{ "50" } TECU、{ "1000" } km、{ "45" } dB-Hz、0.5码片相干间隔、{ "1" } Hz环路、{ "20" } ms）：

seg-72f051e2d7e1 = 信号

seg-3cfdff157be3 = 电离层延迟

seg-b1436d1fd7a4 = ΔFSPL相对L

seg-b5ce20ced519 = 测距，等C/N₀

seg-2becbee24d47 = C/N₀，等EIRP

seg-aba982013f21 = 测距，等EIRP

seg-8b292612e43e = CW J/S容限

seg-53c8b6059c3f = { "465" } MHz，BPSK({ "5" })

seg-1ee03c5e8633 = { "93.19" } m（×{ "6.57" }）

seg-66e74ec8ec1f = −{ "8.17" } dB

seg-4dfc4b277e46 = { "0.221" } m

seg-2a67835c7ddd = { "53.17" } dB-Hz

seg-b36b61eaff50 = { "0.086" } m

seg-37de1532b69e = { "42.1" } dB

seg-f16b26301a6b = { "1191.795" } MHz，BPSK({ "10" })

seg-1cc0fc817fca = { "14.19" } m

seg-c1d04452ee8f = { "0.111" } m

seg-b1dccfc14bb2 = { "45.00" } dB-Hz

seg-467afbc3965e = { "45.0" } dB

seg-63fc45ce7ef9 = { "2492.028" } MHz，BPSK({ "5" })

seg-d4b8b8837709 = { "3.24" } m（×{ "0.229" }）

seg-271acd87a8d6 = +{ "6.41" } dB

seg-0f38ea614b7f = { "0.185" } m

seg-c531dc11c01d = { "38.59" } dB-Hz

seg-6edbdabf77cb = { "0.388" } m

seg-b1c384a78d8c = { "41.7" } dB

seg-d13c29401059 = { "5020" } MHz，BPSK({ "10" })

seg-7563cf0f3ebb = { "0.80" } m（×{ "0.056" }）

seg-fa10d26d0f8e = +{ "12.49" } dB

seg-9f6390cc903b = { "32.51" } dB-Hz

seg-d04fb147c95f = { "0.465" } m

seg-e825ae4d1080 = { "43.4" } dB

seg-2f20b409a3df = { "5100" } MHz，BPSK({ "50" })

seg-6f22870202af = { "0.77" } m（×{ "0.055" }）

seg-ad13cdf3955f = +{ "12.63" } dB

seg-da4b72e53c18 = { "0.022" } m

seg-07ba1b6b9728 = { "32.37" } dB-Hz

seg-e96dfdc0d92f = { "0.093" } m

seg-04a27fee9486 = { "50.3" } dB

seg-edcaed830e15 = 这一权衡有两面。在等C/N₀ 下，测距精度由码片速率和频段决定（宽带C的测距精度比L细五倍）。在等辐射功率下，自由空间损耗对较高频段全额计入：C频段损失{ "12.5" } dB的C/N₀，测距精度比L差四倍；UHF增益{ "8.2" } dB，但电离层延迟是L的{ "6.6" }倍。宽带C以带宽换回精度。这些结果基于代表性设计和全向天线；C频段采用定向用户天线会改变等EIRP各列。

seg-9bb6fa0e7a95 = Xona Pulsar

seg-d71e8de9cdda = <c1/>，在已公布的最小接收功率下，对应{ "290" } K天线和{ "2" } dB噪声系数（底噪 −{ "201.98" } dBW/Hz）：

seg-4cf70433cc54 = 参考C/N₀

seg-2a22ffc83e00 = { "53.78" } dB-Hz

seg-8f274ed7feff = { "57.08" } dB-Hz

seg-6be7e20ca92f = 测距精度（{ "0.5" }码片，相干，{ "1" } Hz）

seg-60218177538e = { "0.402" } m

seg-e5ccbfea146d = { "0.028" } m

seg-b5a638da9ee1 = 最大卫星多普勒，{ "1080" } km

seg-6917f2712acf = { "33.2" } kHz

seg-895ac83e4a5b = { "24.8" } kHz

seg-b4c4179a0363 = 多普勒 × 码相位格（{ "1" } ms，{ "0.5" }码片）

seg-bed6ba024afe = 码并行平均捕获时间

seg-93ffb02c7c50 = { "0.15" } s

seg-3671bc5f2ace = { "0.37" } s

seg-7e4c190cb4ab = X5位于{ "1190.51625" } MHz，处于Galileo E5频段内：其SSC对Galileo E5a和GPS L5为 −{ "91.2" } dB/Hz，对E5b为 −{ "103.2" } dB/Hz，对AltBOC信号为 −{ "86.2" } dB/Hz；一颗X5卫星在其最小功率下会使GNSS接收机的噪声密度升高{ "0.0001" }至{ "0.005" } dB。X1的多普勒{ "33.2" } kHz位于论文报告的{ "32" }至{ "34" } kHz之内（见下文VALIDATED多普勒一行）。

seg-661eefb1f346 = 多频段频谱

seg-0a8bbe2921fd = <c1/>类型的<c2/>除五个已命名的GNSS频段（<c3/>、<c4/>、<c5/>、<c6/>、<c7/>）外，还接受：

seg-63bd7d8a192d = <c1/>：预设设计，绘出全部分量，限带于其发射带宽，以预设的参考功率或<c2/>接收。C/N₀ 和J/S均针对被跟踪分量（报告中的<c3/>）；

seg-603a2b97e621 = <c1/>配合<c2/>和<c3/>：任意自定义频段。

seg-b1c30f5d69cf = <c1/>在同一时间轴和色标上增加其他频率范围的瀑布图，并且除CW、窄带、啁啾和匹配噪声外，新增<c2/>（阻塞式）干扰机。普通频段的行为与此前完全一致：自带的<c3/>示例对L1 C/A仍给出标称{ "43.48" } dB-Hz和最小{ "3.23" } dB-Hz（在<c4/>中固定）。

seg-35151477cbc2 = <c1/>（{ "60" } s，每秒一行）：

seg-47408d30d095 = 标称C/N₀

seg-e618666a44d8 = 自身干扰机作用后

seg-f75d3804cfe8 = 干扰机

seg-5751b2520829 = generic-uhf（{ "465" } MHz）

seg-995748f9c74c = { "49.41" } dB-Hz

seg-a582f1a22a07 = 自{ "10" } s起{ "34.38" } dB-Hz

seg-23570b8c7403 = 载波处的CW，−{ "120" } dBW

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-2e935ea7b90e = 自{ "20" } s起{ "3.38" } dB-Hz（失锁）

seg-52256ba98a99 = { "16" } MHz啁啾，{ "100" } m处{ "50" } mW

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-71abaef6924e = 自{ "30" } s起{ "38.51" } dB-Hz

seg-45441a20f061 = { "1185" } MHz处{ "40" } MHz阻塞，−{ "118" } dBW

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-430461899d82 = 自{ "30" } s起{ "46.29" } dB-Hz

seg-4bcace842ce1 = 同一阻塞干扰

seg-472da83fd67a = generic-s（{ "2492.028" } MHz）

seg-0f47178201ca = { "49.23" } dB-Hz

seg-0f0cad45f636 = 自{ "40" } s起{ "41.69" } dB-Hz

seg-d04f42bc0567 = { "2" } MHz噪声，−{ "128" } dBW

seg-372655e7c722 = generic-c-band-leo（{ "5020" } MHz）

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-b27c4bc24059 = 自{ "50" } s起{ "40.35" } dB-Hz

seg-ab6304cf6aec = 匹配噪声，−{ "124" } dBW

seg-1f8a742cb215 = 每个干扰机只作用于自己的频段；测试使其他所有频段保持标称C/N₀，直到各自的干扰机启动。

seg-01c63dd5d11b = 设计的使用位置

seg-74f85b484b08 = 凡是频段可以指名的地方，都按名称查找设计：

seg-4a7aca809ec3 = <c1/>频段（<c2/>，见上）：<c3/>、<c4/>，以及<c5/>和<c6/>测评活动；

seg-1ee84efd74b3 = <c1/>频段（<c2/>）：该频段采用设计的中心频率（除非给定了<c3/>）、发射带宽和被跟踪码片速率，按功率份额把其EIRP分配给各分量，并在每个历元报告被跟踪分量的C/N₀ 和带限码跟踪抖动（<a1>LEO-PASS.md</a1>）；

seg-33732550ba94 = <c1/>类型，它把设计的功率分配和码片速率交给过境计算，把载波和码片速率交给融合定位解（<c2/>、<c3/>；<a1>LEO-PNT.md</a1>）。

seg-625f50ac3189 = 研讨会参数

seg-9d50778efa0a = <c1/>收录了Celeste IOD的频段和“Classical Pilot”信号配置 #1，出自{ "2026" }年ESA NAVISP LEO-PNT研讨会的介绍，并附有一种设计与当时展示的实测频谱之间的形状核对。它是Celeste IOD预设的文件之一（其余为<c2/>和其他<c3/>）；Celeste信号规范并未公开。其各分量均注明了所做假设（功率分配、码长、FDMA偏移，以及对未介绍调制的频段采用的代表性调制）。该形状核对属于MODELLED自洽：它比较的是形状，而不是经校准的电平。

seg-6e259f57af91 = 它与预设的其余部分一同被保留不公开：删除<c1/>和<c2/>文件即可。没有任何内容把该场景编译进程序：命令行界面将其列为仅限代码仓库的场景（<c3/>会指明并说明，而不是打印它），并且有测试拒绝对它使用任何<c4/>。其他所有场景、测试和参考基准（oracle）都可在没有它的情况下运行；读取它的测试在其缺失时会带说明通过，README中的场景文件数仍把它计入。

seg-53a7343c076e = 声明

seg-6e0de0f2b25f = 频段内的BPSK功率（主瓣内{ "90.3" } %）；带限早迟码跟踪抖动可化简为教科书的相干和非相干形式及其Gabor界；BPSK自SSC 2/({ "3" } R_c)

seg-e35f7c20a976 = Kaplan与Hegarty，Betz与Kolodziejski { "2009" }，Betz { "2001" }，Abramowitz与Stegun表{ "5.1" }

seg-0ceb71e558f6 = 带限Gabor带宽闭式解；非零偏移下的偏移BPSK SSC；AltBOC单位面积（均包含在上一行内，作为交叉核对）

seg-b0552001e519 = 内部自洽

seg-af6cff634177 = 在此推导，并用求积核对

seg-6b74bc7777c7 = 最大LEO多普勒

seg-f4f4ee11749d = Xona Pulsar X1 { "32" }至{ "34" } kHz（arXiv { "2509.19551" }）；Iridium ±{ "36" } kHz（RNTF）

seg-08e5ec9a31a0 = <c1/>设计、捕获、兼容性、干扰机容限、权衡、形状核对

seg-64f232587c5f = 经独立核对的闭式解、检测器恒等式P_d({ "0" }) = P_fa、Holmes平均时间、频谱类型自身的SSC计算链

seg-a456645f97aa = 多频段频谱

seg-868432ccfa09 = 可化简为未改动的频谱和干扰计算链

seg-430edd66bda0 = 未建模

seg-d3bba3714684 = EFQPSK、码移键控和OFDM的精确频谱。

seg-53a727d317ae = 扩频码的谱线结构和多址互相关。

seg-08e229ae97e9 = 超出理想矩形滤波器的发射和接收滤波器：不含带外辐射。

seg-b1fe4ce62e6a = 多路径、量化和自动增益控制。

seg-5d2af0802400 = 多普勒界中的地球自转（距离变化率最大约{ "0.46" } km/s）。

seg-5e5e1124fbbb = 一阶以外的电离层延迟，以及LEO卫星上下方电子含量的划分：斜向TEC为输入。

seg-8c0d738304ab = 大气、降雨和极化损耗。

seg-1fc440f042cf = 多驻留捕获逻辑。

seg-090a6ecf879f = 超出每颗卫星计数的聚合干扰。

seg-c4b2a79ee33d = J. W. Betz and K. R. Kolodziejski, "Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I," <em>IEEE (Institute of Electrical and Electronics Engineers) Transactions on Aerospace and Electronic Systems</em> { "45" }({ "4" }), { "2009" }.

seg-52ad2f21daf4 = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }),

seg-aeeea70a0258 = E. D. Kaplan and C. J. Hegarty (eds.), <em>Understanding GPS/GNSS</em>, 3rd ed., Artech House,

seg-343397c21357 = J. K. Holmes, <em>Coherent Spread Spectrum Systems</em>, Wiley, { "1982" }.

seg-34af310a980b = M. Abramowitz and I. A. Stegun, <em>Handbook of Mathematical Functions</em>, { "1964" }, §{ "5.2" } and Table { "5.1" }.

seg-45606af6bda2 = Galileo Open Service Signal-in-Space Interface Control Document; IS-GPS-200; IS-GPS-705.

seg-960fc01f0a62 = Leclère, Marathe and Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>.

seg-70efdc604ab9 = Resilient Navigation and Timing Foundation, <em>Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites</em>, <a1>https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf</a1>.

seg-72490fa16fd2 = Kozhaya, Saroufim and Kassas, <em>NAVIGATION</em> { "72" }({ "1" }), { "2025" }, <a1>https://navi.ion.org/content/72/1/navi.685</a1>.

seg-00cfb54b28c0 = CentiSpace：<a1>https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/</a1>。

seg-4d954d28b661 = ESA Celeste IOD facts：<a1>https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures</a1>。

seg-d43b8255ba58 = ITU Radio Regulations：<a1>https://www.itu.int/pub/R-REG-RR</a1>。

seg-3a9fe081eb89 = openRECEIVER，<em>LEO-PNT Signals: Inside CELESTE's Four Bands</em>，{ "2026" }年8月{ "1" }日（<c1/>的{ "465" } MHz UHF载波的公开来源）：<s1>https://open-receiver.com/blogs/leo-pnt-signals-celeste/</s1>。该页面已从网站撤下（HTTP { "404" }，并于2026-09-29从其博客索引中消失）；搜索引擎仍以该标题列出它。

seg-18b16c83dd7c = <s1>上一页</s1>LEO定位、导航与授时

seg-50fe3f8ae7ec = <s1>下一页</s1>LEO过境与链路预算
