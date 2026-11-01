# docs--kind-acm-link: translations (zh-Hans)

seg-a686bcdc6cc9 = 来源：<c1/>

seg-a53e57719a74 = <c1/>（场景类型）

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-cb9447893c7f = 一颗卫星经过一个地面站：沿每次过境给出斜距、仰角和Es/N0，每一步所选的DVB-S2 MODCOD（ETSI EN { "302" } 307-1表{ "13" }的门限加实现裕量），以及ACM相对于在遮蔽角处闭合的恒定编码基线所传输的数据量。MODELLED。

seg-1ab30ff9616a = 运行一次<c1/>的摘要为：acm-link: { "3" }次过境；ACM { "92866" } Mbit，对比CCM 8PSK 3/4 { "58495" } Mbit ->增益x1.59（MODELLED）

seg-54e2159e532d = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-c7d1b4b1f247 = 示例<c1/>设置了以下内容等：

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-b77b8420b4f5 = Mbit

seg-37d29d8303fe = km

seg-eeaa777e4301 = 8PSK 3/4

seg-d62795b9fdc0 = 结果标签（引擎给出的）：MODELLED — 一颗卫星在一个地面站的各次过境上的DVB-S2自适应编码调制：沿每次视在过境的晴空Es/N0，满足其ETSI EN { "302" } 307-1表{ "13" }门限加裕量的最高效MODCOD，对比在遮蔽角处闭合的恒定编码MODCOD；无雨衰

seg-046f69293874 = 引擎为scenarios/acm-link.toml（类型acm-link）生成的图表

seg-0f4c2ab525ac = <b>MODELLED</b>一颗卫星经过一个地面站时，沿每次过境的下行链路Es/N0（EIRP、自由空间损耗、余割律大气损耗、其他损耗、G/T、玻尔兹曼常数、符号速率），所选的最高效DVB-S2 MODCOD满足其ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b>一组SGP4根数在WGS-84地面站上的可见性过境（AOS、TCA、LOS、最大视在仰角、持续时间），位于经验证的地球轨道路径上（IAU { "2006" }。参考基准（ExternalDataset）：Orekit { "13.1.8" }（CS GROUP，Apache-2.0）搭配Hipparchus { "4.0.3" }：在同一组根数上使用TLEPropagator，所用TEME由Orekit按所述定义构建（其IERS { "2010" } TOD经GAST - GMST旋转），使用带与不带ITURP834AtmosphericRefraction的ElevationDetector和ElevationExtremumDetector，光行时情形使用带AngularRadioRefractionModifier的AngularAzEl，穿越与极大值由Hipparchus求解；{ "60" }个用例（f

seg-35588ca8e9bb = <b>MODELLED</b>一颗卫星经过一个地面站时，沿每次过境的下行链路Es/N0（EIRP、自由空间损耗、余割律大气损耗、其他损耗、G/T、玻尔兹曼常数，。参考基准（InternalConsistency）：内部自洽：由表5a的K_bch和帧长以闭式计算的频谱效率，与表{ "13" }所列的效率一致（对门限表的转录检查）；链路预算各部分与其闭式一致；选择对Es/N0单调，并遵守裕量；ACM传输的数据量不低于恒定编码的数据量。过境几何来自另行VALIDATED的a

seg-02e9f2e87410 = MODELLED — 一颗卫星在一个地面站的各次过境上的DVB-S2自适应编码调制：沿每次视在过境的晴空Es/N0，满足其ETSI EN { "302" } 307-1表{ "13" }门限加裕量的最高效MODCOD，对比在遮蔽角处闭合的恒定编码MODCOD；沿过境无雨衰或指向损耗（结果<c1/>）

seg-cd04f5662884 = MODELLED。（类型目录（<c1/>））

seg-a2cdc7dff1e3 = 下列每个数值均为ILLUSTRATIVE：不对应任何运营方的轨道、地面站或链路预算。MODELLED。（场景文件注释，第{ "8" }行）

seg-7f8667e8d8fe = LEO下行过境上的DVB-S2自适应编码调制为MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-72fd0321e4af = 主题页面：<a1>CONTACT-SCHEDULING.md</a1>

seg-1f67ae89028b = <s1>下一页</s1>aocs
