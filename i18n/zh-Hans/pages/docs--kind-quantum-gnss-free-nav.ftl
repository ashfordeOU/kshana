# docs--kind-quantum-gnss-free-nav: translations (zh-Hans)

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-7b2721b7588d = 引擎v{ $version }的场景类型，所属系列为<a1>惯性、融合与量子传感器</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为MODELLED（标签如何获得，见README的Evidence一节）。

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b>由第一性原理（k_eff·T²、QPN）得出的冷原子干涉加速度计。参考基准（oracle，ExternalDataset）：已发表的CAI原始论文数值向量（Cheinet { "2008" }传递函数；Peters/Freier灵敏度）：k_eff·T² 完全吻合，散粒噪声ASD为单边下限，与每台已发表仪器相差在约{ "2" }× 以内（实际器件的技术噪声高于量子下限）。这是一个范围界定，而非等同。{ "0.30" }第{ "2" }轮（已预先登记fcb9ac64），一项发现（仍为MODELLED）：仅含QPN的旋转噪声对照Gauguet等的实测值

seg-9955b1b1c018 = 量子惯性传感器性能为MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = 系列页面：<a1>惯性、融合与量子传感器</a1>

seg-496b17a8d3b9 = 主题页面：<a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = 主题页面：<a1>QUANTUM.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b>不提供——仅有性能模型；冷原子/时钟硬件由合作方负责。参考基准（oracle，NoneKind）：无：由合作方负责的领域，按设计既没有模块也没有测试

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b>一个可复现的TradeEvidence对象（固定框架：场景+随机种子+引擎；共同的逐性能指标量子对经典取值，带极性正确的收益，可选的{ "95" }%. 参考基准（InternalConsistency）：闭式的收益/胜者恒等式，以及对现有quantum_trade::TradeResult的忠实封装；诚实性与代表性台账（ledger）及验证标签绑定

seg-eb75c6a4dcec = 量子对经典的权衡证据（通用形式）是MODELLED，而非经独立核对验证：它与自身的闭式/解析恒等式核对，只能发现转录和系数错误，并不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-bfbcc7e8f620 = 来源：<c1/>

seg-cfa59601df4a = <c1/>（场景类型）

seg-790fbfdd80f0 = MODELLED的无GNSS量子导航：在GNSS中断期间，对比量子（冷原子干涉仪）惯性预算与经典导航级INS：滑行期间的位置误差增长、到达位置阈值的守时（holdover）时间，以及作为如实TradeEvidence并附代表性说明的量子对经典权衡。如实的可观测性说明：没有外部定位时，加速度计偏置不可观测，因此误差会增长；量子传感器只是减缓而不会弥合这一差距。示意性的公开来源器件参数；对该类别建模，无TRL/飞行/认证。

seg-dd74f248373d = <c1/>的一次运行汇总如下：quantum-gnss-free-nav | 中断300s | 量子位置误差{ "0.00" } m对经典{ "37.31" } m（8289.5x）| 守时（holdover）量子44721s对经典534s（阈值{ "100" } m）| 权衡 量子胜2/2 | MODELLED

seg-960491d74173 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>

seg-88d9dfe0353a = 示例<c1/>设置了以下内容等：

seg-1bdbf1a737b2 = 引擎为scenarios/quantum-gnss-free-nav.toml（类型quantum-gnss-free-nav）绘制的图表

seg-d196391dcf4f = <b>MODELLED</b>量子（冷原子干涉仪）对经典导航级INS在GNSS中断期间的航位推算：位置误差增长、到达位置阈值的守时（holdover）时间。参考基准（InternalConsistency）：复用的惯性预算与同一航位推算常微分方程的一次独立Octave二重积分相互核对（运行环境不同，模型共享 → ReferenceImpl），另加Freier-2016已发表的短期噪声作为单侧锚点；量子对经典的综合结果仍为MODELLED

seg-af35cccc4e2c = MODELLED的无GNSS量子导航：在GNSS中断期间，对比量子（冷原子干涉仪）惯性预算与经典导航级INS：滑行期间的位置误差增长、到达位置阈值的守时（holdover）时间，以及作为如实TradeEvidence并附代表性说明的量子对经典权衡。（类型目录（<c1/>））

seg-9b9ce7600ffc = 无GNSS量子导航：量子（冷原子干涉仪）对经典导航级INS在GNSS中断期间的航位推算。MODELLED；示意性的公开来源器件参数；对该类别建模，不作TRL/飞行声明。（场景文件注释，第{ "1" }至{ "3" }行）

seg-9d67411151e3 = 无GNSS量子导航是MODELLED，而非经独立核对验证：它与自身的闭式/解析恒等式核对，只能发现转录和系数错误，并不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e1d502e1ed6d = <s1>上一页</s1>quantum-anomaly-detect

seg-1f3705925b3c = <s1>下一页</s1>quantum-time-transfer

seg-a349aa76b0ed = PARTNER
