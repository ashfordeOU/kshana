# docs--kind-quantum-anomaly-detect: translations (zh-Hans)

seg-29e58493fdd4 = 由模型计算得出

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-7b2721b7588d = 引擎v{ $version }的场景类型，所属系列为<a1>惯性、融合与量子传感器</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为MODELLED（标签如何获得，见README的Evidence一节）。

seg-f7f12029e0ec = 系列页面：<a1>惯性、融合与量子传感器</a1>

seg-496b17a8d3b9 = 主题页面：<a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b>不提供——仅有性能模型；冷原子/时钟硬件由合作方负责。参考基准（oracle，NoneKind）：无：由合作方负责的领域，按设计既没有模块也没有测试

seg-836d5102f0d1 = 来源：<c1/>

seg-ad4ce0110e8d = <c1/>（场景类型）

seg-04310cd6cbec = MODELLED的量子PNT系统故障/异常检测：带标签的故障目录（时钟频率跳变/漂移/失锁；传感器偏置阶跃/掉线）、检测统计量的ROC AUC（附取自经外部核对验证的eval_stats的自助法置信区间），以及固定虚警率下的最小可检测故障，量子时钟辅助的监测器（噪声更低）能检测到更小的故障，作为如实的TradeEvidence加代表性说明。高斯检测统计量模型（AUC = Phi(mu/(sigma*sqrt2))）；对该类别建模，参数为示意性的公开来源数据，无TRL/飞行/认证。

seg-442310afbb13 = <c1/>的一次运行汇总如下：quantum-anomaly-detect | AUC量子{ "0.9908" }对经典{ "0.7603" } | 最小可检测故障 量子{ "1.312" }对经典{ "4.372" } | { "5" }个故障类别 | 权衡 量子胜2/2 | MODELLED

seg-335b8d87e27d = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-c2b10c0bdaf8 = 示例<c1/>设置了以下内容等：

seg-f44afe581836 = { $version }

seg-2f1d14239d1a = 引擎为scenarios/quantum-anomaly-detect.toml（类型quantum-anomaly-detect）绘制的图表

seg-af9aaf95d4f8 = <b>VALIDATED</b>解析的双正态ROC AUC = Φ(μ/(σ√{ "2" }))与最小可检测故障 σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d))，支撑量子故障与异常检测器。参考基准（ExternalDataset）：scipy { "1.17" }（Cephes ndtr/ndtri）+ scikit-learn roc_auc_score（Pedregosa等，JMLR { "2011" }），均为BSD-3-Clause，是计算同样唯一确定的高斯尾部/AUC量的独立库，一致到A&S-erf底限（约{ "7e-8" }）。其上构建的量子对经典优势仍为MODELLED

seg-c37642bb24fe = <b>MODELLED</b>一个可复现的TradeEvidence对象（固定框架：场景+随机种子+引擎；共同的逐性能指标量子对经典取值，带极性正确的收益，可选的{ "95" }%. 参考基准（InternalConsistency）：闭式的收益/胜者恒等式，以及对现有quantum_trade::TradeResult的忠实封装；诚实性与代表性台账（ledger）及验证标签绑定

seg-b854cedc8a51 = <b>MODELLED</b>带标签的量子故障目录（时钟频率跳变/漂移/失锁；传感器偏置阶跃/掉线）、检测统计量的ROC AUC附自助法置信区间，以及一项最. 参考基准（InternalConsistency）：闭式高斯AUC = Phi(mu/(sigma*sqrt2))，与经外部核对验证的eval_stats::bootstrap_auc_ci（对照scikit-learn）及检测解析阈值相互核对

seg-7b465c2bb7cf = MODELLED的量子PNT系统故障/异常检测：带标签的故障目录（时钟频率跳变/漂移/失锁；传感器偏置阶跃/掉线）、检测统计量的ROC AUC（附取自经外部核对验证的eval_stats的自助法置信区间），以及固定虚警率下的最小可检测故障，量子时钟辅助的监测器（噪声更低）能检测到更小的故障，作为如实的TradeEvidence加代表（类型目录（<c1/>））

seg-7f43972b246d = 量子PNT系统的故障/异常检测：带标签的故障目录 + ROC AUC + 最小可检测故障，量子时钟辅助监测器对经典监测器。MODELLED；示意性的公开来源参数；对该类别建模，不作TRL/飞行声明。（场景文件注释，第{ "1" }至{ "3" }行）

seg-eb75c6a4dcec = 量子对经典的权衡证据（通用形式）是MODELLED，而非经独立核对验证：它与自身的闭式/解析恒等式核对，只能发现转录和系数错误，并不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-3f92aec2b92a = 量子PNT系统的故障/异常检测是MODELLED，而非经独立核对验证：它与自身的闭式/解析恒等式核对，只能发现转录和系数错误，并不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-6524a69e4835 = <s1>上一页</s1>pvt

seg-aa689568cf84 = <s1>下一页</s1>quantum-gnss-free-nav
