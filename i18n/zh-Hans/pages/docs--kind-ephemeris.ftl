# docs--kind-ephemeris: translations (zh-Hans)

seg-37d29d8303fe = km

seg-3068552e4ab4 = VALIDATED：列出此类型的<a1>验证矩阵</a1>各行。

seg-c33e3cbba749 = arcsec

seg-11e8c29ecb45 = 引擎 v{ $version } 的场景类型，所属类别为<a1>星座、覆盖与几何</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-a4f1e7d2041e = 类别页面：<a1>星座、覆盖与几何</a1>

seg-670191cf797f = 主题页面：<a1>SOLAR-SYSTEM.md</a1>

seg-a3697ad561db = Hz

seg-e388fdc74ffa = 来源：<c1/>

seg-9860cb88c021 = <c1/>（场景类型）

seg-24266bc264df = 星历与星下点轨迹：传播一颗卫星（TLE→SGP4 或解析轨道），输出其 TEME/GCRS 状态（位置 + 速度）、ITRF/ECEF 位置、WGS-84 星下点纬度/经度/高度，以及逐步长的测站方位角/高度角/距离和距离变化率（多普勒）。卫星来自 <c1/>，或来自带 <c3/> 的解析 <c2/>（两者同时给出时以 <c4/> 为准）；给出 <c5/> 时，<c6/> 取代 TLE 自身的历元作为 t = { "0" }。

seg-02f2745e0550 = <c1/> 的一次运行汇总为：scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } samples | alt { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | speed { "7653" }–{ "7661" } m/s | max el { "25.7" }° peak Doppler { "34.3" } kHz

seg-2ce1ab71e2cc = 必填字段：<c1/>

seg-21dc45b3de59 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-cda81cdb3607 = 示例 <c1/> 设置了以下内容等：

seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

seg-4d208b6c0eb8 = 天

seg-cc723fa4fafa = sgp4 (TLE)

seg-0fd3c58fde09 = 引擎为 scenarios/ephemeris.toml（类型 ephemeris）生成的图表

seg-d291f20074f0 = <b>VALIDATED</b> 轨道路径上由两部分 UT1 儒略日得到的地球自转，使地固位置保留单个 f64 日期所丢失的微秒量级精度（{ "2020" } 年前后约 { "3e-9" } rad）：jd2::gmst82（IAU { "1982" } GMST，即 TEME 约定，作用于两部分），cio:

seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4、Cowell 6-DOF + 摄动、批处理/序贯 OD。参考基准（oracle，ExternalDataset）：AIAA 2006-6753 SGP4 验证向量

seg-7cf505668c3c = <b>VALIDATED</b> IAU 2006/2000A 岁差章动、CIO GCRS↔ITRS、闰秒时标。参考基准（oracle，ExternalDataset）：IAU SOFA / ERFA 参考向量；Vallado AIAA 2006-6753（{ "0.1" }–{ "4" } mm）

seg-f19ce44dc0c0 = 主题页面：<a1>AGENCY-ORBIT-VALIDATION.md</a1>

seg-a8ea4ba6e244 = <s1>上一页</s1>eo-radiometry

seg-971864553611 = <s1>下一页</s1>fusion
