# Pre-registration: high-degree spherical-harmonic gravity (EGM2008 to degree 2190)

Committed before any comparison of Kshana output with oracle output. It fixes what is
compared, against what, where, and the numeric bars. Bars may later be tightened, never
loosened. A miss is recorded with its numbers in `RESULTS.md` and is not tuned away.

## What is under test

`gravity_sh::SphericalHarmonicField::acceleration_hf` (and `potential_hf`): the
Holmes & Featherstone (2002) modified forward-column evaluation with the `2^-930` scale,
Horner summation over the order in `cos φ`, and a gradient formed without a `1/cos φ` term;
and `SphericalHarmonicField::from_gfc_file`, the streaming ICGEM `.gfc` loader.
The historical `acceleration` / `potential` are not under test here and are unchanged.

## Data

EGM2008 (NGA; distributed by ICGEM as `EGM2008.gfc`, 252 140 870 bytes,
SHA-256 `ab5b524da073e63b5bdceb7ca47a0de07a26dd44a1c5798f39fc98dc80af70fd`, fetched from
`https://icgem.gfz.de/getmodel/gfc/c50128797a9cb62e936337c890e4425f03f0461d7329b09a8cc8561504465340/EGM2008.gfc`).
Not committed; tests that need it read `KSHANA_EGM2008_GFC`. The always-on comparison uses
the committed degree-70 block `tools/egm2008_to70.gfc` (identical coefficients to degree 70).

## Oracles

* **O1: Orekit 12.2** `HolmesFeatherstoneAttractionModel.gradient(date, position, mu)`
  (body frame, non-central part: degrees 2 and up), coefficients read by Orekit's own
  `ICGEMFormatReader` from the same `.gfc` file, `NormalizedSphericalHarmonicsProvider`
  truncated to degree = order = N. Potential: `nonCentralPart(date, position, mu)`.
* **O2: pyshtools 4.14.1** (SHTOOLS, BSD-3-Clause) `gravmag.MakeGravGridPoint` with
  `C̄00 = 0`, `omega = 0`, returning the (r, θ, φ) components, converted to Cartesian in the
  generator. Coefficients parsed from the same `.gfc` by the generator script.

Kshana is compared on the field read by `from_gfc_file` (or `from_gfc`) with `C̄00` set to
zero, so all three sides compute the same non-central quantity. GM = 3.986004415e14 m³/s²,
Re = 6378136.3 m (from the file header).

## Points (Earth-fixed; geocentric latitude, longitude, radius)

| id | point | r (m) | lat (deg) | lon (deg) |
|---|---|---|---|---|
| P1 | LEO 400 km, mid latitude | 6 778 136.3 | 37.5 | 23.1 |
| P2 | LEO, near the north pole | 6 778 136.3 | 89.999 | 45.0 |
| P3 | LEO, exactly at the north pole | 6 778 136.3 | 90 (x = y = 0) | — |
| P4 | reference sphere, exactly at the south pole | 6 378 136.3 | −90 (x = y = 0) | — |
| P5 | LEO, equator | 6 778 136.3 | 0.0 | −71.3 |
| P6 | GEO | 42 164 000 | 0.05 | 75.0 |
| P7 | reference sphere, mid latitude | 6 378 136.3 | −33.9 | 151.2 |
| P8 | reference sphere, high latitude | 6 378 136.3 | 80.0 | −40.0 |
| P9 | reference sphere, near the south pole | 6 378 136.3 | −89.9999 | 10.0 |
| P10 | reference sphere, the plain recursion's sectoral-underflow band | 6 378 136.3 | 68.2 | −40.0 |

Cartesian coordinates are computed once by the generator (`x = r cos φ cos λ` etc.,
x = y = 0 exactly for P3 and P4) and written to the fixture; Kshana reads them from there.

Degrees N: 70 (bundled block, always-on test), 200, 360, 2190 (data-gated tests).

## Bars (per point, per degree, per oracle)

Δa = |a_kshana − a_oracle| (Euclidean norm of the 3-vector difference, m/s²);
a_nc = |a_oracle| (non-central acceleration magnitude); ΔU = |U_kshana − U_oracle| (m²/s²).

| degree N | acceleration bar | potential bar (O1 only) |
|---|---|---|
| 70, 200, 360 | Δa ≤ 1e-12 m/s² **and** Δa ≤ 1e-10·a_nc | ΔU ≤ 1e-8 m²/s² |
| 2190 | Δa ≤ 1e-10 m/s² (1e-5 mGal) | ΔU ≤ 1e-7 m²/s² |

## Exclusions fixed in advance

* If an oracle returns a non-finite value at a point (expected possibility: exactly on the
  polar axis, P3 and P4, where an oracle may divide by `cos φ`), that point is recorded as
  **no oracle value** for that oracle. It is neither a pass nor a miss, and the claim for the
  exact pole then rests on the other oracle if it is finite there, else on the MODELLED pole
  continuity test only. The same applies to an oracle whose documented spherical components
  are undefined on the axis (O2 at P3 and P4: θ and φ unit vectors are undefined there; O2 is
  not evaluated at P3 and P4).
* No other point is dropped.

## What counts

* VALIDATED (for a degree): every point with an oracle value meets its bar against O1, and
  every point evaluated by O2 meets its bar against O2.
* Any miss: recorded in `RESULTS.md` with the numbers; the claim for that degree stays MODELLED.

## Diagnostics reported (no bar)

* The historical `acceleration` versus O1 at N = 2190 at P8 and P10 (expected to differ there
  because of sectoral underflow and the pole floor), to document why the new method exists.
* Evaluation time of `acceleration_hf` at N = 70, 200, 360, 2190.
