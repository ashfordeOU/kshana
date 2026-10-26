# docs--kind-aocs: translations (zh-Hans)

seg-99ef7c1d552c = 引擎 v{ $version } 的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-5cd8b3d8c098 = 来源：<c1/>

seg-7f2ade997df5 = <c1/>（场景类型）

seg-7eff466eb018 = 航天器姿态控制：带有三个或更多平衡反作用轮的刚性本体在 MRP 反馈（L = -K sigma - P omega）下的惯性指向机动，最小范数的轮力矩被限幅到各电机的上限，采用 RK4 和零阶保持；可选地基于模拟陀螺（角度与角速率随机游走）和星敏感器，用乘性 EKF 闭环。报告稳定时间、最终与峰值指向误差、峰值轮速与力矩、饱和比例、角动量漂移，以及在有估计器时的姿态误差和 NEES。真实状态回路已对照 Basilisk { "2.9.1" } 得到 VALIDATED；估计器为 MODELLED。

seg-a499721d08b1 = 运行一次 <c1/> 的摘要为：aocs: { "4" } 个轮，{ "600" } s 机动，起始角 { "82.06" } deg -> 在 { "481.0" } s 时稳定到 { "0.1" } deg 以下 | 最终 { "2.37e-2" } deg | 轮速峰值 { "1797" } rpm | 真实状态回路

seg-2ad4d3f07a6a = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-ed0c5c6266d9 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-a09eb69b36d7 = 示例 <c1/> 设置了以下内容等：

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = 有 { "2" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-b054c73f22e5 = 无值

seg-6e22c97374b0 = 结果标签（引擎给出的）：VALIDATED 的控制律和轮动力学（在真实状态回路上对照 Basilisk { "2.9.1" }）；本次运行的输入是场景自带的，即 MRP 反馈下的反作用轮姿态控制、惯性指向、无传感器噪声、无摩擦

seg-08c624d5324d = 引擎为 scenarios/aocs-slew.toml（类型 aocs）生成的图表

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }：列出此类型的<a1>验证矩阵</a1>各行。

seg-d69a588facf1 = <b>VALIDATED</b> 带有三个或更多平衡反作用轮的刚性本体的惯性指向姿态控制：MRP 反馈律 L_r = -K sigma_BR - P omega_BR（Schaub 和 Junkins），最小范数的轮电机力矩 G_s u = -L_r 被限幅到各轮的 l 测试：<a1>aocs_basilisk_oracle.rs</a1>。

seg-7bc495b05d9a = <b>MODELLED</b> Lefferts-Markley-Shuster 乘性 EKF：本体系姿态误差和陀螺偏置状态，用陀螺角速率减去偏置估计值进行传播，并采用 Farrenkopf 的离散过程噪声（角度与角速率随机游走），星敏感器更新

seg-7e3e0dcc936f = <b>VALIDATED</b> 带有三个或更多平衡反作用轮的刚性本体的惯性指向姿态控制：MRP 反馈律 L_r = -K sigma_BR - P omega_BR（Schaub 和 J。参考基准（ExternalDataset）：Basilisk { "2.9.1" }（AVSLab，ISC；bsk 轮运行作为单独的工具，从不链接或随仓库分发）：航天器本体、reactionWheelStateEffector（BalancedWheels，开启力矩限幅）、simpleNav、inertial3D、attTrackingError、mrpFeedback（无积分项）和 rwMotorTorque，dt = { "0.1" } s，采用其 RK4，与 Kshana 自身的实现在三种情形下对照（三个正交轮；一个四轮金字塔构型；一个使轮饱和的四轮情形），

seg-d7889856073b = <b>MODELLED</b> Lefferts-Markley-Shuster 乘性 EKF：本体系姿态误差和陀螺偏置状态，用陀螺角速率减去偏置估计值进行传播，并采用 Farre。参考基准（InternalConsistency）：内部自洽：滤波器的归一化估计误差平方，对照由相同传感器模型在蒙特卡罗随机种子上模拟的真值，以及姿态和偏置估计的收敛。不包括：没有与任何外部估计器或飞行数据作过比较（Basilisk { "2.9.1" } 没有 MEKF 模块）；传感器模型是教科书式的，不含失准、比例因子或星敏感器视场效应。

seg-3b71575e0c23 = 真实状态回路已对照 Basilisk { "2.9.1" } 得到 VALIDATED；估计器为 MODELLED。（类型目录（<c1/>））

seg-c7ff0ddbd040 = 基于陀螺和星敏感器的乘性 EKF 姿态估计为 MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-cc4e7274d409 = 主题页面：<a1>AOCS.md</a1>

seg-b022bad77259 = <s1>上一页</s1>acm-link

seg-1fb6e680fd4a = <s1>下一页</s1>aperture-duty-cycle
