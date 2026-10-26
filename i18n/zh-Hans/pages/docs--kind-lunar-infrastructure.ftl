# docs--kind-lunar-infrastructure: translations (zh-Hans)

seg-1f17ef6a853e = 引擎 v{ $version } 的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-d1beb62cf742 = 有 { "6" } 个内置场景使用该类型；其余见<a1><c1/></a1>。

seg-e821670a8b55 = 来源：<c1/>

seg-56953faa67ae = <c1/>（场景类型）

seg-d0fb90f506c9 = MODELLED 的月球轨道与月面作为导航和大地测量基础设施的研究，五项研究共用一个类型，由 <c1/> 选择：od-consistency（NRHO 或 ELFO 中的星载地球 GNSS 定轨，对照独立的地面无线电测量定轨，在带种子的蒙特卡罗中按各自的协方差评判）、carrier-phase（月面-轨道器联合的双差载波相位以及用 LAMBDA 的整周模糊度解算）、frame-coestimation（把月面站和轨道器加入地球站测距，用于七参数月球坐标基准）、space-tie（同一航天器上的 GNSS、VLBI 和激光测距，坐标框架联系精度对照本地联系误差）以及 geodesy-sensitivity（来自激光测距、轨道器跟踪、月面重力仪和月面时钟的月球勒夫数 h2、k2、l2 和物理天平动的 Fisher 信息）。采用带有明示简化的受限三体模型；数值结果已对照独立程序检查，没有任何东西与月球量的测量值比较。

seg-5753b7552559 = <c1/> 的一次运行概括如下：lunar-infrastructure space-tie：{ "1" } 段弧上的 { "4" } 个扫描点；在登记的本地联系处，laser-vs-GNSS x 平移 sigma { "1.0363" } m

seg-f2594b18e718 = 必填字段：<c1/>

seg-4875c29c517c = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>

seg-7b33bdb70a30 = 示例 <c1/> 设置了下列内容等：

seg-5fad84cbb2be = nrho

seg-def582a1f2ca = 结果标签（引擎给出）：MODELLED——受限三体模型（地球和月球为质点，无太阳，无月球引力谐波），带有明示的简化，以及标注了公开来源的 ILLUSTRATIVE 输入。数值结果已对照独立程序检查；没有任何东西与月球量的测量值比较

seg-f3b4a80a739b = 无图：该示例不生成图表

seg-35a4a7a25561 = <b>MODELLED</b> 在近直线晕轨道（或椭圆冻结轨道）中根据两类独立数据定轨：星载接收的地球 GNSS 伪距 . 参考基准（oracle，ReferenceImpl）：一个独立的 scipy/numpy 程序对同样的变分方程积分（判据 O1）。没有任何东西与月球轨道的测量值比较。该参考基准检查的是所述公式的数值，而不是物理，因此该行仍为 MODELLED。受限三体模型：无太阳，无月球谐波，地球自转轴沿轨道法向，接收机和测站输入为 ILLUSTRATIVE。

seg-32455bf5f804 = <b>MODELLED</b> 月面站与轨道器之间的接收机间单差地球 GNSS 载波相位和码，逐历元的钟差已被剖面消去 . 参考基准（oracle，ReferenceImpl）：由导出的各行对同样的法方程所作的独立 numpy 求解（Q3），以及暴力整数枚举（Q4）。没有任何 GNSS 或月球载波相位测量与之比较。MODELLED。

seg-b20c412516b6 = <b>MODELLED</b> 七参数月球坐标基准的 Fisher 信息，来自地球站对五个反射器的单独激光测距，以及加上轨道器对月面站的测距 . 参考基准（oracle，ReferenceImpl）：对前向模型作的独立 numpy 有限差分（F2）。没有任何东西与真实的月球坐标框架解比较。该因子以假定已知的轨道和 { "1" } m 的测距 sigma 为条件。MODELLED。

seg-151c96b1f882 = <b>MODELLED</b> 当一个航天器同时搭载全部技术时，GNSS、VLBI 和激光测距坐标框架之间技术间平移、尺度和旋转偏差的 Cramer-Rao 精度 . 参考基准（oracle，ReferenceImpl）：一个独立的 numpy 堆叠方程组，位置未知量通过显式的 Schur 补消去（T3）。没有任何 GRASP、Genesis 或其他任务数据与之比较。MODELLED。

seg-743d78806f6a = MODELLED——受限三体模型（地球和月球为质点，无太阳，无月球引力谐波），带有明示的简化，以及标注了公开来源的 ILLUSTRATIVE 输入。数值结果已对照独立程序检查；没有任何东西与月球量的测量值比较，这里的任何内容也都不是对任何任务或系统的陈述。与任何机构无隶属关系，也未获其背书。咨询性（结果 <c1/>）

seg-da35c5298311 = MODELLED 的月球轨道与月面作为导航和大地测量基础设施的研究，五项研究共用一个类型，由 <c1/> 选择：od-consistency（NRHO 或 ELFO 中的星载地球 GNSS 定轨，对照独立的地面无线电测量定轨，在带种子的蒙特卡罗中按各自的协方差评判）、carrier-phase（月面-轨道器联合的双差载波相位以及整周模（类型目录（<c2/>））

seg-4658f67623b5 = Kshana 月球基础设施场景：space-tie。MODELLED；设计、输入和判据已固定在 xval/lunar-infra/PREREGISTRATION.md 中（在任何运行之前提交）。ILLUSTRATIVE 输入在该处标注了公开来源。（场景文件注释，第 { "1" } 至 { "3" } 行）

seg-f7257c25f137 = 月球定轨：地球 GNSS 对照地面无线电测量为 MODELLED，而非已与独立的外部参考基准核对：对照本代码库中另一套独立的实现检查——独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-a3988ca0b8ea = 月球载波相位整周模糊度解算：月面与轨道器为 MODELLED，而非已与独立的外部参考基准核对：对照本代码库中另一套独立的实现检查——独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-b2e4ab7b6e60 = 月球坐标框架联合估计：月面站与轨道器为 MODELLED，而非已与独立的外部参考基准核对：对照本代码库中另一套独立的实现检查——独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-6eedb30a58c5 = 空间联系的坐标框架联系精度：同址的 GNSS、VLBI 和激光测距为 MODELLED，而非已与独立的外部参考基准核对：对照本代码库中另一套独立的实现检查——独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-cd5f729c9622 = 专题页面：<a1>LUNAR-INFRASTRUCTURE.md</a1>

seg-4df4c0059362 = <s1>上一页</s1>lunar-frame-realisation

seg-c88eef4a7214 = <s1>下一页</s1>lunar-integrity
