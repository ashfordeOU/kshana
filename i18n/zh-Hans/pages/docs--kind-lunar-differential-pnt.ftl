# docs--kind-lunar-differential-pnt: translations (zh-Hans)

seg-9feefecdcf67 = rafs

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-1f17ef6a853e = 引擎 v{ $version } 的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-549a6103e711 = bit

seg-d0c9bec248b4 = 来源：<c1/>

seg-d226df2bb634 = <c1/>（场景类型）

seg-8ac5ac006ae7 = 由模型计算的月面差分 PNT（月面 DGNSS/SBAS 的类比）：位于已知（KNOWN）月面坐标的 NovaMoon 级参考站，根据 ILLUSTRATIVE 的、取自公开来源的 Moonlight/LCNS 级星座，计算逐卫星的差分改正数（NovaMoon 仅作为系统类别（CLASS）被提及，与 ESA 无隶属关系），相距 baseline_km 的用户应用这些改正数，使共模（COMMON-MODE）的轨道与钟差误差相互抵消。钟差项恰好（EXACTLY）抵消（这是代数恒等式）；轨道项只剩下视线差投影，当基线 → { "0" } 时它 → { "0" }（空间去相关下限），并随基线近似线性增长。报告有改正数与无改正数两种情况下的用户 3-D 位置误差、缩减倍数、误差随基线变化的曲线，以及复用（REUSES）DO-229E SBAS 机制（crate::sbas）并以差分残差 σ 计算的用户保护级。MODELLED——精确抵消恒等式加一阶去相关模型；未经真实数据验证；没有 TRL、飞行传承或机构背书。设定随机种子时结果确定。

seg-4b7355b174a3 = <c1/> 的一次运行概括如下：lunar-differential-pnt | { "8" } 颗卫星（示意性的 LCNS 级，无隶属关系）| 基线 { "50" } km | 用户误差 { "24.46" } m → { "0.0077" } m（缩减 { "3186" }×）| HPL { "23.1" } m（σ_resid { "5.0" } m）| MODELLED

seg-1115464be513 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>

seg-3f32e0fea066 = 示例 <c1/> 设置了下列内容等：

seg-8e67df89448a = 引擎为 scenarios/lunar-differential-pnt.toml（类型 lunar-differential-pnt）生成的图表

seg-6f4246bd8f6f = <b>MODELLED</b> NovaMoon 级差分参考站：共模抵消 + 随基线增长的残差 + DGNSS 保护级。参考基准（oracle，InternalConsistency）：差分误差抵消恒等式，加上复用 DO-229E SBAS 保护级机制；单差加 WLS 求解另外还对照 RTKLIB 的 lsq()/matinv()（Takasu，BSD-2-Clause，已编译的 C 代码）交叉检查——求解器代码是独立的，但一阶视线差代数相同，因此仍属 InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> 差分改正数在计算它的历元与使用它的历元之间会带上三项误差，每一项此前都被当作未建模的余量：。参考基准（oracle，InternalConsistency）：闭式恒等式与自洽性：均匀量化器的 step²/12 方差，精确的 (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ 协方差传播在 σ 相等时退化为 σ·PDOP，测量项的 { "1" }:{ "1" } 传递是 û_user ≈ û_ref 的结果，以及开关切换的正交闭合。与 orbit::dop 的 PDOP 交叉检查共用 [−û, { "1" }] 法矩阵，因此它是一致性检查，并且被标注为一致性检查，而不是一项

seg-f1e7283d2e15 = MODELLED——精确抵消恒等式加一阶去相关模型；未经真实数据验证；没有 TRL、飞行传承或机构背书。（类型目录（<c1/>））

seg-9d54d8c07ca3 = 诚实说明（HONESTY）：MODELLED。共模抵消是精确的（EXACT）代数恒等式；空间去相关残差是一阶几何模型（所注入轨道误差的视线差投影），而不是由真实月面跟踪数据拟合出的去相关模型。用户保护级复用（REUSES）DO-229E SBAS 保护级机制（crate::sbas），以差分残差 sigma 作为逐卫星的误差（场景文件注释，第 { "23" } 至 { "28" } 行）

seg-4156a7515574 = ── 改正数链路（THE CORRECTION LINK） ────────────────────────────────────────────────────────────── 上面的恒等式假设改正数是完美的（PERFECT）：由确切知道自己所在位置的测站计算，即时送达，分辨率无限。这三点都不成立，下面三个输入分别模拟各自的代价。它们仅（ONLY）进入结果文档的 <c1/> 块——三者均取所写的值时 h（场景文件注释，第 { "57" } 至 { "62" } 行）

seg-e7f016777e09 = 测量误差（SURVEY ERROR）。测站依据它所相信（BELIEVES）的坐标来形成改正数。该处的误差会附着在它广播的每一个改正数上，并以 -delta . u_ref 的形式到达用户——其中完全不含用户几何，因此与轨道项不同，它既不会在零基线处消失，也不随基线增长，而几乎一比一地传递到用户的位置上。默认值 { "0.30" } m 是本 crate 自己的月面参考（场景文件注释，第 { "64" } 至 { "70" } 行）

seg-e0648d9b52b4 = 改正数老化（CORRECTION AGEING）。在 t 时刻计算、在 t+tau 时刻应用的改正数在两方面陈旧。轨道：卫星已移动（MOVED），因此冻结的轨道误差矢量现在投影到旋转后的视线上；该旋转来自本 crate 自己的传播器，因此任何地方都不假设轨道误差变化率。钟：卫星钟已漂移 c*sigma_y(tau)*tau，采用 crate::clock_specs 中的完整 RAFS 幂律，已标定（场景文件注释，第 { "73" } 至 { "79" } 行）

seg-7171b2e3f29d = 月面差分 PNT 为 MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-35f1876d023e = 月面差分 PNT——改正数链路残差预算为 MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-8f8871ac8a0f = 专题页面：<a1>LUNAR-REFERENCE-STATION.md</a1>

seg-2b8455001710 = <s1>上一页</s1>lunar-beacon

seg-dca7482d9d75 = <s1>下一页</s1>lunar-frame-campaign
