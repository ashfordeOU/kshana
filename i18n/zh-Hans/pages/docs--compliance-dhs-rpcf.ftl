# docs--compliance-dhs-rpcf: translations (zh-Hans)

seg-fdbb9db68f1d = 无

seg-d01db1c2710a = 参考

seg-dbec6a166e56 = 来源：<c1/>

seg-6e9b601864df = 美国 DHS Resilient PNT Conformance Framework：Kshana 为哪些内容提供证据支持

seg-cef4181edf29 = 该框架描述了由八项编号要求构成的 { "0" } 至 { "4" } 级韧性等级，以及一种将静态分析与动态分析相结合的评估方法，其中以测试向量代替威胁。它自身没有要求标识符体系，因此下文的引用是其等级与要求编号以及章节编号。它以结果为导向，不对威胁进行编目。

seg-ff0e00610721 = 每一行都说明 Kshana 的哪些输出<b>为该要求提供证据支持</b>，以及还剩下什么。这里没有任何内容表示某个框架已达到，或任何产品已被任何人评级或批准。请对你自己的结果文件运行 <c1/>，查看你的运行实际为哪些行提供了证据；参见 <a1>README.md</a1>。

seg-30c8cabb6e90 = 来源文件

seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>：{ "2.0" } 版，{ "2022" } 年 4 月 { "26" } 日（DHS Science and Technology Directorate，与 CISA 合作）。<a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>。阅读日期 2026-10-09：文件已完整阅读；未抓取发布落地页。

seg-955191e0baab = 对应关系

seg-6ba8f74126ee = 它的要求（转述）

seg-0438151025da = 为其提供证据支持的 Kshana 输出

seg-3f265e18f56c = 缺口

seg-4263435e702a = 第 { "5.2" } 节（预防、响应、恢复）

seg-e7b721f6e216 = 韧性被描述为三项功能：预防危害、响应（检测、报告、缓解、遏制）和恢复。检测是概率性的，因此虚警和漏检都很重要。

seg-3447d3b53fe8 = 接收机日志信任度评估；欺骗干扰和欺骗转发（meaconing）检测；守时（holdover）与滑行

seg-ab055a50e16e = 预防是产品设计的属性，任何仿真输出都无法显示。来自合成运行或单次会话运行的检测统计量，不是已部署产品的实测虚警率或漏检率。

seg-501badd6a436 = 第 { "1" } 级，要求 { "1" }

seg-e8cfbe121084 = 检查来自外部来源的已存储数据是否符合相关标准的格式和取值范围。

seg-7d7196aefa05 = 这是被测产品的软件保证和输入校验属性。Kshana 不检查产品的输入处理。

seg-6085030de980 = 第 { "1" } 级，要求 { "2" }

seg-e8cd6fb732ad = 允许通过清除或重置存储器进行完全的手动恢复，在威胁消失后使系统返回到规定的性能。

seg-8d216d42c776 = 接收机日志信任度评估

seg-e3ca721d9d2e = 接收机日志显示定位解何时变得不可信、何时恢复；它不显示手动重置会清除每一个已存储的状态。

seg-2c78c15cea96 = 第 { "1" } 级，要求 { "3" }

seg-ab9458f8b8fc = 安全地重新加载或更新固件。

seg-3a50eceb47f5 = 固件更新的安全性不在任何 Kshana 输出所观察的范围之内。

seg-752a194674f6 = 第 { "2" } 级，要求 { "4" }

seg-a5f263a083c7 = 识别被攻破的 PNT 来源，并阻止它们破坏解算结果。
