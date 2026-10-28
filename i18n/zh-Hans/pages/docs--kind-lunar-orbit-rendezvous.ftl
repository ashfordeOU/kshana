# docs--kind-lunar-orbit-rendezvous: translations (zh-Hans)

seg-34bdcfd66ded = 这些文档所来自的仓库分支；尚未上传到GitHub

seg-f942b36a11c4 = 尚未上传到GitHub

seg-51362910dcb7 = 有{ "2" }个内置场景使用此类型；其余的在<a1><c1/></a1>中。

seg-1f17ef6a853e = 引擎v{ $version }的场景类型，属于<a1>月球与地月空间</a1>系列。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为MODELLED（标签如何获得，见README的“证据”一节）。

seg-1c1eeb2dcaa0 = 系列页面：<a1>月球与地月空间</a1>

seg-6a26b9ab59fe = 主题页面：<a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = 结果标签（引擎给出的）：MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> 各月球类型共用的传播器（GRAIL GL0660B，阶次{ "150" }，地球和太阳作为第三体，相对论，DE440月球定向），与公开的比较。参考基准（ExternalDataset）：LRO和CAPSTONE的JPL Horizons航天器星历，对照xval/mission-thread-lunar/PREREGISTRATION.md中预先登记的判据（修订{ "1" }至{ "6" }）。LRO：MET，最大3-D差异{ "33" } m，径向RMS为{ "2.4" } m，判据分别为{ "500" } m和{ "60" } m。CAPSTONE：NOT MET，末端位置差异{ "136.8" } km，判据为{ "25" } km；近心点差异{ "28.4" } km，判据为{ "10" } km，原因未能分离。该行属于建模，因为CAPSTON

seg-626ab55f0424 = MODELLED（结果<c1/>）

seg-e482c9896140 = 月球力模型传播对照公开的重建月球轨道器和地月轨迹为 MODELLED，而非已验证：某一子声明经过外部核对，但整项能力由建模的各部分组合而成，因此该能力仍为建模。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-e66e2ca31e54 = 主题页面：<a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = 来源：<c1/>

seg-8beb22a0eb0b = <c1/>（场景类型）

seg-2deefd8c547b = MODELLED的相对导航，适用于低月球轨道或椭圆极轨道上的猎户座-着陆器式对接（Artemis级）。追踪器和目标在本crate的月球力模型下飞行同一条轨道；对整条弧段做联合21参数批处理高斯-牛顿估计（两个飞行器状态和持续存在的空间信号偏置），融合每个飞行器来自一个ILLUSTRATIVE的LCNS级中继星集合的绝对位置修正（月球背面的中继星被剔除，需要四颗，两飞行器间共模的空间信号误差相互抵消）和一条星间链路测距，测距精度取自LunaNet AFS导频的码跟踪界。报告目标LVLH轴系中的形式相对位置误差和蒙特卡罗相对位置与速度误差、修正可用性、平均归一化估计误差平方及其期望值、迭代未收敛的任何试验、忽略重力谐项所产生的漂移，以及传递下去的完整6x6协方差。对圆轨道情形适用闭式Hill/Clohessy-Wiltshire检验。MODELLED：示意性的中继星集合、误差预算和先验；真值和估计器共用同一个力模型，因此NEES检验的是自洽性，而不是模型误差。未获机构背书；仅供参考的软件，不是经认证的导航设备。

seg-a6d29fc5f19b = 运行一次<c1/>的摘要为：lunar-orbit-rendezvous | llo 100x100 km | 间距{ "2000" } m | 修正{ "74" }% | 相对位置1σ R/A/C 0.03/0.06/0.04 m | 平均NEES { "6.51" }（预期{ "6" }）| 在{ "2000" } s时收敛(MODELLED)

seg-b7c86affeac1 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>、<c22/>、<c23/>、<c24/>、<c25/>

seg-42fe2ad9cfba = 示例<c1/>设置了以下内容等：

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = 仅供参考的软件，不是经认证的导航

seg-4466fb6f4043 = 沿弧段的批处理高斯-牛顿

seg-d97b2505ac72 = 引擎为scenarios/lunar-orbit-rendezvous.toml（类型lunar-orbit-rendezvous）生成的图表

seg-7ea832b979c9 = <b>MODELLED</b> <c1/>类型与阶段：对整条弧段做两飞行器联合批处理高斯-牛顿估计（二十一个参数：两个状态以及持续存在的空间信号位置偏置，含共模与独立两部分），按四分之一、一半 测试：<s1>mission_thread_lunar_oracles.rs</s1>。

seg-826fd7fd44b9 = <b>MODELLED</b> <c1/>类型与阶段：对整条弧段做两飞行器联合批处理高斯-牛顿估计（二十一个参数：两个状态以及持续存在的空间信号位。参考基准（InternalConsistency）：预先登记下的自洽性（xval/mission-thread-lunar/PREREGISTRATION.md，结果和估计器的演变历史见RESULTS.md）：相对状态的平均NEES为{ "5.85" }至{ "5.93" }，判据区间为{ "5.2" }至{ "6.8" }，在四种配置下均如此，在第四种估计器设计上MET，此前三种序贯滤波器设计均未达标；真值和估计器共用同一个力模型，因此这说明不了任何模型误差。

seg-b2f273ea732d = MODELLED的相对导航，适用于低月球轨道或椭圆极轨道上的猎户座-着陆器式对接（Artemis级）。（类型目录（<c1/>））

seg-9d4f99557cc5 = MODELLED：示意性的中继星集合、误差预算和先验；真值和估计器共用同一个力模型，因此NEES检验的是自洽性，而不是模型误差。（类型目录（<c1/>））

seg-158e44d47c0b = 诚实说明：MODELLED。中继星集合、空间信号误差、共模比例和先验都是ILLUSTRATIVE的输入，不是测量值；真值和估计器共用力模型（内置的中心项、J2和C22）。预先登记的自洽性检查B1（平均NEES在[{ "5.2" }, { "6.8" }]内）在批处理设计的全部四种配置下均达到：见xval/mission-thread-lunar/RESULTS.md。没有与任何真实的（场景文件注释，第{ "10" }至{ "14" }行）

seg-2a88a9650804 = 月球轨道上对接的相对导航（<c1/>）为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-6ac5bd1500a8 = <s1>上一页</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>下一页</s1>lunar-station-coverage
