# docs--kind-araim-reference-check: translations (zh-Hans)

seg-debc2f07db78 = true

seg-c53da0bf140d = 来源：<c1/>

seg-82884391dd77 = <c1/>（场景类型）

seg-8e845ce908ee = 引擎 v{ $version } 的场景类型，所属类别为<a1>GNSS 测量、定位与完好性</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-06197409c717 = 已发布的 ARAIM 认证参考向量：引擎的 ARAIM 水平与垂直保护级，对照 WG-C ARAIM 技术子组自己的数值算例运行，容差（TOL_PL = { "5e-2" } m）即这些文档自身所述的容差。有两个向量作为夹具提交，各自附有获取 URL、获取日期、源文件 SHA-256 和页码：《Reference Airborne Algorithm Description Document》v3.1（{ "2019" } 年）附录 D（自洽，也是验收向量），以及《Milestone { "3" } Report》（{ "2016" } 年）附件 A 第 A.IX 节，即研究文献所引用的陈述。每个已发布的输入（10 颗卫星、2 个星座的几何矩阵，C_int 和 C_acc 方差对角线，b_nom、P_sat、P_const 以及 LPV-200 常数集）和每个已发布的输出（VPL、HPL、EMT、sigma_v_acc、K_fa_3，以及两种星座故障模式的 sigma_3、sigma_ss_3 和 b_3）都与引擎自己的数值及二者的绝对差一并报告。保护级方程在此并不重新求解：参考算法的模式列表交给引擎现有的 raim::araim_protection_level / araim_integrity_risk，因此被测的二分法和高斯尾部代数运算是引擎自己的；只有几何、子解、检测门限和已发布的预算划分是为它构建的。已由外部核对，对照 { "2019" } 年向量：VPL { "18.2926" } m，已发布值为 { "18.3" } m；HPL { "13.4063" } m，已发布值为 { "13.45" } m；EMT { "7.2997" } m，已发布值为 { "7.2998" } m；sigma_v_acc { "1.3694" } m，已发布值为 { "1.3694" } m；全部六个已发布的中间量均在最后一位打印小数的半个单位之内。{ "2016" } 年向量带有两处内部缺陷，报告予以说明而不是掩盖：G 的第 { "3" } 行存在符号笔误，以及 K_fa_3 按 { "57" } 个故障模式计算，而文档声明 N_fault_max = { "1" }（{ "12" } 个模式）；因此其几何中间量完全复现，而其保护级作为实测差异报告，并被排除在验收数字之外；容差从不放宽以容纳它们。每个输出的数值字段都带有单位和来源类别，转录的数字被标注为 <c1/>，因此绝不会被误认为是计算得出的。范围：仅实现了 N_fault_max = { "1" }（单卫星和单星座故障模式），先验要求同时出现多事件故障子集的情形被 REFUSED，而不是被悄悄截断；参考算法中的故障检测、排除、卡方一致性检验和重复计数再分配步骤不在范围之内。这是对已发布参考算法算例的复现：它不是认证、适航工件或批准。

seg-c16de81ec8da = 运行一次 <c1/> 的摘要为：araim-reference-check: { "2" } 个已发布的 WG-C 参考向量；在 { "1" } 个验收向量上，VPL/HPL 最差吻合 { "0.0437" } m，对照参考自身的 TOL_PL = { "0.05" } m

seg-b1be6b5632c1 = 可选字段：<c1/>

seg-3f181d41edb5 = 示例 <c1/> 设置了以下内容等：

seg-9de6e1b3352d = 结果标签（引擎给出的）：已由外部核对：引擎的 ARAIM 保护级，对照欧美 C 工作组 ARAIM 技术子组参考机载算法已发布的数值算例运行，容差（TOL_PL）即这些文档自身所述的容差。每个已发布的数字都附有其来源 UR

seg-693c823c85d1 = 引擎为 scenarios/araim-reference-check.toml（类型 araim-reference-check）生成的图表

seg-3068552e4ab4 = VALIDATED：列出此类型的<a1>验证矩阵</a1>各行。

seg-c5c966ec3c6a = <b>VALIDATED</b> 多假设解分离保护级方程本身：在每个星座有一个时钟状态的东/北/天几何上，做全视场与逐故障模式的加权最小二乘，子解的 sigma，解分离 测试：<a1>araim_reference_vectors.rs</a1>。

seg-a99b9cf4c6e8 = <b>VALIDATED</b> 多假设解分离保护级方程本身：在东/北/天几何上，做全视场与逐故障模式的加权最小二乘。参考基准（ExternalDataset）：欧美 C 工作组 ARAIM 技术子组，《Reference Airborne Algorithm Description Document》v3.1（{ "2019" }年6月{ "20" }日），附录 D 数值算例，已发布的输入（10 颗卫星、2 个星座的几何矩阵，C_int/C_acc 对角线，b_nom、P_sat、P_const，LPV-200 常数）和已发布的输出（VPL { "18.3" } m、HPL { "13.45" } m、EMT { "7.2998" } m、σ_v_acc { "1.3694" } m、K_fa_3 { "5.1083" }，以及六个星座故障中间

seg-f6b7ca020692 = 类别页面：<a1>GNSS 测量、定位与完好性</a1>

seg-f4cf8b629797 = 主题页面：<a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = 主题页面：<a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>上一页</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>下一页</s1>ascent-losses
