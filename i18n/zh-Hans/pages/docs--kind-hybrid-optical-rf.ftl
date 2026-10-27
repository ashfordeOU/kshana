# docs--kind-hybrid-optical-rf: translations (zh-Hans)

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-0482fec5b0f6 = 来源：<c1/>

seg-830c574e871b = <c1/>（场景类型）

seg-72ad48275ebe = 引擎v{ $version }的场景类型，所属系列为<a1>光学PNT</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为MODELLED（标签如何获得，见README的Evidence一节）。

seg-e6839b50b560 = MODELLED异构光学 + RF PNT联合性能指标（P5）：组合{ "1550" } nm双向光学链路预算（光子受限的双向测距CRLB σ_τ/√N与衍射足迹 λ/D·距离）、跨模态解分离RAIM保护级（位置与授时），它将松耦合RF解与紧耦合光学解按不同的协方差融合；N站光学晴空可用性（独立并集{ "1" }−Π({ "1" }−a_i)，以及空间相关变体）、光学↔RF状态/协方差切换（其均值经已证明逐位连续（无跳变），并带NEES χ² 一致性门限），以及带相关性处理的联合P(可用AND精密级AND完好性有保证) 评分。VALIDATED闭式解：测距CRLB、衍射足迹、χ² 保护级分位数、并集组合计数、切换均值连续性 + NEES门限，以及联合独立乘积。MODELLED：光学损耗分配、RF/光学 σ 量值、云气候学输入、相关性以及P_HMI预算。不是经认证的可用性/完好性产品。

seg-30904e2367fc = <c1/>的一次运行汇总为：hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology

seg-73e5cf56c92c = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>、<c22/>、<c23/>、<c24/>、<c25/>、<c26/>、<c27/>、<c28/>、<c29/>、<c30/>、<c31/>、<c32/>、<c33/>、<c34/>、<c35/>、<c36/>、<c37/>、<c38/>、<c39/>、<c40/>、<c41/>、<c42/>、<c43/>

seg-27338c8b2e5f = 示例<c1/>设置了以下内容等：

seg-7b9ce4689508 = 引擎给出的结果标签：异构光学 + RF PNT联合可用性/精密度/完好性性能指标（P5）。VALIDATED闭式解：光子受限的测距CRLB（σ_τ/√N）与衍射足迹（λ/D·距离）、χ² 跨模态保护级分位数、N站独立并集可用性（{ "1" } − Π(

seg-5cea5229815e = 引擎为scenarios/hybrid-optical-rf.toml（类型hybrid-optical-rf）生成的图表

seg-a8923a682728 = <b>MODELLED</b> hybrid-optical-rf报告说明其实际运行时采用的链路配置（载波波长、发射与接收孔径、距离、脉冲宽度、积分。参考基准（oracle，InternalConsistency）：没有外部参考基准，也不可能有：这是自我描述，不是测量。之所以记录它，是因为缺少它曾是一个缺陷——P5不得不从源码默认值中引用载波波长和发射孔径，并通过内部自洽检查推断出一个裸的<c1/>以平方米为单位。该推断是正确的，这恰恰是它重要的原因：没有任何手段能发现它是错的

seg-28abb5a84eaa = <b>MODELLED</b> hybrid-optical-rf报告说明一个RF链路可用性，由引擎已经计算出的量组合而成，而不是由引入的气候学数据得出，并。参考基准（oracle，InternalConsistency）：没有外部参考基准，并且拒绝使用ExternalDataset。两个输入为Eb/N0裕量与C/N0门限穿越，二者都是MODELLED的EIRP、性能指标与集总损耗分配的函数；对于地月光学/RF混合服务，没有可用来核对该组合数值的实测可用性记录。现有的检查是内部的，并如实说明为内部检查：该组合由

seg-888004543d37 = <b>MODELLED</b> hybrid-optical-rf报告给出光学对RF的测距比，并在同一对象中携带两条链路评估时所用的同一个配置：相同。参考基准（oracle，InternalConsistency）：该比值没有外部参考基准，并且有意拒绝使用ExternalDataset。其底层的RF链路确实有——tests/validate_p5_rf_ranging_precision.rs对照独立的Python/NumPy夹具以及硬编码的Kaplan & Hegarty算例值（{ "45" } dB-Hz时为{ "2.814e-3" } chip / { "0.825" } m）检查linkbudget::link_budget与navsignal::dll_code_jitter_chips——并且光学CRLB有自己的闭式行

seg-db5ff373b50f = <b>MODELLED</b> hybrid-optical-rf报告说明跨模态卡方监测器实际能检测什么，而不仅是它在无故障情形下通过：最小可检测。参考基准（oracle，InternalConsistency）：两个内部参考基准，没有外部数据集。（{ "1" }）闭式往返：最小可检测偏差通过对非中心参数反演非中心卡方尾部得到（raim::pbias），并把所得非中心参数代回raim::noncentral_chi2_cdf，在监测器自身的门限处加以验证，其结果必须返回P_md。（{ "2" }）注入对分析：将一个偏差写入某一轴的RF估计

seg-24f31f6b353f = 异构光学 + RF PNT联合可用性/精密度/完好性性能指标（P5）。VALIDATED闭式解：光子受限的测距CRLB（σ_τ/√N）与衍射足迹（λ/D·距离）、χ² 跨模态保护级分位数、N站独立并集可用性（{ "1" } − Π({ "1" }−a_i)）、光学↔RF切换均值连续性（逐位无跳变）不变量与NEES χ² 门限，以及联合FoM独立（结果<c1/>）

seg-bec90783ad8b = MODELLED异构光学 + RF PNT联合性能指标（P5）：组合{ "1550" } nm双向光学链路预算（光子受限的双向测距CRLB σ_τ/√N与衍射足迹 λ/D·距离）、跨模态解分离RAIM保护级（位置与授时），它将松耦合RF解与紧耦合光学解按不同的协方差融合；N站光学晴空可用性（独立（类型目录（<c1/>））

seg-15abc895e477 = MODELLED：光学损耗分配、RF/光学 σ 量值、云气候学输入、相关性以及P_HMI预算。（类型目录（<c1/>））

seg-9fafa5ffb521 = MODELLED。经独立核对的闭式：测距CRLB（sigma_tau/sqrt(N)）、衍射足迹（lambda/D * 距离）、卡方保护级分位数、并集组合计数、切换均值连续性 + NEES门限，以及联合独立乘积。损耗分配、sigma量值、云气候学输入、相关性和P_HMI预算是由模型计算得出的代表性输入。下面每个字段都是可选的，并以其（场景文件注释，第{ "10" }至{ "14" }行）

seg-e5f964e5d422 = --- G15针对跨模态监测器的偏差/斜坡故障注入 --- 最小可检测偏差与检测功率曲线是解析式的（非中心卡方反演），因此无需自己的输入。这两项只设定斜坡速率，所报告的检出时间是由它换算而来。两者均为MODELLED。（场景文件注释，第{ "56" }至{ "59" }行）

seg-70f50a62aa12 = --- G17切换后的惰行：过程噪声与告警限值穿越 --- 在现有的4状态（东、北、天、钟）切换滤波器上做随机游走。告警限值即上文已声明的那些；只有过程噪声和覆盖因子是新增的。两个功率谱密度均为MODELLED的代表性输入，穿越时间与它们成正比。（场景文件注释，第{ "63" }至{ "67" }行）

seg-9fb4240fb0ef = 混合光学/RF报告的自我描述为MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-a97755cb13eb = 系列页面：<a1>光学PNT</a1>

seg-1586d90cdf1b = <s1>上一页</s1>holdover-test

seg-211275a00df0 = <s1>下一页</s1>hybrid-ukf
