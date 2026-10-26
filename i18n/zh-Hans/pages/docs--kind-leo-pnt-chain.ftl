# docs--kind-leo-pnt-chain: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-7f5ad6ab8c23 = GPS

seg-cd04f5662884 = MODELLED。（类型目录（<c1/>））

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = 有 { "3" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-49964654d5f4 = 引擎 v{ $version } 的场景类型，所属系列为<a1>近地轨道导航</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-c5478f572d21 = 系列页面：<a1>近地轨道导航</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 第 { "2.4.1" } 节步骤 { "3" } 至 { "9" }（由 N_wet 得出的参考 sigma、有效路径长度、天线平均因子、{ "0.01" } % 至 { "50" } % 时间的衰落深度。参考基准（oracle，ExternalDataset）：ITU-R Study Group { "3" } 验证示例（CG-3M3J-13-ValEx-Rev8.3.0），用于 P.618-14 闪烁，各站点的 P.453-14 N_wet 取自同一批示例；连同 URL 与获取日期提交于 tests/fixtures/leo_link/p618_14_scintillation.csv。由温度和湿度得出的湿折射率表达式不在该行覆盖范围之内

seg-ab58ab4e7dc6 = <b>VALIDATED</b> 每个频段的群延迟 { "40.3" } STEC/f^{ "2" }；无电离层组合系数 f1^2/(f1^{ "2" } - f2^{ "2" }) 与 -f2^2/(f1^{ "2" } - f2^{ "2" })，以及噪声放大 sqrt(a1^{ "2" } s1^{ "2" } + a2^。参考基准（oracle，ExternalDataset）：IS-GPS-200 第 { "20.3.3.3.3.2" } 节，其中给出由一阶 1/f^{ "2" } 缩放得出的 L1/L2 群延迟比 gamma = (77/60)^{ "2" }，以及 Friis 传输公式（Proc. IRE，{ "1946" }）。验证的是缩放定律，而不是斜向 TEC

seg-ae15d15bf151 = 主题页面：<a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = 来源：<c1/>

seg-3a66efa79aa2 = <c1/>（场景类型）

seg-81d1604171a5 = 端到端的一个 LEO-PNT（低地球轨道的定位、导航与授时）系统，适用于任意星座与信号：由 signal_design 指定的 leo-signal 设计（公开预设或内联 [signal] 设计）设定 [pass] 频段的中心频率、带宽、码速率和 EIRP 分配，leo-pass 链路预算给出过境期间被跟踪的 C/N0 与带限码抖动，sin(仰角) 的 C/N0 直线以及 [navmsg] 电文的广播 SISRE（在过境卫星的高度上拟合）输入 [fusion] leo-pvt 联合定位解中的每个 LEO 系统，并可选地输入 [ppp] leo-ppp 各案例；每次交接都列出其数值与单位。MODELLED。

seg-9dec9cd6fbfc = <c1/> 的一次运行汇总为：LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

seg-21babf07292a = 必填字段：<c1/>、<c2/>、<c3/>

seg-f7bd59312f9b = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-585a1b0d5950 = 示例 <c1/> 设置了以下内容等：

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = 引擎给出的结果标签：MODELLED — 该链路将每一级的输出交给下一级；各级保留其各自的标签（验证矩阵中的 leo-signal、leo-pass、leo-navmsg、leo-pvt 与 leo-ppp 行）。

seg-abe0599498c9 = 引擎为 scenarios/leo-pnt-end-to-end.toml（类型 leo-pnt-chain）生成的图表

seg-d8b7c2c82566 = <b>MODELLED</b> <c1/> 类型：leo-signal 设计（公开预设或内联）设定 leo-pass 频段的中心频率、带宽、码速率和 EIRP 分配；过境给出被跟踪分量的 C/N0 与逐历元带限码抖动；最小二乘 C/ 测试：<a1>leo_pnt_chain.rs</a1>。
