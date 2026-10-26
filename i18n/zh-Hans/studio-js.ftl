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
