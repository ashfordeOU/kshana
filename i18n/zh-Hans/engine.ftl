# SPDX-License-Identifier: AGPL-3.0-only
# zh-Hans catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = 未知的时钟日志格式 { $other }；应为以下之一：{ $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = 未知的间隙策略 { $other }；应为 refuse、longest 或 linear

engine-e-clock-log-give-either-the-log-text = 日志文本与其路径只能给出其一，不能同时给出

engine-e-clock-log-clock-log-needs-its-text = 时钟日志需要给出其文本或路径

engine-e-clock-log-tau0-must-be-finite-and = tau0_s 必须为有限值且 > 0（实际为 { $t }）

engine-e-clock-log-units-and-data-apply-to = units 与 data 仅适用于 timelab 格式

engine-e-clock-log-channel-applies-to-the-ticc = channel 仅适用于 ticc 格式

engine-e-clock-log-cannot-read-clock-log = 无法读取时钟日志 { $path }：{ $e }

engine-e-clock-log-clock-log-path-is-not = WebAssembly 构建中不提供时钟日志路径；请以文本形式给出日志

engine-e-clock-log-the-log-has-missing-epoch = { $format } 日志在 { $tau0 } s 网格上有 { $n_gaps } 处间隙，共缺失 { $n_missing } 个历元；设置 gaps = "longest" 可保留最长的无间隙连续段，设置 gaps = "linear" 则进行插值

engine-e-clock-log-the-log-yields-usable-sample = { $format } 日志产生 { $x } 个可用样本；至少需要 3 个

engine-e-clock-log-not-rinex-clock-file-no = 不是 RINEX 钟差文件：没有 END OF HEADER 记录

engine-e-clock-log-the-rinex-clock-file-has = RINEX 钟差文件中没有 AS 或 AR 记录

engine-e-clock-log-the-rinex-clock-file-holds = RINEX 钟差文件包含 { $many } 个时钟；请用 clock = "..." 指定其一（{ $many2 }）

engine-e-clock-log-no-as-or-ar-records = 时钟 { $id } 没有 AS 或 AR 记录

engine-e-clock-log-the-clock-has-single-epoch = 该时钟只有一个历元；无法确定 tau0

engine-e-clock-log-the-log-has-no-readings = { $format } 日志中没有读数

engine-e-clock-log-unknown-phase-unit-expected-ms = 未知的相位单位 { $other }；应为 s、ms、us、ns 或 ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab 第 { $v1 } 行有 { $v } 列，而第一条数据行有 { $first } 列

engine-e-clock-log-timelab-line-has-columns-one = TimeLab 第 { $v1 } 行有 { $v } 列；仅读取一列（数值）或两列（时间 数值）

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab 第 { $v1 } 行不是数值：{ $l }

engine-e-clock-log-the-timelab-log-has-no = timelab 日志中没有读数

engine-e-clock-log-unknown-data-expected-phase-or = 未知的数据类型 { $other }；应为 phase 或 frequency

engine-e-clock-log-tau0-header-is-not-positive = tau0 头部 { $v } 不是以秒为单位的正数

engine-e-clock-log-frequency-data-is-fractional-frequency = 频率数据为相对频率偏差；其单位只能为 1

engine-e-clock-log-two-column-frequency-logs-are = 不读取两列的频率日志；请将频率作为单列并配合 tau0 给出

engine-e-clock-log-unknown-time-units-expected-or = 未知的 time_units { $o }；应为 s 或 mjd

engine-e-clock-log-the-timelab-log-time-column = timelab 日志的时间列必须递增

engine-e-clock-log-single-reading-tau0-cannot-be = 只有一个读数；无法确定 tau0

engine-e-clock-log-the-timelab-log-has-non = timelab 日志有 { $non_finite } 个非有限读数

engine-e-clock-log-the-ticc-log-holds-channels = TICC 日志包含通道 { $many }；请用 channel = "..." 指定其一

engine-e-clock-log-no-readings-on-channel-found = 通道 { $channel } 上没有读数（找到：{ $labels }）

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC 间隔模式的行不含时间；请给出 tau0_s（事件周期）

engine-e-clock-log-the-readings-do-not-increase = { $channel } 读数不递增，因此不是时间戳（不读取 TICC Period 模式的输出；请使用 Timestamp 模式）

engine-e-clock-log-single-time-stamp-tau0-cannot = 只有一个时间戳；无法确定 tau0

engine-e-clock-log-two-time-stamps-apart-under = 两个 { $channel } 时间戳相距 { $w } s，不足 tau0 = { $tau0 } s 的一半

engine-e-clock-log-the-time-stamps-of-go = { $clock } 的 { $format } 时间戳出现倒退（守护进程重启或时钟跳变）；请拆分日志并分别读取各部分

engine-e-clock-log-the-log-has-no-readings-2 = 日志中没有 { $what } 读数

engine-e-clock-log-the-log-holds-sources-name = 日志包含 { $many } 个源；请用 { $selector } = "..." 指定其一（{ $many2 }）

engine-e-clock-log-no-readings-for-found = { $id } 没有 { $what } 读数（找到：{ $names }）

engine-e-clock-log-the-servo-of-never-reached = { $id } 的伺服环从未达到锁定状态 s2

engine-e-clock-log-the-log-has-no-chrony = 日志中没有 chrony 跟踪读数

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = 采样率 { $fs_hz } Hz 不是每毫秒整数个样本

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms 与 noncoherent 必须为正

engine-e-acquisition-the-doppler-grid-needs-positive = 多普勒网格需要正的步长和非负的最大值

engine-e-acquisition-pfa-must-lie-in = pfa 必须位于 (0, 1) 内

engine-e-acquisition-samples-supplied-needed = 已提供 { $samples } 个样本，需要 { $needed } 个

engine-e-acquisition-empty-doppler-grid = 多普勒网格为空

engine-e-acquisition-the-samples-carry-no-power = 样本不含功率

## src/adm.rs

engine-e-adm-unknown-attitude-type = 未知的 ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = AEM 至少需要一个段

engine-e-adm-segment-is-not-version-attitude = 第 { $i } 段：{ $t } 不是版本 { $version } 的姿态类型

engine-e-adm-segment-values-for = 第 { $i } 段：{ $t } 有 { $values } 个值

engine-e-adm-aem-version-has-no-ndm = AEM 版本 1.0 在此没有 NDM/XML 形式；请写为 KVN

engine-e-adm-this-attitude-type-has-no = 该姿态类型没有版本 2.0 形式

engine-e-adm-expected-meta-start-found = 应为 META_START，实际为 { $l }

engine-e-adm-meta-start-without-meta-stop = META_START 缺少 META_STOP

engine-e-adm-unexpected-metadata-line = 意外的元数据行 { $other }

engine-e-adm-in-version-aem = 版本 { $version } 的 AEM 中的 { $att }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }：{ $e }

engine-e-adm-expected-data-start-after-meta = META_STOP 之后应为 DATA_START

engine-e-adm-data-start-without-data-stop = DATA_START 缺少 DATA_STOP

engine-e-adm-empty-data-line = 数据行为空

engine-e-adm-values-on-line = { $att } 行上有 { $vals } 个值：{ $b }

engine-e-adm-unexpected-data-line = 意外的数据行 { $other }

engine-e-adm-attitude-type-has-no-xml = 该姿态类型没有 XML 形式

engine-e-adm-message-without-version-attribute = 消息缺少 version 属性

engine-e-adm-expected-found = 应为 { $vers_key }，实际为 { $other }

engine-e-adm-header-without-creation-date-or = 头部缺少 CREATION_DATE 或 ORIGINATOR

engine-e-adm-missing = 缺少 { $k }

engine-e-adm-unexpected-keyword = 意外的关键字 { $k }

engine-e-adm-spin-block-holds-nutation-or = 自旋块只能包含章动数据或动量数据之一，不能同时包含

engine-e-adm-unexpected-apm-keyword = 意外的 APM 关键字 { $other }

engine-e-adm-unexpected-apm-line = 意外的 APM 行 { $b }

engine-e-adm-without = { $b } 缺少 { $stop }

engine-e-adm-unexpected-line-in = { $b } 中有意外的行：{ $other }

engine-e-adm-incomplete-group = 不完整的组 { $keys }

engine-e-adm-unknown-apm-block-start = 未知的 APM 块 { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM 元数据需要 OBJECT_NAME、OBJECT_ID 和 TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM 缺少 EPOCH

engine-e-adm-rotation-axis = 旋转轴 { $o }

engine-e-adm-values-for = { $t } 有 { $values } 个值

engine-e-adm-euler-record-without-euler-rot = 欧拉记录缺少 EULER_ROT_SEQ

engine-e-adm-rotation-sequence = 旋转序列 { $seq }

engine-e-adm-epoch-has-no = 历元 { $s } 没有 'T'

engine-e-adm-epoch-date = 历元日期 { $date }

engine-e-adm-epoch-time = 历元时间 { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = “{ $s }”（按文档原文）

engine-advanced-report-mean-5th-to-95th-percentile = 均值 { $fmt_num }（第 5 至第 95 百分位：{ $fmt_num2 } 至 { $fmt_num3 }）

engine-advanced-report-field-units-schema-units-entry = 字段单位模式：units 条目 `{ $key }`

engine-advanced-report-field-units-schema-input-entry = 字段单位模式：input 条目 `{ $key }`，按字段名匹配

engine-advanced-report-rows-of-non-numeric-column = 非数值列，共 { $n } 行

engine-advanced-report-rows-from-to = { $nums } 行，从 { $fmt_num } 到 { $fmt_num2 }

engine-advanced-report-phase-ended-by = 阶段 { $name }（结束原因：{ $ended }）

engine-advanced-report-result-timeline-phases = 结果 `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = 移交至阶段 { $phase }：{ $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = 结果 `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = 场景输入 `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = 场景文件注释，第 { $start } 行

engine-advanced-report-scenario-file-comment-lines-to = 场景文件注释，第 { $start } 至 { $v1 } 行

engine-advanced-report-is-modelled-not-validated = { $requirement } 为 MODELLED，未经验证：{ $it }。

engine-advanced-report-sweep-of-scale = { $param } 扫描（{ $str_of }刻度）

engine-e-advanced-report-the-result-document-is-not = 结果文档不是 JSON：{ $e }

engine-e-advanced-report-the-scenario-is-not-toml = 场景不是 TOML：{ $e }

engine-advanced-report-monte-carlo-distribution-of = { $metric } 的蒙特卡罗分布

engine-advanced-report-recorded-at-build-time-from = 构建时记录自环境变量 { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = 未记录：此引擎构建时没有环境变量 { $GIT_COMMIT_ENV }；以引擎版本标识发布版本

engine-advanced-report-the-kind-own-fingerprint-of = { $esc }（该类型自身对场景的指纹；不是文件摘要）

engine-advanced-report-input-file = 输入文件 { $path }

engine-advanced-report-study-generated = { " " }研究由 { $esc } 生成。

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2 第 { $v1 } 行：应为 8 个逗号分隔的列，实际为 { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2 第 { $v1 } 行：{ $what } `{ $p }` 无效

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2 第 { $v1 } 行：非有限值

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2：没有数据行

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2：{ $rows } 行数据未填满其所跨越的 { $n_lat } x { $n_lon } 格网

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2：{ $lat }, { $lon } 处有重复节点

engine-e-altpnt-maps-grid-step-must-be-finite = 网格步长必须为有限正值，实际为 { $step }

engine-e-altpnt-maps-grid-box-must-have-north = 网格范围必须满足 north > south 且 east > west，实际为 [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = { $n_lat } x { $n_lon } 个节点的网格过大

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2：{ $what } 轴至少需要 2 个不同的值

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2：{ $what } 轴不规则（{ $w } 至 { $w2 }，平均步长为 { $step }）

engine-e-altpnt-maps-error-sigma-must-be-finite = 误差 sigma 必须为有限非负值，实际为 { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = 相关长度必须为有限正值，实际为 { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side 必须 >= 2，实际为 { $n }

engine-e-altpnt-terrain-srtm-hgt-length = SRTM .hgt 长度 { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = .hgt 窗口至少需要 2 x 2 个样本，实际为 { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = 步长必须为有限正值，实际为 { $step_deg }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt：未知的 magnetic_grid 列 `{ $other }`（请使用 "sealevel" 或 "upcont"）

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt：无法读取 magnetic_grid csv_path { $csv_path }：{ $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = 未知的动画格式 '{ $other }'；应为 svg、html、frames 或 all

engine-e-animation-no-animation-format-given-expected = 未给出动画格式；应为 svg、html、frames 或 all

engine-e-animation-animation-fps-must-be-between = 动画 fps 必须在 1 到 60 之间，实际为 { $fps }

engine-e-animation-animation-duration-must-be-between = 动画时长必须在 { $lit_0_5 } s 到 600 s 之间，实际为 { $duration_s }

engine-e-animation-animation-width-must-be-between = 动画宽度必须在 480 到 3840 像素之间，实际为 { $width }

engine-e-animation-duration-fps-gives-frames-the = duration x fps 得到 { $n } 帧；帧序列需要在 2 到 { $v1 } 帧之间

engine-e-animation-result-is-not-json = 结果不是 JSON：{ $e }

engine-animation-mission-time = 任务时间（{ $lay }）

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  （需要带 librsvg 构建的 ffmpeg；否则请先将各帧栅格化）

engine-animation-further-series-were-found-but = { " " }另有 { $omitted } 个序列已找到但未绘制（播放器最多显示 { $MAX_CHARTS } 个面板，每个面板最多 { $MAX_TRACES } 条曲线）；它们列在帧导出的清单中。

## src/antenna.rs

engine-antenna-limb-capture-is-reached-on = 在此网格上达到临边捕获（高度 { $a_lo }-{ $a_hi } m × 波束宽度 { $b_lo }-{ $b_hi } deg，{ $points2 } 个点）：{ $points2 } 个采样工作点中有 { $points } 个捕获临边，并定位到 { $crossings } 处轴交叉；所采样的最强临边 J/S 为 { $limb_js_db } dB，位于高度 { $altitude_m } m / 波束宽度 { $hpbw_deg } deg，捕获门限为 { $thr } dB。

engine-antenna-limb-capture-is-not-reached = 在此网格上任何位置均未达到临边捕获（高度 { $a_lo }-{ $a_hi } m × 波束宽度 { $b_lo }-{ $b_hi } deg，{ $points } 个点）：并非捕获量为零，而是没有临边捕获；最佳临边 J/S 为 { $limb_js_db } dB，位于高度 { $altitude_m } m / 波束宽度 { $hpbw_deg } deg，比 { $thr } dB 的捕获门限低 { $shortfall } dB；该工作点在发射功率为 { $limb_capture_tx_power_dbw } dBW 时即可捕获临边，而实际飞行的发射功率为 { $p_tx_dbw } dBW。

engine-e-antenna-azimuths-must-strictly-increase = 方位角必须严格递增

engine-e-antenna-azimuths-must-span-less-than = 方位角跨度必须小于 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = 偏离视轴角必须严格递增

engine-e-antenna-gain-grid-does-not-match = 增益网格与各坐标轴不匹配

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = 增益 K 与 P 必须为有限正值

engine-e-aocs-at-least-three-reaction-wheels = 至少需要三个反作用轮

engine-e-aocs-wheel-spin-axis-must-be = 飞轮 { $i }：自旋轴必须为单位向量

engine-e-aocs-wheel-js-and-max-must = 飞轮 { $i }：js 与 u_max 必须为有限正值

engine-e-aocs-the-wheel-spin-axes-do = 飞轮自旋轴不能张成三维空间

engine-e-aocs-inertia-minus-the-wheels-spin = 惯量减去飞轮自旋惯量后必须为正定

engine-e-aocs-inertia-must-be-finite-and = 惯量必须为有限值且对称

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis 必须为非零有限向量

engine-e-aocs-kind-must-be-finite-and-positive = { $n } 必须为有限正值

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s 至多为 2e6 步

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s 必须为 dt_s 的整数倍

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 与 omega0_rad_s 必须为有限值

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm 必须为有限值

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s 必须为有限值

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s 至少为 dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs：{ $n_w } 个飞轮，{ $duration_s } s 机动，由 { $series_err } deg -> { $settle } | 最终 { $final_err } deg | 飞轮峰值 { $peak_speed } rpm | { $v7 }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = 未知的服务 '{ $other }'（应为 navigation|nav 或 communications|comms）

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = 未知的仲裁策略 '{ $other }'（应为 navigation-priority、communications-priority 或 first-come-first-served）

engine-e-aperture-duty-contact-plan-needs-at-least = 接触计划至少需要一个接触窗口

engine-e-aperture-duty-apertures-must-be = apertures 必须 >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = 报告时间范围必须为有限值

engine-e-aperture-duty-contact-has-non-finite-aos = 接触 '{ $name }' 的 aos_s 或 los_s 为非有限值

engine-e-aperture-duty-contact-must-have-los-aos = 接触 '{ $name }' 必须满足 los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = 接触计划至少需要一个 [[contacts]] 窗口

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle：{ $apertures } 个孔径上共 { $sessions } 个会话，策略 { $policy } -> 导航占空 { $navigation_duty }，通信占空 { $communications_duty }，空闲 { $idle_duty }；请求的 { $total_requested_s } s 中有 { $total_outage_s } s 因争用而损失（MODELLED）

## src/api.rs

engine-api-study-generated = { " " }研究由 { $html_escape } 生成。

engine-e-api-failed-to-serialise-report-to = 无法将报告序列化为 JSON：{ $e }

engine-e-api-invalid-scenario = 场景无效：{ $e }

engine-e-api-clock-log = clock_log：{ $e }

engine-api-unknown-scenario-kind-did-you = 未知的场景类型 { $other }，是否指 { $hint }？`kshana kinds` 列出全部 { $n } 种内置类型。

engine-api-unknown-scenario-kind-kshana-kinds = 未知的场景类型 { $other }。`kshana kinds` 列出全部 { $n } 种内置类型。

engine-api-required-fields = - **必填字段：** { $fields }{ "\u000A" }

engine-api-optional-fields = - **可选字段：** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML 解析错误：{ $e }

engine-api-could-not-classify-scenario-kind = 无法判定场景类型：{ $e }

engine-api-missing-required-field = { $kind_name }：缺少必填字段 — { $options }

engine-api-missing-required-field-2 = { $kind_name }：缺少必填字段 "{ $entry }"

engine-e-api-invalid-orbit-scenario = 轨道场景无效：{ $e }

engine-e-api-sp3-export-requires-an-orbit = SP3 导出需要轨道场景，而不是 '{ $k }'

engine-e-api-omm-export-requires-an-orbit = OMM 导出需要轨道场景，而不是 '{ $k }'

engine-e-api-oem-export-requires-an-orbit = OEM 导出需要轨道场景，而不是 '{ $k }'

engine-e-api-invalid-scenario-toml = 场景 TOML 无效：{ $e }

engine-e-api-could-not-re-serialise-scenario = 无法重新序列化场景：{ $e }

engine-api-scenario-jamming-availability-under-jamming = 场景 { $r } | 压制干扰（jamming）{ $v2 } | 压制干扰下可用性 { $availability_under_jamming }（标称 { $availability_nominal }）| 最小跟踪 { $min_tracking } | 平均 J/S { $v6 }

engine-e-api-the-result-document-already-carries = 结果文档已含 `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = 无法序列化 figure_tiers：{ $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = { $label } 场景无效：{ $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = 场景 { $r } | 量子守时（holdover）{ $holdover_s }s p95 { $pos_p95_m }m | 经典守时（holdover）{ $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = 场景 { $r } | 欺骗干扰（spoofing）{ $scn } 对 { $threshold_ns } ns 指标（P_fa { $target_pfa }）| 量子安全 { $security_fom }（P_md { $analytic_pmd }，MC { $mc_pmd }）{ $det } | 经典安全 { $security_fom2 }（P_md { $analytic_pmd2 }，MC { $mc_pmd2 }）{ $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal = 完好性 | { $n_sats } 颗卫星 | { $samples_total } 个历元中 { $samples_available } 个可用（{ $report }%）| HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V)：{ $report2 } 次完好性事件，{ $report3 } 次 HMI

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | 南极 | { $samples_total } 个历元中 { $samples_available } 个可用（{ $report }%）| AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | 长期 LTC−TT 速率 { $secular_rate_us_per_day } µs/day（范围 { $band_low }–{ $band_high }）| 自身势 { $self_potential_us_per_day } 动力学 { $kinetic_us_per_day } | { $horizon_days } d 时偏移 = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | 基线 { $baseline_km } km | 信标距离 { $beacon_range_km } km | 时延 { $report } µs（速率 { $delay_rate_s_per_s } s/s）| 近场 { $near_field_correction_us } µs | { $horizon_hours } h 内 { $samples } 个样本

engine-api-builtins-lunar-joint-od-clock-sats = lunar-joint-od-clock | { $n_sat } 颗卫星，{ $n_earth } 个地球站 | 测站 3-D 误差：使用 VLBI 为 { $station_pos_err_m } m，仅测距为 { $station_pos_err_m2 } m（锐化 { $station_observability_improvement_factor }×）| 卫星位置 RMS { $sat_pos_rms_m } m | 测站钟差 { $station_clock_err_s } s | 观测 { $n_obs }/{ $n_params } 个参数

engine-api-builtins-lunar-frame-realisation-points-translation = lunar-frame-realisation | { $n_points } 个点 | 平移误差 { $trans_err_norm_m } m，旋转误差 { $rot_err_norm_rad } rad，尺度误差 { $scale_err_ppb } ppb | 残差 rms { $rms_residual_m } m | 收敛 { $converged }

engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } 颗卫星（{ $geometry_label }）| { $n_grid_points } 个点 × { $n_epochs } 个历元 | 覆盖 { $coverage_pct }%（PDOP<{ $pdop_threshold }）| 卫星 { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | 保护级可用性 { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| 星历 { $report }（{ $provenance }）所需 σ_URE { $fmt }，开普勒 { $fmt2 }，摄动 { $fmt3 }（Δ { $fmt4 }）

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | { $n_sats } 颗卫星（示意性 LCNS 类，无隶属关系）| 基线 { $baseline_km } km | 用户误差 { $user_error_uncorrected_m } m → { $user_error_corrected_m } m（降低 { $reduction_factor }×）| HPL { $protection_level_m } m（σ_resid { $residual_sigma_m } m）| MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } 个点 x { $n_epochs } 个历元 x { $n_trials } 次试验 | 可用性 { $v4 } % | 覆盖 { $v5 } %（p{ $percentile } <= { $accuracy_threshold_m } m）| 修正后 p{ $percentile } 3-D { $f }（未修正 { $f2 }）| HPL 最大 { $f3 } | MODELLED；不代表任何真实系统

engine-api-builtins-terrain-horizon-at-the-station = { " " }| 地形地平线（{ $sources }）测站处最大 { $horizon_max_deg } deg，用户点平均最大 { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame = lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } 个状态，OEM { $oem_line_count } 行 | 一致性 { $v5 }（{ $present_fields } 项存在 / { $missing_fields } 项缺失）| OEM 往返 { $v8 } | 时间元数据往返 { $v9 } | KIF { $kif_bytes } 字节 | MODELLED

## src/api/builtins.rs

engine-api-builtins-scenario-optical-sync-rms-ps = 场景 { $r } | 光学 sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | 射频 sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | 量子链路 { $quantum_chain_sigma_s }s，经典 { $classical_chain_sigma_s }s | 保护级 { $protection_level_ns } ns | 安全 Pd { $security_pd }（Pfa { $monitor_pfa }）| 异常 Pd { $anomaly_pd } | 权衡：量子胜出 { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | 中断 { $outage_s }s | 量子定位误差 { $quantum_pos_err_m } m，经典 { $classical_pos_err_m } m（{ $improvement_x }x）| 守时（holdover）量子 { $quantum_holdover_s }s，经典 { $classical_holdover_s }s（门限 { $threshold_m } m）| 权衡：量子胜出 { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC 量子 { $quantum_auc }，经典 { $classical_auc } | 最小可检测故障 量子 { $quantum_min_detectable }，经典 { $classical_min_detectable } | { $fault_catalog } 个故障类别 | 权衡：量子胜出 { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] 仅适用于 fusion 类型

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = 场景 { $r } | 量子 PNT 守时（holdover）{ $pnt_holdover_s }s（时间 { $timing_holdover_s }s/位置 { $position_holdover_s }s）完好性 { $integ } 安全 { $security_na } | 经典 PNT 守时（holdover）{ $pnt_holdover_s2 }s（时间 { $timing_holdover_s2 }s/位置 { $position_holdover_s2 }s）完好性 { $integ2 } 安全 { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = 场景 { $r } | 融合 | 量子 PNT 守时（holdover）{ $pnt_holdover_s }s（时间 { $timing_holdover_s }s/位置 { $position_holdover_s }s）完好性 { $integ } 安全 { $security_na } | 经典 PNT 守时（holdover）{ $pnt_holdover_s2 }s（时间 { $timing_holdover_s2 }s/位置 { $position_holdover_s2 }s）完好性 { $integ2 } 安全 { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = 场景 { $r } | hybrid-ukf（17 状态，MODELLED）| 传感器 { $v2 }（q_va { $effective_q_va }）| 时钟 q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof }，区间 [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof }，区间 [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | 辅助 { $aided_pos_rms_m }m -> 滑行 { $coast_end_pos_rms_m }m，历时 { $coast_duration_s }s | 自洽性，而非精度

engine-api-builtins-scenario-gnss-ins-quantum-outage = 场景 { $r } | gnss-ins | 量子中断期 RMS 融合 { $fused_outage_rms_m }m，自由 { $free_outage_rms_m }m（守时 { $holdover_s }s，可用性 { $availability }）| 经典 融合 { $fused_outage_rms_m2 }m，自由 { $free_outage_rms_m2 }m（守时 { $holdover_s2 }s，可用性 { $availability2 }）

engine-api-builtins-scenario-gnss-sim-mean-iono = 场景 { $r } | gnss-sim | 平均电离层 { $mean_iono_m }m 对流层 { $mean_tropo_m }m | RAIM 可用性 { $raim_availability } 平均 HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m 故障率 { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = 场景 { $r } | spoof-detect | { $n_sats } 颗卫星，+{ $power_advantage_db } dB{ $v4 } | 牵引 { $push } | 融合得分 { $score }（门限 { $fusion_threshold }）| { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = 扫描 { $metric }，参数 { $parameter }（{ $first }..{ $last }，{ $points } 个点，{ $scale }刻度）| 量子 { $first2 }->{ $last2 } | 经典 { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = 场景 { $r } | { $series } 个样本中 { $nominal } 个 GNSS 标称 | 最佳 PDOP { $fnum } 位置 { $posm } | 量子守时（holdover）{ $holdover_s }s p95 { $ns1 }ns 完好性 { $integ } 安全 { $security_na } | 经典守时（holdover）{ $holdover_s2 }s p95 { $ns12 }ns 完好性 { $integ2 } 安全 { $security_na }

engine-e-api-builtins-ephemeris = 星历：{ $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| 最大仰角 { $el }° 峰值多普勒 { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat = 场景 { $r } | { $source } | { $n_samples } 个样本 | 高度 { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | 速度 { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }

engine-api-builtins-generic-sweep-of-over-nodes = `{ $kind }` 的通用扫描，遍历 [{ $keys }] | { $points } 个节点（形状 { $shape }）| 指标 [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | 自由惯性漂移 { $free_inertial_drift_m } m | 重力匹配 { $map_matched_error_m } m | 匹配 sigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| 参考阶次 { $reference_nmax } 异常标准差 { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| 地图误差 MC x{ $realisations } p95 { $matched_error_p95_m } m，{ $target_m } m 内占 { $v3 }%

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | 自由惯性漂移 { $free_inertial_drift_m } m | 地形匹配 { $matched_error_m } m（缩减 { $v3 }x）| 匹配 sigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } 个航路点 | 自由惯性 RMS { $free_inertial_rms_m } m（最终 { $free_inertial_final_m } m）| 地形匹配 RMS { $matched_rms_m } m（最终 { $matched_final_m } m，缩减 { $v6 }x）| 平均 ESS { $mean_ess }/{ $cfg } | 匹配 sigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | 自由惯性漂移 { $free_inertial_drift_m } m | 重力 { $gravity_only_m } m 磁 { $magnetic_only_m } m 地形 { $terrain_only_m } m | FUSED { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] 需要 runs = 1：实测日志只是一条记录

engine-api-builtins-scenario-runs-quantum-holdover-p95 = 场景 { $r } | { $runs } 次运行 | 量子守时（holdover）{ $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns 安全 { $security_na } | 经典守时（holdover）{ $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns 安全 { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = 场景 { $r } | 量子守时（holdover）{ $holdover_s }s p95 { $ns1 }ns 完好性 { $integ } 安全 { $security_na } | 经典守时（holdover）{ $holdover_s2 }s p95 { $ns12 }ns 完好性 { $integ2 } 安全 { $security_na }

engine-api-builtins-raim-available-of-epochs-denied = { " " }| RAIM 可用：{ $n_epochs } 个历元中 { $n_available } 个（{ $n_denied } 个被拒，{ $n_alarm } 次告警；MODELLED）

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = 参考用例至少需要一颗卫星

engine-e-araim-reference-reference-case-needs-at-least-2 = 参考用例至少需要一个星座

engine-e-araim-reference-satellite-names-constellation-but-only = 卫星 { $i } 指定了星座 { $constellation }，但只声明了 { $constellations }

engine-e-araim-reference-satellite-has-non-positive-error = 卫星 { $i } 的误差方差不为正

engine-e-araim-reference-both-integrity-risk-allocations-must = 两个完好性风险分配值都必须为正

engine-e-araim-reference-this-reference-implementation-monitors-single = 此参考实现仅监测单事件故障模式，但该用例的先验要求 N_fault,max = { $nfm }（同时发生的多事件子集）。因此予以拒绝，而不是少计故障模式。

engine-e-araim-reference-the-all-in-view-geometry = 全视场几何奇异

engine-e-araim-reference-no-fault-mode-is-observable = 在此几何下没有可观测的故障模式

engine-e-araim-reference-unknown-reference-vector-known-vectors = 未知的参考向量 '{ $vector }'；已知向量：{ $ids }（或 'all'）

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check：{ $wanted } 个已发布的 WG-C 参考向量；在 { $acceptance_checked } 个验收向量上，最差 VPL/HPL 一致性为 { $worst_acceptance } m，参考自身的 TOL_PL = { $tol } m

engine-e-araim-reference-sat-needs-one-value-per = P_sat 需要每颗卫星一个值，P_const 需要每个星座一个值

engine-e-araim-reference-satellite-names-an-undeclared-constellation = 有卫星指定了未声明的星座

engine-e-araim-reference-every-prior-must-lie-in = 每个先验都必须位于 [0, 1) 内

engine-e-araim-reference-the-priors-need-subsets-of = 先验需要 { $n_fault_max } 个同时事件的子集；此路径至多枚举 { $most } 个

engine-e-araim-reference-the-all-in-view-solution = 未选中全视场解

engine-e-araim-reference-an-add-v4-case-needs = ADD v4.2 用例需要卫星和星座

engine-e-araim-reference-nom-and-sat-need-one = b_nom 与 P_sat 需要每颗卫星一个值

engine-e-araim-reference-const-needs-one-value-per = P_const 需要每个星座一个值

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = 卫星 { $i } 指定了未声明的星座

engine-e-araim-reference-one-constellation-index-per-satellite = 每颗卫星一个星座索引

engine-e-araim-reference-satellite-names-constellation-with-no = 卫星 { $i } 指定了星座 { $c }，但该星座没有 ISM

engine-e-araim-reference-fewer-than-four-satellites-above = 高度截止角以上的卫星少于四颗

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m 必须至少包含一个间距

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW，{ $sense } { $a } dB（范围 { $deficit_band_lo_db }–{ $deficit_band_hi_db }，{ $shown_rounded }×/{ $shown_unrounded }× { $sense }）| 欺骗干扰（spoofing）@{ $value } m { $nearest } W | 覆盖区 { $a2 }% 上限，临边 { $footprint_limb_captured } | 欺骗捕获 { $spoof_captured }（锁定 { $spoof_lock_time_s } s）| 桅杆作用距离 { $a3 } km | OSNMA { $nma_overhead_bps } bit/s（占 50 bit/s 的 { $a4 }%），{ $nma_auth_latency_s } s 时延

engine-attack-surface-reached-crossing-best-db = 已达到（{ $crossings } 处交叉，最佳 { $best_limb_js_db } dB）

engine-attack-surface-not-reached-on-this-grid = 在此网格上未达到（最佳 { $best_limb_js_db } dB，差 { $best_limb_shortfall_db } dB；需要 { $best_limb_capture_tx_power_dbw } dBW，实际 { $p_tx_dbw } dBW）

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| 覆盖区扫描 { $s }x{ $s2 }（高度 { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg），捕获 { $v5 }-{ $v6 }% | 临边 { $limb }

engine-attack-surface-afs-received-dbw = AFS 接收：{ $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = 差额：{ $deficit_db } dB（范围 { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB，{ $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x）

engine-attack-surface-capture-footprint-of-disk-limb = 捕获覆盖区：占圆盘的 { $a }%，临边被捕获：{ $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = 欺骗捕获牵入：{ $spoof_captured }（锁定 { $spoof_lock_time_s } s）

engine-attack-surface-mast-reach-km-osnma-bit = 桅杆作用距离：{ $a } km | OSNMA { $nma_overhead_bps } bit/s（{ $a2 }%）

engine-attack-surface-limb-captured-on-grid-crossing = 临边：在 { $na }x{ $nb } 网格上被捕获，{ $crossings } 处交叉

engine-attack-surface-limb-not-captured-on-grid = 临边：在 { $na }x{ $nb } 网格上未被捕获；需要 { $best_limb_capture_tx_power_dbw } dBW（实际 { $p_tx_dbw }）

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km 必须为有限正值

engine-e-attitude-budget-inertias-must-be-finite-and = 惯量必须为有限正值

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 必须 >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = 至少需要一个指向误差贡献项

engine-e-attitude-budget-contributor-sigma-must-be-finite = 贡献项 '{ $name }' 的 sigma 必须为有限值且 >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget：{ $altitude_km } km，ΔI { $delta_i } kg·m² -> 重力梯度力矩 { $t_gg } N·m；指向 { $total }" RSS（主导项：{ $dominant }）（MODELLED 标量预算）

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } 需要一个值

engine-bench-cli-unknown-option = 未知选项 `{ $a }`

engine-bench-cli-unexpected-argument = 意外的参数 `{ $pos }`

engine-bench-cli-cannot-read = 无法读取 { $p }：{ $e }

engine-bench-cli-cannot-create = 无法创建 { $d }：{ $e }

engine-bench-cli-cannot-write = 无法写入 { $p }：{ $e }

engine-bench-cli-unknown-task-or = 未知任务 `{ $t }`（a、b、c 或 d）

engine-bench-cli-scored-epochs-in-folder = { $folders } 个文件夹中共 { $labels } 个已评分历元

engine-bench-cli-wrote-cases-json-and-truth = 已写入 { $out }/cases.json 和 { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED：此承诺是临时的，其随机种子已暴露；它不是发布用保留集

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH：该随机种子不是此承诺所对应的种子

engine-bench-cli-is-not-json = { $f } 不是 JSON：{ $e }

engine-bench-cli-cannot-read-2 = 无法读取 { $i }：{ $e }

engine-bench-cli-result-rendered = 已渲染 { $results } 个结果

engine-bench-cli-unknown-subcommand =
    未知子命令 `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-cannot-create-an-existing-seed = 无法创建 { $path }（已有的随机种子文件绝不会被覆盖）：{ $e }

engine-bench-cli-cannot-write-2 = 无法写入 { $path }：{ $e }

engine-bench-cli-seed-written-to-keep-it = 随机种子已写入 { $path }：请勿将其纳入版本控制，也不要出现在任何消息中；只有下面的哈希是公开的

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop（沿用，未重新运行）

engine-bench-cli-impairment-eval-baseline = impairment-eval 基线：{ $det }

engine-bench-cli-no-scenario-json-under = { $root } 下没有 scenario.json

engine-bench-cli-is-not-json-2 = { $path } 不是 JSON：{ $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } 项正常，{ $bad } 项不匹配，{ $missing } 项缺失，{ $unpinned } 项未固定

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = 未知划分 `{ $other }`（dev、test 或 holdout）

engine-bench-score-for-is-not-finite = `{ $id }` 的得分不是有限值

engine-bench-case-have-no-score-the = { $missing } 个用例没有得分，第一个是 `{ $first_missing }`

engine-bench-predictions-name-case-that-is = 预测中包含不在真值中的用例：`{ $extra }`

engine-bench-schema-must-be = `schema` 必须为 `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` 必须为 64 位十六进制 SHA-256

engine-bench-truth-is-not-json = 真值不是 JSON：{ $e }

engine-bench-predictions-are-not-json = 预测不是 JSON：{ $e }

engine-bench-truth-schema-must-be = 真值的 `schema` 必须为 `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = 预测的 `schema` 必须为 `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = 真值是按不同于 { $SPEC_VERSION } 的规范版本生成的；不同主版本的结果绝不混用

engine-bench-unknown-task = 未知任务 `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = 结果 { $v1 } 无效：{ $p }

engine-bench-site-result-is-task-holdout-result = 结果 { $v1 } 是任务 (d) 的保留集结果，但没有 `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = 结果 { $v1 } 是基于临时的、已暴露的保留集随机种子评分的：不是发布用保留集

engine-bench-site-result-was-scored-under-this = 结果 { $v1 } 是按 { $v } 评分的；本页对应 { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = `{ $k }` 的得分不是数字

engine-bench-tasks-kshana-receiver-trust-35-default = kshana 接收机信任度 { $s }（{ $lit_0_35 } 默认监测统计量）

engine-bench-tasks-malformed-clock-line = 格式错误的时钟行 `{ $line }`

engine-bench-tasks-the-clock-file-does-not = 该时钟文件与固定的 SHA-256 不符（实际 { $got }，应为 { $C_CLOCKS_SHA256 }）

engine-bench-tasks-satellite-is-not-in-the = 卫星 { $prn } 不在时钟文件中

engine-bench-tasks-kshana-bench-baseline = kshana-bench 基线：{ $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = 预测覆盖 { $pmap } 个用例，真值有 { $tarr } 个

engine-bench-tasks-case-has-no-number-array = 用例 `{ $id }` 没有数字数组

engine-bench-tasks-case-needs-values-has = 用例 `{ $id }` 需要 { $n } 个值，实际有 { $a } 个

engine-bench-tasks-case-has-non-finite-value = 用例 `{ $id }` 含有非有限值

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = 序列化 { $name }：{ $e }

engine-e-bin-crossover-study-write = 写入 { $path }：{ $e }

engine-bin-crossover-study-error-cannot-create = 错误：无法创建 { $dir }：{ $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = 完成：惯性 { $nodes } 个节点，时钟 { $curves } 条曲线（随机种子 42）

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in = { $n } 个用户历元 x 3 个 URA 值，用时 { $dt } s = 每个用户历元 { $v1 } ms（{ $ok } 个可解）

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = 已写入 docs/INTEROP.md（导出表）

## src/bin/validation_report.rs

engine-bin-validation-report-wrote-validation-summary-to = 已将验证摘要写入 { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = 未知天体 '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt 在带地球链路时围绕地球以外的天体导航；此处不支持 { $name }

engine-e-body-pnt-duration-and-step-must-be = duration_s 与 step_s 必须为正，且历元数至多为 20000；实际为 { $duration } 和 { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind 必须为 orbiter 或 surface；实际为 '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = 用户高度必须为正，偏心率必须在 [0, { $lit_0_9 }) 内

engine-e-body-pnt-the-user-orbit-periapsis-is = 用户轨道的近心点低于表面

engine-e-body-pnt-constellation-needs-to-200-satellites = 星座至少在一个轨道面内需要 1 至 200 颗卫星

engine-e-body-pnt-constellation-altitude-must-be-positive = 星座高度必须为正

engine-e-body-pnt-range-sigmas-must-be-positive = 测距 sigma 必须为正

engine-e-body-pnt-no-earth-position-relative-to = 在 JD { $jd } 没有地球相对于 { $name } 的位置

engine-e-body-pnt-serialising-report = 序列化报告：{ $e }

engine-e-body-pnt-the-report-must-serialise-to = 报告必须序列化为 JSON 对象

engine-body-pnt-positioning-around-user-relays-at =
    { $name } 周围的定位 — { $user_kind } 用户，{ $n_relays } 个中继位于 { $r } km，{ $n_epochs } 个历元
    { "  " }地球光行时 { $one_way_light_time_s } s 单程，{ $two_way_light_time_s } s 往返；太阳-地球-天体夹角 { $sun_separation_deg } deg
    { "  " }可用性：仅星座 { $availability_relays }，加地球测距 { $availability_with_earth }（地球可见 { $earth_visibility }）
    { "  " }PDOP 中位数 { $opt }；RMS 误差 仅星座 { $opt2 }，加地球测距 { $opt3 }
    { "  " }形式 sigma 中位数 仅星座 { $opt4 }，加地球测距 { $opt5 }{ "\u000A" }

engine-body-pnt-positioning-around = { $name } 周围的定位

engine-body-pnt-user-relays-earth-light-time = { $user_kind } 用户 · { $n_relays } 个中继 · 地球光行时 { $one_way_light_time_s } s · MODELLED

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = E1 场景不是表

engine-e-calibration-ensembles-e1-scenario-has-no-monte = E1 场景没有 [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1：缺少 final_error.{ $k }

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 为 `scenarios/campaign-monte-carlo-clock-holdover.toml`，共 200 个集合，每个集合 200 次实现，与闭式解对比：均值 0，sigma = { $sigma } ns。集合 j 使用基础随机种子 1 000 000 + 1000 j 和自助法随机种子 20260928 + j。最大相对 ADEV 误差在 E2 为 { $max }，在 E3 为 { $max2 }（跨 1、10 和 100 s）。{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = 结果路径为空

engine-e-campaign-result-path-has-an-empty = 结果路径 `{ $path }` 含有空段

engine-e-campaign-result-path-bad-index-in = 结果路径 `{ $path }`：`{ $part }` 中的索引无效

engine-e-campaign-result-path-no-field = 结果路径 `{ $path }`：没有字段 `{ $name }`

engine-e-campaign-result-path-indexed-value-is = 结果路径 `{ $path }`：被索引的值不是数组

engine-e-campaign-result-path-index-out-of = 结果路径 `{ $path }`：索引 { $i } 超出范围（{ $n }）

engine-e-campaign-result-path-value-is-not = 结果路径 `{ $path }`：值不是数字或标志

engine-e-campaign-result-path-is-not-an = 结果路径 `{ $path }`：`{ $k }` 不是数组

engine-e-campaign-result-path-must-name-one = 结果路径 `{ $path }` 必须指定单个值，而不是多行

engine-e-campaign-result-path-is-not-an-2 = 结果路径 `{ $path }`：`{ $name }` 不是数组

engine-e-campaign-metric-path-has-no-entry = 指标路径 `{ $path }` 在该类型的 units 块中没有条目；请在活动中声明其 `unit`

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` 必须为非空的字母、数字、`_` 或 `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }：活动不能包含活动

engine-e-campaign-serialise = { $label }：序列化：{ $e }

engine-e-campaign-result-did-not-parse = { $label }：结果解析失败：{ $e }

engine-e-campaign-seed-key-no-field-in = 随机种子键 `{ $key }`：场景中没有字段 `{ $part }`

engine-e-campaign-seed-key-is-not-non = 随机种子键 `{ $key }` 不是非负整数

engine-e-campaign-seed-does-not-fit-toml = 随机种子 { $seed } 超出 TOML 整数范围

engine-campaign-time-path-must-name-rows = 时间路径 `{ $t }` 必须用 `[]` 指定多行

engine-campaign-compare-is-not-below-above = compare `{ $c }` 不是 below、above 或 abs_above

engine-campaign-threshold-is-null = 门限 `{ $p }` 为 null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` 不是 mean、min、max 或 count

engine-campaign-time-path-gives-several-values = 时间路径 `{ $t }` 每行给出多个值

engine-campaign-value-path-has-fewer-rows = 值路径 `{ $y }` 的行数少于 `{ $t }`

engine-campaign-value-path-has-rows-time = 值路径 `{ $y }` 有 { $r } 行，时间路径 `{ $t }` 有 { $t_rows } 行

engine-e-campaign-campaign-with-phases-needs-timeline = 带阶段的活动需要带 step_s 的 [timeline]

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s 必须为正，实际为 { $step }

engine-e-campaign-phase-is-named-twice = 阶段 `{ $name }` 被命名了两次

engine-e-campaign-phase-duration-must-be-non = 阶段 `{ $name }`：duration_s 必须为非负

engine-e-campaign-phase-has-no-runs = 阶段 `{ $name }` 没有运行

engine-e-campaign-phase-the-first-phase-has = 阶段 `{ $name }`：第一个阶段没有可供移交的前序内容

engine-e-campaign-phase-handoff-from-channel-which = 阶段 `{ $name }`：从通道 `{ $ch }` 移交，而前一阶段并未以该通道结束

engine-e-campaign-phase-handoff-from-run-does = 阶段 `{ $name }`：移交的 from_run { $from_run } 不存在

engine-e-campaign-phase-handoff-is-null = 阶段 `{ $name }`：移交 `{ $from }` 为 null

engine-e-campaign-phase-handoff-run-does-not = 阶段 `{ $name }`：移交的运行 { $run } 不存在

engine-e-campaign-phase = 阶段 `{ $name }`：{ $e }

engine-campaign-phase-run = 阶段 { $name }/运行 { $ri }

engine-e-campaign-phase-end-at-run-does = 阶段 `{ $name }`：end_at_run { $end_at_run } 不存在

engine-campaign-duration-end-at-is-later = duration_s（end_at { $p } = { $x } s 更晚）

engine-campaign-duration-end-at-is-null = duration_s（end_at { $p } 为 null）

engine-e-campaign-phase-side-is-not-classical = 阶段 `{ $name }`：side `{ $side }` 不是 classical 或 quantum

engine-e-campaign-phase-skip-must-be-non = 阶段 `{ $name }`：skip_s 必须为非负

engine-e-campaign-phase-alarm-compare-is-not = 阶段 `{ $name }`：告警 compare `{ $compare }` 不是 below、above 或 abs_above

engine-e-campaign-phase-alarm-threshold-is-null = 阶段 `{ $name }`：告警门限 `{ $p }` 为 null

engine-e-campaign-phase-channel-is-in-not = 阶段 `{ $name }`：通道 `{ $channel }` 的单位是 { $u }，而不是 { $du }

## src/campaign.rs

engine-e-campaign-phase-channel-needs-unit = 阶段 `{ $name }`：通道 `{ $channel }` 需要单位

engine-e-campaign-phase-two-runs-both-provide = 阶段 `{ $name }`：两次运行都提供了通道 `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = 阶段 `{ $name }` 携带 `{ $ch }`，而前一阶段并未以它结束

engine-e-campaign-phase-carries-but-no-run = 阶段 `{ $name }` 携带 `{ $ch }`，但它的所有运行都不提供 `{ $ch }`

engine-e-campaign-channel-is-in-in-one = 通道 `{ $name }` 在一个阶段的单位是 { $unit }，在另一个阶段是 { $unit2 }

engine-e-campaign-at-least-one-metric-is = 至少需要一个指标

engine-e-campaign-metric-is-named-twice = 指标 `{ $name }` 被命名了两次

engine-e-campaign-seed-overflow-in-the-ensemble = 集合中的随机种子溢出

engine-e-campaign-an-ensemble-needs-at-least = 集合至少需要一次运行

engine-e-campaign-sweep-takes-one-to-three = 扫描需要一到三个轴，实际为 { $axes }

engine-e-campaign-axis-is-named-twice = 轴 `{ $name }` 被命名了两次

engine-e-campaign-axis-needs-at-least-two = 轴 `{ $name }` 至少需要两个步

engine-e-campaign-axis-scale-must-be-lin = 轴 `{ $name }`：scale 必须为 lin 或 log

engine-e-campaign-axis-log-axis-needs-positive = 轴 `{ $name }`：对数轴的两端必须为正

engine-campaign-sweep-node = 扫描节点 { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs 至少为二

engine-e-campaign-compose-needs-at-least-one = compose 至少需要一个成员

engine-e-campaign-shared-value-must-be-number = 共享值 `{ $name }` 必须为一个数或多个数

engine-e-campaign-shared-value-is-named-twice = 共享值 `{ $name }` 被命名了两次

engine-e-campaign-member-binds-unknown-shared = 成员 `{ $label }` 绑定了未知的共享值 `{ $name }`

engine-e-campaign-member = 成员 `{ $label }`：{ $e }

engine-e-campaign-metric-is-in-for-one = 指标 `{ $name }` 对一个成员的单位是 { $u }，对 `{ $label }` 的单位是 { $unit }

engine-e-campaign-member-is-named-twice = 成员 `{ $label }` 被命名了两次

engine-e-campaign-invalid-campaign-scenario = 活动场景无效：{ $e }

engine-e-campaign-invalid-campaign = 活动无效：{ $e }

engine-e-campaign-sweep = sweep：{ $e }

engine-e-campaign-monte-carlo = monte_carlo：{ $e }

engine-e-campaign-compose = compose：{ $e }

engine-e-campaign-optimize = optimize：{ $e }

engine-campaign-of-across-the-realisations = 各次实现的 { $what }（{ $d }）

engine-campaign-value-of-at-the-end = { $ch } 在前一阶段结束时的值，加到本阶段的 { $ch } 上

engine-campaign-on-the-timeline-grid-the = { $label } 在时间线网格上：对每个网格时间，取所属阶段的运行在该时间或之前的最新样本（零阶保持）；该阶段没有任何运行提供时为 null

engine-campaign-values-of-the-scenario-key = 场景键 { $key } 沿轴 { $name } 的取值

engine-campaign-value-of-the-scenario-key = 场景键 { $key } 在此节点的值

engine-campaign-of-the-node-result = 该节点结果的 { $path }

engine-campaign-of-each-realisation-in-seed = 每次实现的 { $path }，按随机种子顺序

engine-campaign-shared-value-written-into-every = 共享值 { $name }，写入每个绑定它的成员

engine-campaign-metric-read-from-the-member = 从成员结果中读取的指标 { $name }

engine-campaign-smallest-across-the-members = 各成员中最小的 { $name }

engine-campaign-largest-across-the-members = 各成员中最大的 { $name }

engine-campaign-mean-across-the-members = 各成员的 { $name } 均值

engine-e-campaign-failed-to-serialise-campaign-result = 无法序列化活动结果：{ $e }

engine-campaign-chain-phases-over-events-alarm = 链：{ $phases } 个阶段，历时 { $duration_s } s，{ $events } 个事件，网格中有 { $alarm_s } s 处于告警状态

engine-campaign-sweep-of-nodes-over = `{ $scenario_kind }` 的扫描：{ $nodes } 个节点，遍历 [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = `{ $scenario_kind }` 的蒙特卡罗：{ $runs } 个随机种子

engine-campaign-compose-members = compose：{ $members } 个成员

engine-campaign-member-runs-modelled = { $runs_total } 次成员运行（MODELLED）

engine-campaign-sweep-of-over-nodes-each = `{ $scenario_kind }` 的扫描，遍历 { $axis_order }（{ $nodes } 个节点；每条线使用各自的范围）

engine-campaign-campaign-modelled-composition-every-value = 活动 { $r } | MODELLED 组合；每个值均读取自所指类型的真实运行

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = 优化需要一到三个参数，实际为 { $params }

engine-e-campaign-optimize-param-is-named-twice = 参数 `{ $name }` 被命名了两次

engine-e-campaign-optimize-param-needs-finite-lo-hi = 参数 `{ $name }`：需要有限的 lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = 参数 `{ $name }`：scale 必须为 lin 或 log

engine-e-campaign-optimize-param-log-param-needs-positive = 参数 `{ $name }`：对数参数的边界必须为正

engine-e-campaign-optimize-param-start-must-lie-in = 参数 `{ $name }`：start 必须位于 [lo, hi] 内

engine-e-campaign-optimize-param-grid-needs-steps-of = 参数 `{ $name }`：网格至少需要两个步

engine-e-campaign-optimize-objective-target-is-only-read = objective.target 仅在 goal = "target" 时读取

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" 需要有限的 objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal 必须为 minimize、maximize 或 target，实际为 `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = { $total } 个节点的网格超过 100000 的上限

engine-e-campaign-optimize-params-steps-is-only-read = params.steps 仅在 method = "grid" 时读取

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals 必须覆盖初始单纯形（参数个数 + 1）

engine-e-campaign-optimize-step-must-lie-in = step 必须位于 (0, 1] 内

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol 与 xtol 必须为非负

engine-e-campaign-optimize-method-must-be-grid-or = method 必须为 grid 或 nelder-mead，实际为 `{ $other }`

engine-campaign-optimize-lower-bound-of-the-scenario = 场景键 { $key } 的下界

engine-campaign-optimize-upper-bound-of-the-scenario = 场景键 { $key } 的上界

engine-campaign-optimize-value-of-the-scenario-key = 场景键 { $key } 在最佳评估处的值

engine-campaign-optimize-value-of-the-scenario-key-2 = 场景键 { $key } 在此次评估处的值

engine-campaign-optimize-target-value-of = { $what } 的目标值

engine-campaign-optimize-at-the-best-evaluation = { $what } 在最佳评估处

engine-campaign-optimize-of-this-evaluation-the-seed = 此次评估的 { $what }（runs > 1 时为随机种子均值）

engine-campaign-optimize-optimize-of-by-evals-best = 优化 `{ $objective_name }`（{ $goal } { $o }），对象 `{ $scenario_kind }`，方法 { $method }：{ $evals } 次评估（{ $stop_reason }），最佳 { $o2 }，位于 [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM：META_START 出现在 CCSDS_TDM_VERS 头部之前

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM：头部行格式错误：{ $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM：元数据行格式错误：{ $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM：数据行格式错误：{ $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM：无法识别的数据关键字 { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM：数据行 { $k } 缺少历元

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM：数据行 { $k } 缺少值

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM：数据行 { $k } 的值 { $val_str } 无效

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM：段未结束（缺少 META_STOP/DATA_STOP）

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM：TURNAROUND_NUMERATOR { $value } 无效

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM：TURNAROUND_DENOMINATOR { $value } 无效

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = 未知的观测量 `{ $other }`：应为 range、range-rate 之一

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = 未知的坐标 `{ $other }`：应为 cartesian、polar 之一

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours 必须为有限正值，实际为 { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs 必须 ≥ 2，实际为 { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps 必须 ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials 必须 ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations 必须 ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd 必须为有限正值，实际为 { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor 必须为有限正值，实际为 { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km 必须为有限正值，实际为 { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m 必须为有限正值，实际为 { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s 必须为有限正值，实际为 { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = 星座至少必须包含一个主星和一个参考星

engine-e-cislunar-arc-recovery-family-is-an-out-of = 族 `{ $family }` 是平面外族，没有平面四状态表示：设置 spatial = true 以对其进行扫描

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = 前向模型产生了非有限的真值测量

engine-cislunar-arc-recovery-first-arc-length-at-which = 弧长首次满足以下条件：每一个带随机种子的试验的无噪声批处理解算，都将最终状态误差降至不超过其起始先验位移的 { $recovery_factor } 倍。这是秩判据在恢复问题上的对应形式：在测量精确时，`is the state observable?` 变为 `can an estimator get it back?`，且答案中不涉及奇异值容差。

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = 弧长首次满足以下条件：{ $trials } 个带随机种子的噪声实现上的蒙特卡罗 RMS 位置恢复误差降至 { $error_bound_km } km 或以下。这是可估性判据在恢复问题上的对应形式，是实测而非预测的：误差是估计值到已知真值的距离，而不是形式协方差的迹。

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = 在一个历元网格步长内 CORROBORATED：估计器自 { $e } h 起恢复，格拉姆矩阵秩判据在 { $g } h 处转变（比值 { $v1 }，网格 { $grid_hours } h）。

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = 作为可恢复性边界 NOT CORROBORATED：估计器自 { $e } h 起恢复，{ $v1 }格拉姆矩阵秩判据的 { $g } h（比值 { $v2 }，网格 { $grid_hours } h）。秩判据是相对奇异值约定；恢复边界是实测的状态误差，两者在此并不一致。

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED：估计器在此弧段上始终达不到其恢复界限，而格拉姆矩阵秩判据在 { $g } h 处转变。

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = 格拉姆矩阵秩判据在此弧段上始终不满足（几何从未达到满秩），而估计器自 { $e } h 起恢复，两者对是否存在边界的结论根本不同。

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | { $family } 族，{ $state_dim } 状态，{ $n_spacecraft } 个 s/c，观测量 { $observable }，参数化 { $coordinates } | { $arc_hours } h 弧段，{ $epochs } 个历元（网格 { $grid_hours } h），{ $trials } 次试验，随机种子 { $seed } | 有限差分偏导数，无解析 Jacobian / STM / SVD / SRIF | 无噪声恢复自 { $nf }（因子 { $recovery_factor }），对比格拉姆矩阵秩阈值 { $gram } | 蒙特卡罗可估性自 { $est }（RMS 位置 ≤ { $error_bound_km } km，σ { $sigma_range_m } m），对比格拉姆矩阵可估性 { $gram_est } | 弧段末 RMS 位置 { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = 未知的族 `{ $other }`：应为 dro、halo、nrho 之一

engine-e-cislunar-observability-dro-at-crossing-distance-did = 穿越距离 { $d } 处的 DRO 未能微分修正

engine-e-cislunar-observability-member-at-x0-did-not = { $label } 成员 { $i }（x0 = { $x0 }）未能微分修正

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft 必须在 2 与 { $MAX_SPACECRAFT } 之间，实际为 { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs 必须 ≥ 2，实际为 { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol 必须为有限正值，实际为 { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m 必须为有限非负值，实际为 { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km 必须为有限正值，实际为 { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } 个 s/c（{ $refs } 个参考）| { $arc_hours } h 弧段，{ $rank_arc } 个历元 | 弧段上秩 { $first } → { $last }（共 { $state_dim }）| 格拉姆矩阵 λ [{ $min_eigenvalue }…{ $max_eigenvalue }] 条件数 { $condition_str } | 瞬时秩：仅测距 { $rank_range_only } → 测距加距离变化率 { $rank_range_rate }（{ $n_links } 条链路）| GDOP 仅测距 { $ro } 测距加距离变化率 { $rr } | DRO 初值（最大周期性残差 { $max_resid }）| SRIF 后验在秩为 4 的历元 { $srif_epoch } 处有限（已验证：秩/STM/DRO 闭合/SRIF；建模：设计）

engine-cislunar-observability-never-rank-of = 从未（秩 { $rank }，共 { $state_dim }）

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | { $family } 族，{ $state_dim } 状态，{ $n_spacecraft } 个 s/c，σ_range { $sigma_range_m } m | 秩阈值 { $rank_thr }（网格 { $c } h）| 可估性阈值（σ_pos ≤ { $sigma_pos_threshold_km } km）{ $est_thr }

engine-cislunar-observability-first-arc-length-at-which = 弧长首次满足以下条件：主星初始状态的形式 1σ 位置不确定度 σ_pos = sqrt(trace(P_rr))（其中 P = (ÕᵀÕ)⁻¹，Õ 为经测量噪声白化的可观测性矩阵）降至 { $sigma_pos_threshold_km } km 或以下。只有在此判据下，弧长阈值才依赖于噪声：P 随 σ² 缩放，因此 σ_pos 随 σ 缩放，而上述秩判据不随 σ 变化。该界限是明确声明的工程选择，而非拟合所得；estimability_sweep 还报告了其他四个界限下的阈值。

engine-cislunar-observability-extension-r3-this-run-is = 扩展（R3）— 本次运行不是上文 `label` 所描述的平面 DRO 配置。状态维数 { $state_dim }；轨道族 { $family }；{ $n_spacecraft } 个航天器；测距测量 sigma { $sigma_range_m } m。凡 `label` 中写“planar”和“planar DROs”之处，请按此处所指的族理解。VALIDATED 的新增内容：6x6 变分 STM 与全宽度下使用的、经有限差分验证的 CR3BP STM（crate::cr3bp）相同；空间测距/距离变化率 Jacobian 行是经有限差分验证的解析偏导数，其中距离变化率行已逐分量与本 crate 独立的三维 deepspace_od::range_rate_observable 交叉核对；halo / NRHO 初值是经微分修正的周期轨道，所用修正器与复现已发表的 L2 南向 9:2 NRHO 的修正器相同，并从该已发表的种子出发延拓，且报告了每个成员的闭合残差；六状态的秩结论已由一个独立的行阶梯秩（带部分选主元的高斯消元）确认，该方法与特征值/SVD 路线不共享任何代码。SRIF 部分的诚实范围：上述 SRIF 交叉验证使用相同的测量 Jacobian，并归约为相同的 O^T O，因此其一致只是两种数值机制之间的一致性检查，不是对阈值的独立佐证，不计作对此处任何数值的验证。MODELLED：族设计（横坐标、幅值和相位的选取）、历元网格、单链路弧段，以及可估性判据所声明的位置界限。

engine-cislunar-observability-validated-each-constellation-initial-condition = 已验证：每个星座初值都是 { $family } 族的微分修正周期轨道，在一个周期内闭合至所报告的周期性残差（平面 DRO 另外相对月球为逆行）。该族按地月质量比修正。建模：族参数和相位的选择（星座设计）。键名 `dro_provenance` 为已发布的文档模式而保留；它承载本次运行所要求的任何族。

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = 完好性：{ $n } 必须为有限正值，实际为 { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = 完好性：{ $n } 必须位于 (0, 1) 内，实际为 { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = 完好性：mask_deg 必须位于 [0, 90) 内

engine-e-clock-integrity-integrity-systems-must-name-at = 完好性：systems 必须至少指定一个预设

engine-e-clock-integrity-integrity-injected-bias-needs-finite = 完好性：injected_bias 需要有限的 bias_m、t0_s 和 t1_s

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch = 完好性：{ $n } 个历元超过 { $MAX_EPOCHS } 个历元的上限；请增大 step_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }：没有记录

engine-e-clock-library-card-records-at-different-tau0 = { $name }：记录的 tau0 不同

engine-e-clock-library-card-periodic-least-squares-failed = { $name }：周期最小二乘失败

engine-e-clock-library-card-stability-points-with-edf-card = { $name }：{ $used } 个 edf >= { $MIN_FIT_EDF } 的稳定度点；卡片需要三个

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = 间隙 { $g }，相位离群值 { $o }，相位阶跃 { $p }，突发 { $b }，频率阶跃 { $f }（稳健 sigma_y { $sigma_y }）

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` 不是非负整数

engine-e-compliance-is-missing = 缺少 `{ $p }`

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } 超过 events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } 超过 predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }：接收机信任度计数格式错误（{ $malformed_counts }）；已排除

engine-e-compliance-not-json = { $label }：不是 JSON：{ $e }

engine-compliance-cannot-read = { $label }：无法读取：{ $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }：同级场景给出的类型是 `{ $s }`，而结果给出的是 `{ $o }`；未使用

engine-e-compliance-scenario-kind-not-found-no = { $label }：未找到场景类型（没有同级场景文件，不是接收机信任度结果，也没有顶层 `kind`）

engine-e-compliance-is-not-scenario-kind-the = { $label }：`{ $kind }` 不是引擎已知的场景类型；未使用

engine-compliance-written-by-kshana = 由 kshana { $engine_version } 写出。{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell }（{ $cell2 }）

    { $met } 项测试满足所有已声明的判据，{ $not_met } 项有判据未达到，{ $needs_input } 项需要输入。{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = 强度网格必须有有限的 min < max，实际为 [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = 强度网格需要 >= 2 个步，实际为 { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = 相关性网格至少必须有一个值

engine-e-conflict-resilience-correlation-values-must-lie-in = 相关性取值必须位于 [0, 1] 内，实际为 { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience 至少需要一层

engine-e-conflict-resilience-layer-availability-not-in = 第 { $i } 层可用性 { $availability } 不在 [0, 1] 内

engine-e-conflict-resilience-layer-sigma-must-be-finite = 第 { $i } 层 sigma_m 必须为有限正值

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = 第 { $i } 层 vulnerability 必须为有限值且 >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = 第 { $i } 层 vector_weight 必须为有限值且 >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } 超出范围（0..{ $layers }）

engine-e-conflict-resilience-trials-must-be = trials 必须 >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } 层（{ $primary } 为基线）| 参考强度 { $reference_intensity } | 韧性比 闭式解 { $ratio_closed_form }x，MC { $ratio_mc_independent }x（多层对单层）| 相关性使分层失效：比值 { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | 先验 CI [{ $ratio_lo }-{ $ratio_hi }]x | 各向量存活率 @ 参考 压制干扰（jamming）{ $surv }% 欺骗干扰（spoofing）{ $surv2 }% 动能打击 { $surv3 }% 网络攻击 { $surv4 }%（最尖锐 { $sharpest }）| ~7x 标题数字 MODELLED，VALIDATED：MC->闭式解 / 融合恒等式 / copula 边缘分布 / 各向量存活率

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = 未知的中心天体 { $name }：应为行星、冥王星、月球或主要卫星（earth、moon、mars、europa、titan 等；见 crate::body::SOLAR_SYSTEM）

engine-e-constellation-walker-shell-needs-total-and = Walker 壳层需要 total > 0 且 planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walker total { $total } 不是 planes { $planes } 的整数倍

engine-e-constellation-walker-phasing-must-lie-in = Walker 相位 F = { $phasing } 必须位于 0..planes（= { $planes }）内

engine-e-constellation-is-not-an-expandable-gps = { $name } 不是可扩展的 GPS 槽位（SPS PS Table 3.2-2 列出 B1、D2、F2、A2、C4、E3）

engine-e-constellation-give-altitude-km-or-semi = { $what }：请给出 altitude_km 或 semi_major_axis_km，不能同时给出

engine-e-constellation-needs-altitude-km-or-semi = { $what }：需要 altitude_km 或 semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }：半长轴 { $v1 } km 不高于 { $name } 的半径

engine-e-constellation-eccentricity-must-lie-in = { $what }：偏心率 { $e } 必须位于 [0, { $lit_0_9 }) 内

engine-e-constellation-perigee-is-below-the-surface = { $what }：近地点低于 { $name } 表面

engine-e-constellation-constellation-preset-is-an-earth = 星座 { $name }：预设 { $p } 是地球星座，而天体是 { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = 星座 { $name }：未知预设 { $other }（应为 gps-baseline、gps-expandable、galileo、beidou、beidou-meo 或 glonass）

engine-e-constellation-constellation-expanded-applies-only-to = 星座 { $name }：`expanded` 仅适用于 gps-expandable 预设

engine-constellation-constellation-shell = 星座 { $name } 壳层 { $v2 }

engine-constellation-explicit-element-sets = { $satellite } 个显式根数集

engine-constellation-constellation-satellite = 星座 { $name } 卫星 { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = 星座 { $name } 没有卫星：请给出预设、[[constellation.shell]] 或 [[constellation.satellite]]

engine-e-constellation-no-constellation-given = 未给出星座

## src/constellation.rs

engine-e-constellation-constellations-with-one-clock-each = { $constellations } 个星座各带一个时钟，超过 { $MAX_CLOCKS } 个时钟的上限；请使用 clock = "common" 或合并星座

engine-e-constellation-must-be-finite = { $what } 必须为有限值

engine-e-constellation-need-step-and-duration-step = 需要 step_s > 0 且 duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = 超过 100 000 个历元；请增大 step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg 必须位于 [0, 90) 内

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold 必须为正

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg 必须位于 [{ $lit_0_25 }, 90] 内

engine-e-constellation-need-90-lat-min-deg = 需要 -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = 需要 lon_min_deg < lon_max_deg，且跨度至多为 360 deg

engine-e-constellation-give-at-least-one-constellation = 请至少给出一个 [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points 的上限为 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } 颗卫星超过 50 000 的上限

engine-constellation-constellation-design-satellites-around-the = constellation-design：{ $name } 周围共 { $total } 颗卫星（{ $names }）；可用性 { $global_availability_pct }%（高度截止角 { $mask_deg } deg 时 PDOP <= { $pdop_threshold }），最差站点 { $worst_site_availability_pct }%，PDOP 中位数 { $cov }，平均可见 { $global_mean_visible } 颗；{ $grid_points } 个网格点 x { $epochs } 个历元（MODELLED）

engine-constellation-constellation-coverage-over-the = { $name } 上的星座覆盖

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } 必须为有限正值

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } 必须为有限值且 >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw 必须为有限值

engine-e-contact-schedule-satellite-altitude-km-must-be = 卫星 '{ $name }'：altitude_km 必须位于 (100, 40000) 内

engine-e-contact-schedule-satellite-inclination-deg-must-be = 卫星 '{ $name }'：inclination_deg 必须位于 [0, 180] 内

engine-e-contact-schedule-satellite-backlog-mbit-must-be = 卫星 '{ $name }'：backlog_mbit 必须 >= 0

engine-e-contact-schedule-satellite-priority-must-be = 卫星 '{ $name }'：priority 必须 > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = 卫星 '{ $name }'：eirp_dbw 必须为有限值

engine-e-contact-schedule-station-lat-deg-in-90 = 站点 '{ $name }'：lat_deg 位于 [-90, 90] 内，lon_deg 为有限值

engine-e-contact-schedule-station-mask-deg-must-be = 站点 '{ $name }'：mask_deg 必须位于 [0, 90) 内

engine-e-contact-schedule-station-alt-must-be-in = 站点 '{ $name }'：alt_m 必须位于 [0, 3000] 内（ITU-R P.834 范围）

engine-e-contact-schedule-station-setup-and-over-db = 站点 '{ $name }'：setup_s >= 0 且 g_over_t_db 为有限值

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours 必须位于 (0, 168] 内

engine-e-contact-schedule-step-must-be-in-300 = step_s 必须位于 (0, 300] 内

engine-e-contact-schedule-at-least-one-satellite-and = 至少需要一颗卫星和一个站点

engine-e-contact-schedule-at-most-32-satellites-and = 至多 32 颗卫星和 32 个站点

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule：{ $satellites } 颗卫星 x { $stations } 个站点，历时 { $duration_hours } h -> { $cands } 个候选接触，已调度 { $greedy } 个；{ $total_backlog } Mbit 中已交付 { $total_del } Mbit{ $v8 }（MODELLED）

engine-contact-schedule-acm-link-pass-es-acm = acm-link：{ $pairs } 个过境；ACM { $acm } Mbit，对比 CCM { $ccm } { $ccm_v } Mbit{ $v5 }（MODELLED）

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = 需要至少 2 次试验和有限的 sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total 必须位于 (0, 1) 内

engine-e-dop-error-ci-no-local-frame-at-the = 用户处没有局部坐标系

engine-e-dop-error-ci-singular-geometry = { $name }：几何奇异

engine-e-dop-error-ci-no-noise-free-fix = { $name }：没有无噪声定位解

engine-e-dop-error-ci-no-fix = { $name }：没有定位解

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }：几何奇异

engine-e-dop-error-mc-no-fix = { $label }：没有定位解

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km 必须为正；实际为 { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes 与 sats_per_plane 都必须非零

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz 必须为正；实际为 { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency 必须位于 (0, 1] 内；实际为 { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k 必须为正；实际为 { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db 必须为非负；实际为 { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m 必须位于地球之外；实际为 { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance = 地月距离处的地球 GNSS — { $n_satellites } 颗卫星，接收机位于 { $r } km{ "\u000A" }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }从星座看地球边缘：偏离天底 { $earth_limb_half_angle_deg } deg — 任何射向月球的射线都必须超过此值{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_satellites } 颗中有 { $n_geometrically_visible } 颗未被遮挡；{ $n_trackable } 颗超过 { $tracking_threshold_dbhz } dB-Hz 的跟踪门限{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }最佳链路 { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }所有可跟踪的视线都位于 { $a } deg 半锥角之内 — 几何近乎退化{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }SWEEP：{ $epochs } 个历元 / { $span_s } s：信号可用性 { $signal_availability }，FIX 可用性 { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }可跟踪链路 平均 { $mean_trackable }，最大 { $max_trackable }；最佳 C/N0 { $w }；最佳 PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = 需要一到六级

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg 必须为有限非负值

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 必须为有限非负值

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg 必须为有限非负值

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m 必须为有限非负值

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg 必须位于 [0, 45) 内

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s 必须为有限非负值

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = 起飞推重比 { $tw } 必须大于 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses：理想 dv { $ideal_dv_m_s } m/s，损失 { $losses } m/s（重力 { $gravity_loss_m_s }，阻力 { $drag_loss_m_s }，操纵 { $steering_loss_m_s }，背压 { $back_pressure_loss_m_s }）；关机点 { $r } km，速度 { $end_speed_m_s } m/s，gamma { $r2 } deg；max-Q { $r3 } kPa（MODELLED）

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } 必须为有限正值

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body 必须为 "earth" 或 "mars"，实际为 "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = 大气 "{ $a }" 不适用于天体 "{ $b }"（earth：us76|exponential，mars：mars|exponential）

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg 必须位于 (0, 90) 内（向下为正）

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m 必须位于 [20 km, 1000 km] 内

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg 必须为有限值，且 |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg 与 longitude_deg 必须为有限值

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag 必须位于 [0, 3] 内

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg 必须为有限值

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s 必须位于 (0, 1] s 内

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m 必须位于 [0, entry_interface_altitude_m) 内

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s 必须位于 (0, 20000] s 内

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame 必须为 inertial|relative，实际为 "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating（{ $body }）：V_rel { $speed_m_s } m/s，γ { $gam_abs }° -> 峰值 { $pk_g } g，位于 { $r } km，峰值 q { $r2 } W/cm²，位于 { $r3 } km，热载荷 { $r4 } J/cm²，峰值 q_dyn { $r5 } kPa；{ $outcome }，于 { $end_time_s } s（闭式解 { $cf_g } g；MODELLED 3-DoF，不含辐射/TPS）

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } 必须位于 (0, 1] 内

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } 必须为有限非负值

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg 必须位于 [0, 90) 内

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits 必须位于 1..=24 内

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry：GSD { $gsd } m，Q { $im }，SNR { $snr }（阱 { $v4 } %），奈奎斯特处 MTF { $fac }，RER { $rer }，GIQE4 NIIRS { $niirs }（MODELLED）

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = 天底角 { $eta_rad }° 超过地球角半径 { $rho }°（未指向地球）

engine-e-eo-payload-no-sun-synchronous-inclination-at = 在 { $v1 } km 处没有太阳同步倾角

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg 必须位于 (0, 90) 内

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad 必须为有限正值

engine-e-eo-payload-half-fov-too-large = half_fov 过大：{ $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage：{ $altitude_km } km，±{ $half_fov_deg }° 视场 -> { $v3 } km 幅宽，星下点 GSD { $gsd } m，可达偏离星下点 { $v5 } km；节点间距 { $v6 } km（{ $v7 }）（MODELLED）

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = 地月质心取自 { $table }，由 Montenbruck & Gill 月球级数（岁差改正至 J2000）拆分

engine-ephem-provider-jpl-mean-elements-in-the = 拉普拉斯平面中的 JPL 平均根数，平经度速率取自 IAU 同步自转速率，加到取自 { $table } 的所属行星上

engine-ephem-provider-iau-synchronous-rotation-direction-at = JPL 平均距离处的 IAU 同步自转方向，加到取自 { $table } 的土星上

engine-e-ephem-provider-read = 读取 { $path }：{ $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = TLE 缺少第 1 行（以 `1 ` 开头的行）

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE 缺少第 2 行（以 `2 ` 开头的行）

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = 解析的 `orbit` 星历需要 `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = 星历场景需要 `tle` 或 `orbit` 之一

engine-e-ephemeris-step-must-be-positive = step_s 必须为正

engine-e-ephemeris-duration-must-be-non-negative = duration_s 必须为非负

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz 必须为有限的正频率

engine-ephemeris-ground-track-samples-alt-km = { $source } 星下点轨迹 · { $n_samples } 个样本 · 高度 { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` 不是有限值

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` 既不是秒数，也不是 ISO-8601 UTC 时间

engine-e-evidence-assemble-no-epoch-of-the-log = 日志中没有落在 { $t0 } s 与 { $t1 } s 之间的历元（日志跨度为 0 到 { $duration_s } s）

engine-e-evidence-assemble-config-is-not-an-object = config 不是对象

engine-e-evidence-assemble-config-json-already-has-an = config.json 已有条目 `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = 从 { $from_s } 到 { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` 不是形如 2026-01-02T03:04:05Z 的 UTC 时间

engine-e-evidence-bundle-in-log-of-bytes = { $log_bytes } 字节的日志中的 { $s }..{ $e }

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } 需要一个值

engine-e-evidence-cli-cannot-create = 无法创建 { $path }：{ $e }

engine-e-evidence-cli-cannot-write = 无法写入 { $path }：{ $e }

engine-evidence-cli-warning-is-readable-by-other = 警告：{ $path } 可被其他用户读取；请限制其权限（chmod 600）

engine-e-evidence-cli-cannot-read-key = 无法读取密钥 { $path }：{ $e }

engine-e-evidence-cli-is-not-hex-key = { $path } 不是十六进制密钥

engine-e-evidence-cli-must-hold-32-byte-key = { $path } 必须包含 32 字节的密钥，以 64 位十六进制数字表示

engine-e-evidence-cli-cannot-read = 无法读取 { $dir }：{ $e }

engine-e-evidence-cli-cannot-read-2 = 无法读取 { $name }：{ $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } 已存在且不为空

engine-e-evidence-cli-cannot-create-2 = 无法创建 { $dir }：{ $e }

engine-evidence-cli-warning-is-owner-only-mode = 警告：{ $arg } 仅限所有者访问（模式 600），且名称不是 *.pub：它可能是私钥。请传入公钥文件。

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` 既不是 64 位十六进制数字，也不是可读文件（{ $e }）

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` 不含十六进制数字

engine-evidence-cli-private-key-keep-it-secret = 私钥：{ $out }  （请保密；切勿提交）

engine-evidence-cli-public-key-pub = 公钥：{ $out }.pub

engine-evidence-cli-public-key-hex = 公钥（十六进制）：{ $pk }

engine-evidence-cli-give-verifiers-the-public-key = 请通过验证者信任的途径将公钥交给验证者；他们用 --pubkey 固定该公钥。

engine-e-evidence-cli-verify-needs-bundle-directory = verify 需要一个证据包目录

engine-e-evidence-cli-cannot-read-3 = 无法读取 { $p }：{ $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }：未找到 PEM 证书

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }时间戳机构的签名未经 Kshana 验证

engine-evidence-cli-this-is-technical-record-not = 这是技术记录，不是法律意见。

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp 需要一个证据包目录

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp 需要一个令牌文件

engine-e-evidence-cli-cannot-read-4 = 无法读取 { $tok }：{ $e }

engine-e-evidence-cli-cannot-write-2 = 无法写入 { $target }：{ $e }

engine-evidence-cli-note-the-token-sits-beside = 注意：令牌位于已签名清单旁边，而不在清单内部；使用 --require-timestamp 进行验证即可强制要求令牌。

engine-e-evidence-cli-round-trip-packs-are-not = WebAssembly 不构建往返证据包

engine-e-evidence-cli-needs-scenario-path = 需要场景路径

engine-e-evidence-cli-needs-from = 需要 --from

engine-e-evidence-cli-needs-to = 需要 --to

engine-e-evidence-cli-cannot-read-lab-attestation = 无法读取实验室证明 { $p }：{ $e }

engine-e-evidence-cli-cannot-read-5 = 无法读取 { $scn_path }：{ $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = 接收机信任度场景无效：{ $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation 适用于 `receiver-trust evidence`，不适用于 `evidence round-trip`（其证据包记录测试条件）

engine-e-evidence-cli-cannot-read-6 = 无法读取 { $sp }：{ $e }

engine-e-evidence-cli-cannot-read-7 = 无法读取 { $cp }：{ $e }

engine-evidence-cli-evidence-pack-written-to = 证据包已写入 { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }窗口内历元：{ $epochs_in_window }  （{ $from_s } s 到 { $to_s } s）

engine-evidence-cli-signer-fingerprint = { "  " }签名者指纹：{ $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }manifest.json 的 SHA-256（RFC 3161 机构应加盖时间戳的内容）：{ $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }日志切片：{ $log_bytes } 字节中的第 { $a } 到 { $b } 字节

engine-evidence-cli-log-slice-whole-log-this = { "  " }日志切片：整个日志（该日志没有给出此窗口的字节范围）

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }实验室证明已记录在已签名清单中（{ $v1 }）

engine-evidence-cli-pack-is-technical-record-not = 证据包是技术记录，不是法律意见。

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = 日志首个历元之后 { $from_s } s 到 { $to_s } s

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = 实验室证明 TOML 无效：{ $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` 必须为表

engine-e-evidence-lab-invalid-lab-attestation = 实验室证明无效：{ $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation：{ $name } 为必填项

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation：{ $name } 超过 { $MAX_FIELD } 字节

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation：日期 { $date } 不是形如 2026-11-02 的日期

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation：屏蔽式设置需要 enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation：setup 必须为 "conducted" 或 "shielded"（实际为 { $other }）；空中设置不被接受为实验室运行

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation：attenuation_db 必须为有限值

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = 测试条件给出 { $events } 个事件，而评分场景有 { $events2 } 个

engine-e-evidence-roundtrip-event-in-the-test-conditions = 测试条件中的事件 '{ $id }'（{ $onset_s } s 到 { $offset_s } s）与评分场景中的 '{ $label }'（{ $onset_s2 } s 到 { $end_s } s）不匹配

engine-e-evidence-roundtrip-the-log-sha-256-is = 日志的 SHA-256（{ $have }）与测试条件所给的（{ $h }）不一致

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = DER 被截断

engine-e-evidence-tsa-bad-der-length = DER 长度无效

engine-e-evidence-tsa-unexpected-der-tag = { $what }：意外的 DER 标签 { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = AlgorithmIdentifier 为空

engine-e-evidence-tsa-bad-utctime = UTCTime 无效

engine-e-evidence-tsa-bad-generalizedtime = GeneralizedTime 无效

engine-e-evidence-tsa-bad-time = 时间无效

engine-e-evidence-tsa-time-not-in-utc = 时间不是 UTC

engine-e-evidence-tsa-bad-time-digits = 时间数字无效

engine-e-evidence-tsa-bad-bit-string = BIT STRING 无效

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate：应有三个元素

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate：过短

engine-e-evidence-tsa-empty-extension = Extension 为空

engine-e-evidence-tsa-extension-value-not-an-octet = Extension：值不是 OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity：为空

engine-e-evidence-tsa-validity-short = Validity：过短

engine-e-evidence-tsa-pem-end-without-begin = PEM：END 缺少 BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM：base64 无效

engine-e-evidence-tsa-pem-bad-base64-length = PEM：base64 长度无效

engine-e-evidence-tsa-spki-empty = SPKI：为空

engine-e-evidence-tsa-spki-no-oid = SPKI：没有 OID

engine-e-evidence-tsa-spki-no-key = SPKI：没有密钥

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey：应有两个整数

engine-e-evidence-tsa-unsupported-elliptic-curve = 不支持的椭圆曲线

engine-e-evidence-tsa-unsupported-public-key-algorithm = 不支持的公钥算法

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA 密钥或签名过大

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA 模数不是奇数

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA 签名超出范围

engine-e-evidence-tsa-rsa-key-too-small = RSA 密钥过小

engine-e-evidence-tsa-invalid-padding = 填充无效

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS：编码消息过长

engine-e-evidence-tsa-last-octet-invalid = 最后一个八位字节无效

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS：最左侧的位不为零

engine-e-evidence-tsa-pss-bad-padding = PSS：填充无效

engine-e-evidence-tsa-pss-signature-mismatch = PSS：签名不匹配

engine-e-evidence-tsa-unsupported-mask-generation-function = 不支持的掩码生成函数

engine-e-evidence-tsa-mgf1-without-hash = MGF1 缺少哈希

engine-e-evidence-tsa-bad-pss-salt-length = PSS 盐长度无效

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = ECDSA 签名需要 EC 密钥

engine-e-evidence-tsa-an-rsa-signature-needs-an = RSA 签名需要 RSA 密钥

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption 缺少摘要算法

engine-e-evidence-tsa-an-rsa-pss-signature-needs = RSA-PSS 签名需要 RSA 密钥

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey 缺少摘要算法

engine-e-evidence-tsa-unsupported-signature-algorithm = 不支持的签名算法

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo：为空

engine-e-evidence-tsa-time-stamp-request-not-granted = 时间戳请求未获批准

engine-e-evidence-tsa-no-time-stamp-token-in = 响应中没有时间戳令牌

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = 不是 TimeStampResp 或 TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = 不是 CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo：没有内容

engine-e-evidence-tsa-signeddata-short = SignedData：过短

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo：为空

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = 封装内容不是 TSTInfo

engine-e-evidence-tsa-no-tstinfo = 没有 TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo 不在 OCTET STRING 中

engine-e-evidence-tsa-tstinfo-short = TSTInfo：过短

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo：没有 genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData：没有 signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = 应恰有一个 SignerInfo

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo：没有 sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo：没有摘要算法

engine-e-evidence-tsa-signerinfo-short = SignerInfo：过短

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo：没有已签名属性

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo：没有签名算法

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo：没有签名

engine-e-evidence-tsa-no-serial = 没有序列号

engine-e-evidence-tsa-signer-certificate-not-found = 未找到签名者证书

engine-e-evidence-tsa-attribute-empty = Attribute：为空

engine-e-evidence-tsa-attribute-no-values = Attribute：没有值集合

engine-e-evidence-tsa-attribute-no-value = Attribute：没有值

engine-e-evidence-tsa-content-type-attribute-mismatch = content-type 属性不匹配

engine-e-evidence-tsa-digest-failure = 摘要校验失败

engine-e-evidence-tsa-signature-not-an-octet-string = 签名不是 OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = 缺少 ess 签名证书属性

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate：为空

engine-e-evidence-tsa-ess-cert-id-not-found = 未找到 ess 证书标识

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2：没有哈希

engine-e-evidence-tsa-unsuitable-certificate-purpose = 证书用途不合适

engine-e-evidence-tsa-certificate-is-not-yet-valid = 证书尚未生效

engine-e-evidence-tsa-certificate-has-expired = 证书已过期

engine-e-evidence-tsa-invalid-ca-certificate = CA 证书无效

engine-e-evidence-tsa-certificate-chain-too-long = 证书链过长

engine-e-evidence-tsa-messageimprint-empty = MessageImprint：为空

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint：没有摘要

engine-e-evidence-tsa-message-imprint-mismatch = 消息摘要印记不匹配

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = 不支持不定长度的 BER

engine-e-evidence-tsr-expected-tag-found = 应为 { $what }（标签 { $tag }），实际为 { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = PKIStatusInfo 格式错误

engine-e-evidence-tsr-the-timestamp-response-was-not = 时间戳响应未获批准

engine-e-evidence-tsr-not-timestamp-token = 不是时间戳令牌

engine-e-evidence-tsr-the-token-content-type-is = 令牌的内容类型不是 CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = 令牌不含 TSTInfo

## src/evidence/tsr.rs

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = 消息摘要使用了不受支持的哈希算法

engine-e-evidence-tsr-the-imprint-is-bytes-not = 摘要为 { $digest } 字节，而非 { $hash_alg } 给出的 { $want_len } 字节

engine-e-evidence-tsr-gentime-is-not-utc = genTime 不是 UTC

engine-e-evidence-tsr-malformed-gentime = genTime 格式错误

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime 不是真实的日历时间

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = 不是小写十六进制

engine-e-evidence-verify-expected-bytes-found = 应为 { $N } 字节，实际为 { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = 证据包已有时间戳令牌；如需替换，请传入 --replace

engine-e-evidence-verify-not-attached-the-pack-with = 未附加：带有此令牌的证据包未通过验证（{ $v1 }）

engine-evidence-verify-the-pack-records-lab-attestation = 证据包记录了由 { $operator } 出具的实验室证明（{ $organisation }，{ $setup }）：{ $v4 }

engine-e-evidence-verify-the-signature-file-does-not = 签名文件末尾没有换行符

engine-evidence-verify-signer-not-pinned-the-signature = 签名者未固定：该签名只证明证据包相对于密钥 { $r } 是完整的，而该密钥由证据包自行指明。请将该指纹与从签名者处获得的指纹比对，或传入密钥。

engine-evidence-verify-range-is-not-inside-log = 范围 { $start }..{ $end } 不在 { $full_bytes } 字节的日志之内

engine-evidence-verify-timestamp-token-states-its-imprint = 时间戳令牌声明时间为 { $gen_time }；其摘要 { $v2 } manifest.json。Kshana 未验证时间戳机构的签名：请用 `openssl ts -verify` 检查。

engine-evidence-verify-timestamp-token-states-its-imprint-2 = 时间戳令牌声明时间为 { $gen_time }；其摘要 { $v2 } manifest.json；时间戳机构的签名和证书链相对于所给信任锚 { $v3 }。

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` 为空字符串

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } 不在词表之内

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = 成本区间必须有限、非负、按 low≤nominal≤high 排序，并附带来源

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction 和可用性必须是 [0, 1] 内的分数

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } 必须有限且 > 0，实际为 { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } 必须有限且 >= 0，实际为 { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg 必须在 [-90, 90) 内，实际为 { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = 星座中没有卫星

engine-e-fusion-carrier-tc-max-sats-must-be-when = 设置 max_sats 时必须 >= 1

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = 周跳卫星 { $sat } 超出范围

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = 第 { $lineno } 行：{ $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = 第 { $lineno } 行：{ $v } 列，至少应有 { $min } 列

engine-e-fusion-kfgins-line-columns = 第 { $v1 } 行：{ $v } 列

engine-e-fusion-kfgins-line-block-lists-are-not = 第 { $lineno } 行：不支持块列表

engine-e-fusion-kfgins-line-expected-key-value = 第 { $lineno } 行：应为 `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = 第 { $lineno } 行：缩进的键没有父键

engine-e-fusion-kfgins-line-only-one-level-of = 第 { $lineno } 行：只允许一层嵌套

engine-e-fusion-kfgins-line-unterminated-flow-list = 第 { $lineno } 行：流式列表未结束

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` 是列表，应为标量

engine-e-fusion-kfgins-missing = 缺少 `{ $k }`

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` 必须是三元素列表

engine-e-fusion-kfgins-no-imu-sample-at-or = 在 starttime 或之后没有 IMU 样本

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU 时间在 { $t } 处不递增

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } 必须有限且 > 0，实际为 { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m 必须有限且 > 0，实际为 { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg 必须在 [-90, 90) 内，实际为 { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = 轨迹 csv 第 { $v1 } 行：不是数字：{ $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = 轨迹 csv 第 { $v1 } 行：应为 10 列，实际为 { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = 轨迹 csv 第 { $v1 } 行：时间不递增

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = 轨迹 csv 至少需要两行

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = 轨迹 csv 覆盖 { $rows } s，但场景运行 { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = 天空：站点 lat_deg 必须在 [-90, 90] 内，且每个字段都有限

engine-e-geometry-sky-is-neither-gnss-preset = 天空：“{ $name }”既不是 GNSS 预设（{ $e_gnss }），也不是 LEO 预设（{ $e_leo }）

engine-e-geometry-sky-give-the-user-as = 天空：用户须以 `site` 或 `user_ecef_m` 给出，不能同时给出

engine-e-geometry-sky-user-ecef-must-be = 天空：user_ecef_m 必须有限，且不能是地心

engine-e-geometry-sky-satellite-azimuth-elevation-out = 天空：卫星 { $id }：方位角/高度角超出范围

engine-e-geometry-sky-satellite-is-given-in = 天空：卫星 { $id } 以 ECEF 给出；该请求需要 `site` 或 `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = 天空：卫星 { $id }：ECEF 位置不是有限值

engine-e-geometry-sky-satellite-coincides-with-the = 天空：卫星 { $id } 与用户重合

engine-e-geometry-sky-satellite-give-az-deg = 天空：卫星 { $id }：给出 az_deg 和 el_deg，或给出 ecef_m，不能有其他内容

engine-e-geometry-sky-tle-is-bytes-the = 天空：tle 为 { $text } 字节；上限为 { $MAX_TLE_BYTES }（4 MiB）

engine-geometry-element-set-refused = 轨道根数集被拒绝：{ $e }

engine-geometry-sky-tle-holds-no-complete = 天空：tle 中没有完整的两行轨道根数集；忽略了 { $n_ignored } 行，第一行：{ $first }

engine-e-geometry-sky-epoch = 天空：历元：{ $e }

engine-geometry-and-more = { "." }.. 另有 { $more } 项

engine-geometry-element-sets-propagated-by-the = { $n } 个轨道根数集已由引擎的 SGP4（WGS-72）外推到 { $iso }，并在将 UT1 取作 UTC、不计极移的条件下旋转到地固系：这是这些轨道根数集在该历元给出的天空，而非对它的测量。

engine-geometry-element-sets-propagated-by-the-2 = { $n } 个轨道根数集已由引擎的 SGP4（WGS-72）外推到最新轨道根数集的历元加 time_s（{ $iso }）。未给出历元，因此这是一幅有代表性的天空，而非某个指定日期的天空。

engine-e-geometry-sky-give-systems-or-tle = 天空：请给出 `systems` 或 `tle`（并带 `site`），或给出 `satellites`

engine-e-geometry-sky-tle-system-names-the = 天空：tle_system 用于命名 `tle` 中的卫星；该请求没有 `tle`

engine-e-geometry-sky-mask-deg-must-be = 天空：mask_deg 必须在 [-90, 90) 内，实际为 { $m }

engine-e-geometry-sky-systems-needs-site-or = 天空：`systems` 需要 `site`（或 `user_ecef_m`）作为观测点

engine-e-geometry-sky-time-must-be-finite = 天空：time_s 必须有限

engine-e-geometry-sky-system-asks-for-satellites = 天空：系统“{ $name }”请求 { $asked } 颗卫星；一个请求最多容纳 { $MAX_SATELLITES } 颗

engine-e-geometry-sky-more-than-satellites = 天空：卫星超过 { $MAX_SATELLITES } 颗

engine-e-geometry-sky-tle-needs-site-or = 天空：`tle` 需要 `site`（或 `user_ecef_m`）作为观测点

engine-e-geometry-sky-more-than-satellites-above = 天空：地平线以上的卫星超过 { $MAX_SATELLITES } 颗

engine-e-geometry-sky-sigma-uere-must-be = 天空：sigma_uere_m 必须为正，实际为 { $sigma }

engine-e-geometry-sky-confidence-must-be-in = 天空：confidence 必须在 (0, 1) 内，实际为 { $confidence }

engine-e-geometry-sky-more-than-systems-in = 天空：可见系统超过 { $MAX_CLOCKS } 个，每个系统各有自己的时钟；请将卫星归入更少的 `system` 标签，或使用 clock = "common"

engine-e-geometry-sky-must-be-in-got = 天空：n 必须在 1..={ $MAX_MC_SAMPLES } 内，实际为 { $n }

engine-e-geometry-sky-too-few-satellites-in = 天空：可见卫星太少，无法定位；没有蒙特卡罗点云

engine-e-geometry-sky = 天空：{ $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = { $e } 的 TLE 天空，非测量值

engine-e-geometry-invalid-sky-request-json = 天空请求（JSON）无效：{ $e }

engine-e-geometry-invalid-sky-request-toml = 天空请求（TOML）无效：{ $e }

engine-e-geometry-invalid-skyline-json = 天际线（JSON）无效：{ $e }

engine-e-geometry-invalid-skyline-toml = 天际线（TOML）无效：{ $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = { $head } 中的 GLONASS PRN 有误

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = 此处不编码页类型 { $pt }

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } 位，应为 { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } 位，应为 { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = 尾部比特不为零

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q 不匹配

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = 此处不解码页类型 { $pt }

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } 个符号，应为 { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = 未找到同步码型

engine-e-gnss-navmsg-gal-fnav-page-type-missing = 缺少页类型 { $t }

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = 页类型 { $t } 的 IOD_nav 与页类型 1 不同

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = 没有 Galileo 字段 { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = 此处不编码字类型 { $wt }

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } 位，应为 { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = 此处不解码字类型 { $wt }

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = 页部分必须为 120 位

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = 偶/奇标志不是先 0 后 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = 不是标称页（页类型 1 是告警页）

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } 位，应为 { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } 个符号，应为 { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = 缺少字类型 { $t }

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = 字类型 { $t } 的 IOD_nav 与字类型 1 不同

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = 记录属于系统 { $system }，而非 Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = 类型 10 没有字段 { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = 类型 11 没有字段 { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = 类型 30 没有字段 { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV 消息体有 { $body } 位，应为 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } 或 TOW 计数 { $tow_count } 超出范围

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } 位，应为 { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = 前导码不是 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = 此处不解码消息类型 { $t }

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = 需要一条类型 10 和一条类型 11 的消息

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }：{ $value }（LSB { $value2 }）放不进 { $bits } { $v4 } 位

engine-e-gnss-navmsg-bits-layout-needs = { $bits } 位，布局需要 { $need }

engine-e-gnss-navmsg-no-field = 没有字段 { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value }（比例 2^{ $scale_pow2 }）放不进 { $bits } { $v1 } 位

engine-e-gps-lnav-no-value-for = { $name } 没有值

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = 重力图：参考模型 "gfc" 需要 `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = 重力图：无法读取 gfc_path { $path }：{ $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = 重力图：未知的参考模型 `{ $other }`（请用 "egm2008" 或 "gfc"）

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = 重力图：未知的椭球 `{ $other }`（请用 "wgs84" 或 "grs80"）

engine-e-gravimeter-gravity-map-map-error-mc = 重力图：map_error_mc.realisations 至少为 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = 重力图：map_error_mc.realisations 上限为 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = 实数 '{ $t }' 有误

engine-e-gravity-pds-bad-integer = 整数 '{ $t }' 有误

engine-e-gravity-pds-empty-shadr-table = SHADR 表为空

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR 表头有 { $f } 个字段，应至少有 6 个

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR 表头：阶/次为负或归一化未知

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR 归一化状态 { $normalization }（仅支持完全归一化，即状态 1）

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR 参考经度/纬度必须为 0

engine-e-gravity-pds-non-physical-gm-must-be = GM 不符合物理意义（必须有限且为正）

engine-e-gravity-pds-non-physical-reference-radius-must = 参考半径不符合物理意义（必须有限且为正）

engine-e-gravity-pds-shadr-record-fields = SHADR 记录 { $v1 }：{ $f } 个字段

engine-e-gravity-pds-shadr-record-bad = SHADR 记录 { $v1 }：(n, m) = ({ $n }, { $m }) 有误

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR 记录 { $v1 }：系数不是有限值

engine-e-gravity-pds-no-shadr-coefficient-records = 没有 SHADR 系数记录

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR 表不完整：缺少 (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = 缺少 earth_gravity_constant / gravity_constant

engine-e-gravity-sh-missing-radius = 缺少 radius

engine-e-gravity-sh-non-physical-earth-gravity-constant = earth_gravity_constant 不符合物理意义（必须有限且为正）

engine-e-gravity-sh-non-physical-radius-must-be = radius 不符合物理意义（必须有限且为正）

engine-e-gravity-sh-no-gfc-coefficient-lines = 没有 gfc 系数行

engine-e-gravity-sh-read-error = 读取错误：{ $e }

engine-e-gravity-sh-line-norm-is-not-supported = 第 { $lineno } 行：不支持 norm { $v }（仅支持 fully_normalized）

engine-gravity-sh-line-bad = 第 { $lineno } 行：{ $what } 有误

engine-e-gravity-sh-line-degree-above-the-declared = 第 { $lineno } 行：阶 { $n } 超过声明的 max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = 第 { $lineno } 行：次 { $m } 超过阶 { $n }

engine-e-gravity-sh-line-time-variable-term-is = 第 { $lineno } 行：不支持时变项 `{ $key }`（仅支持静态模型）

engine-e-gravity-sh-missing-end-of-head = 缺少 end_of_head

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s 必须为正，实际为 { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s 必须为正，实际为 { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase = 场景产生 { $n } 个历元（需要 ≥ 2）；请增大 duration_s 或减小 step_s

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = 记录中含有非有限的钟差

engine-e-holdover-test-unknown-mask-expected-one-of = 未知的掩码 { $id }；应为以下之一：{ $masks }

engine-e-holdover-test-every-budget-max-abs-te = 每个预算的 max_abs_te_ns 必须有限且为正

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } 超出记录范围（在其自身时间轴上为 { $t0_s } 至 { $t_end } s）

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } 必须晚于 gnss_removed_s（{ $gnss_removed_s }），且不得超过记录末尾（{ $t_end } s）

engine-e-holdover-test-the-holdover-step-holds-no = 守时（holdover）阶段没有样本

engine-holdover-test-the-record-has-no-step = 记录中没有 { $step } 阶段：GNSS 在第一个样本处已被移除

engine-holdover-test-the-step-has-samples-the = { $step } 阶段有 { $te_ns } 个样本；估计器至少需要 13 个

engine-e-holdover-test-step-with-mask-has-no = 带掩码的阶段没有曲线

engine-e-holdover-test-cannot-read-csv-path = 无法读取 csv_path { $path }：{ $e }

engine-holdover-test-holdover-test-holdover-max-te = 守时测试：守时（holdover）{ $hold } s，max|TE| { $max_abs } ns；{ $masks }（MODELLED，对照掩码测得）

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m 必须有限且 > 0，实际为 { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba 必须 >= 0，且 coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED：两条支路不在共同的平均时间上。光学支路在 integration_s = { $integration_s } s 内累积；RF 支路的环路噪声带宽 B_L = { $dll_bandwidth_hz } Hz，平均时间为 1/(2*B_L) = { $rf_equivalent_averaging_s } s。取自不同平均时间的两个 sigma 之比不构成比较，因此不给出该比值。请移除 rf_dll_bandwidth_hz 覆盖项（此时默认为 1/(2*integration_s)），或将其设为 { $v4 } Hz。

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED：某条支路的 sigma 不是可用的正有限值（光学 { $opt_sigma_range_m } m，RF { $rf_sigma_range_m } m），因此不形成比值。

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = 未知的 rf_band '{ $other }'（应为 s|x|ka）

engine-e-hybrid-integrity-must-be-finite = { $name } 必须有限

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db 必须有限且 >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint = hybrid-optical-rf | 光学足迹 { $footprint_m } m，{ $detected_photons } 个光子 -> 测距 σ { $c } mm，授时 σ { $c2 } ps | 交叉 RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns（{ $v8 }） | 可用性 { $c4 }%（{ $n_sites } 个站点） | 切换无跳变 { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | 联合 FoM { $score }（A { $availability } · P { $precision_grade } · I { $integrity_assured }） | 已验证 CRLB/χ²-PL/union/handoff，已建模 σ/climatology

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa 必须在 [0, 1] 内

engine-e-impairment-eval-per-class-must-be = n_per_class 必须 >= 1

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | 检测器 { $detector } | AUC 样本内 { $auc_in } / 样本外 { $auc_out }（差距 { $optimism_gap }{ $v5 }） | Pd { $report } Pfa { $report2 } @ 目标 { $target_pfa } | { $n_cases } 个用例 | MODELLED 合成

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = 未知的检测器 '{ $other }'（energy|agc|sqm|parity|fused）

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = 未知的 imu_grade { $other }；应为 navigation、tactical、industrial、consumer 之一

engine-e-inertial-coast-unknown-combination-expected-one-of = 未知的 combination { $other }；应为 rss、linear-sum、det-sum-stoch-rss 之一

engine-e-inertial-coast-unknown-trn-fix-mode-expected = 未知的 trn_fix_mode { $other }；应为 none、position-only、full-reset 之一

engine-e-inertial-coast-must-be-finite-and-non = { $name } 必须有限且非负（实际为 { $v }）

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m 至少须指定一个阈值

engine-e-inertial-coast-crossing-thresholds-entries-must-be = crossing_thresholds_m 的各项必须有限且为正（实际为 { $t }）

engine-e-inertial-coast-grades-must-name-at-least = grades 至少须指定一个 IMU 等级

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s 必须有限且非负（实际为 { $v }）

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 必须有限且非负（实际为 { $a }）

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg 必须有限且在 (-89, 89) 内（实际为 { $lat }）

engine-e-inertial-coast-height-must-be-within-1000 = height_m 必须在 [-1000, 100000] 内（实际为 { $h }）

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s 必须为正

engine-e-inertial-coast-drift-band-must-satisfy-lo = 漂移带必须满足 0 < lo < hi（实际为 lo={ $lo }，hi={ $hi }）

engine-e-inertial-coast-serializing-ins-trn-coast-result = 序列化 ins-trn-coast 结果：{ $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU，{ $speed } m/s，组合方式 { $comb } | { $heads } | TRN { $mode } 峰值 { $peak_error_m } m，历时 { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance }（q_va 由冷原子干涉仪物理推导）

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = 场景为 { $toml_text } 字节，超过 { $max_bytes } 字节的限制

engine-e-inline-only-the-scenario-kind-reads-its = 场景类型 `{ $kind }` 从主机上的文件读取数据，因此此界面不运行它；请使用 `kshana` 命令行

engine-e-inline-only-the-field-names-file-this = 字段 `{ $k }` 指定了文件：此界面只接受内联内容

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip：{ $e }

engine-e-interference-map-adsb-trace-json = 轨迹 JSON：{ $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = 未知的数据集 `{ $key }`；已批准：{ $v1 }，或自定义数据集

engine-e-interference-map-api-dataset-is-data-but-the = 数据集 `{ $key }` 是 { $kind } 数据，但输入类型是 { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } 不是 YYYY-MM-DD 日期

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = 未知选项 `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = 应有 { $positionals } 个位置参数，实际为 { $pos }

engine-e-interference-map-cli-cannot-read = 无法读取 { $path }：{ $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom 需要 { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } 已存在；Kshana 不会覆盖地图。请将其移除，或另选 --out 目录

engine-interference-map-cli-note-cell-deg-is-not = 注：--cell-deg { $cell_deg } 不是预先登记的网格大小（{ $PREREGISTERED_CELL_DEG }）；地图中已注明

engine-e-interference-map-cli-cannot-create = 无法创建 { $out }：{ $e }

engine-interference-map-cli-wrote-cells-published-flagged = 已写入 { $path }：已发布 { $cells } 个网格，已标记 { $n_deg } 个

engine-interference-map-cli-no-usable-rows-nothing-written = 没有可用的行：未写入任何内容

engine-e-interference-map-cli-unknown-subcommand = 未知的子命令 `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = 下载文件的 SHA-256（{ $got }）与固定值（{ $expected }）不一致；已丢弃

engine-e-interference-map-cli-cannot-write = 无法写入 { $dest }：{ $e }

engine-e-interference-map-cli-curl-was-not-found-on = 在 PATH 中未找到 curl。请安装 curl，或自行下载 { $NATURAL_EARTH_LAND_URL }，并核对其 SHA-256 是否为 { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = 无法运行 curl：{ $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = 已写入 { $out }：Natural Earth 陆地多边形，SHA-256 已校验（公有领域，https://www.naturalearthdata.com/about/terms-of-use/）

engine-e-interference-map-cli-no-trace-full-files-under = 在 { $path } 下没有 trace_full_* 文件

engine-e-interference-map-cli-cannot-read-2 = 无法读取 { $spec }：{ $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } 不是 YYYY-MM-DD 日期

engine-e-interference-map-cli-bad-map-date = { $f }：地图日期有误

engine-e-interference-map-cli-cannot-write-2 = 无法写入 { $out }：{ $e }

engine-interference-map-cli-route-length-km = 航线长度 { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = 注意事项：性能下降的网格不能说明干扰是原因；未观测的网格不能证明航线畅通；这不是预报。

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = 陆地多边形：JSON 无效：{ $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = 缺少必需的列 `{ $name }`

engine-e-interference-map-cannot-read-input = 无法读取输入：{ $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` 不是日期（YYYY-MM-DD）

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours 必须为 { $MIN_DELAY_HOURS } 或更大：观测站不会更早发布

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg 必须为 { $MIN_CELL_DEG } 或更粗：观测站只发布粗网格

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } 尚不可发布：其产品最早于 { $fmt_utc } 发布（当天结束后 { $delay_hours } h）

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORY  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED

engine-interference-map-observatory-source-licence = SOURCE { $dataset }  LICENCE { $dataset2 }

## src/interference_map/observatory.rs

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (PUBLISHED CELLS)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana 观测站，ADS-B 导航精度地图，{ $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = 无法创建 { $path }（Kshana 不会覆盖产品）：{ $e }

engine-e-interference-map-observatory-the-input-has-no-usable = 输入中没有 { $day } 的可用报告（已找到的日期：{ $days }）

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } 已存在；Kshana 不会覆盖产品

engine-interference-map-observatory-cells-published-degraded-incident = 已发布 { $p } 个网格，{ $p2 } 个性能下降，{ $p3 } 起事件

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } 行在 { $variants } 种变体下回放：{ $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = 地图不是有效的 JSON：{ $e }

engine-e-interference-map-route-route-invalid-json = 航线：JSON 无效：{ $e }

engine-e-interference-map-route-route-line-is-not-lat = 航线：第 { $v1 } 行不是 `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 } 导出。历元：{ $epoch_note }。运动对象：GCRS（referenceFrame INERTIAL），单位为米，时间为历元之后的秒数。固定站点：地固 WGS 84（referenceFrame FIXED），单位为米。

engine-interop-czml-position-gcrs-metres = { $description }（{ $role }）。位置：GCRS，单位为米。

engine-interop-czml-latitude-deg-longitude-deg-height = { $description }（{ $role }）。纬度 { $lat_deg } deg，经度 { $lon_deg } deg，高度为 WGS 84 椭球以上 { $h_m } m。位置：地固，单位为米。

engine-interop-czml-radius-along-the-ground = { $description }。沿地面的半径为 { $radius_m } m。

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }。无时间：WGS 84 经度和纬度（单位为度），贴地。

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }。地固位置；MultiLineString 在反子午线处被切断，此后 times_utc 只列出原始样本。

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 } 导出。历元：{ $epoch_note }。

engine-e-interop-geojson-invalid-geojson = GeoJSON 无效：{ $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString 没有 coordinates 数组

engine-e-interop-geojson-an-rfc-7946-linestring-needs = RFC 7946 的 LineString 需要两个或更多位置

engine-interop-geojson-position-is-not-an-array = 位置 { $i } 不是由两个或三个数字组成的数组

engine-interop-geojson-position-longitude-is-not-number = 位置 { $i }：经度不是数字

engine-interop-geojson-position-latitude-is-not-number = 位置 { $i }：纬度不是数字

engine-e-interop-geojson-position-longitude-is-outside-180 = 位置 { $i }：经度 { $lon } 超出 [-180, 180]（GeoJSON 经度在前）

engine-e-interop-geojson-position-latitude-is-outside-90 = 位置 { $i }：纬度 { $lat } 超出 [-90, 90]（GeoJSON 经度在前）

engine-e-interop-geojson-track-needs-two-or-more = 航迹需要两个或更多航路点

engine-e-interop-geojson-the-route-spans-more-than = 航线的经度跨度超过 180 度；航迹类场景按普通的度步进，不能跨越反子午线

engine-e-interop-geojson-position-is-deg-from-an = 位置 { $worst } 与等间距直线航迹相差 { $worst2 } deg（容差 { $tol_deg } deg）；航迹类场景按 start + i*step 飞行，因此请给出直线上等间距的位置，或只给出两端

engine-e-interop-geojson-route-applies-to-the-kinds = 航线适用于飞行航路点航迹的场景类型（terrain-nav、terrain-slam、gravity-map、combined-altpnt）；`{ $k }` 不接受轨迹输入

engine-e-interop-geojson-scenario-toml-is-not-table = 场景 TOML 不是表

engine-e-interop-geojson-cannot-serialise-scenario = 无法序列化场景：{ $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = 未知的导出格式 '{ $other }'；应为 czml、kml、geojson、stk、sigmf、all 或 list 之一

engine-e-interop-member = 成员 { $label }：{ $e }

engine-interop-the-scenario-could-not-be = 无法导出该场景：{ $m }

engine-e-interop-invalid-spectrum-scenario = 频谱场景无效：{ $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than = { $n } 个时间样本超过一次导出可写入的数量（{ $MAX_SAMPLES }）

engine-e-interop-scene-objects-samples-is-more-than = { $items } 个对象 x { $times } 个样本超过一次导出可写入的数量（{ $MAX_SAMPLES }）

engine-e-interop-scene-invalid-scenario = { $kind } 场景无效：{ $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type } 干扰源，发射功率 { $power_dbw } dBW，天线增益 { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }；{ $r } m，由压制干扰（jamming）类场景的链路方程得出，干扰源位于接收机的地平线处，并计入自由空间损耗

engine-interop-scene-the-chain-pass-stage = { $epoch_note }（链的 [pass] 阶段）

engine-interop-scene-circular-orbit-km-altitude-deg = 圆轨道，高度 { $altitude_km } km，倾角 { $inclination_deg } deg（窗口起点的 SGP4 平均根数，与 passes 类场景的外推方式相同）

engine-interop-scene-ground-station-deg-elevation-mask = 地面站，高度角掩码 { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }；GCRS 和地固状态是星历类场景自身的输出（UT1 和极移按场景设定）

engine-interop-scene-static-scene-the-kind-flies = 静态场景：{ $kind } 类场景飞行一条无时间的航路点航迹

engine-interop-scene-true-track-flown-gps-denied = 在 GPS 拒止条件下飞行的真实航迹：{ $track } 个航路点，自 start_lat_deg/start_lon_deg 起，按 step_lat_deg/step_lon_deg 步进

engine-e-interop-scene-has-no-scene = `{ $kind }` 没有场景

engine-e-interop-scene-missing-numeric = 缺少数值 `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = 缺少整数 `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } 超出 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f }，高度 { $altitude_km } km，倾角 { $inclination_deg } deg（SGP4）

engine-interop-scene-the-scenario-gives-no-epoch = 场景未给出 `epoch`；t = 0 为 { $epoch }，即各卫星自身数据（TLE、广播星历或 SP3 历元）所带的最早历元。每颗卫星从各自的历元外推，这些历元相差 { $spread_h } h：时间标签遵循引擎的前提，即每颗卫星都从 t = 0 开始，而每个位置按该卫星自身的时刻旋转到 GCRS 和地固坐标系。SP3 和 OEM 导出则改把 t = 0 标为 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = 场景未给出 `epoch`；t = 0 为 { $epoch }，即各卫星自身数据（TLE、广播星历或 SP3 历元）所带的历元。SP3 和 OEM 导出则改把 t = 0 标为 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } 个对象 x { $times_s } 个样本超过一次导出可写入的数量（{ $MAX_SAMPLES }）

engine-interop-scene-user-moving-the-kind-constant = { $user_environment } 用户，运动中（该类场景的恒定速度和航向）

engine-interop-scene-user-receiver = { $user_environment } 用户（接收机）

engine-interop-scene-user-orbit-km-altitude-deg = 用户轨道，高度 { $altitude_km } km，倾角 { $inclination_deg } deg（开普勒{ $v3 }）

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = 没有运动对象 { $index }

engine-interop-stk-kshana-export-object = # Kshana { $v1 } 导出：{ $scene }，对象 { $id }（{ $role }）{ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type } 干扰源，发射功率 { $power_dbw } dBW，天线增益 { $gain_dbi } dBi（场景链路预算的参数，而非信号）

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` 没有可导出的载体轨迹；试验台导出涵盖 gnss-ins、jamming 和 gnss-sim 类场景

engine-e-interop-testbench-empty-motion-csv = 运动 CSV 为空

engine-e-interop-testbench-motion-csv-header-is-not = 运动 CSV 表头不是预期的列：{ $head }

engine-e-interop-testbench-row-fields-expected = 第 { $v1 } 行：{ $f } 个字段，应为 { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = 第 { $v1 } 行：列 { $motion_columns } 不是数字

engine-e-interop-testbench-line-no = 第 { $v1 } 行：没有 `$`

engine-e-interop-testbench-line-no-checksum = 第 { $v1 } 行：没有校验和

engine-e-interop-testbench-line-bad-checksum-field = 第 { $v1 } 行：校验和字段有误

engine-e-interop-testbench-line-checksum-mismatch = 第 { $v1 } 行：校验和不匹配

engine-e-interop-testbench-line-short-gga = 第 { $v1 } 行：GGA 过短

engine-interop-testbench-line-bad-latitude = 第 { $v1 } 行：纬度有误

engine-interop-testbench-line-bad-longitude = 第 { $v1 } 行：经度有误

engine-e-interop-testbench-line-bad-altitude = 第 { $v1 } 行：高度有误

engine-e-interop-testbench-line-bad-separation = 第 { $v1 } 行：间距有误

engine-e-interop-testbench-line-short-rmc = 第 { $v1 } 行：RMC 过短

engine-e-interop-testbench-line-rmc-with-no-preceding = 第 { $v1 } 行：RMC 之前没有 GGA

engine-e-interop-testbench-line-gga-and-rmc-times = 第 { $v1 } 行：GGA 与 RMC 的时间不同

engine-e-interop-testbench-line-bad-speed = 第 { $v1 } 行：速度有误

engine-e-interop-testbench-line-bad-course = 第 { $v1 } 行：航向有误

engine-e-interop-testbench-line-bad-time-or-date = 第 { $v1 } 行：时间或日期有误

engine-e-interop-testbench-gga-with-no-following-rmc = GGA 之后没有 RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = 航路点文件至少需要两个样本

engine-e-interop-testbench-the-sample-step-is-not = 样本步长 { $step } s 不是整数毫秒

engine-e-interop-testbench-the-samples-are-not-equally = 样本不是等间距的：间隔 { $v1 } 为 { $dt } s，第一个为 { $step } s

engine-e-interop-testbench-empty-waypoint-file = 航路点文件为空

engine-e-interop-testbench-waypoint-not-three-numbers = 航路点 { $v1 }：不是三个数字

engine-e-interop-testbench-waypoint-fields-expected = 航路点 { $v1 }：{ $f } 个字段，应为 3 个

engine-e-interop-testbench-events-csv-header-is-not = 事件 CSV 表头不是 label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = 事件第 { $v1 } 行：应为 5 个字段

engine-e-interop-testbench-event-row-unknown-kind = 事件第 { $v1 } 行：未知的 kind { $f }

engine-e-interop-testbench-event-row-bad-onset = 事件第 { $v1 } 行：onset 有误

engine-e-interop-testbench-event-row-bad-end = 事件第 { $v1 } 行：end 有误

engine-interop-testbench-no-waypoints-txt-written = 未写入 .waypoints.txt：{ $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = 不是 UTC 时间 `YYYY-MM-DDTHH:MM:SS`：{ $why }：{ $text }

## src/ionex.rs

engine-e-ionex-missing = 缺少 { $what }

engine-e-ionex-bad-number-in = { $what }：{ $col } 中的数字有误

engine-e-ionex-two-digit-year = { $what }：两位数年份 { $year }

engine-e-ionex-no-end-of-header = 没有 END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = 不支持随高度变化（3-D）的 IONEX 地图

engine-e-ionex-zero-grid-step = 网格步长为零

engine-e-ionex-grid-needs-at-least-nodes = 网格至少需要 2 x 2 个节点

engine-e-ionex-map-no = 地图 { $index }：没有 { $end_label }

engine-e-ionex-map-band-latitude-header-grid = 地图 { $index }：纬带 { $band } 的纬度为 { $band_lat }，表头网格为 { $want }

engine-e-ionex-map-band-longitudes-differ = 地图 { $index }：纬带 { $band } 的经度不一致

engine-e-ionex-map-band-truncated = 地图 { $index }：纬带 { $band } 被截断

engine-e-ionex-map-bands-header-grid-has = 地图 { $index }：{ $band } 个纬带，表头网格有 { $n_lat } 个

engine-e-ionex-map-no-epoch-of-current = 地图 { $index }：没有 EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } 幅 TEC 地图，表头 # OF MAPS IN FILE 为 { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = TEC 地图历元不递增

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz 不能在每个 { $code } 周期内容纳整数个样本（{ $spc } 个样本）

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods 和 noncoherent 必须为正

engine-e-iq-acq-stream-ended-after-of-samples = 数据流在 { $got } 个样本后结束，需要 { $needed } 个

engine-e-iq-acq-cfar-reference-cells-must-be = CFAR 参考单元数必须为偶数且至少为 2（实际为 { $n }）

engine-e-iq-acq-cfar-stride-must-be-at = CFAR 步幅必须至少为 1 个时延

engine-e-iq-acq-cfar-per-cell-pfa-must = CFAR 每单元 Pfa 必须在 (0, 1) 内（实际为 { $pfa_cell }）

engine-e-iq-acq-cfar-window-reaches-lags-each = CFAR 窗口向每侧延伸 { $reach } 个时延，对 { $samples_per_period } 个时延的周期而言过宽

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = 未知的曲面格式 { $s }：应为 csv、json 或 bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = 该曲面将含有 { $spc_cells } 个单元（上限 { $MAX_SURFACE_CELLS }）：请加大多普勒步长或缩小多普勒范围

engine-e-iq-acq-surface-surface-header = 曲面表头：{ $e }

engine-e-iq-acq-surface-surface-schema-expected = 曲面模式 { $schema }；应为 { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = 曲面主体：{ $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = 记录 '{ $id }'：format 和 sample_rate_hz 必须同时给出

engine-e-iq-campaign-conditions-test-conditions-json = 测试条件（JSON）：{ $e }

engine-e-iq-campaign-conditions-test-conditions-toml = 测试条件（TOML）：{ $e }

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }：events_from_sigmf 需要 SigMF 记录（实际为 { $rec }）

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF 元数据：{ $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF 元数据：缺少 global core:sample_rate

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }：缺少 core:sample_start

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }：没有 core:sample_count，也没有功率点可用来结束该事件

engine-e-iq-campaign-conditions-kshana-test-event = { $at }：kshana:test_event：{ $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema 必须为 "{ $SCHEMA }"（实际为 "{ $schema }"）

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id 不得为空

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s 必须有限且 >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 必须为 64 位十六进制数字

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind 必须为 "iq" 或 "receiver-log"（实际为 "{ $k }"）

engine-e-iq-campaign-conditions-at-least-one-expected-group = 至少需要一个 [[expected]] 组

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }：ids 不得为空

engine-e-iq-campaign-conditions-lists-value-give-one-per = { $at }：{ $key } 列出 { $n } 个值；请为每个 id 给出一个（{ $ids }）

engine-e-iq-campaign-conditions-duplicate-id = { $at }：id 重复

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }：offset_s 必须晚于 onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }：affects 必须为 "all" 或 id 列表

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }：affects 的 id { $bad } 不在 [[expected]] 中

engine-e-iq-campaign-conditions-must-be-positive = { $at }：q 必须为正

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }：power.points 不得为空

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }：power.points 必须按时间顺序排列

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }：power.points 必须有限

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }：power.quantity = "jammer_dbm" 需要 reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = 事件 '{ $id }' 与 '{ $id2 }' 在共用卫星上重叠

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s 必须 >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s 必须为正

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = 记录 '{ $id }'：SHA-256 { $sha } 与声明的 { $want } 不一致

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl：{ $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }：记录含有 { $buf } 个样本，捕获需要 { $n } 个

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s 必须为正

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db 必须为正

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s 必须 >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz 必须为正

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs 必须至少为 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = 测评活动（JSON）：{ $e }

engine-e-iq-campaign-spec-campaign-toml = 测评活动（TOML）：{ $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions 必须至少列出一个文件或通配模式

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds 必须 >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = 前端名称必须非空且唯一（'{ $name }'）

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions：'{ $pat }' 没有匹配的文件

engine-e-iq-campaign-spec-recording-id-appears-in-both = 记录 id '{ $w }' 同时出现在 { $w2 } 和 { $w3 } 中

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names 需要 inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names：{ $path } 中没有设计 '{ $n }'

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = 真值第 { $v1 } 行：{ $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0 剖面：{ $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0 剖面：{ $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = 分段 { $i }：阶跃值必须有限

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = 分段 { $i }：斜坡需要 end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = 分段 { $i }：points 需要等长且非空的 t_s 和 db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = 分段 { $i }：t_s 必须严格递增

engine-iq-channel-cn0-profile-segment-points-must-be-finite = 分段 { $i }：points 必须有限

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = 分段 { $i }：衰落 s4 必须在 (0, 1] 内

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = 分段 { $i }：衰落 tau_s 必须为正

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }：记录含有 { $samples } 个样本，本次搜索需要 { $need } 个

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }：请用 --surface-format csv|json|bin 指定格式，或让路径以 .csv、.json 或 .bin 结尾

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = 捕获：{ $fs_hz } Hz，{ $coherent_periods } 个相干周期 x { $noncoherent } 次非相干，pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = 报告已重建：{ $cells_present }/{ $cells_total } 个单元，{ $rows } 行，其中 { $rows_failed } 行未达判据；摘要 { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    测评活动 { $name }：{ $cells_total } 个单元；已完成 { $cells_skipped } 个，本次运行 { $cells_run } 个，失败 { $cells_failed } 个，待处理 { $cells_pending } 个
    输出：{ $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    首个失败（{ $key }…）：{ $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK：{ $events } 个事件，{ $tc } 颗预期卫星；条件哈希 { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = 电离层斜向 { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = 电离层垂直 { $t } TECU

engine-iq-cli-channel-tropo-doy = 对流层 doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = 闪烁 S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = 多路径 { $h }m { $multipath_ground } 地面

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground 必须为 dry、wet 或 sea（实际为 { $other }）

engine-e-iq-cli-channel-give-at-most-one-of = --iono-stec、--iono-vtec、--iono-klobuchar 至多给出一个

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass 需要 lo,hi（实际为 { $v }）

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass 需要 lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } 在过渡带 { $transition } Hz 时放不进 fs/2（{ $v1 } Hz）以下；请缩窄频带或过渡带

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits 必须在 1..=16 内（实际为 { $bits }）

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = 已将 { $total } 个样本（{ $fs_hz } Hz）滤波并写入 { $out }（{ $format }）；附属文件 { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = 无法读取 { $path }：{ $e }

engine-iq-cli-labfit-invalid-labfit-scenario = labfit 场景无效：{ $e }

engine-iq-cli-labfit-fitted-run-wrote = 已拟合 { $runs } 次运行；已写入 { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = 已从测评活动拟合 { $fit_units } 个单元；已写入 { $written }

engine-iq-cli-labfit-cannot-write = 无法写入 { $target }：{ $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } 需要一个值

engine-e-iq-cli-cannot-parse = { $k }：无法解析 { $v }

engine-iq-cli-iq-takes-positional-argument-got = iq { $cmd } 需要 { $n } 个位置参数，实际为 { $pos }

engine-e-iq-cli-cannot-parse-2 = { $k }：无法解析 { $p }

engine-iq-cli-unknown-iq-processing-command-expected = 未知的 iq 处理命令 { $other }；应为 scene、acquire、track、sweep、labfit、frontend、monitor、campaign 或 conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } 超出 GPS 的范围

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = 未找到所请求 PRN 的健康 GPS 星历

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos 需要 lat,lon,alt（实际为 { $v }）

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }；C/N0 剖面（{ $segments } 段）

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format 必须为 csv 或 jsonl（实际为 { $other }）

engine-iq-cli-scene-written-by-kshana-iq-scene = 由 kshana iq scene 写入：SIMULATED 场景，而非记录

engine-iq-cli-scene-ion-sdr-metadata = ION SDR 元数据 { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF 数据 { $data_path }，元数据 { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = 由 kshana iq scene 写入

engine-iq-cli-scene-wrote-samples-hz-to-truth = 已将 { $samples } 个样本（{ $format }，{ $fs_hz } Hz）写入 { $data_path }；{ $truth_records } 条真值记录写入 { $truth_path }；{ $meta_note }；信道：{ $chan_desc }

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } 不能与 --design 同用：sweep 会运行文件中的每个设计

engine-iq-cli-sweep-loop-design-sweep-design-prn = 环路设计扫描：{ $rows } 个（设计，PRN）结果{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }：记录含有 { $samples } 个样本，捕获需要 { $need } 个

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }：未捕获（统计量 { $statistic } < 门限 { $threshold }）；请调高 --doppler-max、--acq-coherent 或 --acq-noncoherent，或检查记录

engine-iq-cli-track-designs-and-differ-in-integration = 设计 { $first } 与 { $d } 的 integration.extra_taps_chips 不同；同一次运行的各设计必须一致，使每条输出记录的列相同

## src/iq/cli/track.rs

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }：请用 --epochs-format csv|jsonl|bin 指定格式，或让路径以 .csv、.jsonl 或 .bin 结尾

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz 为每个 { $c } 码片 { $r } 个样本：可公度采样会使码鉴别器呈阶梯状（每码片 2 个样本时 DLL 抖动，在 45 dB-Hz 下码误差约为 { $lit_0_09 } 码片 RMS）；由该记录得到的码环抖动和偏差不具代表性。请使用不是码速率一半的整数倍的采样率来评判码环。

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = 工作进程在处理此输入之前已退出

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = 未知选项 { $s }

engine-e-iq-io-cli-format-needs-rate = --format 需要 --rate

engine-iq-io-cli-iq-takes-path-argument-got = iq { $cmd } 需要 { $n } 个路径参数，实际为 { $pos }

engine-iq-io-cli-unknown-iq-command = 未知的 iq 命令 { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated = 已将 { $n } 个样本（{ $to }，{ $fs_hz } Hz）写入 { $files }；{ $w } 个元素饱和{ $v4 }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }：--follow 只读取单通道记录

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }：--follow 读取只有一次捕获的记录，而此记录有 { $captures } 次

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }：没有为正的 core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }：该捕获不是从字节边界开始

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = 未知的样本格式 { $name }：应为例如 ci8、cu8、ci16_le、ci16_be、cf32_le、cf32_be、ri16_le、ci12r_le、ci12l_be、cu16_le、cu12r_be、ci4_msb、cu4_lsb、c2tc_msb、r2sm_lsb、c2sm_byte，复数格式可选以 _qi 结尾

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = 附属文件 sample_rate_hz { $sample_rate_hz } 不为正

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }：.sdrx 记录只含一路数据流；通道 { $channel } 不存在

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }：原始文件没有附属文件；请说明其格式，或写入 { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = 无法序列化行：{ $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = 滤波器设计 { $design } 无效：passband_frac 须在 (0, 1) 内，衰减 > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz 必须严格位于 0 与采样率一半（{ $v1 } Hz）之间

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx 数据：{ $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization } 位 { $enc } { $fmt }（{ $packed_bits } 位/样本）

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = 不支持的 SigMF core:datatype { $datatype }：支持 ci8、cu8、ci16_le、ci16_be、cf32_le、cf32_be 以及实数的 ri8、ru8、ri16_le、ri16_be、rf32_le、rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } 不是 SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = SigMF 元数据无效：{ $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } 没有 SigMF core:datatype；请将其写为 raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }：core:num_channels { $ch } 与第一条记录的 { $c0 } 不一致

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }：没有 core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }：core:sample_rate { $rate } 不为正

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }：{ $f }（{ $rate } Hz）与第一条记录的 { $f0 }（{ $r0 } Hz）不一致

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out = { $name }：起于样本 { $sample_start } 的捕获顺序错乱，或超出数据中的 { $n_file } 个样本

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }：第一次捕获不是从字节边界开始

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = 请求了通道 { $channel }；该记录有 { $channels } 个通道（通道从 0 起计）

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = SigMF 集合无效：{ $e }

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }：SHA-512 { $got } 与集合中的 { $h } 不一致

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = { $channels } 路交织数据流中的第 { $select } 路不存在（数据流从 0 起计）

engine-e-iq-io-stream-sample-of-does-not-start = { $format } 的样本 { $k } 不是从字节边界开始

engine-e-iq-io-stream-time-window-start-duration-both = 时间窗起点 { $start_s } s，时长 { $duration_s } s：两者都必须非负

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = 所述最具破坏性的 Q（cw）：类型 `{ $event_type }` 没有表值

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }：该测评活动尚未完成

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }：DIGEST { $on_disk } 与各单元（{ $digest }）不一致

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = 记录 `{ $id }`：测试条件哈希 { $h } 与记录的 { $conditions_hash } 不一致

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = 信号 `{ $signal }`：码速率未知

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = 没有可用于锁定拟合的运行：{ $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = 数据不足：未拟合（{ $m } 条记录；至少需要 { $min_rec } 条）

engine-iq-labfit-iqfit-uncensored-span-db-is-under = 未删失的 J/S 跨度 { $span_db } dB 小于 { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff 与 delta 无法分别辨识（|corr| { $full } >= { $v2 }）：模型只依赖 delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed = 未拟合：观测到 { $n_reacq } 次重新捕获（至少需要 3 次）

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = 未知的模式 `{ $m }`（仅支持 `validation`）

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage 必须是 [0, 1] 内的 [lower, upper]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds 必须是满足 0 < lower < upper 的 [lower, upper]

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db 必须是 [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = 该测评活动中没有带已述功率剖面、可用于拟合的事件

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # 基于 IQ 测评活动的实验室拟合：{ $r }

    模式 `{ $schema }`，引擎 { $engine_version }。标签：**{ $label }**。

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = 测评活动 DIGEST `{ $campaign_digest }`；`campaign.json` SHA-256 `{ $campaign_json_sha256 }`；场景 SHA-256 `{ $scenario_sha256 }`；{ $cells } 个单元；{ $bootstrap } 次自助法重复（随机种子（seed）{ $seed }）。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## 单元 { $i }：{ $signal } / { $name } / { $name2 } / { $jammer_type }

    状态：{ $status }。{ $recordings } 条记录，{ $satellites } 颗卫星，{ $events } 个事件；已拟合 { $bins_used } 个分箱，删失 { $bins_censored } 个。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0 模型（{ $q_mode }）：`delta_eff` = { $ci } dB（可辨识的偏移，折算到 Q = 1）；`Q_eff` = { $q }；该 Q 下的 `delta` = { $ci2 } dB；corr(Q, delta) { $om }；残差 RMS { $residual_rms_db } dB，J/S 跨度 { $span_db } dB。没有独立的功率测量，就无法由 C/N0 数据辨识 Q_eff。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q 保持为其所述值：{ $why }。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = 门限 J/S，直接法：{ $n } 次失锁的中位数 { $om } dB（IQR { $t }）。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = 留出验证（留一条记录），内插：{ $bins } 个分箱，C/N0 RMS { $om } dB，PI90 覆盖率 { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = { $model }：{ $n } 个事件，失锁时间 RMS { $om } s，PI90 覆盖率 { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    验证表 SHA-256 `{ $table_sha256 }`（登记于 { $registered }）：

    | 判据 | 限值 | 值 | 结论 |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = 运行 `{ $label }` 日志

engine-e-iq-labfit-run = 运行 `{ $label }`：{ $e }

engine-e-iq-labfit-the-scenario-input-names-no = 场景的 [input] 未指定测评活动

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign 与 [[runs]] 互斥：只能给出其一

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit 场景：{ $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = 日志中没有逐卫星的 C/N0{ $cfg }（observables：[{ $observables }]）

engine-iq-labfit-observe-no-epoch-before-the-onset = 在 { $onset } s 的起始之前没有历元

engine-iq-labfit-observe-no-epoch-at-or-after = 在 { $onset } s 的起始时或之后没有历元

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # 实验室拟合：{ $r }

    标签：**{ $label }**。设置 SHA-256 `{ $settings_sha256 }`。{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db = { "\u000A" }{ $n_samples } 个 C/N0 样本，残差 RMS { $om } dB。{ $r }{ "\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## 模型：{ $model }（{ $label }）

    | 参数 | 值 | 界限 | 位于界限 | 自助法标准差（95 %） |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }{ $n_events } 个事件的事件时间 RMS { $om } s；失锁漏报 { $loss_missed } / 多报 { $loss_extra }，重新捕获漏报 { $reacq_missed } / 多报 { $reacq_extra }。

    | 运行 | 跌落 dB-Hz | 重新锁定 dB-Hz | 事件 | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }留出验证（{ $scheme }，{ $folds } 折）：全部 { $om } s，内插 { $om2 } s，外推 { $om3 } s。

    | 留出的运行 | 类别 | 距离 | 最近的训练运行 | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } 保留供将来使用（只定义了 FID 0）

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } 超出 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = 有 { $sb1_err } 个 SB1 符号与解码字段不一致

engine-iq-lunanet-afs-frames-at-and-are-symbols = 位于 { $w } 和 { $w2 } 的帧相隔 { $gap } 个符号，而非 { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } 跟在 TOI { $w2 } 之后，应为 { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = 符号流中出现意外字符 { $c }（只允许 0、1 和空白）

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }：前 24 个码片不一致

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }：后 24 个码片不一致

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss }（该文件对 PRN 147 和 PRN 151 都印作 A14850；生成器复现的是 PRN 151 的，因此 PRN 147 一项很可能是该文件的印刷错误）

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = 编码 0x{ $word }，解码 FID { $fid } TOI { $toi }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = 静态位置不是有限值

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = 匀速轨迹不是有限值

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = 航路点轨迹没有航路点

engine-e-iq-scene-geometry-waypoint-not-finite = 航路点不是有限值

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = 航路点时间必须严格递增

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = 监测器设置：{ $e }

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } 不是 GPS C/A PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = 星历系统 { $system } 不是 GPS

engine-e-iq-scene-satellite = 卫星 { $value }：{ $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = 是导频（无数据）分量，不携带导航数据

engine-e-iq-scene-nav-carries-data-the-scene-does = 携带场景未建模的数据；请在不带数据的情况下生成

engine-e-iq-scene-nav-does-not-carry-gps-lnav = 不携带 GPS LNAV（只有 GPS L1 C/A 携带）；请使用种子数据

engine-e-iq-scene-nav-not-an-lnav-source = 不是 LNAV 来源

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = 场景至少需要一颗卫星（--prn）

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler 列出 { $dopplers } 个值；请为每个 --prn 给出一个（{ $ids }），或只给一个值

engine-e-iq-scene-synthetic-data = --data：{ $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = 真值行有 { $f } 个字段，应为 10 个

engine-e-iq-scene-truth-truth-field = 真值字段 { $i }：{ $e }

engine-e-iq-scene-truth-truth-sat-id = 真值 sat_id：{ $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz 必须是正数

engine-e-iq-short-duration-must-be-in = duration_s 必须在 (0, { $MAX_DURATION_S }] 内

engine-e-iq-short-ids-must-hold-to-satellites = ids 必须含 1 至 { $MAX_SATELLITES } 颗卫星

engine-e-iq-short-dopplers-must-be-finite = dopplers 必须有限

engine-e-iq-short-samples-requested-short-run-holds = 请求了 { $n } 个样本；一次短运行最多容纳 { $MAX_SAMPLES } 个

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C 数据 PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C 导频 PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }：PRN { $id } 超出范围

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF 频率通道 { $id } 超出 -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = 未知的信号 { $other }；应为以下之一：{ $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = 第 { $v1 } 行：没有 ';'

engine-e-iq-signals-galileo-line-no-code-number-in = 第 { $v1 } 行：{ $label } 中没有码编号

engine-e-iq-signals-galileo-code-appears-twice = 码 { $number } 出现两次

engine-e-iq-signals-galileo-codes-the-icd-defines = { $path }：{ $n } 个码，ICD 定义了 { $CODES_PER_COMPONENT } 个

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q 主码 { $primary_prn } S{ $secondary } 第三级码 { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q 主码 { $primary_prn } S{ $secondary }（省略第三级码）

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = 非十六进制字符 { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } 个十六进制符号无法恰好容纳 { $len } 个码片

engine-iq-signals-primary-only = { $name }（仅主码）

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC 跟踪需要 (0, { $max }) 码片内的超前-滞后间隔，使 E 和 L 保持在主峰上（实际为 { $spacing_chips }）

engine-e-iq-track-boc-bump-jump-threshold-must-be = 峰跳变门限必须至少为 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = 采样率必须为正

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods 必须为正

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows 必须为正

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } 必须能整除比特长度 { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = 最多支持 { $MAX_EXTRA_TAPS } 个额外抽头（实际为 { $extra_taps_chips }{ $v2 }）

engine-e-iq-track-channel-extra-tap-offsets-must-be = 额外抽头偏移必须有限且在 ±{ $MAX_TAP_OFFSET_CHIPS } 码片以内（实际为 { $t }）

engine-e-iq-track-channel-n0-window-needs-at-least = C/N0 窗口至少需要 2 个即时值

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }：应为 atan2、costas-atan 或 costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }：应为 cross-product、atan2 或 atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }：应为 pull-in 或 always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }：应为 eml-power、dot-product 或 eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }：应为 pll、fll 或 fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } 不适用于 carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }：应为 >= 0 的数（0 表示关闭限幅）

engine-e-iq-track-design-must-be-positive-number-got = { $k } 必须是正数（实际为 { $v }）

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods 必须至少为 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips 必须在 (0, 2] 内（实际为 { $d }）

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips 最多含 { $MAX_EXTRA_TAPS } 个偏移（实际为 { $taps }）

engine-e-iq-track-design-integration-extra-taps-chips-offsets = integration.extra_taps_chips 的偏移必须有限且在 ±{ $MAX_TAP_OFFSET_CHIPS } 码片以内（实际为 { $t }）

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli（{ $on }）必须小于 carrier.fll_off_pli（{ $off }），两者都在 (-1, 1] 内

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s 必须为零或正（实际为 { $t }）

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s 必须为正（实际为 { $t }）

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order 必须为 1、2 或 3（实际为 { $o }）

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order 必须为 1 或 2（实际为 { $o }）

engine-e-iq-track-design-code-order-must-be-or = code.order 必须为 1 或 2（实际为 { $order }）

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold 必须在 [-1, 1] 内（实际为 { $pli }）

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows 必须至少为 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods 必须至少为 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s（{ $reacq_max_interval_s }）不得小于 lock.reacq_interval_s（{ $reacq_interval_s }）

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db 必须有限

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes 必须至少为 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods 必须至少为 1（或 "auto"）

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent 必须至少为 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa 必须在 (0, 1) 内（实际为 { $pfa }）

engine-e-iq-track-design-design-overrides = 设计覆盖项：{ $e }

engine-e-iq-track-design-design-overrides-may-not-set = 设计覆盖项不得设置 name 或 extends

engine-e-iq-track-design-loop-design-file = 环路设计文件：{ $e }

engine-e-iq-track-design-loop-design-file-schema-is = 环路设计文件：不支持 schema { $other }；应为 { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = 环路设计文件：缺少 schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = 环路设计文件：没有 [[design]] 表

engine-e-iq-track-design-loop-design-file-design-number = 环路设计文件：第 { $v1 } 个 [[design]] 没有名称

engine-e-iq-track-design-loop-design-file-design-name = 环路设计文件：设计名称 { $name } 是保留名或为空

engine-e-iq-track-design-loop-design-file-design-is = 环路设计文件：设计 { $name } 被定义了两次

engine-e-iq-track-design-no-design-named-the-file = 没有名为 { $n } 的设计；该文件含有 { $value }

engine-e-iq-track-design-loop-design-file-design-extends = 环路设计文件：设计 { $name } 扩展自身（循环）

engine-e-iq-track-design-loop-design-file-design-extends-2 = 环路设计文件：设计 { $name } 扩展未知的设计 { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = 相位环需要阶数 1..=3 且 Bn > 0（实际为 { $o }，{ $bn }）

engine-e-iq-track-filter-frequency-loop-needs-bn-got = 频率环需要 Bn > 0（实际为 { $bn }）

engine-e-iq-track-filter-frequency-loop-order-must-be = 频率环阶数必须为 1 或 2（实际为 { $o }）

engine-e-iq-track-filter-loop-filter-needs-phase-path = 环路滤波器需要相位通路、频率通路，或两者兼有

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = 超前-滞后间隔必须在 (0, 2] 码片内（实际为 { $spacing_chips }）

engine-e-iq-track-dll-order-must-be-or = DLL 阶数必须为 1 或 2（实际为 { $dll_order }）

engine-e-iq-track-chip-rate-and-carrier-frequency = 码速率和载波频率必须为正

## src/iq/track/sink.rs

engine-e-iq-track-sink-an-epoch-carries-extra-taps = 某个历元带有 { $extra } 个额外抽头，但输出是按 { $n } 个设置的：一次运行的每个通道必须使用相同的 extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = 一条记录为 { $b } 字节；应为 { $want }

engine-e-iq-track-sink-unknown-lock-state-code = 未知的锁定状态码 { $b }

engine-e-iq-track-sink-epoch-file-header = 历元文件表头：{ $e }

engine-e-iq-track-sink-epoch-file-schema-expected = 历元文件 schema { $schema }；应为 { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = 历元文件的记录为 { $record_bytes } 字节；此读取器期望 { $want }（{ $BINARY_RECORD_BYTES } 加上每个额外抽头 { $BINARY_TAP_BYTES }）

engine-e-iq-track-sink-epoch-file-ends-inside-record = 历元文件在一条记录中间结束（{ $size } 字节中的 { $got } 字节）

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = 历元格式 { $o }：应为 csv、jsonl 或 bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }：`{ $s }` 不是数字

engine-e-jammertest-cli-is-not-utf-text = { $path } 不是 UTF-8 文本

engine-e-jammertest-cli-needs-catalog = 需要 --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = 至少需要一个 --plan

engine-e-jammertest-cli-is-not-utf = { $cat } 不是 UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } 不是 UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format：`{ $s }` 不是 ubx、rinex、android、nmea 之一

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` 不是 UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = 需要 --log-start，或带 --format 的 --log

engine-e-jammertest-cli-log-needs-format = --log 需要 --format

engine-e-jammertest-cli-the-log-does-not-state = 日志未给出其起始时间：请使用 --log-start

engine-e-jammertest-cli-the-log-states-its-start = 日志给出的起始时间为 `{ $label }`：请使用 --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } 不是 UTF-8

engine-e-jammertest-cli-cannot-write = 无法写入 { $o }：{ $e }

engine-jammertest-cli-events-written-to-non-rf = 已将 { $events } 个 { $SCHEDULED_TRUTH } 事件写入 { $o }（跳过 { $skipped_non_rf } 个非 RF 时隙，{ $outside_log } 个在日志之外，{ $unknown_ids } 个 id 不在目录中）

engine-jammertest-cli-note-ids-not-in-the = 注：不在目录中的 id：{ $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = 注：这些是计划的预定时隙，而非记录下的实际播发时间。

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  测试名称

## src/jammertest/cli.rs

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } 项测试，{ $evaluable } 项可评估：{ $detected } 项在容差内检出，{ $late } 项迟检，{ $missed } 项漏检；中位延迟 { $fmt_opt }，中位恢复时间 { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = 所有时隙之外的虚警：{ $false_alarm_runs } 次运行，在 { $clean_epochs } 个干净历元中有 { $false_alarm_epochs } 个

engine-e-jammertest-cli-needs-session-path = 需要会话路径

engine-e-jammertest-cli-needs-catalog-and-plan-or = 需要 --catalog 和 --plan，或 --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = 证据包已写入 { $out }；签名者指纹 { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = 在 { $root } 下没有同时含有 scenario.json 和 .ubx 的文件夹

engine-e-jammertest-dataset-scenario = 场景：{ $e }

engine-e-jammertest-dataset-read = 读取：{ $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json 没有日期

engine-e-jammertest-dataset-scenario-json-date-is-not = scenario.json 的日期 `{ $date }` 不是日期

engine-e-jammertest-dataset-no-readable-epoch-in-mon = mon_rf.csv 或 rinex.csv 中没有可读取的历元

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = 在 { $root } 下没有含有 scenario.json 的文件夹

engine-jammertest-dataset-recovered-of-median = { $f2 } 已恢复（{ $alarmed } 中的 { $recovered }），中位 { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = 日志给出的起始时间为 `{ $l }`，不是 UTC ISO-8601：请明确给出起始时间

engine-e-jammertest-the-log-does-not-state = 日志未给出其起始时间：请明确给出

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = 目录不是 JSON：{ $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = 目录没有 `test_types` 数组

engine-e-jammertest-plan-test-type-has-no-type = 某个测试类型没有 `type_id`

engine-e-jammertest-plan-test-group-has-no-group = 某个测试组没有 `group_id`

engine-e-jammertest-plan-test-has-no-test-id = 某项测试没有 `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = 目录中没有列出任何测试

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` 不是形如 2025-09-15T14:00:00 的计划时间

engine-e-jammertest-plan-plan-is-not-json = 计划不是 JSON：{ $e }

engine-e-jammertest-plan-plan-has-no-locations-array = 计划没有 `locations` 数组

engine-e-jammertest-plan-test-end-time-is-not = 测试 { $id }：end_time 不晚于 start_time

engine-e-jammertest-plan-the-plan-has-no-test = 计划中没有试验区 { $l }；它有 { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = 计划中有多个试验区 { $areas }；请说明日志是在哪一个中记录的

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json 不是 JSON：{ $e }

engine-e-jammertest-plan-no-attack-log-array = 没有 `attack_log` 数组

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }：Jammertest 2024 测试 { $id } 窗口 { $n }（{ $attack }）

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log 中没有起止窗口

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = 有 { $events } 个预定事件，但本次运行评分的是 { $events2 } 个：请传入该运行自身的事件

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s 必须为正，guard_s 不得为负

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m 必须至少列出一个阵元

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m 必须有限

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }：应为 "null-steering" 或 "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz 必须为正（实际为 { $b }）

engine-e-jamming-terrain-the-section-needs-jammer = terrain：该节需要 [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz（{ $acquisition_threshold_dbhz }）必须有限，且不低于 tracking_threshold_dbhz（{ $tracking_threshold_dbhz }）

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s 必须有限且非负（实际为 { $reacquisition_delay_s }）

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits 必须为 1 至 16（实际为 { $adc_bits }）

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz 必须为正（实际为 { $b }）

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side 必须至少为 2（实际为 { $samples_per_side }）

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } 必须有限（实际为 { $v }）

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } 必须为正（实际为 { $v }）

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }：{ $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain：剖面点 { $points }（{ $lat }，{ $lon }）在 DEM 图幅之外

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain：剖面点 { $points }（{ $lat }，{ $lon }）位于 DEM 空洞上

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC 日历日期超出范围：{ $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = 没有这样的日历日期：{ $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC 秒 { $second } 在 { $hour }:{ $minute } 处超出范围

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = 位于极点的发射场没有定义的方位角

engine-e-launch-inclination-unreachable-from-latitude-without = 倾角 { $inclination_rad }° 无法从纬度 { $lat_rad }° 到达，除非采用折线机动（需要 |lat| ≤ i ≤ 180−|lat|）

engine-e-launch-the-true-pole-site-speed = 真极点站点速度需要同时给出 `epoch` 和 `eop_finals2000a`（真实的 IERS finals2000A 正文）

engine-e-launch-site-lon-deg-must-be = site_lon_deg 必须在 [-180, 360] 内

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a 中没有可读取的 IERS finals2000A 行

engine-e-launch-epoch-mjd-is-outside-the = 历元 { $epoch }（MJD { $mjd_utc }）超出所提供的 EOP 行范围（MJD { $mjd } 至 { $mjd2 }）

engine-e-launch-site-lat-deg-must-be = site_lat_deg 必须在 [-90, 90] 内

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg 必须在 [0, 180] 内

engine-launch-launch-window-lat-az-asc = 发射窗口：纬度 { $site_lat_deg }° -> i { $target_inclination_deg }°：Az { $asc }° 升轨，v_circ { $v_orbit } m/s，+{ $site_rotation_speed } m/s 地球自转增益，每天 { $opportunities } 次机会（MODELLED）

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = 每个距离变化率都需要为正的有限 sigma

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = { $n_meas } 个测量无法解算 { $n } 个多普勒未知数

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = 多普勒几何是奇异的

engine-e-leo-fusion-doppler-no-covariance = 没有协方差

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = 每个伪距都需要为正的有限 sigma

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = { $obs } 个伪距无法解算 { $n } 个未知数（3 个位置 + { $n_clock } 个时钟）

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = 有一颗卫星与位置估计重合

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = 几何是奇异的

engine-e-leo-fusion-joint-pvt-no-iteration-ran = 没有运行任何迭代

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = 最终几何退化

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP 不是有限值

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } 必须为正

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m 必须非负，且运行最多 5000 个历元

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = 每个信号都需要为正的带宽

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz = 5G NTN 定位，{ $r } MHz，C/N0 { $r2 } 至 { $r3 } dB-Hz，{ $n_satellites } 颗卫星（可见 { $mean_in_view } 颗）{ "\u000A" }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }：{ $s } kHz，CRB 距离 { $range_sigma_zenith_m } 至 { $range_sigma_mask_m } m；中位形式 3D { $s2 } m，RMS 误差 { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples = { "  " }单星多普勒过境：{ $duration_s } s 内 { $n_obs } 个样本，水平误差 { $horizontal_error_m } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP 至少需要一个系统

engine-e-leo-fusion-ppp-duration-and-step-must-be = 时长和步长必须为正，且最多 20000 个历元

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs 必须为 1 至 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = 收敛门限必须为正

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical = PPP 收敛至水平 { $criterion_horizontal_m } m / 垂直 { $criterion_vertical_m } m，每种情形 { $runs_per_case } 次运行，{ $n_gnss } 颗 GNSS 卫星{ "\u000A" }

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } 颗 LEO  中位 { $c } min  收敛 { $v4 }%  NEES 均值 { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = { $runs_per_case } 次运行的水平误差中位数 · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = 预设 { $id } 不含信号

engine-e-leo-fusion-presets-preset-has-no-signal-it = 预设 { $id } 没有信号 { $n }；它有 { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = 未知的 LEO 预设 { $id }；已知：{ $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s 和 step_s 必须为正，且最多 20000 个历元

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = 极区步数必须为正

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode 必须为 doppler、joint、polar 或 timing；实际为 { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = doppler 模式至少需要一个 LEO 系统

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = timing 模式需要带码测距的 LEO 系统

engine-e-leo-fusion-pvt-kind-unknown-clock-class = 未知的时钟等级 { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT（{ $mode }），位于 { $user_lat_deg }，{ $user_lon_deg }，历时 { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } 颗卫星，高度 { $mean_altitude_km } km，{ $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites = { "  " }多普勒定位：来自 { $n_sats } 颗卫星的 { $n_obs } 个测量，3D 误差 { $error_3d_m } m（水平 { $horizontal_error_m } m）{ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }窗口 { $window_s } s：{ $n_sats } 颗卫星，3D 误差 { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } 过顶：最大多普勒 { $max_doppler_hz } Hz，变化率 { $max_doppler_rate_hz_s } Hz/s，加加速度 { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }在 { $v1 }% 的历元中有 LEO 测距卫星可见{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } 可用性 { $availability }，中位 PDOP { $f }，RMS 3D 误差 { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }纬度 { $lat_deg }：VDOP GNSS { $f } LEO { $f2 } 融合 { $f3 }；可见 { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB：RMS { $row } ns，95% { $row2 } ns，最大 { $row3 } ns（可见 { $fraction_in_view }）{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT——{ $mode } 模式

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = 系统 { $name }：role 必须为 gnss 或 leo，实际为 { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = 系统 { $name }：clock 必须为 estimated 或 known，实际为 { $c }

engine-e-leo-fusion-system-system-must-be-positive = 系统 { $name }：{ $what } 必须为正

engine-e-leo-fusion-system-system-mask-deg-must-be = 系统 { $name }：mask_deg 必须在 [0, 90) 内

engine-e-leo-fusion-system-system-sigma-pr-must-be = 系统 { $name }：sigma_pr_m 必须为正

engine-e-leo-fusion-system-give-at-least-one-system = 请至少给出一个 [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = 历元间隔必须为正

engine-e-leo-fusion-timing-no-epochs = 没有历元

engine-e-leo-fusion-timing-no-satellite-was-ever-in = 从未有卫星可见：接收机从未获得时间

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polarisation 必须为 rhcp、lhcp 或 linear；实际为 '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4 错误码 { $code }，t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = 倾角为 { $inc } deg 的轨道从不经过纬度 { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = 所请求的最大高度角低于地平线可达范围

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = 建筑类别必须为 traditional 或 thermally-efficient；实际为 '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = 字段 { $name } 不是有限值

engine-e-leo-navmsg-codec-field-is-outside-its-bit = 字段 { $name } = { $value } { $unit } 超出其 { $bits } 位范围（|x| <= { $spec }）

engine-e-leo-navmsg-codec-message-truncated = 消息被截断

engine-e-leo-navmsg-codec-field-list-exhausted = 字段列表已用尽

engine-e-leo-navmsg-codec-field-order-mismatch-vs = 字段顺序不匹配：{ $name } 对 { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID 必须为 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = 每个改正多项式需要 1-8 个系数

engine-e-leo-navmsg-codec-correction-time-scale-must-be = 改正时间尺度必须是 1 s 至 32768 s 的二的幂；实际为 { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = ECEF 多项式需要 1-11 个系数，各轴相等

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = ECEF 多项式阶数 { $v1 } 超过 10

engine-e-leo-navmsg-codec-unknown-model-id = 未知的模型 id { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = 载荷超过 4095 字节

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = 帧短于帧头加 CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = 前导码 0x{ $frame } 有误

engine-e-leo-navmsg-codec-unsupported-version = 不支持的版本 { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = 帧长度 { $frame } 与声明的 { $len } 字节载荷不一致

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q 不匹配：计算值 0x{ $crc }，帧中为 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees 每项最多为 7；实际为 { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree 必须为 1-10；实际为 { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = 未知的星历模型 '{ $other }'：请用 kepler16、kepler-rac、liu22 或 ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = 拟合区间必须至少为 10 s；实际为 { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = 拟合窗口 [{ $t0 }, { $v1 }] s 超出真值弧段 [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = ECEF 多项式拟合奇异（样本数相对阶数太少）

engine-e-leo-navmsg-fit-clock-fit-is-singular = 钟差拟合奇异

engine-e-leo-navmsg-fit-keplerian-fit-diverged = 开普勒拟合发散

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = 未知的预设 '{ $k }'；可用：{ $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s 必须为 10-3600 s，update_period_s 必须在 (0, fit_interval_s] 内；实际为 { $fit_interval_s } 和 { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s 和 eval_step_s 必须为 { $lit_0_5 }-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz 必须超过 10 MHz；实际为 { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid 必须为 1-255

engine-e-leo-navmsg-band-must-be-15-and = band 必须为 0-15，health 必须为 0-3

engine-e-leo-navmsg-unknown-csv-schema = 未知的 csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis 必须至少指定一项分析

engine-e-leo-navmsg-unknown-analysis-use = 未知的分析 '{ $a }'；请用 { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind 必须为 leo-navmsg；实际为 { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg 必须在 [0, 60) 内；实际为 { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO 导航电文——{ $res } km，{ $res2 } deg，重力阶数 { $gravity_degree }，模型 { $res3 }
    { "  " }SISRE 权重：w_R { $w_r }，w_AC^2 1/{ $v6 }（掩码 { $mask } deg）{ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s 必须为 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s 必须非空，每项为 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }{ $span } s 内的拟合区间权衡（使用周期 = 拟合区间）：{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE 轨道 RMS { $sisre_orb_rms_m } m  最大 { $sisre_orb_max_m } m  含钟差 RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s 必须非空，每项为 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s 必须为 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } 个参数  SISRE 轨道 RMS { $sisre_orb_rms_m } m  含钟差 { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = 在 { $search } s 内，位于 { $lat }，{ $lon } 的用户没有高于 { $mask } deg 的过境；请加宽 midpass.search_s 或移动用户

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }过境中更新：过境 { $p0 }-{ $p1 } s（最大高度角 { $pmax } deg），{ $switches } 次切换，最大用户距离跳变 { $max_jump } m（最坏情形几何 { $max_worst } m），门限 { $threshold } m：{ $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }编码-解码：{ $m } 模型，帧 { $frame } 字节（{ $payload_bits } 载荷位，{ $eph_bits } 星历+钟差位），CRC-24Q 0x{ $hex }
    { "    " }量化：最大位置变化 { $v6 } mm，钟差 { $v7 } mm；SISRE 精确值 { $acc_exact } m，量化后 { $acc_q } m
    { "    " }损坏的帧是否被拒绝：{ $corrupted_rejected }；RINEX 往返 { $rin_dp } m；CSV 往返 { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs 必须为 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  已发表 { $published } m  比值 { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = 16 参数开普勒集的误差由 { $lo } s 时的 { $a } m 恶化到 { $hi } s 时的 { $b } m：带二次每圈谐波的单个开普勒集无法跟随 LEO 弧段中频率更高的重力项和阻力超过几分钟，其最小二乘残差在整个窗口内振荡。阶数高于开普勒集所能涵盖的沿迹/横向/径向多项式吸收了剩余部分，在 { $hi } s 时给出 { $c } m。

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = 16 参数开普勒集的误差由 { $lo } s 时的 { $a } m 变为 { $hi } s 时的 { $b } m。

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km，{ $res2 } deg，重力阶数 { $gravity_degree } · 相对真值的表示误差 · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }：`{ $call }` 属于宿主库

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }：`rand_distr` 采样器在其少见分支中调用宿主的 `exp` 和 `ln`；请使用 `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }：`.acceleration(` 是宿主库的重力场；请使用 `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }：`{ $path }` 尚未审查

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = 没有 END OF HEADER 行

engine-e-leo-navmsg-text-expected-eph-record-header-got = 应为 '> EPH' 记录头，实际为 { $head }

engine-e-leo-navmsg-text-bad-satellite-id = 卫星 id { $parts } 有误

engine-e-leo-navmsg-text-missing-epoch-line = 缺少历元行

engine-e-leo-navmsg-text-bad-epoch-line = 历元行 { $ep } 有误

engine-e-leo-navmsg-text-bad-epoch-field-in = { $ep } 中的历元字段有误

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = 历元行需要三个钟差项：{ $ep }

engine-e-leo-navmsg-text-record-truncated = 记录被截断

engine-e-leo-navmsg-text-unknown-record-type = 未知的记录类型 { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = CSV 表携带 kepler16 和 kepler-rac 消息；实际为 { $m }

engine-e-leo-navmsg-text-empty-csv = CSV 为空

engine-e-leo-navmsg-text-row-has-cells-header = 行有 { $cells } 个单元格，表头有 { $header } 个

engine-e-leo-navmsg-text-bad-number-in-column = 列 { $k } 中的数字 { $c } 有误

engine-e-leo-navmsg-text-csv-row-lacks = CSV 行缺少 { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = 轨道高度必须在 100 km 与 3000 km 之间；实际为 { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = LEO 拟合的偏心率必须在 [0, { $lit_0_1 }) 内；实际为 { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = 积分步长必须在 (0, 30] s 内；实际为 { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = 时长必须为正，且最多 200000 步；实际为 { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree 必须为 0、2-6（带谐）或 7-{ $v1 }（EGM2008）；实际为 { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = 真值外推发散

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = 真值轨道衰减到 80 km 以下

engine-e-leo-navmsg-truth-node-spacing-must-be-in = 节点间隔必须在 (0, 60] s 内；实际为 { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = 列表形式的真值轨道至少需要两个状态；实际为 { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = 状态 { $k } 不是有限值

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = 时钟 adev_1s 必须在 [0, 1e-6) 内；实际为 { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = 实测时钟须用 TruthClock::from_samples 构建

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = 受控时钟需要 sigma_s 在 [0, 1e-3) 内且 tau_s > 0；实际为 { $sigma_s }，{ $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = 实测时钟需要为正的步长和至少两个样本

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = 实测时钟样本不是有限值

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = 历元 '{ $s }' 不是 YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = 历元 '{ $s }' 不是 YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = 历元 '{ $s }' 的秒字段有误

engine-e-leo-pass-epoch-is-out-of-range = 历元 '{ $s }' 超出范围

engine-e-leo-pass-band-unknown-signal-design-public = 频段 '{ $name }'：未知的信号设计 '{ $n }'；公开设计：{ $v2 }

engine-e-leo-pass-band-is-not-in-the = 频段 '{ $name }' 不在系统预设中：请给出 frequency_mhz 和 eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = 频段 '{ $name }' 需要 eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern 必须为 isoflux、gaussian 或 flat；实际为 '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = 频段 '{ $name }' 的频率超出范围

engine-leo-pass-overridden-in-the-scenario = { $source }（已在场景中覆盖）

engine-e-leo-pass-system-has-no-band = 系统 '{ $id }' 没有频段 '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = LEO 卫星至少需要一个频段

engine-e-leo-pass-at-most-12-bands-per = 每颗卫星最多 12 个频段

engine-leo-pass-unknown-system-presets-in-this = 未知的系统 '{ $n }'；此版本中的预设：{ $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = 在 { $v1 } km 处没有太阳同步轨道

engine-e-leo-pass-duration-at-most-86400-and = duration_s（最大 86400）和 step_s 必须为正，且最多 20000 个历元；实际为 { $duration } 和 { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO 卫星，{ $s } km，{ $inclination_deg } deg（{ $orbit_source }）

engine-leo-pass-the-scenario-epoch-read-as = 场景的 `epoch` { $epoch }，按 UTC 读取

engine-leo-pass-the-kind-default-epoch-utc = 该类场景的默认历元 { $epoch } UTC（场景未给出历元）

engine-e-leo-pass-user-environment-must-be-ground = user.environment 必须为 ground、maritime、air 或 indoor；实际为 '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg 必须在 +/-90 以内

## src/leo_pass.rs

engine-e-leo-pass-user-speed-must-be-to = 用户速度必须为 0 至 3000 m/s，高度必须为 -500 至 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna 必须为 patch、hemispherical 或 isotropic；当前为“{ $o }”

engine-e-leo-pass-user-building-probability-must-be = user.building_probability 必须在 (0, 1) 内

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model 必须为 klobuchar、vtec 或 none；当前为“{ $o }”

engine-e-leo-pass-direction-must-be-ascending-or = direction 必须为 ascending 或 descending；当前为“{ $o }”

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = 卫星 { $id }：偏心率或近地点无效

engine-e-leo-pass-satellite-tle-needs-tle-line1 = 卫星 { $id }：tle 需要 tle_line1 和 tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit 必须为 pass、elements 或 tle；当前为“{ $o }”

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation 需要给出 system 或 design

engine-e-leo-pass-no-sun-synchronous-inclination = 不存在太阳同步轨道倾角

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation：最多 5000 颗卫星

engine-e-leo-pass-no-leo-satellite-rises-above = 窗口内没有 LEO 卫星升至遮蔽角以上

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s 必须在 (0, 3600] 内

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands：“{ $b }”不是任何 LEO 卫星的频段（{ $names }）

engine-e-leo-pass-no-gnss-signal-for-constellation = 星座“{ $cons }”没有 GNSS 信号“{ $bname }”

engine-e-leo-pass-empty-gnss-constellation = GNSS 星座为空

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs：“{ $a }”/“{ $b }”不是 { $id } 的两个不同频段

engine-e-leo-pass-iot-powers-and-battery-must = iot 的功率和电池容量必须为正

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from 必须为 median 或 peak；当前为“{ $o }”

engine-leo-pass-detection-threshold-db-after-integration = 检测门限：积分后 { $detection_snr_db } dB

engine-leo-pass-coherent-integration-at-most-ms = 相干积分最长 { $rx } ms，受多普勒变化率限制

engine-leo-pass-serial-search-with-correlators = 串行搜索，相关器数：{ $correlators }

engine-leo-pass-hot-start-doppler-known-to = 热启动：多普勒已知至 +/-{ $aided } Hz，星历有效

engine-leo-pass-leo-pass-link-budget-user = LEO 过境链路预算，{ $environment }用户位于 { $lat_deg }, { $lon_deg }；LEO 卫星：{ $satellites } 颗，窗口 { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]：{ $sat } km，最大仰角 { $max_elevation_deg } deg（{ $tca_s } s 时），遮蔽角以上持续 { $duration_above_mask_s } s{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz：C/N0 峰值 { $opt }，中位数 { $opt2 }；|多普勒|最大值 { $opt3 }；电离层 { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }：可见 { $satellites_in_view }，C/N0 { $opt } 至 { $opt2 }（中位数 { $opt3 }）{ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } 峰值 { $leo_peak_cn0_dbhz } dB-Hz，比 GNSS 中位数高 { $leo_peak_above_gnss_median_db } dB；高于最强 GNSS 载波的时长：{ $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }：冷启动 TTFF { $ttff_s } s（{ $energy_per_fix_mj } mJ），热启动 { $ttff_s2 } s（{ $energy_per_fix_mj2 } mJ）{ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }欺骗干扰源自 { $onset_s } s 起（跳变 { $offset_m } m，牵引 { $push_rate_m_s } m/s）：多普勒检验 GNSS { $t }，LEO { $t2 }，融合 { $t3 }；跨频段 { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = { $environment }用户 · LEO 峰值 { $leo_peak_cn0_dbhz } dB-Hz，比 GNSS 中位数高 { $leo_peak_above_gnss_median_db } dB · MODELLED

engine-leo-pass-user-modelled = { $environment }用户 · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = 各 LEO 卫星首个频段的多普勒（满量程 ±{ $v1 } kHz）

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = [{ $what }] 表无效：{ $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design“{ $signal_design }”既不在 [signal] 中，也不是公开设计（{ $v2 }）

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design“{ $name }”没有码跟踪分量，因此不提供伪距

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind 必须为 leo-pnt-chain；当前为 { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = 被跟踪分量没有码片速率

engine-e-leo-pnt-chain-no-band-of-pass-names = [pass] 中没有任何频段的 signal = "{ $name }"；该链需要一个频段来承载该设计

engine-e-leo-pnt-chain-the-pass-gives-no-code = 该过境未给出码抖动

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m 必须在 [0, 100] m 内；当前为 { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] 必须运行 mode = "joint"；当前为 { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = 在 { $mask } deg 遮蔽角处的跟踪 C/N0（对仰角正弦作直线拟合）

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] 中没有可接收该链取值的 LEO 系统

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] 未产生联合块

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT 链：{ $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }信号 { $name2 }（{ $design }），跟踪 { $design2 }，速率 { $v4 } Mchip/s，C/N0 偏移 { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }过境 { $id } { $sat } km：跟踪 C/N0 峰值 { $peak_tracked_cn0_dbhz } dB-Hz，码抖动中位数 { $jitter_median } m；C/N0 直线 { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }电文 { $res }：拟合 { $fit_interval_s } s / 更新 { $update_period_s } s：表示 SISRE { $stats } mm RMS（轨道 { $stats2 } mm），定轨精度 { $od } m：传递 { $sisre } m{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }融合定位：仅 GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP 收敛：{ $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } 各阶段之间传递的取值。MODELLED。

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = 码跟踪抖动，即测距误差（m，0 至 { $jmax }）

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · 仅 GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = 调制 { $label }：宽度必须为正

engine-e-leo-signal-unknown-signal-preset-the-library = 未知信号预设 { $name }：库中有 { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = 预设 { $name }：预设文件无效：{ $e }

engine-e-leo-signal-preset-file-names-itself = 预设文件 { $name } 自称为 { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }：centre_mhz 必须为正

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }：tx_bandwidth_mhz 必须为正

engine-e-leo-signal-signal-needs-at-least-one = { $name }：信号至少需要一个分量

engine-e-leo-signal-component-power-fraction-must-be = { $name }：分量 { $v1 } 的 power_fraction 必须为正

engine-e-leo-signal-component-has-fdma-shares-but = { $name }：分量 { $v1 } 有 fdma_shares 但没有 fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }：分量 { $v1 } 的 fdma_shares 必须为正且和为一

engine-e-leo-signal-component-needs-one-fdma-share = { $name }：分量 { $v1 } 的每个偏移需要一个 fdma_share

engine-e-leo-signal-data-rate-sps-must-be = { $name }：data_rate_sps 必须为正

engine-e-leo-signal-code-length-chips-must-be = { $name }：code_length_chips 必须为正

engine-e-leo-signal-component-power-fractions-sum-to = { $name }：各分量功率占比之和为 { $total }，不等于 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }：orbit_altitude_km 必须为正

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }：平坦（类 OFDM）分量不能置于频谱模型中

engine-e-leo-signal-the-tracked-component-sits-on = { $name }：被跟踪分量位于 FDMA 子载波上；频谱模型跟踪位于频段中心的分量

engine-e-leo-signal-signal-is-given-twice = 信号 { $w } 被重复给出

engine-e-leo-signal-signals-is-more-than-the = { $out } 个信号超过了允许的 24 个

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver：loop_bandwidth_hz x integration_time_s 必须小于 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver：请给出 1 至 40 个 cn0_dbhz 取值

engine-e-leo-signal-trade-slant-range-km-and = trade：slant_range_km > 0 且 slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points 必须在 21 至 2001 之间

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }：请使用 "coherent" 或 "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = 系统噪声温度必须为正

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility：未知 GNSS 信号 { $n }（已知：{ $gnss_victim_names }）

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } 不是场景中的信号

engine-e-leo-signal-shape-check-signal-is-not = 形状检查：信号 { $signal } 不在场景中

engine-leo-signal-scenario-leo-signal-signals-noise = 场景 leo-signal | { $runs } 个信号 | 噪声底 { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = 左：各设计的带限 PSD（相对峰值的 dB 值，覆盖其发射频段）；右：码片间隔 { $reference_spacing_chips } 时码抖动随总 C/N0 的变化

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = 未知频段“{ $other }”（应为 s|x|ka）

engine-e-linkbudget-range-km-must-be-finite = range_km 必须为有限正数

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps 必须为有限正数

engine-e-linkbudget-other-losses-db-must-be = other_losses_db 必须为有限数且 >= 0

engine-e-linkbudget-tsys-must-be-finite-and = 提供 tsys_k 时，其必须为有限正数

engine-linkbudget-link-budget-band-km-bit = link-budget：{ $value } 频段，{ $range_km } km，{ $data_rate_bps } bit/s -> FSPL { $fsl_db } dB，Eb/N0 { $eb_n0_db } dB，余量 { $margin_db } dB（{ $v7 }）

## src/live_io.rs

engine-e-live-io-cannot-listen-on = 无法监听 { $addr }：{ $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live：正在监听 tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live：tcp 客户端已连接

engine-live-io-kshana-live-warning-is-not = kshana live：警告：{ $addr } 不是回环地址；任何能访问该地址的对象都能读取数据流

engine-e-live-io-cannot-open = 无法打开 { $spec }：{ $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live：已断开一个跟不上速度的 tcp 客户端

engine-e-live-io-cannot-open-2 = 无法打开 { $path }：{ $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live：警告：{ $addr } 不是回环地址；任何能访问该地址的对象都能向本层发送数据流

engine-e-live-io-cannot-bind-udp = 无法绑定 udp { $addr }：{ $e }

engine-live-io-kshana-live-listening-on-udp = kshana live：正在监听 udp { $addr }

engine-e-live-io-cannot-connect-to = 无法连接 { $addr }：{ $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live：已连接 tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live：正在读取串口 { $path }，波特率 { $baud }（只读）

engine-live-io-the-was-closed-by-the = { $v1 }已被对端关闭（本层不会重连：请在会自动重启它的监督程序下运行）

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }：请使用 1200、2400、4800、9600、19200、38400、57600、115200 或 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } 不是串口设备（tcgetattr 失败）

engine-e-live-io-cannot-set-baud = 无法设置波特率 { $baud }

engine-e-live-io-cannot-set-the-line-mode = 无法设置 { $path } 的线路模式

engine-e-live-io-serial-is-supported-on-unix = --serial 仅在 Unix 上受支持；请使用 --file、--tcp 或 --stdin

engine-live-io-unknown-option = 未知选项 { $s }

engine-live-io-cannot-read = 无法读取 { $session }：{ $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live：船舶平台，校准 { $calibration_s } s；门限 { $v2 }。仅供参考的软件，不是经型式认可的导航设备：责任仍由操作人员承担。

engine-live-io-write-failed = 写入失败：{ $e }

engine-live-io-kshana-live-dropped-udp-datagram = kshana live：已丢弃引擎无法接收的 udp 数据报：{ $n } 个（累计 { $udp_dropped } 个）

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } 超出 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = 插入索引 { $p } 超出 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = 附录 3 文件含 { $gold } 个和 { $ter } 个码，应为 210 个

engine-e-lunar-afs-codes-annex-afs-prn-is-not = 附录 3 AFS-I PRN { $v1 } 不是 g1、g2 的 Gold 码（LSIS 图 C-1）

engine-e-lunar-afs-codes-secondary-code-does-not-exist = 副码 S{ $id } 不存在（S0 至 S3）

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 表 11 仅为节点标识 1 至 12 分配码，不含 { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } 超出两位比特范围（0..3）

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } 超出 0..99（LSIS-410）

engine-e-lunar-afs-frame-subframe-symbols-expected = 应有 { $SB1_SYMBOLS } 个子帧 1 符号

engine-e-lunar-afs-frame-subframe-data-lengths-expected = 子帧数据长度 { $sb2 }/{ $sb3 }/{ $sb4 }（应为 { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS }）

engine-e-lunar-afs-frame-symbols-expected-given = 应有 { $FRAME_SYMBOLS } 个符号，实际给出 { $soft } 个

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = 第 { $v1 } 行：应为 `row,column`

engine-e-lunar-afs-ldpc-line = 第 { $v1 } 行：{ $e }

engine-e-lunar-afs-ldpc-line-outside = 第 { $v1 } 行：({ $r },{ $c }) 超出 { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }：应有 { $info_bits } 个信息比特，实际给出 { $info } 个

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = LSIS V1.0 数据不在 { $cache_dir } 中（请设置 KSHANA_LSIS_DIR 或运行 xval/lunar-afs/fetch_lsis.sh，该脚本下载 { $LSIS_PDF_URL } 并提取其附件；这些附件不随 Kshana 再分发）

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } 不是已固定的 LSIS 文件

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } 的 SHA-256 为 { $got }，应为 { $want }（固定为 LSIS V1.0，日期 29 January 2025）；{ $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet 增强前向信号基带，{ $LSIS_VERSION }；Kshana 参考生成器

engine-lunar-afs-waveform-afs-node = AFS 节点 { $node_id }

engine-lunar-afs-waveform-afs-node-frame-toi = AFS 节点 { $node_id } 帧 TOI { $toi }

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites 必须至少为 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites 必须至少为 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg 必须在 [0, 90) 内；当前为 { $mask_deg }

engine-lunar-beacon-satellites-no-beacons = { $n_sats } 颗卫星，无信标

engine-lunar-beacon-satellites-visible-beacons = { $n_sats } 颗卫星 + { $n_vis_beacons } 个可见信标

engine-lunar-beacon-satellites-no-beacons-2 = { $n_cmp } 颗卫星，无信标

engine-e-lunar-beacon-serialising-beacon-report = 序列化信标报告时出错：{ $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = 信标报告必须序列化为 JSON 对象

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = 月面信标增强：遮蔽角 { $elevation_mask_deg } deg，历元 +{ $epoch_s } s，单信标 sigma_URE { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  卫星 { $n_visible_sats }  信标 { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  实现的 1-sigma：3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }信标使 PDOP 改善 { $f }x；{ " " }

engine-lunar-beacon-larger-constellation-instead = 改用更大的星座则为 { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = 无法读取月球星历 { $path }：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = 月球星历：首行必须为 `{ $MAGIC }`，实际为 `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = 月球星历：文件为空

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = 月球星历：`# format:` 必须为 `states` 或 `elements`，实际为 `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = 月球星历：没有数据行

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = 月球星历：缺少列 `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = 月球星历：`# elements_frame:` 必须为 `icrf` 或 `mci`，实际为 `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = 月球星历：`elements_frame: icrf` 需要 `# epoch_jd_tdb:`（根数所参照的历元，也是求解 ICRF 到月固系旋转的历元）：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = 月球星历：根数行 { $v1 } 过短

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = 月球星历：根数行 { $v1 }：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = 月球星历：根数行 { $v1 } 的半长轴不为正

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = 月球星历：根数行 { $v1 } 的偏心率为 { $ecc }，超出 [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = 月球星历：`states` 文件需要 `# frame: icrf` 或 `# frame: mci`，实际为 `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = 月球星历：`icrf` 状态文件需要 `# epoch_jd_tdb:`：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = 月球星历：状态行 { $v1 } 过短

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = 月球星历：状态行 { $v1 }：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = 月球星历：状态行 { $v1 } 不是有限值

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = 月球星历：卫星 { $sat } 的状态行 { $v1 } 时间回退（{ $t } 晚于 { $last }）；每颗卫星的历元必须严格递增

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = 列表化的月心状态星历（{ $e } 系），在表历元之间按 { $LAGRANGE_ORDER } 阶拉格朗日插值，并由 { $v2 } 归算到 MCMF。本引擎不对这些状态做外推传播。出处类别 `published-ephemeris`：有别于所有由根数导出的数值。

engine-lunar-ephemeris-published-constellation-definition-stated-in = 已发布的星座定义，以月心 ICRF 给出（`{ $v1 }`），由本引擎自带的开普勒求解器在同一惯性系中传播，并在每个历元由 IAU 2015 / WGCCRE 月球定向（进动极轴、解析物理天平动）归算到 MCMF。不作坐标系近似：来源指明了坐标系和历元，二者均被采用。出处类别 `published-elements`：有别于所有由星历核导出的数值。

engine-lunar-ephemeris-published-constellation-definition-propagated-by = 已发布的星座定义，由本引擎自带的开普勒求解器传播，并按平均转动的月球自转模型归算，与示意星座所走路径完全相同，因此两次运行的唯一差别就是星座设计。来源以 `{ $v1 }` 系给出根数；此处将其按 MCI 读取，这会使星座倾斜 `published_frame_tie_angle_deg`。出处类别 `published-elements`：有别于所有由星历核导出的数值。

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = 未知 station_datum { $other }：应为 "fixed" 或 "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = VLBI 测评活动至少需要 2 个测站才能构成基线，实际为 { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = 测站 { $name } 的坐标不是有限值

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = 测站 { $name } 的纬度 { $lat } deg 超出 [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = 七参数 Helmert 基准至少需要 3 个不共线的信标，实际为 { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = 信标 { $name } 的坐标不是有限值

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = 信标 { $name } 的纬度 { $lat } deg 超出 [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours 必须为有限正数，实际为 { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min 必须为有限正数，实际为 { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = { $v1 } 个历元的计划超出本场景 5000 个历元的上限；请加大 step_min 或缩短 arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s 必须为有限正数，实际为 { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg 必须为有限数且在 [-90, 90) 内，实际为 { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg 必须为有限数且在 [-90, 90) 内，实际为 { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol 必须为有限数且在 [0, 1) 内，实际为 { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m 必须为有限正数，实际为 { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver 必须为 "spectral" 或 "srif"，实际为“{ $other }”

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = 序列化 lunar-frame-campaign 结果时出错：{ $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = 测评活动中没有任何观测同时满足：基线两端均越过 { $mask } deg 的地球侧遮蔽角，且高于信标自身地平线的 { $earth_mask } deg 遮蔽角：{ $n_epochs } 个历元 x { $v1 } 条基线 x { $n_beacons } 个信标全部被拒绝。请加大 arc_hours、降低某个遮蔽角，或移动测站。

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = 满秩：本测评活动约束了全部 7 个相似变换参数（条件数 { $condition }）

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT：7 个相似变换方向中有 { $defect } 个无法由本测评活动观测，因此不发布基准 sigma；不可观测方向按七参数基列出

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | { $n_beacons } 个信标 x { $v1 } 条基线 x { $n_epochs } 个历元 = { $n_obs } 个观测（延迟 sigma { $sigma_tau } s）| 测站基准 { $station_datum } | Helmert 秩 { $rank }/7，条件数 { $condition } | 基准平移 sigma { $v5 }，对比注入变换的恢复误差 { $trans_err_norm_m } m（比值 { $v7 }）

engine-lunar-frame-campaign-of-beacons-have-no-observation = { $beacons } 个信标中有 { $names } 个在本计划中没有观测（{ $names2 }）；它们不提供信息，其 sigma 为 null，基准仅由有观测的信标实现

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = 所有 sigma 必须为正

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss：planes、sats_per_plane 和 altitude_km 必须为正

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss：tx_efficiency 必须在 (0, 1] 内

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency：GNSS { $v } m 对比地面 { $v2 } m 位置 sigma，平均 q { $v3 }（卡方 6 的期望值为 6）

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase：{ $last } 个模糊度，在最长弧段上 ILS 成功率 { $last2 }（自举 { $last3 }）

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation：最小信息特征值 x{ $v }（含轨道器链路），CRLB 迹 x{ $v2 }

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie：{ $v } 个弧段上的 { $last } 个扫描点；在已登记的本地联测下，激光对比 GNSS 的 x 平移 sigma 为 { $last2 } m

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity：CRLB sigma h2 { $v }，k2 { $v2 }，l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = 未知研究 `{ $other }`：应为 { $studies } 之一

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = 该测量集不能确定轨道（信息矩阵奇异）

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials 必须至少为 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = 地面 sigma 必须为正

engine-e-lunar-infra-od-unknown-station-dss-14-dss = 未知测站 `{ $nm }`：应为 DSS-14、DSS-63 或 DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = 地面测量过少，无法确定轨道

engine-e-lunar-infra-od-the-covariance-of-the-difference = 差值的协方差奇异

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = NRHO 微分修正未能从初始种子收敛

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo 需要 0 < 近月点高度 < 远月点高度

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = 未知轨道族 `{ $other }`：应为 nrho 或 elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s 和 arc_days 必须为正

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = 各接收机之间没有共同卫星

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = 载波相位法方程奇异

engine-e-lunar-infra-phase-the-position-block-is-singular = 位置块奇异

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = 模糊度协方差不是正定的

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = 各技术 sigma 必须为正

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = 本地联测 sigma 必须为正

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz 必须为有限正数

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz 必须为有限正数

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k 必须为有限正数

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km 必须为有限数且大于月球半径

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity 必须在 [0, 1) 内

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw 必须为有限数

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | { $n_sats } 颗卫星，{ $n_epochs } 个历元，自（{ $site_lat_deg }, { $site_lon_deg }）起 { $n_links } 条链路 | J/S { $min_js_db }..{ $max_js_db } dB（均值 { $mean_js_db }）| { $n_lost } LOST | 可用性 { $availability_under_jamming }，标称 { $availability_nominal }

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | { $n_sats } 颗卫星，{ $n_epochs } 个历元，自（{ $site_lat_deg }, { $site_lon_deg }）起 { $n_links } 条链路 | 无干扰源（晴空月球基线）| { $n_lost } LOST | 可用性 { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = 反射器目录表头异常 { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = 反射器目录行过短 { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = 无法解析反射器字段 { $i }（位于 { $t }）

engine-e-lunar-llr-reflector-but-the-published-radius = 反射器 { $f }：|(x,y,z)| = { $norm3 } m，但已发布的半径列为 { $radius } m；该行已被修改

engine-e-lunar-llr-reflector-catalogue-has-no-rows = 反射器目录没有数据行

engine-e-lunar-llr-unreadable-position-epoch-year = 无法解析 position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = 测站目录表头异常 { $t }

engine-e-lunar-llr-short-station-catalogue-row = 测站目录行过短 { $t }

engine-e-lunar-llr-unreadable-station-field-in = 无法解析测站字段 { $i }（位于 { $t }）

engine-e-lunar-llr-unreadable-ilrs-id-in = 无法解析 ILRS 标识（位于 { $t }）

engine-e-lunar-llr-station-catalogue-has-no-rows = 测站目录没有数据行

engine-e-lunar-llr-cannot-read-this-scenario-runs = 无法读取 { $path }（{ $e }）。本场景基于 { $DEFAULT_DATA_DIR } 下已提交的真实数据切片运行，该切片随代码库提供，但不随已发布的 crate 提供；请将 `data_dir` 指向其副本。

engine-e-lunar-llr-only-usable-normal-points-for = 对 { $reflectors } 个反射器仅有 { $used } 个可用标准点，不足以约束 { $v3 } 个坐标；请放宽存档切片

engine-e-lunar-llr-the-simulated-campaign-own-report = 模拟测评活动自身的报告无法解析：{ $e }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum：{ $used } 个存档标准点（已解析 { $n_parsed } 个），来自 { $station_counts } 个测站，指向 { $reflectors } 个后向反射器阵列，跨度 { $v5 } d；测得的标准点精密度中位数 { $median } mm（单程）；反射器信息秩 { $rank }/{ $n }；Helmert 秩 { $rank2 }/{ $n_helmert }，条件数 { $condition }；基准平移 sigma { $v12 } m；观测减计算的单程残差 RMS { $rms_m } m（{ $v14 }）

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg 必须为有限数且在 [-90, 90) 内，实际为 { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } 的坐标不是有限值

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } 的纬度 { $lat_deg } deg 超出 [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = 序列化 lunar-llr-datum 报告失败：{ $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = 积分步长必须能整除输出步长

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver：{ $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } 必须为有限数且不为负

engine-lunar-receiver-must-be-finite-and-positive = { $n } 必须为有限正数

## src/lunar_service.rs

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume：{ $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume：导出站点：{ $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = 月球星历 { $path } 在其历元之后仅覆盖 { $until } s，但场景时域达到 { $last } s；请缩短 horizon_hours 或获取更长的弧段（不允许对列表星历做外推）

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path 需要 epoch_utc（YYYY-MM-DDTHH:MM:SS UTC）

engine-lunar-service-op-frame-at-utc-earth = { $epoch } UTC 时的 OP 坐标系（地球视轨道法向相对月球，x 沿其在 IAU 月球赤道上的交点）；IAU 月固系中的月球 GM、J2 和 C22，地球与太阳第三体取自 { $spk_path } 中的 DE440 位置；四阶龙格-库塔，步长 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution：height_sigma_m 必须为有限正数

engine-e-lunar-solution-solution-range-sigma-must-be = solution：range_sigma_m 必须为有限正数

engine-e-lunar-solution-solution-min-satellites-needs-height = solution：min_satellites = 3 需要 height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution：min_satellites 必须为 3 或 4，实际为 { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution：window_epochs 必须为 1 至 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } 必须为有限正数

engine-lunar-station-must-be-finite-and-not = { $name } 必须为有限数且不为负

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } 超过 { $MAX_WORK }；请降低 n_trials、加大 grid_lat_step_deg（或减少点数），或加大 t_step_s、缩短 t_span_s

engine-e-lunar-station-kind-must-be-got = kind 必须为 { $KIND }；当前为 { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }：星历 { $path } 覆盖 { $until } s，但运行达到 { $last } s（最后一个历元加 latency_s）；请缩短 t_span_s

engine-e-lunar-station-no-case = { $KIND }：无此用例（{ $j }, { $i }, { $k }）

engine-lunar-station-points-epochs-trials = { $n_grid_points } 个点 · { $n_epochs } 个历元 · { $n_trials } 次试验

engine-lunar-station-hpl-max = HPL 最大值 { $f }

engine-lunar-station-survey-latency-bits = 测量 { $survey_sigma_m } m · 延迟 { $latency_s } s · { $quantization_bits } 位

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem：lines 和 samples 必须为 2 至 { $MAX_DEM_SIDE }，实际为 { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem：{ $lines } x { $samples } 网格对应 { $heights_m } 个高程值

engine-e-lunar-terrain-dem-map-scale-must-be = dem：map_scale_m 必须为正，实际为 { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem：reference_radius_m 必须为正，实际为 { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem：无法读取 { $descriptor_path }：{ $e }

engine-e-lunar-terrain-dem = dem：{ $descriptor_path }：{ $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem：projection 必须为 south-polar-stereographic，实际为 { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem：sample_type 必须为 int16-le，实际为 { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem：无法读取 { $img }：{ $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem：网格超过 { $MAX_DEM_SIDE } 像素上限

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem：{ $img } 为 { $bytes } 字节；{ $lines } x { $samples } 的 int16 需要 { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem：{ $img } 的 SHA-256 { $digest } 与描述文件中的 { $image_sha256 } 不符

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem：scaling_factor 必须为正

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile：无法读取 { $path }：{ $e }

engine-e-lunar-terrain-dem-tile = dem_tile：{ $path }：{ $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile：{ $path }：至少需要 2 x 2 个点、位于 [-90, 90] deg 内的递增范围、360 deg 经度，以及有限的高程值

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain：{ $what } 必须为有限正数，实际为 { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain：antenna_height_m 必须为有限数且不为负，实际为 { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain：azimuth_step_deg 最大为 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain：max_range_m / range_step_m 必须为 1 至 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain：站点在高程场之外

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain：给定的地平线需要非空的来源

engine-e-lunar-terrain-terrain-stated-horizon = terrain：给定的地平线：{ $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain：请给出 dem_path 或 dem_tile_path，不可同时给出

engine-e-lunar-terrain-terrain-max-range-km-must = terrain：max_range_km 必须为有限正数

engine-e-lunar-terrain-terrain-range-step-must-be = terrain：range_step_m 必须为有限正数

engine-e-lunar-terrain-site-deg-deg = { $e }（站点 { $lat_deg } deg, { $lon_deg } deg）

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = 未知时钟 { $other }；应为 optical-master、passive-h-maser、rafs、mini-rafs 之一

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks 必须至少指明一个时钟类别

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s 必须为有限正数，实际为 { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s 必须为有限数且大于 tau_min_s（{ $lo }），实际为 { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade 必须 ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = 项 { $name } 短于 tau 网格

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | 时钟 { $clock } | 7 项 x_Σ(τ)，覆盖 { $taus } 个 τ 点（{ $taus2 }–{ $taus3 } s）| 交叉点 τ { $crossover_tau_s } s（x { $crossover_x_s } s）| 坐标系下限 { $frame_term_s } s | 时钟 x(1 d) { $x_1day_ns } ns（MODELLED）

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab：未知时钟 { $other }；应为 optical-master、passive-h-maser、rafs、mini-rafs 之一，或改为给出 device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab：请给出 clock 或 device_card，不可同时给出

engine-e-lunar-time-lab-time-lab-device-card = time_lab：device_card：{ $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab：steer_interval_s 必须为有限正数，实际为 { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab：{ $name } 必须为有限数且非负，实际为 { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab：horizons_s 必须为正数

engine-lunar-time-lab-station-height-not-modelled-exactly = 站高未被精确建模：{ $height_sigma_m } m 的一倍 sigma 高度误差使速率偏差 { $value } ns/day，按自上次校准以来的线性项处理

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = 光行时未能在 30 次迭代内收敛到 1e-15 s

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = 星历核路径需要同时给出 planetary_kernel_path、earth_orientation_kernel_path 和 moon_orientation_kernel_path

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = 未知基准 { $other }：应为 "anchor-first-station"、"free-network" 或 "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = VLBI 计划至少需要 2 个测站才能构成基线，实际为 { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = 信标坐标必须为有限值

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = 信标纬度 { $lat } deg 超出 [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = { $v1 } 个历元的计划超出本场景 20000 个历元的上限；请加大 step_min 或缩短 arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g 必须为有限正数，实际为 { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = 序列化 lunar-vlbi-fim 结果时出错：{ $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = 计划中没有任何观测在基线两端同时越过 { $mask } deg 的仰角遮蔽角：{ $n_epochs } 个历元 x { $v1 } 条基线全部被拒绝。请加大 arc_hours、降低 elevation_mask_deg，或移动测站。

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = 该基准未留下可估计的参数

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT：{ $dim } 个方向中有 { $defect } 个不可观测，因此不报告逐坐标 sigma；下方的可观测子空间值是限制在 { $rank } 个可观测方向上的伪逆，不是测站 sigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | { $n_stations } 个测站 / { $v2 } 条基线 x { $n_epochs } 个历元 = { $n_obs } 个观测（遮蔽角 { $mask } deg）| 基准 { $datum } | 秩 { $rank }/{ $dim }，条件数 { $condition } | 测站 sigma { $v10 }，对比 equipartition g={ $g } { $eq_g } m（比值 { $v13 }）

## src/main.rs

engine-main-error-validate-needs-scenario-path = 错误：--validate 需要场景路径

engine-main-error-study-needs-suite-manifest = 错误：--study 需要套件清单路径

engine-main-error-study-name-needs-value = 错误：--study-name 需要一个值

engine-main-error-export-sp3-needs-path = 错误：--export-sp3 需要路径

engine-main-error-export-omm-needs-path = 错误：--export-omm 需要路径

engine-main-error-export-oem-needs-path = 错误：--export-oem 需要路径

engine-main-error-animate-needs-format-svg = 错误：--animate 需要格式：svg、html、frames 或 all

engine-main-error-animate = 错误：--animate：{ $e }

engine-main-error-animate-fps-needs-whole = 错误：--animate-fps 需要每秒帧数的整数

engine-main-error-export-needs-format-czml = 错误：--export 需要格式：czml、kml、geojson、stk、sigmf、all 或 list

engine-main-error-animate-duration-needs-length = 错误：--animate-duration 需要以秒为单位的时长

engine-main-error-import-route-needs-geojson = 错误：--import-route 需要 GeoJSON 文件路径

engine-main-error-eop-needs-finals2000a-file = 错误：--eop 需要 finals2000A 文件路径

engine-main-error-unknown-option = 错误：未知选项“{ $other }”

engine-main-error-unexpected-argument-one-scenario = 错误：意外参数“{ $other }”；每次运行只接受一个场景文件

engine-main-warning-animate-fps-and-animate = 警告：没有 --animate 时，--animate-fps 和 --animate-duration 不起作用

engine-main-error-animate-exports-one-scenario = 错误：--animate 导出一次场景运行；不能与 --validate 或 --study 组合

engine-main-error-validate-lints-one-scenario = 错误：--validate 检查一个场景；请勿再传入场景文件

engine-main-error-cannot-read = 错误：无法读取 { $validate_file }：{ $e }

engine-main-ok-kind-resolves-this-kind = 正常：{ $kind } — kind 可解析；该 kind 不要求任何字段（空内容即运行其参考配置），因此无需进一步检查

engine-main-ok-kind-resolves-and-all = 正常：{ $kind } — kind 可解析，其已发布的 { $n_required } 个必填字段条目均已满足；不检查字段取值

engine-main-error-study-runs-suite-do = 错误：--study 运行一个套件；请勿再传入单个场景文件

engine-main-warning-study-name-is-ignored = 警告：与 --study 同用时忽略 --study-name；研究的标题取自套件清单中的 `title =`

engine-main-error-cannot-read-2 = 错误：无法读取 { $path }：{ $e }

engine-main-hint-kshana-example-lists-the = 提示：`kshana example` 列出内置的参考场景；`kshana example clock-holdover > clock-holdover.toml` 将其中一个写入文件

engine-main-error-cannot-read-3 = 错误：无法读取 { $eop_file }：{ $e }

engine-main-error-eop = 错误：--eop：{ $e }

engine-main-error-cannot-read-4 = 错误：无法读取 { $route_file }：{ $e }

engine-main-error-import-route = 错误：--import-route：{ $e }

engine-main-does-not-apply = { $fmt }：不适用：{ $why }

engine-main-error-export = 错误：--export：{ $e }

engine-main-error-animate-2 = 错误：--animate { $f }：{ $e }

engine-main-error-export-2 = 错误：{ $fmt } 导出：{ $e }

engine-main-error-cannot-write = 错误：无法写入 { $json_path }：{ $e }

engine-main-error-cannot-write-2 = 错误：无法写入 { $svg_path }：{ $e }

engine-main-error-cannot-build-the-report = 错误：无法生成报告：{ $e }

engine-main-error-cannot-write-3 = 错误：无法写入 { $html_path }：{ $e }

engine-main-error-cannot-write-4 = 错误：无法写入 { $report_json_path }：{ $e }

engine-main-error-cannot-write-5 = 错误：无法写入 { $csv_path }：{ $e }

engine-main-wrote-and = 已写入 { $json_path }、{ $svg_path }、{ $html_path }、{ $report_json_path } 和 { $csv_path }

engine-main-wrote-and-2 = 已写入 { $json_path }、{ $svg_path }、{ $html_path } 和 { $report_json_path }

engine-main-error-cannot-write-6 = 错误：无法写入 { $target }：{ $e }

engine-main-error-cannot-write-7 = 错误：无法写入 { $sp3_path }：{ $e }

engine-main-error-sp3-export-failed = 错误：SP3 导出失败：{ $e }

engine-main-error-cannot-write-8 = 错误：无法写入 { $omm_path }：{ $e }

engine-main-error-omm-export-failed = 错误：OMM 导出失败：{ $e }

engine-main-error-cannot-write-9 = 错误：无法写入 { $oem_path }：{ $e }

engine-main-error-oem-export-failed = 错误：OEM 导出失败：{ $e }

engine-main-error-unexpected-argument-after-kinds = 错误：`kinds` 之后出现意外参数“{ $other }”；只接受 --json

engine-main-bundled-reference-scenarios-write-one =
    内置参考场景（{ $v1 }）。将其中一个写入文件并运行：
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = （未内置：{ $name } — 运行 `kshana example { $name }` 查看原因）

engine-main-error-is-not-bundled-it = 错误：“{ $name }”未内置：它{ $why }

engine-main-error-no-bundled-scenario-named = 错误：没有名为“{ $name }”的内置场景；`kshana example` 列出全部 { $v1 } 个内置场景

engine-main-error-cannot-read-5 = 错误：无法读取 { $suite_path }：{ $e }

engine-main-wrote-and-3 = 已写入 { $json_path } 和 { $html_path }

engine-main-error-needs-value = 错误：{ $a } 需要一个值

engine-main-error-expected-mean-needs-number = 错误：--expected-mean 需要一个数

engine-main-error-unknown-imu-fit-option = 错误：未知 imu-fit 选项 { $x }

engine-main-error-imu-fit-needs-an = 错误：imu-fit 需要 IMU 日志路径

engine-main-error-needs-value-2 = 错误：{ $args } 需要一个值

engine-main-error-epoch = 错误：--epoch：{ $e }

engine-main-error-unknown-bench-export-option = 错误：未知 bench-export 选项 { $a }

engine-main-error-bench-export-needs-scenario = 错误：bench-export 需要场景路径

engine-main-needs-value = { $a } 需要一个值

engine-main-site-takes-lat-lon-height = --site 接受 lat,lon[,height_m]，实际为 { $v }

engine-main-error-is-bytes-the-tle = 错误：{ $p } 为 { $m } 字节；TLE 上限为 { $cap }（4 MiB）

engine-main-error-cannot-read-6 = 错误：无法读取 { $p }：{ $e }

engine-main-unknown-sky-option = 未知 sky 选项 { $a }

engine-e-main-svg-and-monte-carlo-are = --svg 和 --monte-carlo 是各自独立的输出；请只给出一个

engine-main-error-preset-needs-name =
    错误：--preset 需要名称
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    错误：--profile 需要文件
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = 找到 { $r } 个符号、{ $r2 } 个帧；{ $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }位于 { $f } 的帧：FID { $f2 } TOI { $f3 }（SB1 度量 { $f4 }，{ $f5 } 个 SP 错误，{ $f6 } 个 SB1 错误）

engine-main-not-checked = 未检查：{ $r }

engine-main-wrote-frame-of-6000-symbols = 已写入 { $out }：{ $frames } 个帧，每帧 6000 个符号；子帧 2 至 4 为占位（未做 LDPC 编码，无电文）

engine-main-error-cannot-write-10 = 错误：无法写入 { $out }：{ $e }

engine-main-unknown-lunanet-afs-check-subcommand = 未知 lunanet-afs-check 子命令 { $other }

engine-main-needs-pack-id = { $cmd } 需要包标识

engine-main-unknown-standards-pack-run-option = 未知 standards-pack run 选项 { $a }

engine-main-unknown-standards-pack-subcommand = 未知 standards-pack 子命令 { $other }

engine-main-error-out-needs-value = 错误：--out 需要一个值

engine-main-error-unknown-compliance-report-option = 错误：未知 compliance-report 选项 { $a }

engine-main-error-compliance-report-needs-at = 错误：compliance-report 至少需要一个结果 .json 文件

engine-main-runs-read-not-used-rows = 已读取 { $runs } 次运行，其中 { $unrecognised } 次未使用；行：{ $n } 项已有证据，{ $n2 } 项部分有证据，{ $n3 } 项无证据，{ $n4 } 项不在范围内

engine-main-error-receiver-trust-needs-scenario = 错误：receiver-trust 需要场景路径

engine-main-error-invalid-receiver-trust-scenario = 错误：receiver-trust 场景无效：{ $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = 燃烧耗尽质量：m0={ $m0_kg } kg，ṁ={ $mdot } kg/s，burn={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = 飞行时间必须为正

engine-e-maneuver-collinear-endpoints-transfer-plane-is = 端点共线：转移平面未定义（≈0°/180°）

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs 用于 M >= 1；M = 0 请使用 lambert

engine-e-maneuver-no-revolution-transfer-the-time = 不存在 { $revs } 圈转移：飞行时间低于其下限

engine-e-maneuver-grid-step-days-must-be = grid_step_days 必须为正，实际为 { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = 每个窗口必须向前（start <= end）

engine-e-maneuver-no-transfer-of-the-requested = 窗口内没有所请求类型的转移

engine-e-maneuver-the-optimum-left-the-feasible = 最优解离开了可行域

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }：{ $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }：应有 3 个值

engine-e-mars-od-dss-epoch-is-not-2003 = DSS-{ $id } 的历元不是 2003-JAN-01：{ $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } 没有 DXYZ

engine-e-mars-od-no-coordinates-for-dss = DSS { $station } 没有坐标

engine-e-mars-od-no-ramps-for-dss = DSS { $station } 没有斜坡数据

engine-e-mars-od-ramp-table-does-not-cover = 斜坡表未覆盖该区间

engine-e-mars-od-epoch-outside-the-integrated-span = 历元 { $et } 超出已积分的跨度

## src/mars_od.rs

engine-e-mars-od-normal-matrix-is-not-positive = 法方程矩阵不是正定的

engine-e-mars-od-no-points = 没有数据点

engine-e-mars-od-parameter-has-no-partial-on = 某个参数在保留的数据点上没有偏导数

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | { $user }用户，{ $clock_class }时钟 | { $n_relays } 个中继（平均可见 { $mean_relays_in_view } 个）| 收敛后位置 RMS { $converged_pos_rms_m } m，形式 1σ { $converged_pos_sigma_m } m（3σ { $converged_pos_3sigma_m } m — 协方差 FoM，不是经核准的 PL）| 时钟频率 σ { $final_clock_freq_sigma } | 协方差正定性 { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — { $user }用户，{ $clock_class }时钟：相对真值的 3-D 位置误差（收敛后 RMS { $converged_pos_rms_m } m）

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = 成对比较矩阵为空

engine-e-mcda-ahp-pairwise-matrix-is-not-square = 成对比较矩阵不是方阵（第 { $i } 行有 { $row } 个，应为 { $n } 个）

engine-e-mcda-ahp-entry-must-be-finite-and = 元素 a[{ $i }][{ $j }] = { $v } 必须为有限正数

engine-e-mcda-ahp-diagonal-must-be = 对角元素 a[{ $i }][{ $i }] = { $row } 必须为 1

engine-e-mcda-ahp-entries-must-be-reciprocal = 元素 a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } 必须互为倒数（≈ 1）

engine-e-mcda-ahp-upper-row-has-entries-expected = 上三角第 { $i } 行有 { $row } 个元素，应为 { $v2 } 个

engine-e-mcda-ahp-upper-entry-must-be-finite = 上三角元素 ({ $i },{ $j }) = { $v } 必须为有限正数

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS：决策矩阵为空

engine-e-mcda-copras-copras-no-criteria = COPRAS：没有准则

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS：{ $n } 个权重，但有 { $types } 个准则类型

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS：至少需要一个成本型（Min）准则

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS：备选方案 { $i } 有 { $row } 个取值，但共有 { $n } 个准则

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS：备选方案 { $i } 的准则 { $j } 取值 { $x } 必须为有限数且 > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I：数据集为空

engine-e-mcda-electre-electre-no-criteria = ELECTRE I：没有准则

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I：备选方案 { $i } 有 { $row } 个取值，但共有 { $n } 个准则

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I：备选方案 { $i } 含有非有限值

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA：决策矩阵为空

engine-e-mcda-moora-moora-no-criteria = MOORA：没有准则

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA：{ $n } 个权重，但有 { $types } 个准则类型

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA：备选方案 { $i } 有 { $row } 个取值，但共有 { $n } 个准则

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA：备选方案 { $i } 含有非有限值

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA：准则 { $j } 的 L2 范数为零

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II：决策矩阵为空

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II：没有准则

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II：{ $n } 个权重，但有 { $types } 个类型 / { $prefs } 个偏好函数

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II：备选方案 { $i } 有 { $row } 个取值，但共有 { $n } 个准则

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II：备选方案 { $i } 含有非有限值

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS：决策矩阵为空

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS：没有准则

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS：{ $n } 个权重，但有 { $types } 个准则类型

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS：备选方案 { $i } 有 { $row } 个取值，但共有 { $n } 个准则

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS：备选方案 { $i } 含有非有限值

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = 加性效用没有属性

engine-e-mcda-utility-attributes-but-weights = { $attributes } 个属性，但有 { $weights } 个权重

engine-e-mcda-utility-invalid-scaling-constant = 缩放常数 { $w } 无效

engine-e-mcda-utility-scaling-constants-sum-to-zero = 缩放常数之和为零

engine-e-mcda-utility-attribute-values-expected-got = 应有 { $attributes } 个属性值，实际为 { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR：决策矩阵为空

engine-e-mcda-vikor-vikor-no-criteria = VIKOR：没有准则

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR：{ $n } 个权重，但有 { $types } 个准则类型

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR：备选方案 { $i } 有 { $row } 个取值，但共有 { $n } 个准则

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR：备选方案 { $i } 含有非有限值

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS：决策矩阵为空

engine-e-mcda-waspas-waspas-no-criteria = WASPAS：没有准则

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS：{ $n } 个权重，但有 { $types } 个准则类型

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS：lambda { $lambda } 必须在 [0, 1] 内

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS：备选方案 { $i } 有 { $row } 个取值，但共有 { $n } 个准则

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS：备选方案 { $i } 的准则 { $j } 取值 { $x } 必须为有限数且 > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM：决策矩阵为空

engine-e-mcda-wpm-wpm-no-criteria = WPM：没有准则

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM：{ $n } 个权重，但有 { $types } 个准则类型

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM：备选方案 { $i } 有 { $row } 个取值，但共有 { $n } 个准则

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM：备选方案 { $i } 的准则 { $j } 取值 { $x } 必须为有限数且 > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = 决策矩阵没有准则

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = 决策矩阵没有备选方案

engine-e-mcda-wsm-criterion-has-an-invalid-weight = 准则“{ $name }”的权重 { $weight } 无效

engine-e-mcda-wsm-criterion-weights-sum-to-zero = 准则权重之和为零

engine-e-mcda-wsm-alternative-has-values-but-there = 备选方案“{ $name }”有 { $values } 个取值，但共有 { $n } 个准则

engine-e-mcda-wsm-alternative-has-non-finite-value = 备选方案“{ $name }”在准则“{ $value }”上含有非有限值

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = 不是 DAF：短于一条记录

engine-e-naif-kernel-not-daf-identification-word = 不是 DAF：标识字 { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = 不支持的 DAF 二进制格式 { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = DAF 头不合理：ND { $nd }，NI { $ni }，FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF 地址 { $addr } 超出文件末尾

engine-e-naif-kernel-bad-daf-address-range = DAF 地址范围 { $first }..={ $last } 无效

engine-e-naif-kernel-daf-summary-list-does-not = DAF 摘要列表没有终止

engine-e-naif-kernel-daf-summary-record-claims-summaries = DAF 摘要记录 { $rec } 声称含有 { $count } 个摘要

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = type-2 段格式错误：RSIZE { $rsize }，INTLEN { $intlen }，N { $n }

engine-e-naif-kernel-type-segment-size-does-not = type-2 段大小与其目录不符

engine-e-naif-kernel-epoch-outside-the-record = 历元 { $et } 超出记录范围 [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = type-1 段大小与其 N = { $n } 不符

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = type-1 记录格式错误：KQMAX1 { $kqmax1 }，KQ { $kq }

engine-e-naif-kernel-not-an-spk = 不是 SPK：{ $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = SPK 摘要不是 ND=2，NI=6

engine-e-naif-kernel-no-spk-type-data-for = 天体 { $target } 在 ET { $et } 处没有 SPK type-1/2 数据

engine-e-naif-kernel-spk-segment-for-is-in = { $target } 的 SPK 段位于坐标系 { $frame }，不是 J2000

engine-e-naif-kernel-spk-centre-chain-does-not = SPK 中心链未到达质心

engine-e-naif-kernel-not-binary-pck = 不是二进制 PCK：{ $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = PCK 摘要不是 ND=2，NI=5

engine-e-naif-kernel-no-pck-type-data-for = 坐标系 { $body_frame } 在 ET { $et } 处没有 PCK type-2 数据

engine-e-naif-kernel-pck-frame-is-given-against = PCK 坐标系 { $body_frame } 相对坐标系 { $other } 给出，而后者不是 J2000 或 ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = 数值 { $s } 无效

engine-e-navsignal-must-be-positive-number = { $s } 必须为正数

engine-e-navsignal-modulation-expected-name-args-bpsk = 调制 { $label }：应为 NAME(args)，例如 BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = 调制 { $label }：缺少右括号

engine-e-navsignal-modulation-is-not-one-of = 调制 { $label } 不是 BPSK(n)、BOC(m,n) 或 MBOC(6,1,p) 之一

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = { $s } 中的实体未结束

engine-e-ndm-xml-bad-character-reference = 字符引用 &{ $ent }; 无效

engine-e-ndm-xml-unknown-entity = 未知实体 &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = 处理指令未结束

engine-e-ndm-xml-unterminated-comment = 注释未结束

engine-e-ndm-xml-unterminated-declaration = 声明未结束

engine-e-ndm-xml-expected-an-element-at-byte = 字节 { $pos } 处应为元素

engine-e-ndm-xml-unterminated-start-tag = 起始标签未结束

engine-e-ndm-xml-attribute-without-value = 属性没有值

engine-e-ndm-xml-unterminated-attribute-value = 属性值未结束

engine-e-ndm-xml-unterminated-end-tag = 结束标签未结束

engine-e-ndm-xml-unterminated-cdata = CDATA 未结束

engine-e-ndm-xml-content-after-the-root-element = 根元素之后有内容

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } 必须为有限数且非负

engine-e-nma-budget-subframe-must-be-positive = subframe_s 必须为正

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps 必须为正

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed 必须为 0 或正数

engine-e-nmea-synth-cli-unexpected-argument = 意外参数 { $s }

engine-nmea-synth-cli-instructor-log = 教员日志：{ $e }

engine-nmea-synth-cli-instructor-log-and = 教员日志：{ $jp } 和 { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP 服务器正在监听 { $s }；等待 { $wait_clients } 个客户端

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = 应为 YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = 日期或时间超出范围（1980 至 2099 年）

engine-e-nmea-synth-clock-no-such-calendar-date = 不存在该日历日期

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } 必须为有限数

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }：{ $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s 必须在 1 至 86400 s 内

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz 必须为 1、2、5 或 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = 船舶位置必须在赤道 89 度范围内

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn 必须在 0 至 60 内

engine-e-nmea-synth-config-vessel-rate-of-turn-and = 船舶转向率和加速度限值必须为正

engine-e-nmea-synth-config-give-at-least-one-waypoint = 请至少给出一个 [[waypoint]] 或 vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = 航路点 { $v1 } 超出范围

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = 航路点 { $v1 } 的 speed_kn 必须在 0 至 60 内

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems 必须至少指明一个星座

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences：{ $s } 不是 { $all_sentences } 之一

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s 必须至少为 1

engine-e-nmea-synth-config-event = 事件 { $v1 }（{ $kind }）：{ $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s 必须在运行区间内

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s 必须为正；ramp_s 和 recovery_s 不得为负

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s 不得超过 duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } 不适用于该类型

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz 必须在 20 至 60 内

engine-e-nmea-synth-config-cn0-drop-db-is-required = 必须给出 cn0_drop_db

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db 必须在 0 至 80 内

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db 必须在 0 至 30 内

engine-e-nmea-synth-config-final-offset-is-required = 必须给出 final_offset_m

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m 必须在 0 至 500000 内

engine-e-nmea-synth-config-the-drag-would-accelerate-the = 牵引会使虚假航迹的加速度最高达 { $need } m/s^2，超过 max_accel_mps2 = { $a }；请加长 ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = 请在 bearing_deg、relative_bearing_deg 中恰好给出一个

engine-e-nmea-synth-config-offset-is-required = 必须给出 offset_s

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s 必须非零且在一天以内

engine-e-nmea-synth-config-delay-is-required = 必须给出 delay_s

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s 必须在 0 至 3600 内

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = 天际线描述中没有遮挡

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } 已结束

engine-nmea-synth-gen-the-receiver-reports-fix-again = 接收机再次报告定位（使用 { $n_used } 颗卫星）

engine-nmea-synth-gen-the-receiver-has-no-fix = 接收机没有定位（可用卫星 { $n_used } 颗，需要四颗）

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = 自 T+{ $start_s } s 起持续 { $duration_s } s（起始斜坡 { $ramp_s } s，恢复斜坡 { $recovery_s } s）

engine-nmea-synth-log-jamming-received-n0-falls-by = 压制干扰（jamming）：接收 C/N0 最多下降 { $cn0_drop_db } dB（各卫星差异 { $spread_db } dB）；卫星陆续掉出，可用卫星少于四颗时定位丢失

engine-nmea-synth-log-towards-deg-true = 朝向真方位 { $b } deg

engine-nmea-synth-log-towards-deg-true-deg-relative = 朝向真方位 { $t } deg（相对起始时航向 { $r } deg，之后保持）

engine-nmea-synth-log-natural-degradation-the-sky-closes = 自然劣化：天空在给定天际线（{ $e }）之后被遮挡；其后的卫星仍被列出但无 SNR 且不被使用，其余卫星的 C/N0 不变，也没有任何伪造

engine-nmea-synth-log-instructor-log = 教员日志：{ $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = 培训员备注：{ $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = 开始 { $start_utc }   时长 { $duration_s } s   随机种子（seed） { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }峰值  真值：{ $true_peak_sog_kn } kn，{ $true_peak_accel_mps2 } m/s^2   报告值：{ $reported_peak_sog_kn } kn，{ $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems：未知星座 { $other }（gps、glonass、galileo、beidou）

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }容差低于 f64 秩读取噪声下限 { $RANK_TOLERANCE_NOISE_FLOOR }（= sqrt(f64::EPSILON)）：其等效特征值下限 rel_tol^2 = { $v1 } 低于 Gram 矩阵的舍入噪声，因此多出的方向是算术残留，不代表可观测性。

engine-observability-gramian-rank-clamped-from-the-singular = 秩已从奇异值个数 { $counted } 限制为 min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound }（rel_tol { $rel_tol }）：{ $n_rows }x{ $n_cols } 矩阵的秩不可能为 { $counted }。{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP 未定义（秩亏 / 奇异几何）：{ $n } 个状态的秩为 { $rank }，基准亏秩 { $v3 }，条件数 { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } 字节不是 36 字节记录的整数倍

engine-e-odf-record-precedes-any-group-header = 记录 { $v1 } 出现在任何组头之前

engine-e-odf-no-orbit-data-group = 没有轨道数据组

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } 不是 { $name } 的关键字

engine-e-odm-without = { $name } 缺少 { $k }

engine-e-odm-needs-exactly-one-of = { $name } 需要恰好一个 { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION 和 MESSAGE_ID 是 3.0 版头部关键字（版本 { $version }）

engine-e-odm-unexpected-line = 意外的行 { $b }

engine-e-odm-unknown-keyword = 未知关键字 { $k }

engine-e-odm-block-repeated-or-out-of = { $block } 块在 { $key } 处重复或顺序错误

engine-e-odm-repeated = { $key } 重复

engine-e-odm-comments-after-the-last-keyword = 最后一个关键字之后有注释

engine-e-odm-given-twice = { $b } 被给出两次

engine-e-odm-opm-without-metadata = OPM 缺少元数据

engine-e-odm-opm-without-state-vector = OPM 缺少状态矢量

engine-e-odm-omm-without-metadata = OMM 缺少元数据

engine-e-odm-omm-without-mean-elements = OMM 缺少平均根数

engine-e-odm-is-not-keyword-of-the = { $k } 不是 { $kind } 块的关键字

engine-e-odm-block-without = { $kind } 块缺少 { $k }

engine-e-odm-block-with-data-lines = { $kind } 块含有数据行

engine-e-odm-line-has-values-expected = { $kind } 行 { $l } 有 { $l2 } 个值，应为 { $n } 个

engine-e-odm-is-not-an-ocm-metadata = { $k } 不是 OCM 元数据关键字

engine-e-odm-ocm-metadata-without = OCM 元数据缺少 { $k }

engine-e-odm-block-repeated = { $kind } 块重复

engine-e-odm-inside-block = { $t } 出现在块内

engine-e-odm-unsupported-ocm-block = 不支持的 OCM 块 { $tag }

engine-odm-outside-block = { $t } 出现在块外

engine-e-odm-closes-block = { $t } 关闭了一个 { $want } 块

engine-e-odm-unexpected-line-2 = 意外的行 { $t }

engine-e-odm-outside-block = { $k } 出现在块外

engine-e-odm-unterminated-block = 块未结束

## src/oem.rs

engine-e-oem-epoch-missing-date-time-separator = 历元缺少 'T' 日期/时间分隔符：{ $s }

engine-e-oem-unsupported-oem-epoch-date-expected = 不支持的 OEM 历元日期“{ $date }”（应为 yyyy-mm-dd）

engine-e-oem-unsupported-oem-epoch-time-expected = 不支持的 OEM 历元时间“{ $time }”（应为 HH:MM:SS）

engine-e-oem-bad-epoch-year = 历元年份无效：{ $d }

engine-e-oem-bad-epoch-month = 历元月份无效：{ $d }

engine-e-oem-bad-epoch-day = 历元日期无效：{ $d }

engine-e-oem-bad-epoch-hour = 历元小时无效：{ $t }

engine-e-oem-bad-epoch-minute = 历元分钟无效：{ $t }

engine-e-oem-bad-epoch-second = 历元秒无效：{ $t }

engine-e-oem-oem-epoch-field-out-of = OEM 历元字段超出范围：{ $s }

engine-e-oem-unexpected-oem-header-line = 意外的 OEM 头部行：{ $line }

engine-e-oem-expected-meta-start-found = 应为 META_START，实际为：{ $line }

engine-e-oem-unexpected-oem-metadata-line = 意外的 OEM 元数据行：{ $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM 段元数据缺少 META_STOP

engine-e-oem-oem-metadata-missing-object-name = OEM 元数据缺少 OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = OEM 元数据缺少 OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = OEM 元数据缺少 CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = OEM 元数据缺少 REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = OEM 元数据缺少 TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = OEM 元数据缺少 START_TIME

engine-e-oem-oem-metadata-missing-stop-time = OEM 元数据缺少 STOP_TIME

engine-e-oem-oem-data-line-needs-position = OEM 数据行需要位置+速度（6 个）或 +加速度（9 个）分量，实际为 { $n } 个：{ $line }

engine-e-oem-non-numeric-oem-state-value = 非数值的 OEM 状态值“{ $t }”，位于：{ $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM 缺少 CCSDS_OEM_VERS 头部

engine-e-oem-oem-missing-creation-date-header = OEM 缺少 CREATION_DATE 头部

engine-e-oem-oem-missing-originator-header = OEM 缺少 ORIGINATOR 头部

engine-e-oem-oem-carried-no-segments = OEM 不含任何段

engine-oem-oem-interop-round-tripped-segment = oem-interop：往返 { $segments } 个段，{ $n_states_total } 个状态；最大往返误差 { $p } km / { $v } km/s（MODELLED 互操作）

engine-oem-oem-interop-ingested-segment-states = oem-interop：从外部 OEM（发出方 { $originator }）导入 { $segments } 个段，{ $n_states_total } 个状态（MODELLED 互操作）

engine-e-oem-no-covariance-start-block = 没有 COVARIANCE_START 块

engine-e-oem-no-covariance-stop = 没有 COVARIANCE_STOP

engine-e-oem-bad-covariance-value = 协方差值“{ $tok }”无效：{ $e }

engine-e-oem-expected-21-covariance-values-found = 应有 21 个协方差值，实际为 { $vals } 个

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM 导出需要完整的（第 1 行 + 第 2 行）TLE；此块没有

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } 必须在 [0, 1] 内

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg 必须在 [5, 90] 内

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave 必须为 "plane" 或 "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction 必须为 "downlink" 或 "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = availability_targets_pct 的各项必须在 (0, 100) 内

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h 最大为 8760（一年）

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries：{ $steps } 步超过了单个结果可容纳的 { $MAX_STEPS } 步；请加大 step_s 或缩短 duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = 未知时钟类别 "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = 每个站点都需要名称

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = 站点 { $name }：纬度/经度超出范围

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = 站点 { $name }：altitude_m 必须在 [0, top) 内

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere：{ $wavelength_nm } nm，仰角 { $elevation_deg } deg，穿过大气前余量 { $margin0 } dB；最佳站点 { $scn } { $v5 } %；{ $order } 站网络：天气独立时 { $last } %，天气相关时 { $last2 } %（MODELLED，咨询性（仅供参考））

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = RINEX 块已解析，但不含任何受支持的星历

## src/orbit.rs

engine-e-orbit-user-site-lat-deg-must = user_site：lat_deg 必须在 [-90, 90] 内，且每个字段均为有限值

engine-e-orbit-no-satellites-to-export = 没有可导出的卫星

engine-e-orbit-time-step-must-be-positive = 导出 SP3 时 time.step_s 必须为正

engine-e-orbit-time-step-must-be-positive-2 = 导出 OEM 时 time.step_s 必须为正

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } 必须为正；当前为 { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s 必须为有限数且非负

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate 必须为有限数且非负

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = 欺骗干扰源（spoofer）的最小仰角必须在 [0, 90) 度内

engine-e-orbital-timing-cross-check-sigma-ns-must = 交叉核对的 sigma_ns 必须为有限数且非负

engine-orbital-timing-the-in-plane-neighbour-degrees = 同轨道面的相邻卫星（前方 { $v1 } 度）在单个欺骗干扰源（spoofer）的覆盖范围之外（宽 { $v2 } 度）

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = 同轨道面的相邻卫星（前方 { $v1 } 度）可能位于同一欺骗干扰源（spoofer）的覆盖范围之内（宽 { $v2 } 度），因此两台时钟可能被一并牵引

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = 缺少输入文件

engine-e-osnma-cli-max-time-error-has-no = 没有 --reference-time 时，--max-time-error 不起作用

engine-e-osnma-cli-not-number = 不是数字：{ $s }

engine-e-osnma-cli-public-key-must-be-id = 公钥必须为 ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = 公钥类型必须为 p256 或 p521

engine-e-osnma-cli-unknown-format = 未知格式 { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } 不是文本；UBX 数据流请使用 --format ubx

engine-e-osnma-cli-vector-csv-needs-start-gst = 矢量 CSV 需要 --start-gst 或带日期的文件名

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    错误：无法读取 { $input }：{ $e }

engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA 验证
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = 输入：{ $input }（{ $pages } 页）

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx：{ $frames } 帧；已解码 { $inav_pages } 个 I/NAV 页，其中 { $pages } 个已定时（{ $bad_crc } 个 CRC 错误，{ $unstamped } 个无法定位，{ $time_conflicts } 个时间冲突）

engine-osnma-cli-overall-nma-status = 总体：{ $status_word }   NMA 状态：{ $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = 告警：收到了经验证的 OSNMA 告警电文。请停止使用 OSNMA 数据；不报告任何已认证的内容。

engine-osnma-cli-freshness-not-enforced-no-reference = 时效性：未强制执行。未给出参考时间，因此子帧时间取自输入，旧数据的重放将通过认证。

engine-osnma-cli-freshness-sub-frames-within-of = 时效性：与参考时间 { $v2 } 相差不超过 { $max_err } s 的子帧被采用；{ $set_aside } 个被搁置。参考时间为单一时刻。

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }卫星  状态          已认证  失败  待定  已弃用  最后认证

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }历元（标签子帧）      tx   数据  adkd  ctr  结果

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = 第 { $v1 } 行：应有 3 个字段

engine-e-osnma-input-line-bad-svid = 第 { $v1 } 行：SVID 无效

engine-e-osnma-input-line-bad-bit-count = 第 { $v1 } 行：比特数无效

engine-e-osnma-input-line-data-is-not-hex = 第 { $v1 } 行：数据不是十六进制

engine-e-osnma-input-line-bit-count-does-not = 第 { $v1 } 行：比特数与数据不符

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = 时间容差必须小于一个子帧（{ $SUBFRAME_S } s），实际为 { $t } s

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834 折射仅对 0 至 3 km 的测站高度有定义；当前为 { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s 和 step_s 必须为正

engine-e-passes-station-lat-deg-must-be = station_lat_deg 必须在 [-90, 90] 内

engine-e-passes-mask-deg-must-be-in = mask_deg 必须在 [0, 90) 内

engine-e-passes-duration-hours-must-be-finite = duration_hours 必须为有限正数

engine-e-passes-step-must-be-finite-and = step_s 必须为有限正数

engine-passes-passes-pass-es-of-km = passes：{ $altitude_km } km / { $inclination_deg }° 轨道在（{ $station_lat_deg }°, { $station_lon_deg }°）上空 > { $mask_deg }° 的过境：{ $duration_hours } h 内 { $passes } 次；总可见时长 { $total_access_s } s（MODELLED）

## src/precise_products.rs

engine-e-precise-products-short-record = { $record } 记录过短：{ $line }

engine-e-precise-products-bad-number-in = { $line } 中的数值 { $s } 无效

engine-e-precise-products-bad-field-in = { $line } 中的字段 { $s } 无效

engine-e-precise-products-bad-antex-epoch = ANTEX 历元 { $s } 无效

engine-e-precise-products-bad-offset = 偏移 { $body } 无效

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = 星历提供方在 JD(TT) { $epoch_jd_tt } 处没有地心 { $name }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D 误差 RMS { $rms } m（最大 { $max } m）

engine-pvt-post-fit-rms = { " " }| 拟合后 RMS { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } 颗导航卫星 | 已解算 { $epochs_solved }/{ $epochs_total } 个历元 | 平均 { $mean_n_used } 颗卫星，PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = 单点定位 — 相对测绘坐标的 3D 误差（RMS { $rms_3d_m } m）

engine-pvt-single-point-positioning-post-fit = 单点定位 — 拟合后残差 RMS（平均 { $mean_postfit_rms_m } m）

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = RunOutput 的数组访问器需要 NumPy（pip install numpy）：{ $e }

engine-e-python-is-not-numeric-array-list = { $path } 不是数值数组（数值列表，或等长数值列表组成的列表）

engine-e-python-is-not-non-empty-list = { $path } 不是非空的记录列表

engine-e-python-and-must-be-the-same = i 和 q 的长度必须相同（{ $i } 对 { $q }）

engine-e-python-not-acquired-statistic-threshold = { $code }：未捕获（统计量 { $statistic } < 门限 { $threshold }）

engine-python-design-prn-channels-at-most = { $designs } 个（设计，PRN）通道；每次扫描最多 256 个

engine-python-not-acquired-statistic-threshold = { $code }：未捕获（统计量 { $statistic } < 门限 { $threshold }）

engine-e-python-runs-needs-label = runs[{ $i }] 需要 `label`

engine-e-python-runs-needs-result = runs[{ $i }] 需要 `result`

engine-e-python-must-be-between-and-32 = { $name } 必须在 0 至 2**32 - 1 之间

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | 随机种子（seed） { $seed } | v{ $engine_version } | 量子方案胜出 { $value }/{ $foms } 项 FoM | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev }，来自 { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = 未知 baseline_clock_class“{ $s }”（csac|uso|dsac|tcxo|ocxo|rafs）

engine-e-quantum-trade-unknown-candidate-clock-class-optical = 未知 candidate_clock_class“{ $other }”（optical-lattice|trapped-ion|mercury-ion）

engine-e-quantum-trade-adev-taus-values-must-be = ADEV 的 taus/values 必须为有限数且 > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | 候选 { $candidate_source } | 授时守时（holdover）{ $timing_holdover_s }s 对 { $timing_holdover_s2 }s（{ $timing_benefit_x }x）| 惯性 { $inertial_holdover_s }s 对 { $inertial_holdover_s2 }s（{ $inertial_benefit_x }x）| 韧性滑行 { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = RINEX 钟差文件声明的时间系统 { $id } 不在本读取器已知范围内（已知：{ $known_clock_time_systems }）；拒绝读取，而不是把其历元当作 GPS 时间

engine-e-realdata-clk-rinex-clock-file-has-satellite = RINEX 钟差文件含有卫星系统 { $other } 且未声明 TIME SYSTEM ID；拒绝猜测其历元的时间系统

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX 钟差文件声明了不同的时间系统（{ $s } 和 { $ts }）；拒绝将它们合并到同一时间轴上

engine-e-realdata-clk-no-as-or-ar-records = { $id } 没有 AS 或 AR 记录

engine-e-realdata-clk-short-circular-row = Circular T 行过短：{ $t }

engine-e-realdata-clk-bad-value-in = { $t } 中的值 { $s } 无效

engine-e-realdata-clk-no-section-mjd-header-found = 未找到第 1 节 MJD 头

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = 结束标签未结束

engine-e-realdata-ion-sdr-unbalanced-closing-tag = 结束标签不匹配

engine-e-realdata-ion-sdr-unterminated-tag = 标签未结束

engine-e-realdata-ion-sdr-attribute-value-missing = 缺少属性值

engine-e-realdata-ion-sdr-element-outside-the-document = 元素位于文档之外

engine-e-realdata-ion-sdr-text-outside-the-document = 文本位于文档之外

engine-e-realdata-ion-sdr-element-left-open = 有 { $stack } 个元素未关闭

engine-e-realdata-ion-sdr-expected-one-root-element-found = 应有一个根元素，实际为 { $n } 个

engine-e-realdata-ion-sdr-unknown-frequency-format = 未知频率格式 { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = 不支持的编码 { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } 个流：仅读取单流文件

engine-e-realdata-ion-sdr-block-of-cycles-with-header = 带有头或尾的 { $cycles } 周期块在重复；仅读取跨越整个文件的单个块

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = 数据块：{ $words_per_chunk } 个字，每字 { $word_bytes } 字节

engine-e-realdata-ion-sdr-unsupported-sample-format = 不支持的采样格式 { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = 量化 { $quantization }，每个样本压缩为 { $packed_bits } 位

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = { $sample_rate_hz } Hz 的采样率不是速率因子 { $samples_per_lump } 的整数倍

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = 数据块不含完整的单元

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = 请求样本 { $start }..{ $v1 }，文件含有 { $total } 个

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = 无法解析 CRD 版本 { $f }

engine-realdata-llr-crd-crd-format-version-is-not = 不支持 CRD 格式版本 { $v }（仅 1 和 2 共用本读取器所依赖的 record-11 字段顺序）

engine-realdata-llr-crd-unreadable-station-id = 无法解析测站标识 { $f }

engine-realdata-llr-crd-unreadable-time-scale = 无法解析时间尺度 { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD 历元时间尺度 { $time_scale } 不是格式规范所称分析者可接受的三种之一（3 = UTC(USNO)，4 = UTC(GPS)，7 = UTC(BIH)）；拒绝将其读作 UTC

engine-realdata-llr-crd-unreadable-h4-field = 无法解析 h4 字段 { $i }：{ $f }

engine-realdata-llr-crd-unreadable-field = 无法解析字段 { $i }：{ $f }

engine-realdata-llr-crd-unreadable-epoch-event = 无法解析历元事件 { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = 非物理的飞行时间 { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = 无法读取标准点目录 { $dir }：{ $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = { $dir } 中没有 *.npt 标准点文件 — 本场景读取真实存档测量数据，没有这些文件无法运行

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = 数值“{ $t }”无效：{ $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM 有一个维度为零

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = 编码 { $encoding }：LuGRE 批次为二进制补码

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } 字节：短于 IQS 头

engine-e-realdata-lugre-not-an-iqs-frame = 不是 IQS 帧：{ $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = 采样率：元数据 { $sample_rate_hz } Hz，头 { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = 量化：元数据 { $quantization } 位，头 { $quant_bits } 位

engine-realdata-lugre-centre-frequency-metadata-hz-header = 中心频率：元数据 { $center_freq_hz } Hz，头 { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = 中频：元数据 { $translated_freq_hz } Hz，头 { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = 样本数：元数据布局给出 { $layout }，头 { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = 头/尾：元数据 { $header_bytes }/{ $footer_bytes } 字节，格式 { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = 文件长度 { $file_len } 不等于头 + { $value } 样本字节 + 尾

engine-realdata-lugre-field-missing = 缺少字段 { $key }

engine-e-realdata-lugre-field-unreadable = 字段 { $key } 无法解析

engine-realdata-lugre-raw-line = RAW 第 { $v1 } 行：{ $e }

engine-realdata-lugre-acq-line = ACQ 第 { $v1 } 行：{ $e }

engine-realdata-lugre-nav-line = NAV 第 { $v1 } 行：{ $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK 第 { $v1 } 行：无法解析

engine-e-realdata-lugre-clk-row-columns-expected = CLK 第 { $v1 } 行：{ $v } 列，应为 3 列

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = 解析 JSON：{ $e }

engine-e-realdata-yunnan-expected-json-object-at-the = 顶层应为 JSON 对象

engine-e-realdata-yunnan-missing-recordtime-array = 缺少 recordTime 数组

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = 无法读取 EOP 文件 { $path }：{ $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s 必须为有限数且非负，实际为 { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = 无法读取较晚版本的 EOP 文件 { $path }：{ $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = EMPTY，且是有意为之：预报对终值的行需要一个发布历元，其背后有完整的 { $window_days } 天拟合窗口，且目标历元有已发布的 Bulletin B 终值。当前使用的输入（{ $eop_source }）没有同时满足两者的历元。请缩短 `operational_window_days`，或提供更长的真实 finals2000A 序列 — 不会为填满表格而人为制造行。

engine-realtime-frame-eop-measured-over-the-real-series = 基于当前使用的真实序列（{ $eop_source }）测得。每一行都是真实的预报误差：以不晚于 T 的快速 Bulletin A 行构成对 T+h 的预报，并与较晚发布的 T+h 处 Bulletin B 终值比对。持续性预报在相同的历元集上、对照相同的终值评分，因此两列之间只有预报器不同，其余完全相同。`improvement_factor` 低于 1 表示业务预报器在该预报时长上比持续性预报更差，并按此如实报告。

engine-realtime-frame-eop-measured-over-genuine-two-vintage = 基于真实的两个版本配对测得：原始发布版本（{ $eop_source }）在其自身数据截止之后带有真实的 Bulletin A 预报，已存档的较晚版本（{ $c }）带有这些日期最终得到的 Bulletin B 终值。三种预报均与该终值比对：已存档的 Bulletin A 预报本身、本 crate 对原始发布版本的业务式拟合，以及截止时刻的持续性预报。

engine-realtime-frame-eop-empty-and-deliberately-so-later = EMPTY，且是有意为之：已提供较晚版本（{ $c }），但在任何请求的预报时长上，都没有日期同时在原始发布文件（{ $eop_source }）中作为 Bulletin A PREDICTION、并在较晚版本中作为 Bulletin B 终值。不合成任何行。

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = EMPTY，且是有意为之。对真实存档预报评分需要同一 finals2000A 产品的两个版本；本次运行只给出了一个（{ $eop_source }）。代码库不附带存档的较早版本，也不会通过扰动现有版本来人为制造一个 — 合成的存档会使本表中的每个数字都变成对扰动的测量。请通过 `eop_finals2000a_later` 提供真实存档的较晚版本以填充本表。在此之前，本报告所含的真实预报对终值误差见 `table5_operational_vs_persistence`，其中预报为本 crate 自身所作，真值为较晚发布的 Bulletin B 终值。

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | 表 1：后处理 { $c } m（{ $c2 } ms UT1）↔ 实时 { $c3 } m（{ $c4 } ms UT1）| 表 2：终值下限 { $floor } ms → { $far } 天 { $far2 } ms | 预算总计 { $total_m } m（{ $total_time_ns } ns）| L19 杠杆臂 + L18 真实数据（Validated），OD 协方差（Modelled）

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = 基于真实的两个版本配对测得：原始发布文件（{ $eop_source }）的 Bulletin A 预报 UT1，与已存档较晚版本（{ $c }）最终的 Bulletin B 终值之差，预报时长：{ $predicted_vs_final }。

engine-realtime-frame-eop-empty-and-deliberately-so-an = EMPTY，且是有意为之：已提供存档的较晚版本（{ $c }），但在任何请求的预报时长上，都没有日期同时在原始发布文件（{ $eop_source }）中作为 Bulletin A PREDICTION、并在较晚版本中作为 Bulletin B 终值，因此没有可报告的预报对终值残差。不合成任何行。

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = EMPTY，且是有意为之：预报对终值残差需要同一 finals2000A 产品的两个版本。本次运行只给出了一个（{ $eop_source }）。其 Bulletin A 预报行对应尚无 Bulletin B 终值的未来日期，因此该残差无从测量，此处也不予编造。请通过 `eop_finals2000a_later` 提供存档的较晚版本以填充本表。在此之前，`table2_error_vs_horizon` 中报告的多日增长是对真实终值评分的持续性预报器，是真实测得的误差，但属于 Modelled 预报器，而不是 IERS Bulletin A 的预报残差。

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = 船舶评估需要 [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = 摘录为 { $excerpt } 字节；上限为 { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = 摘录含有超过 { $MAX_EXCERPT_EPOCHS } 个历元；请截短

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = 摘录在 { $calibration_s } s 校准窗口内结束（{ $epochs } 个历元）：未评分

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors：{ $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = UBX 日志中没有带 UTC 标记的历元

engine-e-receiver-trust-calibration-no-scenario-json-under = { $root } 下没有 scenario.json

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }：留出的洁净数据 Pfa <= { $B1_MAX_PFA }（已校准：{ $r }）

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry：{ $name } 必须为有限数且 > 0（当前为 { $v }）

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry：reported_vs_derived_rel 必须为有限数且 >= 0（当前为 { $reported_vs_derived_rel }）

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry：min_used 必须至少为 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry：low_elev_deg 必须在 [0, 90] 内（当前为 { $low_elev_deg }）

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry：azimuth_gap_deg 必须在 (0, 360] 内（当前为 { $azimuth_gap_deg }）

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry：cap_points 必须在 [0, 100] 内（当前为 { $cap_points }）

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry：full_ratio 必须为有限数且 > 1（当前为 { $full_ratio }）

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry：floor 必须在 (0, 100] 内（当前为 { $f }）

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry：floor（{ $f }）低于评分的 degraded_min（{ $degraded_min }）：仅凭几何即可降至不可信区间

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites = 几何 { $label }：HDOP { $fmt_dop }，PDOP { $fmt_dop2 }，VDOP { $fmt_dop3 }，{ $n_used } 颗卫星{ $v6 }

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }：几何扣分被归为不一致

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }：仅报告，不计分（几何并不差）

engine-receiver-trust-geometry-not-scored-the-score-deducts = 不计分（仅当 HDOP 高于 { $hdop_max }、PDOP 高于 { $pdop_max } 或卫星数少于 { $min_used } 时才扣分）

engine-receiver-trust-geometry-derived-from-logged-satellites = 由日志中记录的 { $n } 颗卫星推导

engine-receiver-trust-geometry-as-the-receiver-reports-it = 按接收机报告，使用了 { $n } 颗卫星

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = 所述 HDOP { $fmt_dop } 与由所述天空遮挡推导的 HDOP { $fmt_dop2 } 之差超出容差

engine-receiver-trust-geometry-satellites-in-view-but-not = 可见但未被跟踪的卫星（高度角不低于 { $low_elev_deg } deg 的 { $in_view } 颗中有 { $g } 颗）：属于信号环境，而非几何

engine-receiver-trust-geometry-satellites-fewer-than = { $n } 颗卫星，少于 { $min_used } 颗

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } 高于 { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } 高于 { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = 有 { $m } 颗卫星位于所述天际线之后

engine-receiver-trust-geometry-every-satellite-in-one-half = 所有卫星都在天空的同一半（空隙 { $max_azimuth_gap_deg } deg）

engine-receiver-trust-geometry-degraded-by-geometry-not-an = 几何导致降级：{ $parts }（{ $from }）；不属于不一致

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = 日志中没有历元：其中没有任何内容可按 { $name } 读取（{ $skipped_records } 条记录因损坏或无法解析而跳过）；请检查格式设置

engine-receiver-trust-ingest-gps-week-tow = GPS 周 { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS 周 { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC（日志中无日期）

engine-e-receiver-trust-live-live-must-be-finite-and = live：{ $name } 必须为有限值且 >= 0（实际为 { $v }）

engine-e-receiver-trust-live-live-idle-flush-must-be = live：idle_flush_s 必须大于 0

engine-e-receiver-trust-live-invalid-session = 会话无效：{ $e }

engine-receiver-trust-live-no-score-could-be-produced = 无法生成评分：{ $msg }

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = 没有可读取的 GNSS-SDR synchro 或 pvt 记录（跳过 { $skipped } 行）；行格式见 integrations/gnss-sdr/README.md

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = IMU 文件为空

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv：没有 `{ $n }` 列

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc：没有 `{ $n }` 列

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = IMU 文件中没有可读取的样本

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis 必须为 0、1 或 2（x、y、z）

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean 必须为有限值

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at = 日志有 { $n } 个样本；阿伦偏差拟合至少需要 { $MIN_SAMPLES } 个

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = 日志时间没有推进

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = 采样间隔不均匀（{ $n } 个间隔中有 { $uneven } 个相差超过 25 %）：请先对日志重采样

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = 日志过短，无法形成阿伦偏差曲线

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = { $name } 曲线的初始斜率为 { $v }，不接近 -0.5：白噪声不占主导（传感器是否静止？），因此其噪声系数不可靠

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = { $name } 曲线过短，无法检查其斜率

engine-receiver-trust-machines-novatel-gps-week-tow = GPS 周 { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = 没有可读取的 BESTPOS、RANGE 或 RXSTATUS 日志（跳过 { $skipped } 条记录）

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = 未找到有效的 RTCM 3 帧（{ $skipped } 个候选帧未通过 CRC 校验）

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime：{ $name } 必须为有限值且 > 0（实际为 { $v }）

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime：kin_limit_guard 必须在 (0, 1) 内（实际为 { $kin_limit_guard }）

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime：kin_sog_frac 必须在 [0, 1] 内（实际为 { $kin_sog_frac }）

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime：{ $name } 必须在 (0, 1) 内（实际为 { $v }）

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime：cn0_spread_min_sats 至少为 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime：kin_window_s 至少为 2 s

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = 监测器配置：未知的配置档“{ $other }”；已知：{ $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = 监测器配置：{ $name } 必须为有限值且 > 0（实际为 { $v }）

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = 监测器配置：jam_ind_threshold 必须为有限值

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = 监测器配置：mask_deg 必须在 [-90, 90) 内（实际为 { $mask_deg }）

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = 监测器配置：raim_pfa 必须在 (0, 1) 内（实际为 { $raim_pfa }）

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = 监测器配置：cn0_min_sats 至少为 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = 监测器配置：sats_lost 至少为 1

engine-receiver-trust-monitors-the-receiver-own-set-against = 接收机自身的 { $self_report_source } 集合与 Kshana 的监测器对照；两者都不是真值，一致不等于验证

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = 接收机时间线中有非有限的历元时间

engine-e-receiver-trust-monitors-the-log-is-shorter-than = 日志短于标定窗口：{ $cal_s } s 之前有 { $calibration_epochs } 个历元（日志跨度 { $span } s）；建立基线至少需要 3 个

engine-e-receiver-trust-platform-platform-must-be-in-got = platform：{ $name } 必须在 ({ $lo }, { $hi }] 内（实际为 { $x }）

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform：{ $name } 仅适用于 kind = "vessel"（当前 kind 为 "static"）

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = 无法读取 { $path }：WebAssembly 构建没有文件系统；请以 `text` 或 `base64` 内联传入文件

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }：`base64` 不是有效的标准 base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }：请在 `path`、`text`、`base64` 中给出一个

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }：只能在 `path`、`text`、`base64` 中给出一个

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } 必须为正数，实际为 { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = 事件 { $label }：onset_s 必须为非负数

engine-e-receiver-trust-scenario-event-end-must-be-after = 事件 { $label }：end_s 必须晚于 onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu：heading0_deg 和 time_offset_s 必须为有限值

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = 全程可信：标定后的 { $after_cal } 个历元内没有监测器报警

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = 首次报警在 { $t } s；标定后的 { $after_cal } 个历元中，不可信 { $untrusted_epochs } 个，降级 { $degraded_epochs } 个

engine-receiver-trust-scenario-of-stated-events-detected-within = { $events_evaluable } 个所述事件中有 { $events_detected } 个在 { $detect_tol_s } s 内被检测到

engine-receiver-trust-scenario-of-n0-predictions-within-db = { $predictions_evaluable } 项 C/N0 预测中有 { $predictions_agreeing } 项在 { $cn0_tol_db } dB 内

engine-receiver-trust-scenario-trust-score-lowest-final = 信任度最低 { $min }，最终 { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = 场景 { $r } | receiver-trust | { $format_name } 日志，{ $epochs } 个历元，历时 { $duration_s } s | 监测器 { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = 这是 { $k } 场景，而不是 receiver-trust 场景

engine-e-receiver-trust-score-score-must-be-finite-got = score：{ $name } 必须为有限值（实际为 { $v }）

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score：需满足 0 < degraded_min < nominal_min <= 100（实际为 { $degraded_min } 和 { $nominal_min }）

engine-e-receiver-trust-score-score-evidence-hold-must-be = score：evidence_hold_s 必须为有限值且 >= 0（实际为 { $evidence_hold_s }）

engine-e-receiver-trust-score-score-need-onset-ratio-full = score：需满足 0 <= onset_ratio < full_ratio（实际为 { $onset_ratio } 和 { $full_ratio }）

engine-e-receiver-trust-score-score-weight-of-must-be = score：{ $m } 的权重必须在 [0, 100] 内（实际为 { $w }）

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s 必须为有限正值

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg 必须在 (0, 90) 内

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 必须为有限正值

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m 和 rho0_kg_m3 必须为有限正值

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m 必须在 [10 km, 1000 km] 内

engine-reentry-reentry-allen-eggers-peak-at = 再入（Allen–Eggers）：V_e { $v } m/s，γ { $flight_path_angle_deg }° -> 峰值 { $v3 } g，位于 { $v4 } km，{ $velocity_at_peak_deceleration } m/s；加热峰值出现在 { $velocity_at_peak_heating } m/s；质点模型（重力、曲率、US76）峰值 { $peak_deceleration_g } g（MODELLED 弹道模型，无气动热）

engine-e-registry-unknown-scenario-id = 未知的场景 id：{ $id }

engine-representativeness-trl-band-is-not-well = TRL 区间 ({ $lo },{ $hi }) 格式不正确（需满足 0<=lo<=hi<=9）

engine-representativeness-modelled-simulation-only-claim-cannot = Modelled（仅仿真）的声明不能在 TRL { $MODELLED_TRL_CEILING } 以上具有代表性（区间上限 hi={ $hi }）；更高的 TRL 是缺口，而不是仿真输出

engine-representativeness-representativeness-representative-for-trl = 代表性 [{ $status }] — { $claim }（对 TRL { $lo }-{ $hi } 具有代表性）{ "\u000A" }

engine-resilience-score-declared-mean-source-quality = { $t } = declared({ $arch }) x 平均信号源质量

engine-resilience-score-weakest-rpcf-sub-score-bounded = 最弱的 RPCF 子分 = { $min_sub }；有界降级 = { $bounded }（若无界则上限为 Level 2）

engine-e-rinex-unsupported-navigation-record-header-line = 不支持的导航记录头 { $head }：以 '>' 开头的行是 RINEX 4 记录头，而不是 RINEX 3 导航记录

engine-e-rinex-bad-prn-in = { $head } 中的 PRN 无效

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4 导航：应为 '>' 记录头，实际为 { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4 记录 { $head } 有 { $body } 行，{ $msg } 星历需要 8 行

engine-e-rinex-rinex-record-is-followed-by = RINEX 4 记录 { $head } 之后是 { $body }，而不是 { $sv }

engine-e-rinex-obs-bad = 无效的 { $what }：{ $s }

engine-e-rinex-obs-rinex-observation-file-has-no = RINEX 观测文件没有 END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = RINEX 观测文件不含历元记录

engine-e-scenario-time-step-must-be-finite = time.step_s 必须为有限值且 > 0（实际为 { $step_s }）

engine-e-scenario-time-duration-must-be-finite = time.duration_s 必须为有限值且 > 0（实际为 { $duration_s }）

engine-e-scenario-time-step-must-not-exceed = time.step_s（{ $step_s }）不得超过 time.duration_s（{ $duration_s }）

engine-e-scenario-time-grid-too-large-steps = 时间网格过大：{ $n } 步超过 MAX_TIME_STEPS（{ $MAX_TIME_STEPS }）；请使用更大的步长或更短的时长

engine-sdr-sampling-rate-is-commensurate-with = 采样率与码速率可公度（{ $samples_per_chip } 个采样/码片，与整数相差 { $offset_from_integer_samples } 个采样）：零阶保持的码复制品无法分辨小于 { $dead_band_chips } 码片的码相位变化，因此超前/滞后鉴别器是带一个采样死区的阶梯形而不是三角形，DLL 会稳定在错误的滞后上。请使采样率偏离整数倍（5 MHz 为 { $lit_4_8876 } 个采样/码片；25 MHz 为 { $lit_24_4379 }），或进行足够的过采样，使死区低于所需的码相位精度。

engine-e-sgp4-sgp4-error-code = SGP4 错误代码 { $code }

engine-e-sigmf-unsupported-sigmf-core-datatype-this = 不支持的 SigMF core:datatype { $other }：此读取器处理复数类型 cf32_le、ci16_le 和 ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }：仅读取单通道记录

engine-e-sigmf-cannot-serialise-sigmf-metadata = 无法序列化 SigMF 元数据：{ $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = 无效的 SigMF 扩展命名空间 { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } 个标注扩展映射对应 { $annotations2 } 个标注

engine-e-sigmf-extension-key-is-not-in = 扩展键 { $k } 不在命名空间 { $ns } 中

engine-e-sigmf-extension-key-is-already-present = 扩展键 { $k } 已存在

engine-e-sigmf-global-is-not-an-object = global 不是对象

engine-e-sigmf-annotations-is-not-an-array = annotations 不是数组

engine-e-sigmf-annotation-is-not-an-object = 标注不是对象

engine-e-sigmf-invalid-sigmf-metadata-json = 无效的 SigMF 元数据 JSON：{ $e }

engine-e-sigmf-the-sigmf-recording-states-no = SigMF 记录未给出正的 core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = SigMF 捕获从采样 { $start } 开始，超出数据中的 { $data } 个采样

engine-e-skyline-skyline-must-be-in-90 = skyline：{ $what } 必须在 [0, 90) 度内，实际为 { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline：{ $what } 必须为有限数，实际为 { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline：峡谷需要 width_m

engine-e-skyline-skyline-width-must-be-positive = skyline：width_m 必须为正，实际为 { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline：峡谷高度和 antenna_m 必须为非负

engine-e-skyline-skyline-length-must-be-positive = skyline：length_m 必须为正，实际为 { $l }

engine-e-skyline-skyline-table-is-empty = skyline：表为空

engine-e-skyline-skyline-table-has-rows-over = skyline：表有 { $rows } 行，超过 { $MAX_TABLE_ROWS } 行的上限

engine-e-skyline-skyline-table-azimuth-is-outside = skyline：表中方位角 { $az } 超出 [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline：表中方位角必须严格递增（{ $az } 跟在 { $prev } 之后）

engine-e-skyline-skyline-more-than-sectors = skyline：扇区超过 { $MAX_SECTORS } 个

engine-e-skyline-skyline-the-sector-az-from = skyline：扇区 az_from = { $az_from } 至 az_to = { $az_to } 为空（整圆应使用表或遮蔽角）

engine-e-skyline-skyline-more-than-terrain-points = skyline：地形点超过 { $MAX_TABLE_ROWS } 个

engine-e-skyline-skyline-terrain-distance-must-be = skyline：地形 distance_m 必须为正，实际为 { $distance_m }

engine-skyline-with-fields-overridden-or-added = { $provenance }；字段由 { $user } 覆盖或新增

engine-skyline-stated-input = 所述输入：{ $user }

engine-e-skyline-unknown-skyline-preset-known-presets = 未知的 skyline 预设“{ $name }”；已知预设：{ $preset_names }

engine-e-slot-timing-datasheet-needs-at-least-two = 数据手册至少需要两个阿伦偏差点

engine-e-slot-timing-datasheet-point-must-have-positive = 数据手册点（{ $t }，{ $s }）的平均时间和阿伦偏差必须均为正

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s 必须为正的秒数

engine-e-slot-timing-phase-record-needs-at-least = 相位记录至少需要 32 个样本才能拟合噪声模型；实际为 { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = 相位记录含有非有限样本

engine-e-slot-timing-the-phase-record-yields-fewer = 相位记录得到的阿伦偏差点少于三个

engine-e-slot-timing-must-be-finite-and-non = { $name } 必须为有限值且非负；实际为 { $v }

engine-e-slot-timing-the-slot-guard-must-be = 时隙保护时间必须为正

engine-e-slot-timing-sigma-must-be-positive = k_sigma 必须为正

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset 必须为有限值

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k 必须为有限值

engine-e-slot-timing-give-exactly-one-of-oscillator = 请在 oscillator.class、oscillator.preset、oscillator.datasheet 或 oscillator.record 中恰好给出一个

engine-e-slot-timing-unknown-oscillator-class-csac-uso = 未知的 oscillator.class '{ $id }'（csac|uso|dsac|tcxo|ocxo|rafs）

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = 未知的 oscillator.preset '{ $id }'（ocxo|rubidium|caesium|csac）

engine-slot-timing-class-default-sigma-from-red = { $c } 类默认值：sigma_y(1 s) 取自 { $c2 }；红噪声下限在其以下两个和四个数量级处合成（为假设，而非测量）

engine-slot-timing-fitted-to-the-allan-deviation = 拟合到 { $document } 的阿伦偏差最大值，并缩放至不低于每一个点

engine-slot-timing-fitted-to-the-overlapping-allan = 拟合到 { $n_samples } 个样本的记录在 { $tau0_s } s 下的重叠阿伦偏差，采用 IEEE Std 1139 调频基础

engine-slot-timing-slot-timing-source-guard-ns = 时隙定时（{ $n } 个源）：在 k={ $k_sigma } 下保护时间 { $c } ns，在一次定位后 { $fmt_s } 即被突破（还剩 { $fmt_s2 }）；至少每 { $fmt_s3 } 定位一次（每天 { $fixes_per_day } 次）；主导项：{ $b }{ $v9 }

engine-e-solar-system-epoch-must-be-yyyy-mm = 历元 '{ $s }' 必须为 YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = 历元 '{ $s }'：{ $what } '{ $v }' 无效

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb 必须为有限值

engine-e-solar-system-table-must-be-auto-table1 = table 必须为 auto、table1 或 table2；实际为 '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = 在 JD { $jd_tdb } TDB 时，{ $name } 至 { $name2 } 链路没有星历

engine-e-solar-system-epoch-jd-tdb-is-outside = 历元 JD { $jd } TDB 超出公元前 3000 年至公元 3000 年，即 Standish 表的范围

engine-e-solar-system-track-points-must-be-to = track_points 必须为 8 至 2000；实际为 { $n_track }

engine-e-solar-system-unknown-observer-body = 未知的观测者天体 '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies 必须至少指定一个天体

engine-e-solar-system-unknown-body = 未知的天体 '{ $n }'

engine-e-solar-system-no-position-for-at-jd = 在 JD { $jd } TDB 时没有 { $name } 的位置（冥王星仅覆盖公元 1800 年至 2050 年）

engine-e-solar-system-no-standish-elements-for = 没有 { $name } 的 Standish 根数

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k }（SHA-256 { $k2 }），日心状态由引擎自带的读取器读取

engine-e-solar-system-unknown-link-body = 未知的链路天体 '{ $from }'

engine-e-solar-system-unknown-link-body-2 = 未知的链路天体 '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = 链路需要两个不同的天体；实际为 { $name }

engine-solar-system-solar-system-at-jd-tdb =
    太阳系于 { $input }（JD { $jd_tdb } TDB），{ $n_bodies } 个天体，观测者 { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = 光行时 { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  经度 { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }链路 { $from } -> { $to }：单程 { $one_way_light_time_s } s，双程 { $two_way_light_time_s } s，Shapiro { $l } us，太阳 { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = 历元 { $input } · { $standish_table } · 位置来自 Standish 根数

engine-e-sp3-epoch-needs-time-fields-got = 历元需要 6 个时间字段，实际为 { $tokens }

engine-e-sp3-bad-second = 秒无效：{ $tokens }

engine-e-sp3-record-needs-values-missing-column = 记录需要 4 个值，缺少列 { $v1 }

engine-e-sp3-bad-number = 数字无效：{ $field }

engine-e-sp3-empty-sp3-input = SP3 输入为空

engine-e-sp3-first-line-is-not-an = 第一行不是 SP3 文件头：{ $first }

engine-e-sp3-unsupported-sp3-version-in = { $first } 中的 SP3 版本不受支持

engine-e-sp3-missing-epoch-count-on-header = 文件头第 1 行缺少历元数

engine-e-sp3-record-has-no-satellite-id = 记录没有卫星标识：{ $line }

engine-e-sp3-position-record-before-any-epoch = 位置记录之前没有任何历元头

engine-e-sp3-sp3-file-contained-no-epoch = SP3 文件不含历元记录

engine-e-sp3-bad-accuracy-exponent-in = { $line } 中的精度指数 { $f } 无效

engine-e-sp3-bad-header-accuracy = 文件头精度 { $t } 无效

engine-e-sp3-short-line = %f 行过短 { $line }

engine-e-sp3-bad-base-in = { $line } 中的 %f 基数无效

engine-e-space-packet-version-exceeds-bits = 版本超过 3 位

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID 超过 11 位（0..=2047）

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count 超过 14 位（0..=16383）

engine-e-space-packet-data-field-must-be-at = 数据域至少为一个八位组

engine-e-space-packet-data-field-exceeds-65536-octets = 数据域超过 65536 个八位组

engine-e-space-packet-packet-shorter-than-the-octet = 数据包短于 6 个八位组的包头：{ $bytes } 字节

engine-e-space-packet-declared-data-length-header-octets = 声明的数据长度 { $data_len }（+6 包头）= { $total } 个八位组，但缓冲区为 { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC 粗时间八位组数 { $coarse_octets } 超出 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = CUC 细时间八位组数 { $fine_octets } 超出 0..=3（不支持扩展 P-field）

engine-e-space-packet-cuc-field-extended-field-not = CUC P-field { $p }：不支持扩展 P-field

engine-e-space-packet-field-time-code-id-is = P-field { $p }：时间码标识 { $id } 不是 CUC

engine-e-space-packet-field-is-not-cds-field = P-field { $p } 不是 CDS P-field

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-field { $p }：保留的亚毫秒代码 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC 粗时间 { $coarse } 无法放入 { $c } 个八位组

engine-e-space-packet-cuc-fine-does-not-fit = CUC 细时间 { $fine } 无法放入 { $n } 个八位组

engine-e-space-packet-cds-days-do-not-fit = CDS 天数 { $days } 无法放入 { $f } 个八位组

engine-e-space-packet-cds-ms-of-day-above = CDS 日内毫秒 { $ms_of_day } 超过 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS 亚毫秒 { $submillis } 超过 { $max_sub }

engine-e-space-packet-time-code-format-and-value = 时间码格式与取值属于不同的码

engine-e-space-packet-time-code-no-field-octet = 时间码：没有 P-field 八位组

engine-e-space-packet-time-code-needs-octets-present = 时间码需要 { $end } 个八位组，实际有 { $bytes } 个

engine-e-space-packet-time-code-format-differs-from = 时间码格式与隐含的 P-field 不同

engine-e-space-packet-the-format-has-time-code = 该格式有时间码域；但未给出

engine-e-space-packet-the-format-has-no-time = 该格式没有时间码域

engine-e-space-packet-ancillary-data-is-octets-the = 辅助数据为 { $ancillary } 个八位组；格式规定为 { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = 副包头至少须包含一个八位组

engine-e-space-packet-secondary-header-needs-octets-present = 副包头需要 { $end } 个八位组，实际有 { $bytes } 个

engine-e-space-packet-the-format-has-secondary-header = 该格式有副包头；但未给出

engine-e-space-packet-the-format-has-no-secondary = 该格式没有副包头

engine-e-space-packet-secondary-header-flag-disagrees-with = 副包头标志 { $v1 } 与格式不一致

engine-e-space-packet-data-field-shorter-than-the = 数据域短于 PEC

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } 与数据包的 CRC { $crc16_ccitt_false } 不一致

engine-e-space-packet-nothing-to-segment-empty-user = 没有可分段的内容：用户数据为空

engine-e-space-packet-max-user-octets-must-be = max_user_octets 至少为 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count 超过 14 位（0..=16383）

engine-space-packet-apid-where-was-expected = APID { $apid }，应为 { $a }

engine-space-packet-sequence-count-repeated = 序列计数 { $sequence_count } 重复

engine-space-packet-sequence-count-gap-after-packet = 序列计数有间断：{ $last } 之后为 { $sequence_count }（缺少 { $v2 } 个数据包）

engine-space-packet-sequence-count-out-of-order = 序列计数乱序：{ $last } 之后为 { $sequence_count }

engine-space-packet-packet-with-no-unit-open = { $f } 数据包出现时没有打开的单元

engine-space-packet-packet-while-unit-is-open = { $f } 数据包出现时已有单元处于打开状态

engine-e-space-packet-packet = 数据包 { $i }：{ $e }

engine-e-space-packet-the-sequence-ends-with-unit = 序列结束时仍有单元未关闭（没有末包）

engine-e-space-packet-apid-must-be-in-2047 = apid 必须在 0..=2047 内

engine-e-space-packet-packet-count-must-be = packet_count 必须 >= 1

engine-e-space-packet-data-len-must-be-in = data_len 必须在 1..=65536 内

engine-e-space-packet-internal-error-encode-decode-round = 内部错误：编码/解码往返不一致

engine-space-packet-space-packet-framed-ccsds-133 = space-packet：已封装 { $packet_count } 个 CCSDS-133.0 { $v2 } 数据包，APID { $apid }，共 { $total_bytes } 个八位组，往返完全一致（{ $round_trip_ok }）

engine-e-space-weather-f107-must-be-finite-and = f107 必须为有限正值

engine-e-space-weather-f107a-must-be-finite-and = f107a 必须为有限正值

engine-e-space-weather-kp-must-be-in = kp 必须在 [0, 9] 内

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km 不得为空

engine-e-space-weather-altitude-km-must-be-finite = 高度 { $h } km 必须为有限正值

engine-space-weather-space-weather-f10-f10-7a = 空间天气：F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp }（ap={ $sw }）-> T_inf={ $t_inf } K；在 { $value } km 处密度 x{ $density_activity_factor }（MODELLED）

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }：{ $what } 干扰源需要正的 bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }：线性调频干扰源需要正的 sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }：matched_to 指定了未知频段 { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }：请给出 received_power_dbw，或给出 eirp_dbw 并配以正的 range_m（二者不可同时给出）

engine-e-spectrum-off-must-be-later-than = { $name }：off_s 必须晚于 on_s

engine-e-spectrum-welch-the-sample-rate-must = welch：采样率必须为正

engine-e-spectrum-welch-nfft-must-be-power = welch：nfft = { $nfft } 必须为二的幂，且至少为 8

engine-e-spectrum-welch-samples-is-fewer-than = welch：{ $x } 个样本不足一个 { $nfft } 点的分段

engine-e-spectrum-iq-must-be-power-of = iq：n = { $n } 必须为二的幂，且至少为 16

engine-e-spectrum-cannot-read-recording-meta-path = 无法读取记录的 meta_path { $meta_path }：{ $e }

engine-e-spectrum-cannot-read-recording-data = 无法读取记录数据 { $data_path }：{ $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }：rx_bandwidth_mhz 必须为正

engine-e-spectrum-modulation-is-not-selectable-only = { $n }：调制 { $m } 不可选（仅 galileo-e1 可取 "mboc" 或 "boc11"）

engine-e-spectrum-signal-is-not-in-the = { $name }：信号 { $sig } 不在信号预设库中（{ $v2 }）

engine-e-spectrum-preset-signal-carries-its-own = { $name }：预设信号自带调制；请去掉 `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }：信号 { $sig } 未公布接收功率；请给出 signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }：自定义频段需要 `modulation`，例如 "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }：自定义频段需要 signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }：请给出 `signal` 或 `centre_mhz`，二者不可同时给出

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }：请给出 rx_bandwidth_mhz（无法定位主瓣）

engine-e-spectrum-duration-must-be-at-least = duration_s 至少为一个 step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } 个时间行超过允许的 5000 个

engine-e-spectrum-at-most-extra-panels = 额外面板最多 8 个

engine-e-spectrum-panel-need-max-mhz-min = 面板 { $name }：需满足 f_max_mhz > f_min_mhz 且 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = 网格：需满足 f_max_mhz > f_min_mhz 且 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = 场景频谱 | { $bands } 个频段 | { $jammers } 个干扰源 | 噪声底 { $n0_db } dBW/Hz | 最差频段 { $name } 最小 C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = 场景频谱 | 无频段 | 噪声底 { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples 必须在 10 到 20 之间

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype：请使用 cf32_le 或 ci16_le

engine-spectrum-frequency-across-time-down-colour = 横轴为频率，纵轴向下为时间，颜色表示功率谱密度（dBW/Hz）；噪声底 { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = 每个面板各有自己的频率范围，纵向为同一条时间轴，共用一个颜色标尺（dBW/Hz）；噪声底 { $n0_db } dBW/Hz

engine-e-spk-writer-frame-has-no-supported-naif = 坐标系 { $other } 没有受支持的 NAIF 代码

engine-e-spk-writer-segment-name-longer-than-40 = 段名长于 40 个字符：{ $name }

engine-e-spk-writer-segment-name-has-non-printing = 段名含有不可打印字符：{ $name }

engine-e-spk-writer-bad-target-for-centre = 中心 { $centre } 的目标 { $target } 无效

engine-e-spk-writer-degree-outside-27 = 阶数 { $degree } 超出 1..=27

engine-e-spk-writer-type-13-degree-is-not = 类型 13 的阶数 { $degree } 不是奇数

engine-e-spk-writer-states-for-epochs = { $n } 个历元对应 { $states } 个状态

engine-e-spk-writer-states-degree-needs = { $n } 个状态；阶数 { $degree } 需要 { $value } 个

engine-e-spk-writer-descriptor-start-is-not-before = 描述符的起始时间不早于其结束时间

engine-e-spk-writer-epochs-are-not-strictly-increasing = 历元不是严格递增的

engine-e-spk-writer-the-epochs-do-not-cover = 历元未覆盖描述符区间

engine-e-spk-writer-type-or-13-segment-carries = 类型 9 或 13 的段承载状态，而不是记录

engine-e-spk-writer-type-segment-needs-at-least = 类型 3 的段至少需要一条记录

engine-e-spk-writer-type-degree-outside-27 = 类型 3 的阶数 { $degree } 超出 0..=27

engine-e-spk-writer-type-interval-length-is-not = 类型 3 的区间长度 { $intlen } 不为正

engine-e-spk-writer-type-record-has-coefficients-expected = 类型 3 的记录 { $i } 有 { $value } 个系数，应为 { $ncof } 个

engine-e-spk-writer-descriptor-start-is-after-its = 描述符的起始时间晚于其结束时间

engine-e-spk-writer-descriptor-starts-before-the-first = 描述符起始于第一条记录之前

engine-e-spk-writer-descriptor-ends-after-the-last = 描述符结束于最后一条记录之后

engine-e-spk-writer-type-segment-carries-records-not = 类型 3 的段承载记录，而不是历元或状态

engine-e-spk-writer-type-21-segment-needs-at = 类型 21 的段至少需要一条差分行

engine-e-spk-writer-difference-line-size-is-not = 差分行大小 { $dlsize } 不是 4 MAXDIM + 11（MAXDIM 在 15..=25 内）

engine-e-spk-writer-difference-lines-of-different-sizes = 差分行大小不一

engine-e-spk-writer-epochs-for-difference-lines = { $n } 条差分行对应 { $epochs } 个历元

engine-e-spk-writer-difference-line-epochs-are-not = 差分行历元不是严格递增的

engine-e-spk-writer-the-last-difference-line-ends = 最后一条差分行结束于描述符之前

engine-e-spk-writer-zero-step-size-in-difference = 差分行 { $i } 中的步长 { $j } 为零

engine-e-spk-writer-type-21-segment-carries-difference = 类型 21 的段承载差分行，而不是状态

engine-e-spk-writer-an-spk-needs-at-least = SPK 至少需要一个段

engine-e-spk-writer-segment = 段 { $i }：{ $e }

engine-e-spk-writer-comment-line-has-non-printing = 注释行含有不可打印字符：{ $l }

engine-e-spk-writer-comments-need-characters-are-reserved = 注释需要 { $nchars } 个字符；已预留 { $v1 } 个（请调大 ncomch）

engine-e-spk-writer-difference-line-orders-out-of = 差分行阶数 { $kqmax1 } { $kq } 超出范围

engine-e-spk-writer-zero-step-size-at-index = 索引 { $j } 处的步长为零

engine-e-spk-writer-et-outside-the-segment = ET { $et } 超出段范围 [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = 类型 3 的段 { $name } 过短

engine-e-spk-writer-type-segment-words-for-rsize = 类型 3 的段 { $name }：N = { $n }、RSIZE = { $rsize } 对应 { $nw } 个字

engine-e-spk-writer-type-21-segment-too-short = 类型 21 的段 { $name } 过短

engine-e-spk-writer-type-21-segment-words-for = 类型 21 的段 { $name }：N = { $n }、MAXDIM = { $maxdim } 对应 { $nw } 个字

engine-e-spk-writer-segment-too-short = 段 { $name } 过短

engine-e-spk-writer-segment-words-for = 段 { $name }：N = { $n } 对应 { $nw } 个字

engine-e-spk-writer-segment-is-in-frame = 段 { $name } 位于坐标系 { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = SPK 中心链不终止

engine-e-spk-writer-no-spk-chain-connects-and = 在 ET { $et } 没有 SPK 链连接 { $target } 与 { $observer }

engine-e-spk-writer-epoch-is-not-yyyy-mm = 历元 { $s } 不是 YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = 不支持时间系统 { $other }（支持 UTC 或 TDB）

engine-e-spk-writer-centre-has-no-supported-naif = 中心 { $other } 没有受支持的 NAIF 标识

engine-e-spk-writer-oem-segment-has-no-data = OEM 段 { $name } 没有数据行

engine-e-spk-writer-oem-segment-no = OEM 段 { $idx }：没有 { $k }

engine-e-spk-writer-no-export-settings-for-oem = OEM 段 { $idx } 没有导出设置

engine-e-spk-writer-oem-data-line-has-fields = OEM 数据行有 { $f } 个字段：{ $line }

engine-e-spk-writer-oem-value = OEM 值 { $f }：{ $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $exports } 个导出设置对应 { $out } 个 OEM 段

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED（融合）— 层：{ $fired }

engine-spoof-detect-single-layer-indication-below-the = 单层指示（{ $fired }）低于融合阈值 — 需要佐证

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg 必须为正，实际为 { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = 面板 { $i }：面积必须 >= 0

engine-e-srp-boxwing-panel-outside = 面板 { $i }：{ $name } = { $c } 超出 [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = 面板 { $i }：吸收 + 镜面 + 漫反射 = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = 面板 { $i }：法向/轴为零

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = ECOM2 法方程矩阵奇异或病态

engine-ssv-check-mod1-min = { $key } MOD1 最小值

engine-ssv-check-mod4-min = { $key } MOD4 最小值

engine-e-ssv-check-heo-preset = heo 预设

engine-e-ssv-check-lunar-preset = lunar 预设

engine-e-ssv-formation-formation-needs-at-least-one = 编队至少需要一个副星

engine-e-ssv-formation-duration-min-and-step-must = duration_min 和 step_s 必须为正

engine-e-ssv-nav-no-signals-for-the-chosen = 所选星座和频段没有信号

engine-e-ssv-scenario-unknown-antenna = 未知的天线 `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = 方向图 CSV 为空

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` 不是方向图 CSV 中的数

engine-e-ssv-scenario-pattern-csv-row-has-columns = 方向图 CSV 行 `{ $l }` 有 { $f } 列，应为 { $azimuths } 列

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" 需要 pattern_csv 与 pattern_text 中的恰好一个

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` 不是 booklet、parametric 或 table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver：请给出 cn0_min_dbhz 或 weak_signal，二者不可同时给出

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = 在任何 C/N0 下，载波环都无法保持所述多普勒变化率

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` 不是 acquisition、tracking 或 both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz 必须为有限值

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation：请在 preset 与 orbit 中恰好给出一个

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` 不是 leo、meo、geo、heo 或 lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation：请在 duration_min 与 duration_periods 中恰好给出一个

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } 必须为正

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg 需要 1 到 8 个有限偏移量

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd 不得为负

engine-e-ssv-scenario-give-exactly-one-of-shell = 请在 [shell]、[trajectory] 和 [navigation] 中恰好给出一个

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] 需要为主星提供 [navigation] 表

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include 和 constellations.bands 不得为空

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km 必须大于 100

engine-e-ssv-scenario-shell-grid-levels-above-is = 不支持 shell.grid_levels 大于 5

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna 必须为 hemisphere 或 omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = 壳层扫描仅支持 booklet 发射方向图（赋形方向图需要轨迹扫描）

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] 适用于 [trajectory]，而不是 [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory：请在 preset 与 orbit 中恰好给出一个

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` 不是 leo、meo、geo、heo 或 lunar-transfer

engine-e-ssv-scenario-unknown-preset = 未知的预设

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv 壳层 { $altitude_km } km：{ $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv 导航：位置 RMS 总体 { $p }，GNSS 轨道以内 { $p2 }，以上 { $p3 }；最长间隔 { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = 位于 { $offset_deg } deg（{ $baseline_km } km）的副星：相对 RMS 滤波后 { $rel_rms_filter_m } m，由绝对定位得到 { $rel_rms_from_absolute_m } m

engine-ssv-scenario-combined-max-outage-min = { $band } 组合 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }%（最长中断 { $max_outage_1_min } min）

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv 轨迹，高度 { $perigee_alt_km } 至 { $apogee_alt_km } km：{ $parts }

engine-e-ssv-sweep-duration-min-and-step-min = duration_min 和 step_min 必须为正

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } 必须为正数，实际为 { $v }

engine-e-standards-pack-no-standards-pack-named-the = 没有名为 `{ $id }` 的标准包；现有的包：{ $ids }

engine-e-standards-pack-pack-manifest = 包清单：{ $e }

engine-e-standards-pack-test-duplicate-id = 测试 { $id }：id 重复

engine-e-standards-pack-test-scenario-is-not-in = 测试 { $id }：场景 `{ $s }` 不在包中

engine-e-standards-pack-test-scored-test-needs-bar = 测试 { $id }：计分测试需要判据

engine-e-standards-pack-test-test-that-needs-input = 测试 { $id }：需要输入的测试没有判据

engine-e-standards-pack-test-give-either-scenario-or = 测试 { $id }：请给出 `scenario` 或 `needs_input`，不可同时给出，也不可都不给

engine-e-standards-pack-test-supports-unknown-row = 测试 { $id }：supports 指向未知的行 `{ $r }`

engine-e-standards-pack-test-unknown-op = 测试 { $id }：未知的 op `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = 测试 { $id }：{ $pointer } 上的判据需要 `value` 与 `against` 中的恰好一个

engine-e-standards-pack-row-duplicate-id = 行 { $id }：id 重复

engine-e-standards-pack-row-asks-must-be-short = 行 { $id }：`asks` 必须是简短的转述

engine-e-standards-pack-row-no-test-supports-it = 行 { $id }：没有测试支持它

engine-standards-pack-not-scored-needs-input = 不计分：需要输入（{ $n }）

engine-e-study-study-has-no-scenarios-to = 研究没有可运行的场景

engine-e-study-cannot-read-scenario = 无法读取场景 { $path }：{ $e }

engine-e-study-scenario-failed = 场景 { $path } 失败：{ $e }

engine-e-study-scenario-produced-unparseable-json = 场景 { $path } 产生了无法解析的 JSON：{ $e }

engine-e-suite-invalid-suite-manifest = 套件清单无效：{ $e }

engine-e-surface-unknown-source-use-adsb-or = 未知的来源 `{ $o }`：请使用 `adsb` 或 `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } 为 { $len } 字节，超过 { $limit } 字节的上限

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` 不是 ISO-8601 UTC 时间

engine-e-surface-invalid-receiver-trust-session = receiver-trust 会话无效：{ $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` 不是 ISO-8601 UTC 时间

engine-e-surface-dataset-custom-needs-licence-licence = 数据集 `custom` 需要 licence、licence_url 和 attribution

engine-e-surface-at-least-one-map-is = 至少需要一幅地图

engine-e-surface-epoch = 历元：{ $e }

engine-e-surface-not-utf = { $suffix }：不是 UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = 未知的场景类型 `{ $k }`；类型列表给出了全部类型

engine-surface-is-not-bundled-it = `{ $name }` 未随附：它{ $why }

engine-surface-no-bundled-scenario-named-the = 没有名为 `{ $name }` 的内置场景；示例列表给出了现有的 { $v1 } 个

engine-e-surface-invalid-toml = TOML 无效：{ $e }

engine-e-surface-unknown-export-format-expected-one = 未知的导出格式 `{ $format }`；应为 czml、kml、geojson、stk 或 sigmf 之一

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps 得到 { $opts } 帧，而最多返回 { $MAX_ANIMATION_FRAMES } 帧；请降低 fps 或 duration_s，或用命令行写出更长的序列

engine-e-surface-scenario-run-failed = 场景运行失败：{ $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log 指定了文件 `path`；请以 `text` 或 `base64` 给出日志（此接口不读取文件）

engine-e-surface-max-sp-errors-must-be = max_sp_errors 最多为 20

engine-e-surface-frames-must-be-to = frames 必须为 1 到 { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 必须为 0 到 99

engine-e-surface-runs-given-at-most-per = 给出了 { $runs } 次运行；每份报告最多 { $MAX_COMPLIANCE_RUNS } 次

engine-e-surface-the-runs-total-bytes-the = 运行共 { $total } 字节；单份报告的上限为 { $max_bytes }

engine-e-surface-result-files-given-at-most = 给出了 { $results } 个结果文件，最多 256 个

engine-e-surface-result-is-not-json = 结果 { $v1 } 不是 JSON：{ $e }

engine-e-surface-unknown-format-use-prometheus-cef = 未知的格式 `{ $o }`：请使用 `prometheus`、`cef`、`leef`、`otlp` 或 `mqtt`

engine-e-surface-unknown-imu-format-use-csv = 未知的 IMU 格式 `{ $o }`：请使用 `csv` 或 `euroc`

engine-e-surface-unknown-axis-use-or = 未知的轴 `{ $o }`：请使用 `x`、`y` 或 `z`

engine-e-surface-id-must-be-to-64 = id 必须为 1 到 64 个不含空格的可打印 ASCII 字符

engine-surface-fitted-from-stationary-imu-log = 由静止 IMU 日志拟合，sha256 { $sha }，轴 { $axis }，阿伦估计器

engine-e-surface-unknown-input-kind-use-result = 未知的 input_kind `{ $o }`：请使用 `result` 或 `jsonl`

engine-e-surface-the-input-holds-no-trust = 输入中没有信任历元

engine-e-surface-the-reply-is-over-the = 回复超过 { $max_bytes } 字节的上限；请发送更少的历元，或关闭 `syslog_all`

engine-e-surface-otlp-needs-build-with-the = otlp 需要启用 `otlp` 特性的构建

engine-e-surface-the-pack-and-token-total = 包与令牌共 { $total } 字节；上限为 { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = 时间戳令牌为空

engine-e-surface-must-be-64-lower-case = { $what } 必须为 64 位小写十六进制数字

engine-e-surface-must-be-32-bytes = { $what } 必须为 32 字节

engine-surface-verified-against-the-public-key = VERIFIED：已对照所提供的公钥验证（签名者指纹 { $fp }）。

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED：哈希和签名与密钥 { $fp } 一致，而该密钥由包自行声明。请提供通过其他途径从签名者处获得的签名者公钥，以确认是谁签署的。

engine-e-surface-files-must-be-json-object = files 必须是由名称到内容的 JSON 对象

engine-e-surface-pack-has-at-most-64 = 一个包最多有 64 个文件

engine-e-surface-file-name-must-be-plain = 文件名 `{ $k }` 必须是纯名称

engine-e-surface-base64-is-not-valid-standard = { $k }：`base64` 不是有效的标准 base64

engine-e-sweep-unknown-sweep-parameter = 未知的扫描参数：{ $other }

engine-e-sweep-unknown-sweep-metric = 未知的扫描指标：{ $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep 至少需要一个轴

engine-e-sweep-sweep-key-is-malformed = 扫描键 `{ $key }` 格式错误

engine-e-sweep-sweep-key-follows-an-array = 扫描键 `{ $key }`：`{ $part }` 跟在数组之后，因此必须为索引

engine-e-sweep-unreachable = 不可达

engine-e-sweep-sweep-key-index-is-past = 扫描键 `{ $key }`：索引 { $i } 超出数组的 { $n } 个条目

engine-e-sweep-sweep-key-parent-is-not = 扫描键 `{ $key }`：`{ $part }` 的父级不是表

engine-e-sweep-sweep-key-no-field = 扫描键 `{ $key }`：没有字段 `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = 扫描键 `{ $key }`：`{ $last }` 的父级不是表

engine-e-sweep-sweep-key-no-field-2 = 扫描键 `{ $key }`：没有字段 `{ $last }`

engine-e-sweep-metric-no-field-in-result = 指标 `{ $path }`：结果中没有字段 `{ $part }`

engine-e-sweep-metric-value-is-not-number = 指标 `{ $path }`：值不是数

engine-e-sweep-sweep-node-serialize = 扫描节点序列化：{ $e }

engine-e-sweep-sweep-node-result-parse = 扫描节点结果解析：{ $e }

engine-e-sweep-sweep-axis-declared-unit-but = 扫描轴 `{ $key }`：声明的单位为 `{ $d }`，但被扫描的包发布的单位为 `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = 扫描工作线程发生 panic

engine-e-sweep-generic-sweep-needs-at-least = 通用扫描至少需要一个轴

engine-e-sweep-generic-sweep-needs-at-least-2 = 通用扫描至少需要一个指标

engine-e-sweep-generic-sweep-base-must-carry = 通用扫描的 `base` 必须自带 `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = 通用扫描不能扫描另一个扫描

engine-e-telecom-timing-unknown-oscillator-expected-one-of = 未知的振荡器 { $oscillator }；应为 { $presets } 之一

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day 和 temperature_coeff_per_k 必须为有限值

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s 必须为有限正值

engine-e-telecom-timing-duration-must-be-finite-and = duration_s 必须为有限值，且长度至少为十二个样本

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s 必须位于 [0, duration_s) 内

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns 必须为有限值且 >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = 温度和频偏输入必须为有限值（周期 > 0）

engine-e-telecom-timing-the-record-would-exceed-000 = 记录将超过 5 000 000 个样本；请调大 sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = 钟差序列至少需要 13 个样本，实际为 { $pairs }

engine-e-telecom-timing-every-time-and-time-error = 每个 time_s 和 time_error_ns 都必须为有限值

engine-e-telecom-timing-time-must-increase = time_s 必须递增

engine-e-telecom-timing-the-series-must-be-uniformly = 序列必须均匀采样：步长 { $v1 } 为 { $d } s，第一个为 { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV 行 { $v1 } 不是 `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = 该掩码通过 { $lit_0_1 } Hz 低通滤波器定义，而本引擎仅在采样间隔不超过 { $MAX_FILTER_DT_S } s 时应用该滤波器；本记录的采样间隔为 { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = 请给出 [holdover] 或 [series]，二者不可同时给出

engine-e-telecom-timing-give-either-series-samples-or = 请给出 series.samples 或 series.csv_path，二者不可同时给出

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days 必须为有限值且 >= 0

engine-telecom-timing-telecom-timing-max-te-ns = 电信授时：max|TE| { $max_abs } ns，历时 { $v2 } s；{ $masks }（MODELLED）

engine-e-telemetry-cli-unknown-format-cef-or-leef = 未知的 --format `{ $f }`（cef 或 leef）

engine-e-telemetry-cli-unknown-option = 未知的选项 `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input 与 --result 二选一

engine-e-telemetry-cli-listen = --listen { $l }：{ $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }：没有地址

engine-telemetry-cli-warning-metrics-is-served-without = 警告：/metrics 在 { $addr } 上未经认证即可访问；请绑定到 localhost，或置于自己的访问控制之后

engine-e-telemetry-cli-bind = 绑定 { $addr }：{ $e }

engine-telemetry-cli-serving-http-metrics = 正在提供 http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host：{ $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp 与 --syslog-tcp 二选一

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting 适用于 --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }：主题片段不得为空，不得含 #、+，也不得以 / 开头

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp 需要使用 `--features otlp` 构建

engine-telemetry-cli-warning-input-line = 警告：输入第 { $line_no } 行：{ $e }

engine-e-telemetry-cli-cannot-open = 无法打开 { $p }：{ $e }

engine-telemetry-cli-warning-mqtt-messages-were-not = 警告：有 { $n } 条 MQTT 消息未送达

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint 必须以 http:// 开头

engine-e-telemetry-otlp-endpoint-has-no-host = endpoint 没有主机

engine-e-telemetry-otlp-resolve = 解析 { $hostport }：{ $e }

engine-telemetry-otlp-no-address-for = { $hostport } 没有地址

engine-telemetry-otlp-warning-otlp-export-failed = 警告：otlp 导出失败：{ $e }

engine-e-telemetry-sample-not-json = 不是 JSON：{ $e }

engine-e-telemetry-sample-not-json-object = 不是 JSON 对象

engine-e-telemetry-sample-is-not-number = `{ $k }` 不是数

engine-e-telemetry-sample-is-not-finite = `{ $k }` 不是有限值

engine-e-telemetry-sample-missing = 缺少 `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } 超出 0..=100

engine-e-telemetry-sample-missing-state = 缺少 `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` 不是数组

engine-e-telemetry-sample-entry-has-no-name = `{ $key }` 的一个条目没有名称

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` 缺失或不是有限数

engine-e-telemetry-sample-position-is-not-an-object = `position` 不是对象或 null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` 缺失或不是字符串

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` 不是 >= 0 的有限数

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` 不是字符串

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` 不是布尔值

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` 不是对象或 null

engine-e-telemetry-sample-result-has-no-epochs = 结果中没有 `epochs`

engine-e-telemetry-sample-bad-epochs = `epochs` 无效：{ $e }

engine-e-telemetry-syslog-host-is-bytes-syslog-host = 主机为 { $host } 字节；syslog 主机名最多 255 字节

engine-e-telemetry-syslog-host-must-be-printable-ascii = 主机必须为不含空格的可打印 ASCII

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }：{ $g } 对 { $w }（无法表示为 f64）

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }：存在，应为不存在

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }：不存在，应为存在

engine-e-time-transfer-budget-must-be-finite = { $name }：{ $n } 必须为有限值

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }：slant_tec_tecu 必须为有限值且非负

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }：第 { $v1 } 行：不是 MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }：没有 { $code } 的 AR 记录

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = 未知的序列格式 { $f }（circular-t、mjd-csv、rinex-clock）

engine-e-time-transfer-budget-must-be-finite-2 = { $n } 必须为有限值

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s 必须给出 16 到 20000 次测量

engine-time-transfer-budget-time-transfer-budget-offset-ns = 时间传递预算：{ $name } - { $name2 } 偏移 { $ns } ns（Sagnac { $ns2 } ns，电离层 { $ns3 } ns）；合成 u { $ns4 } ns（A 类 { $ns5 } ns，平均时间 { $averaging_s } s）；{ $series } 实测序列（MODELLED）

engine-e-tle-non-ascii-characters-in-tle = TLE { $label } 中含有非 ASCII 字符：{ $line }

engine-e-tle-tle-truncated-reading-columns = TLE 在读取 { $what } 时被截断（列 { $v1 }..{ $z }）

engine-e-tle-tle-too-short-for-column = TLE { $label } 过短，没有第 69 列校验和

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } 第 69 列没有校验位

engine-e-tle-tle-checksum-mismatch-column-69 = TLE { $label } 校验和不匹配：第 69 列为 { $want }，计算结果为 { $got }

engine-e-tle-not-tle-line = 不是 TLE 第 1 行：{ $line1 }

engine-e-tle-not-tle-line-2 = 不是 TLE 第 2 行：{ $line2 }

engine-e-tle-invalid-in-tle = TLE 中的 { $what } 无效：{ $s }

engine-e-tle-invalid-epoch-year-in-tle = TLE 中的历元年份无效：{ $col }

engine-e-tle-invalid-catalogue-number-in-tle = TLE 中的目录编号无效：{ $col }

engine-e-tle-inclination-out-of-range-180 = 倾角超出范围 [0, 180] deg：{ $inclination_deg }

engine-e-tle-eccentricity-out-of-range = 偏心率超出范围 [0, 1)：{ $eccentricity }

engine-e-tle-non-positive-mean-motion = 平均运动非正：{ $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = TLE 中的 { $what } 尾数无效：{ $mant }

engine-e-tle-invalid-exponent-in-tle = TLE 中的 { $what } 指数无效：{ $exp }

engine-tle-satellite-line-only-element-set = 卫星 { $satnum }：仅含第 2 行的根数集按解析开普勒（二体）根数解析——缺少第 1 行的阻力/B* 和 SGP4 长期项，因此该轨道在远离历元处会偏离真实的 SGP4 拟合；如需 SGP4 精度，请提供对应的第 1 行

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop：C/N0 剖面需要正的历元和时长

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop：C/N0 剖面将需要超过 { $MAX_DETECTOR_STEPS } 个检测器步（{ $total } s，每历元 { $epoch_s } s）；请缩短 ramp_duration_s 或加长 predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop：{ $name } 必须为有限值

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop：{ $name } 必须为正（实际为 { $v }）

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop：correlator_spacing_chips 必须小于 { $lit_1_9 } 码片（实际为 { $correlator_spacing_chips }）

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop：pullin_bandwidth_ratio 至少为 1（实际为 { $pullin_bandwidth_ratio }）——重新牵引时带宽比跟踪时更窄的环路会使迟滞反转

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop：ramp_duration_s 不得为负

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop：cn0_low_dbhz（{ $cn0_low_dbhz }）不得超过 cn0_high_dbhz（{ $cn0_high_dbhz }）

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop：{ $name } 不得为空

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop：{ $name } 有 { $axis } 个条目；上限为 { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop：{ $name } 含有非有限值

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop：确认驻留至少为 1 个历元

engine-e-twstft-budget-at-least-eight-samples-are = 至少需要八个样本

engine-e-twstft-budget-samples-must-increase-in-time = 样本必须随时间递增

engine-e-twstft-budget-samples-must-be-on-regular = 样本必须位于规则网格上

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } 行：{ $validated } 行经外部验证，{ $modelled } 行为建模，{ $partner_owned } 行由合作方负责。{ "\u000A" }

engine-verification-the-complete-machine-checked-evidence = 完整的、经机器检查的证据台账（ledger）：**{ $total } 行 — { $validated } 行 VALIDATED，{ $modelled } 行 MODELLED，{ $partner_owned } 行 PARTNER**。只有存在独立的外部参考基准（oracle）时，一行才可以为 VALIDATED（矩阵不变量测试会强制这一点）。相同的数据，附带指向每项测试、模块和已提交固定样例的逐行可点击链接，即 https://kshana.dev 上的*验证台账（Validation ledger）*。每个建模行为何未经外部验证，见 [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md)。{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } 项能力标注为 MODELLED。{ "\u000A" }

engine-wasm-files-json-is-not-json = files_json 不是 JSON：{ $e }

engine-wasm-runs-json-is-not-json = runs_json 不是 JSON：{ $e }

engine-wasm-runs-needs-label = runs[{ $i }] 需要 `label`

engine-wasm-runs-needs-result = runs[{ $i }] 需要 `result`

engine-wasm-results-json-is-not-json = results_json 不是字符串的 JSON 数组：{ $e }

engine-wasm-maps-json-must-be-json = maps_json 必须是字符串的 JSON 数组：{ $e }

engine-wasm-plans-json-is-not-json = plans_json 不是字符串的 JSON 数组：{ $e }

engine-wasm-options-json-is-not-json = options_json 不是 JSON：{ $e }

engine-wasm-input-is-about-bytes-over = 输入约为 { $b64 } 字节，超过 { $v2 } 字节的上限

engine-altpnt-sequential-title = 序贯地形参考导航（递推 SITAN）

engine-altpnt-sequential-free-inertial-drift-grows = 自由惯性漂移（增长）

engine-altpnt-sequential-terrain-matched-bounded = 地形匹配（有界）

engine-altpnt-sequential-waypoint-full-scale = 航路点 →    满量程 { $maxv } m

engine-advanced-report-eyebrow = Kshana 运行报告

engine-advanced-report-meta = 类型 <code>{ $kind }</code> · 引擎 { $engine } · 场景 <code>{ $scenario }</code>（文件摘要 { $digest }…）

engine-advanced-report-toc-summary = 1 摘要

engine-advanced-report-toc-inputs = 2 输入

engine-advanced-report-toc-results = 3 结果

engine-advanced-report-toc-aggregation = 3a 汇总

engine-advanced-report-toc-companions = 3b 动画与导出

engine-advanced-report-toc-events = 4 事件

engine-advanced-report-toc-labels = 5 验证标签

engine-advanced-report-toc-not-modelled = 6 未建模内容

engine-advanced-report-toc-reproducibility = 7 可复现性

engine-advanced-report-h-summary = 1. 执行摘要

engine-advanced-report-honesty-label = <strong>如实标签</strong>（{ $source }）：{ $label }

engine-advanced-report-capabilities-used = <strong>所用能力：</strong>{ $n_validated } 项 VALIDATED，{ $n_modelled } 项 MODELLED，{ $n_partner } 项 PARTNER（依赖而非提供）；见第 5 节。

engine-advanced-report-member-runs = <strong>成员运行：</strong>{ $n }，汇总见第 3a 节。

engine-advanced-report-h-inputs = 2. 输入

engine-advanced-report-inputs-note = 场景文件设置的每个字段，均展平为其路径。单位取自结果的 <code>units</code> 块（字段单位模式，docs/field-units-schema.json）中对该字段的描述，否则取自字段名后缀；两者均未给出的单位显示为未说明。

engine-advanced-report-th-parameter = 参数

engine-advanced-report-th-value = 值

engine-advanced-report-th-unit = 单位

engine-advanced-report-th-unit-source = 单位来源

engine-advanced-report-h-results = 3. 结果

engine-advanced-report-chart-alt = 结果图表

engine-advanced-report-also-written-to = { " " }（亦写入 { $file }）

engine-advanced-report-h-scalars = 标量结果

engine-advanced-report-h-columns = 数值列

engine-advanced-report-th-result = 结果

engine-advanced-report-th-column = 列

engine-advanced-report-th-count = 计数

engine-advanced-report-th-min = 最小值

engine-advanced-report-th-max = 最大值

engine-advanced-report-th-first = 首个

engine-advanced-report-th-last = 末个

engine-advanced-report-omitted-inputs = <p class="note">本页省略了另外 { $n } 项输入；report.json 列出相同的行，结果文档载有每个值。</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">本页省略了另外 { $n } 项标量结果；report.json 列出相同的行，结果文档载有每个值。</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">本页省略了另外 { $n } 个数值列；report.json 列出相同的行，结果文档载有每个值。</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">本页省略了另外 { $n } 个事件；report.json 列出相同的行，结果文档载有每个值。</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. 成员运行汇总

engine-advanced-report-mode = <p>模式 <strong>{ $mode }</strong>。</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>模式 <strong>{ $mode }</strong>，针对 <code>{ $kind }</code> 类型。</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>模式 <strong>{ $mode }</strong>，{ $n_runs } 次成员运行。</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>模式 <strong>{ $mode }</strong>，针对 <code>{ $kind }</code> 类型，{ $n_runs } 次成员运行。</p>{ "\u000A" }

engine-advanced-report-run-digest = 运行摘要（对各成员结果摘要按调度顺序计算的 SHA-256）：<code>{ $digest }</code>

engine-advanced-report-table-empty = 此表无行：结果未列出任何内容。

engine-advanced-report-distribution-caption = { $metric } 的蒙特卡罗分布（{ $n } 个样本），20 个等宽区间；虚线标出第 5、第 50 和第 95 百分位。

engine-advanced-report-distribution-caption-unit = { $metric } 的蒙特卡罗分布（{ $n } 个样本，{ $unit }），20 个等宽区间；虚线标出第 5、第 50 和第 95 百分位。

engine-advanced-report-h-companions = 3b. 动画与导出

engine-advanced-report-animation-alt = 本次运行时间序列的动画

engine-advanced-report-animation-caption = 本次运行自身的样本在移动的时间游标后逐步绘出（<code>--animate svg</code> 的动态绘制；在减少动态效果设置下和打印时显示完成后的图像）。

engine-advanced-report-no-animation = 无动画：{ $reason }

engine-advanced-report-no-animation-default = 结果不含时间序列

engine-advanced-report-player-written-by = 交互式播放器由 <code>{ $command }</code> 写出。

engine-advanced-report-written-beside = 与本报告写在一起：{ $links }。

engine-advanced-report-th-export = 导出

engine-advanced-report-th-applies = 适用

engine-advanced-report-th-files-or-reason = 文件或原因

engine-advanced-report-written-by = 由 <code>{ $command }</code> 写出

engine-advanced-report-does-not-apply = 不适用

engine-advanced-report-yes = 是

engine-advanced-report-no = 否

engine-advanced-report-h-events = 4. 事件时间线

engine-advanced-report-events-caption = 时间窗以条形表示，点事件以圆点表示，使用本次运行自身的时间轴。

engine-advanced-report-th-start = 开始 (s)

engine-advanced-report-th-end = 结束 (s)

engine-advanced-report-th-event = 事件

engine-advanced-report-th-source = 来源

engine-advanced-report-point-event = 点事件

engine-advanced-report-events-timeline = 事件时间线

engine-advanced-report-point-events = 点事件（{ $n }）

engine-advanced-report-distribution-of = { $metric } 的分布

engine-advanced-report-max-bin = 最大区间 { $n }

engine-advanced-report-h-labels = 5. 验证标签

engine-advanced-report-th-capability = 能力（矩阵要求）

engine-advanced-report-th-label = 标签

engine-advanced-report-th-used-by = 使用方

engine-advanced-report-th-oracle = 来源：参考基准（oracle，独立参照）

engine-advanced-report-th-test-evidence = 测试证据

engine-advanced-report-h-figure-tiers = 结果所述的各数值等级

engine-advanced-report-th-figure = 数值

engine-advanced-report-th-tier = 等级

engine-advanced-report-th-matrix-requirement = 矩阵要求

engine-advanced-report-th-applicable = 是否适用

engine-advanced-report-no-attack = 否（未配置攻击）

engine-advanced-report-h-not-modelled = 6. 未建模内容与假设

engine-advanced-report-not-modelled-note = 每一项均引自其声明之处：结果文档、类型目录、场景文件，或验证矩阵中某一 MODELLED 行仍保持建模状态的理由。

engine-advanced-report-th-statement = 声明

engine-advanced-report-h-reproducibility = 7. 可复现性记录

engine-advanced-report-rk-command = 复现命令

engine-advanced-report-rk-working-directory = 工作目录

engine-advanced-report-rk-engine-version = 引擎版本

engine-advanced-report-rk-source-commit = 源码提交

engine-advanced-report-rk-scenario-file = 场景文件

engine-advanced-report-rk-scenario-sha = 场景文件 SHA-256（安全散列算法 256 位）

engine-advanced-report-rk-result-hash = 结果 scenario_hash

engine-advanced-report-rk-result-sha = 结果文档 SHA-256

engine-advanced-report-rk-seed = 随机种子（seed）

engine-advanced-report-rk-platform = 平台

engine-advanced-report-rk-generated = 研究生成时间（UTC）

engine-advanced-report-rk-determinism = 确定性

engine-advanced-report-result-hash-none = 结果文档未给出

engine-advanced-report-print-note = 如需将本页打印为便携式文档格式（PDF）文件，请使用浏览器的打印对话框并选择“另存为 PDF”；打印样式表适配 A4 和 US Letter 纸张，在各页重复表头，并使输入、结果、标签和可复现性各节从新的一页开始。引擎本身不写出 PDF。report.json 载有与本页相同的内容。

engine-advanced-report-footer = 由 Kshana { $engine } 生成。{ $stamp } 可由场景 + 随机种子（seed）+ 引擎版本复现。自由开源软件（GNU Affero 通用公共许可证，AGPL-3.0）— <a href="https://github.com/AshfordeOU/kshana">源码与文档</a>。

engine-advanced-report-empty-inputs = 场景除 `kind` 外未设置任何字段：该类型按其文档记载的默认值运行了参考配置。

engine-advanced-report-empty-scalars = 结果文档在数组之外不含标量；其数值按列汇总于下。

engine-advanced-report-empty-series = 结果文档不含数值数组：每个结果均为上表中的标量。

engine-advanced-report-empty-events = 无定时事件：场景未编排任何时间窗或起始时刻，结果也未报告任何事件。该类型将其配置作为单一情形进行评估。

engine-advanced-report-empty-not-modelled = 结果、类型目录、场景或所用矩阵行均未对本次运行声明任何建模限制。

engine-advanced-report-capabilities-statement = 每一行都是本次运行所涉各类型用到的一条验证矩阵行，带有矩阵为其给出的标签和参考基准（oracle，独立参照）（src/verification.rs，docs/VERIFICATION-MATRIX.md）。标签按矩阵的记录对能力评级；它不对本场景的配置评级，VALIDATED 行也不表示本次运行的输入为实测值。PARTNER 行是本次运行所依赖、但 Kshana 不提供的一项学科工作。

engine-advanced-report-no-run-label = 结果不含运行级如实标签；其所用能力的验证标签列于各自的小节，结果给出各数值等级之处亦列出这些等级。

engine-advanced-report-no-seed = 场景和结果均不含随机种子（seed）。结果仅由场景文件和引擎构建确定；确定性测试会重新运行每个随附场景，并要求输出逐字节相同。

engine-advanced-report-working-directory = 请在原始运行的启动目录中运行该命令：场景路径以及场景内的任何相对数据路径均相对于该目录解析。请先对照 scenario_sha256 核对场景文件。

engine-advanced-report-determinism-stamped = 相同的场景字节、随机种子（seed）和引擎构建给出相同的结果文档，但其 meta.generated_utc 时间戳除外，该时间戳由 --study-name 根据时钟写入；不使用 --study-name 运行可得到逐字节相同的输出。浮点结果按平台固定；其他操作系统或体系结构可能在末几位数字上有所不同。

engine-advanced-report-determinism-plain = 相同的场景字节、随机种子（seed）和引擎构建给出逐字节相同的结果文档和报告；本报告不含时间戳。浮点结果按平台固定；其他操作系统或体系结构可能在末几位数字上有所不同。

engine-advanced-report-not-applicable-no-attack = 不适用（未配置攻击）

engine-advanced-report-what-ran-default = 一个 `{ $kind }` 场景。

engine-advanced-report-nothing-carried = 无

engine-advanced-report-tbl-sweep-nodes = 扫描节点

engine-advanced-report-tbl-mc-summary = 蒙特卡罗分布摘要（百分位采用最近秩法；均值的 95% 置信区间为固定随机种子（seed）的百分位自助法）

engine-advanced-report-tbl-chain-phases = 链路阶段

engine-advanced-report-tbl-shared = 共享条件

engine-advanced-report-tbl-members = 成员

engine-advanced-report-tbl-combined = 各成员合并

engine-advanced-report-tbl-optimiser-best = 优化器最优解（所述边界内的局部最优）

engine-advanced-report-tbl-optimiser-trace = 优化器轨迹

engine-advanced-report-tbl-sweep-grid = 扫描网格

engine-altpnt-terrain-title-terrain-referenced = 地形参考导航（TERCOM/SITAN）

engine-altpnt-terrain-title-gravity-map = 重力图匹配导航

engine-altpnt-terrain-title-combined = 重力 + 磁 + 地形组合 alt-PNT

engine-altpnt-terrain-free-inertial-drift = 自由惯性漂移

engine-altpnt-terrain-terrain-matched = 地形匹配

engine-altpnt-terrain-gravity-matched = 重力匹配

engine-altpnt-terrain-gravity-only = 仅重力

engine-altpnt-terrain-magnetic-only = 仅磁

engine-altpnt-terrain-terrain-only = 仅地形

engine-altpnt-terrain-combined-fused = 组合（融合）

engine-api-chart-provenance-footer = Kshana v{ $version } · 场景 { $hash } · kshana.dev

engine-attack-surface-chart-title = 月面信号安全攻击面（P1）

engine-body-pnt-chart-relays-in-view = 可见中继

engine-body-pnt-chart-count = 数量

engine-body-pnt-chart-formal-one-sigma-position = 位置形式一倍标准差（log10 m）：蓝色仅星座，琥珀色含地球测距

engine-body-pnt-chart-time-since-epoch = 自历元起的时间，0 至 { $t_max } s

engine-campaign-chart-clock-time-error-vs-guard = 时钟钟差与保护限（ns）

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 与跟踪下限（dB-Hz）

engine-campaign-chart-protection-level-vs-alert-limit = 保护级与告警限（m）

engine-campaign-chart-position-error-vs-threshold = 位置误差与阈值（m）

engine-campaign-chart-satellites-tracking = 跟踪卫星数

engine-campaign-chart-alarm-flags-and-events = 告警标志与事件

engine-campaign-chart-mission-time = 任务时间 { $duration } s

engine-campaign-chart-sweep-line-at = { $name }（{ $unit }），在 { $lead }

engine-campaign-chart-monte-carlo-of = `{ $scenario_kind }` 的蒙特卡罗：{ $n_runs } 个随机种子（seed），自 { $base_seed } 起（第 5、第 50、第 95 百分位；条形 = 均值的自助法 95% 置信区间）

engine-campaign-chart-composed-members = 共享条件下的组合成员：{ $shared }

engine-campaign-chart-not-available = 不可用

engine-cislunar-arc-recovery-chart-title = 地月空间弧长恢复——不共享雅可比矩阵的估计器

engine-cislunar-arc-recovery-chart-subtitle = 有限差分批量最小二乘 · 实测状态恢复误差 · 无解析雅可比矩阵，无变分 STM，无 SVD 秩容差

engine-cislunar-arc-recovery-chart-bound = 界 { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = 格拉姆矩阵秩阈值

engine-cislunar-arc-recovery-chart-monte-carlo-rms = 蒙特卡罗 RMS 位置恢复误差（km）

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = 无噪声最差恢复比（最终误差 / 位移）

engine-cislunar-observability-chart-title = 跟踪弧段上的地月空间可观测性（P6）

engine-cislunar-observability-chart-subtitle = 秩与弧长（仅测距单链路） · 格拉姆矩阵特征谱 · 微分修正 DRO 初值 + SRIF 交叉验证 · { $modelled } 设计，{ $validated } 秩/STM/闭合

engine-cislunar-observability-chart-observable-rank = 可观测秩与弧长

engine-cislunar-observability-chart-arc-length = 弧长（旋转系时间单位，共 { $arc_hours } h）

engine-cislunar-observability-chart-gramian-eigenvalues = 格拉姆矩阵特征值（log10）

engine-cislunar-observability-chart-condition = 条件数 κ = { $condition }

engine-conflict-resilience-chart-title = 分层 PNT 冲突韧性（P7）

engine-conflict-resilience-chart-subtitle = 总丧失概率与威胁强度（蒙特卡罗与闭式解） · 韧性比与拒止相关性 · { $modelled } 先验，{ $validated } 蒙特卡罗->闭式解 / copula 边缘分布

engine-conflict-resilience-chart-total-loss-probability = 总丧失概率与强度

engine-conflict-resilience-chart-threat-intensity = 威胁强度

engine-conflict-resilience-chart-layered-mc = 分层蒙特卡罗

engine-conflict-resilience-chart-single-layer = 单层

engine-conflict-resilience-chart-resilience-ratio = 韧性比与拒止相关性

engine-conflict-resilience-chart-denial-correlation = 拒止相关性 ρ

engine-constellation-chart-availability-pct = 可用性（%）

engine-constellation-chart-mean-pdop = 平均 PDOP

engine-earth-gnss-lunar-chart-title = 月球距离处的地球 GNSS——C/N0 与偏离视轴角

engine-earth-gnss-lunar-chart-track-threshold = 跟踪 { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = 地球边缘 { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = 偏离视轴角（deg）

engine-earth-gnss-lunar-chart-legend = 金色 = 可跟踪 · 红色 = 过弱 · 灰色 = 被地球遮挡 · { $modelled } 发射方向图

engine-ensemble-chart-title = 时钟守时（holdover）：时间误差置信带（{ $n_runs } 次运行）

engine-ensemble-chart-timing-error-ns = 时间误差（ns）

engine-ensemble-chart-spec-threshold = 规范 { $threshold } ns

engine-ensemble-chart-time-s = 时间（s）

engine-ensemble-chart-classical-median-band = 经典：{ $id }（中位数，5-95% 带）

engine-ensemble-chart-quantum-median-band = 量子：{ $id }（中位数，5-95% 带）

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

engine-frame-eop-chart-title = 月球授时的实时坐标系 / EOP 预测预算

engine-frame-eop-chart-ut1-error-ms = UT1 误差（ms）

engine-frame-eop-chart-position-at-moon-m = 月球处位置（m）

engine-frame-eop-chart-equiv-timing-ns = 等效授时（ns）

engine-frame-eop-chart-prediction-horizon-days = 预测时限（天）

engine-frame-eop-chart-iers-final-floor = IERS 最终下限 { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = 月球处 ~{ $pos_m } m

engine-frame-eop-chart-growth = ~{ $factor }x，1 d→{ $far_days } d

engine-fusion-hybrid-ukf-chart-title = 17 状态混合 UKF——滤波器自洽性（已建模）

engine-fusion-hybrid-ukf-chart-subtitle = NEES + 新息白性与 95% χ² 带；{ $lit_1_0 } = 自洽。仅为自洽性，不代表精度。

engine-fusion-hybrid-ukf-chart-target = 目标 { $lit_1_0 }

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS（白性）

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENT

engine-fusion-pack-chart-title = 松耦合 GNSS/INS 水平误差

engine-fusion-pack-chart-horizontal-error-m = 水平误差（m）

engine-fusion-pack-chart-spec-threshold = 规范 { $threshold } m

engine-geometry-chart-title = 天空图（{ $label }）

engine-geometry-chart-north = 北

engine-geometry-chart-east = 东

engine-geometry-chart-south = 南

engine-geometry-chart-west = 西

engine-geometry-chart-satellite-tooltip = { $system } { $id } 方位角 { $az } 高度角 { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } 方位角 { $az } 高度角 { $el }（被天际线遮挡）

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } 方位角 { $az } 高度角 { $el }（低于遮蔽角）

engine-geometry-chart-no-fix = 无定位解

engine-geometry-chart-in-view-hidden = { $n_visible } 颗可见，{ $n_masked } 颗被天际线遮挡 · { $dop } · 空心：不可见

engine-geometry-chart-satellites-as-given = 按给定的卫星

engine-geometry-chart-representative-sky = 代表性天空，非特定日期

engine-geometry-chart-footer = Kshana v{ $version } · 所述误差模型下的几何 · kshana.dev

engine-gnss-sim-chart-title = RAIM 保护级与告警限

engine-gnss-sim-chart-protection-level-m = 保护级（m）

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-holdover-test-chart-title = 守时（holdover）测试：各步骤的钟差

engine-holdover-test-chart-y-title = |钟差|（ns）

engine-holdover-test-chart-panel-caption = 钟差绝对值；守时（holdover）步骤以阴影标出；虚线为钟差预算

engine-holdover-test-chart-gnss-removed = GNSS 已移除

engine-holdover-test-chart-gnss-restored = GNSS 已恢复

engine-holdover-test-chart-time-axis = 记录时间轴上的时间（{ $min } min）

engine-hybrid-chart-title = GNSS 中断期间混合 PNT 规格利用率（{ $lit_1_0 } = 规格）

engine-hybrid-chart-y-title = 规范利用率

engine-hybrid-chart-spec-line = 规格（{ $lit_1_0 }）

engine-hybrid-chart-classical-suite = 经典套件

engine-hybrid-chart-quantum-suite = 量子套件

engine-hybrid-integrity-chart-availability = 可用性

engine-hybrid-integrity-chart-precision = 精密度

engine-hybrid-integrity-chart-integrity = 完好性

engine-hybrid-integrity-chart-joint-indep = 联合（独立）

engine-hybrid-integrity-chart-joint-corr = 联合（相关）

engine-hybrid-integrity-chart-title = 光学 + 射频混合 PNT 联合品质因数

engine-hybrid-integrity-chart-subtitle = P(可用 AND 精密级 AND 完好性有保证)

engine-inertial-chart-title = GNSS 中断期间的航位推算位置误差

engine-inertial-chart-y-title = 位置误差（m）

engine-inertial-chart-spec-line = 规范 { $m } m

engine-inertial-chart-classical = 经典：{ $id }

engine-inertial-chart-quantum = 量子：{ $id }

engine-iq-campaign-report-roc-aria-label = 各监测器的检测 ROC

engine-iq-campaign-report-roc-x-title = P_fa（每个负样本窗口）

engine-iq-campaign-report-curve-aria-label = { $rec } 事件 { $ev } 的 C/N0 劣化与所述 J/S

engine-iq-campaign-report-curve-x-title = 所述 J/S（dB）

engine-iq-campaign-report-curve-y-title = C/N0 劣化（dB）

engine-iq-campaign-report-curve-model-tooltip = { $label }：SSC 参考，Q = { $q }

engine-iq-campaign-report-curve-model-legend = { $label } 参考（Q = { $q }）

engine-iq-campaign-report-curve-more-series = 另有 +{ $n } 个序列见评分表

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }：J/S { $x } dB，实测劣化 { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d }（实测）

engine-jamming-chart-title = 压制干扰（jamming）下的可见卫星数与跟踪卫星数

engine-jamming-chart-y-title = 卫星数

engine-jamming-chart-four-sv-fix = 4 SV 定位解

engine-jamming-chart-visible = 可见

engine-jamming-chart-tracking = 跟踪

engine-leo-fusion-ntn-chart-title = 5G NTN 定位：按带宽的克拉美-罗测距界

engine-leo-fusion-ntn-chart-caption = 测距一倍标准差（log10 m）：条形 = 遮蔽角至天顶的 C/N0；圆点 = RMS 3D 定位误差

engine-leo-fusion-ppp-chart-title = 带 LEO 增强的 PPP 收敛

engine-leo-fusion-ppp-chart-caption = 水平误差中位数（log10 m）与分钟数

engine-leo-fusion-ppp-chart-n-leo = { $n } 颗 LEO

engine-leo-fusion-pvt-kind-chart-doppler-caption = 3D 多普勒定位误差（log10 m）与窗口长度

engine-leo-fusion-pvt-kind-chart-doppler-x-label = 窗口（s）

engine-leo-fusion-pvt-kind-chart-joint-caption = PDOP 中位数（蓝）与 VDOP 中位数（琥珀），log10，与新增 LEO 卫星数

engine-leo-fusion-pvt-kind-chart-joint-x-label = 新增 LEO 卫星数

engine-leo-fusion-pvt-kind-chart-polar-caption = VDOP 中位数（log10）：灰色 GNSS，蓝色 LEO，琥珀色融合

engine-leo-fusion-pvt-kind-chart-polar-x-label = 纬度（deg）

engine-leo-fusion-pvt-kind-chart-timing-caption = 相对 UTC 的 RMS 钟差（log10 ns）与 C/N0 偏移，每个振荡器一条线

engine-leo-fusion-pvt-kind-chart-timing-x-label = C/N0 偏移（dB）

engine-leo-fusion-pvt-kind-chart-x-range = { $label }：{ $x0 } 至 { $x1 }

engine-leo-navmsg-chart-title = LEO 导航电文：SISRE 与拟合区间

engine-leo-navmsg-chart-no-trade-encode-decode = 本次运行无权衡；编码/解码表和预算表见 result.json。

engine-leo-navmsg-chart-no-fit-interval-trade = 本次运行无拟合区间权衡；见 result.json。

engine-leo-navmsg-chart-caption = 仅轨道 SISRE RMS（m，对数刻度）与拟合区间（s）

engine-leo-pass-chart-title = LEO 过境：各频段 C/N0 与多普勒

engine-leo-pass-chart-cn0-caption = C/N0（dB-Hz，20 至 80）：LEO 频段为彩色，GNSS 为灰色

engine-leo-pass-chart-time-axis = 自历元起的时间，0 至 { $s } s

engine-leo-pnt-chain-chart-subtitle = 信号设计 -> 过境 C/N0 与码抖动 -> 电文 SISRE -> 融合定位解 · { $label }

engine-leo-pnt-chain-chart-cn0-caption = 过境期间被跟踪分量的 C/N0（dB-Hz，20 至 80）

engine-leo-pnt-chain-chart-not-available = 不可用

engine-leo-signal-chart-title = LEO-PNT 信号设计

engine-leo-signal-chart-psd-axis = 发射带宽 ±{ $lit_0_6 } 倍范围内的偏移；低于各峰值 0 至 −50 dB

engine-leo-signal-chart-jitter-caption = 码抖动（m，对数刻度）与总 C/N0（dB-Hz）

engine-main-fail = 错误：{ $e }

## legal

# legal: native review
engine-legal-compliance-statement = 标记为“evidenced”的行表示，该集合中的某次运行为该行所列能力提供证据支持。这不是框架已被满足的结论，也不表示任何产品已被任何人评级或批准。差距列说明这些运行未能显示的内容。

# legal: native review
engine-legal-bench-surface-notice = 仅包含车辆运动和已标注的事件区间。此处导出的任何内容都不是射频或基带信号，不对此类信号建模，也不驱动此类信号；事件是一个时间区间，而不是产生干扰的方法。信号由实验室模拟器及其操作人员提供，操作人员负责仅在获准的地方运行（按模拟器自身的安全说明，采用传导或屏蔽方式）。Kshana不公布此类运行的任何结果。

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED：在所给记录上对每个监测器按窗口计算的ROC。每个所述事件窗口为正例，事件之外的每个roc_window_s窗口为负例；当监测器的检验统计量在窗口内达到某一阈值时，该窗口在该阈值下计数。P_fa按每个负例窗口计，而不是按每次检验计。

# legal: native review
engine-legal-lunanet-afs-advisory = 仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。它依据已发布规范的某一版本检查符号流，对任何LunaNet节点或服务不作任何说明。

# legal: native review
engine-legal-iqfit-statement = MODELLED：每个拟合数值描述的是开放接收机（所述环路设计和前端链路）在所给记录上的情况，并拟合到该活动的评分结果。它不是对任何其他接收机的测量。预测标记为PREDICTION，并附最近的已测试记录以及超出已测试条件的距离。

# legal: native review
engine-legal-iqfit-advisory = 仅供参考：分析输出，不是经型式认可的导航设备；预测是带有明示误差的模型输出，不是保证。

# legal: native review
engine-legal-lunar-time-lab-source-statement = 来源声明，而非主张：2024年6月ICG WG-B月球PNT材料（unoosa.org，LunarPNT_Jun24_01_04.pdf，研究来源S3）描述了站点处的月球时间基准实验室，其时间目标为纳秒级。Kshana引用该目标仅作背景说明，不予采纳，本块中的任何内容都不表明任何实际站点时钟达到了该目标。

# legal: native review
engine-legal-standards-pack-notice = 标准包依据运行前设定的判据衡量建模场景。它为所列框架行提供证据支持；它不对任何产品评级或批准，标记为MET的判据仅表示该场景的建模输出达到了所设判据。

# legal: native review
engine-legal-standards-pack-advisory = 仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务；不得作为任何导航或安全决策的唯一依据。

# legal: native review
engine-legal-geometry-statement = 在所述误差模型下的几何（MODELLED）：相对于所述天际线的视线可见性、精度因子（DOP）以及针对独立、等值、零均值高斯测距误差（所述用户等效测距误差）的高斯误差椭圆。它不是对接收机实际误差的预测，实际误差还包含偏差、多路径和非视线误差，它也不是完好性界限。预设星座是具有代表性的几何，而不是该日期该地点的天空。

# legal: native review
engine-legal-resilience-disclaimer = 基于仿真的自我评估，参照DHS RPCF v2.0。这不是认证或认可，也不代表任何机构（DHS、IEEE或其他）的批准。除非明确标记为VALIDATED，每个子评分均为MODELLED，评分是时间域和检测方面的性能指标，而不是位置域精度。

# legal: native review
engine-legal-observatory-notice = 劣化单元格表示当天该处有很高比例的航空器报告导航精度低。不归因于任何原因。未被观测或缺失的单元格未经评估，这与无问题不同。仅供参考：不是批准、认证或符合性声明。

# legal: native review
engine-legal-receiver-trust-advisory = 仅供参考的软件，不是经型式认可的导航设备（IEC 61108、IEC 61162）：船舶航行的责任仍由操作人员承担。

# legal: native review
engine-legal-evidence-roundtrip-notice = 通过哈希关联四项记录：场景、实验室声明的测试条件、接收机日志，以及该日志相对于所述事件的评分。它不是信号，不是回放方法，也不是认证。场景的运动如何到达接收机（经实验室模拟器回放的文件，采用传导或屏蔽方式）由操作人员负责，此处仅按所述记录。

# legal: native review
engine-legal-evidence-bundle-disclaimer = 本包是Kshana引擎依据所述接收机日志和所述配置计算结果的技术记录。它不是法律意见，不是关于任何事件或其原因的事实认定，也不是认证。

# legal: native review
engine-legal-bench-notice = 仅供参考：依据明示的参照进行建模或测量，不是批准、认证或符合性声明。评分描述的是日志或语料，绝非产品。

# legal: native review
engine-legal-osnma-advisory = 仅供参考：这是分析与监测输出，不是经型式认可的导航设备。此处报告的认证状态不是导航完好性服务，不得作为任何导航或安全决策的唯一依据。

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = `{ $scenario_kind }` 的扫描，遍历 { $axis_order }（{ $nodes } 个节点，基于 { $n_runs } 个随机种子的中位数及第 5 至第 95 百分位带；每条线使用各自的范围）

engine-holdover-test-holdover-not-recovered-within-record = 守时测试：守时（holdover）{ $hold } s，max|TE| { $max_abs } ns；{ $masks }；记录内未恢复（MODELLED，对照掩码测得）

engine-holdover-test-holdover-recovered-after-gnss-returned = 守时测试：守时（holdover）{ $hold } s，max|TE| { $max_abs } ns；{ $masks }；GNSS 恢复后 { $t } s 恢复（MODELLED，对照掩码测得）

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = 由 kshana iq scene 写入：SIMULATED 场景，而非记录；整数缩放：1 LSB = { $sc } 噪声归一化单位（每个分量的期望 RMS 为 { $v1 } LSB），{ $clipped } 个元素被截幅

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = 由 kshana iq scene 写入；整数缩放：1 LSB = { $sc } 噪声归一化单位（每个分量的期望 RMS 为 { $v1 } LSB），{ $clipped } 个元素被截幅

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = 已将 { $samples } 个样本（{ $format }，{ $fs_hz } Hz）写入 { $data_path }；{ $truth_records } 条真值记录写入 { $truth_path }；{ $meta_note }；信道：{ $chan_desc }；整数缩放：1 LSB = { $sc } 噪声归一化单位（每个分量的期望 RMS 为 { $v1 } LSB），{ $clipped } 个元素被截幅

engine-lunar-chart-title = 月球南极 HPL（可用性 { $availability }%，AL { $al } m，σ_URE { $sigma } m）

engine-lunar-beacon-chart-title = 地表信标增强：各配置的 PDOP

engine-lunar-beacon-chart-no-solution = 无解

engine-lunar-beacon-chart-footnote = 越低越好；单信标 sigma_URE { $sigma } m，截止角 { $mask } deg

engine-lunar-combination-chart-title = 月球联合定轨 + 时钟：测站3-D位置误差（VLBI 恢复可观测性）

engine-lunar-combination-chart-subtitle = { $n_sat } 颗卫星，{ $n_earth } 个地球测站 · 改善倍数 { $factor }×

engine-lunar-combination-chart-with-vlbi = 有 VLBI：{ $m } m

engine-lunar-combination-chart-range-only = 仅测距：{ $m } m

engine-lunar-combination-chart-axis-note = log10 测站误差 (m)；收敛情况 有/无 = { $with }/{ $without }

engine-lunar-dpnt-chart-title = 月球差分 PNT：{ $n_sats } 颗卫星，修正后误差与基线的关系（在 { $km } km 处降低 { $factor } 倍）

engine-lunar-dpnt-chart-subtitle = 未修正 { $uncorrected } m | 已修正 { $corrected } m | HPL { $hpl } m（σ_resid { $sigma } m）| { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = 未修正（独立定位）

engine-lunar-dpnt-chart-baseline-km = 基线 (km)

engine-lunar-dpnt-chart-err-m = 误差 (m)

engine-lunar-frame-realise-chart-title = 月球参考框架实现：7 参数 Helmert 恢复

engine-lunar-frame-realise-chart-subtitle = { $n_points } 个点 · RMS 残差 { $rms } m · 收敛 { $converged }

engine-lunar-frame-realise-chart-scale = 尺度 (ppb)

engine-lunar-frame-realise-chart-row = { $label }：注入 { $inj } { $unit } · 恢复 { $rec } { $unit } · 误差 { $err }

engine-lunar-interop-chart-title = 月球互操作性导出：CCSDS OEM + KIF（与 LunaNet/IOAG 对齐）

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | { $n_states } 个状态 | OEM { $oem_lines } 行

engine-lunar-interop-chart-artifacts = 产物：{ $list }

engine-lunar-interop-chart-conformance = 字段符合性：{ $verdict }（{ $present } 个存在，{ $missing } 个缺失，{ $data_lines } 行数据）

engine-lunar-interop-chart-roundtrip = OEM 往返：{ $oem } | 时间元数据往返：{ $time_metadata } | KIF { $kif_bytes } 字节

engine-lunar-interop-chart-footnote = 往返 / 字段符合性对照 CCSDS OEM 及已发布的 LunaNet/IOAG 字段语义。{ $label }：不是经认证的互操作性符合性测试；无任何机构背书。

engine-lunar-jamming-chart-title = 月球表面用户的各卫星 J/S 与仰角关系

engine-lunar-jamming-chart-x-title = 卫星仰角 (deg)

engine-lunar-jamming-chart-n-links = { $n_links } 条链路

engine-lunar-service-chart-title = 月球服务区：{ $n_sats } 颗卫星，{ $n_points } 个点 × { $n_epochs } 个历元：覆盖率 { $coverage }%（PDOP&lt;{ $threshold }）

engine-lunar-service-chart-subtitle = 卫星数 { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | 保护级可用性 { $pl_avail }%（AL { $al } m，σ_URE { $sigma } m）

engine-lunar-service-chart-pdop-min = PDOP 最小值 { $v }

engine-lunar-service-chart-pdop-mean = PDOP 平均值 { $v }

engine-lunar-service-chart-pdop-max = PDOP 最大值 { $v }

engine-lunar-station-chart-title = 月球参考站：南极区域第 p{ $percentile } 百分位修正后3-D误差（MODELLED）

engine-lunar-station-chart-threshold = 门限 { $thr } m（第 p{ $percentile } 百分位）

engine-lunar-station-chart-availability = 可用性 { $v } %

engine-lunar-station-chart-coverage = 覆盖率 { $v } %

engine-lunar-station-chart-corrected-3d = 修正后3-D { $f }

engine-lunar-station-chart-uncorrected-3d = 未修正3-D { $f }

engine-lunar-station-chart-legend-half = ≤ 门限的一半

engine-lunar-station-chart-legend-within = ≤ 门限

engine-lunar-station-chart-legend-twice = ≤ 门限的两倍

engine-lunar-station-chart-legend-above = 高于门限的两倍

engine-lunar-station-chart-station-note = ◆ 测站 · 虚线：覆盖率在 95 % 时保持的距离

engine-lunar-station-chart-disclaimer = MODELLED，基于所述假设；不代表任何真实系统；与任何机构无隶属关系，亦未获其背书。

engine-lunar-time-chart-title = 月球坐标时 LTC−TT（速率 { $rate } µs/day，范围 { $low }–{ $high }）

engine-lunar-time-chart-offset = 在 { $days } d 时为 { $offset } µs

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | 时钟 { $clock } | 7 项 x_Σ(τ)，覆盖 { $taus } 个 τ 点（{ $taus2 }–{ $taus3 } s）| 交叉点 τ { $crossover_tau_s } s（x { $crossover_x_s } s）| 框架下限 { $frame_term_s } s | 时钟 x(1 d) { $x_1day_ns } ns（MODELLED）| 时间实验室：{ $lab } { $lab2 } 至 LTC，x(1 d) { $lab3 } ns（MODELLED）

engine-lunar-vlbi-chart-title = 月球 VLBI 时延（基线 { $baseline } km，信标距离 { $range } km，近场 { $near_field } µs）

engine-lunar-vlbi-chart-footnote = 历元时延 { $delay } µs · { $hours } h 内 { $samples } 个样本

engine-mars-pnt-chart-formal-3sigma = 形式 3σ（协方差，不是经认证的保护级）

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = 位置牵引偏离：所报告的位置沿 { $dir } 偏离 { $final_offset_m } m，而接收机仍保持有效定位（虚假航迹的速度峰值为 { $pv } m/s，加速度峰值为 { $pa } m/s^2）；在此期间每颗被跟踪的卫星均显示 { $c } dB-Hz

engine-nmea-synth-log-position-drag-off-genuine-cn0 = 位置牵引偏离：所报告的位置沿 { $dir } 偏离 { $final_offset_m } m，而接收机仍保持有效定位（虚假航迹的速度峰值为 { $pv } m/s，加速度峰值为 { $pa } m/s^2）；保留真实的 C/N0 模式

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = 时间欺骗干扰：所报告的 UTC 偏离真值 { $offset_s } s；位置保持真实；在此期间每颗被跟踪的卫星均显示 { $c } dB-Hz

engine-nmea-synth-log-time-spoof-genuine-cn0 = 时间欺骗干扰：所报告的 UTC 偏离真值 { $offset_s } s；位置保持真实；保留真实的 C/N0 模式

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = 重放延迟（转发式欺骗干扰，meaconing）：位置{ $v1 }滞后于真值 { $delay_s } s；在此期间每颗被跟踪的卫星均显示 { $c } dB-Hz

engine-nmea-synth-log-replay-delay-genuine-cn0 = 重放延迟（转发式欺骗干扰，meaconing）：位置{ $v1 }滞后于真值 { $delay_s } s；保留真实的 C/N0 模式

engine-pvt-chart-3d-error-m = 3-D误差 (m)

engine-pvt-chart-postfit-rms-m = 拟合后 RMS (m)

engine-quantum-faults-chart-title = 量子异常检测 AUC（MODELLED）

engine-quantum-faults-chart-quantum = 量子

engine-quantum-faults-chart-classical = 经典

engine-quantum-nav-od-chart-title = quantum-gnss-free-nav（MODELLED）

engine-raim-stanford-chart-title = Stanford 图：完好性（{ $n_epochs } 个历元，AL = { $al } m）

engine-raim-chart-title = RAIM 保护级与可用性（可用性 { $availability }%）

engine-receiver-trust-chart-track-caption = 接收机报告的航迹，上为北

engine-receiver-trust-chart-start = 起点

engine-receiver-trust-chart-end-of-log = 日志结束

engine-receiver-trust-chart-no-positions = 日志中没有位置

engine-receiver-trust-chart-score-axis = 信任度，0 至 100

engine-receiver-trust-chart-legend-vessel = 信任：绿色为正常（信任度不低于 { $nominal }），琥珀色为降级（不低于 { $degraded }），红色为不可信，灰色为校准中

engine-receiver-trust-chart-legend = 信任：绿色为正常，琥珀色为降级，红色为不可信，灰色为校准中

engine-receiver-trust-chart-advisory = 仅供参考的软件，不是经型式认可的导航设备；责任仍由操作人员承担。

engine-receiver-trust-chart-cn0-axis = 平均 C/N0，dB-Hz

engine-report-chart-title = 时钟守时（holdover）：GNSS 中断期间的授时误差

engine-slot-timing-chart-aria = 预测的授时误差与距上次定位时间的关系，含时隙保护带

engine-slot-timing-chart-time-since-fix = 距定位时间，0 至 { $t }

engine-slot-timing-chart-predicted-error = 预测的授时误差 (ns)；虚线：保护带 { $guard } ns

engine-slot-timing-never = 从不

engine-solar-system-chart-title = 太阳系：J2000 黄道，俯视

engine-solar-system-chart-inner = 内太阳系（至火星）

engine-solar-system-chart-whole = 整个太阳系（至冥王星）

engine-solar-system-chart-legend = 绿色：已对照 JPL Horizons 达到 VALIDATED · 琥珀色：MODELLED · 卫星列于 result.json，附以母星为中心的轨迹

engine-spectrum-chart-title = L 波段频谱瀑布图

engine-spectrum-chart-multi-title = 多波段频谱瀑布图

engine-spectrum-chart-frequency-mhz = 频率 (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz)：标称（灰色）/ 最小值

engine-spectrum-chart-threshold = 门限 { $thr }

engine-spoof-chart-title = 时间欺骗干扰检测：偏移与时钟辅助检测界限

engine-spoof-chart-offset-ns = 欺骗偏移 (ns)

engine-spoof-chart-spoof-offset = 欺骗偏移

engine-spoof-chart-quantum-bound = 量子检测界限

engine-spoof-chart-classical-bound = 经典检测界限

engine-sweep-chart-title = { $metric } 与 { $parameter } 的关系（{ $scale } 刻度）

engine-sweep-nd-chart-title = `{ $kind }` 的 { $n_dims } 维扫描：{ $n_nodes } 个节点

engine-sweep-nd-chart-axes = 坐标轴：{ $axes }（形状 { $shape }）

engine-sweep-nd-chart-metrics = 指标：{ $metrics }：完整网格见 JSON

engine-sweep-nd-chart-line-title = `{ $kind }` 的扫描，遍历 { $key }

engine-sweep-nd-chart-y-title = 指标

engine-telecom-timing-max-te-ns-budget-never-exceeded = 电信授时：max|TE| { $max_abs } ns，历时 { $v2 } s；{ $masks }；{ $max_abs_te_ns } ns 预算从未超出（MODELLED）

engine-telecom-timing-max-te-ns-budget-exceeded-after = 电信授时：max|TE| { $max_abs } ns，历时 { $v2 } s；{ $masks }；{ $max_abs_te_ns } ns 预算在 { $t } s 后被超出（MODELLED）

engine-telecom-timing-chart-title = 电信授时：钟差、MTIE 与 TDEV

engine-telecom-timing-chart-y-title = |钟差| (ns)

engine-telecom-timing-chart-te-caption = 对照各预算的钟差绝对值

engine-telecom-timing-chart-holdover = 守时（holdover）

engine-telecom-timing-chart-time-record = 时间（{ $h } h 记录）

engine-telecom-timing-chart-mtie-caption = MTIE（实线），TDEV（虚线），首个 MTIE 掩码（灰色），ns

engine-timetransfer-chart-title = 时间传递同步误差（光学与射频对比）

engine-timetransfer-chart-y-title = 同步误差 (ps)

engine-timetransfer-chart-spec = 规格 { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = 测量时间 (s)

engine-timetransfer-chart-optical = 光学：{ $id }

engine-timetransfer-chain-chart-title = quantum-time-transfer（MODELLED）

engine-kind-clock-description = 时钟守时（holdover）与规格对比；可选蒙特卡罗集合（runs > 1）。

engine-kind-inertial-description = GNSS 中断期间的1-DOF惯性航位推算。

engine-kind-orbit-description = 由轨道星座（Walker / TLE / RINEX）得到的 GNSS 可用性 + DOP。

engine-kind-ephemeris-description = 星历与地面轨迹：传播一颗卫星（TLE→SGP4 或解析轨道），输出其 TEME/GCRS 状态（位置 + 速度）、ITRF/ECEF 位置、WGS-84 星下点纬度/经度/高度，以及每步的测站方位角/高度角/距离 + 距离变化率（多普勒）。卫星来自 `tle` 或带有 `epoch` 的解析 `orbit`（二者同时给出时以 `tle` 为准）；使用 `tle` 时，`epoch` 会覆盖 TLE 自身的历元并将其作为 t = 0。

engine-kind-integrity-description = 快照 / 解分离 / ARAIM RAIM，含 HPL/VPL 和 Stanford 图。

engine-kind-lunar-integrity-description = 月球南极 ARAIM 保护级遍历，对照具有代表性的 LunaNet 中继集。sigma_ure_m 体现空间信号测距精度（保护级随之线性缩放，因此扫描它即可回答告警限需要何种测距精度）。默认为历史上的 LNIS 级南极算例。

engine-kind-lunar-time-offset-description = 经建模的地月相对论时钟速率（月球坐标时，LTC/TCL）：由自引力势差和月球动能项得到的长期 LTC−TT 速率，连同已发布的 56–59 µs/day 范围，以及一段时间范围内累积的偏移。

engine-kind-lunar-vlbi-description = 经建模的月球大地测量 VLBI 时延观测量：一条地球基线（两个地面站，GCRS）观测来自 NovaMoon 级月面信标的单向信号。输出近场双距离差时延、其变化率，以及一次过境中的波前曲率近场修正，并在远场极限下与同一代码库的平面波 Δ-DOR 观测量交叉核对，偏导数经有限差分验证。默认的解析路径为 MODELLED，并带有框架一致性、xp=yp=0 极移以及平面波与近场对比的注意事项。设置 planetary_kernel_path、earth_orientation_kernel_path 和 moon_orientation_kernel_path 后则运行核路径（DE440、MOON_PA_DE440、ITRF93；收敛的质心光行时；增加该历元的信标和测站偏导数），其牛顿时延和偏导数与 NAIF SPICE 收敛光行时的一致程度达 { $lit_0_06 } ps 和 7.4e-9。未对照真实 VLBI 数据验证。

engine-kind-lunar-joint-od-clock-description = 经建模的联合多技术月球定轨 + 时钟批处理估计器，运行于 SIMULATED 网络：一次高斯-牛顿快照拟合，融合地球基线大地测量 VLBI 时延、月面局部测站↔卫星测距和星间测距，从注入的真值中共同恢复月面测站的3-D位置、一个小型星座的位置以及每个资产的时钟偏差。其核心的诚实结论是：在仅靠月面局部测距会留下一个弱可观测方向时，VLBI 使测站的完整3-D位置变得可观测；这一结论以有 VLBI 与无 VLBI 的测站误差对比形式给出。MODELLED 的模拟闭环恢复（真值与观测模型共用），确定性（带随机种子），NOT 经真实数据验证；求解器内部没有力模型传播；无 TRL/飞行传承/机构背书。

engine-kind-lunar-frame-realisation-description = 经建模的月球参考框架实现：一次 7 参数 Helmert（相似）基准拟合，包含 3 个平移、3 个小角度旋转和 1 个尺度，通过加权最小二乘（crate::batch_ls::gauss_newton）把一组估计的、由月面坐标导出的 MCMF 点坐标关联到基准，另有一个简单的取向关联，用来表示所实现的、绕 ICRF 轴的小旋转相对于 IAU 2015 WGCCRE 天体取向的值。该场景把已知的小变换（平移约数十 m，旋转约 µrad，尺度约 1e-7）注入一个分布良好的合成点网络，加入带随机种子的高斯噪声，恢复基准，并报告恢复的变换、各参数相对注入真值的恢复误差以及拟合后 RMS 残差。MODELLED 自洽性：恢复的是注入的相似变换（无噪声时接近机器精度），NOT 对照真实跟踪/VLBI 数据的实现；确定性（带随机种子）；无 TRL/飞行传承/机构背书。

engine-kind-moonlight-service-volume-description = 经建模的月球导航服务区分析，基于一个说明性的、来自公开资料的 Moonlight/LCNS 级月球轨道星座（与 ESA 无隶属关系）：在一个时间范围内扫描月面经纬度网格，报告 DOP / 覆盖率 / 可用性（≥4 颗卫星且 PDOP < 阈值），以及覆盖该区域的广义月球 ARAIM 保护级（HPL/VPL）包络。DOP 几何复用已对照 gnss_lib_py 达到 VALIDATED 的核（crate::orbit::dop）；保护级复用 LunaNet LNIS 月球 ARAIM 机制（crate::lunar，σ_URE≈30 m），并在特例下退化为现有的南极保护级。MODELLED 的组合：圆轨道/椭圆开普勒中继集（不是真实的差分修正 LCNS/NRHO 星历），平均自转的月球（无天平动/进动极）。确定性（纯几何）。无 TRL/飞行传承/机构背书。

engine-kind-lunar-differential-pnt-description = 经建模的月球差分 PNT（月球版 DGNSS/SBAS）：一个 NovaMoon 级参考站位于已知的月面位置，根据一个说明性的、来自公开资料的 Moonlight/LCNS 级星座计算各卫星的差分修正（NovaMoon 仅作为系统类别提及，与 ESA 无隶属关系），距离参考站 baseline_km 的用户应用这些修正，使共模的轨道 + 钟差相互抵消。钟差项精确抵消（代数恒等式）；轨道项仅留下视线差投影，该投影随基线 → 0 而 → 0（空间去相关下限），并随基线近似线性增长。报告用户有修正与无修正时的3-D位置误差、降低倍数、误差与基线的关系曲线，以及复用 DO-229E SBAS 机制（crate::sbas）并采用差分残差 σ 的用户保护级。MODELLED：精确抵消恒等式 + 一阶去相关模型；未经真实数据验证；无 TRL/飞行传承/机构背书。带随机种子时为确定性。

engine-kind-lunar-station-coverage-description = 经建模的月球参考站覆盖：对月球差分 PNT 模型在南极用户网格和一天历元上做蒙特卡罗扫描。位于已知南极站点的差分参考站修正一个给定的星座（说明性开普勒星座或表格化星历），给定空间信号误差、测量误差、修正延迟和链路量化；对每个点以及整个区域，报告修正后与未修正的位置误差百分位（3-D、水平、垂直）、可用性、对照给定阈值的覆盖率、DO-229E 保护级、每个方位角的覆盖半径，以及测站处和最差点处的修正链路预算。不代表任何真实系统的性能；与任何机构无隶属关系，亦未获其背书。MODELLED。

engine-kind-lunar-interop-export-description = 经建模的月球互操作性导出：以与 LunaNet/IOAG 对齐、基于 CCSDS 的交换格式输出月球参考框架、月球时标和月球星历，并附往返 / 字段符合性检查。复用本 crate 的 CCSDS OEM 2.0 生成器与解析器（crate::oem），为月球场景重新标注：OEM 的 REF_FRAME 采用 IAU 2015 WGCCRE 月球天体框架（MOON_ME / MOON_PA），TIME_SYSTEM 采用月球时标（LTC / TCL / UTC），CENTER_NAME = MOON，基于一份说明性的 LCNS 级星历样本（位置来自 crate::lunar_service，速度由有限差分得到）。同时输出与 LunaNet/IOAG 对齐的月球时间描述符（时标标识、来自 crate::lunar_time 的长期速率 µs/day、已发布范围、参考面），该描述符可经 serde_json 往返，并把这些产物封装进现有的 KIF 信封（crate::interchange），附 MODELLED 诚实标签。报告输出的产物、OEM 行数、字段符合性通过情况 + 存在/缺失字段列表、OEM 往返是否正常、时间元数据往返是否正常以及 KIF 字节数。MODELLED：确定性往返 + 对照已发布的 CCSDS OEM 及 LunaNet/IOAG 字段语义的字段名符合性是参考基准（oracle）；不是经认证的互操作性符合性测试；说明性的公开资料星历，与 ESA 无隶属关系；无 TRL/飞行传承/机构背书。

engine-kind-timetransfer-description = 光学与射频双向时间/频率传递对比。

engine-kind-quantum-anomaly-detect-description = MODELLED 的量子 PNT 系统故障/异常检测：带标签的故障目录（时钟频率跳变/漂移/失锁；传感器偏差阶跃/丢失）、检测统计量的 ROC AUC（附来自经外部验证的 eval_stats 的自助法置信区间）以及固定虚警率下的最小可检测故障，其中量子时钟辅助监测器（噪声更低）可检测更小的故障，并以如实的 TradeEvidence + 代表性给出。高斯检测统计量模型（AUC = Phi(mu/(sigma*sqrt2))）；仅对该类别建模，参数为说明性的公开资料，无 TRL/飞行/认证。

engine-kind-quantum-gnss-free-nav-description = MODELLED 的无 GNSS 量子导航：在 GNSS 中断期间，对量子（冷原子干涉仪）惯性预算与经典导航级 INS 进行比较，给出滑行期间的位置误差增长、达到位置门限的守时（holdover），以及量子与经典的权衡，并以如实的 TradeEvidence 加代表性给出。如实的可观测性说明：没有外部定位时加速度计偏差不可观测，因此误差会增长；量子传感器减缓但不能消除这一差距。说明性的公开资料器件参数；仅对该类别建模，无 TRL/飞行/认证。

engine-kind-quantum-time-transfer-description = MODELLED 的可信量子授时链：端到端的量子（光晶格钟 + 纠缠/单光子链路）与经典（CSAC + 射频双向）时间传递预算，复用的授时保护级 + 延迟/重放攻击安全性品质因数（1-P_md），时钟异常检测概率 + CUSUM 延迟，以及量子与经典的权衡，并以如实的 TradeEvidence 加代表性与飞行差距记录给出。说明性的公开资料器件/链路参数；仅对该类别建模，不主张任何 TRL/飞行/认证。

engine-kind-hybrid-description = 混合 PNT 综合场景：时钟 + IMU + 时间传递辅助。

engine-kind-fusion-description = 基于同一组混合输入的联合卡尔曼传感器融合 PNT。

engine-kind-hybrid-ukf-description = 17 状态混合量子 + 经典紧耦合 GNSS/INS UKF（MODELLED）：15 个 INS 误差状态 + 由 CAI 导出的加速度计偏差修正 + 来自 q 参数时钟引擎的 2 状态（相位 + 频率）时钟，由括号界定的 CAI 误差模型驱动。品质因数是滤波器自洽性（NEES + 新息白性对照 χ² 界限）：这是一个自洽性陈述，NOT 对真实世界精度的保证。仅为仿真；无 TRL>3，无飞行传承，无外部验证。

engine-kind-gnss-ins-description = 松耦合与紧耦合 GNSS/INS 误差状态 EKF。

engine-kind-gnss-sim-description = 测量域伪距仿真（Klobuchar 电离层，Saastamoinen/Niell 对流层）+ RAIM。

engine-kind-jamming-description = 链路预算压制干扰（jamming）：J/S → 有效 C/N₀ → 失锁。

engine-kind-spoof-description = 随机时间欺骗干扰检测器（Neyman–Pearson / χ²₁），含蒙特卡罗 P_fa/P_md。

engine-kind-spoof-detect-description = 射频/测量组合欺骗干扰检测器（多 SV RAIM 一致性 + AGC + SQM，融合）对照参数化攻击（功率优势、载波相位对齐、时间/位置牵引；TEXBAT 风格）。

engine-kind-sweep-description = 对某个时钟包参数的1-D 权衡研究扫描。

engine-kind-sweep-nd-description = 通过点分隔的 TOML 键 / JSON 指标路径对任意包进行的通用 N 维扫描。

engine-kind-gravity-map-description = GPS 拒止下的重力图匹配导航：冷原子重力仪根据所飞越的重力异常序列恢复恒定的 INS 漂移。

engine-kind-terrain-nav-description = GPS 拒止下的地形参考导航（TERCOM/SITAN）：雷达/气压高度计将地面高程剖面与 SRTM 风格的 DEM 匹配，以恢复 INS 漂移。

engine-kind-terrain-slam-description = GPS 拒止下的序贯（递归）地形参考导航：粒子滤波器逐历元运行地形匹配测量模型（SITAN 作为运行中的滤波器），从而沿航迹跟踪随时间变化的 INS 漂移，而批处理地形导航只能恢复单一的恒定偏移。

engine-kind-combined-altpnt-description = GPS 拒止下的重力 + 磁 + 地形组合导航器：每个航路点融合三个标量场通道，得到比任何单一场更锐利（CRLB 更低）的漂移定位。

engine-kind-pvt-description = 真实观测的单点定位：根据 RINEX 3 观测文件和广播导航文件（码伪距、广播星历、Klobuchar 电离层、Saastamoinen/Niell 对流层）求解接收机位置，并可对照已测量的坐标进行验证。

engine-kind-mars-pnt-description = 深空火星 PNT：一个仿真的 MARCONI 中继星座（静止于火星的中继星 + 倾斜轨道中继星，广播单向信号，并向深空测站转发双向信号）通过联合单向/双向无线电测量融合估计器，为一个参考用户（transfer | lmo | surface）导航。报告每个历元的几何/可见性、相对真值取得的 RMS，以及形式协方差（1σ / 3σ 位置）：这是如实的仿真品质因数，NOT 经认证的保护级。

engine-kind-impairment-eval-description = AI/ML 射频损伤检测评估试验台（13494）：生成带标签、参数有依据的 SYNTHETIC 语料（标称/压制干扰/时间欺骗干扰/位置欺骗干扰/多路径），用与检测器无关的测试框架对检测器（energy|agc|sqm|parity|fused）评分，并报告 AUC/ROC/混淆矩阵 + 目标 Pfa 下的各类别 Pd，以及分布内与分布外的乐观差距。仅为 MODELLED 的工作特性：绝不是现场/IQ 数据，不给出好坏结论。

engine-kind-quantum-trade-description = 量子与经典 PNT 的权衡（13503）：候选时钟（实测 ADEV 曲线，即可辩护性的关键；或某个量子时钟类别）相对经典基线类别的授时守时 + 惯性守时收益，附在产物上的长 tau 下限假设注意事项，以及 GNSS 拒止下的韧性与时间包络。MODELLED；量化（而绝不验证）合作方器件。候选时钟是一条实测曲线（`candidate_adev_taus` + `candidate_adev_values`，长度相等，至少 2 个点；两种形式同时给出时以它为准）或一个 `candidate_clock_class`。

engine-kind-space-weather-description = 空间天气环境模型：太阳（F10.7/F10.7a）和地磁（Kp，附定义性的 Kp↔ap 表）活动指数，由其驱动的 Jacchia-1971 外逸层温度（已对照已发布的太阳极小/平均/极大值验证），以及在一组高度上、按日平均外逸层温度计算的 Jacchia-1971 热层中性密度与无活动静态剖面的对比：即静态大气所忽略的密度随太阳周变化的依赖关系。MODELLED：该密度在太阳极大期与由加速度计导出的密度（TOLEOS CHAMP 和 GRACE）相符，误差在 2 倍以内，但在 2008 年太阳极小期约偏高 { $lit_1_7 } 倍。

engine-kind-oem-interop-description = CCSDS OEM 互操作桥：导入由外部飞行动力学工具（GMAT/Orekit/STK 均输出 OEM）生成的轨道星历消息，并报告其分段/对象/框架/历元跨度以及速度一致性检查；没有输入时，则对生成的参考轨道做往返，并报告导入↔导出的保真度。MODELLED 的结构/物理导入检查，NOT 对源数据轨道精度的验证。

engine-kind-launch-window-description = 二体发射与上升几何：发射方位角（sin Az = cos i / cos lat）、可达的最小倾角、圆轨道速度、地球自转的向东增益、目标倾角低于发射场纬度时的折线平面变轨 Δv，以及每日发射机会的数量。MODELLED 的球形地球几何（无旋转地球速度三角形修正，无上升/阻力损失模型）。

engine-kind-reentry-description = Allen-Eggers 弹道再入走廊：峰值减速度（与弹道系数无关，V_e^2 sin|γ|/(2eH)）、峰值过载时的速度和高度，以及峰值加热速度，针对穿过指数大气的再入速度/飞行路径角/弹道系数；另有同一弹道再入的平面质点积分，计入重力、地球曲率和 1976 年美国标准大气（峰值减速度、速度、高度以及峰值时刻的时间）。MODELLED 的弹道（无升力）再入；加热输出是峰值加热速度，而不是热流密度（无气动热/TPS 模型）。

engine-kind-eo-coverage-description = 对地观测载荷足迹与覆盖几何（SMAD 空间三角形）：对给定的轨道高度、倾角（默认太阳同步）和传感器 FOV/IFOV，给出地球角半径、幅宽、星下点地面采样距离、最大离轴观测范围、圆轨道周期、J2 节点周期以及赤道地面轨迹间距，并带连续覆盖标志。MODELLED 的球形地球几何（无辐射测量/MTF/大气/抖动/耀光）；节点间距为 R_e·(ω − Ω̇)·T_nodal，采用一阶 J2 长期速率。

engine-kind-space-packet-description = CCSDS 133.0-B 空间包协议封装：对合成的 TM/TC 包流编码（6 字节主头 + 数据字段），并报告每个包的头解码、总字节数以及精确的编码↔解码往返。确定性的精确位布局封装：即机构包格式的互操作层；NOT 符合性认证（除标志位外，无副头/CRC/分段逻辑）。

engine-kind-attitude-budget-description = 3 自由度姿态与指向误差预算：最坏情况的重力梯度干扰力矩（(3/2)(μ/R³)ΔI），以及对已命名的 1σ 贡献项（传感器噪声、反作用轮抖动、热、对准）的方和根指向误差预算，并给出主导项，针对某个轨道高度 + 本体惯量差。MODELLED 的标量 AOCS 预算：Basilisk/42 的硬件前补充，不是控制回路/6 自由度/柔性模态仿真。

engine-kind-passes-description = 地面站过境预测：圆轨道（以窗口起始时刻的 SGP4 平均根数表示）在某一窗口内、高于高度截止角的测站上的时域可见过境（AOS/TCA/LOS、最大视仰角、持续时间），以及总接入时间。SGP4/SDP4 传播基于 IAU 2006/2000A 地固框架（可选 UT1 - UTC 和极移），ITU-R P.834-9 对流层折射和下行链路光行时（二者默认开启），过境穿越时刻解算至 1e-7 s，最高点用黄金分割搜索确定。过境几何在海平面测站上已对照 Orekit 13.1.8 达到 VALIDATED；场景的轨道和测站是说明性输入。

engine-kind-link-budget-description = 基于 CCSDS 401 / DSN 810-005 链路方程的单向链路预算：针对发射 EIRP、接收 G/T、距离、数据速率和频段（s|x|ka），对照所需的 Eb/N₀，给出自由空间路径损耗、C/N₀、Eb/N₀、余量和链路闭合情况。基于所给输入的确定性工程计算（不是经校准的终端数据手册）。

engine-kind-lunar-time-budget-description = MODELLED 的端到端协调月球时（LTC）时间误差预算：把七个 LTC 误差项在整个平均时间网格上组装为时间误差曲线 x_i(τ)，按方和根合成 x_Σ(τ)，并给出时钟与框架的交叉 τ，即不断增长的时钟项在此处超过恒定的实时框架实现项（低于它时预算受框架限制，高于它时受时钟限制）：这是对单一 τ 产物的如实回答。τ 斜率为闭式，可解析验证（时钟 τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }，下限 τ^0，测量 τ^{ "{" }-1/2{ "}" }），时钟各行复现已发布的一天时钟规格（crate::clock_specs）；射频/光链路、框架实现、相对论残差和星历下限的量值是 Modelled 预算分配（有文档的默认值，调用方可覆盖），不是测量值。其贡献在于可复现的交叉 τ，而不是经认证的逐项数值；不是经认证的可用于运行授时的产品。

engine-kind-hybrid-optical-rf-description = MODELLED 的异构光学 + 射频 PNT 联合品质因数（P5）：组合 1550 nm 双向光链路预算（光子受限的双向测距 CRLB σ_τ/√N 以及衍射足迹 λ/D·距离）、跨模态解分离 RAIM 保护级（位置与授时），它融合协方差各异的松耦合射频解与紧耦合光学解、N 站光学晴空可用性（独立并集 1−Π(1−a_i) 以及空间相关变体）、光学↔射频状态/协方差交接（均值经证明按位连续，即无跳变，并带 NEES χ² 一致性门），以及含相关性处理的联合 P(可用 AND 精密级 AND 完好性有保证) 得分。VALIDATED 的闭式：测距 CRLB、衍射足迹、χ² 保护级分位数、并集组合计数、交接均值连续性 + NEES 门，以及联合独立乘积。MODELLED：光学损耗分配、射频/光学 σ 量值、云气候输入、相关性和 P_HMI 预算。不是经认证的可用性/完好性产品。

engine-kind-cislunar-observability-description = MODELLED 的平面地月空间星座可观测性（P6）：跟踪一个由四颗航天器组成的差分修正平面 DRO 星座，使用星间测距，并报告该弧段使航天器四状态 [x,y,ẋ,ẏ] 中有多少可观测。输出（1）单条纯测距链路的秩与弧长表：瞬时秩为 1，随弧段延长而增长至完整的四状态（P6 表 1）；（2）该弧段上的可观测性格拉姆矩阵特征谱 + 条件数；（3）纯测距与测距 + 距离变化率的瞬时秩对比（多普勒设计杠杆），以及纯测距奇异 / 测距 + 变化率有定义的 GDOP 报告；（4）独立的 SRIF 交叉验证，其后验协方差恰好在可观测秩达到四的弧段处变为有限且良态。VALIDATED 的核心：可观测秩是揭示秩的奇异值阈值，并与格拉姆矩阵特征秩交叉核对；特征谱服从谱不变量（trace=Σλ，det=Πλ，Frobenius²=Σλ²）；变分 STM 是经有限差分验证的 CR3BP STM；测距/距离变化率的雅可比各行是经有限差分验证的解析偏导数（并与本 crate 的3-D 距离变化率观测量交叉核对）；四个初始条件是差分修正的平面 DRO，收敛到很紧的周期性残差且为逆行；秩的跃迁对照本 crate 的平方根信息滤波器做了交叉验证（后验协方差恰好在满秩时有限，cond(P)=cond(OᵀO)）；秩亏的快照被标记为 GDOP 无定义（fim condition=inf），绝不给出虚假的有限值：这与 pvt::solve_spp 采用的奇异几何保护相同。MODELLED：星座设计（DRO 近月点幅度和相位）及其产生的具体秩进展。不是经认证的导航性能产品。

engine-kind-conflict-resilience-description = MODELLED 的分层 PNT 冲突韧性（P7）：处于对抗环境中的用户部署若干 PNT 层（开放服务 GNSS、宽带 GNSS、经鉴权的星座、增强中继），各层具有基础可用性、1σ 精度，以及对共享压制干扰/欺骗干扰威胁的各攻击向量脆弱性。一次按强度扫描、带随机种子的蒙特卡罗，以概率 clamp(vulnerability·intensity·vector_weight,0,1) 使各层失效，用闭式逆方差规则 σ_fused=(Σ 1/σ_i²)^(−1/2) 融合幸存层，并报告总丢失概率（所有层均失效）、融合误差中位数，以及各层随强度变化的可用/失效统计。核心的韧性比（单层与分层的总丢失概率之比）在独立性假设下约为 7x；随后的单因子高斯 copula 相关失效扫描显示，随着失效相关性上升，该约 7x 会塌缩趋近于 1（相关性使分层失去作用）。先验敏感性部分通过 mcda 龙卷风图 + Dirichlet 威胁投入再分配 + 百分位置信区间，在有出处的脆弱性先验范围内考察该核心结果。VALIDATED 的核心：蒙特卡罗总丢失概率收敛到闭式独立乘积 Π_i p_deny_i（在固定随机种子且 N 很大时落在蒙特卡罗标准误差之内）；逆方差融合是闭式恒等式；ρ=0 时 copula 退化为独立模型，且任何 ρ 都保持各层的边际失效率。MODELLED：各层的脆弱性/可用性/精度量值是有出处但属 Modelled 的输入（JammerTest 2024、TEXBAT、EASA SIB、RTCA DO-229、LunaNet/IOAG，见 conflict_threat_params），具体的约 7x 量值以及比值随相关性变化的曲线形状均由该参数化得出。其后第 4.2 节的各向量存活分解把共享射频威胁拆分为四个命名向量（压制干扰/欺骗干扰/动能/网络），并报告每个向量的可用 PNT 平缓退化曲线 S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1)))，VALIDATED：带随机种子的各层蒙特卡罗收敛到该闭式；对相关射频基线而言，压制干扰是最尖锐的向量，而不受射频影响的惯性层是决定性的幸存者。不是经认证的导航可用性产品。

engine-kind-lunar-attack-surface-description = 月面导航信号安全攻击面（P1）：把公开的信号安全分析组合成一次可由二进制程序运行的分析。报告（1）AFS 接收功率及其相对地面 GPS 参考的功率盈余，以及 12-18 dB 敏感性范围，作为对链路输入（参考电平 x EIRP x 斜距）的真正多轴扫描，并给出 25x 取整 / 28x 未取整线性因子的核对。已修订（规则 R4）：此前报告的是 { $lit_15_6 } dB 功率不足和 32x/36x 因子，直至把 GPS 参考从 -125 / -{ $lit_128_5 }（这是 dBm 数值）更正为 -155 / -{ $lit_158_5 } dBW，即干扰模块一直沿用的 ICD-GPS-200 数值。符号随之反转：经建模的月球 AFS 信号比地面 GPS L1 C/A 强 { $lit_14_4 } dB，而不是更弱。接收功率本身一位都没有变，线性因子是旧值除以恰好 1000，这恰好是 dBm 到 dBW 的 30 dB 偏移；（2）在每个对峙距离上欺骗（J/S = 3 dB）和压制（J/S = 30 dB）所需的攻击者发射功率，即 J/S 链路的逆；（3）在真实均匀孔径天线方向图（Airy [2 J1(x)/x]^2）下的轨道捕获足迹，这是一个受高度限制的次半球帽，其边缘 NOT 被捕获；（4）计算得到的跟踪环欺骗捕获牵入结果（在给定功率优势和码偏移下，匹配码的欺骗者是否真的能牵引 DLL/PLL），而不是断言的 3 dB 门限；（5）抬高的地表发射机在无大气天体上的几何地平线覆盖范围；以及（6）OSNMA/TESLA 认证预算（20 bit/s 开销 = 50 bit/s AFS 导航电文的约 40 %，密钥披露延迟，2^-40 伪造概率）。空请求体可复现 P1 基线；所有输入均有默认值且可覆盖。VALIDATED 的子结果带有其来源模块的参考基准（闭式 dB 辐射测量；逆 J/S 往返；Airy 方向图对照 A&S 贝塞尔函数和球冠几何；DLL/PLL 牵入对照 Kaplan & Hegarty；球面切线地平线恒等式对照 eo_payload；OSNMA SIS-ICD 字段尺寸）。MODELLED：具有代表性的几何/功率量值以及具体的捕获图单元格数值。不是经认证的安全产品。

engine-kind-realtime-frame-eop-description = 实时月球框架 / 地球定向预测预算：P4 表 1（框架误差一致性检查：事后处理的约 { $lit_0_27 } m ↔ 约 { $lit_0_010 } ms，实时的约 15 m ↔ 约 { $lit_0_5 } ms，每个框架位置都通过 L19 杠杆臂 Δr = D_EM·ω⊕·ΔUT1 表示为等效的 UT1 误差）和表 2（实测的 UT1 预测误差与预测时长的关系：L18 曲线直接取自真实的 IERS finals2000A 序列，即 Bulletin A − Bulletin B 的最终下限和多日持续性预测器误差，每项都经 L19 映射为月球框架位置），另有 L21 方和根实时框架误差预算（EOP + 星历 + 实现下限）。VALIDATED 的闭式（L19 杠杆臂，ω⊕ 与 CIO 地球自转角交叉核对）和 VALIDATED 的真实数据（取自真实 finals2000A 各行的 L18 曲线）；MODELLED 的是月球中继定轨协方差量值和框架实现下限（具有代表性的分配）以及持续性预测器（不是 IERS 的运行 Bulletin A 算法）。不是经认证的实时框架产品。

engine-kind-aperture-duty-cycle-description = 孔径占空比：接触计划对一组可转向孔径所隐含的导航与通信时间分配。接受一份接触计划（`[[contacts]]` 的 aos_s/los_s 窗口列表，每个窗口请求导航或通信，与 `passes` 预测器输出的 aos_s/los_s 词汇相同）、孔径数量和一项仲裁策略（默认导航优先，或通信优先，或非抢占式先到先服务），并报告导航占空比、通信占空比、空闲占空比以及各会话中断，即某会话请求了但没有孔径提供服务的接触时间。对窗口边界做精确的区间扫描，因此相接的窗口不会争用，且没有任何孔径秒被重复计数；导航、通信和空闲孔径秒独立累计，并与 apertures*horizon_s 闭合。报告给出已解析的策略、其完整定义，以及占空比和中断的定义，因为不附仲裁策略的占空比数字不可复现。MODELLED 的调度算术：孔径切换服务或会话时不计转向 / 重调谐 / 切换时间，决策中不涉及数据量、缓冲状态、能量预算或链路闭合，且接触窗口是输入，其几何取决于生成它们的来源。不是地面段调度产品。

engine-kind-lunar-jamming-description = 月球本地射频压制干扰（jamming）：针对月面用户，在月面（或抬高的）干扰机作用下，基于说明性的、来自公开资料的 Moonlight/LCNS 级月球轨道星座，给出各卫星的干信比、有效 C/N₀ 和失锁。组合现有的开放压制干扰物理（jamming::j_over_s_db、effective_cn0_dbhz、rx_antenna_gain_db、lock_status、q_factor）与现有的月球天空几何（lunar_service::LunarConstellation + topocentric、lunar::selenographic_to_mcmf）；不重新推导任何几何或辐射测量。与地球 `jamming` 类别不同，信号一侧 NOT 是固定的接收功率：每颗卫星的各向同性接收功率是它自己的链路预算 EIRP − FSPL(斜距)，因此 J/S 随月球距离和仰角逐卫星变化。每个可见的（历元，卫星）链路报告一行：方位角、仰角、斜距、构成 J/S 之差的两个接收功率、J/S、标称和有效 C/N₀ 以及锁定状态；并在该表旁（绝不取代它）给出汇总品质因数，以及同样内容的 CSV 产物。每个输出的数值字段都带有单位和出处类别。VALIDATED 的子结果带有其来源模块的参考基准（Kaplan & Hegarty §9.4 的抗干扰方程和 J/S 链路，在 tests/gnss_denied_jamming_resilience_reference.rs 中经外部引用；lunar_service 的月球几何）。该组合本身与独立的双链路预算路径（linkbudget::received_signal_power_dbw，采用不同的自由空间损耗表达式）交叉核对，一致到 1e-9 dB。MODELLED：说明性的星座、具有代表性的 EIRP / 干扰机功率 / 天线增益 / 噪声温度，以及不含地形遮蔽、多路径、AGC 动态和自适应调零。不是经认证的拒止服务产品。配置了干扰机时，报告还附带带不确定性带的拒止轮廓，而不是由单一标量得到的轮廓：即逐卫星表上完整的实测有用信号 C/N₀ 分布（n、min、p05、p25、median、p75、p95、max、mean、样本标准差，以及样本自身的不对称性），以及在每个顺序统计量处、按引擎认可的两种拒止判据计算的轮廓：既有的功率比判据（J/S = 30 dB，如在 attack-surface 和 tracking-loop 中）和失锁判据（有效 C/N₀ 降至 tracking_threshold_dbhz，即本报告自身状态列所用的判据）；并且在拒止平面的两个轴上（场景对峙距离处所需的干扰机 EIRP，场景 EIRP 下的拒止对峙距离）。带的边缘就是 contour(p05) 和 contour(p95)，即对样本自身分位数应用的同一个闭式映射：不是拟合到样本的 sigma，也不是 median ± k·stdev，stdev 为保持连续性而输出，但不被任何东西使用。已等于或低于跟踪门限的分位数不存在有限的拒止 J/S，其失锁列为 null 并附计数的原因，绝不使用被截断的半径。

engine-kind-ins-trn-coast-description = INS/TRN 滑行误差模型：位置误差随滑行时长的变化，由 IMU 系数构建，而不是按假设的漂移率扫描。五项增长贡献：加速度计偏差、经重力产生的陀螺偏差倾斜、速度随机游走、角度随机游走，以及随行进距离变化的比例因子；每一项都通过一个九状态局部水平惯性误差模型传播，该模型在给定纬度和高度处带 Schuler 反馈（旁边同时报告短滑行的主导阶定律 t²、t³、t^1.5、t^2.5 以及 t¹/t²），并按一条所述规则合成（默认为方和根，或线性求和，或确定性求和并对随机项取方和根；三种方式在每次运行中都会计算，使选择可见而不被掩盖）。达到调用方给定位置阈值（默认 10 m 和 50 m）的滑行时长由引擎现有的二分法定位，每个都附带指出主导来源的逐项贡献分解，并且每个单项贡献的穿越点还会经代数反解，使两者一致。地形相对导航模式以周期性位置修正约束滑行，并报告能保持各阈值的最大修正间隔；仅位置的修正会使速度误差和倾斜在修正前后仍然存在，因此并非在任何修正速率下都能约束滑行，报告会如实说明而不是返回零。MODELLED：IMU 类别系数是具有代表性的区间数值，不是数据手册值，且地形修正残差是输入。未达到的阈值报告为 null 并附状态，绝不报告为零。不是经认证的惯性导航性能产品。

engine-kind-lunar-vlbi-fim-description = 月球 VLBI 测站坐标协方差：把 lunar-vlbi 观测量的时延偏导数在明确的计划（基线 x 历元）上累积成费希尔信息矩阵，求逆，并报告为测站坐标协方差和各坐标的测站 sigma：这是计算得到的引擎输出，而不是把标量时延精度通过假设的各向同性 g = 3 均分因子推算出来。状态携带地固（ITRS）测站坐标，因此雅可比是按各历元 GCRS->ITRS 矩阵旋转后的惯性偏导数：地球自转使这些坐标可观测，且报告测量地固视线扫过范围和信标赤纬，而不是假定它们。一次观测是两站都高于高度截止角的一个（基线，历元）对，权重为 1/delay_sigma_s^2。每次运行都报告秩、基准亏秩、条件数、完整的信息谱、协方差矩阵、各测站各轴和 3-D sigma，以及自由网零空间；秩亏时，核心 sigma 以 NULL 并附状态发布，绝不从近奇异的逆中读出。针对同一计划的均分值 c*delay_sigma_s*sqrt(g/N) 与计算值及比值一并输出，同时给出各向同性迹界 sqrt(p/trace(M))，AM-HM 使它成为硬下限，所以该比值就是该假设所丢弃的各向异性。时延闭合 tau_ik = tau_ij + tau_jk 使 n(n-1)/2 条基线中只有 n-1 条在几何上独立；报告同时给出两个计数。MODELLED：月心星历、测站时钟、对流层和地球定向参数保持固定，且观测被视为相互独立，因此该协方差是针对缩减参数集的克拉美-罗界，而不是对某次观测时段结果的预测；时延 sigma、测站坐标和计划是输入。几何时延雅可比所略去的偏导数（差分 Shapiro 项）通过有限差分测量并输出。不是大地测量产品。

engine-kind-tracking-loop-description = 跟踪环失锁：C/N0 -> 锁定/失锁（含滞回）、失锁所需时间，以及作为码和载波偏移速率函数的欺骗干扰牵入。引擎现有的拒止和捕获判据是对接收功率的比值（压制干扰机在 J/S = 30 dB 时拒止，欺骗者在 3 dB 时捕获）；真实的失锁不是功率比，而是环路抖动加动态应力使其超出跟踪门限预算之处。报告：（1）载波（Costas）和码（非相干超前/滞后）的 1 sigma 热噪声抖动随 C/N0 的变化，含平方损耗，对照所述规则 3*sigma_PLL + theta_e <= 45 deg（三 sigma 形式的 15 度规则）和 3*sigma_DLL + ramp lag <= d/2 码片；（2）失锁和重新锁定的 C/N0 门限，并指出起约束作用的环路，重新锁定门限由接收机重新牵入时采用的更宽带宽推导而来，而不是断言，因此滞回宽度必须落在 5*log10(ratio) 与 10*log10(ratio) dB 之间；（3）由两门限锁定检测器在 C/N0 斜坡驱动下、带确认驻留得到的声明失锁时间，与物理相位逃逸时间（Viterbi 周跳平均间隔，因跨越数百个数量级而以 log10 s 表示）分别报告；（4）欺骗干扰牵入极限：受害接收机环路能够跟随的最大码滑动和载波多普勒速率，附覆盖两个轴的图，因为滑动得比这更快的欺骗者并没有捕获环路，而是把它甩在了后面；以及（5）环路动态所隐含的拒止半径，与现有的功率比半径并列报告而绝不取代它，二者的带符号之差作为独立命名字段（denial_radius_delta_km）并附定义。每个输出的数值字段都带有单位和出处类别。VALIDATED 的闭式：载波和码抖动表达式、环路滤波器化简 sqrt(2*B_n*T) 和一阶斜坡滞后，已与引擎自身的 sdr 相关器在带随机种子的合成 IF 上逐步推进的结果交叉核对（这是通向同一数值的另一条路径），分别一致到 { $lit_0_6 } %、{ $lit_3_7 } % 和 { $lit_0_17 } %，周跳时间背后的修正贝塞尔函数 I0 对照标准表值一致到 1e-7。有效性下限是被断言的，而不仅是陈述：在 1 ms 下低于约 32 dB-Hz 时，真实的 atan 鉴别器相对其 +-pi/2 范围饱和，所测抖动比任何线性理论都小。MODELLED：环路带宽、积分时间、相关器间距、牵入带宽比、确认驻留、干扰机功率和天线增益是具有代表性的区间数值，不是数据手册值。未建模：振荡器（阿伦偏差）和振动抖动、前端带宽限制、多路径、AGC 动态、数据比特跳变损耗、外部辅助，以及对 Costas 周跳公式的任何半周修正。在环路动态下，欺骗捕获根本没有半径，起约束作用的是偏移速率而不是功率，因此该字段为 null 并附原因，而不是捏造一个数。不是经认证的接收机性能产品。

engine-kind-araim-reference-check-description = 已发布的 ARAIM 认证参考向量：把引擎的 ARAIM 水平和垂直保护级，对照 WG-C ARAIM 技术分组自己的数值算例运行，容差（TOL_PL = 5e-2 m）取这些文件自身所述的值。两个向量作为固定样例提交，每个都带有其获取 URL、获取日期、源文件 SHA-256 和页码：参考机载算法描述文件 v3.1（2019）附录 D，自洽，并且是验收向量；以及 Milestone 3 报告（2016）附录 A 的 A.IX 节，即研究文献所引用的陈述。每个已发布的输入（10 颗卫星、2 个星座的几何矩阵、C_int 和 C_acc 方差对角线、b_nom、P_sat、P_const 和 LPV-200 常数集）以及每个已发布的输出（VPL、HPL、EMT、sigma_v_acc、K_fa_3，以及两个星座故障模式的 sigma_3、sigma_ss_3 和 b_3）都与引擎自己的数值及其绝对差一并报告。保护级方程在此 NOT 被重新求解：参考文件的模式列表被交给引擎现有的 raim::araim_protection_level / araim_integrity_risk，因此被测试的二分法和高斯尾部代数就是引擎自己的；只有几何、子解、检测门限和已发布的预算划分是为其构建的。针对 2019 向量的外部核对：VPL 为 { $lit_18_2926 } m，已发布为 { $lit_18_3 } m；HPL 为 { $lit_13_4063 } m，已发布为 { $lit_13_45 } m；EMT 为 { $lit_7_2997 } m，已发布为 { $lit_7_2998 } m；sigma_v_acc 为 { $lit_1_3694 } m，已发布为 { $lit_1_3694 } m；并且全部六个已发布的中间量均在其最后一位印刷小数的半个单位以内。2016 向量带有两处内部缺陷，报告予以陈述而不是掩盖：G 第 3 行的符号笔误，以及 K_fa_3 是按 57 个故障模式计算的，而文件却声明 N_fault_max = 1（12 个模式）；因此它的几何中间量精确复现，而它的保护级被报告为实测差异，并排除在验收数字之外；容差绝不放宽来容纳它们。每个输出的数值字段都带有单位和出处类别，抄录的数字被标记为 `published`，使其绝不会被误认为计算值。范围：仅实现了 N_fault_max = 1（单卫星和单星座故障模式），先验要求同时发生多事件故障子集的情形会被 REFUSED，而不是被悄悄截断；参考算法的故障检测、排除、卡方一致性检验和重复计数的重新分配步骤不在范围内。这是复现某个已发布参考算法的算例，不是认证、适航产物或批准。

engine-kind-lunar-frame-campaign-description = 七参数 Helmert（相似）框架基准，由一次模拟观测活动而不是由注入的变换驱动。一个地球测站网络按明确的计划观测一份月面信标星表；月球 VLBI 时延偏导数在该计划上累积成信标坐标费希尔信息矩阵，方式与 lunar-vlbi-fim 完全相同；该信息再经星表点处的 Helmert 设计 A = [I3 | [p]_x | p] 传播为基准协方差 H = A^T M_b A，并由 crate::fim::crlb 诊断。没有注入任何变换，也没有从预设答案中恢复任何东西，因此所报告的基准精度源自观测方案：时延 sigma 减半，则精度恰好减半；弧段延长则精度改善，因为报告所测量的天平动（sub_earth_direction_sweep_deg）正是把沿视线的信标坐标与天球面内的坐标区分开来的因素。秩、基准亏秩、条件数、完整谱、七参数基底中的不可观测方向、即使满秩时最弱的方向及各参数在其中所占份额，每次运行都会输出；活动未能约束的参数以 NULL 并附状态发布，绝不从近奇异的逆中读出。信标误差相关性是测量得到的，而不是假定的：测站保持固定时，没有观测会涉及两个信标，因此信息矩阵恰好是块对角的（offblock_fraction 为 0）；测站被估计时，经 Schur 边缘化的块是耦合的，所诱导的相关性会被打印出来，并且把相关性舍去后重新运行整个传播，使独立性假设的代价成为一个数。在各向同性的每坐标 sigma 下的同一传播，以及 lunar-frame-realisation 场景所报告的恢复误差，都在此运行，并与活动数值及其比值一并打印。MODELLED：信标星表有出处，但活动是模拟的：测站网络和时延 sigma 是说明性输入，各时延观测被视为相互独立，月心星历、测站时钟、对流层和地球定向参数保持固定，因此基准协方差是针对缩减参数集的克拉美-罗界。不是大地测量产品。

engine-kind-lunar-llr-datum-description = 七参数 Helmert 月球框架基准，由一次真实的、已归档的观测活动而不是模拟活动驱动。lunar-frame-campaign 去掉了注入的变换，但仍把其测站网络、计划和逐观测 sigma 作为说明性输入给出；而此类别把这三者都取自测量：历元是已归档的 ILRS 综合激光测距数据归一化点的地面发射时刻，观测是向月球上五个后向反射器阵列真实发射的激光测距，每个观测权重都是该归一化点自身已归档、从文件读出的精度 bin_rms/sqrt(n_raw)。测站坐标来自 IERS ITRF2020 SLR 解（按其已发布速度推算到历元），反射器坐标来自 JPL DE430 表 7，处于 IAU 2015 WGCCRE 模型所实现的平均地球/平均自转框架中。测距偏导数累积成联合的反射器坐标费希尔信息矩阵，并经同一个 Helmert 设计传播为基准协方差，由 crate::fim::crlb 诊断。秩、亏秩、条件数、谱、七参数基底中的不可观测方向、满秩时最弱的方向及各参数在其中所占份额，每次运行都会输出，未被约束的参数以 NULL 并附状态发布。阵列间相关性被测得恰好为零而不是假定，因为一次激光测距只涉及一个阵列。星表无法定位的记录（例如没有已发布 ITRF 位置的测站）被跳过并计数，绝不给予替代坐标。哪些环节是测量的、哪些是 MODELLED 的，这是报告本身，而不是脚注：月心星历和 IAU 天体取向仍是建模的，其合并大小作为所用每个点的观测减计算单向距离残差输出；对流层、固体潮、测站偏心、极移、UT1-UTC、相对论延迟和测站时钟均未计入，而且在该残差之内。由于星历误差只通过各条视线的方向影响协方差，每次运行还会把全部偏导数按 sensitivity_tilt_deg（符号交替）倾斜后重新求解整个基准并输出比值，因此协方差对建模星历的不敏感性是一个数，而不是一个论证。模拟活动自身的数字被运行并与测量数字一并打印，而不是抄录。MODELLED：七参数数值是针对真实计划上缩减参数集的克拉美-罗界，不是已求解的基准，不是 LLR 分析，也不是大地测量产品。已提交的真实数据切片随仓库提供，但不随已发布的 crate 提供；请把 data_dir 指向它的一份副本。

engine-kind-lunar-beacon-description = 对月球轨道导航服务的地表信标增强，以可运行的前后对比表给出。南极用户在天空的一小块区域内看到稀疏的轨道星集，因此测距几何病态；少量经测量的地表信标提供全部位于头顶的星集所缺少的低高度角、宽方位角视线行，水平精度因子随之骤降。该场景报告同一历元下的三种配置：仅卫星、卫星加可见信标，以及更大的星座（作为达到同一几何的另一条途径）；每种配置都给出其可见源数量、完整的 DOP，以及通过乘以每信标用户等效测距误差得到的以 METRES（米）计的实现 1 sigma 精度，该误差由时钟同步、多路径和测量项按方和根组合而成。信标可见性是无大气月球的两高度几何地平线（没有大气，因此界限是精确的），DOP 组装是同一个核，已在 tests/dop_reference.rs 中与 gnss_lib_py 交叉核对。此类别存在的原因：其背后的模块自 L08/L09 起就在引擎中，并已对照独立的 DOP 路径核对，但从运行中无法触及：没有类别、没有分派分支、没有随附文件。README 宣传了该能力，而验证矩阵对它完全没有对应行，因此它在引擎中不可触及的同时，在行文中被声称、在台账（ledger）中却未被声称。默认值是已带有提交的黄金参考的几何（位于 -80 deg、天线高 2 m 的用户，位于 -80/0、-79/+60 和 -79/-60、高 2 km 的三个信标，t=0 时的六颗卫星说明性 LCNS 快照，5 deg 截止角），因此空运行复现的是已有参考基准覆盖的表，而不是凭空给出新数字。MODELLED：星座设计、信标布设和每个误差预算量值都是说明性输入，不是已部署的测量或实测链路；只有 DOP 算术、地平线闭式和 sigma = DOP x sigma_URE 关系有外部锚定。不是服务性能承诺。

engine-kind-earth-gnss-lunar-description = 月球距离处的地球 GNSS 接收，即冲突韧性论文所指出、而引擎此前没有模型的弱信号层。GNSS 卫星把天线指向地球；月球附近的接收机位于约十五倍轨道半径之外，因此三件事同时起作用。地球遮挡了视轴：从 26,560 km 处看，它张开 { $lit_13_9 } deg 的半角，因此任何射向月球的射线都必须离开发射机的星下点至少这么远，这在计算任何功率之前就去掉了波束峰值。剩下的是主瓣边缘和旁瓣，即 LuGRE 载荷在 2025 年实际工作的区域。并且自由空间损耗在 L1 处约为 208 dB，比地面用户约多 25 dB。报告每颗卫星输出一行（离轴角、地球遮挡、距离、路径损耗、该角度处的发射增益、接收功率、载噪密度比），并只汇总越过跟踪门限的链路。它还报告条件情况，因为这正是定义该层的东西：从月球看，每颗可见卫星都位于几度宽的锥内，因此视线几乎平行，精度因子极大，月球距离处的地球 GNSS 定位更多是授时级观测，而不是定位级观测。MODELLED，而发射方向图正是原因：该角度处的增益是均匀圆孔径（Airy），而真实的 GPS L1 天线是十二单元螺旋阵列，具有赋形主瓣和非 Airy 旁瓣。实测方向图存在，但此处未收录，因此排序和量级是有意义的，而单颗卫星的 dB 值没有意义。有意不含的各项，每一项都会使预算偏乐观：掠过地球边缘的射线没有电离层或对流层损耗，没有极化、指向或实现损耗，并且是没有折射延伸的球形地球。月球位置是输入（距离加惯性方向），而不是星历查询，因为被测试的量是链路和波束几何。把这一行升级为 Validated 需要实测发射方向图和 LuGRE 归一化点；二者都不在仓库中，也都没有在此捏造。

engine-kind-lunar-infrastructure-description = MODELLED 的研究，把月球的轨道和表面作为导航与大地测量基础设施，五项研究合用一个类别，由 `study` 选择：od-consistency（NRHO 或 ELFO 中的星上地球 GNSS 定轨，对照独立的地面无线电测量定轨，以带随机种子的蒙特卡罗中各自的协方差来判断）、carrier-phase（月面与轨道器联合的双差载波相位及用 LAMBDA 做的整周模糊度解算）、frame-coestimation（在地球测站测距基础上加入月面测站和轨道器，用于七参数月球框架基准）、space-tie（同一航天器上的 GNSS、VLBI 和激光测距，框架联结精度对照局部联结误差）以及 geodesy-sensitivity（来自激光测距、轨道器跟踪、月面重力仪和月面时钟的月球勒夫数 h2、k2、l2 和物理天平动的费希尔信息）。采用带有所述简化的限制性三体模型；数值经独立程序核对，没有任何东西与月球量的测量值作比较。

engine-kind-cislunar-arc-recovery-description = MODELLED 的地月空间弧长可观测性阈值独立估计器检验。该阈值是在由解析测距雅可比各行和解析变分状态转移矩阵组装的可观测性矩阵上读取的秩，而其平方根信息滤波器交叉核对折叠的正是同样的行：这是两台数值机器之间的一致性检查，而不是佐证。此类别提供了缺失的裁决者：一个批最小二乘估计器，它根据仿真测量实际恢复主星的初始状态，测量偏导数取自复合正向模型的中心有限差分。它不调用任何解析雅可比行、变分 STM、奇异值或特征分解、秩容差和平方根信息滤波器，tests/cislunar_arc_recovery_reference.rs 中的源文本守卫使这一点可被强制检验；而动力学（同样的 RK4 CR3BP 流）、初始条件（同样的差分修正星座）、标量观测量和历元网格是有意共用的，并在输出的 `independence` 块中命名，因为对同一物理问题的两种分析必须在物理上一致才能比较。两个判据，各自在其自身界限的五个数量级范围内扫描：无噪声恢复（每个带随机种子的试验的最终状态误差至多为 recovery_factor 乘以其先验位移，即秩的类比，其中没有奇异值容差）和蒙特卡罗可估计性（带随机种子的噪声集合上测得的 RMS 位置误差低于所述界限，即可估计性的类比，是测得而非预测的）。支持平面四状态和空间六状态、DRO / L2 晕轨道 / L2 NRHO 族、测距和距离变化率观测量，以及以月球为中心的极坐标参数化，其中变换施加于状态，并在那里对正向模型重新做差分。在已发布的平面 DRO 网格上的实测：估计器从 { $lit_0_782609 } h 起即可恢复四状态，而秩判据为 { $lit_2_086957 } h（rel_tol 为 1e-6，比值 { $lit_0_375 }）：该秩阈值未得到证实，不能作为可恢复性边界；而实测的可估计性边界与形式边界落在同一个网格单元，为 { $lit_5_739130 } h，并且实测误差曲线在 21 个弧长上复现形式 1 sigma，几何平均比值为 { $lit_0_98 }。MODELLED：星座设计、历元网格、单条被跟踪链路、位移量值、测量 sigma 和两个所述界限。不是经认证的导航性能产品。

engine-kind-telecom-timing-description = 电信授时：GNSS 守时（holdover）的钟差、最大时间间隔误差（MTIE）和时间偏差（TDEV），对照 ITU-T 掩码检查，每个掩码给出 PASS 或 FAIL 及余量。输入是合成守时（一个振荡器预设：ocxo、rubidium、caesium 或 csac，各自带有某份已命名的公开 Microchip 数据手册中的稳定度、老化和温度数值；外加 GNSS 丢失时间、记录长度和采样间隔；自由运行的时钟带有白噪声、闪烁噪声，以及在数据手册拟合需要时的随机游走频率噪声、线性老化和正弦温度项），或内联给出的 [time_s, time_error_ns] 对构成的摄入序列（仅在原生构建中，还可使用 CSV 文件）。掩码：ITU-T G.8272（07/2025）PRTC-A 和 PRTC-B（max|TE| 100 / 40 ns，MTIE 表 1-2，TDEV 表 3-4）；G.8272.1（2024）Amd. 1（07/2025）ePRTC 锁定（30 ns，表 1-2）和 ePRTC-A 守时（表 3 的钟差包络，在由锁定时长设定的守时期 H 内从 30 ns 升至 100 ns，MTIE 表 4，TDEV 表 5）；G.8273.2（2023）Amd. 2（11/2025）T-BC/T-TSC 的 A-C 类（max|TE|、恒定钟差、经低通滤波的 MTIE 和 TDEV）以及 D 类（max|TE_L| 5 ns，这是 D 类中唯一没有留待进一步研究的数字）；G.8271.1（2022）Amd. 3（05/2025）参考点 C（max|TE_L| 1100 / 600 / 100 ns，MTIE 表 7-1 至 7-3）。建议书中标记为留待进一步研究的每一项都不予填补，每份报告都列出未实现的内容。同时报告超出每个最大钟差预算的时间（默认：100 ns ePRTC max|TE_HO|、400 ns 网络守时分配、1100 ns 参考点 C、{ $lit_1_5 } us 4 类）、附每个掩码限值的 CSV 表格形式的 MTIE/TDEV 曲线，以及每个数值字段的单位与出处条目。VALIDATED：MTIE 和 TDEV 估计器在已提交的守时序列上对照 allantools 软件包。MODELLED：掩码表是抄录，合成守时是由数据手册最大值构建的模型，而不是对任何设备的测量。不是符合性测试。

engine-kind-slot-timing-description = 时隙授时：自由运行时钟离开按时间索引的路由或任务时隙的保护带（该时隙所容许的最大绝对钟差）所需的秒数，在该时刻每一项的贡献并指出主导项（定位不确定度、白相位噪声、白噪声、闪烁噪声、随机游走与随机漂移频率噪声、残余频率偏差、温度、老化），距上次定位的剩余时间，以及扣除定位延迟后使时钟保持在其内的最大定位间隔。振荡器是类别默认值（csac、uso、dsac、tcxo、ocxo 或 rafs：一个有出处的一秒阿伦偏差和一个假定的红噪声下限）、电信授时的数据手册预设，或内联数据手册（作为包络拟合的阿伦偏差最大值，加上老化和温度系数），或内联实测相位记录（其重叠阿伦偏差在白相位和 IEEE Std 1139 调频基底上做加权最小二乘拟合，因此红噪声下限是测得的而不是假定的）。超出数据手册或记录所支持的最长平均时间的越界会被标记为外推。可选的欺骗干扰部分增加轨道接收机的授时保护级：轨道速度和周期、单个地面欺骗者每次过境能够触及卫星的时长、时钟辅助监测下限和 CUSUM 检测延迟、条件界限、欺骗者以所述最大斜坡速率在卫星离开其触及范围或独立检查运行之前累积的牵引，以及每次地面接触或星间链路检查是否独立于该欺骗者。VALIDATED：由拟合记录得到的守时反演，在对照氢原子钟测量的真实铯钟上做了保留检验（tests/slot_timing_cs5071a_holdout.rs，受数据门控）；在实测晶体振荡器上，保留预测偏保守但未达到判据，因此晶体情形为 MODELLED。MODELLED：类别和数据手册来源、确定性项以及欺骗干扰评估。

engine-kind-spectrum-description = L 波段频谱模型与瀑布图：把整个 GNSS L 波段表示为一张功率谱密度（PSD），横向为频率，纵向为时间，覆盖一条脚本化的干扰机时间线。信号：GPS L1 C/A 和 L2C（BPSK(1)）、Galileo E1 开放服务（MBOC(6,1,1/11)，或 BOC(1,1)）、GPS L5 和 Galileo E5a（BPSK(10)），各在其载波上，除非被覆盖，否则取接口规范规定的最小接收功率（IS-GPS-200、IS-GPS-705、Galileo OS SIS ICD）；GLONASS、北斗和 Galileo E6 未建模。干扰机：连续波单音、平坦窄带噪声、线性锯齿线性调频，以及与某个频段自身调制匹配的宽带噪声，各自带有中心频率、带宽、接收功率（直接给定，或通过压制干扰（jamming）类别的自由空间路径损耗由 EIRP 和距离得到）以及开/关时间。每个干扰机按其在接收机带宽上的频谱分离系数 kappa 对每个频段评分，并有 (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1；对于单个干扰机，这等于压制干扰类别在 Q = 1/(R_c kappa) 时的抗干扰方程，报告附有这一交叉核对（以及它旁边压制干扰类别的代表性 Q 值）。噪声底为 k T_sys，其中 T_sys = T_ant + 290 K (F - 1)。瀑布图在每个单元格的频率箱及其所在行上取平均（线性调频精确处理，整段扫描加上不完整的一段；干扰机在行中途按占空比切换），因此 C/N0 时间线和图像出自同一批数字；result.json 携带按功率块平均的网格、每行每个频段的 C/N0 和 J/S，以及每个干扰机在每个频段上的 SSC、Q、J/S、带内 J/S 和稳态 C/N0。可选的 [iq]：该模型在某一时刻绘制为复 IQ，写入 SigMF 记录（cf32_le 或 ci16_le）再读回，并与 Welch 估计比较。可选的 [recording]（原生构建）：真实 SigMF 记录的 Welch PSD 与模型并列。VALIDATED：信号 PSD 对照教科书中的主瓣宽度（BPSK(n) 零点到零点为 2n x { $lit_1_023 } MHz；BOC(1,1) 的瓣中心位于 +/-{ $lit_1_023 } MHz），频谱分离系数对照其 Parseval 闭式以及 Kaplan & Hegarty 的 Q = 1（CW）和 { $lit_1_5 }（匹配）。MODELLED：干扰机功率、时间线、前端带宽、连续谱（无码线）处理，以及不含 AGC、消隐和天线方向图。

engine-kind-solar-system-description = 某一历元的整个太阳系，用于围绕任何天体的 PNT（定位、导航与授时）。对太阳、八大行星、冥王星、月球、火卫一、火卫二、木卫一、木卫二、木卫三、木卫四和土卫六，报告 ICRF（国际天球参考框架，赤道 J2000）中的日心位置和速度、日心距离及 J2000 黄道经纬度、引力参数、赤道半径和平均半径、有发布时的 J2 及其参考半径、恒星自转周期、该历元的 IAU 极轴和本初子午线、一圈公转上采样的轨道轨迹（行星为日心，卫星为以母星为中心），以及自观测天体（默认地球）起的光行时、单向和双向距离、太阳 Shapiro 延迟和太阳分离角；额外的 from/to 链路也同样处理。位置：Standish 和 Williams 的 JPL 开普勒根数（公元 1800 年至公元 2050 年用表 1，公元前 3000 年至公元 3000 年用表 2a/2b）并附每颗行星的标称误差，地月分离采用 Montenbruck & Gill 月球级数，火星卫星和伽利略卫星采用 JPL 平均根数并配 IAU 同步自转速率，土卫六采用 IAU 自转模型。光行时：无线电测量不动点求解，发射机取其推迟位置；牛顿式，Shapiro 延迟单独报告。对照 JPL Horizons（DE441）在两倍标称误差内达到 VALIDATED：水星到土星以及来自表 1 的地球（最差为标称值的 { $lit_1_87 } 倍），以及来自表 2a/2b 的全部八大行星（最差 { $lit_1_71 } 倍），还有地球到火星和木星的光行时。MODELLED，逐行标注：来自表 1 的天王星和海王星（对照 DE441 分别为标称误差的 { $lit_2_0 } 倍和 { $lit_5_2 } 倍），冥王星（1992 年那一行；没有所述误差），月球和七颗卫星（对照 Horizons 测量，无已发布界限）。

engine-kind-body-pnt-description = 围绕任何太阳系天体的定位：轨道器或着陆器围绕按名称选择的中心天体（火星、月球、木卫二、木卫三、土卫六以及太阳系星表中的其余天体），利用围绕该天体的小型 Walker 导航星座（带该天体自身 J2 长期漂移的二体轨道，用户时钟未知）的单向伪距，以及可选的、来自地球的无时钟深空双向距离（其方向和距离在每个历元由解析太阳系星历给出）进行导航。视线被该天体的平均球面遮挡，表面用户还需要高度截止角。每个历元：可见的中继星、地球是否在地平线之上、仅星座的 GDOP 和 PDOP（几何与位置精度因子）、有与无地球行时的形式一 sigma 位置不确定度，以及两种方式下带随机种子的高斯-牛顿最小二乘定位的误差；整个运行期间：可用性、地球可见性、PDOP 中位数、RMS 误差和形式 sigma 中位数，以及该历元的地球到该天体的光行时、往返、Shapiro 延迟和太阳分离角。MODELLED：中继轨道、噪声水平和瞬时测量模型是建模选择，没有对照任务导航数据验证；天体常数是 body.rs 中所引用的已发布值，地球几何沿用太阳系星历的标签。

engine-kind-constellation-design-description = 规模化的星座设计：采用 i: T/P/F 约定的 Walker DELTA 和 Walker STAR 模式（节点分布在 360 或 180 deg 上，面内间隔 360*P/T，面间相位偏移 360*F/T）、显式根数列表和多壳层设计、一次运行中的多个星座，围绕地球、月球、火星或任何其他行星、冥王星或主要卫星，使用 body 模块中的常数（太阳系和 body-pnt 类别所用的同一批）。来自已发布标称根数的预设：gps-baseline 和 gps-expandable（GPS 标准定位服务性能标准第 5 版 2020 年表 3.2-1 至 3.2-3 的 24 个槽位和六个前/后可扩展对）、galileo（Walker 24/3/1，29 599.801 km，56 deg，Galileo 开放服务服务定义文件第 1.1 期表 1 和表 23）、beidou 和 beidou-meo（Walker 24/3/1，21 528 km，55 deg，外加位于东经 80、{ $lit_110_5 } 和 140 deg 的三颗地球静止卫星以及 55 deg 的三颗倾斜地球同步卫星，北斗开放服务性能标准 3.0 第 4.1 节；MEO 相位和东经 118 deg 的倾斜地球同步穿越是建模的，因为标准没有给出它们）以及 glonass（19 100 km，{ $lit_64_8 } deg 的 24/3/1，来自 GLONASS 接口控制文件第 5.1 版第 5.2 节的槽位公式）。覆盖与精度因子：在纬度/经度网格和带高度截止角的采样窗口上，给出每个单元格的可见卫星数、GDOP、PDOP、HDOP 和 VDOP，每个单元格的可用性（PDOP 不高于阈值的定位，默认 6），全球（按面积加权）和最差站点处的可用性，除非 clock = "common"，否则每个星座使用一个接收机时钟。它可扩展到数千颗卫星：可见性是对每颗卫星覆盖半角的点积，卫星在每个历元按星下点纬度分带，使网格行只测试可能在视野中的卫星；报告会统计节省的配对测试数。JSON 携带网格图和降采样的每颗卫星地面轨迹。VALIDATED：Walker 生成器对照 Galileo OS SDD 表 23 和 GLONASS ICD 槽位公式，GPS 预设对照 SPS PS 表 3.2-1 中已发布的赤道穿越列，GPS 基线全球 HDOP 分布对照 SPS PS 附录 B（中位数 { $lit_0_94 }，95% 为 { $lit_1_25 }，平均 { $lit_0_96 }，容差 { $lit_0_03 }）。MODELLED：带可选长期 J2 的二体轨道、球形天体、仅几何可见性（无信号功率、健康状态或地形），以及不同系统之间的相对相位，它不是任何真实日期的快照。

engine-kind-campaign-description = 测评活动：把现有场景类别组合为一次运行，所有数字都读自该命名类别的一次真实运行。四个部分，可任意组合。阶段（PHASES）：共享同一时间线的串联任务，每个阶段运行一个或多个场景（例如压制干扰，然后欺骗干扰，然后时钟守时（holdover）并伴随惯性导航系统滑行，然后完好性告警，然后恢复），其输出由各类别预设或显式结果路径读入命名通道（时钟钟差对其保护带、载噪密度比对跟踪下限、保护级对告警限、位置误差、跟踪卫星数、告警标志），并通过零阶保持重采样到公共网格，附阶段边界和事件；状态通过 carry（通道从上一阶段的结束值继续）、handoff（上一阶段的某个数写入本阶段的场景）和 end_at（阶段在某次运行算出的时间结束，例如欺骗干扰监测器的检测时间）传递。扫描（SWEEP）：对任意类别的一到三个点分隔场景键的网格（整数段索引表数组，如 system.2.sisre_m），指标按结果路径读取，运行次数大于一时，每个节点上有带随机种子的蒙特卡罗集合。MONTE_CARLO：第 k 个实现以 base_seed + k 运行；每个指标报告平均值、标准差、最近秩法的第 5/50/95 百分位，以及对均值的固定种子自助法 95% 置信区间。COMPOSE：若干场景共享取值（一个干扰机的功率和位置同时写入海事和道路接收机），并附组合的最佳/最差汇总。结果携带测评活动哈希、覆盖每个成员结果的摘要，以及每个输出数字的单位条目；互操作性导出把每个带几何的成员场景写成各自的文件集。组合恒等式经过测试：单阶段测评活动按位复现独立运行，固定种子的集合字节级稳定，并且在白频率噪声时钟上，集合均值落在所报告区间内，离散程度与 sqrt(q_wf * tau) 相符。MODELLED：叠加式的 carry 和零阶保持是建模选择，每个阶段都带有运行它的类别的标签。

engine-kind-leo-signal-description = LEO-PNT 信号设计：针对任何系统、频段和结构的参数化低地球轨道（LEO）定位、导航与授时（PNT）信号。信号由一个频段（中心频率、发射带宽、ITU 划分 RNSS/RDSS/MSS/EESS/non-RNSS/other）和若干分量（捕获、数据、导频；任意子集）组成，每个分量带有调制（带小数 n 的 BPSK(n)、BOC(m,n)、MBOC(6,1,p) 或平坦的类 OFDM 频带）、功率份额、可选的 FDMA 子载波偏移、码长和数据速率。信号来自编译进来的公开预设文件（xona-pulsar、iridium-stl、starlink-soo、centispace、generic-c-band、generic-bands；每个都带有其来源 URL，每个未发布的值均标为 REPRESENTATIVE）或内联编写。每个信号：带限功率谱密度以及发射频带所通过的每个分量功率的比例（BPSK 闭式与数值并列）、RMS（Gabor）带宽、延迟锁定环码跟踪热噪声抖动随 C/N0 和超前-滞后间隔的变化（来自 Betz & Kolodziejski 2009 的带限相干（或非相干）超前-滞后公式，并附其无限带宽的教科书形式及其间隔趋零的 Gabor 界）、以米为单位的测距精度、捕获搜索空间（由轨道最大多普勒加振荡器和用户项得到的多普勒单元，乘以码单元）、平方律检测概率以及平均串行和码并行捕获时间、该信号对 GPS L1 C/A、Galileo E1、GPS L5、Galileo E5a、E5b 和 E5 AltBOC 的频谱分离系数以及它们各自对该信号的频谱分离系数连同 C/N0 劣化，以及被跟踪分量所能容忍的 CW、宽带和匹配 J/S，取自频谱类别自身的 SSC 机制。频段权衡：一阶电离层延迟（{ $lit_40_3 } TEC/f^2）、自由空间损耗、相同 C/N0 和相同 EIRP 下的测距精度，以及干扰容忍度。可选的形状检查把设计的频谱与某次所述测量对照（MODELLED 一致性）。VALIDATED：BPSK 带内功率（主瓣内 { $lit_90_3 } %）和 Gabor 带宽闭式，带限抖动退化为教科书的相干超前-滞后形式及其 Gabor 界，偏移 BPSK 频谱分离系数对照其 Parseval 闭式，AltBOC 频谱的单位面积，以及最大 LEO 多普勒对照已发布的 Xona Pulsar（32-34 kHz）和 Iridium（36 kHz）数字。MODELLED：每个设计、功率分配、C/N0 和干扰机电平；EFQPSK、CSK 和 OFDM 频谱为近似。

engine-kind-leo-pass-description = LEO 过境与链路预算，逐频段，用于 LEO-PNT（来自低地球轨道的定位、导航与授时），与系统无关：一个用户（地面、海事、空中或室内，静止或运动）和一颗或多颗 LEO 卫星，来自设计过境（放置一条圆轨道，使用户在选定时刻看到一次选定最大仰角的过境，如有要求则为太阳同步）、显式根数、通过引擎 SGP4 的 TLE（两行根数）或由星座设计代码构建的 WALKER 星座（报告最高的过境）。频段来自已命名的预设（通用多频段 UHF/L/S/C、通用 C 波段、Xona Pulsar X1/X5、Iridium STL、作为仅多普勒机会信号的 Starlink、CentiSpace，以及标为 WORKSHOP 的可选 Celeste IOD 预设）或写入场景；每个预设都说明其数字是 PUBLIC（附 URL）、REPRESENTATIVE 还是 WORKSHOP。每颗卫星、频段和历元：仰角、方位角、距离、距离变化率和距离加速度；自由空间路径损耗；EIRP 和卫星方向图增益（等通量、高斯波束或平坦）；用户天线增益随仰角的变化（贴片、半球或各向同性）；气体衰减（ITU-R P.676-10 附件 2）、雨衰（ITU-R P.838-3 系数和 P.618-14 程序，由降雨率和降雨高度得到）、对流层闪烁（ITU-R P.618-14 第 2.4.1 节）、室内用户的建筑物穿透损耗（ITU-R P.2109-2）、极化失配、系统噪声温度和 C/N0（载噪密度比）；由距离变化率和距离加速度按闭式得到的多普勒和多普勒变化率，各自对照中心差分核对；由 Klobuchar 或垂直 TEC 斜向 TEC 并按卫星以下电离层部分缩放得到的一阶电离层延迟 { $lit_40_3 } STEC/f^2。频段对给出过境峰值处的无电离层系数、噪声放大和码噪声。MEO GNSS 卫星（Galileo 或 GPS 预设）以相同的天线和噪声模型，根据其接口文件的接收功率进行评估，因此 LEO 的钟形过境与平坦的 GNSS 载波共用一张图。可选的 [iot] 部分给出在所述接收机功率预算下，首次定位时间、每次定位的能量和电池寿命随占空比的变化（MODELLED）。每个频段对还给出其无几何组合在峰值处恢复的斜向 TEC，以及该估计的码噪声 sigma（电离层探测）。可选的 [spoofer] 部分在起始之后伪造一个从真实位置跳变或被推离的声称位置的信号，并运行两个带所述虚警和漏检概率的监测器：多普勒与过境几何一致性（所测距离变化率对照由轨道以及独立先验位置和速度预测的值，在窗口上做广义最小二乘卡方检验，针对 GNSS、LEO 和全部通道）和跨频段一致性（每个 LEO 频段对经模型修正的无几何组合的历元间步进），报告逐历元统计量以及每个监测器何时检测到（MODELLED）。VALIDATED 的分量：自由空间损耗，P.838-3 系数对照其表 5，P.618-14 雨衰和闪烁程序以及 P.2109 建筑物穿透损耗对照 ITU-R 第 3 研究组验证算例，IS-GPS-200 L1/L2 群时延比，以及圆轨道静止用户的最大多普勒对照 arXiv 2509.19551 表 1。MODELLED：EIRP、方向图、卫星以下 TEC 的 Chapman 比例以及整个过境。

engine-kind-leo-navmsg-description = LEO 导航电文：低地球轨道（LEO）定位、导航与授时卫星的广播星历和时钟，适用于任何轨道、载波和模型，带可选的命名预设（Xona Pulsar、Iridium、Starlink、CentiSpace、一个代表性 C 波段系统、ATOMIC 零时钟模型、Celeste IOD）。内容：辅助数据（SVID、数据期号、频段、信号健康状态）、同步（周、周内时、围绕 toc 的二阶时钟多项式 af0-af2）、四种模型之一的星历，即 Galileo OS SIS ICD 16 参数开普勒集；该集加上沿迹、横迹和径向修正多项式；Liu 等人 2025 年 22 参数模型；不含时钟项的 ECEF 多项式（ATOMIC 零时钟）；以及其他服务（Klobuchar 广播集、带有效电离水平的 NeQuick-G ai0-ai2，以及带 ICD 闰秒逻辑的系统时到 UTC 参数）。拟合器：用带谐 J2-J6 或 EGM2008 重力（取到所选阶次）和阻力积分得到的真实轨道，以及带随机种子的自由或受控时钟；在非奇异根数上对开普勒集做 Levenberg-Marquardt 拟合，然后做线性最小二乘修正多项式；时钟拟合时扣除用户自行加上的相对论项。分析：fit-interval-trade（带轨道高度全球平均权重的空间信号测距误差 SISRE，随拟合区间和更新周期变化，仅轨道与含时钟）、model-comparison（四种模型、参数个数、编码比特数，以及 Kshana 在 Liu 等人所用高度上的拟合与已发布数字并列）、midpass-update（一次用户上空的最高过境、每次电文切换的位置、时钟和用户距离跳变、最差几何跳变、对照连续性阈值的 PASS/FAIL）、encode-decode（带 CRC-24Q 的 Kshana 自有的有文档二进制帧、逐字段半步长量化预算、受损帧检查、标为 Kshana 扩展的类 RINEX-4 记录导出和导入，以及 CSV 表）。VALIDATED：SISRE 权重对照已发布的 MEO/GEO 表（Montenbruck 等人 2018）；Galileo 用户算法对照真实 Galileo 广播星历上的 RTKLIB；CRC-24Q 对照其目录校验值和 RTCM 1005 示例帧。MODELLED：每个拟合和 SISRE 数字都是对照 Kshana 积分真值的表示误差（没有定轨或预测误差）；与 Liu 等人的对比使用了不同的轨道；编码和文本格式是 Kshana 自有的。

engine-kind-leo-pvt-description = 对任意星座的中地球轨道（MEO）与低地球轨道（LEO）融合定位、导航与授时（PNT）：每个 [[system]] 是星座设计类别的 GNSS 预设、LEO 预设（xona-pulsar、iridium-stl、starlink-sop、centispace、generic-c-band、atomic-zero-clock 星历模型，或另一个预设文件，每个都在各自的文件中，其来源标为 PUBLIC、WORKSHOP 或 DERIVED）、Walker 壳层或显式根数集，带载波、码片速率、从高度截止角到天顶的载噪密度比（C/N0）包络、空间信号测距误差（SISRE）、多普勒 sigma 和时钟模型（其自有接收机时钟，因此系统间偏差被估计，或已知的广播偏移）。四种模式。DOPPLER：根据距离变化率、带解析偏导数、时钟漂移和可选速度状态以及可选高度约束的批高斯-牛顿定位，单卫星或多卫星，误差随窗口长度的变化，每个 LEO 系统的多普勒、多普勒变化率和加加速度包络，以及单次过境的沿迹和横迹精度随横迹偏移的变化（过境越接近头顶，横迹误差无限增长；单次过境还存在跨地面轨迹的镜像解）。仅多普勒的机会信号（starlink-sop）在此运行。JOINT：仅 GNSS、仅 LEO 以及二者共同的逐历元加权最小二乘伪距定位，逐测量 sigma 来自 C/N0 处的延迟锁定环热噪声模型加上 SISRE（或固定 sigma，使信号模型可以馈入它们），估计的系统间偏差，以及 PDOP/HDOP/VDOP 随所加 LEO 卫星数的变化。POLAR：GNSS、LEO 及二者共同的可见卫星数和 DOP 随纬度的变化。TIMING：用位置已知的 LEO 卫星向协调世界时（UTC）做时间传递，使用过程噪声取自引擎振荡器类别的两状态时钟滤波器，随 C/N0 和振荡器变化，以及 IS-GPS-200 系统时到 UTC 的表达式；设置 [timing] trace = true 时，每行还报告其每个历元的钟差和预测 sigma。VALIDATED：从头顶到地平线的过境的最大多普勒对照已发布的 Iridium（最高 36 kHz）和 Xona Pulsar X1（32 至 34 kHz）数字。MODELLED：其余一切；DOP 对照手工推导的算例核对，定位对照其协方差核对，多普勒模型对照距离加速度恒等式核对。

engine-kind-leo-ppp-description = 仅 GNSS 与带 LEO 增强的精密单点定位（PPP）收敛：对无电离层码和载波相位的浮点扩展卡尔曼滤波器，带静态测站坐标、白接收机时钟、每个额外系统一个系统间偏差、按 1/sin(elevation) 映射的随机游走天顶湿延迟，以及每个卫星弧段一个浮点模糊度；精密轨道与钟差误差是白的，并且对某颗卫星的码和相位是共同的，因此每颗卫星是 Joseph 稳定形式下的一次相关两行更新。测量由同一模型在多个站点和随机种子上以带随机种子的噪声仿真，每个案例（先是仅 GNSS，然后是 LEO 系统的每个 [[case]]，任意星座或预设）报告收敛时间中位数（此后水平和垂直误差都保持在阈值以下的第一个历元，默认 10 cm）、收敛比例、误差曲线中位数以及滤波器一致性（运行平均的位置 NEES 对照双侧 95% 卡方带）。可选地与已发布的 Li 等人（2019，J. Geod. 93:749，doi 10.1007/s00190-018-1195-2）中纬度数字并列：多 GNSS 为 { $lit_9_6 } min，加入 60、96、192 和 288 颗 LEO 卫星后分别缩短为 { $lit_7_0 }、{ $lit_3_2 }、{ $lit_2_1 } 和 { $lit_1_3 } min。MODELLED：趋势的一致性比较，不是对该研究的星座、噪声或测站的复现；没有整周模糊度解算、周跳、相位缠绕、潮汐或时间相关的产品误差。

engine-kind-ntn-positioning-description = 基于 5G 非地面网络（NTN）下行链路在移动卫星业务（MSS）S 波段（3GPP 频段 n256，下行 2170 至 2200 MHz；默认载波 { $lit_2172_5 } MHz）中的定位：到达时间的克拉美-罗界（CRB）c / (2 pi beta sqrt(2 (C/N0) T))，其中 beta 是平坦 OFDM 频谱的均方根（Gabor）带宽（B/sqrt(12)），以及复音多普勒的界 sqrt(3 / (2 pi^2 (C/N0) T^3))，针对每个信号（默认是占用 { $lit_4_5 } MHz 的 5 MHz 新空口信道和占用 180 kHz 的 200 kHz 窄带信道）；然后在任意 LEO 星座上，给出接收机时钟未知的下行到达时间定位（带随机种子，以该界加上网络同步误差作为 sigma）、其 PDOP 和形式 3D sigma，以及在最长过境上保持高度的单卫星多普勒定位。MODELLED：从带宽到界的这一步是教科书闭式，已对照平坦和带限 BPSK 频谱的数值积分核对（内部一致性，没有固定任何已发布的算例数字），定位精度是在无多路径信道、带所述同步误差下的一个界，而不是已达成的结果。

engine-kind-leo-pnt-chain-description = 一个 LEO-PNT（来自低地球轨道的定位、导航与授时）系统的端到端，适用于任何星座和信号：由 signal_design 命名的 leo-signal 设计（公开预设或内联 [signal] 设计）设定 [pass] 频段的中心、带宽、码片速率和 EIRP 分配，leo-pass 链路预算给出过境期间被跟踪的 C/N0 和带限码抖动，一条关于 sin(elevation) 的 C/N0 直线和 [navmsg] 电文的广播 SISRE（在过境卫星高度处拟合）馈入 [fusion] leo-pvt 联合定位的每个 LEO 系统，并可选地馈入 [ppp] leo-ppp 案例；每次交接都列出其值和单位。MODELLED。

engine-kind-contact-schedule-description = 多颗卫星在多个测站上的地面接触规划：视在接入窗口（SGP4、IAU 2006/2000A 地固框架、ITU-R P.834 折射、光行时）、每次过境的 DVB-S2 ACM 数据量（ETSI EN 302 307-1 表 13 门限），以及无冲突的调度（每副天线每次一颗卫星并带周转时间，每颗卫星一个测站，按优先级加权的交付量以各自积压为上限），通过边际价值贪心法、先到先得基线以及小规模集合上的精确分支定界给出，并附贪心法的最优性差距。MODELLED。

engine-kind-acm-link-description = 一颗卫星经过一个测站：每次过境沿途的斜距、仰角和 Es/N0，每一步所选的 DVB-S2 MODCOD（ETSI EN 302 307-1 表 13 门限加实现余量），以及 ACM 所传输的数据量，对照在截止角处闭合的恒定编码基线。MODELLED。

engine-kind-aocs-description = 航天器姿态控制：具有三个或更多平衡反作用轮的刚性本体在 MRP 反馈（L = -K sigma - P omega）下的惯性指向机动，最小范数轮力矩被限幅到各电机的限值，RK4 加零阶保持；可选地通过乘性 EKF 闭环，输入来自仿真的陀螺（角度和速率随机游走）和星敏感器。报告稳定时间、最终和峰值指向误差、峰值轮速和力矩、饱和比例、角动量漂移，以及带估计器时其姿态误差和 NEES。真实状态回路对照 Basilisk 2.9.1 达到 VALIDATED；估计器为 MODELLED。

engine-kind-entry-heating-description = 绕旋转球形地球或火星的 3 自由度质点大气再入（弹道式或以恒定倾侧角的升力式），RK4，通过 US76、指数大气或火星大气，采用 Sutton-Graves 驻点对流加热（NASA TR R-376）：峰值减速度、热流和动压、热载荷、下程距离、旋转坐标系能量核对，以及并列给出的 Allen-Eggers 闭式。峰值减速度对照已发布的 Stardust 标称值核对；加热为 MODELLED。

engine-kind-eo-radiometry-description = 星下点成像仪辐射测量与图像质量：朗伯场景的入瞳辐亮度、相机方程、信号以及散粒/暗电流/读出/量化噪声和 SNR；奈奎斯特频率处的系统 MTF（衍射 x 探测器 x 拖尾 x 抖动）、由它得到的相对边缘响应、Q = lambda F/p，以及不带 MTF 补偿的 GIQE 第 4 版 NIIRS。MODELLED。

engine-kind-ascent-losses-description = 多级运载器在不自转的球形地球上、通过 1976 年美国标准大气的平面重力转弯上升（垂直爬升、俯仰踢转、推力沿速度方向），积分重力、阻力、操纵和背压损失，并核对理想 dv 减去损失与关机速度是否一致；最大动压、峰值加速度和关机状态。MODELLED。

engine-kind-time-transfer-budget-description = 两个测站之间通过地球静止中继的双向卫星时间与频率传递：求解 T_A - T_B 的双向方程，计入每个非互易项（测站设备时延、Ku 波段电离层、转发器、Sagnac），一份方和根不确定度预算，其 A 类项是模拟链路在该平均时间上的 TDEV，一条带白相位噪声和闪烁相位噪声以及日变化非互易性的模拟链路，以及所提供的任何 BIPM Circular T 第 1 节序列、MJD,ns CSV 或 IGS RINEX 测站时钟记录的稳定度（速率、残差 RMS、TDEV、ADEV）。MODELLED。

engine-kind-optical-atmosphere-description = MODELLED 的穿过大气的光学 PNT：对一条光链路和一组带有所述云气候的地面站点，报告随波长和仰角变化的晴空损耗（Kim 能见度定律加瑞利）、Hufnagel-Valley 湍流状态（Rytov 方差、闪烁指数、gamma-gamma 参数、孔径平均）、对照链路余量的天气驱动可用性（来自对数正态液态水气候的云光学厚度、几何光学消光、独立的湍流衰落）、达到目标可用性所需的链路余量、中断时长分布、每次中断经时钟守时模型得到的授时和测距误差增长、与距离相关的站点分集可用性，以及增强技术的假设增益（波长、接收孔径、自适应光学闪烁抑制、额外余量）。作为所述公式的实现，对照独立的 mpmath 参考基准（oracle）达到 VALIDATED：Rytov 方差、闪烁指数、gamma-gamma 衰落概率、孔径平均因子、云和晴空光学厚度。MODELLED：每个天气、技术和时钟输入，以及独立性和 copula 假设；没有与任何实测可用性记录作比较。仅供参考的分析，不是经认证的可用性或导航产品。

engine-kind-holdover-test-description = MODELLED 的授时系统守时测试，根据由操作人员提供的钟差记录评分（linuxptp 的 ptp4l、phc2sys 或 ts2phc 日志，chrony 的 tracking 或 statistics 日志，TICC、TimeLab 或 RINEX 时钟日志，或 time_s,time_error_ns 对）。该测试有四个步骤，Kshana 一个也不执行：锁定的基线（BASELINE）、由操作人员在所述时刻移除的 GNSS（天线电缆或模拟器输出；Kshana 不发射也不驱动任何东西）、系统自身振荡器上的守时（HOLDOVER），以及操作人员在第二个所述时刻恢复 GNSS 之后的恢复（RECOVERY）。记录在这两个时刻处被拆分。基线：钟差统计量以及为锁定时钟编写的 ITU-T 掩码。守时：统计量、系统所保持的分数频率偏差（最小二乘直线）、为守时或自主时钟编写的掩码、由所述锁定时长得到的 ePRTC-A 守时包络，以及超出每个钟差预算的时间。恢复：|TE| 是否以及何时进入所述范围并保持在其中、峰值和最大阶跃。每个限值都抄录自公开的 ITU-T 表（电信授时掩码）；措辞为“对照掩码测得”，且这两个时刻是操作人员的陈述，未经验证。对某个掩码而言过短的记录为 INCOMPLETE，绝不外推。参见 docs/TIMING-HIL.md。

engine-kind-gnss-ssv-description = MODELLED 的空间服务区及其以远的 GNSS 可用性与链路强度：对球面上的用户（ICG 手册的全球壳层）或开普勒轨迹上的用户（LEO 至月球转移），按星座（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）并对全部合计，统计 C/N0 阈值以上的可用信号：至少一个信号和四个信号的可用性、最大中断时长、接收 C/N0、精度因子、主瓣与旁瓣链路，使用手册、参数化或用户提供的发射方向图，可选的掠过地球边缘射线的电离层、等离子体层和大气效应，以及可选的弱信号接收机设计；还包括面向 HEO 和月球转移航天器的星载 GNSS 扩展卡尔曼滤波器（轨道动力学、太阳辐射压、第三体、时钟），以及通过单差伪距对多航天器编队做相对导航。在预先登记（xval/gnss-ssv）下对照 ICG SSV 手册表格核对
