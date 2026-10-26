# docs--araim-reference: translations (zh-Hans)

seg-c316596d7ec8 = 来源：<c1/>

seg-4768b19aaed7 = ARAIM参考：Kshana中的先进RAIM保护级

seg-93c83a737a43 = 本说明记录Kshana对<b>先进接收机自主完好性监测（ARAIM）</b>的开放实现：算法、每一项假设、其所使用的完好性支持消息，以及验证状态。实现位于<a1><c1/></a1>；本文档是与代码对读的文字配套材料，审计人员（或采购评审人员）可对照代码阅读。

seg-f5a7abecc2df = ARAIM是经典RAIM的双星座、多频后继者，由GPS（全球定位系统）与Galileo联合工作组C（WG-C）定义，用以支持低至LPV-200的水平和垂直引导（LPV：带垂直引导的航向台性能）。它对每个历元回答一个问题：

seg-252dac107a2a = 位置误差界限（即<em>保护级</em>）必须多大，才能使<em>危险性误导信息</em>（即误差大于界限、而界限仍在告警限值之内）的剩余概率保持在完好性风险预算<c1/>之下？

seg-04299e9742b7 = { "1" }. 完好性支持消息（ISM）

seg-717bea7d6bc8 = ISM是用户所应用的、每个星座各一套的参数集。它由<a1><c1/></a1>明确建模：

seg-fffbeccd4266 = 符号

seg-2247a2344710 = 含义

seg-d7e49778bed2 = σ_URE / SISE（空间信号误差）

seg-b1b5bca63e21 = 用于<b>精度和连续性</b>的测距误差均方根（RMS）

seg-8ff2973d7f5b = σ_URA / SISA（空间信号精度）

seg-f993962a5c9b = 用于<b>完好性</b>的测距误差界限（≥ σ_URE）

seg-727c7fbe1b01 = 以单侧方式并入完好性界限的最大标称测距偏差（<c1/>）；见 §{ "3" }

seg-a79e42c29c46 = 单颗卫星发生未检出故障的先验概率

seg-78c45312d2ff = 整个星座发生故障的先验概率

seg-19cc5ff2e541 = <c1/>返回已公布的WG-C参考值：<b>σ_URA = { "0.75" } m</b>、<b>σ_URE = { "0.67" } m</b>、<b>b_nom = { "0.75" } m</b>、<b>P_sat = { "1" }×{ "10" }⁻⁵</b>、<b>P_const = { "1" }×{ "10" }⁻⁴</b>，对应暴露区间。这些值在参考文献中用于确定ARAIM可用性的规模；运行中的ISM由广播或地面编制，可按星座配置。σ_URA（完好性）与 σ_URE（精度）的区分是有意为之，并且是ISM概念的决定性特征。

seg-0c1687628e67 = <c1/>和<c2/>把这些参数直接交给两个引擎。

seg-8c516e53f595 = { "2" }. 故障假设

seg-b6353366ebf0 = ARAIM是一种<em>多假设解分离</em>（MHSS）方法。对每个故障假设<c1/>，它形成全视场解和排除了故障集的子解，并在该假设下界定位置误差：

seg-3b340e082b84 = <c1/>（先验<c2/>）：完整的全视场最小二乘定位。

seg-03332e433edc = 单星故障

seg-add4792e4e40 = <c1/>（每个先验<c2/>）：每一个排除一颗卫星的子解。这是经典的单故障ARAIM基线，见<a1><c3/></a1>。

seg-7e20f419e670 = 星座级故障

seg-920bd35833ff = <c1/>（每个先验<c2/>）：一次性去除某一星座<em>全部</em>卫星的子解，即在<a1><c3/></a1>中实现的欧盟（EU）ARAIM技术说明（TN）/ DO-316扩展。当<c4/>时，它<b>逐位</b>退化为<c5/>。

seg-323dd205d238 = { "3" }. 保护级

seg-9ab2676d2554 = 对每个坐标轴（垂直、水平）和每个假设，引擎构建一个模式<c1/>，其中阈值是在虚警乘数<c2/>（把连续性预算在<c3/>个假设上作Bonferroni分配）下的解分离检测限。保护级是最小的界限<c4/>，其累计的完好性风险

seg-05c0d8fc855c = 实现说明。

seg-248092fe9b94 = <c1/>是向坐标轴投影的单侧标称偏差，即各卫星增益幅值的最坏情况之和（<a1><c2/>/<c3/></a1>），取自ISM的<c4/>。WG-C参考ISM使用<c5/>；当<c6/>时，界限退化为零标称偏差的MHSS形式。可运行的<c7/>场景提供<c8/>（用于保护级的完好性界限，被限制为 ≥ <c9/>，默认取该值）和<c10/>（默认为{ "0" }），因此保护级始终按完好性界限 σ_URA确定，绝不按较小的精度 σ_URE。这仍然是一个<b>经模型计算、未经认证</b>的ARAIM实现，见<a2><c11/></a2>。

seg-f6bccff61ff5 = 满足所分配的预算（[<c1/>] / <a1><c2/></a1>）。VPL（垂直保护级）和HPL（水平保护级）分别是垂直和水平方向的答案。结果还报告实际达到的完好性风险（<c3/>分配值），以及是否有子解的分离超出其阈值。

seg-b1a868221848 = 这是明确的ARAIM约定，即“界限必须多大？”，而不是固定乘数的经典RAIM那种隐含的、依赖几何的风险。

seg-c90cf313dea8 = { "4" }. 斯坦福图

seg-b51e44c3deda = <a1><c1/></a1>逐历元针对固定的告警限值（AL）累计<c2/>，<a2><c3/></a2>把每个历元归入<em>可用</em>、<em>系统不可用</em>（PL > AL，保守）、<em>误导信息</em>（PL < 误差 ≤ AL）或<em>危险性误导信息</em>（误差 > AL且 > PL）。<a3><c4/></a3>把经典散点图渲染为自包含的SVG（可缩放矢量图形），其中有<c5/>完好性边界、告警限值参考线，以及每个历元一个按颜色编码的标记。

seg-c902173f6acf = { "5" }. 双星座的好处

seg-96e114a6981c = <c1/>展示了两种效应：

seg-06c7d8d62b44 = <b>几何 / 冗余</b>：汇集第二个星座的卫星可收紧单故障HPL：测量更多，单SV（SV：空间飞行器，即卫星）子解集更大，所得界限严格更小。

seg-f788c9e07547 = <b>星座故障容限</b>：在<c1/>生效时，当整个星座都可能失效（<em>另一个</em>星座的卫星仍然存活）时，双星座用户仍然可用；而单星座用户可以证明无法抵御其自身星座的故障（<c2/>返回<c3/>）。

seg-f52a937bad94 = 有一点微妙之处值得如实说明：由于星座故障假设要求在失去<em>整个</em>星座后仍能存活，双星座的<em>快照</em>保护级的下限由剩余的单星座几何决定，它并不会在每个时刻都自动小于仅用GPS的PL。欧盟ARAIM技术说明中GPS+Galileo使<b>HPL缩小{ "15" }–{ "25" } %</b>这一主要结论，是在现实星座和用户位置上累积得到的<b>可用性</b>结果，不是对每个快照的保证。

seg-b4289b877902 = { "6" }. 验证状态

seg-e553de2eee63 = <b>仓库内、自动化：</b>MHSS代数（<c1/> ⇒ 逐位等同于单故障；星座故障使PL变宽；预算从不超出）、上述几何与星座故障的好处，以及在<b>真实的IGS（国际GNSS服务；GNSS = 全球导航卫星系统）精密轨道（SP3，标准产品{ "3" }）几何</b>（<c2/>）上的演练，而不仅仅是合成星座。

seg-633bf11af170 = <b>外部参考基准（oracle）：已公布的WG-C算例：</b>保护级对照ARAIM技术小组自己的数值算例进行核对，见<a1><c1/></a1>、<c2/>以及已提交的固定数据<c3/>（每个向量都带有其获取URL（网址）、获取日期、源文件SHA-256（SHA：安全哈希算法）和页码）。验收容差是该参考自己的<c4/>。对照《参考机载算法描述文档》v3.1（{ "2019" }）附录D：<b>VPL { "18.2926" } m，已公布为{ "18.3" } m（Δ { "0.0074" } m）</b>，<b>HPL { "13.4063" } m，已公布为{ "13.45" } m（Δ { "0.0437" } m）</b>，EMT（有效监测阈值）{ "7.2997" } m对{ "7.2998" } m，σ_v,acc { "1.3694" } m对{ "1.3694" } m，并且已公布的全部六个星座故障中间量（σ₃⁽ᵏ⁾、σ_ss,{ "3" }⁽ᵏ⁾、b₃⁽ᵏ⁾）都在其最后一位打印小数的半个单位之内。{ "2016" }年《里程碑{ "3" }报告》陈述了同一个算例，但带有两处内部缺陷：<c5/>第{ "3" }行中的一个符号笔误，以及按{ "57" }个故障模式计算的<c6/>，而文档陈述的是<c7/>（{ "12" }个模式）。因此其几何中间量能精确复现，而其保护级则记为实测差异（VPL Δ { "0.0171" } m、HPL Δ { "0.0842" } m、EMT Δ { "0.4806" } m），并不计入验收数字。该检查可通过<c8/>场景类型使用。

seg-6d79f9836abd = <b>如实说明的剩余项（外部 / 待评审）：</b>对照<b>锁定版本的真实Celestrak TLE（两行根数）快照</b>得到的{ "15" }–{ "25" } % 可用性数字，以及把ARAIM测试固定数据存入可引用的<b>Zenodo</b>记录。上述参考检查仅涵盖<c1/>（单卫星和单星座故障模式）；同时发生多事件的故障子集、故障排除、χ² 一致性检查，以及参考算法的重复计数再分配步骤均未实现，若某个案例的先验需要这些，则予以拒绝，而不是截断处理。

seg-b57b889dc536 = <b>场景文件的可达范围：</b>当<c1/>场景类型的TOML（Tom的极简标记语言）文件设置<c3/>（可选<c4/>）时，它在每个历元运行<c2/>；内置的<a1><c5/></a1>在汇集的GPS + Galileo几何上这样做，而<c6/>则对传播到同一公共历元的真实Celestrak GPS和Galileo TLE运行同一引擎。没有该标志时，运行器使用经典的解分离RAIM。

seg-6cb7a787ac67 = 参考文献

seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "2016" }年2月{ "25" }日 — 附录A（参考用户算法）和 §A.IX（数值算例）。<a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "2019" }年6月{ "20" }日 — 附录D（LPV-200数值算例）。<a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

seg-8758a6e4f6eb = EU–US（美国）Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>。

seg-c4d2879b2ec4 = RTCA（原无线电技术委员会Radio Technical Commission for Aeronautics）DO-316 / DO-229 MOPS（最低运行性能标准）；DO-316 ARAIM MASPS（最低航空系统性能标准）资料。

seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE（电气与电子工程师学会）TAES（航空航天与电子系统汇刊）/ ION（导航学会）ITM（国际技术会议）。

seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em>（斯坦福图方法）。

seg-d4f50d307775 = <s1>上一页</s1>频谱与瀑布图

seg-f05ca316fe8e = <s1>下一页</s1>DO-316 / DO-229E对照图
