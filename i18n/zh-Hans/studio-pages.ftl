# studio-pages.ftl (zh-Hans): translations

# trust/index.html
seg-00334e02e230 = 选择评分卡…

# interference/index.html
seg-01407588c187 = 起始日期（YYYY-MM-DD）

# geometry/index.html
seg-01d2825b9038 = <b>仅供参考的软件，不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }）：船舶航行的责任仍由操作人员承担。</b>DOP、误差椭圆和蒙特卡罗点云是在给定误差模型（相互独立、大小相等、均值为零的高斯测距误差）下的几何关系，并不预测接收机的实际误差；实际误差还包含偏差、多路径和非视距（NLOS）误差。

# geometry/index.html
seg-01e587427a7e = 卫星

# tools/index.html
seg-027283a63016 = 待拟合的加速度计轴

# tools/index.html
seg-04506cef591e = Kshana { "0.35" } 工具

# lunar/index.html
seg-0489ee54e833 = 某一点的<b>覆盖率</b>是百分位误差在精度阈值之内的历元所占的比例。沿某一方位的<b>覆盖半径</b>是覆盖率首次降到 { "95" } % 以下时距台站的距离。

# advanced/index.html
seg-04d1a3ba2b8a = 正在加载引擎…

# geometry/index.html
seg-050a8bfbd422 = LEO 预设

# index.html
seg-05562970ef4b = 训练复盘

# index.html
seg-06486bf15cd4 = <s1>引擎加载中</s1><s2>加载中</s2>

# lunar/index.html
seg-07199d1fe93e = 在此浏览器中运行

# advanced/index.html
seg-085ef6b1be9d = 交互式

# advanced/index.html
seg-08c7323197b0 = 轨道 <s1>地心惯性系</s1>

# advanced/index.html
seg-08e485ae99c4 = 运行历史 <s1>本次会话</s1>

# advanced/index.html
seg-0975b02e3951 = <b>设置</b>其参数

# tools/index.html
seg-0a5e9c73f0f4 = 测试向量 CSV 的起始时间，GST 秒

# advanced/index.html
seg-0b921cae8f01 = 步骤

# tools/index.html
seg-0cad8b4bf3ec = <b>MODELLED，仅供参考。</b>该估计器在系数已知的合成白噪声日志上检验（在 { "10" } % 以内恢复），并未与外部参考基准（oracle）对照。非静止、少于 { "2000" } 个采样或采样间隔不均匀的日志会被拒绝，或给出被阿伦斜率标记的参数。

# trust/index.html
seg-0d0bb4db64fb = 选择接收机日志…

# lunar/index.html
seg-0db07aa507b2 = <b>保护级</b>（HPL、VPL）在给定的完好性风险下界定水平和垂直误差；与之比较的告警限值仅为示意，因为不存在公开的取值。

# geometry/index.html
seg-0dd930409856 = 高度截止角，度

# replay/index.html
seg-0f1851a7dcde = 提前显示结论

# tools/index.html
seg-0f4b846a7f39 = 计划相对 UTC 的偏移，小时（CEST：{ "2" }）

# advanced/index.html
seg-0f6201634748 = 完整结果 <s1>JSON</s1>

# holdover/index.html
# c1: kshana holdover-test.toml
seg-0fc90fa85d7f = 来自 <c1/> 的结果文件。曲线依据引擎写入其中的记录绘制。仅在此读取，不上传任何内容。

# replay/index.html
# c1: kshana nmea-scenario
# c2: receiver-trust
seg-0ff133070d02 = 这些运行是由引擎生成的<b>合成文本</b>（<c1/> 和海事信任演示日志）。评分和等级是引擎的 <c2/> 对每路数据流的输出，为 <b>MODELLED</b>：阈值已在引擎的评分模型中说明，没有外部参考基准（oracle）将其与真实接收机核对。

# trust/index.html
seg-136566d2e34c = IMU 格式

# geometry/index.html
seg-13e8e5460280 = 几何

# tools/index.html
seg-1461a3868bf5 = 受信任的默克尔根（{ "64" } 位十六进制数字）

# tools/index.html
seg-14baa95aa211 = 计划年份（{ "0" }：未给出）

# interference/index.html
seg-14e847391f84 = kystverket

# advanced/index.html
seg-1652b4fc1787 = 绘图

# trust/index.html
seg-186b5b52ddc2 = 首个采样处的航向，真航向度数

# trust/index.html
seg-18d7538bc56d = 监测器

# index.html
seg-1ad55eee4e81 = <b>干扰机会对我的接收机造成什么影响？</b><s1>一幅无线电瀑布图</s1>

# trust/index.html
seg-1ae32cd48edc = 海事信任度

# geometry/index.html
seg-1ddd90e01e41 = 街道宽度，米

# tools/index.html
seg-1ee9fc235717 = <b>仅供参考。</b>这是分析与监测输出，不是经型式认可的导航设备。此处报告的认证状态不是导航完好性服务，不得作为任何导航或安全决策的唯一依据。<b>时间：</b>检查以页面中的时间戳为准。认证只说明数据来自该系统；它不说明数据所经信号的情况，也不说明定位结果的质量。

# trust/index.html
seg-22dc260f0f19 = <b>几何</b>（引擎 { "0.36" } 起的运行）：归为几何的推断，只是对日志所报告天空的陈述，并不表明没有发生攻击。欺骗者可以伪造一个较差的天空；因此，若所述 HDOP 无法由所报告的天空解释，则归为不一致，绝不归为几何。“几何未知”表示日志中没有 GSV 或 GSA；这并不表示天空状况良好。

# trust/index.html
seg-23ab7d124079 = 机体 z 轴向下（NED/FRD）

# replay/index.html
seg-254da3de60fe = <s1>T+{ "0" } s</s1>

# advanced/index.html
seg-26461891d3d8 = 动画 <s1>引擎自身的导出</s1>

# observatory/index.html
seg-2672b7f55371 = 已退化

# geometry/index.html
seg-26c2c51a2409 = 在此粘贴的两行轨道根数：仅在本页面中读取，绝不抓取，也绝不写入地址（至多 { "4" } MiB）

# geometry/index.html
seg-277e0df0547c = 设置

# advanced/index.html
seg-280926ba03ec = 需要按您的设备校准的时钟数字孪生、附带审计级证据包的权衡研究，或闭源集成？这属于 Kshana Pro，按合同提供。<a1>申请评估</a1> · <a2>洽谈商业许可</a2> · <a3>申请研究</a3>

# index.html
seg-2a56e1f52830 = 工具

# tools/index.html
seg-2a9012fd4d5f = 时隙前后的保护间隔，秒

# advanced/index.html
seg-2afa300864a9 = 参数

# interference/index.html
# c1: kshana interference-map
seg-2afb1b2b483b = 打开 <c1/> 依据公开许可的飞机（ADS-B）和船舶（AIS）跟踪数据写出的按日 GeoJSON 文件。每个文件单独绘成一幅地图，其许可、署名和方法显示在旁边。在此打开的文件仅在本页面中读取，绝不上传。

# advanced/index.html
seg-2cbf005ed5cc = 至

# mission-thread/index.html
seg-2cdf436c4e70 = <b>仅供参考的软件。</b>Kshana 不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }），责任仍由操作人员承担。此处每个数字都是 MODELLED：一项给定的输入，或对输入的建模。本页面上没有任何内容是 VALIDATED，也没有经任何机构或项目认证或批准。

# index.html
seg-2d4efde06a1d = <b>证据包</b><s1>检查已签名的证据包，或附加时间戳。</s1>

# interference/index.html
seg-2df7968fe44c = 截止日期（YYYY-MM-DD）

# lunar/index.html
seg-2e5a02a7a13f = 覆盖率

# index.html
seg-2f7f3dd0b2f8 = 星座设计

# tools/index.html
seg-30164b8a6c48 = NMEA { "0183" }

# advanced/index.html
seg-31d58f23c0a2 = 运行

# geometry/index.html
seg-334caeae9fba = Studio

# trust/index.html
seg-334e4b6450b1 = 该演示是<b>合成文本</b>：一份虚构的 NMEA 日志，记录一艘渡轮在示意性的塔林至赫尔辛基航线上航行，途中虚构了一次位置被拖离。它不对任何无线电信号建模，也不是测量结果或海图。

# tools/index.html
seg-33aca285207a = u-blox UBX

# optical/index.html
# c1: optical-atmosphere
seg-35697523899f = 光学授时或测距链路无法穿透厚云，因此每个地面站都有一个可用性上限，再多的余量也无法突破。这是引擎自带的两个 <c1/> 场景，依据其记录的结果绘制：对照该上限的可用性、各目标所需的余量、中断持续的时间、时钟在中断期间保持的授时性能，以及增加站点或改进光学器件能带来什么。

# index.html
seg-358b5ac6fa41 = <b>合规映射（compliance mapping）</b><s1>您的运行结果对照已发布框架能提供哪些证据。</s1>

# advanced/index.html
seg-35ee2f01ec79 = 第二个参数

# advanced/index.html
seg-36dcb1255565 = 场景源文件 <s1>TOML（Tom 的显而易见的最小语言）</s1>

# trust/index.html
seg-36f3531ff640 = 加到 IMU 时钟上的偏移，秒

# advanced/index.html
seg-373bdc3fdcd6 = 下载结果 <s1>报告、JSON、场景、表格和导出文件</s1>

# observatory/index.html
seg-378ee89e4bd3 = 未退化

# trust/index.html
seg-37ea0a422530 = 选择 NMEA 日志…

# advanced/index.html
seg-389a5d0bd567 = 叠加

# advanced/index.html
seg-38ce4c90dd78 = 自

# trust/index.html
seg-39fbb4638eb8 = 在演示中，接收机<b>始终报告有效定位</b>（GGA 质量 { "1" }，RMC 状态 A）。下降的是信任度评分。所报告航迹与真实航迹之间的差距正是该视图的要点。

# geometry/index.html
seg-3acc69472165 = 蒙特卡罗样本数

# tools/index.html
# c1: manifest.json
# c2: manifest.sig
# c3: log-slice.bin
# c4: config.json
# c5: epochs.json
# c6: summary.html
# c7: timestamp.tsr
seg-3b67fc078417 = 证据包是对引擎依据接收机日志所算结果的带签名技术记录，不是法律意见。请选择证据包的文件（<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>，如有则还有 <c7/>）。证据包通过命令行、Python 或 AI 助手工具生成：签名需要私钥，私钥不应经过网页。

# tools/index.html
seg-3c4893f1cc60 = 与参考时间的最大距离，秒

# interference/index.html
# c1: custom
seg-3dc9c835a9ee = 在此浏览器中对 ADS-B 或 AIS 位置报告的 CSV 运行引擎，每个 UTC 日得到一个地图文件，然后在下方查看。行和列在干扰地图指南中有说明。数据仅在本页面中读取，绝不上传；引擎不抓取任何内容。数据集预设需要您依该数据集自身许可所获得的数据；使用 <c1/> 时，由您自行说明许可和署名，它们会写入文件。

# geometry/index.html
seg-3fcfe276902f = 纬度，度

# interference/index.html
# c1: lat,lon
seg-40feef1e2296 = 根据本页面已打开（在此打开或生成）的地图，显示一条计划航线每天有多少处于退化的单元中。请选择一条航线（GeoJSON 线，或由 <c1/> 行组成的 CSV；航路点以直线连接，因此长航段上应增加点），也可限定天数。这不是预报；无人观测的单元不能证明航线畅通。

# lunar/index.html
seg-41fbbeb0884b = 与任何机构无隶属关系，亦未获任何机构认可。

# advanced/index.html
seg-42cdb8e987e6 = 预算

# advanced/index.html
seg-43ed980c95fe = 重置

# geometry/index.html
seg-446a3218ccbb = 时间

# advanced/index.html
seg-44cc0a5abbc3 = 读取结果

# advanced/index.html
seg-4548b0e6bd0e = <b>选择</b>领域和场景

# holdover/index.html
# c1: holdover-test
# c2: docs/TIMING-HIL.md
seg-45ebbf018bf1 = 操作人员从授时系统中断开 GNSS，记下两个时刻（断开、恢复），并保留钟差记录。Kshana 在这两个时刻把记录分段，并<b>对照公开的 ITU-T 模板逐段度量</b>：锁定时的基线、守时（holdover）、恢复。它不会断开或恢复任何东西，只读取该记录。场景类型为 <c1/>（<c2/>）。

# tools/index.html
seg-4807a85cc672 = 静止 IMU 日志（CSV）…

# index.html
seg-49226589c585 = <b>训练复盘</b><s1>生成漂移或压制干扰演练数据流，并复盘教员日志。</s1>

# advanced/index.html
seg-495154bdae91 = 复制嵌入代码 <s1>用于课程页面或维基的 iframe</s1>

# index.html
seg-4b6d98673341 = <b>光学 PNT</b><s1>两个光学大气场景：对照云层上限的可用性、中断和站点分集。</s1>

# interference/index.html
seg-4bc3949d3db6 = AIS（船舶）

# trust/index.html
seg-4cf2ce011002 = <b>仅供参考的软件。</b>Kshana 不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }），也未依据任何性能标准评估。评分和门限只是辅助领航员判断的工具。操作人员仍对船舶的安全航行，以及是否依赖或不再依赖某次定位的决定负责。没有告警的定位并不因此就是良好的定位。

# geometry/index.html
seg-4d20b0cfb7a7 = 地平线

# index.html
seg-4d3b961f22ce = <b>接收机信任度</b><s1>驾驶台能否信任这次定位？为船舶的 NMEA 日志评分。</s1>

# advanced/index.html
# c1: figure_tiers
seg-4f0ecff8525d = 等级是每个数字的验证状态，读取自引擎自身的 <c1/> 块：<b>已验证</b>表示已与独立的外部参考基准（oracle）核对；<b>已建模</b>表示有测试的第一性原理物理计算，尚未经参考基准核对。

# index.html
seg-4f3e10bb0823 = <b>OSNMA 检查</b><s1>已记录的 Galileo 数据是否经过认证，逐个标签检查。</s1>

# replay/index.html
seg-4f96553dab9e = 速度

# geometry/index.html
seg-4fc16cd3208d = 星座

# tools/index.html
# c1: gnss-ins
# c2: jamming
# c3: gnss-sim
seg-51e293a72ec2 = 场景（<c1/>、<c2/> 和 <c3/> 类型带有载体轨迹）

# geometry/index.html
seg-52c90dfbfe07 = 转到

# advanced/index.html
seg-572de40d1586 = <b>初次使用？</b>请按编号步骤操作：{ "1" } 选择场景，{ "2" } 设置其参数，{ "3" } 运行，{ "4" } 读取关键数字和面板，{ "5" } 分享或导出。每个数字都是引擎自身的输出。

# advanced/index.html
seg-583dc9ff6178 = 库

# advanced/index.html
seg-593bbe59f733 = 面板

# tools/index.html
seg-59b0b20d916b = Android GNSS 记录器

# index.html
seg-59dab91507b5 = 一个在浏览器中运行的定位、导航与授时仿真器。不上传任何内容。<s1>请选择一个问题，或从下方结果开始。</s1>

# advanced/index.html
seg-5a140d5f43b1 = 导览

# trust/index.html
# c1: session.result.json
# c2: --json trust.jsonl
# c3: t_s,true_lat_deg,true_lon_deg
seg-5b054f718a73 = 选择结果 JSON（<c1/>）或实时 JSON 行（<c2/>）。数据流不含位置：请添加其来源的 NMEA 日志以绘制航迹。真值文件（<c3/>）仅存在于合成数据，并会加上真实航迹。

# advanced/index.html
seg-5c28f6c1775a = 运行报告 <s1>由引擎写出</s1>

# lunar/index.html
seg-5c306feeac2d = 修正后的百分位误差，对照阈值

# geometry/index.html
seg-5ca69f1f6635 = 画笔宽度

# index.html
seg-5ce2c22f6627 = 在高级视图中打开

# tools/index.html
# c1: *.result.json
# c2: *.toml
seg-5d30c2bb376f = <b>Kshana 的输出为某项要求提供证据支持（supports evidence for）。它们不能认证某个产品，不能证明其符合某一框架，也不能使其合规性成立。</b>Kshana 不是合格评定机构。要求文本是转述的，绝不照搬原文。请选择结果文件（<c1/>），也可选择与之并列的场景文件（<c2/>，按名称匹配）。

# advanced/index.html
seg-5d4e98c5f740 = 领域

# optical/index.html
seg-5dceab2b33fd = <b>模型输出。</b>此处一切均为 <b>MODELLED</b>：云气候、时钟类别和技术都是给定的假设（这些站点是示意性的，并非任何数据集或地点的实测天气），数值结果是与实现相同公式的独立程序核对的，而不是与大气核对的。时间序列是依据给定站点模型的一次带种子的抽样，并非气候。<b>仅供参考的软件。</b>Kshana 不是经型式认可的导航设备，这也不是经认证的可用性。

# lunar/index.html
seg-5ddc79f228f8 = 月球参考站

# advanced/index.html
seg-5e1e7483eb79 = 下载

# advanced/index.html
seg-60ac985235de = 无（折线图）

# index.html
seg-613697670501 = 方法

# geometry/index.html
seg-6144da0bfed4 = 选择站点、时间，以及全球导航卫星系统（GNSS）与低地球轨道（LEO）层的组合，绘出遮挡视线的天际线，即可看到精度因子（DOP）及其所隐含的位置误差。每个数字都来自在此浏览器中运行的 Kshana 引擎。<a1>这说明了什么</a1>。

# tools/index.html
seg-61e5733012cf = 挪威 Jammertest 发布测试目录和发射计划。Kshana 将其视为<b>计划真值</b>，即计划所述的时隙，而非记录下的实际播发时间，并据此为接收机信任度运行评分：每项测试是否被检测到、延迟多久、是否恢复，以及哪些告警落在所有时隙之外。请选择您自行下载的目录和计划文件（Kshana 不附带这些文件）以及一份接收机日志。一切都在此浏览器中运行；不上传任何内容。

# index.html
seg-6250e4ec851e = Kshana Studio

# advanced/index.html
seg-62a3d528203d = <b>读取</b>关键数字和面板

# geometry/index.html
seg-62b794e2dfee = 经度，度

# index.html
seg-636556347905 = <b>试验台导出</b><s1>面向实验室模拟器的运动文件和事件文件。</s1>

# index.html
seg-64a9035e2d0d = <b>干扰观测站</b><s1>打开某一天的观测站文件并读取：三种状态，不含成因，不上传任何内容。</s1>

# index.html
seg-65296b223493 = Kshana 以 AGPL-3.0（GNU Affero 通用公共许可证）开源，并提供商业许可。由 Ashforde® 出品。每个数字都标有其证据等级；除非标注为已验证，否则 <s1>Kshana Studio</s1> 的授时、完好性和安全数字均为已建模。引用方式：doi:10.5281/zenodo.20528627。

# trust/index.html
# c1: $PKSHT
# c2:
seg-672ddb26b9f5 = 最新 <c1/><c2/>

# geometry/index.html
seg-68235723782a = 天空图

# observatory/index.html
seg-68b7fdfafd42 = 日

# advanced/index.html
seg-6935c9c381b3 = 历史

# index.html
seg-6af0b916714c = <b>驾驶台回放</b><s1>同一时钟上的两次合成运行：航迹、信任度评分、实时天空图和结论。</s1>

# tools/index.html
seg-6c2d8128925a = 测试向量 CSV

# index.html
seg-6cb7a787ac67 = 参考文献

# advanced/index.html
# c1: ⌘↵
seg-6cb7b1848b26 = 运行<c1/>

# tools/index.html
seg-6d93ea33536f = 选择文件…

# advanced/index.html
seg-6ddf1dc69523 = 证据

# index.html
seg-6f2cf14d4623 = 干扰观测站

# advanced/index.html
seg-6f65cbd0e1f7 = 地图上的 GeoJSON 导出

# index.html
seg-6f7a465c0685 = 导出

# observatory/index.html
seg-705d50a526aa = 显示

# advanced/index.html
seg-70c2a1794fd5 = 时钟稳定度 <s1>重叠阿伦偏差 σ<s2>y</s2>(τ)</s1>

# trust/index.html
seg-7215c8a86474 = 选择 IMU 文件…

# geometry/index.html
seg-740a03285718 = 用户等效测距误差（σ<s1>UERE</s1>），米

# holdover/index.html
seg-74a38bf4a554 = <b>是对照模板度量，不是符合性声明。</b>结果为 <b>MODELLED</b>：阶跃逻辑、直线拟合和恢复规则都在由答案已知的公式构造的记录上检验，没有任何实验室守时（holdover）数据经外部参考基准（oracle）评分。模板转录自可免费下载的 ITU-T 建议书，此处没有任何内容表明某个时钟或系统满足或依据任何建议书获得批准。两个时刻是操作人员的陈述，未经核实。两个示例中的记录是为示例生成的，并非测量结果。<b>仅供参考的软件。</b>Kshana 不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }），也不是经型式认可的授时设备。

# geometry/index.html
seg-74b3e264b7b7 = <b>天际线</b>是遮挡天空的物体：建筑、码头、起重机或山体侧面。位于其后的卫星不被使用。请选择一个预设（示意性尺寸，并非任何真实地点的测量），以宽度和建筑高度描述街道峡谷，或在天空图上自行绘制。天际线只会把卫星从视线中移除，别无其他：不含反射、衍射或多路径。

# geometry/index.html
seg-74f66a466b26 = <b>这是具有代表性的天空，并非该日期在该地点的天空。</b>星座是引擎的标称预设，其相对相位来自不同的参考历元。

# advanced/index.html
seg-76a214e74ae5 = 能力

# tools/index.html
seg-76f892729439 = 完整日志，用于核对证据包的切片（可选）

# index.html
seg-77aef8722995 = 光学 PNT

# advanced/index.html
seg-781a33f8799b = 文档

# holdover/index.html
seg-7881bdeae169 = 守时（holdover）测试

# tools/index.html
seg-79475ccedb0f = 计划文件（JSON）…

# observatory/index.html
# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: .incidents.json
# c3: .manifest.json
# c4: .png
seg-79cc3b5f93b8 = 请一并选择一天或多天的文件：<c1/>（必需）、<c2/>、<c3/> 和 <c4/>。文件在此浏览器中读取。

# interference/index.html
seg-7c938f98aae2 = 自定义（说明许可）

# tools/index.html
seg-7cb5ffdad54f = 选择证据包文件…

# advanced/index.html
seg-7db3c895178e = 各卫星的 C/N0 <s1>载噪比密度，dB-Hz</s1>

# tools/index.html
# c1: UBX-RXM-SFRBX
# c2: kshana osnma verify --json
seg-7e5af60790ef = 加载已记录的 u-blox <c1/> 文件或纯 I/NAV 页文件，按卫星和按标签查看数据是否经过密码学认证，以及某项检查失败的原因。也可以打开 <c2/> 写出的 JSON。仅限合成样本和官方向量样本。

# geometry/index.html
seg-7f3e9c6e1737 = 街道方位角，度

# lunar/index.html
seg-7f92d408cc1c = 着色依据

# tools/index.html
seg-7fc355b93fb4 = Kshana 写出载体运动、NMEA、航路点和事件时间。它<b>不产生信号</b>：这里没有任何内容合成或发射射频或基带波形，事件只是带标签的时间区间，而不是制造干扰的方法。仅在获得授权的场合运行模拟器。

# tools/index.html
seg-8000f1fec7f7 = <b>MODELLED，仅供参考。</b>时隙取自计划，因此检测概率是下界；没有外部参考基准（oracle）说明发射机何时开启。评分卡描述的是一份日志，绝不是某个产品。带签名的评分包通过命令行生成（需要签名密钥）。

# index.html
seg-8080417a0a93 = <b>AI 助手</b><s1>通过 MCP 服务器，在您的助手中使用 Kshana。</s1>

# index.html
seg-80f3f0aae42c = 干扰地图

# advanced/index.html
seg-8209cc272c06 = 复制分享链接 <s1>确切的场景，保存在链接中</s1>

# geometry/index.html
seg-82128deeddae = 随机种子

# tools/index.html
seg-828bb842a924 = z（垂向）

# geometry/index.html
seg-83a2d13c9c59 = 误差模型

# tools/index.html
seg-84dce60cabea = 或您自己的场景文件

# geometry/index.html
seg-84ff88576203 = 站点

# tools/index.html
seg-8579207ae2e5 = 验证

# index.html
seg-85cfd83c90de = 场景文件 <s1>TOML（Tom 的显而易见的最小语言）</s1>

# lunar/index.html
seg-85ed2fa9eba5 = <b>它省略了什么。</b>台站与用户共有的误差相互抵消；剩下的随两者之间的距离增大，再加上台站的测量误差、改正数的龄期和链路的舍入。超出高度截止角的地形遮挡、多路径和接收机均未建模。每个数字都是在给定公开假设下的 MODELLED，并不说明任何真实系统的表现。

# replay/index.html
seg-861fbd3d2940 = 真实航迹

# geometry/index.html
seg-864768729ecd = <b>它省略了什么。</b>天空只具代表性：是相位来自不同参考历元的标称星座，并非某一日期的真实卫星或其健康状况。不含信号强度、多路径或干扰。这些数字是 MODELLED，没有在该站点用接收机验证，并不说明真实接收机的表现。

# index.html
seg-8673fda7dbe4 = 全部问题

# interference/index.html
seg-86c668236bcd = 署名

# tools/index.html
seg-87aff08f344c = 布局

# advanced/index.html
seg-8882688380a5 = 完成

# lunar/index.html
seg-888d7f02078c = 打开结果文件…

# advanced/index.html
seg-89a86adcc181 = 取消

# index.html
seg-8b65ea97e819 = 月球基础设施

# tools/index.html
seg-8ccd96682117 = 带表头行的 CSV（t_s, gx, gy, gz, ax, ay, az）

# index.html
seg-8e5813cedc59 = 接收机信任度

# advanced/index.html
seg-8e74b20972cc = 分享或导出

# advanced/index.html
seg-8ea98d881360 = 比较运行 <s1>并排比较已固定的运行</s1>

# training/index.html
seg-8ea9c17dc6b0 = <b>仅限训练和测试。</b>此日志所属的数据流是合成的。绝不能把它们输入船舶的实时导航系统。<b>仅在复盘时显示此日志：</b>它会告诉船员注入了什么。它不是经型式认可的设备，也不说明任何接收机或系统面对真实干扰时的表现。

# trust/index.html
# c1: kshana jammertest score
seg-90ecc8f95c90 = 打开 <c1/> 写出的评分卡：依据已发布测试计划的计划时隙为接收机信任度运行评分，逐项测试（已检测到、延迟、漏检、无法评估）给出延迟和恢复情况，并给出时隙之外的虚警。时隙取自计划，而非记录下的实际播发时间，因此每个数字都是 <b>MODELLED</b>。文件仅在此读取，绝不上传。

# advanced/index.html
seg-90eeeb0abcbd = 任务

# advanced/index.html
seg-9204b8664c7a = TDEV <s1>时间偏差</s1>

# tools/index.html
seg-92c87f96cc3b = 目录（JSON）…

# lunar/index.html
seg-9378da73161e = 覆盖率

# index.html
seg-940ff105c3a4 = 任务线程

# geometry/index.html
seg-944448bc90f8 = 天线高度，米

# advanced/index.html
seg-95a175345436 = 引导式

# lunar/index.html
seg-96947a209b1a = 网格点上的<b>修正后误差</b>，是在应用台站改正数之后，用户三维位置误差在所有可用历元和蒙特卡罗试验上的指定百分位（{ "95" } %，除非文件另有说明）。<b>未修正</b>误差是用相同随机抽样、不应用改正数得到的同一百分位；二者之比即改进因子。

# interference/index.html
seg-97c316c29fa6 = <b>这是什么，不是什么。</b>这是对已发布的位置报告在过去某一天呈现情况的描述。它不是对任何接收机的测量，不是预报，也不能证明存在干扰：退化或异常的单元有多种可能成因，列在每幅地图之下。<b>未绘出的单元是未被观测到的。这不能证明该单元畅通。</b>仅供参考的信息。

# advanced/index.html
seg-99e01fb5fac5 = 关闭

# index.html
seg-9a71c933f4ad = <b>月球台站</b><s1>月球南极附近的参考站能提供怎样的精度，在哪里？MODELLED。</s1>

# ssv/index.html
seg-8edfb2d56071 = 本实现与<em>The Interoperable GNSS Space Service Volume</em>（联合国外空事务厅，{ "2018" }）中各表的预先登记比较，第 { "1" } 次运行；该文本身是仿真，而非测量。大多数判据<b>未达到</b>，未达到的情况均有记录。该变体是诊断，不是新的结论。

# index.html
seg-9c1fc0ddcc14 = 引擎加载中。您已可浏览此结果。

# advanced/index.html
# c1: ↓
# c2: ↵
# c3: ⌘↵
seg-9c28d67257b7 = <c1/> 移动<c2/> 打开<c3/> 运行

# tools/index.html
seg-9c7eb1d43601 = 日志格式

# advanced/index.html
seg-9cebd87d7cb3 = 守时（holdover）<s1>GNSS 丢失后的误差</s1>

# advanced/index.html
seg-9d3f3d06a1e9 = 全部字段

# tools/index.html
seg-9d56e41f9b35 = 受信任的公钥，每行一个，格式为 ID:TYPE:HEX

# holdover/index.html
seg-9e02f1f28e0d = 打开结果…

# tools/index.html
seg-9e98e0ba70a3 = 恢复保持时间，秒

# lunar/index.html
seg-9ea513d25c6c = 在此运行的输入

# geometry/index.html
seg-a11e88108e1c = <b>误差椭圆</b>是由几何协方差得出的水平误差，即 σ<s1>UERE</s1>² 乘以 DOP 矩阵的东-北分块：沿卫星约束最弱的方向更长。它按 1-sigma 和 { "95" } %（大 { "2.448" } 倍）绘制。<b>蒙特卡罗点云</b>是在同一几何下带种子的随机测距误差所得的大量最小二乘解；其 RMS 显示在 σ<s2>UERE</s2> × HDOP 旁边，并给出落在 { "95" } % 椭圆内的点所占比例。相同的随机种子总是给出相同的点云。

# tools/index.html
seg-a12c3181b54f = 普通页面

# holdover/index.html
seg-a13eab564243 = MTIE

# optical/index.html
# c1: kshana scenarios/optical-atmosphere-network.toml
seg-a27cd1efd1e0 = 您可以在 Studio 中自行运行这些场景（高级视图，“穿过大气的光链路”），或使用 <c1/>。

# index.html
seg-a39633d5b858 = <b>我能信任自己的定位结果吗？</b><s1>{ "12" } 小时内的完好性</s1>

# lunar-infra/index.html
seg-a3e4a0eed763 = <b>仅供参考的软件。</b>Kshana 不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }），也未依据任何性能标准评估。每个数字都带有台账为其记录的标签（<b>MODELLED</b>，除非使用了外部参考基准（oracle））；它是辅助判断的工具，不是关于任何地点、任务或事件的结论。

# index.html
seg-a763be7ea9dc = <b>在地球上任何地方，我能看到多少颗卫星？</b><s1>下方显示</s1>

# advanced/index.html
seg-a86ce24d81de = 频段

# trust/index.html
# c1: kshana receiver-trust
seg-a96454c73df8 = 打开一艘船舶的 <c1/> 运行。Kshana 依据接收机已放到总线上的信息，为每次定位打 { "0" } 到 { "100" } 分，并说明哪些检查拉低了分数。在此打开的文件仅在本页面中读取，绝不上传。

# geometry/index.html
seg-a9ef52ece457 = 天际线

# advanced/index.html
seg-aae75f3d3aa5 = 选择

# tools/index.html
seg-ab7707938042 = 签名者的公钥（{ "64" } 位十六进制数字，经由另一途径从签名者处获得）

# advanced/index.html
seg-ac17942f6859 = Kshana <s1>Studio</s1>

# interference/index.html
seg-ad64a2924107 = 陆地多边形（AIS，可选）…

# tools/index.html
seg-ae381f746364 = EuRoC MAV imu0 data.csv

# observatory/index.html
seg-aeb5496025cc = 全部状态

# observatory/index.html
seg-aed6b80b551b = 事件

# advanced/index.html
seg-af4ccbe11812 = 主题

# tools/index.html
seg-aff1d135221c = RINEX 观测文件

# interference/index.html
seg-b022a11dd8f7 = 单元大小，度

# tools/index.html
seg-b15b4194ca66 = 功能

# tools/index.html
seg-b1659454ecd9 = 接收机日志…

# interference/index.html
seg-b19953c7935c = ADS-B（飞机）

# geometry/index.html
seg-b1a61b70c1f4 = 右侧建筑高度，米

# trust/index.html
seg-b1cde8d570b5 = 按船舶评分（移动平台，{ "0" } 到 { "100" }）

# tools/index.html
seg-b21dccf8bbaa = 替换现有令牌

# index.html
seg-b2f5c73a80ac = 空间用户 GNSS

# trust/index.html
seg-b4bf08d8b815 = 仅显示退化和不受信任的

# replay/index.html
seg-b54ecd186a7f = 时刻

# training/index.html
seg-b5765678da41 = 库中的场景是<b>合成文本</b>，其位置、日期和航迹均为虚构。其背后没有任何真实船舶、运营方或记录。

# training/index.html
# c1: *.instructor.json
# c2: kshana nmea-scenario
seg-b63ff9605b69 = 打开 <c2/> 在训练数据流旁写出的教员日志（<c1/>）。它显示真实航迹与接收机所报航迹的对比、注入了哪些事件及其时间，以及接收机对其定位、信号、卫星和时间的说法。在此打开的文件仅在本页面中读取，绝不上传。

# geometry/index.html
seg-b6af4a84da50 = 针对所选 σ<s1>UERE</s1>，由几何协方差得出的误差椭圆，按 1-sigma 和 { "95" } % 绘制（均来自引擎），叠加在带种子的最小二乘解蒙特卡罗点云之上。东向在右，北向在上，单位为米。

# index.html
seg-b728f4816263 = <b>空间用户 GNSS</b><s1>远高于卫星的航天器仍能使用哪些导航信号，以及星载滤波器和编队利用这些信号能做到什么程度。</s1>

# tools/index.html
seg-b7b26b97afbd = <b>仅供参考的软件。</b>Kshana 不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }），也未依据任何性能标准评估。其评分、认证状态和导出文件是辅助判断的工具，也是引擎所算结果的记录。它们不是认证，不是法律意见，也不是关于任何事件的事实认定。

# tools/index.html
seg-b7db2572d40b = u-blox UBX (SFRBX)

# interference/index.html
seg-b966dd26caa6 = 数据集

# interference/index.html
seg-ba963d8caa19 = 许可网址

# tools/index.html
seg-baacf578ad9c = 日志的首个历元，UTC（ISO { "8601" }；日志已说明时留空）

# mission-thread/index.html
seg-baea4e05ad26 = 阶段

# tools/index.html
seg-bb02baa8656c = 运动时间零点的 UTC 时刻

# interference/index.html
seg-bbdd5511b2d4 = 选择航线…

# tools/index.html
seg-bd17501804af = 合成示例

# advanced/index.html
seg-bdb4733dec65 = 版本

# advanced/index.html
seg-bdf48a0aa8ee = 滤波器健康度 <s1>卡尔曼自洽性</s1>

# training/index.html
seg-bfb10aedf165 = 生成

# advanced/index.html
seg-bfd7751a9990 = MTIE <s1>最大时间间隔误差</s1>

# advanced/index.html
seg-c3bab83395bf = <b>分享或导出</b>运行结果

# lunar/index.html
seg-c4f955d5f506 = 可用性

# advanced/index.html
seg-c6251ca94299 = 互操作导出 <s1>CZML、KML、GeoJSON、STK 星历、SigMF</s1>

# observatory/index.html
# c1: kshana interference-map daily <input> --dataset adsb-lol --day 2026-09-15 --out products/
seg-c7c10225eaf2 = 尚未打开任何文件。生成文件的方法：<c1/>。

# observatory/index.html
seg-c7d4820fefdf = 未观测

# trust/index.html
seg-c822f981cfcf = 门限

# index.html
seg-ca95c1e1237a = 需要按您自己设备校准的数字孪生、审计级证据包或闭源集成？这属于 <a1>Kshana Pro</a1>，按合同提供。

# training/index.html
seg-cae10fb9bff8 = 场景

# tools/index.html
seg-cc3ced384846 = 表格编号

# geometry/index.html
seg-cd545b3588cf = <b>精度因子（DOP）</b>表示卫星几何关系把每个测距误差放大了多少倍。卫星分布在整个天空时 DOP 低；卫星扎堆，或都在头顶很高处时 DOP 高。GDOP 是几何 DOP（位置和时间），PDOP 是三维位置 DOP，HDOP 是水平 DOP，VDOP 是垂直 DOP，TDOP 是接收机时钟（时间）DOP。

# lunar/index.html
# c1: lunar-station-coverage
seg-ce9444c95be8 = 位于已测绘站点的差分参考站为其所见的月球导航卫星计算改正数；附近的用户应用这些改正数，二者共有的误差相互抵消。该视图在南极网格和一天的历元上绘出剩余的误差：每个点修正后的百分位误差、在距台站多远处仍处于阈值之内、可用性和保护级。每个数字都来自 Kshana 引擎的 <c1/> 报告。<a1>这说明了什么</a1>。

# geometry/index.html
seg-cf1312ed607a = <b>位置误差 ≈ σ<s1>UERE</s1> × DOP。</b>用户等效测距误差（σ<s2>UERE</s2>）是每个测距的一倍标准差误差，由卫星钟和轨道、大气、多路径和接收机噪声共同构成。乘以 HDOP 得到一倍标准差的水平误差，乘以 VDOP 得到垂直误差。

# interference/index.html
seg-cf349420d4e6 = 选择 CSV…

# replay/index.html
seg-cf759a67ddfd = <b>仅限训练和测试。</b>这些运行是合成的，位置和日期均为虚构；其下方的海岸是真实陆地，仅为辅助定向而绘，不是海图。回放显示注入了什么及其时间，因此应在复盘时使用，而不是在演练期间使用。<b>仅供参考的软件。</b>Kshana 不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }），也不说明任何接收机或系统面对真实干扰时的表现。船舶航行的责任仍由操作人员承担。

# trust/index.html
seg-d090e9a62367 = <b>仅供参考的软件。</b>不是经型式认可的导航设备。告警是对日志的观察，不是对成因的结论；没有告警也不保证定位良好。

# observatory/index.html
seg-d1d22e6868f6 = <b>仅供参考的软件。</b>Kshana 不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }），也未依据任何性能标准评估。<b>退化</b>单元表示当天在该处采样的飞机中，有较高比例报告了较低的导航精度。<b>不归因于任何成因</b>：低精度有多种成因，本页面不指出任何成因，也不指认任何行为方。<b>未观测不等于畅通。</b>它不是实时视图，不是警告，也不是对任何事情的确认，更不是批准、认证或符合性声明。

# tools/index.html
seg-d255f50a38fd = 选择结果文件…

# advanced/index.html
seg-d26c2ce37261 = 视图

# tools/index.html
# c1: .tsr
seg-d286e0e72e96 = 时间戳响应（<c1/>）

# tools/index.html
seg-d2bed15bbabe = 参考时间，GST 秒，来自独立来源

# geometry/index.html
seg-d392016fb917 = 高度，米

# replay/index.html
seg-d39a69ad0054 = 海岸

# geometry/index.html
seg-d3b7d1622ea6 = −{ "1" } h

# interference/index.html
seg-d4a762001549 = 许可

# tools/index.html
seg-d507260dfc9f = 另见

# advanced/index.html
seg-d69e23e80f28 = 开发者

# index.html
seg-d79f4c62922d = <b>没有卫星时，时钟能守时多久？</b><s1>时钟守时（holdover）</s1>

# tools/index.html
# c1: manifest.json
# c2: openssl ts -query
# c3: openssl ts -verify
seg-d88c12129d44 = RFC { "3161" } 令牌把一个时间与 <c1/> 绑定。用 <c2/> 请求该令牌，发送给您的时间戳机构，然后在此附加回复。<b>此处不会检查该机构的签名或证书链</b>：请为此运行 <c3/>。

# advanced/index.html
seg-da60d773bcf2 = 设置

# replay/index.html
seg-db596651e6fd = 放宽到海岸

# geometry/index.html
seg-dbada4043846 = 历元，协调世界时（UTC），{ "2000" } 至 { "2099" }（按 UTC 输入；不做时区转换）

# lunar/index.html
seg-dbef3d1356c6 = 随 Studio 一同提供的记录

# advanced/index.html
seg-dcb3ee3095ea = Kshana 以 AGPL-3.0（GNU Affero 通用公共许可证）开源，并提供商业许可。由 Ashforde® 出品。每个数字都标有其证据等级；除非标注为已验证，否则 <s1>Kshana Studio</s1> 的授时、完好性和安全数字均为已建模。

# tools/index.html
seg-dcc9b1568c20 = 从文件中检测

# tools/index.html
seg-dcf80b355d1d = 测试区域（{ "0" }：未给出）

# geometry/index.html
seg-dd54031b481a = 星座

# advanced/index.html
seg-e02635128fa4 = 预览嵌入模式 <s1>在新标签页中打开</s1>

# advanced/index.html
seg-e02d92584d5a = 在 <s1>Kshana Studio</s1> 中打开

# tools/index.html
# c1: hybrid
# c2: fusion
# c3: [accel_classical]
seg-e0d931fb9fa8 = <c1/> 和 <c2/> 场景是接收传感器噪声参数的仿真，而不是实测序列。这里从<b>静止</b>的 IMU 日志（积分信号的重叠阿伦偏差）中读出这些参数，并写出可直接粘贴的 <c3/> 表，其中注明该日志的 SHA-256。文件在此浏览器中读取，绝不上传。

# advanced/index.html
seg-e0fca417482a = 正在打开场景…

# index.html
seg-e11b46863c7c = 分享

# index.html
seg-e29d48cfd73a = <b>守时（holdover）测试</b><s1>拔掉天线，为守时评分：对照 ITU-T 模板度量的钟差记录。</s1>

# index.html
seg-e2ec2acef569 = <b>月球基础设施</b><s1>月球轨道器和地面站作为导航与大地测量基础设施能做什么，并说明其未达之处。</s1>

# advanced/index.html
seg-e73ea9921fcf = 参数

# lunar/index.html
seg-e7572abf9b3c = 修正后的百分位误差，按其自身范围

# tools/index.html
seg-e8e68a8be0a6 = 该轴静止时读到的比力，m/s²（水平为 { "0" }，垂直约为 { "9.80665" }）

# index.html
seg-eb9ebcd5e957 = <b>干扰地图</b><s1>飞机和船舶在何处报告了退化的导航数据，以及某条航线的暴露情况。</s1>

# geometry/index.html
seg-ebad96f6f920 = +{ "1" } h

# geometry/index.html
seg-ebc83a18d97c = 左侧建筑高度，米

# index.html
seg-ec3cd95a740d = <b>几何</b><s1>在某地能看到哪些卫星，它们的几何关系有多好？绘出天际线。</s1>

# index.html
seg-ed7befb0e9f6 = 打开此结果

# advanced/index.html
seg-ee0ffb5be403 = 在本地<b>运行</b>引擎

# index.html
seg-ee19f3717280 = 月球台站

# trust/index.html
# c1: kshana receiver-trust
seg-ee9aad877fd8 = 对于固定或未指明的接收机，<c1/> 依据 GNSS 日志自身的校准窗口进行检查，并说明它何时不再像它自己。它给出状态和告警，而不是 { "0" } 到 { "100" } 的船舶评分。请在相同设置下运行示意性示例（一份虚构的日志，其中干扰机从 { "120" } s 工作到 { "240" } s）或您自己的 NMEA 日志。日志仅在此读取，绝不上传。

# tools/index.html
seg-efb4dc713dd2 = Studio 中另有：<a1>几何</a1>，某地某时的天空图、天际线和精度因子（DOP）；<a2>月球台站</a2>，月球参考站的建模覆盖率；<a3>海事信任度</a3>；<a4>干扰地图</a4>；<a5>训练复盘</a5>。

# holdover/index.html
seg-f155b7ceef1f = TDEV

# mission-thread/index.html
seg-f2be7442bdf2 = 事件

# tools/index.html
seg-f2ce7fc60cdf = 格式

# advanced/index.html
seg-f4b7cada2310 = 扫描

# interference/index.html
seg-f4c16e6a9663 = 选择文件…

# index.html
seg-f4d1ec6fc464 = 引用

# index.html
seg-f5d247d49432 = 驾驶台回放

# interference/index.html
seg-f63dd3d7aad4 = 来源

# interference/index.html
seg-f6c5554e22a0 = 演示文件是<b>合成的</b>：每个计数都是虚构的，针对虚构的区域，背后没有任何跟踪来源、合作方数据或真实日期。其数据块中已有说明。

# lunar/index.html
seg-fa063693b336 = 基于给定的公开假设，不是对任何真实系统性能的说明。

# tools/index.html
seg-fa06706aec55 = Septentrio SBF

# training/index.html
seg-fa131441c483 = 航向和计程仪速度（HDT 和 VBW）代替陀螺罗经和多普勒计程仪。<b>没有任何事件作用于它们</b>，因此 GNSS 所报告的与它们所示之间的差距是复盘的线索。

# advanced/index.html
seg-fa37e351f6b4 = 复制

# lunar/index.html
seg-fa4468d4cb80 = 可用性

# tools/index.html
seg-fb07400cdee2 = 要求时间戳令牌

# index.html
seg-fc310f9d867c = 浏览

# advanced/index.html
seg-fc996ea3d2ce = 结果

# advanced/index.html
seg-fd4276fe5f5e = 比较

# interference/index.html
# c1: adsb-<dataset>-YYYY-MM-DD.geojson
# c2: ais-<dataset>-YYYY-MM-DD.geojson
seg-fd4e582c272e = 请选择一个或多个 <c1/> 或 <c2/> 文件。ADS-B 和 AIS 文件始终显示为各自独立的地图，绝不合并：二者的许可不同（ADS-B 文件带有其来源的许可，内置来源为 ODbL { "1.0" }；AIS 文件属公有领域或 NLOD { "2.0" }），单元的含义也不同。

# geometry/index.html
seg-fd600e95e731 = <b>天空图</b>是从该地看到的天空：每个标记是一颗卫星，位于其方位角（罗盘方位）和高度角（地平线以上的角度）处。颜色和形状都表明它属于哪个星座。

# index.html
seg-fda27ae5d5f2 = <a1>Kshana Pro</a1>：按您的设备校准的时钟数字孪生、附带审计级证据包的权衡研究，或闭源集成，按合同提供。<a2>申请评估</a2> · <a3>洽谈商业许可</a3> · <a4>申请研究</a4>

# advanced/index.html
seg-fdb067cc01c0 = 打开验证台账

# observatory/index.html
# c1: docs/observatory/METHOD.md
seg-ff19c890942d = 每个数字都是 MODELLED：没有地面真值，也没有外部参考基准（oracle）。方法说明在仓库中的 <c1/>。

# advanced/index.html
seg-e00dede0cbb9 = 全部领域，以磁贴显示
