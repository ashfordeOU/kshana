# docs--kind-sweep-nd: translations (zh-Hans)

seg-fa3ad6babe54 = <b>MODELLED</b> <c1/> 类型的扫描（在任意类型的一至三个点分隔的键上，使用通用扫描的坐标轴取值，可选地在每个节点上做一个集合）以及 monte_carlo 部。参考基准（InternalConsistency）：白频率噪声下相位随机游走的闭式，方差 q_wf tau（NIST Technical Note { "1337" }），用于统计机制；以及与独立运行逐字节相等，用于随机种子设定。它检查的是引擎自身时钟模型上的集合运算，而不是外部数据集

seg-d1c11e493795 = 对任意场景类型的参数扫描和带随机种子的蒙特卡罗集合为 MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-c61e88721556 = 引擎 v{ $version } 的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-ee7dd15019d0 = 主题页面：<a1>CAMPAIGNS.md</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> 由第一性原理（k_eff·T²、QPN）得出的冷原子干涉加速度计。参考基准（oracle，ExternalDataset）：已发表的 CAI 原始论文数值向量（Cheinet { "2008" } 传递函数；Peters/Freier 灵敏度）：k_eff·T² 完全吻合，散粒噪声 ASD 为单边下限，与每台已发表仪器相差在约 { "2" }× 以内（实际器件的技术噪声高于量子下限）。这是一个范围界定，而非等同。{ "0.30" } 第 { "2" } 轮（已预先登记 fcb9ac64），一项发现（仍为 MODELLED）：仅含 QPN 的旋转噪声对照 Gauguet 等的实测值

seg-7e95210bcc48 = <b>MODELLED</b> 守时期间由偏置 + 标度因数 + VRW + 稳定度衰减复合而成的位置预算。参考基准（oracle，ReferenceImpl）：对双重积分白加速度噪声的独立 numpy 蒙特卡罗 SDE 积分（以真正独立的算法验证解析 VRW 方差）+ 偏置/标度因数项的 Groves { "2013" } 已发表值锚点；CAI 器件数值量化的是合作方硬件，仍为 MODELLED

seg-9955b1b1c018 = 量子惯性传感器性能为 MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-5fef5e8cc64e = 量子惯性航位推算韧性为 MODELLED，未经独立验证：它是对照本代码库内另一套独立实现检查的，该实现独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-5a70fcb097dc = 可选字段：无

seg-bb07c8ee153f = <b>PARTNER</b> 不提供——仅有性能模型；冷原子/时钟硬件由合作方负责。参考基准（oracle，NoneKind）：无：由合作方负责的领域，按设计既没有模块也没有测试

seg-8b701f465117 = 对数
