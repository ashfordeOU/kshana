# docs--kinds-constellations-coverage-and-geometry: translations (zh-Hans)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = 类别

seg-e7dad1a1ecba = 太阳系内任意天体周围的定位：围绕按名称选定的中心天体（火星、月球、木卫二、木卫三、土卫六以及太阳系目录中的其余天体）运行的轨道器或表面着陆器，利用该天体周围一个小型 Walker 导航星座（二体轨道，含该天体自身的 J2 长期漂移，用户时钟未知）的单向伪距进行导航，并可选地利用来自地球的无时钟深空双向测距，其方向和距离在每个历元取自解析的太阳系星历。视线被天体的平均球面遮挡，表面用户还需要满足仰角遮蔽。每个历元：可见的中继星、地球是否在天体边缘之上、仅星座的 GDOP 和 PDOP（几何精度因子和位置精度因子）、带与不带地球一行的形式化一倍标准差位置不确定度，以及两种情形下带随机种子的高斯-牛顿最小二乘定位的误差；整个运行期间：可用性、地球可见性、PDOP 中位数、RMS 误差和形式化 sigma 中位数，以及该历元的地球到天体光行时、往返时间、夏皮罗延迟和太阳夹角。MODELLED：中继星轨道、噪声水平和瞬时测量模型都是建模选择，没有对照任何任务的导航数据进行独立验证；天体常数取自 body.rs 中引用的已发布数值，地球几何沿用太阳系星历的标签。

seg-6f341acbe994 = 引擎为 scenarios/mars-orbit-pnt.toml（类型 body-pnt）生成的图表

seg-de173c9f4034 = 大规模星座设计：i: T/P/F 约定下的 Walker delta 和 Walker star 构型（节点分布在 { "360" } 或 { "180" } deg 上，面内间隔 { "360" }<em>P/T，面间相位偏移 { "360" }</em>F/T）、显式的根数列表和多壳层设计，一次运行中有多个星座，围绕地球、月球、火星或任何其他行星、冥王星或主要卫星，使用 body 模块中的常数（太阳系和 body-pnt 类型使用的是同一些常数）。来自已发布标称根数的预设：gps-baseline 和 gps-expandable（GPS Standard Positioning Service Performance Standard 第 5 版 { "2020" } 的 { "24" } 个轨位和六对可扩展的前后轨位，表 3.2-1 至 3.2-3）、galileo（Walker 24/3/1，{ "29 599.801" } km 和 { "56" } deg，Galileo Open Service Service Definition Document 第 { "1.1" } 版，表 { "1" } 和 { "23" }）、beidou 和 beidou-meo（Walker 24/3/1，{ "21 528" } km 和 { "55" } deg，外加位于东经 { "80" }、{ "110.5" } 和 { "140" } deg 的三颗地球静止卫星，以及倾角 { "55" } deg 的三颗倾斜地球同步卫星，BeiDou Open Service Performance Standard { "3.0" } 第 { "4.1" } 节；MEO 相位和东经 { "118" } deg 的倾斜地球同步穿越是由模型计算得出的，因为标准没有给出）以及 glonass（24/3/1，{ "19 100" } km 和 { "64.8" } deg，取自 GLONASS Interface Control Document 第 { "5.1" } 版第 { "5.2" } 节的轨位公式）。覆盖与精度因子：在纬度/经度网格和带仰角遮蔽的采样窗口上，给出每个单元的可见卫星数、GDOP、PDOP、HDOP 和 VDOP，每个单元的可用性（PDOP 不高于某一阈值时可定位，默认为 { "6" }），全球（按面积加权）可用性和最差站点的可用性，每个星座一个接收机钟，除非 clock = "common"。它可扩展到数千颗卫星：可见性是对每颗卫星覆盖半角的点积，且每个历元按星下点纬度对卫星分带，因此网格的一行只测试可能可见的那些卫星；报告会统计省去的配对测试次数。JSON 中带有网格图和降采样的逐卫星星下点轨迹。VALIDATED：Walker 生成器对照 Galileo OS SDD 表 { "23" } 和 GLONASS ICD 轨位公式，GPS 预设对照 SPS PS 表 3.2-1 已发布的赤道穿越列，GPS 基线全球 HDOP 分布对照 SPS PS 附录 B（中位数 { "0.94" }，{ "95" }% 为 { "1.25" }，均值 { "0.96" }，容差 { "0.03" }）。MODELLED：二体轨道（可选长期 J2）、球形天体、仅几何可见性（无信号功率、健康状态或地形），以及不同系统之间的相对相位，它并不是任何真实日期的快照。

seg-899e728ad9bd = 引擎为 scenarios/leo-pnt-mega-shell.toml（类型 constellation-design）生成的图表
