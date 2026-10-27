# docs--kind-eo-radiometry: translations (zh-Hans)

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-cd04f5662884 = MODELLED。（类型目录（<c1/>））

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-8e62cc4af6ea = 主题页面：<a1>ENTRY-EO-ASCENT.md</a1>

seg-841259b04897 = 来源：<c1/>

seg-1b0ba13fcef1 = <c1/>（场景类型）

seg-816bd5a5808a = 天底成像仪辐射度与图像质量：朗伯场景的入瞳辐亮度、相机方程、信号与散粒/暗/读出/量化噪声及SNR；奈奎斯特频率处的系统MTF（衍射x探测器x拖尾x抖动）、由其得出的相对边缘响应、Q = lambda F/p，以及未做MTF补偿的GIQE { "4" }版NIIRS。MODELLED。

seg-7d786a7bfb86 = <c1/>的一次运行汇总为：eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (well { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

seg-3378b7b0716f = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>

seg-d613181f3fe3 = 示例<c1/>设置了以下内容等：

seg-ffb002276b21 = um

seg-1c15591babed = px

seg-e94f9ad9e6c4 = 引擎给出的结果标签：MODELLED — 天底成像仪辐射度（朗伯场景、相机方程、散粒/暗/读出/量化噪声）、奈奎斯特频率处的系统MTF（衍射x探测器x拖尾x抖动）、相对边缘响应、Q = lambda F/p，以及未做MTF补偿的GIQE { "4" } NIIRS；NIIRS是基于模型计算输入的经验回归

seg-bf7b52f7a01e = 引擎为scenarios/eo-radiometry.toml（类型eo-radiometry）生成的图表

seg-562a7cf2859c = <b>MODELLED</b>天底成像仪信噪比预算（朗伯场景辐亮度、相机方程、散粒、暗、读出与量化噪声），奈奎斯特频率处的系统MTF为无遮挡孔径衍射、探测器孔径、线性拖尾与高斯

seg-dadea618d757 = <b>MODELLED</b>天底成像仪信噪比预算（朗伯场景辐亮度、相机方程、散粒、暗、读出与量化噪声），奈奎斯特频率处的系统MTF为其乘积。参考基准（oracle，InternalConsistency）：闭式解：半截止频率处的衍射MTF、纯探测器孔径的单像素斜坡边缘（RER { "1" }）、高斯模糊的正态CDF边缘（RER = erf(0.5/(sigma sqrt { "2" }))）、散粒噪声标度，以及已发表的GIQE { "4" }系数（Leachtenauer等，Applied Optics { "36" }({ "32" })，{ "1997" }）。不包括的内容：未与任何外部成像仪、实测MTF或已评级图像作比较；GIQE是经验回归，其

seg-5182b4b0f8d6 = MODELLED — 天底成像仪辐射度（朗伯场景、相机方程、散粒/暗/读出/量化噪声）、奈奎斯特频率处的系统MTF（衍射x探测器x拖尾x抖动）、相对边缘响应、Q = lambda F/p，以及未做MTF补偿的GIQE { "4" } NIIRS；NIIRS是基于模型计算输入的经验回归，不是经评级的图像（结果<c1/>）

seg-b2f1e6466c2c = 面向ILLUSTRATIVE小型对地观测相机（并非任何运营方的设计）的天底成像仪辐射度与图像质量：孔径{ "0.40" } m，焦距{ "3.6" } m（F/9），像元{ "5.5" } um，轨道高度{ "500" } km。运行给出反射率{ "15" } % 场景的信噪比预算、奈奎斯特频率处的系统MTF、相对边缘响应以及GIQE { "4" }版NIIRS。MODELLED：NIIRS是基于模型计算输入得出的经验回归，不 （场景文件注释，第{ "1" }至{ "5" }行）

seg-aaf9ed3b0899 = 光电成像仪辐射度、MTF、相对边缘响应与GIQE { "4" } NIIRS为MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-d6c92dc655ab = <s1>上一页</s1>eo-coverage

seg-a0daef9a496e = <s1>下一页</s1>ephemeris
