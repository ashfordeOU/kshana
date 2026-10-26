# docs--kind-contact-schedule: translations (zh-Hans)

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-0f4c2ab525ac = <b>MODELLED</b>一颗卫星经过一个地面站时，沿每次过境的下行链路Es/N0（EIRP、自由空间损耗、余割律大气损耗、其他损耗、G/T、玻尔兹曼常数、符号速率），所选的最高效DVB-S2 MODCOD满足其ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b>一组SGP4根数在WGS-84地面站上的可见性过境（AOS、TCA、LOS、最大视在仰角、持续时间），位于经验证的地球轨道路径上（IAU { "2006" }。参考基准（ExternalDataset）：Orekit { "13.1.8" }（CS GROUP，Apache-2.0）搭配Hipparchus { "4.0.3" }：在同一组根数上使用TLEPropagator，所用TEME由Orekit按所述定义构建（其IERS { "2010" } TOD经GAST - GMST旋转），使用带与不带ITURP834AtmosphericRefraction的ElevationDetector和ElevationExtremumDetector，光行时情形使用带AngularRadioRefractionModifier的AngularAzEl，穿越与极大值由Hipparchus求解；{ "60" }个用例（f

seg-35588ca8e9bb = <b>MODELLED</b>一颗卫星经过一个地面站时，沿每次过境的下行链路Es/N0（EIRP、自由空间损耗、余割律大气损耗、其他损耗、G/T、玻尔兹曼常数，。参考基准（InternalConsistency）：内部自洽：由表5a的K_bch和帧长以闭式计算的频谱效率，与表{ "13" }所列的效率一致（对门限表的转录检查）；链路预算各部分与其闭式一致；选择对Es/N0单调，并遵守裕量；ACM传输的数据量不低于恒定编码的数据量。过境几何来自另行VALIDATED的a

seg-cd04f5662884 = MODELLED。（类型目录（<c1/>））

seg-7f8667e8d8fe = LEO下行过境上的DVB-S2自适应编码调制为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-72fd0321e4af = 主题页面：<a1>CONTACT-SCHEDULING.md</a1>

seg-b79fcddea1d6 = 来源：<c1/>

seg-040d160b3fdd = <c1/>（场景类型）

seg-be4e928a5865 = 多颗卫星对多个地面站的地面接触规划：视在接入窗口（SGP4、IAU 2006/2000A地固坐标系、ITU-R P.834折射、光行时）、每次过境的DVB-S2 ACM数据量（ETSI EN { "302" } 307-1表{ "13" }门限），以及无冲突的调度（每副天线同一时刻只服务一颗卫星并有转换时间，每颗卫星同一时刻只对应一个地面站，按优先级加权的交付量以各自的积压量为上限），采用边际价值贪心法、先到先服务基线，以及在小规模集合上的精确分支定界，并给出贪心法的最优性差距。MODELLED。

seg-7a3fad06a9fc = 运行一次<c1/>的摘要为：contact-schedule: { "3" }颗卫星x { "3" }个地面站，{ "12" } h -> { "31" }个候选接触，已调度{ "22" }个；已交付{ "860000" } Mbit中的{ "797266" } Mbit（MODELLED）

seg-a03d83f5866a = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-5ba0968796ac = 示例<c1/>设置了以下内容等：

seg-cade59b5a371 = 结果标签（引擎给出的）：MODELLED — 多卫星、多地面站接触计划：视在接入窗口（SGP4、IAU 2006/2000A、ITU-R P.834折射、光行时），由晴空链路预算得到的每次过境DVB-S2 ACM数据量（ETSI EN { "302" } 307-1表{ "13" }门限），以及冲突消解（每副天线同一时刻只服务一颗卫星并有转

seg-e26b549579e2 = 引擎为scenarios/contact-schedule.toml（类型contact-schedule）生成的图表

seg-036b708ed2b9 = <b>MODELLED</b>来自每次卫星-地面站过境的候选接触及其ACM数据量；冲突，即一副天线在其转换时间内要服务两颗卫星，或一颗卫星要同时向两个地面站下行；按优先级加权的交付

seg-60431931082a = <b>MODELLED</b>来自每次卫星-地面站过境的候选接触及其ACM数据量；冲突，即一副天线在其转换时间内要服务两颗卫星，或。参考基准（InternalConsistency）：内部自洽：精确分支定界与小规模随机集合上的暴力枚举一致，每个计划都对照冲突规则检查为可行，且贪心法从不优于精确最优解。不包括：没有与任何外部调度器或运行计划作过比较；接触按整体处理（不拆分），积压量在窗口起点固定，超出固定转换时间的转动时间和星上s

seg-9941b9f6d4a8 = MODELLED — 多卫星、多地面站接触计划：视在接入窗口（SGP4、IAU 2006/2000A、ITU-R P.834折射、光行时），由晴空链路预算得到的每次过境DVB-S2 ACM数据量（ETSI EN { "302" } 307-1表{ "13" }门限），以及通过边际价值贪心法做的冲突消解（每副天线同一时刻只服务一颗卫星并有转换时间，每颗卫星同一时刻只对应一个地面站），并对照精确分支定界进行检查；无雨衰，（结果<c1/>）

seg-f8ef88bc82b5 = 下列每个数值均为ILLUSTRATIVE：不对应任何运营方的轨道、地面站或链路预算。MODELLED：调度器对照的是其自身的精确求解器，而不是外部工具。（场景文件注释，第{ "11" }至{ "12" }行）

seg-fe2b4799b397 = 带冲突消解的多卫星、多地面站地面接触调度为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-be14d99cb86d = <s1>上一页</s1>constellation-design

seg-3784be57d6df = <s1>下一页</s1>earth-gnss-lunar
