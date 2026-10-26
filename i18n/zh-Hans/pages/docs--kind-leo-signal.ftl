# docs--kind-leo-signal: translations (zh-Hans)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = 有 { "3" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-a3697ad561db = Hz

seg-1918189ac2bf = ppm

seg-49964654d5f4 = 引擎 v{ $version } 的场景类型，所属系列为<a1>近地轨道导航</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-c5478f572d21 = 系列页面：<a1>近地轨道导航</a1>

seg-ae15d15bf151 = 主题页面：<a1>LEO-PASS.md</a1>

seg-59b976838ef1 = <b>VALIDATED</b> navsignal：正弦积分（sine_integral）、双边频带内 BPSK-R 功率占比的闭式（bpsk_power_in_band_closed_form）、带限。参考基准（oracle，ExternalDataset）：外部固定的数值有：主瓣功率占 { "90.3" }%，所述工作点处的相干超前-滞后抖动，正弦积分表值，以及零偏移处的 BPSK 自谱分离系数 2/({ "3" } R_c)。仅为内部交叉检查、不属于外部验证的有：带限 BPSK 的 Gabor 带宽闭式及其渐近式，以及非零偏移处的偏移 BPSK 谱分离系数，二者均

seg-faf2775f3003 = <b>MODELLED</b> <c1/> 类型：参数化的信号设计（频段、发射带宽、ITU 频率划分；采用 BPSK(n)、BOC(m,n)、MB 的捕获、数据和导频分量。参考基准（oracle，InternalConsistency）：上面两行已验证的闭式、平方律虚警恒等式 P_d(snr = { "0" }) = P_fa 与 Holmes 平均捕获时间，以及可还原为频谱类型自身 SSC 链（同一段 Jammer::ssc 代码）。设计本身属于输入：标注为 REPRESENTATIVE 或 WORKSHOP 的预设并非公开发布的规范，增强型 Feher QPSK、码移键控和 OFDM 的频谱为近似，且其形状

seg-051999733048 = 来源：<c1/>

seg-16ae2a08d3c8 = <c1/>（场景类型）

seg-97b8d07150d4 = LEO-PNT 信号设计：适用于任意系统、频段和结构的参数化低地球轨道（LEO）定位、导航与授时（PNT）信号。信号（SIGNAL）由一个频段（中心频率、发射带宽、ITU 频率划分 RNSS/RDSS/MSS/EESS/non-RNSS/other）和若干分量（捕获、数据、导频；可取任意子集）构成，每个分量各有调制方式（n 可为分数的 BPSK(n)、BOC(m,n)、MBOC({ "6,1" },p) 或类 OFDM 的平坦频带）、功率份额、可选的 FDMA 子载波偏移、码长和数据速率。信号来自编译内置的公开预设文件（xona-pulsar、iridium-stl、starlink-soo、centispace、generic-c-band、generic-bands；每个都附来源 URL，且每个未公开的数值均标注为 REPRESENTATIVE），或以内联方式书写。逐信号（PER SIGNAL）给出：带限功率谱密度，以及发射频带所通过的各分量功率的比例（BPSK 闭式与数值并列），RMS（Gabor）带宽，延迟锁定环码跟踪热噪声抖动随 C/N0 和超前-滞后间距的变化（取自 Betz & Kolodziejski { "2009" } 的带限相干（或非相干）超前-滞后公式，并附其不限带宽的教科书形式及其间距趋于零时的 Gabor 界），以米计的测距精度，捕获搜索空间（由轨道最大多普勒加上振荡器和用户项得到的多普勒单元，乘以码单元），平方律检测概率以及串行和码并行的平均捕获时间，该信号对 GPS L1 C/A、Galileo E1、GPS L5、Galileo E5a、E5b 和 E5 AltBOC 的谱分离系数，以及上述各信号对该信号的谱分离系数及 C/N0 劣化，还有被跟踪分量可容忍的 CW、宽带和匹配 J/S，均取自频谱类型自身的 SSC 机制。频段权衡（BAND TRADE）：一阶电离层延迟（{ "40.3" } TEC/f^{ "2" }）、自由空间损耗、等 C/N0 和等 EIRP 下的测距精度，以及干扰机容限。可选的形状检查（SHAPE CHECKS）将设计的频谱与某次所述测量比对（MODELLED 一致性）。VALIDATED：BPSK 带内功率（主瓣内 { "90.3" } %）和 Gabor 带宽闭式，带限抖动可还原为教科书的相干超前-滞后形式及其 Gabor 界，偏移 BPSK 谱分离系数对照其 Parseval 闭式，AltBOC 频谱的单位面积，以及 LEO 最大多普勒对照已发表的 Xona Pulsar（32-34 kHz）和 Iridium（{ "36" } kHz）数据。MODELLED：每一个设计、功率分配、C/N0 和干扰机电平；EFQPSK、CSK 和 OFDM 的频谱为近似。

seg-37e5fdff9d4d = <c1/> 的一次运行概括如下：场景 leo-signal | { "5" } 个信号 | 噪声底 -202.0 dBW/Hz | 最优测距 generic-c-wide { "0.022" } m，在 { "45.0" } dB-Hz 时

seg-b538d3ff9fdb = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-6aaf62f55e65 = 示例 <c1/> 设置了下列内容等：

seg-9fd02351d844 = ms

seg-05e8854de548 = 码片

seg-d12bc1d2b815 = 相干

seg-0f29946fe4fb = 结果标签（引擎给出）：MODELLED：参数化的低地球轨道（LEO）定位、导航与授时（PNT）信号设计，带限于其发射带宽。其下的闭式为 VALIDATED（BPSK 带内功率与 Gabor 带宽，带限超前-滞后码跟踪抖动可还原为教科书

seg-8bf45b6989d1 = 引擎为 scenarios/leo-band-trade.toml（类型 leo-signal）生成的图表

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }：点名此类型的<a1>验证矩阵</a1>行。

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal：正弦积分（sine_integral）、双边频带内 BPSK-R 功率占比的闭式（bpsk_power_in_band_closed_form）、带限 BPSK Gabor 带宽的闭式（bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz：在仰角截止角处的头顶过境弧段上，圆轨道的最大卫星多普勒，v R_E cos(el) / (R_E + h) 乘以 f / c，取自各预设自身的载波和轨道高度；<c1/> 类型另外增加

seg-e0a4f53c5a96 = <b>MODELLED</b> <c1/> 类型：参数化的信号设计（频段、发射带宽、ITU 频率划分；采用 BPSK(n)、BOC(m,n)、MBOC 或平坦频谱的捕获、数据和导频分量，功率份额、FDMA 子载波、码长和数据速率 测试：<a1>leo_signal_reference.rs</a1>。

seg-9ca82c79430e = <b>MODELLED</b> <c1/> 类型扩展到 L 频段以外：频段以预设信号设计给出（绘出每个分量，带限于发射带宽，C/N0 和 J/S 参照被跟踪分量），或以自定义载波和调制给出 测试：<a1>leo_signal_reference.rs</a1>。

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz：在仰角截止角处的头顶过境弧段上，圆轨道的最大卫星多普勒，v R_E cos(el) / (R_E + h) 乘以 f / c,. 参考基准（oracle，ExternalDataset）：已发表的数据：Xona Pulsar X1 最大多普勒 { "32" } 至 { "34" } kHz（Leclère、Marathe & Reid，ION GNSS+ { "2025" }，<a1>https://arxiv.org/abs/2509.19551</a1>）；Iridium 多普勒最高 +/-36 kHz（Resilient Navigation and Timing Foundation，Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites）。未计入地球自转，这会使该数值最多偏移约 { "2.3" } kHz；两个已发表的数据在不计地球自转时均已满足。

seg-1ab79cdbd269 = 增强型 Feher QPSK、码移键控和 OFDM 的精确频谱：以矩形码片的 BPSK 包络或平坦频带代替，各预设均有说明（结果 <c1/>）

seg-0561c3ed88fb = 扩频码的谱线结构以及码间的多址互相关（结果 <c1/>）

seg-8b4df054a7b3 = 发射和接收滤波器，超出发射带宽处理想砖墙滤波器的部分：不含带外辐射，不含滤波器群延迟（结果 <c1/>）

seg-ad5f7cc4a439 = 多路径、接收机量化和自动增益控制（结果 <c1/>）

seg-e38fc1a121ab = 多普勒界中的地球自转（在赤道处，距离变化率最多约 { "0.46" } km/s）（结果 <c1/>）

seg-32a132809a9b = 一阶以上的电离层延迟，以及 LEO 卫星上方和下方电子含量的划分：斜向 TEC 为输入（结果 <c1/>）

seg-8189e06f4a56 = 大气、降雨和极化损耗：仅比较自由空间损耗（在 C 频段降雨影响显著）（结果 <c1/>）

seg-445cecb7370c = 超出带虚警代价的单次驻留的捕获：无多次驻留验证逻辑，码相位先验为均匀分布，取最坏情形的跨格（结果 <c1/>）

seg-8eefe4197d7f = <s1>上一页</s1>leo-pvt

seg-60423e1ed0ca = <s1>下一页</s1>link-budget
