# docs--kind-lunar-surface: translations (zh-Hans)

seg-f942b36a11c4 = 尚未上传到GitHub

seg-51362910dcb7 = 有{ "2" }个内置场景使用此类型；其余的在<a1><c1/></a1>中。

seg-1f17ef6a853e = 引擎v{ $version }的场景类型，属于<a1>月球与地月空间</a1>系列。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，否则某个类型为MODELLED（标签如何获得，见README的“证据”一节）。

seg-1c1eeb2dcaa0 = 系列页面：<a1>月球与地月空间</a1>

seg-6a26b9ab59fe = 主题页面：<a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = 结果标签（引擎给出的）：MODELLED

seg-626ab55f0424 = MODELLED（结果<c1/>）

seg-e66e2ca31e54 = 主题页面：<a1>MISSION-THREAD-LUNAR.md</a1>

seg-bf92597fdba4 = 仅供参考的软件，不是经认证的导航

seg-feea03a2c628 = 来源：<c1/>

seg-6c0eff9f9211 = <c1/>（场景类型）

seg-6c7d25f672fb = MODELLED的地表定位与授时可用性，按站点和季节给出，适用于Artemis级南极站点。对每个站点和季节（一个历元及其后的一个时间窗），报告中继定位（一个ILLUSTRATIVE的LCNS级星座有四颗或更多中继星可见且PDOP低于阈值，计算函数与moonlight-service-volume相同；带地形段时，则用lunar-station-coverage的地形经射线步进得到的天际线）、地球和太阳是否在站点地平线之上（解析的太阳、月球和月球姿态，含天平动，这正是随季节变化的部分），以及授时可用性（有中继星或地球可见），并给出两者均不可见的最长时段，即地表时钟必须守时（holdover）度过的时间。单站点结果与moonlight-service-volume的结果逐位相等。MODELLED：平均自转月球上的示意性开普勒中继星集合；中继星的数值不随季节变化；地形为{ "1200" } m的LOLA裁剪区。未获机构背书；仅供参考的软件，不是经认证的导航设备。

seg-3c13aefe4093 = 运行一次<c1/>的摘要为：lunar-surface | { "4" }个站点x { "4" }个季节 | 定位{ "41" }% 至{ "41" }% | 最差授时可用性{ "100.0" }% | 最长授时间隙{ "0.0" } h (MODELLED)

seg-02bc245c436e = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>

seg-4e5ed02a85e1 = 示例<c1/>设置了以下内容等：

seg-0ceb87f45323 = 南极{ "89.9" }

seg-94a405fadf2d = mci

seg-8c3e0f75ab98 = 原样传递

seg-94b84de6c958 = 引擎为scenarios/lunar-surface.toml（类型lunar-surface）生成的图表

seg-25040e105bf7 = <b>MODELLED</b> <c1/>类型与阶段：每个站点和季节的中继星可用性与PDOP、地球和太阳可见性以及受约束的地表时钟，并带有<c2/>的地形天际线；单站点运行与该类型的结果相等

seg-70f63c99a478 = <b>MODELLED</b> <c1/>类型与阶段：每个站点和季节的中继星可用性与PDOP、地球和太阳可见性以及受约束的地表时钟，并带有地形。参考基准（ReferenceImpl）：在测试中，单站点时与现有类型完全相等，并通过单调性检查。中继星集合为ILLUSTRATIVE，没有与任何地表测量作比较

seg-ab29e0e308d0 = MODELLED的地表定位与授时可用性，按站点和季节给出，适用于Artemis级南极站点。（类型目录（<c1/>））

seg-3f948092eba6 = MODELLED：平均自转月球上的示意性开普勒中继星集合；中继星的数值不随季节变化；地形为{ "1200" } m的LOLA裁剪区。（类型目录（<c1/>））

seg-5b217c0bb606 = 诚实说明：MODELLED。中继星集合是示意性的开普勒集合，月球按平均速率转动（无天平动），与moonlight-service-volume相同；地球和太阳使用解析姿态，因此两个坐标系因这一省略而存在差异。在该模型中，中继星定位数值不随季节变化；地球和太阳的数值则会变化。不声称与任何真实服务或站点一致。仅供参考（场景文件注释，第{ "11" }至{ "15" }行）

seg-958f00c2d647 = 月球极区按站点和季节的地表定位与授时可用性（<c1/>）为MODELLED，而不是经独立验证：它对照本代码库内一个独立的实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-988e99fc26be = <s1>上一页</s1>lunar-station-coverage

seg-625c1973128e = <s1>下一页</s1>lunar-time-budget
