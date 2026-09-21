# TIB scorer reference fixture

`reference.json` is an **InternalConsistency** oracle for the Timing Integrity
Benchmark's *scorer machinery* only. An independent numpy re-implementation
(`scripts/gen_tib_scorer_reference.py`) classifies a fixed synthetic
(true_error, PL) sample set by the Stanford integrity-diagram four-region rule
and counts the regions; `tests/tib_scorer_reference.rs` asserts the Rust scorer
reproduces those counts on the identical inputs.

**This is NOT an ExternalDataset and NOT a Validated accuracy oracle.** The
benchmark is *honesty-immune*: it makes no accuracy claim of its own, so there
is nothing to validate against real-world truth here — only the counting is
cross-checked. The scoring taxonomy is Cited from the Stanford–ESA integrity
diagram (Tossaint et al., ION GNSS 2007) and RTCA DO-229 (WAAS MOPS); the
undetectable-fault set is Cited from Mizrahi (RFC 7384) and Narula & Humphreys
(IEEE JSTSP 2018). Regenerate offline: `python3 scripts/gen_tib_scorer_reference.py`.
