# docs--kind-link-budget: translations (zh-Hans)

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }：列出此类型的<a1>验证矩阵</a1>各行。

seg-a3697ad561db = Hz

seg-cec5c06d38af = <b>MODELLED</b>月面原生的干扰信号比、有效C/N₀ 与失锁，针对月面（或抬高）干扰源下的月面用户，基于示意性的、取自公开来源的Moonlight/LCNS类星座。

seg-120fcc840b87 = 来源：<c1/>

seg-738aa7d45efb = <c1/>（场景类型）

seg-953188c11165 = 基于CCSDS { "401" } / DSN 810-005链路方程的单向链路预算：针对发射EIRP、接收G/T、距离、数据速率和频段（s|x|ka），对照所需Eb/N₀，给出自由空间路径损耗、C/N₀、Eb/N₀、余量和链路闭合情况。这是根据所提供输入进行的确定性工程计算（不是经过标定的终端数据手册）。

seg-6697c741d09c = <c1/>的一次运行概括如下：link-budget：x频段，{ "2000" } km，{ "1000000" } bit/s -> FSPL { "177.0" } dB，Eb/N0 { "96.6" } dB，余量{ "92.1" } dB（闭合）

seg-2305502051b6 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-588476f4ae75 = 示例<c1/>设置了下列内容等：

seg-ebb923e1a3b5 = 结果标签（引擎给出）：基于CCSDS { "401" } / DSN 810-005链路方程（EIRP − FSPL − L_other + G/T − k）的单向链路预算；根据所提供输入进行的确定性工程计算，并非经过标定的终端数据手册

seg-bd375631bc7e = 引擎为scenarios/link-budget.toml（类型link-budget）生成的图表

seg-4f92669c3946 = <b>VALIDATED</b>基于CCSDS { "401" } / DSN 810-005链路方程的自由空间路径损耗、C/N₀、Eb/N₀、余量和链路闭合情况，针对EIRP/G·T/距离/速率/频段，对照所需Eb/N₀。测试：<a1>one_way_link_budget_reference.rs</a1>。

seg-bfaeb6f1cc5a = <b>VALIDATED</b>基于CCSDS { "401" } / DSN 810-005链路方程的自由空间路径损耗、C/N₀、Eb/N₀、余量和链路闭合情况，针对EIRP/G·T/距离/速率/频段，对照所需Eb/N₀。运行。参考基准（oracle，ExternalDataset）：以固定数值向量形式给出的已发表深空通信设计控制表：DESCANSO / J. H. Yuen（编），Deep Space Telecommunications Systems Engineering，JPL Pub 82-76，表1-1（Galileo X频段）——kshana重新组装该表的各行条目，并复现其已发表的端到端L_fs { "290.54" } dB和Pr/N0 { "54.6" } dB-Hz；自由空间损耗还对照ITU-R P.525检查

seg-2598c2360113 = <b>MODELLED</b>链路预算报告会列出其余量所依据的每一个绝对常数——自由空间损耗所用的载波频率、EIRP、数值。参考基准（oracle，InternalConsistency）：没有外部参考基准：这是对一个已对照已发表设计控制表验证过的方程所作的自我说明（见单向链路预算一行）。之所以记录它，是因为缺少它曾是一个实测的缺陷——要复现已发布的d1_rate_gain_beamwidth.csv，必须由全部三十行反推出一个有效常数，精确到{ "0.0034" } dB，而引擎现在既指明了这一组合，又通过测试证明

seg-c779823e860c = 可选：接收系统噪声温度（K）。它并非链路方程的输入——方程只需要比值G/T——但给出它之后，报告还可以给出该品质因数所隐含的接收天线增益（G = G/T + { "10" }*log10(T_sys)）。省略时，报告中不含增益拆分，而不是凭假设给出。tsys_k = { "300.0" }（场景文件注释，第{ "21" }至{ "25" }行）

seg-d717412c4f06 = 链路预算报告的自我说明为MODELLED，而非已与独立的外部参考基准核对：对照其自身的闭式/解析恒等式检查——可发现转录和系数错误，但不是外部参考基准。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-ffbc9de75306 = <s1>上一页</s1>leo-signal

seg-59d4cb995cb9 = <s1>下一页</s1>lunar-attack-surface
