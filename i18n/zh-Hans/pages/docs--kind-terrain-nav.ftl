# docs--kind-terrain-nav: translations (zh-Hans)

seg-216efc4e6fba = 引擎v{ $version }的场景类型，所属类别为<a1>GPS拒止下的替代PNT</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-0df60ac6343f = <b>MODELLED</b>重力地图匹配、地形参考（TERCOM/SITAN）、磁异常。参考基准（InternalConsistency）：IGRF-14系数；第一性原理的匹配滤波器CRLB。真实场重力基准测试的场经过外部核对（行“Gravity-anomaly synthesis from a spherical-harmonic model”），但其导航结果没有外部参考基准

seg-d776abd5691c = 替代/互补PNT为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-98133e74f88a = 类别页面：<a1>GPS拒止下的替代PNT</a1>

seg-1d36a7dc3fd0 = 来源：<c1/>

seg-7bfd6d049799 = <c1/>（场景类型）

seg-0d7bf5a4f07e = GPS拒止环境下的地形参考导航（TERCOM/SITAN）：雷达/气压高度计将地面高程剖面与SRTM式DEM匹配，以修正INS漂移。

seg-54690375328b = <c1/>的一次运行汇总为：terrain-nav | free-inertial drift { "70659" } m | terrain-matched { "53" } m (1342x cut) | matching sigma { "17.0" } m

seg-db286a072e43 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>

seg-efc57f43bd6f = 可选字段：<c1/>、<c2/>、<c3/>

seg-96e3607379e0 = 示例<c1/>设置了以下各项（节选）：

seg-c5e33c7122e2 = 引擎为scenarios/terrain-nav.toml（场景类型terrain-nav）生成的图表

seg-0fcad0016c78 = <s1>上一页</s1>telecom-timing

seg-fa50992f818f = <s1>下一页</s1>terrain-slam

seg-e66e2ca31e54 = 主题页面：<a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> <c1/>类型与阶段：针对动力下降的五状态逐轴惯性误差模型（位置、速度、加速度计偏置、倾斜、陀螺偏置），由AFS修正辅助（独立或差分，含时钟辅助的三中继
