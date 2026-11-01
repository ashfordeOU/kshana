# docs--kind-lunar-jamming: translations (zh-Hans)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b>未提供：Kshana对信号性能建模，不对有效载荷或天线硬件建模。参考基准（NoneKind）：无：由合作方负责的学科，按设计没有模块也没有测试

seg-1f17ef6a853e = 引擎v{ $version }的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-f85a85f0c7e4 = MHz

seg-7154243aabbe = broadband

seg-cec5c06d38af = <b>MODELLED</b>月面原生的干扰信号比、有效C/N₀ 与失锁，针对月面（或抬高）干扰源下的月面用户，基于示意性的、取自公开来源的Moonlight/LCNS类星座。

seg-edcd55ccc993 = <b>MODELLED</b> <c1/>报告不再把其拒止等值线建立在单一标量之上。

seg-bcb02ffed4d0 = 来源：<c1/>

seg-612388918e36 = <c1/>（场景类型）

seg-a91a9ad5d8d1 = 月球原生的射频压制干扰：在月面（或抬高的）干扰机作用下，针对月面坐标上的月面用户，按卫星给出干信比、有效C/N₀ 和失锁情况，作用于示意性的、取自公开来源的Moonlight/LCNS级月球轨道星座。组合现有的开放压制干扰物理（jamming::j_over_s_db、effective_cn0_dbhz、rx_antenna_gain_db、lock_status、q_factor）与现有的月球天空几何（lunar_service::LunarConstellation + topocentric、lunar::selenographic_to_mcmf）；几何与辐射度量都不重新推导。与地球的<c1/>类型不同，信号一侧并非固定的接收功率（NOT）：每颗卫星的各向同性接收功率是它自己的链路预算EIRP − FSPL(斜距)，因此干信比随月球距离和仰角逐卫星变化。每条可见（历元，卫星）链路报告一行（ONE ROW PER VISIBLE (epoch, satellite) LINK）——方位角、仰角、斜距、构成干信比之差的两个接收功率、干信比、标称和有效C/N₀ 以及锁定状态——此外在该表旁边（绝不取代该表）给出汇总性能指标，并以CSV产物给出同样的表。每个输出的数值字段都带单位和出处类别。VALIDATED的子结果带有其来源模块的参考基准（oracle）（Kaplan & Hegarty §{ "9.4" }的抗干扰方程和J/S链路，在tests/gnss_denied_jamming_resilience_reference.rs中有外部参照；lunar_service的月球几何）。组合本身对照一条独立的双链路预算路径（linkbudget::received_signal_power_dbw，采用不同的自由空间损耗表达式）交叉检查，一致到{ "1e-9" } dB。MODELLED：示意性的星座，具有代表性的EIRP / 干扰机功率 / 天线增益 / 噪声温度，以及不含地形遮挡、多路径、AGC动态和自适应调零。不是经认证的拒止服务产品。配置了干扰机时，报告还给出带不确定度带的拒止等值线（DENIAL CONTOUR WITH AN UNCERTAINTY BAND），而不是由单个标量读出的等值线：即按卫星表测得的有用信号C/N₀ 的完整分布（n、最小值、p05、p25、中位数、p75、p95、最大值、均值、样本标准差，以及样本自身的偏度），以及在这些次序统计量中每一个处、按引擎认可的两种拒止判据（BOTH）求得的等值线——既有的功率比判据（J/S = { "30" } dB，如attack-surface和tracking-loop中）和失锁判据（有效C/N₀ 降到tracking_threshold_dbhz，本报告自身状态列所用的判据）——在拒止平面的两条轴上（场景对峙距离下所需的干扰机EIRP，场景EIRP下的拒止对峙距离）。带的边缘就是（ARE）contour(p05) 和contour(p95)，即同一个闭式映射作用于样本自身的分位数：不是对样本拟合的sigma，也不是中位数 ± k·stdev，stdev为保持连贯而输出，不被任何东西使用。已处于或低于跟踪门限的分位数没有有限的拒止J/S，其失锁列为null并附计数的原因，绝不给出被截断的半径。

seg-6693c3ebcb07 = <c1/>的一次运行概括如下：lunar-jamming | { "4" }颗卫星，{ "12" }个历元，{ "38" }条链路，自 (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB（均值{ "35.622" }）| { "0" } LOST | 可用性{ "0.167" }，标称为{ "0.167" }

seg-6e01b6354e40 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>

seg-c61fb6515ed9 = 示例<c1/>设置了下列内容等：

seg-6fe8b3c6c584 = 引擎为scenarios/lunar-jamming.toml（类型lunar-jamming）生成的图表

seg-d4ae2f589112 = <b>MODELLED</b>在月面（或抬高的）干扰机作用下，针对月面坐标上的月面用户，月球原生的干信比、有效C/N₀ 和失锁情况，作用于示意性 . 参考基准（oracle，ReferenceImpl）：对照仓库内独立代码路径作组合交叉检查：每条链路的J/S都重新推导为用linkbudget::received_signal_power_dbw计算的两份链路预算之差，其自由空间损耗是单一表达式{ "20" }·log10(4πRf/c)，而不是jamming::free_space_path_loss_db所用的三项之和——两者在每一行上一致到< { "1e-9" } dB（实测最坏情形{ "7.11e-14" } dB，即浮点舍入）

seg-dbe54e7cc800 = <b>MODELLED</b> <c1/>报告的拒止等值线不再依赖单个标量。它输出按卫星表测得的有用信号C/N₀ 的完整分布 . 参考基准（oracle，InternalConsistency）：对照引擎自身的前向函数作内部一致性检查，这是该能力所能如实声称的全部。每个等值线点都是一次闭式反演，每次反演都通过把其结果代回报告各行评分所用的前向（FORWARD）函数来检查：J/S列经jamming::effective_cn0_dbhz（它必须返回tracking_threshold_dbhz，一致到< { "1e-9" } dB-Hz），对峙距离列

seg-d48926e62856 = MODELLED：示意性的星座，具有代表性的EIRP / 干扰机功率 / 天线增益 / 噪声温度，以及不含地形遮挡、多路径、AGC动态和自适应调零。（类型目录（<c1/>））

seg-c455dbcb9f8c = MODELLED。该星座是示意性的、取自公开来源的Moonlight/LCNS级几何（不是真实星历；不意味着任何隶属关系或背书），干扰模型是链路预算：不含对干扰机的地形遮挡（在南极地形中是一阶效应）、多路径、AGC远近动态、自适应调零，也不含捕获与跟踪之间的滞回。（场景文件注释，第{ "26" }至{ "30" }行）

seg-da57cc7f1aa4 = 月面导航射频压制干扰（逐卫星J/S）为MODELLED，而非已与独立的外部参考基准核对：对照本代码库中另一套独立的实现检查——独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-dba1589d3c1e = 依据所测C/N₀ 离散度给出带不确定度带的月球拒止等值线为MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-a2889fb2b42a = 专题页面：<a1>integrations.md</a1>

seg-03b50b21e5a8 = <s1>上一页</s1>lunar-interop-export

seg-02568469f628 = <s1>下一页</s1>lunar-joint-od-clock
