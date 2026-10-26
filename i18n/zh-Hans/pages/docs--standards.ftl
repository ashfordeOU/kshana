# docs--standards: translations (zh-Hans)

seg-4a2ce9f33ab2 = 写

seg-9120d3e96e5e = 读

seg-5ad814c7ef9e = 备注

seg-aab745a65e76 = 模块

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = 帧

seg-8ba331635865 = 标准与互操作

seg-32b620b3574e = 用途

seg-96a449a63d11 = 来源：<c1/>

seg-3ed65a16e7d0 = Kshana使用GNSS（全球导航卫星系统）、飞行动力学和授时社区的标准交换格式，使其能够与RTKLIB（开源实时动态定位库）、gLAB、Ginan、GMAT（通用任务分析工具）、Orekit以及IGS（国际GNSS服务）分析中心的工具并肩工作，而不是孤立于一座私有的孤岛。本页把引擎解析或输出的<b>交换格式</b>，对应到实现各格式的模块和权威规范。

seg-d1aa512ad4ee = 范围限于格式，即有读写方向的对象。引擎<em>实现</em>而非解析的信号和算法标准（IS-GPS-200（IS：接口规范；GPS：全球定位系统）、IEEE（电气电子工程师学会）{ "1139" }、RTCA（原为无线电技术委员会）DO-229E、IGRF-14（IGRF：国际地磁参考场）、ARAIM（先进接收机自主完好性监测）WG-C（WG：工作组）参考、CCSDS（空间数据系统咨询委员会）401/DSN（DSN：深空网））改在<a1><c1/></a1>中逐行给出证据。

seg-656920618fb7 = 引擎使用的格式

seg-4fe4920a3fa1 = 标准

seg-d08f1943c53b = 方向

seg-968a1d48364c = 规范 / 权威来源

seg-304ffba9669f = <b>CCSDS OEM</b>（轨道星历消息）

seg-68d762928f76 = <b>可读也可写</b>

seg-eea6e5c8c220 = CCSDS 502.0-B轨道数据消息，KVN（关键字-值表示法）形式

seg-be700901c03e = 由GMAT、Orekit、STK（Systems Tool Kit）摄入的列表式状态矢量星历。<c1/>将其读回；<b>通过复现CCSDS 502.0-B-3图G-11蓝皮书的逐字示例得到核验</b>（<a1><c2/></a1>）。可选的{ "6" }×{ "6" }位置/速度<b>协方差块</b>（<c3/>，21个元素的下三角KVN序列化，可带可选的<c4/>）既可写出（<c5/>）也可读入（<c6/>），往返对称（<a2><c7/></a2>测试）。

seg-3c439cc66ea6 = <b>CCSDS OMM</b>（轨道平均根数消息）

seg-8e9f975d443b = CCSDS 502.0-B-2，KVN形式

seg-fb5218415d68 = SGP4/TLE（SGP4：简化通用摄动{ "4" }；TLE：两行根数集）平均根数（平均运动、e、i、Ω、ω、M、BSTAR（轨道传播器的阻力项））的标准轨道发布形式。在<c1/>场景上可经<c2/>或<c3/>通过CLI（命令行界面）使用（每颗由TLE定义的卫星生成一条OMM，带有其真实的NORAD（北美防空司令部）编号、COSPAR（国际空间研究委员会）标识符和历元；<a1><c4/></a1>）。XML（可扩展标记语言）形式和读取器属于后续工作。

seg-08425c4b2093 = <b>CCSDS TDM</b>（跟踪数据消息）

seg-bf870037a77d = CCSDS 503.0-B跟踪数据消息，KVN形式

seg-cd96db42ab43 = DSN/ESTRACK（ESTRACK：欧洲空间跟踪网）一次过境向OD（定轨）系统交付的距离 / 多普勒 / 角度跟踪记录。<b>通过复现CCSDS 503.0-B-2图E-9蓝皮书的逐字示例得到核验</b>（<a1><c1/></a1>）。

seg-4dd7358264b8 = <b>CCSDS空间包</b>（{ "133.0" }）

seg-40accc5f1a67 = CCSDS 133.0-B-2空间包协议

seg-ed9c8bdddd6d = 地面系统交换的6字节TM/TC（TM：遥测；TC：遥控）主头部封装。<b>编码器复现了独立的<c1/>库所发布的字节级测试向量</b>（<a1><c2/></a1>测试）。

seg-aa942198bb2e = <b>SP3-c（SP3：标准产品{ "3" }，精密轨道格式）/ SP3-d</b>（精密星历）

seg-4d4237e15ef1 = IGS标准产品{ "3" }（c/d）

seg-8d1089fbd59d = 地固系（ECEF）位置加钟差时间序列。在真实的<c1/>快照上，往返核验至< { "0.5" } m（<a1><c2/></a1>）。

seg-761698fcf960 = <b>RINEX（接收机独立交换格式）{ "3" }</b>（广播导航）

seg-897068cff342 = RINEX { "3" }.x NAV（IS-GPS-200、Galileo ICD（接口控制文件）、北斗ICD、GLONASS（俄罗斯全球导航卫星系统）ICD）

seg-1b7710db3abf = 多GNSS的NAV摄入（GPS LNAV（传统导航电文）、Galileo F/NAV、QZSS（日本准天顶卫星系统）、北斗MEO/IGSO（MEO：中地球轨道；IGSO：倾斜地球同步轨道）、GLONASS状态矢量）；可作为一等的<c1/>来源使用。

seg-44991b52d1ff = <b>TLE / 3LE</b>（两行 / 三行根数）

seg-17769f14095d = NORAD / Celestrak，AIAA（美国航空航天学会）2006-6753

seg-8d4dd42edc89 = 由经独立核验的SGP4/SDP4（SDP4：简化深空摄动{ "4" }）核心传播（对{ "666" }个官方AIAA向量为{ "4.12" } mm）。

seg-498aac915067 = <b>RINEX 3.0x</b>（观测）

seg-437d07b5aa4f = RINEX 3.0x OBS（预期可解析{ "4.00" }，但从未在{ "4.00" }文件上演练过）

seg-ac97f77f142c = RINEX的另一半：接收机自身的码 / 载波 / 多普勒 / SNR（SNR：信噪比）记录（<c1/>）。这是<c2/>单点定位求解器与广播导航文件一并使用的输入（<a1><c3/></a1>，真实的IGS站ABMF）。

seg-2418cd0e4d79 = <b>IONEX</b>（电离层图交换格式；全球TEC（总电子含量）图）

seg-bf1bb42f04c4 = IONEX { "1" }.x（IGS电离层产品）

seg-af9efa0df270 = <c1/>读取IGS全球总电子含量格网，这是广播Klobuchar改正的<em>实测</em>替代方案，带有双线性空间和时间插值以及到斜向延迟的倾斜因子映射。

seg-6f0da4b59d7c = <b>IERS（国际地球自转与参考系服务）<c1/> / Bulletin B</b>（地球定向）

seg-197dfa18ca19 = IERS约定；IERS EOP（地球定向参数）{ "14" } C04 / <c1/>

seg-0d102d904cfe = 来自官方产品的UT1（世界时{ "1" }，地球自转时间）−UTC（协调世界时）和极移，包括<b>预测</b>行，因此坐标系归算可以实时运行，其预测误差的增长也可纳入预算（<a1><c1/></a1>）。

seg-2a4e274838ef = <b>KIF</b>（Kshana交换格式）

seg-193b33461507 = 本仓库，见<a1><c1/></a1>

seg-33ef8d792a90 = 中性、带版本的封装，每种产物都可以包装其中：<c1/> / <c2/> / <c3/> / <c4/> / <c5/>，并为使用方给出明确的主版本-次版本兼容性判定。不是外部标准；在此记录是因为外部工具必须能识别它。

seg-a492f437efd0 = LunaNet / IOAG（跨机构运行咨询组）月球交换

seg-b19cf72da934 = 写（时间元数据也可读）

seg-d641c72a6449 = LunaNet互操作性规范 / IOAG月球通信架构，基于CCSDS { "502.0" }

seg-cc796afe7a72 = 以与LunaNet/IOAG对齐的CCSDS形式输出的月球坐标系、月球时标和月球星历（<c1/>、<c2/>、<c3/>），并对所输出的OEM做字段检查（<a1><c4/></a1>）。

seg-5abc05382382 = <b>CZML</b>（Cesium语言）

seg-da7e20d3786b = CesiumJS CZML数据包格式

seg-8d3a73646be3 = 用于CesiumJS地球的带时间标签的数据包JSON（JavaScript对象表示法）流；运动物体以GCRS写出（<c1/>）。适用于任何把物体放在地球上的类型，用<c2/>。

seg-cd7a91109a8d = <b>KML</b>（Keyhole标记语言）

seg-be4dd74f3915 = OGC（开放地理空间联盟）KML { "2.2" }

seg-57468e6d97f2 = 供Google Earth和GIS（地理信息系统）工具使用的地固系经度、纬度和高度。<c1/>。

seg-46d977015b07 = <b>可写也可读</b>（路线）

seg-42b8e3129e64 = IETF（互联网工程任务组）RFC { "7946" }

seg-425a83b44545 = 供网络地图和GIS工具使用的地固系几何（<c1/>）；<c2/>可被读回，作为沿直线航迹飞行的各类型的输入（<c3/>）。

seg-d9b137e11514 = <b>STK星历</b>（<c1/>、<c2/>）

seg-347ee6f6c1df = Ansys STK星历文件格式

seg-45576578d357 = 供STK及读取其星历格式的工具使用的惯性（<c1/>）位置和速度。<c2/>。

seg-03fd79cce4a4 = <b>SigMF</b>（信号元数据格式）

seg-42272f73f456 = SigMF规范

seg-202b559c30a6 = 复基带记录加JSON元数据：<c1/>类型写出其合成的同相/正交（IQ）采样（<c2/>），并通过其<c3/>块读取记录。

seg-60e7c8505cb5 = <b>LEO导航电文文本</b>（RINEX-4风格和CSV（逗号分隔值））

seg-f22442e0e8ea = RINEX { "4" }导航布局，经改编

seg-8338e445b3a5 = <c1/>类型为近地轨道（LEO）卫星给出的广播星历和钟差，可导出并重新导入；这是有文档记录的改编，不是已注册的RINEX消息类型（在验证矩阵中为MODELLED）。

seg-1b89ab4e93f7 = 参考系与时间

seg-dbbd023631b6 = 引擎输出的坐标系是明确的，而非隐含的。基于CIO（CIO：天球中间零点）的IAU（国际天文学联合会）2006/2000A归算（<a1><c1/></a1>）和春分点/GMST（GMST：格林尼治平恒星时）的TEME（真赤道平春分点）归算（<a2><c2/></a2>、<a3><c3/></a3>），已对照SOFA/ERFA（SOFA：基础天文学标准；ERFA：基础天文学核心例程）参考向量逐位核验（见<a4><c4/></a4>）。

seg-819d28bd9361 = 实现

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = SGP4原生

seg-7631c594fd1a = 真赤道平春分点，即SGP4/SDP4的输出坐标系。

seg-eeb28cc286b3 = GCRS（地心天球参考系）/ J2000

seg-745285e29202 = IAU { "2006" }岁差加IAU 2000A/2000B章动

seg-3747add299d5 = <c1/>（春分点链）。

seg-4859fd3e5864 = <b>CIRS</b>（天球中间参考系）

seg-1c09f22adcf2 = IAU 2006/2000A CIO（X, Y, s）

seg-8891621dc302 = ITRS（国际地球参考系）/ ECEF

seg-a28e26cd2481 = ERA（地球自转角）加IERS极移（CIO），或GMST加极移（春分点）

seg-e7426df3c59d = <c1/>（CIO，<c2/>）/ <c3/>（春分点）。

seg-74a4801fd685 = WGS-84（WGS：世界大地测量系统）大地坐标

seg-b58a44eaaa39 = 精确正解加迭代反解

seg-4d9472dd73d3 = 时标

seg-cbe7a7ce7317 = <b>TT</b>（地球时）

seg-25191c1a4135 = 岁差/章动/CIO参数的求值（<c1/>）。

seg-8c478d6b4786 = 地球自转角 / GMST（<c1/>）。

seg-f7033ca0c13f = <b>两段式JD</b>（儒略日）

seg-64a5adeacd5b = <c1/>，用于亚微秒的历元分辨率。

seg-210f40885a8e = 输出字段 → 标准的对应关系（CCSDS { "502.0" }）

seg-e9dbc25a3ee9 = 两个轨道消息写出器在每个CCSDS ODM（轨道数据消息，{ "502.0" }）字段中写入的内容，读自对<c1/>以<c2/>和<c3/>运行的结果：

seg-d2b91c300b82 = Kshana输出

seg-119884b009cc = CCSDS ODM字段

seg-8b0593f67c7f = 值 / 单位

seg-d33eb162d179 = OEM段元数据

seg-4b338284e56a = <c1/> / <c2/> / <c3/>：传播器所积分的坐标系以及历元网格的时标，不做重新标注

seg-e0a44af9aaf8 = OEM状态历元

seg-b0623bab9fcc = 每个数据行的第一列

seg-410bd5a9ba14 = ISO-8601（ISO：国际标准化组织）日历时间，GPS时标

seg-a7c95802e01a = OEM位置、速度

seg-0539cafabf60 = <c1/>数据列

seg-8add7e800e0e = km、km/s

seg-8b386548c03c = OMM元数据

seg-e2c63414d7c2 = OMM历元

seg-5109e5948d2a = ISO-8601年积日形式（TLE历元）

seg-b74289a29c24 = OMM平均根数

seg-f3492fa95178 = 圈/天、–、度、1/地球半径

seg-fc82185abe10 = <c1/>类型的结果JSON（JavaScript对象表示法）按每个采样以SI（国际单位制）单位携带同样的状态：<c2/>、<c3/> / <c4/>、<c5/> / <c6/>、<c7/>（m、m/s），外加<c8/>、<c9/>、<c10/>。

seg-014d1392018e = 范围的如实说明

seg-017c026df3d7 = OEM、TDM、空间包、KIF、SigMF和LEO导航电文文本<b>可读也可写</b>；OMM、CZML、KML和STK星历是<b>写出器</b>（OMM读取器和XML序列化属于后续工作）；GeoJSON可写出并作为路线读回；RINEX NAV、RINEX OBS、IONEX、IERS EOP产品和TLE是<b>读取器</b>；LunaNet/IOAG月球导出是写出器，其时间元数据可往返。<a1><c1/></a1>列出了每个自带场景适用哪种导出。

seg-68b4f5116419 = 上面的CCSDS/IGS字段对应关系是文档，并不表示满足任何标准；针对这些标准的正式评估（以及在ESA（欧洲空间局）ESSR（欧洲空间软件库）/ NASA（美国国家航空航天局）开放目录中的登记）另行跟踪，目前尚待审查。

seg-e461587ad2cf = 对坐标系归算的独立SPICE/ANISE（SPICE：Spacecraft, Planet, Instrument, C-matrix, Events；ANISE：Attitude, Navigation, Instrument, Spacecraft, Ephemeris，一个纯Rust的行星几何工具包）数值交叉检验，由独立的、不在工作区内的crate <c1/>提供：<c2/>与ANISE的GCRF（地心天球参考架）→ ITRF93（国际地球参考架{ "1993" }）旋转，在{ "2020" }–{ "2023" }年间八个历元上比较，地面上吻合至 ≤ { "0.86" } m，在GNSS轨道上吻合至 ≤ { "3.6" } m（见<a1><c3/></a1>）。它需要SPICE内核，因此不是默认的持续集成（CI）门禁。

seg-f6d67027d669 = <s1>上一页</s1>能力图谱

seg-01b6270b6c6a = <s1>下一页</s1>行覆盖率
