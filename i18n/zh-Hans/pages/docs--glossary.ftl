# docs--glossary: translations (zh-Hans)

seg-daf25c6479c1 = 标准

seg-c851aa23ea42 = 逗号分隔值

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = 温度补偿晶体振荡器

seg-1bac97ee312a = 铷原子频率标准

seg-b09ffb8a9095 = 蒙特卡罗

seg-9939da5da283 = JSON

seg-5907283b71da = 缩写

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = 系统间偏差

seg-7dabf60fd17e = QPN

seg-dae80c23262e = 量子投影噪声

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-e464509f3abb = 载噪比密度

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = 数字对象标识符

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = 国际天球参考框架

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = 国际空间站

seg-865e7d1794b6 = 安全散列算法，256 位

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = 卫星时间与位置

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = 特高频

seg-6ce4c2164aee = 来源：<c1/>

seg-bee5d056ef03 = 对 { -brand } 中所用术语的通俗定义。每个词条以一句“通俗地说”开头，然后在有帮助之处补充精确含义。未在某一节中定义的缩略语见接近末尾的 A 至 Z 表，即<a1>其他所有缩略语，A 至 Z</a1>。

seg-f8c5433d1026 = 导航与授时

seg-2a42d84608ea = <b>PNT——定位、导航与授时。</b>精确地知道你<em>在哪里</em>、<em>朝哪个方向</em>前进，以及<em>现在几点</em>。现代 PNT 主要来自卫星信号（GNSS，即下文定义的全球导航卫星系统）；{ -brand } 研究的是这些信号丢失时，<em>时间</em>和<em>位置</em>会发生什么。

seg-6227db2c94e1 = <b>GNSS——全球导航卫星系统。</b>提供 PNT 的卫星星座：GPS（全球定位系统，美国（美利坚合众国））、伽利略（欧盟）、GLONASS（俄罗斯的全球导航卫星系统）、北斗（中国）。能看到 ≥ { "4" } 颗卫星的接收机，可以计算出完整的 3D 位置和时间解。

seg-f8eda357e640 = <b>GNSS 中断 / 拒止 / 降级 / 被压制干扰。</b>卫星信号不可用时（被遮挡、被压制干扰或不在视野内）。中断期间，系统必须依靠自己的机载传感器“滑行”。{ -brand } 的全部目的就是测量它滑行得有多好。

seg-a3ade199f465 = <b>守时（holdover）。</b>通俗地说：<em>时钟在失去 GNSS 之后，自己还能保持良好时间多久。</em>时钟越好，其误差越过允许限值之前能保持得越久。

seg-83b33c15312f = <b>航位推算。</b>通俗地说：<em>在没有任何外部参考的情况下，通过累加所测得的运动来估计你在哪里。</em>误差会累积，所以更好的惯性传感器漂移得更慢。

seg-da9bcc994b9c = <b>规格 / 阈值。</b>在解算被视为“超出规格”之前，所允许的最大误差——例如“授时必须保持在 { "20" } ns 之内”或“位置在 { "100" } m 之内”。

seg-6f37a60a30c7 = { -brand } 所比较的传感器

seg-308b59d89586 = <b>时钟（原子钟）。</b>通过对原子的自然振荡计数来保持时间的装置。这里有两个例子：

seg-3389d08be6bc = <b>CSAC——芯片级原子钟。</b>一种小型的、已部署的商用时钟（“经典”参考）。性能不错，但在长时间中断期间漂移明显。

seg-3e121d8e6400 = <b>光晶格钟（例如锶）。</b>稳定得多的“量子”时钟；是实验室中的最先进水平，尚未飞上太空。

seg-4daa6cdf8ae2 = <b>加速度计。</b>测量加速度（运动的变化）。积分两次，得到位置——因此任何误差都会迅速增长。<b>冷原子加速度计</b>是长期稳定度好得多的量子版本；<b>导航级</b>则是经典版本。

seg-91793676c57c = <b>陀螺仪。</b>测量转动。微小的转动误差会使平台倾斜，使重力泄漏到水平方向，并破坏位置估计。

seg-2d36110effc3 = <b>IMU——惯性测量单元。</b>加速度计与陀螺仪的组合本身：每种各三个轴，报告比力和角速率。它测量运动；单靠它自己并不知道自己在哪里。

seg-e3b6b40e0cd0 = <b>INS——惯性导航系统。</b>一个 IMU 加上将其输出积分为姿态、速度和位置的“机械编排”。INS 是在 GNSS 中断期间进行航位推算的部分，其精度由下面列出的 IMU 误差过程决定。

seg-a618ff7ee429 = <b>时间传递。</b>在两地之间（例如卫星到卫星）发送精确的时间信号。<b>光学</b>链路比 <b>RF</b>（射频）链路精密得多。

seg-847fbbeecfae = 误差如何建模（时钟噪声）

seg-5cf197bdbbad = 时钟误差由标准的“噪声类型”构成，每种都有已知的特征：

seg-3806d1b1cb50 = <b>白 FM（白频率调制）。</b>通俗地说：<em>时钟速率中快速的随机抖动。</em>随着时间推移，平均可使其降低。参数 <c1/>。

seg-0793fdd3abab = <b>随机游走 FM。</b>通俗地说：<em>时钟速率缓慢地漂游。</em>它在长时间中断中占主导。参数 <c1/>。

seg-42b74c8b88ff = <b>闪烁 FM（1/f 噪声）。</b>通俗地说：<em>时钟永远无法平均到其以下的顽固噪声底限。</em>它在各个平均时间上是平坦的。参数 <c1/>。

seg-b3bd841a5a2d = <b>老化／漂移。</b>速率随时间发生的缓慢、<em>可预测</em>的变化；因为可预测，{ -brand } 的估计器会将其扣除。参数 <c1/>。

seg-d929960492e4 = <b>VRW——速度随机游走（Velocity Random Walk）。</b>加速度计中与白噪声对应的噪声：对速度的随机扰动，会累积成位置误差。参数 <c1/>。

seg-4a97f8d14174 = <b>ARW——角度随机游走（Angular Random Walk）。</b>陀螺仪中与之对应的噪声：对姿态的随机扰动。参数 <c1/>。

seg-dcd03b326110 = 稳定度如何度量

seg-2181832c6253 = <b>阿伦偏差（<c1/>）。</b>通俗地说：<em>在给定平均时间 <c2/> 下表述时钟稳定程度的标准方法。</em>时钟数据手册会给出诸如 <c3/> 的数值。{ -brand } 通过计算自身输出的阿伦偏差，并核对其与公布数值一致，来验证其时钟模型。（参考文献：Riley，NIST SP { "1065" }——美国国家标准与技术研究院特别出版物 { "1065" }。）

seg-11cbe561e633 = <b>PSD——功率谱密度（Power Spectral Density）。</b>噪声功率在各频率上的分布；是规定白噪声、随机游走噪声和闪烁噪声的正式方式。

seg-0737d620eb5f = 性能指标（一次运行如何评分）

seg-20b66e0d4809 = { -brand } 报告的六项运行级 PNT 性能指标（见 README 的“Output”表）：

seg-b17d08246e49 = <b>FoM——性能指标（Figure of Merit）。</b>给运行的某一方面打分的一个数值，连同其单位一并报告，并注明它是经独立核对的还是由模型计算得出的。下列六项是 { -brand } 的运行级 FoM。

seg-b229a69fb4ac = <b>定位／授时性能</b>——误差的大小，以 RMS（均方根，即二次平均值）和第 95 百分位数表示。

seg-ba3ed5a28518 = <b>自主性</b>——守时（holdover）时长（没有 GNSS 时能在规格内保持多久）。

seg-13ecdd037098 = <b>韧性</b>——GNSS 丢失后误差增长的速度。

seg-be0168f24d6e = <b>可用性</b>——运行中存在规格内解的时间所占比例。

seg-44ef500b371d = <b>完好性</b>——<em>能否信任系统对自身误差的估计？</em>{ -brand } 报告真实误差保持在滤波器保护界限之内的中断期采样所占比例。

seg-d1cc3819cde9 = <b>安全性</b>——对欺骗干扰（spoofing）的稳健性：基于时钟稳定度的欺骗可检测性得分（自 { "v0.3.0" } 起），仅当配置了欺骗攻击场景时才有意义。它<em>不是</em>航空级完好性：它不计算水平或垂直保护级（HPL/VPL），也不运行接收机自主完好性监测（RAIM），无论是基本型还是先进型。这些来自单独的完好性和 ARAIM（先进 RAIM）场景类型，在下文“完好性与增强”中定义。属出口敏感内容。

seg-5cae59204d9e = 与性能指标一并使用的术语：

seg-7adc0e49a981 = <b>欺骗干扰（spoofing）。</b>通俗地说：<em>一种对位置或时间撒谎的虚假卫星信号。</em>欺骗者向接收机提供一个看似合理但错误的答案，这比压制干扰（jamming）更糟，因为接收机可能毫无察觉。

seg-2d2e6cbeade6 = <b>1-DOF——一个自由度。</b>单个轴。{ -brand } 场景包中的位置误差是单轴的；完整的3-D结果需要三轴模型。

seg-14a32d281c4b = <b>蒙特卡罗集合。</b>以不同的随机种子（seed）多次运行同一场景，报告结果的离散程度，而不是单次运行的结果。

seg-fcbea49a3592 = <b>CI——置信区间（confidence interval）。</b>某个统计量在给定概率（例如 { "95" } %）下预期落入的范围。在 README 的表格和徽章中，“CI”更常指<b>持续集成</b>（continuous integration）——对每次变更自动运行的构建与测试；具体含义视上下文而定。

seg-310abfd6a64c = <b>k 倍标准差界限。</b>按滤波器自身不确定度的 <em>k</em> 倍标准差设定的界限；完好性性能指标统计的是真实误差保持在该界限之内的频率。

seg-ad26afbaa7b4 = <b>CEP / 2DRMS——圆概率误差／距离均方根的两倍。</b>表述2-D水平精度的两种标准方式：CEP 是包含 { "50" } % 定位结果的半径；2DRMS 是水平均方根误差的两倍。该库可由位置协方差（<c1/>）计算这两者，但目前尚无场景类型报告它们。

seg-fd93c1effba8 = 解读结果：输出中的术语

seg-3432498093cf = 这些是你在结果文件或演练场摘要中会遇到的名称，先用通俗的话说明。

seg-099bf2eb4602 = <b>守时（holdover）（<c1/>）。</b>通俗地说：<em>GNSS 丢失后，系统有多少秒保持在其误差限值之内。</em>{ -brand } 报告运行中所有中断里最短的这样一段惯性滑行，按运行的时间网格度量，因此它是时间步长分辨率下的下界。守时时长等于中断时长，意味着从未越过该限值。

seg-e68708a219f1 = <b>p95（<c1/>）。</b>通俗地说：<em>{ "95" } % 的时间里，授时误差不超过这个值。</em>它是中断期间误差的第 95 百分位数。在简短摘要中，很小的值可能显示为 <c2/>；结果 JSON（JavaScript Object Notation）文件中保存有完整精度的数值。

seg-4dfaee63262d = <b>完好性（<c1/>）。</b>通俗地说：<em>系统自身的误差估计有多大程度是诚实的。</em>它是真实误差保持在滤波器 k 倍标准差界限（下文定义）之内的中断期采样所占比例。接近 { "1" } 的值表示估计器没有低估其误差。它不是航空保护级；见下文“完好性与增强”和 <a1><c2/></a1>。

seg-5af09f5129e0 = <b>安全得分（<c1/>）。</b>通俗地说：<em>欺骗攻击被发现的可能性有多大。</em>它是所配置的攻击被检测到的概率——即 1 减去漏检概率 <c2/>——由时钟的稳定度推导而来。仅当场景配置了欺骗攻击时才有意义。未配置攻击时，单行摘要会输出 <c3/>，结果会在其 <c5/> 块中将该指标标为 <c4/>；该值仍保留在文档中，含义是“不适用”，而不是“安全性为零”。

seg-70113d509997 = <b>PDOP——位置精度因子（如 <c1/> 之类的键）。</b>通俗地说：<em>卫星几何结构将测距误差放大为位置误差的程度。</em>位置误差大致等于 PDOP 乘以测距误差，因此越低越好。参见“估计与几何”中的 <b>DOP</b>。

seg-a445bf9a3c5f = <b>sigma_y（<c1/>，即阿伦偏差）。</b>通俗地说：<em>时钟速率在时间 <c2/> 上取平均后的波动有多大。</em>诸如 <c3/> 的数据手册条目表示，以一秒取平均的速率变化约为 10¹⁰ 分之 { "3" }。越小，时钟越稳定。参见上文“稳定度如何度量”。

seg-03b4bb05148d = <b>q_wf——白频率噪声强度。</b>通俗地说：<em>时钟速率中快速随机抖动的强度。</em>它是白频率噪声在 <c1/> 中的系数，因此场景根据数据手册给出的一秒阿伦偏差来设定 <c2/>。与它配套的有 <c3/>（随机游走频率噪声）和 <c4/>（老化）；参见上文“误差如何建模”。

seg-074a1337ed99 = 电信授时术语

seg-9f61398628e4 = 电信网络通过分组网络（精确时间协议，Precision Time Protocol）从 GNSS 馈送的参考时钟分发时间，国际电信联盟电信标准化部门（ITU-T）规定了每个时钟可附加的时间误差限值。这些术语出现在 <c1/> 类型中；参见 <a1><c2/></a1>。

seg-f48712300b30 = <b>TE——时间误差（time error）。</b>通俗地说：<em>某一时刻，时钟的时间与参考时间相差多少。</em>可正可负，通常以纳秒计。

seg-ceda70656c6a = <b>max|TE|——最大绝对时间误差。</b>通俗地说：<em>测量期间出现的最差时间误差，不计正负号。</em>它是大多数模板设定的首要限值。

seg-38d2922cd91d = <b>cTE——恒定时间误差。</b>通俗地说：<em>时间误差中稳定的偏移部分</em>——测量期间不变的平均误差。

seg-a4a61df332cd = <b>dTE——动态时间误差。</b>通俗地说：<em>时间误差中起伏的部分</em>——去掉恒定偏移之后剩下的部分。用 MTIE 和 TDEV 来评判。

seg-31c0a85788b1 = <b>MTIE——最大时间间隔误差。</b>通俗地说：<em>在任意给定长度的窗口内出现的时间误差的最大摆动。</em>对每个窗口长度，它沿记录滑动窗口，取最大的峰峰值变化；模板为每个窗口长度给出允许的最大值。

seg-53fa12cab0c6 = <b>TDEV——时间偏差。</b>通俗地说：<em>在给定平均时间下，时间误差的典型（均方根）漂移，</em>此时短期抖动已被平均掉。它是阿伦偏差在时域中的对应量，与 MTIE 一样，对照模板进行检查。

seg-62b5eea14f6c = <b>PRTC——基准主时钟（primary reference time clock）。</b>电信授时链最上端的时钟，通常由 GNSS 驾驭。其性能限值见 ITU-T 建议 G.8272。

seg-8d6d4538981b = <b>ePRTC——增强型基准主时钟。</b>时间误差限值更严的 PRTC，由高稳定度的本地原子钟支撑，因而能在 GNSS 长时间丢失期间保持时间。ITU-T 建议 G.8272.1。

seg-93fa4ac7c6fa = <b>T-BC——电信边界时钟（telecom boundary clock）。</b>从上游接收时间并向下游传递的网络时钟，自身会附加少量时间误差。ITU-T 建议 G.8273.2。

seg-52d32a5db6b8 = <b>T-TSC——电信时间从时钟（telecom time slave clock）。</b>链路末端接收时间并将其提供给需要它的设备（例如无线基站）的时钟。同样包含在 ITU-T 建议 G.8273.2 中。

seg-04d8ed12ca88 = <b>OCXO——恒温晶体振荡器。</b>石英振荡器被保持在小型恒温槽内的恒定温度，因而比普通石英振荡器稳定得多。网络设备中常用的守时（holdover）时钟；它在数天内会明显老化（漂移）。

seg-6742f7ba35ac = <b>CSAC——芯片级原子钟（chip-scale atomic clock）。</b>一种非常小的原子钟（参见上文“{ -brand } 比较的传感器”）。在长时间守时中比 OCXO 更稳定，但成本和功耗更高。

seg-c0e0c18bd867 = 证据等级：VALIDATED、MODELLED、PARTNER

seg-61c0aa107fd9 = 机器检查的验证矩阵（<a1><c1/></a1>）中的每项能力都带有三个等级之一。

seg-13fb20435df3 = <b>VALIDATED。</b>通俗地说：<em>与他人给出的答案核对过。</em>该能力的输出已与独立的外部参考基准（oracle）进行比较——真实测量数据、他人编写的独立库或已发布的参考值——并在规定容差内一致。持续集成检查会拒绝未指明任何外部参考基准的 VALIDATED 行。

seg-a5dfb48e4dcb = <b>MODELLED。</b>通俗地说：<em>基于可靠的物理原理构建并检查过内部自洽，但尚未与外部答案比较。</em>这些数字对比较和设计权衡有意义；它们不是真实设备会有此表现的证据。<a1><c1/></a1> 说明了每个此类行为何属于由模型计算得出。

seg-0512b2d2145a = <b>PARTNER。</b>通俗地说：<em>这一部分属于硬件或产品保证方面的合作方，{ -brand } 对其不作任何声明。</em>设立该行是为了让缺口显而易见，而不是悄无声息。

seg-278dee6d3d4c = 频谱与干扰术语

seg-285a240c9958 = 这些术语出现在 <c1/> 类型中；参见 <a1><c2/></a1>。

seg-db4fdef1c562 = <b>BPSK(n)——码速率为 n × { "1.023" } Mchip/s 的二进制相移键控。</b>GPS L1 粗捕获码（C/A）和 L2 民用信号（L2C）（n = { "1" }）以及 GPS L5 和 Galileo E5a（n = { "10" }）所用的矩形码片调制。其频谱为 sinc²，零点每隔 n × { "1.023" } MHz 出现一次。

seg-cdd0f4194f42 = <b>BOC(m, n)——二进制偏移载波。</b>码速率为 n × { "1.023" } Mchip/s 的扩频码乘以频率为 m × { "1.023" } MHz 的方波副载波，使频谱分裂为载波两侧的两个瓣。

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11)——复用二进制偏移载波。</b>功率谱密度为 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" })，已为 Galileo E1 公开服务和 GPS L1C 所商定；Galileo 将其作为复合 BOC（CBOC）发射。

seg-7423f94e3018 = <b>CW——连续波。</b>未经调制的载波：单一音频。

seg-55d03dd4af03 = <b>J/S——干扰信号比（jammer-to-signal ratio）。</b>接收到的干扰功率与接收到的信号功率之比，以分贝计。

seg-b0f2974647d4 = <b>SSC——频谱分离系数。</b>κ = ∫ G_s(f) G_j(f) df，在接收机频带上积分：单位功率干扰源的频谱有多少落在信号频谱所在之处。有效载噪比密度为 [1/(C/N₀) + (J/S)·κ]⁻¹。

seg-c5affeee5269 = <b>噪声系数。</b>接收机在热噪声之上附加了多少，以比值 F（分贝）表示；系统噪声温度为 T_ant + { "290" } K × (F − { "1" })。

seg-5307c38d3036 = <b>瀑布图。</b>频谱的时频图：横向为频率，纵向为时间，颜色表示功率。

seg-3b1ac094fdc5 = <b>Welch 估计。</b>通过对加窗、重叠的周期图取平均而估计的功率谱密度（Welch { "1967" }）。

seg-9901d64fb895 = <b>SigMF——信号元数据格式（Signal Metadata Format）。</b>一种开放的记录格式：以 JSON <c1/> 文件描述存放采样的原始 <c2/> 文件（此处为复数 <c3/>、<c4/> 或 <c5/>）。

seg-83041671f422 = <b>IQ——同相与正交（in-phase and quadrature）。</b>复基带采样的两个分量。

seg-39e6ea8506b3 = LEO-PNT 信号术语

seg-36452ee3f5cc = 这些术语出现在 <c1/> 类型和多频段 <c2/> 场景中；参见 <a1><c3/></a1>。

seg-8363a15f3c5a = <b>LEO-PNT——低地球轨道定位、导航与授时。</b>从几百千米到约 { "1200" } km 高度的卫星播发的导航信号：比来自中地球轨道的 GNSS 更强，移动更快。

seg-523469643156 = <b>RNSS、RDSS、MSS、EESS——无线电导航卫星业务、无线电测定卫星业务、移动卫星业务、地球探测卫星业务。</b>某一频段可归属的 ITU（国际电信联盟）业务划分。

seg-d1e494623341 = <b>导频、数据和捕获分量。</b>同一信号的各个组成部分：用于测距的无数据导频、承载导航电文的数据分量，以及易于发现的短而低速的捕获分量。

seg-cce232b7cd6a = <b>FDMA——频分多址。</b>各分量或各卫星按载波频率而不是按码来区分。

seg-9d9476ee62b1 = <b>Gabor（均方根）带宽。</b>β = √(∫ f² G df / ∫ G df)，在接收机频带上积分：信号功率在频率上的分布宽度，它决定了测距可以有多精细。

seg-6febe9c2e506 = <b>DLL——延迟锁定环。</b>码跟踪环；其超前－滞后相关器间隔和噪声带宽决定热噪声测距抖动。

seg-5a55da97daf9 = <b>EFQPSK——增强型 Feher 正交相移键控。</b>一种恒包络调制（Xona Pulsar）；此处以矩形码片频谱近似。

seg-6dcbf1de9904 = <b>OFDM——正交频分复用。</b>一种多载波波形（Starlink 下行链路）；此处画成平坦的频带。

seg-548b285c7c8e = <b>TEC——总电子含量。</b>沿路径每平方米的电子数；{ "1" } TECU = 10¹⁶ el/m²。一阶电离层延迟为 { "40.3" }·TEC/f² 米。

seg-dd7e0743f364 = <b>EIRP——等效全向辐射功率。</b>发射功率乘以朝向接收机方向的天线增益。

seg-aba3b3eaba85 = 完好性与增强

seg-eab1b2c6728e = 完好性问的是<em>信任</em>：不是“我的误差有多大？”，而是“我能否给它划定界限，界限被突破时我会得到通知吗？”这些就是航空领域对此的术语。

seg-696a73449c49 = <b>RAIM——接收机自主完好性监测（Receiver Autonomous Integrity Monitoring）。</b>通俗地说：<em>接收机让各颗卫星相互核对。</em>当卫星数量多于定位所需的四颗时，多出来的部分（残差）应当很小；残差很大则说明有一颗卫星在撒谎，接收机无需地面帮助即可指出。实现于 <a1><c1/></a1>。

seg-89237433f01a = <b>ARAIM——先进接收机自主完好性监测（Advanced Receiver Autonomous Integrity Monitoring）。</b>RAIM 的现代双频多星座形式。它接收一条完好性支持电文，其中给出每颗卫星的假定误差和故障概率，并返回保护级，而不是通过／未通过标志。完整论述及每项假设见 <a1><c1/></a1>。

seg-4cc13de05193 = <b>SISRE——空间信号测距误差（Signal-in-Space Range Error）。</b>通俗地说：<em>卫星播发的轨道和钟差使典型用户测得的距离偏离了多少。</em>轨道误差被分解为径向、沿轨和横向三部分，按各自在平均视线方向上的体现程度加权，再与钟差合成（Montenbruck 等，{ "2018" }）。对低地球轨道卫星而言，沿轨和横向部分的权重远大于 GPS，因为用户是从远离星下点的方向看到它的。由 <c1/> 类型使用。

seg-847e40a033e1 = <b>RAC——径向、沿轨、横向（Radial, Along-track, Cross-track）。</b>轨道误差被分解到的三个方向：从地心向外、沿飞行方向，以及垂直于轨道面。<c1/> 类型的 <c2/> 模型在每个方向上各加入一个修正多项式。

seg-b725d23c839e = <b>SVID——空间飞行器标识符（Space-Vehicle Identifier）。</b>导航电文用来标明发送该电文的卫星的编号。

seg-b0f850eb04b1 = <b>IOD——数据期号（Issue of Data）。</b>卫星导航电文内容每变化一次就变化的计数器，使接收机能区分新电文与重复电文。（不要与同样缩写为 IOD 的在轨演示相混淆，如 ESA 的 Celeste IOD。）

seg-985a5e9c9ce9 = <b>TOW——周内时（Time of Week）。</b>自当前 GNSS 周开始（周日 { "00" }:{ "00" }）以来的秒数。

seg-1fc62dca46d6 = <b>CRC-24Q——24 位循环冗余校验（Qualcomm 多项式）。</b>RTCM { "10403" } 和 Galileo 电文所带的检错校验：电文各位除以多项式 <c1/> 所得的 24 位余数。接收机重新计算它，并丢弃不匹配的电文。

seg-abb4679dab23 = <b>URE——用户测距误差（User Range Error）。</b>通俗地说：<em>卫星自身播发的轨道和钟差使到它的每一个距离错了多少。</em>也称空间信号误差（SISE）；它是馈入 ARAIM 和 RAIM 的单星误差预算（<a1><c2/></a1> 中的 <c1/>）。

seg-158c210fd3fe = <b>MHSS——多假设解分离（Multiple Hypothesis Solution Separation）。</b>ARAIM 所用的方法。对星座可能出现故障的每种情形，它形成一个排除可疑卫星的解，并界定该子解与全视野解之间最多可能相距多远。

seg-671711003a6f = <b>HPL / VPL——水平／垂直保护级（Horizontal / Vertical Protection Level）。</b>通俗地说：<em>在给定的完好性风险下，系统承诺真实误差位于其内的半径。</em>它是算法计算出的界限，而不是测得的误差。当保护级保持在该运行所允许的告警限值之下时，运行即为可用（VAL 为垂直告警限值，HAL 为水平告警限值）。

seg-5bbd2d664862 = <b>SBAS——星基增强系统（Satellite-Based Augmentation System）。</b>一个监视 GNSS、计算改正数和完好性界限，并通过地球静止卫星播发的地面网络。<b>WAAS——广域增强系统（Wide Area Augmentation System）</b>是美国的系统；EGNOS（欧洲地球静止导航重叠服务）是欧洲的对应系统。{ -brand } 以 DO-229E 加权最小二乘形式计算保护级（DO-229E 是 RTCA 为 SBAS 接收机制定的最低运行性能标准；RTCA 原名无线电技术委员会，Radio Technical Commission for Aeronautics）（<a1><c1/></a1>）。

seg-ba8b448582af = 估计与几何

seg-2eb6e72496b8 = <b>估计器。</b>根据传感器模型预测中断期间真实位置／时间的算法。{ -brand } 有一个解析守时预测器和一个<b>卡尔曼滤波器</b>。

seg-9b4aa612c5a9 = <b>卡尔曼滤波器。</b>通俗地说：<em>一种既跟踪某个量、又跟踪该量不确定度的算法。</em>{ -brand } 用它的不确定度界限来计算完好性。

seg-8fda81dfccc9 = <b>EKF——扩展卡尔曼滤波器（Extended Kalman Filter）。</b>用于非线性问题的卡尔曼滤波器：每一步都围绕当前估计将模型线性化。是将 GNSS 与 INS 耦合的标准选择。

seg-9bc2c6f74b29 = <b>UKF——无迹卡尔曼滤波器（Unscented Kalman Filter）。</b>完成同样的工作而不做线性化：它让一小组确定性选取的样本点通过真实的非线性模型，再根据这些点的落点重建均值和协方差。在非线性很强时表现更好，定轨因此采用它。

seg-a1e52820e3a0 = <b>DOP——精度因子（Dilution Of Precision）。</b>通俗地说：<em>卫星几何结构将测距误差放大为位置或时间误差的程度。</em>位置误差 ≈ PDOP × 测距误差，因此数值低表示几何结构好。该系列包括：<b>GDOP</b>（几何——位置与时间合计）、<b>PDOP</b>（位置）、<b>HDOP</b>（水平）、<b>VDOP</b>（垂直）、<b>TDOP</b>（时间）。

seg-e769a91a3e4b = <b>Walker 星座。</b>以轨道面数量和每个轨道面的卫星数来描述卫星星座的标准方式（GPS 大致是一个 24/6 的 Walker 星座壳层）。

seg-b557933a4e4d = <b>高度截止角。</b>卫星被视为可用的、高出当地地平线的最小角度；过低的信号被排除。

seg-3ac8e11c3e33 = <b>掩星。</b>地球在物理上遮挡了到某颗卫星的视线。

seg-249bf472cb00 = <b>天际线（天际线遮蔽）。</b>通俗地说：<em>建筑物、起重机或山丘映在天空上的轮廓，以每个方位角上的一个高度角表示。</em>卫星只有在其方位角处高于 <c1/> 时才算可见，高于截止角但在天际线之后的卫星则属于“被天际线遮蔽”。{ -brand } 可由表格、街道峡谷、扇区和地形（取它们的逐点最大值）或 REPRESENTATIVE 预设构建天际线；仅考虑视线，不含反射或绕射（<a1><c2/></a1>）。

seg-620a88820a2d = <b>天空几何。</b>在某条天际线下，站点能看到哪些卫星，以及这对解有何影响：DOP 因子、最小二乘定位的东－北－天协方差及其<b>误差椭圆</b>，即在各测距误差为独立且相等的高斯分布时，包含所述比例定位结果（默认 { "95" } %）的水平区域。这是在所述误差模型下的 MODELLED 几何，而不是接收机的真实误差（<a1><c1/></a1>）。

seg-f0e610122425 = <b>CTI——组合授时完好性（Composed Timing Integrity）。</b>针对<em>时间</em>而不是位置的保护级，跨不同时间源之间的切换计算——例如从经卫星检查（RAIM 可用）的时钟切换到处于守时（holdover）状态的自由运行时钟——使界限在过渡期间依然有效（<a1><c1/></a1>）。

seg-56642f614c3f = <b>TIB——授时完好性基准（Timing Integrity Benchmark）。</b>用于衡量<em>他人</em>授时监测器的标尺：它注入一系列故障，并检查监测器所声明的保护级是否确实界定了其误差。它自身不作任何精度声明，因此不会夸大精度（<a1><c1/></a1>）。

seg-8b89f8b913b9 = 轨道与地月空间

seg-ba6b669eb8ba = <b>CR3BP——圆形限制性三体问题（Circular Restricted Three-Body Problem）。</b>将地月系统视为两个绕共同质心做圆周运动的天体，外加一个轻到不会反过来牵动它们的航天器。在月球附近，二体开普勒椭圆的形状根本不对；CR3BP 是形状正确的最廉价的动力学模型（<a1><c1/></a1>）。

seg-2726a22bf14c = <b>NRHO——近直线晕轨道（Near-Rectilinear Halo Orbit）。</b>一种周期性 CR3BP 轨道，在一个月球极点上空近距掠过，在另一个极点上空远远越过，因此从端面看几乎是一条直线——故称“近直线”。它是为月球门户（Gateway）选定的轨道，并保持与地球近乎连续的视线。

seg-2b2e6d04376c = <b>DRO——远距逆行轨道（Distant Retrograde Orbit）。</b>CR3BP 的另一个族：一种大而稳定的轨道，在旋转坐标系中看，以逆行方向环绕月球。

seg-6bb9229aee5c = <b>EOP——地球定向参数（Earth Orientation Parameters）。</b>测得的、略不规则的地球摆动与自转（极移、UT1（世界时 { "1" }，地球自转时间）−UTC——地球自转时间减协调世界时——以及日长），将地固位置转换为惯性位置并达到优于米级精度时需要它们。IERS（国际地球自转与参考系服务）发布这些参数；{ -brand } 通过 <c2/> 读取其 <c1/> 文件。

seg-7f1e7e523e5b = 标准、格式与组织

seg-5d8d6144c13a = README 和各软件包页面中用于标准、文件格式、时间尺度、坐标系及其背后机构的缩写。每个缩写在这些页面中首次使用时也都有展开说明。

seg-800d42de0777 = 轨道、坐标系与时间

seg-320a1594dcf1 = <b>SGP4 / SDP4——简化通用摄动 { "4" }／简化深空摄动 { "4" }（Simplified General Perturbations / Simplified Deep-space Perturbations）。</b>用于已公布卫星轨道的标准解析轨道外推器。

seg-87a098568846 = <b>TLE——两行轨道根数（two-line element set）。</b>SGP4 读取的公开轨道格式。

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO——低地球轨道／中地球轨道／地球同步转移轨道／倾斜地球同步轨道。</b>各种轨道类别；大多数 GNSS 卫星运行在 MEO。

seg-1ec323dbd7a6 = LMO——火星低轨道。

seg-d0be640282af = <b>ECI / ECEF——地心惯性系／地心地固系。</b>一种不随地球旋转的坐标系，以及一种随地球旋转的坐标系。

seg-09a937adc1db = <b>TEME——真赤道平春分点（true equator, mean equinox）。</b>SGP4 输出所用的坐标系。

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF——地心天球参考系／国际地球参考系／其实现，即国际地球参考框架。</b>现代的惯性系和地固系。

seg-56b24c3734be = <b>CIO——天球中间零点（Celestial Intermediate Origin）。</b>现代的、不含春分点的地球自转链的参考点。

seg-a23b05c85a63 = <b>LVLH——当地垂直、当地水平（local vertical, local horizontal）。</b>随航天器运动的坐标系。

seg-ac37217cda0d = <b>WGS-84——{ "1984" } 年世界大地坐标系（World Geodetic System）。</b>GPS 所用的地球椭球。

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB——协调世界时／国际原子时／地球时／世界时 { "1" }（地球自转时间）／质心力学时。

seg-ea7eb1f34cae = <b>LTC / TCL——月球协调时（Temps-Coordonnée Lunaire）。</b>拟议中的月球时间尺度。

seg-c6e5976d9dff = <b>OD——定轨。</b>由跟踪测量恢复出轨道。

seg-dcb9e011c868 = <b>CR3BP</b>、<b>NRHO</b> 和 <b>DRO</b> 的定义见上文“轨道与地月空间”。

seg-2e6ba9069396 = 文件格式与电文

seg-ed5ea0a21e3f = <b>SP3——标准产品 { "3" }（Standard Product）。</b>国际 GNSS 服务（IGS）的精密轨道文件格式，有 c 和 d 两个版本。

seg-1bfa0d083935 = <b>RINEX——接收机无关交换格式（Receiver Independent Exchange Format）。</b>GNSS 观测值和广播星历的标准文件格式。

seg-39ce08a9ae66 = IONEX——电离层图交换格式（IONosphere map EXchange format）。

seg-c23ea3515008 = <b>OEM / OMM / TDM——轨道星历电文／轨道平均根数电文／跟踪数据电文。</b>空间数据系统咨询委员会（CCSDS）针对轨道和跟踪数据制定的标准电文。

seg-b267b32f3087 = <b>TOML——Tom's Obvious, Minimal Language。</b>{ -brand } 场景的纯文本格式。

seg-2795dff8d607 = <b>KIF——{ -brand } 交换格式（Kshana Interchange Format）。</b>{ -brand } 带版本号、自描述的结果封装。

seg-cd048e90fa3f = <b>DO-229E / DO-316。</b>RTCA 为 SBAS 接收机以及为带有机载增强的 GPS 机载设备制定的最低运行性能标准。

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705。</b>GPS 接口规范（后者涵盖 L5 信号）。

seg-2230000aa30b = <b>NIST SP { "1065" }。</b>美国国家标准与技术研究院的<em>频率稳定度分析手册（Handbook of Frequency Stability Analysis）</em>。

seg-8b89719c1859 = <b>TRL——技术成熟度等级（technology readiness level）。</b>硬件成熟度的 1 至 9 级标度。

seg-16c972f4ea0a = 组织机构

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b>——欧洲空间局、其欧洲空间操作中心，以及其欧洲空间跟踪网络。

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b>——美国国家航空航天局、其喷气推进实验室、其导航与辅助信息设施（发布 SPICE 工具包，SPICE 即 Spacecraft, Planet, Instrument, C-matrix, Events），以及其深空网络。

seg-eaa5a2a51169 = <b>IGS</b>——国际 GNSS 服务。<b>IERS</b>——国际地球自转与参考系服务。<b>IAU</b>——国际天文学联合会（其 SOFA 库，即基础天文标准，以及其开放移植版 ERFA，即基础天文基本例程，是 { -brand } 的坐标系参考）。

seg-81af4c0f4c48 = <b>CCSDS</b>——空间数据系统咨询委员会。<b>AIAA</b>——美国航空航天学会。<b>RTCA</b>——原名无线电技术委员会（Radio Technical Commission for Aeronautics）。

seg-aa0b395df17f = 软件与供应链

seg-b42188d3a6f4 = CLI——命令行界面。

seg-198c591514ab = <b>MCP——模型上下文协议（Model Context Protocol）</b>，{ -brand } 的智能体服务器所使用的协议。<b>IDE——集成开发环境。</b>

seg-287bf61a1a16 = SBOM——软件物料清单。

seg-80d9d4404221 = <b>SLSA——软件制品供应链级别（Supply-chain Levels for Software Artifacts）</b>，{ -brand } 的各版本据以出具构建来源证明的框架。

seg-7487c6f9ed18 = 其余所有缩写，A 至 Z

seg-56f6039bb38a = 仓库文档（<c1/> 和四份 README）中使用、且上文各节均未定义的所有缩写，以及上文已定义、此处为便于查找而重复列出的少数缩写。各页面在首次使用时也会拼写出其缩写；本表是集中查找它们的唯一位置。少数条目是标识符或名称而不是缩写，会注明。

seg-c0dfa446e523 = 全称

seg-f272d28225ae = 出现之处

seg-ffb0596f134b = 第三代合作伙伴计划（Third Generation Partnership Project）

seg-77c1b4478387 = 制定 5G 标准（包括非地面网络）的机构

seg-eaf19768b977 = 第五代移动网络

seg-692ddc163c55 = 包括其非地面网络（NTN）定位

seg-9524be916f07 = ABI

seg-0e8332db764b = 应用二进制接口

seg-762ea76708dc = Python wheel 标签

seg-d419d06ed622 = ABMF

seg-b294c714487d = 位于瓜德罗普勒穆勒的 IGS 测站

seg-586a8ea87638 = 四字符测站标识符

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = 交流电

seg-9cfb5dc4b4bc = 如 AC-Stark（光频移）效应

seg-90308009c536 = ADD

seg-49d97c65662d = 算法描述文档（Algorithm Description Document）

seg-493b5ceaa0fb = WG-C ARAIM 机载参考算法

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = 阿伦偏差／重叠阿伦偏差

seg-23c38ecbc543 = 见上文阿伦偏差

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

seg-4b642742f2d4 = 惯性传感器型号（Analog Devices；Safran Sensonor；MicroStrain）

seg-c4c0a93477a8 = 是标识符，不是缩写

seg-36743c7fe98e = AEM

seg-142ca108a070 = 姿态星历电文（Attitude Ephemeris Message）

seg-c34185a83d8e = 一种 CCSDS 电文

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = 航空航天与电子系统学会（Aerospace and Electronic Systems Society）

seg-78692bf5addf = 属于 IEEE

seg-f429be16014e = AF

seg-afa04bc28b42 = 平均因子（averaging factor）

seg-b3db60632b92 = 阿伦类估计器中采样间隔的整数倍

seg-6097c4709542 = AFS

seg-7043ab3fe32b = 增强前向信号（Augmented Forward Signal）

seg-20380d29d286 = LunaNet 月球导航信号

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = 自动增益控制

seg-750b8717220b = 接收机前端中的压制干扰（jamming）指示量

seg-31b864b910d5 = AHP

seg-f956cbe86552 = 层次分析法（Analytic Hierarchy Process）

seg-c2b63847e2dc = 一种多准则赋权方法（Saaty）

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = 人工智能／机器学习

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = 告警限值／水平告警限值／垂直告警限值

seg-1e52f04eb047 = 完好性监测器必须界定的误差

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = 替代二进制偏移载波（alternative binary offset carrier）

seg-e3acb231cf4d = Galileo E5 调制

seg-79b130764f97 = 算术平均—调和平均（不等式）

seg-190b782b70ce = AOCS

seg-6459d9bce282 = 姿态与轨道控制系统

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = 信号捕获／最近接近时刻／信号丢失

seg-8b73e2c51498 = 地面站过境的各个事件（LOS 也指视线；具体含义视上下文而定）

seg-27ceb7163571 = API

seg-7903f5ff4027 = 应用程序编程接口

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = 应用进程标识符（application process identifier）

seg-55730824c8cf = CCSDS 空间包头字段

seg-611cd7a0d378 = APS

seg-55842a648c47 = 美国物理学会（American Physical Society）

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = 带垂直引导的进近

seg-69a6cc8a532a = APV-I：水平告警限值 { "40" } m，垂直告警限值 { "50" } m

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = 平均运行长度（average run length）

seg-08a5d53f813c = 变化检测器发出报警所需的平均时间

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = Arm 处理器架构／其 64 位形式

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = 幅度谱密度（amplitude spectral density）

seg-9fb629e35a25 = 功率谱密度的平方根

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = 天文单位

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = 曲线下面积／接收者操作特征

seg-4d65dbf47a5c = 检测器评估

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = 托管 SRTM 高程瓦片的开放镜像

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = 建筑物穿透损耗（building entry loss）

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = 偏置不稳定性（bias instability）

seg-ff2ba8692cbc = 惯性传感器阿伦偏差曲线的平坦最低点

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = 国际计量局（Bureau International des Poids et Mesures）

seg-6ec98084ac58 = 发布 Circular T

seg-4ff08facda60 = BKG

seg-d29da95f483c = 德国联邦制图与大地测量局（Bundesamt für Kartographie und Geodäsie）

seg-ac4765a77015 = 运营一个 IGS 数据镜像

seg-a85954d9176e = BSD

seg-eb42c5807e5a = 伯克利软件发行版（Berkeley Software Distribution）

seg-a332a259125a = 如 BSD 许可证

seg-97764c651815 = BSP

seg-8f85848ee08a = 二进制 SPK（binary SPK）

seg-6e01dca47581 = 二进制 SPICE 星历内核文件

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = 两行轨道根数的阻力项

seg-628e6c686508 = CAI

seg-a2418a88886c = 冷原子干涉仪（cold-atom interferometer）

seg-273a3b8d5385 = 见 QUANTUM.md

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation（在轨冷原子铷干涉仪用于量子加速度测量——先导任务准备）

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = 知识共享／知识共享署名（Creative Commons / Creative Commons Attribution）

seg-a1f55ee72524 = 一种数据或文本许可证

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = 地壳动力学数据信息系统（Crustal Dynamics Data Information System）

seg-5b3f50bed1f6 = NASA 的空间大地测量档案库

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = 累积分布函数

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = 恒虚警率（constant false-alarm rate）

seg-b38b56b63da6 = 一种捕获检测器门限规则

seg-46835ce9641a = { "2000" } 中国大地坐标系（China Geodetic Coordinate System）

seg-4dab086e5c3d = 北斗的基准

seg-8f7751d39781 = CIP

seg-e34a194da574 = 天球中间极（Celestial Intermediate Pole）

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = 天球中间参考系（Celestial Intermediate Reference System）

seg-a543c4d02ace = CISA

seg-c34a7f26944d = 网络安全与基础设施安全局（Cybersecurity and Infrastructure Security Agency）

seg-59c481cb5741 = 隶属美国 DHS

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = 民用中等／民用长（civil moderate / civil long）

seg-cc0c8f1524f8 = GPS L2C 的两个时分复用码

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = 共模保护级（common-mode protection level）

seg-d469cd44d9d4 = 残差检验无法察觉的误差的界限

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = 收敛牛顿（converged Newtonian）

seg-5d679a981a34 = SPICE 光行时像差改正

seg-3da9a2841b6c = C/N0 (C/N₀)

seg-cf60da0631b4 = 以 dB-Hz 计

seg-f4488db8194d = COPRAS

seg-6379891c1750 = 复杂比例评估法（COmplex PRoportional ASsessment）

seg-b99fe66bd09c = 一种多准则排序方法

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = 空间研究委员会（Committee on Space Research）

seg-235850ad0d1f = 发布国际卫星标识符

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = 每圈一周（cycle per revolution）

seg-a1d4080ce019 = 轨道频率上的经验轨道加速度

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = 中央／图形／神经网络处理器

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = 克拉默—拉奥界／克拉默—拉奥下界

seg-6eb684e34f56 = 无偏估计器所能达到的最小方差

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = 合并激光测距数据格式（Consolidated laser Ranging Data format）

seg-eb95135f849c = ILRS 标准点文件

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = 可控接收方向图天线（controlled-reception-pattern antenna）

seg-7111b9c4d382 = 一种抗压制干扰天线阵列

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = 一致性比率／随机指数

seg-cfa91dc02138 = AHP 一致性检验（接受 CR < { "0.10" }）

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = 维护 Orekit 的法国公司

seg-58d5f143ff3b = 是公司名称，不是需要展开的缩写

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = 码移键控（code shift keying）

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = 层叠样式表（Cascading Style Sheets）

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = 累积和（cumulative sum）

seg-66f752e15abc = 一种序贯变化检测器

seg-92ac0357d01e = CV

seg-28f75c073917 = （时间传递中的共视；具体含义视上下文而定）

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium 语言（Cesium Language）

seg-fd0a7af2ebeb = CesiumJS 的 JSON 场景格式

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = 分贝／分贝瓦／分贝赫兹

seg-c485de5bcd85 = 功率比、绝对功率，以及一种 C/N0 单位

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = 直流电

seg-0ea7fccee332 = 零频率极限

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = 方向余弦矩阵（direction cosine matrix）

seg-9d3d9ca79a9d = 一种旋转矩阵

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = 开发者来源证书（Developer Certificate of Origin）

seg-1545bd59f5ef = DCT

seg-8b6866288bea = 设计控制表（design control table）

seg-80d95f099e9a = 一种链路预算表（JPL DESCANSO 的 Galileo X 波段示例）

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL 发展星历（JPL Development Ephemeris）（版本 { "421" }、{ "430" }、{ "440" }、{ "441" }）

seg-748af19e3f0b = 行星与月球星历；“DE级”指该级别的精度

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = 数字高程模型

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = 深空通信与导航系统卓越中心（Deep Space Communications and Navigation Systems Center of Excellence）

seg-2e11a1976171 = JPL 专著系列

seg-10dc0c578b92 = 慕尼黑工业大学德国大地测量研究所（Deutsches Geodätisches Forschungsinstitut der Technischen Universität München）

seg-e7cedd55549e = 托管 EUROLAS 数据中心

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = 差分 GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = 国土安全部（Department of Homeland Security）

seg-6b487421c547 = 美国

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = 国防部（Department of Defense）

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = 自由度

seg-bf5bc69cb873 = 见上文 1-DOF

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = 差分单向测距／delta 差分单向测距

seg-6ba2d3b5b724 = 深空角度跟踪

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" })／Runge–Kutta { "4" }／Runge–Kutta { "5" }／Dormand–Prince { "8" }({ "5,3" })

seg-00ecc6de9912 = 数值积分器

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = 距离均方根（distance root mean square）

seg-a8ed04890ded = 见 2DRMS

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = Microchip 数据手册文档编号

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = 深空原子钟（Deep Space Atomic Clock）

seg-e80350ed521f = NASA 的囚禁汞离子钟

seg-52e838301c0b = UT1 减 UTC

seg-fbce3b3b7b80 = 地球自转改正

seg-8aa996f34920 = 每比特能量与噪声密度之比

seg-463b21c0b791 = 在运行开始时与地固系对齐的惯性系

seg-4dc987bd9dbf = 供 leo-pass 互操作导出使用

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = JavaScript 所依据的标准／ES 模块

seg-e1a4fd0a6a76 = 经验 CODE 轨道模型 { "2" }（Empirical CODE Orbit Model）

seg-2967e958f353 = 一种 GNSS 太阳光压模型（CODE：欧洲定轨中心，Center for Orbit Determination in Europe）

seg-244af4062ccc = ECSS

seg-b74029376aba = 欧洲空间标准化合作组织（European Cooperation for Space Standardization）

seg-d452e23d503a = ECSS-E-ST-10-02 是其验证标准

seg-becb6685ff13 = ED

seg-b6448e14a567 = EUROCAE 文件

seg-ee4ada9c4c6e = 如 ED-259A

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = 进入、下降与着陆

seg-69f37001de44 = EEE

seg-18a1b66286ee = 电气、电子和机电（元器件）

seg-f814c1301059 = 空间产品保证

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = 地球重力场模型（Earth Gravitational Model）（{ "2008" } 版）

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = 采用新技术的欧洲改进地球重力模型（European Improved Gravity model of the Earth by New techniques）

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité（淘汰与选择表达现实）

seg-efb2f919955a = 一种级别优先（outranking）多准则方法

seg-88a2f1813af8 = 巴黎月球星历（Éphéméride Lunaire Parisienne），MPP02 版本（Chapront）

seg-b1d699d70339 = 一种解析月球理论

seg-aee5eeb23064 = J2000 地球平赤道与平春分点

seg-16d9b8eac95d = 一种惯性系

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = 一种码鉴别器

seg-0e4110d33849 = EMT

seg-103c6de62575 = 有效监测门限（effective monitor threshold）

seg-4b2101113387 = 一种 ARAIM 输出

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = 东—北—天／北—东—地

seg-aae7610833a7 = 当地水平坐标系

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = 对地观测

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = 行星与月球星历（Ephemerides of Planets and the Moon）（{ "2021" } 版）

seg-bd2a27a17f6d = IAA RAS 星历

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = 地球自转角

seg-966ed500f705 = ESKF

seg-e79112a3132a = 误差状态卡尔曼滤波器

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = 有效样本量

seg-57ce1c1b617b = 粒子滤波器的

seg-f529300f944b = ESSR

seg-869be8388d26 = 欧洲空间软件仓库（European Space Software Repository）

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = 星历时（ephemeris time）

seg-e0c49639649e = SPICE 对 TDB 的称呼

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = 欧洲民用航空设备组织（European Organisation for Civil Aviation Equipment）

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = 欧洲激光网（European Laser Network）

seg-fa7025d88c88 = 卫星与月球激光测距

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = 常见问题

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = 联邦通信委员会（Federal Communications Commission）

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = 全连接神经网络

seg-1de7b4410369 = FD

seg-4e73ff36d37f = 有限差分

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = 故障检测与排除

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = 有限元解（Finite Element Solution）（{ "2004" } 版）

seg-878b4a645ae9 = 一种海潮模型

seg-55c14f474a10 = FIM

seg-b68c86e68570 = 费希尔信息矩阵

seg-d39671724dfc = Fowler–Noll–Vo 哈希，变体 1a

seg-3354ad42f7dd = 用于固定黄金输出（golden outputs）

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = 完全运行能力／在轨验证

seg-ce13cca7f222 = 卫星代际（Galileo、Xona Pulsar）

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = 视场／瞬时视场

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = 现场可编程门阵列／微控制器／实时操作系统

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = 自由空间损耗／自由空间路径损耗

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = 吉字节／千字节／兆字节

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = 地心天球参考框架（Geocentric Celestial Reference Frame）

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = 地理空间数据抽象库（Geospatial Data Abstraction Library）

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = 地球静止轨道

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = 地理 JavaScript 对象表示法（Geographic JavaScript Object Notation）

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = 重力梯度

seg-d8ef4d361e86 = 如重力梯度力矩

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = 吉赫／千赫

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = 全球电离层图

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = GNSS/INS 组合／武汉大学的卡尔曼滤波 GNSS/INS 数据集与代码

seg-deca3cbe41ac = GIS

seg-36275ece527d = 地理信息系统

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = 格网电离层垂直误差（grid ionospheric vertical error）

seg-20a40777d78a = 一个 SBAS 电文术语

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = 由 ESA 发布的 GNSS 数据处理套件

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = GNU C 库

seg-2630ae5f0bc5 = 俄罗斯的全球导航卫星系统（Globalnaya Navigatsionnaya Sputnikovaya Sistema）

seg-361f1f18d454 = GLS

seg-397d58b727ee = 广义最小二乘

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = 引力参数

seg-e3a296392ac0 = 引力常数乘以天体质量

seg-45a8f50bce06 = 通用任务分析工具（General Mission Analysis Tool）

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = 戈达德火星模型 { "3" }（Goddard Mars Model）

seg-45abee95253b = 一种火星重力场

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = 格林尼治平恒星时

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = 制导、导航与控制

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = 按需网格处理（Grid Processing On Demand）

seg-14782f821cde = GR

seg-762f364a05f3 = 广义相对论

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = NASA 戈达德的 GRAIL 月球重力模型（GRAIL：重力恢复与内部结构实验室，Gravity Recovery and Interior Laboratory）

seg-220fae5cfc61 = { "1980" } 大地参考系（Geodetic Reference System）

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = 地面采样距离

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = 地面支持设备

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = 戈达德太空飞行中心（Goddard Space Flight Center）

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = 阿达马偏差／重叠阿达马偏差

seg-bb846135ceb4 = 一种对漂移不敏感的稳定度度量

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = 硬件在环

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = 危险误导信息／误导信息

seg-1cbf9d6f135d = 斯坦福图区域

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = 超文本标记语言（HyperText Markup Language）

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = 俄罗斯科学院应用天文研究所（Institute of Applied Astronomy of the Russian Academy of Sciences）

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = 国际大地测量协会

seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

seg-01880debd7e0 = 国际地磁与高空物理协会／其 V-MOD 工作组（地磁场建模）

seg-28805f15bae8 = 维护 IGRF

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = 初始条件

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = 国际民用航空组织

seg-c2d2d459177d = ICD

seg-a018300615e2 = 接口控制文件

seg-433b45040abd = 如 Galileo OS SIS ICD

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = 国际全球地球模型中心（International Centre for Global Earth Models）

seg-e9650a618b38 = ID

seg-e40875ab1090 = 标识符（或识别，如噪声类型识别）

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = 电气与电子工程师学会（Institute of Electrical and Electronics Engineers）

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = 互联网工程任务组／请求评论

seg-ce9375732735 = IF

seg-746eae5ce367 = 中频

seg-ed568f55aa8f = 接收机采样

seg-cb4aaa2581bb = IGS 对 ITRF2014 的实现

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = 国际地磁参考场

seg-669611e731d0 = IGRF-14（文件 IGRF14.shc）是第 14 代

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = 倾斜地球同步轨道

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on（GPS Block II 后续型）

seg-8a19be8033a9 = 一代 GPS 卫星

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = 国际激光测距服务

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = 整数最小二乘

seg-a214c483b8a8 = 整周模糊度解算

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = 天体力学与星历计算研究所（Institut de mécanique céleste et de calcul des éphémérides）

seg-22048a770612 = 巴黎天文台；发布 INPOP

seg-9717f14527d3 = 巴黎天文台行星数值积分历表（Intégration Numérique Planétaire de l'Observatoire de Paris），21a 版

seg-577acd29f11b = 一种行星星历

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = 机构间运行咨询组（Interagency Operations Advisory Group）

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = 导航学会（Institute of Navigation）／其国际技术会议

seg-53abad80634c = IoT

seg-9b766d557bd1 = 物联网

seg-1b41d114662e = IR

seg-ff2d89b32d07 = 完好性风险

seg-2dc9fcadccd6 = 出现危险误导信息的概率

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = 无线电工程师学会（Institute of Radio Engineers）

seg-3fbae7e11fca = IEEE 的前身之一

seg-9e3d84279d56 = 两个 GNSS 之间的钟差

seg-2ffee4396fbd = ISL

seg-505dee046f7a = 星间链路

seg-010ea5a76e2e = ISM

seg-330b25f923db = 完好性支持电文

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = 国际标准化组织

seg-8291ac1ccba6 = ISO { "8601" } 是其日期时间格式

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = 国际地球参考框架 { "1993" }／{ "2020" }

seg-14dc2a58e2c3 = 国际电信联盟无线电通信部门

seg-0e8094e4d45c = 其 P 系列建议书对传播建模

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = 国际大地测量与天体测量 VLBI 服务

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = 儒略日／简化儒略日

seg-996d4952554f = JMLR

seg-a1ef35b98931 = 机器学习研究杂志（Journal of Machine Learning Research）

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = 美国光学学会杂志（Journal of the Optical Society of America）

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = 欧盟委员会联合研究中心／其某份报告的编号

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript 对象表示法（JavaScript Object Notation）

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE 信号处理精选专题期刊（IEEE Journal of Selected Topics in Signal Processing）

seg-919a951f3d02 = KF

seg-436a208697f1 = 卡尔曼滤波器

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole 标记语言（Keyhole Markup Language）

seg-ffe25881cef6 = Google Earth 可读取的 OGC 标准

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = { -brand } 自有 LEO 导航电文文本格式的记录类型标签

seg-3269a4e6b3e3 = { -brand } 的扩展，不是标准

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = 关键绩效指标

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = 肯尼迪航天中心（Kennedy Space Center）

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = 关键字＝值表示法（Keyword = Value Notation）

seg-7379ade4ee0e = CCSDS 电文的文本形式

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = 月球增强导航服务（Lunar Augmented Navigation Service）

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = 线性代数软件包（Linear Algebra PACKage）

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = 线性同余发生器

seg-8927ca404e64 = NIST SP { "1065" } 测试序列发生器

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = 月球通信与导航服务（Lunar Communications and Navigation Services）

seg-5253cae4b05b = ESA 的 Moonlight 服务

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = 月球通信中继与导航系统（Lunar Communications Relay and Navigation Systems）

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = 线性反馈移位寄存器

seg-5b09c8e3f127 = 扩频码生成

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU 宽通用公共许可证（GNU Lesser General Public License）

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = 重对数律

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = 失锁指示／信号强度指示

seg-7d95179a5a1f = RINEX 观测值标志

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = 月球激光测距

seg-20deda97c876 = LLVM

seg-5a84a3219546 = LLVM 编译器基础设施（最初为 Low Level Virtual Machine）

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = 传统导航电文

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = 月球导航与通信卫星系统

seg-4ce3c0ea7a31 = NAVIGATION { "70" }({ "4" })，navi.613 中的星座案例研究

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet 互操作规范（LunaNet Interoperability Specification）

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = 月球导航卫星系统（Lunar Navigation Satellite System）

seg-97ff1706b4bd = 一种拟议中的月球星座

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = 带垂直引导的定位器性能／其 { "200" } 英尺决断高度类别

seg-090ba62634a8 = 航空进近

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = 月球勘测轨道飞行器（Lunar Reconnaissance Orbiter）

seg-8f782bde5659 = LS

seg-c5bc49526464 = 闰秒

seg-54ea05b82cb4 = 如 Δt_LS

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = 光行时

seg-4729314afd46 = LTE

seg-1a7e158f020f = 长期演进（Long-Term Evolution）

seg-3c1b3acc46d9 = 4G 蜂窝标准

seg-3530cdaca137 = LU

seg-58ad64b9d450 = 下—上（分解）

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = 月球 GNSS 接收机实验（Lunar GNSS Receiver Experiment）

seg-84874825a5d1 = { "2025" } 年飞往月球

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = 斯坦福的月球 PNT 库

seg-893ba320da76 = 是名称

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB 算法可用性仿真工具（MATLAB Algorithm Availability Simulation Tool）

seg-a24b3840d248 = 斯坦福

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = 制造、装配、集成与测试

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = JPL 针对火星、木星和土星卫星的卫星星历解

seg-9b0688bfc31e = 标识符

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = 最低航空系统性能标准

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = 矩阵实验室（MATrix LABoratory）

seg-e722ea781fdf = 一种数值计算产品

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = 多属性效用理论

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = 火星气候数据库（Mars Climate Database）

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = 多准则决策分析

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = 月心惯性系／月心月固系

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = 最小可检测偏差

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = 修正阿伦偏差

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = 微机电系统

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO（Métrologie Optique），格拉斯激光测距站／马泰拉激光测距台（Matera Laser Ranging Observatory）

seg-a8fcbefbbf4c = 月球激光测距站

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = 平均地球／主轴

seg-f30f1a2778cf = 两种月固坐标系（MOON_ME、MOON_PA）

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = 多系统 GNSS 实验（Multi-GNSS Experiment）

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = 麻省理工学院（Massachusetts Institute of Technology）

seg-e9d7062835a9 = 如 MIT 许可证

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = 多层感知机

seg-6975432180f6 = 一种小型神经网络

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = 瞬时平赤道／瞬时真赤道

seg-1af66f9b771d = 赤道与春分点坐标系

seg-b5db821f8008 = MOORA

seg-7f763036e34d = 基于比率分析的多目标优化（Multi-Objective Optimisation on the basis of Ratio Analysis）

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = 最低运行性能标准

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla 公共许可证（Mozilla Public License）

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = 火星勘测轨道飞行器重力模型 { "110" } 和 110B2

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = 最低支持的 Rust 版本

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = 调制传递函数

seg-7f60d1ac40ad = 光学成像

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = 最小方差无失真响应

seg-83f57219e5b7 = 自适应波束形成

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = 微波链路

seg-639266912f59 = ACES 时间传递链路

seg-5ac07401e4f8 = NaN

seg-722d679807ee = 非数值（not a number）

seg-0e4abc653325 = NavIC

seg-355821380384 = 印度星座导航（Navigation with Indian Constellation）

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = 导航创新与支持计划（Navigation Innovation and Support Programme）

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = 导航（电文）／观测

seg-1729ddf0eafa = RINEX 的两种文件类型；斯坦福 NAV Lab 即导航与自主车辆实验室（Navigation and Autonomous Vehicles Laboratory）

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = 原美国国家标准局／NBS14 频率稳定度参考数据集

seg-3d1ac5146fea = 用于检查阿伦估计器

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = 归一化估计误差平方／归一化新息平方

seg-af167a77a1dc = 滤波器一致性检验

seg-beb7a86721ec = 国家地理空间情报局（National Geospatial-Intelligence Agency）

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = 国家大地测量局／国家海洋和大气管理局

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = 国家影像与测绘局（National Imagery and Mapping Agency）／其技术报告 TR8350.2（WGS { "84" } 的定义）

seg-ffa6025b5a70 = NIMA 是 NGA 的旧称

seg-af4be907e56c = NLOS

seg-22ab7d58324b = 仅有反射的信号

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = 非负最小二乘

seg-af8ca8550600 = NORAD

seg-07428e7224cf = 北美防空司令部（North American Aerospace Defense Command）

seg-4edb033e3432 = 维护公开的卫星目录

seg-dd984e16dbcd = NP

seg-f92816d7c936 = 奈曼—皮尔逊

seg-fc214695fa83 = 检测理论

seg-3ef8006482bb = NPA

seg-81a072ee0520 = 非精密进近

seg-b9fd2cf6a2b9 = 航空

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = 章动—岁差—偏差

seg-b4562efbafdf = IAU 2006/2000A 矩阵

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = 海军研究实验室（Naval Research Laboratory）／其质谱仪与非相干散射雷达扩展大气模型（Mass Spectrometer and Incoherent Scatter Radar Extended），{ "2000" } 版

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = 非地面网络

seg-1ae0305d8455 = 来自卫星的 5G

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA 技术报告服务器（NASA Technical Reports Server）

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = 夸大声明（overclaim）标识符

seg-47ba87f3730b = CLAIMS-VS-REALITY.md 的各行

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = 开放容器倡议（Open Container Initiative）

seg-b5bf07ed6c8c = 容器镜像格式

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = 常微分方程／随机微分方程

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = 轨道数据电文

seg-35fe6a2f3de3 = 包含 OEM 和 OMM 的 CCSDS 系列

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = 开放地理空间联盟（Open Geospatial Consortium）

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = 普通／加权最小二乘

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = ESA 的在轨软件实验室卫星／其异常检测数据集

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = 开放空间创新平台（Open Space Innovation Platform）

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = 开放服务导航电文认证（Open Service Navigation Message Authentication）／定时高效流容损认证（Timed Efficient Stream Loss-tolerant Authentication）

seg-95b6b14facf1 = Galileo 信号认证

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = 开放服务（Galileo、北斗），或操作系统

seg-6db10af375e3 = 具体含义视上下文而定

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = 奥恩斯坦—乌伦贝克（Ornstein–Uhlenbeck）

seg-9be9042ec983 = 一种均值回复的噪声过程

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = 产品保证（也指精密进近，如 K_H,PA）

seg-65ad442b3faa = PCK

seg-c788fe80678e = 行星常数内核

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = 便携式文档格式（Portable Document Format）

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = 检测概率／虚警概率

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = TEME 与 ITRF 之间的坐标系

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = 卫星标识符：SP3 的 GPS 卫星标签、SBAS 伪随机噪声编号、Galileo 卫星名称

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite（在轨冷却原子的原子钟项目）

seg-302c8cb738ac = ACES 的铯原子钟

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = 保护级

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = 锁相环

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central／其某篇文章的标识符

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = 相位调制／频率调制

seg-279251adb2eb = 时钟相位或频率上的噪声

seg-685fc49957e2 = PN

seg-209dacf76ff3 = 如 PN 测距

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = 便携式网络图形（Portable Network Graphics）

seg-06998de7b6be = POD

seg-178f55858efb = 精密定轨

seg-b7919977bf20 = PPN

seg-ed81960f1282 = 参数化后牛顿（parametrised post-Newtonian）

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = 精密单点定位／实时动态／单点定位

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = 秒脉冲

seg-2619e854281a = PR

seg-66c53cdfc3d9 = 拉取请求（pull request）

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = 伪随机噪声（码编号）

seg-6f384580af80 = 信号中对 GNSS 卫星的称呼方式

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = 偏好排序组织评估丰富法（Preference Ranking Organization METHod for Enrichment of Evaluations）

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = 一种期刊

seg-78a947083d45 = PSD

seg-6eb799bd1582 = 功率谱密度

seg-ab1af8b3d968 = 见上文

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = 性能标准／标准定位服务

seg-2800b3a8cd2e = GPS SPS 的 PS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = 德国物理技术研究院（Physikalisch-Technische Bundesanstalt）

seg-611e7e4a34f4 = 德国国家计量研究院

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = 精确时间协议（Precision Time Protocol）

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = 位置、速度与时间

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = Rust—Python 绑定库／Python 打包管理局／Python 包索引

seg-96b2c707a6b8 = Parametry Zemli { "1990" }（地球参数）

seg-3d5012a62544 = GLONASS 大地基准

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = 质量保证

seg-7025be647972 = QEMU

seg-d2209c7eea42 = 快速模拟器（Quick Emulator）

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = 正交相移键控

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = 准天顶卫星系统（Quasi-Zenith Satellite System）

seg-531943b17837 = 日本

seg-697c55525b36 = RAAN

seg-85cd6997e07e = 升交点赤经

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = 抵御—检测—响应—恢复（Resist–Detect–Respond–Recover）

seg-76da7c5bf39a = RethinkPNT/Firesmith 韧性模型

seg-7bb5ed20c788 = RF

seg-35b036272c8e = 射频

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = 右端项

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = 均方根／平方和根

seg-8b2bd83256f1 = RNG

seg-b90957003307 = 随机数发生器

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = 韧性导航与授时基金会（Resilient Navigation and Timing Foundation）

seg-43d17f884c69 = ROI

seg-597432415e53 = 投资回报率

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = 韧性 PNT 一致性框架（Resilient PNT Conformance Framework）

seg-2f030c1d70c1 = 美国 DHS

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = 海事无线电技术委员会（Radio Technical Commission for Maritime Services）

seg-4a7703f1b605 = 其电文标准带有 CRC-24Q

seg-520c91fa0ef0 = 一个开源的 GNSS 定位库（实时动态库）

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = 径向、横向、法向

seg-b1b635ff08e4 = 一种轨道固连坐标系

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = 随机游走

seg-8b593d7d5dbd = 如偏置随机游走

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = 随机游走、白和闪烁频率调制／白和闪烁相位调制

seg-7fced178bcc5 = 幂律时钟噪声类型

seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

seg-0c397d845610 = Microchip 产品名称（两种芯片级原子钟、一种恒温晶体振荡器）

seg-8a1ae00c4a52 = 是名称，不是缩写

seg-a58426a850fd = SD

seg-d46cb77d53f6 = 标准差

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = 服务定义文件（Service Definition Document）

seg-9415da7a79ab = 如 Galileo OS SDD

seg-1022626b788c = SDK

seg-2076da4dd4dd = 软件开发工具包

seg-9fb492bced01 = SDR

seg-1a1082059103 = 软件定义无线电

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = 太空防御中队（Space Defense Squadron）

seg-c3f6fc1456ed = 第 18 太空防御中队维护美国的卫星目录

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = 太阳—地球—探测器夹角（也指球概率误差）

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = 随机梯度下降

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = 简谐运动

seg-b0973ab206ed = SI

seg-35624e5e4630 = 国际单位制

seg-02aa435dc884 = SIB

seg-262a811c8b69 = 安全信息公告（Safety Information Bulletin）

seg-b9ee445609f5 = EASA；EASA 即欧盟航空安全局

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = 解无关交换格式（Solution INdependent EXchange format）

seg-3466519e4c62 = 大地测量解

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = 采样重要性重采样

seg-7a2e0e9cac08 = 一种粒子滤波器

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = 空间信号／空间信号精度

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = 桑迪亚惯性地形辅助导航（Sandia Inertial Terrain-Aided Navigation）

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = 卫星激光测距

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = 空间任务分析与设计（Space Mission Analysis and Design）

seg-dfc105c0178b = 该教科书

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = 信噪比

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = 平方和／残差平方和

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = 最先进水平（state of the art）

seg-127e73a3610b = NIST 特别出版物 { "1065" }

seg-bedc9a3d8d9f = 与 NIST SP { "1065" } 是同一份文件

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = 对称正定／正定

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = 软件包数据交换（Software Package Data Exchange）

seg-c10b1f20f37e = 文件头中的许可证标识符

seg-b377a91a047f = SPK

seg-5603642c612d = 用于航天器和行星星历的 SPICE 内核

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = 单点故障

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = 信号质量监测

seg-a4e75468e6f9 = 相关器形状的欺骗干扰（spoofing）检查

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = 平方根信息滤波器

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = 太阳辐射压

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = 航天飞机雷达地形测绘任务（Shuttle Radar Topography Mission）／其高程文件格式

seg-4692354a98de = 瓦片以其西南角命名，例如 N36W117

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = 太阳系动力学（Solar System Dynamics）

seg-1d8167212f57 = JPL 的该小组

seg-d21315ea8c52 = STEC

seg-84689b829867 = 斜向总电子含量

seg-eabee4bfb30e = Systems Tool Kit（系统工具包）

seg-a7ff60ab0bd9 = 一种任务分析产品

seg-17d792c12885 = Iridium 的定位与授时服务

seg-3efaadad9c96 = STM

seg-da395fa674ec = 状态转移矩阵

seg-d116578b987b = SV

seg-caa37a1e7d12 = 空间飞行器（即卫星）

seg-845e6f3a37ec = SVD

seg-e775c436db4b = 奇异值分解

seg-3e5561868a7f = 可缩放矢量图形（Scalable Vector Graphics）

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE 航空航天与电子系统汇刊（IEEE Transactions on Aerospace and Electronic Systems）

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = 遥控／遥测

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = 测试驱动开发

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = 到达时间差／到达频率差

seg-aecac9c9d2d0 = 无源辐射源定位

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = 地形等高线匹配

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = 德克萨斯欺骗干扰测试集（Texas Spoofing Test Battery）

seg-941eccec7400 = 已记录的 GNSS 欺骗干扰（spoofing）数据（OAKBAT 是同类数据集）

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = 时间间隔误差

seg-eb12660210bd = TIES

seg-9335f08b6381 = 电信信息交换服务（Telecommunication Information Exchange Service）

seg-12f4af2b48c1 = ITU 成员账户

seg-c05ba396ac1e = ToA

seg-78a41e672189 = 到达时间

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = 容差

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = 逼近理想解排序法（Technique for Order of Preference by Similarity to Ideal Solution）

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = 总偏差／总方差

seg-7350da5c5c30 = 扩展范围稳定度估计器

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE 模式分析与机器智能汇刊（IEEE Transactions on Pattern Analysis and Machine Intelligence）

seg-85692b01a12d = TPL

seg-123ed92776a3 = 授时保护级

seg-10c9563602b7 = 见 SLOT-TIMING.md

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = 热防护系统

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = 地形参考导航

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = 技术报告／技术说明

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = 代尔夫特理工大学（Delft University of Technology）

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = 双向卫星时间频率传递／双向时间频率传递

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = u-blox 二进制接收机协议

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = 用户差分距离误差

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = 用户等效距离误差

seg-7d87e82154ed = UFFC

seg-02457dbb660b = 超声、铁电与频率控制（Ultrasonics, Ferroelectrics, and Frequency Control）

seg-f4da31f92a79 = 一种 IEEE 汇刊

seg-573db7b5995b = { "300" } MHz 至 { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = 用户界面／用户体验

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = 均匀线阵

seg-db65f4a7586d = ULP

seg-ae7458813685 = 最后一位的单位（unit in the last place）

seg-d7f4df5a9d13 = 浮点精度

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = 用户测距精度／用户测距误差

seg-17e8fb142c6c = URA 用于界定完好性，URE 是精度的均方根

seg-1e02dfc0a52b = URL

seg-f726bcd9d4ad = 统一资源定位符

seg-088e05d67af1 = USGS

seg-ffed8eca324d = 美国地质调查局（United States Geological Survey）

seg-1ded2eb40061 = USNO

seg-2b5f7bbe22e9 = 美国海军天文台（United States Naval Observatory）

seg-39ed84639c60 = USO

seg-f9f684640e53 = 超稳振荡器

seg-b3a829cb7d84 = { "1976" } 美国标准大气（US Standard Atmosphere）

seg-ba97a4005ee8 = VIKOR

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje（多准则优化与折衷解）

seg-7fe170288e4e = 甚长基线干涉测量

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = 广域增强系统／欧洲地球静止导航重叠服务

seg-1746693259e0 = SBAS；见上文

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = 加权累加乘积评估（Weighted Aggregated Sum Product ASSessment）

seg-c9710476b8b5 = 欧盟—美国卫星导航合作的 C 工作组

seg-79f0e87410bf = 发布 ARAIM 参考文件

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = 制图坐标与自转要素工作组（Working Group on Cartographic Coordinates and Rotational Elements）

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = 高斯白噪声

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = 世界大地坐标系 { "1972" }／{ "1984" }

seg-5964aa61f847 = SGP4 使用 WGS72 常数

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = 武汉大学

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = 加权和模型／加权积模型

seg-cc68c85bb2b9 = 多准则聚合（WPM 也指白相位调制；具体含义视上下文而定）

seg-9041c866d202 = XML

seg-0e55c3adc568 = 可扩展标记语言

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = 异或

seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

seg-195082605699 = 地磁场分量：北向、东向、向下、总强度；磁偏角、磁倾角

seg-94835748fcbb = YAGNI

seg-76430d755d74 = 你不会需要它（you aren't gonna need it）

seg-e4e177088376 = 一条设计原则

seg-565c1908393c = ZHD

seg-77a0948bc15d = 天顶静力延迟

seg-749be52554c5 = 可复现性与许可

seg-d78d9bbb905c = <b>可复现（确定性）。</b>相同的输入总是给出逐位完全相同的输出——<c1/>。没有隐藏的随机性。

seg-1412347e2298 = <b>随机种子（seed）。</b>用来初始化（确定性）随机数发生器的数字，使各次运行可以重复。

seg-3a35740e04a8 = <b>开放核心（Open core）。</b>一种商业模式：引擎免费并开源（AGPL-3.0，即下文定义的 GNU Affero 通用公共许可证；另有商业双许可）；维持运营的业务是支持、集成、商业许可和专有附加组件——而不是对开放引擎收取席位费。

seg-8ea21ebded3c = <b>AGPL-3.0。</b>GNU Affero 通用公共许可证第 3 版——一种经 OSI（开放源代码促进会，Open Source Initiative）认可的强 copyleft 开源许可证。与 GPL（GNU 通用公共许可证）相似，但多了一条条款（§{ "13" }），涵盖<b>通过网络</b>向用户提供的软件：通过网络访问的修改版必须向这些用户提供其对应源代码。是 { -brand } 的开放许可证。

seg-f87860d8197d = <b>双许可（Dual-licensing）。</b>以两种许可证提供同一份代码，由用户选择：此处为 AGPL-3.0（开放、copyleft）<b>或</b>由 Ashforde OÜ（一家爱沙尼亚私营有限公司；OÜ = osaühing）提供的商业许可证，用于 AGPL 不适合的专有／封闭用途。参见 <c1/>。

seg-dd5f4a1bbbf5 = 同样用于 kshana.dev

seg-9d0c42560a90 = 本网站使用、但不在上文仓库术语表中的缩写。

seg-67a54ce8c89e = 全球定位系统

seg-814b0d29bbb2 = 载噪比密度，以 dB-Hz 计

seg-f22a269bc575 = GNSS 使用的 { "1" } 至 { "2" } GHz 无线电频段

seg-1f4360a0405c = GPS L1 的粗捕获码

seg-6f7910207534 = 增强前向信号（月球）

seg-74f02864ce32 = 微机电系统

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = 无人航空器系统

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = 保护级 · 告警限值

seg-78134bcc48da = 带垂直引导的进近，I 级

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = 低地球轨道 · 地球静止轨道

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = CCSDS 轨道星历、轨道平均根数和跟踪数据电文

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = 深空网络

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = 温度补偿 · 恒温晶体振荡器

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = 被动型氢原子钟

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = 超稳振荡器 · 深空原子钟

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = 最大时间间隔误差 · 时间偏差

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = 基准主时钟 · 增强型 PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = 平均时间 τ 下的阿伦偏差

seg-96fae3b4fb8e = 国际电信联盟电信标准化部门

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = 归一化新息平方 · 归一化估计误差平方

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript 对象表示法 · 逗号分隔值 · 可缩放矢量图形

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = 命令行界面 · 应用程序编程接口 · 集成开发环境

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = 软件物料清单 · 软件制品供应链级别（Supply-chain Levels for Software Artifacts）

seg-347b23148b8f = NDA

seg-969d2489de28 = 保密协议

seg-564cfa0d3084 = 数字对象标识符

seg-5cbd99859d90 = C/N₀ 瀑布图

seg-ed4a9e041a83 = 逐颗卫星的载噪比密度随时间变化的图表

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = 水平 · 垂直保护级

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = 月球勘测轨道飞行器相机

seg-c5da9d350518 = <s1>上一页</s1>概念入门

seg-670504be0531 = <s1>下一页</s1>Studio 指南
