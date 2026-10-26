# docs--kind-moonlight-service-volume: translations (zh-Hans)

seg-1f17ef6a853e = 引擎 v{ $version } 的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-8f8871ac8a0f = 专题页面：<a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = 专题页面：<a1>integrations.md</a1>

seg-eb9f9a422d38 = 来源：<c1/>

seg-f8988314faf2 = <c1/>（场景类型）

seg-28c6a5644152 = 对一个ILLUSTRATIVE的、基于公开资料的Moonlight/LCNS级月球轨道星座（与ESA无隶属关系）所作的、由模型计算的月球导航服务空间分析：在时间范围内扫描月面经纬度网格，报告DOP /覆盖 /可用性（≥{ "4" }颗卫星且PDOP < 阈值），以及覆盖该空间的广义月球ARAIM保护级（HPL/VPL）包络。DOP几何复用gnss_lib_py-VALIDATED内核（crate::orbit::dop）；保护级复用LunaNet LNIS月球ARAIM机制（crate::lunar，σ_URE≈{ "30" } m），并在特殊情形下退化为现有的南极保护级。MODELLED组合：圆/椭圆开普勒中继星集（不是真实的经微分修正的LCNS/NRHO星历），平均自转的月球（无天平动/进动极）。确定性（纯几何）。无TRL、飞行经历或机构认可。

seg-8516d1ded5dd = <c1/>的一次运行汇总如下：moonlight-service-volume | { "8" }颗卫星（示意性LCNS级，无隶属关系）| { "24" }个点 × { "12" }个历元 | 覆盖{ "37.8" }%（PDOP<{ "6.0" }）| 卫星数{ "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL可用性{ "0.0" }% | MODELLED

seg-b59e8773bcb9 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>、<c22/>、<c23/>、<c24/>、<c25/>、<c26/>

seg-0d935e7c43da = 示例<c1/>设置了以下内容等：

seg-edb738273a3a = 引擎为scenarios/moonlight-service-volume.toml（类型moonlight-service-volume）绘制的图表

seg-1974d1d64c9c = <b>VALIDATED</b>一个服务空间上的Moonlight级月球DOP /覆盖 /可用性，以及广义月球ARAIM保护级。参考基准（ExternalDataset）：独立的第三方权威ANISE { "0.10.2" } astro::Orbit开普勒传播器（Nyx Space，MPL-2.0），这是一条不同于kshana牛顿-拉弗森开普勒求解的春分点二体代码路径；每颗卫星的MCI位置一致到<{ "1e-3" } m，导出的可见卫星数量/集合在每个网格点上完全一致。DOP内核经gnss_lib_py核对验证；完好性采用已发布的LunaNet/LCNS参数

seg-47f496c1d603 = <b>VALIDATED</b>在指定月面站点处，给定卫星在该站点坐标系中的位置，每颗卫星的站心视角（方位角自正北顺时针量起、高度角）与斜距。参考基准（ExternalDataset）：ANISE { "0.10.2" }（Nyx Space，MPL-2.0，作为工具运行自xval/anise-service-geometry，二进制lunar-look-angles-xval，不调用任何Kshana代码）：ANISE自己的方位角、高度角和距离例程（azimuth_elevation_range_sez），站点由其经纬高构造器在pck00011月球（球体{ "1737.4" } km）上建立，卫星经moon_pa_de440_200625.bpc旋转到MOON_PA_DE440。{ "768" }个采样

seg-1f12671176ad = MODELLED组合：圆/椭圆开普勒中继星集（不是真实的经微分修正的LCNS/NRHO星历），平均自转的月球（无天平动/进动极）。（类型目录（<c1/>））

seg-2ff91fe31123 = 诚实声明：MODELLED组合。DOP几何通过复用经核对验证的内核而得到验证；覆盖 /可用性 /完好性的组合是MODELLED：圆/椭圆开普勒中继星集（不是经微分修正的LCNS / { "9" }:{ "2" } NRHO星历），平均自转的月球（无物理天平动/进动极），以及已发布的LunaNet LNIS完好性参数。这演示了月球服务空间M（场景文件注释，第{ "27" }至{ "32" }行）

seg-f3279128de3b = <s1>上一页</s1>mars-pnt

seg-92cd937a3fb7 = <s1>下一页</s1>ntn-positioning
