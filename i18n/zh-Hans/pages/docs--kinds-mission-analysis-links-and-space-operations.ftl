# docs--kinds-mission-analysis-links-and-space-operations: translations (zh-Hans)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = 类别

seg-cb9447893c7f = 一颗卫星经过一个地面站：沿每次过境给出斜距、仰角和 Es/N0，每一步所选的 DVB-S2 MODCOD（ETSI EN { "302" } 307-1 表 { "13" } 的门限加实现裕量），以及 ACM 相对于在遮蔽角处闭合的恒定编码基线所传输的数据量。MODELLED。

seg-046f69293874 = 引擎为 scenarios/acm-link.toml（类型 acm-link）生成的图表

seg-7eff466eb018 = 航天器姿态控制：带有三个或更多平衡反作用轮的刚性本体在 MRP 反馈（L = -K sigma - P omega）下的惯性指向机动，最小范数的轮力矩被限幅到各电机的上限，采用 RK4 和零阶保持；可选地基于模拟陀螺（角度与角速率随机游走）和星敏感器，用乘性 EKF 闭环。报告稳定时间、最终与峰值指向误差、峰值轮速与力矩、饱和比例、角动量漂移，以及在有估计器时的姿态误差和 NEES。真实状态回路已对照 Basilisk { "2.9.1" } 得到 VALIDATED；估计器为 MODELLED。

seg-08c624d5324d = 引擎为 scenarios/aocs-slew.toml（类型 aocs）生成的图表

seg-0cef33b41040 = 孔径占空比：一份接触计划对一组可操纵孔径所隐含的导航与通信时间分配。输入一份接触计划（一组 <c1/> aos_s/los_s 窗口，每个窗口请求导航或通信，与 <c2/> 预测器输出的 aos_s/los_s 词汇相同）、孔径数量和一项仲裁策略（ARBITRATION POLICY，默认为导航优先，也可为通信优先，或非抢占式先到先服务），报告导航占空、通信占空、空闲占空，以及每个会话的中断：会话所请求但没有孔径为其服务的接触时间。按窗口边界做精确的区间扫描，因此相接的窗口从不争用，也没有任何孔径秒被重复计数；导航、通信和空闲孔径秒分别独立累计，并与 apertures*horizon_s 相符。报告会写明所解析出的策略、其完整定义，以及占空和中断的定义，因为引用占空数值而不给出其仲裁策略，是不可复现的。MODELLED 的调度运算：孔径更换服务或会话时不计转换、重新调谐或切换时间，决策中不涉及数据量、缓冲状态、能量预算或链路闭合，接触窗口为输入，其几何取决于产生它们的来源。不是地面段调度产品。

seg-a8b38ed8e029 = 引擎为 scenarios/aperture-duty-cycle.toml（类型 aperture-duty-cycle）生成的图表

seg-34d041d6bd9f = 多级运载器在非自转的球形地球上穿过 US Standard Atmosphere { "1976" } 的平面重力转弯上升段（垂直爬升、俯仰踢转、推力沿速度方向），对重力、阻力、操纵和背压损失进行积分，并检查理想 dv 减去损失是否等于关机速度；最大动压、峰值加速度和关机状态。MODELLED。

seg-ccf2185b0b5e = 引擎为 scenarios/ascent-losses.toml（类型 ascent-losses）生成的图表

seg-62c0dda9fc56 = 3-DOF姿态与指向误差预算：最坏情况下的重力梯度干扰力矩（(3/2)(μ/R³)ΔI），以及在各个已命名的 1σ 贡献项（传感器噪声、反作用轮抖动、热、对准）上的方和根指向误差预算及其主导项，输入为轨道高度和本体惯量差。MODELLED 的标量 AOCS 预算，是 Basilisk/42 的硬件前补充，不是控制回路、6-DoF或柔性模态仿真。

seg-ad0e72e3b688 = 引擎为 scenarios/attitude-budget.toml（类型 attitude-budget）生成的图表

seg-be4e928a5865 = 多颗卫星对多个地面站的地面接触规划：视在接入窗口（SGP4、IAU 2006/2000A 地固坐标系、ITU-R P.834 折射、光行时）、每次过境的 DVB-S2 ACM 数据量（ETSI EN { "302" } 307-1 表 { "13" } 门限），以及无冲突的调度（每副天线同一时刻只服务一颗卫星并有转换时间，每颗卫星同一时刻只对应一个地面站，按优先级加权的交付量以各自的积压量为上限），采用边际价值贪心法、先到先服务基线，以及在小规模集合上的精确分支定界，并给出贪心法的最优性差距。MODELLED。

seg-e26b549579e2 = 引擎为 scenarios/contact-schedule.toml（类型 contact-schedule）生成的图表

seg-b843e2e0a4ee = 在自转的球形地球或火星上的 3-DoF 质点大气再入（弹道式或恒定倾侧的升力式），RK4，穿过 US76、指数大气或火星大气，采用 Sutton-Graves 驻点对流加热（NASA TR R-376）：峰值减速度、热流和动压，热载荷，下程，自转坐标系能量检查，以及并列给出的 Allen-Eggers 闭式。峰值减速度对照已发布的 Stardust 标称值进行检查；加热为 MODELLED。

seg-dbb618cd6357 = 引擎为 scenarios/entry-heating-stardust.toml（类型 entry-heating）生成的图表

seg-47b4aea6ed01 = 对地观测载荷的足迹与覆盖几何（SMAD 空间三角形）：针对给定的轨道高度、倾角（默认为太阳同步）和传感器 FOV/IFOV，给出地球角半径、幅宽、星下点地面采样距离、最大离天底接入角、圆轨道周期、J2 交点周期和赤道星下点轨迹间距，并附连续覆盖标志。MODELLED 球形地球几何（无辐射度/MTF/大气/抖动/耀光）；节点间距 R_e·(ω − Ω̇)·T_nodal，采用一阶 J2 长期项速率。

seg-c2a8332f2ee2 = 引擎为 scenarios/eo-coverage.toml（类型 eo-coverage）生成的图表

seg-816bd5a5808a = 天底成像仪辐射度与图像质量：朗伯场景的入瞳辐亮度、相机方程、信号与散粒/暗/读出/量化噪声及 SNR；奈奎斯特频率处的系统 MTF（衍射 x 探测器 x 拖尾 x 抖动）、由其得出的相对边缘响应、Q = lambda F/p，以及未做 MTF 补偿的 GIQE { "4" } 版 NIIRS。MODELLED。

seg-bf7b52f7a01e = 引擎为 scenarios/eo-radiometry.toml（类型 eo-radiometry）生成的图表

seg-7a4e6215a488 = 二体发射与上升几何：发射方位角（sin Az = cos i / cos lat）、最小可达倾角、圆轨道速度、地球自转的向东增益、目标倾角低于发射场纬度时的折线（dogleg）平面变轨 Δv，以及每日发射机会次数。MODELLED 球形地球几何（无自转地球速度三角形修正，无上升/阻力损失模型）。

seg-9696283a95ae = 引擎为 scenarios/launch-window.toml（类型 launch-window）生成的图表

seg-953188c11165 = 基于 CCSDS { "401" } / DSN 810-005 链路方程的单向链路预算：针对发射 EIRP、接收 G/T、距离、数据速率和频段（s|x|ka），对照所需 Eb/N₀，给出自由空间路径损耗、C/N₀、Eb/N₀、余量和链路闭合情况。这是根据所提供输入进行的确定性工程计算（不是经过标定的终端数据手册）。

seg-bd375631bc7e = 引擎为 scenarios/link-budget.toml（类型 link-budget）生成的图表

seg-4e31c8daf798 = 台账

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-69ee217ed8e0 = 来源：<c1/>

seg-f5091cbeecbf = 任务分析、链路与空间运行（场景类型族）

seg-d0eea6d9d1ad = { "14" } 个场景类型，来自引擎 v{ $version }。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为 MODELLED（标签如何获得，见 README 的“证据”一节）。

seg-6481dabc9458 = 专题页面：<a1>ENTRY-EO-ASCENT</a1>、<a2>CONTACT-SCHEDULING</a2>、<a3>AOCS</a3>。运行一个：<c1/>。所有类型族：<a4>KINDS.md</a4>。

seg-d6c5a581ffaf = 引擎为“任务分析、链路与空间运行”类型族的各类型生成的图表缩略总览

seg-8d65a4a1948d = 二体发射与上升几何：发射方位角（sin Az = cos i / cos lat）、最小可达倾角、圆轨道速度、地球自转的向东增益、当目

seg-dd47e755d262 = 多级运载器在非旋转球形地球上穿过 US Standard Atmosphere { "1976" }（垂直上升、俯仰踢转、推力沿速度方向）的平面重力转弯上升，积分重力

seg-cc88f37328a3 = Allen-Eggers 弹道再入走廊：峰值减速度（与弹道系数无关，V_e^{ "2" } sin/γ//(2eH)）、峰值过载处的速度和高度，以及峰值热流速度，针对进入速

seg-8ad7c34d8c25 = 旋转球形地球或火星上的 3-DoF 质点大气进入（弹道式，或恒定倾侧角的升力式），RK4，穿过 US76、指数大气或火星大气，附 Sutton-Graves 驻点

seg-efe896d3f43b = 对地观测载荷足迹与覆盖几何（SMAD 空间三角形）：地球角半径、幅宽、星下点地面采样距离、最大离轴观测、圆轨道周期、J2 交点周

seg-d3d9652fd8a0 = 星下点成像仪辐射测量与图像质量：朗伯景物的入瞳处辐亮度、相机方程、信号及散粒/暗电流/读出/量化噪声与 SNR；奈奎斯特频率处的系统 MTF（衍射

seg-1940d5c75a98 = 3-DOF 姿态与指向误差预算：最坏情况的重力梯度扰动力矩（(3/2)(μ/R³)ΔI）以及对具名 1σ 贡献项（传感器噪声、反作

seg-e00d18fbb52b = 航天器姿态控制：在 MRP 反馈（L = -K sigma - P omega）下，由三个或更多平衡反作用轮驱动的刚性主体的惯性指向机动，最小范数轮力矩限幅到各

seg-496fa280de7b = 基于 CCSDS { "401" } / DSN 810-005 链路方程的单向链路预算：自由空间路径损耗、C/N₀、Eb/N₀、余量与闭合，针对发射 EIRP、接收 G/T、距离、数据率和频段（s/x/ka），对

seg-f0aca7ea1ffa = 一颗卫星过一个站：每次过境沿途的斜距、仰角和 Es/N0，每一步选定的 DVB-S2 MODCOD（ETSI EN { "302" } 307-1 表 { "13" } 的门限加上实现余量）

seg-44c4890ba07e = 多颗卫星对多个站的地面接触规划：视在接入窗口（SGP4、IAU 2006/2000A 地固系、ITU-R P.834 折射、光行时），DVB-S2 ACM 数据量

seg-19ab136e9f9b = 孔径占空比：接触计划对一组可转向孔径所隐含的导航与通信时间分配。

seg-ee0c649ca8b2 = CCSDS 133.0-B 空间包协议成帧：对合成的 TM/TC 包流（6 八位组主头 + 数据域）编码，并报告每个包的头部解码、总八位组数以及精确的编码↔解

seg-e561f3a749db = CCSDS OEM 互操作桥：导入由外部飞行动力学工具生成的轨道星历电文（GMAT/Orekit/STK 都输出 OEM），并报告其分段/对象/坐标系/历元跨度，外加

seg-1f074d7beccc = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>。

seg-8f65824c39c5 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>launch-window</a1>。

seg-2926bde689d3 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>。

seg-66f6489411d0 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>ascent-losses</a1>。

seg-481ce1d98bc7 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>。

seg-fff98550eb48 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>reentry</a1>。

seg-9cf8d4b6064f = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>。

seg-84e1bddcbc95 = <b>台账：</b>MODELLED { "1" } · VALIDATED { "1" }。完整页面（含输入、结果、证据与局限）：<a1>entry-heating</a1>。

seg-eab43348803e = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>。

seg-9c6ce756a89a = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>eo-coverage</a1>。

seg-cd84a7bdbe57 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>。

seg-320d724ac797 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>eo-radiometry</a1>。

seg-905487bf50f1 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>。

seg-14511e367361 = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>attitude-budget</a1>。

seg-540fa1932dad = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>。可选字段：<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>。

seg-6d2e9b9ce87f = <b>台账：</b>MODELLED { "1" } · VALIDATED { "1" }。完整页面（含输入、结果、证据与局限）：<a1>aocs</a1>。

seg-3345731b5729 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>。

seg-f8b896b81014 = <b>台账：</b>MODELLED { "1" } · VALIDATED { "1" }。完整页面（含输入、结果、证据与局限）：<a1>link-budget</a1>。

seg-e38e356f4b71 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>。

seg-eed876ed5aab = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>acm-link</a1>。

seg-5fddd2460fb0 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>。

seg-58d00faa1eda = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>contact-schedule</a1>。

seg-5d4f6861f301 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>。

seg-1e06e06d4325 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>aperture-duty-cycle</a1>。

seg-9bb424e01c84 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>。

seg-688071019c9e = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>space-packet</a1>。

seg-03c06f9fdc85 = 必填字段：无。可选字段：<c1/>。

seg-568c484ce9a0 = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>oem-interop</a1>。

seg-41996765fcf1 = <s1>上一页</s1>月球与地月空间

seg-1951c46fe429 = <s1>下一页</s1>光学 PNT
