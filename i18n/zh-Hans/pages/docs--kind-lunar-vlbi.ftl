# docs--kind-lunar-vlbi: translations (zh-Hans)

seg-c1ce24cd6008 = 解析式

seg-37d29d8303fe = km

seg-1f17ef6a853e = 引擎 v{ $version } 的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-df90e5910fb4 = 小时

seg-3843825d0733 = us

seg-d1a6a5086102 = <b>VALIDATED</b>将时延偏导数在基线 × 历元的安排上累积为费舍尔信息矩阵，求逆得到测站坐标协方差和各坐标的测站sigma，取代由一个假定的各向同性均分关系得出的结果，该关系来自

seg-55ce02ad5dd5 = <b>MODELLED</b>第三种基准选择<c1/>，它固定所有地球测站，仅估计信标的月固坐标，这正是引用月面点不确定度时实际采用的配置，因为地球测站坐标

seg-afeb6e26c5ad = 来源：<c1/>

seg-6d1a32afd780 = <c1/>（场景类型）

seg-e01f77d493a0 = 由模型计算的月球大地测量VLBI时延观测量：一条地球基线（两个地面站，GCRS）观测来自NovaMoon级月面信标的单程信号。输出一次过境期间的近场双距离差时延、其变化率以及波前曲率近场修正，并在远场极限下与同一代码库中的平面波 Δ-DOR观测量交叉核对，偏导数已用有限差分核对。默认的解析路径为MODELLED，并带有坐标系一致性、xp=yp={ "0" }极移以及平面波与近场之差这几项局限。设置planetary_kernel_path、earth_orientation_kernel_path和moon_orientation_kernel_path后则运行内核路径（DE440、MOON_PA_DE440、ITRF93；收敛的质心光行时；增加该历元的信标与测站偏导数），其牛顿时延和偏导数与NAIF SPICE收敛光行时的一致程度分别为{ "0.06" } ps和{ "7.4e-9" }。未与真实VLBI数据核对验证。

seg-92227c085867 = <c1/>的一次运行汇总如下：lunar-vlbi | 基线{ "10727" } km | 信标距离{ "402900" } km | 时延 -10049.126 µs（变化率{ "1.312e-6" } s/s）| 近场{ "58.9" } µs | { "6.0" } h内{ "13" }个采样

seg-1a38a07a0d70 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>

seg-11450a55fc9d = 示例<c1/>设置了以下内容等：

seg-07d97fc1abac = 引擎为scenarios/lunar-vlbi.toml（类型lunar-vlbi）绘制的图表

seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }：点名此类型的<a1>验证矩阵</a1>行。

seg-61f431e422e5 = <b>MODELLED</b>地球基线观测月球信标的近场VLBI时延及偏导数

seg-7342b50d34e4 = <b>VALIDATED</b>地球基线观测月球信标的近场VLBI时延，含信标与测站偏导数，采用内核路径（lunar_vlbi::KernelGeometry）：DE440地球与月球、DE440月球主轴、ITRF93地球定向及UT1和 测试：<a1>naif_kernel_reader_check.rs</a1>。

seg-5547f1f662d3 = 矩阵中另有{ "2" }项。

seg-1461c84350d8 = <b>MODELLED</b>地球基线观测月球信标的近场VLBI时延及偏导数。参考基准（ReferenceImpl）：远场极限下的平面波delta_dor（同一代码库）；有限差分偏导数。{ "0.30" }外部比较，一项发现（仍为MODELLED）：与ANISE { "0.10" }经DE440的收敛光行时相比（2024-01-01的{ "75" }个时延，覆盖三条DSN基线，由xval/anise-lunar-od生成，不含任何Kshana代码），没有任何时延落在{ "1" } ps容差之内。最大差距为{ "24" } µs，来自解析月心（约{ "200" } km，距DE

seg-b41c162b015f = 默认的解析路径为MODELLED，并带有坐标系一致性、xp=yp={ "0" }极移以及平面波与近场之差这几项局限。（类型目录（<c1/>））

seg-0beac99bb095 = 诚实声明：MODELLED，并非已与真实VLBI数据核对验证。极移被忽略（xp = yp = { "0" }），因此测站惯性系位置带有数米的坐标系误差；信标把平均历元赤道的月球级数与ICRF天体固定偏移混合使用（jd_tdb ~ jd_tt），这是低于模型精度的坐标系一致性失配；没有光行时迭代、介质或差分夏皮罗项之外的光行差。没有TRL、飞行经历或机构认可（场景文件注释，第{ "17" }至{ "21" }行）

seg-58b64e5ff3db = 月球大地测量VLBI是MODELLED，而非经独立核对验证：它与同一代码库中的另一实现进行了核对，该实现独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-04089c4d6fbe = <s1>上一页</s1>lunar-vlbi-fim

seg-6adcdfbaa8be = <s1>下一页</s1>mars-pnt
