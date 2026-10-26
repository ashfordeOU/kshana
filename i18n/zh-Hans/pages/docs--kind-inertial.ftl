# docs--kind-inertial: translations (zh-Hans)

seg-51362910dcb7 = 有 { "2" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-b054c73f22e5 = 无值

seg-98151954f217 = false

seg-be831b52a339 = 以及矩阵中另有 { "4" } 项。

seg-7b2721b7588d = 引擎 v{ $version } 的场景类型，所属系列为<a1>惯性、融合与量子传感器</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> 由第一性原理（k_eff·T²、QPN）得出的冷原子干涉加速度计。参考基准（oracle，ExternalDataset）：已发表的 CAI 原始论文数值向量（Cheinet { "2008" } 传递函数；Peters/Freier 灵敏度）：k_eff·T² 完全吻合，散粒噪声 ASD 为单边下限，与每台已发表仪器相差在约 { "2" }× 以内（实际器件的技术噪声高于量子下限）。这是一个范围界定，而非等同。{ "0.30" } 第 { "2" } 轮（已预先登记 fcb9ac64），一项发现（仍为 MODELLED）：仅含 QPN 的旋转噪声对照 Gauguet 等的实测值

seg-7e95210bcc48 = <b>MODELLED</b> 守时期间由偏置 + 标度因数 + VRW + 稳定度衰减复合而成的位置预算。参考基准（oracle，ReferenceImpl）：对双重积分白加速度噪声的独立 numpy 蒙特卡罗 SDE 积分（以真正独立的算法验证解析 VRW 方差）+ 偏置/标度因数项的 Groves { "2013" } 已发表值锚点；CAI 器件数值量化的是合作方硬件，仍为 MODELLED

seg-9955b1b1c018 = 量子惯性传感器性能为 MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-5fef5e8cc64e = 量子惯性航位推算韧性为 MODELLED，未经独立验证：它是对照本代码库内另一套独立实现检查的，该实现独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = 系列页面：<a1>惯性、融合与量子传感器</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = 主题页面：<a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = 主题页面：<a1>QUANTUM.md</a1>

seg-7bebd09c614b = 导航级石英加速度计（Honeywell QA-2000 / G

seg-cead54058894 = 来源：<c1/>

seg-783be547f01e = <c1/>（场景类型）

seg-bdedf28adc48 = GNSS 中断期间的 1-DOF 惯性航位推算。

seg-55b5599ef867 = <c1/> 的一次运行汇总为：scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

seg-b05c3cb45c0d = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-94fd9afe6f30 = 可选字段：<c1/>

seg-bd021b5dff80 = 示例 <c1/> 设置了以下内容等：

seg-8a9e52e38b05 = Exail 混合量子加速度计三轴组：偏置稳定度 6e-

seg-873c402bb724 = 引擎为 scenarios/imu-deadreckoning.toml（类型 inertial）生成的图表

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }：点名该类型的<a1>验证矩阵</a1>行。

seg-41f3a20fadfb = <b>VALIDATED</b> 四元数姿态、WGS-84 NED 捷联惯性机械编排（含圆锥/划船补偿），由 (Δθ, Δv) 增量传播导航状态 测试：<a1>classical_strapdown_ins_reference.rs</a1>。

seg-102d2e51460e = <b>MODELLED</b> 由第一性原理（k_eff·T²、QPN）得出的冷原子干涉加速度计 测试：<a1>quantum_inertial_sensor_reference.rs</a1>。

seg-83fa50d4859a = <b>MODELLED</b> Mach–Zehnder 条纹模糊动态范围：以 2π 为周期的条纹读出确定了最大无模糊比力 a_max=π/(k_eff·T²)，而以分辨单元计的无模糊范围 a_max/σ_a=π/σ_Φ 与光学标度因

seg-89ec2e65cf4f = <b>MODELLED</b> 守时期间由偏置 + 标度因数 + VRW + 稳定度衰减复合而成的位置预算 测试：<a1>quantum_inertial_dead_reckoning_reference.rs</a1>。

seg-bb07c8ee153f = <b>PARTNER</b> 不提供——仅有性能模型；冷原子/时钟硬件由合作方负责。参考基准（oracle，NoneKind）：无：由合作方负责的领域，按设计既没有模块也没有测试

seg-fab4c926e628 = <s1>上一页</s1>impairment-eval

seg-aa783749183d = <s1>下一页</s1>ins-trn-coast
