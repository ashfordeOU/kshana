# Galileo OSNMA: synthetic sample inputs and expected outputs

Four inputs for building and testing a viewer against `kshana osnma verify --json`
(`docs/OSNMA.md`), each with the output the command gives for it. **Nothing here is a
recording of any signal.** The TESLA chain, the signing key, the navigation words and the
tags are made up by `tests/osnma_synthetic.rs` (no random numbers), so they show how the
verifier reports, not how Galileo behaves. The key is a throwaway; it authenticates
nothing real. The result carries the advisory: not type-approved navigation equipment, not
a navigation integrity service.

| Input | What it shows | Expected output |
|---|---|---|
| `pages-good.txt` | plain page format (`docs/OSNMA.md`), 24 sub-frames of two satellites, a signed chain: E02 and E05 `authenticated`, overall `authenticated`, exit 0 | `expected/pages-good.txt.json` |
| `pages-corrupt.txt` | the same with one flipped bit in E05's navigation data at sub-frame 12: the tag that covers it fails, E05 is `failed`, and so is E02, which transmitted the tag (either could be at fault), overall `failed`, exit 3 | `expected/pages-corrupt.txt.json` |
| `stream-good.ubx` | the same good data as a u-blox UBX-RXM-SFRBX byte stream (`--format ubx`, detected automatically); the `ubx` block counts frames and pages | `expected/stream-good.ubx.json` |
| `stream-corrupt.ubx` | the corrupt data as a UBX stream | `expected/stream-corrupt.ubx.json` |

The verifier is given the throwaway public key in `public-key.txt`; the chain is
established from the signed key message in the stream, so nothing else is needed:

```
kshana osnma verify examples/osnma/pages-good.txt \
    --public-key "$(cat examples/osnma/public-key.txt)" --json
```

No reference time is given, so the output says freshness is not enforced
(`"freshness_enforced": false`): the sample times are only as good as the file.

Regenerate (from the repository root; this runs the generator test):

```
examples/osnma/regenerate.sh
```

`tests/osnma_synthetic.rs` (`the_osnma_sample_files_are_current`) fails if the files differ
from what the generator makes today, or if an expected output differs from what the
command prints for its input.
