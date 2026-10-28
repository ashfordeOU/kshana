# docs--kind-attitude-budget: translations (zh-Hans)

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-3068552e4ab4 = VALIDATED：列出此类型的<a1>验证矩阵</a1>各行。

seg-40ca4197150b = 来源：<c1/>

seg-a271f371a3cf = <c1/>（场景类型）

seg-62c0dda9fc56 = 3-DOF姿态与指向误差预算：最坏情况下的重力梯度干扰力矩（(3/2)(μ/R³)ΔI），以及在各个已命名的1σ 贡献项（传感器噪声、反作用轮抖动、热、对准）上的方和根指向误差预算及其主导项，输入为轨道高度和本体惯量差。MODELLED的标量AOCS预算，是Basilisk/42的硬件前补充，不是控制回路、6-DoF或柔性模态仿真。

seg-9fdc45a8aaa3 = 运行一次<c1/>的摘要为：attitude-budget: { "600" } km，ΔI { "40" } kg·m² ->重力梯度力矩{ "7.04e-5" } N·m；指向{ "10.7" }" RSS（主导项：reaction_wheel_jitter）（MODELLED标量预算）

seg-7cf112b1bcc3 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>

seg-91ebbc89f9bb = 示例<c1/>设置了以下内容等：

seg-c33e3cbba749 = arcsec

seg-36df1bc710ab = 对准

seg-d45f0ee66587 = kg*m^{ "2" }

seg-3e3ce4fa89aa = N*m

seg-0a78a7d6f93f = 结果标签（引擎给出的）：MODELLED：标量3-DOF AOCS误差预算：重力梯度最坏情况干扰力矩加RSS指向预算；并非控制回路、6-DoF或柔性模态仿真（是Basilisk/42的硬件前补充，而不是替代品）

seg-ad0e72e3b688 = 引擎为scenarios/attitude-budget.toml（类型attitude-budget）生成的图表

seg-95b159fb5e68 = <b>VALIDATED</b>最坏情况下的重力梯度干扰力矩（(3/2)(μ/R³)ΔI），取其随姿态变化的峰值（经验证的声明），外加在各个已命名的1σ 贡献项上的RSS指向误差预算及其主导项（调用方所给数值的方和根 测试：<a1>attitude_gg_torque_reference.rs</a1>。

seg-f7c8d8994896 = <b>VALIDATED</b>最坏情况下的重力梯度干扰力矩（(3/2)(μ/R³)ΔI），取其随姿态变化的峰值（经验证的声明），外加在各个已命名的1σ 上的RSS指向误差预算。参考基准（ExternalDataset）：Basilisk { "2.9.1" } GravityGradientEffector（AVSLab，ISC），对全张量重力梯度力矩的独立C++ 实现：Kshana的峰值 (3/2)(μ/R³)ΔI在{ "45" } deg姿态处与Basilisk的力矩相等，相对误差在{ "1e-12" }以内（最差{ "2.1e-15" }），覆盖{ "5" }个高度和{ "8" }个惯量张量，并且对每种情形的{ "2000" }个随机姿态，都界住Basilisk的力矩；容差在比较之前就已固定。经验证的声明：重力

seg-d2a6cf813e95 = <b>PARTNER</b>未提供：Kshana是导航性能仿真器，不是卫星平台厂商。参考基准（NoneKind）：无：由合作方负责的学科，按设计没有模块也没有测试

seg-3895121a5466 = MODELLED：标量3-DOF AOCS误差预算：重力梯度最坏情况干扰力矩加RSS指向预算；并非控制回路、6-DoF或柔性模态仿真（是Basilisk/42的硬件前补充，而不是替代品）（结果<c1/>）

seg-f62458cae23b = MODELLED的标量AOCS预算，是Basilisk/42的硬件前补充，不是控制回路、6-DoF或柔性模态仿真。（类型目录（<c1/>））

seg-333fca11ac0c = 诚实范围：MODELLED的标量误差预算，是Basilisk/42的硬件前补充，并非控制回路、6-DoF或柔性模态仿真。重力梯度项以力矩形式报告（将其映射为指向需要调用方自有的控制刚度）；该预算是所提供各1σ 贡献项的方和根。运行：kshana scenarios/attitude-budget.toml（场景文件注释，第{ "8" }至{ "13" }行）

seg-0e27fcef1499 = <s1>上一页</s1>ascent-losses

seg-946c453cbf0f = <s1>下一页</s1>body-pnt

seg-a349aa76b0ed = PARTNER
