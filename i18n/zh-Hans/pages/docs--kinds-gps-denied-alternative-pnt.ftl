# docs--kinds-gps-denied-alternative-pnt: translations (zh-Hans)

seg-b03d56f501c3 = 类别

seg-f496b7f4c63a = GPS 拒止下的重力加磁力加地形组合导航器：每个航路点融合三个标量场通道，得到比任何单一场更精确（CRLB 更低）的漂移修正。

seg-498b1aea3770 = 引擎为 scenarios/combined-altpnt.toml（类型 combined-altpnt）生成的图表

seg-c8f93431680a = MODELLED 分层 PNT 冲突韧性（P7）：处于对抗环境中的用户配置若干 PNT 层（开放服务 GNSS、宽带 GNSS、经认证的星座、增强中继），每层有基础可用性、1σ 精度，以及对共同的压制干扰/欺骗干扰威胁的逐向量拒止脆弱性。按强度扫描、带随机种子的蒙特卡罗以概率 clamp(vulnerability·intensity·vector_weight,{ "0,1" }) 拒止每一层，用闭式的逆方差规则 σ_fused=(Σ 1/σ_i²)^(−1/2) 融合幸存的层，并报告全部丧失的概率（所有层均被拒止）、融合误差中位数，以及各层随强度变化的可用/拒止统计。在独立性假设下，标题性的韧性比（单层与分层的全部丧失概率之比）约为 7x；随后的单因子高斯 copula 相关拒止扫描表明，随着拒止相关性上升，这个约 7x 会向 { "1" } 塌缩（相关性使分层失效）。先验敏感性部分通过 mcda 龙卷风图、狄利克雷威胁投入再分配和百分位置信区间，在有来源依据的脆弱性先验范围内给出该标题数字的变化范围。VALIDATED 的核心：蒙特卡罗的全部丧失概率收敛到闭式的独立乘积 Π_i p_deny_i（在固定随机种子和足够大的 N 下，误差在蒙特卡罗标准误之内）；逆方差融合是闭式恒等式；在 ρ={ "0" } 时 copula 退化为独立模型，且每个 ρ 都保持各层的边际拒止率。MODELLED：各层的脆弱性/可用性/精度量值是有来源但由模型设定的输入（JammerTest { "2024" }、TEXBAT、EASA SIB、RTCA DO-229、LunaNet/IOAG，见 conflict_threat_params），具体的约 7x 量值和比值对相关性的曲线形状由该参数化得出。随后的 §{ "4.2" } 逐向量生存分解把共同的 RF 威胁拆分为四个已命名的向量（压制干扰/欺骗干扰/动能/网络），并报告每个向量的可用 PNT 优雅降级曲线 S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" })))：VALIDATED：带随机种子的逐层蒙特卡罗收敛到该闭式；对于相关 RF 基线，压制干扰是最尖锐的向量，而不受 RF 影响的惯性层是决定性的幸存者。不是经认证的导航可用性产品。

seg-4dd2bcc206db = 引擎为 scenarios/conflict-resilience.toml（类型 conflict-resilience）生成的图表

seg-9a58a7b09423 = GPS 拒止环境下的重力图匹配导航：冷原子重力仪从所飞越的重力异常序列中恢复出恒定的 INS 漂移。

seg-c42d90057e9f = 引擎为 scenarios/gravity-map-nav.toml（类型 gravity-map）生成的图表

seg-0d7bf5a4f07e = GPS 拒止环境下的地形参考导航（TERCOM/SITAN）：雷达/气压高度计将地面高程剖面与 SRTM 式 DEM 匹配，以修正 INS 漂移。

seg-c5e33c7122e2 = 引擎为 scenarios/terrain-nav.toml（场景类型 terrain-nav）生成的图表

seg-6bdc150ab25b = GPS 拒止环境下的序贯（递推）地形参考导航：粒子滤波器逐历元运行地形匹配测量模型（SITAN 作为运行中的滤波器），从而沿航迹跟踪随时间变化的 INS 漂移，而批处理的 terrain-nav 只能恢复单一的恒定偏移。

seg-4aca87f022dc = 引擎为 scenarios/terrain-slam.toml（场景类型 terrain-slam）生成的图表

seg-4e31c8daf798 = 台账

seg-efd15cff3d32 = MODELLED（结果标签）

seg-9d9aeff4f2ee = 来源：<c1/>

seg-d9fdaf3208ca = GPS 拒止环境下的替代 PNT（场景类型族）

seg-9fde6af9e09f = { "5" } 个场景类型，来自引擎 v{ $version }。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为 MODELLED（标签如何获得，见 README 的“证据”一节）。

seg-0d3b170b9fbc = 专题页面：<a1>CAPABILITY</a1>、<a2>RESILIENCE-CROSSWALK</a2>。运行一个：<c1/>。所有类型族：<a3>KINDS.md</a3>。

seg-6dfd2dc2721a = 引擎为“GPS 拒止环境下的替代 PNT”类型族的各类型生成的图表缩略总览

seg-cff60d8c17d2 = GPS 拒止环境下的序贯（递推）地形参考导航：粒子滤波器逐历元运行地形匹配测量模型（SITAN 作为运行中的滤波器），以便随时间变化的 INS 漂移被跟

seg-9d8f69b51742 = MODELLED 分层 PNT 冲突韧性（P7）：处于对抗环境中的用户配备多个 PNT 层（开放服务 GNSS、宽带 GNSS、带认证的星座、增强中继），每个带

seg-28486745bb43 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>。可选字段：<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>。

seg-c2187e8291f9 = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>gravity-map</a1>。

seg-b1ff6f0e1769 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>。可选字段：<c13/>、<c14/>、<c15/>。

seg-9bd19903f577 = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>terrain-nav</a1>。

seg-3ec7b38184b7 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>。可选字段：<c11/>、<c12/>、<c13/>、<c14/>、<c15/>。

seg-7c777178ee8f = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>terrain-slam</a1>。

seg-c5124441822e = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>。可选字段：<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>、<c22/>、<c23/>。

seg-d78bd011956c = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>combined-altpnt</a1>。

seg-2d95ddbf01c4 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>。

seg-ab895b157152 = <b>台账：</b>没有矩阵行点名此类型；引擎自行给结果打标签。完整页面（含输入、结果、证据与局限）：<a1>conflict-resilience</a1>。

seg-c0ef7d676ec1 = <s1>上一页</s1>GNSS 测量、定位与完好性

seg-54b45b00a2f0 = <s1>下一页</s1>惯性、融合与量子传感器
