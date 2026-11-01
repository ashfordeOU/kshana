# docs--kind-launch-window: translations (zh-Hans)

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-b054c73f22e5 = 无值

seg-8e62cc4af6ea = 主题页面：<a1>ENTRY-EO-ASCENT.md</a1>

seg-1c385961d594 = 来源：<c1/>

seg-e0990c5f14da = <c1/>（场景类型）

seg-7a4e6215a488 = 二体发射与上升几何：发射方位角（sin Az = cos i / cos lat）、最小可达倾角、圆轨道速度、地球自转的向东增益、目标倾角低于发射场纬度时的折线（dogleg）平面变轨 Δv，以及每日发射机会次数。MODELLED球形地球几何（无自转地球速度三角形修正，无上升/阻力损失模型）。

seg-e24b0ae723c7 = <c1/>的一次运行汇总为：launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

seg-6f955816b5c6 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-aaadee0743ee = 示例<c1/>设置了以下内容等：

seg-58d26f083b8f = 引擎给出的结果标签：MODELLED — 二体球形地球发射几何；方位角为几何关系sin(Az)=cos(i)/cos(lat)（无自转地球速度三角形修正，无上升/阻力损失模型）

seg-9696283a95ae = 引擎为scenarios/launch-window.toml（类型launch-window）生成的图表

seg-38175030f689 = <b>MODELLED</b>二体发射方位角（sin Az = cos i / cos lat）、最小可达倾角、圆轨道速度、地球自转向东增益、折线（dogleg）平面变轨 Δv与每日发射机会，并且在给定历元与IERS finals2000A数据行时，发射场

seg-53bc589c7ed6 = <b>MODELLED</b>二体发射方位角（sin Az = cos i / cos lat）、最小可达倾角、圆轨道速度、地球自转向东增益、折线（dogleg）平面变轨 Δv。参考基准（oracle，InternalConsistency）：闭式球面三角发射几何对照已发表的算例锚点（Vallado，Fundamentals of Astrodynamics第4版，Algorithm { "37" }发射方位角 + 第6章平面变轨；tests/launch_window_ascent_geometry_reference.rs）。这些重复使用了kshana所实现的同一闭式（已发表数值一致性/转录检查，InternalConsistency）；MODELLED二体，无自转地球速度三角形 / 上升 / 阻

seg-12396619d3e5 = MODELLED — 二体球形地球发射几何；方位角为几何关系sin(Az)=cos(i)/cos(lat)（无自转地球速度三角形修正，无上升/阻力损失模型）（结果<c1/>）

seg-715f1856bd37 = MODELLED球形地球几何（无自转地球速度三角形修正，无上升/阻力损失模型）。（类型目录（<c1/>））

seg-4e9a215e3918 = 如实说明范围：MODELLED。仅为几何方位角 -- 无自转地球速度三角形修正（增益单独报告以便折算），无上升轨迹 / 阻力损失 / 操纵模型。Pre-Phase-A几何。运行：kshana scenarios/launch-window.toml（场景文件注释，第{ "8" }至{ "11" }行）

seg-12332d181de4 = 发射窗口与上升几何（任务分析）为MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-1a3841380d88 = <s1>上一页</s1>jamming

seg-78411b85f301 = <s1>下一页</s1>leo-navmsg
