# docs--kinds-clocks-timing-and-holdover: translations (zh-Hans)

seg-b03d56f501c3 = 类别

seg-78cba87823f7 = 时钟守时对照规格；可选的蒙特卡罗集合（运行次数 > { "1" }）。

seg-cb0b7da83f5c = 引擎为 scenarios/clock-ensemble.toml（类型 clock）生成的图表

seg-c0924aa36e64 = MODELLED 的授时系统守时（holdover）测试，依据由操作人员提供的钟差记录（时间误差记录）评分（linuxptp 的 ptp4l、phc2sys 或 ts2phc 日志，chrony 的 tracking 或 statistics 日志，TICC、TimeLab 或 RINEX 钟日志，或 time_s,time_error_ns 数据对）。该测试分四步，Kshana 一步也不执行：已锁定的基线，由操作人员在所述时刻移除 GNSS（天线电缆或模拟器输出；Kshana 不发射、也不驱动任何东西），系统凭自身振荡器守时，以及操作人员在第二个所述时刻恢复 GNSS 后的恢复。记录在这两个时刻处被切分。基线：钟差统计量以及针对已锁定时钟编写的 ITU-T 模板。守时：统计量、系统保持的分数频率偏移（最小二乘直线）、针对守时或自主时钟编写的模板、由所述已锁定时长得出的 ePRTC-A 守时包络，以及超出各钟差预算的时间。恢复：|TE| 是否以及何时进入所述范围并保持在其中，峰值与最大阶跃。每一项限值均转录自公开的 ITU-T 表格（电信授时模板）；用语为“对照模板测得”，这两个时刻是操作人员的陈述，未经验证。对于某个模板而言过短的记录为 INCOMPLETE，绝不外推。参见 docs/TIMING-HIL.md。

seg-8ce93392747b = 引擎为 scenarios/holdover-test-ptp4l.toml（类型 holdover-test）生成的图表
