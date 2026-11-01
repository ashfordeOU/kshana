# docs--kind-reentry: translations (zh-Hans)

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-3a3ee499961e = <b>MODELLED</b>多级运载器在非自转的球形地球上穿过US Standard Atmosphere { "1976" }（密度和压力）的平面重力转弯上升段，带俯仰踢转，推力因喷管背压而降低，各级关机在精确的s

seg-8e62cc4af6ea = 主题页面：<a1>ENTRY-EO-ASCENT.md</a1>

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

seg-c95aec0d2943 = 来源：<c1/>

seg-91424dc65b3e = <c1/>（场景类型）

seg-039f77066d97 = Allen-Eggers弹道再入走廊：峰值减速度（与弹道系数无关，V_e^{ "2" } sin|γ|/(2eH)）、峰值过载时的速度和高度，以及峰值加热速度，针对穿过指数大气的再入速度/航迹角/弹道系数；外加对同一弹道再入的平面质点积分，计入重力、地球曲率和{ "1976" }年美国标准大气（峰值减速度、速度、高度和峰值时刻）。MODELLED的弹道（无升力）再入；加热输出是峰值加热速度，而不是热流（没有气动热/TPS模型）。

seg-9908d06c50eb = <c1/>的一次运行汇总如下：reentry（Allen–Eggers）：V_e { "7800" } m/s，γ { "6.0" }° ->峰值{ "16.6" } g，位于{ "49" } km、{ "4731" } m/s；加热峰值在{ "6603" } m/s；质点（重力、曲率、US76）峰值{ "16.4" } g（MODELLED弹道，无气动热）

seg-f057c2a160e7 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-576245fd5b70 = 示例<c1/>设置了以下内容等：

seg-0b7769c97ff3 = 结果标签（引擎给出）：MODELLED：Allen–Eggers弹道（无升力）再入，指数等温大气，航迹角恒定；峰值过载与弹道系数无关；加热是峰值加热速度，并非热流（没有气动热/TPS模型）

seg-b0109481e8ff = 引擎为scenarios/reentry.toml（类型reentry）绘制的图表

seg-c860b8679b47 = <b>MODELLED</b>指数大气弹道再入的峰值减速度（与弹道系数无关）、峰值过载时的速度与高度，以及峰值加热速度。测试：<a1>reentry_point_mass_accelerometer_oracle.rs</a1>。

seg-84abc0b9f859 = <b>MODELLED</b>指数大气弹道再入的峰值减速度（与弹道系数无关）、峰值过载时的速度与高度，以及峰值加热速度。R. 参考基准（InternalConsistency）：闭式Allen–Eggers解析再入，并另与scipy { "1.18" } solve_ivp（DOP853）对同一仅含阻力的再入常微分方程的数值积分做了交叉核对（tests/ballistic_re_entry_corridor_reference.rs，{ "36" }个算例，最差a_max相对误差{ "2.9e-9" }），这是数值积分对其自身解析形式的核对，因此仍是InternalConsistency，并非外部核对验证。MODELLED的弹道（无升力），无气动热/TPS，加热输出是一个速

seg-8b9d3db5d563 = MODELLED：Allen–Eggers弹道（无升力）再入，指数等温大气，航迹角恒定；峰值过载与弹道系数无关；加热是峰值加热速度，并非热流（没有气动热/TPS模型）（结果<c1/>）

seg-82de2275c919 = MODELLED的弹道（无升力）再入；加热输出是峰值加热速度，而不是热流（没有气动热/TPS模型）。（类型目录（<c1/>））

seg-080b28422342 = 诚实范围：MODELLED的弹道（无升力），指数等温大气，航迹角恒定。没有气动热/TPS模型，加热输出是峰值加热速度，而不是热流。不是3自由度或6自由度轨迹。运行：kshana scenarios/reentry.toml（场景文件注释，第{ "8" }至{ "11" }行）

seg-cfc345f0dc0d = 弹道再入走廊（Allen–Eggers）是MODELLED，而非经独立核对验证：它与自身的闭式/解析恒等式核对，只能发现转录和系数错误，并不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-a4b7c16e3fea = <s1>上一页</s1>realtime-frame-eop

seg-6166a1c21525 = <s1>下一页</s1>slot-timing

seg-33b3bf4992c9 = <b>MODELLED</b> <c1/>阶段：<c2/>的返回滑行，无点火，终止于再入界面；由完整协方差经有限差分梯度得到航迹角及其sigma；该角度处于规定
