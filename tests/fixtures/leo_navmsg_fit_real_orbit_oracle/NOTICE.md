# Real-orbit fixture for `tests/leo_navmsg_fit_real_orbit_oracle.rs`

## Orbits

Four days of the TU Graz Institute of Geodesy (IfG, ITSG) operational reduced-dynamic orbits,
10 s sampling, both midnights included, converted from the celestial reference frame to ITRF by
`gen_fixture.py` (positions to 1 mm, velocities to 1 mm/s). Retrieved 2026-10-01 from
https://ftp.tugraz.at/pub/ITSG/satelliteOrbitProducts/operational/.

| Fixture | Source file | SHA-256 of the source file |
|---|---|---|
| `grace_a_2017-06-01.csv` | `GRACE-1/reducedDynamicOrbit/2017/GRACE-1_reducedDynamicOrbit_2017-06-01.txt.gz` | `dba924da6507f383107829313750067fbb1407822f3e41a13242ddf573a0d673` |
| `grace_c_2024-01-01.csv` | `GRACEFO-1/reducedDynamicOrbit/2024/GRACEFO-1_reducedDynamicOrbit_2024-01-01.txt.gz` | `8f744cfcc0e5a5e703c4e796f08548682003c3c6c49e149f4efc8546e6a95538` |
| `sentinel_2a_2024-01-01.csv` | `Sentinel-2A/reducedDynamicOrbit/2024/Sentinel-2A_reducedDynamicOrbit_2024-01-01.txt.gz` | `f186d694f7d7512a283e591543625bb9416db390a88492ecc23d6bf9cb8edddd` |
| `sentinel_6a_2024-01-01.csv` | `Sentinel-6A/reducedDynamicOrbit/2024/Sentinel-6A_reducedDynamicOrbit_2024-01-01.txt.gz` | `ab1ed10c0a03bfa317d96dddddd6cc907c89b65f584e180919226b8e6fbd65cd` |

Terms (the server's README): "Access is granted without any registration and free of charge.
All provided products can be used for scientific research or any other application." An
acknowledgment is requested. Acknowledgment: orbit products of the Institute of Geodesy, Graz
University of Technology, processed with GROOPS; Suesser-Rechberger, B., Krauss, S., Strasser,
S., and Mayer-Guerr, T. (2022), "Improved precise kinematic LEO orbits based on the raw
observation approach", Advances in Space Research 69(10), 3559-3570,
doi 10.1016/j.asr.2022.03.014.

The server README was revised on 2025-10-16; the paper accessed the same directory on
2025-05-13, so a reprocessing between the two dates cannot be excluded.

## Earth orientation used in the conversion

IERS finals2000A.all (Bulletin A polar motion and UT1-UTC), the frozen copy of 2026-09-30,
SHA-256 `cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18`, IERS data, free
use with acknowledgment of the IERS. Rotation by pyerfa 2.0.1.5 (`c2t06a`, IAU 2006/2000A,
BSD-3-Clause), run as a tool, not linked.

## Published values in the test

Liu, Su, Xie, Zhou and Qu (2025), "Study on the Design of Broadcast
Ephemeris Parameters for Low Earth Orbit Satellites", Remote Sensing 17(16):2894,
doi 10.3390/rs17162894, CC BY 4.0: Tables 2, 4, 5, 6 and 8 (numbers cited in the test, with
attribution).

## Regenerate

```sh
source ~/Code/kshana-oracles/env.sh
$ORACLE_PY tests/fixtures/leo_navmsg_fit_real_orbit_oracle/gen_fixture.py <dir with the four .txt.gz> <finals2000A.all>
```
