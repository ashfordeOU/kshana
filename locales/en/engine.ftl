# SPDX-License-Identifier: AGPL-3.0-only
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

## src/clock_log.rs

e-clock-log-unknown-clock-log-format-expected = unknown clock-log format { $other }; expected one of { $format_names }

e-clock-log-unknown-gap-policy-expected-refuse = unknown gap policy { $other }; expected refuse, longest or linear

e-clock-log-give-either-the-log-text = give either the log text or its path, not both

e-clock-log-clock-log-needs-its-text = a clock log needs its text or a path

e-clock-log-tau0-must-be-finite-and = tau0_s must be finite and > 0 (got { $t })

e-clock-log-units-and-data-apply-to = units and data apply to the timelab format only

e-clock-log-channel-applies-to-the-ticc = channel applies to the ticc format only

e-clock-log-cannot-read-clock-log = cannot read clock log { $path }: { $e }

e-clock-log-clock-log-path-is-not = a clock-log path is not available in the WebAssembly build; give the log as text

e-clock-log-the-log-has-missing-epoch = the { $format } log has { $n_missing } missing epoch(s) in { $n_gaps } gap(s) on a { $tau0 } s grid; set gaps = "longest" to keep the longest gap-free run or gaps = "linear" to interpolate

e-clock-log-the-log-yields-usable-sample = the { $format } log yields { $x } usable sample(s); at least 3 are needed

e-clock-log-not-rinex-clock-file-no = not a RINEX clock file: no END OF HEADER record

e-clock-log-the-rinex-clock-file-has = the RINEX clock file has no AS or AR records

e-clock-log-the-rinex-clock-file-holds = the RINEX clock file holds { $many } clocks; name one with clock = "..." ({ $many2 })

e-clock-log-no-as-or-ar-records = no AS or AR records for clock { $id }

e-clock-log-the-clock-has-single-epoch = the clock has a single epoch; tau0 cannot be found

e-clock-log-the-log-has-no-readings = the { $format } log has no readings

e-clock-log-unknown-phase-unit-expected-ms = unknown phase unit { $other }; expected s, ms, us, ns or ps

e-clock-log-timelab-line-has-column-the = TimeLab line { $v1 } has { $v } column(s), the first data line has { $first }

e-clock-log-timelab-line-has-columns-one = TimeLab line { $v1 } has { $v } columns; one (value) or two (time value) are read

e-clock-log-timelab-line-is-not-numeric = TimeLab line { $v1 } is not numeric: { $l }

e-clock-log-the-timelab-log-has-no = the timelab log has no readings

e-clock-log-unknown-data-expected-phase-or = unknown data { $other }; expected phase or frequency

e-clock-log-tau0-header-is-not-positive = tau0 header { $v } is not a positive number of seconds

e-clock-log-frequency-data-is-fractional-frequency = frequency data is fractional frequency; its units can only be 1

e-clock-log-two-column-frequency-logs-are = two-column frequency logs are not read; give frequency as a single column with tau0

e-clock-log-unknown-time-units-expected-or = unknown time_units { $o }; expected s or mjd

e-clock-log-the-timelab-log-time-column = the timelab log's time column must increase

e-clock-log-single-reading-tau0-cannot-be = a single reading; tau0 cannot be found

e-clock-log-the-timelab-log-has-non = the timelab log has { $non_finite } non-finite reading(s)

e-clock-log-the-ticc-log-holds-channels = the TICC log holds channels { $many }; name one with channel = "..."

e-clock-log-no-readings-on-channel-found = no readings on channel { $channel } (found { $labels })

e-clock-log-ticc-interval-mode-lines-carry = TICC interval-mode lines carry no time; give tau0_s (the event period)

e-clock-log-the-readings-do-not-increase = the { $channel } readings do not increase, so they are not time stamps (TICC Period mode output is not read; use Timestamp mode)

e-clock-log-single-time-stamp-tau0-cannot = a single time stamp; tau0 cannot be found

e-clock-log-two-time-stamps-apart-under = two { $channel } time stamps { $w } s apart, under half of tau0 = { $tau0 } s

e-clock-log-the-time-stamps-of-go = the { $format } time stamps of { $clock } go backwards (a restarted daemon or a clock step); split the log and read each part

e-clock-log-the-log-has-no-readings-2 = the log has no { $what } readings

e-clock-log-the-log-holds-sources-name = the log holds { $many } sources; name one with { $selector } = "..." ({ $many2 })

e-clock-log-no-readings-for-found = no { $what } readings for { $id } (found { $names })

e-clock-log-the-servo-of-never-reached = the servo of { $id } never reached the locked state s2

e-clock-log-the-log-has-no-chrony = the log has no chrony tracking readings
