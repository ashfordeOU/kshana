<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# STUDIO-15 (release 0.36) — every transcendental routed through portable maths, and every published value it moved

**Programme rule R4:** a changed published number is a revision, never a silent correction.
This file is that revision. It is written and committed **before** anything is re-recorded:
no golden, pinned hash, frozen file, fixture, paper data file or ledger number changes in the
commit that adds it. Every value below is stated old -> new with the file that pins or
publishes it.

**Abbreviations.** ULP: unit in the last place of a 64-bit float. FNV: the 64-bit FNV-1a
hash the pins use. Host maths: the C library (or Rust standard library) `sin`, `exp`, `ln` and
the like the engine called until now. Portable maths: the pure-Rust `libm` crate through
`PortableFloat` (`src/portable_math.rs`). VLBI: very long baseline interferometry.

## 1. What changed in the engine, and why

Until 0.36 an `f64` transcendental (`sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2`,
`sinh`, `cosh`, `asinh`, `exp`, `exp_m1`, `ln`, `ln_1p`, `log2`, `log10`, `powf`, `powi`,
`hypot`, `cbrt`) called the host library, which differs from `wasm32`'s in the last bit. The
same scenario therefore gave different bytes natively and in the browser (an acquisition
statistic of `228.05711797612463` on wasm against `228.0571179761247` natively). STUDIO-15
removes the difference by routing every such call in `src/` through `PortableFloat`
(`psin`, `pcos`, ..., all computed by `libm`), including:

* the mechanical rewrite of about 2,290 call sites in 236 files, plus the path form
  `f64::log10` in `body_pnt.rs`;
* the `*_with::<Platform>` wrappers of `forces`, `gnss_sim` (Klobuchar) and `gravity_sh`,
  which kept the host maths so that their pins did not move, now use `Portable`
  (`Platform` stays as the historical reference, dead in the library);
* `rand_distr`'s `Normal`, `StandardNormal`, `Gamma` and `Exp1` samplers, whose rare tail,
  wedge and rejection branches call the host `exp` and `ln`, replaced by a line-for-line
  port (`src/portable_distr.rs`; the ziggurat tables are copied unchanged). The stream of
  uniform draws is unchanged: the unit test compares 400,000 normal deviates with
  `rand_distr`'s (largest relative difference below 1e-13, a few hundred deviates differing
  in the last place) and the gamma deviates for four shapes.

**The reason, and the only justification offered:** with these changes the native engine and
the `wasm32` engine return **byte-identical result JSON for all 141 bundled scenarios**, and
the short IQ run (`iq_run_short`) is byte-identical to the native result. Measured with
`scripts/studio15_rebaseline_table.py`'s inputs: `web/pkg` built with `wasm-pack build
--target web --release`, every `get_example` scenario run through `run(toml)`, compared
with the native `kshana::api::run_toml` JSON as strings.

No tolerance, bar, threshold or pre-registered acceptance value is changed by this record.

## 2. The named baseline: "0.36 portable"

"0.36 portable" is the output of the portable-maths engine, byte-identical on native and
`wasm32`. It is the baseline the byte-identity and pin guards compare against from 0.36 on.
The 0.35.0 baselines stay in the tree, labelled historical, as the record of what 0.35.0
released; the guards named in section 6 are re-based to "0.36 portable" in the commit that
re-records, never deleted or ignored.

## 3. Method

The old values come from the unmodified tip of `feat/wasm-iq-0.36` (`b482fb33`, host
maths) built in a separate worktree; the new values from this branch. Both ran the 141
scenarios bundled with the crate through `kshana::api::run_toml` in release builds. Every
old/new pair is a leaf of the result JSON. The full list is
[`STUDIO15-moved-values.csv.gz`](STUDIO15-moved-values.csv.gz) (scenario, JSON path, old,
new, relative change; 136,127 numbers and the changed strings); regenerate everything below
with

    python3 scripts/studio15_rebaseline_table.py --old <old dir> --new <new dir> \
        --logs <test logs> --repo . --pred <prediction dir> --csv-gz docs/revisions/STUDIO15-moved-values.csv.gz

The test values come from a full run of the suite on this branch (every test binary, plus
the doctests). Tests that stop at their first failed assertion can hide later ones; section
5 says so where it applies.

## 4. Bundled scenarios

scenarios 141; byte-identical 43; moved 98; moved numbers 136127; largest-change above 1e-12/1e-9/1e-6/1e-3: 43/30/18/5; Studio recorded file equals new output for 71 of the moved, old for 1, neither for 17, absent for 9

Relative change is `|old - new| / max(|old|, |new|)` per number. The table lists, for each
moved scenario, its largest move; the rest are in the CSV. A "digest strings" count is the
number of `*sha256*` / `*digest*` strings in the document that changed because a member
result changed. "Studio recorded file" says what the committed
`web/studio/recorded/<scenario>.json` holds: `new` means the recorded Studio output (made
in the browser, that is on `wasm32`) already equals the portable-maths output, so this
change brings the native engine to what the Studio already shows.

| scenario | numbers moved / numeric leaves | largest relative change | field | old | new | digest strings | Studio recorded file |
|---|---|---|---|---|---|---|---|
| `cislunar-observability` | 84 / 391 | 1.00e+00 | `$.rank_vs_arc[2].sigma_min` | 0.0 | 1.1397424284626417e-09 | 0 | new |
| `lunar-joint-od-clock` | 17 / 32 | 6.00e-01 | `$.without_vlbi.iterations` | 2 | 5 | 0 | new |
| `cislunar-arc-recovery` | 85 / 281 | 3.54e-01 | `$.recovery_vs_arc[15].noise_free_worst_ratio` | 4.480011700520551e-06 | 2.895935371940075e-06 | 0 | new |
| `europa-surface-pnt` | 557 / 1286 | 8.13e-03 | `$.fom.availability_with_earth` | 0.7192982456140351 | 0.7134502923976608 | 0 | new |
| `mars-pnt-lmo` | 484 / 849 | 4.43e-03 | `$.estimation[9].pos_error_3d_m` | 2.702363421057842 | 2.6903988712018254 | 0 | neither |
| `mars-pnt-transfer` | 964 / 1689 | 9.90e-04 | `$.estimation[6].pos_error_3d_m` | 0.7002296620380407 | 0.6995363125065862 | 0 | neither |
| `mars-orbit-pnt` | 1469 / 2990 | 8.33e-04 | `$.epochs[0].error_with_earth_m` | 0.6085216244112881 | 0.6080146642007556 | 0 | new |
| `leo-resilience-spoof-doppler` | 70682 / 126615 | 4.86e-04 | `$.spoof.series[19].cross_band_ratio` | 8.775226898579977e-12 | 8.770960867029894e-12 | 0 | new |
| `xona-pulsar-end-to-end` | 657 / 1566 | 3.77e-04 | `$.navmsg.sisre_orbit_rms_m` | 5.264056089005623e-06 | 5.262071791452084e-06 | 0 | new |
| `leo-pnt-end-to-end` | 1056 / 1398 | 2.88e-04 | `$.navmsg.sisre_orbit_rms_m` | 5.260563880665675e-06 | 5.262076999399118e-06 | 0 | new |
| `leo-pass-xona-pulsar` | 18177 / 39530 | 3.11e-05 | `$.satellites[2].doppler_check.max_range_rate_diff_m_s` | 7.49740479477623e-05 | 7.497171873183106e-05 | 0 | new |
| `leo-pass-iridium` | 4307 / 9399 | 2.75e-05 | `$.satellites[0].doppler_check.max_range_rate_diff_m_s` | 0.00017049394500645576 | 0.00017049863936335896 | 0 | new |
| `mars-pnt-surface` | 964 / 1689 | 2.57e-05 | `$.estimation[56].pos_error_3d_m` | 1.9891800528404295 | 1.9891289425285392 | 0 | neither |
| `leo-indoor-uhf` | 5286 / 13812 | 2.32e-05 | `$.satellites[0].doppler_check.max_range_rate_diff_m_s` | 0.00035034456232097 | 0.0003503527054817823 | 0 | new |
| `leo-pass-vs-gnss-cn0` | 3368 / 22229 | 2.13e-05 | `$.satellites[0].doppler_check.max_range_rate_diff_m_s` | 0.0004380671507533407 | 0.00043805783752759453 | 0 | new |
| `oem-interop` | 1 / 10 | 7.45e-06 | `$.round_trip_max_pos_error_km` | 4.88220393890515e-07 | 4.882240318693221e-07 | 0 | new |
| `lunar-vlbi-fim` | 82 / 574 | 7.37e-06 | `$.free_network.eigenvalues_per_m2[0]` | 1.6238027507040124e-07 | 1.6237907810325386e-07 | 0 | new |
| `leo-ppp-convergence` | 315 / 596 | 3.48e-06 | `$.cases[1].median_vertical_error_m[28]` | 0.012873209234462064 | 0.012873164469499302 | 0 | new |
| `lunar-station-coverage-public-sources` | 2378 / 5970 | 2.28e-07 | `$.points[101].corrected_p_h_m` | 2656.6678432854123 | 2656.667237365753 | 0 | absent |
| `leo-vertical-autonomous-vehicle-skyline` | 530 / 1277 | 1.75e-07 | `$.timeline.channels.gnss_error_m.values[27]` | 0.21967471033452451 | 0.21967467183012115 | 5 | absent |
| `leo-vertical-autonomous-vehicle` | 442 / 1069 | 1.75e-07 | `$.timeline.channels.gnss_error_m.values[87]` | 0.21967471033452451 | 0.21967467183012115 | 5 | new |
| `lunar-relay-constellation` | 8 / 7079 | 1.27e-07 | `$.grid.mean_pdop[6][10]` | 790.4959 | 790.4958 | 0 | new |
| `leo-vertical-polar-arctic` | 740 / 1645 | 2.70e-08 | `$.timeline.channels.position_error_m.values[128]` | 0.1775170752144035 | 0.17751708001503191 | 7 | new |
| `gnss-sim-container-terminal-skyline` | 1125 / 4393 | 2.42e-08 | `$.gnss_measurements[32].measurements[0].doppler_hz` | -1.6193825266564328 | -1.619382565809498 | 0 | absent |
| `leo-pvt-fjord-skyline` | 308 / 661 | 1.85e-08 | `$.joint.epochs[42].error_fused_m` | 0.04472696287602367 | 0.044726963703787696 | 0 | absent |
| `meo-leo-fused-pvt` | 319 / 599 | 1.31e-08 | `$.joint.epochs[1].error_fused_m` | 0.06912219457640556 | 0.0691221954829415 | 0 | new |
| `lunar-station-coverage` | 2413 / 6049 | 9.14e-09 | `$.points[87].corrected_p_v_m` | 20.996918670619678 | 20.99691886256057 | 0 | absent |
| `pvt-abmf` | 32 / 46 | 1.95e-09 | `$.epochs[2].fix.error_h_m` | 1.0682319891558478 | 1.0682319870775148 | 0 | new |
| `leo-focus-fused-pnt-sisre` | 31 / 46 | 1.48e-09 | `$.sweep.nodes[0].metrics.fused_rms_3d` | 0.08204639049017955 | 0.0820463903685009 | 1 | new |
| `l-band-waterfall-jamming` | 13 / 10287 | 1.17e-09 | `$.bands[1].psd_peak_offset_hz` | 758551.5290518831 | 758551.5299415637 | 0 | neither |
| `leo-focus-science-iono-sounding` | 1301 / 12771 | 9.19e-10 | `$.satellites[0].doppler_check.max_range_accel_diff_m_s2` | 0.009894347793691693 | 0.009894347784596746 | 0 | new |
| `ntn-5g-positioning` | 8 / 33 | 8.03e-10 | `$.doppler_pass.horizontal_error_m` | 1.8721975585705672 | 1.8721975570663023 | 0 | new |
| `gnss-sim-raim` | 678 / 4718 | 5.13e-10 | `$.gnss_measurements[57].measurements[0].doppler_hz` | -38.17004124188075 | -38.17004122230422 | 0 | new |
| `realtime-frame-eop` | 38 / 1739 | 4.98e-10 | `$.table5_operational_vs_persistence.rows[1].ut1.operational.max_native` | 0.0010554828949023726 | 0.0010554828954281743 | 0 | new |
| `lunar-differential-pnt` | 30 / 64 | 2.86e-10 | `$.correction_link.survey_transfer` | 1.732066565889224 | 1.73206656539433 | 0 | new |
| `starlink-sop-doppler-positioning` | 21 / 62 | 1.85e-10 | `$.doppler.windows[1].error_3d_m` | 3.0634798815213196 | 3.0634798809560255 | 0 | new |
| `leo-doppler-positioning` | 41 / 118 | 5.99e-11 | `$.doppler.envelopes[0].in_run.max_doppler_jerk_hz_s2` | 0.9686167496336334 | 0.9686167495756286 | 0 | new |
| `leo-focus-ntn-bandwidth` | 9 / 49 | 5.56e-11 | `$.sweep.nodes[8].metrics.toa_rms_error_3d` | 2.145678313503106 | 2.145678313383734 | 1 | new |
| `terrain-slam` | 58 / 248 | 1.77e-11 | `$.epochs[3].matched_m` | 87.34711370238567 | 87.34711370393119 | 0 | new |
| `moonlight-service-volume` | 7 / 20 | 1.07e-11 | `$.pdop_max` | 180.3039336776973 | 180.303933679625 | 0 | new |
| `hybrid-optical-rf` | 22 / 593 | 4.41e-12 | `$.fault_injection.axes[0].detection_power_curve[1].p_detect` | 5.037107257988005e-05 | 5.0371072579658005e-05 | 0 | new |
| `leo-iot-energy` | 2800 / 10695 | 3.46e-12 | `$.satellites[0].series[173].range_accel_m_s2` | 0.00144160127211073 | 0.0014416012721057434 | 0 | new |
| `integrity-raim` | 1322 / 2171 | 1.21e-12 | `$.epochs[180].hpl_m` | 178.1698244388117 | 178.16982443902725 | 0 | new |
| `gps-denied-gravity-nav` | 1 / 3 | 7.25e-13 | `$.map_matched_error_m` | 144.27245221227884 | 144.27245221238343 | 0 | new |
| `combined-altpnt` | 4 / 5 | 4.30e-13 | `$.magnetic_only_m` | 782.4300085013367 | 782.4300085010005 | 0 | new |
| `ephemeris` | 2937 / 14544 | 3.36e-13 | `$.samples[242].teme_r_m[0]` | 7864.042751008399 | 7864.04275101104 | 0 | new |
| `orbit-urban-canyon-skyline` | 20 / 2163 | 2.16e-13 | `$.geometry.median_pdop` | 70.53183654455994 | 70.53183654457517 | 0 | absent |
| `campaign-jam-spoof-holdover-integrity` | 214 / 4068 | 1.67e-13 | `$.timeline.channels.protection_level_m.values[349]` | 94.79740616924248 | 94.79740616922665 | 14 | neither |
| `terrain-nav` | 1 / 3 | 1.61e-13 | `$.matched_error_m` | 52.66537528251845 | 52.665375282526924 | 0 | new |
| `solar-system-tour` | 1258 / 9741 | 1.16e-13 | `$.bodies[14].track_m[23][1]` | -1171366.318269885 | -1171366.3182697492 | 0 | neither |
| `orbit-molniya` | 137 / 2666 | 4.60e-14 | `$.eci_track[175][0]` | 891.8464053315282 | 891.8464053315693 | 0 | new |
| `leo-resilience-gnss-jammed-leo-carries` | 69 / 655 | 4.21e-14 | `$.timeline.channels.protection_level_m.values[32]` | 87.14404026333358 | 87.14404026333725 | 4 | new |
| `orbit-real-tle` | 39 / 2666 | 3.76e-14 | `$.geometry.median_pdop` | 68.8179285279733 | 68.81792852797071 | 0 | new |
| `lunar-beacon` | 22 / 38 | 2.65e-14 | `$.rows[0].accuracy.time_m` | 7.505822686995457 | 7.505822686995258 | 0 | new |
| `lunar-vlbi` | 1 / 74 | 1.62e-14 | `$.series[6].near_field_correction_us` | -53.423617263768236 | -53.42361726376737 | 0 | new |
| `lunar-jamming` | 66 / 566 | 1.41e-14 | `$.links[8].rx_gain_toward_sat_dbi` | 0.06310393574900441 | 0.06310393574900353 | 0 | neither |
| `tracking-loop` | 5 / 271 | 1.32e-14 | `$.jitter_table[6].log10_mean_time_to_cycle_slip_s` | 0.03360095795439699 | 0.03360095795439744 | 0 | neither |
| `integrity-harbour-approach` | 206 / 731 | 1.29e-14 | `$.epochs[139].vpl_m` | 28.167292820617703 | 28.167292820618066 | 0 | absent |
| `leo-focus-indoor-uhf` | 4 / 26 | 1.26e-14 | `$.compose.members.thermally-efficient-building.metrics.s_peak_cn0` | 2.254749087642807 | 2.2547490876427787 | 3 | new |
| `lunanet-araim` | 28 / 78 | 1.17e-14 | `$.pass[16].vpl_m` | 719.0656875607174 | 719.065687560709 | 0 | new |
| `earth-gnss-lunar` | 6 / 333 | 9.38e-15 | `$.links[21].cn0_dbhz` | 6.061339401030693 | 6.0613394010306365 | 0 | new |
| `polar-arctic-leo-coverage` | 49 / 171 | 8.86e-15 | `$.polar.rows[6].leo.median_vdop` | 18.036093728033276 | 18.036093728033435 | 0 | new |
| `spoof-meaconing` | 58 / 7231 | 6.27e-15 | `$.quantum.series[572].offset_ns` | 0.14170199417048845 | 0.14170199417048757 | 0 | new |
| `jamming-harbour-approach-skyline` | 1422 / 16290 | 4.41e-15 | `$.epochs[207].sats[5].el_deg` | 6.044787233300387 | 6.044787233300414 | 0 | absent |
| `campaign-spectrum-holdover-integrity` | 221 / 7018 | 3.96e-15 | `$.timeline.channels.protection_level_m.values[760]` | 17.029653190789276 | 17.029653190789343 | 7 | neither |
| `araim-gps-galileo` | 165 / 585 | 3.95e-15 | `$.epochs[7].vpl_m` | 13.50592630833005 | 13.505926308330103 | 0 | new |
| `jamming-demo` | 106 / 2468 | 3.64e-15 | `$.epochs[2].sats[6].cn0_effective_dbhz` | -9.766679185342772 | -9.766679185342808 | 0 | neither |
| `leo-vertical-rail-maritime` | 116 / 1470 | 2.44e-15 | `$.timeline.channels.leo_cn0_c_dbhz.values[77]` | 23.26255306657572 | 23.262553066575776 | 4 | neither |
| `maritime-strait-jamming` | 217 / 2603 | 2.44e-15 | `$.epochs[36].sats[1].cn0_effective_dbhz` | 14.564730536679736 | 14.564730536679772 | 0 | neither |
| `passes` | 2 / 38 | 1.76e-15 | `$.passes[4].max_elevation_deg` | 14.090887032309343 | 14.090887032309318 | 0 | new |
| `leo-vertical-asset-tracking-iot` | 54 / 738 | 1.72e-15 | `$.timeline.channels.uhf_cn0_dbhz.values[110]` | 33.133809973829045 | 33.13380997382899 | 4 | new |
| `telecom-prtc-holdover-24h` | 19 / 167 | 8.73e-16 | `$.tdev[3].tdev_ns` | 0.09540946549946842 | 0.09540946549946834 | 1 | new |
| `gravity-map-nav` | 1 / 3 | 8.46e-16 | `$.map_matched_error_m` | 1881.7905683362708 | 1881.7905683362692 | 0 | new |
| `leo-timing-utc` | 5158 / 103888 | 8.30e-16 | `$.timing.rows[3].series[88].sigma_ns` | 21.393082713761476 | 21.393082713761494 | 0 | new |
| `lunar-attack-surface` | 21 / 413 | 7.73e-16 | `$.footprint_sweep.points[9].limb_js_db` | -36.772612300570785 | -36.77261230057081 | 0 | neither |
| `orbit-sgp4-gps` | 39 / 2666 | 6.22e-16 | `$.geometry.best_pdop` | 1.0713624151805556 | 1.0713624151805563 | 0 | new |
| `orbit-multignss` | 32 / 7368 | 6.00e-16 | `$.geometry.median_pdop` | 2.221312052813401 | 2.2213120528134023 | 0 | new |
| `orbit-rinex` | 37 / 2666 | 4.70e-16 | `$.eci_track[18][1]` | 2900.461081447981 | 2900.4610814479825 | 0 | new |
| `leo-band-trade` | 56 / 3050 | 3.94e-16 | `$.signals[4].tracking.jitter_m[0][4]` | 0.013221019438452254 | 0.01322101943845226 | 0 | new |
| `orbit-gnss-challenged` | 32 / 7371 | 3.68e-16 | `$.geometry.median_pdop` | 4.830748854053885 | 4.830748854053883 | 0 | neither |
| `multi-band-jamming-waterfall` | 5 / 26154 | 3.67e-16 | `$.jammers[4].per_band[1].q` | 20287447.79864824 | 20287447.79864823 | 0 | neither |
| `xona-pulsar-signals` | 19 / 1245 | 2.83e-16 | `$.signals[1].tracking.jitter_m[3][1]` | 0.19590750284424235 | 0.1959075028442423 | 0 | new |
| `spoof-detect` | 1 / 13 | 2.75e-16 | `$.decision.raim.statistic` | 103.4899129218974 | 103.48991292189737 | 0 | new |
| `lunar-station-time-lab` | 18 / 906 | 2.31e-16 | `$.terms[0].x_s[3]` | 2.730922272193884e-14 | 2.7309222721938847e-14 | 0 | absent |
| `lunar-time-budget` | 12 / 536 | 2.31e-16 | `$.terms[0].x_s[3]` | 2.730922272193884e-14 | 2.7309222721938847e-14 | 0 | new |
| `leo-resilience-js-margin` | 12 / 8330 | 2.07e-16 | `$.jammers[7].per_band[0].cn0_effective_dbhz` | 8.563351331016763 | 8.563351331016765 | 0 | new |
| `leo-vertical-critical-infrastructure-timing` | 2 / 2041 | 1.85e-16 | `$.timeline.channels.leo_time_sigma_ns.values[251]` | 9.58887783835947 | 9.588877838359473 | 3 | new |
| `lunar-frame-campaign` | 1 / 197 | 1.64e-16 | `$.campaign.sub_earth_direction_mcmf_unit[1]` | -0.010564569588676399 | -0.010564569588676397 | 0 | new |
| `sweep-clock-stability` | 3 / 75 | 1.52e-16 | `$.points[22].value` | 3.1622776601683767e-19 | 3.162277660168376e-19 | 0 | new |
| `reentry` | 1 / 16 | 1.38e-16 | `$.velocity_at_peak_heating_m_s` | 6602.55745414679 | 6602.5574541467895 | 0 | old |
| `leo-resilience-multiband-diversity` | 1 / 121 | 1.19e-16 | `$.sweep.nodes[12].metrics.cn0_gps_l5` | -0.46648031525448913 | -0.4664803152544892 | 1 | new |
| `campaign-monte-carlo-clock-holdover` | 0 / 420 | n/a | digests only | | | 1 | new |
| `campaign-shared-jammer-sea-road` | 0 / 24 | n/a | digests only | | | 3 | neither |
| `campaign-sweep-jammer-power` | 0 / 69 | n/a | digests only | | | 1 | neither |
| `leo-focus-iot-eirp` | 0 / 58 | n/a | digests only | | | 1 | new |
| `leo-focus-ppp-altitude` | 0 / 19 | n/a | digests only | | | 1 | new |
| `leo-resilience-spoof-monitors` | 0 / 23 | n/a | digests only | | | 5 | new |
| `leo-vertical-5g-network-timing` | 0 / 1456 | n/a | digests only | | | 3 | new |

**Unchanged (byte-identical old and new):** `aperture-duty-cycle`, `araim-reference-check`, `attitude-budget`, `automotive-urban-canyon`, `clock-ensemble`, `clock-holdover-labsr`, `clock-holdover`, `conflict-resilience`, `constellation-multi-gnss-coverage`, `eo-coverage`, `fusion-pnt`, `gnss-ins`, `hybrid-pnt`, `hybrid-ukf`, `impairment-eval`, `imu-deadreckoning`, `ins-trn-coast`, `launch-window`, `leo-focus-data-services`, `leo-navmsg-encode-decode`, `leo-navmsg-fit-interval-trade`, `leo-navmsg-midpass-update`, `leo-navmsg-model-comparison`, `leo-pnt-mega-shell`, `link-budget`, `lunar-frame-realisation`, `lunar-interop-export`, `lunar-time-offset`, `maritime-port-approach-coast`, `maritime-spoof-position-push`, `quantum-anomaly-detect`, `quantum-gnss-free-nav`, `quantum-time-transfer`, `quantum-trade`, `rail-tunnel-coast`, `slot-timing-ocxo-leo`, `small-uas-jammed-nav`, `space-packet`, `space-weather`, `spoof-attack`, `sweep-nd-inertial`, `telecom-tie-ingest`, `timetransfer`.

### 4.1 Discrete outcomes that changed

Everything else that moved is a floating-point value; these are the only integer-count or
presence changes in the 141 documents:

- `europa-surface-pnt` `$.epochs[9].error_with_earth_m`: '2.8485129384731125' -> 'None'
- `lunar-joint-od-clock` `$.without_vlbi.iterations`: 2 -> 5

* `europa-surface-pnt`, epoch 9 (`t_s` = 16200): the user radius is `1560800` before and
  `1560799.9999999998` now. The epoch sits on a visibility boundary, so one Earth-range fix
  is no longer made. `availability_with_earth` 0.7192982 -> 0.7134503 (-0.81 %),
  `rms_error_with_earth_m` 86.14737 -> 86.49932 (+0.41 %). `docs/SOLAR-SYSTEM.md` publishes
  0.719 and 86.147 (and the CHANGELOG repeats them).
* `lunar-joint-od-clock`, no-VLBI solve: Gauss-Newton stops after 5 iterations, not 2. The
  case is the ill-conditioned contrast (condition number 1.4e5 at the first step): the
  stopping step is noise-limited. Published station errors move 3.541350 -> 3.536885 m with
  VLBI (relative 1.26e-3) and 2183.558 -> 2184.021 m without (2.1e-4); the ledger row for
  "Lunar joint multi-technique OD + clock" (`src/verification.rs`, `docs/VERIFICATION-MATRIX.md`,
  `web/data/verification-matrix.json`) and the CHANGELOG quote the old numbers.
* `cislunar-observability`, `rank_vs_arc[2].sigma_min`: `0.0` -> `1.1397e-09`. A singular
  value that was exactly zero is now at the round-off floor. No `rank` or threshold field
  changes (no integer field in that document moves).

### 4.2 Published numbers in prose, outside the JSON

Searching `docs/`, `paper/`, `README.md`, `CHANGELOG.md` and `src/verification.rs` for every
moved value at the precision it is printed (documents that name the scenario, at 4 to 7
significant digits, and at 3 digits for moves above 5e-4) found these printed values that
would now round differently: the three above (joint-OD station errors; Europa availability
and RMS error). Every other printed figure rounds to the same text. Phase 2 lists the sites
it edits in this file's section 7 (to be appended); no prose has been edited yet.

## 5. Pinned tests and published data that moved

All other tests in the suite pass: every bar, tolerance and oracle comparison in them
holds. The tests below fail now only because they pin exact bytes, bits or a hash.

### 5.1 Hash and checksum pins

| binary | test | pinned in | pinned (old) | now (new) |
|---|---|---|---|---|
| kshana (lib) | `cislunar_observability::tests::default_document_is_bit_for_bit_the_released_one` | `src/cislunar_observability.rs` | `16305602040937611668` | `2817052252665761312` |
| registry_golden | `golden_cislunar_observability` | `tests/registry_golden.rs` | `3220118064159656385` | `2831937838598371064` |
| cislunar_arc_recovery_reference | `the_released_observability_document_is_unchanged` | `tests/cislunar_arc_recovery_reference.rs` | `9459780657697663305` | `14410212428669190182` |
| iq_track_cn0 | `m2_m3_l1ca_45_dbhz_m2m4_is_nominal_and_nwpr_is_unchanged` | `tests/iq_track_cn0.rs` | `410895154381728301` | `7969233005772218405` |
| iq_campaign | `the_reference_digests_are_pinned` | `tests/iq_campaign.rs` | `Some("89c76e01c178ff26a6e48aa046a60ba2a0e54ec821ccc3050590a128628d5d09")` | `Some("70962ffb7a6ae4401da15070e234fcc56396886f72eb8c9ff85078b3f4fc1147")` |
| prediction_frozen | `the_frozen_predictions_reproduce` | `tests/prediction_frozen.rs` | `"d108f77ecca57902774fdb3d9f62a8b8318c8435136864736d7e630cab0d4df3"` | `"98f47ded34f8f9606f812a4f8f87c15abe31789cbbc17025f04cf77e4e8e3cb1"` |

The `iq_track_cn0` checksum is `0x05b3caf744da2a2d` -> `0x6e986732295f2025` (FNV-1a over the
bits of every NWPR estimate). `iq_campaign` stops at its first assertion (the M2M4 digest);
whether the NWPR digest `DIGEST_NWPR` also moves is not yet known and is found when the
first is re-pinned. For `tests/cislunar_arc_recovery_reference.rs` the pinned value is a
six-significant-figure canonical fingerprint of the whole `cislunar-observability`
document, and 8 numbers in that document move by more than 5e-7 (up to 6.8e-5, plus the
`sigma_min` above; section 4 gives them) — **outside the six digits that pin records**. They
are round-off-floor quantities (singular values 1e-9 to 1e-6, a 1e-12 residual), and every
rank and threshold the paper reads from them is unchanged.

### 5.2 `tests/fixtures/iq_short_golden.json` (`tests/iq_short.rs`)

| field | old (golden) | new | relative |
|---|---|---|---|
| `$.acquisition[0].statistic` | 228.0571179761247 | 228.05711797612463 | 2.49e-16 |
| `$.acquisition[1].statistic` | 219.57711226323198 | 219.5771122632321 | 5.18e-16 |
(2 of 18 numbers moved)

Wasm `iq_run_short` now equals the native string exactly, with no tolerance.

### 5.3 Published figure data: `paper/crossover/inertial.json`

The test `published_figures_still_reproduce::the_papers_crossover_studies_still_reproduce_value_for_value`
reports these, all the same quantity (`vibration_psd` at node-grid index 8 mod 9), 3 ULP:

| path in `paper/crossover/inertial.json` | old | new | relative |
|---|---|---|---|
| `.nodes[8].vibration_psd` | 0.0008655334580025007 | 0.0008655334580025004 | 2.51e-16 |
| `.nodes[17].vibration_psd` | 0.0008655334580025007 | 0.0008655334580025004 | 2.51e-16 |
| `.nodes[26].vibration_psd` | 0.0008655334580025007 | 0.0008655334580025004 | 2.51e-16 |
| `.nodes[35].vibration_psd` | 0.0008655334580025007 | 0.0008655334580025004 | 2.51e-16 |
| `.nodes[44].vibration_psd` | 0.0008655334580025007 | 0.0008655334580025004 | 2.51e-16 |
| `.nodes[53].vibration_psd` | 0.0008655334580025007 | 0.0008655334580025004 | 2.51e-16 |
| `.nodes[62].vibration_psd` | 0.0008655334580025007 | 0.0008655334580025004 | 2.51e-16 |
| `.vibration_psds[8]` | 0.0008655334580025007 | 0.0008655334580025004 | 2.51e-16 |

This is data behind a figure the paper embeds; it is a revision under R4 and gets a dated
erratum in `paper/kshana-technical-report.md` in phase 2 (no edit yet).

### 5.4 The three numpy-oracle tests

| test binary | what the first failed assertion compares | values differing | largest relative change | at |
|---|---|---|---|---|
| lunar_joint_od_numpy_oracle | engine inputs vs committed inputs.json (1e-12 relative) | 141 | 3.62e-03 | `.r_hat[12]`: 2.1972826859482318e-13 -> 2.189337652428258e-13 |
| lunar_station_numpy_oracle | engine export vs committed export (exact) | 47 | 7.56e-09 | `.eval.corrected_range_m[3]`: 0.2464931747630718 -> 0.24649317290042672 |
| lunar_observability_numpy_oracle | engine Jacobian vs committed fixture (exact) | 5 | 3.76e-07 | `[6][5]`: 79356.3723564148 -> 79356.3425540924 |

These compare the engine with fixtures committed from inputs the engine exported earlier.
The "differing" counts include values that are residuals near 1e-13 (relative changes of
1e-3 are 1e-16 absolute).

* **`lunar_joint_od_numpy_oracle` carries a VALIDATED ledger row** (section 8 (a)).
  As written the test also fails its tolerance stage: it feeds the engine's regenerated
  inputs to a comparison against numpy results computed on the *committed* inputs, so a
  1e-16 input change shows as steps of 2.5e-7 (A) to 4.6e-5 (F) against the 1e-8 bar.
  Re-exporting `inputs.json` from the new engine and re-running `make_fixture.py`
  restores the pre-registered comparison; a **dry run** of that on scratch copies (nothing
  committed or re-recorded; numpy 2.5.3 where the registration used 2.4.6) gives, against
  the unchanged bar of max(1e-8, 100 kappa eps): first Gauss-Newton step relative
  difference A 3.4e-14, B 1.5e-14, C 3.0e-14, D 3.9e-14, E 2.2e-15, F (the
  ill-conditioned network) 4.6e-11; formal sigmas A 1.9e-11, B 1.6e-11, C 2.8e-12,
  D 6.8e-12, E 1.6e-13; station error equal to 2.1e-16 relative in every network. The bar
  holds with the same margin as before (the registered text records steps 1.1e-14 to 2.4e-11
  and sigmas 1.3e-11).
* `lunar_station_numpy_oracle` and `lunar_observability_numpy_oracle` guard MODELLED rows:
  the exported inputs and results are committed and compared exactly with the engine.
  Their tolerance checks run against the committed export and numpy values, so they are
  unaffected until the export is regenerated.

### 5.5 The frozen prediction (`tests/prediction_frozen.rs`)

`docs/predictions/lunar-reference-station.region.result.json` (SHA-256
`d108f77e...cb4df3`, pinned in `tests/prediction_frozen.rs` and
`docs/predictions/lunar-reference-station.md`) no longer reproduces byte for byte; the points
file (`574dbab8...`) is not listed as failing only because the test stops at the first. The
portable-maths run, compared with the frozen results:

| frozen result | leaves moved | largest relative change | at | old | new |
|---|---|---|---|---|---|
| region | 2378 of 5970 | 2.28e-07 | `$.points[101].corrected_p_h_m` | 2656.6678432854123 | 2656.667237365753 |
| points | 122 of 403 | 4.35e-08 | `$.region.vpl_max_m` | 300215.9794325307 | 300215.96638437617 |

Both are inside the 1e-6 that the prediction record states for other platforms, no integer
or presence field moves, every figure the prediction prints (to at most four digits) is
unchanged at that precision, and the pre-registered 1 m at p95 coverage threshold is
unaffected (coverage 0.0 % before and after). **The frozen files and their hashes are not
touched.** Phase 2 stores the portable-maths re-run beside them, labelled, and pins both.

### 5.6 The 0.35.0 byte-identity guards

* `tests/skyline_scenarios.rs::every_wired_scenario_is_byte_identical_to_the_0_35_0_release`
  (baseline `tests/fixtures/skyline/flat_hashes_0.35.0.txt`; the test also carries the 0.36
  jammer-Q list `Q_TABLE_CHANGED`) reports 31 files json changed:

  `araim-gps-galileo.toml`, `gnss-sim-raim.toml`, `integrity-raim.toml`, `leo-doppler-positioning.toml`, `leo-focus-fused-pnt-sisre.toml`, `leo-focus-indoor-uhf.toml`, `leo-focus-iot-eirp.toml`, `leo-focus-science-iono-sounding.toml`, `leo-indoor-uhf.toml`, `leo-iot-energy.toml`, `leo-pass-iridium.toml`, `leo-pass-vs-gnss-cn0.toml`, `leo-pass-xona-pulsar.toml`, `leo-resilience-gnss-jammed-leo-carries.toml`, `leo-resilience-spoof-doppler.toml`, `leo-resilience-spoof-monitors.toml`, `leo-timing-utc.toml`, `leo-vertical-5g-network-timing.toml`, `leo-vertical-asset-tracking-iot.toml`, `leo-vertical-autonomous-vehicle.toml`, `leo-vertical-critical-infrastructure-timing.toml`, `leo-vertical-polar-arctic.toml`, `meo-leo-fused-pvt.toml`, `orbit-gnss-challenged.toml`, `orbit-molniya.toml`, `orbit-multignss.toml`, `orbit-real-tle.toml`, `orbit-rinex.toml`, `orbit-sgp4-gps.toml`, `polar-arctic-leo-coverage.toml`, `starlink-sop-doppler-positioning.toml`

* `tests/geometry_corpus_identity.rs`: `every_vessel_corpus_scores_as_in_0_35_0` and
  `poor_epochs_differ_from_0_35_0_by_the_geometry_deduction_alone` (the corpus hash tables,
  for example the `tallinn-helsinki.nmea` score hash `4d91b4af...` -> `6f647f3a...`, and
  the `combined-event` hash `4f6b8e44...` -> `f892f000...`).
* `tests/geometry_trust_no_change.rs`: `the_vessel_demo_outputs_are_those_of_0_35_0_apart_from_the_appended_keys`
  (`result.json (0.35 view)` `c173f350...` -> `d1258960...`) and
  `the_replayed_stream_is_that_of_0_35_0_apart_from_the_appended_keys` (excerpt document
  `204a5484...` -> `69f9f152...`, live JSON lines `0573e84c...` -> `a243ff3b...`).

How each is handled in phase 2 is in section 6.

### 5.7 Tests that fail on the unmodified branch (not this change)

`matrix_total_no_stale_count_doc_sync` (1), `scenario_count_doc_sync` (2) and
`web_validation_counts_doc_sync` (3) fail identically on `b482fb33` in a clean worktree:
the web pages state 263 matrix rows (live: 274), 75 scenario kinds (live: 76), and
"134 of 274 capabilities validated" is absent, with the Studio ledger copy stale. They are
listed here only so they are not mistaken for moves; they are not touched.

## 6. How each pin will be handled (phase 2; nothing re-recorded in this commit)

| pin | handling |
|---|---|
| `tests/skyline_scenarios.rs` + `flat_hashes_0.35.0.txt` | add `flat_hashes_0.36-portable.txt`, re-point the test at it (renamed guard name carries "0_36_portable"); keep the 0.35.0 file as the historical record; keep the Q-table list logic so the list cannot go stale |
| `tests/geometry_corpus_identity.rs`, `tests/geometry_trust_no_change.rs` | re-base the hash tables to "0.36 portable" under the same test names' intent; the 0.35.0 tables stay as a labelled historical constant with a test that they are the old values; no `#[ignore]` |
| `tests/prediction_frozen.rs` | frozen files untouched; add `*.portable.result.json` beside them, labelled; the test pins both: the frozen file by its hash as historical, the portable re-run by its hash and within 1e-6 of the frozen one; no bar changed |
| `src/cislunar_observability.rs`, `tests/registry_golden.rs`, `tests/cislunar_arc_recovery_reference.rs` | re-pin to the 0.36 portable values, each with an erratum note naming this file |
| `tests/iq_short.rs` golden, `iq_campaign` digests, `iq_track_cn0` checksum | re-record to the 0.36 portable values (the wasm smoke test then compares them exactly) |
| `paper/crossover/inertial.json` | regenerated; dated erratum in `paper/kshana-technical-report.md` and an entry in this file |
| the three numpy-oracle fixtures | re-export `inputs.json`/export, re-run the numpy scripts, record the numpy version; the joint-OD bar is unchanged and its dry-run margins are above |
| ledger/CHANGELOG/doc prose with moved numbers (section 4.2) | edited with this file's old -> new; the Studio recorded files that already hold the portable values are left as they are |
| tests and benches that still call host maths | ported to `PortableFloat` so the pins are produced through the same functions |

## 7. Phase 2: what was re-recorded (2026-10-13), old -> new

The values below are the ones section 5 listed, re-recorded through each test's own generator
path (a bless switch, an emit test, or the tool that wrote the file); the old value stays in the
code comment or in a historical fixture beside the new one. Nothing else was re-recorded, and no
bar, tolerance or threshold changed.

**Merge.** `b482fb33` (STUDIO-06) is merged into the branch; the scenario numbers above were
measured against it.

**Tests ported.** `portable_math` is now `pub` and `#[doc(hidden)]`, and `PortableFloat` is `pub`
(nothing else in the module), so the integration tests can use it. 57 test files that build engine
inputs or pin engine outputs call it (`powf`, `sin`, `cos`, `ln`, `log10`, `hypot`, ... 263 call
sites, including the scene generators of `iq_track_cn0`, `iq_campaign`, `iq_receiver` and `iq_io`).
68 test files stay on host maths on purpose, because they recompute their expected values
independently of the engine (Orekit, numpy, SOFA, astropy, ANISE, pre-registered or "reference"
comparisons, chosen by file name) and each now carries a comment saying so; they are:
`attitude_dynamics_reference.rs`, `batch_sequential_orbit_determination_reference.rs`, `body_orientation_spice_oracle.rs`, `bplane_gmat_oracle.rs`, `bplane_heliocentric_oracle.rs`, `cislunar_arc_recovery_reference.rs`, `classical_strapdown_ins_reference.rs`, `clock_library_device_cards_oracle.rs`, `clock_state_ext_igs_conditioned_oracle.rs`, `clock_state_ext_igs_fresh_oracle.rs`, `coverage_dop_full_oracle.rs`, `cw_dynamics_orekit_oracle.rs`, `deep_space_mars_radiometric_reference.rs`, `dop_reference.rs`, `earth_gnss_measured_montenbruck_oracle.rs`, `earth_orbit_path_sgp4_erfa_oracle.rs`, `fim_observability_reference.rs`, `frame_reference_vectors.rs`, `geolocation_crlb_published_oracle.rs`, `geolocation_reference.rs`, `gnss_free_quantum_navigation_reference.rs`, `gnss_ins_navego_dataset_oracle.rs`, `gps_lnav_rtklib_decode_oracle.rs`, `gps_lnav_rtklib_integer_oracle.rs`, `hetero_budget_utc_k_realised_overbound_oracle.rs`, `integrity_sbas_stanford_oracle.rs`, `joint_eop_error_bulletin_a_oracle.rs`, `joint_eop_error_iers_ar2019_oracle.rs`, `joint_pvt_dual_freq_itrf_rtklib_oracle.rs`, `joint_pvt_itrf_rtklib_oracle.rs`, `joint_pvt_precise_itrf_rtklib_oracle.rs`, `lambda_reference.rs`, `leo_link_reference.rs`, `leo_navmsg_full_claim_oracle.rs`, `leo_polar_coverage_full_claim_orekit_oracle.rs`, `leo_polar_coverage_on_path_orekit_oracle.rs`, `leo_signal_reference.rs`, `lunar_afs_decodability_pocketsdr_4bit_oracle.rs`, `lunar_afs_decodability_pocketsdr_v3_oracle.rs`, `lunar_afs_frame_coding_oracle.rs`, `lunar_afs_waveform_lans_afs_sim_oracle.rs`, `lunar_frame_campaign_mpmath_oracle.rs`, `lunar_frame_campaign_srif_mpmath_oracle.rs`, `lunar_llr_geometry_range_oracle.rs`, `lunar_pa_orientation_spice_oracle.rs`, `lunar_perturbed_scipy_reference.rs`, `lunar_rate_frame_coupling_oracle.rs`, `lunar_rate_frame_coupling_preregistered.rs`, `lunar_service_geometry_oracle.rs`, `lunar_service_volume_orekit_oracle.rs`, `lunar_station_coverage_reference.rs`, `lunar_vlbi_campaign_spice_oracle.rs`, `maritime_trust_reference.rs`, `nav_signal_betz_hein_published_oracle.rs`, `operational_eop_ls_ar_bulletin_a_oracle.rs`, `pass_predictor_apparent_orekit_oracle.rs`, `pass_predictor_on_path_orekit_oracle.rs`, `powerlaw_oadev_reference.rs`, `quantum_inertial_dead_reckoning_reference.rs`, `quantum_vs_classical_pnt_trade_reference.rs`, `skyline_orekit_oracle.rs`, `solar_system_horizons_reference.rs`, `solar_system_light_time_solver_preregistered.rs`, `solar_system_standish_earth_icrf_preregistered.rs`, `solar_system_standish_preregistered.rs`, `testbench_reference.rs`, `time_transfer_error_budgeting_reference.rs`, `wahba_reference.rs`. `examples/` (fixture generators that call the engine) are not ported. There is no
`benches/` directory.

**Byte-identity guards, re-based to the named baseline "0.36 portable".**

* `tests/skyline_scenarios.rs`: `every_wired_scenario_is_byte_identical_to_the_0_36_portable_baseline`
  compares against the new `tests/fixtures/skyline/flat_hashes_0.36-portable.txt` (written by
  `KSHANA_BLESS_SKYLINE_PORTABLE=1`, same 42 rows). 38 of the 42 rows differ from the 0.35.0 file:
  `araim-gps-galileo`, the four `campaign-*` wired scenarios, `gnss-sim-raim`, `integrity-raim`,
  `jamming-demo`, the `leo-*` scenarios (`leo-doppler-positioning`, `leo-focus-*` x4, `leo-indoor-uhf`,
  `leo-iot-energy`, `leo-pass-*` x3, `leo-resilience-*` x3, `leo-timing-utc`, `leo-vertical-*` x6),
  `maritime-strait-jamming`, `meo-leo-fused-pvt`, the six `orbit-*` scenarios, `polar-arctic-leo-coverage`
  and `starlink-sop-doppler-positioning`. The 0.35.0 file is kept unchanged as the historical record and
  pinned by its SHA-256 (`7bca2caf...143a`) in
  `the_0_35_0_baseline_is_kept_unchanged_as_the_historical_record`. The old `Q_TABLE_CHANGED` list (7
  files the 0.36 jammer-Q table changes) is gone with the 0.35.0 comparison: the Q-table change is inside
  both the 0.35.0-to-0.36 and the portable difference, and `xval/jammer-q/RESULTS.md` still lists its
  values.
* `tests/geometry_corpus_identity.rs` and `tests/geometry_trust_no_change.rs`: the tests are renamed
  `..._as_in_0_36_portable` / `..._those_of_0_36_portable_apart_from_the_appended_keys`, and the 25
  pinned hashes that moved hold the 0.36 portable values (20 corpus pins and the two split pins of
  `geometry_corpus_identity`, three in `geometry_trust_no_change`; the others did not move, for example the
  static example and the 0.36 telemetry of the vessel demo). Each old 0.35.0 hash is in
  `tests/fixtures/geometry_trust/pins_0.35.0.txt` (file, test, name, old hash), pinned by hash in
  `geometry_corpus_identity::the_0_35_0_pins_are_kept_unchanged_as_the_historical_record`.

**Other pins.**

| pin | old | new |
|---|---|---|
| `tests/fixtures/iq_short_golden.json` (`KSHANA_BLESS=1`) | statistic 228.0571179761247, 219.57711226323198 | 228.05711797612463, 219.5771122632321 (wasm equals it exactly) |
| `tests/iq_campaign.rs` `DIGEST_M2M4` | `89c76e01c178ff26a6e48aa046a60ba2a0e54ec821ccc3050590a128628d5d09` | `70962ffb7a6ae4401da15070e234fcc56396886f72eb8c9ff85078b3f4fc1147` |
| `tests/iq_campaign.rs` `DIGEST_NWPR` | `796961479aa9a4553b610422d6827dad9aa1c1a1dc45eb49e283900fd8abf9db` | unchanged (checked once the first was found) |
| `tests/iq_track_cn0.rs` `NWPR_BASELINE_CHECKSUM` | `0x05b3caf744da2a2d` | `0x1e19e42071eec6ad` (the scene generator of the test is on portable maths too, so this differs from the engine-only value `0x6e986732295f2025` of section 5.1) |
| `src/cislunar_observability.rs` whole-document JSON FNV | `0xe24922aa5af88194` | `0x27182e1931db4e20` |
| same, document without its `units` block | `0x2207bc7206062c80` | `0x2d739cd81d4b369c` |
| same, summary, SVG, SVG without paint | `0x7030ab727e57edbc`, `0xf0924c32d8119a18`, `0x1c8982ef1fd0462f` | unchanged (only the JSON moves) |
| `tests/registry_golden.rs` `cislunar-observability` canonical FNV | `0x2cb02851850e09c1` | `0x274d1075bfa4b6f8` |
| `tests/cislunar_arc_recovery_reference.rs` canonical fingerprint | 9_459_780_657_697_663_305 | 14_410_212_428_669_190_182 |
| `paper/crossover/inertial.json` | eight `vibration_psd` = 0.0008655334580025007, `engine_version` 0.20.0 | 0.0008655334580025004 (2.5e-16 relative), `engine_version` 0.35.0; regenerated with `crossover_study`; `clock.json` and the rendered figures untouched |

The cislunar-observability hashes carry the erratum for the released document: the document moved
only in round-off-floor quantities (section 5.1); the dated erratum is in
`paper/kshana-technical-report.md`, section "Erratum, 13 October 2026".

**Frozen prediction.** `docs/predictions/lunar-reference-station.{{region,points}}.result.json` and their
hashes are untouched. The portable re-runs are stored beside them as
`...{{region,points}}.portable-0.36.json` (SHA-256 `98f47ded...cb3`, `766c2c7a...d330`).
`tests/prediction_frozen.rs` now has two tests: the frozen bytes have not moved (the guard keeps its
meaning), and the portable re-run is byte-identical on every platform and within a relative 1e-6 of the
frozen result. `docs/predictions/lunar-reference-station.md` gains a labelled section; its frozen table
is not edited.

**Published prose with a moved number (old -> new).**

* `docs/SOLAR-SYSTEM.md` (Europa column and text): availability with the Earth range 0.719 -> 0.713
  (twice), RMS fix error with the Earth range 86.147 -> 86.499 m; the paragraph about the platform that
  flipped one epoch (0.725 / 85.800 m on macOS arm64) now says the epoch resolves one way everywhere.
* `src/verification.rs`, ledger row "Lunar joint multi-technique OD + clock" (and its generated copies
  `docs/VERIFICATION-MATRIX.md` and `web/data/verification-matrix.json`): 0.36 revision appended:
  station error 3.541350 -> 3.536885 m with VLBI, 2183.558 -> 2184.021 m without, no-VLBI iterations
  2 -> 5. The generated files were produced by `cargo run --bin gen_validation_artifacts`; that
  generator also rewrote the `fixture` link of the geometry-trust row in the web ledger JSON because
  `tests/fixtures/geometry_trust/` now exists. No other file under `web/` was touched.
* `CHANGELOG.md`: an entry under Unreleased/Changed lists all of the above. The 0.30 and 0.35 entries
  that quote the old numbers are history and are not edited.

**`tests/lunar_joint_od_numpy_oracle.rs`** (the VALIDATED "Lunar joint multi-technique OD + clock" row) was held and is now re-recorded after the owner's approval, with numpy pinned to 2.4.6, the script and the bar unchanged: all six networks pass; see [`STUDIO15-lunar-joint-od-oracle-rerecord.md`](STUDIO15-lunar-joint-od-oracle-rerecord.md) (old and new hashes of the fixtures, per-network margins).

**The other two numpy-oracle tests** (`lunar_observability_numpy_oracle`, `lunar_station_numpy_oracle`, MODELLED rows) were held and are now re-recorded after owner approval, with numpy/scipy at the registered versions and scripts and bars unchanged; the station test's recorded finding moves from 15 to 20 of 20 cases above 1e-9 m and `RANGE_OBSERVED_M` 3.7252974e-9 -> 3.7252903e-9 m. Old and new fixture hashes and per-case margins: [`STUDIO15-lunar-station-observability-oracles.md`](STUDIO15-lunar-station-observability-oracles.md).

**Parity.** The final native-versus-wasm result is in the phase 2 report.

## 8. Findings the owner should read before approving the re-recording

**(a) VALIDATED ledger rows whose evidence test is in the moved set** (two):

1. "Azimuth-dependent skyline mask..." cites `tests/skyline_scenarios.rs` (the byte-identity
   guard) beside `tests/skyline_orekit_oracle.rs`. The Orekit/gnss_lib_py comparison, whose
   tolerances are the validated claim (1e-9 degree, 1e-9 relative), passes unchanged.
   **Verdict and bar status: unchanged.**
2. "Lunar joint multi-technique OD + clock" cites
   `tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy`.
   **As the test stands it fails; with its fixtures re-exported and numpy re-run it passes
   at the unchanged bar with the margins in section 5.4.** The verdict therefore stays
   VALIDATED only if the oracle is re-run (the pre-registered 2.4.6 numpy is replaced by
   2.5.3 in the dry run); the ledger text quoting the old station errors changes.

The other moved pins belong to MODELLED rows (geometry trust, cislunar observability and
arc recovery, lunar observability, lunar station coverage). Every other test that backs a
VALIDATED row passes; observed-worst figures that rows quote in prose (for example the
skyline row's 1.3e-13 degree) were measured with the old maths and will be re-measured.

**(c) Not inside a recorded tolerance:** the six-significant-figure fingerprint of the
released cislunar-observability document (section 5.1); the 20-35 % moves of the
`noise_free_worst_ratio` round-off ratios of `cislunar-arc-recovery` (values 1e-6 to 1e-4,
published thresholds and ranks unchanged); the Europa boundary epoch and its published
0.719 / 86.147 (section 4.1); the joint-OD no-VLBI iteration count 2 -> 5 and the two
published station errors; the joint-OD numpy comparison as written (section 5.4).
Everything else moved by 5e-3 or less, and 43 of the 141 scenarios did not move at all.
