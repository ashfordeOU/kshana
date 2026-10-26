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
