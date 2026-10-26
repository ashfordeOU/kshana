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
