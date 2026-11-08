# docs--kind-gnss-ins: translations (zh-Hans)

seg-b054c73f22e5 = 无值

seg-ee7dd15019d0 = 主题页面：<a1>CAMPAIGNS.md</a1>

seg-619127334cf3 = 验证矩阵中没有任何一行按名称列出此类型；其结果上的标签是引擎自己的，见上文。

seg-7b2721b7588d = 引擎v{ $version }的场景类型，所属系列为<a1>惯性、融合与量子传感器</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处每个标签均由引擎或验证矩阵给出；除非矩阵另有说明，一个类型即为MODELLED（标签如何获得，见README的Evidence一节）。

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b>由第一性原理（k_eff·T²、QPN）得出的冷原子干涉加速度计。参考基准（oracle，ExternalDataset）：已发表的CAI原始论文数值向量（Cheinet { "2008" }传递函数；Peters/Freier灵敏度）：k_eff·T² 完全吻合，散粒噪声ASD为单边下限，与每台已发表仪器相差在约{ "2" }× 以内（实际器件的技术噪声高于量子下限）。这是一个范围界定，而非等同。{ "0.30" }第{ "2" }轮（已预先登记fcb9ac64），一项发现（仍为MODELLED）：仅含QPN的旋转噪声对照Gauguet等的实测值

seg-9955b1b1c018 = 量子惯性传感器性能为MODELLED，未经独立验证：某个子论断已有外部核对，但整个能力由模型计算的部分组合而成，因此该能力仍属“由模型计算得出”。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = 系列页面：<a1>惯性、融合与量子传感器</a1>

seg-fd8fad481c81 = 来源：<c1/>

seg-e726a6d74d81 = <c1/>（场景类型）

seg-38df285a3f25 = 松耦合与紧耦合GNSS/INS误差状态EKF。

seg-e1e235215947 = <c1/>的一次运行汇总为：scenario c55a6246bd6f | gnss-ins | quantum outage-RMS fused 1.9m vs free 130.7m (hold 60s, avail { "1.00" }) | classical fused 3.1m vs free 314.3m (hold 60s, avail { "1.00" })

seg-e3112eac77af = 必填字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-6c128eb60a91 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-79c75d3e461d = 示例<c1/>设置了以下内容等：

seg-ca448daf5ec7 = nominal

seg-49f2fa051719 = denied

seg-327a2c4885bd = 战术级MEMS/石英惯性单元：较大的残余偏

seg-d1beb62cf742 = 有{ "6" }个内置场景使用该类型；其余见<a1><c1/></a1>。

seg-7d993b676006 = 引擎为scenarios/gnss-ins.toml（类型gnss-ins）生成的图表

seg-ea4498cc0324 = <b>VALIDATED</b> 15状态误差状态EKF，松耦合（已在真实IMU/GNSS行驶数据上对照NaveGo验证）；紧耦合伪距/多普勒UKF以及耦合的钟+位置 。参考基准（oracle，ExternalDataset）：NaveGo v1.4（R. Gonzalez，LGPL-3.0，在GNU Octave下作为工具运行，从不链接）：其松耦合ins_gnss处理自带的真实Ekinox IMU/GNSS陆地车辆行驶数据，两个解均对照Ekinox参考轨迹评分。两个滤波器读取同一份{ "20" } Hz float32输入，Kshana的配置由数据集已发表参数机械映射而来。Kshana的水平与垂直位置RMS及其

seg-742a29ca1fb7 = 主题页面：<a1>TEST-BENCH.md</a1>

seg-f3cc3d82aba8 = <s1>上一页</s1>fusion

seg-af503aa1d900 = <s1>下一页</s1>gnss-sim
