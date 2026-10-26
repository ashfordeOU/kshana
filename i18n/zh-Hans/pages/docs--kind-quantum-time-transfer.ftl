# docs--kind-quantum-time-transfer: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-c61e88721556 = 引擎 v{ $version } 的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-a3697ad561db = Hz

seg-496b17a8d3b9 = 主题页面：<a1>QUANTUM-MODELS.md</a1>

seg-a1810bbca337 = <b>MODELLED</b> 双向/TWSTFT（Sagnac）、GNSS 共视、PPP；链路抖动→距离。参考基准（oracle，ExternalDataset）：Sagnac 量级对照权威的已发表值核对——N. Ashby，“Relativity in the GPS”，Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }），Eq. { "1.29" }：向东环绕赤道一周累积 { "207.4" } ns（2ωA_E/c²）；kshana 复现为 { "207.386" } ns。RTKLIB { "2.4.3" } 的 geodist()（Takasu，BSD-2-Clause）独立地予以佐证，它带有相同的 2Aω/c² 几何。复合的 BIPM TWSTFT 转发器/共视/

seg-a8beb8dfc757 = 时间传递误差预算为 MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-bb07c8ee153f = <b>PARTNER</b> 不提供——仅有性能模型；冷原子/时钟硬件由合作方负责。参考基准（oracle，NoneKind）：无：由合作方负责的领域，按设计既没有模块也没有测试

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b>一个可复现的TradeEvidence对象（固定框架：场景+随机种子+引擎；共同的逐性能指标量子对经典取值，带极性正确的收益，可选的{ "95" }%. 参考基准（InternalConsistency）：闭式的收益/胜者恒等式，以及对现有quantum_trade::TradeResult的忠实封装；诚实性与代表性台账（ledger）及验证标签绑定

seg-eb75c6a4dcec = 量子对经典的权衡证据（通用形式）是MODELLED，而非经独立核对验证：它与自身的闭式/解析恒等式核对，只能发现转录和系数错误，并不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-eee91dc5741d = 来源：<c1/>

seg-05060df7f0b7 = <c1/>（场景类型）

seg-540545e6f846 = MODELLED的可信量子授时链：端到端的量子（光晶格钟 + 纠缠/单光子链路）对经典（CSAC + 射频双向）时间传递预算、复用的授时保护级、延迟/重放攻击的安全性能指标（1-P_md）、时钟异常检测概率与CUSUM延迟，以及作为如实TradeEvidence并附代表性说明与距飞行差距记录的量子对经典权衡。示意性的公开来源器件/链路参数；对该类别建模，不声称有TRL/飞行/认证。

seg-ed79bfe80fe7 = <c1/>的一次运行汇总如下：quantum-time-transfer | 量子链1.233e-12s对经典5.292e-9s | PL { "555.24" } ns | 安全性Pd { "1.000" }（Pfa { "1e-3" }）| 异常Pd { "0.761" } | 权衡 量子胜2/2 | MODELLED

seg-80e94491c3df = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-6b03fa15a60d = 示例<c1/>设置了以下内容等：

seg-09760f892c7b = 引擎为scenarios/quantum-time-transfer.toml（类型quantum-time-transfer）绘制的图表

seg-873de4d05663 = <b>VALIDATED</b>表格式CUSUM检测器的最坏情形检测延迟（⌊h/(z−k)⌋+{ "1" }）与失控平均运行长度，用于授时保护级和欺骗监测器。参考基准（ExternalDataset）：已发表的表格式CUSUM ARL：Siegmund（{ "1985" }）布朗运动近似（Hawkins与Olwell { "1998" }，式{ "3.7" }），并与Montgomery《Introduction to Statistical Quality Control》（Wiley）中k=½、h∈{ "{" }{ "4,5" }{ "}" }的ARL表交叉锚定；确定性延迟与首次通过参考基准完全一致。组合的TPL界仍为MODELLED

seg-b51e62b8dc63 = MODELLED的可信量子授时链：端到端的量子（光晶格钟 + 纠缠/单光子链路）对经典（CSAC + 射频双向）时间传递预算、复用的授时保护级、延迟/重放攻击的安全性能指标（1-P_md）、时钟异常检测概率与CUSUM延迟，以及作为如实TradeEvidence并附代表性说明与距飞行差距记录的量子对经典权衡。（类型目录（<c1/>））

seg-dee0faf63e7f = 可信量子授时：端到端时间传递链、安全分发、异常检测，以及量子对经典的权衡。MODELLED；示意性的公开来源器件/链路参数；对该类别建模，不作TRL/飞行声明。（场景文件注释，第{ "1" }至{ "3" }行）

seg-6e9f5dfca6b0 = 可信量子授时（时间传递 + 安全分发 + 异常）是MODELLED，而非经独立核对验证：它与自身的闭式/解析恒等式核对，只能发现转录和系数错误，并不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-d3665be74ff1 = <s1>上一页</s1>quantum-gnss-free-nav

seg-0d4b1f97541f = <s1>下一页</s1>quantum-trade
