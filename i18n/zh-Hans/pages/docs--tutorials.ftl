# docs--tutorials: translations (zh-Hans)

seg-501402fc366f = 时钟守时（holdover）

seg-cae10fb9bff8 = 场景

seg-835df2d05f2a = GNSS 测量域

seg-3a0e724a8a2b = 层级

seg-28e87f407a10 = 领域

seg-d6476863f862 = 能力

seg-a0b63210b807 = 阅读更多

seg-a7cfe6f135f1 = 轨道与几何

seg-029de6b99be0 = 惯性航位推算

seg-9ef8f99ca6e4 = 时间传递

seg-b03d56f501c3 = 类别

seg-ec26df467b88 = 基于同一组混合输入的联合卡尔曼传感器融合 PNT。

seg-4f19d4fb1341 = 通过点分 TOML 键/JSON 指标路径，对任意包进行的通用 N 维扫描。

seg-e7ab7b55c969 = 针对时钟包参数的 1-D 权衡研究扫描。

seg-e43910de5fd8 = Notebook

seg-d78822583c64 = 笔记本

seg-3959aefa12be = 来源：<c1/>

seg-a5ebe4befda8 = 动手实践的实例演练，带你从“运行一个自带场景”走到“量化并为一个结果辩护”。三个教程中引用的每个数字都是引擎的真实输出，锚定于外部（非循环）的权威参考基准（oracle），并由一项<b>集成测试固定</b>（<c1/>），因此教程绝不会悄悄偏离引擎的实际行为。如果教程说光钟守时 { "6600" } s，那么这一点哪天不再成立，测试就会使构建失败。

seg-1c045624a6be = Kshana 是一款定位、导航与授时（PNT）仿真器。教程还用到几个缩写，各自在首次出现处给出全称：GNSS（全球导航卫星系统）、GPS（全球定位系统）、CLI（命令行界面）和 TOML（Tom's Obvious Minimal Language，场景文件格式）。

seg-7a84a80b57d5 = 刚接触本项目？请先阅读<a1>概念入门</a1>和<a2>术语表</a2>，再回到这里。

seg-b4cd44590347 = 三个实例演练

seg-eebeab9693b2 = 教程

seg-a0bc6e585d71 = 你将学到

seg-b6cc01b76947 = 场景类型

seg-429bab0a0e05 = 难度

seg-0e188f9c0f65 = 约需时间

seg-bcf40448e55d = 我的第一条轨道：GPS 卫星在哪里

seg-de1032024a69 = 外推一个真实的 GPS 星座，读取可用性、位置精度因子（PDOP）和位置精度，并导出卫星的实际位置（SP3 精密轨道格式）

seg-e7b6c262333e = 入门

seg-d6042fb74a5f = { "15" } 分钟

seg-07a8d6cfc1ae = 时钟守时：能滑行多久

seg-0e9c77468fb2 = 运行一次 GNSS 拒止下的时钟守时，读取授时性能指标，并理解其背后的 √(q_wf·T) 增长规律

seg-0f6fba31626a = { "20" } 分钟

seg-7973e9c54366 = 量子与经典 GNSS 韧性对比

seg-4d8036091b37 = 压轴篇：欺骗干扰检测器（<c1/>）和完整的融合 PNT 套件（<c2/>），以及如何把安全性、完好性与航位推算放在一起解读

seg-1b39d4927602 = 中级

seg-ea37ac575235 = { "35" } 分钟

seg-1d56222dfd25 = 可运行的 Jupyter 笔记本，使用合成数据和仅保存在仓库中的公开星历根数集，位于 <a1><c1/></a1>：

seg-9aae3a4e10dc = 船舶信任度与训练

seg-1d680d635c6d = 生成带有脚本化事件的合成桥楼 NMEA 数据流，再用船舶信任度监测器对其评分（咨询性，不是经型式认可的导航设备）

seg-739f8f5a9082 = 导航数据在何处显得劣化，以及它波及航线的多大部分

seg-443c908ff49b = compliance 映射与 test bench 导出

seg-0d639065192a = 一组运行为哪些公开框架条目提供证据支持（绝不表示某个框架已达到要求），以及把场景的运动和事件导出为文本，供实验室 GNSS 模拟器使用（不写出任何信号）

seg-981a3238794d = 量子与经典 GDOP 对比

seg-228ce150ee80 = 同一星座几何构型下，分别搭配量子与经典传感器，按精度因子比较

seg-4b82b5edd4ff = 天际线下的天空几何

seg-1186b6cd6149 = 某站点在街道或码头天际线下看到的卫星、其 DOP 与误差椭圆、由星历根数集得到的带日期的天空，以及对照协方差的带随机种子蒙特卡罗（MODELLED）

seg-d9d06cb8e237 = 如何运行教程

seg-ffc4ddfc9426 = 每个教程都以三种方式运行同一个场景；选择适合你的即可。它们调用的都是<em>同一个</em>引擎，因此数字完全一致（对应 README 的<a1>用法</a1>一节）。

seg-e7ba76a06aa6 = <b>命令行。</b>CLI 根据场景的 <c1/> 字段分派，并在输入文件旁写出 <c2/>、<c3/>、<c4/> 和 <c5/>（JSON 即 JavaScript Object Notation，SVG 即 Scalable Vector Graphics，HTML 即 HyperText Markup Language）。少数类型还会把可复现性表发布为 <c6/>（逗号分隔值）：<c7/>、<c8/>、<c9/>、<c10/>、<c11/>，以及设置了导出站点时的 <c12/>。这三个教程都不属于其中，因此你在这里不会看到该文件。

seg-5ee6f15d3b08 = <c1/> 从当前检出的代码构建 CLI。使用已安装的二进制文件（<c2/>）时，同一命令为 <c3/>。没有检出代码时，大多数自带场景都打包在二进制文件中：<c4/> 会列出它们（并说明少数未打包的场景及原因），<c5/> 则写出其中一个：即该二进制文件构建时所用的 <c6/> 副本。

seg-1b7e851749d5 = <b>Python。</b>在已激活的虚拟环境中，用 maturin 从当前检出的代码构建一次扩展，然后调用 <c1/>：

seg-3aa10d551694 = <c1/> 则改为安装已发布的 wheel。它可能落后于当前检出的代码：<c2/> 会告诉你你的构建包含哪些场景类型。

seg-333b7956b06b = <b>浏览器 playground。</b>零安装：打开 <a1>Studio</a1>，选择一个场景，编辑参数，查看结果。不会上传任何内容；引擎以 WebAssembly 形式在客户端运行。

seg-2cd8bbd1e7f0 = 教程引用的是 <b>CLI</b>，但每条命令在上述 Python 和 playground 中都有等价形式。每个结果都可由 <c1/> 复现：运行两次，得到逐位相同的输出。

seg-d497caeb889a = 带注释的教学场景

seg-c966709a600d = 每个能力领域都有一个注释详尽的 <c1/>，位于 <a1><c2/></a1> 之下：它是某个规范场景的<em>教学副本</em>，每个字段都有行内说明，点明所引用的参考基准（oracle），并把预期的单行摘要记录为一条 <c3/> 注释。字段取值与仓库顶层 <c4/> 目录中的原场景完全相同（<c5/> 会比较解析后的 TOML），因此文档中的输出始终成立。黄金哈希也不受影响：注释绝不会改变场景哈希。

seg-871fcecc5ee1 = 教学文件

seg-4e852a6a1581 = 派生自

seg-e74e1c9b387e = 完好性（RAIM，接收机自主完好性监测）

seg-95b6cceb76e6 = 安全性（欺骗干扰）

seg-dab48471c270 = 混合 PNT

seg-c889e5e77121 = <b>安全性</b>的教学文件内部使用 <c1/>：安全性性能指标（<c2/>，即 1 减去漏检概率）由欺骗干扰包产生。文件名遵循<em>能力</em>（安全性），而 <c3/> 遵循<em>包</em>（spoof）。该文件的头部对此有说明。

seg-89fef83a9d54 = 完整的场景类型目录

seg-648bb07212cd = 引擎根据场景的 <c1/> 分派。下表列出最常用的类型（上述八个教程领域及其最相近的类型）。它<b>不是</b>完整集合：<c2/> 返回全部 <c3/> 种内置类型。该函数（在 Python 和 WebAssembly（WASM）绑定中以 <c4/> 提供，在命令行中以 <c5/> 提供）是权威且始终最新的目录，而 <a1><c6/></a1> 是其生成的枚举，每种类型一节，列出必需和可选的 TOML 字段。<c7/> 强制要求教程中记载的每个类型都是真实的分派类型，因此本表不会列出不存在的类型。

seg-0f744a3a7193 = 时钟守时与规格对比；可选的蒙特卡罗集合（<c1/>）。

seg-9a2564fdc86a = GNSS 中断期间的 1-DOF（一个自由度）惯性航位推算。

seg-62f0400581b3 = 由星座（Walker / 两行根数 / RINEX，即与接收机无关的交换格式）得出的 GNSS 可用性与精度因子（DOP）。

seg-59fc8330ba12 = 快照 / 解分离 / ARAIM（先进 RAIM），含水平与垂直保护级（HPL/VPL）及 Stanford 图。

seg-22c598d57e77 = 月球南极 ARAIM 保护级过境，对照一组 LunaNet 中继。

seg-f97d8fb3b6fa = 光学与射频（RF）双向时间/频率传递的对比。

seg-8af1c652d854 = 混合 PNT 压轴篇：时钟 + 惯性测量单元（IMU）+ 时间传递辅助。

seg-d24a9596f53e = 松耦合与紧耦合 GNSS/INS（惯性导航系统）误差状态扩展卡尔曼滤波器。

seg-3c915870476a = 测量域伪距仿真（Klobuchar 电离层、Saastamoinen/Niell 对流层）+ RAIM。

seg-72284bad54e4 = 链路预算压制干扰（jamming）：干信比（J/S）→ 有效载噪比（C/N₀）→ 失锁。

seg-2ead4d42b427 = 随机时间欺骗干扰检测器（Neyman–Pearson / χ²₁），含蒙特卡罗虚警与漏检概率（P_fa/P_md）。

seg-5f2f9e63093a = 超越教程：较新的能力

seg-3d6a8fd31402 = 三个教程停留在经典的时钟、轨道和安全性包上。引擎已远远超出这些范围。下表每一行都是一个自带场景，可按原样运行（<c1/> 或 <c2/>）；摘要是 kshana { "0.35.0" } 于 2026-10-10 为其输出的第一行。与教程中的数字不同，这些行只是某一次运行的记录，不由 <c3/> 固定：请重新运行场景以获得当前值。结果会说明各自的适用范围（大多数带有 <c4/>），而<a1>验证矩阵</a1>则说明哪些能力是 VALIDATED（对照外部参考基准（oracle））、哪些是 MODELLED。

seg-2dc1d8680abb = 摘要的第一行

seg-abd799395f27 = L 波段频谱与压制干扰（jamming）瀑布图

seg-33453b2cfdf3 = 某一历元的太阳系

seg-23bc4ff7f741 = 绕另一天体的定位

seg-c135b151e469 = 大规模星座设计

seg-065995e9bd5e = 活动：在同一条时间线上串联的各类型

seg-dbae357e7e34 = 端到端的一套 LEO-PNT 系统

seg-9d3d72ea03df = MEO 与 LEO 融合定位

seg-acc2793d1721 = LEO 信号、过境与导航电文

seg-db2626e54a24 = <c1/>（过境）

seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>、<a2>LEO-PASS.md</a2>、<a3>LEO-NAVMSG.md</a3>

seg-aa93235e8c6d = 带 LEO 层的 PPP 收敛；5G 定位

seg-01160980ce50 = 韧性：GNSS 被压制，LEO 带领用户度过

seg-adf8453bc035 = 垂直行业：铁路、海事、电信、车辆、北极

seg-15a5098b5045 = <c1/>（以及其他 <c2/> 文件）

seg-e6494ed83ee3 = 对照 ITU-T（国际电信联盟电信标准化部门）G.8272 时钟限值的电信守时（holdover）

seg-dfc04f1abe82 = LEO 指低地球轨道，MEO 指中地球轨道；PVT 指位置、速度与时间；PPP 指精密单点定位；5G 指第五代移动通信标准；TDB 指质心力学时；JD 指儒略日；TE 指钟差（时间误差）。

seg-1d45d94f2e5b = CLI 在任何一次运行之上还增加三种输出：

seg-893276648fec = <b>报告。</b>每次运行都会写出 <c1/> 和 <c2/>（见 <a1>REPORTS.md</a1>）。<c3/> 把一套场景运行为一份 <c4/> 和 <c5/>，例如 <c6/>。

seg-e9f06d47c82c = <c1/> 渲染该次运行的时间序列，例如在 <c3/> 上使用 <c2/> 会写出 <c4/>。没有采样时间轴的类型（如 <c5/>）会被拒绝并报错；见 <a1>ANIMATION.md</a1>。

seg-f037fe5d7ffa = 互操作导出。

seg-3977722b8517 = <c1/> 把结果写出，供其他工具使用：CZML（Cesium Language）、KML（Keyhole Markup Language，用于 Google Earth）、GeoJSON（地理 JSON）、STK（Systems Tool Kit）星历，或 SigMF（Signal Metadata Format）录制文件。<c2/> 会说明哪些格式适用于某个场景；SigMF 仅适用于 <c3/>。轨道包还可导出 <c4/>、<c5/> 和 <c6/>（CCSDS，即空间数据系统咨询委员会，轨道电文）。见 <a1>INTEROP.md</a1>。

seg-3abd51182cc0 = 分级练习

seg-9513af4fb862 = 沿着这条阶梯逐级练习。每一级都比上一级更难、更站得住脚；参考解答位于 <a1><c1/></a1>。

seg-89ad8eb64a54 = 目标

seg-0a824838ef57 = 你要做什么

seg-2463a86470b8 = 参考解答

seg-7ce3ac2347b9 = 第 { "1" } 级——运行并解读

seg-e1dee35aedff = 原样运行一个自带场景，并读取一个性能指标

seg-296694716b3b = 运行 <c1/>；输出量子与经典的 <c2/>。可用 CLI、playground，或一行 Python 调用。

seg-bad6d3afb6a0 = 第 { "2" } 级——修改并扫描

seg-c18da238e470 = 改变一个参数，观察单调的影响

seg-598ca8efea83 = 收紧时钟规格（<c1/>）或延长中断时间，观察守时下降；也可以用 <c2/>/<c3/> 把结果列成表。

seg-1d9dfecce6fa = 第 { "3" } 级——量化并为结论辩护

seg-5b57f2c8ffb9 = 蒙特卡罗、置信区间、可复现性，以及保护级

seg-0fac2036b289 = 运行一个时钟集合（<c1/>），读取 [p05–p95] 区间，确认两次运行给出相同的 <c2/>，并解读一个完好性 / Stanford 图结果。

seg-45dc753da682 = 参考解答使用 Python 扩展（先运行 <c1/>）。在仓库根目录运行 <c2/>，会输出芯片级原子钟的守时从 { "20" } ns 规格下的 { "2610" } s 下降到 { "5" } ns 规格下的 { "1140" } s。

seg-e59b1beadb98 = 想要最新数据？

seg-530db2e609d0 = 这些教程中的核心数字完全由仓库中已有的场景运行得出。不会获取任何外部数据，这正是它们可复现、并且可以安全地在持续集成（CI）中运行的原因。对于“扩展练习”，你可以拉取实时数据：

seg-6a20ec96cb92 = <b>GPS 两行根数（TLE）</b>（刷新轨道星座）：<a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>，纯文本的 3 行根数集（名称 + 第 { "1" } 行 + 第 { "2" } 行）。辅助脚本：<c1/>。开放数据（美国太空军第 18 太空防御中队目录，由 Celestrak 再分发，Dr T. S. Kelso）。

seg-9bcea1d9eb12 = <b>SGP4（Simplified General Perturbations { "4" }）验证参考基准（oracle）</b>（已内置，无需重新获取）：AIAA（美国航空航天学会）2006-6753“Revisiting Spacetrack Report #3”测试向量，<a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>，由 <c1/> 使用；见 <a2><c2/></a2>。

seg-d33aa34b2762 = <b>时钟稳定度关系的参考基准（oracle）</b>：NIST（美国国家标准与技术研究院）特别出版物 { "1065" }（Riley，<em>Handbook of Frequency Stability Analysis</em>），<a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>，即教程 { "2" } 背后的 σ_y(τ)↔相位关系。

seg-36be39f17e35 = <s1>上一篇</s1>Studio 指南

seg-6f6204737a87 = <s1>下一篇</s1>{ "1" } · 我的第一条轨道
