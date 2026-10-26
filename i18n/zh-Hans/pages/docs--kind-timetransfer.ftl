# docs--kind-timetransfer: translations (zh-Hans)

seg-c61e88721556 = 引擎 v{ $version } 的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-5a70fcb097dc = 可选字段：无

seg-a1810bbca337 = <b>MODELLED</b> 双向/TWSTFT（Sagnac）、GNSS 共视、PPP；链路抖动→距离。参考基准（oracle，ExternalDataset）：Sagnac 量级对照权威的已发表值核对——N. Ashby，“Relativity in the GPS”，Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }），Eq. { "1.29" }：向东环绕赤道一周累积 { "207.4" } ns（2ωA_E/c²）；kshana 复现为 { "207.386" } ns。RTKLIB { "2.4.3" } 的 geodist()（Takasu，BSD-2-Clause）独立地予以佐证，它带有相同的 2Aω/c² 几何。复合的 BIPM TWSTFT 转发器/共视/

seg-a8beb8dfc757 = 时间传递误差预算为 MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））
