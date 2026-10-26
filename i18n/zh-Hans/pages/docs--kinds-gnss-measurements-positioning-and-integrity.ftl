# docs--kinds-gnss-measurements-positioning-and-integrity: translations (zh-Hans)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = 类别

seg-06197409c717 = 已发布的 ARAIM 认证参考向量：引擎的 ARAIM 水平与垂直保护级，对照 WG-C ARAIM 技术子组自己的数值算例运行，容差（TOL_PL = { "5e-2" } m）即这些文档自身所述的容差。有两个向量作为夹具提交，各自附有获取 URL、获取日期、源文件 SHA-256 和页码：《Reference Airborne Algorithm Description Document》v3.1（{ "2019" } 年）附录 D（自洽，也是验收向量），以及《Milestone { "3" } Report》（{ "2016" } 年）附件 A 第 A.IX 节，即研究文献所引用的陈述。每个已发布的输入（10 颗卫星、2 个星座的几何矩阵，C_int 和 C_acc 方差对角线，b_nom、P_sat、P_const 以及 LPV-200 常数集）和每个已发布的输出（VPL、HPL、EMT、sigma_v_acc、K_fa_3，以及两种星座故障模式的 sigma_3、sigma_ss_3 和 b_3）都与引擎自己的数值及二者的绝对差一并报告。保护级方程在此并不重新求解：参考算法的模式列表交给引擎现有的 raim::araim_protection_level / araim_integrity_risk，因此被测的二分法和高斯尾部代数运算是引擎自己的；只有几何、子解、检测门限和已发布的预算划分是为它构建的。已由外部核对，对照 { "2019" } 年向量：VPL { "18.2926" } m，已发布值为 { "18.3" } m；HPL { "13.4063" } m，已发布值为 { "13.45" } m；EMT { "7.2997" } m，已发布值为 { "7.2998" } m；sigma_v_acc { "1.3694" } m，已发布值为 { "1.3694" } m；全部六个已发布的中间量均在最后一位打印小数的半个单位之内。{ "2016" } 年向量带有两处内部缺陷，报告予以说明而不是掩盖：G 的第 { "3" } 行存在符号笔误，以及 K_fa_3 按 { "57" } 个故障模式计算，而文档声明 N_fault_max = { "1" }（{ "12" } 个模式）；因此其几何中间量完全复现，而其保护级作为实测差异报告，并被排除在验收数字之外；容差从不放宽以容纳它们。每个输出的数值字段都带有单位和来源类别，转录的数字被标注为 <c1/>，因此绝不会被误认为是计算得出的。范围：仅实现了 N_fault_max = { "1" }（单卫星和单星座故障模式），先验要求同时出现多事件故障子集的情形被 REFUSED，而不是被悄悄截断；参考算法中的故障检测、排除、卡方一致性检验和重复计数再分配步骤不在范围之内。这是对已发布参考算法算例的复现：它不是认证、适航工件或批准。

seg-693c823c85d1 = 引擎为 scenarios/araim-reference-check.toml（类型 araim-reference-check）生成的图表

seg-2ffccc9c1eff = 测量域伪距仿真（Klobuchar 电离层、Saastamoinen/Niell 对流层）+ RAIM。

seg-47ee40d4eb73 = 引擎为 scenarios/gnss-sim-raim.toml（类型 gnss-sim）生成的图表

seg-eb7e0c2feb2b = 快照/解分离/ARAIM RAIM，含 HPL/VPL 与 Stanford 图。

seg-ce7f6130ddee = 引擎为 scenarios/integrity-raim.toml（类型 integrity）生成的图表

seg-4e31c8daf798 = 台账

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-c9cf40c5e609 = 来源：<c1/>

seg-569fac649b5d = GNSS 测量、定位与完好性（场景类型族）

seg-63c3a7483268 = { "6" } 个场景类型，来自引擎 v{ $version }。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为 MODELLED（标签如何获得，见 README 的“证据”一节）。

seg-33a602147cc2 = 专题页面：<a1>INTEGRITY</a1>、<a2>POSITIONING</a2>、<a3>ARAIM_REFERENCE</a3>、<a4>OSNMA</a4>。运行一个：<c1/>。所有类型族：<a5>KINDS.md</a5>。

seg-9c60c8803b6b = 引擎为“GNSS 测量、定位与完好性”类型族的各类型生成的图表缩略总览

seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

seg-6698e12e148b = 真实观测的单点定位：由 RINEX { "3" } 观测文件和广播导航文件（码伪距、广播星历、Klobuchar 电离层、Saastamo

seg-da89c260b1a3 = 已发布的 ARAIM 认证参考向量：将引擎的 ARAIM 水平和垂直保护级，对照 WG-C ARAIM 技术小组自身给出的数值算例运行，在容

seg-7a750a89c9c4 = 空间天气环境模型：太阳（F10.7/F10.7a）和地磁（Kp，附定义性的 Kp↔ap 对照表）活动指数，由其驱动的 Jacchia-1971 外逸层温度（与已发布的

seg-d79d4d58275b = 实时月球坐标系/地球定向预测预算：P4 表 { "1" }（坐标系误差一致性检查——事后处理约 { "0.27" } m ↔ 约 { "0.010" } ms，实时约 { "15" } m ↔ 约 { "0.5" } ms，每个坐标系位置表

seg-dc783268156c = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>。可选字段：<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>。

seg-7b110aacdb27 = <b>台账：</b>MODELLED { "6" } · VALIDATED { "4" }。完整页面（含输入、结果、证据与局限）：<a1>integrity</a1>。

seg-d444fb35cae9 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>。可选字段：<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>。

seg-b651ec58bcba = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>gnss-sim</a1>。

seg-b9a21187317d = 必填字段：<c1/>、<c2/>。可选字段：<c3/>、<c4/>、<c5/>、<c6/>。

seg-143dc4fd1d44 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>pvt</a1>。

seg-9ca1f6783e8e = 必填字段：无。可选字段：<c1/>。

seg-415f1fa78518 = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>araim-reference-check</a1>。

seg-6c4655b35c65 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>。

seg-1e5052c0bce7 = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>space-weather</a1>。

seg-64c512530ee6 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>。

seg-1c244958d3c4 = <b>台账：</b>MODELLED { "1" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>realtime-frame-eop</a1>。

seg-d4adf4283480 = <s1>上一页</s1>星座、覆盖与几何

seg-2cdfd7f8bfb3 = <s1>下一页</s1>GPS 拒止环境下的替代 PNT
