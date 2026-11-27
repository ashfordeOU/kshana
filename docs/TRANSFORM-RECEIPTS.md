# Transform receipts

`kshana transform-receipt` writes and checks **frame and time transform receipts**: a record of
one transformation between time scales (and, optionally, reference frames) that someone else can
recompute.

Every boundary between two systems changes a frame or a time scale, and the change is usually
made silently inside code: which leap-second table, which TT to TDB series, which
Earth-orientation values, which precession-nutation model. When the result is passed on, the
reader cannot tell how it was made. A receipt writes it down: the input, every step with its model
and parameters, the output, and a hash. The open verifier recomputes the output from the recorded
input and parameters and checks the hash, so a receipt can be checked without trusting the tool
that wrote it.

## Commands

```sh
kshana transform-receipt make <request.json> [--eop <finals2000A>] [--out <receipt.json>]
kshana transform-receipt verify <receipt.json> [--eop <finals2000A>] [--trusted-key <hex>]...
```

```sh
kshana transform-receipt make examples/transform-receipt/station-itrf-to-gcrs.json \
    --eop tests/fixtures/agency/eop/finals2000A_20260930.txt --out r.json
kshana transform-receipt verify r.json --eop tests/fixtures/agency/eop/finals2000A_20260930.txt
```

`verify` prints a JSON report of its checks and exits 2 when any fails.

## The request (`kshana.transform-request/1`)

| field | meaning |
|---|---|
| `format` | `kshana.transform-request/1` |
| `epoch.scale` | `UTC`, `TAI`, `TT`, `TDB`, `GPST`, `GST` or `BDT` |
| `epoch.time` | `YYYY-MM-DDTHH:MM:SS[.fraction]`; in UTC, `23:59:60.x` is accepted on a day that ends in a leap second |
| `frame`, `position_m` | optional, together: a position in metres in `ITRS` (an `ITRF...` label is taken as the ITRS) or `GCRS`; the receipt gives it in the other frame |
| `eop` | optional Earth-orientation values: `source`, `ut1_minus_utc_s`, `xp_arcsec`, `yp_arcsec` |

Without `eop` in the request, `--eop <finals2000A>` supplies the values (linear interpolation at
the UTC epoch, with the file's SHA-256 recorded). With neither, UT1 is taken as UTC and polar
motion as zero, and the receipt says so in its `warnings`: UT1 − UTC can reach 0.9 s, about 400 m
of rotation at the equator.

## The receipt (`kshana.transform-receipt/1`)

| field | meaning |
|---|---|
| `format`, `label`, `engine` | the format, `MODELLED`, and the engine name and version that made it |
| `input` | the request's epoch, frame and position |
| `eop` | the Earth-orientation values used and their source (and its SHA-256) |
| `chain` | the steps, each `from`, `to`, `model` and either `offset_s` (time: seconds added) or `parameters` (frame: the TT and UT1 two-part Julian dates and the pole) |
| `output.epochs` | the instant in TAI, UTC, TT, TDB, GPST, BDT and UT1, each as an ISO time and a two-part Julian date (`jd_day`, `jd_frac`; UTC in the SOFA quasi-Julian-date convention) |
| `output.frame`, `output.position_m` | the transformed position |
| `tolerance` | what the verifier allows on a recomputation: 1e-9 s and 1e-6 m |
| `warnings` | conditions the reader must know (no Earth-orientation values; an ITRF label taken as the ITRS) |
| `hash` | `{"alg": "sha256", "value": ...}` over the canonical bytes |
| `signature` | optional `{"alg": "ed25519", "public_key": ..., "value": ...}` over the canonical bytes |

**Canonical bytes:** the receipt without `hash` and `signature`, written as compact JSON with
object keys in byte order and numbers in the shortest form that reads back to the same double (the
form serde_json writes). Re-indenting a receipt does not change them; editing any value does.

### Models

| step | model identifier (abridged) |
|---|---|
| UTC ↔ TAI | the engine's leap-second table (IERS Bulletin C), SOFA `iauUtctai` / `iauTaiutc` conventions |
| TAI → TT | TT = TAI + 32.184 s |
| TAI → GPST, BDT | GPST = TAI − 19 s (GST = GPST), BDT = TAI − 33 s |
| TT → TDB | TDB − TT = 0.001657 sin g + 0.000022 sin 2g s |
| UTC → UT1 | the recorded UT1 − UTC |
| ITRS ↔ GCRS | IAU 2006/2000A CIO based (IERS Conventions 2010 ch. 5), polar motion; dX, dY not applied |

The CIO chain is the engine's `cio` module, checked against the SOFA/ERFA reference values in its
own tests; the receipt uses the two-part dates so the Earth rotation angle keeps the microsecond.

## What `verify` checks

| check | passes when |
|---|---|
| `format` | the format is `kshana.transform-receipt/1` |
| `hash` | the recorded SHA-256 equals the SHA-256 of the canonical bytes |
| `models` | the chain has the same steps and model identifiers this verifier uses |
| `time` | every time offset and output epoch, recomputed from the recorded input and Earth-orientation values, agrees within 1e-9 s |
| `position` | the recomputed position agrees within 1e-6 m (when there is one) |
| `eop-file`, `eop-values` | with `--eop`: the file's SHA-256 is the recorded one and its interpolated values are the recorded ones |
| `signature`, `signer` | when the receipt is signed: the Ed25519 signature verifies; with `--trusted-key`, the key is one of those given (a trusted key and no signature fails) |

## Signing

`verify` checks a signature; `make` does not sign. A receipt can be signed by any Ed25519 signer
over the canonical bytes, or carried inside a signed `kshana evidence` pack
([Evidence packs](EVIDENCE-PACKS.md)), which signs the files it contains.

## Limits

**Evidence: MODELLED.** A receipt records which models produced a result; it does not make them
more accurate. The two-term TDB series is good to tens of microseconds; the frame step leaves out
the celestial pole offsets dX, dY (centimetres to decimetres at the Earth's surface) and does not
transform between ITRF realisations; linear interpolation of finals2000A rows is what the
engine's EOP reader does. Velocities are not transformed. A verifier from a different engine
version with different model identifiers reports `models` as failed even when the numbers agree.

Tests: `tests/transform_receipt.rs`.
