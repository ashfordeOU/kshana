# Glossary terms (English source). Written by hand.
#
# Translators: copy this file to i18n/<lang>/glossary.ftl and translate the values, keeping every id and
# every attribute. A term whose rendering is the English word itself (VALIDATED, MODELLED, ...) stays as
# written unless the language guide fixes one translation. `node tools/i18n.mjs check <lang>` fails when a
# page segment uses an English glossary term and the translation does not use the language's rendering.
#
# Ids: -tier-*, -verdict-*, -status-*, -term-*, -kind-*, -cmd-*, -unit-*, -advisory, -mt-notice.
# Kinds, commands and scenario names are generated from the engine register and are always kept as written.

## Evidence tiers
-tier-validated = VALIDATED
    .gloss = checked against an independent external reference
-tier-modelled = MODELLED
    .gloss = computed from a model, with no external reference
-tier-partner = PARTNER
    .gloss = the partner's part; Kshana does not provide it
-tier-exploratory = EXPLORATORY
    .gloss = not set up in advance as a conclusion

## Verdicts against a pre-registered bar
-verdict-met = MET
    .gloss = the bar set in advance was reached
-verdict-not-met = NOT MET
    .gloss = the bar set in advance was missed

## Status words (all-caps words kept as written)
-status-prediction = PREDICTION
-status-corroborated = CORROBORATED
-status-not-corroborated = NOT CORROBORATED
-status-refused = REFUSED
-status-degraded = DEGRADED
-status-deficient = DEFICIENT
-status-observed = OBSERVED
-status-lost = LOST
-status-mismatch = MISMATCH
-status-verified = VERIFIED
-status-consistent = CONSISTENT
-status-inconsistent = INCONSISTENT
-status-spoof-detected = SPOOF DETECTED
-status-intact = INTACT, BUT THE SIGNER IS NOT PINNED

## Terms
-term-scenario = scenario
-term-evidence-pack = evidence pack
-term-ledger = ledger
-term-verification-matrix = verification matrix
-term-interference = interference
-term-integrity = integrity
-term-trust-score = trust score
-term-receiver = receiver
-term-clock = clock
-term-timing = timing
-term-orbit-determination = orbit determination
-term-ephemeris = ephemeris
-term-carrier-phase = carrier phase
-term-integer-ambiguity = integer ambiguity
-term-love-number = Love number
-term-libration = libration
-term-reference-frame = reference frame
-term-pre-registration = pre-registration
-term-oracle = oracle (independent reference)
-term-bar = bar (pre-registered threshold)
-term-baseline = baseline
-term-holdout = holdout (sealed set)
-term-advisory = advisory
-term-type-approved = type-approved
-term-machine-translation = machine translation
-term-native-speaker = native speaker
-term-reviewed = reviewed

## Kept as written (acronyms and field terms; listed so the check knows them)
-kept-gnss = GNSS
-kept-pnt = PNT
-kept-raim = RAIM
-kept-araim = ARAIM
-kept-nmea = NMEA
-kept-cusum = CUSUM
-kept-auc = AUC
-kept-roc = ROC
-kept-lambda = LAMBDA
-kept-dop = DOP

## Commands (always kept)
-cmd-kshana = kshana
-cmd-check = --check
-cmd-study = --study
-cmd-bench = bench
-cmd-receiver-trust = receiver-trust

## Units in running text (symbols such as m, s, ns, dB-Hz never change)
-unit-metre = metre
-unit-second = second
-unit-nanosecond = nanosecond
-unit-decibel-hertz = decibel-hertz

## Product name (never translated)
-brand = Kshana

## The advisory line: every Kshana surface carries it. The main value is the general line.
-advisory = Advisory software, not type-approved equipment.
    .maritime = Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
    .research-test = Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
    .short = Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: { -tier-modelled }.

## The machine-translation notice (every translated page and the Studio show it)
-mt-notice = Machine translation, not reviewed by a native speaker. English is the reference.
