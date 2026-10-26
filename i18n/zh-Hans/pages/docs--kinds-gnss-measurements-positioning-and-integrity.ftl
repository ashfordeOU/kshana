# docs--kinds-gnss-measurements-positioning-and-integrity: translations (zh-Hans)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = 类别

seg-06197409c717 = 已发布的 ARAIM 认证参考向量：引擎的 ARAIM 水平与垂直保护级，对照 WG-C ARAIM 技术子组自己的数值算例运行，容差（TOL_PL = { "5e-2" } m）即这些文档自身所述的容差。有两个向量作为夹具提交，各自附有获取 URL、获取日期、源文件 SHA-256 和页码：《Reference Airborne Algorithm Description Document》v3.1（{ "2019" } 年）附录 D（自洽，也是验收向量），以及《Milestone { "3" } Report》（{ "2016" } 年）附件 A 第 A.IX 节，即研究文献所引用的陈述。每个已发布的输入（10 颗卫星、2 个星座的几何矩阵，C_int 和 C_acc 方差对角线，b_nom、P_sat、P_const 以及 LPV-200 常数集）和每个已发布的输出（VPL、HPL、EMT、sigma_v_acc、K_fa_3，以及两种星座故障模式的 sigma_3、sigma_ss_3 和 b_3）都与引擎自己的数值及二者的绝对差一并报告。保护级方程在此并不重新求解：参考算法的模式列表交给引擎现有的 raim::araim_protection_level / araim_integrity_risk，因此被测的二分法和高斯尾部代数运算是引擎自己的；只有几何、子解、检测门限和已发布的预算划分是为它构建的。已由外部核对，对照 { "2019" } 年向量：VPL { "18.2926" } m，已发布值为 { "18.3" } m；HPL { "13.4063" } m，已发布值为 { "13.45" } m；EMT { "7.2997" } m，已发布值为 { "7.2998" } m；sigma_v_acc { "1.3694" } m，已发布值为 { "1.3694" } m；全部六个已发布的中间量均在最后一位打印小数的半个单位之内。{ "2016" } 年向量带有两处内部缺陷，报告予以说明而不是掩盖：G 的第 { "3" } 行存在符号笔误，以及 K_fa_3 按 { "57" } 个故障模式计算，而文档声明 N_fault_max = { "1" }（{ "12" } 个模式）；因此其几何中间量完全复现，而其保护级作为实测差异报告，并被排除在验收数字之外；容差从不放宽以容纳它们。每个输出的数值字段都带有单位和来源类别，转录的数字被标注为 <c1/>，因此绝不会被误认为是计算得出的。范围：仅实现了 N_fault_max = { "1" }（单卫星和单星座故障模式），先验要求同时出现多事件故障子集的情形被 REFUSED，而不是被悄悄截断；参考算法中的故障检测、排除、卡方一致性检验和重复计数再分配步骤不在范围之内。这是对已发布参考算法算例的复现：它不是认证、适航工件或批准。

seg-693c823c85d1 = 引擎为 scenarios/araim-reference-check.toml（类型 araim-reference-check）生成的图表

seg-2ffccc9c1eff = 测量域伪距仿真（Klobuchar 电离层、Saastamoinen/Niell 对流层）+ RAIM。

seg-47ee40d4eb73 = 引擎为 scenarios/gnss-sim-raim.toml（类型 gnss-sim）生成的图表

seg-eb7e0c2feb2b = 快照/解分离/ARAIM RAIM，含 HPL/VPL 与 Stanford 图。

seg-ce7f6130ddee = 引擎为 scenarios/integrity-raim.toml（类型 integrity）生成的图表
