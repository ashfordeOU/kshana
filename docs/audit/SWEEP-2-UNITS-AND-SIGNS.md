<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Sweep 2: units and signs

A read-only sweep of the engine at `open/integration-2026-11-20d` @ 3f493675d, made on 2026-11-21.
It covers:

- **Power and frequency units:** dB and linear, dBW, dBm and dB-Hz, Hz and rad/s, the
  free-space loss, Doppler and carrier-phase signs.
- **Time, angle and sign conventions:** ns and s, deg and rad, semicircles, ENU and NED,
  `A − B` offsets, and fields whose unit is implied by their name.

Each finding was checked against the definitions:

- `x_dB = 10·log10(x)` for powers, 20 for amplitudes;
- powers add in linear;
- FSPL = `20·log10(4πdf/c)`;
- `f_D = −(f/c)·ρ̇`;
- RFC 5905 θ is the server relative to the local clock;
- ITU-R TF.1153 gives the TWSTFT Sagnac term.

Real bugs are fixed on their own branches, each with a test and a CHANGELOG line naming the
affected outputs. The other rows are documentation or assertion gaps; their doc comments are
corrected on `open/audit-2`.

## Findings

| # | Location | What | Assumed | Enforced? | Risk | Disposition |
|---|---|---|---|---|---|---|
| 1 | `src/monitor_network.rs` `free_space_path_loss_db`, `spoof_power_at_monitor` | `20·log10(range)` subtracted from a field documented as EIRP; the `20·log10(4πf/c)` term was missing | EIRP = power at 1 m | no | received spoof power, AGC excess and `P_d` overstated by about 40 dB (2492 MHz) | **bug**, fixed on `open/fix-monitor-network-fspl` |
| 2 | `src/time_server.rs` `health_ntpd` | ntpd `offset` (RFC 5905 θ, positive when the system clock is slow) stored in `Health.offset_s` beside chrony's system − NTP (positive when fast) | one convention | no | the health offset of the two daemons had opposite signs | **bug**, fixed on `open/fix-time-server-offset-sign` |
| 3 | `src/ccsds_tdm.rs` `to_radiometric_obs` | `RANGE` scaled by 1000 whatever `RANGE_UNITS` (s, RU, absent = RU); `DOPPLER_*` km/s range rates (positive receding) tagged as the Hz Doppler observable (negative receding) | km; range rate = Doppler | no | wrong range values for `s`/`RU`; Doppler in the wrong unit and sign (only tests call the bridge today) | **bug**, fixed on `open/fix-tdm-radiometric-units` |
| 4 | `src/timetransfer_adv.rs` `twstft_sagnac`, `twstft_sagnac_bipm` | the TWSTFT Sagnac term closed the triangle A, S, B (a B → A ground leg) | triangle | no | tens of ns in the reported `sagnac_s` and `bipm_sagnac_s` (the recovered offset cancelled) | **bug**, fixed on `open/fix-twstft-sagnac` |
| 5 | `src/spoof_detect.rs` `measured_dbm` | the attack's measured power is `floor + power_advantage_db`; read as the spoofer's own power over the floor, the incoherent total would be `floor + 10·log10(1 + 10^(adv/10))` (4.76 dB at adv = 3 dB) | the advantage is the total excess | documented in the field definition | a different reading of "power advantage" gives a 1.8 dB larger excess at 3 dB | gap: the definition is stated; noted here |
| 6 | `src/spoof_monitors.rs` `AgcMonitor::expected_dbm` with `spoof_detect`, `monitor_network` | documented as thermal noise plus the satellites; callers pass the satellites alone (8 × −130 dBm ≈ −121 dBm, below about −111 dBm of thermal noise in 2 MHz) | no thermal noise | no | the AGC excess is measured over the satellite floor, larger than over the real floor | doc corrected (`open/audit-2`) |
| 7 | `src/lunar_landing.rs` `sigma_th` (used by `lunar_ascent`) | the Gabor ranging bound without the integration time | T = 1 s | no | the AFS ranging sigma does not follow the AFS update interval | doc corrected (`open/audit-2`) |
| 8 | `src/twstft_budget.rs` | `TI(A)`/`TI(B)` labelled opposite to ITU-R TF.1153's equation | the module's own labelling | self-consistent | imported laboratory readings with TF.1153 labels would flip sign | doc corrected (`open/audit-2`) |
| 9 | `src/rinex.rs` `BDT_MINUS_GPS_S = 14.0` | the name says BDT − GPS; the value is GPS − BDT | n/a | every use is correct | a future sign error | doc corrected (`open/audit-2`) |
| 10 | `src/frame_eop.rs` `HorizonError` for polar motion | `rms_s` carries arc seconds for the PM curve; `rms_ms()` and `rms_position_m()` assume seconds of UT1 | callers know | documented at the producer | reuse hazard; no current caller mixes them | documented, noted here |
| 11 | `src/m5_hybrid.rs` (ground power reports) | an average of dBW values (a mean of logarithms) | as pre-registered | not stated | about 1 dB from a linear mean for spread reports | gap: check against the pre-registration |
| 12 | `src/spectrum.rs` `peak_db`, `src/sil_obs.rs` `amp` | names say dB or amplitude; the values are a linear maximum and a power factor | n/a | values correct | readability only | noted |

## Checked and correct (selection)

- **Noise floor.** `k·T`: −228.6 dBW/K/Hz (`linkbudget.rs`, `contact_schedule.rs`,
  `earth_gnss_lunar.rs`, `leo_link`, `jamming.rs`, `spectrum.rs`).
- **Free-space loss.** `20·log10(4πdf/c)` in metres and Hz (`linkbudget.rs`, `contact_schedule.rs`,
  `jamming.rs`, `antenna_cal.rs`, `ssv`, `space_geoloc.rs`, `claim_check.rs`, `m5_hybrid.rs`).
- **dBm and dBW.** The 30 dB step.
- **Powers summed in linear.** `spoof_monitors.rs`, `spectrum.rs` (multi-jammer),
  `interference_env.rs`, `leo_link/itu.rs`, `antenna.rs`.
- **Amplitude against power.** 20 against 10 throughout.
- **Doppler.** `−ṙ/λ` with an approaching satellite positive (`radiometric.rs`, `ephemeris.rs`,
  `sil_obs.rs`, `gnss_sim.rs`, `leo_link`, `iq/scene`).
- **Hz and rad/s.** The tracking loops.
- **Light-speed products** with ×1e-9.
- **SP3, OEM and CDM unit conversions.**
- **The pseudorange clock sign.** `ρ = r + b − c·dt_sv`.
- **TGD, F_rel and the GLONASS clock.**
- **Semicircles.** GPS LNAV and Klobuchar.
- **Angles.** Azimuth `atan2(E, N)` and the NED yaw.
- **GeoJSON.** `[lon, lat]`.
- **Heights.** Ellipsoidal heights from the geoid separation.
- **Timing units.** PTP scaled nanoseconds and the chrony unit suffixes.
- **TWSTFT budget.** The Sagnac term `½(s_ab − s_ba)`.
