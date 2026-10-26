# docs--kind-hybrid: translations (zh-Hans)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC 数据手册 sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = 主题页面：<a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> 阿伦/修正/哈达玛偏差加带 χ² 置信区间的幂律噪声识别。参考基准（ExternalDataset）：NIST SP { "1065" }（Riley）/ Stable32 在 NBS14 上的参考偏差

seg-5278ccdaf16f = <b>MODELLED</b> 闭式滑行误差增长加守时到阈值；量子时钟等级。参考基准（ReferenceImpl）：多步 clock_state 协方差递推（同一代码库内的交叉检查）；底层的滑行方差与守时反演核对照 scipy 经外部验证（见“Clock-holdover coast-variance & threshold inversion”）。各等级的红噪声底守时数字仍为 MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3状态（相位/频率/漂移）van-Loan 卡尔曼时钟，Joseph 稳定化。参考基准（ReferenceImpl）：filterpy { "1.4.5" } KalmanFilter（R. Labbe，MIT），F 通过 scipy.linalg.expm 得到，Q 通过 Van-Loan { "1978" } 分块矩阵得到：这是一个独立的参考实现，复现了 kshana 的完整滤波器轨迹。跨实现一致性：时钟物理和阿伦校准没有经外部验证，因此该行仍为 MODELLED。{ "0.30" } 外部比较，一项发现（仍为 MODELLED）：在 { "11" } 颗 GPS Blo 的 IGS 最终 { "30" } s 钟差上

seg-e12f672ae71d = GNSS 拒止下的时钟守时为 MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-8de95b3a9229 = 星载时钟状态估计为 MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e4b64d7277da = 欺骗干扰检测为 MODELLED，而不是经独立验证：其中一项子声明经过外部核对，但整项能力由模型计算的部分组合而成，因此该能力仍属于由模型计算得出一级。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-7b2721b7588d = 引擎 v{ $version } 的场景类型，所属系列为<a1>惯性、融合与量子传感器</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-dba20bb12cda = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> 对位置、速度、时钟相位和频率使用同一个堆叠卡尔曼滤波器，输入为使位置与钟耦合的伪距（带互协方差的 Joseph 形式更新）；增广了常值加速度计偏置的 1-DOF 变体 测试：<a1>fusion_coupled_filters.rs</a1>。

seg-451a304052c4 = <b>MODELLED</b> 由第一性原理（k_eff·T²、QPN）得出的冷原子干涉加速度计。参考基准（oracle，ExternalDataset）：已发表的 CAI 原始论文数值向量（Cheinet { "2008" } 传递函数；Peters/Freier 灵敏度）：k_eff·T² 完全吻合，散粒噪声 ASD 为单边下限，与每台已发表仪器相差在约 { "2" }× 以内（实际器件的技术噪声高于量子下限）。这是一个范围界定，而非等同。{ "0.30" } 第 { "2" } 轮（已预先登记 fcb9ac64），一项发现（仍为 MODELLED）：仅含 QPN 的旋转噪声对照 Gauguet 等的实测值

seg-9955b1b1c018 = 量子惯性传感器性能为 MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-5fef5e8cc64e = 量子惯性航位推算韧性为 MODELLED，未经独立验证：它是对照本代码库内另一套独立实现检查的，该实现独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = 系列页面：<a1>惯性、融合与量子传感器</a1>

seg-d91dc5633e67 = 来源：<c1/>

seg-3b43d9c5624d = <c1/>（场景类型）

seg-22cd963c7042 = 混合 PNT 综合场景：时钟 + IMU + 时间传递辅助。

seg-166be08d5276 = <c1/> 的一次运行汇总为：scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

seg-5a70fcb097dc = 可选字段：无

seg-f33278986879 = 示例 <c1/> 设置了以下内容等：

seg-7bebd09c614b = 导航级石英加速度计（Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Exail 混合量子加速度计三轴组，偏置稳定度 { "5.8" }

seg-49bff8dc860e = 导航级石英加速度计（H

seg-52378a7b074c = 引擎为 scenarios/hybrid-pnt.toml（类型 hybrid）生成的图表

seg-a1810bbca337 = <b>MODELLED</b> 双向/TWSTFT（Sagnac）、GNSS 共视、PPP；链路抖动→距离。参考基准（oracle，ExternalDataset）：Sagnac 量级对照权威的已发表值核对——N. Ashby，“Relativity in the GPS”，Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }），Eq. { "1.29" }：向东环绕赤道一周累积 { "207.4" } ns（2ωA_E/c²）；kshana 复现为 { "207.386" } ns。RTKLIB { "2.4.3" } 的 geodist()（Takasu，BSD-2-Clause）独立地予以佐证，它带有相同的 2Aω/c² 几何。复合的 BIPM TWSTFT 转发器/共视/

seg-a8beb8dfc757 = 时间传递误差预算为 MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-a9c56fc9608a = 主题页面：<a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>上一页</s1>hybrid-ukf

seg-53b95026bf54 = <s1>下一页</s1>impairment-eval
