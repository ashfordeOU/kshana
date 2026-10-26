# docs--kind-lunar-joint-od-clock: translations (zh-Hans)

seg-37d29d8303fe = km

seg-1f17ef6a853e = 引擎 v{ $version } 的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-593938ee5995 = 来源：<c1/>

seg-d54a85227f43 = <c1/>（场景类型）

seg-200e58e189c2 = 由模型计算的、在模拟（SIMULATED）网络上的月球多技术联合定轨 + 钟差批处理估计器：这是一次 Gauss-Newton 快照拟合，融合地球基线大地测量 VLBI 时延、月球本地的测站↔卫星测距以及星间测距，从注入的真值中一并恢复月面站的 3-D 位置、一个小型星座的位置以及每个资产的钟差。其最重要的如实结果是：VLBI 使测站完整的 3-D 位置变得可观测，而仅用月球本地测距时有一个方向观测很弱；该结果以有无 VLBI 时测站误差的对比给出。MODELLED 的模拟闭环恢复（真值与观测模型共用同一模型），结果确定（带种子），并未（NOT）经真实数据验证；求解器内部没有力模型传播；没有 TRL、飞行传承或机构背书。

seg-6419390eeae4 = <c1/> 的一次运行概括如下：lunar-joint-od-clock | { "3" } 颗卫星，{ "6" } 个地球站 | 测站 3-D 误差：含 VLBI { "3.54" } m，仅测距 { "2184.02" } m（精确 { "617.5" } 倍）| 卫星位置 RMS { "2.20" } m | 测站钟差误差 { "2.87e-10" } s | 观测 40/16 个参数

seg-be3bcad756cc = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>

seg-ef164af52468 = 示例 <c1/> 设置了下列内容等：

seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

seg-cfa051b87e59 = 引擎为 scenarios/lunar-joint-od-clock.toml（类型 lunar-joint-od-clock）生成的图表

seg-4c6914c162d1 = <b>VALIDATED</b> 对 VLBI + 月球本地测距 + 星间测距作批处理融合，以恢复测站与星座的位置和钟差。参考基准（oracle，ExternalDataset）：P2：numpy { "2.4.6" }（numpy.linalg.lstsq 采用 LAPACK gelsd，numpy.linalg.inv；BSD-3）在六个模拟网络已提交的雅可比矩阵和观测上，重新计算每一步 Gauss-Newton、收敛的加权最小二乘解、形式 sigma 以及测站误差，已预先登记（5094bc31），相对误差取 max({ "1e-8" }, { "100" } kappa eps)。首次运行未通过无 VLBI 的网络（{ "6.1e-7" }，对照 { "1e-8" }，一个法方程

seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisher 信息 M=HᵀWH、Cramér–Rao 下界、可观测性秩 / 基准亏秩零空间（Moore–Penrose 伪逆），以及 D/A/E/T 最优实验设计。参考基准（oracle，ExternalDataset）：NumPy { "2.4.1" }（numpy.linalg.eigh / .inv；BSD-3-Clause，基于 LAPACK）——一个独立的第三方权威，以不同于 Kshana 的循环 Jacobi 扫描和谱伪逆的算法（LAPACK 分治法 + LU），计算同样唯一确定的特征值、σ²(XᵀX)⁻¹ Cramér–Rao 协方差以及 GNSS 精度因子；一致到 { "1e-9" }。同一类外部库已经验证了 D

seg-af12da412a10 = <b>MODELLED</b> 月球联合解算的 Fisher 信息可观测性：没有地球基线时，绝对坐标基准位于 HᵀWH 的零空间中（测站位置无法观测）。参考基准（oracle，InternalConsistency）：解析的基准亏秩结构——不可观测的绝对框架模态位于 Fisher 信息的零空间中（闭式），秩门限与已发表的 3 站设计依据相符，且估计器在蒙特卡罗中达到由此得出的 CRLB。月球几何本身是一个具有代表性的网络（不是实际飞行的星历），因此该行仍为 MODELLED；底层的 FIM/CRLB 引擎对照

seg-865ba2668582 = MODELLED 的模拟闭环恢复（真值与观测模型共用同一模型），结果确定（带种子），并未（NOT）经真实数据验证；求解器内部没有力模型传播；没有 TRL、飞行传承或机构背书。（类型目录（<c1/>））

seg-a0d4350a1c66 = 诚实说明：MODELLED 的模拟闭环恢复。注入的真值通过求解器所反演的同一（SAME）几何模型映射为合成观测量，加入带种子的高斯噪声，估计器在噪声范围内恢复注入的真值。参考基准（oracle）是内部一致性（真值恢复 + NEES 协方差真实性），而不是真实数据验证（NOT）。求解器内部没有力模型传播——卫星（场景文件注释，第 { "24" } 至 { "29" } 行）

seg-1465694e7e4f = 月球绝对测站可观测性（基准亏秩）为 MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e6962535ee72 = <s1>上一页</s1>lunar-jamming

seg-2ef5c8112d1b = <s1>下一页</s1>lunar-llr-datum
