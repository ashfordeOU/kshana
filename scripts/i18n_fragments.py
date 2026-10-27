#!/usr/bin/env python3
"""List the catalogue messages that are sentence fragments: pieces of a sentence that the code
joins at runtime (push_str, `+`, a Vec of pieces, a message passed as an argument of another one),
or that start or end mid-sentence. A translator cannot translate a fragment correctly, because
word order and agreement change across the pieces. Writes i18n/en/engine-fragments.txt."""
import glob, os, re, sys

# Entries the heuristics below flag that are NOT pieces of a sentence assembled at run time, each with
# the reason, checked by hand against the call site (the id is the one in the catalogue, without
# `engine-`). Nothing is added here to hide a fragment: a message that another message embeds, or that
# starts or ends mid-sentence in a way a translator cannot reorder, belongs in the merged messages, not here.
EXCLUDED_GROUPS = [
    (
        'markup: CSS rules or custom properties written into the HTML or SVG, not prose',
        [
            "advanced-report-bg-fg-muted-line-card",
            "animation-bg-fill-fg-fill-mu",
        ],
    ),
    (
        'whole message: a table column heading whose English ends "in" (the AUC on the in-distribution data); one heading, not assembled',
        [
            "bench-site-col-auc-in",
        ],
    ),
    (
        'whole message: an error sentence whose English ends in a preposition ("to start the solve from"); one complete sentence, not assembled',
        [
            "e-receiver-trust-monitors-engine-fix-the-rinex-observation",
        ],
    ),
    (
        'value word: the placeholder "n/a" shown in place of a missing number; one word, not a sentence piece',
        [
            "bench-site-not-available",
            "campaign-chart-not-available",
            "leo-pnt-chain-chart-not-available",
        ],
    ),
    (
        'data: CSV column name (a machine document; headers stay English)',
        [
            "ssv-scenario-signals-best-cn0-dbhz",
            "telecom-timing-mtie-limit-ns",
            "telecom-timing-tdev-limit-ns",
        ],
    ),
    (
        'identifier: a file name, metric name or JSON path, not prose',
        [
            "iq-cli-scene-sigmf-meta",
            "iq-monitor-sqm-sqm-pair",
            "campaign-monte-carlo-metrics",
            "interference-map-observatory-observatory-adsb",
            "verification-tests-fixtures",
        ],
    ),
    (
        'locator: a noun phrase naming where something is (a run, a constellation entry, a log record, a method); it is stored as a label or followed by a colon, and no word of it depends on the text after it',
        [
            "campaign-sweep-node",
            "campaign-optimize-optimize-eval",
            "constellation-constellation-satellite",
            "constellation-constellation-shell",
            "receiver-trust-machines-novatel-gps-week-tow",
            "bench-tasks-kshana-receiver-trust-35-default",
        ],
    ),
    (
        'whole message: a complete error message or label that only ends in a preposition, `;` or a flag name; the English text itself, not a piece',
        [
            "advanced-report-th-used-by",
            "telemetry-otlp-no-address-for",
            "e-campaign-phase-carries-which-the-previous",
            "e-campaign-phase-handoff-from-channel-which",
            "e-campaign-phase-the-first-phase-has",
            "e-evidence-cli-needs-from",
            "e-evidence-cli-needs-to",
            "e-geometry-sky-systems-needs-site-or",
            "e-geometry-sky-tle-needs-site-or",
            "e-jammertest-plan-the-plan-has-several-test",
            "e-ndm-xml-bad-character-reference",
            "e-ndm-xml-unknown-entity",
        ],
    ),
    (
        'whole message: the English text itself ends "...that are" (a count of scenarios then a missing noun); it is one message, not assembled, and English must not change',
        [
            "main-error-no-bundled-scenario-named",
            "surface-no-bundled-scenario-named-the",
        ],
    ),
    (
        'whole line: layout whitespace (a newline or indent at its start or end) is formatting of a report line, not a missing word',
        [
            "iq-cli-campaign-campaign-cell-already-done-run",
            "iq-labfit-iqreport-validation-table-sha-256-registered",
            "leo-fusion-ppp-ppp-convergence-to-horizontal-vertical",
            "leo-navmsg-fit-interval-trade-over-usage",
            "leo-navmsg-mid-pass-update-pass-max",
        ],
    ),
    (
        'whole line: one line of text drawn on the observatory PNG',
        [
            "interference-map-observatory-degraded-not-degraded-not-observed",
            "interference-map-observatory-source-licence",
        ],
    ),
    (
        'whole line: a chart title, footer or paragraph, drawn or stored as it is',
        [
            "ephemeris-ground-track-samples-alt-km",
            "leo-pnt-chain-sisre-gnss-only-rms-3d",
            "cislunar-observability-first-arc-length-at-which",
            "advanced-report-rows-of-non-numeric-column",
            "resilience-score-weakest-rpcf-sub-score-bounded",
        ],
    ),
    (
        "whole line: one complete summary line, returned as the result's `summary`; the `let x = t!(..)` is only returned or stored, no other message is built from it",
        [
            "study-summary",
            "aocs-kind-aocs-wheels-slew-from-deg",
            "aperture-duty-aperture-duty-cycle-session-on",
            "api-builtins-combined-altpnt-free-inertial-drift",
            "api-builtins-generic-sweep-of-over-nodes",
            "api-builtins-integrity-satellites-epochs-available-hal",
            "api-builtins-lunar-differential-pnt-sats-illustrative",
            "api-builtins-lunar-frame-realisation-points-translation",
            "api-builtins-lunar-integrity-south-pole-epochs",
            "api-builtins-lunar-interop-export-ref-frame",
            "api-builtins-lunar-joint-od-clock-sats",
            "api-builtins-lunar-station-coverage-points-epochs",
            "api-builtins-lunar-time-offset-secular-ltc",
            "api-builtins-lunar-vlbi-baseline-km-beacon",
            "api-builtins-quantum-anomaly-detect-auc-quantum",
            "api-builtins-quantum-gnss-free-nav-outage",
            "api-builtins-quantum-time-transfer-quantum-chain",
            "api-builtins-scenario-fused-quantum-pnt-holdover",
            "api-builtins-scenario-gnss-ins-quantum-outage",
            "api-builtins-scenario-gnss-sim-mean-iono",
            "api-builtins-scenario-optical-sync-rms-ps",
            "api-builtins-scenario-quantum-holdover-p95-classical",
            "api-builtins-scenario-quantum-pnt-holdover-integrity",
            "api-builtins-scenario-runs-quantum-holdover-p95",
            "api-builtins-scenario-samples-alt-km-lat",
            "api-builtins-scenario-samples-gnss-nominal-best",
            "api-builtins-scenario-spoof-detect-svs-db",
            "api-builtins-scenario-spoof-vs-ns-spec",
            "api-builtins-sweep-over-pts-scale-quantum",
            "api-builtins-terrain-nav-free-inertial-drift",
            "api-builtins-terrain-slam-waypoints-free-inertial",
            "api-scenario-jamming-availability-under-jamming",
            "araim-reference-araim-reference-check-published-wg",
            "attitude-budget-attitude-budget-km-kg-gg",
            "constellation-constellation-design-satellites-around-the",
            "contact-schedule-acm-link-pass-es-acm",
            "contact-schedule-contact-schedule-satellites-stations-over",
            "entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses",
            "entry-eo-ascent-entry-heating-entry-heating-rel-peak-at",
            "entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well",
            "eo-payload-eo-coverage-km-fov-km",
            "impairment-eval-impairment-eval-detector-auc-in",
            "leo-signal-scenario-leo-signal-signals-noise",
            "linkbudget-link-budget-band-km-bit",
            "lunar-infra-lunar-infrastructure-carrier-phase-ambiguities",
            "lunar-infra-lunar-infrastructure-frame-coestimation-smallest",
            "lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb",
            "lunar-infra-lunar-infrastructure-od-consistency-gnss",
            "lunar-infra-lunar-infrastructure-space-tie-sweep",
            "passes-passes-pass-es-of-km",
            "quantum-trade-quantum-trade-candidate-timing-holdover",
            "reentry-reentry-allen-eggers-peak-at",
            "space-packet-space-packet-framed-ccsds-133",
            "space-weather-space-weather-f10-f10-7a",
            "time-transfer-budget-time-transfer-budget-offset-ns",
        ],
    ),
]
EXCLUDED = {i: reason for reason, ids in EXCLUDED_GROUPS for i in ids}

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOK = r'(?:crate::|kshana::)?t!\(\s*"([a-z0-9-]+)"'


def messages():
    text = open(os.path.join(ROOT, "i18n/en/engine.ftl"), encoding="utf-8").read()
    out = {}
    for m in re.finditer(r'(?m)^engine-([a-z0-9-]+) =[ \t]*(.*(?:\n[ \t]+.*)*)', text):
        out[m.group(1)] = m.group(2)
    return out


def text_fragment(raw):
    s = raw.strip()
    starts = raw[:1] in " \t" or re.match(r'[,;]', raw) is not None
    ends = re.search(r'(\b(and|or|the|a|an|of|to|in|with|for|by|as|is|are|from|than|at|on|then|that|which)|[,:(;])\s*$', s) is not None
    return starts or ends


def joined_sites():
    ids = {}
    for f in glob.glob(os.path.join(ROOT, "src/**/*.rs"), recursive=True) + glob.glob(os.path.join(ROOT, "src/*.rs")):
        s = open(f, encoding="utf-8").read()
        for m in re.finditer(TOK, s):
            pre = s[max(0, m.start() - 60):m.start()]
            why = None
            if re.search(r'push_str\(\s*&?\s*(?:crate::|kshana::)?$', pre) or re.search(r'\+=\s*&?\s*$', pre):
                why = "pushed onto a string"
            elif re.search(r'\.push\(\s*$', pre) or re.search(r'vec!\[[^\]]*$', pre):
                why = "collected as a piece"
            else:
                # `let x = t!(..)` whose name is passed later as `k = x` to another message
                lm = re.search(r'let\s+(?:mut\s+)?(\w+)\s*(?::[^=]+)?=\s*(?:\w+\s*\.\s*)?$', pre)
                if lm:
                    var = lm.group(1)
                    tail = s[m.end(): m.end() + 1500]
                    if re.search(r'\b\w+\s*=\s*&?' + re.escape(var) + r'\b\s*[,)]', tail) or re.search(r'\b' + re.escape(var) + r'\s*[,)]', tail.split("t!(")[-1] if False else tail):
                        why = "passed to another message"
            if why:
                ids.setdefault(m.group(1), why)
    return ids


def main():
    msgs = messages()
    found = {}
    for i, raw in msgs.items():
        if i.startswith(("advanced-report-bg", "animation-", "palette-", "interop-", "python-", "iq-cli-sweep", "jammertest-dataset", "receiver-trust-machines")):
            continue  # file formats, not prose
        if text_fragment(raw):
            found[i] = "starts or ends mid-sentence"
    # A message pushed onto a string or collected as a piece is usually a whole line of a report, which
    # translates fine; it is a fragment only when its text is (above) or when another message is built
    # from it.
    for i, why in joined_sites().items():
        if i in msgs and why == "passed to another message":
            found.setdefault(i, why)
    for i in EXCLUDED:
        if i not in msgs:
            sys.exit(f"EXCLUDED lists {i}, which is not a message: remove it")
    stale = sorted(i for i in EXCLUDED if i not in found)
    if stale:
        print("note: excluded but no longer flagged (may be removed from EXCLUDED):", ", ".join(stale))
    found = {i: w for i, w in found.items() if i not in EXCLUDED}
    path = os.path.join(ROOT, "i18n/en/engine-fragments.txt")
    lines = ["# Messages that are pieces of a sentence assembled at run time. Do not translate them word for word:",
             "# the order of the pieces changes across languages. Each is to be merged into one whole-sentence",
             "# message with placeables; the list may only shrink (tests/i18n_catalogue.rs). id: reason",
             f"# ({len(EXCLUDED)} flagged entries that are not sentence pieces are excluded, with reasons, in EXCLUDED of scripts/i18n_fragments.py)", ""]
    lines += [f"{i}: {w}" for i, w in sorted(found.items())]
    if "--check" in sys.argv:
        return len(found)
    open(path, "w", encoding="utf-8").write("\n".join(lines) + "\n")
    print(len(found), "fragments ->", os.path.relpath(path, ROOT))


main()
