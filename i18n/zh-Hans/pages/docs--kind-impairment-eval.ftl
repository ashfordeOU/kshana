# docs--kind-impairment-eval: translations (zh-Hans)

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }：列出此类型的<a1>验证矩阵</a1>各行。

seg-2e6b437f3e99 = 来源：<c1/>

seg-134407946837 = <c1/>（场景类型）

seg-304496607bd7 = 引擎 v{ $version } 的场景类型，所属系列为<a1>压制干扰、欺骗干扰与频谱</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为 MODELLED（标签如何获得，见 README 的 Evidence 一节）。

seg-98e740d32860 = 机器学习射频损伤检测评估试验平台（{ "13494" }）：生成带标签的、有参数依据的合成语料（nominal/jamming/spoof-time/spoof-position/multipath），用与检测器无关的测试框架对检测器（energy|agc|sqm|parity|fused）评分，并报告 AUC/ROC/混淆矩阵 + 目标 Pfa 下的各类 Pd，以及分布内与分布外的乐观差距。仅有 MODELLED 工作特性——绝不使用外场/IQ 数据，不给出好/坏结论。

seg-41c3f9559282 = <c1/> 的一次运行汇总为：impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

seg-9b0d7ebaa1f0 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-283510d17885 = 示例 <c1/> 设置了以下内容等：

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out 采用更细微的调谐外区

seg-667d26b3a2fe = 引擎给出的结果标签：MODELLED — 合成的、有参数依据的语料（绝不使用外场/IQ 数据）；仅有工作特性，不给出好/坏结论

seg-7e7b07bc5545 = 引擎为 scenarios/impairment-eval.toml（类型 impairment-eval）生成的图表

seg-798a7e5526a0 = <b>VALIDATED</b> AUC（Mann-Whitney，并列取 ½）、阈值处的混淆矩阵、P_d/P_md/P_fa/精确率/准确率/F1 测试：<a1>eval_metrics_reference.rs</a1>。

seg-ceedc14c623a = <b>VALIDATED</b> 区分真实带标签异常的 ROC AUC + 自助法置信区间；透明检测器（复现标签）测试：<a1>opssat_ad_reference.rs</a1>。

seg-0ee5b31cfd09 = <b>MODELLED</b> 带标签的合成损伤语料 + 与检测器无关的 ROC/AUC/混淆矩阵/Pfa-Pmd 测试框架；泄漏防护、分层划分、分布偏移（分布内与分布外工况）乐观性报告。

seg-392fa6495840 = <b>VALIDATED</b> AUC（Mann-Whitney，并列取 ½）、阈值处的混淆矩阵、P_d/P_md/P_fa/精确率/准确率/F1。参考基准（oracle，ExternalDataset）：scikit-learn { "1.9.0" }（Pedregosa 等，JMLR { "2011" }）——独立的库，完全吻合

seg-c719d4060e1a = <b>MODELLED</b> 带标签的合成损伤语料 + 与检测器无关的 ROC/AUC/混淆矩阵/Pfa-Pmd 测试框架；泄漏防护、分层划分、分布偏移（分布内与分布。参考基准（oracle，InternalConsistency）：闭式 AUC 界（Mann–Whitney）+ 完美参考基准检测器；语料为合成数据（有参数依据，不是外场/IQ 数据）

seg-5565108cc4d1 = MODELLED — 合成的、有参数依据的语料（绝不使用外场/IQ 数据）；仅有工作特性，不给出好/坏结论（结果<c1/>）

seg-d2a9f35ea8cc = 仅有 MODELLED 工作特性——绝不使用外场/IQ 数据，不给出好/坏结论。（类型目录（<c1/>））

seg-376f86fbdcb7 = 如实说明范围：仅有 MODELLED 工作特性。语料是合成的、有参数依据的（由 Kshana 的压制干扰/AGC/SQM/奇偶校验模型组合而成）——绝不是外场采集数据或原始 IQ。该测试框架是裁判；它报告特性，不给出好/坏结论。运行：kshana scenarios/impairment-eval.toml（场景文件注释，第 { "9" } 至 { "12" } 行）

seg-882d67b9474f = 机器学习射频损伤检测评估（{ "13494" }）为 MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-5d23d7f8f872 = 系列页面：<a1>压制干扰、欺骗干扰与频谱</a1>

seg-6cf4bb2d7f7a = 主题页面：<a1>BENCH.md</a1>

seg-dde90de4270b = <s1>上一页</s1>hybrid

seg-1e68310f2dc6 = <s1>下一页</s1>inertial
