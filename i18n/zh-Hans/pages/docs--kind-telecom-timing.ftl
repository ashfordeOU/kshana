# docs--kind-telecom-timing: translations (zh-Hans)

seg-f42465f7d066 = ns

seg-98151954f217 = false

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-c61e88721556 = 引擎 v{ $version } 的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input：一个解析层，把 RINEX 钟文件（某一指定时钟的 AS/AR 记录，版本 { "2" } 以及 { "3.00" } 至 { "3.04" }）、TimeLab 式 ASCII 相位或频率日志，或 TAPR TICC 时间戳或间隔日志转换为统一的相位 测试：<a1>clock_log_allantools.rs</a1>。

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-3bc1761c76ab = 有 { "3" } 个内置场景使用此类型；其余的在 <a1><c1/></a1> 中。

seg-e7273fd2a640 = <b>VALIDATED</b> <c1/> 场景类型报告的最大时间间隔误差与时间偏差，针对电信量级的守时记录：O(n) 单调队列滑动。参考基准（oracle，ExternalDataset）：allantools { "2024.06" }——独立的第三方频率稳定度库——对 tests/fixtures/telecom_timing/holdover_te_series.csv 调用 mtie() 与 tdev()，两侧均由同一份 17 位有效数字的文本解析出序列；该参考基准记录了序列的 SHA-256，并可通过 tests/fixtures/telecom_timing/generate_telecom_timing_reference.py 离线重新生成。验证的是该记录上的估计器，而非合成

seg-4cf0f94f96c9 = <b>MODELLED</b> 转录自 ITU-T G.8272（07/2025）PRTC-A/B、G.8272.1（{ "2024" }）Amd. { "1" }（07/2025）ePRTC 锁定与 ePRTC-A 守时（包括 Table { "3" } 的钟差包络。参考基准（oracle，InternalConsistency）：对所指明建议书的转录（可从 itu.int 免费下载），每项限值均注明其表格或条款，所有未确认或未实现的项目列于 docs/TELECOM-TIMING.md；各表所蕴含的断点连续性恒等式在测试中核对。这是附带内部自洽检查的标准转录，不是一致性测试，也不是外部验证。{ "0.30" } 第 { "2" } 轮（预先登记
