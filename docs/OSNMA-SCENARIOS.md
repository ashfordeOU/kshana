<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# OSNMA scenario files and the reference-model runner

`kshana osnma scenario` lets anyone write down an OSNMA test case as a file and run it through the
open [OSNMA verifier](OSNMA.md). A scenario says what synthetic stream to build, what to change in it,
and what the verifier is expected to conclude. The runner builds the stream with an open reference
model, feeds it to the verifier in memory and prints what the verifier concluded beside each stated
expectation.

```
kshana osnma scenario template                    # print a filled-in example
kshana osnma scenario run <scenario.json> [--json]
```

Exit status: 0 every stated expectation met, 1 at least one not met, 2 usage or input error.

> **Advisory.** This is analysis output and not type-approved navigation equipment. Results are
> **MODELLED**: they show the verifier's behaviour on a synthetic stream built from our own reading of
> the OSNMA SIS ICD Issue 1.1 and Receiver Guidelines Issue 1.3. They are not conformance results and
> do not describe any receiver. The verifier itself is checked against the official test vectors (see
> [OSNMA](OSNMA.md)); the scenarios add nothing to that check.

## The reference model

* E02 transmits OSNMA with MAC look-up table entry 34: 40-bit tags, 128-bit keys, one key per
  sub-frame, ADKD 4 and slow-MAC (ADKD 12) tags for its own data, and cross-authentication (ADKD 0)
  tags for E05.
* E05 does not transmit OSNMA; it is authenticated only by E02's tags.
* The TESLA chain is a **test chain** built from `chain.seed` and handed to the verifier as already
  trusted, so no DSM-KROOT signature, Merkle tree or public key is involved. No Galileo key is used or
  needed, and no Galileo receiver would trust these keys.
* Navigation words are filler derived from a hash (Word Types 1 to 5 hold for one IODnav, ten
  minutes), not ephemerides.
* The stream starts at GST week 1248, time of week 345 600 s; sub-frames are 30 s.
* Nothing transmits. The stream exists only in memory and only the report is written.

## Format `kshana.osnma-scenario/1`

```json
{
 "format": "kshana.osnma-scenario/1",
 "name": "flipped-cross-authenticated-bit",
 "description": "free text",
 "chain": {"hash": "sha256", "mac": "hmac-sha256", "seed": 5, "cid": 3, "dummy_cross_tags": false},
 "subframes": 18,
 "order": "cross_first",
 "reference_time": {"offset_s": 0, "max_time_error_s": 29},
 "changes": [{"kind": "flip_page_bit", "prn": 5, "subframe": 6, "page": 0, "bit": 27}],
 "expect": {"status": {"E02": "failed", "E05": "failed"}, "overall": "failed", "any_tag_failed": true}
}
```

Unknown fields are refused. `chain`, `order`, `reference_time`, `changes` and `expect` may be left out.

| Field | Values |
|---|---|
| `chain.hash` | `sha256` or `sha3-256` |
| `chain.mac` | `hmac-sha256` or `cmac-aes` |
| `chain.seed` | 0 to 255; different seeds give unrelated chains |
| `chain.cid` | 0 to 3 |
| `chain.dummy_cross_tags` | E02 sends dummy tags (COP 0) for E05 |
| `subframes` | 1 to 120 |
| `order` | `cross_first` (E05's pages of a sub-frame first) or `osnma_first` |
| `reference_time` | an independent present time, `offset_s` from the stream start, and the tolerance below 30 s |

### Changes

Sub-frames are counted from 0. `prn` is 2 or 5.

| `kind` | Fields | Effect |
|---|---|---|
| `flip_page_bit` | `prn`, `subframe`, `page` (0 to 14), `bit` (0 to 239) | flips one bit of a page and recomputes its CRC, so the page still looks genuine |
| `flip_key_bit` | `subframe`, `bit` (0 to 127) | flips one bit of the TESLA key E02 sends |
| `replay_tags` | `subframe`, `from_subframe` (earlier) | E02 repeats an earlier sub-frame's tags with this sub-frame's genuine key |
| `time_offset` | `prn`, `from_subframe`, `seconds` (up to a week either way) | relabels the satellite's pages with a shifted time |
| `drop_pages` | `prn`, `from_subframe`, `to_subframe` | removes the satellite's pages over the range |
| `break_crc` | `prn`, `subframe`, `page` | flips a data bit and leaves the CRC, so the page is dropped |

### Expectations

Every stated field is checked; fields left out are not.

| Field | Checks |
|---|---|
| `status` | final status of `E02` and `E05`: `authenticated`, `failed` or `unavailable` |
| `overall` | final overall status |
| `authenticated_tags_min`, `authenticated_tags_max` | bounds on the number of tags that authenticated |
| `any_tag_failed` | whether any tag failed |
| `events` | whether verifier events of a kind occurred: `key_verified`, `key_rejected`, `time_rejected`, `bad_crc`, `key_stall`, `kroot_verified`, `kroot_rejected`, `public_key_verified`, `public_key_rejected`, `public_key_revoked`, `chain_revoked`, `alert_message`, `tag` |

## The report `kshana.osnma-scenario-run/1`

Pages fed, tag outcomes by state and by state and reason (for example `failed:tag_mismatch`,
`pending:no_nav_data`), verifier events by kind, the final status per satellite and overall, one
check per stated expectation (`what`, `expected`, `observed`, `met`), `all_met`, the provenance
statement and the advisory. The report is not signed and carries no score.

## Examples

`examples/osnma-scenarios/` holds ten scenarios. Their expectations restate the assertions of the
synthetic attack tests (`tests/osnma_synthetic.rs`): a clean stream, a flipped bit of
cross-authenticated data, a flipped key bit, replayed tags, shifted time labels, a silent
cross-authenticated satellite, dummy tags, a distant reference time, a broken CRC, and a SHA3-256 and
CMAC-AES chain.

```sh
for f in examples/osnma-scenarios/*.json; do kshana osnma scenario run "$f"; done
```

## Not covered

* DSM-KROOT and DSM-PKR messages, signatures, the Merkle tree, chain and key renewal or revocation,
  and the alert message: the chain is handed over as trusted. The synthetic tests cover these in code.
* Other look-up table entries, key and tag sizes, and NMA status changes.
* Real ephemerides, real recordings, and anything at the signal level.

Tests: `tests/osnma_scenarios.rs` (every example meets its expectations, the effects match the
synthetic tests, the command line's exit codes, unknown fields refused), the unit tests in
`src/osnma/scenario.rs`, and the scenario block of `tests/parser_robustness.rs`.
