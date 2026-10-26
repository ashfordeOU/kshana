# site-js.ftl (zh-Hans): translations

# src/js/t.mjs:4
js-app-engine-failed = 引擎无法加载（{ $reason }）。

# src/js/t.mjs:5
js-ledger-rows =
    { $n ->
       *[other] { $n } 条台账（ledger）记录
    }

# src/site.js:373
js-site-action-copy-install = 复制：cargo install kshana

# src/site.js:371
js-site-action-launch = 启动 { $name }

# src/site.js:375
js-site-action-licence = 洽谈商业许可

# src/site.js:374
js-site-action-pro-eval = 申请 Kshana Pro 评估

# src/site.js:376
js-site-action-study = 申请研究服务

# src/site.js:372
js-site-action-theme = 切换浅色或深色主题

# src/js/capabilities.mjs:689
js-site-capabilities-bd-after = { $s } s 后 { $m } m

# src/js/capabilities.mjs:675
js-site-capabilities-bd-combined = 合并

# src/js/capabilities.mjs:680
js-site-capabilities-bd-crossing = { $s } s 时 { $m } m

# src/js/capabilities.mjs:694
js-site-capabilities-bd-fig-crossing = «{ $m } m» 出现在 { $s } s 后，主导项为 { $dom }

# src/js/capabilities.mjs:693
js-site-capabilities-bd-fig-lead = 对数坐标轴上自 GNSS 丢失起的时间，{ $grade } 级 IMU，速度 { $speed } m/s：

# src/js/capabilities.mjs:695
js-site-capabilities-bd-fig-tail = 图中曲线为引擎的短时滑行增长规律及其平方和开方；交越点来自引擎完整的九状态（舒勒）误差模型，该模型对偏差项设有上界，因此在长时间滑行时，每个交越点都比曲线到达该处的时刻稍晚出现。柱状图：四个 IMU 等级的相同交越点。

# src/js/capabilities.mjs:816
js-site-capabilities-cd-canvas-aria = 围绕其天体的星座，真实影像：拖动或按方向键旋转，按加号和减号缩放

# src/js/capabilities.mjs:746
js-site-capabilities-cd-design-meta = { $n } 颗卫星 · { $body } · { $file }

# src/js/capabilities.mjs:788
js-site-capabilities-cd-foot-frozen = 每颗卫星沿引擎自身的轨迹运行；冻结轨道的半径由该壳层的轨道根数得出。

# src/js/capabilities.mjs:789
js-site-capabilities-cd-foot-mean-motion = 每颗卫星沿引擎自身的轨迹运行，轨道半径由其平均运动推得。

# src/js/capabilities.mjs:786
js-site-capabilities-cd-foot-walker = 全部 { $n } 颗卫星按各壳层自身的沃克参数布设（已与引擎的 { $shown } 条轨迹核对：最差 { $deg }°）；尾迹为引擎的 { $shown } 条轨迹。

# src/js/capabilities.mjs:819
js-site-capabilities-cd-hud-body = { $body } · «{ $n }» 颗卫星

# src/js/capabilities.mjs:820
js-site-capabilities-cd-hud-mission = 任务 «{ $time }»

# src/js/capabilities.mjs:782
js-site-capabilities-cd-legend-shell = 壳层 { $n } · { $inc }°

# src/js/capabilities.mjs:803
js-site-capabilities-cd-map-availability = 运行期间 PDOP ≤ { $limit } 的时间占比（0 至 100 %）

# src/js/capabilities.mjs:804
js-site-capabilities-cd-map-pdop = 每个 { $step }° 单元的平均 PDOP（{ $lo } 至 { $hi }；越亮越好）

# src/js/capabilities.mjs:805
js-site-capabilities-cd-map-visible = 平均可见卫星数（{ $lo } 至 { $hi }）

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-availability = 可用性

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-pdop = 平均 PDOP

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-visible = 可见数

# src/js/capabilities.mjs:812
js-site-capabilities-cd-pause = 暂停轨道

# src/js/capabilities.mjs:812
js-site-capabilities-cd-play = 播放轨道

# src/js/capabilities.mjs:749
js-site-capabilities-cd-shell = { $name }：沃克 { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

# src/js/capabilities.mjs:750
js-site-capabilities-cd-slots = { $name }：{ $n } 颗卫星，运营方的轨位表

# src/js/capabilities.mjs:784
js-site-capabilities-cd-span = 共 { $dur }，循环播放

# src/js/capabilities.mjs:770
js-site-capabilities-cd-stat-in-view = 平均可见数

# src/js/capabilities.mjs:771
js-site-capabilities-cd-stat-mask = 截止角 · 运行

# src/js/capabilities.mjs:769
js-site-capabilities-cd-stat-median = PDOP 中位数

# src/js/capabilities.mjs:767
js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }，整个 { $body }

# src/js/capabilities.mjs:766
js-site-capabilities-cd-stat-satellites = 卫星

# src/js/capabilities.mjs:768
js-site-capabilities-cd-stat-worst = 最差站点

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-gnss = 四大 GNSS 联合

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-leo = 低地球轨道巨型星座

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-lunar = 月球中继星组

# src/js/capabilities.mjs:779
js-site-capabilities-cd-work-ratio = 纬度预筛选后 { $pct } % · { $dop } 个 DOP 解

# src/js/capabilities.mjs:778
js-site-capabilities-cd-work-tests = { $after } 次卫星—点位检验，暴力扫描则需 { $brute } 次

# src/js/capabilities.mjs:777
js-site-capabilities-cd-work-title = 可见性计算量

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-sub = C/N0 相对于跟踪下限

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-title = 载噪比密度

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-availability = 可用性

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-fewest = 最少跟踪数

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-js = 平均 J/S

# src/js/capabilities.mjs:1037
js-site-capabilities-cg-compose-text = 一台干扰机，{ $power } { $unit }，位于同一地点，绑定到 { $n } 次 ‹{ $kind }› 类型的成员运行：海峡中的船舶与沿海公路上的汽车面对同一成因，得到不同的结果。

# src/js/capabilities.mjs:973
js-site-capabilities-cg-log-campaign = 测评活动 { $file } · { $phases } 个阶段 · { $runs } 次成员运行

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase = 阶段 { $name } 开始

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase-carries = 阶段 { $name } 开始 · 沿用 { $carried }

# src/js/capabilities.mjs:1017
js-site-capabilities-cg-monte-axis = { $n } 个随机种子（seed）下的最终钟差（{ $path }）

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-ci = 均值，95 % 区间

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-mean = 均值

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p05 = 第 5 百分位

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-p05-p95 = 第 5 至第 95 百分位

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p50 = 中位数

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p95 = 第 95 百分位

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-std = 标准差

# src/js/capabilities.mjs:1020
js-site-capabilities-cg-monte-text = 同一 ‹{ $kind }› 场景从基础随机种子（seed）{ $seed } 起运行 { $n } 次，每次一个随机种子：自由运行时钟最终误差的离散程度，及其均值的 95 % 置信区间。

# src/js/capabilities.mjs:969
js-site-capabilities-cg-not-in-phase = 不在本阶段

# src/js/capabilities.mjs:972
js-site-capabilities-cg-now = 第 { $n } 阶段，共 { $total } 个：{ $name } · { $from } 至 { $to }

# src/js/capabilities.mjs:940
js-site-capabilities-cg-phase-title = { $name }：{ $from } 至 { $to } · 由 { $by } 结束 · 成员类型 { $kinds }

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-sub = 相对于告警限值

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-title = 保护级

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-sub = 相对于其预算 · 对数

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-title = 惯性位置误差

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-range = { $lo } 至 { $hi }

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-all-lost = 全部丢失，自

# src/js/capabilities.mjs:998
js-site-capabilities-cg-sweep-axis = 干扰机发射功率（{ $key }）

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-first-loss = 首次丢失

# src/js/capabilities.mjs:1003
js-site-capabilities-cg-sweep-lg-availability = 可用性

# src/js/capabilities.mjs:1003
js-site-capabilities-cg-sweep-lg-js = 平均 J/S

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-never = 从未

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-nodes = 节点

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-none = 无

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-span = J/S 范围

# src/js/capabilities.mjs:1002
js-site-capabilities-cg-sweep-text = 一个 ‹{ $kind }› 场景，随干扰机发射功率从 { $from } 步进到 { $to } { $unit }，每个节点运行一次。干扰下的可用性（实线）和平均 J/S（虚线）来自各成员运行自身的性能指标。

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-sub = 相对于其保护限值

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-title = 时钟钟差

# src/js/capabilities.mjs:109
js-site-capabilities-copy = 复制

# src/js/capabilities.mjs:108
js-site-capabilities-copy-aria = 复制可复现本次运行的命令：kshana { $file }

# src/js/capabilities.mjs:1387
js-site-capabilities-cz-best = 最佳 PDOP

# src/js/capabilities.mjs:1374
js-site-capabilities-cz-failed = 此处无法加载已记录的运行；请改在 Studio 中打开。

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix = 有定位解的采样点

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix-value = { $n } / { $total }（{ $pct }%）

# src/js/capabilities.mjs:1388
js-site-capabilities-cz-median = PDOP 中位数

# src/js/capabilities.mjs:90
js-site-capabilities-engine = 引擎 v{ $version }

# src/js/capabilities.mjs:91
js-site-capabilities-engine-build = 引擎 v{ $version }，构建

# src/js/capabilities.mjs:104
js-site-capabilities-engine-report = 引擎报告

# src/js/capabilities.mjs:1287
js-site-capabilities-globe-aria = { $name }的真实影像（{ $credit }）。拖动或使用方向键旋转；按加号和减号缩放。

# src/js/capabilities.mjs:1334
js-site-capabilities-ho-ends = 运行于 { $t } 结束

# src/js/capabilities.mjs:1337
js-site-capabilities-ho-past-guard = 超出保护限值

# src/js/capabilities.mjs:92
js-site-capabilities-no-seed = 确定性，无随机种子（seed）

# src/js/capabilities.mjs:96
js-site-capabilities-open-in-studio = 在 { $studio } 中打开

# src/js/capabilities.mjs:104
js-site-capabilities-open-report = 打开引擎报告

# src/js/capabilities.mjs:1186
js-site-capabilities-orrery-aria = 运行历元时的太阳系：拖动或按方向键旋转，按加号和减号缩放

# src/js/capabilities.mjs:1228
js-site-capabilities-orrery-bodies = { $n } 个天体 · 观测者 «{ $observer }»

# src/js/capabilities.mjs:1227
js-site-capabilities-orrery-epoch = 历元 «{ $epoch }» · TDB（质心力学时），儒略日 { $jd }

# src/js/capabilities.mjs:1134
js-site-capabilities-pnt-chart-title = 可见中继星（线）· 地球在地平线以上（阴影）· 定位需要四颗

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-kicker = 此天体上的定位 · body-pnt 类型

# src/js/capabilities.mjs:1124
js-site-capabilities-pnt-lander = 位于地表 { $lat }°、{ $lon }° 的着陆器依靠中继星导航，只要地球在地平线以上，即可获得来自地球的双向测距（单向光行时 { $min } min）。可用性：仅用中继星为 { $a } %，加上地球链路为 { $b } %。

# src/js/capabilities.mjs:1125
js-site-capabilities-pnt-orbiter = 轨道上的用户依靠中继星导航，只要地球在地平线以上，即可获得来自地球的双向测距（单向光行时 { $min } min）。可用性：仅用中继星为 { $a } %，加上地球链路为 { $b } %。

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-relays = 环绕 { $body } 的 { $n } 颗中继星，高度 { $alt } km

# src/js/capabilities.mjs:97
js-site-capabilities-report-data = 报告与数据

# src/js/capabilities.mjs:107
js-site-capabilities-result-data = 结果数据

# src/js/capabilities.mjs:78
js-site-capabilities-saved = 已保存 { $name }

# src/js/capabilities.mjs:105
js-site-capabilities-scenario-file = 场景文件

# src/js/capabilities.mjs:92
js-site-capabilities-seed = 随机种子（seed）{ $seed }

# src/js/capabilities.mjs:568
js-site-capabilities-six-clock-fig = «{ $id }» 在 { $dur } 内保持在保护限值之内

# src/js/capabilities.mjs:563
js-site-capabilities-six-clock-guard = { $v } ns 保护限值

# src/js/capabilities.mjs:605
js-site-capabilities-six-coast-budget = { $m } m 预算

# src/js/capabilities.mjs:606
js-site-capabilities-six-coast-denied = GNSS 被拒止

# src/js/capabilities.mjs:609
js-site-capabilities-six-coast-fig = «{ $id }» 在 { $s } s 内保持在预算之内

# src/js/capabilities.mjs:527
js-site-capabilities-six-floor = 跟踪下限

# src/js/capabilities.mjs:595
js-site-capabilities-six-integ-fig = «{ $ok }» / { $n } 个历元可用 · 告警限值：水平 { $h } m，垂直 { $v } m

# src/js/capabilities.mjs:590
js-site-capabilities-six-integ-limit = 垂直告警限值

# src/js/capabilities.mjs:594
js-site-capabilities-six-integ-pl = 垂直（实线）与水平（虚线）保护级

# src/js/capabilities.mjs:534
js-site-capabilities-six-jam-effective = 有效，{ $n } 颗卫星

# src/js/capabilities.mjs:535
js-site-capabilities-six-jam-fig = 跟踪 «{ $min }» / 可见 { $max } · 干扰下的可用性 «{ $av }»（标称 { $nom }）· 平均 J/S «{ $js } dB»

# src/js/capabilities.mjs:533
js-site-capabilities-six-jam-nominal = 标称，无干扰机（虚线）

# src/js/capabilities.mjs:581
js-site-capabilities-six-orbit-fig = 高度 «{ $lo }–{ $hi } km» · { $dur } 内的星下点轨迹

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-label = { $source } · { $n } 个采样点

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-sgp4 = 由两行根数（TLE）得出的 SGP4

# src/js/capabilities.mjs:548
js-site-capabilities-six-spoof-detects = { $id } 检测到

# src/js/capabilities.mjs:550
js-site-capabilities-six-spoof-fig = «{ $id }» 在 { $s } s 时检测到（界限 { $ns } ns）

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-angle = 与太阳的夹角

# src/js/capabilities.mjs:1053
js-site-capabilities-ss-credit = 影像：{ $credits }。* 地图未覆盖两极；空缺处取地图极区平均颜色。土星环：{ $ring }（{ $licence }）。

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-days = { $v } 天

# src/js/capabilities.mjs:1076
js-site-capabilities-ss-frame-origin = 坐标系原点

# src/js/capabilities.mjs:1084
js-site-capabilities-ss-from-sun = 距太阳

# src/js/capabilities.mjs:1088
js-site-capabilities-ss-gloss = NAIF：美国国家航空航天局导航与辅助信息机构的天体编码。GM：引力参数。J2：扁率项。IAU 极：国际天文学联合会的自转极，以赤经（RA）和赤纬（Dec）表示。

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-j2-none = 无已发布值

# src/js/capabilities.mjs:1077
js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

# src/js/capabilities.mjs:1077
js-site-capabilities-ss-kind-of = { $parent }的{ $class } · NAIF { $naif }

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-light-time = 距 { $observer } 的光行时

# src/js/capabilities.mjs:1091
js-site-capabilities-ss-link = { $from } 至 { $to }，单向光行时 { $one }，往返 { $two }

# src/js/capabilities.mjs:1091
js-site-capabilities-ss-links-lead =
    { $n ->
       *[other] 本次运行计算的链路：
    }

# src/js/capabilities.mjs:1094
js-site-capabilities-ss-moons =
    { $n ->
       *[other] 其卫星，按比例绘制，历元时刻
    }

# src/js/capabilities.mjs:1106
js-site-capabilities-ss-nominal-error = 距离上的标称误差 { $km } km

# src/js/capabilities.mjs:1103
js-site-capabilities-ss-north = 自黄道北侧观察。

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period = 轨道周期

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period-about = 绕 { $parent } 的周期

# src/js/capabilities.mjs:1086
js-site-capabilities-ss-pole = IAU 极（RA，Dec）

# src/js/capabilities.mjs:1081
js-site-capabilities-ss-radius = 平均半径

# src/js/capabilities.mjs:1080
js-site-capabilities-ss-retrograde = { $v } h，逆行

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-rotation = 恒星自转

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-years = { $v } 年

# src/js/capabilities.mjs:653
js-site-capabilities-st-bound = { $v } m 界限

# src/js/capabilities.mjs:660
js-site-capabilities-st-fig-none = { $n } 个历元，无一误差超出其界限。横轴：真实位置误差；纵轴：保护级；均为对数坐标轴。

# src/js/capabilities.mjs:659
js-site-capabilities-st-fig-some = { $n } 个历元，其中 { $k } 个误差超出其界限。横轴：真实位置误差；纵轴：保护级；均为对数坐标轴。

# src/js/capabilities.mjs:649
js-site-capabilities-st-limit = 告警限值 { $m } m

# src/js/capabilities.mjs:650
js-site-capabilities-st-misleading = 误导性：误差超出界限

# src/js/capabilities.mjs:652
js-site-capabilities-st-normal = 正常运行

# src/js/capabilities.mjs:651
js-site-capabilities-st-unavailable = 不可用：界限超出限值

# src/js/capabilities.mjs:1408
js-site-capabilities-studio-embedded = { $studio }，已嵌入：orbit-multignss 运行

# src/js/capabilities.mjs:1406
js-site-capabilities-studio-load = 在此加载 { $studio }

# src/js/capabilities.mjs:1410
js-site-capabilities-studio-outline = 重新显示大纲

# src/js/capabilities.mjs:259
js-site-capabilities-wave-chirp = 线性调频

# src/js/capabilities.mjs:259
js-site-capabilities-wave-cw = CW 单音

# src/js/capabilities.mjs:260
js-site-capabilities-wave-noise = 噪声

# src/js/capabilities.mjs:388
js-site-capabilities-wf-an-caption = 行 T+{ $t } s · 高于下限的 dB，对数刻度 · 全网格峰值 { $peak } dB

# src/js/capabilities.mjs:357
js-site-capabilities-wf-degraded = 性能下降

# src/js/capabilities.mjs:364
js-site-capabilities-wf-degraded-low = 性能下降

# src/js/capabilities.mjs:134
js-site-capabilities-wf-failed = 此处无法加载已记录的运行。

# src/js/capabilities.mjs:247
js-site-capabilities-wf-grid = 网格

# src/js/capabilities.mjs:144
js-site-capabilities-wf-iq = 在 T+{ $t } s，引擎还将该模型绘制为 { $mhz } MHz 附近的 { $n } 个 IQ（同相与正交）采样，并据此核对韦尔奇（Welch）估计（{ $segments } 段，每段 { $nfft }）：积分功率比 { $ratio }。

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-off = { $what }关闭

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-on = { $what }开启

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · 自 { $on } s 至结束

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

# src/js/capabilities.mjs:357
js-site-capabilities-wf-lost = 失锁

# src/js/capabilities.mjs:364
js-site-capabilities-wf-lost-low = 失锁

# src/js/capabilities.mjs:392
js-site-capabilities-wf-max = 高于其 { $peak } dB · 对数刻度起自 { $v0 } dB

# src/js/capabilities.mjs:358
js-site-capabilities-wf-no-jammer = 无干扰机

# src/js/capabilities.mjs:239
js-site-capabilities-wf-now = 当前

# src/js/capabilities.mjs:437
js-site-capabilities-wf-pause = 暂停瀑布图

# src/js/capabilities.mjs:386
js-site-capabilities-wf-peak = 峰值 { $v } dB

# src/js/capabilities.mjs:437
js-site-capabilities-wf-play = 播放瀑布图

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-previous = 回放起点 · 下方为上一遍

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-start = 回放起点

# src/js/capabilities.mjs:364
js-site-capabilities-wf-say = T+{ $t } s，{ $band } { $v } dB-Hz，{ $state }

# src/js/capabilities.mjs:229
js-site-capabilities-wf-signal = 信号 +{ $v } dB

# src/js/capabilities.mjs:395
js-site-capabilities-wf-summary = { $file } 的已记录运行：{ $bands } 个频带，{ $jammers } 台干扰机，历时 { $seconds } 秒。最差频带 { $worst } 在 { $at } s 时降至 { $min } dB-Hz；跟踪下限 { $floor } dB-Hz。

# src/js/capabilities.mjs:416
js-site-capabilities-wf-tip-above = 高于噪声下限 { $v } dB

# src/js/capabilities.mjs:417
js-site-capabilities-wf-tip-in = 位于 { $bands }

# src/js/capabilities.mjs:357
js-site-capabilities-wf-tracking = 跟踪

# src/js/capabilities.mjs:364
js-site-capabilities-wf-tracking-low = 跟踪

# src/js/cap-hero.mjs:60
js-site-caphero-aria = 引擎太阳系运行在 { $date } 时的太阳系：太阳和 { $bodies } 个天体沿引擎轨道轨迹运动；其中 { $valid } 条轨道已与 JPL Horizons 核对一致。

# src/js/cap-hero.mjs:185
js-site-caphero-clock = +{ $days } 天 · { $date }

# src/js/cap-hero.mjs:69
js-site-caphero-copy-command = 复制命令

# src/js/cap-hero.mjs:69
js-site-caphero-copy-title = 复制可复现它的命令

# src/js/cap-hero.mjs:79
js-site-caphero-credits = 距离按对数刻度压缩，方向为真实方向；天体经放大，以显示速率自转。影像：{ $credits }；土星环：{ $ring }（{ $licence }）。

# src/js/cap-hero.mjs:77
js-site-caphero-credits-summary = 比例与影像来源

# src/js/cap-hero.mjs:64
js-site-caphero-engine-build = 引擎 v{ $version }，构建

# src/js/cap-hero.mjs:65
js-site-caphero-explore = 浏览所有天体

# src/js/cap-hero.mjs:67
js-site-caphero-file-title = 所运行的场景文件

# src/js/cap-hero.mjs:59
js-site-caphero-list-item = { $name }：{ $label }，历元时距太阳 { $au } au，轨道周期 { $period }。

# src/js/cap-hero.mjs:58
js-site-caphero-list-item-light = { $name }：{ $label }，历元时距太阳 { $au } au，轨道周期 { $period }，距 { $observer } 的光行时 { $light }。

# src/js/cap-hero.mjs:64
js-site-caphero-no-seed = 确定性，无随机种子（seed）

# src/js/cap-hero.mjs:72
js-site-caphero-open-in-studio = 在 { $studio } 中打开

# src/js/cap-hero.mjs:203
js-site-caphero-pause = 暂停轨道

# src/js/cap-hero.mjs:55
js-site-caphero-period-days = { $value } 天

# src/js/cap-hero.mjs:55
js-site-caphero-period-years = { $value } 年

# src/js/cap-hero.mjs:203
js-site-caphero-play = 播放轨道

# src/js/cap-hero.mjs:52
js-site-caphero-rate = 每秒 { $days } 天的运行时间

# src/js/cap-hero.mjs:52
js-site-caphero-rate-epoch = 运行历元时的画面

# src/js/cap-hero.mjs:135
js-site-caphero-read-distance = 距太阳 { $au } au

# src/js/cap-hero.mjs:136
js-site-caphero-read-light = 历元时距 { $observer } 的光行时 { $light }

# src/js/cap-hero.mjs:135
js-site-caphero-read-orbit = 轨道 { $period }

# src/js/cap-hero.mjs:64
js-site-caphero-seed = 随机种子（seed）{ $seed }

# src/site.js:239
js-site-copy-aria = 复制：{ $cmd }

# src/js/developers.mjs:41
js-site-developers-captured-from = 记录于 { $recorded }，来自

# src/js/developers.mjs:41
js-site-developers-engine-build = 引擎 v{ $version }，构建

# src/js/developers.mjs:51
js-site-developers-exit-stamp = 退出码 { $rc } · { $ms } ms

# src/js/developers.mjs:44
js-site-developers-file-open-in-studio = { $file }：在 { $studio } 中打开

# src/js/developers.mjs:45
js-site-developers-no-seed = （确定性，无随机种子（seed））

# src/js/developers.mjs:44
js-site-developers-open-in-studio = 在 { $studio } 中打开

# src/js/developers.mjs:89
js-site-developers-pause = 暂停回放

# src/js/developers.mjs:89
js-site-developers-play = 播放回放

# src/js/developers.mjs:70
js-site-developers-replaying = # 正在回放已记录的会话

# src/js/developers.mjs:45
js-site-developers-seed = （随机种子（seed）{ $seed }）

# src/js/developers.mjs:46
js-site-developers-what-runs-write = 每次运行写出的内容

# src/js/editions.mjs:89
js-site-editions-builds-on-it = { $label } 以其为基础

# src/js/editions.mjs:74
js-site-editions-core-kinds =
    { $n ->
       *[other] { $n } 种类型
    }

# src/js/editions.mjs:73
js-site-editions-core-title = 开源核心

# src/js/editions.mjs:76
js-site-editions-core-validated = 已验证

# src/js/editions.mjs:75
js-site-editions-core-validated-of = { $validated } / { $total }

# src/js/editions.mjs:89
js-site-editions-free-core = 开源核心中免费提供，与所有类型相同

# src/js/editions.mjs:32
js-site-editions-group-other = 其他

# src/js/editions.mjs:87
js-site-editions-kind-no-ledger = 没有名称相符的台账（ledger）模块

# src/js/editions.mjs:87
js-site-editions-kind-validated = { $tot } 条台账（ledger）记录中 { $v } 条已验证

# src/js/editions.mjs:98
js-site-editions-pause = 暂停环

# src/js/editions.mjs:98
js-site-editions-play = 播放环

# src/js/editions.mjs:48
js-site-editions-ring-pro = Kshana Pro

# src/js/editions.mjs:49
js-site-editions-ring-study = 定制研究

# src/js/evidence.mjs:319
js-site-evidence-allan-aria = NIST SP 1065 的 1000 点数据集的四种偏差随平均时间变化；已发布的全部 { $n } 个值均已复现，最差相对误差 { $err }

# src/js/evidence.mjs:340
js-site-evidence-allan-lg-published = 已发布值，SP 1065 表 31

# src/js/evidence.mjs:312
js-site-evidence-allan-mdev = 修正阿伦偏差

# src/js/evidence.mjs:346
js-site-evidence-allan-na = n/a

# src/js/evidence.mjs:312
js-site-evidence-allan-oadev = 重叠阿伦偏差

# src/js/evidence.mjs:312
js-site-evidence-allan-ohdev = 重叠阿达玛偏差

# src/js/evidence.mjs:347
js-site-evidence-allan-read = { $tau } s · 阿伦 { $oadev } · 修正 { $mdev } · 阿达玛 { $ohdev }

# src/js/evidence.mjs:341
js-site-evidence-allan-st-gate = 该测试的门限

# src/js/evidence.mjs:341
js-site-evidence-allan-st-reproduced = 已复现的已发布值

# src/js/evidence.mjs:341
js-site-evidence-allan-st-worst = 最差相对误差

# src/js/evidence.mjs:312
js-site-evidence-allan-tdev = 时间偏差，单位为秒

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-at = «{ $name }» 在 { $m } s

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-engine = 引擎：«{ $got }» · 相对误差 { $err }

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-table = SP 1065 表 31：«{ $want }»

# src/js/evidence.mjs:469
js-site-evidence-cell-tip = 第 { $i } 项能力，共 { $n } 项 · «{ $label }»

# src/js/evidence.mjs:222
js-site-evidence-cowell-aria = 24 小时内相对 Orekit 的位置差：第 1 至 5 级力模型层级保持在 { $worst } 以下；阻力层级达到 { $drag }，属于表征区间

# src/js/capabilities.mjs:809
js-site-capabilities-cd-no-webgl = 3-D 视图需要 WebGL；覆盖图和各项数据来自同一次运行。

# src/js/evidence.mjs:236
js-site-evidence-cowell-gto = 地球同步转移轨道

# src/js/evidence.mjs:236
js-site-evidence-cowell-leo = 低地球轨道

# src/js/evidence.mjs:242
js-site-evidence-cowell-lg-con = 第 1 至 5 级，二体直至太阳辐射压，每级两条轨道

# src/js/evidence.mjs:242
js-site-evidence-cowell-lg-drag = 第 6 级，大气阻力：仅作表征（密度模型不同）

# src/js/evidence.mjs:251
js-site-evidence-cowell-read = { $h } h · 第 1 至 5 级最差 { $con } · 阻力 { $drag }

# src/js/evidence.mjs:243
js-site-evidence-cowell-st-drag = 阻力层级，最差

# src/js/evidence.mjs:243
js-site-evidence-cowell-st-epochs = 第 1 至 5 级中的历元

# src/js/evidence.mjs:236
js-site-evidence-cowell-tip-tier = «第 { $tier } 级：{ $label }» · { $regime }

# src/js/evidence.mjs:236
js-site-evidence-cowell-tip-worst = 在 { $h } h 时最大差值 «{ $err }»

# src/js/evidence.mjs:539
js-site-evidence-hero-live = { $label }。{ $cap }。{ $oracle }

# src/js/evidence.mjs:537
js-site-evidence-hero-no-oracle = 未指明外部参考基准（oracle，独立参照）。

# src/js/evidence.mjs:536
js-site-evidence-hero-oracle = 参考基准（oracle，独立参照）

# src/js/evidence.mjs:539
js-site-evidence-hero-oracle-is = 参考基准（oracle，独立参照）：{ $o }

# src/js/evidence.mjs:536
js-site-evidence-hero-owner = 责任方

# src/js/evidence.mjs:537
js-site-evidence-hero-partner = 由合作方负责；引擎对此不作任何主张。

# src/js/evidence.mjs:544
js-site-evidence-hero-pause = 暂停扫描

# src/js/evidence.mjs:544
js-site-evidence-hero-play = 播放扫描

# src/js/evidence.mjs:531
js-site-evidence-hero-row = 第 { $i } 行，共 { $n } 行

# src/js/evidence.mjs:381
js-site-evidence-hold-accepted = 接受：在 { $bar } 倍以内

# src/js/evidence.mjs:359
js-site-evidence-hold-aria = 铯钟相对于滑行时间的实测均方根钟差，及引擎的预测；预测与实测的越限时刻之比，范围从 { $lo } 到 { $hi }

# src/js/evidence.mjs:387
js-site-evidence-hold-control = «对照：»朴素预测（将一秒稳定度视为白频率噪声）得出的比值为 { $ratio }，约偏离 { $factor } 倍，同一判据下不能通过。该判据有约束力。

# src/js/evidence.mjs:375
js-site-evidence-hold-lg-meas = 在保留集（封存的数据集）记录上实测（圆点：越限）

# src/js/evidence.mjs:375
js-site-evidence-hold-lg-pred = 由前三分之一预测（圆环：越限）

# src/js/evidence.mjs:354
js-site-evidence-hold-nodata = 生成本页面时，实测记录不可用。

# src/js/evidence.mjs:383
js-site-evidence-hold-perfect = 1 = 完全吻合

# src/js/evidence.mjs:377
js-site-evidence-hold-ratio-aria = { $n } 个阈值的预测与实测之比，全部在可接受的 { $bar } 倍以内

# src/js/evidence.mjs:393
js-site-evidence-hold-read = 滑行 { $h } h · 实测 { $m } ns · 预测 { $p } ns

# src/js/evidence.mjs:388
js-site-evidence-hold-st-fit = 用于拟合

# src/js/evidence.mjs:388
js-site-evidence-hold-st-samples = 一秒采样点

# src/js/evidence.mjs:388
js-site-evidence-hold-st-syncs = 保留集同步点

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-breach = 预测越限 { $p } s · 实测 { $m } s

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-error = «钟差 { $thr } ns»

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-ratio = 预测与实测之比 «{ $ratio }»

# src/js/evidence.mjs:382
js-site-evidence-hold-tip-row = «{ $thr } ns» · 预测与实测之比 «{ $ratio }»

# src/js/evidence.mjs:171
js-site-evidence-kernel-chi2-cdf = 卡方分布

# src/js/evidence.mjs:172
js-site-evidence-kernel-chi2-quantile = 卡方分位数

# src/js/evidence.mjs:175
js-site-evidence-kernel-noncentral = 非中心卡方

# src/js/evidence.mjs:173
js-site-evidence-kernel-normal-cdf = 正态分布

# src/js/evidence.mjs:174
js-site-evidence-kernel-normal-quantile = 正态分位数

# src/js/evidence.mjs:176
js-site-evidence-kernel-pbias = 检测偏差

# src/js/evidence.mjs:274
js-site-evidence-ladder-aria = 轨道残差，从 { $lo } 到 { $hi } m，位于同一对数刻度上，并标出 { $bar } m 的机构判据

# src/js/evidence.mjs:284
js-site-evidence-ladder-bar = 机构判据 { $bar } m

# src/js/evidence.mjs:265
js-site-evidence-ladder-cowell = Cowell 对 Orekit 12.2，最差

# src/js/evidence.mjs:267
js-site-evidence-ladder-g24 = Galileo E11，24 小时拟合

# src/js/evidence.mjs:266
js-site-evidence-ladder-g8 = Galileo E11，8 小时拟合

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-headline = 头条残差

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-over = 超出 { $bar } m 的机构判据

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-ring = 仅力模型，未加经验加速度

# src/js/evidence.mjs:269
js-site-evidence-ladder-lro = 月球勘测轨道器，4 小时拟合

# src/js/evidence.mjs:307
js-site-evidence-ladder-read = 扫描位于 { $v } · { $total } 个头条残差中有 { $n } 个不超过该值

# src/js/evidence.mjs:262
js-site-evidence-ladder-rt-arc = { $arc } 弧段 · 阶次 { $do } · { $n } 个观测

# src/js/evidence.mjs:262
js-site-evidence-ladder-rt-rtn = 径向 { $r } m · 沿迹 { $a } m · 横向 { $c } m

# src/js/evidence.mjs:264
js-site-evidence-ladder-sgp4 = SGP4 对 AIAA 向量，最差

# src/js/evidence.mjs:268
js-site-evidence-ladder-swarm = Swarm-A，3 小时拟合

# src/js/evidence.mjs:265
js-site-evidence-ladder-tip-cowell = «Cowell · { $n } 个历元中最差» · { $worst }

# src/js/evidence.mjs:267
js-site-evidence-ladder-tip-g24 = «Galileo E11 · 整整一天» · { $rms } m

# src/js/evidence.mjs:266
js-site-evidence-ladder-tip-g8a = «Galileo E11 · 仅力模型» · { $rms } m

# src/js/evidence.mjs:266
js-site-evidence-ladder-tip-g8b = «Galileo E11 · 含经验加速度» · { $rms } m

# src/js/evidence.mjs:269
js-site-evidence-ladder-tip-lrd = «月球轨道器 · 动力学» · { $rms } m

# src/js/evidence.mjs:269
js-site-evidence-ladder-tip-lrr = «月球轨道器 · 简化动力学» · { $rms } m，高于 { $bar } m 判据，如实报告

# src/js/evidence.mjs:264
js-site-evidence-ladder-tip-sgp4 = «SGP4 · { $n } 个向量中最差» · { $worst }

# src/js/evidence.mjs:268
js-site-evidence-ladder-tip-swd = «Swarm-A · 动力学» · { $rms } m，几乎全在沿迹方向（大气阻力）

# src/js/evidence.mjs:268
js-site-evidence-ladder-tip-swr = «Swarm-A · 简化动力学» · { $rms } m

# src/js/evidence.mjs:183
js-site-evidence-raim-aria = { $n } 个 SciPy 用例中有 { $pass } 个落在容差带内，涉及 { $kernels } 个核

# src/js/evidence.mjs:187
js-site-evidence-raim-lane = { $kernel } · { $n }

# src/js/evidence.mjs:209
js-site-evidence-raim-lg-most = 任一用例占用容差带的最大比例

# src/js/evidence.mjs:214
js-site-evidence-raim-read = 第 { $q } 个用例，共 { $n } 个 · { $kernel } · { $what }

# src/js/evidence.mjs:214
js-site-evidence-raim-read-band = 占容差带 { $pct } %

# src/js/evidence.mjs:199
js-site-evidence-raim-scale-aria = 色标：已用容差带的占比，对数刻度，从 10 的负 11 次方到容差带边缘

# src/js/evidence.mjs:210
js-site-evidence-raim-st-inside = 在容差带内

# src/js/evidence.mjs:210
js-site-evidence-raim-st-most = 已用容差带的最大比例

# src/js/evidence.mjs:203
js-site-evidence-raim-tick-edge = 容差带边缘

# src/js/evidence.mjs:203
js-site-evidence-raim-tick-exact = 完全一致

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-case = «{ $kernel }» · 第 { $j } 个用例，共 { $n } 个

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-exact = 与 SciPy «完全一致»

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-uses = 占用其容差带的 «{ $pct } %»

# src/js/evidence.mjs:132
js-site-evidence-sgp4-aria = 全部 { $n } 个 AIAA 向量中的 { $n } 个均已复现；最差 { $worst }，中位数 { $median }，全部在 { $tol } 容差以内

# src/js/evidence.mjs:139
js-site-evidence-sgp4-deep = 深空（SDP4）

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-deep = 深空向量（SDP4）

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-median = 刻度上的中位数与最差值

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-near = 近地向量（SGP4）

# src/js/evidence.mjs:139
js-site-evidence-sgp4-near = 近地（SGP4）

# src/js/evidence.mjs:165
js-site-evidence-sgp4-read = 第 { $i } 个向量，共 { $n } 个 · 卫星 { $sat } · 误差 { $err }

# src/js/evidence.mjs:164
js-site-evidence-sgp4-read-deep = 第 { $i } 个向量，共 { $n } 个 · 卫星 { $sat }，深空 · 误差 { $err }

# src/js/evidence.mjs:144
js-site-evidence-sgp4-scale-aria = 色标，从 0.1 微米到容差，对数刻度

# src/js/evidence.mjs:159
js-site-evidence-sgp4-st-deep = 深空向量

# src/js/evidence.mjs:159
js-site-evidence-sgp4-st-sats = 测试卫星

# src/js/evidence.mjs:139
js-site-evidence-sgp4-tip-sat = «卫星 { $sat }» · { $kind }

# src/js/evidence.mjs:139
js-site-evidence-sgp4-tip-vector = 第 { $j } 个向量，共 { $n } 个 · 位置误差 «{ $err }»

# src/js/evidence.mjs:159
js-site-evidence-st-median = 中位数

# src/js/evidence.mjs:159
js-site-evidence-st-worst = 最差

# src/js/evidence.mjs:148
js-site-evidence-tolerance = 容差 { $v }

# src/site.js:277
js-site-filter-in-all = 共 { $total }

# src/site.js:276
js-site-filter-matches =
    { $n ->
       *[other] { $n } 项匹配
    }

# src/site.js:276
js-site-filter-n-of-m = { $n } / { $total }

# src/site.js:279
js-site-filter-n-of-m-rows = { $total } 行中的 { $n } 行

# src/site.js:276
js-site-filter-rows = { $total } 行

# src/js/home.mjs:258
js-site-home-banner-gnss-lost = GNSS 丢失 · 守时（holdover）

# src/js/home.mjs:258
js-site-home-banner-holdover-out = 守时（holdover）· 时钟超出保护限值

# src/js/home.mjs:259
js-site-home-banner-integrity-holdover = 完好性告警 · 守时（holdover）继续

# src/js/home.mjs:259
js-site-home-banner-integrity-none = 完好性告警 · 无保护级

# src/js/home.mjs:259
js-site-home-banner-integrity-pl = 完好性告警 · PL > AL

# src/js/home.mjs:256
js-site-home-banner-jamming = 压制干扰（jamming）· C/N0 接近下限

# src/js/home.mjs:257
js-site-home-banner-spoofing = 欺骗干扰（spoofing）告警 · 射频检测器

# src/js/home.mjs:251
js-site-home-cap-holdover = 干扰机升至 { $dbw } dBW：{ $trk } 颗卫星在跟踪。时钟自欺骗器留下的 { $carry } ns 起自由运行，并在 { $at } 越过其 { $guard } ns 保护限值；INS 继续滑行。

# src/js/home.mjs:252
js-site-home-cap-integrity = 卫星恢复，但仅在 { $mask }° 截止角以上：{ $trk } 颗在跟踪。保护级超过 { $al } m 告警限值或无法形成，因此监测器告警，时钟仍处于守时（holdover）。

# src/js/home.mjs:249
js-site-home-cap-jamming = 一台宽带干扰机位于 { $km } km 外，功率 { $dbw } dBW。C/N0 降至 { $cn } dB-Hz，高于 { $floor } dB-Hz 的跟踪下限 { $above } dB；全部 { $trk } 颗卫星仍在跟踪。

# src/js/home.mjs:248
js-site-home-cap-nominal = 跟踪 { $trk } 颗卫星，平均 C/N0 为 { $cn } dB-Hz。时钟已驯服至 GNSS 时间，保护级（{ $pl } m）低于 { $al } m 告警限值。

# src/js/home.mjs:253
js-site-home-cap-recovery = GNSS 已重新同步：{ $trk } 颗卫星在跟踪，钟差回到 { $te } ns，保护级 { $pl } m。

# src/js/home.mjs:250
js-site-home-cap-spoofing = 欺骗器以 { $rate } ns/s 牵引接收机时钟。RF（射频）检测器立即告警；时钟辅助监测器在 { $det } s 后触发，该阶段结束时已拉回 { $off } ns。

# src/js/home.mjs:120
js-site-home-cn-no-lock = 跟踪 0 / { $max } · 未锁定

# src/js/home.mjs:120
js-site-home-cn-tracking = 跟踪 { $n } / { $max }

# src/js/home.mjs:114
js-site-home-no-pl = 无 PL

# src/js/home.mjs:329
js-site-home-pause = 暂停任务

# src/js/home.mjs:121
js-site-home-pl-alarm = 告警 · PL 高于 AL

# src/js/home.mjs:121
js-site-home-pl-no-sats = 无卫星，无 PL

# src/js/home.mjs:121
js-site-home-pl-not-computed = 本阶段未计算

# src/js/home.mjs:121
js-site-home-pl-too-few = 卫星过少

# src/js/home.mjs:121
js-site-home-pl-under-al = 低于 { $thr } m 的 AL

# src/js/home.mjs:329
js-site-home-play = 播放任务

# src/js/home.mjs:214
js-site-home-receiver-tracking = 接收机 · 跟踪 { $n }

# src/js/home.mjs:226
js-site-home-replay-restarted = 回放已重新开始 · { $file }

# src/js/home.mjs:119
js-site-home-te-disciplined = 已驯服至 GNSS

# src/js/home.mjs:119
js-site-home-te-free-running = 守时（holdover）· 自由运行

# src/js/home.mjs:119
js-site-home-te-outside-guard = 守时（holdover）· 超出保护限值

# src/js/home.mjs:119
js-site-home-te-spoofer = 欺骗器牵引时钟

# src/js/home.mjs:60
js-site-home-thr-floor = 下限

# src/js/home.mjs:59
js-site-home-thr-guard = 保护限值

# src/site.js:408
js-site-kind-action = 操作

# src/js/mcp-player.mjs:92
js-site-mcp-arguments-excerpt = 参数（节选）

# src/js/mcp-player.mjs:70
js-site-mcp-axis-mission-time = 任务时间

# src/js/mcp-player.mjs:97
js-site-mcp-clock-holdover = { $clock } 守时（holdover）

# src/js/mcp-player.mjs:28
js-site-mcp-dir-reply = kshana-mcp → 助手

# src/js/mcp-player.mjs:28
js-site-mcp-dir-request = 助手 → kshana-mcp

# src/js/mcp-player.mjs:52
js-site-mcp-figcaption = 依据返回的序列绘制：各时钟的钟差相对于阈值

# src/js/mcp-player.mjs:46
js-site-mcp-fom-availability = 可用性

# src/js/mcp-player.mjs:44
js-site-mcp-fom-caption = run_scenario 为每个时钟返回的性能指标

# src/js/mcp-player.mjs:45
js-site-mcp-fom-header = 性能指标

# src/js/mcp-player.mjs:46
js-site-mcp-fom-holdover = 守时（holdover）（s）

# src/js/mcp-player.mjs:46
js-site-mcp-fom-p95 = 钟差，第 95 百分位（ns）

# src/js/mcp-player.mjs:46
js-site-mcp-fom-rms = 钟差，均方根（ns）

# src/js/mcp-player.mjs:21
js-site-mcp-lede = 记录于 { $recorded } · v{ $version } · 标准输入输出 · 协议 { $protocol } · 仅限原始消息

# src/js/mcp-player.mjs:73
js-site-mcp-legend-gnss-lost = GNSS 于 { $s } s 丢失

# src/js/mcp-player.mjs:73
js-site-mcp-legend-threshold = 阈值 { $v } ns

# src/js/mcp-player.mjs:158
js-site-mcp-pause = 暂停

# src/js/mcp-player.mjs:158
js-site-mcp-play = 播放

# src/js/mcp-player.mjs:51
js-site-mcp-plot-aria = run_scenario 返回的 { $quantum } 与 { $classical } 的钟差，相对于 { $threshold } ns 阈值；GNSS（全球导航卫星系统）于 { $lost } s 丢失

# src/js/mcp-player.mjs:35
js-site-mcp-recorded-json = 已记录的 JSON：{ $label }

# src/js/mcp-player.mjs:96
js-site-mcp-scenario-hash = 场景哈希

# src/js/mcp-player.mjs:81
js-site-mcp-server-identity = 服务器标识

# src/js/mcp-player.mjs:34
js-site-mcp-show-json = 显示 JSON

# src/js/mcp-player.mjs:109
js-site-mcp-step-aria = 第 { $n } 步，共 { $total } 步：{ $name }

# src/js/mcp-player.mjs:100
js-site-mcp-step-result = 结果：性能指标

# src/js/mcp-player.mjs:137
js-site-mcp-step-status = 第 { $n } 步，共 { $total } 步 · { $name }

# src/js/mcp-player.mjs:98
js-site-mcp-summary-excerpt = 摘要行与结果（节选）

# src/js/mcp-player.mjs:100
js-site-mcp-tab-result = 结果

# src/js/mcp-player.mjs:96
js-site-mcp-threshold = 阈值

# src/js/mcp-player.mjs:90
js-site-mcp-toml-lines =
    { $n ->
       *[other] { $n } 行
    }

# src/js/mcp-player.mjs:38
js-site-mcp-toml-more = …（{ $file } 另有 { $n } 行）

# src/js/mcp-player.mjs:86
js-site-mcp-tool-count =
    { $n ->
       *[other] { $n } 个工具
    }

# src/js/mcp-player.mjs:87
js-site-mcp-tools-with-descriptions =
    { $n ->
       *[other] { $n } 个带说明的工具
    }

# src/site.js:71
js-site-menu-close = 关闭菜单

# src/site.js:71
js-site-menu-open = 打开菜单

# src/js/missions.mjs:658
js-site-missions-avail-title = 可用性：运行期间 PDOP ≤ { $limit } 的时间占比

# src/js/missions.mjs:657
js-site-missions-avail-uniform = 每个单元均为 { $v } %

# src/js/missions.mjs:880
js-site-missions-chart-error-title = 位置误差（m，对数）

# src/js/missions.mjs:875
js-site-missions-chart-four = 定位需要四颗

# src/js/missions.mjs:875
js-site-missions-chart-four-short = 定位需四颗

# src/js/missions.mjs:885
js-site-missions-chart-lg-earth = 地球可见

# src/js/missions.mjs:885
js-site-missions-chart-lg-error-earth = 误差，中继星加地球测距

# src/js/missions.mjs:885
js-site-missions-chart-lg-error-relays = 误差，仅中继星

# src/js/missions.mjs:885
js-site-missions-chart-lg-relays = 可见中继星

# src/js/missions.mjs:876
js-site-missions-chart-relays-title = 可见中继星 · 阴影：地球在地平线以上

# src/js/missions.mjs:564
js-site-missions-chip-at-pdop = 在 PDOP ≤ { $limit } 时

# src/js/missions.mjs:570
js-site-missions-chip-engine = 引擎：

# src/js/missions.mjs:565
js-site-missions-chip-fix-earth = 定位解，含地球

# src/js/missions.mjs:564
js-site-missions-chip-median-pdop = PDOP 中位数

# src/js/missions.mjs:565
js-site-missions-chip-relays = 中继星

# src/js/missions.mjs:565
js-site-missions-chip-rms = RMS 误差

# src/js/missions.mjs:564
js-site-missions-chip-satellites = 卫星

# src/js/missions.mjs:567
js-site-missions-chip-tracking-held = { $label } 保持跟踪

# src/js/missions.mjs:284
js-site-missions-clocks-aria = 守时（holdover）一天后的钟差，按时钟等级，对数刻度

# src/js/missions.mjs:295
js-site-missions-clocks-frame = 框架下限 { $ns } ns

# src/js/missions.mjs:285
js-site-missions-clocks-note = 一天后的钟差，秒（对数）

# src/js/missions.mjs:292
js-site-missions-clocks-sigma = σy(1 s) { $sigma }

# src/js/missions.mjs:290
js-site-missions-clocks-title = { $clock }：一天后 { $ns } ns，σy(1 s) { $sigma }

# src/js/missions.mjs:311
js-site-missions-cone-aria = GNSS 丢失后的位置误差锥

# src/js/missions.mjs:314
js-site-missions-cone-axis-x = 自 GNSS 丢失起的时间（s）

# src/js/missions.mjs:315
js-site-missions-cone-axis-y = 位置误差（m）

# src/js/missions.mjs:322
js-site-missions-cone-budget = ±{ $m } m 预算

# src/js/missions.mjs:327
js-site-missions-cone-clipped = 在 ±{ $m } m 处截断

# src/js/missions.mjs:324
js-site-missions-cone-leaves = 于 { $s } s 离开

# src/js/missions.mjs:335
js-site-missions-cone-readout = t { $t } s · { $errors }

# src/js/missions.mjs:479
js-site-missions-copy-command = 复制命令

# src/js/missions.mjs:479
js-site-missions-copy-title = 复制可复现它的命令

# src/js/missions.mjs:987
js-site-missions-deterministic = 确定性

# src/js/missions.mjs:487
js-site-missions-engine-build = 引擎 v{ $version }，构建

# src/js/missions.mjs:590
js-site-missions-engine-build-commit = 引擎 v{ $version }，构建 { $commit }

# src/js/missions.mjs:393
js-site-missions-fp-aria = 干扰覆盖范围图。用方向键在单元之间移动，按 Enter 打开该次运行。

# src/js/missions.mjs:370
js-site-missions-fp-aria-svg = 干扰机周围的干扰覆盖范围

# src/js/missions.mjs:388
js-site-missions-fp-darker = 越深 = 平均 J/S 越高 · { $step } km 单元 · { $n } 次引擎运行

# src/js/missions.mjs:381
js-site-missions-fp-jammer = 干扰机

# src/js/missions.mjs:385
js-site-missions-fp-lg-held = 保持跟踪

# src/js/missions.mjs:385
js-site-missions-fp-lg-lost = 所有卫星均丢失

# src/js/missions.mjs:385
js-site-missions-fp-lg-some = 部分历元丢失

# src/js/missions.mjs:418
js-site-missions-fp-open = 在 { $studio } 中打开此次运行

# src/js/missions.mjs:419
js-site-missions-fp-read = 距干扰机约 { $km } km · 平均 J/S { $js } dB · 跟踪可用性 { $av }

# src/js/missions.mjs:382
js-site-missions-fp-ship = 场景中的船舶

# src/js/missions.mjs:209
js-site-missions-grades-aria = 在 { $a } m 和 { $b } m 之前的纯惯性滑行，按 IMU 等级

# src/js/missions.mjs:216
js-site-missions-grades-axis = GNSS 丢失后的滑行秒数（对数）

# src/js/missions.mjs:223
js-site-missions-grades-point = { $grade }：{ $s } s 达到 { $m } m（{ $why }）

# src/js/missions.mjs:210
js-site-missions-grades-reaches = 误差达到 { $m } m

# src/js/missions.mjs:211
js-site-missions-grades-speed = 速度 { $v } m/s

# src/js/missions.mjs:221
js-site-missions-grades-this = 本场景

# src/js/missions.mjs:1206
js-site-missions-hud-earth-link = 地球链路

# src/js/missions.mjs:1271
js-site-missions-hud-link-above = 地球链路 · 在地平线以上

# src/js/missions.mjs:1271
js-site-missions-hud-link-occulted = 地球链路 · 被遮挡

# src/js/missions.mjs:1203
js-site-missions-hud-orbiter = 轨道器

# src/js/missions.mjs:1204
js-site-missions-hud-receiver = 接收机

# src/js/missions.mjs:1203
js-site-missions-hud-relays = 中继星

# src/js/missions.mjs:1204
js-site-missions-hud-selected-lat = 所选纬度

# src/js/missions.mjs:814
js-site-missions-info-in-view = 可见数

# src/js/missions.mjs:814
js-site-missions-info-in-view-value = 平均 { $mean } · 最少 { $fewest }

# src/js/missions.mjs:814
js-site-missions-info-pdop-above = { $pdop }，高于 { $limit }

# src/js/missions.mjs:475
js-site-missions-json-title = 引擎的结果，未经修改

# src/js/missions.mjs:464
js-site-missions-json-unavailable = JSON 不可用

# src/js/missions.mjs:648
js-site-missions-key-avail = 可用性

# src/js/missions.mjs:855
js-site-missions-key-pdop-title = 平均 PDOP（位置精度因子）

# src/js/missions.mjs:648
js-site-missions-key-vis = 可见卫星数

# src/js/missions.mjs:648
js-site-missions-key-vis-short = 可见数

# src/js/missions.mjs:595
js-site-missions-leo-grid = 的网格满足 PDOP ≤ { $limit }

# src/js/missions.mjs:595
js-site-missions-leo-in-view = 平均可见

# src/js/missions.mjs:595
js-site-missions-leo-shells = 颗卫星，分布在四个壳层

# src/js/missions.mjs:809
js-site-missions-map-aria = { $body }上的{ $title }，按 10 度单元。用方向键移动接收机；其所在单元的读数显示在下方。

# src/js/missions.mjs:853
js-site-missions-map-colour-by = 地图着色依据

# src/js/missions.mjs:715
js-site-missions-map-fewest-in-view = 最少可见数

# src/js/missions.mjs:712
js-site-missions-map-grey = 灰色：无定位解

# src/js/missions.mjs:711
js-site-missions-map-hatched = 斜线：高于 { $limit } 的 PDOP 限值

# src/js/missions.mjs:774
js-site-missions-map-in-view = 可见数

# src/js/missions.mjs:839
js-site-missions-map-live = { $cell }：{ $rows }

# src/js/missions.mjs:715
js-site-missions-map-mean-in-view = 平均可见数

# src/js/missions.mjs:715
js-site-missions-map-mean-pdop = 平均 PDOP

# src/js/missions.mjs:715
js-site-missions-map-pdop-limit = PDOP 限值 { $limit }

# src/js/missions.mjs:509
js-site-missions-matrix-caption = 按行业（行）和失效模式（列）划分的场景文件。选择一个计数即可打开该行业。

# src/js/missions.mjs:523
js-site-missions-matrix-cell =
    { $n ->
       *[other] { $sector }，{ $mode }：{ $n } 个场景文件
    }

# src/js/missions.mjs:525
js-site-missions-matrix-files =
    { $n ->
       *[other] { $n } 个文件：
    }

# src/js/missions.mjs:510
js-site-missions-matrix-sector = 行业

# src/js/missions.mjs:492
js-site-missions-mode-int = 干扰

# src/js/missions.mjs:492
js-site-missions-mode-itg = 完好性

# src/js/missions.mjs:492
js-site-missions-mode-nav = 滑行

# src/js/missions.mjs:492
js-site-missions-mode-orb = 几何

# src/js/missions.mjs:492
js-site-missions-mode-spf = 欺骗干扰（spoofing）

# src/js/missions.mjs:492
js-site-missions-mode-tim = 授时

# src/js/missions.mjs:925
js-site-missions-n-of-total = { $n } / { $total }

# src/js/missions.mjs:651
js-site-missions-no-fix = 无定位解

# src/js/missions.mjs:487
js-site-missions-no-seed = 确定性，无随机种子（seed）

# src/js/missions.mjs:471
js-site-missions-open-in-studio = 在 { $studio } 中打开

# src/js/missions.mjs:472
js-site-missions-open-report = 打开引擎报告

# src/js/missions.mjs:954
js-site-missions-ow-chart-aria = { $name } 运行期间的接收机响应：可见中继星，以及仅用中继星和加上地球测距时的位置误差

# src/js/missions.mjs:994
js-site-missions-ow-chip-epochs = 历元

# src/js/missions.mjs:994
js-site-missions-ow-chip-mask = 截止角

# src/js/missions.mjs:998
js-site-missions-ow-chip-orbiter = 轨道器

# src/js/missions.mjs:999
js-site-missions-ow-chip-range = 测距 σ

# src/js/missions.mjs:998
js-site-missions-ow-chip-relays = 中继星

# src/js/missions.mjs:998
js-site-missions-ow-chip-relays-value = { $planes } × { $per }，高度 { $alt } km，{ $inc }°

# src/js/missions.mjs:994
js-site-missions-ow-chip-span = 时长

# src/js/missions.mjs:989
js-site-missions-ow-count-relays = { $n } 颗中继星和一个轨道器 · { $body }

# src/js/missions.mjs:989
js-site-missions-ow-count-sats = { $n } 颗卫星 · { $body }

# src/js/missions.mjs:987
js-site-missions-ow-engine = 引擎 v{ $version } · 构建 { $commit }

# src/js/missions.mjs:991
js-site-missions-ow-lat-label = 接收机纬度

# src/js/missions.mjs:940
js-site-missions-ow-map-aria = { $name } 的接收机响应：{ $body }按 10 度单元的地图，旁边按纬度给出平均和最少可见卫星数以及平均 PDOP

# src/js/missions.mjs:1008
js-site-missions-ow-note-imagery = { $body }影像：NASA。

# src/js/missions.mjs:1007
js-site-missions-ow-note-rebuilt = 轨道：中继星和轨道器完全按引擎的方式由场景重建；由此得出的可见卫星数在全部 { $n } 个历元上与引擎一致。

# src/js/missions.mjs:1006
js-site-missions-ow-note-sats = 轨道：本次运行的卫星在此重新外推，并与引擎写出的全部 { $n } 个星下点轨迹采样核对（最差 { $deg }°）。

# src/js/missions.mjs:1008
js-site-missions-ow-note-scaled = 轨道半径为便于显示而缩放；轨道面、相位和周期均为本次运行的实际值。

# src/js/missions.mjs:1008
js-site-missions-ow-note-tracks = 引擎写出了 { $total } 颗卫星中 { $shown } 颗的星下点轨迹；全部 { $total } 颗均依据其壳层绘制。

# src/js/missions.mjs:1005
js-site-missions-ow-note-walker = 轨道：本次运行的沃克壳层在此重新外推，并与引擎写出的全部 { $n } 个星下点轨迹采样核对（最差 { $deg }°）。

# src/js/missions.mjs:994
js-site-missions-ow-off = 关

# src/js/missions.mjs:994
js-site-missions-ow-on = 开

# src/js/missions.mjs:1025
js-site-missions-ow-pause = 暂停轨道

# src/js/missions.mjs:1025
js-site-missions-ow-play = 播放轨道

# src/js/missions.mjs:1012
js-site-missions-ow-time = t = { $time }

# src/js/missions.mjs:997
js-site-missions-ow-time-label = 任务时间

# src/js/missions.mjs:978
js-site-missions-ow-valuetext = { $time }，可见 { $n } 颗中继星

# src/js/missions.mjs:667
js-site-missions-pdop-title = 平均 PDOP（位置精度因子），对数刻度，越低越好

# src/js/missions.mjs:474
js-site-missions-report = 报告

# src/js/missions.mjs:474
js-site-missions-report-title = 引擎自身对本次运行的报告

# src/js/missions.mjs:928
js-site-missions-ro-above-horizon = 在地平线以上

# src/js/missions.mjs:919
js-site-missions-ro-availability = 可用性，PDOP ≤ { $limit }

# src/js/missions.mjs:928
js-site-missions-ro-earth-light = 地球 · 光行时 { $s } s

# src/js/missions.mjs:926
js-site-missions-ro-error-relays = 位置误差，仅中继星

# src/js/missions.mjs:928
js-site-missions-ro-occulted = 被遮挡

# src/js/missions.mjs:922
js-site-missions-ro-place-availability = 在 { $place }：可用性

# src/js/missions.mjs:921
js-site-missions-ro-place-in-view = 在 { $place }：可见数，平均 · 最少

# src/js/missions.mjs:925
js-site-missions-ro-relays = 可见中继星

# src/js/missions.mjs:918
js-site-missions-ro-satellites = 卫星

# src/js/missions.mjs:927
js-site-missions-ro-with-earth = 加上地球测距

# src/js/missions.mjs:1295
js-site-missions-run-failed = 此处无法加载已记录的运行；请通过下方链接在 { $studio } 中打开。

# src/js/missions.mjs:487
js-site-missions-seed = 随机种子（seed）{ $seed }

# src/js/missions.mjs:241
js-site-missions-spoof-aria = 欺骗偏移随时间的变化，并标出各监测器的检测界限和检测时间

# src/js/missions.mjs:244
js-site-missions-spoof-axis-x = 自欺骗开始起的时间（s）

# src/js/missions.mjs:245
js-site-missions-spoof-axis-y = 时间偏移（ns）

# src/js/missions.mjs:255
js-site-missions-spoof-detects = { $id } 在 { $s } s 时检测到

# src/js/missions.mjs:257
js-site-missions-spoof-lg-bound = { $id } 界限

# src/js/missions.mjs:257
js-site-missions-spoof-lg-offset = 欺骗偏移

# src/js/missions.mjs:270
js-site-missions-spoof-readout = t { $t } s · 偏移 { $offset } ns

# src/js/missions.mjs:246
js-site-missions-spoof-spec = 指标 { $v } ns

# src/js/missions.mjs:615
js-site-missions-sr-aria = { $members }；共用干扰机 { $power } dBW

# src/js/missions.mjs:615
js-site-missions-sr-aria-member = { $label }：保持跟踪 { $held } %，平均干信比 { $js } dB，最少跟踪卫星数 { $min }

# src/js/missions.mjs:607
js-site-missions-sr-car = 汽车

# src/js/missions.mjs:612
js-site-missions-sr-fewest = 最少跟踪数

# src/js/missions.mjs:610
js-site-missions-sr-held = 保持跟踪

# src/js/missions.mjs:611
js-site-missions-sr-mean-js = 平均 J/S

# src/js/missions.mjs:607
js-site-missions-sr-ship = 船舶

# src/js/missions.mjs:1302
js-site-missions-swipe =
    { $n ->
       *[other] 滑动查看全部 { $n } 个场景文件
    }

# src/js/missions.mjs:478
js-site-missions-toml-download-title = 下载所运行的场景文件

# src/js/missions.mjs:477
js-site-missions-toml-title = 所运行的场景文件

# src/js/missions.mjs:663
js-site-missions-vis-title = 可见卫星数，运行期间的平均值

# src/js/missions.mjs:662
js-site-missions-vis-uniform = 每个单元均为 { $v }

# src/site.js:417
js-site-palette-none = 无结果

# src/site.js:417
js-site-palette-results = { $count } 项结果

# src/js/pro-power.mjs:147
js-site-pro-band-at = 在 { $minutes } 分钟时：第 5 至第 95 百分位

# src/js/pro-power.mjs:147
js-site-pro-band-range = { $lo } 至 { $hi } { $unit }

# src/js/pro-power.mjs:148
js-site-pro-band-runs-within = 次运行中，在 ±{ $limit } { $unit } 以内的共 { $n } 次

# src/js/pro-power.mjs:92
js-site-pro-design-readout = { $sat } 颗卫星，可用性 { $av } % · { $planes } 个轨道面，高度 { $alt } km，{ $incl }°

# src/js/pro-power.mjs:91
js-site-pro-front-design = 前沿设计 { $id }

# src/js/pro-power.mjs:91
js-site-pro-front-design-knee = 前沿设计 { $id } · 拐点

# src/js/pro-power.mjs:90
js-site-pro-more-designs =
    { $n ->
       *[other] （此点另有 { $n } 个前沿设计）
    }

# src/js/pro-power.mjs:94
js-site-pro-not-rerun = 未重新运行

# src/js/pro-power.mjs:93
js-site-pro-rerun-free = 在免费引擎中重新运行：

# src/js/pro-power.mjs:94
js-site-pro-same-sha = 相同的 SHA-256 { $sha }…

# src/js/pro-power.mjs:94
js-site-pro-same-sha-index = 结果的 SHA-256 与索引相同

# src/site.js:41
js-site-toast-copied = 已复制：{ $text }

# src/site.js:351
js-site-toast-data-failed = 无法加载数据文件

# src/site.js:350
js-site-toast-data-saved = 数据已保存为 CSV

# src/site.js:348
js-site-toast-no-data = 此图表没有数据

# src/site.js:340
js-site-toast-svg-saved = 图表已保存为 SVG

# src/site.js:346
js-site-toast-table-saved = 表格已保存为 CSV

# src/js/home-waterfall.mjs:248
js-site-waterfall-axis-now = 当前

# src/js/home-waterfall.mjs:353
js-site-waterfall-bar-title = { $band }：{ $cn0 } dB-Hz，{ $state }

# src/js/home-waterfall.mjs:353
js-site-waterfall-bar-title-js = { $band }：{ $cn0 } dB-Hz，{ $state }，J/S { $js } dB

# src/js/home-waterfall.mjs:303
js-site-waterfall-below-floor = 信号低于噪声下限

# src/js/home-waterfall.mjs:79
js-site-waterfall-campaign-drives = 它所驱动的测评活动：

# src/js/home-waterfall.mjs:79
js-site-waterfall-campaign-seed = 随机种子（seed）{ $seed } · { $duration } s 内 { $phases } 个阶段

# src/js/home-waterfall.mjs:119
js-site-waterfall-chip-aria = { $band }，{ $fc } 兆赫：显示此频带

# src/js/home-waterfall.mjs:120
js-site-waterfall-chip-title = { $band } · { $fc } MHz · 接收机带宽 { $bw } MHz

# src/js/home-waterfall.mjs:78
js-site-waterfall-engine-build = 引擎 v{ $version } · 构建

# src/js/home-waterfall.mjs:86
js-site-waterfall-fallback-head = Galileo 回退 · { $s } s，仅 CW 单音

# src/js/home-waterfall.mjs:86
js-site-waterfall-fallback-text = { $band } 恢复至 { $v } dB-Hz。仅用 Galileo 做完好性监测：保护级 { $min }–{ $max } m，低于 { $limit } m 告警限值。

# src/js/home-waterfall.mjs:107
js-site-waterfall-floor = { $thr } dB-Hz 跟踪下限

# src/js/home-waterfall.mjs:85
js-site-waterfall-holdover-head = 守时（holdover）· { $s } s，线性调频开启

# src/js/home-waterfall.mjs:85
js-site-waterfall-holdover-text = { $band0 } { $v0 }，{ $band1 } { $v1 } dB-Hz，低于下限。时钟自由运行：最差 { $worst } ns，保护限值 { $guard } ns。

# src/js/home-waterfall.mjs:73
js-site-waterfall-jammer-off = { $what }关闭

# src/js/home-waterfall.mjs:72
js-site-waterfall-jammer-on = { $what }开启

# src/js/home-waterfall.mjs:400
js-site-waterfall-live = { $freq } 兆赫，{ $time }：{ $detail }

# src/js/home-waterfall.mjs:400
js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz，{ $state }

# src/js/home-waterfall.mjs:400
js-site-waterfall-live-none = 无已建模的频带

# src/js/home-waterfall.mjs:12
js-site-waterfall-load-failed = 无法加载已记录的运行。下方引擎的报告显示的是同一次运行。

# src/js/home-waterfall.mjs:298
js-site-waterfall-no-jammer-band = 此频带内无干扰机

# src/js/home-waterfall.mjs:346
js-site-waterfall-no-jammer-in-band = 频带内无干扰机

# src/js/home-waterfall.mjs:78
js-site-waterfall-no-seed = 确定性，无随机种子（seed）

# src/js/home-waterfall.mjs:84
js-site-waterfall-onset-head = 起始 · { $t0 }–{ $t1 } s

# src/js/home-waterfall.mjs:84
js-site-waterfall-onset-text = 全部 { $n } 个频带均在跟踪，直到频谱运行在 { $s } s 时首次丢失 { $band }。

# src/js/home-waterfall.mjs:447
js-site-waterfall-pause = 暂停瀑布图

# src/js/home-waterfall.mjs:447
js-site-waterfall-play = 播放瀑布图

# src/js/home-waterfall.mjs:305
js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

# src/js/home-waterfall.mjs:48
js-site-waterfall-run-time = 运行 T+{ $s } s

# src/js/home-waterfall.mjs:109
js-site-waterfall-scale-caption = 高于 { $floor } dBW/Hz 下限的 PSD · { $bin } MHz × { $step } s 单元

# src/js/home-waterfall.mjs:78
js-site-waterfall-seed = 随机种子（seed）{ $seed }

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-lost = 丢失

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-ok = 跟踪

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-rec = 恢复

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-lost = 失锁

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-lost-low = 失锁

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-ok = 跟踪

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-ok-low = 跟踪

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-rec = 已恢复

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-rec-low = 已恢复

# src/js/home-waterfall.mjs:94
js-site-waterfall-summary-recovers = { $band } 在 { $lost } s 时失锁，在 { $rec } s 时恢复，最低 { $min } dB-Hz。

# src/js/home-waterfall.mjs:91
js-site-waterfall-summary-rows = { $n } 行，每行 { $step } s。

# src/js/home-waterfall.mjs:95
js-site-waterfall-summary-stays-lost = { $band } 在 { $lost } s 时失锁并一直未恢复，最低 { $min } dB-Hz。

# src/js/home-waterfall.mjs:92
js-site-waterfall-summary-tracks = { $band } 全程跟踪，最低 { $min } dB-Hz。

# src/js/home-waterfall.mjs:381
js-site-waterfall-tip-above-floor = 高于噪声下限

# src/js/home-waterfall.mjs:381
js-site-waterfall-tip-at-floor = 位于热噪声下限

# src/js/home-waterfall.mjs:382
js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

# src/js/home-waterfall.mjs:380
js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

# src/js/home-waterfall.mjs:382
js-site-waterfall-tip-js = J/S { $js } dB

# src/js/home-waterfall.mjs:383
js-site-waterfall-tip-no-band = 没有任何已建模频带的接收机带宽覆盖此列

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-chirp = 线性调频

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-cw = CW 单音

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-noise = 噪声

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-cursor = 光标所在频带

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-selected = 所选频带

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-worst = 最差频带
