# docs--kind-lunar-frame-realisation: translations (zh-Hans)

seg-98151954f217 = false

seg-1f17ef6a853e = 引擎 v{ $version } 的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-49f323360dc3 = <b>VALIDATED</b> 来自一个点网络的 7 参数 Helmert 基准拟合 + ICRF 定向联系。参考基准（oracle，ExternalDataset）：独立的闭式加权 Umeyama（Horn）相似变换求解器（基于 numpy/scipy 的 SVD；Umeyama { "1991" } IEEE TPAMI，Horn { "1987" } JOSA A）——与 kshana 的迭代 Gauss–Newton 拟合是不同的算法，在逐字节相同的点网络上得到同一个唯一确定的加权最小二乘最优解

seg-0225ace73ba8 = 来源：<c1/>

seg-a092c5795651 = <c1/>（场景类型）

seg-0c4c119abfca = 由模型计算的月球参考框架实现：7 参数 Helmert（相似）基准拟合——{ "3" } 个平移、{ "3" } 个小角度旋转、{ "1" } 个尺度——通过加权最小二乘（crate::batch_ls::gauss_newton）把一组估计的、由月面坐标导出的 MCMF 点坐标联系到某个基准上，另加一个简单的定向联系，表示所实现的、绕 ICRF 各轴的小旋转相对于 IAU { "2015" } WGCCRE 天体定向的关系。该场景向一个分布良好的合成点网络注入一个已知的小变换（平移约数十 m，旋转约 µrad，尺度约 { "1e-7" }），加入带种子的高斯噪声，恢复基准，并报告恢复出的变换、各参数相对注入真值的恢复误差，以及拟合后的 RMS 残差。MODELLED 的自洽性——恢复注入的相似变换（无噪声时精确到约机器精度），并非（NOT）对照真实跟踪/VLBI 数据的实现；结果确定（带种子）；没有 TRL、飞行传承或机构背书。

seg-32d5e2749e64 = <c1/> 的一次运行概括如下：lunar-frame-realisation | { "8" } 个点 | 平移误差 { "3.125e-1" } m，旋转误差 { "3.418e-7" } rad，尺度误差 -5.891e2 ppb | RMS 残差 { "0.887" } m | 已收敛 false

seg-e732d2c2ab91 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>

seg-29f85024974b = 示例 <c1/> 设置了下列内容等：

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-f3a6d69d0225 = 引擎为 scenarios/lunar-frame-realisation.toml（类型 lunar-frame-realisation）生成的图表

seg-f99a78efa965 = MODELLED 的自洽性——恢复注入的相似变换（无噪声时精确到约机器精度），并非（NOT）对照真实跟踪/VLBI 数据的实现；结果确定（带种子）；没有 TRL、飞行传承或机构背书。（类型目录（<c1/>））

seg-238cea087ae0 = 诚实说明：MODELLED 的自洽性。参考基准（oracle）是对注入的 7 参数相似变换的恢复（无噪声时精确到约机器精度），外加 apply_helmert 的代数往返恒等式。这并非（NOT）对照真实跟踪 / VLBI 数据对月球参考框架的实现，也不声称有任何绝对框架精度。结果确定（带种子）。不声称有 TRL、飞行传承或机构背书。（场景文件注释，第 { "23" } 至 { "27" } 行）

seg-07550d3d9610 = <s1>上一页</s1>lunar-frame-campaign

seg-5a3a7120aae2 = <s1>下一页</s1>lunar-infrastructure
