# docs--kind-leo-pnt-chain: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-7f5ad6ab8c23 = GPS

seg-cd04f5662884 = MODELLED。（类型目录（<c1/>））

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = 有{ "3" }个内置场景使用此类型；其余的在<a1><c1/></a1>中。

seg-49964654d5f4 = 引擎v{ $version }的场景类型，所属系列为<a1>近地轨道导航</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为MODELLED（标签如何获得，见README的Evidence一节）。

seg-c5478f572d21 = 系列页面：<a1>近地轨道导航</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14第{ "2.4.1" }节步骤{ "3" }至{ "9" }（由N_wet得出的参考sigma、有效路径长度、天线平均因子、{ "0.01" } % 至{ "50" } % 时间的衰落深度。参考基准（oracle，ExternalDataset）：ITU-R Study Group { "3" }验证示例（CG-3M3J-13-ValEx-Rev8.3.0），用于P.618-14闪烁，各站点的P.453-14 N_wet取自同一批示例；连同URL与获取日期提交于tests/fixtures/leo_link/p618_14_scintillation.csv。由温度和湿度得出的湿折射率表达式不在该行覆盖范围之内

seg-ab58ab4e7dc6 = <b>VALIDATED</b>每个频段的群延迟{ "40.3" } STEC/f^{ "2" }；无电离层组合系数f1^2/(f1^{ "2" } - f2^{ "2" }) 与 -f2^2/(f1^{ "2" } - f2^{ "2" })，以及噪声放大sqrt(a1^{ "2" } s1^{ "2" } + a2^。参考基准（oracle，ExternalDataset）：IS-GPS-200第{ "20.3.3.3.3.2" }节，其中给出由一阶1/f^{ "2" }缩放得出的L1/L2群延迟比gamma = (77/60)^{ "2" }，以及Friis传输公式（Proc. IRE，{ "1946" }）。验证的是缩放定律，而不是斜向TEC

seg-ae15d15bf151 = 主题页面：<a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = 来源：<c1/>

seg-3a66efa79aa2 = <c1/>（场景类型）

seg-81d1604171a5 = 端到端的一个LEO-PNT（低地球轨道的定位、导航与授时）系统，适用于任意星座与信号：由signal_design指定的leo-signal设计（公开预设或内联 [signal] 设计）设定 [pass] 频段的中心频率、带宽、码速率和EIRP分配，leo-pass链路预算给出过境期间被跟踪的C/N0与带限码抖动，sin(仰角) 的C/N0直线以及 [navmsg] 电文的广播SISRE（在过境卫星的高度上拟合）输入 [fusion] leo-pvt联合定位解中的每个LEO系统，并可选地输入 [ppp] leo-ppp各案例；每次交接都列出其数值与单位。MODELLED。

seg-9dec9cd6fbfc = <c1/>的一次运行汇总为：LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

seg-21babf07292a = 必填字段：<c1/>、<c2/>、<c3/>

seg-f7bd59312f9b = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-585a1b0d5950 = 示例<c1/>设置了以下内容等：

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = 引擎给出的结果标签：MODELLED — 该链路将每一级的输出交给下一级；各级保留其各自的标签（验证矩阵中的leo-signal、leo-pass、leo-navmsg、leo-pvt与leo-ppp行）。

seg-abe0599498c9 = 引擎为scenarios/leo-pnt-end-to-end.toml（类型leo-pnt-chain）生成的图表

seg-d8b7c2c82566 = <b>MODELLED</b> <c1/>类型：leo-signal设计（公开预设或内联）设定leo-pass频段的中心频率、带宽、码速率和EIRP分配；过境给出被跟踪分量的C/N0与逐历元带限码抖动；最小二乘C/ 测试：<a1>leo_pnt_chain.rs</a1>。

seg-59b976838ef1 = <b>VALIDATED</b> navsignal：正弦积分（sine_integral）、双边频带内BPSK-R功率占比的闭式（bpsk_power_in_band_closed_form）、带限。参考基准（oracle，ExternalDataset）：外部固定的数值有：主瓣功率占{ "90.3" }%，所述工作点处的相干超前-滞后抖动，正弦积分表值，以及零偏移处的BPSK自谱分离系数2/({ "3" } R_c)。仅为内部交叉检查、不属于外部验证的有：带限BPSK的Gabor带宽闭式及其渐近式，以及非零偏移处的偏移BPSK谱分离系数，二者均

seg-faf2775f3003 = <b>MODELLED</b> <c1/>类型：参数化的信号设计（频段、发射带宽、ITU频率划分；采用BPSK(n)、BOC(m,n)、MB的捕获、数据和导频分量。参考基准（oracle，InternalConsistency）：上面两行已验证的闭式、平方律虚警恒等式P_d(snr = { "0" }) = P_fa与Holmes平均捕获时间，以及可还原为频谱类型自身SSC链（同一段Jammer::ssc代码）。设计本身属于输入：标注为REPRESENTATIVE或WORKSHOP的预设并非公开发布的规范，增强型Feher QPSK、码移键控和OFDM的频谱为近似，且其形状

seg-752b6d88fc9c = 定位阶段将C/N0建模为仰角正弦在截止角与天顶之间的一条直线；该链路根据该过境弧段所跟踪的C/N0拟合这条直线，因此特定于该过境弧段的形状（等通量平台、波束边缘）被简化为两个数值。（结果<c1/>）

seg-f609a2991c7f = 交给定位阶段的SISRE，是导航电文相对于Kshana积分所得真值轨道的表示误差，再与场景给定的od_sisre_m按平方和开方合成；电文阶段本身不对定轨或预报建模。（结果<c1/>）

seg-f75f874cdfaa = 定位阶段用不限带宽的公式，根据传递过来的C/N0自行计算延迟锁定环抖动；该过境弧段在其旁边报告实际设计的带限抖动。（结果<c1/>）

seg-174ce18ade58 = 精密单点定位阶段将电文的SISRE作为LEO轨道与钟差误差；其码噪声和相位噪声仍是该阶段自己的输入。（结果<c1/>）

seg-0aaff940eacb = 在过境弧段阶段和电文阶段，以一颗卫星（第一颗其频段承载该设计的卫星）代表整个LEO系统。（结果<c1/>）

seg-65930be43134 = MODELLED：该链路把每个阶段的输出交给下一阶段；各阶段保留各自的标签（验证矩阵中的leo-signal、leo-pass、leo-navmsg、leo-pvt和leo-ppp行）。（结果<c1/>）

seg-bf452e9ae07f = MODELLED：每个阶段保留各自的标签；该链路不增添任何物理模型。（场景文件注释，第{ "25" }行）

seg-0bff72185f12 = <s1>上一页</s1>leo-pass

seg-851e55b87d01 = <s1>下一页</s1>leo-ppp
