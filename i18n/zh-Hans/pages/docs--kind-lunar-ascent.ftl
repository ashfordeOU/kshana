# docs--kind-lunar-ascent: translations (zh-Hans)

seg-f942b36a11c4 = 尚未上传到GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = 引擎v{ $version }的场景类型，属于<a1>月球与地月空间</a1>系列。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为MODELLED（标签如何获得，见README的“证据”一节）。

seg-1c1eeb2dcaa0 = 系列页面：<a1>月球与地月空间</a1>

seg-6a26b9ab59fe = 主题页面：<a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = 来源：<c1/>

seg-b8ef47331221 = <c1/>（场景类型）

seg-ae3053a1f6c8 = MODELLED：从南极月面地点动力上升至交会轨道，以及它带回轨道的位置—速度协方差（阿尔忒弥斯级）。lunar-descent的五状态每轴惯性误差模型（位置、速度、加速度计偏差、姿态倾斜、陀螺偏差，由比力驱动）在三个地点轴上，从该阶段进入时的月面状态开始运行；按所述间隔取一个AFS位置定位解，来自 ILLUSTRATIVE 的LCNS级星座的可见中继（单点，或采用lunar-differential-pnt的校正链路残差的差分；仅有三个中继可见时由时钟辅助），月球时间经由飞行器时钟引入，并带有沿航迹的时间标签误差。报告闭式惯性误差源、辅助的贡献、消融、上升期间的导航1-sigma、发动机关机散布及其旁的导航知识，以及入轨时保留位置—速度相关性的完整6x6 MCI协方差。MODELLED：示意性的IMU等级、比力、中继集和关机散布；误差保持在发射场轴系中；名义出口状态是一个替代值。未获机构背书；仅供参考的软件，不是经认证的导航设备。

seg-fc4d2ba3f99e = <c1/>的一次运行汇总为：lunar-ascent | -89.50 deg | 仅惯性{ "785" } m / { "3.49" } m/s | 含AFS { "11.4" } m / { "0.071" } m/s | 入轨散布{ "1.73" } m/s（MODELLED）

seg-9fcdb15c21eb = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>

seg-a1c3e374f512 = 示例<c1/>设置了其中若干项，包括：

seg-ebc18c9bcbac = differential

seg-3843825d0733 = us

seg-2d84b341a41f = 结果标签（引擎给出的）：MODELLED

seg-463a919e84d5 = 引擎为scenarios/lunar-ascent.toml写出的图表，类型为lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> <c1/>类型与阶段：五状态每轴惯性误差模型运行于动力上升，沿路径施加比力，由AFS定位解和月球时间辅助，报告带

seg-4e0c4b02eac0 = <b>MODELLED</b> <c1/>类型与阶段：五状态每轴惯性误差模型运行于动力上升，沿路径施加比力，由AFS定位解辅助。参考基准（InternalConsistency）：测试中的闭式惯性漂移和单调性检查。没有与任何实际飞行的上升比较

seg-8732ad9f7e07 = <b>MODELLED</b> 各月球类型共用的传播器（GRAIL GL0660B，阶次{ "150" }，地球和太阳作为第三体，相对论，DE440月球定向），与公开的比较。参考基准（ExternalDataset）：LRO和CAPSTONE的JPL Horizons航天器星历，对照xval/mission-thread-lunar/PREREGISTRATION.md中预先登记的判据（修订{ "1" }至{ "6" }）。LRO：MET，最大3-D差异{ "33" } m，径向RMS为{ "2.4" } m，判据分别为{ "500" } m和{ "60" } m。CAPSTONE：NOT MET，末端位置差异{ "136.8" } km，判据为{ "25" } km；近心点差异{ "28.4" } km，判据为{ "10" } km，原因未能分离。该行属于建模，因为CAPSTON

seg-626ab55f0424 = MODELLED（结果<c1/>）

seg-745dfc03a929 = MODELLED：从南极月面地点动力上升至交会轨道，以及它带回轨道的位置—速度协方差（阿尔忒弥斯级）。（类型目录（<c1/>））

seg-3fd0cca78937 = MODELLED：示意性的IMU等级、比力、中继集和关机散布；误差保持在发射场轴系中；名义出口状态是一个替代值。（类型目录（<c1/>））

seg-2cfb37d39847 = 诚实说明（HONESTY）：MODELLED。IMU等级、对准、比力和关机散布是 ILLUSTRATIVE 的输入，不是测量值。误差保持在发射场的东—北—天轴系中，不含路径的下程曲率，且名义出口状态是位于该地点局部垂线上的替代值：只有协方差是结果。不声称与任何真实飞行器一致。仅供参考的软件，不是c（场景文件注释，第{ "11" }至{ "15" }行）

seg-6faf49cac41a = 从月球极区地点动力上升至入轨轨道（<c1/>）为 MODELLED，而非已验证：对照其自身的闭式 / 解析恒等式核对，可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e482c9896140 = 月球力模型传播对照公开的重建月球轨道器和地月轨迹为 MODELLED，而非已验证：某一子声明经过外部核对，但整项能力由建模的各部分组合而成，因此该能力仍为建模。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e66e2ca31e54 = 主题页面：<a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>上一页</s1>link-budget

seg-59d4cb995cb9 = <s1>下一页</s1>lunar-attack-surface
