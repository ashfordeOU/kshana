# docs--kind-gravity-map: translations (zh-Hans)

seg-0cd8dc81045c = 有 { "4" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-216efc4e6fba = 引擎 v{ $version } 的场景类型，所属类别为<a1>GPS 拒止下的替代 PNT</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-df8d5e07e737 = mGal

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-0df60ac6343f = <b>MODELLED</b> 重力地图匹配、地形参考（TERCOM/SITAN）、磁异常。参考基准（InternalConsistency）：IGRF-14 系数；第一性原理的匹配滤波器 CRLB。真实场重力基准测试的场经过外部核对（行“Gravity-anomaly synthesis from a spherical-harmonic model”），但其导航结果没有外部参考基准

seg-d776abd5691c = 替代/互补 PNT 为 MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-98133e74f88a = 类别页面：<a1>GPS 拒止下的替代 PNT</a1>

seg-43227f4c8295 = 来源：<c1/>

seg-2a4cb69bc920 = <c1/>（场景类型）

seg-9a58a7b09423 = GPS 拒止环境下的重力图匹配导航：冷原子重力仪从所飞越的重力异常序列中恢复出恒定的 INS 漂移。

seg-c8caaff45826 = <c1/> 的一次运行汇总为：gravity-map | free-inertial drift { "78302" } m | gravity-matched { "1882" } m | matching sigma { "2.000e0" } mGal

seg-4d9bcce2dd39 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>

seg-54272925e770 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>

seg-5dfee3a0cc22 = 示例 <c1/> 设置了以下内容等：

seg-c42d90057e9f = 引擎为 scenarios/gravity-map-nav.toml（类型 gravity-map）生成的图表

seg-fe3ba7e11502 = <s1>上一页</s1>gnss-ssv

seg-2b9bdd9def58 = <s1>下一页</s1>holdover-test
