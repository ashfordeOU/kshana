# docs--kinds-jamming-spoofing-and-the-spectrum: translations (zh-Hans)

seg-b03d56f501c3 = 类别

seg-98e740d32860 = 机器学习射频损伤检测评估试验平台（{ "13494" }）：生成带标签的、有参数依据的合成语料（nominal/jamming/spoof-time/spoof-position/multipath），用与检测器无关的测试框架对检测器（energy|agc|sqm|parity|fused）评分，并报告 AUC/ROC/混淆矩阵 + 目标 Pfa 下的各类 Pd，以及分布内与分布外的乐观差距。仅有 MODELLED 工作特性——绝不使用外场/IQ 数据，不给出好/坏结论。

seg-7e7b07bc5545 = 引擎为 scenarios/impairment-eval.toml（类型 impairment-eval）生成的图表

seg-60bf3f0ff000 = 链路预算压制干扰：J/S → 有效 C/N₀ → 失锁。

seg-42d46b928d09 = 引擎为 scenarios/jamming-demo.toml（类型 jamming）生成的图表

seg-fef00c827c6a = L波段频谱模型与瀑布图：把整个GNSS L波段作为一张功率谱密度（PSD），横向为频率，纵向为时间，覆盖一条脚本化的干扰机时间线。信号：GPS L1 C/A和L2C（BPSK({ "1" })）、Galileo E1开放服务（MBOC(6,1,1/11)，或BOC({ "1,1" })）、GPS L5和Galileo E5a（BPSK({ "10" })），各自位于其载波，除非另行指定，均取接口规范的最小接收功率（IS-GPS-200、IS-GPS-705、Galileo OS SIS ICD）；未对GLONASS、北斗和Galileo E6建模。干扰机：连续波单音、平坦窄带噪声、线性锯齿啁啾，以及与某个频带自身调制匹配的宽带噪声，各有中心频率、带宽、接收功率（直接给定，或通过jamming类型的自由空间路径损耗由EIRP和距离得出）以及开关时间。每个干扰机按其在接收机带宽上的频谱分离系数kappa对每个频带评分，且(C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1；对单个干扰机，这等于jamming类型的抗干扰方程，其中Q = 1/(R_c kappa)，报告载有这一交叉核对（以及jamming类型的代表性Q数值，并列给出）。噪声底限为k T_sys，其中T_sys = T_ant + { "290" } K (F - { "1" })。瀑布图把每个单元在其频率栅格和所在行上取平均（啁啾精确处理，含整次扫频加上不完整的一次；行中途开关的干扰机按其占空比处理），因此C/N0时间线和图像来自同样的数字；result.json载有按功率做块平均的栅格、每行每个频带的C/N0和J/S，以及每个干扰机每个频带的SSC、Q、J/S、带内J/S和稳态C/N0。可选的[iq]：模型在某一时刻绘制为复IQ，写入SigMF记录（cf32_le或ci16_le）再读回，并与Welch估计比较。可选的[recording]（原生构建）：真实SigMF记录的Welch PSD与模型并列。VALIDATED：信号PSD对照教科书的主瓣宽度（BPSK(n)零点到零点为2n x { "1.023" } MHz；BOC({ "1,1" })瓣中心在 +/-1.023 MHz），频谱分离系数对照其帕塞瓦尔闭式解以及Kaplan与Hegarty的Q = { "1" }（CW）和{ "1.5" }（匹配）。MODELLED：干扰机功率、时间线、前端带宽、连续谱（无码线）处理，以及不含AGC、消隐和天线方向图。

seg-ea1678eb9e84 = 引擎为scenarios/l-band-waterfall-jamming.toml（类型spectrum）绘制的图表

seg-f43fe94d84e0 = 针对参数化攻击（功率优势、载波相位对齐、时间/位置推移；TEXBAT 式）的射频/测量组合欺骗检测器（多 SV RAIM 一致性 + AGC + SQM，融合）。

seg-268ebf4cba99 = 引擎为 scenarios/spoof-detect.toml（场景类型 spoof-detect）生成的图表

seg-cbd77f6ffd63 = 随机时间欺骗检测器（Neyman–Pearson / χ²₁），含蒙特卡罗 P_fa/P_md。

seg-6f6a8c975111 = 引擎为 scenarios/spoof-attack.toml（场景类型 spoof）生成的图表

seg-f6ff1c8c78db = 跟踪环失锁：C/N0 → 带迟滞（WITH HYSTERESIS）的锁定/失锁，失锁所需的时间，以及作为码和载波偏移速率函数的欺骗牵引。引擎现有的拒止和捕获判据是接收功率之比（干扰源在 J/S = { "30" } dB 时造成拒止，欺骗源在 { "3" } dB 时实现捕获）；真正的失锁并不是功率比，而是环路的抖动加上动态应力使其越出跟踪门限预算的位置。报告：（{ "1" }）载波（Costas）环和码（非相干超前/滞后）环的 1-sigma 热噪声抖动随 C/N0 的变化，含平方损耗，对照所述规则 { "3" }<em>sigma_PLL + theta_e <= { "45" } deg（15 度规则的三倍 sigma 形式）和 { "3" }</em>sigma_DLL + ramp lag <= d/2 chips；（{ "2" }）掉锁和重锁的 C/N0 门限及起决定作用的环路，其中重锁门限由接收机重新牵引时所用的更宽带宽推导（DERIVED）得出，而非断言给出，因此迟滞宽度必须落在 { "5" }<em>log10(ratio) 与 { "10" }</em>log10(ratio) dB 之间；（{ "3" }）由带确认驻留的双门限锁定检测器在 C/N0 斜坡驱动下给出的宣告失锁时间，与物理相位逃逸时间（维特比平均周跳间隔时间，因其跨越数百个数量级而以 log10 s 表示）分别报告；（{ "4" }）欺骗牵引极限——受害接收机环路能够跟随的最大码滑移和载波多普勒变化率，附有覆盖两个坐标轴的图，因为滑移快于这些极限的欺骗源并不能捕获环路，而是将其甩开；（{ "5" }）环路动力学所隐含的拒止半径（DENIAL RADIUS），与现有的功率比半径并列（ALONGSIDE）报告，绝不取而代之，两者的带符号差值作为单独命名的字段（denial_radius_delta_km）给出，并在旁附有定义。每个输出的数值字段都带有单位和出处类别。VALIDATED 的闭式：载波和码抖动表达式、环路滤波器化简 sqrt({ "2" }<em>B_n</em>T) 以及一阶斜坡滞后，已与引擎自身在带种子的合成 IF 上逐步推进的 sdr 相关器交叉核对——这是通向同一数值的另一条路径——分别吻合到 { "0.6" } %、{ "3.7" } % 和 { "0.17" } %；周跳时间背后的修正贝塞尔函数 I0 已与标准制表值核对，吻合到 { "1e-7" }。有效范围的下限是被断言的，而不仅是陈述：在 { "1" } ms 下低于约 { "32" } dB-Hz 时，真实的 atan 鉴别器相对于其 +-pi/2 范围饱和，所测得的抖动小于任何线性理论。MODELLED：环路带宽、积分时间、相关器间距、牵引带宽比、确认驻留、干扰源功率和天线增益都是有代表性的频段数值，而非数据手册数据。未建模：振荡器（阿伦偏差）和振动抖动、前端带宽限制、多路径、AGC 动态、数据比特跳变损耗、外部辅助，以及对 Costas 周跳公式的任何半周修正。在环路动力学下，欺骗捕获根本没有半径——起约束作用的是偏移速率，而不是功率——因此该字段为 null 并附原因，而不是编造一个数值。不是经认证的接收机性能产品。

seg-72182c1aecd9 = 引擎为 scenarios/tracking-loop.toml（场景类型 tracking-loop）生成的图表

seg-4e31c8daf798 = 台账

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-63c3a7483268 = { "6" } 个场景类型，来自引擎 v{ $version }。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为 MODELLED（标签如何获得，见 README 的“证据”一节）。

seg-f6a18b7cb172 = 来源：<c1/>

seg-d4ae70a5d619 = 压制干扰（jamming）、欺骗干扰（spoofing）与频谱（场景类型族）

seg-b4b8b72e060b = 专题页面：<a1>SPECTRUM</a1>、<a2>DECEIVED-TIME</a2>、<a3>IQ-FOLLOW</a3>。运行一个：<c1/>。所有类型族：<a4>KINDS.md</a4>。

seg-cc031b964086 = 引擎为“压制干扰、欺骗干扰与频谱”类型族的各类型生成的图表缩略总览

seg-bbbd87f888b9 = 跟踪环失锁：C/N0 → 带迟滞的锁定/失锁，失锁所需的时间，以及作为码和载波偏移速率函数的欺骗牵引。

seg-e37f1e071b2c = L 波段频谱模型与瀑布图：整个 GNSS L 波段作为一个功率谱密度（PSD），横轴为频率，纵轴为时间，覆盖脚本化的干扰源时间线。

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-8887d666b4fc = 机器学习射频损伤检测评估试验台（{ "13494" }）：生成带标注、参数有依据的合成语料（标称/压制干扰/时间欺骗/位置欺骗/多路径），对检测器评分（energy/agc/s

seg-f6dcb5b36454 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>。可选字段：<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>。

seg-7bb2f42902f0 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>jamming</a1>。

seg-d5f06ff66e1b = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>。

seg-1bd760afbaca = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>spoof</a1>。

seg-fb15ecc29f7c = 必填字段：<c1/>。可选字段：<c2/>、<c3/>。

seg-15c08ee5ae76 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>spoof-detect</a1>。

seg-c65b9d45bdcc = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>、<c22/>、<c23/>、<c24/>、<c25/>、<c26/>、<c27/>、<c28/>、<c29/>。

seg-bd1b04ccfe22 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>tracking-loop</a1>。

seg-5024b537d000 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>。

seg-a73f44c04565 = <b>台账：</b>MODELLED { "3" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>spectrum</a1>。

seg-cbcc6f5302b8 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>。

seg-d14fa8348a2a = <b>台账：</b>MODELLED { "1" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>impairment-eval</a1>。

seg-5242026d2998 = <s1>上一页</s1>惯性、融合与量子传感器

seg-6b9b04e59491 = <s1>下一页</s1>低地球轨道导航
