# docs--kind-entry-heating: translations (zh-Hans)

seg-b3a829cb7d84 = { "1976" }美国标准大气（US Standard Atmosphere）

seg-99ef7c1d552c = 引擎v{ $version }的场景类型，所属类别为<a1>任务分析、链路与空间运行</a1>。仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。此处的每个标签都来自引擎或验证矩阵；除非矩阵另有说明，一种类型即为MODELLED（标签如何获得：见README的证据一节）。

seg-8f1e7d3f5a07 = 类别页面：<a1>任务分析、链路与空间运行</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }：列出此类型的<a1>验证矩阵</a1>各行。

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = 主题页面：<a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth

seg-13b9e9187ab9 = 来源：<c1/>

seg-3a3f732cc2dd = <c1/>（场景类型）

seg-b843e2e0a4ee = 在自转的球形地球或火星上的3-DoF质点大气再入（弹道式或恒定倾侧的升力式），RK4，穿过US76、指数大气或火星大气，采用Sutton-Graves驻点对流加热（NASA TR R-376）：峰值减速度、热流和动压，热载荷，下程，自转坐标系能量检查，以及并列给出的Allen-Eggers闭式。峰值减速度对照已发布的Stardust标称值进行检查；加热为MODELLED。

seg-05c8dac8d411 = 运行一次<c1/>的摘要为：entry-heating (earth): V_rel { "12551" } m/s，γ { "8.43" }° ->峰值{ "35.4" } g，位于{ "54.2" } km，峰值q { "746" } W/cm²，位于{ "62.0" } km，热载荷{ "20970" } J/cm²，峰值q_dyn { "20.8" } kPa；在{ "317" } s到达终止高度（闭式{ "60.2" } g；MODELLED的3-DoF，无辐射/TPS）

seg-96504cafb034 = 可选字段：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>、<c17/>、<c18/>、<c19/>、<c20/>、<c21/>

seg-1b68d973fd30 = 示例<c1/>设置了以下内容等：

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" }（{ "1958" }年）弹道常

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = 引擎给出的结果标签：MODELLED — 旋转球形行星上的3-DoF质点再入（中心引力，无J2），随行星共转的无风大气，C_D、L/D与倾侧角为常数，RK4；驻点对流加热依据NASA TR R-376（{ "1971" }），冷壁，无辐射加热，无TPS/烧蚀响应，非6-DoF

seg-dbb618cd6357 = 引擎为scenarios/entry-heating-stardust.toml（类型entry-heating）生成的图表

seg-e73b339df97b = <b>VALIDATED</b>旋转球形地球上穿越US Standard Atmosphere { "1976" }的3-DoF质点再入，从惯性再入状态出发以RK4积分，给出峰值减速度及其所在高度；来自i的行星相对再入状态 测试：<a1>entry_stardust_published.rs</a1>。

seg-10124432b79b = <b>MODELLED</b>驻点对流热流q = k sqrt(rho/R_n) V^{ "3" }，采用适用于地球空气与火星大气的Sutton-Graves常数（NASA TR R-376，{ "1971" }），给出沿3-DoF再入的峰值及积分热载荷，弹道式或升力式，于c测试：<a1>entry_stardust_published.rs</a1>。

seg-54d133781215 = <b>VALIDATED</b>旋转球形地球上穿越US Standard Atmosphere { "1976" }的3-DoF质点再入，从惯性再入状态出发以RK4积分，给出。参考基准（oracle，ExternalDataset）：Desai、Mitcheltree与Cheatwood的Stardust标称值（{ "1999" }，NASA NTRS { "20050042027" }）：行星相对速度{ "12.6" } km/s、发射质量{ "45.8" } kg时最大减速度为{ "33.4" } g，来自带完整气动数据库的6-DoF POST轨迹；再入界面取自Desai、Lyons、Tooley与Kangas（NTRS { "20090004445" }）：半径{ "6503.14" } km，惯性速度{ "12.9" } km/s，航迹角 -8.2 deg。判据已预先登记于xval/entry-stardust/PREREGISTRATION。

seg-03878684f9a1 = <b>MODELLED</b>驻点对流热流q = k sqrt(rho/R_n) V^{ "3" }，采用适用于地球空气与火星大气的Sutton-Graves常数（NASA TR R-376，{ "1971" }），其。参考基准（oracle，InternalConsistency）：内部自洽：NASA TR R-376中印出的关系式与常数、半步收敛检查，以及加热峰值与减速峰值的预期先后顺序。不包括的内容：未与任何已发表的加热值作比较（Stardust文献给出的是设计限值以及约{ "1200" } W/cm2的对流加辐射估计值，仅含对流的关系式无法与之相符）；无辐射加热、壁温或

seg-a0f300b2ce78 = MODELLED — 旋转球形行星上的3-DoF质点再入（中心引力，无J2），随行星共转的无风大气，C_D、L/D与倾侧角为常数，RK4；驻点对流加热依据NASA TR R-376（{ "1971" }），冷壁，无辐射加热，无TPS/烧蚀响应，非6-DoF（结果<c1/>）

seg-47f81ab160cc = 峰值减速度已对照已发表的Stardust标称值核对；加热为MODELLED。（类型目录（<c1/>））

seg-47cda83af127 = 再入界面半径为{ "6503.14" } km，惯性速度{ "12.9" } km/s，航迹角 -8.2 deg，质量{ "45.8" } kg，直径{ "0.811" } m，头部半径{ "0.2202" } m（Desai等，NASA NTRS { "20050042027" }与{ "20090004445" }）。纬度与航向为假定的太平洋上空近似再入；C_D取该模块{ "60" } deg球锥的默认值。已发表的6-DoF标称峰值减速度：{ "33.4" } g。加热仅为Sutton-Graves对流加热，MODELLED。（场景文件注释，第{ "4" }至{ "8" }行）

seg-98af076be1ac = 3-DoF再入的驻点对流再入加热（Sutton-Graves）为MODELLED，未经独立验证：它是对照自身的闭式/解析恒等式检查的，能发现转录和系数错误，但不是外部参考基准（oracle）。（验证矩阵（docs/MODELLED-RATIONALE.md））

seg-77c073cd5d67 = <s1>上一页</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>下一页</s1>eo-coverage
