# docs--kind-terrain-slam: translations (zh-Hans)

seg-216efc4e6fba = 引擎 v{ $version } 的场景类型，所属类别为<a1>GPS 拒止下的替代 PNT</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-0df60ac6343f = <b>MODELLED</b> 重力地图匹配、地形参考（TERCOM/SITAN）、磁异常。参考基准（InternalConsistency）：IGRF-14 系数；第一性原理的匹配滤波器 CRLB。真实场重力基准测试的场经过外部核对（行“Gravity-anomaly synthesis from a spherical-harmonic model”），但其导航结果没有外部参考基准

seg-d776abd5691c = 替代/互补 PNT 为 MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-98133e74f88a = 类别页面：<a1>GPS 拒止下的替代 PNT</a1>

seg-bb7c9c4d4b5d = 来源：<c1/>

seg-562e59d703e3 = <c1/>（场景类型）

seg-6bdc150ab25b = GPS 拒止环境下的序贯（递推）地形参考导航：粒子滤波器逐历元运行地形匹配测量模型（SITAN 作为运行中的滤波器），从而沿航迹跟踪随时间变化的 INS 漂移，而批处理的 terrain-nav 只能恢复单一的恒定偏移。

seg-1e4350c2c5f0 = <c1/> 的一次运行汇总为：terrain-slam | { "60" } waypoints | free-inertial RMS { "2947" } m (final { "5082" } m) | terrain-matched RMS { "1241" } m (final { "69" } m, 2x cut) | mean ESS 2599/4000 | matching sigma { "17.0" } m

seg-939d877137f6 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>

seg-5ceb5b8597ac = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-48e022b0945e = 示例 <c1/> 设置了以下各项（节选）：

seg-4aca87f022dc = 引擎为 scenarios/terrain-slam.toml（场景类型 terrain-slam）生成的图表

seg-832919783819 = <s1>上一页</s1>terrain-nav

seg-1693abd546fe = <s1>下一页</s1>time-transfer-budget
