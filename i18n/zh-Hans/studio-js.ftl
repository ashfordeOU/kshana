# studio-js.ftl (zh-Hans): translations

js-adv-all-domains = 所有领域

js-adv-animation-frame-title = 引擎写出的本次运行动画

js-adv-animation-html-player = HTML 播放器

js-adv-animation-html-player-title = 单文件播放器，与引擎写出时一致

js-adv-animation-load-failed = 无法加载已记录的动画（{ $reason }）。

js-adv-animation-loading = 正在加载已记录的动画…

js-adv-animation-none = 此场景没有已记录的动画。

js-adv-animation-note = 引擎会为任何带时间轴的运行写出动画：一份自动播放的 SVG，以及一份自带播放与拖动控件的单文件 HTML 播放器。浏览器版本不含该写出功能，因此这是原生命令行引擎为内置场景写出的文件。

js-adv-animation-svg = 动画 SVG

js-adv-animation-svg-title = 自动播放的 SVG，与引擎写出时一致

js-adv-axis-averaging-time = 平均时间 τ (s)

js-adv-axis-observation-interval = 观测间隔 τ (s)

js-adv-axis-value = 数值

js-adv-badge-live-engine = 实时引擎

js-adv-badge-recorded = 已记录

js-adv-badge-recorded-engine = 已记录的运行，引擎 v{ $version }

js-adv-badge-recorded-native = 已记录的运行，原生引擎 v{ $version }

js-adv-band-carrier = 载波

js-adv-band-carrier-not-set = 此场景中未设置

js-adv-band-chip-rate = 码片速率

js-adv-band-jammer-bandwidth = 干扰机带宽

js-adv-band-jammer-label = 干扰机 { $bandwidth } MHz

js-adv-band-jammer-power = 干扰机功率

js-adv-band-jammer-type = 干扰机类型

js-adv-band-no-carrier-note = 引擎根据链路预算计算干信比。此场景未给出载波频率，因此不绘制频谱。

js-adv-band-satellites = 卫星

js-adv-band-signal-main-lobe = 信号主瓣

js-adv-band-svg-label = 载波周围的信号与干扰机频带

js-adv-band-tracking-threshold = 跟踪门限

js-adv-browser-cannot-run = 浏览器版本无法运行此场景。

js-adv-busy-running = 正在运行

js-adv-busy-sweeping = 正在扫描

js-adv-chain-handed-on =
    { $n ->
       *[other] 传递了 { $n } 个值
    }

js-adv-chain-note = 一个系统贯穿引擎的每个阶段。下表列出每个阶段算出、并由下一阶段使用的每个数值。

js-adv-chain-stage = 第 { $n } 阶段

js-adv-chain-sub = 每个阶段的输出作为下一阶段的输入

js-adv-chain-title = 链路

js-adv-chart-allan-title = 阿伦偏差

js-adv-chart-budget-label = 预算

js-adv-chart-default-title = Kshana 图表

js-adv-chart-effective-cn0 = 各卫星的有效 C/N0

js-adv-chart-ground-track = 星下点轨迹

js-adv-chart-holdover-budget = 对照授时预算的守时（holdover）

js-adv-chart-mtie-title = MTIE（最大时间间隔误差）

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · 场景 { $hash } · kshana.dev

js-adv-chart-stability-title = 时钟稳定度（重叠阿伦偏差）

js-adv-chart-tdev-title = TDEV（时间偏差）

js-adv-chart-undrawable = 无法绘制此图表。

js-adv-chip-live = 实时引擎 · v{ $version }

js-adv-chip-live-title = Kshana 引擎正以 WebAssembly 的形式在此浏览器中运行

js-adv-chip-recorded = 已记录的运行 · v{ $version }

js-adv-chip-recorded-title = WebAssembly 无法在此启动。显示的是内置场景的真实已记录运行。

js-adv-chip-recorded-title-reason = WebAssembly 无法在此启动（{ $reason }）。显示的是内置场景的真实已记录运行。

js-adv-chip-unavailable = 引擎不可用

js-adv-cmd-all-fields = 显示所有数值字段

js-adv-cmd-compare = 比较已固定的运行

js-adv-cmd-embed-code = 复制嵌入代码

js-adv-cmd-exports = 下载结果（导出）

js-adv-cmd-history = 打开运行历史

js-adv-cmd-parameters = 打开参数

js-adv-cmd-pin = 固定本次运行以供比较

js-adv-cmd-report = 下载报告

js-adv-cmd-reset = 重置场景文本

js-adv-cmd-run = 运行场景

js-adv-cmd-share-link = 复制分享链接

js-adv-cmd-start = 前往起始页

js-adv-cmd-theme = 切换浅色或深色主题

js-adv-cmd-tour = 开始导览

js-adv-command-line-only = 仅限命令行

js-adv-compare-deltas-note = 差值均相对于运行 A。绿色标出每项数值中较优的一个。

js-adv-compare-no-common = 这些运行没有可比较的品质指标。请固定同一场景系列的运行，以查看数值和差值。

js-adv-compare-one-pinned = 已固定一次运行。请更改一个参数，再次运行，并固定该次运行，即可比较两者。

js-adv-compare-overlay = 已固定运行的叠加图

js-adv-compare-overlay-diff = 叠加图及差值 B − A

js-adv-compare-overlay-note = 实线为运行 A，虚线为运行 B，坐标轴相同。

js-adv-compare-overlay-title = { $title }：运行 { $a }（A）对比运行 { $b }（B）

js-adv-compare-pin-two = 至少固定两次运行，才能并排比较。请固定一次运行，更改一个参数或选择同一系列的另一个场景，运行后再次固定。

js-adv-compare-run-heading = { $letter } · 运行 { $run }

js-adv-copy-blocked = 此处禁止复制。

js-adv-copy-command = 复制：{ $command }

js-adv-could-not-load = 无法加载 { $file }。

js-adv-coverage-dots = 圆点为 { $total } 颗卫星中的 { $shown } 颗，沿其星下点轨迹飞行；播放回放可使其移动。

js-adv-coverage-field-label = 要绘制的字段

js-adv-coverage-map = 覆盖图

js-adv-coverage-map-over = 位于{ $body }上

js-adv-coverage-map-select = 地图

js-adv-coverage-note = 每个单元格为{ $body }上的一个网格点，按运行的每个历元评分。

js-adv-coverage-title = { $body }上的{ $field }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = 起始页：所有领域

js-adv-decrease-field = 减小{ $field }

js-adv-domain = 领域

js-adv-domain-line-campaigns = 在同一时钟上串联的任务、扫描和蒙特卡罗运行。

js-adv-domain-line-constellations = 设计星座，并绘制其覆盖和 PDOP（位置精度因子）。

js-adv-domain-line-deepspace = 月球、地月空间和火星的导航与时间。

js-adv-domain-line-integrity = 定位解及其能否被信任：RAIM（接收机自主完好性监测）及其高级形式 ARAIM。

js-adv-domain-line-interference = 针对 GNSS 接收机的干扰机：丢失什么，何时丢失。

js-adv-domain-line-leo = 低地球轨道导航信号、过境、电文和定位解。

js-adv-domain-line-leo-missions = 基于低地球轨道层构建的研究与服务。

js-adv-domain-line-navigation = 惯性、地形、重力及其他无需 GNSS 的导航。

js-adv-domain-line-optional = 一组可选场景。

js-adv-domain-line-orbits = 轨道外推、星历与 GNSS 几何。

js-adv-domain-line-solar = 同一历元下的所有行星和卫星，含光行时。

js-adv-domain-line-spaceops = 过境、发射窗口、再入、链路与姿态预算。

js-adv-domain-line-spectrum = 无线电频段瀑布图：干扰机、信号以及接收机所跟踪的内容。

js-adv-domain-line-spoofing = 虚假信号与转发式欺骗（meaconing），以及能发现它们的监测器。

js-adv-domain-line-studies = 量子传感器、权衡研究与互操作格式。

js-adv-domain-line-timing = 无 GNSS 时的时钟：守时（holdover）、稳定度、电信模板、时间传递。

js-adv-domain-pick-hint = 选择一个：它会在您的浏览器中打开并运行。接下来可以更改其参数。

js-adv-domain-scenario-count =
    { $n ->
       *[other] { $label }：{ $n } 个场景
    }

js-adv-domain-select-label = 显示一个领域

js-adv-download = 下载

js-adv-edited-cli-only-status = 已编辑：此场景仅能在命令行引擎中运行。

js-adv-edited-needs-engine = 已编辑：需要引擎 { $need }。

js-adv-edited-needs-live-engine = 已编辑的场景需要实时引擎。

js-adv-embed-copied = 已复制嵌入代码。

js-adv-engine-chart = 引擎图表

js-adv-engine-chart-alt = 本次运行的引擎图表

js-adv-engine-file-http-error = 引擎文件返回 HTTP { $status }

js-adv-engine-load-failed-no-recordings = 引擎无法加载（{ $reason }），且未找到已记录的运行

js-adv-engine-loading = 引擎加载中…

js-adv-engine-loading-title = 实时引擎仍在下载。就绪后，此已记录结果将被实时运行取代。

js-adv-engine-start-failed = 引擎无法启动：{ $reason }。请通过 HTTP 提供此文件夹（例如 python3 -m http.server），而不要直接打开文件。

js-adv-entries-count = { $n } 条

js-adv-export-card-title = { $format } 导出

js-adv-export-csv-desc = 与命令行工具写出的 { $file } 字节完全相同。

js-adv-export-csv-title = 可复现性表

js-adv-export-ephemeris-checking = 正在检查本次运行可导出哪些星历格式…

js-adv-export-ephemeris-waiting = 引擎加载完成后，星历导出会显示在此处。

js-adv-export-json-desc = 引擎对本次运行的完整输出，含单位和来源信息。

js-adv-export-json-title = 完整结果文档

js-adv-export-large-not-recorded = 此导出文件很大，因此未被记录。需要实时引擎。

js-adv-export-oem-desc = CCSDS OEM 2.0（轨道星历电文），适用于 GMAT、Orekit 或 STK

js-adv-export-omm-desc = CCSDS OMM（轨道平均根数电文）目录

js-adv-export-report-desc = 一份离线文件：摘要、附带证据等级的数值、每张图表以及确切的场景文本，并标有引擎版本和场景哈希。

js-adv-export-report-title = 可复现报告

js-adv-export-sp3-desc = 此星座的 SP3-c 精密星历

js-adv-export-toml-desc = 本次运行的确切输入。可用命令行工具或 Python 与 npm 软件包在任何地方再次运行。

js-adv-export-toml-title = 场景文件

js-adv-export-too-large = { $desc }。过大无法记录：需要实时引擎。

js-adv-field-find-match =
    { $n ->
       *[other] { $n } 个引导控件，以及 { $total } 个字段中的 { $fields } 个与“{ $query }”匹配。
    }

js-adv-field-find-none = 此场景没有与“{ $query }”匹配的字段。请用库搜索查找所有场景。

js-adv-field-hit-in = 位于 { $title }

js-adv-field-not-single-number = 此场景中该字段不是单个数值：请在源文本中编辑。

js-adv-field-opened = 已在 { $field } 处打开。更改它，场景便会重新运行。

js-adv-fields-matching = 与“{ $query }”匹配的字段

js-adv-fields-more = 另有 { $n } 个：请细化关键词，或在起始页搜索。

js-adv-fields-top-level = 顶层

js-adv-filter-check-tuning = 检查调参

js-adv-filter-consistent = 一致

js-adv-from-the-link = 来自链接

js-adv-geo-sub = { $name } · 已绘制 { $total } 个要素中的 { $shown } 个 · 由原生引擎记录

js-adv-geo-title = GeoJSON 导出：{ $name }

js-adv-gt-note = 高亮：从该站可见的卫星。

js-adv-gt-note-both = 高亮：从该站可见的卫星。峰值仰角 { $elevation }°。峰值多普勒 { $doppler } Hz。

js-adv-gt-note-doppler = 高亮：从该站可见的卫星。峰值多普勒 { $doppler } Hz。

js-adv-gt-note-elevation = 高亮：从该站可见的卫星。峰值仰角 { $elevation }°。

js-adv-heatmap-label = { $metric }热力图

js-adv-hist-runs-count = { $n } 次运行。

js-adv-history-pin = 固定

js-adv-history-restore = 恢复

js-adv-history-run-time = 运行 { $run } · { $time }

js-adv-holdover-engine-figure = 引擎在场景预算下的守时（holdover）：{ $duration }

js-adv-holdover-engine-figure-budget = 引擎在场景预算（{ $budget } { $unit }）下的守时（holdover）：{ $duration }

js-adv-holdover-error-after-loss = 在 t = { $loss } s 丢失 GNSS 之后的误差

js-adv-holdover-error-since-fix = 自上次定位解以来的误差

js-adv-holdover-stays-inside = 在整个记录期间保持在此预算之内

js-adv-holdover-until-breached = 直至超出预算

js-adv-honesty-modelled = 基于第一性原理的物理模型并经测试，尚未对照外部参考基准（oracle）核对。{ $text }

js-adv-honesty-partner = 由合作方负责的数值。{ $text }

js-adv-honesty-validated = 已对照独立的外部参考基准（oracle）核对。{ $text }

js-adv-increase-field = 增大{ $field }

js-adv-install-version = 安装 v{ $version }

js-adv-interop-no-file = 引擎没有为本次运行写出此格式的文件。

js-adv-interop-not-applicable = 不适用于此场景：{ $reason }。

js-adv-interop-not-bundled = 此处未打包（受大小限制）：上方的命令会写出它。

js-adv-interop-note = 引擎会以其他工具可打开的格式写出一次运行的几何与信号采样：用于 Cesium 的 CZML、用于 Google Earth 的 KML（Keyhole 标记语言）、用于地图的 GeoJSON、STK 星历（.e）文件，以及 SigMF（信号元数据格式）记录。浏览器版本不含这些写出功能，因此下列文件是原生命令行引擎为内置场景写出的文件。

js-adv-js-range-label = J/S 范围

js-adv-js-range-value = { $low } 至 { $high } dB

js-adv-json-copied = 已复制 JSON。

js-adv-kind-default = kind：时钟守时（holdover）（默认）

js-adv-kind-label = kind：{ $kind }

js-adv-kpi-check = 检查

js-adv-kpi-delta-since-run = 自运行 { $run } 以来{ $arrow } { $change }

js-adv-kpi-fail = 不通过

js-adv-kpi-first-run = 首次运行

js-adv-kpi-not-in-previous = 不在您上一次运行中

js-adv-kpi-pass = 通过

js-adv-lib-count-all = { $scenarios } 个场景 · { $domains } 个领域

js-adv-lib-count-filtered = { $total } 个场景中的 { $n } 个

js-adv-lib-no-match = 没有匹配的场景或字段。请试试 jamming、clock、lunar、orbit、mask 或 PDOP 之类的词。

js-adv-loaded-shared = 已从链接加载共享场景。

js-adv-mask-envelope = 守时（holdover）时间误差包络（{ $source }）

js-adv-mask-exceeded-after = 在 { $duration } 后超限

js-adv-mask-limit-label = 限值 { $limit } ns

js-adv-mask-max-te = 最大 |TE|

js-adv-mask-not-exceeded = 未超限

js-adv-matrix-counts = { $total } 中的 { $validated }

js-adv-matrix-line = { $counts } 项能力已对照独立的外部参考基准（oracle）验证 · { $modelled } 项为模型 · { $partner } 项由合作方负责

js-adv-max-close = 关闭

js-adv-max-close-label = 关闭全屏

js-adv-max-expand = 展开

js-adv-max-expand-label = 将此面板展开为全屏

js-adv-max-title = 全屏显示此面板（按 Escape 关闭）

js-adv-meta-engine = 引擎

js-adv-meta-file = 文件

js-adv-meta-scenario = 场景

js-adv-meta-seed = 随机种子

js-adv-meta-time = 时间

js-adv-mission-timeline = 任务时间线

js-adv-native-edited-notice = { $why } 已记录的运行针对的是内置文件，因此此处无法显示已编辑的副本：请用命令行工具运行它，或使用“重置”查看记录。

js-adv-native-notice-command = { $why } 您看到的是通过运行 { $command } 由原生命令行引擎 v{ $version } 记录的一次运行，原样显示。编辑时不会重新运行。

js-adv-native-notice-plain = { $why } 您看到的是由原生命令行引擎 v{ $version } 记录的一次运行，原样显示。编辑时不会重新运行。

js-adv-native-notice-platform = { $why } 您看到的是由原生命令行引擎 v{ $version }（{ $platform }）记录的一次运行，原样显示。编辑时不会重新运行。

js-adv-native-notice-platform-command = { $why } 您看到的是通过运行 { $command } 由原生命令行引擎 v{ $version }（{ $platform }）记录的一次运行，原样显示。编辑时不会重新运行。

js-adv-needs-live-engine = 这需要实时引擎。

js-adv-needs-newer-engine-status = 需要更新的引擎。

js-adv-nees-line = NEES { $mean }（95% 区间 { $low }–{ $high }，目标 2.0）

js-adv-newer-engine-edited-notice = 此场景需要引擎 { $need } 或更高版本；此处运行的引擎为 v{ $version }。只能显示内置文件的记录：请使用“重置”查看，或用引擎 { $need } 运行已编辑的副本。

js-adv-newer-engine-no-recording = 此场景需要引擎 { $need } 或更高版本；此处运行的引擎为 v{ $version }。此处没有它的记录。

js-adv-newer-engine-shown-commit = 此场景需要引擎 { $need } 或更高版本；此处运行的引擎为 v{ $version }。您看到的是由提交 { $commit } 处的引擎构建记录的运行，原样显示；它不会在此处重新运行。

js-adv-newer-engine-shown-version = 此场景需要引擎 { $need } 或更高版本；此处运行的引擎为 v{ $version }。您看到的是由引擎 v{ $recorded } 记录的运行，原样显示；它不会在此处重新运行。
