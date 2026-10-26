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
