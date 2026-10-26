# docs--kind-passes: translations (zh-Hans)

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-0f4c2ab525ac = <b>MODELLED</b> 一颗卫星经过一个地面站时，沿每次过境的下行链路 Es/N0（EIRP、自由空间损耗、余割律大气损耗、其他损耗、G/T、玻尔兹曼常数、符号速率），所选的最高效 DVB-S2 MODCOD 满足其 ETSI EN { "302" } 307-

seg-72fd0321e4af = 主题页面：<a1>CONTACT-SCHEDULING.md</a1>

seg-4636d450ef60 = <b>MODELLED</b> 一次运行输入一份接触计划（一组 aos_s/los_s 窗口，每个窗口请求孔径用于导航或通信，其窗口词汇与 <c1/> 输出的相同，由 <c2/> 转换）、一个孔径

seg-11e8c29ecb45 = 引擎 v{ $version } 的场景类型，所属类别为<a1>星座、覆盖与几何</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-a4f1e7d2041e = 类别页面：<a1>星座、覆盖与几何</a1>

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }：点名此类型的<a1>验证矩阵</a1>行。

seg-df90e5910fb4 = 小时

seg-2544da673115 = 来源：<c1/>

seg-0db3f4e2402e = <c1/>（场景类型）

seg-a4bdfc291fce = 地面站过境预测：对一条圆轨道（以窗口起点的SGP4平均根数给出），在一个时间窗口内，给出其经过高于高度截止角的测站的时域可见过境（AOS/TCA/LOS、最大视高度角、持续时间），以及总接入时间。SGP4/SDP4传播在IAU 2006/2000A地固系上进行（可选UT1 - UTC与极移），默认开启ITU-R P.834-9对流层折射和下行光行时，穿越时刻解算到{ "1e-7" } s，而中天时刻用黄金分割搜索求得。过境几何在海平面测站上与Orekit { "13.1.8" }做了VALIDATED；场景中的轨道和测站是示意性的输入。

seg-3050cc7fdc79 = <c1/>的一次运行汇总如下：passes：一条{ "550" } km / { "97.6" }°的轨道在{ "24" } h内经过（{ "52.2" }°，{ "4.4" }°）上空 > { "10" }°共{ "5" }次过境；总接入{ "1659" } s（MODELLED）

seg-699b650604d4 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>

seg-9d2941ba37e2 = 示例<c1/>设置了以下内容等：

seg-6f849331e33c = 结果标签（引擎给出）：MODELLED：时域地面站过境预测；SGP4/SDP4传播，IAU 2006/2000A地固系（UT1 = UTC，除非给定地球定向参数否则无极移），开启时含ITU-R P.834-9折射与光行时的视高度角，穿越与中天时刻经细化

seg-a09be8c586e3 = 引擎为scenarios/passes.toml（类型passes）绘制的图表

seg-db35e4ebd275 = <b>VALIDATED</b>引擎传播器经过高于高度截止角的测站的时域可见过境（AOS/TCA/LOS、最大高度角、持续时间），含插值的升落穿越时刻和总接入：passes::predict_passes，几何调度器（无 测试：<a1>ground_station_pass_prediction_reference.rs</a1>。

seg-6799a54acee6 = <b>VALIDATED</b>一组SGP4根数在WGS-84测站上空、经由已核对验证的地球轨道路径（IAU 2006/2000A，可选地球定向参数）的可见过境（AOS、TCA、LOS、最大视高度角、持续时间），含ITU-R P.834-9对流层 测试：<a1>pass_predictor_on_path_orekit_oracle.rs</a1>。

seg-42d4290ed718 = <b>VALIDATED</b>引擎传播器经过高于高度截止角的测站的时域可见过境（AOS/TCA/LOS、最大高度角、持续时间），含插值的升落. 参考基准（ExternalDataset）：Orekit { "12.2" }（CS GROUP，Apache-2.0）+ Hipparchus { "3.1" }，一个独立的飞行动力学库：基于ITRF星历的ElevationDetector（Brent求根器）+ EventsLogger，测站为WGS-84 TopocentricFrame。在相同的轨道+测站+遮蔽角+窗口上，AOS/LOS/最大高度角/过境次数/总接入均一致（已提交的测试数据文件；驱动程序xval/orekit-passes）

seg-eb79c117f1df = MODELLED：时域地面站过境预测；SGP4/SDP4传播，IAU 2006/2000A地固系（UT1 = UTC，除非给定地球定向参数否则无极移），开启时含ITU-R P.834-9折射与光行时的视高度角，穿越与中天时刻细化到步长以下（结果<c1/>）

seg-a7ddc8eeaf1e = <s1>上一页</s1>orbit

seg-3079cfb8decc = <s1>下一页</s1>pvt
