# high_degree_gravity fixtures

Oracle tables for `tests/gravity_sh_high_degree.rs` (bars: `xval/high-degree-gravity/PREREGISTRATION.md`;
results: `xval/high-degree-gravity/RESULTS.md`).

| file | what | produced by |
|---|---|---|
| `points.txt` | the ten pre-registered Earth-fixed points (id, latitude, longitude, radius, x, y, z) | `generate_high_degree_gravity_reference.py` |
| `orekit_egm2008.txt` | non-central EGM2008 acceleration (m/s²) and potential (m²/s²) at N = 70, 200, 360, 2190 | Orekit 12.2 (Apache-2.0) `HolmesFeatherstoneAttractionModel`, driver `java/HdGravDriver.java` |
| `pyshtools_egm2008.txt` | non-central EGM2008 acceleration (m/s²) at the same N, off-axis points | pyshtools 4.14.1 (BSD-3-Clause) `gravmag.MakeGravGridPoint` |

Only derived numbers (a few kB) are committed; no third-party code or data is vendored.

## Input data

EGM2008 (NGA; Pavlis et al., *J. Geophys. Res.* 117, B04406, 2012), released by NGA for public
use, distributed by ICGEM (GFZ; Ince et al., *Earth Syst. Sci. Data* 11, 647–674, 2019):

* URL: `https://icgem.gfz.de/getmodel/gfc/c50128797a9cb62e936337c890e4425f03f0461d7329b09a8cc8561504465340/EGM2008.gfc`
* 252 140 870 bytes, SHA-256 `ab5b524da073e63b5bdceb7ca47a0de07a26dd44a1c5798f39fc98dc80af70fd`
* not committed; `scripts/fetch_egm2008.sh` fetches and checks it.
* The generator asserts that the full model's degree-70 truncation equals the committed
  `tools/egm2008_to70.gfc`, which the always-on N = 70 test reads.

## Regenerate

```
OREKIT_CP=<orekit-12.2 + hipparchus-3.1 jars> OREKIT_DATA=<orekit-data> \
python -I tests/fixtures/high_degree_gravity/generate_high_degree_gravity_reference.py \
    --full realdata-cache/egm2008/EGM2008.gfc
```

(Java 21; Python venv with numpy 2.3.5 and pyshtools 4.14.1.)

## 24 h orbit reference (for the propagator's tesseral path)

`orekit_orbit_24h_egm2008_200.txt`: Orekit 12.2 `NumericalPropagator` (DormandPrince853, position
tolerance 1e-6 m) with point mass + `HolmesFeatherstoneAttractionModel` at 200×200 EGM2008, body
frame = rotation about the inertial z axis by the Earth Rotation Angle with UT1 = TT (no
precession, nutation or polar motion), epoch 2024-01-01T12:00:00 TT, r0 = (6778136.3, 0, 0) m,
v0 = (0, 4766, 6008) m/s; inertial states every 600 s for 24 h. Driver `java/Orbit24hDriver.java`,
generator `generate_orbit_24h_reference.py`. No Kshana comparison is made here: the propagator
test that consumes it must pre-register its own bar first.
