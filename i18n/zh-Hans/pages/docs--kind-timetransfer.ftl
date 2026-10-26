# docs--kind-timetransfer: translations (zh-Hans)

seg-c61e88721556 = 引擎v{ $version }的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-5a70fcb097dc = 可选字段：无

seg-a1810bbca337 = <b>MODELLED</b>双向/TWSTFT（Sagnac）、GNSS共视、PPP；链路抖动→距离。参考基准（oracle，ExternalDataset）：Sagnac量级对照权威的已发表值核对——N. Ashby，“Relativity in the GPS”，Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }），Eq. { "1.29" }：向东环绕赤道一周累积{ "207.4" } ns（2ωA_E/c²）；kshana复现为{ "207.386" } ns。RTKLIB { "2.4.3" }的geodist()（Takasu，BSD-2-Clause）独立地予以佐证，它带有相同的2Aω/c² 几何。复合的BIPM TWSTFT转发器/共视/

seg-a8beb8dfc757 = 时间传递误差预算为MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-37a77f49f048 = ps

seg-2ccebbc74d9f = 来源：<c1/>

seg-289a9f8dc990 = <c1/>（场景类型）

seg-ccb244e60d60 = 光学与射频的双向时间/频率传递对比。

seg-59347fda6c66 = <c1/>的一次运行汇总为：scenario 8f9c2e0e31a5 | optical sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

seg-890040dd3d96 = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-7b887ea27a86 = 示例<c1/>设置了以下各项（节选）：

seg-2485eaa6dbf4 = 双向卫星时间频率传递（TWSTFT，Ku波

seg-fa54f1a81b57 = 光学星间链路，皮秒级同步

seg-a30fe2b87ee2 = mm

seg-bd76bd68eab3 = 引擎为scenarios/timetransfer.toml（场景类型timetransfer）生成的图表

seg-3c9d28692f9f = <b>MODELLED</b>双向/TWSTFT（Sagnac）、GNSS共视、PPP；链路抖动→距离 测试：<a1>time_transfer_error_budgeting_reference.rs</a1>。

seg-84fcf20588fb = <s1>上一页</s1>time-transfer-budget

seg-149ad280a1f9 = <s1>下一页</s1>tracking-loop
