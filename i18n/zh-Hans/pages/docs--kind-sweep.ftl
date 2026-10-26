# docs--kind-sweep: translations (zh-Hans)

seg-4636d450ef60 = <b>MODELLED</b> 一次运行输入一份接触计划（一组 aos_s/los_s 窗口，每个窗口请求孔径用于导航或通信，其窗口词汇与 <c1/> 输出的相同，由 <c2/> 转换）、一个孔径

seg-fa3ad6babe54 = <b>MODELLED</b> <c1/> 类型的扫描（在任意类型的一至三个点分隔的键上，使用通用扫描的坐标轴取值，可选地在每个节点上做一个集合）以及 monte_carlo 部。参考基准（InternalConsistency）：白频率噪声下相位随机游走的闭式，方差 q_wf tau（NIST Technical Note { "1337" }），用于统计机制；以及与独立运行逐字节相等，用于随机种子设定。它检查的是引擎自身时钟模型上的集合运算，而不是外部数据集

seg-d1c11e493795 = 对任意场景类型的参数扫描和带随机种子的蒙特卡罗集合为 MODELLED，而不是经独立验证：它对照自身的闭式或解析恒等式进行检查，能发现转录错误和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-cb91473bfdda = 主题页面：<a1>LEO-PNT.md</a1>

seg-c61e88721556 = 引擎 v{ $version } 的场景类型，所属类别为<a1>时钟、授时与守时</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为 MODELLED（标签如何获得：见 README 的证据一节）。

seg-a8d92406e428 = 锶光晶格钟，面向空间应用的目标 sigma_y

seg-5278ccdaf16f = <b>MODELLED</b> 闭式滑行误差增长加守时到阈值；量子时钟等级。参考基准（ReferenceImpl）：多步 clock_state 协方差递推（同一代码库内的交叉检查）；底层的滑行方差与守时反演核对照 scipy 经外部验证（见“Clock-holdover coast-variance & threshold inversion”）。各等级的红噪声底守时数字仍为 MODELLED

seg-e12f672ae71d = GNSS 拒止下的时钟守时为 MODELLED，而不是经独立验证：它对照同一代码库中另一个独立实现进行检查，独立于被测单元，但不具外部权威性。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-849c08d3ce70 = 类别页面：<a1>时钟、授时与守时</a1>

seg-ee7dd15019d0 = 主题页面：<a1>CAMPAIGNS.md</a1>

seg-0aae0574c5e6 = <b>MODELLED</b> <c1/> 类型的可用性扫描：按星座（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）及合计，统计（用户，历元）对中至少有一个信号和至少有四个信号的占比及最长中断时间，针对位于球面上的用户
