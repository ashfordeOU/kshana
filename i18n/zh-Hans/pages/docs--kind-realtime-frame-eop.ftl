# docs--kind-realtime-frame-eop: translations (zh-Hans)

seg-8e845ce908ee = 引擎 v{ $version } 的场景类型，所属类别为<a1>GNSS 测量、定位与完好性</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-f6b7ca020692 = 类别页面：<a1>GNSS 测量、定位与完好性</a1>

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }：列出此类型的<a1>验证矩阵</a1>各行。

seg-a2889fb2b42a = 专题页面：<a1>integrations.md</a1>

seg-1ad013ffb9d1 = 来源：<c1/>

seg-54620502f0dd = <c1/>（场景类型）

seg-edfcb546d9de = 实时月球坐标系 /地球定向预测预算：P4表{ "1" }（坐标系误差一致性检查：后处理约{ "0.27" } m ↔ 约{ "0.010" } ms，实时约{ "15" } m ↔ 约{ "0.5" } ms，每个坐标系位置都经L19杠杆臂 Δr = D_EM·ω⊕·ΔUT1表示为其等效UT1误差）与表{ "2" }（实测UT1预测误差随预测时长的变化：L18曲线直接取自真实的IERS finals2000A序列，即Bulletin A − Bulletin B最终底限和多日持续性预测器误差，各经L19映射为月球坐标系位置），外加L21的均方根合成实时坐标系误差预算（EOP + 星历 + 框架实现底限）。VALIDATED的闭式解（L19杠杆臂，ω⊕ 与CIO地球自转角交叉核对）和VALIDATED的真实数据（取自真实finals2000A行的L18曲线）；MODELLED的是月球中继定轨协方差量级和坐标系实现底限（代表性分配值）以及持续性预测器（不是IERS业务化的Bulletin A算法）。不是经认证的实时坐标系产品。

seg-488039e4240f = <c1/>的一次运行汇总如下：realtime-frame-eop | 表{ "1" }：后处理{ "0.27" } m（{ "0.0096" } ms UT1）↔ 实时{ "14.4" } m（{ "0.514" } ms UT1）| 表{ "2" }：最终底限{ "0.0171" } ms → 3天{ "1.6644" } ms | 预算合计{ "20.1" } m（{ "67.0" } ns）| L19杠杆臂 + L18真实数据（已核对验证），定轨协方差（建模）

seg-66264ec78a4c = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>

seg-45a4ed476311 = 示例<c1/>设置了以下内容等：

seg-c39a26aa1f1e = 随库提供的测试数据文件finals2000A_20260930

seg-9ef8a2b4c144 = 结果标签（引擎给出）：实时月球坐标系 /地球定向预测预算。VALIDATED闭式解：L19杠杆臂（{ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns），ω⊕ 与CIO地球自转角交叉核对。VALIDATED真实数据：L18 UT1与极移预测误差曲线直接取自真实的IERS finals200

seg-2721ed7727bb = 引擎为scenarios/realtime-frame-eop.toml（类型realtime-frame-eop）绘制的图表

seg-72a1fc2f5c90 = <b>VALIDATED</b>一张表在每个预测时长的相同历元集上报告月球处的UT1预测误差、极移误差及其正交合成，并给出各分量被测量时的历元。测试：<a1>embedded_eop_vintage_astropy_preregistered.rs</a1>。

seg-b1d90bf98ac3 = <b>VALIDATED</b> <c1/>的运行时默认值是库自带的、逐字取自IERS finals2000A的摘录副本（tools/finals2000A_20260930.txt：{ "174" }个连续的逐日行，MJD 61224-61397，截取自2026-09-30的finals2000A.all），带有 测试：<a1>operational_eop_predictor_reference.rs</a1>。

seg-0298bd40d72f = <b>MODELLED</b>对尾随窗口做最小二乘的偏置加变化率拟合，再加主要周期项（UT1为周年项、半年项和两个主要带谐潮汐；极移为钱德勒项、周年项和半年项），并以窗口内最后一个 测试：<a1>operational_eop_predictor_reference.rs</a1>。

seg-12efcd20ca62 = <b>VALIDATED</b>一张表在每个预测时长的相同历元集上报告月球处的UT1预测误差、极移误差及其正交合成，给出. 参考基准（ExternalDataset）：astropy { "8.0.1" } utils.iers（BSD-3）按其自身的Bulletin-B优先否则A的规则读取IERS finals2000A产品，以及pyerfa { "2.0.1.5" }（SOFA）完整的天球到地球旋转（c2i06a、sp00、pom00、c2tcio；地球自转角按IERS { "2010" }式{ "5.15" }以精确算术计算），作为独立程序在冻结的2026-09-30 finals2000A.all的逐字行上运行；预先登记（455b8fb5），修订A1和A2仅固定

seg-020e5919c8fd = <b>VALIDATED</b> <c1/>的运行时默认值是库自带的、逐字取自IERS finals2000A的摘录副本（tools/finals2000A_20260930.txt：{ "174" }个连续. 参考基准（ExternalDataset）：astropy { "8.0.1" } astropy.utils.iers.IERS_A（BSD-3-Clause），用其自身的读取器读取同样的字节，以及IERS Bulletin A Vol. XXXIX No. { "039" }表，逐数字抄录；在运行astropy之前已预先登记（6fdae01b）六条精确判据。六条全部成立：{ "30" }个最终、{ "54" }个快速和{ "90" }个预测行，MJD列表相同，每个预测行标志均为P，默认运行的统计相同，且预测与Bullet

seg-530c87bbff78 = <b>MODELLED</b>对尾随窗口做最小二乘的偏置加变化率拟合，再加主要周期项（UT1为周年项、半年项和两个主要带谐潮汐；. 参考基准（ReferenceImpl）：三条独立路径，没有一条是已发表的预测精度数字。（{ "1" }）已知系数的解析信号：这是检验周期项机制的唯一办法，因为没有任何已提交的序列长到足以容纳周年项。（{ "2" }）教科书式的闭式最小二乘解，代数形式不同于被测的矩阵求解，作用于真实行。（{ "3" }）真实存档的Bulletin A预测行，

seg-a233df86be95 = 实时月球坐标系 /地球定向预测预算。VALIDATED闭式解：L19杠杆臂（{ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns），ω⊕ 与CIO地球自转角交叉核对。VALIDATED真实数据：L18 UT1与极移预测误差曲线直接取自真实的IERS finals2000A序列（Bulletin A快速对Bulletin B最终，以及基于真实逐日行的多日持续性）。推导得出：坐标系（结果<c1/>）

seg-60e7ee7e6e3e = VALIDATED的闭式解（L19杠杆臂，ω⊕ 与CIO地球自转角交叉核对）和VALIDATED的真实数据（取自真实finals2000A行的L18曲线）；MODELLED的是月球中继定轨协方差量级和坐标系实现底限（代表性分配值）以及持续性预测器（不是IERS业务化的Bulletin A算法）。（类型目录（<c1/>））

seg-ddf4702f78e5 = 诚实声明：VALIDATED的闭式解（L19杠杆臂，omega_earth与CIO地球自转角交叉核对）和VALIDATED的真实数据（取自真实finals2000A行的L18 UT1与极移曲线）。推导得出的坐标系实现底限（Helmert拟合后残差）。MODELLED的是月球中继定轨协方差量级（后处理{ "0.27" } m，一小时延迟下实时约{ "14.4" } m，是取整而非反推的，全部（场景文件注释，第{ "27" }至{ "32" }行）

seg-bc51b666d070 = 业务化风格的地球定向预测误差（实测的预测值对最终值）是MODELLED，而非经独立核对验证：它与同一代码库中的另一实现进行了核对，该实现独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-653fad5e0afe = <s1>上一页</s1>quantum-trade

seg-5abe534d4ef1 = <s1>下一页</s1>reentry
