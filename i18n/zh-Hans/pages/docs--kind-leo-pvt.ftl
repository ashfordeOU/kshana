# docs--kind-leo-pvt: translations (zh-Hans)

seg-7f5ad6ab8c23 = GPS

seg-b054c73f22e5 = 无值

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-a849735fcc6e = 主题页面：<a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = 引擎 v{ $version } 的场景类型，所属系列为<a1>近地轨道导航</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-c5478f572d21 = 系列页面：<a1>近地轨道导航</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = 来源：<c1/>

seg-fdba999dab11 = <c1/>（场景类型）

seg-093aac4b5ff1 = 融合中地球轨道（MEO）与低地球轨道（LEO）的定位、导航与授时（PNT），适用于任意星座：每个 [[system]] 可以是星座设计类型的 GNSS 预设、LEO 预设（xona-pulsar、iridium-stl、starlink-sop、centispace、generic-c-band、atomic-zero-clock 星历模型，或另一个预设文件，每个预设位于各自的文件中，其来源标注为 PUBLIC、WORKSHOP 或 DERIVED）、Walker 壳层或显式的轨道根数集，并带有载波、码片速率、从仰角截止角到天顶的载噪比密度（C/N0）包络、空间信号测距误差（SISRE）、多普勒标准差和时钟模型（自带接收机钟，因此系统间偏差需要估计，或采用已知的广播偏移）。共有四种模式。DOPPLER：基于距离变化率的批处理 Gauss-Newton 定位，带解析偏导数、钟漂和可选的速度状态以及可选的高程约束，可用单颗或多颗卫星，给出误差随窗口长度的变化、每个 LEO 系统的多普勒、多普勒变化率和加加速度包络，以及单次过境的沿轨与横轨精度随横轨偏移的变化（过境弧段经过头顶时横轨误差无限增大；单次过境还存在关于星下点轨迹对称的镜像解）。仅用多普勒的机会信号（starlink-sop）在此运行。JOINT：逐历元的加权最小二乘伪距定位，分别采用仅 GNSS、仅 LEO 以及两者合用，各测量值的标准差取自 C/N0 下的延迟锁定环热噪声模型加上 SISRE（或取固定标准差，以便由信号模型提供），并给出估计的系统间偏差，以及 PDOP/HDOP/VDOP 随加入的 LEO 卫星数的变化。POLAR：给出 GNSS、LEO 以及两者合用时，可见卫星数和 DOP 随纬度的变化。TIMING：用位置已知的 LEO 卫星向协调世界时（UTC）进行时间传递，采用双状态钟滤波器，其过程噪声来自引擎的振荡器等级，给出随 C/N0 和振荡器的变化，以及 IS-GPS-200 的系统时到 UTC 表达式；设置 [timing] trace = true 时，每一行还报告其在每个历元的钟差及预测标准差。VALIDATED：一次从头顶到地平线的过境弧段的最大多普勒，对照已发表的 Iridium（最高 { "36" } kHz）和 Xona Pulsar X1（{ "32" } 至 { "34" } kHz）数据。MODELLED：其余全部；DOP 对照手工推导的算例检查，定位解对照其协方差检查，多普勒模型对照距离加速度恒等式检查。

seg-f34d4bbcac4d = <c1/> 的一次运行概括如下：LEO PVT（联合），位置 { "61.10" }、{ "6.60" }，时长 { "1800" } s GPS gnss { "24" } 颗卫星，高度 { "20182" } km，{ "1575.42" } MHz Galileo gnss { "24" } 颗卫星，高度 { "23222" } km，{ "1575.42" } MHz Pulsar X5 leo { "258" } 颗卫星，高度 { "1080" } km，{ "1190.52" } MHz 在 { "100.0" }% 的历元中有 LEO 测距卫星可见 仅 GNSS 可用性 { "1.000" }，PDOP 中位数 { "1.48" }，3D RMS 误差 { "1.29" } m 仅 LEO 可用性 { "1.000" }，PDOP 中位数 { "2.33" }，3D RMS 误差 { "0.69" } m 融合 可用性 { "1.000" }，PDOP 中位数 { "1.14" }，3D RMS 误差 { "0.63" } m

seg-e271a69236bf = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>

seg-f850cba7d96e = 示例 <c1/> 设置了下列内容等：

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = 有 { "7" } 个随附场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-b43a7ee40372 = 结果标签（引擎给出）：MODELLED 的联合加权最小二乘伪距定位，每个系统一个钟或采用已知偏移；噪声取自 C/N0 包络下的延迟锁定环模型加上空间信号测距误差

seg-90361a6f4e3c = 引擎为 scenarios/leo-pvt-fjord-skyline.toml（类型 leo-pvt）生成的图表

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }：点名此类型的<a1>验证矩阵</a1>行。

seg-68aa305e05a4 = <b>VALIDATED</b> 卫星的精确距离变化率，其地固系位置和速度来自带长期 J2 漂移和地球自转的二体轨道（leo_fusion::geom::EarthOrbit::state，速度为位置的精确时间导数），测试：<a1>leo_doppler_reference.rs</a1>。

seg-c3ef3e0163f2 = <b>MODELLED</b> 基于距离变化率的批处理 Gauss-Newton 定位，带解析偏导数（d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho，d/dv = -u，d/d drift = { "1" }），可选恒定的用户速度，针对地表用户的高程伪测量，阻尼 测试：<a1>leo_fusion_scenarios.rs</a1>。

seg-a4e0166269ea = <b>MODELLED</b> 适用于任意系统组合的加权最小二乘 Gauss-Newton 定位解，每个系统一个接收机钟（系统间偏差与位置一并估计），或采用参考时间尺度上已知的广播偏移；各测量值的标准差由 测试：<a1>leo_fusion_scenarios.rs</a1>。

seg-5c9f826efbc8 = <b>MODELLED</b> 来自每颗可见 LEO 卫星、位置已知的钟差测量，按伪距噪声模型的逆方差合并，再由双状态（相位、频率）卡尔曼滤波器滤波，其过程噪声为振荡器等级的 w 测试：<a1>leo_fusion_scenarios.rs</a1>。

seg-3319b18ac61f = 矩阵中另有 { "1" } 项。

seg-f6bd93155e41 = <b>MODELLED</b> 适用于任意系统组合的加权最小二乘 Gauss-Newton 定位解，每个系统一个接收机钟（系统间偏差与位置一并估计），或采用已知的 . 参考基准（oracle，InternalConsistency）：手工推导的四卫星 DOP（一颗在天顶、三颗在地平线上彼此相隔 { "120" } 度，其法矩阵可手工求逆）、一个系统若有自己的钟且只有一颗卫星则不增加任何几何信息的结构性恒等式、对位置、钟和偏差的无噪声还原，以及对照协方差的带种子误差。仅为内部检查；未与任何接收机的输出比较。{ "0.30" } 外部比较，一项发现

seg-4056b0470099 = <b>MODELLED</b> 与系统无关的输入：每个系统都是 Walker 壳层、显式轨道根数或 GNSS 预设，信号（载波、码片速率、带宽、接收功率或 C/N0 范围。参考基准（oracle，InternalConsistency）：对所引用公开数值的转录，检查其结构（每个公开来源都有 URL，Walker 图样可整除，由接收功率除以 { "290" } K 下的 kT 得到的 C/N0），并非对照外部参考基准。代表性数值在各预设中注明，并且是示意性的

seg-df745ccdaceb = MODELLED 的联合加权最小二乘伪距定位，每个系统一个钟或采用已知偏移；噪声取自 C/N0 包络下的延迟锁定环模型加上空间信号测距误差（结果 <c1/>）

seg-c988291eb41d = MODELLED：其余全部；DOP 对照手工推导的算例检查，定位解对照其协方差检查，多普勒模型对照距离加速度恒等式检查。（类型目录（<c1/>））

seg-be908356ad19 = 天际线预设为 REPRESENTATIVE（出处见 docs/SKYLINE.md 和 <c1/>）：其宽度与起伏的量级取自挪威西部的深峡湾，并非对任何一处峡湾的测绘。仅考虑视线：不含衍射、反射或非视线接收。删除 [skyline] 一节即可与开阔天空比较。MODELLED。（场景文件注释，第 { "15" } 至 { "18" } 行）

seg-1d0ab26930e1 = 带系统间偏差和逐信号误差模型的 GNSS 与 LEO 联合伪距定位为 MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-35916a8ac93e = 作为可选数据预设的具名 LEO PNT 系统，各附其来源，为 MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-6ac7dcc57b2a = <s1>上一页</s1>leo-ppp

seg-458b3eda3250 = <s1>下一页</s1>leo-signal
