# docs--rust: translations (zh-Hans)

seg-d4a762001549 = 许可

seg-4dbf41c0ec3b = 函数

seg-81a87d14efda = Kshana：标志，一个标示精确时刻的罗盘准星，位于字标kshana旁

seg-8c83544270b5 = 签名

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>精确的一瞬</em></b><br/>一款开源的PNT（定位、导航与授时）韧性仿真器。

seg-3b861b2f08b8 = 发布版本v{ $version }

seg-6a1906d8d4ad = 行覆盖率约{ "95" }%，持续集成中的门槛为{ "85" }%

seg-a9f4f2795fb5 = 许可证：仅AGPL-3.0，或商业许可证

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = 预演GNSS失效的那一分钟：Kshana的任务控制台，取自引擎的一次真实运行，这是针对GPS、Galileo、北斗和GLONASS共{ "102" }颗卫星的、串联了压制干扰、欺骗干扰、守时和完好性的campaign

seg-d1153c5e9112 = 预演GNSS失效的那一分钟

seg-d1a3f78ad8e0 = 无需安装即可先试用：<a1>Kshana Studio</a1>在你的浏览器中运行整个引擎，已编译为WebAssembly，不上传任何内容。

seg-12a295fba8a5 = 验证矩阵中的每项能力都被标为<b>已与外部参考核对</b>（对照独立的外部基准（oracle）核对）、<b>由模型计算得出</b>或<b>由合作方负责</b>；光钟的数字是在地面硬件上的空间目标（尚无锶光钟上过天）。各领域的成熟度<em>并不</em>一致——地球PNT已对照真实数据核对；深空和火星导航是由模型计算得出的，只有其构件（光行时、行星位置）已对照外部基准（oracle）核对；真实任务的深空OD（定轨）还在路线图上。

seg-3de57431d3e6 = 该引擎有{ "87" }种场景类型；<c1/>会列出它们及其字段。{ "0.38.0" }中新增：<c2/>（面向位于GNSS轨道之上、周围和之外的航天器的GNSS信号）和<c3/>（作为导航和大地测量基础设施的月球轨道与月面），两者均为MODELLED，以及<c4/>（对照ITU-T模板的时间误差记录）。

seg-68ed88ec0b32 = <b>频谱</b>：干扰源如何逐个频段占据GNSS的L频段。

seg-f04a0aeeee33 = <b>时钟与授时</b>：对照阈值的守时、时间传递，以及对照国际电信联盟标准化部门（ITU-T）模板的电信守时。

seg-7e38ac603ef2 = <b>围绕任意天体的星座</b>：围绕地球、月球或火星的覆盖、精度因子和可用性，以及某一历元的太阳系。

seg-82708b06dcc6 = <b>低地球轨道导航</b>：信号、过境和链路、导航电文，以及逐阶段给出的融合定位结果。

seg-e21e9bb02d00 = <b>Campaign</b>：在一个场景中进行串联任务、扫描或蒙特卡罗系综。

seg-ba5057da54e4 = <b>报告、动画与导出</b>：每个数字都带单位和标签；运行的动画图；SP3（标准产品{ "3" }）、CCSDS（空间数据系统咨询委员会）轨道消息、CZML（Cesium语言）、KML（Keyhole标记语言）、GeoJSON、STK（系统工具包）和SigMF（信号元数据格式）文件。

seg-6b43a8c3031e = 中心是一个开放的引擎，kshana { $version }，通过带类型的分派覆盖{ "75" }种类型；围绕它的是命令行、Rust库、Python、WebAssembly与Kshana Studio、MCP服务器、Docker镜像和JetBrains插件；其下是Kshana Pro，一个依赖开放引擎、且从不分叉它的专有叠加层

seg-ea6f46d62e7b = 同一场景文件在每个界面上给出相同的字节。MCP即Model Context Protocol：<a1><c1/></a1>让AI（人工智能）助手运行该引擎。

seg-f51b0a8cd30e = arXiv上有六篇论文建立在该开放引擎之上，每篇都附有其背后的命令：<a1>arXiv:{ "2606.22054" }</a1>（干扰检测器的乐观差距）、<a2>arXiv:{ "2606.24210" }</a2>（条件授时保护级）、<a3>arXiv:{ "2607.05415" }</a3>（PNT韧性评分有多稳定）、<a4>arXiv:{ "2607.02566" }</a4>（以甚长基线干涉测量实现的月面站可观测性）、<a5>arXiv:{ "2607.06212" }</a5>（月球南极几何与月面信标）和<a6>arXiv:{ "2610.23871" }</a6>（作为可观测性问题的地月空间导航：弧长、Gramian条件数和多普勒杠杆）。参见<a7>研究</a7>。

seg-dad7832bf2d2 = 整个引擎依AGPL-3.0免费提供。Kshana Pro是一个依赖开放引擎、且从不分叉它的专有叠加层，它和定制研究可通过合同从Ashforde® OÜ 获得：<a1>contact@ashforde.org</a1>。不列价格；参见<a2>docs/PRO.md</a2>。

seg-d217f23af0c2 = 了解更多

seg-0e8320f8ea91 = <b>完整的README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

seg-acba56f9ed36 = <b>Kshana Studio</b>（在你浏览器中的引擎，以WebAssembly形式）→ <a1>https://kshana.dev</a1>

seg-13426521456e = <b>能力</b> → <a1>docs/CAPABILITY.md</a1>

seg-a42cfefa5e6d = <b>验证与出处</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

seg-07b9e03942cb = <b>验证矩阵</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

seg-9390336ecc01 = <b>引用</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

seg-d059e9fc67e1 = 依<b>GNU AGPL-3.0-only</b>（GNU Affero通用公共许可证，仅第{ "3" }版）免费开源。<b>商业许可证</b>可从<a1>Ashforde® OÜ</a1>（一家爱沙尼亚私人有限公司；OÜ = osaühing）获得，用于闭源集成；参见<a2>LICENSING.md</a2>。由Ashforde® OÜ 专业开发和维护。

seg-8a438548bf52 = 来源：<c1/>

seg-9a65e21abcf4 = Kshana重放GNSS（全球导航卫星系统）信号失效时的压制干扰、欺骗干扰和时钟守时（holdover），并告诉你一个系统能在预算内保持授时和定位多久，以及哪种时钟或传感器能带来最大的裕量。这是Rust crate：作为库的引擎，以及<c1/>命令。每次运行都可由场景、随机种子和引擎版本逐位复现。

seg-991c428a8063 = 用法：库

seg-6ef0d3fb5be0 = 该示例是一个完整的程序：它自带以TOML（Tom的显而易见的最小语言）编写的场景，因此在<c3/>之后，可在全新的<c2/>项目中作为<c1/>运行，磁盘上无需任何其他文件。

seg-cfb76f7da8da = <c1/>是JSON（JavaScript对象表示法）格式的结果文档，<c2/>是SVG（可缩放矢量图形）格式的图表，而对于发布表格的类型，<c3/>是CSV（逗号分隔值）格式的该表格。

seg-95b7a8022262 = API参考，由src/api.rs生成

seg-e271e742cec7 = 引擎v{ $version }中<c1/>的每个公共函数，均在构建时从源代码读取。

seg-9a8d288b2c57 = 移除了末尾figure_tiers块的json，与该块出现之前的文档逐字节一致；若文档没有这样的块，或其中的这个块不是最后一个键，则返回None（本crate从不输出这种情形，因此调用方应将其视为失败，而不是剥离自己无法解释的内容）。

seg-6157f407ab8b = 列出每个内置场景类型及其元数据。

seg-e9535491e871 = 以JSON数组形式给出的内置场景类型及其元数据，即语言绑定为程序化自省所提供的形式。

seg-a3e3eeb83c46 = 作为JSON对象的 [KIND_MODULES]，由类型映射到模块名数组，按表中顺序排列。

seg-6739ddf8bba8 = 作为JSON的 [HEADLINE_FIELDS]：{ "{" }kind: { "{" }"headline": [path, ...]{ "}" }{ "}" }，按表中顺序排列。

seg-f76170c699d9 = 将内置场景类型目录渲染为独立的Markdown参考文档（docs/SCENARIOS.md）：每个可调度的类型，附其一行描述及其必需/可选的TOML字段。

seg-295c8355634f = 依据本crate自身的自省来检查场景TOML，并返回问题列表，使调用方能在（可能很长的）运行开始之前就得知问题所在，而不是在运行后期才遇到失败。

seg-4aab02ecf399 = 将轨道/星座场景所传播的星座导出为SP3-c文本。

seg-d577fc8351a2 = 若src是设置了export_sp3 = true的轨道场景，则返回其SP3-c文本；否则返回None。

seg-024e29ac4bde = 将轨道场景的TLE平均根数导出为CCSDS OMM目录：每颗由TLE定义的卫星一条OMM（轨道平均根数电文），采用KVN形式，带有取自每个TLE的真实NORAD目录编号、COSPAR标识符和历元。

seg-d5dc817a3a24 = 若src是设置了export_omm = true的轨道场景，则返回其OMM目录文本；否则返回None。

seg-3fe91ee29ac1 = 将轨道场景所传播的星座导出为CCSDS OEM文本：即惯性系（TEME）状态时间序列，包含位置和速度，采用GMAT/Orekit/STK等飞行动力学工具所读取的航天器星历交换格式。

seg-f102088f3208 = 若src是设置了export_oem = true的轨道场景，则返回其OEM文本；否则返回None。

seg-5432a3921600 = 将真实的IERS finals2000A正文内联到场景的eop_finals2000a字段中（即 --eop <file>命令行路径），并返回合并后的TOML。

seg-dc707c3d1769 = 将研究元数据块拼接进已渲染的结果JSON文档，返回在起始花括号之后立即插入了顶层“meta”键的文档。

seg-afa952d0c0f5 = 运行场景并返回带结构化错误的类型化结果；绑定调用方应优先使用这个入口，而不是返回字符串错误的 [run_toml]。

seg-d0a609bfd225 = 解析、调度并运行以TOML字符串给出的场景。

seg-c62cff9a8dba = 不带 [run_toml_inner] 所追加的各类型figure_tiers块（RM-04）的 [run_toml]：用于其文档嵌入在另一类型结果中的运行（测评活动成员），使外层文档保持其字节不变。

seg-5a316ab76a7d = 把block作为其最后一个键figure_tiers追加后的json，与Documented包装器所序列化的结果逐字节一致：两空格的美化打印，该块嵌套一层。

seg-ef3b369866c5 = 本crate中的交换格式：CCSDS跟踪数据电文（TDM）的解析器与写入器（<c1/>）；Kshana交换格式（KIF）（<c2/>）。

seg-36184e41b65d = 用法：命令行

seg-c96267c06c3b = 通过包注册表安装时没有<c1/>目录，因此命令行界面自带参考场景；<c2/>会列出它们，并说明少数未包含者及原因（每个只读取随代码仓库提供的数据，或遵循某个发布版本可能不提供的预设）。

seg-35965c7df95f = 一次运行依据场景的<c1/>调度，并在场景文件旁写出<c2/>、<c3/>、<c4/>（HTML（超文本标记语言）格式的可打印报告页）和<c5/>（同一份报告，机器可读），对于发布表格的类型还会写出<c6/>。<c7/>会增加交换文件：供地球仪查看器使用的CZML（Cesium语言）和KML（Keyhole标记语言），供地图使用的GeoJSON，STK（系统工具包）星历文件，以及<c8/>类型的SigMF（信号元数据格式）录制文件。<c9/>会增加SVG、HTML或逐帧动画。

seg-fc13b487ccc5 = 在代码仓库的克隆中，同样的命令可直接使用<c1/>下的文件，包括多场景研究（<c2/>）和<c3/>，后者是唯一读取真实激光测距数据的场景，该数据仅随代码仓库提供。

seg-509e49e5df09 = <b>船舶GNSS信任度</b>（<c1/>，包括<c2/>）：依据接收机的NMEA（实时或来自日志）给出带理由的0-100分；咨询性，不是经型式认可的导航设备。

seg-0489fa168736 = <b>证据包</b>（<c1/>）：对某一日志窗口的签名技术记录，可离线验证。

seg-aa4a7de921a3 = <b>信任度遥测</b>（<c1/>）：以Prometheus指标、SIEM事件和可选的OpenTelemetry形式给出的信任度数据流。

seg-d2ecb7047abe = <b>训练数据流</b>（<c1/>）：带有预设压制干扰和欺骗干扰以及教员日志的合成驾驶台NMEA。仅限文本；绝不用于船舶的实际导航系统。

seg-e16769b8fab8 = <b>干扰地图</b>（<c1/>）：汇总的导航降级地图和航线暴露情况。

seg-1944d0fada06 = <b>Test bench与compliance映射</b>（<c1/>、<c2/>）：供实验室GNSS模拟器使用的场景载体运动和事件，以及依据结果文档填写的公开框架映射。

seg-68274ce67506 = <b>GNSS IQ实验室</b>（<c1/>）：针对录制的和合成的IQ的场景、捕获、跟踪、监测器和测评活动。

seg-6dc7d52fef11 = <s1>上一页</s1>npm与WebAssembly

seg-8ff56af64ec2 = <s1>下一页</s1>MCP服务器
