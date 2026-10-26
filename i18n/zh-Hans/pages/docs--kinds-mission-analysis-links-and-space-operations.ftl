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
