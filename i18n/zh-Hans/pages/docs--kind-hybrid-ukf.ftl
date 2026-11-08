# docs--kind-hybrid-ukf: translations (zh-Hans)

seg-debc2f07db78 = true

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-7b2721b7588d = 引擎v{ $version }的场景类型，所属系列为<a1>惯性、融合与量子传感器</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为MODELLED（标签如何获得，见README的Evidence一节）。

seg-451a304052c4 = <b>MODELLED</b>由第一性原理（k_eff·T²、QPN）得出的冷原子干涉加速度计。参考基准（oracle，ExternalDataset）：已发表的CAI原始论文数值向量（Cheinet { "2008" }传递函数；Peters/Freier灵敏度）：k_eff·T² 完全吻合，散粒噪声ASD为单边下限，与每台已发表仪器相差在约{ "2" }× 以内（实际器件的技术噪声高于量子下限）。这是一个范围界定，而非等同。{ "0.30" }第{ "2" }轮（已预先登记fcb9ac64），一项发现（仍为MODELLED）：仅含QPN的旋转噪声对照Gauguet等的实测值

seg-9955b1b1c018 = 量子惯性传感器性能为MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = 系列页面：<a1>惯性、融合与量子传感器</a1>

seg-ea4498cc0324 = <b>VALIDATED</b> 15状态误差状态EKF，松耦合（已在真实IMU/GNSS行驶数据上对照NaveGo验证）；紧耦合伪距/多普勒UKF以及耦合的钟+位置 。参考基准（oracle，ExternalDataset）：NaveGo v1.4（R. Gonzalez，LGPL-3.0，在GNU Octave下作为工具运行，从不链接）：其松耦合ins_gnss处理自带的真实Ekinox IMU/GNSS陆地车辆行驶数据，两个解均对照Ekinox参考轨迹评分。两个滤波器读取同一份{ "20" } Hz float32输入，Kshana的配置由数据集已发表参数机械映射而来。Kshana的水平与垂直位置RMS及其

seg-4b84d9846715 = 来源：<c1/>

seg-d8da1a3f1798 = <c1/>（场景类型）

seg-c6edf89eb8d4 = 17状态量子+经典混合紧耦合GNSS/INS UKF（MODELLED）：{ "15" }个INS误差状态 + 由CAI导出的加速度计偏置修正 + 来自q参数时钟引擎的2状态（相位+频率）时钟，由有界的CAI误差模型驱动。性能指标是滤波器的自洽性（NEES + 新息白度对照 χ² 界限）——这是自洽性陈述，不是对真实世界精度的保证。仅为仿真；无TRL>{ "3" }，无飞行继承，无外部验证。

seg-d43a562eb9c2 = <c1/>的一次运行汇总为：scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

seg-be1b25b8551d = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-139800576fb7 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-40773fa1ab5f = 示例<c1/>设置了以下内容等：

seg-5e9c8b22ed24 = 冷原子（Rb-87 D2）干涉加速度计；有界

seg-4c8e2caeba5b = 超稳/光学星载振荡器等级，白调频sigm

seg-2968660fa880 = 引擎为scenarios/hybrid-ukf.toml（类型hybrid-ukf）生成的图表

seg-5719161d0b2a = <b>MODELLED</b>有界（最佳/标称/保守）的冷原子干涉仪性能——偏置不稳定性、速度/角度随机游走、标度因数稳定度、询问。参考基准（oracle，InternalConsistency）：内部自洽：所引用的VRW范围已与CaiAccelerometer::accel_asd物理模型交叉核对，原始动态范围由条纹模糊极限算出；数值为MODELLED的文献调研范围（needs_source_confirmation），没有任何器件经独立验证，没有验证光环

seg-8632967dc5f8 = MODELLED仿真。在有界的CAI与时钟噪声输入下的滤波器自洽性（NEES + 新息白度）——这是自洽性陈述，不是对真实世界精度的保证。不是外场/飞行结果；无TRL>{ "3" }，无飞行继承，无外部验证。CAI硬件由合作方负责。（结果<c1/>）

seg-e55c8e2bc619 = 17状态量子+经典混合紧耦合GNSS/INS UKF（MODELLED）：{ "15" }个INS误差状态 + 由CAI导出的加速度计偏置修正 + 来自q参数时钟引擎的2状态（相位+频率）时钟，由有界的CAI误差模型驱动。（类型目录（<c1/>））

seg-b06538ca3a8c = 17状态量子 + 经典混合紧耦合GNSS/INS UKF（MODELLED）。（场景文件注释，第{ "1" }行）

seg-b5fc96916b4e = 性能指标——滤波器自洽性（NEES + 新息白度），这是仿真能够如实断言的、关于估计器的唯一内容。在真值恰由滤波器所假定的噪声生成的蒙特卡罗集合上，汇总的NIS（白度）与NEES均值必须落在各自{ "95" }% 的卡方区间之内。这是自洽性陈述，不是对真实世界精度的保证。（场景文件注释，第{ "21" }至{ "25" }行）

seg-91afdc2d3ee2 = 如实声明：此处一切均为MODELLED / 仿真。CAI与时钟输入为有界的、具文献代表性的数值，不是实测硬件；CAI硬件及其关键人员仍由合作方负责。无TRL>{ "3" }，无飞行继承，无外部验证。（场景文件注释，第{ "27" }至{ "29" }行）

seg-9b94bd3ce7df = 一致性参考基准所汇总的蒙特卡罗随机种子，以及滤波器失谐乘数。{ "24" }个随机种子给出基于运行次数的卡方NEES区间（{ "8" }*{ "24" }自由度），其紧致程度足以区分匹配与失谐的滤波器，同时使运行开销保持较低。将q_factor / r_factor设为偏离{ "1.0" }的值，即可使滤波器失谐，并观察一致性门限将其拒绝（q_factor缩放所假定的过程噪声，r_factor缩放所假定的测量噪（场景文件注释，第{ "44" }至{ "48" }行）

seg-496b17a8d3b9 = 主题页面：<a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = 主题页面：<a1>QUANTUM.md</a1>

seg-963425965e64 = <s1>上一页</s1>hybrid-optical-rf

seg-437eb2e463b3 = <s1>下一页</s1>hybrid
