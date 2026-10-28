# docs--kind-lunar-beacon: translations (zh-Hans)

seg-1f17ef6a853e = 引擎v{ $version }的场景类型，所属类别为<a1>月球与地月空间</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-1c1eeb2dcaa0 = 类别页面：<a1>月球与地月空间</a1>

seg-3c4e3d725bb6 = 来源：<c1/>

seg-5e402fc935cb = <c1/>（场景类型）

seg-142ad48fe422 = 月球轨道导航服务的地面信标增强，以可运行的前后对比表给出。南极地区的用户在天空中很窄的一块区域内只看到稀疏的轨道卫星集合，因此测距几何病态；少数经测量的地面信标（SURVEYED SURFACE BEACONS）提供全轨道卫星集合所缺少的低仰角、宽方位角的视线行，水平精度因子随之大幅下降。该场景在同一历元报告三种配置——仅卫星、卫星加可见信标，以及作为达到同样几何的另一条途径的更大星座——每种配置都给出其可见源数量、完整的DOP，以及以米（METRES）计的实际1-sigma精度，该精度由DOP乘以每个信标的用户等效测距误差得到，后者按钟同步、多路径和测量三项的平方和开方合成。信标可见性取无大气月球的双高度几何地平线（没有大气，因此界限是精确的），DOP的组装是同一个核心算法，并在tests/dop_reference.rs中与gnss_lib_py交叉检查。此类型存在的原因（WHY THIS KIND EXISTS）：其背后的模块自L08/L09起就在引擎中，并已对照独立的DOP路径检查过，但无法通过运行触达——没有类型，没有分派分支，没有随附文件。README宣称了这项能力，而验证矩阵中完全没有它的行（NO row），因此它在文字中被声称、在台账中却未被声称，同时在引擎中又无法触达。默认值是已有已提交的金标准结果的几何（位于 -80度、天线{ "2" } m的用户，三个信标位于 -80/0、-79/+{ "60" }和 -79/-60，高{ "2" } km，一个由六颗卫星组成的示意性LCNS快照，t={ "0" }，{ "5" }度截止角），因此不带参数的运行复现的是参考基准已经覆盖的表格，而不是凭空编造新数字。MODELLED：星座设计、信标布置以及每一项误差预算量级都是示意性的输入，不是已部署的测量，也不是实测链路；只有DOP的算术、地平线闭式以及sigma = DOP x sigma_URE的关系有外部依据。不是服务性能承诺。

seg-22ea11fcf367 = <c1/>的一次运行概括如下：月面信标增强 — 截止角{ "5.0" }度，历元 +{ "0" } s，每个信标的sigma_URE { "1.1576" } m { "6" }颗卫星，无信标 卫星{ "5" }个 信标{ "0" }个GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" }实际1-sigma：3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" }颗卫星 + { "1" }个可见信标 卫星{ "5" }个 信标{ "1" }个GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" }实际1-sigma：3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" }颗卫星，无信标 卫星{ "19" }个 信标{ "0" }个GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" }实际1-sigma：3D { "2.804" } m H { "1.181" } m V { "2.544" } m信标使PDOP改善2.355x；改用更大的星座则为4.002x MODELLED：星座、信标布置和误差预算都是示意性的输入。其下的DOP核心算法是经gnss_lib_py验证的那一个，信标地平线是L01闭式。

seg-25522022cf9a = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>

seg-acfef3f325e4 = 示例<c1/>设置了下列内容等：

seg-a53e353706f6 = 引擎为scenarios/lunar-beacon.toml（类型lunar-beacon）生成的图表

seg-89e2f6bb2540 = <b>MODELLED</b>月面用户的信标增强精度因子：可见卫星的视线行与可见地面信标的测距行被拼接成一个设计矩阵，并通过共用的DOP核心算法求值，且 测试：<a1>validate_p2_beacon_before_after_table.rs</a1>。

seg-654a3554b1e3 = <b>MODELLED</b>月面用户的信标增强精度因子：可见卫星的视线行与可见地面信标的测距行被拼接成 . 参考基准（oracle，ReferenceImpl）：DOP的算术是crate::orbit::dop核心算法，已在tests/dop_reference.rs中对照gnss_lib_py另行作外部验证；本行不沿用那一行的状态。信标可见性地平线是L01闭式，sigma = DOP x sigma_URE是标准的GNSS关系（Kaplan和Hegarty，Understanding GPS/GNSS，第{ "7" }节）。在本行内部，增强本身是对照一个独立的

seg-4d1fc06e907b = MODELLED：星座设计、信标布置以及每一项误差预算量级都是示意性的输入，不是已部署的测量，也不是实测链路；只有DOP的算术、地平线闭式以及sigma = DOP x sigma_URE的关系有外部依据。（类型目录（<c1/>））

seg-aaafed663400 = 有依据的与没有依据的（WHAT IS ANCHORED AND WHAT IS NOT） 有依据：DOP的组装是在tests/dop_reference.rs中与gnss_lib_py交叉检查的核心算法；信标可见性是无大气月球的双高度几何地平线闭式（没有大气，因此没有折射延伸，界限是精确的）；sigma = DOP x sigma_URE是标准关系（Kaplan & Hegarty，Understanding GPS/GNSS，第{ "7" }节）。没有依据 — MODELL（场景文件注释，第{ "40" }至{ "49" }行）

seg-2516c4208769 = 月面信标DOP增强为MODELLED，而非已与独立的外部参考基准核对：对照本代码库中另一套独立的实现检查——独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-ebb9724de60a = <s1>上一页</s1>lunar-attack-surface

seg-ca9b68783354 = <s1>下一页</s1>lunar-differential-pnt

seg-b81e98467952 = <s1>下一页</s1>lunar-descent
