# docs--kind-fusion: translations (zh-Hans)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC 数据手册 sigma_y(1s)={ "3e-10" }

seg-51362910dcb7 = 有 { "2" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-f4cf8b629797 = 主题页面：<a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-be831b52a339 = 以及矩阵中另有 { "4" } 项。

seg-f70076ea4a77 = <b>VALIDATED</b> 阿伦/修正/哈达玛偏差加带 χ² 置信区间的幂律噪声识别。参考基准（ExternalDataset）：NIST SP { "1065" }（Riley）/ Stable32 在 NBS14 上的参考偏差

seg-5278ccdaf16f = <b>MODELLED</b> 闭式滑行误差增长加守时到阈值；量子时钟等级。参考基准（ReferenceImpl）：多步 clock_state 协方差递推（同一代码库内的交叉检查）；底层的滑行方差与守时反演核对照 scipy 经外部验证（见“Clock-holdover coast-variance & threshold inversion”）。各等级的红噪声底守时数字仍为 MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3状态（相位/频率/漂移）van-Loan 卡尔曼时钟，Joseph 稳定化。参考基准（ReferenceImpl）：filterpy { "1.4.5" } KalmanFilter（R. Labbe，MIT），F 通过 scipy.linalg.expm 得到，Q 通过 Van-Loan { "1978" } 分块矩阵得到：这是一个独立的参考实现，复现了 kshana 的完整滤波器轨迹。跨实现一致性：时钟物理和阿伦校准没有经外部验证，因此该行仍为 MODELLED。{ "0.30" } 外部比较，一项发现（仍为 MODELLED）：在 { "11" } 颗 GPS Blo 的 IGS 最终 { "30" } s 钟差上

seg-e12f672ae71d = GNSS 拒止下的时钟守时为 MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-8de95b3a9229 = 星载时钟状态估计为 MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e4b64d7277da = 欺骗干扰检测为 MODELLED，而不是经独立验证：其中一项子声明经过外部核对，但整项能力由模型计算的部分组合而成，因此该能力仍属于由模型计算得出一级。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-4de09fe367df = 来源：<c1/>

seg-53e498cffeba = <c1/>（场景类型）

seg-7b2721b7588d = 引擎 v{ $version } 的场景类型，所属系列为<a1>惯性、融合与量子传感器</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-ec26df467b88 = 基于同一组混合输入的联合卡尔曼传感器融合 PNT。

seg-25708bf88728 = <c1/> 的一次运行汇总为：scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

seg-dba20bb12cda = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>

seg-3d5cae65f093 = 可选字段：<c1/>

seg-56bca36cabba = 示例 <c1/> 设置了以下内容等：

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = 导航级石英加速度计；示意性噪声漂

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = 冷原子加速度计，长 tau 速度随机游走低；

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = 导航级石英加速度计；示

seg-c8a1c797f4b1 = 引擎为 scenarios/fusion-pnt.toml（类型 fusion）生成的图表

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }：点名该类型的<a1>验证矩阵</a1>行。

seg-46c0903ff7b5 = <b>VALIDATED</b> 通过高斯–牛顿批处理微分修正器和序贯滤波器，在二体+J2 力模型下由地面站测距恢复历元状态 [r,v] 测试：<a1>batch_sequential_orbit_determination_reference.rs</a1>。

seg-44f77aaf9d7e = <b>MODELLED</b> 误差状态 EKF，含 { "15" } 个 INS 状态、双状态接收机钟，以及每颗被跟踪卫星一个浮点载波模糊度；伪距、载波相位及可选的距离变化率来自 SGP4 Walker 星座（光行时与 Sagnac 效应），Klobuchar 与 测试：<a1>fusion_carrier_tc.rs</a1>。

seg-509f93c7e9ce = <b>MODELLED</b> 基于轨迹库的三个 gnss-ins 场景（一艘以 { "8" } m/s 蛇行、中断五分钟的船舶；一列通过两颗卫星可见的路堑和隧道的列车；一架中断期覆盖 25 度倾斜转弯的飞机），以及该包的可选 测试：<a1>gnss_ins_packs.rs</a1>。

seg-e0633b308e4e = <b>MODELLED</b> 对位置、速度、时钟相位和频率使用同一个堆叠卡尔曼滤波器，输入为使位置与钟耦合的伪距（带互协方差的 Joseph 形式更新）；增广了常值加速度计偏置的 1-DOF 变体 测试：<a1>fusion_coupled_filters.rs</a1>。

seg-451a304052c4 = <b>MODELLED</b> 由第一性原理（k_eff·T²、QPN）得出的冷原子干涉加速度计。参考基准（oracle，ExternalDataset）：已发表的 CAI 原始论文数值向量（Cheinet { "2008" } 传递函数；Peters/Freier 灵敏度）：k_eff·T² 完全吻合，散粒噪声 ASD 为单边下限，与每台已发表仪器相差在约 { "2" }× 以内（实际器件的技术噪声高于量子下限）。这是一个范围界定，而非等同。{ "0.30" } 第 { "2" } 轮（已预先登记 fcb9ac64），一项发现（仍为 MODELLED）：仅含 QPN 的旋转噪声对照 Gauguet 等的实测值

seg-7e95210bcc48 = <b>MODELLED</b> 守时期间由偏置 + 标度因数 + VRW + 稳定度衰减复合而成的位置预算。参考基准（oracle，ReferenceImpl）：对双重积分白加速度噪声的独立 numpy 蒙特卡罗 SDE 积分（以真正独立的算法验证解析 VRW 方差）+ 偏置/标度因数项的 Groves { "2013" } 已发表值锚点；CAI 器件数值量化的是合作方硬件，仍为 MODELLED

seg-9955b1b1c018 = 量子惯性传感器性能为 MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-5fef5e8cc64e = 量子惯性航位推算韧性为 MODELLED，未经独立验证：它是对照本代码库内另一套独立实现检查的，该实现独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = 系列页面：<a1>惯性、融合与量子传感器</a1>

seg-a849735fcc6e = 主题页面：<a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>上一页</s1>ephemeris

seg-d14a7850df1c = <s1>下一页</s1>gnss-ins
