# docs--kind-eo-coverage: translations (zh-Hans)

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-3068552e4ab4 = VALIDATED：列出此类型的<a1>验证矩阵</a1>各行。

seg-98151954f217 = false

seg-8e62cc4af6ea = 主题页面：<a1>ENTRY-EO-ASCENT.md</a1>

seg-fc32bcd32dec = 来源：<c1/>

seg-d72c017ca1fa = <c1/>（场景类型）

seg-47b4aea6ed01 = 对地观测载荷的足迹与覆盖几何（SMAD空间三角形）：针对给定的轨道高度、倾角（默认为太阳同步）和传感器FOV/IFOV，给出地球角半径、幅宽、星下点地面采样距离、最大离天底接入角、圆轨道周期、J2交点周期和赤道星下点轨迹间距，并附连续覆盖标志。MODELLED球形地球几何（无辐射度/MTF/大气/抖动/耀光）；节点间距R_e·(ω − Ω̇)·T_nodal，采用一阶J2长期项速率。

seg-105bb8a3c33f = <c1/>的一次运行汇总为：eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> { "184" } km幅宽, { "9.8" } m星下点GSD, 接入至{ "745" } km离天底; 节点间距{ "2752" } km (gapped) (MODELLED)

seg-609c5b7bc6f1 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-14f19837e422 = 示例<c1/>设置了以下内容等：

seg-834408a40783 = min

seg-ade2ba71a96c = 引擎给出的结果标签：MODELLED — 球形地球空间三角形几何；幅宽/GSD/接入角均为几何量（无辐射度/MTF/大气/抖动/耀光），星下点轨迹间距为R_e·(ω − Ω̇)·T_nodal，采用一阶J2长期项速率

seg-c2a8332f2ee2 = 引擎为scenarios/eo-coverage.toml（类型eo-coverage）生成的图表

seg-d86d43628cf3 = <b>VALIDATED</b> SMAD空间三角形几何：地球角半径、幅宽、星下点GSD、最大离天底接入角与圆轨道周期，以及一阶J2交点周期（eo_payload::j2_nodal_period）和赤道星下点轨迹间距R_e (omega_ 测试：<a1>eo_payload_coverage_reference.rs</a1>。

seg-9938f1de9eb8 = <b>VALIDATED</b> SMAD空间三角形几何：地球角半径、幅宽、星下点GSD、最大离天底接入角与圆轨道周期，以及一阶J2交点周期（。参考基准（oracle，ExternalDataset）：Orekit { "12.2" }（Apache-2.0）与GeographicLib { "2.1" }（MIT），均作为独立程序运行，已在引擎改动及任何参考基准运行之前预先登记（766823f3）：球面量在相对{ "1e-9" }以内（最差值：角半径{ "5.4e-16" }，幅宽{ "7.0e-13" }，接入角{ "1.9e-14" }），周期{ "1e-12" }（{ "1.6e-16" }），星下点GSD { "1e-7" }（{ "2.9e-10" }），J2交点周期与节点间距与带节点检测器的Orekit数值J2传播相差在{ "0.1" } % 以内（{ "1" }

seg-45625167e59f = MODELLED — 球形地球空间三角形几何；幅宽/GSD/接入角均为几何量（无辐射度/MTF/大气/抖动/耀光），星下点轨迹间距为R_e·(ω − Ω̇)·T_nodal，采用一阶J2长期项速率（结果<c1/>）

seg-cf22f13c78d3 = MODELLED球形地球几何（无辐射度/MTF/大气/抖动/耀光）；节点间距R_e·(ω − Ω̇)·T_nodal，采用一阶J2长期项速率。（类型目录（<c1/>））

seg-153325fb00d3 = 如实说明范围：仅为MODELLED球形地球几何 -- 无辐射度 / MTF / 大气 / 指向抖动 / 太阳耀光模型。星下点轨迹间距为R_e*(omega - dOmega/dt)*T_nodal，采用一阶J2长期项速率；倾角默认取该高度对应的太阳同步倾角。运行：kshana scenarios/eo-coverage.toml（场景文件注释，第{ "7" }至{ "11" }行）

seg-5dc02c3d10f7 = <s1>上一页</s1>entry-heating

seg-33f408d48d13 = <s1>下一页</s1>eo-radiometry
