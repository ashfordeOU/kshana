# docs--rust: translations (zh-Hans)

seg-d4a762001549 = 许可

seg-4dbf41c0ec3b = 函数

seg-81a87d14efda = Kshana：标志，一个标示精确时刻的罗盘准星，位于字标 kshana 旁

seg-8c83544270b5 = 签名

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>精确的一瞬</em></b><br/>一款开源的PNT（定位、导航与授时）韧性仿真器。

seg-3b861b2f08b8 = 发布版本v{ $version }

seg-ebe636986f46 = { "388" }项能力中有{ "176" }项已对照独立的外部基准（oracle）核对

seg-6a1906d8d4ad = 行覆盖率约{ "95" }%，持续集成中的门槛为{ "85" }%

seg-a9f4f2795fb5 = 许可证：仅AGPL-3.0，或商业许可证

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = 预演GNSS失效的那一分钟：Kshana的任务控制台，取自引擎的一次真实运行，这是针对GPS、Galileo、北斗和GLONASS共{ "102" }颗卫星的、串联了压制干扰、欺骗干扰、守时和完好性的campaign

seg-d1153c5e9112 = 预演GNSS失效的那一分钟

seg-d1a3f78ad8e0 = 无需安装即可先试用：<a1>Kshana Studio</a1>在你的浏览器中运行整个引擎，已编译为WebAssembly，不上传任何内容。

seg-2d2c47db0c1f = <b>{ "388" }项能力中有{ "176" }项</b>已对照独立的外部基准（oracle）核对；{ "208" }项如实标为由模型计算得出，{ "4" }项由合作方负责。每项能力在经机器检查的台账（ledger）中都带有一个标签：VALIDATED（独立的外部基准（oracle）一致：真实数据、独立实现或已发布的参考向量）、MODELLED（内部自洽，并明确说明）或PARTNER（由硬件合作方负责）。检查包括：AIAA（美国航空航天学会）2006-6753的全部{ "666" }个SGP4（简化通用摄动{ "4" }）向量，精度达{ "4.12" } mm，以及对照Orekit { "12.2" }的Cowell力模型，精度达{ "0.08" } m。

seg-44f7862c45a2 = 一项能力如何赢得其标签：能力、基准（oracle）、测试、台账标签。全部{ "388" }项能力的验证状态：{ "176" }项已与外部参考核对，{ "208" }项由模型计算得出，{ "4" }项由合作方负责

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
