# docs--kind-oem-interop: translations (zh-Hans)

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-3068552e4ab4 = VALIDATED：列出此类型的<a1>验证矩阵</a1>各行。

seg-4abcbdaddcf8 = 来源：<c1/>

seg-a92dcafd670e = <c1/>（场景类型）

seg-dbffff25b57f = CCSDS OEM互操作桥：导入由外部飞行动力学工具生成的轨道星历消息（GMAT/Orekit/STK均可输出OEM），报告其分段/对象/坐标系/历元跨度，并附速度一致性检查；没有输入时，则对生成的参考轨道做往返处理，并报告导入与导出之间的保真度。MODELLED的结构/物理导入检查，并非对源数据的轨道精度核对验证。

seg-21eb1c9d7571 = <c1/>的一次运行汇总如下：oem-interop：往返处理了{ "2" }个分段、{ "12" }个状态；最大往返误差{ "4.88e-7" } km / { "4.61e-10" } km/s（MODELLED互操作）

seg-54c35d9fbfd9 = 可选字段：<c1/>

seg-d4117f615cd8 = 示例<c1/>设置了以下内容等：

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = 结果标签（引擎给出）：MODELLED：CCSDS OEM导入/往返互操作桥（GMAT/Orekit/STK均可输出OEM）；一项结构加物理的导入检查，并非对源数据的轨道精度核对验证

seg-5db5a7c812ca = 引擎为scenarios/oem-interop.toml（类型oem-interop）绘制的图表

seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS { "502.0" } OEM导入器（parse_oem），可容忍COMMENT行 /额外的元数据关键字 /协方差块，且是写出器的精确逆过程；往返处理加外部文件导入，并附速度一致性检查。测试：<a1>ccsds_oem_interop_reference.rs</a1>。

seg-20071a16b316 = <b>VALIDATED</b> CCSDS { "502.0" } OEM导入器（parse_oem），可容忍COMMENT行 /额外的元数据关键字 /协方差块，且是写出器的精确逆过程；往返处理加 . 参考基准（ExternalDataset）：独立的第三方CCSDS-502解析器<c1/> { "0.4.5" }（MIT，<a1>https://pypi.org/project/oem/</a1>），这是一个独立的代码库，能逐字节一致地解码kshana输出的EME2000/UTC OEM（{ "2" }个测试数据文件中的{ "24" }个状态，位置/速度 Δ = { "0" }），其严格读取器也确认了元数据记号；kshana的解析器在一份随仓库提供的外部OEM上同样与之一致。两项如实的互操作发现（oem库拒绝kshana的逐卫星mu

seg-7ab6bb7a1b8a = MODELLED：CCSDS OEM导入/往返互操作桥（GMAT/Orekit/STK均可输出OEM）；一项结构加物理的导入检查，并非对源数据的轨道精度核对验证（结果<c1/>）

seg-343a56c07d02 = MODELLED的结构/物理导入检查，并非对源数据的轨道精度核对验证。（类型目录（<c1/>））

seg-44aba1ad1d37 = 诚实范围：MODELLED的结构加物理导入检查，并非对源星历的轨道精度核对验证。运行：kshana scenarios/oem-interop.toml（场景文件注释，第{ "11" }至{ "13" }行）

seg-833df8eedc34 = <s1>上一页</s1>ntn-positioning

seg-28254e1b38d4 = <s1>下一页</s1>optical-atmosphere
