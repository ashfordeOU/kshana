// SPDX-License-Identifier: AGPL-3.0-only
//! The units-and-provenance table of the `leo-navmsg` report: one row per numeric field,
//! with its unit, its provenance class and a one-line definition.
//!
//! A declarative catalog and nothing else. It lives in its own file so that the
//! copy-paste detector's exemption for catalogs (`sonar.cpd.exclusions`) covers the table
//! and no logic.

/// The ten SISRE statistics fields every fit summary carries (`fit_interval_trade.rows[]`,
/// `fit_interval_trade.update_period_rows[]`, `model_comparison.rows[].stats` and
/// `encode_decode.sequence_stats`), under the summary's path prefix. Only the definition
/// of the orbit-only RMS differs between the four, so it is the second argument.
macro_rules! sisre_stats_units {
    ($prefix:literal, $orb_rms_definition:literal) => {
        [
            (
                concat!($prefix, ".n"),
                "count",
                "computed",
                "epochs evaluated",
            ),
            (
                concat!($prefix, ".sisre_orb_rms_m"),
                "m",
                "computed",
                $orb_rms_definition,
            ),
            (
                concat!($prefix, ".sisre_orb_max_m"),
                "m",
                "computed",
                "largest orbit-only SISRE",
            ),
            (
                concat!($prefix, ".sisre_rms_m"),
                "m",
                "computed",
                "RMS SISRE with the clock",
            ),
            (
                concat!($prefix, ".sisre_max_m"),
                "m",
                "computed",
                "largest SISRE with the clock",
            ),
            (
                concat!($prefix, ".radial_rms_m"),
                "m",
                "computed",
                "RMS radial error",
            ),
            (
                concat!($prefix, ".along_rms_m"),
                "m",
                "computed",
                "RMS along-track error",
            ),
            (
                concat!($prefix, ".cross_rms_m"),
                "m",
                "computed",
                "RMS cross-track error",
            ),
            (
                concat!($prefix, ".clock_rms_m"),
                "m",
                "computed",
                "RMS clock error times c",
            ),
            (
                concat!($prefix, ".pos3d_max_m"),
                "m",
                "computed",
                "largest 3D position error",
            ),
        ]
    };
}

/// Literal rows, part 1 of the table, from `orbit.altitude_m`.
const PART_1: &[(&str, &str, &str, &str)] = &[
    (
        "orbit.altitude_m",
        "m",
        "input",
        "altitude of the initial semi-major axis above the WGS 84 equatorial radius",
    ),
    ("orbit.inclination_deg", "deg", "input", "orbit inclination"),
    ("orbit.eccentricity", "1", "input", "initial eccentricity"),
    (
        "orbit.period_s",
        "s",
        "closed-form",
        "two-body period of the initial semi-major axis",
    ),
    (
        "orbit.gravity_degree",
        "count",
        "input",
        "gravity field degree of the truth integration",
    ),
    (
        "orbit.cd_area_over_mass_m2_kg",
        "m^2/kg",
        "input",
        "drag ballistic term C_D A/m",
    ),
    (
        "orbit.epoch_week",
        "week",
        "input",
        "epoch week number (GPS origin)",
    ),
    ("orbit.epoch_tow_s", "s", "input", "epoch time of week"),
    (
        "sisre_weights.w_r",
        "1",
        "computed",
        "global-average radial SISRE weight",
    ),
    (
        "sisre_weights.w_ac2",
        "1",
        "computed",
        "global-average squared along/cross-track SISRE weight",
    ),
    (
        "sisre_weights.inverse_w_ac2",
        "1",
        "computed",
        "reciprocal of w_ac2, the form the published table uses",
    ),
    (
        "sisre_weights.max_nadir_deg",
        "deg",
        "closed-form",
        "nadir angle of a user at the elevation mask",
    ),
    (
        "sisre_weights.mask_deg",
        "deg",
        "input",
        "user elevation mask of the SISRE average",
    ),
    (
        "message_config.rac_degrees[]",
        "count",
        "input",
        "correction polynomial degrees along, cross, radial",
    ),
    (
        "message_config.poly_degree",
        "count",
        "input",
        "ECEF polynomial degree",
    ),
    (
        "message_config.fit_interval_s",
        "s",
        "input",
        "fit interval of each message",
    ),
    (
        "message_config.update_period_s",
        "s",
        "input",
        "message update period",
    ),
    (
        "message_config.carrier_hz",
        "Hz",
        "input",
        "carrier the ionospheric service is scaled to",
    ),
    (
        "preset.altitude_km",
        "km",
        "spec",
        "preset orbit altitude from its cited source",
    ),
    (
        "preset.inclination_deg",
        "deg",
        "spec",
        "preset orbit inclination from its cited source",
    ),
    (
        "preset.carrier_hz",
        "Hz",
        "spec",
        "preset carrier from its cited source",
    ),
    (
        "preset.message.rac_degrees[]",
        "count",
        "spec",
        "preset correction polynomial degrees",
    ),
    (
        "preset.message.poly_degree",
        "count",
        "spec",
        "preset ECEF polynomial degree",
    ),
    (
        "preset.message.fit_interval_s",
        "s",
        "spec",
        "preset fit interval",
    ),
    (
        "preset.message.update_period_s",
        "s",
        "spec",
        "preset update period",
    ),
    (
        "preset.message.steered_sigma_m",
        "m",
        "spec",
        "preset steering residual of a zero-clock satellite",
    ),
    // Trade rows (shared shape).
    (
        "fit_interval_trade.span_s",
        "s",
        "input",
        "span of usage periods evaluated",
    ),
    (
        "fit_interval_trade.rows[].fit_interval_s",
        "s",
        "input",
        "fit interval",
    ),
    (
        "fit_interval_trade.rows[].update_period_s",
        "s",
        "input",
        "usage period of each message",
    ),
    (
        "fit_interval_trade.rows[].n_messages",
        "count",
        "computed",
        "messages fitted",
    ),
];

/// Literal rows, part 2 of the table, from `fit_interval_trade.update_period_rows[].fit_interval_s`.
const PART_2: &[(&str, &str, &str, &str)] = &[
    (
        "fit_interval_trade.update_period_rows[].fit_interval_s",
        "s",
        "input",
        "fit interval",
    ),
    (
        "fit_interval_trade.update_period_rows[].update_period_s",
        "s",
        "input",
        "update period",
    ),
    (
        "fit_interval_trade.update_period_rows[].n_messages",
        "count",
        "computed",
        "messages fitted",
    ),
];

/// Literal rows, part 3 of the table, from `model_comparison.span_s`.
const PART_3: &[(&str, &str, &str, &str)] = &[
    // Model comparison.
    (
        "model_comparison.span_s",
        "s",
        "input",
        "span evaluated per model",
    ),
    (
        "model_comparison.rows[].fit_interval_s",
        "s",
        "input",
        "fit interval",
    ),
    (
        "model_comparison.rows[].n_parameters",
        "count",
        "computed",
        "ephemeris parameters transmitted",
    ),
    (
        "model_comparison.rows[].ephemeris_clock_bits",
        "bit",
        "computed",
        "bits of ephemeris and clock in Kshana's encoding",
    ),
    (
        "model_comparison.rows[].n_messages",
        "count",
        "computed",
        "messages fitted",
    ),
];

/// Literal rows, part 4 of the table, from `model_comparison.liu2025_altitude_table.arc_s`.
const PART_4: &[(&str, &str, &str, &str)] = &[
    (
        "model_comparison.liu2025_altitude_table.arc_s",
        "s",
        "published",
        "fit arc of the published comparison (20 minutes)",
    ),
    (
        "model_comparison.liu2025_altitude_table.arcs_per_altitude",
        "count",
        "input",
        "arcs fitted per altitude",
    ),
    (
        "model_comparison.liu2025_altitude_table.rows[].altitude_km",
        "km",
        "published",
        "satellite altitude as published",
    ),
    (
        "model_comparison.liu2025_altitude_table.rows[].inclination_deg",
        "deg",
        "spec",
        "inclination of the named satellite",
    ),
    (
        "model_comparison.liu2025_altitude_table.rows[].published_sisre_m",
        "m",
        "published",
        "Liu et al. 2025 SISRE of the 22-parameter model",
    ),
    (
        "model_comparison.liu2025_altitude_table.rows[].kshana_sisre_orb_rms_m",
        "m",
        "modelled",
        "Kshana's orbit-only SISRE of its own 22-parameter fit",
    ),
    (
        "model_comparison.liu2025_altitude_table.rows[].ratio",
        "1",
        "computed",
        "Kshana over published",
    ),
    (
        "model_comparison.liu2025_altitude_table.rows[].w_r",
        "1",
        "computed",
        "radial SISRE weight at that altitude",
    ),
    (
        "model_comparison.liu2025_altitude_table.rows[].w_ac2",
        "1",
        "computed",
        "squared transverse SISRE weight at that altitude",
    ),
    // Mid-pass.
    (
        "midpass_update.user.lat_deg",
        "deg",
        "input",
        "user geodetic latitude",
    ),
    (
        "midpass_update.user.lon_deg",
        "deg",
        "input",
        "user longitude",
    ),
    (
        "midpass_update.user.mask_deg",
        "deg",
        "input",
        "pass elevation mask",
    ),
    (
        "midpass_update.pass.start_s",
        "s",
        "computed",
        "pass start after the analysis origin",
    ),
    (
        "midpass_update.pass.end_s",
        "s",
        "computed",
        "pass end after the analysis origin",
    ),
    (
        "midpass_update.pass.max_elevation_deg",
        "deg",
        "computed",
        "largest elevation in the pass",
    ),
    (
        "midpass_update.fit_interval_s",
        "s",
        "input",
        "fit interval",
    ),
    (
        "midpass_update.update_period_s",
        "s",
        "input",
        "update period",
    ),
    (
        "midpass_update.switches[].t_s",
        "s",
        "computed",
        "switch time after the analysis origin",
    ),
    (
        "midpass_update.switches[].elevation_deg",
        "deg",
        "computed",
        "elevation at the switch",
    ),
    (
        "midpass_update.switches[].iod_old",
        "count",
        "computed",
        "issue of data of the outgoing message",
    ),
    (
        "midpass_update.switches[].iod_new",
        "count",
        "computed",
        "issue of data of the incoming message",
    ),
    (
        "midpass_update.switches[].pos_jump_m",
        "m",
        "computed",
        "3D position difference new minus old at the switch",
    ),
    (
        "midpass_update.switches[].clock_jump_m",
        "m",
        "computed",
        "clock difference new minus old times c",
    ),
    (
        "midpass_update.switches[].range_jump_m",
        "m",
        "computed",
        "user pseudorange difference new minus old",
    ),
    (
        "midpass_update.switches[].worst_case_range_jump_m",
        "m",
        "computed",
        "largest range jump over any visible line of sight",
    ),
    (
        "midpass_update.switches[].range_error_before_m",
        "m",
        "computed",
        "old message range minus truth at the switch",
    ),
    (
        "midpass_update.switches[].range_error_after_m",
        "m",
        "computed",
        "new message range minus truth at the switch",
    ),
    (
        "midpass_update.range_error_series[].t_s",
        "s",
        "computed",
        "time after the analysis origin",
    ),
    (
        "midpass_update.range_error_series[].iod",
        "count",
        "computed",
        "issue of data of the current message",
    ),
    (
        "midpass_update.range_error_series[].range_error_m",
        "m",
        "computed",
        "message range minus truth for the user",
    ),
    (
        "midpass_update.max_range_jump_m",
        "m",
        "computed",
        "largest user range jump at a switch",
    ),
    (
        "midpass_update.max_worst_case_range_jump_m",
        "m",
        "computed",
        "largest worst-geometry range jump",
    ),
    (
        "midpass_update.threshold_m",
        "m",
        "input",
        "continuity threshold",
    ),
    // Encode-decode.
    (
        "encode_decode.frame_bytes",
        "byte",
        "computed",
        "encoded frame length",
    ),
    (
        "encode_decode.payload_bits",
        "bit",
        "computed",
        "payload bits before padding",
    ),
    (
        "encode_decode.ephemeris_clock_bits",
        "bit",
        "computed",
        "ephemeris and clock bits",
    ),
    (
        "encode_decode.round_trip_max_pos_m",
        "m",
        "computed",
        "largest position difference decoded minus exact",
    ),
    (
        "encode_decode.quantised_max_pos_m",
        "m",
        "computed",
        "largest position change from quantisation over the usage period",
    ),
    (
        "encode_decode.quantised_max_clock_m",
        "m",
        "computed",
        "largest clock change from quantisation times c",
    ),
    (
        "encode_decode.sisre_exact_rms_m",
        "m",
        "computed",
        "RMS SISRE of the exact first message over its usage period",
    ),
    (
        "encode_decode.sisre_quantised_rms_m",
        "m",
        "computed",
        "RMS SISRE of the decoded first message",
    ),
    (
        "encode_decode.rinex_round_trip_max_pos_m",
        "m",
        "internal-consistency",
        "largest position difference after RINEX-style export and import",
    ),
    (
        "encode_decode.rinex_round_trip_max_clock_m",
        "m",
        "internal-consistency",
        "largest clock difference after RINEX-style export and import",
    ),
    (
        "encode_decode.csv_round_trip_max_pos_m",
        "m",
        "internal-consistency",
        "largest position difference after CSV export and import",
    ),
    (
        "encode_decode.field_table[].fields[].bits",
        "bit",
        "spec",
        "field width in Kshana's encoding",
    ),
    (
        "encode_decode.field_table[].fields[].lsb",
        "per unit",
        "spec",
        "field step in its stated unit",
    ),
    (
        "encode_decode.quantisation_budget[].bits",
        "bit",
        "spec",
        "field width",
    ),
    (
        "encode_decode.quantisation_budget[].lsb",
        "per unit",
        "spec",
        "field step in its stated unit",
    ),
    (
        "encode_decode.quantisation_budget[].half_lsb_pos_m",
        "m",
        "computed",
        "largest position change from a half-step change of the field",
    ),
    (
        "encode_decode.quantisation_budget[].half_lsb_clock_m",
        "m",
        "computed",
        "largest clock change times c from a half-step change of the field",
    ),
];

/// Literal rows, part 5 of the table, from `encode_decode.messages[].svid`.
const PART_5: &[(&str, &str, &str, &str)] = &[
    (
        "encode_decode.messages[].svid",
        "count",
        "input",
        "space-vehicle identifier",
    ),
    (
        "encode_decode.messages[].iod",
        "count",
        "computed",
        "issue of data",
    ),
    (
        "encode_decode.messages[].band",
        "count",
        "input",
        "band identifier",
    ),
    (
        "encode_decode.messages[].health",
        "count",
        "input",
        "signal health status",
    ),
    (
        "encode_decode.messages[].week",
        "week",
        "computed",
        "message week",
    ),
    (
        "encode_decode.messages[].tow",
        "s",
        "computed",
        "transmission time of week",
    ),
    (
        "encode_decode.messages[].clock.toc",
        "s",
        "computed",
        "clock reference time of week",
    ),
    (
        "encode_decode.messages[].clock.af0",
        "s",
        "computed",
        "clock bias",
    ),
    (
        "encode_decode.messages[].clock.af1",
        "s/s",
        "computed",
        "clock drift",
    ),
    (
        "encode_decode.messages[].clock.af2",
        "s/s^2",
        "computed",
        "clock drift rate",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.sqrt_a",
        "m^0.5",
        "computed",
        "square root of the semi-major axis",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.e",
        "1",
        "computed",
        "eccentricity",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.i0",
        "rad",
        "computed",
        "inclination at toe",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.omega0",
        "rad",
        "computed",
        "node longitude at the weekly epoch",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.omega",
        "rad",
        "computed",
        "argument of perigee",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.m0",
        "rad",
        "computed",
        "mean anomaly at toe",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.delta_n",
        "rad/s",
        "computed",
        "mean-motion difference",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.omega_dot",
        "rad/s",
        "computed",
        "node rate",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.i_dot",
        "rad/s",
        "computed",
        "inclination rate",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.cuc",
        "rad",
        "computed",
        "argument-of-latitude cosine harmonic",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.cus",
        "rad",
        "computed",
        "argument-of-latitude sine harmonic",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.crc",
        "m",
        "computed",
        "radius cosine harmonic",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.crs",
        "m",
        "computed",
        "radius sine harmonic",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.cic",
        "rad",
        "computed",
        "inclination cosine harmonic",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.cis",
        "rad",
        "computed",
        "inclination sine harmonic",
    ),
    (
        "encode_decode.messages[].ephemeris.kepler.toe",
        "s",
        "computed",
        "ephemeris reference time of week",
    ),
    (
        "encode_decode.messages[].ephemeris.rac.tau_s",
        "s",
        "computed",
        "time scale of the correction polynomials: the power of two at or above half the fit interval",
    ),
    (
        "encode_decode.messages[].ephemeris.rac.along[]",
        "m",
        "computed",
        "along-track correction coefficients in tau = tk/tau_s",
    ),
    (
        "encode_decode.messages[].ephemeris.rac.cross[]",
        "m",
        "computed",
        "cross-track correction coefficients",
    ),
    (
        "encode_decode.messages[].ephemeris.rac.radial[]",
        "m",
        "computed",
        "radial correction coefficients",
    ),
    (
        "encode_decode.messages[].ephemeris.extra.a_dot",
        "m/s",
        "computed",
        "semi-major-axis rate",
    ),
    (
        "encode_decode.messages[].ephemeris.extra.n_dot",
        "rad/s^2",
        "computed",
        "mean-motion rate",
    ),
    (
        "encode_decode.messages[].ephemeris.extra.crs3",
        "m",
        "computed",
        "radius sine harmonic, three per revolution",
    ),
    (
        "encode_decode.messages[].ephemeris.extra.crc3",
        "m",
        "computed",
        "radius cosine harmonic, three per revolution",
    ),
    (
        "encode_decode.messages[].ephemeris.extra.crs1",
        "m",
        "computed",
        "radius sine harmonic, once per revolution",
    ),
    (
        "encode_decode.messages[].ephemeris.extra.crc1",
        "m",
        "computed",
        "radius cosine harmonic, once per revolution",
    ),
    (
        "encode_decode.messages[].ephemeris.poly.t_ref",
        "s",
        "computed",
        "polynomial reference time of week",
    ),
    (
        "encode_decode.messages[].ephemeris.poly.coeffs[][]",
        "m",
        "computed",
        "ECEF polynomial coefficients in tau = dt/64 s",
    ),
    (
        "encode_decode.messages[].services.klobuchar.alpha[]",
        "s/semicircle^n",
        "modelled-input",
        "Klobuchar amplitude coefficients",
    ),
    (
        "encode_decode.messages[].services.klobuchar.beta[]",
        "s/semicircle^n",
        "modelled-input",
        "Klobuchar period coefficients",
    ),
    (
        "encode_decode.messages[].services.nequick.ai0",
        "sfu",
        "modelled-input",
        "NeQuick-G ai0",
    ),
    (
        "encode_decode.messages[].services.nequick.ai1",
        "sfu/deg",
        "modelled-input",
        "NeQuick-G ai1",
    ),
    (
        "encode_decode.messages[].services.nequick.ai2",
        "sfu/deg^2",
        "modelled-input",
        "NeQuick-G ai2",
    ),
    (
        "encode_decode.messages[].services.utc.a0",
        "s",
        "modelled-input",
        "UTC offset constant term",
    ),
    (
        "encode_decode.messages[].services.utc.a1",
        "s/s",
        "modelled-input",
        "UTC offset rate term",
    ),
    (
        "encode_decode.messages[].services.utc.dt_ls",
        "s",
        "modelled-input",
        "leap seconds before the event",
    ),
    (
        "encode_decode.messages[].services.utc.t_ot",
        "s",
        "modelled-input",
        "UTC data reference time of week",
    ),
    (
        "encode_decode.messages[].services.utc.wn_ot",
        "week",
        "modelled-input",
        "UTC data reference week",
    ),
    (
        "encode_decode.messages[].services.utc.wn_lsf",
        "week",
        "modelled-input",
        "week of the next leap-second event",
    ),
    (
        "encode_decode.messages[].services.utc.dn",
        "day",
        "modelled-input",
        "day of the leap-second event",
    ),
    (
        "encode_decode.messages[].services.utc.dt_lsf",
        "s",
        "modelled-input",
        "leap seconds after the event",
    ),
];

/// The units table, in the order the units block emits it: literal rows interleaved with
/// the shared SISRE statistics groups.
pub(super) const UNITS: &[&[(&str, &str, &str, &str)]] = &[
    PART_1,
    &sisre_stats_units!(
        "fit_interval_trade.rows[]",
        "RMS orbit-only SISRE over the usage periods"
    ),
    PART_2,
    &sisre_stats_units!(
        "fit_interval_trade.update_period_rows[]",
        "RMS orbit-only SISRE"
    ),
    PART_3,
    &sisre_stats_units!("model_comparison.rows[].stats", "RMS orbit-only SISRE"),
    PART_4,
    &sisre_stats_units!(
        "encode_decode.sequence_stats",
        "RMS orbit-only SISRE of the sequence"
    ),
    PART_5,
];
