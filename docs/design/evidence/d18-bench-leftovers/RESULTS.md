<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D18 (0.41): two open items from the benchmark and observatory work: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026, no bar).

## Item 1: the almanac-HDOP scorer: built

`src/interference_map/almanac_hdop.rs` is built from public sources only and labelled as Kshana's
own method; it does not reproduce the cited paper. `docs/observatory/METHOD.md` says what was built
and from which sources. Acceptance (`tests/almanac_hdop.rs` and the module's tests):

| Test | Result |
|---|---|
| 1. HDOP against an independent numpy computation at 20 stated epochs and positions, to 1e-9 | **passes**: worst difference 1.6e-15, same satellite counts (`xval/almanac-hdop/`) |
| 2. NACp-to-EPU mapping against the quoted table, every category | **passes** (J. Sun, *The 1090 Megahertz Riddle*, Table 1.9) |
| 3. Flag logic on 12 hand-written reports | **passes**: exact |
| 4. `METHOD.md` updated | **done** |

No real data has been scored with it. That would be an evidence question with its own
pre-registration.

## Item 2: the TEXBAT hashes: code done, hashes not yet obtained

The bench can now check pinned hashes:

- `kshana bench verify-manifest` reads a source's `files` (path, size, SHA-256) and hashes each file
  in 1 MiB blocks, because a TEXBAT recording is tens of gigabytes.
- It refuses a file whose hash or size differs, a malformed hash, and a pinned source with a file
  that has no hash.
- `tests/bench_external_source_pins.rs` checks the refusal, and checks that the shipped manifest's
  TEXBAT source is well formed. It is pinned exactly when it lists files, and every listed file
  has a size and a 64-digit hash.

The hashes themselves are not yet recorded, and `"sha256_pinned"` stays `false` in
`bench/manifests/b-iq.json`:

- TEXBAT's data host failed TLS certificate verification from the session that wrote this code.
  That fetch was not attempted around the check.
- The files are about 40 GB each.
- Fetching them is with the owner.

The files to pin are `cleanStatic.bin` and `ds1.bin` to `ds8.bin`, with the URL
(<https://radionavlab.ae.utexas.edu/texbat>), the retrieval date and the byte counts. The first
fetch records them and sets `"sha256_pinned"` to `true`. The licence handling in
`bench/LICENCES.md` is unchanged: reference only, and the files are not vendored.
