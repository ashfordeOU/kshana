# docs--kind-pvt: translations (zh-Hans)

seg-debc2f07db78 = true

seg-8e845ce908ee = 引擎v{ $version }的场景类型，所属类别为<a1>GNSS测量、定位与完好性</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-f6b7ca020692 = 类别页面：<a1>GNSS测量、定位与完好性</a1>

seg-f4cf8b629797 = 主题页面：<a1>INTEGRITY.md</a1>

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry与check：对引擎自身迭代最小二乘定位（pvt::solve_spp，单位权，自真实位置起解）做带随机种子的蒙特卡罗（每种几何N = { "20,000" }个历元，sigma = { "1.5" } m，ChaCha8随机种子{ "36" } + i） 测试：<a1>uere_dop_monte_carlo.rs</a1>。

seg-aab2f85048b7 = 来源：<c1/>

seg-56f864d32367 = <c1/>（场景类型）

seg-b7b67e03f125 = 基于真实观测的单点定位：由RINEX { "3" }观测文件和广播导航文件（码伪距、广播星历、Klobuchar电离层、Saastamoinen/Niell对流层）解算接收机位置，并可选地与测量坐标进行核对验证。

seg-79d2a463393d = <c1/>的一次运行汇总如下：pvt 55bdd18628e1 | { "11" }颗导航卫星 | 3个历元中2个已解算 | 平均{ "9.0" }颗卫星，PDOP { "1.8" } | 3D误差RMS { "5.74" } m（最大{ "7.12" } m）

seg-fd22bc5c2b67 = 必填字段：<c1/>、<c2/>

seg-4b39ee73d65d = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>

seg-4f02bdcbc7c7 = 示例<c1/>设置了以下内容等：

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = 引擎为scenarios/pvt-abmf.toml（类型pvt）绘制的图表

seg-e6f678eeb384 = <b>MODELLED</b>精密单点定位组装中的无发散Hatch滤波器（无电离层码由无电离层载波平滑，窗口N个历元，失锁、几何无关跳变或间断时重启）

seg-5a42823318a8 = <b>VALIDATED</b> IS-GPS-200 / Galileo-OS / BeiDou-OS广播星历开普勒根数 → 由解析后的RINEX-3导航记录得到ECEF卫星位置。参考基准（ExternalDataset）：由C源码编译的RTKLIB v2.4.2-p13 eph2pos()（T. Takasu，BSD-2-Clause），这是IS-GPS-200/SIS-ICD的独立实现，输入相同的RINEX-3导航记录；卫星ECEF位置一致到约{ "62" } nm。（SP3精密星历插值另行核对验证，见“SP3 precise-ephemeris interpolation”）

seg-51cac2f918e0 = 专题页：<a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>上一页</s1>passes

seg-d1dc82bbfb73 = <s1>下一页</s1>quantum-anomaly-detect
