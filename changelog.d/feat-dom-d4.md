<!-- Proposed CHANGELOG lines for package D4 (JPL kernel ephemeris spine, phase 1), for the
     [Unreleased] section. Abbreviations: NAIF, the Navigation and Ancillary Information
     Facility; DAF, Double precision Array File; SPK, Spacecraft and Planet Kernel; PCK,
     Planetary Constants Kernel; JPL, Jet Propulsion Laboratory; DE440, JPL Development
     Ephemeris 440; TDB, barycentric dynamical time; LLR, lunar laser ranging; VLBI, very long
     baseline interferometry. Row counts depend on what the integrator applies from
     .fold/feat-dom-d4-rows.md (two promotions proposed outright, one a founder decision). -->

### Added

- **The NAIF kernel reader has its own validated row.** `naif_kernel` (DAF container, SPK type 2,
  binary PCK type 2) agrees with the SPICE Toolkit (CSPICE N0067) and with ANISE 0.10.6 on all
  600 DE440 states and 200 lunar-orientation rotations of a random grid drawn from the
  pre-registration commit's own hash, inside bars derived beforehand from double-precision
  Chebyshev evaluation (worst 0.6 % of the bar, 1.95e-3 m). The row claims that the engine reads
  JPL kernels correctly, not that DE440 or the analytic series is accurate
  (`tests/naif_reader_spice_oracle.rs`).
- **`ephem_provider::KernelEphemeris`**: DE440 (or any type-2 SPK) positions through the
  engine's own reader, with epochs as two-part TDB Julian dates (`jd2::Jd2`) and the kernel's
  SHA-256 kept for reports. It never substitutes a system barycentre for a planet.
  `LunisolarSource` lets a geometry path choose the analytic series (the default) or a kernel.
- **Opt-in kernel Moon for `lunar-llr-datum` and `lunar-vlbi-fim`**: a `planetary_kernel_path`
  key reads the geocentric Moon centre from the kernel; nothing else changes, and the report
  gains a `moon_ephemeris` block naming the kernel and its SHA-256. Without the key both
  reports are byte-identical to before.
- **Lunar-surface-point covariance on the kernel path** (new row, proposed VALIDATED): with
  every station fixed and the beacon on the DE440 Moon, the beacon covariance agrees with a
  SPICE light-time Jacobian (worst 1.7e-3 against a 1 % bar) and a NumPy inverse (4e-14 against
  1e-9) (`tests/lunar_vlbi_surface_point_spice_oracle.rs`). The analytic-path row stays
  MODELLED: on the analytic Moon its smallest beacon sigma is 3.9 % below the oracle.

- **The kernel-Moon LLR datum holds on fresh normal points** (new row, proposed VALIDATED): on
  447 unseen 2019 normal points the datum covariance agrees with the unchanged SPICE and NumPy
  oracle within 7.6e-5 against 1 % and 2 % bars (`tests/validate_llr_datum_kernel_moon_fresh.rs`).
- **Sun, Moon, Mercury and Venus positions from DE440 at UTC epochs** (new row, proposed
  VALIDATED): `KernelEphemeris::relative_position_utc` agrees with Skyfield 1.54 on 600 positions
  between 1973 and 2026, worst 2.96 m, inside a bar set by the two-term TDB − TT series
  (`tests/kernel_ephemeris_skyfield_oracle.rs`).

### Findings

- **The LLR datum miss is the analytic Moon.** The LLR datum comparison's one miss (z-translation
  sigma 1.025 % against a 1 % bar) falls to 0.049 % when only the Moon centre is read from DE440,
  with every other quantity inside its unchanged bar and the observed-minus-computed residual
  falling from 156,494 m to 95 m (`tests/validate_llr_datum_kernel_moon.rs`). This was a
  diagnostic re-run on oracle values and normal points already seen, and it is disclosed as
  such; promotion rests on the fresh-data run above.
- **On fresh 2019 normal points the analytic Moon also passes the LLR datum bars** (worst
  3.8e-3, information only), so the 2015 miss was marginal to that quarter's geometry, and a
  one-hour error in the Moon's epoch is not detected by this comparison. The analytic default row
  stays MODELLED until its own pre-registered fresh-data run.

### Changed

- `lunar_ephemeris` no longer says the engine has no binary-kernel reader; it points at the
  reader row and explains why spacecraft kernels (types 13 and 21) still come through Horizons.

### Revisions

- None. No golden file, published figure or existing test value changes: the analytic
  `lunar-llr-datum`, `lunar-vlbi-fim` and `lunar-vlbi-fim` all-stations-fixed reports were
  compared byte for byte with `main` (result SHA-256 prefixes 9927aac2, cf1d2671, 25c357e4,
  unchanged).
