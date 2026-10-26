# docs--kind-conflict-resilience: translations (zh-Hans)

seg-c4ed27a559df = 主题页面：<a1>RESILIENCE-CROSSWALK.md</a1>

seg-216efc4e6fba = 引擎 v{ $version } 的场景类型，所属类别为<a1>GPS 拒止下的替代 PNT</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-98133e74f88a = 类别页面：<a1>GPS 拒止下的替代 PNT</a1>

seg-34f14aa2ee0b = 来源：<c1/>

seg-a80556cfe1a9 = <c1/>（场景类型）

seg-c8f93431680a = MODELLED 分层 PNT 冲突韧性（P7）：处于对抗环境中的用户配置若干 PNT 层（开放服务 GNSS、宽带 GNSS、经认证的星座、增强中继），每层有基础可用性、1σ 精度，以及对共同的压制干扰/欺骗干扰威胁的逐向量拒止脆弱性。按强度扫描、带随机种子的蒙特卡罗以概率 clamp(vulnerability·intensity·vector_weight,{ "0,1" }) 拒止每一层，用闭式的逆方差规则 σ_fused=(Σ 1/σ_i²)^(−1/2) 融合幸存的层，并报告全部丧失的概率（所有层均被拒止）、融合误差中位数，以及各层随强度变化的可用/拒止统计。在独立性假设下，标题性的韧性比（单层与分层的全部丧失概率之比）约为 7x；随后的单因子高斯 copula 相关拒止扫描表明，随着拒止相关性上升，这个约 7x 会向 { "1" } 塌缩（相关性使分层失效）。先验敏感性部分通过 mcda 龙卷风图、狄利克雷威胁投入再分配和百分位置信区间，在有来源依据的脆弱性先验范围内给出该标题数字的变化范围。VALIDATED 的核心：蒙特卡罗的全部丧失概率收敛到闭式的独立乘积 Π_i p_deny_i（在固定随机种子和足够大的 N 下，误差在蒙特卡罗标准误之内）；逆方差融合是闭式恒等式；在 ρ={ "0" } 时 copula 退化为独立模型，且每个 ρ 都保持各层的边际拒止率。MODELLED：各层的脆弱性/可用性/精度量值是有来源但由模型设定的输入（JammerTest { "2024" }、TEXBAT、EASA SIB、RTCA DO-229、LunaNet/IOAG，见 conflict_threat_params），具体的约 7x 量值和比值对相关性的曲线形状由该参数化得出。随后的 §{ "4.2" } 逐向量生存分解把共同的 RF 威胁拆分为四个已命名的向量（压制干扰/欺骗干扰/动能/网络），并报告每个向量的可用 PNT 优雅降级曲线 S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" })))：VALIDATED：带随机种子的逐层蒙特卡罗收敛到该闭式；对于相关 RF 基线，压制干扰是最尖锐的向量，而不受 RF 影响的惯性层是决定性的幸存者。不是经认证的导航可用性产品。

seg-dd10a00edc2f = 运行一次 <c1/> 的摘要为：conflict-resilience | { "4" } 层（{ "0" } 个基线）| 参考强度 { "1.00" } | 韧性比 闭式 6.73x，蒙特卡罗 6.19x（分层与单层之比）| 相关性使分层失效：比值在 rho { "0.00" } 时为 7.50x，在 rho { "0.95" } 时为 1.21x | 先验置信区间 [5.51-8.48]x | 逐向量生存率，参考 压制干扰 { "26" }% 欺骗干扰 { "80" }% 动能 { "100" }% 网络 { "99" }%（压制干扰最尖锐）| 约 7x 的标题数字为 MODELLED，蒙特卡罗到闭式、融合恒等式、copula 边际分布、逐向量生存率为 VALIDATED

seg-674bafccbaf7 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-71fcff68edaf = 示例 <c1/> 设置了以下内容等：

seg-4e3b5bb5a5e7 = GNSS L1 C/A（开放服务）

seg-bd3832c8215d = 结果标签（引擎给出的）：MODELLED 分层 PNT 冲突韧性（P7）。VALIDATED 的核心：蒙特卡罗的全部丧失概率收敛到闭式的独立乘积 Pi_i p_deny_i（在固定随机种子和足够大的 N 下，断言其在蒙特卡罗标准误之内）；逆方差位置融合 sigma_fused = (sum_i 1/sig

seg-4dd2bcc206db = 引擎为 scenarios/conflict-resilience.toml（类型 conflict-resilience）生成的图表

seg-c0e69524f05d = <b>MODELLED</b> 基于 Kshana 自己的七个韧性类别（不是 DHS 术语）、RethinkPNT RDRR 功能和 Yang 判据的逐维度子得分，每项都标记为由模型计算得出，并带有 i。参考基准（InternalConsistency）：手工推导的逐指标公式：逆辛普森多样性、加权平均综合值、有界/无界时间线时长、最弱环节等级阶梯

seg-2ca37a78e899 = MODELLED 分层 PNT 冲突韧性（P7）。VALIDATED 的核心：蒙特卡罗的全部丧失概率收敛到闭式的独立乘积 Pi_i p_deny_i（在固定随机种子和足够大的 N 下，断言其在蒙特卡罗标准误之内）；逆方差位置融合 sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) 是闭式恒等式；在相关系数 rho={ "0" } 时，高斯 copula 恰好退化为独立模（结果 <c1/>）

seg-d0d834e377ee = MODELLED 分层 PNT 冲突韧性（P7）：处于对抗环境中的用户配置若干 PNT 层（开放服务 GNSS、宽带 GNSS、经认证的星座、增强中继），每层有基础可用性、1σ 精度，以及对共同的压制干扰/欺骗干扰威胁的逐向量拒止脆弱性。（类型目录（<c1/>））

seg-3ca12700b54c = 在独立性假设下，标题性的韧性比（单层与分层的全部丧失概率之比）约为 7x；随后的单因子高斯 copula 相关拒止扫描表明，随着拒止相关性上升，这个约 7x 会向 { "1" } 塌缩（相关性使分层失效）。（类型目录（<c1/>））

seg-70e4fdff099f = MODELLED：各层的脆弱性/可用性/精度量值是有来源但由模型设定的输入（JammerTest { "2024" }、TEXBAT、EASA SIB、RTCA DO-229、LunaNet/IOAG，见 conflict_threat_params），具体的约 7x 量值和比值对相关性的曲线形状由该参数化得出。（类型目录（<c1/>））

seg-33541cca61b6 = 处于对抗环境中的用户配置四个 RF PNT 层，它们都使用同一频段，因此共用压制干扰/欺骗干扰这一拒止向量：这是脆弱且相关的情形。该场景报告：* 全部丧失概率随威胁强度的变化（蒙特卡罗对照其收敛到的闭式独立乘积），* 在独立性假设下，分层与单层的韧性比约为 7x，* 这个约 7x 如何塌缩到（场景文件注释，第 { "3" } 至 { "15" } 行）

seg-83badfe4784d = 每个逐层量值都是带有出处的 MODELLED 输入；有来源的 [min, nominal, max] 先验和逐向量敏感度配置见 src/conflict_threat_params.rs（JammerTest { "2024" }、TEXBAT、EASA SIB 2022-02、RTCA DO-229、LunaNet/IOAG）。省略 <c1/> 会运行同样的有来源的四层基线；为透明起见，此处把它完整写出，包括每一层的 vector_profile。（场景文件注释，第 { "17" } 至 { "22" } 行）

seg-bb182ed41520 = 与 PNT 韧性框架对齐的评分为 MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-6a42653a8a0f = <s1>上一页</s1>combined-altpnt

seg-2bd3e9d1505c = <s1>下一页</s1>constellation-design
