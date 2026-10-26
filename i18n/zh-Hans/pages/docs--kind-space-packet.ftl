# docs--kind-space-packet: translations (zh-Hans)

seg-99ef7c1d552c = 引擎 v{ $version } 的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-3068552e4ab4 = VALIDATED：列出此类型的<a1>验证矩阵</a1>各行。

seg-98151954f217 = false

seg-2ac27c1e55c0 = 八位字节

seg-785f906eb194 = 来源：<c1/>

seg-525499bc01cd = <c1/>（场景类型）

seg-de2448d74c2b = CCSDS 133.0-B空间包协议成帧：编码一个合成的TM/TC包流（6八位组主头 + 数据域），并报告逐包的头部解码、总八位组数和精确的编码↔解码往返。确定性的精确比特布局成帧，即机构包格式的互操作层；并非一致性认证（除标志位外，没有副头/CRC/分段逻辑）。

seg-757dec59102b = <c1/>的一次运行汇总如下：space-packet：已为APID { "100" }成帧{ "4" }个CCSDS-133.0 TM包，共{ "152" }个八位组，往返精确（true）

seg-fd46ce63e6fc = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>

seg-e3235e4d3760 = 示例<c1/>设置了以下内容等：

seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

seg-5b3bc9761db4 = 首个

seg-52036320db9b = TM

seg-f336ba92871f = 结果标签（引擎给出）：CCSDS 133.0-B空间包主头成帧：精确、确定性的比特布局，已验证编码↔解码往返；并非一致性认证（除标志位外，没有副头 / CRC /分段逻辑）

seg-af1cf9aa9938 = 引擎为scenarios/space-packet.toml（类型space-packet）绘制的图表

seg-ff1f36904d38 = <b>VALIDATED</b> CCSDS 133.0-B空间包主头的编码/解码（版本/类型/副头标志/APID/序列标志/计数/数据长度）+ 一个成帧场景。测试：<a1>ccsds_space_packet_reference.rs</a1>。

seg-82c617034322 = <b>VALIDATED</b>主头之外的CCSDS 133.0-B-2空间包扩展：携带CCSDS 301.0-B时间码（CUC或CDS，显式或隐式P域）和辅助数据的副头、CRC-16包差错控制域、分段 测试：<a1>space_packet_ext_oracle.rs</a1>。

seg-94f3381476ee = <b>VALIDATED</b> CCSDS 133.0-B空间包主头的编码/解码（版本/类型/副头标志/APID/序列标志/计数/数据长度）+ 一个成帧场景。可从CLI/绑定运行。参考基准（ExternalDataset）：spacepackets { "0.32.0" }（us-irs/spacepackets-py，R. Mueller，Apache-2.0），这是CCSDS 133.0-B-2的独立第三方实现；kshana的encode_packet/decode_packet与之逐字节一致（{ "33" }个算例的6八位组主头 + { "12" }个完整编码包）

seg-bca17769398b = <s1>上一页</s1>solar-system

seg-6ef772483f30 = <s1>下一页</s1>space-weather
