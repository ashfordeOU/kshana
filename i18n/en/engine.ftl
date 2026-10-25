# SPDX-License-Identifier: AGPL-3.0-only
# COUNTS: a variable named n, count, n_*, num_* or *_count holding a whole number is passed as a
# number, so plural selectors work ({ $n -> [one] ... *[other] ... }). The messages that have such
# variables are listed in i18n/en/engine-counts.txt. English renders each exactly as before.
# The English catalogue of the engine messages: the source of every other language.
#
# Rules for this file (checked by tests/i18n_catalogue.rs):
#   * The text of a message is, byte for byte, the text the engine printed before the catalogue
#     existed: moving a string here never changes the English output.
#   * Variables are named ($version) and strings: numbers are formatted in Rust (i18n::num) so the
#     catalogue never decides a precision.
#   * Error messages have ids starting `e-`; the code is the id in capitals (E-CLOCK-VERSION) and
#     is never translated.
#   * Machine-readable output (JSON keys, CSV headers, file names) never comes from this file.

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Sequential terrain-referenced navigation (recursive SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = free-inertial drift (grows)

engine-altpnt-sequential-terrain-matched-bounded = terrain-matched (bounded)

engine-altpnt-sequential-waypoint-full-scale = waypoint →    full scale { $maxv } m

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = unknown clock-log format { $other }; expected one of { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = unknown gap policy { $other }; expected refuse, longest or linear

engine-e-clock-log-give-either-the-log-text = give either the log text or its path, not both

engine-e-clock-log-clock-log-needs-its-text = a clock log needs its text or a path

engine-e-clock-log-tau0-must-be-finite-and = tau0_s must be finite and > 0 (got { $t })

engine-e-clock-log-units-and-data-apply-to = units and data apply to the timelab format only

engine-e-clock-log-channel-applies-to-the-ticc = channel applies to the ticc format only

engine-e-clock-log-cannot-read-clock-log = cannot read clock log { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = a clock-log path is not available in the WebAssembly build; give the log as text

engine-e-clock-log-the-log-has-missing-epoch = the { $format } log has { $n_missing } missing epoch(s) in { $n_gaps } gap(s) on a { $tau0 } s grid; set gaps = "longest" to keep the longest gap-free run or gaps = "linear" to interpolate

engine-e-clock-log-the-log-yields-usable-sample = the { $format } log yields { $x } usable sample(s); at least 3 are needed

engine-e-clock-log-not-rinex-clock-file-no = not a RINEX clock file: no END OF HEADER record

engine-e-clock-log-the-rinex-clock-file-has = the RINEX clock file has no AS or AR records

engine-e-clock-log-the-rinex-clock-file-holds = the RINEX clock file holds { $many } clocks; name one with clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = no AS or AR records for clock { $id }

engine-e-clock-log-the-clock-has-single-epoch = the clock has a single epoch; tau0 cannot be found

engine-e-clock-log-the-log-has-no-readings = the { $format } log has no readings

engine-e-clock-log-unknown-phase-unit-expected-ms = unknown phase unit { $other }; expected s, ms, us, ns or ps

engine-e-clock-log-timelab-line-has-column-the = TimeLab line { $v1 } has { $v } column(s), the first data line has { $first }

engine-e-clock-log-timelab-line-has-columns-one = TimeLab line { $v1 } has { $v } columns; one (value) or two (time value) are read

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab line { $v1 } is not numeric: { $l }

engine-e-clock-log-the-timelab-log-has-no = the timelab log has no readings

engine-e-clock-log-unknown-data-expected-phase-or = unknown data { $other }; expected phase or frequency

engine-e-clock-log-tau0-header-is-not-positive = tau0 header { $v } is not a positive number of seconds

engine-e-clock-log-frequency-data-is-fractional-frequency = frequency data is fractional frequency; its units can only be 1

engine-e-clock-log-two-column-frequency-logs-are = two-column frequency logs are not read; give frequency as a single column with tau0

engine-e-clock-log-unknown-time-units-expected-or = unknown time_units { $o }; expected s or mjd

engine-e-clock-log-the-timelab-log-time-column = the timelab log's time column must increase

engine-e-clock-log-single-reading-tau0-cannot-be = a single reading; tau0 cannot be found

engine-e-clock-log-the-timelab-log-has-non = the timelab log has { $non_finite } non-finite reading(s)

engine-e-clock-log-the-ticc-log-holds-channels = the TICC log holds channels { $many }; name one with channel = "..."

engine-e-clock-log-no-readings-on-channel-found = no readings on channel { $channel } (found { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC interval-mode lines carry no time; give tau0_s (the event period)

engine-e-clock-log-the-readings-do-not-increase = the { $channel } readings do not increase, so they are not time stamps (TICC Period mode output is not read; use Timestamp mode)

engine-e-clock-log-single-time-stamp-tau0-cannot = a single time stamp; tau0 cannot be found

engine-e-clock-log-two-time-stamps-apart-under = two { $channel } time stamps { $w } s apart, under half of tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = the { $format } time stamps of { $clock } go backwards (a restarted daemon or a clock step); split the log and read each part

engine-e-clock-log-the-log-has-no-readings-2 = the log has no { $what } readings

engine-e-clock-log-the-log-holds-sources-name = the log holds { $many } sources; name one with { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = no { $what } readings for { $id } (found { $names })

engine-e-clock-log-the-servo-of-never-reached = the servo of { $id } never reached the locked state s2

engine-e-clock-log-the-log-has-no-chrony = the log has no chrony tracking readings

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = sample rate { $fs_hz } Hz is not a whole number of samples per millisecond

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms and noncoherent must be positive

engine-e-acquisition-the-doppler-grid-needs-positive = the Doppler grid needs a positive step and a non-negative maximum

engine-e-acquisition-pfa-must-lie-in = pfa must lie in (0, 1)

engine-e-acquisition-samples-supplied-needed = { $samples } samples supplied, { $needed } needed

engine-e-acquisition-empty-doppler-grid = empty Doppler grid

engine-e-acquisition-the-samples-carry-no-power = the samples carry no power

## src/adm.rs

engine-e-adm-unknown-attitude-type = unknown ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = an AEM needs at least one segment

engine-e-adm-segment-is-not-version-attitude = segment { $i }: { $t } is not a version { $version } attitude type

engine-e-adm-segment-values-for = segment { $i }: { $values } values for { $t }

engine-e-adm-aem-version-has-no-ndm = AEM version 1.0 has no NDM/XML form here; write KVN

engine-e-adm-this-attitude-type-has-no = this attitude type has no version 2.0 form

engine-e-adm-expected-meta-start-found = expected META_START, found { $l }

engine-e-adm-meta-start-without-meta-stop = META_START without META_STOP

engine-e-adm-unexpected-metadata-line = unexpected metadata line { $other }

engine-e-adm-in-version-aem = { $att } in a version { $version } AEM

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = expected DATA_START after META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START without DATA_STOP

engine-e-adm-empty-data-line = empty data line

engine-e-adm-values-on-line = { $vals } values on a { $att } line: { $b }

engine-e-adm-unexpected-data-line = unexpected data line { $other }

engine-e-adm-attitude-type-has-no-xml = attitude type has no XML form

engine-e-adm-message-without-version-attribute = message without a version attribute

engine-e-adm-expected-found = expected { $vers_key }, found { $other }

engine-e-adm-header-without-creation-date-or = header without CREATION_DATE or ORIGINATOR

engine-e-adm-missing = missing { $k }

engine-e-adm-unexpected-keyword = unexpected keyword { $k }

engine-e-adm-spin-block-holds-nutation-or = a spin block holds nutation or momentum data, not both

engine-e-adm-unexpected-apm-keyword = unexpected APM keyword { $other }

engine-e-adm-unexpected-apm-line = unexpected APM line { $b }

engine-e-adm-without = { $b } without { $stop }

engine-e-adm-unexpected-line-in = unexpected line in { $b }: { $other }

engine-e-adm-incomplete-group = incomplete group { $keys }

engine-e-adm-unknown-apm-block-start = unknown APM block { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM metadata needs OBJECT_NAME, OBJECT_ID and TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM without EPOCH

engine-e-adm-rotation-axis = rotation axis { $o }

engine-e-adm-values-for = { $values } values for { $t }

engine-e-adm-euler-record-without-euler-rot = Euler record without EULER_ROT_SEQ

engine-e-adm-rotation-sequence = rotation sequence { $seq }

engine-e-adm-epoch-has-no = epoch { $s } has no 'T'

engine-e-adm-epoch-date = epoch date { $date }

engine-e-adm-epoch-time = epoch time { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = “{ $s }” (text as the document states it)

engine-advanced-report-mean-5th-to-95th-percentile = mean { $fmt_num } (5th to 95th percentile { $fmt_num2 } to { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = field-units schema: units entry `{ $key }`

engine-advanced-report-field-units-schema-input-entry = field-units schema: input entry `{ $key }`, matched by field name

engine-advanced-report-rows-of-non-numeric-column = { $n } rows of a non-numeric column

engine-advanced-report-rows-from-to = { $nums } rows, from { $fmt_num } to { $fmt_num2 }

engine-advanced-report-phase-ended-by = phase { $name } (ended by { $ended })

engine-advanced-report-result-timeline-phases = result `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = hand-off into phase { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = result `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = scenario input `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = scenario file comment, line { $start }

engine-advanced-report-scenario-file-comment-lines-to = scenario file comment, lines { $start } to { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } is MODELLED, not validated: { $it }.

engine-advanced-report-sweep-of-scale = Sweep of { $param } ({ $str_of } scale)

engine-e-advanced-report-the-result-document-is-not = the result document is not JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = the scenario is not TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Monte Carlo distribution of { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = recorded at build time from the { $GIT_COMMIT_ENV } environment variable

engine-advanced-report-not-recorded-this-engine-was = not recorded: this engine was built without the { $GIT_COMMIT_ENV } environment variable; the engine version identifies the release

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (the kind's own fingerprint of the scenario; not the file digest)

engine-advanced-report-input-file = Input file { $path }

engine-advanced-report-study-generated = { " " }Study generated { $esc }.

engine-advanced-report-eyebrow = Kshana run report

engine-advanced-report-meta = Kind <code>{ $kind }</code> · engine { $engine } · scenario <code>{ $scenario }</code> (file digest { $digest }…)

engine-advanced-report-toc-summary = 1 Summary

engine-advanced-report-toc-inputs = 2 Inputs

engine-advanced-report-toc-results = 3 Results

engine-advanced-report-toc-aggregation = 3a Aggregation

engine-advanced-report-toc-companions = 3b Animation and exports

engine-advanced-report-toc-events = 4 Events

engine-advanced-report-toc-labels = 5 Verification labels

engine-advanced-report-toc-not-modelled = 6 Not modelled

engine-advanced-report-toc-reproducibility = 7 Reproducibility

engine-advanced-report-h-summary = 1. Executive summary

engine-advanced-report-honesty-label = <strong>Honesty label</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Capabilities used:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (relied on, not provided); see section 5.

engine-advanced-report-member-runs = <strong>Member runs:</strong> { $n }, aggregated in section 3a.

engine-advanced-report-h-inputs = 2. Inputs

engine-advanced-report-inputs-note = Every field the scenario file sets, flattened to its path. Units come from the result's <code>units</code> block (the field-units schema, docs/field-units-schema.json) where it describes the field, otherwise from the field-name suffix; a unit neither states is shown as not stated.

engine-advanced-report-th-parameter = Parameter

engine-advanced-report-th-value = Value

engine-advanced-report-th-unit = Unit

engine-advanced-report-th-unit-source = Unit source

engine-advanced-report-h-results = 3. Results

engine-advanced-report-chart-alt = Result chart

engine-advanced-report-also-written-to = { " " }(also written to { $file })

engine-advanced-report-h-scalars = Scalar results

engine-advanced-report-h-columns = Numeric columns

engine-advanced-report-th-result = Result

engine-advanced-report-th-column = Column

engine-advanced-report-th-count = Count

engine-advanced-report-th-min = Min

engine-advanced-report-th-max = Max

engine-advanced-report-th-first = First

engine-advanced-report-th-last = Last

engine-advanced-report-omitted-inputs = <p class="note">{ $n } further inputs are left out of this page; report.json lists the same rows, and the result document carries every value.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">{ $n } further scalar results are left out of this page; report.json lists the same rows, and the result document carries every value.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">{ $n } further numeric columns are left out of this page; report.json lists the same rows, and the result document carries every value.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">{ $n } further events are left out of this page; report.json lists the same rows, and the result document carries every value.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Aggregation of member runs

engine-advanced-report-mode = <p>Mode <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Mode <strong>{ $mode }</strong> over the <code>{ $kind }</code> kind.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Mode <strong>{ $mode }</strong>, { $n_runs } member runs.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Mode <strong>{ $mode }</strong> over the <code>{ $kind }</code> kind, { $n_runs } member runs.</p>{ "\u000A" }

engine-advanced-report-run-digest = Run digest (SHA-256 over the member result digests, in dispatch order): <code>{ $digest }</code>

engine-advanced-report-table-empty = This table has no rows: the result lists none.

engine-advanced-report-distribution-caption = Monte Carlo distribution of { $metric } ({ $n } samples), 20 equal-width bins; dashed lines mark the 5th, 50th and 95th percentiles.

engine-advanced-report-distribution-caption-unit = Monte Carlo distribution of { $metric } ({ $n } samples, { $unit }), 20 equal-width bins; dashed lines mark the 5th, 50th and 95th percentiles.

engine-advanced-report-h-companions = 3b. Animation and exports

engine-advanced-report-animation-alt = Animation of the run's time series

engine-advanced-report-animation-caption = The run's own samples drawing in behind a moving time cursor (the animated drawing of <code>--animate svg</code>; it shows the finished picture under reduced motion and in print).

engine-advanced-report-no-animation = No animation: { $reason }

engine-advanced-report-no-animation-default = the result carries no time series

engine-advanced-report-player-written-by = The interactive player is written by <code>{ $command }</code>.

engine-advanced-report-written-beside = Written beside this report: { $links }.

engine-advanced-report-th-export = Export

engine-advanced-report-th-applies = Applies

engine-advanced-report-th-files-or-reason = Files or reason

engine-advanced-report-written-by = written by <code>{ $command }</code>

engine-advanced-report-does-not-apply = does not apply

engine-advanced-report-yes = yes

engine-advanced-report-no = no

engine-advanced-report-h-events = 4. Events timeline

engine-advanced-report-events-caption = Windows as bars, point events as dots, on the run's own time axis.

engine-advanced-report-th-start = Start (s)

engine-advanced-report-th-end = End (s)

engine-advanced-report-th-event = Event

engine-advanced-report-th-source = Source

engine-advanced-report-point-event = point event

engine-advanced-report-events-timeline = Events timeline

engine-advanced-report-point-events = point events ({ $n })

engine-advanced-report-distribution-of = Distribution of { $metric }

engine-advanced-report-max-bin = max bin { $n }

engine-advanced-report-h-labels = 5. Verification labels

engine-advanced-report-th-capability = Capability (matrix requirement)

engine-advanced-report-th-label = Label

engine-advanced-report-th-used-by = Used by

engine-advanced-report-th-oracle = Source: oracle

engine-advanced-report-th-test-evidence = Test evidence

engine-advanced-report-h-figure-tiers = Per-figure tiers stated by the result

engine-advanced-report-th-figure = Figure

engine-advanced-report-th-tier = Tier

engine-advanced-report-th-matrix-requirement = Matrix requirement

engine-advanced-report-th-applicable = Applicable

engine-advanced-report-no-attack = no (no attack configured)

engine-advanced-report-h-not-modelled = 6. Not modelled, and assumptions

engine-advanced-report-not-modelled-note = Each item is quoted from where it is stated: the result document, the kind catalogue, the scenario file, or the verification matrix's reason a MODELLED row stays modelled.

engine-advanced-report-th-statement = Statement

engine-advanced-report-h-reproducibility = 7. Reproducibility record

engine-advanced-report-rk-command = Command to reproduce

engine-advanced-report-rk-working-directory = Working directory

engine-advanced-report-rk-engine-version = Engine version

engine-advanced-report-rk-source-commit = Source commit

engine-advanced-report-rk-scenario-file = Scenario file

engine-advanced-report-rk-scenario-sha = Scenario file SHA-256 (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = Result scenario_hash

engine-advanced-report-rk-result-sha = Result document SHA-256

engine-advanced-report-rk-seed = Seed

engine-advanced-report-rk-platform = Platform

engine-advanced-report-rk-generated = Study generated (UTC)

engine-advanced-report-rk-determinism = Determinism

engine-advanced-report-result-hash-none = the result document states none

engine-advanced-report-print-note = To print this page to a Portable Document Format (PDF) file, use the browser's print dialog and choose “Save as PDF”; the print stylesheet fits A4 and US Letter paper, repeats table headers across pages and starts the inputs, results, labels and reproducibility sections on a new page. The engine writes no PDF itself. report.json carries the same content as this page.

engine-advanced-report-footer = Generated by Kshana { $engine }.{ $stamp } Reproducible from scenario + seed + engine version. Free and open source (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">source &amp; docs</a>.

engine-advanced-report-empty-inputs = The scenario sets no field beyond `kind`: the kind ran its reference configuration from its documented defaults.

engine-advanced-report-empty-scalars = The result document carries no scalar outside its arrays; its numbers are summarised by column below.

engine-advanced-report-empty-series = The result document carries no numeric array: every result is a scalar in the table above.

engine-advanced-report-empty-events = No timed event: the scenario scripts no window or onset time and the result reports no event. The kind evaluates its configuration as one case.

engine-advanced-report-empty-not-modelled = Nothing in the result, the kind catalogue, the scenario or the matrix rows used states a modelling limitation for this run.

engine-advanced-report-capabilities-statement = Each row is a verification-matrix row this run's kinds exercise, with the label and the oracle the matrix gives it (src/verification.rs, docs/VERIFICATION-MATRIX.md). A label grades the capability as the matrix records it; it does not grade this scenario's configuration, and a VALIDATED row does not make the run's inputs measured. A PARTNER row is a discipline the run relies on that Kshana does not provide.

engine-advanced-report-no-run-label = The result carries no run-level honesty label; the verification labels of the capabilities it used are listed in their own section, and the per-figure tiers where the result states them.

engine-advanced-report-no-seed = Neither the scenario nor the result carries a seed. The result is fixed by the scenario file and the engine build alone; the determinism test re-runs every bundled scenario and requires byte-identical output.

engine-advanced-report-working-directory = Run the command from the directory the original run was started in: the scenario path, and any relative data path inside the scenario, resolve against it. Check the scenario file against scenario_sha256 first.

engine-advanced-report-determinism-stamped = Same scenario bytes, seed and engine build give the same result document, except its meta.generated_utc stamp, which --study-name writes from the clock; run without --study-name for byte-identical output. Floating-point results are pinned per platform; another operating system or architecture may differ in the last digits.

engine-advanced-report-determinism-plain = Same scenario bytes, seed and engine build give a byte-identical result document and report; this report carries no timestamp. Floating-point results are pinned per platform; another operating system or architecture may differ in the last digits.

engine-advanced-report-not-applicable-no-attack = not applicable (no attack configured)

engine-advanced-report-what-ran-default = A `{ $kind }` scenario.

engine-advanced-report-nothing-carried = nothing carried

engine-advanced-report-tbl-sweep-nodes = Sweep nodes

engine-advanced-report-tbl-mc-summary = Monte Carlo distribution summary (percentiles are nearest-rank; the 95% confidence interval on the mean is a fixed-seed percentile bootstrap)

engine-advanced-report-tbl-chain-phases = Chain phases

engine-advanced-report-tbl-shared = Shared conditions

engine-advanced-report-tbl-members = Members

engine-advanced-report-tbl-combined = Combined across members

engine-advanced-report-tbl-optimiser-best = Optimiser best (a local optimum over the stated bounds)

engine-advanced-report-tbl-optimiser-trace = Optimiser trace

engine-advanced-report-tbl-sweep-grid = Sweep grid

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2 line { $v1 }: expected 8 comma-separated columns, found { $p }

engine-e-altpnt-maps-emag2-line-bad = EMAG2 line { $v1 }: bad { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2 line { $v1 }: non-finite value

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: no data rows

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: { $rows } rows do not fill the { $n_lat } x { $n_lon } lattice they span

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: duplicate node at { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = grid step must be finite and positive, got { $step }

engine-e-altpnt-maps-grid-box-must-have-north = grid box must have north > south and east > west, got [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = grid of { $n_lat } x { $n_lon } nodes is too large

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: the { $what } axis needs at least 2 distinct values

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: the { $what } axis is not regular ({ $w } to { $w2 } against a mean step of { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = error sigma must be finite and non-negative, got { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = correlation length must be finite and positive, got { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side must be >= 2, got { $n }

engine-e-altpnt-terrain-srtm-hgt-length = SRTM .hgt length { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = an .hgt window needs at least 2 x 2 samples, got { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = step must be finite and positive, got { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt window length { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: unknown magnetic_grid column `{ $other }` (use "sealevel" or "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: cannot read magnetic_grid csv_path { $csv_path }: { $e }

engine-altpnt-terrain-title-terrain-referenced = Terrain-referenced navigation (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Gravity-map matched navigation

engine-altpnt-terrain-title-combined = Combined gravity + magnetic + terrain alt-PNT

engine-altpnt-terrain-free-inertial-drift = free-inertial drift

engine-altpnt-terrain-terrain-matched = terrain-matched

engine-altpnt-terrain-gravity-matched = gravity-matched

engine-altpnt-terrain-gravity-only = gravity only

engine-altpnt-terrain-magnetic-only = magnetic only

engine-altpnt-terrain-terrain-only = terrain only

engine-altpnt-terrain-combined-fused = combined (fused)

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = unknown animation format '{ $other }'; expected svg, html, frames or all

engine-e-animation-no-animation-format-given-expected = no animation format given; expected svg, html, frames or all

engine-e-animation-animation-fps-must-be-between = animation fps must be between 1 and 60, got { $fps }

engine-e-animation-animation-duration-must-be-between = animation duration must be between 0.5 s and 600 s, got { $duration_s }

engine-e-animation-animation-width-must-be-between = animation width must be between 480 and 3840 pixels, got { $width }

engine-e-animation-duration-fps-gives-frames-the = duration x fps gives { $n } frames; the frame sequence needs between 2 and { $v1 }

engine-e-animation-result-is-not-json = result is not JSON: { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = mission time ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (needs an ffmpeg built with librsvg; otherwise rasterise the frames first)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }{ $omitted } further series were found but not drawn (the player shows at most { $MAX_CHARTS } panels of { $MAX_TRACES } traces); they are listed in the manifest of the frames export.

## src/antenna.rs

engine-antenna-altitude-beamwidth-deg-points = altitude { $a_lo }-{ $a_hi } m x beamwidth { $b_lo }-{ $b_hi } deg, { $points } points

engine-antenna-limb-capture-is-reached-on = limb capture IS reached on this grid ({ $grid }): { $points } of { $points2 } sampled operating points capture the limb and { $crossings } axis crossing(s) were located; the strongest limb J/S sampled is { $limb_js_db } dB at altitude { $altitude_m } m / beamwidth { $hpbw_deg } deg, against a { $thr } dB capture threshold.

engine-antenna-limb-capture-is-not-reached = limb capture is NOT reached anywhere on this grid ({ $grid }) - not zero capture, but no limb capture: the best limb J/S is { $limb_js_db } dB at altitude { $altitude_m } m / beamwidth { $hpbw_deg } deg, { $shortfall } dB short of the { $thr } dB capture threshold; that operating point would capture the limb at { $limb_capture_tx_power_dbw } dBW transmit power against the { $p_tx_dbw } dBW flown.

engine-e-antenna-azimuths-must-strictly-increase = azimuths must strictly increase

engine-e-antenna-azimuths-must-span-less-than = azimuths must span less than 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = off-boresight angles must strictly increase

engine-e-antenna-gain-grid-does-not-match = gain grid does not match the axes

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = gains K and P must be finite and positive

engine-e-aocs-at-least-three-reaction-wheels = at least three reaction wheels are required

engine-e-aocs-wheel-spin-axis-must-be = wheel { $i }: spin axis must be a unit vector

engine-e-aocs-wheel-js-and-max-must = wheel { $i }: js and u_max must be finite and positive

engine-e-aocs-the-wheel-spin-axes-do = the wheel spin axes do not span three dimensions

engine-e-aocs-inertia-minus-the-wheels-spin = inertia minus the wheels' spin inertia must be positive-definite

engine-e-aocs-inertia-must-be-finite-and = inertia must be finite and symmetric

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis must be a non-zero finite vector

engine-e-aocs-kind-must-be-finite-and-positive = { $n } must be finite and positive

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s must be at most 2e6 steps

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s must be a whole multiple of dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 and omega0_rad_s must be finite

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm must be finite

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s must be finite

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s must be at least dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs: { $n_w } wheels, { $duration_s } s slew from { $series_err } deg -> { $settle } | final { $final_err } deg | peak wheel { $peak_speed } rpm | { $v7 }

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = unknown service '{ $other }' (expected navigation|nav or communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = unknown arbitration policy '{ $other }' (expected navigation-priority, communications-priority or first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = a contact plan needs at least one contact window

engine-e-aperture-duty-apertures-must-be = apertures must be >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = the reporting horizon must be finite

engine-e-aperture-duty-contact-has-non-finite-aos = contact '{ $name }' has a non-finite aos_s or los_s

engine-e-aperture-duty-contact-must-have-los-aos = contact '{ $name }' must have los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = a contact plan needs at least one [[contacts]] window

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: { $sessions } session(s) on { $apertures } aperture(s) under { $policy } -> navigation duty { $navigation_duty }, communications duty { $communications_duty }, idle { $idle_duty }; { $total_outage_s } s of { $total_requested_s } s requested lost to contention (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Study generated { $html_escape }.

engine-e-api-failed-to-serialise-report-to = failed to serialise report to JSON: { $e }

engine-e-api-invalid-scenario = invalid scenario: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you = unknown scenario kind { $other } — did you mean { $hint }? `kshana kinds` lists all { $n } built-in kinds.

engine-api-unknown-scenario-kind-kshana-kinds = unknown scenario kind { $other }. `kshana kinds` lists all { $n } built-in kinds.

engine-api-required-fields = - **Required fields:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Optional fields:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML parse error: { $e }

engine-api-could-not-classify-scenario-kind = could not classify scenario kind: { $e }

engine-api-missing-required-field = { $kind_name }: missing required field(s) — { $options }

engine-api-missing-required-field-2 = { $kind_name }: missing required field "{ $entry }"

engine-e-api-invalid-orbit-scenario = invalid orbit scenario: { $e }

engine-e-api-sp3-export-requires-an-orbit = SP3 export requires an orbit scenario, not '{ $k }'

engine-e-api-omm-export-requires-an-orbit = OMM export requires an orbit scenario, not '{ $k }'

engine-e-api-oem-export-requires-an-orbit = OEM export requires an orbit scenario, not '{ $k }'

engine-e-api-invalid-scenario-toml = invalid scenario TOML: { $e }

engine-e-api-could-not-re-serialise-scenario = could not re-serialise scenario: { $e }

engine-api-scenario-jamming-availability-under-jamming = scenario { $r } | jamming { $v2 } | availability under jamming { $availability_under_jamming } (nominal { $availability_nominal }) | min tracking { $min_tracking } | mean J/S { $v6 }

engine-e-api-the-result-document-already-carries = the result document already carries `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = failed to serialise figure_tiers: { $e }

engine-api-chart-provenance-footer = Kshana v{ $version } · scenario { $hash } · kshana.dev

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = invalid { $label } scenario: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = scenario { $r } | quantum holdover { $holdover_s }s p95 { $pos_p95_m }m | classical holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = scenario { $r } | spoof { $scn } vs { $threshold_ns } ns spec (P_fa { $target_pfa }) | quantum security { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | classical security { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal = integrity | { $n_sats } satellites | { $samples_available }/{ $samples_total } epochs available ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } integrity events, { $report3 } HMI

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | south pole | { $samples_available }/{ $samples_total } epochs available ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | secular LTC−TT rate { $secular_rate_us_per_day } µs/day (band { $band_low }–{ $band_high }) | self-pot { $self_potential_us_per_day } kinetic { $kinetic_us_per_day } | offset @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | baseline { $baseline_km } km | beacon range { $beacon_range_km } km | delay { $report } µs (rate { $delay_rate_s_per_s } s/s) | near-field { $near_field_correction_us } µs | { $samples } samples over { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats = lunar-joint-od-clock | { $n_sat } sats, { $n_earth } Earth stations | station 3-D err with VLBI { $station_pos_err_m } m vs range-only { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× sharper) | sat pos RMS { $sat_pos_rms_m } m | station clk err { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } params

engine-api-builtins-lunar-frame-realisation-points-translation = lunar-frame-realisation | { $n_points } points | translation err { $trans_err_norm_m } m, rotation err { $rot_err_norm_rad } rad, scale err { $scale_err_ppb } ppb | rms residual { $rms_residual_m } m | converged { $converged }

engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } sats ({ $geometry_label }) | { $n_grid_points } pts × { $n_epochs } epochs | coverage { $coverage_pct }% (PDOP<{ $pdop_threshold }) | sats { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL avail { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| ephemeris { $report } ({ $provenance }) σ_URE required { $fmt } vs Keplerian { $fmt2 } vs perturbed { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | { $n_sats } sats (illustrative LCNS-class, not affiliated) | baseline { $baseline_km } km | user error { $user_error_uncorrected_m } m → { $user_error_corrected_m } m ({ $reduction_factor }× reduction) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } points x { $n_epochs } epochs x { $n_trials } trials | availability { $v4 } % | coverage { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | corrected p{ $percentile } 3-D { $f } (uncorrected { $f2 }) | HPL max { $f3 } | MODELLED; not a statement about any real system

engine-api-builtins-terrain-horizon-at-the-station = { " " }| terrain horizon ({ $sources }) at the station max { $horizon_max_deg } deg, user points mean max { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame = lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } states, OEM { $oem_line_count } lines | conformance { $v5 } ({ $present_fields } present / { $missing_fields } missing) | OEM round-trip { $v8 } | time-meta round-trip { $v9 } | KIF { $kif_bytes } bytes | MODELLED

engine-api-builtins-scenario-optical-sync-rms-ps = scenario { $r } | optical sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | quantum chain { $quantum_chain_sigma_s }s vs classical { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | security Pd { $security_pd } (Pfa { $monitor_pfa }) | anomaly Pd { $anomaly_pd } | trade quantum wins { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | outage { $outage_s }s | quantum pos err { $quantum_pos_err_m } m vs classical { $classical_pos_err_m } m ({ $improvement_x }x) | holdover quantum { $quantum_holdover_s }s vs classical { $classical_holdover_s }s (thr { $threshold_m } m) | trade quantum wins { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC quantum { $quantum_auc } vs classical { $classical_auc } | min-detectable fault quantum { $quantum_min_detectable } vs classical { $classical_min_detectable } | { $fault_catalog } fault classes | trade quantum wins { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] applies to the fusion kind only

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = scenario { $r } | quantum PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integrity { $integ } security { $security_na } | classical PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integrity { $integ2 } security { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = scenario { $r } | fused | quantum PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integrity { $integ } security { $security_na } | classical PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integrity { $integ2 } security { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = scenario { $r } | hybrid-ukf (17-state, MODELLED) | sensor { $v2 } (q_va { $effective_q_va }) | clock q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } in [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } in [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | aided { $aided_pos_rms_m }m -> coast { $coast_end_pos_rms_m }m over { $coast_duration_s }s | self-consistency, not accuracy

engine-api-builtins-scenario-gnss-ins-quantum-outage = scenario { $r } | gnss-ins | quantum outage-RMS fused { $fused_outage_rms_m }m vs free { $free_outage_rms_m }m (hold { $holdover_s }s, avail { $availability }) | classical fused { $fused_outage_rms_m2 }m vs free { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, avail { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = scenario { $r } | gnss-sim | mean iono { $mean_iono_m }m tropo { $mean_tropo_m }m | RAIM avail { $raim_availability } mean HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m fault-rate { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = scenario { $r } | spoof-detect | { $n_sats } SVs, +{ $power_advantage_db } dB{ $v4 } | { $push } push | fused score { $score } (thr { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = sweep { $metric } over { $parameter } ({ $first }..{ $last }, { $points } pts, { $scale } scale) | quantum { $first2 }->{ $last2 } | classical { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = scenario { $r } | { $nominal }/{ $series } samples GNSS-nominal | best PDOP { $fnum } pos { $posm } | quantum holdover { $holdover_s }s p95 { $ns1 }ns integrity { $integ } security { $security_na } | classical holdover { $holdover_s2 }s p95 { $ns12 }ns integrity { $integ2 } security { $security_na }

engine-e-api-builtins-ephemeris = ephemeris: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| max el { $el }° peak Doppler { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat = scenario { $r } | { $source } | { $n_samples } samples | alt { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | speed { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }

engine-api-builtins-generic-sweep-of-over-nodes = generic sweep of `{ $kind }` over [{ $keys }] | { $points } nodes (shape { $shape }) | metrics [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | free-inertial drift { $free_inertial_drift_m } m | gravity-matched { $map_matched_error_m } m | matching sigma { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| reference degree { $reference_nmax } anomaly std { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| map-error MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% within { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | free-inertial drift { $free_inertial_drift_m } m | terrain-matched { $matched_error_m } m ({ $v3 }x cut) | matching sigma { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } waypoints | free-inertial RMS { $free_inertial_rms_m } m (final { $free_inertial_final_m } m) | terrain-matched RMS { $matched_rms_m } m (final { $matched_final_m } m, { $v6 }x cut) | mean ESS { $mean_ess }/{ $cfg } | matching sigma { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | free-inertial drift { $free_inertial_drift_m } m | gravity { $gravity_only_m } m magnetic { $magnetic_only_m } m terrain { $terrain_only_m } m | FUSED { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] needs runs = 1: a measured log is one record

engine-api-builtins-scenario-runs-quantum-holdover-p95 = scenario { $r } | { $runs } runs | quantum holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns security { $security_na } | classical holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns security { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = scenario { $r } | quantum holdover { $holdover_s }s p95 { $ns1 }ns integrity { $integ } security { $security_na } | classical holdover { $holdover_s2 }s p95 { $ns12 }ns integrity { $integ2 } security { $security_na }

engine-api-builtins-raim-available-of-epochs-denied = { " " }| RAIM available { $n_available } of { $n_epochs } epochs ({ $n_denied } denied, { $n_alarm } alarms; MODELLED)

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = a reference case needs at least one satellite

engine-e-araim-reference-reference-case-needs-at-least-2 = a reference case needs at least one constellation

engine-e-araim-reference-satellite-names-constellation-but-only = satellite { $i } names constellation { $constellation } but only { $constellations } are declared

engine-e-araim-reference-satellite-has-non-positive-error = satellite { $i } has a non-positive error variance

engine-e-araim-reference-both-integrity-risk-allocations-must = both integrity-risk allocations must be positive

engine-e-araim-reference-this-reference-implementation-monitors-single = this reference implementation monitors single-event fault modes only, but the case's priors require N_fault,max = { $nfm } (simultaneous multi-event subsets). Refusing rather than under-counting fault modes.

engine-e-araim-reference-the-all-in-view-geometry = the all-in-view geometry is singular

engine-e-araim-reference-no-fault-mode-is-observable = no fault mode is observable on this geometry

engine-e-araim-reference-unknown-reference-vector-known-vectors = unknown reference vector '{ $vector }'; known vectors: { $ids } (or 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: { $wanted } published WG-C reference vector(s); worst VPL/HPL agreement { $worst_acceptance } m against the reference's own TOL_PL = { $tol } m over { $acceptance_checked } acceptance vector(s)

engine-e-araim-reference-sat-needs-one-value-per = P_sat needs one value per satellite and P_const one per constellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation = a satellite names an undeclared constellation

engine-e-araim-reference-every-prior-must-lie-in = every prior must lie in [0, 1)

engine-e-araim-reference-the-priors-need-subsets-of = the priors need subsets of { $n_fault_max } simultaneous events; this path enumerates at most { $most }

engine-e-araim-reference-the-all-in-view-solution = the all-in-view solution was not selected

engine-e-araim-reference-an-add-v4-case-needs = an ADD v4.2 case needs satellites and constellations

engine-e-araim-reference-nom-and-sat-need-one = b_nom and P_sat need one value per satellite

engine-e-araim-reference-const-needs-one-value-per = P_const needs one value per constellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = satellite { $i } names an undeclared constellation

engine-e-araim-reference-one-constellation-index-per-satellite = one constellation index per satellite

engine-e-araim-reference-satellite-names-constellation-with-no = satellite { $i } names constellation { $c } with no ISM

engine-e-araim-reference-fewer-than-four-satellites-above = fewer than four satellites above the mask

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m must contain at least one standoff

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (band { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | footprint { $a2 }% cap, limb { $footprint_limb_captured } | spoof-capture { $spoof_captured } (lock { $spoof_lock_time_s } s) | mast reach { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% of 50 bit/s), { $nma_auth_latency_s } s latency

engine-attack-surface-reached-crossing-best-db = reached ({ $crossings } crossing(s), best { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = NOT reached on this grid (best { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB short; needs { $best_limb_capture_tx_power_dbw } dBW vs { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| footprint sweep { $s }x{ $s2 } (alt { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), capture { $v5 }-{ $v6 }% | limb { $limb }

engine-attack-surface-afs-received-dbw = AFS received: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Deficit: { $deficit_db } dB (band { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Capture footprint: { $a }% of disk, limb captured: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Spoof-capture pull-in: { $spoof_captured } (lock { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Mast reach: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limb: captured on { $na }x{ $nb } grid, { $crossings } crossing(s)

engine-attack-surface-limb-not-captured-on-grid = Limb: not captured on { $na }x{ $nb } grid; needs { $best_limb_capture_tx_power_dbw } dBW (flown { $p_tx_dbw })

engine-attack-surface-chart-title = Lunar signal-security attack surface (P1)

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km must be finite and positive

engine-e-attitude-budget-inertias-must-be-finite-and = inertias must be finite and positive

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 must be >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = at least one pointing contributor is required

engine-e-attitude-budget-contributor-sigma-must-be-finite = contributor '{ $name }' sigma must be finite and >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> GG torque { $t_gg } N·m; pointing { $total }" RSS (dominant: { $dominant }) (MODELLED scalar budget)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } needs a value

engine-bench-cli-unknown-option = unknown option `{ $a }`

engine-bench-cli-unexpected-argument = unexpected argument `{ $pos }`

engine-bench-cli-cannot-read = cannot read { $p }: { $e }

engine-bench-cli-cannot-create = cannot create { $d }: { $e }

engine-bench-cli-cannot-write = cannot write { $p }: { $e }

engine-bench-cli-unknown-task-or = unknown task `{ $t }` (a, b, c or d)

engine-bench-cli-scored-epochs-in-folder = { $labels } scored epochs in { $folders } folder(s)

engine-bench-cli-wrote-cases-json-and-truth = wrote { $out }/cases.json and { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: this commitment is provisional and its seed was exposed; it is not a release holdout

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: the seed is not the one behind this commitment

engine-bench-cli-is-not-json = { $f } is not JSON: { $e }

engine-bench-cli-cannot-read-2 = cannot read { $i }: { $e }

engine-bench-cli-result-rendered = { $results } result(s) rendered

engine-bench-cli-unknown-subcommand =
    unknown subcommand `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = cannot create { $path } (an existing seed file is never overwritten): { $e }

engine-bench-cli-cannot-write-2 = cannot write { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = seed written to { $path }: keep it out of version control and out of any message; only the hash below is public

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (carried, not re-run)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = impairment-eval baseline: { $det }

engine-bench-cli-no-scenario-json-under = no scenario.json under { $root }

engine-bench-cli-is-not-json-2 = { $path } is not JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } mismatched, { $missing } missing, { $unpinned } unpinned

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = unknown split `{ $other }` (dev, test or holdout)

engine-bench-score-for-is-not-finite = score for `{ $id }` is not finite

engine-bench-case-have-no-score-the = { $missing } case(s) have no score, the first is `{ $first_missing }`

engine-bench-predictions-name-case-that-is = predictions name a case that is not in the truth: `{ $extra }`

engine-bench-schema-must-be = `schema` must be `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` must be a 64-digit hex SHA-256

engine-bench-truth-is-not-json = truth is not JSON: { $e }

engine-bench-predictions-are-not-json = predictions are not JSON: { $e }

engine-bench-truth-schema-must-be = truth `schema` must be `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = predictions `schema` must be `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = truth was made under another spec version than { $SPEC_VERSION }; results of different major versions are never mixed

engine-bench-unknown-task = unknown task `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = result { $v1 } is not valid: { $p }

engine-bench-site-result-is-task-holdout-result = result { $v1 } is a task (d) holdout result without a `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = result { $v1 } is scored on a provisional, exposed holdout seed: not a release holdout

engine-bench-site-result-was-scored-under-this = result { $v1 } was scored under { $v }; this page is for { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = score for `{ $k }` is not a number

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (0.35 default monitor statistic)

engine-bench-tasks-malformed-clock-line = malformed clock line `{ $line }`

engine-bench-tasks-the-clock-file-does-not = the clock file does not match the pinned SHA-256 (got { $got }, want { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = satellite { $prn } is not in the clock file

engine-bench-tasks-kshana-bench-baseline = kshana-bench baseline: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = predictions cover { $pmap } cases, the truth has { $tarr }

engine-bench-tasks-case-has-no-number-array = case `{ $id }` has no number array

engine-bench-tasks-case-needs-values-has = case `{ $id }` needs { $n } values, has { $a }

engine-bench-tasks-case-has-non-finite-value = case `{ $id }` has a non-finite value

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialize { $name }: { $e }

engine-e-bin-crossover-study-write = write { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = error: cannot create { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = done: inertial { $nodes } nodes, clock { $curves } curves (seed 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in = { $n } user-epochs x 3 URA values in { $dt } s = { $v1 } ms per user-epoch ({ $ok } solvable)

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = wrote docs/INTEROP.md (export table)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = wrote validation summary to { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = unknown body '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigates around a body other than the Earth with an Earth link; { $name } is not supported here

engine-e-body-pnt-duration-and-step-must-be = duration_s and step_s must be positive with at most 20000 epochs; got { $duration } and { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind must be orbiter or surface; got '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = user altitude must be positive and eccentricity in [0, 0.9)

engine-e-body-pnt-the-user-orbit-periapsis-is = the user orbit's periapsis is below the surface

engine-e-body-pnt-constellation-needs-to-200-satellites = constellation needs 1 to 200 satellites in at least one plane

engine-e-body-pnt-constellation-altitude-must-be-positive = constellation altitude must be positive

engine-e-body-pnt-range-sigmas-must-be-positive = range sigmas must be positive

engine-e-body-pnt-no-earth-position-relative-to = no Earth position relative to { $name } at JD { $jd }

engine-e-body-pnt-serialising-report = serialising report: { $e }

engine-e-body-pnt-the-report-must-serialise-to = the report must serialise to a JSON object

engine-body-pnt-positioning-around-user-relays-at =
    Positioning around { $name } — { $user_kind } user, { $n_relays } relays at { $r } km, { $n_epochs } epochs
    { "  " }Earth light time { $one_way_light_time_s } s one-way, { $two_way_light_time_s } s round trip; Sun-Earth-body angle { $sun_separation_deg } deg
    { "  " }availability: { $availability_relays } constellation only, { $availability_with_earth } with the Earth range (Earth in view { $earth_visibility })
    { "  " }median PDOP { $opt }; RMS error { $opt2 } constellation only, { $opt3 } with the Earth range
    { "  " }median formal sigma { $opt4 } constellation only, { $opt5 } with the Earth range{ "\u000A" }

engine-body-pnt-positioning-around = Positioning around { $name }

engine-body-pnt-user-relays-earth-light-time = { $user_kind } user · { $n_relays } relays · Earth light time { $one_way_light_time_s } s · MODELLED

engine-body-pnt-chart-relays-in-view = relays in view

engine-body-pnt-chart-count = count

engine-body-pnt-chart-formal-one-sigma-position = formal one-sigma position (log10 m): blue constellation only, amber with the Earth range

engine-body-pnt-chart-time-since-epoch = time since epoch, 0 to { $t_max } s

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = E1 scenario is not a table

engine-e-calibration-ensembles-e1-scenario-has-no-monte = E1 scenario has no [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } missing

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 is `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ensembles of 200 realisations each, against the closed form: mean 0, sigma = { $sigma } ns. Ensemble j uses base seed 1 000 000 + 1000 j and bootstrap seed 20260928 + j. The largest relative ADEV error was { $max } for E2 and { $max2 } for E3 (across 1, 10 and 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = empty result path

engine-e-campaign-result-path-has-an-empty = result path `{ $path }` has an empty segment

engine-e-campaign-result-path-bad-index-in = result path `{ $path }`: bad index in `{ $part }`

engine-e-campaign-result-path-no-field = result path `{ $path }`: no field `{ $name }`

engine-e-campaign-result-path-indexed-value-is = result path `{ $path }`: indexed value is not an array

engine-e-campaign-result-path-index-out-of = result path `{ $path }`: index { $i } out of range ({ $n })

engine-e-campaign-result-path-value-is-not = result path `{ $path }`: value is not a number or a flag

engine-e-campaign-result-path-is-not-an = result path `{ $path }`: `{ $k }` is not an array

engine-e-campaign-result-path-must-name-one = result path `{ $path }` must name one value, not rows

engine-e-campaign-result-path-is-not-an-2 = result path `{ $path }`: `{ $name }` is not an array

engine-e-campaign-metric-path-has-no-entry = metric path `{ $path }` has no entry in that kind's units block; declare its `unit` in the campaign

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` must be non-empty letters, digits, `_` or `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: a campaign cannot contain a campaign

engine-e-campaign-serialise = { $label }: serialise: { $e }

engine-e-campaign-result-did-not-parse = { $label }: result did not parse: { $e }

engine-e-campaign-seed-key-no-field-in = seed key `{ $key }`: no field `{ $part }` in the scenario

engine-e-campaign-seed-key-is-not-non = seed key `{ $key }` is not a non-negative integer

engine-e-campaign-seed-does-not-fit-toml = seed { $seed } does not fit a TOML integer

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = time path `{ $t }` must name rows with `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` is not below, above or abs_above

engine-campaign-threshold-is-null = threshold `{ $p }` is null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` is not mean, min, max or count

engine-campaign-time-path-gives-several-values = time path `{ $t }` gives several values per row

engine-campaign-value-path-has-fewer-rows = value path `{ $y }` has fewer rows than `{ $t }`

engine-campaign-value-path-has-rows-time = value path `{ $y }` has { $r } rows, time path `{ $t }` has { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = a campaign with phases needs a [timeline] with step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s must be positive, got { $step }

engine-e-campaign-phase-is-named-twice = phase `{ $name }` is named twice

engine-e-campaign-phase-duration-must-be-non = phase `{ $name }`: duration_s must be non-negative

engine-e-campaign-phase-has-no-runs = phase `{ $name }` has no runs

engine-e-campaign-phase-the-first-phase-has = phase `{ $name }`: the first phase has nothing to hand on from

engine-e-campaign-phase-handoff-from-channel-which = phase `{ $name }`: handoff from channel `{ $ch }`, which the previous phase did not end with

engine-e-campaign-phase-handoff-from-run-does = phase `{ $name }`: handoff from_run { $from_run } does not exist

engine-e-campaign-phase-handoff-is-null = phase `{ $name }`: handoff `{ $from }` is null

engine-e-campaign-phase-handoff-run-does-not = phase `{ $name }`: handoff run { $run } does not exist

engine-e-campaign-phase = phase `{ $name }`: { $e }

engine-campaign-phase-run = phase { $name }/run { $ri }

engine-e-campaign-phase-end-at-run-does = phase `{ $name }`: end_at_run { $end_at_run } does not exist

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s is later)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } is null)

engine-e-campaign-phase-side-is-not-classical = phase `{ $name }`: side `{ $side }` is not classical or quantum

engine-e-campaign-phase-skip-must-be-non = phase `{ $name }`: skip_s must be non-negative

engine-e-campaign-phase-alarm-compare-is-not = phase `{ $name }`: alarm compare `{ $compare }` is not below, above or abs_above

engine-e-campaign-phase-alarm-threshold-is-null = phase `{ $name }`: alarm threshold `{ $p }` is null

engine-e-campaign-phase-channel-is-in-not = phase `{ $name }`: channel `{ $channel }` is in { $u }, not { $du }

engine-e-campaign-phase-channel-needs-unit = phase `{ $name }`: channel `{ $channel }` needs a unit

engine-e-campaign-phase-two-runs-both-provide = phase `{ $name }`: two runs both provide channel `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = phase `{ $name }` carries `{ $ch }`, which the previous phase did not end with

engine-e-campaign-phase-carries-but-no-run = phase `{ $name }` carries `{ $ch }` but no run of it provides `{ $ch }`

engine-e-campaign-channel-is-in-in-one = channel `{ $name }` is in { $unit } in one phase and { $unit2 } in another

engine-e-campaign-at-least-one-metric-is = at least one metric is needed

engine-e-campaign-metric-is-named-twice = metric `{ $name }` is named twice

engine-e-campaign-seed-overflow-in-the-ensemble = seed overflow in the ensemble

engine-e-campaign-an-ensemble-needs-at-least = an ensemble needs at least one run

engine-e-campaign-sweep-takes-one-to-three = a sweep takes one to three axes, got { $axes }

engine-e-campaign-axis-is-named-twice = axis `{ $name }` is named twice

engine-e-campaign-axis-needs-at-least-two = axis `{ $name }` needs at least two steps

engine-e-campaign-axis-scale-must-be-lin = axis `{ $name }`: scale must be lin or log

engine-e-campaign-axis-log-axis-needs-positive = axis `{ $name }`: a log axis needs positive ends

engine-campaign-sweep-node = sweep node { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs must be at least two

engine-e-campaign-compose-needs-at-least-one = compose needs at least one member

engine-e-campaign-shared-value-must-be-number = shared value `{ $name }` must be a number or numbers

engine-e-campaign-shared-value-is-named-twice = shared value `{ $name }` is named twice

engine-e-campaign-member-binds-unknown-shared = member `{ $label }` binds unknown shared `{ $name }`

engine-e-campaign-member = member `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = metric `{ $name }` is in { $u } for one member and { $unit } for `{ $label }`

engine-e-campaign-member-is-named-twice = member `{ $label }` is named twice

engine-e-campaign-invalid-campaign-scenario = invalid campaign scenario: { $e }

engine-e-campaign-invalid-campaign = invalid campaign: { $e }

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } of { $what } across the realisations

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = value of { $ch } at the end of the previous phase, added to this phase's { $ch }

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } on the timeline grid: the latest sample of the owning phase's run at or before each grid time (zero-order hold); null where no run of that phase provides it

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = values of the scenario key { $key } along axis { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = value of the scenario key { $key } at this node

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } of the node's result

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } of each realisation, in seed order

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = shared value { $name }, written into every member that binds it

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = metric { $name } read from the member's result

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = smallest { $name } across the members

engine-campaign-largest-across-the-members = largest { $name } across the members

engine-campaign-mean-across-the-members = mean { $name } across the members

engine-e-campaign-failed-to-serialise-campaign-result = failed to serialise campaign result: { $e }

engine-campaign-chain-phases-over-events-alarm = chain: { $phases } phases over { $duration_s } s, { $events } events, alarm raised on { $alarm_s } s of the grid

engine-campaign-sweep-of-nodes-over = sweep of `{ $scenario_kind }`: { $nodes } nodes over [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = monte carlo of `{ $scenario_kind }`: { $runs } seeds

engine-campaign-compose-members = compose: { $members } members

engine-campaign-member-runs-modelled = { $runs_total } member runs (MODELLED)

engine-campaign-sweep-of-over-nodes-each = sweep of `{ $scenario_kind }` over { $axis_order } ({ $nodes } nodes{ $v4 }; each line on its own range)

engine-campaign-campaign-modelled-composition-every-value = campaign { $r } | MODELLED composition; every value read from a real run of the named kind

engine-campaign-chart-clock-time-error-vs-guard = clock time error vs guard (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 vs tracking floor (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = protection level vs alert limit (m)

engine-campaign-chart-position-error-vs-threshold = position error vs threshold (m)

engine-campaign-chart-satellites-tracking = satellites tracking

engine-campaign-chart-alarm-flags-and-events = alarm flags and events

engine-campaign-chart-mission-time = { $duration } s mission time

engine-campaign-chart-sweep-percentile-band = , median with 5th-95th percentile band over { $n_runs } seeds

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) at { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo of `{ $scenario_kind }`: { $n_runs } seeds from { $base_seed } (5th, 50th, 95th percentile; bar = bootstrap 95% confidence interval on the mean)

engine-campaign-chart-composed-members = composed members under shared conditions: { $shared }

engine-campaign-chart-not-available = n/a

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = an optimisation takes one to three params, got { $params }

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` is named twice

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: needs finite lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale must be lin or log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: a log param needs positive bounds

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start must lie in [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: a grid needs steps of at least two

engine-e-campaign-optimize-objective-target-is-only-read = objective.target is only read with goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" needs a finite objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal must be minimize, maximize or target, got `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = a grid of { $total } nodes is above the 100000 limit

engine-e-campaign-optimize-params-steps-is-only-read = params.steps is only read with method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals must cover the initial simplex (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step must lie in (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol and xtol must be non-negative

engine-e-campaign-optimize-method-must-be-grid-or = method must be grid or nelder-mead, got `{ $other }`

engine-campaign-optimize-optimize-eval = optimize eval { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = lower bound of the scenario key { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = upper bound of the scenario key { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = value of the scenario key { $key } at the best evaluation

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = value of the scenario key { $key } at this evaluation

engine-campaign-optimize-target-value-of = target value of { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } at the best evaluation

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } of this evaluation (the seed mean when runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) of `{ $scenario_kind }` by { $method }: { $evals } evals ({ $stop_reason }), best { $o2 } at [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START before CCSDS_TDM_VERS header

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: malformed header line: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: malformed metadata line: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: malformed data line: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: unrecognised data keyword { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: data line { $k } missing epoch

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: data line { $k } missing value

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: data line { $k } bad value { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: unterminated segment (missing META_STOP/DATA_STOP)

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: bad TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: bad TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = unknown observable `{ $other }`: expected one of range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = unknown coordinates `{ $other }`: expected one of cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours must be finite and positive, got { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs must be ≥ 2, got { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps must be ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials must be ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations must be ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd must be finite and positive, got { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor must be finite and positive, got { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km must be finite and positive, got { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m must be finite and positive, got { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s must be finite and positive, got { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = the constellation must carry at least a chief and one reference

engine-e-cislunar-arc-recovery-family-is-an-out-of = family `{ $family }` is an out-of-plane family and has no planar four-state representation: set spatial = true to sweep it

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = the forward model produced a non-finite truth measurement

engine-cislunar-arc-recovery-first-arc-length-at-which = first arc length at which EVERY seeded trial's noise-free batch solve drives the final state error to at most { $recovery_factor } times the a-priori displacement it started from. This is the recovery analogue of the rank criterion: with exact measurements the question `is the state observable?` becomes `can an estimator get it back?`, and no singular-value tolerance enters the answer.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = first arc length at which the Monte-Carlo RMS position recovery error over { $trials } seeded noise realisations falls to or below { $error_bound_km } km. This is the recovery analogue of the estimability criterion, measured rather than predicted: the error is the distance from the estimate to the known truth, not the trace of a formal covariance.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED within one epoch-grid step: the estimator recovers from { $e } h, the Gramian rank criterion turns at { $g } h (ratio { $v1 }, grid { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED as a recoverability boundary: the estimator recovers from { $e } h, { $v1 } the Gramian rank criterion's { $g } h (ratio { $v2 }, grid { $grid_hours } h). The rank criterion is a relative singular-value convention; the recovery boundary is a measured state error, and the two do not coincide here.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: the estimator never meets its recovery bound on this arc, while the Gramian rank criterion turns at { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = the Gramian rank criterion is never met on this arc (the geometry never reaches full rank), while the estimator recovers from { $e } h — the two disagree about whether a boundary exists at all.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | { $family } family, { $state_dim }-state, { $n_spacecraft } s/c, { $observable } observable, { $coordinates } parameterisation | { $arc_hours } h arc, { $epochs } epochs (grid { $grid_hours } h), { $trials } trials, seed { $seed } | finite-difference partials, no analytic Jacobian / STM / SVD / SRIF | noise-free recovery from { $nf } (factor { $recovery_factor }) vs Gramian rank threshold { $gram } | Monte-Carlo estimability from { $est } (RMS pos ≤ { $error_bound_km } km, σ { $sigma_range_m } m) vs Gramian estimability { $gram_est } | end-of-arc RMS pos { $last } km

engine-cislunar-arc-recovery-chart-title = Cislunar arc-length recovery — an estimator that does not share the Jacobians

engine-cislunar-arc-recovery-chart-subtitle = finite-difference batch least squares · measured state recovery error · no analytic Jacobian, no variational STM, no SVD rank tolerance

engine-cislunar-arc-recovery-chart-bound = bound { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = Gramian rank threshold

engine-cislunar-arc-recovery-chart-monte-carlo-rms = Monte-Carlo RMS position recovery error (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = noise-free worst recovery ratio (final error / displacement)

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = unknown family `{ $other }`: expected one of dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO at crossing distance { $d } did not differential-correct

engine-e-cislunar-observability-member-at-x0-did-not = { $label } member { $i } at x0 = { $x0 } did not differential-correct

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft must be between 2 and { $MAX_SPACECRAFT }, got { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs must be ≥ 2, got { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol must be finite and positive, got { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m must be finite and non-negative, got { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km must be finite and positive, got { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } s/c ({ $refs } refs) | { $arc_hours } h arc, { $rank_arc } epochs | rank { $first } → { $last } of { $state_dim } over arc | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | instantaneous rank range-only { $rank_range_only } → range+rate { $rank_range_rate } ({ $n_links } links) | GDOP range-only { $ro } range+rate { $rr } | DRO ICs (max periodicity residual { $max_resid }) | SRIF posterior finite at rank-4 epoch { $srif_epoch } (Validated rank/STM/DRO-closure/SRIF, Modelled design)

engine-cislunar-observability-never-rank-of = never (rank { $rank } of { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | { $family } family, { $state_dim }-state, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | rank threshold { $rank_thr } (grid { $c } h) | estimability threshold (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = first arc length at which the formal 1σ position uncertainty of the chief's INITIAL state, σ_pos = sqrt(trace(P_rr)) with P = (ÕᵀÕ)⁻¹ and Õ the measurement-noise-whitened observability matrix, falls to or below { $sigma_pos_threshold_km } km. This is the criterion under which an arc-length threshold is noise-dependent at all: P scales as σ², so σ_pos scales as σ, whereas the rank criterion above does not move with σ. The bound is a STATED engineering choice, not a fitted one — estimability_sweep reports the threshold at four other bounds.

engine-cislunar-observability-extension-r3-this-run-is = EXTENSION (R3) — this run is NOT the planar DRO configuration the `label` above describes. State dimension { $state_dim }; orbit family { $family }; { $n_spacecraft } spacecraft; range measurement sigma { $sigma_range_m } m. Where `label` says "planar" and "planar DROs", read the family named here. VALIDATED additions: the 6x6 variational STM is the same finite-difference-validated CR3BP STM (crate::cr3bp) used at full width; the spatial range / range-rate Jacobian rows are finite-difference-validated analytic partials, the range-rate row cross-checked component-for-component against the crate's independent 3-D deepspace_od::range_rate_observable; the halo / NRHO initial conditions are differential-corrected periodic orbits from the same corrector that reproduces the published L2 southern 9:2 NRHO, continued from that published seed, and each member's closure residual is reported; the six-state RANK verdicts are confirmed against an INDEPENDENT row-echelon rank (Gaussian elimination with partial pivoting) that shares no code with the eigen/SVD route. HONEST SCOPE OF THE SRIF LEG: the SRIF cross-validation above consumes the SAME measurement Jacobians and reduces to the same O^T O, so its agreement is a consistency check between two numerical machines, NOT independent corroboration of the threshold — it is not counted as validation of any figure here. MODELLED: the family design (which abscissae, amplitudes and phases), the epoch grid, the single-link arc, and the stated position bound of the estimability criterion.

engine-cislunar-observability-validated-each-constellation-initial-condition = Validated: each constellation initial condition is a differential-corrected periodic orbit of the { $family } family, closing over one period to the reported periodicity residual (planar DROs are additionally retrograde about the Moon). The family is corrected at the Earth-Moon mass ratio. Modelled: the choice of family parameters and phases (the constellation design). The key name `dro_provenance` is retained for the released document schema; it carries whichever family this run asked for.

engine-cislunar-observability-chart-title = Cislunar observability over a tracking arc (P6)

engine-cislunar-observability-chart-subtitle = rank-vs-arc (range-only single link) · Gramian eigen-spectrum · differential-corrected DRO ICs + SRIF cross-check · { $modelled } design, { $validated } rank/STM/closure

engine-cislunar-observability-chart-observable-rank = observable rank vs arc length

engine-cislunar-observability-chart-arc-length = arc length (rotating-frame time units, { $arc_hours } h total)

engine-cislunar-observability-chart-gramian-eigenvalues = Gramian eigenvalues (log10)

engine-cislunar-observability-chart-condition = condition κ = { $condition }

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } must be finite and positive, got { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } must lie in (0, 1), got { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg must lie in [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems must name at least one preset

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias needs finite bias_m, t0_s and t1_s

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch = integrity: { $n } epochs exceed the { $MAX_EPOCHS }-epoch cap; raise step_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: no records

engine-e-clock-library-card-records-at-different-tau0 = { $name }: records at different tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: periodic least squares failed

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: { $used } stability points with edf >= { $MIN_FIT_EDF }; a card needs three

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = gaps { $g }, phase outliers { $o }, phase steps { $p }, bursts { $b }, frequency steps { $f } (robust sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` is not a non-negative integer

engine-e-compliance-is-missing = `{ $p }` is missing

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } exceeds events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } exceeds predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: receiver-trust counts malformed ({ $malformed_counts }); excluded

engine-e-compliance-not-json = { $label }: not JSON: { $e }

engine-compliance-cannot-read = { $label }: cannot read: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: the sibling scenario says kind `{ $s }` but the result says `{ $o }`; not used

engine-e-compliance-scenario-kind-not-found-no = { $label }: scenario kind not found (no sibling scenario file, not a receiver-trust result, no top-level `kind`)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` is not a scenario kind the engine knows; not used

engine-compliance-written-by-kshana = Written by kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } test(s) with every stated bar met, { $not_met } with a bar not met, { $needs_input } needing input.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = intensity grid must have finite min < max, got [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = intensity grid needs >= 2 steps, got { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = correlation grid must have at least one value

engine-e-conflict-resilience-correlation-values-must-lie-in = correlation values must lie in [0, 1], got { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience needs at least one layer

engine-e-conflict-resilience-layer-availability-not-in = layer { $i } availability { $availability } not in [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = layer { $i } sigma_m must be finite and positive

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = layer { $i } vulnerability must be finite and >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = layer { $i } vector_weight must be finite and >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } out of range (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials must be >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } layers ({ $primary } baseline) | reference intensity { $reference_intensity } | resilience ratio closed-form { $ratio_closed_form }x MC { $ratio_mc_independent }x (layered vs single-layer) | correlation defeats layering: ratio { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | prior CI [{ $ratio_lo }-{ $ratio_hi }]x | per-vector survival @ ref jam { $surv }% spoof { $surv2 }% kinetic { $surv3 }% cyber { $surv4 }% (sharpest { $sharpest }) | ~7x headline MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

engine-conflict-resilience-chart-title = Layered-PNT conflict resilience (P7)

engine-conflict-resilience-chart-subtitle = total-loss vs threat intensity (MC vs closed form) · resilience ratio vs denial correlation · { $modelled } priors, { $validated } MC->closed-form / copula marginals

engine-conflict-resilience-chart-total-loss-probability = total-loss probability vs intensity

engine-conflict-resilience-chart-threat-intensity = threat intensity

engine-conflict-resilience-chart-layered-mc = layered MC

engine-conflict-resilience-chart-single-layer = single layer

engine-conflict-resilience-chart-resilience-ratio = resilience ratio vs denial correlation

engine-conflict-resilience-chart-denial-correlation = denial correlation ρ

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = unknown central body { $name }: expected a planet, Pluto, the Moon or a major moon (earth, moon, mars, europa, titan, ...; see crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = a Walker shell needs total > 0 and planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walker total { $total } is not a multiple of planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = Walker phasing F = { $phasing } must lie in 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } is not an expandable GPS slot (SPS PS Table 3.2-2 lists B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: give altitude_km or semi_major_axis_km, not both

engine-e-constellation-needs-altitude-km-or-semi = { $what }: needs altitude_km or semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: semi-major axis { $v1 } km is not above the { $name } radius

engine-e-constellation-eccentricity-must-lie-in = { $what }: eccentricity { $e } must lie in [0, 0.9)

engine-e-constellation-perigee-is-below-the-surface = { $what }: perigee is below the { $name } surface

engine-e-constellation-constellation-preset-is-an-earth = constellation { $name }: preset { $p } is an Earth constellation, the body is { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = constellation { $name }: unknown preset { $other } (expected gps-baseline, gps-expandable, galileo, beidou, beidou-meo or glonass)

engine-e-constellation-constellation-expanded-applies-only-to = constellation { $name }: `expanded` applies only to the gps-expandable preset

engine-constellation-constellation-shell = constellation { $name } shell { $v2 }

engine-constellation-explicit-element-sets = { $satellite } explicit element sets

engine-constellation-constellation-satellite = constellation { $name } satellite { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = constellation { $name } has no satellites: give a preset, a [[constellation.shell]] or a [[constellation.satellite]]

engine-e-constellation-no-constellation-given = no constellation given

engine-e-constellation-constellations-with-one-clock-each = { $constellations } constellations with one clock each exceeds the { $MAX_CLOCKS }-clock limit; use clock = "common" or merge constellations

engine-e-constellation-must-be-finite = { $what } must be finite

engine-e-constellation-need-step-and-duration-step = need step_s > 0 and duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = more than 100 000 epochs; raise step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg must lie in [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold must be positive

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg must lie in [0.25, 90]

engine-e-constellation-need-90-lat-min-deg = need -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = need lon_min_deg < lon_max_deg spanning at most 360 deg

engine-e-constellation-give-at-least-one-constellation = give at least one [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points is capped at 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } satellites exceeds the 50 000 limit

engine-constellation-constellation-design-satellites-around-the = constellation-design: { $total } satellites ({ $names }) around the { $name }; availability { $global_availability_pct }% (PDOP <= { $pdop_threshold } at { $mask_deg } deg mask), worst site { $worst_site_availability_pct }%, median PDOP { $cov }, mean { $global_mean_visible } in view; { $grid_points } grid points x { $epochs } epochs (MODELLED)

engine-constellation-constellation-coverage-over-the = Constellation coverage over the { $name }

engine-constellation-chart-availability-pct = availability (%)

engine-constellation-chart-mean-pdop = mean PDOP

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } must be finite and positive

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } must be finite and >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw must be finite

engine-e-contact-schedule-satellite-altitude-km-must-be = satellite '{ $name }': altitude_km must be in (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satellite '{ $name }': inclination_deg must be in [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satellite '{ $name }': backlog_mbit must be >= 0

engine-e-contact-schedule-satellite-priority-must-be = satellite '{ $name }': priority must be > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satellite '{ $name }': eirp_dbw must be finite

engine-e-contact-schedule-station-lat-deg-in-90 = station '{ $name }': lat_deg in [-90, 90], lon_deg finite

engine-e-contact-schedule-station-mask-deg-must-be = station '{ $name }': mask_deg must be in [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = station '{ $name }': alt_m must be in [0, 3000] (ITU-R P.834 range)

engine-e-contact-schedule-station-setup-and-over-db = station '{ $name }': setup_s >= 0 and g_over_t_db finite

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours must be in (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s must be in (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = at least one satellite and one station are required

engine-e-contact-schedule-at-most-32-satellites-and = at most 32 satellites and 32 stations

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: { $satellites } satellites x { $stations } stations over { $duration_hours } h -> { $cands } candidate contacts, { $greedy } scheduled; { $total_del } of { $total_backlog } Mbit delivered{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: { $pairs } pass(es); ACM { $acm } Mbit vs CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = need at least 2 trials and a finite sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total must be in (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = no local frame at the user

engine-e-dop-error-ci-singular-geometry = { $name }: singular geometry

engine-e-dop-error-ci-no-noise-free-fix = { $name }: no noise-free fix

engine-e-dop-error-ci-no-fix = { $name }: no fix

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singular geometry

engine-e-dop-error-mc-no-fix = { $label }: no fix

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km must be positive; got { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes and sats_per_plane must both be non-zero

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz must be positive; got { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency must be in (0, 1]; got { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k must be positive; got { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db must be non-negative; got { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m must be outside the Earth; got { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance = Earth-GNSS at lunar distance — { $n_satellites } satellites, receiver at { $r } km{ "\u000A" }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Earth limb from the constellation: { $earth_limb_half_angle_deg } deg off nadir — any lunar-bound ray must exceed this{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_geometrically_visible } of { $n_satellites } not occulted; { $n_trackable } clear the { $tracking_threshold_dbhz } dB-Hz tracking threshold{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }best link { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }every trackable line of sight lies inside a { $a } deg half-cone — the geometry is nearly degenerate{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }SWEEP over { $epochs } epochs / { $span_s } s: signal availability { $signal_availability }, FIX availability { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }trackable links mean { $mean_trackable }, max { $max_trackable }; best C/N0 { $w }; best PDOP { $w2 }{ "\u000A" }

engine-earth-gnss-lunar-chart-title = Earth-GNSS at lunar distance — C/N0 against off-boresight angle

engine-earth-gnss-lunar-chart-track-threshold = track { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = Earth limb { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = off-boresight angle (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = gold = trackable · red = too weak · grey = Earth-occulted · { $modelled } transmit pattern

## src/ensemble.rs

engine-ensemble-chart-title = Clock holdover: timing-error confidence band ({ $n_runs } runs)

engine-ensemble-chart-timing-error-ns = timing error (ns)

engine-ensemble-chart-spec-threshold = spec { $threshold } ns

engine-ensemble-chart-time-s = time (s)

engine-ensemble-chart-classical-median-band = classical: { $id } (median, 5-95% band)

engine-ensemble-chart-quantum-median-band = quantum: { $id } (median, 5-95% band)

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = between one and six stages are required

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg must be finite and non-negative

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 must be finite and non-negative

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg must be finite and non-negative

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m must be finite and non-negative

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg must be in [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s must be finite and non-negative

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = lift-off thrust-to-weight { $tw } must exceed 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ideal dv { $ideal_dv_m_s } m/s, losses { $losses } m/s (gravity { $gravity_loss_m_s }, drag { $drag_loss_m_s }, steering { $steering_loss_m_s }, back-pressure { $back_pressure_loss_m_s }); burnout { $r } km at { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } must be finite and positive

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body must be "earth" or "mars", got "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = atmosphere "{ $a }" is not available for body "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg must be in (0, 90) (positive downward)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m must be in [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg must be finite with |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg and longitude_deg must be finite

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag must be in [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg must be finite

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s must be in (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m must be in [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s must be in (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame must be inertial|relative, got "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> peak { $pk_g } g at { $r } km, peak q { $r2 } W/cm² at { $r3 } km, heat load { $r4 } J/cm², peak q_dyn { $r5 } kPa; { $outcome } at { $end_time_s } s (closed form { $cf_g } g; MODELLED 3-DoF, no radiative/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } must be in (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } must be finite and non-negative

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg must be in [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits must be in 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (well { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = nadir angle { $eta_rad }° exceeds the Earth angular radius { $rho }° (misses Earth)

engine-e-eo-payload-no-sun-synchronous-inclination-at = no sun-synchronous inclination at { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg must be in (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad must be finite and positive

engine-e-eo-payload-half-fov-too-large = half_fov too large: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> { $v3 } km swath, { $gsd } m nadir GSD, access to { $v5 } km off-nadir; node spacing { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Earth-Moon barycentre from { $table }, split by the Montenbruck & Gill lunar series precessed to J2000

engine-ephem-provider-jpl-mean-elements-in-the = JPL mean elements in the Laplace plane, mean-longitude rate from the IAU synchronous rotation rate, added to its planet from { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = IAU synchronous-rotation direction at the JPL mean distance, added to Saturn from { $table }

engine-e-ephem-provider-read = read { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = TLE is missing line 1 (a line starting `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE is missing line 2 (a line starting `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = an analytic `orbit` ephemeris requires an `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = ephemeris scenario needs either a `tle` or an `orbit`

engine-e-ephemeris-step-must-be-positive = step_s must be positive

engine-e-ephemeris-duration-must-be-non-negative = duration_s must be non-negative

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz must be a positive, finite frequency

engine-ephemeris-ground-track-samples-alt-km = { $source } ground track · { $n_samples } samples · alt { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` is not finite

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` is neither seconds nor an ISO-8601 UTC time

engine-e-evidence-assemble-no-epoch-of-the-log = no epoch of the log falls between { $t0 } s and { $t1 } s (the log spans 0 to { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config is not an object

engine-e-evidence-assemble-config-json-already-has-an = config.json already has an entry `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = from { $from_s } to { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` is not a UTC time like 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } in a log of { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } needs a value

engine-e-evidence-cli-cannot-create = cannot create { $path }: { $e }

engine-e-evidence-cli-cannot-write = cannot write { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = warning: { $path } is readable by other users; restrict it (chmod 600)

engine-e-evidence-cli-cannot-read-key = cannot read key { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } is not a hex key

engine-e-evidence-cli-must-hold-32-byte-key = { $path } must hold a 32-byte key as 64 hex digits

engine-e-evidence-cli-cannot-read = cannot read { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = cannot read { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } exists and is not empty

engine-e-evidence-cli-cannot-create-2 = cannot create { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = warning: { $arg } is owner-only (mode 600) and not named *.pub: it may be a private key. Pass the public key file.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` is neither 64 hex digits nor a readable file ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` does not hold hex digits

engine-evidence-cli-private-key-keep-it-secret = private key: { $out }  (keep it secret; never commit it)

engine-evidence-cli-public-key-pub = public key:  { $out }.pub

engine-evidence-cli-public-key-hex = public key (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Give verifiers the public key by a route they trust; they pin it with --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify needs a bundle directory

engine-e-evidence-cli-cannot-read-3 = cannot read { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: no PEM certificate found

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }timestamp authority signature not verified by Kshana

engine-evidence-cli-this-is-technical-record-not = This is a technical record, not a legal opinion.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp needs a bundle directory

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp needs a token file

engine-e-evidence-cli-cannot-read-4 = cannot read { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = cannot write { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = note: the token sits beside the signed manifest, not inside it; verify with --require-timestamp to insist on it.

engine-e-evidence-cli-round-trip-packs-are-not = round-trip packs are not built for WebAssembly

engine-e-evidence-cli-needs-scenario-path = needs a scenario path

engine-e-evidence-cli-needs-from = needs --from

engine-e-evidence-cli-needs-to = needs --to

engine-e-evidence-cli-cannot-read-lab-attestation = cannot read lab attestation { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = cannot read { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = invalid receiver-trust scenario: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation applies to `receiver-trust evidence`, not to `evidence round-trip` (whose pack records the test conditions)

engine-e-evidence-cli-cannot-read-6 = cannot read { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = cannot read { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = evidence pack written to { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epochs in window: { $epochs_in_window }  ({ $from_s } s to { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }signer fingerprint: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 of manifest.json (what an RFC 3161 authority should stamp): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }log slice: bytes { $a } to { $b } of { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }log slice: whole log (this log gives no byte range for the window)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }lab attestation recorded in the signed manifest ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = A pack is a technical record, not a legal opinion.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s to { $to_s } s after the first epoch of the log

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = invalid lab-attestation TOML: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` must be a table

engine-e-evidence-lab-invalid-lab-attestation = invalid lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } is required

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } is over { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: date { $date } is not a day like 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: a shielded setup needs enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup must be "conducted" or "shielded" (got { $other }); an over-the-air setup is not accepted as a lab run

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db must be finite

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = the test conditions state { $events } event(s) but the scoring scenario has { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = event '{ $id }' in the test conditions ({ $onset_s } s to { $offset_s } s) does not match '{ $label }' in the scoring scenario ({ $onset_s2 } s to { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = the log's SHA-256 ({ $have }) is not the one the test conditions state ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = truncated DER

engine-e-evidence-tsa-bad-der-length = bad DER length

engine-e-evidence-tsa-unexpected-der-tag = { $what }: unexpected DER tag { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = empty AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = bad UTCTime

engine-e-evidence-tsa-bad-generalizedtime = bad GeneralizedTime

engine-e-evidence-tsa-bad-time = bad time

engine-e-evidence-tsa-time-not-in-utc = time not in UTC

engine-e-evidence-tsa-bad-time-digits = bad time digits

engine-e-evidence-tsa-bad-bit-string = bad BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: three elements expected

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: too short

engine-e-evidence-tsa-empty-extension = empty Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: value not an OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: empty

engine-e-evidence-tsa-validity-short = Validity: short

engine-e-evidence-tsa-pem-end-without-begin = PEM: END without BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: bad base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: bad base64 length

engine-e-evidence-tsa-spki-empty = SPKI: empty

engine-e-evidence-tsa-spki-no-oid = SPKI: no OID

engine-e-evidence-tsa-spki-no-key = SPKI: no key

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: two integers expected

engine-e-evidence-tsa-unsupported-elliptic-curve = unsupported elliptic curve

engine-e-evidence-tsa-unsupported-public-key-algorithm = unsupported public-key algorithm

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA key or signature too large

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA modulus not odd

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA signature out of range

engine-e-evidence-tsa-rsa-key-too-small = RSA key too small

engine-e-evidence-tsa-invalid-padding = invalid padding

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: encoded message too long

engine-e-evidence-tsa-last-octet-invalid = last octet invalid

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: leftmost bits not zero

engine-e-evidence-tsa-pss-bad-padding = PSS: bad padding

engine-e-evidence-tsa-pss-signature-mismatch = PSS: signature mismatch

engine-e-evidence-tsa-unsupported-mask-generation-function = unsupported mask generation function

engine-e-evidence-tsa-mgf1-without-hash = MGF1 without a hash

engine-e-evidence-tsa-bad-pss-salt-length = bad PSS salt length

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = an ECDSA signature needs an EC key

engine-e-evidence-tsa-an-rsa-signature-needs-an = an RSA signature needs an RSA key

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption without a digest algorithm

engine-e-evidence-tsa-an-rsa-pss-signature-needs = an RSA-PSS signature needs an RSA key

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey without a digest algorithm

engine-e-evidence-tsa-unsupported-signature-algorithm = unsupported signature algorithm

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: empty

engine-e-evidence-tsa-time-stamp-request-not-granted = time-stamp request not granted

engine-e-evidence-tsa-no-time-stamp-token-in = no time-stamp token in the response

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = not a TimeStampResp or TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = not CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: no content

engine-e-evidence-tsa-signeddata-short = SignedData: short

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: empty

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = encapsulated content is not a TSTInfo

engine-e-evidence-tsa-no-tstinfo = no TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo not in an OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: short

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: no genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: no signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = exactly one SignerInfo expected

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: no sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: no digest algorithm

engine-e-evidence-tsa-signerinfo-short = SignerInfo: short

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: no signed attributes

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: no signature algorithm

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: no signature

engine-e-evidence-tsa-no-serial = no serial

engine-e-evidence-tsa-signer-certificate-not-found = signer certificate not found

engine-e-evidence-tsa-attribute-empty = Attribute: empty

engine-e-evidence-tsa-attribute-no-values = Attribute: no values

engine-e-evidence-tsa-attribute-no-value = Attribute: no value

engine-e-evidence-tsa-content-type-attribute-mismatch = content-type attribute mismatch

engine-e-evidence-tsa-digest-failure = digest failure

engine-e-evidence-tsa-signature-not-an-octet-string = signature not an OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = ess signing certificate attribute missing

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: empty

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id not found

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: no hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = unsuitable certificate purpose

engine-e-evidence-tsa-certificate-is-not-yet-valid = certificate is not yet valid

engine-e-evidence-tsa-certificate-has-expired = certificate has expired

engine-e-evidence-tsa-invalid-ca-certificate = invalid CA certificate

engine-e-evidence-tsa-certificate-chain-too-long = certificate chain too long

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: empty

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: no digest

engine-e-evidence-tsa-message-imprint-mismatch = message imprint mismatch

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = indefinite-length BER is not supported

engine-e-evidence-tsr-expected-tag-found = expected { $what } (tag { $tag }), found { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = malformed PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = the timestamp response was not granted

engine-e-evidence-tsr-not-timestamp-token = not a timestamp token

engine-e-evidence-tsr-the-token-content-type-is = the token's content type is not CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = the token does not carry a TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = message imprint uses an unsupported hash algorithm

engine-e-evidence-tsr-the-imprint-is-bytes-not = the imprint is { $digest } bytes, not the { $want_len } { $hash_alg } gives

engine-e-evidence-tsr-gentime-is-not-utc = genTime is not UTC

engine-e-evidence-tsr-malformed-gentime = malformed genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime is not a real calendar time

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = not lower-case hex

engine-e-evidence-verify-expected-bytes-found = expected { $N } bytes, found { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = the pack already has a timestamp token; pass --replace to replace it

engine-e-evidence-verify-not-attached-the-pack-with = not attached: the pack with this token does not verify ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = the pack records a lab attestation by { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = the signature file does not end with a newline

engine-evidence-verify-signer-not-pinned-the-signature = signer not pinned: the signature proves the pack is intact against key { $r }, which the pack names itself. Compare that fingerprint with one you got from the signer, or pass the key.

engine-evidence-verify-range-is-not-inside-log = range { $start }..{ $end } is not inside a log of { $full_bytes } bytes

engine-evidence-verify-timestamp-token-states-its-imprint = timestamp token states { $gen_time }; its imprint { $v2 } manifest.json. Timestamp authority signature not verified by Kshana: check it with `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = timestamp token states { $gen_time }; its imprint { $v2 } manifest.json; the timestamp authority's signature and chain { $v3 } against the anchors given.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` is the empty string

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } is outside the vocabulary

## src/fom_label.rs

# The validation-tier words. The glossary: one message per word, shown next to a figure of merit in the study report and the run summary.
engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Real-time frame / EOP prediction budget for lunar timing

engine-frame-eop-chart-ut1-error-ms = UT1 error (ms)

engine-frame-eop-chart-position-at-moon-m = position at Moon (m)

engine-frame-eop-chart-equiv-timing-ns = equiv. timing (ns)

engine-frame-eop-chart-prediction-horizon-days = prediction horizon (days)

engine-frame-eop-chart-iers-final-floor = IERS final floor { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m at Moon

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = cost bracket must be finite, non-negative, ordered low≤nominal≤high, and carry a source

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction and availability must be fractions in [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } must be finite and > 0, got { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } must be finite and >= 0, got { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg must be in [-90, 90), got { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = constellation has no satellites

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats must be >= 1 when set

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = slip satellite { $sat } out of range

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = 17-state hybrid UKF — filter self-consistency (modelled)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + innovation-whiteness vs 95% χ² bands; 1.0 = consistent. Self-consistency, not accuracy.

engine-fusion-hybrid-ukf-chart-target = target 1.0

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (whiteness)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENT

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = line { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = line { $lineno }: { $v } columns, at least { $min } expected

engine-e-fusion-kfgins-line-columns = line { $v1 }: { $v } columns

engine-e-fusion-kfgins-line-block-lists-are-not = line { $lineno }: block lists are not supported

engine-e-fusion-kfgins-line-expected-key-value = line { $lineno }: expected `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = line { $lineno }: indented key without a parent

engine-e-fusion-kfgins-line-only-one-level-of = line { $lineno }: only one level of nesting

engine-e-fusion-kfgins-line-unterminated-flow-list = line { $lineno }: unterminated flow list

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` is a list, a scalar expected

engine-e-fusion-kfgins-missing = `{ $k }` missing

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` must be a three-element list

engine-e-fusion-kfgins-no-imu-sample-at-or = no IMU sample at or after starttime

engine-e-fusion-kfgins-imu-time-not-increasing-at = IMU time not increasing at { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } must be finite and > 0, got { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m must be finite and > 0, got { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg must be in [-90, 90), got { $mask_deg }

engine-fusion-pack-chart-title = Loosely-coupled GNSS/INS horizontal error

engine-fusion-pack-chart-horizontal-error-m = horizontal error (m)

engine-fusion-pack-chart-spec-threshold = spec { $threshold } m

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = trajectory csv line { $v1 }: not numbers: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = trajectory csv line { $v1 }: expected 10 columns, got { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = trajectory csv line { $v1 }: time does not increase

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = trajectory csv needs at least two rows

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = trajectory csv covers { $rows } s but the scenario runs { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: site lat_deg must be in [-90, 90] and every field finite

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" is neither a GNSS preset ({ $e_gnss }) nor a LEO preset ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: give the user as `site` or `user_ecef_m`, not both

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m must be finite and not the geocentre

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satellite { $id }: azimuth/elevation out of range

engine-e-geometry-sky-satellite-is-given-in = sky: satellite { $id } is given in ECEF; the request needs `site` or `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satellite { $id }: ECEF position not finite

engine-e-geometry-sky-satellite-coincides-with-the = sky: satellite { $id } coincides with the user

engine-e-geometry-sky-satellite-give-az-deg = sky: satellite { $id }: give az_deg and el_deg, or ecef_m, and nothing else

engine-e-geometry-sky-tle-is-bytes-the = sky: tle is { $text } bytes; the cap is { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = element set refused: { $e }

engine-geometry-sky-tle-holds-no-complete = sky: tle holds no complete two-line element set; { $n_ignored } lines ignored, the first: { $first }

engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. and { $more } more

engine-geometry-element-sets-propagated-by-the = { $n } element sets propagated by the engine's SGP4 (WGS-72) to { $iso } and rotated to Earth-fixed with UT1 taken as UTC and no polar motion: the sky those element sets give at that epoch, not a measurement of it.

engine-geometry-element-sets-propagated-by-the-2 = { $n } element sets propagated by the engine's SGP4 (WGS-72) to the newest element set's epoch plus time_s ({ $iso }). No epoch was given, so this is a representative sky, not the sky of a stated date.

engine-e-geometry-sky-give-systems-or-tle = sky: give `systems` or `tle` (with a `site`), or `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system names the `tle` satellites; the request has no `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg must be in [-90, 90), got { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` needs a `site` (or `user_ecef_m`) to look from

engine-e-geometry-sky-time-must-be-finite = sky: time_s must be finite

engine-e-geometry-sky-system-asks-for-satellites = sky: system "{ $name }" asks for { $asked } satellites; a request holds at most { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: more than { $MAX_SATELLITES } satellites

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` needs a `site` (or `user_ecef_m`) to look from

engine-e-geometry-sky-more-than-satellites-above = sky: more than { $MAX_SATELLITES } satellites above the horizon

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m must be positive, got { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence must be in (0, 1), got { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: more than { $MAX_CLOCKS } systems in view, each with its own clock; group satellites under fewer `system` labels or use clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n must be in 1..={ $MAX_MC_SAMPLES }, got { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: too few satellites in view for a fix; no Monte Carlo cloud

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = TLE sky at { $e }, not a measurement

engine-e-geometry-invalid-sky-request-json = invalid sky request (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = invalid sky request (TOML): { $e }

engine-e-geometry-invalid-skyline-json = invalid skyline (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = invalid skyline (TOML): { $e }

engine-geometry-chart-title = Skyplot ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = E

engine-geometry-chart-south = S

engine-geometry-chart-west = W

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (hidden by the skyline)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (below the mask)

engine-geometry-chart-no-fix = no fix

engine-geometry-chart-in-view-hidden = { $n_visible } in view, { $n_masked } hidden by the skyline · { $dop } · hollow: not in view

engine-geometry-chart-satellites-as-given = satellites as given

engine-geometry-chart-representative-sky = representative sky, not a dated one

engine-geometry-chart-footer = Kshana v{ $version } · geometry under a stated error model · kshana.dev

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = bad GLONASS PRN in { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = page type { $pt } is not encoded here

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bits, expected { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bits, expected { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = tail bits are not zero

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q mismatch

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = page type { $pt } is not decoded here

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } symbols, expected { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = synchronisation pattern not found

engine-e-gnss-navmsg-gal-fnav-page-type-missing = page type { $t } missing

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav of page type { $t } differs from page type 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = no Galileo field { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = word type { $wt } is not encoded here

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bits, expected { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = word type { $wt } is not decoded here

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = page parts must be 120 bits

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = even/odd flags are not 0 then 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = not a nominal page (page type 1 is an alert page)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bits, expected { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } symbols, expected { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = word type { $t } missing

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav of word type { $t } differs from word type 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = record is system { $system }, not Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = type 10 has no field { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = type 11 has no field { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = type 30 has no field { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV body has { $body } bits, expected 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } or TOW count { $tow_count } out of range

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bits, expected { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = preamble is not 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = message type { $t } is not decoded here

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = need a type 10 and a type 11 message

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } at LSB { $value2 } does not fit { $bits } { $v4 } bits

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bits, layout needs { $need }

engine-e-gnss-navmsg-no-field = no field { $name }

## src/gnss_sim.rs

engine-gnss-sim-chart-title = RAIM protection levels vs alert limits

engine-gnss-sim-chart-protection-level-m = protection level (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } at scale 2^{ $scale_pow2 } does not fit { $bits } { $v1 } bits

engine-e-gps-lnav-no-value-for = no value for { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: reference model "gfc" needs `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: cannot read gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: unknown reference model `{ $other }` (use "egm2008" or "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: unknown ellipsoid `{ $other }` (use "wgs84" or "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations must be at least 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations is capped at 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = bad real '{ $t }'

engine-e-gravity-pds-bad-integer = bad integer '{ $t }'

engine-e-gravity-pds-empty-shadr-table = empty SHADR table

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR header has { $f } fields, expected at least 6

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR header: negative degree/order or unknown normalization

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR normalization state { $normalization } (only fully normalized, state 1, is supported)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR reference longitude/latitude must be 0

engine-e-gravity-pds-non-physical-gm-must-be = non-physical GM (must be finite and positive)

engine-e-gravity-pds-non-physical-reference-radius-must = non-physical reference radius (must be finite and positive)

engine-e-gravity-pds-shadr-record-fields = SHADR record { $v1 }: { $f } fields

engine-e-gravity-pds-shadr-record-bad = SHADR record { $v1 }: bad (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR record { $v1 }: non-finite coefficient

engine-e-gravity-pds-no-shadr-coefficient-records = no SHADR coefficient records

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR table incomplete: missing (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = missing earth_gravity_constant / gravity_constant

engine-e-gravity-sh-missing-radius = missing radius

engine-e-gravity-sh-non-physical-earth-gravity-constant = non-physical earth_gravity_constant (must be finite and positive)

engine-e-gravity-sh-non-physical-radius-must-be = non-physical radius (must be finite and positive)

engine-e-gravity-sh-no-gfc-coefficient-lines = no gfc coefficient lines

engine-e-gravity-sh-read-error = read error: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = line { $lineno }: norm { $v } is not supported (fully_normalized only)

engine-gravity-sh-line-bad = line { $lineno }: bad { $what }

engine-e-gravity-sh-line-degree-above-the-declared = line { $lineno }: degree { $n } above the declared max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = line { $lineno }: order { $m } above degree { $n }

engine-e-gravity-sh-line-time-variable-term-is = line { $lineno }: time-variable term `{ $key }` is not supported (static models only)

engine-e-gravity-sh-missing-end-of-head = missing end_of_head

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s must be positive, got { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s must be positive, got { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase = scenario produces { $n } epochs (need ≥ 2); increase duration_s or decrease step_s

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = the record holds a non-finite time error

engine-e-holdover-test-unknown-mask-expected-one-of = unknown mask { $id }; expected one of { $masks }

engine-e-holdover-test-every-budget-max-abs-te = every budget max_abs_te_ns must be finite and positive

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } lies outside the record ({ $t0_s } to { $t_end } s on its own time axis)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } must be later than gnss_removed_s ({ $gnss_removed_s }) and not past the end of the record ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = the holdover step holds no sample

engine-holdover-test-the-record-has-no-step = the record has no { $step } step: GNSS was removed at its first sample

engine-holdover-test-the-step-has-samples-the = the { $step } step has { $te_ns } samples; the estimators need at least 13

engine-e-holdover-test-step-with-mask-has-no = a step with a mask has no curve

engine-e-holdover-test-cannot-read-csv-path = cannot read csv_path { $path }: { $e }

engine-holdover-test-recovered-after-gnss-returned = ; recovered { $t } s after GNSS returned

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }{ $rec } (MODELLED, measured against the mask)

engine-holdover-test-not-recovered-within-record = ; not recovered within the record

engine-holdover-test-chart-title = Holdover test: time error by step

engine-holdover-test-chart-y-title = |time error| (ns)

engine-holdover-test-chart-panel-caption = absolute time error; holdover step shaded; dashed lines are the time-error budgets

engine-holdover-test-chart-gnss-removed = GNSS removed

engine-holdover-test-chart-gnss-restored = GNSS restored

engine-holdover-test-chart-time-axis = time on the record's axis ({ $min } min)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m must be finite and > 0, got { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba must be >= 0 and coupled.bias_var > 0

engine-hybrid-chart-title = Hybrid PNT spec utilization during GNSS outage (1.0 = spec)

engine-hybrid-chart-y-title = spec utilization

engine-hybrid-chart-spec-line = spec (1.0)

engine-hybrid-chart-classical-suite = classical suite

engine-hybrid-chart-quantum-suite = quantum suite

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: the two legs are not at a common averaging time. The optical leg accumulates over integration_s = { $integration_s } s; the RF leg's loop noise bandwidth B_L = { $dll_bandwidth_hz } Hz averages over 1/(2*B_L) = { $rf_equivalent_averaging_s } s. A ratio of two sigmas taken at different averaging times is not a comparison, so none is quoted. Remove the rf_dll_bandwidth_hz override (it then defaults to 1/(2*integration_s)) or set it to { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: a leg is not a usable positive finite sigma (optical { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), so no ratio is formed.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = unknown rf_band '{ $other }' (expected s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } must be finite

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db must be finite and >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint = hybrid-optical-rf | optical footprint { $footprint_m } m, { $detected_photons } photons -> ranging σ { $c } mm, timing σ { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | availability { $c4 }% ({ $n_sites } sites) | handoff no-jump { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | joint FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology

engine-hybrid-integrity-chart-availability = availability

engine-hybrid-integrity-chart-precision = precision

engine-hybrid-integrity-chart-integrity = integrity

engine-hybrid-integrity-chart-joint-indep = joint (indep)

engine-hybrid-integrity-chart-joint-corr = joint (corr)

engine-hybrid-integrity-chart-title = Hybrid optical + RF PNT joint figure of merit

engine-hybrid-integrity-chart-subtitle = P(available AND precision-grade AND integrity-assured)

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa must be in [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class must be >= 1

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | detector { $detector } | AUC { $auc_in } in / { $auc_out } out (gap { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ target { $target_pfa } | { $n_cases } cases | MODELLED synthetic

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = unknown detector '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = unknown imu_grade { $other }; expected one of navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = unknown combination { $other }; expected one of rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = unknown trn_fix_mode { $other }; expected one of none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } must be finite and non-negative (got { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m must name at least one threshold

engine-e-inertial-coast-crossing-thresholds-entries-must-be = crossing_thresholds_m entries must be finite and positive (got { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades must name at least one IMU class

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s must be finite and non-negative (got { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 must be finite and non-negative (got { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg must be finite and within (-89, 89) (got { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m must be within [-1000, 100000] (got { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s must be positive

engine-e-inertial-coast-drift-band-must-satisfy-lo = drift band must satisfy 0 < lo < hi (got lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = serializing ins-trn-coast result: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU, { $speed } m/s, combination { $comb } | { $heads } | TRN { $mode } peak { $peak_error_m } m over { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va derived from cold-atom-interferometer physics)

engine-inertial-chart-title = Dead-reckoning position error during GNSS outage

engine-inertial-chart-y-title = position error (m)

engine-inertial-chart-spec-line = spec { $m } m

engine-inertial-chart-classical = classical: { $id }

engine-inertial-chart-quantum = quantum: { $id }

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = scenario is { $toml_text } bytes, over the { $max_bytes }-byte limit

engine-e-inline-only-the-scenario-kind-reads-its = the scenario kind `{ $kind }` reads its data from files on the host, so this surface does not run it; use the `kshana` command line

engine-e-inline-only-the-field-names-file-this = the field `{ $k }` names a file: this surface accepts inline content only

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = trace JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = unknown dataset `{ $key }`; approved: { $v1 }, or a custom dataset

engine-e-interference-map-api-dataset-is-data-but-the = dataset `{ $key }` is { $kind } data but the input kind is { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } is not a YYYY-MM-DD date

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = unknown option `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = expected { $positionals } positional argument(s), got { $pos }

engine-e-interference-map-cli-cannot-read = cannot read { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom needs { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } already exists; Kshana does not overwrite maps. Remove it or choose another --out directory

engine-interference-map-cli-note-cell-deg-is-not = note: --cell-deg { $cell_deg } is not the pre-registered cell size ({ $PREREGISTERED_CELL_DEG }); the maps say so

engine-e-interference-map-cli-cannot-create = cannot create { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = wrote { $path }: { $cells } cells published, { $n_deg } flagged

engine-interference-map-cli-no-usable-rows-nothing-written = no usable rows: nothing written

engine-e-interference-map-cli-unknown-subcommand = unknown subcommand `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = the downloaded file's SHA-256 ({ $got }) does not match the pinned value ({ $expected }); it was discarded

engine-e-interference-map-cli-cannot-write = cannot write { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl was not found on PATH. Install curl, or download { $NATURAL_EARTH_LAND_URL } yourself and check that its SHA-256 is { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = cannot run curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = wrote { $out }: Natural Earth land polygons, SHA-256 verified (public domain, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = no trace_full_* files under { $path }

engine-e-interference-map-cli-cannot-read-2 = cannot read { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } is not a YYYY-MM-DD date

engine-e-interference-map-cli-bad-map-date = { $f }: bad map date

engine-e-interference-map-cli-cannot-write-2 = cannot write { $out }: { $e }

engine-interference-map-cli-route-length-km = route length { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Caveats: a degraded cell does not identify interference as the cause; cells not observed are not evidence of a clear route; this is not a forecast.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = land polygons: invalid JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = missing required column `{ $name }`

engine-e-interference-map-cannot-read-input = cannot read input: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` is not a date (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours must be { $MIN_DELAY_HOURS } or more: the observatory does not publish sooner

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg must be { $MIN_CELL_DEG } or coarser: the observatory publishes coarse cells only

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } is not publishable yet: its product is released no earlier than { $fmt_utc } ({ $delay_hours } h after the day ends)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORY  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED

engine-interference-map-observatory-source-licence = SOURCE { $dataset }  LICENCE { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (PUBLISHED CELLS)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana observatory, ADS-B navigation-accuracy map, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = cannot create { $path } (Kshana does not overwrite products): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = the input has no usable report on { $day } (days found: { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } already exists; Kshana does not overwrite products

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } cells published, { $p2 } degraded, { $p3 } incident(s)

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } rows replayed under { $variants } variants: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = map is not valid JSON: { $e }

engine-e-interference-map-route-route-invalid-json = route: invalid JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = route: line { $v1 } is not `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 } export. Epoch: { $epoch_note }. Moving objects: GCRS (referenceFrame INERTIAL), metres, seconds after the epoch. Fixed sites: Earth-fixed WGS 84 (referenceFrame FIXED), metres.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Position: GCRS, metres.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Latitude { $lat_deg } deg, longitude { $lon_deg } deg, height { $h_m } m above the WGS 84 ellipsoid. Position: Earth-fixed, metres.

engine-interop-czml-radius-along-the-ground = { $description }. Radius { $radius_m } m along the ground.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Untimed: WGS 84 longitude and latitude in degrees, clamped to the ground.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Earth-fixed positions; a MultiLineString is cut at the antimeridian, and times_utc then lists the original samples only.

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 } export. Epoch: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = invalid GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString has no coordinates array

engine-e-interop-geojson-an-rfc-7946-linestring-needs = an RFC 7946 LineString needs two or more positions

engine-interop-geojson-position-is-not-an-array = position { $i } is not an array of two or three numbers

engine-interop-geojson-position-longitude-is-not-number = position { $i }: longitude is not a number

engine-interop-geojson-position-latitude-is-not-number = position { $i }: latitude is not a number

engine-e-interop-geojson-position-longitude-is-outside-180 = position { $i }: longitude { $lon } is outside [-180, 180] (GeoJSON puts longitude first)

engine-e-interop-geojson-position-latitude-is-outside-90 = position { $i }: latitude { $lat } is outside [-90, 90] (GeoJSON puts longitude first)

engine-e-interop-geojson-track-needs-two-or-more = a track needs two or more waypoints

engine-e-interop-geojson-the-route-spans-more-than = the route spans more than 180 degrees of longitude; the track kinds step in plain degrees and cannot cross the antimeridian

engine-e-interop-geojson-position-is-deg-from-an = position { $worst } is { $worst2 } deg from an evenly spaced straight track (tolerance { $tol_deg } deg); the track kinds fly start + i*step, so give evenly spaced positions on a line, or only the two ends

engine-e-interop-geojson-route-applies-to-the-kinds = a route applies to the kinds that fly a waypoint track (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` takes no trajectory input

engine-e-interop-geojson-scenario-toml-is-not-table = scenario TOML is not a table

engine-e-interop-geojson-cannot-serialise-scenario = cannot serialise scenario: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = unknown export format '{ $other }'; expected one of czml, kml, geojson, stk, sigmf, all or list

engine-e-interop-member = member { $label }: { $e }

engine-interop-the-scenario-could-not-be = the scenario could not be exported: { $m }

engine-e-interop-invalid-spectrum-scenario = invalid spectrum scenario: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than = { $n } time samples is more than an export writes ({ $MAX_SAMPLES })

engine-e-interop-scene-objects-samples-is-more-than = { $items } objects x { $times } samples is more than an export writes ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = invalid { $kind } scenario: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type } jammer, { $power_dbw } dBW transmit power, { $gain_dbi } dBi antenna gain

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, from the jamming kind's link equations with the jammer at the receiver's horizon and free-space loss

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (the chain's [pass] stage)

engine-interop-scene-circular-orbit-km-altitude-deg = circular orbit, { $altitude_km } km altitude, { $inclination_deg } deg inclination (SGP4 mean elements at the window start, as the passes kind propagates it)

engine-interop-scene-ground-station-deg-elevation-mask = ground station, { $mask_deg } deg elevation mask

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; GCRS and Earth-fixed states are the ephemeris kind's own output (UT1 and polar motion as the scenario sets them)

engine-interop-scene-static-scene-the-kind-flies = static scene: the { $kind } kind flies an untimed track of waypoints

engine-interop-scene-true-track-flown-gps-denied = true track flown GPS-denied: { $track } waypoints from start_lat_deg/start_lon_deg in steps of step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` has no scene

engine-e-interop-scene-missing-numeric = missing numeric `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = missing integer `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } is outside 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } at { $altitude_km } km, { $inclination_deg } deg inclination (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = the scenario gives no `epoch`; t = 0 is { $epoch }, the earliest epoch the satellites' own data carry (TLE, broadcast-ephemeris or SP3 epoch). Each satellite is propagated from its own epoch, and those span { $spread_h } h: the time tags follow the engine's premise that every satellite starts at t = 0, while each position is rotated into the GCRS and Earth-fixed frames at that satellite's own instant. The SP3 and OEM exports label t = 0 as 2000-01-01T00:00:00Z instead

engine-interop-scene-the-scenario-gives-no-epoch-2 = the scenario gives no `epoch`; t = 0 is { $epoch }, the epoch the satellites' own data carry (TLE, broadcast-ephemeris or SP3 epoch). The SP3 and OEM exports label t = 0 as 2000-01-01T00:00:00Z instead

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objects x { $times_s } samples is more than an export writes ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = { $user_environment } user, moving (the kind's constant speed and heading)

engine-interop-scene-user-receiver = { $user_environment } user (receiver)

engine-interop-scene-user-orbit-km-altitude-deg = user orbit, { $altitude_km } km altitude, { $inclination_deg } deg inclination (Keplerian{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = no moving object { $index }

engine-interop-stk-kshana-export-object = # Kshana { $v1 } export: { $scene }, object { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type } jammer, { $power_dbw } dBW transmit power, { $gain_dbi } dBi antenna gain (a parameter of the scenario's link budget, not a signal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` has no vehicle trajectory to export; the test-bench export covers the gnss-ins, jamming and gnss-sim kinds

engine-e-interop-testbench-empty-motion-csv = empty motion CSV

engine-e-interop-testbench-motion-csv-header-is-not = motion CSV header is not the expected columns: { $head }

engine-e-interop-testbench-row-fields-expected = row { $v1 }: { $f } fields, expected { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = row { $v1 }: column { $motion_columns } is not a number

engine-e-interop-testbench-line-no = line { $v1 }: no `$`

engine-e-interop-testbench-line-no-checksum = line { $v1 }: no checksum

engine-e-interop-testbench-line-bad-checksum-field = line { $v1 }: bad checksum field

engine-e-interop-testbench-line-checksum-mismatch = line { $v1 }: checksum mismatch

engine-e-interop-testbench-line-short-gga = line { $v1 }: short GGA

engine-interop-testbench-line-bad-latitude = line { $v1 }: bad latitude

engine-interop-testbench-line-bad-longitude = line { $v1 }: bad longitude

engine-e-interop-testbench-line-bad-altitude = line { $v1 }: bad altitude

engine-e-interop-testbench-line-bad-separation = line { $v1 }: bad separation

engine-e-interop-testbench-line-short-rmc = line { $v1 }: short RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = line { $v1 }: RMC with no preceding GGA

engine-e-interop-testbench-line-gga-and-rmc-times = line { $v1 }: GGA and RMC times differ

engine-e-interop-testbench-line-bad-speed = line { $v1 }: bad speed

engine-e-interop-testbench-line-bad-course = line { $v1 }: bad course

engine-e-interop-testbench-line-bad-time-or-date = line { $v1 }: bad time or date

engine-e-interop-testbench-gga-with-no-following-rmc = a GGA with no following RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = a waypoint file needs at least two samples

engine-e-interop-testbench-the-sample-step-is-not = the sample step { $step } s is not a whole number of milliseconds

engine-e-interop-testbench-the-samples-are-not-equally = the samples are not equally spaced: interval { $v1 } is { $dt } s, the first is { $step } s

engine-e-interop-testbench-empty-waypoint-file = empty waypoint file

engine-e-interop-testbench-waypoint-not-three-numbers = waypoint { $v1 }: not three numbers

engine-e-interop-testbench-waypoint-fields-expected = waypoint { $v1 }: { $f } fields, expected 3

engine-e-interop-testbench-events-csv-header-is-not = events CSV header is not label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = event row { $v1 }: expected 5 fields

engine-e-interop-testbench-event-row-unknown-kind = event row { $v1 }: unknown kind { $f }

engine-e-interop-testbench-event-row-bad-onset = event row { $v1 }: bad onset

engine-e-interop-testbench-event-row-bad-end = event row { $v1 }: bad end

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-interop-testbench-no-waypoints-txt-written = no .waypoints.txt written: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = not a UTC time `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = missing { $what }

engine-e-ionex-bad-number-in = { $what }: bad number in { $col }

engine-e-ionex-two-digit-year = { $what }: two-digit year { $year }

engine-e-ionex-no-end-of-header = no END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = height-dependent (3-D) IONEX maps are not supported

engine-e-ionex-zero-grid-step = zero grid step

engine-e-ionex-grid-needs-at-least-nodes = grid needs at least 2 x 2 nodes

engine-e-ionex-map-no = map { $index }: no { $end_label }

engine-e-ionex-map-band-latitude-header-grid = map { $index }: band { $band } latitude { $band_lat }, header grid { $want }

engine-e-ionex-map-band-longitudes-differ = map { $index }: band { $band } longitudes differ

engine-e-ionex-map-band-truncated = map { $index }: band { $band } truncated

engine-e-ionex-map-bands-header-grid-has = map { $index }: { $band } bands, header grid has { $n_lat }

engine-e-ionex-map-no-epoch-of-current = map { $index }: no EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } TEC maps, header # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = TEC map epochs not increasing

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz does not hold a whole number of samples per { $code } period ({ $spc } samples)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods and noncoherent must be positive

engine-e-iq-acq-stream-ended-after-of-samples = stream ended after { $got } of { $needed } samples

engine-e-iq-acq-cfar-reference-cells-must-be = CFAR reference cells must be even and at least 2 (got { $n })

engine-e-iq-acq-cfar-stride-must-be-at = CFAR stride must be at least 1 lag

engine-e-iq-acq-cfar-per-cell-pfa-must = CFAR per-cell Pfa must lie in (0, 1) (got { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = CFAR window reaches { $reach } lags each side, too wide for a { $samples_per_period }-lag period

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = unknown surface format { $s }: expected csv, json or bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = the surface would hold { $spc_cells } cells (limit { $MAX_SURFACE_CELLS }): widen the Doppler step or narrow the Doppler range

engine-e-iq-acq-surface-surface-header = surface header: { $e }

engine-e-iq-acq-surface-surface-schema-expected = surface schema { $schema }; expected { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = surface body: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = recording '{ $id }': format and sample_rate_hz must be given together

engine-e-iq-campaign-conditions-test-conditions-json = test conditions (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = test conditions (TOML): { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf needs a SigMF recording (got { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF metadata: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF metadata: global core:sample_rate is missing

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start is missing

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: no core:sample_count and no power points to end the event

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema must be "{ $SCHEMA }" (got "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id must not be empty

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s must be finite and >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 must be 64 hex digits

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind must be "iq" or "receiver-log" (got "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = at least one [[expected]] group is required

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids must not be empty

engine-e-iq-campaign-conditions-lists-value-give-one-per = { $at }: { $key } lists { $n } value(s); give one per id ({ $ids })

engine-e-iq-campaign-conditions-duplicate-id = { $at }: duplicate id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s must be after onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects must be "all" or a list of ids

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: affects id { $bad } is not in [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q must be positive

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points must not be empty

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points must be in time order

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points must be finite

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" needs reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = events '{ $id }' and '{ $id2 }' overlap on a shared satellite

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s must be >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s must be positive

## src/iq/campaign/report.rs

engine-iq-campaign-report-roc-aria-label = Detection ROC per monitor

engine-iq-campaign-report-roc-x-title = P_fa (per negative window)

engine-iq-campaign-report-curve-aria-label = C/N0 degradation against stated J/S for { $rec } event { $ev }

engine-iq-campaign-report-curve-x-title = stated J/S (dB)

engine-iq-campaign-report-curve-y-title = C/N0 degradation (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: SSC reference, Q = { $q }

engine-iq-campaign-report-curve-model-legend = { $label } reference (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } more series in the scorecard table

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, measured degradation { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (measured)

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = recording '{ $id }': SHA-256 { $sha } does not match the stated { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: recording holds { $buf } samples, { $n } needed to acquire

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s must be positive

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db must be positive

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s must be >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz must be positive

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs must be at least 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = campaign (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = campaign (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions must list at least one file or glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds must be >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = frontend names must be non-empty and unique ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' matches no file

engine-e-iq-campaign-spec-recording-id-appears-in-both = recording id '{ $w }' appears in both { $w2 } and { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names needs inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: no design '{ $n }' in { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = truth line { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0 profile: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0 profile: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i }: step values must be finite

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i }: ramp needs end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i }: points need equal, non-empty t_s and db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i }: t_s must increase strictly

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i }: points must be finite

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i }: fade s4 must be in (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i }: fade tau_s must be positive

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: recording holds { $samples } samples, { $need } needed for this search

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: name the format with --surface-format csv|json|bin, or end the path in .csv, .json or .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = acquisition: { $fs_hz } Hz, { $coherent_periods } coherent period(s) x { $noncoherent } non-coherent, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = report rebuilt: { $cells_present } of { $cells_total } cell(s), { $rows } row(s), { $rows_failed } failing a bar; digest { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    campaign { $name }: { $cells_total } cell(s); { $cells_skipped } already done, { $cells_run } run now, { $cells_failed } failed, { $cells_pending } pending
    output: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    first failure ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: { $events } event(s), { $tc } expected satellite(s); condition hash { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono slant { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono vertical { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scint S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = multipath { $h }m { $multipath_ground } ground

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground must be dry, wet or sea (got { $other })

engine-e-iq-cli-channel-give-at-most-one-of = give at most one of --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass wants lo,hi (got { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass needs lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } with transition { $transition } Hz does not fit below fs/2 ({ $v1 } Hz); narrow the band or the transition

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits must be 1..=16 (got { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = filtered { $total } samples ({ $fs_hz } Hz) to { $out } ({ $format }); sidecar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = cannot read { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = invalid labfit scenario: { $e }

engine-iq-cli-labfit-fitted-run-wrote = fitted { $runs } run(s); wrote { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = fitted { $fit_units } unit(s) from campaign; wrote { $written }

engine-iq-cli-labfit-cannot-write = cannot write { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } needs a value

engine-e-iq-cli-cannot-parse = { $k }: cannot parse { $v }

engine-iq-cli-iq-takes-positional-argument-got = iq { $cmd } takes { $n } positional argument(s), got { $pos }

engine-e-iq-cli-cannot-parse-2 = { $k }: cannot parse { $p }

engine-iq-cli-unknown-iq-processing-command-expected = unknown iq processing command { $other }; expected scene, acquire, track, sweep, labfit, frontend, monitor, campaign or conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } is out of range for GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = no healthy GPS ephemeris found for the requested PRNs

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos wants lat,lon,alt (got { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; C/N0 profile ({ $segments } segment(s))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format must be csv or jsonl (got { $other })

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ; integer scale: 1 LSB = { $sc } noise-normalised units (expected RMS { $v1 } LSB per component), { $clipped } element(s) clipped

engine-iq-cli-scene-written-by-kshana-iq-scene = written by kshana iq scene: a SIMULATED scene, not a recording{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = ION SDR metadata { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF data { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = written by kshana iq scene{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = wrote { $samples } samples ({ $format }, { $fs_hz } Hz) to { $data_path }; { $truth_records } truth records to { $truth_path }; { $meta_note }; channel: { $chan_desc }{ $scale_note }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } cannot be combined with --design: sweep runs every design in the file

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = loop-design sweep: { $rows } (design, PRN) result(s){ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: recording holds { $samples } samples, { $need } needed to acquire

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: not acquired (statistic { $statistic } < threshold { $threshold }); raise --doppler-max, --acq-coherent or --acq-noncoherent, or check the recording

engine-iq-cli-track-designs-and-differ-in-integration = designs { $first } and { $d } differ in integration.extra_taps_chips; the designs of one run must agree so every output record has the same columns

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: name the format with --epochs-format csv|jsonl|bin, or end the path in .csv, .jsonl or .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz is { $r } samples per chip of { $c }: commensurate sampling turns the code discriminator into a staircase (at 2 samples/chip the DLL dithers, about 0.09 chip RMS code error at 45 dB-Hz); code-loop jitter and bias from this recording are not representative. Use a rate that is not a multiple of half the chip rate to judge code loops.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = worker exited before processing this input

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = unknown option { $s }

engine-e-iq-io-cli-format-needs-rate = --format needs --rate

engine-iq-io-cli-iq-takes-path-argument-got = iq { $cmd } takes { $n } path argument(s), got { $pos }

engine-iq-io-cli-unknown-iq-command = unknown iq command { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated = wrote { $n } samples ({ $to }, { $fs_hz } Hz) to { $files }; { $w } saturated element(s){ $v4 }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow reads single-channel recordings only

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow reads a recording with one capture, this one has { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: no positive core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: the capture does not start on a byte boundary

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = unknown sample format { $name }: expected e.g. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, optionally ending _qi for complex

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sidecar sample_rate_hz { $sample_rate_hz } is not positive

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: .sdrx recordings hold one stream; channel { $channel } does not exist

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: raw file with no sidecar; state its format, or write { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = cannot serialise row: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = invalid filter design { $design }: passband_frac in (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz must lie strictly between 0 and half the sample rate ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx data: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-bit { $enc } { $fmt } ({ $packed_bits } bits/sample)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = unsupported SigMF core:datatype { $datatype }: supported are ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be and the real ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } is not a SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = invalid SigMF metadata: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } has no SigMF core:datatype; write it as raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } does not match the first recording's { $c0 }

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: no core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } is not positive

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } at { $rate } Hz does not match the first recording's { $f0 } at { $r0 } Hz

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out = { $name }: capture at sample { $sample_start } is out of order or beyond the { $n_file } samples in the data

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: first capture does not start on a byte boundary

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = channel { $channel } requested; the recording has { $channels } (channels count from 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = invalid SigMF collection: { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } does not match the collection's { $h }

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = stream { $select } of { $channels } interleaved streams does not exist (streams count from 0)

engine-e-iq-io-stream-sample-of-does-not-start = sample { $k } of { $format } does not start on a byte boundary

engine-e-iq-io-stream-time-window-start-duration-both = time window start { $start_s } s, duration { $duration_s } s: both must be non-negative

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = most damaging stated Q (cw): no table value for type `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: the campaign is not complete

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } does not match the cells ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = recording `{ $id }`: test conditions hash { $h } does not match the recorded { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signal `{ $signal }`: unknown chip rate

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = no run is usable for the lock fit: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = insufficient data: not fitted ({ $m } recordings; at least { $min_rec } are needed)

engine-iq-labfit-iqfit-uncensored-span-db-is-under = uncensored J/S span { $span_db } dB is under { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff and delta are not separately identifiable (|corr| { $full } >= { $v2 }): the model depends on delta - 10 log10 Q_eff only

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed = not fitted: { $n_reacq } re-acquisitions observed (at least 3 are needed)

engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = unknown mode `{ $m }` (only `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage must be [lower, upper] within [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds must be [lower, upper] with 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db must be [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = the campaign has no event with a stated power profile to fit

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Lab fit from IQ campaign: { $r }

    Schema `{ $schema }`, engine { $engine_version }. Label: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = Campaign DIGEST `{ $campaign_digest }`; `campaign.json` SHA-256 `{ $campaign_json_sha256 }`; scenario SHA-256 `{ $scenario_sha256 }`; { $cells } cells; { $bootstrap } bootstrap replicates (seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Unit { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Status: { $status }. { $recordings } recordings, { $satellites } satellites, { $events } events; { $bins_used } bins fitted, { $bins_censored } censored.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0 model ({ $q_mode }): `delta_eff` = { $ci } dB (the identifiable offset, referred to Q = 1); `Q_eff` = { $q }; `delta` at that Q = { $ci2 } dB; corr(Q, delta) { $om }; residual RMS { $residual_rms_db } dB over a { $span_db } dB J/S span. Q_eff is not identifiable from C/N0 data without an independent power measurement.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q held at its stated value: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = Threshold J/S, direct: median { $om } dB over { $n } losses (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Hold-out (leave one recording out), interpolation: { $bins } bins, C/N0 RMS { $om } dB, PI90 coverage { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = ; { $model }: { $n } events, loss-time RMS { $om } s, PI90 coverage { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    Validation table SHA-256 `{ $table_sha256 }` (registered { $registered }):

    | bar | limit | value | verdict |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = run `{ $label }` log

engine-e-iq-labfit-run = run `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = the scenario's [input] names no campaign

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign and [[runs]] are exclusive: give one

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit scenario: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = the log carries no per-satellite C/N0{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = no epoch before the onset at { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = no epoch at or after the onset at { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Lab fit: { $r }

    Label: **{ $label }**. Settings SHA-256 `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db = { "\u000A" }{ $n_samples } C/N0 samples, residual RMS { $om } dB.{ $r }{ "\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Model: { $model } ({ $label })

    | parameter | value | bounds | at bound | bootstrap sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }Event-time RMS { $om } s over { $n_events } events; losses missed { $loss_missed } / extra { $loss_extra }, reacquisitions missed { $reacq_missed } / extra { $reacq_extra }.

    | run | drop dB-Hz | re-lock dB-Hz | events | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Hold-out ({ $scheme }, { $folds } folds): all { $om } s, interpolation { $om2 } s, extrapolation { $om3 } s.

    | held-out run | class | distance | nearest training run | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } is reserved for future use (only FID 0 is defined)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } is outside 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } SB1 symbol(s) disagree with the decoded field

engine-iq-lunanet-afs-frames-at-and-are-symbols = frames at { $w } and { $w2 } are { $gap } symbols apart, not { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } follows TOI { $w2 }, expected { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = unexpected character { $c } in a symbol stream (only 0, 1 and white space)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: first 24 chips differ

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: last 24 chips differ

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (the document prints A14850 for both PRN 147 and PRN 151; the generator reproduces PRN 151's, so the PRN 147 entry is most likely a misprint in the document)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = encoded 0x{ $word }, decoded FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = monitor settings: { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = static position not finite

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = constant-velocity trajectory not finite

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = waypoint trajectory has no waypoints

engine-e-iq-scene-geometry-waypoint-not-finite = waypoint not finite

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = waypoint times must increase strictly

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } is not a GPS C/A PRN

engine-e-iq-scene-ephemeris-system-is-not-gps = ephemeris system { $system } is not GPS

engine-e-iq-scene-satellite = satellite { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = is a pilot (data-free) component and carries no navigation data

engine-e-iq-scene-nav-carries-data-the-scene-does = carries data the scene does not model; generate it without data

engine-e-iq-scene-nav-does-not-carry-gps-lnav = does not carry GPS LNAV (only GPS L1 C/A does); use seeded data

engine-e-iq-scene-nav-not-an-lnav-source = not an LNAV source

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = a scene needs at least one satellite (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler lists { $dopplers } value(s); give one per --prn ({ $ids }) or a single value

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = truth row has { $f } fields, expected 10

engine-e-iq-scene-truth-truth-field = truth field { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = truth sat_id: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz must be a positive number

engine-e-iq-short-duration-must-be-in = duration_s must be in (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids must hold 1 to { $MAX_SATELLITES } satellites

engine-e-iq-short-dopplers-must-be-finite = dopplers must be finite

engine-e-iq-short-samples-requested-short-run-holds = { $n } samples requested; a short run holds at most { $MAX_SAMPLES }

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C data PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C pilot PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } is out of range

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF frequency channel { $id } is outside -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = unknown signal { $other }; expected one of: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = line { $v1 }: no ';'

engine-e-iq-signals-galileo-line-no-code-number-in = line { $v1 }: no code number in { $label }

engine-e-iq-signals-galileo-code-appears-twice = code { $number } appears twice

engine-e-iq-signals-galileo-codes-the-icd-defines = { $path }: { $n } codes, the ICD defines { $CODES_PER_COMPONENT }

engine-iq-signals-galileo-galileo-e1-prn = Galileo E1-B PRN { $prn }

engine-iq-signals-galileo-galileo-e1-prn-2 = Galileo E1-C PRN { $prn }

engine-iq-signals-galileo-galileo-e5a-prn = Galileo E5a-I PRN { $prn }

engine-iq-signals-galileo-galileo-e5a-prn-2 = Galileo E5a-Q PRN { $prn }

## src/iq/signals/gps.rs

engine-iq-signals-gps-gps-l1cd-prn = GPS L1CD PRN { $prn }

engine-iq-signals-gps-gps-l1cp-prn = GPS L1CP PRN { $prn }

engine-iq-signals-gps-gps-l5-i5-prn = GPS L5 I5 PRN { $prn }

engine-iq-signals-gps-gps-l5-q5-prn = GPS L5 Q5 PRN { $prn }

engine-iq-signals-gps-gps-l2-cm-prn = GPS L2 CM PRN { $prn }

engine-iq-signals-gps-gps-l2-cl-prn = GPS L2 CL PRN { $prn }

engine-iq-signals-gps-gps-l2c-prn = GPS L2C PRN { $prn }

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-prn = LunaNet AFS-I PRN { $prn }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primary { $primary_prn } S{ $secondary } tertiary { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primary { $primary_prn } S{ $secondary } (tertiary omitted)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = non-hex character { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } hex symbols cannot hold exactly { $len } chips

engine-iq-signals-primary-only = { $name } (primary only)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC tracking needs an early-late spacing in (0, { $max }) chips so that E and L stay on the main peak (got { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = bump-jump threshold must be at least 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = sample rate must be positive

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods must be positive

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows must be positive

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } must divide the bit length { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = at most { $MAX_EXTRA_TAPS } extra taps are supported (got { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = extra tap offsets must be finite and within ±{ $MAX_TAP_OFFSET_CHIPS } chips (got { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = a C/N0 window needs at least 2 prompts

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: expected atan2, costas-atan or costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: expected cross-product, atan2 or atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: expected pull-in or always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: expected eml-power, dot-product or eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: expected pll, fll or fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } does not apply to carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: expected a number >= 0 (0 disables the clamp)

engine-e-iq-track-design-must-be-positive-number-got = { $k } must be a positive number (got { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods must be at least 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips must lie in (0, 2] (got { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips holds at most { $MAX_EXTRA_TAPS } offsets (got { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = integration.extra_taps_chips offsets must be finite and within ±{ $MAX_TAP_OFFSET_CHIPS } chips (got { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) must be below carrier.fll_off_pli ({ $off }), both in (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s must be zero or positive (got { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s must be positive (got { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order must be 1, 2 or 3 (got { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order must be 1 or 2 (got { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order must be 1 or 2 (got { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold must lie in [-1, 1] (got { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows must be at least 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods must be at least 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) must not be below lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db must be finite

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes must be at least 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods must be at least 1 (or "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent must be at least 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa must lie in (0, 1) (got { $pfa })

engine-e-iq-track-design-design-overrides = design overrides: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = design overrides may not set name or extends

engine-e-iq-track-design-loop-design-file = loop-design file: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = loop-design file: schema { $other } is not supported; expected { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = loop-design file: missing schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = loop-design file: no [[design]] tables

engine-e-iq-track-design-loop-design-file-design-number = loop-design file: [[design]] number { $v1 } has no name

engine-e-iq-track-design-loop-design-file-design-name = loop-design file: design name { $name } is reserved or empty

engine-e-iq-track-design-loop-design-file-design-is = loop-design file: design { $name } is defined twice

engine-e-iq-track-design-no-design-named-the-file = no design named { $n }; the file holds { $value }

engine-e-iq-track-design-loop-design-file-design-extends = loop-design file: design { $name } extends itself (a cycle)

engine-e-iq-track-design-loop-design-file-design-extends-2 = loop-design file: design { $name } extends unknown design { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = phase loop needs order 1..=3 and Bn > 0 (got { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = frequency loop needs Bn > 0 (got { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = frequency loop order must be 1 or 2 (got { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = a loop filter needs a phase path, a frequency path, or both

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = early-late spacing must lie in (0, 2] chips (got { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = DLL order must be 1 or 2 (got { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = chip rate and carrier frequency must be positive

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = an epoch carries { $extra } extra taps but the output was set up for { $n }: every channel of a run must use the same extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = a record is { $b } bytes; expected { $want }

engine-e-iq-track-sink-unknown-lock-state-code = unknown lock-state code { $b }

engine-e-iq-track-sink-epoch-file-header = epoch file header: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = epoch file schema { $schema }; expected { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = epoch file records are { $record_bytes } bytes; this reader expects { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } per extra tap)

engine-e-iq-track-sink-epoch-file-ends-inside-record = epoch file ends inside a record ({ $got } of { $size } bytes)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = epoch format { $o }: expected csv, jsonl or bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` is not a number

engine-e-jammertest-cli-is-not-utf-text = { $path } is not UTF-8 text

engine-e-jammertest-cli-needs-catalog = needs --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = needs at least one --plan

engine-e-jammertest-cli-is-not-utf = { $cat } is not UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } is not UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` is not one of ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` is not UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = needs --log-start or --log with --format

engine-e-jammertest-cli-log-needs-format = --log needs --format

engine-e-jammertest-cli-the-log-does-not-state = the log does not state its start time: use --log-start

engine-e-jammertest-cli-the-log-states-its-start = the log states its start as `{ $label }`: use --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } is not UTF-8

engine-e-jammertest-cli-cannot-write = cannot write { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } { $SCHEDULED_TRUTH } events written to { $o } ({ $skipped_non_rf } non-RF slots skipped, { $outside_log } outside the log, { $unknown_ids } ids not in the catalogue)

engine-jammertest-cli-note-ids-not-in-the = note: ids not in the catalogue: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = note: these are the plan's scheduled slots, not recorded on-air times.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  test name

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } tests, { $evaluable } evaluable: { $detected } detected within tolerance, { $late } late, { $missed } missed; median latency { $fmt_opt }, median time to recover { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = false alarms outside every slot: { $false_alarm_runs } runs, { $false_alarm_epochs } of { $clean_epochs } clean epochs

engine-e-jammertest-cli-needs-session-path = needs a session path

engine-e-jammertest-cli-needs-catalog-and-plan-or = needs --catalog and --plan, or --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = evidence pack written to { $out }; signer fingerprint { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = no folder with a scenario.json and a .ubx under { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = scenario: { $e }

engine-e-jammertest-dataset-read = read: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json has no date

engine-e-jammertest-dataset-scenario-json-date-is-not = scenario.json date `{ $date }` is not a date

engine-e-jammertest-dataset-no-readable-epoch-in-mon = no readable epoch in mon_rf.csv or rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = no folder with a scenario.json under { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } recovered ({ $recovered } of { $alarmed }), median { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = the log states its start as `{ $l }`, which is not UTC ISO-8601: give the start explicitly

engine-e-jammertest-the-log-does-not-state = the log does not state its start time: give it explicitly

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = catalogue is not JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = catalogue has no `test_types` array

engine-e-jammertest-plan-test-type-has-no-type = a test type has no `type_id`

engine-e-jammertest-plan-test-group-has-no-group = a test group has no `group_id`

engine-e-jammertest-plan-test-has-no-test-id = a test has no `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = catalogue lists no tests

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` is not a plan time like 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = plan is not JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = plan has no `locations` array

engine-e-jammertest-plan-test-end-time-is-not = test { $id }: end_time is not after start_time

engine-e-jammertest-plan-the-plan-has-no-test = the plan has no test area { $l }; it has { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = the plan has several test areas { $areas }; say which one the log was recorded in

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json is not JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = no `attack_log` array

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024 test { $id } window { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = the attack_log holds no start/end window

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } scheduled events but the run scored { $events2 }: pass the run's own events

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s must be positive and guard_s not negative

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m must list at least one element

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m must be finite

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: expected "null-steering" or "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz must be positive (got { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: the section needs a [jammer]

engine-jamming-chart-title = Satellites visible vs. tracking under jamming

engine-jamming-chart-y-title = satellites

engine-jamming-chart-four-sv-fix = 4-SV fix

engine-jamming-chart-visible = visible

engine-jamming-chart-tracking = tracking

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) must be finite and at or above tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s must be finite and non-negative (got { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits must be 1 to 16 (got { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz must be positive (got { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side must be at least 2 (got { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } must be finite (got { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } must be positive (got { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: profile point { $points } ({ $lat }, { $lon }) is outside the DEM tile

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: profile point { $points } ({ $lat }, { $lon }) is on a DEM void

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC calendar date out of range: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = no such calendar date: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = UTC second { $second } out of range at { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = launch site at the pole has no defined azimuth

engine-e-launch-inclination-unreachable-from-latitude-without = inclination { $inclination_rad }° unreachable from latitude { $lat_rad }° without a dogleg (need |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = the true-pole site speed needs both `epoch` and `eop_finals2000a` (a real IERS finals2000A body)

engine-e-launch-site-lon-deg-must-be = site_lon_deg must be in [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a contained no readable IERS finals2000A rows

engine-e-launch-epoch-mjd-is-outside-the = epoch { $epoch } (MJD { $mjd_utc }) is outside the EOP rows supplied (MJD { $mjd } to { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg must be in [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg must be in [0, 180]

engine-launch-launch-window-lat-az-asc = launch-window: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° asc, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s Earth-rotation bonus, { $opportunities } opportunities/day (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = every range rate needs a positive, finite sigma

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = { $n_meas } measurements cannot resolve { $n } Doppler unknowns

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = the Doppler geometry is singular

engine-e-leo-fusion-doppler-no-covariance = no covariance

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = every pseudorange needs a positive, finite sigma

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = { $obs } pseudoranges cannot resolve { $n } unknowns (3 position + { $n_clock } clocks)

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = a satellite coincides with the position estimate

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = the geometry is singular

engine-e-leo-fusion-joint-pvt-no-iteration-ran = no iteration ran

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = degenerate final geometry

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = the DOP is not finite

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } must be positive

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m must be non-negative and the run at most 5000 epochs

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = every signal needs a positive bandwidth

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz = 5G NTN positioning at { $r } MHz, C/N0 { $r2 } to { $r3 } dB-Hz, { $n_satellites } satellites ({ $mean_in_view } in view){ "\u000A" }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, CRB range { $range_sigma_zenith_m } to { $range_sigma_mask_m } m; median formal 3D { $s2 } m, RMS error { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples = { "  " }one-satellite Doppler pass: { $n_obs } samples over { $duration_s } s, horizontal error { $horizontal_error_m } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

engine-leo-fusion-ntn-chart-title = 5G NTN positioning: Cramér-Rao range bound by bandwidth

engine-leo-fusion-ntn-chart-caption = range one-sigma (log10 m): bar = mask to zenith C/N0; dot = RMS 3D fix error

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP needs at least one system

engine-e-leo-fusion-ppp-duration-and-step-must-be = duration and step must be positive with at most 20000 epochs

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs must be 1 to 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = convergence thresholds must be positive

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical = PPP convergence to { $criterion_horizontal_m } m horizontal / { $criterion_vertical_m } m vertical, { $runs_per_case } runs per case, { $n_gnss } GNSS satellites{ "\u000A" }

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  median { $c } min  converged { $v4 }%  NEES mean { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = median horizontal error across { $runs_per_case } runs · MODELLED

engine-leo-fusion-ppp-chart-title = PPP convergence with LEO augmentation

engine-leo-fusion-ppp-chart-caption = median horizontal error (log10 m) against minutes

engine-leo-fusion-ppp-chart-n-leo = { $n } LEO

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = preset { $id } carries no signal

engine-e-leo-fusion-presets-preset-has-no-signal-it = preset { $id } has no signal { $n }; it has { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = unknown LEO preset { $id }; known: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s and step_s must be positive with at most 20000 epochs

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = polar steps must be positive

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode must be doppler, joint, polar or timing; got { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = doppler mode needs at least one LEO system

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = timing mode needs a LEO system with code ranging

engine-e-leo-fusion-pvt-kind-unknown-clock-class = unknown clock class { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) at { $user_lat_deg }, { $user_lon_deg } over { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } sats at { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites = { "  " }Doppler fix: { $n_obs } measurements from { $n_sats } satellites, 3D error { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }window { $window_s } s: { $n_sats } sats, 3D error { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } overhead pass: max Doppler { $max_doppler_hz } Hz, rate { $max_doppler_rate_hz_s } Hz/s, jerk { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }LEO ranging satellite in view on { $v1 }% of epochs{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } availability { $availability }, median PDOP { $f }, RMS 3D error { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } fused { $f3 }; in view { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, max { $row3 } ns (in view { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — { $mode } mode

engine-leo-fusion-pvt-kind-chart-doppler-caption = 3D Doppler-fix error (log10 m) against window length

engine-leo-fusion-pvt-kind-chart-doppler-x-label = window (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = median PDOP (blue) and VDOP (amber), log10, against LEO satellites added

engine-leo-fusion-pvt-kind-chart-joint-x-label = LEO satellites added

engine-leo-fusion-pvt-kind-chart-polar-caption = median VDOP (log10): grey GNSS, blue LEO, amber fused

engine-leo-fusion-pvt-kind-chart-polar-x-label = latitude (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = RMS time error to UTC (log10 ns) against C/N0 offset, one line per oscillator

engine-leo-fusion-pvt-kind-chart-timing-x-label = C/N0 offset (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 } to { $x1 }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = system { $name }: role must be gnss or leo, got { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = system { $name }: clock must be estimated or known, got { $c }

engine-e-leo-fusion-system-system-must-be-positive = system { $name }: { $what } must be positive

engine-e-leo-fusion-system-system-mask-deg-must-be = system { $name }: mask_deg must be in [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = system { $name }: sigma_pr_m must be positive

engine-e-leo-fusion-system-give-at-least-one-system = give at least one [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = the epoch spacing must be positive

engine-e-leo-fusion-timing-no-epochs = no epochs

engine-e-leo-fusion-timing-no-satellite-was-ever-in = no satellite was ever in view: the receiver never acquired time

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polarisation must be rhcp, lhcp or linear; got '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = SGP4 error code { $code } at t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = an orbit inclined { $inc } deg never passes over latitude { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = the requested maximum elevation is below the horizon reach

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = building class must be traditional or thermally-efficient; got '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = field { $name } is not finite

engine-e-leo-navmsg-codec-field-is-outside-its-bit = field { $name } = { $value } { $unit } is outside its { $bits }-bit range (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = message truncated

engine-e-leo-navmsg-codec-field-list-exhausted = field list exhausted

engine-e-leo-navmsg-codec-field-order-mismatch-vs = field order mismatch: { $name } vs { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID must be 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = each correction polynomial needs 1-8 coefficients

engine-e-leo-navmsg-codec-correction-time-scale-must-be = correction time scale must be a power of two from 1 s to 32768 s; got { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = ECEF polynomial needs 1-11 coefficients, equal per axis

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = ECEF polynomial degree { $v1 } exceeds 10

engine-e-leo-navmsg-codec-unknown-model-id = unknown model id { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = payload exceeds 4095 bytes

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = frame shorter than header and CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = bad preamble 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = unsupported version { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = frame length { $frame } does not match the declared payload of { $len } bytes

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q mismatch: computed 0x{ $crc }, frame carries 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees must each be at most 7; got { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree must be 1-10; got { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = unknown ephemeris model '{ $other }': use kepler16, kepler-rac, liu22 or ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = fit interval must be at least 10 s; got { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = fit window [{ $t0 }, { $v1 }] s lies outside the truth arc [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = ECEF polynomial fit is singular (too few samples for the degree)

engine-e-leo-navmsg-fit-clock-fit-is-singular = clock fit is singular

engine-e-leo-navmsg-fit-keplerian-fit-diverged = Keplerian fit diverged

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = unknown preset '{ $k }'; available: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s must be 10-3600 s and update_period_s in (0, fit_interval_s]; got { $fit_interval_s } and { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s and eval_step_s must be 0.5-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz must exceed 10 MHz; got { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid must be 1-255

engine-e-leo-navmsg-band-must-be-15-and = band must be 0-15 and health 0-3

engine-e-leo-navmsg-unknown-csv-schema = unknown csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis must name at least one analysis

engine-e-leo-navmsg-unknown-analysis-use = unknown analysis '{ $a }'; use { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind must be leo-navmsg; got { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg must be in [0, 60); got { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO navigation message — { $res } km, { $res2 } deg, gravity degree { $gravity_degree }, model { $res3 }
    { "  " }SISRE weights: w_R { $w_r }, w_AC^2 1/{ $v6 } (mask { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s must be 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s must be non-empty, each 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }fit-interval trade over { $span } s (usage period = fit interval):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE orbit RMS { $sisre_orb_rms_m } m  max { $sisre_orb_max_m } m  with clock RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s must be non-empty, each 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s must be 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } params  SISRE orbit RMS { $sisre_orb_rms_m } m  with clock { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = no pass above { $mask } deg for the user at { $lat }, { $lon } within { $search } s; widen midpass.search_s or move the user

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }mid-pass update: pass { $p0 }-{ $p1 } s (max elevation { $pmax } deg), { $switches } switches, largest user range jump { $max_jump } m (worst-case geometry { $max_worst } m) vs threshold { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }encode-decode: { $m } model, frame { $frame } bytes ({ $payload_bits } payload bits, { $eph_bits } ephemeris+clock bits), CRC-24Q 0x{ $hex }
    { "    " }quantisation: largest position change { $v6 } mm, clock { $v7 } mm; SISRE exact { $acc_exact } m, quantised { $acc_q } m
    { "    " }corrupted frame rejected: { $corrupted_rejected }; RINEX round trip { $rin_dp } m; CSV round trip { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs must be 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  published { $published } m  ratio { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = The 16-parameter Keplerian set degrades from { $a } m at { $lo } s to { $b } m at { $hi } s: one Keplerian set with twice-per-revolution harmonics cannot follow the higher-frequency gravity terms and the drag of a LEO arc for more than a few minutes, and its least-squares residual oscillates across the window. The along/cross/radial polynomials, of higher degree than the Keplerian set spans, absorb what is left, giving { $c } m at { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = The 16-parameter Keplerian set goes from { $a } m at { $lo } s to { $b } m at { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, gravity degree { $gravity_degree } · representation error against the truth · MODELLED

engine-leo-navmsg-chart-title = LEO navigation message: SISRE versus fit interval

engine-leo-navmsg-chart-no-trade-encode-decode = No trade in this run; see result.json for the encode/decode and budget tables.

engine-leo-navmsg-chart-no-fit-interval-trade = No fit-interval trade in this run; see result.json.

engine-leo-navmsg-chart-caption = orbit-only SISRE RMS (m, log scale) vs fit interval (s)

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` is the host library's

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: `rand_distr` samplers call the host `exp` and `ln` in their rare branches; use `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` is the host-library gravity field; use `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` has not been reviewed

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = no END OF HEADER line

engine-e-leo-navmsg-text-expected-eph-record-header-got = expected a '> EPH' record header, got { $head }

engine-e-leo-navmsg-text-bad-satellite-id = bad satellite id { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = missing epoch line

engine-e-leo-navmsg-text-bad-epoch-line = bad epoch line { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = bad epoch field in { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = epoch line needs three clock terms: { $ep }

engine-e-leo-navmsg-text-record-truncated = record truncated

engine-e-leo-navmsg-text-unknown-record-type = unknown record type { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = the CSV table carries kepler16 and kepler-rac messages; got { $m }

engine-e-leo-navmsg-text-empty-csv = empty CSV

engine-e-leo-navmsg-text-row-has-cells-header = row has { $cells } cells, header { $header }

engine-e-leo-navmsg-text-bad-number-in-column = bad number { $c } in column { $k }

engine-e-leo-navmsg-text-csv-row-lacks = CSV row lacks { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = orbit altitude must be between 100 km and 3000 km; got { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = eccentricity must be in [0, 0.1) for a LEO fit; got { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = integration step must be in (0, 30] s; got { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = duration must be positive with at most 200000 steps; got { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree must be 0, 2-6 (zonal) or 7-{ $v1 } (EGM2008); got { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = truth propagation diverged

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = truth orbit decayed below 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = node spacing must be in (0, 60] s; got { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = a tabulated truth orbit needs at least two states; got { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = state { $k } is not finite

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = clock adev_1s must be in [0, 1e-6); got { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = a measured clock is built with TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = steered clock needs sigma_s in [0, 1e-3) and tau_s > 0; got { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = a measured clock needs a positive step and at least two samples

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = a measured clock sample is not finite

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epoch '{ $s }' is not YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epoch '{ $s }' is not YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epoch '{ $s }' has a bad seconds field

engine-e-leo-pass-epoch-is-out-of-range = epoch '{ $s }' is out of range

engine-e-leo-pass-band-unknown-signal-design-public = band '{ $name }': unknown signal design '{ $n }'; public designs: { $v2 }

engine-e-leo-pass-band-is-not-in-the = band '{ $name }' is not in the system preset: give frequency_mhz and eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = band '{ $name }' needs eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern must be isoflux, gaussian or flat; got '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = band '{ $name }' frequency out of range

engine-leo-pass-overridden-in-the-scenario = { $source } (overridden in the scenario)

engine-e-leo-pass-system-has-no-band = system '{ $id }' has no band '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = a LEO satellite needs at least one band

engine-e-leo-pass-at-most-12-bands-per = at most 12 bands per satellite

engine-leo-pass-unknown-system-presets-in-this = unknown system '{ $n }'; presets in this build: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = no sun-synchronous orbit at { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (at most 86400) and step_s must be positive with at most 20000 epochs; got { $duration } and { $step }

engine-leo-pass-leo-satellite-km-deg = { $system } LEO satellite, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = the scenario's `epoch` { $epoch }, read as UTC

engine-leo-pass-the-kind-default-epoch-utc = the kind's default epoch { $epoch } UTC (the scenario gives none)

engine-e-leo-pass-user-environment-must-be-ground = user.environment must be ground, maritime, air or indoor; got '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg must be within +/-90

engine-e-leo-pass-user-speed-must-be-to = user speed must be 0 to 3000 m/s and height -500 to 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna must be patch, hemispherical or isotropic; got '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability must be in (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model must be klobuchar, vtec or none; got '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction must be ascending or descending; got '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satellite { $id }: bad eccentricity or perigee

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satellite { $id }: tle needs tle_line1 and tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit must be pass, elements or tle; got '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation needs a system or a design

engine-e-leo-pass-no-sun-synchronous-inclination = no sun-synchronous inclination

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: at most 5000 satellites

engine-e-leo-pass-no-leo-satellite-rises-above = no LEO satellite rises above the mask in the window

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s must be in (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' is not a band of any LEO satellite ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = no GNSS signal '{ $bname }' for constellation '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = empty GNSS constellation

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' are not two distinct bands of { $id }

engine-e-leo-pass-iot-powers-and-battery-must = iot powers and battery must be positive

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from must be median or peak; got '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = detection threshold { $detection_snr_db } dB after integration

engine-leo-pass-coherent-integration-at-most-ms = coherent integration at most { $rx } ms, capped by the Doppler rate

engine-leo-pass-serial-search-with-correlators = serial search with { $correlators } correlators

engine-leo-pass-hot-start-doppler-known-to = hot start: Doppler known to +/-{ $aided } Hz, ephemeris valid

engine-leo-pass-leo-pass-link-budget-user = LEO pass link budget, { $environment } user at { $lat_deg }, { $lon_deg }; { $satellites } LEO satellite(s), { $duration_s } s window{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, max elevation { $max_elevation_deg } deg at { $tca_s } s, { $duration_above_mask_s } s above the mask{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 peak { $opt } median { $opt2 }; |Doppler| max { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: { $satellites_in_view } in view, C/N0 { $opt } to { $opt2 } (median { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } peak { $leo_peak_cn0_dbhz } dB-Hz is { $leo_peak_above_gnss_median_db } dB above the GNSS median; above the strongest GNSS carrier for { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: cold TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), hot { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer from { $onset_s } s (jump { $offset_m } m, push { $push_rate_m_s } m/s): Doppler test GNSS { $t }, LEO { $t2 }, fused { $t3 }; cross-band { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = { $environment } user · LEO peak { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB above the GNSS median · MODELLED

engine-leo-pass-user-modelled = { $environment } user · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler of each LEO satellite's first band (±{ $v1 } kHz full scale)

engine-leo-pass-chart-title = LEO pass: C/N0 per band and Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 to 80): LEO bands in colour, GNSS in grey

engine-leo-pass-chart-time-axis = time since epoch, 0 to { $s } s

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = invalid [{ $what }] table: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' is neither in [signal] nor a public design ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' has no code-tracked component, so it gives no pseudorange

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind must be leo-pnt-chain; got { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = the tracked component has no chip rate

engine-e-leo-pnt-chain-no-band-of-pass-names = no band of [pass] names signal = "{ $name }"; the chain needs one to carry the design

engine-e-leo-pnt-chain-the-pass-gives-no-code = the pass gives no code jitter

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m must be in [0, 100] m; got { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] must run mode = "joint"; got { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = tracked C/N0 at the { $mask } deg mask (line fit in sin elevation)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] has no LEO system to receive the chain's values

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] produced no joint block

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT chain: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signal { $name2 } ({ $design }), tracked { $design2 } at { $v4 } Mchip/s, C/N0 offset { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }pass { $id } { $sat } km: tracked C/N0 peak { $peak_tracked_cn0_dbhz } dB-Hz, code jitter median { $jitter_median } m; C/N0 line { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }message { $res } { $fit_interval_s } s fit / { $update_period_s } s update: representation SISRE { $stats } mm RMS (orbit { $stats2 } mm), with { $od } m orbit determination: { $sisre } m handed on{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }fused fix: GNSS only { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP convergence: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } values handed between stages. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Code-tracking jitter, the ranging error (m, 0 to { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · GNSS only RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

engine-leo-pnt-chain-chart-subtitle = signal design -> pass C/N0 and code jitter -> message SISRE -> fused fix · { $label }

engine-leo-pnt-chain-chart-cn0-caption = Tracked-component C/N0 over the pass (dB-Hz, 20 to 80)

engine-leo-pnt-chain-chart-not-available = n/a

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulation { $label }: the width must be positive

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = unknown signal preset { $name }: the library has { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = preset { $name }: invalid preset file: { $e }

engine-e-leo-signal-preset-file-names-itself = preset file { $name } names itself { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz must be positive

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz must be positive

engine-e-leo-signal-signal-needs-at-least-one = { $name }: a signal needs at least one component

engine-e-leo-signal-component-power-fraction-must-be = { $name }: component { $v1 } power_fraction must be positive

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: component { $v1 } has fdma_shares but no fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: component { $v1 } fdma_shares must be positive and sum to one

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: component { $v1 } needs one fdma_share per offset

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps must be positive

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips must be positive

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: component power fractions sum to { $total }, not 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km must be positive

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: a flat (OFDM-like) component cannot be placed in the spectrum model

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: the tracked component sits on FDMA sub-carriers; the spectrum model tracks a component at the band centre

engine-e-leo-signal-signal-is-given-twice = signal { $w } is given twice

engine-e-leo-signal-signals-is-more-than-the = { $out } signals is more than the 24 allowed

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s must be below 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: give 1 to 40 cn0_dbhz values

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 and slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points must be between 21 and 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: use "coherent" or "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = the system noise temperature must be positive

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: unknown GNSS signal { $n } (known: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } is not a scenario signal

engine-e-leo-signal-shape-check-signal-is-not = shape check: signal { $signal } is not in the scenario

engine-leo-signal-scenario-leo-signal-signals-noise = scenario leo-signal | { $runs } signals | noise floor { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = left: band-limited PSD of each design (dB below peak, across its transmit band); right: code jitter vs total C/N0 at { $reference_spacing_chips } chip spacing

engine-leo-signal-chart-title = LEO-PNT signal designs

engine-leo-signal-chart-psd-axis = offset across ±0.6 × transmit bandwidth; 0 to −50 dB below each peak

engine-leo-signal-chart-jitter-caption = code jitter (m, log scale) vs total C/N0 (dB-Hz)

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = unknown band '{ $other }' (expected s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km must be finite and positive

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps must be finite and positive

engine-e-linkbudget-other-losses-db-must-be = other_losses_db must be finite and >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k must be finite and positive when supplied

engine-linkbudget-link-budget-band-km-bit = link-budget: { $value }-band, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, margin { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = cannot listen on { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: listening on tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: tcp client connected

engine-live-io-kshana-live-warning-is-not = kshana live: warning: { $addr } is not a loopback address; anything that can reach it can read the stream

engine-e-live-io-cannot-open = cannot open { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: dropped a tcp client that could not keep up

engine-e-live-io-cannot-open-2 = cannot open { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: warning: { $addr } is not a loopback address; anything that can reach it can send this layer a stream

engine-e-live-io-cannot-bind-udp = cannot bind udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: listening on udp { $addr }

engine-e-live-io-cannot-connect-to = cannot connect to { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: connected to tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: reading serial { $path } at { $baud } baud (read only)

engine-live-io-the-was-closed-by-the = the { $v1 } was closed by the peer (the layer does not reconnect: run it under a supervisor that restarts it)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: use 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 or 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } is not a serial device (tcgetattr failed)

engine-e-live-io-cannot-set-baud = cannot set { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = cannot set the line mode of { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial is supported on Unix only; use --file, --tcp or --stdin

engine-live-io-unknown-option = unknown option { $s }

engine-live-io-cannot-read = cannot read { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: vessel platform, calibrating for { $calibration_s } s; gate { $v2 }. Advisory software, not type-approved navigation equipment: the operator remains responsible.

engine-live-io-write-failed = write failed: { $e }

engine-live-io-kshana-live-dropped-udp-datagram = kshana live: dropped { $n } udp datagram(s) the engine could not take ({ $udp_dropped } in all)

## src/lunar.rs

engine-lunar-chart-title = Lunar south-pole HPL ({ $availability }% available, AL { $al } m, σ_URE { $sigma } m)

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } is outside 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = insertion index { $p } outside 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = Annex 3 files hold { $gold } and { $ter } codes, 210 expected

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } is not a Gold code of g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = secondary code S{ $id } does not exist (S0 to S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 assigns codes to node identifiers 1 to 12 only, not { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } does not fit two bits (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } outside 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = { $SB1_SYMBOLS } subframe-1 symbols expected

engine-e-lunar-afs-frame-subframe-data-lengths-expected = subframe data lengths { $sb2 }/{ $sb3 }/{ $sb4 } (expected { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = { $FRAME_SYMBOLS } symbols expected, { $soft } given

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = line { $v1 }: expected `row,column`

engine-e-lunar-afs-ldpc-line = line { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = line { $v1 }: ({ $r },{ $c }) outside { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: { $info_bits } information bits expected, { $info } given

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = the LSIS V1.0 data is not in { $cache_dir } (set KSHANA_LSIS_DIR or run xval/lunar-afs/fetch_lsis.sh, which downloads { $LSIS_PDF_URL } and extracts its attachments; they are not redistributed with Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } is not a pinned LSIS file

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } has SHA-256 { $got }, expected { $want } (pinned to LSIS V1.0 of 29 January 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal baseband, { $LSIS_VERSION }; Kshana reference generator

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = AFS node { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = AFS node { $node_id } frame TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites must be at least 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites must be at least 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg must be in [0, 90); got { $mask_deg }

engine-lunar-beacon-satellites-no-beacons = { $n_sats } satellites, no beacons

engine-lunar-beacon-satellites-visible-beacons = { $n_sats } satellites + { $n_vis_beacons } visible beacons

engine-lunar-beacon-satellites-no-beacons-2 = { $n_cmp } satellites, no beacons

engine-e-lunar-beacon-serialising-beacon-report = serialising beacon report: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = the beacon report must serialise to a JSON object

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Lunar surface-beacon augmentation — mask { $elevation_mask_deg } deg, epoch +{ $epoch_s } s, per-beacon sigma_URE { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  sats { $n_visible_sats }  beacons { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  realised 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }beacons improve PDOP by { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = a larger constellation instead, { $f }x{ "\u000A" }

engine-lunar-beacon-chart-title = Surface-beacon augmentation — PDOP by configuration

engine-lunar-beacon-chart-pdop = PDOP { $pdop }

engine-lunar-beacon-chart-no-solution = no solution

engine-lunar-beacon-chart-footnote = lower is better; per-beacon sigma_URE { $sigma } m, mask { $mask } deg

## src/lunar_combination.rs

engine-lunar-combination-chart-title = Lunar joint OD + clock — station 3-D position error (VLBI restores observability)

engine-lunar-combination-chart-subtitle = { $n_sat } sats, { $n_earth } Earth stations · improvement factor { $factor }×

engine-lunar-combination-chart-with-vlbi = with VLBI: { $m } m

engine-lunar-combination-chart-range-only = range-only: { $m } m

engine-lunar-combination-chart-axis-note = log10 station error (m); converged with/without = { $with }/{ $without }

## src/lunar_dpnt.rs

engine-lunar-dpnt-chart-title = Lunar differential PNT — { $n_sats } sats: corrected error vs baseline (× { $factor } reduction at { $km } km)

engine-lunar-dpnt-chart-subtitle = uncorrected { $uncorrected } m | corrected { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = uncorrected (standalone)

engine-lunar-dpnt-chart-baseline-km = baseline (km)

engine-lunar-dpnt-chart-err-m = err (m)

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = cannot read lunar ephemeris { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = lunar ephemeris: first line must be `{ $MAGIC }`, found `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = lunar ephemeris: file is empty

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = lunar ephemeris: `# format:` must be `states` or `elements`, found `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = lunar ephemeris: no data rows

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = lunar ephemeris: missing column `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = lunar ephemeris: `# elements_frame:` must be `icrf` or `mci`, found `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = lunar ephemeris: `elements_frame: icrf` needs `# epoch_jd_tdb:` (the epoch the elements are referred to, which is also where the ICRF-to-Moon-fixed rotation is evaluated): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = lunar ephemeris: short element row { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = lunar ephemeris: element row { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = lunar ephemeris: element row { $v1 } has a non-positive semi-major axis

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = lunar ephemeris: element row { $v1 } has eccentricity { $ecc }, outside [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = lunar ephemeris: a `states` file needs `# frame: icrf` or `# frame: mci`, found `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = lunar ephemeris: an `icrf` states file needs `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = lunar ephemeris: short state row { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = lunar ephemeris: state row { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = lunar ephemeris: state row { $v1 } is not finite

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = lunar ephemeris: state row { $v1 } for satellite { $sat } goes back in time ({ $t } after { $last }); epochs must be strictly increasing per satellite

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Tabulated Moon-centred state ephemeris ({ $e } frame), Lagrange-interpolated at order { $LAGRANGE_ORDER } between table epochs and reduced to MCMF by { $v2 }. The states are NOT propagated by this engine. Provenance class `published-ephemeris`: distinct from every element-derived figure.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Published constellation DEFINITION stated in Moon-centred ICRF (`{ $v1 }`), propagated by this engine's own Kepler solver in that same inertial frame and reduced to MCMF by the IAU 2015 / WGCCRE lunar orientation (precessing pole, analytic physical libration) at each epoch. NO frame approximation: the source names the frame and the epoch, and both are used. Provenance class `published-elements`: distinct from every kernel-derived figure.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Published constellation DEFINITION, propagated by this engine's own Kepler solver and reduced by the mean-rotation lunar spin model — exactly the path the illustrative constellation takes, so the only difference between the two runs is the constellation design. The source states the elements in the `{ $v1 }` frame; they are read here as MCI, which tilts the constellation by `published_frame_tie_angle_deg`. Provenance class `published-elements`: distinct from every kernel-derived figure.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = unknown station_datum { $other }: expected "fixed" or "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = a VLBI campaign needs at least 2 stations to form a baseline, got { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = station { $name } has a non-finite coordinate

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = station { $name } latitude { $lat } deg is outside [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = a seven-parameter Helmert datum needs at least 3 non-collinear beacons, got { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = beacon { $name } has a non-finite coordinate

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = beacon { $name } latitude { $lat } deg is outside [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours must be positive and finite, got { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min must be positive and finite, got { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = schedule of { $v1 } epochs is beyond this scenario's 5000-epoch guard; lengthen step_min or shorten arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s must be positive and finite, got { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg must be finite and in [-90, 90), got { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg must be finite and in [-90, 90), got { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol must be finite and in [0, 1), got { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m must be positive and finite, got { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver must be "spectral" or "srif", got "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = serializing lunar-frame-campaign result: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = no observation in the campaign clears the { $mask } deg Earth-side elevation mask at both ends of a baseline AND the { $earth_mask } deg mask above the beacon's own horizon: { $n_epochs } epochs x { $v1 } baselines x { $n_beacons } beacons all rejected. Lengthen arc_hours, lower a mask, or move the stations.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = full-rank: all 7 similarity parameters are constrained by this campaign (condition number { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: { $defect } of 7 similarity directions are unobservable from this campaign, so NO datum sigma is published; the unobservable directions are listed in the seven-parameter basis

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | { $n_beacons } beacons x { $v1 } baselines x { $n_epochs } epochs = { $n_obs } obs (delay sigma { $sigma_tau } s) | station datum { $station_datum } | Helmert rank { $rank }/7 cond { $condition } | datum translation sigma { $v5 } vs injected-transform recovery error { $trans_err_norm_m } m (ratio { $v7 })

engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } of { $beacons } beacons have no observation in this schedule ({ $names2 }); they carry no information, their sigmas are null, and the datum is realised from the observed beacons only

## src/lunar_frame_realise.rs

engine-lunar-frame-realise-chart-title = Lunar reference-frame realisation — 7-parameter Helmert recovery

engine-lunar-frame-realise-chart-subtitle = { $n_points } points · RMS residual { $rms } m · converged { $converged }

engine-lunar-frame-realise-chart-tx = tx (m)

engine-lunar-frame-realise-chart-ty = ty (m)

engine-lunar-frame-realise-chart-tz = tz (m)

engine-lunar-frame-realise-chart-theta-x = θx (µrad)

engine-lunar-frame-realise-chart-theta-y = θy (µrad)

engine-lunar-frame-realise-chart-theta-z = θz (µrad)

engine-lunar-frame-realise-chart-scale = scale (ppb)

engine-lunar-frame-realise-chart-row = { $label }: injected { $inj } { $unit } · recovered { $rec } { $unit } · err { $err }

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = all sigmas must be positive

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane and altitude_km must be positive

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency must be in (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m vs ground { $v2 } m position sigma, mean q { $v3 } (chi-square 6 expects 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } ambiguities, ILS success { $last2 } (bootstrap { $last3 }) on the longest arc

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: smallest information eigenvalue x{ $v } with orbiter links, CRLB trace x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } sweep points on { $v } arcs; laser-vs-GNSS x translation sigma { $last2 } m at the registered local tie

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: CRLB sigma h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = unknown study `{ $other }`: expected one of { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = the measurement set does not determine the orbit (singular information)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials must be at least 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = ground sigmas must be positive

engine-e-lunar-infra-od-unknown-station-dss-14-dss = unknown station `{ $nm }`: DSS-14, DSS-63 or DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = too few ground measurements to determine the orbit

engine-e-lunar-infra-od-the-covariance-of-the-difference = the covariance of the difference is singular

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = the NRHO differential correction did not converge from the seed

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo needs 0 < perilune altitude < apolune altitude

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = unknown orbit family `{ $other }`: nrho or elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s and arc_days must be positive

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = no common satellite between the receivers

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = the carrier-phase normal equations are singular

engine-e-lunar-infra-phase-the-position-block-is-singular = the position block is singular

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = the ambiguity covariance is not positive definite

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = technique sigmas must be positive

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = local-tie sigmas must be positive

## src/lunar_interop.rs

engine-lunar-interop-chart-title = Lunar interoperability export — CCSDS OEM + KIF (LunaNet/IOAG-aligned)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | { $n_states } states | OEM { $oem_lines } lines

engine-lunar-interop-chart-artifacts = artifacts: { $list }

engine-lunar-interop-chart-pass = PASS

engine-lunar-interop-chart-fail = FAIL

engine-lunar-interop-chart-ok = OK

engine-lunar-interop-chart-conformance = field conformance: { $verdict } ({ $present } present, { $missing } missing, { $data_lines } data lines)

engine-lunar-interop-chart-roundtrip = OEM round-trip: { $oem } | time-metadata round-trip: { $time_metadata } | KIF { $kif_bytes } bytes

engine-lunar-interop-chart-footnote = Round-trip / field conformance vs CCSDS OEM + published LunaNet/IOAG field semantics. { $label } — not a certified interoperability conformance test; no agency endorsement.

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz must be finite and positive

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz must be finite and positive

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k must be finite and positive

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km must be finite and above the lunar radius

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity must be in [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw must be finite

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | { $n_sats } sats, { $n_epochs } epochs, { $n_links } links from ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (mean { $mean_js_db }) | { $n_lost } LOST | availability { $availability_under_jamming } of { $availability_nominal } nominal

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | { $n_sats } sats, { $n_epochs } epochs, { $n_links } links from ({ $site_lat_deg }, { $site_lon_deg }) | no jammer (clean-sky lunar baseline) | { $n_lost } LOST | availability { $availability_nominal }

engine-lunar-jamming-chart-title = Per-satellite J/S vs elevation, lunar surface user

engine-lunar-jamming-chart-y-title = J/S (dB)

engine-lunar-jamming-chart-x-title = satellite elevation (deg)

engine-lunar-jamming-chart-locked = LOCKED

engine-lunar-jamming-chart-degraded = DEGRADED

engine-lunar-jamming-chart-lost = LOST

engine-lunar-jamming-chart-n-links = { $n_links } links

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = unexpected reflector-catalogue header { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = short reflector-catalogue row { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = unreadable reflector field { $i } in { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = reflector { $f }: |(x,y,z)| = { $norm3 } m but the published radius column says { $radius } m — the row has been edited

engine-e-lunar-llr-reflector-catalogue-has-no-rows = reflector catalogue has no rows

engine-e-lunar-llr-unreadable-position-epoch-year = unreadable position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = unexpected station-catalogue header { $t }

engine-e-lunar-llr-short-station-catalogue-row = short station-catalogue row { $t }

engine-e-lunar-llr-unreadable-station-field-in = unreadable station field { $i } in { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = unreadable ILRS id in { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = station catalogue has no rows

engine-e-lunar-llr-cannot-read-this-scenario-runs = cannot read { $path } ({ $e }). This scenario runs on the committed real-data slice under { $DEFAULT_DATA_DIR }, which ships with the repository but not with the published crate; point `data_dir` at a copy of it.

engine-e-lunar-llr-only-usable-normal-points-for = only { $used } usable normal points for { $reflectors } reflectors — too few to bound { $v3 } coordinates; widen the archive slice

engine-e-lunar-llr-the-simulated-campaign-own-report = the simulated campaign's own report did not parse: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: { $used } archived normal points ({ $n_parsed } parsed) from { $station_counts } station(s) to { $reflectors } retroreflector arrays over { $v5 } d; median measured normal-point precision { $median } mm one-way; reflector information rank { $rank }/{ $n }; Helmert rank { $rank2 }/{ $n_helmert } cond { $condition }; datum translation sigma { $v12 } m; observed-minus-computed one-way residual RMS { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg must be finite and in [-90, 90), got { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } has a non-finite coordinate

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } latitude { $lat_deg } deg is outside [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = serialising the lunar-llr-datum report failed: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = the integration step must divide the output step

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } must be finite and not negative

engine-lunar-receiver-must-be-finite-and-positive = { $n } must be finite and positive

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: export site: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = lunar ephemeris { $path } covers { $until } s past its epoch but the scenario horizon reaches { $last } s; shorten horizon_hours or retrieve a longer arc (extrapolating a tabulated ephemeris is refused)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path needs epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = OP frame at { $epoch } UTC (Earth's apparent orbit normal about the Moon, x along its node on the IAU lunar equator); lunar GM, J2 and C22 in the IAU Moon-fixed frame, Earth and Sun third bodies at DE440 positions from { $spk_path }; fourth-order Runge-Kutta, 10 s step

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m must be finite and positive

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m must be finite and positive

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 needs height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites must be 3 or 4, got { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs must be 1 to 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } must be finite and positive

engine-lunar-station-must-be-finite-and-not = { $name } must be finite and not negative

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } exceeds { $MAX_WORK }; lower n_trials, coarsen grid_lat_step_deg (or list fewer points), or raise t_step_s / shorten t_span_s

engine-e-lunar-station-kind-must-be-got = kind must be { $KIND }; got { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: the ephemeris { $path } covers { $until } s but the run reaches { $last } s (the last epoch plus latency_s); shorten t_span_s

engine-e-lunar-station-no-case = { $KIND }: no case ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } points · { $n_epochs } epochs · { $n_trials } trials

engine-lunar-station-hpl-max = HPL max { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = survey { $survey_sigma_m } m · latency { $latency_s } s · { $quantization_bits } bits

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines and samples must be 2 to { $MAX_DEM_SIDE }, got { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } heights for a { $lines } x { $samples } grid

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m must be positive, got { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m must be positive, got { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: cannot read { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection must be south-polar-stereographic, got { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type must be int16-le, got { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: cannot read { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: grid over the { $MAX_DEM_SIDE }-pixel cap

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } is { $bytes } bytes; { $lines } x { $samples } int16 needs { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: { $img } SHA-256 { $digest } does not match the descriptor's { $image_sha256 }

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor must be positive

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: cannot read { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: needs at least 2 x 2 points, an increasing extent inside [-90, 90] deg and 360 deg of longitude, and finite heights

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } must be finite and positive, got { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m must be finite and not negative, got { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg must be at most 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m must be 1 to 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: the site is outside the height field

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: a stated horizon needs a non-empty source

engine-e-lunar-terrain-terrain-stated-horizon = terrain: stated horizon: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: give dem_path or dem_tile_path, not both

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km must be finite and positive

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m must be finite and positive

engine-e-lunar-terrain-site-deg-deg = { $e } (site { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = unknown clock { $other }; expected one of optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks must name at least one clock class

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s must be finite and positive, got { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s must be finite and greater than tau_min_s ({ $lo }), got { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade must be ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = term { $name } is shorter than the tau grid

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | clock { $clock } | 7-term x_Σ(τ) over { $taus } τ-points ({ $taus2 }–{ $taus3 } s) | crossover τ { $crossover_tau_s } s (x { $crossover_x_s } s) | frame floor { $frame_term_s } s | clock x(1 d) { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | time lab: { $lab } { $lab2 } to LTC, x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: unknown clock { $other }; expected one of optical-master, passive-h-maser, rafs, mini-rafs, or give a device_card instead

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: give either clock or device_card, not both

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s must be finite and positive, got { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } must be finite and non-negative, got { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s must be positive numbers

engine-lunar-time-lab-station-height-not-modelled-exactly = station height not modelled exactly: a { $height_sigma_m } m one-sigma height error biases the rate by { $value } ns/day, applied as a linear term since the last steer

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = light time did not converge to 1e-15 s in 30 iterations

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = the kernel path needs planetary_kernel_path, earth_orientation_kernel_path and moon_orientation_kernel_path together

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = unknown datum { $other }: expected "anchor-first-station", "free-network" or "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = a VLBI schedule needs at least 2 stations to form a baseline, got { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = beacon coordinates must be finite

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = beacon latitude { $lat } deg is outside [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = schedule of { $v1 } epochs is beyond this scenario's 20000-epoch guard; lengthen step_min or shorten arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g must be positive and finite, got { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = serializing lunar-vlbi-fim result: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = no observation in the schedule clears the { $mask } deg elevation mask at both ends of a baseline: { $n_epochs } epochs x { $v1 } baselines all rejected. Lengthen arc_hours, lower elevation_mask_deg, or move the stations.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = the datum leaves no parameter to estimate

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: { $defect } of { $dim } directions are unobservable, so no per-coordinate sigma is reported; the observable-subspace value below is a pseudo-inverse restricted to the { $rank } observable directions and is NOT a station sigma

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | { $n_stations } stations / { $v2 } baselines x { $n_epochs } epochs = { $n_obs } obs (mask { $mask } deg) | datum { $datum } | rank { $rank }/{ $dim } cond { $condition } | station sigma { $v10 } vs equipartition g={ $g } { $eq_g } m (ratio { $v13 })

## src/main.rs

engine-main-fail = error: { $e }

engine-main-error-validate-needs-scenario-path = error: --validate needs a scenario path

engine-main-error-study-needs-suite-manifest = error: --study needs a suite manifest path

engine-main-error-study-name-needs-value = error: --study-name needs a value

engine-main-error-export-sp3-needs-path = error: --export-sp3 needs a path

engine-main-error-export-omm-needs-path = error: --export-omm needs a path

engine-main-error-export-oem-needs-path = error: --export-oem needs a path

engine-main-error-animate-needs-format-svg = error: --animate needs a format: svg, html, frames or all

engine-main-error-animate = error: --animate: { $e }

engine-main-error-animate-fps-needs-whole = error: --animate-fps needs a whole number of frames per second

engine-main-error-export-needs-format-czml = error: --export needs a format: czml, kml, geojson, stk, sigmf, all or list

engine-main-error-animate-duration-needs-length = error: --animate-duration needs a length in seconds

engine-main-error-import-route-needs-geojson = error: --import-route needs a GeoJSON file path

engine-main-error-eop-needs-finals2000a-file = error: --eop needs a finals2000A file path

engine-main-error-unknown-option = error: unknown option '{ $other }'

engine-main-error-unexpected-argument-one-scenario = error: unexpected argument '{ $other }'; one scenario file per run

engine-main-warning-animate-fps-and-animate = warning: --animate-fps and --animate-duration do nothing without --animate

engine-main-error-animate-exports-one-scenario = error: --animate exports one scenario run; it does not combine with --validate or --study

engine-main-error-validate-lints-one-scenario = error: --validate lints one scenario; do not also pass a scenario file

engine-main-error-cannot-read = error: cannot read { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind resolves; this kind requires no field (an empty body runs its reference configuration), so there was nothing further to check

engine-main-ok-kind-resolves-and-all = ok: { $kind } — kind resolves and all { $n_required } of its published required-field entries are satisfied; field values are not checked

engine-main-error-study-runs-suite-do = error: --study runs a suite; do not also pass a single scenario file

engine-main-warning-study-name-is-ignored = warning: --study-name is ignored with --study; a study is titled by the suite manifest's `title =`

engine-main-error-cannot-read-2 = error: cannot read { $path }: { $e }

engine-main-hint-kshana-example-lists-the = hint: `kshana example` lists the bundled reference scenarios; `kshana example clock-holdover > clock-holdover.toml` writes one

engine-main-error-cannot-read-3 = error: cannot read { $eop_file }: { $e }

engine-main-error-eop = error: --eop: { $e }

engine-main-error-cannot-read-4 = error: cannot read { $route_file }: { $e }

engine-main-error-import-route = error: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: does not apply: { $why }

engine-main-error-export = error: --export: { $e }

engine-main-error-animate-2 = error: --animate { $f }: { $e }

engine-main-error-export-2 = error: { $fmt } export: { $e }

engine-main-error-cannot-write = error: cannot write { $json_path }: { $e }

engine-main-error-cannot-write-2 = error: cannot write { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = error: cannot build the report: { $e }

engine-main-error-cannot-write-3 = error: cannot write { $html_path }: { $e }

engine-main-error-cannot-write-4 = error: cannot write { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = error: cannot write { $csv_path }: { $e }

engine-main-wrote-and = wrote { $json_path }, { $svg_path }, { $html_path }, { $report_json_path }, and { $csv_path }

engine-main-wrote-and-2 = wrote { $json_path }, { $svg_path }, { $html_path }, and { $report_json_path }

engine-main-error-cannot-write-6 = error: cannot write { $target }: { $e }

engine-main-error-cannot-write-7 = error: cannot write { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = error: SP3 export failed: { $e }

engine-main-error-cannot-write-8 = error: cannot write { $omm_path }: { $e }

engine-main-error-omm-export-failed = error: OMM export failed: { $e }

engine-main-error-cannot-write-9 = error: cannot write { $oem_path }: { $e }

engine-main-error-oem-export-failed = error: OEM export failed: { $e }

engine-main-error-unexpected-argument-after-kinds = error: unexpected argument '{ $other }' after `kinds`; only --json is accepted

engine-main-bundled-reference-scenarios-write-one =
    Bundled reference scenarios ({ $v1 }). Write one to a file and run it:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (not bundled: { $name } — run `kshana example { $name }` for why)

engine-main-error-is-not-bundled-it = error: '{ $name }' is not bundled: it { $why }

engine-main-error-no-bundled-scenario-named = error: no bundled scenario named '{ $name }'; `kshana example` lists the { $v1 } that are

engine-main-error-cannot-read-5 = error: cannot read { $suite_path }: { $e }

engine-main-wrote-and-3 = wrote { $json_path } and { $html_path }

engine-main-error-needs-value = error: { $a } needs a value

engine-main-error-expected-mean-needs-number = error: --expected-mean needs a number

engine-main-error-unknown-imu-fit-option = error: unknown imu-fit option { $x }

engine-main-error-imu-fit-needs-an = error: imu-fit needs an IMU log path

engine-main-error-needs-value-2 = error: { $args } needs a value

engine-main-error-epoch = error: --epoch: { $e }

engine-main-error-unknown-bench-export-option = error: unknown bench-export option { $a }

engine-main-error-bench-export-needs-scenario = error: bench-export needs a scenario path

engine-main-needs-value = { $a } needs a value

engine-main-site-takes-lat-lon-height = --site takes lat,lon[,height_m], got { $v }

engine-main-error-is-bytes-the-tle = error: { $p } is { $m } bytes; the TLE cap is { $cap } (4 MiB)

engine-main-error-cannot-read-6 = error: cannot read { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = unknown sky option { $a }

engine-e-main-svg-and-monte-carlo-are = --svg and --monte-carlo are separate outputs; give one

engine-main-error-preset-needs-name =
    error: --preset needs a name
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    error: --profile needs a file
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } symbols, { $r2 } frame(s) found; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }frame at { $f }: FID { $f2 } TOI { $f3 } (SB1 metric { $f4 }, { $f5 } SP error(s), { $f6 } SB1 error(s))

engine-main-not-checked = not checked: { $r }

engine-main-wrote-frame-of-6000-symbols = wrote { $out }: { $frames } frame(s) of 6000 symbols; subframes 2 to 4 are placeholders (not LDPC coded, no message)

engine-main-error-cannot-write-10 = error: cannot write { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = unknown lunanet-afs-check subcommand { $other }

engine-main-needs-pack-id = { $cmd } needs a pack id

engine-main-unknown-standards-pack-run-option = unknown standards-pack run option { $a }

engine-main-unknown-standards-pack-subcommand = unknown standards-pack subcommand { $other }

engine-main-error-out-needs-value = error: --out needs a value

engine-main-error-unknown-compliance-report-option = error: unknown compliance-report option { $a }

engine-main-error-compliance-report-needs-at = error: compliance-report needs at least one result .json file

engine-main-runs-read-not-used-rows = { $runs } runs read, { $unrecognised } not used; rows: { $n } evidenced, { $n2 } partly, { $n3 } not evidenced, { $n4 } out of scope

engine-main-error-receiver-trust-needs-scenario = error: receiver-trust needs a scenario path

engine-main-error-invalid-receiver-trust-scenario = error: invalid receiver-trust scenario: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = burn exhausts mass: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, burn={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = time of flight must be positive

engine-e-maneuver-collinear-endpoints-transfer-plane-is = collinear endpoints: transfer plane is undefined (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs is for M >= 1; use lambert for M = 0

engine-e-maneuver-no-revolution-transfer-the-time = no { $revs }-revolution transfer: the time of flight is below its minimum

engine-e-maneuver-grid-step-days-must-be = grid_step_days must be positive, got { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = each window must run forward (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = no transfer of the requested type in the windows

engine-e-maneuver-the-optimum-left-the-feasible = the optimum left the feasible region

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: expected 3 values

engine-e-mars-od-dss-epoch-is-not-2003 = DSS-{ $id } epoch is not 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } has no DXYZ

engine-e-mars-od-no-coordinates-for-dss = no coordinates for DSS { $station }

engine-e-mars-od-no-ramps-for-dss = no ramps for DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = ramp table does not cover the interval

engine-e-mars-od-epoch-outside-the-integrated-span = epoch { $et } outside the integrated span

engine-e-mars-od-normal-matrix-is-not-positive = normal matrix is not positive definite

engine-e-mars-od-no-points = no points

engine-e-mars-od-parameter-has-no-partial-on = a parameter has no partial on the kept points

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | { $user } user, { $clock_class } clock | { $n_relays } relays (mean { $mean_relays_in_view } in view) | converged pos RMS { $converged_pos_rms_m } m, formal 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — covariance FoM, not a certified PL) | clock-freq σ { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — { $user } user, { $clock_class } clock: 3-D position error vs truth (converged RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = pairwise matrix is empty

engine-e-mcda-ahp-pairwise-matrix-is-not-square = pairwise matrix is not square (row { $i } has { $row } of { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = entry a[{ $i }][{ $j }] = { $v } must be finite and positive

engine-e-mcda-ahp-diagonal-must-be = diagonal a[{ $i }][{ $i }] = { $row } must be 1

engine-e-mcda-ahp-entries-must-be-reciprocal = entries a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } must be reciprocal (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = upper row { $i } has { $row } entries, expected { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = upper entry ({ $i },{ $j }) = { $v } must be finite and positive

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: empty decision matrix

engine-e-mcda-copras-copras-no-criteria = COPRAS: no criteria

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS: { $n } weights but { $types } criterion types

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: requires at least one cost (Min) criterion

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS: alternative { $i } has { $row } values but there are { $n } criteria

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: alternative { $i } criterion { $j } value { $x } must be finite and > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: empty dataset

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: no criteria

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I: alternative { $i } has { $row } values but there are { $n } criteria

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: alternative { $i } has a non-finite value

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: empty decision matrix

engine-e-mcda-moora-moora-no-criteria = MOORA: no criteria

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA: { $n } weights but { $types } criterion types

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA: alternative { $i } has { $row } values but there are { $n } criteria

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: alternative { $i } has a non-finite value

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: criterion { $j } has zero L2 norm

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: empty decision matrix

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: no criteria

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II: { $n } weights but { $types } types / { $prefs } preference functions

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II: alternative { $i } has { $row } values but there are { $n } criteria

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: alternative { $i } has a non-finite value

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: empty decision matrix

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: no criteria

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS: { $n } weights but { $types } criterion types

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS: alternative { $i } has { $row } values but there are { $n } criteria

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: alternative { $i } has a non-finite value

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = additive utility has no attributes

engine-e-mcda-utility-attributes-but-weights = { $attributes } attributes but { $weights } weights

engine-e-mcda-utility-invalid-scaling-constant = invalid scaling constant { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = scaling constants sum to zero

engine-e-mcda-utility-attribute-values-expected-got = { $attributes } attribute values expected, got { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: empty decision matrix

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: no criteria

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR: { $n } weights but { $types } criterion types

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR: alternative { $i } has { $row } values but there are { $n } criteria

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: alternative { $i } has a non-finite value

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: empty decision matrix

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: no criteria

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS: { $n } weights but { $types } criterion types

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } must lie in [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS: alternative { $i } has { $row } values but there are { $n } criteria

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: alternative { $i } criterion { $j } value { $x } must be finite and > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: empty decision matrix

engine-e-mcda-wpm-wpm-no-criteria = WPM: no criteria

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM: { $n } weights but { $types } criterion types

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM: alternative { $i } has { $row } values but there are { $n } criteria

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: alternative { $i } criterion { $j } value { $x } must be finite and > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = decision matrix has no criteria

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = decision matrix has no alternatives

engine-e-mcda-wsm-criterion-has-an-invalid-weight = criterion '{ $name }' has an invalid weight { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = criterion weights sum to zero

engine-e-mcda-wsm-alternative-has-values-but-there = alternative '{ $name }' has { $values } values but there are { $n } criteria

engine-e-mcda-wsm-alternative-has-non-finite-value = alternative '{ $name }' has a non-finite value on criterion '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = not a DAF: shorter than one record

engine-e-naif-kernel-not-daf-identification-word = not a DAF: identification word { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = unsupported DAF binary format { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = implausible DAF header: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF address { $addr } beyond the end of the file

engine-e-naif-kernel-bad-daf-address-range = bad DAF address range { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = DAF summary list does not terminate

engine-e-naif-kernel-daf-summary-record-claims-summaries = DAF summary record { $rec } claims { $count } summaries

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = malformed type-2 segment: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = type-2 segment size does not match its directory

engine-e-naif-kernel-epoch-outside-the-record = epoch { $et } outside the record [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = type-1 segment size does not match its N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = malformed type-1 record: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = not an SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = SPK summary is not ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = no SPK type-1/2 data for body { $target } at ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = SPK segment for { $target } is in frame { $frame }, not J2000

engine-e-naif-kernel-spk-centre-chain-does-not = SPK centre chain does not reach the barycentre

engine-e-naif-kernel-not-binary-pck = not a binary PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = PCK summary is not ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = no PCK type-2 data for frame { $body_frame } at ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = PCK frame { $body_frame } is given against frame { $other }, which is not J2000 or ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = bad number { $s }

engine-e-navsignal-must-be-positive-number = { $s } must be a positive number

engine-e-navsignal-modulation-expected-name-args-bpsk = modulation { $label }: expected NAME(args), e.g. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulation { $label }: missing closing parenthesis

engine-e-navsignal-modulation-is-not-one-of = modulation { $label } is not one of BPSK(n), BOC(m,n) or MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = unterminated entity in { $s }

engine-e-ndm-xml-bad-character-reference = bad character reference &{ $ent };

engine-e-ndm-xml-unknown-entity = unknown entity &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = unterminated processing instruction

engine-e-ndm-xml-unterminated-comment = unterminated comment

engine-e-ndm-xml-unterminated-declaration = unterminated declaration

engine-e-ndm-xml-expected-an-element-at-byte = expected an element at byte { $pos }

engine-e-ndm-xml-unterminated-start-tag = unterminated start tag

engine-e-ndm-xml-attribute-without-value = attribute without a value

engine-e-ndm-xml-unterminated-attribute-value = unterminated attribute value

engine-e-ndm-xml-unterminated-end-tag = unterminated end tag

engine-e-ndm-xml-unterminated-cdata = unterminated CDATA

engine-e-ndm-xml-content-after-the-root-element = content after the root element

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } must be finite and non-negative

engine-e-nma-budget-subframe-must-be-positive = subframe_s must be positive

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps must be positive

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed must be 0 or positive

engine-e-nmea-synth-cli-unexpected-argument = unexpected argument { $s }

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = instructor log: { $e }

engine-nmea-synth-cli-instructor-log-and = instructor log: { $jp } and { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP server listening on { $s }; waiting for { $wait_clients } client(s)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = expected YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = date or time out of range (years 1980 to 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = no such calendar date

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } must be a finite number

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s must lie in 1 to 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz must be 1, 2, 5 or 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = vessel position must lie within 89 degrees of the equator

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn must lie in 0 to 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = vessel rate-of-turn and acceleration limits must be positive

engine-e-nmea-synth-config-give-at-least-one-waypoint = give at least one [[waypoint]] or vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = waypoint { $v1 } is out of range

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = waypoint { $v1 } speed_kn must lie in 0 to 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems must name at least one constellation

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } is not one of { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s must be at least 1

engine-e-nmea-synth-config-event = event { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s must lie inside the run

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s must be positive; ramp_s and recovery_s not negative

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s must not exceed duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } does not apply to this kind

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz must lie in 20 to 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db is required

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db must lie in 0 to 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db must lie in 0 to 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m is required

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m must lie in 0 to 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = the drag would accelerate the false track at up to { $need } m/s^2, above max_accel_mps2 = { $a }; lengthen ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = give exactly one of bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s is required

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s must be non-zero and within a day

engine-e-nmea-synth-config-delay-is-required = delay_s is required

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s must lie in 0 to 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = the skyline describes no obstruction

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } has ended

engine-nmea-synth-gen-the-receiver-reports-fix-again = the receiver reports a fix again ({ $n_used } satellites used)

engine-nmea-synth-gen-the-receiver-has-no-fix = the receiver has no fix ({ $n_used } usable satellites, four needed)

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = from T+{ $start_s } s for { $duration_s } s (onset ramp { $ramp_s } s, recovery ramp { $recovery_s } s)

engine-nmea-synth-log-every-tracked-satellite-shows-db = ; every tracked satellite shows { $c } dB-Hz while it lasts

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: received C/N0 falls by up to { $cn0_drop_db } dB (per-satellite spread { $spread_db } dB); satellites drop out and the fix is lost when fewer than four remain usable

engine-nmea-synth-log-towards-deg-true = towards { $b } deg true

engine-nmea-synth-log-towards-deg-true-deg-relative = towards { $t } deg true ({ $r } deg relative to the course at onset, then held)

engine-nmea-synth-log-position-drag-off-the-reported = position drag-off: the reported position walks { $final_offset_m } m away { $dir } while the receiver keeps a valid fix (false track peaks at { $pv } m/s and { $pa } m/s^2){ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = time spoof: reported UTC moves { $offset_s } s from true; position stays true{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = replay delay (meaconing style): position{ $v1 } lags the truth by { $delay_s } s{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = natural degradation: the sky closes behind a stated skyline ({ $e }); satellites behind it stay listed with no SNR and are not used, the C/N0 of the rest is unchanged, and nothing is counterfeit

engine-nmea-synth-log-instructor-log = INSTRUCTOR LOG: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Trainer note: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Start { $start_utc }   duration { $duration_s } s   seed { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }PEAKS  true: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   reported: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: unknown constellation { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }The tolerance is below the f64 rank-read noise floor { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): its equivalent eigenvalue floor rel_tol^2 = { $v1 } sits under the rounding noise of the Gram matrix, so the extra directions are arithmetic residue, not observability.

engine-observability-gramian-rank-clamped-from-the-singular = rank clamped from the singular-value count { $counted } to min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } at rel_tol { $rel_tol }: a { $n_rows }x{ $n_cols } matrix cannot have rank { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP undefined (rank-deficient / singular geometry): rank { $rank } of { $n } states, datum defect { $v3 }, condition { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bytes is not a whole number of 36-byte records

engine-e-odf-record-precedes-any-group-header = record { $v1 } precedes any group header

engine-e-odf-no-orbit-data-group = no orbit data group

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } is not a keyword of { $name }

engine-e-odm-without = { $name } without { $k }

engine-e-odm-needs-exactly-one-of = { $name } needs exactly one of { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION and MESSAGE_ID are version-3.0 header keywords (version { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = unexpected line { $b }

engine-e-odm-unknown-keyword = unknown keyword { $k }

engine-e-odm-block-repeated-or-out-of = { $block } block repeated or out of order at { $key }

engine-e-odm-repeated = { $key } repeated

engine-e-odm-comments-after-the-last-keyword = comments after the last keyword

engine-e-odm-given-twice = { $b } given twice

engine-e-odm-opm-without-metadata = OPM without metadata

engine-e-odm-opm-without-state-vector = OPM without state vector

engine-e-odm-omm-without-metadata = OMM without metadata

engine-e-odm-omm-without-mean-elements = OMM without mean elements

engine-e-odm-is-not-keyword-of-the = { $k } is not a keyword of the { $kind } block

engine-e-odm-block-without = { $kind } block without { $k }

engine-e-odm-block-with-data-lines = { $kind } block with data lines

engine-e-odm-line-has-values-expected = { $kind } line { $l } has { $l2 } values, expected { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } is not an OCM metadata keyword

engine-e-odm-ocm-metadata-without = OCM metadata without { $k }

engine-e-odm-block-repeated = { $kind } block repeated

engine-e-odm-inside-block = { $t } inside a block

engine-e-odm-unsupported-ocm-block = unsupported OCM block { $tag }

engine-odm-outside-block = { $t } outside a block

engine-e-odm-closes-block = { $t } closes a { $want } block

engine-e-odm-unexpected-line-2 = unexpected line { $t }

engine-e-odm-outside-block = { $k } outside a block

engine-e-odm-unterminated-block = unterminated block

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = epoch missing 'T' date/time separator: { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = unsupported OEM epoch date '{ $date }' (expected yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = unsupported OEM epoch time '{ $time }' (expected HH:MM:SS)

engine-e-oem-bad-epoch-year = bad epoch year: { $d }

engine-e-oem-bad-epoch-month = bad epoch month: { $d }

engine-e-oem-bad-epoch-day = bad epoch day: { $d }

engine-e-oem-bad-epoch-hour = bad epoch hour: { $t }

engine-e-oem-bad-epoch-minute = bad epoch minute: { $t }

engine-e-oem-bad-epoch-second = bad epoch second: { $t }

engine-e-oem-oem-epoch-field-out-of = OEM epoch field out of range: { $s }

engine-e-oem-unexpected-oem-header-line = unexpected OEM header line: { $line }

engine-e-oem-expected-meta-start-found = expected META_START, found: { $line }

engine-e-oem-unexpected-oem-metadata-line = unexpected OEM metadata line: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM segment metadata missing META_STOP

engine-e-oem-oem-metadata-missing-object-name = OEM metadata missing OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = OEM metadata missing OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = OEM metadata missing CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = OEM metadata missing REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = OEM metadata missing TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = OEM metadata missing START_TIME

engine-e-oem-oem-metadata-missing-stop-time = OEM metadata missing STOP_TIME

engine-e-oem-oem-data-line-needs-position = OEM data line needs position+velocity (6) or +acceleration (9) components, got { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = non-numeric OEM state value '{ $t }' in: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM missing CCSDS_OEM_VERS header

engine-e-oem-oem-missing-creation-date-header = OEM missing CREATION_DATE header

engine-e-oem-oem-missing-originator-header = OEM missing ORIGINATOR header

engine-e-oem-oem-carried-no-segments = OEM carried no segments

engine-oem-oem-interop-round-tripped-segment = oem-interop: round-tripped { $segments } segment(s), { $n_states_total } states; max round-trip error { $p } km / { $v } km/s (MODELLED interop)

engine-oem-oem-interop-ingested-segment-states = oem-interop: ingested { $segments } segment(s), { $n_states_total } states from external OEM (originator { $originator }) (MODELLED interop)

engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = no COVARIANCE_START block

engine-e-oem-no-covariance-stop = no COVARIANCE_STOP

engine-e-oem-bad-covariance-value = bad covariance value '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = expected 21 covariance values, found { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM export needs full (line 1 + line 2) TLEs; this block has none

engine-omm-ccsds-omm-vers = CCSDS_OMM_VERS = { $version }{ "\u000A" }

engine-omm-mean-element-theory = MEAN_ELEMENT_THEORY = { $mean_element_theory }{ "\u000A" }

engine-omm-mean-motion = MEAN_MOTION = { $mean_motion_rev_day }{ "\u000A" }

engine-omm-ra-of-asc-node = RA_OF_ASC_NODE = { $ra_of_asc_node_deg }{ "\u000A" }

engine-omm-arg-of-pericenter = ARG_OF_PERICENTER = { $arg_of_pericenter_deg }{ "\u000A" }

engine-omm-mean-anomaly = MEAN_ANOMALY = { $mean_anomaly_deg }{ "\u000A" }

engine-omm-ephemeris-type = EPHEMERIS_TYPE = { $ephemeris_type }{ "\u000A" }

engine-omm-classification-type = CLASSIFICATION_TYPE = { $classification }{ "\u000A" }

engine-omm-norad-cat-id = NORAD_CAT_ID = { $norad_cat_id }{ "\u000A" }

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } must be in [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg must be in [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave must be "plane" or "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction must be "downlink" or "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = availability_targets_pct entries must be in (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h must be at most 8760 (one year)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } steps is above the { $MAX_STEPS } a result carries; raise step_s or shorten duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = unknown clock class "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = every site needs a name

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = site { $name }: latitude/longitude out of range

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = site { $name }: altitude_m must be in [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm at { $elevation_deg } deg elevation, margin { $margin0 } dB before the atmosphere; best site { $scn } { $v5 } %; { $order }-site network { $last } % independent / { $last2 } % correlated weather (MODELLED, advisory)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = rinex block parsed but contained no supported ephemerides

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg must be in [-90, 90] and every field finite

engine-e-orbit-no-satellites-to-export = no satellites to export

engine-e-orbit-time-step-must-be-positive = time.step_s must be positive for SP3 export

engine-e-orbit-time-step-must-be-positive-2 = time.step_s must be positive for OEM export

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } must be positive; got { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s must be finite and non-negative

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate must be finite and non-negative

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = spoofer minimum elevation must be in [0, 90) degrees

engine-e-orbital-timing-cross-check-sigma-ns-must = cross-check sigma_ns must be finite and non-negative

engine-orbital-timing-the-in-plane-neighbour-degrees = the in-plane neighbour, { $v1 } degrees ahead, is outside a single spoofer's footprint ({ $v2 } degrees across)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = the in-plane neighbour, { $v1 } degrees ahead, can be inside the same spoofer's footprint ({ $v2 } degrees across), so both clocks can be pulled together

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = missing input file

engine-e-osnma-cli-max-time-error-has-no = --max-time-error has no effect without --reference-time

engine-e-osnma-cli-not-number = not a number: { $s }

engine-e-osnma-cli-public-key-must-be-id = public key must be ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = public key type must be p256 or p521

engine-e-osnma-cli-unknown-format = unknown format { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } is not text; use --format ubx for a UBX stream

engine-e-osnma-cli-vector-csv-needs-start-gst = a vector CSV needs --start-gst or a dated file name

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    error: cannot read { $input }: { $e }

engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA verification
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = input: { $input } ({ $pages } pages)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: { $frames } frames; { $inav_pages } I/NAV pages decoded, { $pages } placed in time ({ $bad_crc } bad CRC, { $unstamped } unplaceable, { $time_conflicts } time conflicts)

engine-osnma-cli-overall-nma-status = overall: { $status_word }   NMA status: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALERT: a verified OSNMA alert message was received. Stop using OSNMA data; nothing is reported as authenticated.

engine-osnma-cli-freshness-not-enforced-no-reference = freshness: NOT enforced. No reference time was given, so sub-frame times are taken from the input and a replay of old data would authenticate.

engine-osnma-cli-freshness-sub-frames-within-of = freshness: sub-frames within { $max_err } s of the reference time { $v2 } are used; { $set_aside } were set aside. A reference time is a single instant.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satellite  status          authenticated  failed  pending  discarded  last authenticated

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epoch (tag sub-frame)      tx   data  adkd  ctr  result

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = line { $v1 }: expected 3 fields

engine-e-osnma-input-line-bad-svid = line { $v1 }: bad SVID

engine-e-osnma-input-line-bad-bit-count = line { $v1 }: bad bit count

engine-e-osnma-input-line-data-is-not-hex = line { $v1 }: data is not hex

engine-e-osnma-input-line-bit-count-does-not = line { $v1 }: bit count does not match the data

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = the time tolerance must be below one sub-frame ({ $SUBFRAME_S } s), got { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834 refraction is defined for station heights 0 to 3 km; got { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s and step_s must be positive

engine-e-passes-station-lat-deg-must-be = station_lat_deg must be in [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg must be in [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours must be finite and positive

engine-e-passes-step-must-be-finite-and = step_s must be finite and positive

engine-passes-passes-pass-es-of-km = passes: { $passes } pass(es) of a { $altitude_km } km / { $inclination_deg }° orbit over ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° in { $duration_hours } h; { $total_access_s } s total access (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = short { $record } record: { $line }

engine-e-precise-products-bad-number-in = bad number { $s } in { $line }

engine-e-precise-products-bad-field-in = bad field { $s } in { $line }

engine-e-precise-products-bad-antex-epoch = bad ANTEX epoch { $s }

engine-e-precise-products-bad-offset = bad offset { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = the ephemeris provider has no geocentric { $name } at JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D error RMS { $rms } m (max { $max } m)

engine-pvt-post-fit-rms = { " " }| post-fit RMS { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } sat nav | { $epochs_solved }/{ $epochs_total } epochs solved | mean { $mean_n_used } sats, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Single-point positioning — 3D error vs surveyed coordinate (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Single-point positioning — post-fit residual RMS ({ $mean_postfit_rms_m } m mean)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = RunOutput's array accessors need NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } is not a numeric array (a list of numbers, or of equal-length lists of numbers)

engine-e-python-is-not-non-empty-list = { $path } is not a non-empty list of records

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-e-python-and-must-be-the-same = i and q must be the same length ({ $i } vs { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: not acquired (statistic { $statistic } < threshold { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } (design, PRN) channels; at most 256 per sweep

engine-python-not-acquired-statistic-threshold = { $code }: not acquired (statistic { $statistic } < threshold { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] needs `label`

engine-e-python-runs-needs-result = runs[{ $i }] needs `result`

engine-e-python-must-be-between-and-32 = { $name } must be between 0 and 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | seed { $seed } | v{ $engine_version } | quantum wins { $value }/{ $foms } FoMs | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } from { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = unknown baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = unknown candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = ADEV taus/values must be finite and > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | candidate { $candidate_source } | timing holdover { $timing_holdover_s }s vs { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inertial { $inertial_holdover_s }s vs { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | resilience coast { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = RINEX clock file declares time system { $id }, which this reader does not know (known: { $known_clock_time_systems }); refusing it rather than reading its epochs as GPS time

engine-e-realdata-clk-rinex-clock-file-has-satellite = RINEX clock file has satellite system { $other } and declares no TIME SYSTEM ID; refusing to guess the time system of its epochs

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX clock files declare different time systems ({ $s } and { $ts }); refusing to join them on one time axis

engine-e-realdata-clk-no-as-or-ar-records = no AS or AR records for { $id }

engine-e-realdata-clk-short-circular-row = short Circular T row: { $t }

engine-e-realdata-clk-bad-value-in = bad value { $s } in { $t }

engine-e-realdata-clk-no-section-mjd-header-found = no Section 1 MJD header found

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = unterminated closing tag

engine-e-realdata-ion-sdr-unbalanced-closing-tag = unbalanced closing tag

engine-e-realdata-ion-sdr-unterminated-tag = unterminated tag

engine-e-realdata-ion-sdr-attribute-value-missing = attribute value missing

engine-e-realdata-ion-sdr-element-outside-the-document = element outside the document

engine-e-realdata-ion-sdr-text-outside-the-document = text outside the document

engine-e-realdata-ion-sdr-element-left-open = { $stack } element(s) left open

engine-e-realdata-ion-sdr-expected-one-root-element-found = expected one root element, found { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = unknown frequency format { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = unsupported encoding { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } streams: only single-stream files are read

engine-e-realdata-ion-sdr-block-of-cycles-with-header = a block of { $cycles } cycles with a header or footer repeats; only a single block spanning the file is read

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = chunk of { $words_per_chunk } words of { $word_bytes } bytes

engine-e-realdata-ion-sdr-unsupported-sample-format = unsupported sample format { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = quantization { $quantization } in { $packed_bits } packed bits per sample

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = a sample rate of { $sample_rate_hz } Hz is not a whole multiple of the rate factor { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = a chunk holds no whole lump

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = samples { $start }..{ $v1 } requested, the file holds { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = unreadable CRD version { $f }

engine-realdata-llr-crd-crd-format-version-is-not = CRD format version { $v } is not supported (only 1 and 2 share the record-11 field order this reader relies on)

engine-realdata-llr-crd-unreadable-station-id = unreadable station id { $f }

engine-realdata-llr-crd-unreadable-time-scale = unreadable time scale { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD epoch time scale { $time_scale } is not one of the three the format specification says analysts accept (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); refusing to read it as UTC

engine-realdata-llr-crd-unreadable-h4-field = unreadable h4 field { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = unreadable field { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = unreadable epoch event { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = non-physical time of flight { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = cannot read normal-point directory { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = no *.npt normal-point files in { $dir } — this scenario reads real archived measurements and will not run without them

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = bad number '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM has a zero dimension

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = coding { $encoding }: a LuGRE batch is two's complement

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bytes: shorter than the IQS header

engine-e-realdata-lugre-not-an-iqs-frame = not an IQS frame: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = sample rate: metadata { $sample_rate_hz } Hz, header { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = quantisation: metadata { $quantization } bits, header { $quant_bits } bits

engine-realdata-lugre-centre-frequency-metadata-hz-header = centre frequency: metadata { $center_freq_hz } Hz, header { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = intermediate frequency: metadata { $translated_freq_hz } Hz, header { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = sample count: metadata layout gives { $layout }, header { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = header/footer: metadata { $header_bytes }/{ $footer_bytes } bytes, format { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = file length { $file_len } is not header + { $value } sample bytes + footer

engine-realdata-lugre-field-missing = field { $key } missing

engine-e-realdata-lugre-field-unreadable = field { $key } unreadable

engine-realdata-lugre-raw-line = RAW line { $v1 }: { $e }

engine-realdata-lugre-acq-line = ACQ line { $v1 }: { $e }

engine-realdata-lugre-nav-line = NAV line { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK row { $v1 }: unreadable

engine-e-realdata-lugre-clk-row-columns-expected = CLK row { $v1 }: { $v } columns, expected 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = parse JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = expected a JSON object at the top level

engine-e-realdata-yunnan-missing-recordtime-array = missing recordTime array

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = cannot read EOP file { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s must be finite and non-negative, got { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = cannot read later-vintage EOP file { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = EMPTY, and deliberately so: a predicted-versus-final row needs an issue epoch with a COMPLETE { $window_days }-day fit window behind it and a published Bulletin B final at the target epoch. The input in force ({ $eop_source }) supplies no epoch meeting both. Shorten `operational_window_days`, or supply a longer real finals2000A series — no row is manufactured to fill the table.

engine-realtime-frame-eop-measured-over-the-real-series = Measured over the real series in force ({ $eop_source }). Every row is a genuine prediction error: a forecast for T+h formed from rapid Bulletin A rows at or before T, scored against the LATER-PUBLISHED Bulletin B final at T+h. Persistence is scored over the identical epoch set against the identical finals, so the two columns differ in the predictor and in nothing else. `improvement_factor` below 1 means the operational predictor is WORSE than persistence at that horizon, and is reported as such.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Measured over a genuine two-vintage pair: the as-issued vintage ({ $eop_source }) carries real Bulletin A predictions past its own data cutoff, and the archived later vintage ({ $c }) carries the Bulletin B finals those dates eventually received. Three forecasts are scored against that final — the archived Bulletin A prediction itself, this crate's operational-style fit over the as-issued vintage, and persistence at the cutoff.

engine-realtime-frame-eop-empty-and-deliberately-so-later = EMPTY, and deliberately so: a later vintage was supplied ({ $c }) but no date is carried as a Bulletin A PREDICTION in the as-issued file ({ $eop_source }) and as a Bulletin B FINAL in the later one at any requested horizon. No row is synthesised.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = EMPTY, and deliberately so. Scoring a GENUINE ARCHIVED prediction needs two vintages of the same finals2000A product; this run was given one ({ $eop_source }). The repository ships no archived earlier vintage, and one is NOT manufactured by perturbing the vintage it has — a synthesised archive would make every number in this table a measurement of the perturbation. Supply a real archived later vintage through `eop_finals2000a_later` to populate it. Until then the genuine predicted-versus-final errors this report does carry are in `table5_operational_vs_persistence`, where the forecast is this crate's own and the truth is the later-published Bulletin B final.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Table 1: post-proc { $c } m ({ $c2 } ms UT1) ↔ real-time { $c3 } m ({ $c4 } ms UT1) | Table 2: final floor { $floor } ms → { $far }-day { $far2 } ms | budget total { $total_m } m ({ $total_time_ns } ns) | L19 lever arm + L18 real-data (Validated), OD cov (Modelled)

engine-realtime-frame-eop-table3-joint-eop = table3_joint_eop[].{ $q }.n

engine-realtime-frame-eop-table3-joint-eop-truth-fallback = table3_joint_eop[].{ $q }.truth_fallback_rows

engine-realtime-frame-eop-table3-joint-eop-epochs-mjd = table3_joint_eop[].{ $q }.epochs_mjd

engine-realtime-frame-eop-table3-joint-eop-rms-native = table3_joint_eop[].{ $q }.rms_native

engine-realtime-frame-eop-table3-joint-eop-p50-native = table3_joint_eop[].{ $q }.p50_native

engine-realtime-frame-eop-table3-joint-eop-p95-native = table3_joint_eop[].{ $q }.p95_native

engine-realtime-frame-eop-table3-joint-eop-max-native = table3_joint_eop[].{ $q }.max_native

engine-realtime-frame-eop-table3-joint-eop-rms-position = table3_joint_eop[].{ $q }.rms_position_m

engine-realtime-frame-eop-table3-joint-eop-p95-position = table3_joint_eop[].{ $q }.p95_position_m

engine-realtime-frame-eop-table3-joint-eop-rms-light = table3_joint_eop[].{ $q }.rms_light_time_ns

engine-realtime-frame-eop-operational-predictor-model-representative-fit = operational_predictor_model.representative_fit.{ $q }.issue_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-2 = operational_predictor_model.representative_fit.{ $q }.window_first_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-3 = operational_predictor_model.representative_fit.{ $q }.window_last_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-4 = operational_predictor_model.representative_fit.{ $q }.n_fit

engine-realtime-frame-eop-operational-predictor-model-representative-fit-5 = operational_predictor_model.representative_fit.{ $q }.rms_fit_residual_native

engine-realtime-frame-eop-operational-predictor-model-representative-fit-6 = operational_predictor_model.representative_fit.{ $q }.anchor_residual_native

engine-realtime-frame-eop-operational-predictor-model-representative-fit-7 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].period_days

engine-realtime-frame-eop-operational-predictor-model-representative-fit-8 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].cycles_spanned

engine-realtime-frame-eop-operational-predictor-model-representative-fit-9 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].threshold_cycles

engine-realtime-frame-eop-rows-horizon-days = { $t5 }.rows[].horizon_days

engine-realtime-frame-eop-rows-epochs-mjd = { $t5 }.rows[].epochs_mjd

engine-realtime-frame-eop-rows-target-mjds = { $t5 }.rows[].target_mjds

engine-realtime-frame-eop-rows-min-fit-lead-days = { $t5 }.rows[].min_fit_lead_days

engine-realtime-frame-eop-rows-fit-rows-min = { $t5 }.rows[].fit_rows_min

engine-realtime-frame-eop-rows-fit-rows-max = { $t5 }.rows[].fit_rows_max

engine-realtime-frame-eop-rows-improvement-factor = { $t5 }.rows[].*.improvement_factor

engine-realtime-frame-eop-rows-rms-native = { $t5 }.rows[].*.{ $p }.rms_native

engine-realtime-frame-eop-rows-p50-native = { $t5 }.rows[].*.{ $p }.p50_native

engine-realtime-frame-eop-rows-p95-native = { $t5 }.rows[].*.{ $p }.p95_native

engine-realtime-frame-eop-rows-max-native = { $t5 }.rows[].*.{ $p }.max_native

engine-realtime-frame-eop-rows-rms-position = { $t5 }.rows[].*.{ $p }.rms_position_m

engine-realtime-frame-eop-rows-p95-position = { $t5 }.rows[].*.{ $p }.p95_position_m

engine-realtime-frame-eop-rows-rms-light-time-ns = { $t5 }.rows[].*.{ $p }.rms_light_time_ns

engine-realtime-frame-eop-equivalent-horizon-days-target-position = { $t5 }.equivalent_horizon_days.target_position_m

engine-realtime-frame-eop-equivalent-horizon-days = { $t5 }.equivalent_horizon_days.{ $q }.{ $p }

engine-realtime-frame-eop-rows-horizon-days-2 = { $t6 }.rows[].horizon_days

engine-realtime-frame-eop-rows-issue-mjd = { $t6 }.rows[].issue_mjd

engine-realtime-frame-eop-rows-epochs-mjd-2 = { $t6 }.rows[].epochs_mjd

engine-realtime-frame-eop-rows-rms-native-2 = { $t6 }.rows[].*.{ $p }.rms_native

engine-realtime-frame-eop-rows-p50-native-2 = { $t6 }.rows[].*.{ $p }.p50_native

engine-realtime-frame-eop-rows-p95-native-2 = { $t6 }.rows[].*.{ $p }.p95_native

engine-realtime-frame-eop-rows-max-native-2 = { $t6 }.rows[].*.{ $p }.max_native

engine-realtime-frame-eop-rows-rms-position-2 = { $t6 }.rows[].*.{ $p }.rms_position_m

engine-realtime-frame-eop-rows-p95-position-2 = { $t6 }.rows[].*.{ $p }.p95_position_m

engine-realtime-frame-eop-rows-rms-light-time-ns-2 = { $t6 }.rows[].*.{ $p }.rms_light_time_ns

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Measured over a genuine two-vintage pair: the Bulletin A PREDICTED UT1 of the as-issued file ({ $eop_source }) differenced against the eventual Bulletin B FINAL of the archived later vintage ({ $c }), at { $predicted_vs_final } horizon(s).

engine-realtime-frame-eop-empty-and-deliberately-so-an = EMPTY, and deliberately so: an archived later vintage was supplied ({ $c }) but no date is carried as a Bulletin A PREDICTION in the as-issued file ({ $eop_source }) and as a Bulletin B FINAL in the later one at any requested horizon, so there is no predicted-vs-final residual to report. No row is synthesised.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = EMPTY, and deliberately so: a predicted-vs-final residual needs TWO vintages of the same finals2000A product. This run was given one ({ $eop_source }). Its Bulletin A prediction rows are for future dates that have no Bulletin B final yet, so the residual does not exist to be measured and none is invented here. Supply an archived later vintage through `eop_finals2000a_later` to populate this table. Until then the multi-day growth reported in `table2_error_vs_horizon` is the PERSISTENCE predictor scored over the real finals — a real measured error, but a Modelled predictor, and not the IERS Bulletin A prediction residual.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = a vessel assessment needs [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = excerpt is { $excerpt } bytes; the limit is { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = excerpt holds more than { $MAX_EXCERPT_EPOCHS } epochs; cut it shorter

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = the excerpt ends inside the { $calibration_s } s calibration window ({ $epochs } epochs): nothing was scored

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = no UTC-labelled epoch in the UBX log

engine-e-receiver-trust-calibration-no-scenario-json-under = no scenario.json under { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: held-out clean Pfa <= { $B1_MAX_PFA } (calibrated: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } must be finite and > 0 (got { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel must be finite and >= 0 (got { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used must be at least 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg must be in [0, 90] (got { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg must be in (0, 360] (got { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points must be in [0, 100] (got { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio must be finite and > 1 (got { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor must be in (0, 100] (got { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) is below the score's degraded_min ({ $degraded_min }): geometry alone could reach the untrusted band

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites = geometry { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satellites{ $v6 }

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: the geometry deduction is classed an inconsistency

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: reported, not scored (the geometry is not poor)

engine-receiver-trust-geometry-not-scored-the-score-deducts = not scored (the score deducts only above HDOP { $hdop_max }, PDOP { $pdop_max } or below { $min_used } satellites)

engine-receiver-trust-geometry-derived-from-logged-satellites = derived from { $n } logged satellites

engine-receiver-trust-geometry-as-the-receiver-reports-it = as the receiver reports it, { $n } satellites used

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = the stated HDOP { $fmt_dop } disagrees with the HDOP { $fmt_dop2 } derived from the stated sky beyond the tolerance

engine-receiver-trust-geometry-satellites-in-view-but-not = satellites in view but not tracked ({ $g } of { $in_view } at or above { $low_elev_deg } deg): signal environment, not geometry

engine-receiver-trust-geometry-satellites-fewer-than = { $n } satellites, fewer than { $min_used }

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } above { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } above { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satellites behind the stated skyline

engine-receiver-trust-geometry-every-satellite-in-one-half = every satellite in one half of the sky (gap { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = degraded by geometry: { $parts } ({ $from }); not an inconsistency

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = the log holds no epochs: nothing in it was readable as { $name } ({ $skipped_records } records skipped as corrupt or unparsable); check the format setting

engine-receiver-trust-ingest-gps-week-tow = GPS week { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS week { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (date not in log)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } must be finite and >= 0 (got { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s must be above 0

engine-e-receiver-trust-live-invalid-session = invalid session: { $e }

engine-receiver-trust-live-no-score-could-be-produced = no score could be produced: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = no GNSS-SDR synchro or pvt record was readable ({ $skipped } lines skipped); see integrations/gnss-sdr/README.md for the line format

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = the IMU file is empty

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: no `{ $n }` column

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: no `{ $n }` column

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = the IMU file holds no readable sample

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis must be 0, 1 or 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean must be finite

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at = the log has { $n } samples; at least { $MIN_SAMPLES } are needed for an Allan fit

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = the log's time does not advance

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = the sample interval is not uniform ({ $uneven } of { $n } intervals differ by over 25 %): resample the log first

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = the log is too short to form an Allan curve

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = the { $name } curve's early slope is { $v }, not about -0.5: white noise does not dominate (is the sensor still?), so its noise coefficient is unreliable

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = the { $name } curve is too short to check its slope

engine-receiver-trust-machines-imu-fit-id-provenance-bias-va-gyro =
    { "[" }{ $table }]
    id = { $id }
    provenance = { $provenance }
    bias = { $bias }
    q_va = { $q_va }
    gyro_bias = { $gyro_bias }
    q_arw = { $q_arw }
    bias_instability = { $bias_instability }{ "\u000A" }

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = GPS week { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = no BESTPOS, RANGE or RXSTATUS log was readable ({ $skipped } records skipped)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = no valid RTCM 3 frame was found ({ $skipped } candidates failed the CRC)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } must be finite and > 0 (got { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard must be in (0, 1) (got { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac must be in [0, 1] (got { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } must be in (0, 1) (got { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats must be at least 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s must be at least 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = monitor config: unknown profile "{ $other }"; known: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = monitor config: { $name } must be finite and > 0 (got { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = monitor config: jam_ind_threshold must be finite

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = monitor config: mask_deg must be in [-90, 90) (got { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = monitor config: raim_pfa must be in (0, 1) (got { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = monitor config: cn0_min_sats must be at least 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = monitor config: sats_lost must be at least 1

engine-receiver-trust-monitors-the-receiver-own-set-against = the receiver's own { $self_report_source } set against Kshana's monitors; neither is ground truth, agreement is not validation

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = receiver timeline has a non-finite epoch time

engine-e-receiver-trust-monitors-the-log-is-shorter-than = the log is shorter than the calibration window: { $calibration_epochs } epoch(s) before { $cal_s } s (log spans { $span } s); at least 3 are needed to form the baseline

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } must be in ({ $lo }, { $hi }] (got { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } applies only to kind = "vessel" (kind is "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = cannot read { $path }: the WebAssembly build has no file system; pass the file inline as `text` or `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` is not valid standard base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: give one of `path`, `text` or `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: give only one of `path`, `text` or `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } must be a positive number, got { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = event { $label }: onset_s must be a non-negative number

engine-e-receiver-trust-scenario-event-end-must-be-after = event { $label }: end_s must be after onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg and time_offset_s must be finite

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = trusted throughout: no monitor alarmed in { $after_cal } epochs after calibration

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = first alarm at { $t } s; untrusted for { $untrusted_epochs } and degraded for { $degraded_epochs } of { $after_cal } epochs after calibration

engine-receiver-trust-scenario-of-stated-events-detected-within = ; { $events_detected } of { $events_evaluable } stated events detected within { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = ; { $predictions_agreeing } of { $predictions_evaluable } C/N0 predictions within { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = ; trust score lowest { $min }, final { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = scenario { $r } | receiver-trust | { $format_name } log, { $epochs } epochs over { $duration_s } s | monitors { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = this is a { $k } scenario, not a receiver-trust one

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } must be finite (got { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: need 0 < degraded_min < nominal_min <= 100 (got { $degraded_min } and { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s must be finite and >= 0 (got { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: need 0 <= onset_ratio < full_ratio (got { $onset_ratio } and { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: weight of { $m } must be in [0, 100] (got { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s must be finite and positive

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg must be in (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 must be finite and positive

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m and rho0_kg_m3 must be finite and positive

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m must be in [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = reentry (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> peak { $v3 } g at { $v4 } km, { $velocity_at_peak_deceleration } m/s; heating peaks at { $velocity_at_peak_heating } m/s; point mass (gravity, curvature, US76) peak { $peak_deceleration_g } g (MODELLED ballistic, no aerothermal)

## src/registry.rs

engine-e-registry-unknown-scenario-id = unknown scenario id: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = TRL band ({ $lo },{ $hi }) is not well-formed (need 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = Modelled (simulation-only) claim cannot be representative above TRL { $MODELLED_TRL_CEILING } (band hi={ $hi }); higher TRL is a gap, not a simulation output

engine-representativeness-representativeness-representative-for-trl = Representativeness [{ $status }] — { $claim } (representative for TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = declared({ $arch }) x mean source quality

engine-resilience-score-weakest-rpcf-sub-score-bounded = weakest RPCF sub-score = { $min_sub }; bounded-degradation = { $bounded } (caps at Level 2 if unbounded)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = unsupported navigation record header { $head }: a line beginning with '>' is a RINEX 4 record header, not a RINEX 3 navigation record

engine-e-rinex-bad-prn-in = bad PRN in { $head }

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4 navigation: expected a '>' record header, found { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4 record { $head } has { $body } lines, a { $msg } ephemeris needs 8

engine-e-rinex-rinex-record-is-followed-by = RINEX 4 record { $head } is followed by { $body }, not { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = bad { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = RINEX observation file has no END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = RINEX observation file contained no epoch records

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s must be finite and > 0 (got { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s must be finite and > 0 (got { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) must not exceed time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps = time grid too large: { $n } steps exceeds MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); use a coarser step or shorter duration

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = sampling rate is commensurate with the code rate ({ $samples_per_chip } samples/chip, { $offset_from_integer_samples } samples from a whole number): the zero-order-hold code replica cannot resolve a code-phase change below { $dead_band_chips } chips, so the Early/Late discriminator is a staircase with a one-sample dead band instead of a triangle and the DLL settles at the wrong lag. Offset the sample rate off the integer multiple (5 MHz is 4.8876 samples/chip; 25 MHz is 24.4379) or oversample far enough that the dead band is below the code-phase accuracy you need.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = SGP4 error code { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = unsupported SigMF core:datatype { $other }: this reader handles the complex types cf32_le, ci16_le and ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: only single-channel recordings are read

engine-e-sigmf-cannot-serialise-sigmf-metadata = cannot serialise SigMF metadata: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = invalid SigMF extension namespace { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } annotation extension maps for { $annotations2 } annotations

engine-e-sigmf-extension-key-is-not-in = extension key { $k } is not in namespace { $ns }

engine-e-sigmf-extension-key-is-already-present = extension key { $k } is already present

engine-e-sigmf-global-is-not-an-object = global is not an object

engine-e-sigmf-annotations-is-not-an-array = annotations is not an array

engine-e-sigmf-annotation-is-not-an-object = annotation is not an object

engine-e-sigmf-invalid-sigmf-metadata-json = invalid SigMF metadata JSON: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = the SigMF recording states no positive core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = SigMF capture starts at sample { $start }, beyond the { $data } samples in the data

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } must be in [0, 90) degrees, got { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } must be a finite number, got { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: a canyon needs width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m must be positive, got { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: canyon heights and antenna_m must be non-negative

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m must be positive, got { $l }

engine-e-skyline-skyline-table-is-empty = skyline: table is empty

engine-e-skyline-skyline-table-has-rows-over = skyline: table has { $rows } rows, over the { $MAX_TABLE_ROWS }-row cap

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: table azimuth { $az } is outside [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: table azimuths must be strictly increasing ({ $az } follows { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: more than { $MAX_SECTORS } sectors

engine-e-skyline-skyline-the-sector-az-from = skyline: the sector az_from = { $az_from } to az_to = { $az_to } is empty (a full circle is a table or the mask)

engine-e-skyline-skyline-more-than-terrain-points = skyline: more than { $MAX_TABLE_ROWS } terrain points

engine-e-skyline-skyline-terrain-distance-must-be = skyline: terrain distance_m must be positive, got { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance }; with fields overridden or added by { $user }

engine-skyline-stated-input = Stated input: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = unknown skyline preset "{ $name }"; known presets: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = a datasheet needs at least two Allan-deviation points

engine-e-slot-timing-datasheet-point-must-have-positive = datasheet point ({ $t }, { $s }) must have a positive averaging time and a positive Allan deviation

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s must be a positive number of seconds

engine-e-slot-timing-phase-record-needs-at-least = a phase record needs at least 32 samples to fit a noise model; got { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = the phase record contains a non-finite sample

engine-e-slot-timing-the-phase-record-yields-fewer = the phase record yields fewer than three Allan-deviation points

engine-e-slot-timing-must-be-finite-and-non = { $name } must be finite and non-negative; got { $v }

engine-e-slot-timing-the-slot-guard-must-be = the slot guard must be a positive time

engine-e-slot-timing-sigma-must-be-positive = k_sigma must be positive

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset must be finite

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k must be finite

engine-e-slot-timing-give-exactly-one-of-oscillator = give exactly one of oscillator.class, oscillator.preset, oscillator.datasheet or oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = unknown oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = unknown oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = { $c } class default: sigma_y(1 s) from { $c2 }; red-noise floor synthesised two and four decades below it (an assumption, not a measurement)

engine-slot-timing-fitted-to-the-allan-deviation = fitted to the Allan-deviation maxima of { $document }, scaled to lie at or above every point

engine-slot-timing-fitted-to-the-overlapping-allan = fitted to the overlapping Allan deviation of a { $n_samples }-sample record at { $tau0_s } s, in the IEEE Std 1139 frequency-modulation basis

engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } source): guard { $c } ns at k={ $k_sigma } breaks { $fmt_s } after a fix ({ $fmt_s2 } left); fix at least every { $fmt_s3 } ({ $fixes_per_day } per day); dominant term: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epoch '{ $s }' must be YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = epoch '{ $s }': bad { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb must be finite

engine-e-solar-system-table-must-be-auto-table1 = table must be auto, table1 or table2; got '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = no ephemeris for the { $name } to { $name2 } link at JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = epoch JD { $jd } TDB is outside 3000 BC to 3000 AD, the Standish tables' range

engine-e-solar-system-track-points-must-be-to = track_points must be 8 to 2000; got { $n_track }

engine-e-solar-system-unknown-observer-body = unknown observer body '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies must name at least one body

engine-e-solar-system-unknown-body = unknown body '{ $n }'

engine-e-solar-system-no-position-for-at-jd = no position for { $name } at JD { $jd } TDB (Pluto is 1800 AD to 2050 AD only)

engine-e-solar-system-no-standish-elements-for = no Standish elements for { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliocentric state read by the engine's own reader

engine-e-solar-system-unknown-link-body = unknown link body '{ $from }'

engine-e-solar-system-unknown-link-body-2 = unknown link body '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = a link needs two different bodies; got { $name }

engine-solar-system-solar-system-at-jd-tdb =
    Solar system at { $input } (JD { $jd_tdb } TDB), { $n_bodies } bodies, observer { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = light time { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }link { $from } -> { $to }: one-way { $one_way_light_time_s } s, two-way { $two_way_light_time_s } s, Shapiro { $l } us, Sun { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = epoch { $input } · { $standish_table } · positions from the Standish elements

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = epoch needs 6 time fields, got { $tokens }

engine-e-sp3-bad-second = bad second: { $tokens }

engine-e-sp3-record-needs-values-missing-column = record needs 4 values, missing column { $v1 }

engine-e-sp3-bad-number = bad number: { $field }

engine-e-sp3-empty-sp3-input = empty SP3 input

engine-e-sp3-first-line-is-not-an = first line is not an SP3 header: { $first }

engine-e-sp3-unsupported-sp3-version-in = unsupported SP3 version in { $first }

engine-e-sp3-missing-epoch-count-on-header = missing epoch count on header line 1

engine-e-sp3-record-has-no-satellite-id = record has no satellite id: { $line }

engine-e-sp3-position-record-before-any-epoch = position record before any epoch header

engine-e-sp3-sp3-file-contained-no-epoch = SP3 file contained no epoch records

engine-e-sp3-bad-accuracy-exponent-in = bad accuracy exponent { $f } in { $line }

engine-e-sp3-bad-header-accuracy = bad header accuracy { $t }

engine-e-sp3-short-line = short %f line { $line }

engine-e-sp3-bad-base-in = bad %f base in { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = version exceeds 3 bits

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID exceeds 11 bits (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count exceeds 14 bits (0..=16383)

engine-e-space-packet-data-field-must-be-at = data field must be at least one octet

engine-e-space-packet-data-field-exceeds-65536-octets = data field exceeds 65536 octets

engine-e-space-packet-packet-shorter-than-the-octet = packet shorter than the 6-octet header: { $bytes } bytes

engine-e-space-packet-declared-data-length-header-octets = declared data length { $data_len } (+6 header) = { $total } octets, but buffer is { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = CUC coarse octets { $coarse_octets } outside 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = CUC fine octets { $fine_octets } outside 0..=3 (the extended P-field is not supported)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-field { $p }: extended P-field not supported

engine-e-space-packet-field-time-code-id-is = P-field { $p }: time code id { $id } is not CUC

engine-e-space-packet-field-is-not-cds-field = P-field { $p } is not a CDS P-field

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-field { $p }: reserved sub-ms code 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC coarse { $coarse } does not fit { $c } octets

engine-e-space-packet-cuc-fine-does-not-fit = CUC fine { $fine } does not fit { $n } octets

engine-e-space-packet-cds-days-do-not-fit = CDS days { $days } do not fit { $f } octets

engine-e-space-packet-cds-ms-of-day-above = CDS ms of day { $ms_of_day } above 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS sub-millisecond { $submillis } above { $max_sub }

engine-e-space-packet-time-code-format-and-value = time code format and value are of different codes

engine-e-space-packet-time-code-no-field-octet = time code: no P-field octet

engine-e-space-packet-time-code-needs-octets-present = time code needs { $end } octets, { $bytes } present

engine-e-space-packet-time-code-format-differs-from = time code format differs from the implicit P-field

engine-e-space-packet-the-format-has-time-code = the format has a time code field; none given

engine-e-space-packet-the-format-has-no-time = the format has no time code field

engine-e-space-packet-ancillary-data-is-octets-the = ancillary data is { $ancillary } octets; the format says { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = a secondary header must hold at least one octet

engine-e-space-packet-secondary-header-needs-octets-present = secondary header needs { $end } octets, { $bytes } present

engine-e-space-packet-the-format-has-secondary-header = the format has a secondary header; none given

engine-e-space-packet-the-format-has-no-secondary = the format has no secondary header

engine-e-space-packet-secondary-header-flag-disagrees-with = secondary-header flag { $v1 } disagrees with the format

engine-e-space-packet-data-field-shorter-than-the = data field shorter than the PEC

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } does not match the CRC { $crc16_ccitt_false } of the packet

engine-e-space-packet-nothing-to-segment-empty-user = nothing to segment: empty user data

engine-e-space-packet-max-user-octets-must-be = max_user_octets must be at least 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count exceeds 14 bits (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } where { $a } was expected

engine-space-packet-sequence-count-repeated = sequence count { $sequence_count } repeated

engine-space-packet-sequence-count-gap-after-packet = sequence count gap: { $sequence_count } after { $last } ({ $v2 } packet(s) missing)

engine-space-packet-sequence-count-out-of-order = sequence count out of order: { $sequence_count } after { $last }

engine-space-packet-packet-with-no-unit-open = { $f } packet with no unit open

engine-space-packet-packet-while-unit-is-open = { $f } packet while a unit is open

engine-e-space-packet-packet = packet { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = the sequence ends with a unit still open (no last packet)

engine-e-space-packet-apid-must-be-in-2047 = apid must be in 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count must be >= 1

engine-e-space-packet-data-len-must-be-in = data_len must be in 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = internal error: encode/decode round trip mismatch

engine-space-packet-space-packet-framed-ccsds-133 = space-packet: framed { $packet_count } CCSDS-133.0 { $v2 } packet(s) APID { $apid }, { $total_bytes } octets total, round-trip exact ({ $round_trip_ok })

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 must be finite and positive

engine-e-space-weather-f107a-must-be-finite-and = f107a must be finite and positive

engine-e-space-weather-kp-must-be-in = kp must be in [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km must be non-empty

engine-e-space-weather-altitude-km-must-be-finite = altitude { $h } km must be finite and positive

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; density x{ $density_activity_factor } at { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: a { $what } jammer needs a positive bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: a chirp jammer needs a positive sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to names unknown band { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: give either received_power_dbw, or eirp_dbw with a positive range_m (not both)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s must be later than on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: the sample rate must be positive

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } must be a power of two, at least 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } samples is fewer than one { $nfft }-point segment

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } must be a power of two, at least 16

engine-e-spectrum-cannot-read-recording-meta-path = cannot read recording meta_path { $meta_path }: { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = cannot read recording data { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz must be positive

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: modulation { $m } is not selectable (only galileo-e1 takes "mboc" or "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: signal { $sig } is not in the signal preset library ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: a preset signal carries its own modulation; drop `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: signal { $sig } publishes no received power; give signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: a custom band needs `modulation`, e.g. "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: a custom band needs signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: give either `signal` or `centre_mhz`, not both

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: give rx_bandwidth_mhz (no main lobe could be located)

engine-e-spectrum-duration-must-be-at-least = duration_s must be at least one step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } time rows is more than the 5000 allowed

engine-e-spectrum-at-most-extra-panels = at most 8 extra panels

engine-e-spectrum-panel-need-max-mhz-min = panel { $name }: need f_max_mhz > f_min_mhz and 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = grid: need f_max_mhz > f_min_mhz and 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = scenario spectrum | { $bands } bands | { $jammers } jammers | noise floor { $n0_db } dBW/Hz | worst band { $name } min C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = scenario spectrum | no bands | noise floor { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples must be between 10 and 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: use cf32_le or ci16_le

engine-spectrum-frequency-across-time-down-colour = frequency across, time down, colour = power spectral density (dBW/Hz); noise floor { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = each panel its own frequency range, one timeline down, one colour scale (dBW/Hz); noise floor { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = frame { $other } has no supported NAIF code

engine-e-spk-writer-segment-name-longer-than-40 = segment name longer than 40 characters: { $name }

engine-e-spk-writer-segment-name-has-non-printing = segment name has non-printing characters: { $name }

engine-e-spk-writer-bad-target-for-centre = bad target { $target } for centre { $centre }

engine-e-spk-writer-degree-outside-27 = degree { $degree } outside 1..=27

engine-e-spk-writer-type-13-degree-is-not = type 13 degree { $degree } is not odd

engine-e-spk-writer-states-for-epochs = { $states } states for { $n } epochs

engine-e-spk-writer-states-degree-needs = { $n } states; degree { $degree } needs { $value }

engine-e-spk-writer-descriptor-start-is-not-before = descriptor start is not before its end

engine-e-spk-writer-epochs-are-not-strictly-increasing = epochs are not strictly increasing

engine-e-spk-writer-the-epochs-do-not-cover = the epochs do not cover the descriptor interval

engine-e-spk-writer-type-or-13-segment-carries = a type 9 or 13 segment carries states, not records

engine-e-spk-writer-type-segment-needs-at-least = a type 3 segment needs at least one record

engine-e-spk-writer-type-degree-outside-27 = type 3 degree { $degree } outside 0..=27

engine-e-spk-writer-type-interval-length-is-not = type 3 interval length { $intlen } is not positive

engine-e-spk-writer-type-record-has-coefficients-expected = type 3 record { $i } has { $value } coefficients, expected { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = descriptor start is after its end

engine-e-spk-writer-descriptor-starts-before-the-first = descriptor starts before the first record

engine-e-spk-writer-descriptor-ends-after-the-last = descriptor ends after the last record

engine-e-spk-writer-type-segment-carries-records-not = a type 3 segment carries records, not epochs or states

engine-e-spk-writer-type-21-segment-needs-at = a type 21 segment needs at least one difference line

engine-e-spk-writer-difference-line-size-is-not = difference line size { $dlsize } is not 4 MAXDIM + 11 with MAXDIM in 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = difference lines of different sizes

engine-e-spk-writer-epochs-for-difference-lines = { $epochs } epochs for { $n } difference lines

engine-e-spk-writer-difference-line-epochs-are-not = difference line epochs are not strictly increasing

engine-e-spk-writer-the-last-difference-line-ends = the last difference line ends before the descriptor

engine-e-spk-writer-zero-step-size-in-difference = zero step size { $j } in difference line { $i }

engine-e-spk-writer-type-21-segment-carries-difference = a type 21 segment carries difference lines, not states

engine-e-spk-writer-an-spk-needs-at-least = an SPK needs at least one segment

engine-e-spk-writer-segment = segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = comment line has non-printing characters: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = comments need { $nchars } characters; { $v1 } are reserved (raise ncomch)

engine-e-spk-writer-difference-line-orders-out-of = difference line orders { $kqmax1 } { $kq } out of range

engine-e-spk-writer-zero-step-size-at-index = zero step size at index { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } outside the segment [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = type 3 segment { $name } too short

engine-e-spk-writer-type-segment-words-for-rsize = type 3 segment { $name }: { $nw } words for N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = type 21 segment { $name } too short

engine-e-spk-writer-type-21-segment-words-for = type 21 segment { $name }: { $nw } words for N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segment { $name } too short

engine-e-spk-writer-segment-words-for = segment { $name }: { $nw } words for N = { $n }

engine-e-spk-writer-segment-is-in-frame = segment { $name } is in frame { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = SPK centre chain does not terminate

engine-e-spk-writer-no-spk-chain-connects-and = no SPK chain connects { $target } and { $observer } at ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = epoch { $s } is not YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = time system { $other } not supported (UTC or TDB)

engine-e-spk-writer-centre-has-no-supported-naif = centre { $other } has no supported NAIF id

engine-e-spk-writer-oem-segment-has-no-data = OEM segment { $name } has no data lines

engine-e-spk-writer-oem-segment-no = OEM segment { $idx }: no { $k }

engine-e-spk-writer-no-export-settings-for-oem = no export settings for OEM segment { $idx }

engine-e-spk-writer-oem-data-line-has-fields = OEM data line has { $f } fields: { $line }

engine-e-spk-writer-oem-value = OEM value { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } OEM segments for { $exports } export settings

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (fused) — layers: { $fired }

engine-spoof-detect-single-layer-indication-below-the = single-layer indication ({ $fired }) below the fused threshold — corroboration needed

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg must be positive, got { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = panel { $i }: area must be >= 0

engine-e-srp-boxwing-panel-outside = panel { $i }: { $name } = { $c } outside [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = panel { $i }: absorption + specular + diffuse = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = panel { $i }: zero normal/axis

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = ECOM2 normal matrix is singular or ill-conditioned

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 min

engine-ssv-check-mod4-min = { $key } MOD4 min

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = heo preset

engine-e-ssv-check-lunar-preset = lunar preset

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = a formation needs at least one deputy

engine-e-ssv-formation-duration-min-and-step-must = duration_min and step_s must be positive

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = no signals for the chosen constellations and bands

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = unknown antenna `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = pattern CSV is empty

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` is not a number in the pattern CSV

engine-e-ssv-scenario-pattern-csv-row-has-columns = pattern CSV row `{ $l }` has { $f } columns, expected { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" needs exactly one of pattern_csv and pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` is not booklet, parametric or table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: give cn0_min_dbhz or weak_signal, not both

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = the carrier loop cannot hold the stated Doppler rate at any C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` is not acquisition, tracking or both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz must be finite

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: give exactly one of preset and orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` is not leo, meo, geo, heo or lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: give exactly one of duration_min and duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } must be positive

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg needs 1 to 8 finite offsets

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd must not be negative

engine-e-ssv-scenario-give-exactly-one-of-shell = give exactly one of [shell], [trajectory] and [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] needs a [navigation] table for the chief

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include and constellations.bands must not be empty

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km must be above 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels above 5 is not supported

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna must be hemisphere or omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = the shell sweep supports the booklet transmit pattern only (a shaped pattern needs the trajectory sweep)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] applies to a [trajectory], not a [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: give exactly one of preset and orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` is not leo, meo, geo, heo or lunar-transfer

engine-e-ssv-scenario-unknown-preset = unknown preset

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv shell { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv navigation: position RMS { $p } overall, { $p2 } inside the GNSS orbits, { $p3 } above; longest gap { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = deputy at { $offset_deg } deg ({ $baseline_km } km): relative RMS { $rel_rms_filter_m } m filtered vs { $rel_rms_from_absolute_m } m from absolute fixes

engine-ssv-scenario-combined-max-outage-min = { $band } combined 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (max outage { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv trajectory { $perigee_alt_km } to { $apogee_alt_km } km altitude: { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min and step_min must be positive

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } must be a positive number, got { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = no standards pack named `{ $id }`; the packs are: { $ids }

engine-e-standards-pack-pack-manifest = pack manifest: { $e }

engine-e-standards-pack-test-duplicate-id = test { $id }: duplicate id

engine-e-standards-pack-test-scenario-is-not-in = test { $id }: scenario `{ $s }` is not in the pack

engine-e-standards-pack-test-scored-test-needs-bar = test { $id }: a scored test needs a bar

engine-e-standards-pack-test-test-that-needs-input = test { $id }: a test that needs input has no bars

engine-e-standards-pack-test-give-either-scenario-or = test { $id }: give either `scenario` or `needs_input`, not both or neither

engine-e-standards-pack-test-supports-unknown-row = test { $id }: supports unknown row `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id }: unknown op `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id }: bar on { $pointer } needs exactly one of `value` and `against`

engine-e-standards-pack-row-duplicate-id = row { $id }: duplicate id

engine-e-standards-pack-row-asks-must-be-short = row { $id }: `asks` must be a short paraphrase

engine-e-standards-pack-row-no-test-supports-it = row { $id }: no test supports it

engine-standards-pack-not-scored-needs-input = not scored: needs input ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = study has no scenarios to run

engine-e-study-cannot-read-scenario = cannot read scenario { $path }: { $e }

engine-e-study-scenario-failed = scenario { $path } failed: { $e }

engine-e-study-scenario-produced-unparseable-json = scenario { $path } produced unparseable JSON: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = invalid suite manifest: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = unknown source `{ $o }`: use `adsb` or `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } is { $len } bytes, over the { $limit }-byte limit

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` is not an ISO-8601 UTC time

engine-e-surface-invalid-receiver-trust-session = invalid receiver-trust session: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` is not an ISO-8601 UTC time

engine-e-surface-dataset-custom-needs-licence-licence = dataset `custom` needs licence, licence_url and attribution

engine-e-surface-at-least-one-map-is = at least one map is required

engine-e-surface-epoch = epoch: { $e }

engine-e-surface-not-utf = { $suffix }: not UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = unknown scenario kind `{ $k }`; the kind list names every kind

engine-surface-is-not-bundled-it = `{ $name }` is not bundled: it { $why }

engine-surface-no-bundled-scenario-named-the = no bundled scenario named `{ $name }`; the example list names the { $v1 } that are

engine-e-surface-invalid-toml = invalid TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = unknown export format `{ $format }`; expected one of czml, kml, geojson, stk or sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps gives { $opts } frames and at most { $MAX_ANIMATION_FRAMES } are returned; lower fps or duration_s, or write a longer sequence with the command line

engine-e-surface-scenario-run-failed = scenario run failed: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log names a file `path`; give the log as `text` or `base64` (this surface reads no files)

engine-e-surface-max-sp-errors-must-be = max_sp_errors must be at most 20

engine-e-surface-frames-must-be-to = frames must be 1 to { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 must be 0 to 99

engine-e-surface-runs-given-at-most-per = { $runs } runs given; at most { $MAX_COMPLIANCE_RUNS } per report

engine-e-surface-the-runs-total-bytes-the = the runs total { $total } bytes; the limit for one report is { $max_bytes }

engine-e-surface-result-files-given-at-most = { $results } result files given, at most 256

engine-e-surface-result-is-not-json = result { $v1 } is not JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = unknown format `{ $o }`: use `prometheus`, `cef`, `leef`, `otlp` or `mqtt`

engine-e-surface-unknown-imu-format-use-csv = unknown IMU format `{ $o }`: use `csv` or `euroc`

engine-e-surface-unknown-axis-use-or = unknown axis `{ $o }`: use `x`, `y` or `z`

engine-e-surface-id-must-be-to-64 = id must be 1 to 64 printable ASCII characters without spaces

engine-surface-fitted-from-stationary-imu-log = fitted from a stationary IMU log, sha256 { $sha }, axis { $axis }, Allan estimator

engine-e-surface-unknown-input-kind-use-result = unknown input_kind `{ $o }`: use `result` or `jsonl`

engine-e-surface-the-input-holds-no-trust = the input holds no trust epoch

engine-e-surface-the-reply-is-over-the = the reply is over the { $max_bytes }-byte limit; send fewer epochs or leave `syslog_all` off

engine-e-surface-otlp-needs-build-with-the = otlp needs a build with the `otlp` feature

engine-e-surface-the-pack-and-token-total = the pack and token total { $total } bytes; the limit is { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = the timestamp token is empty

engine-e-surface-must-be-64-lower-case = { $what } must be 64 lower-case hex digits

engine-e-surface-must-be-32-bytes = { $what } must be 32 bytes

engine-surface-verified-against-the-public-key = VERIFIED against the public key you supplied (signer fingerprint { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: the hashes and signature are consistent with key { $fp }, which the pack names itself. Supply the signer's public key, obtained from the signer by another route, to establish who signed it.

engine-e-surface-files-must-be-json-object = files must be a JSON object of name to content

engine-e-surface-pack-has-at-most-64 = a pack has at most 64 files

engine-e-surface-file-name-must-be-plain = file name `{ $k }` must be a plain name

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` is not valid standard base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = unknown sweep parameter: { $other }

engine-e-sweep-unknown-sweep-metric = unknown sweep metric: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep needs at least one axis

engine-e-sweep-sweep-key-is-malformed = sweep key `{ $key }` is malformed

engine-e-sweep-sweep-key-follows-an-array = sweep key `{ $key }`: `{ $part }` follows an array, so it must be an index

engine-e-sweep-unreachable = unreachable

engine-e-sweep-sweep-key-index-is-past = sweep key `{ $key }`: index { $i } is past the { $n } entries of the array

engine-e-sweep-sweep-key-parent-is-not = sweep key `{ $key }`: `{ $part }`'s parent is not a table

engine-e-sweep-sweep-key-no-field = sweep key `{ $key }`: no field `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = sweep key `{ $key }`: parent of `{ $last }` is not a table

engine-e-sweep-sweep-key-no-field-2 = sweep key `{ $key }`: no field `{ $last }`

engine-e-sweep-metric-no-field-in-result = metric `{ $path }`: no field `{ $part }` in result

engine-e-sweep-metric-value-is-not-number = metric `{ $path }`: value is not a number

engine-e-sweep-sweep-node-serialize = sweep node serialize: { $e }

engine-e-sweep-sweep-node-result-parse = sweep node result parse: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = sweep axis `{ $key }`: declared unit `{ $d }` but the swept pack publishes `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = sweep worker thread panicked

engine-e-sweep-generic-sweep-needs-at-least = generic sweep needs at least one axis

engine-e-sweep-generic-sweep-needs-at-least-2 = generic sweep needs at least one metric

engine-e-sweep-generic-sweep-base-must-carry = generic sweep `base` must carry its own `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = a generic sweep cannot sweep another sweep

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = unknown oscillator { $oscillator }; expected one of { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day and temperature_coeff_per_k must be finite

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s must be finite and positive

engine-e-telecom-timing-duration-must-be-finite-and = duration_s must be finite and at least twelve samples long

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s must lie in [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns must be finite and >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = temperature and frequency-offset inputs must be finite (period > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = the record would exceed 5 000 000 samples; raise sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = a time-error series needs at least 13 samples, got { $pairs }

engine-e-telecom-timing-every-time-and-time-error = every time_s and time_error_ns must be finite

engine-e-telecom-timing-time-must-increase = time_s must increase

engine-e-telecom-timing-the-series-must-be-uniformly = the series must be uniformly sampled: step { $v1 } is { $d } s, the first is { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = CSV line { $v1 } is not `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = the mask is defined through a 0.1 Hz low-pass filter, which this engine applies only at sample intervals of { $MAX_FILTER_DT_S } s or less; this record is sampled every { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = give either [holdover] or [series], not both

engine-e-telecom-timing-give-either-series-samples-or = give either series.samples or series.csv_path, not both

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days must be finite and >= 0

engine-telecom-timing-ns-budget-exceeded-after = ; { $max_abs_te_ns } ns budget exceeded after { $t } s

engine-telecom-timing-ns-budget-never-exceeded = ; { $max_abs_te_ns } ns budget never exceeded

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns over { $v2 } s; { $masks }{ $first_budget } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = unknown --format `{ $f }` (cef or leef)

engine-e-telemetry-cli-unknown-option = unknown option `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input and --result are alternatives

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: no address

engine-telemetry-cli-warning-metrics-is-served-without = warning: /metrics is served without authentication on { $addr }; bind to localhost or put it behind your own access control

engine-e-telemetry-cli-bind = bind { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = serving http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp and --syslog-tcp are alternatives

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting applies to --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: a topic part must be non-empty, without #, + or a leading /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp needs a build with `--features otlp`

engine-telemetry-cli-warning-input-line = warning: input line { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = cannot open { $p }: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not = warning: { $n } MQTT messages were not delivered

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint must start with http://

engine-e-telemetry-otlp-endpoint-has-no-host = endpoint has no host

engine-e-telemetry-otlp-resolve = resolve { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = no address for { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = warning: otlp export failed: { $e }

## src/telemetry/prometheus.rs

engine-telemetry-prometheus-kshana-build-info-version = kshana_build_info{ "{" }version="{ $escape_label }"{ "}" } 1{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-score = kshana_trust_score { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-band-band = kshana_trust_band{ "{" }band="{ $b }"{ "}" } { $on }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-gate-gate = kshana_trust_gate{ "{" }gate="{ $st }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-active-reason = kshana_trust_reason_active{ "{" }reason="{ $escape_label }"{ $class }{ "}" } { $v2 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-epochs-total-band = kshana_trust_epochs_total{ "{" }band="{ $b }"{ "}" } { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-epochs-total = kshana_trust_reason_epochs_total{ "{" }reason="{ $escape_label }"{ "}" } { $n }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-input-errors-total = kshana_trust_input_errors_total { $input_errors }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-overflow-total = kshana_trust_reason_overflow_total { $reason_overflow }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-syslog-send-failures = kshana_trust_syslog_send_failures_total { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-epoch-offset-seconds = kshana_trust_epoch_offset_seconds { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-last-sample-timestamp = kshana_trust_last_sample_timestamp_seconds { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-status = kshana_trust_geometry{ "{" }status="{ $st }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-degraded = kshana_trust_geometry_degraded { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-signal-loss = kshana_trust_geometry_signal_loss { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-epochs-total = kshana_trust_geometry_epochs_total{ "{" }status="{ $st }"{ "}" } { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-label-label = kshana_trust_geometry_label{ "{" }label="{ $l }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-vdop = kshana_trust_geometry_vdop { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-help-type =
    # HELP { $name } { $help }
    # TYPE { $name } { $kind }{ "\u000A" }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = not JSON: { $e }

engine-e-telemetry-sample-not-json-object = not a JSON object

engine-e-telemetry-sample-is-not-number = `{ $k }` is not a number

engine-e-telemetry-sample-is-not-finite = `{ $k }` is not finite

engine-e-telemetry-sample-missing = missing `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } outside 0..=100

engine-e-telemetry-sample-missing-state = missing `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` is not an array

engine-e-telemetry-sample-entry-has-no-name = a `{ $key }` entry has no name

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` is missing or not a finite number

engine-e-telemetry-sample-position-is-not-an-object = `position` is not an object or null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` is missing or not a string

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` is not a finite number >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` is not a string

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` is not a boolean

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` is not an object or null

engine-e-telemetry-sample-result-has-no-epochs = result has no `epochs`

engine-e-telemetry-sample-bad-epochs = bad `epochs`: { $e }

## src/telemetry/syslog.rs

engine-telemetry-syslog-cat-gnss-trust-dvchost-cs1label = cat=gnss-trust dvchost={ $cef_ext_escape } cs1Label=band cs1={ $band }

engine-telemetry-syslog-cs2label-reasons-cs2 = { " " }cs2Label=reasons cs2={ $cef_ext_escape }

engine-telemetry-syslog-cs3label-previousband-cs3 = { " " }cs3Label=previousBand cs3={ $p }

engine-telemetry-syslog-cfp1label-trustscore-cfp1 = { " " }cfp1Label=trustScore cfp1={ $num }

engine-telemetry-syslog-cfp2label-epochoffsetseconds-cfp2 = { " " }cfp2Label=epochOffsetSeconds cfp2={ $num }

engine-telemetry-syslog-cs4label-logtime-cs4 = { " " }cs4Label=logTime cs4={ $cef_ext_escape }

engine-telemetry-syslog-cs5label-gate-cs5 = { " " }cs5Label=gate cs5={ $cef_ext_escape }

engine-telemetry-syslog-cs6label-geometry-cs6 = { " " }cs6Label=geometry cs6={ $status }{ $classes }

engine-telemetry-syslog-cfp3label-geometryhdop-cfp3 = { " " }cfp3Label=geometryHdop cfp3={ $num }

engine-telemetry-syslog-cfp4label-geometrypdop-cfp4 = { " " }cfp4Label=geometryPdop cfp4={ $num }

engine-telemetry-syslog-cn1label-geometryusedsatellites-cn1 = { " " }cn1Label=geometryUsedSatellites cn1={ $v1 }

engine-telemetry-syslog-cef-gnss-trust = CEF:0|{ $cef_header_escape }|{ $cef_header_escape2 }|{ $cef_header_escape3 }|{ $EVENT_PREFIX }.{ $band }|GNSS trust { $band }|{ $cef_severity }|{ $ext }

engine-e-telemetry-syslog-host-is-bytes-syslog-host = host is { $host } bytes; a syslog host name is at most 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = host must be printable ASCII without spaces

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } vs { $w } (not representable as f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: present, expected absent

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: absent, expected present

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } must be finite

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu must be finite and non-negative

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: line { $v1 }: not MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: no AR records for { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = unknown series format { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } must be finite

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s must give 16 to 20000 measurements

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } offset { $ns } ns (Sagnac { $ns2 } ns, ionosphere { $ns3 } ns); combined u { $ns4 } ns (type A { $ns5 } ns at { $averaging_s } s); { $series } real series (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = non-ASCII characters in TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE truncated reading { $what } (columns { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } too short for a column-69 checksum

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } has no checksum digit in column 69

engine-e-tle-tle-checksum-mismatch-column-69 = TLE { $label } checksum mismatch: column 69 says { $want }, computed { $got }

engine-e-tle-not-tle-line = not a TLE line 1: { $line1 }

engine-e-tle-not-tle-line-2 = not a TLE line 2: { $line2 }

engine-e-tle-invalid-in-tle = invalid { $what } in TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = invalid epoch year in TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = invalid catalogue number in TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = inclination out of range [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = eccentricity out of range [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = non-positive mean motion: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = invalid { $what } mantissa in TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = invalid { $what } exponent in TLE: { $exp }

engine-tle-satellite-line-only-element-set = satellite { $satnum }: line-2-only element set parsed as analytic Keplerian (two-body) elements — the line-1 drag/B* and SGP4 secular terms are absent, so this orbit drifts from a true SGP4 fit away from epoch; supply the matching line 1 for SGP4 accuracy

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: the C/N0 profile needs a positive epoch and duration

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: the C/N0 profile would need more than { $MAX_DETECTOR_STEPS } detector steps ({ $total } s at { $epoch_s } s per epoch); shorten ramp_duration_s or lengthen predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } must be finite

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } must be positive (got { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips must be below 1.9 chips (got { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio must be at least 1 (got { $pullin_bandwidth_ratio }) — a loop that re-pulls-in with a NARROWER bandwidth than it tracks with would invert the hysteresis

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s must not be negative

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) must not exceed cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } must not be empty

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } has { $axis } entries; the cap is { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } holds a non-finite value

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: the confirmation dwells must be at least 1 epoch

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = at least eight samples are needed

engine-e-twstft-budget-samples-must-increase-in-time = samples must increase in time

engine-e-twstft-budget-samples-must-be-on-regular = samples must be on a regular grid

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } rows: { $validated } externally validated, { $modelled } modelled, { $partner_owned } partner-owned.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = The complete, machine-checked evidence ledger: **{ $total } rows — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. A row may be VALIDATED only with an independent external oracle (the matrix invariant tests enforce this). The same data, with clickable per-row links to each test, module and committed fixture, is the *Validation ledger* on https://kshana.dev. See [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) for why each Modelled row is not externally validated.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } capabilities labelled MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json is not JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json is not JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] needs `label`

engine-wasm-runs-needs-result = runs[{ $i }] needs `result`

engine-wasm-results-json-is-not-json = results_json is not a JSON array of strings: { $e }

engine-wasm-maps-json-must-be-json = maps_json must be a JSON array of strings: { $e }

engine-wasm-plans-json-is-not-json = plans_json is not a JSON array of strings: { $e }

engine-wasm-options-json-is-not-json = options_json is not JSON: { $e }

engine-wasm-input-is-about-bytes-over = input is about { $b64 } bytes, over the { $v2 }-byte limit

## legal (advisories, disclaimers and notices; the English text is the source, the constant in code is what machine files carry)

engine-legal-compliance-statement = A row marked evidenced means a run in this set supports evidence for the capabilities the row names. It is not a finding that a framework is met, and it does not mean any product has been rated or approved by anyone. The gap column states what the runs do not show.

engine-legal-bench-surface-notice = Vehicle motion and labelled event intervals only. Nothing exported here is, models or drives a radio-frequency or baseband signal, and an event is a time interval, not a recipe for producing interference. The laboratory simulator and its operator supply the signals and are responsible for running them only where that is authorised (conducted or shielded, per the simulator's own safety instructions). Kshana publishes no results from such runs.

engine-legal-iq-campaign-roc-statement = MODELLED: window-level ROC of each monitor on the recordings given. Each stated event window is a positive and each roc_window_s window outside the events a negative; a window counts at a threshold when the monitor's test statistic reaches it in the window. P_fa is per negative window, not per test.

engine-legal-lunanet-afs-advisory = Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service. It checks a symbol stream against one edition of a published specification and says nothing about any LunaNet node or service.

engine-legal-iqfit-statement = MODELLED: every fitted number describes the open receiver (the named loop design and front-end chain) on the recordings it was given, fitted to the campaign's scored results. It is not a measurement of any other receiver. Predictions are labelled PREDICTION, with the nearest tested recording and the distance outside the tested conditions.

engine-legal-iqfit-advisory = Advisory: analysis output, not type-approved navigation equipment; predictions are model outputs with stated error, not guarantees.

engine-legal-lunar-time-lab-source-statement = Source statement, not a claim: the ICG WG-B Lunar PNT material of June 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, source S3 of the study) describes a lunar time reference laboratory at the station with a nanosecond-level time target. Kshana quotes that target for context only; it does not adopt it, and nothing in this block shows that any real station clock meets it.

engine-legal-standards-pack-notice = A standards pack measures modelled scenarios against bars stated before the run. It supports evidence for the framework rows it names; it does not rate or approve any product, and a MET bar says only that the scenario's modelled output met the stated bar.

engine-legal-standards-pack-advisory = Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service; it must not be the sole basis for any navigation or safety decision.

engine-legal-geometry-statement = Geometry under a stated error model (MODELLED): line-of-sight visibility against the stated skyline, dilution of precision and a Gaussian error ellipse for independent, equal, zero-mean Gaussian range errors of the stated user-equivalent range error. It is not a prediction of a receiver's real error, which also has biases, multipath and non-line-of-sight errors, and it is not an integrity bound. Preset constellations are a representative geometry, not the sky of that date at that place.

engine-legal-resilience-disclaimer = Simulation-derived self-assessment aligned to DHS RPCF v2.0. This is not a certification or accreditation, and it represents no authority approval (DHS, IEEE, or otherwise). Every sub-score is MODELLED unless explicitly tagged VALIDATED, and the scores are timing-domain and detection figures of merit, not position-domain accuracy.

engine-legal-observatory-notice = A degraded cell means a high share of aircraft reported low navigation accuracy there that day. No cause is attributed. A cell that is not observed, or absent, was not assessed, which is not the same as clear. Advisory only: not an approval, certification or statement of conformance.

engine-legal-receiver-trust-advisory = Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.

engine-legal-evidence-roundtrip-notice = Links four records by hash: the scenario, the laboratory's stated test conditions, the receiver log and the score of that log against the stated events. It is not a signal, not a replay recipe and not a certification. How the scenario's motion reached the receiver (a file played through a laboratory simulator, conducted or shielded) was the operator's responsibility and is recorded here only as stated.

engine-legal-evidence-bundle-disclaimer = This pack is a technical record of what the Kshana engine computed from the stated receiver log with the stated configuration. It is not a legal opinion, not a finding of fact about any event or its cause, and not a certification.

engine-legal-bench-notice = Advisory: modelled or measured against stated references, not an approval, certification or statement of conformance. A score describes a log or corpus, never a product.

engine-legal-osnma-advisory = Advisory: this is analysis and monitoring output and not type-approved navigation equipment. The authentication status reported here is not a navigation integrity service and must not be the sole basis for any navigation or safety decision.

