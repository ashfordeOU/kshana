# docs--kind-holdover-test: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-51362910dcb7 = 有 { "2" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-c61e88721556 = 引擎 v{ $version } 的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-73929aeded02 = 来源：<c1/>

seg-218f00012d0e = <c1/>（场景类型）

seg-c0924aa36e64 = MODELLED 的授时系统守时（holdover）测试，依据由操作人员提供的钟差记录（时间误差记录）评分（linuxptp 的 ptp4l、phc2sys 或 ts2phc 日志，chrony 的 tracking 或 statistics 日志，TICC、TimeLab 或 RINEX 钟日志，或 time_s,time_error_ns 数据对）。该测试分四步，Kshana 一步也不执行：已锁定的基线，由操作人员在所述时刻移除 GNSS（天线电缆或模拟器输出；Kshana 不发射、也不驱动任何东西），系统凭自身振荡器守时，以及操作人员在第二个所述时刻恢复 GNSS 后的恢复。记录在这两个时刻处被切分。基线：钟差统计量以及针对已锁定时钟编写的 ITU-T 模板。守时：统计量、系统保持的分数频率偏移（最小二乘直线）、针对守时或自主时钟编写的模板、由所述已锁定时长得出的 ePRTC-A 守时包络，以及超出各钟差预算的时间。恢复：|TE| 是否以及何时进入所述范围并保持在其中，峰值与最大阶跃。每一项限值均转录自公开的 ITU-T 表格（电信授时模板）；用语为“对照模板测得”，这两个时刻是操作人员的陈述，未经验证。对于某个模板而言过短的记录为 INCOMPLETE，绝不外推。参见 docs/TIMING-HIL.md。

seg-cd6d840a1382 = <c1/> 的一次运行汇总为：holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

seg-6a3dc8804be5 = 必填字段：<c1/>、<c2/>

seg-4792040e4773 = 可选字段：<c1/>、<c2/>

seg-ad4f9c40e317 = 示例 <c1/> 设置了以下内容等：

seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

seg-a0f9749e9ca1 = master

seg-cd857523297f = phase

seg-29a012ae4735 = refuse

seg-d578fc8e6052 = 引擎给出的结果标签：MODELLED — 依据操作人员提供的钟差记录评分的守时测试。每一项限值均转录自所指明的公开 ITU-T 建议书，结果是对照模板测得的；它不说明任何时钟或系统是否满足某项建议书，也无人对其评级或批

seg-8ce93392747b = 引擎为 scenarios/holdover-test-ptp4l.toml（类型 holdover-test）生成的图表

seg-3361819ae321 = <b>MODELLED</b> <c1/> 类型：钟差记录（linuxptp、chrony、TICC、TimeLab 或 RINEX 钟日志，或 time_s,time_error_ns 数据对）在操作人员给出的 GNSS 移除与恢复这两个时刻处被切分为基线、守时

seg-e7273fd2a640 = <b>VALIDATED</b> <c1/> 场景类型报告的最大时间间隔误差与时间偏差，针对电信量级的守时记录：O(n) 单调队列滑动。参考基准（oracle，ExternalDataset）：allantools { "2024.06" }——独立的第三方频率稳定度库——对 tests/fixtures/telecom_timing/holdover_te_series.csv 调用 mtie() 与 tdev()，两侧均由同一份 17 位有效数字的文本解析出序列；该参考基准记录了序列的 SHA-256，并可通过 tests/fixtures/telecom_timing/generate_telecom_timing_reference.py 离线重新生成。验证的是该记录上的估计器，而非合成

seg-4cf0f94f96c9 = <b>MODELLED</b> 转录自 ITU-T G.8272（07/2025）PRTC-A/B、G.8272.1（{ "2024" }）Amd. { "1" }（07/2025）ePRTC 锁定与 ePRTC-A 守时（包括 Table { "3" } 的钟差包络。参考基准（oracle，InternalConsistency）：对所指明建议书的转录（可从 itu.int 免费下载），每项限值均注明其表格或条款，所有未确认或未实现的项目列于 docs/TELECOM-TIMING.md；各表所蕴含的断点连续性恒等式在测试中核对。这是附带内部自洽检查的标准转录，不是一致性测试，也不是外部验证。{ "0.30" } 第 { "2" } 轮（预先登记

seg-142528f34e66 = <b>MODELLED</b> <c1/> 类型：钟差记录（linuxptp、chrony、TICC、TimeLab 或 RINEX 钟日志，或 time_s,time_error_ns 数据对）在两个时刻处。参考基准（oracle，InternalConsistency）：对由公式构造的记录进行手工计算，其斜率、阶跃、极值和恢复时间在运行前即已知（测试中写明了它们），以及上述 telecom-timing 各行的模板、包络和预算。没有对真实守时进行实验室测量评分，也没有与外部参考基准作比较，因此该类型不对任何时钟或系统作出声明；在对任何按时钟等级的结论之前需要授时实验室合作方

seg-59ff0b0e3d2d = MODELLED — 依据操作人员提供的钟差记录评分的守时测试。每一项限值均转录自所指明的公开 ITU-T 建议书，结果是对照模板测得的；它不说明任何时钟或系统是否满足某项建议书，也无人对其评级或批准。移除和恢复 GNSS 的时刻是操作人员的陈述，未经验证。仅供参考的软（结果<c1/>）

seg-daeb4ad7aa35 = MODELLED 的授时系统守时测试，依据由操作人员提供的钟差记录评分（linuxptp 的 ptp4l、phc2sys 或 ts2phc 日志，chrony 的 tracking 或 statistics 日志，TICC、TimeLab 或 RINEX 钟日志，或 time_s,time_error_ns 数据对）。（类型目录（<c1/>））

seg-ff3008c250cc = 带 PASS/FAIL 与裕量的 ITU-T 电信同步模板为 MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-8ccd0f911626 = 依据操作人员提供的钟差记录评分的守时测试为 MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-72bad5444282 = 主题页面：<a1>TIMING-HIL.md</a1>

seg-3b3a24664dae = 主题页面：<a1>HARDWARE-SAFETY.md</a1>

seg-b754be35fb52 = <s1>上一页</s1>gravity-map

seg-e7665ee5e30e = <s1>下一页</s1>hybrid-optical-rf
