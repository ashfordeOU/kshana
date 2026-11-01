# docs--kind-mars-pnt: translations (zh-Hans)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = 引擎v{ $version }的场景类型，所属类别为<a1>星座、覆盖与几何</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-45259ad33a01 = <b>MODELLED</b> <c1/>类型：围绕按名称选定的天体运行的轨道器或表面着陆器，利用该天体周围Walker导航星座（二体轨道，含该天体的J2长期漂移，用户时钟未知

seg-a4f1e7d2041e = 类别页面：<a1>星座、覆盖与几何</a1>

seg-670191cf797f = 主题页面：<a1>SOLAR-SYSTEM.md</a1>

seg-3ea0aa9b3907 = <b>MODELLED</b> 3状态（相位/频率/漂移）van-Loan卡尔曼时钟，Joseph稳定化。参考基准（ReferenceImpl）：filterpy { "1.4.5" } KalmanFilter（R. Labbe，MIT），F通过scipy.linalg.expm得到，Q通过Van-Loan { "1978" }分块矩阵得到：这是一个独立的参考实现，复现了kshana的完整滤波器轨迹。跨实现一致性：时钟物理和阿伦校准没有经外部验证，因此该行仍为MODELLED。{ "0.30" }外部比较，一项发现（仍为MODELLED）：在{ "11" }颗GPS Blo的IGS最终{ "30" } s钟差上

seg-8de95b3a9229 = 星载时钟状态估计为MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-3bc1761c76ab = 有{ "3" }个内置场景使用此类型；其余的在<a1><c1/></a1>中。

seg-c68502b9d675 = 来源：<c1/>

seg-46072326d616 = <c1/>（场景类型）

seg-3f749aef8d89 = 深空火星PNT：一个模拟的MARCONI中继星座（静止于火星的中继星加倾斜轨道中继星，既广播单程信号，也向深空站转发双程信号），通过联合单程/双程无线电测量融合估计器为一个参考用户（transfer | lmo | surface）导航。报告各历元的几何/可见性、相对真值取得的RMS，以及形式协方差（1σ / 3σ 位置），这是如实的模拟性能指标，并非经认证的保护级。

seg-0254f9bd0ee6 = <c1/>的一次运行汇总如下：mars-pnt 5aad87fcc94a | lmo用户，uso时钟 | { "5" }颗中继星（平均{ "3.1" }颗可见）| 收敛后位置RMS { "0.25" } m，形式1σ { "0.31" } m（3σ { "0.93" } m，协方差性能指标，不是经认证的PL）| 钟频 σ { "3.71e-13" } | cov-PD true

seg-8eb513e7aeea = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>

seg-5a9640a3f9b4 = 示例<c1/>设置了以下内容等：

seg-8e0fecea19fc = uso

seg-a16f2332397c = lmo

seg-c564dca90854 = 引擎为scenarios/mars-pnt-lmo.toml（类型mars-pnt）绘制的图表

seg-83c3a84f6b98 = <b>VALIDATED</b>通过高斯–牛顿批处理微分修正器和序贯滤波器，在二体加J2力模型下由地面站测距恢复历元状态[r,v]。参考基准（ExternalDataset）：Orekit { "12.2" }（CS GROUP，Apache-2.0）BatchLSEstimator（Levenberg–Marquardt）+ KalmanEstimator（EKF），一个在匹配力模型上的独立第三方估计库；恢复的历元状态与拟合后残差RMS在无噪声时一致到<{ "1e-3" } m，在{ "5" } m噪声底限下一致到<{ "3" } m

seg-4be479b81f39 = <s1>上一页</s1>lunar-vlbi

seg-2854e6a75833 = <s1>下一页</s1>moonlight-service-volume

seg-6d595f01ffcc = <s1>下一页</s1>mission-thread
