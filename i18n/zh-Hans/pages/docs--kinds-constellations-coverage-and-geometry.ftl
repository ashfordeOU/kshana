# docs--kinds-constellations-coverage-and-geometry: translations (zh-Hans)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = 类别

seg-e7dad1a1ecba = 太阳系内任意天体周围的定位：围绕按名称选定的中心天体（火星、月球、木卫二、木卫三、土卫六以及太阳系目录中的其余天体）运行的轨道器或表面着陆器，利用该天体周围一个小型 Walker 导航星座（二体轨道，含该天体自身的 J2 长期漂移，用户时钟未知）的单向伪距进行导航，并可选地利用来自地球的无时钟深空双向测距，其方向和距离在每个历元取自解析的太阳系星历。视线被天体的平均球面遮挡，表面用户还需要满足仰角遮蔽。每个历元：可见的中继星、地球是否在天体边缘之上、仅星座的 GDOP 和 PDOP（几何精度因子和位置精度因子）、带与不带地球一行的形式化一倍标准差位置不确定度，以及两种情形下带随机种子的高斯-牛顿最小二乘定位的误差；整个运行期间：可用性、地球可见性、PDOP 中位数、RMS 误差和形式化 sigma 中位数，以及该历元的地球到天体光行时、往返时间、夏皮罗延迟和太阳夹角。MODELLED：中继星轨道、噪声水平和瞬时测量模型都是建模选择，没有对照任何任务的导航数据进行独立验证；天体常数取自 body.rs 中引用的已发布数值，地球几何沿用太阳系星历的标签。

seg-6f341acbe994 = 引擎为 scenarios/mars-orbit-pnt.toml（类型 body-pnt）生成的图表

seg-de173c9f4034 = 大规模星座设计：i: T/P/F 约定下的 Walker delta 和 Walker star 构型（节点分布在 { "360" } 或 { "180" } deg 上，面内间隔 { "360" }<em>P/T，面间相位偏移 { "360" }</em>F/T）、显式的根数列表和多壳层设计，一次运行中有多个星座，围绕地球、月球、火星或任何其他行星、冥王星或主要卫星，使用 body 模块中的常数（太阳系和 body-pnt 类型使用的是同一些常数）。来自已发布标称根数的预设：gps-baseline 和 gps-expandable（GPS Standard Positioning Service Performance Standard 第 5 版 { "2020" } 的 { "24" } 个轨位和六对可扩展的前后轨位，表 3.2-1 至 3.2-3）、galileo（Walker 24/3/1，{ "29 599.801" } km 和 { "56" } deg，Galileo Open Service Service Definition Document 第 { "1.1" } 版，表 { "1" } 和 { "23" }）、beidou 和 beidou-meo（Walker 24/3/1，{ "21 528" } km 和 { "55" } deg，外加位于东经 { "80" }、{ "110.5" } 和 { "140" } deg 的三颗地球静止卫星，以及倾角 { "55" } deg 的三颗倾斜地球同步卫星，BeiDou Open Service Performance Standard { "3.0" } 第 { "4.1" } 节；MEO 相位和东经 { "118" } deg 的倾斜地球同步穿越是由模型计算得出的，因为标准没有给出）以及 glonass（24/3/1，{ "19 100" } km 和 { "64.8" } deg，取自 GLONASS Interface Control Document 第 { "5.1" } 版第 { "5.2" } 节的轨位公式）。覆盖与精度因子：在纬度/经度网格和带仰角遮蔽的采样窗口上，给出每个单元的可见卫星数、GDOP、PDOP、HDOP 和 VDOP，每个单元的可用性（PDOP 不高于某一阈值时可定位，默认为 { "6" }），全球（按面积加权）可用性和最差站点的可用性，每个星座一个接收机钟，除非 clock = "common"。它可扩展到数千颗卫星：可见性是对每颗卫星覆盖半角的点积，且每个历元按星下点纬度对卫星分带，因此网格的一行只测试可能可见的那些卫星；报告会统计省去的配对测试次数。JSON 中带有网格图和降采样的逐卫星星下点轨迹。VALIDATED：Walker 生成器对照 Galileo OS SDD 表 { "23" } 和 GLONASS ICD 轨位公式，GPS 预设对照 SPS PS 表 3.2-1 已发布的赤道穿越列，GPS 基线全球 HDOP 分布对照 SPS PS 附录 B（中位数 { "0.94" }，{ "95" }% 为 { "1.25" }，均值 { "0.96" }，容差 { "0.03" }）。MODELLED：二体轨道（可选长期 J2）、球形天体、仅几何可见性（无信号功率、健康状态或地形），以及不同系统之间的相对相位，它并不是任何真实日期的快照。

seg-899e728ad9bd = 引擎为 scenarios/leo-pnt-mega-shell.toml（类型 constellation-design）生成的图表

seg-24266bc264df = 星历与星下点轨迹：传播一颗卫星（TLE→SGP4 或解析轨道），输出其 TEME/GCRS 状态（位置 + 速度）、ITRF/ECEF 位置、WGS-84 星下点纬度/经度/高度，以及逐步长的测站方位角/高度角/距离和距离变化率（多普勒）。卫星来自 <c1/>，或来自带 <c3/> 的解析 <c2/>（两者同时给出时以 <c4/> 为准）；给出 <c5/> 时，<c6/> 取代 TLE 自身的历元作为 t = { "0" }。

seg-0fd3c58fde09 = 引擎为 scenarios/ephemeris.toml（类型 ephemeris）生成的图表

seg-4e31c8daf798 = 台账

seg-44bbec836934 = 来源：<c1/>

seg-34a6079984a7 = 星座、覆盖与几何（场景类型族）

seg-6800289a282d = { "7" } 个场景类型，来自引擎 v{ $version }。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为 MODELLED（标签如何获得，见 README 的“证据”一节）。

seg-d95cc2c1e798 = 专题页面：<a1>CONSTELLATION-DESIGN</a1>、<a2>COVERAGE</a2>、<a3>SOLAR-SYSTEM</a3>、<a4>SKYLINE</a4>。运行一个：<c1/>。所有类型族：<a5>KINDS.md</a5>。

seg-f044822c2fab = 引擎为“星座、覆盖与几何”类型族的各类型生成的图表缩略总览

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-e2450f89bcc6 = 星历与星下点轨迹：传播一颗卫星（TLE→SGP4 或解析轨道），输出其 TEME/GCRS 状态（位置 + 速度）、ITRF/ECEF 位置、WGS-84 星下点纬度/经度/高度，以及每步的

seg-d021c1b23dbc = 大规模星座设计：i: T/P/F 约定下的 Walker DELTA 和 Walker STAR 构型（节点分布在 { "360" } 或 { "180" } 度上，面内间隔 { "360" }<em>P/T，面间相位偏移 { "360" }</em>F/T），显式

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-f6914ea43dba = 某一历元的整个太阳系，用于任意天体周围的 PNT（定位、导航与授时）。

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-d71a07d8a59e = 任意太阳系天体周围的定位：围绕按名称选定的中心天体（火星、月球、木卫二、木卫三、土卫六及太阳系目录中的其余天体）运行的轨道器或表面着陆器，导

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-f6b22521b4a4 = 深空火星 PNT：一个模拟的 MARCONI 中继星座（火星静止轨道 + 倾斜轨道中继星，向深空站单向广播 + 双向转发）为一个参考用户导航（转移 / l

seg-cc85d9962c25 = 地面站过境预测：圆轨道的时域可见过境（AOS/TCA/LOS、最大视仰角、时长），以窗口起点处的 SGP4 平均根数表示，针对一个站点，高

seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

seg-a7bd3325080c = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>。可选字段：<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>。

seg-5e8a5e611ba9 = <b>台账：</b>MODELLED { "4" } · VALIDATED { "4" }。完整页面（含输入、结果、证据与局限）：<a1>orbit</a1>。

seg-968c1512151e = 必填字段：<c1/>。可选字段：<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>。

seg-8c5e41cef6fd = <b>台账：</b>VALIDATED。完整页面（含输入、结果、证据与局限）：<a1>ephemeris</a1>。

seg-47aaf1afd6ec = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>。

seg-bacf2a133146 = <b>台账：</b>MODELLED { "1" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>constellation-design</a1>。

seg-e99c2a83034e = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>。

seg-d91ded1df3a2 = <b>台账：</b>MODELLED { "2" } · VALIDATED { "3" }。完整页面（含输入、结果、证据与局限）：<a1>solar-system</a1>。

seg-fe02605b130e = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>。

seg-12bc4b4b4631 = <b>台账：</b>MODELLED { "1" } · VALIDATED { "1" }。完整页面（含输入、结果、证据与局限）：<a1>body-pnt</a1>。

seg-bee590b4c9e7 = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>。

seg-c0394ad71cfe = <b>台账：</b>MODELLED。完整页面（含输入、结果、证据与局限）：<a1>mars-pnt</a1>。

seg-352823f8c5ac = 必填字段：无。可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>。

seg-bb4fa18e50a6 = <b>台账：</b>MODELLED { "2" } · VALIDATED { "2" }。完整页面（含输入、结果、证据与局限）：<a1>passes</a1>。

seg-490ec99e2a38 = <s1>上一页</s1>时钟、授时与守时

seg-90ff7426b999 = <s1>下一页</s1>GNSS 测量、定位与完好性
