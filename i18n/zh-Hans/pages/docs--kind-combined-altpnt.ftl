# docs--kind-combined-altpnt: translations (zh-Hans)

seg-a83b25413fd8 = 来源：<c1/>

seg-92b24377c9be = <c1/>（场景类型）

seg-216efc4e6fba = 引擎v{ $version }的场景类型，所属类别为<a1>GPS拒止下的替代PNT</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-f496b7f4c63a = GPS拒止下的重力加磁力加地形组合导航器：每个航路点融合三个标量场通道，得到比任何单一场更精确（CRLB更低）的漂移修正。

seg-670730bd221e = 运行一次<c1/>的摘要为：combined-altpnt | 自由惯性漂移{ "70659" } m | 重力{ "464" } m磁力{ "782" } m地形{ "368" } m | 融合{ "365" } m

seg-cf6981466329 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>

seg-078f09d100fa = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-557db767b9c3 = 示例<c1/>设置了以下内容等：

seg-df8d5e07e737 = mGal

seg-498b1aea3770 = 引擎为scenarios/combined-altpnt.toml（类型combined-altpnt）生成的图表

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-0df60ac6343f = <b>MODELLED</b>重力地图匹配、地形参考（TERCOM/SITAN）、磁异常。参考基准（InternalConsistency）：IGRF-14系数；第一性原理的匹配滤波器CRLB。真实场重力基准测试的场经过外部核对（行“Gravity-anomaly synthesis from a spherical-harmonic model”），但其导航结果没有外部参考基准

seg-d776abd5691c = 替代/互补PNT为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-98133e74f88a = 类别页面：<a1>GPS拒止下的替代PNT</a1>

seg-49efcd2ced81 = <s1>上一页</s1>clock

seg-f2ccea3bb03e = <s1>下一页</s1>conflict-resilience
