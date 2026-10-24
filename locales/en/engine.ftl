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

## Clock logs (src/clock_log.rs)

e-clock-version = RINEX clock version { $version } is not read: versions 2.00 and 3.00 to 3.04 are (IGS publishes the clock format up to 3.04; RINEX 4.00 to 4.02 define no clock file)
