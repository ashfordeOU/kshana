# docs--kind-quantum-trade: translations (zh-Hans)

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }：列出此类型的<a1>验证矩阵</a1>各行。

seg-7b2721b7588d = 引擎v{ $version }的场景类型，所属系列为<a1>惯性、融合与量子传感器</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为MODELLED（标签如何获得，见README的Evidence一节）。

seg-f7f12029e0ec = 系列页面：<a1>惯性、融合与量子传感器</a1>

seg-496b17a8d3b9 = 主题页面：<a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b>不提供——仅有性能模型；冷原子/时钟硬件由合作方负责。参考基准（oracle，NoneKind）：无：由合作方负责的领域，按设计既没有模块也没有测试

seg-51cac2f918e0 = 专题页：<a1>POSITIONING.md</a1>

seg-3a8c76a2396f = 来源：<c1/>

seg-f9af2813532e = <c1/>（场景类型）

seg-eb55d253dd11 = 量子对经典PNT权衡（{ "13503" }）：候选时钟（实测ADEV曲线，即可辩护性的关键，或量子时钟类别）相对经典基线类别的授时守时（holdover）与惯性守时收益，附带随制品携带的长tau底限假设局限，外加GNSS拒止下的韧性随时间包络。MODELLED；对合作方器件只作量化（绝不验证）。候选时钟是一条实测曲线（<c1/> + <c2/>，长度相等，至少{ "2" }个点；两种形式都给出时以它为准）或一个<c3/>。

seg-4f470bc1d82c = <c1/>的一次运行汇总如下：quantum-trade | 候选measured-ADEV | 授时守时（holdover）2621947s对203s（12943.62x）| 惯性14108s对378s（37.34x）| 韧性滑行14108s | MODELLED [假定底限的局限]

seg-2639560aeff2 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>

seg-d66f1ef84201 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>

seg-f2cc0830b53f = 示例<c1/>设置了以下内容等：

seg-ee5bcbbe0167 = csac

seg-a6551a61cf69 = 经典基线

seg-f5fa445702c6 = 结果标签（引擎给出）：MODELLED：对合作方时钟/传感器只作量化（绝不验证）；未经飞行演示

seg-c74c63ffd859 = 引擎为scenarios/quantum-trade.toml（类型quantum-trade）绘制的图表

seg-93310aaa6ead = <b>VALIDATED</b>由已发表的实测 ⁸⁸Sr光钟跃迁阿伦偏差做幂律（白调频 + 红噪声底限）NNLS恢复，复现 σ_y(τ)以及头条的4.7e-16/√τ 短 τ 标度，并带有真实实测的长 τ 底限，而不是 测试：<a1>optical_clock_adev_reference.rs</a1>。

seg-fc46e95688ba = <b>VALIDATED</b>实测ADEV的NNLS拟合、NEES/NIS χ² 一致性区间，以及时钟van-Loan离散过程噪声（守时滑行）协方差，这是权衡引擎的计算主干 测试：<a1>scipy_reference.rs</a1>。

seg-6e2b62136cef = <b>MODELLED</b>实测ADEV导入（NNLS）、权衡表（授时/惯性守时 + 收益）、韧性随时间包络；底限局限随制品携带。

seg-b577b8464cf7 = <b>VALIDATED</b>实测ADEV的NNLS拟合、NEES/NIS χ² 一致性区间，以及时钟van-Loan离散过程噪声（守时滑行）协方差，这是权衡引擎的计算. 参考基准（ExternalDataset）：scipy { "1.17.1" }：optimize.nnls / stats.chi2.ppf / linalg.expm；NNLS+Q完全一致，在工作自由度下 χ² <{ "5e-4" }。仅限内核，器件性能数字仍为建模结果（见下一行）

seg-6b8aa8cd6d3e = <b>MODELLED</b>实测ADEV导入（NNLS）、权衡表（授时/惯性守时 + 收益）、韧性随时间包络；底限局限随制品携带。可运行自. 参考基准（ExternalDataset）：实测ADEV→PSD拟合（NNLS）内核与scipy.optimize.nnls一致（tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs），这是一个独立的外部内核；但权衡的数字只是对合作方时钟/CAI作量化（绝不验证），因此权衡本身仍为MODELLED，不带验证光环

seg-3d678f64e41c = MODELLED：对合作方时钟/传感器只作量化（绝不验证）；未经飞行演示（结果<c1/>）

seg-20ba66ae9518 = 量子对经典PNT权衡（{ "13503" }）：候选时钟（实测ADEV曲线，即可辩护性的关键，或量子时钟类别）相对经典基线类别的授时守时（holdover）与惯性守时收益，附带随制品携带的长tau底限假设局限，外加GNSS拒止下的韧性随时间包络。（类型目录（<c1/>））

seg-45a1d84eef18 = MODELLED；对合作方器件只作量化（绝不验证）。（类型目录（<c1/>））

seg-15275d27252a = 计算候选时钟相对经典基线的授时守时（holdover）与惯性守时收益，外加GNSS拒止下的韧性随时间包络。候选底限由合作方时钟实测的重叠ADEV曲线（可辩护性的关键）经非负最小二乘拟合得出，因此守时预算建立在真实数据之上，而不是假定的长tau底限。（场景文件注释，第{ "3" }至{ "7" }行）

seg-ecbdbc9b163e = 诚实范围：MODELLED：它只量化合作方量子时钟的收益；它不验证该器件，也绝不借用SGP4/阿伦/IGS的核对验证孤岛。任何一行的底限为假定的类别默认值时，制品上都会显示底限局限。运行：kshana scenarios/quantum-trade.toml（场景文件注释，第{ "9" }至{ "12" }行）

seg-4b59ac409819 = 量子对经典PNT权衡与GNSS拒止韧性（{ "13503" }）是MODELLED，而非经独立核对验证：其中一项子声明经过外部核对，但整项能力由建模的部分组合而成，因此该能力仍是Modelled。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e6498fae3ba7 = <s1>上一页</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>下一页</s1>realtime-frame-eop
