# docs--kinds-gps-denied-alternative-pnt: translations (zh-Hans)

seg-b03d56f501c3 = 类别

seg-f496b7f4c63a = GPS 拒止下的重力加磁力加地形组合导航器：每个航路点融合三个标量场通道，得到比任何单一场更精确（CRLB 更低）的漂移修正。

seg-498b1aea3770 = 引擎为 scenarios/combined-altpnt.toml（类型 combined-altpnt）生成的图表

seg-c8f93431680a = MODELLED 分层 PNT 冲突韧性（P7）：处于对抗环境中的用户配置若干 PNT 层（开放服务 GNSS、宽带 GNSS、经认证的星座、增强中继），每层有基础可用性、1σ 精度，以及对共同的压制干扰/欺骗干扰威胁的逐向量拒止脆弱性。按强度扫描、带随机种子的蒙特卡罗以概率 clamp(vulnerability·intensity·vector_weight,{ "0,1" }) 拒止每一层，用闭式的逆方差规则 σ_fused=(Σ 1/σ_i²)^(−1/2) 融合幸存的层，并报告全部丧失的概率（所有层均被拒止）、融合误差中位数，以及各层随强度变化的可用/拒止统计。在独立性假设下，标题性的韧性比（单层与分层的全部丧失概率之比）约为 7x；随后的单因子高斯 copula 相关拒止扫描表明，随着拒止相关性上升，这个约 7x 会向 { "1" } 塌缩（相关性使分层失效）。先验敏感性部分通过 mcda 龙卷风图、狄利克雷威胁投入再分配和百分位置信区间，在有来源依据的脆弱性先验范围内给出该标题数字的变化范围。VALIDATED 的核心：蒙特卡罗的全部丧失概率收敛到闭式的独立乘积 Π_i p_deny_i（在固定随机种子和足够大的 N 下，误差在蒙特卡罗标准误之内）；逆方差融合是闭式恒等式；在 ρ={ "0" } 时 copula 退化为独立模型，且每个 ρ 都保持各层的边际拒止率。MODELLED：各层的脆弱性/可用性/精度量值是有来源但由模型设定的输入（JammerTest { "2024" }、TEXBAT、EASA SIB、RTCA DO-229、LunaNet/IOAG，见 conflict_threat_params），具体的约 7x 量值和比值对相关性的曲线形状由该参数化得出。随后的 §{ "4.2" } 逐向量生存分解把共同的 RF 威胁拆分为四个已命名的向量（压制干扰/欺骗干扰/动能/网络），并报告每个向量的可用 PNT 优雅降级曲线 S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" })))：VALIDATED：带随机种子的逐层蒙特卡罗收敛到该闭式；对于相关 RF 基线，压制干扰是最尖锐的向量，而不受 RF 影响的惯性层是决定性的幸存者。不是经认证的导航可用性产品。

seg-4dd2bcc206db = 引擎为 scenarios/conflict-resilience.toml（类型 conflict-resilience）生成的图表

seg-9a58a7b09423 = GPS 拒止环境下的重力图匹配导航：冷原子重力仪从所飞越的重力异常序列中恢复出恒定的 INS 漂移。

seg-c42d90057e9f = 引擎为 scenarios/gravity-map-nav.toml（类型 gravity-map）生成的图表
