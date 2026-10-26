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

js-adv-nis-line = NIS { $mean }（95% 区间 { $low }–{ $high }，目标 1.0）

js-adv-no-guided-controls = 此场景没有任何引导控件。请使用“所有字段”，或编辑源文本。

js-adv-no-numeric-fields = 此处没有可调的单个数值字段。请直接编辑源文本。

js-adv-no-recorded-run = 此场景没有已记录的运行。需要实时引擎。

js-adv-no-summary = （此场景未发布一行摘要）

js-adv-noise-floor = 噪声基底 { $level }

js-adv-not-in-browser-status = 此场景不在浏览器中运行。

js-adv-open-and-run = 打开并运行

js-adv-open-at-field = 在此字段处打开

js-adv-opened-from-simple = 已按您在“简易”视图中更改的设置打开。

js-adv-optional-preset = 可选预设：scenarios/{ $file }

js-adv-orbit-fallback-alt = 外推轨迹的正射视图

js-adv-orbit-note-epoch = 拖动旋转，滚动或双指缩放。地球按比例绘制，使用 NASA Blue Marble 影像。已转至本次运行的历元。

js-adv-orbit-note-no-epoch = 拖动旋转，滚动或双指缩放。地球按比例绘制，使用 NASA Blue Marble 影像。本次运行未给出历元，因此此处的地球自转角没有意义。

js-adv-pal-commands = 命令

js-adv-pal-domain = 领域：{ $name }

js-adv-pal-domains = 领域

js-adv-pal-field = 字段：{ $name }

js-adv-pal-fields = 字段

js-adv-pal-nothing = 没有匹配项

js-adv-pal-opens-page = 打开页面

js-adv-pal-page = 页面：{ $name }

js-adv-pal-pages = 页面

js-adv-pal-panel = 面板：{ $name }

js-adv-pal-panels = 面板

js-adv-pal-scenarios = 场景

js-adv-params-hint-all = 场景中的每一个单个数值。可步进调整、直接输入或使用方向键；场景随之重新运行。

js-adv-params-hint-guided = 拖动滑块，场景便会重新运行。每个控件都直接写入下方的场景文本。

js-adv-pin-already = 该运行已被固定。

js-adv-pin-first = 已固定运行 { $run }。请更改一个参数，再次运行，然后也固定该次运行。

js-adv-pin-label = { $letter } · { $title } · 运行 { $run }

js-adv-pin-opening-compare = 已固定 { $n } 次运行。正在打开“比较”。

js-adv-plan-view = 平面视图

js-adv-plan-view-epoch = 于 { $epoch }

js-adv-plan-view-note = 每个圆点是本次运行历元时的一个天体，每条曲线是引擎为其计算的轨道轨迹。虚线是场景所要求的链路。选择一颗行星，即可查看其周围的卫星。

js-adv-player-name-mission = 任务回放

js-adv-player-name-orbit = 轨道回放

js-adv-player-name-replay = 回放

js-adv-player-name-waterfall = 瀑布图回放

js-adv-player-pause = 暂停{ $name }

js-adv-player-play = 播放{ $name }

js-adv-player-position = { $name }中的位置

js-adv-png-download-title = 供幻灯片和文档使用的高分辨率位图

js-adv-png-export-failed = PNG 导出失败：{ $reason }

js-adv-ready-live = 就绪。在您的浏览器中本地运行。

js-adv-ready-recorded = 就绪。显示已记录的运行。

js-adv-receiver-at-time = t = { $time } 时的接收机

js-adv-recorded-edit-notice = 此页面已阻止 WebAssembly，因此本页显示的是以引擎 v{ $version } 记录的内置场景的真实运行。已编辑的场景、扫描和新的导出需要实时引擎：请打开 kshana.dev，或在本地提供此文件夹。“重置”会恢复已记录的场景。

js-adv-recorded-edited-warning = 您已编辑场景：此记录针对的是内置文件，而非您的编辑。请对您自己的文件运行该命令，以获得您的结果。

js-adv-recorded-intro = 此页面已阻止 WebAssembly，因此本页显示的是以引擎 v{ $version } 记录的内置场景的真实运行。编辑、扫描和新的导出需要 kshana.dev 上的实时引擎。

js-adv-recorded-run-native = 已记录的运行，原生引擎

js-adv-recorded-written-by = 由原生命令行引擎 v{ $version }（{ $platform }）使用 { $command } 写出。原样显示。

js-adv-replay = 回放

js-adv-report-downloaded = 已下载报告。

js-adv-report-frame-title = 引擎写出的运行报告

js-adv-report-html = 报告（HTML）

js-adv-report-html-title = 报告文件，与引擎写出时一致

js-adv-report-load-failed = 无法加载已记录的报告（{ $reason }）。

js-adv-report-loading = 正在加载已记录的报告…

js-adv-report-none = 此场景没有已记录的报告。

js-adv-report-note = 每次命令行运行都会写出一份报告：摘要、输入、结果、图表、哪些已验证和哪些为模型计算，以及可复现性记录。浏览器版本不含该写出功能，因此这是原生命令行引擎为内置场景写出的报告。Studio 自己对屏幕上运行的报告位于“导出”下。

js-adv-report-open-tab = 在新标签页中打开

js-adv-report-open-tab-title = 单独打开报告

js-adv-report-orbit-title = 轨道（地心惯性系，正射）

js-adv-report-stability-chart = 时钟稳定度

js-adv-report-stability-title = 时钟稳定度（阿伦偏差）

js-adv-restored-run = 已恢复运行 { $run }。

js-adv-result = 结果

js-adv-run-cancelled = 运行已取消。

js-adv-run-cancelled-previous = 运行已取消。仍显示上一次的结果。

js-adv-run-failed = 运行失败。请见结果中的消息。

js-adv-scenario-copied = 已复制场景。

js-adv-scenarios-count = { $n } 个场景

js-adv-share-link-copied = 已复制分享链接。它包含确切的场景。

js-adv-share-link-in-bar = 链接已放入地址栏。

js-adv-shared-link = 分享链接

js-adv-shared-needs-live = 此链接自带场景，需要实时引擎。请在 kshana.dev 上打开。

js-adv-shared-scenario = 共享场景

js-adv-shared-scenario-question = 从分享链接打开的场景。它会按分享时的原样运行。

js-adv-solar-bodies-label = 要绘制的天体

js-adv-spectrum-part-label = 频谱的哪一部分

js-adv-spectrum-row-note = 回放所在的瀑布图行沿线的频谱。

js-adv-spectrum-row-title = 当前所示行沿线的频谱

js-adv-start-field-meta = { $domain } · 字段 { $field }

js-adv-start-fields-hint = 每一项都会打开场景并高亮该控件，可直接更改。

js-adv-start-fields-named =
    { $n ->
       *[other] 名称类似“{ $query }”的字段：位于 { $n } 个场景中
    }

js-adv-start-more-matches = 另有 { $n } 个匹配项：添加一个词以缩小范围。

js-adv-start-nothing = 没有与“{ $query }”匹配的内容。请试试 jamming、clock、lunar、orbit、mask 或 PDOP 之类的词。

js-adv-start-scenarios-count = 场景（{ $count }）

js-adv-status-fetching-recorded = 引擎加载中… 正在获取此场景的已记录结果。

js-adv-status-ran-locally = 于 { $time } 在本地运行，运行 { $run }。

js-adv-status-ran-locally-secs = 于 { $time } 在本地运行，运行 { $run }，{ $secs } s。

js-adv-status-recorded-native = 已记录的运行，显示于 { $time }（原生引擎）。

js-adv-status-recorded-needs-engine = 已记录的运行，显示于 { $time }（需要引擎 { $need }）。

js-adv-status-recorded-shown = 已记录的运行，显示于 { $time }，运行 { $run }。

js-adv-status-recorded-shown-secs = 已记录的运行，显示于 { $time }，运行 { $run }，{ $secs } s。

js-adv-status-showing-recorded = 引擎加载中… 在实时引擎就绪之前，显示此场景的已记录结果。

js-adv-subtabs-label = 此视图的分块（手机）

js-adv-suggest-campaign = 回放一次压制干扰、欺骗干扰和守时（holdover）任务

js-adv-suggest-coverage = 绘制四个 GNSS（全球导航卫星系统）星座的覆盖图

js-adv-suggest-holdover = GNSS 丢失时的守时

js-adv-suggest-waterfall = 在 L 频段瀑布图上观察一部干扰机

js-adv-svg-download-title = 带标题和来源信息的矢量图表

js-adv-sweep-cancelled = 扫描已取消。

js-adv-sweep-done-grid = 已在本地用 { $time } 扫描 { $total } 次运行（{ $columns } × { $rows }）。

js-adv-sweep-done-line = 已在本地用 { $time } 扫描 { $total } 次运行中的 { $done } 次。

js-adv-sweep-enter-range = 请输入数值范围。

js-adv-sweep-enter-range-second = 请为第二个参数输入数值范围。

js-adv-sweep-failed = 扫描失败：{ $reason }

js-adv-sweep-interrupted = 扫描被新的运行中断。

js-adv-sweep-needs-live = 扫描会多次运行引擎，因此需要实时引擎。

js-adv-sweep-none-line-chart = 无（折线图）

js-adv-sweep-nothing = 此场景没有可扫描的内容。

js-adv-sweep-progress = 正在扫描第 { $n } 次运行，共 { $total } 次…

js-adv-sweep-status-done = 已于 { $time } 扫描 { $total } 次运行。

js-adv-sweep-title-grid = { $metric }随{ $first }和{ $second }的变化

js-adv-sweep-title-line = { $metric }随{ $parameter }的变化

js-adv-sweep-wait = 请等待当前运行结束，然后再扫描。

js-adv-tab-animation = 动画

js-adv-tab-compare = 比较

js-adv-tab-engine-report = 引擎报告

js-adv-tab-exports-report = 导出与报告

js-adv-tab-ground-track = 星下点轨迹

js-adv-tab-holdover = 守时（holdover）

js-adv-tab-overview = 概览

js-adv-tab-signal-band = 信号与频带

js-adv-tab-stability = 稳定度

js-adv-tab-sweep = 扫描

js-adv-tab-time-series = 时间序列

js-adv-tab-timing-masks = 授时模板

js-adv-th-at-tau-or-time = 于 τ 或时间

js-adv-th-body = 天体

js-adv-th-clock = 时钟

js-adv-th-distance-sun = 与太阳的距离

js-adv-th-figure = 数值

js-adv-th-file = 文件

js-adv-th-format = 格式

js-adv-th-key-figure = 关键数值

js-adv-th-light-time-from = 来自 { $observer } 的单向光行时

js-adv-th-light-time-observer = 来自观测者的单向光行时

js-adv-th-limit = 限值

js-adv-th-margin = 裕量

js-adv-th-mask-or-budget = 模板或预算

js-adv-th-metric = 指标

js-adv-th-orbital-period = 轨道周期

js-adv-th-provenance = 来源

js-adv-th-size = 大小

js-adv-th-source = 来源

js-adv-th-tier = 等级

js-adv-th-unit = 单位

js-adv-th-value = 值

js-adv-th-verdict = 结论

js-adv-th-what-it-is = 说明

js-adv-the-body = 该天体

js-adv-tile-scenario-count =
    { $n ->
       *[other] { $n } 个场景
    }

js-adv-timeline-chart-title = 任务时间线：{ $title }

js-adv-timeline-latest-event = 最新事件，于 { $time }：{ $label }

js-adv-timeline-no-event = 此刻尚无事件。

js-adv-timeline-note = 一个拖动条驱动下方的每张图表。每个阶段运行的都是普通场景；该测评活动把它们的输出读入同一时间网格。阴影带为各阶段，竖线为事件。上方的数值是回放时刻该测评活动的各通道。

js-adv-timeline-on-one-clock = 同一时钟上的 { $duration }

js-adv-timeline-phase = 阶段：{ $phase }

js-adv-tour-back = 上一步

js-adv-tour-done = 完成

js-adv-tour-eyebrow = 导览

js-adv-tour-headline-body = 一行摘要、引擎版本和场景指纹，以及每个数值是已验证还是模型计算。

js-adv-tour-headline-title = 读取答案

js-adv-tour-keyboard-body = ⌘K 可查找任何场景、视图或命令。[ 和 ] 在视图之间切换。

js-adv-tour-keyboard-title = 全部可用键盘操作

js-adv-tour-library-body = 每个内置场景，按任务领域分组：压制干扰、频谱、欺骗干扰、时钟、导航、完好性、轨道、星座设计、低地球轨道导航、测评活动、月球、火星和太阳系。用 / 搜索。

js-adv-tour-library-title = 选择一项任务

js-adv-tour-next = 下一步

js-adv-tour-params-body = 常用旋钮的引导滑块，或场景中的每个数值字段。每次更改都会重新运行。

js-adv-tour-params-title = 调整它

js-adv-tour-pin-body = 最多固定四次运行，并排查看，含差值和差值曲线。

js-adv-tour-pin-title = 比较运行

js-adv-tour-run-body = Rust 引擎以 WebAssembly 的形式在您的浏览器中运行。不会上传任何内容。⌘↵ 可在任何位置运行。

js-adv-tour-run-title = 在本地运行

js-adv-tour-share-body = 下载报告、结果、场景和引擎的导出文件，或复制包含确切场景的链接，或用于课程页面或维基的 iframe。

js-adv-tour-share-title = 分享或导出

js-adv-tour-skip = 跳过

js-adv-tour-source-body = 完整的 TOML 场景。您运行的内容，正是您可以分享和复现的内容。

js-adv-tour-source-title = 或编辑任何内容

js-adv-tour-tabs-title = 本次运行的每个视图

js-adv-tracking-threshold-value = 跟踪门限 { $value }

js-adv-transport-label = 回放：一个拖动条驱动本次运行的每个面板

js-adv-transport-sub = 一个拖动条驱动本次运行的每个面板

js-adv-unpin-run = 取消固定运行 { $run }

js-adv-waterfall = 瀑布图

js-adv-waterfall-note = 颜色表示高于接收机噪声基底的功率。导航信号位于该基底之下，因此亮起的是干扰机。播放或拖动回放，右侧的频带会显示接收机此刻仍在跟踪什么。

js-adv-waterfall-sub = 功率谱密度：横向为频率，纵向为时间

js-adv-waterfall-title = 瀑布图，{ $name }

js-adv-webassembly-unavailable = WebAssembly 不可用

js-app-all-questions = 所有问题

js-app-anim-frame-title = 引擎写出的本次运行动画

js-app-anim-html-player = HTML 播放器

js-app-anim-html-player-title = 单文件播放器，与引擎写出时一致

js-app-anim-load-failed = 无法加载已记录的动画（{ $reason }）。

js-app-anim-loading = 正在加载已记录的动画…

js-app-anim-none = 此场景没有已记录的动画。

js-app-anim-note = 引擎会为任何带时间轴的运行写出动画：一份自动播放的 SVG，以及一份自带播放与拖动控件的单文件 HTML 播放器。浏览器版本不含该写出功能，因此这是原生命令行引擎为内置场景写出的文件。

js-app-anim-svg = 动画 SVG

js-app-anim-svg-title = 自动播放的 SVG，与引擎写出时一致

js-app-axis-averaging-time = 平均时间 τ (s)

js-app-axis-observation-interval = 观测间隔 τ (s)

js-app-axis-value = 数值

js-app-badge-modelled = { $n } 项为模型

js-app-badge-recorded = 已记录

js-app-badge-validated = { $n } 项已验证

js-app-band-carrier = 载波

js-app-band-carrier-unset = 此场景中未设置

js-app-band-chip-rate = 码片速率

js-app-band-jammer-bandwidth = 干扰机带宽

js-app-band-jammer-mhz = 干扰机 { $mhz } MHz

js-app-band-jammer-power = 干扰机功率

js-app-band-jammer-type = 干扰机类型

js-app-band-main-lobe = 信号主瓣

js-app-band-no-carrier-note = 引擎根据链路预算计算干信比。此场景未给出载波频率，因此不绘制频谱。

js-app-band-satellites = 卫星

js-app-band-svg-label = 载波周围的信号与干扰机频带

js-app-band-tracking-threshold = 跟踪门限

js-app-browse-all-title = 所有 { $n } 个场景

js-app-browse-area-kicker =
    { $n ->
       *[other] 领域 · { $n } 个场景
    }

js-app-browse-area-lede = 选择一个：它会直接打开并显示结果。

js-app-browse-evidence = 其场景所运行的引擎方法，在验证矩阵中有 { $validated } 个已验证行和 { $modelled } 个模型行。

js-app-browse-evidence-title = 此领域背后的证据。

js-app-browse-kicker = 浏览

js-app-browse-lede = 搜索，或选择一个领域。每个场景都会直接打开并显示结果。

js-app-browse-validated-examples = 已验证的例子：{ $examples }。

js-app-browser-cannot-run = 浏览器版本无法运行此场景。

js-app-btn-all-exports = 所有导出

js-app-btn-all-exports-title = 本次运行的所有导出，包括引擎自己的格式

js-app-btn-compare-pinned = 比较已固定的运行

js-adv-orbit-canvas-label = 外推轨迹的交互式 3-D 视图

js-adv-orbit-static-note = 静态视图（此处无法加载 3-D 库）。

js-adv-tab-orbit-3d = 3-D 轨道

js-adv-tour-tabs-body = 结果支持时才会出现相应视图：压制干扰的信号与频带、频谱的瀑布图、测评活动的任务时间线、星座的覆盖图、时钟的守时（holdover）、电信授时的模板、3-D 轨道、星下点轨迹、扫描，以及引擎自己的动画和报告。

js-app-btn-copy-embed = 复制嵌入代码

js-app-btn-copy-link = 复制指向此确切场景的链接

js-app-btn-figure-png = 图（PNG）

js-app-btn-figure-png-title = 屏幕上的图表，高分辨率位图

js-app-btn-figure-svg = 图（SVG）

js-app-btn-figure-svg-title = 屏幕上的图表，含标题、引擎版本和 DOI

js-app-btn-pin-compare = 固定本次运行以供比较

js-app-btn-pin-count = 固定本次运行（已固定 { $n } 次）

js-app-btn-report-html = 可复现报告（HTML）

js-app-btn-report-html-title = 一份离线文件：摘要、附带等级的数值、图表和确切的场景

js-app-btn-result-json = 结果数据（JSON）

js-app-btn-result-json-title = 引擎对本次运行的完整输出

js-app-btn-run-history = 运行历史

js-app-btn-scenario-toml = 场景文件（TOML）

js-app-btn-scenario-toml-title = 本次运行的确切输入

js-app-btn-table-csv = 表格（CSV）

js-app-btn-table-csv-title = 与命令行工具写出的 { $file } 字节完全相同

js-app-bytes =
    { $n ->
       *[other] { $n } 字节
    }

js-app-cap-sub = { $areas } 个领域，{ $total } 个可直接运行的场景。每个领域都显示一个真实的已记录结果，以及其背后的证据构成：其引擎方法中已对照外部参考验证的比例。

js-app-chain-hint = 每个阶段的输出作为下一阶段的输入

js-app-chain-note = 一个系统贯穿引擎的每个阶段。下表列出每个阶段算出、并由下一阶段使用的每个数值。

js-app-chain-stage = 第 { $n } 阶段

js-app-chain-values-handed =
    { $n ->
       *[other] 传递了 { $n } 个值
    }

js-app-chart-allan-deviation = 阿伦偏差

js-app-chart-cn0-by-satellite = 各卫星的有效 C/N0

js-app-chart-default-title = Kshana 图表

js-app-chart-ground-track = 星下点轨迹

js-app-chart-holdover-title = 对照授时预算的守时（holdover）

js-app-chart-mtie-title = MTIE（最大时间间隔误差）

js-app-chart-not-drawn = 无法绘制此图表。

js-app-chart-scenario-hash = 场景 { $hash }

js-app-chart-stability-title = 时钟稳定度（重叠阿伦偏差）

js-app-chart-tdev-title = TDEV（时间偏差）

js-app-chip-failed-title = WebAssembly 无法在此启动。显示的是内置场景的真实已记录运行。

js-app-chip-failed-title-reason = WebAssembly 无法在此启动（{ $reason }）。显示的是内置场景的真实已记录运行。

js-app-chip-live = 实时引擎 · v{ $version }

js-app-chip-live-title = Kshana 引擎正以 WebAssembly 的形式在此浏览器中运行

js-app-chip-loading = 引擎加载中

js-app-chip-loading-title = 引擎正在下载。其间显示已记录的结果。

js-app-chip-recorded = 已记录的运行 · v{ $version }

js-app-chip-unavailable = 引擎不可用

js-app-cli-note = 用 { $command } 安装。该运行会写出 { $file }、一张图表和一份报告。

js-app-cli-only-title = 此场景在命令行中运行，不在浏览器中运行。

js-app-cli-save-comment = # 将下方的场景文件保存为 { $file }，然后

js-app-cmd-advanced = 显示所有设置（高级设置）

js-app-cmd-browse = 浏览所有场景

js-app-cmd-compare = 比较已固定的运行

js-app-cmd-embed = 复制嵌入代码

js-app-cmd-exports = 下载结果（导出）

js-app-cmd-history = 打开运行历史

js-app-cmd-home = 前往开始页面

js-app-cmd-how = 这是如何计算的

js-app-cmd-pin = 固定本次运行以供比较

js-app-cmd-report = 下载报告

js-app-cmd-research = 代码、数据与引用（供研究人员）

js-app-cmd-reset = 重置场景文本

js-app-cmd-run = 运行场景

js-app-cmd-share = 复制分享链接

js-app-cmd-theme = 切换浅色或深色主题

js-app-cmd-tour = 开始导览

js-app-compare-deltas = 差值均相对于运行 A。绿色标出每项数值中较优的一个。

js-app-compare-none = 这些运行没有可比较的品质指标。请固定同一场景系列的运行，以查看数值和差值。

js-app-compare-pin-two = 至少固定两次运行，才能并排比较。请固定一次运行，更改一个参数或选择同一系列的另一个场景，运行后再次固定。

js-app-compare-run-head = { $letter } · 运行 { $id }

js-app-coverage-cell-note = 每个单元格为{ $body }上的一个网格点，按运行的每个历元评分。

js-app-coverage-dots-of = 颗，共

js-app-coverage-dots-post = 颗卫星，沿其星下点轨迹飞行；播放回放可使其移动。

js-app-coverage-dots-pre = 圆点代表

js-app-coverage-field-label = 要绘制的字段

js-app-coverage-map = 覆盖图

js-app-coverage-map-select = 地图

js-app-coverage-over = 位于

js-app-coverage-title = { $body }上的{ $field }

js-app-crumb-all-scenarios = 所有场景

js-app-crumb-area = 领域

js-app-crumb-search = 搜索：{ $query }

js-app-crumb-studio = Studio

js-app-download-label = 下载

js-app-edited-cli-only = 已编辑：此场景仅能在命令行引擎中运行。

js-app-edited-needs-engine = 已编辑：需要引擎 { $need }。

js-app-edited-needs-live = 已编辑的场景需要实时引擎。

js-app-embed-copied = 已复制嵌入代码。

js-app-engine-chart = 引擎图表

js-app-engine-chart-alt = 本次运行的引擎图表

js-app-engine-could-not-start = 引擎无法启动：{ $reason }。请通过 HTTP 提供此文件夹（例如 { $command }），而不要直接打开文件。

js-app-engine-failed = 引擎无法加载（{ $reason }）。

js-app-engine-file-http = 引擎文件返回 HTTP { $status }。

js-app-engine-no-recordings = 引擎无法加载（{ $reason }），且未找到已记录的运行。

js-app-entries-count =
    { $n ->
       *[other] { $n } 条
    }

js-app-ev-aria = 验证矩阵中 { $validated } 个已验证行和 { $modelled } 个模型行

js-app-ev-title = 验证矩阵中 { $validated } 个已验证行 · { $modelled } 个模型行

js-app-ev-validated = 已验证

js-app-export-card-title = { $format } 导出

js-app-export-checking = 正在检查本次运行可导出哪些星历格式…

js-app-export-csv-desc = 与命令行工具写出的 { $file } 字节完全相同。

js-app-export-csv-title = 可复现性表

js-app-export-engine-loading = 引擎加载完成后，星历导出会显示在此处。

js-app-export-json-desc = 引擎对本次运行的完整输出，含单位和来源信息。

js-app-export-json-title = 完整结果文档

js-app-export-not-recorded = 此导出文件很大，因此未被记录。需要实时引擎。

js-app-export-oem-desc = CCSDS OEM 2.0（轨道星历电文），适用于 GMAT、Orekit 或 STK

js-app-export-omm-desc = CCSDS OMM（轨道平均根数电文）目录

js-app-export-report-desc = 一份离线文件：摘要、附带证据等级的数值、每张图表以及确切的场景文本，并标有引擎版本和场景哈希。

js-app-export-report-title = 可复现报告

js-app-export-sp3-desc = 此星座的 SP3-c 精密星历

js-app-export-toml-desc = 本次运行的确切输入。可用命令行工具或 Python 与 npm 软件包在任何地方再次运行。

js-app-export-toml-title = 场景文件

js-app-export-too-large = { $desc }。过大无法记录：需要实时引擎。

js-app-fields-more = 另有 { $n } 个

js-app-fields-none = 无

js-app-fields-none-hint = 此处没有其他可更改的单个数值。请编辑“供研究人员”下的文件。

js-app-fields-top-of-file = 文件开头

js-app-find-matches =
    { $n ->
       *[other] { $n } 个引导控件，以及 { $total } 个字段中的 { $m } 个与“{ $query }”匹配。
    }

js-app-find-none = 此场景没有与“{ $query }”匹配的字段。请用库搜索查找所有场景。

js-app-geo-sub = { $name } · 已绘制 { $total } 个要素中的 { $features } 个 · 由原生引擎记录

js-app-geojson-title = GeoJSON 导出：{ $name }

js-app-gt-highlighted = 高亮：从该站可见的卫星。

js-app-gt-peak-doppler = 峰值多普勒 { $value } Hz。

js-app-gt-peak-elevation = 峰值仰角 { $value }°。

js-app-health-check-tuning = 检查调参

js-app-health-consistent = 一致

js-app-health-nees-band = NEES { $mean }（95% 区间 { $lo }–{ $hi }，目标 2.0）

js-app-health-nis-band = NIS { $mean }（95% 区间 { $lo }–{ $hi }，目标 1.0）

js-app-heat-map-label = { $metric }热力图

js-app-hero-clock = { $elapsed }（共 { $total }）

js-app-hero-mask = { $deg }° 仰角截止

js-app-hero-places =
    { $n ->
       *[other] { $n } 个地点
    }

js-app-hero-positions-only = 仅有卫星位置：没有信号功率、卫星健康状态或地形。

js-app-hero-ramp = { $field }：{ $lo } 至 { $hi }

js-app-hero-ramp-over = { $field }：{ $lo } 至 { $hi }，历时 { $duration }

js-app-hero-recorded-bare = 已记录的结果

js-app-hero-satellites =
    { $n ->
       *[other] { $n } 颗卫星
    }

js-app-hero-steps =
    { $n ->
       *[other] { $n } 个时间步
    }

js-app-hist-runs = { $n } 次运行。

js-app-history-pin = 固定

js-app-history-restore = 恢复

js-app-history-restored = 已恢复运行 { $id }。

js-app-history-run = 运行 { $id } · { $time }

js-app-hit-in-scenario = 位于 { $title }

js-app-hit-native-note = 已记录的运行，原生引擎

js-app-hit-setting-meta = { $area } · 设置 { $name }

js-app-ho-budget = 预算

js-app-ho-engine-budget = 引擎在场景预算（{ $budget } { $unit }）下的守时（holdover）：{ $duration }

js-app-ho-engine-budget-bare = 引擎在场景预算下的守时（holdover）：{ $duration }

js-app-ho-error-after-loss = 在 t = { $t } s 丢失 GNSS 之后的误差

js-app-ho-error-since-fix = 自上次定位解以来的误差

js-app-ho-stays-inside = 在整个记录期间保持在此预算之内

js-app-ho-until-breached = 直至超出预算

js-app-hover-classical = 经典

js-app-hover-quantum = 量子

js-app-how-checks = （检查：{ $requirement }）

js-app-how-matrix = 此场景所运行的引擎方法，在验证矩阵中有 { $validated } 个已验证行和 { $modelled } 个模型行：

js-app-how-matrix-partner = 此场景所运行的引擎方法，在验证矩阵中有 { $validated } 个已验证行和 { $modelled } 个模型行，另有 { $partner } 个由合作方负责：

js-app-how-mix-chip = { $validated } 项已验证 · { $modelled } 项为模型

js-app-how-more-notes =
    { $n ->
       *[other] 场景文件中另有 { $n } 条说明
    }

js-app-how-more-rows =
    { $n ->
       *[other] 验证矩阵中另有 { $n } 行（见网站的“证据”页面）。
    }

js-app-how-no-header = 此场景文件没有头部说明。下方的引擎摘要说明了运行的内容。

js-app-how-no-matrix-row = 验证矩阵中尚无行指明此场景的引擎 kind。

js-app-how-no-sources = 场景文件未引用任何来源，也没有已验证的矩阵行覆盖其 kind。

js-app-how-own-label = 本次运行自身的标签：{ $label }

js-app-how-per-figure = 按数值划分，来自引擎的 figure_tiers 块：{ $validated } 项已验证，{ $modelled } 项为模型。每个数值的等级见“概览”视图。

js-app-install-copy = 复制：{ $command }

js-app-install-label = 安装 v{ $version }

js-app-interop-no-file = 引擎没有为本次运行写出此格式的文件。

js-app-interop-not-apply = 不适用于此场景：{ $reason }。

js-app-interop-not-bundled = 此处未打包（受大小限制）：上方的命令会写出它。

js-app-interop-note = 引擎会以其他工具可打开的格式写出一次运行的几何与信号采样：用于 Cesium 的 CZML、用于 Google Earth 的 KML（Keyhole 标记语言）、用于地图的 GeoJSON、STK 星历（.e）文件，以及 SigMF（信号元数据格式）记录。浏览器版本不含这些写出功能，因此下列文件是原生命令行引擎为内置场景写出的文件。

js-app-job-running = 正在运行

js-app-job-sweeping = 正在扫描

js-app-js-range-label = J/S 范围

js-app-js-range-value = { $lo } 至 { $hi } dB

js-app-latest-event-at = 最新事件，于

js-app-legend-all = 项引擎能力在整个验证矩阵中已验证；{ $modelled } 项为模型，{ $partner } 项由合作方负责。

js-app-legend-count = { $total } 中的 { $validated }

js-app-load-failed = 无法加载 { $file }。

js-app-mask-envelope = 守时（holdover）时间误差包络（{ $source }）

js-app-mask-exceeded-after = 在 { $duration } 后超限

js-app-mask-limit = 限值 { $value } ns

js-app-mask-not-exceeded = 未超限

js-app-meta-engine = 引擎

js-app-meta-file = 文件

js-app-meta-scenario = 场景

js-app-meta-seed = 随机种子

js-app-meta-shared-link = 分享链接

js-app-meta-time = 时间

js-app-mission-timeline = 任务时间线

js-app-native-edited-notice = 已记录的运行针对的是内置文件，因此此处无法显示已编辑的副本：请用命令行工具运行它，或使用“重置”查看记录。

js-app-native-recorded = 您看到的是由原生命令行引擎 v{ $version } 记录的一次运行，原样显示。编辑时不会重新运行。

js-app-native-recorded-c = 您看到的是通过运行 { $command } 由原生命令行引擎 v{ $version } 记录的一次运行，原样显示。编辑时不会重新运行。

js-app-native-recorded-p = 您看到的是由原生命令行引擎 v{ $version }（{ $platform }）记录的一次运行，原样显示。编辑时不会重新运行。

js-app-native-recorded-pc = 您看到的是通过运行 { $command } 由原生命令行引擎 v{ $version }（{ $platform }）记录的一次运行，原样显示。编辑时不会重新运行。

js-app-needs-live-engine = 这需要实时引擎。

js-app-needs-newer-engine = 需要更新的引擎。

js-app-needs-newer-why = 此场景需要引擎 { $need } 或更高版本；此处运行的引擎为 v{ $version }。

js-app-no-chart-export = 此视图没有可导出的图表。

js-app-no-event-yet = 此刻尚无事件。

js-app-no-recorded-run = 此场景没有已记录的运行。需要实时引擎。

js-app-no-recording-here = 此处没有它的记录。

js-app-no-summary = （此场景未发布一行摘要）

js-app-noise-floor = 噪声基底 { $value }

js-app-not-in-browser = 此场景不在浏览器中运行。

js-app-notice-shared-needs-live = 此链接自带场景，需要实时引擎。请在 kshana.dev 上打开。

js-app-on-one-clock = 同一时钟上

js-app-only-bundled-recording = 只能显示内置文件的记录：请使用“重置”查看，或用引擎 { $need } 运行已编辑的副本。

js-app-opening-result = 正在打开结果…

js-app-orbit-canvas-label = 外推轨迹的交互式 3-D 视图

js-app-orbit-epoch-set = 已转至本次运行的历元。

js-app-orbit-epoch-unset = 本次运行未给出历元，因此此处的地球自转角没有意义。

js-app-orbit-img-alt = 外推轨迹的正射视图

js-app-orbit-note = 拖动旋转，滚动或双指缩放。地球按比例绘制，使用 NASA Blue Marble 影像。

js-app-orbit-static = 静态视图（此处无法加载 3-D 库）。

js-app-overlay-note = 实线为运行 A，虚线为运行 B，坐标轴相同。

js-app-overlay-pinned = 已固定运行的叠加图

js-app-overlay-title = { $title }：运行 { $a }（A）对比运行 { $b }（B）

js-app-overlay-with-diff = 叠加图及差值 B − A

js-app-pal-area = 领域：{ $label }

js-app-pal-nothing = 没有匹配项

js-app-pal-scenario-count =
    { $n ->
       *[other] { $n } 个场景
    }

js-app-pal-sec-areas = 领域

js-app-pal-sec-commands = 命令

js-app-pal-sec-scenarios = 场景

js-app-pal-sec-settings = 设置

js-app-pal-sec-views = 视图

js-app-pal-setting = 设置：{ $label }

js-app-pal-view = 视图：{ $label }

js-app-panel-close = 关闭

js-app-panel-close-full = 关闭全屏

js-app-panel-expand = 展开

js-app-panel-expand-full = 将此面板展开为全屏

js-app-panel-expand-title = 全屏显示此面板（按 Escape 关闭）

js-app-params-hint = 更改一个值，再次运行。答案和图表会就地更新。

js-app-phase = 阶段：

js-app-pin-already = 该运行已被固定。

js-app-pin-compare = 已固定 { $n } 次运行。正在打开“比较”。

js-app-pin-first = 已固定运行 { $id }。请更改一个参数，再次运行，然后也固定该次运行。

js-app-pin-label = { $letter } · { $title } · 运行 { $id }

js-app-plan-view = 平面视图

js-app-plan-view-at = 于

js-app-player-pause = 暂停回放

js-app-player-pause-mission = 暂停任务回放

js-app-player-pause-orbit = 暂停轨道回放

js-app-player-pause-waterfall = 暂停瀑布图回放

js-app-player-play = 播放回放

js-app-player-play-mission = 播放任务回放

js-app-player-play-orbit = 播放轨道回放

js-app-player-play-waterfall = 播放瀑布图回放

js-app-player-position = 回放中的位置

js-app-player-position-mission = 任务回放中的位置

js-app-player-position-orbit = 轨道回放中的位置

js-app-player-position-waterfall = 瀑布图回放中的位置

js-app-png-button-title = 供幻灯片和文档使用的高分辨率位图

js-app-png-export-failed = PNG 导出失败：{ $reason }

js-app-py-note = 用 { $command } 安装。

js-app-ran-locally = 于 { $time } 在本地运行，运行 { $n }。

js-app-ran-locally-took = 于 { $time } 在本地运行，运行 { $n }，{ $took } s。

js-app-receiver-at = 接收机，t =

js-app-recorded-edit-notice = 此页面已阻止 WebAssembly，因此本页显示的是以引擎 v{ $version } 记录的内置场景的真实运行。已编辑的场景、扫描和新的导出需要实时引擎：请打开 kshana.dev，或在本地提供此文件夹。“重置”会恢复已记录的场景。

js-app-recorded-intro = 此页面已阻止 WebAssembly，因此本页显示的是以引擎 v{ $version } 记录的内置场景的真实运行。编辑、扫描和新的导出需要 kshana.dev 上的实时引擎。

js-app-recorded-shown-native = 已记录的运行，显示于 { $time }（原生引擎）。

js-app-recorded-shown-needs = 已记录的运行，显示于 { $time }（需要引擎 { $need }）。

js-app-recorded-shown-run = 已记录的运行，显示于 { $time }，运行 { $n }。

js-app-recorded-shown-took = 已记录的运行，显示于 { $time }，运行 { $n }，{ $took } s。

js-app-recorded-with-commit = 您看到的是由提交 { $commit } 处的引擎构建记录的运行，原样显示；它不会在此处重新运行。

js-app-recorded-with-engine = 您看到的是由引擎 v{ $version } 记录的运行，原样显示；它不会在此处重新运行。

js-app-recording-edited-warning = 您已编辑场景：此记录针对的是内置文件，而非您的编辑。请对您自己的文件运行该命令，以获得您的结果。

js-app-replay = 回放

js-app-report-downloaded = 已下载报告。

js-app-report-frame-title = 引擎写出的运行报告

js-app-report-html = 报告（HTML）

js-app-report-html-title = 报告文件，与引擎写出时一致

js-app-report-load-failed = 无法加载已记录的报告（{ $reason }）。

js-app-report-loading = 正在加载已记录的报告…

js-app-report-none = 此场景没有已记录的报告。

js-app-report-note = 每次命令行运行都会写出一份报告：摘要、输入、结果、图表、哪些已验证和哪些为模型计算，以及可复现性记录。浏览器版本不含该写出功能，因此这是原生命令行引擎为内置场景写出的报告。Studio 自己对屏幕上运行的报告位于“导出”下。

js-app-report-open-tab = 在新标签页中打开

js-app-report-open-tab-title = 单独打开报告

js-app-report-orbit-title = 轨道（地心惯性系，正射）

js-app-report-stability-short = 时钟稳定度

js-app-report-stability-title = 时钟稳定度（阿伦偏差）

js-app-run-again = 再次运行

js-app-run-cancelled = 运行已取消。

js-app-run-cancelled-previous = 运行已取消。仍显示上一次的结果。

js-app-run-failed = 运行失败。请见结果中的消息。

js-app-run-when-ready = 引擎就绪后运行

js-app-run-will-run = 将在引擎就绪后运行

js-app-run-with-settings = 按这些设置运行

js-app-search-more-matches =
    { $n ->
       *[other] 另有 { $n } 个匹配项：添加一个词以缩小范围。
    }

js-app-search-nothing = 没有与“{ $query }”匹配的内容。请试试 jamming、clock、lunar、orbit、mask 或 PDOP 之类的词。

js-app-search-scenarios = 场景（{ $n }）

js-app-search-settings =
    { $n ->
       *[other] 名称类似“{ $query }”的设置：位于 { $n } 个场景中
    }

js-app-search-settings-hint = 每一项都会打开场景并高亮该设置，可直接更改。

js-app-share-copied = 已复制分享链接。它包含确切的场景。

js-app-share-in-address-bar = 链接已放入地址栏。

js-app-share-link-sub = 它会按分享时的原样运行。

js-app-share-link-title = 从分享链接打开的场景

js-app-shared-scenario = 共享场景

js-app-shown-unchanged = 原样显示。

js-app-solar-note = 每个圆点是本次运行历元时的一个天体，每条曲线是引擎为其计算的轨道轨迹。虚线是场景所要求的链路。选择一颗行星，即可查看其周围的卫星。

js-app-solar-which-bodies = 要绘制的天体

js-app-source-live = 实时结果 · 引擎 v{ $version }

js-app-source-native = 已记录的结果，原生引擎 · v{ $version }

js-app-source-recorded = 已记录的结果 · v{ $version }

js-app-source-recorded-loading = 已记录的结果 · v{ $version } · 引擎加载中

js-app-spectrum-row-note = 回放所在的瀑布图行沿线的频谱。

js-app-spectrum-row-title = 当前所示行沿线的频谱

js-app-spectrum-which-part = 频谱的哪一部分

js-app-status-last-run-took = 上一次运行在您的浏览器中用时 { $ms } ms。不会上传任何内容。

js-app-status-loading-kept = 引擎仍在加载。您的更改会保留，并在引擎就绪后立即运行。

js-app-status-loading-recorded = 引擎仍在加载。上方的结果是已记录的运行。

js-app-status-not-run-yet = 您的更改尚未运行。

js-app-status-runs-in-browser = 在您的浏览器中运行。不会上传任何内容。

js-app-status-wasm-blocked = 此处已阻止 WebAssembly，因此显示的是内置场景的已记录运行。

js-app-stepper-decrease = 减小 { $key }

js-app-stepper-increase = 增大 { $key }

js-app-subtabs-label = 此视图的分块（手机）

js-app-svg-button-title = 带标题和来源信息的矢量图表

js-app-sweep-cancelled = 扫描已取消。

js-app-sweep-done-1d = 已在本地用 { $duration } 扫描 { $total } 次运行中的 { $done } 次。

js-app-sweep-done-2d = 已在本地用 { $duration } 扫描 { $total } 次运行（{ $a } × { $b }）。

js-app-sweep-enter-range = 请输入数值范围。

js-app-sweep-enter-range-2 = 请为第二个参数输入数值范围。

js-app-sweep-failed = 扫描失败：{ $reason }

js-app-sweep-interrupted = 扫描被新的运行中断。

js-app-sweep-needs-live = 扫描会多次运行引擎，因此需要实时引擎。

js-app-sweep-none-line = 无（折线图）

js-app-sweep-nothing = 此场景没有可扫描的内容。

js-app-sweep-progress = 正在扫描第 { $n } 次运行，共 { $total } 次…

js-app-sweep-status-done = 已于 { $time } 扫描 { $total } 次运行。

js-app-sweep-title-1d = { $metric }随{ $knob }的变化

js-app-sweep-title-2d = { $metric }随{ $knob1 }和{ $knob2 }的变化

js-app-sweep-wait = 请等待当前运行结束，然后再扫描。

js-app-tab-animation = 动画

js-app-tab-compare = 比较

js-app-tab-exports = 导出与报告

js-app-tab-ground = 星下点轨迹

js-app-tab-holdover = 守时（holdover）

js-app-tab-json = JSON

js-app-tab-masks = 授时模板

js-app-tab-orbit = 3-D 轨道

js-app-tab-overview = 概览

js-app-tab-report = 引擎报告

js-app-tab-signal = 信号与频带

js-app-tab-stability = 稳定度

js-app-tab-sweep = 扫描

js-app-tab-timeseries = 时间序列

js-app-th-at-tau = 于 τ 或时间

js-app-th-body = 天体

js-app-th-clock = 时钟

js-app-th-figure = 数值

js-app-th-file = 文件

js-app-th-format = 格式

js-app-th-key-figure = 关键数值

js-app-th-light-time = 来自 { $observer } 的单向光行时

js-app-th-limit = 限值

js-app-th-margin = 裕量

js-app-th-mask-or-budget = 模板或预算

js-app-th-metric = 指标

js-app-th-metric-2 = 指标

js-app-th-orbital-period = 轨道周期

js-app-th-provenance = 来源

js-app-th-size = 大小

js-app-th-source = 来源

js-app-th-sun-distance = 与太阳的距离

js-app-th-tier = 等级

js-app-th-unit = 单位

js-app-th-value = 值

js-app-th-value-2 = 值

js-app-th-value-3 = 值

js-app-th-verdict = 结论

js-app-th-what-it-is = 说明

js-app-the-body = 该天体

js-app-the-chain = 链路

js-app-the-observer = 观测者

js-app-tile-browse-all = 浏览所有 { $n } 个场景

js-app-tile-browse-sub = 按名称、问题或设置搜索

js-app-tile-preview-label = 来自 { $source } 的已记录预览：{ $title }

js-app-tile-scenario-count =
    { $n ->
       *[other] { $n } 个场景
    }

js-app-timeline-chart-title = 任务时间线：{ $title }

js-app-timeline-note = 一个拖动条驱动下方的每张图表。每个阶段运行的都是普通场景；该测评活动把它们的输出读入同一时间网格。阴影带为各阶段，竖线为事件。上方的数值是回放时刻该测评活动的各通道。

js-app-toast-copied = 已复制。

js-app-toast-copy-blocked = 此处禁止复制。

js-app-toast-copy-blocked-select = 此处禁止复制：请改为选中文本。

js-app-toast-json-copied = 已复制 JSON。

js-app-toast-loading-run = 引擎仍在加载。就绪后，您的运行会立即开始。

js-app-toast-no-scenario = 此处没有名为 { $name } 的场景。以下是最接近的匹配项。

js-app-toast-not-single-number = 此场景中该设置不是单个数值：请在场景文件中编辑。

js-app-toast-one-pinned = 已固定一次运行。请更改一项设置，再次运行，并固定该次运行，即可比较两者。

js-app-toast-opened-advanced = 已按您在“高级”视图中更改的设置打开。

js-app-toast-opened-at = 已在 { $label } 处打开。更改它，然后再次运行。

js-app-toast-scenario-copied = 已复制场景。

js-app-tour-answer-body = 从结果中读出的一句通俗的话，以及结果的来源：在您的浏览器中的实时运行，或同一引擎记录的运行。

js-app-tour-answer-title = 先看答案

js-app-tour-back = 上一步

js-app-tour-done = 完成

js-app-tour-eyebrow = 导览

js-app-tour-figures-body = 每张卡片都读取自引擎的结果文档。

js-app-tour-figures-title = 回答它的数值

js-app-tour-how-body = 方法、证据等级和参考文献。

js-app-tour-how-title = 这是如何计算的

js-app-tour-next = 下一步

js-app-tour-research-body = 供您自行运行的命令行和 Python，数据和图表，以及如何引用。

js-app-tour-research-title = 供研究人员

js-app-tour-search-body = ⌘K 可查找任何场景、领域、设置、视图或命令。

js-app-tour-search-title = 搜索

js-app-tour-settings-body = 对此问题最重要的五项设置。更改一项，然后再次运行。引擎在您的浏览器中运行；不会上传任何内容。

js-app-tour-settings-title = 试试其他设置

js-app-tour-skip = 跳过

js-app-tour-views-body = 图表、地图、回放、引擎自己的报告和导出。[ 和 ] 在视图之间切换。

js-app-tour-views-title = 本次运行的每个视图

js-app-tracking-threshold = 跟踪门限

js-app-transport-hint = 一个拖动条驱动本次运行的每个面板

js-app-transport-label = 回放：一个拖动条驱动本次运行的每个面板

js-app-unpin-run = 取消固定运行 { $id }

js-app-waterfall = 瀑布图

js-app-waterfall-hint = 功率谱密度：横向为频率，纵向为时间

js-app-waterfall-note = 颜色表示高于接收机噪声基底的功率。导航信号位于该基底之下，因此亮起的是干扰机。播放或拖动回放，右侧的频带会显示接收机此刻仍在跟踪什么。

js-app-waterfall-title = 瀑布图，{ $name }

js-app-webassembly-unavailable = WebAssembly 不可用

js-app-written-by-native = 由原生命令行引擎 v{ $version }（{ $platform }）写出，使用

js-cat-acm-link-question = 沿每次过境，链路保持在哪种 DVB-S2 模式，该次过境传输多少数据？（模型计算）

js-cat-acm-link-title = 带自适应编码的卫星下行链路

js-cat-aocs-slew-mekf-question = 当控制器由姿态滤波器和有偏陀螺供给时，该机动与真实状态情形相比如何？（模型计算）

js-cat-aocs-slew-mekf-title = 基于姿态估计的机动

js-cat-aocs-slew-question = 反馈律能否用四个飞轮使大角度机动稳定下来，飞轮的负荷有多大？（控制回路已验证；航天器为示意性质）

js-cat-aocs-slew-title = 反作用飞轮机动

js-cat-aperture-duty-cycle-question = 当同一口径同时服务导航和通信时，这会造成多大的中断？（模型计算）

js-cat-aperture-duty-cycle-title = 口径占空比

js-cat-araim-gps-galileo-question = 在 GPS + Galileo 和全星座故障假设下，高级 RAIM 的可用性如何？

js-cat-araim-gps-galileo-title = 双星座 ARAIM

js-cat-araim-reference-check-question = 引擎的保护级是否与已发布的工作组 C 算例一致？

js-cat-araim-reference-check-title = ARAIM 参考核对

js-cat-ascent-losses-question = 重力、阻力、转向和背压会损失两级运载火箭理想速度增量的多少？（模型计算）

js-cat-ascent-losses-title = 发射上升损失

js-cat-attitude-budget-question = 最坏情况下的干扰力矩和指向误差预算是多少？

js-cat-attitude-budget-title = 指向预算

js-cat-automotive-urban-canyon-question = 经过一条地下通道和一部路边干扰机时，汽车能否保持在半个车道的预算之内？（模型计算）

js-cat-automotive-urban-canyon-title = 汽车穿越城市峡谷

js-cat-campaign-jam-spoof-holdover-integrity-question = 在同一时间线上，一台接收机依次经历压制干扰、欺骗干扰、GNSS 丢失、完好性告警和恢复，会发生什么？（模型计算）

js-cat-campaign-jam-spoof-holdover-integrity-title = 串联任务：压制、欺骗、守时、告警

js-cat-campaign-monte-carlo-clock-holdover-question = 在许多带随机种子的运行中，自由运行时钟的时间误差是否与其闭式分布一致？

js-cat-campaign-monte-carlo-clock-holdover-title = 蒙特卡罗时钟守时（holdover）

js-cat-campaign-optimize-link-budget-question = 在距离和数据速率范围内，X 频段链路在何处恰好留有 3 dB 裕量？

js-cat-campaign-optimize-link-budget-title = 优化链路预算

js-cat-campaign-shared-jammer-sea-road-question = 在同一部干扰机之下，哪个平台会丢失定位解：30 km 外的船，还是 50 km 外的汽车？（模型计算）

js-cat-campaign-shared-jammer-sea-road-title = 一部干扰机，一艘船和一辆车

js-cat-campaign-spectrum-holdover-integrity-question = 一部干扰机压制两路 L 频段信号，时钟进入守时，接收机退回到仅用 Galileo：完好性监测是否仍然成立？（模型计算）

js-cat-campaign-spectrum-holdover-integrity-title = 频谱驱动的任务

js-cat-campaign-sweep-jammer-power-question = 当 1 km 外的干扰机功率从 10 nW 调高到 10 W 时，接收机何时丢失定位解？（模型计算）

js-cat-campaign-sweep-jammer-power-title = 干扰机功率扫描

js-cat-cislunar-arc-recovery-question = 独立的最小二乘估计器，能否真的从秩检验所预测的弧长中恢复状态？（模型计算；较慢，在浏览器中约 15 s）

js-cat-cislunar-arc-recovery-title = 地月空间弧段恢复

js-cat-cislunar-observability-question = 星间弧段能使地月空间航天器的状态有多少变得可观测？

js-cat-cislunar-observability-title = 地月空间可观测性

js-cat-clock-ensemble-question = 在许多次噪声抽样中，守时落在怎样的置信带内？

js-cat-clock-ensemble-title = 时钟守时（holdover）集合

js-cat-clock-holdover-labsr-question = 实验室级锶光钟在守时（holdover）方面与芯片级原子钟相比如何？

js-cat-clock-holdover-labsr-title = 时钟守时（holdover），实验室光钟

js-cat-clock-holdover-question = GNSS 中断后，时钟能保持时间多久？

js-cat-clock-holdover-title = 时钟守时（holdover）

js-cat-combined-altpnt-question = 融合三个标量地图通道，比单用其中任何一个多得到什么？

js-cat-combined-altpnt-title = 组合 alt-PNT

js-cat-conflict-resilience-question = 分层 PNT 架构在压制干扰 / 欺骗干扰 / 动能 / 网络威胁下如何退化？（模型计算）

js-cat-conflict-resilience-title = 冲突韧性

js-cat-constellation-multi-gnss-coverage-question = 四大全球系统一起使用时，地球上各处有多少颗卫星可见，几何条件有多好？（模型计算）

js-cat-constellation-multi-gnss-coverage-title = 四个 GNSS 星座，一张地图

js-cat-contact-schedule-question = 对于三颗卫星和三个地面站、12 小时，无冲突的计划保留哪些过境，传输多少数据？（模型计算）

js-cat-contact-schedule-title = 地面接触计划

js-cat-domain-campaigns-label = 测评活动

js-cat-domain-campaigns-line = 在同一时钟上串联的任务、扫描和蒙特卡罗运行。

js-cat-domain-constellations-label = 星座设计

js-cat-domain-constellations-line = 设计星座，并绘制其覆盖和 PDOP（位置精度因子）。

js-cat-domain-deepspace-label = 月球、地月空间与火星

js-cat-domain-deepspace-line = 月球、地月空间和火星的导航与时间。

js-cat-domain-integrity-label = 完好性与定位

js-cat-domain-integrity-line = 定位解及其能否被信任：RAIM（接收机自主完好性监测）及其高级形式 ARAIM。

js-cat-domain-interference-label = 压制干扰与干扰

js-cat-domain-interference-line = 针对卫星导航接收机的干扰机：丢失什么，何时丢失。

js-cat-domain-leo-label = 低地球轨道（LEO）导航

js-cat-domain-leo-line = 低地球轨道导航信号、过境、电文和定位解。

js-cat-domain-leo-missions-label = LEO 任务与研究

js-cat-domain-leo-missions-line = 基于低地球轨道层构建的研究与服务。

js-cat-domain-navigation-label = 惯性与替代导航

js-cat-domain-navigation-line = 惯性、地形、重力及其他无需卫星的导航。

js-cat-domain-orbits-label = 轨道与 GNSS 几何

js-cat-domain-orbits-line = 轨道外推、星历与导航卫星的几何。

js-cat-domain-solar-label = 太阳系

js-cat-domain-solar-line = 同一历元下的所有行星和卫星，含光行时。

js-cat-domain-spaceops-label = 任务分析与空间运行

js-cat-domain-spaceops-line = 过境、发射窗口、再入、链路与姿态预算。

js-cat-domain-spectrum-label = 频谱

js-cat-domain-spectrum-line = 无线电频段瀑布图：干扰机、信号以及接收机所跟踪的内容。

js-cat-domain-spoofing-label = 欺骗干扰与信号安全

js-cat-domain-spoofing-line = 虚假信号与转发式欺骗（meaconing），以及能发现它们的监测器。

js-cat-domain-studies-label = 量子、权衡研究与互操作性

js-cat-domain-studies-line = 量子传感器、权衡研究与互操作格式。

js-cat-domain-timing-label = 时钟与授时

js-cat-domain-timing-line = 无卫星时的时钟：守时（holdover）、稳定度、电信模板、时间传递。

js-cat-earth-gnss-lunar-question = 月球附近的接收机能否收到地球的 GNSS，这是否足以形成定位解？（模型计算）

js-cat-earth-gnss-lunar-title = 月球处的地球 GNSS

js-cat-entry-heating-stardust-question = 再入模型能否复现 Stardust 样品返回舱已发布的峰值减速度？

js-cat-entry-heating-stardust-title = Stardust 返回舱再入

js-cat-eo-coverage-question = 一条对地观测轨道能给出怎样的幅宽、地面采样距离和重访？

js-cat-eo-coverage-title = 对地观测覆盖

js-cat-eo-radiometry-question = 对于小型对地观测相机，15 % 反射率的场景会给出怎样的信噪比、奈奎斯特处的 MTF 和 NIIRS？（模型计算）

js-cat-eo-radiometry-title = 成像仪辐射测量与图像质量

js-cat-ephemeris-question = 卫星在哪里，何时从头顶过境？

js-cat-ephemeris-title = 星下点轨迹

js-cat-europa-surface-pnt-question = 能否借助一个小型中继星座和来自地球的一次测距，为木星的卫星木卫二（Europa）上的着陆器定位？（模型计算）

js-cat-europa-surface-pnt-title = 木卫二（Europa）上的着陆器

js-cat-fusion-pnt-coupled-question = 用一个覆盖位置、时钟和加速度计偏差的堆叠卡尔曼滤波器，导航器如何度过 GNSS 中断？（模型计算）

js-cat-fusion-pnt-coupled-title = 耦合传感器融合导航器

js-cat-fusion-pnt-question = 一个联合估计器在时钟 + 位置上能带来什么？

js-cat-fusion-pnt-title = 传感器融合

js-cat-gnss-ins-aviation-question = 在包含一次倾斜转弯的两分钟 GNSS 拒止期间，紧耦合的导航级或战术级 INS 会漂移多远？（模型计算）

js-cat-gnss-ins-aviation-title = 飞机在 GNSS 空窗期转弯

js-cat-gnss-ins-maritime-question = 在蛇行航行的船舶遭遇五分钟 GNSS 中断之后，导航级或战术级 INS 会漂移多远？（模型计算）

js-cat-gnss-ins-maritime-title = 船舶蛇行通过 GNSS 中断

js-cat-gnss-ins-question = 辅助惯性导航器在 GNSS 中断期间的滑行表现如何？

js-cat-gnss-ins-rail-question = 在可见两颗卫星的深堑，随后是隧道的路段，紧耦合 INS 会漂移多远？（模型计算）

js-cat-gnss-ins-rail-title = 列车通过路堑和隧道

js-cat-gnss-ins-title = GNSS/INS 融合

js-cat-gnss-sim-container-terminal-skyline-question = 海侧有起重机、陆侧有堆场时，还剩多少颗卫星，RAIM 保护会怎样？（模型计算；代表性天际线）

js-cat-gnss-sim-container-terminal-skyline-title = 集装箱码头上的跨运车

js-cat-gnss-sim-raim-question = 电离层和对流层如何影响原始伪距，RAIM 是否仍能提供保护？

js-cat-gnss-sim-raim-title = GNSS 测量

js-cat-gnss-ssv-formation-heo-question = 与对两者的绝对定位解作差相比，滤波器对相距一公里的两艘航天器的相对位置了解得有多好？（模型计算；由原生引擎记录的运行）

js-cat-gnss-ssv-formation-heo-title = 编队相对导航，大椭圆轨道

js-cat-gnss-ssv-heo-question = 大椭圆轨道沿其路径能收到什么：可见信号、最佳 C/N0、主瓣与旁瓣、DOP 以及掠射信号？（模型计算；由原生引擎记录的运行）

js-cat-gnss-ssv-heo-title = 大椭圆轨道上的 GNSS 信号

js-cat-gnss-ssv-lunar-weak-question = 为最弱信号设计的接收机，在飞往月球的途中能用到什么？（模型计算；由原生引擎记录的运行）

js-cat-gnss-ssv-lunar-weak-title = 月球转移轨道上的 GNSS 信号，弱信号接收机

js-cat-gnss-ssv-nav-lunar-question = 星载滤波器对月球转移轨道的保持情况，与其自身给出的界限相比如何？（模型计算；由原生引擎记录的运行）

js-cat-gnss-ssv-nav-lunar-title = 月球转移轨道上的星载 GNSS 滤波器

js-cat-gnss-ssv-shell-question = 对每个星座和频段，地球静止高度的航天器多久能收到至少一路、至少四路导航信号？（模型计算；由原生引擎记录的运行）

js-cat-gnss-ssv-shell-title = 卫星之上的 GNSS 信号：36 000 km 处的壳层

js-cat-gps-denied-gravity-nav-egm2008-question = 在真实的 EGM2008 重力场（70 阶）上，地图匹配能否保持 GPS 拒止下的航迹？（模型计算）

js-cat-gps-denied-gravity-nav-egm2008-title = 真实重力场上的重力导航

js-cat-gps-denied-gravity-nav-question = 无 GNSS 时整整一小时内位置漂移多远，重力图能否将其约束住？

js-cat-gps-denied-gravity-nav-title = 无 GNSS 导航

js-cat-gravity-map-error-mc-question = 随着存储的重力图噪声增大，地图匹配仍能把 GPS 拒止下的定位解保持在目标之内的频率有多高？（模型计算）

js-cat-gravity-map-error-mc-title = 重力图误差蒙特卡罗

js-cat-gravity-map-nav-question = 冷原子重力仪能否通过匹配其飞越的重力场，在无 GNSS 时保持位置？

js-cat-gravity-map-nav-title = 重力图导航

js-cat-holdover-test-example-question = 拔掉天线，为守时（holdover）评分：记录在操作人员给出的两个时刻处分段，每一步对照为其编写的 ITU-T 模板度量。（模型计算；该记录为示例而虚构）

js-cat-holdover-test-example-title = 守时（holdover）测试：对照模板的时间误差记录

js-cat-holdover-test-ptp4l-question = 从 ptp4l 伺服日志读出的同样四个步骤：GNSS 缺失期间，守护进程自身的偏移与模板相差多远？（模型计算；该日志为示例而虚构）

js-cat-holdover-test-ptp4l-title = 守时（holdover）测试：linuxptp 日志

js-cat-hybrid-optical-rf-question = 组合光学与射频 PNT 能带来怎样的连续性和完好性？（模型计算）

js-cat-hybrid-optical-rf-title = 光学/射频混合

js-cat-hybrid-pnt-question = 时钟 + 惯性组合套件能带来什么？

js-cat-hybrid-pnt-title = 混合 PNT

js-cat-hybrid-ukf-question = 17 状态紧耦合 UKF 是否自洽（NEES + 新息白度）？这是自洽性检查，不是精度声明。

js-cat-hybrid-ukf-title = 混合 17 状态 UKF

js-cat-impairment-eval-question = 检测器区分压制干扰 / 欺骗干扰 / 多路径与标称状态的能力有多好？（模型计算的 ROC/AUC）

js-cat-impairment-eval-title = 射频损伤评估

js-cat-imu-deadreckoning-question = 仅靠 IMU 滑行，位置漂移多远？

js-cat-imu-deadreckoning-title = 惯性航位推算

js-cat-ins-trn-coast-question = 导航中断期间位置漂移多远，何时越过 10 m 和 50 m？（模型计算）

js-cat-ins-trn-coast-title = INS/TRN 滑行

js-cat-integrity-harbour-approach-question = 码头建筑和防波堤遮住低仰角卫星时，GPS 和 Galileo 能否使 ARAIM 保护保持在告警限值之内？（模型计算；代表性天际线）

js-cat-integrity-harbour-approach-title = ARAIM 进港

js-cat-integrity-raim-question = 几何条件是否满足告警限值（HPL / VPL）？

js-cat-integrity-raim-title = RAIM 完好性

js-cat-jamming-demo-question = 干信比达到多少时，接收机会失锁？

js-cat-jamming-demo-title = 压制干扰

js-cat-jamming-harbour-approach-skyline-question = 在一部 2 W 岸边干扰机之下，船舶还保有多少颗卫星，码头本身又遮住多少颗？（模型计算；代表性天际线）

js-cat-jamming-harbour-approach-skyline-title = 进港时遭压制干扰的船舶

js-cat-l-band-waterfall-jamming-question = 当线性调频、单音和噪声干扰机相继开启时，整个 GNSS L 频段是什么样子，各自带走了哪些信号？（模型计算）

js-cat-l-band-waterfall-jamming-title = 压制干扰下的 L 频段瀑布图

js-cat-launch-window-question = 要从某个发射场到达目标倾角，需要怎样的发射方位角和转弯段 Δv？

js-cat-launch-window-title = 发射窗口

js-cat-leo-band-trade-question = 低轨导航信号在从特高频（UHF）到 C 频段的每个频段中得到什么、失去什么？（代表性设计）

js-cat-leo-band-trade-title = 频段权衡，UHF 至 C 频段

js-cat-leo-doppler-positioning-question = 利用低轨导航星座十分钟的多普勒，定位解有多好？（模型计算）

js-cat-leo-doppler-positioning-title = 仅用多普勒定位

js-cat-leo-focus-data-services-question = 每增加一项数据服务，要付出多少导航电文比特？（模型计算）

js-cat-leo-focus-data-services-title = 服务数据与帧长

js-cat-leo-focus-fused-pnt-sisre-question = 低轨空间信号测距误差要多小，低轨层才能对融合定位解有所帮助？（模型计算）

js-cat-leo-focus-fused-pnt-sisre-title = 融合定位解与轨道和时钟误差

js-cat-leo-focus-indoor-uhf-question = 哪个频段仍能到达传统建筑和保温节能建筑内的用户？（模型计算）

js-cat-leo-focus-indoor-uhf-title = 按频段和建筑划分的室内接收

js-cat-leo-focus-iot-eirp-question = 电池供电的标签需要多大的卫星发射功率才能持久？（模型计算）

js-cat-leo-focus-iot-eirp-title = 跟踪器能耗与发射功率

js-cat-leo-focus-ntn-bandwidth-question = 当参考信号从 180 kHz 加宽到 20 MHz 时，定位误差如何下降？（模型计算）

js-cat-leo-focus-ntn-bandwidth-title = 5G 下行定位与带宽

js-cat-leo-focus-ppp-altitude-question = 较低还是较高的低轨层能更多地缩短收敛时间？（模型计算；较慢，在浏览器中约一分钟）

js-cat-leo-focus-ppp-altitude-title = 精密定位与层高度

js-cat-leo-focus-science-iono-sounding-question = 两个频段之间的延迟差，对低轨卫星下方的电子含量的测量效果有多好？（模型计算）

js-cat-leo-focus-science-iono-sounding-title = 用两个频段探测电离层

js-cat-leo-indoor-uhf-question = 为什么 UHF 载波能进入建筑内部，而 L、S 和 C 频段却很吃力？（模型计算）

js-cat-leo-indoor-uhf-title = UHF 室内

js-cat-leo-iot-energy-question = 电池供电的标签每次利用低轨信号获得定位解要消耗多少能量？（模型计算）

js-cat-leo-iot-energy-title = 跟踪器每次定位解的能耗

js-cat-leo-navmsg-encode-decode-question = 每个字段的量化会带来什么代价，帧能否经受编码、解码和一个被破坏的比特？（模型计算）

js-cat-leo-navmsg-encode-decode-title = 导航电文：二进制帧

js-cat-leo-navmsg-fit-interval-trade-question = 一条广播电文能覆盖多久，其轨道误差才会超过目标？（模型计算；较慢，在浏览器中约 30 s）

js-cat-leo-navmsg-fit-interval-trade-title = 导航电文：拟合区间

js-cat-leo-navmsg-midpass-update-question = 当卫星在过境中途切换到新电文时，用户会看到跳变吗？（模型计算）

js-cat-leo-navmsg-midpass-update-title = 导航电文：过境中途更新

js-cat-leo-navmsg-model-comparison-question = 哪种星历模型对低轨的表示最好，它与已发布的表格相比如何？（模型计算）

js-cat-leo-navmsg-model-comparison-title = 导航电文：四种模型

js-cat-leo-pass-iridium-question = 客机在一次 Iridium 过境中看到怎样的信号强度和多普勒？（模型计算）

js-cat-leo-pass-iridium-title = 来自飞机的 Iridium 突发

js-cat-leo-pass-vs-gnss-cn0-question = 一次低轨过境的信号强度与可见的 Galileo 卫星相比如何？（模型计算）

js-cat-leo-pass-vs-gnss-cn0-title = 一次过境对比 GNSS

js-cat-leo-pass-xona-pulsar-question = 对于比斯开湾中的一艘船，X1 和 X5 信号在一次过境中是什么样子？（模型计算）

js-cat-leo-pass-xona-pulsar-title = Xona Pulsar 过境

js-cat-leo-pnt-end-to-end-question = 从信号设计到最终定位解，每个阶段向下一阶段传递什么？（模型计算）

js-cat-leo-pnt-end-to-end-title = 端到端，通用星座

js-cat-leo-pnt-mega-shell-question = 低地球轨道上 5,000 颗卫星的导航星座能给出怎样的覆盖和几何？（模型计算；示例设计）

js-cat-leo-pnt-mega-shell-title = 5,000 颗卫星的低轨设计

js-cat-leo-ppp-convergence-question = 加入低轨层后，精密单点定位（PPP）的收敛能快多少？（模型计算；较慢，在浏览器中约 30 s）

js-cat-leo-ppp-convergence-title = 精密定位收敛

js-cat-leo-pvt-fjord-skyline-question = 峡湾两壁沿航道只留下一条天空带，低轨层能为 GPS 和 Galileo 增加多少？（模型计算；代表性天际线）

js-cat-leo-pvt-fjord-skyline-title = 峡湾深处的渡轮

js-cat-leo-resilience-gnss-jammed-leo-carries-question = 当 GNSS 受到压制干扰时，位于其他频段的低轨层能否保持定位解及其完好性？（模型计算）

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS 受压制干扰，低轨继续工作

js-cat-leo-resilience-js-margin-question = 较强的低轨信号比来自中轨的 GNSS 信号多承受多少压制干扰？（模型计算）

js-cat-leo-resilience-js-margin-title = 由接收功率得到的干扰机裕量

js-cat-leo-resilience-multiband-diversity-question = 随着一部 L 频段干扰机功率调高，四个频段中哪些仍能保持跟踪？（模型计算）

js-cat-leo-resilience-multiband-diversity-title = 宽带阻塞式干扰机下的频段分集

js-cat-leo-resilience-spoof-doppler-question = 当欺骗源使计算出的位置移动 30 m 时，多普勒与过境几何检查多快能发现它？（模型计算）

js-cat-leo-resilience-spoof-doppler-title = 由多普勒发现欺骗干扰

js-cat-leo-resilience-spoof-monitors-question = 哪种监测器能发现哪种欺骗源？（模型计算）

js-cat-leo-resilience-spoof-monitors-title = 针对四种欺骗源的欺骗干扰监测器

js-cat-leo-timing-utc-question = 接收机按振荡器和信号电平划分，能多精确地从低轨卫星恢复协调世界时（UTC）？（模型计算）

js-cat-leo-timing-utc-title = 向 UTC 的时间传递

js-cat-leo-vertical-5g-network-timing-question = 当 GNSS 丢失一天时，低轨时间能否使基站保持在其授时限值之内？（模型计算）

js-cat-leo-vertical-5g-network-timing-title = 5G 基站授时

js-cat-leo-vertical-asset-tracking-iot-question = 沿集装箱的旅程，每次定位解对电池供电的标签要付出什么代价？（模型计算）

js-cat-leo-vertical-asset-tracking-iot-title = 集装箱跟踪

js-cat-leo-vertical-autonomous-vehicle-question = 当建筑遮住低仰角卫星时，低轨层能否使汽车保持在车道级误差之内？（模型计算）

js-cat-leo-vertical-autonomous-vehicle-skyline-question = 按真实街道而不是平坦的 35° 截止角建模，低轨层是否仍能使汽车保持在车道级误差之内？（模型计算；代表性天际线）

js-cat-leo-vertical-autonomous-vehicle-skyline-title = 街道中的车辆，而非平坦截止角

js-cat-leo-vertical-autonomous-vehicle-title = 城市峡谷中的车辆

js-cat-leo-vertical-critical-infrastructure-timing-question = 当 GNSS 丢失时，低轨时间能否保持变电站的同步？（模型计算）

js-cat-leo-vertical-critical-infrastructure-timing-title = 变电站授时

js-cat-leo-vertical-polar-arctic-question = 从特罗姆瑟到北极点，极轨低轨层能为 GNSS 增加什么？（模型计算）

js-cat-leo-vertical-polar-arctic-title = 北极之旅

js-cat-leo-vertical-rail-maritime-question = 当内置的船舶和列车场景失去 GNSS 时，低轨过境是否仍能到达它们？（模型计算）

js-cat-leo-vertical-rail-maritime-title = 带低轨层的铁路与海事

js-cat-link-budget-question = 在给定距离和数据速率下，单向链路是否留有裕量而闭合？

js-cat-link-budget-title = 链路预算

js-cat-lunanet-araim-question = 稀疏的月球中继集合能否满足阿尔忒弥斯区域接收机的完好性限值？

js-cat-lunanet-araim-title = 月球完好性

js-cat-lunar-attack-surface-question = 欺骗干扰或压制月面接收机需要什么条件，什么样的认证预算能应对？（模型计算）

js-cat-lunar-attack-surface-title = 月球攻击面

js-cat-lunar-beacon-question = 少量经测量的月面信标能使南极 DOP 缩小多少？（模型计算）

js-cat-lunar-beacon-title = 月面信标

js-cat-lunar-differential-pnt-question = 差分改正在月球上对消共模误差的程度与基线相比如何？（模型计算）

js-cat-lunar-differential-pnt-title = 月球差分 PNT

js-cat-lunar-frame-campaign-question = 由观测测评活动而非注入的变换，能得到怎样的基准精度？（模型计算）

js-cat-lunar-frame-campaign-title = 月球坐标系测评活动

js-cat-lunar-frame-realisation-question = 赫尔默特（Helmert）基准拟合能否恢复月球坐标系变换？（模型计算）

js-cat-lunar-frame-realisation-title = 月球坐标系

js-cat-lunar-infrastructure-carrier-phase-question = 月面站和轨道器能否共同固定地球 GNSS 信号的整周载波相位模糊度？快速示例运行。（模型计算；由原生引擎记录的运行）

js-cat-lunar-infrastructure-carrier-phase-title = 月球载波相位：月面站与轨道器

js-cat-lunar-infrastructure-frame-coestimation-question = 轨道器至月面站的测距，能为月球基准的七个参数增加多少信息？（模型计算；由原生引擎记录的运行）

js-cat-lunar-infrastructure-frame-coestimation-title = 带轨道器链路的月球坐标系联合估计

js-cat-lunar-infrastructure-geodesy-sensitivity-question = 激光测距、轨道器跟踪、重力仪和月面时钟对 h2、k2、l2 和天平动的敏感程度如何？（模型计算；由原生引擎记录的运行）

js-cat-lunar-infrastructure-geodesy-sensitivity-title = 月球勒夫数与天平动敏感度

js-cat-lunar-infrastructure-od-consistency-model-error-question = 同样的比较，但注入一个很小的未建模加速度：一致性检查能否发现它？（模型计算；由原生引擎记录的运行）

js-cat-lunar-infrastructure-od-consistency-model-error-title = 月球定轨，注入建模误差

js-cat-lunar-infrastructure-od-consistency-question = 月球晕轨道上的星载地球 GNSS 定轨与独立的地面射电定轨，能否在各自给出的不确定度范围内一致？（模型计算；由原生引擎记录的运行）

js-cat-lunar-infrastructure-od-consistency-title = 月球定轨：星载 GNSS 对地面跟踪

js-cat-lunar-infrastructure-space-tie-question = 与局部连接的误差相比，三种技术之间的偏移能被连接得多精确？（模型计算；由原生引擎记录的运行）

js-cat-lunar-infrastructure-space-tie-title = 空间连接：同一航天器上的 GNSS、VLBI 与激光测距

js-cat-lunar-interop-export-question = 月球坐标系 / 时间 / 星历能否经 CCSDS OEM + KIF 封装往返？

js-cat-lunar-interop-export-title = 月球互操作导出

js-cat-lunar-jamming-question = 干扰机能离多远，仍能压制月面接收机？（模型计算）

js-cat-lunar-jamming-title = 月球压制干扰

js-cat-lunar-joint-od-clock-question = 地球基线 VLBI 连接能否使月面站的绝对位置可观测？（模型计算）

js-cat-lunar-joint-od-clock-title = 月球联合 OD+时钟

js-cat-lunar-llr-datum-question = 当测评活动采用真实存档的月球激光测距（LLR）时，月球基准是什么样子？（模型计算；由原生引擎记录的运行）

js-cat-lunar-llr-datum-title = 月球激光测距基准

js-cat-lunar-relay-constellation-question = 冻结轨道和低月轨道上的中继与导航星座，对整个月球给出怎样的覆盖？（模型计算；示例设计）

js-cat-lunar-relay-constellation-title = 月球中继星座

js-cat-lunar-station-coverage-public-sources-question = 仅在公开说明的假设下，该站在南极上空给出怎样的改正后误差？结果主要由轨道根数决定，而轨道根数并不公开，被设为 ILLUSTRATIVE；这是冻结预测的输入。（模型计算；不是对任何真实系统的陈述）

js-cat-lunar-station-coverage-public-sources-title = 月球参考站，公开假设

js-cat-lunar-station-coverage-question = 在南极区域和一天之内，月球参考站给出怎样的改正后误差，覆盖能延伸到离它多远？（模型计算；不是对任何真实系统的陈述）

js-cat-lunar-station-coverage-terrain-question = 将每个站点的地平线在真实月球高程模型上做光线步进后，该站因地形损失多少覆盖？（模型计算）

js-cat-lunar-station-coverage-terrain-title = 带真实地形的月球站

js-cat-lunar-station-coverage-title = 月球参考站覆盖

js-cat-lunar-station-geodesy-baseline-question = 在加入任何站之前，当今的五个后向反射器阵列在真实时间表上能把月球基准约束到什么程度？一对的基线。（模型计算；由原生引擎记录的运行）

js-cat-lunar-station-geodesy-baseline-title = 月球站大地测量：仅五个阵列

js-cat-lunar-station-geodesy-with-station-question = 同样的存档时间表，再加入一个南极反射器和 VLBI 信标：基准界限收紧多少？（模型计算，示意性站点；由原生引擎记录的运行）

js-cat-lunar-station-geodesy-with-station-title = 月球站大地测量：加入南极站

js-cat-lunar-station-time-lab-question = 站上的微型铷钟最后一次被校准到月球时间后，能在 1、10 和 100 ns 之内保持多久，哪一项误差占主导？（模型计算）

js-cat-lunar-station-time-lab-title = 月球站时间实验室

js-cat-lunar-time-budget-question = 地月坐标时偏移有多大，其误差预算如何？（模型计算）

js-cat-lunar-time-budget-title = 月球时间预算

js-cat-lunar-time-offset-question = 月球时钟相对地球时间的漂移有多快（约 56–59 µs/天）？

js-cat-lunar-time-offset-title = 月球时间偏移

js-cat-lunar-vlbi-fim-question = 给定的 VLBI 跟踪时间表实际能换来怎样的站坐标精度？（模型计算）

js-cat-lunar-vlbi-fim-title = 月球 VLBI 信息

js-cat-lunar-vlbi-question = 地球基线的一对 VLBI 对月面信标看到怎样的时延？（模型计算）

js-cat-lunar-vlbi-title = 月球 VLBI

js-cat-maritime-port-approach-coast-question = 无 GNSS 进港时，导航级 INS 何时超出港口和海洋预算？（模型计算）

js-cat-maritime-port-approach-coast-title = 依靠惯性进港

js-cat-maritime-spoof-position-push-question = 当欺骗源把船舶的定位解拖偏 500 m 时，哪些检测层能发现它？（模型计算）

js-cat-maritime-spoof-position-push-title = 船舶位置被欺骗

js-cat-maritime-strait-jamming-question = 在 30 km 的开阔水域上，一部 50 W 干扰机能否夺走船舶的 GNSS？（模型计算）

js-cat-maritime-strait-jamming-title = 海峡中遭压制干扰的船舶

js-cat-mars-orbit-pnt-question = 由十二颗导航中继为低火星轨道器定位的效果如何，来自地球的一次测距又增加什么？（模型计算）

js-cat-mars-orbit-pnt-title = 带中继和地球链路的火星轨道器

js-cat-mars-pnt-lmo-question = MARCONI 中继星座能否为火星上的用户导航？（协方差品质指标，不是经认证的 PL）

js-cat-mars-pnt-lmo-title = 火星 PNT，低轨道

js-cat-mars-pnt-surface-question = 相对于中继星座，对自转的火星表面上的着陆器或火星车能导航得多好？

js-cat-mars-pnt-surface-title = 火星 PNT，表面

js-cat-mars-pnt-transfer-question = 对处于高偏心率接近段或捕获弧段的飞行器，在火星处能导航得多好？

js-cat-mars-pnt-transfer-title = 火星 PNT，转移

js-cat-meo-leo-fused-pvt-question = 在 GPS 和 Galileo 之上加入低轨层，会对位置误差和几何产生什么影响？（模型计算）

js-cat-meo-leo-fused-pvt-title = GNSS 与低轨融合定位解

js-cat-moonlight-service-volume-question = Moonlight/LCNS 级星座对南极给出怎样的 DOP、覆盖和完好性？（模型计算）

js-cat-moonlight-service-volume-title = 月球服务空域

js-cat-multi-band-jamming-waterfall-question = 导航信号分布在四个频段上时，为某一频段打造的干扰机会留下什么？（模型计算）

js-cat-multi-band-jamming-waterfall-title = 多频段压制干扰瀑布图

js-cat-notinbrowser-elevation-model = 需要月球高程模型裁剪数据（{ $path }），它随代码仓库提供，而不随浏览器版本提供。

js-cat-notinbrowser-laser-ranging-data = 需要存档的激光测距数据切片，它随代码仓库提供，而不随浏览器版本提供。

js-cat-notinbrowser-study-suite = 这是一组研究，而不是单个场景。请用命令行工具运行：{ $command }。

js-cat-ntn-5g-positioning-question = 按信号带宽划分，手机能依靠 5G 非地面网络下行链路多精确地为自己定位？（模型计算）

js-cat-ntn-5g-positioning-title = 5G 卫星下行链路定位

js-cat-oem-interop-question = 来自 GMAT / Orekit / STK 的 OEM 星历能否导入并往返？

js-cat-oem-interop-title = CCSDS OEM 桥接

js-cat-optical-atmosphere-network-question = 穿过云层和湍流，光学授时链路多久能接通，增加地面站能换来什么？（模型计算；示意性云气候）

js-cat-optical-atmosphere-network-title = 穿过大气的光学链路，三个站点

js-cat-optical-atmosphere-techniques-question = 在云和湍流中，更大的口径、另一种波长或自适应光学，能为一条光学上行链路换来什么？（模型计算；示意性云气候）

js-cat-optical-atmosphere-techniques-title = 光学链路技术

js-cat-orbit-gnss-challenged-question = 从卫星几何上看，什么时候才有可能形成定位解？

js-cat-orbit-gnss-challenged-title = GNSS 可用性

js-cat-orbit-molniya-question = 处于高偏心率闪电（Molniya）轨道的用户，在远地点附近是否仍能看到足够的 GNSS 卫星？

js-cat-orbit-molniya-title = 闪电（Molniya）轨道用户

js-cat-orbit-multignss-question = GPS + Galileo 一起使用，能把可用性提高多少，把精度因子收紧多少？

js-cat-orbit-multignss-title = 多 GNSS 可用性

js-cat-orbit-real-tle-question = 以两行根数给出的真实星座能提供怎样的覆盖？

js-cat-orbit-real-tle-title = 真实两行根数

js-cat-orbit-rinex-question = 真实的 RINEX 3 广播星历能得出怎样的可用性？

js-cat-orbit-rinex-title = 广播星历

js-cat-orbit-sgp4-gps-question = 真实的类 GPS 星座在一天内如何外推？

js-cat-orbit-sgp4-gps-title = SGP4 轨道

js-cat-orbit-urban-canyon-skyline-question = 在城市街道底部，GPS 和 Galileo 一天中有多少时间能给出四颗卫星，那一条天空带对 PDOP 有什么影响？（模型计算；代表性天际线）

js-cat-orbit-urban-canyon-skyline-title = 城市街道可用性

js-cat-passes-question = 卫星何时在某地面站上空升起和落下，持续多久？

js-cat-passes-title = 地面过境

js-cat-polar-arctic-leo-coverage-question = 从赤道到极点，仅用 GNSS、仅用极轨低轨层以及两者并用时，可见卫星和几何如何变化？（模型计算）

js-cat-polar-arctic-leo-coverage-title = 赤道到极点

js-cat-pvt-abmf-question = 能否从原始 RINEX 测量中解出真实接收机的位置？

js-cat-pvt-abmf-title = 定位（SPP）

js-cat-quantum-anomaly-detect-question = 在固定虚警率下，量子系统的故障能被检测得多好？（模型计算）

js-cat-quantum-anomaly-detect-title = 量子异常检测

js-cat-quantum-cai-coast-question = 与导航级石英加速度计相比，由其物理特性所确定的冷原子干涉仪，在 GNSS 丢失后能把航位推算保持在 100 m 之内多久？（模型计算）

js-cat-quantum-cai-coast-title = 量子加速度计滑行

js-cat-quantum-gnss-free-nav-question = 在无 GNSS 时，冷原子导航器与导航级 INS 相比，滑行漂移多远？（模型计算）

js-cat-quantum-gnss-free-nav-title = 量子无 GNSS 导航

js-cat-quantum-pnt-demonstrator-suite-question = 将三个量子应用领域作为一项研究（命令行研究套件：kshana --study）。

js-cat-quantum-pnt-demonstrator-suite-title = 量子 PNT 演示器研究

js-cat-quantum-time-transfer-question = 与经典的 CSAC + 射频链路相比，可信的量子授时能带来什么？（模型计算）

js-cat-quantum-time-transfer-title = 量子时间传递

js-cat-quantum-trade-question = 与经典基线相比，候选时钟能带来怎样的授时 / 惯性守时（holdover）？（模型计算）

js-cat-quantum-trade-title = 量子 PNT 权衡

js-cat-rail-tunnel-coast-question = 以 160 km/h 通过隧道时，战术级 INS 多快会超出其预算？（模型计算）

js-cat-rail-tunnel-coast-title = 列车通过隧道

js-cat-realtime-frame-eop-question = 实时（预测）地球定向会引入多大的坐标系误差？（模型计算）

js-cat-realtime-frame-eop-title = 实时坐标系/EOP

js-cat-reentry-question = 弹道式再入会经历怎样的峰值 g 和峰值加热速度？

js-cat-reentry-title = 再入走廊

js-cat-slot-timing-ocxo-leo-question = 低轨小卫星上的恒温晶体振荡器，在最后一次 GNSS 定位解之后，能在其时隙保护带内保持多久？（模型计算）

js-cat-slot-timing-ocxo-leo-title = 时隙授时

js-cat-small-uas-jammed-nav-question = 干扰机夺走 GNSS 之后，飞控级惯性单元与战术级惯性单元相比，漂移多远？

js-cat-small-uas-jammed-nav-title = 遭压制干扰的小型无人机

js-cat-solar-system-tour-question = 引擎所知的每个天体，从太阳到冥王星以及大型卫星，各在何处，光在它们之间要走多久？

js-cat-solar-system-tour-title = 同一历元的太阳系

js-cat-space-packet-question = CCSDS 133.0 数据包流能否逐位精确地编码和解码？

js-cat-space-packet-title = 空间数据包

js-cat-space-weather-question = 太阳 / 地磁活动如何改变热层密度？（模型计算）

js-cat-space-weather-title = 空间天气

js-cat-spoof-attack-question = 渐变的时间欺骗能否在达到规格限值之前被发现？

js-cat-spoof-attack-title = 欺骗干扰检测

js-cat-spoof-detect-question = 融合射频 + 测量的监测器能否发现协同的欺骗干扰？

js-cat-spoof-detect-title = 多层欺骗干扰检测

js-cat-spoof-meaconing-question = 在明确的攻击形态下，钟辅助的能量检测器在固定虚警率下多久能发现欺骗干扰？

js-cat-spoof-meaconing-title = 欺骗干扰检测器统计

js-cat-starlink-sop-doppler-positioning-question = 接收机能依靠不发送导航电文的宽带星座的多普勒，多好地为自己定位？（模型计算）

js-cat-starlink-sop-doppler-positioning-title = 宽带机会信号

js-cat-sweep-clock-stability-question = 扫描某一个时钟参数时，守时（holdover）如何变化？

js-cat-sweep-clock-stability-title = 参数扫描

js-cat-sweep-nd-inertial-question = 品质指标在多参数网格上如何变化？

js-cat-sweep-nd-inertial-title = N 维扫描

js-cat-telecom-prtc-holdover-24h-question = 丢失 GNSS 24 小时的铷参考，能否保持在 ITU-T 时间误差模板之内？（模型计算）

js-cat-telecom-prtc-holdover-24h-title = 电信守时（holdover），24 h

js-cat-telecom-synce-eec-question = 自由运行的恒温振荡器能否保持在同步以太网设备时钟漂移模板之内？（模型计算）

js-cat-telecom-synce-eec-title = 针对 SyncE 模板的频率同步

js-cat-telecom-tie-ingest-question = 时间间隔误差记录能否通过 ITU-T MTIE 和 TDEV 模板？

js-cat-telecom-tie-ingest-title = 电信模板检查，您的数据

js-cat-terrain-nav-question = 高度计能否通过匹配地形高程剖面来修正 INS 漂移？

js-cat-terrain-nav-title = 地形导航

js-cat-terrain-slam-question = 粒子滤波器能否对照地形图跟踪随时间变化的 INS 漂移？

js-cat-terrain-slam-title = 地形 SLAM

js-cat-time-transfer-budget-question = 站、转发器、电离层和萨尼亚克（Sagnac）各项对双向时间偏移有何影响，其不确定度预算如何？（模型计算）

js-cat-time-transfer-budget-title = 双向卫星时间传递

js-cat-timetransfer-question = 两个站点通过一条链路能保持多紧密的同步？

js-cat-timetransfer-title = 时间传递

js-cat-tracking-loop-question = 接收机在 C/N0 为多少时真正失锁，欺骗源能否把环路牵引过去？（模型计算）

js-cat-tracking-loop-title = 跟踪环路

js-cat-xona-pulsar-end-to-end-question = 同一条链路，使用公开的 Xona Pulsar 数据：信号、过境、电文、融合定位解和精密定位。（模型计算）

js-cat-xona-pulsar-end-to-end-title = 端到端，Xona Pulsar

js-cat-xona-pulsar-signals-question = 接收机对已发布的 X1 和 X5 信号能多精确地测距，捕获搜索空间有多大？（公开的信号表）

js-cat-xona-pulsar-signals-title = Xona Pulsar 信号

js-geo-a-place = 一个地点…

js-geo-axis-east = 东 +{ $ext } m

js-geo-axis-north = 北 +{ $ext } m

js-geo-canyon-needs = 街道峡谷形式需要引擎 0.36。

js-geo-canyon-out-of-range = 街道峡谷的数值超出范围（方位角 0 至 359.9°，宽度 1 至 200 m，高度 0 至 500 m，天线 0 至 50 m）；改用开阔地平线。

js-geo-canyon-reduced = 引擎将峡谷归约为 360 个分格的表格。

js-geo-compute-failed = 引擎无法计算此天空：{ $reason }

js-geo-computing = 计算中…

js-geo-copy-link = 复制此链接：{ $url }

js-geo-count-below = 低于地平线

js-geo-count-hidden = 被天际线遮挡

js-geo-count-in-view = 可见

js-geo-count-open-sky = 开阔天空

js-geo-count-used = 参与解算

js-geo-cursor-live = 方位角 { $az }°，天际线 { $el }°。

js-geo-dated-sky = 带日期的天空，其可靠程度只取决于根数及其年龄；预设已略去。

js-geo-dop-geometric = 几何

js-geo-dop-geometric-title = 几何精度因子

js-geo-dop-horizontal = 水平

js-geo-dop-horizontal-title = 水平精度因子

js-geo-dop-position = 位置，3-D

js-geo-dop-position-title = 位置，3-D 精度因子

js-geo-dop-time = 时间

js-geo-dop-time-title = 时间精度因子

js-geo-dop-vertical = 垂直

js-geo-dop-vertical-title = 垂直精度因子

js-geo-east = 东

js-geo-engine-not-running = 引擎未在此浏览器中运行（{ $reason }）。

js-geo-err-geometry-object = 引擎的几何回复不是对象

js-geo-err-mc-object = 引擎的蒙特卡罗回复不是对象

js-geo-err-no-sentences = 引擎的回复中没有语句

js-geo-err-reply-kind-not-json = 引擎的{ $what }回复不是 JSON

js-geo-err-reply-not-json = 引擎的回复不是 JSON

js-geo-error-line = 在 σ_UERE = { $uere } m、所述误差模型下（引擎数值）：{ $bits }。

js-geo-error-line-needs = 位置误差 ≈ 水平方向为 σ_UERE × HDOP，垂直方向为 σ_UERE × VDOP；该数值需要引擎 0.36。

js-geo-error-rms-3d = 3-D RMS σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = 水平 RMS σ_UERE × HDOP = { $m } m

js-geo-error-sigma = 1-sigma 误差：东向 { $east } m，北向 { $north } m

js-geo-fact-ellipse-1s = 椭圆，1-sigma

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m，长轴自正北起 { $deg }°

js-geo-fact-ellipse-pct = 椭圆，{ $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m（1-sigma × { $k }）

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = 位于 95 % 椭圆之内

js-geo-fact-inside-value = 点数的 { $pct } %

js-geo-fact-line = { $key }：{ $value }。

js-geo-fact-mc = 蒙特卡罗

js-geo-fact-mc-value = { $n } 个最小二乘解，随机种子 { $seed }

js-geo-fact-rms-3d = 点云 RMS，3-D

js-geo-fact-rms-3d-beside = { $rms } m，对照 σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = 点云 RMS，水平

js-geo-fact-rms-h-beside = { $rms } m，对照 σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }：不是 GeoJSON（应为 FeatureCollection、Feature 或几何对象）。

js-geo-gj-not-json = { $name }：不是 JSON（{ $reason }）。

js-geo-gj-not-object = { $name }：不是 GeoJSON 对象。

js-geo-gj-too-many = { $name }：{ $count } 个要素；本页面最多绘制 { $max } 个。

js-geo-legend-item = { $label }：{ $total } 颗中有 { $used } 颗参与解算

js-geo-link-copied = 已复制链接。

js-geo-link-copied-no-tle = 已复制链接（不含您粘贴的根数：链接打开的是预设）。

js-geo-mc-off = 关

js-geo-missing-ellipse = 误差椭圆

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = 蒙特卡罗点云

js-geo-missing-open-sky = 开阔天空占比

js-geo-missing-skyline = 天际线

js-geo-missing-tdop = TDOP

js-geo-needs = 需要引擎 0.36

js-geo-needs-cap = 需要引擎 0.36

js-geo-no = 否

js-geo-no-ellipse = 无椭圆

js-geo-no-sats = 没有可显示的卫星。

js-geo-north = 北

js-geo-not-given = 未给出

js-geo-note-elements-skipped = 已跳过 { $count } 组根数：{ $list }。

js-geo-note-latitude-limited = 此引擎构建所建模的站点位于距赤道 89° 以内；纬度已限制在此范围。

js-geo-note-leo-left-out = LEO：需要引擎 0.36；已略去。

js-geo-note-no-engine = 引擎未在此浏览器中运行，因此没有可显示的内容。它以 WebAssembly 运行；阻止 WebAssembly 的浏览器或宿主无法运行此视图。

js-geo-note-pick-one = 请至少选择 GPS、Galileo 和 BeiDou 之一。

js-geo-note-skyline-not-applied = 天际线已绘制但未应用：应用它需要引擎 0.36。其后的卫星在此处仍然计入。

js-geo-note-skyline-source = 天际线：{ $source }。

js-geo-note-training-model = 引擎 { $version } 训练天空模型（nmea_training），时刻 { $instant }：角度取整数度，DOP 取一位小数，与接收机语句所带的一致；定位解最多使用 12 颗卫星，按信号强度选取。

js-geo-note-unknown-systems = 已略去 { $count } 条本视图不绘制的系统的卫星记录。

js-geo-off-leo = LEO：需要引擎 0.36。

js-geo-off-monte-carlo = 蒙特卡罗点云需要引擎 0.36。

js-geo-off-skyline = 应用天际线需要引擎 0.36：此处仅绘制。

js-geo-offset-own = 相对于您的根数历元（{ $epoch }）的偏移

js-geo-offset-ref = 相对于各星座参考历元的偏移

js-geo-open-sky-share = 上半球的 { $pct } %

js-geo-out-of-range = 超出范围，因此保持为上一个有效值：{ $names }。

js-geo-own-elements-at = 您自己的根数，历元 { $epoch }。

js-geo-pick-constellation = 请至少选择一个星座。

js-geo-place-geiranger = 挪威盖朗厄尔峡湾

js-geo-place-manhattan = 美国曼哈顿中城

js-geo-place-oslo = 挪威奥斯陆港

js-geo-place-rotterdam = 荷兰鹿特丹港

js-geo-place-singapore = 新加坡海峡

js-geo-place-tallinn = 爱沙尼亚塔林港

js-geo-place-tromso = 挪威特罗姆瑟

js-geo-plot-desc = 图中有 { $total } 颗卫星，其中 { $used } 颗参与解算。

js-geo-preset-illustrative = 由本页面绘制的示意轮廓；应用天际线需要引擎 0.36。

js-geo-ready = 就绪。

js-geo-ready-needs = 就绪。需要引擎 0.36：{ $list }。

js-geo-sat-masked = { $label } { $id }：方位角 { $az }°，仰角 { $el }°，被天际线遮挡

js-geo-sat-unused = { $label } { $id }：方位角 { $az }°，仰角 { $el }°，未使用

js-geo-sat-used = { $label } { $id }：方位角 { $az }°，仰角 { $el }°，参与解算

js-geo-scenarios-under = 引擎在此天际线下的场景：

js-geo-sky-canyon = 街道峡谷

js-geo-sky-drawn = 绘制在天空图上

js-geo-sky-open = 开阔地平线

js-geo-sky-preset = 预设：{ $name }

js-geo-sky-source = 天空：{ $source }。

js-geo-skyline-city-street = 城市街道

js-geo-skyline-container = 集装箱码头

js-geo-skyline-fjord = 峡湾

js-geo-skyline-harbour = 进港航道

js-geo-skyline-load-failed = 无法加载天际线（{ $reason }）。

js-geo-skyplot-downloaded = 已下载天空图。

js-geo-skyplot-export-failed = 无法导出天空图（{ $reason }）。

js-geo-source-geometry = Kshana 引擎 { $version }，sky_geometry

js-geo-source-line = { $source }。

js-geo-source-training = Kshana 引擎 { $version }，训练天空模型

js-geo-south = 南

js-geo-style-own-elements = 您的根数

js-geo-svg-refused = 引擎的 SVG 被拒绝

js-geo-table-count = { $n } 颗卫星，与天空图相同。

js-geo-tle-epoch = 请给出 2000 至 2099 年的 UTC 历元。

js-geo-tle-paste-first = 请先粘贴一组或多组两行根数。

js-geo-tle-too-large = 粘贴的根数大于 4 MiB，即引擎的输入上限。

js-geo-used-masked = 否：被天际线遮挡

js-geo-using-own = 正在使用您自己的根数。链接只记录您使用过它们，而不包含根数本身。

js-geo-wasm-blocked = WebAssembly 已被阻止

js-geo-west = 西

js-geo-why = 原因

js-geo-why-interim = 误差椭圆和蒙特卡罗点云需要引擎 0.36（其 sky_geometry 和 sky_monte_carlo 函数）；此页面中的引擎版本较旧。

js-geo-why-no-ellipse = 引擎没有为此几何给出椭圆（卫星太少无法形成定位解，或几何奇异）。

js-geo-why-no-ellipse-reason = 引擎没有为此几何给出椭圆（卫星太少无法形成定位解，或几何奇异）：{ $reason }。

js-geo-why-waiting = 正在等待引擎。

js-geo-yes = 是

js-hold-axis-seconds = 自第一个采样起的秒数

js-hold-axis-tau = 观测时间 τ，s（对数）

js-hold-axis-te = 时间误差，ns

js-hold-band-title = 恢复带 ±{ $band } ns

js-hold-blurb-example = 每 5 s 一个采样：锁定 600 s，在 600 s 时移除 GNSS，守时（holdover），在 2400 s 时恢复 GNSS。该记录是为示例而生成的；不是测量结果。

js-hold-blurb-ptp4l = 从 ptp4l 伺服日志读出的同样四个步骤（守护进程自身的偏移，单位 ns）。该日志是为示例而编写的；没有守护进程运行。

js-hold-budget-exceeded = { $name } 在移除后 { $s } s 首次超限

js-hold-chip-baseline = 对照其模板的基线

js-hold-chip-envelope = ePRTC-A 守时（holdover）包络

js-hold-chip-holdover = 对照其模板的守时（holdover）

js-hold-chip-measured = 对照模板度量

js-hold-chip-recovery = 恢复

js-hold-chip-words = 文字说明

js-hold-curve-title = { $step }：{ $which }，ns

js-hold-curves-aria = { $which }随观测时间的变化，含模板限值

js-hold-envelope-exceeded = ePRTC-A 守时（holdover）包络在移除后 { $s } s 首次超限

js-hold-envelope-exceeded-short = { $verdict }，在移除后 { $s } s 首次超限（记录短于包络的周期）

js-hold-envelope-exceeded-value = { $verdict }，在移除后 { $s } s 首次超限

js-hold-envelope-short = { $verdict }（记录短于包络的周期）

js-hold-file-error = { $name }：{ $error }。

js-hold-file-not-json = { $name }：不是 JSON。

js-hold-file-read-here = { $name }，已在此读取；未上传任何内容。

js-hold-file-too-large = { $name } 超出本页面可读取的大小。

js-hold-from-record = 结果的记录

js-hold-from-record-decimated = 结果的记录，从 { $total } 个采样中抽取 { $have } 个

js-hold-gnss-removed = GNSS 已移除

js-hold-gnss-removed-stated = GNSS 已移除（由操作人员给出）

js-hold-gnss-restored = GNSS 已恢复

js-hold-gnss-restored-stated = GNSS 已恢复（由操作人员给出）

js-hold-largest-at = { $value }，于 T+{ $time } s

js-hold-limit-label = ±{ $ns } ns { $step }模板

js-hold-limit-title = { $id }：±{ $ns } ns，{ $step }步骤上的最大绝对时间误差

js-hold-mark-title = { $id } 限值 { $limit } ns，于 τ { $tau } s（{ $verdict }；{ $source }）

js-hold-marker-time = { $name }，T+{ $time } s

js-hold-na = 不适用

js-hold-no-curve = 没有时间误差曲线：无法复现该记录以供绘制。

js-hold-no-which-curve = 此结果中没有{ $which }曲线。

js-hold-not-exceeded = 未超限

js-hold-not-recovered = 未能保持在恢复带之内

js-hold-not-result = 这不是守时（holdover）测试结果

js-hold-open-failed = 无法打开 { $title }：{ $reason }。

js-hold-opening = 正在打开 { $title }…

js-hold-phase-baseline = 基线：已锁定

js-hold-phase-holdover = 守时（holdover）：GNSS 已移除

js-hold-phase-recovery = 恢复：GNSS 已恢复

js-hold-phase-title = { $phase }，T+{ $from } s 至 { $to } s

js-hold-read-failed = 无法读取或绘制（{ $reason }）。

js-hold-recorded = { $title }：引擎的已记录结果（版本 { $version }）。

js-hold-recovered = 在 GNSS 回归后 { $after } s，于 ±{ $band } ns 之内保持 { $dwell } s

js-hold-result-not-json = 结果不是 JSON（{ $reason }）

js-hold-result-not-loaded = 已记录的结果未能加载

js-hold-row-envelope = ePRTC-A 守时（holdover）包络

js-hold-row-frequency = 保持的频率偏移（拟合斜率）

js-hold-row-largest = 最大绝对时间误差

js-hold-row-length = 守时（holdover）时长

js-hold-row-margin = 包络之内的最小裕量

js-hold-row-peak = 恢复后的峰值

js-hold-row-recovery = 恢复

js-hold-row-recovery-step = 恢复期间的最大阶跃

js-hold-row-residual = 相对于该直线的残差（rms）

js-hold-row-step = 移除时刻的阶跃

js-hold-status-final = { $status } { $label }；对照模板度量。

js-hold-step-span = T+{ $from } 至 { $to } s

js-hold-te-aria = 整个记录期间的时间误差，含各阶段和模板限值

js-hold-te-line-title = 时间误差，ns

js-hold-te-note = 时间误差取自 { $from }。这两个时刻由 { $by } 给出。

js-hold-th-budget = 预算

js-hold-th-budget-limit = 限值 |TE|，ns

js-hold-th-first-exceeded = 移除后首次超限，s

js-hold-th-largest = 最大 |TE|，ns

js-hold-th-limit = 限值，ns

js-hold-th-margin = 裕量，ns

js-hold-th-mask = 模板

js-hold-th-mean = 均值，ns

js-hold-th-measured-on = 度量于

js-hold-th-metric = 指标

js-hold-th-rms = RMS，ns

js-hold-th-samples = 采样

js-hold-th-source = 来源

js-hold-th-span = 跨度

js-hold-th-step = 步骤

js-hold-th-value = 值，ns

js-hold-th-verdict = 结论

js-hold-th-worst-at = 最差处于 τ 或 T+，s

js-hold-title-example = 一份时间误差记录

js-hold-title-ptp4l = 一份 linuxptp 日志

js-hold-why-no-samples = 结果中没有时间误差采样（record.series），因此不绘制曲线

js-hold-why-not-series = 结果中的序列不是时间序列（采样少于两个，或时间不递增），因此不绘制曲线

js-hold-why-sentence = { $why }。

js-hold-why-too-many = 结果中的序列有 { $have } 个采样，而引擎评分的是 { $scored } 个，因此不绘制曲线

js-interf-attribution = 归因

js-interf-build-failed = { $name }：无法构建（{ $reason }）。

js-interf-built-day-maps =
    { $n ->
       *[other] 已在此浏览器中，用引擎 { $version } 从 { $name } 构建 { $n } 张日地图。
    }

js-interf-built-detail = { $date }：已发布 { $published } 个单元，标记 { $flagged } 个

js-interf-built-from-sample = 已在此浏览器中，用引擎从合成的{ $kind }样本构建。虚构的报告；没有真实的飞机、船舶或日期。

js-interf-built-maps =
    { $n ->
       *[other] 已构建 { $n } 张地图（{ $detail }）。仅为汇总：被标记的单元并不表明干扰是原因。
    }

js-interf-built-none = { $name }：引擎没有构建任何地图。

js-interf-caveat-coverage = 覆盖范围取决于数据源；请阅读覆盖说明。

js-interf-caveat-no-colour = 没有颜色的单元表示未被观测。这不是该区域无干扰的证据。

js-interf-caveat-not-finding = 降级或异常的单元并不是发现了干扰。还存在其他原因。

js-interf-caveat-past-reports = 这是对过去位置报告的描述，不是预报，也不是对任何接收机的测量。

js-interf-caveats = 注意事项

js-interf-cell-size-rule = 单元大小必须是大于 0 且不超过 10 的度数，或留空表示 0.5。

js-interf-check-failed = { $name }：无法检查（{ $reason }）。

js-interf-click-cell = 点击一个单元，或聚焦地图并使用方向键，即可查看其数值。

js-interf-close = 关闭

js-interf-close-file = 关闭 { $name }

js-interf-col-affected = 受影响

js-interf-col-cell-area = 单元面积

js-interf-col-detectors = 检测器

js-interf-col-observed = 已观测

js-interf-col-sampled = 已采样

js-interf-col-share = 占比

js-interf-col-status = 状态

js-interf-coverage-limits = 此数据源的覆盖范围限制

js-interf-csv-too-big = { $name }：大于 24 MiB；请从节选内容构建（命令行工具可处理整个文件）。

js-interf-csv-too-big-short = { $name }：大于 24 MiB；请从节选内容构建。

js-interf-custom-needs-licence = 自定义数据集需要提供许可、其 URL 和署名文字：它们会写入地图文件。

js-interf-dataset = 数据集

js-interf-dates-rule = 日期格式为 YYYY-MM-DD，留空表示不限。

js-interf-day = 日期

js-interf-day-aria = { $kind } 日

js-interf-day-confounded-note = 这一天受到混杂影响：由于当日的背景水平，没有单元被判为降级。原本会突出显示的单元显示为未评估。

js-interf-day-figures-aria = 当日数据

js-interf-demo-csv-name = { $file }（合成样本）

js-interf-demo-failed = 无法打开演示：{ $reason }。

js-interf-demo-opened = 合成演示：三个虚构文件，对应一片虚构的开阔洋面区域（两个 ADS-B 日，其中一天受混杂影响，以及一个 AIS 日）。背后没有任何真实的飞机、船舶或日期。请使用 ADS-B 图层上的日期选择器。

js-interf-demo-route-name = route.csv（合成）

js-interf-describe-map = { $date } 的 { $kind } 地图：已绘制 { $cells } 个单元，{ $parts }。未绘制的单元未被观测。

js-interf-did-not-load = { $url } 未能加载

js-interf-engine-no-fn = 此引擎构建版本（版本 { $version }）没有 { $fn }；其版本早于本页面。对应的命令行用法见“工具”页面。

js-interf-engine-start-failed = 引擎无法在此处启动（{ $reason }）。上方的打开地图文件功能仍可使用。

js-interf-err-format-version = { $name }：不是受支持的 Kshana 干扰地图（format_version { $version }；本页面支持 { $supported }）。

js-interf-err-no-rows = { $name }：此报告中没有 rows[]。

js-interf-err-not-json = { $name }：不是 JSON（{ $reason }）。

js-interf-err-not-map = { $name }：这是 GeoJSON，但不是 Kshana 干扰地图（没有 kshana_interference_map 成员）。

js-interf-err-not-route = { $name }：不是 Kshana 航线暴露报告（没有 kshana_route_exposure 成员）。

js-interf-err-route-schema = { $name }：schema { $schema } 不是本页面所读取的 { $expected }。

js-interf-err-source-kind = { $name }：source_kind { $kind } 既不是 adsb 也不是 ais。

js-interf-err-unknown-schema = { $name }：未知的 schema { $schema }；本页面读取 { $supported }。

js-interf-foot-attribution = 署名：{ $text }

js-interf-foot-coverage = 覆盖范围：{ $notes }

js-interf-foot-layer = { $kind } 图层，{ $date }。未绘制的单元未被观测。

js-interf-foot-licence = 许可：{ $licence }

js-interf-foot-licence-url = 许可：{ $licence }（{ $url }）

js-interf-grid = 网格：经纬度方向边长为 { $size }° 的正方形单元（{ $type }）。东西向宽度随纬度减小。

js-interf-guards = 对其他原因的防范措施

js-interf-input = 输入

js-interf-land-set = 陆地多边形：{ $name }。

js-interf-land-too-big = 该陆地文件大于 24 MiB。

js-interf-larger-than = { $name }：大于 { $limit }；本页面读取不超过该大小的地图文件。

js-interf-layer-adsb-sub = 飞机报告导航精度较低的单元

js-interf-layer-ais-sub = 船舶报告了不合理的位置或运动的单元

js-interf-layer-heading = { $kind } 图层

js-interf-layer-hidden = { $kind } 图层已隐藏。

js-interf-layers-separate = ADS-B 和 AIS 是各自独立的图层，有各自的开关、图例和许可行。二者绝不合并为同一个色场或同一个计数。

js-interf-legend-aria = 各单元状态的含义；取消勾选某一项可淡化对应单元

js-interf-licence = 许可

js-interf-licence-aria = { $name } 的数据许可

js-interf-licence-heading = 数据许可与署名

js-interf-map-aria = { $summary } 用方向键在已绘制的单元之间移动。

js-interf-maps-open =
    { $n ->
       *[other] 已打开 { $n } 幅地图。
    }

js-interf-method-summary = 方法与注意事项

js-interf-no-cell-at = { $lat }、{ $lon } 处没有单元：未被观测。这不是该区域无干扰的证据。

js-interf-no-cell-drawn = 未绘制单元

js-interf-no-cells-draw = 此文件没有可绘制的单元。

js-interf-no-day-figures = 此文件未给出日级数据。

js-interf-no-file-opened = 没有文件可以打开。

js-interf-no-file-text = 已打开的地图没有可供检查的文件文本（它们不是作为文件打开的）。

js-interf-none = 无

js-interf-none-stated = （未说明）

js-interf-none-stated-file = （此文件中未说明）

js-interf-north-abbr = 北

js-interf-not-evaluated = 未评估

js-interf-not-opened-full = { $name }：未打开，已打开 { $max } 幅地图。请先关闭一些。

js-interf-nothing-open = 尚未打开任何内容。

js-interf-nothing-opened = 未打开任何内容。

js-interf-one-day = 一次一天

js-interf-opened-file-map = 已打开 { $files } 个文件；已打开 { $maps } 幅地图。

js-interf-opened-file-maps = 已打开 { $files } 个文件；已打开 { $maps } 幅地图。

js-interf-opened-files-map = 已打开 { $files } 个文件；已打开 { $maps } 幅地图。

js-interf-opened-files-maps = 已打开 { $files } 个文件；已打开 { $maps } 幅地图。

js-interf-opening-demo = 正在打开合成演示…

js-interf-parameters = 参数，在读取任何数据之前即已固定

js-interf-read-draw-failed = { $name }：无法读取或绘制（{ $reason }）。

js-interf-read-failed = { $name }：无法读取（{ $reason }）。

js-interf-read-with-map = 请结合地图阅读

js-interf-reading = 正在读取…

js-interf-route-aria = 航线暴露 { $name }

js-interf-route-chip = 航线

js-interf-route-done =
    { $n ->
       *[other] 已用 { $n } 幅地图和引擎 { $version } 计算出航线暴露；报告显示在下方。
    }

js-interf-route-explain = 航线长度在每种状态下所占的比例，按日期和数据源列出。四个占比之和为 1，需结合起来阅读：降级占比低而未观测占比高，并不表示已证明畅通。ADS-B 和 AIS 的行绝不合并。

js-interf-route-exposure = 航线暴露

js-interf-route-needs-map = 请先打开或构建至少一幅地图：航线是对照本页面上的地图检查的。

js-interf-route-open-failed = 无法打开航线：{ $reason }。

js-interf-route-range = { $from } 至 { $to }

js-interf-route-too-big = { $name }：大于 24 MiB。

js-interf-row-affected-share = 受影响占比

js-interf-row-aircraft-affected = 受影响的飞机

js-interf-row-aircraft-observed = 已观测的飞机

js-interf-row-aircraft-sampled = 已采样的飞机

js-interf-row-area = 面积

js-interf-row-cell = 单元

js-interf-row-detectors = 达到条件的检测器

js-interf-row-flagged = 已标记：{ $detector }

js-interf-row-status = 状态

js-interf-row-vessels-observed = 已观测的船舶

js-interf-rows-skipped =
    { $count ->
       *[other] 有 { $count } 行无效，已跳过。
    }

js-interf-rt-day = 日期

js-interf-rt-km = 航线公里数

js-interf-rt-licence = 地图的许可与署名

js-interf-rt-shares = 航线占比

js-interf-rt-source = 数据源

js-interf-sample-failed = 无法打开样本：{ $reason }。

js-interf-save = 保存：

js-interf-save-report = 保存报告（JSON）

js-interf-show-layer = 显示此图层

js-interf-st-anomalous-label = 异常

js-interf-st-anomalous-text = 当日至少有一个检测器在此处标记了足够多的不同船舶（至少 3 艘，且占已观测船舶的 20%）。可能的原因包括干扰，但也包括许多普通原因。

js-interf-st-confounded-label = 当日受混杂影响

js-interf-st-confounded-text = 当日单元占比的中位数较高，这表明原因为大范围因素。在这样的日子里不判定任何单元为降级；此单元原本会突出显示。

js-interf-st-degraded-label = 降级

js-interf-st-degraded-text = 当日此处被采样的飞机中，报告导航精度较低的占比很高，远高于当日的中位数单元。这并不说明原因。

js-interf-st-no-background-label = 无背景估计

js-interf-st-no-background-text = 无法依据足够多的单元估计当日背景（报告精度较低的飞机的典型占比），因此没有单元与之比较，也不做任何判定。

js-interf-st-not-anomalous-label = 非异常

js-interf-st-not-anomalous-text = 已观测，且没有检测器达到条件。不能证明什么都没有发生。

js-interf-st-not-degraded-label = 未降级

js-interf-st-not-degraded-text = 已采样，报告精度较低的飞机占比并不突出。不能证明什么都没有发生。

js-interf-st-too-few-label = 飞机过少

js-interf-st-too-few-text = 已发布（至少观测到 5 架不同的飞机），但可采样的飞机少于 10 架，因此不做判定。

js-interf-starting-build = 正在启动引擎并构建…

js-interf-starting-route = 正在启动引擎并检查航线…

js-interf-state-clear-adsb = 正常

js-interf-state-clear-adsb-text = 有足够多的飞机被观测到且未被标记。不能证明什么都没有发生。

js-interf-state-clear-ais = 正常

js-interf-state-clear-ais-text = 有足够多的船舶被观测到且未被标记。不能证明什么都没有发生。

js-interf-state-degraded-adsb = 降级

js-interf-state-degraded-adsb-text = 当日此处被采样的飞机中，报告导航精度较低的占比很高，远高于当日的中位数单元。

js-interf-state-degraded-ais = 异常

js-interf-state-degraded-ais-text = 当日至少有一个检测器在此处标记了足够多的不同船舶（至少 3 艘，且占已观测船舶的 20%）。

js-interf-state-notobs-adsb = 未观测

js-interf-state-notobs-adsb-text = 未绘制单元：观测到的飞机过少，无法发布。这不是该区域无干扰的证据。

js-interf-state-notobs-ais = 未观测

js-interf-state-notobs-ais-text = 未绘制单元：观测到的船舶过少，无法发布。这不是该区域无干扰的证据。

js-interf-state-unassessed-adsb = 未评估

js-interf-state-unassessed-adsb-text = 已观测，但可采样的飞机过少、当日受混杂影响，或无法估计当日背景，因此不做判定。

js-interf-state-unassessed-ais = 未评估

js-interf-state-unassessed-ais-text = 已观测，但不做判定。

js-interf-status-unknown = 本页面未描述的状态。

js-interf-table-first = 显示 { $total } 个单元中的前 { $shown } 个，有影响的判定排在前面。

js-interf-table-summary = 以表格列出每个已绘制的单元（{ $n }）

js-interf-the-day = 当日

js-interf-unknown-date = 未知日期

js-interf-warn-cell-size = 此文件使用的单元大小 { $size }° 不是预先登记的大小：它不是预先登记的方法，因此其判定与使用预先登记大小的文件不可比。

js-interf-warn-cell-size-known = 此文件使用的单元大小 { $size }° 不是预先登记的大小（{ $registered }°）：它不是预先登记的方法，因此其判定与使用预先登记大小的文件不可比。

js-interf-warn-day-confounded = 这一天受到混杂影响：由于当日的背景水平（单元占比的中位数本身就很高），没有单元被判为降级。

js-interf-warn-flag-disagrees =
    { $count ->
       *[other] 有 { $count } 个单元的“degraded”标记与其状态不一致。绘制的是状态。
    }

js-interf-warn-no-licence = 此文件不含 { $fields } 文字。该文件仍会显示，但缺少许可和署名的地图不应再次发布。

js-interf-warn-on-land-off = 此文件的陆上检测器已关闭（未提供陆地多边形）。

js-interf-warn-skipped =
    { $count ->
       *[other] 有 { $count } 个要素不是有效的 GeoJSON，已跳过。
    }

js-interf-warn-unknown-status = 本页面不认识的状态值：{ $values }。它们按“no call”绘制。

js-interf-withheld = 已保留不发布（少于 5）

js-interf-written-by = 由 Kshana { $version } 写出

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = 码抖动 (m)

js-kind-axis-code-tracking-jitter-m = 码跟踪抖动 (m)

js-kind-axis-doppler-shift-hz = 多普勒频移 (Hz)

js-kind-axis-effective-c-n0-db-hz = 有效 C/N0 (dB-Hz)

js-kind-axis-elevation = 高度角 (°)

js-kind-axis-fit-interval-s = 拟合区间 (s)

js-kind-axis-formal-position-sigma-m = 形式位置 sigma (m)

js-kind-axis-latitude = 纬度 (°)

js-kind-axis-leo-satellites-added-to-the = 加入定位解的 LEO 卫星

js-kind-axis-mean-satellites-in-view = 平均可见卫星数

js-kind-axis-median-dilution-of-precision = 精度因子中位数

js-kind-axis-median-error-m = 误差中位数 (m)

js-kind-axis-median-pdop = PDOP 中位数

js-kind-axis-metres = 米

js-kind-axis-observation-window-s = 观测窗口 (s)

js-kind-axis-offset-from-the-signal-s = 相对信号中心的偏移 (MHz)

js-kind-axis-offset-from-the-snapshot-centre = 相对快照中心的偏移 (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = 位置误差 (m)

js-kind-axis-power-spectral-density-db-hz = 功率谱密度（dB/Hz，单位功率）

js-kind-axis-power-spectral-density-dbw-hz = 功率谱密度（dBW/Hz）

js-kind-axis-probability-of-detection = 检测概率

js-kind-axis-range-error-m = 距离误差 (m)

js-kind-axis-relays = 中继

js-kind-axis-sisre-root-mean-square-m = SISRE，均方根 (m)

js-kind-axis-time-error-ns = 钟差 (ns)

js-kind-axis-time-s = 时间 (s)

js-kind-axis-time-since-the-start-min = 自开始起的时间 (min)

js-kind-axis-update-period-s = 更新周期 (s)

js-kind-cap-body-pnt-label = 中继定位

js-kind-cap-campaign-label = 测评活动

js-kind-cap-constellation-design-label = 覆盖

js-kind-cap-leo-navmsg-label = 导航电文

js-kind-cap-leo-pass-label = 过境与链路

js-kind-cap-leo-pnt-chain-label = 端到端链路

js-kind-cap-leo-ppp-label = 定位

js-kind-cap-leo-pvt-label = 定位

js-kind-cap-leo-signal-label = 信号设计

js-kind-cap-lunar-llr-datum-label = 激光测距基准

js-kind-cap-ntn-positioning-label = 定位

js-kind-cap-solar-system-label = 太阳系

js-kind-cap-spectrum-label = 频谱

js-kind-guided-doppler-error-hz = 多普勒误差 (Hz)

js-kind-guided-duration-s = 持续时间 (s)

js-kind-guided-earth-range-error-m = 地球距离误差 (m)

js-kind-guided-elevation-mask = 高度角截止 (°)

js-kind-guided-first-jammer-bandwidth-mhz = 第一个干扰机带宽 (MHz)

js-kind-guided-first-jammer-power-dbw = 第一个干扰机功率 (dBW)

js-kind-guided-first-jammer-range-m = 第一个干扰机距离 (m)

js-kind-guided-first-jammer-received-power-dbw = 第一个干扰机接收功率 (dBW)

js-kind-axis-3-d-position-error-m = 3-D 位置误差 (m)

js-kind-guided-first-phase-length-s = 第一阶段时长 (s)

js-kind-guided-first-shell-altitude-km = 第一壳层高度 (km)

js-kind-guided-first-shell-inclination = 第一壳层倾角 (°)

js-kind-guided-first-signal-bandwidth-hz = 第一个信号带宽 (Hz)

js-kind-guided-first-system-range-error-m = 第一个系统的距离误差 (m)

js-kind-guided-fit-interval-s = 拟合区间 (s)

js-kind-guided-gravity-field-degree = 引力场阶数

js-kind-guided-grid-step = 网格步长 (°)

js-kind-guided-integration-time-s = 积分时间 (s)

js-kind-guided-leo-satellites-in-the-sweep = 扫描中的 LEO 卫星

js-kind-guided-loop-bandwidth-hz = 环路带宽 (Hz)

js-kind-guided-monte-carlo-runs = 蒙特卡罗运行次数

js-kind-guided-network-synchronisation-error-m = 网络同步误差 (m)

js-kind-guided-orbit-altitude-km = 轨道高度 (km)

js-kind-guided-orbit-determination-error-m = 定轨误差 (m)

js-kind-guided-orbit-inclination = 轨道倾角 (°)

js-kind-guided-pdop-threshold = PDOP 门限

js-kind-guided-peak-elevation-of-the-pass = 过境最大高度角 (°)

js-kind-guided-points-per-orbit-track = 每条轨道轨迹的点数

js-kind-guided-receiver-noise-figure-db = 接收机噪声系数 (dB)

js-kind-guided-receiver-power-when-awake-mw = 接收机唤醒时功耗 (mW)

js-kind-guided-reference-c-n0-db-hz = 参考 C/N0 (dB-Hz)

js-kind-guided-relay-altitude-km = 中继高度 (km)

js-kind-guided-relay-inclination = 中继倾角 (°)

js-kind-guided-relay-planes = 中继轨道面数

js-kind-guided-relay-range-error-m = 中继距离误差 (m)

js-kind-guided-relays-per-plane = 每个轨道面的中继数

js-kind-guided-runs-per-case = 每种情形的运行次数

js-kind-guided-satellite-altitude-km = 卫星高度 (km)

js-kind-guided-second-system-range-error-m = 第二个系统的距离误差 (m)

js-kind-guided-shared-condition = 共用条件

js-kind-guided-slant-electron-content-tecu = 斜向电子含量 (TECU)

js-kind-guided-slant-range-km = 斜距 (km)

js-kind-guided-spoofed-offset-m = 欺骗偏移量 (m)

js-kind-guided-spoofing-starts-s = 欺骗开始时间 (s)

js-kind-guided-sweep-from = 扫描起点

js-kind-guided-sweep-steps = 扫描步数

js-kind-guided-sweep-to = 扫描终点

js-kind-guided-timeline-step-s = 时间线步长 (s)

js-kind-guided-tracking-threshold-db-hz = 跟踪门限 (dB-Hz)

js-kind-guided-transmit-power-dbw = 发射功率 (dBW)

js-kind-guided-update-period-s = 更新周期 (s)

js-kind-guided-user-latitude = 用户纬度 (°)

js-kind-hint-a-band-under-this-carrier = 载噪密度比低于此值的频段已失锁

js-kind-hint-a-grid-point-is-available = 位置精度因子低于此值时，该网格点可用

js-kind-hint-a-satellite-must-be-this = 卫星须达到此高度角才计为可见

js-kind-hint-a-satellite-must-be-this-2 = 卫星须达到此高度角才会被使用

js-kind-hint-a-satellite-of-the-first = 第一个系统的卫星须达到此高度角

js-kind-hint-arc-one-message-is-fitted = 单条电文所拟合的弧段

js-kind-hint-code-tracking-loop-noise-bandwidth = 码跟踪环路噪声带宽

js-kind-hint-detail-of-the-truth-orbit = 真值轨道引力模型的精细程度

js-kind-hint-distance-from-the-first-jammer = 第一个干扰机到接收机的距离

js-kind-hint-distance-to-the-satellite-in = 频段权衡中到卫星的距离

js-kind-hint-drawn-while-acquiring-and-tracking = 在捕获和跟踪期间绘制

js-kind-hint-equivalent-isotropically-radiated-power-of = 第一个干扰机的等效全向辐射功率

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = 该频段的等效全向辐射功率

js-kind-hint-filter-runs-averaged-for-each = 每种情形取平均的滤波器运行次数（越多越慢）

js-kind-hint-first-value-of-the-swept = 被扫描参数的第一个值

js-kind-hint-height-of-the-chain-s = 该链路中卫星的高度

js-kind-hint-height-of-the-first-shell = 第一壳层各轨道的高度

js-kind-hint-height-of-the-relay-orbits = 中继轨道距天体的高度

js-kind-hint-height-of-the-satellite-whose = 被拟合电文所属卫星的高度

js-kind-hint-how-far-the-spoofer-moves = 欺骗干扰源使解算位置移动的距离

js-kind-hint-how-finely-each-orbit-is = 绘图时每条轨道的采样精细程度

js-kind-hint-how-high-the-satellite-climbs = 卫星升到的高度

js-kind-hint-how-long-the-first-phase = 第一阶段持续多久

js-kind-hint-how-long-the-receiver-integrates = 接收机为一次测距积分的时间

js-kind-hint-how-many-low-orbit-satellites = 几何扫描加入的低轨卫星数

js-kind-hint-how-many-seeded-runs-make = 组成集合的带随机种子的运行次数

js-kind-hint-how-many-values-are-run = 运行多少个取值

js-kind-hint-how-often-a-new-message = 多久发布一条新电文

js-kind-hint-how-wide-the-first-jammer = 第一个干扰机的功率扩展带宽

js-kind-hint-ionosphere-along-the-path-in = 沿路径的电离层，以总电子含量单位表示

js-kind-hint-last-value-of-the-swept = 被扫描参数的最后一个值

js-kind-hint-length-of-each-filter-run = 每次滤波器运行的时长

js-kind-hint-length-of-the-run = 运行的时长

js-kind-hint-length-of-the-timeline = 时间线的长度

js-kind-hint-occupied-bandwidth-of-the-first = 第一个参考信号的占用带宽

js-kind-hint-one-sigma-doppler-measurement-error = 多普勒测量误差（一倍标准差）

js-kind-hint-one-sigma-error-of-a = 到某个中继的距离的一倍标准差误差

js-kind-hint-one-sigma-error-of-the = 来自地球的双向距离的一倍标准差误差

js-kind-hint-orbital-planes-of-the-navigation = 导航中继的轨道面

js-kind-hint-power-of-the-first-jammer = 第一个干扰机在接收机处的功率

js-kind-hint-raises-the-noise-floor-under = 抬高每个频段下的噪声底

js-kind-hint-satellites-in-each-plane = 每个轨道面中的卫星数

js-kind-hint-sets-the-doppler-range-a = 决定冷搜索必须覆盖的多普勒范围

js-kind-hint-signal-in-space-range-error = 第一个系统的空间信号距离误差

js-kind-hint-signal-in-space-range-error-2 = 第二个系统的空间信号距离误差

js-kind-hint-signal-level-the-tracking-figures = 给出跟踪数据时所用的信号电平

js-kind-hint-spacing-of-the-latitude-and = 经纬度网格的间距

js-kind-hint-spacing-of-the-shared-mission = 共用任务时间网格的间距

js-kind-hint-the-part-of-the-range = 电文无法消除的那部分距离误差

js-kind-hint-the-value-every-member-runs = 每个成员运行时采用的值

js-kind-hint-tilt-of-that-orbit = 该轨道的倾角

js-kind-hint-tilt-of-the-first-shell = 第一壳层各轨道面的倾角

js-kind-hint-tilt-of-the-relay-planes = 中继轨道面的倾角

js-kind-hint-timing-error-between-satellites-as = 卫星之间的授时误差，以距离表示

js-kind-hint-when-the-spoofer-captures-the = 欺骗干扰源何时捕获接收机

js-kind-hint-where-the-receiver-stands = 接收机所在位置

js-kind-hint-where-the-user-stands = 用户所在位置

js-kind-label-3-d-error = 3-D 误差

js-kind-label-3-d-error-time-of = 3-D 误差，到达时间

js-kind-label-a-corrupted-frame-is-rejected = 损坏的帧被拒绝

js-kind-label-all-channels = 所有通道

js-kind-label-availability = 可用性

js-kind-label-band = 频段

js-kind-label-bodies = 天体

js-kind-label-body = 天体

js-kind-label-both = 两者

js-kind-label-case = 情形

js-kind-label-class = 类别

js-kind-label-code-jitter = 码抖动

js-kind-label-constellation = 星座

js-kind-label-doppler = 多普勒

js-kind-label-event = 事件

js-kind-label-evidence = 证据

js-kind-label-fewest-in-view = 最少可见数

js-kind-label-field = 字段

js-kind-label-first-detection-after-onset = 起始后首次检测

js-kind-label-frame-length = 帧长

js-kind-label-fused = 融合

js-kind-label-fused-cap = 融合

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS 与 LEO

js-kind-label-gnss-channels = GNSS 通道

js-kind-label-gnss-highest-in-sky = GNSS { $id }（天空中最高）

js-kind-label-gnss-only = 仅 GNSS

js-kind-label-gnss-only-cap = 仅 GNSS

js-kind-label-gnss-signal = GNSS 信号

js-kind-label-hdop = HDOP

js-kind-label-highest = 最高

js-kind-label-horizontal-error = 水平误差

js-kind-label-horizontal-error-2 = 水平误差

js-kind-label-jammer = 干扰机

js-kind-label-jump-threshold = 跳变门限

js-kind-label-largest-range-jump = 最大距离跳变

js-kind-label-largest-range-jump-against-the = 最大距离跳变与门限的对比

js-kind-label-leo = LEO

js-kind-label-leo-channels = LEO 通道

js-kind-label-leo-only = 仅 LEO

js-kind-label-light-time-from-observer = 来自 { $observer } 的光行时

js-kind-label-light-time-from-the-observer = 来自观测者的光行时

js-kind-label-light-time-one-way = 光行时，单程

js-kind-label-lowest = 最低

js-kind-label-lowest-c-n0 = 最低 C/N0

js-kind-label-mean = 均值

js-kind-label-mean-in-view = 平均可见数

js-kind-label-median-convergence = 收敛时间中位数

js-kind-label-median-pdop = PDOP 中位数

js-kind-label-member-runs = 成员运行

js-kind-label-message-switch-iod = 电文切换，星历数据期号 { $old } 至 { $new }

js-kind-label-mission-length = 任务时长

js-kind-label-model = 模型

js-kind-label-monte-carlo-runs = 蒙特卡罗运行次数

js-kind-label-noise-floor = 噪声底

js-kind-label-parameters = 参数

js-kind-label-payload = 载荷

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP，第 95 百分位

js-kind-label-peak-elevation = 最大高度角

js-kind-label-peak-tracked-c-n0 = 峰值跟踪 C/N0

js-kind-label-phase = 阶段

js-kind-label-predicted-horizontal-sigma = 预测的水平 sigma

js-kind-label-quantisation-position = 量化，位置

js-kind-label-range-error = 距离误差

js-kind-label-relays-above-the-mask = 高于截止角的中继

js-kind-label-relays-and-earth-link = 中继与地球链路

js-kind-label-relays-only = 仅中继

js-kind-label-satellite = 卫星

js-kind-label-satellites = 卫星

js-kind-label-satellites-used = 使用的卫星

js-kind-label-signal = 信号

js-kind-label-signal-chip-spacing = { $name }（{ $spacing } 码片间隔）

js-kind-label-sisre-after-quantisation = 量化后的 SISRE

js-kind-label-sisre-root-mean-square = SISRE，均方根

js-kind-label-spoofing-starts = 欺骗开始

js-kind-label-standard-deviation = 标准差

js-kind-label-sun-separation = 与太阳的角距

js-kind-label-sweep-runs = 扫描运行

js-kind-label-system = 系统

js-kind-label-time-above-the-mask = 高于截止角的时间

js-kind-label-time-error-root-mean-square = 钟差，均方根

js-kind-label-tracked-component = 被跟踪分量

js-kind-label-tracking-threshold = 跟踪门限

js-kind-label-transmit-bandwidth = 发射带宽

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = 合成样本的 Welch 估计

js-kind-label-whole-signal = 整个信号

js-kind-label-wideband-j-s-tolerated = 可容忍的宽带 J/S

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = 最差站点的可用性

js-kind-no = 否

js-kind-note-a-gap-is-an-epoch = 间断是指可见中继过少、无法定位的历元。

js-kind-note-a-helmert-transform-is-the = 赫尔默特变换是两个坐标系之间的七参数平移、旋转和尺度变换。

js-kind-note-a-low-earth-orbit-leo = 低地球轨道（LEO）卫星在数分钟内即可飞越天空，因此其 C/N0（载噪密度比）呈钟形起伏；GNSS 卫星在同样时间内几乎不动。

js-kind-note-a-receiver-independent-exchange-format = 一条 RINEX（接收机无关交换格式）4 风格的记录。LEO 记录类型是 Kshana 的扩展，文件头中已说明。

js-kind-note-a-single-pass-fixes-the = 单次过境对沿轨方向的约束远好于对横轨方向的约束。

js-kind-note-aos-is-acquisition-of-signal = AOS 为信号捕获，TCA 为最近点时刻，LOS 为信号丢失。

js-kind-note-c-n0-is-the-carrier = C/N0 是载噪密度比。低于接收机跟踪门限的频段已失锁。

js-kind-note-cells-are-the-code-and = 单元格是冷搜索必须检验的码相位和多普勒搜索格。

js-kind-note-cold-is-a-first-fix = 冷启动是没有任何先验信息的首次定位；热启动是在上次定位后不久进行的定位。

js-kind-note-dilution-of-precision-dop-scales = 精度因子（DOP）把距离误差换算为位置误差：G 为几何，P 为位置，H 为水平，V 为垂直。百分位针对每个网格点和历元计算。

js-kind-note-drawn-at-the-strongest-signal = 按本次运行中最强的信号电平绘制。间断是没有卫星可见的一段时间。

js-kind-note-each-body-carries-its-own = 每个天体带有各自的证据标签。光行时为单程，自场景中指定的观测者算起。

js-kind-note-each-row-is-one-full = 每一行是对被扫描场景的一次完整引擎运行。

js-kind-note-each-rule-is-a-switch = 每条规则是在过境中途切换到较新的电文。

js-kind-note-each-signal-is-drawn-about = 每个信号都围绕其自身中心频率绘制。间断是频谱零点。

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP 是等效全向辐射功率。

js-kind-note-every-phase-is-an-ordinary = 每个阶段都是一次普通的场景运行。哈希标识每个成员的输入及其结果文档。

js-kind-note-iod-is-the-issue-of = IOD 是星历数据期号：电文的序列号。

js-kind-note-j-s-is-the-jammer = J/S 是干信比（干扰机与信号的功率比）。跟踪比例是本次运行中该频段保持在门限之上的时间占比。

js-kind-note-p05-p50-and-p95-are = p05、p50 和 p95 分别是第 5、第 50 和第 95 百分位。ci95 是均值的 95% 置信区间。

js-kind-note-parameters-are-public-with-a = 参数为 PUBLIC（附来源）、REPRESENTATIVE 或 WORKSHOP，各预设均有说明。

js-kind-note-precise-point-positioning-ppp-converges = 当误差保持在判据以下时，精密单点定位（PPP）即收敛。NEES 是归一化估计误差平方，用于滤波器一致性检查。

js-kind-note-sisre-defined = SISRE 是空间信号距离误差：广播电文给用户距离带来的附加误差。此处指电文相对于引擎自身真值轨道的表示误差。

js-kind-note-sisre-is-the-signal-in = SISRE 是为各系统广播轨道和钟差所假定的空间信号距离误差。

js-kind-note-ssc-is-the-spectral-separation = SSC 是频谱分离系数：一个信号的功率有多少落入另一个信号的接收机内。短横线表示两者不重叠。

js-kind-note-the-chain-runs-the-signal = 该链路依次运行信号、过境、导航电文、定位和精密定位各阶段。每一行是某一阶段算出、下一阶段使用的数值。

js-kind-note-the-doppler-and-pass-geometry = 多普勒与过境几何监测器把测得的距离变化率与由轨道预测的值比较。该规则标出欺骗干扰源的起始时刻。

js-kind-note-the-engine-draws-its-spectrum = 引擎把其频谱模型绘制为某一时刻的同相与正交（IQ）样本，并由这些样本反向估计频谱。这些样本即 SigMF（信号元数据格式）导出文件。

js-kind-note-the-engine-s-own-documented = 引擎自身有文档说明的二进制帧，以 24 位循环冗余校验（CRC-24Q）结尾。

js-kind-note-the-gabor-root-mean-square = Gabor（均方根）带宽决定信号可被多么精确地测距。

js-kind-note-the-largest-jammer-to-signal = 对连续波（CW）、匹配频谱和宽带干扰机，每个信号能够维持跟踪的最大干信比（J/S）。

js-kind-note-the-shapiro-delay-is-the = 夏皮罗延迟是太阳引力使光沿路径传播所多出的光行时。

js-kind-note-the-spectrum-kind-and-the = 频谱类型和压制干扰类型以两种方式计算同一条链路；最后一列是二者之差。

js-kind-note-time-of-arrival-toa-ranging = 非地面网络（NTN）下行链路上的到达时间（TOA）测距：信号越宽，测距越精确。

js-kind-note-what-half-a-least-significant = 每个字段的半个最低有效位（LSB）在位置和钟差上带来的代价，以距离表示。

js-kind-rowhead-block = 块

js-kind-rowhead-condition = 条件

js-kind-rowhead-figure = 数据项

js-kind-rowhead-member = 成员

js-kind-rowhead-metric = 指标

js-kind-rowhead-monitor = 监测器

js-kind-rowhead-phase = 阶段

js-kind-rowhead-satellite = 卫星

js-kind-rowhead-signal = 信号

js-kind-rowhead-solution = 解

js-kind-sub-clock-offset-db = { $clock }，{ $offset } dB

js-kind-sub-doppler-only = 仅多普勒

js-kind-sub-from-to = { $from } 至 { $to }

js-kind-sub-fused = 融合

js-kind-sub-gnss-and-leo-latitude = GNSS 与 LEO，纬度 { $lat }°

js-kind-sub-gnss-only = 仅 GNSS

js-kind-sub-gnss-only-latitude = 仅 GNSS，纬度 { $lat }°

js-kind-sub-model-fit-seconds = { $model }，{ $fit } s 拟合

js-kind-threshold-4-needed-for-a-fix = 定位需要 4 颗

js-kind-threshold-convergence-criterion = 收敛判据

js-kind-threshold-elevation-mask = 高度角截止

js-kind-threshold-gnss-median = GNSS 中位数

js-kind-threshold-tracking-threshold = 跟踪门限

js-kind-title-acquisition = 捕获

js-kind-title-against-a-simulated-campaign = 对照模拟测评活动

js-kind-title-assumptions = 假设

js-kind-title-band-trade-at-equal-transmit = 相同发射功率下的频段权衡

js-kind-title-bands = 频段

js-kind-title-beside-the-published-figures = 与已发表数据并列

js-kind-title-beside-the-published-speed-up = 与已发表的加速效果并列

js-kind-title-bodies = 天体

js-kind-title-body = 天体

js-kind-title-by-latitude = 按纬度

js-kind-title-c-n0-by-band-over = 运行期间各频段的 C/N0

js-kind-title-c-n0-over-the-pass = 过境期间的 C/N0

js-kind-title-cases = 情形

js-kind-title-central-body = 中心天体

js-kind-title-closed-form-doppler-against-finite = 闭式多普勒与有限差分的对比

js-kind-title-code-tracking-jitter = 码跟踪抖动

js-kind-title-code-tracking-jitter-against-c = 码跟踪抖动与 C/N0 的关系

js-kind-title-combined-over-the-members = 对各成员合并

js-kind-title-compatibility-with-gnss-signals = 与 GNSS 信号的兼容性

js-kind-title-constellations = 星座

js-kind-title-continuity-across-message-switches = 电文切换前后的连续性

js-kind-title-cross-check-against-the-jamming = 与压制干扰类型的交叉核对

js-kind-title-datum-accuracy = 基准精度

js-kind-title-dilution-of-precision-over-the = 整个网格上的精度因子

js-kind-title-doppler = 多普勒

js-kind-title-doppler-envelopes = 多普勒包络

js-kind-title-doppler-only-fix = 仅多普勒定位

js-kind-title-doppler-over-the-pass = 过境期间的多普勒

js-kind-title-doppler-positioning-from-one-pass = 单次过境的多普勒定位

js-kind-title-earth-link = 地球链路

js-kind-title-elevation = 高度角

js-kind-title-encoded-frame = 编码帧

js-kind-title-epoch = 历元

js-kind-title-epoch-and-frame = 历元与坐标系

js-kind-title-events = 事件

js-kind-title-every-node-of-the-sweep = 扫描的每个节点

js-kind-title-field-table = 字段表

js-kind-title-figures-of-merit = 性能指标

js-kind-title-filter-noise = 滤波器噪声

js-kind-title-fit-interval-trade = 拟合区间权衡

js-kind-title-fix-quality-against-observation-window = 定位质量与观测窗口的关系

js-kind-title-frame-checks = 帧检查

js-kind-title-frame-hexadecimal = 帧，十六进制

js-kind-title-geometry-against-latitude = 几何与纬度的关系

js-kind-title-geometry-as-leo-satellites-are = 加入 LEO 卫星后的几何

js-kind-title-geometry-position-dilution-of-precision = 几何：位置精度因子

js-kind-title-global-coverage = 全球覆盖

js-kind-title-gnss-leo-and-fused = GNSS、LEO 与融合

js-kind-title-gnss-reference = GNSS 参考

js-kind-title-hand-offs-between-phases = 阶段之间的交接

js-kind-title-helmert-fit = 赫尔默特拟合

js-kind-title-helmert-transform-parameters = 赫尔默特变换参数

js-kind-title-inputs = 输入

js-kind-title-ionosphere-free-band-pairs = 无电离层频段组合

js-kind-title-jammer-tolerance = 干扰机容限

js-kind-title-jammers = 干扰机

js-kind-title-joint-fix = 联合定位

js-kind-title-leo-against-gnss = LEO 与 GNSS 对比

js-kind-title-limitations = 局限

js-kind-title-links = 链路

js-kind-title-member-runs = 成员运行

js-kind-title-members-under-the-shared-conditions = 共用条件下的成员

js-kind-title-message = 电文

js-kind-title-message-models-compared = 电文模型对比

js-kind-title-message-switches = 电文切换

js-kind-title-metric-against-axis = { $metric } 与 { $axis } 的关系

js-kind-title-metric-distribution-over-runs = { $metric }：各次运行上的分布

js-kind-title-mid-pass-update = 过境中途更新

js-kind-title-modelled = 模型计算

js-kind-title-monte-carlo = 蒙特卡罗

js-kind-title-navigation-message-stage = 导航电文阶段

js-kind-title-not-modelled = 未建模

js-kind-title-notes = 说明

js-kind-title-notes-on-the-spoofing-model = 欺骗干扰模型说明

js-kind-title-observation-windows = 观测窗口

js-kind-title-one-pass-alone = 仅单次过境

js-kind-title-orbit = 轨道

js-kind-title-over-the-message-sequence = 整个电文序列

js-kind-title-pass = 过境

js-kind-title-pass-c-n0-of-the = 过境：整个信号与被跟踪分量的 C/N0

js-kind-title-pass-code-tracking-jitter = 过境：码跟踪抖动

js-kind-title-pass-doppler = 过境：多普勒

js-kind-title-pass-stage = 过境阶段

js-kind-title-passes = 过境

js-kind-title-phases = 阶段

js-kind-title-position-error-gnss-leo-and = 位置误差：GNSS、LEO 与融合定位

js-kind-title-position-uncertainty-relays-alone-and = 位置不确定度：仅中继，以及加入地球链路

js-kind-title-positioning-by-signal-bandwidth = 按信号带宽的定位

js-kind-title-positioning-gnss-alone-against-the = 定位：仅 GNSS 与融合定位对比

js-kind-title-power-spectral-density = 功率谱密度

js-kind-title-power-spectral-density-of-each = 各信号的功率谱密度

js-kind-title-precise-point-positioning = 精密单点定位

js-kind-title-published-comparison = 已发表的对比

js-kind-title-quantisation-budget = 量化预算

js-kind-title-range-residuals = 距离残差

js-kind-title-ranging-stations = 测距站

js-kind-title-reading-the-trade = 解读权衡

js-kind-title-realised-position-error = 实际位置误差

js-kind-title-receiver = 接收机

js-kind-title-receiver-power-budget = 接收机功耗预算

js-kind-title-reflector-information = 反射器信息

js-kind-title-relay-constellation = 中继星座

js-kind-title-relays-in-view = 可见中继

js-kind-title-reproducibility = 可复现性

js-kind-title-retroreflectors = 后向反射器

js-kind-title-rinex-style-record = RINEX 风格记录

js-kind-title-round-trips = 往返转换

js-kind-title-run = 运行

js-kind-title-satellites-in-view-against-latitude = 可见卫星数与纬度的关系

js-kind-title-sensitivity-to-a-line-of = 对视线倾斜的敏感性

js-kind-title-shared-conditions = 共用条件

js-kind-title-signal-components = 信号分量

js-kind-title-signal-stage = 信号阶段

js-kind-title-signals = 信号

js-kind-title-sisre-against-fit-interval = SISRE 与拟合区间的关系

js-kind-title-sisre-against-update-period = SISRE 与更新周期的关系

js-kind-title-sisre-weights = SISRE 权重

js-kind-title-snapshot = 快照

js-kind-title-snapshot-against-the-model = 快照与模型对比

js-kind-title-snapshot-spectrum-welch-estimate-against = 快照频谱：Welch 估计与模型对比

js-kind-title-sources = 来源

js-kind-title-spoofer-and-monitor-settings = 欺骗干扰源与监测器设置

js-kind-title-spoofing-monitor-probability-of-detection = 欺骗干扰监测器：检测概率

js-kind-title-statistics-over-the-runs = 各次运行的统计

js-kind-title-sweep = 扫描

js-kind-title-systems = 系统

js-kind-title-systems-in-the-fix = 定位解中的系统

js-kind-title-the-archived-campaign = 已归档的测评活动

js-kind-title-time-error = 钟差

js-kind-title-time-error-by-receiver-clock = 按接收机时钟划分的钟差

js-kind-title-time-scale = 时间尺度

js-kind-title-time-to-first-fix-and = 首次定位时间与每次定位的能耗

js-kind-title-time-transfer-by-clock-and = 按时钟和信号电平的时间传递

js-kind-title-trade-conditions = 权衡条件

js-kind-title-update-period-trade = 更新周期权衡

js-kind-title-user = 用户

js-kind-title-user-range-error-through-the = 过境期间的用户距离误差

js-kind-title-validated = 已验证

js-kind-title-what-each-stage-hands-to = 每个阶段传给下一阶段的内容

js-kind-title-what-this-run-is-and = 本次运行是什么，不是什么

js-kind-title-when-each-monitor-detects = 各监测器何时检测到

js-kind-title-work-done = 完成的工作量

js-kind-yes = 是

js-ledger-rows =
    { $n ->
       *[other] { $n } 条台账（ledger）记录
    }

js-lib-abbr-apv = 带垂直引导的进近

js-lib-abbr-araim = 先进的接收机自主完好性监测

js-lib-abbr-auc = 曲线下面积

js-lib-abbr-c-n0 = 载噪密度比

js-lib-abbr-ccsds = 空间数据系统咨询委员会

js-lib-abbr-cli = 命令行界面

js-lib-abbr-csac = 芯片级原子钟

js-lib-abbr-cw = 连续波

js-lib-abbr-doi = 数字对象标识符

js-lib-abbr-dop = 精度因子

js-lib-abbr-eo = 地球观测

js-lib-abbr-gnss = 全球导航卫星系统

js-lib-abbr-gps = 全球定位系统

js-lib-abbr-hal = 水平告警限值

js-lib-abbr-hpl = 水平保护级

js-lib-abbr-imu = 惯性测量单元

js-lib-abbr-ins = 惯性导航系统

js-lib-abbr-iot = 物联网

js-lib-abbr-itu-t = 国际电信联盟电信标准化部门

js-lib-abbr-j-s = 干信比

js-lib-abbr-leo = 低地球轨道

js-lib-abbr-llr = 月球激光测距

js-lib-abbr-meo = 中地球轨道

js-lib-abbr-mtie = 最大时间间隔误差

js-lib-abbr-ntn = 非地面网络

js-lib-abbr-ocxo = 恒温晶体振荡器

js-lib-abbr-oem = 轨道星历电文

js-lib-abbr-omm = 轨道平均根数电文

js-lib-abbr-pdop = 位置精度因子

js-lib-abbr-pnt = 定位、导航与授时

js-lib-abbr-ppp = 精密单点定位

js-lib-abbr-raim = 接收机自主完好性监测

js-lib-abbr-rf = 射频

js-lib-abbr-rinex = 接收机无关交换格式

js-lib-abbr-roc = 接收机工作特性

js-lib-abbr-sbas = 星基增强系统

js-lib-abbr-sgp4 = 简化常规摄动 4，一种轨道外推模型

js-lib-abbr-sisre = 空间信号距离误差

js-lib-abbr-slam = 同步定位与地图构建

js-lib-abbr-spp = 单点定位

js-lib-abbr-tdev = 时间偏差

js-lib-abbr-tle = 两行根数

js-lib-abbr-toml = 场景文件格式

js-lib-abbr-trn = 地形参考导航

js-lib-abbr-uhf = 特高频

js-lib-abbr-ukf = 无迹卡尔曼滤波

js-lib-abbr-utc = 协调世界时

js-lib-abbr-val = 垂直告警限值

js-lib-abbr-vlbi = 甚长基线干涉测量

js-lib-abbr-vpl = 垂直保护级

js-lib-abbr-wg = 工作组

js-lib-areas-ground-track = 星下点轨迹

js-lib-areas-holdover = 守时（holdover）

js-lib-compare-availability = 可用性

js-lib-compare-holdover = 守时（holdover）

js-lib-compare-timing-p95 = 授时 p95

js-lib-compare-timing-rms = 授时 RMS

js-lib-counts-explorer-tally = { $total } 项能力中有 { $validated } 项已对照外部参考基准验证 · { $modelled } 项为模型计算 · { $partner } 项由合作方负责——此处显示为 { $domains } 个领域中的 { $cards } 张能力卡片、{ $evidence } 条证据主张

js-lib-counts-validated-tally = { $total } 项能力中有 { $validated } 项已对照外部参考基准验证——此处显示为 { $cards } 张能力卡片和 { $evidence } 条证据主张

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = 引擎文件返回 HTTP { $status }

js-lib-engine-page-not-running = 引擎未在此处运行

js-lib-engine-worker-crashed = 引擎工作线程已崩溃

js-lib-evidence-aria = 证据：{ $tier }，{ $count }

js-lib-evidence-ledger-rows =
    { $n ->
       *[other] { $n } 条台账（ledger）记录
    }

js-lib-evidence-rows-behind = 此结果背后的台账（ledger）记录

js-lib-geometry-url-bad-mc = 蒙特卡罗样本数不是 { $choices } 之一；改用 { $default }。

js-lib-geometry-url-bad-number = "{ $key }" 不是 { $min } 到 { $max } 之间的数；改用默认值。

js-lib-geometry-url-bad-site = 站点不是范围内的 纬度,经度[,高度]；改用默认站点。

js-lib-geometry-url-bad-sky = 天际线不是预设、360 格的表或范围内的峡谷；改用开阔地平线。

js-lib-geometry-url-bad-sys = 星座列表不是 G、E、C 以及至多一个此视图可识别的 L:<LEO preset>；改用默认组合。

js-lib-geometry-url-own-tle = 发送者使用了自己的轨道根数（TLE），链接不携带这些数据；改为显示预设。

js-lib-geometry-url-repeated = "{ $key }" 出现了多次；采用第一个值。

js-lib-geometry-url-too-long = 地址长度超过 { $max } 个字符，因此其中没有任何设置被读取。

js-lib-geometry-url-unreadable = 无法读取该地址。

js-lib-guided-duration-s-hint = 将星下点轨迹外推多长时间

js-lib-guided-duration-s-label = 持续时间 (s)

js-lib-guided-dut1-s-hint = 地球自转偏差；使星下点轨迹向东或向西移动

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = 卫星须达到此高度角才计为可见

js-lib-guided-mask-deg-label = 高度角截止 (°)

js-lib-guided-seed-hint = 同一物理过程的另一次噪声抽样

js-lib-guided-seed-label = 随机种子

js-lib-guided-sigma-uere-m-hint = 位置汇总所用的 1-σ 用户等效距离误差

js-lib-guided-sigma-uere-m-label = 距离误差 σ (m)

js-lib-guided-station-lat-deg-hint = 地面站纬度，决定过境几何

js-lib-guided-station-lat-deg-label = 地面站纬度 (°)

js-lib-guided-station-lon-deg-hint = 地面站经度

js-lib-guided-station-lon-deg-label = 地面站经度 (°)

js-lib-guided-step-s-hint = 星下点轨迹的采样间隔

js-lib-guided-step-s-label = 时间步长 (s)

js-lib-guided-threshold-ns-hint = 规格内预算；误差保持在其以下时为“可用”

js-lib-guided-threshold-ns-label = 规格门限 (ns)

js-lib-guided-time-duration-s-hint = 总运行时长

js-lib-guided-time-duration-s-label = 持续时间 (s)

js-lib-guided-time-step-s-hint = 积分与采样间隔

js-lib-guided-time-step-s-label = 时间步长 (s)

js-lib-guided-user-altitude-km-hint = 用户航天器的轨道高度

js-lib-guided-user-altitude-km-label = 用户高度 (km)

js-lib-guided-user-inclination-deg-hint = 用户轨道的倾角

js-lib-guided-user-inclination-deg-label = 用户倾角 (°)

js-lib-imufit-card-accel-slope = 加速度计阿伦斜率，早期（白噪声约为 -0.5）

js-lib-imufit-card-bias = 加速度计偏置，均值 (m/s²)

js-lib-imufit-card-bias-instability = 加速度计偏置不稳定性 (m/s²)，曲线无底部平台时为 0

js-lib-imufit-card-gyro-bias = 陀螺偏置，均值 (rad/s)

js-lib-imufit-card-gyro-slope = 陀螺阿伦斜率，早期（白噪声约为 -0.5）

js-lib-imufit-card-note-n = 说明 { $n }

js-lib-imufit-card-q-arw = 陀螺角度随机游走，q_arw (rad²/s)

js-lib-imufit-card-q-va = 加速度计速度随机游走，q_va (m²/s³)

js-lib-imufit-card-sample-rate = 采样率

js-lib-imufit-card-samples = 样本数

js-lib-imufit-card-span = 时间跨度

js-lib-jammertest-card-clean-epochs = 无干扰历元

js-lib-jammertest-card-clean-hours = 无干扰小时数

js-lib-jammertest-card-detected = 在容差内检测到

js-lib-jammertest-card-detection-rate = 检测率（任一告警）

js-lib-jammertest-card-evaluable = 可评估

js-lib-jammertest-card-fa-epochs = 虚警历元

js-lib-jammertest-card-fa-per-hour = 每小时虚警次数

js-lib-jammertest-card-fa-runs = 虚警次数

js-lib-jammertest-card-in-tol-rate = 在容差内检测到的比率

js-lib-jammertest-card-late = 延迟

js-lib-jammertest-card-median-latency = 检测延迟中位数

js-lib-jammertest-card-median-recover = 恢复时间中位数

js-lib-jammertest-card-missed = 漏检

js-lib-jammertest-card-na = 不适用

js-lib-jammertest-card-not-assessable = 此日志中没有可评估的测试，因此无法给出检测率或延迟。这是一个结果，不是页面的故障：此处没有任何内容构成通过。

js-lib-jammertest-card-not-json = { $name }：不是 JSON（{ $reason }）。

js-lib-jammertest-card-not-scorecard = { $name }：不是 jammertest 计分卡（需要 tests[] 和 summary）。

js-lib-jammertest-card-tests = 计划片段中的测试

js-lib-jammertest-card-too-large = { $name }：大于 8 MiB；本页面读取不超过该大小的计分卡。

js-lib-kpi-available-everywhere = 所有位置、所有历元均可用

js-lib-kpi-available-everywhere-pdop = 所有位置、所有历元均可用（PDOP，即位置精度因子，低于 { $thr }）

js-lib-kpi-drops-under = 降到 { $thr } dB-Hz 跟踪门限以下：失锁

js-lib-kpi-end-of-mission = 任务结束时

js-lib-kpi-figure-tiers = 数据项层级：{ $parts }。

js-lib-kpi-n-modelled = { $n } 项为模型计算

js-lib-kpi-n-partner = { $n } 项由合作方负责

js-lib-kpi-n-validated = { $n } 项已验证

js-lib-kpi-no-change = 无变化

js-lib-kpi-no-fix = { $pct } % 的时间或位置无法定位

js-lib-kpi-no-fix-pdop = { $pct } % 的时间或位置在 PDOP 低于 { $thr } 时无法定位

js-lib-kpi-over-jump = 超过 { $thr } m 跳变门限

js-lib-kpi-over-pdop = 超过 PDOP 门限 { $thr }

js-lib-kpi-stays-above = 保持在 { $thr } dB-Hz 跟踪门限以上

js-lib-kpi-under-jump = 低于 { $thr } m 跳变门限

js-lib-kpi-under-pdop = 低于 PDOP 门限 { $thr }

js-lib-orbit3d-apogee = 远地点

js-lib-orbit3d-perigee = 近地点

js-lib-orbit3d-prov-scenario = 场景 { $hash }

js-lib-orbit3d-title = 轨道（ECI，正交投影）

js-lib-orbit3d-view-angles = 方位角 { $az }° · 高度角 { $el }°

js-lib-overlay-meta-clock-bias-m = 钟差偏置

js-lib-overlay-meta-converged-pos-3sigma-m = 位置 3σ

js-lib-overlay-meta-converged-pos-rms-m = 位置 RMS

js-lib-overlay-meta-converged-pos-sigma-m = 位置 σ

js-lib-overlay-meta-final-clock-freq-sigma = 钟频 σ

js-lib-overlay-meta-mean-relays-in-view = 可见中继

js-lib-overlay-meta-pos-p95-m = 位置 p95

js-lib-overlay-meta-pos-rms-m = 位置 RMS

js-lib-overlay-meta-postfit-rms-m = 拟合后 RMS

js-lib-overlay-prov-scenario = 场景 { $hash }

js-lib-overlay-subtitle = |误差| (ns) 与时间的关系 — { $n } 次运行

js-lib-overlay-time-s = 时间 (s)

js-lib-overlay-title = 叠加：中断期间的授时误差

js-lib-packs-cannot-unpack = 此浏览器无法解包已记录的文件

js-lib-replay-demos-below-130 = 仅保留方位角低于 130° 的卫星（已说明）

js-lib-replay-demos-coastal-drag-off = 沿岸拖拽偏离

js-lib-replay-demos-combined-event = 组合事件

js-lib-replay-demos-drag-off-stated = 位置拖拽偏离（演示中已说明）

js-lib-replay-demos-ferry-drag-off = 渡轮航段，位置拖拽偏离

js-lib-replay-demos-ferry-drag-off-description = 一份虚构的渡轮日志，塔林至赫尔辛基，1 Hz。从 1500 s 起，位置拖拽偏离将报告的位置拉离真实位置，而接收机仍持续报告有效定位。

js-lib-replay-demos-fjord = 峡湾自然劣化

js-lib-replay-demos-masked-sky = 渡轮航段，半个天空被遮挡

js-lib-replay-demos-masked-sky-description = 同一份渡轮日志：从 600 s 起西半边天空的信号被静默，从 900 s 到 1200 s 天空范围进一步变窄，从 1500 s 起出现拖拽偏离：一次运行中，天空、信号和位置依次失效。

js-lib-replay-demos-open-sea-jamming = 开阔海域压制干扰（jamming）

js-lib-replay-demos-port-approach = 进港授时欺骗

js-lib-replay-demos-source-training = 合成场景 { $id }：引擎的 nmea_training 数据流和教员日志，由其接收机信任度评分。

js-lib-replay-demos-source-trust = 合成日志 { $id }：虚构的 NMEA，由引擎的接收机信任度评分。

js-lib-replay-demos-west-masked = 西半边天空被遮挡（已说明）

js-lib-replay-demos-west-masked-again = 西半边再次被遮挡（已说明）

js-lib-report-charts = 图表

js-lib-report-eyebrow = 精确时刻

js-lib-report-figures-of-merit = 性能指标

js-lib-report-footer = Kshana { $version } · 场景 { $hash } · 生成于 { $iso }。可由场景 + 随机种子 + 引擎版本复现。在本地运行；不上传任何内容。

js-lib-report-not-applicable = 不适用（未配置攻击）

js-lib-report-scenario-definition = 场景定义（TOML）

js-lib-report-th-clock = 时钟

js-lib-report-th-metric = 指标

js-lib-report-th-validation = 验证

js-lib-report-th-value = 数值

js-lib-report-tier-note = 每个性能指标都标记为 { $validated }（已对照外部参考基准核对）或 { $modelled }（由第一性原理得出，经内部测试）——取自验证矩阵。

js-lib-report-title = Kshana — 场景报告

js-lib-skydraw-azimuth-range = 方位角 { $from } 至 { $to } 度

js-lib-skydraw-describe = 列出 { $listed } 颗卫星，{ $heard } 颗有信号

js-lib-skydraw-describe-mean = 列出 { $listed } 颗卫星，{ $heard } 颗有信号，平均 { $snr } dB-Hz

js-lib-skydraw-east = 东

js-lib-skydraw-no-signal-from = { $sectors } 无信号

js-lib-skydraw-none-listed = 此时日志中没有列出卫星。

js-lib-skydraw-north = 北

js-lib-skydraw-sat-heard = { $sys } { $prn }：高度角 { $el }，方位角 { $az }，信号 { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }：高度角 { $el }，方位角 { $az }，已列出，无信号

js-lib-skydraw-south = 南

js-lib-skydraw-unheard-sector = 方位角 { $from } 至 { $to } 度之间列出了卫星，但均无信号

js-lib-skydraw-west = 西

js-lib-skyline-edit-describe = 天际线遮挡 360 度方位角中的 { $blocked } 度；最高 { $el }°，位于方位角 { $az }°。

js-lib-skyline-edit-open = 开阔地平线：无天际线。

js-lib-stages-all-planets = 所有行星

js-lib-stages-au-from-sun = 距太阳 { $d } au

js-lib-stages-band-carrier = { $name } 载波，{ $mhz } MHz

js-lib-stages-bin-title = { $from } 至 { $to }{ $unit }：{ $count } 次运行

js-lib-stages-body-and-moons = { $name } 及其卫星

js-lib-stages-cell-title = 纬度 { $lat }°，经度 { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = 导航电文

js-lib-stages-chain-pass = 过境与链路

js-lib-stages-chain-ppp = 精密单点定位

js-lib-stages-chain-pvt = 融合定位

js-lib-stages-chain-signal = 信号设计

js-lib-stages-coverage-aria = { $body }上的 { $field }，按纬度和经度

js-lib-stages-feature-n = 要素 { $n }

js-lib-stages-flag = 标记

js-lib-stages-frequency-mhz = 频率 (MHz)

js-lib-stages-from-to = { $from } 至 { $to }

js-lib-stages-geojson-aria = 绘制在地图上的 GeoJSON 导出

js-lib-stages-histogram = 直方图

js-lib-stages-inner-planets = 内行星

js-lib-stages-km-from-centre = 距 { $centre } { $d } km

js-lib-stages-linear-scale = 线性比例

js-lib-stages-link-light-time = { $from } 至 { $to }：单程光行时 { $time } s

js-lib-stages-longitude-axis = 经度 · 纬度沿侧边向上

js-lib-stages-mission-time = 任务时间 (s)

js-lib-stages-noise-floor = 噪声底

js-lib-stages-orrery-note = { $scale } · 坐标系 x-y 平面，自其北极向下看

js-lib-stages-panel-n = 面板 { $n }

js-lib-stages-plan-view-aria = { $centre } 及其周围天体的平面图，{ $scale }

js-lib-stages-psd-at-t = t = { $t } s 时的功率谱密度

js-lib-stages-psd-axis = 功率谱密度 (dBW/Hz)

js-lib-stages-runs = 次运行

js-lib-stages-sat-title = { $constellation } { $id } · 纬度 { $lat }°，经度 { $lon }°

js-lib-stages-satellites = 卫星

js-lib-stages-spectrum-at-t = t = { $t } s 时的频谱

js-lib-stages-sqrt-scale = 平方根距离比例

js-lib-stages-the-body = 该天体

js-lib-stages-time-s = 时间 (s)

js-lib-stages-unit-alarm = 告警

js-lib-stages-unit-cn0 = 载噪密度比

js-lib-stages-unit-position = 位置与保护

js-lib-stages-unit-satellites = 卫星

js-lib-stages-unit-time-error = 钟差

js-lib-stages-waterfall-aria = 功率谱密度瀑布图：横向为频率，纵向为时间

js-lib-stages-whole-band = 整个频段

js-lib-sweep-clock-availability = { $who }可用性

js-lib-sweep-clock-holdover = { $who }守时（holdover）(s)

js-lib-sweep-clock-timing-p95 = { $who }授时 p95 (ns)

js-lib-sweep-clock-timing-rms = { $who }授时 RMS (ns)

js-lib-sweep-max-altitude = 最大高度 (km)

js-lib-sweep-max-elevation = 最大高度角 (°)

js-lib-sweep-max-speed = 最大速度 (m/s)

js-lib-sweep-min-altitude = 最小高度 (km)

js-lib-sweep-peak-doppler = 峰值多普勒 (Hz)

js-lib-sweep-prov-scenario = 场景 { $hash }

js-lib-sweep-y-vs-x = { $y } 与 { $x } 的关系

js-lib-tabs-3d-orbit = 3D 轨道

js-lib-tabs-figures-of-merit = 性能指标

js-lib-tabs-stability = 稳定度

js-lib-tabs-sweep = 扫描

js-lib-tabs-time-series = 时间序列

js-lib-tour-ashforde-body = 感谢探索 Kshana。我们为不容有失的任务构建开放、可复现、以证据为先的工程——如实说明哪些已验证、哪些由模型计算。有问题、合作或研究意向？请联系 contact@ashforde.org。

js-lib-tour-ashforde-title = 来自 Ashforde® OÜ

js-lib-tour-capabilities-body = 选择一个领域标签——轨道、授时、惯性、GNSS、韧性、月球、AI/ML、互操作——即可查看其能力，每项都标明已验证或模型计算，已有算例的场景带有 ▸ 运行按钮。在任一领域中打开“证据与来源”可追溯其依据，或切换“仅已验证”，只显示已对照外部参考基准核对的内容。

js-lib-tour-capabilities-title = 逐个领域探索引擎

js-lib-tour-cite-body = Kshana 的构建目标是可被引用——带 DOI 的可引用软件发布版本，以及关于射频损伤乐观差距和条件性授时保护级的同行评议风格论文。可直接从这里复制引用。

js-lib-tour-cite-title = 出版物与引用方式

js-lib-tour-download-report-body = “扫描”标签在一个范围内改变一个参数；“固定以对比”把两次或更多次运行并排叠加，并显示它们之间的 Δ（适用于各种场景类型——时钟、火星 PNT、定位……）；此按钮则把本次运行下载为自包含的离线 HTML 报告。

js-lib-tour-download-report-title = 扫描、对比与导出

js-lib-tour-guided-body = 引导式调节项会随场景变化——随机种子、规格门限、持续时间、高度角截止、轨道高度——每次更改都会立即重新运行。

js-lib-tour-guided-title = 调节滑块

js-lib-tour-mcp-body = MCP 服务器让 AI 助手运行经过验证的引擎，而不是凭空猜测；JetBrains 插件可通过右键运行场景。

js-lib-tour-mcp-title = 通过 AI 智能体或 IDE 使用

js-lib-tour-playground-body = 从下拉菜单中选择一个场景——或点击上方任一能力的 ▸ 运行——引擎便会以 WebAssembly 的形式在本机上运行。不会上传任何内容。

js-lib-tour-playground-title = 在浏览器中运行

js-lib-tour-run-body = 运行当前场景。打开“高级”可编辑 TOML 并更改任何内容；“复制分享链接”可让他人复现这次完全相同的运行。

js-lib-tour-run-title = 运行

js-lib-tour-tabs-body = 在性能指标、时间序列图、时钟稳定度（阿伦偏差）之间切换——对轨道运行，还可使用交互式 3-D 轨道视图。

js-lib-tour-tabs-title = 查看结果

js-lib-tour-validation-body = 同一个浏览器同时也是证据台账（ledger）：每个领域都带有“证据与来源”抽屉——数据项、其所对照核对的外部参考基准，以及每项主张如实标注的已验证 / 模型计算状态。“仅已验证”会筛选出经数据集核对的行。

js-lib-tour-validation-title = 凭证据，而非形容词

js-lib-views-3-sigma-bound = 3 倍标准差界

js-lib-views-3d-position-error = 3-D 位置误差

js-lib-views-a-parameter = 一个参数

js-lib-views-band-runs = { $runs } 次蒙特卡罗运行中的钟差带

js-lib-views-band-the-runs = 蒙特卡罗各次运行中的钟差带

js-lib-views-below-tracking = 低于跟踪门限

js-lib-views-chart = 图表

js-lib-views-classical = 经典

js-lib-views-epoch = 历元

js-lib-views-four-needed = 定位需要 4 颗

js-lib-views-free-inertial = 自由惯性

js-lib-views-gnss-denied = GNSS 拒止

js-lib-views-ground-track = 星下点轨迹

js-lib-views-heatmap-effective = 按卫星和时间划分的有效载噪密度比

js-lib-views-heatmap-nominal = 按卫星和时间划分的标称（无干扰机）载噪密度比

js-lib-views-horizontal-alert-limit = 水平告警限值

js-lib-views-horizontal-hpl = 水平（HPL）

js-lib-views-id-bound = { $id } 界

js-lib-views-id-median = { $id } 中位数

js-lib-views-id-offset = { $id } 偏移

js-lib-views-id-p95 = { $id } p95

js-lib-views-map-matched = 地图匹配

js-lib-views-map-matched-title = 地图匹配与自由惯性位置误差对比

js-lib-views-metric = 指标

js-lib-views-oscillator = 振荡器

js-lib-views-oscillator-source = 振荡器（{ $source }）

js-lib-views-position-error-axis = 位置误差（{ $unit }）

js-lib-views-position-error-m = 位置误差 (m)

js-lib-views-position-error-run = 运行期间的位置误差

js-lib-views-position-m = 位置 (m)

js-lib-views-predicted-time-error = 自上次定位以来的预测钟差

js-lib-views-protection-level-m = 保护级 (m)

js-lib-views-protection-levels = 保护级与告警限值的对比

js-lib-views-quantum = 量化步长

js-lib-views-relay-error-bound = 中继导航位置误差及其 3 倍标准差界

js-lib-views-satellites = 卫星

js-lib-views-satellites-tracking = 可见且仍在跟踪的卫星

js-lib-views-shaded-gnss-denied = 阴影：GNSS 拒止

js-lib-views-slot-guard = 时隙保护

js-lib-views-spoofed-offset = 欺骗时间偏移与检测界的对比

js-lib-views-sweep-of = { $parameter } 的扫描：{ $metric }

js-lib-views-sync-error-axis = 同步误差（{ $unit }）

js-lib-views-sync-error-run = 运行期间的同步误差

js-lib-views-threshold = 门限

js-lib-views-time-error-ns = 钟差 (ns)

js-lib-views-time-ns = 时间 (ns)

js-lib-views-time-s = 时间 (s)

js-lib-views-time-since-fix = 自上次定位起的时间 (s)

js-lib-views-timing-error-axis = 授时误差（{ $unit }）

js-lib-views-timing-error-run = 运行期间的授时误差

js-lib-views-tracking = 跟踪

js-lib-views-value = 数值

js-lib-views-vertical-vpl = 垂直（VPL）

js-lib-views-visible = 可见

js-lib-views-word-enbw = 等效噪声带宽

js-lib-views-word-nfft = FFT 长度

js-lib-views-word-stec = 斜向 TEC

js-lib-views-word-toa = 到达时间

js-lib-views-word-ttff = 首次定位时间

js-lib-views-word-tx = 发射

js-lib-views-word-zwd = 天顶湿延迟

js-lunar-address-outside-range = { $label }："{ $raw }" 超出 { $min } 至 { $max } 的范围；改用文件中的值。

js-lunar-address-too-long = 地址过长；显示默认值。

js-lunar-address-unknown-source = 地址中的来源未知；显示记录。

js-lunar-alert-limit = 告警限值 { $value }（示意）

js-lunar-alert-not-stated = 未给出告警限值

js-lunar-bearing-east = 东 90°

js-lunar-bearing-west = 西 90°

js-lunar-cell-title = { $lat }°，{ $lon }°：校正后 { $corrected }，可用性 { $availability }，覆盖 { $coverage }

js-lunar-copy-address = 请从地址栏复制地址。

js-lunar-counts = { $sats } 颗卫星，{ $points } 个网格点，{ $epochs } 个历元，每个历元 { $trials } 次蒙特卡罗试验。标签：{ $label }。

js-lunar-engine-no-start = 引擎无法在此浏览器中启动（{ $reason }）。请改为打开结果文件。

js-lunar-engine-unknown-kind = 此引擎（{ $version }）不认识 { $kind } 类型；它需要引擎 0.36。

js-lunar-fig-availability-region = 区域内的可用性

js-lunar-fig-corrected-3d = 校正后误差，{ $n } %，3-D

js-lunar-fig-coverage = 覆盖

js-lunar-fig-epochs-within = 在 { $value } 以内的历元

js-lunar-fig-horizontal-vertical = 水平 { $h }，垂直 { $v }

js-lunar-fig-hpl-below-alert = HPL 低于告警限值

js-lunar-fig-hpl-vpl = HPL、VPL 至多

js-lunar-fig-improvement = 改善倍数

js-lunar-fig-lowest-point = 某一点的最低值

js-lunar-fig-points-always-available = 每个历元都可用的点

js-lunar-fig-uncorrected-3d = 未校正误差，{ $n } %，3-D

js-lunar-fig-worst-point = 最差点

js-lunar-file-not-json = 此文件不是 JSON。

js-lunar-file-not-object = 此文件不是 JSON 对象。

js-lunar-file-too-large = { $name }：大于 32 MiB；本页面读取不超过该大小的结果文件。

js-lunar-file-value = 文件：{ $value }

js-lunar-full-of-total = { $total } 中的 { $full }

js-lunar-give-value = { $label }：请给出 { $min } 至 { $max } 之间的值。

js-lunar-give-whole-value = { $label }：请给出 { $min } 至 { $max } 之间的值（整数）。

js-lunar-honesty-affiliation = 与任何机构无隶属关系，也未获任何机构认可。

js-lunar-honesty-assumptions = 基于所述公开假设，并不说明任何真实系统的性能。

js-lunar-in-grid-spacing = 网格环间距，度

js-lunar-in-latency = 校正延迟，秒

js-lunar-in-seed = 随机种子

js-lunar-in-station-lat = 站点纬度，度

js-lunar-in-station-lon = 站点经度，度

js-lunar-in-survey-error = 站点测量误差（1-sigma），米

js-lunar-in-threshold = 精度门限，米

js-lunar-in-time-step = 时间步长，秒

js-lunar-in-trials = 每个历元的蒙特卡罗试验次数

js-lunar-input-out-of-range = { $label }超出范围。

js-lunar-json-field-not-json = 文件的 json 字段不是 JSON。

js-lunar-key-50-or-more = 50 % 或以上

js-lunar-key-90-or-more = 90 % 或以上

js-lunar-key-95-or-more = 95 % 或以上

js-lunar-key-99-or-more = 99 % 或以上

js-lunar-key-above = 高于 { $value }

js-lunar-key-above-threshold = 高于 { $value } × 门限

js-lunar-key-below-50 = 低于 50 %

js-lunar-key-between = { $from } 至 { $to }

js-lunar-key-between-threshold = { $from } 至 { $to } × 门限

js-lunar-key-up-to = 至多 { $value }

js-lunar-key-up-to-threshold = 至多 { $value } × 门限

js-lunar-layer-availability = 可用性

js-lunar-layer-coverage = 覆盖

js-lunar-layer-error = 校正后误差

js-lunar-layer-range = 按其自身范围的校正后误差

js-lunar-legend-no-figure = 无数值（全程不可用）

js-lunar-legend-radius = 覆盖半径

js-lunar-legend-threshold = 门限，{ $value }

js-lunar-legend-worst = 最差点

js-lunar-link-copied = 链接已复制。

js-lunar-map-desc = 从极点到纬度 { $rim }° 的 { $points } 个网格点。其中 { $meet } 个点校正后的第 { $percentile } 百分位误差在 { $threshold } 的门限以内。按 { $layer } 着色。站点位于 { $lat }°，{ $lon }°。

js-lunar-map-note-one-band = { $share } % 的点落在门限刻度的同一个区间内，因此地图变化很小：请按“其自身范围”着色，以查看误差在区域内如何变化。

js-lunar-needs-newer-engine = 此研究需要引擎 { $need } 或更高版本；此处运行的引擎为 v{ $version }。仍可显示记录或结果文件。

js-lunar-no = 否

js-lunar-no-recording = 此研究的记录尚未随附：它将在发布时用 0.36 引擎生成。请用带有该类型的引擎在此运行，或打开结果文件。

js-lunar-no-scenario = 本站点尚无 { $file }：它将随 0.36 引擎提供。请改为打开结果文件。

js-lunar-no-scenario-note = 本站点尚无 { $file }（它将随 0.36 引擎提供），因此无法在此运行；请改为打开结果文件。

js-lunar-not-report = 这不是 { $kind } 报告。

js-lunar-not-stated = 未说明

js-lunar-note-none = 文件未给出说明。

js-lunar-note-withheld = 文件自带的说明提到了某个计划或机构，因此本页面不予显示；以页面顶部的声明为准。

js-lunar-point-epochs-reason = 点-历元：{ $reason }

js-lunar-radius-desc = 在 { $count } 个方位角上的覆盖半径：最短 { $lo } km，位于 { $loAz }°；最长 { $hi } km，位于 { $hiAz }°。

js-lunar-radius-desc-limited = 有 { $count } 个到达网格边缘，因此覆盖在该处至少延伸到那么远。

js-lunar-radius-hollow = 空心点到达网格边缘：覆盖沿该方位至少延伸到那么远。

js-lunar-radius-none = 报告未给出覆盖半径。

js-lunar-radius-per-azimuth = 各方位角的覆盖半径

js-lunar-radius-point = { $az }°：{ $km } km

js-lunar-radius-point-limited = { $az }°：{ $km } km（到达网格边缘：至少延伸到这么远）

js-lunar-radius-zero = 在每个方位上，覆盖在站点处就已低于 95 %，因此半径为 0 km：该处校正后误差超过 { $value } 的门限。

js-lunar-reason-station-missing = 站点看不到用户所用的每一颗卫星

js-lunar-reason-user-lt4 = 用户可见的卫星少于四颗

js-lunar-run-stopped = 运行已停止：{ $message }

js-lunar-running = 正在此浏览器中运行研究…

js-lunar-running-elapsed = 正在此浏览器中运行研究… { $seconds } s

js-lunar-scenario-missing-keys = 场景文件中没有 { $keys }；无法在此更改。

js-lunar-set-inputs = 设置输入，然后按“在此运行”。

js-lunar-showing = 显示 { $what }。

js-lunar-showing-engine = 显示 { $what }（引擎 { $version }）。

js-lunar-source-error = { $what }：{ $error }

js-lunar-station = 站点

js-lunar-station-title = 站点 { $lat }°，{ $lon }°

js-lunar-table-count = { $n } 个点，离站点最近的排在前面。

js-lunar-th-corrected = 校正后误差，{ $n } %

js-lunar-threshold-title = 校正后误差 { $value }（门限）

js-lunar-what-file = 文件 { $name }

js-lunar-what-recording = 随 Studio 一同提供的记录

js-lunar-what-run = 在此浏览器中的一次运行（引擎 { $version }）

js-lunar-worst-at = 位于 { $lat }°，{ $lon }°

js-lunar-worst-title = 最差点 { $lat }°，{ $lon }°：{ $value }

js-lunar-yes-at-least = 是：至少延伸到这么远

js-lunarinfra-above-95-point = 高于 95 % 点

js-lunarinfra-advisory = 仅供参考的软件，不是经型式认可的设备；没有任何形式的发射路径。

js-lunarinfra-arc-note = 载波波长 { $value } m。

js-lunarinfra-arc-title = 每段弧

js-lunarinfra-bars-not-loaded = 判据文件未能加载

js-lunarinfra-bars-not-shown = 无法显示预先登记的判据（{ $reason }）。

js-lunarinfra-bars-note = 在对任何研究评分之前即已固定，并附有记录在案的判定（引擎提交 { $commit }）。没有任何内容为 VALIDATED；标为 NOT MET 的判据由断言该未达标的测试固定，且没有任何一条被放宽。

js-lunarinfra-bars-title = 对照预先登记的判据

js-lunarinfra-bars-wrong-file = 该判据文件不是本页面所读取的文件

js-lunarinfra-blurb-carrier-phase = 一个地面站和一个轨道器，使用地球 GNSS 信号的双差载波相位：能否固定整周模糊度，这对位置界有何影响？快速示例运行。

js-lunarinfra-blurb-frame-coestimation = 由地球站激光测距得到的月球基准七参数，分别在有和没有轨道器到地面站测距的情况下：信息量改善多少？

js-lunarinfra-blurb-geodesy-sensitivity = 激光测距、轨道器跟踪、重力仪和地面时钟对月球潮汐勒夫数 h2、k2、l2 及其物理天平动有多敏感？

js-lunarinfra-blurb-od-consistency = 近直线晕轨道上的星载地球 GNSS 定轨，与同一弧段的独立地面无线电测量解对照：两者在各自所述的不确定度范围内是否一致？注入建模误差时，一致性检验能否发现？并排显示。

js-lunarinfra-blurb-space-tie = 同一航天器上的 GNSS、VLBI 和激光测距：三种技术之间的偏移能以多高的精度连接起来，与航天器上局部连接的误差相比如何？

js-lunarinfra-bound-label = 位置不确定度，浮点解与固定解，对数刻度

js-lunarinfra-bound-note = 站点和轨道器的一倍标准差位置不确定度，分别为模糊度保持浮点和已固定的情形（若能达到固定，固定后会得到的结果）。

js-lunarinfra-bound-title = 位置界，浮点解与固定解

js-lunarinfra-chip-na = 不适用

js-lunarinfra-comp-normal = 法向

js-lunarinfra-comp-position = 位置（3-D）

js-lunarinfra-comp-radial = 径向

js-lunarinfra-comp-transverse = 横向

js-lunarinfra-compare-note = 在 { $sets } 组随机站点集合上，加入轨道器链路后最小特征值在 { $lambda } 组中没有变小，迹在 { $trace } 组中没有变大；最小特征值上升的中位数为 { $median } 倍。

js-lunarinfra-compare-title = 以数字呈现的对比

js-lunarinfra-crsigma-label = 克拉美-罗 sigma，对数刻度

js-lunarinfra-crsigma-note = 以地表处的米为单位。

js-lunarinfra-crsigma-title = 各参数的克拉美-罗 sigma

js-lunarinfra-days = { $n } 天

js-lunarinfra-direction = 方向 { $n }

js-lunarinfra-disclosures = 披露

js-lunarinfra-eig-label = 信息特征值，对数刻度

js-lunarinfra-eig-note = 信息矩阵的七个特征值，由小到大，分别为没有和加入轨道器到地面站链路的情形。最小特征值上升 { $times } 倍，克拉美-罗迹降至其原值的 { $share }。这假定轨道在月球坐标轴中已知（其误差由轨道器距离 sigma 承载）。

js-lunarinfra-eig-title = 基准各方向上的信息

js-lunarinfra-fact-arc = 弧段

js-lunarinfra-fact-hash = 场景哈希

js-lunarinfra-fact-llr-rows = 激光测距行数

js-lunarinfra-fact-orbit-family = 轨道族

js-lunarinfra-fact-orbiter-arc = 轨道器弧段

js-lunarinfra-fact-orbiter-rows = 轨道器行数

js-lunarinfra-fact-study = 研究

js-lunarinfra-fact-wavelength = 载波波长

js-lunarinfra-families-note = 各参数的偏导数在该族各行上的 RMS，以及行数。零表示该族对该参数无感。轨道器族的 k2 灵敏度是上限值。

js-lunarinfra-families-title = 各族能看到什么

js-lunarinfra-findings = 发现

js-lunarinfra-fix-note-a = 正确固定了全部整数模糊度的蒙特卡罗试验所占比例（附标准误差），以及自举估计所预测的比率。

js-lunarinfra-fix-note-b = 在此输入下，整数固定并未实现：最好的弧段只固定了 { $share } 的试验。

js-lunarinfra-fix-note-c = 由于未能达到固定，没有可显示的固定时间。

js-lunarinfra-fix-rate-label = 整数固定率与弧段长度的关系

js-lunarinfra-fix-title = 固定率与弧段长度的关系

js-lunarinfra-fixed = 固定

js-lunarinfra-float = 浮点

js-lunarinfra-fraction-above-95 = 高于 95 % 点的试验所占比例

js-lunarinfra-ground-radiometric = 独立地面无线电测量

js-lunarinfra-injected-error = 注入误差 { $value } m/s²

js-lunarinfra-mean-consistency = 一致性统计量均值

js-lunarinfra-mean-q = q 均值

js-lunarinfra-miss-line = { $id } 为 { $status }：{ $value }

js-lunarinfra-miss-no-fix = 在此输入下，整周模糊度固定并未实现：最好的弧段只固定了 { $share } 的蒙特卡罗试验。

js-lunarinfra-na = 不适用

js-lunarinfra-nominal = 标称

js-lunarinfra-not-result = 这不是月球基础设施的结果

js-lunarinfra-not-verified = 未验证

js-lunarinfra-offset-precision-label = 偏移精度与局部连接的关系，双对数

js-lunarinfra-offsets-note = 每个轴的平移 sigma，以及地表处的尺度和旋转 sigma，单位为米。

js-lunarinfra-offsets-title = 各连接误差下的偏移（{ $days } 天弧段，{ $epochs } 个历元）

js-lunarinfra-onboard-gnss = 星载地球 GNSS

js-lunarinfra-open-failed = 无法打开 { $title }：{ $reason }。

js-lunarinfra-opening = 正在打开 { $title }…

js-lunarinfra-orbit-uncertainty-log = 按分量划分的轨道不确定度，对数刻度

js-lunarinfra-orbiter-days = 轨道器，{ $days } 天

js-lunarinfra-q-note = 一致性统计量 q 在 { $trials } 次试验上的均值；{ $expected } 是一对一致的解所给出的值。高于 95 % 点的试验所占比例即该检验的检测率。

js-lunarinfra-q-title = 一致性检验，标称与注入误差对比

js-lunarinfra-recorded =
    { $n ->
       *[other] { $title }：引擎的已记录结果（版本 { $version }）。
    }

js-lunarinfra-rel-label = 相对标称值的 sigma，对数刻度

js-lunarinfra-rel-note = 克拉美-罗 sigma 占标称值的百分比，四个族合并计算。h2 和 l2 是线性化点，不是经验证的值；k2 取自已发表的拟合结果。

js-lunarinfra-rel-title = 每个参数相对其标称值能被确定到何种程度

js-lunarinfra-result-not-json = 结果不是 JSON（{ $reason }）

js-lunarinfra-result-not-loaded = 已记录的结果 { $file } 未能加载

js-lunarinfra-row-above-95 = 高于 95 % 点的试验（卡方 95 % = { $chi }）

js-lunarinfra-row-crtrace = 克拉美-罗迹

js-lunarinfra-row-degeneracy = 退化度量

js-lunarinfra-row-formal-diff = 该差值的形式 sigma

js-lunarinfra-row-ground-meas = 地面：测量数，有站点的历元数

js-lunarinfra-row-mean-diff = 两条轨道的平均差值

js-lunarinfra-row-mean-q = q 均值（预期为 6）

js-lunarinfra-row-observations = 观测数

js-lunarinfra-row-onboard-epochs = 星载：有一颗或更多 / 四颗或更多卫星的历元数

js-lunarinfra-row-onboard-meas = 星载：测量数，平均跟踪卫星数

js-lunarinfra-row-origin-scale = 原点-尺度相关性

js-lunarinfra-row-origin-sigma = 原点 sigma，m

js-lunarinfra-row-rank-defect = 秩（亏秩）

js-lunarinfra-row-smallest-eig = 最小特征值

js-lunarinfra-row-trace-ground = 样本迹与形式迹之比，地面

js-lunarinfra-row-trace-onboard = 样本迹与形式迹之比，星载

js-lunarinfra-row-within-95 = 在 95 % 点以内的试验

js-lunarinfra-series-bootstrapped = 自举

js-lunarinfra-series-floor = 下限

js-lunarinfra-series-monte-carlo = 蒙特卡罗

js-lunarinfra-side-note = 轨道：{ $family }，周期为 { $period } 天的轨道上一段 { $arc } 天的弧段，每 { $sample } s 采样一次。

js-lunarinfra-side-title = 并排对比

js-lunarinfra-sigma-note = 同一弧段的两个估计所得的各分量一倍标准差位置不确定度，单位为米。

js-lunarinfra-sigma-over-nominal = sigma / 标称值

js-lunarinfra-sigma-title = 双方各自对轨道的了解程度

js-lunarinfra-station-days = 站点，{ $days } 天

js-lunarinfra-status-verdict = { $status }：{ $verdict }

js-lunarinfra-subsets-note = 加入一个族从未使最小特征值变小（{ $pairs } 次加入中的 { $lambda } 次），但伪逆的迹在 { $pairs } 次中只有 { $trace } 次没有变大，因为加入的族可能提高秩。

js-lunarinfra-subsets-title = 各族的所有组合

js-lunarinfra-sweep-note = 随着航天器上三种技术之间连接的误差被扫描，各偏移最差的平移分量，单位为米。在已登记的各技术 sigma（GNSS { $gnss } m、VLBI { $vlbi } m、激光 { $slr } m）下，偏移受测量噪声限制，而不受连接限制；只有对近乎完美的技术，连接才决定下限。

js-lunarinfra-sweep-title = 技术偏移的精度与局部连接的关系（{ $days } 天弧段）

js-lunarinfra-th-arc-days = 弧段，天

js-lunarinfra-th-bar = 判据

js-lunarinfra-th-bootstrapped = 自举比率

js-lunarinfra-th-budget-exhausted = 搜索预算已耗尽（试验）

js-lunarinfra-th-common-sats = 有 2 颗或更多共同卫星的历元

js-lunarinfra-th-crtrace = 克拉美-罗迹

js-lunarinfra-th-dd-ambiguities = 双差模糊度

js-lunarinfra-th-epochs = 历元

js-lunarinfra-th-families = 族

js-lunarinfra-th-family = 族

js-lunarinfra-th-local-tie = 局部连接 sigma，m

js-lunarinfra-th-mc-fix-rate = 蒙特卡罗固定率

js-lunarinfra-th-median-ambiguity = 模糊度 sigma 中位数，周

js-lunarinfra-th-offset = 偏移

js-lunarinfra-th-quantity = 量

js-lunarinfra-th-rank = 秩

js-lunarinfra-th-rotation = 地表处的旋转，m

js-lunarinfra-th-rows = 行数

js-lunarinfra-th-scale = 地表处的尺度，m

js-lunarinfra-th-smallest-eig = 最小特征值

js-lunarinfra-th-translation = 平移 x、y、z，m

js-lunarinfra-th-value = 数值

js-lunarinfra-th-verdict = 判定

js-lunarinfra-th-with-links = 有轨道器链路

js-lunarinfra-th-without-links = 无轨道器链路

js-lunarinfra-title-carrier-phase = 载波相位，地面与轨道器

js-lunarinfra-title-frame-coestimation = 坐标系联合估计

js-lunarinfra-title-geodesy-sensitivity = 勒夫数与天平动

js-lunarinfra-title-od-consistency = 定轨一致性

js-lunarinfra-title-space-tie = 空间连接

js-lunarinfra-unknown-study = 此月球基础设施结果属于研究“{ $study }”，本页面不读取该研究

js-lunarinfra-where-missed = 此研究未达标之处。

js-lunarinfra-with-links = 有轨道器链路

js-lunarinfra-without-links = 无轨道器链路

js-lunarinfra-x-arc-length = 弧段长度，天

js-lunarinfra-x-local-tie = 局部连接 sigma，m（对数）

js-lunarinfra-y-fixed-correctly = 固定正确，%

js-lunarinfra-y-offset-sigma = 偏移 sigma，m（对数）；虚线下限仅为连接本身，即 sqrt(2) × 连接误差

js-meaning-body-generic = 该天体

js-meaning-body-the = { $name }

js-meaning-card-label-sub = { $k }，{ $sub }

js-meaning-checks-of =
    { $n ->
       *[other] { $n } 次检查中的 { $av } 次
    }

js-meaning-coverage-average-label = 平均可见数

js-meaning-coverage-big-min =
    { $n ->
       *[other] 每个地点至少可见 { $n } 颗卫星，平均 { $mean } 颗。
    }

js-meaning-coverage-big-none = 有些地点有时看不到任何卫星；平均可见 { $mean } 颗。

js-meaning-coverage-fewest-label = 任何地点的最少可见数

js-meaning-coverage-line-many = 在 { $names } 共同作用下，{ $body }周围 { $share } % 的地点和时间可以定位。

js-meaning-coverage-line-many-pdop = 在 { $names } 共同作用下，{ $body }周围 { $share } % 的地点和时间可以定位（几何质量，PDOP，低于 { $thr }）。

js-meaning-coverage-line-none = { $body }周围 { $share } % 的地点和时间可以定位。

js-meaning-coverage-line-none-pdop = { $body }周围 { $share } % 的地点和时间可以定位（几何质量，PDOP，低于 { $thr }）。

js-meaning-coverage-line-one = 在 { $names } 下，{ $body }周围 { $share } % 的地点和时间可以定位。

js-meaning-coverage-line-one-pdop = 在 { $names } 下，{ $body }周围 { $share } % 的地点和时间可以定位（几何质量，PDOP，低于 { $thr }）。

js-meaning-coverage-places-label = 可以定位的地点

js-meaning-duration-days =
    { $n ->
       *[other] { $days } 天
    }

js-meaning-ensemble-big-many = 在多次噪声抽样中，{ $q } 平均可在 { $thr } ns 内维持 { $qd }；{ $c } 为 { $cd }。

js-meaning-ensemble-big-runs =
    { $n ->
       *[other] 在 { $n } 次噪声抽样中，{ $q } 平均可在 { $thr } ns 内维持 { $qd }；{ $c } 为 { $cd }。
    }

js-meaning-ensemble-line = { $name }：十次抽样中有九次保持 { $band }。

js-meaning-ensemble-mean = 均值

js-meaning-ensemble-mean-band = 均值；90 % 区间 { $band }

js-meaning-error-p95-label = 误差，95 % 的时间，{ $name }

js-meaning-generic-big = { $label }：{ $value }。

js-meaning-generic-line-one = 本次运行还给出：{ $a }。

js-meaning-generic-line-two = 本次运行还给出：{ $a }和 { $b }。

js-meaning-generic-none = 本次运行没有单一的头条数据；下方图表显示其结果。

js-meaning-holdover-label = 守时（holdover），{ $name }

js-meaning-hpl-sub = 水平保护级

js-meaning-inside-budget = 在 { $budget } 以内

js-meaning-integrity-big-checks-mostly = 是，大体如此：在 { $share } % 的检查中。

js-meaning-integrity-big-checks-no = 否：在 { $share } % 的检查中。

js-meaning-integrity-big-checks-partly = 仅部分如此：在 { $share } % 的检查中。

js-meaning-integrity-big-checks-yes = 是：在 { $share } % 的检查中。

js-meaning-integrity-big-span-mostly = 是，大体如此：占 { $span } 的 { $share } %。

js-meaning-integrity-big-span-no = 否：占 { $span } 的 { $share } %。

js-meaning-integrity-big-span-partly = 仅部分如此：占 { $span } 的 { $share } %。

js-meaning-integrity-big-span-yes = 是：占 { $span } 的 { $share } %。

js-meaning-integrity-bound-label = 典型误差界

js-meaning-integrity-bound-sub = 水平 / 垂直，中位数

js-meaning-integrity-gap-all-passed = 每次检查均通过

js-meaning-integrity-gap-label = 最长间断

js-meaning-integrity-gap-none = 无

js-meaning-integrity-gap-sub =
    { $n ->
       *[other] 自 { $from } 起连续 { $n } 次检查
    }

js-meaning-integrity-line-h =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（水平 { $h } m）以下。
    }

js-meaning-integrity-line-h-clean =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（水平 { $h } m）以下，且没有产生误导性的定位。
    }

js-meaning-integrity-line-h-some =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（水平 { $h } m）以下；有 { $n } 次定位具有误导性。
    }

js-meaning-integrity-line-hv =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（水平 { $h } m，垂直 { $v } m）以下。
    }

js-meaning-integrity-line-hv-clean =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（水平 { $h } m，垂直 { $v } m）以下，且没有产生误导性的定位。
    }

js-meaning-integrity-line-hv-some =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（水平 { $h } m，垂直 { $v } m）以下；有 { $n } 次定位具有误导性。
    }

js-meaning-integrity-line-none =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值以下。
    }

js-meaning-integrity-line-none-clean =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值以下，且没有产生误导性的定位。
    }

js-meaning-integrity-line-none-some =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值以下；有 { $n } 次定位具有误导性。
    }

js-meaning-integrity-line-v =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（垂直 { $v } m）以下。
    }

js-meaning-integrity-line-v-clean =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（垂直 { $v } m）以下，且没有产生误导性的定位。
    }

js-meaning-integrity-line-v-some =
    { $n ->
       *[other] 接收机的误差界（其保护级）在 { $tot } 次检查中的 { $av } 次保持在告警限值（垂直 { $v } m）以下；有 { $n } 次定位具有误导性。
    }

js-meaning-integrity-misleading-label = 误导性定位

js-meaning-integrity-misleading-sub = 实际误差高于误差界

js-meaning-integrity-trusted-label = 定位可信的时间

js-meaning-jamming-above-label = 干扰机高于信号

js-meaning-jamming-above-sub = 平均干信比

js-meaning-jamming-big-gone = 干扰机使定位完全丧失。

js-meaning-jamming-big-share = 有干扰机时，{ $share } % 的时间可以定位。

js-meaning-jamming-clear-label = 无干扰机时可定位

js-meaning-jamming-fewest-label = 跟踪卫星数最少

js-meaning-jamming-fewest-sub = 在最差时刻

js-meaning-jamming-jammed-label = 受干扰时可定位

js-meaning-jamming-line = 没有干扰机时，{ $share } % 的时间可以定位。

js-meaning-jamming-line-js = 没有干扰机时，{ $share } % 的时间可以定位；干扰机平均比信号高 { $db } dB。

js-meaning-kicker = { $domain } · { $title }

js-meaning-lunar-big-all =
    { $n ->
       *[other] 是：{ $n } 次检查中每一次都满足。
    }

js-meaning-lunar-big-none =
    { $n ->
       *[other] 否：{ $n } 次检查中没有一次满足。
    }

js-meaning-lunar-big-some =
    { $n ->
       *[other] { $n } 次检查中的 { $av } 次满足（{ $share } %）。
    }

js-meaning-lunar-largest-label = 最大误差界

js-meaning-lunar-line = 保护级范围为 { $min } 至 { $max } m，告警限值为 { $limit } m。

js-meaning-lunar-meet-label = 满足限值的检查

js-meaning-lunar-meet-value = { $tot } 中的 { $av }

js-meaning-lunar-smallest-label = 最小误差界

js-meaning-median-lower-better = 中位数，越低越好

js-meaning-of-the-time = 的时间

js-meaning-orbit-best-label = 最佳几何（PDOP）

js-meaning-orbit-best-sub = 运行期间的最低值

js-meaning-orbit-big-always = 全程都可以定位。

js-meaning-orbit-big-share = { $share } % 的时间可以定位。

js-meaning-orbit-error-label = 典型位置误差

js-meaning-orbit-error-sub = 1-sigma，中位数

js-meaning-orbit-line =
    { $n ->
       *[other] 在 { $n } 个时刻中的 { $fix } 个，可见卫星数足够。
    }

js-meaning-orbit-line-pdop =
    { $n ->
       *[other] 在 { $n } 个时刻中的 { $fix } 个，可见卫星数足够；典型几何质量（PDOP，位置精度因子）为 { $pdop }，越低越好。
    }

js-meaning-orbit-moments =
    { $n ->
       *[other] { $n } 个时刻中的 { $fix } 个
    }

js-meaning-orbit-time-label = 可以定位的时间

js-meaning-pair-big-diff-pos = { $best } 在 { $budget } 以内可维持 { $bestDur }；{ $other } 为 { $otherDur }。

js-meaning-pair-big-diff-time = { $best } 可将时间保持在 { $budget } 以内达 { $bestDur }；{ $other } 为 { $otherDur }。

js-meaning-pair-big-same-pos = { $q } 和 { $c } 都能在 { $budget } 以内维持 { $dur }。

js-meaning-pair-big-same-time = { $q } 和 { $c } 都能将时间保持在 { $budget } 以内达 { $dur }。

js-meaning-pair-line-clock = 守时（holdover）是指卫星导航丢失后，每个时钟保持在 { $budget } 预算以内的时长。

js-meaning-pair-line-navigator = 守时（holdover）是指卫星导航丢失后，每个导航器保持在 { $budget } 预算以内的时长。

js-meaning-pdop-label = 几何质量（PDOP）

js-meaning-places-times = 的地点和时间

js-meaning-range-to = { $from } 至 { $to }

js-meaning-satellites =
    { $n ->
       *[other] 颗卫星
    }

js-meaning-spectrum-above = 高于门限

js-meaning-spectrum-below = 低于门限：已失锁

js-meaning-spectrum-big-kept =
    { $n ->
       *[other] { $n } 个信号全部保持跟踪。
    }

js-meaning-spectrum-big-lost =
    { $n ->
       *[other] 干扰机使 { $n } 个信号中的 { $lost } 个丢失：{ $names }。
    }

js-meaning-spectrum-line-kept =
    { $n ->
       *[other] { $names } 在整个运行期间保持在接收机跟踪门限以上。
    }

js-meaning-spectrum-line-kept-thr =
    { $n ->
       *[other] { $names } 在整个运行期间保持在接收机 { $thr } dB-Hz 跟踪门限以上。
    }

js-meaning-spectrum-line-none = 没有任何信号在整个运行期间保持在接收机跟踪门限以上。

js-meaning-spectrum-line-none-thr = 没有任何信号在整个运行期间保持在接收机 { $thr } dB-Hz 跟踪门限以上。

js-meaning-spectrum-weakest-label = 最弱信号，{ $name }

js-meaning-whole-run = 在整个运行期间

js-meaning-your-setting = 用户设置

js-meankind-acm-big =
    { $n ->
       *[other] 自适应编码传输的数据量是最佳固定模式的 { $gain } 倍：在 { $n } 次过境中为 { $acm } Gbit，对比 { $ccm } Gbit。
    }

js-meankind-acm-line = 固定模式 { $mode }；中断 { $dur }。

js-meankind-anomaly-big = 量子故障监测器得分为 { $q }，经典监测器为 { $c }（曲线下面积，1 为完美）。

js-meankind-anomaly-line = 可检测的最小故障为 { $q }，对比 { $c }。

js-meankind-aocs-big-open = { $slew } 度的转动没有稳定到 { $threshold } 度以下。

js-meankind-aocs-big-settles = { $slew } 度的转动在 { $dur } 后稳定到 { $threshold } 度以下。

js-meankind-aocs-line = 最终指向误差 { $final } 度。

js-meankind-aocs-line-filter = 最终指向误差 { $final } 度。回路中的姿态滤波器偏差为 { $arcsec } 角秒 RMS。

js-meankind-aocs-line-wheel = 最终指向误差 { $final } 度。飞轮力矩峰值 { $torque } N m。

js-meankind-aocs-line-wheel-filter = 最终指向误差 { $final } 度。飞轮力矩峰值 { $torque } N m。回路中的姿态滤波器偏差为 { $arcsec } 角秒 RMS。

js-meankind-aperture-big = 导航占用 { $nav } % 的天线时间，通信占用 { $comms } %。

js-meankind-aperture-big-idle = 导航占用 { $nav } % 的天线时间，通信占用 { $comms } %；{ $idle } % 空闲。

js-meankind-aperture-line-all =
    { $n ->
       *[other] { $policy } 规则下的 { $n } 个天线孔径，争用时间 { $dur }。
    }

js-meankind-aperture-line-contention =
    { $n ->
       *[other] { $n } 个天线孔径，争用时间 { $dur }。
    }

js-meankind-aperture-line-count =
    { $n ->
       *[other] { $n } 个天线孔径。
    }

js-meankind-aperture-line-nocount = 各天线孔径。

js-meankind-aperture-line-nocount-all = { $policy } 规则下的各天线孔径，争用时间 { $dur }。

js-meankind-aperture-line-nocount-contention = 各天线孔径，争用时间 { $dur }。

js-meankind-aperture-line-nocount-policy = { $policy } 规则下的各天线孔径。

js-meankind-aperture-line-policy =
    { $n ->
       *[other] { $policy } 规则下的 { $n } 个天线孔径。
    }

js-meankind-araim-big-no = 否：引擎的保护级与已发表的参考值不符。

js-meankind-araim-big-yes = 是：引擎的保护级与已发表的参考值一致。

js-meankind-araim-line = 最大差值为 { $worst } m，参考值自身的容差为 { $tol } m。

js-meankind-araim-line-vectors =
    { $n ->
       *[other] 在 { $n } 个参考向量上，最大差值为 { $worst } m，参考值自身的容差为 { $tol } m。
    }

js-meankind-arc-big = 估计器在获得 { $h } h 弧段中的 { $dur } 后即可恢复轨道。

js-meankind-arc-line = { $n } 个航天器，{ $observable } 测量。

js-meankind-ascent-big = 重力、阻力、转向和背压损耗了 { $ideal } m/s 理想速度增量中的 { $loss } m/s。

js-meankind-ascent-line = 在 { $km } km、{ $speed } m/s 时关机；动压峰值 { $kpa } kPa。

js-meankind-attack-big-no = 地表上的欺骗干扰源无法捕获月球接收机。

js-meankind-attack-big-yes = 地表上的欺骗干扰源可以捕获月球接收机。

js-meankind-attack-line = 地表发射机在被地平线遮挡之前可达 { $km } km。

js-meankind-attitude-big = 指向误差合计 { $total } 角秒。

js-meankind-attitude-big-from = 指向误差合计 { $total } 角秒，主要来自 { $from }。

js-meankind-attitude-line = 最大重力梯度力矩为 { $torque } N·m。

js-meankind-beacon-big = 地表信标使几何质量（PDOP）改善 { $x } 倍。

js-meankind-beacon-line = 改为增加卫星则改善 { $x } 倍。

js-meankind-bodypnt-big = 仅靠中继，{ $body }周围 { $share } % 的时间可以定位。

js-meankind-bodypnt-big-earth = 仅靠中继，{ $body }周围 { $share } % 的时间可以定位；加上与地球的链路为 { $earth } %。

js-meankind-bodypnt-line = 平均可见 { $mean } 个中继。

js-meankind-by = { $a } × { $b }

js-meankind-campaign-compose-line = 每个成员都是一次普通的引擎运行；该测评活动把它们的结果并排读取。

js-meankind-campaign-compose-range =
    { $n ->
       *[other] 在相同条件下的 { $n } 个场景中，{ $what } 的范围为 { $low } 至 { $high }。
    }

js-meankind-campaign-compose-same =
    { $n ->
       *[other] 在相同条件下的 { $n } 个场景中，每一个的 { $what } 均为 { $value }。
    }

js-meankind-campaign-line =
    { $n ->
       *[other] { $n } 个阶段。
    }

js-meankind-campaign-line-all =
    { $n ->
       *[other] { $n } 个阶段和 { $events }，来自 { $runs }；结束时，{ $label } 为 { $value }。
    }

js-meankind-campaign-line-end =
    { $n ->
       *[other] { $n } 个阶段；结束时，{ $label } 为 { $value }。
    }

js-meankind-campaign-line-events =
    { $n ->
       *[other] { $n } 个阶段和 { $events }。
    }

js-meankind-campaign-line-events-end =
    { $n ->
       *[other] { $n } 个阶段和 { $events }；结束时，{ $label } 为 { $value }。
    }

js-meankind-campaign-line-events-runs =
    { $n ->
       *[other] { $n } 个阶段和 { $events }，来自 { $runs }。
    }

js-meankind-campaign-line-runs =
    { $n ->
       *[other] { $n } 个阶段，来自 { $runs }。
    }

js-meankind-campaign-line-runs-end =
    { $n ->
       *[other] { $n } 个阶段，来自 { $runs }；结束时，{ $label } 为 { $value }。
    }

js-meankind-campaign-mission-alarm = 在 { $dur } 的任务中，有 { $alarm } 处于告警状态。

js-meankind-campaign-mission-phases = 一项 { $phases } 阶段的任务，历时 { $dur }，串接在同一个时钟上。

js-meankind-campaign-mission-quiet = 在整个 { $dur } 的任务中没有告警。

js-meankind-campaign-montecarlo =
    { $n ->
       *[other] 在 { $n } 次带随机种子的运行中，{ $name } 平均为 { $mean }，离散度为 { $std }。
    }

js-meankind-campaign-montecarlo-line = 离散度是各次运行上的一倍标准差。

js-meankind-campaign-optimize =
    { $n ->
       *[other] 经过 { $n } 次运行后，搜索收敛到 { $name } 为 { $value }。
    }

js-meankind-campaign-optimize-at = 位于 { $at }。

js-meankind-campaign-optimize-kind =
    { $n ->
       *[other] 经过 { $n } 次 { $kind } 运行后，搜索收敛到 { $name } 为 { $value }。
    }

js-meankind-campaign-sweep-flat =
    { $n ->
       *[other] 在 { $axis } 从 { $from } 到 { $to } 的 { $n } 次运行中，{ $metric } 保持为 { $value }。
    }

js-meankind-campaign-sweep-flat-line = 图表显示每一次运行。

js-meankind-campaign-sweep-goes =
    { $n ->
       *[other] 在 { $axis } 从 { $from } 到 { $to } 的 { $n } 次运行中，{ $metric } 从 { $first } 变为 { $last }。
    }

js-meankind-campaign-sweep-goes-line = 图表显示每一次运行；范围为 { $min } 至 { $max }。

js-meankind-classical-link = 经典链路

js-meankind-clock-word = 时钟

js-meankind-conflict-big = 分层架构的存活能力比单层好 { $ratio } 倍。

js-meankind-conflict-line-threats = 对威胁的蒙特卡罗给出 { $ratio } 倍。

js-meankind-conflict-line-threats-corr = 对威胁的蒙特卡罗给出 { $ratio } 倍；威胁相关时可降至 { $low } 倍。

js-meankind-conflict-line-trials =
    { $n ->
       *[other] { $n } 次试验的蒙特卡罗给出 { $ratio } 倍。
    }

js-meankind-conflict-line-trials-corr =
    { $n ->
       *[other] { $n } 次试验的蒙特卡罗给出 { $ratio } 倍；威胁相关时可降至 { $low } 倍。
    }

js-meankind-contacts-big =
    { $n ->
       *[other] 该计划在 { $n } 个候选接触中保留 { $kept } 个，传送 { $gbit } Gbit。
    }

js-meankind-contacts-big-waiting =
    { $n ->
       *[other] 该计划在 { $n } 个候选接触中保留 { $kept } 个，在等待传送的 { $waiting } Gbit 中传送 { $gbit } Gbit。
    }

js-meankind-contacts-line = { $hours } h 内有 { $sats } 颗卫星和 { $stations } 个站点。

js-meankind-dpnt-big = 差分改正使误差从 { $from } m 降到 { $to } m。

js-meankind-dpnt-line = 参考站在 { $km } km 之外。

js-meankind-duration-days =
    { $n ->
       *[other] { $days } 天
    }

js-meankind-earthgnss-big =
    { $n ->
       *[other] 在月球的距离上，{ $n } 颗卫星中有 { $visible } 颗可见，但只有 { $trackable } 颗可以被跟踪。
    }

js-meankind-earthgnss-line = 最佳信号为 { $best } dB-Hz，跟踪门限为 { $threshold } dB-Hz。

js-meankind-engine-run-count =
    { $n ->
       *[other] { $n } 次引擎运行
    }

js-meankind-entry-big = 峰值减速度为 { $g } g，位于 { $km } km，热流峰值为 { $flux } W/cm²。

js-meankind-entry-line = 以 { $speed } m/s 进入，在地平线以下 { $angle } 度。

js-meankind-eo-big = 相机在 { $gsd } m 分辨率下可见 { $swath } km 的幅宽。

js-meankind-eo-line-contiguous = 赤道处星下点轨迹相距 { $km } km，因此覆盖是连续的。

js-meankind-eo-line-gapped = 赤道处星下点轨迹相距 { $km } km，因此覆盖有缺口。

js-meankind-eop-big = 在月球的距离上，地球自转每秒扫过 { $m } m，因此地球定向数据的龄期（此处为 { $dur }）很重要。

js-meankind-eop-line = 输入：{ $source }。

js-meankind-ephemeris-big = 卫星飞行高度在 { $min } 至 { $max } km 之间，最高纬度达 { $lat }°。

js-meankind-ephemeris-line = 从站点看，它升到 { $deg }°。

js-meankind-ephemeris-line-doppler = 从站点看，它升到 { $deg }°，多普勒最高达 { $khz } kHz。

js-meankind-event-count =
    { $n ->
       *[other] { $n } 个事件
    }

js-meankind-framecampaign-big-open =
    { $n ->
       *[other] 该测量方案使基准的 { $n } 个方向未能确定。
    }

js-meankind-framecampaign-big-yes = 是：该测量方案完全确定了月球坐标系基准。

js-meankind-framecampaign-line = 条件数 { $n }。

js-meankind-framereal-big = 实现的月球坐标系有 { $m } m 的残余误差。

js-meankind-framereal-big-open = 实现的月球坐标系有 { $m } m 的残余误差，但拟合没有收敛。

js-meankind-framereal-line = 平移误差 { $trans } m，尺度误差 { $scale } 十亿分之一。

js-meankind-gnsssim-big = 完好性监测在 { $share } % 的时间内保护定位。

js-meankind-gnsssim-line = 电离层平均给每个距离增加 { $iono } m，对流层增加 { $tropo } m。

js-meankind-headline-figure = 头条数据

js-meankind-holdovertest-big = 对照模板衡量，该记录的 { $dur } s 守时（holdover）达到 { $te } ns 的钟差。

js-meankind-holdovertest-big-open = 对照模板衡量，该记录的 { $dur } s 守时（holdover）达到 { $te } ns 的钟差，并且没有在该范围内恢复。

js-meankind-holdovertest-big-recovered = 对照模板衡量，该记录的 { $dur } s 守时（holdover）达到 { $te } ns 的钟差，并在 GNSS 恢复后 { $recover } s 恢复。

js-meankind-holdovertest-line = 对照模板衡量，绝不表示某个系统符合要求；这两个时间是操作人员的声明。

js-meankind-holdovertest-line-masks = { $masks }。对照模板衡量，绝不表示某个系统符合要求；这两个时间是操作人员的声明。

js-meankind-impairment-big = 该检测器区分受损信号与干净信号，曲线下面积为 { $auc }（1 为完美）。

js-meankind-impairment-line = 在与其训练集不同的情形下，得分为 { $auc }。

js-meankind-infra-carrier = 地面站与轨道器之间的整数载波相位固定，在最长的弧段（{ $days } 天）上固定了 { $share } % 的试验。

js-meankind-infra-frame = 若轨道在月球坐标轴中已知，轨道器到地面站的链路使月球基准的最小信息特征值提高 { $x } 倍，并将克拉美-罗迹降至 { $share } %。

js-meankind-infra-geodesy = 四个族合并时，h2、k2 和 l2 分别被确定到其标称值的 { $h2 } %、{ $k2 } % 和 { $l2 } %。

js-meankind-infra-od = 月球轨道上的星载地球 GNSS 定轨精度为 { $gnss } m，独立地面跟踪为 { $ground } m；一致性统计量平均为 { $mean }（预期 { $expected }）。

js-meankind-infra-tail = MODELLED：采用受限模型和示意性输入，不说明任何任务。

js-meankind-infra-tie =
    { $n ->
       *[other] 在扫描 { $n } 个连接误差的过程中，单个航天器上 { $mm } mm 的局部连接把 GNSS、VLBI 和激光测距坐标系连接起来。
    }

js-meankind-inside-spec = 在 { $spec } 以内

js-meankind-instrn-big = 仅靠惯性滑行时，位置误差在 { $dur } 后超过 { $threshold } m。

js-meankind-instrn-dom = 以 { $dominant } 为主。

js-meankind-instrn-line = 超过 { $passes }。

js-meankind-instrn-line-dom = 超过 { $passes }；以 { $dominant } 为主。

js-meankind-instrn-pass = { $dur } 后 { $threshold } m

js-meankind-interop-big-no = 否：月球星历文件无法往返转换。

js-meankind-interop-big-yes = 是：月球星历文件往返转换后完好无损。

js-meankind-interop-line = { $frame } 坐标系中的 { $n } 个状态，{ $time } 时间。

js-meankind-its-spec = 其规格

js-meankind-jointod-big = 加入基于地球的干涉测量时延，使站点位置更精确 { $x } 倍。

js-meankind-jointod-line = 此时站点位置已知到 { $m } m。

js-meankind-launch-big =
    { $n ->
       *[other] 每天有 { $n } 个发射窗口可从纬度 { $lat }° 到达 { $incl }° 的轨道。
    }

js-meankind-launch-line = 地球自转免费提供 { $speed } m/s。

js-meankind-layer-agc = AGC（自动增益控制）

js-meankind-layer-raim = RAIM（接收机自主完好性监测）

js-meankind-layer-sqm = SQM（信号质量监测）

js-meankind-leochain-big = 端到端地看，低轨系统使位置误差从 { $from } m 降到 { $to } m。

js-meankind-leochain-line = 其信号最高以 { $cn0 } dB-Hz 被跟踪。

js-meankind-leopass-big-many = 这些卫星过境高度为 { $elev }°，在截止角之上停留 { $dur }（{ $n } 颗中的第一颗）。

js-meankind-leopass-big-one = 该卫星过境高度为 { $elev }°，在截止角之上停留 { $dur }。

js-meankind-leopass-line = 在峰值处，低轨信号到达时比典型的卫星导航信号强 { $db } dB。

js-meankind-leoppp-big = 采用最大的低轨层时，精密定位在 { $best } min 内收敛，而仅用卫星导航为 { $base } min。

js-meankind-leoppp-line = 每种情形各次运行的中位数，收敛到 { $m } m。

js-meankind-leoppp-line-runs =
    { $n ->
       *[other] 每种情形 { $n } 次运行的中位数，收敛到 { $m } m。
    }

js-meankind-leopvt-doppler-big = 由低轨卫星做多普勒定位，与真值相距 { $m } m（水平）。

js-meankind-leopvt-doppler-line =
    { $n ->
       *[other] 使用了 { $n } 颗卫星。
    }

js-meankind-leopvt-joint-big = 加入低轨层使误差从 { $from } m 降到 { $to } m（3-D 均方根）。

js-meankind-leopvt-joint-line = 几何质量（PDOP）从 { $from } 变为 { $to }。

js-meankind-leopvt-polar-big = 在极点附近，低轨层使几何质量（PDOP）从 { $from } 改善到 { $to }。

js-meankind-leopvt-polar-line =
    { $n ->
       *[other] 跨 { $n } 个纬度。
    }

js-meankind-leopvt-timing-big = 低轨时间传递使最好的时钟保持在 UTC 的 { $ns } ns 以内（均方根）。

js-meankind-leopvt-timing-line =
    { $n ->
       *[other] 已比较 { $n } 种时钟与信号工况。
    }

js-meankind-leosignal-big =
    { $n ->
       *[other] 在 { $n } 种信号设计中，{ $best } 的抗压制干扰能力最强：比信号高 { $db } dB。
    }

js-meankind-leosignal-line-fail = 频谱形状检查未通过。

js-meankind-leosignal-line-pass = 频谱形状检查通过。

js-meankind-link-big-closes = 链路可闭合，余量 { $margin } dB。

js-meankind-link-big-open = 链路无法闭合：余量为 { $margin } dB。

js-meankind-link-line = 距离 { $km } km。

js-meankind-link-line-band = { $band } 频段，距离 { $km } km。

js-meankind-link-line-band-rate = { $band } 频段，距离 { $km } km，速率 { $rate } bit/s。

js-meankind-link-line-rate = 距离 { $km } km，速率 { $rate } bit/s。

js-meankind-list-and = { $head }和{ $last }

js-meankind-llr-big = 真实的激光测距将月球坐标系约束到 { $mm } mm。

js-meankind-llr-line = 尺度精确到十亿分之 { $ppb }。

js-meankind-mapmatch-altimeter = 高度计的测量精度为 { $sigma } m。

js-meankind-mapmatch-big = 地图匹配将位置保持在 { $matched } m，而仅用惯性时漂移为 { $free } m。

js-meankind-mapmatch-gravimeter = 重力仪的测量精度为 { $sigma } mGal。

js-meankind-mapmatch-sources = 仅用重力为 { $gravity } m，磁场为 { $magnetic } m，地形为 { $terrain } m。

js-meankind-marspnt-big = { $user }导航仪收敛到 { $m } m（均方根）。

js-meankind-marspnt-line =
    { $n ->
       *[other] 在 { $n } 个历元中，平均有 { $mean } 个中继可见。
    }

js-meankind-moonlight-big = 该服务覆盖了所检查地点和时间的 { $share } %。

js-meankind-moonlight-line =
    { $n ->
       *[other] 可见卫星 { $min } 至 { $n } 颗；几何质量（PDOP）介于 { $pmin } 与 { $pmax } 之间。
    }

js-meankind-navmsg-big =
    { $n ->
       *[other] 一条导航电文可容纳在 { $n } 字节内。
    }

js-meankind-navmsg-cases-big =
    { $n ->
       *[other] 在 { $n } 个工况中，广播轨道的测距误差为 { $min } 至 { $max } mm。
    }

js-meankind-navmsg-cases-line = 空间信号测距误差，均方根。

js-meankind-navmsg-line = 舍入到电文格式会带来 { $mm } mm 的测距误差。

js-meankind-navmsg-midpass-big = 在过境中途更新电文，会使测距跳变最多 { $mm } mm。

js-meankind-navmsg-midpass-line = 限值为 { $mm } mm。

js-meankind-ntn-big = 来自轨道的 5G 定位在 { $signal } 下可达 { $m } m。

js-meankind-ntn-line = 一次过境内的多普勒给出 { $m } m。

js-meankind-obs-big-full = 跟踪 { $dur } 后，轨道变为完全可观测。

js-meankind-obs-big-partly = 在 { $h } h 的弧段内，轨道保持部分可观测。

js-meankind-obs-line = 弧段结束时，秩为 { $rank }（共 { $dim }）。

js-meankind-oem-big = 星历文件往返转换后的位置误差最多为 { $mm } mm。

js-meankind-oem-line =
    { $n ->
       *[other] { $n } 个分段中共 { $states } 个状态。
    }

js-meankind-optical-big-alone = 最佳的单个站点使光链路在 { $best } % 的时间内保持畅通（无云上限 { $ceiling } %）；没有任何无云余量能使其超过 { $ceiling } %。

js-meankind-optical-big-team = 最佳的单个站点使光链路在 { $best } % 的时间内保持畅通（无云上限 { $ceiling } %）；{ $n } 个站点联合，若天气相互独立可达 { $independent } %，按所述相关性则为 { $correlated } %。

js-meankind-optical-line-sites =
    { $n ->
       *[other] 已建模 { $n } 个站点；云气候仅为示意。
    }

js-meankind-optical-line-tech = { $name }：{ $base } % 变为 { $with } %。

js-meankind-opticalrf-big = 光学与射频测距相结合，给出水平 { $h } m、垂直 { $v } m 的保护级。

js-meankind-opticalrf-line-fault = 一致性检验读数为 { $stat }，阈值为 { $threshold }：已标记故障。

js-meankind-opticalrf-line-ok = 一致性检验读数为 { $stat }，阈值为 { $threshold }：未标记故障。

js-meankind-packet-big-no = 否：解码出的数据流与发送的不一致。

js-meankind-packet-big-yes = 是：数据包流可逐位解码还原。

js-meankind-packet-line =
    { $n ->
       *[other] { $n } 个数据包，共 { $octets } 个八位组。
    }

js-meankind-passes-big-day =
    { $n ->
       *[other] 每天 { $n } 次过境，接触时间共 { $dur }。
    }

js-meankind-passes-big-window =
    { $n ->
       *[other] 在 { $hours } 小时的窗口内有 { $n } 次过境，接触时间共 { $dur }。
    }

js-meankind-passes-line = 最佳过境的仰角升至 { $deg }°。

js-meankind-percentile-word = 百分位

js-meankind-pnt-big = 量子套件可将位置和时间保持 { $q }；经典套件为 { $c }。

js-meankind-pnt-classical-label = 守时（holdover），经典套件

js-meankind-pnt-line = 守时（holdover）是指在卫星导航丢失后，各套件（时钟 { $q }，对比时钟 { $c }）保持在 { $spec } 以内的时长。

js-meankind-pnt-quantum-label = 守时（holdover），量子套件

js-meankind-pnt-timing-classical-label = 授时误差，95 %，经典

js-meankind-pnt-timing-quantum-label = 授时误差，95 %，量子

js-meankind-pvt-big =
    { $n ->
       *[other] 在 { $n } 个历元中的 { $solved } 个解出位置，精度 { $rms } m（三维均方根）。
    }

js-meankind-pvt-line = 平均来自 { $mean } 颗卫星，读取自真实接收机测量值。

js-meankind-qnav-big = 中断之后，冷原子导航仪偏离 { $q } m；导航级的偏离 { $c } m。

js-meankind-qnav-big-outage = 在没有卫星的 { $dur } 之后，冷原子导航仪偏离 { $q } m；导航级的偏离 { $c } m。

js-meankind-qnav-line = 在预算之内：{ $q }，对比 { $c }。

js-meankind-qnav-line-threshold = 在 { $threshold } m 之内：{ $q }，对比 { $c }。

js-meankind-qtt-big = 量子时间传递保持 { $q } ps（1 倍标准差），经典链路为 { $c } ns。

js-meankind-qtt-line = 安全监测器检测到 { $pd } % 的攻击。

js-meankind-qtt-line-pfa = 安全监测器在 { $pfa } 的虚警率下检测到 { $pd } % 的攻击。

js-meankind-quantum-link = 量子链路

js-meankind-radiometry-big = 该相机在 { $gsd } m 地面采样距离下达到 NIIRS { $niirs }，信噪比为 { $snr }。

js-meankind-radiometry-line = 奈奎斯特频率处的系统 MTF 为 { $mtf }。

js-meankind-reentry-big = 峰值减速度为 { $g } g，位于 { $km } km 处。

js-meankind-reentry-line = 此时飞行器速度为 { $speed } m/s。

js-meankind-slam-big = 地形匹配结束时偏离 { $matched } m，而仅用惯性时偏离 { $free } m。

js-meankind-slam-line =
    { $n ->
       *[other] 在 { $n } 个航路点上，以 { $sigma } m 的高度计噪声与地形图匹配。
    }

js-meankind-slot-big = 在最后一次卫星定位后 { $dur }，时钟离开其时隙保护。

js-meankind-slot-line = 因此每 { $interval } 需要一次定位，约每天 { $perDay } 次。

js-meankind-solar-big =
    { $n ->
       *[other] 在同一历元放置了 { $n } 个天体。
    }

js-meankind-solar-big-link =
    { $n ->
       *[other] 在同一历元放置了 { $n } 个天体；光从 { $from } 到 { $to } 需要 { $dur }。
    }

js-meankind-solar-line = 共对 { $n } 条链路计时。

js-meankind-spoof-caught = 欺骗干扰（spoofing）在破坏授时指标之前即被捕获。

js-meankind-spoof-caught-both = 两台时钟都在欺骗干扰（spoofing）破坏授时指标之前将其捕获。

js-meankind-spoof-caught-label = 捕获于之后，{ $name }

js-meankind-spoof-caught-thr = 欺骗干扰（spoofing）在破坏 { $thr } ns 授时指标之前即被捕获。

js-meankind-spoof-caught-thr-both = 两台时钟都在欺骗干扰（spoofing）破坏 { $thr } ns 授时指标之前将其捕获。

js-meankind-spoof-detects = { $name }在 { $dur } 后检测到它，偏移为 { $offset } ns。

js-meankind-spoof-missed =
    { $n ->
       *[other] 欺骗干扰（spoofing）在{ $names }捕获它之前就破坏了授时指标。
    }

js-meankind-spoof-offset = 偏移 { $offset } ns

js-meankind-spoofdetect-big-by = 是：欺骗干扰（spoofing）已被捕获，由 { $by } 捕获。

js-meankind-spoofdetect-big-no = 否：融合监测器未能捕获欺骗干扰（spoofing）。

js-meankind-spoofdetect-big-yes = 是：欺骗干扰（spoofing）已被捕获。

js-meankind-spoofdetect-line =
    { $n ->
       *[other] { $n } 个检测层中有 { $on } 个报警。
    }

js-meankind-spoofdetect-line-score =
    { $n ->
       *[other] { $n } 个检测层中有 { $on } 个报警；融合得分为 { $score }。
    }

js-meankind-ssv-formation = 相距 { $km } km 时，滤波器得到的相对位置精度为 { $filter } m RMS，而对两个绝对定位结果作差得到的为 { $absolute } m。

js-meankind-ssv-navigation = 星载滤波器在 GNSS 轨道以内将位置保持在 { $inside } m RMS，在其以上为 { $above } m。

js-meankind-ssv-shell = 在该壳层上，所有星座合计在 { $one } % 的时间内至少有一个信号，在 { $four } % 的时间内至少有四个（L1）。

js-meankind-ssv-tail = MODELLED：几何与链路预算的扫描，不是对空间中任何信号的测量。

js-meankind-ssv-trajectory = 在 { $from } 至 { $to } km 高度上，{ $one } % 的历元至少有一个信号可见，{ $four } % 的历元至少有四个（L1，所有星座）。

js-meankind-station-big = 在南极地区，月球参考站的修正使{ $percentile }误差从 { $from } m 降至 { $to } m（模型计算）。

js-meankind-station-line = 在 { $share } % 的历元中处于精度阈值之内；并非对任何真实系统的陈述。

js-meankind-sweep-big =
    { $n ->
       *[other] 在 { $param } 的 { $n } 个取值上，{ $parts }。
    }

js-meankind-sweep-line = { $param } 从 { $from } 变化到 { $to }。

js-meankind-sweep-line-log = { $param } 以对数刻度从 { $from } 变化到 { $to }。

js-meankind-sweep-part-flat = { $key }{ $metric }保持在 { $value }

js-meankind-sweep-part-goes = { $key }{ $metric }从 { $first } 变为 { $last }

js-meankind-sweep-result-word = 结果

js-meankind-sweepnd-big =
    { $n ->
       *[other] 在 { $keys } 的 { $n } 种组合上，{ $metric }的范围为 { $min } 至 { $max }。
    }

js-meankind-sweepnd-line = 由 { $shape } 次引擎运行组成的网格。

js-meankind-telecom-fail =
    { $n ->
       *[other] 该时钟未通过 { $n } 项电信时间误差检查中的 { $fail } 项。
    }

js-meankind-telecom-line = 对照各行所列的 ITU-T 模板，检查 MTIE（最大时间间隔误差）、TDEV（时间偏差）和守时（holdover）包络。

js-meankind-telecom-line-margin = 对照各行所列的 ITU-T 模板，检查 MTIE（最大时间间隔误差）、TDEV（时间偏差）和守时（holdover）包络。到守时（holdover）包络的最小余量为 { $margin } ns。

js-meankind-telecom-pass =
    { $n ->
       *[other] 该时钟通过全部 { $n } 项电信时间误差检查。
    }

js-meankind-the-best = 最佳的

js-meankind-the-body = 该天体

js-meankind-the-first = 第一个

js-meankind-the-name = { $name }

js-meankind-the-second = 第二个

js-meankind-the-widest-signal = 带宽最宽的信号

js-meankind-timebudget-big = { $clock }的误差与参考系的误差在 { $tau } 的平均时间处相交。

js-meankind-timebudget-line = 在该交叉点，时间误差为 { $x } s。

js-meankind-timeoffset-big = 月球上的时钟每天比地球上的快 { $rate } µs。

js-meankind-timeoffset-line = 已发表的范围为每天 { $low } 至 { $high } µs。

js-meankind-timetransfer-big = { $q }使两个站点保持在 { $qps } ps（均方根）以内；{ $c }为 { $cps } ps 以内。

js-meankind-timetransfer-line = 在 { $q } % 的时间内处于测距指标以内，对比 { $c } %。

js-meankind-timetransfer-line-mm = 在 { $q } % 的时间内处于 { $mm } mm 测距指标以内，对比 { $c } %。

js-meankind-tracking-big = 欺骗干扰源可在最远 { $km } km 外捕获接收机。

js-meankind-tracking-line = 在接收机自身的环路动态下，当干扰源比信号高 { $db } dB 时失锁。

js-meankind-trade-big = 与经典基线相比，量子传感器的授时能力好 { $timing } 倍，惯性导航能力好 { $inertial } 倍。

js-meankind-trade-line = 没有卫星时，量子套件可惯性滑行 { $dur }。

js-meankind-ttbudget-big = 双向偏移为 { $offset } ns，合成不确定度为 { $uncertainty } ns。

js-meankind-ttbudget-line = 萨格纳克 { $sagnac } ns；电离层 { $iono } ns。

js-meankind-ukf-big-no = 否：该滤波器不是自洽的。

js-meankind-ukf-big-yes = 是：该滤波器是自洽的。

js-meankind-ukf-line-in = 其归一化新息平方的平均值为 { $mean }，处于 { $low } 至 { $high } 的 95 % 区间之内。这检查的是一致性，而不是精度。

js-meankind-ukf-line-in-seeds =
    { $n ->
       *[other] 其归一化新息平方在 { $n } 个随机种子（seed）上的平均值为 { $mean }，处于 { $low } 至 { $high } 的 95 % 区间之内。这检查的是一致性，而不是精度。
    }

js-meankind-ukf-line-out = 其归一化新息平方的平均值为 { $mean }，处于 { $low } 至 { $high } 的 95 % 区间之外。这检查的是一致性，而不是精度。

js-meankind-ukf-line-out-seeds =
    { $n ->
       *[other] 其归一化新息平方在 { $n } 个随机种子（seed）上的平均值为 { $mean }，处于 { $low } 至 { $high } 的 95 % 区间之外。这检查的是一致性，而不是精度。
    }

js-meankind-user-word = 用户

js-meankind-vlbi-big = 在 { $km } km 的基线上，信标信号到达两个测站的时间相差 { $ms } ms。

js-meankind-vlbi-line = 近场修正为 { $us } µs。

js-meankind-vlbifim-big = 按此观测计划，每个测站坐标可确定到 { $m } m。

js-meankind-vlbifim-line = 简单的等份额估计会声称为 { $m } m。

js-meankind-weather-big = 高层大气升温至 { $k } K。

js-meankind-weather-big-ref = 高层大气升温至 { $k } K，参考值为 { $ref } K。

js-meankind-weather-line = 地磁活动指数 ap 为 { $ap }。

js-meankind-whole-run = 在整个运行过程中

js-mthread-bcol-label = 标签

js-mthread-bcol-share = 相对于最大位置项的大小

js-mthread-bcol-sigma = 1 倍标准差

js-mthread-bcol-source = 贡献项

js-mthread-budget-caption = { $phase }：入口处 { $entry }、峰值处 { $peak }、出口处 { $exit } 的 1 倍标准差（位置）；下面是各项贡献，按从大到小排列。

js-mthread-chart-title = { $metric }随任务经过时间的变化，每个阶段一个区段

js-mthread-col-kind = 类型

js-mthread-col-label = 标签

js-mthread-col-limit = 最大贡献项

js-mthread-col-margin = 相对于限值

js-mthread-col-peak-pos = 峰值位置

js-mthread-col-peak-time = 峰值钟差

js-mthread-col-peak-vel = 峰值速度

js-mthread-col-phase = 阶段

js-mthread-col-window = 任务时间

js-mthread-example-not-loaded = 记录的结果未能加载

js-mthread-file-failed = 无法读取 { $name }：{ $reason }。

js-mthread-kv-elapsed = 任务经过时间

js-mthread-kv-engine = 引擎

js-mthread-kv-epoch = 历元（UTC）

js-mthread-kv-limits = 设有限值的阶段

js-mthread-kv-limits-value = { $n }（{ $met } 项达到判据，{ $missed } 项未达到判据）

js-mthread-kv-phases = 阶段

js-mthread-kv-seed = 随机种子（seed）

js-mthread-kv-title = 任务线

js-mthread-layout-phases = 各阶段等宽

js-mthread-layout-time = 真实任务时间

js-mthread-limit-title = { $phase }：所述限值，{ $limit }

js-mthread-log-scale = 对数刻度

js-mthread-margin-met = { $m }× 限值，达到判据

js-mthread-margin-missed = { $m }× 限值，未达到判据

js-mthread-metric-pos = 位置，1 倍标准差

js-mthread-metric-time = 钟差，1 倍标准差

js-mthread-metric-vel = 速度，1 倍标准差

js-mthread-na = 不适用

js-mthread-no-events = 此阶段没有记录事件。

js-mthread-no-phases = 结果中没有阶段

js-mthread-no-requirement = 未说明限值

js-mthread-no-series = 结果中没有此量的采样。

js-mthread-no-weak = 结果中没有指出最薄弱环节。

js-mthread-not-json = 结果不是 JSON（{ $reason }）

js-mthread-not-thread = 这不是任务线结果（应为 schema { $schema }）

js-mthread-note-phases = 每个阶段以相同宽度绘制，使短阶段与长阶段同样清晰可见；每个阶段的起始时间标在区段下方。切换到真实任务时间可看到实际比例。虚线为文件所述的限值；线条中断处为交接。

js-mthread-note-time = 真实任务时间：只有几分钟的阶段可能窄得看不清。切换到等宽可读取它。虚线为文件所述的限值；线条中断处为交接。

js-mthread-open-failed = 无法打开该示例：{ $reason }。

js-mthread-opened = { $name } 已在本页面内读取；没有任何内容被发送到别处。

js-mthread-opening = 正在打开阿尔忒弥斯类示例…

js-mthread-prov = 本页面上的每个标签都出自引擎本身；本页面只是从结果中复制每个数值并按比例缩放。

js-mthread-recorded = 引擎记录的结果（版本 { $version }）：根据公开的任务描述构建的示意链条；这些数值由模型计算得出，不代表任何真实情况。

js-mthread-sets-peak = 决定峰值

js-mthread-too-large = 该文件大于 { $mb } MB；不予读取。

js-mthread-weak-line = 最薄弱环节是阶段 <b>{ $phase }</b>：为其所述限值的 { $margin }×，由 { $source } 决定。余量是所述限值与该阶段峰值之比的最小值；大于 1 即满足要求。

js-mthread-weakest-flag = 最薄弱环节

js-mthread-weakest-mark = 最薄弱环节

js-obs-cell-extent = 北纬 { $south }° 至 { $north }°，东经 { $west }° 至 { $east }°

js-obs-cell-read = { $state }：{ $cell }。采样 { $sampled }，受影响 { $affected }。

js-obs-cell-title = { $state }；采样 { $sampled }，受影响 { $affected }

js-obs-cell-title-reason = { $state }（{ $reason }）；采样 { $sampled }，受影响 { $affected }

js-obs-clear-note = { $notClear }没有条目的单元格被少于 5 架不同的飞机观测到，因而被隐去，不予绘制。颜色绝不是唯一的提示：未观测用斜线填充，表格中也逐一写明每种状态。

js-obs-col-affected = 受影响的飞机

js-obs-col-bbox = 边界框（南、西、北、东）

js-obs-col-bytes = 字节

js-obs-col-cause = 原因

js-obs-col-cell = 单元格（纬度、经度）

js-obs-col-cells = 单元格

js-obs-col-check = 检查

js-obs-col-file = 文件

js-obs-col-incident = 事件

js-obs-col-sampled = 采样的飞机

js-obs-col-sha = SHA-256（清单）

js-obs-col-share = 受影响占比

js-obs-col-state = 状态

js-obs-col-why = 未观测的原因

js-obs-day-alt = 在 { $date }，{ $degraded } 个单元格劣化，{ $notDegraded } 个未劣化，{ $notObserved } 个未观测。

js-obs-day-heading = { $date }（UTC）当天

js-obs-ds-attribution = 署名

js-obs-ds-coverage = 覆盖范围

js-obs-ds-dataset = 数据集

js-obs-ds-licence = 许可

js-obs-ds-licence-address = 许可地址

js-obs-ds-product = 产品

js-obs-ds-written-by = 由 Kshana 写出

js-obs-err-cause = { $name } 给出了“未归因”以外的原因；本页面不显示

js-obs-err-feature-polygon = { $name }：要素 { $n } 不是单元格多边形

js-obs-err-feature-state = { $name }：要素 { $n } 的状态为“{ $state }”，不属于 { $states } 之一

js-obs-err-incident-object = { $name }：事件 { $n } 不是对象

js-obs-err-no-date = { $name } 未给出日期

js-obs-err-no-features = { $name } 没有要素

js-obs-err-no-incidents = { $name } 没有事件列表

js-obs-err-not-day = { $name } 不是 { $schema } 文件

js-obs-err-not-incident = { $name } 不是 { $schema } 文件

js-obs-err-not-json = { $what }不是 JSON（{ $reason }）

js-obs-err-not-manifest = { $name } 不是 { $schema } 文件

js-obs-err-not-object = { $what }不是 JSON 对象

js-obs-err-not-text = { $what }不是文本，或大于 { $mib } MiB

js-obs-err-states = { $name } 列出了本页面所显示的三种状态以外的状态

js-obs-file-matches = 一致

js-obs-file-mismatch = 不一致

js-obs-file-no-hash = 未给出哈希

js-obs-file-not-opened = 未打开

js-obs-files-note = 方法 { $method }。每个文件的 SHA-256 均由此处根据你打开的文件计算，并与清单比对；未打开的文件不会被检查。

js-obs-incident = 事件

js-obs-incident-note = 相接的劣化单元格（含对角相邻）构成一个事件。每个事件的原因均为：未归因。这不是确认，也不是 NOTAM。

js-obs-kv-cells = 已发布的单元格

js-obs-kv-day-wide = 全天范围的影响

js-obs-kv-degraded = 劣化

js-obs-kv-not-degraded = 未劣化

js-obs-kv-not-observed = 未观测（已发布）

js-obs-kv-scope = 范围

js-obs-map-aria = { $summary }下表列出了每个单元格。

js-obs-means-degraded = 该单元格内采样的飞机中，有很高比例当天报告了较低的导航精度，明显高于当天的背景水平。

js-obs-means-not-degraded = 采样的飞机足够多，且占比未达到判定规则。

js-obs-means-not-observed = 数据不足以作出判定。这不等于“正常”。

js-obs-na = 不适用

js-obs-no = 否

js-obs-no-cells = 此文件中没有单元格

js-obs-no-day-file = { $date } 的这些文件中没有日文件（.geojson），因此没有可显示的内容。

js-obs-no-degraded = 当天没有劣化的单元格。

js-obs-no-file-read = 无法读取任何文件。

js-obs-no-incident-file = 当天未打开事件文件。

js-obs-no-manifest = 当天未打开清单，因此无法按哈希检查这些文件。

js-obs-no-notice = 此文件不带声明。本页面顶部的咨询性声明仍然同样适用。

js-obs-no-reason = 未说明原因

js-obs-not-clear = 未观测不等于正常。

js-obs-not-readable = { $name }：不是本页面可读取的文件（.geojson、.incidents.json、.manifest.json 或 .png）。

js-obs-not-stated = 未说明

js-obs-note-day-wide = 这是全天范围有影响的一天：当天的背景水平本身就很高，因此当天无法对任何单元格作出判定。这并不表示天空是干净的。

js-obs-note-summary-mismatch = 文件所述的汇总与其列出的单元格不一致；数值按原文显示。

js-obs-nothing-yet = 暂无可显示的内容：请同时打开当天的 .geojson 文件。

js-obs-notice = 文件所带的声明：{ $notice }

js-obs-opened-day-file = 已从 { $files } 个文件中打开 { $days } 天。已在此处读取；没有上传任何内容。

js-obs-opened-day-files = 已从 { $files } 个文件中打开 { $days } 天。已在此处读取；没有上传任何内容。

js-obs-opened-days-file = 已从 { $files } 个文件中打开 { $days } 天。已在此处读取；没有上传任何内容。

js-obs-opened-days-files = 已从 { $files } 个文件中打开 { $days } 天。已在此处读取；没有上传任何内容。

js-obs-read-failed = { $name }：无法读取（{ $reason }）。

js-obs-reason-day-wide = 当天的背景水平本身就很高，因此当天无法对任何单元格作出判定

js-obs-reason-insufficient = 采样的飞机太少，无法作出判定

js-obs-reason-no-background = 当天没有可用来与该单元格比较的背景

js-obs-release = 不早于 { $when } 发布：产品在当天结束至少 { $hours } 小时之后发布，单元格为 { $deg } 度。这不是实时视图。

js-obs-release-default = 当天结束时间加上延迟

js-obs-show-all = 显示全部 { $n } 个单元格

js-obs-state-degraded = 劣化

js-obs-state-not-degraded = 未劣化

js-obs-state-not-observed = 未观测

js-obs-the-day-file = 日文件

js-obs-the-incident-file = 事件文件

js-obs-the-manifest = 清单

js-obs-too-large = { $name }：大于 { $mib } MiB；请打开较小的文件。

js-obs-unstated-number = 数量未说明的

js-obs-withheld = 已隐去

js-obs-yes-no-call = 是：无法对任何单元格作出判定

js-opt-avail-label = 各站点的可用性、上限和晴空可用性

js-opt-avail-note = 按站点：链路在云和湍流衰落下的可用性、任何额外余量都无法突破的上限（云和指向），以及完全无云时的可用性。

js-opt-avail-title = 可用性与上限对比

js-opt-bar-available = { $name }：可用

js-opt-bar-ceiling = { $name }：上限

js-opt-bar-clear-sky = { $name }：晴空

js-opt-blurb-network = 一个云量较多的北方站点、一个居中的中部站点和一个较晴朗的南方站点，以 30 度仰角观测一个 LEO 光学终端：链路多久可用一次，增加站点能带来什么？

js-opt-blurb-techniques = 云和湍流中仰角 25 度的一条上行链路：换用另一波长、更大的孔径、自适应光学或更多余量，各能带来什么？

js-opt-cloud-episode = 云事件

js-opt-correlated = 相关

js-opt-default-bars = 条形

js-opt-default-chart = 图表

js-opt-direction-wave = { $direction }，{ $wave } 波

js-opt-diversity-label = 网络可用性与站点数量的关系

js-opt-diversity-note = 最佳 1 个、2 个和 3 个站点的可用性，分别按天气相互独立和天气在 { $km } km 范围内相关两种情形。

js-opt-diversity-title = 站点分集

js-opt-fact-capture-loss = 几何捕获损耗

js-opt-fact-direction = 方向

js-opt-fact-elevation = 仰角

js-opt-fact-footprint = 波束覆盖区

js-opt-fact-margin = 无大气时的余量

js-opt-fact-received = 无大气时的接收功率

js-opt-fact-sensitivity = 接收机灵敏度

js-opt-fact-wavelength = 波长

js-opt-gain-points = +{ $n } 个百分点

js-opt-hours = 小时

js-opt-independent = 独立

js-opt-link-down = 链路中断

js-opt-margin-label = 各可用性目标所需的额外余量

js-opt-margin-line-title = { $name }：链路余量，dB

js-opt-margin-note = 在当前链路基础上，各可用性目标所需的额外链路余量，单位 dB；负值表示链路已有的余量超过所需。高于某站点上限的目标，没有任何余量能达到（引擎将其略去）。

js-opt-margin-title = 各可用性目标所需的余量

js-opt-model-output = 模型输出

js-opt-na = 不适用

js-opt-no-data = 此结果中没有数据。

js-opt-no-series = 此结果中没有时间序列。

js-opt-no-source = 未说明来源

js-opt-not-result = 这不是带有站点的光学大气结果

js-opt-open-failed = 无法打开 { $title }：{ $reason }。

js-opt-opening = 正在打开 { $title }…

js-opt-outage-label = 中断持续时间超过某一时长的概率

js-opt-outage-note = 按站点，中断持续时间超过某一时长的概率（时间轴为对数）。

js-opt-outage-title = 中断持续多久

js-opt-point-title = { $name }：{ $xLabel } { $x }，{ $yLabel } { $y }

js-opt-prov = { $label }站点：{ $sites }。

js-opt-realised-up = { $value } 可用

js-opt-recorded = { $title }：引擎记录的结果（版本 { $version }）。是模型输出，不是测量。

js-opt-result-not-json = 结果不是 JSON（{ $reason }）

js-opt-result-not-loaded = 记录的结果未能加载

js-opt-series-label = 链路余量随时间的变化

js-opt-series-note = 所述站点模型的一次带随机种子的实现（随机种子（seed）{ $seed }，{ $hours } h，步长 { $step } s）：云事件、每个云事件对应的液态水柱，以及每步一个闪烁采样。余量为衰落预算减去云衰落与闪烁衰落；低于 0 dB 时链路中断。这只是一次抽样，不是气候：其可用性与所述可用性之间相差该次抽样的采样误差。绘图时余量在 −40 dB 处截断。

js-opt-series-title = 链路余量随时间的变化

js-opt-stated = 所述 { $value }

js-opt-stripe-cloud = 云

js-opt-stripe-down = 中断

js-opt-stripe-title = { $what }，第 { $from } 至 { $to } 小时

js-opt-techniques-label = 各项技术带来的可用性提升

js-opt-techniques-note = 单个站点相对于基线的可用性提升，单位为百分点。

js-opt-techniques-title = 各项技术能带来什么

js-opt-th-availability = 可用性

js-opt-th-ceiling = 上限

js-opt-th-clear-air = 晴空损耗

js-opt-th-cloud-prob = 云概率（输入）

js-opt-th-fade-budget = 衰落预算

js-opt-th-latlon = 纬度、经度

js-opt-th-mean-outage = 平均中断时长

js-opt-th-outages-year = 每年中断次数

js-opt-th-scint = 闪烁指数

js-opt-th-site = 站点

js-opt-timing-label = 各站点与时钟的授时可用性

js-opt-timing-note = 授时误差保持在阈值以内的时间占全部时间的比例，按站点和时钟等级：时钟的守时（holdover）能力对照中断时长。

js-opt-timing-title = 在中断期间保持授时

js-opt-title-network = 三个地面站点，站点分集

js-opt-title-techniques = 一条上行链路，增强技术

js-opt-x-best-n = 最佳 n 个站点

js-opt-x-outage-duration = 中断时长，h（对数）

js-opt-x-target = 可用性目标，%

js-opt-y-availability = 可用性，%

js-opt-y-extra-margin = 额外余量，dB

js-opt-y-p-longer = P(更长)

js-replay-band-calibrating = 校准中

js-replay-band-degraded = 降级

js-replay-band-nominal = 正常

js-replay-band-run-ended = { $band } · 运行已结束

js-replay-band-untrusted = 不可信

js-replay-clock = T+{ $t }，共 { $max }

js-replay-coast-hidden = 海岸线已隐藏：此日志中虚构的位置落在陆地上

js-replay-coast-note = 海岸线：{ $source }，仅作示意。

js-replay-coast-note-hidden = { $reason }。

js-replay-coast-window = Natural Earth 1:10 million，{ $window }窗口

js-replay-coast-world = Natural Earth 1:110 million（Studio 的世界轮廓），较粗略

js-replay-demo-trust-log = { $title }（信任日志）

js-replay-dir-east = 东

js-replay-dir-north = 北

js-replay-dir-south = 南

js-replay-dir-west = 西

js-replay-dirs-and = { $list }和{ $last }

js-replay-drawing-animation = 正在绘制动画…

js-replay-drawing-frames = 正在绘制帧…

js-replay-every-direction = 各个方向

js-replay-file-error = { $name }：{ $error }

js-replay-kinds-convergence-horizontal = 收敛：水平误差中位数

js-replay-kinds-convergence-vertical = 收敛：垂直误差中位数

js-replay-kv-course = 报告的航向角

js-replay-kv-heading = 艏向（陀螺）

js-replay-kv-position-error = 位置误差

js-replay-kv-receiver = 接收机

js-replay-kv-run-time = 运行时间

js-replay-kv-satellites = 使用的卫星数 / 可见卫星数

js-replay-kv-sky = 天空

js-replay-legend = 图例

js-replay-legend-no-fix = 无定位

js-replay-legend-true-track = 真实航迹

js-replay-moment = T+{ $t } 时刻：

js-replay-no-coast = 未绘制海岸线：此窗口没有随附海岸线数据。

js-replay-no-gsv = 此日志中没有 GSV

js-replay-not-json = { $name }：不是 JSON。

js-replay-not-scored = 未评分

js-replay-obs-not-attributed = 未归因

js-replay-open-failed = 无法打开 { $id }：{ $reason }。

js-replay-open-file = 打开文件…

js-replay-opened = 已在面板 { $n } 中打开 { $name }。已在此处读取；没有上传任何内容。

js-replay-opening = 正在打开 { $id }…

js-replay-pause = 暂停

js-replay-play = 播放

js-replay-read-failed = { $name }：无法读取或绘制（{ $reason }）。

js-replay-reading = 正在读取 { $name }…

js-replay-reduced-motion = 已选择减弱动态效果，因此回放从 1x 开始，且不会自动播放。

js-replay-run = 运行

js-replay-run-shown = 面板 { $n } 中显示的运行

js-replay-saved-svg = 已保存 { $name }（{ $size } kB）：所有帧合在一个文件中，绘自与本页面相同的数据行。

js-replay-saved-zip = 已保存 { $name }（{ $size } MB）：每帧一个 SVG、各帧所依据数据行的清单，以及一份 README。

js-replay-src-instructor = 你的文件 { $name }：仅有教员日志时，没有引擎评分，也没有天空。

js-replay-src-trust = 你的文件 { $name }：信任度结果不含天空或艏向，因此不予绘制。

js-replay-status-ready = { $a }和{ $b }：合成运行，由引擎评分。按“播放”，或拖动时钟。

js-replay-status-synthetic = { $titles }：合成运行，由引擎评分。

js-replay-status-synthetic-no-coast = { $titles }：合成运行，由引擎评分。海岸线不可用。

js-replay-strip-label = 运行期间的信任度

js-replay-titles-and = { $a }和{ $b }

js-replay-too-large = { $name } 超出本页面可读取的大小。

js-replay-track = { $n } 条日志行的航迹，上方为北。

js-replay-track-widened = { $n } 条日志行的航迹，上方为北，已扩大范围以显示最近的海岸。

js-replay-verdict = 结论

js-replay-verdict-degraded = 降级 { $dur }，无不可信时段

js-replay-verdict-early = 结论（提前）

js-replay-verdict-fine = 仅依据日志和引擎的评分；是合成数据，仅供参考，不是检测性能数字。

js-replay-verdict-first = 首次低于正常水平在 T+{ $t }

js-replay-verdict-first-after = 首次低于正常水平在 T+{ $t }，即第一个事件开始（T+{ $onset }）之后 { $dur }

js-replay-verdict-first-before = 首次低于正常水平在 T+{ $t }，早于第一个事件的起始（T+{ $onset }）

js-replay-verdict-lowest = 最低信任度评分 { $score }（{ $band }），在 T+{ $t }

js-replay-verdict-never-left = 评分从未离开正常区间

js-replay-verdict-no-fix = 无定位持续 { $dur }

js-replay-verdict-not-scored = 未评分：引擎的信任度评分只针对库中的运行显示

js-replay-verdict-peak-error = 记录到的最大位置误差为 { $err } m，在 T+{ $t }

js-replay-verdict-untrusted = 在不可信区间内 { $dur }

js-replay-verdict-wait = 将在本次运行结束时（T+{ $t }）显示。

js-ssv-altitude-label = 高度与所用测量值

js-ssv-at-least-1 = 至少 1 个信号

js-ssv-at-least-4 = 至少 4 个信号

js-ssv-avail-label = 可用性，{ $band }

js-ssv-bar-title = { $label }，{ $name }：{ $value }{ $unit }

js-ssv-blurb-formation-heo = 高椭圆轨道上相距一公里的一颗主星和一颗副星：滤波器对其相对位置的了解程度，与两个绝对定位结果所能给出的对比。

js-ssv-blurb-heo = 高椭圆轨道（远地点约 58 600 km），配有高增益天底天线和天顶贴片天线以及参数化旁瓣模型：可见信号、最佳 C/N0、主瓣与旁瓣、精度因子（DOP）以及掠过大气层的信号。

js-ssv-blurb-lunar-weak = 一条地月转移轨迹，接收机专为最弱信号而设计：它捕获和跟踪需要什么条件，以及轨迹上有多少部分可供它使用。

js-ssv-blurb-nav-lunar = 地月转移上的星载导航滤波器：其位置误差与其所述界限的对比，分别在 GNSS 卫星自身轨道之下和之上。

js-ssv-blurb-shell = 地球静止高度处的一个球壳，按网格采样：对每个星座以及全部星座合计，在那里的航天器在 L1 和 L5 上以 20 dB-Hz 多久能收到至少一个、至少四个信号？

js-ssv-cn0-altitude-label = 最佳 C/N0 与高度随时间的变化，{ $band }

js-ssv-cn0-label = 最佳 C/N0，{ $band }

js-ssv-cn0-note = 在可见信号中，每个历元最强的一个：各历元中从最小到最大，并标出平均值。

js-ssv-cn0-title = 最佳载噪比密度，{ $band }

js-ssv-comparison-failed = 无法显示比较（{ $reason }）。

js-ssv-comparison-not-loaded = 比较文件未能加载

js-ssv-default-bars = 条形

js-ssv-default-chart = 图表

js-ssv-default-ranges = 范围

js-ssv-deputies-note = 主星的绝对 RMS 为 { $rms } m，历元数 { $epochs }。

js-ssv-deputies-title = 各副星

js-ssv-dop-note = 有定位的各历元上 PDOP 的中位数、第 95 百分位和最差值；若场景设定了大气层，还包括掠过大气层的信号。

js-ssv-dop-title = 精度因子与大气层，{ $band }

js-ssv-err-label = 位置误差与所述界限的对比

js-ssv-err-note = 虚线为滤波器所述的 1 倍标准差界限；实线为其相对于场景已知真值的误差。由引擎抽稀。

js-ssv-err-title = 位置误差与滤波器自身界限的对比

js-ssv-fact-antenna = 天线

js-ssv-fact-apogee = 远地点高度

js-ssv-fact-cn0-threshold = 载噪比密度阈值

js-ssv-fact-duration = 持续时间

js-ssv-fact-eccentricity = 偏心率

js-ssv-fact-grid-points = 网格点数

js-ssv-fact-inclination = 倾角

js-ssv-fact-mode = 模式

js-ssv-fact-perigee = 近地点高度

js-ssv-fact-period = 周期

js-ssv-fact-shell-altitude = 球壳高度

js-ssv-fact-sma = 半长轴

js-ssv-fact-step = 步长

js-ssv-filter = 滤波器

js-ssv-formation-note = 相对位置误差的 RMS，分别来自滤波器和对两个绝对定位结果作差，涵盖整个运行以及 GNSS 轨道之上的部分。

js-ssv-formation-title = 各副星的相对位置

js-ssv-from-absolute = 来自两个绝对定位结果

js-ssv-group-combined = 全部合计

js-ssv-icg-note = { $label }；引擎已提交结果文件的判据级结论（引擎提交 { $commit }）。手册中的表格是公开的；此处没有任何内容为 VALIDATED。

js-ssv-icg-wrong-file = ICG 比较文件不是本页面所读取的那一个

js-ssv-lobe-note = 可用链路中有多少经过主瓣、多少经过旁瓣，由引擎计数。

js-ssv-lobe-title = 主瓣与旁瓣，{ $band }

js-ssv-na = 不适用

js-ssv-nav-note = 已使用和已剔除的测量值、少于四个信号的最长间隔、最终误差，以及太阳辐射压力估计值与场景已知真值的对比。

js-ssv-nav-title = 以数字呈现的运行情况

js-ssv-never = 从未

js-ssv-never-had-four = 从未有过四个

js-ssv-never-had-one = 从未有过一个

js-ssv-no-range = 此结果中没有范围。

js-ssv-no-series = 结果中没有此图表所需的序列。

js-ssv-not-in-variant = 不属于该变体

js-ssv-not-result = 这不是 gnss-ssv 结果

js-ssv-of = { $total } 中的 { $n }

js-ssv-offset = 偏移 { $deg }°

js-ssv-open-failed = 无法打开 { $title }：{ $reason }。

js-ssv-opening = 正在打开 { $title }…

js-ssv-outage-note = 单位为分钟，涵盖整个运行。“从未”表示该组在球壳上任何位置都从未有过那么多信号。

js-ssv-outage-title = 球壳上的最长中断

js-ssv-phases-note = 滤波器在整个运行以及其两个部分上的统计量。位置 NEES 的平均值接近 3，说明滤波器所述的界限与其误差一致。

js-ssv-phases-title = 按阶段的位置误差

js-ssv-point-title = { $name }：{ $xLabel } { $x }，{ $yLabel } { $y }

js-ssv-range-title = { $label }：最小 { $min }，平均 { $mean }，最大 { $max } { $unit }

js-ssv-range-value = { $min } 至 { $max }

js-ssv-recorded = { $title }：引擎记录的结果（版本 { $version }）。

js-ssv-relative-label = 相对位置误差

js-ssv-result-not-json = 结果不是 JSON（{ $reason }）

js-ssv-result-not-loaded = 记录的结果未能加载

js-ssv-row-acquires = 可捕获至

js-ssv-row-carrier = 载波跟踪至

js-ssv-row-code = 码跟踪至

js-ssv-row-coherent = 相干积分

js-ssv-row-delay-mean = 延迟，平均

js-ssv-row-detection = 检测阈值

js-ssv-row-false-alarm = 每个单元的虚警概率

js-ssv-row-final-error = 最终位置误差

js-ssv-row-gap = 最长间隔

js-ssv-row-gated = 被剔除的测量值

js-ssv-row-grazing = 掠过 100 km 以下

js-ssv-row-limb-links = 穿过临边的链路

js-ssv-row-loss-mean = 损耗，平均

js-ssv-row-lost = 因大气层而丢失

js-ssv-row-pdop-median = PDOP，中位数

js-ssv-row-pdop-p95 = PDOP，第 95 百分位

js-ssv-row-pdop-worst = PDOP，最差

js-ssv-row-plasma-mean = 等离子体层 TEC，平均

js-ssv-row-search-cells = 搜索单元

js-ssv-row-search-time = 搜索时间

js-ssv-row-srp-est = 太阳辐射压力，估计值

js-ssv-row-srp-truth = 太阳辐射压力，真值

js-ssv-row-stec-mean = 斜向 TEC，平均

js-ssv-row-tangent = 切点高度，最小至最大

js-ssv-row-tracking = 所用的跟踪阈值

js-ssv-row-used = 已使用的测量值

js-ssv-series-altitude = 高度/1000

js-ssv-series-altitude-name = 高度

js-ssv-series-best-cn0 = 最佳 C/N0

js-ssv-series-error = 误差

js-ssv-series-measurements = 测量值

js-ssv-series-note = 所有星座合计数量的一条抽稀序列。引擎不写出各星座的序列，因此不予绘制。

js-ssv-series-signals = 可见信号

js-ssv-series-signals-label = 可见信号随时间的变化，{ $band }

js-ssv-series-stated-bound = 所述界限

js-ssv-series-title = 沿轨道的信号与最佳 C/N0，{ $band }

js-ssv-shell-avail-note = 在网格点和时刻中，有至少一个信号、至少四个信号高于 { $cn0 } dB-Hz 的占比。

js-ssv-shell-avail-title = 球壳上的可用性，{ $band }

js-ssv-tangent-value = { $min } 至 { $max } km

js-ssv-th-above-absolute = GNSS 之上：来自绝对定位，m

js-ssv-th-above-filter = GNSS 之上：滤波器，m

js-ssv-th-band-group = 频段与分组

js-ssv-th-bar = 判据

js-ssv-th-baseline = 基线，km

js-ssv-th-common-4 = 有 4 个共同信号的历元

js-ssv-th-common-mean = 平均共同信号数

js-ssv-th-compares = 所比较的内容

js-ssv-th-deputy = 副星

js-ssv-th-epochs = 历元

js-ssv-th-group = 分组

js-ssv-th-main-lobe = 主瓣链路

js-ssv-th-nees = 位置 NEES 平均值

js-ssv-th-phase = 阶段

js-ssv-th-pos-p95 = 位置第 95 百分位，m

js-ssv-th-pos-rms = 位置 RMS，m

js-ssv-th-quantity = 量

js-ssv-th-rel-absolute = 相对 RMS，来自绝对定位，m

js-ssv-th-rel-filter = 相对 RMS，滤波器，m

js-ssv-th-rel-vel = 相对速度 RMS，m/s

js-ssv-th-run1-cells = 运行 1：容差内的单元

js-ssv-th-run1-verdict = 运行 1 结论

js-ssv-th-sidelobe = 旁瓣链路

js-ssv-th-sidelobe-share = 旁瓣占比

js-ssv-th-value = 值

js-ssv-th-variant = 变体（诊断用，GLONASS 参考角取自表 4.2）

js-ssv-th-vel-rms = 速度 RMS，m/s

js-ssv-th-with-4 = 有 4 个或更多信号

js-ssv-th-without-1 = 无 1 个信号的最长时间

js-ssv-th-without-4 = 无 4 个信号的最长时间

js-ssv-title-formation-heo = 编队，高椭圆轨道

js-ssv-title-heo = 高椭圆轨道

js-ssv-title-lunar-weak = 地月转移，弱信号接收机

js-ssv-title-nav-lunar = 星载滤波器，地月转移

js-ssv-title-shell = 36 000 km 处的球壳

js-ssv-traj-avail-note = 有至少一个、至少四个信号高于 { $cn0 } dB-Hz 的历元占比。

js-ssv-traj-avail-title = 沿轨迹的可用性，{ $band }

js-ssv-transmit-pattern = 发射方向图：{ $pattern }

js-ssv-unit-signals = 个信号

js-ssv-unknown-mode = 此 gnss-ssv 结果的模式为“{ $mode }”，本页面不读取

js-ssv-variant-met = { $total } 项中 { $n } 项将达到判据

js-ssv-variant-not-met = { $total } 项中 { $n } 项仍未达到判据

js-ssv-view-note = 各历元中可见数量从最小到最大，并标出平均值。

js-ssv-view-title = 可见信号，{ $band }

js-ssv-weak-note = 接收机设计所需的条件，由引擎根据所述积分计算得出。

js-ssv-weak-title = 弱信号接收机

js-ssv-x-minutes = 分钟

js-ssv-y-altitude-measurements = 高度，千 km；已使用的测量值

js-ssv-y-cn0-altitude = dB-Hz；高度，千 km

js-ssv-y-position-log = 位置，米（对数）

js-ssv-y-signals-all = 可见信号，所有星座

js-t35data-ai-q-bench-export = 为实验室仿真器导出某个场景的运动与事件

js-t35data-ai-q-compliance-rows = 这些运行为公开框架的哪些条目提供证据支持（supports evidence for）？

js-t35data-ai-q-evidence-pack = 检查或制作某个信任事件的证据包

js-t35data-ai-q-interference-route = GNSS 在哪些地方看起来受到了劣化，这条路线有多少处于其中？

js-t35data-ai-q-iq-recordings = GNSS IQ 录制（场景、捕获、跟踪、前端、测评活动）

js-t35data-ai-q-osnma-satellites = 此接收机数据流认证了哪些 Galileo 卫星的导航数据（OSNMA）？

js-t35data-ai-q-run-scenario = 运行或解释某个 PNT 场景（轨道、GNSS、授时、融合、月球）

js-t35data-ai-q-training-nmea = 我需要带有压制干扰（jamming）、拖离、时间欺骗干扰或重放事件的合成 NMEA，用于训练

js-t35data-ai-q-trustworthy-log = 这份接收机日志或这艘船的 NMEA 是否可信，又是从何时起不再可信？

js-t35data-ai-tool-osnma-satellites = MCP 上没有：请使用 osnma_verify（此处的 OSNMA 卡片，WebAssembly）、kshana osnma verify（CLI）或 kshana.osnma_verify（Python）

js-t35data-card-evidence-create-title = 创建证据包

js-t35data-card-evidence-create-what = 对接收机日志的一个窗口及引擎据此算出的结果进行签名，使任何人都能核实事后没有任何改动。Studio 可验证证据包。

js-t35data-card-evidence-create-why = 签名需要私钥，而私钥不应经过网页。

js-t35data-card-iq-title = GNSS IQ 监测器与工具

js-t35data-card-iq-what = 构建场景、捕获并跟踪信号、扫描参数、为前端建模、运行 IQ 监测器和测评活动、拟合实验室日志。也可通过 Python 使用，在某个工作文件夹内还可通过 AI 助手工具使用。

js-t35data-card-iq-why = 一份录制有数 GB 的采样。网页容纳不下，而转换、提取和抽稀的命令会改写磁盘上的录制文件。

js-t35data-card-land-title = 供陆上 AIS 检测器使用的陆地多边形下载

js-t35data-card-land-what = 获取一个固定的陆地文件（Natural Earth，公有领域）并检查其 SHA-256。地图构建器则以文本形式接收陆地文件。

js-t35data-card-land-why = 它是唯一会打开网络连接的命令，并且需要系统自带的 curl 和一个明确的标志。

js-t35data-card-marine-title = 海事集成

js-t35data-card-marine-what = Signal K 服务器插件，以及通过 TCP 的门控模式 NMEA 接入的 OpenCPN，把信任度评分放到船员已在使用的软件上；参考构建则把它放到接收机旁的一台小型计算机上。

js-t35data-card-marine-why = 它们是正在运行的实时进程及其 TCP 门控的使用方：部署在船上的计算机上。

js-t35data-card-telemetry-title = 作为安全遥测的信任度

js-t35data-card-telemetry-what = 把信任度数据流（评分、区间、原因）转换为 Prometheus 指标、供 SIEM 使用的 CEF 或 LEEF 格式 syslog 事件，以及 OpenTelemetry。它只读取数据流，绝不改变评估结果。

js-t35data-card-telemetry-why = 它是一个提供指标并向你的监控系统发送数据的进程，因此运行在接收机旁，而不是在网页中。

js-t35data-card-training-stream-title = 向 TCP 或 UDP 地址发送训练数据流

js-t35data-card-training-stream-what = 以实时或更快的速度，把生成的训练数据流发送给舰桥模拟器或海图绘制仪。Studio 的训练页面生成相同的文本，并可让你下载。

js-t35data-card-training-stream-why = 向网络地址发送是浏览器页面不会做的事。该数据流仅为文本，绝不用于船舶的实时导航系统。

js-t35data-feat-ai-ai = MCP 服务器的安装选项，以及每个工具能回答的问题

js-t35data-feat-ai-name = 通过 AI 助手使用（MCP 服务器）

js-t35data-feat-bench-bench = 在此导出某个场景的运动、NMEA、航路点和事件

js-t35data-feat-bench-name = 面向实验室模拟器的测试 bench 导出

js-t35data-feat-compliance-compliance = 在此查看你的运行结果为哪些框架条目提供证据支持（supports evidence for），以及映射表

js-t35data-feat-compliance-name = 对公开韧性框架的 compliance 映射

js-t35data-feat-evidence-evidence = 在此验证证据包并附加时间戳令牌

js-t35data-feat-evidence-name = 已签名的证据包

js-t35data-feat-evidence-why = 创建证据包需要私有签名密钥，而该密钥不应经过网页。证据包通过命令行、Python 或 AI 助手工具制作。

js-t35data-feat-interference-map-interference = 打开地图文件，或在此根据 CSV 构建地图，并对照地图检查某条路线

js-t35data-feat-interference-map-name = 干扰地图（ADS-B 和 AIS）与路线暴露

js-t35data-feat-iq-name = GNSS IQ 监测器与工具（场景、捕获、跟踪、扫描、前端、监测、测评活动）

js-t35data-feat-iq-why = 一份录制有数 GB 的采样，网页容纳不下，而且有些命令会改写磁盘上的录制文件。浏览器版本没有 IQ 功能。

js-t35data-feat-jammertest-jammertest = 导入某份日志时间跨度对应的计划，或按每项测试为接收机日志（UBX、RINEX、Android、NMEA 或 Septentrio SBF）评分：检测延迟、漏检、虚警、恢复时间；MODELLED

js-t35data-feat-jammertest-name = Jammertest 作为裁判：以已发布的测试计划作为排定的真值，并据此为接收机日志评分（0.38）

js-t35data-feat-live-gate-name = 实时信任度数据流、门控与监听器（stdin、文件、TCP、UDP、--gate、--listen）

js-t35data-feat-live-gate-why = 它是处于数据路径上的运行中进程。网页在完成后就会返回，无法为海图绘制仪一直保持套接字打开，也无法在实时数据流中把某个定位标记为无效。Studio 改为以相同的实时格式对一段有限的节选评分，不带门控。

js-t35data-feat-machines-imufit = 根据静止 IMU 日志，拟合混合与融合场景的加速度计和陀螺仪参数；MODELLED

js-t35data-feat-machines-name = 接收机与传感器输入：RTKLIB .pos、NovAtel OEM7、RTCM 3 MSM、GNSS-SDR、用于艏向的 IMU，以及用于混合与融合场景的 IMU 拟合（0.38）

js-t35data-feat-machines-trust = 在通用的接收机信任度运行中打开上述任一格式的日志（以及可选的 IMU 文件）；NovAtel 自身的干扰标志会与 Kshana 的报警进行比较

js-t35data-feat-marine-name = 海事集成：Signal K 插件与 OpenCPN

js-t35data-feat-marine-why = 它们使用正在运行的实时进程及其 TCP 门控，因此是部署在船上计算机上的，网页无法运行它们。

js-t35data-feat-maritime-trust-name = 移动船舶的海事信任度评分（0 至 100，附原因）

js-t35data-feat-maritime-trust-trust = 打开一个结果或一次实时 JSON-lines 运行，查看航迹、评分、原因和门控；在此对 NMEA 日志评分

js-t35data-feat-nmea-training-name = 带教员日志的 NMEA 训练数据流

js-t35data-feat-nmea-training-training = 在此生成数据流及其教员日志，下载它们，并运行教员复盘

js-t35data-feat-osnma-name = Galileo OSNMA 验证（UBX SFRBX 输入）

js-t35data-feat-osnma-osnma = 加载一个已录制的文件，查看逐颗卫星、逐个标签的认证状态

js-t35data-feat-telemetry-name = 遥测导出：Prometheus 指标、syslog CEF 和 LEEF、OpenTelemetry

js-t35data-feat-telemetry-why = 它从运行中的数据流提供指标、发送 syslog 并导出 OpenTelemetry：这是一个与你的监控系统通信的进程，网页做不到。

js-t35data-feat-training-stream-name = 向 TCP 或 UDP 地址推送训练数据流

js-t35data-feat-training-stream-why = 它向网络地址发送，而网页不会这样做。Studio 生成文本，由你下载。

js-t35data-page-ai = 通过你的 AI 助手使用

js-t35data-page-bench = 测试 bench 导出

js-t35data-page-cli = 命令行功能

js-t35data-page-compliance = compliance 映射

js-t35data-page-evidence = 证据包

js-t35data-page-geometry = 几何：天空图、天际线与 DOP

js-t35data-page-imufit = IMU 拟合

js-t35data-page-interference = 干扰地图

js-t35data-page-jammertest = Jammertest 评分

js-t35data-page-osnma = OSNMA 验证

js-t35data-page-training = 训练复盘

js-t35data-page-trust = 海事信任度

js-t35data-sample-iq-help = IQ 命令列表

js-t35data-sample-telemetry-cef = 演示运行的 CEF 格式 syslog

js-t35data-sample-telemetry-leef = 演示运行的 LEEF 格式 syslog

js-t35data-sample-telemetry-metrics = 演示运行的 Prometheus 指标

js-tools-ai-group-engine = 安装引擎及其库

js-tools-ai-group-integrations = 海事、插件和仪表板集成

js-tools-ai-group-mcp = 为你的助手安装 MCP 服务器

js-tools-ai-heading = 通过你的 AI 助手使用 Kshana

js-tools-ai-install-mcp = 安装 MCP 服务器

js-tools-ai-intro = Kshana MCP 服务器让 AI 助手运行引擎，而不是凭空猜测数值。它运行在你的计算机上；不会向 Kshana 发送任何内容。请选择适合你工具的方式。

js-tools-ai-load-failed = 安装选项未能加载（{ $reason }）。请参阅 MCP 服务器的文档。

js-tools-ai-mcp-docs = MCP 服务器文档

js-tools-ai-more-ways = 更多安装方式

js-tools-ai-none-listed = 此版本中没有列出安装选项。

js-tools-ai-other-ways = 安装 Kshana 的其他方式

js-tools-ai-read-agent-guide = 阅读智能体指南

js-tools-ai-rule = 每个回答都适用的规则：由助手运行引擎，并报告工具返回的结果及其单位和证据等级（与外部参考基准（oracle）核对一致，或由模型计算得出）、场景、随机种子和引擎版本，使该运行可以重复。结果自身的限制说明始终随结果一起保留。MCP 服务器不会在某个需主动开启的文件夹之外读写任何文件。

js-tools-ai-what-to-ask = 可以问什么，由哪个工具回答

js-tools-ai-where-reachable = 各项能力可通过哪里使用

js-tools-bench-files-written =
    { $n ->
       *[other] 已向浏览器内存写入 { $n } 个文件
    }

js-tools-bench-note = 仅含运动和带标签的事件区间。下载后可加载到实验室模拟器中。

js-tools-bench-wrong-kind = { $name } 是 { $kind } 场景。{ $kinds } 类场景有飞行器轨迹；其他类别会说明为何没有。

js-tools-building-report = 正在生成报告…

js-tools-choose-catalogue-first = 请先选择目录 JSON。

js-tools-choose-file-first = 请先选择一个文件。

js-tools-choose-imu-log = 请先选择一份静止 IMU 日志。

js-tools-choose-pack-first = 请先选择证据包的文件。

js-tools-choose-pack-first-above = 请先选择证据包的文件（见上）。

js-tools-choose-plan-file = 请至少选择一个计划文件。

js-tools-choose-receiver-log = 请先选择接收机日志。

js-tools-choose-result-first = 请先至少选择一个结果文件（*.result.json）。

js-tools-choose-scenario-first = 请先选择一个场景。

js-tools-choose-tsr-first = 请先选择时间戳响应（.tsr）。

js-tools-chosen = 已选择

js-tools-col-check = 检查

js-tools-col-detail = 详情

js-tools-col-first-monitors = 最先报警的监测器

js-tools-col-gap-that-stays = 仍然存在的缺口

js-tools-col-last-auth-tag = 最后一个已认证的标签（Galileo 系统时间）

js-tools-col-latency = 延迟，s

js-tools-col-name = 名称

js-tools-col-outcome = 结果

js-tools-col-question = 问题

js-tools-col-recovered = 已恢复

js-tools-col-reference = 参照

js-tools-col-result = 结果

js-tools-col-row = 条目

js-tools-col-satellite = 卫星

js-tools-col-slot = 时隙，s

js-tools-col-status = 状态

js-tools-col-tags = 标签

js-tools-col-test = 测试

js-tools-col-these-runs = 这些运行

js-tools-col-tool = 工具

js-tools-col-what-is-missing = 缺少什么

js-tools-col-what-it-asks = 它要求什么

js-tools-col-why-not-auth = 未通过认证的原因

js-tools-copied = 已复制

js-tools-copy = 复制

js-tools-copy-command-aria = 复制：{ $cmd }

js-tools-copy-labelled-aria = 复制{ $label }：{ $text }

js-tools-did-not-work = 未成功

js-tools-documentation = 文档

js-tools-download = 下载

js-tools-download-all-zip = 全部下载（zip）

js-tools-download-events-toml = 下载事件（TOML）

js-tools-download-md = 下载（Markdown）

js-tools-download-report-json = 下载报告（JSON）

js-tools-download-report-md = 下载报告（Markdown）

js-tools-download-scorecard-json = 下载评分卡（JSON）

js-tools-download-table-toml = 下载表格（TOML）

js-tools-download-updated-pack = 下载更新后的证据包（zip）

js-tools-download-whole-report-json = 下载完整报告（JSON）

js-tools-engine-lacks-error = 此引擎版本（版本 { $version }）没有 { $need }，因此暂时无法在此运行。已记录的结果和命令行仍然可用。

js-tools-engine-lacks-status = 此引擎版本（版本 { $version }）没有 { $need }：它早于此工具所需的版本。对应的命令行用法见“命令行”标签页。

js-tools-engine-running = 引擎（版本 { $version }）正在此浏览器中运行。不会上传任何内容。

js-tools-engine-starting = 正在此浏览器中启动引擎…

js-tools-engine-unavailable = 引擎无法在此启动（{ $reason }）。打开文件可用；运行这些工具需要 WebAssembly。

js-tools-epoch-format = 请使用 YYYY-MM-DDTHH:MM:SS，可选地以 Z（UTC）结尾。

js-tools-epoch-not-real = 这不是 2000 年至 2099 年之间真实存在的 UTC 时刻。

js-tools-every-check = 每项检查

js-tools-evidence-disclaimer = 证据包是对引擎在所述设置下根据所述日志算出了什么的技术记录。它不是法律意见，不是对任何事件的事实认定，也不是认证。通过表示该记录未被改动。

js-tools-example-pack = 合成示例证据包

js-tools-example-pack-note = 一个合成的证据包，由引擎的命令行根据演示渡轮日志并使用演示密钥制作。密钥已填在下方；真实签名者的密钥由签名者通过其他途径提供。

js-tools-example-pack-tampered = epochs.json 被改动了一个字节的示例证据包

js-tools-example-runs = 合成示例运行

js-tools-example-tampered-note = 证据包中某个文件的一个字节在签名之后被改动。请验证它：检查结果会指出是哪个文件。

js-tools-exporting = 正在导出…

js-tools-field-whole-number = { $field }必须是整数

js-tools-file-not-chosen = { $file } 不在所选文件之中

js-tools-file-too-large = { $name } 大于 64 MiB

js-tools-files-selected = { $label }：{ $files }

js-tools-fingerprint-not-pinned = 签名者指纹：{ $fingerprint }（未固定：使用的是证据包自己指明的密钥）

js-tools-fingerprint-pinned = 签名者指纹：{ $fingerprint }（已固定）

js-tools-fitting = 正在拟合…

js-tools-framework-summary = { $name }：{ $evidenced } 项有证据支持，{ $partly } 项部分有证据支持，{ $notEvidenced } 项无证据支持，{ $outOfScope } 项超出范围

js-tools-fw-dhs-rpcf = US DHS Resilient PNT Conformance Framework，v2.0

js-tools-fw-easa-aviation = EASA 关于航空 GNSS 干扰的指南

js-tools-fw-en-16803 = EN 16803（仅按部分和条款编号）

js-tools-fw-imo-ships = IMO 关于船舶 GNSS 干扰的指南

js-tools-fw-nis2-art21 = 欧盟 NIS2 指令，第 21 条

js-tools-gst-none = 无

js-tools-gst-text = 第 { $week } 周，{ $tow } s

js-tools-how-to-run = 如何运行

js-tools-imu-file-too-large = { $name } 大于 32 MiB；请打开节选。

js-tools-imu-mean-not-number = 静止时的比力不是数字（水平轴为 0，垂直轴约为 9.80665）。

js-tools-imu-notice = { $evidence }：该估计器是在系数已知的合成白噪声日志上检查的，而不是对照外部参考基准（oracle）。表格中给出了该日志的 SHA-256（{ $sha }…）。

js-tools-imu-selected = { $name }（{ $size }），在此读取，绝不上传。

js-tools-jt-events-count = { $n } 个排定事件

js-tools-jt-events-note = 作为排定的真值：是计划的时隙，不是记录下来的实际播发时间。非射频：{ $nonRf }；日志之外：{ $outside }；未知标识：{ $unknown }。

js-tools-jt-guard-hold = 保护间隔 { $guard } s，恢复保持 { $hold } s。

js-tools-jt-guard-hold-overlap = 保护间隔 { $guard } s，恢复保持 { $hold } s。校准基线与某个排定时隙重叠。

js-tools-jt-import-needs-start = 导入需要日志的第一个历元（UTC，ISO 8601），因为计划采用的是当地时间。

js-tools-jt-sel-catalogue = 目录 { $name }

js-tools-jt-sel-log = 日志 { $name }（{ $size }）

js-tools-jt-sel-no-catalogue = 无目录

js-tools-jt-sel-no-log = 无日志

js-tools-jt-sel-no-plan = 无计划

js-tools-jt-sel-plans = { $n } 个计划文件

js-tools-jt-slot-range = { $from } 至 { $to }

js-tools-jt-what-area = 测试区域

js-tools-jt-what-guard = 保护间隔

js-tools-jt-what-hold = 恢复保持

js-tools-jt-what-offset = 相对 UTC 的偏移

js-tools-jt-what-year = 计划年份

js-tools-label-command = 命令

js-tools-label-pinned-command = 固定版本的命令

js-tools-label-settings-example = 设置示例 { $n }

js-tools-loading = 正在加载…

js-tools-max-runs = 最多 { $max } 次运行。

js-tools-merkle-root-format = Merkle 根为 64 位十六进制数字。

js-tools-must-be-number = { $what }必须是数字

js-tools-must-be-whole-zero = { $what }必须是整数，0 表示“未给出”

js-tools-na = 不适用

js-tools-needs = 需要：{ $requires }

js-tools-no = 否

js-tools-none = 无

js-tools-none-in-build = 此版本中没有

js-tools-not-in-browser = 不在浏览器中。

js-tools-not-osnma = 不是 OSNMA 结果

js-tools-not-used = 未使用：{ $item }

js-tools-notes = 说明

js-tools-open = 打开

js-tools-osnma-advisory = 仅供参考：这是分析与监测输出，不是经型式认可的导航设备。此处报告的认证状态不是导航完好性服务，不得作为任何导航或安全决策的唯一依据。

js-tools-osnma-authenticated = 已认证

js-tools-osnma-caption = 逐颗卫星的认证状态

js-tools-osnma-demo-note = 已填入一次性的公钥；按“验证”可在此运行验证器，或显示已记录的结果。

js-tools-osnma-discarded = 已丢弃

js-tools-osnma-events = 验证器所见

js-tools-osnma-examples-missing = 此版本中尚无合成示例

js-tools-osnma-failed = 失败

js-tools-osnma-nma-alert = NMA 状态 { $status }；系统发出了告警消息。

js-tools-osnma-nma-status = NMA 状态 { $status }。

js-tools-osnma-not-json = 这不是 kshana osnma verify --json 的 JSON（需要 overall 和 satellites）。

js-tools-osnma-overall = 总体：{ $status }

js-tools-osnma-pages-read =
    { $n ->
       *[other] 已读取 { $n } 页。
    }

js-tools-osnma-pending = 待定

js-tools-osnma-recorded-failed = 记录的结果未能加载

js-tools-osnma-recorded-result = { $file } 的 kshana osnma verify --json 已记录结果。

js-tools-osnma-tag-counts = 已认证 { $authenticated }，失败 { $failed }，待定 { $pending }，已丢弃 { $discarded }

js-tools-osnma-tag-totals =
    { $n ->
       *[other] { $n } 个标签：已认证 { $authenticated }，失败 { $failed }，待定 { $pending }，已丢弃 { $discarded }。
    }

js-tools-osnma-time-caveat = 时间：每项检查都相对于提供给验证器的各页面的时间戳，而这些时间戳在此来自数据本身，无法防范重放的旧数据。认证说明数据来自该系统；它不说明数据所经信号的任何情况，也不说明定位的质量。

js-tools-osnma-unavailable = 不可用

js-tools-osnma-word-authenticated = 至少有一颗卫星已认证，且没有失败

js-tools-osnma-word-failed = 对某颗卫星数据的检查失败

js-tools-osnma-word-unavailable = 没有任何卫星已认证

js-tools-pack-selected = { $label }：{ $files }（{ $size }）

js-tools-pinned-to-release = 固定到此版本：

js-tools-preview = 预览

js-tools-public-key-format = 公钥为 64 位十六进制数字（32 字节）。不接受其他内容。

js-tools-read-documentation = 阅读文档

js-tools-reading-plan = 正在读取计划…

js-tools-refused-file-name = 已拒绝的文件名：{ $name }

js-tools-run = 运行

js-tools-runs-read =
    { $n ->
       *[other] 已读取 { $n } 次运行：{ $runs }
    }

js-tools-runs-read-engine =
    { $n ->
       *[other] 已读取 { $n } 次运行，由引擎 { $engine } 生成：{ $runs }
    }

js-tools-sample-load-failed = 示例未能加载（{ $reason }）。

js-tools-sample-note = 该命令的真实输出，记录自引擎在合成演示运行上的结果。不是对任何事物的测量。

js-tools-sample-output = 示例输出：{ $label }

js-tools-scenario-list-failed = 场景列表未能加载

js-tools-scoring = 正在评分…

js-tools-select-and-copy = 选择并复制

js-tools-settings-example = 设置示例 { $n }：

js-tools-status-evidenced-label = 这些运行为此条目提供证据支持（supports evidence for）

js-tools-status-evidenced-short = 有证据支持

js-tools-status-not-evidenced-label = 这些运行对此条目没有任何体现

js-tools-status-not-evidenced-short = 无证据支持

js-tools-status-out-of-scope-label = 超出 Kshana 所能展示的范围

js-tools-status-out-of-scope-short = 超出范围

js-tools-status-partly-label = 这些运行为此条目的一部分提供证据支持（supports evidence for）

js-tools-status-partly-short = 部分

js-tools-tab-ai = AI 助手

js-tools-tab-bench = 测试 bench

js-tools-tab-cli = 命令行

js-tools-tab-compliance = compliance

js-tools-tab-evidence = 证据包

js-tools-tab-imufit = IMU 拟合

js-tools-tab-jammertest = Jammertest

js-tools-tab-osnma = OSNMA

js-tools-tele-all-events = 每个历元一个 syslog 事件（默认：每次区间变化一个）

js-tools-tele-file-aria = 结果文件或 JSON-lines 文件

js-tools-tele-fmt-cef = Syslog，CEF

js-tools-tele-fmt-leef = Syslog，LEEF

js-tools-tele-fmt-mqtt = MQTT，Home Assistant 发现（主题、制表符、载荷）

js-tools-tele-fmt-otlp = OpenTelemetry（OTLP JSON）

js-tools-tele-fmt-prometheus = Prometheus 指标

js-tools-tele-format-aria = 格式

js-tools-tele-host = 主机

js-tools-tele-host-aria = 写入 syslog 事件的主机名

js-tools-tele-include-position = 包含所报告的位置（默认关闭）

js-tools-tele-intro = 在此浏览器中，把结果文件（session.result.json）或实时 JSON lines 转换为其中一种格式。需要带有遥测导出功能的引擎版本（0.35 及之后带该导出的版本）；上面的命令在任何地方都可用。

js-tools-tele-note = 此处的 syslog 行不带时间戳（本页面不读取时钟）；命令行工具会加上时间戳。Prometheus 给出最终状态。MQTT 每条消息一行，依次为主题、制表符、载荷；不会从这里发布任何内容。文本与命令打印的相同。

js-tools-tele-run-here = 在此运行

js-tools-that-file-too-large = 该文件大于 64 MiB。

js-tools-token-attached = 令牌已附加

js-tools-token-attached-note = 更新后的证据包在下方。时间戳机构的签名在此处没有被检查：请运行 openssl ts -verify。

js-tools-trust-monitor-sentence = 信任度监测器的结论语句：{ $sentence }

js-tools-two-files-same-name = 有两个文件都名为 { $name }

js-tools-ubx-bad-crc = { $n } 页未通过 CRC 校验。

js-tools-ubx-file = UBX 文件

js-tools-ubx-frames-pages = { $frames } 个 UBX 帧；已解码 { $pages } 页 I/NAV。

js-tools-ubx-ignored-sfrbx = 已忽略 { $n } 条 SFRBX 消息（其他系统、E5b、告警、校验和错误）。

js-tools-ubx-skipped-bytes = 帧与帧之间跳过了 { $n } 字节。

js-tools-ubx-time-conflicts = 有 { $n } 页的时间与其相邻页相冲突。

js-tools-ubx-unstamped = 有 { $n } 页无法确定时间位置。

js-tools-unknown = 未知

js-tools-unused-scenarios = 没有匹配结果的场景文件未被使用：{ $files }。

js-tools-verdict-failed-text = 验证失败。

js-tools-verdict-failed-title = 失败

js-tools-verdict-intact-text = 证据包相对于它自己指明的密钥是完整的，而任何人都可以生成这样的密钥。请通过其他途径向签名者索取其公钥并固定它。

js-tools-verdict-intact-title = 完整，但签名者未固定

js-tools-verdict-verified-text = 证据包未被改动，且由你固定的密钥签名。

js-tools-verdict-verified-title = 已验证

js-tools-verifying = 正在验证…

js-tools-what-failed = 失败的内容

js-tools-why-not-browser = 为何不在浏览器中：

js-tools-yes = 是

js-training-active-events = 当前生效的事件

js-training-band-large = 超过 100 m

js-training-band-medium = 25 至 100 m

js-training-band-small = 小于 25 m

js-training-chart-max = 最大 { $v }

js-training-chart-mean-cn0 = 平均 C/N0

js-training-chart-position-error = 位置误差

js-training-chart-s-reported-minus-true = s，报告值减真值

js-training-chart-satellites = 卫星

js-training-chart-time-offset = 时间偏移

js-training-chart-used-tracked = 使用 / 跟踪

js-training-col-reported = 接收机报告的

js-training-col-true = 真实的

js-training-cue-course = 陀螺艏向和计程仪航速不受任何事件影响。此处报告的航向角与陀螺艏向相差 { $course }。海流也会使艏向与航向角产生差异，因此请与运行开始时对照。

js-training-cue-course-speed = 陀螺艏向和计程仪航速不受任何事件影响。此处报告的航向角与陀螺艏向相差 { $course }，报告的航速与真实航速相差 { $speed } kn。海流也会使艏向与航向角产生差异，因此请与运行开始时对照。

js-training-cue-title = 复盘提示。

js-training-cue-unknown-amount = 未知的量

js-training-debrief-now = 立即复盘

js-training-default-warning = 合成训练数据。仅用于训练和测试：绝不要把此数据流送入船舶的实时导航系统。

js-training-demo-coastal-drag-off = 沿岸拖离

js-training-demo-combined-event = 组合事件

js-training-demo-fjord-degradation = 峡湾自然劣化

js-training-demo-open-sea-jamming = 公海压制干扰（jamming）

js-training-demo-port-time-spoof = 进港时间欺骗干扰（spoofing）

js-training-dl-log-json = 下载教员日志（JSON）

js-training-dl-log-text = 下载教员日志（文本）

js-training-dl-nmea = 下载 NMEA 数据流

js-training-err-demo-open = 无法打开 { $title }：{ $reason }。

js-training-err-engine-old = 此引擎版本（版本 { $version }）没有 NMEA 训练生成器；它早于本页面。命令为 { $command }。

js-training-err-engine-start = 引擎无法在此启动（{ $reason }）。上面的库场景无需引擎仍可打开。

js-training-err-file-not-loaded = 文件未能加载

js-training-err-generate = 无法生成：{ $reason }。

js-training-err-newer-schema = { $name }：schema { $schema } 比本页面所读取的 { $supported } 更新或与之不同。请更新 Studio，而不要去猜测其字段。

js-training-err-no-schema = { $name }：不是 Kshana 训练教员日志（没有 schema 标记）。

js-training-err-no-track = { $name }：该日志没有可绘制的航迹行。

js-training-err-no-usable-rows = { $name }：没有可用的航迹行。

js-training-err-not-json = { $name }：不是 JSON（{ $reason }）。

js-training-err-read = { $name }：无法读取（{ $reason }）。

js-training-err-read-or-draw = { $name }：无法读取或绘制（{ $reason }）。

js-training-err-scenario-not-loaded = 场景文件未能加载

js-training-err-seed = 随机种子必须是整数；留空则使用场景自带的随机种子。

js-training-err-too-large = { $name }：大于 { $max }。本页面可读取不超过该大小的日志。

js-training-err-too-many-rows = { $name }：该日志有 { $count } 个航迹行；本页面最多绘制 { $max } 个。请降低记录频率（log_interval_s），或打开节选。

js-training-err-unknown-schema = { $name }：未知的 schema { $schema }；本页面读取 { $supported }。

js-training-event-n = 事件 { $id }

js-training-event-onset = 起始 { $utc }

js-training-extra-bearing = 实际应用的方位，真方位度数

js-training-extra-peak-accel = 拖离增加的峰值加速度，m/s²

js-training-extra-peak-speed = 拖离增加的峰值速度，m/s

js-training-fact-duration = 持续时间

js-training-fact-events = 注入的事件

js-training-fact-max-error = 最大位置误差

js-training-fact-max-time-offset = 最大时间偏移

js-training-fact-no-fix = 无定位时间

js-training-fact-peak-accel = 峰值加速度，真实 / 报告

js-training-fact-peak-speed = 峰值速度，真实 / 报告

js-training-fact-seed = 随机种子（seed）

js-training-fact-start = 开始（UTC）

js-training-fix-reported-span = 报告有定位，{ $from } 至 { $to }

js-training-generated = 已用引擎 { $version } 生成“{ $title }”：{ $lines } 条 NMEA 语句。合成数据：仅用于训练和测试；绝不要把它送入船舶的实时导航系统。

js-training-generated-here = 由引擎在此生成（“{ $title }”）。合成数据：位置和日期均为虚构。

js-training-generating = 正在启动引擎并生成…

js-training-kind-drag-off = 位置拖离

js-training-kind-jamming = 压制干扰（jamming）

js-training-kind-natural-degradation = 自然劣化（天空被遮挡）

js-training-kind-replay-delay = 重放延迟

js-training-kind-time-spoof = 时间欺骗干扰（spoofing）

js-training-legend-no-fix = 无定位：接收机没有报告任何内容

js-training-legend-reported = 报告值，偏离真值 { $band }

js-training-legend-true = 真实航迹

js-training-library-label = 合成库场景“{ $title }”，由 { $command } 写出。位置和日期均为虚构；不涉及真实船舶或录制数据。

js-training-log-row = 日志行 { $row }（共 { $total }），{ $utc }

js-training-max-error-at = { $m } m，在 T+{ $s } s

js-training-moment-event = （事件 { $id }）

js-training-moment-title = T+{ $s } s { $what }：{ $text }

js-training-moments-shown = 显示共 { $total } 个时刻中的前 { $shown } 个。

js-training-no-events = 无：这是一次无事件的运行。

js-training-no-fix-nothing = 无定位：未报告任何内容

js-training-no-fix-span = 无定位，{ $from } 至 { $to }

js-training-no-moments = 没有记录的时刻。

js-training-none = 无

js-training-none-now = 此刻没有。

js-training-none-reported = 未报告

js-training-north = 北

js-training-not-touched = 不受任何事件影响

js-training-opened = 已打开 { $name }：{ $secs } s 内共 { $rows } 个日志行。

js-training-opening = 正在打开 { $title }…

js-training-param-affect-time = 影响时间

js-training-param-bearing-deg = 方位，真方位度数

js-training-param-cn0-drop-db = C/N0 下降，dB

js-training-param-counterfeit-cn0-dbhz = 伪造的 C/N0，dB-Hz

js-training-param-delay-s = 延迟，s

js-training-param-duration-s = 持续时间，s

js-training-param-final-offset-m = 最终偏移，m

js-training-param-kind = 类型

js-training-param-label = 标签

js-training-param-offset-s = 时间偏移，s

js-training-param-ramp-s = 起始斜坡，s

js-training-param-recovery-s = 恢复斜坡，s

js-training-param-relative-bearing-deg = 相对航向的方位，度

js-training-param-skyline = 天际线

js-training-param-spread-db = 逐卫星离散，dB

js-training-param-start-s = 起始，s

js-training-pause = 暂停

js-training-play = 播放

js-training-reading = 正在读取…

js-training-readout-fix = 有定位

js-training-readout-no-fix = 无定位

js-training-reduced-motion = 已选择减弱动态效果，因此回放从 1x 开始。请使用滑块或方向键移动，无需动画。

js-training-row-cn0 = 平均 C/N0，dB-Hz

js-training-row-cog = 对地航向，度

js-training-row-error = 位置误差，m

js-training-row-fix = 有定位

js-training-row-heading = 艏向（陀螺），度

js-training-row-moments = 时刻

js-training-row-position = 位置

js-training-row-sats = 使用 / 跟踪的卫星

js-training-row-sog = 对地航速，kn

js-training-row-time-offset = 时间偏移，s

js-training-say-active = 生效中：{ $list }

js-training-say-event-id = 事件 { $id }

js-training-say-fix = 接收机报告有定位

js-training-say-mean-cn0 = 平均 C/N0 { $cn0 } dB-Hz

js-training-say-no-fix = 无定位

js-training-say-position-from-true = 报告位置偏离真值 { $m } m

js-training-say-sats-used = 使用了 { $tracked } 颗中的 { $used } 颗卫星

js-training-say-time-ahead = 报告时间比真实时间快 { $s } s

js-training-say-time-behind = 报告时间比真实时间慢 { $s } s

js-training-sky-no-gsv = 无 GSV

js-training-sky-none = 此日志没有天空：仅有教员日志时没有卫星。请打开某个库场景，或在此生成数据流并复盘，以查看其 GSV 所列的卫星。

js-training-skyline-preset = 预设 { $name }

js-training-skyline-stated = 所述剖面

js-training-span-no-fix = T+{ $from } 至 { $to } s

js-training-track-desc = 真实航迹与报告航迹，上方为北。最大位置误差 { $error }。无定位的时段有 { $periods } 段。

js-training-track-end = 终点

js-training-track-start = 起点

js-training-trainer-note = 教员备注

js-training-warn-no-warning-text = 此文件不带警告文字。它是训练日志：不要把其数据流送入实时导航。

js-training-warn-rows-skipped = 有 { $count } 个航迹行无效，已跳过。

js-training-what-fix-lost = 定位丢失

js-training-what-fix-regained = 定位恢复

js-training-what-full-effect = 完全生效

js-training-what-onset = 起始

js-training-what-recovered = 已恢复

js-training-what-recovery-begins = 开始恢复

js-trust-adv-carried = 此文件所带的咨询性声明：

js-trust-adv-none = 此文件不带咨询性声明

js-trust-adv-none-rest = （较早的输出没有）。本页面顶部的咨询性声明仍然同样适用于它。

js-trust-agree-both = 两者都标记：接收机自身的标志与一个 Kshana 监测器

js-trust-agree-calibrating = 处于校准窗口内：不作比较

js-trust-agree-kshana-only = 只有 Kshana 报警：接收机没有标记

js-trust-agree-neither = 两者都不标记

js-trust-agree-receiver-only = 只有接收机标记：没有 Kshana 监测器报警

js-trust-assessed = 已在此浏览器中用引擎 { $version } 评估 { $name }。

js-trust-assessed-as = 已在此浏览器中用引擎将 { $name } 按 { $format } 评估。没有上传任何内容。

js-trust-assessing = 正在启动引擎并评估…

js-trust-class-also-costing = { $class }（同时也在扣分）

js-trust-class-environment = 环境：信号（功率、压制干扰、天空开阔时丢失的卫星）

js-trust-class-geometry = 几何：天空，而非信号

js-trust-class-inconsistency = 不一致：类似攻击，无法由天空或信号解释

js-trust-dl-result-json = 下载结果（JSON）

js-trust-dl-table-csv = 下载逐历元表格（CSV）

js-trust-edge-degraded = { $v } 降级

js-trust-edge-nominal = { $v } 正常

js-trust-err-assess = { $name }：无法评估（{ $reason }）。

js-trust-err-demo-files = 演示文件未能加载

js-trust-err-demo-log-open = 无法打开演示日志：{ $reason }。

js-trust-err-demo-open = 无法打开演示：{ $reason }。

js-trust-err-engine-no-receiver-trust = 此引擎版本（版本 { $version }）没有 receiver_trust。

js-trust-err-engine-no-scorer = 此引擎版本（版本 { $version }）没有日志评分器；它早于本页面。命令为 { $command }。

js-trust-err-engine-start = 引擎无法在此启动（{ $reason }）。

js-trust-err-engine-start-open = 引擎无法在此启动（{ $reason }）。上面打开结果文件仍然可用。

js-trust-err-example-files = 示例文件未能加载

js-trust-err-example-open = 无法打开该示例：{ $reason }。

js-trust-err-file-2mib = { $name }：大于 2 MiB。请打开节选。

js-trust-err-file-too-large = { $name }：大于 { $max }。本页面可读取不超过该大小的文件；请打开节选。

js-trust-err-gen-too-large = { $name }：大于 2 MiB。请打开节选（命令行工具可处理完整日志）。

js-trust-err-imu-format = “{ $format }”不是本页面可读取的 IMU 格式（csv 或 euroc）

js-trust-err-imu-heading = IMU 第一个采样处的艏向不是数字

js-trust-err-log-format = “{ $format }”不是本页面可发送给引擎的日志格式

js-trust-err-no-epochs = 该文件没有历元。

js-trust-err-no-epochs-result = 此结果文件没有 epochs[]。它需要来自针对船舶会话的 `{ $command }`。

js-trust-err-no-epochs-returned = { $name }：引擎没有返回历元。

js-trust-err-no-score-model = 此结果没有 score_model，因此是没有信任度评分的静止平台运行。该视图绘制的是船舶（移动平台）运行。

js-trust-err-not-readable = { $name }：不是本视图可读取的文件（结果 JSON、JSON lines、trust.csv、NMEA 日志或真值文件）。

js-trust-err-nothing-to-draw = 没有可绘制的内容：请选择结果 JSON、JSON lines 或 trust.csv。

js-trust-err-read = { $name }：无法读取（{ $reason }）。

js-trust-err-read-or-draw = { $name }：无法读取或绘制（{ $reason }）。

js-trust-err-score = { $name }：无法评分（{ $reason }）。

js-trust-err-score-file-too-large = { $name }：大于 2 MiB。浏览器内的评分器接收包含五分钟校准窗口的节选。

js-trust-err-score-too-large = { $name }：大于 2 MiB。浏览器内的评分器接收节选（{ $command } 命令可处理完整日志）；请打开包含五分钟校准窗口的节选。

js-trust-err-scorecard-too-large = { $name }：大于 8 MiB；本页面可读取不超过该大小的评分卡。

js-trust-err-session-empty = 会话设置为空。它们声明了船舶（{ $setting }）。

js-trust-err-too-many-epochs = 该文件有 { $count } 个历元；本页面最多绘制 { $max } 个。请打开节选。

js-trust-err-triple-quote = { $what }包含连续三个单引号，无法嵌入设置中

js-trust-err-what-file = 该文件

js-trust-err-what-imu = IMU 文件

js-trust-event-label = 事件：{ $label }

js-trust-event-onset = 起始

js-trust-evt-col-first-alarm = 首次报警，s

js-trust-evt-col-latency = 延迟，s

js-trust-evt-col-onset = 起始，s

js-trust-evt-col-outcome = 结果

js-trust-evt-col-stated = 所述事件

js-trust-fmt-android = Android GNSS Logger（文本）

js-trust-fmt-gnss-sdr = GNSS-SDR 转发的 JSON lines（文本）

js-trust-fmt-nmea = NMEA 0183（文本）

js-trust-fmt-novatel = NovAtel OEM7（ASCII 或二进制）

js-trust-fmt-rinex = RINEX 观测（文本）

js-trust-fmt-rtcm3 = RTCM 3 MSM4 / MSM7（二进制）

js-trust-fmt-rtklib-pos = RTKLIB .pos 解（文本）

js-trust-fmt-sbf = Septentrio SBF（二进制）

js-trust-fmt-ubx = u-blox UBX（二进制）

js-trust-gate-note-derived = 此运行没有门控记录。该条带显示门控本会在何处扣留定位：处于不可信区间的历元，直到离开该区间 30 s 后才放行。这是在此推导的，不是从门控读取的。门控需主动启用，并会增加延迟。

js-trust-gate-note-read = 实时数据流所报告的每个历元的门控：关闭、放行或扣留（该定位在转发的周期中被标记为无效）。

js-trust-gate-now-derived = { $gate } · 推导

js-trust-gate-off = 关闭

js-trust-gate-off-cal = 关闭（校准中）

js-trust-gate-passed = 放行：定位原样转发

js-trust-gate-span = 门控 { $gate }，{ $from } 至 { $to }

js-trust-gate-span-derived = 门控 { $gate }（推导），{ $from } 至 { $to }

js-trust-gate-withheld = 扣留：该定位在下游会被标记为无效

js-trust-gen-chart-label = 引擎对本次运行绘制的图表：载噪比密度、状态和报警随时间的变化

js-trust-gen-epochs = 历元：在 { $window } 个历元的校准窗口之后，{ $nominal } 个正常，{ $degraded } 个降级，{ $untrusted } 个不可信。

js-trust-gen-self-heading = 接收机自身的标志，与 Kshana 的报警对比

js-trust-gen-self-note = 这是一种比较，不是对任何一方的检验：接收机的标志是它自己的报告。

js-trust-geo-deduction-class = { $points } 分（{ $class }）

js-trust-geo-deduction-points = { $points } 分

js-trust-geo-flag-mismatch = 接收机所述的 HDOP 与根据其所报告天空推导出的 HDOP 不一致：几何扣分按不一致计。

js-trust-geo-flag-signal-loss = 信号丢失：视野内的卫星没有被跟踪，尽管其几何良好，因此几何扣分按环境计。

js-trust-geo-heading-label = 几何{ $label }

js-trust-geo-label-fair = { $label }（不计分）

js-trust-geo-label-poor = { $label }（唯一会被扣分的标签）

js-trust-geo-none-in-run = 此运行中没有几何信息（0.36 之前的引擎不写出）。

js-trust-geo-reason-few-satellites = 卫星数少于最低要求

js-trust-geo-reason-high-hdop = HDOP 高于其阈值

js-trust-geo-reason-high-pdop = PDOP 高于其阈值

js-trust-geo-reason-sky-blocked = 被跟踪的卫星在方位角上留下很宽的空缺（天空的一侧被遮挡）

js-trust-geo-row-deduction = 几何扣分

js-trust-geo-row-from = 来源

js-trust-geo-row-gap = 最大方位角空缺

js-trust-geo-row-label = 标签

js-trust-geo-row-open-sky = 开阔天空

js-trust-geo-row-reported-hdop = 接收机所述的 HDOP

js-trust-geo-row-sats-used = 使用的卫星

js-trust-geo-row-sky-age = 天空数据的时效

js-trust-geo-row-status = 状态

js-trust-geo-say-deduction = 几何扣分 { $points } 分

js-trust-geo-say-label-hdop = 几何{ $label }（HDOP { $hdop }）

js-trust-geo-say-mismatch = 所述 HDOP 不一致

js-trust-geo-source-derived = 根据日志所报告的卫星（GSV）推导

js-trust-geo-source-none = 无

js-trust-geo-source-reported = 接收机所述的 DOP（GSA）

js-trust-geo-status-reasons = { $status }：{ $reasons }

js-trust-geo-status-title = 几何{ $status }

js-trust-geo-unknown-no-gsv = 几何未知：日志中没有 GSV 或 GSA

js-trust-geo-unknown-no-gsv-sentence = 几何未知：日志中没有 GSV 或 GSA。

js-trust-geo-unknown-odd = 几何未知（文件给出“{ $odd }”，本页面不认识）。

js-trust-geo-used-of-view = 可见 { $inView } 颗中使用 { $used } 颗

js-trust-got-file-kind = { $name }：{ $kind }

js-trust-got-lines-skipped = { $name } 中有 { $count } 行不是历元，已跳过

js-trust-imu-csv = 带标题行的 CSV

js-trust-imu-euroc = EuRoC MAV imu0 data.csv

js-trust-imu-file = IMU 文件：{ $name }（{ $chars } 个字符）。将用于下一次评估。

js-trust-imu-file-press = IMU 文件：{ $name }（{ $chars } 个字符）。将用于下一次评估；请按“评估所选文件”。

js-trust-imu-none = 没有 IMU 文件。

js-trust-jt-col-latency = 延迟，s

js-trust-jt-col-monitors = 最先报警的监测器

js-trust-jt-col-name = 名称

js-trust-jt-col-outcome = 结果

js-trust-jt-col-recovered = 已恢复

js-trust-jt-col-slot = 时隙，s

js-trust-jt-col-test = 测试

js-trust-jt-label = { $label }保护间隔 { $guard } s，恢复保持 { $hold } s。

js-trust-jt-label-contaminated = { $label }保护间隔 { $guard } s，恢复保持 { $hold } s。校准基线与某个排定时隙重叠。

js-trust-jt-opened = 已打开 { $name }：{ $count } 项测试。已在此处读取；没有上传任何内容。

js-trust-kind-batch-result = 批量结果

js-trust-kind-json-lines = JSON lines

js-trust-kind-nmea-log = NMEA 日志

js-trust-kind-truth-file = 真值文件

js-trust-label-demo = 合成演示：一份虚构的渡轮日志，带有一次虚构的位置拖离，由 Kshana 评分。记录自引擎；该日志是文本，不是测量。

js-trust-label-example = 示意性示例：一份虚构的 NMEA 日志，带有一个 120 s 至 240 s 的虚构干扰源，由引擎在此评估。是文本，不是测量。

js-trust-label-geo-demo = 合成遮挡天空演示：渡轮日志中，天空的西半部自 600 s 起被清空（自然劣化，归因于几何），并且自 1500 s 起出现同样虚构的拖离（类似攻击）。记录自带有 0.36 几何功能的引擎；是文本，不是测量。

js-trust-label-score-demo = 合成演示日志，由引擎在此评分。渡轮日志和拖离均为虚构；是文本，不是测量。

js-trust-legend-calibrating = 校准中（从不评分）

js-trust-legend-class = 扣分类别：

js-trust-legend-class-environment = 环境：信号

js-trust-legend-class-geometry = 几何：天空，而非信号

js-trust-legend-class-inconsistency = 不一致（类似攻击）

js-trust-legend-degraded = 降级

js-trust-legend-demo = 在此演示中，接收机始终报告有效定位（GGA 质量 1，RMC 状态 A）。下降的是评分。

js-trust-legend-geo-degraded = 几何降级

js-trust-legend-geo-good = 几何良好

js-trust-legend-geo-unknown = 几何未知（没有 GSV 或 GSA；不算良好）

js-trust-legend-nominal = 正常

js-trust-legend-self = 接收机自身的标志，与 Kshana 的报警对比：

js-trust-legend-self-both = 两者都标记

js-trust-legend-self-kshana = 仅 Kshana

js-trust-legend-self-neither = 两者都不

js-trust-legend-self-receiver = 仅接收机

js-trust-legend-sky = 天空：

js-trust-legend-true-track = 真实航迹（仅合成数据）

js-trust-legend-underline = 下划线：几何同时也在扣分

js-trust-legend-untrusted = 不可信

js-trust-marks-cleared = 标记已清除。

js-trust-marks-set = { $name } 在 { $count } 个历元中高于其起始阈值；它们已标在时间线和航迹上。

js-trust-mon-agc = 自动增益控制相对其基线发生了变动。

js-trust-mon-clock = 时钟辅助监测器：接收机时钟与其预测直线的对比。

js-trust-mon-cn0-drop = 功率压制：信号强度相对校准基线下降。

js-trust-mon-cn0-rise = 寻找单一发射机的特征：各卫星的信号强度相对基线同时上升。

js-trust-mon-cn0-spread = 寻找单一发射机的特征：各卫星的信号强度相对校准基线同时塌缩。

js-trust-mon-geometry = 卫星几何（0.36）：仅当几何较差时才扣分（HDOP、PDOP 或使用的卫星数超出其阈值），有上限，且不会使评分低于降级区间。

js-trust-mon-heading-course = 在所述的偏流角范围内，将航迹方向与船首所指方向比较。

js-trust-mon-jam-ind = 接收机自身的压制干扰指示。

js-trust-mon-kinematic = 将每一步位置变化与所报告的航速和航向角比较，并与船舶所述的速度、加速度和转向率限值比较。

js-trust-mon-loss-of-lock = 被跟踪卫星的丢失。

js-trust-mon-osnma = 读取所报告的 OSNMA 认证失败。该状态是读取的，未经验证。

js-trust-mon-position-jump = 所报告位置的一步变化大于基线所允许的范围。

js-trust-mon-raim = 接收机自主完好性监测的检验统计量与其阈值的对比。

js-trust-mon-receiver-self-report = 接收机自身的欺骗干扰（spoofing）或压制干扰（jamming）标志（例如 u-blox UBX-SEC-SIG 或 NAV-STATUS spoofDetState），显示在 Kshana 监测器旁边。从日志读取，未经验证；该位置已为 0.38 引擎的监测器预留，一旦结果带有它，就会绘制成条带。

js-trust-mon-sea-level = 检查高度是否处于海面和所述天线高度所决定的位置。

js-trust-mon-solve-failure = 无法计算位置解。

js-trust-mon-speed-log = 在所述的海流容许范围内，将对地航速与对水航速比较。

js-trust-mon-time-consistency = 检查接收机时间是否有不规则的跳变或倒退，对实时数据流还与本机时钟比较。

js-trust-mon-unknown = 本视图没有其说明的监测器（比页面更新）。请把它当作监测器对待。

js-trust-na = 不适用

js-trust-name-colon-text = { $name }：{ $text }

js-trust-never = 从未

js-trust-no = 否

js-trust-no-deduction = 无扣分

js-trust-none = 无

js-trust-north = 北

js-trust-not-stated = 未说明

js-trust-note-advisories = 这些行带有 { $count } 种不同的咨询性声明；显示第一种。

js-trust-note-csv-limits = trust.csv 带有评分和原因，但不含比值或位置。

js-trust-note-live-no-model = 实时数据流不说明运行了哪些监测器，也不说明评分模型；下面的区间边界为文档中的默认值，监测器条带只显示扣了分的监测器。

js-trust-note-nmea-no-match = 没有任何 NMEA 定位能按时间匹配到某个历元。

js-trust-note-nmea-skipped = 有 { $count } 条校验和或字段错误的 NMEA 语句已被跳过。

js-trust-note-skipped-epochs = 有 { $count } 个没有数值 t_s 的历元已被跳过。

js-trust-note-truth-no-match = 真值文件的时间与任何历元都不匹配。

js-trust-note-unknown-state = 有 { $count } 个历元带有本页面不认识的状态（{ $states }）；它们被绘制为校准中，从不评分。

js-trust-offset-at = 在 { $time }，接收机报告的位置距船舶实际所在位置 { $m } m（合成真值）。

js-trust-offset-no-truth = 此时刻没有真实位置。

js-trust-opened = 已打开 { $count } 个历元（{ $source }）。

js-trust-opening-demo = 正在打开合成演示…

js-trust-opening-demo-log = 正在打开合成演示日志…

js-trust-opening-example = 正在打开示意性示例…

js-trust-opening-geo-demo = 正在打开遮挡天空演示…

js-trust-pause = 暂停

js-trust-play = 播放

js-trust-reading = 正在读取…

js-trust-reasons-calibrating = 校准中：最初的若干秒构成基线，从不评分。

js-trust-reasons-class-note = 每项扣分都带有引擎给出的类别：几何（天空）、环境（信号）或不一致（类似攻击）

js-trust-reasons-live-unknown = 实时数据流不说明运行了哪些监测器；此处没有出现的检查可能没有运行。

js-trust-reasons-marked-none = 已标记；此处无扣分

js-trust-reasons-no-score = 此历元没有评分。

js-trust-reasons-no-score-note = 此历元没有评分：{ $note }。

js-trust-reasons-not-run = 未运行（不算通过）

js-trust-reasons-nothing = 此历元没有扣分。这并不能证明定位良好：请参阅下面关于这些检查看不到什么的说明。

js-trust-reasons-pts = { $points } 分

js-trust-reasons-ran-free = 已运行，未扣分

js-trust-reasons-ratio = 比值 { $ratio }

js-trust-reasons-row-title = { $name }：{ $text }点击可标出它高于其起始阈值之处。

js-trust-reasons-weight = 权重 { $weight }

js-trust-reduced-motion = 已选择减弱动态效果，因此回放从 1x 开始。请使用滑块或方向键移动，无需动画。

js-trust-say-gate = 门控 { $gate }

js-trust-say-gate-derived = 门控 { $gate }（推导）

js-trust-say-monitor-points = { $monitor } { $points } 分

js-trust-say-position-from-true = 报告位置偏离真值 { $m } m

js-trust-say-reasons = 原因：{ $list }

js-trust-say-score = 评分 { $score }

js-trust-scored-label = 已在此浏览器中用引擎 { $version } 为 { $name } 的 { $count } 个历元评分。

js-trust-scored-summary = 已用引擎 { $version } 为 { $count } 个历元评分：{ $summary }。仅供参考。

js-trust-scoring = 正在启动引擎并评分…

js-trust-self-code-meaning = { $code }：{ $meaning }

js-trust-self-none-at-time = 此时刻日志中没有接收机标志。

js-trust-self-not-in-log = 日志中没有

js-trust-self-row-flags = 接收机标志

js-trust-self-row-jamming = 接收机压制干扰状态

js-trust-self-row-kshana-alarms = 有 Kshana 监测器报警

js-trust-self-row-spoofing = 接收机欺骗干扰状态

js-trust-self-unknown-agreement = 本页面不认识的一致性结果（{ $odd }）

js-trust-self-yes-state-2 = 是（状态 2 或更高）

js-trust-set-degraded-edge = 降级边界

js-trust-set-degraded-min = 降级，当不低于

js-trust-set-epochs = 历元

js-trust-set-epochs-counts = 共 { $total } 个：{ $calibrating } 个校准中，{ $nominal } 个正常，{ $degraded } 个降级，{ $untrusted } 个不可信。

js-trust-set-epochs-counts-class = 共 { $total } 个：{ $calibrating } 个校准中，{ $nominal } 个正常，{ $degraded } 个降级，{ $untrusted } 个不可信。按扣分类别：几何 { $geometry }，环境 { $environment }，不一致 { $inconsistency }。

js-trust-set-evidence-hold = 证据保持，s

js-trust-set-full-ratio = 达到全部权重时的比值

js-trust-set-geo-counts = 天空：{ $good } 个良好，{ $degraded } 个降级，{ $unknown } 个未知。标签：{ $lgood } 个良好，{ $fair } 个一般，{ $poor } 个较差（只有较差才扣分）。有扣分的历元，类别为几何 { $geometry }，环境 { $environment }，不一致 { $inconsistency }。

js-trust-set-geo-counts-odd = 天空：{ $good } 个良好，{ $degraded } 个降级，{ $unknown } 个未知（其中 { $odd } 个的值本页面不认识，按未知处理）。标签：{ $lgood } 个良好，{ $fair } 个一般，{ $poor } 个较差（只有较差才扣分）。有扣分的历元，类别为几何 { $geometry }，环境 { $environment }，不一致 { $inconsistency }。

js-trust-set-geometry = 几何（[geometry] 设置）

js-trust-set-gloss = 每项检查看什么

js-trust-set-live-geometry = 实时数据流不说明几何阈值；适用文档中的默认值（HDOP 高于 4 或 PDOP 高于 6，或卫星少于 5 颗，即为较差；至多扣 15 分，且不会低于降级区间）。

js-trust-set-no-geometry = 此运行没有几何信息：它来自早于 0.36 的引擎，或来自 trust.csv。不显示任何关于天空的内容，也不会把任何内容显示为良好。

js-trust-set-nominal-min = 正常，当不低于

js-trust-set-onset-ratio = 从该比值起开始扣分

js-trust-set-provenance = 阈值的来源，以及扣分如何分类

js-trust-set-ran = 已运行的检查

js-trust-set-weights = 每项检查的权重，分

js-trust-settings-assumed = 此数据流不说明其评分模型。所示的区间边界为文档中的默认值，是假定的。

js-trust-show-in-replay = 在下方的回放中显示此运行（航迹、评分、接收机自身的标志）

js-trust-sky-no-gsv = 无 GSV

js-trust-sky-none = 没有天空：请连同该运行（或某个演示）一起打开 NMEA 日志，以查看其列出的卫星。

js-trust-span-title = { $what }，{ $from } 至 { $to }

js-trust-state-0 = 未知或未启用

js-trust-state-1 = 无指示

js-trust-state-2 = 有指示

js-trust-state-3 = 多项指示或已确认

js-trust-strip-band = 区间

js-trust-strip-class = 类别

js-trust-strip-gate = 门控

js-trust-strip-marked = 已标记

js-trust-strip-receiver = 接收机

js-trust-strip-sky = 天空

js-trust-strips-none = 此文件中没有监测器比值。

js-trust-strips-note-ran = 统计量与阈值之比；虚线为比值 1 处的报警线

js-trust-strips-note-seen = 仅显示已见到扣分的监测器；比值为相对阈值之比

js-trust-sum-both-flag = 两者都标记

js-trust-sum-epochs-compared = 比较的历元（校准之后）

js-trust-sum-first-kshana = 这些历元中 Kshana 的首次报警

js-trust-sum-first-receiver = 接收机的首次标志

js-trust-sum-jamming-flag = 接收机压制干扰标志（状态 2 及以上）

js-trust-sum-neither = 两者都不

js-trust-sum-only-kshana = 仅 Kshana 报警

js-trust-sum-only-receiver = 仅接收机标记

js-trust-sum-spoofing-flag = 接收机欺骗干扰标志（状态 2 及以上）

js-trust-thr-azimuth-gap = 方位角空缺，度，达到或超过此值时，天空被视为部分遮挡

js-trust-thr-cap-in-force = 此运行中几何扣分最多扣的分数

js-trust-thr-cap-points = 几何扣分最多可扣的分数

js-trust-thr-floor = 仅由几何造成的评分下限（留空：降级区间的边界）

js-trust-thr-floor-in-force = 此运行中仅由几何造成的评分下限

js-trust-thr-full-ratio = 几何扣分达到其上限时的比值

js-trust-thr-hdop-good = HDOP 不高于此值时几何为良好

js-trust-thr-hdop-max = HDOP 高于此值时几何为较差

js-trust-thr-hold = 天空位置和 GSA 在到达后有效的时长，s

js-trust-thr-low-elev = 仰角，度，低于此值丢失的卫星归因于天空

js-trust-thr-min-used = 几何变为较差之前所用卫星数的最小值

js-trust-thr-pdop-good = PDOP 不高于此值时几何为良好

js-trust-thr-pdop-max = PDOP 高于此值时几何为较差

js-trust-thr-reported-rel = 同上，以推导 HDOP 的比例表示

js-trust-thr-reported-tol = 所述 HDOP 与推导 HDOP 之差达到多少即视为二者不一致

js-trust-thr-sigma-uere = 阈值所假定的用户等效测距误差，米

js-trust-thr-used-good = 所用卫星数不少于此值时几何为良好

js-trust-track-desc = { $positions } 个报告位置的航迹，上方为北。有 { $untrusted } 个历元不可信。

js-trust-track-desc-none = 没有航迹：这些文件不含位置。

js-trust-track-desc-truth = { $positions } 个报告位置的航迹，上方为北。有 { $untrusted } 个历元不可信。一条细灰线表示真实航迹。

js-trust-track-end = 终点

js-trust-track-no-positions = 所打开的文件中没有位置

js-trust-track-note = 上方为北，两个坐标轴采用同一比例。线条为接收机所称的船舶位置，按每个历元的信任度区间着色。

js-trust-track-note-none = 此文件不含位置。请加入该运行所用的 NMEA 日志（或带位置的 v1.1 数据流）以绘制航迹。

js-trust-track-start = 起点

js-trust-unknown-agreement = 本页面不认识的一致性结果

js-trust-yes = 是
